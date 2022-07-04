--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: race; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.race (
    race_id integer NOT NULL,
    name character varying(30) NOT NULL,
    homeworld character varying(30)
);


ALTER TABLE public.race OWNER TO freecodecamp;

--
-- Name: alien_race_race_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.alien_race_race_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alien_race_race_id_seq OWNER TO freecodecamp;

--
-- Name: alien_race_race_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.alien_race_race_id_seq OWNED BY public.race.race_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age numeric(3,1) NOT NULL,
    size integer NOT NULL,
    type character varying(20)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size integer NOT NULL,
    is_tidally_locked boolean NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(30) NOT NULL,
    exploration_status boolean NOT NULL,
    has_life boolean,
    description text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: race_planets; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.race_planets (
    race_id integer NOT NULL,
    planet_id integer NOT NULL,
    race_planets_id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.race_planets OWNER TO freecodecamp;

--
-- Name: race_planets_race_planets_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.race_planets_race_planets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.race_planets_race_planets_id_seq OWNER TO freecodecamp;

--
-- Name: race_planets_race_planets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.race_planets_race_planets_id_seq OWNED BY public.race_planets.race_planets_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    spectral_type character varying(5) NOT NULL,
    temperature integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: race race_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.race ALTER COLUMN race_id SET DEFAULT nextval('public.alien_race_race_id_seq'::regclass);


--
-- Name: race_planets race_planets_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.race_planets ALTER COLUMN race_planets_id SET DEFAULT nextval('public.race_planets_race_planets_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13.6, 52850, 'spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10.0, 110000, 'spiral');
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', 0.4, 30000, 'spiral');
INSERT INTO public.galaxy VALUES (4, 'Galaxy 1', 10.0, 200, 'spiral');
INSERT INTO public.galaxy VALUES (5, 'Galaxy 2', 20.0, 300, 'spiral');
INSERT INTO public.galaxy VALUES (6, 'Galaxy 3', 30.0, 300, 'spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'The Moon', 3474, true);
INSERT INTO public.moon VALUES (3, 2, 'Deimos', 12, true);
INSERT INTO public.moon VALUES (2, 2, 'Fobos', 22, true);
INSERT INTO public.moon VALUES (4, 3, 'Io', 3643, true);
INSERT INTO public.moon VALUES (5, 3, 'Europa', 3121, true);
INSERT INTO public.moon VALUES (6, 3, 'Ganymede', 5268, true);
INSERT INTO public.moon VALUES (7, 3, 'Callysto', 4820, true);
INSERT INTO public.moon VALUES (8, 3, 'Leda', 22, true);
INSERT INTO public.moon VALUES (9, 3, 'Ersa', 15, true);
INSERT INTO public.moon VALUES (10, 3, 'Himalia', 7, true);
INSERT INTO public.moon VALUES (11, 4, 'Pandia', 16, true);
INSERT INTO public.moon VALUES (12, 13, 'Mimas', 396, true);
INSERT INTO public.moon VALUES (13, 13, 'Enceladus', 504, true);
INSERT INTO public.moon VALUES (14, 13, 'Tethys', 1062, true);
INSERT INTO public.moon VALUES (15, 13, 'Dione', 1123, true);
INSERT INTO public.moon VALUES (16, 13, 'Rhea', 1527, true);
INSERT INTO public.moon VALUES (17, 13, 'Titan', 5149, true);
INSERT INTO public.moon VALUES (18, 13, 'Iapetus', 1470, true);
INSERT INTO public.moon VALUES (19, 14, 'Miranda', 471, true);
INSERT INTO public.moon VALUES (20, 14, 'Ariel', 1157, true);
INSERT INTO public.moon VALUES (21, 14, 'Umbriel', 1169, true);
INSERT INTO public.moon VALUES (22, 14, 'Titania', 1576, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Earth', 'terrestrial', true, NULL, NULL);
INSERT INTO public.planet VALUES (2, 1, 'Mars', 'terrestrial', true, NULL, NULL);
INSERT INTO public.planet VALUES (3, 1, 'Jupiter', 'gas giant', true, NULL, NULL);
INSERT INTO public.planet VALUES (4, 2, 'Neemas', 'gas giant', true, NULL, NULL);
INSERT INTO public.planet VALUES (5, 2, 'Xoxitle', 'super-earth', false, NULL, NULL);
INSERT INTO public.planet VALUES (6, 2, 'Remdi', 'terrestrial', true, NULL, NULL);
INSERT INTO public.planet VALUES (7, 3, 'Faarang', 'terrestrial', true, NULL, NULL);
INSERT INTO public.planet VALUES (8, 3, 'Sooni', 'gas giant', true, NULL, NULL);
INSERT INTO public.planet VALUES (9, 3, 'Bonzmi', 'terrestrial', true, NULL, NULL);
INSERT INTO public.planet VALUES (10, 3, 'Sheela-hoh', 'super-earth', true, NULL, NULL);
INSERT INTO public.planet VALUES (11, 4, 'Heronami', 'terrestrial', false, NULL, NULL);
INSERT INTO public.planet VALUES (12, 5, 'Labyrinth', 'terrestrial', true, NULL, NULL);
INSERT INTO public.planet VALUES (13, 1, 'Saturn', 'gas giant', true, NULL, NULL);
INSERT INTO public.planet VALUES (14, 1, 'Uranus', 'gas giant', true, NULL, NULL);


--
-- Data for Name: race; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.race VALUES (1, 'human', NULL);
INSERT INTO public.race VALUES (2, 'protoss', NULL);
INSERT INTO public.race VALUES (3, 'zerg', NULL);


--
-- Data for Name: race_planets; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.race_planets VALUES (1, 1, 1, NULL);
INSERT INTO public.race_planets VALUES (1, 2, 2, NULL);
INSERT INTO public.race_planets VALUES (2, 2, 3, NULL);
INSERT INTO public.race_planets VALUES (3, 3, 4, NULL);
INSERT INTO public.race_planets VALUES (2, 13, 5, NULL);
INSERT INTO public.race_planets VALUES (3, 13, 6, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sol', 'G', 5778);
INSERT INTO public.star VALUES (2, 1, 'Tau Ceti', 'G', 5334);
INSERT INTO public.star VALUES (3, 1, 'Alpha Centauri', 'G', 5790);
INSERT INTO public.star VALUES (4, 1, 'VY Canis Majoris', 'M', 4000);
INSERT INTO public.star VALUES (5, 1, 'Procyon', 'D', 7000);
INSERT INTO public.star VALUES (6, 2, 'Lave', 'D', 13000);
INSERT INTO public.star VALUES (7, 2, 'Diso', 'K', 4300);
INSERT INTO public.star VALUES (8, 3, 'Earendel', 'B', 20000);


--
-- Name: alien_race_race_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.alien_race_race_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: race_planets_race_planets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.race_planets_race_planets_id_seq', 33, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: race alien_race_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.race
    ADD CONSTRAINT alien_race_name_key UNIQUE (name);


--
-- Name: race alien_race_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.race
    ADD CONSTRAINT alien_race_pkey PRIMARY KEY (race_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: race_planets race_planets_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.race_planets
    ADD CONSTRAINT race_planets_name_key UNIQUE (name);


--
-- Name: race_planets race_planets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.race_planets
    ADD CONSTRAINT race_planets_pkey PRIMARY KEY (race_planets_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

