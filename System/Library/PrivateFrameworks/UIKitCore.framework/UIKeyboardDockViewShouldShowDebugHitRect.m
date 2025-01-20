@interface UIKeyboardDockViewShouldShowDebugHitRect
@end

@implementation UIKeyboardDockViewShouldShowDebugHitRect

uint64_t ___UIKeyboardDockViewShouldShowDebugHitRect_block_invoke()
{
  v0 = +[UIKeyboardPreferencesController sharedPreferencesController];
  v1 = [v0 valueForPreferenceKey:@"ShowDockItemTouchArea"];
  char v2 = [v1 BOOLValue];

  uint64_t result = os_variant_has_internal_diagnostics();
  if (!result) {
    char v2 = 0;
  }
  _MergedGlobals_13_0 = v2;
  return result;
}

@end