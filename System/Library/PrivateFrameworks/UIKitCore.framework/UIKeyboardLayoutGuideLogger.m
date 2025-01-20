@interface UIKeyboardLayoutGuideLogger
@end

@implementation UIKeyboardLayoutGuideLogger

void ___UIKeyboardLayoutGuideLogger_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.UIKit", "KeyboardLayoutGuide");
  v1 = (void *)_MergedGlobals_3_27;
  _MergedGlobals_3_27 = (uint64_t)v0;
}

@end