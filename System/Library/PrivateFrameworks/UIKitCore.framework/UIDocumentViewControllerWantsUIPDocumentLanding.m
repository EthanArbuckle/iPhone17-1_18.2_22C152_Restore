@interface UIDocumentViewControllerWantsUIPDocumentLanding
@end

@implementation UIDocumentViewControllerWantsUIPDocumentLanding

void ___UIDocumentViewControllerWantsUIPDocumentLanding_block_invoke()
{
  v0 = +[UITraitCollection _fallbackTraitCollection]();
  unint64_t v1 = [v0 userInterfaceIdiom];

  _MergedGlobals_19_4 = v1 < 2;
  char v2 = _os_feature_enabled_impl();
  if (_MergedGlobals_19_4) {
    char v3 = v2;
  }
  else {
    char v3 = 0;
  }
  _MergedGlobals_19_4 = v3;
  if (_UIInternalPreferencesRevisionOnce != -1) {
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
  }
  int v4 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar < 1
    || (int v7 = _UIInternalPreference_ForceDocumentViewControllerDocumentLanding,
        _UIInternalPreferencesRevisionVar == _UIInternalPreference_ForceDocumentViewControllerDocumentLanding))
  {
    BOOL v5 = 0;
  }
  else
  {
    do
    {
      BOOL v5 = v4 < v7;
      if (v4 < v7) {
        break;
      }
      _UIInternalPreferenceSync(v4, &_UIInternalPreference_ForceDocumentViewControllerDocumentLanding, @"ForceDocumentViewControllerDocumentLanding", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
      int v7 = _UIInternalPreference_ForceDocumentViewControllerDocumentLanding;
    }
    while (v4 != _UIInternalPreference_ForceDocumentViewControllerDocumentLanding);
  }
  if (byte_1E8FD5274) {
    BOOL v6 = v5;
  }
  else {
    BOOL v6 = 0;
  }
  _MergedGlobals_19_4 |= v6;
}

@end