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

select  avg(totalprice) as average_order_price,
        sum(quantity) as total_quantity_per_order,
        listagg(quantity, '|~~|') as quantities_per_order,
        count(quantity) as items_per_order,
        {{ dbt_utils.width_bucket("average_order_price",184000,200000,10) }} as price_histogram,
        orderdate
from {{ ref('orders_lineitem') }}
group by orderdate