@interface ServiceDelegate
- (BOOL)isConnectionEntitled:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  int v6 = TULockdownModeEnabled();
  unsigned int v7 = ![(ServiceDelegate *)self isConnectionEntitled:v5] | v6;
  v8 = FTDefaultLog();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10003B968((uint64_t)v5, v6, v9);
    }

    [v5 invalidate];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Accepting the connection since it is entitled %@", (uint8_t *)&v17, 0xCu);
    }

    v10 = +[TUMomentsControllerXPCClient momentsControllerClientXPCInterface];
    [v5 setRemoteObjectInterface:v10];

    v11 = +[TUMomentsControllerXPCClient momentsControllerServerXPCInterface];
    [v5 setExportedInterface:v11];

    id v12 = objc_alloc_init((Class)TUFeatureFlags);
    if ([v12 videoMessagingEnabled])
    {
      v13 = objc_alloc_init(FTMomentsController);
      [(FTMomentsController *)v13 setup];
    }
    else
    {
      v13 = objc_alloc_init(FTLivePhotoController);
    }
    [v5 setExportedObject:v13];
    v14 = [(FTMomentsController *)v13 queue];
    [v5 _setQueue:v14];

    v15 = [v5 remoteObjectProxy];
    [(FTMomentsController *)v13 setClientObject:v15];

    [v5 resume];
  }

  return v7 ^ 1;
}

- (BOOL)isConnectionEntitled:(id)a3
{
  id v3 = a3;
  v4 = [v3 valueForEntitlement:@"com.apple.FTLivePhotoService"];
  if (!v4)
  {
LABEL_7:
    unsigned __int8 v6 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    unsigned int v7 = FTDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      v10 = [v3 processName];
      int v11 = 138413058;
      CFStringRef v12 = @"com.apple.FTLivePhotoService";
      __int16 v13 = 2112;
      uint64_t v14 = v9;
      __int16 v15 = 2112;
      v16 = v4;
      __int16 v17 = 2112;
      id v18 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Entitlement for key '%@' is non-nil but is of class %@ rather than an NSArray (%@), so assuming process %@ has no entitlements", (uint8_t *)&v11, 0x2Au);
    }
    goto LABEL_7;
  }
  id v5 = +[NSSet setWithArray:v4];
  unsigned __int8 v6 = [v5 containsObject:@"modify-moments"];

LABEL_8:
  return v6;
}

@end