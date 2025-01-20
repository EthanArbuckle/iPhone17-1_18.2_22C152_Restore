@interface VTUISiriDataSharingOptInPresenter
+ (BOOL)siriDataSharingOptInViewFeatureFlagEnabled;
- (BOOL)shouldShowSiriDataSharingOptInView;
- (NSString)reasonForChange;
- (VTUISiriDataSharingOptInPresentationDelegate)presentationDelegate;
- (VTUISiriDataSharingOptInPresenter)init;
- (id)_modalViewControllerForViewStyle:(int64_t)a3;
- (id)_proximityViewForFrame:(CGRect)a3;
- (id)dataSharingOptInTextWelcomeControllerForViewStyle:(int64_t)a3;
- (id)dataSharingOptInViewForFrame:(CGRect)a3 viewStyle:(int64_t)a4;
- (int64_t)sourceOfChange;
- (void)_fetchSiriDataSharingEnabled;
- (void)_requestDismissal;
- (void)_setSiriDataSharingStatus:(int64_t)a3 forceDismissal:(BOOL)a4;
- (void)_userTappedDetailLinkText;
- (void)_userTappedDismissButtonFromProxCard;
- (void)_userTappedOptInToDataSharing;
- (void)_userTappedOptOutOfDataSharing;
- (void)didDismissFromViewController:(id)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)setReasonForChange:(id)a3;
- (void)setSourceOfChange:(int64_t)a3;
- (void)tearDownPresentedViews;
@end

@implementation VTUISiriDataSharingOptInPresenter

- (VTUISiriDataSharingOptInPresenter)init
{
  v8.receiver = self;
  v8.super_class = (Class)VTUISiriDataSharingOptInPresenter;
  v2 = [(VTUISiriDataSharingOptInPresenter *)&v8 init];
  if (v2)
  {
    v3 = (AFSettingsConnection *)objc_alloc_init(MEMORY[0x263F285E0]);
    settings = v2->_settings;
    v2->_settings = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.siri.amnesia", 0);
    settingsQueue = v2->_settingsQueue;
    v2->_settingsQueue = (OS_dispatch_queue *)v5;

    v2->_sourceOfChange = 0;
    [(VTUISiriDataSharingOptInPresenter *)v2 _fetchSiriDataSharingEnabled];
  }
  return v2;
}

- (void)_fetchSiriDataSharingEnabled
{
  objc_initWeak(&location, self);
  settingsQueue = self->_settingsQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __65__VTUISiriDataSharingOptInPresenter__fetchSiriDataSharingEnabled__block_invoke;
  v4[3] = &unk_264D4C258;
  objc_copyWeak(&v5, &location);
  dispatch_async(settingsQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

+ (BOOL)siriDataSharingOptInViewFeatureFlagEnabled
{
  return 1;
}

- (BOOL)shouldShowSiriDataSharingOptInView
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int64_t dataSharingOptInStatus = self->_dataSharingOptInStatus;
  char v3 = dataSharingOptInStatus - 1;
  if ((unint64_t)(dataSharingOptInStatus - 1) >= 3)
  {
    if (!dataSharingOptInStatus)
    {
      v6 = VTUILogContextFacility;
      if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315138;
        v9 = "-[VTUISiriDataSharingOptInPresenter shouldShowSiriDataSharingOptInView]";
        _os_log_impl(&dword_238878000, v6, OS_LOG_TYPE_DEFAULT, "%s #SiriDataSharingOptIn: VTUISiriDataSharingOptInView requested: User has not made a decision. Returning YES", (uint8_t *)&v8, 0xCu);
      }
      char v3 = 1;
    }
  }
  else
  {
    v4 = VTUILogContextFacility;
    BOOL v5 = os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT);
    char v3 = 0;
    if (v5)
    {
      int v8 = 136315138;
      v9 = "-[VTUISiriDataSharingOptInPresenter shouldShowSiriDataSharingOptInView]";
      _os_log_impl(&dword_238878000, v4, OS_LOG_TYPE_DEFAULT, "%s #SiriDataSharingOptIn: VTUISiriDataSharingOptInView requested: User has made a decision. Returning NO", (uint8_t *)&v8, 0xCu);
      char v3 = 0;
    }
  }
  return v3 & 1;
}

- (id)dataSharingOptInViewForFrame:(CGRect)a3 viewStyle:(int64_t)a4
{
  switch(a4)
  {
    case 2:
      goto LABEL_4;
    case 1:
      BOOL v5 = -[VTUISiriDataSharingOptInPresenter _proximityViewForFrame:](self, "_proximityViewForFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
      break;
    case 0:
LABEL_4:
      v4 = -[VTUISiriDataSharingOptInPresenter _modalViewControllerForViewStyle:](self, "_modalViewControllerForViewStyle:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
      BOOL v5 = [v4 view];

      break;
    default:
      BOOL v5 = 0;
      break;
  }
  return v5;
}

- (id)dataSharingOptInTextWelcomeControllerForViewStyle:(int64_t)a3
{
  BOOL v5 = -[VTUISiriDataSharingOptInPresenter _modalViewControllerForViewStyle:](self, "_modalViewControllerForViewStyle:");
  if (a3 == 2) {
    [(VTUISiriDataSharingOptInPresenter *)self setSourceOfChange:2];
  }
  return v5;
}

void __65__VTUISiriDataSharingOptInPresenter__fetchSiriDataSharingEnabled__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)*((void *)WeakRetained + 1);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __65__VTUISiriDataSharingOptInPresenter__fetchSiriDataSharingEnabled__block_invoke_2;
    v5[3] = &unk_264D4C888;
    objc_copyWeak(&v6, v1);
    [v4 getSiriDataSharingOptInStatusWithCompletion:v5];
    objc_destroyWeak(&v6);
  }
}

void __65__VTUISiriDataSharingOptInPresenter__fetchSiriDataSharingEnabled__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_ERROR)) {
      __65__VTUISiriDataSharingOptInPresenter__fetchSiriDataSharingEnabled__block_invoke_2_cold_1();
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      v7 = WeakRetained;
      int v8 = (void *)VTUILogContextFacility;
      if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
      {
        v9 = NSNumber;
        uint64_t v10 = v8;
        v11 = [v9 numberWithInteger:a3];
        int v12 = 136315394;
        v13 = "-[VTUISiriDataSharingOptInPresenter _fetchSiriDataSharingEnabled]_block_invoke";
        __int16 v14 = 2112;
        v15 = v11;
        _os_log_impl(&dword_238878000, v10, OS_LOG_TYPE_DEFAULT, "%s #SiriDataSharingOptIn: Siri data sharing opt in fetch completed with state:%@", (uint8_t *)&v12, 0x16u);
      }
      v7[3] = a3;
    }
  }
}

- (void)_setSiriDataSharingStatus:(int64_t)a3 forceDismissal:(BOOL)a4
{
  self->_int64_t dataSharingOptInStatus = a3;
  objc_initWeak(&location, self);
  settingsQueue = self->_settingsQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __78__VTUISiriDataSharingOptInPresenter__setSiriDataSharingStatus_forceDismissal___block_invoke;
  v8[3] = &unk_264D4C3E0;
  objc_copyWeak(v9, &location);
  v9[1] = (id)a3;
  BOOL v10 = a4;
  dispatch_async(settingsQueue, v8);
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

void __78__VTUISiriDataSharingOptInPresenter__setSiriDataSharingStatus_forceDismissal___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = (void *)VTUILogContextFacility;
    if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = NSNumber;
      uint64_t v6 = *(void *)(a1 + 40);
      v7 = v4;
      int v8 = [v5 numberWithInteger:v6];
      v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(WeakRetained, "sourceOfChange"));
      BOOL v10 = [WeakRetained reasonForChange];
      *(_DWORD *)buf = 136315906;
      v19 = "-[VTUISiriDataSharingOptInPresenter _setSiriDataSharingStatus:forceDismissal:]_block_invoke";
      __int16 v20 = 2112;
      v21 = v8;
      __int16 v22 = 2112;
      v23 = v9;
      __int16 v24 = 2112;
      v25 = v10;
      _os_log_impl(&dword_238878000, v7, OS_LOG_TYPE_DEFAULT, "%s #SiriDataSharingOptIn: Setting data sharing status: %@ source: %@ reason: %@", buf, 0x2Au);
    }
    v11 = (void *)WeakRetained[1];
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = [WeakRetained sourceOfChange];
    __int16 v14 = [WeakRetained reasonForChange];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __78__VTUISiriDataSharingOptInPresenter__setSiriDataSharingStatus_forceDismissal___block_invoke_5;
    v15[3] = &unk_264D4C8B0;
    v16[1] = *(id *)(a1 + 40);
    char v17 = *(unsigned char *)(a1 + 48);
    objc_copyWeak(v16, v2);
    [v11 setSiriDataSharingOptInStatus:v12 propagateToHomeAccessories:1 source:v13 reason:v14 completion:v15];

    objc_destroyWeak(v16);
  }
}

void __78__VTUISiriDataSharingOptInPresenter__setSiriDataSharingStatus_forceDismissal___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = (void *)VTUILogContextFacility;
    if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_ERROR)) {
      __78__VTUISiriDataSharingOptInPresenter__setSiriDataSharingStatus_forceDismissal___block_invoke_5_cold_1(a1, v4, (uint64_t)v3);
    }
  }
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __78__VTUISiriDataSharingOptInPresenter__setSiriDataSharingStatus_forceDismissal___block_invoke_6;
  v5[3] = &unk_264D4C3B8;
  char v7 = *(unsigned char *)(a1 + 48);
  objc_copyWeak(&v6, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], v5);
  objc_destroyWeak(&v6);
}

void __78__VTUISiriDataSharingOptInPresenter__setSiriDataSharingStatus_forceDismissal___block_invoke_6(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = (void *)VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSNumber;
    uint64_t v4 = *(unsigned __int8 *)(a1 + 40);
    id v5 = v2;
    id v6 = [v3 numberWithBool:v4];
    int v8 = 136315394;
    v9 = "-[VTUISiriDataSharingOptInPresenter _setSiriDataSharingStatus:forceDismissal:]_block_invoke";
    __int16 v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_238878000, v5, OS_LOG_TYPE_DEFAULT, "%s #SiriDataSharingOptIn: Setting data sharing completed. Requesting dismissal:%@", (uint8_t *)&v8, 0x16u);
  }
  if (*(unsigned char *)(a1 + 40))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _requestDismissal];
  }
}

- (id)_modalViewControllerForViewStyle:(int64_t)a3
{
  uint64_t v4 = [[VTUISiriDataSharingOptInViewController alloc] initWithViewStyle:a3];
  id v5 = +[MGWrapper sharedMGWrapper];
  int v6 = [v5 isDeviceIPad];

  if (v6)
  {
    char v7 = [(VTUISiriDataSharingOptInViewController *)v4 headerView];
    int v8 = +[VTUIStringsHelper sharedStringsHelper];
    v9 = v8;
    __int16 v10 = @"DATA_SHARING_DETAIL_IPAD";
  }
  else
  {
    v11 = +[MGWrapper sharedMGWrapper];
    int v12 = [v11 isDeviceVision];

    char v7 = [(VTUISiriDataSharingOptInViewController *)v4 headerView];
    int v8 = +[VTUIStringsHelper sharedStringsHelper];
    v9 = v8;
    if (v12) {
      __int16 v10 = @"DATA_SHARING_DETAIL_VISION";
    }
    else {
      __int16 v10 = @"DATA_SHARING_DETAIL_IPHONE";
    }
  }
  uint64_t v13 = [v8 uiLocalizedStringForKey:v10];
  [v7 setDetailText:v13];

  __int16 v14 = [MEMORY[0x263F5B8B8] accessoryButton];
  v15 = +[VTUIStringsHelper sharedStringsHelper];
  uint64_t v16 = [v15 uiLocalizedStringForKey:@"DATA_SHARING_DETAIL_LINK"];
  [v14 setTitle:v16 forState:0];

  [v14 addTarget:self action:sel__userTappedDetailLinkText forControlEvents:64];
  char v17 = [(VTUISiriDataSharingOptInViewController *)v4 headerView];
  [v17 addAccessoryButton:v14];

  v18 = [MEMORY[0x263F5B898] boldButton];
  v19 = +[VTUIStringsHelper sharedStringsHelper];
  __int16 v20 = [v19 uiLocalizedStringForKey:@"DATA_SHARING_CONFIRMATION_BUTTON_TITLE"];
  [v18 setTitle:v20 forState:0];

  [v18 addTarget:self action:sel__userTappedOptInToDataSharing forControlEvents:64];
  v21 = [(VTUISiriDataSharingOptInViewController *)v4 buttonTray];
  [v21 addButton:v18];

  __int16 v22 = [MEMORY[0x263F5B8D0] linkButton];
  v23 = +[VTUIStringsHelper sharedStringsHelper];
  __int16 v24 = [v23 uiLocalizedStringForKey:@"DATA_SHARING_DECLINE_BUTTON_TITLE"];
  [v22 setTitle:v24 forState:0];

  [v22 addTarget:self action:sel__userTappedOptOutOfDataSharing forControlEvents:64];
  v25 = [(VTUISiriDataSharingOptInViewController *)v4 buttonTray];
  [v25 addButton:v22];

  objc_storeStrong((id *)&self->_currentWelcomeController, v4);
  [(VTUISiriDataSharingOptInViewController *)self->_currentWelcomeController setDelegate:self];

  return v4;
}

- (id)_proximityViewForFrame:(CGRect)a3
{
  uint64_t v4 = -[VTUIProximityDataSharingOptInView initWithFrame:]([VTUIProximityDataSharingOptInView alloc], "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  currentProxView = self->_currentProxView;
  self->_currentProxView = v4;

  int v6 = [(VTUIProximityDataSharingOptInView *)self->_currentProxView dismissButton];
  [v6 addTarget:self action:sel__userTappedDismissButtonFromProxCard forControlEvents:64];

  char v7 = [(VTUIProximityDataSharingOptInView *)self->_currentProxView shareButton];
  [v7 addTarget:self action:sel__userTappedOptInToDataSharing forControlEvents:64];

  int v8 = [(VTUIProximityDataSharingOptInView *)self->_currentProxView notNowButton];
  [v8 addTarget:self action:sel__userTappedOptOutOfDataSharing forControlEvents:64];

  v9 = [(VTUIProximityDataSharingOptInView *)self->_currentProxView aboutLink];
  [v9 addTarget:self action:sel__userTappedDetailLinkText forControlEvents:64];

  __int16 v10 = self->_currentProxView;
  return v10;
}

- (void)_userTappedDetailLinkText
{
  id v3 = [MEMORY[0x263F5B8F8] presenterForPrivacySplashWithIdentifier:*MEMORY[0x263F5B930]];
  id v7 = v3;
  if (self->_currentWelcomeController)
  {
    objc_msgSend(v3, "setPresentingViewController:");
    id v3 = v7;
  }
  if (self->_currentProxView)
  {
    uint64_t v4 = [(VTUISiriDataSharingOptInPresenter *)self presentationDelegate];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    id v3 = v7;
    if (isKindOfClass)
    {
      int v6 = [(VTUISiriDataSharingOptInPresenter *)self presentationDelegate];
      [v7 setPresentingViewController:v6];

      id v3 = v7;
    }
  }
  [v3 present];
}

- (void)_userTappedOptInToDataSharing
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[VTUISiriDataSharingOptInPresenter _userTappedOptInToDataSharing]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s #SiriDataSharingOptIn: User has selected to share. Enabling..", (uint8_t *)&v4, 0xCu);
  }
  [(VTUISiriDataSharingOptInPresenter *)self _setSiriDataSharingStatus:1 forceDismissal:1];
}

- (void)_userTappedOptOutOfDataSharing
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[VTUISiriDataSharingOptInPresenter _userTappedOptOutOfDataSharing]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s #SiriDataSharingOptIn: User has selected not to share. Disabling..", (uint8_t *)&v4, 0xCu);
  }
  [(VTUISiriDataSharingOptInPresenter *)self _setSiriDataSharingStatus:2 forceDismissal:1];
}

- (void)_userTappedDismissButtonFromProxCard
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    int v8 = "-[VTUISiriDataSharingOptInPresenter _userTappedDismissButtonFromProxCard]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s #SiriDataSharingOptIn: User tapped the delete button on the prox card.", (uint8_t *)&v7, 0xCu);
  }
  [(VTUISiriDataSharingOptInPresenter *)self _setSiriDataSharingStatus:3 forceDismissal:0];
  int v4 = [(VTUISiriDataSharingOptInPresenter *)self presentationDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [(VTUISiriDataSharingOptInPresenter *)self presentationDelegate];
    [v6 siriDataSharingOptInViewDismissButtonTappedFromPresenter:self];
  }
}

- (void)_requestDismissal
{
  id v3 = [(VTUISiriDataSharingOptInPresenter *)self presentationDelegate];
  [v3 siriDataSharingOptInRequestsDismissalFromPresenter:self];

  currentProxView = self->_currentProxView;
  self->_currentProxView = 0;

  currentWelcomeController = self->_currentWelcomeController;
  self->_currentWelcomeController = 0;
}

- (void)tearDownPresentedViews
{
  currentWelcomeController = self->_currentWelcomeController;
  if (currentWelcomeController)
  {
    [(VTUISiriDataSharingOptInViewController *)currentWelcomeController setDelegate:0];
    int v4 = [(VTUISiriDataSharingOptInViewController *)self->_currentWelcomeController view];
    [v4 removeFromSuperview];

    char v5 = self->_currentWelcomeController;
    self->_currentWelcomeController = 0;
  }
  currentProxView = self->_currentProxView;
  if (currentProxView)
  {
    [(VTUIProximityDataSharingOptInView *)currentProxView removeFromSuperview];
    int v7 = self->_currentProxView;
    self->_currentProxView = 0;
  }
}

- (void)didDismissFromViewController:(id)a3
{
  id v7 = a3;
  if (!self->_dataSharingOptInStatus) {
    [(VTUISiriDataSharingOptInPresenter *)self _setSiriDataSharingStatus:3 forceDismissal:0];
  }
  int v4 = [(VTUISiriDataSharingOptInPresenter *)self presentationDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [(VTUISiriDataSharingOptInPresenter *)self presentationDelegate];
    [v6 siriDataSharingOptInViewControllerDidDismissFromPresenter:self];
  }
}

- (VTUISiriDataSharingOptInPresentationDelegate)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);
  return (VTUISiriDataSharingOptInPresentationDelegate *)WeakRetained;
}

- (void)setPresentationDelegate:(id)a3
{
}

- (int64_t)sourceOfChange
{
  return self->_sourceOfChange;
}

- (void)setSourceOfChange:(int64_t)a3
{
  self->_sourceOfChange = a3;
}

- (NSString)reasonForChange
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setReasonForChange:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reasonForChange, 0);
  objc_destroyWeak((id *)&self->_presentationDelegate);
  objc_storeStrong((id *)&self->_currentProxView, 0);
  objc_storeStrong((id *)&self->_currentWelcomeController, 0);
  objc_storeStrong((id *)&self->_settingsQueue, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

void __65__VTUISiriDataSharingOptInPresenter__fetchSiriDataSharingEnabled__block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_238878000, v0, OS_LOG_TYPE_ERROR, "%s #SiriDataSharingOptIn: Siri data sharing opt in status fetch failed with error:%@", (uint8_t *)v1, 0x16u);
}

void __78__VTUISiriDataSharingOptInPresenter__setSiriDataSharingStatus_forceDismissal___block_invoke_5_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v4 = NSNumber;
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = a2;
  id v7 = [v4 numberWithInteger:v5];
  v9[0] = 136315650;
  OUTLINED_FUNCTION_0();
  __int16 v10 = v8;
  uint64_t v11 = a3;
  _os_log_error_impl(&dword_238878000, v6, OS_LOG_TYPE_ERROR, "%s #SiriDataSharingOptIn: Setting data sharing status:%@ failed with error:%@", (uint8_t *)v9, 0x20u);
}

@end