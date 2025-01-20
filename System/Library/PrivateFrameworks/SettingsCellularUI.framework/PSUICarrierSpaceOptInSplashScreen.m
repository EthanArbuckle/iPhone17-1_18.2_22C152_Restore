@interface PSUICarrierSpaceOptInSplashScreen
- (OBBoldTrayButton)continueButton;
- (PSListController)listController;
- (PSUICarrierSpaceOptInSplashScreen)initWithParent:(id)a3;
- (id)continueButtonAction;
- (id)getLogger;
- (void)continueButtonPressed;
- (void)setContinueButton:(id)a3;
- (void)setContinueButtonAction:(id)a3;
- (void)setListController:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PSUICarrierSpaceOptInSplashScreen

- (PSUICarrierSpaceOptInSplashScreen)initWithParent:(id)a3
{
  id obj = a3;
  v4 = +[PSUICoreTelephonyCarrierBundleCache sharedInstance];
  v5 = [v4 activeDataCarrierName];

  v6 = [v5 stringByReplacingOccurrencesOfString:@"-" withString:@"⁠-⁠"];

  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"SPLASH_SCREEN_TITLE" value:&stru_26D410CA0 table:@"CarrierSpaceOptIn"];
  v9 = NSString;
  v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v11 = [v10 localizedStringForKey:@"SPLASH_SCREEN_EXPLANATION" value:&stru_26D410CA0 table:@"CarrierSpaceOptIn"];
  v12 = objc_msgSend(v9, "stringWithFormat:", v11, v6);
  v26.receiver = self;
  v26.super_class = (Class)PSUICarrierSpaceOptInSplashScreen;
  v13 = [(PSUICarrierSpaceOptInSplashScreen *)&v26 initWithTitle:v8 detailText:v12 icon:0];

  if (v13)
  {
    objc_storeWeak((id *)&v13->_listController, obj);
    v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v15 = [v14 localizedStringForKey:@"BACK_BUTTON_NAME" value:&stru_26D410CA0 table:@"CarrierSpaceOptIn"];
    id WeakRetained = objc_loadWeakRetained((id *)&v13->_listController);
    v17 = [WeakRetained navigationItem];
    [v17 setBackButtonTitle:v15];

    uint64_t v18 = [MEMORY[0x263F5B898] boldButton];
    continueButton = v13->_continueButton;
    v13->_continueButton = (OBBoldTrayButton *)v18;

    v20 = v13->_continueButton;
    v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v22 = [v21 localizedStringForKey:@"CONTINUE_BUTTON" value:&stru_26D410CA0 table:@"CarrierSpaceOptIn"];
    [(OBBoldTrayButton *)v20 setTitle:v22 forState:0];

    [(OBBoldTrayButton *)v13->_continueButton addTarget:v13 action:sel_continueButtonPressed forControlEvents:64];
    v23 = [(PSUICarrierSpaceOptInSplashScreen *)v13 buttonTray];
    [v23 addButton:v13->_continueButton];
  }
  return v13;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PSUICarrierSpaceOptInSplashScreen;
  [(PSUICarrierSpaceOptInSplashScreen *)&v4 viewWillAppear:a3];
  [(OBBoldTrayButton *)self->_continueButton setEnabled:1];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PSUICarrierSpaceOptInSplashScreen;
  [(PSUICarrierSpaceOptInSplashScreen *)&v3 viewWillDisappear:a3];
}

- (void)continueButtonPressed
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  objc_super v3 = [(PSUICarrierSpaceOptInSplashScreen *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    v6 = "-[PSUICarrierSpaceOptInSplashScreen continueButtonPressed]";
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%s splash screen 'Continue' button pressed", (uint8_t *)&v5, 0xCu);
  }

  [(OBBoldTrayButton *)self->_continueButton setEnabled:0];
  continueButtonAction = (void (**)(void))self->_continueButtonAction;
  if (continueButtonAction) {
    continueButtonAction[2]();
  }
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"CarrierSpaceOptIn"];
}

- (id)continueButtonAction
{
  return self->_continueButtonAction;
}

- (void)setContinueButtonAction:(id)a3
{
}

- (PSListController)listController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  return (PSListController *)WeakRetained;
}

- (void)setListController:(id)a3
{
}

- (OBBoldTrayButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong(&self->_continueButtonAction, 0);
}

@end