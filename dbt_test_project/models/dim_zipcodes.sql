with ranked_zipcodes as (
    select
        zipcode,
        state_abbr,
        state_name,
        row_number() over (partition by zipcode order by state_abbr, state_name) as row_num
    from {{ ref('stg_zipcodes') }}
)

select
    zipcode,
    state_abbr,
    state_name
from ranked_zipcodes
where row_num = 1