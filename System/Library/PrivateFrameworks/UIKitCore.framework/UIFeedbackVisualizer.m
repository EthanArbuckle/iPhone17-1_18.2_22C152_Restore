@interface UIFeedbackVisualizer
@end

@implementation UIFeedbackVisualizer

void __41___UIFeedbackVisualizer_sharedVisualizer__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1EB2604B8;
  qword_1EB2604B8 = (uint64_t)v1;
}

void __57___UIFeedbackVisualizer_showVisualForFeedback_withDelay___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _showVisualForFeedback:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 40) visualizerSources];
  [v2 removeObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
}

uint64_t __48___UIFeedbackVisualizer__showVisualForFeedback___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperlayer];
}

uint64_t __72___UIFeedbackVisualizer_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateEngine:*(void *)(a1 + 40)];
}

@end