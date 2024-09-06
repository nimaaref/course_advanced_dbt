WITH

events AS (
    SELECT
        user_id,
        DATE(created_at) AS created_date,
        event_id AS login_id
    FROM
        {{ ref('stg_bingeflix__events')}}
    WHERE
        event_name = 'User Logged In'
),

date_spine AS (
    SELECT
        calendar_date,
        date_week
    FROM
        {{ ref('int_dates')}}
),

pre_agg AS (
    SELECT
        {{ dbt_utils.generate_surrogate_key(['date_week', 'user_id']) }} AS surrogate_key,
        date_week,
        user_id,
        COUNT(DISTINCT login_id) AS login_count
    FROM
        date_spine
        LEFT JOIN events ON date_spine.calendar_date = events.created_date
    GROUP BY ALL
),

final AS (
    SELECT *,
    {{ rolling_agg_x_periods('login_count', 'user_id', 'avg', 'date_week', 7) }}
    FROM pre_agg
)


SELECT * FROM final
