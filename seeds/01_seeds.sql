INSERT INTO users (name, email, password)
VALUES ('Tammy', 'tammy@do.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Tony', 'tony@le.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Chloe', 'chloe@le.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Evelynn', 'evelynn@le.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Penelope', 'penelope@le.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');

INSERT INTO properties (owner_id, title, description, thumbnail_photo_url, cover_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, country, street, city, province, post_code, active)
VALUES (1, 'Capri', 'Description', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Funsplash.com%2Fimages%2Fthings%2Fbook&psig=AOvVaw0r_b86K9ZVaGIeLFBMdvtW&ust=1634316175881000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCNCHhq2syvMCFQAAAAAdAAAAABAD', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Funsplash.com%2Fimages%2Fthings%2Fbook&psig=AOvVaw0r_b86K9ZVaGIeLFBMdvtW&ust=1634316175881000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCNCHhq2syvMCFQAAAAAdAAAAABAD', 5000, 1, 1, 2, 'Canada', 'Capri', 'Etobicoke', 'ON', 'M6B6B9', false),
(2, 'Rexwood', 'Description', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2Fview&psig=AOvVaw0r_b86K9ZVaGIeLFBMdvtW&ust=1634316175881000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCNCHhq2syvMCFQAAAAAdAAAAABAJ', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2Fview&psig=AOvVaw0r_b86K9ZVaGIeLFBMdvtW&ust=1634316175881000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCNCHhq2syvMCFQAAAAAdAAAAABAJ', 1000, 1, 1, 3, 'Canada', 'Rexwood', 'Mississauga', 'ON', 'L4T4J9', true),
(3, 'BETHUNE', 'Description', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.dreamstime.com%2Fphotos-images%2Flove.html&psig=AOvVaw0r_b86K9ZVaGIeLFBMdvtW&ust=1634316175881000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCNCHhq2syvMCFQAAAAAdAAAAABAP', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.dreamstime.com%2Fphotos-images%2Flove.html&psig=AOvVaw0r_b86K9ZVaGIeLFBMdvtW&ust=1634316175881000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCNCHhq2syvMCFQAAAAAdAAAAABAP', 3000, 6, 4, 4, 'Canada', 'Bethune', 'Mississauga', 'ON', 'L5L4P9', true);


INSERT INTO reservations (guest_id, property_id, start_date, end_date)
VALUES (3, 3, '2017-10-18', '2017-10-22'),
(4, 2, '2019-05-21', '2019-05-24'),
(5, 2, '2021-03-08', '2021-03-10');

INSERT INTO property_reviews (guest_id, property_id, reservation_id, rating, message)
VALUES (3, 3, 1, 3, 'Message'),
(4, 2, 2, 10, 'Message'),
(5, 2, 3, 8, 'Message');