@interface UITapticEngine
@end

@implementation UITapticEngine

uint64_t __40___UITapticEngine_prepareUsingFeedback___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) prepareUsingFeedback:*(void *)(a1 + 40)];
}

uint64_t __36___UITapticEngine_endUsingFeedback___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) endUsingFeedback:*(void *)(a1 + 40)];
}

uint64_t __35___UITapticEngine_actuateFeedback___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) actuateFeedback:*(void *)(a1 + 40)];
}

uint64_t __35___UITapticEngine_actuateFeedback___block_invoke_2(uint64_t a1, int a2)
{
  if (a2) {
    [*(id *)(*(void *)(a1 + 32) + 16) transitionToState:*(void *)(a1 + 40) ended:1];
  }
  v3 = *(void **)(*(void *)(a1 + 32) + 16);
  return [v3 deactivate];
}

@end