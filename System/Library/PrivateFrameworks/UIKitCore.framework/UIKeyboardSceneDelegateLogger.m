@interface UIKeyboardSceneDelegateLogger
@end

@implementation UIKeyboardSceneDelegateLogger

void ___UIKeyboardSceneDelegateLogger_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.UIKit", "KeyboardSceneDelegate");
  v1 = (void *)qword_1EB2604F8;
  qword_1EB2604F8 = (uint64_t)v0;
}

@end