@interface UITextAssistantManager
@end

@implementation UITextAssistantManager

void __125___UITextAssistantManager_writingToolsCoordinator_replaceRange_inContext_proposedText_reason_animationParameters_completion___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) textViewportLayoutController];
  [v1 setNeedsLayout];
}

void __125___UITextAssistantManager_writingToolsCoordinator_replaceRange_inContext_proposedText_reason_animationParameters_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained cleanUpAnimatedTextLayoutInfoIfNecessary];
}

uint64_t __125___UITextAssistantManager_writingToolsCoordinator_replaceRange_inContext_proposedText_reason_animationParameters_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setProgress:");
}

uint64_t __125___UITextAssistantManager_writingToolsCoordinator_replaceRange_inContext_proposedText_reason_animationParameters_completion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) finalize];
}

void __103___UITextAssistantManager_writingToolsCoordinator_requestsUnderlinePathsForRange_inContext_completion___block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) identifier];
  [v1 updateForReflowedTextInContextWithIdentifier:v2];
}

void __112___UITextAssistantManager_writingToolsCoordinator_requestsPreviewForTextAnimation_ofRange_inContext_completion___block_invoke(void *a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 80));
  uint64_t v3 = a1[5];
  uint64_t v9 = *(void *)off_1E52D2048;
  v4 = +[UIColor blackColor];
  v10[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v6 = [WeakRetained _targetedPreviewForRange:v3 withRenderingAttributes:v5];
  uint64_t v7 = *(void *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

@end