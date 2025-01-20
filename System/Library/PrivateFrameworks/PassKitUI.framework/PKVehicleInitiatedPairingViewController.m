@interface PKVehicleInitiatedPairingViewController
+ (void)vehicleInitiatedPairingViewControllerForConfiguration:(id)a3 paymentService:(id)a4 completion:(id)a5;
- (BOOL)_canShowWhileLocked;
- (PKVehicleInitiatedPairingViewController)initWithSupportedTerminal:(id)a3 launchURL:(id)a4 referralSource:(unint64_t)a5 didDismiss:(id)a6;
- (void)_configureLinkedApplicationForTerminal:(id)a3;
- (void)_handleEnterCode;
- (void)_handleOpenApp;
- (void)_updateViewState;
- (void)linkedApplicationDidChangeState:(id)a3;
- (void)loadView;
- (void)updateViewConstraints;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation PKVehicleInitiatedPairingViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (void)vehicleInitiatedPairingViewControllerForConfiguration:(id)a3 paymentService:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void (**)(id, void))a5;
  if (([v7 ownerKeyPairingAvailable] & 1) == 0) {
    v9[2](v9, 0);
  }
  v10 = [MEMORY[0x1E4F84898] sharedInstance];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __123__PKVehicleInitiatedPairingViewController_vehicleInitiatedPairingViewControllerForConfiguration_paymentService_completion___block_invoke;
  v14[3] = &unk_1E59DB1D8;
  id v16 = v8;
  id v17 = v9;
  id v15 = v7;
  id v11 = v8;
  id v12 = v7;
  v13 = v9;
  [v10 canAddCarKeyPassWithConfiguration:v12 completion:v14];
}

void __123__PKVehicleInitiatedPairingViewController_vehicleInitiatedPairingViewControllerForConfiguration_paymentService_completion___block_invoke(id *a1, char a2, void *a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v8;
      v10 = "PKVehicleInitiatedPairingViewController: CarKey support check failed: %@";
LABEL_8:
      _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 0xCu);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  if ((a2 & 1) == 0)
  {
    v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = a1[4];
      *(_DWORD *)buf = 138412290;
      id v25 = v14;
      v10 = "PKVehicleInitiatedPairingViewController: CarKey not supported for configuration: %@";
      goto LABEL_8;
    }
LABEL_9:

    (*((void (**)(void))a1[6] + 2))();
    goto LABEL_10;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __123__PKVehicleInitiatedPairingViewController_vehicleInitiatedPairingViewControllerForConfiguration_paymentService_completion___block_invoke_22;
  aBlock[3] = &unk_1E59CA870;
  id v22 = a1[5];
  id v23 = a1[4];
  id v11 = _Block_copy(aBlock);
  [a1[4] setReferralSource:3];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __123__PKVehicleInitiatedPairingViewController_vehicleInitiatedPairingViewControllerForConfiguration_paymentService_completion___block_invoke_2;
  block[3] = &unk_1E59DB1B0;
  id v16 = v7;
  id v12 = a1[4];
  uint64_t v20 = 3;
  id v17 = v12;
  id v18 = v11;
  id v19 = a1[6];
  id v13 = v11;
  dispatch_async(MEMORY[0x1E4F14428], block);

LABEL_10:
}

void __123__PKVehicleInitiatedPairingViewController_vehicleInitiatedPairingViewControllerForConfiguration_paymentService_completion___block_invoke_22(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2) {
    id v3 = v2;
  }
  else {
    id v3 = objc_alloc_init(MEMORY[0x1E4F84C38]);
  }
  id v5 = v3;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F84E20]) initWithCarKeyConfiguration:*(void *)(a1 + 40)];
  [v5 addPendingProvisioning:v4];
}

void __123__PKVehicleInitiatedPairingViewController_vehicleInitiatedPairingViewControllerForConfiguration_paymentService_completion___block_invoke_2(uint64_t a1)
{
  v2 = [PKVehicleInitiatedPairingViewController alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = [*(id *)(a1 + 40) vehicleInitiatedPairingLaunchURL];
  id v5 = [(PKVehicleInitiatedPairingViewController *)v2 initWithSupportedTerminal:v3 launchURL:v4 referralSource:*(void *)(a1 + 64) didDismiss:*(void *)(a1 + 48)];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (PKVehicleInitiatedPairingViewController)initWithSupportedTerminal:(id)a3 launchURL:(id)a4 referralSource:(unint64_t)a5 didDismiss:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v42.receiver = self;
  v42.super_class = (Class)PKVehicleInitiatedPairingViewController;
  id v13 = [(PKVehicleInitiatedPairingViewController *)&v42 init];
  id v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_launchURL, a4);
    v14->_referralSource = a5;
    id v15 = _Block_copy(v12);
    id didDismiss = v14->_didDismiss;
    v14->_id didDismiss = v15;

    uint64_t v17 = [v10 partnerIdentifier];
    partnerIdentifier = v14->_partnerIdentifier;
    v14->_partnerIdentifier = (NSString *)v17;

    id v19 = PKLocalizedCredentialString(&cfstr_VehicleInitiat.isa);
    [(PKVehicleInitiatedPairingViewController *)v14 setTitle:v19];

    uint64_t v20 = (PRXLabel *)objc_alloc_init(MEMORY[0x1E4F94228]);
    subtitleLabel = v14->_subtitleLabel;
    v14->_subtitleLabel = v20;

    [(PRXLabel *)v14->_subtitleLabel setNumberOfLines:0];
    id v22 = v14->_subtitleLabel;
    id v23 = [MEMORY[0x1E4FB08E0] systemFontOfSize:15.0];
    [(PRXLabel *)v22 setFont:v23];

    [(PRXLabel *)v14->_subtitleLabel setTextAlignment:1];
    v24 = v14->_subtitleLabel;
    id v25 = PKLocalizedCredentialString(&cfstr_VehicleInitiat_0.isa);
    [(PRXLabel *)v24 setText:v25];

    uint64_t v26 = [(PKVehicleInitiatedPairingViewController *)v14 contentView];
    [v26 setSubtitleLabel:v14->_subtitleLabel];

    [(PKVehicleInitiatedPairingViewController *)v14 setDismissalType:3];
    objc_initWeak(&location, v14);
    v27 = (void *)MEMORY[0x1E4F94218];
    v28 = PKLocalizedCredentialString(&cfstr_CarKeyEnterCod.isa);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __105__PKVehicleInitiatedPairingViewController_initWithSupportedTerminal_launchURL_referralSource_didDismiss___block_invoke;
    v39[3] = &unk_1E59DB200;
    objc_copyWeak(&v40, &location);
    v29 = [v27 actionWithTitle:v28 style:0 handler:v39];
    id v30 = (id)[(PKVehicleInitiatedPairingViewController *)v14 addAction:v29];

    v31 = (void *)MEMORY[0x1E4F94218];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __105__PKVehicleInitiatedPairingViewController_initWithSupportedTerminal_launchURL_referralSource_didDismiss___block_invoke_2;
    v37[3] = &unk_1E59DB200;
    objc_copyWeak(&v38, &location);
    v32 = [v31 actionWithTitle:&stru_1EF1B5B50 style:0 handler:v37];
    [(PKVehicleInitiatedPairingViewController *)v14 setDismissButtonAction:v32];

    uint64_t v33 = [MEMORY[0x1E4F94218] actionWithTitle:&stru_1EF1B5B50 style:1 handler:&__block_literal_global_177];
    placeholderAction = v14->_placeholderAction;
    v14->_placeholderAction = (PRXAction *)v33;

    id v35 = (id)[(PKVehicleInitiatedPairingViewController *)v14 addAction:v14->_placeholderAction];
    [(PKVehicleInitiatedPairingViewController *)v14 _configureLinkedApplicationForTerminal:v10];
    objc_destroyWeak(&v38);
    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);
  }

  return v14;
}

void __105__PKVehicleInitiatedPairingViewController_initWithSupportedTerminal_launchURL_referralSource_didDismiss___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleEnterCode];
}

void __105__PKVehicleInitiatedPairingViewController_initWithSupportedTerminal_launchURL_referralSource_didDismiss___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

- (void)loadView
{
  v17.receiver = self;
  v17.super_class = (Class)PKVehicleInitiatedPairingViewController;
  [(PKVehicleInitiatedPairingViewController *)&v17 loadView];
  uint64_t v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  bodyLabel = self->_bodyLabel;
  self->_bodyLabel = v3;

  [(UILabel *)self->_bodyLabel setNumberOfLines:0];
  id v5 = self->_bodyLabel;
  v6 = [MEMORY[0x1E4FB08E0] systemFontOfSize:15.0];
  [(UILabel *)v5 setFont:v6];

  id v7 = PKLocalizedCredentialString(&cfstr_VehicleInitiat_1.isa);
  if (self->_referralSource != 2)
  {
    id v8 = PKLocalizedCredentialString(&cfstr_VehicleInitiat_2.isa);
    uint64_t v9 = [v7 stringByAppendingFormat:@" %@", v8];

    id v7 = (void *)v9;
  }
  [(UILabel *)self->_bodyLabel setText:v7];
  [(UILabel *)self->_bodyLabel setTextAlignment:1];
  [(UILabel *)self->_bodyLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  id v10 = (void *)MEMORY[0x1E4FB1818];
  id v11 = PKPassKitUIBundle();
  id v12 = [v10 imageNamed:@"CarKeyVehicleInitiated" inBundle:v11];

  id v13 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v12];
  artworkView = self->_artworkView;
  self->_artworkView = v13;

  [(UIImageView *)self->_artworkView setTranslatesAutoresizingMaskIntoConstraints:0];
  id v15 = [(PKVehicleInitiatedPairingViewController *)self contentView];
  [v15 addSubview:self->_bodyLabel];

  id v16 = [(PKVehicleInitiatedPairingViewController *)self contentView];
  [v16 addSubview:self->_artworkView];

  [(PKVehicleInitiatedPairingViewController *)self _updateViewState];
}

- (void)updateViewConstraints
{
  v56[11] = *MEMORY[0x1E4F143B8];
  v55.receiver = self;
  v55.super_class = (Class)PKVehicleInitiatedPairingViewController;
  [(PKVehicleInitiatedPairingViewController *)&v55 updateViewConstraints];
  if (!self->_layoutConstraints)
  {
    uint64_t v3 = [(UIImageView *)self->_artworkView image];
    [v3 size];
    double v5 = v4;
    double v7 = v6;

    id v8 = [(PKVehicleInitiatedPairingViewController *)self contentView];
    uint64_t v9 = [v8 mainContentGuide];

    id v10 = [(PRXLabel *)self->_subtitleLabel widthAnchor];
    id v11 = [v9 widthAnchor];
    id v12 = [v10 constraintEqualToAnchor:v11 multiplier:0.85];

    v53 = v12;
    LODWORD(v13) = 1148829696;
    [v12 setPriority:v13];
    id v14 = [(UILabel *)self->_bodyLabel widthAnchor];
    id v15 = [v9 widthAnchor];
    id v16 = [v14 constraintEqualToAnchor:v15 multiplier:0.85];

    v51 = v16;
    LODWORD(v17) = 1148829696;
    [v16 setPriority:v17];
    id v18 = [(UIImageView *)self->_artworkView widthAnchor];
    id v19 = [v9 widthAnchor];
    v54 = [v18 constraintEqualToAnchor:v19 multiplier:0.37];

    LODWORD(v20) = 1148829696;
    [v54 setPriority:v20];
    v21 = [(UIImageView *)self->_artworkView bottomAnchor];
    id v22 = [v9 bottomAnchor];
    id v23 = [v21 constraintEqualToAnchor:v22 constant:-20.0];

    LODWORD(v24) = 1148813312;
    v45 = v23;
    [v23 setPriority:v24];
    id v25 = [(UIImageView *)self->_artworkView bottomAnchor];
    uint64_t v26 = [v9 bottomAnchor];
    v27 = [v25 constraintLessThanOrEqualToAnchor:v26 constant:-20.0];

    v28 = v27;
    v44 = v27;
    LODWORD(v29) = 1148829696;
    [v27 setPriority:v29];
    v56[0] = v12;
    v52 = [(PRXLabel *)self->_subtitleLabel centerXAnchor];
    v50 = [v9 centerXAnchor];
    v49 = [v52 constraintEqualToAnchor:v50];
    v56[1] = v49;
    v48 = [(UILabel *)self->_bodyLabel topAnchor];
    v47 = [v9 topAnchor];
    v46 = [v48 constraintEqualToAnchor:v47 constant:0.0];
    v56[2] = v46;
    v56[3] = v16;
    v43 = [(UILabel *)self->_bodyLabel centerXAnchor];
    objc_super v42 = [v9 centerXAnchor];
    v41 = [v43 constraintEqualToAnchor:v42];
    v56[4] = v41;
    id v40 = [(UIImageView *)self->_artworkView topAnchor];
    id v30 = [(UILabel *)self->_bodyLabel bottomAnchor];
    v31 = [v40 constraintEqualToAnchor:v30 constant:30.0];
    v56[5] = v31;
    v56[6] = v23;
    v56[7] = v28;
    v56[8] = v54;
    v32 = [(UIImageView *)self->_artworkView heightAnchor];
    uint64_t v33 = [(UIImageView *)self->_artworkView widthAnchor];
    v34 = [v32 constraintEqualToAnchor:v33 multiplier:v7 / v5];
    v56[9] = v34;
    id v35 = [(UIImageView *)self->_artworkView centerXAnchor];
    v36 = [v9 centerXAnchor];
    v37 = [v35 constraintEqualToAnchor:v36];
    v56[10] = v37;
    id v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:11];
    layoutConstraints = self->_layoutConstraints;
    self->_layoutConstraints = v38;

    [MEMORY[0x1E4F28DC8] activateConstraints:self->_layoutConstraints];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PKVehicleInitiatedPairingViewController;
  [(PKVehicleInitiatedPairingViewController *)&v12 viewDidAppear:a3];
  double v4 = (void *)MEMORY[0x1E4F84EC0];
  double v5 = PKSubcredentialPairingReferralSourceToString();
  double v6 = [v4 startAnalyticsSessionForEnvironment:@"first_party.wallet" intent:@"provision" referralSource:v5];
  analyticsSession = self->_analyticsSession;
  self->_analyticsSession = v6;

  [(PKProvisioningAnalyticsSession *)self->_analyticsSession setProductType:*MEMORY[0x1E4F86BF8] subtype:@"cars"];
  id v8 = objc_alloc_init(MEMORY[0x1E4F84C98]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F84CA8]);
  [v9 setType:11];
  [v9 setPartnerIdentifier:self->_partnerIdentifier];
  [v9 setProductIdentifier:*MEMORY[0x1E4F87BE8]];
  [v8 setConfiguration:v9];
  [(PKProvisioningAnalyticsSession *)self->_analyticsSession setSetupProduct:v8];
  id v10 = [(PKProvisioningAnalyticsSession *)self->_analyticsSession createViewReporterForPage:*MEMORY[0x1E4F86E80]];
  reporter = self->_reporter;
  self->_reporter = v10;

  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportViewAppeared];
}

- (void)_configureLinkedApplicationForTerminal:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v6 = objc_msgSend(v4, "associatedApplicationIdentifiers", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v10), "integerValue"));
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  objc_super v12 = [[PKLinkedApplication alloc] initWithStoreIDs:v5 defaultLaunchURL:0];
  linkedApplication = self->_linkedApplication;
  self->_linkedApplication = v12;

  [(PKLinkedApplication *)self->_linkedApplication addObserver:self];
  [(PKLinkedApplication *)self->_linkedApplication reloadApplicationStateIfNecessary];
  [(PKVehicleInitiatedPairingViewController *)self showActivityIndicatorWithStatus:&stru_1EF1B5B50];
}

- (void)_updateViewState
{
  if ([(PKVehicleInitiatedPairingViewController *)self isViewLoaded])
  {
    uint64_t v3 = self->_linkedApplication;
    uint64_t v4 = [(PKLinkedApplication *)v3 state];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = [(PKLinkedApplication *)v3 displayName];
      uint64_t v7 = (__CFString *)v6;
      uint64_t v8 = @"partner";
      if (v6) {
        uint64_t v8 = (__CFString *)v6;
      }
      uint64_t v9 = PKLocalizedCredentialString(&cfstr_VehicleInitiat_3.isa, &stru_1EF1B4C70.isa, v8);
      if (self->_referralSource != 2)
      {
        uint64_t v10 = PKLocalizedCredentialString(&cfstr_VehicleInitiat_2.isa);
        uint64_t v11 = [v9 stringByAppendingFormat:@" %@", v10];

        uint64_t v9 = (void *)v11;
      }
      [(UILabel *)self->_bodyLabel setText:v9];
      if (self->_placeholderAction)
      {
        -[PKVehicleInitiatedPairingViewController removeAction:](self, "removeAction:");
        placeholderAction = self->_placeholderAction;
        self->_placeholderAction = 0;

        if (v5 == 1)
        {
          objc_initWeak(&location, self);
          BOOL v13 = [(PKLinkedApplication *)v3 isInstalled];
          long long v14 = @"CAR_KEY_GET_PARTNER_APP_ACTION";
          if (v13) {
            long long v14 = @"CAR_KEY_OPEN_PARTNER_APP_ACTION";
          }
          long long v15 = v14;
          long long v16 = v15;
          long long v17 = @"Partner";
          if (v7) {
            long long v17 = v7;
          }
          id v18 = PKLocalizedCredentialString(v15, &stru_1EF1B4C70.isa, v17);
          uint64_t v19 = (void *)MEMORY[0x1E4F94218];
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = __59__PKVehicleInitiatedPairingViewController__updateViewState__block_invoke;
          v22[3] = &unk_1E59DB200;
          objc_copyWeak(&v23, &location);
          double v20 = [v19 actionWithTitle:v18 style:1 handler:v22];
          id v21 = (id)[(PKVehicleInitiatedPairingViewController *)self addAction:v20];

          objc_destroyWeak(&v23);
          objc_destroyWeak(&location);
        }
        [(PKVehicleInitiatedPairingViewController *)self hideActivityIndicator];
      }
    }
  }
}

void __59__PKVehicleInitiatedPairingViewController__updateViewState__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleOpenApp];
}

- (void)linkedApplicationDidChangeState:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    uint64_t v7 = [v4 state];
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "PKVehicleInitiatedPairingViewController: linkedApplicationDidChangeState: %ld", (uint8_t *)&v6, 0xCu);
  }

  if ([v4 state]) {
    [(PKVehicleInitiatedPairingViewController *)self _updateViewState];
  }
  else {
    [v4 reloadApplicationStateIfNecessary];
  }
}

- (void)_handleEnterCode
{
  self->_exitedWithOtherDestination = 1;
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __59__PKVehicleInitiatedPairingViewController__handleEnterCode__block_invoke;
  v2[3] = &unk_1E59CA7D0;
  v2[4] = self;
  [(PKVehicleInitiatedPairingViewController *)self dismissViewControllerAnimated:1 completion:v2];
}

void __59__PKVehicleInitiatedPairingViewController__handleEnterCode__block_invoke(uint64_t a1)
{
  v22[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F62688];
  v21[0] = *MEMORY[0x1E4F626A0];
  v21[1] = v2;
  v22[0] = MEMORY[0x1E4F1CC38];
  v22[1] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  id v4 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:*(void *)(*(void *)(a1 + 32) + 1072) resolvingAgainstBaseURL:0];
  int v6 = [*(id *)(*(void *)(a1 + 32) + 1144) archivedParentToken];
  uint64_t v7 = [v6 URLBase64EncodedString];

  if (v7)
  {
    uint64_t v8 = [v5 queryItems];
    uint64_t v9 = (void *)[v8 mutableCopy];

    id v10 = objc_alloc(MEMORY[0x1E4F290C8]);
    uint64_t v11 = (void *)[v10 initWithName:*MEMORY[0x1E4F87FC0] value:v7];
    [v9 addObject:v11];

    [v5 setQueryItems:v9];
  }
  objc_super v12 = [v5 URL];
  id v16 = 0;
  [v4 openURL:v12 withOptions:v3 error:&v16];
  id v13 = v16;
  long long v14 = *(void **)(*(void *)(a1 + 32) + 1152);
  if (v13)
  {
    [v14 reportOtherError:*MEMORY[0x1E4F861C8] context:0];
  }
  else
  {
    [v14 reportOtherButtonPressed:*MEMORY[0x1E4F861C0]];
    [*(id *)(*(void *)(a1 + 32) + 1144) stop];
  }
  long long v15 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = v12;
    __int16 v19 = 2112;
    id v20 = v13;
    _os_log_impl(&dword_19F450000, v15, OS_LOG_TYPE_DEFAULT, "PKVehicleInitiatedPairingViewController: Launched Wallet app with URL %@, error: %@", buf, 0x16u);
  }
}

- (void)_handleOpenApp
{
  uint64_t v3 = self->_linkedApplication;
  id v4 = v3;
  if (v3)
  {
    self->_exitedWithOtherDestination = 1;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __57__PKVehicleInitiatedPairingViewController__handleOpenApp__block_invoke;
    v6[3] = &unk_1E59CA870;
    v6[4] = self;
    uint64_t v7 = v3;
    [(PKVehicleInitiatedPairingViewController *)self dismissViewControllerAnimated:1 completion:v6];
  }
  else
  {
    [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportOtherError:*MEMORY[0x1E4F866F0] context:0];
    uint64_t v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "PKVehicleInitiatedPairingViewController: Failed to open, linkedApplication was nil.", buf, 2u);
    }
  }
}

uint64_t __57__PKVehicleInitiatedPairingViewController__handleOpenApp__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1152) reportOtherButtonPressed:*MEMORY[0x1E4F866E8]];
  [*(id *)(*(void *)(a1 + 32) + 1144) stop];
  uint64_t v2 = *(void **)(a1 + 40);

  return [v2 openApplication:0 withLaunchOptions:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKVehicleInitiatedPairingViewController;
  [(PKVehicleInitiatedPairingViewController *)&v5 viewDidDisappear:a3];
  id didDismiss = (void (**)(void))self->_didDismiss;
  if (didDismiss) {
    didDismiss[2]();
  }
  if (!self->_exitedWithOtherDestination)
  {
    [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportButtonPressed:2];
    [(PKProvisioningAnalyticsSession *)self->_analyticsSession stop];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partnerIdentifier, 0);
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_storeStrong((id *)&self->_analyticsSession, 0);
  objc_storeStrong(&self->_didDismiss, 0);
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_storeStrong((id *)&self->_placeholderAction, 0);
  objc_storeStrong((id *)&self->_linkedApplication, 0);
  objc_storeStrong((id *)&self->_artworkView, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);

  objc_storeStrong((id *)&self->_launchURL, 0);
}

@end