@interface PKServiceAddPaymentPassViewController
- (PKServiceAddPaymentPassViewController)init;
- (unint64_t)supportedInterfaceOrientations;
- (void)_applyCancelItem:(id)a3;
- (void)_cancel;
- (void)_hostApplicationDidEnterBackground;
- (void)_hostApplicationWillEnterForeground;
- (void)_launchFlowWithFlowManager;
- (void)dealloc;
- (void)generateRequestWithCertificateChain:(id)a3 nonce:(id)a4 nonceSignature:(id)a5 completionHandler:(id)a6;
- (void)loadView;
- (void)setConfiguration:(id)a3 completionHandler:(id)a4;
- (void)setDisplayPropertiesWithScreenSize:(CGSize)a3 scale:(double)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PKServiceAddPaymentPassViewController

- (PKServiceAddPaymentPassViewController)init
{
  v15.receiver = self;
  v15.super_class = (Class)PKServiceAddPaymentPassViewController;
  v2 = [(PKNavigationController *)&v15 init];
  if (v2)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
    if (PKSecureElementIsAvailable() || PKIsSimulator())
    {
      v4 = [MEMORY[0x1E4F84D50] sharedService];
      if (v4)
      {
        objc_storeStrong((id *)&v2->_managingDeviceWebService, v4);
        [v3 addObject:v4];
      }
    }
    v5 = [MEMORY[0x1E4F84898] sharedInstanceWithRemoteLibrary];
    if ([v5 _hasRemoteLibrary]
      && [v5 isWatchIssuerAppProvisioningSupported])
    {
      id v6 = objc_alloc_init((Class)_MergedGlobals_1_17[0]());
      v7 = [v6 watchPaymentWebService];
      if (v7) {
        [v3 addObject:v7];
      }
    }
    uint64_t v8 = [v3 copy];
    webServices = v2->_webServices;
    v2->_webServices = (NSArray *)v8;

    v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "PKServiceAddPaymentPassViewController: Calling didCompleteFlow for Buddy", v14, 2u);
    }

    v11 = [(Class)off_1EC33AE90[0]() sharedInstance];
    v12 = off_1EC33AE98[0]();
    [v11 didCompleteFlow:v12];
  }
  return v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PKServiceAddPaymentPassViewController;
  [(PKNavigationController *)&v2 dealloc];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)PKServiceAddPaymentPassViewController;
  [(PKServiceAddPaymentPassViewController *)&v5 loadView];
  v3 = [(PKServiceAddPaymentPassViewController *)self view];
  v4 = PKProvisioningBackgroundColor();
  [v3 setBackgroundColor:v4];
}

- (void)_hostApplicationWillEnterForeground
{
  v2.receiver = self;
  v2.super_class = (Class)PKServiceAddPaymentPassViewController;
  [(PKServiceAddPaymentPassViewController *)&v2 _hostApplicationWillEnterForeground];
  [MEMORY[0x1E4F843E0] beginSubjectReporting:*MEMORY[0x1E4F87028]];
}

- (void)_hostApplicationDidEnterBackground
{
  v2.receiver = self;
  v2.super_class = (Class)PKServiceAddPaymentPassViewController;
  [(PKServiceAddPaymentPassViewController *)&v2 _hostApplicationDidEnterBackground];
  [MEMORY[0x1E4F843E0] endSubjectReporting:*MEMORY[0x1E4F87028]];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [MEMORY[0x1E4F843E0] endSubjectReporting:*MEMORY[0x1E4F87028]];
  v5.receiver = self;
  v5.super_class = (Class)PKServiceAddPaymentPassViewController;
  [(PKServiceAddPaymentPassViewController *)&v5 viewDidDisappear:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [MEMORY[0x1E4F843E0] beginSubjectReporting:*MEMORY[0x1E4F87028]];
  v5.receiver = self;
  v5.super_class = (Class)PKServiceAddPaymentPassViewController;
  [(PKServiceAddPaymentPassViewController *)&v5 viewWillAppear:v3];
}

- (void)setDisplayPropertiesWithScreenSize:(CGSize)a3 scale:(double)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v14.CGFloat width = width;
    v14.CGFloat height = height;
    uint64_t v8 = NSStringFromCGSize(v14);
    int v9 = 138543618;
    v10 = v8;
    __int16 v11 = 2048;
    double v12 = a4;
    _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Setting display properties with screenSize=%{public}@ scale=%.f", (uint8_t *)&v9, 0x16u);
  }
  PKSetDisplayProperties();
}

- (void)setConfiguration:(id)a3 completionHandler:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = (void (**)(void))a4;
  [(PKServiceAddPaymentPassViewController *)self _hostAuditToken];
  int v9 = SecTaskCreateWithAuditToken(0, &token);
  if (v9)
  {
    v10 = v9;
    __int16 v11 = (NSString *)SecTaskCopyValueForEntitlement(v9, @"com.apple.developer.team-identifier", 0);
    teamID = self->_teamID;
    self->_teamID = v11;

    if ([(NSString *)self->_teamID length] != 10)
    {
      uint64_t v13 = self->_teamID;
      self->_teamID = 0;
    }
    id v14 = objc_alloc(MEMORY[0x1E4F846C8]);
    uint64_t v15 = [(PKServiceAddPaymentPassViewController *)self _hostProcessIdentifier];
    [(PKServiceAddPaymentPassViewController *)self _hostAuditToken];
    v16 = (void *)[v14 initWithProcessIdentifier:v15 auditToken:&v27];
    [v7 updateAllowManagedAppleIDWithEntitlements:v16];
    self->_entitled = [v16 paymentPassProvisioning];
    CFRelease(v10);
  }
  if ([(NSArray *)self->_webServices count])
  {
    if (self->_entitled)
    {
      objc_storeStrong((id *)&self->_configuration, a3);
      uint64_t v17 = [(PKAddPaymentPassRequestConfiguration *)self->_configuration _filterWebServices:self->_webServices primaryAccountIdentifierRequired:0];
      v18 = (void *)v17;
      if (v17) {
        v19 = (void *)v17;
      }
      else {
        v19 = (void *)MEMORY[0x1E4F1CBF0];
      }
      objc_storeStrong((id *)&self->_webServices, v19);

      [(PKServiceAddPaymentPassViewController *)self _launchFlowWithFlowManager];
      if (v8) {
        v8[2](v8);
      }
      goto LABEL_19;
    }
    v24 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v26 = [(PKServiceAddPaymentPassViewController *)self _hostApplicationBundleIdentifier];
      *(_DWORD *)buf = 138543362;
      v30 = v26;
      _os_log_error_impl(&dword_19F450000, v24, OS_LOG_TYPE_ERROR, "%{public}@ missing entitlement: com.apple.developer.payment-pass-provisioning", buf, 0xCu);
    }
    v20 = [(PKServiceAddPaymentPassViewController *)self _remoteViewControllerProxy];
    v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F87538];
    uint64_t v23 = 2;
  }
  else
  {
    v20 = [(PKServiceAddPaymentPassViewController *)self _remoteViewControllerProxy];
    v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F87538];
    uint64_t v23 = 0;
  }
  v25 = [v21 errorWithDomain:v22 code:v23 userInfo:0];
  [v20 didFinishWithPass:0 error:v25];

  if (v8) {
    v8[2](v8);
  }

LABEL_19:
}

- (void)_launchFlowWithFlowManager
{
  webServices = self->_webServices;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __67__PKServiceAddPaymentPassViewController__launchFlowWithFlowManager__block_invoke;
  v16[3] = &unk_1E59D3F28;
  v16[4] = self;
  v4 = [(NSArray *)webServices pk_firstObjectPassingTest:v16];
  objc_super v5 = self->_webServices;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__PKServiceAddPaymentPassViewController__launchFlowWithFlowManager__block_invoke_2;
  v15[3] = &unk_1E59D3F28;
  v15[4] = self;
  id v6 = [(NSArray *)v5 pk_firstObjectPassingTest:v15];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F84BB8]) initWithWebService:self->_managingDeviceWebService];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F84ED0]) initWithEnvironment:7 provisioningController:v7 groupsController:0];
  [v8 setTeamIdentifier:self->_teamID];
  int v9 = [(PKServiceAddPaymentPassViewController *)self _hostApplicationBundleIdentifier];
  [v8 setHostApplicationBundleIdentifier:v9];

  objc_initWeak(&location, self);
  configuration = self->_configuration;
  v12[4] = self;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__PKServiceAddPaymentPassViewController__launchFlowWithFlowManager__block_invoke_3;
  v13[3] = &unk_1E59D3F50;
  v13[4] = self;
  v11[4] = self;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__PKServiceAddPaymentPassViewController__launchFlowWithFlowManager__block_invoke_4;
  v12[3] = &unk_1E59CA7D0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__PKServiceAddPaymentPassViewController__launchFlowWithFlowManager__block_invoke_5;
  v11[3] = &unk_1E59D3F78;
  +[PKProvisioningFlowBridge startInAppFlowWithNavController:self context:v8 requestConfiguration:configuration phoneWebService:v4 watchWebService:v6 generateRequest:v13 onViewLoaded:v12 completion:v11];
  objc_destroyWeak(&location);
}

BOOL __67__PKServiceAddPaymentPassViewController__launchFlowWithFlowManager__block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(*(void *)(a1 + 32) + 1496) == a2;
}

BOOL __67__PKServiceAddPaymentPassViewController__launchFlowWithFlowManager__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *(void *)(*(void *)(a1 + 32) + 1496) != a2;
}

uint64_t __67__PKServiceAddPaymentPassViewController__launchFlowWithFlowManager__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_super v5 = *(void **)(a1 + 32);
  if (v5) {
    return [v5 generateRequestWithCertificateChain:a2 nonce:a3 nonceSignature:a4 completionHandler:a5];
  }
  else {
    return (*(uint64_t (**)(uint64_t, void))(a5 + 16))(a5, 0);
  }
}

void __67__PKServiceAddPaymentPassViewController__launchFlowWithFlowManager__block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    id v2 = v1;
    id v5 = [v2 viewControllers];
    BOOL v3 = [v5 firstObject];
    v4 = [v3 navigationItem];
    [v2 _applyCancelItem:v4];
  }
}

void __67__PKServiceAddPaymentPassViewController__launchFlowWithFlowManager__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  BOOL v3 = *(void **)(a1 + 32);
  if (v3)
  {
    id v6 = v3;
    id v7 = a3;
    id v10 = [a2 firstObject];
    [v10 sanitizePaymentApplications];
    uint64_t v8 = [v6 _remoteViewControllerProxy];

    int v9 = [v10 paymentPass];
    [v8 didFinishWithPass:v9 error:v7];
  }
}

- (void)generateRequestWithCertificateChain:(id)a3 nonce:(id)a4 nonceSignature:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __116__PKServiceAddPaymentPassViewController_generateRequestWithCertificateChain_nonce_nonceSignature_completionHandler___block_invoke;
    v53[3] = &unk_1E59CC620;
    id v29 = v13;
    id v14 = v13;
    id v54 = v14;
    uint64_t v15 = [(PKServiceAddPaymentPassViewController *)self _remoteViewControllerProxyWithErrorHandler:v53];
    v33 = [(PKAddPaymentPassRequestConfiguration *)self->_configuration encryptionScheme];
    v16 = self->_teamID;
    uint64_t v17 = [(PKServiceAddPaymentPassViewController *)self _hostApplicationBundleIdentifier];
    v28 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v17 allowPlaceholder:1 error:0];
    v18 = [v28 shortVersionString];
    v51[0] = 0;
    v51[1] = v51;
    v51[2] = 0x3032000000;
    v51[3] = __Block_byref_object_copy__24;
    v51[4] = __Block_byref_object_dispose__24;
    id v52 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __116__PKServiceAddPaymentPassViewController_generateRequestWithCertificateChain_nonce_nonceSignature_completionHandler___block_invoke_81;
    aBlock[3] = &unk_1E59D3FC8;
    id v27 = v15;
    id v41 = v27;
    id v32 = v10;
    id v42 = v10;
    id v31 = v11;
    id v19 = v11;
    id v43 = v19;
    id v30 = v12;
    id v44 = v12;
    id v20 = v33;
    id v45 = v20;
    v21 = v16;
    v46 = v21;
    id v22 = v17;
    id v47 = v22;
    id v23 = v18;
    id v48 = v23;
    v50 = v51;
    id v49 = v14;
    v24 = _Block_copy(aBlock);
    v25 = v24;
    if (self->_entitled)
    {
      long long v38 = 0u;
      long long v39 = 0u;
      [(PKServiceAddPaymentPassViewController *)self _hostAuditToken];
      v26 = (void *)MEMORY[0x1E4F84948];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __116__PKServiceAddPaymentPassViewController_generateRequestWithCertificateChain_nonce_nonceSignature_completionHandler___block_invoke_4;
      v35[3] = &unk_1E59D3FF0;
      v37 = v51;
      id v36 = v25;
      v34[0] = v38;
      v34[1] = v39;
      [v26 getFairPlayInfoWithAuditToken:v34 nonce:v19 completion:v35];
    }
    else
    {
      (*((void (**)(void *))v24 + 2))(v24);
    }

    _Block_object_dispose(v51, 8);
    id v11 = v31;
    id v10 = v32;
    id v13 = v29;
    id v12 = v30;
  }
}

void __116__PKServiceAddPaymentPassViewController_generateRequestWithCertificateChain_nonce_nonceSignature_completionHandler___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __116__PKServiceAddPaymentPassViewController_generateRequestWithCertificateChain_nonce_nonceSignature_completionHandler___block_invoke_2;
  block[3] = &unk_1E59CAA98;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __116__PKServiceAddPaymentPassViewController_generateRequestWithCertificateChain_nonce_nonceSignature_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __116__PKServiceAddPaymentPassViewController_generateRequestWithCertificateChain_nonce_nonceSignature_completionHandler___block_invoke_81(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __116__PKServiceAddPaymentPassViewController_generateRequestWithCertificateChain_nonce_nonceSignature_completionHandler___block_invoke_2_82;
  v8[3] = &unk_1E59D3FA0;
  id v9 = *(id *)(a1 + 64);
  id v10 = *(id *)(a1 + 72);
  id v11 = *(id *)(a1 + 80);
  id v12 = *(id *)(a1 + 88);
  long long v7 = *(_OWORD *)(a1 + 96);
  id v6 = (id)v7;
  long long v13 = v7;
  [v2 generateRequestWithCertificateChain:v3 nonce:v4 nonceSignature:v5 completionHandler:v8];
}

void __116__PKServiceAddPaymentPassViewController_generateRequestWithCertificateChain_nonce_nonceSignature_completionHandler___block_invoke_2_82(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setEncryptionVersion:*(void *)(a1 + 32)];
  [v3 setIssuerIdentifier:*(void *)(a1 + 40)];
  [v3 setHostApplicationIdentifier:*(void *)(a1 + 48)];
  [v3 setHostApplicationVersion:*(void *)(a1 + 56)];
  [v3 setFPInfo:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __116__PKServiceAddPaymentPassViewController_generateRequestWithCertificateChain_nonce_nonceSignature_completionHandler___block_invoke_3;
  v6[3] = &unk_1E59CAD68;
  id v4 = *(id *)(a1 + 64);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __116__PKServiceAddPaymentPassViewController_generateRequestWithCertificateChain_nonce_nonceSignature_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __116__PKServiceAddPaymentPassViewController_generateRequestWithCertificateChain_nonce_nonceSignature_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_applyCancelItem:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4FB14A8];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = PKLocalizedString(&cfstr_Cancel.isa);
  id v8 = (id)[v6 initWithTitle:v7 style:0 target:self action:sel__cancel];

  [v5 setLeftBarButtonItem:v8];
}

- (void)_cancel
{
  id v3 = [(PKServiceAddPaymentPassViewController *)self _remoteViewControllerProxy];
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F87538] code:1 userInfo:0];
  [v3 didFinishWithPass:0 error:v2];

  MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85D20], &unk_1EF2BA450);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teamID, 0);
  objc_storeStrong((id *)&self->_managingDeviceWebService, 0);
  objc_storeStrong((id *)&self->_webServices, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end