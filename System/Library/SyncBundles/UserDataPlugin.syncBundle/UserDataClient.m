@interface UserDataClient
- (BOOL)prepareForSyncWithHostAnchor:(id)a3 progressCallback:(id)a4 error:(id *)a5;
- (UsageMetrics)_appUsageMetricsUsingCacheDeleteData:(SEL)a3;
- (UsageMetrics)_cacheDeleteUsageMetricsUsingCacheDeleteData:(SEL)a3;
- (UsageMetrics)_fileUsageMetrics;
- (UsageMetrics)_iCloudUsageMetrics;
- (id)currentSyncAnchor;
- (id)installedAssetMetrics;
- (id)outstandingAssetTransfers;
- (id)supportedDataclasses;
@end

@implementation UserDataClient

- (UsageMetrics)_cacheDeleteUsageMetricsUsingCacheDeleteData:(SEL)a3
{
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  id v5 = a4;
  v6 = [v5 valueForKey:@"com.apple.mobile.cache_delete_geo_tile_loader"];
  [v6 longLongValue];
  uint64_t v7 = ATGetPhysicalSizeForLogicalSize();

  v8 = [v5 valueForKey:@"com.apple.WebBookmarks.CacheDelete"];
  [v8 longLongValue];
  uint64_t v9 = ATGetPhysicalSizeForLogicalSize();

  v10 = [v5 valueForKey:@"com.apple.mobileassetd.cache-delete"];
  [v10 longLongValue];
  uint64_t v11 = ATGetPhysicalSizeForLogicalSize();

  v12 = [v5 valueForKey:@"com.apple.itunesstored.CacheDelete"];

  [v12 longLongValue];
  uint64_t v13 = ATGetPhysicalSizeForLogicalSize();

  unint64_t v14 = v9 + v7 + v11 + v13;
  retstr->var2 = v14;
  v15 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 134217984;
    unint64_t v18 = v14;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "found %lld bytes of purgeable user data from CacheDelete", (uint8_t *)&v17, 0xCu);
  }

  return result;
}

- (UsageMetrics)_appUsageMetricsUsingCacheDeleteData:(SEL)a3
{
  id v5 = a4;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3810000000;
  unint64_t v18 = &unk_72FF;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  v6 = [v5 valueForKey:@"com.apple.mobile.cache_delete_app_container_caches"];
  [v6 longLongValue];
  v16[6] = ATGetPhysicalSizeForLogicalSize();

  v16[5] = v16[6];
  uint64_t v7 = +[LSApplicationWorkspace defaultWorkspace];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_4EF4;
  v14[3] = &unk_8260;
  v14[4] = &v15;
  [v7 enumerateBundlesOfType:1 block:v14];

  v8 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v16[4];
    uint64_t v10 = v16[5];
    uint64_t v11 = v16[6];
    *(_DWORD *)buf = 134218496;
    uint64_t v23 = v9;
    __int16 v24 = 2048;
    uint64_t v25 = v10;
    __int16 v26 = 2048;
    uint64_t v27 = v11;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "found %lld app docs, %lld bytes (%lld bytes purgeable)", buf, 0x20u);
  }

  v12 = v16;
  *(_OWORD *)&retstr->var0 = *((_OWORD *)v16 + 2);
  retstr->var2 = v12[6];
  _Block_object_dispose(&v15, 8);

  return result;
}

- (UsageMetrics)_iCloudUsageMetrics
{
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = sub_5514;
  v38 = sub_5524;
  id v39 = 0;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_552C;
  v31[3] = &unk_8238;
  v33 = &v34;
  dsema = dispatch_semaphore_create(0);
  v32 = dsema;
  v3 = v31;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  v4 = (void (*)(void *))off_CA68;
  v43 = off_CA68;
  if (!off_CA68)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_5624;
    v46 = &unk_8288;
    v47 = &v40;
    sub_5624(buf);
    v4 = (void (*)(void *))v41[3];
  }
  _Block_object_dispose(&v40, 8);
  if (!v4)
  {
    uint64_t v21 = +[NSAssertionHandler currentHandler];
    v22 = +[NSString stringWithUTF8String:"void soft_BRGetTotalApplicationDocumentUsage(void (^__strong)(NSDictionary *__strong, NSError *__strong))"];
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, @"UserDataClient.m", 20, @"%s", dlerror());

    __break(1u);
  }
  v4(v3);

  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  if (v35[5])
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = (id)v35[5];
    id v5 = [obj countByEnumeratingWithState:&v27 objects:v44 count:16];
    if (v5)
    {
      unint64_t v26 = 0;
      unint64_t v6 = 0;
      unint64_t v7 = 0;
      uint64_t v8 = *(void *)v28;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v28 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v11 = [(id)v35[5] objectForKey:v10];
            v12 = [v11 valueForKey:@"Total Size"];
            [v12 longLongValue];
            uint64_t v13 = ATGetPhysicalSizeForLogicalSize();

            unint64_t v14 = [v11 valueForKey:@"Evictable Size"];
            [v14 longLongValue];
            uint64_t v15 = ATGetPhysicalSizeForLogicalSize();

            v16 = [v11 valueForKey:@"Document Count"];
            id v17 = [v16 unsignedLongLongValue];

            v26 += v13;
            v6 += v15;
            v7 += (unint64_t)v17;
          }
        }
        id v5 = [obj countByEnumeratingWithState:&v27 objects:v44 count:16];
      }
      while (v5);
    }
    else
    {
      unint64_t v26 = 0;
      unint64_t v6 = 0;
      unint64_t v7 = 0;
    }

    unint64_t v18 = v26;
  }
  else
  {
    unint64_t v18 = 0;
    unint64_t v6 = 0;
    unint64_t v7 = 0;
  }
  retstr->var0 = v7;
  retstr->var1 = v18;
  retstr->var2 = v6;
  uint64_t v19 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v18;
    *(_WORD *)&buf[22] = 2048;
    v46 = (void *)v6;
    _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "found %lld icloud data files, %lld bytes (%lld purgeable)", buf, 0x20u);
  }

  _Block_object_dispose(&v34, 8);
  return result;
}

- (UsageMetrics)_fileUsageMetrics
{
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = (char *)[&off_8BF8 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    unint64_t v6 = 0;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(&off_8BF8);
        }
        *(_DWORD *)buf = 0;
        uint64_t v10 = ATGetUsageForPath();
        v7 += *(unsigned int *)buf;
        v6 += v10;
        retstr->var0 = v7;
        retstr->var1 = v6;
      }
      id v5 = (char *)[&off_8BF8 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
    unint64_t v7 = 0;
  }
  uint64_t v11 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    unint64_t v18 = v7;
    __int16 v19 = 2048;
    unint64_t v20 = v6;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "found %lld system data files, %lld bytes", buf, 0x16u);
  }

  return result;
}

- (id)installedAssetMetrics
{
  v3 = (void *)CacheDeleteCopyItemizedPurgeableSpaceWithInfo();
  v4 = _ATLogCategorySyncBundle_Oversize();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "including purgeable user data from CacheDelete: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v81 = 0x3810000000;
  v82 = &unk_72FF;
  uint64_t v83 = 0;
  uint64_t v84 = 0;
  uint64_t v85 = 0;
  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x3810000000;
  v70 = &unk_72FF;
  uint64_t v71 = 0;
  uint64_t v72 = 0;
  uint64_t v73 = 0;
  uint64_t v60 = 0;
  v61 = &v60;
  uint64_t v62 = 0x3810000000;
  v63 = &unk_72FF;
  uint64_t v64 = 0;
  uint64_t v65 = 0;
  uint64_t v66 = 0;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3810000000;
  v56 = &unk_72FF;
  uint64_t v57 = 0;
  uint64_t v58 = 0;
  uint64_t v59 = 0;
  id v5 = dispatch_group_create();
  unint64_t v6 = +[NSThread currentThread];
  dispatch_qos_class_t v7 = [v6 qualityOfService];

  uint64_t v8 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v9 = dispatch_queue_attr_make_with_qos_class(v8, v7, 0);
  uint64_t v10 = dispatch_queue_create("com.apple.amp.UserDataClient.updateQueue", v9);

  dispatch_group_enter(v5);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5F58;
  block[3] = &unk_81E8;
  p_long long buf = &buf;
  block[4] = self;
  uint64_t v11 = v5;
  v51 = v11;
  dispatch_async(v10, block);
  dispatch_group_enter(v11);
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_5FAC;
  v47[3] = &unk_81E8;
  v49 = &v67;
  v47[4] = self;
  v12 = v11;
  v48 = v12;
  dispatch_async(v10, v47);
  dispatch_group_enter(v12);
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_6000;
  v43[3] = &unk_8210;
  v46 = &v60;
  v43[4] = self;
  id v13 = v3;
  id v44 = v13;
  long long v14 = v12;
  v45 = v14;
  dispatch_async(v10, v43);
  dispatch_group_enter(v14);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_6058;
  v39[3] = &unk_8210;
  uint64_t v42 = &v53;
  v39[4] = self;
  id v34 = v13;
  id v40 = v34;
  long long v15 = v14;
  v41 = v15;
  v38 = v10;
  dispatch_async(v10, v39);
  v35 = v15;
  dispatch_group_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v16 = *(void *)(*((void *)&buf + 1) + 32);
  uint64_t v17 = v68[4];
  uint64_t v36 = v68[5];
  uint64_t v37 = *(void *)(*((void *)&buf + 1) + 40);
  uint64_t v18 = v61[4];
  uint64_t v19 = v61[5];
  uint64_t v20 = v54[4];
  uint64_t v21 = v54[5];
  uint64_t v22 = *(void *)(*((void *)&buf + 1) + 48);
  uint64_t v23 = v68[6];
  uint64_t v24 = v61[6];
  uint64_t v25 = v54[6];
  _ATLogCategorySyncBundle();
  uint64_t v26 = v17 + v16 + v18 + v20;
  v28 = uint64_t v27 = v23 + v22 + v24 + v25;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v74 = 134218496;
    uint64_t v75 = v26;
    __int16 v76 = 2048;
    uint64_t v77 = v36 + v37 + v19 + v21;
    __int16 v78 = 2048;
    uint64_t v79 = v27;
    _os_log_impl(&dword_0, v28, OS_LOG_TYPE_DEFAULT, "found %lld items, %lld bytes, (%lld bytes purgeable)", v74, 0x20u);
  }

  long long v29 = +[NSNumber numberWithUnsignedLongLong:v26];
  long long v30 = +[NSNumber numberWithUnsignedLongLong:v36 + v37 + v19 + v21];
  v31 = +[NSNumber numberWithUnsignedLongLong:v27];
  v32 = +[NSDictionary dictionaryWithObjectsAndKeys:v29, @"_Count", v30, @"_PhysicalSize", v31, @"_PurgeableSize", 0];

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(&buf, 8);

  return v32;
}

- (id)outstandingAssetTransfers
{
  return 0;
}

- (BOOL)prepareForSyncWithHostAnchor:(id)a3 progressCallback:(id)a4 error:(id *)a5
{
  return 1;
}

- (id)currentSyncAnchor
{
  return @"0";
}

- (id)supportedDataclasses
{
  return +[NSArray arrayWithObject:@"UserData"];
}

@end