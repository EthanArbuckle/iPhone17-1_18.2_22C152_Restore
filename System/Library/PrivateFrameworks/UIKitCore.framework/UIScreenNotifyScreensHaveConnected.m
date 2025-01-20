@interface UIScreenNotifyScreensHaveConnected
@end

@implementation UIScreenNotifyScreensHaveConnected

uint64_t ___UIScreenNotifyScreensHaveConnected_block_invoke()
{
  return +[UIApplication _screensHaveConnected];
}

@end