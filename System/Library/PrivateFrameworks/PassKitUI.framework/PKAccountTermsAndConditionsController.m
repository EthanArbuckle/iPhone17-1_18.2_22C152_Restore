@interface PKAccountTermsAndConditionsController
- (PKAccountTermsAndConditionsController)initWithAccount:(id)a3 webService:(id)a4 context:(int64_t)a5 termsIdentifier:(id)a6;
- (id)_loadViewController;
- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4;
- (id)provideDataForItem:(id)a3;
- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3;
- (void)_fetchTermsDataWithCompletion:(id)a3;
- (void)previewControllerWillDismiss:(id)a3;
- (void)termsViewControllerWithCompletion:(id)a3;
@end

@implementation PKAccountTermsAndConditionsController

- (PKAccountTermsAndConditionsController)initWithAccount:(id)a3 webService:(id)a4 context:(int64_t)a5 termsIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)PKAccountTermsAndConditionsController;
  v13 = [(PKAccountTermsAndConditionsController *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_account, a3);
    objc_storeStrong((id *)&v14->_webService, a4);
    objc_storeStrong((id *)&v14->_termsIdentifier, a6);
  }

  return v14;
}

- (void)termsViewControllerWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = _Block_copy(v4);
    id completionBlock = self->_completionBlock;
    self->_id completionBlock = v6;

    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __75__PKAccountTermsAndConditionsController_termsViewControllerWithCompletion___block_invoke;
    v8[3] = &unk_1E59CB240;
    objc_copyWeak(&v9, &location);
    [(PKAccountTermsAndConditionsController *)self _fetchTermsDataWithCompletion:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __75__PKAccountTermsAndConditionsController_termsViewControllerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = [WeakRetained _loadViewController];
    (*(void (**)(void))(v4[5] + 16))();
    v6 = (void *)v4[5];
    v4[5] = 0;
  }
}

- (void)_fetchTermsDataWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(PKAccount *)self->_account accountIdentifier];
    *(_DWORD *)buf = 138412290;
    v17 = v6;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Fetching terms for account %@", buf, 0xCu);
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F84370]);
  v8 = [(PKAccount *)self->_account accountBaseURL];
  [v7 setBaseURL:v8];

  [v7 setTermsIdentifier:self->_termsIdentifier];
  id v9 = [(PKAccount *)self->_account accountIdentifier];
  [v7 setAccountIdentifier:v9];

  objc_initWeak((id *)buf, self);
  id v10 = (void *)[(PKAccount *)self->_account feature];
  webService = self->_webService;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71__PKAccountTermsAndConditionsController__fetchTermsDataWithCompletion___block_invoke;
  v13[3] = &unk_1E59D59B8;
  objc_copyWeak(v15, (id *)buf);
  v15[1] = v10;
  id v12 = v4;
  id v14 = v12;
  [(PKPaymentWebService *)webService accountTermsDataWithRequest:v7 completion:v13];

  objc_destroyWeak(v15);
  objc_destroyWeak((id *)buf);
}

void __71__PKAccountTermsAndConditionsController__fetchTermsDataWithCompletion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__PKAccountTermsAndConditionsController__fetchTermsDataWithCompletion___block_invoke_2;
  block[3] = &unk_1E59CBDC0;
  objc_copyWeak(v13, a1 + 5);
  id v10 = v5;
  id v11 = v6;
  v13[1] = a1[6];
  id v12 = a1[4];
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v13);
}

void __71__PKAccountTermsAndConditionsController__fetchTermsDataWithCompletion___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    uint64_t v3 = [*(id *)(a1 + 32) termsData];
    id v4 = (void *)v9[6];
    v9[6] = v3;

    uint64_t v5 = [*(id *)(a1 + 32) termsDataFileName];
    id v6 = (void *)v9[7];
    v9[7] = v5;

    uint64_t v7 = *(void *)(a1 + 40);
    if (v7)
    {
      id v8 = +[PKAccountFlowController displayableErrorForError:v7 featureIdentifier:*(void *)(a1 + 64) genericErrorTitle:0 genericErrorMessage:0];
    }
    else
    {
      id v8 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

    WeakRetained = v9;
  }
}

- (id)_loadViewController
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->_termsData)
  {
    uint64_t v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      termsFileName = self->_termsFileName;
      *(_DWORD *)buf = 138412290;
      v20 = termsFileName;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Loading terms for file name %@", buf, 0xCu);
    }

    int v5 = [(NSData *)self->_termsData hasPDFMIMEType];
    id v6 = (id *)MEMORY[0x1E4F44450];
    if (!v5) {
      id v6 = (id *)MEMORY[0x1E4F443F0];
    }
    uint64_t v7 = [*v6 identifier];
    id v8 = (QLItem *)[objc_alloc(_MergedGlobals_663()) initWithDataProvider:self contentType:v7 previewTitle:self->_termsFileName];
    pdfItem = self->_pdfItem;
    self->_pdfItem = v8;

    id v10 = objc_alloc((Class)off_1EB545968());
    uint64_t v18 = self->_pdfItem;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
    id v12 = (QLPreviewController *)[v10 initWithPreviewItems:v11];
    previewController = self->_previewController;
    self->_previewController = v12;

    [(QLPreviewController *)self->_previewController setDelegate:self];
    [(QLPreviewController *)self->_previewController setDataSource:self];
    id v14 = self->_previewController;
    if ([(QLPreviewController *)v14 pkui_userInterfaceIdiomSupportsLargeLayouts])uint64_t v15 = 2; {
    else
    }
      uint64_t v15 = 3;
    [(QLPreviewController *)v14 setModalPresentationStyle:v15];
    objc_super v16 = self->_previewController;
  }
  else
  {
    objc_super v16 = 0;
  }

  return v16;
}

- (id)provideDataForItem:(id)a3
{
  return self->_termsData;
}

- (void)previewControllerWillDismiss:(id)a3
{
  [(QLPreviewController *)self->_previewController dismissViewControllerAnimated:1 completion:0];
  previewController = self->_previewController;
  self->_previewController = 0;
}

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  return self->_pdfItem != 0;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  return self->_pdfItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewController, 0);
  objc_storeStrong((id *)&self->_pdfItem, 0);
  objc_storeStrong((id *)&self->_termsFileName, 0);
  objc_storeStrong((id *)&self->_termsData, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_termsIdentifier, 0);
  objc_storeStrong((id *)&self->_account, 0);

  objc_storeStrong((id *)&self->_webService, 0);
}

@end