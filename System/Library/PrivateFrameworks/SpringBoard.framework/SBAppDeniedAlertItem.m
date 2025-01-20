@interface SBAppDeniedAlertItem
- (BOOL)dismissOnLock;
- (BOOL)forcesModalAlertAppearance;
- (BOOL)shouldShowInLockScreen;
- (SBAppDeniedAlertItem)initWithApp:(id)a3;
- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4;
@end

@implementation SBAppDeniedAlertItem

- (SBAppDeniedAlertItem)initWithApp:(id)a3
{
  id v5 = a3;
  v6 = [(SBAlertItem *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_application, a3);
  }

  return v7;
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  id v5 = [(SBAlertItem *)self alertController];
  id v6 = objc_alloc(MEMORY[0x1E4F78050]);
  v7 = [(SBApplication *)self->_application bundleIdentifier];
  v8 = (void *)[v6 initWithBundleIdentifier:v7];

  if (v8)
  {
    v9 = [v8 title];
    [v5 setTitle:v9];

    v10 = [v8 description];
    [v5 setMessage:v10];

    v11 = (void *)MEMORY[0x1E4F42720];
    v12 = [v8 deleteAppButtonText];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __60__SBAppDeniedAlertItem_configure_requirePasscodeForActions___block_invoke;
    v26[3] = &unk_1E6AF48F0;
    v26[4] = self;
    id v13 = v8;
    id v27 = v13;
    v14 = [v11 actionWithTitle:v12 style:2 handler:v26];

    v15 = (void *)MEMORY[0x1E4F42720];
    v16 = [v13 learnMoreButtonText];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __60__SBAppDeniedAlertItem_configure_requirePasscodeForActions___block_invoke_2;
    v24[3] = &unk_1E6AF48F0;
    v24[4] = self;
    id v17 = v13;
    id v25 = v17;
    v18 = [v15 actionWithTitle:v16 style:0 handler:v24];

    v19 = (void *)MEMORY[0x1E4F42720];
    v20 = [v17 cancelButtonText];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __60__SBAppDeniedAlertItem_configure_requirePasscodeForActions___block_invoke_3;
    v23[3] = &unk_1E6AF4918;
    v23[4] = self;
    v21 = [v19 actionWithTitle:v20 style:1 handler:v23];

    [v5 addAction:v14];
    [v5 addAction:v18];
    [v5 addAction:v21];
    [v5 setPreferredAction:v14];
  }
  else
  {
    v22 = SBLogCommon();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[SBAppDeniedAlertItem configure:requirePasscodeForActions:](v22);
    }
  }
}

uint64_t __60__SBAppDeniedAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) deactivateForButton];
  v2 = *(void **)(a1 + 40);
  return [v2 deleteAppHandler];
}

void __60__SBAppDeniedAlertItem_configure_requirePasscodeForActions___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) deactivateForButton];
  id v2 = [*(id *)(a1 + 40) learnMoreURL];
  SBWorkspaceActivateApplicationFromURL(v2, 0, 0);
}

uint64_t __60__SBAppDeniedAlertItem_configure_requirePasscodeForActions___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) deactivateForButton];
}

- (BOOL)forcesModalAlertAppearance
{
  return 1;
}

- (BOOL)shouldShowInLockScreen
{
  return 1;
}

- (BOOL)dismissOnLock
{
  return 1;
}

- (void).cxx_destruct
{
}

- (void)configure:(os_log_t)log requirePasscodeForActions:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Failed to initialize MISAppDeniedAlert", v1, 2u);
}

@end