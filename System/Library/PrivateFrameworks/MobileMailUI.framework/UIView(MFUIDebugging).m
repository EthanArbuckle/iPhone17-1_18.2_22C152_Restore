@interface UIView(MFUIDebugging)
- (uint64_t)mf_activateDebugModeIfEnabled;
- (uint64_t)mf_debugModeEnabled;
- (void)mf_enableDebugModeInView;
@end

@implementation UIView(MFUIDebugging)

- (uint64_t)mf_activateDebugModeIfEnabled
{
  uint64_t result = objc_msgSend(a1, "mf_debugModeEnabled");
  if (result)
  {
    return objc_msgSend(a1, "mf_enableDebugModeInView");
  }
  return result;
}

- (uint64_t)mf_debugModeEnabled
{
  v0 = +[MFInternalSettingsCache sharedCache];
  uint64_t v1 = [v0 UIDebuggingEnabled];

  return v1;
}

- (void)mf_enableDebugModeInView
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (objc_opt_respondsToSelector()) {
    [a1 _setDrawsDebugBaselines:1];
  }
  id v2 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.25];
  uint64_t v3 = [v2 CGColor];
  v4 = [a1 layer];
  [v4 setBorderColor:v3];

  v5 = [a1 layer];
  [v5 setBorderWidth:1.0];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v6 = objc_msgSend(a1, "subviews", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "mf_enableDebugModeInView");
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

@end