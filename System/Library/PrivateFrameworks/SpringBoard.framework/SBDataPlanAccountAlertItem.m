@interface SBDataPlanAccountAlertItem
+ (id)laterButtonTitle;
+ (id)nowButtonTitle;
- (NSURL)accountURL;
- (SBDataPlanAccountAlertItem)initWithAccountURL:(id)a3;
- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4;
- (void)setAccountURL:(id)a3;
- (void)takeAction;
@end

@implementation SBDataPlanAccountAlertItem

- (SBDataPlanAccountAlertItem)initWithAccountURL:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBDataPlanAccountAlertItem;
  v5 = [(SBAlertItem *)&v8 init];
  v6 = v5;
  if (v5) {
    [(SBDataPlanAccountAlertItem *)v5 setAccountURL:v4];
  }

  return v6;
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  v6 = [(SBAlertItem *)self alertController];
  if (!a3)
  {
    v7 = (void *)MEMORY[0x1E4F42720];
    objc_super v8 = [(id)objc_opt_class() laterButtonTitle];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __66__SBDataPlanAccountAlertItem_configure_requirePasscodeForActions___block_invoke;
    v14[3] = &unk_1E6AF4918;
    v14[4] = self;
    v9 = [v7 actionWithTitle:v8 style:0 handler:v14];
    [v6 addAction:v9];

    v10 = (void *)MEMORY[0x1E4F42720];
    v11 = [(id)objc_opt_class() nowButtonTitle];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __66__SBDataPlanAccountAlertItem_configure_requirePasscodeForActions___block_invoke_2;
    v13[3] = &unk_1E6AF4918;
    v13[4] = self;
    v12 = [v10 actionWithTitle:v11 style:0 handler:v13];
    [v6 addAction:v12];
  }
}

uint64_t __66__SBDataPlanAccountAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) deactivateForButton];
  v2 = *(void **)(a1 + 32);
  return [v2 notNow];
}

uint64_t __66__SBDataPlanAccountAlertItem_configure_requirePasscodeForActions___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) deactivateForButton];
  v2 = *(void **)(a1 + 32);
  return [v2 takeAction];
}

- (void)takeAction
{
  v3 = +[SBApplicationController sharedInstance];
  id v4 = [v3 dataActivationApplication];

  if (v4)
  {
    v5 = +[SBWorkspace mainWorkspace];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __40__SBDataPlanAccountAlertItem_takeAction__block_invoke;
    v6[3] = &unk_1E6AF67B0;
    id v7 = v4;
    objc_super v8 = self;
    [v5 requestTransitionWithBuilder:v6];
  }
}

void __40__SBDataPlanAccountAlertItem_takeAction__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setSource:0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__SBDataPlanAccountAlertItem_takeAction__block_invoke_2;
  v6[3] = &unk_1E6AF5638;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 modifyApplicationContext:v6];
}

void __40__SBDataPlanAccountAlertItem_takeAction__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = [[SBDeviceApplicationSceneEntity alloc] initWithApplicationForMainDisplay:*(void *)(a1 + 32)];
  id v4 = [*(id *)(a1 + 40) accountURL];
  [(SBWorkspaceEntity *)v5 setObject:v4 forActivationSetting:5];

  [v3 setBackground:1];
  [v3 setEntity:v5 forLayoutRole:1];
}

+ (id)laterButtonTitle
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  id v3 = [v2 localizedStringForKey:@"DATA_PLAN_LATER" value:&stru_1F3084718 table:@"SpringBoard"];

  return v3;
}

+ (id)nowButtonTitle
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  id v3 = [v2 localizedStringForKey:@"DATA_PLAN_NOW" value:&stru_1F3084718 table:@"SpringBoard"];

  return v3;
}

- (NSURL)accountURL
{
  return self->_accountURL;
}

- (void)setAccountURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end