@interface PKPeerPaymentReceiverRemoteAlertViewController
- (BOOL)_canShowWhileLocked;
- (int64_t)nearbyContext;
- (void)_cleanup;
- (void)configureWithContext:(id)a3 completion:(id)a4;
@end

@implementation PKPeerPaymentReceiverRemoteAlertViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (int64_t)nearbyContext
{
  return 0;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __82__PKPeerPaymentReceiverRemoteAlertViewController_configureWithContext_completion___block_invoke;
  v11[3] = &unk_1E59CB038;
  objc_copyWeak(&v14, &location);
  id v8 = v6;
  id v12 = v8;
  id v9 = v7;
  id v13 = v9;
  v10.receiver = self;
  v10.super_class = (Class)PKPeerPaymentReceiverRemoteAlertViewController;
  [(PKNearbyPeerPaymentRemoteAlertViewController *)&v10 configureWithContext:v8 completion:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __82__PKPeerPaymentReceiverRemoteAlertViewController_configureWithContext_completion___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = [*(id *)(a1 + 32) actions];
  uint64_t v3 = [v2 anyObject];
  v4 = (void *)WeakRetained[128];
  WeakRetained[128] = v3;

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

- (void)_cleanup
{
  v6.receiver = self;
  v6.super_class = (Class)PKPeerPaymentReceiverRemoteAlertViewController;
  [(PKNearbyPeerPaymentRemoteAlertViewController *)&v6 _cleanup];
  uint64_t v3 = [(PKNearbyPeerPaymentRemoteAlertViewController *)self userInfo];
  replyAction = [v3 objectForKeyedSubscript:@"uiHost"];
  if (!replyAction)
  {
    int v5 = [(BSAction *)self->_replyAction canSendResponse];

    if (!v5) {
      return;
    }
    uint64_t v3 = [MEMORY[0x1E4F4F678] responseWithInfo:0];
    [(BSAction *)self->_replyAction sendResponse:v3];
    replyAction = self->_replyAction;
    self->_replyAction = 0;
  }
}

- (void).cxx_destruct
{
}

@end