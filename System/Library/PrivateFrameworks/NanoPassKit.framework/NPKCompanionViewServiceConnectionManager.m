@interface NPKCompanionViewServiceConnectionManager
- (NPDCompanionRemotePaymentPassActionsServiceSession)remotePassActionsServiceSession;
- (NPKCompanionViewServiceConnectionManager)init;
- (void)remotePassActionServiceSession:(id)a3 handleCompanionItemSelectionRequestDidFinishWithRenewalAmount:(id)a4 serviceProviderData:(id)a5 forRequestIdentifier:(id)a6;
- (void)remotePassActionServiceSession:(id)a3 handleCompanionSelectItemRequestDidCancelForRequestIdentifier:(id)a4;
- (void)remotePassActionServiceSession:(id)a3 handleCompanionValueEntryRequestDidCancelForRequestIdentifier:(id)a4;
- (void)remotePassActionServiceSession:(id)a3 handleCompanionValueEntryRequestDidFinishWithCurrencyAmount:(id)a4 forRequestIdentifier:(id)a5;
- (void)setRemotePassActionsServiceSession:(id)a3;
- (void)viewServiceConnectionServerService:(id)a3 didRequestPresentRemotePassItemSelectionViewControllerForRequest:(id)a4 contact:(id)a5 completion:(id)a6;
- (void)viewServiceConnectionServerService:(id)a3 didRequestPresentRemotePassValueEntryViewControllerForRequest:(id)a4 contact:(id)a5 completion:(id)a6;
@end

@implementation NPKCompanionViewServiceConnectionManager

- (NPKCompanionViewServiceConnectionManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)NPKCompanionViewServiceConnectionManager;
  v2 = [(NPKCompanionViewServiceConnectionManager *)&v6 init];
  if (v2)
  {
    v3 = (NPKCompanionViewServiceConnectionServerService *)objc_alloc_init((Class)NPKCompanionViewServiceConnectionServerService);
    connectionService = v2->_connectionService;
    v2->_connectionService = v3;

    [(NPKCompanionViewServiceConnectionServerService *)v2->_connectionService setDelegate:v2];
  }
  return v2;
}

- (NPDCompanionRemotePaymentPassActionsServiceSession)remotePassActionsServiceSession
{
  remotePassActionsServiceSession = self->_remotePassActionsServiceSession;
  if (!remotePassActionsServiceSession)
  {
    v4 = objc_alloc_init(NPDCompanionRemotePaymentPassActionsServiceSession);
    v5 = self->_remotePassActionsServiceSession;
    self->_remotePassActionsServiceSession = v4;

    [(NPDCompanionRemotePaymentPassActionsServiceSession *)self->_remotePassActionsServiceSession setDelegate:self];
    remotePassActionsServiceSession = self->_remotePassActionsServiceSession;
  }
  return remotePassActionsServiceSession;
}

- (void)viewServiceConnectionServerService:(id)a3 didRequestPresentRemotePassValueEntryViewControllerForRequest:(id)a4 contact:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = [(NPKCompanionViewServiceConnectionManager *)self remotePassActionsServiceSession];
  [v12 presentRemotePassValueEntryViewControllerForRequest:v11 contact:v10 completion:v9];
}

- (void)viewServiceConnectionServerService:(id)a3 didRequestPresentRemotePassItemSelectionViewControllerForRequest:(id)a4 contact:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = [(NPKCompanionViewServiceConnectionManager *)self remotePassActionsServiceSession];
  [v12 presentRemotePassSelectItemViewControllerForRequest:v11 contact:v10 completion:v9];
}

- (void)remotePassActionServiceSession:(id)a3 handleCompanionValueEntryRequestDidFinishWithCurrencyAmount:(id)a4 forRequestIdentifier:(id)a5
{
}

- (void)remotePassActionServiceSession:(id)a3 handleCompanionValueEntryRequestDidCancelForRequestIdentifier:(id)a4
{
}

- (void)remotePassActionServiceSession:(id)a3 handleCompanionItemSelectionRequestDidFinishWithRenewalAmount:(id)a4 serviceProviderData:(id)a5 forRequestIdentifier:(id)a6
{
}

- (void)remotePassActionServiceSession:(id)a3 handleCompanionSelectItemRequestDidCancelForRequestIdentifier:(id)a4
{
}

- (void)setRemotePassActionsServiceSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remotePassActionsServiceSession, 0);
  objc_storeStrong((id *)&self->_connectionService, 0);
}

@end