@interface CHIconCache
+ (id)fetchPhoneIconWithParameters:(id)a3;
+ (id)fetchWatchIconWithParameters:(id)a3;
+ (void)_fetchChicletWithParameters:(id)a3 completion:(id)a4;
+ (void)_fetchIconFromLaunchServicesWithParameters:(id)a3 completion:(id)a4;
+ (void)_fetchIconFromNRGWithParameters:(id)a3 completion:(id)a4;
+ (void)_fetchRoundIconWithParameters:(id)a3 completion:(id)a4;
+ (void)fetchPhoneIconWithParameters:(id)a3 completion:(id)a4;
+ (void)fetchWatchIconWithParameters:(id)a3 completion:(id)a4;
+ (void)initializeCachePathOnMainQueue;
@end

@implementation CHIconCache

+ (void)initializeCachePathOnMainQueue
{
  if (+[NSThread isMainThread])
  {
    v2 = sub_10014C63C();
  }
  else
  {
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, &stru_1008AE1F8);
  }
}

+ (void)_fetchIconFromNRGWithParameters:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 bundleID];
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = sub_100172C44;
  v31 = sub_100172C54;
  id v32 = 0;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  v9 = +[ACXDeviceConnection sharedDeviceConnection];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100172C5C;
  v24[3] = &unk_1008AE220;
  v26 = &v27;
  v10 = v8;
  v25 = v10;
  [v9 fetchWatchAppBundleIDForCompanionAppBundleID:v7 completion:v24];

  dispatch_time_t v11 = dispatch_time(0, 20000000000);
  dispatch_semaphore_wait(v10, v11);
  v12 = +[UIScreen mainScreen];
  v13 = [v12 traitCollection];
  [v13 displayScale];
  if (v14 <= 2.0) {
    id v15 = [v5 iconVariant2x];
  }
  else {
    id v15 = [v5 iconVariant3x];
  }
  id v16 = v15;

  v17 = +[NanoResourceGrabber sharedInstance];
  if (v28[5]) {
    v18 = (void *)v28[5];
  }
  else {
    v18 = v7;
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100172CBC;
  v21[3] = &unk_1008AE248;
  id v19 = v5;
  id v22 = v19;
  id v20 = v6;
  id v23 = v20;
  [v17 getIconForBundleID:v18 iconVariant:v16 block:v21 timeout:20.0];

  _Block_object_dispose(&v27, 8);
}

+ (void)_fetchRoundIconWithParameters:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100172E30;
  v8[3] = &unk_1008AE248;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [a1 _fetchIconFromNRGWithParameters:v7 completion:v8];
}

+ (void)_fetchIconFromLaunchServicesWithParameters:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void))a4;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  double v14 = sub_100172C44;
  id v15 = sub_100172C54;
  id v16 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10017313C;
  v8[3] = &unk_1008AE270;
  id v7 = v5;
  id v9 = v7;
  id v10 = &v11;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v8);
  v6[2](v6, v12[5]);

  _Block_object_dispose(&v11, 8);
}

+ (void)_fetchChicletWithParameters:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100173330;
  v8[3] = &unk_1008AE248;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [a1 _fetchIconFromLaunchServicesWithParameters:v7 completion:v8];
}

+ (void)fetchWatchIconWithParameters:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  if (v7)
  {
    [a1 initializeCachePathOnMainQueue];
    [v6 setNeedsWatchIcon:1];
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3032000000;
    id v23 = sub_100172C44;
    v24 = sub_100172C54;
    id v25 = 0;
    dispatch_semaphore_t v8 = sub_1000FDCC0(v6);
    id v9 = sub_10017378C();
    uint64_t v10 = [v9 objectForKey:v8];
    uint64_t v11 = (void *)v21[5];
    v21[5] = v10;

    if (v21[5])
    {
      _HKInitializeLogging();
      v12 = HKLogActivity;
      if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v27 = v8;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Source icon for cacheID: %@ is available in-memory.", buf, 0xCu);
      }
      v7[2](v7, v21[5], 0);
    }
    else
    {
      uint64_t v13 = dispatch_get_global_queue(25, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1001737E0;
      block[3] = &unk_1008AE2E8;
      id v19 = a1;
      id v15 = v6;
      v18 = &v20;
      id v16 = v8;
      v17 = v7;
      dispatch_async(v13, block);
    }
    _Block_object_dispose(&v20, 8);
  }
}

+ (id)fetchWatchIconWithParameters:(id)a3
{
  id v4 = a3;
  [a1 initializeCachePathOnMainQueue];
  [v4 setNeedsWatchIcon:1];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = sub_100172C44;
  uint64_t v27 = sub_100172C54;
  id v28 = 0;
  id v5 = sub_1000FDCC0(v4);
  id v6 = sub_10017378C();
  uint64_t v7 = [v6 objectForKey:v5];
  dispatch_semaphore_t v8 = (void *)v24[5];
  v24[5] = v7;

  if (v24[5])
  {
    _HKInitializeLogging();
    id v9 = HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Source icon for cacheID: %@ is available in-memory.", (uint8_t *)&buf, 0xCu);
    }
    id v10 = (id)v24[5];
  }
  else
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v30 = 0x3032000000;
    v31 = sub_100172C44;
    id v32 = sub_100172C54;
    id v33 = 0;
    dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
    v12 = sub_100173D84();
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100173DD8;
    v16[3] = &unk_1008AE338;
    id v22 = a1;
    id v17 = v4;
    uint64_t v20 = &v23;
    p_long long buf = &buf;
    id v18 = v5;
    dispatch_semaphore_t v19 = v11;
    uint64_t v13 = v11;
    dispatch_async(v12, v16);

    dispatch_time_t v14 = dispatch_time(0, 10000000000);
    dispatch_semaphore_wait(v13, v14);
    id v10 = *(id *)(*((void *)&buf + 1) + 40);

    _Block_object_dispose(&buf, 8);
  }

  _Block_object_dispose(&v23, 8);

  return v10;
}

+ (void)fetchPhoneIconWithParameters:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, void))a4;
  if (v7)
  {
    [a1 initializeCachePathOnMainQueue];
    [v6 setNeedsWatchIcon:0];
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3032000000;
    uint64_t v23 = sub_100172C44;
    v24 = sub_100172C54;
    id v25 = 0;
    dispatch_semaphore_t v8 = sub_1000FDCC0(v6);
    id v9 = sub_10017378C();
    uint64_t v10 = [v9 objectForKey:v8];
    dispatch_semaphore_t v11 = (void *)v21[5];
    v21[5] = v10;

    if (v21[5])
    {
      _HKInitializeLogging();
      v12 = HKLogActivity;
      if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v27 = v8;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Source icon for cacheID: %@ is available in-memory.", buf, 0xCu);
      }
      v7[2](v7, v21[5], 0);
    }
    else
    {
      uint64_t v13 = dispatch_get_global_queue(25, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10017428C;
      block[3] = &unk_1008AE2E8;
      id v19 = a1;
      id v15 = v6;
      id v18 = &v20;
      id v16 = v8;
      id v17 = v7;
      dispatch_async(v13, block);
    }
    _Block_object_dispose(&v20, 8);
  }
}

+ (id)fetchPhoneIconWithParameters:(id)a3
{
  id v4 = a3;
  [a1 initializeCachePathOnMainQueue];
  [v4 setNeedsWatchIcon:0];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = sub_100172C44;
  uint64_t v27 = sub_100172C54;
  id v28 = 0;
  id v5 = sub_1000FDCC0(v4);
  id v6 = sub_10017378C();
  uint64_t v7 = [v6 objectForKey:v5];
  dispatch_semaphore_t v8 = (void *)v24[5];
  v24[5] = v7;

  if (v24[5])
  {
    _HKInitializeLogging();
    id v9 = HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Source icon for cacheID: %@ is available in-memory.", (uint8_t *)&buf, 0xCu);
    }
    id v10 = (id)v24[5];
  }
  else
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v30 = 0x3032000000;
    v31 = sub_100172C44;
    id v32 = sub_100172C54;
    id v33 = 0;
    dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
    v12 = sub_100173D84();
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100174830;
    v16[3] = &unk_1008AE338;
    id v22 = a1;
    id v17 = v4;
    uint64_t v20 = &v23;
    p_long long buf = &buf;
    id v18 = v5;
    dispatch_semaphore_t v19 = v11;
    uint64_t v13 = v11;
    dispatch_async(v12, v16);

    dispatch_time_t v14 = dispatch_time(0, 10000000000);
    dispatch_semaphore_wait(v13, v14);
    id v10 = *(id *)(*((void *)&buf + 1) + 40);

    _Block_object_dispose(&buf, 8);
  }

  _Block_object_dispose(&v23, 8);

  return v10;
}

@end