@interface FMDPairingCheckCommandAction
- (BOOL)shouldCancelAction:(id)a3;
- (BOOL)shouldWaitForAction:(id)a3;
- (FMDFMIPServiceProvider)provider;
- (FMDPairingCheckCommandAction)initWithProvider:(id)a3 pairingCheckRequestInfo:(id)a4;
- (FMDPairingCheckCommandRequest)request;
- (FMDPairingCheckCommandRequestInfo)pairingCheckRequestInfo;
- (id)actionType;
- (id)onCompletionHandler;
- (void)performOnActionCompletion:(id)a3;
- (void)runWithCompletion:(id)a3;
- (void)setOnCompletionHandler:(id)a3;
- (void)setPairingCheckRequestInfo:(id)a3;
- (void)setProvider:(id)a3;
- (void)setRequest:(id)a3;
- (void)willCancelAction;
@end

@implementation FMDPairingCheckCommandAction

- (FMDPairingCheckCommandAction)initWithProvider:(id)a3 pairingCheckRequestInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FMDPairingCheckCommandAction;
  v8 = [(FMDPairingCheckCommandAction *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_provider, v6);
    objc_storeStrong((id *)&v9->_pairingCheckRequestInfo, a4);
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
  return @"FMDPairingCheckCommandAction";
}

- (void)runWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = sub_100059878();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(FMDPairingCheckCommandAction *)self pairingCheckRequestInfo];
    id v7 = [v6 pairingCheckToken];
    *(_DWORD *)buf = 138412546;
    v22 = self;
    __int16 v23 = 2112;
    v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#Action FMDPairingCheckCommandAction %@ started for %@", buf, 0x16u);
  }
  v8 = [(FMDPairingCheckCommandAction *)self provider];
  v9 = [FMDPairingCheckCommandRequest alloc];
  v10 = [v8 account];
  objc_super v11 = [(FMDPairingCheckCommandAction *)self pairingCheckRequestInfo];
  v12 = [(FMDPairingCheckCommandRequest *)v9 initWithAccount:v10 pairingCheckRequestInfo:v11];

  objc_initWeak((id *)buf, self);
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  v17 = sub_10009E080;
  v18 = &unk_1002D9EE0;
  objc_copyWeak(&v20, (id *)buf);
  id v13 = v4;
  id v19 = v13;
  [(FMDRequest *)v12 setCompletionHandler:&v15];
  -[FMDPairingCheckCommandAction setRequest:](self, "setRequest:", v12, v15, v16, v17, v18);
  v14 = [v8 serverInteractionController];
  [v14 enqueueRequest:v12];

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
}

- (void)willCancelAction
{
  id v5 = [(FMDPairingCheckCommandAction *)self provider];
  v3 = [v5 serverInteractionController];
  id v4 = [(FMDPairingCheckCommandAction *)self request];
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
  id v5 = [v4 pairingCheckRequestInfo];
  id v6 = [v5 pairingCheckToken];
  id v7 = [(FMDPairingCheckCommandAction *)self pairingCheckRequestInfo];
  v8 = [v7 pairingCheckToken];
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

- (FMDPairingCheckCommandRequestInfo)pairingCheckRequestInfo
{
  return self->_pairingCheckRequestInfo;
}

- (void)setPairingCheckRequestInfo:(id)a3
{
}

- (id)onCompletionHandler
{
  return self->_onCompletionHandler;
}

- (void)setOnCompletionHandler:(id)a3
{
}

- (FMDPairingCheckCommandRequest)request
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
  objc_storeStrong((id *)&self->_pairingCheckRequestInfo, 0);

  objc_destroyWeak((id *)&self->_provider);
}

@end