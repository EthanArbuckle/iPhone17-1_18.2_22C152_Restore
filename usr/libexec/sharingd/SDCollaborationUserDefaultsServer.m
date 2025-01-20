@interface SDCollaborationUserDefaultsServer
- (BOOL)shouldAcceptNewConnection:(id)a3;
- (id)exportedInterface;
- (id)machServiceName;
- (id)remoteObjectInterface;
- (void)connectionEstablished:(id)a3;
- (void)connectionInvalidated:(id)a3;
- (void)requestCollaborativeModeForContentIdentifier:(id)a3 completionHandler:(id)a4;
- (void)saveCollaborativeMode:(id)a3 forContentIdentifier:(id)a4;
@end

@implementation SDCollaborationUserDefaultsServer

- (id)machServiceName
{
  return SFCollaborationUserDefaultsManagerServiceName;
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  id v3 = a3;
  v4 = [v3 valueForEntitlement:@"com.apple.collaboration.userdefaults"];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v4 BOOLValue])
  {
    v5 = share_sheet_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "shouldAcceptNewConnection for SDCollaborationUserDefaultsServer: YES", v8, 2u);
    }
    BOOL v6 = 1;
  }
  else
  {
    v5 = share_sheet_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10001A410(v3, v5);
    }
    BOOL v6 = 0;
  }

  return v6;
}

- (id)exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SFCollaborationUserDefaultsInterface];
}

- (id)remoteObjectInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SFCollaborationUserDefaultsInterface];
}

- (void)connectionEstablished:(id)a3
{
  id v3 = share_sheet_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "connectionEstablished for SDCollaborationUserDefaultsServer", v4, 2u);
  }
}

- (void)connectionInvalidated:(id)a3
{
  id v3 = share_sheet_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "connectionInvalidated for SDCollaborationUserDefaultsServer", v4, 2u);
  }
}

- (void)requestCollaborativeModeForContentIdentifier:(id)a3 completionHandler:(id)a4
{
  v5 = (void (**)(id, id))a4;
  id v6 = a3;
  v7 = +[SFCollaborationUserDefaults sharedDefaults];
  id v8 = [v7 existingCollaborativeModeForContentIdentifier:v6];

  v5[2](v5, v8);
}

- (void)saveCollaborativeMode:(id)a3 forContentIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v8 = +[SFCollaborationUserDefaults sharedDefaults];
  id v7 = [v6 BOOLValue];

  [v8 setCollaborativeMode:v7 contentIdentifier:v5];
}

@end