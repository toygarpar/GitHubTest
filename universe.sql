--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: formation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.formation (
    formation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    formation_type character varying(50) NOT NULL,
    formation_description text,
    distance_from_earth numeric(15,2),
    age_in_millions_of_years integer NOT NULL,
    is_elliptical boolean,
    has_life boolean,
    brightness integer,
    galaxy_id bigint,
    star_id bigint,
    planet_id bigint,
    moon_id bigint
);


ALTER TABLE public.formation OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id bigint NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(15,2),
    brightness integer,
    galaxy_type character varying(30) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
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
    moon_id bigint NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(15,2),
    brightness integer,
    moon_type character varying(30) NOT NULL,
    planet_id bigint
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
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
    planet_id bigint NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(15,2),
    brightness integer,
    planet_type character varying(30) NOT NULL,
    star_id bigint
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id bigint NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(15,2),
    brightness integer,
    star_type character varying(30) NOT NULL,
    galaxy_id bigint
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: formation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.formation VALUES (1, 'Solar System', 'Star System', 'Solar system with one star', 0.00, 4600, false, true, 5, 1, 1, 1, 1);
INSERT INTO public.formation VALUES (2, 'Alpha Centauri', 'Binary Star', 'System with two stars orbiting each other', 4.37, 6000, false, false, 7, 1, 2, NULL, NULL);
INSERT INTO public.formation VALUES (3, 'Helix Nebula', 'Planetary Nebula', 'Remnant of a dying star', 2500.00, 10000, true, false, 8, 1, NULL, NULL, NULL);
INSERT INTO public.formation VALUES (4, 'Pleiades', 'Open Cluster', 'Group of young stars', 1500.00, 100, false, false, 6, 1, NULL, NULL, NULL);
INSERT INTO public.formation VALUES (5, 'Omega Centauri', 'Globular Cluster', 'Dense group of old stars', 25000.00, 12000, true, false, 7, 1, NULL, NULL, NULL);
INSERT INTO public.formation VALUES (6, 'Virgo Supercluster', 'Galaxy Filament', 'Large-scale structure of galaxies', 500.00, 13000, false, false, 9, 1, NULL, NULL, NULL);
INSERT INTO public.formation VALUES (7, 'Sagittarius A*', 'Black Hole', 'Supermassive black hole at galactic center', 27000.00, 13000, true, false, 10, 1, NULL, NULL, NULL);
INSERT INTO public.formation VALUES (8, 'Orion Nebula', 'Nebula', 'Cloud of gas and dust', 1300.00, 5000, false, false, 6, 1, NULL, NULL, NULL);
INSERT INTO public.formation VALUES (9, 'Crab Nebula', 'Supernova Remnant', 'Explosion aftermath', 10000.00, 1000, true, false, 8, 1, NULL, NULL, NULL);
INSERT INTO public.formation VALUES (10, 'Asteroid Belt', 'Asteroid Belt', 'Region of rocky debris', 0.00, 4500, false, false, 4, 1, 1, NULL, NULL);
INSERT INTO public.formation VALUES (11, 'Halley''s Comet', 'Comet', 'Icy body in solar system', 0.00, 4500, false, false, 3, 1, 1, NULL, NULL);
INSERT INTO public.formation VALUES (12, 'Pluto', 'Dwarf Planet', 'Small planetary body', 0.00, 4500, false, false, 4, 1, 8, NULL, NULL);
INSERT INTO public.formation VALUES (13, 'Kepler-22 System', 'Exoplanet System', 'System with multiple exoplanets', 600.00, 4000, false, false, 5, 1, 9, NULL, NULL);
INSERT INTO public.formation VALUES (14, 'Earth-Moon', 'Binary Planet', 'Two planets orbiting each other', 0.00, 4500, false, false, 4, 1, 2, NULL, NULL);
INSERT INTO public.formation VALUES (15, 'Saturn Rings', 'Ring System', 'Planetary rings', 0.00, 4500, false, false, 5, 1, 3, NULL, NULL);
INSERT INTO public.formation VALUES (16, 'Jupiter Trojans', 'Trojan Asteroids', 'Asteroids sharing orbit with planet', 0.00, 4500, false, false, 4, 1, 1, NULL, NULL);
INSERT INTO public.formation VALUES (17, 'Kuiper Belt', 'Kuiper Belt', 'Region of icy bodies', 0.00, 4500, false, false, 4, 1, 8, NULL, NULL);
INSERT INTO public.formation VALUES (18, 'Oort Cloud', 'Oort Cloud', 'Spherical shell of icy objects', 0.00, 4500, true, false, 3, 1, 8, NULL, NULL);
INSERT INTO public.formation VALUES (19, 'Interstellar Object', 'Interstellar Object', 'Object from outside solar system', 0.00, 4500, false, false, 4, 1, NULL, NULL, NULL);
INSERT INTO public.formation VALUES (20, 'Hyades Cluster', 'Star Cluster', 'Group of stars bound by gravity', 0.00, 4500, false, false, 6, 1, NULL, NULL, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', true, true, 13600, 0.00, 5, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', false, true, 10000, 2.50, 4, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', false, true, 8000, 3.00, 3, 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', false, true, 13000, 28.00, 6, 'Elliptical');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', false, true, 12000, 31.00, 5, 'Spiral');
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', false, true, 11000, 27.00, 4, 'Spiral');
INSERT INTO public.galaxy VALUES (7, 'Centaurus A', false, true, 12000, 12.00, 7, 'Elliptical');
INSERT INTO public.galaxy VALUES (8, 'Large Magellanic Cloud', false, true, 1000, 0.16, 3, 'Irregular');
INSERT INTO public.galaxy VALUES (9, 'Small Magellanic Cloud', false, true, 1000, 0.20, 2, 'Irregular');
INSERT INTO public.galaxy VALUES (10, 'Messier 87', false, true, 13000, 53.50, 8, 'Elliptical');
INSERT INTO public.galaxy VALUES (11, 'Hoag''s Object', false, true, 12000, 600.00, 4, 'Ring');
INSERT INTO public.galaxy VALUES (12, 'NGC 1300', false, true, 11000, 61.00, 5, 'Barred Spiral');
INSERT INTO public.galaxy VALUES (13, 'NGC 4565', false, true, 10000, 38.00, 6, 'Edge-on Spiral');
INSERT INTO public.galaxy VALUES (14, 'NGC 1232', false, true, 11000, 61.00, 5, 'Spiral');
INSERT INTO public.galaxy VALUES (15, 'NGC 1365', false, true, 10000, 56.00, 5, 'Barred Spiral');
INSERT INTO public.galaxy VALUES (16, 'NGC 253', false, true, 12000, 11.40, 7, 'Spiral');
INSERT INTO public.galaxy VALUES (17, 'NGC 4945', false, true, 11000, 11.70, 6, 'Spiral');
INSERT INTO public.galaxy VALUES (18, 'NGC 5128', false, true, 12000, 12.00, 7, 'Elliptical');
INSERT INTO public.galaxy VALUES (19, 'NGC 5866', false, true, 10000, 44.00, 5, 'Lenticular');
INSERT INTO public.galaxy VALUES (20, 'NGC 7331', false, true, 10000, 40.00, 6, 'Spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', false, true, 4500, 0.00, 4, 'Natural Satellite', 1);
INSERT INTO public.moon VALUES (2, 'Phobos', false, false, 4500, 0.00, 3, 'Irregular Satellite', 2);
INSERT INTO public.moon VALUES (3, 'Deimos', false, false, 4500, 0.00, 3, 'Irregular Satellite', 2);
INSERT INTO public.moon VALUES (4, 'Io', false, true, 4500, 0.00, 5, 'Volcanic Moon', 3);
INSERT INTO public.moon VALUES (5, 'Europa', false, true, 4500, 0.00, 5, 'Icy Moon', 3);
INSERT INTO public.moon VALUES (6, 'Ganymede', false, true, 4500, 0.00, 6, 'Icy Moon', 3);
INSERT INTO public.moon VALUES (7, 'Callisto', false, true, 4500, 0.00, 5, 'Icy Moon', 3);
INSERT INTO public.moon VALUES (8, 'Titan', false, true, 4500, 0.00, 6, 'Icy Moon', 4);
INSERT INTO public.moon VALUES (9, 'Enceladus', false, true, 4500, 0.00, 5, 'Icy Moon', 4);
INSERT INTO public.moon VALUES (10, 'Mimas', false, true, 4500, 0.00, 4, 'Icy Moon', 4);
INSERT INTO public.moon VALUES (11, 'Triton', false, true, 4500, 0.00, 5, 'Icy Moon', 7);
INSERT INTO public.moon VALUES (12, 'Charon', false, true, 4500, 0.00, 4, 'Dwarf Planet Moon', 8);
INSERT INTO public.moon VALUES (13, 'Miranda', false, true, 4500, 0.00, 4, 'Icy Moon', 7);
INSERT INTO public.moon VALUES (14, 'Ariel', false, true, 4500, 0.00, 5, 'Icy Moon', 7);
INSERT INTO public.moon VALUES (15, 'Umbriel', false, true, 4500, 0.00, 4, 'Icy Moon', 7);
INSERT INTO public.moon VALUES (16, 'Oberon', false, true, 4500, 0.00, 5, 'Icy Moon', 7);
INSERT INTO public.moon VALUES (17, 'Rhea', false, true, 4500, 0.00, 5, 'Icy Moon', 4);
INSERT INTO public.moon VALUES (18, 'Iapetus', false, true, 4500, 0.00, 4, 'Icy Moon', 4);
INSERT INTO public.moon VALUES (19, 'Dione', false, true, 4500, 0.00, 5, 'Icy Moon', 4);
INSERT INTO public.moon VALUES (20, 'Hyperion', false, false, 4500, 0.00, 3, 'Irregular Satellite', 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, true, 4500, 0.00, 5, 'Terrestrial', 1);
INSERT INTO public.planet VALUES (2, 'Mars', false, true, 4600, 0.00, 4, 'Terrestrial', 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', false, true, 4500, 0.00, 6, 'Gas Giant', 1);
INSERT INTO public.planet VALUES (4, 'Saturn', false, true, 4500, 0.00, 6, 'Gas Giant', 1);
INSERT INTO public.planet VALUES (5, 'Venus', false, true, 4500, 0.00, 4, 'Terrestrial', 1);
INSERT INTO public.planet VALUES (6, 'Mercury', false, true, 4500, 0.00, 3, 'Terrestrial', 1);
INSERT INTO public.planet VALUES (7, 'Neptune', false, true, 4500, 0.00, 5, 'Ice Giant', 1);
INSERT INTO public.planet VALUES (8, 'Uranus', false, true, 4500, 0.00, 5, 'Ice Giant', 1);
INSERT INTO public.planet VALUES (9, 'Kepler-22b', false, true, 4000, 600.00, 4, 'Super-Earth', 2);
INSERT INTO public.planet VALUES (10, 'HD 209458 b', false, true, 5000, 150.00, 6, 'Hot Jupiter', 3);
INSERT INTO public.planet VALUES (11, 'Gliese 581g', false, true, 7000, 20.00, 4, 'Super-Earth', 4);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', false, true, 8000, 40.00, 5, 'Terrestrial', 5);
INSERT INTO public.planet VALUES (13, 'Proxima Centauri b', false, true, 4800, 4.24, 4, 'Terrestrial', 2);
INSERT INTO public.planet VALUES (14, 'WASP-12b', false, true, 1000, 870.00, 7, 'Hot Jupiter', 6);
INSERT INTO public.planet VALUES (15, 'HD 189733 b', false, true, 6000, 63.00, 6, 'Hot Jupiter', 7);
INSERT INTO public.planet VALUES (16, '51 Pegasi b', false, true, 4000, 50.00, 6, 'Hot Jupiter', 8);
INSERT INTO public.planet VALUES (17, 'PSR B1257+12 b', false, true, 5000, 2300.00, 3, 'Pulsar Planet', 9);
INSERT INTO public.planet VALUES (18, 'CoRoT-7b', false, true, 1500, 480.00, 4, 'Super-Earth', 10);
INSERT INTO public.planet VALUES (19, 'OGLE-2005-BLG-390Lb', false, true, 9000, 21000.00, 3, 'Super-Earth', 11);
INSERT INTO public.planet VALUES (20, 'GJ 1214 b', false, true, 6000, 40.00, 5, 'Mini-Neptune', 12);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', true, true, 4600, 0.00, 5, 'G-type', 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', false, true, 4850, 4.24, 3, 'M-type', 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', false, true, 6000, 4.37, 4, 'G-type', 1);
INSERT INTO public.star VALUES (4, 'Alpha Centauri B', false, true, 6000, 4.37, 4, 'K-type', 1);
INSERT INTO public.star VALUES (5, 'Betelgeuse', false, true, 8000, 642.50, 8, 'M-type', 1);
INSERT INTO public.star VALUES (6, 'Sirius A', false, true, 200, 8.60, 7, 'A-type', 1);
INSERT INTO public.star VALUES (7, 'Sirius B', false, true, 200, 8.60, 6, 'White Dwarf', 1);
INSERT INTO public.star VALUES (8, 'Vega', false, true, 455, 25.04, 7, 'A-type', 1);
INSERT INTO public.star VALUES (9, 'Arcturus', false, true, 7100, 36.70, 8, 'K-type', 1);
INSERT INTO public.star VALUES (10, 'Rigel', false, true, 8000, 860.00, 9, 'B-type', 1);
INSERT INTO public.star VALUES (11, 'Antares', false, true, 12000, 550.00, 8, 'M-type', 1);
INSERT INTO public.star VALUES (12, 'Canopus', false, true, 25000, 310.00, 9, 'A-type', 1);
INSERT INTO public.star VALUES (13, 'Polaris', false, true, 70, 433.00, 6, 'F-type', 1);
INSERT INTO public.star VALUES (14, 'Deneb', false, true, 10000, 2600.00, 9, 'A-type', 1);
INSERT INTO public.star VALUES (15, 'Altair', false, true, 1200, 16.73, 7, 'A-type', 1);
INSERT INTO public.star VALUES (16, 'Aldebaran', false, true, 6400, 65.30, 8, 'K-type', 1);
INSERT INTO public.star VALUES (17, 'Spica', false, true, 12500, 250.00, 9, 'B-type', 1);
INSERT INTO public.star VALUES (18, 'Pollux', false, true, 724, 33.78, 7, 'K-type', 1);
INSERT INTO public.star VALUES (19, 'Fomalhaut', false, true, 440, 25.13, 7, 'A-type', 1);
INSERT INTO public.star VALUES (20, 'Regulus', false, true, 1000, 79.30, 8, 'B-type', 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 20, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 20, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 20, true);


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
-- Name: formation solar_formation_formation_type_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.formation
    ADD CONSTRAINT solar_formation_formation_type_key UNIQUE (formation_type);


--
-- Name: formation solar_formation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.formation
    ADD CONSTRAINT solar_formation_name_key UNIQUE (name);


--
-- Name: formation solar_formation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.formation
    ADD CONSTRAINT solar_formation_pkey PRIMARY KEY (formation_id);


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
-- Name: formation solar_formation_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.formation
    ADD CONSTRAINT solar_formation_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: formation solar_formation_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.formation
    ADD CONSTRAINT solar_formation_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: formation solar_formation_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.formation
    ADD CONSTRAINT solar_formation_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: formation solar_formation_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.formation
    ADD CONSTRAINT solar_formation_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

