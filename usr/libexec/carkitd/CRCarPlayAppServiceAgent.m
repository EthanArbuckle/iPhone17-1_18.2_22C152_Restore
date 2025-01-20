@interface CRCarPlayAppServiceAgent
- (BOOL)assetQueryInProgress;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CARSessionStatus)sessionStatus;
- (CRCarPlayAppServiceAgent)initWithSessionStatus:(id)a3 vehicleStore:(id)a4;
- (CRCarPlayCapabilitiesManager)carCapabilitiesManager;
- (OS_dispatch_queue)assetQueue;
- (id)_denylistPreference;
- (id)_parseDenylistContent:(id)a3 error:(id *)a4;
- (void)_queryForUpdatedAsset;
- (void)_reloadWithAsset:(id)a3;
- (void)_requestAssetCatalogDownload;
- (void)_setDenylistPreference:(id)a3;
- (void)dealloc;
- (void)requestCarCapabilitiesStatus:(id)a3 withReply:(id)a4;
- (void)requestCarCapabilitiesUpdate;
- (void)setAssetQueryInProgress:(BOOL)a3;
- (void)setAssetQueue:(id)a3;
- (void)setCarCapabilitiesManager:(id)a3;
- (void)setSessionStatus:(id)a3;
@end

@implementation CRCarPlayAppServiceAgent

- (CRCarPlayAppServiceAgent)initWithSessionStatus:(id)a3 vehicleStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CRCarPlayAppServiceAgent;
  v8 = [(CRCarPlayAppServiceAgent *)&v15 init];
  if (v8)
  {
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.carkit.AssetQuery", v9);
    [(CRCarPlayAppServiceAgent *)v8 setAssetQueue:v10];

    [(CRCarPlayAppServiceAgent *)v8 setAssetQueryInProgress:0];
    v11 = [[CRCarPlayCapabilitiesManager alloc] initWithSessionStatus:v6 vehicleStore:v7];
    carCapabilitiesManager = v8->_carCapabilitiesManager;
    v8->_carCapabilitiesManager = v11;

    if (+[CRVehicleStoreAvailability isVehicleStoreAvailable])
    {
      [(CRCarPlayAppServiceAgent *)v8 _queryForUpdatedAsset];
    }
    else
    {
      v13 = +[NSNotificationCenter defaultCenter];
      [v13 addObserver:v8 selector:"_queryForUpdatedAsset" name:CRVehicleStoreAvailabilityDidChangeNotification object:0];
    }
  }

  return v8;
}

- (void)requestCarCapabilitiesUpdate
{
  v3 = CarGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000714E4(v3);
  }

  [(CRCarPlayAppServiceAgent *)self _queryForUpdatedAsset];
  [(CRCarPlayCapabilitiesManager *)self->_carCapabilitiesManager reconcileCapabilities];
}

- (void)requestCarCapabilitiesStatus:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = CarGeneralLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100071568();
  }

  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  char v20 = 0;
  carCapabilitiesManager = self->_carCapabilitiesManager;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10001F180;
  v16[3] = &unk_1000BDA40;
  v18 = v19;
  id v10 = v7;
  id v17 = v10;
  [(CRCarPlayCapabilitiesManager *)carCapabilitiesManager plistLookupFinishedCompletionHandler:v16];
  dispatch_time_t v11 = dispatch_time(0, 1000000000);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001F240;
  v13[3] = &unk_1000BDA68;
  id v14 = v10;
  objc_super v15 = v19;
  id v12 = v10;
  dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, v13);

  _Block_object_dispose(v19, 8);
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CRCarPlayAppServiceAgent;
  [(CRCarPlayAppServiceAgent *)&v4 dealloc];
}

- (id)_denylistPreference
{
  v2 = (void *)CFPreferencesCopyAppValue(CRCarPlayAppDenylistPreferenceKey, CRPreferencesNotMigratedDomain);

  return v2;
}

- (void)_setDenylistPreference:(id)a3
{
  id v4 = a3;
  v5 = [(CRCarPlayAppServiceAgent *)self _denylistPreference];
  CFPreferencesSetAppValue(CRCarPlayAppDenylistPreferenceKey, v4, CRPreferencesNotMigratedDomain);
  if (v4 && !v5 || ([v5 isEqual:v4] & 1) == 0)
  {
    id v6 = CarGeneralLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Posting denylist changed", v8, 2u);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.carkit.app.denylist-changed", 0, 0, 1u);
  }
}

- (void)_requestAssetCatalogDownload
{
  v3 = CarGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Requesting CarPlay MobileAssets catalog download", buf, 2u);
  }

  id v4 = objc_alloc_init((Class)MADownloadOptions);
  [v4 setAllowsCellularAccess:1];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001F594;
  v5[3] = &unk_1000BDA90;
  v5[4] = self;
  +[MAAsset startCatalogDownload:@"com.apple.MobileAsset.CarExperienceAssets" options:v4 then:v5];
}

- (void)_queryForUpdatedAsset
{
  obj = self;
  objc_sync_enter(obj);
  if ([(CRCarPlayAppServiceAgent *)obj assetQueryInProgress])
  {
    objc_sync_exit(obj);
  }
  else
  {
    [(CRCarPlayAppServiceAgent *)obj setAssetQueryInProgress:1];
    objc_sync_exit(obj);

    v2 = +[NSNotificationCenter defaultCenter];
    [v2 removeObserver:obj name:CRVehicleStoreAvailabilityDidChangeNotification object:0];

    v3 = [(CRCarPlayAppServiceAgent *)obj assetQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[3] = &unk_1000BD1B0;
    block[4] = obj;
    block[2] = sub_10001F76C;
    dispatch_async(v3, block);
  }
}

- (void)_reloadWithAsset:(id)a3
{
  id v4 = [a3 getLocalFileUrl];
  v5 = [v4 URLByAppendingPathComponent:@"CarPlayAppDenylist.plist"];
  id v6 = +[NSArray arrayWithContentsOfURL:v5];
  id v16 = 0;
  id v7 = [(CRCarPlayAppServiceAgent *)self _parseDenylistContent:v6 error:&v16];
  id v8 = v16;
  if (v7)
  {
    v9 = CarGeneralLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Fetched CarPlay MobileAsset (denylist): %@", buf, 0xCu);
    }

    [(CRCarPlayAppServiceAgent *)self _setDenylistPreference:v7];
  }
  id v10 = [v4 URLByAppendingPathComponent:@"CarPlayCapabilities.plist"];
  id v15 = 0;
  id v14 = 0;
  [v10 getResourceValue:&v15 forKey:NSURLIsRegularFileKey error:&v14];
  id v11 = v15;
  id v12 = v14;

  if (!v12 && [v11 BOOLValue])
  {
    v13 = CarGeneralLogging();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Fetched CarPlay MobileAsset (carcapabilities) at %@", buf, 0xCu);
    }

    [(CRCarPlayCapabilitiesManager *)self->_carCapabilitiesManager setCarCapabilitiesURL:v10];
  }
}

- (id)_parseDenylistContent:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[NSMutableArray array];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v24;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v6 addObject:v12];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v9);
    }

    v13 = +[NSArray arrayWithArray:v6];
  }
  else
  {
    id v14 = CarGeneralLogging();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000717E0(v14, v15, v16, v17, v18, v19, v20, v21);
    }

    if (a4)
    {
      +[NSError errorWithDomain:@"com.apple.carkit.app" code:1 userInfo:0];
      v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = [v5 valueForEntitlement:@"com.apple.private.carkit.app"];
  unsigned __int8 v7 = [v6 BOOLValue];

  if (v7)
  {
    id v8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CRCarPlayAppService];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, v10, v11, objc_opt_class(), 0);
    [v8 setClasses:v12 forSelector:"requestCarCapabilitiesStatus:withReply:" argumentIndex:0 ofReply:1];

    [v5 setExportedInterface:v8];
    [v5 setExportedObject:self];
    [v5 resume];
  }
  else
  {
    v13 = CarGeneralLogging();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100071818(v5, v13);
    }
  }
  return v7;
}

- (CARSessionStatus)sessionStatus
{
  return self->_sessionStatus;
}

- (void)setSessionStatus:(id)a3
{
}

- (OS_dispatch_queue)assetQueue
{
  return self->_assetQueue;
}

- (void)setAssetQueue:(id)a3
{
}

- (BOOL)assetQueryInProgress
{
  return self->_assetQueryInProgress;
}

- (void)setAssetQueryInProgress:(BOOL)a3
{
  self->_assetQueryInProgress = a3;
}

- (CRCarPlayCapabilitiesManager)carCapabilitiesManager
{
  return self->_carCapabilitiesManager;
}

- (void)setCarCapabilitiesManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carCapabilitiesManager, 0);
  objc_storeStrong((id *)&self->_assetQueue, 0);

  objc_storeStrong((id *)&self->_sessionStatus, 0);
}

@end