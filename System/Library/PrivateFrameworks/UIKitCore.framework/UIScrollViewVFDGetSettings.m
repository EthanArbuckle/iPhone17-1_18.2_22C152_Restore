@interface UIScrollViewVFDGetSettings
@end

@implementation UIScrollViewVFDGetSettings

uint64_t ___UIScrollViewVFDGetSettings_block_invoke()
{
  uint64_t v0 = _UIDeviceNativeUserInterfaceIdiomIgnoringClassic();
  if (_UIInternalPreferenceUsesDefault((int *)&_MergedGlobals_919, @"ScrollViewVFDStaticTable", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateId))v1 = 0; {
  else
  }
    v1 = (void *)qword_1EB2578D0;
  v2 = _UIScrollViewVFDTableFromString(v1);
  if (v0 == 1) {
    v3 = &_UIScrollViewVFDDefaultConfig_iPad;
  }
  else {
    v3 = &_UIScrollViewVFDDefaultConfig_iPhone;
  }
  if (v0 == 1) {
    v4 = &unk_1E5308B00;
  }
  else {
    v4 = &unk_1E5308B28;
  }
  if (v2) {
    v3 = v2;
  }
  qword_1EB259700 = (uint64_t)v3;
  if (_UIInternalPreferenceUsesDefault((int *)algn_1EB2578D8, @"ScrollViewVFDDynamicTable", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateId))v5 = 0; {
  else
  }
    v5 = (void *)qword_1EB2578E0;
  v6 = _UIScrollViewVFDTableFromString(v5);
  if (v6) {
    uint64_t v7 = (uint64_t)v6;
  }
  else {
    uint64_t v7 = (uint64_t)v4;
  }
  qword_1EB259708 = v7;
  uint64_t result = _UIInternalPreferenceUsesDefault((int *)algn_1EB2578E8, @"ScrollViewVFDStaticRateRangeMinFrames", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateInteger);
  uint64_t v9 = qword_1EB2578F0;
  if (result) {
    uint64_t v9 = -1;
  }
  if (v9 < 0) {
    LODWORD(v9) = 5;
  }
  _MergedGlobals_34 = v9;
  return result;
}

@end