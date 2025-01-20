@interface FMDPairingLockRegisterAction
- (BOOL)shouldCancelAction:(id)a3;
- (BOOL)shouldWaitForAction:(id)a3;
- (FMDFMIPServiceProvider)provider;
- (FMDPairingLockRegisterAction)initWithProvider:(id)a3 registerRequestInfo:(id)a4;
- (FMDPairingLockRegisterRequest)request;
- (FMDPairingLockRegisterRequestInfo)registerRequestInfo;
- (id)actionType;
- (id)onCompletionHandler;
- (void)performOnActionCompletion:(id)a3;
- (void)runWithCompletion:(id)a3;
- (void)setOnCompletionHandler:(id)a3;
- (void)setProvider:(id)a3;
- (void)setRegisterRequestInfo:(id)a3;
- (void)setRequest:(id)a3;
- (void)willCancelAction;
@end

@implementation FMDPairingLockRegisterAction

- (FMDPairingLockRegisterAction)initWithProvider:(id)a3 registerRequestInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FMDPairingLockRegisterAction;
  v8 = [(FMDPairingLockRegisterAction *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_provider, v6);
    objc_storeStrong((id *)&v9->_registerRequestInfo, a4);
  }

  return v9;
}

- (void)performOnActionCompletion:(id)a3
{
  id v4 = objc_retainBlock(a3);
  id onCompletionHandler = self->_onCompletionHandler;
  self->_id onCompletionHandler = v4;

  _objc_release_x1(v4, onCompletionHandler);
}

- (id)actionType
{
  return @"FMDPairingLockRegisterAction";
}

- (void)runWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = sub_100059878();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(FMDPairingLockRegisterAction *)self registerRequestInfo];
    id v7 = [v6 serialNumber];
    *(_DWORD *)buf = 138412546;
    v21 = self;
    __int16 v22 = 2112;
    v23 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#Action FMDPairingLockRegisterAction %@ started for %@", buf, 0x16u);
  }
  v8 = [(FMDPairingLockRegisterAction *)self provider];
  v9 = [FMDPairingLockRegisterRequest alloc];
  v10 = [v8 account];
  objc_super v11 = [(FMDPairingLockRegisterAction *)self registerRequestInfo];
  v12 = [(FMDPairingLockRegisterRequest *)v9 initWithAccount:v10 registerRequestInfo:v11];

  objc_initWeak((id *)buf, self);
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_1000A6A90;
  v17 = &unk_1002D9EE0;
  objc_copyWeak(&v19, (id *)buf);
  id v13 = v4;
  id v18 = v13;
  [(FMDRequest *)v12 setCompletionHandler:&v14];
  -[FMDPairingLockRegisterAction setRequest:](self, "setRequest:", v12, v14, v15, v16, v17);
  [v8 enqueueRequest:v12];

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

- (void)willCancelAction
{
  id v5 = [(FMDPairingLockRegisterAction *)self provider];
  v3 = [v5 serverInteractionController];
  id v4 = [(FMDPairingLockRegisterAction *)self request];
  [v3 cancelRequest:v4];
}

- (BOOL)shouldWaitForAction:(id)a3
{
  return 0;
}

- (BOOL)shouldCancelAction:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_4;
  }
  id v5 = [v4 registerRequestInfo];
  id v6 = [v5 serialNumber];
  id v7 = [(FMDPairingLockRegisterAction *)self registerRequestInfo];
  v8 = [v7 serialNumber];
  unsigned __int8 v9 = [v6 isEqualToString:v8];

  if (v9) {
    BOOL v10 = 1;
  }
  else {
LABEL_4:
  }
    BOOL v10 = 0;

  return v10;
}

- (FMDFMIPServiceProvider)provider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);

  return (FMDFMIPServiceProvider *)WeakRetained;
}

- (void)setProvider:(id)a3
{
}

- (FMDPairingLockRegisterRequestInfo)registerRequestInfo
{
  return self->_registerRequestInfo;
}

- (void)setRegisterRequestInfo:(id)a3
{
}

- (id)onCompletionHandler
{
  return self->_onCompletionHandler;
}

- (void)setOnCompletionHandler:(id)a3
{
}

- (FMDPairingLockRegisterRequest)request
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
  objc_storeStrong((id *)&self->_registerRequestInfo, 0);

  objc_destroyWeak((id *)&self->_provider);
}

@end