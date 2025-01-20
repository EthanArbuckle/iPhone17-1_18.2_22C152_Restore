@interface CDRequesterStorePurchaseSession
- (BOOL)_isSandboxPurchase;
- (id)_idsMessageRecipientUsernames;
- (id)_responseForGetNotifInfoRequest:(id)a3;
- (void)_configureRapportClient:(id)a3;
- (void)_prepareForActivationWithCompletionHandler:(id)a3;
@end

@implementation CDRequesterStorePurchaseSession

- (void)_prepareForActivationWithCompletionHandler:(id)a3
{
  v11 = (void (**)(id, void))a3;
  v4 = [(CDRequesterSession *)self request];
  v5 = [v4 purchaseRequest];
  purchaseRequest = self->_purchaseRequest;
  self->_purchaseRequest = v5;

  if (!self->_purchaseRequest) {
    goto LABEL_4;
  }
  v7 = [(CDRequesterSession *)self request];
  v8 = [v7 account];
  storeAccount = self->_storeAccount;
  self->_storeAccount = v8;

  if (self->_storeAccount)
  {
    v11[2](v11, 0);
  }
  else
  {
LABEL_4:
    v10 = CPSErrorMake();
    ((void (**)(id, void *))v11)[2](v11, v10);
  }
}

- (void)_configureRapportClient:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000156EC;
  v6[3] = &unk_1000347B0;
  v6[4] = self;
  id v4 = a3;
  [v4 registerRequestID:@"com.apple.CompanionAuthentication.GetAuthInfo" options:0 handler:v6];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100015C14;
  v5[3] = &unk_1000347B0;
  v5[4] = self;
  [v4 registerRequestID:@"com.apple.CompanionAuthentication.DidFinishAuth" options:0 handler:v5];
}

- (id)_responseForGetNotifInfoRequest:(id)a3
{
  id v4 = a3;
  v5 = [v4 storeAccountToken];
  v6 = [v4 nonce];

  LOBYTE(self) = sub_100015FEC(self, v5, v6);
  if (self)
  {
    v7 = objc_alloc_init(CDGetNotifInfoResponse);
  }
  else
  {
    v8 = cps_session_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100022240(v8);
    }

    v7 = 0;
  }

  return v7;
}

- (BOOL)_isSandboxPurchase
{
  return [(ACAccount *)self->_storeAccount ams_isSandboxAccount];
}

- (id)_idsMessageRecipientUsernames
{
  v4.receiver = self;
  v4.super_class = (Class)CDRequesterStorePurchaseSession;
  v2 = [(CDRequesterSession *)&v4 _idsMessageRecipientUsernames];

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeAccount, 0);

  objc_storeStrong((id *)&self->_purchaseRequest, 0);
}

@end