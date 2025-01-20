@interface FMDAccessoryInfoAction
- (BOOL)shouldCancelAction:(id)a3;
- (BOOL)shouldWaitForAction:(id)a3;
- (FMDAccessoryInfoAction)initWithAccount:(id)a3 registry:(id)a4 accessoryTypes:(id)a5 serverInteractionController:(id)a6;
- (FMDAccessoryInfoRequest)request;
- (FMDAccount)account;
- (FMDExtConfigurationRegistry)registry;
- (FMDServerInteractionController)serverInteractionController;
- (NSArray)accessoryTypes;
- (id)actionType;
- (void)runWithCompletion:(id)a3;
- (void)setAccessoryTypes:(id)a3;
- (void)setAccount:(id)a3;
- (void)setRegistry:(id)a3;
- (void)setRequest:(id)a3;
- (void)setServerInteractionController:(id)a3;
- (void)willCancelAction;
@end

@implementation FMDAccessoryInfoAction

- (FMDAccessoryInfoAction)initWithAccount:(id)a3 registry:(id)a4 accessoryTypes:(id)a5 serverInteractionController:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)FMDAccessoryInfoAction;
  v14 = [(FMDAccessoryInfoAction *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_registry, v11);
    objc_storeWeak((id *)&v15->_account, v10);
    objc_storeWeak((id *)&v15->_serverInteractionController, v13);
    objc_storeStrong((id *)&v15->_accessoryTypes, a5);
  }

  return v15;
}

- (id)actionType
{
  return @"FMDAccessoryInfoAction";
}

- (void)runWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = sub_100059878();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(FMDAccessoryInfoAction *)self accessoryTypes];
    *(_DWORD *)buf = 138412290;
    v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#Action accessory info for %@ started", buf, 0xCu);
  }
  v7 = [FMDAccessoryInfoRequest alloc];
  v8 = [(FMDAccessoryInfoAction *)self account];
  v9 = [(FMDAccessoryInfoAction *)self registry];
  id v10 = [(FMDAccessoryInfoAction *)self accessoryTypes];
  id v11 = [(FMDAccessoryInfoRequest *)v7 initWithAccount:v8 registry:v9 accessoryTypes:v10];

  objc_initWeak((id *)buf, self);
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_10006F22C;
  objc_super v17 = &unk_1002D9EE0;
  objc_copyWeak(&v19, (id *)buf);
  id v12 = v4;
  id v18 = v12;
  [(FMDRequest *)v11 setCompletionHandler:&v14];
  -[FMDAccessoryInfoAction setRequest:](self, "setRequest:", v11, v14, v15, v16, v17);
  id v13 = [(FMDAccessoryInfoAction *)self serverInteractionController];
  [v13 enqueueRequest:v11];

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

- (void)willCancelAction
{
  id v4 = [(FMDAccessoryInfoAction *)self serverInteractionController];
  v3 = [(FMDAccessoryInfoAction *)self request];
  [v4 cancelRequest:v3];
}

- (BOOL)shouldWaitForAction:(id)a3
{
  return 0;
}

- (BOOL)shouldCancelAction:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    id v6 = v4;
    v7 = [(FMDAccessoryInfoAction *)self accessoryTypes];
    v8 = +[NSMutableSet setWithArray:v7];

    v9 = [v6 accessoryTypes];

    [v8 addObjectsFromArray:v9];
    id v10 = [v8 allObjects];
    [(FMDAccessoryInfoAction *)self setAccessoryTypes:v10];
  }
  return isKindOfClass & 1;
}

- (FMDExtConfigurationRegistry)registry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_registry);

  return (FMDExtConfigurationRegistry *)WeakRetained;
}

- (void)setRegistry:(id)a3
{
}

- (FMDServerInteractionController)serverInteractionController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serverInteractionController);

  return (FMDServerInteractionController *)WeakRetained;
}

- (void)setServerInteractionController:(id)a3
{
}

- (FMDAccessoryInfoRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (FMDAccount)account
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_account);

  return (FMDAccount *)WeakRetained;
}

- (void)setAccount:(id)a3
{
}

- (NSArray)accessoryTypes
{
  return self->_accessoryTypes;
}

- (void)setAccessoryTypes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryTypes, 0);
  objc_destroyWeak((id *)&self->_account);
  objc_storeStrong((id *)&self->_request, 0);
  objc_destroyWeak((id *)&self->_serverInteractionController);

  objc_destroyWeak((id *)&self->_registry);
}

@end