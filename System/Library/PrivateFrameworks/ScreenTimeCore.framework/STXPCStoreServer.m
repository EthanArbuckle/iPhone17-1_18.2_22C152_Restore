@interface STXPCStoreServer
- (NSXPCListener)listener;
- (NSXPCStoreServer)storeServer;
- (void)resume;
- (void)setListener:(id)a3;
- (void)setStoreServer:(id)a3;
@end

@implementation STXPCStoreServer

- (void)resume
{
  if (_os_feature_enabled_impl())
  {
    v18[0] = NSXPCStoreAnonymousListenerKey;
    v3 = [(STXPCStoreServer *)self listener];
    v19[0] = v3;
    v18[1] = NSXPCStoreEntitlementNamesKey;
    CFStringRef v17 = @"com.apple.private.screen-time.persistence";
    v4 = +[NSArray arrayWithObjects:&v17 count:1];
    v19[1] = v4;
    v19[2] = &__kCFBooleanTrue;
    v18[2] = NSPersistentStoreRemoteChangeNotificationOptionKey;
    v18[3] = NSPersistentHistoryTrackingKey;
    v19[3] = &__kCFBooleanTrue;
    v5 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:4];
  }
  else
  {
    v16[0] = STPersistenceXPCStoreServiceName;
    v15[0] = NSXPCStoreServiceNameKey;
    v15[1] = NSXPCStoreEntitlementNamesKey;
    CFStringRef v14 = @"com.apple.private.screen-time.persistence";
    v3 = +[NSArray arrayWithObjects:&v14 count:1];
    v16[1] = v3;
    v16[2] = &__kCFBooleanTrue;
    v15[2] = NSXPCStoreDaemonizeKey;
    v15[3] = NSPersistentStoreRemoteChangeNotificationOptionKey;
    v15[4] = NSPersistentHistoryTrackingKey;
    v16[3] = &__kCFBooleanTrue;
    v16[4] = &__kCFBooleanTrue;
    v5 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:5];
  }

  v6 = +[STPersistenceConfiguration persistentStoreURLForConfigurationName:STPersistenceConfigurationNameLocal];
  v7 = +[STPersistenceConfiguration managedObjectModelURL];
  id v8 = objc_alloc((Class)NSXPCStoreServer);
  v9 = objc_opt_new();
  id v10 = [v8 initForStoreWithURL:v6 usingModelAtURL:v7 options:v5 policy:v9];
  [(STXPCStoreServer *)self setStoreServer:v10];

  v11 = [(STXPCStoreServer *)self storeServer];
  v12 = [(STXPCStoreServer *)self listener];
  [v12 setDelegate:v11];

  v13 = [(STXPCStoreServer *)self storeServer];
  [v13 startListening];
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (NSXPCStoreServer)storeServer
{
  return self->_storeServer;
}

- (void)setStoreServer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeServer, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end