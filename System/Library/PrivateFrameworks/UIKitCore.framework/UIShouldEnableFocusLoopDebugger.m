@interface UIShouldEnableFocusLoopDebugger
@end

@implementation UIShouldEnableFocusLoopDebugger

void ___UIShouldEnableFocusLoopDebugger_block_invoke()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v1 = [v0 BOOLForKey:@"UIFocusLoopDebuggerEnabled"];

  _MergedGlobals_1274 = (byte_1EB2579AC != 0) & ~_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UIFocusLoopDebuggerEnabled, @"UIFocusLoopDebuggerEnabled") | v1;
  if (v1)
  {
    v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIFocus", &qword_1EB2648E8) + 8);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v3 = 136315138;
      v4 = "UIFocusLoopDebuggerEnabled";
      _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_ERROR, "Focus loop debugger enabled via -%s launch argument.", (uint8_t *)&v3, 0xCu);
    }
  }
}

@end