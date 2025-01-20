@interface STCommunicationSafetyOnboardingController
- (BOOL)isAnalyticsEnabled;
- (BOOL)isFeatureEnabled;
- (BOOL)skipFeatureEnablement;
- (BOOL)validatePIN:(id)a3 forPINController:(id)a4;
- (STCommunicationSafetyOnboardingController)initWithCoordinator:(id)a3;
- (STRootViewModelCoordinator)coordinator;
- (UINavigationController)navigationController;
- (id)_createCommunicationSafetyAnalyticsEDUController;
- (id)_createCommunicationSafetyEDUController;
- (id)_createInitialViewController;
- (id)_createPINController;
- (id)completionBlock;
- (void)_addAccessoryButtonToHeaderViewForWelcomeController:(id)a3 title:(id)a4 action:(SEL)a5;
- (void)_addTrayButtonToWelcomeController:(id)a3 localizationKey:(id)a4 action:(SEL)a5 isBold:(BOOL)a6;
- (void)_continueSelected;
- (void)_dontShareAnalyticsSelected;
- (void)_notNowSelected;
- (void)_openAboutAnalytics;
- (void)_openLearnMore;
- (void)_shareAnalyticsSelected;
- (void)didAcceptEnteredPIN;
- (void)didCancelEnteringPIN;
- (void)presentOverViewController:(id)a3 skipFeatureEnablement:(BOOL)a4 completionBlock:(id)a5;
- (void)setCompletionBlock:(id)a3;
- (void)setIsAnalyticsEnabled:(BOOL)a3;
- (void)setIsFeatureEnabled:(BOOL)a3;
- (void)setNavigationController:(id)a3;
- (void)setSkipFeatureEnablement:(BOOL)a3;
@end

@implementation STCommunicationSafetyOnboardingController

- (STCommunicationSafetyOnboardingController)initWithCoordinator:(id)a3
{
  v4 = (STRootViewModelCoordinator *)a3;
  v8.receiver = self;
  v8.super_class = (Class)STCommunicationSafetyOnboardingController;
  v5 = [(STCommunicationSafetyOnboardingController *)&v8 init];
  coordinator = v5->_coordinator;
  v5->_coordinator = v4;

  return v5;
}

- (void)presentOverViewController:(id)a3 skipFeatureEnablement:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  [(STCommunicationSafetyOnboardingController *)self setCompletionBlock:a5];
  [(STCommunicationSafetyOnboardingController *)self setSkipFeatureEnablement:v6];
  id v9 = objc_alloc(MEMORY[0x263F5B8E0]);
  v10 = [(STCommunicationSafetyOnboardingController *)self _createInitialViewController];
  v11 = (void *)[v9 initWithRootViewController:v10];

  v12 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v13 = [v12 userInterfaceIdiom];

  if (!v13) {
    [v11 setSupportedInterfaceOrientations:2];
  }
  [v11 setModalPresentationStyle:2];
  [v11 setModalInPresentation:1];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __109__STCommunicationSafetyOnboardingController_presentOverViewController_skipFeatureEnablement_completionBlock___block_invoke;
  v15[3] = &unk_264767078;
  v15[4] = self;
  id v16 = v11;
  id v14 = v11;
  [v8 presentViewController:v14 animated:1 completion:v15];
}

uint64_t __109__STCommunicationSafetyOnboardingController_presentOverViewController_skipFeatureEnablement_completionBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNavigationController:*(void *)(a1 + 40)];
}

- (id)_createInitialViewController
{
  v3 = [(STCommunicationSafetyOnboardingController *)self coordinator];
  v4 = [v3 viewModel];
  v5 = [v4 me];

  if ([v5 hasPasscode]
    && ![v3 hasAlreadyEnteredPINForSession])
  {
    uint64_t v6 = [(STCommunicationSafetyOnboardingController *)self _createPINController];
  }
  else
  {
    if ([(STCommunicationSafetyOnboardingController *)self skipFeatureEnablement]) {
      [(STCommunicationSafetyOnboardingController *)self _createCommunicationSafetyAnalyticsEDUController];
    }
    else {
    uint64_t v6 = [(STCommunicationSafetyOnboardingController *)self _createCommunicationSafetyEDUController];
    }
  }
  v7 = (void *)v6;

  return v7;
}

- (id)_createCommunicationSafetyEDUController
{
  v3 = +[STScreenTimeSettingsUIBundle bundle];
  v4 = [v3 localizedStringForKey:@"CommunicationSafetyEDUFeatureTitle" value:&stru_26D9391A8 table:0];
  v5 = [v3 localizedStringForKey:@"CommunicationSafetyEDUFeatureDetails" value:&stru_26D9391A8 table:0];
  uint64_t v6 = (void *)MEMORY[0x263F82818];
  v7 = [MEMORY[0x263F825C8] tintColor];
  id v8 = [v6 configurationWithHierarchicalColor:v7];

  id v9 = [MEMORY[0x263F827E8] _systemImageNamed:@"bubble.left.and.exclamationmark.bubble.right.fill" withConfiguration:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x263F5B918]) initWithTitle:v4 detailText:v5 icon:v9];
  v11 = [MEMORY[0x263F5B8B8] accessoryButton];
  v12 = [v3 localizedStringForKey:@"CommunicationSafetyEDULearnMoreButton" value:&stru_26D9391A8 table:0];
  [v11 setTitle:v12 forState:0];

  [v11 addTarget:self action:sel__openLearnMore forControlEvents:0x2000];
  uint64_t v13 = [v10 headerView];
  [v13 addAccessoryButton:v11];

  [(STCommunicationSafetyOnboardingController *)self _addTrayButtonToWelcomeController:v10 localizationKey:@"CommunicationSafetyEDUContinue" action:sel__continueSelected isBold:1];
  [(STCommunicationSafetyOnboardingController *)self _addTrayButtonToWelcomeController:v10 localizationKey:@"CommunicationSafetyEDUNotNow" action:sel__notNowSelected isBold:0];

  return v10;
}

- (id)_createCommunicationSafetyAnalyticsEDUController
{
  v3 = +[STScreenTimeSettingsUIBundle bundle];
  v4 = [v3 localizedStringForKey:@"CommunicationSafetyAnalyticsEDUTitle" value:&stru_26D9391A8 table:0];
  v5 = [v3 localizedStringForKey:@"CommunicationSafetyAnalyticsEDUDetails" value:&stru_26D9391A8 table:0];
  uint64_t v6 = (void *)MEMORY[0x263F82818];
  v7 = [MEMORY[0x263F825C8] tintColor];
  id v8 = [v6 configurationWithHierarchicalColor:v7];

  id v9 = [MEMORY[0x263F827E8] _systemImageNamed:@"chart.bar.xaxis" withConfiguration:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x263F5B918]) initWithTitle:v4 detailText:v5 icon:v9];
  v11 = [MEMORY[0x263F5B8F0] linkWithBundleIdentifier:@"com.apple.onboarding.improveCommSafety"];
  v12 = [v11 flow];
  uint64_t v13 = [v12 localizedButtonTitle];

  [(STCommunicationSafetyOnboardingController *)self _addTrayButtonToWelcomeController:v10 localizationKey:@"CommunicationSafetyEDUShareWithApple" action:sel__shareAnalyticsSelected isBold:1];
  [(STCommunicationSafetyOnboardingController *)self _addTrayButtonToWelcomeController:v10 localizationKey:@"CommunicationSafetyEDUDontShare" action:sel__dontShareAnalyticsSelected isBold:0];
  if (v13) {
    [(STCommunicationSafetyOnboardingController *)self _addAccessoryButtonToHeaderViewForWelcomeController:v10 title:v13 action:sel__openAboutAnalytics];
  }

  return v10;
}

- (void)_openLearnMore
{
  id v3 = [MEMORY[0x263F01880] defaultWorkspace];
  v2 = [NSURL URLWithString:@"https://support.apple.com/kb/HT212850"];
  [v3 openURL:v2 withOptions:0];
}

- (void)_openAboutAnalytics
{
  id v4 = [MEMORY[0x263F5B8F8] presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.improveCommSafety"];
  if (v4)
  {
    id v3 = [(STCommunicationSafetyOnboardingController *)self navigationController];
    [v4 setPresentingViewController:v3];

    [v4 present];
  }
}

- (void)_shareAnalyticsSelected
{
  [(STCommunicationSafetyOnboardingController *)self setIsAnalyticsEnabled:1];
  id v4 = [(STCommunicationSafetyOnboardingController *)self completionBlock];
  if (v4) {
    v4[2](v4, 0, [(STCommunicationSafetyOnboardingController *)self isFeatureEnabled], [(STCommunicationSafetyOnboardingController *)self isAnalyticsEnabled]);
  }
  id v3 = [(STCommunicationSafetyOnboardingController *)self navigationController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)_dontShareAnalyticsSelected
{
  [(STCommunicationSafetyOnboardingController *)self setIsAnalyticsEnabled:0];
  id v4 = [(STCommunicationSafetyOnboardingController *)self completionBlock];
  if (v4) {
    v4[2](v4, 0, [(STCommunicationSafetyOnboardingController *)self isFeatureEnabled], [(STCommunicationSafetyOnboardingController *)self isAnalyticsEnabled]);
  }
  id v3 = [(STCommunicationSafetyOnboardingController *)self navigationController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)_continueSelected
{
  [(STCommunicationSafetyOnboardingController *)self setIsFeatureEnabled:1];
  id v4 = [(STCommunicationSafetyOnboardingController *)self _createCommunicationSafetyAnalyticsEDUController];
  id v3 = [(STCommunicationSafetyOnboardingController *)self navigationController];
  [v3 pushViewController:v4 animated:1];
}

- (void)_notNowSelected
{
  [(STCommunicationSafetyOnboardingController *)self setIsFeatureEnabled:0];
  [(STCommunicationSafetyOnboardingController *)self setIsAnalyticsEnabled:0];
  id v4 = [(STCommunicationSafetyOnboardingController *)self completionBlock];
  if (v4) {
    v4[2](v4, 0, [(STCommunicationSafetyOnboardingController *)self isFeatureEnabled], [(STCommunicationSafetyOnboardingController *)self isAnalyticsEnabled]);
  }
  id v3 = [(STCommunicationSafetyOnboardingController *)self navigationController];
  [v3 dismissViewControllerAnimated:1 completion:0];
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
  uint64_t v13 = [v15 localizedStringForKey:v10 value:&stru_26D9391A8 table:0];

  [v12 setTitle:v13 forState:0];
  [v12 addTarget:self action:a5 forControlEvents:0x2000];
  id v14 = [v11 buttonTray];

  [v14 addButton:v12];
}

- (void)_addAccessoryButtonToHeaderViewForWelcomeController:(id)a3 title:(id)a4 action:(SEL)a5
{
  id v8 = (void *)MEMORY[0x263F5B8B8];
  id v9 = a4;
  id v10 = a3;
  id v13 = [v8 accessoryButton];
  [v13 setTitle:v9 forState:0];

  id v11 = [v13 titleLabel];
  [v11 setNumberOfLines:0];

  [v13 addTarget:self action:a5 forControlEvents:64];
  v12 = [v10 headerView];

  [v12 addAccessoryButton:v13];
}

- (BOOL)validatePIN:(id)a3 forPINController:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [(STCommunicationSafetyOnboardingController *)self coordinator];
  v7 = [v6 viewModel];
  id v8 = [v7 me];
  id v9 = [v8 passcode];
  char v10 = [v5 isEqualToString:v9];

  return v10;
}

- (void)didAcceptEnteredPIN
{
  v7[1] = *MEMORY[0x263EF8340];
  id v3 = [(STCommunicationSafetyOnboardingController *)self coordinator];
  [v3 setHasAlreadyEnteredPINForSession:1];

  if ([(STCommunicationSafetyOnboardingController *)self skipFeatureEnablement]) {
    [(STCommunicationSafetyOnboardingController *)self _createCommunicationSafetyAnalyticsEDUController];
  }
  else {
  id v4 = [(STCommunicationSafetyOnboardingController *)self _createCommunicationSafetyEDUController];
  }
  id v5 = [(STCommunicationSafetyOnboardingController *)self navigationController];
  v7[0] = v4;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  [v5 setViewControllers:v6 animated:1];
}

- (void)didCancelEnteringPIN
{
  [(STCommunicationSafetyOnboardingController *)self setIsFeatureEnabled:0];
  [(STCommunicationSafetyOnboardingController *)self setIsAnalyticsEnabled:0];
  id v4 = [(STCommunicationSafetyOnboardingController *)self completionBlock];
  if (v4) {
    v4[2](v4, 1, [(STCommunicationSafetyOnboardingController *)self isFeatureEnabled], [(STCommunicationSafetyOnboardingController *)self isAnalyticsEnabled]);
  }
  id v3 = [(STCommunicationSafetyOnboardingController *)self navigationController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (id)_createPINController
{
  id v3 = objc_opt_new();
  [v3 setPinDelegate:self];
  [v3 setMode:3];

  return v3;
}

- (STRootViewModelCoordinator)coordinator
{
  return (STRootViewModelCoordinator *)objc_getProperty(self, a2, 16, 1);
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setCompletionBlock:(id)a3
{
}

- (UINavigationController)navigationController
{
  return (UINavigationController *)objc_getProperty(self, a2, 32, 1);
}

- (void)setNavigationController:(id)a3
{
}

- (BOOL)skipFeatureEnablement
{
  return self->_skipFeatureEnablement;
}

- (void)setSkipFeatureEnablement:(BOOL)a3
{
  self->_skipFeatureEnablement = a3;
}

- (BOOL)isFeatureEnabled
{
  return self->_isFeatureEnabled;
}

- (void)setIsFeatureEnabled:(BOOL)a3
{
  self->_isFeatureEnabled = a3;
}

- (BOOL)isAnalyticsEnabled
{
  return self->_isAnalyticsEnabled;
}

- (void)setIsAnalyticsEnabled:(BOOL)a3
{
  self->_isAnalyticsEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong(&self->_completionBlock, 0);

  objc_storeStrong((id *)&self->_coordinator, 0);
}

@end