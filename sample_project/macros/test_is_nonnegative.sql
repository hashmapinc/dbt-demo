/*
Copyright © 2020 Hashmap, Inc

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

{% macro test_is_nonnegative(model, column_name) %}

with validation as (

    select
        {{ column_name }} as negative

    from {{ model }}

),

validation_errors as (

    select
        negative

    from validation
    -- if this is true, negative will have a non-zero count
    where negative < 0

)

select count(*)
from validation_errors

{% endmacro %}