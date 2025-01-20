@interface PKServicePaymentSetupViewController
- (unint64_t)supportedInterfaceOrientations;
- (void)_handleError:(id)a3 completion:(id)a4;
- (void)configureWithPaymentSetupRequest:(id)a3 completion:(id)a4;
- (void)paymentSetupDidFinish:(id)a3;
- (void)paymentSetupDidFinish:(id)a3 withError:(id)a4;
- (void)paymentSetupDidShowError:(id)a3;
- (void)setDisplayPropertiesWithScreenSize:(CGSize)a3 scale:(double)a4;
@end

@implementation PKServicePaymentSetupViewController

- (unint64_t)supportedInterfaceOrientations
{
  if ([(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
  {
    return 30;
  }
  else
  {
    return 2;
  }
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

- (void)configureWithPaymentSetupRequest:(id)a3 completion:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(PKServicePaymentSetupViewController *)self _hostAuditToken];
  v8 = SecTaskCreateWithAuditToken(0, &token);
  if (v8)
  {
    int v9 = v8;
    v10 = (void *)SecTaskCopyValueForEntitlement(v8, (CFStringRef)*MEMORY[0x1E4F85148], 0);
    if ([v10 BOOLValue])
    {
      CFRelease(v9);

LABEL_5:
      id v13 = objc_alloc(MEMORY[0x1E4F84BB8]);
      CGSize v14 = [MEMORY[0x1E4F84D50] sharedService];
      v15 = (PKPaymentProvisioningController *)[v13 initWithWebService:v14 paymentSetupRequest:v6];
      provisioningController = self->_provisioningController;
      self->_provisioningController = v15;

      v17 = [v6 paymentSetupFeatures];
      uint64_t v18 = [v17 count];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __83__PKServicePaymentSetupViewController_configureWithPaymentSetupRequest_completion___block_invoke;
      aBlock[3] = &unk_1E59CAA20;
      aBlock[4] = self;
      uint64_t v34 = v18;
      id v19 = v17;
      id v31 = v19;
      id v32 = v6;
      id v33 = v7;
      v20 = _Block_copy(aBlock);
      v21 = self->_provisioningController;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __83__PKServicePaymentSetupViewController_configureWithPaymentSetupRequest_completion___block_invoke_3;
      v26[3] = &unk_1E59CAA70;
      v26[4] = self;
      id v27 = v19;
      id v28 = v20;
      uint64_t v29 = v18;
      id v22 = v20;
      id v23 = v19;
      [(PKPaymentProvisioningController *)v21 preflightWithCompletion:v26];

      goto LABEL_11;
    }
    __int16 v11 = (void *)SecTaskCopyValueForEntitlement(v9, (CFStringRef)*MEMORY[0x1E4F85140], 0);
    char v12 = [v11 BOOLValue];

    CFRelease(v9);
    if (v12) {
      goto LABEL_5;
    }
  }
  v24 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    v25 = [(PKServicePaymentSetupViewController *)self _hostApplicationBundleIdentifier];
    *(_DWORD *)buf = 138543362;
    v37 = v25;
    _os_log_error_impl(&dword_19F450000, v24, OS_LOG_TYPE_ERROR, "%{public}@ missing entitlement", buf, 0xCu);
  }
  if (v7) {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
  id v23 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F85C08] code:0 userInfo:0];
  [(PKServicePaymentSetupViewController *)self paymentSetupDidFinish:0 withError:v23];
LABEL_11:
}

void __83__PKServicePaymentSetupViewController_configureWithPaymentSetupRequest_completion___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    v4 = [[PKPaymentSetupNavigationController alloc] initWithProvisioningController:*(void *)(*(void *)(a1 + 32) + 976) context:7];
    [(PKPaymentSetupNavigationController *)v4 setSetupDelegate:*(void *)(a1 + 32)];
    if (objc_msgSend(*(id *)(a1 + 32), "pkui_userInterfaceIdiomSupportsLargeLayouts")) {
      [(PKNavigationController *)v4 setCustomFormSheetPresentationStyleForiPad];
    }
    else {
      [(PKPaymentSetupNavigationController *)v4 setModalPresentationStyle:3];
    }
    [(PKPaymentSetupNavigationController *)v4 setModalTransitionStyle:2];
    if (*(void *)(a1 + 64) == 1
      && ([*(id *)(a1 + 40) firstObject],
          id v7 = objc_claimAutoreleasedReturnValue(),
          uint64_t v8 = [v7 type],
          v7,
          v8 == 3))
    {
      uint64_t v9 = 3;
    }
    else
    {
      uint64_t v9 = 4;
    }
    [(PKPaymentSetupNavigationController *)v4 setPaymentSetupMode:v9];
    if (*(void *)(a1 + 64))
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      v10 = [*(id *)(a1 + 48) paymentSetupFeatures];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v18;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v18 != v12) {
              objc_enumerationMutation(v10);
            }
            if (![*(id *)(*((void *)&v17 + 1) + 8 * i) type])
            {
              uint64_t v11 = 1;
              goto LABEL_23;
            }
          }
          uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
LABEL_23:

      [(PKPaymentSetupNavigationController *)v4 setShowsWelcomeViewController:v11];
    }
    CGSize v14 = *(void **)(a1 + 32);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __83__PKServicePaymentSetupViewController_configureWithPaymentSetupRequest_completion___block_invoke_2;
    v15[3] = &unk_1E59CA9F8;
    id v16 = *(id *)(a1 + 56);
    objc_msgSend(v14, "pk_presentViewController:animated:popToViewControllerAfterPresentation:completion:", v4, 1, 0, v15);
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 56);
    [v5 _handleError:a3 completion:v6];
  }
}

uint64_t __83__PKServicePaymentSetupViewController_configureWithPaymentSetupRequest_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __83__PKServicePaymentSetupViewController_configureWithPaymentSetupRequest_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = [*(id *)(*(void *)(a1 + 32) + 976) paymentSetupProductModel];
  uint64_t v6 = [v5 allSetupProducts];

  if (*(void *)(a1 + 56) != 1) {
    goto LABEL_6;
  }
  id v7 = [*(id *)(a1 + 40) firstObject];
  uint64_t v8 = [v7 identifiers];
  if (!v8)
  {

    goto LABEL_6;
  }
  uint64_t v9 = (void *)v8;
  uint64_t v10 = [v6 count];

  if (v10 != 1)
  {
LABEL_6:
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_7;
  }
  uint64_t v11 = *(void **)(*(void *)(a1 + 32) + 976);
  uint64_t v12 = [v6 firstObject];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __83__PKServicePaymentSetupViewController_configureWithPaymentSetupRequest_completion___block_invoke_4;
  v13[3] = &unk_1E59CAA48;
  id v14 = *(id *)(a1 + 48);
  [v11 setupProductForProvisioning:v12 includePurchases:1 withCompletionHandler:v13];

LABEL_7:
}

uint64_t __83__PKServicePaymentSetupViewController_configureWithPaymentSetupRequest_completion___block_invoke_4(uint64_t result, int a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)paymentSetupDidFinish:(id)a3
{
}

- (void)paymentSetupDidShowError:(id)a3
{
}

- (void)paymentSetupDidFinish:(id)a3 withError:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 domain];
    uint64_t v10 = *MEMORY[0x1E4F85C08];
    char v11 = [v9 isEqualToString:*MEMORY[0x1E4F85C08]];

    uint64_t v12 = v8;
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:v10 code:0 userInfo:0];
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v13 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v28 = v12;
    __int16 v29 = 2112;
    v30 = v8;
    _os_log_impl(&dword_19F450000, v13, OS_LOG_TYPE_DEFAULT, "PKServicePaymentSetupViewController did show error: %@ (original error: %@)", buf, 0x16u);
  }

  id v14 = [(PKServicePaymentSetupViewController *)self _remoteViewControllerProxy];
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v16 = [(PKPaymentProvisioningController *)self->_provisioningController provisionedPasses];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = [*(id *)(*((void *)&v22 + 1) + 8 * i) secureElementPass];
        if (v21) {
          [v15 addObject:v21];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v18);
  }

  [v14 didFinishWithPasses:v15 error:v8];
}

- (void)_handleError:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    PKDisplayableErrorForCommonType();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__PKServicePaymentSetupViewController__handleError_completion___block_invoke;
  aBlock[3] = &unk_1E59CA7D0;
  aBlock[4] = self;
  uint64_t v8 = _Block_copy(aBlock);
  uint64_t v9 = PKAlertForDisplayableErrorWithHandlers(v6, 0, v8, v8);
  if (v9)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __63__PKServicePaymentSetupViewController__handleError_completion___block_invoke_2;
    v10[3] = &unk_1E59CAA98;
    id v11 = v7;
    [(PKServicePaymentSetupViewController *)self presentViewController:v9 animated:1 completion:v10];
  }
  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __63__PKServicePaymentSetupViewController__handleError_completion___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F85C08] code:0 userInfo:0];
  [v1 paymentSetupDidFinish:0 withError:v2];
}

uint64_t __63__PKServicePaymentSetupViewController__handleError_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void).cxx_destruct
{
}

@end