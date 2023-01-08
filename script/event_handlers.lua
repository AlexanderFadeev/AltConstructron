local job_pool = require("script.job_pool")

local handlers = {}

script.on_event(defines.events.on_built_entity,
    function(event)
        local entity = event.created_entity
        local type = entity.type
        if type == "spider-vehicle" then
            log("SPIDER")
        elseif type == "entity-ghost" or type == "tile-ghost" then
            job_pool.on_ghost_placed(event)
        else
            game.print("on_built_entity: unknown entity type")
        end
    end, {
    { filter = "name", name = "alt-constructron", mode = "or" },
    { filter = "name", name = "entity-ghost", mode = "or" },
    { filter = "name", name = "tile-ghost" }
})

return handlers