@interface PKShareableCredentialsMessageComposeViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)result;
- (NSArray)recipientAddresses;
- (PKShareableCredentialsMessageComposeViewController)init;
- (PKShareableCredentialsMessageComposeViewController)initWithCoder:(id)a3;
- (PKShareableCredentialsMessageComposeViewController)initWithConfiguration:(id)a3;
- (PKShareableCredentialsMessageComposeViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PKShareableCredentialsMessageComposeViewController)initWithPartialShareInvite:(id)a3;
- (PKShareableCredentialsMessageComposeViewControllerDelegate)delegate;
- (id)_init;
- (id)_initWithPartialShareInvite:(id)a3 configuration:(id)a4;
- (id)childViewControllerForStatusBarHidden;
- (id)childViewControllerForStatusBarStyle;
- (int64_t)modalPresentationStyle;
- (int64_t)modalTransitionStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_setRemoteVC:(id)a3 completionHandler:(id)a4;
- (void)_setupRemoteView;
- (void)dealloc;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setRecipientAddresses:(id)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKShareableCredentialsMessageComposeViewController

- (PKShareableCredentialsMessageComposeViewController)initWithCoder:(id)a3
{
  return 0;
}

- (PKShareableCredentialsMessageComposeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return 0;
}

- (PKShareableCredentialsMessageComposeViewController)init
{
  return 0;
}

- (PKShareableCredentialsMessageComposeViewController)initWithConfiguration:(id)a3
{
  return (PKShareableCredentialsMessageComposeViewController *)[(PKShareableCredentialsMessageComposeViewController *)self _initWithPartialShareInvite:0 configuration:a3];
}

- (PKShareableCredentialsMessageComposeViewController)initWithPartialShareInvite:(id)a3
{
  return (PKShareableCredentialsMessageComposeViewController *)[(PKShareableCredentialsMessageComposeViewController *)self _initWithPartialShareInvite:a3 configuration:0];
}

- (id)_initWithPartialShareInvite:(id)a3 configuration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(PKShareableCredentialsMessageComposeViewController *)self _init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(v9 + 124, a3);
    objc_storeStrong(v10 + 123, a4);
  }

  return v10;
}

- (id)_init
{
  v4.receiver = self;
  v4.super_class = (Class)PKShareableCredentialsMessageComposeViewController;
  v2 = [(PKShareableCredentialsMessageComposeViewController *)&v4 initWithNibName:0 bundle:0];
  [(PKShareableCredentialsMessageComposeViewController *)v2 _setupRemoteView];
  return v2;
}

- (void)dealloc
{
  remoteVCRequest = self->_remoteVCRequest;
  if (remoteVCRequest)
  {
    id v4 = (id)[(_UIAsyncInvocation *)remoteVCRequest invoke];
    v5 = self->_remoteVCRequest;
    self->_remoteVCRequest = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)PKShareableCredentialsMessageComposeViewController;
  [(PKShareableCredentialsMessageComposeViewController *)&v6 dealloc];
}

- (void)_setupRemoteView
{
  objc_initWeak(&location, self);
  [(PKShareableCredentialsMessageComposeViewController *)self _beginDelayingPresentation:0 cancellationHandler:10.0];
  uint64_t v3 = *MEMORY[0x1E4F87158];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__PKShareableCredentialsMessageComposeViewController__setupRemoteView__block_invoke;
  v6[3] = &unk_1E59CC5F8;
  objc_copyWeak(&v7, &location);
  id v4 = +[_UIRemoteViewController requestViewController:@"PKServiceMessagesComposeViewController" fromServiceWithBundleIdentifier:v3 connectionHandler:v6];
  remoteVCRequest = self->_remoteVCRequest;
  self->_remoteVCRequest = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __70__PKShareableCredentialsMessageComposeViewController__setupRemoteView__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    v10 = (void *)*((void *)WeakRetained + 125);
    *((void *)WeakRetained + 125) = 0;

    if (v5)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __70__PKShareableCredentialsMessageComposeViewController__setupRemoteView__block_invoke_2;
      v12[3] = &unk_1E59CA7F8;
      objc_copyWeak(&v13, v7);
      [v9 _setRemoteVC:v5 completionHandler:v12];
      objc_destroyWeak(&v13);
    }
    else
    {
      [v9 _endDelayingPresentation];
      v11 = [v9 delegate];
      [v11 messageComposeViewControllerDidFinishWithResult:0];
    }
  }
}

void __70__PKShareableCredentialsMessageComposeViewController__setupRemoteView__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _endDelayingPresentation];
}

- (void)_setRemoteVC:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_remoteVC, a3);
  remoteVC = self->_remoteVC;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [(PKRemoteShareableCredentialsMessageComposeViewController *)remoteVC setDelegate:WeakRetained];

  objc_storeWeak((id *)&self->_delegate, 0);
  [(PKShareableCredentialsMessageComposeViewController *)self addChildViewController:self->_remoteVC];
  v11 = [(PKRemoteShareableCredentialsMessageComposeViewController *)self->_remoteVC view];
  v12 = [(PKShareableCredentialsMessageComposeViewController *)self view];
  [v12 addSubview:v11];
  [v12 setNeedsLayout];
  [v12 layoutIfNeeded];
  [(_UIRemoteViewController *)self->_remoteVC didMoveToParentViewController:self];
  [(PKShareableCredentialsMessageComposeViewController *)self setNeedsStatusBarAppearanceUpdate];
  [(PKShareableCredentialsMessageComposeViewController *)self setNeedsUpdateOfSupportedInterfaceOrientations];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__PKShareableCredentialsMessageComposeViewController__setRemoteVC_completionHandler___block_invoke;
  aBlock[3] = &unk_1E59CAA98;
  id v13 = (void (**)(void))v8;
  id v33 = v13;
  v14 = _Block_copy(aBlock);
  v15 = self->_remoteVC;
  uint64_t v27 = MEMORY[0x1E4F143A8];
  uint64_t v28 = 3221225472;
  v29 = __85__PKShareableCredentialsMessageComposeViewController__setRemoteVC_completionHandler___block_invoke_3;
  v30 = &unk_1E59CC620;
  id v16 = v14;
  id v31 = v16;
  v17 = [(_UIRemoteViewController *)v15 serviceViewControllerProxyWithErrorHandler:&v27];
  if (v17)
  {
    v18 = objc_msgSend(MEMORY[0x1E4FB1BA8], "mainScreen", v27, v28, v29, v30);
    v19 = [v18 fixedCoordinateSpace];
    [v19 bounds];
    double v21 = v20;
    double v23 = v22;
    [v18 scale];
    objc_msgSend(v17, "setDisplayPropertiesWithScreenSize:scale:", v21, v23, v24);

    configuration = self->_configuration;
    if (configuration)
    {
      [v17 setConfiguration:configuration completionHandler:v16];
    }
    else
    {
      partialShareInvite = self->_partialShareInvite;
      if (partialShareInvite) {
        [v17 setPartialShareInvite:partialShareInvite completion:v16];
      }
    }
  }
  else
  {
    v13[2](v13);
  }
}

void __85__PKShareableCredentialsMessageComposeViewController__setRemoteVC_completionHandler___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__PKShareableCredentialsMessageComposeViewController__setRemoteVC_completionHandler___block_invoke_2;
  block[3] = &unk_1E59CAA98;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __85__PKShareableCredentialsMessageComposeViewController__setRemoteVC_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __85__PKShareableCredentialsMessageComposeViewController__setRemoteVC_completionHandler___block_invoke_3(uint64_t a1)
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
    v4.super_class = (Class)PKShareableCredentialsMessageComposeViewController;
    [(PKShareableCredentialsMessageComposeViewController *)&v4 sizeForChildContentContainer:result.width withParentContainerSize:result.height];
  }
  return result;
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)PKShareableCredentialsMessageComposeViewController;
  [(PKShareableCredentialsMessageComposeViewController *)&v5 loadView];
  uint64_t v3 = [(PKShareableCredentialsMessageComposeViewController *)self view];
  objc_super v4 = [MEMORY[0x1E4FB1618] clearColor];
  [v3 setBackgroundColor:v4];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PKShareableCredentialsMessageComposeViewController;
  [(PKShareableCredentialsMessageComposeViewController *)&v5 viewWillLayoutSubviews];
  uint64_t v3 = [(PKShareableCredentialsMessageComposeViewController *)self view];
  objc_super v4 = [(PKRemoteShareableCredentialsMessageComposeViewController *)self->_remoteVC view];
  [v3 bounds];
  objc_msgSend(v4, "setFrame:");
}

- (PKShareableCredentialsMessageComposeViewControllerDelegate)delegate
{
  if (self->_remoteVC)
  {
    id WeakRetained = [(PKRemoteShareableCredentialsMessageComposeViewController *)self->_remoteVC delegate];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  }

  return (PKShareableCredentialsMessageComposeViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  if (self->_remoteVC) {
    [(PKRemoteShareableCredentialsMessageComposeViewController *)self->_remoteVC setDelegate:a3];
  }
  else {
    objc_storeWeak((id *)&self->_delegate, a3);
  }
}

- (NSArray)recipientAddresses
{
  return self->_recipientAddresses;
}

- (void)setRecipientAddresses:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipientAddresses, 0);
  objc_storeStrong((id *)&self->_remoteVC, 0);
  objc_storeStrong((id *)&self->_remoteVCRequest, 0);
  objc_storeStrong((id *)&self->_partialShareInvite, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end