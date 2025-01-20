@interface STAppAndWebsiteActivityOnboardingController
- (UINavigationController)navigationController;
- (id)_createAppAndWebsiteActivityController;
- (id)completionBlock;
- (void)_addTrayButtonToWelcomeController:(id)a3 localizationKey:(id)a4 action:(SEL)a5 isBold:(BOOL)a6;
- (void)_notNowSelected;
- (void)_turnOnAppAndWebsiteActivitySelected;
- (void)presentOverViewController:(id)a3 completionBlock:(id)a4;
- (void)setCompletionBlock:(id)a3;
- (void)setNavigationController:(id)a3;
@end

@implementation STAppAndWebsiteActivityOnboardingController

- (void)presentOverViewController:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  [(STAppAndWebsiteActivityOnboardingController *)self setCompletionBlock:a4];
  v7 = [(STAppAndWebsiteActivityOnboardingController *)self _createAppAndWebsiteActivityController];
  v8 = (void *)[objc_alloc(MEMORY[0x263F5B8E0]) initWithRootViewController:v7];
  v9 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v10 = [v9 userInterfaceIdiom];

  if (!v10) {
    [v8 setSupportedInterfaceOrientations:2];
  }
  [v8 setModalPresentationStyle:2];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __89__STAppAndWebsiteActivityOnboardingController_presentOverViewController_completionBlock___block_invoke;
  v12[3] = &unk_264767078;
  v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [v6 presentViewController:v11 animated:1 completion:v12];
}

uint64_t __89__STAppAndWebsiteActivityOnboardingController_presentOverViewController_completionBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNavigationController:*(void *)(a1 + 40)];
}

- (id)_createAppAndWebsiteActivityController
{
  v2 = +[STScreenTimeSettingsUIBundle bundle];
  v20 = [v2 localizedStringForKey:@"AppAndWebsiteActivityEDUFeatureTitle" value:&stru_26D9391A8 table:0];
  v19 = [v2 localizedStringForKey:@"AppAndWebsiteActivityEDUFeatureDetails" value:&stru_26D9391A8 table:0];
  v3 = (void *)MEMORY[0x263F82818];
  v4 = [MEMORY[0x263F825C8] tintColor];
  v21 = [v3 configurationWithHierarchicalColor:v4];

  v17 = [MEMORY[0x263F827E8] _systemImageNamed:@"person.badge.hourglass.fill" withConfiguration:v21];
  v5 = (void *)[objc_alloc(MEMORY[0x263F5B918]) initWithTitle:v20 detailText:v19 icon:v17];
  id v6 = [MEMORY[0x263F82818] configurationPreferringMonochrome];
  v16 = [MEMORY[0x263F827E8] _systemImageNamed:@"chart.line.uptrend.xyaxis" withConfiguration:v6];
  v7 = [MEMORY[0x263F827E8] _systemImageNamed:@"downtime" withConfiguration:v6];
  v8 = [MEMORY[0x263F827E8] _systemImageNamed:@"hourglass" withConfiguration:v6];
  v15 = [v2 localizedStringForKey:@"AppAndWebsiteActivityEDUWeeklyReportsTitle" value:&stru_26D9391A8 table:0];
  v14 = [v2 localizedStringForKey:@"AppAndWebsiteActivityEDUWeeklyReportsDetail" value:&stru_26D9391A8 table:0];
  [v5 addBulletedListItemWithTitle:v15 description:v14 image:v16];
  v9 = [v2 localizedStringForKey:@"AppAndWebsiteActivityEDUDowntimeTitle" value:&stru_26D9391A8 table:0];
  uint64_t v10 = [v2 localizedStringForKey:@"AppAndWebsiteActivityEDUDowntimeDetail" value:&stru_26D9391A8 table:0];
  [v5 addBulletedListItemWithTitle:v9 description:v10 image:v7];
  id v11 = [v2 localizedStringForKey:@"AppAndWebsiteActivityEDUAppLimitsTitle" value:&stru_26D9391A8 table:0];
  v12 = [v2 localizedStringForKey:@"AppAndWebsiteActivityEDUAppLimitsDetail" value:&stru_26D9391A8 table:0];
  [v5 addBulletedListItemWithTitle:v11 description:v12 image:v8];
  [(STAppAndWebsiteActivityOnboardingController *)self _addTrayButtonToWelcomeController:v5 localizationKey:@"AppAndWebsiteActivityEDUTurnOnButton" action:sel__turnOnAppAndWebsiteActivitySelected isBold:1];
  [(STAppAndWebsiteActivityOnboardingController *)self _addTrayButtonToWelcomeController:v5 localizationKey:@"AppAndWebsiteActivityEDUNotNowButton" action:sel__notNowSelected isBold:0];

  return v5;
}

- (void)_turnOnAppAndWebsiteActivitySelected
{
  v3 = [(STAppAndWebsiteActivityOnboardingController *)self navigationController];
  [v3 dismissViewControllerAnimated:1 completion:0];

  v4 = [(STAppAndWebsiteActivityOnboardingController *)self completionBlock];
  if (v4)
  {
    id v5 = v4;
    v4[2](v4, 1);
    v4 = (void (**)(void, void))v5;
  }
}

- (void)_notNowSelected
{
  v3 = [(STAppAndWebsiteActivityOnboardingController *)self navigationController];
  [v3 dismissViewControllerAnimated:1 completion:0];

  v4 = [(STAppAndWebsiteActivityOnboardingController *)self completionBlock];
  if (v4)
  {
    id v5 = v4;
    v4[2](v4, 0);
    v4 = (void (**)(void, void))v5;
  }
}

- (void)_addTrayButtonToWelcomeController:(id)a3 localizationKey:(id)a4 action:(SEL)a5 isBold:(BOOL)a6
{
  id v10 = a4;
  id v11 = a3;
  id v15 = +[STScreenTimeSettingsUIBundle bundle];
  if (a6) {
    [MEMORY[0x263F5B898] boldButton];
  }
  else {
  v12 = [MEMORY[0x263F5B8D0] linkButton];
  }
  id v13 = [v15 localizedStringForKey:v10 value:&stru_26D9391A8 table:0];

  [v12 setTitle:v13 forState:0];
  [v12 addTarget:self action:a5 forControlEvents:0x2000];
  v14 = [v11 buttonTray];

  [v14 addButton:v12];
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setCompletionBlock:(id)a3
{
}

- (UINavigationController)navigationController
{
  return (UINavigationController *)objc_getProperty(self, a2, 16, 1);
}

- (void)setNavigationController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationController, 0);

  objc_storeStrong(&self->_completionBlock, 0);
}

@end