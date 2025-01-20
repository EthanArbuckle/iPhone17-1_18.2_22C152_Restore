@interface _SBActiveDisplayKeyboardFocusTracker
- (SBWindowScene)activeWindowScene;
@end

@implementation _SBActiveDisplayKeyboardFocusTracker

- (SBWindowScene)activeWindowScene
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = +[SBMainWorkspace sharedInstanceIfExists];
  v3 = [v2 keyboardFocusController];

  v4 = [v3 windowSceneWithFocus];
  if ([v4 isInvalidated])
  {
    v5 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      v8 = v3;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Trying to explaining invalid activeWindowScene: %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
  return (SBWindowScene *)v4;
}

@end