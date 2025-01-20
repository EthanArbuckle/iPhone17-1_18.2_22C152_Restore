@interface _UILabelVisualStyle_tvOS
- (BOOL)shouldDelayStartMarquee;
- (BOOL)shouldDisableUpdateTextColorOnTraitCollectionChangeForAttributedString:(id)a3 attributes:(id)a4;
- (BOOL)updatesTextColorOnUserInterfaceStyleChanges;
- (id)defaultFont;
- (void)actionsForDeallocationOfLabel:(id)a3;
- (void)actionsForInitializationOfLabel:(id)a3;
@end

@implementation _UILabelVisualStyle_tvOS

- (id)defaultFont
{
  return (id)[off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleHeadline"];
}

- (void)actionsForInitializationOfLabel:(id)a3
{
  id v11 = a3;
  if (!_os_feature_enabled_impl()) {
    goto LABEL_10;
  }
  if (_UIInternalPreferencesRevisionOnce != -1) {
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
  }
  int v4 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar >= 1)
  {
    int v5 = _UIInternalPreference_UILabelDisableTVAnimationsOnResignActive;
    if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_UILabelDisableTVAnimationsOnResignActive)
    {
      while (v4 >= v5)
      {
        _UIInternalPreferenceSync(v4, &_UIInternalPreference_UILabelDisableTVAnimationsOnResignActive, @"UILabelDisableTVAnimationsOnResignActive", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
        int v5 = _UIInternalPreference_UILabelDisableTVAnimationsOnResignActive;
        if (v4 == _UIInternalPreference_UILabelDisableTVAnimationsOnResignActive) {
          goto LABEL_11;
        }
      }
      if (byte_1E8FD5564)
      {
LABEL_10:
        v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v6 addObserver:v11 selector:sel__applicationWillResignActiveNotification_ name:@"UIApplicationWillResignActiveNotification" object:UIApp];
        [v6 addObserver:v11 selector:sel__applicationDidBecomeActiveNotification_ name:@"UIApplicationDidBecomeActiveNotification" object:UIApp];
      }
    }
  }
LABEL_11:
  v7 = [(_UILabelVisualStyle_tvOS *)self defaultFont];
  [v11 setFont:v7];

  v8 = +[UIColor blackColor];
  [v11 _setFallbackTextColor:v8 forUserInterfaceStyle:1];

  v9 = +[UIColor whiteColor];
  [v11 _setFallbackTextColor:v9 forUserInterfaceStyle:2];

  v10 = +[UIColor whiteColor];
  [v11 _setFallbackTextColor:v10 forUserInterfaceStyle:1000];
}

- (void)actionsForDeallocationOfLabel:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28EB8];
  id v4 = a3;
  id v5 = [v3 defaultCenter];
  [v5 removeObserver:v4 name:@"UIApplicationWillResignActiveNotification" object:UIApp];
  [v5 removeObserver:v4 name:@"UIApplicationDidBecomeActiveNotification" object:UIApp];
}

- (BOOL)updatesTextColorOnUserInterfaceStyleChanges
{
  return dyld_program_sdk_at_least();
}

- (BOOL)shouldDelayStartMarquee
{
  return 1;
}

- (BOOL)shouldDisableUpdateTextColorOnTraitCollectionChangeForAttributedString:(id)a3 attributes:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5 && (_UILabelVisualStyleAttributedStringContainsForegroundColorAttribute(v5) & 1) != 0)
  {
    BOOL v7 = 1;
  }
  else if (v6)
  {
    v8 = [v6 objectForKeyedSubscript:*(void *)off_1E52D2048];
    BOOL v7 = v8 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

@end