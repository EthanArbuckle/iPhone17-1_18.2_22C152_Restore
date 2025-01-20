@interface PKFeatureTermsAndConditionsViewController
- (BOOL)useModalPresentation;
- (PKFeatureTermsAndConditionsViewController)initWithSetupDelegate:(id)a3 context:(int64_t)a4;
- (PKPaymentSetupViewControllerDelegate)setupDelegate;
- (UINavigationController)containerNavigationController;
- (id)_loadPDFViewControllerWithFileName:(id)a3;
- (id)displayTitle;
- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4;
- (id)provideDataForItem:(id)a3;
- (int64_t)context;
- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3;
- (void)_handleWalletTermsLink:(id)a3 withCompletion:(id)a4;
- (void)_loadHTML;
- (void)_loadHTMLViewController;
- (void)_loadPDF;
- (void)_pk_dismissViewControllerWithTransition:(int)a3 completion:(id)a4;
- (void)_renderTermsView;
- (void)_showTermsSpinner:(BOOL)a3 objectModel:(id)a4;
- (void)_updateTermsData:(id)a3 termsFileName:(id)a4;
- (void)dismissViewControllerWithCompletion:(id)a3;
- (void)loader:(id)a3 didFinishLoadWithError:(id)a4;
- (void)popViewControllerWithCompletion:(id)a3;
- (void)preflightWithCompletion:(id)a3;
- (void)presentWithNavigationController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)previewControllerWillDismiss:(id)a3;
- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5;
- (void)setContext:(int64_t)a3;
- (void)setSetupDelegate:(id)a3;
- (void)setUseModalPresentation:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PKFeatureTermsAndConditionsViewController

- (PKFeatureTermsAndConditionsViewController)initWithSetupDelegate:(id)a3 context:(int64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKFeatureTermsAndConditionsViewController;
  v7 = [(PKFeatureTermsAndConditionsViewController *)&v10 init];
  v8 = v7;
  if (v7)
  {
    v7->_context = a4;
    objc_storeWeak((id *)&v7->_setupDelegate, v6);
    [(PKFeatureTermsAndConditionsViewController *)v8 setModalInPresentation:1];
    if ([(UIViewController *)v8 pkui_userInterfaceIdiomSupportsLargeLayouts])
    {
      [(PKFeatureTermsAndConditionsViewController *)v8 setModalPresentationStyle:3];
    }
  }

  return v8;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)PKFeatureTermsAndConditionsViewController;
  [(PKFeatureTermsAndConditionsViewController *)&v5 viewDidLoad];
  v3 = [(PKFeatureTermsAndConditionsViewController *)self view];
  v4 = PKProvisioningBackgroundColor();
  [v3 setBackgroundColor:v4];

  PKPaymentSetupApplyContextAppearance(self->_context, self);
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKFeatureTermsAndConditionsViewController;
  [(PKFeatureTermsAndConditionsViewController *)&v7 viewWillAppear:a3];
  if (!self->_performedInitialLoad)
  {
    self->_performedInitialLoad = 1;
    if (self->_pdfData || self->_htmlData)
    {
      [(PKFeatureTermsAndConditionsViewController *)self _renderTermsView];
    }
    else
    {
      objc_initWeak(&location, self);
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __60__PKFeatureTermsAndConditionsViewController_viewWillAppear___block_invoke;
      v4[3] = &unk_1E59CB100;
      objc_copyWeak(&v5, &location);
      [(PKFeatureTermsAndConditionsViewController *)self preflightWithCompletion:v4];
      objc_destroyWeak(&v5);
      objc_destroyWeak(&location);
    }
  }
}

void __60__PKFeatureTermsAndConditionsViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _renderTermsView];
    id WeakRetained = v2;
  }
}

- (void)preflightWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__PKFeatureTermsAndConditionsViewController_preflightWithCompletion___block_invoke;
  v6[3] = &unk_1E59DC3F8;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(PKFeatureTermsAndConditionsViewController *)self initalTermsDataWithCompletion:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __69__PKFeatureTermsAndConditionsViewController_preflightWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v13 = a2;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    if (!v13 || a4)
    {
      uint64_t v12 = *(void *)(a1 + 32);
      if (!v12) {
        goto LABEL_9;
      }
      v11 = *(void (**)(void))(v12 + 16);
    }
    else
    {
      [WeakRetained _updateTermsData:v13 termsFileName:v7];
      uint64_t v10 = *(void *)(a1 + 32);
      if (!v10) {
        goto LABEL_9;
      }
      v11 = *(void (**)(void))(v10 + 16);
    }
    v11();
  }
LABEL_9:
}

- (void)_updateTermsData:(id)a3 termsFileName:(id)a4
{
  id v6 = a3;
  id v7 = (NSString *)a4;
  int v8 = [v6 hasPDFMIMEType];
  uint64_t v9 = 4;
  if (v8) {
    uint64_t v9 = 3;
  }
  uint64_t v10 = OBJC_IVAR___PKFeatureTermsAndConditionsViewController__context[v9];
  v11 = *(Class *)((char *)&self->super.super.super.super.super.isa + v10);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v10) = (Class)v6;
  id v13 = v6;

  termsFileName = self->_termsFileName;
  self->_termsFileName = v7;
}

- (void)presentWithNavigationController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  uint64_t v6 = a4;
  int v8 = (UINavigationController *)a3;
  if (v6)
  {
    if (self->_useModalPresentation) {
      uint64_t v6 = 8;
    }
    else {
      uint64_t v6 = 1;
    }
  }
  containerNavigationController = self->_containerNavigationController;
  self->_containerNavigationController = v8;
  uint64_t v10 = v8;
  id v11 = a5;

  [(UINavigationController *)v10 presentViewController:self withTransition:v6 completion:v11];
}

- (void)dismissViewControllerWithCompletion:(id)a3
{
  if (self->_useModalPresentation) {
    uint64_t v4 = 9;
  }
  else {
    uint64_t v4 = 1;
  }
  [(PKFeatureTermsAndConditionsViewController *)self _pk_dismissViewControllerWithTransition:v4 completion:a3];
}

- (void)popViewControllerWithCompletion:(id)a3
{
  if (self->_useModalPresentation) {
    uint64_t v4 = 9;
  }
  else {
    uint64_t v4 = 2;
  }
  [(PKFeatureTermsAndConditionsViewController *)self _pk_dismissViewControllerWithTransition:v4 completion:a3];
}

- (void)_pk_dismissViewControllerWithTransition:(int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  termsUIController = self->_termsUIController;
  id v7 = a4;
  [(RemoteUIController *)termsUIController setDelegate:0];
  [(PKFeatureTermsAndConditionsViewController *)self dismissViewControllerWithTransition:v4 completion:v7];
}

- (id)displayTitle
{
  return 0;
}

- (void)_renderTermsView
{
  if (self->_htmlData)
  {
    [(PKFeatureTermsAndConditionsViewController *)self _loadHTMLViewController];
  }
  else if (self->_pdfData)
  {
    [(PKFeatureTermsAndConditionsViewController *)self _loadPDF];
  }
  else
  {
    [(PKFeatureTermsAndConditionsViewController *)self presentErrorAlert];
  }
}

- (void)_loadHTML
{
  if (!self->_termsUIController)
  {
    if (self->_htmlData)
    {
      [(PKFeatureTermsAndConditionsViewController *)self _loadHTMLViewController];
    }
    else
    {
      objc_initWeak(&location, self);
      v3[0] = MEMORY[0x1E4F143A8];
      v3[1] = 3221225472;
      v3[2] = __54__PKFeatureTermsAndConditionsViewController__loadHTML__block_invoke;
      v3[3] = &unk_1E59DC420;
      objc_copyWeak(&v4, &location);
      [(PKFeatureTermsAndConditionsViewController *)self htmlTermsDataWithCompletion:v3];
      objc_destroyWeak(&v4);
      objc_destroyWeak(&location);
    }
  }
}

void __54__PKFeatureTermsAndConditionsViewController__loadHTML__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v11 = WeakRetained;
  if (WeakRetained)
  {
    if (!v7 || v9)
    {
      uint64_t v12 = [WeakRetained presentingViewController];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __54__PKFeatureTermsAndConditionsViewController__loadHTML__block_invoke_2;
      v14[3] = &unk_1E59CA870;
      id v15 = v9;
      id v16 = v12;
      id v13 = v12;
      [v11 popViewControllerWithCompletion:v14];
    }
    else
    {
      [WeakRetained _updateTermsData:v7 termsFileName:v8];
      [v11 _renderTermsView];
    }
  }
}

void __54__PKFeatureTermsAndConditionsViewController__loadHTML__block_invoke_2(uint64_t a1)
{
  id v2 = PKAlertForDisplayableErrorWithHandlers(*(void **)(a1 + 32), 0, 0, 0);
  [*(id *)(a1 + 40) presentViewController:v2 animated:1 completion:0];
}

- (void)_loadHTMLViewController
{
  [(PKFeatureTermsAndConditionsViewController *)self termsShown];
  v3 = (RemoteUIController *)objc_alloc_init(MEMORY[0x1E4F95F70]);
  termsUIController = self->_termsUIController;
  self->_termsUIController = v3;

  [(RemoteUIController *)self->_termsUIController setDelegate:self];
  [(RemoteUIController *)self->_termsUIController setNavigationController:self];
  [(RemoteUIController *)self->_termsUIController loadData:self->_htmlData baseURL:0];
  objc_initWeak(&location, self);
  id v5 = self->_termsUIController;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __68__PKFeatureTermsAndConditionsViewController__loadHTMLViewController__block_invoke;
  v15[3] = &unk_1E59D9568;
  objc_copyWeak(&v16, &location);
  [(RemoteUIController *)v5 setHandlerForElementName:@"agree" handler:v15];
  uint64_t v6 = self->_termsUIController;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__PKFeatureTermsAndConditionsViewController__loadHTMLViewController__block_invoke_4;
  v13[3] = &unk_1E59D9568;
  objc_copyWeak(&v14, &location);
  [(RemoteUIController *)v6 setHandlerForElementName:@"disagree" handler:v13];
  id v7 = self->_termsUIController;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__PKFeatureTermsAndConditionsViewController__loadHTMLViewController__block_invoke_7;
  v11[3] = &unk_1E59D9568;
  objc_copyWeak(&v12, &location);
  [(RemoteUIController *)v7 setHandlerForElementName:@"done" handler:v11];
  id v8 = self->_termsUIController;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__PKFeatureTermsAndConditionsViewController__loadHTMLViewController__block_invoke_9;
  v9[3] = &unk_1E59D9568;
  objc_copyWeak(&v10, &location);
  [(RemoteUIController *)v8 setHandlerForElementName:@"wallet_terms_link" handler:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __68__PKFeatureTermsAndConditionsViewController__loadHTMLViewController__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__PKFeatureTermsAndConditionsViewController__loadHTMLViewController__block_invoke_2;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __68__PKFeatureTermsAndConditionsViewController__loadHTMLViewController__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _showTermsSpinner:1 objectModel:*(void *)(a1 + 32)];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __68__PKFeatureTermsAndConditionsViewController__loadHTMLViewController__block_invoke_3;
    v4[3] = &unk_1E59CA870;
    id v5 = v3;
    id v6 = *(id *)(a1 + 32);
    [v5 termsAccepted:1 completion:v4];
  }
}

uint64_t __68__PKFeatureTermsAndConditionsViewController__loadHTMLViewController__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showTermsSpinner:0 objectModel:*(void *)(a1 + 40)];
}

void __68__PKFeatureTermsAndConditionsViewController__loadHTMLViewController__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__PKFeatureTermsAndConditionsViewController__loadHTMLViewController__block_invoke_5;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __68__PKFeatureTermsAndConditionsViewController__loadHTMLViewController__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _showTermsSpinner:1 objectModel:*(void *)(a1 + 32)];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __68__PKFeatureTermsAndConditionsViewController__loadHTMLViewController__block_invoke_6;
    v4[3] = &unk_1E59CA870;
    id v5 = v3;
    id v6 = *(id *)(a1 + 32);
    [v5 termsAccepted:0 completion:v4];
  }
}

uint64_t __68__PKFeatureTermsAndConditionsViewController__loadHTMLViewController__block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showTermsSpinner:0 objectModel:*(void *)(a1 + 40)];
}

void __68__PKFeatureTermsAndConditionsViewController__loadHTMLViewController__block_invoke_7(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__PKFeatureTermsAndConditionsViewController__loadHTMLViewController__block_invoke_8;
  block[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __68__PKFeatureTermsAndConditionsViewController__loadHTMLViewController__block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained dismissViewControllerWithCompletion:0];
    id WeakRetained = v2;
  }
}

void __68__PKFeatureTermsAndConditionsViewController__loadHTMLViewController__block_invoke_9(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__PKFeatureTermsAndConditionsViewController__loadHTMLViewController__block_invoke_10;
  block[3] = &unk_1E59CB378;
  objc_copyWeak(&v13, (id *)(a1 + 32));
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v13);
}

void __68__PKFeatureTermsAndConditionsViewController__loadHTMLViewController__block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _showTermsSpinner:1 objectModel:*(void *)(a1 + 32)];
    uint64_t v4 = *(void *)(a1 + 40);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __68__PKFeatureTermsAndConditionsViewController__loadHTMLViewController__block_invoke_11;
    v5[3] = &unk_1E59CA870;
    id v6 = v3;
    id v7 = *(id *)(a1 + 32);
    [v6 _handleWalletTermsLink:v4 withCompletion:v5];
  }
}

uint64_t __68__PKFeatureTermsAndConditionsViewController__loadHTMLViewController__block_invoke_11(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showTermsSpinner:0 objectModel:*(void *)(a1 + 40)];
}

- (void)_handleWalletTermsLink:(id)a3 withCompletion:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v6;
    _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Wallet terms link detected with attributes: %@", buf, 0xCu);
  }

  id v9 = [v6 PKStringForKey:@"termsIdentifier"];
  id v10 = [v6 PKStringForKey:@"termsDataFormat"];
  uint64_t v11 = [v6 PKStringForKey:@"termsFileName"];
  id v12 = (void *)v11;
  if (v9 && v10 && v11 && ([v10 isEqualToString:*MEMORY[0x1E4F87EF0]] & 1) != 0)
  {
    [(PKFeatureTermsAndConditionsViewController *)self reportAnalyticsForTermsLink:v6];
    objc_initWeak((id *)buf, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __83__PKFeatureTermsAndConditionsViewController__handleWalletTermsLink_withCompletion___block_invoke;
    v13[3] = &unk_1E59DC448;
    objc_copyWeak(&v17, (id *)buf);
    id v14 = v12;
    id v15 = self;
    id v16 = v7;
    [(PKFeatureTermsAndConditionsViewController *)self pdfTermsDataWithIdentifier:v9 completion:v13];

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    [(PKFeatureTermsAndConditionsViewController *)self presentErrorAlert];
    v7[2](v7);
  }
}

void __83__PKFeatureTermsAndConditionsViewController__handleWalletTermsLink_withCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __83__PKFeatureTermsAndConditionsViewController__handleWalletTermsLink_withCompletion___block_invoke_2;
  v13[3] = &unk_1E59D0DC8;
  objc_copyWeak(&v19, (id *)(a1 + 56));
  id v14 = v6;
  id v15 = v7;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = *(void **)(a1 + 48);
  id v16 = v8;
  uint64_t v17 = v9;
  id v18 = v10;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v13);

  objc_destroyWeak(&v19);
}

void __83__PKFeatureTermsAndConditionsViewController__handleWalletTermsLink_withCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v8 = WeakRetained;
    if (v4 && !*(void *)(a1 + 40))
    {
      objc_storeStrong(WeakRetained + 180, v4);
      id v6 = [v8 _loadPDFViewControllerWithFileName:*(void *)(a1 + 48)];
      [*(id *)(a1 + 56) pushViewController:v6 animated:1];
      uint64_t v7 = *(void *)(a1 + 64);
      if (v7) {
        (*(void (**)(void))(v7 + 16))();
      }
    }
    else
    {
      [WeakRetained presentErrorAlert];
      id v3 = v8;
      uint64_t v5 = *(void *)(a1 + 64);
      if (!v5) {
        goto LABEL_10;
      }
      (*(void (**)(void))(v5 + 16))();
    }
    id v3 = v8;
  }
LABEL_10:
}

- (void)_loadPDF
{
  if (!self->_previewController)
  {
    id v3 = [(PKFeatureTermsAndConditionsViewController *)self _loadPDFViewControllerWithFileName:self->_termsFileName];
    [(PKFeatureTermsAndConditionsViewController *)self presentViewController:v3 animated:0 completion:0];
  }
}

- (id)_loadPDFViewControllerWithFileName:(id)a3
{
  uint64_t v4 = (void *)*MEMORY[0x1E4F44450];
  id v5 = a3;
  id v6 = [v4 identifier];
  uint64_t v7 = (QLItem *)[objc_alloc(_MergedGlobals_5_10()) initWithDataProvider:self contentType:v6 previewTitle:v5];

  pdfItem = self->_pdfItem;
  self->_pdfItem = v7;

  uint64_t v9 = (QLPreviewController *)objc_alloc_init((Class)off_1EC34A160());
  previewController = self->_previewController;
  self->_previewController = v9;

  [(QLPreviewController *)self->_previewController setDelegate:self];
  [(QLPreviewController *)self->_previewController setDataSource:self];
  [(QLPreviewController *)self->_previewController setModalPresentationStyle:3];
  id v11 = self->_previewController;

  return v11;
}

- (void)_showTermsSpinner:(BOOL)a3 objectModel:(id)a4
{
  BOOL v4 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = v6;
  if (v4)
  {
    id v8 = [(PKFeatureTermsAndConditionsViewController *)self displayTitle];
    [v7 startNavigationBarSpinnerWithTitle:v8];
  }
  else
  {
    [v6 stopNavigationBarSpinner];
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v9 = objc_msgSend(v7, "allPages", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    BOOL v13 = !v4;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        id v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v16 = [v15 rightToolbarItem];
        [v16 setEnabled:v13];

        uint64_t v17 = [v15 leftToolbarItem];
        [v17 setEnabled:v13];

        id v18 = [v15 middleToolbarItem];
        [v18 setEnabled:v13];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }
}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  if (self->_termsUIController == a3) {
    PKPaymentSetupApplyContextAppearance(self->_context, a4);
  }
}

- (void)loader:(id)a3 didFinishLoadWithError:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      id v10 = v7;
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Error loading terms: %{public}@", (uint8_t *)&v9, 0xCu);
    }

    [(PKFeatureTermsAndConditionsViewController *)self dismissViewControllerWithCompletion:0];
  }
}

- (id)provideDataForItem:(id)a3
{
  return self->_pdfData;
}

- (void)previewControllerWillDismiss:(id)a3
{
  pdfData = self->_pdfData;
  self->_pdfData = 0;

  previewController = self->_previewController;
  self->_previewController = 0;

  id v6 = [(PKFeatureTermsAndConditionsViewController *)self presentingViewController];
  [v6 dismissViewControllerAnimated:0 completion:0];
}

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  return self->_pdfItem != 0;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  return self->_pdfItem;
}

- (PKPaymentSetupViewControllerDelegate)setupDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);

  return (PKPaymentSetupViewControllerDelegate *)WeakRetained;
}

- (void)setSetupDelegate:(id)a3
{
}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
}

- (BOOL)useModalPresentation
{
  return self->_useModalPresentation;
}

- (void)setUseModalPresentation:(BOOL)a3
{
  self->_useModalPresentation = a3;
}

- (UINavigationController)containerNavigationController
{
  return self->_containerNavigationController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerNavigationController, 0);
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_storeStrong((id *)&self->_termsFileName, 0);
  objc_storeStrong((id *)&self->_htmlData, 0);
  objc_storeStrong((id *)&self->_pdfData, 0);
  objc_storeStrong((id *)&self->_previewController, 0);
  objc_storeStrong((id *)&self->_pdfItem, 0);

  objc_storeStrong((id *)&self->_termsUIController, 0);
}

@end