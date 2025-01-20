@interface FMDSupportedAccessoryTypesAction
- (BOOL)shouldCancelAction:(id)a3;
- (BOOL)shouldWaitForAction:(id)a3;
- (FMDAccount)account;
- (FMDExtConfigurationRegistry)registry;
- (FMDServerInteractionController)serverInteractionController;
- (FMDSupportedAccessoryTypesAction)initWithAccount:(id)a3 registry:(id)a4 serverInteractionController:(id)a5;
- (FMDSupportedAccessoryTypesRequest)request;
- (id)actionType;
- (void)runWithCompletion:(id)a3;
- (void)setAccount:(id)a3;
- (void)setRegistry:(id)a3;
- (void)setRequest:(id)a3;
- (void)setServerInteractionController:(id)a3;
- (void)willCancelAction;
@end

@implementation FMDSupportedAccessoryTypesAction

- (FMDSupportedAccessoryTypesAction)initWithAccount:(id)a3 registry:(id)a4 serverInteractionController:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FMDSupportedAccessoryTypesAction;
  v12 = [(FMDSupportedAccessoryTypesAction *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_registry, a4);
    objc_storeStrong((id *)&v13->_account, a3);
    objc_storeStrong((id *)&v13->_serverInteractionController, a5);
  }

  return v13;
}

- (id)actionType
{
  return @"SupportedAccessoryTypesAction";
}

- (void)runWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = sub_100059878();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#Action SupportedAccessoryTypesAction started", (uint8_t *)buf, 2u);
  }

  v6 = [FMDSupportedAccessoryTypesRequest alloc];
  v7 = [(FMDSupportedAccessoryTypesAction *)self account];
  v8 = [(FMDSupportedAccessoryTypesAction *)self registry];
  id v9 = [(FMDSupportedAccessoryTypesRequest *)v6 initWithAccount:v7 registry:v8];

  objc_initWeak(buf, self);
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  v14 = sub_100037058;
  objc_super v15 = &unk_1002D9EE0;
  objc_copyWeak(&v17, buf);
  id v10 = v4;
  id v16 = v10;
  [(FMDRequest *)v9 setCompletionHandler:&v12];
  -[FMDSupportedAccessoryTypesAction setRequest:](self, "setRequest:", v9, v12, v13, v14, v15);
  id v11 = [(FMDSupportedAccessoryTypesAction *)self serverInteractionController];
  [v11 enqueueRequest:v9];

  objc_destroyWeak(&v17);
  objc_destroyWeak(buf);
}

- (void)willCancelAction
{
  id v4 = [(FMDSupportedAccessoryTypesAction *)self serverInteractionController];
  v3 = [(FMDSupportedAccessoryTypesAction *)self request];
  [v4 cancelRequest:v3];
}

- (BOOL)shouldWaitForAction:(id)a3
{
  return 0;
}

- (BOOL)shouldCancelAction:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (FMDExtConfigurationRegistry)registry
{
  return self->_registry;
}

- (void)setRegistry:(id)a3
{
}

- (FMDServerInteractionController)serverInteractionController
{
  return self->_serverInteractionController;
}

- (void)setServerInteractionController:(id)a3
{
}

- (FMDSupportedAccessoryTypesRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (FMDAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_serverInteractionController, 0);

  objc_storeStrong((id *)&self->_registry, 0);
}

@end