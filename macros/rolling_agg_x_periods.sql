{% macro rolling_agg_x_periods( column_name, partition_by,aggregation='avg', order_by='created_at', x_periods=7) %}
    {{ aggregation }}({{ column_name }}) OVER (
        PARTITION BY {{ partition_by }}
        ORDER BY {{ order_by }}
        ROWS BETWEEN {{ x_periods - 1 }} PRECEDING AND CURRENT ROW
    ) AS {{ aggregation }}_{{ x_periods }}_periods_{{ column_name }}
{% endmacro %}
