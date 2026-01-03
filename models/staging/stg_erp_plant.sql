{{ config(materialized='view') }}

SELECT
    {{ clean_string('PLANT_ID') }} AS plant_id,
    {{ clean_string('PLANT_CODE') }} AS plant_code,
    {{ clean_string('PLANT_NAME') }} AS plant_name,
    {{ clean_string('PLANT_TYPE') }} AS plant_type,
    {{ clean_string('REGION') }} AS region,
    {{ safe_date('START_DATE') }} AS start_date,
    {{ safe_date('END_DATE') }} AS end_date,
    IFF(UPPER(NVL(ACTIVE_FLAG,'N')) IN ('Y','1','TRUE'), TRUE, FALSE) AS active_flag,
    DW_CREATED_TS,
    CURRENT_TIMESTAMP() AS dw_last_updated_ts
FROM {{ source('raw', 'erp_plant') }}


