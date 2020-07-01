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

select  {{ discounted_price('extendedprice', 'discount') }} as discounted_price_pre_tax,
        {{ full_charge('extendedprice', 'discount', 'tax') }} as discounted_price,
        {{ tax_charged('extendedprice', 'discount', 'tax') }} as tax_charged,
        *
from {{ ref('cust_list_ord_nat') }}
