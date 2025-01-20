@interface UIAlertControllerShimPresenterWindow
@end

@implementation UIAlertControllerShimPresenterWindow

uint64_t __89___UIAlertControllerShimPresenterWindow_presentAlertController_animated_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

@end