@interface PKWatchExtensionInstallViewController
+ (BOOL)shouldShowWatchExtensionInstallViewControllerForSecureElementPass:(id)a3 webService:(id)a4;
- (PKPaymentProvisioningController)provisioningController;
- (PKPaymentWebService)webservice;
- (PKProvisioningAnalyticsSessionUIReporter)reporter;
- (PKSecureElementPass)secureElementPass;
- (PKWatchExtensionInstallViewController)initWithSecureElementPass:(id)a3 provisioningController:(id)a4 webService:(id)a5 context:(int64_t)a6;
- (PKWatchExtensionInstallViewControllerFlowDelegate)flowItemDelegate;
- (void)_installNowPressed;
- (void)_proceedToNextScreen;
- (void)explanationViewDidSelectSetupLater:(id)a3;
- (void)loadView;
- (void)lockupViewDidFinishRequest:(id)a3;
- (void)setFlowItemDelegate:(id)a3;
- (void)setProvisioningController:(id)a3;
- (void)setReporter:(id)a3;
- (void)setSecureElementPass:(id)a3;
- (void)setWebservice:(id)a3;
- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PKWatchExtensionInstallViewController

+ (BOOL)shouldShowWatchExtensionInstallViewControllerForSecureElementPass:(id)a3 webService:(id)a4
{
  id v5 = a3;
  v6 = (Class (__cdecl *)())getNPKCompanionAgentConnectionClass_1;
  id v7 = a4;
  id v8 = objc_alloc_init(v6());
  id v9 = [v8 watchPaymentWebService];

  if (v9 == v7)
  {
    v11 = [v5 paymentPass];
    char v10 = [v8 shouldShowWatchExtensionInstallationForPaymentPass:v11];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (PKWatchExtensionInstallViewController)initWithSecureElementPass:(id)a3 provisioningController:(id)a4 webService:(id)a5 context:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PKWatchExtensionInstallViewController;
  v14 = [(PKExplanationViewController *)&v19 initWithContext:a6];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_secureElementPass, a3);
    objc_storeStrong((id *)&v15->_webservice, a5);
    objc_storeStrong((id *)&v15->_provisioningController, a4);
    id v16 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
    [v16 configureWithTransparentBackground];
    v17 = [(PKWatchExtensionInstallViewController *)v15 navigationItem];
    [v17 setStandardAppearance:v16];
  }
  return v15;
}

- (void)loadView
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v42.receiver = self;
  v42.super_class = (Class)PKWatchExtensionInstallViewController;
  [(PKExplanationViewController *)&v42 loadView];
  [(PKExplanationViewController *)self setShowCancelButton:0];
  v3 = [(PKWatchExtensionInstallViewController *)self navigationItem];
  [v3 setHidesBackButton:1];

  uint64_t v4 = [(PKSecureElementPass *)self->_secureElementPass organizationName];
  id v5 = [(PKExplanationViewController *)self explanationView];
  v6 = PKLocalizedAquamanString(&cfstr_InstallWatchEx.isa, &stru_1EF1B4C70.isa, v4);
  [v5 setTitleText:v6];

  v36 = (void *)v4;
  id v7 = PKLocalizedAquamanString(&cfstr_InstallWatchEx_0.isa, &stru_1EF1B5770.isa, v4, v4);
  [v5 setBodyText:v7];

  [v5 setShowPrivacyView:0];
  [v5 setForceShowSetupLaterButton:1];
  id v8 = [PKWatchDeviceAppCarouselView alloc];
  id v9 = -[PKWatchDeviceAppCarouselView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  deviceImageView = self->_deviceImageView;
  self->_deviceImageView = v9;

  [v5 setBodyView:self->_deviceImageView];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v11 = [(PKSecureElementPass *)self->_secureElementPass storeIdentifiers];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v38 objects:v45 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v39;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v39 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F223C8]), "initWithStoreItemIdentifier:error:", objc_msgSend(v16, "unsignedLongLongValue"), 0);
        if (v17)
        {
          v21 = (void *)v17;
          id v20 = v16;

          v22 = [v21 counterpartIdentifiers];
          v18 = [v22 firstObject];

          v23 = [MEMORY[0x1E4F79F10] sharedInstance];
          PKScreenScale();
          if (v24 <= 2.0) {
            uint64_t v25 = 47;
          }
          else {
            uint64_t v25 = 48;
          }
          v37[0] = MEMORY[0x1E4F143A8];
          v37[1] = 3221225472;
          v37[2] = __49__PKWatchExtensionInstallViewController_loadView__block_invoke;
          v37[3] = &unk_1E59CA898;
          v37[4] = self;
          [v23 getIconForBundleID:v18 iconVariant:v25 block:v37 timeout:-1.0];

          goto LABEL_16;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v38 objects:v45 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  v18 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v19 = [(PKSecureElementPass *)self->_secureElementPass uniqueID];
    *(_DWORD *)buf = 138412290;
    v44 = v19;
    _os_log_impl(&dword_19F450000, v18, OS_LOG_TYPE_DEFAULT, "(watch-extension-install) Failed to find application record for pass: %@", buf, 0xCu);
  }
  id v20 = 0;
  v21 = 0;
LABEL_16:

  v26 = [v5 dockView];
  [v26 setPrimaryButton:0];
  if (v20)
  {
    v27 = _PKCreateASCLookupRequestForStoreID(v20, 1);
    v28 = (ASCLockupView *)objc_alloc_init(MEMORY[0x1E4F4BB08]);
    appStoreView = self->_appStoreView;
    self->_appStoreView = v28;

    [(ASCLockupView *)self->_appStoreView setDelegate:self];
    v30 = self->_appStoreView;
    [(PKExplanationViewController *)self context];
    if (PKPaymentSetupContextIsBridge()) {
      PKBridgeForegroundColor();
    }
    else {
    v31 = PKProvisioningSecondaryBackgroundColor();
    }
    [(ASCLockupView *)v30 setBackgroundColor:v31];

    v32 = [(ASCLockupView *)self->_appStoreView layer];
    [v32 setCornerRadius:16.0];

    -[ASCLockupView setLayoutMargins:](self->_appStoreView, "setLayoutMargins:", 10.0, 16.0, 10.0, 16.0);
    [(ASCLockupView *)self->_appStoreView setRequest:v27];
    [v26 setLockUpView:self->_appStoreView];
  }
  else
  {
    v27 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19F450000, v27, OS_LOG_TYPE_ERROR, "PKWatchExtensionInstallViewController had nil storeID.", buf, 2u);
    }
  }

  v33 = [v26 footerView];
  [v33 setManualEntryButton:0];
  v34 = [v33 setupLaterButton];
  v35 = PKLocalizedAquamanString(&cfstr_InstallWatchEx_1.isa);
  [v34 setTitle:v35 forState:0];
}

uint64_t __49__PKWatchExtensionInstallViewController_loadView__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 1040) setAppIconImage:a2];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKWatchExtensionInstallViewController;
  [(PKWatchExtensionInstallViewController *)&v4 viewDidAppear:a3];
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportViewAppeared];
}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  reporter = self->_reporter;
  uint64_t v9 = *MEMORY[0x1E4F86BA0];
  v10[0] = *MEMORY[0x1E4F86B98];
  id v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = a3;
  id v7 = [v5 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [(PKProvisioningAnalyticsSessionUIReporter *)reporter reportButtonPressed:3 context:v7];

  id v8 = [(PKExplanationViewController *)self explanationView];

  if (v8 == v6) {
    [(PKWatchExtensionInstallViewController *)self _proceedToNextScreen];
  }
}

- (void)lockupViewDidFinishRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PKLocalizedAquamanString(&cfstr_InstallWatchEx_2.isa);
  uint64_t v6 = [MEMORY[0x1E4F4BB20] textMetadataWithTitle:v5 subtitle:0];
  objc_initWeak(location, self);
  id v7 = objc_alloc(MEMORY[0x1E4F4BAE0]);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __68__PKWatchExtensionInstallViewController_lockupViewDidFinishRequest___block_invoke;
  v29[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v30, location);
  uint64_t v25 = (void *)[v7 initWithMetadata:v6 action:v29];
  v22 = (void *)v6;
  v23 = (void *)v5;
  double v24 = v4;
  id v8 = [v4 lockup];
  id v9 = objc_alloc(MEMORY[0x1E4F4BAE8]);
  char v10 = [v8 id];
  id v11 = [v8 kind];
  uint64_t v12 = [v8 metrics];
  uint64_t v13 = [v8 icon];
  uint64_t v14 = [v8 heading];
  v15 = [v8 title];
  id v16 = [v8 subtitle];
  uint64_t v17 = [v8 ageRating];
  v18 = (void *)[v9 initWithID:v10 kind:v11 metrics:v12 icon:v13 heading:v14 title:v15 subtitle:v16 ageRating:v17 offer:v25];

  objc_super v19 = (void *)MEMORY[0x1E4FB1EB0];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __68__PKWatchExtensionInstallViewController_lockupViewDidFinishRequest___block_invoke_2;
  v26[3] = &unk_1E59CA870;
  id v20 = v24;
  id v27 = v20;
  id v21 = v18;
  id v28 = v21;
  [v19 performWithoutAnimation:v26];

  objc_destroyWeak(&v30);
  objc_destroyWeak(location);
}

void __68__PKWatchExtensionInstallViewController_lockupViewDidFinishRequest___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _installNowPressed];
    id WeakRetained = v2;
  }
}

uint64_t __68__PKWatchExtensionInstallViewController_lockupViewDidFinishRequest___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setLockup:*(void *)(a1 + 40)];
}

- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  uint64_t v6 = [(PKWatchExtensionInstallViewController *)self view];
  [v6 setUserInteractionEnabled:v4 ^ 1];

  [(PKExplanationViewController *)self showSpinner:v4];
}

- (void)_installNowPressed
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [(PKSecureElementPass *)self->_secureElementPass uniqueID];
  BOOL v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v3;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "(watch-extension-install) begining install of watch extension for pass %@", buf, 0xCu);
  }

  id v5 = objc_alloc_init(getNPKCompanionAgentConnectionClass_1());
  objc_initWeak((id *)buf, self);
  uint64_t v6 = [(PKSecureElementPass *)self->_secureElementPass paymentPass];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  char v10 = __59__PKWatchExtensionInstallViewController__installNowPressed__block_invoke;
  id v11 = &unk_1E59CBA18;
  objc_copyWeak(&v13, (id *)buf);
  id v7 = v3;
  id v12 = v7;
  [v5 beginPairedWatchInstallationOfApplicationForPaymentPass:v6 completion:&v8];

  -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:](self->_reporter, "reportButtonPressed:", 0, v8, v9, v10, v11);
  [(PKWatchExtensionInstallViewController *)self _proceedToNextScreen];

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

void __59__PKWatchExtensionInstallViewController__installNowPressed__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = @"NO";
    int v11 = 138412802;
    if (a2) {
      uint64_t v9 = @"YES";
    }
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "(watch-extension-install) install of watch extension for %@ didBegin %@ error %@", (uint8_t *)&v11, 0x20u);
  }

  if (WeakRetained)
  {
    char v10 = [WeakRetained reporter];
    [v10 reportPageCompleted:a2 context:0];
  }
}

- (void)_proceedToNextScreen
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowItemDelegate);
  [WeakRetained watchExtensionInstallViewControllerDidFinish:self];
}

- (PKWatchExtensionInstallViewControllerFlowDelegate)flowItemDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowItemDelegate);

  return (PKWatchExtensionInstallViewControllerFlowDelegate *)WeakRetained;
}

- (void)setFlowItemDelegate:(id)a3
{
}

- (PKProvisioningAnalyticsSessionUIReporter)reporter
{
  return self->_reporter;
}

- (void)setReporter:(id)a3
{
}

- (PKSecureElementPass)secureElementPass
{
  return self->_secureElementPass;
}

- (void)setSecureElementPass:(id)a3
{
}

- (PKPaymentWebService)webservice
{
  return self->_webservice;
}

- (void)setWebservice:(id)a3
{
}

- (PKPaymentProvisioningController)provisioningController
{
  return self->_provisioningController;
}

- (void)setProvisioningController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisioningController, 0);
  objc_storeStrong((id *)&self->_webservice, 0);
  objc_storeStrong((id *)&self->_secureElementPass, 0);
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_destroyWeak((id *)&self->_flowItemDelegate);
  objc_storeStrong((id *)&self->_appStoreView, 0);

  objc_storeStrong((id *)&self->_deviceImageView, 0);
}

@end