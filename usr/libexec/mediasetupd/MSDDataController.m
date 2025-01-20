@interface MSDDataController
+ (id)sharedInstance;
- (BOOL)isPerformingRefresh;
- (MSDCloudManager)cloudManager;
- (MSDDataController)initWithCloudDataManager:(id)a3 homeManager:(id)a4;
- (MSDHomeManager)homeManager;
- (void)_findServicesForUser:(id)a3 homeID:(id)a4 completion:(id)a5;
- (void)_servicesForUser:(id)a3 homeID:(id)a4 publicInfo:(id)a5 currentUser:(BOOL)a6 completion:(id)a7;
- (void)addMediaService:(id)a3 usingSetupBundles:(id)a4 transaction:(id)a5 completion:(id)a6;
- (void)getAvailableServices:(id)a3 completion:(id)a4;
- (void)getCachedAvailableServices:(id)a3 homeID:(id)a4 completion:(id)a5;
- (void)getDefaultMediaService:(id)a3 completion:(id)a4;
- (void)getServiceConfigurationInfo:(id)a3 serviceID:(id)a4 completion:(id)a5;
- (void)invalidateRefreshTimestamps;
- (void)refreshDataForReason:(unint64_t)a3 completion:(id)a4;
- (void)removeMediaService:(id)a3 withUserInfo:(id)a4 completion:(id)a5;
- (void)removeMediaServices:(id)a3 withUserInfo:(id)a4 completion:(id)a5;
- (void)setIsPerformingRefresh:(BOOL)a3;
- (void)switchUserAccountInfo:(id)a3 homeID:(id)a4 homeUserID:(id)a5 completion:(id)a6;
- (void)updateDefaultMediaService:(id)a3 withUserInfo:(id)a4 completion:(id)a5;
- (void)updateProperty:(id)a3 propertyInfo:(id)a4 withUserInfo:(id)a5 completion:(id)a6;
@end

@implementation MSDDataController

- (MSDDataController)initWithCloudDataManager:(id)a3 homeManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  v10 = 0;
  if (v7 && v8)
  {
    v14.receiver = self;
    v14.super_class = (Class)MSDDataController;
    v11 = [(MSDDataController *)&v14 init];
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_cloudManager, a3);
      objc_storeStrong((id *)&v12->_homeManager, a4);
      v12->_isPerformingRefresh = 0;
      v12->_refreshLock._os_unfair_lock_opaque = 0;
    }
    self = v12;
    v10 = self;
  }

  return v10;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002484;
  block[3] = &unk_10004C8C0;
  block[4] = a1;
  if (qword_100056730 != -1) {
    dispatch_once(&qword_100056730, block);
  }
  v2 = (void *)qword_100056728;

  return v2;
}

- (void)refreshDataForReason:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  os_unfair_lock_lock(&self->_refreshLock);
  if (self->_isPerformingRefresh)
  {
    os_unfair_lock_unlock(&self->_refreshLock);
    id v7 = sub_100031A80();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if (a3 > 9) {
        CFStringRef v8 = @"Unknown";
      }
      else {
        CFStringRef v8 = off_10004C908[a3];
      }
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = (id)v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Skipping request (reason: %@) to perform refresh. One underway", (uint8_t *)location, 0xCu);
    }

    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
  else
  {
    self->_isPerformingRefresh = 1;
    os_unfair_lock_unlock(&self->_refreshLock);
    v9 = [[MSDDataRefresh alloc] initWithReason:a3];
    objc_initWeak(location, self);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100002724;
    v10[3] = &unk_10004C8E8;
    objc_copyWeak(&v12, location);
    id v11 = v6;
    [(MSDDataRefresh *)v9 performRefreshWithCompletion:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak(location);
  }
}

- (void)invalidateRefreshTimestamps
{
}

- (MSDCloudManager)cloudManager
{
  return self->_cloudManager;
}

- (MSDHomeManager)homeManager
{
  return self->_homeManager;
}

- (BOOL)isPerformingRefresh
{
  return self->_isPerformingRefresh;
}

- (void)setIsPerformingRefresh:(BOOL)a3
{
  self->_isPerformingRefresh = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeManager, 0);

  objc_storeStrong((id *)&self->_cloudManager, 0);
}

- (void)addMediaService:(id)a3 usingSetupBundles:(id)a4 transaction:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v14 = +[CKContainer MSDCloudKitContainer];
  v13 = [v14 privateCloudDatabase];
  [v13 addMediaService:v12 usingSetupBundles:v11 transaction:v10 completion:v9];
}

- (void)getAvailableServices:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v8 = +[CKContainer MSDCloudKitContainer];
  id v7 = [v8 privateCloudDatabase];
  [v7 getAvailableServices:v6 completion:v5];
}

- (void)updateDefaultMediaService:(id)a3 withUserInfo:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v11 = +[CKContainer MSDCloudKitContainer];
  id v10 = [v11 privateCloudDatabase];
  [v10 updateDefaultMediaService:v9 withUserInfo:v8 completion:v7];
}

- (void)getDefaultMediaService:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v8 = +[CKContainer MSDCloudKitContainer];
  id v7 = [v8 privateCloudDatabase];
  [v7 getDefaultMediaService:v6 completion:v5];
}

- (void)updateProperty:(id)a3 propertyInfo:(id)a4 withUserInfo:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v14 = +[CKContainer MSDCloudKitContainer];
  v13 = [v14 privateCloudDatabase];
  [v13 updateProperty:v12 propertyInfo:v11 withUserInfo:v10 completion:v9];
}

- (void)removeMediaService:(id)a3 withUserInfo:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v11 = +[CKContainer MSDCloudKitContainer];
  id v10 = [v11 privateCloudDatabase];
  [v10 removeMediaService:v9 withUserInfo:v8 completion:v7];
}

- (void)removeMediaServices:(id)a3 withUserInfo:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void, void *))a5;
  if (!v7 || ![v7 count])
  {
    if (!v9) {
      goto LABEL_13;
    }
    uint64_t v12 = MSErrorDomain;
    uint64_t v20 = MSUserInfoErrorStringKey;
    CFStringRef v21 = @"ServiceIDs specified is nil";
    v13 = &v21;
    id v14 = &v20;
LABEL_12:
    v16 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v14 count:1];
    v17 = +[NSError errorWithDomain:v12 code:1 userInfo:v16];
    v9[2](v9, 0, v17);

    goto LABEL_13;
  }
  if (v8 && [v8 count])
  {
    id v10 = +[CKContainer MSDCloudKitContainer];
    id v11 = [v10 privateCloudDatabase];
    [v11 removeMediaServices:v7 withUserInfo:v8 completion:v9];

    goto LABEL_13;
  }
  v15 = sub_100031A80();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_10001B3A0(v15);
  }

  if (v9)
  {
    uint64_t v12 = MSErrorDomain;
    uint64_t v18 = MSUserInfoErrorStringKey;
    CFStringRef v19 = @"Failed to remove services, NIL identifiers passed";
    v13 = &v19;
    id v14 = &v18;
    goto LABEL_12;
  }
LABEL_13:
}

- (void)getServiceConfigurationInfo:(id)a3 serviceID:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v11 = +[CKContainer MSDCloudKitContainer];
  id v10 = [v11 privateCloudDatabase];
  [v10 getServiceConfigurationInfo:v9 serviceID:v8 completion:v7];
}

- (void)getCachedAvailableServices:(id)a3 homeID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  if (v10)
  {
    if (v8)
    {
      if (v9)
      {
        [(MSDDataController *)self _findServicesForUser:v8 homeID:v9 completion:v10];
        goto LABEL_8;
      }
      uint64_t v11 = MSErrorDomain;
      NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
      CFStringRef v17 = @"HomeID Passed is Nil";
      uint64_t v12 = &v17;
      v13 = &v16;
    }
    else
    {
      uint64_t v11 = MSErrorDomain;
      NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
      CFStringRef v19 = @"HomeUserID Passed is Nil";
      uint64_t v12 = &v19;
      v13 = &v18;
    }
    id v14 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v13 count:1];
    v15 = +[NSError errorWithDomain:v11 code:1 userInfo:v14];
    v10[2](v10, 0, v15);
  }
LABEL_8:
}

- (void)switchUserAccountInfo:(id)a3 homeID:(id)a4 homeUserID:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v14 = +[CKContainer MSDCloudKitContainer];
  v13 = [v14 privateCloudDatabase];
  [v13 switchUserAccountInfo:v12 homeID:v11 homeUserID:v10 completion:v9];
}

- (void)_findServicesForUser:(id)a3 homeID:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[MSDHomeManager sharedManager];
  id v12 = [v11 homeWithIdentifier:v9];

  v13 = [v12 currentUser];
  id v14 = [v13 uniqueIdentifier];
  id v15 = [v10 isEqual:v14];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001AD2C;
  v17[3] = &unk_10004D558;
  id v18 = v8;
  id v16 = v8;
  [(MSDDataController *)self _servicesForUser:v10 homeID:v9 publicInfo:0 currentUser:v15 completion:v17];
}

- (void)_servicesForUser:(id)a3 homeID:(id)a4 publicInfo:(id)a5 currentUser:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(id, void *, void))a7;
  v13 = kPrivateDatabaseKeyData;
  if (!v8) {
    v13 = kSharedDatabaseKeyData;
  }
  id v14 = *v13;
  id v15 = sub_100031A80();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v16 = @"is NOT";
    if (v8) {
      CFStringRef v16 = @"is";
    }
    CFStringRef v17 = @"Shared";
    if (v8) {
      CFStringRef v17 = @"Private";
    }
    *(_DWORD *)buf = 138412546;
    CFStringRef v38 = v16;
    __int16 v39 = 2112;
    CFStringRef v40 = v17;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "The user %@ the currentUser, querying %@ database", buf, 0x16u);
  }

  id v18 = +[MSDDefaultsManager sharedManager];
  CFStringRef v19 = [v18 objectForDefaultWithCustomClass:v14];

  if ([v19 count])
  {
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10001B2A4;
    v30[3] = &unk_10004CB10;
    id v20 = v10;
    id v31 = v20;
    id v32 = v11;
    CFStringRef v21 = [v19 na_filter:v30];
    v22 = v21;
    if (v21 && [v21 count])
    {
      v12[2](v12, v22, 0);
    }
    else
    {
      v23 = +[NSString stringWithFormat:@"Failed to locate services for homeUserID %@", v20];
      uint64_t v24 = MSErrorDomain;
      NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
      v34 = v23;
      v25 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      v26 = +[NSError errorWithDomain:v24 code:5 userInfo:v25];
      ((void (**)(id, void *, void *))v12)[2](v12, 0, v26);
    }
    v27 = v31;
  }
  else
  {
    uint64_t v28 = MSErrorDomain;
    NSErrorUserInfoKey v35 = NSLocalizedDescriptionKey;
    CFStringRef v36 = @"No service configured in home";
    v27 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    v29 = +[NSError errorWithDomain:v28 code:2 userInfo:v27];
    ((void (**)(id, void *, void *))v12)[2](v12, 0, v29);
  }
}

@end