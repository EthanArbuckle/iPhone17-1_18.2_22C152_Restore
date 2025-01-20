@interface PKSubcredentialMessageComposeViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)result;
- (PKSubcredentialMessageComposeViewController)initWithCoder:(id)a3;
- (PKSubcredentialMessageComposeViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PKSubcredentialMessageComposeViewController)initWithSharingRequest:(id)a3 delegate:(id)a4;
- (PKSubcredentialMessageComposeViewControllerDelegate)delegate;
- (id)childViewControllerForStatusBarHidden;
- (id)childViewControllerForStatusBarStyle;
- (int64_t)modalPresentationStyle;
- (int64_t)modalTransitionStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_setRemoteVC:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKSubcredentialMessageComposeViewController

- (PKSubcredentialMessageComposeViewController)initWithCoder:(id)a3
{
  return 0;
}

- (PKSubcredentialMessageComposeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return 0;
}

- (PKSubcredentialMessageComposeViewController)initWithSharingRequest:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PKSubcredentialMessageComposeViewController;
  v9 = [(PKSubcredentialMessageComposeViewController *)&v18 initWithNibName:0 bundle:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sharingRequest, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    objc_initWeak(&location, v10);
    [(PKSubcredentialMessageComposeViewController *)v10 _beginDelayingPresentation:0 cancellationHandler:10.0];
    uint64_t v11 = *MEMORY[0x1E4F87ED0];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __79__PKSubcredentialMessageComposeViewController_initWithSharingRequest_delegate___block_invoke;
    v15[3] = &unk_1E59CC5F8;
    objc_copyWeak(&v16, &location);
    uint64_t v12 = +[_UIRemoteViewController requestViewController:@"PKServiceSubcredentialMessageComposeViewController" fromServiceWithBundleIdentifier:v11 connectionHandler:v15];
    remoteVCRequest = v10->_remoteVCRequest;
    v10->_remoteVCRequest = (_UIAsyncInvocation *)v12;

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __79__PKSubcredentialMessageComposeViewController_initWithSharingRequest_delegate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    v10 = (void *)*((void *)WeakRetained + 123);
    *((void *)WeakRetained + 123) = 0;

    uint64_t v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v5;
      _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "ReadyController: %@", buf, 0xCu);
    }

    if (v5)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __79__PKSubcredentialMessageComposeViewController_initWithSharingRequest_delegate___block_invoke_84;
      v13[3] = &unk_1E59CA7F8;
      objc_copyWeak(&v14, v7);
      [v9 _setRemoteVC:v5 completionHandler:v13];
      objc_destroyWeak(&v14);
    }
    else
    {
      [v9 _endDelayingPresentation];
      uint64_t v12 = [v9 delegate];
      [v12 messageComposeViewControllerDidFinishWithResult:0];
    }
  }
}

void __79__PKSubcredentialMessageComposeViewController_initWithSharingRequest_delegate___block_invoke_84(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _endDelayingPresentation];
    id WeakRetained = v2;
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
  v6.super_class = (Class)PKSubcredentialMessageComposeViewController;
  [(PKSubcredentialMessageComposeViewController *)&v6 dealloc];
}

- (void)_setRemoteVC:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_remoteVC, a3);
  remoteVC = self->_remoteVC;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [(PKRemoteSubcredentialMessageComposeViewController *)remoteVC setDelegate:WeakRetained];

  objc_storeWeak((id *)&self->_delegate, 0);
  [(PKSubcredentialMessageComposeViewController *)self addChildViewController:self->_remoteVC];
  uint64_t v11 = [(PKRemoteSubcredentialMessageComposeViewController *)self->_remoteVC view];
  uint64_t v12 = [(PKSubcredentialMessageComposeViewController *)self view];
  [v12 addSubview:v11];
  [v12 setNeedsLayout];
  [v12 layoutIfNeeded];
  [(_UIRemoteViewController *)self->_remoteVC didMoveToParentViewController:self];
  [(PKSubcredentialMessageComposeViewController *)self setNeedsStatusBarAppearanceUpdate];
  [(PKSubcredentialMessageComposeViewController *)self setNeedsUpdateOfSupportedInterfaceOrientations];
  v13 = self->_remoteVC;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __78__PKSubcredentialMessageComposeViewController__setRemoteVC_completionHandler___block_invoke;
  v28[3] = &unk_1E59CC620;
  id v14 = (void (**)(void))v8;
  id v29 = v14;
  v15 = [(_UIRemoteViewController *)v13 serviceViewControllerProxyWithErrorHandler:v28];
  if (v15)
  {
    id v16 = [MEMORY[0x1E4FB1BA8] mainScreen];
    uint64_t v17 = [v16 fixedCoordinateSpace];
    [v17 bounds];
    double v19 = v18;
    double v21 = v20;
    [v16 scale];
    objc_msgSend(v15, "setDisplayPropertiesWithScreenSize:scale:", v19, v21, v22);

    sharingRequest = self->_sharingRequest;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __78__PKSubcredentialMessageComposeViewController__setRemoteVC_completionHandler___block_invoke_3;
    v26[3] = &unk_1E59CAA98;
    v27 = v14;
    [v15 setSharingRequest:sharingRequest completionHandler:v26];
  }
  else if (v14)
  {
    v24 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_19F450000, v24, OS_LOG_TYPE_DEFAULT, "No serviceVCProxy", v25, 2u);
    }

    v14[2](v14);
  }
}

void __78__PKSubcredentialMessageComposeViewController__setRemoteVC_completionHandler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__PKSubcredentialMessageComposeViewController__setRemoteVC_completionHandler___block_invoke_2;
    block[3] = &unk_1E59CAA98;
    id v3 = v1;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __78__PKSubcredentialMessageComposeViewController__setRemoteVC_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __78__PKSubcredentialMessageComposeViewController__setRemoteVC_completionHandler___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__PKSubcredentialMessageComposeViewController__setRemoteVC_completionHandler___block_invoke_4;
    block[3] = &unk_1E59CAA98;
    id v3 = v1;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __78__PKSubcredentialMessageComposeViewController__setRemoteVC_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int64_t)modalTransitionStyle
{
  return 0;
}

- (int64_t)modalPresentationStyle
{
  if ([(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
  {
    return 16;
  }
  else
  {
    return 0;
  }
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
    v4.super_class = (Class)PKSubcredentialMessageComposeViewController;
    [(PKSubcredentialMessageComposeViewController *)&v4 sizeForChildContentContainer:result.width withParentContainerSize:result.height];
  }
  return result;
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)PKSubcredentialMessageComposeViewController;
  [(PKSubcredentialMessageComposeViewController *)&v5 loadView];
  id v3 = [(PKSubcredentialMessageComposeViewController *)self view];
  objc_super v4 = [MEMORY[0x1E4FB1618] clearColor];
  [v3 setBackgroundColor:v4];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PKSubcredentialMessageComposeViewController;
  [(PKSubcredentialMessageComposeViewController *)&v5 viewWillLayoutSubviews];
  id v3 = [(PKSubcredentialMessageComposeViewController *)self view];
  objc_super v4 = [(PKRemoteSubcredentialMessageComposeViewController *)self->_remoteVC view];
  [v3 bounds];
  objc_msgSend(v4, "setFrame:");
}

- (PKSubcredentialMessageComposeViewControllerDelegate)delegate
{
  if (self->_remoteVC)
  {
    id WeakRetained = [(PKRemoteSubcredentialMessageComposeViewController *)self->_remoteVC delegate];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  }

  return (PKSubcredentialMessageComposeViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  if (self->_remoteVC) {
    [(PKRemoteSubcredentialMessageComposeViewController *)self->_remoteVC setDelegate:a3];
  }
  else {
    objc_storeWeak((id *)&self->_delegate, a3);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteVC, 0);
  objc_storeStrong((id *)&self->_sharingRequest, 0);
  objc_storeStrong((id *)&self->_remoteVCRequest, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end