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

select  cn.custkey,
        cn.nationkey,
        cn.customer_name,
        cn.nation_name,
        ol.orderkey,
        ol.totalprice,
        ol.orderdate,
        ol.extendedprice,
        ol.discount,
        ol.tax,
        ol.quantity
from {{ ref('customer_nation') }} as cn
JOIN {{ ref('orders_lineitem') }} as ol
ON cn.custkey=ol.custkey