@interface WFSystemSurfaceWorkflowStatusRegistry
- (BOOL)setStatus:(unint64_t)a3 forSystemSurface:(unint64_t)a4;
- (BOOL)setStatusForServicesWorkflows:(unint64_t)a3;
- (BOOL)setStatusForShareSheetWorkflows:(unint64_t)a3;
- (NSUserDefaults)shortcutsUserDefaults;
- (WFSystemSurfaceWorkflowStatusRegistry)init;
- (unint64_t)statusForServicesWorkflows;
- (unint64_t)statusForShareSheetWorkflows;
- (unint64_t)statusForSystemSurface:(unint64_t)a3;
@end

@implementation WFSystemSurfaceWorkflowStatusRegistry

- (WFSystemSurfaceWorkflowStatusRegistry)init
{
  v7.receiver = self;
  v7.super_class = (Class)WFSystemSurfaceWorkflowStatusRegistry;
  v2 = [(WFSystemSurfaceWorkflowStatusRegistry *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.siri.shortcuts"];
    shortcutsUserDefaults = v2->_shortcutsUserDefaults;
    v2->_shortcutsUserDefaults = (NSUserDefaults *)v3;

    v5 = v2;
  }

  return v2;
}

- (void).cxx_destruct
{
}

- (NSUserDefaults)shortcutsUserDefaults
{
  return self->_shortcutsUserDefaults;
}

- (BOOL)setStatusForServicesWorkflows:(unint64_t)a3
{
  return 0;
}

- (unint64_t)statusForServicesWorkflows
{
  return 0;
}

- (BOOL)setStatusForShareSheetWorkflows:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v10 = 0;
  BOOL v5 = WFCanAccessUserDefaultsDomain(&v10);
  id v6 = v10;
  objc_super v7 = v6;
  if (v5)
  {
    v8 = [(WFSystemSurfaceWorkflowStatusRegistry *)self shortcutsUserDefaults];
    [v8 setBool:a3 == 2 forKey:@"ShareSheetShortcutsPresent"];
LABEL_6:

    goto LABEL_7;
  }
  if (v6)
  {
    v8 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v12 = "-[WFSystemSurfaceWorkflowStatusRegistry setStatusForShareSheetWorkflows:]";
      __int16 v13 = 2114;
      v14 = @"com.apple.siri.shortcuts";
      __int16 v15 = 2114;
      v16 = v7;
      _os_log_impl(&dword_1B3C5C000, v8, OS_LOG_TYPE_ERROR, "%s Failed to check whether or not we have access to %{public}@: %{public}@", buf, 0x20u);
    }
    goto LABEL_6;
  }
LABEL_7:

  return v5;
}

- (unint64_t)statusForShareSheetWorkflows
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v11 = 0;
  BOOL v3 = WFCanAccessUserDefaultsDomain(&v11);
  id v4 = v11;
  BOOL v5 = v4;
  if (v3)
  {
    id v6 = [(WFSystemSurfaceWorkflowStatusRegistry *)self shortcutsUserDefaults];
    int v7 = [v6 BOOLForKey:@"ShareSheetShortcutsPresent"];

    if (v7) {
      unint64_t v8 = 2;
    }
    else {
      unint64_t v8 = 1;
    }
  }
  else
  {
    if (v4)
    {
      v9 = getWFVoiceShortcutClientLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v13 = "-[WFSystemSurfaceWorkflowStatusRegistry statusForShareSheetWorkflows]";
        __int16 v14 = 2114;
        __int16 v15 = @"com.apple.siri.shortcuts";
        __int16 v16 = 2114;
        uint64_t v17 = v5;
        _os_log_impl(&dword_1B3C5C000, v9, OS_LOG_TYPE_ERROR, "%s Failed to check whether or not we have access to %{public}@: %{public}@", buf, 0x20u);
      }
    }
    unint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)setStatus:(unint64_t)a3 forSystemSurface:(unint64_t)a4
{
  if (a3 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"WFSystemSurfaceWorkflowStatusRegistry.m" lineNumber:75 description:@"Provide a concrete status"];

    if (a4) {
      return 0;
    }
  }
  else if (a4)
  {
    return 0;
  }
  return [(WFSystemSurfaceWorkflowStatusRegistry *)self setStatusForShareSheetWorkflows:a3];
}

- (unint64_t)statusForSystemSurface:(unint64_t)a3
{
  if (a3) {
    return 0;
  }
  else {
    return [(WFSystemSurfaceWorkflowStatusRegistry *)self statusForShareSheetWorkflows];
  }
}

@end