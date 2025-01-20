@interface NSSConnectionHandler
+ (id)serverProtocol;
- (BOOL)hasNanoSystemSettingsEntitlementKey:(id)a3;
- (NSSConnectionHandler)initWithConnection:(id)a3 delegate:(id)a4;
- (NSSConnectionHandlerDelegate)delegate;
- (NSXPCConnection)connection;
- (void)askRemoteDeviceToPasscodeLockWithCompletionHandler:(id)a3;
- (void)enableAirplaneMode:(BOOL)a3 completionHandler:(id)a4;
- (void)getUsageData:(id)a3;
- (void)notifyRemoteDeviceOfUsageAfterSetup:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation NSSConnectionHandler

+ (id)serverProtocol
{
}

- (NSSConnectionHandler)initWithConnection:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)NSSConnectionHandler;
  v9 = [(NSSConnectionHandler *)&v19 init];
  v10 = v9;
  if (v9)
  {
    p_connection = (id *)&v9->_connection;
    objc_storeStrong((id *)&v9->_connection, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100017638;
    block[3] = &unk_100034AE0;
    v12 = v10;
    v18 = v12;
    if (qword_10003E788 != -1) {
      dispatch_once(&qword_10003E788, block);
    }
    [*p_connection setExportedInterface:qword_10003E790];
    [*p_connection setExportedObject:v12];
    objc_initWeak(&location, v12);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000176AC;
    v14[3] = &unk_100034E70;
    objc_copyWeak(&v15, &location);
    [*p_connection setInvalidationHandler:v14];
    [*p_connection setInterruptionHandler:0];
    [*p_connection resume];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v10;
}

- (BOOL)hasNanoSystemSettingsEntitlementKey:(id)a3
{
  id v4 = a3;
  v5 = [(NSSConnectionHandler *)self connection];
  v6 = [v5 valueForEntitlement:off_10003E440];

  if (v6
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v6 containsObject:v4] & 1) != 0)
  {
    BOOL v7 = 1;
  }
  else
  {
    id v8 = NSSLogForType();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      connection = self->_connection;
      int v11 = 138412802;
      v12 = connection;
      __int16 v13 = 2112;
      v14 = off_10003E440;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Entitlement check for connection (%@) failed; Expecting: (%@/%@)",
        (uint8_t *)&v11,
        0x20u);
    }

    BOOL v7 = 0;
  }

  return v7;
}

- (void)enableAirplaneMode:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  v9 = (void (**)(id, void *))a4;
  v6 = [(NSSConnectionHandler *)self connection];
  BOOL v7 = [v6 valueForEntitlement:@"com.apple.SystemConfiguration.SCPreferences-write-access"];

  if (!v7) {
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (([v7 isEqualToString:@"com.apple.radios.plist"] & 1) == 0) {
        goto LABEL_11;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || ![v7 containsObject:@"com.apple.radios.plist"])
      {
        goto LABEL_11;
      }
    }
LABEL_10:
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained enableAirplaneMode:v4 completionHandler:v9];
    goto LABEL_13;
  }
  if ([v7 BOOLValue]) {
    goto LABEL_10;
  }
LABEL_11:
  if (!v9) {
    goto LABEL_14;
  }
  WeakRetained = +[NSError errorWithDomain:@"NSSErrorDomain" code:1 userInfo:0];
  v9[2](v9, WeakRetained);
LABEL_13:

LABEL_14:
}

- (void)getUsageData:(id)a3
{
  BOOL v4 = off_10003E448;
  v5 = (void (**)(id, void))a3;
  if ([(NSSConnectionHandler *)self hasNanoSystemSettingsEntitlementKey:v4])
  {
    id v6 = [(NSSConnectionHandler *)self delegate];
    [v6 getUsageData:v5];
  }
  else
  {
    id v6 = +[NSError errorWithDomain:@"NSSErrorDomain" code:1 userInfo:0];
    v5[2](v5, 0);
  }
}

- (void)askRemoteDeviceToPasscodeLockWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(NSSConnectionHandler *)self delegate];
  [v5 askRemoteDeviceToPasscodeLockWithCompletionHandler:v4];
}

- (void)notifyRemoteDeviceOfUsageAfterSetup:(id)a3
{
  id v4 = a3;
  id v5 = [(NSSConnectionHandler *)self delegate];
  [v5 notifyRemoteDeviceOfUsageAfterSetup:v4];
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (NSSConnectionHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NSSConnectionHandlerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end