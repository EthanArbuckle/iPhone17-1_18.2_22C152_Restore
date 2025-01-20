@interface PKPushableCredentialsNavigationController
- (unint64_t)supportedInterfaceOrientations;
- (void)didFinishWithPasses:(id)a3 error:(id)a4;
- (void)loadView;
- (void)setConfiguration:(id)a3 completionHandler:(id)a4;
- (void)setDisplayPropertiesWithScreenSize:(CGSize)a3 scale:(double)a4;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
@end

@implementation PKPushableCredentialsNavigationController

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)loadView
{
  v2.receiver = self;
  v2.super_class = (Class)PKPushableCredentialsNavigationController;
  [(PKPushableCredentialsNavigationController *)&v2 loadView];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)PKPushableCredentialsNavigationController;
  [(PKPushableCredentialsNavigationController *)&v4 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
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
    v8 = NSStringFromCGSize(v14);
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
  id v6 = a3;
  v7 = (void (**)(void))a4;
  id v8 = objc_alloc(MEMORY[0x1E4F846C8]);
  uint64_t v9 = [(PKPushableCredentialsNavigationController *)self _hostProcessIdentifier];
  [(PKPushableCredentialsNavigationController *)self _hostAuditToken];
  v10 = (void *)[v8 initWithProcessIdentifier:v9 auditToken:v29];
  if (([v10 shareableCredentialProvisioning] & 1) == 0)
  {
    v17 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19F450000, v17, OS_LOG_TYPE_DEFAULT, "Remote process is not entitled for provisioning", (uint8_t *)buf, 2u);
    }

    v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F85C08];
    uint64_t v20 = 2;
    goto LABEL_16;
  }
  [v6 updateAllowManagedAppleIDWithEntitlements:v10];
  uint64_t v11 = [v6 configurationType];
  if (v11 == 2 || v11 == 4)
  {
    if ([v6 conformsToProtocol:&unk_1EF431118])
    {
      id v12 = v6;
      uint64_t v13 = [v12 metadataProviders];
      CGSize v14 = [v13 objectAtIndexedSubscript:0];
      v15 = [v14 provisioningTarget];
      uint64_t v16 = [v15 targetDevice];

      if (v16 == 2) {
        [MEMORY[0x1E4F84D50] remoteDeviceWebService];
      }
      else {
      v23 = [MEMORY[0x1E4F84D50] sharedService];
      }
      v24 = (void *)[objc_alloc(MEMORY[0x1E4F84BB8]) initWithWebService:v23];
      v25 = (void *)[objc_alloc(MEMORY[0x1E4F84ED0]) initWithEnvironment:7 provisioningController:v24 groupsController:0];
      objc_initWeak(buf, self);
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __80__PKPushableCredentialsNavigationController_setConfiguration_completionHandler___block_invoke;
      v26[3] = &unk_1E59D1D88;
      objc_copyWeak(&v27, buf);
      +[PKProvisioningFlowBridge startInAppFlowWithNavController:self context:v25 addPassConfiguration:v12 completion:v26];
      v7[2](v7);
      objc_destroyWeak(&v27);
      objc_destroyWeak(buf);

      goto LABEL_20;
    }
    v21 = PKLogFacilityTypeGetObject();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    LOWORD(buf[0]) = 0;
    v22 = "Unsupported as configuration is not pushable";
    goto LABEL_14;
  }
  v21 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    v22 = "Unsupported configuration type";
LABEL_14:
    _os_log_impl(&dword_19F450000, v21, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)buf, 2u);
  }
LABEL_15:

  v18 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v19 = *MEMORY[0x1E4F85C08];
  uint64_t v20 = 3;
LABEL_16:
  id v12 = [v18 errorWithDomain:v19 code:v20 userInfo:0];
  [(PKPushableCredentialsNavigationController *)self didFinishWithPasses:0 error:v12];
  if (v7) {
    v7[2](v7);
  }
LABEL_20:
}

void __80__PKPushableCredentialsNavigationController_setConfiguration_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_super v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained didFinishWithPasses:v6 error:v5];
}

- (void)didFinishWithPasses:(id)a3 error:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v39 = v6;
    __int16 v40 = 2112;
    id v41 = v7;
    _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Provisioning did finish with passes %@ and error %@", buf, 0x16u);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * i), "sanitizePaymentApplications", (void)v33);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v11);
  }

  if (v7)
  {
    CGSize v14 = [v7 domain];
    v15 = (void *)*MEMORY[0x1E4F85C08];
    id v16 = v14;
    id v17 = v15;
    id v18 = v17;
    if (v16 == v17)
    {
    }
    else
    {
      if (!v16 || !v17)
      {

LABEL_20:
        id v20 = 0;
LABEL_21:
        v21 = objc_msgSend(v7, "underlyingErrors", (void)v33);
        v22 = [v21 firstObject];

        if (v20) {
          goto LABEL_46;
        }
        id v23 = [v22 domain];
        if (v23 == v18)
        {
        }
        else
        {
          v24 = v23;
          if (!v18 || !v23)
          {

            goto LABEL_31;
          }
          int v25 = [v23 isEqualToString:v18];

          if (!v25)
          {
LABEL_31:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_45;
            }
            id v26 = v7;
            id v27 = [v26 underlyingError];
            id v28 = [v27 domain];
            if (v28 == v18)
            {
            }
            else
            {
              v29 = v28;
              if (!v18 || !v28)
              {

LABEL_40:
                if ([v26 severity] == 1)
                {
                  uint64_t v31 = [MEMORY[0x1E4F28C58] errorWithDomain:v18 code:0 userInfo:0];
LABEL_42:
                  id v20 = (id)v31;

                  if (!v20) {
                    goto LABEL_45;
                  }
LABEL_46:

                  goto LABEL_47;
                }

LABEL_45:
                id v20 = [MEMORY[0x1E4F28C58] errorWithDomain:v18 code:0 userInfo:0];
                goto LABEL_46;
              }
              char v30 = [v28 isEqualToString:v18];

              if ((v30 & 1) == 0) {
                goto LABEL_40;
              }
            }
            uint64_t v31 = [v26 underlyingError];
            goto LABEL_42;
          }
        }
        id v20 = v22;
        if (v20) {
          goto LABEL_46;
        }
        goto LABEL_31;
      }
      int v19 = [v16 isEqualToString:v17];

      if (!v19) {
        goto LABEL_20;
      }
    }
    id v20 = v7;
    goto LABEL_21;
  }
  id v20 = 0;
LABEL_47:
  v32 = [(PKPushableCredentialsNavigationController *)self _remoteViewControllerProxy];
  [v32 didFinishWithPasses:v9 error:v20];
}

@end