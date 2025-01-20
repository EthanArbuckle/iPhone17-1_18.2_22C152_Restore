void sub_2AC4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  unsigned int v8;
  unsigned char *v9;
  NSObject *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  _DWORD v14[2];
  __int16 v15;
  void *v16;

  v5 = a2;
  v6 = a3;
  [*(id *)(a1 + 32) _initializeProgress];
  v8 = [*(id *)(a1 + 32) sourceFileType];
  switch(v8)
  {
    case 2u:
      [*(id *)(a1 + 32) _performMoveFromPath:v5 toPath:v6];
      break;
    case 1u:
      [*(id *)(a1 + 32) _performZipExtractionFromPath:v5 toPath:v6];
      break;
    case 0u:
      [*(id *)(a1 + 32) _performCopyFromPath:v5 toPath:v6];
      break;
  }
  v9 = *(unsigned char **)(a1 + 32);
  if (v9[24] && [v9 fixFilePermissions])
  {
    v10 = BCIMLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = [*(id *)(a1 + 32) sourceFileType];
      v12 = [*(id *)(a1 + 32) sourceFilePath];
      v14[0] = 67109378;
      v14[1] = v11;
      v15 = 2112;
      v16 = v12;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "BKExtractFileOperation main: fixFilePermissions: (type: %d, path: %@)", (uint8_t *)v14, 0x12u);
    }
    v13 = +[NSURL fileURLWithPath:v6];
    [*(id *)(a1 + 32) _fixFilePermissions:v13];
  }
}

void sub_2C78(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = [a2 path];
  v4 = [*(id *)(a1 + 32) destinationFilePath];
  (*(void (**)(uint64_t, id, void *))(v3 + 16))(v3, v5, v4);
}

void sub_2CF4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = [a2 path];
  v4 = [*(id *)(a1 + 32) destinationFilePath];
  (*(void (**)(uint64_t, id, void *))(v3 + 16))(v3, v5, v4);
}

void sub_374C(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v11 = 0;
  id v10 = 0;
  unsigned int v3 = [v2 getResourceValue:&v11 forKey:NSURLIsDirectoryKey error:&v10];
  id v4 = v11;
  id v5 = v10;
  if (!v3)
  {
    v9 = BCIMLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_8F240();
    }
    goto LABEL_10;
  }
  id v6 = v2;
  v7 = (const char *)[v6 fileSystemRepresentation];
  if ([v4 BOOLValue]) {
    mode_t v8 = 504;
  }
  else {
    mode_t v8 = 432;
  }
  if (chmod(v7, v8))
  {
    v9 = BCIMLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_8F178((uint64_t)v6, v4);
    }
LABEL_10:
  }
}

void sub_3C08(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v3 = objc_begin_catch(exception_object);
      id v4 = BCIMLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_8F378();
      }

      *(unsigned char *)(v2 + 24) = 0;
      objc_end_catch();
      JUMPOUT(0x3A50);
    }
    objc_begin_catch(exception_object);
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_3F44(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void sub_3F7C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_4DE0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id BKLibraryFrameworkBundle()
{
  if (qword_EE598 != -1) {
    dispatch_once(&qword_EE598, &stru_D13F0);
  }
  v0 = (void *)qword_EE590;

  return v0;
}

void sub_69D0(id a1)
{
  uint64_t v1 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v2 = qword_EE590;
  qword_EE590 = v1;

  _objc_release_x1(v1, v2);
}

void sub_6CAC(id *a1, void *a2)
{
  id v3 = a2;
  kdebug_trace();
  kdebug_trace();
  uint64_t v4 = [a1[4] quotaFetcher];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_6DDC;
  v8[3] = &unk_D1468;
  id v9 = v3;
  id v5 = a1[5];
  id v6 = a1[4];
  id v10 = v5;
  id v11 = v6;
  id v12 = a1[6];
  id v13 = a1[7];
  id v7 = v3;
  [v4 fetchUserQuotaWithCompletion:v8];
}

void sub_6DDC(uint64_t a1, uint64_t a2, void *a3)
{
  id v50 = a3;
  kdebug_trace();
  kdebug_trace();
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  uint64_t v49 = a1;
  id obj = *(id *)(a1 + 32);
  id v4 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
  if (v4)
  {
    id v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v62;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v62 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        id v10 = [BKLibraryFileSizeManagerCacheItemRequest alloc];
        id v11 = [v9 assetID];
        id v12 = [v9 url];
        id v13 = [(BKLibraryFileSizeManagerCacheItemRequest *)v10 initWithCacheItemRequestWithAssetID:v11 assetURL:v12];

        v14 = +[BKLibraryFileSizeManager sharedInstance];
        v15 = [v14 synchronousFileSizeForCacheItemRequest:v13];

        if (v15)
        {
          uint64_t v16 = (uint64_t)[v15 longLongValue];
          v6 += v16 & ~(v16 >> 63);
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }

  kdebug_trace();
  if (+[BCDevice isInternalInstall])
  {
    v17 = +[NSUserDefaults standardUserDefaults];
    v18 = [v17 stringForKey:@"BKUbiquitySimulateLocalLibrarySize"];

    v19 = +[NSUserDefaults standardUserDefaults];
    v20 = [v19 stringForKey:@"BKUbiquitySimulateQuota"];

    v21 = +[NSUserDefaults standardUserDefaults];
    v22 = [v21 stringForKey:@"BKUbiquitySimulateStoragePlan"];

    v23 = +[NSUserDefaults standardUserDefaults];
    unsigned int v24 = [v23 BOOLForKey:@"BKUbiquitySimulateQuotaTimeout"];

    v25 = +[NSUserDefaults standardUserDefaults];
    v26 = [v25 stringForKey:@"BKUbiquitySimulateNumberOfItemsInCloud"];
  }
  else
  {
    v26 = 0;
    unsigned int v24 = 0;
    v20 = 0;
    v18 = 0;
    v22 = 0;
  }
  v27 = v50;
  id v28 = [v18 length];
  v29 = v48;
  if (v28 && ((unint64_t)[v18 longLongValue] & 0x8000000000000000) == 0) {
    id v6 = (char *)[v18 longLongValue];
  }
  if ([v20 length]
    && (unint64_t v30 = (unint64_t)[v20 longLongValue], v31 = v20, (v30 & 0x8000000000000000) == 0)
    || [v22 length]
    && (unint64_t v32 = (unint64_t)[v22 longLongValue], v31 = v22, (v32 & 0x8000000000000000) == 0))
  {
    v29 = (char *)[v31 longLongValue];
  }
  if (v50)
  {
    v33 = [v50 domain];
    if ([v33 isEqualToString:IMUbiquityQuotaFetcherErrorDomain])
    {
      id v34 = [v50 code];
      v35 = v20;
      unsigned int v36 = v24;
      v37 = v18;
      BOOL v38 = v34 == (id)kIMUbiquityQuotaFetcherErrorQuotaServerUnreachable;

      uint64_t v39 = 1;
      if (v6 > v29) {
        uint64_t v39 = 2;
      }
      BOOL v40 = !v38;
      v18 = v37;
      unsigned int v24 = v36;
      v20 = v35;
      v27 = v50;
      if (!v40) {
        uint64_t v39 = 3;
      }
      goto LABEL_33;
    }
  }
  uint64_t v39 = 1;
  if (v6 > v29) {
    uint64_t v39 = 2;
  }
LABEL_33:
  if (v24) {
    uint64_t v41 = 3;
  }
  else {
    uint64_t v41 = v39;
  }
  dispatch_group_leave(*(dispatch_group_t *)(v49 + 40));
  dispatch_group_wait(*(dispatch_group_t *)(v49 + 40), 0xFFFFFFFFFFFFFFFFLL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_73B4;
  block[3] = &unk_D1418;
  v42 = *(void **)(v49 + 56);
  block[4] = *(void *)(v49 + 48);
  id v60 = v42;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  if ([v26 length] && ((unint64_t)objc_msgSend(v26, "longLongValue") & 0x8000000000000000) == 0)
  {
    v43 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v26 longLongValue]);
    [*(id *)(v49 + 48) setNumberOfItemsIniCloud:[v43 unsignedIntegerValue]];
  }
  if (v41 == 2)
  {
    if ([*(id *)(v49 + 48) numberOfItemsIniCloud]) {
      uint64_t v41 = 1;
    }
    else {
      uint64_t v41 = 2;
    }
  }
  kdebug_trace();
  v44 = +[PSCloudStorageQuotaManager sharedManager];
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_73C0;
  v52[3] = &unk_D1440;
  id v53 = v22;
  id v45 = *(id *)(v49 + 64);
  uint64_t v56 = v41;
  id v57 = v29;
  v58 = v6;
  uint64_t v54 = *(void *)(v49 + 48);
  id v55 = v45;
  id v46 = v22;
  [v44 getQuotaInfoForPrimaryAccountCompletion:v52];
}

id sub_73B4(uint64_t a1)
{
  return [*(id *)(a1 + 32) mq_tearDownQuery:*(void *)(a1 + 40)];
}

uint64_t sub_73C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  kdebug_trace();
  id v4 = [v3 totalStorage];

  if ([*(id *)(a1 + 32) length]
    && ((unint64_t)[*(id *)(a1 + 32) longLongValue] & 0x8000000000000000) == 0)
  {
    id v4 = [*(id *)(a1 + 32) longLongValue];
  }
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 72);
  uint64_t v8 = *(void *)(a1 + 48);
  id v9 = [*(id *)(a1 + 40) numberOfItemsIniCloud];
  id v10 = *(uint64_t (**)(uint64_t, uint64_t, BOOL, uint64_t, uint64_t, id))(v8 + 16);

  return v10(v8, v5, (unint64_t)v4 > 0xE8D4A50FFFLL, v6, v7, v9);
}

void sub_76E0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  id v4 = [*(id *)(a1 + 32) ubiquityStatusMonitor];
  uint64_t v5 = [v4 documentsURL];

  uint64_t v6 = [v5 path];
  uint64_t v7 = +[NSPredicate predicateWithFormat:@"%K BEGINSWITH %@", NSMetadataItemPathKey, v6];
  [*(id *)(a1 + 40) setPredicate:v7];

  id v10 = NSMetadataQueryUbiquitousDocumentsScope;
  uint64_t v8 = +[NSArray arrayWithObjects:&v10 count:1];
  [*(id *)(a1 + 40) setSearchScopes:v8];

  [*(id *)(a1 + 40) setNotificationBatchingInterval:0.5];
  id v9 = +[NSNotificationCenter defaultCenter];
  [v9 addObserver:*(void *)(a1 + 32) selector:"mq_queryDidFinish:" name:NSMetadataQueryDidFinishGatheringNotification object:*(void *)(a1 + 40)];

  [*(id *)(a1 + 40) startQuery];
}

void sub_7EF0(uint64_t a1)
{
}

void sub_7FAC(uint64_t a1)
{
}

id sub_83F4(uint64_t a1)
{
  uint64_t v2 = BKStoreLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Initializing defaultManager", v6, 2u);
  }

  uint64_t v3 = objc_opt_new();
  id v4 = (void *)qword_EE5A0;
  qword_EE5A0 = v3;

  return [(id)qword_EE5A0 _sortAndInitializeDataSources:*(void *)(a1 + 32)];
}

void sub_8980(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
}

uint64_t sub_89D0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_89E0(uint64_t a1)
{
}

void sub_89E8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  objc_sync_enter(v4);
  uint64_t v5 = BKLibraryLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v11 = 138412546;
    id v12 = v3;
    __int16 v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "MRP: mrp = %@ (%@)", (uint8_t *)&v11, 0x16u);
  }
  if (v3)
  {
    uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) laterDate:v3];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  objc_sync_exit(v4);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_8B28(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_8BB8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  CFStringRef v23 = @"purchaseDate";
  uint64_t v5 = +[NSArray arrayWithObjects:&v23 count:1];
  [v4 setPropertiesToFetch:v5];

  [v4 setResultType:2];
  uint64_t v6 = [*(id *)(a1 + 32) predicateForPurchasedBooksAssets];
  [v4 setPredicate:v6];

  id v7 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"purchaseDate" ascending:0];
  id v22 = v7;
  uint64_t v8 = +[NSArray arrayWithObjects:&v22 count:1];
  [v4 setSortDescriptors:v8];

  [v4 setFetchLimit:1];
  id v19 = 0;
  uint64_t v9 = [v3 executeFetchRequest:v4 error:&v19];

  id v10 = v19;
  if (v10)
  {
    int v11 = BKLibraryLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_8F68C();
    }
  }
  else if ([v9 count])
  {
    objc_opt_class();
    id v12 = [v9 firstObject];
    int v11 = BUDynamicCast();

    objc_opt_class();
    __int16 v13 = [v11 objectForKeyedSubscript:@"purchaseDate"];
    v14 = BUDynamicCast();

    v15 = +[NSUserDefaults standardUserDefaults];
    [v15 setObject:v14 forKey:@"BKMostRecentPurchaseDateKey"];

    uint64_t v16 = BKLibraryLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v14;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "MRP: update cached mrp = %@", buf, 0xCu);
    }
  }
  else
  {
    v17 = +[NSUserDefaults standardUserDefaults];
    v18 = +[NSDate distantPast];
    [v17 setObject:v18 forKey:@"BKMostRecentPurchaseDateKey"];

    int v11 = BKLibraryLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "MRP: no library purchases", buf, 2u);
    }
  }
}

void sub_9C18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_9C5C(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _setupCoreDataStack];
}

void sub_9C64(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_9CE8;
  block[3] = &unk_D1520;
  id v2 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_9CE8(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _persistentStoreDidMigrate];
}

void sub_9CF0(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 collectionManager];
  [v4 setupDefaultCollectionsInManagedObjectContext:v3];
}

void sub_9D50(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _reloadWithCompletion:v3];
}

void sub_9DAC(id a1, NSString *a2)
{
  id v2 = a2;
  id v3 = BKLibraryLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    sub_8F790((uint64_t)v2, v3);
  }
}

uint64_t sub_A2CC(uint64_t a1, void *a2)
{
  id v3 = a2;
  kdebug_trace();
  [*(id *)(a1 + 32) _cleanUpOrphanedSampleAssets:v3];

  return kdebug_trace();
}

void sub_AA94(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 collectionManager];
  [v4 setupDefaultCollectionsInManagedObjectContext:v3];
}

void sub_AAF4(uint64_t a1, void *a2)
{
  id v3 = a2;
  kdebug_trace();
  id v4 = [*(id *)(a1 + 32) collectionManager];
  [v4 updateCollectionMemberAssetLinksInMOCForUpgrade:v3];

  uint64_t v5 = 0;
  if ([*(id *)(a1 + 32) _compareVersionWith:@"1.8"] == (char *)&dword_0 + 1)
  {
    uint64_t v6 = kBKCollectionDefaultIDBooks;
    uint64_t v5 = [*(id *)(a1 + 32) _assetIDsForCollectionID:kBKCollectionDefaultIDBooks moc:v3];
    id v7 = BKLibraryLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v10 = 134217984;
      id v11 = [v5 count];
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "My Books: Migrating Persistent Store Books collection. Found %lu assets in Books collection", (uint8_t *)&v10, 0xCu);
    }

    [*(id *)(a1 + 32) _removeAllMembersFromCollection:v6 moc:v3];
  }
  uint64_t v8 = [*(id *)(a1 + 32) collectionManager];
  [v8 resetAllAssetsCollectionsWithLibraryManagedObjectContext:v3 completion:0];

  [*(id *)(a1 + 32) _updateRelationshipsInContext:v3];
  [*(id *)(a1 + 32) _resetNilAuthorsOnAllBooksInContext:v3];
  [*(id *)(a1 + 32) _resetNilAuthorsOnAllSeriesInContext:v3];
  [*(id *)(a1 + 32) migrateToMyBooksWithAssetIDs:v5 inManagedObjectContext:v3];
  uint64_t v9 = [*(id *)(a1 + 32) collectionManager];
  [v9 clearSortKeysFromAssetsInMOCForUpgrade:v3];

  kdebug_trace();
}

void sub_B5E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

uint64_t sub_B644(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = (byte_EE5B0 & 1) == 0;
  byte_EE5B0 = 1;
  return result;
}

void sub_B668(id a1)
{
  byte_EE5B0 = 0;
}

id sub_BA10(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) updatesScheduleQueue];
  dispatch_suspend(v2);

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v3 = *(void **)(a1 + 40);

  return _[v3 finishedWithOperations];
}

void sub_BA6C(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) updatesScheduleQueue];
  dispatch_resume(v1);
}

BKLibraryManagedObjectContext *sub_C0C4(uint64_t a1)
{
  id v2 = [[BKLibraryManagedObjectContext alloc] initWithConcurrencyType:1];
  [(BKLibraryManagedObjectContext *)v2 setName:@"Background R/O Context"];
  id v3 = [*(id *)(a1 + 32) persistentStoreCoordinator];
  [(BKLibraryManagedObjectContext *)v2 setPersistentStoreCoordinator:v3];

  [(BKLibraryManagedObjectContext *)v2 setUndoManager:0];
  [(BKLibraryManagedObjectContext *)v2 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
  [(BKLibraryManagedObjectContext *)v2 setLibraryManager:*(void *)(a1 + 32)];

  return v2;
}

id sub_CAC8(void *a1, void *a2)
{
  if (a1)
  {
    a1 = [a2 objectAtIndexedSubscript:__clz(__rbit64((unint64_t)a1))];
    uint64_t v2 = vars8;
  }
  return a1;
}

void sub_CD74(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) workerChildContext];
  [v2 mergeChangesFromContextDidSaveNotification:*(void *)(a1 + 40)];
}

void sub_CDC8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) collectionsWorkerChildContext];
  [v2 mergeChangesFromContextDidSaveNotification:*(void *)(a1 + 40)];
}

void sub_D01C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) uiChildContext];
  [v2 mergeChangesFromContextDidSaveNotification:*(void *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) uiChildContext];
  unsigned int v4 = [v3 hasChanges];

  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) uiChildContext];
    [v5 setSaveContext:1];

    id v6 = [*(id *)(a1 + 32) uiChildContext];
    [v6 save:0];
  }
}

void sub_D0E4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) collectionsWorkerChildContext];
  [v2 mergeChangesFromContextDidSaveNotification:*(void *)(a1 + 40)];
}

void sub_D338(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) uiChildContext];
  [v2 mergeChangesFromContextDidSaveNotification:*(void *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) uiChildContext];
  unsigned int v4 = [v3 hasChanges];

  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) uiChildContext];
    [v5 setSaveContext:1];

    id v6 = [*(id *)(a1 + 32) uiChildContext];
    [v6 save:0];
  }
}

void sub_D400(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) workerChildContext];
  [v2 mergeChangesFromContextDidSaveNotification:*(void *)(a1 + 40)];
}

void sub_D76C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) uiChildContext];
  [v2 mergeChangesFromContextDidSaveNotification:*(void *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) uiChildContext];
  unsigned int v4 = [v3 hasChanges];

  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) uiChildContext];
    [v5 setSaveContext:1];

    id v6 = [*(id *)(a1 + 32) uiChildContext];
    [v6 save:0];
  }
}

void sub_D834(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) workerChildContext];
  [v2 mergeChangesFromContextDidSaveNotification:*(void *)(a1 + 40)];
}

void sub_D888(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) collectionsWorkerChildContext];
  [v2 mergeChangesFromContextDidSaveNotification:*(void *)(a1 + 40)];
}

void sub_DA08(uint64_t a1)
{
  id v2 = BCSignpostLibrary();
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "CollectionsQueueAsync", "", buf, 2u);
  }

  uint64_t v5 = (void (**)(id, void *))objc_retainBlock(*(id *)(a1 + 40));
  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) collectionsWorkerChildContext];
    v5[2](v5, v6);
  }
  id v7 = BCSignpostLibrary();
  uint64_t v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 48);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v15 = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v8, OS_SIGNPOST_INTERVAL_END, v9, "CollectionsQueueAsync", "", v15, 2u);
  }

  int v10 = [*(id *)(a1 + 32) collectionsWorkerChildContext];
  unsigned int v11 = [v10 hasChanges];

  if (v11)
  {
    id v12 = [*(id *)(a1 + 32) collectionsWorkerChildContext];
    uint64_t v14 = 0;
    [v12 save:&v14];
  }
  __int16 v13 = [*(id *)(a1 + 32) collectionsWorkerChildContext];
  [v13 setSessionContextType:0];
}

void sub_DCF4(uint64_t a1)
{
  id v2 = BCSignpostLibrary();
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "CollectionsQueueSync", "", buf, 2u);
  }

  uint64_t v5 = (void (**)(id, void *))objc_retainBlock(*(id *)(a1 + 40));
  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) collectionsWorkerChildContext];
    v5[2](v5, v6);
  }
  id v7 = BCSignpostLibrary();
  uint64_t v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 48);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v15 = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v8, OS_SIGNPOST_INTERVAL_END, v9, "CollectionsQueueSync", "", v15, 2u);
  }

  int v10 = [*(id *)(a1 + 32) collectionsWorkerChildContext];
  unsigned int v11 = [v10 hasChanges];

  if (v11)
  {
    id v12 = [*(id *)(a1 + 32) collectionsWorkerChildContext];
    uint64_t v14 = 0;
    [v12 save:&v14];
  }
  __int16 v13 = [*(id *)(a1 + 32) collectionsWorkerChildContext];
  [v13 setSessionContextType:0];
}

void sub_E018(uint64_t a1)
{
  id v2 = BCSignpostLibrary();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  os_signpost_id_t v4 = BCSignpostLibrary();
  uint64_t v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v18 = v6;
    _os_signpost_emit_with_name_impl(&dword_0, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "WorkerQueueAsync", "%{public}@", buf, 0xCu);
  }

  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = [*(id *)(a1 + 40) workerChildContext];
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  os_signpost_id_t v9 = BCSignpostLibrary();
  int v10 = v9;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v18 = v11;
    _os_signpost_emit_with_name_impl(&dword_0, v10, OS_SIGNPOST_INTERVAL_END, v3, "WorkerQueueAsync", "%{public}@", buf, 0xCu);
  }

  id v12 = [*(id *)(a1 + 40) workerChildContext];
  unsigned int v13 = [v12 hasChanges];

  if (v13)
  {
    uint64_t v14 = [*(id *)(a1 + 40) workerChildContext];
    uint64_t v16 = 0;
    [v14 save:&v16];
  }
  v15 = [*(id *)(a1 + 40) workerChildContext];
  [v15 setSessionContextType:0];
}

void sub_E3C0(uint64_t a1)
{
  id v2 = BCSignpostLibrary();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  os_signpost_id_t v4 = BCSignpostLibrary();
  uint64_t v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v18 = v6;
    _os_signpost_emit_with_name_impl(&dword_0, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "WorkerQueueSync", "%{public}@", buf, 0xCu);
  }

  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = [*(id *)(a1 + 40) workerChildContext];
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  os_signpost_id_t v9 = BCSignpostLibrary();
  int v10 = v9;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v18 = v11;
    _os_signpost_emit_with_name_impl(&dword_0, v10, OS_SIGNPOST_INTERVAL_END, v3, "WorkerQueueSync", "%{public}@", buf, 0xCu);
  }

  id v12 = [*(id *)(a1 + 40) workerChildContext];
  unsigned int v13 = [v12 hasChanges];

  if (v13)
  {
    uint64_t v14 = [*(id *)(a1 + 40) workerChildContext];
    uint64_t v16 = 0;
    [v14 save:&v16];
  }
  v15 = [*(id *)(a1 + 40) workerChildContext];
  [v15 setSessionContextType:0];
}

uint64_t sub_E790(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

intptr_t sub_E880(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v2);
}

void sub_ED1C(id *a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = BKLibraryLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_8F9F8();
    }
  }
  if (v6 && ![v6 BOOLValue])
  {
    uint64_t v11 = BKLibraryLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)unsigned int v13 = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Skip updating series info, becasue server said so.", v13, 2u);
    }
  }
  else
  {
    v14[0] = BKSeriesManagerSeriesTypeBookSeries;
    id v9 = [a1[4] copy];
    v15[0] = v9;
    v14[1] = BKSeriesManagerSeriesTypeAudiobookSeries;
    id v10 = [a1[5] copy];
    v15[1] = v10;
    uint64_t v11 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];

    id v12 = [a1[6] seriesManager];
    [v12 updateSeriesForSeriesAdamIDsWithTypes:v11 forceCheck:0];
  }
}

void sub_F40C(uint64_t a1, void *a2)
{
  os_signpost_id_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 checkOwnedSingleBookSeriesWithManagedObjectContext:v4];
  [*(id *)(a1 + 32) checkNonSeriesAudiobooksWithManagedObjectContext:v4];
}

void sub_FB44(uint64_t a1, void *a2)
{
  id v37 = a2;
  [v37 setSessionContextType:1];
  BOOL v40 = +[NSMutableArray array];
  os_signpost_id_t v3 = +[NSFetchRequest fetchRequestWithEntityName:@"BKCollectionMember"];
  id v4 = +[NSPredicate predicateWithValue:1];
  [v3 setPredicate:v4];

  uint64_t v5 = +[NSSortDescriptor sortDescriptorWithKey:@"assetID" ascending:1];
  v53[0] = v5;
  id v6 = +[NSSortDescriptor sortDescriptorWithKey:@"collection.collectionID" ascending:1];
  v53[1] = v6;
  id v7 = +[NSArray arrayWithObjects:v53 count:2];
  [v3 setSortDescriptors:v7];

  [v3 setFetchBatchSize:32];
  uint64_t v41 = a1;
  uint64_t v8 = [*(id *)(a1 + 32) collectionsWorkerChildContext];
  unsigned int v36 = v3;
  id v9 = [v8 executeFetchRequest:v3 error:0];

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v47 objects:v52 count:16];
  id v39 = v10;
  if (!v11)
  {
    unsigned int v13 = 0;
    uint64_t v14 = &stru_D4160;
    v15 = &stru_D4160;
    goto LABEL_26;
  }
  id v12 = v11;
  unsigned int v13 = 0;
  uint64_t v42 = *(void *)v48;
  uint64_t v14 = &stru_D4160;
  v15 = &stru_D4160;
  do
  {
    uint64_t v16 = 0;
    do
    {
      v17 = v15;
      uint64_t v18 = v14;
      if (*(void *)v48 != v42) {
        objc_enumerationMutation(v10);
      }
      id v19 = *(void **)(*((void *)&v47 + 1) + 8 * (void)v16);
      v15 = [v19 assetID];
      v20 = [v19 collection];
      uint64_t v21 = [v20 collectionID];
      uint64_t v14 = (__CFString *)v21;
      if (!v13
        || (v15 ? (BOOL v22 = v21 == 0) : (BOOL v22 = 1),
            v22
         || ![(__CFString *)v15 isEqualToString:v17]
         || ![(__CFString *)v14 isEqualToString:v18]))
      {
        id v27 = v19;

        unsigned int v13 = v27;
        goto LABEL_18;
      }
      uint64_t v23 = [v19 sortKey];
      if (!v23)
      {
LABEL_21:
        [v40 addObject:v19];
        goto LABEL_22;
      }
      unsigned int v24 = (void *)v23;
      v25 = [v19 localModDate];
      if (v25)
      {
      }
      else
      {
        BOOL v38 = [v13 localModDate];

        if (v38) {
          goto LABEL_21;
        }
      }
      [v40 addObject:v13];
      id v26 = v19;

      unsigned int v13 = v26;
LABEL_22:
      id v10 = v39;
LABEL_18:

      uint64_t v16 = (char *)v16 + 1;
    }
    while (v12 != v16);
    id v28 = [v10 countByEnumeratingWithState:&v47 objects:v52 count:16];
    id v12 = v28;
  }
  while (v28);
LABEL_26:

  if ([v40 count])
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v29 = v40;
    id v30 = [v29 countByEnumeratingWithState:&v43 objects:v51 count:16];
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = *(void *)v44;
      do
      {
        for (i = 0; i != v31; i = (char *)i + 1)
        {
          if (*(void *)v44 != v32) {
            objc_enumerationMutation(v29);
          }
          uint64_t v34 = *(void *)(*((void *)&v43 + 1) + 8 * i);
          v35 = [*(id *)(v41 + 32) collectionsWorkerChildContext];
          [v35 deleteObject:v34];
        }
        id v31 = [v29 countByEnumeratingWithState:&v43 objects:v51 count:16];
      }
      while (v31);
    }

    id v10 = v39;
  }
}

void sub_10734(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count] || objc_msgSend(*(id *)(a1 + 40), "resetSeriesOnAllBooks"))
  {
    kdebug_trace();
    id v2 = [*(id *)(a1 + 40) usq_moc];
    [v2 refreshAllObjects];

    if ([*(id *)(a1 + 32) count])
    {
      os_signpost_id_t v3 = +[NSFetchRequest fetchRequestWithEntityName:@"BKLibraryAsset"];
      id v4 = +[NSPredicate predicateWithFormat:@"seriesID IN %@ AND author == %@ AND contentType == %@", *(void *)(a1 + 32), @"UnknownAuthor", &off_D9E30];
      [v3 setPredicate:v4];

      [v3 setFetchBatchSize:64];
      uint64_t v5 = [(id *)(a1 + 40) usq_moc];
      id v6 = [v5 executeFetchRequest:v3 error:0];

      long long v215 = 0u;
      long long v216 = 0u;
      long long v213 = 0u;
      long long v214 = 0u;
      id v7 = v6;
      id v8 = [v7 countByEnumeratingWithState:&v213 objects:v238 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v214;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v214 != v10) {
              objc_enumerationMutation(v7);
            }
            [*(id *)(a1 + 40) _updateAuthorForSeriesContainer:*(void *)(*((void *)&v213 + 1) + 8 * i)];
          }
          id v9 = [v7 countByEnumeratingWithState:&v213 objects:v238 count:16];
        }
        while (v9);
      }
    }
    uint64_t v181 = +[BKLibraryManager predicateForLocalOrDownloadingLibraryAssets];
    uint64_t v182 = [*(id *)(a1 + 40) predicateForPurchasedBooksAssets];
    uint64_t v12 = +[NSPredicate predicateWithFormat:@"(%K != NULL OR %K != NULL)", @"purchasedAndLocalParent", @"localOnlySeriesItemsParent"];
    uint64_t v13 = +[NSPredicate predicateWithFormat:@"(%K = NULL AND %K.@count > 0) OR (ANY %K.%K > %K)", @"purchaseDate", @"purchasedAndLocalSeriesItems", @"purchasedAndLocalSeriesItems", @"purchaseDate", @"purchaseDate"];
    uint64_t v14 = +[NSPredicate predicateWithFormat:@"(%K = NULL AND %K.@count > 0) OR (ANY %K.%K > %K)", @"modificationDate", @"purchasedAndLocalSeriesItems", @"purchasedAndLocalSeriesItems", @"modificationDate", @"modificationDate"];
    uint64_t v15 = +[NSPredicate predicateWithFormat:@"(%K = NULL AND %K.@count > 0) OR (ANY %K.%K > %K)", @"lastOpenDate", @"purchasedAndLocalSeriesItems", @"purchasedAndLocalSeriesItems", @"lastOpenDate", @"lastOpenDate"];
    uint64_t v16 = +[NSPredicate predicateWithFormat:@"(%K == 0 OR %K == NULL) AND (ANY %K.%K == 1)", @"isNew", @"isNew", @"localOnlySeriesItems", @"isNew"];
    uint64_t v17 = +[NSPredicate predicateWithFormat:@"%K == 1 AND NOT (ANY %K.%K == 1)", @"isNew", @"localOnlySeriesItems", @"isNew"];
    uint64_t v18 = +[NSPredicate predicateWithFormat:@"%K == NULL OR %K == 0", @"seriesStackIDs", @"seriesStackIDs"];
    v192 = (void *)v13;
    v193 = (void *)v12;
    v237[0] = v12;
    v190 = (void *)v15;
    v191 = (void *)v14;
    v237[1] = v14;
    v237[2] = v15;
    v237[3] = v13;
    v185 = (void *)v17;
    v186 = (void *)v16;
    v237[4] = v16;
    v237[5] = v17;
    v178 = (void *)v18;
    v237[6] = v18;
    id v19 = +[NSArray arrayWithObjects:v237 count:7];
    uint64_t v20 = +[NSCompoundPredicate orPredicateWithSubpredicates:v19];

    v180 = (void *)v20;
    v236[0] = v20;
    uint64_t v21 = [*(id *)(a1 + 40) predicateForContainerLibraryAssets];
    v236[1] = v21;
    BOOL v22 = +[NSArray arrayWithObjects:v236 count:2];
    v194 = +[NSCompoundPredicate andPredicateWithSubpredicates:v22];

    v177 = +[NSPredicate predicateWithFormat:@"purchasedAndLocalParent == NULL OR purchasedAndLocalParent == 0"];
    v235[0] = v177;
    v235[1] = v182;
    uint64_t v23 = +[NSArray arrayWithObjects:v235 count:2];
    v184 = +[NSCompoundPredicate andPredicateWithSubpredicates:v23];

    v176 = +[NSPredicate predicateWithFormat:@"localOnlySeriesItemsParent == NULL OR localOnlySeriesItemsParent == 0"];
    v234[0] = v176;
    v234[1] = v181;
    unsigned int v24 = +[NSArray arrayWithObjects:v234 count:2];
    uint64_t v25 = +[NSCompoundPredicate andPredicateWithSubpredicates:v24];

    id v26 = [*(id *)(a1 + 40) predicateForUnownedSeriesLibraryAssets];
    v233[0] = v26;
    id v27 = +[BKLibraryManager predicateForInTheCloudLibraryAssets];
    v233[1] = v27;
    id v28 = +[NSArray arrayWithObjects:v233 count:2];
    uint64_t v29 = +[NSCompoundPredicate orPredicateWithSubpredicates:v28];

    v174 = +[NSPredicate predicateWithFormat:@"localOnlySeriesItemsParent != NULL AND localOnlySeriesItemsParent != 0"];
    v175 = (void *)v29;
    v232[0] = v29;
    v232[1] = v174;
    id v30 = +[NSArray arrayWithObjects:v232 count:2];
    uint64_t v31 = +[NSCompoundPredicate andPredicateWithSubpredicates:v30];

    uint64_t v32 = [*(id *)(a1 + 40) predicateForUnownedSeriesLibraryAssets];
    uint64_t v33 = +[NSPredicate predicateWithFormat:@"purchasedAndLocalParent != NULL AND purchasedAndLocalParent != 0"];
    v179 = (void *)v32;
    v231[0] = v32;
    v173 = (void *)v33;
    v231[1] = v33;
    uint64_t v34 = +[NSArray arrayWithObjects:v231 count:2];
    uint64_t v35 = +[NSCompoundPredicate andPredicateWithSubpredicates:v34];

    uint64_t v36 = +[NSPredicate predicateWithFormat:@"seriesContainer == NULL OR seriesContainer == 0"];
    id v37 = +[NSFetchRequest fetchRequestWithEntityName:@"BKLibraryAsset"];
    uint64_t v38 = +[NSPredicate predicateWithFormat:@"%K != NULL AND %K != 0", @"seriesID", @"seriesID"];
    v183 = (void *)v25;
    v230[0] = v25;
    v230[1] = v184;
    v188 = (void *)v35;
    v189 = (void *)v31;
    v230[2] = v31;
    v230[3] = v35;
    v187 = (void *)v36;
    v230[4] = v36;
    id v39 = +[NSArray arrayWithObjects:v230 count:5];
    BOOL v40 = +[NSCompoundPredicate orPredicateWithSubpredicates:v39];

    v229[0] = v40;
    v172 = (void *)v38;
    v229[1] = v38;
    uint64_t v41 = [*(id *)(a1 + 40) predicateForExcludingContainerLibraryAssets];
    v229[2] = v41;
    uint64_t v42 = +[NSArray arrayWithObjects:v229 count:3];
    long long v43 = +[NSCompoundPredicate andPredicateWithSubpredicates:v42];

    v228[0] = v43;
    v228[1] = v194;
    long long v44 = +[NSArray arrayWithObjects:v228 count:2];
    uint64_t v45 = +[NSCompoundPredicate orPredicateWithSubpredicates:v44];

    v171 = (void *)v45;
    if ([*(id *)(a1 + 40) resetSeriesOnAllBooks])
    {
      [v37 setPredicate:v45];
      [*(id *)(a1 + 40) setResetSeriesOnAllBooks:0];
    }
    else
    {
      long long v46 = +[NSPredicate predicateWithFormat:@"%K IN %@", @"seriesID", *(void *)(a1 + 32)];
      v227[0] = v46;
      v227[1] = v45;
      long long v47 = +[NSArray arrayWithObjects:v227 count:2];
      long long v48 = +[NSCompoundPredicate andPredicateWithSubpredicates:v47];
      [v37 setPredicate:v48];
    }
    long long v49 = [*(id *)(a1 + 40) usq_moc];
    id v212 = 0;
    long long v50 = [v49 executeFetchRequest:v37 error:&v212];
    id v51 = v212;

    v195 = +[NSMutableDictionary dictionary];
    v196 = +[NSMutableDictionary dictionary];
    v52 = BKLibraryLog();
    id v53 = v52;
    uint64_t v54 = &_s10Foundation12NotificationV6objectypSgvg_ptr;
    id v55 = (void *)v182;
    uint64_t v56 = v180;
    v170 = v51;
    if (v50)
    {
      v167 = v43;
      v168 = v40;
      v169 = v37;
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
        sub_8FBC0(v50, v53);
      }

      long long v210 = 0u;
      long long v211 = 0u;
      long long v208 = 0u;
      long long v209 = 0u;
      v166 = v50;
      id obj = v50;
      id v57 = [obj countByEnumeratingWithState:&v208 objects:v226 count:16];
      v58 = (id *)NSPredicate_ptr;
      if (v57)
      {
        id v59 = v57;
        uint64_t v60 = *(void *)v209;
        uint64_t v197 = *(void *)v209;
        do
        {
          long long v61 = 0;
          id v198 = v59;
          do
          {
            if (*(void *)v209 != v60) {
              objc_enumerationMutation(obj);
            }
            long long v62 = *(void **)(*((void *)&v208 + 1) + 8 * (void)v61);
            if (v62)
            {
              long long v63 = [*(id *)(*((void *)&v208 + 1) + 8 * (void)v61) seriesID];

              if (v63)
              {
                if ([v62 isContainer])
                {
                  if (([v62 isNew] & 1) == 0
                    && [v186 evaluateWithObject:v62])
                  {
                    [v62 setIsNew:1];
                  }
                  if ([v62 isNew]
                    && [v185 evaluateWithObject:v62])
                  {
                    [v62 setIsNew:0];
                  }
                  if ([v193 evaluateWithObject:v62])
                  {
                    [v62 setDifferentObject:0 forKey:@"purchasedAndLocalParent"];
                    [v62 setDifferentObject:0 forKey:@"localOnlySeriesItemsParent"];
                  }
                  if ([v191 evaluateWithObject:v62])
                  {
                    long long v64 = [v54[494] fetchRequestWithEntityName:@"BKLibraryAsset"];
                    v65 = [*v58 predicateWithFormat:@"%K = %@ AND (%K != NULL OR %K != NULL)", @"purchasedAndLocalParent", v62, @"modificationDate", @"creationDate"];
                    [v64 setPredicate:v65];

                    [v64 setFetchLimit:1];
                    v66 = +[NSSortDescriptor sortDescriptorWithKey:@"modificationDate" ascending:0];
                    v225[0] = v66;
                    v67 = +[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:0];
                    v225[1] = v67;
                    v68 = +[NSArray arrayWithObjects:v225 count:2];
                    [v64 setSortDescriptors:v68];

                    v69 = [*(id *)(a1 + 40) usq_moc];
                    id v207 = 0;
                    v70 = [v69 executeFetchRequest:v64 error:&v207];
                    id v71 = v207;

                    if (v70)
                    {
                      v72 = [v70 firstObject];
                      v73 = [v72 modificationDate];
                      if (v73)
                      {
                        [v62 setModificationDate:v73];
                      }
                      else
                      {
                        v97 = [v70 firstObject];
                        v98 = [v97 creationDate];
                        [v62 setModificationDate:v98];

                        v58 = (id *)NSPredicate_ptr;
                      }
                    }
                    else
                    {
                      v72 = BKLibraryLog();
                      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412546;
                        v222 = v62;
                        __int16 v223 = 2112;
                        id v224 = v71;
                        _os_log_error_impl(&dword_0, v72, OS_LOG_TYPE_ERROR, "Error fetching modification date for %@ - %@", buf, 0x16u);
                      }
                    }

                    uint64_t v54 = &_s10Foundation12NotificationV6objectypSgvg_ptr;
                    id v59 = v198;
                  }
                  if ([v190 evaluateWithObject:v62])
                  {
                    v99 = [v54[494] fetchRequestWithEntityName:@"BKLibraryAsset"];
                    v100 = [*v58 predicateWithFormat:@"%K = %@ AND (%K != NULL OR %K != NULL)", @"purchasedAndLocalParent", v62, @"lastOpenDate", @"creationDate"];
                    [v99 setPredicate:v100];

                    [v99 setFetchLimit:1];
                    v101 = +[NSSortDescriptor sortDescriptorWithKey:@"lastOpenDate" ascending:0];
                    v220[0] = v101;
                    v102 = +[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:0];
                    v220[1] = v102;
                    v103 = +[NSArray arrayWithObjects:v220 count:2];
                    [v99 setSortDescriptors:v103];

                    v104 = [*(id *)(a1 + 40) usq_moc];
                    id v206 = 0;
                    v105 = [v104 executeFetchRequest:v99 error:&v206];
                    id v106 = v206;

                    if (v105)
                    {
                      v107 = [v105 firstObject];
                      v108 = [v107 lastOpenDate];
                      v109 = v108;
                      if (v108)
                      {
                        v110 = v108;
                      }
                      else
                      {
                        v111 = [v105 firstObject];
                        v110 = [v111 creationDate];

                        v58 = (id *)NSPredicate_ptr;
                      }

                      [v62 nonUserUpdateLastOpenDateTo:v110];
                    }
                    else
                    {
                      v110 = BKLibraryLog();
                      if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412546;
                        v222 = v62;
                        __int16 v223 = 2112;
                        id v224 = v106;
                        _os_log_error_impl(&dword_0, v110, OS_LOG_TYPE_ERROR, "Error fetching lastOpenDate date for %@ - %@", buf, 0x16u);
                      }
                    }

                    uint64_t v54 = &_s10Foundation12NotificationV6objectypSgvg_ptr;
                    id v59 = v198;
                  }
                  if ([v192 evaluateWithObject:v62])
                  {
                    v112 = [v54[494] fetchRequestWithEntityName:@"BKLibraryAsset"];
                    v113 = [*v58 predicateWithFormat:@"%K = %@ AND (%K != NULL OR %K != NULL)", @"purchasedAndLocalParent", v62, @"purchaseDate", @"creationDate"];
                    [v112 setPredicate:v113];

                    [v112 setFetchLimit:1];
                    v114 = +[NSSortDescriptor sortDescriptorWithKey:@"purchaseDate" ascending:0];
                    v219[0] = v114;
                    v115 = +[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:0];
                    v219[1] = v115;
                    v116 = +[NSArray arrayWithObjects:v219 count:2];
                    [v112 setSortDescriptors:v116];

                    v117 = [*(id *)(a1 + 40) usq_moc];
                    id v205 = 0;
                    v118 = [v117 executeFetchRequest:v112 error:&v205];
                    id v119 = v205;

                    if (v118)
                    {
                      v120 = [v118 firstObject];
                      v121 = [v120 purchaseDate];
                      if (v121)
                      {
                        [v62 setPurchaseDate:v121];
                      }
                      else
                      {
                        v122 = [v118 firstObject];
                        v123 = [v122 creationDate];
                        [v62 setPurchaseDate:v123];

                        v58 = (id *)NSPredicate_ptr;
                      }
                    }
                    else
                    {
                      v120 = BKLibraryLog();
                      if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412546;
                        v222 = v62;
                        __int16 v223 = 2112;
                        id v224 = v119;
                        _os_log_error_impl(&dword_0, v120, OS_LOG_TYPE_ERROR, "Error fetching modification date for %@ - %@", buf, 0x16u);
                      }
                    }

                    uint64_t v54 = &_s10Foundation12NotificationV6objectypSgvg_ptr;
                    id v59 = v198;
                  }
                  uint64_t v60 = v197;
                  if ([v194 evaluateWithObject:v62]) {
                    [*(id *)(a1 + 40) updateSeriesContainerSeriesStackAssetIDs:v62];
                  }
                  goto LABEL_106;
                }
                v74 = [v62 seriesID];
                v75 = [v195 objectForKeyedSubscript:v74];

                if (!v75)
                {
                  v76 = *(void **)(a1 + 40);
                  v77 = [v62 seriesID];
                  v78 = [*(id *)(a1 + 40) usq_moc];
                  v75 = [v76 seriesContainerForSeriesID:v77 inManagedObjectContext:v78];

                  if (v75)
                  {
                    v79 = [v62 seriesID];
                    [v195 setObject:v75 forKeyedSubscript:v79];

                    goto LABEL_41;
                  }
                  v96 = BKLibraryLog();
                  if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR)) {
                    sub_8FB64((uint64_t)v218, (uint64_t)v62);
                  }
                  v75 = 0;
LABEL_100:

                  goto LABEL_101;
                }
LABEL_41:
                if (([v187 evaluateWithObject:v62] & 1) != 0
                  || ([v184 evaluateWithObject:v62] & 1) != 0
                  || [v183 evaluateWithObject:v62])
                {
                  v80 = [v75 purchasedAndLocalSeriesItems];
                  v81 = (char *)[v80 count];

                  if (v81 == (unsigned char *)&dword_0 + 1)
                  {
                    v82 = [v75 purchasedAndLocalSeriesItems];
                    goto LABEL_48;
                  }
                  v83 = [v75 localOnlySeriesItems];
                  v84 = (char *)[v83 count];

                  if (v84 == (unsigned char *)&dword_0 + 1)
                  {
                    v82 = [v75 localOnlySeriesItems];
LABEL_48:
                    v85 = v82;
                    v86 = [v82 anyObject];

                    v87 = [v86 assetID];
                    [v86 setAssetID:v87];
                  }
                  [*(id *)(a1 + 40) updateSeriesRelationshipsForSeriesAsset:v62];
                  v88 = [v62 seriesID];
                  [v196 setObject:v75 forKeyedSubscript:v88];
                }
                if (([v62 isContainer] & 1) == 0
                  && ([v62 isSeriesItem] & 1) == 0)
                {
                  uint64_t v89 = [v62 modificationDate];
                  if (v89)
                  {
                    v90 = (void *)v89;
                    uint64_t v91 = [v75 modificationDate];
                    if (v91)
                    {
                      v92 = (void *)v91;
                      v93 = [v62 modificationDate];
                      v94 = [v75 modificationDate];
                      v95 = (char *)[v93 compare:v94];

                      v58 = (id *)NSPredicate_ptr;
                      BOOL v138 = v95 == (unsigned char *)&dword_0 + 1;
                      id v59 = v198;
                      if (!v138) {
                        goto LABEL_86;
                      }
                    }
                    else
                    {
                    }
                    v124 = [v62 modificationDate];
                    [v75 setModificationDate:v124];
                  }
                }
LABEL_86:
                uint64_t v125 = [v62 purchaseDate];
                if (v125)
                {
                  v126 = (void *)v125;
                  uint64_t v127 = [v75 purchaseDate];
                  if (v127)
                  {
                    v128 = (void *)v127;
                    v129 = [v62 purchaseDate];
                    v130 = [v75 purchaseDate];
                    v131 = (char *)[v129 compare:v130];

                    v58 = (id *)NSPredicate_ptr;
                    BOOL v138 = v131 == (unsigned char *)&dword_0 + 1;
                    id v59 = v198;
                    if (!v138) {
                      goto LABEL_92;
                    }
                  }
                  else
                  {
                  }
                  v132 = [v62 purchaseDate];
                  [v75 setPurchaseDate:v132];
                }
LABEL_92:
                if ([v75 isNew])
                {
                  v96 = [v54[494] fetchRequestWithEntityName:@"BKLibraryAsset"];
                  id v133 = *v58;
                  v134 = [v75 localOnlySeriesItems];
                  v135 = [v133 predicateWithFormat:@"self IN %@ AND (%K == 1) AND (%K == %@)", v134, @"isNew", @"state", &off_D9E60];
                  [v96 setPredicate:v135];

                  v136 = [*(id *)(a1 + 40) usq_moc];
                  uint64_t v204 = 0;
                  id v137 = [v136 countForFetchRequest:v96 error:&v204];

                  if (v137) {
                    BOOL v138 = v137 == (id)0x7FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    BOOL v138 = 1;
                  }
                  uint64_t v139 = !v138;
                  [v75 setIsNew:v139];
                  goto LABEL_100;
                }
LABEL_101:
                uint64_t v60 = v197;
                if ([v188 evaluateWithObject:v62])
                {
                  [v62 setPurchasedAndLocalParent:0];
                  v140 = [v62 seriesID];
                  [v196 setObject:v75 forKeyedSubscript:v140];
                }
                if ([v189 evaluateWithObject:v62])
                {
                  [v62 setLocalOnlySeriesItemsParent:0];
                  v141 = [v62 seriesID];
                  [v196 setObject:v75 forKeyedSubscript:v141];
                }
              }
            }
LABEL_106:
            long long v61 = (char *)v61 + 1;
          }
          while (v59 != v61);
          id v59 = [obj countByEnumeratingWithState:&v208 objects:v226 count:16];
        }
        while (v59);
      }

      long long v202 = 0u;
      long long v203 = 0u;
      long long v200 = 0u;
      long long v201 = 0u;
      id v142 = v196;
      id v143 = [v142 countByEnumeratingWithState:&v200 objects:v217 count:16];
      if (!v143) {
        goto LABEL_122;
      }
      id v144 = v143;
      uint64_t v145 = *(void *)v201;
LABEL_110:
      uint64_t v146 = 0;
      while (1)
      {
        if (*(void *)v201 != v145) {
          objc_enumerationMutation(v142);
        }
        v147 = [v142 objectForKeyedSubscript:*(void *)(*((void *)&v200 + 1) + 8 * v146)];
        [*(id *)(a1 + 40) _updateAuthorForSeriesContainer:v147];
        v148 = [v147 seriesBooks];
        v149 = (char *)[v148 count];

        if (v149 == (unsigned char *)&dword_0 + 1) {
          break;
        }
        v151 = [v147 purchasedAndLocalSeriesItems];
        v152 = (char *)[v151 count];

        if (v152 == (unsigned char *)&dword_0 + 1)
        {
          v150 = [v147 purchasedAndLocalSeriesItems];
          goto LABEL_119;
        }
        v153 = [v147 localOnlySeriesItems];
        v154 = (char *)[v153 count];

        if (v154 == (unsigned char *)&dword_0 + 1)
        {
          v150 = [v147 localOnlySeriesItems];
          goto LABEL_119;
        }
LABEL_120:

        if (v144 == (id)++v146)
        {
          id v144 = [v142 countByEnumeratingWithState:&v200 objects:v217 count:16];
          if (!v144)
          {
LABEL_122:

            v158 = [*(id *)(a1 + 40) usq_moc];
            [v158 processPendingChanges];

            v159 = [*(id *)(a1 + 40) usq_moc];
            unsigned int v160 = [v159 hasChanges];

            v161 = (void *)v181;
            id v55 = (void *)v182;
            v162 = v179;
            uint64_t v56 = v180;
            BOOL v40 = v168;
            id v37 = v169;
            long long v50 = v166;
            long long v43 = v167;
            if (v160)
            {
              id v53 = [*(id *)(a1 + 40) collectionController];
              v163 = [*(id *)(a1 + 40) usq_moc];
              v164 = [v53 gatherChangedAssetsCollectionsWithLibraryMoc:v163];

              v165 = [*(id *)(a1 + 40) usq_moc];
              [v165 save:0];

              [v53 processGatheredChangedAssetsCollections:v164];
              id v55 = (void *)v182;
              uint64_t v56 = v180;
              goto LABEL_126;
            }
            goto LABEL_127;
          }
          goto LABEL_110;
        }
      }
      v150 = [v147 seriesBooks];
LABEL_119:
      v155 = v150;
      v156 = [v150 anyObject];

      v157 = [v156 assetID];
      [v156 setAssetID:v157];

      goto LABEL_120;
    }
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
      sub_8FAFC();
    }
LABEL_126:
    v162 = v179;

    v161 = (void *)v181;
LABEL_127:
    kdebug_trace();
  }
}

void sub_12424(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v90 = 0;
  uint64_t v5 = [v3 executeFetchRequest:v4 error:&v90];
  id v6 = v90;
  uint64_t v7 = *(void *)(a1 + 40);
  id v89 = v6;
  id v8 = [v3 executeFetchRequest:v7 error:&v89];
  id v9 = v89;

  if (v5)
  {
    uint64_t v56 = v8;
    id v57 = v9;
    id v59 = v3;
    v70 = +[NSMutableSet set];
    v75 = +[NSMutableDictionary dictionary];
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    v58 = v5;
    id obj = v5;
    id v64 = [obj countByEnumeratingWithState:&v85 objects:v103 count:16];
    if (v64)
    {
      uint64_t v68 = 0;
      uint64_t v69 = 0;
      uint64_t v62 = *(void *)v86;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v86 != v62) {
            objc_enumerationMutation(obj);
          }
          uint64_t v66 = v10;
          id v11 = *(id *)(*((void *)&v85 + 1) + 8 * v10);
          long long v81 = 0u;
          long long v82 = 0u;
          long long v83 = 0u;
          long long v84 = 0u;
          id v71 = v11;
          id v73 = [v11 members];
          id v12 = [v73 countByEnumeratingWithState:&v81 objects:v102 count:16];
          if (v12)
          {
            id v13 = v12;
            uint64_t v14 = *(void *)v82;
            do
            {
              for (i = 0; i != v13; i = (char *)i + 1)
              {
                if (*(void *)v82 != v14) {
                  objc_enumerationMutation(v73);
                }
                uint64_t v16 = [*(id *)(*((void *)&v81 + 1) + 8 * i) asset];
                if ([v16 isValid])
                {
                  uint64_t v17 = [v71 collectionID];
                  uint64_t v18 = [v75 objectForKey:v17];
                  if (!v18)
                  {
                    uint64_t v18 = +[NSMutableDictionary dictionary];
                    [v75 setObject:v18 forKey:v17];
                  }
                  id v19 = [v18 objectForKey:@"BookCount"];
                  uint64_t v20 = (char *)[v19 unsignedIntegerValue];

                  uint64_t v21 = +[NSNumber numberWithUnsignedInteger:v20 + 1];
                  [v18 setObject:v21 forKey:@"BookCount"];

                  if ([v16 isCloud])
                  {
                    BOOL v22 = [v18 objectForKey:@"CloudCount"];
                    uint64_t v23 = (char *)[v22 unsignedIntegerValue];

                    unsigned int v24 = +[NSNumber numberWithUnsignedInteger:v23 + 1];
                    [v18 setObject:v24 forKey:@"CloudCount"];

                    ++v69;
                  }
                  if (([v16 isStore] & 1) == 0)
                  {
                    uint64_t v25 = [v18 objectForKey:@"SideLoadedCount"];
                    id v26 = (char *)[v25 unsignedIntegerValue];

                    id v27 = +[NSNumber numberWithUnsignedInteger:v26 + 1];
                    [v18 setObject:v27 forKey:@"SideLoadedCount"];

                    ++v68;
                  }
                  uint64_t v28 = [v16 genre];
                  if (v28) {
                    uint64_t v29 = (__CFString *)v28;
                  }
                  else {
                    uint64_t v29 = @"Unknown";
                  }
                  id v30 = [v18 objectForKey:@"Genres"];
                  if (!v30)
                  {
                    id v30 = +[NSMutableSet set];
                    [v18 setObject:v30 forKey:@"Genres"];
                  }
                  [v30 addObject:v29];
                  [v70 addObject:v29];
                }
              }
              id v13 = [v73 countByEnumeratingWithState:&v81 objects:v102 count:16];
            }
            while (v13);
          }

          uint64_t v10 = v66 + 1;
        }
        while ((id)(v66 + 1) != v64);
        id v64 = [obj countByEnumeratingWithState:&v85 objects:v103 count:16];
      }
      while (v64);
    }
    else
    {
      uint64_t v68 = 0;
      uint64_t v69 = 0;
    }

    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id v31 = v75;
    id v32 = [v31 countByEnumeratingWithState:&v77 objects:v101 count:16];
    if (v32)
    {
      id v33 = v32;
      id v74 = (id)kBKCollectionDefaultAll;
      uint64_t v76 = *(void *)v78;
      uint64_t v72 = kBKCollectionDefaultIDBooks;
      uint64_t v65 = kBKCollectionDefaultIDSamples;
      uint64_t v67 = kBKCollectionDefaultIDWantToRead;
      id obja = (id)kBKCollectionDefaultIDPDFs;
      do
      {
        for (j = 0; j != v33; j = (char *)j + 1)
        {
          if (*(void *)v78 != v76) {
            objc_enumerationMutation(v31);
          }
          uint64_t v35 = *(void **)(*((void *)&v77 + 1) + 8 * (void)j);
          uint64_t v36 = [v31 objectForKeyedSubscript:v35];
          id v37 = [v36 objectForKey:@"BookCount"];
          id v38 = [v37 unsignedIntegerValue];

          id v39 = [v36 objectForKey:@"Genres"];
          id v40 = [v39 count];

          uint64_t v41 = [v36 objectForKey:@"SideLoadedCount"];
          id v42 = [v41 unsignedIntegerValue];

          long long v43 = [v36 objectForKey:@"CloudCount"];
          id v44 = [v43 unsignedIntegerValue];

          CFStringRef v45 = @"All";
          if (([v35 isEqualToString:v74] & 1) == 0)
          {
            CFStringRef v45 = @"Books";
            if (([v35 isEqualToString:v72] & 1) == 0)
            {
              CFStringRef v45 = @"Want to Read";
              if (([v35 isEqualToString:v67] & 1) == 0)
              {
                CFStringRef v45 = @"My Samples";
                if (([v35 isEqualToString:v65] & 1) == 0)
                {
                  CFStringRef v45 = @"PDFs";
                  if (([v35 isEqualToString:obja] & 1) == 0)
                  {
                    if ([v35 isEqualToString:@"Unknown"]) {
                      CFStringRef v45 = @"Unknown";
                    }
                    else {
                      CFStringRef v45 = @"Custom";
                    }
                  }
                }
              }
            }
          }
          long long v46 = BKLibraryLog();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          {
            long long v63 = +[NSNumber numberWithUnsignedInteger:v38];
            long long v47 = +[NSNumber numberWithUnsignedInteger:v40];
            long long v48 = +[NSNumber numberWithUnsignedInteger:v42];
            long long v49 = +[NSNumber numberWithUnsignedInteger:v44];
            *(_DWORD *)buf = 138413314;
            v92 = v63;
            __int16 v93 = 2112;
            CFStringRef v94 = v45;
            __int16 v95 = 2112;
            v96 = v47;
            __int16 v97 = 2112;
            v98 = v48;
            __int16 v99 = 2112;
            v100 = v49;
            _os_log_debug_impl(&dword_0, v46, OS_LOG_TYPE_DEBUG, "Collection: bookCount %@, collectionType = %@, genreCount = %@, sideLoadCount = %@, cloudCount = %@", buf, 0x34u);
          }
        }
        id v33 = [v31 countByEnumeratingWithState:&v77 objects:v101 count:16];
      }
      while (v33);
    }

    long long v50 = BKLibraryLog();
    id v8 = v56;
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
    {
      id v51 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v56 count]);
      +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v31 count]);
      v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
      id v53 = +[NSNumber numberWithUnsignedInteger:[v70 count]];
      uint64_t v54 = +[NSNumber numberWithUnsignedInteger:v68];
      id v55 = +[NSNumber numberWithUnsignedInteger:v69];
      *(_DWORD *)buf = 138413314;
      v92 = v51;
      __int16 v93 = 2112;
      CFStringRef v94 = v52;
      __int16 v95 = 2112;
      v96 = v53;
      __int16 v97 = 2112;
      v98 = v54;
      __int16 v99 = 2112;
      v100 = v55;
      _os_log_debug_impl(&dword_0, v50, OS_LOG_TYPE_DEBUG, "Library: bookCount %@, collectionsCount = %@, genreCount = %@, sideLoadCount = %@, cloudCount = %@", buf, 0x34u);
    }
    uint64_t v5 = v58;
    id v3 = v59;
    id v9 = v57;
  }
  else
  {
    v70 = BKLibraryLog();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
      sub_8FE08();
    }
  }
}

void sub_12DEC(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) newManagedObjectContext];
  id v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"NewMOC 10 %s", "-[BKLibraryManager cleanupDefaultCollections]_block_invoke");
  [v3 setName:v2];

  [*(id *)(a1 + 32) _updateRelationshipsInContext:v3];
  if ([v3 hasChanges]) {
    [v3 save:0];
  }
}

void sub_12EFC(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[NSPredicate predicateWithFormat:@"dateFinished == NULL"];
  id v4 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  uint64_t v5 = [objc_opt_class() predicateFor_All_Finished_LibraryAssets];
  v21[0] = v5;
  v21[1] = v3;
  id v6 = +[NSArray arrayWithObjects:v21 count:2];
  uint64_t v7 = +[NSCompoundPredicate andPredicateWithSubpredicates:v6];
  [v4 setPredicate:v7];

  [v4 setReturnsObjectsAsFaults:0];
  [v4 setFetchBatchSize:32];
  id v19 = 0;
  id v8 = [v2 executeFetchRequest:v4 error:&v19];
  id v9 = v19;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * (void)v14) cleanupDateFinished:(void)v15];
        uint64_t v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v12);
  }
}

id sub_13194(uint64_t a1)
{
  kdebug_trace();
  id v2 = objc_retainBlock(*(id *)(a1 + 40));
  id v3 = v2;
  if (v2) {
    (*((void (**)(id))v2 + 2))(v2);
  }

  kdebug_trace();
  id v4 = *(void **)(a1 + 32);

  return [v4 saveCachedMigrationData];
}

void sub_132F4(id a1)
{
  id v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v1 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v2 = dispatch_queue_create("BKLibrary.reloadQueue", v1);
  id v3 = (void *)qword_EE5B8;
  qword_EE5B8 = (uint64_t)v2;
}

void sub_13378(uint64_t a1)
{
  [*(id *)(a1 + 32) _performReload];
  dispatch_queue_t v2 = BKLibraryLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v12 = 134217984;
    uint64_t v13 = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "%p: updatesScheduleQueue activated after Library Reload", (uint8_t *)&v12, 0xCu);
  }

  id v4 = [*(id *)(a1 + 32) updatesScheduleQueue];
  dispatch_activate(v4);

  uint64_t v5 = [*(id *)(a1 + 32) delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [*(id *)(a1 + 32) delegate];
    [v7 libraryDidReload:*(void *)(a1 + 32)];
  }
  id v8 = BKLibraryPriceTrackingLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Library reload completed, scheduling price tracking update", (uint8_t *)&v12, 2u);
  }

  id v9 = [*(id *)(a1 + 32) priceTracker];
  [v9 setNeedsConfigurationUpdate];

  id v10 = objc_retainBlock(*(id *)(a1 + 40));
  id v11 = v10;
  if (v10) {
    (*((void (**)(id))v10 + 2))(v10);
  }
}

void sub_1360C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = BCSignpostLibrary();
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  char v6 = BCSignpostLibrary();
  uint64_t v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "Reload Library", "", buf, 2u);
  }

  [*(id *)(a1 + 32) setReloading:1];
  id v8 = BKLibraryLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134217984;
    uint64_t v34 = v9;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%p: Library Reload: Unclaim assets", buf, 0xCu);
  }

  kdebug_trace();
  id v10 = *(void **)(a1 + 32);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_13AB0;
  v31[3] = &unk_D1418;
  v31[4] = v10;
  id v11 = v3;
  id v32 = v11;
  [v10 dq_sync:v31];
  kdebug_trace();
  int v12 = [*(id *)(a1 + 32) dataSources];
  objc_sync_enter(v12);
  uint64_t v13 = BKLibraryLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134217984;
    uint64_t v34 = v14;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "%p: Library Reload: Reconcile assets", buf, 0xCu);
  }

  [*(id *)(a1 + 32) wq_reconcileDataSourceAssetsForReason:4 context:v11];
  objc_sync_exit(v12);

  long long v15 = BKLibraryLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134217984;
    uint64_t v34 = v16;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "%p: Library Reload: Integrate assets", buf, 0xCu);
  }

  long long v17 = *(void **)(a1 + 32);
  uint64_t v25 = _NSConcreteStackBlock;
  uint64_t v26 = 3221225472;
  id v27 = sub_13ABC;
  uint64_t v28 = &unk_D1418;
  uint64_t v29 = v17;
  id v18 = v11;
  id v30 = v18;
  [v17 dq_sync:&v25];
  [*(id *)(a1 + 32) setReloading:0 v25, v26, v27, v28, v29];
  id v19 = BKLibraryLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134217984;
    uint64_t v34 = v20;
    _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "%p: Library Reload: Save library", buf, 0xCu);
  }

  kdebug_trace();
  [v18 saveLibrary];
  kdebug_trace();
  uint64_t v21 = BCSignpostLibrary();
  BOOL v22 = v21;
  if (v5 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v22, OS_SIGNPOST_INTERVAL_END, v5, "Reload Library", "", buf, 2u);
  }

  uint64_t v23 = BKLibraryLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v24 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134217984;
    uint64_t v34 = v24;
    _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "%p: Library Reload: Done", buf, 0xCu);
  }
}

void sub_13A90(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_13AB0(uint64_t a1)
{
  return [*(id *)(a1 + 32) dq_unclaimAllLibraryAssetsWithContext:*(void *)(a1 + 40)];
}

uint64_t sub_13ABC(uint64_t a1)
{
  kdebug_trace();
  [*(id *)(a1 + 32) wq_dq_integrateClaimedAssetsReason:4 context:*(void *)(a1 + 40)];

  return kdebug_trace();
}

void sub_13E34(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) dataSources];
  uint64_t v16 = v3;
  id v5 = [v4 indexOfObjectIdenticalTo:v3];
  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = 1 << (char)v5;
  }

  uint64_t v7 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = *(id *)(a1 + 40);
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      int v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v12);
        uint64_t v14 = [*(id *)(a1 + 32) assetUpdatesByIdentifier];
        long long v15 = [v14 objectForKeyedSubscript:v13];

        if (((unint64_t)[v15 dataSourcesBitmask] & v6) != 0) {
          [v7 addObject:v13];
        }

        int v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_14124(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1413C(uint64_t a1)
{
  dispatch_queue_t v2 = [*(id *)(a1 + 32) identifier];
  id v3 = [*(id *)(a1 + 40) coalescedDataSourceReloadByIdentifier];
  uint64_t v4 = [v3 objectForKeyedSubscript:v2];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    objc_initWeak(&location, *(id *)(a1 + 40));
    id v7 = objc_alloc((Class)BUCoalescingCallBlock);
    long long v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    long long v17 = sub_142D4;
    long long v18 = &unk_D1970;
    objc_copyWeak(&v21, &location);
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    id v19 = v8;
    uint64_t v20 = v9;
    id v10 = [v7 initWithNotifyBlock:&v15 blockDescription:@"BKLibraryManager data source reload"];
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    int v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v14 = [*(id *)(a1 + 40) coalescedDataSourceReloadByIdentifier:v15, v16, v17, v18];
    [v14 setObject:v13 forKeyedSubscript:v2];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

void sub_142AC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_142D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1438C;
  v7[3] = &unk_D1900;
  uint64_t v5 = *(void *)(a1 + 32);
  v7[4] = *(void *)(a1 + 40);
  id v8 = v3;
  id v6 = v3;
  [WeakRetained _reloadDataSource:v5 completion:v7];
}

void sub_1438C(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    uint64_t v2 = [*(id *)(a1 + 32) completionQueue];
    dispatch_async(v2, *(dispatch_block_t *)(a1 + 40));
  }
}

id sub_14504(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _performReloadDataSource:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void sub_145DC(id *a1, void *a2)
{
  id v46 = a2;
  v52 = a1;
  id v3 = [a1[4] identifier];
  uint64_t v4 = BKLibraryLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v79 = v3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Performing an on-demand reload on data source %@", buf, 0xCu);
  }

  kdebug_trace();
  kdebug_trace();
  uint64_t v5 = a1 + 5;
  [v52[5] setReloading:1];
  group = dispatch_group_create();
  long long v47 = [v52[5] dataSources];
  id v6 = objc_opt_new();
  id v7 = v52 + 4;
  id v8 = v52[4];
  uint64_t v9 = [v52[5] dataSources];
  id v10 = [v9 indexOfObjectIdenticalTo:v8];
  if (v10 == (id)0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = 1 << (char)v10;
  }

  id v12 = *v5;
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472;
  v72[2] = sub_14CA8;
  v72[3] = &unk_D1A10;
  v72[4] = v12;
  id v73 = *v7;
  id v44 = v3;
  id v74 = v44;
  id v13 = v6;
  id v75 = v13;
  uint64_t v76 = v11;
  [v12 dq_sync:v72];
  id v45 = [v13 copy];
  uint64_t v14 = [*v5 dataSources];
  objc_sync_enter(v14);
  long long v15 = dispatch_group_create();
  dispatch_group_enter(v15);
  id v16 = *v7;
  long long v17 = [*v5 completionQueue];
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472;
  v68[2] = sub_151C8;
  v68[3] = &unk_D1A60;
  id v48 = v13;
  id v69 = v48;
  int8x16_t v49 = *((int8x16_t *)v52 + 2);
  id v18 = (id)v49.i64[0];
  int8x16_t v70 = vextq_s8(v49, v49, 8uLL);
  id v19 = v15;
  id v71 = v19;
  sub_14E60(v16, v17, v68);

  dispatch_group_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
  objc_sync_exit(v14);

  if ([v48 count])
  {
    uint64_t v20 = objc_opt_new();
    id v21 = v52[5];
    BOOL v22 = [v21 dataSources];
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = sub_15370;
    v66[3] = &unk_D1A88;
    id v23 = v20;
    id v67 = v23;
    [v21 _enumerateDataSources:v22 intersectingWithAssetIDs:v48 usingBlock:v66];

    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v24 = v47;
    id v25 = [v24 countByEnumeratingWithState:&v62 objects:v77 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v63;
      id v50 = v24;
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v63 != v26) {
            objc_enumerationMutation(v24);
          }
          id v28 = *(id *)(*((void *)&v62 + 1) + 8 * i);
          uint64_t v29 = [v28 identifier];
          id v30 = [v23 objectForKeyedSubscript:v29];
          id v31 = [v24 indexOfObjectIdenticalTo:v28];
          if (v31 == (id)0x7FFFFFFFFFFFFFFFLL) {
            uint64_t v32 = 0;
          }
          else {
            uint64_t v32 = 1 << (char)v31;
          }
          if ([v30 count] && v28 != v52[4])
          {
            dispatch_group_enter(group);
            v57[0] = _NSConcreteStackBlock;
            v57[1] = 3221225472;
            v57[2] = sub_15560;
            v57[3] = &unk_D1B00;
            v57[4] = v28;
            uint64_t v33 = v26;
            id v34 = v23;
            id v35 = v30;
            id v36 = v52[5];
            id v58 = v35;
            id v59 = v36;
            uint64_t v61 = v32;
            id v24 = v50;
            uint64_t v60 = group;
            id v37 = v35;
            id v23 = v34;
            uint64_t v26 = v33;
            sub_153E4(v37, v28, v57);
          }
        }
        id v25 = [v24 countByEnumeratingWithState:&v62 objects:v77 count:16];
      }
      while (v25);
    }
  }
  dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
  id v38 = v52[5];
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  void v53[2] = sub_1584C;
  v53[3] = &unk_D1A38;
  id v39 = v45;
  id v40 = v52[5];
  id v54 = v39;
  id v55 = v40;
  id v41 = v46;
  id v56 = v41;
  [v38 dq_sync:v53];
  [v52[5] setReloading:0];
  kdebug_trace();
  kdebug_trace();
  [v41 saveLibrary];
  id v42 = objc_retainBlock(v52[6]);
  long long v43 = v42;
  if (v42) {
    (*((void (**)(id))v42 + 2))(v42);
  }
}

void sub_14C8C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_14CA8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 40);
  id v3 = +[NSArray arrayWithObjects:&v13 count:1];
  uint64_t v4 = [*(id *)(a1 + 32) assetUpdatesByIdentifier];
  uint64_t v5 = [v4 allKeys];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_14DE4;
  v8[3] = &unk_D19E8;
  id v9 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 32);
  id v10 = v6;
  uint64_t v11 = v7;
  uint64_t v12 = *(void *)(a1 + 64);
  [v2 _enumerateDataSources:v3 intersectingWithAssetIDs:v5 usingBlock:v8];
}

void sub_14DE4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = BKLibraryLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_8FE70(a1, v5);
  }

  [*(id *)(a1 + 40) addObjectsFromArray:v5];
  [*(id *)(a1 + 48) dq_unclaimIdentifiers:v5 forDataSourceBitmask:*(void *)(a1 + 56)];
}

void sub_14E60(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v8 = [v5 identifier];
  id v9 = BKLibraryLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v27 = v8;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "#datasource Step 0: fetchAssets from: %{public}@", buf, 0xCu);
  }

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_3D3CC;
  v22[3] = &unk_D2758;
  id v10 = v6;
  id v23 = v10;
  id v11 = v8;
  id v24 = v11;
  id v12 = v7;
  id v25 = v12;
  uint64_t v13 = objc_retainBlock(v22);
  if ([v5 isEnabled])
  {
    if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
    {
      uint64_t v14 = BKLibraryLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v27 = v11;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "#datasource fetchAssets Step 1: fetching asset IDs from: %{public}@", buf, 0xCu);
      }

      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_3D5BC;
      v18[3] = &unk_D2758;
      id v19 = v5;
      id v20 = v11;
      id v21 = v13;
      [v19 fetchAssetIDsWithCompletion:v18];
    }
    else
    {
      id v16 = BKLibraryLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        long long v17 = [v5 identifier];
        *(_DWORD *)buf = 138543362;
        id v27 = v17;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "#datasource fetchAssets Step 1-2: fetching assets from: %{public}@", buf, 0xCu);
      }
      [v5 fetchAssetsWithCompletion:v13];
    }
  }
  else
  {
    long long v15 = BKLibraryLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v27 = v11;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "#datasource fetchAssets skipping disabled: %{public}@", buf, 0xCu);
    }

    ((void (*)(void *, void, void))v13[2])(v13, 0, 0);
  }
}

void sub_151C8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = [v5 valueForKey:@"assetID"];
    id v9 = [v8 bu_arrayByRemovingNSNulls];
    [v7 addObjectsFromArray:v9];

    id v10 = *(void **)(a1 + 32);
    id v11 = [v5 valueForKey:@"temporaryAssetID"];
    id v12 = [v11 bu_arrayByRemovingNSNulls];
    [v10 addObjectsFromArray:v12];

    uint64_t v13 = *(void **)(a1 + 40);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    void v15[2] = sub_1535C;
    v15[3] = &unk_D1A38;
    v15[4] = v13;
    id v16 = *(id *)(a1 + 48);
    id v17 = v5;
    [v13 dq_sync:v15];
  }
  else if (v6)
  {
    uint64_t v14 = BKLibraryLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_8FF14();
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

id sub_1535C(uint64_t a1)
{
  return [*(id *)(a1 + 32) dq_libraryDataSource:*(void *)(a1 + 40) reconcileAssets:*(void *)(a1 + 48) reason:4];
}

void sub_15370(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a4;
  id v7 = [a2 identifier];
  [v5 setObject:v6 forKeyedSubscript:v7];
}

void sub_153E4(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if ([v6 isEnabled])
  {
    if (objc_opt_respondsToSelector())
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      void v14[2] = sub_3DA28;
      v14[3] = &unk_D2780;
      id v15 = v7;
      [v6 fetchAssetsWithIDs:v5 completion:v14];
      id v8 = v15;
    }
    else
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_3DAA8;
      v11[3] = &unk_D27A8;
      id v12 = v5;
      id v13 = v7;
      [v6 fetchAssetsWithCompletion:v11];

      id v8 = v12;
    }
  }
  else
  {
    id v9 = objc_retainBlock(v7);
    id v10 = v9;
    if (v9) {
      (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
    }
  }
}

void sub_15560(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1573C;
  v26[3] = &unk_D1AB0;
  id v6 = *(void **)(a1 + 40);
  v26[4] = *(void *)(a1 + 32);
  id v27 = v6;
  id v7 = [a2 bu_arrayByRemovingNSNullsInvokingBlockForNulls:v26];
  id v8 = [*(id *)(a1 + 40) mutableCopy];
  id v9 = [v7 valueForKey:@"assetID"];
  id v10 = [v9 bu_arrayByRemovingNSNulls];
  [v8 removeObjectsInArray:v10];

  id v11 = [v7 valueForKey:@"temporaryAssetID"];
  id v12 = [v11 bu_arrayByRemovingNSNulls];
  [v8 removeObjectsInArray:v12];

  id v13 = *(void **)(a1 + 48);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_15798;
  v19[3] = &unk_D1AD8;
  id v20 = v8;
  id v21 = v13;
  uint64_t v14 = *(void *)(a1 + 64);
  uint64_t v15 = *(void *)(a1 + 32);
  id v22 = v7;
  uint64_t v23 = v15;
  id v24 = v5;
  uint64_t v25 = v14;
  id v16 = v5;
  id v17 = v7;
  id v18 = v8;
  [v13 dq_sync:v19];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void sub_1573C()
{
  v0 = BKLibraryLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    sub_8FF88();
  }
}

void sub_15798(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count]) {
    [*(id *)(a1 + 40) dq_unclaimIdentifiers:*(void *)(a1 + 32) forDataSourceBitmask:*(void *)(a1 + 72)];
  }
  if ([*(id *)(a1 + 48) count])
  {
    uint64_t v3 = *(void *)(a1 + 48);
    uint64_t v2 = *(void *)(a1 + 56);
    uint64_t v4 = *(void **)(a1 + 40);
    [v4 dq_libraryDataSource:v2 reconcileAssets:v3 reason:4];
  }
  else if (*(void *)(a1 + 64))
  {
    id v5 = BKLibraryLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_90044();
    }
  }
}

id sub_1584C(uint64_t a1)
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v6);
        id v8 = [*(id *)(a1 + 40) assetUpdatesByIdentifier:v14];
        id v9 = [v8 objectForKeyedSubscript:v7];

        if (![v9 dataSourcesBitmask])
        {
          id v10 = [*(id *)(a1 + 40) unclaimedAssetIDs];
          [v10 addObject:v7];

          id v11 = [*(id *)(a1 + 40) unclaimedTemporaryAssetIDs];
          [v11 addObject:v7];

          id v12 = [*(id *)(a1 + 40) assetUpdatesByIdentifier];
          [v12 removeObjectForKey:v7];
        }
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }

  return [*(id *)(a1 + 40) wq_dq_integrateClaimedAssetsReason:4 context:*(void *)(a1 + 48)];
}

void sub_15D10(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v7 = *(void **)(a1 + 32);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_15E58;
  v10[3] = &unk_D1B78;
  objc_copyWeak(&v15, &location);
  char v16 = *(unsigned char *)(a1 + 56);
  id v11 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 48);
  id v8 = v5;
  id v12 = v8;
  id v9 = v6;
  id v13 = v9;
  [v7 addCustomOperationBlock:v10];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void sub_15E3C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_15E58(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained completionQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_15F58;
    block[3] = &unk_D1B50;
    char v10 = *(unsigned char *)(a1 + 72);
    id v6 = *(id *)(a1 + 32);
    id v9 = *(id *)(a1 + 56);
    id v7 = *(id *)(a1 + 40);
    id v8 = *(id *)(a1 + 48);
    dispatch_async(v4, block);
  }
}

void sub_15F58(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64)) {
    [*(id *)(a1 + 32) stopAccessingSecurityScopedResource];
  }
  id v2 = objc_retainBlock(*(id *)(a1 + 56));
  if (v2)
  {
    id v3 = v2;
    (*((void (**)(id, void, void))v2 + 2))(v2, *(void *)(a1 + 40), *(void *)(a1 + 48));
    id v2 = v3;
  }
}

void sub_1616C(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  [v3 setResultType:2];
  id v4 = +[NSDate dateWithTimeIntervalSince1970:1270202400.0];
  id v5 = +[NSPredicate predicateWithFormat:@"%K != NULL AND %K > %@", @"purchaseDate", @"purchaseDate", v4];
  id v6 = +[BKLibraryManager predicateForDownloadableStoreLibraryAssets];
  id v7 = +[BKLibraryManager predicateToExcludeSeriesLibraryAssets];
  v25[0] = v5;
  v25[1] = v6;
  v25[2] = v7;
  id v8 = +[NSArray arrayWithObjects:v25 count:3];
  id v9 = +[NSCompoundPredicate andPredicateWithSubpredicates:v8];
  [v3 setPredicate:v9];

  id v10 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"purchaseDate" ascending:1];
  id v24 = v10;
  id v11 = +[NSArray arrayWithObjects:&v24 count:1];
  [v3 setSortDescriptors:v11];

  CFStringRef v23 = @"purchaseDate";
  id v12 = +[NSArray arrayWithObjects:&v23 count:1];
  [v3 setPropertiesToFetch:v12];

  [v3 setFetchLimit:1];
  id v22 = 0;
  id v13 = [v2 executeFetchRequest:v3 error:&v22];

  id v14 = v22;
  if (v14)
  {
    id v15 = BKLibraryLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_900B4();
    }
  }
  objc_opt_class();
  char v16 = [v13 firstObject];
  long long v17 = [v16 objectForKeyedSubscript:@"purchaseDate"];
  id v18 = BUDynamicCast();

  id v19 = objc_retainBlock(*(id *)(a1 + 32));
  id v20 = v19;
  if (v19) {
    (*((void (**)(id, void *))v19 + 2))(v19, v18);
  }
}

void sub_16600(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 40))
  {
    id v4 = [*(id *)(a1 + 32) completionQueue];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_166CC;
    v5[3] = &unk_D1900;
    id v7 = *(id *)(a1 + 40);
    id v6 = v3;
    dispatch_async(v4, v5);
  }
}

uint64_t sub_166CC(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_16878(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v7 = *(void **)(a1 + 32);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_169A4;
  v10[3] = &unk_D1C40;
  objc_copyWeak(&v14, &location);
  id v13 = *(id *)(a1 + 40);
  id v8 = v5;
  id v11 = v8;
  id v9 = v6;
  id v12 = v9;
  [v7 addCustomOperationBlock:v10];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void sub_16988(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_169A4(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained completionQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_16A88;
    block[3] = &unk_D1C18;
    id v8 = a1[6];
    id v6 = a1[4];
    id v7 = a1[5];
    dispatch_async(v4, block);
  }
}

void sub_16A88(uint64_t a1)
{
  id v2 = objc_retainBlock(*(id *)(a1 + 48));
  if (v2)
  {
    id v3 = v2;
    (*((void (**)(id, void, void))v2 + 2))(v2, *(void *)(a1 + 32), *(void *)(a1 + 40));
    id v2 = v3;
  }
}

void sub_16C0C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v7 = *(void **)(a1 + 32);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_16D38;
  v10[3] = &unk_D1C40;
  objc_copyWeak(&v14, &location);
  id v13 = *(id *)(a1 + 40);
  id v8 = v5;
  id v11 = v8;
  id v9 = v6;
  id v12 = v9;
  [v7 addCustomOperationBlock:v10];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void sub_16D1C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_16D38(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained completionQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_16E1C;
    block[3] = &unk_D1C18;
    id v8 = a1[6];
    id v6 = a1[4];
    id v7 = a1[5];
    dispatch_async(v4, block);
  }
}

void sub_16E1C(uint64_t a1)
{
  id v2 = objc_retainBlock(*(id *)(a1 + 48));
  if (v2)
  {
    id v3 = v2;
    (*((void (**)(id, void, void))v2 + 2))(v2, *(void *)(a1 + 32), *(void *)(a1 + 40));
    id v2 = v3;
  }
}

void sub_17040(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v10 = *(void **)(a1 + 32);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  void v14[2] = sub_17198;
  v14[3] = &unk_D1CB8;
  objc_copyWeak(&v19, &location);
  id v18 = *(id *)(a1 + 40);
  id v11 = v7;
  id v15 = v11;
  id v12 = v8;
  id v16 = v12;
  id v13 = v9;
  id v17 = v13;
  [v10 addCustomOperationBlock:v14];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void sub_1717C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_17198(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 8);
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained completionQueue];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_17290;
    v5[3] = &unk_D1C90;
    id v9 = a1[7];
    id v6 = a1[4];
    id v7 = a1[5];
    id v8 = a1[6];
    dispatch_async(v4, v5);
  }
}

void sub_17290(uint64_t a1)
{
  id v2 = objc_retainBlock(*(id *)(a1 + 56));
  if (v2)
  {
    id v3 = v2;
    (*((void (**)(id, void, void, void))v2 + 2))(v2, *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48));
    id v2 = v3;
  }
}

void sub_173B4(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  id v5 = a2;
  id v6 = [v3 libraryMutableAssetWithAssetID:v4 inManagedObjectContext:v5];
  [v6 setUrl:a1[6]];
  [v5 saveLibrary];
}

void sub_175C8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) completionQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_176B0;
  block[3] = &unk_D1C18;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void sub_176B0(uint64_t a1)
{
  id v2 = objc_retainBlock(*(id *)(a1 + 48));
  if (v2)
  {
    id v3 = v2;
    (*((void (**)(id, void, void))v2 + 2))(v2, *(void *)(a1 + 32), *(void *)(a1 + 40));
    id v2 = v3;
  }
}

void sub_1789C(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id v9 = [*(id *)(a1 + 32) completionQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_17994;
  v13[3] = &unk_D1D30;
  id v10 = *(id *)(a1 + 40);
  id v15 = v8;
  id v16 = v10;
  char v17 = a3;
  id v14 = v7;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(v9, v13);
}

void sub_17994(uint64_t a1)
{
  id v2 = objc_retainBlock(*(id *)(a1 + 48));
  if (v2)
  {
    id v3 = v2;
    (*((void (**)(id, void, void, void))v2 + 2))(v2, *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 40));
    id v2 = v3;
  }
}

void sub_17AA8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) assetID];
  if ([v2 length])
  {
    id v3 = [*(id *)(a1 + 40) ownershipObservers];
    id v4 = [v3 objectForKeyedSubscript:v2];

    if (!v4)
    {
      id v4 = objc_alloc_init((Class)NSMutableArray);
      id v5 = [*(id *)(a1 + 40) ownershipObservers];
      [v5 setObject:v4 forKeyedSubscript:v2];
    }
    if ([v4 indexOfObjectIdenticalTo:*(void *)(a1 + 32)] == (id)0x7FFFFFFFFFFFFFFFLL) {
      [v4 addObject:*(void *)(a1 + 32)];
    }
  }
  else
  {
    id v6 = BKLibraryLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_9011C();
    }
  }
}

void sub_17C4C(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) assetID];
  id v2 = [*(id *)(a1 + 40) ownershipObservers];
  id v3 = [v2 objectForKeyedSubscript:v5];

  [v3 removeObjectIdenticalTo:*(void *)(a1 + 32)];
  if (![v3 count])
  {
    id v4 = [*(id *)(a1 + 40) ownershipObservers];
    [v4 removeObjectForKey:v5];
  }
}

void sub_17DE8(id *a1)
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = a1[4];
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v6);
        id v8 = [a1[5] ownershipObservers];
        id v9 = [v8 objectForKeyedSubscript:v7];
        id v10 = [v9 copy];

        if (v10) {
          [a1[6] setObject:v10 forKey:v7];
        }

        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

void sub_17F2C(id a1, NSString *a2, NSArray *a3, BOOL *a4)
{
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) notify];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

void sub_188B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,id location)
{
  _Block_object_dispose((const void *)(v41 - 192), 8);
  objc_destroyWeak(v40);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18930(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained libraryAssetOnMainQueueWithPermanentOrTemporaryAssetID:*(void *)(a1 + 32)];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_189EC;
  v4[3] = &unk_D1DC0;
  id v5 = *(id *)(a1 + 40);
  [WeakRetained assetForLibraryAsset:v3 completion:v4];
}

void sub_189EC(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10 && [v10 state] == 1)
  {
    id v6 = (void (**)(void))objc_retainBlock(*(id *)(a1 + 32));
    uint64_t v7 = v6;
    if (!v6) {
      goto LABEL_8;
    }
    id v8 = v6[2];
  }
  else
  {
    long long v9 = (void (**)(void))objc_retainBlock(*(id *)(a1 + 32));
    uint64_t v7 = v9;
    if (!v9) {
      goto LABEL_8;
    }
    id v8 = v9[2];
  }
  v8();
LABEL_8:
}

void sub_18AA8(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_18B94;
  block[3] = &unk_D1E10;
  objc_copyWeak(&v11, (id *)(a1 + 56));
  id v8 = *(id *)(a1 + 32);
  id v9 = v3;
  long long v6 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v6;
  long long v10 = v6;
  id v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v11);
}

void sub_18B94(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v3 = [WeakRetained libraryAssetOnMainQueueWithPermanentOrTemporaryAssetID:*(void *)(a1 + 32)];
  id v4 = BKLibraryLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 141558786;
    uint64_t v8 = 1752392040;
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    long long v12 = v3;
    __int16 v13 = 1024;
    unsigned int v14 = [v3 isDownloading];
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "[%{mask.hash}@] waitForAssetToFinishDownloadWithAssetID: state observer notifed - libraryAsset: %@, isDownloading: %{BOOL}d", (uint8_t *)&v7, 0x26u);
  }

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v3 == 0;
  }
  if (!v6 && ([v3 isDownloading] & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    [WeakRetained _removeDataSourceIdentifierAndStateObserver:*(void *)(a1 + 40)];
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
}

void sub_18CE8(uint64_t a1)
{
}

void sub_18E78(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = [*(id *)(a1 + 32) completionQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_18F60;
  block[3] = &unk_D1C18;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void sub_18F60(uint64_t a1)
{
  id v2 = objc_retainBlock(*(id *)(a1 + 48));
  if (v2)
  {
    id v3 = v2;
    (*((void (**)(id, void, void))v2 + 2))(v2, *(void *)(a1 + 32), *(void *)(a1 + 40));
    id v2 = v3;
  }
}

void sub_192D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
}

void sub_19300(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a3);
  }
  else if ([v5 count])
  {
    int v7 = [*(id *)(a1 + 32) completionQueue];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1941C;
    v10[3] = &unk_D1E88;
    id v8 = *(id *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    id v11 = v8;
    uint64_t v12 = v9;
    id v13 = v5;
    id v14 = *(id *)(a1 + 56);
    dispatch_async(v7, v10);

    goto LABEL_6;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
LABEL_6:
}

void sub_1941C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [*(id *)(a1 + 40) rank]);
  [v2 setObject:v3 forKeyedSubscript:v4];

  id v5 = *(NSObject **)(a1 + 56);

  dispatch_group_leave(v5);
}

void sub_19494(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) allKeys];
  uint64_t v3 = [v2 sortedArrayUsingSelector:"compare:"];

  id v30 = objc_opt_new();
  id v4 = objc_opt_new();
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v3;
  id v27 = [obj countByEnumeratingWithState:&v36 objects:v47 count:16];
  if (v27)
  {
    uint64_t v26 = *(void *)v37;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v37 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = v5;
        uint64_t v6 = *(void *)(*((void *)&v36 + 1) + 8 * v5);
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v31 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
        id v7 = [v31 countByEnumeratingWithState:&v32 objects:v46 count:16];
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = *(void *)v33;
          do
          {
            for (i = 0; i != v8; i = (char *)i + 1)
            {
              if (*(void *)v33 != v9) {
                objc_enumerationMutation(v31);
              }
              id v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
              uint64_t v12 = [v11 url];
              if (v12)
              {
                if (([v4 containsObject:v12] & 1) == 0)
                {
                  [v30 addObject:v11];
                  [v4 addObject:v12];
                }
              }
              else
              {
                id v13 = BKLibraryLog();
                if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
                {
                  uint64_t v29 = *(void *)(a1 + 40);
                  id v21 = [v11 assetID];
                  id v22 = [v11 dataSourceIdentifier];
                  *(_DWORD *)buf = 138412802;
                  uint64_t v41 = v29;
                  __int16 v42 = 2112;
                  long long v43 = v21;
                  __int16 v44 = 2112;
                  id v45 = v22;
                  _os_log_fault_impl(&dword_0, v13, OS_LOG_TYPE_FAULT, "Asset part is missing URL, assetID=%@, partID=%@, dataSourceID=%@", buf, 0x20u);
                }
                uint64_t v14 = *(void *)(a1 + 40);
                id v15 = [v11 assetID];
                id v16 = [v11 dataSourceIdentifier];
                char v17 = +[NSString stringWithFormat:@"Asset part is missing URL, assetID=%@, partID=%@, dataSourceID=%@", v14, v15, v16];

                uint64_t v18 = +[NSError bu_errorWithDomain:@"BKLibraryErrorDomain" code:2 description:v17 underlyingError:0];
                uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
                id v20 = *(void **)(v19 + 40);
                *(void *)(v19 + 40) = v18;
              }
            }
            id v8 = [v31 countByEnumeratingWithState:&v32 objects:v46 count:16];
          }
          while (v8);
        }

        uint64_t v5 = v28 + 1;
      }
      while ((id)(v28 + 1) != v27);
      id v27 = [obj countByEnumeratingWithState:&v36 objects:v47 count:16];
    }
    while (v27);
  }

  id v23 = objc_retainBlock(*(id *)(a1 + 48));
  id v24 = v23;
  if (v23) {
    (*((void (**)(id, void *, void))v23 + 2))(v23, v30, *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  }
}

void sub_199B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_199CC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    [WeakRetained p_deleteAssets:*(void *)(a1 + 32) exhaustive:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 40)];
  }
  else
  {
    id v2 = objc_retainBlock(*(id *)(a1 + 40));
    uint64_t v3 = v2;
    if (v2) {
      (*((void (**)(id))v2 + 2))(v2);
    }
  }
}

void sub_19F84(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [*(id *)(a1 + 32) libraryAssetsWithAssetIDsContainedInList:*(void *)(a1 + 40) tempAssetIDs:*(void *)(a1 + 48) inManagedObjectContext:v3];
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v8);
        id v10 = BKLibraryLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          id v11 = [v9 title];
          uint64_t v12 = [v9 assetID];
          *(_DWORD *)buf = 138412546;
          uint64_t v18 = v11;
          __int16 v19 = 2112;
          id v20 = v12;
          _os_log_debug_impl(&dword_0, v10, OS_LOG_TYPE_DEBUG, "Delete Asset from BKLibraryManager (p_deleteAssets) %@ [%@]", buf, 0x16u);
        }
        [*(id *)(a1 + 32) archiveTransientProperties:v9];
        [v3 deleteObject:v9];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v6);
  }

  [*(id *)(a1 + 32) saveCachedMigrationData];
}

void sub_1A1D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

id sub_1A310(uint64_t a1, void *a2)
{
  return _[a2 conformsToProtocol:*(void *)(a1 + 32)];
}

id sub_1A3CC(uint64_t a1, void *a2)
{
  return _[a2 conformsToProtocol:*(void *)(a1 + 32)];
}

uint64_t _bk_compareBitmaskPriority(unint64_t a1, unint64_t a2)
{
  if (a1 == a2) {
    return 0;
  }
  unint64_t v3 = __clz(__rbit64(a1));
  BOOL v4 = a1 == 0;
  if (a1) {
    unint64_t v5 = v3 + 1;
  }
  else {
    unint64_t v5 = 0;
  }
  unint64_t v6 = __clz(__rbit64(a2));
  if (a2) {
    unint64_t v7 = v6 + 1;
  }
  else {
    unint64_t v7 = 0;
  }
  if (v5 == v7)
  {
    BOOL v4 = 1;
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = -1;
  }
  if (v4) {
    uint64_t result = v8;
  }
  else {
    uint64_t result = 1;
  }
  if (a2)
  {
    BOOL v9 = v5 >= v7;
    uint64_t v10 = 1;
    if (v9) {
      uint64_t v10 = -1;
    }
    if (!v4) {
      return v10;
    }
  }
  return result;
}

void sub_1AC0C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) valueForKey:@"assetID"];
  [v2 bu_arrayByRemovingNSNulls];
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  unint64_t v3 = [*(id *)(a1 + 32) valueForKey:@"temporaryAssetID"];
  BOOL v4 = [v3 bu_arrayByRemovingNSNulls];

  [*(id *)(a1 + 40) _libraryDataSource:*(void *)(a1 + 48) removedAssetsWithAssetIDs:v5 orTemporaryAssetIDs:v4];
}

id sub_1ADA0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _libraryDataSource:*(void *)(a1 + 40) removedAssetsWithAssetIDs:*(void *)(a1 + 48) orTemporaryAssetIDs:*(void *)(a1 + 56)];
}

void sub_1AF64(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = BKLibraryLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_90220();
  }

  uint64_t v5 = [*(id *)(a1 + 48) identifier];
  id v6 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  uint64_t v61 = (void *)v5;
  unint64_t v7 = [*(id *)(a1 + 56) predicateForDataSourceIdentifierTaggedLibraryAssets:v5];
  if ([*(id *)(a1 + 32) count] && objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    uint64_t v8 = [*(id *)(a1 + 56) predicateForAssetIDsTaggedLibraryAssets:*(void *)(a1 + 32)];
    BOOL v9 = +[BKLibraryManager predicateForTemporaryAssetIDsTaggedLibraryAssets:*(void *)(a1 + 40)];
    v79[0] = v8;
    v79[1] = v9;
    uint64_t v10 = +[NSArray arrayWithObjects:v79 count:2];
    id v11 = +[NSCompoundPredicate orPredicateWithSubpredicates:v10];

    v78[0] = v7;
    v78[1] = v11;
    uint64_t v12 = +[NSArray arrayWithObjects:v78 count:2];
    long long v13 = +[NSCompoundPredicate andPredicateWithSubpredicates:v12];
    [v6 setPredicate:v13];
  }
  else
  {
    if ([*(id *)(a1 + 32) count])
    {
      uint64_t v14 = [*(id *)(a1 + 56) predicateForAssetIDsTaggedLibraryAssets:*(void *)(a1 + 32)];
    }
    else
    {
      if (![*(id *)(a1 + 40) count])
      {
        id v50 = +[NSPredicate predicateWithValue:0];
        [v6 setPredicate:v50];

        BCReportAssertionFailureWithMessage();
        goto LABEL_12;
      }
      uint64_t v14 = +[BKLibraryManager predicateForTemporaryAssetIDsTaggedLibraryAssets:*(void *)(a1 + 40)];
    }
    uint64_t v8 = (void *)v14;
    [v6 setPredicate:v14];
  }

LABEL_12:
  v77[0] = @"assetID";
  v77[1] = @"temporaryAssetID";
  long long v15 = +[NSArray arrayWithObjects:v77 count:2];
  [v6 setPropertiesToFetch:v15];

  [v6 setResultType:2];
  long long v16 = objc_opt_new();
  id v71 = 0;
  char v17 = [v3 executeFetchRequest:v6 error:&v71];
  id v60 = v71;
  if (!v17)
  {
    int8x16_t v49 = BKLibraryLog();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      sub_901B8();
    }

    goto LABEL_69;
  }
  if (![v17 count]) {
    goto LABEL_69;
  }
  long long v62 = v16;
  id v56 = v7;
  id v57 = v6;
  id v58 = v3;
  id v59 = v17;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v18 = v17;
  id v19 = [v18 countByEnumeratingWithState:&v67 objects:v76 count:16];
  if (!v19) {
    goto LABEL_58;
  }
  id v20 = v19;
  uint64_t v21 = *(void *)v68;
  do
  {
    for (i = 0; i != v20; i = (char *)i + 1)
    {
      if (*(void *)v68 != v21) {
        objc_enumerationMutation(v18);
      }
      id v23 = *(void **)(*((void *)&v67 + 1) + 8 * i);
      uint64_t v24 = [v23 objectForKeyedSubscript:@"assetID"];
      uint64_t v25 = [v23 objectForKeyedSubscript:@"temporaryAssetID"];
      if (!(v24 | v25))
      {
        BCReportAssertionFailureWithMessage();
        goto LABEL_56;
      }
      if (!v24)
      {
        id v27 = 0;
LABEL_25:
        if (v25)
        {
          uint64_t v28 = [*(id *)(a1 + 56) assetUpdatesByIdentifier];
          id v27 = [v28 objectForKeyedSubscript:v25];
        }
        goto LABEL_27;
      }
      uint64_t v26 = [*(id *)(a1 + 56) assetUpdatesByIdentifier];
      id v27 = [v26 objectForKeyedSubscript:v24];

      if (!v27) {
        goto LABEL_25;
      }
LABEL_27:
      if (v27)
      {
        uint64_t v29 = *(void *)(a1 + 48);
        id v30 = [*(id *)(a1 + 56) dataSources];
        id v31 = [v30 indexOfObjectIdenticalTo:v29];
        if (v31 == (id)0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v32 = 0;
        }
        else {
          uint64_t v32 = 1 << (char)v31;
        }

        [*(id *)(a1 + 56) _removeBitmask:v32 fromUpdate:v27 inMethod:*(void *)(a1 + 64)];
      }
      else
      {
        if (v24) {
          uint64_t v33 = v24;
        }
        else {
          uint64_t v33 = v25;
        }
        uint64_t v55 = v33;
        BCReportAssertionFailureWithMessage();
      }
      if (objc_msgSend(v27, "dataSourcesBitmask", v55))
      {
        if (v24) {
          [v62 addObject:v24];
        }
        if (v25) {
          [v62 addObject:v25];
        }
      }
      else
      {
        if (v24)
        {
          long long v34 = [*(id *)(a1 + 56) assetUpdatesByIdentifier];
          [v34 removeObjectForKey:v24];
        }
        if (v25)
        {
          long long v35 = [*(id *)(a1 + 56) assetUpdatesByIdentifier];
          [v35 removeObjectForKey:v25];
        }
      }
      if (v24)
      {
        long long v36 = BKLibraryLog();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          id v73 = v61;
          __int16 v74 = 2112;
          uint64_t v75 = v24;
          _os_log_debug_impl(&dword_0, v36, OS_LOG_TYPE_DEBUG, "{%@} disowning asset {%@}", buf, 0x16u);
        }

        long long v37 = [*(id *)(a1 + 56) unclaimedAssetIDs];
        [v37 addObject:v24];

        if (v27)
        {
          long long v38 = [*(id *)(a1 + 56) assetUpdatesByIdentifier];
          [v38 setObject:v27 forKeyedSubscript:v24];

          long long v39 = [*(id *)(a1 + 56) identifiersForAssetsNeedingReconcile];
          [v39 addObject:v24];
        }
      }
      if (v25)
      {
        id v40 = BKLibraryLog();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          id v73 = v61;
          __int16 v74 = 2112;
          uint64_t v75 = v25;
          _os_log_debug_impl(&dword_0, v40, OS_LOG_TYPE_DEBUG, "{%@} disowning asset {%@}", buf, 0x16u);
        }

        uint64_t v41 = [*(id *)(a1 + 56) unclaimedTemporaryAssetIDs];
        [v41 addObject:v25];

        if (v27)
        {
          __int16 v42 = [*(id *)(a1 + 56) assetUpdatesByIdentifier];
          [v42 setObject:v27 forKeyedSubscript:v25];

          long long v43 = [*(id *)(a1 + 56) identifiersForAssetsNeedingReconcile];
          [v43 addObject:v25];
        }
      }

LABEL_56:
    }
    id v20 = [v18 countByEnumeratingWithState:&v67 objects:v76 count:16];
  }
  while (v20);
LABEL_58:

  long long v16 = v62;
  if ([v62 count])
  {
    dispatch_group_t v44 = dispatch_group_create();
    id v45 = *(void **)(a1 + 56);
    id v46 = [v45 dataSources];
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472;
    v65[2] = sub_1B870;
    v65[3] = &unk_D1F50;
    v65[4] = *(void *)(a1 + 56);
    dispatch_group_t v66 = v44;
    long long v47 = v44;
    [v45 _enumerateDataSources:v46 intersectingWithAssetIDs:v62 usingBlock:v65];

    dispatch_group_wait(v47, 0xFFFFFFFFFFFFFFFFLL);
  }
  id v6 = v57;
  id v3 = v58;
  unint64_t v7 = v56;
  char v17 = v59;
  if ([v62 count]) {
    goto LABEL_68;
  }
  id v48 = [*(id *)(a1 + 56) unclaimedAssetIDs];
  if ([v48 count])
  {

    goto LABEL_68;
  }
  id v51 = [*(id *)(a1 + 56) unclaimedTemporaryAssetIDs];
  id v52 = [v51 count];

  char v17 = v59;
  if (v52)
  {
LABEL_68:
    id v53 = *(void **)(a1 + 56);
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_1BB80;
    v63[3] = &unk_D1418;
    v63[4] = v53;
    id v64 = v58;
    [v53 dq_sync:v63];
  }
LABEL_69:
  id v54 = +[NSMutableArray array];
  if ([*(id *)(a1 + 32) count]) {
    [v54 addObjectsFromArray:*(void *)(a1 + 32)];
  }
  if ([*(id *)(a1 + 40) count]) {
    [v54 addObjectsFromArray:*(void *)(a1 + 40)];
  }
  [*(id *)(a1 + 56) _notifyLibraryOperationDone:0 assetIDs:v54];
}

void sub_1B870(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  uint64_t v8 = [*(id *)(a1 + 32) dataSources];
  id v9 = [v8 indexOfObjectIdenticalTo:v6];

  if ([v7 count])
  {
    if (v9 == (id)0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = 1 << (char)v9;
    }
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1B9A8;
    v13[3] = &unk_D1B00;
    id v11 = v7;
    uint64_t v12 = *(void *)(a1 + 32);
    id v14 = v11;
    uint64_t v15 = v12;
    uint64_t v18 = v10;
    id v16 = v6;
    id v17 = *(id *)(a1 + 40);
    sub_153E4(v11, v16, v13);
  }
}

void sub_1B9A8(uint64_t a1, void *a2)
{
  id v3 = [a2 bu_arrayByRemovingNSNulls];
  id v4 = [*(id *)(a1 + 32) mutableCopy];
  uint64_t v5 = [v3 valueForKey:@"assetID"];
  id v6 = [v5 bu_arrayByRemovingNSNulls];
  [v4 removeObjectsInArray:v6];

  id v7 = [v3 valueForKey:@"temporaryAssetID"];
  uint64_t v8 = [v7 bu_arrayByRemovingNSNulls];
  [v4 removeObjectsInArray:v8];

  id v9 = *(void **)(a1 + 40);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1BB14;
  v12[3] = &unk_D1A10;
  id v13 = v4;
  id v14 = v9;
  uint64_t v17 = *(void *)(a1 + 64);
  id v15 = v3;
  id v16 = *(id *)(a1 + 48);
  id v10 = v3;
  id v11 = v4;
  [v9 dq_sync:v12];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

id sub_1BB14(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count]) {
    [*(id *)(a1 + 40) dq_unclaimIdentifiers:*(void *)(a1 + 32) forDataSourceBitmask:*(void *)(a1 + 64)];
  }
  id result = [*(id *)(a1 + 48) count];
  if (result)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v3 = *(void *)(a1 + 56);
    uint64_t v5 = *(void **)(a1 + 40);
    return [v5 dq_libraryDataSource:v3 reconcileAssets:v4 reason:4];
  }
  return result;
}

id sub_1BB80(uint64_t a1)
{
  return [*(id *)(a1 + 32) wq_dq_integrateClaimedAssetsReason:2 context:*(void *)(a1 + 40)];
}

id sub_1BC54(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _libraryDataSource:*(void *)(a1 + 40) updatedAssets:*(void *)(a1 + 48)];
}

void sub_1BD4C(id *a1, void *a2)
{
  id v50 = a2;
  id v52 = +[NSMutableSet set];
  uint64_t v3 = BKLibraryLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_902F8((uint64_t)a1);
  }

  uint64_t v4 = [a1[4] valueForKey:@"assetID"];
  uint64_t v49 = [v4 bu_arrayByRemovingNSNulls];

  uint64_t v5 = [a1[4] valueForKey:@"temporaryAssetID"];
  uint64_t v48 = [v5 bu_arrayByRemovingNSNulls];

  id v6 = +[NSMutableDictionary dictionary];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v7 = a1[4];
  id v8 = [v7 countByEnumeratingWithState:&v72 objects:v78 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v73;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v73 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v72 + 1) + 8 * i);
        id v13 = [v12 assetID];
        if (v13) {
          [v12 assetID];
        }
        else {
        id v14 = [v12 temporaryAssetID];
        }

        id v15 = [v6 objectForKey:v14];
        if (!v15)
        {
          id v15 = +[NSMutableArray array];
          [v6 setObject:v15 forKey:v14];
        }
        [v15 addObject:v12];
      }
      id v9 = [v7 countByEnumeratingWithState:&v72 objects:v78 count:16];
    }
    while (v9);
  }

  id v16 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  [v16 setReturnsObjectsAsFaults:0];
  uint64_t v17 = (void *)v49;
  uint64_t v18 = [a1[5] predicateForAssetIDsTaggedLibraryAssets:v49];
  id v19 = (void *)v48;
  id v45 = +[BKLibraryManager predicateForTemporaryAssetIDsTaggedLibraryAssets:v48];
  id v46 = (void *)v18;
  v77[0] = v18;
  v77[1] = v45;
  id v20 = +[NSArray arrayWithObjects:v77 count:2];
  uint64_t v21 = +[NSCompoundPredicate orPredicateWithSubpredicates:v20];
  [v16 setPredicate:v21];

  id v71 = 0;
  id v22 = v50;
  id v23 = [v50 executeFetchRequest:v16 error:&v71];
  id v47 = v71;
  dispatch_group_t v44 = v23;
  if (v23)
  {
    if (![v23 count]) {
      goto LABEL_39;
    }
    if (objc_opt_respondsToSelector()) {
      id v54 = [a1[6] propagateDataProperties];
    }
    else {
      id v54 = 0;
    }
    id v51 = +[NSMutableArray array];
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id obj = v23;
    id v25 = [obj countByEnumeratingWithState:&v67 objects:v76 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v68;
      do
      {
        for (j = 0; j != v26; j = (char *)j + 1)
        {
          if (*(void *)v68 != v27) {
            objc_enumerationMutation(obj);
          }
          id v29 = *(id *)(*((void *)&v67 + 1) + 8 * (void)j);
          if ([v29 isValid])
          {
            id v30 = [v29 assetID];
            id v31 = [v29 temporaryAssetID];
            id v32 = a1[5];
            uint64_t v33 = [v29 dataSourceIdentifier];
            long long v34 = [v32 dataSourceWithIdentifier:v33];

            id v35 = [a1[6] rank];
            if (v35 == [v34 rank]
              || ((id v36 = [a1[6] rank], (uint64_t)v36 > (uint64_t)objc_msgSend(v34, "rank"))
                ? (BOOL v37 = v54 == 0)
                : (BOOL v37 = 1),
                  !v37))
            {
              id v38 = a1[5];
              v56[0] = _NSConcreteStackBlock;
              v56[1] = 3221225472;
              v56[2] = sub_1C3E4;
              v56[3] = &unk_D1FA0;
              id v39 = v30;
              id v40 = a1[5];
              id v57 = v39;
              id v58 = v40;
              id v59 = v31;
              id v60 = v6;
              id v61 = a1[6];
              id v62 = v34;
              id v66 = v54;
              id v63 = v29;
              id v64 = v51;
              id v65 = v52;
              [v38 dq_sync:v56];
            }
          }
        }
        id v26 = [obj countByEnumeratingWithState:&v67 objects:v76 count:16];
      }
      while (v26);
    }

    uint64_t v24 = v51;
    id v22 = v50;
    [a1[5] _removePossibleDupes:v51 inMoc:v50];
    id v19 = (void *)v48;
    uint64_t v17 = (void *)v49;
    id v16 = v43;
  }
  else
  {
    uint64_t v24 = BKLibraryLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_90290();
    }
  }

LABEL_39:
  if ([v22 hasChanges])
  {
    uint64_t v41 = [a1[5] collectionController];
    __int16 v42 = [v41 gatherChangedAssetsCollectionsWithLibraryMoc:v22];
    uint64_t v55 = 0;
    [v22 save:&v55];
    [v41 processGatheredChangedAssetsCollections:v42];
  }
  if ([v52 count]) {
    [a1[5] _resetSeriesIDs:v52];
  }
  [a1[5] _notifyLibraryOperationDone:2 assetIDs:v17];
}

void sub_1C3E4(uint64_t a1)
{
  if (!*(void *)(a1 + 32)
    || ([*(id *)(a1 + 40) assetUpdatesByIdentifier],
        id v2 = objc_claimAutoreleasedReturnValue(),
        [v2 objectForKeyedSubscript:*(void *)(a1 + 32)],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        v2,
        !v3))
  {
    if (!*(void *)(a1 + 48))
    {
      uint64_t v3 = 0;
      goto LABEL_22;
    }
    uint64_t v4 = [*(id *)(a1 + 40) assetUpdatesByIdentifier];
    uint64_t v3 = [v4 objectForKeyedSubscript:*(void *)(a1 + 48)];

    if (!v3) {
      goto LABEL_22;
    }
  }
  uint64_t v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    id v6 = *(id *)(a1 + 48);
    if (!v6) {
      goto LABEL_22;
    }
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = [*(id *)(a1 + 56) objectForKeyedSubscript:v6];
  id v8 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v28;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        id v13 = [*(id *)(a1 + 64) rank];
        if (v13 == [*(id *)(a1 + 72) rank]) {
          [v3 setAsset:v12];
        }
        [v3 setPropertiesToPropagate:*(void *)(a1 + 104)];
        [v3 propagateAdditionalDataWithAsset:v12];
        if ([v3 hasChanges])
        {
          id v14 = [v3 asset];

          if (v14) {
            [*(id *)(a1 + 80) setGeneration:0x7FFFFFFFFFFFFFFFLL];
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v9);
  }

LABEL_22:
  uint64_t v15 = [*(id *)(a1 + 80) seriesID];
  id v16 = (void *)v15;
  uint64_t v17 = &stru_D4160;
  if (v15) {
    uint64_t v17 = (__CFString *)v15;
  }
  uint64_t v18 = v17;

  id v19 = *(void **)(a1 + 40);
  id v20 = *(void **)(a1 + 80);
  uint64_t v21 = [v19 dataSources];
  LODWORD(v19) = sub_1C6E4(v19, v20, v3, 3, v21);

  [v3 postIntegrateCleanup];
  if (v19) {
    [*(id *)(a1 + 88) addObject:*(void *)(a1 + 80)];
  }
  id v22 = [*(id *)(a1 + 80) seriesID];
  unsigned __int8 v23 = [(__CFString *)v18 isEqualToString:v22];

  if ((v23 & 1) == 0)
  {
    if ([(__CFString *)v18 length]) {
      [*(id *)(a1 + 96) addObject:v18];
    }
    uint64_t v24 = [*(id *)(a1 + 80) seriesID];

    if (v24)
    {
      id v25 = *(void **)(a1 + 96);
      id v26 = [*(id *)(a1 + 80) seriesID];
      [v25 addObject:v26];
    }
  }
}

BOOL sub_1C6E4(void *a1, void *a2, void *a3, int a4, void *a5)
{
  id v258 = a1;
  id v8 = a2;
  id v259 = a3;
  id v9 = a5;
  if (!v8)
  {
    BCReportAssertionFailureWithMessage();
    goto LABEL_3;
  }
  if ([v8 isDeleted])
  {
LABEL_3:
    BOOL v10 = 0;
    goto LABEL_313;
  }
  v256 = v9;
  id v11 = [v259 asset];
  uint64_t v12 = sub_CAC8([v259 dataSourcesBitmask], v9);
  v257 = [v12 identifier];

  id v13 = [v8 dataSourceIdentifier];
  unsigned int v254 = [v13 isEqualToString:v257];

  id v14 = [v8 generation];
  id v15 = [v11 generation];
  id v16 = [v8 generation];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v11 duration], uint64_t v17 = objc_claimAutoreleasedReturnValue(), v17, v17))
  {
    uint64_t v18 = [v8 duration];
    id v19 = [v11 duration];
    unsigned int v20 = [v18 isEqualToNumber:v19] ^ 1;
  }
  else
  {
    unsigned int v20 = 0;
  }
  uint64_t v21 = [v8 assetGUID];
  id v22 = [v21 length];

  if (!v22) {
    id v23 = [v8 assetLogID];
  }
  int v24 = v254 ^ 1;
  if (v14 != v15) {
    int v24 = 1;
  }
  if (v16 == (id)0x7FFFFFFFFFFFFFFFLL) {
    int v25 = 1;
  }
  else {
    int v25 = v24;
  }
  id v26 = [v8 dataSourceIdentifier];
  v252 = [v258 dataSourceWithIdentifier:v26];

  long long v27 = [v258 dataSourceWithIdentifier:v257];
  v253 = v27;
  if (v27)
  {
    id v28 = [v27 coverSourceRank];
    BOOL v249 = (uint64_t)v28 > (uint64_t)[v252 coverSourceRank];
  }
  else
  {
    BOOL v249 = 0;
  }
  int v29 = v25 | v20;
  if (objc_opt_respondsToSelector())
  {
    long long v30 = [v11 permlink];
    id v31 = [v30 absoluteString];

    if (v29)
    {
      int v29 = 1;
LABEL_27:

      goto LABEL_28;
    }
    if (v31 || ([v8 permlink], (long long v30 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v32 = [v8 permlink];
      int v29 = [v31 isEqualToString:v32] ^ 1;

      if (v31) {
        goto LABEL_27;
      }
    }
    else
    {
      int v29 = 0;
    }

    goto LABEL_27;
  }
LABEL_28:
  uint64_t v33 = [v11 versionNumber];
  if (!v33)
  {
    id v16 = [v8 versionNumber];
    if (!v16)
    {
      id v36 = &dword_0 + 1;
LABEL_33:

      goto LABEL_34;
    }
  }
  long long v34 = [v11 versionNumber];
  id v35 = [v8 versionNumber];
  id v36 = [v34 isEqual:v35];

  if (!v33) {
    goto LABEL_33;
  }
LABEL_34:

  BOOL v37 = [v11 versionNumberHumanReadable];
  if (v37 || ([v8 versionNumberHumanReadable], (id v16 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v38 = [v11 versionNumberHumanReadable];
    id v39 = [v8 versionNumberHumanReadable];
    unsigned int v40 = [v38 isEqual:v39];

    if (v37) {
      goto LABEL_40;
    }
  }
  else
  {
    unsigned int v40 = 1;
  }

LABEL_40:
  if ((v29 | v36 ^ 1 | v40 ^ 1))
  {
    unsigned int v41 = 1;
  }
  else
  {
    __int16 v42 = [v8 path];
    id v36 = [v11 url];
    long long v43 = [v36 path];
    unsigned int v41 = [v42 isEqualToString:v43] ^ 1;
  }
  dispatch_group_t v44 = [v8 expectedDate];
  if (v44 || ([v259 expectedDate], (id v36 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v45 = [v8 expectedDate];
    id v46 = [v259 expectedDate];
    unsigned int v47 = [v45 isEqual:v46];

    if (v44) {
      goto LABEL_49;
    }
  }
  else
  {
    unsigned int v47 = 1;
  }

LABEL_49:
  unsigned int v48 = [v8 state];
  uint64_t v49 = [v259 asset];
  int v50 = v41 | v47 ^ 1;
  if (v48 != [v49 state]) {
    int v50 = 1;
  }

  id v51 = [v8 seriesSortKey];
  id v52 = [v259 seriesSortKey];
  if (v51 == v52)
  {

    BOOL v56 = 0;
LABEL_56:

    goto LABEL_57;
  }
  id v53 = [v8 seriesSortKey];
  id v54 = [v259 seriesSortKey];
  unsigned __int8 v55 = [v53 isEqual:v54];

  if ((v55 & 1) == 0)
  {
    id v51 = [v259 seriesSortKey];
    BOOL v56 = v51 != 0;
    goto LABEL_56;
  }
  BOOL v56 = 0;
LABEL_57:
  unsigned int v248 = [v8 state];
  int v250 = v50 | v56;
  BOOL v251 = 0;
  if ((v50 | v56) == 1 && v11)
  {
    id v57 = [v8 assetID];
    if (v57)
    {

      BOOL v251 = 0;
    }
    else
    {
      id v58 = [v11 assetID];
      BOOL v251 = v58 != 0;
    }
    id v59 = [v11 temporaryAssetID];
    if (v59)
    {
      id v60 = [v11 temporaryAssetID];
      id v61 = [v8 temporaryAssetID];
      unsigned __int8 v62 = [v60 isEqualToString:v61];

      if ((v62 & 1) == 0)
      {
        id v63 = [v8 assetID];

        if (v63)
        {
          id v64 = BKLibraryLog();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
          {
            id v65 = [v8 assetID];
            id v66 = [v8 temporaryAssetID];
            long long v67 = [v11 temporaryAssetID];
            long long v68 = [v8 dataSourceIdentifier];
            *(_DWORD *)buf = 141559810;
            *(void *)&uint8_t buf[4] = 1752392040;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v65;
            *(_WORD *)&buf[22] = 2160;
            uint64_t v266 = 1752392040;
            *(_WORD *)v267 = 2112;
            *(void *)&v267[2] = v66;
            __int16 v268 = 2160;
            uint64_t v269 = 1752392040;
            __int16 v270 = 2112;
            v271 = v67;
            __int16 v272 = 2114;
            v273 = v68;
            __int16 v274 = 2114;
            v275 = v257;
            _os_log_impl(&dword_0, v64, OS_LOG_TYPE_DEFAULT, "updateMayHaveCausedDupes - %{mask.hash}@, temporaryAssetID=(old:%{mask.hash}@, new:%{mask.hash}@), dataSource=(old:%{public}@, new:%{public}@)", buf, 0x52u);
          }
          BOOL v251 = 1;
        }
      }
    }
    long long v69 = [v11 assetID];
    if (v69)
    {
    }
    else if (([v258 _shouldPropagateNilAssetIDForDataSourceWithIdentifier:v257] & 1) == 0)
    {
      goto LABEL_72;
    }
    long long v70 = [v11 assetID];
    [v8 setDifferentString:v70 forKey:@"assetID"];

LABEL_72:
    id v71 = [v11 temporaryAssetID];

    if (v71)
    {
      long long v72 = [v11 temporaryAssetID];
      [v8 setDifferentValue:v72 forKey:@"temporaryAssetID" klass:objc_opt_class()];
    }
    long long v73 = [v11 storeID];

    if (v73)
    {
      long long v74 = [v11 storeID];
      [v8 setDifferentValue:v74 forKey:@"storeID" klass:objc_opt_class()];
    }
    if (objc_opt_respondsToSelector())
    {
      long long v75 = [v11 storePlaylistID];

      if (v75)
      {
        uint64_t v76 = [v11 storePlaylistID];
        [v8 setDifferentValue:v76 forKey:@"storePlaylistID" klass:objc_opt_class()];
      }
    }
    if (objc_opt_respondsToSelector())
    {
      long long v77 = [v11 authorCount];

      if (v77)
      {
        long long v78 = [v11 authorCount];
        [v8 setDifferentValue:v78 forKey:@"authorCount" klass:objc_opt_class()];
      }
    }
    if (objc_opt_respondsToSelector())
    {
      long long v79 = [v11 authorNames];

      if (v79)
      {
        long long v80 = [v11 authorNames];
        [v8 setDifferentValue:v80 forKey:@"authorNames" klass:objc_opt_class()];
      }
    }
    if (objc_opt_respondsToSelector())
    {
      long long v81 = [v11 hasTooManyAuthors];

      if (v81)
      {
        long long v82 = [v11 hasTooManyAuthors];
        [v8 setDifferentValue:v82 forKey:@"hasTooManyAuthors" klass:objc_opt_class()];
      }
    }
    if (objc_opt_respondsToSelector())
    {
      long long v83 = [v11 narratorCount];

      if (v83)
      {
        long long v84 = [v11 narratorCount];
        [v8 setDifferentValue:v84 forKey:@"narratorCount" klass:objc_opt_class()];
      }
    }
    if (objc_opt_respondsToSelector())
    {
      long long v85 = [v11 narratorNames];

      if (v85)
      {
        long long v86 = [v11 narratorNames];
        [v8 setDifferentValue:v86 forKey:@"narratorNames" klass:objc_opt_class()];
      }
    }
    if (objc_opt_respondsToSelector())
    {
      long long v87 = [v11 hasTooManyNarrators];

      if (v87)
      {
        long long v88 = [v11 hasTooManyNarrators];
        [v8 setDifferentValue:v88 forKey:@"hasTooManyNarrators" klass:objc_opt_class()];
      }
    }
    if (objc_opt_respondsToSelector())
    {
      id v89 = [v11 mappedAssetID];

      if (v89)
      {
        id v90 = [v11 mappedAssetID];
        [v8 setDifferentValue:v90 forKey:@"mappedAssetID" klass:objc_opt_class()];
      }
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v91 = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", [v11 mappedAssetContentType]);
      if (v91) {
        [v8 setDifferentValue:v91 forKey:@"mappedAssetContentType" klass:objc_opt_class()];
      }
    }
    v92 = [v11 author];
    uint64_t v93 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
    CFStringRef v94 = [v92 stringByTrimmingCharactersInSet:v93];

    __int16 v95 = +[BKLibraryAsset unknownAuthor];
    LOBYTE(v93) = [(__CFString *)v94 isEqualToString:v95];

    if (v93)
    {

      CFStringRef v94 = @"UnknownAuthor";
      if (![@"UnknownAuthor" length]) {
        goto LABEL_110;
      }
    }
    else
    {
      if (![(__CFString *)v94 length])
      {
LABEL_110:

        CFStringRef v94 = 0;
LABEL_111:
        v96 = [v11 sortAuthor];
        uint64_t v97 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
        v98 = [v96 stringByTrimmingCharactersInSet:v97];

        __int16 v99 = +[BKLibraryAsset unknownAuthor];
        LOBYTE(v97) = [(__CFString *)v98 isEqualToString:v99];

        if (v97)
        {

          v98 = @"UnknownAuthor";
          if (![@"UnknownAuthor" length]) {
            goto LABEL_118;
          }
        }
        else
        {
          if (![(__CFString *)v98 length])
          {
LABEL_118:

            v98 = 0;
            goto LABEL_119;
          }
          if (!v98) {
            goto LABEL_119;
          }
        }
        v100 = [v8 author];
        unsigned __int8 v101 = [(__CFString *)v98 isEqualToString:v100];

        if ((v101 & 1) == 0) {
          [v8 setDifferentValue:v98 forKey:@"sortAuthor" klass:objc_opt_class()];
        }
LABEL_119:
        v102 = [v11 title];

        if (v102)
        {
          v103 = [v11 title];
          [v8 setDifferentValue:v103 forKey:@"title" klass:objc_opt_class()];
        }
        v104 = [v11 sortTitle];
        if (v104)
        {
          v105 = [v11 sortTitle];
          id v106 = [v8 title];
          unsigned __int8 v107 = [v105 isEqualToString:v106];

          if ((v107 & 1) == 0)
          {
            v108 = [v11 sortTitle];

            if (v108)
            {
              v109 = [v11 sortTitle];
              [v8 setDifferentValue:v109 forKey:@"sortTitle" klass:objc_opt_class()];
            }
          }
        }
        v110 = [v11 genre];

        if (v110)
        {
          v111 = [v11 genre];
          [v8 setDifferentValue:v111 forKey:@"genre" klass:objc_opt_class()];
        }
        if (objc_opt_respondsToSelector())
        {
          v112 = [v11 genres];

          if (v112)
          {
            v113 = [v11 genres];
            [v8 setDifferentValue:v113 forKey:@"genres" klass:objc_opt_class()];
          }
        }
        if (objc_opt_respondsToSelector())
        {
          v114 = [v11 seriesIsOrdered];

          if (v114)
          {
            v115 = [v11 seriesIsOrdered];
            [v8 setDifferentValue:v115 forKey:@"seriesIsOrdered" klass:objc_opt_class()];
          }
        }
        v116 = [v11 accountID];

        if (v116)
        {
          v117 = [v11 accountID];
          [v8 setDifferentValue:v117 forKey:@"accountID" klass:objc_opt_class()];
        }
        if (v257) {
          [v8 setDifferentValue:v257 forKey:@"dataSourceIdentifier" klass:objc_opt_class()];
        }
        v118 = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", [v11 state]);
        [v8 setDifferentValue:v118 forKey:@"state" klass:objc_opt_class()];

        if ([v8 state] == 5 || objc_msgSend(v8, "state") == 6)
        {
          id v119 = [v8 purchasedAndLocalParent];
          BOOL v120 = v119 == 0;

          if (!v120)
          {
            v121 = BKLibraryLog();
            if (os_log_type_enabled(v121, OS_LOG_TYPE_DEBUG)) {
              sub_903A4(v8, v121);
            }
          }
        }
        v122 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v11 fileSize]);
        [v8 setDifferentValue:v122 forKey:@"fileSize" klass:objc_opt_class()];

        v123 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v11 generation]);
        [v8 setDifferentValue:v123 forKey:@"generation" klass:objc_opt_class()];

        v124 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v11 isSample]);
        [v8 setDifferentValue:v124 forKey:@"isSample" klass:objc_opt_class()];

        uint64_t v125 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v11 isProof]);
        [v8 setDifferentValue:v125 forKey:@"isProof" klass:objc_opt_class()];

        v126 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v11 isLocked]);
        [v8 setDifferentValue:v126 forKey:@"isLocked" klass:objc_opt_class()];

        uint64_t v127 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v11 isEphemeral]);
        [v8 setDifferentValue:v127 forKey:@"isEphemeral" klass:objc_opt_class()];

        v128 = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", [v11 desktopSupportLevel]);
        [v8 setDifferentValue:v128 forKey:@"desktopSupportLevel" klass:objc_opt_class()];

        v129 = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", [v11 contentType]);
        [v8 setDifferentValue:v129 forKey:@"contentType" klass:objc_opt_class()];

        v130 = [v11 isExplicit];

        if (v130)
        {
          v131 = [v11 isExplicit];
          [v8 setDifferentValue:v131 forKey:@"isExplicit" klass:objc_opt_class()];
        }
        if (objc_opt_respondsToSelector())
        {
          if (([v11 isSupplementalContent] & 1) != 0
            || ([v8 storePlaylistID],
                v132 = objc_claimAutoreleasedReturnValue(),
                BOOL v133 = v132 == 0,
                v132,
                v133))
          {
            v134 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v11 isSupplementalContent]);
            [v8 setDifferentValue:v134 forKey:@"isSupplementalContent" klass:objc_opt_class()];
          }
        }
        v135 = [v11 bookDescription];

        if (v135)
        {
          v136 = [v11 bookDescription];
          [v8 setDifferentValue:v136 forKey:@"bookDescription" klass:objc_opt_class()];
        }
        id v137 = [v11 comments];

        if (v137)
        {
          BOOL v138 = [v11 comments];
          [v8 setDifferentValue:v138 forKey:@"comments" klass:objc_opt_class()];
        }
        uint64_t v139 = [v11 grouping];

        if (v139)
        {
          v140 = [v11 grouping];
          [v8 setDifferentValue:v140 forKey:@"grouping" klass:objc_opt_class()];
        }
        v141 = [v11 kind];

        if (v141)
        {
          id v142 = [v11 kind];
          [v8 setDifferentValue:v142 forKey:@"kind" klass:objc_opt_class()];
        }
        if ([v11 pageCount] && objc_msgSend(v11, "pageCount") != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          id v143 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v11 pageCount]);
          [v8 setDifferentValue:v143 forKey:@"pageCount" klass:objc_opt_class()];
        }
        id v144 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v11 rating]);
        [v8 setDifferentValue:v144 forKey:@"rating" klass:objc_opt_class()];

        uint64_t v145 = [v11 updateDate];

        if (v145)
        {
          uint64_t v146 = [v11 updateDate];
          [v8 setDifferentValue:v146 forKey:@"updateDate" klass:objc_opt_class()];
        }
        if (objc_opt_respondsToSelector())
        {
          v147 = [v11 permlink];
          v148 = [v147 absoluteString];

          if (v148)
          {
            v149 = [v11 permlink];
            v150 = [v149 absoluteString];
            [v8 setDifferentValue:v150 forKey:@"permlink" klass:objc_opt_class()];
          }
        }
        if (objc_opt_respondsToSelector())
        {
          v151 = [v11 duration];

          if (v151)
          {
            v152 = [v11 duration];
            [v8 setDifferentValue:v152 forKey:@"duration" klass:objc_opt_class()];
          }
        }
        if (objc_opt_respondsToSelector())
        {
          v153 = [v11 readPercent];
          if (v153) {
            [v8 setDifferentValue:v153 forKey:@"readingProgress" klass:objc_opt_class()];
          }
          [v153 floatValue];
          v154 = [v8 bookHighWaterMarkProgress];
          [v154 floatValue];

          BCFloatAssertUnitIntervalClamp();
          v155 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
          if (v155) {
            [v8 setDifferentValue:v155 forKey:@"bookHighWaterMarkProgress" klass:objc_opt_class()];
          }
        }
        unsigned int v156 = [v8 isPreorderBook];
        v157 = [v259 expectedDate];
        if (v157
          && ([v11 expectedDate],
              v158 = objc_claimAutoreleasedReturnValue(),
              BOOL v159 = v158 == 0,
              v158,
              v157,
              v159))
        {
          uint64_t v160 = [v259 expectedDate];
        }
        else
        {
          uint64_t v160 = [v11 expectedDate];
        }
        v161 = (void *)v160;
        [v8 setDifferentValue:v160 forKey:@"expectedDate" klass:objc_opt_class()];
        if (v156) {
          unsigned int v162 = [v8 isPreorderBook] ^ 1;
        }
        else {
          unsigned int v162 = 0;
        }
        v163 = [v11 lastOpenDate];
        if (v163
          && ([v8 lastOpenDate],
              v164 = objc_claimAutoreleasedReturnValue(),
              BOOL v165 = v164 == 0,
              v164,
              v163,
              v165))
        {
          uint64_t v166 = [v11 lastOpenDate];
        }
        else
        {
          if (!v162) {
            goto LABEL_187;
          }
          uint64_t v166 = +[NSDate date];
        }
        v167 = (void *)v166;
        [v8 nonUserUpdateLastOpenDateTo:v166];

LABEL_187:
        v168 = [v11 versionNumber];

        if (v168)
        {
          v169 = [v11 versionNumber];
          [v8 setDifferentValue:v169 forKey:@"versionNumber" klass:objc_opt_class()];
        }
        v170 = [v11 versionNumberHumanReadable];

        if (v170)
        {
          v171 = [v11 versionNumberHumanReadable];
          [v8 setDifferentValue:v171 forKey:@"versionNumberHumanReadable" klass:objc_opt_class()];
        }
        v172 = [v11 year];

        if (v172)
        {
          v173 = [v11 year];
          [v8 setDifferentValue:v173 forKey:@"year" klass:objc_opt_class()];
        }
        v174 = [v8 cloudAssetType];
        if (v174 == (void *)BDSCloudAssetTypeSideloadedUbiquity
          || ([v8 isLocal] & 1) != 0
          || [v8 isImporting])
        {
          v175 = [v11 url];
          unsigned int v176 = [v175 isFileURL];

          if (!v176) {
            goto LABEL_200;
          }
          v177 = [v11 url];
          v178 = [v177 path];

          if (!v178) {
            goto LABEL_200;
          }
          v174 = [v11 url];
          v179 = [v174 path];
          [v8 setDifferentValue:v179 forKey:@"path" klass:objc_opt_class()];
        }
LABEL_200:

        goto LABEL_201;
      }
      if (!v94) {
        goto LABEL_111;
      }
    }
    [v8 setDifferentValue:v94 forKey:@"author" klass:objc_opt_class()];
    goto LABEL_111;
  }
LABEL_201:
  if (v250)
  {
    if (objc_opt_respondsToSelector())
    {
      v180 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v11 isDevelopment]);
      [v8 setDifferentValue:v180 forKey:@"isDevelopment" klass:objc_opt_class()];
    }
    uint64_t v181 = [v259 assetIsHidden];
    if (v181)
    {
      uint64_t v182 = [v259 assetIsHidden];
      unsigned int v183 = [v182 BOOLValue];
      if (v183 == [v8 isHidden])
      {

        goto LABEL_215;
      }
      BOOL v185 = [v11 state] == 1 && v248 != 1;

      if (v185)
      {
        uint64_t v181 = [v259 assetIsHidden];
        [v8 setIsHidden:[v181 BOOLValue]];
LABEL_215:
      }
    }
    v186 = [v259 seriesIsHidden];

    if (v186)
    {
      v187 = [v259 seriesIsHidden];
      if (v187) {
        [v8 setDifferentValue:v187 forKey:@"seriesIsHidden" klass:objc_opt_class()];
      }
    }
    v188 = [v259 seriesIsCloudOnly];

    if (v188)
    {
      v189 = [v259 seriesIsCloudOnly];
      if (v189) {
        [v8 setDifferentValue:v189 forKey:@"seriesIsCloudOnly" klass:objc_opt_class()];
      }
    }
    v190 = [v259 isStoreAudiobook];

    if (v190)
    {
      v191 = [v259 isStoreAudiobook];
      if (v191) {
        [v8 setDifferentValue:v191 forKey:@"isStoreAudiobook" klass:objc_opt_class()];
      }
    }
    v192 = [v259 hasRACSupport];

    if (v192)
    {
      v193 = [v259 hasRACSupport];
      if (v193) {
        [v8 setDifferentValue:v193 forKey:@"hasRACSupport" klass:objc_opt_class()];
      }
    }
    v194 = [v259 releaseDate];

    if (v194)
    {
      v195 = [v259 releaseDate];
      if (v195) {
        [v8 setDifferentValue:v195 forKey:@"releaseDate" klass:objc_opt_class()];
      }
    }
    v196 = [v259 url];

    if (v196)
    {
      uint64_t v197 = [v259 url];
      if (v197) {
        [v8 setDifferentValue:v197 forKey:@"url" klass:objc_opt_class()];
      }
    }
    id v198 = [v8 changedValues];
    v199 = [v198 allKeys];

    if ([v8 isAudiobook]
      && ([v199 containsObject:@"assetID"] & 1) != 0
      || ([v199 containsObject:@"storePlaylistID"] & 1) != 0
      || [v199 containsObject:@"isSupplementalContent"])
    {
      [v258 updateSupplementalContentRelationship:v8];
    }
    [v258 updateIsDownloadingSupplementalContentAndCombinedState:v8];
    long long v200 = [v259 seriesID];
    if (v200 && [v8 setDifferentString:v200 forKey:@"seriesID"])
    {
      if ([v8 isContainer])
      {
        [v258 updateSeriesRelationshipsForSeriesContainer:v8];
        [v258 _updateAuthorForSeriesContainer:v8];
      }
      else
      {
        [v258 updateSeriesRelationshipsForSeriesAsset:v8];
      }
    }
    long long v201 = [v259 seriesSortKey];

    if (v201)
    {
      long long v202 = [v259 seriesSortKey];
      if (v202) {
        [v8 setDifferentValue:v202 forKey:@"seriesSortKey" klass:objc_opt_class()];
      }
    }
    long long v203 = [v259 sequenceDisplayName];

    if (v203)
    {
      uint64_t v204 = [v259 sequenceDisplayName];
      if (v204) {
        [v8 setDifferentValue:v204 forKey:@"sequenceDisplayName" klass:objc_opt_class()];
      }
    }
    id v205 = [v259 sequenceNumber];

    if (v205)
    {
      id v206 = [v259 sequenceNumber];
      if (v206) {
        [v8 setDifferentValue:v206 forKey:@"sequenceNumber" klass:objc_opt_class()];
      }
    }
    id v207 = [v259 coverAspectRatio];

    if (v207)
    {
      long long v208 = [v259 coverAspectRatio];

      if (v208)
      {
        long long v209 = [v259 coverAspectRatio];
        [v8 setDifferentValue:v209 forKey:@"coverAspectRatio" klass:objc_opt_class()];
      }
    }
    long long v210 = [v259 title];

    if (v210)
    {
      long long v211 = [v259 title];
      if (v211)
      {
        [v8 setDifferentValue:v211 forKey:@"title" klass:objc_opt_class()];
        [v8 setDifferentValue:v211 forKey:@"sortTitle" klass:objc_opt_class()];
      }
    }
    id v212 = [v259 url];
    long long v213 = v212;
    if (v212)
    {
      if ([v212 isFileURL])
      {
        long long v214 = [v213 path];

        if (v214)
        {
          long long v215 = [v213 path];
          [v8 setDifferentValue:v215 forKey:@"path" klass:objc_opt_class()];
        }
      }
    }
    long long v216 = [v259 author];

    if (!v216) {
      goto LABEL_278;
    }
    v217 = [v259 author];
    v218 = +[BKLibraryAsset unknownAuthor];
    if ([v217 isEqualToString:v218])
    {

      v219 = @"UnknownAuthor";
    }
    else
    {
      v219 = [v259 author];

      if (!v219)
      {
LABEL_278:
        v220 = [v259 genre];

        if (v220)
        {
          v221 = [v259 genre];
          if (v221) {
            [v8 setDifferentValue:v221 forKey:@"genre" klass:objc_opt_class()];
          }
        }
        v222 = [v259 isExplicit];

        if (v222)
        {
          __int16 v223 = [v259 isExplicit];
          if (v223) {
            [v8 setDifferentValue:v223 forKey:@"isExplicit" klass:objc_opt_class()];
          }
        }
        if ((uint64_t)[v11 metadataMigrationVersion] >= 1)
        {
          id v224 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v11 metadataMigrationVersion]);
          [v8 setDifferentValue:v224 forKey:@"metadataMigrationVersion" klass:objc_opt_class()];
        }
        v225 = [v259 purchaseDates_hack];
        id v226 = [v225 count];

        if (v226)
        {
          v227 = [v259 purchaseDates_hack];
          v228 = +[NSMutableArray arrayWithArray:v227];

          v229 = [v8 purchaseDate];

          if (v229)
          {
            v230 = [v8 purchaseDate];
            [v228 addObject:v230];
          }
          v231 = +[NSSortDescriptor sortDescriptorWithKey:@"self" ascending:0];
          v264 = v231;
          v232 = +[NSArray arrayWithObjects:&v264 count:1];
          [v228 sortUsingDescriptors:v232];

          v233 = [v228 lastObject];
          if (v233) {
            [v8 setDifferentValue:v233 forKey:@"purchaseDate" klass:objc_opt_class()];
          }
        }
        goto LABEL_295;
      }
    }
    [v8 setDifferentValue:v219 forKey:@"author" klass:objc_opt_class()];
    [v8 setDifferentValue:v219 forKey:@"sortAuthor" klass:objc_opt_class()];

    goto LABEL_278;
  }
LABEL_295:
  if ([v8 isSample]) {
    unsigned int v234 = 1;
  }
  else {
    unsigned int v234 = [v11 isSample];
  }
  if (a4 == 2 || a4 == 4 || ([v8 canRedownload] & 1) == 0)
  {
    if (v234)
    {
      [v8 setDifferentValue:&__kCFBooleanFalse forKey:@"canRedownload" klass:objc_opt_class()];
    }
    else
    {
      id v235 = [v259 dataSourcesBitmask];
      id v236 = v256;
      uint64_t v260 = 0;
      v261 = &v260;
      uint64_t v262 = 0x2020000000;
      char v263 = 0;
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&uint8_t buf[16] = sub_3DC54;
      uint64_t v266 = (uint64_t)&unk_D26E0;
      *(void *)v267 = &v260;
      sub_3D2C4((uint64_t)v235, v236, buf);
      BOOL v237 = *((unsigned char *)v261 + 24) != 0;
      _Block_object_dispose(&v260, 8);

      v238 = +[NSNumber numberWithBool:v237];
      [v8 setDifferentValue:v238 forKey:@"canRedownload" klass:objc_opt_class()];
    }
  }
  v239 = [v8 dataSourceIdentifier];
  v240 = [v258 dataSourceWithIdentifier:v239];

  v241 = BUProtocolCast();
  v242 = [v8 assetID];
  v243 = [v241 coverWritingModeLanguageAndPageProgressionDirectionFromAssetID:v242];

  v244 = [v243 objectForKeyedSubscript:@"coverWritingMode"];
  v245 = [v243 objectForKeyedSubscript:@"language"];
  v246 = [v243 objectForKeyedSubscript:@"pageProgressionDirection"];
  if (v244) {
    [v8 setDifferentValue:v244 forKey:@"coverWritingMode" klass:objc_opt_class()];
  }
  if (v245) {
    [v8 setDifferentValue:v245 forKey:@"language" klass:objc_opt_class()];
  }
  if (v246) {
    [v8 setDifferentValue:v246 forKey:@"pageProgressionDirection" klass:objc_opt_class()];
  }
  if (((v254 | !v249) & 1) == 0) {
    [v258 _refreshArtForAsset:v8];
  }

  BOOL v10 = v251;
  id v9 = v256;
LABEL_313:

  return v10;
}

void sub_1ED54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1EE1C(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1EEAC;
  v2[3] = &unk_D1BC8;
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 performNamed:@"notify" workerQueueBlock:v2];
}

uint64_t sub_1EEAC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1EF60(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1EFF0;
  v4[3] = &unk_D1548;
  id v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [a2 addOperationBlock:v4];
}

void sub_1EFF0(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1F080;
  v2[3] = &unk_D1BC8;
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 performNamed:@"custom-operation" workerQueueBlockAndWait:v2];
}

uint64_t sub_1F080(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_1F154(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _libraryDataSource:*(void *)(a1 + 40) addedAssets:*(void *)(a1 + 48)];
}

void sub_1F280(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = BKLibraryLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_90504(v4, v5, v6, v7, v8, v9, v10, v11);
  }

  id v12 = a1[4];
  id v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  uint64_t v18 = sub_1F3B0;
  id v19 = &unk_D1E88;
  id v20 = v12;
  id v21 = a1[5];
  id v22 = a1[6];
  id v23 = v3;
  id v13 = v3;
  [v12 dq_sync:&v16];
  id v14 = [a1[6] valueForKey:@"assetID" v16, v17, v18, v19, v20];
  id v15 = [v14 bu_arrayByRemovingNSNulls];

  [a1[4] _notifyLibraryOperationDone:1 assetIDs:v15];
}

id sub_1F3B0(uint64_t a1)
{
  [*(id *)(a1 + 32) dq_libraryDataSource:*(void *)(a1 + 40) reconcileAssets:*(void *)(a1 + 48) reason:1];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 56);

  return [v2 wq_dq_integrateClaimedAssetsReason:1 context:v3];
}

id sub_1F6F8(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _performReloadDataSource:*(void *)(a1 + 40) completion:0];
}

id sub_1F7E0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) libraryDataSource:*(void *)(a1 + 40) addedAssets:*(void *)(a1 + 48) inGroup:a2];
}

id sub_1F8C0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) libraryDataSource:*(void *)(a1 + 40) removedAssets:*(void *)(a1 + 48) inGroup:a2];
}

id sub_1F9C0(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) libraryDataSource:*(void *)(a1 + 40) removedAssetsWithAssetIDs:*(void *)(a1 + 48) orTemporaryAssetIDs:*(void *)(a1 + 56) inGroup:a2];
}

id sub_1FAA0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) libraryDataSource:*(void *)(a1 + 40) updatedAssets:*(void *)(a1 + 48) inGroup:a2];
}

void sub_1FFD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1FFF0(uint64_t a1, uint64_t a2)
{
  id v7 = [*(id *)(a1 + 32) libraryAssetsWithAssetIDsContainedInList:*(void *)(a1 + 40) tempAssetIDs:0 inManagedObjectContext:a2];
  uint64_t v3 = [v7 valueForKey:@"assetID"];
  uint64_t v4 = [v3 bu_arrayByRemovingNSNulls];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void sub_20404(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_20430(void *a1)
{
  uint64_t v2 = a1[5];
  uint64_t v3 = *(void **)(a1[4] + 56);
  uint64_t v4 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v3 executeFetchRequest:v2 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = [v5 valueForKey:@"assetID"];
  uint64_t v7 = [v6 bu_arrayByRemovingNSNulls];
  uint64_t v8 = (void *)v7;
  if (v7) {
    uint64_t v9 = (void *)v7;
  }
  else {
    uint64_t v9 = &__NSArray0__struct;
  }
  objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), v9);
}

void sub_20760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_2078C(void *a1)
{
  uint64_t v2 = a1[5];
  uint64_t v3 = *(void **)(a1[4] + 56);
  uint64_t v4 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v3 executeFetchRequest:v2 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = [v5 valueForKey:@"storeID"];
  uint64_t v7 = [v6 bu_arrayByRemovingNSNulls];
  uint64_t v8 = (void *)v7;
  if (v7) {
    uint64_t v9 = (void *)v7;
  }
  else {
    uint64_t v9 = &__NSArray0__struct;
  }
  objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), v9);
}

void sub_208DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  CFStringRef v17 = @"assetID";
  uint64_t v5 = +[NSArray arrayWithObjects:&v17 count:1];
  [v4 setPropertiesToFetch:v5];

  [v4 setResultType:2];
  uint64_t v6 = [*(id *)(a1 + 32) predicateForPurchasedBooksAssets];
  [v4 setPredicate:v6];

  id v16 = 0;
  uint64_t v7 = [v3 executeFetchRequest:v4 error:&v16];

  id v8 = v16;
  uint64_t v9 = [v7 valueForKey:@"assetID"];
  uint64_t v10 = [v9 bu_arrayByRemovingNSNulls];
  uint64_t v11 = (void *)v10;
  uint64_t v12 = &__NSArray0__struct;
  if (v10) {
    uint64_t v12 = (void *)v10;
  }
  id v13 = v12;

  id v14 = objc_retainBlock(*(id *)(a1 + 40));
  uint64_t v15 = v14;
  if (v14) {
    (*((void (**)(id, id, id))v14 + 2))(v14, v13, v8);
  }
}

void sub_20B14(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc((Class)NSFetchRequest);
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  id v7 = [v4 initWithEntityName:v6];

  CFStringRef v30 = @"assetID";
  id v8 = +[NSArray arrayWithObjects:&v30 count:1];
  [v7 setPropertiesToFetch:v8];

  [v7 setResultType:2];
  [v7 setReturnsObjectsAsFaults:0];
  id v9 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"sortKey" ascending:0];
  v29[0] = v9;
  uint64_t v10 = +[NSSortDescriptor sortDescriptorWithKey:@"assetID" ascending:0];
  v29[1] = v10;
  uint64_t v11 = +[NSArray arrayWithObjects:v29 count:2];
  [v7 setSortDescriptors:v11];

  uint64_t v12 = +[BKLibraryManager predicateForCollectionMembersInCollectionID:kBKCollectionDefaultIDWantToRead hideUnownedItems:0];
  v28[0] = v12;
  id v13 = +[BKLibraryManager predicateForExcludingCollectionMembersWithSideloadedAssets];
  v28[1] = v13;
  id v14 = +[BKLibraryManager predicateForExcludingCollectionMembersWithContainerLibraryAssets];
  v28[2] = v14;
  uint64_t v15 = +[BKLibraryManager predicateToExcludeCollectionMembersForAudiobookSupplementalContent];
  v28[3] = v15;
  id v16 = +[NSArray arrayWithObjects:v28 count:4];
  CFStringRef v17 = +[NSCompoundPredicate andPredicateWithSubpredicates:v16];
  [v7 setPredicate:v17];

  if (*(void *)(a1 + 40)) {
    [v7 setFetchLimit:];
  }
  id v27 = 0;
  uint64_t v18 = [v3 executeFetchRequest:v7 error:&v27];
  id v19 = v27;
  id v20 = [v18 valueForKey:@"assetID"];
  uint64_t v21 = [v20 bu_arrayByRemovingNSNulls];
  id v22 = (void *)v21;
  id v23 = &__NSArray0__struct;
  if (v21) {
    id v23 = (void *)v21;
  }
  id v24 = v23;

  id v25 = objc_retainBlock(*(id *)(a1 + 32));
  id v26 = v25;
  if (v25) {
    (*((void (**)(id, id, id))v25 + 2))(v25, v24, v19);
  }
}

int64_t sub_21384(id a1, BKLibraryDataSource *a2, BKLibraryDataSource *a3)
{
  id v4 = a3;
  int64_t v5 = [(BKLibraryDataSource *)a2 rank];
  int64_t v6 = [(BKLibraryDataSource *)v4 rank];

  if (v5 < v6) {
    return -1;
  }
  else {
    return v5 > v6;
  }
}

void sub_24060(_Unwind_Exception *a1)
{
}

uint64_t sub_24090(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_3D35C;
  v6[3] = &unk_D26E0;
  v6[4] = &v7;
  sub_3D2C4(a1, v3, v6);
  uint64_t v4 = *((unsigned __int8 *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

void sub_2414C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24164(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (([*(id *)(a1 + 32) containsObject:v6] & 1) == 0)
  {
    uint64_t v7 = [v6 asset];
    if (![v6 dataSourcesBitmask] || !v7)
    {
LABEL_27:

      goto LABEL_28;
    }
    [*(id *)(a1 + 32) addObject:v6];
    ++*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24);
    id v8 = [v6 dataSourcesBitmask];
    uint64_t v9 = [*(id *)(a1 + 40) dataSources];
    char v10 = sub_CAC8(v8, v9);
    uint64_t v11 = [v10 identifier];

    uint64_t v12 = [v7 assetID];
    uint64_t v13 = [v7 temporaryAssetID];
    id v14 = BKLibraryLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_90910();
    }

    int v50 = (void *)v13;
    id v51 = (void *)v11;
    uint64_t v15 = [*(id *)(a1 + 40) insertNewLibraryAssetWithIdentifier:v11 assetID:v12 orTemporaryAssetID:v13 type:[v7 contentType] inManagedObjectContext:*(void *)(a1 + 48)];
    id v16 = *(void **)(a1 + 40);
    int v17 = *(__int16 *)(a1 + 120);
    uint64_t v18 = [v16 dataSources];
    sub_1C6E4(v16, v15, v6, v17, v18);

    id v19 = *(void **)(a1 + 56);
    id v20 = [v15 permanentOrTemporaryAssetID];
    [v19 addObject:v20];

    [*(id *)(a1 + 40) adoptMigratedProperties:v15];
    uint64_t v21 = +[NSUserDefaults standardUserDefaults];
    unsigned int v22 = [v21 BOOLForKey:@"BKAlreadyDisplayedGDPRWelcomeExperience"];

    int v23 = *(unsigned __int16 *)(a1 + 120);
    id v24 = [v6 asset];
    unsigned int v25 = [v24 state];

    if (!v22 || v23 != 1 || v25 == 3)
    {
      id v26 = [v15 purchaseDate];
      [v15 setModificationDate:v26];
    }
    id v27 = [v6 dataSourcesBitmask];
    id v28 = [*(id *)(a1 + 40) dataSources];
    LODWORD(v27) = sub_24090((uint64_t)v27, v28);

    if (v27)
    {
      [*(id *)(a1 + 64) addObject:v7];
      uint64_t v29 = [v7 storeID];
      if (v29 && (CFStringRef v30 = (void *)v29, v31 = [v7 contentType], v30, v31 != 6))
      {
        id v35 = *(void **)(a1 + 72);
        uint64_t v36 = [v7 storeID];
      }
      else
      {
        uint64_t v32 = [v7 assetID];
        if (!v32) {
          goto LABEL_18;
        }
        uint64_t v33 = (void *)v32;
        unsigned int v34 = [v7 state];

        if (v34 != 1) {
          goto LABEL_18;
        }
        id v35 = *(void **)(a1 + 80);
        uint64_t v36 = [v7 assetID];
      }
      BOOL v37 = (void *)v36;
      [v35 addObject:v36];
    }
LABEL_18:
    id v38 = [v6 dataSourcesBitmask];
    id v39 = [*(id *)(a1 + 40) dataSources];
    unsigned int v40 = sub_CAC8(v38, v39);
    unsigned int v41 = [v40 identifier];

    if (v41)
    {
      uint64_t v49 = *(void **)(a1 + 88);
      v52[0] = @"BKLibraryOwnershipAssetIDKey";
      v52[1] = @"BKLibraryOwnershipNewDatasource";
      v53[0] = v5;
      v53[1] = v41;
      v52[2] = @"BKLibraryOwnershipNewState";
      __int16 v42 = [v6 asset];
      long long v43 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (int)[v42 state]);
      void v53[2] = v43;
      +[NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:3];
      id v44 = v5;
      id v45 = v15;
      v47 = id v46 = v12;
      [v49 addObject:v47];

      uint64_t v12 = v46;
      uint64_t v15 = v45;
      id v5 = v44;
    }
    unsigned int v48 = BKLibraryLog();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
      sub_90864((uint64_t)v41, v15);
    }

    if (v12) {
      [*(id *)(a1 + 96) removeObject:v12];
    }
    if (v50) {
      [*(id *)(a1 + 104) removeObject:v50];
    }

    goto LABEL_27;
  }
LABEL_28:
}

void sub_24624(id a1, NSString *a2, BKLibraryAssetUpdate *a3, BOOL *a4)
{
}

void sub_2462C(uint64_t a1)
{
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:@"BKLibraryBooksChanged" object:*(void *)(a1 + 32)];
}

void sub_24B2C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_24C18;
  v11[3] = &unk_D2188;
  id v8 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v12 = v6;
  uint64_t v13 = v7;
  id v14 = v5;
  uint64_t v15 = v8;
  __int16 v17 = *(_WORD *)(a1 + 64);
  id v16 = *(id *)(a1 + 48);
  id v9 = v5;
  id v10 = v6;
  [v8 dq_sync:v11];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void sub_24C18(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = BKLibraryLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_90980();
    }
  }
  else if ([*(id *)(a1 + 48) count])
  {
    kdebug_trace();
    [*(id *)(a1 + 56) dq_libraryDataSource:*(void *)(a1 + 40) reconcileAssets:*(void *)(a1 + 48) reason:*(__int16 *)(a1 + 72)];
    kdebug_trace();
  }
  id v3 = *(void **)(a1 + 64);
  uint64_t v4 = [*(id *)(a1 + 40) identifier];
  [v3 removeObject:v4];

  id v5 = BKLibraryLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [*(id *)(a1 + 48) count]);
    uint64_t v7 = [*(id *)(a1 + 40) identifier];
    int v8 = 138412546;
    id v9 = v6;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "#datasource DONE reconciling %@ assets for: %@", (uint8_t *)&v8, 0x16u);
  }
}

void sub_24DC4(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  id v3 = BKLibraryLog();
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [*(id *)(a1 + 32) allObjects];
      id v6 = [v5 componentsJoinedByString:@", "];
      int v7 = 138543362;
      int v8 = v6;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "#datasource STILL pending to be reconciled after 1 minute: [%{public}@]", (uint8_t *)&v7, 0xCu);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    sub_90A28(a1);
  }
}

void sub_24EC4(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  id v3 = BKLibraryLog();
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [*(id *)(a1 + 32) allObjects];
      id v6 = [v5 componentsJoinedByString:@", "];
      int v7 = 138543362;
      int v8 = v6;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "#datasource STILL pending to be reconciled after 3 minutes: [%{public}@]", (uint8_t *)&v7, 0xCu);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    sub_90AD0(a1);
  }
}

void sub_2525C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

id sub_25280(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v3 dataSourceIdentifier];
    int v7 = [v5 dataSourceWithIdentifier:v6];

    int v8 = BUProtocolCast();
    id v9 = [v4 assetID];
    __int16 v10 = [v4 path];
    uint64_t v11 = [v8 plistEntryAsDictionaryFromAssetID:v9 path:v10 needsCoordination:*(unsigned __int8 *)(a1 + 48)];
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v19 = 0u;
    int v7 = [*(id *)(a1 + 32) dataSources];
    id v13 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v19;
LABEL_8:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v7);
        }
        __int16 v17 = BUProtocolCast();
        uint64_t v11 = [v17 plistEntryAsDictionaryFromAssetID:0 path:*(void *)(a1 + 40) needsCoordination:*(unsigned __int8 *)(a1 + 48)];

        if (v11) {
          break;
        }
        if (v14 == (id)++v16)
        {
          id v14 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v14) {
            goto LABEL_8;
          }
          goto LABEL_14;
        }
      }
    }
    else
    {
LABEL_14:
      uint64_t v11 = 0;
    }
  }

  return v11;
}

void sub_2546C(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  id v6 = +[NSPredicate predicateWithFormat:@"%K == %@", @"path", v4];
  [v3 p_libraryAssetWithIdentifier:v4 predicate:v6 inManagedObjectContext:v5];
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void sub_258CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_258E8(uint64_t a1, uint64_t a2)
{
  id v6 = [*(id *)(a1 + 32) libraryAssetWithAssetID:*(void *)(a1 + 40) inManagedObjectContext:a2];
  uint64_t v3 = [v6 bookDescription];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_25B00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25B1C(uint64_t a1, void *a2)
{
  id v11 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) libraryAssetWithAssetID:*(void *)(a1 + 40)];
  uint64_t v4 = [v3 seriesID];

  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v3 seriesID];
    uint64_t v7 = [v5 libraryAssetWithAssetID:v6 inManagedObjectContext:v11];

    uint64_t v8 = [v7 title];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    uint64_t v3 = v7;
  }
}

void sub_25C90(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) libraryAssetsWithAssetIDsContainedInList:*(void *)(a1 + 40) tempAssetIDs:0 inManagedObjectContext:a2];
  [*(id *)(a1 + 32) deleteAssets:v3 exhaustive:*(unsigned __int8 *)(a1 + 48)];
}

void sub_25DC8(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) libraryMutableAssetWithAssetID:*(void *)(a1 + 40) inManagedObjectContext:a2];
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 setIsTrackedAsRecent:0];
    id v5 = *(void **)(a1 + 32);
    uint64_t v7 = v4;
    id v6 = +[NSArray arrayWithObjects:&v7 count:1];
    [v5 deleteAssets:v6 exhaustive:1];
  }
}

void sub_28280(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_28404(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_2841C(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) notifyBlocksForNewAssets];
  id v3 = [v2 valueForKey:*(void *)(a1 + 40)];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 count] != 0;
}

void sub_28498(uint64_t a1)
{
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x3032000000;
  long long v21 = sub_89D0;
  unsigned int v22 = sub_89E0;
  id v23 = 0;
  uint64_t v1 = *(os_unfair_lock_s **)(a1 + 32);
  int v2 = v1 + 12;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  id v13 = sub_286A4;
  id v14 = &unk_D22C8;
  __int16 v17 = &v18;
  uint64_t v15 = v1;
  id v16 = *(id *)(a1 + 40);
  id v3 = v12;
  os_unfair_lock_lock(v2);
  v13((uint64_t)v3);
  os_unfair_lock_unlock(v2);

  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v4 = (id)v19[5];
  id v5 = [v4 countByEnumeratingWithState:&v8 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * (void)v7) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * (void)v7));
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v4 countByEnumeratingWithState:&v8 objects:v24 count:16];
    }
    while (v5);
  }

  _Block_object_dispose(&v18, 8);
}

void sub_28678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_286A4(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) notifyBlocksForNewAssets];
  uint64_t v3 = [v2 valueForKey:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = [*(id *)(a1 + 32) notifyBlocksForNewAssets];
  [v6 setValue:0 forKey:*(void *)(a1 + 40)];
}

void sub_28904(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) notifyBlocksForNewAssets];
  id v5 = [v2 valueForKey:*(void *)(a1 + 40)];

  if (!v5)
  {
    id v5 = +[NSMutableArray array];
    uint64_t v3 = [*(id *)(a1 + 32) notifyBlocksForNewAssets];
    [v3 setObject:v5 forKey:*(void *)(a1 + 40)];
  }
  id v4 = objc_retainBlock(*(id *)(a1 + 48));
  [v5 addObject:v4];
}

id sub_289BC(uint64_t a1, void *a2)
{
  id result = [a2 count];
  if (result)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    return _[v4 _newAssetIDAdded:v5];
  }
  return result;
}

id sub_28B64(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _newAssetIDAdded:*(void *)(a1 + 40)];
}

void sub_2996C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_29984(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = (void *)a1[5];
  id v5 = a2;
  id v6 = [v4 predicateForLocalLibraryAssets];
  id v7 = [v5 copyEntityPropertiesArray:v3 fromEntityName:@"BKLibraryAsset" withPredicate:v6 sortBy:0 ascending:0];

  uint64_t v8 = *(void *)(a1[7] + 8);
  long long v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  long long v10 = a1[6];

  return dispatch_semaphore_signal(v10);
}

void sub_2B6F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2B710(uint64_t a1, uint64_t a2)
{
  +[NSString stringWithFormat:@"%@==\"%@*\"cwdt", a2, *(void *)(a1 + 32)];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = v3;
  if (v3)
  {
    id v6 = v3;
    id v3 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v3];
    id v4 = v6;
  }

  return _objc_release_x1(v3, v4);
}

uint64_t sub_2BE0C(uint64_t a1, void *a2)
{
  uint64_t v3 = +[BKAssetUtilities utiTypeForContentType:](BKAssetUtilities, "utiTypeForContentType:", (__int16)[a2 integerValue]);
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v8 = v3;
    id v6 = +[NSString stringWithFormat:@"contentType == \"%@\"c", v3];
    [v5 addObject:v6];

    uint64_t v4 = v8;
  }

  return _objc_release_x1(v3, v4);
}

void sub_2BEA4(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v10 + 1) + 8 * (void)v7) attributeSet];
        long long v9 = [v8 identifier];

        if (v9) {
          [*(id *)(a1 + 32) addObject:v9];
        }

        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

intptr_t sub_2BFC4(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_303D0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void sub_304F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_30510(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) workerChildContext];
  CFStringRef v18 = @"storeID";
  id v3 = +[NSArray arrayWithObjects:&v18 count:1];
  id v4 = [*(id *)(a1 + 32) predicateForDownloadingStoreLibraryAssets];
  id v5 = [v2 copyEntityPropertiesArray:v3 fromEntityName:@"BKLibraryAsset" withPredicate:v4 sortBy:0 ascending:0];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      long long v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        long long v12 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)v10) objectForKeyedSubscript:@"storeID"];
        [v11 addObject:v12];

        long long v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

void sub_30784(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  [v4 setReturnsObjectsAsFaults:0];
  uint64_t v5 = [*(id *)(a1 + 32) predicateForLocalStoreAssets];
  uint64_t v29 = +[BKLibraryManager predicateForNotSamplesLibraryAssets];
  CFStringRef v30 = (void *)v5;
  id v6 = +[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", v5, v29, 0);
  if (*(unsigned char *)(a1 + 48))
  {
    id v7 = +[BKLibraryManager excludeAudiobooksPredicate];
    [v6 addObject:v7];
  }
  id v8 = +[BKLibraryManager predicateToExcludeAudiobookSupplementalContent];
  [v6 addObject:v8];

  id v28 = v6;
  id v9 = [v6 copy];
  long long v10 = +[NSCompoundPredicate andPredicateWithSubpredicates:v9];
  [v4 setPredicate:v10];

  id v37 = 0;
  unsigned int v31 = v4;
  uint64_t v32 = v3;
  long long v11 = [v3 executeFetchRequest:v4 error:&v37];
  id v27 = v37;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v12 = v11;
  id v13 = [v12 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v34;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v34 != v15) {
          objc_enumerationMutation(v12);
        }
        __int16 v17 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v18 = [v17 storeID];
        if (!v18)
        {
          id v26 = BKLibraryLog();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            sub_91084(v17);
          }

          goto LABEL_19;
        }
        long long v19 = (void *)v18;
        uint64_t v20 = [v17 versionNumber];
        long long v21 = [v20 stringValue];

        if (!v21)
        {
          unsigned int v22 = BKLibraryLog();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            sub_91108((uint64_t)v40, (uint64_t)v17);
          }

          long long v21 = &stru_D4160;
        }
        id v23 = *(void **)(a1 + 40);
        v38[0] = @"storeId";
        id v24 = [v17 storeID];
        v38[1] = @"publicationVersion";
        v39[0] = v24;
        v39[1] = v21;
        unsigned int v25 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:2];
        [v23 addObject:v25];
      }
      id v14 = [v12 countByEnumeratingWithState:&v33 objects:v41 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
LABEL_19:
}

void sub_30BB0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  uint64_t v5 = +[NSPredicate predicateWithFormat:@"%K = %@", @"storeID", *(void *)(a1 + 32)];
  [v4 setPredicate:v5];

  [v4 setReturnsObjectsAsFaults:0];
  [v4 setFetchLimit:1];
  id v10 = 0;
  id v6 = [v3 executeFetchRequest:v4 error:&v10];

  id v7 = v10;
  id v8 = (void (**)(id, void *, id))objc_retainBlock(*(id *)(a1 + 40));
  if (v8)
  {
    id v9 = [v6 lastObject];
    v8[2](v8, v9, v7);
  }
}

void sub_30D98(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  uint64_t v5 = +[NSPredicate predicateWithFormat:@"%K = %@", @"assetID", *(void *)(a1 + 32)];
  [v4 setPredicate:v5];

  [v4 setReturnsObjectsAsFaults:0];
  [v4 setFetchLimit:1];
  id v10 = 0;
  id v6 = [v3 executeFetchRequest:v4 error:&v10];

  id v7 = v10;
  id v8 = (void (**)(id, void *, id))objc_retainBlock(*(id *)(a1 + 40));
  if (v8)
  {
    id v9 = [v6 lastObject];
    v8[2](v8, v9, v7);
  }
}

void sub_30F80(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  [v4 setReturnsObjectsAsFaults:0];
  uint64_t v5 = +[NSPredicate predicateWithFormat:@"%K IN %@", @"storeID", *(void *)(a1 + 32)];
  [v4 setPredicate:v5];

  id v10 = 0;
  id v6 = [v3 executeFetchRequest:v4 error:&v10];

  id v7 = v10;
  id v8 = objc_retainBlock(*(id *)(a1 + 40));
  id v9 = v8;
  if (v8) {
    (*((void (**)(id, void *, id))v8 + 2))(v8, v6, v7);
  }
}

void sub_3113C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  [v4 setReturnsObjectsAsFaults:0];
  uint64_t v5 = +[NSPredicate predicateWithFormat:@"%K IN %@", @"assetID", *(void *)(a1 + 32)];
  [v4 setPredicate:v5];

  id v10 = 0;
  id v6 = [v3 executeFetchRequest:v4 error:&v10];

  id v7 = v10;
  id v8 = objc_retainBlock(*(id *)(a1 + 40));
  id v9 = v8;
  if (v8) {
    (*((void (**)(id, void *, id))v8 + 2))(v8, v6, v7);
  }
}

void sub_312D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  uint64_t v22 = a1;
  uint64_t v5 = [(id)objc_opt_class() predicateForUnownedStoreLibraryAssets];
  [v4 setPredicate:v5];

  v30[0] = @"assetID";
  v30[1] = @"contentType";
  v30[2] = @"dataSourceIdentifier";
  id v6 = +[NSArray arrayWithObjects:v30 count:3];
  [v4 setPropertiesToFetch:v6];

  [v4 setReturnsDistinctResults:1];
  id v28 = 0;
  id v23 = v3;
  id v7 = [v3 executeFetchRequest:v4 error:&v28];
  id v8 = v28;
  id v9 = +[NSMutableArray array];
  id v10 = +[NSMutableArray array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v11 = v7;
  id v12 = [v11 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        unsigned int v17 = [v16 isAudiobook];
        uint64_t v18 = [v16 assetID];
        if (v17) {
          long long v19 = v10;
        }
        else {
          long long v19 = v9;
        }
        [v19 addObject:v18];
      }
      id v13 = [v11 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v13);
  }

  id v20 = objc_retainBlock(*(id *)(v22 + 40));
  long long v21 = v20;
  if (v20) {
    (*((void (**)(id, void *, void *, id))v20 + 2))(v20, v9, v10, v8);
  }
}

void sub_315D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  [v4 setReturnsObjectsAsFaults:0];
  uint64_t v5 = [(id)objc_opt_class() predicateForAllUnownedLibraryAssets];
  [v4 setPredicate:v5];

  id v25 = 0;
  id v20 = v3;
  id v6 = [v3 executeFetchRequest:v4 error:&v25];
  id v7 = v25;
  id v8 = +[NSMutableArray array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v15 = [v14 assetID];

        if (v15)
        {
          long long v16 = [v14 assetID];
          id v17 = [v16 copy];
          [v8 addObject:v17];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v11);
  }

  id v18 = objc_retainBlock(*(id *)(a1 + 40));
  long long v19 = v18;
  if (v18) {
    (*((void (**)(id, void *, id))v18 + 2))(v18, v8, v7);
  }
}

void sub_32874(uint64_t a1, void *a2, uint64_t a3)
{
  id v19 = a2;
  id v5 = [*(id *)(a1 + 32) newManagedObjectContext];
  id v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"NewMOC 12 %s %@", "-[BKLibraryManager assetAccountIdentifiersForAssetID:path:storeID:purchasedDSID:downloadedDSID:familyID:dataSourceID:completion:]_block_invoke", v19);
  [v5 setName:v6];

  id v7 = [*(id *)(a1 + 32) libraryMutableAssetWithAssetID:*(void *)(a1 + 40) inManagedObjectContext:v5];
  if (v7)
  {
    if (a3)
    {
LABEL_3:
      id v8 = [v7 accountID];
      [v7 setDifferentString:v8 forKey:@"purchasedDSID"];

      [v7 setDifferentString:0 forKey:@"downloadedDSID"];
      [v7 setDifferentString:0 forKey:@"familyID"];
LABEL_9:
      if ([v5 hasChanges]) {
        [v5 saveLibrary];
      }
      id v10 = (void (**)(id, BKLibraryManagerAccountIdentifiers *, void))objc_retainBlock(*(id *)(a1 + 56));
      if (v10)
      {
        uint64_t v15 = [[BKLibraryManagerAccountIdentifiers alloc] initWithAsset:v7];
        v10[2](v10, v15, 0);
      }
      goto LABEL_13;
    }
    id v11 = [v19 familyID];
    if ([v11 length])
    {
    }
    else
    {
      long long v16 = [v19 purchasedDSID];
      if (![v16 length])
      {

        goto LABEL_3;
      }
      id v17 = [v19 downloadedDSID];
      id v18 = [v17 length];

      if (!v18) {
        goto LABEL_3;
      }
    }
    uint64_t v12 = [v19 purchasedDSID];
    [v7 setDifferentString:v12 forKey:@"purchasedDSID"];

    id v13 = [v19 downloadedDSID];
    [v7 setDifferentString:v13 forKey:@"downloadedDSID"];

    uint64_t v14 = [v19 familyID];
    [v7 setDifferentString:v14 forKey:@"familyID"];

    goto LABEL_9;
  }
  id v9 = (void (**)(id, BKLibraryManagerAccountIdentifiers *, void))objc_retainBlock(*(id *)(a1 + 56));
  id v10 = v9;
  if (v9) {
    v9[2](v9, *(BKLibraryManagerAccountIdentifiers **)(a1 + 48), 0);
  }
LABEL_13:
}

void sub_32E24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42)
{
}

void sub_32E58(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(a1 + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_32F44;
  block[3] = &unk_D2480;
  id v13 = v6;
  id v14 = v5;
  uint64_t v16 = *(void *)(a1 + 56);
  long long v11 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v11;
  long long v15 = v11;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v7, block);
}

void sub_32F44(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v4 = *(void *)(v2 + 40);
  id v3 = (id *)(v2 + 40);
  if (!v4)
  {
    id v5 = *(void **)(a1 + 32);
    if (v5) {
      objc_storeStrong(v3, v5);
    }
  }
  if ([*(id *)(a1 + 40) count]) {
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) unionSet:*(void *)(a1 + 40)];
  }
  id v6 = *(NSObject **)(a1 + 48);

  dispatch_group_leave(v6);
}

void sub_32FB4(uint64_t a1)
{
  if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count]
    || !*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v2 = objc_retainBlock(*(id *)(a1 + 32));
    if (!v2) {
      goto LABEL_8;
    }
    id v3 = (void (*)(void))v2[2];
    uint64_t v4 = v2;
  }
  else
  {
    uint64_t v2 = objc_retainBlock(*(id *)(a1 + 32));
    if (!v2) {
      goto LABEL_8;
    }
    id v3 = (void (*)(void))v2[2];
    uint64_t v4 = v2;
  }
  v3();
  uint64_t v2 = v4;
LABEL_8:
}

uint64_t sub_3321C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_333C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_333E0(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) libraryMutableAssetWithAssetID:*(void *)(a1 + 40) inManagedObjectContext:a2];
  uint64_t v4 = v3;
  if (*(unsigned char *)(a1 + 64)
    && ([v3 isTrackedAsRecent] & 1) == 0
    && ([v4 isSupplementalContent] & 1) == 0)
  {
    id v5 = BCReadingStatisticsLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v6;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Promoting %@ to recent.", buf, 0xCu);
    }

    [v4 setIsTrackedAsRecent:1];
    if (([v4 isSample] & 1) == 0
      && ([v4 isAudiobookPreview] & 1) == 0)
    {
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
      id v7 = [*(id *)(a1 + 32) collectionController];
      id v8 = *(void **)(a1 + 40);
      uint64_t v9 = kBKCollectionDefaultIDWantToRead;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      void v15[2] = sub_33630;
      v15[3] = &unk_D2520;
      id v16 = v8;
      long long v14 = *(_OWORD *)(a1 + 48);
      id v10 = (id)v14;
      long long v17 = v14;
      [v7 removeAssetID:v16 fromCollectionID:v9 completion:v15];
    }
  }
  long long v11 = BCReadingStatisticsLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    uint64_t v19 = v12;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Updating last engaged date for %@.", buf, 0xCu);
  }

  id v13 = +[NSDate date];
  [v4 setLastEngagedDate:v13];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_33630(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = BCReadingStatisticsLog();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Removed %@ from Want to Read.", (uint8_t *)&v9, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_911D8();
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_3373C(uint64_t a1)
{
  id v2 = objc_retainBlock(*(id *)(a1 + 32));
  if (v2)
  {
    id v3 = v2;
    (*((void (**)(id, void))v2 + 2))(v2, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
    id v2 = v3;
  }
}

void sub_33CCC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) wq_countOfBooksInContinueReadingIncludingExplicitContent:1 limit:*(void *)(a1 + 48) onWorkerQueue:v3];
  unint64_t v5 = *(void *)(a1 + 48);
  unint64_t v6 = v5 - (void)v4;
  if (v5 <= (unint64_t)v4)
  {
    uint64_t v8 = BCBookPromotionLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v9 = *(void *)(a1 + 48);
      int v10 = 134218240;
      id v11 = v4;
      __int16 v12 = 2048;
      unint64_t v13 = v9;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "There is enough books in continue reading (existing=%lu, limit=%lu). Skip seeding", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    id v7 = BCBookPromotionLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134218240;
      id v11 = v4;
      __int16 v12 = 2048;
      unint64_t v13 = v6;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "About to seed continue reading (existing=%lu, newLimit=%lu)", (uint8_t *)&v10, 0x16u);
    }

    [*(id *)(a1 + 32) wq_seedRecentsListWithRecentlyOpenedBooksNoOlderThanDate:*(void *)(a1 + 40) limit:v6 onWorkerQueue:v3];
  }
}

void sub_33EC8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  [v4 setReturnsObjectsAsFaults:0];
  unint64_t v5 = +[NSPredicate predicateWithFormat:@"%K < %@ && %K == YES", @"lastEngagedDate", *(void *)(a1 + 32), @"isTrackedAsRecent"];
  [v4 setPredicate:v5];

  id v20 = 0;
  unint64_t v6 = [v3 executeFetchRequest:v4 error:&v20];
  id v7 = v20;
  uint64_t v8 = v7;
  if (v6) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v7 == 0;
  }
  if (!v9)
  {
    int v10 = BCBookPromotionLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_9137C();
    }
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = v6;
  id v12 = [v11 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      long long v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * (void)v15) setIsTrackedAsRecent:0];
        long long v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v13);
  }

  [v3 saveLibrary];
}

void sub_341A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  unint64_t v5 = +[NSPredicate predicateWithFormat:@"%K IN %@", @"assetID", *(void *)(a1 + 32)];
  [v4 setPredicate:v5];

  CFStringRef v31 = @"assetID";
  unint64_t v6 = +[NSArray arrayWithObjects:&v31 count:1];
  [v4 setPropertiesToFetch:v6];

  id v25 = 0;
  id v7 = [v3 executeFetchRequest:v4 error:&v25];
  id v8 = v25;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v30 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * (void)v13) setIsTrackedAsRecent:0];
        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v21 objects:v30 count:16];
    }
    while (v11);
  }

  uint64_t v14 = BCBookPromotionLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [v9 count];
    long long v16 = [v9 valueForKey:@"assetID"];
    long long v17 = [v16 bu_arrayByRemovingNSNulls];
    *(_DWORD *)buf = 134218242;
    id v27 = v15;
    __int16 v28 = 2112;
    uint64_t v29 = v17;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "%lu assets promoted: %@", buf, 0x16u);
  }
  if (v8)
  {
    long long v18 = BCBookPromotionLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_913E4();
    }
  }
  id v19 = objc_retainBlock(*(id *)(a1 + 40));
  id v20 = v19;
  if (v19) {
    (*((void (**)(id, id))v19 + 2))(v19, v8);
  }
}

void sub_344E8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[BKLibraryManager fetchRequestForRecentlyEngaged];
  [v4 setFetchLimit:1];
  id v9 = 0;
  unint64_t v5 = (char *)[v3 countForFetchRequest:v4 error:&v9];

  id v6 = v9;
  id v7 = objc_retainBlock(*(id *)(a1 + 32));
  id v8 = v7;
  if (v7) {
    (*((void (**)(id, BOOL, id))v7 + 2))(v7, v5 == (unsigned char *)&dword_0 + 1, v6);
  }
}

void sub_3478C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  unint64_t v5 = +[NSPredicate predicateWithFormat:@"%K == %@", @"assetID", *(void *)(a1 + 32)];
  v15[0] = v5;
  id v6 = +[NSPredicate predicateWithFormat:@"%K == YES", @"isTrackedAsRecent"];
  v15[1] = v6;
  id v7 = +[NSArray arrayWithObjects:v15 count:2];
  id v8 = +[NSCompoundPredicate andPredicateWithSubpredicates:v7];
  [v4 setPredicate:v8];

  id v14 = 0;
  id v9 = [v3 countForFetchRequest:v4 error:&v14];

  id v10 = v14;
  id v11 = (void (**)(void))objc_retainBlock(*(id *)(a1 + 40));
  uint64_t v12 = v11;
  if (!v9 || v10)
  {
    if (v11)
    {
      id v13 = v11[2];
      goto LABEL_7;
    }
  }
  else if (v11)
  {
    id v13 = v11[2];
LABEL_7:
    v13();
  }
}

id sub_3494C(uint64_t a1)
{
  return [*(id *)(a1 + 32) performBlockOnWorkerQueue:*(void *)(a1 + 40)];
}

void sub_34B50(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  unint64_t v5 = +[NSPredicate predicateWithFormat:@"%K == %@", @"assetID", *(void *)(a1 + 32)];
  [v4 setPredicate:v5];

  id v18 = 0;
  id v6 = [v3 executeFetchRequest:v4 error:&v18];

  id v7 = v18;
  id v8 = v7;
  if (v6) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v7 == 0;
  }
  if (v9)
  {
    id v10 = [v6 firstObject];
    id v11 = +[NSUserDefaults standardUserDefaults];
    unsigned __int8 v12 = [v11 BOOLForKey:@"BKLibraryDataSourcePerformance-PPT"];

    BOOL v13 = 0;
    if (v10 && (v12 & 1) == 0)
    {
      if ([v10 isProof])
      {
        BOOL v13 = 0;
      }
      else if ([v10 isPreorderBook])
      {
        BOOL v13 = [v10 contentType] != 6;
      }
      else
      {
        BOOL v13 = 1;
      }
    }
    if ([v10 isSample]) {
      id v15 = &dword_0 + 1;
    }
    else {
      id v15 = [v10 isAudiobookPreview];
    }
    long long v16 = [[BKLibraryAssetObject alloc] initWithLibraryAsset:v10];
    long long v17 = (void (**)(id, BKLibraryAssetObject *, id, BOOL, id, void *))objc_retainBlock(*(id *)(a1 + 40));
    if (v17) {
      v17[2](v17, v16, [v10 isTrackedAsRecent], v13, v15, v8);
    }
  }
  else
  {
    id v14 = objc_retainBlock(*(id *)(a1 + 40));
    id v10 = v14;
    if (v14) {
      (*((void (**)(id, void, void, void, void, void *))v14 + 2))(v14, 0, 0, 0, 0, v8);
    }
  }
}

id sub_34D6C(uint64_t a1)
{
  return [*(id *)(a1 + 32) performBlockOnWorkerQueue:*(void *)(a1 + 40)];
}

void sub_34E58(uint64_t a1, void *a2)
{
  id v29 = a2;
  id v3 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  uint64_t v28 = +[NSPredicate predicateWithFormat:@"%K == YES", @"isTrackedAsRecent"];
  uint64_t v4 = [*(id *)(a1 + 32) predicateForSamples];
  uint64_t v32 = +[NSPredicate predicateWithFormat:@"%K < %@", @"lastEngagedDate", *(void *)(a1 + 40)];
  long long v33 = (void *)v4;
  v45[0] = v4;
  v45[1] = v32;
  unint64_t v5 = +[NSArray arrayWithObjects:v45 count:2];
  uint64_t v6 = +[NSCompoundPredicate andPredicateWithSubpredicates:v5];

  id v7 = [*(id *)(a1 + 32) predicateForSamples];
  uint64_t v8 = +[NSCompoundPredicate notPredicateWithSubpredicate:v7];

  BOOL v9 = (void *)v6;
  CFStringRef v30 = +[NSPredicate predicateWithFormat:@"%K < %@", @"lastEngagedDate", *(void *)(a1 + 48)];
  CFStringRef v31 = (void *)v8;
  v44[0] = v8;
  v44[1] = v30;
  id v10 = +[NSArray arrayWithObjects:v44 count:2];
  id v11 = +[NSCompoundPredicate andPredicateWithSubpredicates:v10];

  v43[0] = v6;
  v43[1] = v11;
  unsigned __int8 v12 = +[NSArray arrayWithObjects:v43 count:2];
  BOOL v13 = +[NSCompoundPredicate orPredicateWithSubpredicates:v12];

  id v14 = (void *)v28;
  v42[0] = v28;
  v42[1] = v13;
  id v15 = +[NSArray arrayWithObjects:v42 count:2];
  long long v16 = +[NSCompoundPredicate andPredicateWithSubpredicates:v15];

  [v3 setPredicate:v16];
  [v3 setResultType:2];
  CFStringRef v41 = @"assetID";
  long long v17 = +[NSArray arrayWithObjects:&v41 count:1];
  [v3 setPropertiesToFetch:v17];

  id v34 = 0;
  id v18 = [v29 executeFetchRequest:v3 error:&v34];

  id v19 = v34;
  if (v19)
  {
    id v20 = BCBookPromotionLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = *(void *)(a1 + 40);
      uint64_t v27 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      uint64_t v36 = v26;
      __int16 v37 = 2112;
      uint64_t v38 = v27;
      __int16 v39 = 2112;
      id v40 = v19;
      _os_log_error_impl(&dword_0, v20, OS_LOG_TYPE_ERROR, "Could not get recents not opened since dateForSamples: %@ and dateForNonSamples: %@. Error: %@", buf, 0x20u);
    }

    id v21 = objc_retainBlock(*(id *)(a1 + 56));
    long long v22 = v21;
    if (v21) {
      (*((void (**)(id, void, id))v21 + 2))(v21, 0, v19);
    }
  }
  else
  {
    long long v23 = [v18 valueForKey:@"assetID"];
    long long v22 = [v23 bu_arrayByRemovingNSNulls];

    id v24 = objc_retainBlock(*(id *)(a1 + 56));
    id v25 = v24;
    if (v24) {
      (*((void (**)(id, void *, void))v24 + 2))(v24, v22, 0);
    }

    id v14 = (void *)v28;
  }
}

void sub_35310(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  unint64_t v5 = [(id)objc_opt_class() _recentlyEngagedPredicate];
  v38[0] = v5;
  uint64_t v6 = +[NSPredicate predicateWithFormat:@"%K == YES", @"isFinished"];
  v38[1] = v6;
  id v7 = +[NSArray arrayWithObjects:v38 count:2];
  uint64_t v8 = +[NSCompoundPredicate andPredicateWithSubpredicates:v7];
  [v4 setPredicate:v8];

  if ([*(id *)(a1 + 40) length])
  {
    BOOL v9 = BCBookPromotionLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v37 = v10;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Excluding %@ from cleanup of finished recent books.", buf, 0xCu);
    }

    id v11 = [v4 predicate];
    v35[0] = v11;
    unsigned __int8 v12 = +[NSPredicate predicateWithFormat:@"%K != %@", @"assetID", *(void *)(a1 + 40)];
    v35[1] = v12;
    BOOL v13 = +[NSArray arrayWithObjects:v35 count:2];
    id v14 = +[NSCompoundPredicate andPredicateWithSubpredicates:v13];
    [v4 setPredicate:v14];
  }
  id v33 = 0;
  uint64_t v28 = v3;
  id v15 = [v3 executeFetchRequest:v4 error:&v33];
  id v16 = v33;
  long long v17 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v15 count]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v18 = v15;
  id v19 = [v18 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v30;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v30 != v21) {
          objc_enumerationMutation(v18);
        }
        long long v23 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        [v23 setIsTrackedAsRecent:0];
        id v24 = [v23 assetID];

        if (v24)
        {
          id v25 = [v23 assetID];
          [v17 addObject:v25];
        }
      }
      id v20 = [v18 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v20);
  }

  [v28 saveLibrary];
  id v26 = objc_retainBlock(*(id *)(a1 + 48));
  uint64_t v27 = v26;
  if (v26) {
    (*((void (**)(id, void *, id))v26 + 2))(v26, v17, v16);
  }
}

void sub_35750(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  unint64_t v5 = [(id)objc_opt_class() _continueReadingPredicate];
  v31[0] = v5;
  uint64_t v6 = +[NSPredicate predicateWithFormat:@"%K == YES", @"isFinished"];
  v31[1] = v6;
  id v7 = +[NSPredicate predicateWithFormat:@"%K < %@", @"dateFinished", *(void *)(a1 + 40)];
  v31[2] = v7;
  uint64_t v8 = +[NSPredicate predicateWithFormat:@"%K < %@", @"lastOpenDate", *(void *)(a1 + 40)];
  v31[3] = v8;
  BOOL v9 = +[NSArray arrayWithObjects:v31 count:4];
  uint64_t v10 = +[NSCompoundPredicate andPredicateWithSubpredicates:v9];
  [v4 setPredicate:v10];

  id v29 = 0;
  id v24 = v3;
  id v11 = [v3 executeFetchRequest:v4 error:&v29];
  id v12 = v29;
  BOOL v13 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v11 count]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v14 = v11;
  id v15 = [v14 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v26;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        [v19 setIsTrackedAsRecent:0];
        id v20 = [v19 assetID];

        if (v20)
        {
          uint64_t v21 = [v19 assetID];
          [v13 addObject:v21];
        }
      }
      id v16 = [v14 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v16);
  }

  id v22 = objc_retainBlock(*(id *)(a1 + 48));
  long long v23 = v22;
  if (v22) {
    (*((void (**)(id, void *, id))v22 + 2))(v22, v13, v12);
  }
}

void sub_36034(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = a2;
  id v7 = [v3 _updateLibraryAssetWithID:v4 withLastOpenDate:v5 withMoc:v6];
  [v6 saveLibrary];

  uint64_t v8 = (void (**)(void))objc_retainBlock(*(id *)(a1 + 56));
  if (v8)
  {
    BOOL v9 = v8;
    v8[2]();
    uint64_t v8 = v9;
  }
}

void sub_3619C(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) libraryMutableAssetWithAssetID:*(void *)(a1 + 40) inManagedObjectContext:a2];
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 setIsEphemeral:*(unsigned __int8 *)(a1 + 56)];
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = [v4 dataSourceIdentifier];
    id v7 = [v5 dataSourceWithIdentifier:v6];

    if (objc_opt_respondsToSelector())
    {
      [v7 updateAsset:v4 isEphemeral:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 48)];
    }
    else
    {
      NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
      id v12 = [v7 description];
      BOOL v13 = +[NSString stringWithFormat:@"Library data source %@ doesn't respond to selector.", v12];
      uint64_t v21 = v13;
      id v14 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      id v15 = +[NSError errorWithDomain:@"BKLibraryErrorDomain" code:2 userInfo:v14];

      id v16 = objc_retainBlock(*(id *)(a1 + 48));
      uint64_t v17 = v16;
      if (v16) {
        (*((void (**)(id, void, void *))v16 + 2))(v16, 0, v15);
      }
    }
  }
  else
  {
    uint64_t v8 = +[NSString stringWithFormat:@"Found no asset for assetID: %@", *(void *)(a1 + 40), NSLocalizedDescriptionKey];
    id v19 = v8;
    BOOL v9 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    id v7 = +[NSError errorWithDomain:@"BKLibraryErrorDomain" code:2 userInfo:v9];

    id v10 = objc_retainBlock(*(id *)(a1 + 48));
    id v11 = v10;
    if (v10) {
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v7);
    }
  }
}

void sub_364D0(uint64_t a1, uint64_t a2)
{
  id v3 = (uint64_t *)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 32) libraryAssetWithAssetID:*(void *)(a1 + 40) inManagedObjectContext:a2];
  if (!v4)
  {
    id v14 = BKLibraryLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_9144C(v3, v14, v15);
    }

    NSErrorUserInfoKey v22 = NSLocalizedDescriptionKey;
    CFStringRef v23 = @"Invalid asset identifier.";
    id v12 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    uint64_t v13 = 1;
    goto LABEL_17;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [*(id *)(a1 + 32) dataSources];
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (!v6)
  {
LABEL_11:

    id v11 = BKLibraryLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_914D4();
    }

    NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
    CFStringRef v25 = @"No data sources handled the pending update.";
    id v12 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    uint64_t v13 = 2;
LABEL_17:
    uint64_t v5 = +[NSError errorWithDomain:@"BKLibraryErrorDomain" code:v13 userInfo:v12];

    id v16 = objc_retainBlock(*(id *)(a1 + 48));
    uint64_t v17 = v16;
    if (v16) {
      (*((void (**)(id, void, void *))v16 + 2))(v16, 0, v5);
    }

    goto LABEL_20;
  }
  id v7 = v6;
  uint64_t v8 = *(void *)v19;
LABEL_4:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v19 != v8) {
      objc_enumerationMutation(v5);
    }
    id v10 = *(void **)(*((void *)&v18 + 1) + 8 * v9);
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ([v10 applyPendingUpdateForAsset:v4 completion:*(void *)(a1 + 48)] & 1) != 0)
    {
      break;
    }
    if (v7 == (id)++v9)
    {
      id v7 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
      if (v7) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
LABEL_20:
}

void sub_3682C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = +[NSFetchRequest fetchRequestWithEntityName:@"BKLibraryAsset"];
  uint64_t v4 = [(id)objc_opt_class() ephemeralSamplesPredicate];
  [v8 setPredicate:v4];

  uint64_t v5 = [v3 executeFetchRequest:v8 error:0];

  if ([v5 count])
  {
    id v6 = [*(id *)(a1 + 32) dataSourceConformingToProtocol:&OBJC_PROTOCOL___BKManagesEphemeralAssets];
    id v7 = BUProtocolCast();

    [v7 ephemeralAssetsRedundant:v5];
  }
}

void sub_37710(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) migrationMoc];
  if (v4)
  {
    uint64_t v5 = BKLibraryLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_917EC();
    }

    [*(id *)(a1 + 32) setMetadataObject:&__kCFBooleanTrue forKey:@"BKLibraryIsMigrating"];
    [*(id *)(a1 + 32) saveMetaData];
    [*(id *)(a1 + 32) migrateSortOrderKeys:v4];
    [*(id *)(a1 + 32) migrateCollections:v4 context:v3];
    [*(id *)(a1 + 32) migrateMetaData:v4];
    [*(id *)(a1 + 32) migrateDataSources:v4];
    id v6 = BKLibraryLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_917B8();
    }

    id v7 = [v4 persistentStoreCoordinator];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = [v7 persistentStores];
    id v9 = [v8 copy];

    id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          [v7 removePersistentStore:*(void *)(*((void *)&v14 + 1) + 8 * (void)v13) error:0];
          uint64_t v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
  [*(id *)(a1 + 32) setMetadataObject:&__kCFBooleanFalse forKey:@"BKLibraryIsMigrating"];
  [*(id *)(a1 + 32) migratePurgeOldDatabases];
}

void sub_37E48(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSFetchRequest);
  id v3 = +[NSEntityDescription entityForName:@"BKBookInfo" inManagedObjectContext:*(void *)(a1 + 32)];
  [v2 setEntity:v3];

  [v2 setPropertiesToFetch:&off_DA0D0];
  [v2 setResultType:2];
  uint64_t v4 = *(void **)(a1 + 32);
  id v22 = 0;
  uint64_t v5 = [v4 executeFetchRequest:v2 error:&v22];
  id v6 = v22;
  id v7 = [v5 valueForKeyPath:@"databaseKey"];
  id v8 = [*(id *)(a1 + 40) migrationDispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_38120;
  block[3] = &unk_D1A38;
  void block[4] = *(void *)(a1 + 40);
  id v9 = v5;
  id v20 = v9;
  id v10 = v7;
  id v21 = v10;
  dispatch_sync(v8, block);

  [*(id *)(a1 + 40) saveCachedMigrationData];
  id v11 = +[NSEntityDescription entityForName:@"BKBookInfo" inManagedObjectContext:*(void *)(a1 + 32)];
  [v2 setEntity:v11];

  [v2 setPropertiesToFetch:&off_DA0E8];
  uint64_t v12 = +[NSPredicate predicateWithFormat:@"%K != NULL", @"sortKey"];
  [v2 setPredicate:v12];

  uint64_t v13 = +[NSSortDescriptor sortDescriptorWithKey:@"sortKey" ascending:0];
  CFStringRef v23 = v13;
  long long v14 = +[NSArray arrayWithObjects:&v23 count:1];
  [v2 setSortDescriptors:v14];

  [v2 setFetchLimit:1];
  [v2 setResultType:2];
  long long v15 = *(void **)(a1 + 32);
  id v18 = v6;
  long long v16 = [v15 executeFetchRequest:v2 error:&v18];
  id v17 = v18;

  if ([v16 count] == (char *)&dword_0 + 1) {
    [*(id *)(a1 + 40) saveMetaData];
  }
}

id sub_38120(uint64_t a1)
{
  id v2 = +[NSMutableDictionary dictionaryWithObjects:*(void *)(a1 + 40) forKeys:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setMigratedSortOrderData:v2];

  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = [v3 valueForKeyPath:@"pluginAssetID"];
  uint64_t v5 = +[NSMutableDictionary dictionaryWithObjects:v3 forKeys:v4];
  [*(id *)(a1 + 32) setMigratedSortOrderDataByPluginAssetID:v5];

  id v6 = *(void **)(a1 + 32);

  return [v6 setMigratedPropertiesChanged:1];
}

void sub_382EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  [v4 setResultType:2];
  uint64_t v5 = [(id)objc_opt_class() predicateForNonEphemeralSamplesLibraryAssets];
  [v4 setPredicate:v5];

  CFStringRef v21 = @"assetID";
  id v6 = +[NSArray arrayWithObjects:&v21 count:1];
  [v4 setPropertiesToFetch:v6];

  [v4 setReturnsDistinctResults:1];
  id v16 = 0;
  id v7 = [v3 executeFetchRequest:v4 error:&v16];

  id v8 = v16;
  id v9 = [v7 valueForKey:@"assetID"];
  id v10 = [v9 bu_arrayByRemovingNSNulls];

  if (!v10 || v8)
  {
    id v11 = BKLibraryLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_91820(v8);
    }
  }
  uint64_t v12 = BKLibraryLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [v10 count];
    *(_DWORD *)buf = 134349314;
    id v18 = v13;
    __int16 v19 = 2112;
    id v20 = v10;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Bootstrap Samples collection: Going to add %{public}lu books to Samples and Downloaded collection. assetIDs: %@", buf, 0x16u);
  }

  long long v14 = [*(id *)(a1 + 32) collectionManager];
  long long v15 = +[NSSet setWithArray:v10];
  [v14 resetCollectionsForAssetIDs:v15 completion:&stru_D2608];

  [*(id *)(a1 + 32) setMetadataObject:&__kCFBooleanTrue forKey:@"BKLibraryHasBootstrappedSamplesCollection"];
  [*(id *)(a1 + 32) saveMetaData];
}

void sub_38544(id a1)
{
  uint64_t v1 = BKLibraryLog();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl(&dword_0, v1, OS_LOG_TYPE_INFO, "Bootstrap Samples collection: Finished bootstrapping Samples collection.", v2, 2u);
  }
}

void sub_38634(uint64_t a1)
{
  if ([*(id *)(a1 + 32) migratedPropertiesChanged])
  {
    id v2 = [*(id *)(a1 + 32) migrationCachePath];
    id v3 = +[NSFileManager defaultManager];
    [v3 removeItemAtPath:v2 error:0];

    uint64_t v4 = [*(id *)(a1 + 32) migratedSortOrderData];
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      id v6 = [*(id *)(a1 + 32) migratedSortOrderData];
      id v7 = [v6 count];

      if (v7)
      {
        id v8 = [*(id *)(a1 + 32) migratedSortOrderData];
        unsigned int v9 = [v8 writeToFile:v2 atomically:1];

        if (v9)
        {
          [*(id *)(a1 + 32) setMigratedPropertiesChanged:0];
        }
        else
        {
          id v10 = BKLibraryLog();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
            sub_918A4();
          }
        }
      }
    }
  }
}

BOOL sub_38864(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = [a3 objectForKeyedSubscript:@"validUntilKey"];
  uint64_t v5 = v4;
  if (v4) {
    BOOL v6 = [v4 compare:*(void *)(a1 + 32)] == (id)-1;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

void sub_38950(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) migrationCachePath];
  id v2 = +[NSMutableDictionary dictionaryWithContentsOfFile:](NSMutableDictionary, "dictionaryWithContentsOfFile:");
  [*(id *)(a1 + 32) setMigratedSortOrderData:v2];

  id v3 = [*(id *)(a1 + 32) migratedSortOrderData];

  if (v3)
  {
    [*(id *)(a1 + 32) q_removeOldMigrationData];
    uint64_t v4 = [*(id *)(a1 + 32) migratedSortOrderData];
    uint64_t v5 = [v4 allValues];

    BOOL v6 = [v5 valueForKeyPath:@"pluginAssetID"];
    id v7 = +[NSMutableDictionary dictionaryWithObjects:v5 forKeys:v6];
    [*(id *)(a1 + 32) setMigratedSortOrderDataByPluginAssetID:v7];
  }
}

void sub_38B9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_38BB4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) migratedSortOrderData];
  uint64_t v3 = [v2 objectForKey:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  BOOL v6 = *(void **)(a1 + 32);
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    [v6 setMigratedPropertiesChanged:1];
    if (!*(unsigned char *)(a1 + 56)) {
      return;
    }
    id v7 = [*(id *)(a1 + 32) migratedSortOrderData];
    [v7 removeObjectForKey:*(void *)(a1 + 40)];

    id v8 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) valueForKey:@"pluginAssetID"];
    if (!v8) {
      goto LABEL_11;
    }
    id v17 = v8;
    unsigned int v9 = [*(id *)(a1 + 32) migratedSortOrderDataByPluginAssetID];
    id v10 = v9;
    id v11 = v17;
  }
  else
  {
    uint64_t v12 = [v6 migratedSortOrderDataByPluginAssetID];
    uint64_t v13 = [v12 objectForKey:*(void *)(a1 + 40)];
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    long long v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
      return;
    }
    [*(id *)(a1 + 32) setMigratedPropertiesChanged:1];
    if (!*(unsigned char *)(a1 + 56)) {
      return;
    }
    id v17 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) valueForKey:@"databaseKey"];
    if (v17)
    {
      id v16 = [*(id *)(a1 + 32) migratedSortOrderData];
      [v16 removeObjectForKey:v17];
    }
    unsigned int v9 = [*(id *)(a1 + 32) migratedSortOrderDataByPluginAssetID];
    id v10 = v9;
    id v11 = *(id *)(a1 + 40);
  }
  [v9 removeObjectForKey:v11];

  id v8 = v17;
LABEL_11:
}

id sub_39280(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) migratedSortOrderData];

  if (!v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    [*(id *)(a1 + 32) setMigratedSortOrderData:v3];
  }
  uint64_t v4 = [*(id *)(a1 + 32) migratedSortOrderData];
  [v4 setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];

  uint64_t v5 = *(void **)(a1 + 32);

  return [v5 setMigratedPropertiesChanged:1];
}

void sub_39448(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSFetchRequest);
  [v2 setReturnsObjectsAsFaults:0];
  uint64_t v3 = +[NSEntityDescription entityForName:@"BKCollection" inManagedObjectContext:*(void *)(a1 + 32)];
  [v2 setEntity:v3];

  uint64_t v42 = a1;
  id v29 = v2;
  [*(id *)(a1 + 32) executeFetchRequest:v2 error:0];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v49;
    CFStringRef v7 = @"sortKey";
    uint64_t v30 = *(void *)v49;
    do
    {
      id v8 = 0;
      id v31 = v5;
      do
      {
        if (*(void *)v49 != v6) {
          objc_enumerationMutation(obj);
        }
        unsigned int v9 = *(void **)(*((void *)&v48 + 1) + 8 * (void)v8);
        id v10 = [v9 valueForKey:@"deletedFlag"];
        id v11 = [v9 valueForKey:@"lastModification"];
        long long v35 = [v9 valueForKey:@"serverSyncUniqueId"];
        uint64_t v37 = [v9 valueForKey:v7];
        uint64_t v36 = [v9 valueForKey:@"title"];
        if (([v10 BOOLValue] & 1) != 0
          || [v37 integerValue] && objc_msgSend(v36, "length"))
        {
          uint64_t v38 = objc_opt_new();
          if (v10) {
            [v38 setObject:v10 forKeyedSubscript:@"deletedFlag"];
          }
          if (v11) {
            [v38 setObject:v11 forKeyedSubscript:@"lastModification"];
          }
          if (v35) {
            [v38 setObject:v35 forKeyedSubscript:@"serverSyncUniqueId"];
          }
          if (v37) {
            [v38 setObject:v37 forKeyedSubscript:v7];
          }
          if (v36) {
            [v38 setObject:v36 forKeyedSubscript:@"title"];
          }
          if (!v10 || ([v10 BOOLValue] & 1) == 0)
          {
            id v33 = v10;
            id v34 = v8;
            uint64_t v12 = objc_opt_new();
            long long v44 = 0u;
            long long v45 = 0u;
            long long v46 = 0u;
            long long v47 = 0u;
            id v39 = [v9 valueForKey:@"members"];
            id v43 = [v39 countByEnumeratingWithState:&v44 objects:v52 count:16];
            if (v43)
            {
              uint64_t v40 = *(void *)v45;
              CFStringRef v41 = v11;
              do
              {
                for (i = 0; i != v43; i = (char *)i + 1)
                {
                  if (*(void *)v45 != v40) {
                    objc_enumerationMutation(v39);
                  }
                  uint64_t v14 = *(void **)(*((void *)&v44 + 1) + 8 * i);
                  long long v15 = [v14 valueForKey:@"databaseKey"];
                  id v16 = [v14 valueForKey:v7];
                  id v17 = objc_opt_new();
                  id v18 = v17;
                  if (v15) {
                    [v17 setObject:v15 forKeyedSubscript:@"databaseKey"];
                  }
                  if (v16) {
                    [v18 setObject:v16 forKeyedSubscript:v7];
                  }
                  [v12 addObject:v18];
                  __int16 v19 = [*(id *)(v42 + 40) fetchMigratedProperties:v15 deleteFoundAssets:0];
                  id v20 = v19;
                  if (v19)
                  {
                    CFStringRef v21 = v7;
                    id v22 = [v19 objectForKey:@"pluginAssetID"];
                    unsigned __int8 v23 = [v22 isEqualToString:v15];

                    if (v23)
                    {
                      NSErrorUserInfoKey v24 = v15;
                    }
                    else
                    {
                      NSErrorUserInfoKey v24 = [v20 objectForKey:@"pluginAssetID"];

                      CFStringRef v25 = objc_opt_new();
                      long long v26 = v25;
                      if (v24) {
                        [v25 setObject:v24 forKeyedSubscript:@"databaseKey"];
                      }
                      if (v16)
                      {
                        uint64_t v27 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", (char *)[v16 longValue] + 100);

                        [v26 setObject:v27 forKeyedSubscript:v21];
                        id v16 = (void *)v27;
                      }
                      [v12 addObject:v26];
                      long long v28 = +[NSDate date];
                      [v38 setObject:v28 forKeyedSubscript:@"lastModification"];
                    }
                    CFStringRef v7 = v21;
                  }
                  else
                  {
                    NSErrorUserInfoKey v24 = v15;
                  }

                  id v11 = v41;
                }
                id v43 = [v39 countByEnumeratingWithState:&v44 objects:v52 count:16];
              }
              while (v43);
            }

            if ([v12 count]) {
              [v38 setObject:v12 forKeyedSubscript:@"members"];
            }

            uint64_t v6 = v30;
            id v5 = v31;
            id v10 = v33;
            id v8 = v34;
          }
          [*(id *)(v42 + 48) addObject:v38];
        }
        id v8 = (char *)v8 + 1;
      }
      while (v8 != v5);
      id v5 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v5);
  }
}

void sub_399D0(uint64_t a1)
{
  id v33 = [*(id *)(a1 + 32) collectionController];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v35 = a1;
  id obj = *(id *)(a1 + 40);
  id v34 = [obj countByEnumeratingWithState:&v41 objects:v58 count:16];
  if (v34)
  {
    uint64_t v32 = *(void *)v42;
    *(void *)&long long v2 = 138413570;
    long long v28 = v2;
    do
    {
      for (i = 0; i != v34; i = (char *)i + 1)
      {
        if (*(void *)v42 != v32) {
          objc_enumerationMutation(obj);
        }
        id v4 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v5 = [v4 objectForKeyedSubscript:@"serverSyncUniqueId" v28];
        uint64_t v6 = [*(id *)(v35 + 32) collectionsWorkerChildContext];
        CFStringRef v7 = [v33 mutableCollectionWithCollectionID:v5 inManagedObjectContext:v6 error:0];

        if (!v7)
        {
          id v8 = [*(id *)(v35 + 32) collectionsWorkerChildContext];
          CFStringRef v7 = +[BKCollection insertNewCollectionWithCollectionID:v5 inManagedObjectContext:v8];

          unsigned int v9 = [v4 objectForKeyedSubscript:@"deletedFlag"];
          id v10 = [v4 objectForKeyedSubscript:@"lastModification"];
          id v11 = [v4 objectForKeyedSubscript:@"sortKey"];
          uint64_t v12 = [v4 objectForKeyedSubscript:@"title"];
          [v7 setDeletedFlag:v9];
          [v7 setSortKey:v11];
          [v7 setTitle:v12];
          [v7 setLastModification:v10];
          [v7 setLocalModDate:0];
        }
        uint64_t v36 = (void *)v5;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        uint64_t v13 = [v4 objectForKeyedSubscript:@"members"];
        id v14 = [v13 countByEnumeratingWithState:&v37 objects:v57 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v38;
          do
          {
            for (j = 0; j != v15; j = (char *)j + 1)
            {
              if (*(void *)v38 != v16) {
                objc_enumerationMutation(v13);
              }
              id v18 = *(void **)(*((void *)&v37 + 1) + 8 * (void)j);
              __int16 v19 = [v18 objectForKeyedSubscript:@"databaseKey"];
              id v20 = [v18 objectForKeyedSubscript:@"sortKey"];
              id v21 = [v7 addCollectionMemberAvoidingDupesWithAssetID:v19 sortKey:v20 forceToTop:0];
            }
            id v15 = [v13 countByEnumeratingWithState:&v37 objects:v57 count:16];
          }
          while (v15);
        }

        id v22 = BKLibraryLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v30 = [v7 collectionID];
          unsigned __int8 v23 = [v7 title];
          NSErrorUserInfoKey v24 = [v7 lastModification];
          CFStringRef v25 = [v7 sortKey];
          long long v26 = [v7 deletedFlag];
          id v29 = [v7 members];
          uint64_t v27 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v29 count]);
          *(_DWORD *)buf = v28;
          long long v46 = v30;
          __int16 v47 = 2112;
          long long v48 = v23;
          __int16 v49 = 2112;
          long long v50 = v24;
          __int16 v51 = 2112;
          id v52 = v25;
          __int16 v53 = 2112;
          id v54 = v26;
          __int16 v55 = 2112;
          BOOL v56 = v27;
          _os_log_debug_impl(&dword_0, v22, OS_LOG_TYPE_DEBUG, "NEW MIGRATED COLLECTION: %@ - %@ %@ [sortKey: %@], [deleted: %@], [%@ members]", buf, 0x3Eu);
        }
      }
      id v34 = [obj countByEnumeratingWithState:&v41 objects:v58 count:16];
    }
    while (v34);
  }
}

void sub_3A358(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) ownershipObservers];
  long long v2 = [v4 allKeys];
  uint64_t v3 = +[NSSet setWithArray:v2];
  [v1 intersectSet:v3];
}

id sub_3A3E4(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _notifyDataSourceIdentifierAndStateObserversForAssetIDs:*(void *)(a1 + 40)];
}

void sub_3A6F4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_3A710(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateProcessingAuthenticationStateImmediate];
}

void sub_3AF78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  sub_3AFE4(v8);
  _Unwind_Resume(a1);
}

uint64_t sub_3AF98(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(a2 + 4_Block_object_dispose(&STACK[0x380], 8) = 0;
  *(void *)(result + 4_Block_object_dispose(&STACK[0x380], 8) = v2;
  uint64_t v3 = *(void *)(a2 + 56);
  *(void *)(a2 + 56) = 0;
  *(void *)(result + 56) = v3;
  uint64_t v4 = *(void *)(a2 + 64);
  *(void *)(a2 + 64) = 0;
  *(void *)(result + 64) = v4;
  uint64_t v5 = *(void *)(a2 + 72);
  *(void *)(a2 + 72) = 0;
  *(void *)(result + 72) = v5;
  LOWORD(v5) = *(_WORD *)(a2 + 80);
  *(unsigned char *)(result + 82) = *(unsigned char *)(a2 + 82);
  *(_WORD *)(result + 80) = v5;
  return result;
}

void sub_3AFDC(uint64_t a1)
{
}

void sub_3AFE4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
}

void sub_3B030(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  [v4 setReturnsObjectsAsFaults:0];
  uint64_t v5 = (void *)a1[4];
  uint64_t v38 = a1[5];
  uint64_t v6 = +[NSArray arrayWithObjects:&v38 count:1];
  CFStringRef v7 = [v5 predicateForAssetIDsTaggedLibraryAssets:v6];

  uint64_t v37 = a1[5];
  uint64_t v8 = +[NSArray arrayWithObjects:&v37 count:1];
  unsigned int v9 = +[BKLibraryManager predicateForTemporaryAssetIDsTaggedLibraryAssets:v8];

  v36[0] = v7;
  v36[1] = v9;
  id v10 = +[NSArray arrayWithObjects:v36 count:2];
  id v11 = +[NSCompoundPredicate orPredicateWithSubpredicates:v10];
  [v4 setPredicate:v11];

  id v35 = 0;
  uint64_t v12 = [v3 executeFetchRequest:v4 error:&v35];

  id v13 = v35;
  if ([v12 count])
  {
    id v14 = [v12 objectAtIndexedSubscript:0];
    uint64_t v15 = [v14 shortBookTitle];
    uint64_t v16 = *(void *)(a1[6] + 8);
    id v17 = *(void **)(v16 + 48);
    *(void *)(v16 + 4_Block_object_dispose(&STACK[0x380], 8) = v15;

    uint64_t v18 = [v14 displayAuthor];
    uint64_t v19 = *(void *)(a1[6] + 8);
    id v20 = *(void **)(v19 + 56);
    *(void *)(v19 + 56) = v18;

    uint64_t v21 = [v14 language];
    uint64_t v22 = *(void *)(a1[6] + 8);
    unsigned __int8 v23 = *(void **)(v22 + 64);
    *(void *)(v22 + 64) = v21;

    uint64_t v24 = [v14 coverWritingMode];
    uint64_t v25 = *(void *)(a1[6] + 8);
    long long v26 = *(void **)(v25 + 72);
    *(void *)(v25 + 72) = v24;

    *(unsigned char *)(*(void *)(a1[6] + 8) + 80) = [v14 isAudiobook];
    *(unsigned char *)(*(void *)(a1[6] + 8) + 81) = [v14 isRightToLeft];
    *(unsigned char *)(*(void *)(a1[6] + 8) + 82) = [v14 isPreorderBook];
  }
  else
  {
    uint64_t v27 = BKLibraryLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_91AFC((uint64_t)(a1 + 5), v27, v28, v29, v30, v31, v32, v33);
    }

    uint64_t v34 = *(void *)(a1[6] + 8);
    id v14 = *(void **)(v34 + 64);
    *(void *)(v34 + 64) = @"en";
  }
}

id sub_3B300(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(id *)a2;
  *(void *)(a1 + _Block_object_dispose(&STACK[0x380], 8) = *(id *)(a2 + 8);
  *(void *)(a1 + 16) = *(id *)(a2 + 16);
  id result = *(id *)(a2 + 24);
  *(void *)(a1 + 24) = result;
  char v5 = *(unsigned char *)(a2 + 34);
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  *(unsigned char *)(a1 + 34) = v5;
  return result;
}

void sub_3B3F8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[NSPredicate predicateWithFormat:@"%K == YES", @"isExplicit"];
  id v5 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  [v5 setReturnsObjectsAsFaults:0];
  [v5 setPredicate:v4];
  id v14 = 0;
  uint64_t v6 = [v3 executeFetchRequest:v5 error:&v14];

  id v7 = v14;
  if (v7)
  {
    uint64_t v8 = BKLibraryLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_91B6C();
    }
  }
  unsigned int v9 = [v6 valueForKey:@"assetID"];
  id v10 = +[NSMutableSet setWithArray:v9];

  id v11 = [v6 valueForKey:@"seriesID"];
  uint64_t v12 = +[NSSet setWithArray:v11];

  [v10 unionSet:v12];
  id v13 = +[NSNull null];
  [v10 removeObject:v13];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void *sub_3D110(uint64_t a1)
{
  v5[0] = 0;
  if (!qword_EE5D0)
  {
    v5[1] = _NSConcreteStackBlock;
    v5[2] = 3221225472;
    v5[3] = sub_3D250;
    void v5[4] = &unk_D26B8;
    v5[5] = v5;
    long long v6 = off_D26A0;
    uint64_t v7 = 0;
    qword_EE5D0 = _sl_dlopen();
    id v3 = (void *)v5[0];
    uint64_t v2 = (void *)qword_EE5D0;
    if (qword_EE5D0)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      id v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  uint64_t v2 = (void *)qword_EE5D0;
LABEL_5:
  id result = dlsym(v2, "SimulateCrash");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_EE5C8 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_3D250()
{
  uint64_t result = _sl_dlopen();
  qword_EE5D0 = result;
  return result;
}

void sub_3D2C4(uint64_t a1, void *a2, void *a3)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_3D3A0;
  v6[3] = &unk_D2708;
  id v7 = a3;
  uint64_t v8 = a1;
  id v5 = v7;
  [a2 enumerateObjectsUsingBlock:v6];
}

id sub_3D35C(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id result = [a2 canMakeAssetsLocal];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

uint64_t sub_3D3A0(uint64_t result, uint64_t a2, char a3)
{
  if ((*(void *)(result + 40) & (1 << a3)) != 0) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void sub_3D3CC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_3D4B4;
  v10[3] = &unk_D2730;
  id v11 = a3;
  long long v6 = *(NSObject **)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v13 = v5;
  id v14 = v7;
  id v8 = v5;
  id v9 = v11;
  dispatch_async(v6, v10);
}

void sub_3D4B4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = BKLibraryLog();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_91BD4();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    int v8 = 138543362;
    uint64_t v9 = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "#datasource DONE fetchAssets from: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  id v6 = objc_retainBlock(*(id *)(a1 + 56));
  id v7 = v6;
  if (v6) {
    (*((void (**)(id, void, void))v6 + 2))(v6, *(void *)(a1 + 48), *(void *)(a1 + 32));
  }
}

void sub_3D5BC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = BUProtocolCast();
  [v7 updateFetchDigest];

  if (v6 || ![v5 count])
  {
    id v8 = objc_retainBlock(*(id *)(a1 + 48));
    uint64_t v9 = v8;
    if (v8) {
      (*((void (**)(id, void, id))v8 + 2))(v8, 0, v6);
    }
  }
  else
  {
    id v10 = BKLibraryLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v5 count];
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134218242;
      id v19 = v11;
      __int16 v20 = 2114;
      uint64_t v21 = v12;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "#datasource fetchAssets Step 2: fetching %lu assets for: %{public}@", buf, 0x16u);
    }

    id v13 = *(void **)(a1 + 32);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    void v14[2] = sub_3D798;
    v14[3] = &unk_D2758;
    id v15 = v5;
    id v16 = *(id *)(a1 + 40);
    id v17 = *(id *)(a1 + 48);
    [v13 fetchAssetsWithIDs:v15 completion:v14];
  }
}

void sub_3D798(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = objc_retainBlock(*(id *)(a1 + 48));
    id v8 = v7;
    if (v7) {
      (*((void (**)(id, void, id))v7 + 2))(v7, 0, v6);
    }
  }
  else
  {
    id v8 = objc_opt_new();
    uint64_t v9 = objc_opt_new();
    if ([v5 count])
    {
      unint64_t v10 = 0;
      do
      {
        id v11 = [v5 objectAtIndexedSubscript:v10];
        uint64_t v12 = +[NSNull null];

        if (v11 == v12)
        {
          id v13 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v10];
          id v14 = v8;
        }
        else
        {
          id v13 = [v5 objectAtIndexedSubscript:v10];
          id v14 = v9;
        }
        [v14 addObject:v13];

        ++v10;
      }
      while (v10 < (unint64_t)[v5 count]);
    }
    if ([v8 count])
    {
      id v15 = BKLibraryLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = *(void *)(a1 + 40);
        int v22 = 138412546;
        id v23 = v8;
        __int16 v24 = 2112;
        uint64_t v25 = v16;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "#datasource fetchAssets Step 2 ignoring failed-to-fetch assets [%@] from: %@", (uint8_t *)&v22, 0x16u);
      }
    }
    id v17 = BKLibraryLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = [v5 count];
      uint64_t v19 = *(void *)(a1 + 40);
      int v22 = 134218242;
      id v23 = v18;
      __int16 v24 = 2114;
      uint64_t v25 = v19;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "#datasource fetchAssets Step 3: returning %lu assets from: %{public}@", (uint8_t *)&v22, 0x16u);
    }

    __int16 v20 = (void (**)(id, id, void))objc_retainBlock(*(id *)(a1 + 48));
    if (v20)
    {
      id v21 = [v9 copy];
      v20[2](v20, v21, 0);
    }
  }
}

void sub_3DA28(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = objc_retainBlock(*(id *)(a1 + 32));
  id v7 = v6;
  if (v6) {
    (*((void (**)(id, id, id))v6 + 2))(v6, v8, v5);
  }
}

void sub_3DAA8(uint64_t a1, void *a2, void *a3)
{
  id v21 = a2;
  id v5 = a3;
  id v6 = (char *)[*(id *)(a1 + 32) count];
  id v7 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v6];
  if (v6)
  {
    for (i = 0; i != v6; ++i)
    {
      uint64_t v9 = +[NSNull null];
      [v7 setObject:v9 atIndexedSubscript:i];
    }
  }
  unint64_t v10 = (char *)[v21 count];
  if (v10)
  {
    id v11 = v10;
    for (j = 0; j != v11; ++j)
    {
      id v13 = [v21 objectAtIndexedSubscript:j];
      id v14 = *(void **)(a1 + 32);
      id v15 = [v13 assetID];
      id v16 = [v14 indexOfObject:v15];

      if (v16 != (id)0x7FFFFFFFFFFFFFFFLL
        || (id v17 = *(void **)(a1 + 32),
            [v13 temporaryAssetID],
            id v18 = objc_claimAutoreleasedReturnValue(),
            id v16 = [v17 indexOfObject:v18],
            v18,
            v16 != (id)0x7FFFFFFFFFFFFFFFLL))
      {
        [v7 setObject:v13 atIndexedSubscript:v16];
      }
    }
  }
  id v19 = objc_retainBlock(*(id *)(a1 + 40));
  __int16 v20 = v19;
  if (v19) {
    (*((void (**)(id, id, id))v19 + 2))(v19, v7, v5);
  }
}

id sub_3DC54(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id result = [a2 canRedownloadAssets];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void sub_3DC98(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_3DCC0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_3DD0C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_3DD44(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_3DD60(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void sub_3DDAC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void sub_3DDCC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_3DE0C(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_error_impl(a1, v4, OS_LOG_TYPE_ERROR, a4, v5, 0xCu);
}

uint64_t sub_3DE2C(uint64_t a1, uint64_t a2)
{
  return a2;
}

void sub_3DE40(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_3DE60(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_3DF10(id a1)
{
  BKLibraryFrameworkBundle();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v3 localizedStringForKey:@"Unknown Author" value:&stru_D4160 table:&stru_D4160];
  uint64_t v2 = (void *)gUnknownAuthor;
  gUnknownAuthor = v1;
}

void sub_3DFCC(id a1)
{
  BKLibraryFrameworkBundle();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v3 localizedStringForKey:@"No Title" value:&stru_D4160 table:&stru_D4160];
  uint64_t v2 = (void *)gUnknownTitle;
  gUnknownTitle = v1;
}

void sub_3E088(id a1)
{
  BKLibraryFrameworkBundle();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v3 localizedStringForKey:@"Multiple Authors" value:&stru_D4160 table:&stru_D4160];
  uint64_t v2 = (void *)gMultipleAuthors;
  gMultipleAuthors = v1;
}

void sub_40E1C(id a1)
{
  uint64_t v1 = objc_alloc_init(BKLibraryAssetStatusController);
  uint64_t v2 = qword_EE5F8;
  qword_EE5F8 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_413AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,id location)
{
  objc_destroyWeak(v46);
  objc_destroyWeak(v45);
  objc_destroyWeak(v44);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_41400(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained _filterUpdateForAsset:v3];

  return v5;
}

id sub_41454(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained _filterDownloadForAsset:v3];

  return v5;
}

id sub_414A8(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained _filterUploadsForAsset:v3];

  return v5;
}

void sub_414FC(uint64_t a1)
{
  id v2 = objc_alloc((Class)BCManagedObjectIDMonitor);
  id v3 = [*(id *)(a1 + 40) persistentStoreCoordinator];
  id v4 = +[BKLibraryManager predicateForAllStoreLibraryAssetsExcludingUnpurchasedSeriesAssets];
  id v5 = [v2 initWithContext:0 coordinator:v3 entityName:@"BKLibraryAsset" predicate:v4 mapProperty:@"assetID" propertiesOfInterest:0 observer:*(void *)(a1 + 32)];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v5;

  id v8 = objc_alloc((Class)BCManagedObjectIDMonitor);
  id v13 = [*(id *)(a1 + 40) persistentStoreCoordinator];
  uint64_t v9 = +[BKLibraryManager predicateForExcludingContainerLibraryAssets];
  id v10 = [v8 initWithContext:0 coordinator:v13 entityName:@"BKLibraryAsset" predicate:v9 mapProperty:@"assetID" propertiesOfInterest:0 observer:*(void *)(a1 + 32)];
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void **)(v11 + 80);
  *(void *)(v11 + 80) = v10;
}

id sub_4163C(uint64_t a1)
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = [*(id *)(*(void *)(a1 + 32) + 48) allKeys];
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        id v8 = [*(id *)(a1 + 32) statusForAssetID:v7];
        uint64_t v9 = +[BKLibraryDownloadStatus statusWithAssetID:v7 state:1 progressValue:-1 timeRemaining:0.0];
        [v8 updateWithStatus:v9];

        [*(id *)(a1 + 32) _addAssetID:v7];
      }
      id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  return [*(id *)(a1 + 32) _updatedAssets];
}

id sub_41A4C(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) rearrangeObjects];
  [*(id *)(*(void *)(a1 + 32) + 8) rearrangeObjects];
  id v2 = *(void **)(*(void *)(a1 + 32) + 24);

  return [v2 rearrangeObjects];
}

uint64_t sub_41A9C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_41AAC(uint64_t a1)
{
  return [*(id *)(a1 + 32) rearrangeObjects];
}

uint64_t sub_41AB4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_41E14(uint64_t a1)
{
  id v4 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  [v4 encodeObject:*(void *)(a1 + 32) forKey:@"Root"];
  [v4 finishEncoding];
  id v2 = [v4 encodedData];
  id v3 = [*(id *)(a1 + 40) _persistedInfoURL];
  [v2 writeToURL:v3 atomically:1];
}

void sub_421D4(void *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a2 == 2)
  {
    id v11 = objc_begin_catch(exc_buf);
    long long v12 = [v10 _persistedInfoURL];
    NSLog(@"Failed to read: %@ -- %@");

    objc_end_catch();
    JUMPOUT(0x42150);
  }
  objc_begin_catch(exc_buf);
  objc_exception_rethrow();
}

void sub_42248(_Unwind_Exception *a1)
{
}

void sub_42B80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_42BA4(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  uint64_t v5 = (char *)[*(id *)(a1 + 32) containsObject:a2];
  id v6 = v9;
  if (v5)
  {
    uint64_t v5 = (char *)[v9 state];
    if ((unint64_t)(v5 - 2) >= 2)
    {
      id v6 = v9;
      if ((unint64_t)(v5 - 4) > 1) {
        goto LABEL_6;
      }
      uint64_t v5 = (char *)[v9 progressValue];
      *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v7
                                                                  + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                              + 24);
    }
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    id v6 = v9;
  }
LABEL_6:

  return _objc_release_x1(v5, v6);
}

void sub_42E48(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v4 = *(id *)(a1 + 32);
  id v5 = [v4 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v47;
    id v38 = v4;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v47 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v46 + 1) + 8 * i);
        id v10 = [*(id *)(a1 + 40) objectForKey:v9];
        if (v10)
        {
          id v11 = [*(id *)(a1 + 48) libraryAssetWithAssetID:v9 inManagedObjectContext:v3];
          if ([v11 isContainer])
          {
            [*(id *)(a1 + 56) addObject:v9];
LABEL_34:

            goto LABEL_35;
          }
          if (![v10 state]) {
            goto LABEL_34;
          }
          long long v12 = [v11 seriesID];
          if (v12)
          {
            uint64_t v13 = [*(id *)(a1 + 48) libraryAssetWithAssetID:v12 inManagedObjectContext:v3];
            long long v14 = (void *)v13;
            if (v13)
            {
              long long v39 = (void *)v13;
              [*(id *)(a1 + 56) addObject:v12];
              unint64_t v15 = (unint64_t)[v10 state];
              if (v15 > 0xB) {
                goto LABEL_31;
              }
              long long v14 = v39;
              if (((1 << v15) & 0xFA0) == 0)
              {
                if (((1 << v15) & 0x1C) != 0 && ([v39 isDownloading] & 1) == 0)
                {
                  id v16 = [v11 purchasedAndLocalParent];
                  if (v16) {
                    unsigned int v35 = 0;
                  }
                  else {
                    unsigned int v35 = [v11 isSample] ^ 1;
                  }

                  id v17 = [v11 localOnlySeriesItemsParent];
                  if (v17) {
                    unsigned int v37 = 0;
                  }
                  else {
                    unsigned int v37 = [v11 isSample] ^ 1;
                  }

                  id v18 = [*(id *)(a1 + 40) objectForKey:v9];
                  if ((char *)[v18 state] - 2 <= (unsigned char *)&dword_0 + 2)
                  {
                    uint64_t v34 = [*(id *)(a1 + 48) libraryMutableAssetWithAssetID:v12 inManagedObjectContext:v3];
                    [v34 setState:2];
                    if ((v35 | v37) == 1)
                    {
                      id v19 = [*(id *)(a1 + 48) libraryMutableAssetWithAssetID:v9 inManagedObjectContext:v3];
                      if (v35)
                      {
                        uint64_t v36 = v19;
                        [v19 setPurchasedAndLocalParent:v34];
                        [*(id *)(a1 + 48) updateAuthorForSeriesContainer:v34];
                        id v19 = v36;
                      }
                      if (v37)
                      {
                        __int16 v20 = v19;
                        [v19 setLocalOnlySeriesItemsParent:v34];
                        id v19 = v20;
                      }
                    }
                  }
                }
LABEL_31:
                id v21 = [*(id *)(a1 + 64) objectForKey:v12];
                int v22 = (char *)[v21 integerValue];

                id v23 = *(void **)(a1 + 64);
                __int16 v24 = +[NSNumber numberWithInteger:v22 + 1];
                [v23 setObject:v24 forKey:v12];

                uint64_t v25 = [*(id *)(a1 + 72) objectForKey:v12];
                [v25 floatValue];
                float v27 = v26;

                uint64_t v28 = *(void **)(a1 + 72);
                [v10 progressValue];
                double v30 = v29 + v27;
                *(float *)&double v30 = v30;
                uint64_t v31 = +[NSNumber numberWithFloat:v30];
                [v28 setObject:v31 forKey:v12];

                id v4 = v38;
                long long v14 = v39;
              }
            }
          }
          goto LABEL_34;
        }
LABEL_35:
      }
      id v6 = [v4 countByEnumeratingWithState:&v46 objects:v50 count:16];
    }
    while (v6);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_432C0;
  block[3] = &unk_D28C8;
  id v32 = *(id *)(a1 + 56);
  uint64_t v33 = *(void *)(a1 + 80);
  id v41 = v32;
  uint64_t v42 = v33;
  id v43 = *(id *)(a1 + 64);
  id v44 = *(id *)(a1 + 72);
  id v45 = *(id *)(a1 + 48);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_432C0(uint64_t a1)
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v21;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v8 = [*(id *)(a1 + 40) statusForAssetID:v7];
        uint64_t v9 = [*(id *)(a1 + 48) objectForKey:v7];
        id v10 = [v9 integerValue];

        id v11 = [*(id *)(a1 + 56) objectForKey:v7];
        [v11 floatValue];
        float v13 = v12;

        if (v10)
        {
          id v14 = +[BKLibraryDownloadStatus statusWithAssetID:v7 state:4 progressValue:-1 timeRemaining:(float)(v13 / (float)(unint64_t)v10)];
          [v8 updateWithStatus:v14];
        }
        else
        {
          unint64_t v15 = +[BKLibraryDownloadStatus statusWithAssetID:v7 state:5 progressValue:-1 timeRemaining:1.0];
          [v8 updateWithStatus:v15];

          id v16 = *(void **)(a1 + 64);
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 3221225472;
          v17[2] = sub_434F4;
          v17[3] = &unk_D18D8;
          id v18 = v16;
          uint64_t v19 = v7;
          [v18 performBlockOnWorkerQueue:v17];
          id v14 = v18;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v4);
  }
}

void sub_434F4(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) libraryMutableAssetWithAssetID:*(void *)(a1 + 40) inManagedObjectContext:a2];
  if ([v2 state] != 5) {
    [v2 setState:5];
  }
}

void sub_43678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_4369C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ([*(id *)(a1 + 32) containsObject:a2])
  {
    if ([v5 canPause]) {
      ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    }
    if ([v5 canResume]) {
      ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    }
  }
}

void sub_43858(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_4387C(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) containsObject:v7])
  {
    if ([v5 state] == (char *)&dword_4 + 1)
    {
      if (![*(id *)(*(void *)(a1 + 40) + 104) containsObject:*(void *)(a1 + 32)]
        || ([*(id *)(*(void *)(a1 + 40) + 112) containsObject:v7] & 1) == 0)
      {
        uint64_t v6 = *(void *)(a1 + 48);
LABEL_9:
        ++*(void *)(*(void *)(v6 + 8) + 24);
      }
    }
    else if ([v5 state] == (char *)&dword_0 + 1 {
           && ([*(id *)(*(void *)(a1 + 40) + 112) containsObject:v7] & 1) == 0)
    }
    {
      uint64_t v6 = *(void *)(a1 + 56);
      goto LABEL_9;
    }
  }
}

void sub_43A88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_43ABC(uint64_t a1, uint64_t a2)
{
  id v7 = [*(id *)(a1 + 32) statusForAssetID:a2];
  if ([v7 state] == (char *)&dword_8 + 1)
  {
    uint64_t v3 = *(void *)(a1 + 40);
LABEL_5:
    id v4 = (void *)(*(void *)(v3 + 8) + 24);
    id v5 = v7;
LABEL_6:
    ++*v4;
    goto LABEL_7;
  }
  if ([v7 state] == (char *)&dword_8 + 2)
  {
    uint64_t v3 = *(void *)(a1 + 48);
    goto LABEL_5;
  }
  BOOL v6 = [v7 state] == (char *)&dword_8 + 3;
  id v5 = v7;
  if (v6)
  {
    id v4 = (void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    goto LABEL_6;
  }
LABEL_7:
}

void sub_43C4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_43C64(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_43C74(uint64_t a1)
{
}

void sub_43C7C(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  if (![a3 count])
  {
    id v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (!v5)
    {
      uint64_t v6 = objc_opt_new();
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
      id v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      id v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    [v5 addObject:v9];
  }
}

id sub_44070(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _processDownloadRelatedNotificationsCompletion:a2];
}

id sub_441AC(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 216) addObject:*(void *)(a1 + 40)];
}

void sub_44254(uint64_t a1)
{
  id v2 = objc_opt_new();
  uint64_t v31 = a1;
  group = dispatch_group_create();
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = *(id *)(*(void *)(a1 + 32) + 216);
  id v3 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v3)
  {
    id v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v45;
    double v29 = v42;
    double v30 = v39;
    while (1)
    {
      uint64_t v7 = 0;
      id v8 = v5;
      do
      {
        if (*(void *)v45 != v6) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v44 + 1) + 8 * (void)v7);
        if (v8)
        {
          id v10 = [*(id *)(*((void *)&v44 + 1) + 8 * (void)v7) name:v29, v30];
          unsigned __int8 v11 = [v8 isEqualToString:v10];

          if ((v11 & 1) == 0
            && [v8 isEqualToString:@"BKLibraryDownloadStatusNotification"]
            && [v2 count])
          {
            dispatch_group_enter(group);
            float v12 = *(void **)(v31 + 32);
            id v13 = [v2 copy];
            v41[0] = _NSConcreteStackBlock;
            v41[1] = 3221225472;
            v42[0] = sub_44744;
            v42[1] = &unk_D1520;
            id v43 = group;
            [v12 _processDownloadStatuses:v13 completion:v41];

            [v2 removeAllObjects];
          }
        }
        id v14 = [v9 name:v29, v30];
        unsigned int v15 = [v14 isEqualToString:@"BKLibraryDownloadStatusNotification"];

        if (v15)
        {
          id v16 = v4;
          uint64_t v17 = v6;
          id v18 = v2;
          objc_opt_class();
          uint64_t v19 = [v9 userInfo];
          long long v20 = [v19 objectForKeyedSubscript:@"BKLibraryDownloadStatusKey"];
          long long v21 = BUDynamicCast();

          if ([v21 count])
          {
            long long v22 = [v21 allObjects];
            id v2 = v18;
            [v18 addObjectsFromArray:v22];
          }
          else
          {
            id v2 = v18;
          }
          uint64_t v6 = v17;
          id v4 = v16;
        }
        else
        {
          long long v23 = [v9 name];
          unsigned int v24 = [v23 isEqualToString:@"BKLibraryOwnershipDidChangeNotification"];

          if (!v24) {
            goto LABEL_19;
          }
          dispatch_group_enter(group);
          uint64_t v25 = *(void **)(v31 + 32);
          v38[0] = _NSConcreteStackBlock;
          v38[1] = 3221225472;
          v39[0] = sub_4474C;
          v39[1] = &unk_D1520;
          long long v40 = group;
          [v25 _processLibraryOwnershipNotification:v9 completion:v38];
          long long v21 = v40;
        }

LABEL_19:
        id v5 = [v9 name];

        uint64_t v7 = (char *)v7 + 1;
        id v8 = v5;
      }
      while (v4 != v7);
      id v4 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
      if (!v4) {
        goto LABEL_23;
      }
    }
  }
  id v5 = 0;
LABEL_23:

  [*(id *)(*(void *)(v31 + 32) + 216) removeAllObjects];
  if ([v5 isEqualToString:@"BKLibraryDownloadStatusNotification"]
    && [v2 count])
  {
    dispatch_group_enter(group);
    float v26 = *(void **)(v31 + 32);
    id v27 = [v2 copy];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    void v36[2] = sub_44754;
    v36[3] = &unk_D1520;
    unsigned int v37 = group;
    [v26 _processDownloadStatuses:v27 completion:v36];
  }
  uint64_t v28 = *(NSObject **)(*(void *)(v31 + 32) + 144);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4475C;
  block[3] = &unk_D2878;
  id v35 = *(id *)(v31 + 40);
  dispatch_group_notify(group, v28, block);
}

void sub_44744(uint64_t a1)
{
}

void sub_4474C(uint64_t a1)
{
}

void sub_44754(uint64_t a1)
{
}

void sub_4475C(uint64_t a1)
{
  uint64_t v1 = (void (**)(void))objc_retainBlock(*(id *)(a1 + 32));
  if (v1)
  {
    id v2 = v1;
    v1[2]();
    uint64_t v1 = v2;
  }
}

void sub_44878(uint64_t a1)
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_4492C;
  v7[3] = &unk_D1418;
  id v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v4;
  [v2 _updateAssetsWithBlock:v7];
  id v5 = objc_retainBlock(*(id *)(a1 + 48));
  uint64_t v6 = v5;
  if (v5) {
    (*((void (**)(id))v5 + 2))(v5);
  }
}

id sub_4492C(uint64_t a1)
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v8 = [v7 assetID:v11];
        if (v8)
        {
          uint64_t v9 = [*(id *)(a1 + 40) statusForAssetID:v8];
          if ([v9 state] != &dword_8 && objc_msgSend(v7, "state") != &dword_8) {
            [*(id *)(a1 + 40) _addAssetID:v8];
          }
          [v9 updateWithStatus:v7];
          if ([v9 state] == &dword_8)
          {
            [*(id *)(*(void *)(a1 + 40) + 40) removeObjectForKey:v8];
            [*(id *)(*(void *)(a1 + 40) + 112) removeObject:v8];
            [*(id *)(*(void *)(a1 + 40) + 104) removeObject:v8];
            [*(id *)(a1 + 40) _removeAssetID:v8];
            [*(id *)(*(void *)(a1 + 40) + 48) removeObjectForKey:v8];
          }
        }
        else
        {
          unsigned __int8 v11 = v7;
          BCReportAssertionFailureWithMessage();
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }

  return [*(id *)(a1 + 40) _updatedAssets];
}

void sub_44BC0(uint64_t a1)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_44C50;
  v5[3] = &unk_D1418;
  id v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 _updateAssetsWithBlock:v5];
}

void sub_44C50(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"BKLibraryUpdateAssetsKey"];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v4 = [*(id *)(*(void *)(a1 + 40) + 48) allKeys];
  id v5 = [v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v26;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(a1 + 40) _updateInfoForAssetID:*(void *)(*((void *)&v25 + 1) + 8 * i)];
        [v9 removeObjectForKey:@"ContentUpdate"];
      }
      id v6 = [v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v6);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v3;
  id v10 = [obj countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (j = 0; j != v11; j = (char *)j + 1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * (void)j);
        long long v15 = [*(id *)(a1 + 40) _updateInfoForAssetID:v14];
        [v15 setObject:&__kCFBooleanTrue forKey:@"ContentUpdate"];
        id v16 = [*(id *)(*(void *)(a1 + 40) + 16) arrangedObjects];
        unsigned __int8 v17 = [v16 containsObject:v14];

        if ((v17 & 1) == 0)
        {
          id v18 = [*(id *)(a1 + 40) statusForAssetID:v14];
          uint64_t v19 = +[BKLibraryDownloadStatus statusWithAssetID:v14 state:1 progressValue:-1 timeRemaining:0.0];
          [v18 updateWithStatus:v19];

          [*(id *)(a1 + 40) _addAssetID:v14];
        }
      }
      id v11 = [obj countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v11);
  }

  [*(id *)(a1 + 40) _updatedAssets];
}

id sub_44F88(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) removeObjectForKey:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _removeAssetID:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _updatedAssets];
  [*(id *)(*(void *)(a1 + 32) + 112) removeObject:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 104) removeObject:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 40);

  return [v3 removeObjectForKey:v2];
}

id sub_450B4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 216) addObject:*(void *)(a1 + 40)];
}

void sub_454B0(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) statusForAssetID:*(void *)(a1 + 40)];
  if (![v3 state] || objc_msgSend(v3, "state") == (char *)&dword_0 + 1) {
    [*(id *)(a1 + 32) _removeTrackingOfAssetID:*(void *)(a1 + 40)];
  }
  if ((*(_WORD *)(a1 + 56) != 2 || [v3 state] != (char *)&dword_4 + 1)
    && ([v3 state] == (char *)&dword_4 + 1 || objc_msgSend(v3, "state") == &dword_4))
  {
    uint64_t v2 = +[BKLibraryDownloadStatus statusWithAssetID:*(void *)(a1 + 40) state:0 progressValue:-1 timeRemaining:0.0];
    [v3 updateWithStatus:v2];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_45598(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_45634;
  v3[3] = &unk_D1418;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  [v2 _updateAssetsWithBlock:v3];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_45634(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) statusForAssetID:*(void *)(a1 + 40)];
  if (![v3 state])
  {
    uint64_t v2 = +[BKLibraryDownloadStatus statusWithAssetID:*(void *)(a1 + 40) state:4 progressValue:-1 timeRemaining:0.0];
    [v3 updateWithStatus:v2];
  }
  [*(id *)(a1 + 32) _addAssetID:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _updatedAssets];
}

void sub_456D0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) arrangedObjects];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  id v4 = [*(id *)(*(void *)(a1 + 32) + 8) arrangedObjects];
  unsigned int v5 = [v4 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) != 0 || v5)
  {
    id v6 = [*(id *)(a1 + 32) statusForAssetID:*(void *)(a1 + 40)];
    if ([v6 state] == &dword_4 && *(_WORD *)(a1 + 56) != 3)
    {
      uint64_t v7 = *(void **)(a1 + 32);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      void v14[2] = sub_45890;
      v14[3] = &unk_D1418;
      id v15 = v6;
      id v16 = *(id *)(a1 + 40);
      [v7 _updateAssetsWithBlock:v14];
    }
    if (([v6 hasFinished] & 1) == 0)
    {
      id v8 = *(void **)(a1 + 32);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_458FC;
      v9[3] = &unk_D2A20;
      char v12 = v5;
      id v10 = v6;
      id v11 = *(id *)(a1 + 40);
      unsigned __int8 v13 = v3;
      [v8 _updateAssetsWithBlock:v9];
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_45890(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = +[BKLibraryDownloadStatus statusWithAssetID:*(void *)(a1 + 40) state:5 progressValue:-1 timeRemaining:1.0];
  [v1 updateWithStatus:v2];
}

void sub_458FC(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    id v2 = *(void **)(a1 + 32);
    uint64_t v1 = *(void *)(a1 + 40);
    uint64_t v3 = 0;
  }
  else
  {
    if (!*(unsigned char *)(a1 + 49)) {
      return;
    }
    id v2 = *(void **)(a1 + 32);
    uint64_t v1 = *(void *)(a1 + 40);
    uint64_t v3 = 1;
  }
  id v4 = +[BKLibraryDownloadStatus statusWithAssetID:v1 state:v3 progressValue:-1 timeRemaining:0.0];
  [v2 updateWithStatus:];
}

void sub_459A4(uint64_t a1)
{
  uint64_t v1 = (void (**)(void))objc_retainBlock(*(id *)(a1 + 32));
  if (v1)
  {
    id v2 = v1;
    v1[2]();
    uint64_t v1 = v2;
  }
}

void sub_45A8C(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) statusForAssetID:*(void *)(a1 + 40)];
  id v2 = +[BKLibraryDownloadStatus statusWithAssetID:*(void *)(a1 + 40) state:7 progressValue:-1 timeRemaining:0.0];
  [v3 updateWithStatus:v2];

  [*(id *)(a1 + 32) _addAssetID:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _updatedAssets];
}

void sub_45C08(uint64_t a1, int a2)
{
  if (a2)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_45C98;
    v3[3] = &unk_D1418;
    id v2 = *(void **)(a1 + 40);
    v3[4] = *(void *)(a1 + 32);
    id v4 = v2;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
  }
}

void sub_45C98(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) statusForAssetID:*(void *)(a1 + 40)];
  [v2 updateWithWaitingToBeDownloadable:1];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  unsigned int v5 = *(void **)(v3 + 64);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_45D74;
  v7[3] = &unk_D2A70;
  void v7[4] = v3;
  id v8 = v4;
  id v9 = v2;
  id v6 = v2;
  [v5 waitForBookWithAssetID:v8 toBeDownloadableWithTimeout:v7 completion:120.0];
}

void sub_45D74(uint64_t a1, int a2)
{
  if (a2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_45E90;
    block[3] = &unk_D1A38;
    uint64_t v3 = *(void **)(a1 + 40);
    void block[4] = *(void *)(a1 + 32);
    id v4 = &v9;
    id v9 = v3;
    id v10 = *(id *)(a1 + 48);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_46350;
    v6[3] = &unk_D1418;
    unsigned int v5 = *(void **)(a1 + 40);
    void v6[4] = *(void *)(a1 + 32);
    id v4 = &v7;
    id v7 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

void sub_45E90(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  void v12[2] = sub_46060;
  v12[3] = &unk_D1418;
  void v12[4] = v2;
  id v13 = *(id *)(a1 + 40);
  [v2 _updateAssetsWithBlock:v12];
  if (([*(id *)(a1 + 48) canStart] & 1) != 0
    || [*(id *)(a1 + 48) canRestart])
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_460A4;
    v9[3] = &unk_D1A38;
    void v9[4] = *(void *)(a1 + 32);
    id v10 = *(id *)(a1 + 48);
    id v11 = *(id *)(a1 + 40);
    uint64_t v3 = objc_retainBlock(v9);
    id v4 = [*(id *)(*(void *)(a1 + 32) + 16) arrangedObjects];
    unsigned __int8 v5 = [v4 containsObject:*(void *)(a1 + 40)];

    if (v5)
    {
      ((void (*)(void *))v3[2])(v3);
    }
    else
    {
      id v6 = *(void **)(a1 + 32);
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_46340;
      v7[3] = &unk_D2A48;
      id v8 = v3;
      [v6 checkForUpdates:v7];
    }
  }
}

id sub_46060(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 104) removeObject:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 112);

  return [v3 removeObject:v2];
}

void sub_460A4(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4614C;
  block[3] = &unk_D1A38;
  uint64_t v2 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v4 = v2;
  id v5 = *(id *)(a1 + 48);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_4614C(uint64_t a1)
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_46328;
  v10[3] = &unk_D1520;
  uint64_t v2 = *(void **)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  [v2 _updateAssetsWithBlock:v10];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 16) arrangedObjects];
  if ([v3 containsObject:*(void *)(a1 + 48)])
  {
    if ([*(id *)(a1 + 40) canStart])
    {

LABEL_6:
      id v5 = *(void **)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 48);
      id v6 = +[NSArray arrayWithObjects:&v12 count:1];
      [v5 _startUpdateForAssetIDs:v6];

      goto LABEL_11;
    }
    unsigned __int8 v4 = [*(id *)(a1 + 40) canRestart];

    if (v4) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  if (([*(id *)(a1 + 40) canPause] & 1) == 0
    && ([*(id *)(a1 + 40) canResume] & 1) == 0
    && ([*(id *)(a1 + 40) canRestart] & 1) == 0)
  {
    id v7 = *(void **)(a1 + 32);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_46334;
    v8[3] = &unk_D1418;
    void v8[4] = v7;
    id v9 = *(id *)(a1 + 48);
    [v7 _updateAssetsWithBlock:v8];
  }
LABEL_11:
}

id sub_46328(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateWithWaitingToBeDownloadable:0];
}

id sub_46334(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _showUpdateFailureForAssetID:*(void *)(a1 + 40)];
}

uint64_t sub_46340(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_46350(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _showUpdateFailureForAssetID:*(void *)(a1 + 40)];
}

void sub_46404(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = *(id *)(a1 + 32);
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        [v2 setObject:&__kCFBooleanFalse forKeyedSubscript:*(void *)(*((void *)&v13 + 1) + 8 * (void)v7)];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = *(void **)(v8 + 64);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_46590;
  v11[3] = &unk_D2A98;
  void v11[4] = v8;
  id v12 = v2;
  id v10 = v2;
  [v9 startUpdateForAssets:v10 completion:v11];
}

void sub_46590(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_46620;
    v3[3] = &unk_D1418;
    uint64_t v2 = *(void **)(a1 + 40);
    v3[4] = *(void *)(a1 + 32);
    id v4 = v2;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
  }
}

void sub_46620(uint64_t a1)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_466B0;
  v5[3] = &unk_D1418;
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 _updateAssetsWithBlock:v5];
}

void sub_466B0(uint64_t a1)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        uint64_t v8 = [*(id *)(a1 + 40) statusForAssetID:v7];
        id v9 = +[BKLibraryDownloadStatus statusWithAssetID:v7 state:7 progressValue:-1 timeRemaining:0.0];
        [v8 updateWithStatus:v9];
      }
      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

void sub_4689C(uint64_t a1)
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 56);
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) pauseDownloadForAssetID:*(void *)(a1 + 40) v7];
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

void sub_46A38(uint64_t a1)
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 56);
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) resumeDownloadForAssetID:*(void *)(a1 + 40) v7];
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

void sub_46D9C(uint64_t a1)
{
  id v2 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [*(id *)(*(void *)(a1 + 32) + 40) copy];
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        long long v9 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKey:v8];
        if ([v9 state] == (char *)&dword_4 + 1)
        {
          [*(id *)(*(void *)(a1 + 32) + 40) removeObjectForKey:v8];
          [*(id *)(*(void *)(a1 + 32) + 48) removeObjectForKey:v8];
          [v2 addObject:v8];
          [*(id *)(*(void *)(a1 + 32) + 112) removeObject:v8];
          [*(id *)(*(void *)(a1 + 32) + 104) removeObject:v8];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  if ([v2 count]) {
    [*(id *)(a1 + 32) _removeAssetIDs:v2];
  }
}

void sub_46FA8(uint64_t a1)
{
  id v2 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [*(id *)(*(void *)(a1 + 32) + 40) copy];
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        long long v9 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKey:v8];
        if ([v9 state] == (char *)&dword_8 + 3)
        {
          [*(id *)(*(void *)(a1 + 32) + 40) removeObjectForKey:v8];
          [v2 addObject:v8];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  if ([v2 count]) {
    [*(id *)(a1 + 32) _removeAssetIDs:v2];
  }
}

void sub_471C8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_47288;
  v8[3] = &unk_D2AC0;
  uint64_t v6 = *(void **)(a1 + 40);
  void v8[4] = *(void *)(a1 + 32);
  id v10 = v6;
  uint64_t v11 = a2;
  id v9 = v5;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
}

uint64_t sub_47288(uint64_t a1)
{
  [*(id *)(a1 + 32) setCheckingForUpdates:0];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void sub_47444(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableSet);
  id v3 = [*(id *)(*(void *)(a1 + 32) + 16) arrangedObjects];
  [v2 addObjectsFromArray:v3];

  id v4 = [*(id *)(*(void *)(a1 + 32) + 8) arrangedObjects];
  [v2 addObjectsFromArray:v4];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v2;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKey:v10];
        long long v12 = v11;
        if (v11)
        {
          if ([v11 state] == (char *)&dword_4 + 1)
          {
            uint64_t v13 = 104;
          }
          else
          {
            if ([v12 state] != (char *)&dword_0 + 1) {
              goto LABEL_12;
            }
            uint64_t v13 = 112;
          }
          [*(id *)(*(void *)(a1 + 32) + v13) addObject:v10];
        }
LABEL_12:
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

id sub_47660(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_476D0;
  v3[3] = &unk_D1520;
  v3[4] = v1;
  return [v1 _updateAssetsWithBlock:v3];
}

id sub_476D0(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) rearrangeObjects];
}

void sub_47894(uint64_t a1)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_47928;
  v4[3] = &unk_D1418;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = v2;
  uint64_t v6 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

id sub_47928(uint64_t a1)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = [*(id *)(a1 + 32) deletedObjects];
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(a1 + 40) _removeTrackingOfAssetID:*(void *)(*((void *)&v10 + 1) + 8 * (void)v6)];
        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  id v7 = *(void **)(a1 + 40);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_47A74;
  v9[3] = &unk_D1520;
  void v9[4] = v7;
  return [v7 _updateAssetsWithBlock:v9];
}

id sub_47A74(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) rearrangeObjects];
  id v2 = *(void **)(*(void *)(a1 + 32) + 16);

  return [v2 rearrangeObjects];
}

uint64_t sub_47B90(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 40);
  id v4 = [a2 assetID];
  uint64_t v5 = [v3 objectForKey:v4];
  uint64_t v6 = (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v5);

  return v6;
}

id sub_47DDC(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_47E4C;
  v3[3] = &unk_D1520;
  v3[4] = v1;
  return [v1 _updateAssetsWithBlock:v3];
}

id sub_47E4C(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) rearrangeObjects];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);

  return [v2 rearrangeObjects];
}

void sub_489FC(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 40) != *(unsigned __int8 *)(*(void *)(a1 + 32) + 8))
  {
    uint64_t v2 = BKLibraryAssetDetailsLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      if (*(unsigned char *)(a1 + 40)) {
        CFStringRef v3 = @"YES";
      }
      else {
        CFStringRef v3 = @"NO";
      }
      *(_DWORD *)buf = 138543362;
      CFStringRef v17 = v3;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "Set enable cloud merge:%{public}@", buf, 0xCu);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + _Block_object_dispose(&STACK[0x380], 8) = *(unsigned char *)(a1 + 40);
    if (*(unsigned char *)(a1 + 40))
    {
      id v4 = objc_alloc((Class)BCManagedObjectIDMonitor);
      uint64_t v5 = [*(id *)(a1 + 32) libraryManager];
      uint64_t v6 = [v5 persistentStoreCoordinator];
      id v7 = +[BKLibraryManager predicateForExcludingContainerLibraryAssets];
      v15[0] = @"isFinished";
      v15[1] = @"notFinished";
      void v15[2] = @"taste";
      v15[3] = @"tasteSyncedToStore";
      void v15[4] = @"lastOpenDate";
      void v15[5] = @"dateFinished";
      v15[6] = @"isTrackedAsRecent";
      v15[7] = @"lastEngagedDate";
      uint64_t v8 = +[NSArray arrayWithObjects:v15 count:8];
      id v9 = +[NSSet setWithArray:v8];
      id v10 = [v4 initWithContext:0 coordinator:v6 entityName:@"BKLibraryAsset" predicate:v7 mapProperty:@"assetID" propertiesOfInterest:v9 observer:*(void *)(a1 + 32)];
      [*(id *)(a1 + 32) setLibraryAssetMonitor:v10];

      long long v11 = [*(id *)(a1 + 32) cloudAssetDetailManager];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      void v14[2] = sub_48CE4;
      v14[3] = &unk_D2B38;
      void v14[4] = *(void *)(a1 + 32);
      [v11 currentAssetDetailCloudSyncVersions:v14];

      long long v12 = [*(id *)(a1 + 32) cloudReadingNowDetailManager];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_48EA4;
      v13[3] = &unk_D2B38;
      void v13[4] = *(void *)(a1 + 32);
      [v12 currentReadingNowDetailCloudSyncVersions:v13];
    }
  }
}

void sub_48CE4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) libraryManager];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_48DA4;
  v6[3] = &unk_D18D8;
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v5 = v3;
  [v4 performNamed:@"setEnableCloudMerge" workerQueueBlock:v6];
}

void sub_48DA4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) libraryManager];
  id v5 = [v4 cloudSyncVersionsForDataType:@"BCAssetDetail" inContext:v3];

  uint64_t v6 = [*(id *)(a1 + 40) historyToken];
  if (!v6 || ![v5 localVersion])
  {

    goto LABEL_8;
  }
  id v7 = [v5 localVersion];
  id v8 = [v5 syncVersion];

  if (v7 != v8)
  {
LABEL_8:
    [*(id *)(a1 + 32) p_syncAllAssetDetailChangesToCloudInMOC:v3];
    goto LABEL_9;
  }
  id v9 = BKLibraryAssetDetailsLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_91D6C();
  }

LABEL_9:
  [*(id *)(a1 + 32) _checkForChangesFromCloudAssetDetailManagerInMOC:v3 reason:@"enableCloudMerge"];
}

void sub_48EA4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) libraryManager];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_48F64;
  v6[3] = &unk_D18D8;
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v5 = v3;
  [v4 performNamed:@"updateReadingNowDetails" workerQueueBlock:v6];
}

void sub_48F64(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) libraryManager];
  id v5 = [v4 cloudSyncVersionsForDataType:@"BCReadingNowDetail" inContext:v3];

  uint64_t v6 = [*(id *)(a1 + 40) historyToken];
  if (v6 && [v5 localVersion])
  {
    id v7 = [v5 localVersion];
    id v8 = [v5 syncVersion];

    if (v7 == v8)
    {
      id v9 = +[BULogUtilities shared];
      unsigned int v10 = [v9 verboseLoggingEnabled];

      if (v10)
      {
        long long v11 = BKLibraryAssetDetailsDevelopmentLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long v13 = 0;
          _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "\"\\\"BCReadingNowDetail cloudSyncVersions in sync on enabling cloud merge\\\"\"", v13, 2u);
        }
      }
      goto LABEL_12;
    }
  }
  else
  {
  }
  long long v12 = BKLibraryAssetDetailsLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "BCReadingNowDetail cloudSyncVersions out of date. SKIP AssetPopulation.Setting all records to cloud", buf, 2u);
  }

  [*(id *)(a1 + 32) p_syncAllReadingNowChangesToCloudInMOC:v3];
LABEL_12:
}

id sub_49184(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _checkForChangesFromCloudReadingNowDetailManagerInMOC:a2 reason:@"enableReadingNowSync"];
}

void sub_49654(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v8 = [v5 countByEnumeratingWithState:&v48 objects:v58 count:16];
    if (!v8) {
      goto LABEL_29;
    }
    id v9 = v8;
    uint64_t v10 = *(void *)v49;
    while (1)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v49 != v10) {
          objc_enumerationMutation(v5);
        }
        long long v12 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        if (([v12 avoidSync] & 1) == 0)
        {
          objc_opt_class();
          CFStringRef v17 = *(void **)(a1 + 32);
          id v18 = [v12 annotationAssetID];
          uint64_t v19 = [v17 objectForKeyedSubscript:v18];
          long long v13 = BUDynamicCast();

          long long v20 = BKLibraryAssetDetailsLog();
          long long v21 = v20;
          if (v13)
          {
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              long long v22 = [v12 annotationAssetID];
              long long v23 = [v12 annotationLocation];
              [v12 readingProgress];
              *(_DWORD *)buf = 138412802;
              __int16 v53 = v22;
              __int16 v54 = 2112;
              __int16 v55 = v23;
              __int16 v56 = 2048;
              double v57 = v24;
              _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "BCAssetDetail synchronizing #globalAnnotation for assetID:%@, location:%@, progress:%f", buf, 0x20u);
            }
            long long v25 = [v12 annotationLocation];
            [v13 setReadingPositionCFIString:v25];

            long long v26 = [v12 annotationVersion];
            [v13 setReadingPositionAnnotationVersion:v26];

            long long v27 = [v12 assetVersion];
            [v13 setReadingPositionAssetVersion:v27];

            [v12 readingProgress];
            -[NSObject setReadingProgress:](v13, "setReadingProgress:");
            [v12 readingProgressHighWaterMark];
            -[NSObject setReadingProgressHighWaterMark:](v13, "setReadingProgressHighWaterMark:");
            long long v28 = [v12 plUserData];
            [v13 setReadingPositionUserData:v28];

            double v29 = [v12 plLocationRangeStart];
            -[NSObject setReadingPositionLocationRangeStart:](v13, "setReadingPositionLocationRangeStart:", [v29 intValue]);

            double v30 = [v12 plLocationRangeEnd];
            -[NSObject setReadingPositionLocationRangeEnd:](v13, "setReadingPositionLocationRangeEnd:", [v30 intValue]);

            uint64_t v31 = [v12 plAbsolutePhysicalLocation];
            -[NSObject setReadingPositionAbsolutePhysicalLocation:](v13, "setReadingPositionAbsolutePhysicalLocation:", [v31 intValue]);

            id v32 = [v12 plStorageUUID];
            [v13 setReadingPositionStorageUUID:v32];

            uint64_t v33 = [v12 locationModificationDate];
            if (v33)
            {

              goto LABEL_18;
            }
            id v38 = [v12 annotationLocation];
            if ([v38 length])
            {

              goto LABEL_24;
            }
            long long v39 = [v12 plUserData];
            id v40 = [v39 length];

            if (v40)
            {
LABEL_24:
              uint64_t v34 = [v12 annotationModificationDate];
            }
            else
            {
LABEL_18:
              uint64_t v34 = [v12 locationModificationDate];
            }
            long long v21 = v34;
            [v13 setReadingPositionLocationUpdateDate:v34];
          }
          else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            id v35 = [v12 annotationAssetID];
            uint64_t v36 = [v12 annotationLocation];
            [v12 readingProgress];
            *(_DWORD *)buf = 138412802;
            __int16 v53 = v35;
            __int16 v54 = 2112;
            __int16 v55 = v36;
            __int16 v56 = 2048;
            double v57 = v37;
            _os_log_error_impl(&dword_0, v21, OS_LOG_TYPE_ERROR, "error getting mutable assetDetail for annotationID: %@, location:%@, progress:%f ", buf, 0x20u);
          }
          goto LABEL_27;
        }
        long long v13 = BKLibraryAssetDetailsLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          long long v14 = [v12 annotationAssetID];
          long long v15 = [v12 annotationLocation];
          [v12 readingProgress];
          *(_DWORD *)buf = 138412802;
          __int16 v53 = v14;
          __int16 v54 = 2112;
          __int16 v55 = v15;
          __int16 v56 = 2048;
          double v57 = v16;
          _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Skipping synchronization of #globalAnnotation for assetID:%@, location:%@, progress:%f", buf, 0x20u);
        }
LABEL_27:
      }
      id v9 = [v5 countByEnumeratingWithState:&v48 objects:v58 count:16];
      if (!v9)
      {
LABEL_29:
        id v41 = [*(id *)(a1 + 40) cloudAssetDetailManager];
        v45[0] = _NSConcreteStackBlock;
        v45[1] = 3221225472;
        void v45[2] = sub_49C18;
        v45[3] = &unk_D2B88;
        id v43 = *(void **)(a1 + 48);
        uint64_t v42 = *(void *)(a1 + 56);
        uint64_t v44 = *(void *)(a1 + 32);
        v45[4] = *(void *)(a1 + 40);
        uint64_t v47 = v42;
        id v46 = v43;
        [v41 setAssetDetails:v44 completion:v45];

        id v6 = 0;
        goto LABEL_30;
      }
    }
  }
  id v7 = BKLibraryAssetDetailsLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_91E08();
  }

LABEL_30:
}

void sub_49C18(uint64_t a1, int a2, int a3, void *a4)
{
  id v7 = a4;
  if (!a2)
  {
    long long v12 = BKLibraryAssetDetailsLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_91EA0();
    }
    goto LABEL_12;
  }
  id v8 = [*(id *)(a1 + 32) libraryManager];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  void v15[2] = sub_49E20;
  v15[3] = &unk_D2B60;
  uint64_t v9 = *(void *)(a1 + 48);
  void v15[4] = *(void *)(a1 + 32);
  void v15[5] = v9;
  [v8 performNamed:@"setSyncVersion" workerQueueBlock:v15];

  uint64_t v10 = +[BULogUtilities shared];
  unsigned int v11 = [v10 verboseLoggingEnabled];

  if (a3)
  {
    if (v11)
    {
      long long v12 = BKLibraryAssetDetailsDevelopmentLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        long long v13 = [*(id *)(a1 + 40) componentsJoinedByString:@", "];
        *(_DWORD *)buf = 138412290;
        CFStringRef v17 = v13;
        long long v14 = "\"\\\"succesfully set assetDetails for assetIDs: [%@]\\\"\"";
LABEL_11:
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, v14, buf, 0xCu);

        goto LABEL_12;
      }
      goto LABEL_12;
    }
  }
  else if (v11)
  {
    long long v12 = BKLibraryAssetDetailsDevelopmentLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      long long v13 = [*(id *)(a1 + 40) componentsJoinedByString:@", "];
      *(_DWORD *)buf = 138412290;
      CFStringRef v17 = v13;
      long long v14 = "\"\\\"succesfully set assetDetails, but no changes for assetIDs: [%@]\\\"\"";
      goto LABEL_11;
    }
LABEL_12:
  }
}

void sub_49E20(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setSessionContextType:2];
  id v4 = [*(id *)(a1 + 32) libraryManager];
  id v5 = [v4 cloudSyncVersionsForDataType:@"BCAssetDetail" inContext:v3];

  [v5 setSyncVersion:*(void *)(a1 + 40)];
}

void sub_49EB0(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setSessionContextType:2];
  id v4 = [*(id *)(a1 + 32) libraryManager];
  id v5 = [v4 cloudSyncVersionsForDataType:@"BCAssetDetail" inContext:v3];

  [v5 setSyncVersion:*(void *)(a1 + 40)];
}

void sub_4A14C(uint64_t a1)
{
  uint64_t v2 = BKLibraryAssetDetailsLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) valueForKey:@"assetID"];
    id v4 = [v3 bu_prettyDescription];
    *(_DWORD *)buf = 138412290;
    id v38 = v4;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "p_syncReadingNowDetailsForAssets assets%@", buf, 0xCu);
  }
  if ([*(id *)(a1 + 32) count])
  {
    id v5 = [*(id *)(a1 + 40) libraryManager];
    id v6 = [v5 cloudSyncVersionsForDataType:@"BCReadingNowDetail" inContext:*(void *)(a1 + 48)];

    [v6 setLocalVersion:[v6 localVersion] + 1];
    long long v26 = v6;
    id v25 = [v6 localVersion];
    id v7 = +[NSMutableDictionary dictionary];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v27 = a1;
    id v8 = *(id *)(a1 + 32);
    id v9 = [v8 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v33;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v33 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          unsigned int v14 = [v13 hasImportantReadingNowDetails];
          long long v15 = BKLibraryAssetDetailsLog();
          BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
          if (v14)
          {
            if (v16)
            {
              *(_DWORD *)buf = 138412290;
              id v38 = v13;
              _os_log_debug_impl(&dword_0, v15, OS_LOG_TYPE_DEBUG, "*********** hasImportantReadingNowDetails for asset %@", buf, 0xCu);
            }

            long long v15 = [v13 readingNowDetailRepresentation];
            CFStringRef v17 = [v13 assetID];

            if (v17)
            {
              id v18 = [v13 assetID];
              [v7 setObject:v15 forKey:v18];
            }
          }
          else if (v16)
          {
            *(_DWORD *)buf = 138412290;
            id v38 = v13;
            _os_log_debug_impl(&dword_0, v15, OS_LOG_TYPE_DEBUG, "*********** does not hasImportantReadingNowDetails for asset %@", buf, 0xCu);
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v10);
    }

    if ([v7 count])
    {
      uint64_t v19 = BKLibraryAssetDetailsLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        sub_91F68(v7);
      }
    }
    if ([v7 count])
    {
      long long v20 = [v7 allKeys];
      long long v21 = [*(id *)(v27 + 40) cloudReadingNowDetailManager];
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      void v29[2] = sub_4A598;
      v29[3] = &unk_D2B88;
      uint64_t v22 = *(void *)(v27 + 40);
      id v30 = v20;
      id v31 = v25;
      v29[4] = v22;
      id v23 = v20;
      [v21 setReadingNowDetails:v7 completion:v29];
    }
    else
    {
      float v24 = [*(id *)(v27 + 40) libraryManager];
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_4A75C;
      v28[3] = &unk_D2B60;
      void v28[4] = *(void *)(v27 + 40);
      v28[5] = v25;
      [v24 performBlockOnWorkerQueue:v28];
    }
  }
}

void sub_4A598(uint64_t a1, int a2, int a3, void *a4)
{
  id v7 = a4;
  if (a2)
  {
    id v8 = [*(id *)(a1 + 32) libraryManager];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_4A6CC;
    v13[3] = &unk_D2B60;
    uint64_t v9 = *(void *)(a1 + 48);
    void v13[4] = *(void *)(a1 + 32);
    void v13[5] = v9;
    [v8 performNamed:@"syncReadingNowDetailsForAssets" workerQueueBlock:v13];

    id v10 = BKLibraryAssetDetailsLog();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
    if (a3)
    {
      if (v11) {
        sub_91FE0(a1);
      }
    }
    else if (v11)
    {
      sub_92064(a1);
    }
  }
  else
  {
    long long v12 = BKLibraryAssetDetailsLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_920E8();
    }
  }
}

void sub_4A6CC(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setSessionContextType:3];
  id v4 = [*(id *)(a1 + 32) libraryManager];
  id v5 = [v4 cloudSyncVersionsForDataType:@"BCReadingNowDetail" inContext:v3];

  [v5 setSyncVersion:*(void *)(a1 + 40)];
}

void sub_4A75C(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setSessionContextType:3];
  id v4 = [*(id *)(a1 + 32) libraryManager];
  id v5 = [v4 cloudSyncVersionsForDataType:@"BCReadingNowDetail" inContext:v3];

  [v5 setSyncVersion:*(void *)(a1 + 40)];
}

void sub_4A9C8(uint64_t a1)
{
  uint64_t v2 = BKLibraryAssetDetailsLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_922FC(a1);
  }

  if ([*(id *)(a1 + 32) enableCloudMerge])
  {
    id v3 = [*(id *)(a1 + 40) addedObjects];
    id v4 = [v3 mutableCopy];

    if ([v4 count])
    {
      id v5 = +[BULogUtilities shared];
      unsigned int v6 = [v5 verboseLoggingEnabled];

      if (v6)
      {
        id v7 = BKLibraryAssetDetailsDevelopmentLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          id v27 = [v4 count];
          _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "\"\\\"ManagedObjectBackgroundMonitor found %lu assets added\\\"\"", buf, 0xCu);
        }
      }
      id v8 = [*(id *)(a1 + 32) cloudAssetDetailManager];
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_4ACFC;
      v24[3] = &unk_D2C00;
      v24[4] = *(void *)(a1 + 32);
      id v9 = v4;
      id v25 = v9;
      [v8 assetDetailsForAssetIDs:v9 completion:v24];

      id v10 = _os_activity_create(&dword_0, "Books/added-ReadingNow", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_4B180;
      block[3] = &unk_D1A38;
      id v11 = *(id *)(a1 + 40);
      uint64_t v12 = *(void *)(a1 + 32);
      id v21 = v11;
      uint64_t v22 = v12;
      id v23 = v9;
      os_activity_apply(v10, block);
    }
    long long v13 = [*(id *)(a1 + 40) updatedObjects];
    if ([v13 count])
    {
      unsigned int v14 = _os_activity_create(&dword_0, "Books/updated-ReadingNow", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_4B6B0;
      v17[3] = &unk_D1418;
      id v15 = v13;
      uint64_t v16 = *(void *)(a1 + 32);
      id v18 = v15;
      uint64_t v19 = v16;
      os_activity_apply(v14, v17);
    }
    else
    {
      unsigned int v14 = BKLibraryAssetDetailsLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        sub_922C8();
      }
    }
  }
}

void sub_4ACFC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = BKLibraryAssetDetailsLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_92384();
    }
  }
  else
  {
    id v11 = [*(id *)(a1 + 32) libraryManager];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    void v15[2] = sub_4AE28;
    v15[3] = &unk_D2BD8;
    uint64_t v12 = v7;
    uint64_t v13 = *(void *)(a1 + 32);
    unsigned int v14 = *(void **)(a1 + 40);
    uint64_t v16 = v12;
    uint64_t v17 = v13;
    id v18 = v14;
    id v19 = v8;
    [v11 performBlockOnWorkerQueue:v15];

    id v10 = v16;
  }
}

void sub_4AE28(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setSessionContextType:2];
  id v30 = +[NSMutableArray array];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = *(id *)(a1 + 32);
  id v4 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v37;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v37 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v9 = [*(id *)(a1 + 40) libraryManager];
        id v10 = [v8 assetID];
        id v11 = v3;
        uint64_t v12 = [v9 libraryMutableAssetWithAssetID:v10 inManagedObjectContext:v3];

        [v12 configureFromAssetDetail:v8];
        if ([v12 needsGlobalAnnotation])
        {
          uint64_t v13 = [v8 readingPositionCFIString];
          if ([v13 length])
          {
          }
          else
          {
            unsigned int v14 = [v8 readingPositionUserData];
            id v15 = [v14 length];

            if (!v15) {
              goto LABEL_11;
            }
          }
          [v30 addObject:v8];
        }
LABEL_11:
        uint64_t v16 = *(void **)(a1 + 48);
        uint64_t v17 = [v8 assetID];
        [v16 removeObjectIdenticalTo:v17];

        id v3 = v11;
      }
      id v5 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v5);
  }

  id v18 = *(void **)(a1 + 40);
  id v19 = [v18 annotationProvider];
  [v18 _updateGlobalAnnotationsFromDetails:v30 annotationProvider:v19];

  long long v20 = [*(id *)(a1 + 40) libraryManager];
  [v20 updateCloudVersionFromCloudSyncVersions:*(void *)(a1 + 56) inContext:v3];

  if ([*(id *)(a1 + 48) count])
  {
    id v21 = +[NSMutableArray array];
    uint64_t v22 = [*(id *)(a1 + 40) libraryManager];
    id v23 = [v22 libraryAssetsWithAssetIDs:*(void *)(a1 + 48) inManagedObjectContext:v3];

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v24 = v23;
    id v25 = [v24 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v33;
      do
      {
        for (j = 0; j != v26; j = (char *)j + 1)
        {
          if (*(void *)v33 != v27) {
            objc_enumerationMutation(v24);
          }
          double v29 = *(void **)(*((void *)&v32 + 1) + 8 * (void)j);
          if (objc_msgSend(v29, "hasImportantAssetDetails", v30)) {
            [v21 addObject:v29];
          }
        }
        id v26 = [v24 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v26);
    }

    if ([v21 count]) {
      [*(id *)(a1 + 40) p_syncAssetDetailsForAssets:v21 inMOC:v3];
    }
  }
}

void sub_4B180(id *a1)
{
  uint64_t v2 = [a1[4] addedObjects];
  id v3 = [v2 mutableCopy];

  id v4 = [a1[5] cloudReadingNowDetailManager];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_4B264;
  v8[3] = &unk_D2C28;
  id v5 = a1[6];
  id v6 = a1[5];
  id v9 = v5;
  id v10 = v6;
  id v11 = v3;
  id v7 = v3;
  [v4 readingNowDetailsForAssetIDs:v7 completion:v8];
}

void sub_4B264(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = BKLibraryAssetDetailsLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_924B0();
  }

  if (v9)
  {
    id v11 = BKLibraryAssetDetailsLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_92418();
    }
  }
  else
  {
    uint64_t v12 = [*(id *)(a1 + 40) libraryManager];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_4B3C0;
    v16[3] = &unk_D2BD8;
    uint64_t v13 = v7;
    uint64_t v14 = *(void *)(a1 + 40);
    id v15 = *(void **)(a1 + 48);
    uint64_t v17 = v13;
    uint64_t v18 = v14;
    id v19 = v15;
    id v20 = v8;
    [v12 performBlockOnWorkerQueue:v16];

    id v11 = v17;
  }
}

void sub_4B3C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setSessionContextType:2];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v4 = *(id *)(a1 + 32);
  id v5 = [v4 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v33;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v33 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v10 = [*(id *)(a1 + 40) libraryManager];
        id v11 = [v9 assetID];
        uint64_t v12 = [v10 libraryMutableAssetWithAssetID:v11 inManagedObjectContext:v3];

        [v12 configureFromReadingNowDetail:v9];
        uint64_t v13 = *(void **)(a1 + 48);
        uint64_t v14 = [v9 assetID];
        [v13 removeObjectIdenticalTo:v14];
      }
      id v6 = [v4 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v6);
  }

  id v15 = [*(id *)(a1 + 40) libraryManager];
  [v15 updateCloudVersionFromCloudSyncVersions:*(void *)(a1 + 56) inContext:v3];

  if ([*(id *)(a1 + 48) count])
  {
    uint64_t v16 = +[NSMutableArray array];
    uint64_t v17 = [*(id *)(a1 + 40) libraryManager];
    uint64_t v18 = [v17 libraryAssetsWithAssetIDs:*(void *)(a1 + 48) inManagedObjectContext:v3];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v19 = v18;
    id v20 = [v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v29;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(void *)v29 != v22) {
            objc_enumerationMutation(v19);
          }
          id v24 = *(void **)(*((void *)&v28 + 1) + 8 * (void)j);
          if (objc_msgSend(v24, "hasImportantReadingNowDetails", (void)v28)) {
            [v16 addObject:v24];
          }
        }
        id v21 = [v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v21);
    }

    id v25 = [v16 count];
    id v26 = BKLibraryAssetDetailsLog();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG);
    if (v25)
    {
      if (v27) {
        sub_92568();
      }

      [*(id *)(a1 + 40) p_syncReadingNowDetailsForAssets:v16 inMOC:v3];
    }
    else
    {
      if (v27) {
        sub_92534();
      }
    }
  }
}

void sub_4B6B0(uint64_t a1)
{
  uint64_t v2 = BKLibraryAssetDetailsLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_9259C(a1);
  }

  id v3 = [*(id *)(a1 + 40) libraryManager];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_4B78C;
  v6[3] = &unk_D18D8;
  int8x16_t v5 = *(int8x16_t *)(a1 + 32);
  id v4 = (id)v5.i64[0];
  int8x16_t v7 = vextq_s8(v5, v5, 8uLL);
  [v3 performBlockOnWorkerQueue:v6];
}

void sub_4B78C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) libraryManager];
  int8x16_t v5 = [v4 libraryAssetsWithAssetIDs:*(void *)(a1 + 40) inManagedObjectContext:v3];

  [*(id *)(a1 + 32) p_syncAssetDetailsForAssets:v5 inMOC:v3];
  id v6 = BKLibraryAssetDetailsLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_92618();
  }

  [*(id *)(a1 + 32) p_syncReadingNowDetailsForAssets:v5 inMOC:v3];
}

void sub_4B8BC(uint64_t a1)
{
  if ([*(id *)(a1 + 32) processingAssetDetailChanges])
  {
    uint64_t v2 = +[BULogUtilities shared];
    unsigned int v3 = [v2 verboseLoggingEnabled];

    if (v3)
    {
      id v4 = BKLibraryAssetDetailsDevelopmentLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "\"\\\"#assetDetailChanged BCCloudAssetDetailManagerChanged notification received, deferring processing\\\"\"", buf, 2u);
      }
    }
    [*(id *)(a1 + 32) setReceivedAssetDetailChangesNotification:1];
  }
  else
  {
    [*(id *)(a1 + 32) setProcessingAssetDetailChanges:1];
    int8x16_t v5 = +[BULogUtilities shared];
    unsigned int v6 = [v5 verboseLoggingEnabled];

    if (v6)
    {
      int8x16_t v7 = BKLibraryAssetDetailsDevelopmentLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "\"\\\"#assetDetailChanged BCCloudAssetDetailManagerChanged notification received, starting processing\\\"\"", buf, 2u);
      }
    }
    id v8 = [*(id *)(a1 + 32) libraryManager];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_4BA4C;
    v9[3] = &unk_D16B0;
    void v9[4] = *(void *)(a1 + 32);
    [v8 performBackgroundReadOnlyBlock:v9];
  }
}

id sub_4BA4C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _checkForChangesFromCloudAssetDetailManagerInMOC:a2 reason:@"BCCloudAssetDetailManagerChanged"];
}

void sub_4BB58(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) receivedAssetDetailChangesNotification];
  unsigned int v3 = +[BULogUtilities shared];
  unsigned int v4 = [v3 verboseLoggingEnabled];

  if (v2)
  {
    if (v4)
    {
      int8x16_t v5 = BKLibraryAssetDetailsDevelopmentLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "\"\\\"#assetDetailChanged completed fetchAgain, processing deferred notification.\\\"\"", buf, 2u);
      }
    }
    [*(id *)(a1 + 32) setReceivedAssetDetailChangesNotification:0];
    unsigned int v6 = [*(id *)(a1 + 32) libraryManager];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_4BCCC;
    v8[3] = &unk_D16B0;
    void v8[4] = *(void *)(a1 + 32);
    [v6 performBackgroundReadOnlyBlock:v8];
  }
  else
  {
    if (v4)
    {
      int8x16_t v7 = BKLibraryAssetDetailsDevelopmentLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "\"\\\"#assetDetailChanged completed fetchAgain, NO deferred notification.\\\"\"", buf, 2u);
      }
    }
    [*(id *)(a1 + 32) setProcessingAssetDetailChanges:0];
  }
}

id sub_4BCCC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _checkForChangesFromCloudAssetDetailManagerInMOC:a2 reason:@"deferred"];
}

void sub_4BE70(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  id v7 = a3;
  id v93 = a4;
  CFStringRef v94 = v7;
  if (!v7)
  {
    long long v99 = 0u;
    long long v100 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    id v9 = [v6 countByEnumeratingWithState:&v97 objects:v113 count:16];
    if (!v9) {
      goto LABEL_56;
    }
    id v10 = v9;
    uint64_t v11 = *(void *)v98;
    id obj = v6;
    while (1)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v98 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v97 + 1) + 8 * i);
        uint64_t v14 = [v13 annotationAssetID];
        id v15 = [*(id *)(a1 + 32) objectForKeyedSubscript:v14];
        uint64_t v16 = v15;
        if (v15)
        {
          uint64_t v17 = [(__CFString *)v15 readingPositionLocationUpdateDate];
          [v17 timeIntervalSinceReferenceDate];
          double v19 = v18;
          id v20 = [v13 locationModificationDate];
          [v20 timeIntervalSinceReferenceDate];
          double v22 = v21;

          if (v19 > v22)
          {
            id v23 = BKMobileCloudSyncAnnotationsLog();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              id v24 = [v13 annotationLocation];
              double v25 = COERCE_DOUBLE([v24 length]);
              id v26 = [v13 plUserData];
              double v27 = COERCE_DOUBLE([v26 length]);
              *(_DWORD *)buf = 138413058;
              v104 = v14;
              __int16 v105 = 2048;
              CFStringRef v106 = v16;
              __int16 v107 = 2048;
              double v108 = v25;
              __int16 v109 = 2048;
              double v110 = v27;
              _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "About to CloudKit merge into annotation with assetID:%@ from assetDetail:%p annotation.annotationLocation.length=%lu annotation.plUserData.length=%lu", buf, 0x2Au);
            }
            [v13 readingProgress];
            float v29 = v28;
            [(__CFString *)v16 readingProgress];
            float v31 = v30;
            [v13 readingProgress];
            float v33 = v32;
            if (v31 != v32)
            {
              [(__CFString *)v16 readingProgress];
              [v13 setReadingProgress:];
            }
            [(__CFString *)v16 readingProgressHighWaterMark];
            float v35 = v34;
            [v13 readingProgressHighWaterMark];
            float v37 = v36;
            [(__CFString *)v16 readingProgressHighWaterMark];
            float v39 = *(float *)&v38;
            if (v35 > v37)
            {
              [v13 setReadingProgressHighWaterMark:v38];
              goto LABEL_27;
            }
            [v13 readingProgressHighWaterMark];
            if (v39 < v42)
            {
              id v43 = BKLibraryAssetDetailsLog();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
              {
                uint64_t v44 = [(__CFString *)v16 assetID];
                [v13 readingProgressHighWaterMark];
                double v46 = v45;
                [(__CFString *)v16 readingProgressHighWaterMark];
                *(_DWORD *)buf = 138413058;
                v104 = v44;
                __int16 v105 = 2048;
                CFStringRef v106 = v16;
                __int16 v107 = 2048;
                double v108 = v46;
                __int16 v109 = 2048;
                double v110 = v47;
                _os_log_impl(&dword_0, v43, OS_LOG_TYPE_INFO, "BCMutableAssetDetail assetID:%@ assetDetail:%p attempt to move annotations readingProgressHighWaterMark backwards from %f to %f", buf, 0x2Au);
              }
            }
            if (v31 != v33)
            {
LABEL_27:
              long long v48 = BKMobileCloudSyncAnnotationsLog();
              if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
              {
                long long v49 = [(__CFString *)v16 assetID];
                [v13 readingProgress];
                double v51 = v50;
                [v13 readingProgressHighWaterMark];
                *(_DWORD *)buf = 138413314;
                v104 = v49;
                __int16 v105 = 2048;
                CFStringRef v106 = v16;
                __int16 v107 = 2048;
                double v108 = v29;
                __int16 v109 = 2048;
                double v110 = v51;
                __int16 v111 = 2048;
                double v112 = v52;
                _os_log_impl(&dword_0, v48, OS_LOG_TYPE_DEFAULT, "Adopting reading progress for assetID:%@ assetDetail:%p synced from cloud. annotation.readingProgress:%f readingProgress: %f highWaterMark: %f", buf, 0x34u);
              }
            }
            __int16 v53 = [(__CFString *)v16 readingPositionCFIString];
            [v13 setDifferentString:v53 forKey:@"annotationLocation"];

            __int16 v54 = [(__CFString *)v16 readingPositionAnnotationVersion];
            [v13 setDifferentString:v54 forKey:@"annotationVersion"];

            __int16 v55 = [(__CFString *)v16 readingPositionAssetVersion];
            [v13 setDifferentString:v55 forKey:@"assetVersion"];

            __int16 v56 = [(__CFString *)v16 readingPositionUserData];
            [v13 setDifferentValue:v56 forKey:@"plUserData" klass:objc_opt_class()];

            if ([(__CFString *)v16 readingPositionLocationRangeStart])
            {
              double v57 = +[NSNumber numberWithInt:[(__CFString *)v16 readingPositionLocationRangeStart]];
              id v58 = [v13 plLocationRangeStart];
              unsigned __int8 v59 = [v57 isEqual:v58];

              if ((v59 & 1) == 0)
              {
                id v60 = +[NSNumber numberWithInt:[(__CFString *)v16 readingPositionLocationRangeStart]];
                [v13 setPlLocationRangeStart:v60];
              }
            }
            if ([(__CFString *)v16 readingPositionLocationRangeEnd])
            {
              id v61 = +[NSNumber numberWithInt:[(__CFString *)v16 readingPositionLocationRangeEnd]];
              unsigned __int8 v62 = [v13 plAbsolutePhysicalLocation];
              unsigned __int8 v63 = [v61 isEqual:v62];

              if ((v63 & 1) == 0)
              {
                id v64 = +[NSNumber numberWithInt:[(__CFString *)v16 readingPositionLocationRangeEnd]];
                [v13 setPlLocationRangeEnd:v64];
              }
            }
            if ([(__CFString *)v16 readingPositionAbsolutePhysicalLocation])
            {
              id v65 = +[NSNumber numberWithInt:[(__CFString *)v16 readingPositionAbsolutePhysicalLocation]];
              id v66 = [v13 plAbsolutePhysicalLocation];
              unsigned __int8 v67 = [v65 isEqual:v66];

              if ((v67 & 1) == 0)
              {
                long long v68 = +[NSNumber numberWithInt:[(__CFString *)v16 readingPositionAbsolutePhysicalLocation]];
                [v13 setPlAbsolutePhysicalLocation:v68];
              }
            }
            long long v69 = [(__CFString *)v16 readingPositionStorageUUID];
            [v13 setDifferentString:v69 forKey:@"plStorageUUID"];

            long long v70 = [(__CFString *)v16 readingPositionLocationUpdateDate];
            [v13 setDifferentDate:v70 forKey:@"locationModificationDate"];

            id v71 = BKLibraryAssetDetailsLog();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
            {
              long long v72 = [v13 annotationLocation];
              double v73 = COERCE_DOUBLE([v72 length]);
              long long v74 = [v13 plUserData];
              double v75 = COERCE_DOUBLE([v74 length]);
              *(_DWORD *)buf = 138413058;
              v104 = v14;
              __int16 v105 = 2048;
              CFStringRef v106 = v16;
              __int16 v107 = 2048;
              double v108 = v73;
              __int16 v109 = 2048;
              double v110 = v75;
              _os_log_impl(&dword_0, v71, OS_LOG_TYPE_INFO, "After CloudKit merge into annotation with assetID:%@ assetDetail:%p annotation.annotationLocation.length=%lu annotation.plUserData.length=%lu", buf, 0x2Au);

              goto LABEL_47;
            }
            goto LABEL_48;
          }
          id v41 = [v13 locationModificationDate];
          if (v41)
          {

            goto LABEL_42;
          }
          uint64_t v76 = [(__CFString *)v16 readingPositionLocationUpdateDate];

          if (v76)
          {
LABEL_42:
            long long v77 = [(__CFString *)v16 readingPositionLocationUpdateDate];
            [v77 timeIntervalSinceReferenceDate];
            double v79 = v78;
            long long v80 = [v13 locationModificationDate];
            [v80 timeIntervalSinceReferenceDate];
            double v82 = v81;

            id v71 = BKMobileCloudSyncAnnotationsLog();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
            {
              long long v72 = [v13 locationModificationDate];
              if (v79 == v82) {
                CFStringRef v83 = @"same-dated";
              }
              else {
                CFStringRef v83 = @"older";
              }
              double v84 = [(__CFString *)v16 readingPositionLocationUpdateDate];
              *(_DWORD *)buf = 138543874;
              v104 = v72;
              __int16 v105 = 2114;
              CFStringRef v106 = v83;
              __int16 v107 = 2114;
              double v108 = v84;
              _os_log_impl(&dword_0, v71, OS_LOG_TYPE_DEFAULT, "Ignoring request to update global annotation dated %{public}@ to %{public}@ asset detail reading location from %{public}@", buf, 0x20u);

LABEL_47:
            }
LABEL_48:
          }
          unsigned int v85 = [v13 hasChanges];
          id v40 = BKMobileCloudSyncAnnotationsLog();
          BOOL v86 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
          if (v85)
          {
            if (v86)
            {
              long long v87 = [(__CFString *)v16 assetID];
              double v88 = [(__CFString *)v16 readingPositionCFIString];
              double v89 = [v13 location];
              *(_DWORD *)buf = 138413058;
              v104 = v87;
              __int16 v105 = 2048;
              CFStringRef v106 = v16;
              __int16 v107 = 2112;
              double v108 = v88;
              __int16 v109 = 2112;
              double v110 = v89;
              _os_log_impl(&dword_0, v40, OS_LOG_TYPE_DEFAULT, "Adopting reading position for assetID:%@ assetDetail:%p synced from cloud: cfi: %@,  annotationLocation: %@", buf, 0x2Au);
            }
          }
          else if (v86)
          {
            id v90 = [(__CFString *)v16 assetID];
            *(_DWORD *)buf = 138412546;
            v104 = v90;
            __int16 v105 = 2048;
            CFStringRef v106 = v16;
            _os_log_impl(&dword_0, v40, OS_LOG_TYPE_DEFAULT, "No changes for reading position for assetID:%@ assetDetail:%p  synced from cloud", buf, 0x16u);
          }
          goto LABEL_54;
        }
        id v40 = BKMobileCloudSyncAnnotationsLog();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
          sub_9264C(v101, v13, &v102, v40);
        }
LABEL_54:
      }
      id v6 = obj;
      id v10 = [obj countByEnumeratingWithState:&v97 objects:v113 count:16];
      if (!v10) {
        goto LABEL_56;
      }
    }
  }
  id v8 = BKLibraryAssetDetailsLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_926C4();
  }

LABEL_56:
  id v91 = objc_retainBlock(v93);
  v92 = v91;
  if (v91) {
    (*((void (**)(id))v91 + 2))(v91);
  }
}

void sub_4CA70(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5, char a6)
{
  id v10 = a2;
  id v11 = a4;
  id v12 = a5;
  if (v12)
  {
    uint64_t v13 = BKLibraryAssetDetailsLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_92754();
    }
  }
  else
  {
    uint64_t v14 = [*(id *)(a1 + 32) enableCloudMergeQueue];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_4CBC0;
    v16[3] = &unk_D2CA0;
    id v15 = *(void **)(a1 + 40);
    void v16[4] = *(void *)(a1 + 32);
    id v17 = v15;
    id v18 = v10;
    id v19 = v11;
    id v20 = *(id *)(a1 + 48);
    char v21 = a6;
    dispatch_async(v14, v16);
  }
}

void sub_4CBC0(uint64_t a1)
{
  if ([*(id *)(a1 + 32) enableCloudMerge])
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_4CD14;
    v7[3] = &unk_D2C78;
    unsigned int v2 = *(void **)(a1 + 40);
    id v8 = *(id *)(a1 + 48);
    id v9 = *(id *)(a1 + 56);
    id v3 = *(id *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 32);
    id v10 = v3;
    uint64_t v11 = v4;
    id v12 = *(id *)(a1 + 64);
    char v13 = *(unsigned char *)(a1 + 72);
    [v2 performNamed:@"checkForChangesFromCloudAssetDetailManager" workerQueueBlockAndWait:v7];
  }
  else
  {
    int8x16_t v5 = [*(id *)(a1 + 32) getChangesQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_4CF7C;
    block[3] = &unk_D1520;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(v5, block);
  }
}

void sub_4CD14(uint64_t a1, void *a2)
{
  id v20 = a2;
  [v20 setSessionContextType:2];
  id v3 = BKLibraryAssetDetailsLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [*(id *)(a1 + 32) count];
    uint64_t v5 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    id v27 = v4;
    __int16 v28 = 2112;
    uint64_t v29 = v5;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "getAssetDetailChangesSince #assetDetailChanged updated %lu records currentSyncVersions:%@", buf, 0x16u);
  }

  id v19 = +[NSMutableArray array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = *(id *)(a1 + 32);
  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    id v18 = v6;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v12 = [v11 assetID];
        char v13 = [*(id *)(a1 + 48) libraryMutableAssetWithAssetID:v12 inManagedObjectContext:v20];
        [v13 configureFromAssetDetail:v11];
        if ([v13 needsGlobalAnnotation])
        {
          uint64_t v14 = v9;
          id v15 = [v11 readingPositionCFIString];
          if ([v15 length])
          {

            uint64_t v9 = v14;
          }
          else
          {
            uint64_t v16 = [v11 readingPositionUserData];
            id v17 = [v16 length];

            id v6 = v18;
            uint64_t v9 = v14;
            if (!v17) {
              goto LABEL_13;
            }
          }
          [v19 addObject:v11];
        }
LABEL_13:
      }
      id v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  [*(id *)(a1 + 56) _updateGlobalAnnotationsFromDetails:v19 annotationProvider:*(void *)(a1 + 64)];
  [*(id *)(a1 + 56) _updateAssetDetailCloudVersionFromCloudSyncVersions:*(void *)(a1 + 40) inMOC:v20 fetchAgain:*(unsigned __int8 *)(a1 + 72)];
}

id sub_4CF7C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setProcessingAssetDetailChanges:0];
}

void sub_4D028(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) getChangesQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4D0B8;
  block[3] = &unk_D1520;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

void sub_4D0B8(uint64_t a1)
{
  if ([*(id *)(a1 + 32) processingReadingNowChanges])
  {
    unsigned int v2 = BKLibraryAssetDetailsLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      sub_927BC();
    }

    [*(id *)(a1 + 32) setReceivedReadingNowChangesNotification:1];
  }
  else
  {
    [*(id *)(a1 + 32) setProcessingReadingNowChanges:1];
    id v3 = BKLibraryAssetDetailsLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_927F0();
    }

    id v4 = [*(id *)(a1 + 32) libraryManager];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_4D1C0;
    v5[3] = &unk_D16B0;
    void v5[4] = *(void *)(a1 + 32);
    [v4 performBackgroundReadOnlyBlock:v5];
  }
}

id sub_4D1C0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _checkForChangesFromCloudReadingNowDetailManagerInMOC:a2 reason:@"BCCloudReadingNowManagerChanged"];
}

void sub_4D2C0(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) libraryManager];
  id v3 = [v2 cloudSyncVersionsForDataType:@"BCReadingNowDetail" inContext:*(void *)(a1 + 40)];
  id v4 = [v3 mutableCopy];

  uint64_t v5 = BKLibraryAssetDetailsLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138543618;
    id v12 = v4;
    __int16 v13 = 2114;
    uint64_t v14 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Books/BKLibrary-checkForReadingNowChange _checkForChangesFromCloudReadingNowDetailManagerInMOC cloudSyncVersions:%{public}@, reason:%{public}@", buf, 0x16u);
  }

  id v7 = [*(id *)(a1 + 32) cloudReadingNowDetailManager];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_4D438;
  v9[3] = &unk_D2D18;
  void v9[4] = *(void *)(a1 + 32);
  id v10 = v2;
  id v8 = v2;
  [v7 getReadingNowDetailChangesSince:v4 completion:v9];
}

void sub_4D438(uint64_t a1, void *a2, void *a3, void *a4, void *a5, char a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (v14)
  {
    id v15 = BKLibraryAssetDetailsLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_92824();
    }
  }
  else
  {
    uint64_t v16 = [*(id *)(a1 + 32) enableCloudMergeQueue];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_4D590;
    v20[3] = &unk_D2CA0;
    long long v21 = v11;
    id v17 = v12;
    uint64_t v18 = *(void *)(a1 + 32);
    id v19 = *(void **)(a1 + 40);
    id v22 = v17;
    uint64_t v23 = v18;
    id v24 = v19;
    id v25 = v13;
    char v26 = a6;
    dispatch_async(v16, v20);

    id v15 = v21;
  }
}

void sub_4D590(uint64_t a1)
{
  unsigned int v2 = BKLibraryAssetDetailsLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_9288C(a1);
  }

  if ([*(id *)(a1 + 48) enableCloudMerge])
  {
    id v3 = *(void **)(a1 + 56);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_4D700;
    v8[3] = &unk_D2CF0;
    id v9 = *(id *)(a1 + 32);
    id v10 = *(id *)(a1 + 56);
    id v4 = *(id *)(a1 + 64);
    char v13 = *(unsigned char *)(a1 + 72);
    uint64_t v5 = *(void *)(a1 + 48);
    id v11 = v4;
    uint64_t v12 = v5;
    [v3 performNamed:@"checkForChangesFromCloudReadingNowDetailManager" workerQueueBlockAndWait:v8];
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 48) getChangesQueue];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_4DA44;
    v7[3] = &unk_D1520;
    void v7[4] = *(void *)(a1 + 48);
    dispatch_async(v6, v7);
  }
}

void sub_4D700(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setSessionContextType:3];
  id v4 = [*(id *)(a1 + 32) allObjects];
  uint64_t v5 = [v4 valueForKey:@"assetID"];

  uint64_t v6 = BKLibraryAssetDetailsLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_92938(v5);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = *(id *)(a1 + 32);
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        char v13 = [v12 assetID];
        id v14 = [*(id *)(a1 + 40) libraryMutableAssetWithAssetID:v13 inManagedObjectContext:v3];
        [v14 configureFromReadingNowDetail:v12];
      }
      id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  [*(id *)(a1 + 40) updateCloudVersionFromCloudSyncVersions:*(void *)(a1 + 48) inContext:v3];
  id v15 = *(void **)(a1 + 56);
  if (*(unsigned char *)(a1 + 64))
  {
    [v15 _checkForChangesFromCloudReadingNowDetailManagerInMOC:v3 reason:@"fetchAgain"];
  }
  else
  {
    uint64_t v16 = [v15 getChangesQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_4D930;
    block[3] = &unk_D1520;
    void block[4] = *(void *)(a1 + 56);
    dispatch_async(v16, block);
  }
}

void sub_4D930(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) receivedReadingNowChangesNotification];
  id v3 = BKLibraryAssetDetailsLog();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4) {
      sub_929BC();
    }

    [*(id *)(a1 + 32) setReceivedReadingNowChangesNotification:0];
    uint64_t v5 = [*(id *)(a1 + 32) libraryManager];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_4DA30;
    v6[3] = &unk_D16B0;
    void v6[4] = *(void *)(a1 + 32);
    [v5 performBackgroundReadOnlyBlock:v6];
  }
  else
  {
    if (v4) {
      sub_929F0();
    }

    [*(id *)(a1 + 32) setProcessingReadingNowChanges:0];
  }
}

id sub_4DA30(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _checkForChangesFromCloudReadingNowDetailManagerInMOC:a2 reason:@"deferred"];
}

id sub_4DA44(uint64_t a1)
{
  return [*(id *)(a1 + 32) setProcessingReadingNowChanges:0];
}

void sub_4DB28(id *a1, void *a2)
{
  id v3 = a1[4];
  id v4 = a2;
  uint64_t v5 = [v3 libraryManager];
  uint64_t v6 = [v5 cloudSyncVersionsForDataType:@"BCAssetDetail" inContext:v4];

  [v6 setLocalVersion:[v6 localVersion] + 1];
  id v7 = [v6 localVersion];
  id v8 = [a1[5] bu_dictionaryUsingPropertyAsKey:@"assetID"];
  id v9 = [v8 allKeys];
  uint64_t v10 = [a1[4] cloudAssetDetailManager];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  void v15[2] = sub_4DC94;
  v15[3] = &unk_D2D90;
  id v11 = a1[4];
  id v16 = v8;
  id v17 = v11;
  id v20 = v7;
  id v12 = a1[6];
  id v18 = v9;
  id v19 = v12;
  id v13 = v9;
  id v14 = v8;
  [v10 assetDetailsForAssetIDs:v13 completion:v15];
}

void sub_4DC94(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (v7)
  {
    id v8 = BKLibraryAssetDetailsLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_92A24();
    }

    id v9 = objc_retainBlock(*(id *)(a1 + 56));
    uint64_t v10 = v9;
    if (v9) {
      (*((void (**)(id))v9 + 2))(v9);
    }
  }
  else
  {
    uint64_t v10 = +[NSMutableDictionary dictionary];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v30 = v6;
    id obj = v6;
    id v11 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v37;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v37 != v13) {
            objc_enumerationMutation(obj);
          }
          id v15 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          id v16 = [v15 assetID];
          id v17 = [*(id *)(a1 + 32) objectForKeyedSubscript:v16];
          id v18 = BKLibraryAssetDetailsLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            id v19 = [v17 readingPositionCFIString];
            [v17 readingProgress];
            *(_DWORD *)buf = 138412802;
            id v41 = v16;
            __int16 v42 = 2112;
            id v43 = v19;
            __int16 v44 = 2048;
            double v45 = v20;
            _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "BCAssetDetail updateAssetDetails #globalAnnotation for assetID:%@, location:%@, progress:%f", buf, 0x20u);
          }
          [v17 readingProgress];
          [v15 setReadingProgress:];
          [v17 readingProgressHighWaterMark];
          [v15 setReadingProgressHighWaterMark:];
          long long v21 = [v17 readingPositionCFIString];
          [v15 setReadingPositionCFIString:v21];

          id v22 = [v17 readingPositionAnnotationVersion];
          [v15 setReadingPositionAnnotationVersion:v22];

          uint64_t v23 = [v17 readingPositionAssetVersion];
          [v15 setReadingPositionAssetVersion:v23];

          id v24 = [v17 readingPositionUserData];
          [v15 setReadingPositionUserData:v24];

          [v15 setReadingPositionLocationRangeStart:[v17 readingPositionLocationRangeStart]];
          [v15 setReadingPositionLocationRangeEnd:[v17 readingPositionLocationRangeEnd]];
          [v15 setReadingPositionAbsolutePhysicalLocation:[v17 readingPositionAbsolutePhysicalLocation]];
          id v25 = [v17 readingPositionStorageUUID];
          [v15 setReadingPositionStorageUUID:v25];

          char v26 = [v17 readingPositionUserUpdatedDate];
          [v15 setReadingPositionLocationUpdateDate:v26];

          [v10 setObject:v15 forKeyedSubscript:v16];
        }
        id v12 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
      }
      while (v12);
    }

    id v27 = [*(id *)(a1 + 40) cloudAssetDetailManager];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_4E0B0;
    v32[3] = &unk_D2D68;
    uint64_t v29 = *(void **)(a1 + 56);
    uint64_t v28 = *(void *)(a1 + 64);
    v32[4] = *(void *)(a1 + 40);
    uint64_t v35 = v28;
    id v34 = v29;
    id v33 = *(id *)(a1 + 48);
    [v27 setAssetDetails:v10 completion:v32];

    id v7 = 0;
    id v6 = v30;
  }
}

void sub_4E0B0(uint64_t a1, int a2, int a3, void *a4)
{
  id v7 = a4;
  if (a2)
  {
    id v8 = [*(id *)(a1 + 32) libraryManager];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_4E2F4;
    v19[3] = &unk_D2D40;
    uint64_t v10 = *(void **)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    void v19[4] = *(void *)(a1 + 32);
    uint64_t v21 = v9;
    id v20 = v10;
    [v8 performBlockOnWorkerQueue:v19];

    id v11 = +[BULogUtilities shared];
    unsigned int v12 = [v11 verboseLoggingEnabled];

    if (a3)
    {
      if (v12)
      {
        uint64_t v13 = BKLibraryAssetDetailsDevelopmentLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          id v14 = [*(id *)(a1 + 40) componentsJoinedByString:@", "];
          *(_DWORD *)buf = 138412290;
          uint64_t v23 = v14;
          id v15 = "\"\\\"succesfully set assetDetails for assetIDs: [%@]\\\"\"";
LABEL_14:
          _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, v15, buf, 0xCu);

          goto LABEL_15;
        }
        goto LABEL_15;
      }
    }
    else if (v12)
    {
      uint64_t v13 = BKLibraryAssetDetailsDevelopmentLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [*(id *)(a1 + 40) componentsJoinedByString:@", "];
        *(_DWORD *)buf = 138412290;
        uint64_t v23 = v14;
        id v15 = "\"\\\"succesfully set assetDetails, but no changes for assetIDs: [%@]\\\"\"";
        goto LABEL_14;
      }
LABEL_15:
    }
    goto LABEL_17;
  }
  id v16 = BKLibraryAssetDetailsLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_91EA0();
  }

  id v17 = objc_retainBlock(*(id *)(a1 + 48));
  id v18 = v17;
  if (v17) {
    (*((void (**)(id))v17 + 2))(v17);
  }

LABEL_17:
}

void sub_4E2F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setSessionContextType:2];
  id v4 = [*(id *)(a1 + 32) libraryManager];
  id v7 = [v4 cloudSyncVersionsForDataType:@"BCAssetDetail" inContext:v3];

  [v7 setSyncVersion:*(void *)(a1 + 48)];
  id v5 = objc_retainBlock(*(id *)(a1 + 40));
  id v6 = v5;
  if (v5) {
    (*((void (**)(id))v5 + 2))(v5);
  }
}

void sub_4E480(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_new();
  id v5 = [*(id *)(a1 + 32) libraryManager];
  id v18 = v3;
  id v6 = [v5 libraryAssetsWithAssetIDs:*(void *)(a1 + 40) inManagedObjectContext:v3];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        unsigned int v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v13 = [v12 assetID];

        if (v13)
        {
          if ([v12 isManagedBook]) {
            id v14 = &__kCFBooleanTrue;
          }
          else {
            id v14 = &__kCFBooleanFalse;
          }
          id v15 = [v12 assetID];
          [v4 setObject:v14 forKeyedSubscript:v15];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  id v16 = objc_retainBlock(*(id *)(a1 + 48));
  id v17 = v16;
  if (v16) {
    (*((void (**)(id, void *))v16 + 2))(v16, v4);
  }
}

void sub_4E82C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_4E84C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t sub_4E86C(uint64_t a1)
{
  return *(void *)(a1 + 40);
}

uint64_t sub_4EA44(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableSet);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  return _objc_release_x1(v2, v4);
}

void sub_4ED10(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) allKeys];
  id v5 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  long long v20 = (void *)v4;
  id v6 = +[NSPredicate predicateWithFormat:@"storeID IN %@", v4];
  [v5 setPredicate:v6];

  [v5 setFetchBatchSize:32];
  id v28 = 0;
  long long v21 = v3;
  id v7 = [v3 executeFetchRequest:v5 error:&v28];
  id v19 = v28;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v14 = [v13 storeID];
        id v15 = [*(id *)(a1 + 32) objectForKeyedSubscript:v14];
        if (v15)
        {
          uint64_t v16 = *(void *)(a1 + 40);
          id v17 = *(NSObject **)(v16 + 16);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_4EFB0;
          block[3] = &unk_D1418;
          void block[4] = v16;
          id v23 = v14;
          dispatch_sync(v17, block);
          id v18 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v15 isExplicit]);
          [v13 setDifferentNumber:v18 forKey:@"isExplicit"];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v10);
  }
}

void sub_4EFB0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) qDownloadingStoreIDs];
  [v2 removeObject:*(void *)(a1 + 40)];
}

void sub_4F0B4(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _libraryAssetsForPostProcessingInManagedObjectContext:a2];
  uint64_t v4 = [v3 valueForKey:@"storeID"];
  id v5 = [v4 allObjects];
  id v6 = +[NSMutableSet setWithArray:v5];

  if ([v6 count])
  {
    id v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_4F25C;
    block[3] = &unk_D1418;
    id v8 = v6;
    uint64_t v9 = *(void *)(a1 + 32);
    id v14 = v8;
    uint64_t v15 = v9;
    dispatch_sync(v7, block);
    if ([v8 count])
    {
      id v10 = +[AEUserPublishing sharedInstance];
      uint64_t v11 = [v8 allObjects];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      void v12[2] = sub_4F2D8;
      v12[3] = &unk_D2DE8;
      void v12[4] = *(void *)(a1 + 32);
      [v10 productProfilesForStoreIDs:v11 completion:v12];
    }
  }
}

void sub_4F25C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) qDownloadingStoreIDs];
  [v2 minusSet:v3];

  id v4 = [*(id *)(a1 + 40) qDownloadingStoreIDs];
  [v4 unionSet:*(void *)(a1 + 32)];
}

void sub_4F2D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    [*(id *)(a1 + 32) _postProcessExplicitFlagForProductProfiles:v3];
    [*(id *)(a1 + 32) _postProcessCoverImagesForProductProfiles:v3];
  }
  else if (!v3)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(NSObject **)(v4 + 16);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_4F38C;
    block[3] = &unk_D1520;
    void block[4] = v4;
    dispatch_sync(v5, block);
  }
}

void sub_4F38C(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) qDownloadingStoreIDs];
  [v1 removeAllObjects];
}

void sub_51420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_51438(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_51448(uint64_t a1)
{
}

intptr_t sub_51450(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 purchasedDSID];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v6);
}

void sub_51938(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 collectionProvider];
  id v6 = [v5 collectionsWithCollectionIDs:*(void *)(a1 + 40) inManagedObjectContext:v4 error:0];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_51A3C;
  v8[3] = &unk_D2E98;
  id v9 = *(id *)(a1 + 40);
  id v7 = [v6 sortedArrayUsingComparator:v8];
  if (+[BKUserSortOrderManager resortAscendingSortKeyedObjects:v7])
  {
    [*(id *)(a1 + 32) resetNextCollectionSort];
    [*(id *)(a1 + 32) saveMetaData];
  }
}

uint64_t sub_51A3C(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [a2 collectionID];
  id v8 = [v5 indexOfObject:v7];

  id v9 = *(void **)(a1 + 32);
  id v10 = [v6 collectionID];

  id v11 = [v9 indexOfObject:v10];
  if (v8 >= v11) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = -1;
  }
  if (v8 > v11) {
    return 1;
  }
  else {
    return v12;
  }
}

void sub_53894(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) libraryManager];
  id v30 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v3 = *(id *)(a1 + 40);
  id v4 = [v3 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (!v4) {
    goto LABEL_20;
  }
  id v5 = v4;
  uint64_t v6 = *(void *)v36;
  do
  {
    id v7 = 0;
    do
    {
      if (*(void *)v36 != v6) {
        objc_enumerationMutation(v3);
      }
      id v8 = *(id *)(*((void *)&v35 + 1) + 8 * (void)v7);
      if ([v8 isValid])
      {
        id v9 = [v8 assetID];
        id v10 = [v2 libraryMutableAssetWithAssetID:v9 inManagedObjectContext:*(void *)(a1 + 32)];

        id v11 = [v8 storeID];

        if (v11)
        {
          uint64_t v12 = [v8 storeID];
          goto LABEL_9;
        }
        if ([v8 isHidden]
          && ([v8 assetID],
              uint64_t v15 = objc_claimAutoreleasedReturnValue(),
              id v16 = [v15 length],
              v15,
              v16))
        {
          uint64_t v12 = [v8 assetID];
LABEL_9:
          uint64_t v13 = (void *)v12;
          [v30 addObject:v12];

          BOOL v14 = *(unsigned char *)(a1 + 56) != 0;
LABEL_10:
          [v10 setIsHidden:v14];
        }
        else if (*(unsigned char *)(a1 + 56))
        {
          BOOL v14 = 1;
          goto LABEL_10;
        }
      }
      id v7 = (char *)v7 + 1;
    }
    while (v5 != v7);
    id v17 = [v3 countByEnumeratingWithState:&v35 objects:v41 count:16];
    id v5 = v17;
  }
  while (v17);
LABEL_20:

  uint64_t v18 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 56)) {
    +[BKJaliscoStatus addHidden:inMOC:](BKJaliscoStatus, "addHidden:inMOC:", v30, v18, v2);
  }
  else {
    +[BKJaliscoStatus addLocal:inMOC:](BKJaliscoStatus, "addLocal:inMOC:", v30, v18, v2);
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v19 = [*(id *)(a1 + 40) reverseObjectEnumerator];
  id v20 = [v19 countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v32;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v32 != v22) {
          objc_enumerationMutation(v19);
        }
        id v24 = *(id *)(*((void *)&v31 + 1) + 8 * i);
        if ([v24 isValid])
        {
          long long v25 = +[BKUserSortOrderManager nextSortKeyForCollection:*(void *)(a1 + 48)];
          long long v26 = +[BKCollectionMember collectionMemberDictionaryWithLibraryAsset:v24 sortKey:v25];

          if (v26)
          {
            long long v27 = *(void **)(a1 + 48);
            long long v39 = v26;
            id v28 = +[NSArray arrayWithObjects:&v39 count:1];
            [v27 addCollectionMemberDictionaries:v28 forceToTop:*(unsigned __int8 *)(a1 + 57)];
          }
        }
      }
      id v21 = [v19 countByEnumeratingWithState:&v31 objects:v40 count:16];
    }
    while (v21);
  }

  [*(id *)(a1 + 48) updateLastModification];
  if ([*(id *)(a1 + 32) hasChanges]) {
    [*(id *)(a1 + 32) save:0];
  }
}

void sub_53D64(id a1)
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.iBooks.BKCollectionSortKey", v3);
  id v2 = (void *)qword_EE600;
  qword_EE600 = (uint64_t)v1;
}

void sub_53ECC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_53EE4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_53EF4(uint64_t a1)
{
}

void sub_53EFC(uint64_t a1)
{
  id v2 = *(id **)(a1 + 32);
  if (v2[1])
  {
    if ([v2[1] integerValue]) {
      goto LABEL_16;
    }
    id v2 = *(id **)(a1 + 32);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  [v2 members];
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = [*(id *)(*((void *)&v14 + 1) + 8 * i) sortKey];
        id v10 = [v9 integerValue];

        if (v10 > v6) {
          id v6 = v10;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }

  uint64_t v11 = +[NSNumber numberWithUnsignedLongLong:v6];
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void **)(v12 + 8);
  *(void *)(v12 + _Block_object_dispose(&STACK[0x380], 8) = v11;

LABEL_16:
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 8));
}

void sub_54108(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 8);
  *(void *)(v1 + _Block_object_dispose(&STACK[0x380], 8) = 0;
}

void sub_541D4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) sortKey];
  id v3 = [v2 longLongValue];
  id v4 = [*(id *)(*(void *)(a1 + 40) + 8) longLongValue];

  if ((uint64_t)v3 > (uint64_t)v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) sortKey];
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(v6 + 8);
    *(void *)(v6 + _Block_object_dispose(&STACK[0x380], 8) = v5;
    _objc_release_x1(v5, v7);
  }
}

id sub_55244(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTitle:*(void *)(a1 + 40)];
}

void sub_56A80(id a1)
{
  v3[0] = &off_D9F68;
  v3[1] = &off_D9F80;
  v4[0] = kBKCollectionDefaultIDBooks;
  v4[1] = kBKCollectionDefaultIDBooks;
  v3[2] = &off_D9F98;
  v3[3] = &off_D9FB0;
  v4[2] = kBKCollectionDefaultIDBooks;
  v4[3] = kBKCollectionDefaultIDPDFs;
  v3[4] = &off_D9FC8;
  void v4[4] = kBKCollectionDefaultIDAudiobooks;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:5];
  id v2 = (void *)qword_EE618;
  qword_EE618 = v1;
}

void sub_57610(uint64_t a1)
{
  id v3 = *(void **)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_576C4;
  v4[3] = &unk_D2F60;
  void v4[4] = v3;
  id v5 = v2;
  id v6 = *(id *)(a1 + 48);
  [v3 annotationsForAssetIDs:v5 completion:v4];
}

void sub_576C4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 libraryManager];
  id v11 = [v5 newManagedObjectContext];

  id v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"NewMOC 7 %s %@", "-[BKLibraryAssetModificationDateManager resetModificationDateForAssetIDs:completion:]_block_invoke_2", *(void *)(a1 + 40));
  [v11 setName:v6];

  uint64_t v7 = [*(id *)(a1 + 32) libraryAssetForAssetIDs:*(void *)(a1 + 40) inManagedObjectContext:v11];
  id v8 = [*(id *)(a1 + 32) updatesFromLibraryAssets:v7 annotations:v4];

  [*(id *)(a1 + 32) consumeUpdates:v8 inManagedObjectContext:v11];
  id v9 = objc_retainBlock(*(id *)(a1 + 48));
  id v10 = v9;
  if (v9) {
    (*((void (**)(id))v9 + 2))(v9);
  }
}

void sub_57B24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_57B3C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_57B4C(uint64_t a1)
{
}

void sub_57B54(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[NSFetchRequest fetchRequestWithEntityName:@"AEAnnotation"];
  [v4 setResultType:2];
  v21[0] = @"annotationAssetID";
  id v5 = +[AEAnnotation maxUserModificationDateExpressionDescription];
  v21[1] = v5;
  id v6 = +[NSArray arrayWithObjects:v21 count:2];
  [v4 setPropertiesToFetch:v6];

  CFStringRef v20 = @"annotationAssetID";
  uint64_t v7 = +[NSArray arrayWithObjects:&v20 count:1];
  [v4 setPropertiesToGroupBy:v7];

  id v8 = +[AEAnnotation predicateForAnnotationsWithAssetIDInList:*(void *)(a1 + 32) includingDeleted:1];
  id v9 = +[AEAnnotation predicateForAnnotationsIncludingDeletedWithUserModificationDate];
  v19[0] = v8;
  v19[1] = v9;
  id v10 = +[NSArray arrayWithObjects:v19 count:2];
  id v11 = +[NSCompoundPredicate andPredicateWithSubpredicates:v10];
  [v4 setPredicate:v11];

  id v18 = 0;
  uint64_t v12 = [v3 executeFetchRequest:v4 error:&v18];

  id v13 = v18;
  uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
  long long v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v12;

  id v16 = objc_retainBlock(*(id *)(a1 + 40));
  long long v17 = v16;
  if (v16) {
    (*((void (**)(id, void))v16 + 2))(v16, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  }
}

id BKLibraryCollectionLog()
{
  if (qword_EE628 != -1) {
    dispatch_once(&qword_EE628, &stru_D2FA8);
  }
  v0 = (void *)qword_EE620;

  return v0;
}

void sub_58228(id a1)
{
  os_log_t v1 = os_log_create("com.apple.iBooks", "BKLibrary.Collections");
  uint64_t v2 = qword_EE620;
  qword_EE620 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

id BKLibraryCollectionDevelopmentLog()
{
  if (qword_EE638 != -1) {
    dispatch_once(&qword_EE638, &stru_D2FC8);
  }
  v0 = (void *)qword_EE630;

  return v0;
}

void sub_582C0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.iBooks", "BKLibrary.Collections.Development");
  uint64_t v2 = qword_EE630;
  qword_EE630 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

id BKLibraryAssetDetailsLog()
{
  if (qword_EE648 != -1) {
    dispatch_once(&qword_EE648, &stru_D2FE8);
  }
  v0 = (void *)qword_EE640;

  return v0;
}

void sub_58358(id a1)
{
  os_log_t v1 = os_log_create("com.apple.iBooks", "BKLibrary.AssetDetails");
  uint64_t v2 = qword_EE640;
  qword_EE640 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

id BKLibraryAssetDetailsDevelopmentLog()
{
  if (qword_EE658 != -1) {
    dispatch_once(&qword_EE658, &stru_D3008);
  }
  v0 = (void *)qword_EE650;

  return v0;
}

void sub_583F0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.iBooks", "BKLibrary.AssetDetails.Development");
  uint64_t v2 = qword_EE650;
  qword_EE650 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

id BKLibraryPriceManagerLog()
{
  if (qword_EE668 != -1) {
    dispatch_once(&qword_EE668, &stru_D3028);
  }
  v0 = (void *)qword_EE660;

  return v0;
}

void sub_58488(id a1)
{
  os_log_t v1 = os_log_create("com.apple.iBooks", "BKLibrary.PriceManager");
  uint64_t v2 = qword_EE660;
  qword_EE660 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

id BKLibraryPriceManagerDevelopmentLog()
{
  if (qword_EE678 != -1) {
    dispatch_once(&qword_EE678, &stru_D3048);
  }
  v0 = (void *)qword_EE670;

  return v0;
}

void sub_58520(id a1)
{
  os_log_t v1 = os_log_create("com.apple.iBooks", "BKLibrary.PriceManager.Development");
  uint64_t v2 = qword_EE670;
  qword_EE670 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

id BKLibraryPriceTrackingLog()
{
  if (qword_EE688 != -1) {
    dispatch_once(&qword_EE688, &stru_D3068);
  }
  v0 = (void *)qword_EE680;

  return v0;
}

void sub_585B8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.iBooks", "BKLibrary.PriceTracking");
  uint64_t v2 = qword_EE680;
  qword_EE680 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_58808(id a1)
{
  os_log_t v1 = (void *)qword_EE690;
  qword_EE690 = (uint64_t)&off_DA178;
}

void sub_5932C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_59348(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _libraryDataSourcePerformanceChanged];
}

uint64_t sub_59388(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_59450(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 libraryManager];
  [v5 libraryDataSource:*(void *)(a1 + 32) reloadInGroup:v4];
}

void sub_59708(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_597C0;
  v7[3] = &unk_D1418;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  dispatch_barrier_async(v4, v7);
}

void sub_597C0(uint64_t a1)
{
  id v2 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  id v3 = *(void **)(a1 + 32);
  uint64_t v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  id v11 = sub_5996C;
  uint64_t v12 = &unk_D30D8;
  id v13 = v2;
  id v4 = v2;
  [v3 enumerateKeysAndObjectsUsingBlock:&v9];
  id v5 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  [v5 encodeObject:v4 forKey:@"Root"];
  [v5 finishEncoding];
  id v6 = [v5 encodedData];
  uint64_t v7 = [*(id *)(a1 + 40) cacheURL];
  [v6 writeToURL:v7 atomically:1];

  [*(id *)(a1 + 40) _updateCreationDate];
  id v8 = [*(id *)(a1 + 40) libraryManager];
  [v8 libraryDataSource:_NSConcreteStackBlock updateWithName:3221225472 block:sub_59A10];
}

void sub_5996C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v8 = [a3 profileDictionary];
  id v6 = +[BKLibraryDataSourcePerformanceAsset profileKeysOfInterest];
  uint64_t v7 = [v8 dictionaryWithValuesForKeys:v6];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v5];
}

void sub_59A10(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 libraryManager];
  [v5 libraryDataSource:*(void *)(a1 + 32) reloadInGroup:v4];
}

void sub_5A00C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 10))
  {
    *(unsigned char *)(v2 + 10) = 1;
    unsigned int v3 = [*(id *)(*(void *)(a1 + 32) + 56) checkResourceIsReachableAndReturnError:0];
    id v4 = *(void **)(a1 + 32);
    if (v3) {
      [v4 _updateCreationDate];
    }
    else {
      [v4 _fetchProductProfiles];
    }
  }
  id v5 = [*(id *)(a1 + 32) _cachedProductProfiles];
  id v8 = [v5 allKeys];

  kdebug_trace();
  id v6 = objc_retainBlock(*(id *)(a1 + 40));
  uint64_t v7 = v6;
  if (v6) {
    (*((void (**)(id, id, void))v6 + 2))(v6, v8, 0);
  }
}

void sub_5A264(id *a1)
{
  id v2 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[a1[4] count]];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = a1[4];
  id v3 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v20;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v8 = [BKLibraryDataSourcePerformanceAsset alloc];
        uint64_t v9 = [a1[5] identifier];
        uint64_t v10 = [(BKLibraryDataSourcePerformanceAsset *)v8 initWithAssetID:v7 identifier:v9];

        uint64_t v11 = (uint64_t)[v7 integerValue];
        if ([a1[5] createSeriesContainers])
        {
          if (v11 % 5)
          {
            uint64_t v12 = +[NSNumber numberWithInteger:v11 % 5];
            [(BKLibraryDataSourcePerformanceAsset *)v10 setSeriesSortKey:v12];

            id v13 = (char *)(v11 - v11 % 5);
          }
          else
          {
            [(BKLibraryDataSourcePerformanceAsset *)v10 setContentType:5];
            id v13 = (char *)v11;
          }
          uint64_t v14 = +[NSNumber numberWithInteger:v13];
          long long v15 = [v14 stringValue];
          [(BKLibraryDataSourcePerformanceAsset *)v10 setSeriesID:v15];
        }
        [v2 addObject:v10];
      }
      id v4 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v4);
  }

  kdebug_trace();
  id v16 = objc_retainBlock(a1[6]);
  long long v17 = v16;
  if (v16) {
    (*((void (**)(id, id, void))v16 + 2))(v16, v2, 0);
  }
}

void sub_5A4D4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _cachedProductProfiles];
  id v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v19 = a1;
  id obj = *(id *)(a1 + 40);
  id v4 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v9 = [v2 objectForKeyedSubscript:v8];

        if (v9)
        {
          uint64_t v10 = [BKLibraryDataSourcePerformanceAsset alloc];
          [v2 objectForKeyedSubscript:v8];
          v12 = uint64_t v11 = v3;
          id v13 = [*(id *)(v19 + 32) identifier];
          uint64_t v14 = [*(id *)(v19 + 32) creationDate];
          long long v15 = [(BKLibraryDataSourcePerformanceAsset *)v10 initWithAssetID:v8 productProfile:v12 identifier:v13 date:v14];

          id v3 = v11;
          [v11 addObject:v15];
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v5);
  }

  kdebug_trace();
  id v16 = objc_retainBlock(*(id *)(v19 + 48));
  long long v17 = v16;
  if (v16) {
    (*((void (**)(id, id, void))v16 + 2))(v16, v3, 0);
  }
}

void sub_5ACBC(id a1)
{
  uint64_t v1 = objc_opt_new();
  uint64_t v2 = qword_EE6B0;
  qword_EE6B0 = v1;

  _objc_release_x1(v1, v2);
}

id sub_5AE6C(uint64_t a1)
{
  return [*(id *)(a1 + 32) dq_readPersistedInfoFromDisk];
}

void sub_5AFAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_5AFC4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_5AFD4(uint64_t a1)
{
}

void sub_5AFDC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) assetPathToCacheItemDict];
  id v8 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  id v3 = v8;
  if (v8)
  {
    id v4 = [v8 fileSizeNumber];
    id v5 = [v4 copy];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v3 = v8;
  }
}

void sub_5B1AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_5B1C4(uint64_t a1)
{
  [*(id *)(a1 + 32) dq_filesSizeForCacheItemRequest:*(void *)(a1 + 40)];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id sub_5B2E4(uint64_t a1)
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v12 + 1) + 8 * (void)v6);
        id v8 = [*(id *)(a1 + 40) assetPathToCacheItemDict];
        uint64_t v9 = [v8 objectForKeyedSubscript:v7];

        if (v9)
        {
          uint64_t v10 = [*(id *)(a1 + 40) assetPathToCacheItemDict];
          [v10 removeObjectForKey:v7];
        }
        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }

  return [*(id *)(a1 + 40) dq_persistInfoToDisk];
}

void sub_5B560(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dq_filesSizeForCacheItemRequest:*(void *)(a1 + 40)];
  id v5 = [v2 copy];

  id v3 = objc_retainBlock(*(id *)(a1 + 48));
  id v4 = v3;
  if (v3) {
    (*((void (**)(id, id, void))v3 + 2))(v3, v5, 0);
  }
}

void sub_5B714(id *a1)
{
  id v2 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = a1[4];
  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v7);
        if (!v8) {
          BCReportAssertionFailureWithMessage();
        }
        uint64_t v9 = [v8 assetID:v17];

        if (!v9) {
          BCReportAssertionFailureWithMessage();
        }
        uint64_t v10 = [v8 assetURL];

        if (!v10) {
          BCReportAssertionFailureWithMessage();
        }
        uint64_t v11 = [v8 assetID];

        if (v11)
        {
          long long v12 = [a1[5] dq_filesSizeForCacheItemRequest:v8];
          id v13 = [v12 copy];
          long long v14 = [v8 assetID];
          [v2 setObject:v13 forKeyedSubscript:v14];
        }
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }

  id v15 = objc_retainBlock(a1[6]);
  id v16 = v15;
  if (v15) {
    (*((void (**)(id, void *, void))v15 + 2))(v15, v2, 0);
  }
}

void sub_5B9E4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) assetPathToCacheItemDict];
  id v3 = [v2 allKeys];

  if ([v3 count])
  {
    id v4 = [*(id *)(a1 + 32) libraryManager];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_5BABC;
    v7[3] = &unk_D18D8;
    id v5 = v3;
    uint64_t v6 = *(void *)(a1 + 32);
    id v8 = v5;
    uint64_t v9 = v6;
    [v4 performBackgroundReadOnlyBlock:v7];
  }
}

void sub_5BABC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  id v5 = +[BKLibraryManager predicateForAssetIDsTaggedLibraryAssets:*(void *)(a1 + 32)];
  [v4 setPredicate:v5];

  id v13 = 0;
  uint64_t v6 = [v3 executeFetchRequest:v4 error:&v13];

  id v7 = v13;
  if ([v6 count])
  {
    id v8 = [v6 valueForKey:@"assetID"];
    if ([v8 count])
    {
      uint64_t v9 = +[NSMutableSet setWithArray:*(void *)(a1 + 32)];
      uint64_t v10 = +[NSSet setWithArray:v8];
      [v9 minusSet:v10];
      uint64_t v11 = *(void **)(a1 + 40);
      long long v12 = [v9 allObjects];
      [v11 clearCacheEntryForAssetID:v12];
    }
  }
}

id sub_5BF4C(uint64_t a1)
{
  return [*(id *)(a1 + 32) dq_persistInfoToDisk];
}

void sub_5C810(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, long long buf, int a16, __int16 a17, __int16 a18, int a19)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v20 = objc_begin_catch(a1);
      long long v21 = BCIMLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 136315650;
        *(void *)((char *)&buf + 4) = "-[BKLibraryFileSizeManager dq_readPersistedInfoFromDisk]";
        WORD6(buf) = 2080;
        *(void *)((char *)&buf + 14) = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BKLibrary/Source/BKLibra"
                                         "ryFileSizeManager.m";
        a18 = 1024;
        a19 = 537;
        _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "%s %s:%d", (uint8_t *)&buf, 0x1Cu);
      }

      long long v22 = BCIMLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        long long v23 = [v19 _persistedInfoURL];
        LODWORD(buf) = 138412546;
        *(void *)((char *)&buf + 4) = v23;
        WORD6(buf) = 2112;
        *(void *)((char *)&buf + 14) = v20;
        _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "@\"Failed to read: %@ -- %@\"", (uint8_t *)&buf, 0x16u);
      }
      objc_end_catch();
      JUMPOUT(0x5C7CCLL);
    }
    objc_begin_catch(a1);
    objc_exception_rethrow();
  }
  _Unwind_Resume(a1);
}

id BKLibraryAssetIdentifierFromAsset(void *a1)
{
  id v1 = a1;
  id v2 = [v1 assetID];
  if (v2)
  {
    id v3 = [v1 assetID];

    +[BKAssetID identifierWithAssetID:v3];
  }
  else
  {
    id v3 = [v1 temporaryAssetID];

    +[BKTemporaryAssetID identifierWithTemporaryAssetID:v3];
  id v4 = };

  return v4;
}

void sub_5D360(id a1)
{
  id v1 = objc_alloc_init(BKLibraryImportStatusController);
  uint64_t v2 = qword_EE6C0;
  qword_EE6C0 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_5D558(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_5D594(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained[1];
    uint64_t v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    uint64_t v11 = sub_5D67C;
    long long v12 = &unk_D1548;
    id v7 = WeakRetained;
    id v13 = v7;
    id v14 = v3;
    dispatch_sync(v6, &v9);
    id v8 = [v7 coalescedZeroing:v9, v10, v11, v12];
    [v8 signalWithCompletion:&stru_D3148];
  }
}

void sub_5D67C(uint64_t a1)
{
  [*(id *)(a1 + 32) setTotalImportOperations:[*(id *)(a1 + 32) actualTotalImportOperations]];
  [*(id *)(a1 + 32) setCompletedImportOperations:[*(id *)(a1 + 32) actualCompletedImportOperations]];
  objc_msgSend(*(id *)(a1 + 32), "setFailedImportOperations:", objc_msgSend(*(id *)(a1 + 32), "actualFailedImportOperations"));
  [*(id *)(a1 + 32) setTotalImportOperationsProcessed:[*(id *)(a1 + 32) totalImportOperationsProcessed] + 1];
  uint64_t v2 = (void (**)(void))objc_retainBlock(*(id *)(a1 + 40));
  if (v2)
  {
    id v3 = v2;
    v2[2]();
    uint64_t v2 = v3;
  }
}

void sub_5D728(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained[1];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_5D7EC;
    v7[3] = &unk_D1548;
    id v8 = WeakRetained;
    id v9 = v3;
    dispatch_sync(v6, v7);
  }
}

void sub_5D7EC(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setActualTotalImportOperations:", (unsigned char *)objc_msgSend(*(id *)(a1 + 32), "actualTotalImportOperations")- ((char *)objc_msgSend(*(id *)(a1 + 32), "actualFailedImportOperations")+ (void)objc_msgSend(*(id *)(a1 + 32), "actualCompletedImportOperations")));
  [*(id *)(a1 + 32) setActualCompletedImportOperations:0];
  [*(id *)(a1 + 32) setActualFailedImportOperations:0];
  [*(id *)(a1 + 32) setTotalImportOperations:[*(id *)(a1 + 32) actualTotalImportOperations]];
  objc_msgSend(*(id *)(a1 + 32), "setCompletedImportOperations:", objc_msgSend(*(id *)(a1 + 32), "actualCompletedImportOperations"));
  objc_msgSend(*(id *)(a1 + 32), "setFailedImportOperations:", objc_msgSend(*(id *)(a1 + 32), "actualFailedImportOperations"));
  [*(id *)(a1 + 32) setTotalImportOperationsProcessed:[*(id *)(a1 + 32) totalImportOperationsProcessed] + 1];
  uint64_t v2 = (void (**)(void))objc_retainBlock(*(id *)(a1 + 40));
  if (v2)
  {
    id v3 = v2;
    v2[2]();
    uint64_t v2 = v3;
  }
}

id sub_5D980(uint64_t a1)
{
  uint64_t v2 = (char *)[*(id *)(a1 + 32) actualTotalImportOperations] + 1;
  id v3 = *(void **)(a1 + 32);

  return [v3 setActualTotalImportOperations:v2];
}

id sub_5DA60(uint64_t a1)
{
  uint64_t v2 = (char *)[*(id *)(a1 + 32) actualCompletedImportOperations] + 1;
  id v3 = *(void **)(a1 + 32);

  return [v3 setActualCompletedImportOperations:v2];
}

id sub_5DB40(uint64_t a1)
{
  uint64_t v2 = (char *)[*(id *)(a1 + 32) actualFailedImportOperations] + 1;
  id v3 = *(void **)(a1 + 32);

  return [v3 setActualFailedImportOperations:v2];
}

void sub_5E1EC(id *a1)
{
  if ([a1[4] length])
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_5E370;
    v10[3] = &unk_D22F0;
    *(_OWORD *)id v8 = *((_OWORD *)a1 + 2);
    id v2 = v8[0];
    int8x16_t v11 = vextq_s8(*(int8x16_t *)v8, *(int8x16_t *)v8, 8uLL);
    id v12 = a1[6];
    id v3 = objc_retainBlock(v10);
    id v4 = [a1[5] expirationDate];
    id v5 = +[NSDate date];
    id v6 = [v4 compare:v5];

    if (v6 == (id)-1) {
      [a1[5] _invalidate:v3];
    }
    else {
      ((void (*)(void *))v3[2])(v3);
    }
  }
  else
  {
    id v7 = objc_retainBlock(a1[6]);
    if (v7)
    {
      id v9 = v7;
      (*((void (**)(id, id, void))v7 + 2))(v7, a1[4], 0);
      id v7 = v9;
    }
  }
}

void sub_5E370(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) prices];
  id v15 = [v2 objectForKey:*(void *)(a1 + 40)];

  if (v15)
  {
    id v3 = (void (**)(void))objc_retainBlock(*(id *)(a1 + 48));
    id v4 = v3;
    if (!v3)
    {
LABEL_5:

      goto LABEL_15;
    }
    id v5 = v3[2];
LABEL_4:
    v5();
    goto LABEL_5;
  }
  id v6 = [*(id *)(a1 + 32) allStoreAssets];
  id v7 = [v6 objectForKey:*(void *)(a1 + 40)];

  id v8 = *(void **)(a1 + 48);
  if (!v7)
  {
    id v12 = objc_retainBlock(v8);
    id v4 = v12;
    if (!v12) {
      goto LABEL_5;
    }
    id v5 = v12[2];
    goto LABEL_4;
  }
  if (v8)
  {
    id v9 = [*(id *)(a1 + 32) completionHandlers];
    uint64_t v10 = [v9 objectForKeyedSubscript:*(void *)(a1 + 40)];

    int8x16_t v11 = objc_retainBlock(*(id *)(a1 + 48));
    if (v10)
    {
      [v10 addObject:v11];

      int8x16_t v11 = [*(id *)(a1 + 32) completionHandlers];
      [v11 setObject:v10 forKeyedSubscript:*(void *)(a1 + 40)];
    }
    else
    {
      id v13 = +[NSMutableArray arrayWithObject:v11];
      id v14 = [*(id *)(a1 + 32) completionHandlers];
      [v14 setObject:v13 forKeyedSubscript:*(void *)(a1 + 40)];
    }
  }
  [*(id *)(a1 + 32) _fetchPricesForStoreAssetIDs];
LABEL_15:
}

void sub_5E5E4(uint64_t a1)
{
  if ([*(id *)(a1 + 32) length])
  {
    id v2 = [*(id *)(a1 + 40) completionHandlers];
    [v2 removeObjectForKey:*(void *)(a1 + 32)];
  }
}

void sub_5E708(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    +[NSValue valueWithNonretainedObject:](NSValue, "valueWithNonretainedObject:");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    id v2 = [*(id *)(a1 + 40) listeners];
    [v2 addObject:v3];
  }
}

void sub_5E840(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = [*(id *)(a1 + 40) listeners];
    id v3 = [v2 count];

    if (v3)
    {
      uint64_t v4 = 0;
      while (1)
      {
        id v5 = [*(id *)(a1 + 40) listeners];
        id v6 = [v5 objectAtIndexedSubscript:v4];
        id v8 = [v6 nonretainedObjectValue];

        if (v8 == *(id *)(a1 + 32)) {
          break;
        }

        if (v3 == (id)++v4) {
          return;
        }
      }
      id v7 = [*(id *)(a1 + 40) listeners];
      [v7 removeObjectAtIndex:v4];
    }
  }
}

id sub_5E9F4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate:*(void *)(a1 + 40)];
}

void sub_5EB08(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v39;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v39 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v38 + 1) + 8 * (void)v10);
        id v12 = [[BKLibraryPriceManagerAsset alloc] initWithType:0 storeID:v11];
        id v13 = [*(id *)(a1 + 32) allStoreAssets];
        [v13 setObject:v12 forKeyedSubscript:v11];

        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v5 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v8);
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v14 = v6;
  id v15 = [v14 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v35;
    do
    {
      long long v18 = 0;
      do
      {
        if (*(void *)v35 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v34 + 1) + 8 * (void)v18);
        id v20 = [[BKLibraryPriceManagerAsset alloc] initWithType:1 storeID:v19];
        long long v21 = [*(id *)(a1 + 32) allStoreAssets];
        [v21 setObject:v20 forKeyedSubscript:v19];

        long long v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v16);
  }

  long long v22 = [*(id *)(a1 + 32) allStoreAssets];
  long long v23 = [*(id *)(a1 + 32) seriesAssets];
  [v22 addEntriesFromDictionary:v23];

  [*(id *)(a1 + 32) setGenerationCount:((char *)[*(id *)(a1 + 32) generationCount]) + 1];
  id v24 = +[NSDate dateWithTimeIntervalSinceNow:900.0];
  [*(id *)(a1 + 32) setExpirationDate:v24];

  long long v25 = [*(id *)(a1 + 32) dispatchQueue];
  id v28 = _NSConcreteStackBlock;
  uint64_t v29 = 3221225472;
  id v30 = sub_5EE20;
  long long v31 = &unk_D1548;
  long long v26 = *(void **)(a1 + 40);
  uint64_t v32 = *(void *)(a1 + 32);
  id v33 = v26;
  dispatch_async(v25, &v28);

  long long v27 = [*(id *)(a1 + 32) dispatchQueue:v28, v29, v30, v31, v32];
  dispatch_resume(v27);
}

void sub_5EE20(uint64_t a1)
{
  [*(id *)(a1 + 32) _notifyListeners:0];
  id v2 = (void (**)(void))objc_retainBlock(*(id *)(a1 + 40));
  if (v2)
  {
    id v3 = v2;
    v2[2]();
    id v2 = v3;
  }
}

void sub_5F16C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) generationCount] == *(id *)(a1 + 40))
  {
    id v7 = [*(id *)(a1 + 32) dispatchQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_5F254;
    block[3] = &unk_D1A38;
    id v11 = v6;
    id v8 = v5;
    uint64_t v9 = *(void *)(a1 + 32);
    id v12 = v8;
    uint64_t v13 = v9;
    dispatch_async(v7, block);
  }
}

void sub_5F254(uint64_t a1)
{
  id v2 = +[NSMutableDictionary dictionary];
  if (*(void *)(a1 + 32) || ![*(id *)(a1 + 40) count])
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    [*(id *)(a1 + 48) allStoreAssets];
    id v4 = [v3 countByEnumeratingWithState:&v27 objects:v39 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v28;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v28 != v6) {
            objc_enumerationMutation(v3);
          }
          [v2 setValue:&stru_D4160 forKey:*(void *)(*((void *)&v27 + 1) + 8 * i)];
        }
        id v5 = [v3 countByEnumeratingWithState:&v27 objects:v39 count:16];
      }
      while (v5);
    }
  }
  else
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v8 = [*(id *)(a1 + 40) allValues];
    id v9 = [v8 countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v36;
      do
      {
        for (j = 0; j != v10; j = (char *)j + 1)
        {
          if (*(void *)v36 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v35 + 1) + 8 * (void)j);
          id v14 = [v13 id];
          id v15 = [v13 priceFormatted];
          id v16 = v15;
          if (v15)
          {
            id v17 = v15;
          }
          else
          {
            id v17 = +[BCMAssetWrapper actionTextForType:0 withAsset:v13];
          }
          long long v18 = v17;

          if (v14) {
            BOOL v19 = v18 == 0;
          }
          else {
            BOOL v19 = 1;
          }
          if (!v19) {
            [v2 setValue:v18 forKey:v14];
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v35 objects:v41 count:16];
      }
      while (v10);
    }

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v3 = [*(id *)(a1 + 48) allStoreAssets];
    id v20 = [v3 countByEnumeratingWithState:&v31 objects:v40 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v32;
      do
      {
        for (k = 0; k != v21; k = (char *)k + 1)
        {
          if (*(void *)v32 != v22) {
            objc_enumerationMutation(v3);
          }
          uint64_t v24 = *(void *)(*((void *)&v31 + 1) + 8 * (void)k);
          long long v25 = [v2 objectForKeyedSubscript:v24];

          if (!v25) {
            [v2 setValue:&stru_D4160 forKey:v24];
          }
        }
        id v21 = [v3 countByEnumeratingWithState:&v31 objects:v40 count:16];
      }
      while (v21);
    }
  }

  long long v26 = [*(id *)(a1 + 48) prices];
  [v26 addEntriesFromDictionary:v2];

  [*(id *)(a1 + 48) _notifyListeners:v2];
  [*(id *)(a1 + 48) _callCompletionHandlers:v2];
}

void sub_5FA2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_5FA40(uint64_t a1)
{
  id v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained invalidate:0];

  id v4 = objc_loadWeakRetained(v2);
  id v5 = *(void **)(a1 + 32);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_5FBAC;
  v11[3] = &unk_D3220;
  id v12 = v5;
  id v13 = *(id *)(a1 + 40);
  [v4 fetchPriceForAssetID:v12 completion:v11];

  id v6 = objc_loadWeakRetained(v2);
  id v7 = *(void **)(a1 + 32);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  id v8[2] = sub_5FC4C;
  v8[3] = &unk_D3220;
  id v9 = v7;
  id v10 = *(id *)(a1 + 40);
  [v6 fetchPriceForAssetID:v9 completion:v8];
}

void sub_5FBAC(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5) {
    NSLog(@"-------> 1 Successfully got price for store item:%@, %@", *(void *)(a1 + 32), v5);
  }
  else {
    NSLog(@"-------> 1 Failed to get price for store item:%@", *(void *)(a1 + 32));
  }
  id v7 = objc_retainBlock(*(id *)(a1 + 40));
  id v8 = v7;
  if (v7) {
    (*((void (**)(id))v7 + 2))(v7);
  }
}

void sub_5FC4C(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5) {
    NSLog(@"-------> 2 Successfully got price for store item:%@, %@", *(void *)(a1 + 32), v5);
  }
  else {
    NSLog(@"-------> 2 Failed to get price for store item:%@", *(void *)(a1 + 32));
  }
  id v7 = objc_retainBlock(*(id *)(a1 + 40));
  id v8 = v7;
  if (v7) {
    (*((void (**)(id))v7 + 2))(v7);
  }
}

void sub_5FFE8(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_60094;
  v6[3] = &unk_D1900;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

void sub_60094(uint64_t a1)
{
  id v3 = (void (**)(id, void *))objc_retainBlock(*(id *)(a1 + 40));
  if (v3)
  {
    id v2 = [*(id *)(a1 + 32) image];
    v3[2](v3, v2);
  }
}

void sub_6023C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    id v4 = *(void **)(a1 + 40);
    id v5 = [v3 objectAtIndexedSubscript:0];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    id v8[2] = sub_60334;
    v8[3] = &unk_D3270;
    id v9 = *(id *)(a1 + 32);
    [v4 fetchImageShadowForAsset:v5 size:v8 completion:^(UIImage *image, NSError *error) {
    *(double *)(a1 + 48) = image.size.width;
    *(double *)(a1 + 56) = image.size.height;
}];
  }
  else
  {
    id v6 = objc_retainBlock(*(id *)(a1 + 32));
    id v7 = v6;
    if (v6) {
      (*((void (**)(id, void))v6 + 2))(v6, 0);
    }
  }
}

void sub_60334(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = objc_retainBlock(*(id *)(a1 + 32));
  id v4 = v3;
  if (v3) {
    (*((void (**)(id, id))v3 + 2))(v3, v5);
  }
}

void sub_60480(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_6052C;
  v6[3] = &unk_D1900;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

void sub_6052C(uint64_t a1)
{
  id v2 = objc_retainBlock(*(id *)(a1 + 40));
  if (v2)
  {
    id v3 = v2;
    (*((void (**)(id, void))v2 + 2))(v2, *(void *)(a1 + 32));
    id v2 = v3;
  }
}

void sub_60754(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = (void (**)(id, void *))objc_retainBlock(*(id *)(a1 + 32));
  if (v3)
  {
    id v4 = [v5 image];
    v3[2](v3, v4);
  }
}

void sub_60954(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    id v4 = *(void **)(a1 + 48);
    id v5 = [v3 objectAtIndexedSubscript:0];
    uint64_t v6 = *(unsigned __int8 *)(a1 + 72);
    uint64_t v7 = *(unsigned __int8 *)(a1 + 73);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_60A70;
    v11[3] = &unk_D3270;
    uint64_t v8 = *(void *)(a1 + 32);
    id v12 = *(id *)(a1 + 40);
    [v4 fetchImageForAsset:v5 size:v6 includeSpine:v7 includeShadow:v8 coverEffectsEnvironment:v11 completion:^(UIImage *, NSError *){
    *(double *)(a1 + 56) = *(double *)(a1 + 64);
}];
  }
  else
  {
    id v9 = objc_retainBlock(*(id *)(a1 + 40));
    id v10 = v9;
    if (v9) {
      (*((void (**)(id, void))v9 + 2))(v9, 0);
    }
  }
}

void sub_60A70(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = objc_retainBlock(*(id *)(a1 + 32));
  id v4 = v3;
  if (v3) {
    (*((void (**)(id, id))v3 + 2))(v3, v5);
  }
}

void sub_60D30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_60D58(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_60D68(uint64_t a1)
{
}

void sub_60D70(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = BCImageCacheLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v9 = 138412802;
    id v10 = v3;
    __int16 v11 = 2160;
    uint64_t v12 = 1752392040;
    __int16 v13 = 2112;
    uint64_t v14 = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "BKLibrary+BCCacheManager: Received image %@ for fetchImageForAsset for asset ID %{mask.hash}@", (uint8_t *)&v9, 0x20u);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
  id v8 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_6172C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) libraryManager];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_617F0;
  v6[3] = &unk_D2090;
  id v7 = *(id *)(a1 + 32);
  id v8 = v3;
  id v5 = v3;
  [v4 performBlockOnCollectionsWorkerQueue:v6];
}

id sub_617F0(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _performResetCollectionsInMoc:a2 changeSet:0 completion:*(void *)(a1 + 40)];
}

void sub_61804(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_61A04;
  long long v23 = sub_61A14;
  id v24 = 0;
  id v4 = *(os_unfair_lock_s **)(a1 + 32);
  id v5 = v4 + 2;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  id v15 = sub_61A1C;
  id v16 = &unk_D3310;
  long long v18 = &v19;
  id v17 = v4;
  uint64_t v6 = v14;
  os_unfair_lock_lock_with_options();
  v15((uint64_t)v6);
  os_unfair_lock_unlock(v5);

  if ([(id)v20[5] count])
  {
    id v7 = [*(id *)(a1 + 32) libraryManager];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_61AAC;
    v10[3] = &unk_D3338;
    id v11 = *(id *)(a1 + 32);
    __int16 v13 = &v19;
    id v12 = v3;
    [v7 performBlockOnCollectionsWorkerQueue:v10];

    id v8 = v11;
  }
  else
  {
    id v9 = objc_retainBlock(v3);
    id v8 = v9;
    if (v9) {
      (*((void (**)(id))v9 + 2))(v9);
    }
  }

  _Block_object_dispose(&v19, 8);
}

void sub_619E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_61A04(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_61A14(uint64_t a1)
{
}

void sub_61A1C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) resetCollectionsChangeSet];
  id v3 = [v2 copy];
  uint64_t v4 = a1 + 40;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;

  [*(id *)(a1 + 32) setResetCollectionsChangeSet:0];
  id v7 = BKLibraryLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_92FAC(v4);
  }
}

id sub_61AAC(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _performResetCollectionsInMoc:a2 changeSet:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) completion:*(void *)(a1 + 40)];
}

void sub_61C58(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 40) != *(unsigned __int8 *)(*(void *)(a1 + 32) + 12))
  {
    id v2 = BKLibraryCollectionLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      if (*(unsigned char *)(a1 + 40)) {
        CFStringRef v3 = @"YES";
      }
      else {
        CFStringRef v3 = @"NO";
      }
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v3;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Set enable cloud merge:%{public}@", (uint8_t *)&buf, 0xCu);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 12) = *(unsigned char *)(a1 + 40);
    if (*(unsigned char *)(a1 + 40))
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v22 = 0x3032000000;
      long long v23 = sub_61A04;
      id v24 = sub_61A14;
      id v25 = 0;
      v19[0] = 0;
      v19[1] = v19;
      void v19[2] = 0x3032000000;
      v19[3] = sub_61A04;
      void v19[4] = sub_61A14;
      id v20 = 0;
      uint64_t v4 = dispatch_group_create();
      dispatch_group_enter(v4);
      uint64_t v5 = [*(id *)(a1 + 32) cloudCollectionsManager];
      uint64_t v6 = [v5 collectionDetailManager];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_61FB8;
      v16[3] = &unk_D3360;
      p_long long buf = &buf;
      id v7 = v4;
      id v17 = v7;
      [v6 currentCollectionDetailCloudSyncVersions:v16];

      dispatch_group_enter(v7);
      id v8 = [*(id *)(a1 + 32) cloudCollectionsManager];
      id v9 = [v8 collectionMemberManager];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_62018;
      v13[3] = &unk_D3360;
      id v15 = v19;
      id v10 = v7;
      uint64_t v14 = v10;
      [v9 currentCollectionMemberCloudSyncVersions:v13];

      id v11 = [*(id *)(a1 + 32) enableCloudMergeQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_62078;
      block[3] = &unk_D33B0;
      void block[4] = *(void *)(a1 + 32);
      void block[5] = &buf;
      block[6] = v19;
      dispatch_group_notify(v10, v11, block);

      _Block_object_dispose(v19, 8);
      _Block_object_dispose(&buf, 8);
    }
  }
}

void sub_61F8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_61FB8(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_62018(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_62078(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) libraryManager];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_62110;
  v3[3] = &unk_D3388;
  long long v4 = *(_OWORD *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  [v2 performBlockOnCollectionsWorkerQueue:v3];
}

void sub_62110(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = [*(id *)(a1 + 32) libraryManager];
  uint64_t v5 = [v4 cloudSyncVersionsForDataType:@"BCCollectionDetail" inContext:v3];

  uint64_t v6 = [*(id *)(a1 + 32) libraryManager];
  id v7 = [v6 cloudSyncVersionsForDataType:@"BCCollectionMember" inContext:v3];

  id v8 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) historyToken];
  if (v8 && [v5 localVersion])
  {
    id v9 = [v5 localVersion];
    id v10 = [v5 syncVersion];

    if (v9 == v10) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  id v11 = BKLibraryCollectionLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "BCCollectionDetail cloud is dirty.  Setting all records to cloud", buf, 2u);
  }

  [*(id *)(a1 + 32) mergeCurrentCollectionDetailsToCloudInMoc:v3];
LABEL_9:
  if (([v3 hasChanges] & 1) == 0)
  {
    id v12 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) historyToken];
    if (v12 && [v7 localVersion])
    {
      id v13 = [v7 localVersion];
      id v14 = [v7 syncVersion];

      if (v13 == v14) {
        goto LABEL_18;
      }
    }
    else
    {
    }
  }
  id v15 = BKLibraryCollectionLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v16 = 0;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "BCCollectionMember cloud is dirty.  Setting all records to cloud", v16, 2u);
  }

  [*(id *)(a1 + 32) mergeCurrentCollectionMembersToCloudInMoc:v3];
LABEL_18:
  [*(id *)(a1 + 32) _checkForChangesFromCloudCollectionDetailManagerInMOC:v3 reason:@"enableCloudMerge"];
  [*(id *)(a1 + 32) _checkForChangesFromCloudCollectionMemberManagerInMOC:v3 reason:@"enableCloudMerge"];
}

void sub_62BB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  objc_destroyWeak(v18);
  _Block_object_dispose(&a18, 8);
  objc_destroyWeak((id *)(v19 - 56));
  _Unwind_Resume(a1);
}

void sub_62BE0(uint64_t a1, void *a2)
{
  id v3 = a2;
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_62CC4;
  activity_block[3] = &unk_D33D8;
  objc_copyWeak(&v11, (id *)(a1 + 56));
  long long v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 48);
  activity_void block[4] = v5;
  id v8 = v4;
  id v9 = v3;
  id v6 = v3;
  _os_activity_initiate(&dword_0, "Fetch Default Books Collection", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  objc_destroyWeak(&v11);
}

void sub_62CC4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    id v10 = 0;
    uint64_t v6 = [v3 mutableCollectionWithCollectionID:v4 inManagedObjectContext:v5 error:&v10];
    id v7 = v10;
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v6;
  }
}

void sub_6395C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_63974(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_63A44;
  v7[3] = &unk_D3428;
  id v8 = *(id *)(a1 + 32);
  id v9 = v3;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v10 = v4;
  uint64_t v11 = v5;
  id v6 = v3;
  _os_activity_initiate(&dword_0, "Insert New Collection", OS_ACTIVITY_FLAG_DEFAULT, v7);
}

void sub_63A44(uint64_t a1)
{
  id v2 = +[BKCollection insertNewCollectionWithCollectionID:*(void *)(a1 + 32) inManagedObjectContext:*(void *)(a1 + 40)];
  id v3 = objc_retainBlock(*(id *)(a1 + 48));
  id v4 = v3;
  if (v3) {
    (*((void (**)(id, void *))v3 + 2))(v3, v2);
  }

  [v2 setLocalModDate:0];
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v2;
}

void sub_63EA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_63EC0(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = (void *)a1[5];
  id v5 = a2;
  id v6 = [v4 collectionID];
  LOBYTE(v3) = [v3 deleteCollectionWithCollectionID:v6 inManagedObjectContext:v5 error:0];

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = (_BYTE)v3;
}

void sub_63FF8(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = BKLibraryCollectionLog();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Removed %@ from Want to Read.", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_93098();
  }
}

void sub_641C8(id *a1, void *a2)
{
  id v3 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = a1[4];
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;
          uint64_t v11 = [a1[5] libraryMutableAssetWithAssetID:v10 inManagedObjectContext:v3];
          if (([v11 isContainer] & 1) == 0)
          {
            v19[0] = @"BKLibraryAssetMarkedLocation";
            v19[1] = @"BKLibraryAssetIDKey";
            v20[0] = BALocationTypeFromAddToFinishCollection;
            v20[1] = v10;
            id v12 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
            [v11 setFinishedStateUserSetsFinished:0 userInfo:v12];
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v6);
  }

  id v13 = objc_retainBlock(a1[6]);
  id v14 = v13;
  if (v13) {
    (*((void (**)(id, uint64_t, void))v13 + 2))(v13, 1, 0);
  }
}

void sub_64540(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) libraryManager];
  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) collectionOnMainQueueWithCollectionID:*(void *)(a1 + 40) error:0];
    if ([*(id *)(a1 + 40) isEqualToString:kBKCollectionDefaultIDFinished])
    {
      [*(id *)(a1 + 32) markAssetsAsFinished:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
      goto LABEL_12;
    }
    if ([*(id *)(a1 + 40) isEqualToString:kBKCollectionDefaultIDWantToRead])
    {
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_647D0;
      v22[3] = &unk_D34A0;
      id v23 = v2;
      id v24 = *(id *)(a1 + 48);
      id v5 = *(id *)(a1 + 56);
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void **)(a1 + 40);
      id v25 = v5;
      uint64_t v26 = v6;
      id v27 = v7;
      char v29 = *(unsigned char *)(a1 + 72);
      id v28 = *(id *)(a1 + 64);
      [v23 performBlockOnCollectionsWorkerQueue:v22];

      id v8 = v23;
LABEL_11:

      goto LABEL_12;
    }
    if (![v3 isDefaultCollection]
      || [v3 allowsManualAddition])
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      void v14[2] = sub_64AA0;
      v14[3] = &unk_D34A0;
      id v15 = v2;
      id v16 = *(id *)(a1 + 48);
      id v9 = *(id *)(a1 + 56);
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void **)(a1 + 40);
      id v17 = v9;
      uint64_t v18 = v10;
      id v19 = v11;
      char v21 = *(unsigned char *)(a1 + 72);
      id v20 = *(id *)(a1 + 64);
      [v15 performBlockOnCollectionsWorkerQueue:v14];

      id v8 = v15;
      goto LABEL_11;
    }
    id v12 = objc_retainBlock(*(id *)(a1 + 64));
    id v13 = v12;
    if (v12) {
      (*((void (**)(id, void, void))v12 + 2))(v12, 0, 0);
    }
  }
  else
  {
    id v4 = objc_retainBlock(*(id *)(a1 + 64));
    id v3 = v4;
    if (v4) {
      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    }
  }
LABEL_12:
}

void sub_647D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) libraryAssetsWithAssetIDsContainedInList:*(void *)(a1 + 40) tempAssetIDs:*(void *)(a1 + 48) inManagedObjectContext:v3];
  id v5 = +[NSMutableArray array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v34;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        if (([v11 isContainer] & 1) == 0) {
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v8);
  }

  id v12 = *(void **)(a1 + 56);
  uint64_t v13 = *(void *)(a1 + 64);
  id v32 = 0;
  id v14 = [v12 mutableCollectionWithCollectionID:v13 inManagedObjectContext:v3 error:&v32];
  id v26 = v32;
  id v27 = v3;
  [v14 addLibraryAssets:v5 hideAssets:0 inManagedObjectContext:v3 forceToTop:*(unsigned __int8 *)(a1 + 80)];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v15 = v5;
  id v16 = [v15 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v29;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v29 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = *(void **)(*((void *)&v28 + 1) + 8 * (void)j);
        if ([*(id *)(a1 + 56) allowsAutoDownloadOfSamplesToWantToRead]
          && [v20 isValid])
        {
          char v21 = [v20 storeID];
          if (v21
            && ([v20 isOwned] & 1) == 0
            && ([v20 isLocal] & 1) == 0)
          {
            unsigned __int8 v22 = [v20 isDownloading];

            if (v22) {
              continue;
            }
            id v23 = *(void **)(a1 + 56);
            char v21 = [v20 storeID];
            [v23 p_downloadSampleBook:v21];
          }
        }
      }
      id v17 = [v15 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v17);
  }

  id v24 = objc_retainBlock(*(id *)(a1 + 72));
  id v25 = v24;
  if (v24) {
    (*((void (**)(id, BOOL, id))v24 + 2))(v24, v14 != 0, v26);
  }
}

void sub_64AA0(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = a2;
  id v7 = [v3 libraryAssetsWithAssetIDsContainedInList:v4 tempAssetIDs:v5 inManagedObjectContext:v6];
  id v8 = *(void **)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 64);
  id v14 = 0;
  uint64_t v10 = [v8 mutableCollectionWithCollectionID:v9 inManagedObjectContext:v6 error:&v14];
  id v11 = v14;
  [v10 addLibraryAssets:v7 hideAssets:0 inManagedObjectContext:v6 forceToTop:*(unsigned __int8 *)(a1 + 80)];

  id v12 = objc_retainBlock(*(id *)(a1 + 72));
  uint64_t v13 = v12;
  if (v12) {
    (*((void (**)(id, BOOL, id))v12 + 2))(v12, v10 != 0, v11);
  }
}

void sub_64C74(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id v5 = objc_retainBlock(*(id *)(a1 + 32));
  id v6 = v5;
  if (v5) {
    (*((void (**)(id, BOOL, id))v5 + 2))(v5, a2 != 0, v7);
  }
}

void sub_64EC4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[NSFetchRequest fetchRequestWithEntityName:@"BKCollectionMember"];
  id v5 = +[NSPredicate predicateWithFormat:@"collection.collectionID == %@ AND %K == %@", *(void *)(a1 + 32), @"assetID", *(void *)(a1 + 40)];
  [v4 setPredicate:v5];

  [v4 setFetchBatchSize:32];
  id v6 = [v3 executeFetchRequest:v4 error:0];
  if ([v6 count])
  {
    id v7 = [*(id *)(a1 + 48) libraryManager];
    id v8 = [v7 libraryAssetWithAssetID:*(void *)(a1 + 40) inManagedObjectContext:v3];

    uint64_t v9 = *(void **)(a1 + 48);
    uint64_t v10 = +[NSSet setWithObject:*(void *)(a1 + 32)];
    unsigned int v31 = [v9 p_shouldDeleteAsset:v8 removingFromCollectionIDs:v10];
  }
  else
  {
    id v8 = 0;
    unsigned int v31 = 0;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v11 = v6;
  id v12 = [v11 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v36;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v36 != v14) {
          objc_enumerationMutation(v11);
        }
        [v3 deleteObject:*(void *)(*((void *)&v35 + 1) + 8 * (void)v15)];
        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v13);
  }

  [v8 contentType];
  uint64_t v16 = BCAssetContentTypeFromBKAssetContentType();
  id v17 = *(void **)(a1 + 48);
  uint64_t v18 = *(void *)(a1 + 32);
  id v34 = 0;
  id v19 = [v17 mutableCollectionWithCollectionID:v18 inManagedObjectContext:v3 error:&v34];
  id v30 = v34;
  id v20 = [BKCollectionControllerMemberManagingModifyResponse alloc];
  char v21 = [v8 assetID];
  unsigned __int8 v22 = [v19 title];
  id v23 = [(BKCollectionControllerMemberManagingModifyResponse *)v20 initWithAssetID:v21 assetContentType:v16 collectionTitle:v22];

  unsigned int v24 = v31;
  if (!v8) {
    unsigned int v24 = 0;
  }
  if (v24 == 1)
  {
    id v25 = *(void **)(a1 + 56);
    long long v39 = v8;
    id v26 = +[NSArray arrayWithObjects:&v39 count:1];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_6523C;
    v32[3] = &unk_D1900;
    id v27 = *(id *)(a1 + 64);
    v32[4] = v23;
    id v33 = v27;
    [v25 deleteAssets:v26 exhaustive:0 completion:v32];

    long long v28 = v33;
  }
  else
  {
    id v29 = objc_retainBlock(*(id *)(a1 + 64));
    long long v28 = v29;
    if (v29) {
      (*((void (**)(id, BKCollectionControllerMemberManagingModifyResponse *, void))v29 + 2))(v29, v23, 0);
    }
  }
}

void sub_6523C(uint64_t a1)
{
  id v2 = objc_retainBlock(*(id *)(a1 + 40));
  if (v2)
  {
    id v3 = v2;
    (*((void (**)(id, void, void))v2 + 2))(v2, *(void *)(a1 + 32), 0);
    id v2 = v3;
  }
}

void sub_65434(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  if (a2)
  {
    id v7 = 0;
  }
  else
  {
    id v8 = BKLibraryCollectionLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_93100();
    }

    id v7 = [v6 copy];
  }
  id v9 = objc_retainBlock(*(id *)(a1 + 40));
  uint64_t v10 = v9;
  if (v9) {
    (*((void (**)(id, uint64_t, id))v9 + 2))(v9, a2, v7);
  }
}

void sub_654E0(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_65584;
  v3[3] = &unk_D18D8;
  id v4 = v2;
  id v5 = *(id *)(a1 + 40);
  [v4 performBlockOnWorkerQueue:v3];
}

void sub_65584(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) libraryMutableAssetWithAssetID:*(void *)(a1 + 40) inManagedObjectContext:a2];
  [v2 setFinishedStateUserSetsFinished:0 userInfo:0];
}

void sub_656D0(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id v5 = objc_retainBlock(*(id *)(a1 + 32));
  id v6 = v5;
  if (v5) {
    (*((void (**)(id, BOOL, id))v5 + 2))(v5, a2 != 0, v7);
  }
}

void sub_65A1C(uint64_t a1, int a2, void *a3)
{
  id v9 = a3;
  if (a2)
  {
    id v5 = [[BKCollectionControllerMemberManagingModifyResponse alloc] initWithAssetID:&stru_D4160 assetContentType:0 collectionTitle:&stru_D4160];
    id v6 = objc_retainBlock(*(id *)(a1 + 32));
    id v7 = v6;
    if (v6) {
      (*((void (**)(id, BKCollectionControllerMemberManagingModifyResponse *, id))v6 + 2))(v6, v5, v9);
    }
  }
  else
  {
    id v8 = (BKCollectionControllerMemberManagingModifyResponse *)objc_retainBlock(*(id *)(a1 + 32));
    id v5 = v8;
    if (v8) {
      (*(void (**)(BKCollectionControllerMemberManagingModifyResponse *, void, id))&v8->assetID[8])(v8, 0, v9);
    }
  }
}

void sub_65AE8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void **)(a1 + 32);
  id v32 = 0;
  id v6 = [v5 mutableCollectionWithCollectionID:v4 inManagedObjectContext:v3 error:&v32];
  id v7 = v32;
  if ([v6 allowsManualAddition])
  {
    char v8 = 0;
    if (!v6) {
      goto LABEL_12;
    }
  }
  else
  {
    char v8 = [*(id *)(a1 + 40) isEqualToString:kBKCollectionDefaultIDSamples] ^ 1;
    if (!v6) {
      goto LABEL_12;
    }
  }
  if ((v8 & 1) == 0 && *(void *)(a1 + 48) && !v7)
  {
    id v9 = [*(id *)(a1 + 32) libraryManager];
    uint64_t v10 = [v9 libraryAssetWithAssetID:*(void *)(a1 + 48) inManagedObjectContext:v3];

    [v10 contentType];
    uint64_t v11 = BCAssetContentTypeFromBKAssetContentType();
    id v12 = [BKCollectionControllerMemberManagingModifyResponse alloc];
    id v13 = [v10 assetID];
    uint64_t v14 = [v6 title];
    id v15 = [(BKCollectionControllerMemberManagingModifyResponse *)v12 initWithAssetID:v13 assetContentType:v11 collectionTitle:v14];

    if ([v10 isValid])
    {
      id v16 = [v6 addCollectionMemberAvoidingDupesWithAssetID:*(void *)(a1 + 48) sortKey:0 forceToTop:*(unsigned __int8 *)(a1 + 64)];
      if (([v10 isOwned] & 1) != 0
        || ([v10 isLocal] & 1) != 0)
      {
        unsigned __int8 v17 = 1;
      }
      else
      {
        unsigned __int8 v17 = [v10 isDownloading];
      }
      if ([*(id *)(a1 + 32) allowsAutoDownloadOfSamplesToWantToRead]
        && (v17 & 1) == 0
        && *(unsigned char *)(a1 + 65))
      {
        [*(id *)(a1 + 32) p_downloadSampleBook:*(void *)(a1 + 48)];
      }
      id v23 = objc_retainBlock(*(id *)(a1 + 56));
      id v19 = v23;
      if (v23) {
        (*((void (**)(id, BKCollectionControllerMemberManagingModifyResponse *, void))v23 + 2))(v23, v15, 0);
      }
    }
    else
    {
      id v19 = [objc_alloc((Class)BCMutableStoreItem) initWithStoreID:*(void *)(a1 + 48)];
      id v20 = +[BCCloudAssetManager sharedManager];
      char v21 = [v20 storeAssetManager];

      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_65E30;
      v24[3] = &unk_D35B8;
      long long v25 = *(_OWORD *)(a1 + 32);
      uint64_t v26 = *(void *)(a1 + 48);
      char v30 = *(unsigned char *)(a1 + 64);
      id v27 = v10;
      char v31 = *(unsigned char *)(a1 + 65);
      id v22 = *(id *)(a1 + 56);
      long long v28 = v15;
      id v29 = v22;
      [v21 addStoreItem:v19 completion:v24];
    }
    goto LABEL_25;
  }
LABEL_12:
  uint64_t v18 = BKLibraryCollectionLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    sub_9316C((void *)(a1 + 40), a1, v18);
  }

  uint64_t v10 = (void (**)(void, void, void))objc_retainBlock(*(id *)(a1 + 56));
  if (v10)
  {
    id v15 = (BKCollectionControllerMemberManagingModifyResponse *)[v7 copy];
    ((void (**)(void, void, BKCollectionControllerMemberManagingModifyResponse *))v10)[2](v10, 0, v15);
LABEL_25:
  }
}

void sub_65E30(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  if (a2)
  {
    id v7 = [*(id *)(a1 + 32) libraryManager];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    void v19[2] = sub_65F8C;
    v19[3] = &unk_D3590;
    long long v20 = *(_OWORD *)(a1 + 32);
    char v8 = *(void **)(a1 + 56);
    uint64_t v21 = *(void *)(a1 + 48);
    char v25 = *(unsigned char *)(a1 + 80);
    id v22 = v8;
    char v26 = *(unsigned char *)(a1 + 81);
    id v9 = *(id *)(a1 + 72);
    uint64_t v23 = *(void *)(a1 + 64);
    id v24 = v9;
    [v7 performBlockOnCollectionsWorkerQueue:v19];
  }
  else
  {
    uint64_t v10 = BKLibraryCollectionLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_931EC(a1, v10, v11, v12, v13, v14, v15, v16);
    }

    unsigned __int8 v17 = (void (**)(id, void, id))objc_retainBlock(*(id *)(a1 + 72));
    if (v17)
    {
      id v18 = [v6 copy];
      v17[2](v17, 0, v18);
    }
  }
}

void sub_65F8C(uint64_t a1, uint64_t a2)
{
  id v7 = [*(id *)(a1 + 32) mutableCollectionWithCollectionID:*(void *)(a1 + 40) inManagedObjectContext:a2 error:0];
  id v3 = [v7 addCollectionMemberAvoidingDupesWithAssetID:*(void *)(a1 + 48) sortKey:0 forceToTop:*(unsigned __int8 *)(a1 + 80)];
  if (([*(id *)(a1 + 56) isOwned] & 1) != 0
    || ([*(id *)(a1 + 56) isLocal] & 1) != 0)
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    unsigned __int8 v4 = [*(id *)(a1 + 56) isDownloading];
  }
  if ([*(id *)(a1 + 32) allowsAutoDownloadOfSamplesToWantToRead]
    && (v4 & 1) == 0
    && *(unsigned char *)(a1 + 81))
  {
    [*(id *)(a1 + 32) p_downloadSampleBook:*(void *)(a1 + 48)];
  }
  id v5 = objc_retainBlock(*(id *)(a1 + 72));
  id v6 = v5;
  if (v5) {
    (*((void (**)(id, void, void))v5 + 2))(v5, *(void *)(a1 + 64), 0);
  }
}

void sub_66224(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    id v9 = +[BULogUtilities shared];
    unsigned int v10 = [v9 verboseLoggingEnabled];

    if (v10)
    {
      uint64_t v11 = BKLibraryCollectionDevelopmentLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 40);
        *(_DWORD *)long long buf = 138412546;
        uint64_t v34 = v12;
        __int16 v35 = 2112;
        id v36 = v8;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "\"\\\"sample download failed for storeID: %@, error: %@\\\"\"", buf, 0x16u);
      }
LABEL_19:
    }
  }
  else if ([v6 count])
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v11 = [v6 allValues];
    id v13 = [v11 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v13)
    {
      id v14 = v13;
      id v24 = v7;
      id v25 = v6;
      uint64_t v15 = *(void *)v30;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v30 != v15) {
            objc_enumerationMutation(v11);
          }
          unsigned __int8 v17 = [*(id *)(*((void *)&v29 + 1) + 8 * i) bookSampleDownloadURL];
          if (v17)
          {
            uint64_t v18 = [*(id *)(a1 + 32) uiManagerProviderForAddingToWantToRead];
            id v19 = (void *)v18;
            if (v18)
            {
              long long v20 = (*(void (**)(uint64_t))(v18 + 16))(v18);
            }
            else
            {
              long long v20 = 0;
            }
            id v21 = objc_alloc((Class)BLDownloadManifestRequest);
            id v22 = +[NSURLRequest requestWithURL:v17];
            id v23 = [v21 initWithURLRequest:v22];

            v27[0] = _NSConcreteStackBlock;
            v27[1] = 3221225472;
            v27[2] = sub_664FC;
            v27[3] = &unk_D3608;
            id v28 = v17;
            [v23 startWithUIManager:v20 manifestResponseBlock:v27];
          }
        }
        id v14 = [v11 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v14);
      id v7 = v24;
      id v6 = v25;
    }
    goto LABEL_19;
  }
}

void sub_664FC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 validDownloadIDs];
  id v7 = [v6 firstObject];

  id v8 = +[BULogUtilities shared];
  unsigned int v9 = [v8 verboseLoggingEnabled];

  if (v5 || !v7)
  {
    if (v9)
    {
      unsigned int v10 = BKLibraryCollectionDevelopmentLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = *(void *)(a1 + 32);
        int v16 = 138412546;
        uint64_t v17 = v15;
        __int16 v18 = 2112;
        id v19 = v5;
        uint64_t v12 = "\"\\\"sample download failed for URL: %@, error: %@\\\"\"";
        id v13 = v10;
        uint32_t v14 = 22;
        goto LABEL_9;
      }
LABEL_10:
    }
  }
  else if (v9)
  {
    unsigned int v10 = BKLibraryCollectionDevelopmentLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v16 = 138412290;
      uint64_t v17 = v11;
      uint64_t v12 = "\"\\\"sample download started for URL: %@\\\"\"";
      id v13 = v10;
      uint32_t v14 = 12;
LABEL_9:
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v16, v14);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
}

void sub_6683C(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = [*(id *)(a1 + 32) p_shouldDeleteAsset:*(void *)(a1 + 40) removingFromCollectionIDs:*(void *)(a1 + 48)];
  id v5 = +[NSFetchRequest fetchRequestWithEntityName:@"BKCollectionMember"];
  id v6 = +[NSPredicate predicateWithFormat:@"collection.collectionID IN %@ AND assetID == %@", *(void *)(a1 + 48), *(void *)(a1 + 56)];
  [v5 setPredicate:v6];

  [v5 setFetchBatchSize:32];
  id v28 = 0;
  id v7 = [v3 executeFetchRequest:v5 error:&v28];
  id v8 = v28;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v25;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        [v3 deleteObject:*(void *)(*((void *)&v24 + 1) + 8 * (void)v13)];
        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v11);
  }

  if ([v9 count]) {
    BOOL v14 = v8 == 0;
  }
  else {
    BOOL v14 = 0;
  }
  uint64_t v15 = v14;
  if (v4)
  {
    int v16 = *(void **)(a1 + 64);
    uint64_t v29 = *(void *)(a1 + 40);
    uint64_t v17 = +[NSArray arrayWithObjects:&v29 count:1];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    void v20[2] = sub_66AD8;
    v20[3] = &unk_D3658;
    id v22 = *(id *)(a1 + 72);
    char v23 = v15;
    id v21 = v8;
    [v16 deleteAssets:v17 exhaustive:0 completion:v20];

    __int16 v18 = v22;
  }
  else
  {
    id v19 = objc_retainBlock(*(id *)(a1 + 72));
    __int16 v18 = v19;
    if (v19) {
      (*((void (**)(id, uint64_t, id))v19 + 2))(v19, v15, v8);
    }
  }
}

void sub_66AD8(uint64_t a1)
{
  id v2 = objc_retainBlock(*(id *)(a1 + 40));
  if (v2)
  {
    id v3 = v2;
    (*((void (**)(id, void, void))v2 + 2))(v2, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
    id v2 = v3;
  }
}

void sub_66CD4(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = +[NSSet setWithObject:*(void *)(a1 + 48)];
  id v7 = [v4 p_assetsRequiringDeletion:v5 removingFromCollectionIDs:v6];

  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 48);
  id v32 = 0;
  id v10 = [v8 mutableCollectionWithCollectionID:v9 inManagedObjectContext:v3 error:&v32];
  id v11 = v32;
  uint64_t v12 = +[NSFetchRequest fetchRequestWithEntityName:@"BKCollectionMember"];
  id v13 = +[NSPredicate predicateWithFormat:@"collection == %@ AND assetID IN %@", v10, *(void *)(a1 + 56)];
  [v12 setPredicate:v13];

  [v12 setFetchBatchSize:32];
  BOOL v14 = [v3 executeFetchRequest:v12 error:0];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v15 = [v14 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v29;
    do
    {
      __int16 v18 = 0;
      do
      {
        if (*(void *)v29 != v17) {
          objc_enumerationMutation(v14);
        }
        [v3 deleteObject:*(void *)(*((void *)&v28 + 1) + 8 * (void)v18)];
        __int16 v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v16);
  }
  if ([v14 count]) {
    BOOL v19 = v11 == 0;
  }
  else {
    BOOL v19 = 0;
  }
  uint64_t v20 = v19;
  if ([v7 count])
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_66F8C;
    v24[3] = &unk_D3658;
    id v21 = *(void **)(a1 + 64);
    id v26 = *(id *)(a1 + 72);
    char v27 = v20;
    id v25 = v11;
    [v21 deleteAssets:v7 exhaustive:0 completion:v24];

    id v22 = v26;
  }
  else
  {
    id v23 = objc_retainBlock(*(id *)(a1 + 72));
    id v22 = v23;
    if (v23) {
      (*((void (**)(id, uint64_t, id))v23 + 2))(v23, v20, v11);
    }
  }
}

void sub_66F8C(uint64_t a1)
{
  id v2 = objc_retainBlock(*(id *)(a1 + 40));
  if (v2)
  {
    id v3 = v2;
    (*((void (**)(id, void, void))v2 + 2))(v2, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
    id v2 = v3;
  }
}

void sub_67034(id a1, BKLibraryManagedObjectContext *a2)
{
}

void sub_67C94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
}

void sub_67CC4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 libraryManager];
  id v6 = [v5 cloudSyncVersionsForDataType:@"BCCollectionDetail" inContext:v4];

  [v6 setLocalVersion:[v6 localVersion] + 1];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v6 localVersion];
}

void sub_67D6C(uint64_t a1, int a2, int a3, void *a4)
{
  id v7 = a4;
  if (!a2)
  {
    id v10 = BKLibraryCollectionLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_9325C();
    }
    goto LABEL_12;
  }
  id v8 = +[BULogUtilities shared];
  unsigned int v9 = [v8 verboseLoggingEnabled];

  if (a3)
  {
    if (v9)
    {
      id v10 = BKLibraryCollectionDevelopmentLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        int v14 = 138543362;
        uint64_t v15 = v11;
        uint64_t v12 = "\"\\\"collectionDetailManager succesfully set collectionDetails for collectionIDs: %{public}@\\\"\"";
LABEL_11:
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v14, 0xCu);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
  }
  else if (v9)
  {
    id v10 = BKLibraryCollectionDevelopmentLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      int v14 = 138543362;
      uint64_t v15 = v13;
      uint64_t v12 = "\"\\\"collectionDetailManager succesfully set collectionDetails, but no changes for collectionIDs: %{public}@\\\"\"";
      goto LABEL_11;
    }
LABEL_12:
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_67EDC(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = BKLibraryCollectionLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v13 = 138543362;
      uint64_t v14 = v8;
      unsigned int v9 = "collectionDetailManager succesfully deleted collectionIDs: %{public}@";
      id v10 = v6;
      uint32_t v11 = 12;
LABEL_6:
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v13, v11);
    }
  }
  else if (v7)
  {
    uint64_t v12 = *(void *)(a1 + 32);
    int v13 = 138543618;
    uint64_t v14 = v12;
    __int16 v15 = 2112;
    id v16 = v5;
    unsigned int v9 = "collectionDetailManager warning deleting collectionIDs: %{public}@ error:%@";
    id v10 = v6;
    uint32_t v11 = 22;
    goto LABEL_6;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_67FF0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) libraryManager];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_68080;
  v3[3] = &unk_D36E8;
  long long v4 = *(_OWORD *)(a1 + 32);
  [v2 performBlockOnCollectionsWorkerQueue:v3];
}

void sub_68080(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setSessionContextType:1];
  long long v4 = [*(id *)(a1 + 32) libraryManager];
  id v5 = [v4 cloudSyncVersionsForDataType:@"BCCollectionDetail" inContext:v3];

  [v5 setSyncVersion:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
}

void sub_687D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

void sub_68804(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 libraryManager];
  id v6 = [v5 cloudSyncVersionsForDataType:@"BCCollectionMember" inContext:v4];

  [v6 setLocalVersion:[v6 localVersion] + 1];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v6 localVersion];
}

void sub_688AC(uint64_t a1, int a2, int a3, void *a4)
{
  id v7 = a4;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  if (!a2)
  {
    id v10 = BKLibraryCollectionLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_932C4();
    }
    goto LABEL_12;
  }
  uint64_t v8 = +[BULogUtilities shared];
  unsigned int v9 = [v8 verboseLoggingEnabled];

  if (a3)
  {
    if (v9)
    {
      id v10 = BKLibraryCollectionDevelopmentLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 40);
        int v14 = 138412290;
        uint64_t v15 = v11;
        uint64_t v12 = "\"\\\"collectionMemberManager succesfully set collectionMember memberIDs: %@\\\"\"";
LABEL_11:
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v14, 0xCu);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
  }
  else if (v9)
  {
    id v10 = BKLibraryCollectionDevelopmentLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 40);
      int v14 = 138412290;
      uint64_t v15 = v13;
      uint64_t v12 = "\"\\\"collectionMemberManager succesfully set, but no changes for collectionMember memberIDs: %@\\\"\"";
      goto LABEL_11;
    }
LABEL_12:
  }
}

void sub_68A1C(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = BKLibraryCollectionLog();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "collectionMemberManager succesfully deleted collectionMember memberIDs: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_93330();
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_68B0C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) libraryManager];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_68B9C;
  v3[3] = &unk_D36E8;
  long long v4 = *(_OWORD *)(a1 + 32);
  [v2 performBlockOnCollectionsWorkerQueue:v3];
}

void sub_68B9C(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setSessionContextType:1];
  long long v4 = [*(id *)(a1 + 32) libraryManager];
  id v5 = [v4 cloudSyncVersionsForDataType:@"BCCollectionMember" inContext:v3];

  [v5 setSyncVersion:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
}

void sub_69274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_692E8(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) enableCloudMerge];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

void sub_693A4(uint64_t a1)
{
  if ([*(id *)(a1 + 32) processingCollectionDetailChanges])
  {
    id v2 = +[BULogUtilities shared];
    unsigned int v3 = [v2 verboseLoggingEnabled];

    if (v3)
    {
      long long v4 = BKLibraryCollectionDevelopmentLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "\"\\\"#collectionDetailChanged BCCloudCollectionDetailManagerChanged notification received, deferring processing\\\"\"", buf, 2u);
      }
    }
    [*(id *)(a1 + 32) setReceivedCollectionDetailChangesNotification:1];
  }
  else
  {
    [*(id *)(a1 + 32) setProcessingCollectionDetailChanges:1];
    id v5 = +[BULogUtilities shared];
    unsigned int v6 = [v5 verboseLoggingEnabled];

    if (v6)
    {
      id v7 = BKLibraryCollectionDevelopmentLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "\"\\\"#collectionDetailChanged BCCloudCollectionDetailManagerChanged notification received, starting processing\\\"\"", buf, 2u);
      }
    }
    uint64_t v8 = [*(id *)(a1 + 32) libraryManager];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_69534;
    v9[3] = &unk_D16B0;
    void v9[4] = *(void *)(a1 + 32);
    [v8 performBackgroundReadOnlyBlock:v9];
  }
}

id sub_69534(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _checkForChangesFromCloudCollectionDetailManagerInMOC:a2 reason:@"BCCloudCollectionDetailManagerChanged"];
}

void sub_696DC(uint64_t a1, void *a2, void *a3, void *a4, void *a5, char a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v30 = 0;
  long long v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  uint64_t v15 = [*(id *)(a1 + 32) enableCloudMergeQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_69948;
  block[3] = &unk_D3310;
  void block[4] = *(void *)(a1 + 32);
  void block[5] = &v30;
  dispatch_sync(v15, block);

  if (v14)
  {
    id v16 = BKLibraryCollectionLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_93420();
    }
  }
  else
  {
    uint64_t v17 = *(void **)(a1 + 32);
    if (*((unsigned char *)v31 + 24))
    {
      __int16 v18 = [v17 libraryManager];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_6997C;
      v23[3] = &unk_D2CF0;
      id v24 = v11;
      id v19 = v13;
      uint64_t v20 = *(void *)(a1 + 32);
      id v25 = v19;
      uint64_t v26 = v20;
      id v27 = v12;
      char v28 = a6;
      [v18 performBlockOnCollectionsWorkerQueue:v23];
    }
    else
    {
      id v21 = [v17 getChangesQueue];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_6A1A8;
      v22[3] = &unk_D1520;
      void v22[4] = *(void *)(a1 + 32);
      dispatch_async(v21, v22);
    }
  }
  _Block_object_dispose(&v30, 8);
}

void sub_6992C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

id sub_69948(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) enableCloudMerge];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

void sub_6997C(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setSessionContextType:1];
  long long v4 = BKLibraryCollectionLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [*(id *)(a1 + 32) count];
    unsigned int v6 = *(void **)(a1 + 40);
    *(_DWORD *)long long buf = 134218242;
    id v64 = v5;
    __int16 v65 = 2112;
    id v66 = v6;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "getCollectionDetailChangesSince #collectionDetailChanged updated %lu records currentSyncVersions:%@", buf, 0x16u);
  }

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v7 = *(id *)(a1 + 32);
  id v8 = [v7 countByEnumeratingWithState:&v57 objects:v62 count:16];
  long long v49 = v3;
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v58;
    *(void *)&long long v9 = 138412290;
    long long v45 = v9;
    id v47 = v7;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v58 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        id v14 = [v13 collectionID:v45];
        if (v14)
        {
          uint64_t v15 = *(void **)(a1 + 48);
          id v56 = 0;
          id v16 = [v15 mutableCollectionWithCollectionID:v14 inManagedObjectContext:v3 error:&v56];
          id v17 = v56;
          if (v17)
          {
            __int16 v18 = BKLibraryCollectionLog();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = v45;
              id v64 = v14;
              _os_log_error_impl(&dword_0, v18, OS_LOG_TYPE_ERROR, "Error retrieving collection for ID:%@", buf, 0xCu);
            }
          }
          else
          {
            if (v16)
            {
              [v16 configureFromCollectionDetail:v13 shouldCompareModificationDate:1];
            }
            else
            {
              id v19 = BKLibraryCollectionLog();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
              {
                uint64_t v20 = [v13 name];
                id v21 = [v13 collectionID];
                *(_DWORD *)long long buf = 138412546;
                id v64 = v20;
                __int16 v65 = 2112;
                id v66 = v21;
                _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "Collection Detail Inserted.  Creating title: %@, collectionID: %@", buf, 0x16u);
              }
              id v22 = [v13 collectionID];
              id v3 = v49;
              id v16 = +[BKCollection insertNewCollectionWithCollectionID:v22 inManagedObjectContext:v49];

              [v16 configureFromCollectionDetail:v13 shouldCompareModificationDate:0];
              id v7 = v47;
            }
            __int16 v18 = [*(id *)(a1 + 48) libraryManager];
            [v18 resetNextCollectionSort];
          }
        }
      }
      id v10 = [v7 countByEnumeratingWithState:&v57 objects:v62 count:16];
    }
    while (v10);
  }

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v23 = *(id *)(a1 + 56);
  id v24 = [v23 countByEnumeratingWithState:&v52 objects:v61 count:16];
  if (v24)
  {
    id v26 = v24;
    uint64_t v27 = *(void *)v53;
    *(void *)&long long v25 = 138412290;
    long long v46 = v25;
    id v48 = v23;
    do
    {
      char v28 = 0;
      do
      {
        if (*(void *)v53 != v27) {
          objc_enumerationMutation(v23);
        }
        long long v29 = [*(id *)(*((void *)&v52 + 1) + 8 * (void)v28) objectForKeyedSubscript:@"collectionID" v46];
        if (v29)
        {
          uint64_t v30 = *(void **)(a1 + 48);
          id v51 = 0;
          long long v31 = [v30 mutableCollectionWithCollectionID:v29 inManagedObjectContext:v49 error:&v51];
          id v32 = v51;
          if (v32)
          {
            char v33 = BKLibraryCollectionLog();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = v46;
              id v64 = v29;
              _os_log_error_impl(&dword_0, v33, OS_LOG_TYPE_ERROR, "Error retrieving collection for ID:%@", buf, 0xCu);
            }
            goto LABEL_30;
          }
          if (v31)
          {
            if ([v31 canDeleteCollection])
            {
              uint64_t v34 = BKLibraryCollectionLog();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
              {
                __int16 v35 = [v31 title];
                id v36 = [v31 collectionID];
                *(_DWORD *)long long buf = 138412546;
                id v64 = v35;
                __int16 v65 = 2112;
                id v66 = v36;
                _os_log_impl(&dword_0, v34, OS_LOG_TYPE_INFO, "Collection Detail removed.  Deleting title:%@ collectionID: %@", buf, 0x16u);

                id v23 = v48;
              }

              [v49 deleteObject:v31];
            }
            else
            {
              long long v37 = +[BULogUtilities shared];
              unsigned int v38 = [v37 verboseLoggingEnabled];

              id v23 = v48;
              if (v38)
              {
                char v33 = BKLibraryCollectionDevelopmentLog();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                {
                  long long v39 = [v31 title];
                  long long v40 = [v31 collectionID];
                  *(_DWORD *)long long buf = 138412546;
                  id v64 = v39;
                  __int16 v65 = 2112;
                  id v66 = v40;
                  _os_log_impl(&dword_0, v33, OS_LOG_TYPE_DEFAULT, "\"\\\"Collection Detail removed.  NOT Deleting default collection title:%@ collectionID: %@\\\"\"", buf, 0x16u);

                  id v23 = v48;
                }
LABEL_30:
              }
            }
          }
        }
        char v28 = (char *)v28 + 1;
      }
      while (v26 != v28);
      id v41 = [v23 countByEnumeratingWithState:&v52 objects:v61 count:16];
      id v26 = v41;
    }
    while (v41);
  }

  __int16 v42 = [*(id *)(a1 + 48) libraryManager];
  [v42 updateCloudVersionFromCloudSyncVersions:*(void *)(a1 + 40) inContext:v49];

  id v43 = *(void **)(a1 + 48);
  if (*(unsigned char *)(a1 + 64))
  {
    [v43 _checkForChangesFromCloudCollectionDetailManagerInMOC:v49 reason:@"fetchAgain"];
  }
  else
  {
    __int16 v44 = [v43 getChangesQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_6A020;
    block[3] = &unk_D1520;
    void block[4] = *(void *)(a1 + 48);
    dispatch_async(v44, block);
  }
  [*(id *)(a1 + 48) setupDefaultCollectionsInManagedObjectContext:v49];
}

void sub_6A020(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) receivedCollectionDetailChangesNotification];
  id v3 = +[BULogUtilities shared];
  unsigned int v4 = [v3 verboseLoggingEnabled];

  if (v2)
  {
    if (v4)
    {
      id v5 = BKLibraryCollectionDevelopmentLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "\"\\\"#collectionDetailChanged completed fetchAgain, processing deferred notification.\\\"\"", buf, 2u);
      }
    }
    [*(id *)(a1 + 32) setReceivedCollectionDetailChangesNotification:0];
    unsigned int v6 = [*(id *)(a1 + 32) libraryManager];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    id v8[2] = sub_6A194;
    v8[3] = &unk_D16B0;
    void v8[4] = *(void *)(a1 + 32);
    [v6 performBackgroundReadOnlyBlock:v8];
  }
  else
  {
    if (v4)
    {
      id v7 = BKLibraryCollectionDevelopmentLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "\"\\\"#collectionDetailChanged completed fetchAgain, NO deferred notification.\\\"\"", buf, 2u);
      }
    }
    [*(id *)(a1 + 32) setProcessingCollectionDetailChanges:0];
  }
}

id sub_6A194(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _checkForChangesFromCloudCollectionDetailManagerInMOC:a2 reason:@"deferred"];
}

id sub_6A1A8(uint64_t a1)
{
  return [*(id *)(a1 + 32) setProcessingCollectionDetailChanges:0];
}

void sub_6A23C(uint64_t a1)
{
  if ([*(id *)(a1 + 32) processingCollectionMemberChanges])
  {
    unsigned int v2 = +[BULogUtilities shared];
    unsigned int v3 = [v2 verboseLoggingEnabled];

    if (v3)
    {
      unsigned int v4 = BKLibraryCollectionDevelopmentLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "\"\\\"#collectionMemberChanged BCCloudCollectionMemberManagerChanged notification received, deferring processing\\\"\"", buf, 2u);
      }
    }
    [*(id *)(a1 + 32) setReceivedCollectionMemberChangesNotification:1];
  }
  else
  {
    [*(id *)(a1 + 32) setProcessingCollectionMemberChanges:1];
    id v5 = +[BULogUtilities shared];
    unsigned int v6 = [v5 verboseLoggingEnabled];

    if (v6)
    {
      id v7 = BKLibraryCollectionDevelopmentLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "\"\\\"#collectionMemberChanged BCCloudCollectionMemberManagerChanged notification received, starting processing\\\"\"", buf, 2u);
      }
    }
    id v8 = [*(id *)(a1 + 32) libraryManager];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_6A3CC;
    v9[3] = &unk_D16B0;
    void v9[4] = *(void *)(a1 + 32);
    [v8 performBackgroundReadOnlyBlock:v9];
  }
}

id sub_6A3CC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _checkForChangesFromCloudCollectionMemberManagerInMOC:a2 reason:@"BCCloudCollectionMemberManagerChanged"];
}

void sub_6A574(uint64_t a1, void *a2, void *a3, void *a4, void *a5, char a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v30 = 0;
  long long v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  uint64_t v15 = [*(id *)(a1 + 32) enableCloudMergeQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6A7E0;
  block[3] = &unk_D3310;
  void block[4] = *(void *)(a1 + 32);
  void block[5] = &v30;
  dispatch_sync(v15, block);

  if (v14)
  {
    id v16 = BKLibraryCollectionLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_93488();
    }
  }
  else
  {
    id v17 = *(void **)(a1 + 32);
    if (*((unsigned char *)v31 + 24))
    {
      __int16 v18 = [v17 libraryManager];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_6A814;
      v23[3] = &unk_D2CF0;
      id v24 = v11;
      id v19 = v13;
      uint64_t v20 = *(void *)(a1 + 32);
      id v25 = v19;
      uint64_t v26 = v20;
      id v27 = v12;
      char v28 = a6;
      [v18 performBlockOnCollectionsWorkerQueue:v23];
    }
    else
    {
      id v21 = [v17 getChangesQueue];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_6B204;
      v22[3] = &unk_D1520;
      void v22[4] = *(void *)(a1 + 32);
      dispatch_async(v21, v22);
    }
  }
  _Block_object_dispose(&v30, 8);
}

void sub_6A7C4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

id sub_6A7E0(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) enableCloudMerge];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

void sub_6A814(uint64_t a1, void *a2)
{
  id v55 = a2;
  [v55 setSessionContextType:1];
  unsigned int v3 = BKLibraryCollectionLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [*(id *)(a1 + 32) count];
    id v5 = *(void **)(a1 + 40);
    *(_DWORD *)long long buf = 134218242;
    id v77 = v4;
    __int16 v78 = 2112;
    double v79 = v5;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "getCollectionMemberChangesSince #collectionMemberChanged updated %lu records currentSyncVersions:%@", buf, 0x16u);
  }

  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v6 = *(id *)(a1 + 32);
  id v7 = &_s10Foundation12NotificationV6objectypSgvg_ptr;
  id v8 = &selRef_setGenre_;
  uint64_t v52 = a1;
  id v60 = [v6 countByEnumeratingWithState:&v70 objects:v75 count:16];
  if (v60)
  {
    uint64_t v58 = *(void *)v71;
    id v51 = v6;
    do
    {
      long long v9 = 0;
      do
      {
        if (*(void *)v71 != v58) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v70 + 1) + 8 * (void)v9);
        id v11 = [v10 collectionMemberID];
        id v12 = +[BCCollectionMember assetIDFromCollectionMemberID:v11];
        uint64_t v13 = +[BCCollectionMember collectionIDFromCollectionMemberID:v11];
        id v14 = (void *)v13;
        if (v12) {
          BOOL v15 = v13 == 0;
        }
        else {
          BOOL v15 = 1;
        }
        if (!v15 && +[BKCollection shouldSyncCollectionID:v13])
        {
          uint64_t v16 = [*(id *)(a1 + 48) p_fetchOrCreatePlaceholderCollectionForCollectionID:v14 moc:v55];
          id v17 = +[NSFetchRequest fetchRequestWithEntityName:@"BKCollectionMember"];
          id v56 = (void *)v16;
          __int16 v18 = +[NSPredicate predicateWithFormat:@"collection == %@ AND assetID == %@", v16, v12];
          [v17 setPredicate:v18];

          id v69 = 0;
          id v19 = [v55 executeFetchRequest:v17 error:&v69];
          id v20 = v69;
          long long v53 = v19;
          if (v20)
          {
            id v21 = BKLibraryCollectionLog();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412546;
              id v77 = v14;
              __int16 v78 = 2112;
              double v79 = v12;
              _os_log_error_impl(&dword_0, v21, OS_LOG_TYPE_ERROR, "Error retrieving collectionMember for collectionID: %@ assetID: %@", buf, 0x16u);
            }
            goto LABEL_18;
          }
          if ([v19 count])
          {
            objc_opt_class();
            id v22 = [v19 lastObject];
            id v21 = BUDynamicCast();

            [v21 configureFromCollectionMember:v10];
            [v56 updateMaxSortKeyWithMember:v21];
            goto LABEL_18;
          }
          if (![v19 count])
          {
            id v23 = BKLibraryCollectionLog();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              id v24 = [v10 collectionMemberID];
              *(_DWORD *)long long buf = 138412290;
              id v77 = v24;
              _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "Collection Member Inserted.  Creating member for collectionMemberID: %@", buf, 0xCu);
            }
            id v21 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v10 sortOrder]);
            id v25 = [v56 addCollectionMemberAvoidingDupesWithAssetID:v12 sortKey:v21 forceToTop:0];
LABEL_18:

            a1 = v52;
            id v7 = &_s10Foundation12NotificationV6objectypSgvg_ptr;
          }

          id v8 = &selRef_setGenre_;
          id v6 = v51;
        }

        long long v9 = (char *)v9 + 1;
      }
      while (v60 != v9);
      id v26 = [v6 countByEnumeratingWithState:&v70 objects:v75 count:16];
      id v60 = v26;
    }
    while (v26);
  }

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v27 = *(id *)(a1 + 56);
  id v28 = [v27 countByEnumeratingWithState:&v65 objects:v74 count:16];
  if (!v28) {
    goto LABEL_55;
  }
  id v29 = v28;
  uint64_t v30 = *(void *)v66;
  uint64_t v59 = *(void *)v66;
  id v61 = v27;
  do
  {
    for (i = 0; i != v29; i = (char *)i + 1)
    {
      if (*(void *)v66 != v30) {
        objc_enumerationMutation(v27);
      }
      uint64_t v32 = [*(id *)(*((void *)&v65 + 1) + 8 * i) objectForKeyedSubscript:@"collectionMemberID"];
      char v33 = [v7[439] assetIDFromCollectionMemberID:v32];
      uint64_t v34 = [v7[439] collectionIDFromCollectionMemberID:v32];
      __int16 v35 = (void *)v34;
      if (v33) {
        BOOL v36 = v34 == 0;
      }
      else {
        BOOL v36 = 1;
      }
      if (!v36 && [v8 + 509 shouldSyncCollectionID:v34])
      {
        long long v37 = *(void **)(v52 + 48);
        id v64 = 0;
        unsigned int v38 = [v37 mutableCollectionWithCollectionID:v35 inManagedObjectContext:v55 error:&v64];
        id v39 = v64;
        if (v39)
        {
          long long v40 = BKLibraryCollectionLog();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            id v77 = v35;
            _os_log_error_impl(&dword_0, v40, OS_LOG_TYPE_ERROR, "Error retrieving collection for collectionID: %@", buf, 0xCu);
          }
          goto LABEL_47;
        }
        long long v40 = +[NSFetchRequest fetchRequestWithEntityName:@"BKCollectionMember"];
        id v41 = +[NSPredicate predicateWithFormat:@"collection == %@ AND assetID == %@", v38, v33];
        [v40 setPredicate:v41];

        id v63 = 0;
        __int16 v42 = [v55 executeFetchRequest:v40 error:&v63];
        id v43 = v63;
        if (v43)
        {
          long long v57 = v42;
          __int16 v44 = BKLibraryCollectionLog();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412546;
            id v77 = v35;
            __int16 v78 = 2112;
            double v79 = v33;
            _os_log_error_impl(&dword_0, v44, OS_LOG_TYPE_ERROR, "Error retrieving collection member for collectionID: %@, assetID: %@", buf, 0x16u);
          }
LABEL_45:

          __int16 v42 = v57;
        }
        else if ([v42 count])
        {
          objc_opt_class();
          long long v57 = v42;
          long long v54 = [v42 lastObject];
          __int16 v44 = BUDynamicCast();

          [v55 deleteObject:v44];
          goto LABEL_45;
        }

LABEL_47:
        id v7 = &_s10Foundation12NotificationV6objectypSgvg_ptr;

        if (!v38)
        {
          long long v45 = +[BULogUtilities shared];
          unsigned int v46 = [v45 verboseLoggingEnabled];

          if (v46)
          {
            id v47 = BKLibraryCollectionDevelopmentLog();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl(&dword_0, v47, OS_LOG_TYPE_DEFAULT, "\"\\\"Attempt to remove collectionMember for a collection that does not exist any more.\\\"\"", buf, 2u);
            }
          }
        }

        id v8 = &selRef_setGenre_;
        uint64_t v30 = v59;
        id v27 = v61;
      }
    }
    id v29 = [v27 countByEnumeratingWithState:&v65 objects:v74 count:16];
  }
  while (v29);
LABEL_55:

  id v48 = [*(id *)(v52 + 48) libraryManager];
  [v48 updateCloudVersionFromCloudSyncVersions:*(void *)(v52 + 40) inContext:v55];

  long long v49 = *(void **)(v52 + 48);
  if (*(unsigned char *)(v52 + 64))
  {
    [v49 _checkForChangesFromCloudCollectionMemberManagerInMOC:v55 reason:@"fetchAgain"];
  }
  else
  {
    float v50 = [v49 getChangesQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_6B07C;
    block[3] = &unk_D1520;
    void block[4] = *(void *)(v52 + 48);
    dispatch_async(v50, block);
  }
  [*(id *)(v52 + 48) setupDefaultCollectionsInManagedObjectContext:v55];
}

void sub_6B07C(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) receivedCollectionMemberChangesNotification];
  unsigned int v3 = +[BULogUtilities shared];
  unsigned int v4 = [v3 verboseLoggingEnabled];

  if (v2)
  {
    if (v4)
    {
      id v5 = BKLibraryCollectionDevelopmentLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "\"\\\"#collectionMemberChanged completed fetchAgain, processing deferred notification.\\\"\"", buf, 2u);
      }
    }
    [*(id *)(a1 + 32) setReceivedCollectionMemberChangesNotification:0];
    id v6 = [*(id *)(a1 + 32) libraryManager];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    id v8[2] = sub_6B1F0;
    v8[3] = &unk_D16B0;
    void v8[4] = *(void *)(a1 + 32);
    [v6 performBackgroundReadOnlyBlock:v8];
  }
  else
  {
    if (v4)
    {
      id v7 = BKLibraryCollectionDevelopmentLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "\"\\\"#collectionMemberChanged completed fetchAgain, NO deferred notification.\\\"\"", buf, 2u);
      }
    }
    [*(id *)(a1 + 32) setProcessingCollectionMemberChanges:0];
  }
}

id sub_6B1F0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _checkForChangesFromCloudCollectionMemberManagerInMOC:a2 reason:@"deferred"];
}

id sub_6B204(uint64_t a1)
{
  return [*(id *)(a1 + 32) setProcessingCollectionMemberChanges:0];
}

void sub_6CEA4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [v4 valueForKey:@"asset"];
  id v6 = +[NSSet setWithArray:v5];

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v41 = *(void *)v43;
    do
    {
      long long v9 = 0;
      do
      {
        if (*(void *)v43 != v41) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v42 + 1) + 8 * (void)v9);
        id v11 = [v10 assetID];

        if (v11)
        {
          id v12 = [v10 assetID];
          uint64_t v13 = +[NSPredicate predicateWithFormat:@"assetID == %@ AND temporaryAssetID == NULL", v12];
          id v14 = [v4 filteredArrayUsingPredicate:v13];
        }
        else
        {
          id v14 = 0;
        }
        BOOL v15 = [v10 temporaryAssetID];

        if (v15)
        {
          uint64_t v16 = [v10 temporaryAssetID];
          id v17 = +[NSPredicate predicateWithFormat:@"assetID == NULL AND temporaryAssetID == %@", v16];
          __int16 v18 = [v4 filteredArrayUsingPredicate:v17];
        }
        else
        {
          __int16 v18 = 0;
        }
        uint64_t v19 = [v10 assetID];
        if (v19
          && (id v20 = (void *)v19,
              [v10 temporaryAssetID],
              id v21 = objc_claimAutoreleasedReturnValue(),
              v21,
              v20,
              v21))
        {
          id v22 = [v10 assetID];
          id v23 = [v10 temporaryAssetID];
          id v24 = +[NSPredicate predicateWithFormat:@"assetID == %@ AND temporaryAssetID == %@", v22, v23];
          id v25 = [v4 filteredArrayUsingPredicate:v24];
        }
        else
        {
          id v25 = 0;
        }
        if ([v25 count])
        {
          [*(id *)(a1 + 32) addObjectsFromArray:v14];
          [*(id *)(a1 + 32) addObjectsFromArray:v18];
          if ((unint64_t)[v25 count] >= 2)
          {
            unint64_t v26 = 1;
            do
            {
              id v27 = *(void **)(a1 + 32);
              id v28 = [v25 objectAtIndexedSubscript:v26];
              [v27 addObject:v28];

              ++v26;
            }
            while (v26 < (unint64_t)[v25 count]);
          }
        }
        else if ([v14 count])
        {
          id v29 = *(void **)(a1 + 40);
          uint64_t v30 = [v14 firstObject];
          [v29 addObject:v30];

          if ((unint64_t)[v14 count] >= 2)
          {
            unint64_t v31 = 1;
            do
            {
              uint64_t v32 = *(void **)(a1 + 32);
              char v33 = [v14 objectAtIndexedSubscript:v31];
              [v32 addObject:v33];

              ++v31;
            }
            while (v31 < (unint64_t)[v14 count]);
          }
          [*(id *)(a1 + 32) addObjectsFromArray:v18];
        }
        else if ([v18 count])
        {
          uint64_t v34 = *(void **)(a1 + 40);
          __int16 v35 = [v18 firstObject];
          [v34 addObject:v35];

          if ((unint64_t)[v18 count] >= 2)
          {
            unint64_t v36 = 1;
            do
            {
              long long v37 = *(void **)(a1 + 32);
              unsigned int v38 = [v18 objectAtIndexedSubscript:v36];
              [v37 addObject:v38];

              ++v36;
            }
            while (v36 < (unint64_t)[v18 count]);
          }
        }

        long long v9 = (char *)v9 + 1;
      }
      while (v9 != v8);
      id v39 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
      id v8 = v39;
    }
    while (v39);
  }
}

void sub_6D388(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[NSFetchRequest fetchRequestWithEntityName:@"BKCollectionMember"];
  id v5 = +[NSPredicate predicateWithFormat:@"asset == NULL AND (assetID != NULL OR temporaryAssetID != NULL)"];
  [v4 setPredicate:v5];

  [v4 setFetchBatchSize:32];
  id v14 = 0;
  id v6 = [v3 executeFetchRequest:v4 error:&v14];
  id v7 = v14;
  if (v7)
  {
    id v8 = BKLibraryCollectionLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_93568();
    }
  }
  if ([v6 count])
  {
    [*(id *)(a1 + 32) p_updateAssetInMembers:v6 moc:v3];
    if ([v3 hasChanges])
    {
      long long v9 = +[NSPredicate predicateWithFormat:@"self isKindOfClass: %@", objc_opt_class()];
      id v10 = BKLibraryCollectionLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = [v3 updatedObjects];
        id v12 = [v11 filteredSetUsingPredicate:v9];
        id v13 = [v12 count];
        *(_DWORD *)long long buf = 134217984;
        id v16 = v13;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Fixed asset link for %lu BKCollectionMembers.", buf, 0xCu);
      }
    }
    else
    {
      long long v9 = BKLibraryCollectionLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "No BKCollectionMembers with missing asset link have existing assets.", buf, 2u);
      }
    }
  }
}

void sub_6D658(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKLibraryAsset"];
  id v5 = +[NSPredicate predicateWithFormat:@"contentType == %@ AND isSupplementalContent == NO AND supplementalContentParent == NULL", &off_DA040];
  [v4 setPredicate:v5];

  [v4 setFetchBatchSize:32];
  [v4 setReturnsDistinctResults:1];
  id v42 = 0;
  id v6 = [v3 executeFetchRequest:v4 error:&v42];
  id v7 = v42;
  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    uint64_t v29 = a1;
    unint64_t v31 = v6;
    uint64_t v34 = objc_opt_new();
    v50[0] = kBKCollectionDefaultAll;
    v50[1] = kBKCollectionDefaultIDPDFs;
    id v10 = +[NSArray arrayWithObjects:v50 count:2];
    id v11 = +[NSSet setWithArray:v10];

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v37 = 0;
    id v32 = v4;
    id v33 = v3;
    id v12 = [v3 executeFetchRequest:v4 error:&v37];
    id v30 = v37;
    id v13 = [v12 countByEnumeratingWithState:&v38 objects:v49 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v39;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v39 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          __int16 v18 = [v17 collectionMembers];
          uint64_t v19 = [v18 valueForKey:@"collectionID"];
          unsigned __int8 v20 = [v11 isSubsetOfSet:v19];

          if ((v20 & 1) == 0)
          {
            id v21 = [v17 assetID];
            [v34 addObject:v21];
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v38 objects:v49 count:16];
      }
      while (v14);
    }

    id v22 = [v34 count];
    id v23 = BKLibraryCollectionLog();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
    if (v22)
    {
      long long v9 = v30;
      id v6 = v31;
      if (v24)
      {
        id v25 = [v34 count];
        id v26 = [v31 count];
        id v27 = [v34 description];
        *(_DWORD *)long long buf = 134218498;
        id v44 = v25;
        __int16 v45 = 2048;
        id v46 = v26;
        __int16 v47 = 2112;
        id v48 = v27;
        _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "%lu out of %lu PDF assets don't have required BKCollectionMembers, resetting them now: %@", buf, 0x20u);
      }
      id v28 = *(void **)(v29 + 32);
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      void v35[2] = sub_6DA90;
      v35[3] = &unk_D1520;
      unint64_t v36 = v34;
      [v28 resetCollectionsForAssetIDs:v36 completion:v35];
      id v23 = v36;
    }
    else
    {
      long long v9 = v30;
      id v6 = v31;
      if (v24)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "PDFs are in PDF Collection, same as All Collection", buf, 2u);
      }
    }
    id v4 = v32;
    id v3 = v33;
  }
  else
  {
    long long v9 = v7;
    uint64_t v34 = BKLibraryCollectionLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_935D0(v9);
    }
  }
}

void sub_6DA90(uint64_t a1)
{
  unsigned int v2 = BKLibraryCollectionLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = [*(id *)(a1 + 32) count];
    int v4 = 134217984;
    id v5 = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "Done resetting collections for %lu PDF assets", (uint8_t *)&v4, 0xCu);
  }
}

id sub_6DEB0(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _performResetCollectionsInMoc:a2 changeSet:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void sub_6DF98(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) resetCollectionsChangeSet];

  id v3 = *(void **)(a1 + 32);
  int v4 = *(void **)(a1 + 40);
  if (v2)
  {
    id v7 = [v3 resetCollectionsChangeSet];
    id v5 = [v4 setByAddingObjectsFromSet:v7];
    [*(id *)(a1 + 32) setResetCollectionsChangeSet:v5];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 40);
    [v3 setResetCollectionsChangeSet:v6];
  }
}

id sub_6E314(uint64_t a1, void *a2)
{
  id v3 = [a2 changedValues];
  int v4 = [v3 allKeys];
  id v5 = +[NSSet setWithArray:v4];
  id v6 = [v5 intersectsSet:*(void *)(a1 + 32)];

  return v6;
}

void sub_6F940(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v3 = BKLibraryCollectionLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_93734(a1);
    }
  }
}

void sub_6FD48(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(&STACK[0x380], 8) = a1;
}

void type metadata accessor for BCAssetContentType(uint64_t a1)
{
}

void type metadata accessor for BooksDefaultsKey(uint64_t a1)
{
}

uint64_t sub_6FD7C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (*a1 != *a2) {
    return 0;
  }
  uint64_t v3 = *((void *)a2 + 4);
  uint64_t v4 = *((void *)a1 + 4);
  double v6 = *((double *)a2 + 2);
  double v5 = *((double *)a2 + 3);
  double v8 = *((double *)a1 + 2);
  double v7 = *((double *)a1 + 3);
  unsigned int v9 = sub_7AA74(*((void *)a1 + 1), *((void *)a2 + 1)) & (v8 == v6);
  if (v7 != v5) {
    unsigned int v9 = 0;
  }
  if (v4 == v3) {
    return v9;
  }
  else {
    return 0;
  }
}

uint64_t sub_6FDF8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_71350(&qword_EDB80);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v69 = v6;
  uint64_t v70 = v7;
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  id v10 = (char *)&v69 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  id v12 = (char *)&v69 - v11;
  uint64_t v13 = sub_71350(&qword_EDB88);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v76 = (char *)&v69 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v18 = __chkstk_darwin(v17);
  long long v73 = (char *)&v69 - v19;
  uint64_t v20 = __chkstk_darwin(v18);
  id v22 = (char *)&v69 - v21;
  __chkstk_darwin(v20);
  BOOL v24 = (char *)&v69 - v23;
  uint64_t v75 = a2;
  long long v71 = v12;
  long long v72 = v10;
  uint64_t v77 = v25;
  if (a1)
  {
    NSString v26 = sub_93A30();
    id v27 = a1;
    unsigned __int8 v28 = [a1 BOOLForKey:v26];

    char v29 = v28 ^ 1;
  }
  else
  {
    id v27 = 0;
    char v29 = 1;
  }
  id v30 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  unint64_t v79 = v14 + 16;
  v30(v24, v3, v13);
  if (v29)
  {
    double v81 = (char *)BRCBooksDefaultsKeyPriceTrackingEnabled;
    sub_939A0();
    __int16 v78 = *(void (**)(char *, uint64_t))(v14 + 8);
    v78(v24, v13);
    int v31 = v80 & 1;
  }
  else
  {
    __int16 v78 = *(void (**)(char *, uint64_t))(v14 + 8);
    v78(v24, v13);
    int v31 = 1;
  }
  uint64_t v32 = v3;
  id v33 = v76;
  int v74 = v31;
  if (v27)
  {
    uint64_t v34 = (char *)sub_70594();
    v30(v22, v32, v13);
    if (v34)
    {
      uint64_t v76 = v34;
      __int16 v35 = v78;
      v78(v22, v13);
      goto LABEL_16;
    }
  }
  else
  {
    v30(v22, v32, v13);
  }
  uint64_t v36 = sub_939B0();
  if (v36) {
    id v37 = (char *)v36;
  }
  else {
    id v37 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v76 = v37;
  long long v38 = v22;
  long long v39 = v78;
  v78(v38, v13);
  if (!v27)
  {
    long long v40 = v73;
    v30(v73, v32, v13);
    goto LABEL_20;
  }
  __int16 v35 = v39;
LABEL_16:
  long long v40 = v73;
  uint64_t v41 = sub_8C8E4();
  char v43 = v42;
  v30(v40, v32, v13);
  if ((v43 & 1) == 0)
  {
    id v44 = v40;
    __int16 v45 = v33;
    double v46 = *(double *)&v41;
    v35(v44, v13);
    goto LABEL_25;
  }
  long long v39 = v35;
LABEL_20:
  uint64_t v80 = BRCBooksDefaultsKeyPriceTrackingDealAbsoluteThreshold;
  sub_939A0();
  v39(v40, v13);
  if (v82) {
    double v46 = 0.0;
  }
  else {
    double v46 = *(double *)&v81;
  }
  if (!v27)
  {
    float v50 = (char *)v77;
    v30((char *)v77, v32, v13);
    goto LABEL_29;
  }
  __int16 v35 = v39;
  __int16 v45 = v33;
LABEL_25:
  uint64_t v47 = sub_8C8E4();
  char v49 = v48;
  float v50 = (char *)v77;
  v30((char *)v77, v32, v13);
  if ((v49 & 1) == 0)
  {
    double v51 = *(double *)&v47;
    long long v39 = v35;
    v35(v50, v13);
    id v33 = v45;
    goto LABEL_33;
  }
  id v33 = v45;
  long long v39 = v35;
LABEL_29:
  uint64_t v80 = BRCBooksDefaultsKeyPriceTrackingDealRelativeThreshold;
  sub_939A0();
  v39(v50, v13);
  if (v82) {
    double v51 = 0.0;
  }
  else {
    double v51 = *(double *)&v81;
  }
  if (!v27)
  {
    v30(v33, v32, v13);
LABEL_36:
    uint64_t v55 = v75;
    uint64_t v80 = BRCBooksDefaultsKeyPriceTrackingCardLimit;
    sub_939A0();
    v78(v33, v13);
    if (v82) {
      uint64_t v52 = 0;
    }
    else {
      uint64_t v52 = v81;
    }
    goto LABEL_39;
  }
LABEL_33:
  uint64_t v52 = (char *)sub_8CDAC();
  char v54 = v53;
  v30(v33, v32, v13);
  if (v54) {
    goto LABEL_36;
  }
  v39(v33, v13);
  uint64_t v55 = v75;
LABEL_39:
  id v56 = v76;
  uint64_t v57 = *((void *)v76 + 2);
  if (v57)
  {
    long long v73 = v52;
    double v81 = (char *)&_swiftEmptyArrayStorage;
    sub_93DC0();
    unint64_t v58 = sub_71394();
    uint64_t v59 = v69;
    __int16 v78 = *(void (**)(char *, uint64_t))(v70 + 16);
    unint64_t v79 = v58;
    id v60 = &v56[(*(unsigned __int8 *)(v70 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v70 + 80)];
    uint64_t v61 = *(void *)(v70 + 72);
    uint64_t v76 = v56;
    uint64_t v77 = v61;
    unsigned __int8 v62 = (void (**)(char *, uint64_t))(v70 + 8);
    id v64 = v71;
    uint64_t v63 = (uint64_t)v72;
    do
    {
      long long v65 = (void (*)(uint64_t, char *, uint64_t))v78;
      ((void (*)(char *, char *, uint64_t))v78)(v64, v60, v59);
      v65(v63, v64, v59);
      sub_70ACC(v63);
      (*v62)(v64, v59);
      sub_93DA0();
      sub_93DD0();
      sub_93DE0();
      sub_93DB0();
      v60 += v77;
      --v57;
    }
    while (v57);
    long long v66 = v81;
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v55 = v75;
    char v68 = v74;
    uint64_t v52 = v73;
  }
  else
  {
    uint64_t result = swift_bridgeObjectRelease();
    long long v66 = (char *)&_swiftEmptyArrayStorage;
    char v68 = v74;
  }
  *(unsigned char *)uint64_t v55 = v68;
  *(void *)(v55 + _Block_object_dispose(&STACK[0x380], 8) = v66;
  *(double *)(v55 + 16) = v46;
  *(double *)(v55 + 24) = v51;
  *(void *)(v55 + 32) = v52;
  return result;
}

void *sub_70594()
{
  uint64_t v35 = sub_71350(&qword_EDB80);
  uint64_t v1 = *(void *)(v35 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_93A90();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  NSString v8 = sub_93A30();
  uint64_t v9 = [v0 stringForKey:v8];

  if (!v9) {
    return v9;
  }
  id v10 = (void *)sub_93A60();
  id v12 = v11;

  v37[0] = v10;
  v37[1] = v12;
  sub_713D4();
  if ((sub_93C60() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  sub_93A80();
  uint64_t v13 = sub_93A70();
  unint64_t v15 = v14;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (v15 >> 60 == 15)
  {
LABEL_15:
    if (qword_ED9C0 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_93940();
    sub_71428(v26, (uint64_t)qword_EF0E8);
    id v27 = sub_93920();
    os_log_type_t v28 = sub_93C70();
    if (os_log_type_enabled(v27, v28))
    {
      char v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v29 = 0;
      _os_log_impl(&dword_0, v27, v28, "Invalid 'update schedule steps' override value in user defaults", v29, 2u);
      swift_slowDealloc();
    }

    return 0;
  }
  uint64_t v16 = self;
  Class isa = sub_93850().super.isa;
  v37[0] = 0;
  id v18 = [v16 JSONObjectWithData:isa options:0 error:v37];

  if (!v18)
  {
    id v25 = v37[0];
    sub_93840();

    swift_willThrow();
    sub_71460(v13, v15);
    swift_errorRelease();
    goto LABEL_15;
  }
  id v19 = v37[0];
  sub_93D00();
  swift_unknownObjectRelease();
  sub_71350(&qword_EDBA0);
  if ((swift_dynamicCast() & 1) == 0)
  {
    sub_71460(v13, v15);
    goto LABEL_15;
  }
  int64_t v20 = *(void *)(v36 + 16);
  if (v20)
  {
    uint64_t v32 = v13;
    unint64_t v33 = v15;
    v37[0] = &_swiftEmptyArrayStorage;
    sub_879CC(0, v20, 0);
    uint64_t v9 = v37[0];
    uint64_t v34 = v1 + 32;
    type metadata accessor for BooksDefaultsPriceTrackingUpdateScheduleStepsKey(0);
    sub_70F50(&qword_EDBA8, type metadata accessor for BooksDefaultsPriceTrackingUpdateScheduleStepsKey);
    uint64_t v21 = 0;
    do
    {
      int64_t v22 = v20;
      swift_bridgeObjectRetain();
      sub_939C0();
      v37[0] = v9;
      unint64_t v24 = v9[2];
      unint64_t v23 = v9[3];
      if (v24 >= v23 >> 1)
      {
        sub_879CC(v23 > 1, v24 + 1, 1);
        uint64_t v9 = v37[0];
      }
      ++v21;
      v9[2] = v24 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))((unint64_t)v9+ ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80))+ *(void *)(v1 + 72) * v24, v3, v35);
      int64_t v20 = v22;
    }
    while (v22 != v21);
    sub_71460(v32, v33);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_71460(v13, v15);
    swift_bridgeObjectRelease();
    return &_swiftEmptyArrayStorage;
  }
  return v9;
}

id sub_70ACC(uint64_t a1)
{
  uint64_t v2 = sub_71350(&qword_EDB80);
  sub_939A0();
  if (v10) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = v9;
  }
  sub_939A0();
  if (v10) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = v9;
  }
  sub_939A0();
  if (v10) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = v9;
  }
  sub_939A0();
  if (v10) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = v9;
  }
  id v7 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithDuration:v3 minUpdateInterval:v4 schedulerConfigIdealInterval:v5 schedulerConfigMinInterval:v6];
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return v7;
}

uint64_t sub_70C6C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_93A60();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_70C98(uint64_t a1, uint64_t a2)
{
  return sub_71170(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_70CC4(uint64_t a1, id *a2)
{
  uint64_t result = sub_93A40();
  *a2 = 0;
  return result;
}

uint64_t sub_70D3C(uint64_t a1, id *a2)
{
  char v3 = sub_93A50();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_70DBC@<X0>(void *a1@<X8>)
{
  sub_93A60();
  NSString v2 = sub_93A30();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_70E04(uint64_t a1)
{
  uint64_t v2 = sub_70F50(&qword_EDB10, type metadata accessor for BooksDefaultsKey);
  uint64_t v3 = sub_70F50(&qword_EDB18, type metadata accessor for BooksDefaultsKey);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_70EC0()
{
  return sub_70F50(&qword_EDAF8, type metadata accessor for BooksDefaultsKey);
}

uint64_t sub_70F08()
{
  return sub_70F50(&qword_EDB00, type metadata accessor for BooksDefaultsKey);
}

uint64_t sub_70F50(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_70F98(uint64_t a1)
{
  uint64_t v2 = sub_70F50(&qword_EDC68, type metadata accessor for BooksDefaultsPriceTrackingUpdateScheduleStepsKey);
  uint64_t v3 = sub_70F50(&qword_EDC70, type metadata accessor for BooksDefaultsPriceTrackingUpdateScheduleStepsKey);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_71054@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_93A30();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_7109C(uint64_t a1)
{
  uint64_t v2 = sub_70F50((unint64_t *)&qword_EDC78, type metadata accessor for NSKeyValueChangeKey);
  uint64_t v3 = sub_70F50(&qword_EDC80, type metadata accessor for NSKeyValueChangeKey);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_71158(uint64_t a1, uint64_t a2)
{
  return sub_71170(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_71170(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_93A60();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_711B4()
{
  sub_93A60();
  sub_93AA0();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_71208()
{
  sub_93A60();
  sub_93F00();
  sub_93AA0();
  Swift::Int v0 = sub_93F10();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_7127C()
{
  return sub_70F50(&qword_EDB08, type metadata accessor for BooksDefaultsKey);
}

uint64_t sub_712C4()
{
  uint64_t v0 = sub_93A60();
  uint64_t v2 = v1;
  if (v0 == sub_93A60() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_93EB0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_71350(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_71394()
{
  unint64_t result = qword_EDB90;
  if (!qword_EDB90)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_EDB90);
  }
  return result;
}

unint64_t sub_713D4()
{
  unint64_t result = qword_EDB98;
  if (!qword_EDB98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_EDB98);
  }
  return result;
}

uint64_t sub_71428(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_71460(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_71474(a1, a2);
  }
  return a1;
}

uint64_t sub_71474(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

void type metadata accessor for BooksDefaultsPriceTrackingUpdateScheduleStepsKey(uint64_t a1)
{
}

uint64_t sub_714E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 24);
}

uint64_t initializeBufferWithCopyOfBuffer for AssetSnapshot(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_7151C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_71524(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + _Block_object_dispose(&STACK[0x380], 8) = *(void *)(a2 + 8);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_7156C(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + _Block_object_dispose(&STACK[0x380], 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

__n128 sub_715D4(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_715E8(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + _Block_object_dispose(&STACK[0x380], 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t sub_71638(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_71680(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + _Block_object_dispose(&STACK[0x380], 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + _Block_object_dispose(&STACK[0x380], 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t _s13PriceTrackingVMa()
{
  return sub_718A4();
}

void type metadata accessor for NSKeyValueChangeKey(uint64_t a1)
{
}

uint64_t sub_716F4()
{
  return sub_70F50(&qword_EDC40, type metadata accessor for NSKeyValueChangeKey);
}

uint64_t sub_7173C()
{
  return sub_70F50(&qword_EDC48, type metadata accessor for NSKeyValueChangeKey);
}

uint64_t sub_71784()
{
  return sub_70F50(&qword_EDBA8, type metadata accessor for BooksDefaultsPriceTrackingUpdateScheduleStepsKey);
}

uint64_t sub_717CC()
{
  return sub_70F50(&qword_EDC50, type metadata accessor for BooksDefaultsPriceTrackingUpdateScheduleStepsKey);
}

uint64_t sub_71814()
{
  return sub_70F50(&qword_EDC58, type metadata accessor for BooksDefaultsPriceTrackingUpdateScheduleStepsKey);
}

uint64_t sub_7185C()
{
  return sub_70F50(&qword_EDC60, type metadata accessor for NSKeyValueChangeKey);
}

uint64_t sub_718A4()
{
  return swift_getGenericMetadata();
}

void type metadata accessor for BKAssetContentType(uint64_t a1)
{
}

void sub_718E8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

void *sub_71938(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, void *a6, void *a7, uint64_t a8, void *a9, void *a10)
{
  uint64_t v11 = v10;
  uint64_t v57 = a2;
  id v58 = a1;
  id v50 = a9;
  uint64_t v19 = sub_71350(&qword_EDD28);
  __chkstk_darwin(v19 - 8);
  uint64_t v55 = (char *)&v48 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_defaultActor_initialize();
  *(void *)(v11 + 120) = 0;
  swift_unknownObjectWeakInit();
  *(unsigned char *)(v11 + 20_Block_object_dispose(&STACK[0x380], 8) = 1;
  *(_OWORD *)(v11 + 216) = 0u;
  *(_OWORD *)(v11 + 232) = 0u;
  *(void *)(v11 + 120) = &off_D3E60;
  swift_unknownObjectWeakAssign();
  *(void *)(v11 + 12_Block_object_dispose(&STACK[0x380], 8) = a2;
  *(void *)(v11 + 136) = a3;
  *(void *)(v11 + 144) = a4;
  *(void *)(v11 + 152) = a5;
  uint64_t v59 = a5;
  *(void *)(v11 + 160) = &protocol witness table for BCDefaultCloudGlobalMetadataManager;
  *(void *)(v11 + 16_Block_object_dispose(&STACK[0x380], 8) = a6;
  *(void *)(v11 + 176) = &protocol witness table for RCDataContainer;
  *(void *)(v11 + 184) = a7;
  *(void *)(v11 + 192) = a8;
  *(void *)(v11 + 200) = a10;
  uint64_t v21 = (objc_class *)type metadata accessor for PriceTracker();
  v60.receiver = (id)v11;
  v60.super_class = v21;
  swift_unknownObjectRetain();
  id v56 = a3;
  id v53 = a4;
  swift_retain();
  id v54 = a6;
  id v52 = a7;
  swift_unknownObjectRetain();
  id v51 = a10;
  id v22 = [super init];
  uint64_t v23 = swift_allocObject();
  swift_weakInit();
  sub_7C388(0, &qword_EDE00);
  unint64_t v24 = (void *)swift_allocObject();
  v24[2] = 0xD00000000000002FLL;
  v24[3] = 0x80000000000B4F90;
  id v25 = v50;
  void v24[4] = v50;
  void v24[5] = &unk_EDDF8;
  v24[6] = v23;
  id v26 = v25;
  id v27 = v22;
  uint64_t v28 = sub_8E7C0((uint64_t)sub_7C3C8, (uint64_t)v24, 20.0, 10.0, 0xD00000000000002FLL, 0x80000000000B4F90, (uint64_t (*)())sub_72084, 0);
  char v29 = (void *)v27[27];
  v27[27] = v28;

  uint64_t v30 = swift_allocObject();
  swift_weakInit();
  uint64_t v31 = (void *)swift_allocObject();
  v31[2] = 0xD000000000000027;
  v31[3] = 0x80000000000B4FC0;
  void v31[4] = v26;
  void v31[5] = &unk_EDE10;
  v31[6] = v30;
  id v50 = v26;
  uint64_t v32 = (void *)sub_8E7C0((uint64_t)sub_7C3C8, (uint64_t)v31, 5.0, 0.25, 0xD000000000000027, 0x80000000000B4FC0, (uint64_t (*)())sub_723C4, 0);
  id v49 = v32;
  uint64_t v33 = swift_allocObject();
  swift_weakInit();
  uint64_t v34 = swift_allocObject();
  *(void *)(v34 + 16) = v32;
  uint64_t v35 = sub_93B90();
  uint64_t v36 = (uint64_t)v55;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v55, 1, 1, v35);
  id v37 = (void *)swift_allocObject();
  v37[2] = 0;
  v37[3] = 0;
  id v38 = v53;
  id v39 = v54;
  id v37[4] = v53;
  v37[5] = &unk_EDE30;
  uint64_t v40 = v59;
  v37[6] = v34;
  v37[7] = v40;
  v37[8] = &unk_EDE20;
  v37[9] = v33;
  uint64_t v41 = v51;
  char v42 = v52;
  v37[10] = v39;
  v37[11] = v42;
  v37[12] = a8;
  v37[13] = v41;
  id v53 = v38;
  swift_retain();
  id v54 = v39;
  id v43 = v42;
  swift_unknownObjectRetain();
  id v44 = v41;
  swift_retain_n();
  id v45 = v49;
  swift_retain();
  uint64_t v46 = sub_76D20(v36, (uint64_t)&unk_EDE40, (uint64_t)v37);
  sub_7A354(v36);

  swift_unknownObjectRelease();
  swift_release();

  swift_unknownObjectRelease();
  swift_release_n();
  swift_release();

  v27[28] = v46;
  swift_release();
  return v27;
}

uint64_t sub_71E40(char a1, uint64_t a2)
{
  *(void *)(v2 + 40) = a2;
  *(unsigned char *)(v2 + 64) = a1;
  return _swift_task_switch(sub_71E64, 0, 0);
}

uint64_t sub_71E64()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  *(void *)(v0 + 4_Block_object_dispose(&STACK[0x380], 8) = Strong;
  if (Strong)
  {
    uint64_t v2 = Strong;
    uint64_t v3 = swift_task_alloc();
    *(void *)(v0 + 56) = v3;
    *(void *)uint64_t v3 = v0;
    *(void *)(v3 + _Block_object_dispose(&STACK[0x380], 8) = sub_71F74;
    char v4 = *(unsigned char *)(v0 + 64);
    *(void *)(v3 + 12_Block_object_dispose(&STACK[0x380], 8) = v2;
    *(unsigned char *)(v3 + 184) = v4;
    return _swift_task_switch(sub_779A4, v2, 0);
  }
  else
  {
    char v5 = *(uint64_t (**)(void))(v0 + 8);
    return v5();
  }
}

uint64_t sub_71F74()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void sub_72084(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_72090(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 40) = a2;
  return _swift_task_switch(sub_720B0, 0, 0);
}

uint64_t sub_720B0()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  *(void *)(v0 + 4_Block_object_dispose(&STACK[0x380], 8) = Strong;
  if (Strong)
  {
    return _swift_task_switch(sub_7216C, Strong, 0);
  }
  else
  {
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2();
  }
}

uint64_t sub_7216C()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = *(int **)(v1 + 232);
  v0[7] = v2;
  v0[8] = *(void *)(v1 + 240);
  sub_817CC((uint64_t)v2);
  swift_release();
  if (v2)
  {
    uint64_t v6 = (uint64_t (*)(void))((char *)v2 + *v2);
    uint64_t v3 = (void *)swift_task_alloc();
    v0[9] = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_7229C;
    return v6();
  }
  else
  {
    char v5 = (uint64_t (*)(void))v0[1];
    return v5();
  }
}

uint64_t sub_7229C()
{
  uint64_t v1 = *(void *)(*v0 + 56);
  uint64_t v4 = *v0;
  swift_task_dealloc();
  sub_76FEC(v1);
  uint64_t v2 = *(uint64_t (**)(void))(v4 + 8);
  return v2();
}

void sub_723C4(uint64_t a1, uint64_t a2)
{
}

void sub_723D0(uint64_t a1, uint64_t a2, const char *a3)
{
  if (qword_ED9C0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_93940();
  sub_71428(v4, (uint64_t)qword_EF0E8);
  oslog = sub_93920();
  os_log_type_t v5 = sub_93C70();
  if (os_log_type_enabled(oslog, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_0, oslog, v5, a3, v6, 2u);
    swift_slowDealloc();
  }
}

uint64_t sub_724C0(uint64_t a1)
{
  *(void *)(v1 + 40) = a1;
  return _swift_task_switch(sub_724E0, 0, 0);
}

uint64_t sub_724E0()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  *(void *)(v0 + 4_Block_object_dispose(&STACK[0x380], 8) = Strong;
  if (Strong)
  {
    return _swift_task_switch(sub_7259C, Strong, 0);
  }
  else
  {
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2();
  }
}

uint64_t sub_7259C()
{
  [*(id *)(*(void *)(v0 + 48) + 216) signal];
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_72610(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_72630, 0, 0);
}

uint64_t sub_72630()
{
  [*(id *)(v0 + 16) signal];
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_72698(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 460_Block_object_dispose(&STACK[0x380], 8) = v12;
  *(_OWORD *)(v8 + 4592) = v11;
  *(_OWORD *)(v8 + 4576) = v10;
  *(void *)(v8 + 456_Block_object_dispose(&STACK[0x380], 8) = a8;
  *(void *)(v8 + 4560) = a7;
  *(void *)(v8 + 4552) = a6;
  *(void *)(v8 + 4544) = a5;
  *(void *)(v8 + 4536) = a4;
  return _swift_task_switch(sub_726E0, 0, 0);
}

uint64_t sub_726E0()
{
  uint64_t v18 = v0[575];
  uint64_t v19 = v0[576];
  uint64_t v17 = v0[574];
  uint64_t v1 = v0[573];
  uint64_t v2 = v0[572];
  uint64_t v3 = v0[571];
  uint64_t v4 = v0[570];
  uint64_t v5 = v0[569];
  uint64_t v6 = v0[568];
  uint64_t v7 = v0[567];
  uint64_t v8 = (void *)swift_task_alloc();
  v0[577] = v8;
  id v8[2] = v7;
  v8[3] = v6;
  void v8[4] = v5;
  swift_asyncLet_begin();
  uint64_t v9 = (void *)swift_task_alloc();
  v0[578] = v9;
  v9[2] = v4;
  v9[3] = v3;
  void v9[4] = v2;
  void v9[5] = v6;
  v9[6] = v5;
  swift_asyncLet_begin();
  long long v10 = (void *)swift_task_alloc();
  v0[579] = v10;
  v10[2] = v1;
  v10[3] = v3;
  void v10[4] = v2;
  v10[5] = v6;
  v10[6] = v5;
  swift_asyncLet_begin();
  long long v11 = (void *)swift_task_alloc();
  v0[580] = v11;
  v11[2] = v17;
  v11[3] = v3;
  void v11[4] = v2;
  void v11[5] = v6;
  v11[6] = v5;
  swift_asyncLet_begin();
  uint64_t v12 = (void *)swift_task_alloc();
  v0[581] = v12;
  void v12[2] = v17;
  v12[3] = v3;
  void v12[4] = v2;
  void v12[5] = v6;
  v12[6] = v5;
  swift_asyncLet_begin();
  uint64_t v13 = (void *)swift_task_alloc();
  v0[582] = v13;
  v13[2] = v18;
  v13[3] = v3;
  void v13[4] = v2;
  void v13[5] = v6;
  void v13[6] = v5;
  swift_asyncLet_begin();
  unint64_t v14 = (void *)swift_task_alloc();
  v0[583] = v14;
  void v14[2] = v19;
  v14[3] = v3;
  void v14[4] = v2;
  void v14[5] = v6;
  v14[6] = v5;
  swift_asyncLet_begin();
  return _swift_asyncLet_get(v0 + 2, v15, sub_72994, v0 + 562);
}

uint64_t sub_72994(uint64_t a1, uint64_t a2)
{
  return _swift_asyncLet_get(v2 + 656, a2, sub_729B4, v2 + 4496);
}

uint64_t sub_729B4(uint64_t a1, uint64_t a2)
{
  return _swift_asyncLet_get(v2 + 1296, a2, sub_729D4, v2 + 4496);
}

uint64_t sub_729D4(uint64_t a1, uint64_t a2)
{
  return _swift_asyncLet_get(v2 + 1936, a2, sub_729F4, v2 + 4496);
}

uint64_t sub_729F4(uint64_t a1, uint64_t a2)
{
  return _swift_asyncLet_get(v2 + 2576, a2, sub_72A14, v2 + 4496);
}

uint64_t sub_72A14(uint64_t a1, uint64_t a2)
{
  return _swift_asyncLet_get(v2 + 3216, a2, sub_72A34, v2 + 4496);
}

uint64_t sub_72A34(uint64_t a1, uint64_t a2)
{
  return _swift_asyncLet_get(v2 + 3856, a2, sub_72A54, v2 + 4496);
}

uint64_t sub_72A54()
{
  return _swift_asyncLet_finish(v0 + 3856);
}

uint64_t sub_72A74()
{
  return _swift_task_switch(sub_72A90, 0, 0);
}

uint64_t sub_72A90()
{
  swift_task_dealloc();
  return _swift_asyncLet_finish(v0 + 3216);
}

uint64_t sub_72B00()
{
  return _swift_task_switch(sub_72B1C, 0, 0);
}

uint64_t sub_72B1C()
{
  swift_task_dealloc();
  return _swift_asyncLet_finish(v0 + 2576);
}

uint64_t sub_72B8C()
{
  return _swift_task_switch(sub_72BA8, 0, 0);
}

uint64_t sub_72BA8()
{
  swift_task_dealloc();
  return _swift_asyncLet_finish(v0 + 1936);
}

uint64_t sub_72C18()
{
  return _swift_task_switch(sub_72C34, 0, 0);
}

uint64_t sub_72C34()
{
  swift_task_dealloc();
  return _swift_asyncLet_finish(v0 + 1296);
}

uint64_t sub_72CA4()
{
  return _swift_task_switch(sub_72CC0, 0, 0);
}

uint64_t sub_72CC0()
{
  swift_task_dealloc();
  return _swift_asyncLet_finish(v0 + 656);
}

uint64_t sub_72D30()
{
  return _swift_task_switch(sub_72D4C, 0, 0);
}

uint64_t sub_72D4C()
{
  swift_task_dealloc();
  return _swift_asyncLet_finish(v0 + 16);
}

uint64_t sub_72DBC()
{
  return _swift_task_switch(sub_72DD8, 0, 0);
}

uint64_t sub_72DD8()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_72E38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[3] = a3;
  void v4[4] = a4;
  v4[2] = a2;
  uint64_t v5 = sub_71350(&qword_EE098);
  void v4[5] = v5;
  v4[6] = *(void *)(v5 - 8);
  v4[7] = swift_task_alloc();
  return _swift_task_switch(sub_72F00, 0, 0);
}

uint64_t sub_72F00()
{
  id v1 = [*(id *)(v0 + 16) stringForKey:BDSPriceTrackerCardList];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = sub_93A60();
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v5 = 0;
  }
  *(void *)(v0 + 64) = v5;
  sub_8BDB0();
  swift_retain();
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_7300C;
  uint64_t v7 = *(void *)(v0 + 56);
  uint64_t v8 = *(void *)(v0 + 24);
  uint64_t v9 = *(void *)(v0 + 32);
  return sub_7D14C(v3, v5, v7, v8, v9);
}

uint64_t sub_7300C()
{
  uint64_t v1 = *(void *)(*v0 + 56);
  uint64_t v2 = *(void *)(*v0 + 48);
  uint64_t v3 = *(void *)(*v0 + 40);
  uint64_t v6 = *v0;
  swift_task_dealloc();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

uint64_t sub_731A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void v6[5] = a5;
  v6[6] = a6;
  v6[3] = a3;
  void v6[4] = a4;
  v6[2] = a2;
  v6[7] = sub_71350(&qword_EDEC0);
  v6[8] = swift_task_alloc();
  uint64_t v7 = sub_71350(&qword_EE048);
  v6[9] = v7;
  v6[10] = *(void *)(v7 - 8);
  v6[11] = swift_task_alloc();
  long long v10 = (uint64_t (__cdecl *)())((char *)&dword_EE050 + dword_EE050);
  uint64_t v8 = (void *)swift_task_alloc();
  v6[12] = v8;
  *uint64_t v8 = v6;
  v8[1] = sub_732EC;
  return v10();
}

uint64_t sub_732EC(char a1)
{
  *(unsigned char *)(*(void *)v1 + 112) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_733EC, 0, 0);
}

uint64_t sub_733EC()
{
  sub_93A10();
  sub_939D0();
  uint64_t v1 = swift_allocObject();
  swift_weakInit();
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = &unk_EE060;
  *(void *)(v2 + 24) = v1;
  sub_81774(&qword_EDF08, &qword_EDEC0);
  sub_93DF0();
  swift_retain();
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 104) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_73590;
  char v4 = *(unsigned char *)(v0 + 112);
  uint64_t v5 = *(void *)(v0 + 88);
  uint64_t v6 = *(void *)(v0 + 40);
  uint64_t v7 = *(void *)(v0 + 48);
  uint64_t v8 = *(void *)(v0 + 24);
  uint64_t v9 = *(void *)(v0 + 32);
  return sub_7DAD8(v4, v5, v8, v9, v6, v7);
}

uint64_t sub_73590()
{
  uint64_t v1 = *(void *)(*v0 + 88);
  uint64_t v2 = *(void *)(*v0 + 80);
  uint64_t v3 = *(void *)(*v0 + 72);
  uint64_t v6 = *v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  char v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

uint64_t sub_73748()
{
  uint64_t v2 = *v0;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_73824;
  return dispatch thunk of BCCloudGlobalMetadataManaging.fetchBool(forKey:)(0xD000000000000023, 0x80000000000B5020, v2, &protocol witness table for BCDefaultCloudGlobalMetadataManager);
}

uint64_t sub_73824(char a1)
{
  uint64_t v4 = *v2;
  *(void *)(v4 + 32) = v1;
  swift_task_dealloc();
  if (v1)
  {
    return _swift_task_switch(sub_73960, 0, 0);
  }
  else
  {
    uint64_t v5 = *(uint64_t (**)(void))(v4 + 8);
    return v5(a1 & 1);
  }
}

uint64_t sub_73960()
{
  if (qword_ED9C0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_93940();
  sub_71428(v1, (uint64_t)qword_EF0E8);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = sub_93920();
  os_log_type_t v3 = sub_93C70();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 138412290;
    swift_errorRetain();
    uint64_t v6 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 16) = v6;
    sub_93CE0();
    *uint64_t v5 = v6;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v2, v3, "[Metadata] Failed to get notificationsEnabled: %@", v4, 0xCu);
    sub_71350(&qword_EDDD8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7(0);
}

uint64_t sub_73B68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[12] = a5;
  v6[13] = a6;
  v6[10] = a3;
  v6[11] = a4;
  v6[9] = a2;
  v6[14] = sub_71350(&qword_EE000);
  v6[15] = swift_task_alloc();
  uint64_t v7 = sub_71350(&qword_EE008);
  uint8_t v6[16] = v7;
  v6[17] = *(void *)(v7 - 8);
  v6[18] = swift_task_alloc();
  uint64_t v8 = sub_71350(&qword_EDB88);
  v6[19] = v8;
  v6[20] = *(void *)(v8 - 8);
  v6[21] = swift_task_alloc();
  return _swift_task_switch(sub_73CC8, 0, 0);
}

uint64_t sub_73CC8()
{
  uint64_t v1 = v0[20];
  uint64_t v2 = v0[21];
  uint64_t v3 = v0[19];
  uint64_t v4 = sub_93970();
  sub_93980();
  sub_6FDF8(0, (uint64_t)(v0 + 2));
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v2, v3);
  sub_93990();
  sub_80A58();
  v0[7] = v4;
  v0[8] = &protocol witness table for RCDataContainer;
  swift_getOpaqueTypeConformance2();
  sub_93DF0();
  swift_retain();
  swift_retain();
  uint64_t v5 = (void *)swift_task_alloc();
  v0[22] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_73E7C;
  uint64_t v6 = v0[18];
  uint64_t v7 = v0[12];
  uint64_t v8 = v0[13];
  uint64_t v9 = v0[10];
  uint64_t v10 = v0[11];
  return sub_80AA8((uint64_t)(v0 + 2), v6, v9, v10, v7, v8);
}

uint64_t sub_73E7C()
{
  uint64_t v1 = *v0 + 16;
  uint64_t v2 = *(void *)(*v0 + 144);
  uint64_t v3 = *(void *)(*v0 + 136);
  uint64_t v4 = *(void *)(*v0 + 128);
  uint64_t v7 = *v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  sub_7736C(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(void))(v7 + 8);
  return v5();
}

uint64_t sub_74064(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 56) = a1;
  *(void *)(v2 + 64) = a2;
  return _swift_task_switch(sub_74084, 0, 0);
}

uint64_t sub_74084()
{
  uint64_t v1 = *(void *)(v0 + 56);
  sub_6FDF8(0, v0 + 16);
  long long v2 = *(_OWORD *)(v0 + 16);
  long long v3 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 32) = *(void *)(v0 + 48);
  *(_OWORD *)uint64_t v1 = v2;
  *(_OWORD *)(v1 + 16) = v3;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_740FC(unsigned char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 32) = a5;
  *(void *)(v6 + 40) = a6;
  *(void *)(v6 + 16) = a3;
  *(void *)(v6 + 24) = a4;
  *(unsigned char *)(v6 + 84) = *a1;
  *(unsigned char *)(v6 + 85) = *(unsigned char *)a2;
  *(void *)(v6 + 4_Block_object_dispose(&STACK[0x380], 8) = *(void *)(a2 + 8);
  return _swift_task_switch(sub_74138, 0, 0);
}

uint64_t sub_74138()
{
  if (qword_ED9C0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_93940();
  v0[7] = sub_71428(v1, (uint64_t)qword_EF0E8);
  long long v2 = sub_93920();
  os_log_type_t v3 = sub_93C80();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    swift_slowDealloc();
  }
  uint64_t v5 = (int *)v0[2];

  uint64_t v8 = (uint64_t (*)(void))((char *)v5 + *v5);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[8] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_742C8;
  return v8();
}

uint64_t sub_742C8()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_743C4, 0, 0);
}

uint64_t sub_743C4()
{
  if (*(unsigned __int8 *)(v0 + 85) == *(unsigned __int8 *)(v0 + 84))
  {
    uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
    return v5();
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v1 = sub_93920();
    os_log_type_t v2 = sub_93C80();
    if (os_log_type_enabled(v1, v2))
    {
      int v3 = *(unsigned __int8 *)(v0 + 85);
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v4 = 67109120;
      *(_DWORD *)(v0 + 80) = v3;
      sub_93CE0();
      swift_bridgeObjectRelease();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    uint64_t v8 = (uint64_t (*)(void))(*(void *)(v0 + 32) + **(int **)(v0 + 32));
    uint64_t v7 = (void *)swift_task_alloc();
    *(void *)(v0 + 72) = v7;
    void *v7 = v0;
    v7[1] = sub_745B8;
    return v8();
  }
}

uint64_t sub_745B8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_746AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void v6[5] = a5;
  v6[6] = a6;
  v6[3] = a3;
  void v6[4] = a4;
  v6[2] = a2;
  v6[7] = sub_71350(&qword_EDF70);
  v6[8] = swift_task_alloc();
  uint64_t v7 = sub_71350(&qword_EDF78);
  v6[9] = v7;
  v6[10] = *(void *)(v7 - 8);
  v6[11] = swift_task_alloc();
  return _swift_task_switch(sub_747AC, 0, 0);
}

uint64_t sub_747AC()
{
  id v1 = [*(id *)(v0 + 16) activeStoreAccount];
  id v2 = v1;
  if (v1) {

  }
  sub_74AD0();
  sub_81774(&qword_EDF98, &qword_EDF70);
  sub_93DF0();
  swift_retain();
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_74918;
  uint64_t v4 = *(void *)(v0 + 88);
  uint64_t v5 = *(void *)(v0 + 40);
  uint64_t v6 = *(void *)(v0 + 48);
  uint64_t v7 = *(void *)(v0 + 24);
  uint64_t v8 = *(void *)(v0 + 32);
  return sub_7E478(v2 != 0, v4, v7, v8, v5, v6);
}

uint64_t sub_74918()
{
  uint64_t v1 = *(void *)(*v0 + 88);
  uint64_t v2 = *(void *)(*v0 + 80);
  uint64_t v3 = *(void *)(*v0 + 72);
  uint64_t v6 = *v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

uint64_t sub_74AD0()
{
  uint64_t v1 = sub_71350(&qword_EDFC8);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_71350((uint64_t *)&unk_EDFD0);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v20 - v10;
  sub_71350((uint64_t *)&unk_EE390);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for AsyncStream.Continuation.BufferingPolicy.unbounded<A>(_:), v1);
  sub_93BA0();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  v12(v9, v11, v5);
  uint64_t v13 = (objc_class *)type metadata accessor for AccountsObserver();
  unint64_t v14 = (char *)objc_allocWithZone(v13);
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  v12(&v14[OBJC_IVAR____TtC9BKLibraryP33_05F439DD99DBF9E3F4595B1087281DC916AccountsObserver_continuation], v9, v5);
  v20.receiver = v14;
  v20.super_class = v13;
  id v15 = [super init];
  uint64_t v16 = *(void (**)(char *, uint64_t))(v6 + 8);
  v16(v9, v5);
  [v0 addObserver:v15 accountTypes:1];
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v0;
  *(void *)(v17 + 24) = v15;
  id v18 = v0;
  sub_93BB0();
  return ((uint64_t (*)(char *, uint64_t))v16)(v11, v5);
}

uint64_t sub_74DA8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v3;
  return _swift_task_switch(sub_74DCC, 0, 0);
}

uint64_t sub_74DCC()
{
  **(unsigned char **)(v0 + 16) = *(void *)(v0 + 24) != 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_74DF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void v6[5] = a5;
  v6[6] = a6;
  v6[3] = a3;
  void v6[4] = a4;
  v6[2] = a2;
  v6[7] = sub_71350(&qword_EDF70);
  v6[8] = swift_task_alloc();
  uint64_t v7 = sub_71350(&qword_EDF78);
  v6[9] = v7;
  v6[10] = *(void *)(v7 - 8);
  v6[11] = swift_task_alloc();
  uint64_t v8 = sub_71350(&qword_EDF80);
  v6[12] = v8;
  v6[13] = *(void *)(v8 - 8);
  v6[14] = swift_task_alloc();
  return _swift_task_switch(sub_74F50, 0, 0);
}

uint64_t sub_74F50()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[11];
  uint64_t v3 = v0[9];
  uint64_t v4 = (void *)v0[2];
  char v13 = [v4 isStoreAccountManagedAppleID];
  sub_74AD0();
  *(void *)(swift_allocObject() + 16) = v4;
  sub_81774(&qword_EDF98, &qword_EDF70);
  id v5 = v4;
  sub_93DF0();
  sub_81774(&qword_EDFA0, &qword_EDF78);
  sub_93C00();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v2, v3);
  swift_retain();
  swift_retain();
  uint64_t v6 = (void *)swift_task_alloc();
  v0[15] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_75134;
  uint64_t v7 = v0[14];
  uint64_t v8 = v0[5];
  uint64_t v9 = v0[6];
  uint64_t v10 = v0[3];
  uint64_t v11 = v0[4];
  return sub_7EE18(v13, v7, v10, v11, v8, v9);
}

uint64_t sub_75134()
{
  uint64_t v1 = *(void *)(*v0 + 112);
  uint64_t v2 = *(void *)(*v0 + 104);
  uint64_t v3 = *(void *)(*v0 + 96);
  uint64_t v6 = *v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

uint64_t sub_75310(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void v6[5] = a5;
  v6[6] = a6;
  v6[3] = a3;
  void v6[4] = a4;
  v6[2] = a2;
  uint64_t v7 = sub_71350(&qword_EDF38);
  v6[7] = v7;
  v6[8] = *(void *)(v7 - 8);
  v6[9] = swift_task_alloc();
  return _swift_task_switch(sub_753DC, 0, 0);
}

uint64_t sub_753DC()
{
  char v1 = [*(id *)(v0 + 16) isBookStoreAllowed];
  sub_75668();
  swift_retain();
  swift_retain();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_754CC;
  uint64_t v3 = *(void *)(v0 + 72);
  uint64_t v4 = *(void *)(v0 + 40);
  uint64_t v5 = *(void *)(v0 + 48);
  uint64_t v6 = *(void *)(v0 + 24);
  uint64_t v7 = *(void *)(v0 + 32);
  return sub_7F7B8(v1, v3, v6, v7, v4, v5);
}

uint64_t sub_754CC()
{
  uint64_t v1 = *(void *)(*v0 + 72);
  uint64_t v2 = *(void *)(*v0 + 64);
  uint64_t v3 = *(void *)(*v0 + 56);
  uint64_t v6 = *v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

uint64_t sub_75668()
{
  uint64_t v1 = sub_71350((uint64_t *)&unk_EDF60);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_71350((uint64_t *)&unk_EE580);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v19 - v10;
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for AsyncStream.Continuation.BufferingPolicy.unbounded<A>(_:), v1);
  sub_93BA0();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  v12(v9, v11, v5);
  char v13 = (objc_class *)type metadata accessor for RestrictionsObserver();
  uint64_t v14 = (char *)objc_allocWithZone(v13);
  v12(&v14[OBJC_IVAR____TtC9BKLibraryP33_58FC24B0C0DE226ACFC9DF3CB0D6712B20RestrictionsObserver_continuation], v9, v5);
  v19.receiver = v14;
  v19.super_class = v13;
  id v15 = [super init];
  uint64_t v16 = *(void (**)(char *, uint64_t))(v6 + 8);
  v16(v9, v5);
  [v0 addObserver:v15];
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v0;
  *(void *)(v17 + 24) = v15;
  swift_unknownObjectRetain();
  sub_93BB0();
  return ((uint64_t (*)(char *, uint64_t))v16)(v11, v5);
}

uint64_t sub_75918(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[6] = a5;
  v6[7] = a6;
  void v6[4] = a3;
  void v6[5] = a4;
  v6[3] = a2;
  v6[8] = sub_71350(&qword_EDEC0);
  v6[9] = swift_task_alloc();
  uint64_t v8 = sub_71350(&qword_EDEC8);
  v6[10] = v8;
  v6[11] = *(void *)(v8 - 8);
  v6[12] = swift_task_alloc();
  uint64_t v9 = (void *)swift_task_alloc();
  v6[13] = v9;
  void *v9 = v6;
  v9[1] = sub_75A64;
  v9[17] = a2;
  return _swift_task_switch(sub_75F90, 0, 0);
}

uint64_t sub_75A64(char a1)
{
  *(unsigned char *)(*(void *)v1 + 120) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_75B64, 0, 0);
}

uint64_t sub_75B64()
{
  uint64_t v1 = *(void **)(v0 + 24);
  id v2 = [self defaultCenter];
  id v3 = [v1 backingBag];
  uint64_t v4 = sub_93CA0();
  swift_unknownObjectRelease();

  *(void *)(v0 + 16) = v4;
  sub_93C90();
  sub_7CE1C();
  sub_93DF0();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v1;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = &unk_EDEE8;
  *(void *)(v6 + 24) = v5;
  id v7 = v1;
  sub_71350(&qword_EDF00);
  sub_81774(&qword_EDF08, &qword_EDEC0);
  sub_93DF0();
  swift_retain();
  swift_retain();
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 112) = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_75DB8;
  uint64_t v9 = *(void *)(v0 + 96);
  uint64_t v10 = *(void *)(v0 + 48);
  uint64_t v11 = *(void *)(v0 + 56);
  uint64_t v12 = *(void *)(v0 + 32);
  uint64_t v13 = *(void *)(v0 + 40);
  char v14 = *(unsigned char *)(v0 + 120);
  return sub_80158(v14, v9, v12, v13, v10, v11);
}

uint64_t sub_75DB8()
{
  uint64_t v1 = *(void *)(*v0 + 96);
  uint64_t v2 = *(void *)(*v0 + 88);
  uint64_t v3 = *(void *)(*v0 + 80);
  uint64_t v6 = *v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

uint64_t sub_75F70()
{
  *(void *)(v1 + 136) = v0;
  return _swift_task_switch(sub_75F90, 0, 0);
}

uint64_t sub_75F90()
{
  id v1 = [*(id *)(v0 + 136) isBooksStoreEnabled];
  *(void *)(v0 + 144) = v1;
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 120;
  *(void *)(v0 + 24) = sub_760AC;
  uint64_t v2 = swift_continuation_init();
  *(void *)(v0 + 80) = _NSConcreteStackBlock;
  *(void *)(v0 + 8_Block_object_dispose(&STACK[0x380], 8) = 0x40000000;
  *(void *)(v0 + 96) = sub_7A3F0;
  *(void *)(v0 + 104) = &unk_D3C20;
  *(void *)(v0 + 112) = v2;
  [v1 valueWithCompletion:v0 + 80];
  return _swift_continuation_await(v0 + 16);
}

uint64_t sub_760AC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 152) = v1;
  if (v1) {
    uint64_t v2 = sub_76244;
  }
  else {
    uint64_t v2 = sub_761BC;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_761BC()
{
  uint64_t v1 = (void *)v0[18];
  uint64_t v2 = (void *)v0[15];
  id v3 = [v2 BOOLValue];

  uint64_t v4 = (uint64_t (*)(id))v0[1];
  return v4(v3);
}

uint64_t sub_76244()
{
  uint64_t v1 = (void *)v0[18];
  swift_willThrow();

  if (qword_ED9C0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_93940();
  sub_71428(v2, (uint64_t)qword_EF0E8);
  swift_errorRetain();
  swift_errorRetain();
  id v3 = sub_93920();
  os_log_type_t v4 = sub_93C70();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 138412290;
    swift_errorRetain();
    uint64_t v7 = _swift_stdlib_bridgeErrorToNSError();
    v0[10] = v7;
    sub_93CE0();
    *uint64_t v6 = v7;
    swift_errorRelease();
    swift_errorRelease();
    sub_71350(&qword_EDDD8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v8 = (uint64_t (*)(uint64_t))v0[1];
  return v8(2);
}

uint64_t sub_76458(uint64_t a1)
{
  id v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *id v3 = v1;
  v3[1] = sub_81934;
  v3[17] = a1;
  return _swift_task_switch(sub_75F90, 0, 0);
}

uint64_t sub_76504(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)(v3 + 16) = a1;
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  os_log_type_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v4;
  void *v4 = v3;
  v4[1] = sub_765D4;
  return v6();
}

uint64_t sub_765D4(char a1)
{
  uint64_t v3 = *(unsigned char **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();
  *uint64_t v3 = a1;
  os_log_type_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

uint64_t sub_766E4(uint64_t a1, unsigned char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 40) = a5;
  *(void *)(v6 + 4_Block_object_dispose(&STACK[0x380], 8) = a6;
  *(void *)(v6 + 24) = a3;
  *(void *)(v6 + 32) = a4;
  uint64_t v8 = sub_93940();
  *(void *)(v6 + 56) = v8;
  *(void *)(v6 + 64) = *(void *)(v8 - 8);
  *(void *)(v6 + 72) = swift_task_alloc();
  *(unsigned char *)(v6 + 96) = *a2;
  return _swift_task_switch(sub_767B4, 0, 0);
}

uint64_t sub_767B4()
{
  uint64_t v24 = v0;
  if (qword_ED9C0 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v1 = *(void *)(v0 + 72);
  uint64_t v3 = *(void *)(v0 + 56);
  uint64_t v4 = sub_71428(v3, (uint64_t)qword_EF0E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v5 = sub_93920();
  os_log_type_t v6 = sub_93C80();
  if (os_log_type_enabled(v5, v6))
  {
    int v7 = *(unsigned __int8 *)(v0 + 96);
    uint64_t v8 = *(void *)(v0 + 64);
    uint64_t v20 = *(void *)(v0 + 56);
    uint64_t v21 = *(void *)(v0 + 72);
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315138;
    uint64_t v23 = v10;
    uint64_t v11 = 1702195828;
    if ((v7 & 1) == 0) {
      uint64_t v11 = 0x65736C6166;
    }
    unint64_t v12 = 0xE400000000000000;
    if ((v7 & 1) == 0) {
      unint64_t v12 = 0xE500000000000000;
    }
    if (v7 == 2) {
      uint64_t v13 = 7104878;
    }
    else {
      uint64_t v13 = v11;
    }
    if (v7 == 2) {
      unint64_t v14 = 0xE300000000000000;
    }
    else {
      unint64_t v14 = v12;
    }
    *(void *)(v0 + 16) = sub_7B778(v13, v14, &v23);
    sub_93CE0();
    swift_bridgeObjectRelease();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v21, v20);
  }
  else
  {
    uint64_t v16 = *(void *)(v0 + 64);
    uint64_t v15 = *(void *)(v0 + 72);
    uint64_t v17 = *(void *)(v0 + 56);

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
  }
  id v22 = (uint64_t (*)(void))(*(void *)(v0 + 24) + **(int **)(v0 + 24));
  id v18 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v18;
  void *v18 = v0;
  v18[1] = sub_76A7C;
  return v22();
}

uint64_t sub_76A7C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(int **)(*v0 + 40);
  uint64_t v3 = *v0;
  swift_task_dealloc();
  os_log_type_t v6 = (uint64_t (*)(void))((char *)v2 + *v2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 8_Block_object_dispose(&STACK[0x380], 8) = v4;
  void *v4 = v3;
  v4[1] = sub_76C10;
  return v6();
}

uint64_t sub_76C10()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_76D20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_71350(&qword_EDD28);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_7C850(a1, (uint64_t)v8);
  uint64_t v9 = sub_93B90();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_7A354((uint64_t)v8);
    if (*(void *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v11 = sub_93B40();
      uint64_t v13 = v12;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_93B80();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
    if (*(void *)(a3 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v11 = 0;
  uint64_t v13 = 0;
LABEL_6:
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a2;
  *(void *)(v14 + 24) = a3;
  if (v13 | v11)
  {
    v16[0] = 0;
    v16[1] = 0;
    v16[2] = v11;
    v16[3] = v13;
  }
  return swift_task_create();
}

uint64_t PriceTracker.deinit()
{
  if (*(void *)(v0 + 224))
  {
    swift_retain();
    sub_93BE0();
    swift_release();
  }
  sub_76FC4(v0 + 112);
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_release();
  sub_76FEC(*(void *)(v0 + 232));
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_76FC4(uint64_t a1)
{
  return a1;
}

uint64_t sub_76FEC(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t PriceTracker.__deallocating_deinit()
{
  PriceTracker.deinit();

  return _swift_defaultActor_deallocate(v0);
}

uint64_t sub_77028(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 232);
  *(void *)(v2 + 232) = a1;
  *(void *)(v2 + 240) = a2;
  swift_retain();

  return sub_76FEC(v3);
}

uint64_t sub_77074()
{
  v1[7] = v0;
  uint64_t v2 = sub_71350(&qword_EDB88);
  v1[8] = v2;
  v1[9] = *(void *)(v2 - 8);
  v1[10] = swift_task_alloc();
  return _swift_task_switch(sub_77138, v0, 0);
}

uint64_t sub_77138()
{
  uint64_t v2 = *(void *)(v0 + 72);
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v4 = *(void *)(v0 + 56);
  uint64_t v3 = *(void *)(v0 + 64);
  swift_getObjectType();
  sub_93980();
  sub_6FDF8(*(void **)(v4 + 136), v0 + 16);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  sub_7736C(v0 + 16);
  char v5 = *(unsigned char *)(v0 + 16);
  uint64_t v6 = swift_task_alloc();
  *(void *)(v0 + 8_Block_object_dispose(&STACK[0x380], 8) = v6;
  *(void *)uint64_t v6 = v0;
  *(void *)(v6 + _Block_object_dispose(&STACK[0x380], 8) = sub_77254;
  uint64_t v7 = *(void *)(v0 + 56);
  *(void *)(v6 + 16) = v7;
  *(unsigned char *)(v6 + 32) = v5;
  return _swift_task_switch(sub_773BC, v7, 0);
}

uint64_t sub_77254(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_7736C(uint64_t a1)
{
  return a1;
}

uint64_t sub_77398(char a1)
{
  *(void *)(v2 + 16) = v1;
  *(unsigned char *)(v2 + 32) = a1;
  return _swift_task_switch(sub_773BC, v1, 0);
}

uint64_t sub_773BC()
{
  if (*(unsigned char *)(v0 + 32) != 1)
  {
    if (qword_ED9C0 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_93940();
    sub_71428(v7, (uint64_t)qword_EF0E8);
    uint64_t v4 = sub_93920();
    os_log_type_t v5 = sub_93C80();
    if (!os_log_type_enabled(v4, v5)) {
      goto LABEL_25;
    }
    uint64_t v6 = "[PriceTracker] Disabled by remote config";
    goto LABEL_24;
  }
  uint64_t v1 = *(void **)(*(void *)(v0 + 16) + 184);
  id v2 = [v1 activeStoreAccount];

  if (!v2)
  {
    if (qword_ED9C0 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_93940();
    sub_71428(v8, (uint64_t)qword_EF0E8);
    uint64_t v4 = sub_93920();
    os_log_type_t v5 = sub_93C80();
    if (!os_log_type_enabled(v4, v5)) {
      goto LABEL_25;
    }
    uint64_t v6 = "[PriceTracker] Not signed in to store account";
    goto LABEL_24;
  }
  if ([v1 isStoreAccountManagedAppleID])
  {
    if (qword_ED9C0 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_93940();
    sub_71428(v3, (uint64_t)qword_EF0E8);
    uint64_t v4 = sub_93920();
    os_log_type_t v5 = sub_93C80();
    if (!os_log_type_enabled(v4, v5)) {
      goto LABEL_25;
    }
    uint64_t v6 = "[PriceTracker] Store account is managed";
LABEL_24:
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_0, v4, v5, v6, v12, 2u);
    swift_slowDealloc();
LABEL_25:

    uint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
    return v13(0);
  }
  if (![*(id *)(*(void *)(v0 + 16) + 192) isBookStoreAllowed])
  {
    if (qword_ED9C0 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_93940();
    sub_71428(v11, (uint64_t)qword_EF0E8);
    uint64_t v4 = sub_93920();
    os_log_type_t v5 = sub_93C80();
    if (!os_log_type_enabled(v4, v5)) {
      goto LABEL_25;
    }
    uint64_t v6 = "[PriceTracker] Book Store is restricted";
    goto LABEL_24;
  }
  uint64_t v9 = *(void *)(*(void *)(v0 + 16) + 200);
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v10;
  *uint64_t v10 = v0;
  v10[1] = sub_77724;
  v10[17] = v9;
  return _swift_task_switch(sub_75F90, 0, 0);
}

uint64_t sub_77724(char a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 16);
  *(unsigned char *)(*(void *)v1 + 33) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_7783C, v2, 0);
}

uint64_t sub_7783C()
{
  int v1 = *(unsigned __int8 *)(v0 + 33);
  uint64_t v2 = *(void *)(v0 + 16);
  if (v1 != 2)
  {
    *(unsigned char *)(v2 + 20_Block_object_dispose(&STACK[0x380], 8) = v1 & 1;
    if ((v1 & 1) == 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v7 = 1;
    goto LABEL_10;
  }
  if (*(unsigned char *)(v2 + 208)) {
    goto LABEL_9;
  }
LABEL_3:
  if (qword_ED9C0 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_93940();
  sub_71428(v3, (uint64_t)qword_EF0E8);
  uint64_t v4 = sub_93920();
  os_log_type_t v5 = sub_93C80();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_0, v4, v5, "[PriceTracker] Book Store is disabled by bag", v6, 2u);
    swift_slowDealloc();
  }

  uint64_t v7 = 0;
LABEL_10:
  uint64_t v8 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v8(v7);
}

uint64_t sub_77980(char a1)
{
  *(void *)(v2 + 12_Block_object_dispose(&STACK[0x380], 8) = v1;
  *(unsigned char *)(v2 + 184) = a1;
  return _swift_task_switch(sub_779A4, v1, 0);
}

uint64_t sub_779A4()
{
  if ((*(unsigned char *)(v0 + 184) & 1) == 0)
  {
    if (qword_ED9C0 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_93940();
    sub_71428(v1, (uint64_t)qword_EF0E8);
    uint64_t v2 = sub_93920();
    os_log_type_t v3 = sub_93C80();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_0, v2, v3, "[PriceTracker] [updateConfiguration] WARNING: Running without active background task", v4, 2u);
      swift_slowDealloc();
    }
  }
  if (qword_ED9C0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_93940();
  *(void *)(v0 + 136) = sub_71428(v5, (uint64_t)qword_EF0E8);
  uint64_t v6 = sub_93920();
  os_log_type_t v7 = sub_93C80();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_0, v6, v7, "[PriceTracker] [updateConfiguration] Collecting...", v8, 2u);
    swift_slowDealloc();
  }

  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v0 + 144) = v9;
  void *v9 = v0;
  v9[1] = sub_77BAC;
  return sub_782F4();
}

uint64_t sub_77BAC(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 128);
  *(void *)(*(void *)v1 + 152) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_77CC4, v2, 0);
}

uint64_t sub_77CC4()
{
  uint64_t v1 = sub_93920();
  os_log_type_t v2 = sub_93C80();
  if (os_log_type_enabled(v1, v2))
  {
    os_log_type_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v3 = 0;
    _os_log_impl(&dword_0, v1, v2, "[PriceTracker] [updateConfiguration] Sending...", v3, 2u);
    swift_slowDealloc();
  }
  uint64_t v4 = v0[19];
  uint64_t v5 = v0[16];

  uint64_t v6 = *(void **)(v5 + 128);
  if (v4)
  {
    os_log_type_t v7 = (void *)v0[19];
    id v8 = v7;
  }
  else
  {
    id v8 = [self disabledConfig];
    os_log_type_t v7 = 0;
  }
  v0[20] = v7;
  v0[21] = v8;
  v0[2] = v0;
  v0[3] = sub_77E7C;
  uint64_t v9 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_7825C;
  v0[13] = &unk_D3AA0;
  v0[14] = v9;
  id v10 = v7;
  [v6 priceTrackingSetConfiguration:v8 completion:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_77E7C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 176) = v2;
  uint64_t v3 = *(void *)(v1 + 128);
  if (v2) {
    uint64_t v4 = sub_7808C;
  }
  else {
    uint64_t v4 = sub_77F9C;
  }
  return _swift_task_switch(v4, v3, 0);
}

uint64_t sub_77F9C()
{
  uint64_t v1 = sub_93920();
  os_log_type_t v2 = sub_93C80();
  BOOL v3 = os_log_type_enabled(v1, v2);
  uint64_t v4 = *(NSObject **)(v0 + 160);
  if (v3)
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_0, v1, v2, "[PriceTracker] [updateConfiguration] Completed", v5, 2u);
    swift_slowDealloc();
    uint64_t v6 = v1;
  }
  else
  {
    uint64_t v6 = *(NSObject **)(v0 + 160);
    uint64_t v4 = v1;
  }

  os_log_type_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_7808C()
{
  uint64_t v1 = (void *)v0[21];
  os_log_type_t v2 = (void *)v0[20];
  swift_willThrow();

  swift_errorRetain();
  swift_errorRetain();
  BOOL v3 = sub_93920();
  os_log_type_t v4 = sub_93C70();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 138412290;
    swift_errorRetain();
    uint64_t v7 = _swift_stdlib_bridgeErrorToNSError();
    v0[15] = v7;
    sub_93CE0();
    *uint64_t v6 = v7;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v3, v4, "[PriceTracker] [updateConfiguration] Failed: %@", v5, 0xCu);
    sub_71350(&qword_EDDD8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
  id v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_7825C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    sub_71350(&qword_EDDE0);
    uint64_t v4 = swift_allocError();
    *uint64_t v5 = a2;
    id v6 = a2;
    return _swift_continuation_throwingResumeWithError(v2, v4);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    return _swift_continuation_throwingResume(v7);
  }
}

uint64_t sub_782F4()
{
  v1[16] = v0;
  uint64_t v2 = sub_71350(&qword_EDB88);
  v1[17] = v2;
  v1[18] = *(void *)(v2 - 8);
  v1[19] = swift_task_alloc();
  return _swift_task_switch(sub_783B8, v0, 0);
}

uint64_t sub_783B8()
{
  uint64_t v2 = *(void *)(v0 + 144);
  uint64_t v1 = *(void *)(v0 + 152);
  uint64_t v4 = *(void *)(v0 + 128);
  uint64_t v3 = *(void *)(v0 + 136);
  swift_getObjectType();
  sub_93980();
  sub_6FDF8(*(void **)(v4 + 136), v0 + 16);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  char v5 = *(unsigned char *)(v0 + 16);
  uint64_t v6 = swift_task_alloc();
  *(void *)(v0 + 160) = v6;
  *(void *)uint64_t v6 = v0;
  *(void *)(v6 + _Block_object_dispose(&STACK[0x380], 8) = sub_784CC;
  uint64_t v7 = *(void *)(v0 + 128);
  *(void *)(v6 + 16) = v7;
  *(unsigned char *)(v6 + 32) = v5;
  return _swift_task_switch(sub_773BC, v7, 0);
}

uint64_t sub_784CC(char a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 128);
  *(unsigned char *)(*(void *)v1 + 200) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_785E4, v2, 0);
}

uint64_t sub_785E4()
{
  if (*(unsigned char *)(v0 + 200) != 1)
  {
    sub_7736C(v0 + 16);
    if (qword_ED9C0 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_93940();
    sub_71428(v6, (uint64_t)qword_EF0E8);
    uint64_t v7 = sub_93920();
    os_log_type_t v8 = sub_93C80();
    if (!os_log_type_enabled(v7, v8)) {
      goto LABEL_15;
    }
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    uint64_t v10 = "[PriceTracker] [configuration] Tracking is not enabled";
    goto LABEL_14;
  }
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  *(void *)(v0 + 16_Block_object_dispose(&STACK[0x380], 8) = Strong;
  if (Strong)
  {
    uint64_t v2 = *(void *)(*(void *)(v0 + 128) + 120);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 + 8) + **(int **)(v2 + 8));
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 176) = v4;
    void *v4 = v0;
    v4[1] = sub_788A0;
    return v13(201, ObjectType, v2);
  }
  sub_7736C(v0 + 16);
  if (qword_ED9C0 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_93940();
  sub_71428(v11, (uint64_t)qword_EF0E8);
  uint64_t v7 = sub_93920();
  os_log_type_t v8 = sub_93C70();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    uint64_t v10 = "[PriceTracker] [configuration] Missing library manager";
LABEL_14:
    _os_log_impl(&dword_0, v7, v8, v10, v9, 2u);
    swift_slowDealloc();
  }
LABEL_15:

  swift_task_dealloc();
  uint64_t v12 = *(uint64_t (**)(void))(v0 + 8);
  return v12(0);
}

uint64_t sub_788A0(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 128);
  *(void *)(*(void *)v1 + 184) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_789B8, v2, 0);
}

uint64_t sub_789B8()
{
  uint64_t v34 = v0;
  unint64_t v1 = v0[23];
  v0[13] = v1;
  unint64_t v2 = v1 >> 62;
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_93E10();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8));
  }
  if (v3 < 201) {
    goto LABEL_29;
  }
  if (qword_ED9C0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_93940();
  sub_71428(v4, (uint64_t)qword_EF0E8);
  char v5 = sub_93920();
  os_log_type_t v6 = sub_93C80();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 134217984;
    v0[15] = 200;
    sub_93CE0();
    _os_log_impl(&dword_0, v5, v6, "[PriceTracker] [configuration] Tracked item count exceeds limit %ld", v7, 0xCu);
    swift_slowDealloc();
  }

  if (v2)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v30 = sub_93E10();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    uint64_t v31 = sub_93E10();
    uint64_t result = swift_bridgeObjectRelease();
    if (v31 < 0)
    {
      __break(1u);
      return result;
    }
    uint64_t v11 = v0[23];
    if (v30 >= 200) {
      uint64_t v32 = 200;
    }
    else {
      uint64_t v32 = v30;
    }
    if (v30 >= 0) {
      unint64_t v8 = v32;
    }
    else {
      unint64_t v8 = 200;
    }
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_93E10();
    swift_bridgeObjectRelease();
    if (v12 < (uint64_t)v8)
    {
      __break(1u);
      goto LABEL_46;
    }
  }
  else
  {
    if (*(uint64_t *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8)) >= 200) {
      unint64_t v8 = 200;
    }
    else {
      unint64_t v8 = *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8));
    }
    swift_bridgeObjectRetain();
  }
  if ((v1 & 0xC000000000000001) != 0 && v8)
  {
    sub_7C388(0, (unint64_t *)&unk_EDDB8);
    Swift::Int v9 = 0;
    do
    {
      Swift::Int v10 = v9 + 1;
      sub_93D60(v9);
      Swift::Int v9 = v10;
    }
    while (v8 != v10);
  }
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_93E20();
    unint64_t v1 = v13;
    uint64_t v11 = v14;
    unint64_t v8 = v15;
    swift_bridgeObjectRelease_n();
    if (v8) {
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v12 = v1 & 0xFFFFFFFFFFFFFF8;
    unint64_t v1 = (v1 & 0xFFFFFFFFFFFFFF8) + 32;
    unint64_t v8 = (2 * v8) | 1;
    if (v8)
    {
LABEL_22:
      sub_93EC0();
      swift_unknownObjectRetain_n();
      uint64_t v17 = (void *)swift_dynamicCastClass();
      if (!v17)
      {
        swift_unknownObjectRelease();
        uint64_t v17 = &_swiftEmptyArrayStorage;
      }
      uint64_t v18 = v17[2];
      swift_release();
      if (!__OFSUB__(v8 >> 1, v11))
      {
        if (v18 == (v8 >> 1) - v11)
        {
          uint64_t v16 = (void *)swift_dynamicCastClass();
          swift_bridgeObjectRelease();
          if (!v16)
          {
            swift_unknownObjectRelease();
            uint64_t v16 = &_swiftEmptyArrayStorage;
          }
          goto LABEL_28;
        }
        goto LABEL_47;
      }
LABEL_46:
      __break(1u);
LABEL_47:
      swift_unknownObjectRelease();
    }
  }
  uint64_t v16 = sub_7BDD0(v12, v1, v11, v8);
  swift_bridgeObjectRelease();
LABEL_28:
  swift_unknownObjectRelease();
  v0[13] = v16;
LABEL_29:
  if (qword_ED9C0 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_93940();
  sub_71428(v19, (uint64_t)qword_EF0E8);
  uint64_t v20 = sub_93920();
  os_log_type_t v21 = sub_93C80();
  if (os_log_type_enabled(v20, v21))
  {
    id v22 = (uint8_t *)swift_slowAlloc();
    uint64_t v33 = swift_slowAlloc();
    *(_DWORD *)id v22 = 136315138;
    swift_beginAccess();
    sub_7C388(0, (unint64_t *)&unk_EDDB8);
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_93B00();
    unint64_t v25 = v24;
    swift_bridgeObjectRelease();
    v0[14] = sub_7B778(v23, v25, &v33);
    sub_93CE0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v20, v21, "[PriceTracker] [configuration] Tracked items: %s", v22, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v26 = *(void *)(v0[16] + 160);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v28 = (void *)swift_task_alloc();
  v0[24] = v28;
  *uint64_t v28 = v0;
  v28[1] = sub_78F5C;
  return sub_8AFF0(ObjectType, v26);
}

uint64_t sub_78F5C(char a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 128);
  *(unsigned char *)(*(void *)v1 + 201) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_79074, v2, 0);
}

uint64_t sub_79074()
{
  int v1 = *(unsigned __int8 *)(v0 + 201);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_7B74C(v0 + 16);
  v2.super.super.Class isa = sub_93C10().super.super.isa;
  v3.super.super.Class isa = sub_93C10().super.super.isa;
  id v4 = 0;
  if (v1 == 1) {
    id v4 = sub_8D780();
  }
  Class isa = sub_93C50().super.super.isa;
  id v6 = objc_allocWithZone((Class)BDSDistributedPriceTrackingConfig);
  sub_7C388(0, (unint64_t *)&unk_EDDB8);
  Class v7 = sub_93AE0().super.isa;
  swift_bridgeObjectRelease();
  sub_7C388(0, (unint64_t *)&qword_EDB90);
  Class v8 = sub_93AE0().super.isa;
  sub_7736C(v0 + 16);
  id v9 = [v6 initWithItemIDs:v7 updateScheduleSteps:v8 dealAbsoluteThreshold:v2.super.super.isa dealRelativeThreshold:v3.super.super.isa notification:v4 cardLimit:isa];

  swift_unknownObjectRelease();
  sub_7736C(v0 + 16);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  Swift::Int v10 = *(uint64_t (**)(id))(v0 + 8);
  return v10(v9);
}

uint64_t sub_79244()
{
  v1[7] = v0;
  uint64_t v2 = sub_71350(&qword_EDB88);
  v1[8] = v2;
  v1[9] = *(void *)(v2 - 8);
  v1[10] = swift_task_alloc();
  return _swift_task_switch(sub_79308, v0, 0);
}

uint64_t sub_79308()
{
  uint64_t v2 = *(void *)(v0 + 72);
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v4 = *(void *)(v0 + 56);
  uint64_t v3 = *(void *)(v0 + 64);
  swift_getObjectType();
  sub_93980();
  sub_6FDF8(*(void **)(v4 + 136), v0 + 16);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  sub_7736C(v0 + 16);
  char v5 = *(unsigned char *)(v0 + 16);
  uint64_t v6 = swift_task_alloc();
  *(void *)(v0 + 8_Block_object_dispose(&STACK[0x380], 8) = v6;
  *(void *)uint64_t v6 = v0;
  *(void *)(v6 + _Block_object_dispose(&STACK[0x380], 8) = sub_79424;
  uint64_t v7 = *(void *)(v0 + 56);
  *(void *)(v6 + 16) = v7;
  *(unsigned char *)(v6 + 32) = v5;
  return _swift_task_switch(sub_773BC, v7, 0);
}

uint64_t sub_79424(char a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 56);
  *(unsigned char *)(*(void *)v1 + 96) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_7953C, v2, 0);
}

uint64_t sub_7953C()
{
  if (*(unsigned char *)(v0 + 96) == 1
    && (id v1 = [*(id *)(*(void *)(v0 + 56) + 144) stringForKey:BDSPriceTrackerCardList]) != 0)
  {
    uint64_t v2 = v1;
    uint64_t v3 = sub_93A60();
    unint64_t v5 = v4;
  }
  else
  {
    uint64_t v3 = 0;
    unint64_t v5 = 0xE000000000000000;
  }
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(uint64_t, unint64_t))(v0 + 8);
  return v6(v3, v5);
}

uint64_t sub_79604()
{
  *(void *)(v1 + 16) = v0;
  return _swift_task_switch(sub_79624, v0, 0);
}

uint64_t sub_79624()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) + 160);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_796D4;
  return sub_8AFF0(ObjectType, v1);
}

uint64_t sub_796D4(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_797D0(char a1)
{
  *(void *)(v2 + 16) = v1;
  *(unsigned char *)(v2 + 32) = a1;
  return _swift_task_switch(sub_797F4, v1, 0);
}

uint64_t sub_797F4()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) + 160);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_798AC;
  uint64_t v4 = *(unsigned __int8 *)(v0 + 32);
  return sub_8B3F4(v4, ObjectType, v1);
}

uint64_t sub_798AC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

id sub_799A0()
{
  uint64_t v1 = *(void **)(v0 + 136);
  NSString v2 = sub_93A30();
  id v3 = [v1 BOOLForKey:v2];

  return v3;
}

uint64_t sub_79A00()
{
  *(void *)(v1 + 16) = v0;
  return _swift_task_switch(sub_79A20, v0, 0);
}

uint64_t sub_79A20()
{
  uint64_t v1 = *(void **)(*(void *)(v0 + 16) + 136);
  NSString v2 = sub_93A30();
  [v1 setBool:1 forKey:v2];

  id v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

void PriceTracker.__allocating_init()()
{
}

void PriceTracker.init()()
{
}

uint64_t PriceTracker.unownedExecutor.getter()
{
  return v0;
}

void *PriceTracker.__allocating_init(libraryManager:bdsPriceTracker:)(void *a1, uint64_t a2)
{
  return PriceTracker.init(libraryManager:bdsPriceTracker:)(a1, a2);
}

void *PriceTracker.init(libraryManager:bdsPriceTracker:)(void *a1, uint64_t a2)
{
  id v3 = [self standardUserDefaults];
  id v4 = [self books];
  id v5 = [v4 userDefaults];

  sub_93A10();
  uint64_t v6 = sub_93A00();
  sub_93970();
  uint64_t v7 = (void *)sub_93960();
  id v8 = [self sharedProvider];
  id v9 = [self sharedInstance];
  id v10 = [self nonisolatedSharedApplication];
  id v11 = [self defaultBag];
  type metadata accessor for PriceTracker();
  swift_allocObject();
  uint64_t v12 = sub_71938(a1, a2, v3, v5, v6, v7, v8, (uint64_t)v9, v10, v11);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v12;
}

uint64_t type metadata accessor for PriceTracker()
{
  return self;
}

Swift::Void __swiftcall PriceTracker.objc_setNeedsConfigurationUpdate()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_71350(&qword_EDD28);
  __chkstk_darwin(v2 - 8);
  id v4 = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_93B90();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  void v7[4] = v1;
  int v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  swift_retain();
  if (v8 == 1)
  {
    sub_7A354((uint64_t)v4);
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  else
  {
    sub_93B80();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
    if (v7[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v9 = sub_93B40();
      uint64_t v10 = v11;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v10 = 0;
    }
  }
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = &unk_EDD38;
  *(void *)(v12 + 24) = v7;
  if (v10 | v9)
  {
    v13[0] = 0;
    v13[1] = 0;
    v13[2] = v9;
    v13[3] = v10;
  }
  swift_task_create();
  swift_release();
}

uint64_t sub_7A03C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return _swift_task_switch(sub_7A05C, a4, 0);
}

uint64_t sub_7A05C()
{
  [*(id *)(*(void *)(v0 + 16) + 216) signal];
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_7A0C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_93B90();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_93B80();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_7A354(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_93B40();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_7A26C()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_7A2AC()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_81938;
  v3[2] = v2;
  return _swift_task_switch(sub_7A05C, v2, 0);
}

uint64_t sub_7A354(uint64_t a1)
{
  uint64_t v2 = sub_71350(&qword_EDD28);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_7A3F0(uint64_t a1, void *a2, char a3, void *a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (a4)
  {
    sub_71350(&qword_EDDE0);
    uint64_t v6 = swift_allocError();
    void *v7 = a4;
    id v8 = a4;
    return _swift_continuation_throwingResumeWithError(v4, v6);
  }
  else
  {
    if (a2)
    {
      uint64_t v9 = *(void *)(*(void *)(v4 + 64) + 40);
      *(void *)uint64_t v9 = a2;
      *(unsigned char *)(v9 + _Block_object_dispose(&STACK[0x380], 8) = a3;
      id v10 = a2;
      a1 = v4;
    }
    else
    {
      __break(1u);
    }
    return _swift_continuation_throwingResume(a1);
  }
}

uint64_t sub_7A4B4(uint64_t a1)
{
  *(void *)(v1 + 40) = a1;
  return _swift_task_switch(sub_7A4D4, 0, 0);
}

uint64_t sub_7A4D4()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  v0[6] = Strong;
  if (Strong)
  {
    uint64_t v5 = (uint64_t (__cdecl *)())((char *)&dword_EE050 + dword_EE050);
    uint64_t v2 = (void *)swift_task_alloc();
    v0[7] = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_7A5D4;
    return v5();
  }
  else
  {
    uint64_t v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
}

uint64_t sub_7A5D4(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  swift_release();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_7A6EC(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)(v3 + 16) = a1;
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v4;
  void *v4 = v3;
  v4[1] = sub_765D4;
  return v6();
}

uint64_t sub_7A7BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[7] = v10;
  v8[8] = v11;
  void v8[5] = a7;
  v8[6] = a8;
  v8[3] = a5;
  void v8[4] = a6;
  id v8[2] = a4;
  return _swift_task_switch(sub_7A7F0, 0, 0);
}

uint64_t sub_7A7F0()
{
  uint64_t v2 = v0[2];
  uint64_t v1 = (void *)v0[3];
  sub_93D40(24);
  swift_bridgeObjectRelease();
  v12._countAndFlagsBits = v2;
  v12._object = v1;
  sub_93AB0(v12);
  v0[9] = 0x80000000000B5050;
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_EE408
                                                                                              + dword_EE408);
  swift_retain();
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[10] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_7A924;
  uint64_t v4 = v0[7];
  uint64_t v5 = v0[8];
  uint64_t v6 = v0[5];
  uint64_t v7 = v0[6];
  uint64_t v8 = v0[4];
  return v10(0xD000000000000016, 0x80000000000B5050, v8, v6, v7, v4, v5);
}

uint64_t sub_7A924()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

id sub_7AA74(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)((unint64_t)a1 >> 62);
  if ((unint64_t)a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_93E10();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  }
  if ((unint64_t)a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_93E10();
    swift_bridgeObjectRelease();
    if (v6 == v22) {
      goto LABEL_5;
    }
    return 0;
  }
  if (v6 != *(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFFF8))) {
    return 0;
  }
LABEL_5:
  if (!v6) {
    return &dword_0 + 1;
  }
  uint64_t v7 = a1 & 0xFFFFFFFFFFFFFF8;
  uint64_t v8 = (a1 & 0xFFFFFFFFFFFFFF8) + 32;
  if (a1 < 0) {
    uint64_t v7 = a1;
  }
  if (v5) {
    uint64_t v8 = v7;
  }
  uint64_t v9 = a2 & 0xFFFFFFFFFFFFFF8;
  uint64_t v10 = (a2 & 0xFFFFFFFFFFFFFF8) + 32;
  if (a2 < 0) {
    uint64_t v9 = a2;
  }
  if ((unint64_t)a2 >> 62) {
    uint64_t v10 = v9;
  }
  if (v8 == v10) {
    return &dword_0 + 1;
  }
  if (v6 < 0)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  unint64_t v23 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
LABEL_42:
    id result = (id)sub_93D70();
    goto LABEL_19;
  }
  if (!*(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8)))
  {
    __break(1u);
    goto LABEL_44;
  }
  id result = *(id *)(a1 + 32);
LABEL_19:
  uint64_t v5 = result;
  unint64_t v2 = a2 & 0xC000000000000001;
  if ((a2 & 0xC000000000000001) != 0)
  {
LABEL_44:
    id v12 = (id)sub_93D70();
LABEL_22:
    unint64_t v13 = v12;
    sub_7C388(0, (unint64_t *)&qword_EDB90);
    char v14 = sub_93CD0();

    if (v14)
    {
      uint64_t v15 = 1 - v6;
      for (uint64_t i = 5; ; ++i)
      {
        uint64_t v6 = v15 + i == 5;
        if (v15 + i == 5) {
          return (id)v6;
        }
        unint64_t v20 = i - 4;
        if (v23)
        {
          id v21 = (id)sub_93D70();
          if (v2) {
            goto LABEL_24;
          }
        }
        else
        {
          if (v20 >= *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8)))
          {
            __break(1u);
LABEL_40:
            __break(1u);
            goto LABEL_41;
          }
          id v21 = *(id *)(a1 + 8 * i);
          if (v2)
          {
LABEL_24:
            id v17 = (id)sub_93D70();
            goto LABEL_25;
          }
        }
        if (v20 >= *(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFFF8))) {
          goto LABEL_40;
        }
        id v17 = *(id *)(a2 + 8 * i);
LABEL_25:
        uint64_t v18 = v17;
        char v19 = sub_93CD0();

        if ((v19 & 1) == 0) {
          return (id)v6;
        }
      }
    }
    return 0;
  }
  if (*(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFFF8)))
  {
    id v12 = *(id *)(a2 + 32);
    goto LABEL_22;
  }
  __break(1u);
  return result;
}

uint64_t sub_7ACF4(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_7ADD0;
  return v6(a1);
}

uint64_t sub_7ADD0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_7AEC8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_81938;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_EDD40 + dword_EDD40);
  return v6(a1, v4);
}

void sub_7AF80(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *(void **)(*(void *)a1 + 136);
  NSString v4 = sub_93A30();
  LOBYTE(v3) = [v3 BOOLForKey:v4];

  *a2 = (_BYTE)v3;
}

void sub_7AFF0(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *(void **)(*(void *)a2 + 136);
  id v4 = sub_93A30();
  [v3 setBool:v2 forKey:v4];
}

uint64_t method lookup function for PriceTracker(uint64_t a1, uint64_t a2)
{
  return _swift_lookUpClassMethod(a1, a2, &nominal type descriptor for PriceTracker);
}

uint64_t dispatch thunk of PriceTracker.setStateChangeHandler(_:)()
{
  return (*(uint64_t (**)(void))((char *)&stru_108.flags + (swift_isaMask & *v0)))();
}

uint64_t dispatch thunk of PriceTracker.featureEnabled.getter()
{
  id v4 = (uint64_t (*)(void))(*(void *)((char *)&stru_108.reserved2 + (swift_isaMask & *v0))
                         + **(int **)((char *)&stru_108.reserved2 + (swift_isaMask & *v0)));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_81934;
  return v4();
}

uint64_t dispatch thunk of PriceTracker.cardListString.getter()
{
  id v4 = (uint64_t (*)(void))(*(uint64_t *)((char *)&stru_158.size + (swift_isaMask & *v0))
                         + **(int **)((char *)&stru_158.size + (swift_isaMask & *v0)));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_7B2D8;
  return v4();
}

uint64_t sub_7B2D8(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *v2;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
  return v5(a1, a2);
}

uint64_t dispatch thunk of PriceTracker.notificationsEnabled.getter()
{
  id v4 = (uint64_t (*)(void))(*(void *)((char *)&stru_158.offset + (swift_isaMask & *v0))
                         + **(int **)((char *)&stru_158.offset + (swift_isaMask & *v0)));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_81934;
  return v4();
}

uint64_t dispatch thunk of PriceTracker.setNotificationsEnabled(_:)(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)((char *)&stru_158.reloff + (swift_isaMask & *v1))
                                       + **(int **)((char *)&stru_158.reloff + (swift_isaMask & *v1)));
  id v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_81938;
  return v6(a1);
}

uint64_t dispatch thunk of PriceTracker.hasShownOptInAlert.getter()
{
  return (*(uint64_t (**)(void))((char *)&stru_158.flags + (swift_isaMask & *v0)))();
}

uint64_t dispatch thunk of PriceTracker.didShowOptInAlert()()
{
  id v4 = (uint64_t (*)(void))(*(void *)&stru_1A8.segname[(swift_isaMask & *v0) - 8]
                         + **(int **)&stru_1A8.segname[(swift_isaMask & *v0) - 8]);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_81938;
  return v4();
}

uint64_t sub_7B74C(uint64_t a1)
{
  return a1;
}

uint64_t sub_7B778(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_7B84C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_7C27C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_7C27C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_7C22C((uint64_t)v12);
  return v7;
}

uint64_t sub_7B84C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_93CF0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_7BA08(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_93D90();
  if (!v8)
  {
    sub_93E00();
    __break(1u);
LABEL_17:
    uint64_t result = sub_93E60();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_7BA08(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_7BAA0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_7BC80(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_7BC80(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_7BAA0(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_7BC18(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_93D50();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_93E00();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_93AC0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_93E60();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_93E00();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_7BC18(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_71350(&qword_EDDD0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_7BC80(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_71350(&qword_EDDD0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_93E60();
  __break(1u);
  return result;
}

void *sub_7BDD0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (!v5) {
      return &_swiftEmptyArrayStorage;
    }
    uint64_t v8 = v5;
    if (v5 <= 0)
    {
      int64_t v9 = &_swiftEmptyArrayStorage;
      if (v4 != a3)
      {
LABEL_7:
        if (v5 < 0) {
          goto LABEL_19;
        }
        unint64_t v12 = a2 + 8 * a3;
        if (v12 < (unint64_t)&v9[v8 + 4] && (unint64_t)(v9 + 4) < v12 + v8 * 8) {
          goto LABEL_19;
        }
        sub_7C388(0, (unint64_t *)&unk_EDDB8);
        swift_arrayInitWithCopy();
        return v9;
      }
    }
    else
    {
      sub_71350(&qword_EDDC8);
      int64_t v9 = (void *)swift_allocObject();
      int64_t v10 = j__malloc_size(v9);
      uint64_t v11 = v10 - 32;
      if (v10 < 32) {
        uint64_t v11 = v10 - 25;
      }
      v9[2] = v5;
      v9[3] = (2 * (v11 >> 3)) | 1;
      if (v4 != a3) {
        goto LABEL_7;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_19:
  uint64_t result = (void *)sub_93E60();
  __break(1u);
  return result;
}

uint64_t sub_7BF64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = a3;
  return _swift_task_switch(sub_7BF84, 0, 0);
}

uint64_t sub_7BF84()
{
  uint64_t v1 = *(unsigned char **)(v0 + 16);
  *uint64_t v1 = [*(id *)(v0 + 24) isStoreAccountManagedAppleID];
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_7BFF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void **a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14 = sub_71350(&qword_EDD28);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v17 = *a5;
  uint64_t v18 = sub_93B90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v16, 1, 1, v18);
  char v19 = (void *)swift_allocObject();
  void v19[2] = 0;
  v19[3] = 0;
  void v19[4] = a3;
  void v19[5] = a4;
  v19[6] = v17;
  v19[7] = a6;
  v19[8] = a7;
  v19[9] = a1;
  v19[10] = a2;
  swift_bridgeObjectRetain();
  id v20 = v17;
  swift_retain();
  swift_retain();
  sub_7A0C8((uint64_t)v16, (uint64_t)&unk_EE0C8, (uint64_t)v19);
  return swift_release();
}

uint64_t sub_7C144(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13 = *a6;
  uint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v8 + 16) = v14;
  void *v14 = v8;
  v14[7] = v17;
  v14[8] = v18;
  void v14[5] = a7;
  v14[6] = a8;
  v14[3] = a5;
  void v14[4] = v13;
  v14[1] = sub_81938;
  void v14[2] = a4;
  return _swift_task_switch(sub_7A7F0, 0, 0);
}

uint64_t sub_7C22C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_7C27C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_7C2D8(char a1)
{
  uint64_t v4 = swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + _Block_object_dispose(&STACK[0x380], 8) = sub_81938;
  *(void *)(v4 + 40) = v1;
  *(unsigned char *)(v4 + 64) = a1;
  return _swift_task_switch(sub_71E64, 0, 0);
}

uint64_t sub_7C388(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_7C3CC()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_7C474;
  v2[5] = v0;
  return _swift_task_switch(sub_720B0, 0, 0);
}

uint64_t sub_7C474()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_7C56C()
{
  swift_bridgeObjectRelease();

  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_7C5B4(uint64_t a1, uint64_t a2)
{
  return sub_7BFF0(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), (void **)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48));
}

uint64_t sub_7C5C4()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_81938;
  v2[5] = v0;
  return _swift_task_switch(sub_724E0, 0, 0);
}

uint64_t sub_7C66C()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_81938;
  v3[2] = v2;
  return _swift_task_switch(sub_72630, 0, 0);
}

uint64_t sub_7C714()
{
  swift_unknownObjectRelease();

  swift_release();
  swift_release();
  swift_release();

  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 112, 7);
}

uint64_t sub_7C78C()
{
  uint64_t v2 = swift_task_alloc();
  long long v3 = v0[2];
  long long v4 = v0[3];
  long long v5 = v0[4];
  long long v6 = v0[5];
  long long v7 = v0[6];
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + _Block_object_dispose(&STACK[0x380], 8) = sub_81938;
  *(_OWORD *)(v2 + 4584) = v6;
  *(_OWORD *)(v2 + 4600) = v7;
  *(_OWORD *)(v2 + 4552) = v4;
  *(_OWORD *)(v2 + 456_Block_object_dispose(&STACK[0x380], 8) = v5;
  *(_OWORD *)(v2 + 4536) = v3;
  return _swift_task_switch(sub_726E0, 0, 0);
}

uint64_t sub_7C850(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_71350(&qword_EDD28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_7C8B8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  long long v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_81938;
  return sub_72E38(a1, v4, v5, v6);
}

uint64_t sub_7C96C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_7C474;
  return sub_731A8(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_7CA34(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_81938;
  return sub_73B68(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_7CAFC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_81938;
  return sub_746AC(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_7CBC4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_81938;
  return sub_74DF0(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_7CC8C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_81938;
  return sub_75310(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_7CD54(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_81938;
  return sub_75918(a1, v4, v5, v6, v7, v8);
}

unint64_t sub_7CE1C()
{
  unint64_t result = qword_EDED8;
  if (!qword_EDED8)
  {
    sub_93C90();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_EDED8);
  }
  return result;
}

uint64_t sub_7CE74()
{
  uint64_t v2 = *(void *)(v0 + 16);
  long long v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *long long v3 = v1;
  v3[1] = sub_7CF08;
  return sub_76458(v2);
}

uint64_t sub_7CF08(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  long long v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_7D004()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_7D03C(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)(v2 + 16);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_81938;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_EDEF0 + dword_EDEF0);
  return v8(a1, a2, v6);
}

uint64_t sub_7D104(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_7D14C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[7] = a4;
  v5[8] = a5;
  void v5[5] = a2;
  void v5[6] = a3;
  void v5[4] = a1;
  uint64_t v6 = sub_71350(&qword_EE098);
  v5[9] = v6;
  v5[10] = *(void *)(v6 - 8);
  v5[11] = swift_task_alloc();
  uint64_t v7 = sub_71350(&qword_EE0A8);
  v5[12] = v7;
  v5[13] = *(void *)(v7 - 8);
  v5[14] = swift_task_alloc();
  return _swift_task_switch(sub_7D278, 0, 0);
}

uint64_t sub_7D278()
{
  (*(void (**)(void, void, void))(*(void *)(v0 + 80) + 16))(*(void *)(v0 + 88), *(void *)(v0 + 48), *(void *)(v0 + 72));
  sub_81774(&qword_EE0B0, &qword_EE098);
  swift_bridgeObjectRetain();
  sub_93BF0();
  *(_OWORD *)(v0 + 120) = *(_OWORD *)(v0 + 32);
  sub_81774(&qword_EE0B8, &qword_EE0A8);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 136) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_7D3E0;
  return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v0 + 16, 0, 0);
}

uint64_t sub_7D3E0()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_7D4DC, 0, 0);
}

uint64_t sub_7D4DC()
{
  uint64_t v18 = v0;
  uint64_t v2 = v0[2];
  uint64_t v1 = v0[3];
  v0[18] = v2;
  v0[19] = v1;
  uint64_t v3 = v0[16];
  if (v1 == 1)
  {
    (*(void (**)(void, void))(v0[13] + 8))(v0[14], v0[12]);
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
  if (v3)
  {
    if (v1)
    {
      BOOL v6 = v3 == v1 && v0[15] == v2;
      if (v6 || (sub_93EB0() & 1) != 0)
      {
        sub_817B8(v2, v1);
LABEL_15:
        sub_81774(&qword_EE0B8, &qword_EE0A8);
        uint64_t v7 = (void *)swift_task_alloc();
        v0[17] = v7;
        void *v7 = v0;
        v7[1] = sub_7D3E0;
        return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v0 + 2, 0, 0);
      }
    }
    swift_bridgeObjectRelease();
  }
  else if (!v1)
  {
    sub_817B8(v2, 0);
    v0[16] = 0;
    goto LABEL_15;
  }
  uint64_t v8 = qword_ED9C0;
  swift_bridgeObjectRetain();
  if (v8 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_93940();
  sub_71428(v9, (uint64_t)qword_EF0E8);
  swift_bridgeObjectRetain_n();
  uint64_t v10 = sub_93920();
  os_log_type_t v11 = sub_93C80();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315138;
    if (v1) {
      uint64_t v13 = v2;
    }
    else {
      uint64_t v13 = 0;
    }
    if (v1) {
      unint64_t v14 = v1;
    }
    else {
      unint64_t v14 = 0xE000000000000000;
    }
    swift_bridgeObjectRetain();
    *(void *)(v12 + 4) = sub_7B778(v13, v14, &v17);
    swift_bridgeObjectRelease();
    sub_817B8(v2, v1);
    sub_817B8(v2, v1);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    sub_817B8(v2, v1);
    sub_817B8(v2, v1);
  }

  uint64_t v16 = (uint64_t (*)(void))(v0[7] + *(int *)v0[7]);
  uint64_t v15 = (void *)swift_task_alloc();
  v0[20] = v15;
  void *v15 = v0;
  v15[1] = sub_7D8E8;
  return v16();
}

uint64_t sub_7D8E8()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_7D9E4, 0, 0);
}

uint64_t sub_7D9E4()
{
  sub_817B8(*(void *)(v0 + 144), *(void *)(v0 + 152));
  *(_OWORD *)(v0 + 120) = *(_OWORD *)(v0 + 144);
  sub_81774(&qword_EE0B8, &qword_EE0A8);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 136) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_7D3E0;
  return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v0 + 16, 0, 0);
}

uint64_t sub_7DAD8(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 40) = a5;
  *(void *)(v6 + 4_Block_object_dispose(&STACK[0x380], 8) = a6;
  *(void *)(v6 + 24) = a3;
  *(void *)(v6 + 32) = a4;
  *(void *)(v6 + 16) = a2;
  *(unsigned char *)(v6 + 129) = a1;
  uint64_t v7 = sub_71350(&qword_EE048);
  *(void *)(v6 + 56) = v7;
  *(void *)(v6 + 64) = *(void *)(v7 - 8);
  *(void *)(v6 + 72) = swift_task_alloc();
  uint64_t v8 = sub_71350(&qword_EE080);
  *(void *)(v6 + 80) = v8;
  *(void *)(v6 + 8_Block_object_dispose(&STACK[0x380], 8) = *(void *)(v8 - 8);
  *(void *)(v6 + 96) = swift_task_alloc();
  return _swift_task_switch(sub_7DC08, 0, 0);
}

uint64_t sub_7DC08()
{
  (*(void (**)(void, void, void))(*(void *)(v0 + 64) + 16))(*(void *)(v0 + 72), *(void *)(v0 + 16), *(void *)(v0 + 56));
  sub_81774(&qword_EE088, &qword_EE048);
  sub_93BF0();
  *(unsigned char *)(v0 + 130) = *(unsigned char *)(v0 + 129);
  sub_81774(&qword_EE090, &qword_EE080);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 104) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_7DD5C;
  return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v0 + 128, 0, 0);
}

uint64_t sub_7DD5C()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_7DE58, 0, 0);
}

uint64_t sub_7DE58()
{
  int v1 = *(unsigned __int8 *)(v0 + 128);
  *(unsigned char *)(v0 + 131) = v1;
  if (v1 == 2)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 88) + 8))(*(void *)(v0 + 96), *(void *)(v0 + 80));
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2();
  }
  else if ((v1 ^ *(unsigned __int8 *)(v0 + 130)))
  {
    if (qword_ED9C0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_93940();
    sub_71428(v4, (uint64_t)qword_EF0E8);
    uint64_t v5 = sub_93920();
    os_log_type_t v6 = sub_93C80();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 67109120;
      *(_DWORD *)(v7 + 4) = v1 & 1;
      swift_slowDealloc();
    }
    uint64_t v8 = *(int **)(v0 + 24);

    os_log_type_t v11 = (uint64_t (*)(void))((char *)v8 + *v8);
    uint64_t v9 = (void *)swift_task_alloc();
    *(void *)(v0 + 112) = v9;
    void *v9 = v0;
    v9[1] = sub_7E134;
    return v11();
  }
  else
  {
    sub_81774(&qword_EE090, &qword_EE080);
    uint64_t v10 = (void *)swift_task_alloc();
    *(void *)(v0 + 104) = v10;
    *uint64_t v10 = v0;
    v10[1] = sub_7DD5C;
    return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v0 + 128, 0, 0);
  }
}

uint64_t sub_7E134()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(int **)(*v0 + 40);
  uint64_t v3 = *v0;
  swift_task_dealloc();
  os_log_type_t v6 = (uint64_t (*)(void))((char *)v2 + *v2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 120) = v4;
  void *v4 = v3;
  v4[1] = sub_7E2C8;
  return v6();
}

uint64_t sub_7E2C8()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  swift_task_dealloc();
  *(unsigned char *)(v1 + 130) = *(unsigned char *)(v1 + 131) & 1;
  sub_81774(&qword_EE090, &qword_EE080);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 104) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_7DD5C;
  return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v1 + 128, 0, 0);
}

uint64_t sub_7E478(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 40) = a5;
  *(void *)(v6 + 4_Block_object_dispose(&STACK[0x380], 8) = a6;
  *(void *)(v6 + 24) = a3;
  *(void *)(v6 + 32) = a4;
  *(void *)(v6 + 16) = a2;
  *(unsigned char *)(v6 + 129) = a1;
  uint64_t v7 = sub_71350(&qword_EDF78);
  *(void *)(v6 + 56) = v7;
  *(void *)(v6 + 64) = *(void *)(v7 - 8);
  *(void *)(v6 + 72) = swift_task_alloc();
  uint64_t v8 = sub_71350(&qword_EDFF0);
  *(void *)(v6 + 80) = v8;
  *(void *)(v6 + 8_Block_object_dispose(&STACK[0x380], 8) = *(void *)(v8 - 8);
  *(void *)(v6 + 96) = swift_task_alloc();
  return _swift_task_switch(sub_7E5A8, 0, 0);
}

uint64_t sub_7E5A8()
{
  (*(void (**)(void, void, void))(*(void *)(v0 + 64) + 16))(*(void *)(v0 + 72), *(void *)(v0 + 16), *(void *)(v0 + 56));
  sub_81774(&qword_EDFA0, &qword_EDF78);
  sub_93BF0();
  *(unsigned char *)(v0 + 130) = *(unsigned char *)(v0 + 129);
  sub_81774(&qword_EDFF8, &qword_EDFF0);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 104) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_7E6FC;
  return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v0 + 128, 0, 0);
}

uint64_t sub_7E6FC()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_7E7F8, 0, 0);
}

uint64_t sub_7E7F8()
{
  int v1 = *(unsigned __int8 *)(v0 + 128);
  *(unsigned char *)(v0 + 131) = v1;
  if (v1 == 2)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 88) + 8))(*(void *)(v0 + 96), *(void *)(v0 + 80));
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2();
  }
  else if ((v1 ^ *(unsigned __int8 *)(v0 + 130)))
  {
    if (qword_ED9C0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_93940();
    sub_71428(v4, (uint64_t)qword_EF0E8);
    uint64_t v5 = sub_93920();
    os_log_type_t v6 = sub_93C80();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 67109120;
      *(_DWORD *)(v7 + 4) = v1 & 1;
      swift_slowDealloc();
    }
    uint64_t v8 = *(int **)(v0 + 24);

    os_log_type_t v11 = (uint64_t (*)(void))((char *)v8 + *v8);
    uint64_t v9 = (void *)swift_task_alloc();
    *(void *)(v0 + 112) = v9;
    void *v9 = v0;
    v9[1] = sub_7EAD4;
    return v11();
  }
  else
  {
    sub_81774(&qword_EDFF8, &qword_EDFF0);
    uint64_t v10 = (void *)swift_task_alloc();
    *(void *)(v0 + 104) = v10;
    *uint64_t v10 = v0;
    v10[1] = sub_7E6FC;
    return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v0 + 128, 0, 0);
  }
}

uint64_t sub_7EAD4()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(int **)(*v0 + 40);
  uint64_t v3 = *v0;
  swift_task_dealloc();
  os_log_type_t v6 = (uint64_t (*)(void))((char *)v2 + *v2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 120) = v4;
  void *v4 = v3;
  v4[1] = sub_7EC68;
  return v6();
}

uint64_t sub_7EC68()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  swift_task_dealloc();
  *(unsigned char *)(v1 + 130) = *(unsigned char *)(v1 + 131) & 1;
  sub_81774(&qword_EDFF8, &qword_EDFF0);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 104) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_7E6FC;
  return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v1 + 128, 0, 0);
}

uint64_t sub_7EE18(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 40) = a5;
  *(void *)(v6 + 4_Block_object_dispose(&STACK[0x380], 8) = a6;
  *(void *)(v6 + 24) = a3;
  *(void *)(v6 + 32) = a4;
  *(void *)(v6 + 16) = a2;
  *(unsigned char *)(v6 + 129) = a1;
  uint64_t v7 = sub_71350(&qword_EDF80);
  *(void *)(v6 + 56) = v7;
  *(void *)(v6 + 64) = *(void *)(v7 - 8);
  *(void *)(v6 + 72) = swift_task_alloc();
  uint64_t v8 = sub_71350(&qword_EDFB0);
  *(void *)(v6 + 80) = v8;
  *(void *)(v6 + 8_Block_object_dispose(&STACK[0x380], 8) = *(void *)(v8 - 8);
  *(void *)(v6 + 96) = swift_task_alloc();
  return _swift_task_switch(sub_7EF48, 0, 0);
}

uint64_t sub_7EF48()
{
  (*(void (**)(void, void, void))(*(void *)(v0 + 64) + 16))(*(void *)(v0 + 72), *(void *)(v0 + 16), *(void *)(v0 + 56));
  sub_81774(&qword_EDFB8, &qword_EDF80);
  sub_93BF0();
  *(unsigned char *)(v0 + 130) = *(unsigned char *)(v0 + 129);
  sub_81774(&qword_EDFC0, &qword_EDFB0);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 104) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_7F09C;
  return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v0 + 128, 0, 0);
}

uint64_t sub_7F09C()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_7F198, 0, 0);
}

uint64_t sub_7F198()
{
  int v1 = *(unsigned __int8 *)(v0 + 128);
  *(unsigned char *)(v0 + 131) = v1;
  if (v1 == 2)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 88) + 8))(*(void *)(v0 + 96), *(void *)(v0 + 80));
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2();
  }
  else if ((v1 ^ *(unsigned __int8 *)(v0 + 130)))
  {
    if (qword_ED9C0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_93940();
    sub_71428(v4, (uint64_t)qword_EF0E8);
    uint64_t v5 = sub_93920();
    os_log_type_t v6 = sub_93C80();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 67109120;
      *(_DWORD *)(v7 + 4) = v1 & 1;
      swift_slowDealloc();
    }
    uint64_t v8 = *(int **)(v0 + 24);

    os_log_type_t v11 = (uint64_t (*)(void))((char *)v8 + *v8);
    uint64_t v9 = (void *)swift_task_alloc();
    *(void *)(v0 + 112) = v9;
    void *v9 = v0;
    v9[1] = sub_7F474;
    return v11();
  }
  else
  {
    sub_81774(&qword_EDFC0, &qword_EDFB0);
    uint64_t v10 = (void *)swift_task_alloc();
    *(void *)(v0 + 104) = v10;
    *uint64_t v10 = v0;
    v10[1] = sub_7F09C;
    return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v0 + 128, 0, 0);
  }
}

uint64_t sub_7F474()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(int **)(*v0 + 40);
  uint64_t v3 = *v0;
  swift_task_dealloc();
  os_log_type_t v6 = (uint64_t (*)(void))((char *)v2 + *v2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 120) = v4;
  void *v4 = v3;
  v4[1] = sub_7F608;
  return v6();
}

uint64_t sub_7F608()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  swift_task_dealloc();
  *(unsigned char *)(v1 + 130) = *(unsigned char *)(v1 + 131) & 1;
  sub_81774(&qword_EDFC0, &qword_EDFB0);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 104) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_7F09C;
  return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v1 + 128, 0, 0);
}

uint64_t sub_7F7B8(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 40) = a5;
  *(void *)(v6 + 4_Block_object_dispose(&STACK[0x380], 8) = a6;
  *(void *)(v6 + 24) = a3;
  *(void *)(v6 + 32) = a4;
  *(void *)(v6 + 16) = a2;
  *(unsigned char *)(v6 + 129) = a1;
  uint64_t v7 = sub_71350(&qword_EDF38);
  *(void *)(v6 + 56) = v7;
  *(void *)(v6 + 64) = *(void *)(v7 - 8);
  *(void *)(v6 + 72) = swift_task_alloc();
  uint64_t v8 = sub_71350(&qword_EDF48);
  *(void *)(v6 + 80) = v8;
  *(void *)(v6 + 8_Block_object_dispose(&STACK[0x380], 8) = *(void *)(v8 - 8);
  *(void *)(v6 + 96) = swift_task_alloc();
  return _swift_task_switch(sub_7F8E8, 0, 0);
}

uint64_t sub_7F8E8()
{
  (*(void (**)(void, void, void))(*(void *)(v0 + 64) + 16))(*(void *)(v0 + 72), *(void *)(v0 + 16), *(void *)(v0 + 56));
  sub_81774(&qword_EDF50, &qword_EDF38);
  sub_93BF0();
  *(unsigned char *)(v0 + 130) = *(unsigned char *)(v0 + 129);
  sub_81774(&qword_EDF58, &qword_EDF48);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 104) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_7FA3C;
  return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v0 + 128, 0, 0);
}

uint64_t sub_7FA3C()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_7FB38, 0, 0);
}

uint64_t sub_7FB38()
{
  int v1 = *(unsigned __int8 *)(v0 + 128);
  *(unsigned char *)(v0 + 131) = v1;
  if (v1 == 2)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 88) + 8))(*(void *)(v0 + 96), *(void *)(v0 + 80));
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2();
  }
  else if ((v1 ^ *(unsigned __int8 *)(v0 + 130)))
  {
    if (qword_ED9C0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_93940();
    sub_71428(v4, (uint64_t)qword_EF0E8);
    uint64_t v5 = sub_93920();
    os_log_type_t v6 = sub_93C80();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 67109120;
      *(_DWORD *)(v7 + 4) = v1 & 1;
      swift_slowDealloc();
    }
    uint64_t v8 = *(int **)(v0 + 24);

    os_log_type_t v11 = (uint64_t (*)(void))((char *)v8 + *v8);
    uint64_t v9 = (void *)swift_task_alloc();
    *(void *)(v0 + 112) = v9;
    void *v9 = v0;
    v9[1] = sub_7FE14;
    return v11();
  }
  else
  {
    sub_81774(&qword_EDF58, &qword_EDF48);
    uint64_t v10 = (void *)swift_task_alloc();
    *(void *)(v0 + 104) = v10;
    *uint64_t v10 = v0;
    v10[1] = sub_7FA3C;
    return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v0 + 128, 0, 0);
  }
}

uint64_t sub_7FE14()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(int **)(*v0 + 40);
  uint64_t v3 = *v0;
  swift_task_dealloc();
  os_log_type_t v6 = (uint64_t (*)(void))((char *)v2 + *v2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 120) = v4;
  void *v4 = v3;
  v4[1] = sub_7FFA8;
  return v6();
}

uint64_t sub_7FFA8()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  swift_task_dealloc();
  *(unsigned char *)(v1 + 130) = *(unsigned char *)(v1 + 131) & 1;
  sub_81774(&qword_EDF58, &qword_EDF48);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 104) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_7FA3C;
  return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v1 + 128, 0, 0);
}

uint64_t sub_80158(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 40) = a5;
  *(void *)(v6 + 4_Block_object_dispose(&STACK[0x380], 8) = a6;
  *(void *)(v6 + 24) = a3;
  *(void *)(v6 + 32) = a4;
  *(void *)(v6 + 16) = a2;
  *(unsigned char *)(v6 + 123) = a1;
  uint64_t v7 = sub_71350(&qword_EDEC8);
  *(void *)(v6 + 56) = v7;
  *(void *)(v6 + 64) = *(void *)(v7 - 8);
  *(void *)(v6 + 72) = swift_task_alloc();
  uint64_t v8 = sub_71350(&qword_EDF18);
  *(void *)(v6 + 80) = v8;
  *(void *)(v6 + 8_Block_object_dispose(&STACK[0x380], 8) = *(void *)(v8 - 8);
  *(void *)(v6 + 96) = swift_task_alloc();
  return _swift_task_switch(sub_80288, 0, 0);
}

uint64_t sub_80288()
{
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v2 = *(void *)(v0 + 72);
  uint64_t v3 = *(void *)(v0 + 56);
  uint64_t v4 = *(void *)(v0 + 16);
  *(unsigned char *)(v0 + 120) = *(unsigned char *)(v0 + 123);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v2, v4, v3);
  sub_81774(&qword_EDF28, &qword_EDEC8);
  sub_93BF0();
  sub_81774(&qword_EDF30, &qword_EDF18);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 104) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_803DC;
  return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v0 + 121, 0, 0);
}

uint64_t sub_803DC()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_804D8, 0, 0);
}

uint64_t sub_804D8()
{
  int v1 = *(unsigned __int8 *)(v0 + 121);
  if (v1 == 3)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 88) + 8))(*(void *)(v0 + 96), *(void *)(v0 + 80));
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2();
  }
  *(unsigned char *)(v0 + 122) = v1;
  int v4 = *(unsigned __int8 *)(v0 + 120);
  if (v4 == 2)
  {
    if (v1 != 2)
    {
LABEL_13:
      *(unsigned char *)(v0 + 120) = v1;
      uint64_t v6 = (void *)swift_task_alloc();
      *(void *)(v0 + 112) = v6;
      *uint64_t v6 = v0;
      v6[1] = sub_806E0;
      uint64_t v7 = *(void *)(v0 + 40);
      uint64_t v8 = *(void *)(v0 + 48);
      uint64_t v9 = *(void *)(v0 + 24);
      uint64_t v10 = *(void *)(v0 + 32);
      return sub_766E4(v0 + 120, (unsigned char *)(v0 + 122), v9, v10, v7, v8);
    }
  }
  else if (v1 == 2 || ((((v1 & 1) == 0) ^ v4) & 1) == 0)
  {
    goto LABEL_13;
  }
  sub_81774(&qword_EDF30, &qword_EDF18);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 104) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_803DC;
  return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v0 + 121, 0, 0);
}

uint64_t sub_806E0()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_807DC, 0, 0);
}

uint64_t sub_807DC()
{
  sub_81774(&qword_EDF30, &qword_EDF18);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 104) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_803DC;
  return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v0 + 121, 0, 0);
}

uint64_t sub_808C0()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

id sub_80900()
{
  return [*(id *)(v0 + 16) removeObserver:*(void *)(v0 + 24)];
}

uint64_t sub_80910()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_80948(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void *)(v2 + 16);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_81938;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_EDF88 + dword_EDF88);
  return v8(a1, a2, v6);
}

uint64_t sub_80A04()
{
  return _swift_deallocObject(v0, 32, 7);
}

id sub_80A44()
{
  return [*(id *)(v0 + 16) removeObserver:*(void *)(v0 + 24) accountTypes:1];
}

void sub_80A58()
{
  if (!qword_EE018)
  {
    unint64_t v0 = _s13PriceTrackingVMa();
    if (!v1) {
      atomic_store(v0, &qword_EE018);
    }
  }
}

uint64_t sub_80AA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[21] = a5;
  v6[22] = a6;
  v6[19] = a3;
  v6[20] = a4;
  v6[17] = a1;
  v6[18] = a2;
  uint64_t v7 = sub_71350(&qword_EE008);
  v6[23] = v7;
  v6[24] = *(void *)(v7 - 8);
  v6[25] = swift_task_alloc();
  uint64_t v8 = sub_71350(&qword_EE028);
  v6[26] = v8;
  v6[27] = *(void *)(v8 - 8);
  v6[28] = swift_task_alloc();
  return _swift_task_switch(sub_80BD4, 0, 0);
}

uint64_t sub_80BD4()
{
  uint64_t v1 = *(void *)(v0 + 192);
  uint64_t v2 = *(void *)(v0 + 200);
  uint64_t v3 = *(void *)(v0 + 184);
  uint64_t v5 = *(void *)(v0 + 136);
  uint64_t v4 = *(void *)(v0 + 144);
  uint64_t v6 = *(void *)(v5 + 32);
  long long v7 = *(_OWORD *)(v5 + 16);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)v5;
  *(_OWORD *)(v0 + 32) = v7;
  *(void *)(v0 + 4_Block_object_dispose(&STACK[0x380], 8) = v6;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v2, v4, v3);
  sub_81774(&qword_EE038, &qword_EE008);
  swift_bridgeObjectRetain();
  sub_93BF0();
  sub_81774(&qword_EE040, &qword_EE028);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 232) = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_80D48;
  return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v0 + 56, 0, 0);
}

uint64_t sub_80D48()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_80E44, 0, 0);
}

uint64_t sub_80E44()
{
  uint64_t v1 = *(void *)(v0 + 64);
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 88);
    double v4 = *(double *)(v0 + 72);
    double v3 = *(double *)(v0 + 80);
    uint64_t v5 = *(void *)(v0 + 56) & 1;
    *(unsigned char *)(v0 + 96) = v5;
    *(void *)(v0 + 104) = v1;
    *(double *)(v0 + 112) = v4;
    *(double *)(v0 + 120) = v3;
    *(void *)(v0 + 12_Block_object_dispose(&STACK[0x380], 8) = v2;
    uint64_t v6 = *(void *)(v0 + 24);
    if ((((v5 == 0) ^ *(unsigned __int8 *)(v0 + 16)) & 1) == 0) {
      goto LABEL_33;
    }
    double v7 = *(double *)(v0 + 32);
    double v8 = *(double *)(v0 + 40);
    uint64_t v9 = (void *)((unint64_t)v6 >> 62);
    uint64_t v10 = *(void *)(v0 + 48);
    if ((unint64_t)v6 >> 62)
    {
      uint64_t v38 = *(void *)(v0 + 48);
      swift_bridgeObjectRetain();
      uint64_t v11 = sub_93E10();
      swift_bridgeObjectRelease();
      uint64_t v10 = v38;
    }
    else
    {
      uint64_t v11 = *(void *)((char *)&dword_10 + (v6 & 0xFFFFFFFFFFFFFF8));
    }
    if ((unint64_t)v1 >> 62)
    {
      uint64_t v39 = v10;
      swift_bridgeObjectRetain();
      uint64_t v40 = sub_93E10();
      swift_bridgeObjectRelease();
      uint64_t v10 = v39;
      if (v11 != v40) {
        goto LABEL_33;
      }
    }
    else if (v11 != *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8)))
    {
      goto LABEL_33;
    }
    if (!v11) {
      goto LABEL_26;
    }
    uint64_t v12 = v6 & 0xFFFFFFFFFFFFFF8;
    uint64_t v13 = (v6 & 0xFFFFFFFFFFFFFF8) + 32;
    if (v6 < 0) {
      uint64_t v12 = v6;
    }
    if (v9) {
      uint64_t v13 = v12;
    }
    uint64_t v14 = v1 & 0xFFFFFFFFFFFFFF8;
    uint64_t v15 = (v1 & 0xFFFFFFFFFFFFFF8) + 32;
    if (v1 < 0) {
      uint64_t v14 = v1;
    }
    if ((unint64_t)v1 >> 62) {
      uint64_t v15 = v14;
    }
    if (v13 == v15) {
      goto LABEL_26;
    }
    if (v11 < 0)
    {
      __break(1u);
    }
    else
    {
      unint64_t v44 = v6 & 0xC000000000000001;
      uint64_t v45 = v10;
      if ((v6 & 0xC000000000000001) == 0)
      {
        if (!*(void *)((char *)&dword_10 + (v6 & 0xFFFFFFFFFFFFFF8)))
        {
          __break(1u);
          goto LABEL_68;
        }
        id v16 = *(id *)(v6 + 32);
LABEL_21:
        uint64_t v9 = v16;
        unint64_t v43 = v1 & 0xC000000000000001;
        if ((v1 & 0xC000000000000001) == 0)
        {
          if (!*(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8)))
          {
            __break(1u);
LABEL_70:
            __break(1u);
LABEL_71:
            __break(1u);
            goto LABEL_72;
          }
          id v19 = *(id *)(v1 + 32);
LABEL_24:
          id v20 = v19;
          sub_7C388(0, (unint64_t *)&qword_EDB90);
          char v21 = sub_93CD0();

          uint64_t v10 = v45;
          if ((v21 & 1) == 0) {
            goto LABEL_33;
          }
          if (v11 == 1)
          {
LABEL_26:
            if (v7 != v4 || v8 != v3 || v10 != v2) {
              goto LABEL_33;
            }
            swift_bridgeObjectRelease();
            sub_81774(&qword_EE040, &qword_EE028);
            id v27 = (void *)swift_task_alloc();
            *(void *)(v0 + 232) = v27;
            void *v27 = v0;
            v27[1] = sub_80D48;
            id v16 = (id)(v0 + 56);
            uint64_t v17 = 0;
            uint64_t v18 = 0;
            return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v16, v17, v18);
          }
          if (v44)
          {
            id v16 = (id)sub_93D70();
LABEL_46:
            uint64_t v28 = v16;
            if (v43)
            {
              id v29 = (id)sub_93D70();
              goto LABEL_50;
            }
            if (*(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8)) >= 2uLL)
            {
              id v29 = *(id *)(v1 + 40);
LABEL_50:
              uint64_t v30 = v29;
              char v31 = sub_93CD0();

              uint64_t v10 = v45;
              if (v31)
              {
                uint64_t v42 = 2 - v11;
                uint64_t v32 = 6;
                while (v42 + v32 != 6)
                {
                  unint64_t v36 = v32 - 4;
                  if (v44)
                  {
                    id v16 = (id)sub_93D70();
                  }
                  else
                  {
                    if (v36 >= *(void *)((char *)&dword_10 + (v6 & 0xFFFFFFFFFFFFFF8))) {
                      goto LABEL_70;
                    }
                    id v16 = *(id *)(v6 + 8 * v32);
                  }
                  id v37 = v16;
                  if (v43)
                  {
                    id v33 = (id)sub_93D70();
                  }
                  else
                  {
                    if (v36 >= *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8))) {
                      goto LABEL_71;
                    }
                    id v33 = *(id *)(v1 + 8 * v32);
                  }
                  uint64_t v34 = v33;
                  char v35 = sub_93CD0();

                  ++v32;
                  uint64_t v10 = v45;
                  if ((v35 & 1) == 0) {
                    goto LABEL_33;
                  }
                }
                goto LABEL_26;
              }
LABEL_33:
              swift_bridgeObjectRelease();
              *(unsigned char *)(v0 + 16) = v5;
              *(void *)(v0 + 24) = v1;
              *(double *)(v0 + 32) = v4;
              *(double *)(v0 + 40) = v3;
              *(void *)(v0 + 4_Block_object_dispose(&STACK[0x380], 8) = v2;
              swift_bridgeObjectRetain();
              uint64_t v24 = swift_task_alloc();
              *(void *)(v0 + 240) = v24;
              *(void *)uint64_t v24 = v0;
              *(void *)(v24 + _Block_object_dispose(&STACK[0x380], 8) = sub_813E4;
              long long v25 = *(_OWORD *)(v0 + 168);
              *(_OWORD *)(v24 + 16) = *(_OWORD *)(v0 + 152);
              *(_OWORD *)(v24 + 32) = v25;
              *(unsigned char *)(v24 + 84) = *(unsigned char *)(v0 + 16);
              *(unsigned char *)(v24 + 85) = *(unsigned char *)(v0 + 96);
              *(void *)(v24 + 4_Block_object_dispose(&STACK[0x380], 8) = *(void *)(v0 + 104);
              return _swift_task_switch(sub_74138, 0, 0);
            }
LABEL_73:
            __break(1u);
            return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v16, v17, v18);
          }
          if (*(void *)((char *)&dword_10 + (v6 & 0xFFFFFFFFFFFFFF8)) >= 2uLL)
          {
            id v16 = *(id *)(v6 + 40);
            goto LABEL_46;
          }
LABEL_72:
          __break(1u);
          goto LABEL_73;
        }
LABEL_68:
        id v19 = (id)sub_93D70();
        goto LABEL_24;
      }
    }
    id v16 = (id)sub_93D70();
    goto LABEL_21;
  }
  (*(void (**)(void, void))(*(void *)(v0 + 216) + 8))(*(void *)(v0 + 224), *(void *)(v0 + 208));
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v26 = *(uint64_t (**)(void))(v0 + 8);
  return v26();
}

uint64_t sub_813E4()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_814E0, 0, 0);
}

uint64_t sub_814E0()
{
  swift_bridgeObjectRelease();
  sub_81774(&qword_EE040, &qword_EE028);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 232) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_80D48;
  return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v0 + 56, 0, 0);
}

uint64_t sub_815CC()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_81604()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_7CF08;
  v2[5] = v0;
  return _swift_task_switch(sub_7A4D4, 0, 0);
}

uint64_t sub_816AC(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)(v2 + 16);
  double v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_81938;
  double v8 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_EE068 + dword_EE068);
  return v8(a1, a2, v6);
}

uint64_t sub_81774(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_7D104(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_817B8(uint64_t a1, uint64_t a2)
{
  if (a2 != 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_817CC(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_817DC()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 88, 7);
}

void sub_81834()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_81938;
  uint64_t v2 = (char *)&dword_EE0C0 + dword_EE0C0;
  __asm { BR              X9; sub_7C144 }
}

uint64_t sub_81958()
{
  uint64_t v0 = sub_93940();
  sub_819D8(v0, qword_EF0E8);
  sub_71428(v0, (uint64_t)qword_EF0E8);
  return sub_93930();
}

uint64_t *sub_819D8(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t CollectionControllerMemberManagingAddRequest.storeID.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___BKCollectionControllerMemberManagingAddRequest_storeID);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CollectionControllerMemberManagingAddRequest.collectionID.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___BKCollectionControllerMemberManagingAddRequest_collectionID);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CollectionControllerMemberManagingAddRequest.forceToTop.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR___BKCollectionControllerMemberManagingAddRequest_forceToTop);
}

id CollectionControllerMemberManagingAddRequest.__allocating_init(storeID:collectionID:forceToTop:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v11 = objc_allocWithZone(v5);
  uint64_t v12 = &v11[OBJC_IVAR___BKCollectionControllerMemberManagingAddRequest_storeID];
  *uint64_t v12 = a1;
  v12[1] = a2;
  uint64_t v13 = &v11[OBJC_IVAR___BKCollectionControllerMemberManagingAddRequest_collectionID];
  *uint64_t v13 = a3;
  v13[1] = a4;
  v11[OBJC_IVAR___BKCollectionControllerMemberManagingAddRequest_forceToTop] = a5;
  v15.receiver = v11;
  v15.super_class = v5;
  return [super init];
}

id CollectionControllerMemberManagingAddRequest.init(storeID:collectionID:forceToTop:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v12 = &v5[OBJC_IVAR___BKCollectionControllerMemberManagingAddRequest_storeID];
  *uint64_t v12 = a1;
  v12[1] = a2;
  uint64_t v13 = &v5[OBJC_IVAR___BKCollectionControllerMemberManagingAddRequest_collectionID];
  *uint64_t v13 = a3;
  v13[1] = a4;
  v5[OBJC_IVAR___BKCollectionControllerMemberManagingAddRequest_forceToTop] = a5;
  v15.receiver = v5;
  v15.super_class = ObjectType;
  return [super init];
}

id CollectionControllerMemberManagingAddRequest.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

void CollectionControllerMemberManagingAddRequest.init()()
{
}

uint64_t CollectionControllerMemberManagingRemoveRequest.storeID.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___BKCollectionControllerMemberManagingRemoveRequest_storeID);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CollectionControllerMemberManagingRemoveRequest.collectionID.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___BKCollectionControllerMemberManagingRemoveRequest_collectionID);
  swift_bridgeObjectRetain();
  return v1;
}

id CollectionControllerMemberManagingRemoveRequest.__allocating_init(storeID:collectionID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (char *)objc_allocWithZone(v4);
  uint64_t v10 = &v9[OBJC_IVAR___BKCollectionControllerMemberManagingRemoveRequest_storeID];
  *(void *)uint64_t v10 = a1;
  *((void *)v10 + 1) = a2;
  uint64_t v11 = &v9[OBJC_IVAR___BKCollectionControllerMemberManagingRemoveRequest_collectionID];
  *(void *)uint64_t v11 = a3;
  *((void *)v11 + 1) = a4;
  v13.receiver = v9;
  v13.super_class = v4;
  return [super init];
}

id CollectionControllerMemberManagingRemoveRequest.init(storeID:collectionID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v10 = &v4[OBJC_IVAR___BKCollectionControllerMemberManagingRemoveRequest_storeID];
  *(void *)uint64_t v10 = a1;
  *((void *)v10 + 1) = a2;
  uint64_t v11 = &v4[OBJC_IVAR___BKCollectionControllerMemberManagingRemoveRequest_collectionID];
  *(void *)uint64_t v11 = a3;
  *((void *)v11 + 1) = a4;
  v13.receiver = v4;
  v13.super_class = ObjectType;
  return [super init];
}

void CollectionControllerMemberManagingRemoveRequest.init()()
{
}

uint64_t CollectionControllerMemberManagingModifyResponse.assetID.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___BKCollectionControllerMemberManagingModifyResponse_assetID);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CollectionControllerMemberManagingModifyResponse.assetContentType.getter()
{
  return *(void *)(v0 + OBJC_IVAR___BKCollectionControllerMemberManagingModifyResponse_assetContentType);
}

id sub_82068()
{
  swift_bridgeObjectRetain();
  NSString v0 = sub_93A30();
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t CollectionControllerMemberManagingModifyResponse.collectionTitle.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___BKCollectionControllerMemberManagingModifyResponse_collectionTitle);
  swift_bridgeObjectRetain();
  return v1;
}

id CollectionControllerMemberManagingModifyResponse.__allocating_init(assetID:assetContentType:collectionTitle:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = (char *)objc_allocWithZone(v5);
  uint64_t v12 = &v11[OBJC_IVAR___BKCollectionControllerMemberManagingModifyResponse_assetID];
  *(void *)uint64_t v12 = a1;
  *((void *)v12 + 1) = a2;
  *(void *)&v11[OBJC_IVAR___BKCollectionControllerMemberManagingModifyResponse_assetContentType] = a3;
  objc_super v13 = &v11[OBJC_IVAR___BKCollectionControllerMemberManagingModifyResponse_collectionTitle];
  *(void *)objc_super v13 = a4;
  *((void *)v13 + 1) = a5;
  v15.receiver = v11;
  v15.super_class = v5;
  return [super init];
}

id CollectionControllerMemberManagingModifyResponse.init(assetID:assetContentType:collectionTitle:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v12 = &v5[OBJC_IVAR___BKCollectionControllerMemberManagingModifyResponse_assetID];
  *(void *)uint64_t v12 = a1;
  *((void *)v12 + 1) = a2;
  *(void *)&v5[OBJC_IVAR___BKCollectionControllerMemberManagingModifyResponse_assetContentType] = a3;
  objc_super v13 = &v5[OBJC_IVAR___BKCollectionControllerMemberManagingModifyResponse_collectionTitle];
  *(void *)objc_super v13 = a4;
  *((void *)v13 + 1) = a5;
  v15.receiver = v5;
  v15.super_class = ObjectType;
  return [super init];
}

void CollectionControllerMemberManagingModifyResponse.init()()
{
}

id _s9BKLibrary48CollectionControllerMemberManagingModifyResponseCfD_0()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super dealloc];
}

uint64_t type metadata accessor for CollectionControllerMemberManagingAddRequest()
{
  return self;
}

uint64_t method lookup function for CollectionControllerMemberManagingAddRequest(uint64_t a1, uint64_t a2)
{
  return _swift_lookUpClassMethod(a1, a2, &nominal type descriptor for CollectionControllerMemberManagingAddRequest);
}

uint64_t dispatch thunk of CollectionControllerMemberManagingAddRequest.__allocating_init(storeID:collectionID:forceToTop:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t type metadata accessor for CollectionControllerMemberManagingRemoveRequest()
{
  return self;
}

uint64_t method lookup function for CollectionControllerMemberManagingRemoveRequest(uint64_t a1, uint64_t a2)
{
  return _swift_lookUpClassMethod(a1, a2, &nominal type descriptor for CollectionControllerMemberManagingRemoveRequest);
}

uint64_t dispatch thunk of CollectionControllerMemberManagingRemoveRequest.__allocating_init(storeID:collectionID:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_82410()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for CollectionControllerMemberManagingModifyResponse()
{
  return self;
}

uint64_t method lookup function for CollectionControllerMemberManagingModifyResponse(uint64_t a1, uint64_t a2)
{
  return _swift_lookUpClassMethod(a1, a2, &nominal type descriptor for CollectionControllerMemberManagingModifyResponse);
}

uint64_t dispatch thunk of CollectionControllerMemberManagingModifyResponse.__allocating_init(assetID:assetContentType:collectionTitle:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_824B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 16);
}

uint64_t sub_824D0(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_824F0(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)uint64_t result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + _Block_object_dispose(&STACK[0x380], 8) = v3;
  return result;
}

uint64_t type metadata accessor for WeakUnsafeSendable()
{
  return sub_718A4();
}

uint64_t BKLibraryManager.libraryData(using:)(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  void v3[4] = v2;
  v3[2] = a1;
  return _swift_task_switch(sub_82554, 0, 0);
}

uint64_t sub_82554()
{
  uint64_t v1 = (int8x16_t *)swift_task_alloc();
  *(void *)(v0 + 40) = v1;
  v1[1] = vextq_s8(*(int8x16_t *)(v0 + 24), *(int8x16_t *)(v0 + 24), 8uLL);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 4_Block_object_dispose(&STACK[0x380], 8) = v2;
  uint64_t v3 = sub_93880();
  *uint64_t v2 = v0;
  v2[1] = sub_8264C;
  uint64_t v4 = *(void *)(v0 + 16);
  return withCheckedThrowingContinuation<A>(isolation:function:_:)(v4, 0, 0, 0xD000000000000013, 0x80000000000B5310, sub_829B0, v1, v3);
}

uint64_t sub_8264C()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 56) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return _swift_task_switch(sub_82788, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_82788()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_827EC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6 = sub_71350(&qword_EE258);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  unint64_t v9 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v10 + v9, (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  *(void *)(v10 + ((v8 + v9 + 7) & 0xFFFFFFFFFFFFFFF8)) = a3;
  aBlock[4] = sub_848F8;
  aBlock[5] = v10;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_8309C;
  aBlock[3] = &unk_D3E38;
  uint64_t v11 = _Block_copy(aBlock);
  id v12 = a3;
  swift_release();
  [a2 performBackgroundReadOnlyBlock:v11];
  _Block_release(v11);
}

void sub_829B0(uint64_t a1)
{
  sub_827EC(a1, *(void **)(v1 + 16), *(void **)(v1 + 24));
}

void sub_829B8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = sub_93880();
  __chkstk_darwin(v4 - 8);
  id v5 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v6 = sub_93A30();
  id v7 = [v5 initWithEntityName:v6];

  id v8 = [self predicateForLocalOrDownloadingOrImportingLibraryAssets];
  [v7 setPredicate:v8];

  [v7 setReturnsDistinctResults:1];
  sub_7C388(0, (unint64_t *)&qword_EE250);
  unint64_t v9 = sub_93CC0();
  unint64_t v10 = v9;
  id v16 = &_swiftEmptyArrayStorage;
  if (!(v9 >> 62))
  {
    uint64_t v11 = *(void *)((char *)&dword_10 + (v9 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    if (v11) {
      goto LABEL_3;
    }
LABEL_11:
    swift_bridgeObjectRelease_n();
LABEL_12:
    swift_bridgeObjectRetain();
    sub_93870();
    sub_71350(&qword_EE258);
    sub_93B60();
    swift_bridgeObjectRelease();

    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_93E10();
  if (!v11) {
    goto LABEL_11;
  }
LABEL_3:
  if (v11 >= 1)
  {
    uint64_t v12 = 0;
    do
    {
      if ((v10 & 0xC000000000000001) != 0) {
        id v13 = (id)sub_93D70();
      }
      else {
        id v13 = *(id *)(v10 + 8 * v12 + 32);
      }
      uint64_t v14 = v13;
      ++v12;
      objc_super v15 = v13;
      sub_82C64(&v15, a3, (unint64_t *)&v16);
    }
    while (v11 != v12);
    swift_bridgeObjectRelease_n();
    goto LABEL_12;
  }
  __break(1u);
}

uint64_t sub_82C64(void **a1, void *a2, unint64_t *a3)
{
  uint64_t v38 = a3;
  uint64_t v39 = sub_938C0();
  uint64_t v5 = *(void *)(v39 - 8);
  uint64_t v6 = __chkstk_darwin(v39);
  id v37 = (char *)v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v40 = (char *)v33 - v8;
  uint64_t v41 = sub_93860();
  uint64_t v36 = *(void *)(v41 - 8);
  uint64_t v9 = __chkstk_darwin(v41);
  uint64_t v11 = (char *)v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  id v13 = (char *)v33 - v12;
  uint64_t v14 = *a1;
  id v15 = [v14 permanentOrTemporaryAssetID];
  NSString v16 = v15;
  NSString v17 = v15;
  if (!v15)
  {
    sub_93A60();
    NSString v17 = sub_93A30();
    swift_bridgeObjectRelease();
    sub_93A60();
    NSString v16 = sub_93A30();
    swift_bridgeObjectRelease();
  }
  uint64_t v18 = sub_93A60();
  uint64_t v34 = v19;
  uint64_t v35 = v18;
  id v20 = v15;
  [v14 contentType];
  v33[3] = [v14 isSample];
  sub_93900();
  sub_938F0();
  id v21 = [a2 contentPrivateIDForContentID:v17];

  if (v21)
  {
    sub_93A60();
  }
  id v22 = [a2 contentUserIDForContentID:v16];

  if (v22)
  {
    sub_93A60();
  }
  uint64_t v23 = v36;
  (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v11, v13, v41);
  uint64_t v24 = v40;
  sub_938B0();
  long long v25 = v37;
  uint64_t v26 = v39;
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v37, v24, v39);
  id v27 = v38;
  unint64_t v28 = *v38;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  unint64_t *v27 = v28;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    unint64_t v28 = sub_87704(0, *(void *)(v28 + 16) + 1, 1, v28);
    unint64_t *v27 = v28;
  }
  unint64_t v31 = *(void *)(v28 + 16);
  unint64_t v30 = *(void *)(v28 + 24);
  if (v31 >= v30 >> 1)
  {
    unint64_t v28 = sub_87704(v30 > 1, v31 + 1, 1, v28);
    unint64_t *v27 = v28;
  }
  *(void *)(v28 + 16) = v31 + 1;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v28+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v31, v25, v26);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v40, v26);
  return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v13, v41);
}

void sub_8309C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t BKLibraryManager.collectionSummaryData()(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return _swift_task_switch(sub_83124, 0, 0);
}

uint64_t sub_83124()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = swift_task_alloc();
  v0[4] = v2;
  *(void *)(v2 + 16) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[5] = v3;
  uint64_t v4 = sub_938E0();
  *uint64_t v3 = v0;
  v3[1] = sub_83218;
  uint64_t v5 = v0[2];
  return withCheckedThrowingContinuation<A>(isolation:function:_:)(v5, 0, 0, 0xD000000000000017, 0x80000000000B5330, sub_83570, v2, v4);
}

uint64_t sub_83218()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 4_Block_object_dispose(&STACK[0x380], 8) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return _swift_task_switch(sub_83354, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_83354()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_833B8(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_71350(&qword_EE230);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  unint64_t v7 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8 + v7, (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  aBlock[4] = sub_847C0;
  aBlock[5] = v8;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_8309C;
  aBlock[3] = &unk_D3DE8;
  uint64_t v9 = _Block_copy(aBlock);
  id v10 = a2;
  swift_release();
  [v10 performBackgroundReadOnlyBlock:v9];
  _Block_release(v9);
}

void sub_83570(uint64_t a1)
{
  sub_833B8(a1, *(void **)(v1 + 16));
}

uint64_t sub_83578(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_938E0();
  unint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  __int16 v107 = (char *)&v90 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  double v108 = (char *)&v90 - v10;
  uint64_t v127 = sub_938A0();
  uint64_t v124 = *(void *)(v127 - 8);
  uint64_t v11 = __chkstk_darwin(v127);
  v126 = (char *)&v90 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v125 = (char *)&v90 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  v115 = (char *)&v90 - v16;
  __chkstk_darwin(v15);
  v114 = (char *)&v90 - v17;
  unint64_t v121 = sub_93940();
  uint64_t v18 = *(void (***)(char *, unint64_t))(v121 - 8);
  __chkstk_darwin(v121);
  id v20 = (char *)&v90 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v21 = [a2 collectionProvider];
  v130 = 0;
  id v22 = [v21 defaultCollectionsInManagedObjectContext:a1 withError:&v130];
  uint64_t v23 = v130;
  if (!v22)
  {
    long long v71 = v130;
    long long v72 = sub_93840();

    swift_willThrow();
    v130 = v72;
    swift_errorRetain();
    sub_71350(&qword_EE230);
LABEL_48:
    sub_93B50();
    swift_unknownObjectRelease();
    return swift_errorRelease();
  }
  uint64_t v24 = v22;
  v117 = v18;
  uint64_t v25 = a3;
  unint64_t v26 = v7;
  sub_71350(&qword_EE238);
  unint64_t v27 = sub_93AF0();
  unint64_t v28 = v23;

  v130 = 0;
  uint64_t v113 = a1;
  id v29 = [v21 userCollectionsInManagedObjectContext:a1 withError:&v130];
  unint64_t v30 = v130;
  if (!v29)
  {
    long long v73 = v130;
    swift_bridgeObjectRelease();
    int v74 = sub_93840();

    swift_willThrow();
    v130 = v74;
    swift_errorRetain();
    sub_71350(&qword_EE230);
    goto LABEL_48;
  }
  unint64_t v31 = v29;
  id v105 = v21;
  unint64_t v123 = sub_93AF0();
  uint64_t v32 = v30;

  unint64_t v34 = v27;
  if (v27 >> 62) {
    goto LABEL_69;
  }
  uint64_t v35 = *(void *)((char *)&dword_10 + (v27 & 0xFFFFFFFFFFFFFF8));
LABEL_5:
  unint64_t v102 = v26;
  uint64_t v103 = v6;
  uint64_t v104 = v25;
  if (v35)
  {
    uint64_t v116 = 0;
    unint64_t v122 = v34 & 0xC000000000000001;
    uint64_t v118 = kBKCollectionDefaultAll;
    unsigned __int8 v101 = &v129;
    uint64_t v111 = kBKCollectionDefaultIDFinished;
    double v112 = (void (**)(char *, char *, uint64_t))(v124 + 16);
    uint64_t v110 = v124 + 32;
    uint64_t v109 = v124 + 8;
    ++v117;
    uint64_t v36 = &_swiftEmptyArrayStorage;
    uint64_t v6 = 4;
    *(void *)&long long v33 = 136315394;
    long long v94 = v33;
    unint64_t v91 = (unint64_t)"libraryData(using:)";
    unint64_t v93 = 0x80000000000B5330;
    v92 = (char *)&type metadata for Any + 8;
    unint64_t v95 = 0x80000000000B5380;
    *(void *)&long long v33 = 136315650;
    long long v90 = v33;
    uint64_t v119 = v35;
    BOOL v120 = v20;
    while (1)
    {
      uint64_t v25 = v6 - 4;
      if (v122)
      {
        id v37 = (void *)sub_93D70();
        uint64_t v38 = v6 - 3;
        if (__OFADD__(v25, 1)) {
          goto LABEL_67;
        }
      }
      else
      {
        id v37 = *(void **)(v34 + 8 * v6);
        swift_unknownObjectRetain();
        uint64_t v38 = v6 - 3;
        if (__OFADD__(v25, 1))
        {
LABEL_67:
          __break(1u);
LABEL_68:
          __break(1u);
LABEL_69:
          swift_bridgeObjectRetain();
          uint64_t v35 = sub_93E10();
          swift_bridgeObjectRelease();
          goto LABEL_5;
        }
      }
      id v39 = [v37 collectionID:v90];
      if (v39)
      {
        uint64_t v25 = (uint64_t)v39;
        uint64_t v40 = sub_93A60();
        unint64_t v26 = v41;
        if (!(id)BALog()) {
          goto LABEL_73;
        }
        sub_93950();
        if (sub_93A60() == v40 && v42 == v26)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          char v43 = sub_93EB0();
          swift_bridgeObjectRelease();
          if ((v43 & 1) == 0)
          {
            if (sub_93A60() == v40 && v44 == v26)
            {

              swift_bridgeObjectRelease();
LABEL_26:
              id v46 = objc_allocWithZone((Class)NSFetchRequest);
              NSString v47 = sub_93A30();
              id v48 = [v46 initWithEntityName:v47];

              id v49 = [self predicateFor_All_Finished_LibraryAssets];
              [v48 setPredicate:v49];

              sub_7C388(0, (unint64_t *)&qword_EE250);
              uint64_t v50 = v116;
              sub_93CB0();
              if (v50)
              {
                swift_errorRetain();
                swift_errorRetain();
                id v51 = sub_93920();
                os_log_type_t v52 = sub_93C70();
                LODWORD(v106) = v52;
                if (os_log_type_enabled(v51, v52))
                {
                  uint64_t v53 = swift_slowAlloc();
                  uint64_t v116 = v50;
                  uint64_t v54 = v53;
                  long long v97 = (void *)swift_slowAlloc();
                  long long v99 = swift_slowAlloc();
                  v130 = v99;
                  *(_DWORD *)uint64_t v54 = v94;
                  os_log_t v98 = v51;
                  uint64_t v128 = sub_7B778(0xD000000000000017, v93, (uint64_t *)&v130);
                  id v100 = v48;
                  sub_93CE0();
                  *(_WORD *)(v54 + 12) = 2112;
                  uint64_t v96 = v54 + 14;
                  swift_errorRetain();
                  uint64_t v55 = _swift_stdlib_bridgeErrorToNSError();
                  uint64_t v128 = v55;
                  sub_93CE0();
                  void *v97 = v55;
                  swift_errorRelease();
                  swift_errorRelease();
                  os_log_t v56 = v98;
                  _os_log_impl(&dword_0, v98, (os_log_type_t)v106, "%s: error finding finished collection members: %@", (uint8_t *)v54, 0x16u);
                  sub_71350(&qword_EDDD8);
                  swift_arrayDestroy();
                  swift_slowDealloc();
                  swift_arrayDestroy();
                  swift_slowDealloc();
                  swift_slowDealloc();

                  swift_errorRelease();
                }
                else
                {

                  swift_errorRelease();
                  swift_errorRelease();
                  swift_errorRelease();
                }
                uint64_t v116 = 0;
              }
              else
              {
                uint64_t v116 = 0;
              }
LABEL_35:
              id v20 = v120;
            }
            else
            {
              char v45 = sub_93EB0();
              swift_bridgeObjectRelease();
              if (v45)
              {

                goto LABEL_26;
              }
              id v57 = objc_allocWithZone((Class)NSFetchRequest);
              NSString v58 = sub_93A30();
              id v106 = [v57 initWithEntityName:v58];

              id v59 = [self predicateForCollectionMembersInCollectionID:v25 hideUnownedItems:0];
              [v106 setPredicate:v59];

              sub_7C388(0, (unint64_t *)&unk_EE240);
              uint64_t v60 = v116;
              unint64_t v61 = sub_93CC0();
              if (!v60)
              {
                uint64_t v116 = 0;
                if (v61 >> 62)
                {
                  swift_bridgeObjectRetain();
                  sub_93E10();

                  swift_bridgeObjectRelease_n();
                }
                else
                {
                  swift_bridgeObjectRelease();
                }
                goto LABEL_35;
              }
              swift_bridgeObjectRetain();
              swift_errorRetain();
              swift_bridgeObjectRetain();
              swift_errorRetain();
              id v20 = v120;
              unsigned __int8 v62 = sub_93920();
              os_log_type_t v63 = sub_93C70();
              LODWORD(v100) = v63;
              if (os_log_type_enabled(v62, v63))
              {
                uint64_t v64 = swift_slowAlloc();
                long long v97 = (void *)swift_slowAlloc();
                os_log_t v98 = (os_log_t)swift_slowAlloc();
                v130 = v98;
                *(_DWORD *)uint64_t v64 = v90;
                uint64_t v116 = v60;
                uint64_t v128 = sub_7B778(0xD000000000000017, v91 | 0x8000000000000000, (uint64_t *)&v130);
                long long v99 = v62;
                sub_93CE0();
                *(_WORD *)(v64 + 12) = 2080;
                swift_bridgeObjectRetain();
                uint64_t v128 = sub_7B778(v40, v26, (uint64_t *)&v130);
                sub_93CE0();
                swift_bridgeObjectRelease_n();
                *(_WORD *)(v64 + 22) = 2112;
                uint64_t v96 = v64 + 24;
                swift_errorRetain();
                uint64_t v65 = _swift_stdlib_bridgeErrorToNSError();
                uint64_t v128 = v65;
                sub_93CE0();
                void *v97 = v65;
                swift_errorRelease();
                swift_errorRelease();
                _os_log_impl(&dword_0, v99, (os_log_type_t)v100, "%s: error finding %s members: %@", (uint8_t *)v64, 0x20u);
                sub_71350(&qword_EDDD8);
                swift_arrayDestroy();
                swift_slowDealloc();
                swift_arrayDestroy();
                swift_slowDealloc();
                id v20 = v120;
                swift_slowDealloc();

                swift_errorRelease();
              }
              else
              {

                swift_errorRelease();
                swift_bridgeObjectRelease_n();

                swift_errorRelease();
                swift_errorRelease();
              }
              uint64_t v116 = 0;
            }
            long long v66 = v114;
            sub_93890();
            swift_bridgeObjectRelease();
            (*v112)(v115, v66, v127);
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              uint64_t v36 = (void *)sub_87728(0, v36[2] + 1, 1, (unint64_t)v36);
            }
            unint64_t v68 = v36[2];
            unint64_t v67 = v36[3];
            if (v68 >= v67 >> 1) {
              uint64_t v36 = (void *)sub_87728(v67 > 1, v68 + 1, 1, (unint64_t)v36);
            }
            void v36[2] = v68 + 1;
            uint64_t v69 = v124;
            uint64_t v70 = v127;
            (*(void (**)(unint64_t, char *, uint64_t))(v124 + 32))((unint64_t)v36+ ((*(unsigned __int8 *)(v69 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v69 + 80))+ *(void *)(v69 + 72) * v68, v115, v127);
            swift_unknownObjectRelease();
            (*(void (**)(char *, uint64_t))(v69 + 8))(v114, v70);
            (*v117)(v20, v121);
            uint64_t v35 = v119;
            goto LABEL_8;
          }
        }
        id v20 = v120;
        (*v117)(v120, v121);
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();

        uint64_t v35 = v119;
      }
      else
      {
        swift_unknownObjectRelease();
      }
LABEL_8:
      ++v6;
      if (v38 == v35) {
        goto LABEL_50;
      }
    }
  }
  uint64_t v36 = &_swiftEmptyArrayStorage;
LABEL_50:
  swift_bridgeObjectRelease();
  uint64_t v6 = v123;
  if (v123 >> 62)
  {
    swift_bridgeObjectRetain();
    unint64_t v122 = sub_93E10();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v122 = *(void *)((char *)&dword_10 + (v123 & 0xFFFFFFFFFFFFFF8));
  }
  if (v122)
  {
    uint64_t v76 = (void (**)(char *, char *, uint64_t))(v124 + 16);
    BOOL v120 = (char *)(v124 + 32);
    unint64_t v121 = v6 & 0xC000000000000001;
    uint64_t v119 = v124 + 8;
    uint64_t v25 = 4;
    while (1)
    {
      unint64_t v26 = v25 - 4;
      if (v121)
      {
        uint64_t v77 = (void *)sub_93D70();
        unint64_t v34 = v25 - 3;
        if (__OFADD__(v26, 1)) {
          goto LABEL_68;
        }
      }
      else
      {
        uint64_t v77 = *(void **)(v6 + 8 * v25);
        swift_unknownObjectRetain();
        unint64_t v34 = v25 - 3;
        if (__OFADD__(v26, 1)) {
          goto LABEL_68;
        }
      }
      id v78 = [v77 members:v90];
      if (!v78) {
        break;
      }
      unint64_t v79 = v78;
      sub_93C20();

      swift_bridgeObjectRelease();
      id v80 = [v77 collectionID];
      if (!v80) {
        goto LABEL_72;
      }
      double v81 = v80;
      sub_93A60();

      id v20 = v125;
      sub_93890();
      swift_bridgeObjectRelease();
      (*v76)(v126, v20, v127);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v36 = (void *)sub_87728(0, v36[2] + 1, 1, (unint64_t)v36);
      }
      unint64_t v83 = v36[2];
      unint64_t v82 = v36[3];
      if (v83 >= v82 >> 1) {
        uint64_t v36 = (void *)sub_87728(v82 > 1, v83 + 1, 1, (unint64_t)v36);
      }
      void v36[2] = v83 + 1;
      uint64_t v84 = v124;
      unint64_t v85 = (unint64_t)v36
          + ((*(unsigned __int8 *)(v84 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v84 + 80))
          + *(void *)(v84 + 72) * v83;
      uint64_t v86 = v127;
      (*(void (**)(unint64_t, char *, uint64_t))(v124 + 32))(v85, v126, v127);
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v84 + 8))(v125, v86);
      ++v25;
      uint64_t v6 = v123;
      if (v34 == v122) {
        goto LABEL_66;
      }
    }
    __break(1u);
LABEL_72:
    __break(1u);
LABEL_73:

    __break(1u);
  }
LABEL_66:
  swift_bridgeObjectRelease();
  long long v87 = v108;
  sub_938D0();
  unint64_t v88 = v102;
  uint64_t v89 = v103;
  (*(void (**)(char *, char *, uint64_t))(v102 + 16))(v107, v87, v103);
  sub_71350(&qword_EE230);
  sub_93B60();
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v88 + 8))(v87, v89);
}

uint64_t sub_846F0()
{
  uint64_t v1 = sub_71350(&qword_EE230);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_847C0(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_71350(&qword_EE230) - 8);
  uint64_t v4 = *(void **)(v1 + 16);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_83578(a1, v4, v5);
}

uint64_t sub_84838(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_84848()
{
  return swift_release();
}

uint64_t sub_84850()
{
  uint64_t v1 = sub_71350(&qword_EE258);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v6 + 8, v5);
}

void sub_848F8(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_71350(&qword_EE258) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void **)(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8));

  sub_829B8(a1, v1 + v4, v5);
}

uint64_t sub_849A0(uint64_t a1)
{
  *(void *)(v2 + 184) = v1;
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 192) = v4;
  void *v4 = v2;
  v4[1] = sub_84A50;
  v4[18] = a1;
  v4[19] = v1;
  return _swift_task_switch(sub_853A4, 0, 0);
}

uint64_t sub_84A50(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 200) = a1;
  *(void *)(v3 + 20_Block_object_dispose(&STACK[0x380], 8) = v1;
  swift_task_dealloc();
  if (v1) {
    unint64_t v4 = sub_85184;
  }
  else {
    unint64_t v4 = sub_84B64;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_84B64()
{
  *(_OWORD *)(v0 + 136) = 0u;
  *(void *)(v0 + 176) = &_swiftEmptyArrayStorage;
  uint64_t v1 = *(void *)(v0 + 200);
  *(_OWORD *)(v0 + 152) = 0u;
  sub_8923C(*(void *)(v1 + 16));
  sub_93B10();
  uint64_t v2 = *(void *)(v1 + 16);
  *(void *)(v0 + 216) = v2;
  if (!v2)
  {
LABEL_15:
    uint64_t v20 = *(void *)(v0 + 176);
    swift_bridgeObjectRelease();
    sub_85E58();
    id v21 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v21(v20);
  }
  uint64_t v3 = swift_bridgeObjectRetain();
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  while (1)
  {
    *(void *)(v0 + 256) = v6;
    *(void *)(v0 + 240) = 0;
    *(void *)(v0 + 24_Block_object_dispose(&STACK[0x380], 8) = 0;
    *(void *)(v0 + 224) = v4;
    *(void *)(v0 + 232) = v5;
    uint64_t v7 = v3 + 120 * v6;
    long long v8 = *(_OWORD *)(v7 + 32);
    long long v9 = *(_OWORD *)(v7 + 48);
    long long v10 = *(_OWORD *)(v7 + 80);
    *(_OWORD *)(v0 + 4_Block_object_dispose(&STACK[0x380], 8) = *(_OWORD *)(v7 + 64);
    *(_OWORD *)(v0 + 64) = v10;
    *(_OWORD *)(v0 + 16) = v8;
    *(_OWORD *)(v0 + 32) = v9;
    long long v11 = *(_OWORD *)(v7 + 96);
    long long v12 = *(_OWORD *)(v7 + 112);
    long long v13 = *(_OWORD *)(v7 + 128);
    *(_DWORD *)(v0 + 127) = *(_DWORD *)(v7 + 143);
    *(_OWORD *)(v0 + 96) = v12;
    *(_OWORD *)(v0 + 112) = v13;
    *(_OWORD *)(v0 + 80) = v11;
    char v14 = *(unsigned char *)(v0 + 130);
    int v15 = *(unsigned __int16 *)(v0 + 128);
    uint64_t result = sub_892FC(v0 + 16);
    if (v15 == 1) {
      break;
    }
    if (v15 != 6)
    {
      BOOL v17 = __OFADD__(v4++, 1);
      if (v17) {
        goto LABEL_23;
      }
      *(void *)(v0 + 136) = v4;
      goto LABEL_12;
    }
    if ((v14 & 1) == 0)
    {
      char v22 = 1;
      goto LABEL_19;
    }
LABEL_8:
    BOOL v17 = __OFADD__(v5++, 1);
    if (v17)
    {
      __break(1u);
LABEL_23:
      __break(1u);
      return result;
    }
    *(void *)(v0 + 144) = v5;
LABEL_12:
    uint64_t v18 = *(void *)(v0 + 216);
    uint64_t v19 = *(void *)(v0 + 256) + 1;
    sub_89388(v0 + 16);
    if (v19 == v18)
    {
      swift_bridgeObjectRelease();
      goto LABEL_15;
    }
    uint64_t v6 = *(void *)(v0 + 256) + 1;
    uint64_t v3 = *(void *)(v0 + 200);
  }
  if (v14) {
    goto LABEL_8;
  }
  char v22 = 0;
LABEL_19:
  *(unsigned char *)(v0 + 131) = v22;
  uint64_t v23 = (void *)swift_task_alloc();
  *(void *)(v0 + 264) = v23;
  void *v23 = v0;
  v23[1] = sub_84D90;
  return sub_86014(v0 + 16);
}

uint64_t sub_84D90(char a1)
{
  *(unsigned char *)(*(void *)v1 + 132) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_84E90, 0, 0);
}

uint64_t sub_84E90()
{
  if (*(unsigned char *)(v0 + 132))
  {
    uint64_t v2 = *(void *)(v0 + 240);
    uint64_t v3 = v2 + 1;
    if (!__OFADD__(v2, 1))
    {
      *(void *)(v0 + 152) = v3;
      uint64_t v1 = *(void *)(v0 + 248);
      goto LABEL_9;
    }
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  uint64_t v4 = *(void *)(v0 + 248);
  uint64_t v1 = v4 + 1;
  if (__OFADD__(v4, 1))
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  uint64_t v5 = *(unsigned __int8 *)(v0 + 131);
  *(void *)(v0 + 160) = v1;
  id v6 = objc_allocWithZone((Class)BDSDistributedPriceTrackingConfigItemID);
  swift_bridgeObjectRetain();
  NSString v7 = sub_93A30();
  swift_bridgeObjectRelease();
  id v8 = [v6 initWithAdamID:v7 isAudiobook:v5];

  if (v8)
  {
    sub_93AD0();
    if (*(void *)((char *)&dword_10 + (*(void *)(v0 + 176) & 0xFFFFFFFFFFFFFF8)) < *(void *)((char *)&dword_18 + (*(void *)(v0 + 176) & 0xFFFFFFFFFFFFFF8)) >> 1)
    {
LABEL_7:
      sub_93B30();
      sub_93B10();
      goto LABEL_8;
    }
LABEL_31:
    sub_93B20();
    goto LABEL_7;
  }
LABEL_8:
  uint64_t v3 = *(void *)(v0 + 240);
LABEL_9:
  long long v9 = (_OWORD *)(v0 + 16);
  uint64_t v11 = *(void *)(v0 + 224);
  uint64_t v10 = *(void *)(v0 + 232);
  uint64_t v12 = *(void *)(v0 + 216);
  uint64_t v13 = *(void *)(v0 + 256) + 1;
  sub_89388(v0 + 16);
  if (v13 == v12)
  {
LABEL_10:
    swift_bridgeObjectRelease();
    uint64_t v14 = *(void *)(v0 + 176);
    swift_bridgeObjectRelease();
    sub_85E58();
    int v15 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v15(v14);
  }
  while (1)
  {
    uint64_t v17 = *(void *)(v0 + 256) + 1;
    *(void *)(v0 + 24_Block_object_dispose(&STACK[0x380], 8) = v1;
    *(void *)(v0 + 256) = v17;
    *(void *)(v0 + 232) = v10;
    *(void *)(v0 + 240) = v3;
    *(void *)(v0 + 224) = v11;
    uint64_t v18 = *(void *)(v0 + 200) + 120 * v17;
    long long v19 = *(_OWORD *)(v18 + 80);
    long long v21 = *(_OWORD *)(v18 + 32);
    long long v20 = *(_OWORD *)(v18 + 48);
    *(_OWORD *)(v0 + 4_Block_object_dispose(&STACK[0x380], 8) = *(_OWORD *)(v18 + 64);
    *(_OWORD *)(v0 + 64) = v19;
    _OWORD *v9 = v21;
    *(_OWORD *)(v0 + 32) = v20;
    long long v23 = *(_OWORD *)(v18 + 112);
    long long v22 = *(_OWORD *)(v18 + 128);
    long long v24 = *(_OWORD *)(v18 + 96);
    *(_DWORD *)(v0 + 127) = *(_DWORD *)(v18 + 143);
    *(_OWORD *)(v0 + 96) = v23;
    *(_OWORD *)(v0 + 112) = v22;
    *(_OWORD *)(v0 + 80) = v24;
    char v25 = *(unsigned char *)(v0 + 130);
    int v26 = *(unsigned __int16 *)(v0 + 128);
    uint64_t result = sub_892FC(v0 + 16);
    if (v26 == 1) {
      break;
    }
    if (v26 == 6)
    {
      if ((v25 & 1) == 0)
      {
        char v32 = 1;
        goto LABEL_25;
      }
LABEL_18:
      if (__OFADD__(v10, 1))
      {
        __break(1u);
        goto LABEL_29;
      }
      *(void *)(v0 + 144) = v10 + 1;
      uint64_t v27 = *(void *)(v0 + 216);
      uint64_t v28 = *(void *)(v0 + 256) + 1;
      sub_89388(v0 + 16);
      ++v10;
      if (v28 == v27) {
        goto LABEL_10;
      }
    }
    else
    {
      if (__OFADD__(v11++, 1))
      {
        __break(1u);
        return result;
      }
      *(void *)(v0 + 136) = v11;
      uint64_t v30 = *(void *)(v0 + 216);
      uint64_t v31 = *(void *)(v0 + 256) + 1;
      sub_89388(v0 + 16);
      if (v31 == v30) {
        goto LABEL_10;
      }
    }
  }
  if (v25) {
    goto LABEL_18;
  }
  char v32 = 0;
LABEL_25:
  *(unsigned char *)(v0 + 131) = v32;
  long long v33 = (void *)swift_task_alloc();
  *(void *)(v0 + 264) = v33;
  void *v33 = v0;
  v33[1] = sub_84D90;
  return sub_86014((uint64_t)v9);
}

uint64_t sub_85184()
{
  if (qword_ED9C0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_93940();
  sub_71428(v1, (uint64_t)qword_EF0E8);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = sub_93920();
  os_log_type_t v3 = sub_93C70();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 138412290;
    swift_errorRetain();
    uint64_t v6 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 16_Block_object_dispose(&STACK[0x380], 8) = v6;
    sub_93CE0();
    *uint64_t v5 = v6;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v2, v3, "[WTR-members] Failed to get snapshots for price-tracking assets: %@", v4, 0xCu);
    sub_71350(&qword_EDDD8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  swift_errorRelease();
  NSString v7 = *(uint64_t (**)(void *))(v0 + 8);
  return v7(&_swiftEmptyArrayStorage);
}

uint64_t sub_85384(uint64_t a1)
{
  *(void *)(v2 + 144) = a1;
  *(void *)(v2 + 152) = v1;
  return _swift_task_switch(sub_853A4, 0, 0);
}

uint64_t sub_853A4()
{
  uint64_t v2 = v0[18];
  uint64_t v1 = (void *)v0[19];
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_854A4;
  uint64_t v3 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_86438;
  v0[13] = &unk_D3E88;
  v0[14] = v3;
  [v1 storeAssetIDsOfWantToReadWithLimit:v2 completion:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_854A4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 160) = v1;
  if (v1) {
    uint64_t v2 = sub_85D80;
  }
  else {
    uint64_t v2 = sub_855B4;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_855B4()
{
  uint64_t v1 = v0[19];
  uint64_t v2 = v0[15];
  v0[21] = v2;
  uint64_t v3 = swift_task_alloc();
  v0[22] = v3;
  *(void *)(v3 + 16) = v1;
  *(void *)(v3 + 24) = v2;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[23] = v4;
  uint64_t v5 = sub_71350(&qword_EE290);
  void *v4 = v0;
  v4[1] = sub_856C0;
  return withCheckedThrowingContinuation<A>(isolation:function:_:)(v0 + 16, 0, 0, 0xD00000000000001BLL, 0x80000000000B5400, sub_89468, v3, v5);
}

uint64_t sub_856C0()
{
  *(void *)(*(void *)v1 + 192) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_85DEC;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_857DC;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_857DC()
{
  unint64_t v51 = v0;
  uint64_t v1 = *(void *)(v0 + 128);
  uint64_t v2 = (void *)sub_86B40((uint64_t)&_swiftEmptyArrayStorage);
  uint64_t v3 = *(void *)(v1 + 16);
  if (v3)
  {
    unint64_t v37 = v0;
    swift_bridgeObjectRetain();
    uint64_t v4 = (uint64_t *)(v1 + 80);
    while (1)
    {
      uint64_t v6 = (char *)*(v4 - 5);
      uint64_t v38 = v3;
      uint64_t v39 = *(v4 - 6);
      uint64_t v7 = *(v4 - 3);
      uint64_t v9 = *(v4 - 2);
      uint64_t v8 = *(v4 - 1);
      uint64_t v10 = v4[1];
      uint64_t v40 = *(v4 - 4);
      uint64_t v41 = *v4;
      uint64_t v11 = v4[3];
      uint64_t v42 = v4[2];
      uint64_t v12 = v4[5];
      uint64_t v44 = v4[4];
      uint64_t v46 = v4[6];
      __int16 v48 = *((_WORD *)v4 + 32);
      char v49 = *((unsigned char *)v4 + 66);
      uint64_t v47 = v4[7];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v43 = v11;
      swift_bridgeObjectRetain();
      uint64_t v45 = v12;
      swift_bridgeObjectRetain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v50 = v2;
      unint64_t v0 = sub_8DEAC(v9, v8);
      uint64_t v15 = v2[2];
      BOOL v16 = (v14 & 1) == 0;
      uint64_t v17 = v15 + v16;
      if (__OFADD__(v15, v16))
      {
        __break(1u);
LABEL_31:
        __break(1u);
        goto LABEL_32;
      }
      char v18 = v14;
      if (v2[3] >= v17)
      {
        if (isUniquelyReferenced_nonNull_native)
        {
          if (v14) {
            goto LABEL_3;
          }
        }
        else
        {
          sub_8987C();
          uint64_t v2 = v50;
          if (v18) {
            goto LABEL_3;
          }
        }
      }
      else
      {
        sub_89470(v17, isUniquelyReferenced_nonNull_native);
        uint64_t v2 = v50;
        unint64_t v19 = sub_8DEAC(v9, v8);
        if ((v18 & 1) != (v20 & 1))
        {
          return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
        }
        unint64_t v0 = v19;
        if (v18)
        {
LABEL_3:
          uint64_t v5 = v2[7] + 120 * v0;
          *(void *)uint64_t v5 = v39;
          *(void *)(v5 + _Block_object_dispose(&STACK[0x380], 8) = v6;
          *(void *)(v5 + 16) = v40;
          *(void *)(v5 + 24) = v7;
          *(void *)(v5 + 32) = v9;
          *(void *)(v5 + 40) = v8;
          *(void *)(v5 + 4_Block_object_dispose(&STACK[0x380], 8) = v41;
          *(void *)(v5 + 56) = v10;
          *(void *)(v5 + 64) = v42;
          *(void *)(v5 + 72) = v43;
          *(void *)(v5 + 80) = v44;
          *(void *)(v5 + 8_Block_object_dispose(&STACK[0x380], 8) = v45;
          *(void *)(v5 + 96) = v46;
          *(void *)(v5 + 104) = v47;
          *(_WORD *)(v5 + 112) = v48;
          *(unsigned char *)(v5 + 114) = v49;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
      }
      v2[(v0 >> 6) + 8] |= 1 << v0;
      long long v21 = (uint64_t *)(v2[6] + 16 * v0);
      uint64_t *v21 = v9;
      v21[1] = v8;
      uint64_t v22 = v2[7] + 120 * v0;
      *(void *)uint64_t v22 = v39;
      *(void *)(v22 + _Block_object_dispose(&STACK[0x380], 8) = v6;
      *(void *)(v22 + 16) = v40;
      *(void *)(v22 + 24) = v7;
      *(void *)(v22 + 32) = v9;
      *(void *)(v22 + 40) = v8;
      *(void *)(v22 + 4_Block_object_dispose(&STACK[0x380], 8) = v41;
      *(void *)(v22 + 56) = v10;
      *(void *)(v22 + 64) = v42;
      *(void *)(v22 + 72) = v43;
      *(void *)(v22 + 80) = v44;
      *(void *)(v22 + 8_Block_object_dispose(&STACK[0x380], 8) = v45;
      *(void *)(v22 + 96) = v46;
      *(void *)(v22 + 104) = v47;
      *(_WORD *)(v22 + 112) = v48;
      *(unsigned char *)(v22 + 114) = v49;
      uint64_t v23 = v2[2];
      BOOL v24 = __OFADD__(v23, 1);
      uint64_t v25 = v23 + 1;
      if (v24) {
        goto LABEL_31;
      }
      v2[2] = v25;
      swift_bridgeObjectRetain();
LABEL_4:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v4 += 15;
      uint64_t v3 = v38 - 1;
      if (v38 == 1)
      {
        swift_bridgeObjectRelease();
        unint64_t v0 = v37;
        break;
      }
    }
  }
  uint64_t v26 = *(void *)(v0 + 168);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_89BDC(v26, (uint64_t)v2);
  swift_bridgeObjectRelease();
  if (*(void *)(v26 + 16) == *((void *)v6 + 2))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v27 = sub_89E1C(*(void *)(v0 + 168));
    swift_bridgeObjectRelease();
    sub_87F74((uint64_t)v2, v27);
    swift_bridgeObjectRelease();
    if (qword_ED9C0 != -1) {
LABEL_32:
    }
      swift_once();
    uint64_t v28 = sub_93940();
    sub_71428(v28, (uint64_t)qword_EF0E8);
    swift_retain();
    id v29 = sub_93920();
    os_log_type_t v30 = sub_93C70();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      uint64_t v50 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v31 = 136315138;
      swift_retain();
      uint64_t v32 = sub_93C30();
      unint64_t v34 = v33;
      swift_release();
      *(void *)(v0 + 136) = sub_7B778(v32, v34, (uint64_t *)&v50);
      sub_93CE0();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_0, v29, v30, "[WTR-members] Missing snapshots for store IDs %s", v31, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_release_n();
    }
  }
  uint64_t v35 = *(uint64_t (**)(char *))(v0 + 8);
  return v35(v6);
}

uint64_t sub_85D80()
{
  swift_willThrow();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_85DEC()
{
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_85E58()
{
  if (qword_ED9C0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_93940();
  sub_71428(v0, (uint64_t)qword_EF0E8);
  oslog = sub_93920();
  os_log_type_t v1 = sub_93C80();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    *(_DWORD *)uint64_t v2 = 136446210;
    swift_beginAccess();
    uint64_t v3 = sub_87434();
    sub_7B778(v3, v4, &v6);
    sub_93CE0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, oslog, v1, "[WTR-members] stats -> %{public}s", v2, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

uint64_t sub_86014(uint64_t a1)
{
  *(void *)(v2 + 64) = v1;
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 72) = v4;
  void *v4 = v2;
  v4[1] = sub_860C4;
  v4[40] = a1;
  v4[41] = v1;
  return _swift_task_switch(sub_86D64, 0, 0);
}

uint64_t sub_860C4(uint64_t a1)
{
  uint64_t v4 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    swift_errorRelease();
    uint64_t v5 = sub_863C4;
  }
  else
  {
    *(void *)(v4 + 80) = a1;
    uint64_t v5 = sub_861F0;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_861F0()
{
  uint64_t v1 = *(void **)(v0 + 80);
  if (v1)
  {
    id v2 = [*(id *)(v0 + 80) familyID];
    if (v2)
    {
      uint64_t v3 = sub_93A60();
      uint64_t v5 = v4;

      *(void *)(v0 + 16) = v3;
      *(void *)(v0 + 24) = v5;
      id v2 = (id)sub_93EA0();
      sub_89414(v0 + 16);
    }
    id v6 = [v1 purchasedDSID];
    if (v6)
    {
      uint64_t v7 = sub_93A60();
      uint64_t v9 = v8;

      *(void *)(v0 + 32) = v7;
      *(void *)(v0 + 40) = v9;
      id v6 = (id)sub_93EA0();
      sub_89414(v0 + 32);
    }
    id v10 = [v1 downloadedDSID];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = sub_93A60();
      uint64_t v14 = v13;

      *(void *)(v0 + 4_Block_object_dispose(&STACK[0x380], 8) = v12;
      *(void *)(v0 + 56) = v14;
      uint64_t v15 = sub_93EA0();
      sub_89414(v0 + 48);
    }
    else
    {
      uint64_t v15 = 0;
    }
  }
  else
  {
    id v6 = 0;
    id v2 = 0;
    uint64_t v15 = 0;
  }
  id v16 = [*(id *)(v0 + 64) isFamilyPurchaseWithFamilyID:v2 purchaserDSID:v6 downloaderDSID:v15];
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  uint64_t v17 = *(uint64_t (**)(id))(v0 + 8);
  return v17(v16);
}

uint64_t sub_863C4()
{
  id v1 = [*(id *)(v0 + 64) isFamilyPurchaseWithFamilyID:0 purchaserDSID:0 downloaderDSID:0];
  id v2 = *(uint64_t (**)(id))(v0 + 8);
  return v2(v1);
}

uint64_t sub_86438(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_71350(&qword_EDDE0);
    uint64_t v5 = swift_allocError();
    *id v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    **(void **)(*(void *)(v3 + 64) + 40) = sub_93AF0();
    return _swift_continuation_throwingResume(v3);
  }
}

void sub_86500(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_71350(&qword_EE2B0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6);
  sub_866DC(a3);
  Class isa = sub_93AE0().super.isa;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  unint64_t v10 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v11 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v11 + v10, (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  aBlock[4] = sub_89FE8;
  aBlock[5] = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_86AAC;
  aBlock[3] = &unk_D3EC8;
  uint64_t v12 = _Block_copy(aBlock);
  swift_release();
  [a2 fetchLibraryAssetsFromStoreIDs:isa handler:v12];
  _Block_release(v12);
}

void *sub_866DC(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  id v2 = &_swiftEmptyArrayStorage;
  if (v1)
  {
    uint64_t v9 = &_swiftEmptyArrayStorage;
    sub_879EC(0, v1, 0);
    id v2 = &_swiftEmptyArrayStorage;
    uint64_t v4 = a1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_879EC(0, v2[2] + 1, 1);
        id v2 = v9;
      }
      unint64_t v6 = v2[2];
      unint64_t v5 = v2[3];
      if (v6 >= v5 >> 1)
      {
        sub_879EC(v5 > 1, v6 + 1, 1);
        id v2 = v9;
      }
      v4 += 16;
      v2[2] = v6 + 1;
      sub_8A640(&v8, &v2[4 * v6 + 4]);
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_86804(unint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_errorRetain();
    swift_willThrow();
    v35[0] = a2;
    sub_71350(&qword_EE2B0);
    return sub_93B50();
  }
  unint64_t v4 = a1;
  if (!a1) {
    goto LABEL_21;
  }
  if (!(a1 >> 62))
  {
    uint64_t v5 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
    uint64_t result = swift_bridgeObjectRetain_n();
    if (v5) {
      goto LABEL_6;
    }
LABEL_20:
    swift_bridgeObjectRelease_n();
LABEL_21:
    sub_71350(&qword_EE2B0);
    return sub_93B60();
  }
  swift_bridgeObjectRetain_n();
  unint64_t v4 = a1;
  uint64_t result = sub_93E10();
  uint64_t v5 = result;
  if (!result) {
    goto LABEL_20;
  }
LABEL_6:
  if (v5 >= 1)
  {
    uint64_t v6 = 0;
    unint64_t v20 = v4 & 0xC000000000000001;
    uint64_t v7 = (char *)&_swiftEmptyArrayStorage;
    uint64_t v21 = v5;
    do
    {
      if (v20) {
        id v9 = (id)sub_93D70();
      }
      else {
        id v9 = *(id *)(v4 + 8 * v6 + 32);
      }
      unint64_t v10 = v9;
      sub_8A220(v9, (uint64_t)v32);
      uint64_t v11 = v32[0];
      uint64_t v13 = v32[2];
      uint64_t v12 = v32[3];
      uint64_t v14 = v32[5];
      uint64_t v30 = v32[4];
      uint64_t v31 = v32[1];
      uint64_t v28 = v32[7];
      uint64_t v29 = v32[6];
      uint64_t v26 = v32[9];
      uint64_t v27 = v32[8];
      uint64_t v24 = v32[11];
      uint64_t v25 = v32[10];
      uint64_t v22 = v32[13];
      uint64_t v23 = v32[12];
      int v15 = v34;
      int v16 = v33;

      sub_8A5DC((uint64_t)v32, (uint64_t)v35, &qword_EE2B8);
      if (v35[5])
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v7 = sub_875E0(0, *((void *)v7 + 2) + 1, 1, v7);
        }
        unint64_t v18 = *((void *)v7 + 2);
        unint64_t v17 = *((void *)v7 + 3);
        if (v18 >= v17 >> 1) {
          uint64_t v7 = sub_875E0((char *)(v17 > 1), v18 + 1, 1, v7);
        }
        *((void *)v7 + 2) = v18 + 1;
        long long v8 = &v7[120 * v18];
        *((void *)v8 + 4) = v11;
        *((void *)v8 + 5) = v31;
        *((void *)v8 + 6) = v13;
        *((void *)v8 + 7) = v12;
        *((void *)v8 + _Block_object_dispose(&STACK[0x380], 8) = v30;
        *((void *)v8 + 9) = v14;
        *((void *)v8 + 10) = v29;
        *((void *)v8 + 11) = v28;
        *((void *)v8 + 12) = v27;
        *((void *)v8 + 13) = v26;
        *((void *)v8 + 14) = v25;
        *((void *)v8 + 15) = v24;
        *((void *)v8 + 16) = v23;
        *((void *)v8 + 17) = v22;
        *((_WORD *)v8 + 72) = v16;
        v8[146] = ((v16 | (v15 << 16)) >> 16) & 1;
        unint64_t v4 = a1;
      }
      ++v6;
    }
    while (v21 != v6);
    goto LABEL_20;
  }
  __break(1u);
  return result;
}

uint64_t sub_86AAC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_8A084();
    uint64_t v4 = sub_93AF0();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

unint64_t sub_86B40(uint64_t a1)
{
  uint64_t v1 = a1;
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_10;
  }
  sub_71350(&qword_EE298);
  uint64_t v2 = sub_93E50();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(v1 + 16);
  if (!v4)
  {
LABEL_10:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v23 = v2 + 64;
  swift_retain();
  uint64_t v25 = v4 - 1;
  uint64_t v5 = 32;
  for (i = v1; ; uint64_t v1 = i)
  {
    uint64_t v24 = v5;
    uint64_t v6 = v1 + v5;
    long long v7 = *(_OWORD *)(v6 + 48);
    long long v36 = *(_OWORD *)(v6 + 32);
    long long v37 = v7;
    long long v8 = *(_OWORD *)(v6 + 80);
    long long v38 = *(_OWORD *)(v6 + 64);
    long long v39 = v8;
    long long v9 = *(_OWORD *)(v6 + 112);
    long long v40 = *(_OWORD *)(v6 + 96);
    *(_OWORD *)uint64_t v41 = v9;
    *(_DWORD *)&v41[15] = *(_DWORD *)(v6 + 127);
    long long v10 = *(_OWORD *)(v6 + 16);
    v35[0] = *(_OWORD *)v6;
    v35[1] = v10;
    long long v11 = v10;
    long long v12 = v36;
    long long v13 = v37;
    uint64_t v14 = v38;
    uint64_t v33 = v39;
    uint64_t v34 = *((void *)&v38 + 1);
    uint64_t v31 = v40;
    uint64_t v32 = *((void *)&v39 + 1);
    uint64_t v29 = v9;
    uint64_t v30 = *((void *)&v40 + 1);
    uint64_t v28 = *(void *)&v41[8];
    char v26 = v41[18];
    __int16 v27 = *(_WORD *)&v41[16];
    long long v15 = v35[0];
    sub_89EBC((uint64_t)v35);
    unint64_t result = sub_8DEAC(v15, *((uint64_t *)&v15 + 1));
    if (v17) {
      break;
    }
    *(void *)(v23 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_OWORD *)(v3[6] + 16 * result) = v15;
    uint64_t v18 = v3[7] + 120 * result;
    *(_OWORD *)uint64_t v18 = v11;
    *(_OWORD *)(v18 + 16) = v12;
    *(_OWORD *)(v18 + 32) = v13;
    *(void *)(v18 + 4_Block_object_dispose(&STACK[0x380], 8) = v14;
    *(void *)(v18 + 56) = v34;
    *(void *)(v18 + 64) = v33;
    *(void *)(v18 + 72) = v32;
    *(void *)(v18 + 80) = v31;
    *(void *)(v18 + 8_Block_object_dispose(&STACK[0x380], 8) = v30;
    *(void *)(v18 + 96) = v29;
    *(void *)(v18 + 104) = v28;
    *(_WORD *)(v18 + 112) = v27;
    *(unsigned char *)(v18 + 114) = v26;
    uint64_t v19 = v3[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_12;
    }
    v3[2] = v21;
    if (!v25)
    {
      swift_release();
      goto LABEL_10;
    }
    --v25;
    uint64_t v5 = v24 + 136;
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_86D44(uint64_t a1)
{
  *(void *)(v2 + 320) = a1;
  *(void *)(v2 + 32_Block_object_dispose(&STACK[0x380], 8) = v1;
  return _swift_task_switch(sub_86D64, 0, 0);
}

uint64_t sub_86D64()
{
  sub_8A5DC(v0[40], (uint64_t)(v0 + 23), &qword_EE288);
  sub_8A5DC((uint64_t)(v0 + 23), (uint64_t)(v0 + 21), &qword_EE288);
  if (v0[22]) {
    NSString v1 = sub_93A30();
  }
  else {
    NSString v1 = 0;
  }
  NSString v13 = v1;
  v0[42] = v1;
  sub_8A5DC(v0[40] + 16, (uint64_t)(v0 + 35), &qword_EE288);
  sub_8A5DC((uint64_t)(v0 + 35), (uint64_t)(v0 + 19), &qword_EE288);
  if (v0[20]) {
    NSString v2 = sub_93A30();
  }
  else {
    NSString v2 = 0;
  }
  NSString v12 = v2;
  v0[43] = v2;
  uint64_t v3 = v0[40];
  NSString v4 = sub_93A30();
  v0[44] = v4;
  sub_8A5DC(v3 + 48, (uint64_t)(v0 + 27), &qword_EE288);
  sub_8A5DC((uint64_t)(v0 + 27), (uint64_t)(v0 + 17), &qword_EE288);
  if (v0[18]) {
    NSString v5 = sub_93A30();
  }
  else {
    NSString v5 = 0;
  }
  v0[45] = v5;
  sub_8A5DC(v0[40] + 64, (uint64_t)(v0 + 29), &qword_EE288);
  sub_8A5DC((uint64_t)(v0 + 29), (uint64_t)(v0 + 15), &qword_EE288);
  if (v0[16]) {
    NSString v6 = sub_93A30();
  }
  else {
    NSString v6 = 0;
  }
  v0[46] = v6;
  sub_8A5DC(v0[40] + 80, (uint64_t)(v0 + 31), &qword_EE288);
  sub_8A5DC((uint64_t)(v0 + 31), (uint64_t)(v0 + 37), &qword_EE288);
  if (v0[38]) {
    NSString v7 = sub_93A30();
  }
  else {
    NSString v7 = 0;
  }
  v0[47] = v7;
  sub_8A5DC(v0[40] + 96, (uint64_t)(v0 + 33), &qword_EE288);
  sub_8A5DC((uint64_t)(v0 + 33), (uint64_t)(v0 + 25), &qword_EE288);
  if (v0[26]) {
    NSString v8 = sub_93A30();
  }
  else {
    NSString v8 = 0;
  }
  v0[48] = v8;
  long long v9 = (void *)v0[41];
  v0[2] = v0;
  v0[7] = v0 + 39;
  v0[3] = sub_87078;
  uint64_t v10 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_872DC;
  v0[13] = &unk_D3E70;
  v0[14] = v10;
  [v9 assetAccountIdentifiersForAssetID:v13 path:v12 storeID:v4 purchasedDSID:v5 downloadedDSID:v6 familyID:v7 dataSourceID:v8 completion:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_87078()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 392) = v1;
  if (v1) {
    NSString v2 = sub_87230;
  }
  else {
    NSString v2 = sub_87188;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_87188()
{
  uint64_t v1 = *(void **)(v0 + 376);
  uint64_t v3 = *(void **)(v0 + 360);
  NSString v2 = *(void **)(v0 + 368);
  NSString v5 = *(void **)(v0 + 344);
  uint64_t v4 = *(void **)(v0 + 352);
  NSString v6 = *(void **)(v0 + 336);
  uint64_t v7 = *(void *)(v0 + 312);

  NSString v8 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v8(v7);
}

uint64_t sub_87230()
{
  uint64_t v1 = (void *)v0[48];
  uint64_t v3 = (void *)v0[46];
  NSString v2 = (void *)v0[47];
  NSString v5 = (void *)v0[44];
  uint64_t v4 = (void *)v0[45];
  uint64_t v7 = (void *)v0[42];
  NSString v6 = (void *)v0[43];
  swift_willThrow();

  NSString v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_872DC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_71350(&qword_EDDE0);
    uint64_t v5 = swift_allocError();
    *NSString v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    if (a2)
    {
      **(void **)(*(void *)(v3 + 64) + 40) = a2;
      swift_unknownObjectRetain();
      a1 = v3;
    }
    else
    {
      __break(1u);
    }
    return _swift_continuation_throwingResume(a1);
  }
}

uint64_t sub_873A0(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_7CF08;
  return sub_849A0(a1);
}

uint64_t sub_87434()
{
  sub_93D40(56);
  v1._countAndFlagsBits = 0x3A6465726F6E6769;
  v1._object = (void *)0xE900000000000020;
  sub_93AB0(v1);
  v2._countAndFlagsBits = sub_93E90();
  sub_93AB0(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 0x746365726964202CLL;
  v3._object = (void *)0xEF203A64656E774FLL;
  sub_93AB0(v3);
  v4._countAndFlagsBits = sub_93E90();
  sub_93AB0(v4);
  swift_bridgeObjectRelease();
  v5._countAndFlagsBits = 0x796C696D6166202CLL;
  v5._object = (void *)0xEF203A64656E774FLL;
  sub_93AB0(v5);
  v6._countAndFlagsBits = sub_93E90();
  sub_93AB0(v6);
  swift_bridgeObjectRelease();
  v7._countAndFlagsBits = 0x3A646E756F66202CLL;
  v7._object = (void *)0xE900000000000020;
  sub_93AB0(v7);
  v8._countAndFlagsBits = sub_93E90();
  sub_93AB0(v8);
  swift_bridgeObjectRelease();
  return 0;
}

char *sub_875E0(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_71350(&qword_EE2A8);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 120);
      NSString v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[120 * v8 + 32]) {
          memmove(v12, a4 + 32, 120 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      NSString v12 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result) {
        goto LABEL_13;
      }
    }
    sub_89AE4(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_87704(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_8774C(a1, a2, a3, a4, &qword_EE2D0, (uint64_t (*)(void))&type metadata accessor for LibraryItemTypeData, (uint64_t (*)(void))&type metadata accessor for LibraryItemTypeData);
}

uint64_t sub_87728(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_8774C(a1, a2, a3, a4, &qword_EE2C8, (uint64_t (*)(void))&type metadata accessor for CollectionIDData, (uint64_t (*)(void))&type metadata accessor for CollectionIDData);
}

uint64_t sub_8774C(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v12 = a2;
      }
    }
  }
  else
  {
    uint64_t v12 = a2;
  }
  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (!v14)
  {
    uint64_t v18 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_71350(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v18 = (void *)swift_allocObject();
  size_t v19 = j__malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = sub_93E00();
    __break(1u);
    return result;
  }
  v18[2] = v13;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v16);
LABEL_19:
  uint64_t v21 = *(void *)(a6(0) - 8);
  unint64_t v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v23 = (unint64_t)v18 + v22;
  if (a1)
  {
    if ((unint64_t)v18 < a4 || v23 >= a4 + v22 + *(void *)(v21 + 72) * v13)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v18 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_8A0C4(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

uint64_t sub_879CC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_87A0C(a1, a2, a3, (void *)*v3);
  *Swift::String v3 = result;
  return result;
}

uint64_t sub_879EC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_87C54(a1, a2, a3, *v3);
  *Swift::String v3 = (char *)result;
  return result;
}

uint64_t sub_87A0C(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_71350(&qword_EE2D8);
  uint64_t v10 = *(void *)(sub_71350(&qword_EDB80) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_71350(&qword_EDB80) - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
  size_t v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  uint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_93E60();
  __break(1u);
  return result;
}

uint64_t sub_87C54(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_71350(&qword_EE2C0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_93E60();
  __break(1u);
  return result;
}

uint64_t sub_87DC4(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  sub_93F00();
  swift_bridgeObjectRetain();
  sub_93AA0();
  Swift::Int v8 = sub_93F10();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_93EB0() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      size_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
      Swift::Int v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_93EB0() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *Swift::String v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_88C3C(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *Swift::String v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

unint64_t *sub_87F74(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if (*(void *)(a2 + 16))
  {
    uint64_t v4 = *(void *)(a1 + 64);
    uint64_t v37 = a1 + 64;
    uint64_t v5 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v35 = ~v5;
    if (-v5 < 64) {
      uint64_t v6 = ~(-1 << -(char)v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & v4;
    int64_t v36 = (unint64_t)(63 - v5) >> 6;
    uint64_t v8 = a2 + 56;
    swift_bridgeObjectRetain();
    int64_t v9 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v10 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v11 = v10 | (v9 << 6);
      }
      else
      {
        int64_t v12 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
          goto LABEL_49;
        }
        if (v12 >= v36) {
          goto LABEL_47;
        }
        unint64_t v13 = *(void *)(v37 + 8 * v12);
        int64_t v14 = v9 + 1;
        if (!v13)
        {
          int64_t v14 = v9 + 2;
          if (v9 + 2 >= v36) {
            goto LABEL_47;
          }
          unint64_t v13 = *(void *)(v37 + 8 * v14);
          if (!v13)
          {
            int64_t v14 = v9 + 3;
            if (v9 + 3 >= v36) {
              goto LABEL_47;
            }
            unint64_t v13 = *(void *)(v37 + 8 * v14);
            if (!v13)
            {
              int64_t v14 = v9 + 4;
              if (v9 + 4 >= v36) {
                goto LABEL_47;
              }
              unint64_t v13 = *(void *)(v37 + 8 * v14);
              if (!v13)
              {
                int64_t v15 = v9 + 5;
                if (v9 + 5 >= v36)
                {
LABEL_47:
                  sub_89EB4();
                  return (unint64_t *)v2;
                }
                unint64_t v13 = *(void *)(v37 + 8 * v15);
                if (!v13)
                {
                  while (1)
                  {
                    int64_t v14 = v15 + 1;
                    if (__OFADD__(v15, 1)) {
                      break;
                    }
                    if (v14 >= v36) {
                      goto LABEL_47;
                    }
                    unint64_t v13 = *(void *)(v37 + 8 * v14);
                    ++v15;
                    if (v13) {
                      goto LABEL_24;
                    }
                  }
LABEL_49:
                  __break(1u);
                }
                int64_t v14 = v9 + 5;
              }
            }
          }
        }
LABEL_24:
        unint64_t v7 = (v13 - 1) & v13;
        unint64_t v11 = __clz(__rbit64(v13)) + (v14 << 6);
        int64_t v9 = v14;
      }
      uint64_t v16 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v11);
      uint64_t v18 = *v16;
      uint64_t v17 = v16[1];
      sub_93F00();
      swift_bridgeObjectRetain();
      sub_93AA0();
      Swift::Int v19 = sub_93F10();
      uint64_t v20 = -1 << *(unsigned char *)(v2 + 32);
      unint64_t v21 = v19 & ~v20;
      if ((*(void *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21)) {
        break;
      }
LABEL_6:
      swift_bridgeObjectRelease();
    }
    uint64_t v22 = *(void *)(v2 + 48);
    unint64_t v23 = (void *)(v22 + 16 * v21);
    BOOL v24 = *v23 == v18 && v23[1] == v17;
    if (v24 || (sub_93EB0() & 1) != 0)
    {
      uint64_t isStackAllocationSafe = swift_bridgeObjectRelease();
      uint64_t v38 = a1;
      uint64_t v39 = v37;
      uint64_t v40 = v35;
      int64_t v41 = v9;
      unint64_t v42 = v7;
    }
    else
    {
      uint64_t v25 = ~v20;
      do
      {
        unint64_t v21 = (v21 + 1) & v25;
        if (((*(void *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21) & 1) == 0) {
          goto LABEL_6;
        }
        char v26 = (void *)(v22 + 16 * v21);
        BOOL v27 = *v26 == v18 && v26[1] == v17;
      }
      while (!v27 && (sub_93EB0() & 1) == 0);
      uint64_t v38 = a1;
      uint64_t v39 = v37;
      uint64_t v40 = v35;
      int64_t v41 = v9;
      unint64_t v42 = v7;
      uint64_t isStackAllocationSafe = swift_bridgeObjectRelease();
    }
    char v29 = *(unsigned char *)(v2 + 32);
    unint64_t v30 = (unint64_t)((1 << v29) + 63) >> 6;
    size_t v31 = 8 * v30;
    if ((v29 & 0x3Fu) < 0xE
      || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
    {
      __chkstk_darwin(isStackAllocationSafe);
      memcpy((char *)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v31);
      uint64_t v32 = sub_886C4((unint64_t *)((char *)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0)), v30, v2, v21, &v38);
      swift_release();
      sub_89EB4();
    }
    else
    {
      uint64_t v33 = (void *)swift_slowAlloc();
      memcpy(v33, (const void *)(v2 + 56), v31);
      uint64_t v32 = sub_886C4((unint64_t *)v33, v30, v2, v21, &v38);
      swift_release();
      sub_89EB4();
      swift_slowDealloc();
    }
    return v32;
  }
  else
  {
    swift_release();
    return (unint64_t *)&_swiftEmptySetSingleton;
  }
}

uint64_t sub_883E4()
{
  Swift::String v1 = v0;
  uint64_t v2 = *v0;
  sub_71350(&qword_EE2A0);
  uint64_t v3 = sub_93D20();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    unint64_t v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                Swift::String v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      Swift::Int v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_93F00();
      sub_93AA0();
      uint64_t result = sub_93F10();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      unint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *unint64_t v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *Swift::String v1 = v4;
  return result;
}

unint64_t *sub_886C4(unint64_t *result, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v7 = *(void *)(a3 + 16);
  uint64_t v38 = result;
  *(unint64_t *)((char *)result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  uint64_t v8 = v7 - 1;
  uint64_t v39 = a3 + 56;
  while (2)
  {
    uint64_t v37 = v8;
    do
    {
      while (1)
      {
        int64_t v9 = a5[3];
        unint64_t v10 = a5[4];
        if (v10)
        {
          uint64_t v11 = (v10 - 1) & v10;
          unint64_t v12 = __clz(__rbit64(v10)) | (v9 << 6);
        }
        else
        {
          int64_t v13 = v9 + 1;
          if (__OFADD__(v9, 1))
          {
            __break(1u);
            goto LABEL_45;
          }
          int64_t v14 = (unint64_t)(a5[2] + 64) >> 6;
          int64_t v15 = a5[3];
          if (v13 >= v14) {
            goto LABEL_43;
          }
          uint64_t v16 = a5[1];
          unint64_t v17 = *(void *)(v16 + 8 * v13);
          if (!v17)
          {
            int64_t v15 = v9 + 1;
            if (v9 + 2 >= v14) {
              goto LABEL_43;
            }
            unint64_t v17 = *(void *)(v16 + 8 * (v9 + 2));
            if (v17)
            {
              int64_t v13 = v9 + 2;
            }
            else
            {
              int64_t v15 = v9 + 2;
              if (v9 + 3 >= v14) {
                goto LABEL_43;
              }
              unint64_t v17 = *(void *)(v16 + 8 * (v9 + 3));
              if (v17)
              {
                int64_t v13 = v9 + 3;
              }
              else
              {
                int64_t v13 = v9 + 4;
                int64_t v15 = v9 + 3;
                if (v9 + 4 >= v14) {
                  goto LABEL_43;
                }
                unint64_t v17 = *(void *)(v16 + 8 * v13);
                if (!v17)
                {
                  int64_t v15 = v14 - 1;
                  int64_t v18 = v9 + 5;
                  while (v14 != v18)
                  {
                    unint64_t v17 = *(void *)(v16 + 8 * v18++);
                    if (v17)
                    {
                      int64_t v13 = v18 - 1;
                      goto LABEL_21;
                    }
                  }
LABEL_43:
                  a5[3] = v15;
                  a5[4] = 0;
                  swift_retain();
                  return (unint64_t *)sub_889A4(v38, a2, v37, a3);
                }
              }
            }
          }
LABEL_21:
          uint64_t v11 = (v17 - 1) & v17;
          unint64_t v12 = __clz(__rbit64(v17)) + (v13 << 6);
          int64_t v9 = v13;
        }
        Swift::Int v19 = (uint64_t *)(*(void *)(*a5 + 48) + 16 * v12);
        uint64_t v21 = *v19;
        uint64_t v20 = v19[1];
        a5[3] = v9;
        a5[4] = v11;
        sub_93F00();
        swift_bridgeObjectRetain();
        sub_93AA0();
        Swift::Int v22 = sub_93F10();
        uint64_t v23 = -1 << *(unsigned char *)(a3 + 32);
        unint64_t v24 = v22 & ~v23;
        unint64_t v25 = v24 >> 6;
        uint64_t v26 = 1 << v24;
        if (((1 << v24) & *(void *)(v39 + 8 * (v24 >> 6))) != 0) {
          break;
        }
LABEL_3:
        uint64_t result = (unint64_t *)swift_bridgeObjectRelease();
      }
      uint64_t v27 = *(void *)(a3 + 48);
      uint64_t v28 = (void *)(v27 + 16 * v24);
      BOOL v29 = *v28 == v21 && v28[1] == v20;
      if (!v29 && (sub_93EB0() & 1) == 0)
      {
        uint64_t v31 = ~v23;
        for (unint64_t i = v24 + 1; ; unint64_t i = v33 + 1)
        {
          unint64_t v33 = i & v31;
          if (((*(void *)(v39 + (((i & v31) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v31)) & 1) == 0) {
            break;
          }
          uint64_t v34 = (void *)(v27 + 16 * v33);
          BOOL v35 = *v34 == v21 && v34[1] == v20;
          if (v35 || (sub_93EB0() & 1) != 0)
          {
            uint64_t result = (unint64_t *)swift_bridgeObjectRelease();
            unint64_t v25 = v33 >> 6;
            uint64_t v26 = 1 << v33;
            goto LABEL_29;
          }
        }
        goto LABEL_3;
      }
      uint64_t result = (unint64_t *)swift_bridgeObjectRelease();
LABEL_29:
      unint64_t v30 = v38[v25];
      v38[v25] = v30 & ~v26;
    }
    while ((v26 & v30) == 0);
    uint64_t v8 = v37 - 1;
    if (__OFSUB__(v37, 1))
    {
LABEL_45:
      __break(1u);
      return result;
    }
    if (v37 != 1) {
      continue;
    }
    return (unint64_t *)&_swiftEmptySetSingleton;
  }
}

uint64_t sub_889A4(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v8 = &_swiftEmptySetSingleton;
LABEL_36:
    swift_release();
    return (uint64_t)v8;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  sub_71350(&qword_EE2A0);
  uint64_t result = sub_93D30();
  uint64_t v8 = (unsigned char *)result;
  uint64_t v30 = a2;
  if (a2 < 1) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = *a1;
  }
  uint64_t v10 = 0;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    uint64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      goto LABEL_39;
    }
    if (v14 >= v30) {
      goto LABEL_36;
    }
    unint64_t v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      uint64_t v10 = v14 + 1;
      if (v14 + 1 >= v30) {
        goto LABEL_36;
      }
      unint64_t v15 = a1[v10];
      if (!v15)
      {
        uint64_t v10 = v14 + 2;
        if (v14 + 2 >= v30) {
          goto LABEL_36;
        }
        unint64_t v15 = a1[v10];
        if (!v15) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    unint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    sub_93F00();
    swift_bridgeObjectRetain();
    sub_93AA0();
    uint64_t result = sub_93F10();
    uint64_t v20 = -1 << v8[32];
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(void *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    uint64_t v28 = (void *)(*((void *)v8 + 6) + 16 * v23);
    *uint64_t v28 = v18;
    v28[1] = v19;
    ++*((void *)v8 + 2);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5) {
      goto LABEL_36;
    }
  }
  uint64_t v16 = v14 + 3;
  if (v16 >= v30) {
    goto LABEL_36;
  }
  unint64_t v15 = a1[v16];
  if (v15)
  {
    uint64_t v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v10 >= v30) {
      goto LABEL_36;
    }
    unint64_t v15 = a1[v10];
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

Swift::Int sub_88C3C(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_883E4();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_88DD8();
      goto LABEL_22;
    }
    sub_88F8C();
  }
  uint64_t v11 = *v4;
  sub_93F00();
  sub_93AA0();
  uint64_t result = sub_93F10();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_93EB0(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_93EE0();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        uint64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_93EB0();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  unint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  Swift::Int *v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

void *sub_88DD8()
{
  Swift::String v1 = v0;
  sub_71350(&qword_EE2A0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_93D10();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *Swift::String v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    void *v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_88F8C()
{
  Swift::String v1 = v0;
  uint64_t v2 = *v0;
  sub_71350(&qword_EE2A0);
  uint64_t v3 = sub_93D20();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *Swift::String v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_93F00();
    swift_bridgeObjectRetain();
    sub_93AA0();
    uint64_t result = sub_93F10();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *int64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    Swift::String v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_8923C(uint64_t a1)
{
  unint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *Swift::String v1 = v3;
  if ((result & 1) == 0
    || (v3 & 0x8000000000000000) != 0
    || (v3 & 0x4000000000000000) != 0
    || a1 > *(void *)((char *)&dword_18 + (v3 & 0xFFFFFFFFFFFFFF8)) >> 1)
  {
    if (v3 >> 62)
    {
      swift_bridgeObjectRetain();
      sub_93E10();
      swift_bridgeObjectRelease();
    }
    uint64_t result = sub_93D80();
    *Swift::String v1 = result;
  }
  return result;
}

uint64_t sub_892FC(uint64_t a1)
{
  return a1;
}

uint64_t sub_89388(uint64_t a1)
{
  return a1;
}

uint64_t sub_89414(uint64_t a1)
{
  return a1;
}

void sub_89468(uint64_t a1)
{
  sub_86500(a1, *(void **)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_89470(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_71350(&qword_EE298);
  uint64_t v6 = sub_93E40();
  if (*(void *)(v5 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v5 + 32);
    unint64_t v33 = v2;
    uint64_t v34 = (void *)(v5 + 64);
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(v5 + 64);
    int64_t v10 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    int64_t v35 = v10;
    uint64_t v36 = v6;
    while (1)
    {
      if (v9)
      {
        uint64_t v41 = (v9 - 1) & v9;
        unint64_t v20 = __clz(__rbit64(v9)) | (v13 << 6);
      }
      else
      {
        if (__OFADD__(v13++, 1)) {
          goto LABEL_39;
        }
        if (v13 >= v10)
        {
LABEL_31:
          swift_release();
          unint64_t v3 = v33;
          if (a2)
          {
            uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
            if (v32 >= 64) {
              bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
            }
            else {
              *uint64_t v34 = -1 << v32;
            }
            *(void *)(v5 + 16) = 0;
          }
          break;
        }
        unint64_t v22 = v34[v13];
        if (!v22)
        {
          int64_t v23 = v13 + 1;
          if (v13 + 1 >= v10) {
            goto LABEL_31;
          }
          unint64_t v22 = v34[v23];
          if (!v22)
          {
            while (1)
            {
              int64_t v13 = v23 + 1;
              if (__OFADD__(v23, 1)) {
                break;
              }
              if (v13 >= v10) {
                goto LABEL_31;
              }
              unint64_t v22 = v34[v13];
              ++v23;
              if (v22) {
                goto LABEL_20;
              }
            }
LABEL_38:
            __break(1u);
LABEL_39:
            __break(1u);
            return result;
          }
          ++v13;
        }
LABEL_20:
        uint64_t v41 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v13 << 6);
      }
      unint64_t v24 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
      uint64_t v25 = *v24;
      uint64_t v26 = v24[1];
      uint64_t v27 = *(void *)(v5 + 56) + 120 * v20;
      uint64_t v37 = *(void *)v27;
      long long v47 = *(_OWORD *)(v27 + 24);
      long long v48 = *(_OWORD *)(v27 + 8);
      uint64_t v40 = *(void *)(v27 + 48);
      long long v45 = *(_OWORD *)(v27 + 72);
      long long v46 = *(_OWORD *)(v27 + 56);
      long long v44 = *(_OWORD *)(v27 + 88);
      uint64_t v42 = *(void *)(v27 + 104);
      uint64_t v43 = *(void *)(v27 + 40);
      char v38 = *(unsigned char *)(v27 + 114);
      __int16 v39 = *(_WORD *)(v27 + 112);
      if ((a2 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        int64_t v10 = v35;
        swift_bridgeObjectRetain();
        uint64_t v6 = v36;
        swift_bridgeObjectRetain();
      }
      sub_93F00();
      sub_93AA0();
      uint64_t result = sub_93F10();
      uint64_t v14 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v30 = v16 == v29;
          if (v16 == v29) {
            unint64_t v16 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v11 + 8 * v16);
        }
        while (v31 == -1);
        unint64_t v17 = __clz(__rbit64(~v31)) + (v16 << 6);
      }
      *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      int64_t v18 = (void *)(*(void *)(v6 + 48) + 16 * v17);
      void *v18 = v25;
      v18[1] = v26;
      uint64_t v19 = *(void *)(v6 + 56) + 120 * v17;
      *(void *)uint64_t v19 = v37;
      *(_OWORD *)(v19 + _Block_object_dispose(&STACK[0x380], 8) = v48;
      *(_OWORD *)(v19 + 24) = v47;
      unint64_t v9 = v41;
      *(void *)(v19 + 40) = v43;
      *(void *)(v19 + 4_Block_object_dispose(&STACK[0x380], 8) = v40;
      *(_OWORD *)(v19 + 56) = v46;
      *(_OWORD *)(v19 + 72) = v45;
      *(_OWORD *)(v19 + 8_Block_object_dispose(&STACK[0x380], 8) = v44;
      *(void *)(v19 + 104) = v42;
      *(_WORD *)(v19 + 112) = v39;
      *(unsigned char *)(v19 + 114) = v38;
      ++*(void *)(v6 + 16);
    }
  }
  uint64_t result = swift_release();
  *unint64_t v3 = v6;
  return result;
}

void *sub_8987C()
{
  sub_71350(&qword_EE298);
  unint64_t v33 = v0;
  uint64_t v1 = *v0;
  uint64_t v36 = sub_93E30();
  if (!*(void *)(v1 + 16))
  {
LABEL_24:
    uint64_t result = (void *)swift_release();
    uint64_t *v33 = v36;
    return result;
  }
  uint64_t result = (void *)(v36 + 64);
  unint64_t v3 = (unint64_t)((1 << *(unsigned char *)(v36 + 32)) + 63) >> 6;
  if (v36 != v1 || (unint64_t)result >= v1 + 64 + 8 * v3) {
    uint64_t result = memmove(result, (const void *)(v1 + 64), 8 * v3);
  }
  int64_t v5 = 0;
  *(void *)(v36 + 16) = *(void *)(v1 + 16);
  uint64_t v6 = 1 << *(unsigned char *)(v1 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(v1 + 64);
  int64_t v34 = (unint64_t)(v6 + 63) >> 6;
  uint64_t v35 = v1 + 64;
  while (1)
  {
    if (v8)
    {
      unint64_t v9 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v10 = v9 | (v5 << 6);
      goto LABEL_12;
    }
    if (__OFADD__(v5++, 1)) {
      goto LABEL_26;
    }
    if (v5 >= v34) {
      goto LABEL_24;
    }
    unint64_t v31 = *(void *)(v35 + 8 * v5);
    if (!v31) {
      break;
    }
LABEL_23:
    unint64_t v8 = (v31 - 1) & v31;
    unint64_t v10 = __clz(__rbit64(v31)) + (v5 << 6);
LABEL_12:
    uint64_t v11 = 16 * v10;
    unint64_t v12 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v10);
    uint64_t v13 = *v12;
    uint64_t v14 = v12[1];
    uint64_t v15 = 120 * v10;
    uint64_t v16 = *(void *)(v1 + 56) + v15;
    uint64_t v17 = *(void *)v16;
    uint64_t v19 = *(void *)(v16 + 40);
    uint64_t v18 = *(void *)(v16 + 48);
    uint64_t v20 = *(void *)(v16 + 104);
    __int16 v21 = *(_WORD *)(v16 + 112);
    char v22 = *(unsigned char *)(v16 + 114);
    int64_t v23 = (void *)(*(void *)(v36 + 48) + v11);
    long long v24 = *(_OWORD *)(v16 + 8);
    long long v25 = *(_OWORD *)(v16 + 24);
    long long v26 = *(_OWORD *)(v16 + 56);
    long long v27 = *(_OWORD *)(v16 + 72);
    long long v28 = *(_OWORD *)(v16 + 88);
    void *v23 = v13;
    v23[1] = v14;
    uint64_t v29 = *(void *)(v36 + 56) + v15;
    *(void *)uint64_t v29 = v17;
    *(_OWORD *)(v29 + _Block_object_dispose(&STACK[0x380], 8) = v24;
    *(_OWORD *)(v29 + 24) = v25;
    *(void *)(v29 + 40) = v19;
    *(void *)(v29 + 4_Block_object_dispose(&STACK[0x380], 8) = v18;
    *(_OWORD *)(v29 + 56) = v26;
    *(_OWORD *)(v29 + 72) = v27;
    *(_OWORD *)(v29 + 8_Block_object_dispose(&STACK[0x380], 8) = v28;
    *(void *)(v29 + 104) = v20;
    *(_WORD *)(v29 + 112) = v21;
    *(unsigned char *)(v29 + 114) = v22;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v32 = v5 + 1;
  if (v5 + 1 >= v34) {
    goto LABEL_24;
  }
  unint64_t v31 = *(void *)(v35 + 8 * v32);
  if (v31)
  {
    ++v5;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v5 = v32 + 1;
    if (__OFADD__(v32, 1)) {
      break;
    }
    if (v5 >= v34) {
      goto LABEL_24;
    }
    unint64_t v31 = *(void *)(v35 + 8 * v5);
    ++v32;
    if (v31) {
      goto LABEL_23;
    }
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_89AE4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 120 * a1 + 32;
    unint64_t v6 = a3 + 120 * v4;
    if (v5 >= v6 || v5 + 120 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_93E60();
  __break(1u);
  return result;
}

char *sub_89BDC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v4 = (uint64_t *)(swift_bridgeObjectRetain() + 40);
  unint64_t v5 = (char *)&_swiftEmptyArrayStorage;
  uint64_t v23 = a2;
  do
  {
    if (*(void *)(a2 + 16))
    {
      uint64_t v7 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain_n();
      unint64_t v8 = sub_8DEAC(v7, v6);
      if (v9)
      {
        uint64_t v10 = *(void *)(a2 + 56) + 120 * v8;
        uint64_t v11 = *(void *)(v10 + 8);
        uint64_t v35 = *(void *)v10;
        uint64_t v12 = *(void *)(v10 + 24);
        uint64_t v34 = *(void *)(v10 + 16);
        uint64_t v13 = *(void *)(v10 + 40);
        uint64_t v31 = *(void *)(v10 + 48);
        uint64_t v32 = *(void *)(v10 + 32);
        uint64_t v14 = v5;
        uint64_t v15 = *(void *)(v10 + 56);
        uint64_t v16 = *(void *)(v10 + 72);
        uint64_t v29 = *(void *)(v10 + 80);
        uint64_t v30 = *(void *)(v10 + 64);
        uint64_t v17 = *(void *)(v10 + 88);
        char v24 = *(unsigned char *)(v10 + 114);
        __int16 v25 = *(_WORD *)(v10 + 112);
        uint64_t v26 = *(void *)(v10 + 104);
        uint64_t v27 = *(void *)(v10 + 96);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v33 = v12;
        swift_bridgeObjectRetain();
        uint64_t v28 = v13;
        uint64_t v18 = v15;
        unint64_t v5 = v14;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease_n();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v5 = sub_875E0(0, *((void *)v14 + 2) + 1, 1, v14);
        }
        unint64_t v20 = *((void *)v5 + 2);
        unint64_t v19 = *((void *)v5 + 3);
        a2 = v23;
        if (v20 >= v19 >> 1) {
          unint64_t v5 = sub_875E0((char *)(v19 > 1), v20 + 1, 1, v5);
        }
        *((void *)v5 + 2) = v20 + 1;
        __int16 v21 = &v5[120 * v20];
        *((void *)v21 + 4) = v35;
        *((void *)v21 + 5) = v11;
        *((void *)v21 + 6) = v34;
        *((void *)v21 + 7) = v33;
        *((void *)v21 + _Block_object_dispose(&STACK[0x380], 8) = v32;
        *((void *)v21 + 9) = v28;
        *((void *)v21 + 10) = v31;
        *((void *)v21 + 11) = v18;
        *((void *)v21 + 12) = v30;
        *((void *)v21 + 13) = v16;
        *((void *)v21 + 14) = v29;
        *((void *)v21 + 15) = v17;
        *((void *)v21 + 16) = v27;
        *((void *)v21 + 17) = v26;
        *((_WORD *)v21 + 72) = v25;
        v21[146] = v24;
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }
    }
    v4 += 2;
    --v2;
  }
  while (v2);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_89E1C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_93C40();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      sub_87DC4(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_89EB4()
{
  return swift_release();
}

uint64_t sub_89EBC(uint64_t a1)
{
  return a1;
}

uint64_t sub_89F54()
{
  uint64_t v1 = sub_71350(&qword_EE2B0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_89FE8(unint64_t a1, uint64_t a2)
{
  sub_71350(&qword_EE2B0);

  return sub_86804(a1, a2);
}

uint64_t sub_8A06C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_8A07C()
{
  return swift_release();
}

unint64_t sub_8A084()
{
  unint64_t result = qword_EE250;
  if (!qword_EE250)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_EE250);
  }
  return result;
}

uint64_t sub_8A0C4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(a5(0) - 8);
    uint64_t v10 = a4 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    unint64_t v12 = v10 + v11 * a1;
    unint64_t v13 = a3 + v11 * v5;
    if (v12 >= v13 || v12 + v11 * v5 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  uint64_t result = sub_93E60();
  __break(1u);
  return result;
}

void sub_8A220(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v4 = [a1 storeID];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = sub_93A60();
    uint64_t v57 = v7;
    uint64_t v58 = v6;

    id v8 = [a1 assetID];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = sub_93A60();
      uint64_t v55 = v11;
      uint64_t v56 = v10;
    }
    else
    {
      uint64_t v55 = 0;
      uint64_t v56 = 0;
    }
    id v19 = [a1 path];
    if (v19)
    {
      unint64_t v20 = v19;
      uint64_t v21 = sub_93A60();
      uint64_t v53 = v22;
      uint64_t v54 = v21;
    }
    else
    {
      uint64_t v53 = 0;
      uint64_t v54 = 0;
    }
    id v23 = [a1 purchasedDSID];
    if (v23)
    {
      char v24 = v23;
      uint64_t v51 = sub_93A60();
      uint64_t v26 = v25;
    }
    else
    {
      uint64_t v51 = 0;
      uint64_t v26 = 0;
    }
    id v27 = [a1 downloadedDSID:v51];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = sub_93A60();
      uint64_t v31 = v30;
    }
    else
    {
      uint64_t v29 = 0;
      uint64_t v31 = 0;
    }
    id v32 = [a1 familyID];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = sub_93A60();
      uint64_t v36 = v35;
    }
    else
    {
      uint64_t v34 = 0;
      uint64_t v36 = 0;
    }
    id v37 = [a1 dataSourceIdentifier];
    uint64_t v38 = sub_93A60();
    uint64_t v40 = v39;

    unsigned __int16 v41 = (unsigned __int16)[a1 contentType];
    if ([a1 isOwned]) {
      int v42 = 0x10000;
    }
    else {
      int v42 = 0;
    }
    unsigned int v43 = v42 & 0xFFFF0000 | v41;
    uint64_t v45 = v57;
    uint64_t v44 = v58;
    uint64_t v47 = v55;
    uint64_t v46 = v56;
    uint64_t v49 = v53;
    uint64_t v48 = v54;
    uint64_t v50 = v52;
  }
  else
  {
    if (qword_ED9C0 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_93940();
    sub_71428(v12, (uint64_t)qword_EF0E8);
    id v13 = a1;
    uint64_t v14 = sub_93920();
    os_log_type_t v15 = sub_93C70();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 138412290;
      id v18 = v13;
      sub_93CE0();
      void *v17 = v13;

      _os_log_impl(&dword_0, v14, v15, "[WTR-members] Received WTR collection member asset: %@ without store ID", v16, 0xCu);
      sub_71350(&qword_EDDD8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    uint64_t v46 = 0;
    uint64_t v47 = 0;
    uint64_t v48 = 0;
    uint64_t v49 = 0;
    uint64_t v44 = 0;
    uint64_t v45 = 0;
    uint64_t v50 = 0;
    uint64_t v26 = 0;
    uint64_t v29 = 0;
    uint64_t v31 = 0;
    uint64_t v34 = 0;
    uint64_t v36 = 0;
    uint64_t v38 = 0;
    uint64_t v40 = 0;
    unsigned int v43 = 0;
  }
  *(void *)a2 = v46;
  *(void *)(a2 + _Block_object_dispose(&STACK[0x380], 8) = v47;
  *(void *)(a2 + 16) = v48;
  *(void *)(a2 + 24) = v49;
  *(void *)(a2 + 32) = v44;
  *(void *)(a2 + 40) = v45;
  *(void *)(a2 + 4_Block_object_dispose(&STACK[0x380], 8) = v50;
  *(void *)(a2 + 56) = v26;
  *(void *)(a2 + 64) = v29;
  *(void *)(a2 + 72) = v31;
  *(void *)(a2 + 80) = v34;
  *(void *)(a2 + 8_Block_object_dispose(&STACK[0x380], 8) = v36;
  *(void *)(a2 + 96) = v38;
  *(void *)(a2 + 104) = v40;
  *(_WORD *)(a2 + 112) = v43;
  *(unsigned char *)(a2 + 114) = BYTE2(v43);
}

uint64_t sub_8A5DC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_71350(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

_OWORD *sub_8A640(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t destroy for AssetSnapshot()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AssetSnapshot(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + _Block_object_dispose(&STACK[0x380], 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 4_Block_object_dispose(&STACK[0x380], 8) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  uint64_t v7 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v7;
  uint64_t v8 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 8_Block_object_dispose(&STACK[0x380], 8) = v8;
  uint64_t v9 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v9;
  *(_WORD *)(a1 + 112) = *(_WORD *)(a2 + 112);
  *(unsigned char *)(a1 + 114) = *(unsigned char *)(a2 + 114);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AssetSnapshot(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + _Block_object_dispose(&STACK[0x380], 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 4_Block_object_dispose(&STACK[0x380], 8) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 8_Block_object_dispose(&STACK[0x380], 8) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 112) = *(_WORD *)(a2 + 112);
  *(unsigned char *)(a1 + 114) = *(unsigned char *)(a2 + 114);
  return a1;
}

__n128 initializeWithTake for AssetSnapshot(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 4_Block_object_dispose(&STACK[0x380], 8) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = (__n128)a2[4];
  long long v6 = a2[5];
  long long v7 = a2[6];
  *(_DWORD *)(a1 + 111) = *(_DWORD *)((char *)a2 + 111);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t assignWithTake for AssetSnapshot(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + _Block_object_dispose(&STACK[0x380], 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 4_Block_object_dispose(&STACK[0x380], 8) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 8_Block_object_dispose(&STACK[0x380], 8) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v10;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 112) = *(_WORD *)(a2 + 112);
  *(unsigned char *)(a1 + 114) = *(unsigned char *)(a2 + 114);
  return a1;
}

uint64_t getEnumTagSinglePayload for AssetSnapshot(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 115)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AssetSnapshot(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 104) = 0;
    *(_OWORD *)(result + 8_Block_object_dispose(&STACK[0x380], 8) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + _Block_object_dispose(&STACK[0x380], 8) = 0u;
    *(unsigned char *)(result + 114) = 0;
    *(_WORD *)(result + 112) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 115) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 40) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 115) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AssetSnapshot()
{
  return &type metadata for AssetSnapshot;
}

uint64_t sub_8AB18()
{
  return type metadata accessor for AccountsObserver();
}

uint64_t type metadata accessor for AccountsObserver()
{
  uint64_t result = qword_EE378;
  if (!qword_EE378) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_8AB6C()
{
  sub_8AC08();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_8AC08()
{
  if (!qword_EE388)
  {
    sub_7D104((uint64_t *)&unk_EE390);
    unint64_t v0 = sub_93BD0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_EE388);
    }
  }
}

uint64_t sub_8AC64()
{
  uint64_t v1 = sub_71350((uint64_t *)&unk_EDFD0);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_71350((uint64_t *)&unk_EE3A0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v0 + OBJC_IVAR____TtC9BKLibraryP33_05F439DD99DBF9E3F4595B1087281DC916AccountsObserver_continuation, v1);
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v10 = [Strong activeStoreAccount];
    swift_unknownObjectRelease();
  }
  else
  {
    id v10 = 0;
  }
  v12[1] = v10;
  sub_93BC0();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_8AE48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[9] = a2;
  v3[10] = a3;
  v3[8] = a1;
  return _swift_task_switch(sub_8AE6C, 0, 0);
}

uint64_t sub_8AE6C()
{
  sub_93830();
  if (v0[5])
  {
    if (swift_dynamicCast())
    {
      if (v0[6] == v0[9] && v0[7] == v0[10])
      {
        swift_bridgeObjectRelease();
        char v2 = 1;
      }
      else
      {
        char v2 = sub_93EB0();
        swift_bridgeObjectRelease();
      }
      goto LABEL_10;
    }
  }
  else
  {
    sub_8AF90((uint64_t)(v0 + 2));
  }
  char v2 = 0;
LABEL_10:
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3(v2 & 1);
}

uint64_t sub_8AF54()
{
  return sub_8AF88(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_8AF88(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_8AF90(uint64_t a1)
{
  uint64_t v2 = sub_71350(&qword_EE3C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_8AFF0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_8B0B0;
  return dispatch thunk of BCCloudGlobalMetadataManaging.fetchBool(forKey:)(0xD000000000000023, 0x80000000000B5020, a1, a2);
}

uint64_t sub_8B0B0(char a1)
{
  uint64_t v4 = *v2;
  *(void *)(v4 + 32) = v1;
  swift_task_dealloc();
  if (v1)
  {
    return _swift_task_switch(sub_8B1EC, 0, 0);
  }
  else
  {
    uint64_t v5 = *(uint64_t (**)(void))(v4 + 8);
    return v5(a1 & 1);
  }
}

uint64_t sub_8B1EC()
{
  if (qword_ED9C0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_93940();
  sub_71428(v1, (uint64_t)qword_EF0E8);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = sub_93920();
  os_log_type_t v3 = sub_93C70();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 138412290;
    swift_errorRetain();
    uint64_t v6 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 16) = v6;
    sub_93CE0();
    *uint64_t v5 = v6;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v2, v3, "[Metadata] Failed to get notificationsEnabled: %@", v4, 0xCu);
    sub_71350(&qword_EDDD8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7(0);
}

uint64_t sub_8B3F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)(v3 + 44) = a1;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v7;
  void *v7 = v3;
  v7[1] = sub_8B4C0;
  return dispatch thunk of BCCloudGlobalMetadataManaging.update(_:forKey:)(a1, 0xD000000000000023, 0x80000000000B5020, a2, a3);
}

uint64_t sub_8B4C0()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 32) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return _swift_task_switch(sub_8B5F4, 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_8B5F4()
{
  if (qword_ED9C0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_93940();
  sub_71428(v1, (uint64_t)qword_EF0E8);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = sub_93920();
  os_log_type_t v3 = sub_93C70();
  if (os_log_type_enabled(v2, v3))
  {
    int v4 = *(unsigned __int8 *)(v0 + 44);
    uint64_t v5 = swift_slowAlloc();
    uint64_t v6 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 67109378;
    *(_DWORD *)(v0 + 40) = v4;
    sub_93CE0();
    *(_WORD *)(v5 + _Block_object_dispose(&STACK[0x380], 8) = 2112;
    swift_errorRetain();
    uint64_t v7 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 16) = v7;
    sub_93CE0();
    *uint64_t v6 = v7;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v2, v3, "[Metadata] Failed to set notificationsEnabled → %{BOOL}d: %@", (uint8_t *)v5, 0x12u);
    sub_71350(&qword_EDDD8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

unint64_t static PriceTrackingKeys.priceTrackingNotificationsEnabled.getter()
{
  return 0xD000000000000023;
}

id PriceTrackingKeys.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PriceTrackingKeys();
  return [super init];
}

uint64_t type metadata accessor for PriceTrackingKeys()
{
  return self;
}

id PriceTrackingKeys.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PriceTrackingKeys();
  return [super dealloc];
}

uint64_t sub_8B948(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[7] = a6;
  v7[8] = a7;
  void v7[5] = a4;
  v7[6] = a5;
  v7[3] = a2;
  void v7[4] = a3;
  v7[2] = a1;
  return _swift_task_switch(sub_8B974, 0, 0);
}

uint64_t sub_8B974()
{
  uint64_t v1 = (void *)v0[4];
  objc_super v2 = (int *)v0[5];
  NSString v3 = sub_93A30();
  id v4 = [v1 beginBackgroundTaskWithName:v3 expirationHandler:0];
  v0[9] = v4;

  v0[10] = UIBackgroundTaskInvalid;
  uint64_t v7 = (uint64_t (*)(BOOL))((char *)v2 + *v2);
  uint64_t v5 = (void *)swift_task_alloc();
  v0[11] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_8BA98;
  return v7(v4 != (id)UIBackgroundTaskInvalid);
}

uint64_t sub_8BA98()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_8BB94, 0, 0);
}

uint64_t sub_8BB94()
{
  uint64_t v2 = *(void *)(v0 + 72);
  uint64_t v1 = *(void *)(v0 + 80);
  (*(void (**)(void))(v0 + 56))();
  if (v2 != v1) {
    [*(id *)(v0 + 32) endBackgroundTask:*(void *)(v0 + 72)];
  }
  NSString v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t NSUserDefaults.priceTrackerDealAbsoluteThresholdOverride.getter()
{
  return sub_8C8E4();
}

uint64_t NSUserDefaults.priceTrackerDealRelativeThresholdOverride.getter()
{
  return sub_8C8E4();
}

id NSUserDefaults.priceTrackerCardLimitOverride.getter()
{
  return sub_8CDAC();
}

id NSUserDefaults.priceTrackerEnabledOverride.getter()
{
  NSString v1 = sub_93A30();
  id v2 = [v0 BOOLForKey:v1];

  return v2;
}

uint64_t NSUserDefaults.priceTrackerUpdateScheduleStepsOverride.getter()
{
  NSString v1 = sub_93A30();
  id v2 = [v0 stringForKey:v1];

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_93A60();

  return v3;
}

uint64_t sub_8BDB0()
{
  uint64_t v0 = sub_71350(&qword_EE410);
  __chkstk_darwin(v0);
  uint64_t v1 = sub_71350(&qword_EE418);
  __chkstk_darwin(v1);
  id v2 = [self defaultCenter];
  uint64_t v3 = (void *)BDSPriceTrackerCardListDidChangeObject;
  uint64_t v4 = sub_93A60();
  uint64_t v6 = v5;
  id v7 = v3;
  uint64_t v8 = sub_93CA0();

  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v4;
  *(void *)(v9 + 24) = v6;
  uint64_t v15 = v8;
  sub_93C90();
  sub_7CE1C();
  sub_93E70();
  sub_81774(&qword_EE428, &qword_EE410);
  sub_93DF0();

  swift_unknownObjectWeakInit();
  uint64_t v10 = swift_unknownObjectWeakAssign();
  sub_8D3D0(v10, (uint64_t)&v15);
  sub_8D3D0((uint64_t)&v15, (uint64_t)v14);
  uint64_t v11 = swift_allocObject();
  sub_8D3D0((uint64_t)v14, v11 + 16);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = &unk_EE440;
  *(void *)(v12 + 24) = v11;
  sub_71350(&qword_EE288);
  sub_81774(&qword_EE458, &qword_EE418);
  return sub_93DF0();
}

id NSUserDefaults.priceTrackerHasShownOptInAlert.getter()
{
  NSString v1 = sub_93A30();
  id v2 = [v0 BOOLForKey:v1];

  return v2;
}

void NSUserDefaults.priceTrackerHasShownOptInAlert.setter(char a1)
{
}

uint64_t sub_8C118(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_8C138, 0, 0);
}

uint64_t sub_8C138()
{
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v2 = Strong;
    id v3 = [Strong stringForKey:BDSPriceTrackerCardList];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = sub_93A60();
      uint64_t v7 = v6;

      goto LABEL_6;
    }
  }
  uint64_t v5 = 0;
  uint64_t v7 = 0;
LABEL_6:
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return v8(v5, v7);
}

uint64_t sub_8C1FC(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)(v3 + 16) = a1;
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v4;
  void *v4 = v3;
  v4[1] = sub_8C2CC;
  return v6();
}

uint64_t sub_8C2CC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void **)(*v2 + 16);
  uint64_t v8 = *v2;
  swift_task_dealloc();
  *uint64_t v5 = a1;
  v5[1] = a2;
  uint64_t v6 = *(uint64_t (**)(void))(v8 + 8);
  return v6();
}

void NSUserDefaults.priceTrackerEnabledOverride.setter(char a1)
{
}

void sub_8C404(char a1)
{
  id v3 = sub_93A30();
  [v1 setBool:a1 & 1 forKey:v3];
}

void (*NSUserDefaults.priceTrackerEnabledOverride.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  NSString v3 = sub_93A30();
  unsigned __int8 v4 = [v1 BOOLForKey:v3];

  *(unsigned char *)(a1 + _Block_object_dispose(&STACK[0x380], 8) = v4;
  return sub_8C4F0;
}

void sub_8C4F0(uint64_t a1)
{
}

void sub_8C50C(void **a1@<X0>, uint64_t *a2@<X8>)
{
  NSString v3 = *a1;
  NSString v4 = sub_93A30();
  id v5 = [v3 stringForKey:v4];

  if (v5)
  {
    uint64_t v6 = sub_93A60();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  *a2 = v6;
  a2[1] = v8;
}

void sub_8C5A4(uint64_t a1, void **a2)
{
  id v2 = *a2;
  if (*(void *)(a1 + 8))
  {
    swift_bridgeObjectRetain();
    NSString v3 = sub_93A30();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }
  id v4 = sub_93A30();
  [v2 setObject:v3 forKey:v4];
  swift_unknownObjectRelease();
}

void NSUserDefaults.priceTrackerUpdateScheduleStepsOverride.setter(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    NSString v3 = sub_93A30();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }
  id v4 = sub_93A30();
  [v2 setObject:v3 forKey:v4];
  swift_unknownObjectRelease();
}

uint64_t (*NSUserDefaults.priceTrackerUpdateScheduleStepsOverride.modify(uint64_t *a1))(uint64_t a1, char a2)
{
  a1[2] = (uint64_t)v1;
  NSString v3 = sub_93A30();
  id v4 = [v1 stringForKey:v3];

  if (v4)
  {
    uint64_t v5 = sub_93A60();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  *a1 = v5;
  a1[1] = v7;
  return sub_8C7B0;
}

uint64_t sub_8C7B0(uint64_t a1, char a2)
{
  uint64_t v3 = *(void *)(a1 + 8);
  if (a2)
  {
    if (v3)
    {
      swift_bridgeObjectRetain();
      NSString v4 = sub_93A30();
      swift_bridgeObjectRelease();
    }
    else
    {
      NSString v4 = 0;
    }
    uint64_t v6 = *(void **)(a1 + 16);
    NSString v7 = sub_93A30();
    [v6 setObject:v4 forKey:v7];
    swift_bridgeObjectRelease();
  }
  else
  {
    if (v3)
    {
      NSString v5 = sub_93A30();
      swift_bridgeObjectRelease();
    }
    else
    {
      NSString v5 = 0;
    }
    uint64_t v8 = *(void **)(a1 + 16);
    NSString v7 = sub_93A30();
    [v8 setObject:v5 forKey:v7];
  }

  return swift_unknownObjectRelease();
}

void NSUserDefaults.priceTrackerDealAbsoluteThresholdOverride.setter(uint64_t a1, char a2)
{
}

uint64_t sub_8C8E4()
{
  NSString v1 = sub_93A30();
  id v2 = [v0 objectForKey:v1];

  if (v2)
  {
    sub_93D00();
    swift_unknownObjectRelease();
    sub_8AF90((uint64_t)v7);
    NSString v3 = sub_93A30();
    [v0 doubleForKey:v3];
    uint64_t v5 = v4;

    return v5;
  }
  else
  {
    memset(v7, 0, sizeof(v7));
    sub_8AF90((uint64_t)v7);
    return 0;
  }
}

uint64_t (*NSUserDefaults.priceTrackerDealAbsoluteThresholdOverride.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)(a1 + 16) = v1;
  *(void *)a1 = sub_8C8E4();
  *(unsigned char *)(a1 + _Block_object_dispose(&STACK[0x380], 8) = v3 & 1;
  return sub_8CA2C;
}

uint64_t sub_8CA2C(uint64_t a1)
{
  return sub_8CBF8(a1);
}

void sub_8CA40(uint64_t a1, void **a2)
{
  id v2 = *a2;
  if (*(unsigned char *)(a1 + 8)) {
    Class isa = 0;
  }
  else {
    Class isa = sub_93C10().super.super.isa;
  }
  id v4 = sub_93A30();
  [v2 setObject:isa forKey:v4];
  swift_unknownObjectRelease();
}

void NSUserDefaults.priceTrackerDealRelativeThresholdOverride.setter(uint64_t a1, char a2)
{
}

void sub_8CAEC(uint64_t a1, char a2)
{
  if (a2) {
    v3.super.super.Class isa = 0;
  }
  else {
    v3.super.super.Class isa = sub_93C10().super.super.isa;
  }
  id v4 = sub_93A30();
  [v2 setObject:v3.super.super.isa forKey:v4];
  swift_unknownObjectRelease();
}

uint64_t (*NSUserDefaults.priceTrackerDealRelativeThresholdOverride.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)(a1 + 16) = v1;
  *(void *)a1 = sub_8C8E4();
  *(unsigned char *)(a1 + _Block_object_dispose(&STACK[0x380], 8) = v3 & 1;
  return sub_8CBE4;
}

uint64_t sub_8CBE4(uint64_t a1)
{
  return sub_8CBF8(a1);
}

uint64_t sub_8CBF8(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    Class isa = 0;
  }
  else {
    Class isa = sub_93C10().super.super.isa;
  }
  char v3 = *(void **)(a1 + 16);
  NSString v4 = sub_93A30();
  [v3 setObject:isa forKey:v4];

  return swift_unknownObjectRelease();
}

void sub_8CC88(uint64_t a1, void **a2)
{
  id v2 = *a2;
  if (*(unsigned char *)(a1 + 8)) {
    Class isa = 0;
  }
  else {
    Class isa = sub_93C50().super.super.isa;
  }
  id v4 = sub_93A30();
  [v2 setObject:isa forKey:v4];
  swift_unknownObjectRelease();
}

void NSUserDefaults.priceTrackerCardLimitOverride.setter(uint64_t a1, char a2)
{
  if (a2) {
    v3.super.super.Class isa = 0;
  }
  else {
    v3.super.super.Class isa = sub_93C50().super.super.isa;
  }
  id v4 = sub_93A30();
  [v2 setObject:v3.super.super.isa forKey:v4];
  swift_unknownObjectRelease();
}

id sub_8CDAC()
{
  NSString v1 = sub_93A30();
  id v2 = [v0 objectForKey:v1];

  if (v2)
  {
    sub_93D00();
    swift_unknownObjectRelease();
    sub_8AF90((uint64_t)v6);
    NSString v3 = sub_93A30();
    id v4 = [v0 integerForKey:v3];
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    sub_8AF90((uint64_t)v6);
    return 0;
  }
  return v4;
}

uint64_t (*NSUserDefaults.priceTrackerCardLimitOverride.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)(a1 + 16) = v1;
  *(void *)a1 = sub_8CDAC();
  *(unsigned char *)(a1 + _Block_object_dispose(&STACK[0x380], 8) = v3 & 1;
  return sub_8CEEC;
}

uint64_t sub_8CEEC(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    Class isa = 0;
  }
  else {
    Class isa = sub_93C50().super.super.isa;
  }
  char v3 = *(void **)(a1 + 16);
  NSString v4 = sub_93A30();
  [v3 setObject:isa forKey:v4];

  return swift_unknownObjectRelease();
}

void (*NSUserDefaults.priceTrackerHasShownOptInAlert.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  NSString v3 = sub_93A30();
  unsigned __int8 v4 = [v1 BOOLForKey:v3];

  *(unsigned char *)(a1 + _Block_object_dispose(&STACK[0x380], 8) = v4;
  return sub_8D00C;
}

void sub_8D00C(uint64_t a1)
{
}

void sub_8D028(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(unsigned __int8 *)(a1 + 8);
  id v3 = sub_93A30();
  [v1 setBool:v2 forKey:v3];
}

void sub_8D090(void **a1@<X0>, unsigned char *a2@<X8>)
{
}

void sub_8D0AC(unsigned __int8 *a1, void **a2)
{
}

uint64_t sub_8D0D0@<X0>(uint64_t a1@<X8>)
{
  return sub_8D1B0(0xD000000000000029, 0x80000000000B4AE0, (uint64_t (*)(uint64_t, uint64_t))sub_8C8E4, a1);
}

void sub_8D100(uint64_t a1, void **a2)
{
}

uint64_t sub_8D128@<X0>(uint64_t a1@<X8>)
{
  return sub_8D1B0(0xD000000000000029, 0x80000000000B4AB0, (uint64_t (*)(uint64_t, uint64_t))sub_8C8E4, a1);
}

void sub_8D158(uint64_t a1, void **a2)
{
}

uint64_t sub_8D180@<X0>(uint64_t a1@<X8>)
{
  return sub_8D1B0(0xD00000000000001DLL, 0x80000000000B4A90, (uint64_t (*)(uint64_t, uint64_t))sub_8CDAC, a1);
}

uint64_t sub_8D1B0@<X0>(uint64_t a1@<X3>, uint64_t a2@<X4>, uint64_t (*a3)(uint64_t, uint64_t)@<X5>, uint64_t a4@<X8>)
{
  uint64_t result = a3(a1, a2);
  *(void *)a4 = result;
  *(unsigned char *)(a4 + _Block_object_dispose(&STACK[0x380], 8) = v6 & 1;
  return result;
}

void sub_8D1F4(void **a1@<X0>, unsigned char *a2@<X8>)
{
}

void sub_8D210(void **a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = *a1;
  NSString v4 = sub_93A30();
  LOBYTE(v3) = [v3 BOOLForKey:v4];

  *a2 = (_BYTE)v3;
}

void sub_8D26C(unsigned __int8 *a1, void **a2)
{
}

void sub_8D288(unsigned __int8 *a1, void **a2)
{
  uint64_t v2 = *a1;
  id v3 = *a2;
  id v4 = sub_93A30();
  [v3 setBool:v2 forKey:v4];
}

uint64_t sub_8D2F0()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_8D328(uint64_t a1)
{
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  char v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *char v6 = v2;
  v6[1] = sub_7CF08;
  return sub_8AE48(a1, v5, v4);
}

uint64_t sub_8D3D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_71350(&qword_EE430);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_8D438()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_8D470()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_7B2D8;
  v2[2] = v0 + 16;
  return _swift_task_switch(sub_8C138, 0, 0);
}

uint64_t sub_8D518()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_8D550(uint64_t a1, uint64_t a2)
{
  char v6 = *(int **)(v2 + 16);
  NSString v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_7C474;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_EE448 + dword_EE448);
  return v8(a1, a2, v6);
}

id sub_8D618()
{
  id v8 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  NSString v0 = sub_93A30();
  swift_bridgeObjectRelease();
  NSString v1 = sub_93A30();
  swift_bridgeObjectRelease();
  NSString v2 = sub_93A30();
  swift_bridgeObjectRelease();
  NSString v3 = sub_93A30();
  swift_bridgeObjectRelease();
  NSString v4 = sub_93A30();
  swift_bridgeObjectRelease();
  NSString v5 = sub_93A30();
  swift_bridgeObjectRelease();
  id v6 = [v8 initWithTitleSingleAudiobook:v0 titleSingleBook:v1 titleMultiple:v2 bodySingleAudiobook:v3 bodySingleBook:v4 bodyMultiple:v5];

  return v6;
}

id sub_8D780()
{
  id result = BKLibraryFrameworkBundle();
  if (!result)
  {
    __break(1u);
    goto LABEL_9;
  }
  NSString v1 = result;
  NSString v2 = sub_93A30();
  NSString v3 = sub_93A30();
  id v4 = [v1 localizedStringForKey:v2 value:v3 table:0];

  sub_93A60();
  id result = BKLibraryFrameworkBundle();
  if (!result)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  NSString v5 = result;
  NSString v6 = sub_93A30();
  NSString v7 = sub_93A30();
  id v8 = [v5 localizedStringForKey:v6 value:v7 table:0];

  sub_93A60();
  id result = BKLibraryFrameworkBundle();
  if (!result)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v9 = result;
  NSString v10 = sub_93A30();
  NSString v11 = sub_93A30();
  id v12 = [v9 localizedStringForKey:v10 value:v11 table:0];

  sub_93A60();
  id result = BKLibraryFrameworkBundle();
  if (!result)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  id v13 = result;
  NSString v14 = sub_93A30();
  NSString v15 = sub_93A30();
  id v16 = [v13 localizedStringForKey:v14 value:v15 table:0];

  sub_93A60();
  id result = BKLibraryFrameworkBundle();
  if (!result)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v17 = result;
  NSString v18 = sub_93A30();
  NSString v19 = sub_93A30();
  id v20 = [v17 localizedStringForKey:v18 value:v19 table:0];

  sub_93A60();
  id result = BKLibraryFrameworkBundle();
  if (result)
  {
    uint64_t v21 = result;
    sub_8DB98();
    NSString v22 = sub_93A30();
    NSString v23 = sub_93A30();
    id v24 = [v21 localizedStringForKey:v22 value:v23 table:0];

    sub_93A60();
    return sub_8D618();
  }
LABEL_13:
  __break(1u);
  return result;
}

unint64_t sub_8DB98()
{
  unint64_t result = qword_EE460;
  if (!qword_EE460)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_EE460);
  }
  return result;
}

uint64_t sub_8DD6C()
{
  return type metadata accessor for UserDefaultsObserver();
}

uint64_t type metadata accessor for UserDefaultsObserver()
{
  uint64_t result = qword_EE498;
  if (!qword_EE498) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_8DDC0()
{
  sub_8DE50();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_8DE50()
{
  if (!qword_EE4A8)
  {
    sub_7D104(&qword_EE3C0);
    unint64_t v0 = sub_93BD0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_EE4A8);
    }
  }
}

unint64_t sub_8DEAC(uint64_t a1, uint64_t a2)
{
  sub_93F00();
  sub_93AA0();
  Swift::Int v4 = sub_93F10();

  return sub_8DFB8(a1, a2, v4);
}

unint64_t sub_8DF24(uint64_t a1)
{
  sub_93A60();
  sub_93F00();
  sub_93AA0();
  Swift::Int v2 = sub_93F10();
  swift_bridgeObjectRelease();

  return sub_8E09C(a1, v2);
}

unint64_t sub_8DFB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    NSString v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_93EB0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        id v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_93EB0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_8E09C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_93A60();
    uint64_t v8 = v7;
    if (v6 == sub_93A60() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_93EB0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_93A60();
          uint64_t v15 = v14;
          if (v13 == sub_93A60() && v15 == v16) {
            break;
          }
          char v18 = sub_93EB0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_8E214(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_71350(&qword_EE4B0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2 && *(void *)(a2 + 16))
  {
    uint64_t v7 = NSKeyValueChangeNewKey;
    unint64_t v8 = sub_8DF24((uint64_t)v7);
    if (v9)
    {
      sub_7C27C(*(void *)(a2 + 56) + 32 * v8, (uint64_t)&v14);
    }
    else
    {
      long long v14 = 0u;
      long long v15 = 0u;
    }
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
  }
  sub_8E434((uint64_t)&v14, (uint64_t)&v12);
  if (!*((void *)&v13 + 1))
  {
    sub_8AF90((uint64_t)&v12);
    goto LABEL_12;
  }
  sub_8E49C();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_12:
    sub_8E434((uint64_t)&v14, (uint64_t)&v12);
    goto LABEL_13;
  }

  long long v12 = 0u;
  long long v13 = 0u;
LABEL_13:
  sub_71350(&qword_EE4B8);
  sub_93BC0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return sub_8AF90((uint64_t)&v14);
}

unint64_t sub_8E3DC()
{
  unint64_t result = qword_EDC78;
  if (!qword_EDC78)
  {
    type metadata accessor for NSKeyValueChangeKey(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_EDC78);
  }
  return result;
}

uint64_t sub_8E434(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_71350(&qword_EE3C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_8E49C()
{
  unint64_t result = qword_EE4C0;
  if (!qword_EE4C0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_EE4C0);
  }
  return result;
}

uint64_t sub_8E684()
{
  return type metadata accessor for RestrictionsObserver();
}

uint64_t type metadata accessor for RestrictionsObserver()
{
  uint64_t result = qword_EE560;
  if (!qword_EE560) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_8E6D8()
{
  sub_8E768();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_8E768()
{
  if (!qword_EE570)
  {
    unint64_t v0 = sub_93BD0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_EE570);
    }
  }
}

uint64_t sub_8E7C0(uint64_t a1, uint64_t a2, double a3, double a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(), uint64_t a8)
{
  id v14 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a1;
  *(void *)(v15 + 24) = a2;
  uint64_t v28 = sub_8EA28;
  uint64_t v29 = v15;
  id v24 = _NSConcreteStackBlock;
  uint64_t v25 = 1107296256;
  uint64_t v26 = sub_8EA50;
  id v27 = &unk_D40A8;
  uint64_t v16 = _Block_copy(&v24);
  swift_retain();
  uint64_t result = swift_release();
  double v18 = round(a3);
  if ((~*(void *)&v18 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v18 <= -1.0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v18 < 65536.0)
  {
    uint64_t v19 = (int)v18;
    NSString v20 = sub_93A30();
    swift_bridgeObjectRelease();
    uint64_t v28 = a7;
    uint64_t v29 = a8;
    id v24 = _NSConcreteStackBlock;
    uint64_t v25 = 1107296256;
    uint64_t v26 = sub_8EAFC;
    id v27 = &unk_D40D0;
    uint64_t v21 = _Block_copy(&v24);
    swift_retain();
    swift_release();
    id v22 = [v14 initWithNotifyBlock:v16 notifyTimeout:v19 blockDescription:v20 notifyTimeoutBlock:v21];
    _Block_release(v21);

    _Block_release(v16);
    id v23 = v22;
    [v23 setCoalescingDelay:a4];

    swift_release();
    swift_release();
    return (uint64_t)v23;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_8E9F0()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_8EA28()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_8EA50(uint64_t a1, void *aBlock)
{
  uint64_t v2 = *(void (**)(uint64_t (*)(), uint64_t))(a1 + 32);
  uint64_t v3 = _Block_copy(aBlock);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  swift_retain();
  v2(sub_8EBA0, v4);
  swift_release();

  return swift_release();
}

uint64_t sub_8EAE4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_8EAF4()
{
  return swift_release();
}

uint64_t sub_8EAFC(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  uint64_t v2 = sub_93A60();
  uint64_t v4 = v3;
  swift_retain();
  v1(v2, v4);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_8EB68()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_8EBA0()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t BKLibraryAsset.finishedDateKind.getter@<X0>(uint64_t a1@<X8>)
{
  unsigned int v3 = [v1 finishedDateKind];
  if (v3 == 2)
  {
    char v9 = (unsigned int *)&enum case for FinishedDateKind.yearOnly(_:);
  }
  else
  {
    if ((unsigned __int16)v3 != 1)
    {
      uint64_t v4 = sub_93910();
      uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
      uint64_t v6 = v4;
      uint64_t v7 = a1;
      uint64_t v8 = 1;
      goto LABEL_7;
    }
    char v9 = (unsigned int *)&enum case for FinishedDateKind.fullDate(_:);
  }
  uint64_t v10 = *v9;
  uint64_t v11 = sub_93910();
  uint64_t v13 = *(void *)(v11 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 104))(a1, v10, v11);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 56);
  uint64_t v7 = a1;
  uint64_t v8 = 0;
  uint64_t v6 = v11;
LABEL_7:

  return v5(v7, v8, 1, v6);
}

void sub_8ECF8(void *a1)
{
  [a1 sourceFileType];
  uint64_t v7 = [a1 sourceFilePath];
  sub_3F9C();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x12u);
}

void sub_8EDAC(void *a1)
{
  [a1 sourceFileType];
  uint64_t v7 = [a1 sourceFilePath];
  sub_3F9C();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x1Cu);
}

void sub_8EE6C()
{
  sub_3F1C();
  sub_3F44(&dword_0, v0, v1, "Error initializing unarchiving copier. sourceURL {%{mask.hash}@} error {%@}");
}

void sub_8EED4(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "Preparing to uncompress to total file size: %llu", (uint8_t *)&v3, 0xCu);
}

void sub_8EF50()
{
  sub_3F64();
  sub_3F7C(&dword_0, v0, v1, "BKExtractFileOperation _performCopyFromPath: Unable to set protection key on copied file at %@: %@");
}

void sub_8EFB8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "BKExtractFileOperation _performCopyFromPath: copyItemAtPath failed. error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_8F030()
{
  sub_3F64();
  sub_3F7C(&dword_0, v0, v1, "BKExtractFileOperation _performMoveFromPath: Unable to not exclude from backup item at %@: %@");
}

void sub_8F098()
{
  sub_3F64();
  sub_3F7C(&dword_0, v0, v1, "BKExtractFileOperation _performMoveFromPath: Unable to set protection key on moved file at %@: %@");
}

void sub_8F100(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "BKExtractFileOperation _performMoveFromPath: moveItemAtPath failed. error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_8F178(uint64_t a1, void *a2)
{
  [a2 BOOLValue];
  __error();
  sub_3F9C();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x22u);
}

void sub_8F240()
{
  sub_3F1C();
  sub_3F44(&dword_0, v0, v1, "BKExtractFileOperation _fixFilePermissions: getResourceValue failed. key: NSURLIsDirectoryKey url: %{mask.hash}@ error: %@");
}

void sub_8F2A8()
{
  sub_3F1C();
  sub_3F44(&dword_0, v0, v1, "BKExtractFileOperation _performZipExtractionFromPath: removeItemAtPath failed. path: %{mask.hash}@ error: %@");
}

void sub_8F310()
{
  sub_3F1C();
  sub_3F44(&dword_0, v0, v1, "BKExtractFileOperation _performZipExtractionFromPath: moveItemAtPath failed. path: %{mask.hash}@ error: %@");
}

void sub_8F378()
{
  sub_3F1C();
  sub_3F44(&dword_0, v0, v1, "BKExtractFileOperation _performZipExtractionFromPath: Error extracting file. path: %{mask.hash}@ exception: %@");
}

void sub_8F3E0()
{
  sub_3F1C();
  sub_3F44(&dword_0, v0, v1, "Error extracting file at path {%{mask.hash}@} error {%@}");
}

void sub_8F448(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "setFinishedStateUserSetsFinished: set on series container: %@", (uint8_t *)&v2, 0xCu);
}

void sub_8F4C0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_4DE0(&dword_0, a1, a3, "setFinishedStateUserSetsFinished: request made when isFinished=YES and notFinished=NO", a5, a6, a7, a8, 0);
}

void sub_8F4F8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_4DE0(&dword_0, a1, a3, "setFinishedStateUserSetsUnfinished request made when isFinished=NO and notFinished=YES", a5, a6, a7, a8, 0);
}

void sub_8F530(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_4DE0(&dword_0, a1, a3, "setFinishedStateRemoveFromFinishedCollection request made when isFinished=NO and notFinished=YES", a5, a6, a7, a8, 0);
}

void sub_8F568(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 debugDescription];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "setFinishedStateAddToFinishedCollection set on series container: %@", (uint8_t *)&v4, 0xCu);
}

uint64_t sub_8F600()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return sub_8F624(v0);
}

void sub_8F624()
{
  sub_3DCD8();
  sub_4DE0(&dword_0, v0, v1, "managerWithDataSources: initializer not called!", v2, v3, v4, v5, v6);
}

void sub_8F658()
{
  sub_3DCD8();
  sub_4DE0(&dword_0, v0, v1, "MRP: timed out waiting for dates", v2, v3, v4, v5, v6);
}

void sub_8F68C()
{
  sub_3DCB4();
  sub_3DC98(&dword_0, v0, v1, "MRP: error fetching MRP from library %@", v2, v3, v4, v5, v6);
}

void sub_8F6F4()
{
  sub_3DCD8();
  sub_3DD44(&dword_0, v0, v1, "Test migration requested", v2, v3, v4, v5, v6);
}

void sub_8F728()
{
  sub_3DCB4();
  sub_3DDCC(&dword_0, v0, v1, "Remove library database per user default: %@", v2, v3, v4, v5, v6);
}

void sub_8F790(uint64_t a1, NSObject *a2)
{
  v2[0] = 67109378;
  v2[1] = 360;
  __int16 v3 = 2112;
  uint64_t v4 = a1;
  _os_log_fault_impl(&dword_0, a2, OS_LOG_TYPE_FAULT, "BCCoalescingCallBlock notification block did not call its completion handler after %hus.  Block is the _coalescedLibraryReload on BKLibraryManager %@.", (uint8_t *)v2, 0x12u);
}

void sub_8F818()
{
  sub_3DCB4();
  sub_3DC98(&dword_0, v0, v1, "Fetch error: %@", v2, v3, v4, v5, v6);
}

void sub_8F880()
{
  sub_3DCB4();
  sub_3DC98(&dword_0, v0, v1, "Invalid version string: %@", v2, v3, v4, v5, v6);
}

void sub_8F8E8()
{
  sub_3DCB4();
  sub_3DC98(&dword_0, v0, v1, "Invalid comparison version string: %@", v2, v3, v4, v5, v6);
}

void sub_8F950()
{
  sub_3DCD8();
  _os_log_fault_impl(&dword_0, v0, OS_LOG_TYPE_FAULT, "Expecting workerQueueBlockAndWait to be called from non-main thread", v1, 2u);
}

void sub_8F990()
{
  sub_3DCB4();
  sub_3DC98(&dword_0, v0, v1, "Failed to fetch series IDs to update: %@", v2, v3, v4, v5, v6);
}

void sub_8F9F8()
{
  sub_3DCB4();
  sub_3DC98(&dword_0, v0, v1, "Failed to get series info updating interval bag value, will fallback to use default: %@", v2, v3, v4, v5, v6);
}

void sub_8FA60()
{
  sub_3DCB4();
  sub_3DC98(&dword_0, v0, v1, "Failed to fetch non-series audiobook IDs to update: %@", v2, v3, v4, v5, v6);
}

void sub_8FAC8()
{
  sub_3DCD8();
  sub_3DD44(&dword_0, v0, v1, "wq_dq_saveDatabaseContext had NO changes", v2, v3, v4, v5, v6);
}

void sub_8FAFC()
{
  sub_3DCB4();
  sub_3DC98(&dword_0, v0, v1, "ERROR fetching items. %@", v2, v3, v4, v5, v6);
}

void sub_8FB64(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [sub_3DE2C(a1, a2) seriesID];
  *uint64_t v3 = 138412290;
  *uint64_t v2 = v4;
  sub_3DE0C(&dword_0, v5, v6, "ERROR: Where's the container for %@");
}

void sub_8FBC0(void *a1, NSObject *a2)
{
  uint64_t v3 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a1 count]);
  sub_3DCB4();
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "Fetched: %@", v4, 0xCu);
}

void sub_8FC68()
{
  sub_3DCB4();
  sub_3DC98(&dword_0, v0, v1, "persistentStorePath: %@", v2, v3, v4, v5, v6);
}

void sub_8FCD0()
{
  sub_3DCB4();
  sub_3DC98(&dword_0, v0, v1, "persistentStoreName: %@", v2, v3, v4, v5, v6);
}

void sub_8FD38()
{
  sub_3DCB4();
  sub_3DC98(&dword_0, v0, v1, "documentsPath: %@", v2, v3, v4, v5, v6);
}

void sub_8FDA0()
{
  sub_3DCD8();
  sub_4DE0(&dword_0, v0, v1, "Unable to create persistent store URL.", v2, v3, v4, v5, v6);
}

void sub_8FDD4()
{
  sub_3DCD8();
  sub_3DD44(&dword_0, v0, v1, "creating a new moc", v2, v3, v4, v5, v6);
}

void sub_8FE08()
{
  sub_3DCB4();
  sub_3DC98(&dword_0, v0, v1, "ERROR: Could not determine book count - %@", v2, v3, v4, v5, v6);
}

void sub_8FE70(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 componentsJoinedByString:@", "];
  sub_3DCFC();
  sub_3DD0C(&dword_0, v3, v4, "reload data source %@ fetched assetIDs=[%@]", v5, v6, v7, v8, 2u);
}

void sub_8FF14()
{
  sub_3DDF4();
  sub_3DD60(&dword_0, v0, (uint64_t)v0, "Datasource {%@} failed to fetch assets error {%@}", v1);
}

void sub_8FF88()
{
  sub_3DDE8();
  uint64_t v3 = [*(id *)(v1 + 40) objectAtIndexedSubscript:v2];
  uint64_t v4 = +[NSNumber numberWithUnsignedInteger:v0];
  sub_3DD98();
  sub_3DDAC(&dword_0, v5, v6, "Datasource {%@} failed to fetch asset %@ at index %@", v7, v8, v9, v10, v11);
}

void sub_90044()
{
  sub_3DD2C();
  sub_3F7C(&dword_0, v0, v1, "Datasource {%@} failed to fetch assets error {%@}");
}

void sub_900B4()
{
  sub_3DCB4();
  sub_3DC98(&dword_0, v0, v1, "earliestPurchaseTimestampWithCompletion: executeFetchRequest error: %@", v2, v3, v4, v5, v6);
}

void sub_9011C()
{
  sub_3DCD8();
  sub_4DE0(&dword_0, v0, v1, "_addDataSourceIdentifierAndStateObserver assetID was invalid", v2, v3, v4, v5, v6);
}

void sub_90150()
{
  sub_3DCB4();
  sub_3DC98(&dword_0, v0, v1, "no datasource for libraryAsset %@", v2, v3, v4, v5, v6);
}

void sub_901B8()
{
  sub_3F64();
  sub_3F7C(&dword_0, v0, v1, "Skipping remove because fetch {%@} failed with error {%@}");
}

void sub_90220()
{
  sub_3DD2C();
  sub_3DD60(&dword_0, v0, v1, "assets removed: %@ %@", v2);
}

void sub_90290()
{
  sub_3F64();
  sub_3F7C(&dword_0, v0, v1, "Failed to update assets because fetch {%@} failed with error {%@}");
}

void sub_902F8(uint64_t a1)
{
  os_log_t v1 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [*(id *)(a1 + 32) count]);
  sub_3DCFC();
  sub_3DD0C(&dword_0, v2, v3, "%s: %@ assets updated", v4, v5, v6, v7, 2u);
}

void sub_903A4(void *a1, NSObject *a2)
{
  uint64_t v4 = [a1 assetID];
  uint64_t v5 = [a1 seriesID];
  int v7 = 138412546;
  uint64_t v8 = v4;
  sub_3DCFC();
  sub_3DD60(&dword_0, a2, v6, "StackLog: We should be clearing purchasedAndLocalParent: assetID: %@  seriesID: %@", (uint8_t *)&v7);
}

void sub_9045C(void *a1)
{
  os_log_t v1 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a1 count]);
  sub_3DCFC();
  sub_3DD0C(&dword_0, v2, v3, "%s: %@ assets added", v4, v5, v6, v7, 2u);
}

void sub_90504(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_9057C()
{
  sub_3F64();
  sub_3F7C(&dword_0, v0, v1, "Failed to fetch assets to unclaim {%@} -- {%@}");
}

void sub_905E4(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *long long buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Expecting either the assetID or the temporaryAssetID to be set", buf, 2u);
}

void sub_90624(uint64_t a1, __int16 a2)
{
  uint64_t v2 = +[NSNumber numberWithShort:a2];
  sub_3DCFC();
  sub_3DD0C(&dword_0, v3, v4, "Ownership Change:%@  (%@)", v5, v6, v7, v8, 2u);
}

void sub_906CC(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [a2 insertedObjects];
  id v6 = [v5 valueForKey:@"assetID"];
  int v8 = 138412546;
  uint64_t v9 = a1;
  sub_3DCFC();
  sub_3DCC0(&dword_0, a3, v7, "Mismatch in insertedIDs: %@ and moc.insertedObjects assetID's:%@", (uint8_t *)&v8);
}

void sub_90794()
{
  sub_3DCB4();
  sub_3DC98(&dword_0, v0, v1, "Skipping purge -- reason {%@}", v2, v3, v4, v5, v6);
}

void sub_907FC()
{
  sub_3DCB4();
  sub_3DC98(&dword_0, v0, v1, "Skipping integration -- reason {%@}", v2, v3, v4, v5, v6);
}

void sub_90864(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 title];
  uint64_t v4 = [a2 assetID];
  sub_3DD78();
  sub_3DDAC(&dword_0, v5, v6, "{%@} creating asset {%@} assetID {%@}", v7, v8, v9, v10, v11);
}

void sub_90910()
{
  sub_3F64();
  sub_3DD60(&dword_0, v0, (uint64_t)v0, "Adding a new asset: %@ dataSource: %@", v1);
}

void sub_90980()
{
  sub_3DDE8();
  uint64_t v2 = [*(id *)(v1 + 40) identifier];
  sub_3DCB4();
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  sub_3DCC0(&dword_0, v0, v4, "#datasource FAILED to fetch assets to reconcile for: %@, error=%@", v5);
}

void sub_90A28(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) allObjects];
  uint64_t v2 = [v1 componentsJoinedByString:@", "];
  sub_3DCB4();
  sub_3DE40(&dword_0, v3, v4, "#datasource STILL pending to be reconciled after 1 minute: [%{public}@]", v5, v6, v7, v8, v9);
}

void sub_90AD0(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) allObjects];
  uint64_t v2 = [v1 componentsJoinedByString:@", "];
  sub_3DCB4();
  sub_3DE40(&dword_0, v3, v4, "#datasource STILL pending to be reconciled after 3 minutes: [%{public}@]", v5, v6, v7, v8, v9);
}

void sub_90B78()
{
  sub_3F64();
  sub_3F7C(&dword_0, v0, v1, "Couldn't get books count of purchased books %@ -- %@");
}

void sub_90BE0()
{
  sub_3F64();
  sub_3F7C(&dword_0, v0, v1, "Error fetching purchased count for %@ -- %@");
}

void sub_90C48()
{
  sub_3F64();
  sub_3F7C(&dword_0, v0, v1, "Error fetching total count for %@ -- %@");
}

void sub_90CB0()
{
  sub_3F64();
  sub_3F7C(&dword_0, v0, v1, "Failed to fetch libraryAssets with identifiers %@ error: %@");
}

void sub_90D18()
{
  sub_3DCB4();
  sub_3DC98(&dword_0, v0, v1, "libraryAssetsForAppIntentsSearchTerm: executeFetchRequest failed. error: %@", v2, v3, v4, v5, v6);
}

void sub_90D80()
{
  sub_3F64();
  sub_3F7C(&dword_0, v0, v1, "Failed to fetch LibraryAsset with identifier {%@}{%@}");
}

void sub_90DE8()
{
  sub_3DCD8();
  sub_4DE0(&dword_0, v0, v1, "libraryMutableAssetWithAssetID called with no assetID", v2, v3, v4, v5, v6);
}

void sub_90E1C()
{
  sub_3DCD8();
  sub_4DE0(&dword_0, v0, v1, "libraryMutableAssetWithAssetID called with no assetIdentifier", v2, v3, v4, v5, v6);
}

void sub_90E50()
{
  sub_3F64();
  sub_3F7C(&dword_0, v0, v1, "Failed to fetch count {%@} -- {%@}");
}

void sub_90EB8()
{
  sub_3F64();
  sub_3F7C(&dword_0, v0, v1, "Failed to fetch libraryAssets with assetIDs {%@} {%@}");
}

void sub_90F20()
{
  sub_3DDE8();
  uint64_t v2 = [v1 seriesID];
  sub_3DCE4();
  sub_3DCC0(&dword_0, v0, v3, "Couldn't get new local book with seriesID %@ -- %@", v4);
}

void sub_90FB4()
{
  sub_3F64();
  sub_3F7C(&dword_0, v0, v1, "Couldn't get books of series item %@ -- %@");
}

void sub_9101C()
{
  sub_3F64();
  sub_3F7C(&dword_0, v0, v1, "Couldn't get books count of series items %@ -- %@");
}

void sub_91084(void *a1)
{
  os_log_t v1 = [a1 assetID];
  sub_3DCB4();
  sub_3DE60(&dword_0, v2, v3, "localNonSampleLibraryAssetStoreSummariesExcludeAudiobooks: AssetID: %@ is missing libraryAsset.storeID, skipping this asset in results.", v4, v5, v6, v7, v8);
}

void sub_91108(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [sub_3DE2C(a1, a2) assetID];
  *uint64_t v3 = 138412290;
  *uint64_t v2 = v4;
  sub_3DE0C(&dword_0, v5, v6, "localNonSampleLibraryAssetStoreSummariesExcludeAudiobooks: AssetID: %@ is missing libraryAsset.versionNumber.");
}

void sub_91164(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_911D8()
{
  sub_3DDF4();
  sub_3F7C(&dword_0, v0, v1, "Failed to remove %@ from Want to Read. %@");
}

void sub_91244()
{
  sub_3DCB4();
  sub_3DC98(&dword_0, v0, v1, "Encounted error when counting books in continue reading %@", v2, v3, v4, v5, v6);
}

void sub_912AC()
{
  sub_3DCB4();
  sub_3DC98(&dword_0, v0, v1, "Seeded %lu books", v2, v3, v4, v5, v6);
}

void sub_91314()
{
  sub_3DCB4();
  sub_3DC98(&dword_0, v0, v1, "Failed to retrieve assets when seeding recent books list. %@", v2, v3, v4, v5, v6);
}

void sub_9137C()
{
  sub_3DCB4();
  sub_3DC98(&dword_0, v0, v1, "Failed to purge assets. %@", v2, v3, v4, v5, v6);
}

void sub_913E4()
{
  sub_3DCB4();
  sub_3DC98(&dword_0, v0, v1, "Error purging recent books. %@", v2, v3, v4, v5, v6);
}

void sub_9144C(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  int v4 = 141558274;
  uint64_t v5 = 1752392040;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  sub_3DCC0(&dword_0, a2, a3, "applyPendingUpdateForAssetID: libraryAsset not found. assetID: %{mask.hash}@", (uint8_t *)&v4);
}

void sub_914D4()
{
  sub_3DCD8();
  sub_4DE0(&dword_0, v0, v1, "applyPendingUpdateForAssetID: No data sources handled the pending update.", v2, v3, v4, v5, v6);
}

void sub_91508()
{
  sub_3DDE8();
  uint64_t v2 = [v1 storePlaylistID];
  sub_3DCE4();
  sub_3DCC0(&dword_0, v0, v3, "Failed to fetch supplemental content libraryAssets with storePlaylistID %@ error: %@", v4);
}

void sub_9159C(void *a1, NSObject *a2)
{
  uint64_t v4 = [a1 assetID];
  int v5 = 138412546;
  uint8_t v6 = v4;
  __int16 v7 = 1024;
  unsigned int v8 = [a1 isSupplementalContent];
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Reset supplemental content libraryAsset %@: it has isSupplementalContent set to %hhd, but no storePlaylistID", (uint8_t *)&v5, 0x12u);
}

void sub_91654(void *a1, void *a2, NSObject *a3)
{
  [a1 count];
  uint8_t v6 = [a2 storePlaylistID];
  __int16 v7 = [a1 lastObject];
  sub_3DD98();
  uint8_t v11 = v6;
  __int16 v12 = v8;
  uint64_t v13 = v9;
  _os_log_error_impl(&dword_0, a3, OS_LOG_TYPE_ERROR, "Fetched %ld audiobook libraryAssets with storePlaylistID %@ for supplemental content, will use last one %@.", v10, 0x20u);
}

void sub_91724()
{
  sub_3DDE8();
  uint64_t v2 = [v1 storePlaylistID];
  sub_3DCE4();
  sub_3DCC0(&dword_0, v0, v3, "Failed to fetch audiobook libraryAsset with storePlaylistID %@ for supplemental content, error: %@", v4);
}

void sub_917B8()
{
  sub_3DCD8();
  sub_3DD44(&dword_0, v0, v1, "Done _migrateFromOldDatabase", v2, v3, v4, v5, v6);
}

void sub_917EC()
{
  sub_3DCD8();
  sub_3DD44(&dword_0, v0, v1, "Starting _migrateFromOldDatabase", v2, v3, v4, v5, v6);
}

void sub_91820(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_3DCB4();
  sub_3DE60(&dword_0, v2, v3, "Bootstrap Samples collection: Failed to fetch asset IDs, error: %@", v4, v5, v6, v7, v8);
}

void sub_918A4()
{
  sub_3DCB4();
  sub_3DC98(&dword_0, v0, v1, "Failed to write migration cache: %@", v2, v3, v4, v5, v6);
}

void sub_9190C()
{
  sub_3F64();
  sub_3F7C(&dword_0, v0, v1, "Error removing old database file: %@  error: %@");
}

void sub_91974()
{
  sub_3DCB4();
  sub_3DDCC(&dword_0, v0, v1, "managedObjectBackgroundMonitor - result of changedAssetIDs: %@", v2, v3, v4, v5, v6);
}

void sub_919DC(void *a1)
{
  uint64_t v2 = [a1 addedObjects];
  uint64_t v3 = [a1 updatedObjects];
  uint64_t v4 = [a1 deletedObjects];
  sub_3DD78();
  sub_3DDAC(&dword_0, v5, v6, "managedObjectBackgroundMonitor - added: %@, updated: %@, deleted: %@", v7, v8, v9, v10, v11);
}

void sub_91A94()
{
  sub_3DCB4();
  sub_3DC98(&dword_0, v0, v1, "Failed to fetch cloudSyncVersions error: %@", v2, v3, v4, v5, v6);
}

void sub_91AFC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_91B6C()
{
  sub_3DCB4();
  sub_3DC98(&dword_0, v0, v1, "Failed fetching explicit assets: %@", v2, v3, v4, v5, v6);
}

void sub_91BD4()
{
  sub_3DD2C();
  sub_3F7C(&dword_0, v0, v1, "#datasource FAILED fetchAssets from: %{public}@ with error=%@");
}

void sub_91C44(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 assetID];
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_0, a3, OS_LOG_TYPE_DEBUG, "BKLibraryAsset asset: %@ readingNowDetailRepresentation %@", (uint8_t *)&v6, 0x16u);
}

void sub_91CF4(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Error unarchiving asset status controller data: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_91D6C()
{
  sub_3DCD8();
  sub_3DD44(&dword_0, v0, v1, "BCAssetDetail cloudSyncVersions in sync on enabling cloud merge", v2, v3, v4, v5, v6);
}

void sub_91DA0()
{
  sub_3DCB4();
  sub_3DC98(&dword_0, v0, v1, "error retrieving libraryManager assets: %@", v2, v3, v4, v5, v6);
}

void sub_91E08()
{
  sub_3DDE8();
  uint64_t v1 = [*(id *)(v0 + 48) componentsJoinedByString:@", "];
  sub_3DCE4();
  sub_4E82C(&dword_0, v2, v3, "error setting getting global annotations for assetIDs: [%@] error=%@", v4, v5, v6, v7, v8);
}

void sub_91EA0()
{
  sub_3DDE8();
  uint64_t v1 = [(id)sub_4E86C(v0) componentsJoinedByString:@", "];
  sub_3DCE4();
  sub_4E82C(&dword_0, v2, v3, "error setting assetDetails for assetIDs: [%@] error=%@", v4, v5, v6, v7, v8);
}

void sub_91F34()
{
  sub_3DCD8();
  sub_3DD44(&dword_0, v0, v1, "********** about to call from -p_syncAllReadingNowChangesToIcloudInMOC:", v2, v3, v4, v5, v6);
}

void sub_91F68(void *a1)
{
  [a1 count];
  sub_3DCB4();
  sub_4E84C(&dword_0, v1, v2, "BCReadingNowDetail found %lu details to sync", v3, v4, v5, v6, v7);
}

void sub_91FE0(uint64_t a1)
{
  uint64_t v1 = [sub_4E86C(a1) bu_prettyDescription];
  sub_3DCB4();
  sub_4E84C(&dword_0, v2, v3, "RND:succesfully set ReadingNowDetails for assetIDs: [%@]", v4, v5, v6, v7, v8);
}

void sub_92064(uint64_t a1)
{
  uint64_t v1 = [sub_4E86C(a1) bu_prettyDescription];
  sub_3DCB4();
  sub_4E84C(&dword_0, v2, v3, "RND:succesfully set ReadingNowDetails, but no changes for assetIDs: [%@]", v4, v5, v6, v7, v8);
}

void sub_920E8()
{
  sub_3DDE8();
  uint64_t v1 = [sub_4E86C(v0) bu_prettyDescription];
  sub_3DCE4();
  sub_4E82C(&dword_0, v2, v3, "RND:error setting ReadingNowDetails for assetIDs: [%@] error=%@", v4, v5, v6, v7, v8);
}

void sub_92174(void *a1, void *a2, NSObject *a3)
{
  uint64_t v6 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [a1 sessionContextType]);
  uint64_t v7 = [a1 persistentStoreCoordinator];
  uint8_t v8 = [a2 libraryManager];
  uint64_t v9 = [v8 persistentStoreCoordinator];
  int v10 = 138412802;
  uint8_t v11 = a1;
  __int16 v12 = 2112;
  uint64_t v13 = v6;
  __int16 v14 = 1024;
  unsigned int v15 = [v7 hasStoreInCommonWith:v9];
  _os_log_debug_impl(&dword_0, a3, OS_LOG_TYPE_DEBUG, "********** NOT DOING ANYTHING. context: %@, context.sessionContextType: %@, [context.persistentStoreCoordinator hasStoreInCommonWith:self.libraryManager.persistentStoreCoordinator]: %{BOOL}d", (uint8_t *)&v10, 0x1Cu);
}

void sub_92294()
{
  sub_3DCD8();
  sub_3DD44(&dword_0, v0, v1, "managedObjectBackgroundMonitor:didSaveNotify:", v2, v3, v4, v5, v6);
}

void sub_922C8()
{
  sub_3DCD8();
  sub_3DD44(&dword_0, v0, v1, "********** not calling from -managedObjectBackgroundMonitor:didSaveNotification for updatedItems", v2, v3, v4, v5, v6);
}

void sub_922FC(uint64_t a1)
{
  [*(id *)(a1 + 32) enableCloudMerge];
  sub_4E878();
  _os_log_debug_impl(v1, v2, v3, v4, v5, 8u);
}

void sub_92384()
{
  sub_3DDE8();
  uint64_t v1 = [(id)sub_4E86C(v0) componentsJoinedByString:@", "];
  sub_3DCE4();
  sub_4E82C(&dword_0, v2, v3, "error retrieving asset details for assetIDs: [%@] error=%@", v4, v5, v6, v7, v8);
}

void sub_92418()
{
  sub_3DDE8();
  uint64_t v1 = [*(id *)(v0 + 48) componentsJoinedByString:@", "];
  sub_3DCE4();
  sub_4E82C(&dword_0, v2, v3, "error retrieving reading now details for assetIDs: [%@] error=%@", v4, v5, v6, v7, v8);
}

void sub_924B0()
{
  sub_3DDE8();
  [*(id *)(v0 + 32) count];
  sub_3DCE4();
  sub_4E878();
  _os_log_debug_impl(v1, v2, v3, v4, v5, 0x16u);
}

void sub_92534()
{
  sub_3DCD8();
  sub_3DD44(&dword_0, v0, v1, "********** not calling from -managedObjectBackgroundMonitor:didSaveNotification for addedItems", v2, v3, v4, v5, v6);
}

void sub_92568()
{
  sub_3DCD8();
  sub_3DD44(&dword_0, v0, v1, "********** about to call from -managedObjectBackgroundMonitor:didSaveNotification for addedItems", v2, v3, v4, v5, v6);
}

void sub_9259C(uint64_t a1)
{
  [*(id *)(a1 + 32) count];
  sub_3DCB4();
  sub_4E84C(&dword_0, v1, v2, "ManagedObjectBackgroundMonitor found %lu assets updated", v3, v4, v5, v6, v7);
}

void sub_92618()
{
  sub_3DCD8();
  sub_3DD44(&dword_0, v0, v1, "********** about to call from -managedObjectBackgroundMonitor:didSaveNotification updatedItems", v2, v3, v4, v5, v6);
}

void sub_9264C(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint8_t v7 = [a2 annotationAssetID];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_0, a4, OS_LOG_TYPE_ERROR, "mismatched annotation for %@", a1, 0xCu);
}

void sub_926C4()
{
  sub_3DDE8();
  uint64_t v1 = [*(id *)(v0 + 32) allKeys];
  sub_3DCE4();
  sub_4E82C(&dword_0, v2, v3, "error getting mutable assetDetails for %@: %@", v4, v5, v6, v7, v8);
}

void sub_92754()
{
  sub_3DCB4();
  sub_3DC98(&dword_0, v0, v1, "error retrieving getAssetDetailChangesSince:%@", v2, v3, v4, v5, v6);
}

void sub_927BC()
{
  sub_3DCD8();
  sub_3DD44(&dword_0, v0, v1, "#ReadingNowChanged BCCloudReadingNowManagerChanged notification received, deferring processing", v2, v3, v4, v5, v6);
}

void sub_927F0()
{
  sub_3DCD8();
  sub_3DD44(&dword_0, v0, v1, "#ReadingNowChanged BCCloudReadingNowManagerChanged notification received, starting processing", v2, v3, v4, v5, v6);
}

void sub_92824()
{
  sub_3DCB4();
  sub_3DC98(&dword_0, v0, v1, "error getReadingNowDetailChangesSince:%@", v2, v3, v4, v5, v6);
}

void sub_9288C(uint64_t a1)
{
  [*(id *)(a1 + 48) enableCloudMerge];
  sub_4E878();
  _os_log_debug_impl(v1, v2, v3, v4, v5, 0x1Cu);
}

void sub_92938(void *a1)
{
  uint64_t v1 = [a1 bu_prettyDescription];
  sub_3DCB4();
  sub_4E84C(&dword_0, v2, v3, "merging cloudDetails into app library:%@", v4, v5, v6, v7, v8);
}

void sub_929BC()
{
  sub_3DCD8();
  sub_3DD44(&dword_0, v0, v1, "#ReadingNowChanged completed fetchAgain, processing deferred notification.", v2, v3, v4, v5, v6);
}

void sub_929F0()
{
  sub_3DCD8();
  sub_3DD44(&dword_0, v0, v1, "#ReadingNowChanged completed fetchAgain, NO deferred notification.", v2, v3, v4, v5, v6);
}

void sub_92A24()
{
  sub_3DDE8();
  uint64_t v1 = [*(id *)(v0 + 48) componentsJoinedByString:@", "];
  sub_3DCE4();
  sub_4E82C(&dword_0, v2, v3, "error retrieving assetDetails for assetIDs: [%@] error=%@", v4, v5, v6, v7, v8);
}

void sub_92ABC(void *a1)
{
  uint64_t v2 = [a1 collectionID];
  uint64_t v9 = [a1 assetID];
  sub_4E82C(&dword_0, v3, v4, "BKCollectionMember does not have a valid collectionID: %@ or assetID: %@", v5, v6, v7, v8, 2u);
}

void sub_92B70(void *a1, NSObject *a2)
{
  uint64_t v4 = [a1 assetID];
  uint64_t v5 = [a1 collection];
  uint64_t v6 = [v5 title];
  uint64_t v7 = [a1 asset];
  uint64_t v8 = [v7 title];
  int v9 = 138412802;
  int v10 = v4;
  __int16 v11 = 2112;
  __int16 v12 = v6;
  __int16 v13 = 2112;
  __int16 v14 = v8;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "BKCollectionMember missing assetID.  Configuring with %@ for collectionMember %@ - %@", (uint8_t *)&v9, 0x20u);
}

void sub_92C78(void *a1)
{
  uint64_t v1 = [a1 assetID];
  sub_53254();
  sub_4E82C(&dword_0, v2, v3, "BKCollectionMember invalid update with collectionMember.  Asset ID Mismatch! %{public}@ != %{public}@", v4, v5, v6, v7, v8);
}

void sub_92D08(void *a1)
{
  uint64_t v1 = [a1 collectionID];
  sub_53254();
  sub_4E82C(&dword_0, v2, v3, "BKCollectionMember invalid update with collectionMember.  Collection ID Mismatch! %{public}@ != %{public}@", v4, v5, v6, v7, v8);
}

void sub_92D98(void *a1)
{
  uint64_t v1 = [a1 collectionID];
  sub_53254();
  sub_4E82C(&dword_0, v2, v3, "BKCollectionMember Configuring from a deleted collection member %{public}@ != %{public}@", v4, v5, v6, v7, v8);
}

void sub_92E28(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 cacheURL];
  int v6 = 138543618;
  uint64_t v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_0, a3, OS_LOG_TYPE_ERROR, "Error unarchiving product profiles at %{public}@: %{public}@", (uint8_t *)&v6, 0x16u);
}

void sub_92ED8(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)long long buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Failed to read: %{public}@ -- %{public}@", buf, 0x16u);
}

void sub_92F40(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)long long buf = 141558274;
  *(void *)(buf + 4) = 1752392040;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a1;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "BKLibrary+BCCacheManager: Timed out waiting for fetchImageForAsset for asset ID %{mask.hash}@", buf, 0x16u);
}

void sub_92FAC(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)a1 + 8) + 40) count];
  sub_3DCB4();
  sub_4E84C(&dword_0, v1, v2, "_performResetCollectionsInMoc signal  %lu", v3, v4, v5, v6, v7);
}

void sub_93030()
{
  sub_3DCB4();
  sub_3DC98(&dword_0, v0, v1, "Error fetching default collections, error = %@", v2, v3, v4, v5, v6);
}

void sub_93098()
{
  sub_6FD48(__stack_chk_guard);
  sub_3DDF4();
  sub_3F7C(&dword_0, v0, v1, "Failed to remove %@ from Want to Read. %@");
}

void sub_93100()
{
  sub_6FD48(__stack_chk_guard);
  sub_3DC98(&dword_0, v0, v1, "Error adding storeItem for storeID: %@", v2, v3, v4, v5, 2u);
}

void sub_9316C(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&void v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *(void *)(a2 + 48);
  sub_3F7C(&dword_0, a2, a3, "Error adding to collection: %@ storeID: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_931EC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_9325C()
{
  sub_6FD48(__stack_chk_guard);
  sub_3DDF4();
  sub_3F7C(&dword_0, v0, v1, "collectionDetailManager error setting collectionDetails for collectionIDs: %{public}@ error:%@");
}

void sub_932C4()
{
  sub_3DDF4();
  sub_3F7C(&dword_0, v0, v1, "collectionMemberManager error setting collectionMember memberIDs: %@ error:%@");
}

void sub_93330()
{
  sub_6FD48(__stack_chk_guard);
  sub_3DDF4();
  sub_3F7C(&dword_0, v0, v1, "collectionMemberManager warning deleting collectionMember  memberIDs: %@ error:%@");
}

void sub_93398(void *a1)
{
  os_log_t v1 = [a1 object];
  sub_3DCB4();
  sub_4E84C(&dword_0, v2, v3, "Received moc did save from: %@", v4, v5, v6, v7, v8);
}

void sub_93420()
{
  sub_3DCB4();
  sub_3DC98(&dword_0, v0, v1, "error retrieving getCollectionDetailChangesSince:%@", v2, v3, v4, v5, v6);
}

void sub_93488()
{
  sub_3DCB4();
  sub_3DC98(&dword_0, v0, v1, "error retrieving getCollectionMemberChangesSince:%@", v2, v3, v4, v5, v6);
}

void sub_934F0(void *a1)
{
  [a1 count];
  sub_3DCB4();
  sub_4E84C(&dword_0, v1, v2, "Found %lu BKCollectionMembers with missing asset link. Trying to link them to an existing asset.", v3, v4, v5, v6, v7);
}

void sub_93568()
{
  sub_3DCB4();
  sub_3DC98(&dword_0, v0, v1, "Error fetching BKCollectionMembers with missing asset link: %@", v2, v3, v4, v5, v6);
}

void sub_935D0(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_3DCB4();
  sub_3DE60(&dword_0, v2, v3, "Failed to fetch PDF assets, error: %@", v4, v5, v6, v7, v8);
}

void sub_93654(void *a1)
{
  [a1 count];
  sub_3DCB4();
  sub_4E84C(&dword_0, v1, v2, "#resetCollections: gatherChangedAssetsCollectionsWithLibraryMoc %lu", v3, v4, v5, v6, v7);
}

void sub_936CC()
{
  sub_3DCB4();
  sub_3DC98(&dword_0, v0, v1, "Error saving MOC in resetCollections %@", v2, v3, v4, v5, v6);
}

void sub_93734(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) storeID];
  sub_3DCB4();
  sub_3DE60(&dword_0, v2, v3, "Error adding storeItem for storeID: %@", v4, v5, v6, v7, v8);
}

void sub_937BC()
{
  sub_3DCB4();
  sub_3F7C(&dword_0, v0, v1, "Failed to fetch libraryAssets with contentTypes {%@} {%@}");
}

uint64_t sub_93830()
{
  return Notification.object.getter();
}

uint64_t sub_93840()
{
  return _convertNSErrorToError(_:)();
}

NSData sub_93850()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_93860()
{
  return type metadata accessor for ContentType();
}

uint64_t sub_93870()
{
  return LibraryData.init(librarySummary:)();
}

uint64_t sub_93880()
{
  return type metadata accessor for LibraryData();
}

uint64_t sub_93890()
{
  return static CollectionIDData.data(with:for:)();
}

uint64_t sub_938A0()
{
  return type metadata accessor for CollectionIDData();
}

uint64_t sub_938B0()
{
  return LibraryItemTypeData.init(contentPrivateID:contentUserID:contentType:contentID:isSample:)();
}

uint64_t sub_938C0()
{
  return type metadata accessor for LibraryItemTypeData();
}

uint64_t sub_938D0()
{
  return CollectionSummaryData.init(collectionSummary:)();
}

uint64_t sub_938E0()
{
  return type metadata accessor for CollectionSummaryData();
}

uint64_t sub_938F0()
{
  return dispatch thunk of static Utilities.contentType(from:)();
}

uint64_t sub_93900()
{
  return type metadata accessor for Utilities();
}

uint64_t sub_93910()
{
  return type metadata accessor for FinishedDateKind();
}

uint64_t sub_93920()
{
  return Logger.logObject.getter();
}

uint64_t sub_93930()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_93940()
{
  return type metadata accessor for Logger();
}

uint64_t sub_93950()
{
  return Logger.init(_:)();
}

uint64_t sub_93960()
{
  return static RCDataContainer.default.getter();
}

uint64_t sub_93970()
{
  return type metadata accessor for RCDataContainer();
}

uint64_t sub_93980()
{
  return RCDataContaining.booksDefaultsValue.getter();
}

uint64_t sub_93990()
{
  return RCDataContaining.booksDefaultsValues()();
}

uint64_t sub_939A0()
{
  return _AnyDefaultsValue.subscript.getter();
}

uint64_t sub_939B0()
{
  return _AnyDefaultsValue<>.priceTrackingUpdateScheduleSteps.getter();
}

uint64_t sub_939C0()
{
  return _AnyDefaultsValue.init(_:)();
}

uint64_t sub_939D0()
{
  return dispatch thunk of BCCloudGlobalMetadataManaging.changeSignals.getter();
}

uint64_t sub_93A00()
{
  return static BCCloudGlobalMetadataManaging<>.default.getter();
}

uint64_t sub_93A10()
{
  return type metadata accessor for BCDefaultCloudGlobalMetadataManager();
}

uint64_t sub_93A20()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString sub_93A30()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_93A40()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_93A50()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_93A60()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_93A70()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t sub_93A80()
{
  return static String.Encoding.utf8.getter();
}

uint64_t sub_93A90()
{
  return type metadata accessor for String.Encoding();
}

uint64_t sub_93AA0()
{
  return String.hash(into:)();
}

void sub_93AB0(Swift::String a1)
{
}

Swift::Int sub_93AC0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_93AD0()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_93AE0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_93AF0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_93B00()
{
  return Array.description.getter();
}

uint64_t sub_93B10()
{
  return specialized Array._endMutation()();
}

uint64_t sub_93B20()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_93B30()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_93B40()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_93B50()
{
  return CheckedContinuation.resume(throwing:)();
}

uint64_t sub_93B60()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t sub_93B80()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_93B90()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_93BA0()
{
  return static AsyncStream.makeStream(of:bufferingPolicy:)();
}

uint64_t sub_93BB0()
{
  return AsyncStream.Continuation.onTermination.setter();
}

uint64_t sub_93BC0()
{
  return AsyncStream.Continuation.yield(_:)();
}

uint64_t sub_93BD0()
{
  return type metadata accessor for AsyncStream.Continuation();
}

void sub_93BE0()
{
}

uint64_t sub_93BF0()
{
  return dispatch thunk of AsyncSequence.makeAsyncIterator()();
}

uint64_t sub_93C00()
{
  return AsyncSequence<>.removeDuplicates()();
}

NSNumber sub_93C10()
{
  return Double._bridgeToObjectiveC()();
}

uint64_t sub_93C20()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_93C30()
{
  return Set.description.getter();
}

uint64_t sub_93C40()
{
  return Set.init(minimumCapacity:)();
}

NSNumber sub_93C50()
{
  return Int._bridgeToObjectiveC()();
}

uint64_t sub_93C60()
{
  return Collection.isNotEmpty.getter();
}

uint64_t sub_93C70()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_93C80()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_93C90()
{
  return type metadata accessor for NSNotificationCenter.Notifications();
}

uint64_t sub_93CA0()
{
  return NSNotificationCenter.notifications(named:object:)();
}

uint64_t sub_93CB0()
{
  return NSManagedObjectContext.count<A>(for:)();
}

uint64_t sub_93CC0()
{
  return NSManagedObjectContext.fetch<A>(_:)();
}

uint64_t sub_93CD0()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_93CE0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_93CF0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_93D00()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_93D10()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_93D20()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_93D30()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_93D40(Swift::Int a1)
{
}

uint64_t sub_93D50()
{
  return _StringGuts.copyUTF8(into:)();
}

void sub_93D60(Swift::Int a1)
{
}

uint64_t sub_93D70()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_93D80()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_93D90()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_93DA0()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_93DB0()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_93DC0()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_93DD0()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_93DE0()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_93DF0()
{
  return AsyncMapSequence.init(_:transform:)();
}

uint64_t sub_93E00()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_93E10()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_93E20()
{
  return _CocoaArrayWrapper.subscript.getter();
}

uint64_t sub_93E30()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_93E40()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_93E50()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_93E60()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_93E70()
{
  return AsyncFilterSequence.init(_:isIncluded:)();
}

uint64_t sub_93E90()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_93EA0()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_93EB0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_93EC0()
{
  return type metadata accessor for __ContiguousArrayStorageBase();
}

uint64_t sub_93EE0()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_93F00()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_93F10()
{
  return Hasher._finalize()();
}

uint64_t BALog()
{
  return _BALog();
}

uint64_t BCAssetContentTypeFromBKAssetContentType()
{
  return _BCAssetContentTypeFromBKAssetContentType();
}

uint64_t BCBookPromotionLog()
{
  return _BCBookPromotionLog();
}

uint64_t BCFloatAssertUnitIntervalClamp()
{
  return _BCFloatAssertUnitIntervalClamp();
}

uint64_t BCIMLog()
{
  return _BCIMLog();
}

uint64_t BCImageCacheLog()
{
  return _BCImageCacheLog();
}

uint64_t BCReadingStatisticsLog()
{
  return _BCReadingStatisticsLog();
}

uint64_t BCReportAssertionFailureWithMessage()
{
  return _BCReportAssertionFailureWithMessage();
}

uint64_t BCSignpostLibrary()
{
  return _BCSignpostLibrary();
}

uint64_t BDSXPCNotificationsEnabled()
{
  return _BDSXPCNotificationsEnabled();
}

uint64_t BKGenericBookCoverCreateImage()
{
  return _BKGenericBookCoverCreateImage();
}

uint64_t BKGenericBookCoverDefaultSettings()
{
  return _BKGenericBookCoverDefaultSettings();
}

uint64_t BKLibraryLog()
{
  return _BKLibraryLog();
}

uint64_t BKLibraryUILog()
{
  return _BKLibraryUILog();
}

uint64_t BKMobileCloudSyncAnnotationsLog()
{
  return _BKMobileCloudSyncAnnotationsLog();
}

uint64_t BKStoreLog()
{
  return _BKStoreLog();
}

uint64_t BLAudiobookStreamingEnabled()
{
  return _BLAudiobookStreamingEnabled();
}

uint64_t BUDynamicCast()
{
  return _BUDynamicCast();
}

uint64_t BUIsRunningTests()
{
  return _BUIsRunningTests();
}

uint64_t BUProtocolCast()
{
  return _BUProtocolCast();
}

uint64_t BUStoreIdStringFromObject()
{
  return _BUStoreIdStringFromObject();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return _CFSetCreateMutable(allocator, capacity, callBacks);
}

void NSLog(NSString *format, ...)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return _NSSearchPathForDirectoriesInDomains(directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return __os_activity_create(dso, description, activity, flags);
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void bzero(void *a1, size_t a2)
{
}

int chmod(const char *a1, mode_t a2)
{
  return _chmod(a1, a2);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return _dispatch_queue_attr_make_initially_inactive(attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return _getpid();
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

void os_activity_apply(os_activity_t activity, os_block_t block)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return _os_signpost_id_generate(log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_lock_lock_with_options()
{
  return _os_unfair_lock_lock_with_options();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
}

uint64_t swift_asyncLet_begin()
{
  return _swift_asyncLet_begin();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_defaultActor_destroy()
{
  return _swift_defaultActor_destroy();
}

uint64_t swift_defaultActor_initialize()
{
  return _swift_defaultActor_initialize();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return _swift_unknownObjectWeakCopyAssign();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return _swift_unknownObjectWeakCopyInit();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return _swift_unknownObjectWeakTakeAssign();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return _swift_unknownObjectWeakTakeInit();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return [a1 URLByAppendingPathComponent:isDirectory:];
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_URLForDirectory_inDomain_appropriateForURL_create_error_(void *a1, const char *a2, ...)
{
  return [a1 URLForDirectory:inDomain:appropriateForURL:create:error:];
}

id objc_msgSend_URLForResource_withExtension_(void *a1, const char *a2, ...)
{
  return [a1 URLForResource:withExtension:];
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return [a1 URLWithString:];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend__addArrayControllerWithFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addArrayControllerWithFilter:");
}

id objc_msgSend__addAssetID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addAssetID:");
}

id objc_msgSend__addBitmask_toUpdate_inMethod_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addBitmask:toUpdate:inMethod:");
}

id objc_msgSend__addDataSourceIdentifierAndStateObserver_(void *a1, const char *a2, ...)
{
  return [a1 _addDataSourceIdentifierAndStateObserver];
}

id objc_msgSend__addMemberWithAsset_toCollection_moc_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addMemberWithAsset:toCollection:moc:");
}

id objc_msgSend__assetIDsForCollectionID_moc_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_assetIDsForCollectionID:moc:");
}

id objc_msgSend__assetPurchasedDSIDForLibraryAsset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_assetPurchasedDSIDForLibraryAsset:");
}

id objc_msgSend__bookWasOpenedWithStoreID_permlink_date_(void *a1, const char *a2, ...)
{
  return [a1 _bookWasOpenedWithStoreID:permlink:date:];
}

id objc_msgSend__cachedProductProfiles(void *a1, const char *a2, ...)
{
  return _[a1 _cachedProductProfiles];
}

id objc_msgSend__callCompletionHandlers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_callCompletionHandlers:");
}

id objc_msgSend__checkForChangesFromCloudAssetDetailManagerInMOC_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkForChangesFromCloudAssetDetailManagerInMOC:reason:");
}

id objc_msgSend__checkForChangesFromCloudCollectionDetailManagerInMOC_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkForChangesFromCloudCollectionDetailManagerInMOC:reason:");
}

id objc_msgSend__checkForChangesFromCloudCollectionMemberManagerInMOC_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkForChangesFromCloudCollectionMemberManagerInMOC:reason:");
}

id objc_msgSend__checkForChangesFromCloudReadingNowDetailManagerInMOC_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkForChangesFromCloudReadingNowDetailManagerInMOC:reason:");
}

id objc_msgSend__cleanUpOrphanedSampleAssets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cleanUpOrphanedSampleAssets:");
}

id objc_msgSend__compareVersionWith_(void *a1, const char *a2, ...)
{
  return [a1 _compareVersionWith:];
}

id objc_msgSend__continueReadingPredicate(void *a1, const char *a2, ...)
{
  return _[a1 _continueReadingPredicate];
}

id objc_msgSend__dataSourceMatchingPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dataSourceMatchingPredicate:");
}

id objc_msgSend__dataSourcesMatchingPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dataSourcesMatchingPredicate:");
}

id objc_msgSend__dateComponentsForYear_(void *a1, const char *a2, ...)
{
  return [a1 _dateComponentsForYear:];
}

id objc_msgSend__dateFinishedForYearOnly_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dateFinishedForYearOnly:");
}

id objc_msgSend__documentsURLWithFilename_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_documentsURLWithFilename:");
}

id objc_msgSend__ensureBackupAttributeOnItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_ensureBackupAttributeOnItemAtPath:error:");
}

id objc_msgSend__enumerateDataSources_intersectingWithAssetIDs_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enumerateDataSources:intersectingWithAssetIDs:usingBlock:");
}

id objc_msgSend__fetchImageForAsset_size_includeSpine_includeShadow_allowGeneric_coverEffectsEnvironment_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchImageForAsset:size:includeSpine:includeShadow:allowGeneric:coverEffectsEnvironment:completion:");
}

id objc_msgSend__fetchLibraryAssetsWithTypes_searchTerm_inManagedObjectContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchLibraryAssetsWithTypes:searchTerm:inManagedObjectContext:");
}

id objc_msgSend__fetchPricesForStoreAssetIDs(void *a1, const char *a2, ...)
{
  return _[a1 _fetchPricesForStoreAssetIDs];
}

id objc_msgSend__fetchPricesForStoreAssets_forGeneration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchPricesForStoreAssets:forGeneration:");
}

id objc_msgSend__fetchProductProfiles(void *a1, const char *a2, ...)
{
  return _[a1 _fetchProductProfiles];
}

id objc_msgSend__fileSizeForAssetAtURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fileSizeForAssetAtURL:");
}

id objc_msgSend__filterAsset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_filterAsset:");
}

id objc_msgSend__filterDownloadForAsset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_filterDownloadForAsset:");
}

id objc_msgSend__filterUpdateForAsset_(void *a1, const char *a2, ...)
{
  return [a1 _filterUpdateForAsset:];
}

id objc_msgSend__filterUploadsForAsset_(void *a1, const char *a2, ...)
{
  return [a1 _filterUploadsForAsset:];
}

id objc_msgSend__fixFilePermissions_(void *a1, const char *a2, ...)
{
  return [a1 _fixFilePermissions:];
}

id objc_msgSend__forceFileProtectionOnItemAtPath_usingFileManager_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_forceFileProtectionOnItemAtPath:usingFileManager:error:");
}

id objc_msgSend__hasActiveDownloadForAssetID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hasActiveDownloadForAssetID:");
}

id objc_msgSend__includeInDownloadsForAssetID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_includeInDownloadsForAssetID:");
}

id objc_msgSend__includeInUploadsForAssetID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_includeInUploadsForAssetID:");
}

id objc_msgSend__includedInUpdatesForAssetID_(void *a1, const char *a2, ...)
{
  return [a1 _includedInUpdatesForAssetID];
}

id objc_msgSend__initializeProgress(void *a1, const char *a2, ...)
{
  return _[a1 _initializeProgress];
}

id objc_msgSend__installedUnzippedAssetDiskSpaceMetrics_directory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_installedUnzippedAssetDiskSpaceMetrics:directory:");
}

id objc_msgSend__invalidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_invalidate:");
}

id objc_msgSend__isMultiUser(void *a1, const char *a2, ...)
{
  return _[a1 _isMultiUser];
}

id objc_msgSend__isSignedInForAssetID_(void *a1, const char *a2, ...)
{
  return [a1 _isSignedInForAssetID:];
}

id objc_msgSend__isUbiquityItem(void *a1, const char *a2, ...)
{
  return _[a1 _isUbiquityItem];
}

id objc_msgSend__libraryAssetsForPostProcessingInManagedObjectContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_libraryAssetsForPostProcessingInManagedObjectContext:");
}

id objc_msgSend__libraryDataSource_removedAssetsWithAssetIDs_orTemporaryAssetIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_libraryDataSource:removedAssetsWithAssetIDs:orTemporaryAssetIDs:");
}

id objc_msgSend__libraryDataSourcePerformanceChanged(void *a1, const char *a2, ...)
{
  return _[a1 _libraryDataSourcePerformanceChanged];
}

id objc_msgSend__migrateFromOldDatabase(void *a1, const char *a2, ...)
{
  return _[a1 _migrateFromOldDatabase];
}

id objc_msgSend__notifyLibraryOperationDone_assetIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_notifyLibraryOperationDone:assetIDs:");
}

id objc_msgSend__notifyListeners_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_notifyListeners:");
}

id objc_msgSend__passesExplicitContentFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_passesExplicitContentFilter:");
}

id objc_msgSend__performCopyFromPath_toPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performCopyFromPath:toPath:");
}

id objc_msgSend__performInitialDataBaseMaintenance(void *a1, const char *a2, ...)
{
  return _[a1 _performInitialDataBaseMaintenance];
}

id objc_msgSend__performMoveFromPath_toPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performMoveFromPath:toPath:");
}

id objc_msgSend__performReload(void *a1, const char *a2, ...)
{
  return _[a1 _performReload];
}

id objc_msgSend__performZipExtractionFromPath_toPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performZipExtractionFromPath:toPath:");
}

id objc_msgSend__persistedInfoURL(void *a1, const char *a2, ...)
{
  return _[a1 _persistedInfoURL];
}

id objc_msgSend__persistentStoreOptions(void *a1, const char *a2, ...)
{
  return _[a1 _persistentStoreOptions];
}

id objc_msgSend__postProcess(void *a1, const char *a2, ...)
{
  return _[a1 _postProcess];
}

id objc_msgSend__postProcessCoverImagesForProductProfiles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_postProcessCoverImagesForProductProfiles:");
}

id objc_msgSend__postProcessExplicitFlagForProductProfiles_(void *a1, const char *a2, ...)
{
  return [a1 _postProcessExplicitFlagForProductProfiles:];
}

id objc_msgSend__predicateForAssetsWithContentTypes_(void *a1, const char *a2, ...)
{
  return [a1 _predicateForAssetsWithContentTypes:];
}

id objc_msgSend__predicateForBooksInSeriesWithCorrectAuthorInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_predicateForBooksInSeriesWithCorrectAuthorInfo:");
}

id objc_msgSend__predicateForBooksInSeriesWithCorrectSortAuthorInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_predicateForBooksInSeriesWithCorrectSortAuthorInfo:");
}

id objc_msgSend__predicateForBooksShownInAllBooks(void *a1, const char *a2, ...)
{
  return _[a1 _predicateForBooksShownInAllBooks];
}

id objc_msgSend__predicateForSearchText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_predicateForSearchText:");
}

id objc_msgSend__previouslyReadPredicate(void *a1, const char *a2, ...)
{
  return _[a1 _previouslyReadPredicate];
}

id objc_msgSend__processDownloadStatuses_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processDownloadStatuses:completion:");
}

id objc_msgSend__processLibraryOwnershipNotification_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processLibraryOwnershipNotification:completion:");
}

id objc_msgSend__rawSeriesAuthorForContainerID_context_(void *a1, const char *a2, ...)
{
  return [a1 _rawSeriesAuthorForContainerID:context:];
}

id objc_msgSend__rawSeriesSortAuthorForContainerID_context_(void *a1, const char *a2, ...)
{
  return [a1 _rawSeriesSortAuthorForContainerID:context:];
}

id objc_msgSend__readLibraryVesionInfo(void *a1, const char *a2, ...)
{
  return _[a1 _readLibraryVesionInfo];
}

id objc_msgSend__readPersistedInfoFromDisk(void *a1, const char *a2, ...)
{
  return _[a1 _readPersistedInfoFromDisk];
}

id objc_msgSend__recentlyEngagedPredicate(void *a1, const char *a2, ...)
{
  return _[a1 _recentlyEngagedPredicate];
}

id objc_msgSend__recentlyReadPredicate(void *a1, const char *a2, ...)
{
  return _[a1 _recentlyReadPredicate];
}

id objc_msgSend__refreshArtForAsset_(void *a1, const char *a2, ...)
{
  return [a1 _refreshArtForAsset:];
}

id objc_msgSend__reloadDataSource_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reloadDataSource:completion:");
}

id objc_msgSend__reloadWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reloadWithCompletion:");
}

id objc_msgSend__removeAllMembersFromCollection_moc_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeAllMembersFromCollection:moc:");
}

id objc_msgSend__removeArrayController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeArrayController:");
}

id objc_msgSend__removeAssetID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeAssetID:");
}

id objc_msgSend__removeAssetIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeAssetIDs:");
}

id objc_msgSend__removeBitmask_fromUpdate_inMethod_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeBitmask:fromUpdate:inMethod:");
}

id objc_msgSend__removeDataSourceIdentifierAndStateObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeDataSourceIdentifierAndStateObserver:");
}

id objc_msgSend__removeDupesByAssetID_inMoc_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeDupesByAssetID:inMoc:");
}

id objc_msgSend__removeDupesByTemporaryAssetID_inMoc_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeDupesByTemporaryAssetID:inMoc:");
}

id objc_msgSend__removeDuplicateCollectionMembers(void *a1, const char *a2, ...)
{
  return _[a1 _removeDuplicateCollectionMembers];
}

id objc_msgSend__removeObsoletePersistedInfo(void *a1, const char *a2, ...)
{
  return _[a1 _removeObsoletePersistedInfo];
}

id objc_msgSend__removePossibleDupes_inMoc_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removePossibleDupes:inMoc:");
}

id objc_msgSend__removeTrackingOfAssetID_(void *a1, const char *a2, ...)
{
  return [a1 _removeTrackingOfAssetID];
}

id objc_msgSend__reportingProgress(void *a1, const char *a2, ...)
{
  return _[a1 _reportingProgress];
}

id objc_msgSend__resetAuthorsAndStacksInContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resetAuthorsAndStacksInContext:");
}

id objc_msgSend__resetNilAuthorsOnAllBooksInContext_(void *a1, const char *a2, ...)
{
  return [a1 _resetNilAuthorsOnAllBooksInContext:];
}

id objc_msgSend__resetNilAuthorsOnAllSeriesInContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resetNilAuthorsOnAllSeriesInContext:");
}

id objc_msgSend__resetSeriesIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resetSeriesIDs:");
}

id objc_msgSend__scheduleOperationGroupWithName_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scheduleOperationGroupWithName:block:");
}

id objc_msgSend__setFinishedStates_(void *a1, const char *a2, ...)
{
  return [_a1 _setFinishedStates:];
}

id objc_msgSend__setupUICoreDataStack(void *a1, const char *a2, ...)
{
  return _[a1 _setupUICoreDataStack];
}

id objc_msgSend__shouldPropagateNilAssetIDForDataSourceWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldPropagateNilAssetIDForDataSourceWithIdentifier:");
}

id objc_msgSend__sortAndInitializeDataSources_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sortAndInitializeDataSources:");
}

id objc_msgSend__sortUserCollectionToTop_moc_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sortUserCollectionToTop:moc:");
}

id objc_msgSend__spotlightAssetsWithContentTypes_searchTerm_inManagedObjectContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_spotlightAssetsWithContentTypes:searchTerm:inManagedObjectContext:");
}

id objc_msgSend__startUpdateForAssetIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startUpdateForAssetIDs:");
}

id objc_msgSend__trimUpdateDictionary(void *a1, const char *a2, ...)
{
  return _[a1 _trimUpdateDictionary];
}

id objc_msgSend__updateAcknowledgeCountsWithAssetIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAcknowledgeCountsWithAssetIDs:");
}

id objc_msgSend__updateAssetDetailCloudVersionFromCloudSyncVersions_inMOC_fetchAgain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAssetDetailCloudVersionFromCloudSyncVersions:inMOC:fetchAgain:");
}

id objc_msgSend__updateAssetsWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAssetsWithBlock:");
}

id objc_msgSend__updateAuthorForSeriesContainer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAuthorForSeriesContainer:");
}

id objc_msgSend__updateCountsForAssetIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateCountsForAssetIDs:");
}

id objc_msgSend__updateCreationDate(void *a1, const char *a2, ...)
{
  return _[a1 _updateCreationDate];
}

id objc_msgSend__updateEnabled(void *a1, const char *a2, ...)
{
  return _[a1 _updateEnabled];
}

id objc_msgSend__updateGlobalAnnotationsFromDetails_annotationProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateGlobalAnnotationsFromDetails:annotationProvider:");
}

id objc_msgSend__updateInfoForAssetID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateInfoForAssetID:");
}

id objc_msgSend__updateLibraryAssetWithID_withLastOpenDate_withMoc_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateLibraryAssetWithID:withLastOpenDate:withMoc:");
}

id objc_msgSend__updateMostRecentPurchaseDateCacheFromDataSources(void *a1, const char *a2, ...)
{
  return _[a1 _updateMostRecentPurchaseDateCacheFromDataSources];
}

id objc_msgSend__updateProcessingAuthenticationStateDeferred(void *a1, const char *a2, ...)
{
  return _[a1 _updateProcessingAuthenticationStateDeferred];
}

id objc_msgSend__updateProcessingAuthenticationStateImmediate(void *a1, const char *a2, ...)
{
  return _[a1 _updateProcessingAuthenticationStateImmediate];
}

id objc_msgSend__updateRelationshipsInContext_(void *a1, const char *a2, ...)
{
  return [a1 _updateRelationshipsInContext:];
}

id objc_msgSend__updateSeriesContainerDownloadStatusForAssetIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateSeriesContainerDownloadStatusForAssetIDs:");
}

id objc_msgSend__updateTotalPercentCompleteForAssetIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateTotalPercentCompleteForAssetIDs:");
}

id objc_msgSend__updateUploadStatusForAssetIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateUploadStatusForAssetIDs:");
}

id objc_msgSend__updatedAssets(void *a1, const char *a2, ...)
{
  return _[a1 _updatedAssets];
}

id objc_msgSend__validateIsState2(void *a1, const char *a2, ...)
{
  return _[a1 _validateIsState2];
}

id objc_msgSend__validateIsState3(void *a1, const char *a2, ...)
{
  return _[a1 _validateIsState3];
}

id objc_msgSend__writePersistentInfoIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _writePersistentInfoIfNeeded];
}

id objc_msgSend__zipExtractionPathFromSourcePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_zipExtractionPathFromSourcePath:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _[a1 absoluteString];
}

id objc_msgSend_accountID(void *a1, const char *a2, ...)
{
  return _[a1 accountID];
}

id objc_msgSend_actionTextForType_withAsset_(void *a1, const char *a2, ...)
{
  return [a1 actionTextForType:withAsset:];
}

id objc_msgSend_activeStoreAccount(void *a1, const char *a2, ...)
{
  return _[a1 activeStoreAccount];
}

id objc_msgSend_actualAuthorFromMetedata_(void *a1, const char *a2, ...)
{
  return [a1 actualAuthorFromMetedata:];
}

id objc_msgSend_actualCompletedImportOperations(void *a1, const char *a2, ...)
{
  return _[a1 actualCompletedImportOperations];
}

id objc_msgSend_actualFailedImportOperations(void *a1, const char *a2, ...)
{
  return _[a1 actualFailedImportOperations];
}

id objc_msgSend_actualTotalImportOperations(void *a1, const char *a2, ...)
{
  return _[a1 actualTotalImportOperations];
}

id objc_msgSend_addCollectionMemberAvoidingDupesWithAsset_assetID_temporaryAssetID_sortKey_forceToTop_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCollectionMemberAvoidingDupesWithAsset:assetID:temporaryAssetID:sortKey:forceToTop:");
}

id objc_msgSend_addCollectionMemberAvoidingDupesWithAssetID_sortKey_forceToTop_(void *a1, const char *a2, ...)
{
  return [a1 addCollectionMemberAvoidingDupesWithAssetID:sortKey:forceToTop:];
}

id objc_msgSend_addCollectionMemberDictionaries_forceToTop_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCollectionMemberDictionaries:forceToTop:");
}

id objc_msgSend_addCustomOperationBlock_(void *a1, const char *a2, ...)
{
  return [a1 addCustomOperationBlock:];
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return [a1 addEntriesFromDictionary:];
}

id objc_msgSend_addHidden_inMOC_(void *a1, const char *a2, ...)
{
  return [a1 addHidden:inMOC:];
}

id objc_msgSend_addLibraryAssets_hideAssets_inManagedObjectContext_forceToTop_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addLibraryAssets:hideAssets:inManagedObjectContext:forceToTop:");
}

id objc_msgSend_addLocal_inMOC_(void *a1, const char *a2, ...)
{
  return [a1 addLocal:inMOC:];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 addObjectsFromArray:];
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:];
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:forKeyPath:options:context:];
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:selector:name:object:];
}

id objc_msgSend_addOperationBlock_(void *a1, const char *a2, ...)
{
  return [a1 addOperationBlock:];
}

id objc_msgSend_addPersistentStoreWithType_configuration_URL_options_error_(void *a1, const char *a2, ...)
{
  return [a1 addPersistentStoreWithType:configuration:URL:options:error:];
}

id objc_msgSend_addStatus_forStoreIds_inMOC_(void *a1, const char *a2, ...)
{
  return [a1 addStatus:forStoreIds:inMOC:];
}

id objc_msgSend_addStoreItem_completion_(void *a1, const char *a2, ...)
{
  return [a1 addStoreItem:completion:];
}

id objc_msgSend_addedObjects(void *a1, const char *a2, ...)
{
  return _[a1 addedObjects];
}

id objc_msgSend_adoptMigratedProperties_(void *a1, const char *a2, ...)
{
  return [a1 adoptMigratedProperties:];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allLocalStoreIds_(void *a1, const char *a2, ...)
{
  return [a1 allLocalStoreIds:];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allStoreAssets(void *a1, const char *a2, ...)
{
  return _[a1 allStoreAssets];
}

id objc_msgSend_allStoreIdsForStatus_inMOC_(void *a1, const char *a2, ...)
{
  return [a1 allStoreIdsForStatus:inMOC:];
}

id objc_msgSend_allUnownedStoreAssetIDs_(void *a1, const char *a2, ...)
{
  return [a1 allUnownedStoreAssetIDs:];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_allowsAutoDownloadOfSamplesToWantToRead(void *a1, const char *a2, ...)
{
  return _[a1 allowsAutoDownloadOfSamplesToWantToRead];
}

id objc_msgSend_allowsManualAddition(void *a1, const char *a2, ...)
{
  return _[a1 allowsManualAddition];
}

id objc_msgSend_allowsManualAdditionToCollectionWithID_(void *a1, const char *a2, ...)
{
  return [a1 allowsManualAdditionToCollectionWithID];
}

id objc_msgSend_ams_DSID(void *a1, const char *a2, ...)
{
  return [a1 ams_DSID];
}

id objc_msgSend_andPredicateWithSubpredicates_(void *a1, const char *a2, ...)
{
  return [a1 andPredicateWithSubpredicates:];
}

id objc_msgSend_annotationAssetID(void *a1, const char *a2, ...)
{
  return _[a1 annotationAssetID];
}

id objc_msgSend_annotationLocation(void *a1, const char *a2, ...)
{
  return _[a1 annotationLocation];
}

id objc_msgSend_annotationModificationDate(void *a1, const char *a2, ...)
{
  return _[a1 annotationModificationDate];
}

id objc_msgSend_annotationProvider(void *a1, const char *a2, ...)
{
  return _[a1 annotationProvider];
}

id objc_msgSend_annotationVersion(void *a1, const char *a2, ...)
{
  return _[a1 annotationVersion];
}

id objc_msgSend_annotationsForAssetIDs_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "annotationsForAssetIDs:completion:");
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return _[a1 anyObject];
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return [a1 appendFormat:];
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return [a1 appendString:];
}

id objc_msgSend_applicationCacheDirectory(void *a1, const char *a2, ...)
{
  return _[a1 applicationCacheDirectory];
}

id objc_msgSend_applicationDocumentsDirectory(void *a1, const char *a2, ...)
{
  return _[a1 applicationDocumentsDirectory];
}

id objc_msgSend_applyPendingUpdateForAsset_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyPendingUpdateForAsset:completion:");
}

id objc_msgSend_archiveTransientProperties_(void *a1, const char *a2, ...)
{
  return [a1 archiveTransientProperties:];
}

id objc_msgSend_arrangedObjects(void *a1, const char *a2, ...)
{
  return _[a1 arrangedObjects];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithArray:];
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithCapacity:];
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObject:];
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:count:];
}

id objc_msgSend_asset(void *a1, const char *a2, ...)
{
  return _[a1 asset];
}

id objc_msgSend_assetAccountIdentifiersForAsset_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetAccountIdentifiersForAsset:completion:");
}

id objc_msgSend_assetAccountIdentifiersForAssetID_path_storeID_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetAccountIdentifiersForAssetID:path:storeID:completion:");
}

id objc_msgSend_assetAccountIdentifiersForAssetID_path_storeID_purchasedDSID_downloadedDSID_familyID_dataSourceID_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetAccountIdentifiersForAssetID:path:storeID:purchasedDSID:downloadedDSID:familyID:dataSourceID:completion:");
}

id objc_msgSend_assetDetailManager(void *a1, const char *a2, ...)
{
  return _[a1 assetDetailManager];
}

id objc_msgSend_assetDetailRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 assetDetailRepresentation];
}

id objc_msgSend_assetDetailsForAssetIDs_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetDetailsForAssetIDs:completion:");
}

id objc_msgSend_assetDetailsModificationDate(void *a1, const char *a2, ...)
{
  return _[a1 assetDetailsModificationDate];
}

id objc_msgSend_assetForLibraryAsset_completion_(void *a1, const char *a2, ...)
{
  return [a1 assetForLibraryAsset:completion:];
}

id objc_msgSend_assetGUID(void *a1, const char *a2, ...)
{
  return _[a1 assetGUID];
}

id objc_msgSend_assetID(void *a1, const char *a2, ...)
{
  return _[a1 assetID];
}

id objc_msgSend_assetIDFromCollectionMemberID_(void *a1, const char *a2, ...)
{
  return [a1 assetIDFromCollectionMemberID:];
}

id objc_msgSend_assetIDsInDataSourceWithIdentifier_intersectingWithAssetIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetIDsInDataSourceWithIdentifier:intersectingWithAssetIDs:");
}

id objc_msgSend_assetIDsOfStoreAssetsWithPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetIDsOfStoreAssetsWithPredicate:");
}

id objc_msgSend_assetIsHidden(void *a1, const char *a2, ...)
{
  return _[a1 assetIsHidden];
}

id objc_msgSend_assetLogID(void *a1, const char *a2, ...)
{
  return _[a1 assetLogID];
}

id objc_msgSend_assetPartsForLibraryAsset_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetPartsForLibraryAsset:completion:");
}

id objc_msgSend_assetPathToCacheItemDict(void *a1, const char *a2, ...)
{
  return _[a1 assetPathToCacheItemDict];
}

id objc_msgSend_assetURL(void *a1, const char *a2, ...)
{
  return _[a1 assetURL];
}

id objc_msgSend_assetUpdatesByIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 assetUpdatesByIdentifier];
}

id objc_msgSend_assetVersion(void *a1, const char *a2, ...)
{
  return _[a1 assetVersion];
}

id objc_msgSend_attributeSet(void *a1, const char *a2, ...)
{
  return _[a1 attributeSet];
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return [a1 attributesOfItemAtPath:error:];
}

id objc_msgSend_author(void *a1, const char *a2, ...)
{
  return _[a1 author];
}

id objc_msgSend_authorCount(void *a1, const char *a2, ...)
{
  return _[a1 authorCount];
}

id objc_msgSend_authorNames(void *a1, const char *a2, ...)
{
  return _[a1 authorNames];
}

id objc_msgSend_availableDefaultCollectionIDs(void *a1, const char *a2, ...)
{
  return _[a1 availableDefaultCollectionIDs];
}

id objc_msgSend_availableDefaultCollectionIDsForOS(void *a1, const char *a2, ...)
{
  return _[a1 availableDefaultCollectionIDsForOS];
}

id objc_msgSend_availableSelectableDefaultCollectionIDsForOS(void *a1, const char *a2, ...)
{
  return _[a1 availableSelectableDefaultCollectionIDsForOS];
}

id objc_msgSend_avoidSync(void *a1, const char *a2, ...)
{
  return _[a1 avoidSync];
}

id objc_msgSend_backgroundReadOnlyContextPool(void *a1, const char *a2, ...)
{
  return _[a1 backgroundReadOnlyContextPool];
}

id objc_msgSend_batchDeleteEntity_matching_prefetchRelationships_(void *a1, const char *a2, ...)
{
  return [a1 batchDeleteEntity:matching:prefetchRelationships:];
}

id objc_msgSend_beginAuthentication_(void *a1, const char *a2, ...)
{
  return [a1 beginAuthentication:];
}

id objc_msgSend_bookCoverForLibraryAssetProperties_size_completion_(void *a1, const char *a2, ...)
{
  return [a1 bookCoverForLibraryAssetProperties:size:completion:];
}

id objc_msgSend_bookDescription(void *a1, const char *a2, ...)
{
  return _[a1 bookDescription];
}

id objc_msgSend_bookHighWaterMarkProgress(void *a1, const char *a2, ...)
{
  return _[a1 bookHighWaterMarkProgress];
}

id objc_msgSend_bookSampleDownloadURL(void *a1, const char *a2, ...)
{
  return _[a1 bookSampleDownloadURL];
}

id objc_msgSend_booksToDelete(void *a1, const char *a2, ...)
{
  return _[a1 booksToDelete];
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return [a1 BOOLForKey:];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bu_arrayByRemovingNSNulls(void *a1, const char *a2, ...)
{
  return [a1 bu_arrayByRemovingNSNulls];
}

id objc_msgSend_bu_arrayByRemovingNSNullsInvokingBlockForNulls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bu_arrayByRemovingNSNullsInvokingBlockForNulls:");
}

id objc_msgSend_bu_dictionaryUsingPropertyAsKey_(void *a1, const char *a2, ...)
{
  return [a1 bu_dictionaryUsingPropertyAsKey:];
}

id objc_msgSend_bu_errorWithDomain_code_description_underlyingError_(void *a1, const char *a2, ...)
{
  return [a1 bu_errorWithDomain:code:description:underlyingError:];
}

id objc_msgSend_bu_prettyDescription(void *a1, const char *a2, ...)
{
  return [a1 bu_prettyDescription];
}

id objc_msgSend_bu_reversedArray(void *a1, const char *a2, ...)
{
  return [a1 bu_reversedArray];
}

id objc_msgSend_buildRootFolderShorthandMapCompletion_(void *a1, const char *a2, ...)
{
  return [a1 buildRootFolderShorthandMapCompletion:];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return [a1 bundleForClass];
}

id objc_msgSend_bytesDownloaded(void *a1, const char *a2, ...)
{
  return _[a1 bytesDownloaded];
}

id objc_msgSend_cacheURL(void *a1, const char *a2, ...)
{
  return _[a1 cacheURL];
}

id objc_msgSend_canDeleteCollection(void *a1, const char *a2, ...)
{
  return _[a1 canDeleteCollection];
}

id objc_msgSend_canDeleteFromAllDevices(void *a1, const char *a2, ...)
{
  return _[a1 canDeleteFromAllDevices];
}

id objc_msgSend_canImportURL_openInPlace_options_(void *a1, const char *a2, ...)
{
  return [a1 canImportURL:openInPlace:options:];
}

id objc_msgSend_canMakeAssetsLocal(void *a1, const char *a2, ...)
{
  return _[a1 canMakeAssetsLocal];
}

id objc_msgSend_canPause(void *a1, const char *a2, ...)
{
  return _[a1 canPause];
}

id objc_msgSend_canRedownload(void *a1, const char *a2, ...)
{
  return _[a1 canRedownload];
}

id objc_msgSend_canRedownloadAssets(void *a1, const char *a2, ...)
{
  return _[a1 canRedownloadAssets];
}

id objc_msgSend_canRemoveFromCollection(void *a1, const char *a2, ...)
{
  return _[a1 canRemoveFromCollection];
}

id objc_msgSend_canRestart(void *a1, const char *a2, ...)
{
  return _[a1 canRestart];
}

id objc_msgSend_canResume(void *a1, const char *a2, ...)
{
  return _[a1 canResume];
}

id objc_msgSend_canStart(void *a1, const char *a2, ...)
{
  return _[a1 canStart];
}

id objc_msgSend_cancelAllOperations(void *a1, const char *a2, ...)
{
  return _[a1 cancelAllOperations];
}

id objc_msgSend_cancelDownloadForAssetID_(void *a1, const char *a2, ...)
{
  return [a1 cancelDownloadForAssetID:];
}

id objc_msgSend_changedValues(void *a1, const char *a2, ...)
{
  return _[a1 changedValues];
}

id objc_msgSend_checkForUpdates_(void *a1, const char *a2, ...)
{
  return [a1 checkForUpdates:];
}

id objc_msgSend_checkNonSeriesAudiobooksWithManagedObjectContext_(void *a1, const char *a2, ...)
{
  return [a1 checkNonSeriesAudiobooksWithManagedObjectContext:];
}

id objc_msgSend_checkOwnedSingleBookSeriesWithManagedObjectContext_(void *a1, const char *a2, ...)
{
  return [a1 checkOwnedSingleBookSeriesWithManagedObjectContext:];
}

id objc_msgSend_checkResourceIsReachableAndReturnError_(void *a1, const char *a2, ...)
{
  return [a1 checkResourceIsReachableAndReturnError:];
}

id objc_msgSend_cleanupDateFinished(void *a1, const char *a2, ...)
{
  return _[a1 cleanupDateFinished];
}

id objc_msgSend_cleanupDefaultCollections(void *a1, const char *a2, ...)
{
  return _[a1 cleanupDefaultCollections];
}

id objc_msgSend_clearAgingDocumentInbox(void *a1, const char *a2, ...)
{
  return _[a1 clearAgingDocumentInbox];
}

id objc_msgSend_clearCacheEntryForAssetID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearCacheEntryForAssetID:");
}

id objc_msgSend_clearCacheFiles(void *a1, const char *a2, ...)
{
  return _[a1 clearCacheFiles];
}

id objc_msgSend_clearLastUsedStoreAccountID(void *a1, const char *a2, ...)
{
  return _[a1 clearLastUsedStoreAccountID];
}

id objc_msgSend_clearMaxSortKey(void *a1, const char *a2, ...)
{
  return _[a1 clearMaxSortKey];
}

id objc_msgSend_clearSortKeysFromAssetsInMOCForUpgrade_(void *a1, const char *a2, ...)
{
  return [a1 clearSortKeysFromAssetsInMOCForUpgrade:];
}

id objc_msgSend_cloudAssetDetailManager(void *a1, const char *a2, ...)
{
  return _[a1 cloudAssetDetailManager];
}

id objc_msgSend_cloudAssetType(void *a1, const char *a2, ...)
{
  return _[a1 cloudAssetType];
}

id objc_msgSend_cloudCollectionsManager(void *a1, const char *a2, ...)
{
  return _[a1 cloudCollectionsManager];
}

id objc_msgSend_cloudReadingNowDetailManager(void *a1, const char *a2, ...)
{
  return _[a1 cloudReadingNowDetailManager];
}

id objc_msgSend_cloudSyncVersionsForDataType_inContext_(void *a1, const char *a2, ...)
{
  return [a1 cloudSyncVersionsForDataType:inContext:];
}

id objc_msgSend_cloudVersion(void *a1, const char *a2, ...)
{
  return _[a1 cloudVersion];
}

id objc_msgSend_coalescedDataSourceReloadByIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 coalescedDataSourceReloadByIdentifier];
}

id objc_msgSend_coalescedDataSourceReloadByIdentifierSync(void *a1, const char *a2, ...)
{
  return _[a1 coalescedDataSourceReloadByIdentifierSync];
}

id objc_msgSend_coalescedResetAllCollections(void *a1, const char *a2, ...)
{
  return _[a1 coalescedResetAllCollections];
}

id objc_msgSend_coalescedResetChangedCollections(void *a1, const char *a2, ...)
{
  return _[a1 coalescedResetChangedCollections];
}

id objc_msgSend_coalescedStatusChange(void *a1, const char *a2, ...)
{
  return _[a1 coalescedStatusChange];
}

id objc_msgSend_coalescedZeroing(void *a1, const char *a2, ...)
{
  return _[a1 coalescedZeroing];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_collection(void *a1, const char *a2, ...)
{
  return _[a1 collection];
}

id objc_msgSend_collectionController(void *a1, const char *a2, ...)
{
  return _[a1 collectionController];
}

id objc_msgSend_collectionDescription(void *a1, const char *a2, ...)
{
  return _[a1 collectionDescription];
}

id objc_msgSend_collectionDetailManager(void *a1, const char *a2, ...)
{
  return _[a1 collectionDetailManager];
}

id objc_msgSend_collectionDetailRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 collectionDetailRepresentation];
}

id objc_msgSend_collectionID(void *a1, const char *a2, ...)
{
  return _[a1 collectionID];
}

id objc_msgSend_collectionIDFromCollectionMemberID_(void *a1, const char *a2, ...)
{
  return [a1 collectionIDFromCollectionMemberID:];
}

id objc_msgSend_collectionId(void *a1, const char *a2, ...)
{
  return _[a1 collectionId];
}

id objc_msgSend_collectionManager(void *a1, const char *a2, ...)
{
  return _[a1 collectionManager];
}

id objc_msgSend_collectionManagerDidModifyWantToReadCollection_(void *a1, const char *a2, ...)
{
  return [a1 collectionManagerDidModifyWantToReadCollection:];
}

id objc_msgSend_collectionMemberDictionariesWithAssetIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionMemberDictionariesWithAssetIDs:");
}

id objc_msgSend_collectionMemberDictionaryWithLibraryAsset_sortKey_(void *a1, const char *a2, ...)
{
  return [a1 collectionMemberDictionaryWithLibraryAsset:sortKey:];
}

id objc_msgSend_collectionMemberID(void *a1, const char *a2, ...)
{
  return _[a1 collectionMemberID];
}

id objc_msgSend_collectionMemberIDWithCollectionID_assetID_(void *a1, const char *a2, ...)
{
  return [a1 collectionMemberIDWithCollectionID:assetID:];
}

id objc_msgSend_collectionMemberManager(void *a1, const char *a2, ...)
{
  return _[a1 collectionMemberManager];
}

id objc_msgSend_collectionMemberRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 collectionMemberRepresentation];
}

id objc_msgSend_collectionMembers(void *a1, const char *a2, ...)
{
  return _[a1 collectionMembers];
}

id objc_msgSend_collectionOnMainQueueWithCollectionID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionOnMainQueueWithCollectionID:error:");
}

id objc_msgSend_collectionProvider(void *a1, const char *a2, ...)
{
  return _[a1 collectionProvider];
}

id objc_msgSend_collectionWithCollectionID_inManagedObjectContext_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionWithCollectionID:inManagedObjectContext:error:");
}

id objc_msgSend_collectionsWithCollectionIDs_inManagedObjectContext_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionsWithCollectionIDs:inManagedObjectContext:error:");
}

id objc_msgSend_collectionsWorkerChildContext(void *a1, const char *a2, ...)
{
  return _[a1 collectionsWorkerChildContext];
}

id objc_msgSend_combinedState(void *a1, const char *a2, ...)
{
  return _[a1 combinedState];
}

id objc_msgSend_comments(void *a1, const char *a2, ...)
{
  return _[a1 comments];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return [a1 compare:];
}

id objc_msgSend_completionHandlers(void *a1, const char *a2, ...)
{
  return _[a1 completionHandlers];
}

id objc_msgSend_completionQueue(void *a1, const char *a2, ...)
{
  return _[a1 completionQueue];
}

id objc_msgSend_component_fromDate_(void *a1, const char *a2, ...)
{
  return [a1 component:fromDate:];
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return [a1 componentsJoinedByString:];
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return [a1 componentsSeparatedByString:];
}

id objc_msgSend_computeCounts(void *a1, const char *a2, ...)
{
  return _[a1 computeCounts];
}

id objc_msgSend_configs(void *a1, const char *a2, ...)
{
  return _[a1 configs];
}

id objc_msgSend_configureFromAssetDetail_(void *a1, const char *a2, ...)
{
  return [a1 configureFromAssetDetail:];
}

id objc_msgSend_configureFromBackupSummary_(void *a1, const char *a2, ...)
{
  return [a1 configureFromBackupSummary:];
}

id objc_msgSend_configureFromCollectionDetail_shouldCompareModificationDate_(void *a1, const char *a2, ...)
{
  return [a1 configureFromCollectionDetail:shouldCompareModificationDate:];
}

id objc_msgSend_configureFromCollectionMember_(void *a1, const char *a2, ...)
{
  return [a1 configureFromCollectionMember:];
}

id objc_msgSend_configureFromDictionary_(void *a1, const char *a2, ...)
{
  return [a1 configureFromDictionary:];
}

id objc_msgSend_configureFromReadingNowDetail_(void *a1, const char *a2, ...)
{
  return [a1 configureFromReadingNowDetail:];
}

id objc_msgSend_consumeUpdates_inManagedObjectContext_(void *a1, const char *a2, ...)
{
  return [a1 consumeUpdates:inManagedObjectContext:];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return [a1 containsObject:];
}

id objc_msgSend_contentPredicateForSeriesID_onlyPurchased_forceCloud_allowsExplicit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentPredicateForSeriesID:onlyPurchased:forceCloud:allowsExplicit:");
}

id objc_msgSend_contentType(void *a1, const char *a2, ...)
{
  return _[a1 contentType];
}

id objc_msgSend_contentTypesForDefaultCollectionWithID_(void *a1, const char *a2, ...)
{
  return [a1 contentTypesForDefaultCollectionWithID];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return _[a1 context];
}

id objc_msgSend_coordinateReadingItemAtURL_options_error_byAccessor_(void *a1, const char *a2, ...)
{
  return [a1 coordinateReadingItemAtURL:options:error:byAccessor:];
}

id objc_msgSend_coordinateWritingItemAtURL_options_error_byAccessor_(void *a1, const char *a2, ...)
{
  return [a1 coordinateWritingItemAtURL:options:error:byAccessor:];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyEntityPropertiesArray_fromEntityName_withPredicate_sortBy_ascending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyEntityPropertiesArray:fromEntityName:withPredicate:sortBy:ascending:");
}

id objc_msgSend_copyItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return [a1 copyItemAtPath:toPath:error:];
}

id objc_msgSend_copyNextCollectionSortKey_(void *a1, const char *a2, ...)
{
  return [a1 copyNextCollectionSortKey:];
}

id objc_msgSend_copyToURL_error_(void *a1, const char *a2, ...)
{
  return [a1 copyToURL:error:];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return [a1 countByEnumeratingWithState:objects:count:];
}

id objc_msgSend_countForActionItem_(void *a1, const char *a2, ...)
{
  return [a1 countForActionItem:];
}

id objc_msgSend_countForFetchRequest_error_(void *a1, const char *a2, ...)
{
  return [a1 countForFetchRequest:error:];
}

id objc_msgSend_countTotalFileSize_totalFileCount_(void *a1, const char *a2, ...)
{
  return [a1 countTotalFileSize:totalFileCount:];
}

id objc_msgSend_coverAspectRatio(void *a1, const char *a2, ...)
{
  return _[a1 coverAspectRatio];
}

id objc_msgSend_coverEffectRTLOverride(void *a1, const char *a2, ...)
{
  return _[a1 coverEffectRTLOverride];
}

id objc_msgSend_coverEffectsContent(void *a1, const char *a2, ...)
{
  return _[a1 coverEffectsContent];
}

id objc_msgSend_coverEffectsNightMode(void *a1, const char *a2, ...)
{
  return _[a1 coverEffectsNightMode];
}

id objc_msgSend_coverSourceRank(void *a1, const char *a2, ...)
{
  return _[a1 coverSourceRank];
}

id objc_msgSend_coverWritingMode(void *a1, const char *a2, ...)
{
  return _[a1 coverWritingMode];
}

id objc_msgSend_coverWritingModeLanguageAndPageProgressionDirectionFromAssetID_(void *a1, const char *a2, ...)
{
  return [a1 coverWritingModeLanguageAndPageProgressionDirectionFromAssetID];
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return [a1 createDirectoryAtPath:withIntermediateDirectories:attributes:error:];
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return [a1 createDirectoryAtURL:withIntermediateDirectories:attributes:error:];
}

id objc_msgSend_createSeriesContainers(void *a1, const char *a2, ...)
{
  return _[a1 createSeriesContainers];
}

id objc_msgSend_createSeriesUpdaterMoc(void *a1, const char *a2, ...)
{
  return _[a1 createSeriesUpdaterMoc];
}

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return _[a1 creationDate];
}

id objc_msgSend_currentAssetDetailCloudSyncVersions_(void *a1, const char *a2, ...)
{
  return [a1 currentAssetDetailCloudSyncVersions];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return _[a1 currentCalendar];
}

id objc_msgSend_currentCollectionDetailCloudSyncVersions_(void *a1, const char *a2, ...)
{
  return [a1 currentCollectionDetailCloudSyncVersions];
}

id objc_msgSend_currentCollectionMemberCloudSyncVersions_(void *a1, const char *a2, ...)
{
  return [a1 currentCollectionMemberCloudSyncVersions];
}

id objc_msgSend_currentReachabilityStatus(void *a1, const char *a2, ...)
{
  return _[a1 currentReachabilityStatus];
}

id objc_msgSend_currentReadingNowDetailCloudSyncVersions_(void *a1, const char *a2, ...)
{
  return [a1 currentReadingNowDetailCloudSyncVersions];
}

id objc_msgSend_currentlyDownloading(void *a1, const char *a2, ...)
{
  return _[a1 currentlyDownloading];
}

id objc_msgSend_dataSourceConformingToProtocol_(void *a1, const char *a2, ...)
{
  return [a1 dataSourceConformingToProtocol:];
}

id objc_msgSend_dataSourceIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 dataSourceIdentifier];
}

id objc_msgSend_dataSourceInsertionDate(void *a1, const char *a2, ...)
{
  return _[a1 dataSourceInsertionDate];
}

id objc_msgSend_dataSourceWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 dataSourceWithIdentifier:];
}

id objc_msgSend_dataSources(void *a1, const char *a2, ...)
{
  return _[a1 dataSources];
}

id objc_msgSend_dataSourcesBitmask(void *a1, const char *a2, ...)
{
  return _[a1 dataSourcesBitmask];
}

id objc_msgSend_dataSourcesByIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 dataSourcesByIdentifier];
}

id objc_msgSend_dataSourcesConformingToProtocol_(void *a1, const char *a2, ...)
{
  return [a1 dataSourcesConformingToProtocol:];
}

id objc_msgSend_dataType(void *a1, const char *a2, ...)
{
  return _[a1 dataType];
}

id objc_msgSend_dataWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return [a1 dataWithContentsOfURL:];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateFinished(void *a1, const char *a2, ...)
{
  return _[a1 dateFinished];
}

id objc_msgSend_dateFromComponents_(void *a1, const char *a2, ...)
{
  return [a1 dateFromComponents:];
}

id objc_msgSend_dateWithTimeIntervalSince1970_(void *a1, const char *a2, ...)
{
  return [a1 dateWithTimeIntervalSince1970:];
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return [a1 dateWithTimeIntervalSinceNow:];
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return [a1 dateWithTimeIntervalSinceReferenceDate:];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return _[a1 debugDescription];
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeObjectOfClass:forKey:];
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeObjectOfClasses:forKey:];
}

id objc_msgSend_defaultAllBooksCollection(void *a1, const char *a2, ...)
{
  return _[a1 defaultAllBooksCollection];
}

id objc_msgSend_defaultAudioBooksCollection(void *a1, const char *a2, ...)
{
  return _[a1 defaultAudioBooksCollection];
}

id objc_msgSend_defaultBag(void *a1, const char *a2, ...)
{
  return _[a1 defaultBag];
}

id objc_msgSend_defaultBookLibrary(void *a1, const char *a2, ...)
{
  return _[a1 defaultBookLibrary];
}

id objc_msgSend_defaultBooksCollection(void *a1, const char *a2, ...)
{
  return _[a1 defaultBooksCollection];
}

id objc_msgSend_defaultCacheManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultCacheManager];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultCollections(void *a1, const char *a2, ...)
{
  return _[a1 defaultCollections];
}

id objc_msgSend_defaultContainer(void *a1, const char *a2, ...)
{
  return _[a1 defaultContainer];
}

id objc_msgSend_defaultDownloadedCollection(void *a1, const char *a2, ...)
{
  return _[a1 defaultDownloadedCollection];
}

id objc_msgSend_defaultFinishedCollection(void *a1, const char *a2, ...)
{
  return _[a1 defaultFinishedCollection];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultPDFsCollection(void *a1, const char *a2, ...)
{
  return _[a1 defaultPDFsCollection];
}

id objc_msgSend_defaultSamplesCollection(void *a1, const char *a2, ...)
{
  return _[a1 defaultSamplesCollection];
}

id objc_msgSend_defaultSortModeForCollectionID_(void *a1, const char *a2, ...)
{
  return [a1 defaultSortModeForCollectionID:];
}

id objc_msgSend_defaultViewModeForCollectionID_(void *a1, const char *a2, ...)
{
  return [a1 defaultViewModeForCollectionID:];
}

id objc_msgSend_defaultWantToReadCollection(void *a1, const char *a2, ...)
{
  return _[a1 defaultWantToReadCollection];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_deleteAssets_exhaustive_(void *a1, const char *a2, ...)
{
  return [a1 deleteAssets:exhaustive:];
}

id objc_msgSend_deleteAssets_exhaustive_completion_(void *a1, const char *a2, ...)
{
  return [a1 deleteAssets:exhaustive:completion:];
}

id objc_msgSend_deleteCollectionDetailForCollectionIDs_completion_(void *a1, const char *a2, ...)
{
  return [a1 deleteCollectionDetailForCollectionIDs:completion:];
}

id objc_msgSend_deleteCollectionMemberForCollectionMemberIDs_completion_(void *a1, const char *a2, ...)
{
  return [a1 deleteCollectionMemberForCollectionMemberIDs:completion:];
}

id objc_msgSend_deleteCollectionWithCollectionID_inManagedObjectContext_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteCollectionWithCollectionID:inManagedObjectContext:error:");
}

id objc_msgSend_deleteObject_(void *a1, const char *a2, ...)
{
  return [a1 deleteObject:];
}

id objc_msgSend_deleteRemovesFromCollection(void *a1, const char *a2, ...)
{
  return _[a1 deleteRemovesFromCollection];
}

id objc_msgSend_deletedFlag(void *a1, const char *a2, ...)
{
  return _[a1 deletedFlag];
}

id objc_msgSend_deletedObjects(void *a1, const char *a2, ...)
{
  return _[a1 deletedObjects];
}

id objc_msgSend_describedImageWithIdentifier_size_processingOptions_(void *a1, const char *a2, ...)
{
  return [a1 describedImageWithIdentifier:size:processingOptions:];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_desktopSupportLevel(void *a1, const char *a2, ...)
{
  return _[a1 desktopSupportLevel];
}

id objc_msgSend_destinationFilePath(void *a1, const char *a2, ...)
{
  return _[a1 destinationFilePath];
}

id objc_msgSend_destroyPersistentStoreAtURL_withType_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "destroyPersistentStoreAtURL:withType:options:error:");
}

id objc_msgSend_details(void *a1, const char *a2, ...)
{
  return _[a1 details];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithCapacity:];
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithContentsOfFile:];
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithDictionary:];
}

id objc_msgSend_dictionaryWithObjects_forKeys_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_dictionaryWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjectsAndKeys:];
}

id objc_msgSend_dictionaryWithValuesForKeys_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithValuesForKeys:];
}

id objc_msgSend_didChangeValueForKey_(void *a1, const char *a2, ...)
{
  return [a1 didChangeValueForKey:];
}

id objc_msgSend_didMigrateBooksCollection_(void *a1, const char *a2, ...)
{
  return [a1 didMigrateBooksCollection:];
}

id objc_msgSend_disableUpdates(void *a1, const char *a2, ...)
{
  return _[a1 disableUpdates];
}

id objc_msgSend_dispatchQueue(void *a1, const char *a2, ...)
{
  return _[a1 dispatchQueue];
}

id objc_msgSend_displayAuthor(void *a1, const char *a2, ...)
{
  return _[a1 displayAuthor];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return _[a1 distantPast];
}

id objc_msgSend_documentsURL(void *a1, const char *a2, ...)
{
  return _[a1 documentsURL];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_downloadRelatedNotificationCoalescingBlock(void *a1, const char *a2, ...)
{
  return _[a1 downloadRelatedNotificationCoalescingBlock];
}

id objc_msgSend_downloadedDSID(void *a1, const char *a2, ...)
{
  return _[a1 downloadedDSID];
}

id objc_msgSend_downloadingCount(void *a1, const char *a2, ...)
{
  return _[a1 downloadingCount];
}

id objc_msgSend_dqSyncQueue(void *a1, const char *a2, ...)
{
  return _[a1 dqSyncQueue];
}

id objc_msgSend_dq_assetsToReconcile(void *a1, const char *a2, ...)
{
  return [a1 dq_assetsToReconcile];
}

id objc_msgSend_dq_filesSizeForCacheItemRequest_(void *a1, const char *a2, ...)
{
  return [a1 dq_filesSizeForCacheItemRequest:];
}

id objc_msgSend_dq_libraryDataSource_reconcileAssets_reason_(void *a1, const char *a2, ...)
{
  return [a1 dq_libraryDataSource:reconcileAssets:reason:];
}

id objc_msgSend_dq_persistInfoToDisk(void *a1, const char *a2, ...)
{
  return [a1 dq_persistInfoToDisk];
}

id objc_msgSend_dq_sync_(void *a1, const char *a2, ...)
{
  return [a1 dq_sync:];
}

id objc_msgSend_dq_unclaimIdentifiers_forDataSourceBitmask_(void *a1, const char *a2, ...)
{
  return [a1 dq_unclaimIdentifiers:forDataSourceBitmask:];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return _[a1 duration];
}

id objc_msgSend_earlierDate_(void *a1, const char *a2, ...)
{
  return [a1 earlierDate:];
}

id objc_msgSend_eligibleBooksProvider(void *a1, const char *a2, ...)
{
  return _[a1 eligibleBooksProvider];
}

id objc_msgSend_enableCloudMerge(void *a1, const char *a2, ...)
{
  return _[a1 enableCloudMerge];
}

id objc_msgSend_enableCloudMergeQueue(void *a1, const char *a2, ...)
{
  return _[a1 enableCloudMergeQueue];
}

id objc_msgSend_enableUpdates(void *a1, const char *a2, ...)
{
  return _[a1 enableUpdates];
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeObject:forKey:];
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return _[a1 encodedData];
}

id objc_msgSend_entityForName_inManagedObjectContext_(void *a1, const char *a2, ...)
{
  return [a1 entityForName:inManagedObjectContext:];
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateKeysAndObjectsUsingBlock:];
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateObjectsUsingBlock:];
}

id objc_msgSend_enumerateObjectsWithOptions_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsWithOptions:usingBlock:");
}

id objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(void *a1, const char *a2, ...)
{
  return [a1 enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:];
}

id objc_msgSend_ephemeralAssetsRedundant_(void *a1, const char *a2, ...)
{
  return [a1 ephemeralAssetsRedundant];
}

id objc_msgSend_ephemeralSamplesPredicate(void *a1, const char *a2, ...)
{
  return _[a1 ephemeralSamplesPredicate];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return _[a1 error];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 errorWithDomain:code:userInfo:];
}

id objc_msgSend_evaluateWithObject_(void *a1, const char *a2, ...)
{
  return [a1 evaluateWithObject:];
}

id objc_msgSend_examineURL_completion_(void *a1, const char *a2, ...)
{
  return [a1 examineURL:completion:];
}

id objc_msgSend_excludeAudiobooksPredicate(void *a1, const char *a2, ...)
{
  return _[a1 excludeAudiobooksPredicate];
}

id objc_msgSend_excludeEphemeralAssetsPredicate(void *a1, const char *a2, ...)
{
  return _[a1 excludeEphemeralAssetsPredicate];
}

id objc_msgSend_excludeHiddenAssetsPredicate(void *a1, const char *a2, ...)
{
  return _[a1 excludeHiddenAssetsPredicate];
}

id objc_msgSend_executeFetchRequest_error_(void *a1, const char *a2, ...)
{
  return [a1 executeFetchRequest:error:];
}

id objc_msgSend_executeRequest_error_(void *a1, const char *a2, ...)
{
  return [a1 executeRequest:error:];
}

id objc_msgSend_executeWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 executeWithCompletion:];
}

id objc_msgSend_expectedDate(void *a1, const char *a2, ...)
{
  return _[a1 expectedDate];
}

id objc_msgSend_expirationDate(void *a1, const char *a2, ...)
{
  return _[a1 expirationDate];
}

id objc_msgSend_familyID(void *a1, const char *a2, ...)
{
  return _[a1 familyID];
}

id objc_msgSend_fetchAllLocalBooksEligibleToBeMadeUbiquitousWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAllLocalBooksEligibleToBeMadeUbiquitousWithCompletion:");
}

id objc_msgSend_fetchAssetIDsWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAssetIDsWithCompletion:");
}

id objc_msgSend_fetchAssetsWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 fetchAssetsWithCompletion:];
}

id objc_msgSend_fetchAssetsWithIDs_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAssetsWithIDs:completion:");
}

id objc_msgSend_fetchCGImageFor_forRequest_completion_(void *a1, const char *a2, ...)
{
  return [a1 fetchCGImageFor:forRequest:completion:];
}

id objc_msgSend_fetchDefaultBooksCollectionInUIMoc_(void *a1, const char *a2, ...)
{
  return [a1 fetchDefaultBooksCollectionInUIMoc:];
}

id objc_msgSend_fetchImageForAsset_size_includeSpine_coverEffectsEnvironment_(void *a1, const char *a2, ...)
{
  return [a1 fetchImageForAsset:size:includeSpine:coverEffectsEnvironment:];
}

id objc_msgSend_fetchImageForAsset_size_includeSpine_includeShadow_coverEffectsEnvironment_completion_(void *a1, const char *a2, ...)
{
  return [a1 fetchImageForAsset:size:includeSpine:includeShadow:coverEffectsEnvironment:completion:];
}

id objc_msgSend_fetchImageShadowForAsset_size_completion_(void *a1, const char *a2, ...)
{
  return [a1 fetchImageShadowForAsset:size:completion:];
}

id objc_msgSend_fetchLibraryAssetsFromAssetIDs_handler_(void *a1, const char *a2, ...)
{
  return [a1 fetchLibraryAssetsFromAssetIDs:handler:];
}

id objc_msgSend_fetchMigratedProperties_deleteFoundAssets_(void *a1, const char *a2, ...)
{
  return [a1 fetchMigratedProperties:deleteFoundAssets:];
}

id objc_msgSend_fetchMixedAssetsWithBookIds_audiobookIds_relationships_views_additionalParameters_batchSize_metadata_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchMixedAssetsWithBookIds:audiobookIds:relationships:views:additionalParameters:batchSize:metadata:completionHandler:");
}

id objc_msgSend_fetchPriceForAssetID_completion_(void *a1, const char *a2, ...)
{
  return [a1 fetchPriceForAssetID:completion:];
}

id objc_msgSend_fetchRequestForRecentlyEngaged(void *a1, const char *a2, ...)
{
  return _[a1 fetchRequestForRecentlyEngaged];
}

id objc_msgSend_fetchRequestWithEntityName_(void *a1, const char *a2, ...)
{
  return [a1 fetchRequestWithEntityName:];
}

id objc_msgSend_fetchUserQuotaWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 fetchUserQuotaWithCompletion:];
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return [a1 fileExistsAtPath:];
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return [a1 fileExistsAtPath:isDirectory:];
}

id objc_msgSend_fileModificationDate(void *a1, const char *a2, ...)
{
  return _[a1 fileModificationDate];
}

id objc_msgSend_fileOnDiskLastTouchDate(void *a1, const char *a2, ...)
{
  return _[a1 fileOnDiskLastTouchDate];
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return _[a1 fileSize];
}

id objc_msgSend_fileSizeNumber(void *a1, const char *a2, ...)
{
  return _[a1 fileSizeNumber];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 fileSystemRepresentation];
}

id objc_msgSend_fileURL(void *a1, const char *a2, ...)
{
  return _[a1 fileURL];
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return [a1 fileURLWithPath:];
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return [a1 fileURLWithPath:isDirectory:];
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return [a1 filteredArrayUsingPredicate:];
}

id objc_msgSend_filteredSetUsingPredicate_(void *a1, const char *a2, ...)
{
  return [a1 filteredSetUsingPredicate:];
}

id objc_msgSend_finalizeAuthentication_(void *a1, const char *a2, ...)
{
  return [a1 finalizeAuthentication:];
}

id objc_msgSend_finishEncoding(void *a1, const char *a2, ...)
{
  return _[a1 finishEncoding];
}

id objc_msgSend_finishedDateKind(void *a1, const char *a2, ...)
{
  return _[a1 finishedDateKind];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_fixCollectionMemberAssetLinks(void *a1, const char *a2, ...)
{
  return _[a1 fixCollectionMemberAssetLinks];
}

id objc_msgSend_fixFilePermissions(void *a1, const char *a2, ...)
{
  return _[a1 fixFilePermissions];
}

id objc_msgSend_fixPDFCollectionIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 fixPDFCollectionIfNeeded];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_forceToTop(void *a1, const char *a2, ...)
{
  return _[a1 forceToTop];
}

id objc_msgSend_forcedFileProtection(void *a1, const char *a2, ...)
{
  return _[a1 forcedFileProtection];
}

id objc_msgSend_foundText(void *a1, const char *a2, ...)
{
  return _[a1 foundText];
}

id objc_msgSend_gatherChangedAssetsCollectionsWithLibraryMoc_(void *a1, const char *a2, ...)
{
  return [a1 gatherChangedAssetsCollectionsWithLibraryMoc:];
}

id objc_msgSend_generation(void *a1, const char *a2, ...)
{
  return _[a1 generation];
}

id objc_msgSend_generationCount(void *a1, const char *a2, ...)
{
  return _[a1 generationCount];
}

id objc_msgSend_generationFetched(void *a1, const char *a2, ...)
{
  return _[a1 generationFetched];
}

id objc_msgSend_genre(void *a1, const char *a2, ...)
{
  return _[a1 genre];
}

id objc_msgSend_genres(void *a1, const char *a2, ...)
{
  return _[a1 genres];
}

id objc_msgSend_getAssetDetailChangesSince_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getAssetDetailChangesSince:completion:");
}

id objc_msgSend_getChangesQueue(void *a1, const char *a2, ...)
{
  return _[a1 getChangesQueue];
}

id objc_msgSend_getCollectionDetailChangesSince_completion_(void *a1, const char *a2, ...)
{
  return [a1 getCollectionDetailChangesSince:completion:];
}

id objc_msgSend_getCollectionMemberChangesSince_completion_(void *a1, const char *a2, ...)
{
  return [a1 getCollectionMemberChangesSince:completion:];
}

id objc_msgSend_getQuotaInfoForPrimaryAccountCompletion_(void *a1, const char *a2, ...)
{
  return [a1 getQuotaInfoForPrimaryAccountCompletion:];
}

id objc_msgSend_getReadingNowDetailChangesSince_completion_(void *a1, const char *a2, ...)
{
  return [a1 getReadingNowDetailChangesSince:completion:];
}

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return [a1 getResourceValue:forKey:error:];
}

id objc_msgSend_ghostBookCount(void *a1, const char *a2, ...)
{
  return _[a1 ghostBookCount];
}

id objc_msgSend_grouping(void *a1, const char *a2, ...)
{
  return _[a1 grouping];
}

id objc_msgSend_hasChanges(void *a1, const char *a2, ...)
{
  return _[a1 hasChanges];
}

id objc_msgSend_hasCheckedOwnedSingleBookSeriesAndNonSeriesAudiobooks(void *a1, const char *a2, ...)
{
  return _[a1 hasCheckedOwnedSingleBookSeriesAndNonSeriesAudiobooks];
}

id objc_msgSend_hasFinished(void *a1, const char *a2, ...)
{
  return _[a1 hasFinished];
}

id objc_msgSend_hasImportantAssetDetails(void *a1, const char *a2, ...)
{
  return _[a1 hasImportantAssetDetails];
}

id objc_msgSend_hasImportantReadingNowDetails(void *a1, const char *a2, ...)
{
  return _[a1 hasImportantReadingNowDetails];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return [a1 hasPrefix:];
}

id objc_msgSend_hasRACSupport(void *a1, const char *a2, ...)
{
  return _[a1 hasRACSupport];
}

id objc_msgSend_hasSpecifiedFinishedDate(void *a1, const char *a2, ...)
{
  return _[a1 hasSpecifiedFinishedDate];
}

id objc_msgSend_hasStoreInCommonWith_(void *a1, const char *a2, ...)
{
  return [a1 hasStoreInCommonWith:];
}

id objc_msgSend_hasTooManyAuthors(void *a1, const char *a2, ...)
{
  return _[a1 hasTooManyAuthors];
}

id objc_msgSend_hasTooManyNarrators(void *a1, const char *a2, ...)
{
  return _[a1 hasTooManyNarrators];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_hidden(void *a1, const char *a2, ...)
{
  return _[a1 hidden];
}

id objc_msgSend_hiddenAssetStoreIDsWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hiddenAssetStoreIDsWithCompletion:");
}

id objc_msgSend_historyToken(void *a1, const char *a2, ...)
{
  return _[a1 historyToken];
}

id objc_msgSend_historyTokenOffset(void *a1, const char *a2, ...)
{
  return _[a1 historyTokenOffset];
}

id objc_msgSend_iTunesU(void *a1, const char *a2, ...)
{
  return _[a1 iTunesU];
}

id objc_msgSend_iTunesUCount(void *a1, const char *a2, ...)
{
  return _[a1 iTunesUCount];
}

id objc_msgSend_id(void *a1, const char *a2, ...)
{
  return _[a1 id];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_identifierForMyBooksCollection(void *a1, const char *a2, ...)
{
  return _[a1 identifierForMyBooksCollection];
}

id objc_msgSend_identifierWithAssetID_(void *a1, const char *a2, ...)
{
  return [a1 identifierWithAssetID:];
}

id objc_msgSend_identifierWithTemporaryAssetID_(void *a1, const char *a2, ...)
{
  return [a1 identifierWithTemporaryAssetID:];
}

id objc_msgSend_identifiersForAssetsNeedingReconcile(void *a1, const char *a2, ...)
{
  return _[a1 identifiersForAssetsNeedingReconcile];
}

id objc_msgSend_im_imageWithCGImage_(void *a1, const char *a2, ...)
{
  return [a1 im_imageWithCGImage:];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return _[a1 image];
}

id objc_msgSend_imageSource(void *a1, const char *a2, ...)
{
  return _[a1 imageSource];
}

id objc_msgSend_importURL_openInPlace_options_completion_(void *a1, const char *a2, ...)
{
  return [a1 importURL:openInPlace:options:completion:];
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return [a1 indexOfObject:];
}

id objc_msgSend_indexOfObjectIdenticalTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObjectIdenticalTo:");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _[a1 init];
}

id objc_msgSend_initForReadingFromData_error_(void *a1, const char *a2, ...)
{
  return [a1 initForReadingFromData:error:];
}

id objc_msgSend_initRequiringSecureCoding_(void *a1, const char *a2, ...)
{
  return [a1 initRequiringSecureCoding:];
}

id objc_msgSend_initWithAsset_(void *a1, const char *a2, ...)
{
  return [a1 initWithAsset:];
}

id objc_msgSend_initWithAsset_dataSource_dataSourceBitmask_(void *a1, const char *a2, ...)
{
  return [a1 initWithAsset:dataSource:dataSourceBitmask:];
}

id objc_msgSend_initWithAssetID_(void *a1, const char *a2, ...)
{
  return [a1 initWithAssetID:];
}

id objc_msgSend_initWithAssetID_assetContentType_collectionTitle_(void *a1, const char *a2, ...)
{
  return [a1 initWithAssetID:assetContentType:collectionTitle:];
}

id objc_msgSend_initWithAssetID_identifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithAssetID:identifier:];
}

id objc_msgSend_initWithAssetID_notify_(void *a1, const char *a2, ...)
{
  return [a1 initWithAssetID:notify:];
}

id objc_msgSend_initWithAssetID_productProfile_identifier_date_(void *a1, const char *a2, ...)
{
  return [a1 initWithAssetID:productProfile:identifier:date:];
}

id objc_msgSend_initWithAssetID_progressValue_(void *a1, const char *a2, ...)
{
  return [a1 initWithAssetID:progressValue:];
}

id objc_msgSend_initWithAssetID_state_progressValue_timeRemaining_bytesDownloaded_fileSize_(void *a1, const char *a2, ...)
{
  return [a1 initWithAssetID:state:progressValue:timeRemaining:bytesDownloaded:fileSize:];
}

id objc_msgSend_initWithAssetID_state_supplementalContentState_progressValue_timeRemaining_bytesDownloaded_fileSize_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAssetID:state:supplementalContentState:progressValue:timeRemaining:bytesDownloaded:fileSize:error:");
}

id objc_msgSend_initWithBase64EncodedString_options_(void *a1, const char *a2, ...)
{
  return [a1 initWithBase64EncodedString:options:];
}

id objc_msgSend_initWithCacheItemRequestWithAssetID_assetURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithCacheItemRequestWithAssetID:assetURL:];
}

id objc_msgSend_initWithCalendarIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithCalendarIdentifier:];
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 initWithCapacity:];
}

id objc_msgSend_initWithCollectionID_(void *a1, const char *a2, ...)
{
  return [a1 initWithCollectionID:];
}

id objc_msgSend_initWithCollectionMemberID_(void *a1, const char *a2, ...)
{
  return [a1 initWithCollectionMemberID];
}

id objc_msgSend_initWithConcurrencyType_(void *a1, const char *a2, ...)
{
  return [a1 initWithConcurrencyType:];
}

id objc_msgSend_initWithContent_(void *a1, const char *a2, ...)
{
  return [a1 initWithContent:];
}

id objc_msgSend_initWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithContentsOfURL:];
}

id objc_msgSend_initWithContext_coordinator_entityName_predicate_mapProperty_propertiesOfInterest_observer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContext:coordinator:entityName:predicate:mapProperty:propertiesOfInterest:observer:");
}

id objc_msgSend_initWithContextProvider_(void *a1, const char *a2, ...)
{
  return [a1 initWithContextProvider:];
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:encoding:];
}

id objc_msgSend_initWithEntityName_(void *a1, const char *a2, ...)
{
  return [a1 initWithEntityName:];
}

id objc_msgSend_initWithFetchRequest_(void *a1, const char *a2, ...)
{
  return [a1 initWithFetchRequest:];
}

id objc_msgSend_initWithFileID_line_(void *a1, const char *a2, ...)
{
  return [a1 initWithFileID:line:];
}

id objc_msgSend_initWithFilter_notify_(void *a1, const char *a2, ...)
{
  return [a1 initWithFilter:notify:];
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 initWithFormat:];
}

id objc_msgSend_initWithKey_ascending_(void *a1, const char *a2, ...)
{
  return [a1 initWithKey:ascending:];
}

id objc_msgSend_initWithKey_ascending_selector_(void *a1, const char *a2, ...)
{
  return [a1 initWithKey:ascending:selector:];
}

id objc_msgSend_initWithLibrary_(void *a1, const char *a2, ...)
{
  return [a1 initWithLibrary:];
}

id objc_msgSend_initWithLibraryAsset_(void *a1, const char *a2, ...)
{
  return [a1 initWithLibraryAsset:];
}

id objc_msgSend_initWithLibraryManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithLibraryManager:];
}

id objc_msgSend_initWithLibraryManager_bdsPriceTracker_(void *a1, const char *a2, ...)
{
  return [a1 initWithLibraryManager:bdsPriceTracker:];
}

id objc_msgSend_initWithLongLong_(void *a1, const char *a2, ...)
{
  return [a1 initWithLongLong:];
}

id objc_msgSend_initWithManagedObjectModel_(void *a1, const char *a2, ...)
{
  return [a1 initWithManagedObjectModel:];
}

id objc_msgSend_initWithName_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:];
}

id objc_msgSend_initWithNotifyBlock_blockDescription_(void *a1, const char *a2, ...)
{
  return [a1 initWithNotifyBlock:blockDescription:];
}

id objc_msgSend_initWithNotifyBlock_notifyTimeout_blockDescription_notifyTimeoutBlock_(void *a1, const char *a2, ...)
{
  return [a1 initWithNotifyBlock:notifyTimeout:blockDescription:notifyTimeoutBlock:];
}

id objc_msgSend_initWithObjects_forKeys_(void *a1, const char *a2, ...)
{
  return [a1 initWithObjects:forKeys:];
}

id objc_msgSend_initWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return [a1 initWithObjectsAndKeys:];
}

id objc_msgSend_initWithPersistentStoreURL_bdsPriceTracker_(void *a1, const char *a2, ...)
{
  return [a1 initWithPersistentStoreURL:bdsPriceTracker:];
}

id objc_msgSend_initWithPurchasedDSID_downloadedDSID_familyID_(void *a1, const char *a2, ...)
{
  return [a1 initWithPurchasedDSID:downloadedDSID:familyID:];
}

id objc_msgSend_initWithQueryString_attributes_(void *a1, const char *a2, ...)
{
  return [a1 initWithQueryString:attributes:];
}

id objc_msgSend_initWithRelease_(void *a1, const char *a2, ...)
{
  return [a1 initWithRelease:];
}

id objc_msgSend_initWithStoreID_(void *a1, const char *a2, ...)
{
  return [a1 initWithStoreID:];
}

id objc_msgSend_initWithStoreID_collectionID_(void *a1, const char *a2, ...)
{
  return [a1 initWithStoreID:collectionID:];
}

id objc_msgSend_initWithStoreID_collectionID_forceToTop_(void *a1, const char *a2, ...)
{
  return [a1 initWithStoreID:collectionID:forceToTop:];
}

id objc_msgSend_initWithTemporaryAssetID_(void *a1, const char *a2, ...)
{
  return [a1 initWithTemporaryAssetID:];
}

id objc_msgSend_initWithType_storeID_(void *a1, const char *a2, ...)
{
  return [a1 initWithType:storeID:];
}

id objc_msgSend_initWithURL_options_error_(void *a1, const char *a2, ...)
{
  return [a1 initWithURL:options:error:];
}

id objc_msgSend_initWithURLRequest_(void *a1, const char *a2, ...)
{
  return [a1 initWithURLRequest:];
}

id objc_msgSend_initialDataSourceFetchInitiated(void *a1, const char *a2, ...)
{
  return _[a1 initialDataSourceFetchInitiated];
}

id objc_msgSend_insertNewCollectionWithCollectionID_inManagedObjectContext_(void *a1, const char *a2, ...)
{
  return [a1 insertNewCollectionWithCollectionID:];
}

id objc_msgSend_insertNewLibraryAssetWithIdentifier_assetID_orTemporaryAssetID_type_inManagedObjectContext_(void *a1, const char *a2, ...)
{
  return [a1 insertNewLibraryAssetWithIdentifier:assetID:orTemporaryAssetID:type:inManagedObjectContext:];
}

id objc_msgSend_insertNewObjectForEntityForName_inManagedObjectContext_(void *a1, const char *a2, ...)
{
  return [a1 insertNewObjectForEntityForName:inManagedObjectContext:];
}

id objc_msgSend_insertedObjects(void *a1, const char *a2, ...)
{
  return _[a1 insertedObjects];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerForKey_(void *a1, const char *a2, ...)
{
  return [a1 integerForKey:];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_internetReachable(void *a1, const char *a2, ...)
{
  return _[a1 internetReachable];
}

id objc_msgSend_intersectSet_(void *a1, const char *a2, ...)
{
  return [a1 intersectSet:];
}

id objc_msgSend_intersectsSet_(void *a1, const char *a2, ...)
{
  return [a1 intersectsSet:];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invalidate_(void *a1, const char *a2, ...)
{
  return [a1 invalidate:];
}

id objc_msgSend_isAccountModificationAllowed(void *a1, const char *a2, ...)
{
  return _[a1 isAccountModificationAllowed];
}

id objc_msgSend_isAllBooksCollection_(void *a1, const char *a2, ...)
{
  return [a1 isAllBooksCollection:];
}

id objc_msgSend_isAudiobook(void *a1, const char *a2, ...)
{
  return _[a1 isAudiobook];
}

id objc_msgSend_isAudiobookPreview(void *a1, const char *a2, ...)
{
  return _[a1 isAudiobookPreview];
}

id objc_msgSend_isAudiobookTrackContentType_(void *a1, const char *a2, ...)
{
  return [a1 isAudiobookTrackContentType:];
}

id objc_msgSend_isBook(void *a1, const char *a2, ...)
{
  return _[a1 isBook];
}

id objc_msgSend_isCloud(void *a1, const char *a2, ...)
{
  return _[a1 isCloud];
}

id objc_msgSend_isContainer(void *a1, const char *a2, ...)
{
  return _[a1 isContainer];
}

id objc_msgSend_isDefaultCollection(void *a1, const char *a2, ...)
{
  return _[a1 isDefaultCollection];
}

id objc_msgSend_isDefaultCollection_(void *a1, const char *a2, ...)
{
  return [a1 isDefaultCollection:];
}

id objc_msgSend_isDeleted(void *a1, const char *a2, ...)
{
  return _[a1 isDeleted];
}

id objc_msgSend_isDevelopment(void *a1, const char *a2, ...)
{
  return _[a1 isDevelopment];
}

id objc_msgSend_isDownloading(void *a1, const char *a2, ...)
{
  return _[a1 isDownloading];
}

id objc_msgSend_isDownloadingSupplementalContent(void *a1, const char *a2, ...)
{
  return _[a1 isDownloadingSupplementalContent];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isEnabled];
}

id objc_msgSend_isEphemeral(void *a1, const char *a2, ...)
{
  return _[a1 isEphemeral];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return [a1 isEqual:];
}

id objc_msgSend_isEqualToArray_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToArray:];
}

id objc_msgSend_isEqualToDate_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToDate:];
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToNumber:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isExplicit(void *a1, const char *a2, ...)
{
  return _[a1 isExplicit];
}

id objc_msgSend_isExplicitContentAllowed(void *a1, const char *a2, ...)
{
  return _[a1 isExplicitContentAllowed];
}

id objc_msgSend_isExplicitMaterialAllowed(void *a1, const char *a2, ...)
{
  return _[a1 isExplicitMaterialAllowed];
}

id objc_msgSend_isFault(void *a1, const char *a2, ...)
{
  return _[a1 isFault];
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return _[a1 isFileURL];
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return _[a1 isFinished];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return _[a1 isHidden];
}

id objc_msgSend_isImporting(void *a1, const char *a2, ...)
{
  return _[a1 isImporting];
}

id objc_msgSend_isInSamples(void *a1, const char *a2, ...)
{
  return _[a1 isInSamples];
}

id objc_msgSend_isInternalInstall(void *a1, const char *a2, ...)
{
  return _[a1 isInternalInstall];
}

id objc_msgSend_isLocal(void *a1, const char *a2, ...)
{
  return _[a1 isLocal];
}

id objc_msgSend_isLocked(void *a1, const char *a2, ...)
{
  return _[a1 isLocked];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return _[a1 isMainThread];
}

id objc_msgSend_isManagedBook(void *a1, const char *a2, ...)
{
  return _[a1 isManagedBook];
}

id objc_msgSend_isNew(void *a1, const char *a2, ...)
{
  return _[a1 isNew];
}

id objc_msgSend_isNonLocalSample(void *a1, const char *a2, ...)
{
  return _[a1 isNonLocalSample];
}

id objc_msgSend_isOwned(void *a1, const char *a2, ...)
{
  return _[a1 isOwned];
}

id objc_msgSend_isPreorderBook(void *a1, const char *a2, ...)
{
  return _[a1 isPreorderBook];
}

id objc_msgSend_isProof(void *a1, const char *a2, ...)
{
  return _[a1 isProof];
}

id objc_msgSend_isReturningUser(void *a1, const char *a2, ...)
{
  return _[a1 isReturningUser];
}

id objc_msgSend_isRightToLeft(void *a1, const char *a2, ...)
{
  return _[a1 isRightToLeft];
}

id objc_msgSend_isRunningInStoreDemoMode(void *a1, const char *a2, ...)
{
  return _[a1 isRunningInStoreDemoMode];
}

id objc_msgSend_isSample(void *a1, const char *a2, ...)
{
  return _[a1 isSample];
}

id objc_msgSend_isSeriesCollection(void *a1, const char *a2, ...)
{
  return _[a1 isSeriesCollection];
}

id objc_msgSend_isSeriesCollectionID_(void *a1, const char *a2, ...)
{
  return [a1 isSeriesCollectionID:];
}

id objc_msgSend_isSeriesItem(void *a1, const char *a2, ...)
{
  return _[a1 isSeriesItem];
}

id objc_msgSend_isShowPurchasesEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isShowPurchasesEnabled];
}

id objc_msgSend_isStore(void *a1, const char *a2, ...)
{
  return _[a1 isStore];
}

id objc_msgSend_isStoreAllowed(void *a1, const char *a2, ...)
{
  return _[a1 isStoreAllowed];
}

id objc_msgSend_isStoreAudiobook(void *a1, const char *a2, ...)
{
  return _[a1 isStoreAudiobook];
}

id objc_msgSend_isStoreItem(void *a1, const char *a2, ...)
{
  return _[a1 isStoreItem];
}

id objc_msgSend_isSubsetOfSet_(void *a1, const char *a2, ...)
{
  return [a1 isSubsetOfSet:];
}

id objc_msgSend_isSupplementalContent(void *a1, const char *a2, ...)
{
  return _[a1 isSupplementalContent];
}

id objc_msgSend_isTimestampNewerThanMaxDeletedAge_(void *a1, const char *a2, ...)
{
  return [a1 isTimestampNewerThanMaxDeletedAge:];
}

id objc_msgSend_isTrackedAsRecent(void *a1, const char *a2, ...)
{
  return _[a1 isTrackedAsRecent];
}

id objc_msgSend_isUbiquitousBook(void *a1, const char *a2, ...)
{
  return _[a1 isUbiquitousBook];
}

id objc_msgSend_isUbiquitousItemAtURL_(void *a1, const char *a2, ...)
{
  return [a1 isUbiquitousItemAtURL:];
}

id objc_msgSend_isUserSignedInToiCloud(void *a1, const char *a2, ...)
{
  return _[a1 isUserSignedInToiCloud];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return _[a1 isValid];
}

id objc_msgSend_isValidForDeserialization_(void *a1, const char *a2, ...)
{
  return [a1 isValidForDeserialization:];
}

id objc_msgSend_keysOfEntriesPassingTest_(void *a1, const char *a2, ...)
{
  return [a1 keysOfEntriesPassingTest:];
}

id objc_msgSend_kind(void *a1, const char *a2, ...)
{
  return _[a1 kind];
}

id objc_msgSend_language(void *a1, const char *a2, ...)
{
  return _[a1 language];
}

id objc_msgSend_languageIsArabic_(void *a1, const char *a2, ...)
{
  return [a1 languageIsArabic:];
}

id objc_msgSend_languageIsHebrew_(void *a1, const char *a2, ...)
{
  return [a1 languageIsHebrew:];
}

id objc_msgSend_lastEngagedDate(void *a1, const char *a2, ...)
{
  return _[a1 lastEngagedDate];
}

id objc_msgSend_lastModification(void *a1, const char *a2, ...)
{
  return _[a1 lastModification];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_lastOpenDate(void *a1, const char *a2, ...)
{
  return _[a1 lastOpenDate];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_laterDate_(void *a1, const char *a2, ...)
{
  return [a1 laterDate:];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_libraryAssetForAssetIDs_inManagedObjectContext_(void *a1, const char *a2, ...)
{
  return [a1 libraryAssetForAssetIDs:inManagedObjectContext:];
}

id objc_msgSend_libraryAssetOnMainQueueWithAssetID_(void *a1, const char *a2, ...)
{
  return [a1 libraryAssetOnMainQueueWithAssetID:];
}

id objc_msgSend_libraryAssetOnMainQueueWithPermanentOrTemporaryAssetID_(void *a1, const char *a2, ...)
{
  return [a1 libraryAssetOnMainQueueWithPermanentOrTemporaryAssetID];
}

id objc_msgSend_libraryAssetStatusController_isAccountPrimaryAndSignedIn_(void *a1, const char *a2, ...)
{
  return [a1 libraryAssetStatusController:isAccountPrimaryAndSignedIn:];
}

id objc_msgSend_libraryAssetStatusController_makeAccountPrimaryAndSignedIn_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "libraryAssetStatusController:makeAccountPrimaryAndSignedIn:completion:");
}

id objc_msgSend_libraryAssetWithAssetID_inManagedObjectContext_(void *a1, const char *a2, ...)
{
  return [a1 libraryAssetWithAssetID:inManagedObjectContext:];
}

id objc_msgSend_libraryAssetWithAssetIdentifier_inManagedObjectContext_(void *a1, const char *a2, ...)
{
  return [a1 libraryAssetWithAssetIdentifier:inManagedObjectContext:];
}

id objc_msgSend_libraryAssetWithPermanentOrTemporaryAssetID_inManagedObjectContext_(void *a1, const char *a2, ...)
{
  return [a1 libraryAssetWithPermanentOrTemporaryAssetID:inManagedObjectContext:];
}

id objc_msgSend_libraryAssetsWithAssetIDs_inManagedObjectContext_(void *a1, const char *a2, ...)
{
  return [a1 libraryAssetsWithAssetIDs:inManagedObjectContext:];
}

id objc_msgSend_libraryAssetsWithAssetIDsContainedInList_tempAssetIDs_inManagedObjectContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "libraryAssetsWithAssetIDsContainedInList:tempAssetIDs:inManagedObjectContext:");
}

id objc_msgSend_libraryDataSource_addedAssets_(void *a1, const char *a2, ...)
{
  return [a1 libraryDataSource:addedAssets:];
}

id objc_msgSend_libraryDataSource_addedAssets_inGroup_(void *a1, const char *a2, ...)
{
  return [a1 libraryDataSource:addedAssets:inGroup:];
}

id objc_msgSend_libraryDataSource_reloadInGroup_(void *a1, const char *a2, ...)
{
  return [a1 libraryDataSource:reloadInGroup:];
}

id objc_msgSend_libraryDataSource_removedAssets_(void *a1, const char *a2, ...)
{
  return [a1 libraryDataSource:removedAssets:];
}

id objc_msgSend_libraryDataSource_removedAssets_inGroup_(void *a1, const char *a2, ...)
{
  return [a1 libraryDataSource:removedAssets:inGroup:];
}

id objc_msgSend_libraryDataSource_updateWithName_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "libraryDataSource:updateWithName:block:");
}

id objc_msgSend_libraryDataSource_updatedAssets_(void *a1, const char *a2, ...)
{
  return [a1 libraryDataSource:updatedAssets:];
}

id objc_msgSend_libraryDataSource_updatedAssets_inGroup_(void *a1, const char *a2, ...)
{
  return [a1 libraryDataSource:updatedAssets:inGroup:];
}

id objc_msgSend_libraryDidReload_(void *a1, const char *a2, ...)
{
  return [a1 libraryDidReload:];
}

id objc_msgSend_libraryManager(void *a1, const char *a2, ...)
{
  return _[a1 libraryManager];
}

id objc_msgSend_libraryMutableAssetWithAssetID_inManagedObjectContext_(void *a1, const char *a2, ...)
{
  return [a1 libraryMutableAssetWithAssetID:inManagedObjectContext:];
}

id objc_msgSend_libraryMutableAssetWithPermanentOrTemporaryAssetID_inManagedObjectContext_(void *a1, const char *a2, ...)
{
  return [a1 libraryMutableAssetWithPermanentOrTemporaryAssetID:inManagedObjectContext:];
}

id objc_msgSend_listeners(void *a1, const char *a2, ...)
{
  return _[a1 listeners];
}

id objc_msgSend_loadCachedMigrationData(void *a1, const char *a2, ...)
{
  return _[a1 loadCachedMigrationData];
}

id objc_msgSend_loadCoreDataPersistentStoreInitializedHandler_migrationHandler_(void *a1, const char *a2, ...)
{
  return [a1 loadCoreDataPersistentStoreInitializedHandler:migrationHandler:];
}

id objc_msgSend_localITSAudiobookCount(void *a1, const char *a2, ...)
{
  return _[a1 localITSAudiobookCount];
}

id objc_msgSend_localJaliscoBooksOnlyCount(void *a1, const char *a2, ...)
{
  return _[a1 localJaliscoBooksOnlyCount];
}

id objc_msgSend_localModDate(void *a1, const char *a2, ...)
{
  return _[a1 localModDate];
}

id objc_msgSend_localOnlyBookCount(void *a1, const char *a2, ...)
{
  return _[a1 localOnlyBookCount];
}

id objc_msgSend_localOnlySeriesItems(void *a1, const char *a2, ...)
{
  return _[a1 localOnlySeriesItems];
}

id objc_msgSend_localOnlySeriesItemsParent(void *a1, const char *a2, ...)
{
  return _[a1 localOnlySeriesItemsParent];
}

id objc_msgSend_localSampleCount(void *a1, const char *a2, ...)
{
  return _[a1 localSampleCount];
}

id objc_msgSend_localUbiquityCount(void *a1, const char *a2, ...)
{
  return _[a1 localUbiquityCount];
}

id objc_msgSend_localVersion(void *a1, const char *a2, ...)
{
  return _[a1 localVersion];
}

id objc_msgSend_localiTunesUCount(void *a1, const char *a2, ...)
{
  return _[a1 localiTunesUCount];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringForKey:value:table:];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return _[a1 location];
}

id objc_msgSend_locationModificationDate(void *a1, const char *a2, ...)
{
  return _[a1 locationModificationDate];
}

id objc_msgSend_lockupProfilesForStoreIDs_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockupProfilesForStoreIDs:completion:");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return _[a1 longValue];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseString];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_majorVersion(void *a1, const char *a2, ...)
{
  return _[a1 majorVersion];
}

id objc_msgSend_managedObjectContext(void *a1, const char *a2, ...)
{
  return _[a1 managedObjectContext];
}

id objc_msgSend_managedObjectModel(void *a1, const char *a2, ...)
{
  return _[a1 managedObjectModel];
}

id objc_msgSend_mappedAssetContentType(void *a1, const char *a2, ...)
{
  return _[a1 mappedAssetContentType];
}

id objc_msgSend_mappedAssetID(void *a1, const char *a2, ...)
{
  return _[a1 mappedAssetID];
}

id objc_msgSend_markAsFinishedStoreID_completion_(void *a1, const char *a2, ...)
{
  return [a1 markAsFinishedStoreID:completion:];
}

id objc_msgSend_markAssetsAsFinished_completion_(void *a1, const char *a2, ...)
{
  return [a1 markAssetsAsFinished:completion:];
}

id objc_msgSend_maxModificationDateColumnName(void *a1, const char *a2, ...)
{
  return _[a1 maxModificationDateColumnName];
}

id objc_msgSend_maxSortKey(void *a1, const char *a2, ...)
{
  return _[a1 maxSortKey];
}

id objc_msgSend_maxUserModificationDateExpressionDescription(void *a1, const char *a2, ...)
{
  return _[a1 maxUserModificationDateExpressionDescription];
}

id objc_msgSend_memberOfOtherManualCollection(void *a1, const char *a2, ...)
{
  return _[a1 memberOfOtherManualCollection];
}

id objc_msgSend_memberOfSampleCollection(void *a1, const char *a2, ...)
{
  return _[a1 memberOfSampleCollection];
}

id objc_msgSend_members(void *a1, const char *a2, ...)
{
  return _[a1 members];
}

id objc_msgSend_mergeChangesFromContextDidSaveNotification_(void *a1, const char *a2, ...)
{
  return [a1 mergeChangesFromContextDidSaveNotification:];
}

id objc_msgSend_mergeChangesFromRemoteContextSave_intoContexts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergeChangesFromRemoteContextSave:intoContexts:");
}

id objc_msgSend_mergeCurrentCollectionDetailsToCloudInMoc_(void *a1, const char *a2, ...)
{
  return [a1 mergeCurrentCollectionDetailsToCloudInMoc:];
}

id objc_msgSend_mergeCurrentCollectionMembersToCloudInMoc_(void *a1, const char *a2, ...)
{
  return [a1 mergeCurrentCollectionMembersToCloudInMoc:];
}

id objc_msgSend_mergedSerializedStatus_summaries_inMOC_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergedSerializedStatus:summaries:inMOC:");
}

id objc_msgSend_metadataForPersistentStore_(void *a1, const char *a2, ...)
{
  return [a1 metadataForPersistentStore:];
}

id objc_msgSend_metadataMigrationVersion(void *a1, const char *a2, ...)
{
  return _[a1 metadataMigrationVersion];
}

id objc_msgSend_metadataObjectForKey_(void *a1, const char *a2, ...)
{
  return [a1 metadataObjectForKey:];
}

id objc_msgSend_migrateCollections_context_(void *a1, const char *a2, ...)
{
  return [a1 migrateCollections:context:];
}

id objc_msgSend_migrateDataSources_(void *a1, const char *a2, ...)
{
  return [a1 migrateDataSources:];
}

id objc_msgSend_migrateMetaData_(void *a1, const char *a2, ...)
{
  return [a1 migrateMetaData:];
}

id objc_msgSend_migratePurgeOldDatabases(void *a1, const char *a2, ...)
{
  return _[a1 migratePurgeOldDatabases];
}

id objc_msgSend_migrateSortOrderKeys_(void *a1, const char *a2, ...)
{
  return [a1 migrateSortOrderKeys:];
}

id objc_msgSend_migrateToMyBooksWithAssetIDs_inManagedObjectContext_(void *a1, const char *a2, ...)
{
  return [a1 migrateToMyBooksWithAssetIDs:inManagedObjectContext:];
}

id objc_msgSend_migrateWithMoc_(void *a1, const char *a2, ...)
{
  return [a1 migrateWithMoc:];
}

id objc_msgSend_migratedPropertiesChanged(void *a1, const char *a2, ...)
{
  return _[a1 migratedPropertiesChanged];
}

id objc_msgSend_migratedSortOrderData(void *a1, const char *a2, ...)
{
  return _[a1 migratedSortOrderData];
}

id objc_msgSend_migratedSortOrderDataByPluginAssetID(void *a1, const char *a2, ...)
{
  return _[a1 migratedSortOrderDataByPluginAssetID];
}

id objc_msgSend_migrationCachePath(void *a1, const char *a2, ...)
{
  return _[a1 migrationCachePath];
}

id objc_msgSend_migrationDispatchQueue(void *a1, const char *a2, ...)
{
  return _[a1 migrationDispatchQueue];
}

id objc_msgSend_migrationMoc(void *a1, const char *a2, ...)
{
  return _[a1 migrationMoc];
}

id objc_msgSend_migrationOldDatabaseFolderPath(void *a1, const char *a2, ...)
{
  return _[a1 migrationOldDatabaseFolderPath];
}

id objc_msgSend_minorVersion(void *a1, const char *a2, ...)
{
  return _[a1 minorVersion];
}

id objc_msgSend_minusSet_(void *a1, const char *a2, ...)
{
  return [a1 minusSet:];
}

id objc_msgSend_modificationDate(void *a1, const char *a2, ...)
{
  return _[a1 modificationDate];
}

id objc_msgSend_modifyGlobalAnnotationsWithAssetIDs_type_performBlock_(void *a1, const char *a2, ...)
{
  return [a1 modifyGlobalAnnotationsWithAssetIDs:type:performBlock:];
}

id objc_msgSend_mostRecentPurchaseDate_(void *a1, const char *a2, ...)
{
  return [a1 mostRecentPurchaseDate:];
}

id objc_msgSend_mostRecentlyEngagedLibraryAssetsWithTypes_limit_inManagedObjectContext_(void *a1, const char *a2, ...)
{
  return [a1 mostRecentlyEngagedLibraryAssetsWithTypes:limit:inManagedObjectContext:];
}

id objc_msgSend_mostRecentlyOpenedLibraryAssetsWithTypes_limit_inManagedObjectContext_(void *a1, const char *a2, ...)
{
  return [a1 mostRecentlyOpenedLibraryAssetsWithTypes:limit:inManagedObjectContext:];
}

id objc_msgSend_moveItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return [a1 moveItemAtPath:toPath:error:];
}

id objc_msgSend_mq_setupAndStartQueryWithGroup_(void *a1, const char *a2, ...)
{
  return [a1 mq_setupAndStartQueryWithGroup:];
}

id objc_msgSend_multipleAuthors(void *a1, const char *a2, ...)
{
  return _[a1 multipleAuthors];
}

id objc_msgSend_mutableCollectionWithCollectionID_inManagedObjectContext_error_(void *a1, const char *a2, ...)
{
  return [a1 mutableCollectionWithCollectionID:inManagedObjectContext:error:];
}

id objc_msgSend_mutableCollectionsWithCollectionIDs_includeDeleted_inManagedObjectContext_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableCollectionsWithCollectionIDs:includeDeleted:inManagedObjectContext:error:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_narratorCount(void *a1, const char *a2, ...)
{
  return _[a1 narratorCount];
}

id objc_msgSend_narratorNames(void *a1, const char *a2, ...)
{
  return _[a1 narratorNames];
}

id objc_msgSend_needsDuplicateCollectionMembersRemoved(void *a1, const char *a2, ...)
{
  return _[a1 needsDuplicateCollectionMembersRemoved];
}

id objc_msgSend_needsGlobalAnnotation(void *a1, const char *a2, ...)
{
  return _[a1 needsGlobalAnnotation];
}

id objc_msgSend_needsMigration(void *a1, const char *a2, ...)
{
  return _[a1 needsMigration];
}

id objc_msgSend_needsResetNilAuthorsOnAllBooks(void *a1, const char *a2, ...)
{
  return _[a1 needsResetNilAuthorsOnAllBooks];
}

id objc_msgSend_needsResetNilAuthorsOnAllSeries(void *a1, const char *a2, ...)
{
  return _[a1 needsResetNilAuthorsOnAllSeries];
}

id objc_msgSend_needsResetSeriesStacksAndCollectionMembershipOnAllBooks(void *a1, const char *a2, ...)
{
  return _[a1 needsResetSeriesStacksAndCollectionMembershipOnAllBooks];
}

id objc_msgSend_newCapturedEnvironment_(void *a1, const char *a2, ...)
{
  return [a1 newCapturedEnvironment];
}

id objc_msgSend_newManagedObjectContext(void *a1, const char *a2, ...)
{
  return _[a1 newManagedObjectContext];
}

id objc_msgSend_newManagedObjectContextWithClass_(void *a1, const char *a2, ...)
{
  return [a1 newManagedObjectContextWithClass:];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return _[a1 nextObject];
}

id objc_msgSend_nextSortKeyForCollection_(void *a1, const char *a2, ...)
{
  return [a1 nextSortKeyForCollection:];
}

id objc_msgSend_nonLocalSampleCount(void *a1, const char *a2, ...)
{
  return _[a1 nonLocalSampleCount];
}

id objc_msgSend_nonUserUpdateLastOpenDateTo_(void *a1, const char *a2, ...)
{
  return [a1 nonUserUpdateLastOpenDateTo:];
}

id objc_msgSend_nonlocalUbiquityCount(void *a1, const char *a2, ...)
{
  return _[a1 nonlocalUbiquityCount];
}

id objc_msgSend_nonlocaliTunesUCount(void *a1, const char *a2, ...)
{
  return _[a1 nonlocaliTunesUCount];
}

id objc_msgSend_nonretainedObjectValue(void *a1, const char *a2, ...)
{
  return _[a1 nonretainedObjectValue];
}

id objc_msgSend_notFinished(void *a1, const char *a2, ...)
{
  return _[a1 notFinished];
}

id objc_msgSend_notPredicateWithSubpredicate_(void *a1, const char *a2, ...)
{
  return [a1 notPredicateWithSubpredicate:];
}

id objc_msgSend_notify(void *a1, const char *a2, ...)
{
  return _[a1 notify];
}

id objc_msgSend_notifyBlock(void *a1, const char *a2, ...)
{
  return _[a1 notifyBlock];
}

id objc_msgSend_notifyBlocksForNewAssets(void *a1, const char *a2, ...)
{
  return _[a1 notifyBlocksForNewAssets];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _[a1 now];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numRandomBooks(void *a1, const char *a2, ...)
{
  return _[a1 numRandomBooks];
}

id objc_msgSend_numberOfItemsIniCloud(void *a1, const char *a2, ...)
{
  return _[a1 numberOfItemsIniCloud];
}

id objc_msgSend_numberOfLibraryAssetsInManagdObjectContext_(void *a1, const char *a2, ...)
{
  return [a1 numberOfLibraryAssetsInManagdObjectContext:];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return [a1 numberWithBool:];
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return [a1 numberWithDouble:];
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return [a1 numberWithFloat:];
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInt:];
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInteger:];
}

id objc_msgSend_numberWithLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithLong:];
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithLongLong:];
}

id objc_msgSend_numberWithShort_(void *a1, const char *a2, ...)
{
  return [a1 numberWithShort:];
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInt:];
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInteger:];
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedLongLong:];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _[a1 object];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndex:];
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndexedSubscript:];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_objectsPassingTest_(void *a1, const char *a2, ...)
{
  return [a1 objectsPassingTest:];
}

id objc_msgSend_onAnnotationsMatchingPredicate_performBlock_(void *a1, const char *a2, ...)
{
  return [a1 onAnnotationsMatchingPredicate:performBlock:];
}

id objc_msgSend_orPredicateWithSubpredicates_(void *a1, const char *a2, ...)
{
  return [a1 orPredicateWithSubpredicates:];
}

id objc_msgSend_orderedSetWithArray_(void *a1, const char *a2, ...)
{
  return [a1 orderedSetWithArray:];
}

id objc_msgSend_ownershipObservers(void *a1, const char *a2, ...)
{
  return _[a1 ownershipObservers];
}

id objc_msgSend_ownershipSync(void *a1, const char *a2, ...)
{
  return _[a1 ownershipSync];
}

id objc_msgSend_p_assetsRequiringDeletion_removingFromCollectionIDs_(void *a1, const char *a2, ...)
{
  return [a1 p_assetsRequiringDeletion:removingFromCollectionIDs:];
}

id objc_msgSend_p_deleteAssets_(void *a1, const char *a2, ...)
{
  return [a1 p_deleteAssets:];
}

id objc_msgSend_p_deleteAssets_exhaustive_completion_(void *a1, const char *a2, ...)
{
  return [a1 p_deleteAssets:exhaustive:completion:];
}

id objc_msgSend_p_downloadSampleBook_(void *a1, const char *a2, ...)
{
  return [a1 p_downloadSampleBook:];
}

id objc_msgSend_p_fetchOrCreatePlaceholderCollectionForCollectionID_moc_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "p_fetchOrCreatePlaceholderCollectionForCollectionID:moc:");
}

id objc_msgSend_p_libraryAssetWithIdentifier_predicate_inManagedObjectContext_(void *a1, const char *a2, ...)
{
  return [a1 p_libraryAssetWithIdentifier:predicate:inManagedObjectContext:];
}

id objc_msgSend_p_shouldDeleteAsset_removingFromCollectionIDs_(void *a1, const char *a2, ...)
{
  return [a1 p_shouldDeleteAsset:removingFromCollectionIDs:];
}

id objc_msgSend_p_syncAllAssetDetailChangesToCloudInMOC_(void *a1, const char *a2, ...)
{
  return [a1 p_syncAllAssetDetailChangesToCloudInMOC:];
}

id objc_msgSend_p_syncAllReadingNowChangesToCloudInMOC_(void *a1, const char *a2, ...)
{
  return [a1 p_syncAllReadingNowChangesToCloudInMOC:];
}

id objc_msgSend_p_syncAssetDetailsForAssets_inMOC_(void *a1, const char *a2, ...)
{
  return [a1 p_syncAssetDetailsForAssets:inMOC:];
}

id objc_msgSend_p_syncCollectionMembers_deletedCollectionMembers_inContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "p_syncCollectionMembers:deletedCollectionMembers:inContext:");
}

id objc_msgSend_p_syncCollections_deletedCollections_inContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "p_syncCollections:deletedCollections:inContext:");
}

id objc_msgSend_p_syncReadingNowDetailsForAssets_inMOC_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "p_syncReadingNowDetailsForAssets:inMOC:");
}

id objc_msgSend_p_updateAsset_inCollectionMember_withMOC_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "p_updateAsset:inCollectionMember:withMOC:");
}

id objc_msgSend_p_updateAssetInMembers_moc_(void *a1, const char *a2, ...)
{
  return [a1 p_updateAssetInMembers:moc:];
}

id objc_msgSend_pageCount(void *a1, const char *a2, ...)
{
  return _[a1 pageCount];
}

id objc_msgSend_pageProgressionDirection(void *a1, const char *a2, ...)
{
  return _[a1 pageProgressionDirection];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return _[a1 pathExtension];
}

id objc_msgSend_pathForResource_ofType_(void *a1, const char *a2, ...)
{
  return [a1 pathForResource:ofType:];
}

id objc_msgSend_pauseDownloadForAssetID_(void *a1, const char *a2, ...)
{
  return [a1 pauseDownloadForAssetID:];
}

id objc_msgSend_performAddRequest_completion_(void *a1, const char *a2, ...)
{
  return [a1 performAddRequest:completion:];
}

id objc_msgSend_performBackgroundReadOnlyBlock_(void *a1, const char *a2, ...)
{
  return [a1 performBackgroundReadOnlyBlock:];
}

id objc_msgSend_performBackgroundReadOnlyBlockAndWait_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performBackgroundReadOnlyBlockAndWait:");
}

id objc_msgSend_performBlock_(void *a1, const char *a2, ...)
{
  return [a1 performBlock:];
}

id objc_msgSend_performBlockAndWait_(void *a1, const char *a2, ...)
{
  return [a1 performBlockAndWait:];
}

id objc_msgSend_performBlockInUIContext_(void *a1, const char *a2, ...)
{
  return [a1 performBlockInUIContext:];
}

id objc_msgSend_performBlockOnCollectionsWorkerQueue_(void *a1, const char *a2, ...)
{
  return [a1 performBlockOnCollectionsWorkerQueue:];
}

id objc_msgSend_performBlockOnCollectionsWorkerQueueAndWait_(void *a1, const char *a2, ...)
{
  return [a1 performBlockOnCollectionsWorkerQueueAndWait];
}

id objc_msgSend_performBlockOnUserSideQueue_(void *a1, const char *a2, ...)
{
  return [a1 performBlockOnUserSideQueue];
}

id objc_msgSend_performBlockOnWorkerQueue_(void *a1, const char *a2, ...)
{
  return [a1 performBlockOnWorkerQueue:];
}

id objc_msgSend_performNamed_workerQueueBlock_(void *a1, const char *a2, ...)
{
  return [a1 performNamed:];
}

id objc_msgSend_performNamed_workerQueueBlockAndWait_(void *a1, const char *a2, ...)
{
  return [a1 performNamed:];
}

id objc_msgSend_performReadOnlyBlock_(void *a1, const char *a2, ...)
{
  return [a1 performReadOnlyBlock:];
}

id objc_msgSend_performRemoveRequest_completion_(void *a1, const char *a2, ...)
{
  return [a1 performRemoveRequest:completion:];
}

id objc_msgSend_performSelectorOnMainThread_withObject_waitUntilDone_(void *a1, const char *a2, ...)
{
  return [a1 performSelectorOnMainThread:];
}

id objc_msgSend_permanentOrTemporaryAssetID(void *a1, const char *a2, ...)
{
  return _[a1 permanentOrTemporaryAssetID];
}

id objc_msgSend_permlink(void *a1, const char *a2, ...)
{
  return _[a1 permlink];
}

id objc_msgSend_persistentStoreCoordinator(void *a1, const char *a2, ...)
{
  return _[a1 persistentStoreCoordinator];
}

id objc_msgSend_persistentStoreName(void *a1, const char *a2, ...)
{
  return _[a1 persistentStoreName];
}

id objc_msgSend_persistentStoreURL(void *a1, const char *a2, ...)
{
  return _[a1 persistentStoreURL];
}

id objc_msgSend_persistentStores(void *a1, const char *a2, ...)
{
  return _[a1 persistentStores];
}

id objc_msgSend_plAbsolutePhysicalLocation(void *a1, const char *a2, ...)
{
  return _[a1 plAbsolutePhysicalLocation];
}

id objc_msgSend_plLocationRangeEnd(void *a1, const char *a2, ...)
{
  return _[a1 plLocationRangeEnd];
}

id objc_msgSend_plLocationRangeStart(void *a1, const char *a2, ...)
{
  return _[a1 plLocationRangeStart];
}

id objc_msgSend_plStorageUUID(void *a1, const char *a2, ...)
{
  return _[a1 plStorageUUID];
}

id objc_msgSend_plUserData(void *a1, const char *a2, ...)
{
  return _[a1 plUserData];
}

id objc_msgSend_placeholder(void *a1, const char *a2, ...)
{
  return _[a1 placeholder];
}

id objc_msgSend_plistEntryAsDictionaryFromAssetID_path_needsCoordination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "plistEntryAsDictionaryFromAssetID:path:needsCoordination:");
}

id objc_msgSend_postIntegrateCleanup(void *a1, const char *a2, ...)
{
  return _[a1 postIntegrateCleanup];
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationName:object:];
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationName:object:userInfo:];
}

id objc_msgSend_predicate(void *a1, const char *a2, ...)
{
  return _[a1 predicate];
}

id objc_msgSend_predicateForAllBooksExceptSeriesLibraryAssets(void *a1, const char *a2, ...)
{
  return _[a1 predicateForAllBooksExceptSeriesLibraryAssets];
}

id objc_msgSend_predicateForAllBooksWithSeriesID_(void *a1, const char *a2, ...)
{
  return [a1 predicateForAllBooksWithSeriesID:];
}

id objc_msgSend_predicateForAllDefaultCollections(void *a1, const char *a2, ...)
{
  return _[a1 predicateForAllDefaultCollections];
}

id objc_msgSend_predicateForAllOwnedAudiobooks(void *a1, const char *a2, ...)
{
  return _[a1 predicateForAllOwnedAudiobooks];
}

id objc_msgSend_predicateForAllOwnedBooks(void *a1, const char *a2, ...)
{
  return _[a1 predicateForAllOwnedBooks];
}

id objc_msgSend_predicateForAllStoreLibraryAssetsExcludingUnpurchasedSeriesAssets(void *a1, const char *a2, ...)
{
  return _[a1 predicateForAllStoreLibraryAssetsExcludingUnpurchasedSeriesAssets];
}

id objc_msgSend_predicateForAllUnownedLibraryAssets(void *a1, const char *a2, ...)
{
  return _[a1 predicateForAllUnownedLibraryAssets];
}

id objc_msgSend_predicateForAnnotationsIncludingDeletedWithUserModificationDate(void *a1, const char *a2, ...)
{
  return _[a1 predicateForAnnotationsIncludingDeletedWithUserModificationDate];
}

id objc_msgSend_predicateForAnnotationsWithAssetIDInList_includingDeleted_(void *a1, const char *a2, ...)
{
  return [a1 predicateForAnnotationsWithAssetIDInList:];
}

id objc_msgSend_predicateForAssetIDTaggedLibraryAsset_(void *a1, const char *a2, ...)
{
  return [a1 predicateForAssetIDTaggedLibraryAsset];
}

id objc_msgSend_predicateForAssetIDsTaggedLibraryAssets_(void *a1, const char *a2, ...)
{
  return [a1 predicateForAssetIDsTaggedLibraryAssets:];
}

id objc_msgSend_predicateForAssetIdentifierTaggedLibraryAsset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForAssetIdentifierTaggedLibraryAsset:");
}

id objc_msgSend_predicateForAssetsAvailableToAppIntentsWithTypes_(void *a1, const char *a2, ...)
{
  return [a1 predicateForAssetsAvailableToAppIntentsWithTypes:];
}

id objc_msgSend_predicateForAssetsInCollectionID_allowExplicit_(void *a1, const char *a2, ...)
{
  return [a1 predicateForAssetsInCollectionID:allowExplicit:];
}

id objc_msgSend_predicateForAssetsInCollectionID_allowExplicit_includeSeriesItems_(void *a1, const char *a2, ...)
{
  return [a1 predicateForAssetsInCollectionID:allowExplicit:includeSeriesItems:];
}

id objc_msgSend_predicateForAudiobooks(void *a1, const char *a2, ...)
{
  return _[a1 predicateForAudiobooks];
}

id objc_msgSend_predicateForCollectionMembersInCollectionID_hideUnownedItems_(void *a1, const char *a2, ...)
{
  return [a1 predicateForCollectionMembersInCollectionID:hideUnownedItems:];
}

id objc_msgSend_predicateForCollectionMembersInCollectionID_hideUnownedItems_allowExplicit_(void *a1, const char *a2, ...)
{
  return [a1 predicateForCollectionMembersInCollectionID:hideUnownedItems:allowExplicit:];
}

id objc_msgSend_predicateForCollectionWithCollectionIDInList_(void *a1, const char *a2, ...)
{
  return [a1 predicateForCollectionWithCollectionIDInList];
}

id objc_msgSend_predicateForContainerLibraryAssets(void *a1, const char *a2, ...)
{
  return _[a1 predicateForContainerLibraryAssets];
}

id objc_msgSend_predicateForContainerWithSeriesIDLibraryAsset_(void *a1, const char *a2, ...)
{
  return [a1 predicateForContainerWithSeriesIDLibraryAsset:];
}

id objc_msgSend_predicateForContentType_(void *a1, const char *a2, ...)
{
  return [a1 predicateForContentType:];
}

id objc_msgSend_predicateForContentTypes_(void *a1, const char *a2, ...)
{
  return [a1 predicateForContentTypes:];
}

id objc_msgSend_predicateForDataSourceIdentifierTaggedLibraryAssets_(void *a1, const char *a2, ...)
{
  return [a1 predicateForDataSourceIdentifierTaggedLibraryAssets:];
}

id objc_msgSend_predicateForDeletedDefaultCollections(void *a1, const char *a2, ...)
{
  return _[a1 predicateForDeletedDefaultCollections];
}

id objc_msgSend_predicateForDownloadableStoreLibraryAssets(void *a1, const char *a2, ...)
{
  return _[a1 predicateForDownloadableStoreLibraryAssets];
}

id objc_msgSend_predicateForDownloadingStoreLibraryAssets(void *a1, const char *a2, ...)
{
  return _[a1 predicateForDownloadingStoreLibraryAssets];
}

id objc_msgSend_predicateForExcludingCollectionMembersWithContainerLibraryAssets(void *a1, const char *a2, ...)
{
  return _[a1 predicateForExcludingCollectionMembersWithContainerLibraryAssets];
}

id objc_msgSend_predicateForExcludingCollectionMembersWithSideloadedAssets(void *a1, const char *a2, ...)
{
  return _[a1 predicateForExcludingCollectionMembersWithSideloadedAssets];
}

id objc_msgSend_predicateForExcludingContainerLibraryAssets(void *a1, const char *a2, ...)
{
  return _[a1 predicateForExcludingContainerLibraryAssets];
}

id objc_msgSend_predicateForExcludingUnownedAudiobookAssets(void *a1, const char *a2, ...)
{
  return _[a1 predicateForExcludingUnownedAudiobookAssets];
}

id objc_msgSend_predicateForGlobalAnnotationsWithAssetIDs_(void *a1, const char *a2, ...)
{
  return [a1 predicateForGlobalAnnotationsWithAssetIDs];
}

id objc_msgSend_predicateForInTheCloudLibraryAssets(void *a1, const char *a2, ...)
{
  return _[a1 predicateForInTheCloudLibraryAssets];
}

id objc_msgSend_predicateForLibraryAssetWithValidAssetID(void *a1, const char *a2, ...)
{
  return _[a1 predicateForLibraryAssetWithValidAssetID];
}

id objc_msgSend_predicateForLibraryAssetsMarkedAsNew(void *a1, const char *a2, ...)
{
  return _[a1 predicateForLibraryAssetsMarkedAsNew];
}

id objc_msgSend_predicateForLibraryAssetsMissingExplicitContentFlag(void *a1, const char *a2, ...)
{
  return _[a1 predicateForLibraryAssetsMissingExplicitContentFlag];
}

id objc_msgSend_predicateForLibraryAssetsRecentlyOpened(void *a1, const char *a2, ...)
{
  return _[a1 predicateForLibraryAssetsRecentlyOpened];
}

id objc_msgSend_predicateForLibraryAssetsWithSeriesID_(void *a1, const char *a2, ...)
{
  return [a1 predicateForLibraryAssetsWithSeriesID:];
}

id objc_msgSend_predicateForLocalBooksWithSeriesID_(void *a1, const char *a2, ...)
{
  return [a1 predicateForLocalBooksWithSeriesID:];
}

id objc_msgSend_predicateForLocalLibraryAssets(void *a1, const char *a2, ...)
{
  return _[a1 predicateForLocalLibraryAssets];
}

id objc_msgSend_predicateForLocalOrDownloadingLibraryAssets(void *a1, const char *a2, ...)
{
  return _[a1 predicateForLocalOrDownloadingLibraryAssets];
}

id objc_msgSend_predicateForLocalStoreAssets(void *a1, const char *a2, ...)
{
  return _[a1 predicateForLocalStoreAssets];
}

id objc_msgSend_predicateForMatchingSearchStringLibraryAssets_(void *a1, const char *a2, ...)
{
  return [a1 predicateForMatchingSearchStringLibraryAssets:];
}

id objc_msgSend_predicateForMostRecentBooksOpened(void *a1, const char *a2, ...)
{
  return _[a1 predicateForMostRecentBooksOpened];
}

id objc_msgSend_predicateForNextInSeriesLibraryAssets(void *a1, const char *a2, ...)
{
  return _[a1 predicateForNextInSeriesLibraryAssets];
}

id objc_msgSend_predicateForNonDeletedUserCollections(void *a1, const char *a2, ...)
{
  return _[a1 predicateForNonDeletedUserCollections];
}

id objc_msgSend_predicateForNonEphemeralSamplesLibraryAssets(void *a1, const char *a2, ...)
{
  return _[a1 predicateForNonEphemeralSamplesLibraryAssets];
}

id objc_msgSend_predicateForNonPreorders(void *a1, const char *a2, ...)
{
  return _[a1 predicateForNonPreorders];
}

id objc_msgSend_predicateForNotContentTypes_(void *a1, const char *a2, ...)
{
  return [a1 predicateForNotContentTypes];
}

id objc_msgSend_predicateForNotSamplesLibraryAssets(void *a1, const char *a2, ...)
{
  return _[a1 predicateForNotSamplesLibraryAssets];
}

id objc_msgSend_predicateForOwnedSingleAssetSeries(void *a1, const char *a2, ...)
{
  return _[a1 predicateForOwnedSingleAssetSeries];
}

id objc_msgSend_predicateForPermanentOrTemporaryAssetIDTaggedLibraryAsset_(void *a1, const char *a2, ...)
{
  return [a1 predicateForPermanentOrTemporaryAssetIDTaggedLibraryAsset];
}

id objc_msgSend_predicateForPurchasedBooksAssets(void *a1, const char *a2, ...)
{
  return _[a1 predicateForPurchasedBooksAssets];
}

id objc_msgSend_predicateForSamples(void *a1, const char *a2, ...)
{
  return _[a1 predicateForSamples];
}

id objc_msgSend_predicateForSearchableLibraryAssets(void *a1, const char *a2, ...)
{
  return _[a1 predicateForSearchableLibraryAssets];
}

id objc_msgSend_predicateForSeriesBooksIncludingNextForID_includeAllBooksInSeries_(void *a1, const char *a2, ...)
{
  return [a1 predicateForSeriesBooksIncludingNextForID:includeAllBooksInSeries:];
}

id objc_msgSend_predicateForSupplementalContentLibraryAssetsWithStorePlaylistID_(void *a1, const char *a2, ...)
{
  return [a1 predicateForSupplementalContentLibraryAssetsWithStorePlaylistID];
}

id objc_msgSend_predicateForTemporaryAssetIDTaggedLibraryAsset_(void *a1, const char *a2, ...)
{
  return [a1 predicateForTemporaryAssetIDTaggedLibraryAsset];
}

id objc_msgSend_predicateForTemporaryAssetIDsTaggedLibraryAssets_(void *a1, const char *a2, ...)
{
  return [a1 predicateForTemporaryAssetIDsTaggedLibraryAssets];
}

id objc_msgSend_predicateForUnownedSeriesLibraryAssets(void *a1, const char *a2, ...)
{
  return _[a1 predicateForUnownedSeriesLibraryAssets];
}

id objc_msgSend_predicateForUnownedStoreLibraryAssets(void *a1, const char *a2, ...)
{
  return _[a1 predicateForUnownedStoreLibraryAssets];
}

id objc_msgSend_predicateFor_AllBooks_LibraryAssets(void *a1, const char *a2, ...)
{
  return [a1 predicateFor_AllBooks_LibraryAssets];
}

id objc_msgSend_predicateFor_All_Finished_LibraryAssets(void *a1, const char *a2, ...)
{
  return [a1 predicateFor_All_Finished_LibraryAssets];
}

id objc_msgSend_predicateFor_All_Marked_As_Finished_LibraryAssets(void *a1, const char *a2, ...)
{
  return [a1 predicateFor_All_Marked_As_Finished_LibraryAssets];
}

id objc_msgSend_predicateToExcludeAssetsForSeriesAndStoreItems(void *a1, const char *a2, ...)
{
  return _[a1 predicateToExcludeAssetsForSeriesAndStoreItems];
}

id objc_msgSend_predicateToExcludeAssetsForSeriesAndStoreItemsNotAddedToCollections(void *a1, const char *a2, ...)
{
  return _[a1 predicateToExcludeAssetsForSeriesAndStoreItemsNotAddedToCollections];
}

id objc_msgSend_predicateToExcludeAssetsForUnpurchasedItemsInCollection_(void *a1, const char *a2, ...)
{
  return [a1 predicateToExcludeAssetsForUnpurchasedItemsInCollection];
}

id objc_msgSend_predicateToExcludeAssetsInASeriesContainerWithOwnedBooks(void *a1, const char *a2, ...)
{
  return _[a1 predicateToExcludeAssetsInASeriesContainerWithOwnedBooks];
}

id objc_msgSend_predicateToExcludeAssetsWithExplicitContent(void *a1, const char *a2, ...)
{
  return _[a1 predicateToExcludeAssetsWithExplicitContent];
}

id objc_msgSend_predicateToExcludeAssetsWithSeriesContainersWithNoOwnedBooks(void *a1, const char *a2, ...)
{
  return _[a1 predicateToExcludeAssetsWithSeriesContainersWithNoOwnedBooks];
}

id objc_msgSend_predicateToExcludeAudiobookSupplementalContent(void *a1, const char *a2, ...)
{
  return _[a1 predicateToExcludeAudiobookSupplementalContent];
}

id objc_msgSend_predicateToExcludeCollectionMembersForAudiobookSupplementalContent(void *a1, const char *a2, ...)
{
  return _[a1 predicateToExcludeCollectionMembersForAudiobookSupplementalContent];
}

id objc_msgSend_predicateToExcludeCollectionMembersForSeriesAndStoreItems(void *a1, const char *a2, ...)
{
  return _[a1 predicateToExcludeCollectionMembersForSeriesAndStoreItems];
}

id objc_msgSend_predicateToExcludeCollectionMembersForSeriesAndStoreItemsNotAddedToCollections(void *a1, const char *a2, ...)
{
  return _[a1 predicateToExcludeCollectionMembersForSeriesAndStoreItemsNotAddedToCollections];
}

id objc_msgSend_predicateToExcludeCollectionMembersForUnpurchasedItemsInCollection_(void *a1, const char *a2, ...)
{
  return [a1 predicateToExcludeCollectionMembersForUnpurchasedItemsInCollection];
}

id objc_msgSend_predicateToExcludeCollectionMembersInASeriesContainerWithOwnedBooks(void *a1, const char *a2, ...)
{
  return _[a1 predicateToExcludeCollectionMembersInASeriesContainerWithOwnedBooks];
}

id objc_msgSend_predicateToExcludeCollectionMembersWithExplicitContent(void *a1, const char *a2, ...)
{
  return _[a1 predicateToExcludeCollectionMembersWithExplicitContent];
}

id objc_msgSend_predicateToExcludeCollectionMembersWithSeriesContainersWithNoOwnedBooks(void *a1, const char *a2, ...)
{
  return _[a1 predicateToExcludeCollectionMembersWithSeriesContainersWithNoOwnedBooks];
}

id objc_msgSend_predicateToExcludeLibraryAssetsAndContainersWithExplicitContent(void *a1, const char *a2, ...)
{
  return _[a1 predicateToExcludeLibraryAssetsAndContainersWithExplicitContent];
}

id objc_msgSend_predicateToExcludeLibraryAssetsWithExplicitContent(void *a1, const char *a2, ...)
{
  return _[a1 predicateToExcludeLibraryAssetsWithExplicitContent];
}

id objc_msgSend_predicateToExcludeSeriesLibraryAssets(void *a1, const char *a2, ...)
{
  return _[a1 predicateToExcludeSeriesLibraryAssets];
}

id objc_msgSend_predicateToExcludeUnownedLibraryAssets(void *a1, const char *a2, ...)
{
  return _[a1 predicateToExcludeUnownedLibraryAssets];
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 predicateWithFormat:];
}

id objc_msgSend_predicateWithValue_(void *a1, const char *a2, ...)
{
  return [a1 predicateWithValue:];
}

id objc_msgSend_priceFormatted(void *a1, const char *a2, ...)
{
  return _[a1 priceFormatted];
}

id objc_msgSend_priceManager_updatedPrices_(void *a1, const char *a2, ...)
{
  return [a1 priceManager:updatedPrices:];
}

id objc_msgSend_priceTracker(void *a1, const char *a2, ...)
{
  return _[a1 priceTracker];
}

id objc_msgSend_prices(void *a1, const char *a2, ...)
{
  return _[a1 prices];
}

id objc_msgSend_prioritizeImport_completion_(void *a1, const char *a2, ...)
{
  return [a1 prioritizeImport:completion:];
}

id objc_msgSend_processGatheredChangedAssetsCollections_(void *a1, const char *a2, ...)
{
  return [a1 processGatheredChangedAssetsCollections:];
}

id objc_msgSend_processPendingChanges(void *a1, const char *a2, ...)
{
  return _[a1 processPendingChanges];
}

id objc_msgSend_processingAssetDetailChanges(void *a1, const char *a2, ...)
{
  return _[a1 processingAssetDetailChanges];
}

id objc_msgSend_processingAuthentication(void *a1, const char *a2, ...)
{
  return _[a1 processingAuthentication];
}

id objc_msgSend_processingCollectionDetailChanges(void *a1, const char *a2, ...)
{
  return _[a1 processingCollectionDetailChanges];
}

id objc_msgSend_processingCollectionMemberChanges(void *a1, const char *a2, ...)
{
  return _[a1 processingCollectionMemberChanges];
}

id objc_msgSend_processingOptionsFor_coverEffectsEnvironment_(void *a1, const char *a2, ...)
{
  return [a1 processingOptionsFor:coverEffectsEnvironment:];
}

id objc_msgSend_processingReadingNowChanges(void *a1, const char *a2, ...)
{
  return _[a1 processingReadingNowChanges];
}

id objc_msgSend_productProfilesForStoreIDs_completion_(void *a1, const char *a2, ...)
{
  return [a1 productProfilesForStoreIDs:completion:];
}

id objc_msgSend_profileDictionary(void *a1, const char *a2, ...)
{
  return _[a1 profileDictionary];
}

id objc_msgSend_profileKeysOfInterest(void *a1, const char *a2, ...)
{
  return _[a1 profileKeysOfInterest];
}

id objc_msgSend_progressValue(void *a1, const char *a2, ...)
{
  return _[a1 progressValue];
}

id objc_msgSend_propagateAdditionalDataWithAsset_(void *a1, const char *a2, ...)
{
  return [a1 propagateAdditionalDataWithAsset:];
}

id objc_msgSend_propagateDataProperties(void *a1, const char *a2, ...)
{
  return _[a1 propagateDataProperties];
}

id objc_msgSend_propagateNilAssetID(void *a1, const char *a2, ...)
{
  return _[a1 propagateNilAssetID];
}

id objc_msgSend_propertiesForKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertiesForKeys:");
}

id objc_msgSend_propertiesToPropagate(void *a1, const char *a2, ...)
{
  return _[a1 propertiesToPropagate];
}

id objc_msgSend_purchaseDate(void *a1, const char *a2, ...)
{
  return _[a1 purchaseDate];
}

id objc_msgSend_purchaseDates_hack(void *a1, const char *a2, ...)
{
  return [a1 purchaseDates_hack];
}

id objc_msgSend_purchasedAndLocalParent(void *a1, const char *a2, ...)
{
  return _[a1 purchasedAndLocalParent];
}

id objc_msgSend_purchasedAndLocalSeriesItems(void *a1, const char *a2, ...)
{
  return _[a1 purchasedAndLocalSeriesItems];
}

id objc_msgSend_purchasedDSID(void *a1, const char *a2, ...)
{
  return _[a1 purchasedDSID];
}

id objc_msgSend_qDownloadingStoreIDs(void *a1, const char *a2, ...)
{
  return _[a1 qDownloadingStoreIDs];
}

id objc_msgSend_q_removeOldMigrationData(void *a1, const char *a2, ...)
{
  return [a1 q_removeOldMigrationData];
}

id objc_msgSend_queryStringForSearchString_attributes_(void *a1, const char *a2, ...)
{
  return [a1 queryStringForSearchString:attributes:];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return _[a1 queue];
}

id objc_msgSend_quotaFetcher(void *a1, const char *a2, ...)
{
  return _[a1 quotaFetcher];
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return [a1 raise:format:];
}

id objc_msgSend_randomBookBaseID(void *a1, const char *a2, ...)
{
  return _[a1 randomBookBaseID];
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return [a1 rangeOfString:];
}

id objc_msgSend_rank(void *a1, const char *a2, ...)
{
  return _[a1 rank];
}

id objc_msgSend_rating(void *a1, const char *a2, ...)
{
  return _[a1 rating];
}

id objc_msgSend_readPercent(void *a1, const char *a2, ...)
{
  return _[a1 readPercent];
}

id objc_msgSend_readingNowDetailManager(void *a1, const char *a2, ...)
{
  return _[a1 readingNowDetailManager];
}

id objc_msgSend_readingNowDetailRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 readingNowDetailRepresentation];
}

id objc_msgSend_readingNowDetailsForAssetIDs_completion_(void *a1, const char *a2, ...)
{
  return [a1 readingNowDetailsForAssetIDs:completion:];
}

id objc_msgSend_readingPositionAbsolutePhysicalLocation(void *a1, const char *a2, ...)
{
  return _[a1 readingPositionAbsolutePhysicalLocation];
}

id objc_msgSend_readingPositionAnnotationVersion(void *a1, const char *a2, ...)
{
  return _[a1 readingPositionAnnotationVersion];
}

id objc_msgSend_readingPositionAssetVersion(void *a1, const char *a2, ...)
{
  return _[a1 readingPositionAssetVersion];
}

id objc_msgSend_readingPositionCFIString(void *a1, const char *a2, ...)
{
  return _[a1 readingPositionCFIString];
}

id objc_msgSend_readingPositionLocationRangeEnd(void *a1, const char *a2, ...)
{
  return _[a1 readingPositionLocationRangeEnd];
}

id objc_msgSend_readingPositionLocationRangeStart(void *a1, const char *a2, ...)
{
  return _[a1 readingPositionLocationRangeStart];
}

id objc_msgSend_readingPositionLocationUpdateDate(void *a1, const char *a2, ...)
{
  return _[a1 readingPositionLocationUpdateDate];
}

id objc_msgSend_readingPositionStorageUUID(void *a1, const char *a2, ...)
{
  return _[a1 readingPositionStorageUUID];
}

id objc_msgSend_readingPositionUserData(void *a1, const char *a2, ...)
{
  return _[a1 readingPositionUserData];
}

id objc_msgSend_readingPositionUserUpdatedDate(void *a1, const char *a2, ...)
{
  return _[a1 readingPositionUserUpdatedDate];
}

id objc_msgSend_readingProgress(void *a1, const char *a2, ...)
{
  return _[a1 readingProgress];
}

id objc_msgSend_readingProgressHighWaterMark(void *a1, const char *a2, ...)
{
  return _[a1 readingProgressHighWaterMark];
}

id objc_msgSend_rearrangeObjects(void *a1, const char *a2, ...)
{
  return _[a1 rearrangeObjects];
}

id objc_msgSend_receivedAssetDetailChangesNotification(void *a1, const char *a2, ...)
{
  return _[a1 receivedAssetDetailChangesNotification];
}

id objc_msgSend_receivedCollectionDetailChangesNotification(void *a1, const char *a2, ...)
{
  return _[a1 receivedCollectionDetailChangesNotification];
}

id objc_msgSend_receivedCollectionMemberChangesNotification(void *a1, const char *a2, ...)
{
  return _[a1 receivedCollectionMemberChangesNotification];
}

id objc_msgSend_receivedReadingNowChangesNotification(void *a1, const char *a2, ...)
{
  return _[a1 receivedReadingNowChangesNotification];
}

id objc_msgSend_refreshAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 refreshAllObjects];
}

id objc_msgSend_refreshFamily(void *a1, const char *a2, ...)
{
  return _[a1 refreshFamily];
}

id objc_msgSend_registerDefaults_(void *a1, const char *a2, ...)
{
  return [a1 registerDefaults:];
}

id objc_msgSend_releaseDate(void *a1, const char *a2, ...)
{
  return _[a1 releaseDate];
}

id objc_msgSend_reloadDataSource_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadDataSource:completion:");
}

id objc_msgSend_remoteContextDidSave_(void *a1, const char *a2, ...)
{
  return [a1 remoteContextDidSave:];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeAssetID_fromCollectionID_completion_(void *a1, const char *a2, ...)
{
  return [a1 removeAssetID:fromCollectionID:completion:];
}

id objc_msgSend_removeImagesForAssetID_temporaryAssetID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeImagesForAssetID:temporaryAssetID:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return [a1 removeItemAtPath:error:];
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return [a1 removeItemAtURL:error:];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectAtIndex:];
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectForKey:];
}

id objc_msgSend_removeObjectIdenticalTo_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectIdenticalTo:];
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsForKeys:");
}

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectsInArray:];
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver];
}

id objc_msgSend_removeObserver_forKeyPath_context_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:forKeyPath:context:];
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:name:object:];
}

id objc_msgSend_removePersistentStore_error_(void *a1, const char *a2, ...)
{
  return [a1 removePersistentStore:error:];
}

id objc_msgSend_replaceCharactersInRange_withString_(void *a1, const char *a2, ...)
{
  return [a1 replaceCharactersInRange:withString:];
}

id objc_msgSend_replaceOccurrencesOfString_withString_options_range_(void *a1, const char *a2, ...)
{
  return [a1 replaceOccurrencesOfString:withString:options:range:];
}

id objc_msgSend_requestWithURL_(void *a1, const char *a2, ...)
{
  return [a1 requestWithURL:];
}

id objc_msgSend_resetAllAssetsCollectionsWithLibraryManagedObjectContext_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetAllAssetsCollectionsWithLibraryManagedObjectContext:completion:");
}

id objc_msgSend_resetCollections(void *a1, const char *a2, ...)
{
  return _[a1 resetCollections];
}

id objc_msgSend_resetCollectionsChangeSet(void *a1, const char *a2, ...)
{
  return _[a1 resetCollectionsChangeSet];
}

id objc_msgSend_resetCollectionsForAssetIDs_completion_(void *a1, const char *a2, ...)
{
  return [a1 resetCollectionsForAssetIDs:completion:];
}

id objc_msgSend_resetDescendingSortKeyedObjects_(void *a1, const char *a2, ...)
{
  return [a1 resetDescendingSortKeyedObjects:];
}

id objc_msgSend_resetNextCollectionSort(void *a1, const char *a2, ...)
{
  return _[a1 resetNextCollectionSort];
}

id objc_msgSend_resetSeriesOnAllBooks(void *a1, const char *a2, ...)
{
  return _[a1 resetSeriesOnAllBooks];
}

id objc_msgSend_resolveLibraryAsset_options_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resolveLibraryAsset:options:completion:");
}

id objc_msgSend_resolvedSortMode(void *a1, const char *a2, ...)
{
  return _[a1 resolvedSortMode];
}

id objc_msgSend_resortAscendingSortKeyedObjects_(void *a1, const char *a2, ...)
{
  return [a1 resortAscendingSortKeyedObjects:];
}

id objc_msgSend_resortDescendingSortKeyedObjects_(void *a1, const char *a2, ...)
{
  return [a1 resortDescendingSortKeyedObjects:];
}

id objc_msgSend_resourceName(void *a1, const char *a2, ...)
{
  return _[a1 resourceName];
}

id objc_msgSend_restartDownloadForAssetID_(void *a1, const char *a2, ...)
{
  return [a1 restartDownloadForAssetID:];
}

id objc_msgSend_resultCount(void *a1, const char *a2, ...)
{
  return _[a1 resultCount];
}

id objc_msgSend_resumeDownloadForAssetID_(void *a1, const char *a2, ...)
{
  return [a1 resumeDownloadForAssetID:];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 reverseObjectEnumerator];
}

id objc_msgSend_rightsId(void *a1, const char *a2, ...)
{
  return _[a1 rightsId];
}

id objc_msgSend_rightsInfo(void *a1, const char *a2, ...)
{
  return _[a1 rightsInfo];
}

id objc_msgSend_runningPPT(void *a1, const char *a2, ...)
{
  return _[a1 runningPPT];
}

id objc_msgSend_sampleCount(void *a1, const char *a2, ...)
{
  return _[a1 sampleCount];
}

id objc_msgSend_sampleDataSourceIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 sampleDataSourceIdentifier];
}

id objc_msgSend_save_(void *a1, const char *a2, ...)
{
  return [a1 save:];
}

id objc_msgSend_saveCachedMigrationData(void *a1, const char *a2, ...)
{
  return _[a1 saveCachedMigrationData];
}

id objc_msgSend_saveContext(void *a1, const char *a2, ...)
{
  return _[a1 saveContext];
}

id objc_msgSend_saveLibrary(void *a1, const char *a2, ...)
{
  return _[a1 saveLibrary];
}

id objc_msgSend_saveManagedObjectContext_(void *a1, const char *a2, ...)
{
  return [a1 saveManagedObjectContext:];
}

id objc_msgSend_saveMetaData(void *a1, const char *a2, ...)
{
  return _[a1 saveMetaData];
}

id objc_msgSend_sequenceDisplayName(void *a1, const char *a2, ...)
{
  return _[a1 sequenceDisplayName];
}

id objc_msgSend_sequenceNumber(void *a1, const char *a2, ...)
{
  return _[a1 sequenceNumber];
}

id objc_msgSend_serializeAllStatus_inMOC_(void *a1, const char *a2, ...)
{
  return [a1 serializeAllStatus:inMOC:];
}

id objc_msgSend_seriesAssets(void *a1, const char *a2, ...)
{
  return _[a1 seriesAssets];
}

id objc_msgSend_seriesBooks(void *a1, const char *a2, ...)
{
  return _[a1 seriesBooks];
}

id objc_msgSend_seriesBooksForSeriesID_inManagedObjectContext_(void *a1, const char *a2, ...)
{
  return [a1 seriesBooksForSeriesID:inManagedObjectContext:];
}

id objc_msgSend_seriesCollectionIDForSeriesID_(void *a1, const char *a2, ...)
{
  return [a1 seriesCollectionIDForSeriesID:];
}

id objc_msgSend_seriesCollectionWithSeriesID_name_(void *a1, const char *a2, ...)
{
  return [a1 seriesCollectionWithSeriesID:name:];
}

id objc_msgSend_seriesContainer(void *a1, const char *a2, ...)
{
  return _[a1 seriesContainer];
}

id objc_msgSend_seriesContainerForSeriesID_inManagedObjectContext_(void *a1, const char *a2, ...)
{
  return [a1 seriesContainerForSeriesID:inManagedObjectContext:];
}

id objc_msgSend_seriesID(void *a1, const char *a2, ...)
{
  return _[a1 seriesID];
}

id objc_msgSend_seriesIDFromSeriesCollectionID_(void *a1, const char *a2, ...)
{
  return [a1 seriesIDFromSeriesCollectionID:];
}

id objc_msgSend_seriesInfoUpdateIntervalEnabled(void *a1, const char *a2, ...)
{
  return _[a1 seriesInfoUpdateIntervalEnabled];
}

id objc_msgSend_seriesIsCloudOnly(void *a1, const char *a2, ...)
{
  return _[a1 seriesIsCloudOnly];
}

id objc_msgSend_seriesIsHidden(void *a1, const char *a2, ...)
{
  return _[a1 seriesIsHidden];
}

id objc_msgSend_seriesIsOrdered(void *a1, const char *a2, ...)
{
  return _[a1 seriesIsOrdered];
}

id objc_msgSend_seriesItemCount(void *a1, const char *a2, ...)
{
  return _[a1 seriesItemCount];
}

id objc_msgSend_seriesManager(void *a1, const char *a2, ...)
{
  return _[a1 seriesManager];
}

id objc_msgSend_seriesSortKey(void *a1, const char *a2, ...)
{
  return _[a1 seriesSortKey];
}

id objc_msgSend_seriesStackBooksForBook_(void *a1, const char *a2, ...)
{
  return [a1 seriesStackBooksForBook:];
}

id objc_msgSend_seriesStackCount(void *a1, const char *a2, ...)
{
  return _[a1 seriesStackCount];
}

id objc_msgSend_seriesStackIDs(void *a1, const char *a2, ...)
{
  return _[a1 seriesStackIDs];
}

id objc_msgSend_seriesUpdaterResetWithIDs_(void *a1, const char *a2, ...)
{
  return [a1 seriesUpdaterResetWithIDs:];
}

id objc_msgSend_sessionContextType(void *a1, const char *a2, ...)
{
  return _[a1 sessionContextType];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setActualCompletedImportOperations_(void *a1, const char *a2, ...)
{
  return [a1 setActualCompletedImportOperations:];
}

id objc_msgSend_setActualFailedImportOperations_(void *a1, const char *a2, ...)
{
  return [a1 setActualFailedImportOperations:];
}

id objc_msgSend_setActualTotalImportOperations_(void *a1, const char *a2, ...)
{
  return [a1 setActualTotalImportOperations:];
}

id objc_msgSend_setAsset_(void *a1, const char *a2, ...)
{
  return [a1 setAsset:];
}

id objc_msgSend_setAssetDetails_completion_(void *a1, const char *a2, ...)
{
  return [a1 setAssetDetails:completion:];
}

id objc_msgSend_setAssetDetailsManager_(void *a1, const char *a2, ...)
{
  return [a1 setAssetDetailsManager:];
}

id objc_msgSend_setAssetDetailsModificationDate_(void *a1, const char *a2, ...)
{
  return [a1 setAssetDetailsModificationDate:];
}

id objc_msgSend_setAssetID_(void *a1, const char *a2, ...)
{
  return [a1 setAssetID:];
}

id objc_msgSend_setAssetPathToCacheItemDict_(void *a1, const char *a2, ...)
{
  return [a1 setAssetPathToCacheItemDict:];
}

id objc_msgSend_setAttributes_ofItemAtPath_error_(void *a1, const char *a2, ...)
{
  return [a1 setAttributes:ofItemAtPath:error:];
}

id objc_msgSend_setAuthor_(void *a1, const char *a2, ...)
{
  return [a1 setAuthor:];
}

id objc_msgSend_setBackgroundReadOnlyContextPool_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundReadOnlyContextPool:];
}

id objc_msgSend_setBookHighWaterMarkProgress_(void *a1, const char *a2, ...)
{
  return [a1 setBookHighWaterMarkProgress:];
}

id objc_msgSend_setBookmarkTime_(void *a1, const char *a2, ...)
{
  return [a1 setBookmarkTime:];
}

id objc_msgSend_setByAddingObjectsFromSet_(void *a1, const char *a2, ...)
{
  return [a1 setByAddingObjectsFromSet:];
}

id objc_msgSend_setCalendar_(void *a1, const char *a2, ...)
{
  return [a1 setCalendar:];
}

id objc_msgSend_setCanPauseCount_(void *a1, const char *a2, ...)
{
  return [a1 setCanPauseCount:];
}

id objc_msgSend_setCanResumeCount_(void *a1, const char *a2, ...)
{
  return [a1 setCanResumeCount:];
}

id objc_msgSend_setCheckingForUpdates_(void *a1, const char *a2, ...)
{
  return [a1 setCheckingForUpdates:];
}

id objc_msgSend_setCloudAssetType_(void *a1, const char *a2, ...)
{
  return [a1 setCloudAssetType:];
}

id objc_msgSend_setCloudVersion_(void *a1, const char *a2, ...)
{
  return [a1 setCloudVersion];
}

id objc_msgSend_setCoalescingDelay_(void *a1, const char *a2, ...)
{
  return [a1 setCoalescingDelay:];
}

id objc_msgSend_setCollection_(void *a1, const char *a2, ...)
{
  return [a1 setCollection:];
}

id objc_msgSend_setCollectionDescription_(void *a1, const char *a2, ...)
{
  return [a1 setCollectionDescription:];
}

id objc_msgSend_setCollectionDetails_completion_(void *a1, const char *a2, ...)
{
  return [a1 setCollectionDetails:completion:];
}

id objc_msgSend_setCollectionID_(void *a1, const char *a2, ...)
{
  return [a1 setCollectionID:];
}

id objc_msgSend_setCollectionMembers_completion_(void *a1, const char *a2, ...)
{
  return [a1 setCollectionMembers:completion:];
}

id objc_msgSend_setCollectionsWorkerChildContext_(void *a1, const char *a2, ...)
{
  return [a1 setCollectionsWorkerChildContext:];
}

id objc_msgSend_setCompletedImportOperations_(void *a1, const char *a2, ...)
{
  return [a1 setCompletedImportOperations:];
}

id objc_msgSend_setCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 setCompletionHandler:];
}

id objc_msgSend_setContentType_(void *a1, const char *a2, ...)
{
  return [a1 setContentType:];
}

id objc_msgSend_setCoverEffectRTLOverride_(void *a1, const char *a2, ...)
{
  return [a1 setCoverEffectRTLOverride:];
}

id objc_msgSend_setCoverEffectsContent_(void *a1, const char *a2, ...)
{
  return [a1 setCoverEffectsContent:];
}

id objc_msgSend_setCoverEffectsNightMode_(void *a1, const char *a2, ...)
{
  return [a1 setCoverEffectsNightMode:];
}

id objc_msgSend_setCreateSeriesContainers_(void *a1, const char *a2, ...)
{
  return [a1 setCreateSeriesContainers:];
}

id objc_msgSend_setCreationDate_(void *a1, const char *a2, ...)
{
  return [a1 setCreationDate:];
}

id objc_msgSend_setCreationDateToNow(void *a1, const char *a2, ...)
{
  return _[a1 setCreationDateToNow];
}

id objc_msgSend_setDataSourceIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setDataSourceIdentifier];
}

id objc_msgSend_setDataSourcesBitmask_(void *a1, const char *a2, ...)
{
  return [a1 setDataSourcesBitmask:];
}

id objc_msgSend_setDataSourcesByIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setDataSourcesByIdentifier:];
}

id objc_msgSend_setDataType_(void *a1, const char *a2, ...)
{
  return [a1 setDataType:];
}

id objc_msgSend_setDateFinished_(void *a1, const char *a2, ...)
{
  return [a1 setDateFinished:];
}

id objc_msgSend_setDatePlaybackTimeUpdated_(void *a1, const char *a2, ...)
{
  return [a1 setDatePlaybackTimeUpdated:];
}

id objc_msgSend_setDay_(void *a1, const char *a2, ...)
{
  return [a1 setDay:];
}

id objc_msgSend_setDefaultAllBooksCollection_(void *a1, const char *a2, ...)
{
  return [a1 setDefaultAllBooksCollection:];
}

id objc_msgSend_setDefaultAudioBooksCollection_(void *a1, const char *a2, ...)
{
  return [a1 setDefaultAudioBooksCollection];
}

id objc_msgSend_setDefaultBooksCollection_(void *a1, const char *a2, ...)
{
  return [a1 setDefaultBooksCollection:];
}

id objc_msgSend_setDefaultDownloadedCollection_(void *a1, const char *a2, ...)
{
  return [a1 setDefaultDownloadedCollection];
}

id objc_msgSend_setDefaultFinishedCollection_(void *a1, const char *a2, ...)
{
  return [a1 setDefaultFinishedCollection:];
}

id objc_msgSend_setDefaultSamplesCollection_(void *a1, const char *a2, ...)
{
  return [a1 setDefaultSamplesCollection:];
}

id objc_msgSend_setDefaultWantToReadCollection_(void *a1, const char *a2, ...)
{
  return [a1 setDefaultWantToReadCollection:];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}

id objc_msgSend_setDeletedFlag_(void *a1, const char *a2, ...)
{
  return [a1 setDeletedFlag:];
}

id objc_msgSend_setDidMigrateFromITunesSyncToICloudSync_(void *a1, const char *a2, ...)
{
  return [a1 setDidMigrateFromITunesSyncToICloudSync:];
}

id objc_msgSend_setDifferentDate_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setDifferentDate:forKey:];
}

id objc_msgSend_setDifferentNumber_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setDifferentNumber:forKey:];
}

id objc_msgSend_setDifferentObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setDifferentObject:forKey:];
}

id objc_msgSend_setDifferentString_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setDifferentString:forKey:];
}

id objc_msgSend_setDifferentValue_forKey_klass_(void *a1, const char *a2, ...)
{
  return [a1 setDifferentValue:forKey:klass:];
}

id objc_msgSend_setDownloadAssetsTotalPercentComplete_(void *a1, const char *a2, ...)
{
  return [a1 setDownloadAssetsTotalPercentComplete:];
}

id objc_msgSend_setEntity_(void *a1, const char *a2, ...)
{
  return [a1 setEntity:];
}

id objc_msgSend_setEra_(void *a1, const char *a2, ...)
{
  return [a1 setEra:];
}

id objc_msgSend_setExpirationDate_(void *a1, const char *a2, ...)
{
  return [a1 setExpirationDate:];
}

id objc_msgSend_setExplicitContentRestricted_(void *a1, const char *a2, ...)
{
  return [a1 setExplicitContentRestricted:];
}

id objc_msgSend_setFailedImportOperations_(void *a1, const char *a2, ...)
{
  return [a1 setFailedImportOperations:];
}

id objc_msgSend_setFetchBatchSize_(void *a1, const char *a2, ...)
{
  return [a1 setFetchBatchSize:];
}

id objc_msgSend_setFetchLimit_(void *a1, const char *a2, ...)
{
  return [a1 setFetchLimit:];
}

id objc_msgSend_setFileOnDiskLastTouchDate_(void *a1, const char *a2, ...)
{
  return [a1 setFileOnDiskLastTouchDate:];
}

id objc_msgSend_setFileSize_(void *a1, const char *a2, ...)
{
  return [a1 setFileSize:];
}

id objc_msgSend_setFileSizeNumber_(void *a1, const char *a2, ...)
{
  return [a1 setFileSizeNumber:];
}

id objc_msgSend_setFileURL_(void *a1, const char *a2, ...)
{
  return [a1 setFileURL:];
}

id objc_msgSend_setFilter_(void *a1, const char *a2, ...)
{
  return [a1 setFilter:];
}

id objc_msgSend_setFinishedDateKind_(void *a1, const char *a2, ...)
{
  return [a1 setFinishedDateKind:];
}

id objc_msgSend_setFinishedStateUserSetsFinished_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 setFinishedStateUserSetsFinished:userInfo:];
}

id objc_msgSend_setFoundItemsHandler_(void *a1, const char *a2, ...)
{
  return [a1 setFoundItemsHandler:];
}

id objc_msgSend_setGeneration_(void *a1, const char *a2, ...)
{
  return [a1 setGeneration:];
}

id objc_msgSend_setGenerationCount_(void *a1, const char *a2, ...)
{
  return [a1 setGenerationCount:];
}

id objc_msgSend_setGenerationFetched_(void *a1, const char *a2, ...)
{
  return [a1 setGenerationFetched:];
}

id objc_msgSend_setHasCheckedOwnedSingleBookSeriesAndNonSeriesAudiobooks_(void *a1, const char *a2, ...)
{
  return [a1 setHasCheckedOwnedSingleBookSeriesAndNonSeriesAudiobooks:];
}

id objc_msgSend_setHasDownloads_(void *a1, const char *a2, ...)
{
  return [a1 setHasDownloads:];
}

id objc_msgSend_setHasUpdates_(void *a1, const char *a2, ...)
{
  return [a1 setHasUpdates:];
}

id objc_msgSend_setHasUpdatesOrDownloadsOrUploads_(void *a1, const char *a2, ...)
{
  return [a1 setHasUpdatesOrDownloadsOrUploads:];
}

id objc_msgSend_setHasUploads_(void *a1, const char *a2, ...)
{
  return [a1 setHasUploads:];
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return [a1 setHidden:];
}

id objc_msgSend_setHistoryToken_(void *a1, const char *a2, ...)
{
  return [a1 setHistoryToken:];
}

id objc_msgSend_setHistoryTokenOffset_(void *a1, const char *a2, ...)
{
  return [a1 setHistoryTokenOffset:];
}

id objc_msgSend_setInteger_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setInteger:forKey:];
}

id objc_msgSend_setIsEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setIsEnabled:];
}

id objc_msgSend_setIsEphemeral_(void *a1, const char *a2, ...)
{
  return [a1 setIsEphemeral:];
}

id objc_msgSend_setIsFinished_(void *a1, const char *a2, ...)
{
  return [a1 setIsFinished:];
}

id objc_msgSend_setIsHidden_(void *a1, const char *a2, ...)
{
  return [a1 setIsHidden:];
}

id objc_msgSend_setIsNew_(void *a1, const char *a2, ...)
{
  return [a1 setIsNew:];
}

id objc_msgSend_setIsTrackedAsRecent_(void *a1, const char *a2, ...)
{
  return [a1 setIsTrackedAsRecent:];
}

id objc_msgSend_setLastEngagedDate_(void *a1, const char *a2, ...)
{
  return [a1 setLastEngagedDate:];
}

id objc_msgSend_setLastModification_(void *a1, const char *a2, ...)
{
  return [a1 setLastModification:];
}

id objc_msgSend_setLastOpenDate_(void *a1, const char *a2, ...)
{
  return [a1 setLastOpenDate:];
}

id objc_msgSend_setLibraryAssetMonitor_(void *a1, const char *a2, ...)
{
  return [a1 setLibraryAssetMonitor:];
}

id objc_msgSend_setLibraryManager_(void *a1, const char *a2, ...)
{
  return [a1 setLibraryManager:];
}

id objc_msgSend_setLocalFileURL_(void *a1, const char *a2, ...)
{
  return [a1 setLocalFileURL:];
}

id objc_msgSend_setLocalModDate_(void *a1, const char *a2, ...)
{
  return [a1 setLocalModDate:];
}

id objc_msgSend_setLocalOnlySeriesItemsParent_(void *a1, const char *a2, ...)
{
  return [a1 setLocalOnlySeriesItemsParent:];
}

id objc_msgSend_setLocalVersion_(void *a1, const char *a2, ...)
{
  return [a1 setLocalVersion:];
}

id objc_msgSend_setMaxConcurrentOperationCount_(void *a1, const char *a2, ...)
{
  return [a1 setMaxConcurrentOperationCount:];
}

id objc_msgSend_setMaximumDelay_(void *a1, const char *a2, ...)
{
  return [a1 setMaximumDelay:];
}

id objc_msgSend_setMergePolicy_(void *a1, const char *a2, ...)
{
  return [a1 setMergePolicy:];
}

id objc_msgSend_setMetadataObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setMetadataObject:forKey:];
}

id objc_msgSend_setMigratedPropertiesChanged_(void *a1, const char *a2, ...)
{
  return [a1 setMigratedPropertiesChanged:];
}

id objc_msgSend_setMigratedSortOrderData_(void *a1, const char *a2, ...)
{
  return [a1 setMigratedSortOrderData:];
}

id objc_msgSend_setMigratedSortOrderDataByPluginAssetID_(void *a1, const char *a2, ...)
{
  return [a1 setMigratedSortOrderDataByPluginAssetID:];
}

id objc_msgSend_setModificationDate_(void *a1, const char *a2, ...)
{
  return [a1 setModificationDate:];
}

id objc_msgSend_setMonth_(void *a1, const char *a2, ...)
{
  return [a1 setMonth:];
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return [a1 setName:];
}

id objc_msgSend_setNeedsConfigurationUpdate(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsConfigurationUpdate];
}

id objc_msgSend_setNeedsDuplicateCollectionMembersRemoved_(void *a1, const char *a2, ...)
{
  return [a1 setNeedsDuplicateCollectionMembersRemoved:];
}

id objc_msgSend_setNeedsMigration_(void *a1, const char *a2, ...)
{
  return [a1 setNeedsMigration:];
}

id objc_msgSend_setNeedsResetNilAuthorsOnAllBooks_(void *a1, const char *a2, ...)
{
  return [a1 setNeedsResetNilAuthorsOnAllBooks:];
}

id objc_msgSend_setNeedsResetNilAuthorsOnAllSeries_(void *a1, const char *a2, ...)
{
  return [a1 setNeedsResetNilAuthorsOnAllSeries:];
}

id objc_msgSend_setNeedsResetSeriesStacksAndCollectionMembershipOnAllBooks_(void *a1, const char *a2, ...)
{
  return [a1 setNeedsResetSeriesStacksAndCollectionMembershipOnAllBooks:];
}

id objc_msgSend_setNotFinished_(void *a1, const char *a2, ...)
{
  return [a1 setNotFinished:];
}

id objc_msgSend_setNotificationBatchingInterval_(void *a1, const char *a2, ...)
{
  return [a1 setNotificationBatchingInterval:];
}

id objc_msgSend_setNumRandomBooks_(void *a1, const char *a2, ...)
{
  return [a1 setNumRandomBooks:];
}

id objc_msgSend_setNumberOfItemsIniCloud_(void *a1, const char *a2, ...)
{
  return [a1 setNumberOfItemsIniCloud:];
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:atIndexedSubscript:];
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKey:];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKeyedSubscript:];
}

id objc_msgSend_setPersistentStoreCoordinator_(void *a1, const char *a2, ...)
{
  return [a1 setPersistentStoreCoordinator:];
}

id objc_msgSend_setPlAbsolutePhysicalLocation_(void *a1, const char *a2, ...)
{
  return [a1 setPlAbsolutePhysicalLocation:];
}

id objc_msgSend_setPlLocationRangeEnd_(void *a1, const char *a2, ...)
{
  return [a1 setPlLocationRangeEnd:];
}

id objc_msgSend_setPlLocationRangeStart_(void *a1, const char *a2, ...)
{
  return [a1 setPlLocationRangeStart:];
}

id objc_msgSend_setPlaceholder_(void *a1, const char *a2, ...)
{
  return [a1 setPlaceholder:];
}

id objc_msgSend_setPredicate_(void *a1, const char *a2, ...)
{
  return [a1 setPredicate:];
}

id objc_msgSend_setPrimitiveValue_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setPrimitiveValue:forKey:];
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return [a1 setPriority:];
}

id objc_msgSend_setProcessingAssetDetailChanges_(void *a1, const char *a2, ...)
{
  return [a1 setProcessingAssetDetailChanges:];
}

id objc_msgSend_setProcessingAuthentication_(void *a1, const char *a2, ...)
{
  return [a1 setProcessingAuthentication:];
}

id objc_msgSend_setProcessingCollectionDetailChanges_(void *a1, const char *a2, ...)
{
  return [a1 setProcessingCollectionDetailChanges:];
}

id objc_msgSend_setProcessingCollectionMemberChanges_(void *a1, const char *a2, ...)
{
  return [a1 setProcessingCollectionMemberChanges:];
}

id objc_msgSend_setProcessingReadingNowChanges_(void *a1, const char *a2, ...)
{
  return [a1 setProcessingReadingNowChanges:];
}

id objc_msgSend_setPropertiesToFetch_(void *a1, const char *a2, ...)
{
  return [a1 setPropertiesToFetch:];
}

id objc_msgSend_setPropertiesToGroupBy_(void *a1, const char *a2, ...)
{
  return [a1 setPropertiesToGroupBy:];
}

id objc_msgSend_setPropertiesToPropagate_(void *a1, const char *a2, ...)
{
  return [a1 setPropertiesToPropagate:];
}

id objc_msgSend_setPurchaseDate_(void *a1, const char *a2, ...)
{
  return [a1 setPurchaseDate:];
}

id objc_msgSend_setPurchaseDates_hack_(void *a1, const char *a2, ...)
{
  return [a1 setPurchaseDates_hack:];
}

id objc_msgSend_setPurchasedAndLocalParent_(void *a1, const char *a2, ...)
{
  return [a1 setPurchasedAndLocalParent:];
}

id objc_msgSend_setQualityOfService_(void *a1, const char *a2, ...)
{
  return [a1 setQualityOfService:];
}

id objc_msgSend_setRandomBookBaseID_(void *a1, const char *a2, ...)
{
  return [a1 setRandomBookBaseID:];
}

id objc_msgSend_setReadingNowDetails_completion_(void *a1, const char *a2, ...)
{
  return [a1 setReadingNowDetails:completion:];
}

id objc_msgSend_setReadingPositionAbsolutePhysicalLocation_(void *a1, const char *a2, ...)
{
  return [a1 setReadingPositionAbsolutePhysicalLocation:];
}

id objc_msgSend_setReadingPositionAnnotationVersion_(void *a1, const char *a2, ...)
{
  return [a1 setReadingPositionAnnotationVersion:];
}

id objc_msgSend_setReadingPositionAssetVersion_(void *a1, const char *a2, ...)
{
  return [a1 setReadingPositionAssetVersion:];
}

id objc_msgSend_setReadingPositionCFIString_(void *a1, const char *a2, ...)
{
  return [a1 setReadingPositionCFIString:];
}

id objc_msgSend_setReadingPositionLocationRangeEnd_(void *a1, const char *a2, ...)
{
  return [a1 setReadingPositionLocationRangeEnd:];
}

id objc_msgSend_setReadingPositionLocationRangeStart_(void *a1, const char *a2, ...)
{
  return [a1 setReadingPositionLocationRangeStart:];
}

id objc_msgSend_setReadingPositionLocationUpdateDate_(void *a1, const char *a2, ...)
{
  return [a1 setReadingPositionLocationUpdateDate:];
}

id objc_msgSend_setReadingPositionStorageUUID_(void *a1, const char *a2, ...)
{
  return [a1 setReadingPositionStorageUUID:];
}

id objc_msgSend_setReadingPositionUserData_(void *a1, const char *a2, ...)
{
  return [a1 setReadingPositionUserData:];
}

id objc_msgSend_setReadingProgress_(void *a1, const char *a2, ...)
{
  return [a1 setReadingProgress:];
}

id objc_msgSend_setReadingProgressHighWaterMark_(void *a1, const char *a2, ...)
{
  return [a1 setReadingProgressHighWaterMark:];
}

id objc_msgSend_setReceivedAssetDetailChangesNotification_(void *a1, const char *a2, ...)
{
  return [a1 setReceivedAssetDetailChangesNotification:];
}

id objc_msgSend_setReceivedCollectionDetailChangesNotification_(void *a1, const char *a2, ...)
{
  return [a1 setReceivedCollectionDetailChangesNotification:];
}

id objc_msgSend_setReceivedCollectionMemberChangesNotification_(void *a1, const char *a2, ...)
{
  return [a1 setReceivedCollectionMemberChangesNotification:];
}

id objc_msgSend_setReceivedReadingNowChangesNotification_(void *a1, const char *a2, ...)
{
  return [a1 setReceivedReadingNowChangesNotification:];
}

id objc_msgSend_setReloading_(void *a1, const char *a2, ...)
{
  return [a1 setReloading:];
}

id objc_msgSend_setRequestOptions_(void *a1, const char *a2, ...)
{
  return [a1 setRequestOptions:];
}

id objc_msgSend_setResetCollectionsChangeSet_(void *a1, const char *a2, ...)
{
  return [a1 setResetCollectionsChangeSet:];
}

id objc_msgSend_setResetSeriesOnAllBooks_(void *a1, const char *a2, ...)
{
  return [a1 setResetSeriesOnAllBooks:];
}

id objc_msgSend_setResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return [a1 setResourceValue:forKey:error:];
}

id objc_msgSend_setResultType_(void *a1, const char *a2, ...)
{
  return [a1 setResultType:];
}

id objc_msgSend_setReturnsDistinctResults_(void *a1, const char *a2, ...)
{
  return [a1 setReturnsDistinctResults:];
}

id objc_msgSend_setReturnsObjectsAsFaults_(void *a1, const char *a2, ...)
{
  return [a1 setReturnsObjectsAsFaults:];
}

id objc_msgSend_setRightsId_(void *a1, const char *a2, ...)
{
  return [a1 setRightsId:];
}

id objc_msgSend_setRunningPPT_(void *a1, const char *a2, ...)
{
  return [a1 setRunningPPT:];
}

id objc_msgSend_setSaveContext_(void *a1, const char *a2, ...)
{
  return [a1 setSaveContext:];
}

id objc_msgSend_setSearchScopes_(void *a1, const char *a2, ...)
{
  return [a1 setSearchScopes:];
}

id objc_msgSend_setSeriesAssets_(void *a1, const char *a2, ...)
{
  return [a1 setSeriesAssets:];
}

id objc_msgSend_setSeriesContainer_(void *a1, const char *a2, ...)
{
  return [a1 setSeriesContainer:];
}

id objc_msgSend_setSeriesID_(void *a1, const char *a2, ...)
{
  return [a1 setSeriesID:];
}

id objc_msgSend_setSeriesSortKey_(void *a1, const char *a2, ...)
{
  return [a1 setSeriesSortKey:];
}

id objc_msgSend_setSessionContextType_(void *a1, const char *a2, ...)
{
  return [a1 setSessionContextType:];
}

id objc_msgSend_setSinfData_(void *a1, const char *a2, ...)
{
  return [a1 setSinfData:];
}

id objc_msgSend_setSortAuthor_(void *a1, const char *a2, ...)
{
  return [a1 setSortAuthor:];
}

id objc_msgSend_setSortDescriptors_(void *a1, const char *a2, ...)
{
  return [a1 setSortDescriptors:];
}

id objc_msgSend_setSortKey_(void *a1, const char *a2, ...)
{
  return [a1 setSortKey:];
}

id objc_msgSend_setSortMode_(void *a1, const char *a2, ...)
{
  return [a1 setSortMode:];
}

id objc_msgSend_setSortOrder_(void *a1, const char *a2, ...)
{
  return [a1 setSortOrder:];
}

id objc_msgSend_setSortTitle_(void *a1, const char *a2, ...)
{
  return [a1 setSortTitle:];
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return [a1 setState:];
}

id objc_msgSend_setStatus_(void *a1, const char *a2, ...)
{
  return [a1 setStatus:];
}

id objc_msgSend_setStoreID_(void *a1, const char *a2, ...)
{
  return [a1 setStoreID:];
}

id objc_msgSend_setStoreId_(void *a1, const char *a2, ...)
{
  return [a1 setStoreId:];
}

id objc_msgSend_setStoreURL_(void *a1, const char *a2, ...)
{
  return [a1 setStoreURL:];
}

id objc_msgSend_setString_(void *a1, const char *a2, ...)
{
  return [a1 setString:];
}

id objc_msgSend_setSyncVersion_(void *a1, const char *a2, ...)
{
  return [a1 setSyncVersion:];
}

id objc_msgSend_setTaste_(void *a1, const char *a2, ...)
{
  return [a1 setTaste:];
}

id objc_msgSend_setTasteSyncedToStore_(void *a1, const char *a2, ...)
{
  return [a1 setTasteSyncedToStore];
}

id objc_msgSend_setTemporaryAssetID_(void *a1, const char *a2, ...)
{
  return [a1 setTemporaryAssetID:];
}

id objc_msgSend_setTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return [a1 setTimeIntervalSinceReferenceDate:];
}

id objc_msgSend_setTimeZone_(void *a1, const char *a2, ...)
{
  return [a1 setTimeZone:];
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return [a1 setTitle:];
}

id objc_msgSend_setTotalImportOperations_(void *a1, const char *a2, ...)
{
  return [a1 setTotalImportOperations:];
}

id objc_msgSend_setTotalImportOperationsProcessed_(void *a1, const char *a2, ...)
{
  return [a1 setTotalImportOperationsProcessed:];
}

id objc_msgSend_setUiManagerProviderForAddingToWantToRead_(void *a1, const char *a2, ...)
{
  return [a1 setUiManagerProviderForAddingToWantToRead];
}

id objc_msgSend_setUnacknowledgedDownloadsCount_(void *a1, const char *a2, ...)
{
  return [a1 setUnacknowledgedDownloadsCount:];
}

id objc_msgSend_setUnacknowledgedUpdatesCount_(void *a1, const char *a2, ...)
{
  return [a1 setUnacknowledgedUpdatesCount:];
}

id objc_msgSend_setUndoManager_(void *a1, const char *a2, ...)
{
  return [a1 setUndoManager:];
}

id objc_msgSend_setUpgradeAssetSortKeys_(void *a1, const char *a2, ...)
{
  return [a1 setUpgradeAssetSortKeys:];
}

id objc_msgSend_setUploadStatus_(void *a1, const char *a2, ...)
{
  return [a1 setUploadStatus:];
}

id objc_msgSend_setUrl_(void *a1, const char *a2, ...)
{
  return [a1 setUrl:];
}

id objc_msgSend_setUsq_moc_(void *a1, const char *a2, ...)
{
  return [a1 setUsq_moc:];
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setValue:forKey:];
}

id objc_msgSend_setViewMode_(void *a1, const char *a2, ...)
{
  return [a1 setViewMode:];
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return [a1 setWithArray:];
}

id objc_msgSend_setWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 setWithCapacity:];
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return [a1 setWithObject:];
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 setWithObjects:];
}

id objc_msgSend_setWorkerChildContext_(void *a1, const char *a2, ...)
{
  return [a1 setWorkerChildContext:];
}

id objc_msgSend_setYear_(void *a1, const char *a2, ...)
{
  return [a1 setYear:];
}

id objc_msgSend_setupDefaultCollectionsInManagedObjectContext_(void *a1, const char *a2, ...)
{
  return [a1 setupDefaultCollectionsInManagedObjectContext:];
}

id objc_msgSend_setupStateObservation(void *a1, const char *a2, ...)
{
  return _[a1 setupStateObservation];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _[a1 shared];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _[a1 sharedApplication];
}

id objc_msgSend_sharedController(void *a1, const char *a2, ...)
{
  return _[a1 sharedController];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedManager];
}

id objc_msgSend_sharedProvider(void *a1, const char *a2, ...)
{
  return _[a1 sharedProvider];
}

id objc_msgSend_sharedReachabilityForInternetConnection(void *a1, const char *a2, ...)
{
  return _[a1 sharedReachabilityForInternetConnection];
}

id objc_msgSend_shortBookTitle(void *a1, const char *a2, ...)
{
  return _[a1 shortBookTitle];
}

id objc_msgSend_shortDescription(void *a1, const char *a2, ...)
{
  return _[a1 shortDescription];
}

id objc_msgSend_shouldBeInDownloadedCollection(void *a1, const char *a2, ...)
{
  return _[a1 shouldBeInDownloadedCollection];
}

id objc_msgSend_shouldBeInMySamplesCollection(void *a1, const char *a2, ...)
{
  return _[a1 shouldBeInMySamplesCollection];
}

id objc_msgSend_shouldHaveContinueAndPreviousContent(void *a1, const char *a2, ...)
{
  return _[a1 shouldHaveContinueAndPreviousContent];
}

id objc_msgSend_shouldSyncCollectionID_(void *a1, const char *a2, ...)
{
  return [a1 shouldSyncCollectionID:];
}

id objc_msgSend_shouldSyncCollectionMembers(void *a1, const char *a2, ...)
{
  return _[a1 shouldSyncCollectionMembers];
}

id objc_msgSend_sideloadedItemCount(void *a1, const char *a2, ...)
{
  return _[a1 sideloadedItemCount];
}

id objc_msgSend_signalWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 signalWithCompletion:];
}

id objc_msgSend_sinfData(void *a1, const char *a2, ...)
{
  return _[a1 sinfData];
}

id objc_msgSend_sortAuthor(void *a1, const char *a2, ...)
{
  return _[a1 sortAuthor];
}

id objc_msgSend_sortDescriptorWithKey_ascending_(void *a1, const char *a2, ...)
{
  return [a1 sortDescriptorWithKey:ascending:];
}

id objc_msgSend_sortDescriptorsForMode_collectionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorsForMode:collectionID:");
}

id objc_msgSend_sortKey(void *a1, const char *a2, ...)
{
  return _[a1 sortKey];
}

id objc_msgSend_sortKeyForDefaultCollectionID_(void *a1, const char *a2, ...)
{
  return [a1 sortKeyForDefaultCollectionID:];
}

id objc_msgSend_sortKeyQueue(void *a1, const char *a2, ...)
{
  return _[a1 sortKeyQueue];
}

id objc_msgSend_sortMode(void *a1, const char *a2, ...)
{
  return _[a1 sortMode];
}

id objc_msgSend_sortOrder(void *a1, const char *a2, ...)
{
  return _[a1 sortOrder];
}

id objc_msgSend_sortTitle(void *a1, const char *a2, ...)
{
  return _[a1 sortTitle];
}

id objc_msgSend_sortUsingDescriptors_(void *a1, const char *a2, ...)
{
  return [a1 sortUsingDescriptors:];
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return [a1 sortedArrayUsingComparator:];
}

id objc_msgSend_sortedArrayUsingDescriptors_(void *a1, const char *a2, ...)
{
  return [a1 sortedArrayUsingDescriptors:];
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return [a1 sortedArrayUsingSelector:];
}

id objc_msgSend_sourceFilePath(void *a1, const char *a2, ...)
{
  return _[a1 sourceFilePath];
}

id objc_msgSend_sourceFileType(void *a1, const char *a2, ...)
{
  return _[a1 sourceFileType];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_startAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return _[a1 startAccessingSecurityScopedResource];
}

id objc_msgSend_startMonitoring(void *a1, const char *a2, ...)
{
  return _[a1 startMonitoring];
}

id objc_msgSend_startQuery(void *a1, const char *a2, ...)
{
  return _[a1 startQuery];
}

id objc_msgSend_startUpdateForAssets_completion_(void *a1, const char *a2, ...)
{
  return [a1 startUpdateForAssets:completion:];
}

id objc_msgSend_startWithUIManager_manifestResponseBlock_(void *a1, const char *a2, ...)
{
  return [a1 startWithUIManager:manifestResponseBlock:];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_stateStringDescription_(void *a1, const char *a2, ...)
{
  return [a1 stateStringDescription:];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return _[a1 status];
}

id objc_msgSend_statusForAssetID_(void *a1, const char *a2, ...)
{
  return [a1 statusForAssetID:];
}

id objc_msgSend_statusValueHidden(void *a1, const char *a2, ...)
{
  return _[a1 statusValueHidden];
}

id objc_msgSend_statusValueLocal(void *a1, const char *a2, ...)
{
  return _[a1 statusValueLocal];
}

id objc_msgSend_statusWithAssetID_state_progressValue_timeRemaining_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusWithAssetID:state:progressValue:timeRemaining:");
}

id objc_msgSend_stopAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return _[a1 stopAccessingSecurityScopedResource];
}

id objc_msgSend_stopQuery(void *a1, const char *a2, ...)
{
  return _[a1 stopQuery];
}

id objc_msgSend_storeAssetManager(void *a1, const char *a2, ...)
{
  return _[a1 storeAssetManager];
}

id objc_msgSend_storeDelegate(void *a1, const char *a2, ...)
{
  return _[a1 storeDelegate];
}

id objc_msgSend_storeID(void *a1, const char *a2, ...)
{
  return _[a1 storeID];
}

id objc_msgSend_storeId(void *a1, const char *a2, ...)
{
  return _[a1 storeId];
}

id objc_msgSend_storeItemCount(void *a1, const char *a2, ...)
{
  return _[a1 storeItemCount];
}

id objc_msgSend_storePlaylistID(void *a1, const char *a2, ...)
{
  return _[a1 storePlaylistID];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingPathComponent:];
}

id objc_msgSend_stringByEscapingSearchString_(void *a1, const char *a2, ...)
{
  return [a1 stringByEscapingSearchString:];
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return [a1 stringByReplacingOccurrencesOfString:withString:];
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return [a1 stringByTrimmingCharactersInSet:];
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return [a1 stringForKey:];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return [a1 subarrayWithRange:];
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return [a1 substringFromIndex:];
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return [a1 substringToIndex:];
}

id objc_msgSend_supplementalContentAssets(void *a1, const char *a2, ...)
{
  return _[a1 supplementalContentAssets];
}

id objc_msgSend_supplementalContentParent(void *a1, const char *a2, ...)
{
  return _[a1 supplementalContentParent];
}

id objc_msgSend_supplementalContentState(void *a1, const char *a2, ...)
{
  return _[a1 supplementalContentState];
}

id objc_msgSend_syncVersion(void *a1, const char *a2, ...)
{
  return _[a1 syncVersion];
}

id objc_msgSend_synchronousFileSizeForCacheItemRequest_(void *a1, const char *a2, ...)
{
  return [a1 synchronousFileSizeForCacheItemRequest:];
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return _[a1 systemTimeZone];
}

id objc_msgSend_taste(void *a1, const char *a2, ...)
{
  return _[a1 taste];
}

id objc_msgSend_tasteSyncedToStore(void *a1, const char *a2, ...)
{
  return _[a1 tasteSyncedToStore];
}

id objc_msgSend_temporaryAssetID(void *a1, const char *a2, ...)
{
  return _[a1 temporaryAssetID];
}

id objc_msgSend_testQueue(void *a1, const char *a2, ...)
{
  return _[a1 testQueue];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeRemaining(void *a1, const char *a2, ...)
{
  return _[a1 timeRemaining];
}

id objc_msgSend_timeZoneForSecondsFromGMT_(void *a1, const char *a2, ...)
{
  return [a1 timeZoneForSecondsFromGMT:];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _[a1 title];
}

id objc_msgSend_titleEditsSavedInLibraryOnly(void *a1, const char *a2, ...)
{
  return _[a1 titleEditsSavedInLibraryOnly];
}

id objc_msgSend_titleForDefaultCollectionID_(void *a1, const char *a2, ...)
{
  return [a1 titleForDefaultCollectionID:];
}

id objc_msgSend_togglePausedForAssetID_orTemporaryAssetID_(void *a1, const char *a2, ...)
{
  return [a1 togglePausedForAssetID:orTemporaryAssetID:];
}

id objc_msgSend_totalImportOperationsProcessed(void *a1, const char *a2, ...)
{
  return _[a1 totalImportOperationsProcessed];
}

id objc_msgSend_totalStorage(void *a1, const char *a2, ...)
{
  return _[a1 totalStorage];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_ubiquityCount(void *a1, const char *a2, ...)
{
  return _[a1 ubiquityCount];
}

id objc_msgSend_ubiquityErrorCount(void *a1, const char *a2, ...)
{
  return _[a1 ubiquityErrorCount];
}

id objc_msgSend_ubiquityStatusMonitor(void *a1, const char *a2, ...)
{
  return _[a1 ubiquityStatusMonitor];
}

id objc_msgSend_uiChildContext(void *a1, const char *a2, ...)
{
  return _[a1 uiChildContext];
}

id objc_msgSend_uiManagerProviderForAddingToWantToRead(void *a1, const char *a2, ...)
{
  return _[a1 uiManagerProviderForAddingToWantToRead];
}

id objc_msgSend_ui_persistentStoreCoordinator(void *a1, const char *a2, ...)
{
  return [a1 ui_persistentStoreCoordinator];
}

id objc_msgSend_unclaimedAssetIDs(void *a1, const char *a2, ...)
{
  return _[a1 unclaimedAssetIDs];
}

id objc_msgSend_unclaimedTemporaryAssetIDs(void *a1, const char *a2, ...)
{
  return _[a1 unclaimedTemporaryAssetIDs];
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return [a1 unionSet:];
}

id objc_msgSend_uniqueTitleForMyBooksCollection_(void *a1, const char *a2, ...)
{
  return [a1 uniqueTitleForMyBooksCollection];
}

id objc_msgSend_unknownAuthor(void *a1, const char *a2, ...)
{
  return _[a1 unknownAuthor];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongValue];
}

id objc_msgSend_updateAsset_coverArt_completion_(void *a1, const char *a2, ...)
{
  return [a1 updateAsset:coverArt:completion:];
}

id objc_msgSend_updateAsset_fromURL_completion_(void *a1, const char *a2, ...)
{
  return [a1 updateAsset:fromURL:completion:];
}

id objc_msgSend_updateAsset_isEphemeral_completion_(void *a1, const char *a2, ...)
{
  return [a1 updateAsset:isEphemeral:completion:];
}

id objc_msgSend_updateAsset_userEditedTitle_completion_(void *a1, const char *a2, ...)
{
  return [a1 updateAsset:userEditedTitle:completion:];
}

id objc_msgSend_updateAuthorForSeriesContainer_(void *a1, const char *a2, ...)
{
  return [a1 updateAuthorForSeriesContainer:];
}

id objc_msgSend_updateBook_withTitle_completion_(void *a1, const char *a2, ...)
{
  return [a1 updateBook:withTitle:completion:];
}

id objc_msgSend_updateCloudVersionFromCloudSyncVersions_inContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCloudVersionFromCloudSyncVersions:inContext:");
}

id objc_msgSend_updateCollectionMemberAssetLinksForAssetIDs_temporaryAssetIDs_moc_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCollectionMemberAssetLinksForAssetIDs:temporaryAssetIDs:moc:");
}

id objc_msgSend_updateCollectionMemberAssetLinksInMOCForUpgrade_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCollectionMemberAssetLinksInMOCForUpgrade:");
}

id objc_msgSend_updateDate(void *a1, const char *a2, ...)
{
  return _[a1 updateDate];
}

id objc_msgSend_updateDownloadStatus(void *a1, const char *a2, ...)
{
  return _[a1 updateDownloadStatus];
}

id objc_msgSend_updateExpiredSeriesForAssetAdamIDsWithTypes_(void *a1, const char *a2, ...)
{
  return [a1 updateExpiredSeriesForAssetAdamIDsWithTypes:];
}

id objc_msgSend_updateFetchDigest(void *a1, const char *a2, ...)
{
  return _[a1 updateFetchDigest];
}

id objc_msgSend_updateIsDownloadingSupplementalContentAndCombinedState_(void *a1, const char *a2, ...)
{
  return [a1 updateIsDownloadingSupplementalContentAndCombinedState:];
}

id objc_msgSend_updateLastModification(void *a1, const char *a2, ...)
{
  return _[a1 updateLastModification];
}

id objc_msgSend_updateLibraryAssetWithID_withLastOpenDate_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateLibraryAssetWithID:withLastOpenDate:completion:");
}

id objc_msgSend_updateMaxSortKeyWithMember_(void *a1, const char *a2, ...)
{
  return [a1 updateMaxSortKeyWithMember:];
}

id objc_msgSend_updateSeriesContainerSeriesStackAssetIDs_(void *a1, const char *a2, ...)
{
  return [a1 updateSeriesContainerSeriesStackAssetIDs];
}

id objc_msgSend_updateSeriesForAssetAdamIDsWithTypes_forceCheck_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSeriesForAssetAdamIDsWithTypes:forceCheck:");
}

id objc_msgSend_updateSeriesForSeriesAdamIDsWithTypes_forceCheck_(void *a1, const char *a2, ...)
{
  return [a1 updateSeriesForSeriesAdamIDsWithTypes:forceCheck:];
}

id objc_msgSend_updateSeriesRelationshipsForSeriesAsset_(void *a1, const char *a2, ...)
{
  return [a1 updateSeriesRelationshipsForSeriesAsset:];
}

id objc_msgSend_updateSeriesRelationshipsForSeriesContainer_(void *a1, const char *a2, ...)
{
  return [a1 updateSeriesRelationshipsForSeriesContainer:];
}

id objc_msgSend_updateSupplementalContentRelationship_(void *a1, const char *a2, ...)
{
  return [a1 updateSupplementalContentRelationship:];
}

id objc_msgSend_updateURL_completion_(void *a1, const char *a2, ...)
{
  return [a1 updateURL:completion:];
}

id objc_msgSend_updateWithStatus_(void *a1, const char *a2, ...)
{
  return [a1 updateWithStatus:];
}

id objc_msgSend_updateWithWaitingToBeDownloadable_(void *a1, const char *a2, ...)
{
  return [a1 updateWithWaitingToBeDownloadable:];
}

id objc_msgSend_updatedObjects(void *a1, const char *a2, ...)
{
  return _[a1 updatedObjects];
}

id objc_msgSend_updateiTunesUCollectionMembersForAssetIDs_temporaryAssetIDs_moc_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateiTunesUCollectionMembersForAssetIDs:temporaryAssetIDs:moc:");
}

id objc_msgSend_updatesFromLibraryAssets_annotations_(void *a1, const char *a2, ...)
{
  return [a1 updatesFromLibraryAssets:annotations:];
}

id objc_msgSend_updatesScheduleQueue(void *a1, const char *a2, ...)
{
  return _[a1 updatesScheduleQueue];
}

id objc_msgSend_upgradeAssetSortKeys(void *a1, const char *a2, ...)
{
  return _[a1 upgradeAssetSortKeys];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return _[a1 url];
}

id objc_msgSend_useFileCoordination(void *a1, const char *a2, ...)
{
  return _[a1 useFileCoordination];
}

id objc_msgSend_usePPTLaunchContent(void *a1, const char *a2, ...)
{
  return _[a1 usePPTLaunchContent];
}

id objc_msgSend_usePerformancePredicates(void *a1, const char *a2, ...)
{
  return _[a1 usePerformancePredicates];
}

id objc_msgSend_userCollectionsInManagedObjectContext_withError_(void *a1, const char *a2, ...)
{
  return [a1 userCollectionsInManagedObjectContext:withError:];
}

id objc_msgSend_userCollectionsOnMainQueueWithError_(void *a1, const char *a2, ...)
{
  return [a1 userCollectionsOnMainQueueWithError:];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_userUpdateDateFinished_ofKind_(void *a1, const char *a2, ...)
{
  return [a1 userUpdateDateFinished:ofKind:];
}

id objc_msgSend_usq_moc(void *a1, const char *a2, ...)
{
  return [a1 usq_moc];
}

id objc_msgSend_utiTypeForContentType_(void *a1, const char *a2, ...)
{
  return [a1 utiTypeForContentType:];
}

id objc_msgSend_validDownloadIDs(void *a1, const char *a2, ...)
{
  return _[a1 validDownloadIDs];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return [a1 valueForKey:];
}

id objc_msgSend_valueForKeyPath_(void *a1, const char *a2, ...)
{
  return [a1 valueForKeyPath:];
}

id objc_msgSend_valueWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 valueWithCompletion:];
}

id objc_msgSend_valueWithNonretainedObject_(void *a1, const char *a2, ...)
{
  return [a1 valueWithNonretainedObject:];
}

id objc_msgSend_verboseLoggingEnabled(void *a1, const char *a2, ...)
{
  return _[a1 verboseLoggingEnabled];
}

id objc_msgSend_versionNumber(void *a1, const char *a2, ...)
{
  return _[a1 versionNumber];
}

id objc_msgSend_versionNumberHumanReadable(void *a1, const char *a2, ...)
{
  return _[a1 versionNumberHumanReadable];
}

id objc_msgSend_viewMode(void *a1, const char *a2, ...)
{
  return _[a1 viewMode];
}

id objc_msgSend_waitForAssetID_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waitForAssetID:completion:");
}

id objc_msgSend_waitForBookWithAssetID_toBeDownloadableWithTimeout_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waitForBookWithAssetID:toBeDownloadableWithTimeout:completion:");
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 whitespaceAndNewlineCharacterSet];
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return [a1 willChangeValueForKey:];
}

id objc_msgSend_willDeleteAssets_completion_(void *a1, const char *a2, ...)
{
  return [a1 willDeleteAssets:completion:];
}

id objc_msgSend_workerChildContext(void *a1, const char *a2, ...)
{
  return _[a1 workerChildContext];
}

id objc_msgSend_wq_countOfBooksInContinueReadingIncludingExplicitContent_limit_onWorkerQueue_(void *a1, const char *a2, ...)
{
  return [a1 wq_countOfBooksInContinueReadingIncludingExplicitContent:limit:onWorkerQueue:];
}

id objc_msgSend_wq_dq_integrateClaimedAssetsReason_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wq_dq_integrateClaimedAssetsReason:context:");
}

id objc_msgSend_wq_dq_saveDatabaseContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wq_dq_saveDatabaseContext:");
}

id objc_msgSend_wq_reconcileDataSourceAssetsForReason_context_(void *a1, const char *a2, ...)
{
  return [a1 wq_reconcileDataSourceAssetsForReason:context:];
}

id objc_msgSend_wq_seedRecentsListWithRecentlyOpenedBooksNoOlderThanDate_limit_onWorkerQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wq_seedRecentsListWithRecentlyOpenedBooksNoOlderThanDate:limit:onWorkerQueue:");
}

id objc_msgSend_wq_seriesIDsToResetWithLibraryManagedObjectContext_(void *a1, const char *a2, ...)
{
  return [a1 wq_seriesIDsToResetWithLibraryManagedObjectContext:];
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return [a1 writeToFile:atomically:];
}

id objc_msgSend_writeToURL_atomically_(void *a1, const char *a2, ...)
{
  return [a1 writeToURL:atomically:];
}

id objc_msgSend_year(void *a1, const char *a2, ...)
{
  return _[a1 year];
}