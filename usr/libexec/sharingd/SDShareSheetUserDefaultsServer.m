@interface SDShareSheetUserDefaultsServer
- (BOOL)shouldAcceptNewConnection:(id)a3;
- (id)exportedInterface;
- (id)machServiceName;
- (id)remoteObjectInterface;
- (void)activate;
- (void)invalidate;
- (void)requestFavoritesForActivityCategory:(int64_t)a3 completionHandler:(id)a4;
@end

@implementation SDShareSheetUserDefaultsServer

- (void)activate
{
  v2.receiver = self;
  v2.super_class = (Class)SDShareSheetUserDefaultsServer;
  [(SDXPCDaemon *)&v2 _activate];
}

- (void)invalidate
{
  v2.receiver = self;
  v2.super_class = (Class)SDShareSheetUserDefaultsServer;
  [(SDXPCDaemon *)&v2 _invalidate];
}

- (id)machServiceName
{
  return @"com.apple.sharing.sharesheetuserdefaults";
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  id v3 = a3;
  v4 = [v3 valueForEntitlement:@"com.apple.sharesheet.userdefaults"];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v4 BOOLValue])
  {
    BOOL v5 = 1;
  }
  else
  {
    v6 = share_sheet_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100030E78(v3, v6);
    }

    BOOL v5 = 0;
  }

  return v5;
}

- (id)exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL____UIActivityUserDefaultsInterface];
}

- (id)remoteObjectInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL____UIActivityUserDefaultsInterface];
}

- (void)requestFavoritesForActivityCategory:(int64_t)a3 completionHandler:(id)a4
{
  BOOL v5 = (void (**)(id, void *))a4;
  id v6 = objc_alloc((Class)_UIActivityUserDefaults);
  v7 = +[NSUserDefaults standardUserDefaults];
  v8 = +[UIActivity _stringFromActivityCategory:a3];
  id v10 = [v6 initWithUnderlyingUserDefaults:v7 activityDefaultsKey:v8];

  v9 = [v10 activityIdentifiersInUserOrder];
  v5[2](v5, v9);
}

@end