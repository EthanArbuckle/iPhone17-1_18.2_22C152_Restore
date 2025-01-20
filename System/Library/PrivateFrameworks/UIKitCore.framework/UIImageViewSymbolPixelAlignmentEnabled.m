@interface UIImageViewSymbolPixelAlignmentEnabled
@end

@implementation UIImageViewSymbolPixelAlignmentEnabled

void ___UIImageViewSymbolPixelAlignmentEnabled_block_invoke()
{
  if (_UIInternalPreferencesRevisionOnce != -1) {
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
  }
  int v0 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar < 1
    || (int v2 = _UIInternalPreference_UIImageViewPreferredSymbolPixelAlignmentBehavior,
        _UIInternalPreferencesRevisionVar == _UIInternalPreference_UIImageViewPreferredSymbolPixelAlignmentBehavior))
  {
    BOOL v1 = 0;
  }
  else
  {
    while (v0 >= v2)
    {
      _UIInternalPreferenceSync(v0, &_UIInternalPreference_UIImageViewPreferredSymbolPixelAlignmentBehavior, @"UIImageViewPreferredSymbolPixelAlignmentBehavior", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateInteger);
      BOOL v1 = 0;
      int v2 = _UIInternalPreference_UIImageViewPreferredSymbolPixelAlignmentBehavior;
      if (v0 == _UIInternalPreference_UIImageViewPreferredSymbolPixelAlignmentBehavior) {
        goto LABEL_5;
      }
    }
    BOOL v1 = qword_1EB257AB0 == 1;
  }
LABEL_5:
  byte_1EB25E682 = v1;
}

@end