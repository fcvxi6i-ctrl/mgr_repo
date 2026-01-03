{% macro safe_date(column_name) %}
    TO_DATE(TRY_TO_TIMESTAMP({{ column_name }}))
{% endmacro %}
