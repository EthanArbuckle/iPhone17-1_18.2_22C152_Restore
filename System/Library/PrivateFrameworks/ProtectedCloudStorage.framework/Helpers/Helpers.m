void sub_100004F18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100004F84(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained syncUserRegistry];
}

void sub_100004FCC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setupSubscriptions];
}

void sub_100005304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  objc_sync_exit(v7);
  _Unwind_Resume(a1);
}

uint64_t sub_100005330(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100005340(uint64_t a1)
{
}

void sub_100005348(uint64_t a1)
{
  [*(id *)(a1 + 32) _onqueueSaveUserRegistryStats];
  objc_msgSend(*(id *)(a1 + 32), "setStats_dirty:", 0);
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void sub_1000053F0(id a1)
{
  id v1 = objc_alloc_init((Class)CKOperationConfiguration);
  uint64_t v2 = (void *)qword_100040E10;
  qword_100040E10 = (uint64_t)v1;

  [(id)qword_100040E10 setTimeoutIntervalForResource:120.0];
  v3 = (void *)qword_100040E10;
  [v3 setIsCloudKitSupportOperation:1];
}

void sub_1000054D8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = [*(id *)(a1 + 32) oslog];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109378;
    v13[1] = a2;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "accountStatusWithCompletionHandler: %d error: %@", (uint8_t *)v13, 0x12u);
  }

  if (a2 == 3)
  {
    v12 = [*(id *)(a1 + 32) oslog];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Stoping syncing", (uint8_t *)v13, 2u);
    }
  }
  else if (a2 == 1)
  {
    v7 = [*(id *)(a1 + 32) stats];
    v8 = (char *)[v7 lastfetchRecordZoneChangesAtStart] + 86400;
    time_t v9 = time(0);

    if ((uint64_t)v8 <= v9)
    {
      v10 = [*(id *)(a1 + 32) oslog];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Starting to sync", (uint8_t *)v13, 2u);
      }

      id v11 = [*(id *)(a1 + 32) syncUserRegistry];
    }
  }
}

void sub_100005888(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1000058A4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) container];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100005964;
  v3[3] = &unk_100038BA8;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  [v2 serverPreferredPushEnvironmentWithCompletionHandler:v3];

  objc_destroyWeak(&v4);
}

void sub_100005950(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100005964(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc((Class)APSConnection);
  uint64_t v5 = APSConnectionOverrideNamedDelegatePort;
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  v7 = [WeakRetained queue];
  id v8 = [v4 initWithEnvironmentName:v3 namedDelegatePort:v5 queue:v7];

  time_t v9 = (void *)qword_100040E20;
  qword_100040E20 = (uint64_t)v8;

  id v10 = objc_loadWeakRetained(a1);
  [(id)qword_100040E20 setDelegate:v10];

  id v11 = [@"com.apple.icloud-container." stringByAppendingString:@"com.apple.protectedcloudstorage.protectedcloudkeysyncing"];
  v13 = v11;
  v12 = +[NSArray arrayWithObjects:&v13 count:1];
  [(id)qword_100040E20 _setEnabledTopics:v12];
}

void sub_100005E50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,uint64_t a23,uint64_t a24,char a25)
{
}

void sub_100005EAC(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) userdb];
  uint64_t v2 = [v5 getConfigData:@"doneSubscription"];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100005F1C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = [WeakRetained oslog];
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Couldn't create database subscription; syncing is severely degraded: %@",
        buf,
        0xCu);
    }

    time_t v9 = [WeakRetained queue];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100006184;
    v11[3] = &unk_100038C20;
    v11[4] = WeakRetained;
    dispatch_sync(v9, v11);

    [WeakRetained checkErrorForRetryPause:v5];
    id v10 = [WeakRetained subscribeAction];
    [v10 trigger];
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "subscription completed", buf, 2u);
    }

    id v10 = [WeakRetained queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006104;
    block[3] = &unk_100038C20;
    block[4] = WeakRetained;
    dispatch_sync(v10, block);
  }
}

void sub_100006104(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userdb];
  id v1 = +[NSData dataWithBytes:"done" length:4];
  [v2 replaceConfigRecord:@"doneSubscription" data:v1];
}

void sub_100006184(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) userdb];
  [v1 deleteRecordID:@"doneSubscription"];
}

void sub_100006418(uint64_t a1)
{
  [*(id *)(a1 + 32) _onqueueDeleteServerChangeToken:@"serverChangeToken"];
  [*(id *)(a1 + 32) _onqueueDeleteServerChangeToken:@"MBserverChangeToken"];
  id v2 = [*(id *)(a1 + 32) userdb];
  [v2 deleteRecordID:@"doneSubscription"];
}

void sub_100006490(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) oslog];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v7 = 138412290;
    uint64_t v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Creating resyncing operation, finishing with %@", (uint8_t *)&v7, 0xCu);
  }

  id v4 = [*(id *)(a1 + 32) createPendingSyncOperation:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setCurrentSyncOperations:v4];
  id v5 = [*(id *)(a1 + 32) mainOperationQueue];
  v6 = [v4 actualOperation];
  [v5 addOperation:v6];
}

void sub_100006A60(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak((id *)(v5 - 144));
  _Unwind_Resume(a1);
}

void sub_100006AB8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v11 = WeakRetained;
  if (WeakRetained)
  {
    v12 = [WeakRetained oslog];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [v7 recordName];
      id v14 = [v7 zoneID];
      int v20 = 138412546;
      id v21 = v13;
      __int16 v22 = 2112;
      v23 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "received new record(%@) for: %@", (uint8_t *)&v20, 0x16u);
    }
    if (v9)
    {
      id v15 = [v11 oslog];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138412290;
        id v21 = v9;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Got CloudKit error: %@", (uint8_t *)&v20, 0xCu);
      }
LABEL_11:

      goto LABEL_12;
    }
    v16 = [v7 zoneID];
    v17 = [v11 mobileBackupRecordZoneID];
    unsigned int v18 = [v16 isEqual:v17];

    if (!v18)
    {
      id v15 = [v11 oslog];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v19 = [v7 zoneID];
        int v20 = 138412290;
        id v21 = v19;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "got update for unknown zone: %@", (uint8_t *)&v20, 0xCu);
      }
      goto LABEL_11;
    }
    [v11 saveEscrowChange:v8];
  }
LABEL_12:
}

void sub_100006CF4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = [WeakRetained oslog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [v3 recordName];
      int v13 = 138412290;
      id v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Record deleted: %@", (uint8_t *)&v13, 0xCu);
    }
    id v8 = [v3 zoneID];
    id v9 = [v5 mobileBackupRecordZoneID];
    unsigned int v10 = [v8 isEqual:v9];

    if (v10)
    {
      [v5 deleteEscrowID:v3];
    }
    else
    {
      id v11 = [v5 oslog];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = [v3 zoneID];
        int v13 = 138412290;
        id v14 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "got delete for unknown zone: %@", (uint8_t *)&v13, 0xCu);
      }
    }
  }
}

void sub_100006E90(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v13 = WeakRetained;
  if (WeakRetained)
  {
    if (v11)
    {
      id v14 = [v11 domain];
      unsigned int v15 = [v14 isEqualToString:CKErrorDomain];

      v16 = [v13 oslog];
      BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      if (v15)
      {
        if (v17)
        {
          int v22 = 138412546;
          id v23 = v11;
          __int16 v24 = 2112;
          id v25 = v9;
          unsigned int v18 = "Got CloudKit error while fetching: %@ for zone:%@";
LABEL_13:
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v22, 0x16u);
        }
      }
      else if (v17)
      {
        int v22 = 138412546;
        id v23 = v11;
        __int16 v24 = 2112;
        id v25 = v9;
        unsigned int v18 = "Got other error: %@for zone:%@";
        goto LABEL_13;
      }

      goto LABEL_15;
    }
    v19 = [WeakRetained oslog];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412546;
      id v23 = v9;
      __int16 v24 = 2112;
      id v25 = v10;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Finished fetching changes for %@ with change token %@", (uint8_t *)&v22, 0x16u);
    }

    if (v10)
    {
      int v20 = [v13 mobileBackupRecordZoneID];
      unsigned int v21 = [v9 isEqual:v20];

      if (v21) {
        [v13 saveServerChangeToken:v10 forKey:@"MBserverChangeToken"];
      }
    }
  }
LABEL_15:
}

void sub_10000709C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    v6 = [WeakRetained oslog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "fetchRecordzoneChangesCompletionBlock error: %@", buf, 0xCu);
    }
  }
  id v7 = [v5 stats];
  objc_msgSend(v7, "setFetchRecordZoneChanges:", (char *)objc_msgSend(v7, "fetchRecordZoneChanges") + 1);

  [v5 flushStats];
  id v8 = [v5 oslog];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Finished fetching changes with error: %@", buf, 0xCu);
  }

  [*(id *)(a1 + 32) setError:v3];
  id v9 = [v5 mainOperationQueue];
  [v9 addOperation:*(void *)(a1 + 32)];

  if (!v3)
  {
    id v10 = [v5 queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100007280;
    block[3] = &unk_100038C20;
    block[4] = v5;
    dispatch_sync(v10, block);
  }
}

id sub_100007280(uint64_t a1)
{
  time_t v2 = time(0);
  id v3 = [*(id *)(a1 + 32) stats];
  [v3 setLastfetchRecordZoneChangesAtStart:v2];

  id v4 = *(void **)(a1 + 32);
  return [v4 _onqueueSaveUserRegistryStats];
}

void sub_100007524(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100007548(uint64_t a1)
{
  time_t v2 = [*(id *)(a1 + 32) pendingSyncOperations];

  id v3 = [*(id *)(a1 + 32) oslog];
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = [*(id *)(a1 + 32) pendingSyncOperations];
      v6 = [v5 finishOperation];
      int v24 = 138412290;
      id v25 = v6;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Returning pending syncing operation: %@", (uint8_t *)&v24, 0xCu);
    }
    id v7 = [*(id *)(a1 + 32) pendingSyncOperations];
    uint64_t v8 = [v7 finishOperation];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  else
  {
    if (v4)
    {
      id v11 = [*(id *)(a1 + 32) currentSyncOperations];
      int v24 = 138412290;
      id v25 = v11;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Creating new syncing operation, after %@", (uint8_t *)&v24, 0xCu);
    }
    v12 = [*(id *)(a1 + 32) createPendingSyncOperation:0];
    [*(id *)(a1 + 32) setPendingSyncOperations:v12];

    id v13 = [*(id *)(a1 + 32) currentSyncOperations];
    id v14 = [v13 finishOperation];

    if (v14)
    {
      unsigned int v15 = [*(id *)(a1 + 32) pendingSyncOperations];
      v16 = [v15 actualOperation];
      BOOL v17 = [*(id *)(a1 + 32) currentSyncOperations];
      unsigned int v18 = [v17 finishOperation];
      [v16 addDependency:v18];
    }
    v19 = [*(id *)(a1 + 32) pendingSyncOperations];
    uint64_t v20 = [v19 finishOperation];
    uint64_t v21 = *(void *)(*(void *)(a1 + 40) + 8);
    int v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;

    id v7 = [*(id *)(a1 + 32) mainOperationQueue];
    id v10 = [*(id *)(a1 + 32) pendingSyncOperations];
    id v23 = [v10 actualOperation];
    [v7 addOperation:v23];
  }
}

void sub_100007AC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location, char a20)
{
  _Block_object_dispose(&a20, 8);
  objc_destroyWeak((id *)(v20 - 104));
  _Unwind_Resume(a1);
}

void sub_100007B3C(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = [v2 oslog];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Beginning syncing operation %@", (uint8_t *)&buf, 0xCu);
  }

  if (*(unsigned char *)(a1 + 64))
  {
    BOOL v4 = [v2 queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000851C;
    block[3] = &unk_100038C20;
    block[4] = v2;
    dispatch_sync(v4, block);

    uint64_t v5 = *(void **)(a1 + 32);
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_10000860C;
    v59[3] = &unk_100038D38;
    objc_copyWeak(&v60, (id *)(a1 + 56));
    objc_copyWeak(&v61, &location);
    objc_copyWeak(&v62, (id *)(a1 + 48));
    v59[4] = *(void *)(a1 + 40);
    [v5 addExecutionBlock:v59];
    objc_destroyWeak(&v62);
    objc_destroyWeak(&v61);
    objc_destroyWeak(&v60);
  }
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v74 = 0x3032000000;
  v75 = sub_100005330;
  v76 = sub_100005340;
  id v77 = 0;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = sub_100005330;
  v57 = sub_100005340;
  id v58 = 0;
  id v7 = [v2 container];
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_100008728;
  v49[3] = &unk_100038D60;
  p_long long buf = &buf;
  v52 = &v53;
  uint64_t v8 = v6;
  v50 = v8;
  [v7 accountInfoWithCompletionHandler:v49];

  dispatch_time_t v9 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v8, v9))
  {
    id v10 = +[NSError errorWithDomain:kPCSErrorDomain code:75 userInfo:0];
    [*(id *)(a1 + 32) setError:v10];

    id v11 = [v2 mainOperationQueue];
    [v11 addOperation:*(void *)(a1 + 32)];
    goto LABEL_34;
  }
  if ([*(id *)(*((void *)&buf + 1) + 40) accountStatus] == (id)1)
  {
    if ([*(id *)(*((void *)&buf + 1) + 40) hasValidCredentials])
    {
      v12 = [v2 userdb];
      id v11 = [v12 dsid];

      if (!v11
        || ([v2 accounts],
            id v13 = objc_claimAutoreleasedReturnValue(),
            [v13 dsid],
            id v14 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v15 = [v11 isEqualToString:v14],
            v14,
            v13,
            (v15 & 1) == 0))
      {
        v16 = [v2 accounts];
        BOOL v17 = [v16 dsid];

        if (!v17)
        {
          v38 = [v2 oslog];
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v71 = 0;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "No DSID available. Quitting sync.", v71, 2u);
          }

          uint64_t v39 = kPCSErrorDomain;
          NSErrorUserInfoKey v65 = NSLocalizedDescriptionKey;
          CFStringRef v66 = @"No iCloud account";
          v40 = +[NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
          v41 = +[NSError errorWithDomain:v39 code:66 userInfo:v40];
          [*(id *)(a1 + 32) setError:v41];

          id v36 = [v2 mainOperationQueue];
          [v36 addOperation:*(void *)(a1 + 32)];
          goto LABEL_33;
        }
        unsigned int v18 = [v2 queue];
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472;
        v47[2] = sub_1000087C4;
        v47[3] = &unk_100038C70;
        v47[4] = v2;
        id v48 = v17;
        id v19 = v17;
        dispatch_sync(v18, v47);
      }
      uint64_t v20 = [v2 getServerChangeToken:@"MBserverChangeToken"];
      BOOL v21 = v20 == 0;

      if (v21)
      {
        v32 = [v2 oslog];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v71 = 0;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Creating zone before syncing", v71, 2u);
        }

        v33 = [v2 defaultCKConfiguration];
        int v22 = [v2 createZone:v33 withName:@"PCSUserRegistryMobileBackup"];
      }
      else
      {
        int v22 = 0;
      }
      v34 = objc_alloc_init(PCSRegistryOperation);
      v35 = v34;
      if (v22) {
        [(PCSRegistryOperation *)v34 addDependency:v22];
      }
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_100008860;
      v43[3] = &unk_100038D88;
      objc_copyWeak(&v46, (id *)(a1 + 56));
      id v36 = v22;
      id v44 = v36;
      id v45 = *(id *)(a1 + 32);
      [(PCSRegistryOperation *)v35 addExecutionBlock:v43];
      v37 = [v2 mainOperationQueue];
      [v37 addOperation:v35];

      objc_destroyWeak(&v46);
LABEL_33:

      goto LABEL_34;
    }
    v29 = [v2 oslog];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = v54[5];
      *(_DWORD *)v71 = 138412290;
      uint64_t v72 = v30;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "iCloud account in grey mode (%@)", v71, 0xCu);
    }

    v31 = +[NSError errorWithDomain:CKErrorDomain code:9 userInfo:0];
    [*(id *)(a1 + 32) setError:v31];

    id v11 = [v2 mainOperationQueue];
    [v11 addOperation:*(void *)(a1 + 32)];
  }
  else
  {
    id v23 = [v2 oslog];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = v54[5];
      *(_DWORD *)v71 = 138412290;
      uint64_t v72 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Not logged into iCloud (%@)", v71, 0xCu);
    }

    uint64_t v25 = v54[5];
    uint64_t v26 = kPCSErrorDomain;
    if (v25)
    {
      v69[0] = NSLocalizedDescriptionKey;
      v69[1] = NSUnderlyingErrorKey;
      v70[0] = @"No iCloud account";
      v70[1] = v25;
      +[NSDictionary dictionaryWithObjects:v70 forKeys:v69 count:2];
    }
    else
    {
      NSErrorUserInfoKey v67 = NSLocalizedDescriptionKey;
      CFStringRef v68 = @"No iCloud account";
      +[NSDictionary dictionaryWithObjects:&v68 forKeys:&v67 count:1];
    v27 = };
    v28 = +[NSError errorWithDomain:v26 code:66 userInfo:v27];
    [*(id *)(a1 + 32) setError:v28];

    id v11 = [v2 mainOperationQueue];
    [v11 addOperation:*(void *)(a1 + 32)];
  }
LABEL_34:

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&buf, 8);

  objc_destroyWeak(&location);
}

void sub_10000847C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,id location)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v50 - 176), 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_10000851C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) oslog];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) pendingSyncOperations];
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "syncing operation (%@) no longer pending", (uint8_t *)&v6, 0xCu);
  }
  BOOL v4 = [*(id *)(a1 + 32) pendingSyncOperations];
  [*(id *)(a1 + 32) setCurrentSyncOperations:v4];

  return [*(id *)(a1 + 32) setPendingSyncOperations:0];
}

void sub_10000860C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v5 = [WeakRetained oslog];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [v3 error];
    int v9 = 138412546;
    id v10 = v4;
    __int16 v11 = 2112;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Finished syncing operation %@: (%@)", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;
}

void sub_100008728(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000087C4(uint64_t a1)
{
  [*(id *)(a1 + 32) _onqueueDeleteServerChangeToken:@"MBserverChangeToken"];
  id v2 = [*(id *)(a1 + 32) oslog];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Caching DSID from Accounts", v5, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) userdb];
  [v4 setDsid:v3];
}

void sub_100008860(id *a1)
{
  id v2 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v4 = a1[4];
  if (v4 && ([v4 error], id v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    id v6 = [WeakRetained oslog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [a1[4] error];
      *(_DWORD *)long long buf = 138412290;
      unsigned int v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Zone creation failed for some reason: (%@), stopping MobileBackup sync", buf, 0xCu);
    }
    uint64_t v8 = [a1[4] error];
    [a1[5] setError:v8];

    id v9 = [WeakRetained mainOperationQueue];
    [v9 addOperation:a1[5]];
  }
  else
  {
    id v10 = [WeakRetained fetchAllChanges:0];
    id v11 = objc_alloc_init(PCSRegistryOperation);
    [(PCSRegistryOperation *)v11 addDependency:v10];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    _DWORD v13[2] = sub_100008A98;
    v13[3] = &unk_100038D88;
    objc_copyWeak(&v16, v2);
    id v9 = v10;
    id v14 = v9;
    id v15 = a1[5];
    [(PCSRegistryOperation *)v11 addExecutionBlock:v13];
    id v12 = [WeakRetained mainOperationQueue];
    [v12 addOperation:v11];

    objc_destroyWeak(&v16);
  }
}

void sub_100008A78(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100008A98(id *a1)
{
  id v2 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v4 = [a1[4] error];

  if (v4)
  {
    id v5 = [a1[4] error];
    [WeakRetained checkErrorForRetryPause:v5];

    id v6 = [a1[4] error];
    unsigned int v7 = [WeakRetained errorShouldCauseReset:v6];

    uint64_t v8 = [WeakRetained oslog];
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        id v10 = [a1[4] error];
        *(_DWORD *)long long buf = 138412290;
        uint64_t v30 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Fetch failed for some terrible reason: (%@), restarting entire sync process", buf, 0xCu);
      }
      [WeakRetained resyncDatabase:a1[5]];
    }
    else
    {
      if (v9)
      {
        BOOL v17 = [a1[4] error];
        *(_DWORD *)long long buf = 138412290;
        uint64_t v30 = v17;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Fetching failed for some reason: (%@), scheduling sync restart", buf, 0xCu);
      }
      unsigned int v18 = [WeakRetained resyncRegistryAction];
      [v18 trigger];

      id v19 = [a1[4] error];
      [a1[5] setError:v19];

      uint64_t v20 = [WeakRetained mainOperationQueue];
      [v20 addOperation:a1[5]];
    }
  }
  else
  {
    id v11 = [WeakRetained mobileBackup];
    unsigned __int8 v12 = [v11 isBackupEnabled];

    if (v12)
    {
      id v13 = [WeakRetained startBackupOfNewMobileBackupIdentities];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100008E70;
      v25[3] = &unk_100038D88;
      objc_copyWeak(&v28, v2);
      id v14 = v13;
      id v26 = v14;
      id v27 = a1[5];
      id v15 = +[NSBlockOperation blockOperationWithBlock:v25];
      id v16 = v15;
      if (v14)
      {
        [v15 addDependency:v14];
      }
      else
      {
        id v23 = [WeakRetained oslog];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "No new items to push; finishing",
            buf,
            2u);
        }
      }
      uint64_t v24 = [WeakRetained mainOperationQueue];
      [v24 addOperation:v16];

      objc_destroyWeak(&v28);
    }
    else
    {
      BOOL v21 = [WeakRetained oslog];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "MobileBackup is off; not pushing data to CloudKit",
          buf,
          2u);
      }

      int v22 = [WeakRetained mainOperationQueue];
      [v22 addOperation:a1[5]];
    }
  }
}

void sub_100008E4C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100008E70(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  uint64_t v3 = [WeakRetained oslog];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [a1[4] error];
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "startBackupOfNewMobileBackupIdentities as part of syncing done: (%@)", (uint8_t *)&v12, 0xCu);
  }
  id v5 = [a1[4] error];

  if (v5)
  {
    id v6 = [WeakRetained oslog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v7 = [a1[4] error];
      int v12 = 138412290;
      id v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Pushing new changes failed for some reason: (%@), scheduling retry", (uint8_t *)&v12, 0xCu);
    }
    uint64_t v8 = [a1[4] error];
    [WeakRetained checkErrorForRetryPause:v8];

    BOOL v9 = [WeakRetained resyncRegistryAction];
    [v9 trigger];
  }
  id v10 = [a1[4] error];
  [a1[5] setError:v10];

  id v11 = [WeakRetained mainOperationQueue];
  [v11 addOperation:a1[5]];
}

void sub_100009238(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) userdb];
  id v2 = [*(id *)(a1 + 40) recordID];
  uint64_t v3 = [v2 recordName];
  id v4 = [*(id *)(a1 + 48) encodedData];
  [v5 replaceRecordID:v3 data:v4 publicKey:*(void *)(a1 + 56)];
}

void sub_100009484(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) userdb];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 48) encodedData];
  [v4 replaceConfigRecord:v2 data:v3];
}

void sub_1000097A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000097CC(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) userdb];
  uint64_t v2 = [v5 getConfigData:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_1000099A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000099BC(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) userdb];
  uint64_t v2 = [v5 getConfigData:@"UserRegistryStats"];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100009C30(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) userdb];
  [v1 deleteRecordAll];
}

void sub_10000A4B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000A4E4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained oslog];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "CloudKit timeout complete", v3, 2u);
  }
}

void sub_10000A55C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mainOperationQueue];
  [v2 addOperation:*(void *)(a1 + 40)];
}

void sub_10000A7D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000A818(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v9 = [WeakRetained oslog];
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v10)
    {
      id v11 = *(void **)(a1 + 32);
      int v14 = 138412546;
      id v15 = v11;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Error creating zone (%@): %@", (uint8_t *)&v14, 0x16u);
    }

    [*(id *)(a1 + 40) setError:v7];
    [WeakRetained checkErrorForRetryPause:v7];
  }
  else
  {
    if (v10)
    {
      int v14 = 138412290;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Created zones: %@", (uint8_t *)&v14, 0xCu);
    }

    int v12 = [WeakRetained subscribeAction];
    [v12 trigger];
  }
  id v13 = [WeakRetained mainOperationQueue];
  [v13 addOperation:*(void *)(a1 + 40)];
}

void sub_10000AB50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000AB90(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v9 = [WeakRetained oslog];
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v10)
    {
      id v11 = [WeakRetained mobileBackupRecordZoneID];
      int v13 = 138412546;
      id v14 = v11;
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Error deleting zone (%@): %@", (uint8_t *)&v13, 0x16u);
    }
  }
  else if (v10)
  {
    int v13 = 138412290;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Deleted zones: %@", (uint8_t *)&v13, 0xCu);
  }

  [*(id *)(a1 + 32) setError:v7];
  int v12 = [WeakRetained mainOperationQueue];
  [v12 addOperation:*(void *)(a1 + 32)];
}

void sub_10000AE18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000AE30(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) userdb];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  id v4 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  [v4 encodeObject:v3 forKey:@"record"];

  id v5 = [v4 encodedData];
  id v6 = [v5 copy];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v7 setEscrowKey:v2 escrowBlob:v6];
}

void sub_10000AFBC(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) recordName];
  uint64_t v2 = [*(id *)(a1 + 40) userdb];
  [v2 deleteEscrowKey:v3];
}

void sub_10000B16C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000B188(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) userdb];
  uint64_t v2 = [v5 queryEscrowKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id sub_10000B1F4(void *a1)
{
  id v1 = a1;
  id v2 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v1 error:0];

  uint64_t v3 = [v2 decodeObjectOfClass:objc_opt_class() forKey:@"record"];

  return v3;
}

void sub_10000B6D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

void sub_10000B758(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v37 = a2;
  id v36 = a3;
  id v38 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v34 = a1;
  id v8 = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v9 = v8;
  if (WeakRetained)
  {
    from = (id *)(a1 + 48);
    v35 = v8;
    BOOL v10 = [WeakRetained oslog];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v53 = v38;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Finished uploading registry records (%@)", buf, 0xCu);
    }

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v11 = v37;
    id v12 = [v11 countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v47;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v47 != v13) {
            objc_enumerationMutation(v11);
          }
          __int16 v15 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          id v16 = [WeakRetained oslog];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            id v17 = [v15 recordID];
            unsigned int v18 = [v17 recordName];
            *(_DWORD *)long long buf = 138412290;
            id v53 = v18;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Stored record, saving in cache: %@", buf, 0xCu);
          }
          [WeakRetained saveEscrowChange:v15];
        }
        id v12 = [v11 countByEnumeratingWithState:&v46 objects:v51 count:16];
      }
      while (v12);
    }

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v19 = v36;
    id v20 = [v19 countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v43;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v43 != v21) {
            objc_enumerationMutation(v19);
          }
          [WeakRetained deleteEscrowID:*(void *)(*((void *)&v42 + 1) + 8 * (void)j)];
        }
        id v20 = [v19 countByEnumeratingWithState:&v42 objects:v50 count:16];
      }
      while (v20);
    }

    if (v38)
    {
      id v23 = [WeakRetained oslog];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v53 = v38;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Retriggering syncing due to error (%@)", buf, 0xCu);
      }

      uint64_t v24 = [WeakRetained resyncRegistryAction];
      [v24 trigger];

      [v35 setError:v38];
      uint64_t v25 = [WeakRetained mainOperationQueue];
      [v25 addOperation:v35];
    }
    else
    {
      uint64_t v26 = *(void *)(v34 + 32);
      if (v26)
      {
        id v27 = [WeakRetained pushMobileBackupRecordsToCloudKit:v26 removeObjects:&__NSArray0__struct];
        id v28 = objc_alloc_init(PCSRegistryOperation);
        [(PCSRegistryOperation *)v28 addDependency:v27];
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472;
        v39[2] = sub_10000BC3C;
        v39[3] = &unk_100038EC8;
        objc_copyWeak(&v41, from);
        id v29 = v27;
        id v40 = v29;
        [(PCSRegistryOperation *)v28 addExecutionBlock:v39];
        [v35 addDependency:v28];
        uint64_t v30 = [WeakRetained mainOperationQueue];
        [v30 addOperation:v35];

        v31 = [WeakRetained mainOperationQueue];
        [v31 addOperation:v28];

        objc_destroyWeak(&v41);
      }
      else
      {
        v32 = [WeakRetained mainOperationQueue];
        [v32 addOperation:v35];
      }
    }
    BOOL v9 = v35;
  }
  else
  {
    [v8 cancel];
  }
}

void sub_10000BC1C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000BC3C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [*(id *)(a1 + 32) error];
  [WeakRetained setError:v2];
}

id sub_10000BE44(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = PCSIdentityGetPublicKey();
  id v7 = +[NSString stringWithFormat:@"%@-%@%@", v5, v6, v4];

  id v8 = v7;
  BOOL v9 = (const char *)[v8 UTF8String];
  ccsha256_di();
  strlen(v9);
  ccdigest();
  BOOL v10 = (void *)_PCSCreateHexString();

  return v10;
}

void sub_10000C244(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void sub_10000C5D0(uint64_t a1, uint64_t a2)
{
  if (PCSServiceItemEscrowManateeIdentityByName())
  {
    uint64_t v4 = PCSIdentitySetCopyOrderedIdentities();
    if (v4)
    {
      CFArrayRef v5 = (const __CFArray *)v4;
      context[0] = _NSConcreteStackBlock;
      context[1] = 3221225472;
      context[2] = sub_10000C780;
      context[3] = &unk_100038F40;
      uint64_t v6 = *(void *)(a1 + 56);
      id v7 = *(void **)(a1 + 40);
      context[4] = *(void *)(a1 + 32);
      uint64_t v12 = v6;
      id v11 = v7;
      v15.length = CFArrayGetCount(v5);
      v15.id location = 0;
      CFArrayApplyFunction(v5, v15, (CFArrayApplierFunction)sub_10000E220, context);
      CFRelease(v5);

      return;
    }
    id v8 = [*(id *)(a1 + 32) oslog];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v14 = a2;
      BOOL v9 = "No identities for %@";
      goto LABEL_8;
    }
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) oslog];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v14 = a2;
      BOOL v9 = "Not doing MobileBackup for %@";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
    }
  }
}

void sub_10000C780(uint64_t a1, uint64_t a2)
{
  CFArrayRef v5 = [*(id *)(a1 + 32) mobileBackupKeyRecordIdentity:a2 version:@"-v2"];
  uint64_t v6 = [*(id *)(a1 + 32) queryEscrowName:v5];
  id v7 = v6;
  if (!v6 || ([v6 etag], id v8 = objc_claimAutoreleasedReturnValue(), v8, !v8))
  {
    BOOL v10 = *(void **)(a1 + 32);
    id v11 = [v10 mobileBackupRecordZoneID];
    BOOL v9 = [v10 keyRecord:a2 withName:v5 zone:v11];

    if ([*(id *)(a1 + 32) updateEscrowData:v9 escrowIdentity:*(void *)(a1 + 48) identity:a2])
    {
      [*(id *)(a1 + 40) addObject:v9];
      uint64_t v12 = [*(id *)(a1 + 32) oslog];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412546;
        uint64_t v15 = a2;
        __int16 v16 = 2112;
        id v17 = v5;
        uint64_t v13 = "Will store %@ as (%@)";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v14, 0x16u);
      }
    }
    else
    {
      uint64_t v12 = [*(id *)(a1 + 32) oslog];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412546;
        uint64_t v15 = a2;
        __int16 v16 = 2112;
        id v17 = v5;
        uint64_t v13 = "Couldn't escrow identity %@ (%@); skipping";
        goto LABEL_10;
      }
    }

    goto LABEL_12;
  }
  BOOL v9 = [*(id *)(a1 + 32) oslog];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    uint64_t v15 = a2;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Already stored %@ as (%@); skipping",
      (uint8_t *)&v14,
      0x16u);
  }
LABEL_12:
}

void sub_10000D1F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000D234(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) userdb];
  uint64_t v2 = [v5 queryEscrowKeys];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10000D998(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_10000D9D0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) oslog];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "queryMobileBackupKeysFromCloudKit: error: %@", (uint8_t *)&v13, 0xCu);
    }

    id v8 = [v6 copy];
    uint64_t v9 = *(void *)(a1 + 48);
LABEL_9:
    uint64_t v11 = *(void *)(v9 + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v8;

    goto LABEL_10;
  }
  if (v5)
  {
    uint64_t v10 = [*(id *)(a1 + 32) oslog];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134217984;
      id v14 = [v5 count];
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "queryMobileBackupKeysFromCloudKit got keys (count %lu)", (uint8_t *)&v13, 0xCu);
    }

    id v8 = [v5 copy];
    uint64_t v9 = *(void *)(a1 + 56);
    goto LABEL_9;
  }
LABEL_10:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10000DF60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000DF84(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) userdb];
  uint64_t v2 = [v5 queryEscrowKeys];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t sub_10000E220(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

void sub_10000E424(uint64_t a1)
{
  NSErrorUserInfoKey v5 = NSLocalizedDescriptionKey;
  uint64_t v2 = +[NSString stringWithFormat:@"Timed out waiting for a reply to %@ message with ID %@", *(void *)(a1 + 32), *(void *)(a1 + 40)];
  id v6 = v2;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  uint64_t v4 = +[NSError errorWithDomain:kPCSErrorDomain code:75 userInfo:v3];
  [*(id *)(a1 + 48) runReplyHandlerWithMessage:0 error:v4];
}

uint64_t sub_10000E7E8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000E7F8(uint64_t a1)
{
}

void sub_10000E800(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.ProtectedCloudStorage.MessagerRegistration", 0);
  uint64_t v2 = (void *)qword_100040E30;
  qword_100040E30 = (uint64_t)v1;

  qword_100040E38 = objc_opt_new();
  _objc_release_x1();
}

void sub_10000E85C(uint64_t a1)
{
  uint64_t v2 = [(id)qword_100040E38 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v5 = [objc_alloc((Class)objc_opt_class()) initWithServiceName:*(void *)(a1 + 32)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      id v8 = (void *)qword_100040E38;
      objc_msgSend(v8, "setObject:forKeyedSubscript:");
    }
  }
}

id sub_10000EB4C(uint64_t a1)
{
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
  id result = [*(id *)(a1 + 32) serviceDelegateSet];
  if ((result & 1) == 0)
  {
    uint64_t v3 = [*(id *)(a1 + 32) service];
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = [v4 internalQueue];
    [v3 addDelegate:v4 queue:v5];

    uint64_t v6 = *(void **)(a1 + 32);
    return [v6 setServiceDelegateSet:1];
  }
  return result;
}

void sub_10000ECA4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) service];
  if (!v2) {
    sub_1000257C8();
  }

  uint64_t v3 = *(void **)(a1 + 40);
  if (!v3) {
    sub_1000257F4();
  }
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 56), v3);
  uint64_t v4 = [*(id *)(a1 + 32) service];
  id v5 = [v4 devices];

  if (!v5)
  {
    id v7 = (void *)qword_100040ED8;
    if (!os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    id v8 = *(void **)(a1 + 32);
    id WeakRetained = v7;
    uint64_t v9 = [v8 service];
    *(_DWORD *)uint64_t v16 = 138412290;
    *(void *)&v16[4] = v9;
    uint64_t v10 = "IDS Service %@ returned nil for devices array";
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, WeakRetained, OS_LOG_TYPE_DEFAULT, v10, v16, 0xCu);

    goto LABEL_11;
  }
  if (![v5 count])
  {
    uint64_t v11 = (void *)qword_100040ED8;
    if (!os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    uint64_t v12 = *(void **)(a1 + 32);
    id WeakRetained = v11;
    uint64_t v9 = [v12 service];
    *(_DWORD *)uint64_t v16 = 138412290;
    *(void *)&v16[4] = v9;
    uint64_t v10 = "IDS Service %@ returned an empty devices array";
    goto LABEL_10;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  [WeakRetained updatedIDSDevices:v5];
LABEL_11:

LABEL_12:
  if ((objc_msgSend(*(id *)(a1 + 32), "serviceDelegateSet", *(_OWORD *)v16) & 1) == 0)
  {
    int v13 = [*(id *)(a1 + 32) service];
    id v14 = *(void **)(a1 + 32);
    uint64_t v15 = [v14 internalQueue];
    [v13 addDelegate:v14 queue:v15];

    [*(id *)(a1 + 32) setServiceDelegateSet:1];
  }
}

void sub_10000EFF0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3)
  {
    uint64_t v4 = [v3 idsDeviceIdentifier];
    id v5 = +[NSSet setWithObject:v4];
  }
  else
  {
    id v5 = +[NSSet setWithObject:IDSDefaultPairedDevice];
  }
  v42[0] = IDSSendMessageOptionTimeoutKey;
  uint64_t v6 = +[NSNumber numberWithDouble:*(double *)(a1 + 72)];
  v43[0] = v6;
  v43[1] = &__kCFBooleanTrue;
  v42[1] = IDSSendMessageOptionForceLocalDeliveryKey;
  v42[2] = IDSSendMessageOptionExpectsPeerResponseKey;
  id v7 = +[NSNumber numberWithBool:v2 != 0];
  v43[2] = v7;
  id v8 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:3];

  uint64_t v9 = [*(id *)(a1 + 40) service];
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 80);
  id v36 = 0;
  id v37 = 0;
  unsigned int v12 = [v9 sendMessage:v10 toDestinations:v5 priority:v11 options:v8 identifier:&v37 error:&v36];
  id v13 = v37;
  id v14 = v36;

  if (v12)
  {
    uint64_t v15 = qword_100040ED8;
    if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(a1 + 56);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v39 = v16;
      __int16 v40 = 2112;
      id v41 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Sent %@ message with IDS UUID %@", buf, 0x16u);
    }
    if (v2)
    {
      uint64_t v30 = _NSConcreteStackBlock;
      uint64_t v31 = 3221225472;
      v32 = sub_10000F3D0;
      v33 = &unk_100038C70;
      uint64_t v34 = *(void *)(a1 + 40);
      id v17 = v13;
      id v35 = v17;
      unsigned int v18 = objc_retainBlock(&v30);
      id v19 = [PCSIDSReplyContext alloc];
      double v20 = *(double *)(a1 + 72) + 30.0;
      uint64_t v21 = objc_msgSend(*(id *)(a1 + 40), "internalQueue", v30, v31, v32, v33, v34);
      int v22 = [(PCSIDSReplyContext *)v19 initWithTimeout:v21 queue:*(void *)(a1 + 56) logDescription:v17 sentID:*(void *)(a1 + 64) replyHandler:v18 completion:v20];

      id v23 = [*(id *)(a1 + 40) pendingReplies];
      [v23 setObject:v22 forKeyedSubscript:v17];

      uint64_t v24 = [*(id *)(a1 + 40) pendingReplies];
      id v25 = [v24 count];

      if (v25 == (id)1)
      {
        uint64_t v26 = (void *)os_transaction_create();
        [*(id *)(a1 + 40) setTransaction:v26];
      }
    }
  }
  else
  {
    uint64_t v27 = *(void *)(a1 + 64);
    if (v27)
    {
      (*(void (**)(uint64_t, void, id))(v27 + 16))(v27, 0, v14);
    }
    else
    {
      id v28 = qword_100040ED8;
      if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v29 = *(void *)(a1 + 56);
        *(_DWORD *)long long buf = 138412546;
        uint64_t v39 = v29;
        __int16 v40 = 2112;
        id v41 = v14;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Error occurred sending %@ message with no replyHandler: %@", buf, 0x16u);
      }
    }
  }
}

void sub_10000F3D0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) pendingReplies];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];

  uint64_t v3 = [*(id *)(a1 + 32) pendingReplies];
  id v4 = [v3 count];

  if (!v4)
  {
    id v5 = *(void **)(a1 + 32);
    [v5 setTransaction:0];
  }
}

void sub_10000F640(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) fromID];
  uint64_t v3 = +[NSSet setWithObject:v2];

  id v4 = [*(id *)(a1 + 32) idsContext];
  id v5 = [v4 outgoingResponseIdentifier];

  if (v5)
  {
    v31[0] = IDSSendMessageOptionTimeoutKey;
    uint64_t v6 = +[NSNumber numberWithDouble:*(double *)(a1 + 64)];
    v32[0] = v6;
    v32[1] = &__kCFBooleanTrue;
    v31[1] = IDSSendMessageOptionForceLocalDeliveryKey;
    v31[2] = IDSSendMessageOptionPeerResponseIdentifierKey;
    v32[2] = v5;
    id v7 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:3];

    id v8 = [*(id *)(a1 + 40) service];
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 72);
    id v25 = 0;
    id v26 = 0;
    unsigned __int8 v11 = [v8 sendMessage:v9 toDestinations:v3 priority:v10 options:v7 identifier:&v26 error:&v25];
    id v12 = v26;
    id v13 = v25;

    if (v11)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        id v14 = *(void **)(a1 + 56);
        *(_DWORD *)long long buf = 138412546;
        id v28 = v14;
        __int16 v29 = 2112;
        id v30 = v12;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Sent %@ message with IDS UUID %@", buf, 0x16u);
      }
    }
    else
    {
      double v20 = (void *)qword_100040ED8;
      if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = *(void **)(a1 + 32);
        int v22 = v20;
        id v23 = [v21 idsContext];
        uint64_t v24 = [v23 incomingResponseIdentifier];
        *(_DWORD *)long long buf = 138412546;
        id v28 = v5;
        __int16 v29 = 2112;
        id v30 = v24;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Failed to send response with ID %@ to message with ID %@", buf, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v15 = (void *)qword_100040ED8;
    if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void **)(a1 + 32);
      id v17 = v15;
      unsigned int v18 = [v16 idsContext];
      id v19 = [v18 incomingResponseIdentifier];
      *(_DWORD *)long long buf = 138412290;
      id v28 = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Failed to get response ID from original message id %@; dropping reply",
        buf,
        0xCu);
    }
    id v12 = 0;
    id v13 = 0;
  }
}

void sub_100010514(uint64_t a1)
{
  unsigned int v2 = objc_msgSend(*(id *)(a1 + 32), "_onQueue_isReachable");
  if (*(void *)(a1 + 40))
  {
    uint64_t v3 = (void *)IDSCopyIDForDevice();
    id v4 = [*(id *)(a1 + 32) idsDeviceIdentifier];
    id obj = v3;
    unsigned __int8 v5 = [v3 isEqualToString:v4];

    if ((v5 & 1) == 0)
    {
      id v7 = (void *)qword_100040ED8;
      if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = *(void **)(a1 + 32);
        uint64_t v9 = v7;
        uint64_t v10 = [v8 idsDeviceIdentifier];
        *(_DWORD *)long long buf = 138412546;
        uint64_t v27 = v10;
        __int16 v28 = 2112;
        __int16 v29 = v3;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Refusing to update device %@ because the new device has a different IDS device ID (got %@)", buf, 0x16u);
      }
      goto LABEL_20;
    }
    objc_msgSend(*(id *)(a1 + 32), "setIsConnected:", objc_msgSend(*(id *)(a1 + 40), "isConnected"));
    if ([*(id *)(a1 + 40) isActive]) {
      id v6 = [*(id *)(a1 + 40) isLocallyPaired];
    }
    else {
      id v6 = 0;
    }
    [*(id *)(a1 + 32) setIsActivePairedDevice:v6];
    [*(id *)(a1 + 32) setIsTombstone:0];
  }
  else
  {
    [*(id *)(a1 + 32) setIsConnected:0];
    [*(id *)(a1 + 32) setIsActivePairedDevice:0];
    [*(id *)(a1 + 32) setIsTombstone:1];
  }
  if (v2 == objc_msgSend(*(id *)(a1 + 32), "_onQueue_isReachable")) {
    return;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = [*(id *)(a1 + 32) observers];
  id v11 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = a1;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          id v17 = dispatch_get_global_queue(21, 0);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100010804;
          block[3] = &unk_100038C70;
          uint64_t v18 = *(void *)(v13 + 32);
          block[4] = v16;
          void block[5] = v18;
          dispatch_async(v17, block);
        }
      }
      id v12 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }
LABEL_20:
}

id sub_100010804(uint64_t a1)
{
  return [*(id *)(a1 + 32) reachabilityChangedForDevice:*(void *)(a1 + 40)];
}

void sub_1000108C4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 addObject:*(void *)(a1 + 40)];
}

void sub_1000109CC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 removeObject:*(void *)(a1 + 40)];
}

void sub_100010C0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100010C24(uint64_t a1)
{
  id result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_isReachable");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

void sub_1000115E0()
{
  id v1 = objc_alloc_init((Class)objc_opt_class());
  id v2 = (void *)qword_100040E48;
  qword_100040E48 = (uint64_t)v1;
}

void sub_10001182C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100011844(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = (void *)qword_100040ED8;
    if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = *(void **)(a1 + 32);
      id v8 = v6;
      uint64_t v9 = [v7 UUIDString];
      int v10 = 138412546;
      id v11 = v9;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "requestSyncStateForPairingIdentifier for %@ returned error %@", (uint8_t *)&v10, 0x16u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2 ^ 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100011C6C(id a1)
{
  qword_100040E58 = objc_alloc_init(PCSDeviceManager);
  _objc_release_x1();
}

void sub_100011E7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100011E94(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100011EA4(uint64_t a1)
{
}

uint64_t sub_100011EAC(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) activePairedDevice];
  return _objc_release_x1();
}

void sub_1000120B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000120D0(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) devices];
  uint64_t v2 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_1000122F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100012310(uint64_t a1)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "devices", 0);
  uint64_t v3 = [v2 allValues];

  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        uint64_t v9 = [v8 pairingID];
        if ([v9 isEqual:*(void *)(a1 + 40)])
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v8);

          goto LABEL_11;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

void sub_10001255C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100012574(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) devices];
  uint64_t v2 = [v5 allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100012690(uint64_t a1)
{
  uint64_t v2 = qword_100040ED8;
  if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEBUG)) {
    sub_100025820(v2);
  }
  long long v45 = objc_opt_new();
  long long v44 = objc_opt_new();
  __int16 v40 = objc_opt_new();
  long long v42 = objc_opt_new();
  id v41 = objc_opt_new();
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = *(id *)(a1 + 32);
  id v3 = [obj countByEnumeratingWithState:&v49 objects:v59 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v50;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v50 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v49 + 1) + 8 * (void)v6);
        id v8 = (void *)IDSCopyIDForDevice();
        [v45 addObject:v8];
        uint64_t v9 = (void *)qword_100040ED8;
        if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v27 = v9;
          unsigned int v28 = [v7 isActive];
          unsigned int v29 = [v7 isLocallyPaired];
          unsigned int v30 = [v7 isConnected];
          *(_DWORD *)long long buf = 138413058;
          v54 = v8;
          __int16 v55 = 1024;
          *(_DWORD *)v56 = v28;
          *(_WORD *)&v56[4] = 1024;
          *(_DWORD *)&v56[6] = v29;
          __int16 v57 = 1024;
          unsigned int v58 = v30;
          _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "Got device %@: isActive:%{BOOL}d isLocallyPaired:%{BOOL}d isConnected:%{BOOL}d", buf, 0x1Eu);
        }
        long long v10 = [*(id *)(a1 + 40) devices];
        long long v11 = [v10 objectForKeyedSubscript:v8];

        if (!v11)
        {
          long long v11 = [[PCSDevice alloc] initWithIDSDevice:v7];
          if (!v11) {
            goto LABEL_26;
          }
          uint64_t v16 = [*(id *)(a1 + 40) devices];
          [v16 setObject:v11 forKeyedSubscript:v8];

LABEL_17:
          uint64_t v15 = v44;
LABEL_19:
          [v15 addObject:v11];
          goto LABEL_20;
        }
        unsigned int v12 = [(PCSDevice *)v11 isTombstone];
        unsigned int v13 = [(PCSDevice *)v11 isConnected];
        unsigned int v14 = [v7 isConnected];
        [(PCSDevice *)v11 updateIDSDevice:v7];
        if (v12) {
          goto LABEL_17;
        }
        if (((v14 ^ 1 | v13) & 1) == 0)
        {
          uint64_t v15 = v42;
          goto LABEL_19;
        }
        if (((v14 | v13 ^ 1) & 1) == 0)
        {
          uint64_t v15 = v41;
          goto LABEL_19;
        }
LABEL_20:
        if ([(PCSDevice *)v11 isActivePairedDevice])
        {
          uint64_t v17 = [*(id *)(a1 + 40) activePairedDevice];
          if (!v17
            || (uint64_t v18 = (void *)v17,
                [*(id *)(a1 + 40) activePairedDevice],
                id v19 = objc_claimAutoreleasedReturnValue(),
                unsigned __int8 v20 = [v19 isEqual:v11],
                v19,
                v18,
                (v20 & 1) == 0))
          {
            long long v21 = (void *)qword_100040ED8;
            if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
            {
              long long v22 = *(void **)(a1 + 40);
              long long v23 = v21;
              long long v24 = [v22 activePairedDevice];
              id v25 = [v24 idsDeviceIdentifier];
              id v26 = [(PCSDevice *)v11 idsDeviceIdentifier];
              *(_DWORD *)long long buf = 138412546;
              v54 = v25;
              __int16 v55 = 2112;
              *(void *)v56 = v26;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Active paired device changed from %@ to %@", buf, 0x16u);
            }
            [*(id *)(a1 + 40) setActivePairedDevice:v11];
          }
        }
LABEL_26:

        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [obj countByEnumeratingWithState:&v49 objects:v59 count:16];
    }
    while (v4);
  }

  uint64_t v31 = [*(id *)(a1 + 40) activePairedDevice];
  if (v31)
  {
    v32 = (void *)v31;
    v33 = [*(id *)(a1 + 40) activePairedDevice];
    uint64_t v34 = [v33 idsDeviceIdentifier];
    unsigned __int8 v35 = [v45 containsObject:v34];

    if ((v35 & 1) == 0) {
      [*(id *)(a1 + 40) setActivePairedDevice:0];
    }
  }
  id v36 = [*(id *)(a1 + 40) devices];
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_100012C0C;
  v46[3] = &unk_1000390F8;
  id v37 = v45;
  id v47 = v37;
  id v38 = v40;
  id v48 = v38;
  [v36 enumerateKeysAndObjectsUsingBlock:v46];

  uint64_t v39 = [*(id *)(a1 + 40) delegate];
  if ([v44 count] || objc_msgSend(v38, "count")) {
    [v39 newDevices:v44 removedDevices:v38];
  }
  if ([v42 count]) {
    [v39 devicesAreNowNearby:v42];
  }
  if ([v41 count]) {
    [v39 devicesAreNoLongerNearby:v41];
  }
}

void sub_100012C0C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (([*(id *)(a1 + 32) containsObject:a2] & 1) == 0
    && ([v5 isTombstone] & 1) == 0)
  {
    [*(id *)(a1 + 40) addObject:v5];
    [v5 updateIDSDevice:0];
  }
}

BOOL sub_100013224(id a1, id a2, unint64_t a3, BOOL *a4)
{
  return objc_msgSend(a2, "isFinished", a3, a4) ^ 1;
}

void sub_10001385C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    [v3 handleIncomingMessage:*(void *)(a1 + 40)];
  }
  else
  {
    id v5 = qword_100040ED8;
    if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Failed to get sync connection for IDS device %@; dropping message",
        (uint8_t *)&v7,
        0xCu);
    }
  }
}

void sub_100013A2C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_100013A40(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained peers];
    id v5 = [a1[4] idsDeviceIdentifier];
    uint64_t v6 = [v4 objectForKeyedSubscript:v5];

    if (!v6)
    {
      int v7 = [PCSPeerSyncing alloc];
      id v8 = a1[4];
      uint64_t v9 = [v3 manager];
      uint64_t v6 = [(PCSPeerSyncing *)v7 initWithDevice:v8 syncingManager:v9];

      if (v6)
      {
        long long v10 = [v3 peers];
        long long v11 = [a1[4] idsDeviceIdentifier];
        [v10 setObject:v6 forKey:v11];
      }
    }
    [(PCSPeerSyncing *)v6 updateLastSeen];
    unsigned int v12 = [v3 queue];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100013BD8;
    v15[3] = &unk_100038F18;
    id v13 = a1[5];
    uint64_t v16 = v6;
    id v17 = v13;
    unsigned int v14 = v6;
    [v12 addOperationWithBlock:v15];
  }
}

uint64_t sub_100013BD8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_100013CD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  objc_destroyWeak((id *)(v8 - 24));
  _Unwind_Resume(a1);
}

void sub_100013CF8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained peers];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 count] != 0;
}

void sub_100013E58(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_100013E6C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained peers];
  id v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];

  id v5 = [*(id *)(a1 + 40) queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100013F50;
  v7[3] = &unk_1000391D8;
  id v8 = v4;
  char v9 = *(unsigned char *)(a1 + 56);
  id v6 = v4;
  [v5 addOperationWithBlock:v7];
}

id sub_100013F50(uint64_t a1)
{
  return [*(id *)(a1 + 32) checkSyncing:*(unsigned __int8 *)(a1 + 40)];
}

void sub_100014060(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100014074(uint64_t a1)
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained peers];

  id v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v10 = objc_loadWeakRetained(v2);
        long long v11 = [v10 peers];
        unsigned int v12 = [v11 objectForKeyedSubscript:v9];

        id v13 = [*(id *)(a1 + 32) queue];
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_100014250;
        v15[3] = &unk_1000391D8;
        id v16 = v12;
        char v17 = *(unsigned char *)(a1 + 48);
        id v14 = v12;
        [v13 addOperationWithBlock:v15];
      }
      id v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }
}

id sub_100014250(uint64_t a1)
{
  uint64_t v2 = qword_100040ED8;
  if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "syncing  with: %@", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(a1 + 32) checkSyncing:*(unsigned __int8 *)(a1 + 40)];
}

void sub_100014718(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) isReachable]) {
    [v3 checkSyncing:0];
  }
}

void sub_10001492C(id a1, PCSPeerSyncing *a2)
{
}

void sub_100015D48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v13);
  _Unwind_Resume(a1);
}

void sub_100015D74(uint64_t a1, uint64_t a2)
{
}

void sub_100015D80(uint64_t a1)
{
}

void sub_100015D88(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  [WeakRetained setPendingRequest:0];

  id v8 = qword_100040ED8;
  if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
  {
    int v32 = 138412546;
    id v33 = v5;
    __int16 v34 = 2112;
    id v35 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "reply from initital checkin: %@ error: %@", (uint8_t *)&v32, 0x16u);
  }
  if (v6)
  {
    uint64_t v9 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
    [v9 keyFailure:0];
  }
  else
  {
    id v10 = [v5 message];
    long long v11 = [v10 objectForKeyedSubscript:@"v"];
    id v12 = [v11 intValue];
    id v13 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
    [v13 setClientVersion:v12];

    id v14 = [v5 message];
    uint64_t v9 = [v14 objectForKeyedSubscript:@"h"];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      uint64_t v9 = 0;
    }
    uint64_t v15 = [v5 message];
    id v16 = [v15 objectForKeyedSubscript:@"r"];
    unsigned int v17 = [v16 intValue];

    switch(v17)
    {
      case 3u:
        long long v20 = qword_100040ED8;
        if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v32) = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Client requests new protocol", (uint8_t *)&v32, 2u);
        }
        id v21 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
        long long v22 = [v21 syncingManager];
        id v23 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
        long long v24 = [v23 client];
        [v22 updateClient:v24];

        id v25 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
        id v26 = [v25 client];
        [v26 setProtocolVersion:1];

        id v27 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
        unsigned int v28 = [v27 syncingManager];
        id v29 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
        unsigned int v30 = [v29 client];
        [v28 saveClient:v30];

        id v19 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
        [v19 sendKeys];
        break;
      case 2u:
        uint64_t v31 = qword_100040ED8;
        if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
        {
          int v32 = 138412290;
          id v33 = v9;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Client requests updating keys: have %@", (uint8_t *)&v32, 0xCu);
        }
        id v19 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
        [v19 sendKeysOld];
        break;
      case 1u:
        long long v18 = qword_100040ED8;
        if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
        {
          int v32 = 138412290;
          id v33 = v9;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Client have keys: %@", (uint8_t *)&v32, 0xCu);
        }
        id v19 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
        [v19 haveKeys:v9];
        break;
      default:
        id v19 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
        [v19 keyFailure:v9];
        break;
    }
  }
}

void sub_1000165A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v11);
  _Unwind_Resume(a1);
}

void sub_1000165D4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  [WeakRetained setPendingRequest:0];
  [WeakRetained setKeys:0];
  id v8 = qword_100040ED8;
  if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412546;
    id v17 = v5;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "reply from send key: %@ error: %@", (uint8_t *)&v16, 0x16u);
  }
  if (v6)
  {
    [WeakRetained keyFailure:0];
  }
  else
  {
    uint64_t v9 = [v5 message];
    id v10 = [v9 objectForKeyedSubscript:@"h"];

    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        id v10 = 0;
      }
    }
    long long v11 = [v5 message];
    id v12 = [v11 objectForKeyedSubscript:@"r"];
    unsigned int v13 = [v12 intValue];

    id v14 = qword_100040ED8;
    BOOL v15 = os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT);
    if (v13 == 1)
    {
      if (v15)
      {
        int v16 = 138412290;
        id v17 = v10;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "client confirms it have key: %@", (uint8_t *)&v16, 0xCu);
      }
      [WeakRetained haveKeys:v10];
    }
    else
    {
      if (v15)
      {
        LOWORD(v16) = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "client failed", (uint8_t *)&v16, 2u);
      }
      [WeakRetained keyFailure:v10];
    }
  }
}

void sub_100016BAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
}

void sub_100016BEC(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "pcsKeyData:");
  if (v3)
  {
    [*(id *)(a1 + 40) addObject:v3];
    [*(id *)(a1 + 48) addObject:v4];
  }
}

void sub_100016C68(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v8 = qword_100040ED8;
    if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 138412546;
      id v29 = v5;
      __int16 v30 = 2112;
      id v31 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "reply from send key: %@ error: %@", (uint8_t *)&v28, 0x16u);
    }
    if (v6)
    {
      [WeakRetained keyFailure:0];
      [WeakRetained setPendingRequest:0];
      uint64_t v9 = [WeakRetained syncingManager];
      id v10 = [WeakRetained[2] idsDeviceIdentifier];
      [v9 signalComplete:v10];
    }
    else
    {
      long long v11 = [v5 message];
      id v12 = [v11 objectForKeyedSubscript:@"r"];
      unsigned int v13 = [v12 intValue];

      id v14 = qword_100040ED8;
      BOOL v15 = os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT);
      if (v13)
      {
        if (v15)
        {
          int v28 = 67109120;
          LODWORD(v29) = v13;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "client failed: %d", (uint8_t *)&v28, 8u);
        }
      }
      else
      {
        if (v15)
        {
          int v16 = *(void **)(a1 + 32);
          id v17 = v14;
          unsigned int v18 = [v16 count];
          int v28 = 67109120;
          LODWORD(v29) = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "client confirms stored keys: %u", (uint8_t *)&v28, 8u);
        }
        id v19 = (void *)qword_100040ED8;
        if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
        {
          long long v20 = v19;
          id v21 = [WeakRetained device];
          long long v22 = [v21 idsDeviceIdentifier];
          id v23 = *(void **)(a1 + 32);
          int v28 = 138412546;
          id v29 = v22;
          __int16 v30 = 2112;
          id v31 = v23;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "device: %@ type: 1 keys: %@", (uint8_t *)&v28, 0x16u);
        }
        long long v24 = [WeakRetained syncingManager];
        id v25 = [WeakRetained device];
        id v26 = [v25 idsDeviceIdentifier];
        [v24 updateSyncedKeysToDevice:v26 type:1 keys:*(void *)(a1 + 32)];
      }
      uint64_t v27 = *(void *)(a1 + 40);
      if (v27) {
        [WeakRetained sendSomeKeys:v27 dsid:*(void *)(a1 + 48)];
      }
      else {
        [WeakRetained sendCurrentKeys:*(void *)(a1 + 48)];
      }
    }
  }
}

void sub_100017124(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100017140(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = PCSIdentitySetCopyCurrentIdentityWithError();
  if (v4)
  {
    id v5 = (const void *)v4;
    [*(id *)(a1 + 32) setObject:PCSIdentityGetPublicKey() forKeyedSubscript:a2];
    CFRelease(v5);
  }
}

void sub_1000171B8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = qword_100040ED8;
  if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "set current: %@", (uint8_t *)&v9, 0xCu);
  }
  if (WeakRetained)
  {
    [WeakRetained setPendingRequest:0];
    uint64_t v7 = [WeakRetained syncingManager];
    id v8 = [WeakRetained[2] idsDeviceIdentifier];
    [v7 signalComplete:v8];

    CFRelease(*(CFTypeRef *)(a1 + 40));
  }
}

void sub_100017730(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100017754(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v6)
    {
      uint64_t v8 = qword_100040ED8;
      if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v20) = 138412290;
        *(void *)((char *)&v20 + 4) = v6;
        int v9 = "Failed to send message to peer: %@, trying later";
        id v10 = v8;
        uint32_t v11 = 12;
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v20, v11);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
    id v12 = [v5 message];
    unsigned int v13 = [v12 objectForKeyedSubscript:@"r"];
    unsigned int v14 = [v13 intValue];

    BOOL v15 = qword_100040ED8;
    BOOL v16 = os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        LODWORD(v20) = 67109120;
        DWORD1(v20) = v14;
        int v9 = "Other failure to store iCDP state: %d, trying later";
        id v10 = v15;
        uint32_t v11 = 8;
        goto LABEL_8;
      }
LABEL_9:
      objc_msgSend(WeakRetained, "setPendingRequest:", 0, v20);
      id v17 = [WeakRetained syncingManager];
      unsigned int v18 = [WeakRetained[2] idsDeviceIdentifier];
      [v17 signalComplete:v18];

      goto LABEL_10;
    }
    if (v16)
    {
      int v19 = *(unsigned __int8 *)(a1 + 56);
      LODWORD(v20) = 67109120;
      DWORD1(v20) = v19;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Peer confirmed iCDP state too: %d", (uint8_t *)&v20, 8u);
    }
    [WeakRetained setPeeriCDPStatus:*(unsigned __int8 *)(a1 + 56)];
    [WeakRetained setPeerCircleStatus:*(unsigned __int8 *)(a1 + 57)];
    [WeakRetained sendSomeKeys:*(void *)(a1 + 32) dsid:*(void *)(a1 + 40)];
  }
LABEL_10:
}

id sub_100018410(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) sendReply:a2 error:a4 toMessage:*(void *)(a1 + 40)];
}

id sub_100018660()
{
  if (qword_100040E70 != -1) {
    dispatch_once(&qword_100040E70, &stru_1000393F0);
  }
  v0 = (void *)qword_100040E68;
  return v0;
}

void sub_1000186B4(uint64_t a1)
{
  id WeakRetained = (dispatch_object_t *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_suspend(WeakRetained[7]);
    dispatch_object_t v3 = v2[3];
    if (v3)
    {
      id v4 = objc_retainBlock(v3);
      v15[0] = 0;
      v15[1] = v15;
      v15[2] = 0x3032000000;
      v15[3] = sub_10001888C;
      void v15[4] = sub_10001889C;
      BOOL v16 = v2[8];
      dispatch_object_t v5 = v2[8];
      v2[8] = 0;

      dispatch_object_t v6 = v2[6];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1000188A4;
      v12[3] = &unk_1000393D0;
      uint64_t v7 = v4;
      unsigned int v13 = v7;
      unsigned int v14 = v15;
      [v6 addOperationWithBlock:v12];

      _Block_object_dispose(v15, 8);
    }
    dispatch_time_t v8 = dispatch_time(0, 1000000000 * (void)v2[4]);
    int v9 = sub_100018660();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100018914;
    block[3] = &unk_100038C20;
    uint32_t v11 = v2;
    dispatch_after(v8, v9, block);
  }
}

void sub_100018874(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001888C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001889C(uint64_t a1)
{
}

void sub_1000188A4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  if (v4)
  {
    *(void *)(v3 + 40) = 0;
  }
}

void sub_100018914(uint64_t a1)
{
}

uint64_t sub_100018A1C(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 72) = *(unsigned char *)(result + 40) == 0;
  return result;
}

void sub_100018AF4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  dispatch_object_t v6 = WeakRetained;
  if (!*((void *)WeakRetained + 9) && !*((void *)WeakRetained + 8))
  {
    id v3 = [*(id *)(a1 + 32) label];
    [v3 UTF8String];
    uint64_t v4 = os_transaction_create();
    dispatch_object_t v5 = (void *)v6[8];
    v6[8] = v4;

    id WeakRetained = v6;
  }
  dispatch_source_merge_data(*((dispatch_source_t *)WeakRetained + 7), 1uLL);
}

void sub_100018CB0(id a1)
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("PCSDelayedActionQueue", v3);
  uint64_t v2 = (void *)qword_100040E68;
  qword_100040E68 = (uint64_t)v1;
}

void sub_100018FD4(id a1)
{
  qword_100040E80 = objc_alloc_init(PCSMetrics);
  _objc_release_x1();
}

void sub_1000194D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_100019500(uint64_t a1, uint64_t a2)
{
  if ((PCSServiceItemTypeIsManatee() & 1) == 0
    && ([*(id *)(a1 + 32) containsObject:a2] & 1) == 0)
  {
    id v23 = v4;
    uint64_t IndexByName = PCSServiceItemGetIndexByName();
    v32[0] = kSecClass;
    v32[1] = kSecAttrSecurityDomain;
    v33[0] = kSecClassInternetPassword;
    v33[1] = kPCSServiceName;
    CFStringRef v6 = kSecMatchLimitAll;
    v32[2] = kSecMatchLimit;
    void v32[3] = kSecAttrServer;
    uint64_t v7 = *(void *)(a1 + 40);
    v33[2] = kSecMatchLimitAll;
    v33[3] = v7;
    v33[4] = &__kCFBooleanTrue;
    v32[4] = kSecAttrSynchronizable;
    v32[5] = kSecAttrType;
    uint64_t v22 = IndexByName;
    dispatch_time_t v8 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
    v32[6] = kSecReturnPersistentRef;
    v33[5] = v8;
    v33[6] = &__kCFBooleanTrue;
    CFDictionaryRef v9 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:7];

    CFTypeRef result = 0;
    CFIndex Count = 0;
    if (!SecItemCopyMatching(v9, &result))
    {
      CFIndex Count = CFArrayGetCount((CFArrayRef)result);
      CFTypeRef v11 = result;
      if (result)
      {
        CFTypeRef result = 0;
        CFRelease(v11);
      }
      CFStringRef v6 = kSecMatchLimitAll;
    }
    v30[0] = kSecClass;
    v30[1] = kSecAttrSecurityDomain;
    v31[0] = kSecClassInternetPassword;
    v31[1] = kPCSServiceName;
    v30[2] = kSecMatchLimit;
    v30[3] = kSecAttrServer;
    uint64_t v12 = *(void *)(a1 + 40);
    v31[2] = v6;
    void v31[3] = v12;
    v31[4] = &__kCFBooleanTrue;
    v30[4] = kSecAttrSynchronizable;
    v30[5] = kSecAttrType;
    uint64_t v13 = +[NSNumber numberWithUnsignedInt:v22 | 0x10000];
    v30[6] = kSecReturnAttributes;
    v31[5] = v13;
    v31[6] = &__kCFBooleanTrue;
    CFDictionaryRef v14 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:7];

    CFTypeRef result = 0;
    if (!SecItemCopyMatching(v14, &result))
    {
      Count += CFArrayGetCount((CFArrayRef)result);
      if (*(_DWORD *)(a1 + 88) == 1)
      {
        CFArrayRef v15 = (const __CFArray *)result;
        context[0] = _NSConcreteStackBlock;
        context[1] = 3221225472;
        context[2] = sub_1000198A0;
        context[3] = &unk_100039438;
        int8x16_t v21 = *(int8x16_t *)(a1 + 40);
        id v16 = (id)v21.i64[0];
        int v28 = v22;
        long long v17 = *(_OWORD *)(a1 + 64);
        int8x16_t v25 = vextq_s8(v21, v21, 8uLL);
        long long v26 = v17;
        uint64_t v27 = *(void *)(a1 + 80);
        v34.length = CFArrayGetCount(v15);
        v34.id location = 0;
        CFArrayApplyFunction(v15, v34, (CFArrayApplierFunction)sub_10001A5B8, context);
      }
      CFTypeRef v18 = result;
      if (result)
      {
        CFTypeRef result = 0;
        CFRelease(v18);
      }
    }
    uint64_t v19 = +[NSString stringWithFormat:@"keycount_%u", v22];
    long long v20 = +[NSNumber numberWithLong:Count];
    [*(id *)(a1 + 56) setObject:v20 forKeyedSubscript:v19];

    uint64_t v4 = v23;
  }
}

uint64_t sub_1000198A0(uint64_t a1, CFDictionaryRef theDict)
{
  unsigned __int8 v4 = objc_msgSend(*(id *)(a1 + 32), "getKeyInfoWithDSID:service:publicKey:", *(void *)(a1 + 40), *(unsigned int *)(a1 + 72), CFDictionaryGetValue(theDict, kSecAttrAccount));
  if (v4) {
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  uint64_t v5 = CFDictionaryGetValue(theDict, kSecAttrIsNegative);
  if (v5
    && (dispatch_time_t v8 = (void *)v5, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [v8 BOOLValue])
  {
    uint64_t v6 = *(void *)(a1 + 56);
  }
  else
  {
    if ((v4 & 2) == 0) {
      goto LABEL_10;
    }
    uint64_t v6 = *(void *)(a1 + 64);
  }
  ++*(void *)(*(void *)(v6 + 8) + 24);
LABEL_10:
  return _objc_release_x1();
}

void sub_100019BEC(uint64_t a1, uint64_t a2, CFDictionaryRef theDict)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100019C74;
  v3[3] = &unk_1000394B0;
  void v3[4] = *(void *)(a1 + 32);
  v3[5] = a2;
  CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)sub_10001A5D0, v3);
}

void sub_100019C74(uint64_t a1, int a2, CFDictionaryRef theDict)
{
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(theDict, kPCSSecureBackupCFKeyRegistryPublicIdentities);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100019D28;
  v5[3] = &unk_100039488;
  long long v6 = *(_OWORD *)(a1 + 32);
  v7.length = CFArrayGetCount(Value);
  v7.id location = 0;
  CFArrayApplyFunction(Value, v7, (CFArrayApplierFunction)sub_10001A5B8, v5);
}

void sub_100019D28(uint64_t a1)
{
  uint64_t v2 = PCSPublicIdentityCreateWithPublicKeyInfo();
  if (v2)
  {
    id v3 = (const void *)v2;
    uint64_t ServiceID = PCSPublicIdentityGetServiceID();
    [*(id *)(a1 + 32) addKeyWithDSID:*(void *)(a1 + 40) service:ServiceID publicKey:PCSPublicIdentityGetPublicID()];
    CFRelease(v3);
  }
}

id sub_100019E24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) markKeyNegativeWithDSID:a2 service:a3];
}

uint64_t sub_10001A5B8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

uint64_t sub_10001A5D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, a1, a2);
}

void sub_10001AF48(id a1)
{
  qword_100040E88 = objc_alloc_init(PCSKeySyncing);
  _objc_release_x1();
}

uint64_t sub_10001B1E4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 32));
}

void sub_10001BB00(uint64_t a1, void *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v32 = a2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Updating service %@", buf, 0xCu);
  }
  uint64_t IndexByName = PCSServiceItemGetIndexByName();
  if (IndexByName)
  {
    uint64_t v6 = IndexByName;
    if (IndexByName == 54 || IndexByName == 56 || PCSServiceItemTypeIsShareableManatee())
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v32 = a2;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Skipping identities for service %@", buf, 0xCu);
      }
      if (([*(id *)(a1 + 32) deleteMirrorKeys:v6] & 1) == 0
        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v32 = a2;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to remove MirrorKeys from registry for %@", buf, 0xCu);
      }
      goto LABEL_36;
    }
    CFRange v7 = (void *)PCSIdentitySetCopyOrderedIdentities();
    if (v7)
    {
      unsigned __int8 v8 = [*(id *)(a1 + 32) beginExclusiveTransaction];
      BOOL v9 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      if (v8)
      {
        int8x16_t v25 = v4;
        if (v9)
        {
          id v10 = [v7 count];
          *(_DWORD *)long long buf = 134218242;
          id v32 = v10;
          __int16 v33 = 2112;
          CFRange v34 = a2;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Syncing %lu identities %@ with database", buf, 0x16u);
        }
        [*(id *)(a1 + 32) markMirrorKey:v6 type:3];
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v24 = v7;
        id v11 = v7;
        uint64_t v12 = (char *)[v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v27;
          char v15 = 1;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(void *)v27 != v14) {
                objc_enumerationMutation(v11);
              }
              int ServiceID = PCSIdentityGetServiceID();
              if (ServiceID) {
                BOOL v19 = ServiceID == v6;
              }
              else {
                BOOL v19 = 0;
              }
              if (v19)
              {
                long long v20 = (void *)PCSIdentityCopyPublicKeyInfo();
                int8x16_t v21 = PCSIdentityGetPublicKey();
                [*(id *)(a1 + 32) setMirrorKey:v21 service:v6 type:3 publicIdentity:v20];
                [*(id *)(a1 + 32) updateMirrorKey:v21 service:v6 type:3 newType:1 current:v15 & 1];

                char v15 = 0;
              }
            }
            uint64_t v13 = (char *)[v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
          }
          while (v13);
        }

        [*(id *)(a1 + 32) endTransaction:1];
        CFRange v7 = v24;
        unsigned __int8 v4 = v25;
        goto LABEL_35;
      }
      if (v9)
      {
        *(_WORD *)long long buf = 0;
        uint64_t v22 = "failed to open database transaction";
        uint32_t v23 = 2;
        goto LABEL_34;
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v32 = a2;
      uint64_t v22 = "Failed to get copy of identities of service type: %@";
      uint32_t v23 = 12;
LABEL_34:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v22, buf, v23);
    }
LABEL_35:
  }
LABEL_36:
}

void sub_10001C75C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  CFRange v7 = [PCSKeyClient alloc];
  unsigned __int8 v8 = [*(id *)(a1 + 32) accounts];
  BOOL v9 = [v8 dsid];
  id v11 = [(PCSKeyClient *)v7 initWithName:v6 values:v5 dsid:v9];

  id v10 = v11;
  if (v11)
  {
    [*(id *)(a1 + 40) addObject:v11];
    id v10 = v11;
  }
}

void sub_10001C928(id a1)
{
  id v6 = (id)os_transaction_create();
  uint64_t v2 = [PCSSyncing alloc];
  id v3 = +[PCSKeySyncing defaultSyncingManager];
  unsigned __int8 v4 = [(PCSSyncing *)v2 initWithPCSKeySyncing:v3];
  id v5 = (void *)qword_100040E98;
  qword_100040E98 = (uint64_t)v4;

  [(id)qword_100040E98 setupMetrics];
}

void sub_10001CE00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001CE28(uint64_t a1)
{
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x3032000000;
  v4[3] = sub_10001CF28;
  v4[4] = sub_10001CF38;
  id v5 = (id)os_transaction_create();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001CF40;
  v3[3] = &unk_1000395E8;
  void v3[4] = v4;
  [WeakRetained triggerWatchSyncing:v3];

  _Block_object_dispose(v4, 8);
}

void sub_10001CF10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001CF28(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001CF38(uint64_t a1)
{
}

void sub_10001CF40(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

id sub_10001D000(uint64_t a1)
{
  return [*(id *)(a1 + 32) healthSummary];
}

void sub_10001D34C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001D364(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    unsigned __int8 v4 = qword_100040ED8;
    if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Error checking registry (%@)", (uint8_t *)&v7, 0xCu);
    }
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;
}

void sub_10001D664(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  objc_destroyWeak(v18);
  _Block_object_dispose(&a18, 8);
  objc_destroyWeak((id *)(v19 - 56));
  _Unwind_Resume(a1);
}

void sub_10001D69C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) manager];
  [v2 syncKeysWithDatabase];

  id v3 = qword_100040ED8;
  if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Trigger syncing to watches", buf, 2u);
  }
  unsigned __int8 v4 = *(void **)(a1 + 32);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001D7B8;
  v5[3] = &unk_100039680;
  objc_copyWeak(&v6, (id *)(a1 + 48));
  void v5[4] = *(void *)(a1 + 40);
  [v4 syncKeys:&off_10003B1F0 withReply:v5];
  objc_destroyWeak(&v6);
}

void sub_10001D7A4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10001D7B8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = qword_100040ED8;
  if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v5;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "notify sync key complete: %@: error: %@", (uint8_t *)&v12, 0x16u);
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = 0;

  if (WeakRetained)
  {
    id v11 = [WeakRetained internalQueue];
    dispatch_async(v11, &stru_100039658);
  }
}

void sub_10001DC3C(id a1)
{
  uint64_t v1 = +[NSSet setWithArray:&off_10003B218];
  uint64_t v2 = (void *)qword_100040EB0;
  qword_100040EB0 = v1;

  uint64_t v3 = +[NSSet setWithArray:&off_10003B230];
  unsigned __int8 v4 = (void *)qword_100040EB8;
  qword_100040EB8 = v3;

  v8[0] = @"com.apple.ProtectedCloudStorage.mobileBackupStateChange";
  v8[1] = @"com.apple.ProtectedCloudStorage.test.mobileBackupStateChange";
  id v5 = +[NSArray arrayWithObjects:v8 count:2];
  uint64_t v6 = +[NSSet setWithArray:v5];
  int v7 = (void *)qword_100040EC0;
  qword_100040EC0 = v6;
}

void sub_10001E3E4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10001E408(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v34 = 0;
    uint64_t v3 = +[PCSAccountsModel settingsKeyForKey:kPCSPendingRollEpoch error:&v34];
    id v4 = v34;
    id v5 = v4;
    if (v3) {
      BOOL v6 = v4 == 0;
    }
    else {
      BOOL v6 = 0;
    }
    if (!v6)
    {
      int v7 = qword_100040ED8;
      if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        __int16 v40 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failed to get key: %@", buf, 0xCu);
      }
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
      goto LABEL_24;
    }
    id v33 = 0;
    id v8 = +[PCSAccountsModel settingsKeyForKey:@"lastMobileBackupStatus" error:&v33];
    id v9 = v33;
    id v10 = v9;
    if (!v8 || v9)
    {
      long long v24 = qword_100040ED8;
      if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        __int16 v40 = v10;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Failed to get key: %@", buf, 0xCu);
      }
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    }
    else
    {
      id v11 = [*(id *)(a1 + 40) settings];
      int v12 = [v11 objectForKey:v8];

      id v13 = [WeakRetained mobileBackup];
      unint64_t v14 = (unint64_t)[v13 isBackupEnabled];

      id v15 = [*(id *)(a1 + 40) settings];
      unsigned int v30 = [v15 BOOLForKey:v8];

      uint64_t v16 = [*(id *)(a1 + 40) getRollEpoch];
      id v32 = +[PCSAnalytics logger];
      if (!v12 && v16)
      {
        long long v17 = [*(id *)(a1 + 40) settings];
        [v17 removeObjectForKey:v3];

        unsigned int v29 = v14;
        uint64_t v18 = kPCSErrorDomain;
        NSErrorUserInfoKey v37 = NSLocalizedDescriptionKey;
        uint64_t v19 = +[NSString stringWithFormat:@"No last mobile backup status, but have a keyroll epoch time (%@)", v16];
        id v38 = v19;
        long long v20 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
        int8x16_t v21 = +[NSError errorWithDomain:v18 code:118 userInfo:v20];

        int v12 = 0;
        id v10 = 0;

        [v32 logRecoverableError:v21 forEvent:PCSEventKeyRollStateChange withAttributes:0];
        unint64_t v14 = v29;
      }
      if (v14 == v30)
      {
        id v31 = (void *)v16;
        uint64_t v25 = kPCSErrorDomain;
        NSErrorUserInfoKey v35 = NSLocalizedDescriptionKey;
        long long v26 = +[NSString stringWithFormat:@"False alarm check for backup state change"];
        id v36 = v26;
        long long v27 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
        long long v28 = +[NSError errorWithDomain:v25 code:131 userInfo:v27];

        [v32 logRecoverableError:v28 forEvent:PCSEventKeyRollStateChange withAttributes:0];
        dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

        goto LABEL_24;
      }
      uint64_t v22 = (void *)v16;
      if (((v30 ^ 1 | v14) & 1) == 0)
      {
        [*(id *)(a1 + 40) recordEpochForKeyroll];
        [v32 logSuccessForEvent:PCSEventKeyRollStateChange];
      }
      uint32_t v23 = [*(id *)(a1 + 40) settings];
      [v23 setBool:v14 forKey:v8];

      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    }

LABEL_24:
    goto LABEL_25;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
LABEL_25:
}

void sub_10001EEEC(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    [*(id *)(a1 + 32) triggerKeyRolling];
  }
  else if (!state)
  {
    [*(id *)(a1 + 32) setScheduledKeyrollActivity:v3];
    if ([*(id *)(a1 + 32) activityIsScheduled:v3])
    {
      BOOL v6 = qword_100040ED8;
      if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10) = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Identity key roll is already scheduled.", (uint8_t *)&v10, 2u);
      }
    }
    else
    {
      xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_BOOL(v7, XPC_ACTIVITY_REPEATING, 1);
      xpc_dictionary_set_int64(v7, XPC_ACTIVITY_INTERVAL, *(void *)(a1 + 40));
      xpc_dictionary_set_int64(v7, XPC_ACTIVITY_DELAY, *(void *)(a1 + 40));
      xpc_dictionary_set_int64(v7, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_1_HOUR);
      xpc_dictionary_set_string(v7, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
      xpc_dictionary_set_BOOL(v7, XPC_ACTIVITY_ALLOW_BATTERY, 1);
      xpc_dictionary_set_BOOL(v7, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
      xpc_activity_set_criteria(v3, v7);
      id v8 = qword_100040ED8;
      if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void *)(a1 + 40);
        int v10 = 134217984;
        uint64_t v11 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Scheduled an identity key roll attempt to occur in %lld seconds.", (uint8_t *)&v10, 0xCu);
      }
    }
  }
}

void sub_10001F33C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001F358(uint64_t a1, int a2, uint64_t a3, int a4, int a5)
{
  char v5 = a4;
  if (a4 && a5 && *(void *)(a1 + 32))
  {
    uint64_t v9 = +[NSDate dateWithTimeIntervalSince1970:(double)PCSIdentitySetGetCurrentCreationTime()];
    if ([*(id *)(a1 + 32) compare:v9] == (id)1) {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
  }
  int v10 = *(unsigned __int8 *)(a1 + 88);
  if (*(unsigned char *)(a1 + 88) && (v5 & 1) == 0)
  {
    if (*(unsigned char *)(a1 + 89) && ([*(id *)(a1 + 40) containsObject:a3] & 1) == 0)
    {
      v25[0] = kSecClass;
      v25[1] = kSecAttrSynchronizable;
      v25[2] = kSecAttrSecurityDomain;
      v25[3] = kSecAttrServer;
      uint64_t v11 = *(void *)(a1 + 48);
      v26[2] = kPCSServiceName;
      v26[3] = v11;
      v26[0] = kSecClassInternetPassword;
      v26[1] = &__kCFBooleanTrue;
      void v25[4] = kSecAttrType;
      int v12 = +[NSNumber numberWithUnsignedInt:a2 | 0x10000u];
      v25[5] = kSecAttrIsNegative;
      v26[4] = v12;
      v26[5] = &__kCFBooleanTrue;
      id v13 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:6];

      *(void *)long long v24 = 0;
      int v14 = _PCSKeychainForwardTable(v13, v24);
      if (v14 != -25300)
      {
        int v15 = v14;
        if (v14)
        {
          uint64_t v16 = qword_100040ED8;
          if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_ERROR)) {
            sub_1000258C8(a3, v15, v16);
          }
        }
        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      }
    }
    int v10 = *(unsigned __int8 *)(a1 + 88);
  }
  if (v10 && PCSServiceItemEscrowManateeIdentityByName())
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
    {
      long long v17 = [*(id *)(a1 + 56) registry];
      uint64_t v18 = [v17 allMobileBackupPublicKeys];
      uint64_t v19 = *(void *)(*(void *)(a1 + 72) + 8);
      long long v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;
    }
    uint64_t v21 = PCSIdentitySetCopyCurrentIdentityWithError();
    if (v21)
    {
      uint64_t v22 = (const void *)v21;
      if ([*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) containsObject:PCSIdentityGetPublicKey()])
      {
        uint32_t v23 = qword_100040ED8;
        if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long v24 = 138412290;
          *(void *)&v24[4] = a3;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Keyrolling service %@ due to existing backup", v24, 0xCu);
        }
        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      }
      CFRelease(v22);
    }
  }
}

void sub_10001F934(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10001F958(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    id v41 = WeakRetained;
    uint64_t v3 = [WeakRetained accounts];
    long long v42 = [v3 dsid];

    if (!v42)
    {
      long long v27 = qword_100040ED8;
      if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v61 = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Keyroll triggered, but DSID is unknown; will retry later",
          v61,
          2u);
      }
      goto LABEL_41;
    }
    unsigned __int8 v4 = [*(id *)(a1 + 32) shouldRollStingray];
    *(void *)id v61 = 0;
    id v62 = v61;
    uint64_t v63 = 0x2020000000;
    char v64 = 0;
    uint64_t v57 = 0;
    unsigned int v58 = &v57;
    uint64_t v59 = 0x2020000000;
    char v60 = 0;
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_10002019C;
    v52[3] = &unk_100039740;
    unsigned __int8 v56 = v4;
    v54 = v61;
    __int16 v55 = &v57;
    id v39 = objc_alloc_init((Class)NSMutableSet);
    id v53 = v39;
    if (([v41 getServicesToRoll:v42 handler:v52] & 1) == 0)
    {
LABEL_40:

      _Block_object_dispose(&v57, 8);
      _Block_object_dispose(v61, 8);
LABEL_41:

      uint64_t v2 = v41;
      goto LABEL_42;
    }
    if (![v39 count])
    {
      long long v28 = qword_100040ED8;
      if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
      {
        int v29 = *((unsigned __int8 *)v58 + 24);
        *(_DWORD *)v70 = 67109120;
        *(_DWORD *)&v70[4] = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Keyroll triggered but we've already completed rolling (defer: %d)", v70, 8u);
      }
      [*(id *)(a1 + 32) rollingComplete:*((unsigned __int8 *)v58 + 24)];
      goto LABEL_40;
    }
    if (v62[24])
    {
      char v5 = [v41 settings];
      BOOL v6 = +[NSDate now];
      [v5 setObject:v6 forKey:kPCSSettingStingrayRoll];
    }
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    id v36 = _os_activity_create((void *)&_mh_execute_header, "PCSCKKSRollAndSync", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v36, &state);
    *(void *)v70 = 0;
    v71 = v70;
    uint64_t v72 = 0x2020000000;
    int v73 = 0;
    id v38 = [v39 count];
    xpc_object_t v7 = qword_100040ED8;
    if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v68) = v38;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CKKS registry roll & sync for all eligible services (%d)", buf, 8u);
    }
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v8 = v39;
    id v9 = [v8 countByEnumeratingWithState:&v47 objects:v69 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v48;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v48 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v47 + 1) + 8 * i);
          dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
          v44[0] = _NSConcreteStackBlock;
          v44[1] = 3221225472;
          v44[2] = sub_100020224;
          v44[3] = &unk_100039768;
          v44[4] = v12;
          long long v46 = v70;
          int v14 = v13;
          long long v45 = v14;
          objc_msgSend(v41, "createIdentity:dsid:roll:sync:forceSync:complete:", v12, v42, 1, 1, 0, v44, v36);
          dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
        }
        id v9 = [v8 countByEnumeratingWithState:&v47 objects:v69 count:16];
      }
      while (v9);
    }

    int v15 = +[PCSMetrics metrics];
    [v15 storeEventTimestamp:3];

    if (*((_DWORD *)v71 + 6) == v38)
    {
      uint64_t v16 = +[PCSMetrics metrics];
      [v16 storeEventTimestamp:4];
    }
    id v43 = 0;
    long long v17 = +[PCSAccountsModel settingsKeyForKey:@"testRollEpoch", &v43, v36 error];
    id v18 = v43;
    uint64_t v19 = v18;
    if (!v17 || v18)
    {
      unsigned int v30 = qword_100040ED8;
      if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        CFStringRef v68 = v19;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Failed to get key: %@", buf, 0xCu);
      }
      goto LABEL_39;
    }
    long long v20 = +[PCSAnalytics logger];
    if (*((_DWORD *)v71 + 6) == v38)
    {
      [v41 rollingComplete:*((unsigned __int8 *)v58 + 24)];
      uint64_t v21 = qword_100040ED8;
      if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = *((_DWORD *)v71 + 6);
        *(_DWORD *)long long buf = 67109120;
        LODWORD(v68) = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Successfully completed keyroll operations for  %d keys", buf, 8u);
      }
      [v20 logSuccessForEvent:PCSEventKeyRollOperation];
      uint32_t v23 = [*(id *)(a1 + 32) settings];
      unsigned int v24 = [v23 BOOLForKey:v17];

      if (!v24) {
        goto LABEL_38;
      }
      notify_post("com.apple.ProtectedCloudStorage.test.mobileBackupStateChange.success");
      uint64_t v25 = [*(id *)(a1 + 32) settings];
      [v25 setBool:0 forKey:v17];
    }
    else
    {
      id v31 = qword_100040ED8;
      if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
      {
        int v32 = v38 - *((_DWORD *)v71 + 6);
        *(_DWORD *)long long buf = 67109120;
        LODWORD(v68) = v32;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Failed keyroll operations for  %d keys", buf, 8u);
      }
      uint64_t v25 = +[NSError errorWithDomain:kPCSErrorDomain code:119 userInfo:0];
      v65[0] = @"attemptedRoll";
      id v33 = +[NSNumber numberWithInt:v38];
      v65[1] = @"successfulRoll";
      v66[0] = v33;
      id v34 = +[NSNumber numberWithInt:*((unsigned int *)v71 + 6)];
      v66[1] = v34;
      NSErrorUserInfoKey v35 = +[NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:2];
      [v20 logRecoverableError:v25 forEvent:PCSEventKeyRollOperation withAttributes:v35];
    }
LABEL_38:

LABEL_39:
    _Block_object_dispose(v70, 8);
    os_activity_scope_leave(&state);

    goto LABEL_40;
  }
  long long v26 = qword_100040ED8;
  if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v61 = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Keyroll triggered but there is no self", v61, 2u);
  }
LABEL_42:
}

void sub_100020130(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,os_activity_scope_state_s state,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
  _Block_object_dispose((const void *)(v44 - 144), 8);
  os_activity_scope_leave(&state);
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose(&a44, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002019C(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3) {
    goto LABEL_4;
  }
  if (*(unsigned char *)(a1 + 56))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
LABEL_4:
    id v8 = v5;
    id v5 = [*(id *)(a1 + 32) addObject:v5];
    id v6 = v8;
    goto LABEL_6;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
LABEL_6:
  return _objc_release_x1(v5, v6);
}

void sub_100020224(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    uint64_t v10 = qword_100040ED8;
    if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v17 = 138412802;
      uint64_t v18 = v11;
      __int16 v19 = 2114;
      id v20 = v9;
      __int16 v21 = 2112;
      id v22 = v8;
      uint64_t v12 = "CKKS registry roll & sync failed for service %@ with: %{public}@ (mtt: %@)";
      dispatch_semaphore_t v13 = v10;
      uint32_t v14 = 32;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v17, v14);
    }
  }
  else
  {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    uint64_t v15 = qword_100040ED8;
    if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      int v17 = 138412546;
      uint64_t v18 = v16;
      __int16 v19 = 2112;
      id v20 = v8;
      uint64_t v12 = "CKKS registry roll & sync for service %@ completed: %@";
      dispatch_semaphore_t v13 = v15;
      uint32_t v14 = 22;
      goto LABEL_6;
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_1000206B4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1000206D8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32) && *(void *)(a1 + 40))
    {
      uint64_t v3 = [*(id *)(a1 + 48) settings];
      unsigned __int8 v4 = [v3 stringForKey:*(void *)(a1 + 56)];

      if (([v4 isEqualToString:*(void *)(a1 + 40)] & 1) == 0)
      {
        id v5 = [*(id *)(a1 + 48) settings];
        [v5 setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 56)];

        id v6 = [*(id *)(a1 + 48) settings];
        [v6 removeObjectForKey:*(void *)(a1 + 64)];
      }
      id v7 = [*(id *)(a1 + 48) settings];
      id v8 = [v7 objectForKey:*(void *)(a1 + 64)];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        id v9 = [*(id *)(a1 + 48) settings];
        [v9 removeObjectForKey:*(void *)(a1 + 64)];

        id v8 = 0;
      }
      uint64_t v10 = qword_100040ED8;
      if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543362;
        CFStringRef v28 = v8;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Trigger syncing with escrow proxy on behalf of cloudd: next sync: %{public}@", buf, 0xCu);
      }
      uint64_t v11 = +[NSDate date];
      uint64_t v12 = v11;
      if (v8 && [v11 compare:v8] == (id)-1)
      {
        __int16 v21 = qword_100040ED8;
        if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "skipping sync due to ratelimiting", buf, 2u);
        }
        uint64_t v16 = +[NSError errorWithDomain:kPCSErrorDomain code:97 userInfo:0];
        (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
      }
      else
      {
        uint64_t v13 = [v12 dateByAddingTimeInterval:7200.0];

        uint32_t v14 = [*(id *)(a1 + 48) settings];
        [v14 setObject:v13 forKey:*(void *)(a1 + 64)];

        uint64_t v15 = qword_100040ED8;
        if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          CFStringRef v28 = (const __CFString *)v13;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "setting cloudd expiration to: %@", buf, 0xCu);
        }
        uint64_t v16 = [[EscrowProxySyncOperation alloc] initWithDSID:*(void *)(a1 + 32)];
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_100020B7C;
        v22[3] = &unk_100039790;
        v22[4] = *(void *)(a1 + 48);
        id v23 = *(id *)(a1 + 64);
        id v24 = *(id *)(a1 + 72);
        [(EscrowProxySyncOperation *)v16 setCompletionBlockWithError:v22];
        int v17 = [WeakRetained serialOperationQueue];
        [v17 addOperation:v16];

        id v8 = (__CFString *)v13;
      }
    }
    else
    {
      uint64_t v18 = qword_100040ED8;
      if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        CFStringRef v28 = @"Skipping escrow proxy sync, could not determine dsid and/or identifier";
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      }
      NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
      CFStringRef v26 = @"Skipping escrow proxy sync, could not determine dsid and/or identifier";
      unsigned __int8 v4 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      uint64_t v19 = *(void *)(a1 + 72);
      id v20 = +[NSError errorWithDomain:kPCSErrorDomain code:66 userInfo:v4];
      (*(void (**)(uint64_t, void, void, void *))(v19 + 16))(v19, 0, 0, v20);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

void sub_100020B7C(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = qword_100040ED8;
  if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109378;
    v14[1] = a2;
    __int16 v15 = 2114;
    id v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Escrow proxy sync reported: %d: %{public}@", (uint8_t *)v14, 0x12u);
  }
  if ([v5 code] == (id)305)
  {
    id v7 = [v5 domain];
    unsigned int v8 = [v7 isEqualToString:kPCSCloudServicesErrorDomain];

    if (v8)
    {
      id v9 = [v5 userInfo];
      uint64_t v10 = [v9 objectForKeyedSubscript:NSUnderlyingErrorKey];

      if ([v10 code] == (id)311)
      {
        uint64_t v11 = [v5 domain];
        unsigned int v12 = [v11 isEqualToString:kPCSCloudServicesErrorDomain];

        if (v12)
        {
          uint64_t v13 = [*(id *)(a1 + 32) settings];
          [v13 removeObjectForKey:*(void *)(a1 + 40)];
        }
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_1000210A4(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 72));
  _Unwind_Resume(a1);
}

void sub_1000210CC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    uint64_t v3 = _os_activity_create((void *)&_mh_execute_header, "PCSCKKSRegistrySync", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v3, &state);
    unsigned __int8 v4 = qword_100040ED8;
    if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138543362;
      uint64_t v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Manatee sync with CKKS registry for service %{public}@", buf, 0xCu);
    }
    id v6 = [*(id *)(a1 + 40) forceSyncNeeded:*(void *)(a1 + 48) dsid:*(void *)(a1 + 56)];
    uint64_t v7 = *(void *)(a1 + 32);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10002129C;
    v9[3] = &unk_1000397E0;
    uint64_t v8 = *(void *)(a1 + 56);
    id v10 = *(id *)(a1 + 64);
    [WeakRetained createIdentity:v7 dsid:v8 roll:0 sync:1 forceSync:v6 complete:v9];

    os_activity_scope_leave(&state);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void sub_100021280(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

void sub_10002129C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = qword_100040ED8;
  BOOL v11 = os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      int v15 = 138543618;
      id v16 = v9;
      __int16 v17 = 2112;
      id v18 = v8;
      unsigned int v12 = "CKKS registry sync failed with: %{public}@ (mtt: %@)";
      uint64_t v13 = v10;
      uint32_t v14 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v15, v14);
    }
  }
  else if (v11)
  {
    int v15 = 138412290;
    id v16 = v8;
    unsigned int v12 = "CKKS registry sync completed: %@";
    uint64_t v13 = v10;
    uint32_t v14 = 12;
    goto LABEL_6;
  }
  (*(void (**)(void, BOOL, id, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v7 != 0, v8, v9);
}

void sub_10002182C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_100021850(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:kPCSSetupDSID];
    unsigned __int8 v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:kPCSSetupGuitarfish];
    [v4 BOOLValue];

    if (PCSCurrentPersonaMatchesDSID())
    {
      if (!*(unsigned char *)(a1 + 56) || !PCSIdentityHaveiCloudIdentityLocally())
      {
        id v11 = [*(id *)(a1 + 32) mutableCopy];
        unsigned int v12 = +[PCSMetrics metrics];
        uint64_t v13 = [v12 keyRegistryCallback];
        id v14 = objc_retainBlock(v13);
        [v11 setObject:v14 forKeyedSubscript:kPCSSetupCallbackKeyRegistry];

        int v15 = (const void *)PCSIdentitySetup();
        if (v15)
        {
          CFRelease(v15);
        }
        else
        {
          id v16 = qword_100040ED8;
          if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            uint64_t v18 = 0;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "setupIdentitiesForAccount: PCSIdentitySetup failed: %@", buf, 0xCu);
          }
        }

        goto LABEL_16;
      }
      uint64_t v5 = qword_100040ED8;
      if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 40);
        *(_DWORD *)long long buf = 138412290;
        uint64_t v18 = v6;
        id v7 = "setupIdentitiesForAccount: account %@ is already setup, ignoring request";
        id v8 = v5;
        uint32_t v9 = 12;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
      }
    }
    else
    {
      uint64_t v10 = qword_100040ED8;
      if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        id v7 = "Current persona doesn't match dsid";
        id v8 = v10;
        uint32_t v9 = 2;
        goto LABEL_9;
      }
    }
LABEL_16:
  }
}

void sub_100021BC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100021BEC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    _PCSIdentityMigrateToiCDP();
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_100021D74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100021D98(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = [*(id *)(a1 + 32) mutableCopy];
    unsigned __int8 v4 = +[PCSMetrics metrics];
    uint64_t v5 = [v4 keyRegistryCallback];
    id v6 = objc_retainBlock(v5);
    [v3 setObject:v6 forKeyedSubscript:kPCSSetupCallbackKeyRegistry];

    id v7 = +[PCSMetrics metrics];
    id v8 = [v7 markNegativeCallback];
    id v9 = objc_retainBlock(v8);
    [v3 setObject:v9 forKeyedSubscript:kPCSSetupCallbackMarkNegative];

    LODWORD(v7) = _PCSIdentityMigrateEnableWalrus();
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

    if (v7)
    {
      uint64_t v10 = +[PCSMetrics metrics];
      [v10 storeEventTimestamp:1];
    }
  }
}

void sub_100022008(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002202C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = [*(id *)(a1 + 32) mutableCopy];
    unsigned __int8 v4 = +[PCSMetrics metrics];
    uint64_t v5 = [v4 keyRegistryCallback];
    id v6 = objc_retainBlock(v5);
    [v3 setObject:v6 forKeyedSubscript:kPCSSetupCallbackKeyRegistry];

    LODWORD(v4) = _PCSIdentityMigrateDisableWalrus();
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

    if (v4)
    {
      id v7 = +[PCSMetrics metrics];
      [v7 storeEventTimestamp:2];
    }
  }
}

void sub_1000224F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100022510(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = qword_100040ED8;
  if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138413058;
    id v15 = v9;
    __int16 v16 = 2112;
    id v17 = v10;
    __int16 v18 = 2112;
    id v19 = v11;
    __int16 v20 = 2112;
    id v21 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Completed best-effort mobile backup restore with recoverIssue:%@ missing:%@ present:%@ error:%@", (uint8_t *)&v14, 0x2Au);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100022624(uint64_t a1, uint64_t a2, void *a3, void *a4, char a5, void *a6)
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  unsigned int v15 = [*(id *)(a1 + 32) isEqualToString:kPCSMessages3];
  if (!v13 && (a5 & 1) == 0 && a2 && v15)
  {
    __int16 v16 = qword_100040ED8;
    if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Kicking off user registry sync due to new messages3 identity", v19, 2u);
    }
    id v17 = [WeakRetained registry];
    id v18 = [v17 syncUserRegistry];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100022B38(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  unsigned __int8 v4 = a3;
  uint64_t v5 = +[PCSAnalytics logger];
  if (v3)
  {
    id v6 = &PCSEventWalrusRepairPerformed;
LABEL_6:
    [v5 logSuccessForEvent:*v6];
    goto LABEL_11;
  }
  id v7 = [(NSError *)v4 domain];
  if ([v7 isEqualToString:kPCSErrorDomain])
  {
    id v8 = [(NSError *)v4 code];

    if (v8 == (id)159)
    {
      id v6 = &PCSEventWalrusRepairNotNeeded;
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v9 = qword_100040ED8;
  if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "repair migrate result: %@", (uint8_t *)&v10, 0xCu);
  }
  [v5 logRecoverableError:v4 forEvent:PCSEventWalrusRepairPerformed withAttributes:0];
LABEL_11:
}

void sub_100022D14(uint64_t a1)
{
  [*(id *)(a1 + 32) triggerWatchSyncing];
  [*(id *)(a1 + 32) notifyKeyRegistry];
  uint64_t v2 = +[PCSAccountsModel accountForCurrentPersona];
  BOOL v3 = objc_msgSend(v2, "aa_personID");

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) identityCopySet:v3];
    if (v4)
    {
      uint64_t v5 = v4;
      if (_os_feature_enabled_impl()) {
        [*(id *)(a1 + 32) repairWalrus];
      }
      if ([*(id *)(a1 + 32) shouldRoll]) {
        [*(id *)(a1 + 32) triggerKeyRolling];
      }
      [*(id *)(a1 + 32) restoreMobileBackup:0 dsid:v3 withReply:&stru_100039918];
      CFRelease(v5);
    }
  }
  else
  {
    id v6 = qword_100040ED8;
    if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "dsid is nil", v7, 2u);
    }
  }
}

void sub_100022E30(id a1, NSNumber *a2, NSNumber *a3, NSNumber *a4, NSError *a5)
{
  id v8 = a2;
  id v9 = a3;
  int v10 = a4;
  id v11 = a5;
  id v12 = qword_100040ED8;
  if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138413058;
    int v14 = v8;
    __int16 v15 = 2112;
    __int16 v16 = v9;
    __int16 v17 = 2112;
    id v18 = v10;
    __int16 v19 = 2112;
    __int16 v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "MB: %@ %@ %@ %@", (uint8_t *)&v13, 0x2Au);
  }
}

id sub_100022FEC(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyInternalEvent:*(void *)(a1 + 40)];
}

void sub_100023198(uint64_t a1)
{
  if (byte_100040EC8 == 1)
  {
    uint64_t v2 = qword_100040ED8;
    if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Already a request (recently) pending, returning early", buf, 2u);
    }
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = PCSErrorCreate();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
  else
  {
    byte_100040EC8 = 1;
    uint64_t v5 = [*(id *)(a1 + 32) registry];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000232CC;
    v7[3] = &unk_100039960;
    id v6 = *(id *)(a1 + 40);
    void v7[4] = *(void *)(a1 + 32);
    id v8 = v6;
    [v5 checkRegistry:v7];

    id v4 = v8;
  }
}

void sub_1000232CC(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  dispatch_time_t v2 = dispatch_time(0, 60000000000);
  uint64_t v3 = [*(id *)(a1 + 32) registryQueue];
  dispatch_after(v2, v3, &stru_100039938);
}

void sub_100023354(id a1)
{
  uint64_t v1 = qword_100040ED8;
  if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_time_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Allowing checkRegistry calls again", v2, 2u);
  }
  byte_100040EC8 = 0;
}

void sub_1000234B4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v9 = [v3 accounts];
  uint64_t v5 = [v9 dsid];
  id v6 = [v4 getValues:v5];
  id v7 = *(void **)(a1 + 32);
  id v8 = [v4 uuid];

  [v7 setObject:v6 forKeyedSubscript:v8];
}

__CFDictionary *sub_100023FB4(const __CFAllocator *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *key, uint64_t a10)
{
  Mutable = CFDictionaryCreateMutable(a1, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  int v14 = (const void **)&a10;
  id v11 = key;
  if (key)
  {
    do
    {
      CFDictionarySetValue(Mutable, v11, *v14);
      id v12 = v14 + 1;
      v14 += 2;
      id v11 = *v12;
    }
    while (*v12);
  }
  return Mutable;
}

void sub_100024630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100024654(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6 && [v5 count])
  {
    id v23 = 0;
    id v24 = v5;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (!v9) {
      goto LABEL_58;
    }
    id v10 = v9;
    uint64_t v11 = *(void *)v26;
    while (1)
    {
      id v12 = 0;
      do
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        int v13 = *(void **)(*((void *)&v25 + 1) + 8 * (void)v12);
        int v14 = objc_msgSend(v13, "objectForKeyedSubscript:", @"view", v23, v24, (void)v25);
        unsigned __int8 v15 = [v14 isEqualToString:@"global"];

        if ((v15 & 1) == 0)
        {
          __int16 v16 = [v13 objectForKeyedSubscript:@"currentTLK"];
          __int16 v17 = sub_100024B6C(v16);

          id v18 = [v13 objectForKeyedSubscript:@"keystate"];
          __int16 v19 = sub_100024B6C(v18);

          if ([v19 isEqualToString:@"ready"]
            || [v19 isEqualToString:@"become_ready"])
          {
            *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
LABEL_30:

            goto LABEL_31;
          }
          if ([v19 isEqualToString:@"readypendingunlock"])
          {
            uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
            int v21 = 23;
          }
          else if ([v19 isEqualToString:@"waitforunlock"])
          {
            uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
            int v21 = 13;
          }
          else if ([v19 isEqualToString:@"error"])
          {
            uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
            int v21 = 24;
          }
          else if ([v19 isEqualToString:@"initializing"] {
                 || [v19 isEqualToString:@"initialized"]
          }
                 || [v19 isEqualToString:@"fetchcomplete"]
                 || [v19 isEqualToString:@"begin_fetch"]
                 || [v19 isEqualToString:@"fetchcomplete"]
                 || [v19 isEqualToString:@"waitfortlkcreation"]
                 || [v19 isEqualToString:@"waitfortlkupload"])
          {
            uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
            int v21 = 14;
          }
          else
          {
            if (![v19 isEqualToString:@"badcurrentpointers"])
            {
              if ([v19 isEqualToString:@"waitfortrust"]
                || [v19 isEqualToString:@"needrefetch"]
                || [v19 isEqualToString:@"badcurrentpointers"]
                || [v19 isEqualToString:@"newtlksfailed"])
              {
                uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
                int v21 = 15;
                goto LABEL_29;
              }
              if ([v19 isEqualToString:@"fetching"])
              {
                *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 16;
                goto LABEL_30;
              }
              if ([v19 isEqualToString:@"tlkmissing"]
                || [v19 isEqualToString:@"waitfortlk"])
              {
                uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
                int v21 = 17;
                goto LABEL_29;
              }
              if (![v19 isEqualToString:@"unhealthy"])
              {
                if ([v19 isEqualToString:@"healtlkshares"])
                {
                  uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
                  int v21 = 19;
                }
                else if ([v19 isEqualToString:@"healtlksharesfailed"])
                {
                  uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
                  int v21 = 20;
                }
                else if ([v19 isEqualToString:@"waitforfixupoperation"])
                {
                  uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
                  int v21 = 21;
                }
                else if ([v19 isEqualToString:@"resetzone"])
                {
                  uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
                  int v21 = 22;
                }
                else
                {
                  uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
                  if (v17) {
                    int v21 = 8;
                  }
                  else {
                    int v21 = 7;
                  }
                }
                goto LABEL_29;
              }
            }
            uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
            int v21 = 18;
          }
LABEL_29:
          *(_DWORD *)(v20 + 24) = v21;
          goto LABEL_30;
        }
LABEL_31:
        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v22 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
      id v10 = v22;
      if (!v22)
      {
LABEL_58:

        id v6 = v23;
        id v5 = v24;
        goto LABEL_59;
      }
    }
  }
  id v7 = pcsLogObjForScope();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v31 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PCSReportManateeStatus rpcStatus reply: %@", buf, 0xCu);
  }

  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 10;
LABEL_59:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_100024B6C(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

void sub_100024E84(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100024EA8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:kPCSSetupDSID];
    if (PCSCurrentPersonaMatchesDSID())
    {
      id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:kPCSSetupRecoveryToken];
      id v5 = [*(id *)(a1 + 32) mutableCopy];
      id v6 = +[PCSMetrics metrics];
      id v7 = [v6 keyRegistryCallback];
      id v8 = objc_retainBlock(v7);
      [v5 setObject:v8 forKeyedSubscript:kPCSSetupCallbackKeyRegistry];

      uint64_t v9 = PCSIdentitySetup();
      if (v9)
      {
        id v10 = (const void *)v9;
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        CFRelease(v10);
      }
      else
      {
        int v13 = qword_100040ED8;
        if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v15 = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "setupIdentitiesWithParameters: PCSIdentitySetup failed: %@", buf, 0xCu);
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
    }
    else
    {
      uint64_t v11 = qword_100040ED8;
      if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Current persona doesn't match dsid", buf, 2u);
      }
      uint64_t v12 = *(void *)(a1 + 40);
      id v4 = PCSErrorCreate();
      (*(void (**)(uint64_t, uint64_t, void, void, void *))(v12 + 16))(v12, 2, 0, 0, v4);
    }
  }
}

uint64_t start()
{
  signal(15, (void (__cdecl *)(int))1);
  dispatch_source_t v0 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  id v1 = (void *)qword_100040ED0;
  qword_100040ED0 = (uint64_t)v0;

  dispatch_source_set_event_handler((dispatch_source_t)qword_100040ED0, &stru_1000399F8);
  dispatch_activate((dispatch_object_t)qword_100040ED0);
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = +[PCSKeySyncing defaultSyncingManager];
  id v4 = +[PCSSyncing defaultPCSSyncing];
  os_log_t v5 = os_log_create("com.apple.ProtectedCloudStorage", "PCSSync");
  id v6 = (void *)qword_100040ED8;
  qword_100040ED8 = (uint64_t)v5;

  [v2 setManager:v3];
  id v8 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.protectedcloudstorage.protectedcloudkeysyncing"];
  [v8 setDelegate:v2];
  [v8 resume];

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000256C0;
  handler[3] = &unk_1000399D8;
  id v9 = v4;
  id v20 = v9;
  xpc_activity_register("com.apple.ProtectedCloudStorage.fortnightly", XPC_ACTIVITY_CHECK_IN, handler);
  int v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  __int16 v16 = sub_100025728;
  __int16 v17 = &unk_1000399D8;
  id v18 = v9;
  id v10 = v9;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &v14);
  id v11 = +[PCSPairedSyncDelegate sharedSyncDelegate];
  [v10 triggerWatchSyncing];
  uint64_t v12 = +[NSRunLoop currentRunLoop];
  [v12 run];

  return 0;
}

void sub_1000256C0(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (xpc_activity_get_state(v4) == 2)
  {
    [*(id *)(a1 + 32) notifyDailyEvent];
  }
}

void sub_100025728(uint64_t a1, void *a2)
{
  id v7 = a2;
  string = xpc_dictionary_get_string(v7, _xpc_event_key_name);
  os_log_t v5 = *(void **)(a1 + 32);
  id v6 = +[NSString stringWithUTF8String:string];
  [v5 notifyEvent:v6];
}

void sub_1000257C8()
{
}

void sub_1000257F4()
{
}

void sub_100025820(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "IDS devices updated", v1, 2u);
}

void sub_100025864()
{
}

void sub_100025880()
{
  *(_WORD *)dispatch_source_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "PERF: Syncing with device older than watchOS 4 / iOS 11", v0, 2u);
}

void sub_1000258C8(uint64_t a1, int a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unexpected error finding current identity for %@: %d", (uint8_t *)&v3, 0x12u);
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return _CFErrorGetCode(err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return _CFErrorGetDomain(err);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

uint64_t CKXPCSuitableError()
{
  return _CKXPCSuitableError();
}

uint64_t IDSCopyIDForDevice()
{
  return _IDSCopyIDForDevice();
}

uint64_t NRDeviceSizeForProductType()
{
  return _NRDeviceSizeForProductType();
}

uint64_t NRVersionIsGreaterThanOrEqual()
{
  return _NRVersionIsGreaterThanOrEqual();
}

uint64_t NRWatchOSVersionForRemoteDevice()
{
  return _NRWatchOSVersionForRemoteDevice();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t NSStringfromPSYSyncSessionType()
{
  return _NSStringfromPSYSyncSessionType();
}

uint64_t PCSBackupCopyRecoveredKeyWithIdentitySet()
{
  return _PCSBackupCopyRecoveredKeyWithIdentitySet();
}

uint64_t PCSBackupCreateEscrowedKeyWithIdentity()
{
  return _PCSBackupCreateEscrowedKeyWithIdentity();
}

uint64_t PCSCurrentPersonaMatchesDSID()
{
  return _PCSCurrentPersonaMatchesDSID();
}

uint64_t PCSDaemonKeyRollIsPending()
{
  return _PCSDaemonKeyRollIsPending();
}

uint64_t PCSErrorCreate()
{
  return _PCSErrorCreate();
}

uint64_t PCSIdentityCopyExportedPrivateKey()
{
  return _PCSIdentityCopyExportedPrivateKey();
}

uint64_t PCSIdentityCopyPublicKeyInfo()
{
  return _PCSIdentityCopyPublicKeyInfo();
}

uint64_t PCSIdentityCreateMaster()
{
  return _PCSIdentityCreateMaster();
}

uint64_t PCSIdentityCreateWithExportedPrivateKey()
{
  return _PCSIdentityCreateWithExportedPrivateKey();
}

uint64_t PCSIdentityGetCDPStatus()
{
  return _PCSIdentityGetCDPStatus();
}

uint64_t PCSIdentityGetPublicKey()
{
  return _PCSIdentityGetPublicKey();
}

uint64_t PCSIdentityGetServiceID()
{
  return _PCSIdentityGetServiceID();
}

uint64_t PCSIdentityGetServiceName()
{
  return _PCSIdentityGetServiceName();
}

uint64_t PCSIdentityHaveiCloudIdentityLocally()
{
  return _PCSIdentityHaveiCloudIdentityLocally();
}

uint64_t PCSIdentitySetAddIdentity()
{
  return _PCSIdentitySetAddIdentity();
}

uint64_t PCSIdentitySetAddIdentityWithError()
{
  return _PCSIdentitySetAddIdentityWithError();
}

uint64_t PCSIdentitySetCopyCurrentIdentityWithError()
{
  return _PCSIdentitySetCopyCurrentIdentityWithError();
}

uint64_t PCSIdentitySetCopyIdentity()
{
  return _PCSIdentitySetCopyIdentity();
}

uint64_t PCSIdentitySetCopyOrderedIdentities()
{
  return _PCSIdentitySetCopyOrderedIdentities();
}

uint64_t PCSIdentitySetCreate()
{
  return _PCSIdentitySetCreate();
}

uint64_t PCSIdentitySetCreateExternalForm()
{
  return _PCSIdentitySetCreateExternalForm();
}

uint64_t PCSIdentitySetCreateKeychain()
{
  return _PCSIdentitySetCreateKeychain();
}

uint64_t PCSIdentitySetEnableICDP()
{
  return _PCSIdentitySetEnableICDP();
}

uint64_t PCSIdentitySetGetCurrentCreationTime()
{
  return _PCSIdentitySetGetCurrentCreationTime();
}

uint64_t PCSIdentitySetIsICDP()
{
  return _PCSIdentitySetIsICDP();
}

uint64_t PCSIdentitySetIsWalrusWithForceFetch()
{
  return _PCSIdentitySetIsWalrusWithForceFetch();
}

uint64_t PCSIdentitySetSetCurrentIdentity()
{
  return _PCSIdentitySetSetCurrentIdentity();
}

uint64_t PCSIdentitySetSetCurrentIdentityWithError()
{
  return _PCSIdentitySetSetCurrentIdentityWithError();
}

uint64_t PCSIdentitySetup()
{
  return _PCSIdentitySetup();
}

uint64_t PCSIdentitySynchronizeKeys()
{
  return _PCSIdentitySynchronizeKeys();
}

uint64_t PCSPublicIdentityCreateWithPublicKeyInfo()
{
  return _PCSPublicIdentityCreateWithPublicKeyInfo();
}

uint64_t PCSPublicIdentityGetPublicID()
{
  return _PCSPublicIdentityGetPublicID();
}

uint64_t PCSPublicIdentityGetServiceID()
{
  return _PCSPublicIdentityGetServiceID();
}

uint64_t PCSServiceItemEscrowManateeIdentityByName()
{
  return _PCSServiceItemEscrowManateeIdentityByName();
}

uint64_t PCSServiceItemGetIndexByName()
{
  return _PCSServiceItemGetIndexByName();
}

uint64_t PCSServiceItemTypeIsManatee()
{
  return _PCSServiceItemTypeIsManatee();
}

uint64_t PCSServiceItemTypeIsShareableManatee()
{
  return _PCSServiceItemTypeIsShareableManatee();
}

uint64_t PCSServiceItemsGetEachName()
{
  return _PCSServiceItemsGetEachName();
}

uint64_t PCSServiceItemsInfoIteration()
{
  return _PCSServiceItemsInfoIteration();
}

uint64_t PCSSupportsPersonaMultiuser()
{
  return _PCSSupportsPersonaMultiuser();
}

uint64_t SOSCCThisDeviceIsInCircle()
{
  return _SOSCCThisDeviceIsInCircle();
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return _SecItemCopyMatching(query, result);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _PCSCreateHexString()
{
  return __PCSCreateHexString();
}

uint64_t _PCSError()
{
  return __PCSError();
}

uint64_t _PCSIdentityMigrateDisableWalrus()
{
  return __PCSIdentityMigrateDisableWalrus();
}

uint64_t _PCSIdentityMigrateEnableWalrus()
{
  return __PCSIdentityMigrateEnableWalrus();
}

uint64_t _PCSIdentityMigrateToiCDP()
{
  return __PCSIdentityMigrateToiCDP();
}

uint64_t _PCSIdentitySetCopyCurrentIdentityInternal()
{
  return __PCSIdentitySetCopyCurrentIdentityInternal();
}

uint64_t _PCSIdentitySetGetDSID()
{
  return __PCSIdentitySetGetDSID();
}

uint64_t _PCSIsMultiDevice()
{
  return __PCSIsMultiDevice();
}

uint64_t _PCSServiceItemsGetNoRollStingrayServiceTypes()
{
  return __PCSServiceItemsGetNoRollStingrayServiceTypes();
}

uint64_t _PCSSyncingSetupInterface()
{
  return __PCSSyncingSetupInterface();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return __os_activity_create(dso, description, activity, flags);
}

uint64_t _os_assert_log()
{
  return __os_assert_log();
}

uint64_t _os_crash()
{
  return __os_crash();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sqlite3_maintain_load_factor()
{
  return __sqlite3_maintain_load_factor();
}

uint64_t ccdigest()
{
  return _ccdigest();
}

uint64_t ccsha256_di()
{
  return _ccsha256_di();
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

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
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

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
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

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
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

void objc_enumerationMutation(id obj)
{
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

void objc_moveWeak(id *to, id *from)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
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

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t pcsLogObjForScope()
{
  return _pcsLogObjForScope();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return _sqlite3_bind_int(a1, a2, a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return _sqlite3_bind_int64(a1, a2, a3);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_text(a1, a2, a3, a4, a5);
}

int sqlite3_close(sqlite3 *a1)
{
  return _sqlite3_close(a1);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int(a1, iCol);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return _sqlite3_errmsg(a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return _sqlite3_exec(a1, sql, callback, a4, errmsg);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return _sqlite3_finalize(pStmt);
}

void sqlite3_free(void *a1)
{
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return _sqlite3_open_v2(filename, ppDb, flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return _sqlite3_prepare_v2(db, zSql, nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return _sqlite3_reset(pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return _sqlite3_step(a1);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return _xpc_activity_copy_criteria(activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

void xpc_activity_unregister(const char *identifier)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__onqueueSaveUserRegistryStats(void *a1, const char *a2, ...)
{
  return [a1 _onqueueSaveUserRegistryStats];
}

id objc_msgSend_accountForCurrentPersona(void *a1, const char *a2, ...)
{
  return [a1 accountForCurrentPersona];
}

id objc_msgSend_accountStatus(void *a1, const char *a2, ...)
{
  return [a1 accountStatus];
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return [a1 accounts];
}

id objc_msgSend_activePairedDevice(void *a1, const char *a2, ...)
{
  return [a1 activePairedDevice];
}

id objc_msgSend_actualOperation(void *a1, const char *a2, ...)
{
  return [a1 actualOperation];
}

id objc_msgSend_addKeyStmt(void *a1, const char *a2, ...)
{
  return [a1 addKeyStmt];
}

id objc_msgSend_allClients(void *a1, const char *a2, ...)
{
  return [a1 allClients];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allMobileBackupKeys(void *a1, const char *a2, ...)
{
  return [a1 allMobileBackupKeys];
}

id objc_msgSend_allMobileBackupPublicKeys(void *a1, const char *a2, ...)
{
  return [a1 allMobileBackupPublicKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_attemptTimer(void *a1, const char *a2, ...)
{
  return [a1 attemptTimer];
}

id objc_msgSend_beginExclusiveTransaction(void *a1, const char *a2, ...)
{
  return [a1 beginExclusiveTransaction];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_buildVersion(void *a1, const char *a2, ...)
{
  return [a1 buildVersion];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_checkForBackupStateChange(void *a1, const char *a2, ...)
{
  return [a1 checkForBackupStateChange];
}

id objc_msgSend_circle(void *a1, const char *a2, ...)
{
  return [a1 circle];
}

id objc_msgSend_clearCloudKitCache(void *a1, const char *a2, ...)
{
  return [a1 clearCloudKitCache];
}

id objc_msgSend_client(void *a1, const char *a2, ...)
{
  return [a1 client];
}

id objc_msgSend_cloudKitRateLimitedOp(void *a1, const char *a2, ...)
{
  return [a1 cloudKitRateLimitedOp];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_companionCircleMember(void *a1, const char *a2, ...)
{
  return [a1 companionCircleMember];
}

id objc_msgSend_completion(void *a1, const char *a2, ...)
{
  return [a1 completion];
}

id objc_msgSend_completionBlockWithError(void *a1, const char *a2, ...)
{
  return [a1 completionBlockWithError];
}

id objc_msgSend_container(void *a1, const char *a2, ...)
{
  return [a1 container];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_copyIdentitySet(void *a1, const char *a2, ...)
{
  return [a1 copyIdentitySet];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_currentSyncOperations(void *a1, const char *a2, ...)
{
  return [a1 currentSyncOperations];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_databaseURL(void *a1, const char *a2, ...)
{
  return [a1 databaseURL];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_db(void *a1, const char *a2, ...)
{
  return [a1 db];
}

id objc_msgSend_defaultAccountsModel(void *a1, const char *a2, ...)
{
  return [a1 defaultAccountsModel];
}

id objc_msgSend_defaultCKConfiguration(void *a1, const char *a2, ...)
{
  return [a1 defaultCKConfiguration];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultMobileBackup(void *a1, const char *a2, ...)
{
  return [a1 defaultMobileBackup];
}

id objc_msgSend_defaultPCSSyncing(void *a1, const char *a2, ...)
{
  return [a1 defaultPCSSyncing];
}

id objc_msgSend_defaultSyncingManager(void *a1, const char *a2, ...)
{
  return [a1 defaultSyncingManager];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deleteRecordAll(void *a1, const char *a2, ...)
{
  return [a1 deleteRecordAll];
}

id objc_msgSend_dependencies(void *a1, const char *a2, ...)
{
  return [a1 dependencies];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_deviceManager(void *a1, const char *a2, ...)
{
  return [a1 deviceManager];
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return [a1 devices];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return [a1 distantPast];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_dsid(void *a1, const char *a2, ...)
{
  return [a1 dsid];
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return [a1 encodedData];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_etag(void *a1, const char *a2, ...)
{
  return [a1 etag];
}

id objc_msgSend_expectsPeerResponse(void *a1, const char *a2, ...)
{
  return [a1 expectsPeerResponse];
}

id objc_msgSend_exportedInterface(void *a1, const char *a2, ...)
{
  return [a1 exportedInterface];
}

id objc_msgSend_failures(void *a1, const char *a2, ...)
{
  return [a1 failures];
}

id objc_msgSend_fetchRecordZoneChanges(void *a1, const char *a2, ...)
{
  return [a1 fetchRecordZoneChanges];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_finishOperation(void *a1, const char *a2, ...)
{
  return [a1 finishOperation];
}

id objc_msgSend_firstSync(void *a1, const char *a2, ...)
{
  return [a1 firstSync];
}

id objc_msgSend_flushStats(void *a1, const char *a2, ...)
{
  return [a1 flushStats];
}

id objc_msgSend_fromID(void *a1, const char *a2, ...)
{
  return [a1 fromID];
}

id objc_msgSend_getKeyStmt(void *a1, const char *a2, ...)
{
  return [a1 getKeyStmt];
}

id objc_msgSend_getRollEpoch(void *a1, const char *a2, ...)
{
  return [a1 getRollEpoch];
}

id objc_msgSend_hasValidCredentials(void *a1, const char *a2, ...)
{
  return [a1 hasValidCredentials];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_havePeers(void *a1, const char *a2, ...)
{
  return [a1 havePeers];
}

id objc_msgSend_healthSummary(void *a1, const char *a2, ...)
{
  return [a1 healthSummary];
}

id objc_msgSend_iCDP(void *a1, const char *a2, ...)
{
  return [a1 iCDP];
}

id objc_msgSend_iCDPStatus(void *a1, const char *a2, ...)
{
  return [a1 iCDPStatus];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_identityCopySet(void *a1, const char *a2, ...)
{
  return [a1 identityCopySet];
}

id objc_msgSend_idsContext(void *a1, const char *a2, ...)
{
  return [a1 idsContext];
}

id objc_msgSend_idsDeviceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 idsDeviceIdentifier];
}

id objc_msgSend_incomingResponseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 incomingResponseIdentifier];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_internalQueue(void *a1, const char *a2, ...)
{
  return [a1 internalQueue];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_isActivePairedDevice(void *a1, const char *a2, ...)
{
  return [a1 isActivePairedDevice];
}

id objc_msgSend_isBackupEnabled(void *a1, const char *a2, ...)
{
  return [a1 isBackupEnabled];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return [a1 isConnected];
}

id objc_msgSend_isExecuting(void *a1, const char *a2, ...)
{
  return [a1 isExecuting];
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return [a1 isFinished];
}

id objc_msgSend_isLocallyPaired(void *a1, const char *a2, ...)
{
  return [a1 isLocallyPaired];
}

id objc_msgSend_isNewWatch(void *a1, const char *a2, ...)
{
  return [a1 isNewWatch];
}

id objc_msgSend_isReachable(void *a1, const char *a2, ...)
{
  return [a1 isReachable];
}

id objc_msgSend_isReady(void *a1, const char *a2, ...)
{
  return [a1 isReady];
}

id objc_msgSend_isTombstone(void *a1, const char *a2, ...)
{
  return [a1 isTombstone];
}

id objc_msgSend_keyRegistryCallback(void *a1, const char *a2, ...)
{
  return [a1 keyRegistryCallback];
}

id objc_msgSend_keys(void *a1, const char *a2, ...)
{
  return [a1 keys];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_lastError(void *a1, const char *a2, ...)
{
  return [a1 lastError];
}

id objc_msgSend_lastHash(void *a1, const char *a2, ...)
{
  return [a1 lastHash];
}

id objc_msgSend_lastSeen(void *a1, const char *a2, ...)
{
  return [a1 lastSeen];
}

id objc_msgSend_lastSent(void *a1, const char *a2, ...)
{
  return [a1 lastSent];
}

id objc_msgSend_lastfetchRecordZoneChangesAtStart(void *a1, const char *a2, ...)
{
  return [a1 lastfetchRecordZoneChangesAtStart];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadMobileBackupKeysFromDB(void *a1, const char *a2, ...)
{
  return [a1 loadMobileBackupKeysFromDB];
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return [a1 log];
}

id objc_msgSend_logger(void *a1, const char *a2, ...)
{
  return [a1 logger];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return [a1 longValue];
}

id objc_msgSend_mainOperationQueue(void *a1, const char *a2, ...)
{
  return [a1 mainOperationQueue];
}

id objc_msgSend_manager(void *a1, const char *a2, ...)
{
  return [a1 manager];
}

id objc_msgSend_markKeyStmt(void *a1, const char *a2, ...)
{
  return [a1 markKeyStmt];
}

id objc_msgSend_markNegativeCallback(void *a1, const char *a2, ...)
{
  return [a1 markNegativeCallback];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return [a1 message];
}

id objc_msgSend_metrics(void *a1, const char *a2, ...)
{
  return [a1 metrics];
}

id objc_msgSend_mobileBackup(void *a1, const char *a2, ...)
{
  return [a1 mobileBackup];
}

id objc_msgSend_mobileBackupRecordZoneID(void *a1, const char *a2, ...)
{
  return [a1 mobileBackupRecordZoneID];
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return [a1 model];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_notifyDailyEvent(void *a1, const char *a2, ...)
{
  return [a1 notifyDailyEvent];
}

id objc_msgSend_notifyKeyRegistry(void *a1, const char *a2, ...)
{
  return [a1 notifyKeyRegistry];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_nrDevice(void *a1, const char *a2, ...)
{
  return [a1 nrDevice];
}

id objc_msgSend_numberHandshakes(void *a1, const char *a2, ...)
{
  return [a1 numberHandshakes];
}

id objc_msgSend_observers(void *a1, const char *a2, ...)
{
  return [a1 observers];
}

id objc_msgSend_operationStateString(void *a1, const char *a2, ...)
{
  return [a1 operationStateString];
}

id objc_msgSend_operationUUID(void *a1, const char *a2, ...)
{
  return [a1 operationUUID];
}

id objc_msgSend_osVersion(void *a1, const char *a2, ...)
{
  return [a1 osVersion];
}

id objc_msgSend_oslog(void *a1, const char *a2, ...)
{
  return [a1 oslog];
}

id objc_msgSend_outgoingResponseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 outgoingResponseIdentifier];
}

id objc_msgSend_pairingID(void *a1, const char *a2, ...)
{
  return [a1 pairingID];
}

id objc_msgSend_peers(void *a1, const char *a2, ...)
{
  return [a1 peers];
}

id objc_msgSend_pendingReplies(void *a1, const char *a2, ...)
{
  return [a1 pendingReplies];
}

id objc_msgSend_pendingRequest(void *a1, const char *a2, ...)
{
  return [a1 pendingRequest];
}

id objc_msgSend_pendingSyncOperations(void *a1, const char *a2, ...)
{
  return [a1 pendingSyncOperations];
}

id objc_msgSend_previousServerChangeToken(void *a1, const char *a2, ...)
{
  return [a1 previousServerChangeToken];
}

id objc_msgSend_privateCloudDatabase(void *a1, const char *a2, ...)
{
  return [a1 privateCloudDatabase];
}

id objc_msgSend_privateDatabase(void *a1, const char *a2, ...)
{
  return [a1 privateDatabase];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_protocolVersion(void *a1, const char *a2, ...)
{
  return [a1 protocolVersion];
}

id objc_msgSend_pushNotifications(void *a1, const char *a2, ...)
{
  return [a1 pushNotifications];
}

id objc_msgSend_queryEscrowKeys(void *a1, const char *a2, ...)
{
  return [a1 queryEscrowKeys];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_ratelimitClientSyncing(void *a1, const char *a2, ...)
{
  return [a1 ratelimitClientSyncing];
}

id objc_msgSend_recordEpochForKeyroll(void *a1, const char *a2, ...)
{
  return [a1 recordEpochForKeyroll];
}

id objc_msgSend_recordFetch(void *a1, const char *a2, ...)
{
  return [a1 recordFetch];
}

id objc_msgSend_recordID(void *a1, const char *a2, ...)
{
  return [a1 recordID];
}

id objc_msgSend_recordModify(void *a1, const char *a2, ...)
{
  return [a1 recordModify];
}

id objc_msgSend_recordName(void *a1, const char *a2, ...)
{
  return [a1 recordName];
}

id objc_msgSend_recordType(void *a1, const char *a2, ...)
{
  return [a1 recordType];
}

id objc_msgSend_registerCloudKitNotifications(void *a1, const char *a2, ...)
{
  return [a1 registerCloudKitNotifications];
}

id objc_msgSend_registry(void *a1, const char *a2, ...)
{
  return [a1 registry];
}

id objc_msgSend_registryQueue(void *a1, const char *a2, ...)
{
  return [a1 registryQueue];
}

id objc_msgSend_repairWalrus(void *a1, const char *a2, ...)
{
  return [a1 repairWalrus];
}

id objc_msgSend_replyBlock(void *a1, const char *a2, ...)
{
  return [a1 replyBlock];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_resyncRegistryAction(void *a1, const char *a2, ...)
{
  return [a1 resyncRegistryAction];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_scanPCSIdentitiesForNewMobileBackupRecords(void *a1, const char *a2, ...)
{
  return [a1 scanPCSIdentitiesForNewMobileBackupRecords];
}

id objc_msgSend_scheduleRollAttempt(void *a1, const char *a2, ...)
{
  return [a1 scheduleRollAttempt];
}

id objc_msgSend_scheduledKeyrollActivity(void *a1, const char *a2, ...)
{
  return [a1 scheduledKeyrollActivity];
}

id objc_msgSend_selfname(void *a1, const char *a2, ...)
{
  return [a1 selfname];
}

id objc_msgSend_sendKeys(void *a1, const char *a2, ...)
{
  return [a1 sendKeys];
}

id objc_msgSend_sendKeysOld(void *a1, const char *a2, ...)
{
  return [a1 sendKeysOld];
}

id objc_msgSend_serialOperationQueue(void *a1, const char *a2, ...)
{
  return [a1 serialOperationQueue];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return [a1 service];
}

id objc_msgSend_serviceDelegateSet(void *a1, const char *a2, ...)
{
  return [a1 serviceDelegateSet];
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return [a1 settings];
}

id objc_msgSend_setupCloudKitSyncing(void *a1, const char *a2, ...)
{
  return [a1 setupCloudKitSyncing];
}

id objc_msgSend_setupDatabase(void *a1, const char *a2, ...)
{
  return [a1 setupDatabase];
}

id objc_msgSend_setupMetrics(void *a1, const char *a2, ...)
{
  return [a1 setupMetrics];
}

id objc_msgSend_setupStatCache(void *a1, const char *a2, ...)
{
  return [a1 setupStatCache];
}

id objc_msgSend_setupSubscriptions(void *a1, const char *a2, ...)
{
  return [a1 setupSubscriptions];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharedSyncDelegate(void *a1, const char *a2, ...)
{
  return [a1 sharedSyncDelegate];
}

id objc_msgSend_shouldRoll(void *a1, const char *a2, ...)
{
  return [a1 shouldRoll];
}

id objc_msgSend_shouldRollStingray(void *a1, const char *a2, ...)
{
  return [a1 shouldRollStingray];
}

id objc_msgSend_startBackupOfNewMobileBackupIdentities(void *a1, const char *a2, ...)
{
  return [a1 startBackupOfNewMobileBackupIdentities];
}

id objc_msgSend_statModify(void *a1, const char *a2, ...)
{
  return [a1 statModify];
}

id objc_msgSend_stateObserver(void *a1, const char *a2, ...)
{
  return [a1 stateObserver];
}

id objc_msgSend_stats(void *a1, const char *a2, ...)
{
  return [a1 stats];
}

id objc_msgSend_subscribeAction(void *a1, const char *a2, ...)
{
  return [a1 subscribeAction];
}

id objc_msgSend_supportsNewProtocol(void *a1, const char *a2, ...)
{
  return [a1 supportsNewProtocol];
}

id objc_msgSend_supportsPCSKeySync(void *a1, const char *a2, ...)
{
  return [a1 supportsPCSKeySync];
}

id objc_msgSend_syncDevices(void *a1, const char *a2, ...)
{
  return [a1 syncDevices];
}

id objc_msgSend_syncDidComplete(void *a1, const char *a2, ...)
{
  return [a1 syncDidComplete];
}

id objc_msgSend_syncKeysWithDatabase(void *a1, const char *a2, ...)
{
  return [a1 syncKeysWithDatabase];
}

id objc_msgSend_syncSessionType(void *a1, const char *a2, ...)
{
  return [a1 syncSessionType];
}

id objc_msgSend_syncUserRegistry(void *a1, const char *a2, ...)
{
  return [a1 syncUserRegistry];
}

id objc_msgSend_syncing(void *a1, const char *a2, ...)
{
  return [a1 syncing];
}

id objc_msgSend_syncingManager(void *a1, const char *a2, ...)
{
  return [a1 syncingManager];
}

id objc_msgSend_syncingQueue(void *a1, const char *a2, ...)
{
  return [a1 syncingQueue];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeUntilSyncing(void *a1, const char *a2, ...)
{
  return [a1 timeUntilSyncing];
}

id objc_msgSend_timeoutTimer(void *a1, const char *a2, ...)
{
  return [a1 timeoutTimer];
}

id objc_msgSend_transport(void *a1, const char *a2, ...)
{
  return [a1 transport];
}

id objc_msgSend_trigger(void *a1, const char *a2, ...)
{
  return [a1 trigger];
}

id objc_msgSend_triggerKeyRolling(void *a1, const char *a2, ...)
{
  return [a1 triggerKeyRolling];
}

id objc_msgSend_triggerWatchSyncing(void *a1, const char *a2, ...)
{
  return [a1 triggerWatchSyncing];
}

id objc_msgSend_triggerWatchSyncingAction(void *a1, const char *a2, ...)
{
  return [a1 triggerWatchSyncingAction];
}

id objc_msgSend_updateLastSeen(void *a1, const char *a2, ...)
{
  return [a1 updateLastSeen];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userRegistry(void *a1, const char *a2, ...)
{
  return [a1 userRegistry];
}

id objc_msgSend_userdb(void *a1, const char *a2, ...)
{
  return [a1 userdb];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_wStateChanged(void *a1, const char *a2, ...)
{
  return [a1 wStateChanged];
}

id objc_msgSend_waitUntilFinished(void *a1, const char *a2, ...)
{
  return [a1 waitUntilFinished];
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return [a1 weakObjectsHashTable];
}

id objc_msgSend_zoneID(void *a1, const char *a2, ...)
{
  return [a1 zoneID];
}

id objc_msgSend_zoneReset(void *a1, const char *a2, ...)
{
  return [a1 zoneReset];
}