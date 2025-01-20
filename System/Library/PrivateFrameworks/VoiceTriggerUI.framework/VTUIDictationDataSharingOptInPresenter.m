@interface VTUIDictationDataSharingOptInPresenter
- (OBWelcomeController)currentWelcomeController;
- (VTUIDictationDataSharingOptInPresentationDelegate)presentationDelegate;
- (id)dataSharingOptInAlertController;
- (id)dataSharingOptInView;
- (id)dataSharingReminderAlertController;
- (id)dictationDataSharingOptInAlertViewModel;
- (id)dictationDataSharingOptInReminderViewModel;
- (void)_learnMoreButtonTapped;
- (void)_optInButtonTapped;
- (void)_optOutButtonTapped;
- (void)_userTappedDetailLinkText;
- (void)setCurrentWelcomeController:(id)a3;
- (void)setPresentationDelegate:(id)a3;
@end

@implementation VTUIDictationDataSharingOptInPresenter

- (id)dataSharingOptInView
{
  v3 = [[VTUISiriDataSharingOptInViewController alloc] initWithViewStyle:2];
  v4 = +[MGWrapper sharedMGWrapper];
  int v5 = [v4 isDeviceIPad];

  if (v5)
  {
    v6 = [(VTUISiriDataSharingOptInViewController *)v3 headerView];
    v7 = +[VTUIStringsHelper sharedStringsHelper];
    v8 = v7;
    v9 = @"DATA_SHARING_DETAIL_IPAD";
  }
  else
  {
    v10 = +[MGWrapper sharedMGWrapper];
    int v11 = [v10 isDeviceVision];

    v6 = [(VTUISiriDataSharingOptInViewController *)v3 headerView];
    v7 = +[VTUIStringsHelper sharedStringsHelper];
    v8 = v7;
    if (v11) {
      v9 = @"DATA_SHARING_DETAIL_VISION";
    }
    else {
      v9 = @"DATA_SHARING_DETAIL_IPHONE";
    }
  }
  v12 = [v7 uiLocalizedStringForKey:v9];
  [v6 setDetailText:v12];

  v13 = [MEMORY[0x263F5B8B8] accessoryButton];
  v14 = +[VTUIStringsHelper sharedStringsHelper];
  v15 = [v14 uiLocalizedStringForKey:@"DATA_SHARING_DETAIL_LINK"];
  [v13 setTitle:v15 forState:0];

  [v13 addTarget:self action:sel__userTappedDetailLinkText forControlEvents:64];
  v16 = [(VTUISiriDataSharingOptInViewController *)v3 headerView];
  [v16 addAccessoryButton:v13];

  v17 = [MEMORY[0x263F5B898] boldButton];
  v18 = +[VTUIStringsHelper sharedStringsHelper];
  v19 = [v18 uiLocalizedStringForKey:@"DATA_SHARING_CONFIRMATION_BUTTON_TITLE"];
  [v17 setTitle:v19 forState:0];

  [v17 addTarget:self action:sel__optInButtonTapped forControlEvents:64];
  v20 = [(VTUISiriDataSharingOptInViewController *)v3 buttonTray];
  [v20 addButton:v17];

  v21 = [MEMORY[0x263F5B8D0] linkButton];
  v22 = +[VTUIStringsHelper sharedStringsHelper];
  v23 = [v22 uiLocalizedStringForKey:@"DATA_SHARING_DECLINE_BUTTON_TITLE"];
  [v21 setTitle:v23 forState:0];

  [v21 addTarget:self action:sel__optOutButtonTapped forControlEvents:64];
  v24 = [(VTUISiriDataSharingOptInViewController *)v3 buttonTray];
  [v24 addButton:v21];

  currentWelcomeController = self->_currentWelcomeController;
  self->_currentWelcomeController = &v3->super;
  v26 = v3;

  v27 = [(VTUISiriDataSharingOptInViewController *)v26 view];

  return v27;
}

- (id)dataSharingOptInAlertController
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v30 = "-[VTUIDictationDataSharingOptInPresenter dataSharingOptInAlertController]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s #SiriDataSharingOptIn: Creating dataSharingOptInAlert for dictation", buf, 0xCu);
  }
  v4 = (void *)MEMORY[0x263F82418];
  int v5 = +[VTUIStringsHelper sharedStringsHelper];
  v6 = [v5 uiLocalizedStringForKey:@"DATA_SHARING_TITLE_DICTATION"];
  v7 = +[VTUIStringsHelper sharedStringsHelper];
  v8 = [v7 uiLocalizedStringForKey:@"DICTATION_DATA_SHARING_DETAIL_ALERT"];
  v9 = [v4 alertControllerWithTitle:v6 message:v8 preferredStyle:1];

  objc_initWeak((id *)buf, self);
  v10 = (void *)MEMORY[0x263F82400];
  int v11 = +[VTUIStringsHelper sharedStringsHelper];
  v12 = [v11 uiLocalizedStringForKey:@"DICTATION_DATA_SHARING_CONFIRMATION_BUTTON_TITLE"];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __73__VTUIDictationDataSharingOptInPresenter_dataSharingOptInAlertController__block_invoke;
  v27[3] = &unk_264D4C7A0;
  objc_copyWeak(&v28, (id *)buf);
  v13 = [v10 actionWithTitle:v12 style:0 handler:v27];
  [v9 addAction:v13];

  v14 = (void *)MEMORY[0x263F82400];
  v15 = +[VTUIStringsHelper sharedStringsHelper];
  v16 = [v15 uiLocalizedStringForKey:@"DICTATION_DATA_SHARING_LEARN_MORE_BUTTON_TITLE"];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __73__VTUIDictationDataSharingOptInPresenter_dataSharingOptInAlertController__block_invoke_2;
  v25[3] = &unk_264D4C7A0;
  objc_copyWeak(&v26, (id *)buf);
  v17 = [v14 actionWithTitle:v16 style:0 handler:v25];
  [v9 addAction:v17];

  v18 = (void *)MEMORY[0x263F82400];
  v19 = +[VTUIStringsHelper sharedStringsHelper];
  v20 = [v19 uiLocalizedStringForKey:@"DATA_SHARING_DECLINE_BUTTON_TITLE"];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __73__VTUIDictationDataSharingOptInPresenter_dataSharingOptInAlertController__block_invoke_3;
  v23[3] = &unk_264D4C7A0;
  objc_copyWeak(&v24, (id *)buf);
  v21 = [v18 actionWithTitle:v20 style:0 handler:v23];
  [v9 addAction:v21];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak((id *)buf);
  return v9;
}

void __73__VTUIDictationDataSharingOptInPresenter_dataSharingOptInAlertController__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _optInButtonTapped];
}

void __73__VTUIDictationDataSharingOptInPresenter_dataSharingOptInAlertController__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _learnMoreButtonTapped];
}

void __73__VTUIDictationDataSharingOptInPresenter_dataSharingOptInAlertController__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _optOutButtonTapped];
}

- (id)dataSharingReminderAlertController
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315138;
    v15 = "-[VTUIDictationDataSharingOptInPresenter dataSharingReminderAlertController]";
    _os_log_impl(&dword_238878000, v2, OS_LOG_TYPE_DEFAULT, "%s #SiriDataSharingOptIn: Creating dataSharingReminderAlert for dictation", (uint8_t *)&v14, 0xCu);
  }
  v3 = (void *)MEMORY[0x263F82418];
  v4 = +[VTUIStringsHelper sharedStringsHelper];
  int v5 = [v4 uiLocalizedStringForKey:@"DICTATION_DATA_SHARING_REMINDER_ALERT_TITLE"];
  v6 = +[VTUIStringsHelper sharedStringsHelper];
  v7 = [v6 uiLocalizedStringForKey:@"DICTATION_DATA_SHARING_REMINDER_ALERT_DETAIL"];
  v8 = [v3 alertControllerWithTitle:v5 message:v7 preferredStyle:1];

  v9 = (void *)MEMORY[0x263F82400];
  v10 = +[VTUIStringsHelper sharedStringsHelper];
  int v11 = [v10 uiLocalizedStringForKey:@"DICTATION_DATA_SHARING_REMINDER_ALERT_DISMISS"];
  v12 = [v9 actionWithTitle:v11 style:0 handler:0];
  [v8 addAction:v12];

  return v8;
}

- (id)dictationDataSharingOptInAlertViewModel
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315138;
    uint64_t v16 = "-[VTUIDictationDataSharingOptInPresenter dictationDataSharingOptInAlertViewModel]";
    _os_log_impl(&dword_238878000, v2, OS_LOG_TYPE_DEFAULT, "%s #SiriDataSharingOptIn: Creating dataSharingOptInAlertViewModel for dictation", (uint8_t *)&v15, 0xCu);
  }
  v3 = objc_alloc_init(VTUIDictationDataSharingOptInAlertViewModel);
  v4 = +[VTUIStringsHelper sharedStringsHelper];
  int v5 = [v4 uiLocalizedStringForKey:@"DATA_SHARING_TITLE_DICTATION"];
  [(VTUIDictationDataSharingOptInAlertViewModel *)v3 setTitle:v5];

  v6 = +[VTUIStringsHelper sharedStringsHelper];
  v7 = [v6 uiLocalizedStringForKey:@"DICTATION_DATA_SHARING_DETAIL_ALERT"];
  [(VTUIDictationDataSharingOptInAlertViewModel *)v3 setMessage:v7];

  v8 = +[VTUIStringsHelper sharedStringsHelper];
  v9 = [v8 uiLocalizedStringForKey:@"DICTATION_DATA_SHARING_CONFIRMATION_BUTTON_TITLE"];
  [(VTUIDictationDataSharingOptInAlertViewModel *)v3 setOptInButtonTitle:v9];

  v10 = +[VTUIStringsHelper sharedStringsHelper];
  int v11 = [v10 uiLocalizedStringForKey:@"DICTATION_DATA_SHARING_LEARN_MORE_BUTTON_TITLE"];
  [(VTUIDictationDataSharingOptInAlertViewModel *)v3 setLearnMoreButtonTitle:v11];

  v12 = +[VTUIStringsHelper sharedStringsHelper];
  v13 = [v12 uiLocalizedStringForKey:@"DATA_SHARING_DECLINE_BUTTON_TITLE"];
  [(VTUIDictationDataSharingOptInAlertViewModel *)v3 setOptOutButtonTitle:v13];

  return v3;
}

- (id)dictationDataSharingOptInReminderViewModel
{
  return 0;
}

- (void)_userTappedDetailLinkText
{
  if (self->_currentWelcomeController)
  {
    id v3 = [MEMORY[0x263F5B8F8] presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.improvesiridictation"];
    [v3 setPresentingViewController:self->_currentWelcomeController];
    [v3 present];
  }
}

- (void)_optInButtonTapped
{
  id v3 = [(VTUIDictationDataSharingOptInPresenter *)self presentationDelegate];
  [v3 optInButtonPressedForPresenter:self];
}

- (void)_learnMoreButtonTapped
{
  id v3 = [(VTUIDictationDataSharingOptInPresenter *)self presentationDelegate];
  [v3 learnMoreButtonPressedForPresenter:self];
}

- (void)_optOutButtonTapped
{
  id v3 = [(VTUIDictationDataSharingOptInPresenter *)self presentationDelegate];
  [v3 optOutButtonPressedForPresenter:self];
}

- (VTUIDictationDataSharingOptInPresentationDelegate)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);
  return (VTUIDictationDataSharingOptInPresentationDelegate *)WeakRetained;
}

- (void)setPresentationDelegate:(id)a3
{
}

- (OBWelcomeController)currentWelcomeController
{
  return self->_currentWelcomeController;
}

- (void)setCurrentWelcomeController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentWelcomeController, 0);
  objc_destroyWeak((id *)&self->_presentationDelegate);
}

@end