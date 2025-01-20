@interface UIFocusEngineCommonEnvironmentScrollableContainerForItems
@end

@implementation UIFocusEngineCommonEnvironmentScrollableContainerForItems

uint64_t ___UIFocusEngineCommonEnvironmentScrollableContainerForItems_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = ___UIFocusEngineCommonEnvironmentScrollableContainerForItems_block_invoke_2;
  v9[3] = &unk_1E52EDEA8;
  id v5 = v3;
  id v10 = v5;
  if ([v4 indexOfObjectPassingTest:v9] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t CanScroll = 0;
  }
  else
  {
    v7 = [v5 scrollableContainer];
    uint64_t CanScroll = _UIFocusEngineScrollableContainerCanScroll(v7);
  }
  return CanScroll;
}

BOOL ___UIFocusEngineCommonEnvironmentScrollableContainerForItems_block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 scrollableContainer];
  v4 = [*(id *)(a1 + 32) scrollableContainer];
  BOOL v5 = v3 == v4;

  return v5;
}

@end