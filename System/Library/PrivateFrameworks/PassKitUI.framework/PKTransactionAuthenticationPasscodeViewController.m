@interface PKTransactionAuthenticationPasscodeViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
- (BOOL)_canShowWhileLocked;
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)result;
- (NSString)passUniqueIdentifier;
- (NSString)transactionIdentifier;
- (PKTransactionAuthenticationPasscodeViewController)init;
- (PKTransactionAuthenticationPasscodeViewController)initWithPassUniqueIdentifier:(id)a3 transactionIdentifier:(id)a4 archivedAnalyticsSessionToken:(id)a5;
- (PKTransactionAuthenticationPasscodeViewControllerDelegate)delegate;
- (id)childViewControllerForStatusBarHidden;
- (id)childViewControllerForStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_setRemoteVC:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)loadView;
- (void)passcodeViewControllerDidCancel;
- (void)passcodeViewControllerDidEndSessionExchange;
- (void)passcodeViewControllerDidGenerateEncryptedPasscode:(id)a3;
- (void)passcodeViewControllerRequestSessionExchangeTokenWithHandler:(id)a3;
- (void)resetWithTransactionAuthenticationFailure:(int64_t)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKTransactionAuthenticationPasscodeViewController

- (PKTransactionAuthenticationPasscodeViewController)init
{
  return 0;
}

- (PKTransactionAuthenticationPasscodeViewController)initWithPassUniqueIdentifier:(id)a3 transactionIdentifier:(id)a4 archivedAnalyticsSessionToken:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)PKTransactionAuthenticationPasscodeViewController;
  v12 = [(PKTransactionAuthenticationPasscodeViewController *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_passUniqueIdentifier, a3);
    objc_storeStrong((id *)&v13->_transactionIdentifier, a4);
    objc_storeStrong((id *)&v13->_archivedAnalyticsSessionToken, a5);
    v13->_delegateLock._os_unfair_lock_opaque = 0;
    objc_initWeak(&location, v13);
    [(PKTransactionAuthenticationPasscodeViewController *)v13 _beginDelayingPresentation:0 cancellationHandler:10.0];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __134__PKTransactionAuthenticationPasscodeViewController_initWithPassUniqueIdentifier_transactionIdentifier_archivedAnalyticsSessionToken___block_invoke;
    v17[3] = &unk_1E59CC5F8;
    objc_copyWeak(&v18, &location);
    uint64_t v14 = +[_UIRemoteViewController requestViewController:@"PKServiceTransactionAuthenticationPasscodeViewController" fromServiceWithBundleIdentifier:@"com.apple.PassbookSecureUIService" connectionHandler:v17];
    remoteVCRequest = v13->_remoteVCRequest;
    v13->_remoteVCRequest = (_UIAsyncInvocation *)v14;

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __134__PKTransactionAuthenticationPasscodeViewController_initWithPassUniqueIdentifier_transactionIdentifier_archivedAnalyticsSessionToken___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    id v10 = (void *)*((void *)WeakRetained + 122);
    *((void *)WeakRetained + 122) = 0;

    if (v5)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __134__PKTransactionAuthenticationPasscodeViewController_initWithPassUniqueIdentifier_transactionIdentifier_archivedAnalyticsSessionToken___block_invoke_2;
      v12[3] = &unk_1E59CB100;
      objc_copyWeak(&v13, v7);
      [v9 _setRemoteVC:v5 completion:v12];
      objc_destroyWeak(&v13);
    }
    else
    {
      [v9 _endDelayingPresentation];
      id v11 = [v9 delegate];
      [v11 passcodeViewControllerDidCancel:v9];
    }
  }
}

void __134__PKTransactionAuthenticationPasscodeViewController_initWithPassUniqueIdentifier_transactionIdentifier_archivedAnalyticsSessionToken___block_invoke_2(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    [WeakRetained _endDelayingPresentation];
    id WeakRetained = v5;
    if ((a2 & 1) == 0)
    {
      v4 = [v5 delegate];
      [v4 passcodeViewControllerDidCancel:v5];

      id WeakRetained = v5;
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
  v6.super_class = (Class)PKTransactionAuthenticationPasscodeViewController;
  [(PKTransactionAuthenticationPasscodeViewController *)&v6 dealloc];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
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
    v4.super_class = (Class)PKTransactionAuthenticationPasscodeViewController;
    [(PKTransactionAuthenticationPasscodeViewController *)&v4 sizeForChildContentContainer:result.width withParentContainerSize:result.height];
  }
  return result;
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)PKTransactionAuthenticationPasscodeViewController;
  [(PKTransactionAuthenticationPasscodeViewController *)&v5 loadView];
  v3 = [(PKTransactionAuthenticationPasscodeViewController *)self view];
  objc_super v4 = [MEMORY[0x1E4FB1618] clearColor];
  [v3 setBackgroundColor:v4];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PKTransactionAuthenticationPasscodeViewController;
  [(PKTransactionAuthenticationPasscodeViewController *)&v5 viewWillLayoutSubviews];
  v3 = [(PKRemoteTransactionAuthenticationPasscodeViewController *)self->_remoteVC view];
  objc_super v4 = [(PKTransactionAuthenticationPasscodeViewController *)self view];
  [v4 bounds];
  objc_msgSend(v3, "setFrame:");
}

- (void)resetWithTransactionAuthenticationFailure:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  remoteVC = self->_remoteVC;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __106__PKTransactionAuthenticationPasscodeViewController_resetWithTransactionAuthenticationFailure_completion___block_invoke;
  v12[3] = &unk_1E59CC620;
  id v8 = v6;
  id v13 = v8;
  id v9 = [(_UIRemoteViewController *)remoteVC serviceViewControllerProxyWithErrorHandler:v12];
  if (v9)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __106__PKTransactionAuthenticationPasscodeViewController_resetWithTransactionAuthenticationFailure_completion___block_invoke_2;
    v10[3] = &unk_1E59CA9F8;
    id v11 = v8;
    [v9 resetWithTransactionAuthenticationFailure:a3 completion:v10];
  }
  else if (v8)
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
}

uint64_t __106__PKTransactionAuthenticationPasscodeViewController_resetWithTransactionAuthenticationFailure_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __106__PKTransactionAuthenticationPasscodeViewController_resetWithTransactionAuthenticationFailure_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setDelegate:(id)a3
{
  p_delegateLock = &self->_delegateLock;
  id v5 = a3;
  os_unfair_lock_lock(p_delegateLock);
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_delegateLock);
}

- (PKTransactionAuthenticationPasscodeViewControllerDelegate)delegate
{
  p_delegateLock = &self->_delegateLock;
  os_unfair_lock_lock(&self->_delegateLock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_delegateLock);

  return (PKTransactionAuthenticationPasscodeViewControllerDelegate *)WeakRetained;
}

- (void)passcodeViewControllerRequestSessionExchangeTokenWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(PKTransactionAuthenticationPasscodeViewController *)self delegate];
  [v5 passcodeViewController:self requestSessionExchangeTokenWithHandler:v4];
}

- (void)passcodeViewControllerDidEndSessionExchange
{
  id v3 = [(PKTransactionAuthenticationPasscodeViewController *)self delegate];
  [v3 passcodeViewControllerDidEndSessionExchange:self];
}

- (void)passcodeViewControllerDidCancel
{
  id v3 = [(PKTransactionAuthenticationPasscodeViewController *)self delegate];
  [v3 passcodeViewControllerDidCancel:self];
}

- (void)passcodeViewControllerDidGenerateEncryptedPasscode:(id)a3
{
  id v4 = a3;
  id v5 = [(PKTransactionAuthenticationPasscodeViewController *)self delegate];
  [v5 passcodeViewController:self didGenerateEncryptedPasscode:v4];
}

- (void)_setRemoteVC:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_remoteVC, a3);
  [(PKRemoteTransactionAuthenticationPasscodeViewController *)self->_remoteVC setDelegate:self];
  [(PKTransactionAuthenticationPasscodeViewController *)self addChildViewController:self->_remoteVC];
  id v9 = [(PKRemoteTransactionAuthenticationPasscodeViewController *)self->_remoteVC view];
  id v10 = [(PKTransactionAuthenticationPasscodeViewController *)self view];
  [v10 addSubview:v9];
  [v10 setNeedsLayout];
  [v10 layoutIfNeeded];
  [(_UIRemoteViewController *)self->_remoteVC didMoveToParentViewController:self];
  [(PKTransactionAuthenticationPasscodeViewController *)self setNeedsStatusBarAppearanceUpdate];
  [(PKTransactionAuthenticationPasscodeViewController *)self setNeedsUpdateOfSupportedInterfaceOrientations];
  remoteVC = self->_remoteVC;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __77__PKTransactionAuthenticationPasscodeViewController__setRemoteVC_completion___block_invoke;
  v19[3] = &unk_1E59CC620;
  id v12 = v8;
  id v20 = v12;
  id v13 = [(_UIRemoteViewController *)remoteVC serviceViewControllerProxyWithErrorHandler:v19];
  if (v13)
  {
    passUniqueIdentifier = self->_passUniqueIdentifier;
    transactionIdentifier = self->_transactionIdentifier;
    archivedAnalyticsSessionToken = self->_archivedAnalyticsSessionToken;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __77__PKTransactionAuthenticationPasscodeViewController__setRemoteVC_completion___block_invoke_3;
    v17[3] = &unk_1E59CA9F8;
    id v18 = v12;
    [v13 setPassUniqueIdentifier:passUniqueIdentifier transactionIdentifier:transactionIdentifier archivedAnalyticsSessionToken:archivedAnalyticsSessionToken completionHandler:v17];
  }
  else if (v12)
  {
    (*((void (**)(id, void))v12 + 2))(v12, 0);
  }
}

void __77__PKTransactionAuthenticationPasscodeViewController__setRemoteVC_completion___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__PKTransactionAuthenticationPasscodeViewController__setRemoteVC_completion___block_invoke_2;
    block[3] = &unk_1E59CAA98;
    id v3 = v1;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __77__PKTransactionAuthenticationPasscodeViewController__setRemoteVC_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __77__PKTransactionAuthenticationPasscodeViewController__setRemoteVC_completion___block_invoke_3(uint64_t a1, char a2)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __77__PKTransactionAuthenticationPasscodeViewController__setRemoteVC_completion___block_invoke_4;
    v4[3] = &unk_1E59CAF20;
    id v5 = v2;
    char v6 = a2;
    dispatch_async(MEMORY[0x1E4F14428], v4);
  }
}

uint64_t __77__PKTransactionAuthenticationPasscodeViewController__setRemoteVC_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (NSString)passUniqueIdentifier
{
  return self->_passUniqueIdentifier;
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archivedAnalyticsSessionToken, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_storeStrong((id *)&self->_passUniqueIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_remoteVC, 0);

  objc_storeStrong((id *)&self->_remoteVCRequest, 0);
}

@end