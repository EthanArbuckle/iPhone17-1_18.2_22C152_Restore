@interface PKPerformActionSetupViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)result;
- (PKPerformActionSetupViewController)init;
- (PKPerformActionSetupViewController)initWithPassIdentifier:(id)a3;
- (PKPerformActionSetupViewControllerDelegate)delegate;
- (id)childViewControllerForStatusBarHidden;
- (id)childViewControllerForStatusBarStyle;
- (int64_t)modalTransitionStyle;
- (int64_t)presentationStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_setRemoteVC:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)didCancel;
- (void)didFinish;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setPresentationStyle:(int64_t)a3;
- (void)updateModalPresentationStyle;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PKPerformActionSetupViewController

- (PKPerformActionSetupViewController)init
{
  return 0;
}

- (PKPerformActionSetupViewController)initWithPassIdentifier:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPerformActionSetupViewController;
  v6 = [(PKPerformActionSetupViewController *)&v14 init];
  v7 = v6;
  if (v6)
  {
    v6->_explicitPresentationStyle = 0;
    objc_storeStrong((id *)&v6->_passIdentifier, a3);
    objc_initWeak(&location, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __61__PKPerformActionSetupViewController_initWithPassIdentifier___block_invoke;
    v11[3] = &unk_1E59CC5F8;
    objc_copyWeak(&v12, &location);
    uint64_t v8 = +[_UIRemoteViewController requestViewController:@"PKServicePerformActionSetupViewController" fromServiceWithBundleIdentifier:@"com.apple.PassbookUIService" connectionHandler:v11];
    remoteVCRequest = v7->_remoteVCRequest;
    v7->_remoteVCRequest = (_UIAsyncInvocation *)v8;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __61__PKPerformActionSetupViewController_initWithPassIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = (void *)*((void *)WeakRetained + 123);
    *((void *)WeakRetained + 123) = 0;

    if (v6) {
      [v4 _setRemoteVC:v6 completionHandler:0];
    }
    else {
      [v4 didCancel];
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
  v6.super_class = (Class)PKPerformActionSetupViewController;
  [(PKPerformActionSetupViewController *)&v6 dealloc];
}

- (void)_setRemoteVC:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_remoteVC, a3);
  [(PKPerformActionSetupViewController *)self addChildViewController:self->_remoteVC];
  v9 = [(PKRemotePerformActionSetupViewController *)self->_remoteVC view];
  v10 = [(PKPerformActionSetupViewController *)self view];
  [v10 addSubview:v9];
  [v10 setNeedsLayout];
  [v10 layoutIfNeeded];
  [v9 setUserInteractionEnabled:0];
  [(_UIRemoteViewController *)self->_remoteVC didMoveToParentViewController:self];
  [(PKPerformActionSetupViewController *)self setNeedsStatusBarAppearanceUpdate];
  [(PKPerformActionSetupViewController *)self setNeedsUpdateOfSupportedInterfaceOrientations];
  remoteVC = self->_remoteVC;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __69__PKPerformActionSetupViewController__setRemoteVC_completionHandler___block_invoke;
  v24[3] = &unk_1E59CC620;
  id v12 = (void (**)(void))v8;
  id v25 = v12;
  v13 = [(_UIRemoteViewController *)remoteVC serviceViewControllerProxyWithErrorHandler:v24];
  if (v13)
  {
    objc_super v14 = [MEMORY[0x1E4FB1BA8] mainScreen];
    v15 = [v14 fixedCoordinateSpace];
    [v15 bounds];
    double v17 = v16;
    double v19 = v18;
    [v14 scale];
    objc_msgSend(v13, "setDisplayPropertiesWithScreenSize:scale:", v17, v19, v20);

    passIdentifier = self->_passIdentifier;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __69__PKPerformActionSetupViewController__setRemoteVC_completionHandler___block_invoke_3;
    v22[3] = &unk_1E59CA9F8;
    v23 = v12;
    [v13 configureWithPassUniqueIdentifier:passIdentifier actionType:1 completion:v22];
  }
  else if (v12)
  {
    v12[2](v12);
  }
}

void __69__PKPerformActionSetupViewController__setRemoteVC_completionHandler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__PKPerformActionSetupViewController__setRemoteVC_completionHandler___block_invoke_2;
    block[3] = &unk_1E59CAA98;
    id v3 = v1;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __69__PKPerformActionSetupViewController__setRemoteVC_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __69__PKPerformActionSetupViewController__setRemoteVC_completionHandler___block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__PKPerformActionSetupViewController__setRemoteVC_completionHandler___block_invoke_4;
  block[3] = &unk_1E59CAA98;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __69__PKPerformActionSetupViewController__setRemoteVC_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setPresentationStyle:(int64_t)a3
{
  if (self->_presentationStyle != a3 || !self->_explicitPresentationStyle)
  {
    self->_presentationStyle = 2 * (a3 == 2);
    self->_explicitPresentationStyle = 1;
    [(PKPerformActionSetupViewController *)self updateModalPresentationStyle];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PKPerformActionSetupViewController;
  -[PKPerformActionSetupViewController viewWillTransitionToSize:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  [(PKPerformActionSetupViewController *)self updateModalPresentationStyle];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PKPerformActionSetupViewController;
  [(PKPerformActionSetupViewController *)&v5 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  [(PKPerformActionSetupViewController *)self updateModalPresentationStyle];
}

- (void)updateModalPresentationStyle
{
  id v3 = [(PKPerformActionSetupViewController *)self view];
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
      [(PKPerformActionSetupViewController *)v8 setModalPresentationStyle:presentationStyle];
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
    v4.super_class = (Class)PKPerformActionSetupViewController;
    [(PKPerformActionSetupViewController *)&v4 sizeForChildContentContainer:result.width withParentContainerSize:result.height];
  }
  return result;
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)PKPerformActionSetupViewController;
  [(PKPerformActionSetupViewController *)&v5 loadView];
  id v3 = [(PKPerformActionSetupViewController *)self view];
  objc_super v4 = [MEMORY[0x1E4FB1618] clearColor];
  [v3 setBackgroundColor:v4];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PKPerformActionSetupViewController;
  [(PKPerformActionSetupViewController *)&v5 viewWillLayoutSubviews];
  id v3 = [(PKPerformActionSetupViewController *)self view];
  objc_super v4 = [(PKRemotePerformActionSetupViewController *)self->_remoteVC view];
  [v3 bounds];
  objc_msgSend(v4, "setFrame:");
}

- (void)didCancel
{
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "PKPerformActionSetupViewController did cancel", v13, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    objc_super v5 = WeakRetained;
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_delegate);
      [v8 performActionSetupViewControllerDidCancel:self];
    }
  }
  v9 = [(PKPerformActionSetupViewController *)self presentingViewController];
  id v10 = v9;
  if (v9)
  {
    [v9 dismissViewControllerAnimated:1 completion:0];
  }
  else
  {
    v11 = [(PKPerformActionSetupViewController *)self navigationController];
    id v12 = (id)[v11 popViewControllerAnimated:1];
  }
}

- (void)didFinish
{
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "PKPerformActionSetupViewController did finish", v13, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    objc_super v5 = WeakRetained;
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_delegate);
      [v8 performActionSetupViewControllerDidFinish:self];
    }
  }
  v9 = [(PKPerformActionSetupViewController *)self presentingViewController];
  id v10 = v9;
  if (v9)
  {
    [v9 dismissViewControllerAnimated:1 completion:0];
  }
  else
  {
    v11 = [(PKPerformActionSetupViewController *)self navigationController];
    id v12 = (id)[v11 popViewControllerAnimated:1];
  }
}

- (PKPerformActionSetupViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPerformActionSetupViewControllerDelegate *)WeakRetained;
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
  objc_storeStrong((id *)&self->_passIdentifier, 0);
  objc_storeStrong((id *)&self->_remoteVCRequest, 0);

  objc_storeStrong((id *)&self->_remoteVC, 0);
}

@end