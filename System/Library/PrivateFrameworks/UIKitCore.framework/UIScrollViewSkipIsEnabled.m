@interface UIScrollViewSkipIsEnabled
@end

@implementation UIScrollViewSkipIsEnabled

void ____UIScrollViewSkipIsEnabled_block_invoke()
{
  if (((_UIInternalPreferenceUsesDefault(&_UIInternalPreference_EnableUIScrollViewFrameSkip, @"EnableUIScrollViewFrameSkip", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) != 0|| byte_1EB2579E4)&& !_UIVariableFrameDurationEnabled())
  {
    id v1 = +[UIScreen mainScreen];
    [v1 _refreshRate];
    _MergedGlobals_116 = v0 < 0.01;
  }
  else
  {
    _MergedGlobals_116 = 0;
  }
}

@end