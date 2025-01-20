@interface UITabBarControllerWantsFloatingTabBar
@end

@implementation UITabBarControllerWantsFloatingTabBar

void ___UITabBarControllerWantsFloatingTabBar_block_invoke()
{
  if (_UIInternalPreferencesRevisionOnce != -1) {
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
  }
  int v0 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar < 1
    || (int v6 = _UIInternalPreference_IgnoreFloatingTabBarLinkCheck,
        _UIInternalPreferencesRevisionVar == _UIInternalPreference_IgnoreFloatingTabBarLinkCheck))
  {
    BOOL v1 = 0;
  }
  else
  {
    do
    {
      BOOL v1 = v0 < v6;
      if (v0 < v6) {
        break;
      }
      _UIInternalPreferenceSync(v0, &_UIInternalPreference_IgnoreFloatingTabBarLinkCheck, @"IgnoreFloatingTabBarLinkCheck", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
      int v6 = _UIInternalPreference_IgnoreFloatingTabBarLinkCheck;
    }
    while (v0 != _UIInternalPreference_IgnoreFloatingTabBarLinkCheck);
  }
  if (byte_1E8FD508C) {
    BOOL v2 = v1;
  }
  else {
    BOOL v2 = 0;
  }
  _UIMainBundleIdentifier();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((dyld_program_sdk_at_least() & 1) != 0 || v2)
  {
    v3 = _UIKitUserDefaults();
    v4 = [v3 objectForKey:@"UseFloatingTabBar"];

    if (v4)
    {
      char v5 = [v4 BOOLValue];
    }
    else if (_os_feature_enabled_impl())
    {
      char v5 = 1;
    }
    else
    {
      char v5 = _os_feature_enabled_impl();
    }
    _MergedGlobals_43 = v5;
  }
  if ([v7 isEqualToString:@"com.apple.DocumentManagerUICore.Service"]) {
    _MergedGlobals_43 = _UIDocumentViewControllerWantsUIPDocumentLanding();
  }
}

@end