with source_data as (

    select * from {{ source("Books","_airbyte_raw_Books") }}

),

final as (
    select l.* from source_data
    cross apply openjson(_airbyte_data) with (Book float, BookName nvarchar(250),Currency float, bBudgetBook float ) as l
)

select * from final