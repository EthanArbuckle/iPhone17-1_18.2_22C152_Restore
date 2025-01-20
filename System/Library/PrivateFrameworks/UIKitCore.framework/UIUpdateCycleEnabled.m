@interface UIUpdateCycleEnabled
@end

@implementation UIUpdateCycleEnabled

void ___UIUpdateCycleEnabled_block_invoke()
{
  if (_UIInternalPreferenceUsesDefault(&_UIInternalPreference_UpdateCycleEnabled, @"UpdateCycleEnabled", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool))
  {
    v0 = &byte_1EB26218A;
    if (qword_1EB2621B0 != -1) {
      dispatch_once(&qword_1EB2621B0, &__block_literal_global_13_1);
    }
  }
  else
  {
    v0 = &byte_1EB2577AC;
  }
  _MergedGlobals_1183[0] = *v0;
}

@end