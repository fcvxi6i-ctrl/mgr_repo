{% macro clean_string(column_name) %}
    TRIM(NULLIF({{ column_name }}, ''))
{% endmacro %}
