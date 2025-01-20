@interface STSignInToiCloudGroupSpecifierProvider
- (PSSpecifier)signInSpecifier;
- (STSignInToiCloudGroupSpecifierProvider)init;
- (void)_updateEnabledValue;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)presentAppleAccountSignInController:(id)a3;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)setCoordinator:(id)a3;
- (void)setSignInSpecifier:(id)a3;
- (void)signInController:(id)a3 didCompleteWithSuccess:(BOOL)a4 error:(id)a5;
- (void)signInControllerDidCancel:(id)a3;
@end

@implementation STSignInToiCloudGroupSpecifierProvider

- (STSignInToiCloudGroupSpecifierProvider)init
{
  v13.receiver = self;
  v13.super_class = (Class)STSignInToiCloudGroupSpecifierProvider;
  v2 = [(STGroupSpecifierProvider *)&v13 init];
  v3 = v2;
  if (v2)
  {
    [(STGroupSpecifierProvider *)v2 setIsHidden:1];
    v4 = +[STScreenTimeSettingsUIBundle bundle];
    v5 = [v4 localizedStringForKey:@"SignInToiCloudFooterText" value:&stru_26D9391A8 table:0];
    v6 = [(STGroupSpecifierProvider *)v3 groupSpecifier];
    [v6 setObject:v5 forKeyedSubscript:*MEMORY[0x263F600F8]];

    v7 = [v4 localizedStringForKey:@"SignInToiCloudButtonName" value:&stru_26D9391A8 table:0];
    uint64_t v8 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v7 target:v3 set:0 get:0 detail:0 cell:13 edit:0];
    signInSpecifier = v3->_signInSpecifier;
    v3->_signInSpecifier = (PSSpecifier *)v8;

    [(PSSpecifier *)v3->_signInSpecifier setButtonAction:sel_presentAppleAccountSignInController_];
    v10 = [(STGroupSpecifierProvider *)v3 mutableSpecifiers];
    [v10 addObject:v3->_signInSpecifier];
    v11 = [MEMORY[0x263F53C50] sharedConnection];
    [v11 registerObserver:v3];

    [(STSignInToiCloudGroupSpecifierProvider *)v3 _updateEnabledValue];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F53C50] sharedConnection];
  [v3 unregisterObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)STSignInToiCloudGroupSpecifierProvider;
  [(STGroupSpecifierProvider *)&v4 dealloc];
}

- (void)setCoordinator:(id)a3
{
  id v4 = a3;
  v5 = [(STRootGroupSpecifierProvider *)self coordinator];
  [v5 removeObserver:self forKeyPath:@"viewModel.canSignIn" context:@"STSignInToiCloudGroupSpecifierProviderObservationContext"];
  v6.receiver = self;
  v6.super_class = (Class)STSignInToiCloudGroupSpecifierProvider;
  [(STRootGroupSpecifierProvider *)&v6 setCoordinator:v4];
  [v4 addObserver:self forKeyPath:@"viewModel.canSignIn" options:4 context:@"STSignInToiCloudGroupSpecifierProviderObservationContext"];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == @"STSignInToiCloudGroupSpecifierProviderObservationContext")
  {
    id v11 = a3;
    [(STRootGroupSpecifierProvider *)self coordinator];

    int v12 = [v11 isEqualToString:@"viewModel.canSignIn"];
    if (v12)
    {
      if (_os_feature_enabled_impl())
      {
        objc_super v13 = [MEMORY[0x263F53C50] sharedConnection];
        int v14 = [v13 effectiveBoolValueForSetting:*MEMORY[0x263F53890]];

        id v18 = [(STRootGroupSpecifierProvider *)self coordinator];
        v15 = [v18 viewModel];
        unsigned int v16 = [v15 canSignIn] ^ 1;
        if (v14 == 2) {
          uint64_t v17 = 1;
        }
        else {
          uint64_t v17 = v16;
        }
      }
      else
      {
        id v18 = [(STRootGroupSpecifierProvider *)self coordinator];
        v15 = [v18 viewModel];
        uint64_t v17 = [v15 canSignIn] ^ 1;
      }
      [(STGroupSpecifierProvider *)self setIsHidden:v17];
    }
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)STSignInToiCloudGroupSpecifierProvider;
    id v10 = a3;
    [(STSignInToiCloudGroupSpecifierProvider *)&v19 observeValueForKeyPath:v10 ofObject:a4 change:a5 context:a6];
  }
}

- (void)presentAppleAccountSignInController:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  sockaddr address = (sockaddr)xmmword_225C13AE0;
  id v4 = SCNetworkReachabilityCreateWithAddress((CFAllocatorRef)*MEMORY[0x263EFFB08], &address);
  if (!v4) {
    goto LABEL_9;
  }
  v5 = v4;
  SCNetworkReachabilityFlags flags = 0;
  if (!SCNetworkReachabilityGetFlags(v4, &flags) || (char v6 = flags, (flags & 6) != 2))
  {
    CFRelease(v5);
    goto LABEL_9;
  }
  CFRelease(v5);
  if ((v6 & 0x10) != 0)
  {
LABEL_9:
    v7 = +[STScreenTimeSettingsUIBundle bundle];
    id v10 = [v7 localizedStringForKey:@"SignInToiCloudNotConnectedToInternet" value:&stru_26D9391A8 table:0];
    id v11 = [MEMORY[0x263F82418] alertControllerWithTitle:v10 message:0 preferredStyle:1];
    int v12 = (void *)MEMORY[0x263F82400];
    objc_super v13 = [v7 localizedStringForKey:@"ConfirmationButtonOK" value:&stru_26D9391A8 table:0];
    int v14 = [v12 actionWithTitle:v13 style:0 handler:0];
    [v11 addAction:v14];

    [(STGroupSpecifierProvider *)self presentViewController:v11 animated:1];
    goto LABEL_10;
  }
  v7 = objc_opt_new();
  [v7 setDelegate:self];
  uint64_t v8 = [MEMORY[0x263F82670] currentDevice];
  int v9 = objc_msgSend(v8, "sf_isiPad");

  if (v9)
  {
    [v7 setModalPresentationStyle:2];
    [v7 setModalTransitionStyle:0];
  }
  [(STGroupSpecifierProvider *)self presentViewController:v7 animated:1];
LABEL_10:
}

- (void)_updateEnabledValue
{
  v3 = [MEMORY[0x263F53C50] sharedConnection];
  BOOL v4 = [v3 effectiveBoolValueForSetting:*MEMORY[0x263F53710]] != 2;

  id v6 = [NSNumber numberWithBool:v4];
  v5 = [(STSignInToiCloudGroupSpecifierProvider *)self signInSpecifier];
  [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x263F600A8]];
}

- (void)signInController:(id)a3 didCompleteWithSuccess:(BOOL)a4 error:(id)a5
{
}

- (void)signInControllerDidCancel:(id)a3
{
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  [(STSignInToiCloudGroupSpecifierProvider *)self _updateEnabledValue];
  v5 = [(STSignInToiCloudGroupSpecifierProvider *)self signInSpecifier];
  [(STGroupSpecifierProvider *)self reloadSpecifier:v5 animated:1];

  if (_os_feature_enabled_impl())
  {
    id v6 = [MEMORY[0x263F53C50] sharedConnection];
    int v7 = [v6 effectiveBoolValueForSetting:*MEMORY[0x263F53890]];

    id v11 = [(STRootGroupSpecifierProvider *)self coordinator];
    uint64_t v8 = [v11 viewModel];
    unsigned int v9 = [v8 canSignIn] ^ 1;
    if (v7 == 2) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = v9;
    }
    [(STGroupSpecifierProvider *)self setIsHidden:v10];
  }
}

- (PSSpecifier)signInSpecifier
{
  return self->_signInSpecifier;
}

- (void)setSignInSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end