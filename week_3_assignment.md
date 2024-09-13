# Task 1

### Redundant Test #1
- Removed the not_null generic test from all columns that have an accepted values test.
- These tests were applied on columns like `subscription_plan_id` where the accepted values were 1, 2, 3.
- This was applied when subscription plan was not a primary key.

### Redundant Test #2
- Removed tests from source files: `ads_platform` and `bingeflix`.

### Redundant Test #3
- Removed tests from models upstream.
- Models impacted were in the core folder: `subscriptions`, `users`, and `events`.

# Task 2
- Implemented the `assert_valid_event_name.sql` in the test folder.
- Added the test on the `stg_bingeflix__events` test.

# Task 3
- Implemented the following unit test:

```yaml
unit_tests:
- name: unit_test__dim_users
  model: dim_users

  given:
    - input: ref('stg_bingeflix__users')
      rows:
        - { user_id: 1, created_at: '2024-01-01 00:00:00', birthdate: '2000-01-01'}
        - { user_id: 2, created_at: '2024-01-01 00:00:00', birthdate: '2001-01-01'}

    - input: ref('stg_bingeflix__subscriptions')
      rows:
        - { user_id: 1 }
        - { user_id: 2 }

  expect:
    rows:
      - { user_id: 1, age_at_acquisition: 24 }
      - { user_id: 2, age_at_acquisition: 23 }
