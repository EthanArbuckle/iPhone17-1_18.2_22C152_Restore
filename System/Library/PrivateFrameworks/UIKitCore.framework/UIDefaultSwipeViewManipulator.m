@interface UIDefaultSwipeViewManipulator
@end

@implementation UIDefaultSwipeViewManipulator

uint64_t __84___UIDefaultSwipeViewManipulator_moveSwipedView_atIndexPath_withSwipeInfo_animator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

@end