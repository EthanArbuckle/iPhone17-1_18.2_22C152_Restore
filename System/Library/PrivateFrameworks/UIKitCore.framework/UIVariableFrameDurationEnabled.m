@interface UIVariableFrameDurationEnabled
@end

@implementation UIVariableFrameDurationEnabled

void ___UIVariableFrameDurationEnabled_block_invoke()
{
  if (qword_1EB262198 != -1) {
    dispatch_once(&qword_1EB262198, &__block_literal_global_421);
  }
  if (_MergedGlobals_1183[0])
  {
    if (_UIInternalPreferenceUsesDefault(&_UIInternalPreference_UpdateAdaptiveRateNeeded, @"UpdateAdaptiveRateNeeded", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool))
    {
      v0 = &byte_1EB26218B;
      if (qword_1EB2621B0 != -1) {
        dispatch_once(&qword_1EB2621B0, &__block_literal_global_13_1);
      }
    }
    else
    {
      v0 = &byte_1EB2577B4;
    }
    byte_1EB262189 = *v0;
  }
}

@end