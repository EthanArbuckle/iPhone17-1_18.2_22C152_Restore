@interface FMDMagSafeSetupLauncher
- (FMDExtAccessoryProtocol)setupAgent;
- (FMDMagSafeSetupLauncher)init;
- (void)_launchSetupFlow:(id)a3;
- (void)setSetupAgent:(id)a3;
@end

@implementation FMDMagSafeSetupLauncher

- (FMDMagSafeSetupLauncher)init
{
  v5.receiver = self;
  v5.super_class = (Class)FMDMagSafeSetupLauncher;
  v2 = [(FMDMagSafeSetupLauncher *)&v5 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"_launchSetupFlow:" name:@"com.apple.accessories.connection.passedMFi4Auth" object:0];
    [v3 addObserver:v2 selector:"_launchSetupFlow:" name:@"com.apple.icloud.FindMy.addMagSafeAccessory" object:0];
  }
  return v2;
}

- (void)_launchSetupFlow:(id)a3
{
  id v4 = a3;
  objc_super v5 = sub_100059878();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "got notification %@", buf, 0xCu);
  }

  v6 = +[FMDExtExtensionHelper getAccessoryProxyForId:@"com.apple.icloud.FindMyDevice.FindMyExtensionContainer.FMDMagSafeExtension" withDelegate:0];
  [(FMDMagSafeSetupLauncher *)self setSetupAgent:v6];

  v12[0] = @"receivedNotificaiton";
  v11[0] = @"context";
  v11[1] = @"notificationName";
  v7 = [v4 name];
  v12[1] = v7;
  v8 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];

  v9 = [(FMDMagSafeSetupLauncher *)self setupAgent];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100057934;
  v10[3] = &unk_1002D9768;
  v10[4] = self;
  [v9 launchSetupModuleWithInfo:v8 withCompletion:v10];
}

- (FMDExtAccessoryProtocol)setupAgent
{
  return self->_setupAgent;
}

- (void)setSetupAgent:(id)a3
{
}

- (void).cxx_destruct
{
}

@end