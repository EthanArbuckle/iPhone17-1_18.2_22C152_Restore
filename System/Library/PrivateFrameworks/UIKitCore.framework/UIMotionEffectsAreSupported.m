@interface UIMotionEffectsAreSupported
@end

@implementation UIMotionEffectsAreSupported

void ___UIMotionEffectsAreSupported_block_invoke()
{
  v5 = (void *)MGCopyAnswer();
  _MergedGlobals_13_2 = [v5 BOOLValue];
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v1 = v5;
  if (has_internal_diagnostics)
  {
    v2 = _UIKitUserDefaults();
    v3 = [v2 objectForKey:@"UIMotionEffectsEnabled"];
    v4 = v3;
    if (v3 && [v3 BOOLValue]) {
      _MergedGlobals_13_2 = 1;
    }

    v1 = v5;
  }
}

@end