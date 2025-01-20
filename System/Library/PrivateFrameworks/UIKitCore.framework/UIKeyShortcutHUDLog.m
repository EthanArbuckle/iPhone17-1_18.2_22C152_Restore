@interface UIKeyShortcutHUDLog
@end

@implementation UIKeyShortcutHUDLog

void ___UIKeyShortcutHUDLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.UIKit", "KeyShortcutHUD");
  v1 = (void *)qword_1EB261780;
  qword_1EB261780 = (uint64_t)v0;
}

@end