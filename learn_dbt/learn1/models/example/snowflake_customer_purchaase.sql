{{config(materialized = 'table')}}


select c_name,c_custkey,c_nationkey as nation,sum(o_totalprice) as total_purchase
from snowflake_sample_data.tpch_sf1.customer c left join snowflake_sample_data.tpch_sf1.orders o
on c.c_custkey =o.o_custkey
group by 1,2,3
having total_purchase is not null