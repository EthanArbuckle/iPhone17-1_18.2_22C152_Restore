@interface UIALAShouldAdjustBaselineAlignmentConstraintsForViewsWithoutBaselineInformation
@end

@implementation UIALAShouldAdjustBaselineAlignmentConstraintsForViewsWithoutBaselineInformation

void ___UIALAShouldAdjustBaselineAlignmentConstraintsForViewsWithoutBaselineInformation_block_invoke()
{
  if (dyld_program_sdk_at_least())
  {
    v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    id v6 = [v0 valueForKey:@"UIStackViewHorizontalBaselineAlignmentAdjustsForAbsentBaselineInformation"];

    v1 = v6;
    if (v6)
    {
      char v2 = 1;
    }
    else
    {
      if (_UIInternalPreferencesRevisionOnce != -1)
      {
        dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
        v1 = 0;
      }
      if (_UIInternalPreferencesRevisionVar < 1
        || (int v4 = _UIInternalPreference_UIStackViewHorizontalBaselineAlignmentAdjustsForAbsentBaselineInformation,
            _UIInternalPreferencesRevisionVar == _UIInternalPreference_UIStackViewHorizontalBaselineAlignmentAdjustsForAbsentBaselineInformation))
      {
        BOOL v3 = 1;
      }
      else
      {
        int v5 = _UIInternalPreferencesRevisionVar;
        while (1)
        {
          BOOL v3 = v5 >= v4;
          if (v5 < v4) {
            break;
          }
          _UIInternalPreferenceSync(v5, &_UIInternalPreference_UIStackViewHorizontalBaselineAlignmentAdjustsForAbsentBaselineInformation, @"UIStackViewHorizontalBaselineAlignmentAdjustsForAbsentBaselineInformation", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
          int v4 = _UIInternalPreference_UIStackViewHorizontalBaselineAlignmentAdjustsForAbsentBaselineInformation;
          v1 = 0;
          if (v5 == _UIInternalPreference_UIStackViewHorizontalBaselineAlignmentAdjustsForAbsentBaselineInformation) {
            goto LABEL_9;
          }
        }
        v1 = 0;
      }
LABEL_9:
      if (byte_1EB2579CC) {
        char v2 = 1;
      }
      else {
        char v2 = v3;
      }
    }
    _MergedGlobals_17_5 = v2;
  }
}

@end