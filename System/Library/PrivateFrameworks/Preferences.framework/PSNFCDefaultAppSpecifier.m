@interface PSNFCDefaultAppSpecifier
- (PSNFCDefaultAppSpecifier)initWithBundleID:(id)a3 delegate:(id)a4 onChange:(id)a5;
- (PSSystemPolicyForAppDelegate)delegate;
- (SESNFCAppSettingsContext)context;
- (id)defaultNFCApp:(id)a3;
- (void)dealloc;
- (void)setDefaultNFCApp:(id)a3 specifier:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation PSNFCDefaultAppSpecifier

- (PSNFCDefaultAppSpecifier)initWithBundleID:(id)a3 delegate:(id)a4 onChange:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v36.receiver = self;
  v36.super_class = (Class)PSNFCDefaultAppSpecifier;
  v11 = [(PSSpecifier *)&v36 init];
  if (v11)
  {
    id v31 = v8;
    uint64_t v12 = [MEMORY[0x1E4F97A20] contextWithBundleId:v8 onChange:v10];
    context = v11->_context;
    v11->_context = (SESNFCAppSettingsContext *)v12;

    id v30 = v9;
    [(PSNFCDefaultAppSpecifier *)v11 setDelegate:v9];
    v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v15 = [v14 localizedStringForKey:@"DEFAULT_CONTACTLESS_APP_TITLE" value:&stru_1EFB51FD0 table:@"ContactlessAndCredentialSettings_Localizable"];
    [(PSSpecifier *)v11 setName:v15];

    objc_storeWeak(&v11->super.target, v11);
    v11->super.getter = sel_defaultNFCApp_;
    v11->super.setter = sel_setDefaultNFCApp_specifier_;
    v11->super.detailControllerClass = (Class)objc_opt_class();
    v11->super.cellType = 2;
    v11->super.editPaneClass = 0;
    v16 = objc_opt_new();
    v17 = objc_opt_new();
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v18 = [(PSNFCDefaultAppSpecifier *)v11 context];
    v19 = [v18 defaultAppCandidates];

    uint64_t v20 = [v19 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v33 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          v25 = [v24 bundleId];
          [v17 addObject:v25];

          v26 = [v24 localizedDisplayName];
          [v16 addObject:v26];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v21);
    }

    [(PSSpecifier *)v11 setValues:v17 titles:v16];
    [(PSSpecifier *)v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"PSListItemsValuesAreAppIDsKey"];
    v27 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v28 = [v27 localizedStringForKey:@"DEFAULT_CONTACTLESS_APP_FOOTER" value:&stru_1EFB51FD0 table:@"ContactlessAndCredentialSettings_Localizable"];
    [(PSSpecifier *)v11 setObject:v28 forKeyedSubscript:@"staticTextMessage"];

    [(PSSpecifier *)v11 setIdentifier:@"DEFAULT_CONTACTLESS_APP_FOOTER"];
    id v9 = v30;
    id v8 = v31;
  }

  return v11;
}

- (void)dealloc
{
  [(SESNFCAppSettingsContext *)self->_context invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PSNFCDefaultAppSpecifier;
  [(PSNFCDefaultAppSpecifier *)&v3 dealloc];
}

- (id)defaultNFCApp:(id)a3
{
  objc_super v3 = [(PSNFCDefaultAppSpecifier *)self context];
  v4 = [v3 getDefaultNFCApplication];
  v5 = [v4 bundleId];

  return v5;
}

- (void)setDefaultNFCApp:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  v6 = [(PSNFCDefaultAppSpecifier *)self context];
  v7 = [v6 getDefaultNFCApplication];
  id v8 = [v7 bundleId];
  char v9 = [v5 isEqual:v8];

  if ((v9 & 1) == 0)
  {
    id v10 = [(PSSpecifier *)self objectForKeyedSubscript:@"PSListItemsControllerSpecifierKey"];
    v11 = [v10 nonretainedObjectValue];

    uint64_t v12 = [(PSNFCDefaultAppSpecifier *)self context];
    v13 = [v12 alertMessageForDefaultAppChangeTo:v5];

    if (v13)
    {
      v14 = (void *)MEMORY[0x1E4F42728];
      v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v16 = [v15 localizedStringForKey:@"CHANGE_DEFAULT_CONTACTLESS_APP_ALERT_TITLE" value:&stru_1EFB51FD0 table:@"ContactlessAndCredentialSettings_Localizable"];
      v17 = [v14 alertControllerWithTitle:v16 message:v13 preferredStyle:1];

      v18 = (void *)MEMORY[0x1E4F42720];
      v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      [v19 localizedStringForKey:@"CANCEL_BUTTON" value:&stru_1EFB51FD0 table:@"ContactlessAndCredentialSettings_Localizable"];
      v21 = uint64_t v20 = v11;
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __55__PSNFCDefaultAppSpecifier_setDefaultNFCApp_specifier___block_invoke;
      v32[3] = &unk_1E5C5D860;
      v32[4] = self;
      id v22 = v20;
      id v33 = v22;
      v23 = [v18 actionWithTitle:v21 style:1 handler:v32];

      [v17 addAction:v23];
      v24 = (void *)MEMORY[0x1E4F42720];
      v25 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v26 = [v25 localizedStringForKey:@"CONTINUE_BUTTON" value:&stru_1EFB51FD0 table:@"ContactlessAndCredentialSettings_Localizable"];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __55__PSNFCDefaultAppSpecifier_setDefaultNFCApp_specifier___block_invoke_2;
      v29[3] = &unk_1E5C5D8C0;
      v29[4] = self;
      id v30 = v5;
      id v31 = v22;
      v27 = [v24 actionWithTitle:v26 style:0 handler:v29];

      [v17 addAction:v27];
      v28 = [(PSNFCDefaultAppSpecifier *)self delegate];
      [v28 showController:v17 animate:1];

      v11 = v20;
    }
    else
    {
      [(SESNFCAppSettingsContext *)self->_context setDefaultNFCApplication:v5];
    }
  }
}

uint64_t __55__PSNFCDefaultAppSpecifier_setDefaultNFCApp_specifier___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  [v2 reloadSpecifiers];

  objc_super v3 = *(void **)(a1 + 40);
  return [v3 reloadSpecifiers];
}

uint64_t __55__PSNFCDefaultAppSpecifier_setDefaultNFCApp_specifier___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) context];
  [v2 setDefaultNFCApplication:*(void *)(a1 + 40)];

  objc_super v3 = [*(id *)(a1 + 32) delegate];
  [v3 reloadSpecifiers];

  v4 = *(void **)(a1 + 48);
  return [v4 reloadSpecifiers];
}

- (SESNFCAppSettingsContext)context
{
  return self->_context;
}

- (PSSystemPolicyForAppDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PSSystemPolicyForAppDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_context, 0);
}

@end