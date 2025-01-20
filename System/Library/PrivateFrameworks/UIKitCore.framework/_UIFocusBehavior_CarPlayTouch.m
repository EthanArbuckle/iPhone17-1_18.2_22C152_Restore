@interface _UIFocusBehavior_CarPlayTouch
+ (id)sharedInstance;
- (BOOL)searchBarTextFieldCanBecomeFocused;
- (int64_t)focusDeferral;
@end

@implementation _UIFocusBehavior_CarPlayTouch

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47___UIFocusBehavior_CarPlayTouch_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB264A68 != -1) {
    dispatch_once(&qword_1EB264A68, block);
  }
  v2 = (void *)_MergedGlobals_1286;
  return v2;
}

- (int64_t)focusDeferral
{
  if (_UIInternalPreferencesRevisionOnce != -1) {
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
  }
  int v2 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar < 1
    || (int v5 = _UIInternalPreference_CarPlayFocusNewDeferralBehavior,
        _UIInternalPreferencesRevisionVar == _UIInternalPreference_CarPlayFocusNewDeferralBehavior))
  {
    BOOL v3 = 0;
  }
  else
  {
    do
    {
      BOOL v3 = v2 < v5;
      if (v2 < v5) {
        break;
      }
      _UIInternalPreferenceSync(v2, &_UIInternalPreference_CarPlayFocusNewDeferralBehavior, @"CarPlayFocusNewDeferralBehavior", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
      int v5 = _UIInternalPreference_CarPlayFocusNewDeferralBehavior;
    }
    while (v2 != _UIInternalPreference_CarPlayFocusNewDeferralBehavior);
  }
  if (v3 && byte_1E8FD550C != 0) {
    return 1;
  }
  else {
    return 4;
  }
}

- (BOOL)searchBarTextFieldCanBecomeFocused
{
  return 1;
}

@end