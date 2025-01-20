@interface PKShareSecureElementPassViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
- (BOOL)promptToShareURL;
- (BOOL)shouldViewControllerBeAnimatedIn;
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)result;
- (PKShareSecureElementPassViewController)init;
- (PKShareSecureElementPassViewController)initWithSecureElementPass:(PKSecureElementPass *)pass delegate:(id)delegate;
- (PKShareSecureElementPassViewController)initWithSecureElementPass:(id)a3 environment:(unint64_t)a4 isFromPeopleScreen:(BOOL)a5 delegate:(id)a6;
- (id)childViewControllerForStatusBarHidden;
- (id)childViewControllerForStatusBarStyle;
- (id)delegate;
- (int64_t)modalPresentationStyle;
- (int64_t)modalTransitionStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_addRemoteVCToView;
- (void)_remoteDidGetConfigured;
- (void)dealloc;
- (void)didCreateShareURL:(id)a3 activationCode:(id)a4 error:(id)a5;
- (void)didFinishShareWithDidUserShare:(BOOL)a3 error:(id)a4;
- (void)loadRemoteViewController;
- (void)loadView;
- (void)setDelegate:(id)delegate;
- (void)setPromptToShareURL:(BOOL)promptToShareURL;
- (void)setRemoteVC:(id)a3 completionHandler:(id)a4;
- (void)viewWillLayoutSubviews;
@end

@implementation PKShareSecureElementPassViewController

- (PKShareSecureElementPassViewController)init
{
  return 0;
}

- (PKShareSecureElementPassViewController)initWithSecureElementPass:(PKSecureElementPass *)pass delegate:(id)delegate
{
  return [(PKShareSecureElementPassViewController *)self initWithSecureElementPass:pass environment:2 isFromPeopleScreen:0 delegate:delegate];
}

- (PKShareSecureElementPassViewController)initWithSecureElementPass:(id)a3 environment:(unint64_t)a4 isFromPeopleScreen:(BOOL)a5 delegate:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)PKShareSecureElementPassViewController;
  v13 = [(PKShareSecureElementPassViewController *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_pass, a3);
    v14->_environment = a4;
    v14->_isFromPeopleScreen = a5;
    objc_storeWeak((id *)&v14->_delegate, v12);
    v14->_promptToShareURL = 1;
    [(PKShareSecureElementPassViewController *)v14 loadRemoteViewController];
  }

  return v14;
}

- (void)dealloc
{
  id v3 = (id)[(_UIAsyncInvocation *)self->_remoteVCRequest invoke];
  remoteVCRequest = self->_remoteVCRequest;
  self->_remoteVCRequest = 0;

  v5.receiver = self;
  v5.super_class = (Class)PKShareSecureElementPassViewController;
  [(PKShareSecureElementPassViewController *)&v5 dealloc];
}

- (void)loadRemoteViewController
{
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__PKShareSecureElementPassViewController_loadRemoteViewController__block_invoke;
  v10[3] = &unk_1E59CF6D0;
  v10[4] = self;
  [(PKShareSecureElementPassViewController *)self _beginDelayingPresentation:v10 cancellationHandler:10.0];
  int v3 = [(PKSecureElementPass *)self->_pass isCarKeyPass];
  v4 = (id *)MEMORY[0x1E4F87ED0];
  if (!v3) {
    v4 = (id *)MEMORY[0x1E4F87158];
  }
  id v5 = *v4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__PKShareSecureElementPassViewController_loadRemoteViewController__block_invoke_79;
  v8[3] = &unk_1E59CF6F8;
  v8[4] = self;
  objc_copyWeak(&v9, &location);
  v6 = +[_UIRemoteViewController requestViewController:@"PKRemoteShareSecureElementPassViewController" fromServiceWithBundleIdentifier:v5 connectionHandler:v8];
  remoteVCRequest = self->_remoteVCRequest;
  self->_remoteVCRequest = v6;

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

uint64_t __66__PKShareSecureElementPassViewController_loadRemoteViewController__block_invoke(uint64_t a1, int a2)
{
  v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "ShareSecureElementPass: Timed out while presenting share pass view controller", v7, 2u);
  }

  id v5 = (id)[*(id *)(*(void *)(a1 + 32) + 1000) invoke];
  return a2 ^ 1u;
}

void __66__PKShareSecureElementPassViewController_loadRemoteViewController__block_invoke_79(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = *(void **)(v7 + 1000);
  *(void *)(v7 + 1000) = 0;

  if (!v5 || v6)
  {
    v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "ShareSecureElementPass: Failed to load remote view controller: %@", buf, 0xCu);
    }

    id v11 = (id *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained(v11);
    [WeakRetained _endDelayingPresentation];

    v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F87D80] code:1 userInfo:0];
    id v14 = objc_loadWeakRetained(v11);
    [v14 didFinishShareWithDidUserShare:0 error:v13];
  }
  else
  {
    id v9 = *(void **)(a1 + 32);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __66__PKShareSecureElementPassViewController_loadRemoteViewController__block_invoke_2;
    v15[3] = &unk_1E59CB100;
    objc_copyWeak(&v16, (id *)(a1 + 40));
    [v9 setRemoteVC:v5 completionHandler:v15];
    objc_destroyWeak(&v16);
  }
}

void __66__PKShareSecureElementPassViewController_loadRemoteViewController__block_invoke_2(uint64_t a1, int a2)
{
  int v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _endDelayingPresentation];

  if (a2)
  {
    id v5 = objc_loadWeakRetained(v3);
    [v5 _addRemoteVCToView];

    id v7 = objc_loadWeakRetained(v3);
    [v7 _remoteDidGetConfigured];
  }
  else
  {
    id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F87D80] code:1 userInfo:0];
    id v6 = objc_loadWeakRetained(v3);
    [v6 didFinishShareWithDidUserShare:0 error:v7];
  }
}

- (void)setRemoteVC:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_remoteVC, a3);
  remoteVC = self->_remoteVC;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __72__PKShareSecureElementPassViewController_setRemoteVC_completionHandler___block_invoke;
  v24[3] = &unk_1E59CC620;
  id v10 = v8;
  id v25 = v10;
  id v11 = [(_UIRemoteViewController *)remoteVC serviceViewControllerProxyWithErrorHandler:v24];
  if (v11)
  {
    id v12 = [MEMORY[0x1E4FB1BA8] mainScreen];
    v13 = [v12 fixedCoordinateSpace];
    [v13 bounds];
    double v15 = v14;
    double v17 = v16;
    [v12 scale];
    objc_msgSend(v11, "setDisplayPropertiesWithScreenSize:scale:", v15, v17, v18);

    pass = self->_pass;
    unint64_t environment = self->_environment;
    BOOL isFromPeopleScreen = self->_isFromPeopleScreen;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __72__PKShareSecureElementPassViewController_setRemoteVC_completionHandler___block_invoke_3;
    v22[3] = &unk_1E59CA9F8;
    id v23 = v10;
    [v11 setPass:pass environment:environment isFromPeopleScreen:isFromPeopleScreen completion:v22];
  }
  else
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

void __72__PKShareSecureElementPassViewController_setRemoteVC_completionHandler___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__PKShareSecureElementPassViewController_setRemoteVC_completionHandler___block_invoke_2;
  block[3] = &unk_1E59CAA98;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __72__PKShareSecureElementPassViewController_setRemoteVC_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __72__PKShareSecureElementPassViewController_setRemoteVC_completionHandler___block_invoke_3(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __72__PKShareSecureElementPassViewController_setRemoteVC_completionHandler___block_invoke_4;
  v3[3] = &unk_1E59CAF20;
  id v4 = *(id *)(a1 + 32);
  char v5 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __72__PKShareSecureElementPassViewController_setRemoteVC_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)_addRemoteVCToView
{
  [(PKShareSecureElementPassViewController *)self addChildViewController:self->_remoteVC];
  id v4 = [(PKShareSecureElementPassRemoteViewController *)self->_remoteVC view];
  int v3 = [(PKShareSecureElementPassViewController *)self view];
  [v3 addSubview:v4];
  [v3 setNeedsLayout];
  [v3 layoutIfNeeded];
  [(_UIRemoteViewController *)self->_remoteVC didMoveToParentViewController:self];
  [(PKShareSecureElementPassViewController *)self setNeedsStatusBarAppearanceUpdate];
}

- (void)_remoteDidGetConfigured
{
  if (!self->_remoteVCConfigured)
  {
    self->_remoteVCConfigured = 1;
    [(PKShareSecureElementPassViewController *)self setPromptToShareURL:self->_promptToShareURL];
  }
}

- (void)setPromptToShareURL:(BOOL)promptToShareURL
{
  self->_promptToShareURL = promptToShareURL;
  if (self->_remoteVCConfigured)
  {
    id v4 = [(_UIRemoteViewController *)self->_remoteVC serviceViewControllerProxy];
    [v4 setShouldPromptUserToShare:self->_promptToShareURL];
  }
}

- (BOOL)shouldViewControllerBeAnimatedIn
{
  return self->_environment == 2;
}

- (void)didCreateShareURL:(id)a3 activationCode:(id)a4 error:(id)a5
{
  id v13 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = objc_loadWeakRetained((id *)&self->_delegate);
      [v12 shareSecureElementPassViewController:self didCreateShareURL:v13 activationCode:v7];
    }
  }
}

- (void)didFinishShareWithDidUserShare:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = @"N";
    if (v4) {
      id v8 = @"Y";
    }
    int v12 = 138412546;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "ShareSecureElementPass: didFinishShare didUserShare: %@ error: %@", (uint8_t *)&v12, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    if (v6) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = v4;
    }
    char v11 = objc_loadWeakRetained((id *)&self->_delegate);
    [v11 shareSecureElementPassViewController:self didFinishWithResult:v10];
  }
  else
  {
    char v11 = [(PKShareSecureElementPassViewController *)self presentingViewController];
    [v11 dismissViewControllerAnimated:1 completion:0];
  }
}

- (int64_t)modalTransitionStyle
{
  return 0;
}

- (int64_t)modalPresentationStyle
{
  return 5;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
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
    v4.super_class = (Class)PKShareSecureElementPassViewController;
    [(PKShareSecureElementPassViewController *)&v4 sizeForChildContentContainer:result.width withParentContainerSize:result.height];
  }
  return result;
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)PKShareSecureElementPassViewController;
  [(PKShareSecureElementPassViewController *)&v5 loadView];
  int v3 = [(PKShareSecureElementPassViewController *)self view];
  objc_super v4 = [MEMORY[0x1E4FB1618] clearColor];
  [v3 setBackgroundColor:v4];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PKShareSecureElementPassViewController;
  [(PKShareSecureElementPassViewController *)&v5 viewWillLayoutSubviews];
  int v3 = [(PKShareSecureElementPassViewController *)self view];
  objc_super v4 = [(PKShareSecureElementPassRemoteViewController *)self->_remoteVC view];
  [v3 bounds];
  objc_msgSend(v4, "setFrame:");
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (BOOL)promptToShareURL
{
  return self->_promptToShareURL;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_remoteVC, 0);
  objc_storeStrong((id *)&self->_remoteVCRequest, 0);

  objc_storeStrong((id *)&self->_pass, 0);
}

@end