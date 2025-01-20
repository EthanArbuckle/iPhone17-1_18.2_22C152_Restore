@interface CDRequesterStoreAuthenticationSession
- (id)_idsMessageRecipientUsernames;
- (id)_responseForGetNotifInfoRequest:(id)a3;
- (void)_configureRapportClient:(id)a3;
- (void)_prepareForActivationWithCompletionHandler:(id)a3;
@end

@implementation CDRequesterStoreAuthenticationSession

- (void)_prepareForActivationWithCompletionHandler:(id)a3
{
  v11 = (void (**)(id, void))a3;
  v4 = [(CDRequesterSession *)self request];
  v5 = [v4 authenticationRequest];
  authenticationRequest = self->_authenticationRequest;
  self->_authenticationRequest = v5;

  if (!self->_authenticationRequest) {
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
  v6[2] = sub_10000F200;
  v6[3] = &unk_1000347B0;
  v6[4] = self;
  id v4 = a3;
  [v4 registerRequestID:@"com.apple.CompanionAuthentication.GetAuthInfo" options:0 handler:v6];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000F51C;
  v5[3] = &unk_1000347B0;
  v5[4] = self;
  [v4 registerRequestID:@"com.apple.CompanionAuthentication.DidFinishAuth" options:0 handler:v5];
}

- (id)_responseForGetNotifInfoRequest:(id)a3
{
  id v4 = a3;
  v5 = [v4 storeAccountToken];
  v6 = [v4 nonce];

  LOBYTE(self) = sub_10000F8F4(self, v5, v6);
  if (self)
  {
    v7 = objc_alloc_init(CDGetNotifInfoResponse);
  }
  else
  {
    v8 = cps_session_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100021D04(v8, v9, v10, v11, v12, v13, v14, v15);
    }

    v7 = 0;
  }

  return v7;
}

- (id)_idsMessageRecipientUsernames
{
  v2 = [(ACAccount *)self->_storeAccount ams_altDSID];
  if (!v2)
  {
    v3 = cps_session_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100021D3C(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeAccount, 0);

  objc_storeStrong((id *)&self->_authenticationRequest, 0);
}

@end