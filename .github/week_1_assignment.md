### List of issues raised by dbt_project_evaluator ###

-- valid_documentation_coverage --
|                      MEASURED_AT | TOTAL_MODELS | DOCUMENTED_MODELS | DOCUMENTATION_COVERAGE_PCT | BASE_DOCUMENTATION_COVERAGE_PCT | STAGING_DOCUMENTATION_COVERAGE_PCT | ... |
| -------------------------------- | ------------ | ----------------- | -------------------------- | ------------------------------- | ---------------------------------- | --- |
| 2024-08-30 15:36:36.952000-07:00 |           12 |                11 |                      91.67 |                                 |                                100 | ... |


-- is_empty_fct_undocumented_models_ --
| RESOURCE_NAME | MODEL_TYPE |
| ------------- | ---------- |
| fct_events    | marts      |


-- is_empty_fct_model_naming_conventions_ --
| RESOURCE_NAME | PREFIX | MODEL_TYPE | APPROPRIATE_PREFIXES |
| ------------- | ------ | ---------- | -------------------- |
| mrr           | mrr_   | marts      | dim_, fct_           |


-- is_empty_fct_undocumented_source_tables_ --
| RESOURCE_NAME          |
| ---------------------- |
| ads_platform.daily_ads |


-- is_empty_fct_undocumented_sources_ --
| SOURCE_NAME  |
| ------------ |
| ads_platform |


-- valid_test_coverage --
|                      MEASURED_AT | TOTAL_MODELS | TOTAL_TESTS | TESTED_MODELS | TEST_COVERAGE_PCT | BASE_TEST_COVERAGE_PCT | ... |
| -------------------------------- | ------------ | ----------- | ------------- | ----------------- | ---------------------- | --- |
| 2024-08-30 15:36:38.253000-07:00 |           12 |          75 |            11 |             91.67 |                        | ... |


-- is_empty_fct_missing_primary_key_tests_ --
| RESOURCE_NAME | RESOURCE_TYPE | MODEL_TYPE | IS_PRIMARY_KEY_TESTED | NUMBER_OF_TESTS_ON_MODEL |
| ------------- | ------------- | ---------- | --------------------- | ------------------------ |
| fct_events    | model         | marts      |                 False |                        0 |


-- is_empty_fct_model_fanout_ --
| PARENT                | PARENT_MODEL_TYPE | LEAF_CHILDREN                                                     |
| --------------------- | ----------------- | ----------------------------------------------------------------- |
| stg_bingeflix__events | staging           | fct_active_users, fct_events, int_sessions_pivoted_to_event_names |

