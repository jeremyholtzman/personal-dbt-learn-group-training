{% snapshot test %}

    {{
        config(
          target_schema=generate_schema_name('snapshots'),
          strategy='timestamp',
          unique_key='id',
          updated_at='_etl_loaded_at',
          invalidate_hard_deletes=True,
        )
    }}

    select * from raw.jaffle_shop.orders

{% endsnapshot %}