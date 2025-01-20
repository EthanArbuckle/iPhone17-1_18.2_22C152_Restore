@interface UIOShowTouchAction
@end

@implementation UIOShowTouchAction

uint64_t __55___UIOShowTouchAction_TestingOnly__removeIndicatorView__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) setAlpha:0.0];
}

uint64_t __55___UIOShowTouchAction_TestingOnly__removeIndicatorView__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) removeFromSuperview];
}

uint64_t __63___UIOShowTouchAction_TestingOnly_performActionFromConnection___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 40);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v5];
  return [*(id *)(*(void *)(a1 + 32) + 40) setAlpha:1.0];
}

uint64_t __63___UIOShowTouchAction_TestingOnly_performActionFromConnection___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeIndicatorView];
}

@end