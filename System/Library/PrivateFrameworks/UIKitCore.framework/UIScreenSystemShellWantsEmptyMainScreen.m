@interface UIScreenSystemShellWantsEmptyMainScreen
@end

@implementation UIScreenSystemShellWantsEmptyMainScreen

void ___UIScreenSystemShellWantsEmptyMainScreen_block_invoke()
{
  CFAllocatorRef Default = CFAllocatorGetDefault();
  v1 = SecTaskCreateFromSelf(Default);
  if (v1)
  {
    v2 = v1;
    id v3 = (id)SecTaskCopyValueForEntitlement(v1, @"com.apple.UIKit.system-shell-wants-empty-main-screen", 0);
    byte_1EB25C543 = [v3 BOOLValue];
    CFRelease(v2);
  }
}

@end