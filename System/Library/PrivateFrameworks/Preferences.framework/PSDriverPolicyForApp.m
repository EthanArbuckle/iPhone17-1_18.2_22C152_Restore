@interface PSDriverPolicyForApp
- (NSString)bundleIdentifier;
- (PSDriverPolicyForApp)initWithBundleIdentifier:(id)a3;
- (PSDriverPolicyForAppDelegate)delegate;
- (id)specifiers;
- (id)valueForSpecifier:(id)a3;
- (void)approvalStateDidChange:(BOOL)a3;
- (void)dealloc;
- (void)setBundleIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setValue:(id)a3 forSpecifier:(id)a4;
@end

@implementation PSDriverPolicyForApp

- (PSDriverPolicyForApp)initWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PSDriverPolicyForApp;
  v5 = [(PSDriverPolicyForApp *)&v10 init];
  v6 = v5;
  if (v5)
  {
    [(PSDriverPolicyForApp *)v5 setBundleIdentifier:v4];
    v7 = [getDriverManagerClass() sharedManager];
    [v7 addObserver:v6];

    v8 = [getDriverManagerClass() sharedManager];
    [v8 refresh];
  }
  return v6;
}

- (void)dealloc
{
  v3 = [getDriverManagerClass() sharedManager];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PSDriverPolicyForApp;
  [(PSDriverPolicyForApp *)&v4 dealloc];
}

- (id)valueForSpecifier:(id)a3
{
  v3 = [a3 userInfo];
  objc_super v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v3, "driverIsApproved"));
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setValue:(id)a3 forSpecifier:(id)a4
{
  id v6 = a3;
  v7 = [a4 userInfo];
  v8 = v7;
  if (v7 && ([v7 updatePending] & 1) == 0)
  {
    if ([v8 driverIsApproved])
    {
      v9 = [getDriverManagerClass() sharedManager];
      objc_msgSend(v9, "setDriverState:approved:", v8, objc_msgSend(v6, "BOOLValue"));
    }
    else if ([v6 BOOLValue])
    {
      objc_super v10 = (void *)MEMORY[0x1E4F42728];
      v11 = NSString;
      v12 = PS_LocalizedStringForDriverPolicy(@"CONFIRMATION_DIALOG_TITLE");
      v13 = [v8 displayName];
      v14 = objc_msgSend(v11, "stringWithFormat:", v12, v13);
      v15 = [v8 usageText];
      v16 = [v10 alertControllerWithTitle:v14 message:v15 preferredStyle:1];

      v17 = (void *)MEMORY[0x1E4F42720];
      v18 = PS_LocalizedStringForDriverPolicy(@"CONFIRMATION_DIALOG_ENABLE_BUTTON");
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __46__PSDriverPolicyForApp_setValue_forSpecifier___block_invoke;
      v24[3] = &unk_1E5C5D860;
      id v25 = v8;
      id v26 = v6;
      v19 = [v17 actionWithTitle:v18 style:0 handler:v24];

      [v16 addAction:v19];
      v20 = (void *)MEMORY[0x1E4F42720];
      v21 = PS_LocalizedStringForDriverPolicy(@"CONFIRMATION_DIALOG_CANCEL_BUTTON");
      v22 = [v20 actionWithTitle:v21 style:1 handler:&__block_literal_global_4];

      [v16 addAction:v22];
      v23 = [(PSDriverPolicyForApp *)self delegate];
      [v23 showController:v16 animate:1];
    }
  }
}

void __46__PSDriverPolicyForApp_setValue_forSpecifier___block_invoke(uint64_t a1)
{
  id v2 = [getDriverManagerClass() sharedManager];
  objc_msgSend(v2, "setDriverState:approved:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "BOOLValue"));
}

- (id)specifiers
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v20 = [MEMORY[0x1E4F1CA48] array];
  v3 = [getDriverManagerClass() sharedManager];
  objc_super v4 = [(PSDriverPolicyForApp *)self bundleIdentifier];
  v5 = [v3 driverApprovalStatesForThirdPartyApp:v4];

  if ([v5 count])
  {
    id v6 = PS_LocalizedStringForDriverPolicy(@"FORM_TITLE");
    uint64_t v7 = +[PSSpecifier groupSpecifierWithID:@"DRIVERS_GROUP" name:v6];

    v18 = (void *)v7;
    [v20 addObject:v7];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v19 = v5;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          v14 = [v13 displayName];
          v15 = +[PSSpecifier preferenceSpecifierNamed:v14 target:self set:sel_setValue_forSpecifier_ get:sel_valueForSpecifier_ detail:0 cell:6 edit:0];

          [v15 setUserInfo:v13];
          [v20 addObject:v15];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v10);
    }

    v16 = PS_LocalizedStringForDriverPolicy(@"FORM_DESCRIPTION");
    [v18 setProperty:v16 forKey:@"footerText"];

    v5 = v19;
  }

  return v20;
}

- (void)approvalStateDidChange:(BOOL)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__PSDriverPolicyForApp_approvalStateDidChange___block_invoke;
  block[3] = &unk_1E5C5D680;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __47__PSDriverPolicyForApp_approvalStateDidChange___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 reloadSpecifiers];
}

- (PSDriverPolicyForAppDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PSDriverPolicyForAppDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end