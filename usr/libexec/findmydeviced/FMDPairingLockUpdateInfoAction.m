@interface FMDPairingLockUpdateInfoAction
- (BOOL)shouldCancelAction:(id)a3;
- (BOOL)shouldWaitForAction:(id)a3;
- (FMDFMIPServiceProvider)provider;
- (FMDPairingLockUpdateInfoAction)initWithProvider:(id)a3 updateRequestInfo:(id)a4;
- (FMDPairingLockUpdateInfoRequest)request;
- (FMDPairingLockUpdateRequestInfo)updateRequestInfo;
- (id)actionType;
- (id)onCompletionHandler;
- (void)performOnActionCompletion:(id)a3;
- (void)runWithCompletion:(id)a3;
- (void)setOnCompletionHandler:(id)a3;
- (void)setProvider:(id)a3;
- (void)setRequest:(id)a3;
- (void)setUpdateRequestInfo:(id)a3;
- (void)willCancelAction;
@end

@implementation FMDPairingLockUpdateInfoAction

- (FMDPairingLockUpdateInfoAction)initWithProvider:(id)a3 updateRequestInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FMDPairingLockUpdateInfoAction;
  v8 = [(FMDPairingLockUpdateInfoAction *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_provider, v6);
    objc_storeStrong((id *)&v9->_updateRequestInfo, a4);
  }

  return v9;
}

- (void)performOnActionCompletion:(id)a3
{
  self->_onCompletionHandler = objc_retainBlock(a3);

  _objc_release_x1();
}

- (id)actionType
{
  return @"FMDPairingLockUpdateInfoAction";
}

- (void)runWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = sub_100059878();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(FMDPairingLockUpdateInfoAction *)self updateRequestInfo];
    id v7 = [v6 pairingCheckToken];
    *(_DWORD *)buf = 138412546;
    v21 = self;
    __int16 v22 = 2112;
    v23 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#Action FMDPairingLockUpdateInfoAction %@ started for %@", buf, 0x16u);
  }
  v8 = [(FMDPairingLockUpdateInfoAction *)self provider];
  v9 = [FMDPairingLockUpdateInfoRequest alloc];
  v10 = [v8 account];
  objc_super v11 = [(FMDPairingLockUpdateInfoAction *)self updateRequestInfo];
  v12 = [(FMDPairingLockUpdateInfoRequest *)v9 initWithAccount:v10 updateRequestInfo:v11];

  objc_initWeak((id *)buf, self);
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_100059178;
  v17 = &unk_1002D9EE0;
  objc_copyWeak(&v19, (id *)buf);
  id v13 = v4;
  id v18 = v13;
  [(FMDRequest *)v12 setCompletionHandler:&v14];
  -[FMDPairingLockUpdateInfoAction setRequest:](self, "setRequest:", v12, v14, v15, v16, v17);
  [v8 enqueueRequest:v12];

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

- (void)willCancelAction
{
  id v5 = [(FMDPairingLockUpdateInfoAction *)self provider];
  v3 = [v5 serverInteractionController];
  id v4 = [(FMDPairingLockUpdateInfoAction *)self request];
  [v3 cancelRequest:v4];
}

- (BOOL)shouldWaitForAction:(id)a3
{
  return 0;
}

- (BOOL)shouldCancelAction:(id)a3
{
  return 0;
}

- (FMDFMIPServiceProvider)provider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);

  return (FMDFMIPServiceProvider *)WeakRetained;
}

- (void)setProvider:(id)a3
{
}

- (FMDPairingLockUpdateRequestInfo)updateRequestInfo
{
  return self->_updateRequestInfo;
}

- (void)setUpdateRequestInfo:(id)a3
{
}

- (id)onCompletionHandler
{
  return self->_onCompletionHandler;
}

- (void)setOnCompletionHandler:(id)a3
{
}

- (FMDPairingLockUpdateInfoRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong(&self->_onCompletionHandler, 0);
  objc_storeStrong((id *)&self->_updateRequestInfo, 0);

  objc_destroyWeak((id *)&self->_provider);
}

@end