@interface UIFocusBehaviorAPIBehavior
@end

@implementation UIFocusBehaviorAPIBehavior

void ___UIFocusBehaviorAPIBehavior_block_invoke()
{
  v0 = +[_UIApplicationInfoParser mainBundleInfoParser];
  char v1 = [v0 forcesDefaultFocusAppearance];

  if (v1)
  {
    char v2 = 0;
  }
  else
  {
    char v3 = _UIInternalPreferenceUsesDefault_0(&_UIInternalPreference__UIFocusDefaultAppearanceEnabled, @"_UIFocusDefaultAppearanceEnabled");
    if (byte_1E8FD54F4) {
      char v2 = v3;
    }
    else {
      char v2 = 1;
    }
  }
  _UIFocusBehaviorAPIBehavior_apiFocusBehavior = v2;
}

@end