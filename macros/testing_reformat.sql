{%- macro testing_format() -%}

    {%- if execute -%}
    {%- set nodes_list = graph.nodes.values() -%}
    {%- set values = [] -%}

    {%- for node in nodes_list -%}

          {%- set values_line %}

              '{{ node.unique_id }}',
              '{{ node.name }}',
              '{{ node.resource_type }}',
              '{{ node.original_file_path }}',
              cast('{{ node.config.enabled | trim }}' as boolean),
              '{{ node.config.materialized }}',
              '{{ node.config.on_schema_change}}',
              '{{ node.database }}',
              '{{ node.schema }}',
              '{{ node.package_name }}',
              '{{ node.alias }}',
              cast('{{ dbt_project_evaluator.is_not_empty_string(node.description) | trim }}' as boolean),
              '{{ "" if not node.column_name else node.column_name }}'

        {% endset -%}
        {%- do values.append(values_line) -%}
        {{ log('-----------------', info=True) }}
        {{ log(values_line, info=True) }}
        {{ log(node, info=True) }}

    {%- endfor -%}
    {%- endif -%}


{%- endmacro -%}