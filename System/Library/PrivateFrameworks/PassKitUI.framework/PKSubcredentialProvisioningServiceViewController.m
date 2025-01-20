@interface PKSubcredentialProvisioningServiceViewController
- (PKSubcredentialProvisioningServiceViewController)init;
- (id)remoteDeviceWebService;
- (unint64_t)supportedInterfaceOrientations;
- (void)_hostApplicationDidEnterBackground;
- (void)_hostApplicationWillEnterForeground;
- (void)didFinishWithPass:(id)a3 error:(id)a4;
- (void)loadView;
- (void)setConfiguration:(id)a3 completionHandler:(id)a4;
- (void)setDisplayPropertiesWithScreenSize:(CGSize)a3 scale:(double)a4;
- (void)subcredentialProvisioningFlowController:(id)a3 didFinishWithPass:(id)a4 error:(id)a5;
- (void)userCanceledPairingWithSubcredentialProvisioningFlowController:(id)a3;
@end

@implementation PKSubcredentialProvisioningServiceViewController

- (PKSubcredentialProvisioningServiceViewController)init
{
  v12.receiver = self;
  v12.super_class = (Class)PKSubcredentialProvisioningServiceViewController;
  v2 = [(PKNavigationController *)&v12 init];
  if (v2)
  {
    v3 = [[PKSubcredentialPairingFlowControllerContext alloc] initWithFlowType:1 referralSource:1];
    pairingContext = v2->_pairingContext;
    v2->_pairingContext = v3;

    v5 = [[PKSubcredentialPairingFlowController alloc] initWithDelegate:v2];
    flowController = v2->_flowController;
    v2->_flowController = v5;

    v7 = v2->_pairingContext;
    v8 = [MEMORY[0x1E4F84D50] sharedService];
    [(PKSubcredentialProvisioningFlowControllerContext *)v7 setLocalDeviceWebService:v8];

    v9 = v2->_pairingContext;
    v10 = [(PKSubcredentialProvisioningServiceViewController *)v2 remoteDeviceWebService];
    [(PKSubcredentialProvisioningFlowControllerContext *)v9 setRemoteDeviceWebService:v10];
  }
  return v2;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)PKSubcredentialProvisioningServiceViewController;
  [(PKSubcredentialProvisioningServiceViewController *)&v5 loadView];
  v3 = [(PKSubcredentialProvisioningServiceViewController *)self view];
  v4 = PKProvisioningBackgroundColor();
  [v3 setBackgroundColor:v4];
}

- (void)_hostApplicationWillEnterForeground
{
  v5.receiver = self;
  v5.super_class = (Class)PKSubcredentialProvisioningServiceViewController;
  [(PKSubcredentialProvisioningServiceViewController *)&v5 _hostApplicationWillEnterForeground];
  v3 = [(PKSubcredentialProvisioningServiceViewController *)self topViewController];
  if ([v3 conformsToProtocol:&unk_1EF304A48])
  {
    id v4 = v3;
    if (objc_opt_respondsToSelector()) {
      [v4 hostApplicationWillEnterForeground];
    }
  }
}

- (void)_hostApplicationDidEnterBackground
{
  v5.receiver = self;
  v5.super_class = (Class)PKSubcredentialProvisioningServiceViewController;
  [(PKSubcredentialProvisioningServiceViewController *)&v5 _hostApplicationDidEnterBackground];
  v3 = [(PKSubcredentialProvisioningServiceViewController *)self topViewController];
  if ([v3 conformsToProtocol:&unk_1EF304A48])
  {
    id v4 = v3;
    if (objc_opt_respondsToSelector()) {
      [v4 hostApplicationDidEnterBackground];
    }
  }
}

- (id)remoteDeviceWebService
{
  v2 = [MEMORY[0x1E4F84898] sharedInstanceWithRemoteLibrary];
  if ([v2 _hasRemoteLibrary])
  {
    id v3 = objc_alloc_init(getNPKCompanionAgentConnectionClass_4());
    id v4 = [v3 watchPaymentWebService];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)didFinishWithPass:(id)a3 error:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = [v7 domain];
    char v10 = [v9 isEqualToString:*MEMORY[0x1E4F85C08]];

    v11 = v8;
    if ((v10 & 1) == 0)
    {
      v11 = PKConvertErrorToAddSecureElementPassProvisioningErrorDomain();
    }
  }
  else
  {
    v11 = 0;
  }
  objc_super v12 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v18 = v6;
    __int16 v19 = 2112;
    v20 = v11;
    __int16 v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "Provisioning did finish with pass %@ and error %@ (original error: %@)", buf, 0x20u);
  }

  [v6 sanitizePaymentApplications];
  v13 = [(PKSubcredentialProvisioningServiceViewController *)self _remoteViewControllerProxy];
  v14 = v13;
  if (v6)
  {
    id v16 = v6;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
    [v14 didFinishWithPasses:v15 error:v11];
  }
  else
  {
    [v13 didFinishWithPasses:0 error:v11];
  }
}

- (void)setDisplayPropertiesWithScreenSize:(CGSize)a3 scale:(double)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v14.CGFloat width = width;
    v14.CGFloat height = height;
    v8 = NSStringFromCGSize(v14);
    int v9 = 138543618;
    char v10 = v8;
    __int16 v11 = 2048;
    double v12 = a4;
    _os_log_error_impl(&dword_19F450000, v7, OS_LOG_TYPE_ERROR, "Setting display properties with screenSize=%{public}@ scale=%.f", (uint8_t *)&v9, 0x16u);
  }
  PKSetDisplayProperties();
}

- (void)setConfiguration:(id)a3 completionHandler:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = objc_alloc(MEMORY[0x1E4F846C8]);
  uint64_t v9 = [(PKSubcredentialProvisioningServiceViewController *)self _hostProcessIdentifier];
  [(PKSubcredentialProvisioningServiceViewController *)self _hostAuditToken];
  char v10 = (void *)[v8 initWithProcessIdentifier:v9 auditToken:v26];
  if ([v10 carKeyCredentialProvisioning])
  {
    [v6 updateAllowManagedAppleIDWithEntitlements:v10];
    if ([v6 configurationType] == 1)
    {
      __int16 v11 = [MEMORY[0x1E4F84898] sharedInstance];
      if ([v11 canAddSecureElementPassWithConfiguration:v6])
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = v6;
          if (![v12 supportedRadioTechnologies])
          {
            uint64_t v13 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19F450000, v13, OS_LOG_TYPE_DEFAULT, "Configuration did not have radio technology type set defaulting to NFC", buf, 2u);
            }

            [v12 setSupportedRadioTechnologies:1];
          }
          [v12 supportedRadioTechnologies];
          [v12 setSupportedRadioTechnologies:PKRadioTechnologyForConfigurationTechnology()];
          [(PKSubcredentialPairingFlowControllerContext *)self->_pairingContext setConfiguration:v12];
          if (PKV2SharingFlowEnabled())
          {
            CGSize v14 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19F450000, v14, OS_LOG_TYPE_DEFAULT, "Using v2 owner pairing flow", buf, 2u);
            }

            id v15 = objc_alloc(MEMORY[0x1E4F84BB8]);
            id v16 = [MEMORY[0x1E4F84D50] sharedService];
            v17 = (void *)[v15 initWithWebService:v16];

            id v18 = (void *)[objc_alloc(MEMORY[0x1E4F84ED0]) initWithEnvironment:7 provisioningController:v17 groupsController:0];
            v25[0] = MEMORY[0x1E4F143A8];
            v25[1] = 3221225472;
            v25[2] = __87__PKSubcredentialProvisioningServiceViewController_setConfiguration_completionHandler___block_invoke;
            v25[3] = &unk_1E59D3F78;
            v25[4] = self;
            +[PKProvisioningFlowBridge startInAppFlowWithNavController:self context:v18 addCarKeyConfiguration:v12 completion:v25];
            if (v7) {
              v7[2](v7);
            }
          }
          else
          {
            v17 = [(PKSubcredentialPairingFlowController *)self->_flowController startingViewControllerForContext:self->_pairingContext];
            [(PKSubcredentialProvisioningServiceViewController *)self pushViewController:v17 animated:0];
            if (v7) {
              v7[2](v7);
            }
          }

LABEL_31:
          goto LABEL_32;
        }
      }
      else
      {
        v24 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v28 = v6;
          _os_log_impl(&dword_19F450000, v24, OS_LOG_TYPE_DEFAULT, "Configuration is not supported by device: %@", buf, 0xCu);
        }
      }
      id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F85C08] code:3 userInfo:0];
      [(PKSubcredentialProvisioningServiceViewController *)self didFinishWithPass:0 error:v12];
      if (v7) {
        v7[2](v7);
      }
      goto LABEL_31;
    }
    uint64_t v23 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v23, OS_LOG_TYPE_DEFAULT, "Unsupported configuration type", buf, 2u);
    }

    v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = *MEMORY[0x1E4F85C08];
    uint64_t v22 = 3;
  }
  else
  {
    __int16 v19 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v19, OS_LOG_TYPE_DEFAULT, "Remote process is not entitled for provisioning", buf, 2u);
    }

    v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = *MEMORY[0x1E4F85C08];
    uint64_t v22 = 2;
  }
  __int16 v11 = [v20 errorWithDomain:v21 code:v22 userInfo:0];
  [(PKSubcredentialProvisioningServiceViewController *)self didFinishWithPass:0 error:v11];
  if (v7) {
    v7[2](v7);
  }
LABEL_32:
}

void __87__PKSubcredentialProvisioningServiceViewController_setConfiguration_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__PKSubcredentialProvisioningServiceViewController_setConfiguration_completionHandler___block_invoke_2;
  block[3] = &unk_1E59CA8E8;
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v5;
  uint64_t v12 = v7;
  id v13 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __87__PKSubcredentialProvisioningServiceViewController_setConfiguration_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) firstObject];
  id v6 = (id)v2;
  if (v2)
  {
    [*(id *)(a1 + 40) didFinishWithPass:v2 error:0];
  }
  else
  {
    id v3 = *(void **)(a1 + 48);
    if (v3)
    {
      id v4 = v3;
    }
    else
    {
      id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F85C08] code:3 userInfo:0];
    }
    id v5 = v4;
    [*(id *)(a1 + 40) didFinishWithPass:0 error:v4];
  }
}

- (void)subcredentialProvisioningFlowController:(id)a3 didFinishWithPass:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __116__PKSubcredentialProvisioningServiceViewController_subcredentialProvisioningFlowController_didFinishWithPass_error___block_invoke;
  block[3] = &unk_1E59CA8E8;
  void block[4] = self;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __116__PKSubcredentialProvisioningServiceViewController_subcredentialProvisioningFlowController_didFinishWithPass_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) didFinishWithPass:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)userCanceledPairingWithSubcredentialProvisioningFlowController:(id)a3
{
  id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F85C08] code:1 userInfo:0];
  [(PKSubcredentialProvisioningServiceViewController *)self didFinishWithPass:0 error:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingContext, 0);

  objc_storeStrong((id *)&self->_flowController, 0);
}

@end