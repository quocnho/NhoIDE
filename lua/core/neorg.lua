require("neorg").setup {
  load = {
    ["core.defaults"] = {},
    ["core.keybinds"] = {
      config = {
        hook = function(keybinds)
          local leader = " " -- keybinds.leader

          -- Map all the below keybinds only when the "norg" mode is active
          keybinds.map_event_to_mode("norg", {
            n = {
              -- Marks the task under the cursor as "undone"
              -- ^mark Task as Undone
              { "gu", "core.norg.qol.todo_items.todo.task_undone" },

              -- Marks the task under the cursor as "pending"
              -- ^mark Task as Pending
              { "gp", "core.norg.qol.todo_items.todo.task_pending" },

              -- Marks the task under the cursor as "done"
              -- ^mark Task as Done
              { "gd", "core.norg.qol.todo_items.todo.task_done" },

              -- Marks the task under the cursor as "on_hold"
              -- ^mark Task as on Hold
              { "gh", "core.norg.qol.todo_items.todo.task_on_hold" },

              -- Marks the task under the cursor as "cancelled"
              -- ^mark Task as Cancelled
              { "gc", "core.norg.qol.todo_items.todo.task_cancelled" },

              -- Marks the task under the cursor as "recurring"
              -- ^mark Task as Recurring
              { "gr", "core.norg.qol.todo_items.todo.task_recurring" },

              -- Marks the task under the cursor as "important"
              -- ^mark Task as Important
              { "gi", "core.norg.qol.todo_items.todo.task_important" },

              -- Switches the task under the cursor between a select few states
              { "<C-Space>", "core.norg.qol.todo_items.todo.task_cycle" },

              -- Captures a task
              -- ^Task Capture
              { leader .. "tt", "core.gtd.base.capture" },

              -- Short for "task views", show a view selection menu
              -- ^Task View
              { leader .. "tv", "core.gtd.base.views" },

              -- Short for "task edit", lets you edit a task
              -- ^Task Edit
              { leader .. "te", "core.gtd.base.edit" },

              -- Creates a new .norg file to take notes in
              -- ^New Note
              { leader .. "nt", "core.norg.dirman.new.note" },

              -- Hop to the destination of the link under the cursor
              { "<CR>", "core.norg.esupports.hop.hop-link" },
              { "gd", "core.norg.esupports.hop.hop-link" },
              { "gf", "core.norg.esupports.hop.hop-link" },
              { "gF", "core.norg.esupports.hop.hop-link" },

              -- Same as `<CR>`, except opens the destination in a vertical split
              { leader .. "tl", "core.norg.esupports.hop.hop-link", "vsplit" },
            },
          }, {
            silent = true,
            noremap = true,
          })

          -- Map the below keys only when traverse-heading mode is active
          keybinds.map_event_to_mode("traverse-heading", {
            n = {
              -- Move to the next heading in the document
              { "j", "core.integrations.treesitter.next.heading" },

              -- Move to the previous heading in the document
              { "k", "core.integrations.treesitter.previous.heading" },
            },
          }, {
            silent = true,
            noremap = true,
          })

          keybinds.map_event_to_mode("toc-split", {
            n = {
              -- Hop to the target of the TOC link
              { "<CR>", "core.norg.qol.toc.hop-toc-link" },

              -- Closes the TOC split
              -- ^Quit
              { "q", "core.norg.qol.toc.close" },

              -- Closes the TOC split
              -- ^escape
              { "<Esc>", "core.norg.qol.toc.close" },
            },
          }, {
            silent = true,
            noremap = true,
            nowait = true,
          })

          -- Map the below keys on gtd displays
          keybinds.map_event_to_mode("gtd-displays", {
            n = {
              { "<CR>", "core.gtd.ui.goto_task" },

              -- Keys for closing the current display
              { "q", "core.gtd.ui.close" },
              { "<Esc>", "core.gtd.ui.close" },

              { "e", "core.gtd.ui.edit_task" },
              { "<Tab>", "core.gtd.ui.details" },
            },
          }, {
            silent = true,
            noremap = true,
            nowait = true,
          })

          -- Map the below keys on presenter mode
          keybinds.map_event_to_mode("presenter", {
            n = {
              { "<CR>", "core.presenter.next_page" },
              { "l", "core.presenter.next_page" },
              { "h", "core.presenter.previous_page" },

              -- Keys for closing the current display
              { "q", "core.presenter.close" },
              { "<Esc>", "core.presenter.close" },
            },
          }, {
            silent = true,
            noremap = true,
            nowait = true,
          })
          -- Apply the below keys to all modes
          keybinds.map_to_mode("all", {
            n = {
              { leader .. "mn", ":Neorg mode norg<CR>" },
              { leader .. "mh", ":Neorg mode traverse-heading<CR>" },
              { "gO", ":Neorg toc split<CR>" },
            },
          }, {
            silent = true,
            noremap = true,
          })
          -- keybinds.remap_event("norg", "n", "<C-Space>", "core.norg.qol.todo_items.todo.task_done")
        end,
      },
    },
    ["core.ui"] = {
      config = { -- Note that this table is optional and doesn't need to be provided
        -- Configuration here
      },
    },
    ["core.norg.concealer"] = {
      config = {
        icon_preset = "diamond",
        -- dim_code_blocks = true,
      },
    },
    ["core.norg.dirman"] = {
      config = {
        workspaces = {
          gtd = "D:/OneDrive - dada/Data/neorg/gtd",
          work = "D:/OneDrive - dada/Data/neorg/work",
          -- journal = "D:/OneDrive - dada/Data/neorg/journal",
        },
        -- autochdir = true, -- Automatically change the directory to the current workspace's root every time
        index = "index.norg", -- The name of the main (root) .norg file
      },
    },
    ["core.gtd.base"] = { config = { workspace = "gtd" } },
    ["core.gtd.ui"] = {},
    ["core.norg.completion"] = { config = { engine = "nvim-cmp" } },
    ["core.norg.qol.toc"] = {
      config = { -- Note that this table is optional and doesn't need to be provided
        -- Configuration here
      },
    },
    ["core.integrations.treesitter"] = {
      config = {
        highlights = {
          Heading = {
            ["1"] = {
              Title = "+TSTitle",
              Prefix = "+TSTitle",
            },
          },
          Quote = {
            ["1"] = {
              [""] = "+Grey",
              Content = "+Grey",
            },
          },
        },
      },
    },
    ["core.integrations.telescope"] = {},
    ["core.neorgcmd"] = {},
    ["core.autocommands"] = {},
    ["external.context"] = {},
    ["external.kanban"] = {
      -- task_states = {
      --   "undone",
      --   "done",
      --   "pending",
      --   "cancelled",
      --   "uncertain",
      --   "urgent",
      --   "recurring",
      --   "on_hold",
      -- },
    },
    ["core.queries.native"] = {
      config = { -- Note that this table is optional and doesn't need to be provided
        -- Configuration here
      },
    },
    ["core.norg.journal"] = {
      config = {
        -- workspace ="D:/OneDrive - dada/Data/neorg/journal",
        strategy = "flat",
        -- journal_folder = "docs",
        -- template_name ="template.norg",
        -- use_template =true,
      },
    },
    -- ["core.presenter"] = {},
    ["core.presenter"] = {
      config = { -- Note that this table is optional and doesn't need to be provided
        -- Configuration here
        zen_mode = "zen-mode",
      },
    },
    ["core.norg.esupports.hop"] = {
      config = { -- Note that this table is optional and doesn't need to be provided
        -- Configuration here
      },
    },
    ["core.neorgcmd.commands.return"] = {},
    ["core.norg.qol.todo_items"] = {
      config = { -- Note that this table is optional and doesn't need to be provided
        -- Configuration here
      },
    },
  },
}
