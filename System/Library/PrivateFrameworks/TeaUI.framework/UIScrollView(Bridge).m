@interface UIScrollView(Bridge)
- (uint64_t)ts_isScrolling;
- (uint64_t)ts_scrollToTop:()Bridge;
- (uint64_t)ts_scrollToTop:()Bridge dismissKeyboard:;
- (uint64_t)ts_setIndicatorInsetAdjustmentBehaviorAlways;
- (uint64_t)ts_setIndicatorInsetAdjustmentBehaviorAutomatic;
- (uint64_t)ts_setIndicatorInsetAdjustmentBehaviorNever;
@end

@implementation UIScrollView(Bridge)

- (uint64_t)ts_isScrolling
{
  if (([a1 isDragging] & 1) != 0
    || ([a1 isDecelerating] & 1) != 0
    || ([a1 _isAnimatingScrollTest] & 1) != 0)
  {
    return 1;
  }
  return [a1 _isAnimatingScroll];
}

- (uint64_t)ts_scrollToTop:()Bridge
{
  uint64_t v5 = [a1 scrollsToTop];
  [a1 setScrollsToTop:1];
  uint64_t v6 = [a1 _scrollToTopIfPossible:a3];
  [a1 setScrollsToTop:v5];
  if ((v6 & 1) == 0)
  {
    [a1 adjustedContentInset];
    objc_msgSend(a1, "setContentOffset:animated:", a3, 0.0, -v7);
  }
  return v6;
}

- (uint64_t)ts_scrollToTop:()Bridge dismissKeyboard:
{
  if ([MEMORY[0x1E4FB18E0] isOnScreen])
  {
    char v7 = [MEMORY[0x1E4FB18E0] isInHardwareKeyboardMode];
    if (a4)
    {
      if ((v7 & 1) == 0)
      {
        v8 = [MEMORY[0x1E4FB1438] sharedApplication];
        [v8 sendAction:sel_resignFirstResponder to:0 from:0 forEvent:0];
      }
    }
  }
  return objc_msgSend(a1, "ts_scrollToTop:", a3);
}

- (uint64_t)ts_setIndicatorInsetAdjustmentBehaviorNever
{
  return [a1 _setIndicatorInsetAdjustmentBehavior:2];
}

- (uint64_t)ts_setIndicatorInsetAdjustmentBehaviorAutomatic
{
  return [a1 _setIndicatorInsetAdjustmentBehavior:0];
}

- (uint64_t)ts_setIndicatorInsetAdjustmentBehaviorAlways
{
  return [a1 _setIndicatorInsetAdjustmentBehavior:1];
}

@end