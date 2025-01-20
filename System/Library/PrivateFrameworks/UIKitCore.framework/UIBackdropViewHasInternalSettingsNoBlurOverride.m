@interface UIBackdropViewHasInternalSettingsNoBlurOverride
@end

@implementation UIBackdropViewHasInternalSettingsNoBlurOverride

void ___UIBackdropViewHasInternalSettingsNoBlurOverride_block_invoke()
{
  if (os_variant_has_internal_diagnostics())
  {
    _UIKitPreferencesOnce();
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    v0 = [v2 objectForKey:@"UIBackdropViewNoBlur"];
    v1 = v0;
    if (v0 && [v0 BOOLValue]) {
      byte_1EB25E649 = 1;
    }
  }
}

@end