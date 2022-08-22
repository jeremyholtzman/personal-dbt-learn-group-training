{{
    config(
        transient = false
    )
}}

with customer as (

    select * from {{ ref('stg_tpch_customers') }}

),
nation as (

    select * from {{ ref('stg_tpch_nations') }}
),
region as (

    select * from {{ ref('stg_tpch_regions') }}

),
final as (
    select 
        customer.customer_id,
        customer.name,
        customer.address,
        {# nation.nation_id as nation_id, #}
        nation.name as nation,
        {# region.region_id as region_id, #}
        region.name as region,
        customer.phone_number,
        customer.account_balance,
        customer.market_segment,
        customer.market_segment_2
    from
        customer
        inner join nation
            on customer.nation_id = nation.nation_id
        inner join region
            on nation.region_id = region.region_id
)
select 
    *
from
    final
order by
    customer_id