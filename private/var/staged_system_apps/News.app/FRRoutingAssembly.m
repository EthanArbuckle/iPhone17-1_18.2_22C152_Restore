@interface FRRoutingAssembly
- (FRFeldsparContext)feldsparContext;
- (FRRoutingAssembly)initWithFeldsparContext:(id)a3 bridgedAppDelegate:(id)a4 window:(id)a5;
- (UIApplicationDelegate)bridgedAppDelegate;
- (UIWindow)window;
- (void)loadInRegistry:(id)a3;
@end

@implementation FRRoutingAssembly

- (FRRoutingAssembly)initWithFeldsparContext:(id)a3 bridgedAppDelegate:(id)a4 window:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000764FC();
  }
  v15.receiver = self;
  v15.super_class = (Class)FRRoutingAssembly;
  v12 = [(FRRoutingAssembly *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_feldsparContext, a3);
    objc_storeWeak((id *)&v13->_bridgedAppDelegate, v10);
    objc_storeStrong((id *)&v13->_window, a5);
  }

  return v13;
}

- (void)loadInRegistry:(id)a3
{
  id v4 = a3;
  v5 = [v4 callback];
  v6 = TFCallbackScopeAny();
  [v5 whenResolvingProtocol:&OBJC_PROTOCOL___FRURLRouterManagerType scope:v6 callbackBlock:&stru_1000C7AE8];

  v7 = [v4 publicContainer];
  id v8 = [v7 registerProtocol:&OBJC_PROTOCOL___FRURLRouterManagerType factory:&stru_1000C7B28];

  id v9 = [v4 privateContainer];
  id v10 = [v9 registerClass:objc_opt_class() factory:&stru_1000C7B68];

  id v11 = [v4 privateContainer];
  id v12 = [v11 registerClass:objc_opt_class() factory:&stru_1000C7BA8];

  v13 = [v4 publicContainer];
  id v14 = [v13 registerClass:objc_opt_class() factory:&stru_1000C7BE8];

  objc_super v15 = [v4 publicContainer];
  id v16 = [v15 registerProtocol:&OBJC_PROTOCOL___FRURLAnalyticsReferralFactory factory:&stru_1000C7C28];

  v17 = [v4 privateContainer];
  id v18 = [v17 registerClass:objc_opt_class() factory:&stru_1000C7C68];

  v19 = [v4 privateContainer];
  v20 = [v19 registerClass:objc_opt_class() factory:&stru_1000C7CA8];
  id v21 = [v20 withConfiguration:&stru_1000C7CE8];

  v22 = [v4 publicContainer];
  v23 = [v22 registerProtocol:&OBJC_PROTOCOL___TSExplicitContentRestrictionAlertPresenter factory:&stru_1000C7D28];
  id v24 = [v23 inScope:2];

  v25 = [(FRRoutingAssembly *)self bridgedAppDelegate];
  v26 = [v4 publicContainer];
  uint64_t v27 = objc_opt_class();
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10000680C;
  v37[3] = &unk_1000C7D50;
  id v38 = v25;
  id v28 = v25;
  id v29 = [v26 registerClass:v27 factory:v37];

  v30 = [v4 publicContainer];
  id v31 = [v30 registerProtocol:&OBJC_PROTOCOL___TSNewsActivityIntentSerializer factory:&stru_1000C7D70];

  v32 = [v4 publicContainer];
  id v33 = [v32 registerProtocol:&OBJC_PROTOCOL___TSNewsActivityIntentDeserializer factory:&stru_1000C7D90];

  v34 = [v4 publicContainer];

  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1000400F0;
  v36[3] = &unk_1000C6458;
  v36[4] = self;
  id v35 = [v34 registerProtocol:&OBJC_PROTOCOL___TSWelcomeDataManagerType factory:v36];
}

- (UIApplicationDelegate)bridgedAppDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bridgedAppDelegate);

  return (UIApplicationDelegate *)WeakRetained;
}

- (FRFeldsparContext)feldsparContext
{
  return self->_feldsparContext;
}

- (UIWindow)window
{
  return self->_window;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);
  objc_destroyWeak((id *)&self->_bridgedAppDelegate);

  objc_storeStrong((id *)&self->_feldsparContext, 0);
}

@end