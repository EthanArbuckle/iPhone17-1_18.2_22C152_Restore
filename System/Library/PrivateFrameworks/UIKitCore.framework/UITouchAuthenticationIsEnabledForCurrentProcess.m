@interface UITouchAuthenticationIsEnabledForCurrentProcess
@end

@implementation UITouchAuthenticationIsEnabledForCurrentProcess

void ___UITouchAuthenticationIsEnabledForCurrentProcess_block_invoke()
{
  _UIMainBundleIdentifier();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (_UIInternalPreferencesRevisionOnce != -1) {
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
  }
  int v0 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar < 1
    || (int v4 = _UIInternalPreference_BundleIdentifierForViewServiceWantingTouchAuthentication,
        _UIInternalPreferencesRevisionVar == _UIInternalPreference_BundleIdentifierForViewServiceWantingTouchAuthentication))
  {
    v1 = 0;
  }
  else
  {
    while (v0 >= v4)
    {
      _UIInternalPreferenceSync(v0, &_UIInternalPreference_BundleIdentifierForViewServiceWantingTouchAuthentication, @"BundleIdentifierForViewServiceWantingTouchAuthentication", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateId);
      v1 = 0;
      int v4 = _UIInternalPreference_BundleIdentifierForViewServiceWantingTouchAuthentication;
      if (v0 == _UIInternalPreference_BundleIdentifierForViewServiceWantingTouchAuthentication) {
        goto LABEL_5;
      }
    }
    v1 = (void *)qword_1EB2576A8;
  }
LABEL_5:
  id v2 = v1;
  if ([MEMORY[0x1E4FB34C0] shouldAuthenticateServiceBundleId:v5])
  {
    char v3 = 1;
  }
  else if (v2)
  {
    char v3 = [v5 isEqualToString:v2];
  }
  else
  {
    char v3 = 0;
  }
  _MergedGlobals_1139 = v3;
}

@end