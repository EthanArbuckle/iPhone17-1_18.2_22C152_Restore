@interface MLDCacheDeleteController
+ (unint64_t)_cacheDeleteUrgencyToMusicLibraryUrgency:(int)a3;
- ($06626BA963112C91E7E52BBD3AECAE4D)_calculateUsageAnalytics;
- (BOOL)_isMediaVolume:(id)a3;
- (MLDCacheDeleteController)initWithLibraries:(id)a3;
- (__CFDictionary)_handlePurgeRequestWithUrgency:(int)a3 info:(__CFDictionary *)a4;
- (__CFDictionary)_handlePurgeableRequestWithUrgency:(int)a3 info:(__CFDictionary *)a4;
- (void)_addOptimizeStorageAnalyticsToPayload:(id)a3;
- (void)_addPurgeAnalytics:(id *)a3 toPayload:(id)a4;
- (void)_addPurgeableAnalytics:(id *)a3 toPayload:(id)a4;
- (void)_addUsageAnalytics:(id *)a3 toPayload:(id)a4;
- (void)_handleCacheDeleteNotification:(__CFDictionary *)a3;
- (void)_reconcileAllOriginalArtworkForLibrary:(id)a3 withCompletion:(id)a4;
- (void)_reconcileOrginalArtworkWitRelativePaths:(id)a3 forLibrary:(id)a4 withCompletion:(id)a5;
- (void)_reconcilePurgeNotification;
- (void)_registerCacheDeleteHandler;
- (void)_reportCacheDeletePurgeEventWithUrgency:(int)a3 amountRequested:(unint64_t)a4 amountPurged:(unint64_t)a5 duration:(double)a6;
- (void)_reportCacheDeletePurgeableRequestWithUrgency:(int)a3 purgeableAmount:(unint64_t)a4 duration:(double)a5;
- (void)_updatePurgedOriginalWithRelativePath:(id)a3 forLibrary:(id)a4 usingConnection:(id)a5;
@end

@implementation MLDCacheDeleteController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventReportingQueue, 0);
  objc_storeStrong((id *)&self->_libraries, 0);
  objc_storeStrong((id *)&self->_artworkOperationQueue, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)_addPurgeableAnalytics:(id *)a3 toPayload:(id)a4
{
  double var0 = a3->var0;
  id v6 = a4;
  v7 = +[NSNumber numberWithDouble:var0];
  [v6 setObject:v7 forKeyedSubscript:@"Duration"];

  v8 = +[NSNumber numberWithUnsignedLongLong:a3->var1];
  [v6 setObject:v8 forKeyedSubscript:@"Urgency"];

  id v9 = +[NSNumber numberWithUnsignedLongLong:a3->var2 >> 20];
  [v6 setObject:v9 forKeyedSubscript:@"MBPurgeableReported"];
}

- (void)_addPurgeAnalytics:(id *)a3 toPayload:(id)a4
{
  double var0 = a3->var0;
  id v6 = a4;
  v7 = +[NSNumber numberWithDouble:var0];
  [v6 setObject:v7 forKeyedSubscript:@"Duration"];

  v8 = +[NSNumber numberWithUnsignedLongLong:a3->var1];
  [v6 setObject:v8 forKeyedSubscript:@"Urgency"];

  id v9 = +[NSNumber numberWithUnsignedLongLong:a3->var2 >> 20];
  [v6 setObject:v9 forKeyedSubscript:@"MBRequested"];

  v10 = +[NSNumber numberWithUnsignedLongLong:a3->var3 >> 20];
  [v6 setObject:v10 forKeyedSubscript:@"MBPurged"];

  v11 = +[NSNumber numberWithUnsignedLongLong:(a3->var4 + a3->var3) >> 20];
  [v6 setObject:v11 forKeyedSubscript:@"MBPurgeableBefore"];

  id v12 = +[NSNumber numberWithUnsignedLongLong:a3->var4 >> 20];
  [v6 setObject:v12 forKeyedSubscript:@"MBPurgeableAfter"];
}

- (void)_addUsageAnalytics:(id *)a3 toPayload:(id)a4
{
  id v12 = a4;
  v5 = +[NSNumber numberWithUnsignedLongLong:a3->var0 >> 20];
  [v12 setObject:v5 forKeyedSubscript:@"MBTotalRedownloadablePinned"];

  id v6 = +[NSNumber numberWithUnsignedLongLong:a3->var1 >> 20];
  [v12 setObject:v6 forKeyedSubscript:@"MBNonRedownloadable"];

  v7 = +[NSNumber numberWithUnsignedLongLong:a3->var2 >> 20];
  [v12 setObject:v7 forKeyedSubscript:@"MBArtwork"];

  unint64_t var3 = a3->var3;
  if (var3) {
    +[NSNumber numberWithUnsignedLongLong:var3 >> 20];
  }
  else {
  id v9 = +[NSNull null];
  }
  [v12 setObject:v9 forKeyedSubscript:@"MBTotal"];

  unint64_t var4 = a3->var4;
  if (var4) {
    +[NSNumber numberWithUnsignedLongLong:var4 >> 20];
  }
  else {
  v11 = +[NSNull null];
  }
  [v12 setObject:v11 forKeyedSubscript:@"MBFree"];
}

- (void)_addOptimizeStorageAnalyticsToPayload:(id)a3
{
  id v6 = a3;
  id v3 = +[ML3MusicLibrary shouldOptimizeStorage];
  v4 = +[NSNumber numberWithBool:v3];
  [v6 setObject:v4 forKeyedSubscript:@"OptimizeStorageEnabled"];

  if (v3)
  {
    v5 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", +[ML3MusicLibrary minimumPurgeableStorage]);
    [v6 setObject:v5 forKeyedSubscript:@"OptimizeStorageSetting"];
  }
}

- (void)_reportCacheDeletePurgeableRequestWithUrgency:(int)a3 purgeableAmount:(unint64_t)a4 duration:(double)a5
{
  id v9 = (void *)os_transaction_create();
  eventReportingQueue = self->_eventReportingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000DB04;
  block[3] = &unk_10002D098;
  double v14 = fabs(a5);
  uint64_t v15 = a3;
  unint64_t v16 = a4;
  block[4] = self;
  id v13 = v9;
  id v11 = v9;
  dispatch_async(eventReportingQueue, block);
}

- (void)_reportCacheDeletePurgeEventWithUrgency:(int)a3 amountRequested:(unint64_t)a4 amountPurged:(unint64_t)a5 duration:(double)a6
{
  id v11 = (void *)os_transaction_create();
  eventReportingQueue = self->_eventReportingQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000DE14;
  v14[3] = &unk_10002D048;
  double v16 = a6;
  int v19 = a3;
  unint64_t v17 = a4;
  unint64_t v18 = a5;
  v14[4] = self;
  id v15 = v11;
  id v13 = v11;
  dispatch_async(eventReportingQueue, v14);
}

- (BOOL)_isMediaVolume:(id)a3
{
  id v3 = a3;
  bzero(&v12, 0x878uLL);
  id v4 = +[ML3MusicLibrary mediaFolderPath];
  int v5 = statfs((const char *)[v4 UTF8String], &v12);

  if (v5)
  {
    id v6 = os_log_create("com.apple.amp.medialibraryd", "CacheManagement");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = +[ML3MusicLibrary mediaFolderPath];
      int v10 = 138543362;
      id v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to fetch mount stats for path %{public}@", (uint8_t *)&v10, 0xCu);
    }
    LOBYTE(v8) = 0;
  }
  else
  {
    id v6 = +[NSString stringWithUTF8String:v12.f_mntonname];
    int v8 = [v3 isEqualToString:v6];
  }

  return v8;
}

- ($06626BA963112C91E7E52BBD3AECAE4D)_calculateUsageAnalytics
{
  uint64_t v17 = 0;
  unint64_t v18 = &v17;
  uint64_t v19 = 0x4810000000;
  v20 = &unk_100029D09;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v23 = 0;
  libraries = self->_libraries;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000E5D4;
  v16[3] = &unk_10002CFF8;
  v16[4] = &v17;
  [(NSArray *)libraries enumerateObjectsUsingBlock:v16];
  int v5 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
  id v6 = +[NSFileManager defaultManager];
  v7 = [v5 lastObject];
  int v8 = [v6 attributesOfFileSystemForPath:v7 error:0];

  if (v8)
  {
    id v9 = [v8 objectForKey:NSFileSystemSize];
    id v10 = [v9 longLongValue];
    v18[7] = (uint64_t)v10;

    id v11 = [v8 objectForKey:NSFileSystemFreeSize];
    id v12 = [v11 longLongValue];
    v18[8] = (uint64_t)v12;
  }
  id v13 = v18;
  long long v14 = *((_OWORD *)v18 + 3);
  *(_OWORD *)&retstr->double var0 = *((_OWORD *)v18 + 2);
  *(_OWORD *)&retstr->var2 = v14;
  retstr->unint64_t var4 = v13[8];

  _Block_object_dispose(&v17, 8);
  return result;
}

- (void)_handleCacheDeleteNotification:(__CFDictionary *)a3
{
  int v5 = os_log_create("com.apple.amp.medialibraryd", "CacheManagement");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received CacheDelete notification: %{public}@", buf, 0xCu);
  }

  id v6 = [(__CFDictionary *)a3 objectForKey:@"CACHE_DELETE_CACHE_ENABLED"];
  unsigned int v7 = [v6 BOOLValue];

  int v8 = (NSArray *)os_log_create("com.apple.amp.medialibraryd", "CacheManagement");
  BOOL v9 = os_log_type_enabled(&v8->super, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, &v8->super, OS_LOG_TYPE_DEFAULT, "CacheDelete has re-enabled caching - issue a change notification", buf, 2u);
    }

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    int v8 = self->_libraries;
    id v10 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "notifyContentsDidChange", (void)v14);
        }
        id v11 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
  else if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, &v8->super, OS_LOG_TYPE_DEFAULT, "CacheDelete has disabled caching", buf, 2u);
  }
}

- (__CFDictionary)_handlePurgeRequestWithUrgency:(int)a3 info:(__CFDictionary *)a4
{
  id v44 = [(id)objc_opt_class() _cacheDeleteUrgencyToMusicLibraryUrgency:*(void *)&a3];
  unsigned int v7 = [(__CFDictionary *)a4 objectForKey:@"CACHE_DELETE_AMOUNT"];
  id v8 = [v7 longLongValue];

  BOOL v9 = [(__CFDictionary *)a4 objectForKey:@"CACHE_DELETE_VOLUME"];
  LODWORD(a4) = [(MLDCacheDeleteController *)self _isMediaVolume:v9];
  id v10 = os_log_create("com.apple.amp.medialibraryd", "CacheManagement");
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (a4)
  {
    if (v11)
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v56 = a3;
      *(_WORD *)&v56[4] = 2114;
      *(void *)&v56[6] = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Received purge request with urgency %u for volume '%{public}@'", buf, 0x12u);
    }
    unsigned int v42 = a3;
    v43 = v9;

    +[ML3MusicLibrary clearCloudAssetSharedCache];
    v40 = +[NSDate date];
    v41 = self;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    obj = self->_libraries;
    id v12 = [(NSArray *)obj countByEnumeratingWithState:&v48 objects:v54 count:16];
    if (!v12)
    {
      unint64_t v14 = 0;
      goto LABEL_27;
    }
    id v13 = v12;
    unint64_t v14 = 0;
    long long v15 = "com.apple.amp.medialibraryd";
    long long v16 = "CacheManagement";
    uint64_t v17 = *(void *)v49;
    while (1)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v49 != v17) {
          objc_enumerationMutation(obj);
        }
        if (v14 < (unint64_t)v8)
        {
          uint64_t v19 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          uint64_t v20 = [v19 databasePath];
          if (!v20) {
            goto LABEL_16;
          }
          long long v21 = (void *)v20;
          long long v22 = +[NSFileManager defaultManager];
          [v19 databasePath];
          v47 = v19;
          uint64_t v23 = v17;
          unint64_t v24 = v14;
          id v25 = v13;
          v26 = v16;
          id v27 = v8;
          v29 = v28 = v15;
          unsigned int v46 = [v22 fileExistsAtPath:v29];

          long long v15 = v28;
          id v8 = v27;
          long long v16 = v26;
          id v13 = v25;
          unint64_t v14 = v24;
          uint64_t v17 = v23;
          uint64_t v19 = v47;

          if (v46)
          {
            v30 = os_log_create(v15, v16);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              v31 = [v47 databasePath];
              *(_DWORD *)buf = 138543362;
              *(void *)v56 = v31;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Begin purge for library %{public}@", buf, 0xCu);

              uint64_t v19 = v47;
            }

            v14 += (unint64_t)[v19 clearPurgeableStorageAmount:v8 withUrgency:v44];
            v32 = os_log_create(v15, v16);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              v33 = [v19 databasePath];
              *(_DWORD *)buf = 138543362;
              *(void *)v56 = v33;
              v34 = v32;
              os_log_type_t v35 = OS_LOG_TYPE_DEFAULT;
              v36 = "End purge for library %{public}@";
              goto LABEL_18;
            }
          }
          else
          {
LABEL_16:
            v32 = os_log_create(v15, v16);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              v33 = [v19 databasePath];
              *(_DWORD *)buf = 138543362;
              *(void *)v56 = v33;
              v34 = v32;
              os_log_type_t v35 = OS_LOG_TYPE_ERROR;
              v36 = "Skipping purge for library with missing database at path=%{public}@.";
LABEL_18:
              _os_log_impl((void *)&_mh_execute_header, v34, v35, v36, buf, 0xCu);
            }
          }

          continue;
        }
      }
      id v13 = [(NSArray *)obj countByEnumeratingWithState:&v48 objects:v54 count:16];
      if (!v13)
      {
LABEL_27:

        id v10 = v40;
        [v40 timeIntervalSinceNow];
        -[MLDCacheDeleteController _reportCacheDeletePurgeEventWithUrgency:amountRequested:amountPurged:duration:](v41, "_reportCacheDeletePurgeEventWithUrgency:amountRequested:amountPurged:duration:", v42, v8, v14);
        BOOL v9 = v43;
        goto LABEL_28;
      }
    }
  }
  if (v11)
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v56 = a3;
    *(_WORD *)&v56[4] = 2114;
    *(void *)&v56[6] = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Ignoring purge request with urgency %u for volume '%{public}@'", buf, 0x12u);
  }
  unint64_t v14 = 0;
LABEL_28:

  v53[0] = v9;
  v52[0] = @"CACHE_DELETE_VOLUME";
  v52[1] = @"CACHE_DELETE_AMOUNT";
  v37 = +[NSNumber numberWithUnsignedLongLong:v14];
  v52[2] = @"CACHE_DELETE_PURGE_TIMEOUT";
  v53[1] = v37;
  v53[2] = &off_10002EE00;
  v38 = +[NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:3];

  return v38;
}

- (__CFDictionary)_handlePurgeableRequestWithUrgency:(int)a3 info:(__CFDictionary *)a4
{
  uint64_t v5 = *(void *)&a3;
  unsigned int v7 = +[NSDate date];
  id v36 = [(id)objc_opt_class() _cacheDeleteUrgencyToMusicLibraryUrgency:v5];
  id v8 = [(__CFDictionary *)a4 objectForKey:@"CACHE_DELETE_VOLUME"];
  unsigned int v9 = [(MLDCacheDeleteController *)self _isMediaVolume:v8];
  id v10 = os_log_create("com.apple.amp.medialibraryd", "CacheManagement");
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v47 = v5;
      *(_WORD *)&v47[4] = 2114;
      *(void *)&v47[6] = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Received purgeable request with urgency %u for volume '%{public}@'", buf, 0x12u);
    }
    unsigned int v34 = v5;
    os_log_type_t v35 = v8;

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v33 = self;
    obj = self->_libraries;
    id v12 = [(NSArray *)obj countByEnumeratingWithState:&v39 objects:v45 count:16];
    if (!v12)
    {
      uint64_t v38 = 0;
      goto LABEL_25;
    }
    id v13 = v12;
    uint64_t v38 = 0;
    uint64_t v14 = *(void *)v40;
    while (1)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v40 != v14) {
          objc_enumerationMutation(obj);
        }
        long long v16 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        uint64_t v17 = [v16 databasePath];
        if (!v17) {
          goto LABEL_15;
        }
        unint64_t v18 = (void *)v17;
        uint64_t v19 = +[NSFileManager defaultManager];
        uint64_t v20 = [v16 databasePath];
        unsigned int v21 = [v19 fileExistsAtPath:v20];

        if (!v21)
        {
LABEL_15:
          unint64_t v24 = os_log_create("com.apple.amp.medialibraryd", "CacheManagement");
          if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            goto LABEL_18;
          }
          id v25 = [v16 databasePath];
          *(_DWORD *)buf = 138543362;
          *(void *)v47 = v25;
          v26 = v24;
          os_log_type_t v27 = OS_LOG_TYPE_ERROR;
          v28 = "Skipping purgeable amount for library with missing database at path=%{public}@";
          goto LABEL_17;
        }
        long long v22 = os_log_create("com.apple.amp.medialibraryd", "CacheManagement");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v23 = [v16 databasePath];
          *(_DWORD *)buf = 138543362;
          *(void *)v47 = v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Begin gathering purgeable amount for library %{public}@", buf, 0xCu);
        }
        v38 += (uint64_t)[v16 purgeableStorageSizeWithUrgency:v36];
        unint64_t v24 = os_log_create("com.apple.amp.medialibraryd", "CacheManagement");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          id v25 = [v16 databasePath];
          *(_DWORD *)buf = 138543362;
          *(void *)v47 = v25;
          v26 = v24;
          os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
          v28 = "End gathering purgeable amount for library %{public}@";
LABEL_17:
          _os_log_impl((void *)&_mh_execute_header, v26, v27, v28, buf, 0xCu);
        }
LABEL_18:
      }
      id v13 = [(NSArray *)obj countByEnumeratingWithState:&v39 objects:v45 count:16];
      if (!v13)
      {
LABEL_25:

        [v7 timeIntervalSinceNow];
        uint64_t v29 = v38;
        -[MLDCacheDeleteController _reportCacheDeletePurgeableRequestWithUrgency:purgeableAmount:duration:](v33, "_reportCacheDeletePurgeableRequestWithUrgency:purgeableAmount:duration:", v34, v38);
        id v8 = v35;
        goto LABEL_26;
      }
    }
  }
  if (v11)
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v47 = v5;
    *(_WORD *)&v47[4] = 2114;
    *(void *)&v47[6] = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Ignoring purgeable request with urgency %u for volume '%{public}@'", buf, 0x12u);
  }

  uint64_t v29 = 0;
LABEL_26:
  v44[0] = v8;
  v43[0] = @"CACHE_DELETE_VOLUME";
  v43[1] = @"CACHE_DELETE_AMOUNT";
  v30 = +[NSNumber numberWithUnsignedLongLong:v29];
  v43[2] = @"CACHE_DELETE_PURGE_TIMEOUT";
  v44[1] = v30;
  v44[2] = &off_10002EE00;
  v31 = +[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:3];

  return v31;
}

- (void)_reconcilePurgeNotification
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obj = self->_libraries;
  id v3 = [(NSArray *)obj countByEnumeratingWithState:&v16 objects:v25 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v17;
    *(void *)&long long v4 = 138543618;
    long long v14 = v4;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        unsigned int v9 = +[NSMutableSet set];
        id v10 = [v8 originalArtworkDirectory];
        BOOL v11 = [@"/private" stringByAppendingString:v10];

        id v12 = os_log_create("com.apple.amp.medialibraryd", "CacheManagement");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v14;
          long long v22 = self;
          __int16 v23 = 2114;
          unint64_t v24 = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Checking path %{public}@ for purged artwork", buf, 0x16u);
        }

        uint64_t v20 = v11;
        +[NSArray arrayWithObjects:&v20 count:1];
        id v13 = v9;
        CacheDeleteEnumerateRemovedFilesInDirectories();
      }
      id v5 = [(NSArray *)obj countByEnumeratingWithState:&v16 objects:v25 count:16];
    }
    while (v5);
  }
}

- (void)_reconcileOrginalArtworkWitRelativePaths:(id)a3 forLibrary:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  artworkOperationQueue = self->_artworkOperationQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000F980;
  v15[3] = &unk_10002D1C0;
  id v16 = v9;
  long long v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  [(NSOperationQueue *)artworkOperationQueue addOperationWithBlock:v15];
}

- (void)_reconcileAllOriginalArtworkForLibrary:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  artworkOperationQueue = self->_artworkOperationQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000FD2C;
  v11[3] = &unk_10002D730;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [(NSOperationQueue *)artworkOperationQueue addOperationWithBlock:v11];
}

- (void)_updatePurgedOriginalWithRelativePath:(id)a3 forLibrary:(id)a4 usingConnection:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v26 = v8;
  BOOL v11 = +[NSArray arrayWithObjects:&v26 count:1];
  unsigned __int8 v12 = [v10 executeUpdate:@"UPDATE artwork SET relative_path = '' WHERE relative_path = ?" withParameters:v11 error:0];

  if (v12)
  {
    id v21 = v8;
    id v13 = +[NSArray arrayWithObjects:&v21 count:1];
    id v14 = [v10 executeQuery:@"SELECT entity_pid, entity_type, artwork_token.artwork_type FROM artwork JOIN artwork_token USING(artwork_token) WHERE relative_path = ?", v13 withParameters];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100010290;
    v16[3] = &unk_10002CF30;
    long long v17 = v9;
    id v18 = v10;
    id v19 = self;
    id v20 = v8;
    [v14 enumerateRowsWithBlock:v16];

    long long v15 = v17;
  }
  else
  {
    long long v15 = os_log_create("com.apple.amp.medialibraryd", "CacheManagement");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v23 = self;
      __int16 v24 = 2114;
      id v25 = v8;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}@ Error clearing artwork.relative_path for artwork relativePath=%{public}@.", buf, 0x16u);
    }
  }
}

- (void)_registerCacheDeleteHandler
{
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000106C8;
  v12[3] = &unk_10002CEE0;
  objc_copyWeak(&v13, &location);
  v12[4] = self;
  id v3 = objc_retainBlock(v12);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000107B0;
  v10[3] = &unk_10002CEE0;
  objc_copyWeak(&v11, &location);
  v10[4] = self;
  long long v4 = objc_retainBlock(v10);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100010898;
  v8[3] = &unk_10002CF08;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  id v5 = objc_retainBlock(v8);
  CacheDeleteRegister();
  CacheDeleteInitPurgeMarker();
  objc_copyWeak(&v7, &location);
  CacheDeleteRegisterPurgeNotification();
  id v6 = os_log_create("com.apple.amp.medialibraryd", "CacheManagement");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Registered CacheDelete handlers.", buf, 0xCu);
  }

  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (MLDCacheDeleteController)initWithLibraries:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MLDCacheDeleteController;
  id v6 = [(MLDCacheDeleteController *)&v17 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_libraries, a3);
    id v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.medialibraryd.CacheDeleteController.accessQueue", v8);
    accessQueue = v7->_accessQueue;
    v7->_accessQueue = (OS_dispatch_queue *)v9;

    id v11 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    artworkOperationQueue = v7->_artworkOperationQueue;
    v7->_artworkOperationQueue = v11;

    [(NSOperationQueue *)v7->_artworkOperationQueue setMaxConcurrentOperationCount:1];
    id v13 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.amp.medialibrary.CacheDeletePurge.Reporting", v13);
    eventReportingQueue = v7->_eventReportingQueue;
    v7->_eventReportingQueue = (OS_dispatch_queue *)v14;

    [(MLDCacheDeleteController *)v7 _registerCacheDeleteHandler];
  }

  return v7;
}

+ (unint64_t)_cacheDeleteUrgencyToMusicLibraryUrgency:(int)a3
{
  uint64_t v3 = (a3 - 2);
  if (v3 < 3) {
    return v3 + 1;
  }
  else {
    return 0;
  }
}

@end