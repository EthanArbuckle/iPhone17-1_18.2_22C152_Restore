@interface UIDebugOrTestUserInterfaceStyle
@end

@implementation UIDebugOrTestUserInterfaceStyle

void ___UIDebugOrTestUserInterfaceStyle_block_invoke()
{
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  byte_1EB25B50B = has_internal_diagnostics;
  if (has_internal_diagnostics)
  {
    v1 = [[_UIDefaultsInterfaceStyleObserver alloc] initWithNotificationName:@"_UIDebugOrTestUserInterfaceStyleChangedNotification" darwinNotification:"com.apple.UIKit.OverrideUserInterfaceStyle"];
    v2 = (void *)qword_1EB25B8E0;
    qword_1EB25B8E0 = (uint64_t)v1;

    v3 = (void *)qword_1EB25B8E0;
    v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v3 observeUserDefaults:v4 key:@"OverrideUserInterfaceStyle"];

    v5 = (void *)qword_1EB25B8E0;
    _UIKitUserDefaults();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [v5 observeUserDefaults:v6 key:@"OverrideUserInterfaceStyle"];
  }
}

@end