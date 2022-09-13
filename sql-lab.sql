-- Features --
-- users can sign into the app with their email and password
-- users can create recipes with ingredients and instructions
-- recipes can be marked as public or private
-- users can view other people’s recipes
-- ingredients from recipes can be added to user’s grocery lists
-- users can create their own occasions and assign recipes to occasions

-- STEP 1 - Brainstorming--
-- MVP:
-- users can sign into the app with their email and password
-- users can create recipes with ingredients and instructions
-- users can view other people’s recipes
-- ingredients from recipes can be added to user’s grocery lists

TABLES
user, user info (id, username, email, password)
ingredients, (id, name, store userid)
post_recipe, (id, name, instructions (text), store userid, ingredients id)
sharing, (association id, user id, recipe id)
grocery_list, (id, ref ingredients id, user id)

--STEP 1--Relationships
ingredients, userid - Relationship: many to many, many users can have many ingredients saved.
post_recipe, userid - Relationship: many to many, multiple users can have multiple recipes. ingredientsid - Relationship: one to many, multiple ingredients can be in a recipe, but you cant have a recipe in multiple ingredients
sharing, user id - recipe id - Relationship: many to many (association), multiple users connect to multiple recipes, to view, to post etc.
grocery_list, ingredients id - user id Relationship: many to many(association), multiple ingredients are used/saved/created by multiple users

--STEP 2--Columns
users
    - user_id - integer, need to save user ids to reference and increment with new users being added. integer so that it can increment
    - username - varchar(30) so that they cant do a huge username but they can be individually identified
    -email - varchar(50) enough characters for a full email to be stored but not so much to bog down the db
    -password - varchar(30) serves as an extra limit to the number of characters, so hash isnt gigantic

ingredients
    - ingredient_id - integer so it will increment and server as primary key for entries
    - ingredient_name - varchar(30) users can name their ingredients
    - user_id - integer - used exclusively to link to user TABLES

recipes
    - post_recipe_id - integer for increment and primary key
    - user_id - integer to link to user TABLES
    -ingredient_id - integer to link to ingredient table
    -recipe_name - varchar(30) so users can name their recipes and be quickly referenced or searched for
    -instructions - text - so users are not limited on longer instructions if needed

sharing - these are association tables for user and recipes

grocerylist - these are association tables for user and ingredients

--PART 3-- CREATE TABLES
CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  username VARCHAR(30) NOT NULL,
  email VARCHAR(50) NOT NULL,
  password VARCHAR(30) NOT NULL
  );
  
CREATE TABLE ingredients (
  ingredient_id SERIAL PRIMARY KEY,
  ingredient_name VARCHAR(30) NOT NULL,
  user_id INTEGER REFERENCES users(user_id)
  );
  
  CREATE TABLE recipes (
    post_recipe_id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(user_id),
    ingredient_id INTEGER REFERENCES ingredients(ingredient_id),
    recipe_name VARCHAR(30) NOT NULL,
    instructions TEXT
    );

CREATE TABLE sharing (
sharing_id SERIAL PRIMARY KEY, 
  user_id INTEGER REFERENCES users(user_id),
  post_recipe_id INTEGER REFERENCES recipes(post_recipe_id)
);

CREATE TABLE grocery_list (
  grocery_id SERIAL PRIMARY KEY,
  ingredient_id INTEGER REFERENCES ingredients(ingredient_id),
  user_id INTEGER REFERENCES users(user_id)
  );


--INTERMEDIATE--

INSERT INTO users(username, email, password)
VALUES ('bigtay', 'bigt@gmail.com', '123'),
('bbrain', 'b-brian@email.com', '456'),
('d-train', 'derek@email.com', '789');

SELECT * FROM users;

INSERT INTO ingredients (ingredient_name)
VALUES ('carrots'), ('steak'), ('worchestershire sauce'), ('potatoes');

SELECT * FROM ingredients;

INSERT INTO recipes (recipe_name, instructions)
VALUES ('Steak & Potatoes', 'Spicy jalapeno bacon ipsum dolor amet ham hock cupim cow, chuck tongue chicken alcatra shoulder t-bone strip steak turducken pig frankfurter pork belly burgdoggen. Burgdoggen pork chop drumstick tail tri-tip. Strip steak landjaeger bresaola rump pork jowl buffalo pancetta pastrami picanha. Turkey tri-tip meatloaf doner shank cow pig chuck flank porchetta leberkas. Hamburger boudin brisket bacon shankle bresaola leberkas rump turducken cow.'), 
('Mashed Potatoes', 'Beef ribs turducken meatball shank hamburger flank. Buffalo venison frankfurter, ham salami chicken pork chop jerky shank corned beef leberkas pork. Ham hock ground round kielbasa pork loin, capicola porchetta bresaola. Pig frankfurter meatloaf, pork belly bacon venison turducken filet mignon shank leberkas. Turkey pastrami salami ham pancetta. Andouille chicken capicola hamburger leberkas filet mignon.');

SELECT * FROM recipes;



