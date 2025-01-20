@interface UIShouldEnableStatusDebugOverlay
@end

@implementation UIShouldEnableStatusDebugOverlay

void ___UIShouldEnableStatusDebugOverlay_block_invoke()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v1 = [v0 BOOLForKey:@"UIFocusStatusDebugOverlayEnabled"];

  if (_UIInternalPreferencesRevisionOnce != -1) {
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
  }
  int v2 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar < 1
    || (int v6 = _UIInternalPreference_UIFocusStatusDebugOverlayEnabled,
        _UIInternalPreferencesRevisionVar == _UIInternalPreference_UIFocusStatusDebugOverlayEnabled))
  {
    BOOL v3 = 0;
  }
  else
  {
    do
    {
      BOOL v3 = v2 < v6;
      if (v2 < v6) {
        break;
      }
      _UIInternalPreferenceSync(v2, &_UIInternalPreference_UIFocusStatusDebugOverlayEnabled, @"UIFocusStatusDebugOverlayEnabled", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
      int v6 = _UIInternalPreference_UIFocusStatusDebugOverlayEnabled;
    }
    while (v2 != _UIInternalPreference_UIFocusStatusDebugOverlayEnabled);
  }
  if (byte_1EB257684) {
    BOOL v4 = v3;
  }
  else {
    BOOL v4 = 0;
  }
  _MergedGlobals_1116 = v4 | v1;
  if (v1)
  {
    v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIFocus", &qword_1EB261760) + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      v8 = "UIFocusStatusDebugOverlayEnabled";
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "Focus debugging overlay enabled via -%s launch argument.", (uint8_t *)&v7, 0xCu);
    }
  }
}

@end