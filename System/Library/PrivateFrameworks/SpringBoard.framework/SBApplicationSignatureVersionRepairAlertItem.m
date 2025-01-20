@interface SBApplicationSignatureVersionRepairAlertItem
- (BOOL)dismissOnLock;
- (BOOL)forcesModalAlertAppearance;
- (BOOL)shouldShowInLockScreen;
- (SBApplicationSignatureVersionRepairAlertItem)initWithApplication:(id)a3;
- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4;
@end

@implementation SBApplicationSignatureVersionRepairAlertItem

- (SBApplicationSignatureVersionRepairAlertItem)initWithApplication:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBApplicationSignatureVersionRepairAlertItem;
  v6 = [(SBAlertItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_application, a3);
  }

  return v7;
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  id v5 = [(SBAlertItem *)self alertController];
  v6 = NSString;
  v7 = [MEMORY[0x1E4F28B50] mainBundle];
  v8 = [v7 localizedStringForKey:@"SIGNATURE_VERSION_UNSUPPORTED_REPAIR_TITLE" value:&stru_1F3084718 table:@"SpringBoard"];
  objc_super v9 = [(SBApplication *)self->_application displayName];
  v10 = objc_msgSend(v6, "stringWithFormat:", v8, v9);
  [v5 setTitle:v10];

  v11 = [MEMORY[0x1E4F28B50] mainBundle];
  v12 = [v11 localizedStringForKey:@"SIGNATURE_VERSION_UNSUPPORTED_REPAIR_BODY" value:&stru_1F3084718 table:@"SpringBoard"];
  [v5 setMessage:v12];

  v13 = (void *)MEMORY[0x1E4F42720];
  v14 = [MEMORY[0x1E4F28B50] mainBundle];
  v15 = [v14 localizedStringForKey:@"SIGNATURE_VERSION_UNSUPPORTED_REPAIR_ACKNOWLEDGE" value:&stru_1F3084718 table:@"SpringBoard"];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __84__SBApplicationSignatureVersionRepairAlertItem_configure_requirePasscodeForActions___block_invoke;
  v22[3] = &unk_1E6AF4918;
  v22[4] = self;
  v16 = [v13 actionWithTitle:v15 style:0 handler:v22];

  [v5 addAction:v16];
  v17 = (void *)MEMORY[0x1E4F42720];
  v18 = [MEMORY[0x1E4F28B50] mainBundle];
  v19 = [v18 localizedStringForKey:@"SIGNATURE_VERSION_UNSUPPORTED_REPAIR_CANCEL" value:&stru_1F3084718 table:@"SpringBoard"];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __84__SBApplicationSignatureVersionRepairAlertItem_configure_requirePasscodeForActions___block_invoke_29;
  v21[3] = &unk_1E6AF4918;
  v21[4] = self;
  v20 = [v17 actionWithTitle:v19 style:1 handler:v21];

  [v5 addAction:v20];
  [v5 setPreferredAction:v16];
}

void __84__SBApplicationSignatureVersionRepairAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = SBLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = [*(id *)(*(void *)(a1 + 32) + 112) bundleIdentifier];
    *(_DWORD *)buf = 138543362;
    v10 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "[Signature Repair] [%{public}@] Attempting to upgrade repair", buf, 0xCu);
  }
  id v4 = objc_alloc(MEMORY[0x1E4F4BCC0]);
  id v5 = [*(id *)(*(void *)(a1 + 32) + 112) bundleIdentifier];
  v6 = (void *)[v4 initWithBundleID:v5];

  [v6 setExitReason:32];
  v7 = [MEMORY[0x1E4F4BCC8] defaultService];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __84__SBApplicationSignatureVersionRepairAlertItem_configure_requirePasscodeForActions___block_invoke_17;
  v8[3] = &unk_1E6B04F88;
  v8[4] = *(void *)(a1 + 32);
  [v7 repairAppWithOptions:v6 replyHandler:v8];

  [*(id *)(a1 + 32) deactivateForButton];
}

void __84__SBApplicationSignatureVersionRepairAlertItem_configure_requirePasscodeForActions___block_invoke_17(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = SBLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [*(id *)(*(void *)(a1 + 32) + 112) bundleIdentifier];
    objc_super v9 = @"Failed";
    int v10 = 138543874;
    uint64_t v11 = v8;
    __int16 v12 = 2114;
    if (a2) {
      objc_super v9 = @"Success";
    }
    v13 = v9;
    __int16 v14 = 2114;
    id v15 = v6;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[Signature Repair] [%{public}@] Upgrade result: %{public}@ - error: %{public}@.", (uint8_t *)&v10, 0x20u);
  }
}

uint64_t __84__SBApplicationSignatureVersionRepairAlertItem_configure_requirePasscodeForActions___block_invoke_29(uint64_t a1)
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

@end