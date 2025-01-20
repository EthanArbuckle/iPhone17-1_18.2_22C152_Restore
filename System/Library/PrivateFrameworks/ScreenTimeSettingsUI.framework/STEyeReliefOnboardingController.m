@interface STEyeReliefOnboardingController
- (BOOL)validatePIN:(id)a3 forPINController:(id)a4;
- (OBWelcomeController)secondaryWelcomeViewController;
- (STEyeReliefOnboardingController)initWithCoordinator:(id)a3;
- (STHeroWelcomeController)primaryWelcomeViewController;
- (STRootViewModelCoordinator)coordinator;
- (_TtC20ScreenTimeSettingsUI19STEyeReliefMicaView)micaView;
- (id)_createEyeReliefEDUController;
- (id)_createInitialViewControllerWithCoordinator:(id)a3;
- (id)_createPINController;
- (id)_createSecondaryWelcomeController;
- (id)completionHandler;
- (void)_cancelOnboarding;
- (void)_continueButtonPressed;
- (void)_dismissOnboardingAndEnable;
- (void)_handleResponse:(int64_t)a3;
- (void)_presentationControllerDidDismiss:(id)a3;
- (void)didAcceptEnteredPIN;
- (void)didCancelEnteringPIN;
- (void)play;
- (void)presentOverViewController:(id)a3 completionHandler:(id)a4;
- (void)setCoordinator:(id)a3;
- (void)setPrimaryWelcomeViewController:(id)a3;
- (void)setSecondaryWelcomeViewController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation STEyeReliefOnboardingController

- (STEyeReliefOnboardingController)initWithCoordinator:(id)a3
{
  id v5 = a3;
  v6 = [(STEyeReliefOnboardingController *)self _createInitialViewControllerWithCoordinator:v5];
  v14.receiver = self;
  v14.super_class = (Class)STEyeReliefOnboardingController;
  v7 = [(STEyeReliefOnboardingController *)&v14 initWithRootViewController:v6];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_coordinator, a3);
    v9 = objc_alloc_init(_TtC20ScreenTimeSettingsUI19STEyeReliefMicaView);
    micaView = v8->_micaView;
    v8->_micaView = v9;

    v11 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v12 = [v11 userInterfaceIdiom];

    if (!v12) {
      [(OBNavigationController *)v8 setSupportedInterfaceOrientations:2];
    }
    [(STEyeReliefOnboardingController *)v8 setModalPresentationStyle:2];
  }

  return v8;
}

- (void)presentOverViewController:(id)a3 completionHandler:(id)a4
{
  id v8 = a3;
  v6 = _Block_copy(a4);
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v6;

  [v8 presentViewController:self animated:1 completion:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)STEyeReliefOnboardingController;
  [(STEyeReliefOnboardingController *)&v6 viewDidAppear:a3];
  v4 = [(STEyeReliefOnboardingController *)self primaryWelcomeViewController];

  if (v4) {
    [(STEyeReliefOnboardingController *)self play];
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STEyeReliefOnboardingController.viewDidAppear", v5, 2u);
  }
}

- (void)viewDidLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)STEyeReliefOnboardingController;
  [(STEyeReliefOnboardingController *)&v10 viewDidLayoutSubviews];
  v3 = [(STEyeReliefOnboardingController *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  if (v4 == 1) {
    double v5 = 0.901960784;
  }
  else {
    double v5 = 0.196078431;
  }
  objc_super v6 = [MEMORY[0x263F825C8] colorWithRed:v5 green:v5 blue:v5 alpha:1.0];
  v7 = [(STEyeReliefOnboardingController *)self primaryWelcomeViewController];
  id v8 = [v7 contentView];
  [v8 setBackgroundColor:v6];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STEyeReliefOnboardingController.viewDidLayoutSubviews", v9, 2u);
  }
}

- (void)_presentationControllerDidDismiss:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)STEyeReliefOnboardingController;
  [(STEyeReliefOnboardingController *)&v4 _presentationControllerDidDismiss:a3];
  [(STEyeReliefOnboardingController *)self _handleResponse:0];
}

- (void)play
{
  v3 = [(STEyeReliefOnboardingController *)self micaView];
  objc_super v4 = [v3 superview];

  if (!v4)
  {
    id v23 = (id)objc_opt_new();
    [v23 setType:*MEMORY[0x263F15FD8]];
    [v23 setDuration:0.5];
    double v5 = [(STEyeReliefOnboardingController *)self primaryWelcomeViewController];
    objc_super v6 = [v5 contentView];
    v7 = [v6 layer];
    [v7 addAnimation:v23 forKey:0];

    id v8 = [(STEyeReliefOnboardingController *)self micaView];
    [v8 setAutoresizingMask:18];

    v9 = [(STEyeReliefOnboardingController *)self primaryWelcomeViewController];
    objc_super v10 = [v9 contentView];
    v11 = [(STEyeReliefOnboardingController *)self micaView];
    [v10 addSubview:v11];

    uint64_t v12 = [(STEyeReliefOnboardingController *)self primaryWelcomeViewController];
    v13 = [v12 contentView];
    [v13 bounds];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    v22 = [(STEyeReliefOnboardingController *)self micaView];
    objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);
  }
}

- (id)_createInitialViewControllerWithCoordinator:(id)a3
{
  id v4 = a3;
  double v5 = [v4 viewModel];
  objc_super v6 = [v5 me];

  if ([v6 hasPasscode] && (objc_msgSend(v4, "hasAlreadyEnteredPINForSession") & 1) == 0)
  {
    uint64_t v7 = [(STEyeReliefOnboardingController *)self _createPINController];
  }
  else
  {
    uint64_t v7 = [(STEyeReliefOnboardingController *)self _createEyeReliefEDUController];
  }
  id v8 = (void *)v7;

  return v8;
}

- (id)_createEyeReliefEDUController
{
  v3 = +[STScreenTimeSettingsUIBundle bundle];
  double v15 = [v3 localizedStringForKey:@"ScreenDistanceEDUFeatureTitle" value:&stru_26D9391A8 table:0];
  id v4 = [v3 localizedStringForKey:@"ScreenDistanceEDUFeatureDetailText" value:&stru_26D9391A8 table:0];
  double v5 = [[STHeroWelcomeController alloc] initWithTitle:v15 detailText:v4 topInset:0.0];
  objc_super v6 = [v3 localizedStringForKey:@"ScreenDistanceEDUFeatureButtonTrayCaption" value:&stru_26D9391A8 table:0];
  uint64_t v7 = [(STHeroWelcomeController *)v5 buttonTray];
  [v7 setCaptionText:v6];

  id v8 = [MEMORY[0x263F5B898] boldButton];
  v9 = [v3 localizedStringForKey:@"ScreenDistanceEDUFeatureContinueButton" value:&stru_26D9391A8 table:0];
  [v8 setTitle:v9 forState:0];
  [v8 addTarget:self action:sel__continueButtonPressed forControlEvents:64];
  objc_super v10 = [(STHeroWelcomeController *)v5 buttonTray];
  [v10 addButton:v8];

  v11 = [MEMORY[0x263F5B8D0] linkButton];
  uint64_t v12 = [v3 localizedStringForKey:@"ScreenDistanceEDUFeatureNotNowButton" value:&stru_26D9391A8 table:0];
  [v11 setTitle:v12 forState:0];
  [v11 addTarget:self action:sel__cancelOnboarding forControlEvents:64];
  v13 = [(STHeroWelcomeController *)v5 buttonTray];
  [v13 addButton:v11];

  [(STEyeReliefOnboardingController *)self setPrimaryWelcomeViewController:v5];

  return v5;
}

- (id)_createSecondaryWelcomeController
{
  objc_initWeak(&location, self);
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  id v8 = __68__STEyeReliefOnboardingController__createSecondaryWelcomeController__block_invoke;
  v9 = &unk_264767320;
  objc_copyWeak(&v10, &location);
  v2 = _Block_copy(&v6);
  v3 = [STEyeReliefIntroHowItWorksViewController alloc];
  id v4 = -[STEyeReliefIntroHowItWorksViewController initForChecklistFlow:withCompletionHandler:](v3, "initForChecklistFlow:withCompletionHandler:", 0, v2, v6, v7, v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v4;
}

void __68__STEyeReliefOnboardingController__createSecondaryWelcomeController__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (a2) {
    [WeakRetained _dismissOnboardingAndEnable];
  }
  else {
    [WeakRetained _cancelOnboarding];
  }
}

- (void)_handleResponse:(int64_t)a3
{
  uint64_t v6 = [(STEyeReliefOnboardingController *)self completionHandler];
  if (v6)
  {
    id completionHandler = self->_completionHandler;
    self->_id completionHandler = 0;

    v6[2](v6, a3);
  }
}

- (void)_continueButtonPressed
{
  v3 = [(STEyeReliefOnboardingController *)self _createSecondaryWelcomeController];
  [(STEyeReliefOnboardingController *)self setSecondaryWelcomeViewController:v3];

  id v4 = [(STEyeReliefOnboardingController *)self secondaryWelcomeViewController];
  [(OBNavigationController *)self pushViewController:v4 animated:1];
}

- (void)_dismissOnboardingAndEnable
{
  [(STEyeReliefOnboardingController *)self _handleResponse:2];

  [(STEyeReliefOnboardingController *)self dismissViewControllerAnimated:1 completion:&__block_literal_global_1];
}

- (void)_cancelOnboarding
{
  [(STEyeReliefOnboardingController *)self dismissViewControllerAnimated:1 completion:&__block_literal_global_55];

  [(STEyeReliefOnboardingController *)self _handleResponse:0];
}

- (BOOL)validatePIN:(id)a3 forPINController:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [(STEyeReliefOnboardingController *)self coordinator];
  uint64_t v7 = [v6 viewModel];
  id v8 = [v7 me];
  v9 = [v8 passcode];
  char v10 = [v5 isEqualToString:v9];

  return v10;
}

- (void)didAcceptEnteredPIN
{
  v11[1] = *MEMORY[0x263EF8340];
  v3 = [(STEyeReliefOnboardingController *)self coordinator];
  [v3 setHasAlreadyEnteredPINForSession:1];

  id v4 = [(STEyeReliefOnboardingController *)self _createEyeReliefEDUController];
  id v5 = [v4 view];
  [v5 bounds];
  -[STEyeReliefOnboardingController setPreferredContentSize:](self, "setPreferredContentSize:", v6, v7);

  v11[0] = v4;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  [(STEyeReliefOnboardingController *)self setViewControllers:v8 animated:0];

  dispatch_time_t v9 = dispatch_time(0, 750000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__STEyeReliefOnboardingController_didAcceptEnteredPIN__block_invoke;
  block[3] = &unk_264766F30;
  block[4] = self;
  dispatch_after(v9, MEMORY[0x263EF83A0], block);
}

uint64_t __54__STEyeReliefOnboardingController_didAcceptEnteredPIN__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) play];
}

- (void)didCancelEnteringPIN
{
  [(STEyeReliefOnboardingController *)self _handleResponse:0];

  [(STEyeReliefOnboardingController *)self dismissViewControllerAnimated:1 completion:0];
}

- (id)_createPINController
{
  v3 = objc_opt_new();
  [v3 setPinDelegate:self];
  [v3 setMode:3];

  return v3;
}

- (STRootViewModelCoordinator)coordinator
{
  return (STRootViewModelCoordinator *)objc_getProperty(self, a2, 1424, 1);
}

- (void)setCoordinator:(id)a3
{
}

- (STHeroWelcomeController)primaryWelcomeViewController
{
  return self->_primaryWelcomeViewController;
}

- (void)setPrimaryWelcomeViewController:(id)a3
{
}

- (OBWelcomeController)secondaryWelcomeViewController
{
  return self->_secondaryWelcomeViewController;
}

- (void)setSecondaryWelcomeViewController:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (_TtC20ScreenTimeSettingsUI19STEyeReliefMicaView)micaView
{
  return self->_micaView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_micaView, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_secondaryWelcomeViewController, 0);
  objc_storeStrong((id *)&self->_primaryWelcomeViewController, 0);

  objc_storeStrong((id *)&self->_coordinator, 0);
}

@end