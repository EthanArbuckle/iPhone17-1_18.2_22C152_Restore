@interface COSPaymentExpressSetupManager
- (CGSize)setupAssistantCredentialCardArtSize;
- (COSPaymentExpressSetupManager)init;
- (COSPaymentExpressSetupManagerDelegate)delegate;
- (OS_dispatch_queue)expressPassesQueue;
- (PKBridgeSetupAssistantContext)setupAssistantContext;
- (PKPaymentSetupAssistantExpressController)expressController;
- (PKPaymentSetupAssistantProvisioningContext)provisioningContext;
- (id)expressWalletPasses;
- (id)passSnapshotForCredential:(id)a3;
- (void)configureExpressSetupProvisioningContextWithCompletion:(id)a3;
- (void)expressSetupAssistantViewControllerWithCompletion:(id)a3;
- (void)peerPaymentAddAssociatedAccountViewController:(id)a3 didFinishWithSuccess:(BOOL)a4 updatedPeerPaymentAccount:(id)a5;
- (void)peerPaymentAddAssociatedAccountViewControllerDidSkipSetup:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExpressController:(id)a3;
- (void)setExpressPassesQueue:(id)a3;
- (void)setProvisioningContext:(id)a3;
- (void)setSetupAssistantContext:(id)a3;
- (void)setupAssistantCredentialUpdatedCardArt:(id)a3;
- (void)viewControllerDidTerminateSetupFlow:(id)a3;
@end

@implementation COSPaymentExpressSetupManager

- (COSPaymentExpressSetupManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)COSPaymentExpressSetupManager;
  v2 = [(COSPaymentExpressSetupManager *)&v5 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.COSPaymentExpressSetupManager", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    [(COSPaymentExpressSetupManager *)v2 setExpressPassesQueue:v3];
  }
  return v2;
}

- (void)configureExpressSetupProvisioningContextWithCompletion:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[COSPaymentSetupAssistantExpressController paymentSetupControllerContext];
  [(COSPaymentExpressSetupManager *)self setSetupAssistantContext:v5];

  v6 = [(COSPaymentExpressSetupManager *)self setupAssistantContext];
  [v6 setDelegate:self];

  v7 = [(COSPaymentExpressSetupManager *)self setupAssistantContext];
  [v7 setPeerPaymentDelegate:self];

  id v8 = objc_alloc((Class)PKPaymentSetupAssistantExpressController);
  v9 = [(COSPaymentExpressSetupManager *)self setupAssistantContext];
  id v10 = [v8 initWithSetupAssistantContext:v9];
  [(COSPaymentExpressSetupManager *)self setExpressController:v10];

  objc_initWeak(&location, self);
  v11 = [(COSPaymentExpressSetupManager *)self expressController];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000C6E64;
  v13[3] = &unk_1002466D8;
  objc_copyWeak(&v15, &location);
  id v12 = v4;
  id v14 = v12;
  [v11 expressSetupProvisioningContext:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (id)expressWalletPasses
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_100015DCC;
  v11 = sub_100015D64;
  id v12 = 0;
  dispatch_queue_t v3 = [(COSPaymentExpressSetupManager *)self expressPassesQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000C724C;
  v6[3] = &unk_100246700;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)passSnapshotForCredential:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(COSPaymentExpressSetupManager *)self provisioningContext];
  v6 = [v5 passSnapshotForCredential:v4];

  return v6;
}

- (void)expressSetupAssistantViewControllerWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(COSPaymentExpressSetupManager *)self expressController];
  objc_super v5 = [(COSPaymentExpressSetupManager *)self provisioningContext];
  [v6 expressSetupFlowForSetupProvisioningContext:v5 withCompletion:v4];
}

- (CGSize)setupAssistantCredentialCardArtSize
{
  double v2 = 36.0;
  double v3 = 36.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setupAssistantCredentialUpdatedCardArt:(id)a3
{
  id v7 = a3;
  id v4 = [(COSPaymentExpressSetupManager *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(COSPaymentExpressSetupManager *)self delegate];
    [v6 paymentExpressSetupManager:self didUpdateCardArtForSetupAssistantCredential:v7];
  }
}

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
  id v7 = a3;
  id v4 = [(COSPaymentExpressSetupManager *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(COSPaymentExpressSetupManager *)self delegate];
    [v6 paymentExpressSetupManager:self viewControllerDidTerminateSetupFlow:v7];
  }
}

- (void)peerPaymentAddAssociatedAccountViewController:(id)a3 didFinishWithSuccess:(BOOL)a4 updatedPeerPaymentAccount:(id)a5
{
  BOOL v6 = a4;
  id v12 = a3;
  id v8 = a5;
  uint64_t v9 = [(COSPaymentExpressSetupManager *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    v11 = [(COSPaymentExpressSetupManager *)self delegate];
    [v11 paymentExpressSetupManager:self peerPaymentAddAssociatedAccountViewController:v12 didFinishWithSuccess:v6 updatedPeerPaymentAccount:v8];
  }
}

- (void)peerPaymentAddAssociatedAccountViewControllerDidSkipSetup:(id)a3
{
  id v7 = a3;
  id v4 = [(COSPaymentExpressSetupManager *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    BOOL v6 = [(COSPaymentExpressSetupManager *)self delegate];
    [v6 paymentExpressSetupManager:self peerPaymentAddAssociatedAccountViewControllerDidSkipSetup:v7];
  }
}

- (COSPaymentExpressSetupManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (COSPaymentExpressSetupManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKPaymentSetupAssistantProvisioningContext)provisioningContext
{
  return (PKPaymentSetupAssistantProvisioningContext *)objc_getProperty(self, a2, 16, 1);
}

- (void)setProvisioningContext:(id)a3
{
}

- (PKPaymentSetupAssistantExpressController)expressController
{
  return (PKPaymentSetupAssistantExpressController *)objc_getProperty(self, a2, 24, 1);
}

- (void)setExpressController:(id)a3
{
}

- (PKBridgeSetupAssistantContext)setupAssistantContext
{
  return (PKBridgeSetupAssistantContext *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSetupAssistantContext:(id)a3
{
}

- (OS_dispatch_queue)expressPassesQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setExpressPassesQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expressPassesQueue, 0);
  objc_storeStrong((id *)&self->_setupAssistantContext, 0);
  objc_storeStrong((id *)&self->_expressController, 0);
  objc_storeStrong((id *)&self->_provisioningContext, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end