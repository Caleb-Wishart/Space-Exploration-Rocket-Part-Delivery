local data_util = require("__space-exploration__/data_util")

mod_prefix = data_util.mod_prefix

-- defaults to stack size for items
data.raw.item[mod_prefix .. "cargo-rocket-section-packed"].stack_size = 10

-- add recipies for stacking
local capsule_stack_size = 25
data:extend({
    {
        type = "item",
        name = "delivery-cannon-capsule-stacked",
        icon = "__Space-Exploration-Rocket-Part-Delivery__/delivery-cannon-capsule-stacked.png",
        icon_size = 64,
        subgroup = "intersurface-part",
        order = "t",
        stack_size = 1,
    },
    {
      type = "recipe",
      name = "delivery-cannon-capsule-packing",
      result = "delivery-cannon-capsule-stacked",
      energy_required = 10,
      ingredients = {
        { mod_prefix .. "delivery-cannon-capsule", capsule_stack_size }
      },
      order='z-z-z-z-z',
      requester_paste_multiplier = 2,
      enabled = false,
      always_show_made_in = false,
      allow_as_intermediate = false,
    },{
      type = "recipe",
      name = "delivery-cannon-capsule-unpacking",
      results = {
        { mod_prefix .. "delivery-cannon-capsule", capsule_stack_size }
      },
      energy_required = 10,
      ingredients = {
        { "delivery-cannon-capsule-stacked", 1 }
      },
      order='z-z-z-z',
      requester_paste_multiplier = 2,
      enabled = false,
      always_show_made_in = false,
      allow_as_intermediate = false,
    }
})

table.insert(data.raw.technology[mod_prefix .. "delivery-cannon"].effects, {type = "unlock-recipe", recipe = "delivery-cannon-capsule-packing"} )
table.insert(data.raw.technology[mod_prefix .. "delivery-cannon"].effects, {type = "unlock-recipe", recipe = "delivery-cannon-capsule-unpacking"} )


se_delivery_cannon_recipes[mod_prefix .. "cargo-rocket-section-packed"] = {name=mod_prefix .. "cargo-rocket-section-packed"}
se_delivery_cannon_recipes["delivery-cannon-capsule-stacked"] = {name="delivery-cannon-capsule-stacked"}
se_delivery_cannon_recipes[mod_prefix .. "space-capsule"] = {name=mod_prefix .. "space-capsule"}