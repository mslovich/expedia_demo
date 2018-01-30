connection: "events_ecommerce"

include: "*.view.lkml"         # include all views in this project



explore: order_items {

  join: users {
    type: left_outer
    relationship: many_to_one
    sql_on: ${order_items.user_id} = ${users.id};;
  }

  join: user_facts {
    type: left_outer
    relationship: one_to_one
    sql_on: ${users.id}  = ${user_facts.user_id} ;;
  }

  join: inventory_items {
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: one_to_one
  }

  join: products {
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

}
