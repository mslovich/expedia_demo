







# If necessary, uncomment the line below to include explore_source.
# include: "expedia_ecom_example.model.lkml"

view: user_facts {


  derived_table: {
    explore_source: order_items {
      column: user_id { field: users.id }
      column: first_order_at { field: order_items.min_order_date }
      column: count { field: order_items.count }
      derived_column: most_recent_date {
        sql: MAX(order_items.created_at) ;;
      }
    }
  }


  dimension: user_id {
    sql: ${TABLE}.users_id ;;
    type: string
    primary_key: yes
  }

  dimension: life_time_orders {
    type: number
    sql: ${TABLE}.count ;;
  }

  dimension_group: first_order {
    type: time
    sql: ${TABLE}.first_order_at ;;
    #timeframes: []
  }

  dimension_group: most_recent {
    type: time
    sql: ${TABLE}.most_recent_date ;;
    #timeframes: []
  }

}
