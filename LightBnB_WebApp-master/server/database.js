const properties = require('./json/properties.json');
const users = require('./json/users.json');
const { Pool } = require('pg');

const pool = new Pool({
	user: "labber",
	password: "labber",
	host: "localhost",
	database: "lightbnb",
	port: 5432,
});

/// Users

/**
 * Get a single user from the database given their email.
 * @param {String} email The email of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithEmail = function(email) {

  return pool

  .query( `SELECT * 
  FROM users
  WHERE users.email = $1;
  `
  )
  .then((result) => {
    if (result) {
      return result
    } return null
  })
  .catch((err) => {
    console.log(err.message);
  });
}
exports.getUserWithEmail = getUserWithEmail;

/**
 * Get a single user from the database given their id.
 * @param {string} id The id of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithId = function(id) {
  return pool

  .query( `SELECT * 
  FROM users
  WHERE users.name = $1;
  `
  )
  .then((result) => {
    if (result) {
      return result
    } return null
  })
  .catch((err) => {
    console.log(err.message);
  });
}
exports.getUserWithId = getUserWithId;


/**
 * Add a new user to the database.
 * @param {{name: string, password: string, email: string}} user
 * @return {Promise<{}>} A promise to the user.
 */
const addUser =  function(user) {
  return pool

  .query( `INSERT INTO users(name, email, password)
  VALUES ($1, $2, $3)
  RETURNING *
  ;`, [user.name, user.email, user.password]
  )
  .then((result) => {
    result.rows
  })
  .catch((err) => {
    console.log(err.message);
  });
}
exports.addUser = addUser;

/// Reservations

/**
 * Get all reservations for a single user.
 * @param {string} guest_id The id of the user.
 * @return {Promise<[{}]>} A promise to the reservations.
 */
const getAllReservations = function(guest_id, limit = 10) {
  return pool

  .query( ` SELECT
  properties.id AS id,
  title,
  cost_per_night,
  start_date,
  end_date,
  avg(rating) as rating,
  cover_photo_url,
  thumbnail_photo_url
FROM reservations
JOIN properties ON reservations.property_id = properties.id
JOIN property_reviews ON property_reviews.property_id = properties.id
WHERE end_date < NOW()::DATE AND
  reservations.guest_id = $1
GROUP BY properties.id, reservations.id
ORDER BY reservations.start_date
limit 10;
  `
  )
  .then((result) => {
      result.rows
  })
  .catch((err) => {
    console.log(err.message);
  });
}
exports.getAllReservations = getAllReservations;

/// Properties

/**
 * Get all properties.
 * @param {{}} options An object containing query options.
 * @param {*} limit The number of results to return.
 * @return {Promise<[{}]>}  A promise to the properties.
 */

const getAllProperties = (options, limit = 10) => {
  return pool

  .query(`SELECT * 
  FROM properties 
  LIMIT $1`, [limit])

  .then((result) => {
    console.log(result.rows);
    return result.rows;
  })
  .catch((err) => {
    console.log(err.message);
  });
};

exports.getAllProperties = getAllProperties;

/**
 * Add a property to the database
 * @param {{}} property An object containing all of the property details.
 * @return {Promise<{}>} A promise to the property.
 */
const addProperty = function(property) {
  const propertyId = Object.keys(properties).length + 1;
  property.id = propertyId;
  properties[propertyId] = property;
  return Promise.resolve(property);
}
exports.addProperty = addProperty;
