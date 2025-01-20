@interface MSDDemoSetupViewController
- (MSDDemoSetupViewController)init;
- (void)_continueTapped:(id)a3;
- (void)_showEraseConfirmation;
- (void)_skipTapped:(id)a3;
@end

@implementation MSDDemoSetupViewController

- (MSDDemoSetupViewController)init
{
  v3 = +[MSDSetupUILocalization localizedStringForKey:@"DEMO_SETUP_TITLE"];
  v4 = +[MSDSetupUILocalization localizedStringForKey:@"DEMO_SETUP_DESCRIPTION"];
  v5 = +[MSDSetupUILocalization localizedStringForKey:@"CONTINUE_BUTTON"];
  v6 = +[MSDSetupUILocalization localizedStringForKey:@"NOT_A_DEMO_DEVICE_BUTTON"];
  v7 = [MEMORY[0x263F1C6B0] systemImageNamed:@"arrow.triangle.2.circlepath.circle.fill"];
  v16.receiver = self;
  v16.super_class = (Class)MSDDemoSetupViewController;
  v8 = [(MSDDemoSetupViewController *)&v16 initWithTitle:v3 detailText:v4 icon:v7];
  v9 = v8;
  if (v8)
  {
    v10 = [(OBBaseWelcomeController *)v8 navigationItem];
    [v10 setHidesBackButton:1];

    v11 = [MEMORY[0x263F5B898] boldButton];
    [v11 setTitle:v5 forState:0];
    [v11 addTarget:v9 action:sel__continueTapped_ forControlEvents:64];
    v12 = [(MSDDemoSetupViewController *)v9 buttonTray];
    [v12 addButton:v11];

    v13 = [MEMORY[0x263F5B8D0] linkButton];
    [v13 setTitle:v6 forState:0];
    [v13 addTarget:v9 action:sel__skipTapped_ forControlEvents:64];
    v14 = [(MSDDemoSetupViewController *)v9 buttonTray];
    [v14 addButton:v13];
  }
  return v9;
}

- (void)_continueTapped:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = defaultLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138543618;
    id v20 = (id)objc_opt_class();
    __int16 v21 = 2114;
    id v22 = v3;
    id v5 = v20;
    _os_log_impl(&dword_23911B000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Continue button tapped from: %{public}@", (uint8_t *)&v19, 0x16u);
  }
  id v6 = objc_alloc_init(MEMORY[0x263F00A60]);
  int v7 = [v6 authorizationStatus];
  v8 = defaultLogHandle();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7 < 3)
  {
    if (v9)
    {
      v14 = objc_opt_class();
      id v15 = v14;
      int v16 = [v6 authorizationStatus];
      int v19 = 138543618;
      id v20 = v14;
      __int16 v21 = 1024;
      LODWORD(v22) = v16;
      _os_log_impl(&dword_23911B000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: location authorization status is %d; showing Location view",
        (uint8_t *)&v19,
        0x12u);
    }
    v13 = off_264D87EC8;
  }
  else
  {
    if (v9)
    {
      v10 = objc_opt_class();
      id v11 = v10;
      int v12 = [v6 authorizationStatus];
      int v19 = 138543618;
      id v20 = v10;
      __int16 v21 = 1024;
      LODWORD(v22) = v12;
      _os_log_impl(&dword_23911B000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: location is authorized: %d; showing Store Search view",
        (uint8_t *)&v19,
        0x12u);
    }
    v13 = off_264D87F20;
  }

  id v17 = objc_alloc_init(*v13);
  v18 = +[MSDSetupUIController sharedInstance];
  [v18 pushViewController:v17 andRemoveTopmostView:0];
}

- (void)_skipTapped:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = defaultLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543618;
    id v8 = (id)objc_opt_class();
    __int16 v9 = 2114;
    id v10 = v4;
    id v6 = v8;
    _os_log_impl(&dword_23911B000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Not a Demo Device button tapped from: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  [(MSDDemoSetupViewController *)self _showEraseConfirmation];
}

- (void)_showEraseConfirmation
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__MSDDemoSetupViewController__showEraseConfirmation__block_invoke;
  block[3] = &unk_264D88200;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __52__MSDDemoSetupViewController__showEraseConfirmation__block_invoke(uint64_t a1)
{
  id v7 = +[MSDSetupUILocalization localizedStringForKey:@"EACS_MESSAGE"];
  v2 = +[MSDSetupUILocalization localizedStringForKey:@"EACS_CONFIRM_OPTION"];
  id v3 = +[MSDSetupUILocalization localizedStringForKey:@"CANCEL_OPTION"];
  id v4 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v7 message:0 preferredStyle:0];
  id v5 = [MEMORY[0x263F1C3F0] actionWithTitle:v2 style:2 handler:&__block_literal_global_5];
  id v6 = [MEMORY[0x263F1C3F0] actionWithTitle:v3 style:1 handler:0];
  [v4 addAction:v5];
  [v4 addAction:v6];
  [*(id *)(a1 + 32) presentViewController:v4 animated:1 completion:0];
}

void __52__MSDDemoSetupViewController__showEraseConfirmation__block_invoke_2()
{
  v0 = defaultLogHandle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_23911B000, v0, OS_LOG_TYPE_DEFAULT, "EACS confirmed", v2, 2u);
  }

  v1 = +[MSDSetupUIController sharedInstance];
  [v1 markAsNotDemoAndEraseDataPlan:1];
}

@end