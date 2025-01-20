@interface PKPaymentSetupViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
+ (void)paymentSetupFeaturesForConfiguration:(id)a3 completion:(id)a4;
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)result;
- (PKPaymentSetupRequestViewControllerDelegate)delegate;
- (PKPaymentSetupViewController)initWithCoder:(id)a3;
- (PKPaymentSetupViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PKPaymentSetupViewController)initWithPaymentSetupRequest:(id)a3;
- (id)childViewControllerForStatusBarHidden;
- (id)childViewControllerForStatusBarStyle;
- (int64_t)modalTransitionStyle;
- (int64_t)presentationStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_cancelTapped;
- (void)_hideLoadingContent;
- (void)_setRemoteVC:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)didFinishWithPasses:(id)a3 error:(id)a4;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setPresentationStyle:(int64_t)a3;
- (void)updateModalPresentationStyle;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PKPaymentSetupViewController

+ (void)paymentSetupFeaturesForConfiguration:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = dispatch_group_create();
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__0;
  v30[4] = __Block_byref_object_dispose__0;
  id v31 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__0;
  v28[4] = __Block_byref_object_dispose__0;
  id v29 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__0;
  v26[4] = __Block_byref_object_dispose__0;
  id v27 = 0;
  v8 = [MEMORY[0x1E4F84898] sharedInstanceWithRemoteLibrary];
  v9 = [v8 _remoteLibrary];

  if (v9)
  {
    dispatch_group_enter(v7);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __80__PKPaymentSetupViewController_paymentSetupFeaturesForConfiguration_completion___block_invoke;
    v22[3] = &unk_1E59CC580;
    v24 = v30;
    v25 = v28;
    v23 = v7;
    [v9 paymentSetupFeaturesForConfiguration:v5 completion:v22];
  }
  dispatch_group_enter(v7);
  v10 = [MEMORY[0x1E4F84898] sharedInstance];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __80__PKPaymentSetupViewController_paymentSetupFeaturesForConfiguration_completion___block_invoke_2;
  v19[3] = &unk_1E59CC5A8;
  v21 = v26;
  v11 = v7;
  v20 = v11;
  [v10 paymentSetupFeaturesForConfiguration:v5 completion:v19];

  v12 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__PKPaymentSetupViewController_paymentSetupFeaturesForConfiguration_completion___block_invoke_3;
  block[3] = &unk_1E59CC5D0;
  id v15 = v6;
  v16 = v30;
  v17 = v28;
  v18 = v26;
  id v13 = v6;
  dispatch_group_notify(v11, v12, block);

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);

  _Block_object_dispose(v30, 8);
}

void __80__PKPaymentSetupViewController_paymentSetupFeaturesForConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v3;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v16 = objc_msgSend(v15, "identifiers", (void)v17);
        if (v16) {
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v15 forKey:v16];
        }
        else {
          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __80__PKPaymentSetupViewController_paymentSetupFeaturesForConfiguration_completion___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __80__PKPaymentSetupViewController_paymentSetupFeaturesForConfiguration_completion___block_invoke_3(void *a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1[5] + 8) + 40) count]
    || [*(id *)(*(void *)(a1[6] + 8) + 40) count])
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v3 = *(id *)(*(void *)(a1[7] + 8) + 40);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v37 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          v9 = [v8 identifiers];
          if (v9
            && ([*(id *)(*(void *)(a1[5] + 8) + 40) objectForKey:v9],
                id v10 = objc_claimAutoreleasedReturnValue(),
                v10,
                v10))
          {
            [v8 setSupportedDevices:3];
            [*(id *)(*(void *)(a1[5] + 8) + 40) removeObjectForKey:v9];
          }
          else
          {
            if ([*(id *)(*(void *)(a1[6] + 8) + 40) containsObject:v8])
            {
              [*(id *)(*(void *)(a1[6] + 8) + 40) removeObject:v8];
              uint64_t v11 = v8;
              uint64_t v12 = 3;
            }
            else
            {
              uint64_t v11 = v8;
              uint64_t v12 = 1;
            }
            [v11 setSupportedDevices:v12];
          }
          [v2 addObject:v8];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v36 objects:v42 count:16];
      }
      while (v5);
    }

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v13 = [*(id *)(*(void *)(a1[5] + 8) + 40) allValues];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v41 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v33;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v33 != v16) {
            objc_enumerationMutation(v13);
          }
          long long v18 = *(void **)(*((void *)&v32 + 1) + 8 * j);
          [v18 setSupportedDevices:2];
          [v2 addObject:v18];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v32 objects:v41 count:16];
      }
      while (v15);
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v19 = objc_msgSend(*(id *)(*(void *)(a1[6] + 8) + 40), "allObjects", 0);
    uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v40 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v29;
      do
      {
        for (uint64_t k = 0; k != v21; ++k)
        {
          if (*(void *)v29 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v28 + 1) + 8 * k);
          [v24 setSupportedDevices:2];
          [v2 addObject:v24];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v28 objects:v40 count:16];
      }
      while (v21);
    }

    uint64_t v25 = a1[4];
    v26 = (void *)[v2 copy];
    (*(void (**)(uint64_t, void *))(v25 + 16))(v25, v26);
  }
  else
  {
    id v27 = *(void (**)(void))(a1[4] + 16);
    v27();
  }
}

- (PKPaymentSetupViewController)initWithCoder:(id)a3
{
  return 0;
}

- (PKPaymentSetupViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return 0;
}

- (PKPaymentSetupViewController)initWithPaymentSetupRequest:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentSetupViewController;
  uint64_t v6 = [(PKPaymentSetupViewController *)&v14 initWithNibName:0 bundle:0];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_paymentSetupRequest, a3);
    v7->_explicitPresentationStyle = 0;
    objc_initWeak(&location, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__PKPaymentSetupViewController_initWithPaymentSetupRequest___block_invoke;
    v11[3] = &unk_1E59CC5F8;
    objc_copyWeak(&v12, &location);
    uint64_t v8 = +[_UIRemoteViewController requestViewController:@"PKServicePaymentSetupViewController" fromServiceWithBundleIdentifier:@"com.apple.PassbookUIService" connectionHandler:v11];
    remoteVCRequest = v7->_remoteVCRequest;
    v7->_remoteVCRequest = (_UIAsyncInvocation *)v8;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __60__PKPaymentSetupViewController_initWithPaymentSetupRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = (void *)*((void *)WeakRetained + 124);
    *((void *)WeakRetained + 124) = 0;

    if (v5)
    {
      [v8 _setRemoteVC:v5 completionHandler:0];
    }
    else
    {
      if (v6)
      {
        uint64_t v12 = *MEMORY[0x1E4F28A50];
        v13[0] = v6;
        id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
      }
      else
      {
        id v10 = 0;
      }
      uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F85C08] code:0 userInfo:v10];
      [v8 didFinishWithPasses:0 error:v11];
    }
  }
}

- (void)dealloc
{
  remoteVCRequest = self->_remoteVCRequest;
  if (remoteVCRequest)
  {
    id v4 = (id)[(_UIAsyncInvocation *)remoteVCRequest invoke];
    id v5 = self->_remoteVCRequest;
    self->_remoteVCRequest = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupViewController;
  [(PKPaymentSetupViewController *)&v6 dealloc];
}

- (void)_setRemoteVC:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_remoteVC, a3);
  [(PKPaymentSetupViewController *)self addChildViewController:self->_remoteVC];
  v9 = [(PKRemotePaymentSetupViewController *)self->_remoteVC view];
  id v10 = [(PKPaymentSetupViewController *)self view];
  [v10 addSubview:v9];
  [v10 setNeedsLayout];
  [v10 layoutIfNeeded];
  [v9 setUserInteractionEnabled:0];
  [(_UIRemoteViewController *)self->_remoteVC didMoveToParentViewController:self];
  [(PKPaymentSetupViewController *)self setNeedsStatusBarAppearanceUpdate];
  [(PKPaymentSetupViewController *)self setNeedsUpdateOfSupportedInterfaceOrientations];
  remoteVC = self->_remoteVC;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __63__PKPaymentSetupViewController__setRemoteVC_completionHandler___block_invoke;
  v27[3] = &unk_1E59CC620;
  uint64_t v12 = (void (**)(void))v8;
  id v28 = v12;
  uint64_t v13 = [(_UIRemoteViewController *)remoteVC serviceViewControllerProxyWithErrorHandler:v27];
  if (v13)
  {
    objc_super v14 = [MEMORY[0x1E4FB1BA8] mainScreen];
    uint64_t v15 = [v14 fixedCoordinateSpace];
    [v15 bounds];
    double v17 = v16;
    double v19 = v18;
    [v14 scale];
    objc_msgSend(v13, "setDisplayPropertiesWithScreenSize:scale:", v17, v19, v20);

    objc_initWeak(&location, self);
    paymentSetupRequest = self->_paymentSetupRequest;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __63__PKPaymentSetupViewController__setRemoteVC_completionHandler___block_invoke_3;
    v22[3] = &unk_1E59CAE30;
    objc_copyWeak(&v25, &location);
    v24 = v12;
    id v23 = v9;
    [v13 configureWithPaymentSetupRequest:paymentSetupRequest completion:v22];

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  else if (v12)
  {
    v12[2](v12);
  }
}

void __63__PKPaymentSetupViewController__setRemoteVC_completionHandler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__PKPaymentSetupViewController__setRemoteVC_completionHandler___block_invoke_2;
    block[3] = &unk_1E59CAA98;
    id v3 = v1;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __63__PKPaymentSetupViewController__setRemoteVC_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__PKPaymentSetupViewController__setRemoteVC_completionHandler___block_invoke_3(id *a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__PKPaymentSetupViewController__setRemoteVC_completionHandler___block_invoke_4;
  block[3] = &unk_1E59CA960;
  objc_copyWeak(&v5, a1 + 6);
  id v4 = a1[5];
  id v3 = a1[4];
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v5);
}

void __63__PKPaymentSetupViewController__setRemoteVC_completionHandler___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    [*(id *)(a1 + 32) setUserInteractionEnabled:1];
    [WeakRetained _hideLoadingContent];
  }
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
}

- (void)setPresentationStyle:(int64_t)a3
{
  if (self->_presentationStyle != a3 || !self->_explicitPresentationStyle)
  {
    self->_presentationStyle = 2 * (a3 == 2);
    self->_explicitPresentationStyle = 1;
    [(PKPaymentSetupViewController *)self updateModalPresentationStyle];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentSetupViewController;
  -[PKPaymentSetupViewController viewWillTransitionToSize:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  [(PKPaymentSetupViewController *)self updateModalPresentationStyle];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentSetupViewController;
  [(PKPaymentSetupViewController *)&v5 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  [(PKPaymentSetupViewController *)self updateModalPresentationStyle];
}

- (void)updateModalPresentationStyle
{
  id v3 = [(PKPaymentSetupViewController *)self view];
  id v10 = [v3 window];

  id v4 = v10;
  if (v10)
  {
    objc_super v5 = [v10 windowScene];
    objc_super v6 = v5;
    if (v5)
    {
      uint64_t v7 = [v5 interfaceOrientation];
      if ([(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
      {
        id v8 = self;
        int64_t presentationStyle = 16;
      }
      else if ((unint64_t)(v7 - 3) >= 2 && self->_explicitPresentationStyle)
      {
        int64_t presentationStyle = self->_presentationStyle;
        id v8 = self;
      }
      else
      {
        id v8 = self;
        int64_t presentationStyle = 0;
      }
      [(PKPaymentSetupViewController *)v8 setModalPresentationStyle:presentationStyle];
    }

    id v4 = v10;
  }
}

- (int64_t)modalTransitionStyle
{
  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  remoteVC = self->_remoteVC;
  if (remoteVC) {
    return [(_UIRemoteViewController *)remoteVC supportedInterfaceOrientations];
  }
  else {
    return 2;
  }
}

- (id)childViewControllerForStatusBarStyle
{
  return self->_remoteVC;
}

- (id)childViewControllerForStatusBarHidden
{
  return self->_remoteVC;
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)result
{
  if (self->_remoteVC != a3)
  {
    v4.receiver = self;
    v4.super_class = (Class)PKPaymentSetupViewController;
    [(PKPaymentSetupViewController *)&v4 sizeForChildContentContainer:result.width withParentContainerSize:result.height];
  }
  return result;
}

- (void)loadView
{
  v26.receiver = self;
  v26.super_class = (Class)PKPaymentSetupViewController;
  [(PKPaymentSetupViewController *)&v26 loadView];
  id v3 = [(PKPaymentSetupViewController *)self view];
  objc_super v4 = PKProvisioningBackgroundColor();
  [v3 setBackgroundColor:v4];

  objc_super v5 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
  spinner = self->_spinner;
  self->_spinner = v5;

  [(UIActivityIndicatorView *)self->_spinner startAnimating];
  [v3 addSubview:self->_spinner];
  id v7 = objc_alloc(MEMORY[0x1E4FB1930]);
  id v8 = (UILabel *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  loadingLabel = self->_loadingLabel;
  self->_loadingLabel = v8;

  id v10 = self->_loadingLabel;
  uint64_t v11 = PKLocalizedString(&cfstr_Loading_1.isa);
  [(UILabel *)v10 setText:v11];

  [v3 addSubview:self->_loadingLabel];
  uint64_t v12 = (void *)MEMORY[0x1E4FB14D8];
  uint64_t v13 = PKLocalizedString(&cfstr_Cancel.isa);
  objc_super v14 = [MEMORY[0x1E4FB08E0] systemFontOfSize:17.0];
  uint64_t v15 = objc_msgSend(v12, "pkui_plainConfigurationWithTitle:font:", v13, v14);

  objc_initWeak(&location, self);
  double v16 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  uint64_t v22 = __40__PKPaymentSetupViewController_loadView__block_invoke;
  id v23 = &unk_1E59CBEE0;
  objc_copyWeak(&v24, &location);
  double v17 = [v16 actionWithHandler:&v20];
  objc_msgSend(MEMORY[0x1E4FB14D0], "buttonWithConfiguration:primaryAction:", v15, v17, v20, v21, v22, v23);
  double v18 = (UIButton *)objc_claimAutoreleasedReturnValue();
  cancelButton = self->_cancelButton;
  self->_cancelButton = v18;

  [(UIButton *)self->_cancelButton setConfigurationUpdateHandler:&__block_literal_global_20];
  [v3 addSubview:self->_cancelButton];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __40__PKPaymentSetupViewController_loadView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cancelTapped];
}

uint64_t __40__PKPaymentSetupViewController_loadView__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
}

- (void)viewWillLayoutSubviews
{
  v29.receiver = self;
  v29.super_class = (Class)PKPaymentSetupViewController;
  [(PKPaymentSetupViewController *)&v29 viewWillLayoutSubviews];
  id v3 = [(PKPaymentSetupViewController *)self view];
  objc_super v4 = [(PKRemotePaymentSetupViewController *)self->_remoteVC view];
  [v3 bounds];
  objc_msgSend(v4, "setFrame:");

  [v3 bounds];
  double v6 = v5;
  double v28 = v7;
  [(UIActivityIndicatorView *)self->_spinner frame];
  [v3 center];
  UIRectCenteredAboutPoint();
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:");
  [(UILabel *)self->_loadingLabel sizeToFit];
  [(UILabel *)self->_loadingLabel frame];
  UIRectCenteredXInRect();
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  v30.origin.x = v9;
  v30.origin.y = v11;
  v30.size.width = v13;
  v30.size.height = v15;
  -[UILabel setFrame:](self->_loadingLabel, "setFrame:", v17, CGRectGetMaxY(v30) + 10.0, v19, v21);
  [(UIButton *)self->_cancelButton sizeToFit];
  [(UIButton *)self->_cancelButton frame];
  double v23 = v22;
  double v25 = v24;
  uint64_t v26 = [(PKPaymentSetupViewController *)self modalPresentationStyle];
  double v27 = 50.0;
  if (v26) {
    double v27 = 10.0;
  }
  -[UIButton setFrame:](self->_cancelButton, "setFrame:", v6 + 10.0, v28 + v27, v23, v25);
}

- (void)_hideLoadingContent
{
  [(UIButton *)self->_cancelButton removeFromSuperview];
  [(UIActivityIndicatorView *)self->_spinner stopAnimating];
  [(UIActivityIndicatorView *)self->_spinner removeFromSuperview];
  loadingLabel = self->_loadingLabel;

  [(UILabel *)loadingLabel removeFromSuperview];
}

- (void)_cancelTapped
{
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F85C08] code:1 userInfo:0];
  [(PKPaymentSetupViewController *)self didFinishWithPasses:0 error:v3];
}

- (void)didFinishWithPasses:(id)a3 error:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412546;
    id v19 = v6;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "PKPaymentSetupViewController did finish with passes: %@ error: %@", (uint8_t *)&v18, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    double v10 = WeakRetained;
    id v11 = objc_loadWeakRetained((id *)&self->_delegate);
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      id v13 = objc_loadWeakRetained((id *)&self->_delegate);
      [v13 paymentSetupViewController:self didFinishAddingPaymentPasses:v6 error:v7];
    }
  }
  double v14 = [(PKPaymentSetupViewController *)self presentingViewController];
  CGFloat v15 = v14;
  if (v14)
  {
    [v14 dismissViewControllerAnimated:1 completion:0];
  }
  else
  {
    double v16 = [(PKPaymentSetupViewController *)self navigationController];
    id v17 = (id)[v16 popViewControllerAnimated:1];
  }
}

- (PKPaymentSetupRequestViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaymentSetupRequestViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_loadingLabel, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_remoteVCRequest, 0);
  objc_storeStrong((id *)&self->_paymentSetupRequest, 0);

  objc_storeStrong((id *)&self->_remoteVC, 0);
}

@end