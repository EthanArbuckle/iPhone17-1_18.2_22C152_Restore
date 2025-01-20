@interface PKIssuerProvisioningExtensionAuthorizationViewController
- (PKIssuerProvisioningExtensionAuthorizationViewController)initWithExtension:(id)a3 completionHandler:(id)a4;
- (PKIssuerProvisioningExtensionAuthorizationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PKProvisioningAnalyticsSessionUIReporter)reporter;
- (void)_cancel;
- (void)_failWithApplicationName:(id)a3;
- (void)_invokeCompletionWithAuthorized:(BOOL)a3;
- (void)dealloc;
- (void)setReporter:(id)a3;
@end

@implementation PKIssuerProvisioningExtensionAuthorizationViewController

- (PKIssuerProvisioningExtensionAuthorizationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return 0;
}

- (PKIssuerProvisioningExtensionAuthorizationViewController)initWithExtension:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void (**)(void, void, void))v7;
  if (v6)
  {
    v39.receiver = self;
    v39.super_class = (Class)PKIssuerProvisioningExtensionAuthorizationViewController;
    v9 = [(PKIssuerProvisioningExtensionAuthorizationViewController *)&v39 initWithNibName:0 bundle:0];
    if (v9)
    {
      v10 = _Block_copy(v8);
      id completionHandler = v9->_completionHandler;
      v9->_id completionHandler = v10;

      v12 = [v6 _plugIn];
      v13 = [v12 localizedContainingName];
      v14 = v13;
      if (v13)
      {
        id v15 = v13;
      }
      else
      {
        id v15 = [v6 _localizedName];
      }
      v17 = v15;

      id v18 = v17;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __96__PKIssuerProvisioningExtensionAuthorizationViewController_initWithExtension_completionHandler___block_invoke;
      aBlock[3] = &unk_1E59D5AF8;
      id v19 = v18;
      id v38 = v19;
      v20 = (void (**)(void *, PKIssuerProvisioningExtensionAuthorizationViewController *, void *))_Block_copy(aBlock);
      v21 = objc_alloc_init(PKIssuerProvisioningExtensionAuthorizationPlaceholderViewController);
      v22 = [(PKIssuerProvisioningExtensionAuthorizationPlaceholderViewController *)v21 navigationItem];
      v20[2](v20, v9, v22);

      [(PKIssuerProvisioningExtensionAuthorizationViewController *)v9 pushViewController:v21 animated:0];
      v35[0] = 0;
      v35[1] = v35;
      v35[2] = 0x2020000000;
      char v36 = 0;
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __96__PKIssuerProvisioningExtensionAuthorizationViewController_initWithExtension_completionHandler___block_invoke_2;
      v34[3] = &unk_1E59D5B20;
      v34[4] = v35;
      [(PKIssuerProvisioningExtensionAuthorizationViewController *)v9 _beginDelayingPresentation:v34 cancellationHandler:1.0];
      objc_initWeak(&location, v9);
      v23 = dispatch_get_global_queue(25, 0);
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __96__PKIssuerProvisioningExtensionAuthorizationViewController_initWithExtension_completionHandler___block_invoke_3;
      v27[3] = &unk_1E59D5BC0;
      id v28 = v6;
      id v29 = v19;
      id v24 = v19;
      objc_copyWeak(&v32, &location);
      v30 = v20;
      v31 = v35;
      v25 = v20;
      dispatch_async(v23, v27);

      objc_destroyWeak(&v32);
      objc_destroyWeak(&location);
      _Block_object_dispose(v35, 8);
    }
    else if (v8)
    {
      v8[2](v8, 0, 0);
    }
    self = v9;
    v16 = self;
  }
  else
  {
    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
    v16 = 0;
  }

  return v16;
}

void __96__PKIssuerProvisioningExtensionAuthorizationViewController_initWithExtension_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  [v5 setTitle:v4];
  id v7 = (id)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:v6 action:sel__cancel];

  [v5 setLeftBarButtonItem:v7];
}

uint64_t __96__PKIssuerProvisioningExtensionAuthorizationViewController_initWithExtension_completionHandler___block_invoke_2(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  return 1;
}

void __96__PKIssuerProvisioningExtensionAuthorizationViewController_initWithExtension_completionHandler___block_invoke_3(uint64_t a1)
{
  v43[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1A6224460]();
  v3 = [*(id *)(a1 + 32) _plugIn];
  uint64_t v4 = [v3 containingUrl];

  uint64_t v5 = [v4 path];
  id v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    v8 = 0;
    id v9 = 0;
  }
  else
  {
    id v28 = v2;
    uint64_t v29 = a1;
    v27 = v4;
    id v9 = v4;
    uint64_t v10 = *MEMORY[0x1E4F28260];
    v42[0] = *MEMORY[0x1E4F282B0];
    v42[1] = v10;
    v43[0] = @"com.apple.PassKit.issuer-provisioning.authorization";
    v43[1] = v6;
    v26 = v6;
    v42[2] = @"ENTITLEMENT:com.apple.developer.payment-pass-provisioning";
    v43[2] = MEMORY[0x1E4F1CC38];
    v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:3];
    v11 = objc_msgSend(MEMORY[0x1E4F28C70], "extensionsWithMatchingAttributes:error:");
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      v8 = 0;
      uint64_t v14 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v38 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          v17 = [v16 _plugIn];
          id v18 = [v17 containingUrl];
          int v19 = PKEqualObjects();

          if (v19)
          {
            id v20 = v16;

            v8 = v20;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v13);
    }
    else
    {
      v8 = 0;
    }

    v2 = v28;
    a1 = v29;
    id v6 = v26;
    uint64_t v4 = v27;
  }

  if (!v9) {
    id v9 = *(id *)(a1 + 40);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__PKIssuerProvisioningExtensionAuthorizationViewController_initWithExtension_completionHandler___block_invoke_4;
  block[3] = &unk_1E59D5B98;
  objc_copyWeak(&v36, (id *)(a1 + 64));
  id v21 = *(id *)(a1 + 48);
  uint64_t v22 = *(void *)(a1 + 56);
  id v34 = v21;
  uint64_t v35 = v22;
  id v31 = *(id *)(a1 + 40);
  id v32 = v8;
  id v33 = v9;
  id v23 = v9;
  id v24 = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v36);
}

void __96__PKIssuerProvisioningExtensionAuthorizationViewController_initWithExtension_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 72);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __96__PKIssuerProvisioningExtensionAuthorizationViewController_initWithExtension_completionHandler___block_invoke_5;
    aBlock[3] = &unk_1E59D5B48;
    id v4 = *(id *)(a1 + 56);
    uint64_t v5 = *(void *)(a1 + 64);
    id v16 = v4;
    uint64_t v17 = v5;
    id v15 = *(id *)(a1 + 32);
    id v6 = _Block_copy(aBlock);
    BOOL v7 = *(void **)(a1 + 40);
    if (v7)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __96__PKIssuerProvisioningExtensionAuthorizationViewController_initWithExtension_completionHandler___block_invoke_6;
      v10[3] = &unk_1E59D5B70;
      objc_copyWeak(&v13, v2);
      id v12 = v6;
      id v11 = *(id *)(a1 + 48);
      [v7 instantiateViewControllerWithInputItems:0 connectionHandler:v10];

      objc_destroyWeak(&v13);
    }
    else
    {
      v8 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138412290;
        uint64_t v19 = v9;
        _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "PKIssuerProvisioningExtensionAuthorizationViewController: failed to find matching authorization UI extension for %@.", buf, 0xCu);
      }

      (*((void (**)(void *, id, void))v6 + 2))(v6, WeakRetained, 0);
    }
  }
}

void __96__PKIssuerProvisioningExtensionAuthorizationViewController_initWithExtension_completionHandler___block_invoke_5(void *a1, void *a2, void *a3)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v5 = a1[5];
    id v6 = a3;
    BOOL v7 = a2;
    v8 = [v6 navigationItem];
    (*(void (**)(uint64_t, id *, void *))(v5 + 16))(v5, v7, v8);

    [v7[178] reportViewAppeared];
    v12[0] = v6;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    uint64_t v10 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);

    [v7 setViewControllers:v9 animated:v10];
    [v7 _endDelayingPresentation];
  }
  else
  {
    id v11 = a2;
    [v11 _endDelayingPresentation];
    [v11 _failWithApplicationName:a1[4]];
  }
}

void __96__PKIssuerProvisioningExtensionAuthorizationViewController_initWithExtension_completionHandler___block_invoke_6(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v8 && !v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __96__PKIssuerProvisioningExtensionAuthorizationViewController_initWithExtension_completionHandler___block_invoke_7;
      v13[3] = &unk_1E59CB100;
      objc_copyWeak(&v14, (id *)(a1 + 48));
      objc_msgSend(v8, "pkui_setCompletionHandler:", v13);
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      objc_destroyWeak(&v14);
    }
    else
    {
      id v11 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v16 = v12;
        _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "PKIssuerProvisioningExtensionAuthorizationViewController: failed to materialize authorization UI extension for %@.", buf, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

void __96__PKIssuerProvisioningExtensionAuthorizationViewController_initWithExtension_completionHandler___block_invoke_7(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invokeCompletionWithAuthorized:a2];
}

- (void)dealloc
{
  id completionHandler = self->_completionHandler;
  if (completionHandler)
  {
    id v4 = _Block_copy(completionHandler);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__PKIssuerProvisioningExtensionAuthorizationViewController_dealloc__block_invoke;
    block[3] = &unk_1E59CAA98;
    id v8 = v4;
    id v5 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  v6.receiver = self;
  v6.super_class = (Class)PKIssuerProvisioningExtensionAuthorizationViewController;
  [(PKIssuerProvisioningExtensionAuthorizationViewController *)&v6 dealloc];
}

uint64_t __67__PKIssuerProvisioningExtensionAuthorizationViewController_dealloc__block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

- (void)_invokeCompletionWithAuthorized:(BOOL)a3
{
  BOOL v3 = a3;
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportPageCompleted:a3 context:0];
  id completionHandler = (void (**)(id, PKIssuerProvisioningExtensionAuthorizationViewController *, BOOL))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, self, v3);
    id v6 = self->_completionHandler;
    self->_id completionHandler = 0;
  }
}

- (void)_cancel
{
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportButtonPressed:2];

  [(PKIssuerProvisioningExtensionAuthorizationViewController *)self _invokeCompletionWithAuthorized:0];
}

- (void)_failWithApplicationName:(id)a3
{
  id v4 = a3;
  id v5 = PKLocalizedPaymentString(&cfstr_ProvisioningEx_0.isa, &stru_1EF1B4C70.isa, v4);
  id v6 = (void *)MEMORY[0x1E4FB1418];
  id v7 = PKLocalizedPaymentString(&cfstr_ProvisioningEx_1.isa);
  id v8 = [v6 alertControllerWithTitle:v7 message:v5 preferredStyle:1];

  objc_initWeak(&location, self);
  id v9 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v10 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __85__PKIssuerProvisioningExtensionAuthorizationViewController__failWithApplicationName___block_invoke;
  v12[3] = &unk_1E59CCFF0;
  objc_copyWeak(&v13, &location);
  id v11 = [v9 actionWithTitle:v10 style:1 handler:v12];
  [v8 addAction:v11];

  [(PKIssuerProvisioningExtensionAuthorizationViewController *)self presentViewController:v8 animated:1 completion:0];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __85__PKIssuerProvisioningExtensionAuthorizationViewController__failWithApplicationName___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invokeCompletionWithAuthorized:0];
}

- (PKProvisioningAnalyticsSessionUIReporter)reporter
{
  return self->_reporter;
}

- (void)setReporter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reporter, 0);

  objc_storeStrong(&self->_completionHandler, 0);
}

@end