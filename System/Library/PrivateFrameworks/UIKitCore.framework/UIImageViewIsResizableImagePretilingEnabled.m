@interface UIImageViewIsResizableImagePretilingEnabled
@end

@implementation UIImageViewIsResizableImagePretilingEnabled

void ___UIImageViewIsResizableImagePretilingEnabled_block_invoke()
{
  if (_UIInternalPreferencesRevisionOnce != -1) {
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
  }
  int v0 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar < 1
    || (int v3 = _UIInternalPreference_UIImageViewAllowResizableImagePretiling,
        _UIInternalPreferencesRevisionVar == _UIInternalPreference_UIImageViewAllowResizableImagePretiling))
  {
    BOOL v1 = 0;
  }
  else
  {
    do
    {
      BOOL v1 = v0 < v3;
      if (v0 < v3) {
        break;
      }
      _UIInternalPreferenceSync(v0, &_UIInternalPreference_UIImageViewAllowResizableImagePretiling, @"UIImageViewAllowResizableImagePretiling", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
      int v3 = _UIInternalPreference_UIImageViewAllowResizableImagePretiling;
    }
    while (v0 != _UIInternalPreference_UIImageViewAllowResizableImagePretiling);
  }
  if (byte_1EB257ABC) {
    char v2 = v1;
  }
  else {
    char v2 = 0;
  }
  _MergedGlobals_1323 = v2;
}

@end