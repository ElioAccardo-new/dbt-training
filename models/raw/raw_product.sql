{{
    config(
        materialized='table'
    )
}}

SELECT * FROM {{ source('globalmart', 'product') }}
--SELECT * FROM RAW.GLOBAL_MART.PRODUCT -- keep only this one on the original format for studying purpose