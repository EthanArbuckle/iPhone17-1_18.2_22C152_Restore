@interface SBSnapshotServer
+ (id)secureCodableRequestClasses;
- (SBSnapshotServer)init;
- (id)cachedSnapshotForRequest:(id)a3;
- (id)executeSnapshotRequest:(id)a3;
- (void)_posterCollectionUpdatedForRole:(id)a3 previousCollection:(id)a4 updatedCollection:(id)a5;
- (void)_setupRoleObservation;
- (void)_teardownRoleObservation;
- (void)cachedSnapshotForRequest:(id)a3 reply:(id)a4;
- (void)dealloc;
- (void)executeSnapshotRequest:(id)a3 reply:(id)a4;
@end

@implementation SBSnapshotServer

+ (id)secureCodableRequestClasses
{
  uint64_t v2 = objc_opt_class();
  return +[NSSet setWithObject:v2];
}

- (SBSnapshotServer)init
{
  RegisterForTemporaryFolder();
  if (PUIFeatureEnabled())
  {
    v29.receiver = self;
    v29.super_class = (Class)SBSnapshotServer;
    v3 = [(SBSnapshotServer *)&v29 init];
    if (v3)
    {
      v4 = [@"~/Library/Caches/com.apple.springboard.SBRendererService/" stringByExpandingTildeInPath];
      v5 = +[NSURL fileURLWithPath:v4 isDirectory:1];
      v6 = +[NSURL fileURLWithPath:@"SnapshotServerCache" isDirectory:1 relativeToURL:v5];
      v7 = [v6 absoluteURL];

      v8 = +[NSFileManager defaultManager];
      v9 = PFPosterPathFileAttributes();
      id v28 = 0;
      unsigned __int8 v10 = [v8 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:v9 error:&v28];
      id v11 = v28;

      if ((v10 & 1) == 0)
      {
        v12 = SBRSLogSnapshotting();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_100008528((uint64_t)v11, v12, v13, v14, v15, v16, v17, v18);
        }
      }
      v19 = (PUIPosterSnapshotFilesystemCache *)[objc_alloc((Class)PUIPosterSnapshotFilesystemCache) initWithURL:v7];
      cache = v3->_cache;
      v3->_cache = v19;

      id v21 = objc_alloc((Class)PUIPosterSnapshotController);
      v22 = v3->_cache;
      v23 = +[NSUUID pf_UUIDFromArbitraryString:@"PUISnapshotServer"];
      v24 = (PUIPosterSnapshotController *)[v21 initWithCache:v22 instanceIdentifier:v23];
      snapshotController = v3->_snapshotController;
      v3->_snapshotController = v24;

      [(SBSnapshotServer *)v3 _setupRoleObservation];
    }
    self = v3;
    v26 = self;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (void)dealloc
{
  [(PUIPosterSnapshotController *)self->_snapshotController invalidate];
  snapshotController = self->_snapshotController;
  self->_snapshotController = 0;

  [(PUIPosterSnapshotFilesystemCache *)self->_cache invalidate];
  cache = self->_cache;
  self->_cache = 0;

  [(SBSnapshotServer *)self _teardownRoleObservation];
  v5.receiver = self;
  v5.super_class = (Class)SBSnapshotServer;
  [(SBSnapshotServer *)&v5 dealloc];
}

- (void)executeSnapshotRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 posterSnapshotRequest];
  v9 = [v8 uniqueIdentifier];
  unsigned __int8 v10 = [v9 UUIDString];

  id v11 = SBRSLogSnapshotting();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [v8 path];
    *(_DWORD *)buf = 136446722;
    v24 = "-[SBSnapshotServer executeSnapshotRequest:reply:]";
    __int16 v25 = 2114;
    v26 = v10;
    __int16 v27 = 2114;
    id v28 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s RUNNING for uniqueIdentifier: %{public}@ path: %{public}@", buf, 0x20u);
  }
  snapshotController = self->_snapshotController;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100007464;
  v18[3] = &unk_10000C5D8;
  id v19 = v10;
  id v20 = v8;
  id v21 = v6;
  id v22 = v7;
  id v14 = v7;
  id v15 = v6;
  id v16 = v8;
  id v17 = v10;
  [(PUIPosterSnapshotController *)snapshotController executeSnapshotRequest:v16 completion:v18];
}

- (void)cachedSnapshotForRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  v8 = [v6 posterSnapshotRequest];
  v9 = SBRSLogSnapshotting();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v10 = [v8 path];
    *(_DWORD *)buf = 136446466;
    id v20 = "-[SBSnapshotServer cachedSnapshotForRequest:reply:]";
    __int16 v21 = 2114;
    id v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}s for path: %{public}@", buf, 0x16u);
  }
  cache = self->_cache;
  id v18 = 0;
  v12 = [(PUIPosterSnapshotFilesystemCache *)cache latestSnapshotBundleForRequest:v8 error:&v18];
  id v13 = v18;
  id v14 = SBRSLogSnapshotting();
  id v15 = v14;
  if (v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_1000087A0(v8, v15);
    }

    id v16 = +[PRUISSnapshotServiceResponse snapshotResponseForRequest:v6 snapshotBundle:v12];
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100008720();
    }

    id v17 = v13;
    if (!v13)
    {
      id v17 = +[NSError sbSnapshotService_errorWithCode:0];
    }
    id v16 = +[PRUISSnapshotServiceResponse errorResponseForRequest:v6 error:v17];
    if (!v13) {
  }
    }
  v7[2](v7, v16, 0);
}

- (id)cachedSnapshotForRequest:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 posterSnapshotRequest];
  cache = self->_cache;
  uint64_t v10 = 0;
  id v7 = [(PUIPosterSnapshotFilesystemCache *)cache latestSnapshotBundleForRequest:v5 error:&v10];
  if (v10) {
    +[PRUISSnapshotServiceResponse errorResponseForRequest:error:](PRUISSnapshotServiceResponse, "errorResponseForRequest:error:", v4);
  }
  else {
  v8 = +[PRUISSnapshotServiceResponse snapshotResponseForRequest:v4 snapshotBundle:v7];
  }

  return v8;
}

- (id)executeSnapshotRequest:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 posterSnapshotRequest];
  id v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  __int16 v25 = sub_100007A88;
  v26 = sub_100007A98;
  id v27 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = sub_100007A88;
  id v20 = sub_100007A98;
  id v21 = 0;
  snapshotController = self->_snapshotController;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100007AA0;
  v12[3] = &unk_10000C600;
  id v14 = &v16;
  id v15 = &v22;
  v8 = v6;
  id v13 = v8;
  [(PUIPosterSnapshotController *)snapshotController executeSnapshotRequest:v5 completion:v12];
  dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  if (v17[5])
  {
    v9 = +[PRUISSnapshotServiceResponse errorResponseForRequest:error:](PRUISSnapshotServiceResponse, "errorResponseForRequest:error:", v4);
  }
  else
  {
    uint64_t v10 = [(id)v23[5] snapshotBundle];
    v9 = +[PRUISSnapshotServiceResponse snapshotResponseForRequest:v4 snapshotBundle:v10];
  }
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v9;
}

- (void)_setupRoleObservation
{
  if (!self->_roleToObserver)
  {
    id v13 = objc_opt_new();
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    PFPosterRolesSupportedForCurrentDeviceClass();
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v3 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v3)
    {
      uint64_t v4 = *(void *)v18;
      do
      {
        objc_super v5 = 0;
        do
        {
          if (*(void *)v18 != v4) {
            objc_enumerationMutation(obj);
          }
          uint64_t v6 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v5);
          id v7 = [objc_alloc((Class)PRSWallpaperObserver) initWithExplanation:@"SBSnapshotServer"];
          id v8 = objc_alloc_init((Class)PRSWallpaperObserverConfiguration);
          objc_initWeak(&location, self);
          id v9 = [objc_alloc((Class)PRSPosterRoleCollectionObserver) initWithRole:v6 needsSandboxExtensions:1];
          [v8 setPostersCollectionRoleObserver:v9];
          v14[0] = _NSConcreteStackBlock;
          v14[1] = 3221225472;
          v14[2] = sub_100007DB0;
          v14[3] = &unk_10000C628;
          objc_copyWeak(&v15, &location);
          v14[4] = v6;
          [v9 setHandler:v14];
          [v7 activateWithConfiguration:v8];
          [v13 setObject:v7 forKeyedSubscript:v6];
          objc_destroyWeak(&v15);

          objc_destroyWeak(&location);
          objc_super v5 = (char *)v5 + 1;
        }
        while (v3 != v5);
        id v3 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v3);
    }

    uint64_t v10 = (NSDictionary *)[v13 copy];
    roleToObserver = self->_roleToObserver;
    self->_roleToObserver = v10;
  }
}

- (void)_teardownRoleObservation
{
  [(NSDictionary *)self->_roleToObserver enumerateKeysAndObjectsUsingBlock:&stru_10000C668];
  roleToObserver = self->_roleToObserver;
  self->_roleToObserver = 0;
}

- (void)_posterCollectionUpdatedForRole:(id)a3 previousCollection:(id)a4 updatedCollection:(id)a5
{
  objc_super v5 = [a5 differenceFromOrderedSet:a4];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = objc_msgSend(v5, "removals", 0, 0);
  id v7 = (char *)[v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v11;
    while (1)
    {
      if (*(void *)v11 != v9) {
        objc_enumerationMutation(v6);
      }
      if (!--v8)
      {
        id v8 = (char *)[v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (!v8) {
          break;
        }
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roleToObserver, 0);
  objc_storeStrong((id *)&self->_snapshotController, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end