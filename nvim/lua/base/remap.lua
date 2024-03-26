vim.g.mapleader = ","
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex);
vim.keymap.set("n", "<leader>w", vim.cmd.w);
vim.keymap.set("n", "<leader>r", vim.cmd.so);
vim.keymap.set("n", "<leader>q", vim.cmd.q);
vim.keymap.set("n", "<leader>x", vim.cmd.bd);
vim.keymap.set("n", "<leader>c", vim.cmd.bnext);
vim.keymap.set("n", "<leader>z", vim.cmd.bprev);

vim.keymap.set("n", "<leader>p", 
function()
      local filename = vim.fn.expand('%:p')
      local url = string.gsub(filename, '/home/brendon/av', 'https://github.com/aurora-tech/av/tree/master/')
      print(url)
  end
);

vim.api.nvim_create_user_command("CopilotChatVisual", function(args)
    require("CopilotChat").ask(args.args, { selection = require("CopilotChat.select").visual })
end, { nargs = "*", range = true })

vim.keymap.set("x", "<leader>av", ":CopilotChatVisual")
vim.keymap.set("n", "<leader>ae", "<cmd>CopilotChatExplain<cr>")
vim.keymap.set("n", "<leader>at", "<cmd>CopilotChatTests<cr>")
vim.keymap.set("n", "<leader>ar", "<cmd>CopilotChatReview<cr>") 
vim.keymap.set("n", "<leader>aR", "<cmd>CopilotChatRefactor<cr>")

vim.keymap.set("n", "<leader>aq",
    function()
      local input = vim.fn.input("Quick Chat: ")
      if input ~= "" then
        require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
      end
    end
);
--
--vim.keymap.set("n", "<leader>cch",
--    function()
--      local actions = require("CopilotChat.actions")
--      require("CopilotChat.integrations.telescope").pick(actions.help_actions())
--    end
--)
--
---- Show prompts actions with telescope
--vim.keymap.set("n", "<leader>ccp",
--    function()
--      local actions = require("CopilotChat.actions")
--      require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
--    end
--)


vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])



