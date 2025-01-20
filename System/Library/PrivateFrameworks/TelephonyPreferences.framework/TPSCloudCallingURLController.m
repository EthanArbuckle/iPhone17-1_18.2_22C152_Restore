@interface TPSCloudCallingURLController
- (BOOL)isCapabilityEnabled;
- (BOOL)isCapabilityProvisioningURLInvalid;
- (BOOL)shouldEnableCapability;
- (CTXPCServiceSubscriptionContext)subscriptionContext;
- (NSData)capabilityProvisioningPostData;
- (NSURL)capabilityProvisioningURL;
- (TPSCarrierBundleController)carrierBundleController;
- (TPSCloudCallingURLController)init;
- (TPSCloudCallingURLController)initWithSubscriptionContext:(id)a3;
- (TPSCloudCallingURLControllerDelegate)delegate;
- (TPSCloudCallingWebViewController)webViewController;
- (TUSenderIdentityCapabilities)subscriptionCapabilities;
- (id)_webViewControllerWithType:(int64_t)a3;
- (id)genericErrorAlertController;
- (id)provisionCapabilityController;
- (id)subscriptionCapabilitiesForSubscriptionContextUUID:(id)a3;
- (id)updateEmergencyAddressController;
- (int)capabilityProvisioningStatus;
- (void)loadWebViewController;
- (void)reloadWebViewController;
- (void)setCarrierBundleController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setWebViewController:(id)a3;
@end

@implementation TPSCloudCallingURLController

- (TPSCloudCallingURLController)init
{
  return 0;
}

- (TPSCloudCallingURLController)initWithSubscriptionContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSCloudCallingURLController;
  v6 = [(TPSCloudCallingURLController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_subscriptionContext, a3);
  }

  return v7;
}

- (TPSCarrierBundleController)carrierBundleController
{
  carrierBundleController = self->_carrierBundleController;
  if (!carrierBundleController)
  {
    v4 = objc_alloc_init(TPSCarrierBundleController);
    id v5 = self->_carrierBundleController;
    self->_carrierBundleController = v4;

    carrierBundleController = self->_carrierBundleController;
  }
  return carrierBundleController;
}

- (TUSenderIdentityCapabilities)subscriptionCapabilities
{
  v3 = [(TPSCloudCallingURLController *)self subscriptionContext];
  v4 = [v3 uuid];
  id v5 = [(TPSCloudCallingURLController *)self subscriptionCapabilitiesForSubscriptionContextUUID:v4];

  return (TUSenderIdentityCapabilities *)v5;
}

- (id)subscriptionCapabilitiesForSubscriptionContextUUID:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4FADA88] senderIdentityCapabilities];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    v7 = 0;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = [v10 senderIdentityUUID];
        int v12 = [v11 isEqual:v3];

        if (v12)
        {
          id v13 = v10;

          v7 = v13;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)genericErrorAlertController
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = [(TPSCloudCallingURLController *)self subscriptionContext];
  v4 = [(TPSCloudCallingURLController *)self carrierBundleController];
  uint64_t v5 = [v4 objectForKey:@"CarrierName" subscriptionContext:v3];

  uint64_t v6 = [(TPSCloudCallingURLController *)self carrierBundleController];
  v7 = [v6 objectForKey:@"VoWiFiCustomerCareWebsite" subscriptionContext:v3];

  if ([v7 length])
  {
    uint64_t v8 = v7;
  }
  else
  {
    objc_super v9 = [(TPSCloudCallingURLController *)self carrierBundleController];
    uint64_t v8 = [v9 objectForKey:@"VoLTECustomerCareWebsite" subscriptionContext:v3];

    v10 = TPSLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v8;
      _os_log_impl(&dword_1E4DD4000, v10, OS_LOG_TYPE_DEFAULT, "No VoWiFiCustomerCareWebsite URL specified so looking up VoLTECustomerCareWebsite URL (%@)", buf, 0xCu);
    }
  }
  v11 = TUStringKeyForNetwork();
  int v12 = +[TPSLocalizedString localizedStringForKey:v11];

  if ([v5 length])
  {
    id v13 = NSString;
    v14 = TUStringKeyForNetwork();
    long long v15 = +[TPSLocalizedString localizedStringForKey:v14];
    long long v16 = objc_msgSend(v13, "stringWithFormat:", v15, v5);
  }
  else
  {
    v14 = TUStringKeyForNetwork();
    long long v16 = +[TPSLocalizedString localizedStringForKey:v14];
  }

  long long v17 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v12 message:v16 preferredStyle:1];
  uint64_t v18 = [v8 length];
  v19 = (void *)MEMORY[0x1E4FB1410];
  if (v18)
  {
    uint64_t v20 = +[TPSLocalizedString localizedStringForKey:@"CLOUD_CALLING_SHOW_CARRIER_WEB_VIEW_ERROR_VISIT_WEBSITE"];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __59__TPSCloudCallingURLController_genericErrorAlertController__block_invoke;
    v28[3] = &unk_1E6EB2458;
    id v29 = v8;
    v21 = [v19 actionWithTitle:v20 style:0 handler:v28];
    [v17 addAction:v21];

    v22 = (void *)MEMORY[0x1E4FB1410];
    v23 = +[TPSLocalizedString localizedStringForKey:@"CLOUD_CALLING_ALERT_ACTION_TITLE_CANCEL"];
    v24 = [v22 actionWithTitle:v23 style:1 handler:0];
    [v17 addAction:v24];

    v25 = v29;
  }
  else
  {
    v25 = +[TPSLocalizedString localizedStringForKey:@"CLOUD_CALLING_ALERT_ACTION_TITLE_CONFIRM"];
    v26 = [v19 actionWithTitle:v25 style:1 handler:0];
    [v17 addAction:v26];
  }
  return v17;
}

void __59__TPSCloudCallingURLController_genericErrorAlertController__block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  v2 = [MEMORY[0x1E4F1CB10] URLWithString:*(void *)(a1 + 32)];
  [v3 openURL:v2 options:MEMORY[0x1E4F1CC08] completionHandler:0];
}

- (void)reloadWebViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webViewController);

  if (WeakRetained)
  {
    [(TPSCloudCallingURLController *)self loadWebViewController];
  }
}

- (void)loadWebViewController
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1E4DD4000, v0, v1, "Did not receive a non-nil provisioning URL after refreshing CT settings. Presenting generic error alert controller", v2, v3, v4, v5, v6);
}

void __53__TPSCloudCallingURLController_loadWebViewController__block_invoke(uint64_t a1, uint64_t a2)
{
  if ((a2 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    uint64_t v3 = TPSLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __53__TPSCloudCallingURLController_loadWebViewController__block_invoke_cold_1();
    }

    uint64_t v4 = [*(id *)(a1 + 32) delegate];
    uint64_t v5 = [*(id *)(a1 + 32) genericErrorAlertController];
    [v4 presentOrUpdateViewController:v5];
  }
}

void __53__TPSCloudCallingURLController_loadWebViewController__block_invoke_40(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(a2 - 2) >= 2)
  {
    if (!a2)
    {
      uint8_t v6 = TPSLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1E4DD4000, v6, OS_LOG_TYPE_DEFAULT, "Successfully loaded web view URL", v7, 2u);
      }

      [*(id *)(a1 + 32) webSheetCompletion];
    }
  }
  else
  {
    uint64_t v3 = TPSLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __53__TPSCloudCallingURLController_loadWebViewController__block_invoke_cold_1();
    }

    uint64_t v4 = [*(id *)(a1 + 32) delegate];
    uint64_t v5 = [*(id *)(a1 + 32) genericErrorAlertController];
    [v4 presentOrUpdateViewController:v5];
  }
}

- (id)_webViewControllerWithType:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = TPSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    int64_t v11 = a3;
    _os_log_impl(&dword_1E4DD4000, v5, OS_LOG_TYPE_DEFAULT, "_webViewControllerWithType: %ld", (uint8_t *)&v10, 0xCu);
  }

  if ([(TPSCloudCallingURLController *)self capabilityProvisioningStatus] < 1)
  {
    uint64_t v8 = TPSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[TPSCloudCallingURLController _webViewControllerWithType:]();
    }

    v7 = [(TPSCloudCallingURLController *)self genericErrorAlertController];
  }
  else
  {
    uint8_t v6 = [[TPSCloudCallingWebViewController alloc] initWithType:a3];
    [(TPSCloudCallingURLController *)self setWebViewController:v6];
    [(TPSCloudCallingURLController *)self loadWebViewController];
    v7 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v6];
  }
  return v7;
}

- (id)provisionCapabilityController
{
  return [(TPSCloudCallingURLController *)self _webViewControllerWithType:1];
}

- (id)updateEmergencyAddressController
{
  return [(TPSCloudCallingURLController *)self _webViewControllerWithType:2];
}

- (BOOL)shouldEnableCapability
{
  return [(TPSCloudCallingURLController *)self capabilityProvisioningStatus] == 3
      || [(TPSCloudCallingURLController *)self capabilityProvisioningStatus] == 1;
}

- (TPSCloudCallingURLControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TPSCloudCallingURLControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CTXPCServiceSubscriptionContext)subscriptionContext
{
  return self->_subscriptionContext;
}

- (BOOL)isCapabilityEnabled
{
  return self->_capabilityEnabled;
}

- (int)capabilityProvisioningStatus
{
  return self->_capabilityProvisioningStatus;
}

- (NSURL)capabilityProvisioningURL
{
  return self->_capabilityProvisioningURL;
}

- (BOOL)isCapabilityProvisioningURLInvalid
{
  return self->_capabilityProvisioningURLInvalid;
}

- (NSData)capabilityProvisioningPostData
{
  return self->_capabilityProvisioningPostData;
}

- (void)setCarrierBundleController:(id)a3
{
}

- (TPSCloudCallingWebViewController)webViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webViewController);
  return (TPSCloudCallingWebViewController *)WeakRetained;
}

- (void)setWebViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_webViewController);
  objc_storeStrong((id *)&self->_carrierBundleController, 0);
  objc_storeStrong((id *)&self->_capabilityProvisioningPostData, 0);
  objc_storeStrong((id *)&self->_capabilityProvisioningURL, 0);
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __53__TPSCloudCallingURLController_loadWebViewController__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1E4DD4000, v0, v1, "Error loading web view. Presenting generic error alert controller", v2, v3, v4, v5, v6);
}

- (void)_webViewControllerWithType:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1E4DD4000, v0, v1, "Asked for requestCarrierController when provisioning status is not-allowed. Returning generic error alert controller", v2, v3, v4, v5, v6);
}

@end