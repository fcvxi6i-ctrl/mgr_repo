{% macro safe_number(column_name, default=0) %}
    NVL(TRY_TO_NUMBER(NULLIF({{ column_name }}, '')), {{ default }})
{% endmacro %}
