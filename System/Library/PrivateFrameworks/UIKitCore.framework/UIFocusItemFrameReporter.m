@interface UIFocusItemFrameReporter
@end

@implementation UIFocusItemFrameReporter

uint64_t __67___UIFocusItemFrameReporter__reportFocusFrameUpdateForGlobalFrame___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setScreenFocusedFrame:", a1[4], a1[5], a1[6], a1[7]);
}

void __58___UIFocusItemFrameReporter__scheduleRepeatingFrameUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reportFocusFrameForCurrentlyFocusedItem];
}

@end