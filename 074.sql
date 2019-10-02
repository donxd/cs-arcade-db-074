/*Please add ; after each select statement*/
CREATE PROCEDURE filmLibrary()
BEGIN
    SELECT 
      sa.actor
    , aa.age
    FROM movies mm INNER JOIN 
    starring_actors sa ON sa.movie_name = mm.movie INNER JOIN 
    actor_ages aa ON aa.actor = sa.actor
    WHERE genre = (
        SELECT 
          d.genre
        FROM (
            SELECT 
              COUNT(*) total
            , genre 
            FROM movies 
            GROUP BY genre
            ORDER BY total DESC
            LIMIT 1
        ) d
    )
    ORDER BY aa.age DESC, sa.actor ASC
    ;
END