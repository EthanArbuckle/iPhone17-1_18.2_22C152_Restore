@interface SBEmbeddedDisplayUICommandValidator
- (BOOL)validateCommand:(id)a3;
- (SBEmbeddedDisplayUICommandValidator)initWithLayoutStateProvider:(id)a3;
- (SBSceneLayoutStateProvider)layoutStateProvider;
- (void)setLayoutStateProvider:(id)a3;
@end

@implementation SBEmbeddedDisplayUICommandValidator

- (SBEmbeddedDisplayUICommandValidator)initWithLayoutStateProvider:(id)a3
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBEmbeddedDisplayUICommandValidator;
  v7 = [(SBEmbeddedDisplayUICommandValidator *)&v11 init];
  v8 = v7;
  if (!v7) {
    goto LABEL_4;
  }
  if (v6)
  {
    objc_storeStrong((id *)&v7->_layoutStateProvider, a3);
LABEL_4:

    return v8;
  }
  v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"layoutStateProvider != ((void *)0)"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    [(SBEmbeddedDisplayUICommandValidator *)a2 initWithLayoutStateProvider:(uint64_t)v10];
  }
  [v10 UTF8String];
  result = (SBEmbeddedDisplayUICommandValidator *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (BOOL)validateCommand:(id)a3
{
  id v4 = a3;
  if ((char *)[v4 action] == sel__handleToggleFloatingAppVisibilityKeyShortcut_)
  {
    id v6 = [(SBSceneLayoutStateProvider *)self->_layoutStateProvider layoutState];
    v7 = [v6 elementWithRole:3];
    v8 = @"SHOW_SLIDE_OVER_DISCOVERABILITY";
    if (v7 && !SBFloatingConfigurationIsStashed([v6 floatingConfiguration])) {
      v8 = @"HIDE_SLIDE_OVER_DISCOVERABILITY";
    }

    v9 = (void *)MEMORY[0x1E4F28B50];
    v10 = v8;
    objc_super v11 = [v9 mainBundle];
    v12 = [v11 localizedStringForKey:v10 value:&stru_1F3084718 table:@"SpringBoard"];

    [v4 setDiscoverabilityTitle:v12];
    goto LABEL_9;
  }
  if ((char *)[v4 action] == sel__handleMoveToOtherDisplayKeyShortcut_)
  {
    id v6 = [MEMORY[0x1E4F28B50] mainBundle];
    objc_super v11 = [v6 localizedStringForKey:@"MOVE_TO_OTHER_DISPLAY_DISCOVERABILITY" value:&stru_1F3084718 table:@"SpringBoard"];
    [v4 setDiscoverabilityTitle:v11];
LABEL_9:

    BOOL v5 = 1;
    goto LABEL_10;
  }
  BOOL v5 = 0;
LABEL_10:

  return v5;
}

- (SBSceneLayoutStateProvider)layoutStateProvider
{
  return self->_layoutStateProvider;
}

- (void)setLayoutStateProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithLayoutStateProvider:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  v9 = v5;
  __int16 v10 = 2114;
  objc_super v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  v15 = @"SBUICommandValidating.m";
  __int16 v16 = 1024;
  int v17 = 25;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end