@interface UITextInteractionEditMenuAssistant
@end

@implementation UITextInteractionEditMenuAssistant

void __67___UITextInteractionEditMenuAssistant_menuElementsForReplacements___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 sender];
  if ([v3 canPerformAction:sel_replace_ withSender:v3])
  {
    [v3 replace:*(void *)(a1 + 32)];
    [*(id *)(a1 + 32) didReplaceTextWithTarget:v3];
  }
}

void __93___UITextInteractionEditMenuAssistant_showReplacementsWithGenerator_forDictation_afterDelay___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v2 calculateReplacementsWithGenerator:v3 andShowAfterDelay:0.0];
  [v4 returnExecutionToParent];
}

void __93___UITextInteractionEditMenuAssistant__showCommandsWithReplacements_forDictation_afterDelay___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) interactionAssistant];
  uint64_t v3 = [v2 view];

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  if (![WeakRetained viewConformsToAsynchronousInteractionProtocol])
  {

    goto LABEL_5;
  }
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0)
  {
LABEL_5:
    [*(id *)(a1 + 32) _showCommandsWithReplacements:*(void *)(a1 + 40) isForContextMenu:0 forDictation:*(unsigned __int8 *)(a1 + 48) arrowDirection:0];
    goto LABEL_6;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __93___UITextInteractionEditMenuAssistant__showCommandsWithReplacements_forDictation_afterDelay___block_invoke_2;
  v7[3] = &unk_1E52EA7D8;
  v6 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v6;
  char v9 = *(unsigned char *)(a1 + 48);
  [v3 requestPreferredArrowDirectionForEditMenuWithCompletionHandler:v7];

LABEL_6:
}

uint64_t __93___UITextInteractionEditMenuAssistant__showCommandsWithReplacements_forDictation_afterDelay___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(a2 - 1) >= 4) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = a2;
  }
  return [*(id *)(a1 + 32) _showCommandsWithReplacements:*(void *)(a1 + 40) isForContextMenu:0 forDictation:*(unsigned __int8 *)(a1 + 48) arrowDirection:v2];
}

uint64_t __114___UITextInteractionEditMenuAssistant__showCommandsWithReplacements_isForContextMenu_forDictation_arrowDirection___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _isNoReplacementsFoundItem];
}

@end