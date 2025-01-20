void sub_100003FC0(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;

  v2 = sub_100005560();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = [v3 _handlesInternal];
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@: removeAllFriendHandles: %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = [*(id *)(a1 + 32) _handlesInternal];
  [v5 removeAllObjects];
}

void sub_10000411C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = sub_100005560();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      id v6 = WeakRetained;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "📩 Connection invalidated from: %@", (uint8_t *)&v5, 0xCu);
    }

    [WeakRetained removeAllFriendHandles];
    [WeakRetained invalidate];
    v3 = +[FMFXPCSessionManager sharedInstance];
    [v3 removeClientSession:WeakRetained];

    v4 = sub_100005560();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      id v6 = WeakRetained;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "📩 Releasing session: %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

void sub_10000483C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000049CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100004A48(uint64_t a1)
{
  v2 = +[FMFDataManager sharedInstance];
  v3 = [v2 deviceSharingLocation];

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    v4 = +[FMFCommandManager sharedInstance];
    unsigned __int8 v5 = [v4 hasModelInitialized];

    if ((v5 & 1) == 0)
    {
      id v6 = sub_100005560();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        int v16 = 138412546;
        uint64_t v17 = v7;
        __int16 v18 = 2112;
        v19 = v3;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: Model not initialized on completion. Returning last known deviceSharingLocation: %@", (uint8_t *)&v16, 0x16u);
      }
    }
  }
  if (*(void *)(a1 + 40))
  {
    v8 = sub_100005560();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      int v11 = *(unsigned __int8 *)(a1 + 56);
      int v16 = 138413058;
      uint64_t v17 = v9;
      __int16 v18 = 2112;
      v19 = v3;
      __int16 v20 = 2112;
      uint64_t v21 = v10;
      __int16 v22 = 1024;
      int v23 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@: Returning deviceSharingLocation: %@, clientError?: %@, model initialized? %d", (uint8_t *)&v16, 0x26u);
    }

    v12 = sub_100005560();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v13)
      {
        uint64_t v14 = *(void *)(a1 + 32);
        int v16 = 138412290;
        uint64_t v17 = v14;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@: Able to determine sharing device, completing successfully", (uint8_t *)&v16, 0xCu);
      }
    }
    else if (v13)
    {
      uint64_t v15 = *(void *)(a1 + 32);
      int v16 = 138412290;
      uint64_t v17 = v15;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@: Not able to determine sharing device, completing with error", (uint8_t *)&v16, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_1000054EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id obj)
{
}

id sub_100005560()
{
  if (qword_1000BB7A8 != -1) {
    dispatch_once(&qword_1000BB7A8, &stru_1000A24D8);
  }
  v0 = (void *)qword_1000BB7B0;

  return v0;
}

void sub_1000058F8(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) internalClientSessions];
  id v3 = [v2 count];

  v4 = [*(id *)(a1 + 32) internalClientSessions];
  [v4 setObject:&off_1000A8F80 forKey:*(void *)(a1 + 40)];

  unsigned __int8 v5 = [*(id *)(a1 + 32) internalClientSessions];
  id v6 = [v5 count];

  if (v6 > v3)
  {
    uint64_t v7 = sub_100005560();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = [*(id *)(a1 + 32) internalClientSessions];
      id v10 = [v9 count];
      int v11 = [*(id *)(a1 + 32) _internalClientSessionPIDsString];
      int v12 = 138412802;
      uint64_t v13 = v8;
      __int16 v14 = 2048;
      id v15 = v10;
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "📩 Added: %@ (%lu active pids: {%@})", (uint8_t *)&v12, 0x20u);
    }
  }
}

void sub_100005A58(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) internalClientSessions];
  id v3 = [v2 count];

  v4 = [*(id *)(a1 + 32) internalClientSessions];
  [v4 removeObjectForKey:*(void *)(a1 + 40)];

  unsigned __int8 v5 = [*(id *)(a1 + 32) internalClientSessions];
  id v6 = [v5 count];

  if (v6 < v3)
  {
    uint64_t v7 = sub_100005560();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = [*(id *)(a1 + 32) internalClientSessions];
      id v10 = [v9 count];
      int v11 = [*(id *)(a1 + 32) _internalClientSessionPIDsString];
      int v12 = 138412802;
      uint64_t v13 = v8;
      __int16 v14 = 2048;
      id v15 = v10;
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "📩 Removed: %@ (%lu active pids: {%@})", (uint8_t *)&v12, 0x20u);
    }
  }
}

void sub_100005C80(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100005DF4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000066F8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 144));
  _Unwind_Resume(a1);
}

void sub_1000072A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000072C4(id a1, NSError *a2)
{
  v2 = a2;
  if (v2)
  {
    uint64_t v3 = sub_100005560();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v4 = 138412290;
      unsigned __int8 v5 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Error initing from sessionWasCreatedRefresh: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

void sub_1000075C8(uint64_t a1)
{
}

void sub_1000075D0(uint64_t a1)
{
}

void sub_1000075D8(uint64_t a1)
{
}

void sub_1000075E0(uint64_t a1)
{
}

void sub_1000075E8(uint64_t a1)
{
}

void sub_1000075F0(uint64_t a1)
{
}

void sub_1000075F8(uint64_t a1)
{
}

void sub_100007600(uint64_t a1)
{
}

uint64_t sub_100007608(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_100007618(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_100007628(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_100007638(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_100007648(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_100007658(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_100007668(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_100007678(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100007760()
{
  v0 = sub_100005560();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_INFO, "Creating shared instance of FMFNetworkObserver", v6, 2u);
  }

  id v1 = objc_alloc_init((Class)objc_opt_class());
  v2 = (void *)qword_1000BB680;
  qword_1000BB680 = (uint64_t)v1;

  uint64_t v3 = +[CPNetworkObserver sharedNetworkObserver];
  [v3 addNetworkReachableObserver:qword_1000BB680 selector:"_reportReachabilityChange:"];

  int v4 = +[CPNetworkObserver sharedNetworkObserver];
  id v5 = [v4 isNetworkReachable];
  [(id)qword_1000BB680 setIsReachable:v5];
}

void sub_10000793C(uint64_t a1)
{
  v2 = [*(id *)(a1 + 40) userInfo];
  uint64_t v3 = [v2 objectForKey:CPNetworkObserverReachable];
  [*(id *)(a1 + 32) setIsReachable:[v3 BOOLValue]];

  int v4 = sub_100005560();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    unsigned int v5 = [*(id *)(a1 + 32) isReachable];
    *(_DWORD *)buf = 67109120;
    unsigned int v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "FMFNetworkObserver reachability changed. Is reachable: %d", buf, 8u);
  }

  id v6 = [NSNumber numberWithBool:[*(id *)(a1 + 32) isReachable:status]];
  id v10 = v6;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];

  uint64_t v8 = +[NSNotificationCenter defaultCenter];
  [v8 postNotificationName:off_1000BAFD8 object:*(void *)(a1 + 32) userInfo:v7];
}

uint64_t start()
{
  id v1 = +[Daemon sharedInstance];
  [v1 run];

  v2 = +[NSRunLoop mainRunLoop];
  [v2 run];

  return 0;
}

void sub_100008F40(id a1)
{
  qword_1000BB690 = objc_opt_new();

  _objc_release_x1();
}

void sub_100009B68()
{
  v0 = sub_100005560();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_INFO, "Creating shared instance of FMFDStoreController", v10, 2u);
  }

  id v1 = objc_alloc_init(FMFDStoreController);
  v2 = (void *)qword_1000BB6A0;
  qword_1000BB6A0 = (uint64_t)v1;

  dispatch_queue_t v3 = dispatch_queue_create("com.apple.icloud.fmfd.storecontroller", 0);
  [(id)qword_1000BB6A0 setQueue:v3];

  id v4 = objc_alloc((Class)FMDataArchiver);
  unsigned int v5 = [(id)objc_opt_class() cacheFileURL];
  id v6 = [v4 initWithFileURL:v5];

  [v6 setDataProtectionClass:3];
  [v6 setBackedUp:0];
  [v6 setCreateDirectories:1];
  [(id)qword_1000BB6A0 setDataArchiver:v6];
  id v7 = objc_alloc_init((Class)FMKeychainManager);
  [(id)qword_1000BB6A0 setKeychainManager:v7];
  uint64_t v8 = +[NSNotificationCenter defaultCenter];
  [v8 addObserver:qword_1000BB6A0 selector:"accountWasRemoved" name:off_1000BAFC0 object:0];

  uint64_t v9 = +[NSNotificationCenter defaultCenter];
  [v9 addObserver:qword_1000BB6A0 selector:"cleanupOldModel" name:off_1000BAFE8 object:0];
}

void sub_10000A048(uint64_t a1)
{
  [(id)objc_opt_class() cleanupLegacyStoredDataIfNeeded];
  uint64_t v2 = *(void *)(a1 + 40);
  id v15 = 0;
  dispatch_queue_t v3 = +[NSKeyedArchiver archivedDataWithRootObject:v2 requiringSecureCoding:1 error:&v15];
  id v4 = v15;
  if (v4)
  {
    id v5 = v4;
    id v6 = sub_100005560();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10006AA88(v5);
    }
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) passwordData];
    id v14 = 0;
    id v6 = [v3 encryptWithKey:v7 error:&v14];
    id v5 = v14;

    if (v5)
    {
      uint64_t v8 = sub_100005560();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10006AA04(v5);
      }
    }
    else
    {
      CFStringRef v18 = @"modelCache";
      v19 = v6;
      uint64_t v8 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      uint64_t v9 = [*(id *)(a1 + 32) dataArchiver];
      id v13 = 0;
      [v9 saveDictionary:v8 error:&v13];
      id v5 = v13;

      id v10 = sub_100005560();
      int v11 = v10;
      if (v5)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_10006A980(v5);
        }
      }
      else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v17 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Updating local model cache with data: %@", buf, 0xCu);
      }
    }
  }
}

void sub_10000A838()
{
  v0 = +[NSFileManager defaultManager];
  id v1 = [(id)objc_opt_class() cacheFileURL];
  id v5 = 0;
  [v0 removeItemAtURL:v1 error:&v5];
  id v2 = v5;

  dispatch_queue_t v3 = sub_100005560();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10006AC98(v2);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v7 = off_1000BAC60[0];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Removed local model cache for key: %@", buf, 0xCu);
  }
}

void sub_10000A9EC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

BOOL sub_10000AC8C(id a1, CKShareParticipant *a2)
{
  return (id)[(CKShareParticipant *)a2 acceptanceStatus] == (id)2;
}

uint64_t sub_10000ACB0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

uint64_t sub_10000ACD4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

BOOL sub_10000AD4C(id a1, CKShareParticipant *a2)
{
  return [(CKShareParticipant *)a2 isCurrentUser] ^ 1;
}

void sub_10000AECC(id a1)
{
  qword_1000BB6B0 = objc_opt_new();

  _objc_release_x1();
}

id sub_10000B380(uint64_t a1)
{
  id v2 = sub_100005560();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_queue_t v3 = [*(id *)(a1 + 32) stringFromBootstrapReason:*(void *)(a1 + 40)];
    int v5 = 136315394;
    id v6 = "-[FMFCloudKitManager bootstrapAccountWithReason:]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s: Bootstrapping! For reason: %@", (uint8_t *)&v5, 0x16u);
  }
  return [*(id *)(a1 + 32) bootstrap];
}

void sub_10000B6F8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 104));
  _Unwind_Resume(a1);
}

void sub_10000B744(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 userInfo];
  int v5 = [v4 objectForKeyedSubscript:@"status"];
  unsigned int v6 = [v5 BOOLValue];

  if (v6)
  {
    __int16 v7 = sub_100005560();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      uint64_t v10 = "-[FMFCloudKitManager bootstrap]_block_invoke";
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: note: %@", (uint8_t *)&v9, 0x16u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained postNotificationName:@"FMFCloudKitManagerRetryBootstrapNotification" object:*(void *)(a1 + 32)];
  }
}

void sub_10000B86C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100005560();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    __int16 v7 = "-[FMFCloudKitManager bootstrap]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: note: %@", (uint8_t *)&v6, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained postNotificationName:@"FMFCloudKitManagerRetryBootstrapNotification" object:*(void *)(a1 + 32)];
}

void sub_10000B958(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) setBoostrapScheduled:0];
  if (v3)
  {
    uint64_t v4 = sub_100005560();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10006AD1C();
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v13 = 0x3032000000;
    id v14 = sub_100007608;
    id v15 = sub_1000075C8;
    id v16 = 0;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    int v6 = +[NSOperationQueue mainQueue];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000BB9C;
    v10[3] = &unk_1000A1610;
    objc_copyWeak(&v11, (id *)(a1 + 40));
    v10[4] = *(void *)(a1 + 32);
    v10[5] = &buf;
    uint64_t v7 = [WeakRetained addObserverForName:@"FMFCloudKitManagerRetryBootstrapNotification" object:0 queue:v6 usingBlock:v10];
    __int16 v8 = *(void **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v7;

    _Block_object_dispose(&buf, 8);
    objc_destroyWeak(&v11);
  }
  else
  {
    [*(id *)(a1 + 32) fetchChangesWithCompletion:&stru_1000A1650];
    id v9 = sub_100005560();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[FMFCloudKitManager bootstrap]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: bootstrapped privateCloudDatabase", (uint8_t *)&buf, 0xCu);
    }
  }
}

void sub_10000BB80(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000BB9C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100005560();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    uint64_t v7 = "-[FMFCloudKitManager bootstrap]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: note: %@", (uint8_t *)&v6, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained removeObserver:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

  [*(id *)(a1 + 32) bootstrapAccountWithReason:2];
}

void sub_10000BC94(id a1, NSError *a2)
{
  if (!a2)
  {
    id v2 = sub_100005560();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 136315138;
      uint64_t v4 = "-[FMFCloudKitManager bootstrap]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s: bootstrap changes fetched", (uint8_t *)&v3, 0xCu);
    }
  }
}

void sub_10000BE84(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5 || v6)
  {
    uint64_t v13 = sub_100005560();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10006AD90();
    }

    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    id v8 = objc_alloc((Class)CKRecordZoneID);
    uint64_t v9 = a1[4];
    uint64_t v10 = [v5 recordName];
    id v11 = [v8 initWithZoneName:v9 ownerName:v10];

    id v12 = [objc_alloc((Class)CKRecordID) initWithRecordName:a1[5] zoneID:v11];
    (*(void (**)(void))(a1[6] + 16))();
  }
}

void sub_10000C1A8(id a1, NSArray *a2, NSArray *a3, NSError *a4)
{
  uint64_t v4 = a4;
  id v5 = sub_100005560();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10006AE04(v4, v6);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    CFStringRef v8 = @"private-changes";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Successfully subscribed to %@.", (uint8_t *)&v7, 0xCu);
  }
}

void sub_10000C640(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100005560();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v10 = 136315394;
      id v11 = "-[FMFCloudKitManager processCKError:]_block_invoke";
      __int16 v12 = 2112;
      id v13 = v3;
      id v6 = "%s: Delete bootstrap zone error: %@";
      int v7 = v4;
      uint32_t v8 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v10, v8);
    }
  }
  else if (v5)
  {
    int v10 = 136315138;
    id v11 = "-[FMFCloudKitManager processCKError:]_block_invoke";
    id v6 = "%s: Delete bootstrap zone success";
    int v7 = v4;
    uint32_t v8 = 12;
    goto LABEL_6;
  }

  uint64_t v9 = +[FMXPCTransactionManager sharedInstance];
  [v9 endTransaction:*(void *)(a1 + 32)];
}

void sub_10000C900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10000C924(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1[5] + 8);
  int v7 = *(void **)(v4 + 40);
  BOOL v5 = (id *)(v4 + 40);
  id v6 = v7;
  id v10 = v3;
  if (v7) {
    id v3 = v6;
  }
  objc_storeStrong(v5, v3);
  uint64_t v8 = *(void *)(a1[6] + 8);
  uint64_t v9 = *(void *)(v8 + 24) - 1;
  *(void *)(v8 + 24) = v9;
  if (!v9) {
    (*(void (**)(void))(a1[4] + 16))();
  }
}

void sub_10000CB60(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = sub_100005560();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v5 allKeys];
    int v11 = 136315394;
    __int16 v12 = "-[FMFCloudKitManager removeAllFenceRecordsZonesInDatabase:withCompletion:]_block_invoke";
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: All fetched keys for removal %@", (uint8_t *)&v11, 0x16u);
  }
  if (v5)
  {
    uint64_t v9 = (void *)a1[4];
    id v10 = [v5 allKeys];
    [v9 deleteRecordZonesWithID:v10 fromDatabase:a1[5] withCompletion:&stru_1000A1770];
  }
  (*(void (**)(void))(a1[6] + 16))();
}

void sub_10000CCA0(id a1, NSError *a2)
{
  id v2 = a2;
  id v3 = sub_100005560();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      int v8 = 136315394;
      uint64_t v9 = "-[FMFCloudKitManager removeAllFenceRecordsZonesInDatabase:withCompletion:]_block_invoke";
      __int16 v10 = 2112;
      int v11 = v2;
      id v5 = "%s: Deletion error for deleting fetched keys %@";
      id v6 = v3;
      uint32_t v7 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v8, v7);
    }
  }
  else if (v4)
  {
    int v8 = 136315138;
    uint64_t v9 = "-[FMFCloudKitManager removeAllFenceRecordsZonesInDatabase:withCompletion:]_block_invoke";
    id v5 = "%s: Successfully deleted fetched keys";
    id v6 = v3;
    uint32_t v7 = 12;
    goto LABEL_6;
  }
}

void sub_10000CF34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10000CF58(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v10 = v3;
  if (v3)
  {
    [*(id *)(a1 + 32) processCKError:v3];
    id v3 = v10;
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint32_t v7 = *(void **)(v4 + 40);
  id v5 = (id *)(v4 + 40);
  id v6 = v7;
  if (v7) {
    id v3 = v6;
  }
  objc_storeStrong(v5, v3);
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v9 = *(void *)(v8 + 24) - 1;
  *(void *)(v8 + 24) = v9;
  if (!v9) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_10000D3C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 216), 8);
  _Unwind_Resume(a1);
}

id sub_10000D3E4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

id sub_10000D3F0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void sub_10000D3FC(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1[5] + 8);
  uint32_t v7 = *(void **)(v4 + 40);
  id v5 = (id *)(v4 + 40);
  id v6 = v7;
  id v10 = v3;
  if (v7) {
    id v3 = v6;
  }
  objc_storeStrong(v5, v3);
  uint64_t v8 = *(void *)(a1[6] + 8);
  uint64_t v9 = *(void *)(v8 + 24) - 1;
  *(void *)(v8 + 24) = v9;
  if (!v9) {
    (*(void (**)(void))(a1[4] + 16))();
  }
}

void sub_10000D48C(uint64_t a1, void *a2)
{
  id v3 = a2;
  ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint32_t v7 = *(void **)(a1 + 56);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000D584;
  v9[3] = &unk_1000A1810;
  v9[4] = v5;
  v9[5] = v6;
  v9[6] = v4;
  id v10 = v3;
  id v11 = v7;
  id v12 = *(id *)(a1 + 64);
  id v8 = v3;
  [v4 fetchChangedRecordZonesWithID:v5 andDeleteRecordZonesWithID:v6 fromDatabase:v7 withCompletion:v9];
}

void sub_10000D584(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    [*(id *)(a1 + 32) removeAllObjects];
    [*(id *)(a1 + 40) removeAllObjects];
    uint64_t v4 = [*(id *)(a1 + 48) cache];
    uint64_t v5 = *(void *)(a1 + 56);
    id v6 = [*(id *)(a1 + 64) scope];
    id v7 = 0;
    [v4 updateServerChangeToken:v5 forDatabaseWithScope:v6 error:&v7];
    id v3 = v7;
  }
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

void sub_10000D628(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id v8 = v7;
  if (!v6 || v7)
  {
    uint64_t v9 = *(void *)(a1 + 40);
    if (v7)
    {
      (*(void (**)(uint64_t, id))(v9 + 16))(v9, v7);
    }
    else
    {
      uint64_t v10 = FMFErrorDomain;
      NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
      CFStringRef v14 = @"no zoneServerChangeToken";
      id v11 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
      id v12 = +[NSError errorWithDomain:v10 code:1018 userInfo:v11];
      (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v12);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_10000D928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10000D94C(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v7 = *(void **)(v4 + 40);
  uint64_t v5 = (id *)(v4 + 40);
  id v6 = v7;
  id v10 = v3;
  if (v7) {
    id v3 = v6;
  }
  objc_storeStrong(v5, v3);
  uint64_t v8 = *(void *)(a1[6] + 8);
  uint64_t v9 = *(void *)(v8 + 24) - 1;
  *(void *)(v8 + 24) = v9;
  if (!v9) {
    (*(void (**)(void))(a1[4] + 16))();
  }
}

void sub_10000E000(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

id sub_10000E038(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

id sub_10000E044(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void sub_10000E050(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v7 = *(id *)(a1 + 32);
  id v8 = [v7 countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v51;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v51 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v50 + 1) + 8 * i);
        NSErrorUserInfoKey v13 = [*(id *)(a1 + 40) cache];
        id v14 = [*(id *)(a1 + 48) scope];
        id v49 = 0;
        [v13 updateRecord:v12 inDatabaseWithScope:v14 error:&v49];
        id v15 = v49;

        uint64_t v16 = *(void *)(*(void *)(a1 + 64) + 8);
        v19 = *(void **)(v16 + 40);
        uint64_t v17 = (id *)(v16 + 40);
        CFStringRef v18 = v19;
        if (v19) {
          __int16 v20 = v18;
        }
        else {
          __int16 v20 = v15;
        }
        objc_storeStrong(v17, v20);
      }
      id v9 = [v7 countByEnumeratingWithState:&v50 objects:v55 count:16];
    }
    while (v9);
  }

  [*(id *)(a1 + 32) removeAllObjects];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v21 = *(id *)(a1 + 56);
  id v22 = [v21 countByEnumeratingWithState:&v45 objects:v54 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v46;
    do
    {
      for (j = 0; j != v23; j = (char *)j + 1)
      {
        if (*(void *)v46 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void *)(*((void *)&v45 + 1) + 8 * (void)j);
        v27 = [*(id *)(a1 + 40) cache];
        id v28 = [*(id *)(a1 + 48) scope];
        id v44 = 0;
        [v27 removeRecordWithID:v26 inDatabaseWithScope:v28 error:&v44];
        id v29 = v44;

        uint64_t v30 = *(void *)(*(void *)(a1 + 64) + 8);
        v33 = *(void **)(v30 + 40);
        v31 = (id *)(v30 + 40);
        uint64_t v32 = v33;
        if (v33) {
          v34 = v32;
        }
        else {
          v34 = v29;
        }
        objc_storeStrong(v31, v34);
      }
      id v23 = [v21 countByEnumeratingWithState:&v45 objects:v54 count:16];
    }
    while (v23);
  }

  [*(id *)(a1 + 56) removeAllObjects];
  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    v35 = [*(id *)(a1 + 40) cache];
    id v36 = [*(id *)(a1 + 48) scope];
    id v43 = 0;
    [v35 updateServerChangeToken:v6 forZoneWithID:v5 inDatabaseWithScope:v36 error:&v43];
    id v37 = v43;

    uint64_t v38 = *(void *)(*(void *)(a1 + 64) + 8);
    v41 = *(void **)(v38 + 40);
    v39 = (id *)(v38 + 40);
    v40 = v41;
    if (v41) {
      v42 = v40;
    }
    else {
      v42 = v37;
    }
    objc_storeStrong(v39, v42);
  }
}

void sub_10000E328(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  unint64_t v14 = (unint64_t)v13;
  if (!v11 || v13)
  {
    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
    unint64_t v18 = *(void *)(v15 + 40);
    uint64_t v16 = (id *)(v15 + 40);
    uint64_t v17 = (void *)v18;
    if (v18 | v14)
    {
      if (v17) {
        v19 = v17;
      }
      else {
        v19 = (void *)v14;
      }
      objc_storeStrong(v16, v19);
    }
    else
    {
      uint64_t v20 = FMFErrorDomain;
      NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
      CFStringRef v26 = @"no zoneServerChangeToken";
      id v21 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      uint64_t v22 = +[NSError errorWithDomain:v20 code:1018 userInfo:v21];
      uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v24 = *(void **)(v23 + 40);
      *(void *)(v23 + 40) = v22;
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_10000E498(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v4 + 40);
  id v5 = (id *)(v4 + 40);
  id v6 = v7;
  if (v7) {
    id v8 = v6;
  }
  else {
    id v8 = a2;
  }
  objc_storeStrong(v5, v8);
  id v9 = a2;
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v8);
}

uint64_t sub_10000E7A0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000E8F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v3();
  }
  else
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000E9DC;
    v8[3] = &unk_1000A1978;
    uint64_t v7 = *(void *)(a1 + 48);
    id v9 = *(id *)(a1 + 56);
    [v5 updateRecord:v6 andShare:a2 inDatabase:v7 withCompletion:v8];
  }
}

void sub_10000E9DC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else if (v8)
  {
    id v11 = sub_100005560();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315650;
      id v13 = "-[FMFCloudKitManager updateRecord:inZoneSharedWith:inDatabaseWithScope:withCompletion:]_block_invoke_2";
      __int16 v14 = 2112;
      id v15 = v8;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: savedShare: %@ savedRecord: %@", (uint8_t *)&v12, 0x20u);
    }

    id v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    id v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v10();
}

void sub_10000EC48(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v3();
  }
  else
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000ED4C;
    v8[3] = &unk_1000A19C8;
    id v12 = *(id *)(a1 + 64);
    id v6 = *(id *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 32);
    id v9 = v6;
    uint64_t v10 = v7;
    id v11 = *(id *)(a1 + 56);
    [v4 fetchShareParticipantsForHandles:v5 withCompletion:v8];
  }
}

void sub_10000ED4C(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v5 = [objc_alloc((Class)CKRecordID) initWithRecordName:CKRecordNameZoneWideShare zoneID:*(void *)(a1 + 32)];
    id v6 = [*(id *)(a1 + 40) recordWithID:v5 inScope:[*(id *)(a1 + 48) scope]];
    uint64_t v7 = v6;
    if (v6) {
      id v8 = v6;
    }
    else {
      id v8 = [objc_alloc((Class)CKShare) initWithRecordZoneID:*(void *)(a1 + 32)];
    }
    id v9 = v8;

    [v9 setFmf_otherParticipants:v10];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t sub_10000F024(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000F1C0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10000F3DC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t sub_10000F3E8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2);
}

void sub_10000F5FC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v23 = a3;
  id v8 = a4;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v9 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v9)
  {
    id v10 = v9;
    id v11 = 0;
    uint64_t v12 = *(void *)v27;
    do
    {
      id v13 = 0;
      __int16 v14 = v11;
      do
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v7);
        }
        uint64_t v15 = *(void *)(*((void *)&v26 + 1) + 8 * (void)v13);
        __int16 v16 = [*(id *)(a1 + 32) cache:v23];
        id v17 = [*(id *)(a1 + 40) scope];
        id v25 = 0;
        [v16 updateRecord:v15 inDatabaseWithScope:v17 error:&v25];
        id v18 = v25;

        if (v14) {
          v19 = v14;
        }
        else {
          v19 = v18;
        }
        id v11 = v19;

        id v13 = (char *)v13 + 1;
        __int16 v14 = v11;
      }
      while (v10 != v13);
      id v10 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v10);
  }
  else
  {
    id v11 = 0;
  }
  uint64_t v20 = [v7 fm_firstObjectPassingTest:&stru_1000A1AA8, v23];
  id v21 = [v7 fm_firstObjectPassingTest:&stru_1000A1AC8];
  if (v8) {
    id v22 = v8;
  }
  else {
    id v22 = v11;
  }
  (*(void (**)(void, void *, void *, id))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v21, v20, v22);
}

BOOL sub_10000F7E4(id a1, CKRecord *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

BOOL sub_10000F830(id a1, CKRecord *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

id sub_10000F890(id a1, FMFHandle *a2)
{
  id v2 = [(FMFHandle *)a2 identifier];
  BOOL IsEmail = FMFStringIsEmail(v2);
  id v4 = objc_alloc((Class)CKUserIdentityLookupInfo);
  if (IsEmail) {
    id v5 = [v4 initWithEmailAddress:v2];
  }
  else {
    id v5 = [v4 initWithPhoneNumber:v2];
  }
  id v6 = v5;

  return v6;
}

void sub_10000FEA0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    unint64_t v5 = (unint64_t)[v3 code];
    if (v5 <= 0x22 && ((1 << v5) & 0x4029000F8) != 0 || v5 == 111)
    {
      id v6 = sub_100005560();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10006AFA0();
      }

      v32[0] = @"acceptCKShareOperationSuccessful";
      v32[1] = @"ckShareRetryAvailable";
      v33[0] = &off_1000A8EF0;
      v33[1] = &off_1000A8F08;
      v33[2] = &off_1000A8EF0;
      v32[2] = @"ckShareRetryCount";
      v32[3] = @"acceptCKShareError";
      [v4 code];
      id v7 = stringForCKErrorCode();
      v33[3] = v7;
      id v8 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:4];
      AnalyticsSendEvent();

      [*(id *)(a1 + 48) retryAcceptShareWithURLString:*(void *)(a1 + 32) invitationToken:*(void *)(a1 + 40) forError:v4 retryCount:0];
    }
    else
    {
      __int16 v16 = sub_100005560();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10006AF28();
      }

      v30[0] = @"acceptCKShareOperationSuccessful";
      v30[1] = @"ckShareRetryAvailable";
      v31[0] = &off_1000A8EF0;
      v31[1] = &off_1000A8EF0;
      v31[2] = &off_1000A8EF0;
      v30[2] = @"ckShareRetryCount";
      v30[3] = @"acceptCKShareError";
      [v4 code];
      id v17 = stringForCKErrorCode();
      v31[3] = v17;
      id v18 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:4];
      AnalyticsSendEvent();

      v19 = [*(id *)(a1 + 48) cache];
      uint64_t v20 = *(void *)(a1 + 56);
      uint64_t v23 = 0;
      [v19 removeUnacceptedShareInvitationWithShareURLString:v20 inDatabaseWithScope:3 error:&v23];
    }
  }
  else
  {
    id v9 = sub_100005560();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 136315650;
      id v25 = "-[FMFCloudKitManager acceptCKShareWithURLString:invitationTokenBase64String:]_block_invoke";
      __int16 v26 = 2112;
      uint64_t v27 = v10;
      __int16 v28 = 2112;
      uint64_t v29 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: success without retry: shareURL: %@ invitationToken: %@", buf, 0x20u);
    }

    AnalyticsSendEvent();
    uint64_t v12 = [*(id *)(a1 + 48) cache];
    uint64_t v13 = *(void *)(a1 + 56);
    id v22 = 0;
    [v12 removeUnacceptedShareInvitationWithShareURLString:v13 inDatabaseWithScope:3 error:&v22];
    id v14 = v22;

    uint64_t v15 = *(void **)(a1 + 48);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100010214;
    v21[3] = &unk_1000A1708;
    v21[4] = v15;
    [v15 fetchChangesWithCompletion:v21];
  }
}

void sub_100010214(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = sub_100005560();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10006B018();
    }
  }
  else
  {
    unint64_t v5 = +[NSNotificationCenter defaultCenter];
    [v5 postNotificationName:@"FMFCloudKitManagerRecordsDidChangeNotification" object:*(void *)(a1 + 32)];
  }
}

void sub_1000105C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_1000105FC(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v10 = *(void **)(v7 + 40);
  id v8 = (id *)(v7 + 40);
  id v9 = v10;
  if (v10) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = a4;
  }
  objc_storeStrong(v8, v11);
  id v14 = a4;
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v6;
}

void sub_100010680(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v7 = *(void **)(v4 + 40);
  unint64_t v5 = (id *)(v4 + 40);
  id v6 = v7;
  if (v7) {
    id v8 = v6;
  }
  else {
    id v8 = v3;
  }
  objc_storeStrong(v5, v8);
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    uint64_t v9 = *(void *)(a1 + 48);
    if (v9) {
      (*(void (**)(void))(v9 + 16))();
    }
  }
  else
  {
    id v10 = objc_alloc((Class)CKAcceptSharesOperation);
    uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    uint64_t v11 = +[NSArray arrayWithObjects:&v22 count:1];
    id v12 = [v10 initWithShareMetadatas:v11];

    uint64_t v13 = [v12 configuration];
    [v13 setDiscretionaryNetworkBehavior:0];

    id v14 = [*(id *)(a1 + 32) container];
    uint64_t v15 = [v12 configuration];
    [v15 setContainer:v14];

    [v12 setGroup:*(void *)(a1 + 40)];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000108C4;
    v21[3] = &unk_1000A1BA8;
    v21[4] = *(void *)(a1 + 56);
    [v12 setPerShareCompletionBlock:v21];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000108DC;
    v19[3] = &unk_1000A1BD0;
    long long v18 = *(_OWORD *)(a1 + 48);
    id v16 = (id)v18;
    long long v20 = v18;
    [v12 setAcceptSharesCompletionBlock:v19];
    id v17 = +[NSOperationQueue mainQueue];
    [v17 addOperation:v12];
  }
}

void sub_1000108C4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v4 + 40);
  unint64_t v5 = (id *)(v4 + 40);
  id v6 = v7;
  if (v7) {
    a4 = v6;
  }
  objc_storeStrong(v5, a4);
}

void sub_1000108DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v4 + 40);
  unint64_t v5 = (id *)(v4 + 40);
  id v6 = v7;
  id v9 = v3;
  if (v7) {
    id v3 = v6;
  }
  objc_storeStrong(v5, v3);
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, void))(v8 + 16))(v8, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
}

void sub_100010C5C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100010D28;
  v10[3] = &unk_1000A1C20;
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(a1 + 40);
  id v11 = v5;
  uint64_t v12 = v6;
  id v13 = v7;
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 64);
  id v14 = v8;
  uint64_t v15 = v9;
  [v2 acceptCKShareWithURL:v3 invitationToken:v4 completion:v10];
}

void sub_100010D28(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    [*(id *)(a1 + 40) retryAcceptShareWithURLString:*(void *)(a1 + 48) invitationToken:*(void *)(a1 + 56) forError:v3 retryCount:*(void *)(a1 + 64)];
    uint64_t v4 = sub_100005560();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(a1 + 56);
      uint64_t v16 = *(void *)(a1 + 64);
      uint64_t v18 = *(void *)(a1 + 48);
      *(_DWORD *)long long buf = 136316162;
      __int16 v26 = "-[FMFCloudKitManager retryAcceptShareWithURLString:invitationToken:forError:retryCount:]_block_invoke_2";
      __int16 v27 = 2112;
      id v28 = v3;
      __int16 v29 = 2048;
      uint64_t v30 = v16;
      __int16 v31 = 2112;
      uint64_t v32 = v18;
      __int16 v33 = 2112;
      uint64_t v34 = v17;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s: error: %@, retryingWithRetryCount: %ld, shareURL: %@ invitationToken: %@", buf, 0x34u);
    }

    v23[0] = @"acceptCKShareOperationSuccessful";
    v23[1] = @"ckShareRetryAvailable";
    v24[0] = &off_1000A8EF0;
    v24[1] = &off_1000A8F08;
    v23[2] = @"ckShareRetryCount";
    id v5 = +[NSNumber numberWithInteger:*(void *)(a1 + 64)];
    v24[2] = v5;
    v23[3] = @"acceptCKShareError";
    [v3 code];
    uint64_t v6 = stringForCKErrorCode();
    v24[3] = v6;
    uint64_t v7 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];
    AnalyticsSendEvent();
  }
  else
  {
    id v8 = sub_100005560();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void **)(a1 + 48);
      uint64_t v10 = *(void *)(a1 + 56);
      *(_DWORD *)long long buf = 136315650;
      __int16 v26 = "-[FMFCloudKitManager retryAcceptShareWithURLString:invitationToken:forError:retryCount:]_block_invoke";
      __int16 v27 = 2112;
      id v28 = v9;
      __int16 v29 = 2112;
      uint64_t v30 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: success with retry: shareURL: %@ invitationToken: %@", buf, 0x20u);
    }

    v21[1] = @"ckShareRetryCount";
    v22[0] = &off_1000A8F08;
    v21[0] = @"acceptCKShareOperationSuccessful";
    id v11 = +[NSNumber numberWithInteger:*(void *)(a1 + 64)];
    v22[1] = v11;
    uint64_t v12 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
    AnalyticsSendEvent();

    id v13 = [*(id *)(a1 + 40) cache];
    id v14 = [*(id *)(a1 + 48) absoluteString];
    id v20 = 0;
    [v13 removeUnacceptedShareInvitationWithShareURLString:v14 inDatabaseWithScope:3 error:&v20];
    id v5 = v20;

    uint64_t v15 = *(void **)(a1 + 40);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100011078;
    v19[3] = &unk_1000A1708;
    void v19[4] = v15;
    [v15 fetchChangesWithCompletion:v19];
  }
}

void sub_100011078(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = sub_100005560();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10006B08C();
    }
  }
  else
  {
    id v5 = +[NSNotificationCenter defaultCenter];
    [v5 postNotificationName:@"FMFCloudKitManagerRecordsDidChangeNotification" object:*(void *)(a1 + 32)];
  }
}

void sub_1000116B4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1000116D0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1000116EC(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x2Au);
}

void sub_100011F30(id a1, NSNotification *a2)
{
  id v2 = sub_100005560();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Received signal USR1...", v3, 2u);
  }
}

void sub_100011F98(id a1, NSNotification *a2)
{
  id v2 = sub_100005560();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Received signal USR2...", v3, 2u);
  }
}

void sub_100012000(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = sub_100005560();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      id v6 = WeakRetained;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "📩 Connection interrupted from: %@", (uint8_t *)&v5, 0xCu);
    }

    [WeakRetained removeAllFriendHandles];
    id v3 = +[FMFXPCSessionManager sharedInstance];
    [v3 removeClientSession:WeakRetained];

    uint64_t v4 = sub_100005560();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      id v6 = WeakRetained;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "📩 Releasing session: %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

void sub_1000121DC(id a1)
{
  id v2 = +[NSNotification notificationWithName:off_1000BAFB8 object:0 userInfo:0];
  uint64_t v1 = +[NSNotificationQueue defaultQueue];
  [v1 enqueueNotification:v2 postingStyle:1 coalesceMask:1 forModes:0];
}

void sub_1000126C4(uint64_t a1)
{
  id v2 = +[FMFCommandManager sharedInstance];
  [v2 refreshDueToTapWithMessage:*(void *)(a1 + 32)];
}

void sub_100012BD8(uint64_t a1)
{
  id v2 = sub_100005560();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = *(_DWORD *)(a1 + 32);
    v5[0] = 67109376;
    v5[1] = v3;
    __int16 v6 = 1024;
    int v7 = MKBDeviceUnlockedSinceBoot();
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "First unlock notification received: %d device unlocked status: %d", (uint8_t *)v5, 0xEu);
  }

  dispatch_time_t v4 = dispatch_time(0, 5000000000);
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, &stru_1000A1D28);
}

void sub_100012CB8(id a1)
{
  uint64_t v1 = sub_100005560();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Updating account after first unlock.", buf, 2u);
  }

  +[FMFDStoreController cleanupLegacyStoredDataIfNeeded];
  id v2 = +[FMFAccountManager sharedInstance];
  [v2 updateAccountInfo];

  int v3 = sub_100005560();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Sending lazy init after first unlock.", v5, 2u);
  }

  dispatch_time_t v4 = +[FMFCommandManager sharedInstance];
  [v4 sendInitWithLazyCheckForSession:0 withReason:7 completion:0];
}

void sub_100012E88(id a1)
{
  uint64_t v1 = objc_alloc_init(FMFLazyInitController);
  id v2 = (void *)qword_1000BB6C0;
  qword_1000BB6C0 = (uint64_t)v1;

  int v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:qword_1000BB6C0 selector:"accountWasRemoved:" name:off_1000BAFC0 object:0];

  dispatch_time_t v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:qword_1000BB6C0 selector:"accountWasRemoved:" name:off_1000BAFE8 object:0];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:qword_1000BB6C0 selector:"modelDidLoadSuccessfully:" name:off_1000BAFE0 object:0];
}

void sub_100013CAC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000144BC(uint64_t a1)
{
  size_t size = 0;
  sysctlbyname("hw.machine", 0, &size, 0, 0);
  id v2 = malloc_type_malloc(size, 0x4C14EED8uLL);
  sysctlbyname("hw.machine", v2, &size, 0, 0);
  if (v2)
  {
    uint64_t v3 = +[NSString stringWithCString:v2 encoding:4];
    dispatch_time_t v4 = (void *)qword_1000BB6D0;
    qword_1000BB6D0 = v3;
  }
  free(v2);
  if ([(id)qword_1000BB6D0 isEqualToString:@"i386"])
  {
    uint64_t v5 = [*(id *)(a1 + 32) deviceClass];
    __int16 v6 = (void *)qword_1000BB6D0;
    qword_1000BB6D0 = v5;
  }
}

void sub_10001471C(id a1)
{
  uint64_t v1 = +[NSBundle mainBundle];
  id v2 = [v1 pathForResource:@"Settings" ofType:@"bundle"];

  if (v2)
  {
    uint64_t v3 = +[NSBundle bundleWithPath:v2];
    dispatch_time_t v4 = v3;
    if (v3)
    {
      uint64_t v5 = [v3 pathForResource:@"Root" ofType:@"plist"];
      if (v5)
      {
        uint64_t v32 = v4;
        __int16 v33 = v2;
        __int16 v31 = v5;
        uint64_t v30 = +[NSDictionary dictionaryWithContentsOfFile:v5];
        [v30 objectForKey:@"PreferenceSpecifiers"];
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v6 = (id)objc_claimAutoreleasedReturnValue();
        id v7 = [v6 countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = *(void *)v35;
          while (2)
          {
            for (i = 0; i != v8; i = (char *)i + 1)
            {
              if (*(void *)v35 != v9) {
                objc_enumerationMutation(v6);
              }
              id v11 = *(void **)(*((void *)&v34 + 1) + 8 * i);
              uint64_t v12 = [v11 objectForKey:@"Type"];
              if ([v12 isEqualToString:@"PSTitleValueSpecifier"])
              {
                id v13 = [v11 objectForKey:@"Title"];
                unsigned int v14 = [v13 isEqualToString:@"Tag"];

                if (v14)
                {
                  uint64_t v15 = [v11 objectForKey:@"DefaultValue"];
                  id v16 = [v15 mutableCopy];

                  unint64_t v17 = (unint64_t)[v16 rangeOfString:@"("];
                  uint64_t v19 = v18;
                  id v20 = (char *)[v16 rangeOfString:@""]);
                  if (v19 == 1 && v21 == 1)
                  {
                    __int16 v27 = [v16 substringWithRange:v17 + 1, &v20[~v17]];
                    id v28 = [v27 copy];
                    __int16 v29 = (void *)qword_1000BB6E0;
                    qword_1000BB6E0 = (uint64_t)v28;

                    goto LABEL_21;
                  }
                  uint64_t v23 = (void *)qword_1000BB6E0;
                  qword_1000BB6E0 = @"unknown";
                }
              }
            }
            id v8 = [v6 countByEnumeratingWithState:&v34 objects:v38 count:16];
            if (v8) {
              continue;
            }
            break;
          }
        }
LABEL_21:

        dispatch_time_t v4 = v32;
        id v2 = v33;
        uint64_t v5 = v31;
      }
    }
    else
    {
      uint64_t v24 = +[NSBundle mainBundle];
      uint64_t v25 = [v24 objectForInfoDictionaryKey:@"CFBundleVersion"];
      __int16 v26 = (void *)qword_1000BB6E0;
      qword_1000BB6E0 = v25;
    }
  }
}

uint64_t sub_100014AB8(uint64_t a1)
{
  qword_1000BB6F0 = [*(id *)(a1 + 32) _deviceInfoForKey:@"UniqueDeviceID"];

  return _objc_release_x1();
}

void sub_100014D6C(id a1)
{
  uint64_t v1 = objc_alloc_init(FMFBlockListManager);
  id v2 = (void *)qword_1000BB700;
  qword_1000BB700 = (uint64_t)v1;

  uint64_t v3 = qword_1000BB700;
  uint64_t v4 = TUPrivacyRulesChangedNotification;

  _TUAddLocalNSObserver(v3, "_rulesChanged:", v4, 0);
}

BOOL sub_100014E44(void *a1)
{
  uint64_t v1 = a1;
  if ([(__CFString *)v1 length]) {
    BOOL v2 = CFStringFind(v1, @"@", 0).location != -1;
  }
  else {
    BOOL v2 = 1;
  }

  return v2;
}

void sub_1000152F4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = sub_100005560();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10006B57C(a1, (uint64_t)v4, v5);
    }
  }
}

void sub_100015520(id a1)
{
  uint64_t v1 = sub_100005560();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Creating shared instance of sharedAddressBook", v5, 2u);
  }

  BOOL v2 = objc_alloc_init(FMFAddressBook);
  uint64_t v3 = (void *)qword_1000BB710;
  qword_1000BB710 = (uint64_t)v2;

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:qword_1000BB710 selector:"contactStoreDidChange" name:CNContactStoreDidChangeNotification object:0];
}

void sub_100015878(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100015A30(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000161E8(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) setIsUpdateGeoFenceCompleted:1];
  id v4 = sub_100005560();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [*(id *)(a1 + 32) identifier];
    int v9 = 138412546;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FMFFenceUpdateOperation %@ update command completed with error? %@", (uint8_t *)&v9, 0x16u);
  }
  if (v3 || [*(id *)(a1 + 32) operationType] == (id)2)
  {
    id v6 = [*(id *)(a1 + 32) fence];
    [*(id *)(a1 + 32) setUpdatedFence:v6];

    id v7 = *(void **)(a1 + 32);
    id v8 = [v7 fence];
    [v7 finishWithFence:v8 error:v3];
  }
}

uint64_t sub_1000168F4()
{
  qword_1000BB728 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

BOOL sub_100017414(id a1, FMFHandle *a2, BOOL *a3)
{
  return [(FMFHandle *)a2 isPending] ^ 1;
}

void sub_1000188D4(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v9 = [v4 statusMapFromServer];
  id v7 = [v5 integerValue];

  id v8 = +[NSNumber numberWithBool:v7 == (id)200];
  [v9 setObject:v8 forKey:v6];
}

void sub_100019AA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v28 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_100019AF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = [*(id *)(a1 + 64) _dayStringForDayOfWeek:a2];
  [*(id *)(a1 + 32) addObject:];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(void *)(v5 + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    *(void *)(v5 + 24) = a3;
  }
  else if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) + 1 != a3)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
}

void sub_10001A07C(id a1)
{
  qword_1000BB730 = (uint64_t)dispatch_queue_create("com.apple.icloud.fmfd.handleTransactionQueue", 0);

  _objc_release_x1();
}

uint64_t sub_10001A270(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001A364(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = +[FMFAccountManager sharedInstance];
  unsigned __int8 v8 = [v7 isAccountSignedIn];

  id v9 = +[FMFSystemInfo sharedInstance];
  unsigned __int8 v10 = [v9 isInMultiUserMode];

  id v11 = [v6 code];
  id v12 = sub_100005560();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11 != (id)1000 || (v8 & 1) != 0 || (v10 & 1) != 0)
  {
    if (v13)
    {
      uint64_t v16 = *(void *)(a1 + 32);
      int v18 = 138412546;
      uint64_t v19 = v16;
      __int16 v20 = 2048;
      id v21 = [v6 code];
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@: Not saving the mapping packet. Error %lu ", (uint8_t *)&v18, 0x16u);
    }
  }
  else
  {
    if (v13)
    {
      uint64_t v14 = *(void *)(a1 + 32);
      int v18 = 138412290;
      uint64_t v19 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@: Requesting storing the mapping packet.", (uint8_t *)&v18, 0xCu);
    }

    uint64_t v15 = +[FMFAccountManager sharedInstance];
    [v15 storeMappingPacket:*(void *)(a1 + 40)];

    [*(id *)(a1 + 32) upselliCloudIfNeeded];
  }
  uint64_t v17 = *(void *)(a1 + 48);
  if (v17) {
    (*(void (**)(uint64_t, id, id))(v17 + 16))(v17, v5, v6);
  }
}

void sub_10001A7A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001A7B8(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _handlesInternal];
  id v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10001A8D4(uint64_t a1)
{
  id v2 = sub_100005560();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 138412546;
    uint64_t v44 = v3;
    __int16 v45 = 2112;
    uint64_t v46 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@: addFriendHandles: %@", buf, 0x16u);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v30 = a1;
  id v5 = *(id *)(a1 + 32);
  id v6 = [v5 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v38;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned __int8 v10 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        id v11 = +[NSDate date];
        [v11 timeIntervalSince1970];
        BOOL v13 = +[NSNumber numberWithDouble:floor(v12 * 1000.0)];

        [v10 setTrackingTimestamp:v13];
        uint64_t v14 = +[FMFXPCSessionManager sharedInstance];
        [v14 updateTrackingTimestampForHandle:v10 timestamp:v13];
      }
      id v7 = [v5 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v7);
  }

  uint64_t v15 = [*(id *)(v30 + 40) handlesQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001AC68;
  block[3] = &unk_1000A1468;
  int8x16_t v29 = *(int8x16_t *)(v30 + 32);
  id v16 = (id)v29.i64[0];
  int8x16_t v36 = vextq_s8(v29, v29, 8uLL);
  dispatch_sync(v15, block);

  uint64_t v17 = +[FMFXPCSessionManager sharedInstance];
  [v17 refreshLocationsForSession:*(void *)(v30 + 40)];

  int v18 = +[NSMutableSet set];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v19 = *(id *)(v30 + 32);
  id v20 = [v19 countByEnumeratingWithState:&v31 objects:v41 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = 0;
    uint64_t v23 = *(void *)v32;
    do
    {
      uint64_t v24 = 0;
      uint64_t v25 = v22;
      do
      {
        if (*(void *)v32 != v23) {
          objc_enumerationMutation(v19);
        }
        uint64_t v26 = *(void *)(*((void *)&v31 + 1) + 8 * (void)v24);
        __int16 v27 = +[FMFDataManager sharedInstance];
        uint64_t v22 = [v27 locationForHandle:v26];

        if (v22) {
          [v18 addObject:v22];
        }
        uint64_t v24 = (char *)v24 + 1;
        uint64_t v25 = v22;
      }
      while (v21 != v24);
      id v21 = [v19 countByEnumeratingWithState:&v31 objects:v41 count:16];
    }
    while (v21);
  }
  uint64_t v28 = [*(id *)(v30 + 40) clientProxy];
  [v28 setLocations:v18];
}

void sub_10001AC68(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _handlesInternal];
  [v2 unionSet:*(void *)(a1 + 40)];
}

void sub_10001AD70(uint64_t a1)
{
  id v2 = sub_100005560();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@: removeFriendHandles: %@", (uint8_t *)&v6, 0x16u);
  }

  id v5 = [*(id *)(a1 + 32) _handlesInternal];
  [v5 minusSet:*(void *)(a1 + 40)];
}

void sub_10001AF24(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_10001AF38(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained _handlesInternal];
  id v3 = [v2 copy];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001B1A8(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v7 = a3;
  id v6 = a2;
  [v5 sendFMFIDSPacketsForHandleIdToMappingIdentifiers:v6];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  [*(id *)(a1 + 32) dispayOfferAlertDialogsWithoutRepeatForError:v7];
}

id sub_10001B308(uint64_t a1)
{
  if (!+[FMFUtils locationServicesEnabled]) {
    +[FMFDUserNotification showLocationServicesSwitchOffAlert];
  }
  if (!+[FMFUtils shareMyLocationSystemServiceEnabled]
    && +[FMFUtils locationServicesEnabled])
  {
    +[FMFDUserNotification showShareMyLocationSystemServiceOffAlert];
  }
  id v2 = +[FMFDataManager sharedInstance];
  if (([v2 locationHidden] & 1) == 0) {
    goto LABEL_11;
  }
  id v3 = +[FMFAccountManager sharedInstance];
  if (([v3 hasCredentials] & 1) == 0)
  {

LABEL_11:
    goto LABEL_12;
  }
  uint64_t v4 = +[FMFDataManager sharedInstance];
  id v5 = [v4 deviceSharingLocation];
  unsigned int v6 = [v5 isThisDevice];

  if (v6) {
    +[FMFDUserNotification showShareMyLocationiCloudSettingsOffAlert];
  }
LABEL_12:
  if ([*(id *)(a1 + 32) code] == (id)1005) {
    +[FMFDUserNotification showForbiddenRegionAlert];
  }
  id v7 = *(void **)(a1 + 40);

  return [v7 setBlockingDialogs:0];
}

void sub_10001B590(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 sendFMFIDSPacketsForHandleIdToMappingIdentifiers:a2];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10001B764(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 sendFMFIDSPacketsForHandleIdToMappingIdentifiers:a2];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10001B9CC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = sub_100005560();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [v4 localizedDescription];
    int v8 = 138412546;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    id v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "📩 %@: completed NotNow request (%@)", (uint8_t *)&v8, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_10001BB9C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10001BC80(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001BDC0(uint64_t a1)
{
  id v2 = +[FMFDataManager sharedInstance];
  id v3 = [*(id *)(a1 + 32) identifier];
  id v4 = [v2 followerHandleForIdentifier:v3];

  if (v4) {
    goto LABEL_6;
  }
  id v5 = +[FMFDataManager sharedInstance];
  uint64_t v6 = [v5 getHandlesWithPendingOffersSync];
  id v7 = [v6 containsObject:*(void *)(a1 + 32)] ? *(void **)(a1 + 32) : 0;
  id v4 = v7;

  if (v4)
  {
LABEL_6:
    int v8 = +[FMFCommandManager sharedInstance];
    uint64_t v9 = +[NSSet setWithObject:*(void *)(a1 + 32)];
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 48);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10001BFB0;
    v15[3] = &unk_1000A1FF0;
    uint64_t v12 = *(void *)(a1 + 56);
    id v16 = *(id *)(a1 + 64);
    [v8 stopSharingMyLocationWithHandles:v9 forSession:v10 groupId:v11 callerId:v12 completion:v15];
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 64);
    id v14 = +[NSError errorWithDomain:FMFErrorDomain code:102 userInfo:0];
    (*(void (**)(uint64_t, void, id))(v13 + 16))(v13, 0, v14);
  }
}

uint64_t sub_10001BFB0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001C0F4(uint64_t a1)
{
  id v2 = +[FMFDataManager sharedInstance];
  id v3 = [v2 followerHandles];

  id v4 = [*(id *)(a1 + 32) mutableCopy];
  [v4 intersectSet:v3];
  id v5 = +[FMFDataManager sharedInstance];
  uint64_t v6 = [v5 getHandlesWithPendingOffersSync];

  id v7 = [*(id *)(a1 + 32) mutableCopy];
  [v7 intersectSet:v6];
  [v4 unionSet:v7];
  int v8 = +[FMFCommandManager sharedInstance];
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001C258;
  v12[3] = &unk_1000A1FC8;
  v12[4] = v9;
  uint64_t v11 = *(void *)(a1 + 56);
  id v13 = *(id *)(a1 + 64);
  [v8 stopSharingMyLocationWithHandles:v4 forSession:v9 groupId:v10 callerId:v11 completion:v12];
}

void sub_10001C258(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 sendFMFIDSPacketsForHandleIdToMappingIdentifiers:a2];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_10001C6A8(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

uint64_t sub_10001C878(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

void sub_10001D048(uint64_t a1)
{
  id v2 = +[FMFDataManager sharedInstance];
  id v5 = [v2 allLocations];

  if (v5)
  {
    id v3 = +[NSSet setWithArray:](NSSet, "setWithArray:");
  }
  else
  {
    id v3 = 0;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void *, void))(v4 + 16))(v4, v3, 0);
  }
}

void sub_10001D158(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100005560();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Finished force refresh", v6, 2u);
  }

  if (v3)
  {
    id v5 = [*(id *)(a1 + 32) clientProxy];
    [v5 didReceiveServerError:v3];
  }
}

void sub_10001D3C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100005560();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@: Finished force refresh for audio accessory", (uint8_t *)&v7, 0xCu);
  }

  if (v3)
  {
    id v6 = sub_100005560();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10006B608(a1, (uint64_t)v3, v6);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_10001D940(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001EC88(uint64_t a1)
{
  id v2 = sub_100005560();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@: showMeDeviceAlertCompleted", (uint8_t *)&v4, 0xCu);
  }
}

uint64_t sub_10001EDD8(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 == 0);
  }
  return result;
}

void sub_10001F034(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  uint64_t v7 = *(void *)(a1 + 32);
  id v9 = v6;
  if (v6)
  {
    uint64_t v8 = [@"ERROR" dataUsingEncoding:4];
    (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v8, v9);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, void))(v7 + 16))(v7, a2, 0);
  }
}

void sub_10002102C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = sub_100005560();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v8) {
      goto LABEL_7;
    }
    uint64_t v9 = *(void *)(a1 + 32);
    int v13 = 138412546;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    id v16 = v6;
    uint64_t v10 = "%@: addFence completed with error: %@";
  }
  else
  {
    if (!v8) {
      goto LABEL_7;
    }
    uint64_t v11 = *(void *)(a1 + 32);
    int v13 = 138412546;
    uint64_t v14 = v11;
    __int16 v15 = 2112;
    id v16 = v5;
    uint64_t v10 = "%@: addFence completed sucessfully %@";
  }
  _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, 0x16u);
LABEL_7:

  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, id, id))(v12 + 16))(v12, v5, v6);
  }
}

void sub_100021288(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = sub_100005560();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v8) {
      goto LABEL_7;
    }
    uint64_t v9 = *(void *)(a1 + 32);
    int v13 = 138412546;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    id v16 = v6;
    uint64_t v10 = "%@: removeFences completed with error: %@";
  }
  else
  {
    if (!v8) {
      goto LABEL_7;
    }
    uint64_t v11 = *(void *)(a1 + 32);
    int v13 = 138412546;
    uint64_t v14 = v11;
    __int16 v15 = 2112;
    id v16 = v5;
    uint64_t v10 = "%@: removeFences completed sucessfully: %@";
  }
  _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, 0x16u);
LABEL_7:

  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v6);
  }
}

void sub_100021C6C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    int v4 = sub_100005560();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v31 = v5;
      __int16 v32 = 2112;
      id v33 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@: ERROR: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v17 = 0;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id obj = *(id *)(a1 + 40);
    id v6 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v19 = *(void *)v25;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v10 = +[FMFDataManager sharedInstance];
          uint64_t v11 = [v9 friendIdentifier];
          uint64_t v12 = [v10 followingHandleForServerId:v11];
          uint64_t v28 = v12;
          int v13 = +[NSArray arrayWithObjects:&v28 count:1];
          [v9 setRecipients:v13];

          uint64_t v14 = +[FMFDataManager sharedInstance];
          __int16 v15 = [v14 fenceSequencer];
          v20[0] = _NSConcreteStackBlock;
          v20[1] = 3221225472;
          v20[2] = sub_100021F28;
          v20[3] = &unk_1000A2178;
          uint64_t v16 = *(void *)(a1 + 32);
          id v21 = 0;
          uint64_t v22 = v16;
          id v23 = *(id *)(a1 + 48);
          [v15 addFence:v9 clientSession:v16 completion:v20];
        }
        id v7 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v7);
    }

    id v3 = v17;
  }
}

void sub_100021F28(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (a1[4])
  {
    uint64_t v5 = sub_100005560();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = a1[5];
      int v8 = 138412546;
      uint64_t v9 = v6;
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: ERROR: %@", (uint8_t *)&v8, 0x16u);
    }

    id v7 = *(void (**)(void))(a1[6] + 16);
  }
  else
  {
    id v7 = *(void (**)(void))(a1[6] + 16);
  }
  v7();
}

void sub_1000221D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100005560();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@: addFavorite command completed with error?: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

void sub_1000223E4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100005560();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@: removeFavorite command completed with error?: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

void sub_100022648(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1000226B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100005560();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "XPC error: %@", (uint8_t *)&v5, 0xCu);
  }

  objc_storeWeak((id *)(*(void *)(a1 + 32) + 8), 0);
}

void sub_1000228A4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v5;
    id v7 = +[NSArray arrayWithObjects:&v13 count:1];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v8 = 0;
      goto LABEL_7;
    }
    id v7 = v5;
  }
  uint64_t v8 = v7;
LABEL_7:
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000229FC;
  v10[3] = &unk_1000A21C8;
  id v11 = *(id *)(a1 + 32);
  id v12 = v6;
  id v9 = v6;
  [v8 enumerateObjectsUsingBlock:v10];
}

void sub_1000229FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  id v4 = v3;
  xpc_dictionary_set_string(xdict, "Notification", (const char *)[v4 cStringUsingEncoding:4]);
  id v5 = [*(id *)(a1 + 40) copy];
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v4];

  id v6 = v4;
  [v6 cStringUsingEncoding:4];

  xpc_set_event();
}

void sub_100022AD4(uint64_t a1, xpc_object_t xdict)
{
  string = xpc_dictionary_get_string(xdict, _xpc_event_key_name);
  id v4 = *(void **)(a1 + 32);
  id v5 = +[NSString stringWithUTF8String:string];
  uint64_t v7 = [v4 objectForKeyedSubscript:v5];

  id v6 = (void *)v7;
  if (v7)
  {
    (*(void (**)(uint64_t))(v7 + 16))(v7);
    id v6 = (void *)v7;
  }
}

void sub_100022C94(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v5;
    id v7 = +[NSArray arrayWithObjects:&v13 count:1];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v8 = 0;
      goto LABEL_7;
    }
    id v7 = v5;
  }
  uint64_t v8 = v7;
LABEL_7:
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100022DEC;
  v10[3] = &unk_1000A21C8;
  id v11 = *(id *)(a1 + 32);
  id v12 = v6;
  id v9 = v6;
  [v8 enumerateObjectsUsingBlock:v10];
}

void sub_100022DEC(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  id v4 = v3;
  xpc_dictionary_set_string(xdict, "Name", (const char *)[v4 cStringUsingEncoding:4]);
  id v5 = [*(id *)(a1 + 40) copy];
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v4];

  id v6 = v4;
  [v6 cStringUsingEncoding:4];

  xpc_set_event();
}

void sub_100022EC4(uint64_t a1, void *a2)
{
  id v3 = a2;
  string = xpc_dictionary_get_string(v3, _xpc_event_key_name);
  id v5 = *(void **)(a1 + 32);
  id v6 = +[NSString stringWithUTF8String:string];
  id v7 = [v5 objectForKeyedSubscript:v6];

  v7[2](v7, v3);
}

void sub_10002334C(id a1)
{
  qword_1000BB740 = objc_alloc_init(FMFSystemInfoiOS);

  _objc_release_x1();
}

void sub_1000235B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000236D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100023924(id a1)
{
  size_t size = 0;
  sysctlbyname("kern.osversion", 0, &size, 0, 0);
  uint64_t v1 = malloc_type_malloc(size, 0xB82A9E20uLL);
  sysctlbyname("kern.osversion", v1, &size, 0, 0);
  if (v1)
  {
    uint64_t v2 = +[NSString stringWithCString:v1 encoding:4];
    id v3 = (void *)qword_1000BB760;
    qword_1000BB760 = v2;
  }
  free(v1);
}

uint64_t sub_100024920()
{
  qword_1000BB778 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

void sub_1000249F4(uint64_t a1)
{
  CFBooleanRef v2 = (CFBooleanRef)MGCopyAnswer();
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = v2 == kCFBooleanTrue;

  CFRelease(v2);
}

uint64_t sub_100024D2C(uint64_t result)
{
  if (result == 20)
  {
    uint64_t v4 = v1;
    uint64_t v5 = v2;
    int v3 = 0;
    do
      uint64_t result = waitpid(-1, &v3, 1);
    while ((int)result > 0);
  }
  return result;
}

void sub_100024D70(id a1)
{
}

void sub_100024D84(id a1)
{
  id v1 = +[NSNotificationCenter defaultCenter];
  [v1 postNotificationName:off_1000BAFA8 object:0];
}

void sub_100024DDC(id a1)
{
}

void sub_100024DF0(id a1)
{
  id v1 = +[NSNotificationCenter defaultCenter];
  [v1 postNotificationName:off_1000BAFB0 object:0];
}

void sub_100025444(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [*(id *)(a1 + 32) addObject:v3];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [*(id *)(a1 + 32) addObjectsFromArray:v3];
    }
  }
}

void sub_1000254DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [*(id *)(a1 + 32) addObject:v3];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [*(id *)(a1 + 32) addObjectsFromArray:v3];
    }
  }
}

BOOL FMFStringIsEmail(void *a1)
{
  id v1 = a1;
  if ([(__CFString *)v1 length]) {
    BOOL v2 = CFStringFind(v1, @"@", 0).location != -1;
  }
  else {
    BOOL v2 = 1;
  }

  return v2;
}

void sub_100025FBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id obj)
{
}

void sub_100025FE8(uint64_t a1, double a2, double a3)
{
  id v6 = sub_100005560();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 72);
    uint64_t v8 = *(void *)(a1 + 80);
    uint64_t v9 = *(void *)(a1 + 32);
    int v17 = 134284547;
    uint64_t v18 = v7;
    __int16 v19 = 2049;
    uint64_t v20 = v8;
    __int16 v21 = 2049;
    double v22 = a2;
    __int16 v23 = 2049;
    double v24 = a3;
    __int16 v25 = 2112;
    uint64_t v26 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Shifter callback returned, original(lat: %{private}f, long: %{private}f), shifted(lat: %{private}f, long: %{private}f) for location; %@",
      (uint8_t *)&v17,
      0x34u);
  }

  id v10 = +[NSNumber numberWithDouble:a2];
  id v11 = +[NSNumber numberWithDouble:a3];
  [v10 doubleValue];
  if (v12 != 0.0)
  {
    [v11 doubleValue];
    if (v13 != 0.0)
    {
      [*(id *)(a1 + 40) setValue:v10 forKey:@"latitude"];
      [*(id *)(a1 + 40) setValue:v11 forKey:@"longitude"];
    }
  }
  [*(id *)(a1 + 48) setObject:*(void *)(a1 + 40) forKey:@"location"];
  id v14 = *(id *)(a1 + 56);
  objc_sync_enter(v14);
  [*(id *)(a1 + 56) addObject:*(void *)(a1 + 48)];
  __int16 v15 = sub_100005560();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = *(void *)(a1 + 56);
    int v17 = 138412290;
    uint64_t v18 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Shifter callback updated locations array: %@", (uint8_t *)&v17, 0xCu);
  }

  objc_sync_exit(v14);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void sub_100026200(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100026220(uint64_t a1)
{
}

void sub_1000263C0(id a1)
{
  qword_1000BB798 = objc_opt_new();

  _objc_release_x1();
}

id sub_1000268B0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) IDSRecipientFromHandle:a2];
}

void sub_100026A84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100026AA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005560();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 134218242;
    uint64_t v8 = a2;
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "IDSIDStatus result: %ld for destination: %@", (uint8_t *)&v7, 0x16u);
  }

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  return [*(id *)(a1 + 40) signal];
}

void sub_100027858(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100027870(void *a1, void *a2)
{
  [a2 objectForKeyedSubscript:a1[4]];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    uint64_t v7 = IDSRegistrationPropertySupportsFMFenceV1;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        __int16 v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) capabilities:v11];
        id v10 = [v9 valueForCapability:v7];

        if (v10 == (id)1)
        {
          *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
          goto LABEL_11;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  (*(void (**)(void))(a1[5] + 16))();
}

void sub_100027DE0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_100027E0C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100005560();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) identifier];
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FMFIDSMessageController: correlationID: %@, %@", (uint8_t *)&v6, 0x16u);
  }
  if ([v3 isEqualToString:*(void *)(a1 + 40)]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_100027F0C(void *a1)
{
  if (*(unsigned char *)(*(void *)(a1[7] + 8) + 24))
  {
    BOOL v2 = sub_100005560();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
LABEL_5:

      (*(void (**)(void))(a1[6] + 16))();
      return;
    }
    int v3 = *(unsigned __int8 *)(*(void *)(a1[7] + 8) + 24);
    *(_DWORD *)long long buf = 67109120;
    LODWORD(v26) = v3;
LABEL_4:
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "FMFIDSMessageController: Message sender is valid? %d", buf, 8u);
    goto LABEL_5;
  }
  if (a1[4])
  {
    id v4 = sub_100005560();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = a1[4];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v26 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FMFIDSMessageController: Checking sender validity based on fenceId: %@", buf, 0xCu);
    }

    int v6 = +[FMFDataManager sharedInstance];
    uint64_t v7 = [v6 fenceManager];
    uint64_t v8 = a1[4];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100028224;
    v23[3] = &unk_1000A2418;
    long long v19 = *((_OWORD *)a1 + 3);
    id v9 = (id)v19;
    long long v24 = v19;
    [v7 getFenceWithID:v8 timeout:v23 block:15.0];

    id v10 = (void *)v24;
  }
  else
  {
    uint64_t v11 = a1[5];
    BOOL v2 = sub_100005560();
    BOOL v12 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
    if (!v11)
    {
      if (!v12) {
        goto LABEL_5;
      }
      int v18 = *(unsigned __int8 *)(*(void *)(a1[7] + 8) + 24);
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v26) = v18;
      goto LABEL_4;
    }
    if (v12)
    {
      uint64_t v13 = a1[5];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v26 = v13;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "FMFIDSMessageController: Checking sender validity based on ckRecordName: %@", buf, 0xCu);
    }

    long long v14 = +[FMFDataManager sharedInstance];
    __int16 v15 = [v14 fenceManager];
    uint64_t v16 = a1[5];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    void v21[2] = sub_100028308;
    v21[3] = &unk_1000A2418;
    long long v20 = *((_OWORD *)a1 + 3);
    id v17 = (id)v20;
    long long v22 = v20;
    [v15 getFenceWithCKRecordName:v16 timeout:v21 block:15.0];

    id v10 = (void *)v22;
  }
}

void sub_100028224(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100005560();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FMFIDSMessageController: Found fence for fenceId?: %@", (uint8_t *)&v5, 0xCu);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3 != 0;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100028308(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100005560();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FMFIDSMessageController: Found fence for ckRecordName?: %@", (uint8_t *)&v5, 0xCu);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3 != 0;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100028550(uint64_t a1)
{
  BOOL v2 = +[FMFDataManager sharedInstance];
  id v3 = [v2 followerHandles];

  if (v3) {
    BOOL v4 = [v3 count] != 0;
  }
  else {
    BOOL v4 = 0;
  }
  int v5 = sub_100005560();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    *(_DWORD *)long long buf = 138413314;
    long long v38 = v6;
    __int16 v39 = 2112;
    uint64_t v40 = v7;
    __int16 v41 = 2112;
    uint64_t v42 = v8;
    __int16 v43 = 1024;
    BOOL v44 = v4;
    __int16 v45 = 2112;
    uint64_t v46 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received IDS message to account: %@, message: %@ from ID: %@, canReceiveFollowerMessage: %d, payloadValue: %@", buf, 0x30u);
  }

  if ([*(id *)(a1 + 56) isEqualToString:@"mappingPacket"])
  {
    id v10 = [*(id *)(a1 + 40) objectForKey:@"p" ofClass:objc_opt_class()];
    uint64_t v11 = sub_100005560();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 138412546;
      long long v38 = v10;
      __int16 v39 = 2112;
      uint64_t v40 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Sending mapping packet to server on receiving end: %@ from message: %@", buf, 0x16u);
    }

    uint64_t v13 = +[FMFCommandManager sharedInstance];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100028B18;
    v35[3] = &unk_1000A1DD0;
    int8x16_t v36 = v10;
    long long v14 = v10;
    [v13 importMappingPacket:v14 forSession:0 completion:v35];

    __int16 v15 = v36;
LABEL_23:

    goto LABEL_24;
  }
  if (v4
    && [*(id *)(a1 + 56) isEqualToString:@"CKDeviceToDeviceShareInvitationToken"])
  {
    uint64_t v16 = sub_100005560();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "FMFIDSMessageController: Received share inivitation", buf, 2u);
    }

    long long v14 = [*(id *)(a1 + 40) objectForKey:@"ckRecordName" ofClass:objc_opt_class()];
    id v17 = *(void **)(a1 + 64);
    uint64_t v18 = *(void *)(a1 + 72);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100028BE0;
    v32[3] = &unk_1000A2468;
    void v32[4] = *(void *)(a1 + 56);
    v32[5] = v17;
    id v33 = *(id *)(a1 + 40);
    id v34 = *(id *)(a1 + 48);
    [v17 senderIsValid:v18 idsSenderRequirement:0 fenceId:0 ckRecordName:v14 withCompletion:v32];

    __int16 v15 = v33;
    goto LABEL_23;
  }
  if ([*(id *)(a1 + 56) isEqualToString:@"fenceTrigger"])
  {
    long long v19 = sub_100005560();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "FMFIDSMessageController: Received fence trigger message", buf, 2u);
    }

    long long v14 = [*(id *)(a1 + 40) objectForKey:@"fenceID" ofClass:objc_opt_class()];
    long long v20 = *(void **)(a1 + 64);
    uint64_t v21 = *(void *)(a1 + 72);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100028D8C;
    v30[3] = &unk_1000A2490;
    void v30[4] = *(void *)(a1 + 56);
    v30[5] = v20;
    id v31 = *(id *)(a1 + 40);
    [v20 senderIsValid:v21 idsSenderRequirement:1 fenceId:v14 ckRecordName:0 withCompletion:v30];
    __int16 v15 = v31;
    goto LABEL_23;
  }
  unsigned int v22 = [*(id *)(a1 + 56) isEqualToString:@"deletedFenceInformation"];
  long long v14 = sub_100005560();
  BOOL v23 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v22)
  {
    if (v23)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "FMFIDSMessageController: Received fence deleted message", buf, 2u);
    }

    long long v14 = [*(id *)(a1 + 40) objectForKey:@"fenceID" ofClass:objc_opt_class()];
    long long v24 = *(void **)(a1 + 64);
    uint64_t v25 = *(void *)(a1 + 72);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100028EE8;
    v28[3] = &unk_1000A2490;
    v28[4] = *(void *)(a1 + 56);
    v28[5] = v24;
    id v29 = *(id *)(a1 + 40);
    [v24 senderIsValid:v25 idsSenderRequirement:1 fenceId:v14 ckRecordName:0 withCompletion:v28];
    __int16 v15 = v29;
    goto LABEL_23;
  }
  if (v23)
  {
    uint64_t v27 = *(void *)(a1 + 40);
    uint64_t v26 = *(void **)(a1 + 48);
    *(_DWORD *)long long buf = 138412546;
    long long v38 = v26;
    __int16 v39 = 2112;
    uint64_t v40 = v27;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "FMFIDSMessageController: Unknown service from: %@ payload: %@", buf, 0x16u);
  }
LABEL_24:
}

void sub_100028B18(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  int v5 = sub_100005560();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Sent mapping packet to server on receiving end: %@ with error: %@", (uint8_t *)&v7, 0x16u);
  }
}

void sub_100028BE0(void *a1, uint64_t a2)
{
  id v4 = sub_100005560();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    int v12 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FMFIDSMessageController: Sender is valid returned: %d", buf, 8u);
  }

  int v5 = +[NSNumber numberWithBool:a2, @"isSenderValid"];
  v9[1] = @"messageType";
  v10[0] = v5;
  v10[1] = a1[4];
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  AnalyticsSendEvent();

  int v7 = sub_100005560();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v8)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FMFIDSMessageController: Continuing with share invitation message, sender is valid", buf, 2u);
    }

    [(id)objc_opt_class() _receivedShareInvitationMessage:a1[6] fromID:a1[7]];
  }
  else
  {
    if (v8)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FMFIDSMessageController: Dropping share invitation message on the floor, sender is invalid", buf, 2u);
    }
  }
}

void sub_100028D8C(uint64_t a1, uint64_t a2)
{
  int v2 = a2;
  v9[0] = @"isSenderValid";
  id v4 = +[NSNumber numberWithBool:a2];
  v9[1] = @"messageType";
  v10[0] = v4;
  v10[1] = *(void *)(a1 + 32);
  int v5 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  AnalyticsSendEvent();

  uint64_t v6 = sub_100005560();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v7)
    {
      *(_WORD *)BOOL v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FMFIDSMessageController: Continuing with fence trigger message, sender is valid", v8, 2u);
    }

    [(id)objc_opt_class() _receivedFenceTriggerMessage:*(void *)(a1 + 48)];
  }
  else
  {
    if (v7)
    {
      *(_WORD *)BOOL v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FMFIDSMessageController: Dropping fence trigger message on the floor, sender is invalid", v8, 2u);
    }
  }
}

void sub_100028EE8(uint64_t a1, uint64_t a2)
{
  int v2 = a2;
  v9[0] = @"isSenderValid";
  id v4 = +[NSNumber numberWithBool:a2];
  v9[1] = @"messageType";
  v10[0] = v4;
  v10[1] = *(void *)(a1 + 32);
  int v5 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  AnalyticsSendEvent();

  uint64_t v6 = sub_100005560();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v7)
    {
      *(_WORD *)BOOL v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FMFIDSMessageController: Continuing with fence deleted message, sender is valid", v8, 2u);
    }

    [(id)objc_opt_class() _receivedDeletedFenceInformationMessage:*(void *)(a1 + 48)];
  }
  else
  {
    if (v7)
    {
      *(_WORD *)BOOL v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FMFIDSMessageController: Dropping fence deleted message on the floor, sender is invalid", v8, 2u);
    }
  }
}

void sub_1000290B8(id a1)
{
  qword_1000BB7B0 = (uint64_t)os_log_create("com.apple.icloud.fmfd", "_");

  _objc_release_x1();
}

id sub_1000290FC()
{
  if (qword_1000BB7B8 != -1) {
    dispatch_once(&qword_1000BB7B8, &stru_1000A24F8);
  }
  v0 = (void *)qword_1000BB7C0;

  return v0;
}

void sub_100029150(id a1)
{
  qword_1000BB7C0 = (uint64_t)os_log_create("com.apple.icloud.fmfd", "FMFMapXPC");

  _objc_release_x1();
}

void sub_100029380(id a1)
{
  uint64_t v1 = objc_opt_new();
  int v2 = (void *)qword_1000BB7C8;
  qword_1000BB7C8 = v1;

  [(id)qword_1000BB7C8 setLatest401TS:0];
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:qword_1000BB7C8 selector:"iCloudAccountChanged:" name:off_1000BAFB8 object:0];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:qword_1000BB7C8 selector:"iCloudAccountWasAdded:" name:off_1000BAFC8 object:0];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:qword_1000BB7C8 selector:"iCloudAccountRemoved:" name:off_1000BAFC0 object:0];
}

void sub_1000294D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100029638(uint64_t a1)
{
  byte_1000BB7D8 = 0;
  return [*(id *)(a1 + 32) updateAccountInfo];
}

void sub_100029D64(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100029F3C(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = sub_100005560();
  BOOL v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "aa_updatePropertiesForAppleAccount completed with authenticated:YES. Saving the account...", buf, 2u);
    }

    BOOL v8 = *(void **)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10002A084;
    v12[3] = &unk_1000A2540;
    id v13 = v8;
    id v10 = *(id *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 32);
    id v14 = v10;
    uint64_t v15 = v11;
    [v13 saveVerifiedAccount:v9 withCompletionHandler:v12];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10006BED8();
    }

    [*(id *)(a1 + 32) setIsUpdatingAccountCredentials:0];
    [*(id *)(a1 + 32) renewAccountCredentials:*(unsigned __int8 *)(a1 + 56)];
  }
}

void sub_10002A084(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    BOOL v7 = [*(id *)(a1 + 40) aa_fmfAccount];
    BOOL v8 = [v6 credentialForAccount:v7 error:0];

    uint64_t v9 = [v8 credentialItemForKey:ACFindMyFriendsAppTokenKey];
    id v10 = sub_100005560();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Saved the account after aa_updatePropertiesForAppleAccount, updating password", (uint8_t *)&v13, 2u);
    }

    uint64_t v11 = sub_100005560();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v12 = @"YES";
      if (!v9) {
        CFStringRef v12 = @"NO";
      }
      int v13 = 138412290;
      CFStringRef v14 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Password non-nil after fetching the credential? [%@]", (uint8_t *)&v13, 0xCu);
    }

    [*(id *)(a1 + 48) setIsUpdatingAccountCredentials:0];
    [*(id *)(a1 + 48) retryAfterCredentialUpdate];
  }
  else
  {
    BOOL v8 = sub_100005560();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10006BF40();
    }
  }

  [*(id *)(a1 + 48) setIsUpdatingAccountCredentials:0];
}

void sub_10002A4B4(uint64_t a1, unint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2 > 2) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = (uint64_t)*(&off_1000A2670 + a2);
  }
  BOOL v7 = sub_100005560();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = *(void **)(a1 + 32);
    int v10 = 138412802;
    id v11 = v8;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Renewed account credentails for account %@ – status %@, Error: %@", (uint8_t *)&v10, 0x20u);
  }

  [*(id *)(a1 + 40) setIsRenewingAccountCredentials:0];
  if (a2 || v5)
  {
    uint64_t v9 = sub_100005560();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Not refreshing data because of credential error: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    [*(id *)(a1 + 40) retryAfterCredentialUpdate];
  }
}

void sub_10002A764(id a1, NSError *a2)
{
  int v2 = a2;
  id v3 = sub_100005560();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Data refreshed after getting new credentials, Error: %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_10002B024(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002B048(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    int v4 = sub_100005560();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Error refreshing after account signin to import saved mapping packets: %@", buf, 0xCu);
    }
  }
  else
  {
    id v5 = *(void **)(a1 + 32);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10002B160;
    v6[3] = &unk_1000A2600;
    uint64_t v8 = *(void *)(a1 + 56);
    long long v7 = *(_OWORD *)(a1 + 40);
    [v5 enumerateKeysAndObjectsUsingBlock:v6];
  }
}

void sub_10002B160(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = +[FMFSession sharedInstance];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002B234;
  v7[3] = &unk_1000A25D8;
  id v8 = v4;
  uint64_t v10 = *(void *)(a1 + 48);
  long long v9 = *(_OWORD *)(a1 + 32);
  id v6 = v4;
  [v5 receivedMappingPacket:v6 completion:v7];
}

void sub_10002B234(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = sub_100005560();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Sent packet: %@ to server with error response: %@", (uint8_t *)&v7, 0x16u);
  }

  if (++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == *(void *)(a1 + 56)) {
    [*(id *)(a1 + 40) clearSavedMappingPackets];
  }
}

id sub_10002B870(uint64_t a1, uint64_t a2)
{
  id v4 = sub_100005560();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Error while trying to invalidated packets; %@",
        (uint8_t *)&v9,
        0xCu);
    }

    return [*(id *)(a1 + 40) storeInvalidMappingPacketsForFutureRemoval:*(void *)(a1 + 48)];
  }
  else
  {
    if (v5)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Successfully invalidated all the packets; %@",
        (uint8_t *)&v9,
        0xCu);
    }

    return [*(id *)(a1 + 40) clearSavedInvalidMappingPackets];
  }
}

void sub_10002C96C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002C988(id a1)
{
  uint64_t v1 = sub_100005560();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)__int16 v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Creating shared instance of FMFDataManager", v14, 2u);
  }

  int v2 = objc_alloc_init(FMFDataManager);
  id v3 = (void *)qword_1000BB7E0;
  qword_1000BB7E0 = (uint64_t)v2;

  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  [qword_1000BB7E0 set_locationDictionary:v4];

  BOOL v5 = +[FMFDStoreController sharedInstance];
  [(id)qword_1000BB7E0 setStoreController:v5];

  uint64_t v6 = objc_opt_new();
  [(id)qword_1000BB7E0 setFenceManager:v6];

  int v7 = [FMFFenceSequencer alloc];
  uint64_t v8 = [(id)qword_1000BB7E0 fenceManager];
  int v9 = [(FMFFenceSequencer *)v7 initWithFenceManager:v8];
  [(id)qword_1000BB7E0 setFenceSequencer:v9];

  uint64_t v10 = objc_opt_new();
  [(id)qword_1000BB7E0 setFavoritesSequencer:v10];

  [(id)qword_1000BB7E0 updateClientsWithLocallyStoredModelCache];
  id v11 = +[NSTimer scheduledTimerWithTimeInterval:qword_1000BB7E0 target:"sanitizeLocationsCache:" selector:0 userInfo:1 repeats:21600.0];
  [(id)qword_1000BB7E0 setSanitizeLocationsCacheTimer:v11];

  __int16 v12 = +[NSNotificationCenter defaultCenter];
  [v12 addObserver:qword_1000BB7E0 selector:"accountWasRemoved" name:off_1000BAFC0 object:0];

  uint64_t v13 = +[NSNotificationCenter defaultCenter];
  [v13 addObserver:qword_1000BB7E0 selector:"cleanupOldModel" name:off_1000BAFE8 object:0];
}

void sub_10002CEB8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002EC18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id obj)
{
}

void sub_10002ED68(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v5 = [WeakRetained changesToBeNotified];
  if (a2)
  {
    uint64_t v6 = [WeakRetained fenceSequencer];
    int v7 = [v6 fences];
    [v5 setObject:v7 forKeyedSubscript:@"updatedFences"];
  }
  if ([v5 count])
  {
    uint64_t v8 = +[FMFXPCSessionManager sharedInstance];
    int v9 = [v8 clientSessions];
    [WeakRetained updateSessionCaches:v5 forSessions:v9 pushAllData:0];

    [WeakRetained notifyClientOfUpdates:v5];
    uint64_t v10 = [v5 objectForKeyedSubscript:@"followers"];
    if (v10) {
      goto LABEL_11;
    }
    uint64_t v10 = [v5 objectForKeyedSubscript:@"pendingOffers"];
    if (v10) {
      goto LABEL_11;
    }
    uint64_t v10 = [v5 objectForKeyedSubscript:@"futureFollower"];
    if (v10) {
      goto LABEL_11;
    }
    uint64_t v10 = [v5 objectForKeyedSubscript:@"following"];
    if (v10
      || ([v5 objectForKeyedSubscript:@"favorites"],
          (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0)
      || ([v5 objectForKeyedSubscript:@"devices"],
          (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0)
      || ([v5 objectForKeyedSubscript:@"meDevice"],
          (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
    {
LABEL_11:
    }
    else
    {
      uint64_t v18 = [v5 objectForKeyedSubscript:@"updatedFences"];

      if (!v18) {
        goto LABEL_33;
      }
    }
    uint64_t v27 = [WeakRetained storeController];
    v28[0] = off_1000BAC68[0];
    uint64_t v26 = [WeakRetained followerHandles];
    if (v26) {
      [WeakRetained followerHandles];
    }
    else {
    uint64_t v25 = +[NSNull null];
    }
    v29[0] = v25;
    v28[1] = off_1000BAC70[0];
    long long v24 = [WeakRetained followingHandles];
    if (v24) {
      [WeakRetained followingHandles];
    }
    else {
    BOOL v23 = +[NSNull null];
    }
    v29[1] = v23;
    v28[2] = off_1000BAC78[0];
    unsigned int v22 = [WeakRetained _meDevice];
    if (v22) {
      [WeakRetained _meDevice];
    }
    else {
    uint64_t v21 = +[NSNull null];
    }
    v29[2] = v21;
    v28[3] = off_1000BAC80[0];
    uint64_t v19 = [WeakRetained _devices];
    if (v19) {
      [WeakRetained _devices:v19];
    }
    else {
    id v11 = +[NSNull null];
    }
    v29[3] = v11;
    v28[4] = off_1000BAC90[0];
    __int16 v12 = [WeakRetained modelVersion];
    if (v12) {
      [WeakRetained modelVersion];
    }
    else {
    uint64_t v13 = +[NSNull null];
    }
    v29[4] = v13;
    v28[5] = off_1000BAC88[0];
    __int16 v14 = [WeakRetained fenceSequencer];
    id v15 = [v14 fences];
    if (v15)
    {
      int v2 = [WeakRetained fenceSequencer];
      [v2 fences];
    }
    else
    {
      +[NSNull null];
    uint64_t v16 = };
    v29[5] = v16;
    id v17 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:6];
    [v27 updateModelCacheWithData:v17];

    if (v15)
    {

      uint64_t v16 = v2;
    }
  }
LABEL_33:
}

BOOL sub_100030788(id a1, id a2, FMFLocation *a3, BOOL *a4)
{
  return [(FMFLocation *)a3 isValid] ^ 1;
}

void sub_100030800(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000313B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100031808(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100031E94(uint64_t a1, void *a2)
{
  return [a2 isSharingThroughGroupId:*(void *)(a1 + 32)];
}

id sub_100032028(uint64_t a1, void *a2)
{
  return [a2 isSharingThroughGroupId:*(void *)(a1 + 32)];
}

void sub_1000320F4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) futureFollowingRequests];
    id v4 = [*(id *)(a1 + 32) futureFollowerRequests];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_100032DA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100032DB8(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 identifier];
  id v4 = [*(id *)(a1 + 32) identifier];
  if ([v3 isEqualToString:v4])
  {
    unsigned int v5 = [v7 isSharingThroughGroupId:*(void *)(a1 + 40)];

    uint64_t v6 = v7;
    if (v5) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
  }
  else
  {

    uint64_t v6 = v7;
  }
}

void sub_100033830(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000341F8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v12 = v5;
  id v7 = v6;
  if ([v7 integerValue] != (id)217)
  {
    uint64_t v8 = [*(id *)(a1 + 32) allKeys];
    unsigned int v9 = [v8 containsObject:v7];

    if (v9)
    {
      uint64_t v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
      id v11 = [v10 mutableCopy];

      [v11 addObject:v12];
    }
    else
    {
      id v11 = +[NSSet setWithObject:v12];
    }
    [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:v7];
  }
}

void sub_1000343E4(id a1)
{
  uint64_t v1 = objc_alloc_init(FMFHeartbeatManager);
  int v2 = (void *)qword_1000BB7F0;
  qword_1000BB7F0 = (uint64_t)v1;

  id v3 = +[NSDate dateWithTimeIntervalSinceNow:-600.0];
  [(id)qword_1000BB7F0 setLatestXPCActivityRegistrationTime:v3];
}

void sub_10003446C(id a1, OS_xpc_object *a2)
{
  xpc_activity_state_t state = xpc_activity_get_state(a2);
  if (state == 2)
  {
    id v4 = sub_100005560();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Heartbeat activity called with state XPC_ACTIVITY_STATE_RUN, sending refresh", v5, 2u);
    }

    id v3 = +[FMFCommandManager sharedInstance];
    [v3 checkHeartbeat];
  }
  else
  {
    if (state) {
      return;
    }
    id v3 = sub_100005560();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Heartbeat activity called with state XPC_ACTIVITY_STATE_CHECK_IN", buf, 2u);
    }
  }
}

void sub_1000352A0(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) favoritesManager];
  [v2 reset];

  id v3 = (id)objc_opt_new();
  [*(id *)(a1 + 32) setSaveFavoritesOperation:v3];
}

void sub_10003548C(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) favoritesManager];
  [v2 addFavorite:*(void *)(a1 + 40)];

  id v3 = [FMFSaveFavoritesOperations alloc];
  id v4 = [*(id *)(a1 + 32) favoritesManager];
  id v5 = [v4 favorites];
  id v7 = [(FMFSaveFavoritesOperations *)v3 initWithFavorites:v5 clientSession:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];

  id v6 = [*(id *)(a1 + 32) saveFavoritesOperation];
  [v6 addObject:v7];

  [*(id *)(a1 + 32) executeNextOperation];
}

void sub_1000356D4(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) favoritesManager];
  [v2 removeFavorite:*(void *)(a1 + 40)];

  id v3 = [FMFSaveFavoritesOperations alloc];
  id v4 = [*(id *)(a1 + 32) favoritesManager];
  id v5 = [v4 favorites];
  id v7 = [(FMFSaveFavoritesOperations *)v3 initWithFavorites:v5 clientSession:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];

  id v6 = [*(id *)(a1 + 32) saveFavoritesOperation];
  [v6 addObject:v7];

  [*(id *)(a1 + 32) executeNextOperation];
}

void sub_100035828(uint64_t a1)
{
  uint64_t v13 = 0;
  __int16 v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = sub_100007628;
  id v17 = sub_1000075D8;
  id v18 = 0;
  int v2 = [*(id *)(a1 + 32) saveFavoritesOperationUpdateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100035B38;
  block[3] = &unk_1000A27F8;
  void block[4] = *(void *)(a1 + 32);
  block[5] = &v13;
  dispatch_sync(v2, block);

  if (v14[5])
  {
    id v3 = sub_100005560();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [(id)v14[5] identifier];
      *(_DWORD *)long long buf = 138412290;
      long long v20 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "FMFFavoriteSequencer executeNextOperation: %@", buf, 0xCu);
    }
    id v5 = [objc_alloc((Class)FMSynchronizer) initWithDescription:@"com.apple.icloud.fmfd.favoritesequencer.savefavorites.execution.semaphore" andTimeout:300.0];
    [*(id *)(a1 + 32) setCurrentOperation:v14[5]];
    id v6 = (void *)v14[5];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    void v9[2] = sub_100035BFC;
    v9[3] = &unk_1000A2820;
    id v11 = &v13;
    id v7 = v5;
    uint64_t v10 = v7;
    [v6 executeWithCompletion:v9];
    [v7 wait];
    [*(id *)(a1 + 32) setCurrentOperation:0];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100035CE4;
    v8[3] = &unk_1000A14E8;
    void v8[4] = *(void *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
  }
  else
  {
    id v7 = sub_100005560();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FMFFenceSequencer executeNextOperation queue is empty!", buf, 2u);
    }
  }

  _Block_object_dispose(&v13, 8);
}

void sub_100035B08(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_100035B38(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) saveFavoritesOperation];
  id v3 = [v2 count];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) saveFavoritesOperation];
    uint64_t v5 = [v4 objectAtIndex:0];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v8 = [*(id *)(a1 + 32) saveFavoritesOperation];
    [v8 removeObjectAtIndex:0];
  }
}

void sub_100035BFC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100005560();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) identifier];
    int v6 = 138412546;
    id v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FMFFavoriteSequencer executeNextOperation completed: %@ withError?: %@", (uint8_t *)&v6, 0x16u);
  }
  [*(id *)(a1 + 32) signal];
}

id sub_100035CE4(uint64_t a1)
{
  return [*(id *)(a1 + 32) executeNextOperation];
}

BOOL sub_100036BD8(id a1, id a2, id a3, BOOL *a4)
{
  return [a3 intValue] != 200;
}

void sub_100037350(id a1)
{
  uint64_t v1 = objc_alloc_init(FMFCommandCoalescer);
  int v2 = (void *)qword_1000BB800;
  qword_1000BB800 = (uint64_t)v1;

  dispatch_queue_t v3 = dispatch_queue_create(off_1000BB160, 0);
  [(id)qword_1000BB800 setQueue:v3];

  [(id)qword_1000BB800 setColeasedRefreshPriority:0];
  [(id)qword_1000BB800 setRefreshScheduled:0];
  id v4 = +[NSMutableArray array];
  [(id)qword_1000BB800 setCoalescedCommands:v4];

  uint64_t v5 = (void *)qword_1000BB800;

  [v5 setSequencer:0];
}

void sub_1000374B4(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) coalescedCommands];
  id v32 = [v1 firstObject];

  int v2 = v32;
  if (v32)
  {
    id v31 = [v32 session];
    id v3 = [v32 reason];
    id v4 = [(FMFBaseCmd *)[FMFRefreshCommand alloc] initWithClientSession:v31];
    [(FMFRefreshCommand *)v4 setType:*(void *)(a1 + 40)];
    id v33 = v4;
    [(FMFRefreshCommand *)v4 setReason:v3];
    uint64_t v5 = +[NSMutableArray array];
    int v6 = +[NSCountedSet setWithCapacity:50];
    id v7 = +[NSMutableSet set];
    long long v35 = +[NSMutableSet set];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    __int16 v8 = [*(id *)(a1 + 32) coalescedCommands];
    id v9 = [v8 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v41;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v41 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          uint64_t v13 = [v12 completionBlock];
          BOOL v14 = v13 == 0;

          if (!v14)
          {
            uint64_t v15 = [v12 completionBlock];
            id v16 = objc_retainBlock(v15);
            [v5 addObject:v16];
          }
          id v17 = [v12 session];
          id v18 = [v17 clientPid];
          BOOL v19 = v18 == 0;

          if (!v19)
          {
            long long v20 = [v12 session];
            uint64_t v21 = [v20 clientPid];
            [v35 addObject:v21];
          }
          unsigned int v22 = +[FMFCommandManager sharedInstance];
          BOOL v23 = [v22 stringForReasonCode:[v12 reason]];
          [v6 addObject:v23];

          long long v24 = [v12 handles];
          [v7 unionSet:v24];
        }
        id v9 = [v8 countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v9);
    }

    if ([v6 count]) {
      [(FMFRefreshCommand *)v33 setSkippedReasons:v6];
    }
    if ([v35 count])
    {
      uint64_t v25 = [v35 allObjects];
      [(FMFRefreshCommand *)v33 setCoalescedAppContexts:v25];
    }
    id v26 = [*(id *)(a1 + 32) coleasedRefreshPriority];
    [*(id *)(a1 + 32) setColeasedRefreshPriority:0];
    if ([v7 count])
    {
      uint64_t v27 = [v7 allObjects];
      [(FMFRefreshCommand *)v33 setSelectedHandles:v27];

      [(FMFRefreshCommand *)v33 setIsShallowLocate:v26 != (id)1];
    }
    uint64_t v28 = [*(id *)(a1 + 32) coalescedCommands];
    [v28 removeAllObjects];

    objc_initWeak(&location, *(id *)(a1 + 32));
    id v29 = +[FMFCommandManager sharedInstance];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100037948;
    v36[3] = &unk_1000A28E0;
    objc_copyWeak(&v38, &location);
    id v30 = v5;
    id v37 = v30;
    [v29 sendCommand:v33 completionBlock:v36];

    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);

    int v2 = v32;
  }
}

void sub_10003791C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100037948(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = [v3 error];

  if (!v5)
  {
    int v6 = +[FMFDataManager sharedInstance];
    [v6 clearTapMessagesCache];
  }
  id v7 = [WeakRetained queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100037A54;
  block[3] = &unk_1000A28B8;
  id v10 = *(id *)(a1 + 32);
  id v11 = v3;
  id v12 = WeakRetained;
  id v8 = v3;
  dispatch_async(v7, block);
}

void sub_100037A54(id *a1)
{
  int v2 = dispatch_get_global_queue(0, 0);
  id v3 = _NSConcreteStackBlock;
  uint64_t v4 = 3221225472;
  uint64_t v5 = sub_100037B20;
  int v6 = &unk_1000A1468;
  id v7 = a1[4];
  id v8 = a1[5];
  dispatch_async(v2, &v3);

  [a1[6] setRefreshScheduled:0, v3, v4, v5, v6];
  [a1[6] _scheduleRefresh];
}

void sub_100037B20(uint64_t a1)
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v17 count:16];
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
        id v7 = *(void (***)(void, void))(*((void *)&v11 + 1) + 8 * i);
        id v8 = sub_100005560();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          id v9 = objc_retainBlock(v7);
          *(_DWORD *)long long buf = 138412290;
          id v16 = v9;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Finally calling skipped block: %@", buf, 0xCu);
        }
        id v10 = [*(id *)(a1 + 40) error];
        ((void (**)(void, void *))v7)[2](v7, v10);
      }
      id v4 = [v2 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v4);
  }
}

void sub_1000381EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_100038210(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = *(id *)(a1 + 40);
  if (v3 != [WeakRetained sequencer])
  {
    id v7 = sub_100005560();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[FMFCommandCoalescer _scheduleRefresh]_block_invoke");
      CFStringRef v13 = *(const __CFString **)(a1 + 40);
      *(_DWORD *)long long buf = 138412802;
      uint64_t v20 = (uint64_t)v9;
      __int16 v21 = 2048;
      CFStringRef v22 = v13;
      __int16 v23 = 2048;
      id v24 = [WeakRetained sequencer];
      long long v12 = "%@ Not sending refresh request due to mismatch of sequencer, captured sequenceNumber value: %ld, current seq"
            "uenceNumber value: %ld";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v12, buf, 0x20u);
    }
LABEL_14:

    goto LABEL_15;
  }
  CFStringRef v4 = @"highPriority";
  if (*(unsigned char *)(a1 + 56))
  {
LABEL_7:
    int v6 = +[NSString stringWithFormat:@"queued-%@(after %f)", v4, *(void *)(a1 + 48)];
    [WeakRetained _sendRefreshOfType:v6];

    id v7 = sub_100005560();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[FMFCommandCoalescer _scheduleRefresh]_block_invoke");
      id v9 = (void *)v8;
      CFStringRef v10 = @"lowPriority";
      long long v11 = *(void **)(a1 + 40);
      if (*(unsigned char *)(a1 + 56)) {
        CFStringRef v10 = @"highPriority";
      }
      *(_DWORD *)long long buf = 138412802;
      uint64_t v20 = v8;
      __int16 v21 = 2112;
      CFStringRef v22 = v10;
      __int16 v23 = 2048;
      id v24 = v11;
      long long v12 = "%@ Finally sending queued request(%@) with sequenceNumber: %ld";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  [WeakRetained _timeTillMinCallback];
  if (v5 > 0.0)
  {
    if (*(unsigned char *)(a1 + 56)) {
      CFStringRef v4 = @"highPriority";
    }
    else {
      CFStringRef v4 = @"lowPriority";
    }
    goto LABEL_7;
  }
  if ([WeakRetained refreshScheduled] == (id)1)
  {
    [WeakRetained setRefreshScheduled:0];
    long long v14 = sub_100005560();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[FMFCommandCoalescer _scheduleRefresh]_block_invoke");
      id v16 = (void *)v15;
      CFStringRef v17 = @"lowPriority";
      id v18 = *(void **)(a1 + 40);
      if (*(unsigned char *)(a1 + 56)) {
        CFStringRef v17 = @"highPriority";
      }
      *(_DWORD *)long long buf = 138412802;
      uint64_t v20 = v15;
      __int16 v21 = 2112;
      CFStringRef v22 = v17;
      __int16 v23 = 2048;
      id v24 = v18;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@ Discarding queued request(%@) with sequenceNumber: %ld", buf, 0x20u);
    }
  }
  [WeakRetained _scheduleRefresh];
LABEL_15:
}

void sub_100038618(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  if (v2 > (uint64_t)[*(id *)(a1 + 32) coleasedRefreshPriority])
  {
    [*(id *)(a1 + 32) setColeasedRefreshPriority:*(void *)(a1 + 72)];
    id v3 = sub_100005560();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [*(id *)(a1 + 32) coleasedRefreshPriority];
      int v7 = 134217984;
      id v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Updated refresh priority to: %ld", (uint8_t *)&v7, 0xCu);
    }
  }
  double v5 = [[FMFCoalescedCommand alloc] initWithHandles:*(void *)(a1 + 40) forSession:*(void *)(a1 + 48) callerId:*(void *)(a1 + 56) priority:*(void *)(a1 + 72) reason:*(void *)(a1 + 80) completionBlock:*(void *)(a1 + 64)];
  int v6 = [*(id *)(a1 + 32) coalescedCommands];
  [v6 addObject:v5];

  [*(id *)(a1 + 32) _scheduleRefresh];
}

id sub_1000390D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 identifier];
  if ((unint64_t)[v4 length] < 4
    || (unint64_t)[*(id *)(a1 + 32) length] < 4)
  {
    id v7 = 0;
  }
  else
  {
    double v5 = *(void **)(a1 + 32);
    int v6 = [v3 identifier];
    id v7 = [v5 hasPrefix:v6];
  }
  return v7;
}

id sub_100039264(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 ckRecordName];
  if ((unint64_t)[v4 length] < 4
    || (unint64_t)[*(id *)(a1 + 32) length] < 4)
  {
    id v7 = 0;
  }
  else
  {
    double v5 = *(void **)(a1 + 32);
    int v6 = [v3 ckRecordName];
    id v7 = [v5 hasPrefix:v6];
  }
  return v7;
}

void sub_100039630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  objc_destroyWeak(v26);
  objc_destroyWeak((id *)(v27 - 120));
  _Unwind_Resume(a1);
}

void sub_100039678(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) fenceWithID:*(void *)(a1 + 40)];
  id v3 = sub_100005560();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[FMFFenceManager getFenceWithID:timeout:block:]_block_invoke";
    __int16 v9 = 2112;
    CFStringRef v10 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: fence2: %@", (uint8_t *)&v7, 0x16u);
  }

  if (v2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    [WeakRetained removeObserver:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];

    uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
    int v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_1000397A0(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained removeObserver:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;

    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = +[NSError errorWithDomain:FMFErrorDomain code:10 userInfo:0];
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v6);
  }
}

void sub_100039BAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  objc_destroyWeak(v26);
  objc_destroyWeak((id *)(v27 - 120));
  _Unwind_Resume(a1);
}

void sub_100039BF4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) pendingFenceWithCKRecordName:*(void *)(a1 + 40)];
  uint64_t v3 = sub_100005560();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[FMFFenceManager getFenceWithCKRecordName:timeout:block:]_block_invoke";
    __int16 v9 = 2112;
    CFStringRef v10 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: fence2: %@", (uint8_t *)&v7, 0x16u);
  }

  if (v2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    [WeakRetained removeObserver:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];

    uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_100039D1C(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained removeObserver:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;

    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = +[NSError errorWithDomain:FMFErrorDomain code:10 userInfo:0];
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v6);
  }
}

void sub_100039FC8(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned __int8 v4 = [v3 isFromMe];
  uint64_t v5 = +[FMFDataManager sharedInstance];
  id v6 = v5;
  if (v4) {
    [v5 followedHandleForFence:v3];
  }
  else {
  int v7 = [v5 followerHandleForFence:v3];
  }

  if (v7)
  {
    id v8 = +[FMFIDSMessageController sharedInstance];
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    long long v11 = +[NSSet setWithObject:v7];
    id v13 = 0;
    [v8 sendDeletedFenceMessageWithFenceID:v10 ckRecordID:v9 toHandles:v11 error:&v13];
    long long v12 = v13;
  }
  else
  {
    long long v12 = sub_100005560();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10006C10C(v12);
    }
  }
}

void sub_10003A3EC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    int v7 = [*(id *)(a1 + 32) triggerManager];
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    uint64_t v11 = *(void *)(a1 + 64);
    uint64_t v12 = *(void *)(a1 + 72);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10003A548;
    v14[3] = &unk_1000A1950;
    id v15 = *(id *)(a1 + 88);
    [v7 triggerWithUUID:v8 forFence:v5 withStatus:v9 atDate:v10 triggerLocation:v11 clientSession:v12 completion:v14];
  }
  else
  {
    AnalyticsSendEvent();
    id v13 = sub_100005560();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10006C190();
    }

    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
  }
}

void sub_10003A548(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    unsigned __int8 v4 = sub_100005560();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10006C208();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10003A6F8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    unsigned __int8 v4 = [*(id *)(a1 + 32) triggerManager];
    [v4 receiveTriggerWithUUID:*(void *)(a1 + 40) forFence:v3 withStatus:*(void *)(a1 + 48) atDate:*(void *)(a1 + 56) triggerLocation:*(void *)(a1 + 64) completion:&stru_1000A2A30];
  }
  else
  {
    AnalyticsSendEvent();
    unsigned __int8 v4 = sub_100005560();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10006C27C();
    }
  }
}

void sub_10003A79C(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    id v3 = sub_100005560();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10006C2F4();
    }
  }
}

void sub_10003A95C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setAcceptanceStatus:v3];
  id v5 = [*(id *)(a1 + 40) triggerManager];
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v9 = *(void *)(a1 + 72);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003AA54;
  v11[3] = &unk_1000A1950;
  uint64_t v10 = *(void *)(a1 + 80);
  id v12 = *(id *)(a1 + 88);
  [v5 triggerWithUUID:v6 forFence:v4 withStatus:v7 atDate:v8 triggerLocation:v9 clientSession:v10 completion:v11];
}

void sub_10003AA54(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = sub_100005560();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10006C368();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10003B4A0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10003B4B4(id a1)
{
  id v1 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v2 = (void *)qword_1000BB810;
  qword_1000BB810 = (uint64_t)v1;

  qword_1000BB818 = (uint64_t)objc_alloc_init((Class)NSObject);

  _objc_release_x1();
}

void sub_10003B784(id *a1)
{
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v2 = [a1[4] registeredDelegates];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10003BAF0;
  v20[3] = &unk_1000A2AC8;
  id v21 = a1[5];
  id v22 = a1[6];
  __int16 v23 = &v24;
  [v2 enumerateObjectsUsingBlock:v20];

  if (!*((unsigned char *)v25 + 24))
  {
    id v3 = objc_alloc_init(FMFAPSDelegateInfo);
    [(FMFAPSDelegateInfo *)v3 setTopic:a1[6]];
    [(FMFAPSDelegateInfo *)v3 setDelegate:a1[5]];
    id v4 = [a1[4] registeredDelegates];
    [v4 addObject:v3];
  }
  if (byte_1000BB828 == 1)
  {
    id v5 = +[NSMutableSet set];
    uint64_t v6 = [a1[4] registeredDelegates];
    id v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    CFStringRef v17 = sub_10003BB9C;
    id v18 = &unk_1000A2AF0;
    uint64_t v7 = v5;
    BOOL v19 = v7;
    [v6 enumerateObjectsUsingBlock:&v15];

    uint64_t v8 = sub_100005560();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = a1[6];
      uint64_t v10 = [a1[4] environmentName:v15, v16, v17, v18];
      *(_DWORD *)long long buf = 138412802;
      id v29 = v9;
      __int16 v30 = 2112;
      id v31 = v10;
      __int16 v32 = 2112;
      id v33 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Registering for topic %@ in environment %@. Total topics : %@", buf, 0x20u);
    }
    uint64_t v11 = [a1[4] apsConnection];
    id v12 = [v7 allObjects];
    [v11 setEnabledTopics:v12];
  }
  else
  {
    uint64_t v7 = sub_100005560();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = a1[6];
      long long v14 = [a1[4] environmentName];
      *(_DWORD *)long long buf = 138412546;
      id v29 = v13;
      __int16 v30 = 2112;
      id v31 = v14;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Not registering for topic %@ in environment %@ right now since startup is not complete. Queueing it up.", buf, 0x16u);
    }
  }

  _Block_object_dispose(&v24, 8);
}

void sub_10003BAB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003BAF0(void *a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 delegate];
  id v4 = v3;
  if (v3 == (void *)a1[4])
  {
    id v5 = [v7 topic];
    uint64_t v6 = (void *)a1[5];

    if (v5 == v6)
    {
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
      [v7 setTopic:a1[5]];
    }
  }
  else
  {
  }
}

void sub_10003BB9C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 topic];
  [v2 addObject:v3];
}

void sub_10003BC8C(uint64_t a1)
{
  uint64_t v2 = sub_100005560();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(NSObject **)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) environmentName];
    *(_DWORD *)long long buf = 138412546;
    __int16 v23 = v3;
    __int16 v24 = 2112;
    uint64_t v25 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Attempting to deregister delegate %@ in environment %@", buf, 0x16u);
  }
  id v5 = +[NSMutableArray array];
  uint64_t v6 = [*(id *)(a1 + 40) registeredDelegates];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10003BFA8;
  v19[3] = &unk_1000A2B18;
  id v20 = *(id *)(a1 + 32);
  id v7 = v5;
  id v21 = v7;
  [v6 enumerateObjectsUsingBlock:v19];

  uint64_t v8 = [*(id *)(a1 + 40) registeredDelegates];
  id v9 = [v8 count];
  id v10 = [v7 count];

  if (v9 != v10)
  {
    [*(id *)(a1 + 40) setRegisteredDelegates:v7];
    if (byte_1000BB828 == 1)
    {
      uint64_t v11 = +[NSMutableSet set];
      id v12 = [*(id *)(a1 + 40) registeredDelegates];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10003C01C;
      v17[3] = &unk_1000A2AF0;
      id v13 = v11;
      id v18 = v13;
      [v12 enumerateObjectsUsingBlock:v17];

      long long v14 = sub_100005560();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        __int16 v23 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Updating list of topics after deregister: %@", buf, 0xCu);
      }

      id v15 = [*(id *)(a1 + 40) apsConnection];
      uint64_t v16 = [v13 allObjects];
      [v15 setEnabledTopics:v16];
    }
    else
    {
      id v13 = sub_100005560();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Not updating list of topics after deregister since startup is not complete. Will do this later", buf, 2u);
      }
    }
  }
}

void sub_10003BFA8(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 delegate];
  id v4 = *(void **)(a1 + 32);

  if (v3 != v4) {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

void sub_10003C01C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 topic];
  [v2 addObject:v3];
}

void sub_10003C100(id a1)
{
}

void sub_10003C114(id a1, id a2, FMFAPSHandler *a3, BOOL *a4)
{
  id v4 = a3;
  id v5 = +[NSMutableSet set];
  uint64_t v6 = [(FMFAPSHandler *)v4 registeredDelegates];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10003C410;
  v25[3] = &unk_1000A2AF0;
  id v7 = v5;
  id v26 = v7;
  [v6 enumerateObjectsUsingBlock:v25];

  uint64_t v8 = sub_100005560();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v28 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Updating list of topics after completion of startup: %@", buf, 0xCu);
  }

  id v9 = [(FMFAPSHandler *)v4 apsConnection];
  id v10 = [v7 allObjects];
  [v9 setEnabledTopics:v10];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v11 = [(FMFAPSHandler *)v4 pendingPushes];
  id v12 = [v11 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        CFStringRef v17 = [v16 objectForKeyedSubscript:@"topic"];
        id v18 = [v16 objectForKeyedSubscript:@"message"];
        BOOL v19 = sub_100005560();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412546;
          id v28 = v17;
          __int16 v29 = 2112;
          __int16 v30 = v18;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Replaying aps message on topic %@: %@", buf, 0x16u);
        }

        [(FMFAPSHandler *)v4 handleMessage:v18 onTopic:v17];
      }
      id v13 = [v11 countByEnumeratingWithState:&v21 objects:v31 count:16];
    }
    while (v13);
  }

  id v20 = +[NSMutableArray array];
  [(FMFAPSHandler *)v4 setPendingPushes:v20];
}

void sub_10003C410(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 topic];
  [v2 addObject:v3];
}

void sub_10003C530(id *a1)
{
  int v2 = byte_1000BB828;
  id v3 = sub_100005560();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if (v2 == 1)
  {
    if (v4)
    {
      id v5 = [a1[4] registeredDelegates];
      *(_DWORD *)long long buf = 67109120;
      unsigned int v14 = [v5 count];
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Checking for a handler for the APS message from %d registered delegates", buf, 8u);
    }
    uint64_t v6 = [a1[4] registeredDelegates];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    void v10[2] = sub_10003C71C;
    v10[3] = &unk_1000A2B18;
    id v11 = a1[5];
    id v12 = a1[6];
    [v6 enumerateObjectsUsingBlock:v10];

    id v7 = v11;
  }
  else
  {
    if (v4)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Startup is not complete. Queueing the aps message for later use", buf, 2u);
    }

    id v7 = +[NSMutableDictionary dictionary];
    [v7 setObject:a1[5] forKeyedSubscript:@"topic"];
    id v8 = a1[6];
    if (v8) {
      [v7 setObject:v8 forKeyedSubscript:@"message"];
    }
    id v9 = [a1[4] pendingPushes];
    [v9 addObject:v7];
  }
}

void sub_10003C71C(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 topic];
  unsigned int v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  if (v5)
  {
    uint64_t v6 = [v3 delegate];
    id v7 = sub_100005560();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Found delegate with matching topic %@", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = [v3 topic];
    [v6 didReceiveAPSMessage:v8 onTopic:v9];
  }
}

void sub_10003C9DC(uint64_t a1)
{
  if ([*(id *)(a1 + 32) length])
  {
    int v2 = sub_100005560();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = [*(id *)(a1 + 40) registeredDelegates];
      *(_DWORD *)long long buf = 67109120;
      unsigned int v8 = [v3 count];
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Notifying %d delegates about the updated aps token", buf, 8u);
    }
    BOOL v4 = [*(id *)(a1 + 40) registeredDelegates];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    _DWORD v5[2] = sub_10003CB24;
    v5[3] = &unk_1000A2AF0;
    id v6 = *(id *)(a1 + 32);
    [v4 enumerateObjectsUsingBlock:v5];
  }
}

void sub_10003CB24(uint64_t a1, void *a2)
{
  id v3 = [a2 delegate];
  [v3 didReceiveAPSToken:*(void *)(a1 + 32)];
}

void sub_10003CD08(id a1)
{
  id v1 = sub_100005560();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Creating shared instance of FMFXPCSessionManager", v6, 2u);
  }

  int v2 = objc_alloc_init(FMFXPCSessionManager);
  id v3 = (void *)qword_1000BB830;
  qword_1000BB830 = (uint64_t)v2;

  BOOL v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:qword_1000BB830 selector:"invalidateMaxCallbackTimer" name:off_1000BAFC0 object:0];

  unsigned int v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:qword_1000BB830 selector:"networkReachabilityUpdated:" name:off_1000BAFD8 object:0];
}

void sub_10003D058(uint64_t a1)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  int v2 = [*(id *)(a1 + 32) internalClientSessions];
  id v3 = [v2 keyEnumerator];

  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(a1 + 40) addObject:*(void *)(*((void *)&v8 + 1) + 8 * (void)v7)];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

void sub_10003D4BC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100005560();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v11 = 138412546;
      uint64_t v12 = v6;
      __int16 v13 = 2112;
      id v14 = v3;
      id v7 = "Error in quickly refreshing handles: %@, error: %@";
      long long v8 = v4;
      uint32_t v9 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v11, v9);
    }
  }
  else if (v5)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = 138412290;
    uint64_t v12 = v10;
    id v7 = "Quickly refreshed handles: %@, successfully";
    long long v8 = v4;
    uint32_t v9 = 12;
    goto LABEL_6;
  }
}

void sub_10003D63C(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) refreshTimer];
  [v2 invalidate];

  id v3 = +[FMFDataManager sharedInstance];
  id v4 = [v3 maxLocationRefreshTimeout];

  double v5 = *(double *)(a1 + 40);
  if (v4) {
    double v6 = (double)(int)[v4 intValue];
  }
  else {
    double v6 = 60.0;
  }
  if (v5 < v6) {
    double v6 = v5;
  }
  if (v6 == 0.0) {
    double v7 = 60.0;
  }
  else {
    double v7 = v6;
  }
  long long v8 = sub_100005560();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v10 = 134217984;
    double v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Refresh timer scheduled for %0.0f seconds", (uint8_t *)&v10, 0xCu);
  }

  uint32_t v9 = +[NSTimer scheduledTimerWithTimeInterval:*(void *)(a1 + 32) target:"refreshLocations" selector:0 userInfo:0 repeats:v7];
  [*(id *)(a1 + 32) setRefreshTimer:v9];
}

void sub_10003DE60(uint64_t a1, void *a2, void *a3)
{
  id v38 = a2;
  double v5 = a3;
  double v6 = sub_100005560();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)long long buf = 138412290;
      v65 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Error while getting locations: %@", buf, 0xCu);
    }
  }
  else
  {
    if (v7)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Location response received", buf, 2u);
    }

    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id obj = *(id *)(a1 + 32);
    id v39 = [obj countByEnumeratingWithState:&v60 objects:v71 count:16];
    double v6 = 0;
    if (v39)
    {
      uint64_t v36 = *(void *)v61;
      uint64_t v37 = a1;
      do
      {
        uint64_t v8 = 0;
        uint32_t v9 = v6;
        do
        {
          if (*(void *)v61 != v36) {
            objc_enumerationMutation(obj);
          }
          uint64_t v40 = v8;
          long long v43 = *(void **)(*((void *)&v60 + 1) + 8 * v8);
          uint64_t v46 = objc_alloc_init((Class)NSMutableSet);

          long long v58 = 0u;
          long long v59 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          id v41 = v38;
          id v44 = [v41 countByEnumeratingWithState:&v56 objects:v70 count:16];
          if (v44)
          {
            uint64_t v42 = *(void *)v57;
            do
            {
              uint64_t v10 = 0;
              do
              {
                if (*(void *)v57 != v42) {
                  objc_enumerationMutation(v41);
                }
                uint64_t v45 = v10;
                double v11 = *(void **)(*((void *)&v56 + 1) + 8 * v10);
                uint64_t v12 = [v43 handles];
                id v13 = [v12 copy];

                long long v54 = 0u;
                long long v55 = 0u;
                long long v52 = 0u;
                long long v53 = 0u;
                id v47 = v13;
                id v14 = [v47 countByEnumeratingWithState:&v52 objects:v69 count:16];
                if (v14)
                {
                  id v15 = v14;
                  uint64_t v16 = *(void *)v53;
                  do
                  {
                    for (i = 0; i != v15; i = (char *)i + 1)
                    {
                      if (*(void *)v53 != v16) {
                        objc_enumerationMutation(v47);
                      }
                      id v18 = [*(id *)(*((void *)&v52 + 1) + 8 * i) identifier];
                      BOOL v19 = [v18 lowercaseString];
                      id v20 = [v11 handle];
                      long long v21 = [v20 identifier];
                      long long v22 = [v21 lowercaseString];
                      unsigned int v23 = [v19 isEqualToString:v22];

                      if (v23) {
                        [v46 addObject:v11];
                      }
                    }
                    id v15 = [v47 countByEnumeratingWithState:&v52 objects:v69 count:16];
                  }
                  while (v15);
                }

                uint64_t v10 = v45 + 1;
              }
              while ((id)(v45 + 1) != v44);
              id v44 = [v41 countByEnumeratingWithState:&v56 objects:v70 count:16];
            }
            while (v44);
          }

          long long v24 = sub_100005560();
          double v6 = v46;
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            v65 = v46;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Calling setLocations on session for locations: %@", buf, 0xCu);
          }

          if ([v46 count])
          {
            long long v50 = 0u;
            long long v51 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            uint64_t v25 = v46;
            id v26 = [v25 countByEnumeratingWithState:&v48 objects:v68 count:16];
            if (v26)
            {
              id v27 = v26;
              uint64_t v28 = *(void *)v49;
              do
              {
                for (j = 0; j != v27; j = (char *)j + 1)
                {
                  if (*(void *)v49 != v28) {
                    objc_enumerationMutation(v25);
                  }
                  uint64_t v30 = *(void *)(*((void *)&v48 + 1) + 8 * (void)j);
                  id v31 = sub_100005560();
                  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                  {
                    __int16 v32 = *(NSObject **)(v37 + 40);
                    *(_DWORD *)long long buf = 138412546;
                    v65 = v32;
                    __int16 v66 = 2112;
                    uint64_t v67 = v30;
                    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%@: ingesting (refresh): %@", buf, 0x16u);
                  }
                }
                id v27 = [v25 countByEnumeratingWithState:&v48 objects:v68 count:16];
              }
              while (v27);
            }

            double v6 = v46;
          }
          id v33 = [v43 clientProxy];
          id v34 = [v6 copy];
          [v33 setLocations:v34];

          uint64_t v8 = v40 + 1;
          uint32_t v9 = v6;
        }
        while ((id)(v40 + 1) != v39);
        id v39 = [obj countByEnumeratingWithState:&v60 objects:v71 count:16];
      }
      while (v39);
    }

    double v5 = 0;
  }
}

void sub_10003EB00(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100005560();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FMFSaveFavoritesOperations: saveFavorites command completed with error?: %@", (uint8_t *)&v8, 0xCu);
  }

  double v5 = [*(id *)(a1 + 32) completionBlock];

  if (v5)
  {
    double v6 = [*(id *)(a1 + 32) completionBlock];
    ((void (**)(void, id))v6)[2](v6, v3);
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

void sub_10003F098(id a1)
{
  id v1 = sub_100005560();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Creating shared instance of FMFServerUserNotificationManager_iOS", v4, 2u);
  }

  id v2 = [[FMFServerUserNotificationManager alloc] initSingleton];
  id v3 = (void *)qword_1000BB840;
  qword_1000BB840 = (uint64_t)v2;
}

void sub_10003F7CC(uint64_t a1)
{
  CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource(kCFAllocatorDefault, *(CFUserNotificationRef *)(a1 + 32), (CFUserNotificationCallBack)sub_10003F854, 0);
  if (RunLoopSource)
  {
    id v2 = RunLoopSource;
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, v2, kCFRunLoopCommonModes);
    CFRelease(v2);
  }
}

void sub_10003F854(const void *a1, uint64_t a2)
{
  id v19 = +[NSNumber numberWithUnsignedLong:a1];
  id v4 = +[FMFServerUserNotificationManager sharedInstance];
  double v5 = [v4 activeUserNotifications];
  double v6 = [v5 objectForKeyedSubscript:v19];

  if (a2 == 1)
  {
    id v9 = [v6 alternateButtonAction];

    if (!v9) {
      goto LABEL_8;
    }
    uint64_t v8 = [v6 alternateButtonAction];
    goto LABEL_7;
  }
  if (!a2)
  {
    uint64_t v7 = [v6 defaultButtonAction];

    if (v7)
    {
      uint64_t v8 = [v6 defaultButtonAction];
LABEL_7:
      uint64_t v10 = (void *)v8;
      (*(void (**)(void))(v8 + 16))();
    }
  }
LABEL_8:
  double v11 = +[FMFServerUserNotificationManager sharedInstance];
  uint64_t v12 = [v11 activeUserNotifications];
  [v12 removeObjectForKey:v19];

  if ([v6 category])
  {
    id v13 = +[FMFServerUserNotificationManager sharedInstance];
    id v14 = [v13 activeCFNotificationsByCategory];
    id v15 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 category]);
    [v14 removeObjectForKey:v15];
  }
  uint64_t v16 = +[FMXPCTransactionManager sharedInstance];
  CFStringRef v17 = +[FMFServerUserNotificationManager sharedInstance];
  id v18 = [v17 _xpcTransactionNameFor:v6];
  [v16 endTransaction:v18];

  CFRelease(a1);
}

void sub_10003FAEC(id a1)
{
  id v1 = objc_alloc_init(FMFCommandManager);
  id v2 = (void *)qword_1000BB850;
  qword_1000BB850 = (uint64_t)v1;

  id v3 = objc_alloc_init(FMFServerInteractionController);
  [(id)qword_1000BB850 setServerInteractionController:v3];

  id v4 = +[NSMutableSet set];
  [(id)qword_1000BB850 setHandlesToBeLocated:v4];

  [(id)qword_1000BB850 setHasModelInitialized:0];
  [(id)qword_1000BB850 setIsPendingRefresh:0];
  [(id)qword_1000BB850 setIsRefreshInProgress:0];
  [(id)qword_1000BB850 setPreferredColeasedRefreshPriority:0];
  double v5 = +[NSArray arrayWithObjects:@"tap", @"forced", @"timer", @"updateData", @"userLocate", @"apsTokenChange", @"heartbeat", @"firstunlock", @"refreshMappingPackets", @"bar", @"notificationTokenInvalid", @"audioAccessoryForced", @"credentialRenewed", @"cloudKitRecordsChanged", @"clientSessionCreated", @"apsStatusReconnected", 0];
  [(id)qword_1000BB850 setEnumToStringMap:v5];

  id v6 = [objc_alloc((Class)NSCountedSet) initWithCapacity:50];
  [(id)qword_1000BB850 setSkippedRefreshReasons:v6];

  [(id)qword_1000BB850 setRegistrationRetries:0];
  [(id)qword_1000BB850 setLatest5XXTS:0];
  dispatch_queue_t v7 = dispatch_queue_create("com.apple.icloud.fmfd.redirectsUpdaterQueue", 0);
  [(id)qword_1000BB850 setRedirectsUpdaterQueue:v7];

  uint64_t v8 = +[NSNotificationCenter defaultCenter];
  [v8 addObserver:qword_1000BB850 selector:"accountWasRemoved" name:off_1000BAFC0 object:0];

  id v9 = +[NSNotificationCenter defaultCenter];
  [v9 addObserver:qword_1000BB850 selector:"showAlertFromServerResponse:" name:off_1000BAFD0 object:0];

  uint64_t v10 = +[NSNotificationCenter defaultCenter];
  [v10 addObserver:qword_1000BB850 selector:"hostRedirected:" name:FMCommandRedirectedNotification object:0];

  double v11 = +[NSNotificationCenter defaultCenter];
  uint64_t v12 = qword_1000BB850;
  id v13 = +[FMFCloudKitManager sharedInstance];
  [v11 addObserver:v12 selector:"cloudKitRecordsChanged:" name:@"FMFCloudKitManagerRecordsDidChangeNotification" object:v13];

  dispatch_queue_t v14 = dispatch_queue_create("com.apple.icloud.fmfd.serverContextQueue", 0);
  [(id)qword_1000BB850 setServerContextQueue:v14];
}

void sub_10003FF8C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) registrationCheckTimer];
  [v2 invalidate];

  [*(id *)(a1 + 32) setRegistrationCheckTimer:0];
  id v3 = +[FMFDataManager sharedInstance];
  id v4 = [v3 maxTriesToRegisterDevice];

  if (!v4)
  {
    id v4 = +[NSNumber numberWithDouble:3.0];
  }
  if (((unint64_t)[v4 integerValue] & 0x8000000000000000) != 0)
  {
    double v11 = sub_100005560();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      double v17 = *(double *)&v4;
      uint64_t v12 = "Not scheduling registration sanity check, since server sent -ve maxRetries(%@) value";
      goto LABEL_12;
    }
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) registrationRetries];
    if ((uint64_t)v5 >= (uint64_t)[v4 integerValue])
    {
      double v11 = sub_100005560();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [*(id *)(a1 + 32) registrationRetries];
        int v16 = 138412546;
        double v17 = *(double *)&v4;
        __int16 v18 = 2048;
        id v19 = v15;
        uint64_t v12 = "Not scheduling registration sanity check, exceeded maxRetries(%@) current registrationRetries(%ld)";
        id v13 = v11;
        uint32_t v14 = 22;
        goto LABEL_15;
      }
    }
    else
    {
      id v6 = +[FMFDataManager sharedInstance];
      [v6 maxWaitTimeForRegisterMS];
      double v8 = v7;

      if (v8 <= 0.0) {
        double v9 = 20.0;
      }
      else {
        double v9 = v8 / 1000.0;
      }
      uint64_t v10 = +[NSTimer scheduledTimerWithTimeInterval:*(void *)(a1 + 32) target:"_performDeviceRegistrationCheck:" selector:0 userInfo:0 repeats:v9];
      [*(id *)(a1 + 32) setRegistrationCheckTimer:v10];

      double v11 = sub_100005560();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 134217984;
        double v17 = v9;
        uint64_t v12 = "Registration check timer scheduled to trigger in %f sesconds";
LABEL_12:
        id v13 = v11;
        uint32_t v14 = 12;
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v16, v14);
      }
    }
  }
}

void sub_100040454(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 error];

  if (!v4)
  {
    id v5 = +[FMFAccountManager sharedInstance];
    id v6 = [v5 account];
    double v7 = [v6 dsid];

    double v8 = +[FMFDataManager sharedInstance];
    double v9 = [v8 lastLoggedInPrsId];

    if (v7 && ([v7 isEqualToString:v9] & 1) == 0)
    {
      uint64_t v10 = +[FMFDataManager sharedInstance];
      [v10 updateLastLoggedInPrsId:v7];
    }
    else
    {
      uint64_t v10 = sub_100005560();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412546;
        uint32_t v14 = v7;
        __int16 v15 = 2112;
        int v16 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Skipping last logged in prs id due to currentLoggedInPrsId(%@) and lastLoggedInPrsId(%@)", (uint8_t *)&v13, 0x16u);
      }
    }
  }
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11)
  {
    uint64_t v12 = [v3 error];
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
  }
}

void sub_1000407F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100005560();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v12 = 138412290;
      id v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Error while init: %@", (uint8_t *)&v12, 0xCu);
    }

    uint64_t v6 = *(void *)(a1 + 48);
    if (!v6)
    {
      double v7 = sub_100005560();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Error while init, but there is no completion block, notifying client through delegate callback", (uint8_t *)&v12, 2u);
      }

      double v8 = [*(id *)(a1 + 40) clientProxy];
      [v8 didReceiveServerError:v3];

      goto LABEL_12;
    }
LABEL_11:
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
    goto LABEL_12;
  }
  if (v5)
  {
    LOWORD(v12) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Init succeeded", (uint8_t *)&v12, 2u);
  }

  [*(id *)(a1 + 32) setHasModelInitialized:1];
  double v9 = +[NSNotificationCenter defaultCenter];
  [v9 postNotificationName:off_1000BAFE0 object:0];

  uint64_t v10 = +[FMFDataManager sharedInstance];
  [v10 clearTapMessagesCache];

  uint64_t v11 = +[FMFBlockListManager sharedInstance];
  [v11 sanitizeBlockList];

  [*(id *)(a1 + 32) _scheduleRegistrationSanityCheck];
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    goto LABEL_11;
  }
LABEL_12:
}

void sub_100040CE8(id *a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = +[NSError errorWithDomain:FMFErrorDomain code:1011 userInfo:0];
    [a1[5] setError:v3];

    id v4 = (void (*)(void))*((void *)a1[6] + 2);
    v4();
  }
  else
  {
    BOOL v5 = [a1[4] serverInteractionController];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100040E14;
    v7[3] = &unk_1000A2C50;
    id v6 = a1[5];
    id v9 = a1[6];
    id v8 = a1[5];
    [v5 sendCommand:v6 completionBlock:v7];
  }
}

uint64_t sub_100040E14(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_100040E28(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_100041780(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 jsonResponseDictionary];
  id v4 = +[FMFDataManager sharedInstance];
  [v4 setLocationsFromData:v3];

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    id v6 = +[FMFDataManager sharedInstance];
    double v7 = [v6 locationsForHandles:*(void *)(a1 + 32)];
    id v8 = [v9 error];
    (*(void (**)(uint64_t, void *, void *))(v5 + 16))(v5, v7, v8);
  }
}

void sub_100041944(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 error];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

void sub_100041A88(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 error];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

void sub_100041BD8(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 error];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

void sub_100041D28(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 error];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

void sub_100041FCC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 error];

  if (v4)
  {
    uint64_t v5 = sub_100005560();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v26 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Error while trying to check reachability: %@", buf, 0xCu);
    }
  }
  if (*(void *)(a1 + 40))
  {
    id v6 = [v3 statusMapFromServer];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v19 = a1;
    id v7 = *(id *)(a1 + 32);
    id v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          int v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          id v13 = [v12 qualifiedIdentifier];
          uint32_t v14 = [v6 objectForKeyedSubscript:v13];
          id v15 = [v14 BOOLValue];

          [v12 setReachable:v15];
        }
        id v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v9);
    }

    uint64_t v16 = *(void *)(v19 + 32);
    uint64_t v17 = *(void *)(v19 + 40);
    __int16 v18 = [v3 error];
    (*(void (**)(uint64_t, uint64_t, void *))(v17 + 16))(v17, v16, v18);
  }
}

void sub_100042464(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 requestTokens];
  uint64_t v5 = [v3 error];

  if (!v5)
  {
    id v19 = v3;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v18 = a1;
    id v6 = [*(id *)(a1 + 32) toHandles];
    id v7 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v21;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          int v12 = +[FMFDataManager sharedInstance];
          id v13 = [v11 identifier];
          uint32_t v14 = [v12 followerHandleForIdentifier:v13];

          if (v14)
          {
            id v15 = sub_100005560();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 138412290;
              uint64_t v25 = v14;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Not adding handle to cache because they are already a follower: %@", buf, 0xCu);
            }
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
      }
      while (v8);
    }

    id v3 = v19;
    a1 = v18;
  }
  uint64_t v16 = *(void *)(a1 + 40);
  uint64_t v17 = [v3 error];
  (*(void (**)(uint64_t, void *, void *))(v16 + 16))(v16, v4, v17);
}

void sub_1000427FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = [v3 requestTokens];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = [v3 error];

  (*(void (**)(uint64_t, id, void *))(v4 + 16))(v4, v6, v5);
}

void sub_100042B04(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = [v3 requestTokens];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = [v3 error];

  (*(void (**)(uint64_t, id, void *))(v4 + 16))(v4, v6, v5);
}

void sub_100042D84(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = [v3 requestTokens];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = [v3 error];

  (*(void (**)(uint64_t, id, void *))(v4 + 16))(v4, v6, v5);
}

void sub_100043038(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[FMFDataManager sharedInstance];
  [v4 removeFutureFollowerRequest:*(void *)(a1 + 32)];

  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [v3 error];

  (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
}

void sub_1000431F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[FMFDataManager sharedInstance];
  [v4 removeFutureFollowerRequest:*(void *)(a1 + 32)];

  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [v3 error];

  (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
}

void sub_1000433CC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = [v3 requestTokens];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = [v3 error];

  (*(void (**)(uint64_t, id, void *))(v4 + 16))(v4, v6, v5);
}

void sub_100043594(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = [v10 error];

  uint64_t v4 = *(void *)(a1 + 32);
  if (v3)
  {
    uint64_t v5 = [v10 error];
    (*(void (**)(uint64_t, void, void, void, void, void *))(v4 + 16))(v4, 0, 0, 0, 0, v5);
  }
  else
  {
    id v6 = v10;
    uint64_t v5 = [v6 requestTokensStatusMap];
    id v7 = [v6 requestTokens];
    id v8 = [v6 follower];
    uint64_t v9 = [v6 following];

    (*(void (**)(uint64_t, void *, void *, void *, void *, void))(v4 + 16))(v4, v5, v7, v8, v9, 0);
  }
}

void sub_1000437EC(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 error];

  uint64_t v4 = *(void *)(a1 + 32);
  if (v3)
  {
    uint64_t v5 = [v9 error];
    (*(void (**)(uint64_t, void, void, void *))(v4 + 16))(v4, 0, 0, v5);
  }
  else
  {
    id v6 = v9;
    uint64_t v5 = [v6 offerPending];
    id v7 = [v6 invitePending];
    id v8 = [v6 error];

    (*(void (**)(uint64_t, void *, void *, void *))(v4 + 16))(v4, v5, v7, v8);
  }
}

void sub_100043B60(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = a2;
  id v6 = [v3 responseId];
  uint64_t v5 = [v4 error];

  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v6, v5);
}

void sub_100043CFC(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 error];

  if (v3)
  {
    id v4 = +[FMFAccountManager sharedInstance];
    [v4 storeInvalidMappingPacketsForFutureRemoval:*(void *)(a1 + 32)];
  }
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [v7 error];
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
}

void sub_100043EBC(uint64_t a1)
{
  uint64_t v2 = sub_100005560();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) userInfo];
    int v12 = 138412290;
    id v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Received host redirected notification, with userInfo: %@", (uint8_t *)&v12, 0xCu);
  }
  id v4 = [*(id *)(a1 + 32) userInfo];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"originalHostname"];
  id v6 = [v4 objectForKeyedSubscript:@"redirectedHostname"];
  id v7 = +[FMFAccountManager sharedInstance];
  id v8 = [v7 appHostnameFromSettings];

  if ([v8 length])
  {
    id v9 = sub_100005560();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      id v13 = v5;
      __int16 v14 = 2112;
      id v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "330: Updating appHostNameFromSettings, current oldHostName(%@), host name from settings(%@)", (uint8_t *)&v12, 0x16u);
    }

    id v10 = v8;
    uint64_t v5 = v10;
  }
  if (v5 && v6)
  {
    uint64_t v11 = +[NSDictionary dictionaryWithObject:v6 forKey:v5];
    [*(id *)(a1 + 40) updateRedirectsCache:v11];
  }
}

id sub_1000442D8(uint64_t a1)
{
  uint64_t v2 = sub_100005560();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Cleaning up cached redirects", v5, 2u);
  }

  id v3 = +[NSDictionary dictionary];
  [*(id *)(a1 + 32) setCachedRedirects:v3];

  return [*(id *)(a1 + 32) storeRedirectsToDefaults];
}

id sub_100044FE0(uint64_t a1)
{
  uint64_t v2 = sub_100005560();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "OK button tapped. Performing action %@", (uint8_t *)&v5, 0xCu);
  }

  return +[FMFUtils handleAlertAction:*(void *)(a1 + 40)];
}

id sub_100045098(uint64_t a1)
{
  uint64_t v2 = sub_100005560();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Cancel button tapped. Performing action %@", (uint8_t *)&v5, 0xCu);
  }

  return +[FMFUtils handleAlertAction:*(void *)(a1 + 40)];
}

id sub_100045150(uint64_t a1)
{
  return [*(id *)(a1 + 32) activate];
}

void sub_100045158(uint64_t a1)
{
  uint64_t v2 = +[FMFDataManager sharedInstance];
  id v4 = [v2 thisDeviceId];

  uint64_t v3 = [[FMFSaveMeCommand alloc] initWithDeviceId:v4];
  [*(id *)(a1 + 32) sendCommand:v3 completionBlock:&stru_1000A2D08];
}

void sub_1000451E8(id a1, FMFBaseCmd *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = [(FMFBaseCmd *)v2 error];

  id v4 = sub_100005560();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      uint64_t v6 = [(FMFBaseCmd *)v2 error];
      int v7 = 138412290;
      id v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Failed while trying to set this device as me device, error: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  else if (v5)
  {
    LOWORD(v7) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Successfully set this device as me device, through SAVEME alert", (uint8_t *)&v7, 2u);
  }
}

void sub_1000452F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 error];

  BOOL v5 = sub_100005560();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = [v3 error];
      int v10 = 138412546;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      id v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Failed while trying to acknowledge display of alert with id: %@, error: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  else if (v6)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138412290;
    uint64_t v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Successfully acknowledged display of this alert with id: %@", (uint8_t *)&v10, 0xCu);
  }
}

id sub_100045AE4(uint64_t a1)
{
  [*(id *)(a1 + 32) set_serverContext:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);

  return _[v2 saveNotificationToken];
}

void sub_100045C58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_100045C88(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained _serverContext];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_1000461E4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 error];

  BOOL v5 = sub_100005560();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      uint64_t v7 = [v3 error];
      int v10 = 138412290;
      id v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMFCommandManager: send command failed: %@", (uint8_t *)&v10, 0xCu);
    }
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = [v3 error];
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }
  else
  {
    if (v6)
    {
      int v10 = 138412290;
      id v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMFCommandManager: send command succeeded: %@", (uint8_t *)&v10, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_100046540(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 error];

  BOOL v5 = sub_100005560();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      uint64_t v7 = [v3 error];
      int v10 = 138412290;
      id v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMFCommandManager: saveFavorites command failed: %@", (uint8_t *)&v10, 0xCu);
    }
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = [v3 error];
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }
  else
  {
    if (v6)
    {
      int v10 = 138412290;
      id v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMFCommandManager: saveFavorites command succeeded: %@", (uint8_t *)&v10, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_10004767C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100047694(uint64_t a1)
{
  uint64_t v2 = CKDatabaseScopeString();
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  BOOL v5 = +[FMFAccountManager sharedInstance];
  BOOL v6 = [v5 storedDSID];

  if (v6)
  {
    uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) stringByAppendingString:v6];
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  else
  {
    int v10 = sub_100005560();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      __int16 v12 = "-[FMFCloudKitCache scopeStringForAccountWithScope:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: No account DSID", (uint8_t *)&v11, 0xCu);
    }
  }
}

FMFSchedule *__cdecl sub_100049994(id a1, FMFFence *a2)
{
  return (FMFSchedule *)[(FMFFence *)a2 schedule];
}

void sub_100049FB4(void *a1, uint64_t a2, void *a3)
{
  id v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  id v7 = a3;
  [v4 postConfirmationNotificationWithUUID:v5 atDate:v6];
  (*(void (**)(void))(a1[7] + 16))();
}

BOOL sub_10004A380(id a1, FMFFence *a2)
{
  uint64_t v2 = [(FMFFence *)a2 trigger];
  unsigned __int8 v3 = [v2 isEqualToString:FMFFenceTriggerScheduled];

  return v3;
}

void sub_10004A4BC(uint64_t a1)
{
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v1 = *(id *)(a1 + 32);
  id v2 = [v1 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v2)
  {
    id v4 = v2;
    uint64_t v5 = *(void *)v25;
    uint64_t v6 = FMFFenceAcceptanceStatusPendingHidden;
    id v19 = v23;
    uint64_t v20 = FMFFenceAcceptanceStatusPending;
    *(void *)&long long v3 = 138412290;
    long long v18 = v3;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v25 != v5) {
          objc_enumerationMutation(v1);
        }
        uint64_t v8 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v7);
        uint64_t v9 = +[NSDate now];
        int v10 = [v8 inviteDate];
        id v11 = [v9 compare:v10];

        if (v11 == (id)1)
        {
          __int16 v12 = [v8 acceptanceStatus];
          if ([v12 isEqualToString:v6])
          {
            unsigned int v13 = [v8 isOnMe];

            if (v13)
            {
              __int16 v14 = sub_100005560();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
              {
                id v15 = [v8 identifier];
                *(_DWORD *)long long buf = v18;
                __int16 v29 = v15;
                _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Fence invite date overdue, inviting fence: %@", buf, 0xCu);
              }
              [v8 setAcceptanceStatus:v20];
              uint64_t v16 = [*(id *)(a1 + 40) delegate];
              uint64_t v17 = *(void *)(a1 + 40);
              v22[0] = _NSConcreteStackBlock;
              v22[1] = 3221225472;
              v23[0] = sub_10004A748;
              v23[1] = &unk_1000A2E50;
              v23[2] = v8;
              [v16 triggerManager:v17 didModifyFence:v8 withCompletion:v22];
            }
          }
          else
          {
          }
        }
        id v7 = (char *)v7 + 1;
      }
      while (v4 != v7);
      id v4 = [v1 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v4);
  }
}

void sub_10004A748(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v3 = +[NSUUID UUID];
  id v2 = +[NSDate date];
  [v1 postConfirmationNotificationWithUUID:v3 atDate:v2];
}

void sub_10004A864(uint64_t a1, void *a2)
{
  id v3 = a2;
  string = xpc_dictionary_get_string(v3, _xpc_event_key_name);
  uint64_t v5 = +[NSString stringWithUTF8String:string];
  uint64_t v6 = sub_100005560();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    uint64_t v9 = "-[FMFFenceTriggerManager registerAlarms]_block_invoke";
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: XPC Alarm fired with name: %@", (uint8_t *)&v8, 0x16u);
  }

  if (!strcmp(string, "com.apple.icloud.fmf.FMFFenceInviteTimer"))
  {
    uint64_t v7 = 0;
    goto LABEL_9;
  }
  if (!strcmp(string, FMFScheduleTimerIdentifier))
  {
    uint64_t v7 = 1;
    goto LABEL_9;
  }
  if (!strcmp(string, "com.apple.icloud.fmf.FMFFenceTriggerManager.GraceTimer"))
  {
    uint64_t v7 = 2;
LABEL_9:
    [*(id *)(a1 + 32) handleAlarmForAlarmName:v7];
  }
  xpc_dictionary_get_string(v3, _xpc_event_key_name);
  xpc_set_event();
}

void sub_10004AF9C(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v3 = +[NSUUID UUID];
  id v2 = +[NSDate date];
  [v1 postConfirmationNotificationWithUUID:v3 atDate:v2];
}

uint64_t sub_10004B1F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 acceptanceStatus];
  unsigned __int8 v5 = [v4 isEqualToString:FMFFenceAcceptanceStatusAccepted];

  if (v5)
  {
    if ([v3 isOnMe])
    {
      uint64_t v6 = sub_100005560();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v13 = 136315394;
        __int16 v14 = "-[FMFFenceTriggerManager _graceTimerFired]_block_invoke";
        __int16 v15 = 2112;
        id v16 = v3;
        uint64_t v7 = "%s: bailing, fence on me: %@";
LABEL_16:
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v13, 0x16u);
      }
    }
    else
    {
      int v8 = [v3 schedule];
      unsigned __int8 v9 = [v8 isCurrentAt:*(void *)(a1 + 32)];

      if (v9)
      {
        if ([v3 isMuted])
        {
          uint64_t v6 = sub_100005560();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
          {
            int v13 = 136315394;
            __int16 v14 = "-[FMFFenceTriggerManager _graceTimerFired]_block_invoke";
            __int16 v15 = 2112;
            id v16 = v3;
            uint64_t v7 = "%s: bailing, fence is muted: %@";
            goto LABEL_16;
          }
        }
        else
        {
          __int16 v10 = [v3 statusForDate:*(void *)(a1 + 32)];

          if (!v10)
          {
            uint64_t v11 = 1;
            goto LABEL_18;
          }
          AnalyticsSendEvent();
          uint64_t v6 = sub_100005560();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
          {
            int v13 = 136315394;
            __int16 v14 = "-[FMFFenceTriggerManager _graceTimerFired]_block_invoke";
            __int16 v15 = 2112;
            id v16 = v3;
            uint64_t v7 = "%s: bailing, fence already has status: %@";
            goto LABEL_16;
          }
        }
      }
      else
      {
        uint64_t v6 = sub_100005560();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          int v13 = 136315394;
          __int16 v14 = "-[FMFFenceTriggerManager _graceTimerFired]_block_invoke";
          __int16 v15 = 2112;
          id v16 = v3;
          uint64_t v7 = "%s: bailing, fence is not current: %@";
          goto LABEL_16;
        }
      }
    }
  }
  else
  {
    uint64_t v6 = sub_100005560();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315394;
      __int16 v14 = "-[FMFFenceTriggerManager _graceTimerFired]_block_invoke";
      __int16 v15 = 2112;
      id v16 = v3;
      uint64_t v7 = "%s: bailing, fence not accepted: %@";
      goto LABEL_16;
    }
  }

  uint64_t v11 = 0;
LABEL_18:

  return v11;
}

void sub_10004BB48(id a1)
{
  id v1 = +[NSUserDefaults standardUserDefaults];
  CFStringRef v7 = @"FMFScheduledFenceStatus";
  int v8 = &__NSDictionary0__struct;
  id v2 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  [v1 registerDefaults:v2];

  id v3 = +[NSUserDefaults standardUserDefaults];
  id v4 = [v3 dictionaryForKey:@"FMFScheduledFenceStatus"];
  id v5 = [v4 mutableCopy];
  uint64_t v6 = (void *)qword_1000BB860;
  qword_1000BB860 = (uint64_t)v5;
}

FMFHandle *__cdecl sub_10004CE3C(id a1, NSString *a2)
{
  id v2 = a2;
  id v3 = +[FMFDataManager sharedInstance];
  id v4 = [v3 followerHandleForServerId:v2];

  return (FMFHandle *)v4;
}

void sub_10004CFD0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100005560();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10006D2F0();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 136315394;
    int v8 = "-[FMFFence(Notifications) postConfirmationNotificationWithUUID:atDate:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: posted uuid: %@", (uint8_t *)&v7, 0x16u);
  }
}

void sub_10004D330(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100005560();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10006D368();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 136315394;
    int v8 = "-[FMFFence(Notifications) postReceiveTriggerNotificationWithUUID:forStatus:atDate:triggerLocation:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: posted uuid: %@", (uint8_t *)&v7, 0x16u);
  }
}

void sub_10004D6A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100005560();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10006D3E0();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 136315394;
    int v8 = "-[FMFFence(Notifications) postTriggerNotificationWithUUID:forStatus:atDate:triggerLocation:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: posted uuid: %@", (uint8_t *)&v7, 0x16u);
  }
}

void sub_10004E858(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void sub_10004F16C(id a1)
{
  qword_1000BB878 = (uint64_t)dispatch_queue_create("com.example.mobileme.FMF.FMFBaseCmd.transactionFactory", 0);

  _objc_release_x1();
}

uint64_t sub_10004F1AC(uint64_t a1)
{
  ++qword_1000BB298;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:");

  return _objc_release_x1();
}

void sub_100050868(id a1)
{
  id v1 = +[NSCharacterSet URLQueryAllowedCharacterSet];
  id v2 = [v1 mutableCopy];

  [v2 removeCharactersInString:@"!*'();:@&=+$,/?%#[]"];
  id v3 = (void *)qword_1000BB880;
  qword_1000BB880 = (uint64_t)v2;
}

void sub_100051458(uint64_t a1)
{
  id v2 = (id)objc_opt_new();
  [*(id *)(a1 + 32) setFavoriteHandles:v2];
}

void sub_1000515E0(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 favoriteHandles];
  uint64_t v4 = [v2 handles:v3 minusHandle:*(void *)(a1 + 40)];
  id v7 = [v4 mutableCopy];

  id v5 = +[NSNumber numberWithInt:0];
  [*(id *)(a1 + 40) setFavoriteOrder:v5];

  [v7 enumerateObjectsUsingBlock:&stru_1000A2F58];
  [v7 insertObject:*(void *)(a1 + 40) atIndex:0];
  [*(id *)(a1 + 32) setFavoriteHandles:v7];
  uint64_t v6 = [*(id *)(a1 + 32) favoritesDataFromHandles:v7];
  [*(id *)(a1 + 32) setFavoritesData:v6];
}

void sub_1000516D8(id a1, FMFHandle *a2, unint64_t a3, BOOL *a4)
{
  unint64_t v4 = a3 + 1;
  id v5 = a2;
  id v6 = +[NSNumber numberWithUnsignedInteger:v4];
  [(FMFHandle *)v5 setFavoriteOrder:v6];
}

void sub_100051880(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) favoriteHandles];
  __int16 v15 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = v2;
  id v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v3);
        }
        __int16 v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = [v9 serverId];
        uint64_t v11 = [*(id *)(a1 + 40) serverId];
        unsigned __int8 v12 = [v10 isEqualToString:v11];

        if ((v12 & 1) == 0)
        {
          int v13 = +[NSNumber numberWithUnsignedInteger:v6];
          [v9 setFavoriteOrder:v13];

          [v15 addObject:v9];
          ++v6;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  [*(id *)(a1 + 32) setFavoriteHandles:v15];
  __int16 v14 = [*(id *)(a1 + 32) favoritesDataFromHandles:v15];
  [*(id *)(a1 + 32) setFavoritesData:v14];
}

id sub_100051BDC(uint64_t a1)
{
  [*(id *)(a1 + 32) setFavoritesData:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);

  return [v2 updateHandlesWithFavorites:v3];
}

void sub_100051D54(uint64_t a1)
{
  long long v17 = objc_opt_new();
  id v2 = [*(id *)(a1 + 32) allValues];
  [v2 makeObjectsPerformSelector:"clearFavoriteOrder"];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = [*(id *)(a1 + 40) favoritesData];
  id v3 = [obj countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v20;
    *(void *)&long long v4 = 138412546;
    long long v16 = v4;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(obj);
        }
        int v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        __int16 v9 = [v8 objectForKey:@"id" v16];
        uint64_t v10 = [*(id *)(a1 + 32) objectForKey:v9];
        if (v10)
        {
          uint64_t v11 = [v8 objectForKey:@"order"];
          unsigned __int8 v12 = +[NSNull null];
          if (v11 == v12)
          {
            int v13 = 0;
          }
          else
          {
            int v13 = [v8 objectForKey:@"order"];
          }

          __int16 v14 = sub_100005560();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = v16;
            long long v24 = v10;
            __int16 v25 = 2112;
            long long v26 = v13;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Updating favorite order for %@ with %@.", buf, 0x16u);
          }

          if (v13)
          {
            [v10 setFavoriteOrder:v13];
            [v17 addObject:v10];
          }
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v5);
  }

  __int16 v15 = [*(id *)(a1 + 40) favoritesHandlesInHandles:v17];
  [*(id *)(a1 + 40) setFavoriteHandles:v15];
}

void sub_100052110(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) favoritesHandlesInHandles:*(void *)(a1 + 40)];
  id v3 = [*(id *)(a1 + 32) favoritesDataFromHandles:v2];
  long long v4 = sub_100005560();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    id v6 = [v2 count];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FMFFavoritesSequencer updateWithCachedHandles favorites found (%ld)", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 32) setFavoriteHandles:v2];
  [*(id *)(a1 + 32) setFavoritesData:v3];
}

void sub_100052310(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100052328(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) favoriteHandles];

  return _objc_release_x1();
}

void sub_100052A78(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    uint64_t v10 = sub_100005560();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10006D6D4();
    }

    v21[0] = @"fenceType";
    uint64_t v11 = [*(id *)(a1 + 32) type];
    v21[1] = @"updateFenceError";
    v22[0] = v11;
    [v9 code];
    unsigned __int8 v12 = stringForCKErrorCode();
    v22[1] = v12;
    int v13 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
    AnalyticsSendEvent();

    uint64_t v14 = *(void *)(a1 + 48);
    __int16 v15 = CKXPCSuitableError();
    (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, v15);
  }
  else
  {
    long long v16 = [v7 recordID];
    long long v17 = [v16 recordName];
    [*(id *)(a1 + 32) setCkRecordName:v17];

    long long v18 = [v7 recordID];
    long long v19 = [v18 zoneID];
    long long v20 = [v19 ownerName];
    [*(id *)(a1 + 32) setCkRecordZoneOwnerName:v20];

    [*(id *)(a1 + 40) _addFence:*(void *)(a1 + 32) clientSession:0 ckShare:v8 completion:*(void *)(a1 + 48)];
  }
}

void sub_100052F84(uint64_t a1, char a2)
{
  if (a2)
  {
    id v3 = objc_opt_class();
    long long v4 = *(void **)(a1 + 32);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    void v21[2] = sub_10005319C;
    v21[3] = &unk_1000A3070;
    id v22 = v4;
    id v5 = *(id *)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = *(void **)(a1 + 48);
    id v25 = v5;
    uint64_t v23 = v6;
    id v24 = v7;
    [v3 ckCheckForStaleZonesForFence:v22 withCompletion:v21];

    id v8 = v22;
  }
  else
  {
    id v9 = sub_100005560();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10006D7C0(v9, v10, v11, v12, v13, v14, v15, v16);
    }

    v26[0] = @"fenceType";
    long long v17 = [*(id *)(a1 + 32) type];
    v27[0] = v17;
    v26[1] = @"fenceTriggerType";
    long long v18 = [*(id *)(a1 + 32) trigger];
    v27[1] = v18;
    v27[2] = &off_1000A8FE0;
    v26[2] = @"addFenceSuccess";
    v26[3] = @"addFenceError";
    v27[3] = @"FMFFenceErrorAppUpgradeNeeded";
    long long v19 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:4];
    AnalyticsSendEvent();

    uint64_t v20 = *(void *)(a1 + 56);
    id v8 = +[NSError errorWithDomain:FMFFenceErrorDomain code:0 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v20 + 16))(v20, 0, v8);
  }
}

void sub_10005319C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    long long v4 = sub_100005560();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10006D838();
    }

    v21[0] = @"fenceType";
    id v5 = [*(id *)(a1 + 32) type];
    v22[0] = v5;
    v21[1] = @"fenceTriggerType";
    uint64_t v6 = [*(id *)(a1 + 32) trigger];
    v22[1] = v6;
    void v22[2] = &off_1000A8FE0;
    void v21[2] = @"addFenceSuccess";
    v21[3] = @"addFenceError";
    [v3 code];
    id v7 = stringForCKErrorCode();
    v22[3] = v7;
    id v8 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:4];
    AnalyticsSendEvent();

    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = CKXPCSuitableError();
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);
  }
  else
  {
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = *(void **)(a1 + 32);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000533C4;
    v16[3] = &unk_1000A3048;
    id v17 = v12;
    id v13 = *(id *)(a1 + 56);
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v15 = *(void **)(a1 + 48);
    id v20 = v13;
    uint64_t v18 = v14;
    id v19 = v15;
    [v11 ckUpdateRecordForFence:v17 withCompletion:v16];

    uint64_t v10 = v17;
  }
}

void sub_1000533C4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    uint64_t v10 = sub_100005560();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10006D838();
    }

    v22[0] = @"fenceType";
    uint64_t v11 = [*(id *)(a1 + 32) type];
    v23[0] = v11;
    v22[1] = @"fenceTriggerType";
    uint64_t v12 = [*(id *)(a1 + 32) trigger];
    v23[1] = v12;
    v23[2] = &off_1000A8FE0;
    void v22[2] = @"addFenceSuccess";
    v22[3] = @"addFenceError";
    [v9 code];
    id v13 = stringForCKErrorCode();
    void v23[3] = v13;
    uint64_t v14 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:4];
    AnalyticsSendEvent();

    uint64_t v15 = *(void *)(a1 + 56);
    uint64_t v16 = CKXPCSuitableError();
    (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v16);
  }
  else
  {
    id v17 = [v7 recordID];
    uint64_t v18 = [v17 recordName];
    [*(id *)(a1 + 32) setCkRecordName:v18];

    id v19 = [v7 recordID];
    id v20 = [v19 zoneID];
    long long v21 = [v20 ownerName];
    [*(id *)(a1 + 32) setCkRecordZoneOwnerName:v21];

    [*(id *)(a1 + 40) _addFence:*(void *)(a1 + 32) clientSession:*(void *)(a1 + 48) ckShare:v8 completion:*(void *)(a1 + 56)];
  }
}

void sub_100053724(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    long long v4 = sub_100005560();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10006D8AC();
    }

    v43[0] = @"fenceType";
    id v5 = [*(id *)(a1 + 32) type];
    v44[0] = v5;
    v43[1] = @"fenceTriggerType";
    uint64_t v6 = [*(id *)(a1 + 32) trigger];
    v44[1] = v6;
    v44[2] = &off_1000A8FE0;
    v43[2] = @"addFenceSuccess";
    v43[3] = @"addFenceError";
    id v7 = [*(id *)(a1 + 40) FMFErrorAsString:[v3 code]];
    v44[3] = v7;
    id v8 = +[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:4];
    AnalyticsSendEvent();

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v9 = [*(id *)(a1 + 48) fmf_otherParticipants];
    id v33 = [v9 countByEnumeratingWithState:&v38 objects:v42 count:16];
    id v10 = 0;
    if (v33)
    {
      id v31 = v9;
      uint64_t v32 = *(void *)v39;
      do
      {
        uint64_t v11 = 0;
        uint64_t v12 = v10;
        do
        {
          if (*(void *)v39 != v32) {
            objc_enumerationMutation(v9);
          }
          id v13 = *(void **)(*((void *)&v38 + 1) + 8 * (void)v11);
          uint64_t v14 = [v13 invitationToken];

          if (v14)
          {
            uint64_t v15 = [v13 userIdentity];
            uint64_t v16 = [v15 lookupInfo];
            id v17 = [v16 emailAddress];
            uint64_t v18 = v17;
            if (v17)
            {
              id v19 = v17;
            }
            else
            {
              [v13 userIdentity];
              v22 = uint64_t v21 = a1;
              uint64_t v23 = [v22 lookupInfo];
              id v19 = [v23 phoneNumber];

              a1 = v21;
              id v9 = v31;
            }

            id v24 = [*(id *)(a1 + 48) URL];
            id v25 = [v13 invitationToken];
            long long v26 = [*(id *)(a1 + 32) ckRecordName];
            id v37 = 0;
            +[FMFCloudKitManager sendShareURL:v24 andInvitationToken:v25 recordName:v26 toDestinationID:v19 error:&v37];
            id v20 = v37;
          }
          else
          {
            id v20 = 0;
          }
          if (v12) {
            long long v27 = v12;
          }
          else {
            long long v27 = v20;
          }
          id v10 = v27;

          uint64_t v11 = (char *)v11 + 1;
          uint64_t v12 = v10;
        }
        while (v33 != v11);
        id v33 = [v9 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v33);
    }

    uint64_t v28 = *(void **)(a1 + 32);
    __int16 v29 = *(void **)(a1 + 40);
    uint64_t v30 = *(void *)(a1 + 56);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100053B14;
    v34[3] = &unk_1000A20B0;
    id v35 = v28;
    id v36 = *(id *)(a1 + 64);
    [v29 triggerRepeatedFence:v35 clientSesssion:v30 afterAccpetanceWithCompletion:v34];

    id v3 = 0;
  }
}

void sub_100053B14(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    long long v4 = sub_100005560();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10006D920();
    }
  }
  v8[0] = @"fenceType";
  id v5 = [*(id *)(a1 + 32) type];
  v9[0] = v5;
  v8[1] = @"fenceTriggerType";
  uint64_t v6 = [*(id *)(a1 + 32) trigger];
  v8[2] = @"addFenceSuccess";
  v9[1] = v6;
  void v9[2] = &off_1000A8FF8;
  id v7 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];
  AnalyticsSendEvent();

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10005409C(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v5 = a2;
  long long v4 = [v3 fenceManager];
  [v4 clearStaleFenceTriggerForFence:a1[5]];

  (*(void (**)(void))(a1[6] + 16))();
}

void sub_1000542D4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = sub_100005560();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10006DA0C();
    }

    v12[0] = @"fenceType";
    uint64_t v6 = [*(id *)(a1 + 32) type];
    v13[0] = v6;
    v12[1] = @"fenceTriggerType";
    id v7 = [*(id *)(a1 + 32) trigger];
    v13[1] = v7;
    v13[2] = &off_1000A8FE0;
    v12[2] = @"removeFenceSuccess";
    v12[3] = @"removeFenceError";
    [v4 code];
    id v8 = stringForCKErrorCode();
    v13[3] = v8;
    id v9 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:4];
    AnalyticsSendEvent();

    uint64_t v10 = *(void *)(a1 + 56);
    uint64_t v11 = CKXPCSuitableError();
    (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v11);
  }
  else
  {
    [*(id *)(a1 + 40) _removeFence:*(void *)(a1 + 32) clientSession:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
}

void sub_100054568(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = sub_100005560();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10006DA80();
    }

    v22[0] = @"fenceType";
    id v5 = [*(id *)(a1 + 32) type];
    v23[0] = v5;
    v22[1] = @"fenceTriggerType";
    uint64_t v6 = [*(id *)(a1 + 32) trigger];
    v23[1] = v6;
    v23[2] = &off_1000A8FE0;
    void v22[2] = @"removeFenceSuccess";
    v22[3] = @"removeFenceError";
    id v7 = [[*(id *)(a1 + 40) FMFErrorAsString:[v3 code]];
    void v23[3] = v7;
    id v8 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:4];
    AnalyticsSendEvent();

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    v20[0] = @"fenceType";
    id v9 = [*(id *)(a1 + 32) type];
    v21[0] = v9;
    v20[1] = @"fenceTriggerType";
    uint64_t v10 = [*(id *)(a1 + 32) trigger];
    v21[1] = v10;
    void v21[2] = &off_1000A8FF8;
    v20[2] = @"removeFenceSuccess";
    v20[3] = @"removeFenceError";
    v21[3] = @"None";
    uint64_t v11 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:4];
    AnalyticsSendEvent();

    uint64_t v12 = [*(id *)(a1 + 40) fenceManager];
    id v13 = [*(id *)(a1 + 32) identifier];
    [v12 clearStaleStatusForRemovedFenceID:v13];

    if ([*(id *)(a1 + 32) isOnMe])
    {
      uint64_t v14 = +[FMFCloudKitManager sharedInstance];
      uint64_t v15 = [*(id *)(a1 + 32) ckRecordID];
      uint64_t v16 = [v14 recordWithID:v15 inScope:3];
      id v17 = [v16 recordID];
    }
    else
    {
      id v17 = 0;
    }
    uint64_t v18 = [*(id *)(a1 + 40) fenceManager];
    id v19 = [*(id *)(a1 + 32) identifier];
    [v18 informParticipantOfRemovedFenceWithID:v19 ckRecordID:v17];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_10005497C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = sub_100005560();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_10006DAF4((uint64_t)v4, a1, v5);
  }
}

void sub_100054B2C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = sub_100005560();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10006DB90((uint64_t)v4, a1, v5);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100054D54(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v5 = +[FMFCloudKitManager sharedInstance];
    uint64_t v6 = [*(id *)(a1 + 32) recipients];
    [v5 updateRecord:v7 inZoneSharedWith:v6 inDatabaseWithScope:2 withCompletion:*(void *)(a1 + 40)];
  }
}

void sub_100054ED0(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (!v6 || a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v5 = [objc_alloc((Class)CKRecord) initWithRecordType:@"Fence" recordID:v6];
    [v5 updateFromFence:*(void *)(a1 + 32)];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

FMFFence *__cdecl sub_10005530C(id a1, FMFFence *a2)
{
  id v2 = a2;
  id v3 = [(FMFFence *)v2 ckRecordID];
  if ([(FMFFence *)v2 isFromMe]) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 3;
  }
  id v5 = +[FMFCloudKitManager sharedInstance];
  id v6 = [v5 recordWithID:v3 inScope:v4];

  if (v6) {
    id v7 = 0;
  }
  else {
    id v7 = v2;
  }

  return v7;
}

id sub_1000553B8(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) updatedFenceForFence:a2];
}

void sub_100055F58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = sub_100005560();
  id v6 = v5;
  if (a3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10006DD3C(a1, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    int v14 = 136315394;
    uint64_t v15 = "-[FMFFenceSequencer removeUnrecoverableManateeFences:withCompletion:]_block_invoke";
    __int16 v16 = 2112;
    uint64_t v17 = v13;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: Fence removed successfully due to loss of keychain. Fence: %@, ", (uint8_t *)&v14, 0x16u);
  }
}

void sub_100056108(uint64_t a1)
{
  id v2 = sub_100005560();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v7 = "-[FMFFenceSequencer handleIdentityLossWithCompletion:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s: Completed removal of unrecoverable manatee fences.", buf, 0xCu);
  }

  id v3 = +[FMFCloudKitManager sharedInstance];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100056230;
  v4[3] = &unk_1000A1950;
  id v5 = *(id *)(a1 + 32);
  [v3 removeAllFenceRecordZonesWithCompletion:v4];
}

void sub_100056230(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100005560();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v11 = 136315394;
      uint64_t v12 = "-[FMFFenceSequencer handleIdentityLossWithCompletion:]_block_invoke";
      __int16 v13 = 2112;
      id v14 = v3;
      id v6 = "%s: Completed removal of all record zones with error: %@";
      uint64_t v7 = v4;
      uint32_t v8 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v11, v8);
    }
  }
  else if (v5)
  {
    int v11 = 136315138;
    uint64_t v12 = "-[FMFFenceSequencer handleIdentityLossWithCompletion:]_block_invoke";
    id v6 = "%s: Successfully ompleted removal of all record zones";
    uint64_t v7 = v4;
    uint32_t v8 = 12;
    goto LABEL_6;
  }

  uint64_t v9 = +[FMFCloudKitManager sharedInstance];
  [v9 bootstrapAccountWithReason:3];

  (*(void (**)(void, id, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v3, v10);
}

id sub_1000574EC()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000690F4(v0, qword_1000BB898);
  sub_100068F9C(v0, (uint64_t)qword_1000BB898);
  id result = sub_100005560();
  if (result) {
    return (id)Logger.init(_:)();
  }
  __break(1u);
  return result;
}

id sub_100057550()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for FindMyLocateShims()) init];
  qword_1000BBFE0 = (uint64_t)result;
  return result;
}

uint64_t *sub_100057580()
{
  if (qword_1000BB8B0 != -1) {
    swift_once();
  }
  return &qword_1000BBFE0;
}

id sub_1000575CC()
{
  if (qword_1000BB8B0 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_1000BBFE0;

  return v0;
}

id sub_100057684()
{
  sub_100059F80(&qword_1000BB300);
  ((void (*)(void))__chkstk_darwin)();
  id v2 = (char *)&v28 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = type metadata accessor for ClientOrigin();
  uint64_t v3 = *(void *)(v31 - 8);
  ((void (*)(void))__chkstk_darwin)();
  BOOL v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for RequestOrigin();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v28 - v11;
  __int16 v13 = self;
  id v14 = v0;
  id v15 = [v13 mainBundle];
  id v16 = [v15 bundleIdentifier];

  if (!v16) {
    goto LABEL_6;
  }
  uint64_t v29 = v6;
  uint64_t v30 = v2;
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v19 = v18;

  uint64_t v34 = v17;
  uint64_t v35 = v19;
  unint64_t v32 = 0xD000000000000013;
  unint64_t v33 = 0x8000000100098D40;
  sub_100068F00();
  if ((StringProtocol.contains<A>(_:)() & 1) == 0)
  {
    uint64_t v34 = v17;
    uint64_t v35 = v19;
    unint64_t v32 = 0xD000000000000012;
    unint64_t v33 = 0x8000000100098D60;
    char v21 = StringProtocol.contains<A>(_:)();
    swift_bridgeObjectRelease();
    uint64_t v6 = v29;
    id v2 = v30;
    if (v21)
    {
      id v20 = (unsigned int *)&enum case for ClientOrigin.messagesApp(_:);
      goto LABEL_7;
    }
LABEL_6:
    id v20 = (unsigned int *)&enum case for ClientOrigin.other(_:);
    goto LABEL_7;
  }
  swift_bridgeObjectRelease();
  id v20 = (unsigned int *)&enum case for ClientOrigin.messagesApp(_:);
  uint64_t v6 = v29;
  id v2 = v30;
LABEL_7:
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *v20, v31);
  RequestOrigin.init(_:)();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
  type metadata accessor for Session();
  swift_allocObject();
  *(void *)&v14[OBJC_IVAR____TtC4fmfd17FindMyLocateShims_session] = Session.init(_:)();

  Shims = (objc_class *)type metadata accessor for FindMyLocateShims();
  v36.receiver = v14;
  v36.super_class = Shims;
  id v23 = [super init];
  uint64_t v24 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v2, 1, 1, v24);
  id v25 = (void *)swift_allocObject();
  v25[2] = 0;
  v25[3] = 0;
  void v25[4] = v23;
  id v26 = v23;
  sub_100059C84((uint64_t)v2, (uint64_t)&unk_1000BB400, (uint64_t)v25);
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  return v26;
}

uint64_t sub_100057A94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[12] = a4;
  uint64_t v5 = type metadata accessor for Fence();
  v4[13] = v5;
  v4[14] = *(void *)(v5 - 8);
  v4[15] = swift_task_alloc();
  uint64_t updated = type metadata accessor for Fence.UpdateStream.Snapshot();
  uint8_t v4[16] = updated;
  v4[17] = *(void *)(updated - 8);
  v4[18] = swift_task_alloc();
  sub_100059F80(&qword_1000BB410);
  v4[19] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for Fence.UpdateStream.AsyncIterator();
  v4[20] = v7;
  v4[21] = *(void *)(v7 - 8);
  v4[22] = swift_task_alloc();
  return _swift_task_switch(sub_100057C3C, 0, 0);
}

uint64_t sub_100057C3C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 184) = v1;
  void *v1 = v0;
  v1[1] = sub_100057CDC;
  return Session.fenceUpdateStream()();
}

uint64_t sub_100057CDC(uint64_t a1)
{
  *(void *)(*(void *)v1 + 192) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_100057DDC, 0, 0);
}

uint64_t sub_100057DDC()
{
  Fence.UpdateStream.makeAsyncIterator()();
  uint64_t v1 = sub_100068F54(&qword_1000BB418, (void (*)(uint64_t))&type metadata accessor for Fence.UpdateStream.AsyncIterator);
  id v2 = (void *)swift_task_alloc();
  v0[25] = v2;
  void *v2 = v0;
  v2[1] = sub_100057EC0;
  uint64_t v3 = v0[19];
  uint64_t v4 = v0[20];
  return dispatch thunk of AsyncIteratorProtocol.next()(v3, v4, v1);
}

uint64_t sub_100057EC0()
{
  *(void *)(*(void *)v1 + 208) = v0;
  swift_task_dealloc();
  if (v0) {
    id v2 = sub_1000587B8;
  }
  else {
    id v2 = sub_100057FD4;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100057FD4()
{
  long long v55 = v0;
  uint64_t v1 = v0[19];
  uint64_t v2 = v0[16];
  uint64_t v3 = v0[17];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) != 1)
  {
    (*(void (**)(void, uint64_t, uint64_t))(v3 + 32))(v0[18], v1, v2);
    id v4 = [self sharedInstance];
    if (v4)
    {
      uint64_t v5 = v4;
      id v6 = [v4 delegate];
      if (v6)
      {
        long long v49 = v6;
        uint64_t updated = Fence.UpdateStream.Snapshot.fences.getter();
        unint64_t v8 = (unint64_t)_swiftEmptyArrayStorage;
        v0[9] = _swiftEmptyArrayStorage;
        uint64_t v9 = *(void *)(updated + 16);
        if (v9)
        {
          long long v48 = v5;
          uint64_t v10 = v0 + 9;
          long long v51 = v0 + 11;
          uint64_t v11 = v0[14];
          unint64_t v12 = updated + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
          uint64_t v13 = *(void *)(v11 + 72);
          id v14 = *(void (**)(void, void, void))(v11 + 16);
          uint64_t v15 = v0[26];
          swift_bridgeObjectRetain();
          long long v52 = v0 + 9;
          long long v53 = v0;
          long long v50 = v14;
          do
          {
            v14(v0[15], v12, v0[13]);
            sub_10005883C();
            if (v15)
            {
              if (qword_1000BB890 != -1) {
                swift_once();
              }
              uint64_t v16 = type metadata accessor for Logger();
              sub_100068F9C(v16, (uint64_t)qword_1000BB898);
              swift_errorRetain();
              swift_errorRetain();
              uint64_t v17 = Logger.logObject.getter();
              os_log_type_t v18 = static os_log_type_t.info.getter();
              if (os_log_type_enabled(v17, v18))
              {
                uint64_t v19 = (uint8_t *)swift_slowAlloc();
                id v20 = (void *)swift_slowAlloc();
                *(_DWORD *)uint64_t v19 = 138412290;
                swift_errorRetain();
                uint64_t v21 = v13;
                uint64_t v22 = _swift_stdlib_bridgeErrorToNSError();
                *long long v51 = v22;
                UnsafeMutableRawBufferPointer.copyMemory(from:)();
                *id v20 = v22;
                uint64_t v13 = v21;
                swift_errorRelease();
                swift_errorRelease();
                _os_log_impl((void *)&_mh_execute_header, v17, v18, "Failed to convert to FMFFence: %@", v19, 0xCu);
                sub_100059F80(&qword_1000BB488);
                swift_arrayDestroy();
                uint64_t v10 = v52;
                swift_slowDealloc();
                id v14 = v50;
                uint64_t v0 = v53;
                swift_slowDealloc();
                swift_errorRelease();
              }
              else
              {
                swift_errorRelease();

                swift_errorRelease();
                swift_errorRelease();
              }
              (*(void (**)(void, void))(v0[14] + 8))(v0[15], v0[13]);
            }
            else
            {
              (*(void (**)(void, void))(v0[14] + 8))(v0[15], v0[13]);
              specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
              if (*(void *)((v0[9] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v0[9] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
              }
              specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
              specialized Array._endMutation()();
            }
            uint64_t v15 = 0;
            v12 += v13;
            --v9;
          }
          while (v9);
          swift_bridgeObjectRelease();
          unint64_t v8 = *v10;
          uint64_t v5 = v48;
        }
        id v23 = v0 + 10;
        swift_bridgeObjectRelease();
        if (v8 >> 62)
        {
          swift_bridgeObjectRetain();
          _CocoaArrayWrapper.endIndex.getter();
          swift_bridgeObjectRelease();
        }
        sub_100068ADC(0, &qword_1000BB3D0);
        sub_100068B18();
        uint64_t v24 = Set.init(minimumCapacity:)();
        *id v23 = v24;
        if (v8 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v27 = _CocoaArrayWrapper.endIndex.getter();
          uint64_t v24 = swift_bridgeObjectRelease();
          if (!v27) {
            goto LABEL_37;
          }
        }
        else
        {
          uint64_t v27 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
          if (!v27) {
            goto LABEL_37;
          }
        }
        if (v27 < 1)
        {
          __break(1u);
          return dispatch thunk of AsyncIteratorProtocol.next()(v24, v25, v26);
        }
        if ((v8 & 0xC000000000000001) != 0)
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            id v37 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)();
            sub_100063918(v54, v37);
          }
        }
        else
        {
          for (uint64_t j = 0; j != v27; ++j)
          {
            long long v39 = *(void **)(v8 + 8 * j + 32);
            sub_100063918(v54, v39);
          }
        }
LABEL_37:
        swift_bridgeObjectRelease();
        uint64_t v40 = *v23;
        id v41 = [v5 delegateQueue];
        if (v41)
        {
          uint64_t v42 = v41;
          uint64_t v43 = swift_allocObject();
          *(void *)(v43 + 16) = v49;
          *(void *)(v43 + 24) = v40;
          v0[6] = sub_100069014;
          v0[7] = v43;
          v0[2] = _NSConcreteStackBlock;
          v0[3] = 1107296256;
          v0[4] = sub_100059C40;
          v0[5] = &unk_1000A36D8;
          id v44 = _Block_copy(v0 + 2);
          swift_unknownObjectRetain();
          swift_release();
          [v42 addOperationWithBlock:v44];
          _Block_release(v44);

          swift_unknownObjectRelease();
        }
        else
        {
          if (([v49 respondsToSelector:"didUpdateFences:"] & 1) == 0)
          {

            swift_bridgeObjectRelease();
            swift_unknownObjectRelease();
LABEL_42:
            (*(void (**)(void, void))(v0[17] + 8))(v0[18], v0[16]);
            uint64_t v46 = sub_100068F54(&qword_1000BB418, (void (*)(uint64_t))&type metadata accessor for Fence.UpdateStream.AsyncIterator);
            id v47 = (void *)swift_task_alloc();
            v0[25] = v47;
            *id v47 = v0;
            v47[1] = sub_100057EC0;
            uint64_t v24 = v0[19];
            uint64_t v25 = v0[20];
            uint64_t v26 = v46;
            return dispatch thunk of AsyncIteratorProtocol.next()(v24, v25, v26);
          }
          swift_unknownObjectRetain();
          Class isa = Set._bridgeToObjectiveC()().super.isa;
          [v49 didUpdateFences:isa];

          swift_bridgeObjectRelease();
          swift_unknownObjectRelease_n();
        }

        goto LABEL_42;
      }
    }
    uint64_t v29 = v0[21];
    uint64_t v28 = v0[22];
    uint64_t v30 = v0[20];
    uint64_t v32 = v0[17];
    uint64_t v31 = v0[18];
    uint64_t v33 = v0[16];
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v31, v33);
    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v28, v30);
    goto LABEL_26;
  }
  (*(void (**)(void, void))(v0[21] + 8))(v0[22], v0[20]);
  swift_release();
LABEL_26:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v34 = (uint64_t (*)(void))v0[1];
  return v34();
}

uint64_t sub_1000587B8()
{
  *(void *)(v0 + 64) = *(void *)(v0 + 208);
  sub_100059F80(&qword_1000BB420);
  uint64_t v1 = swift_dynamicCast();
  return _swift_willThrowTypedImpl(v1, &type metadata for Never, &protocol witness table for Never);
}

id sub_10005883C()
{
  uint64_t v1 = v0;
  uint64_t v140 = type metadata accessor for Fence.Participant();
  uint64_t v139 = *(void *)(v140 - 8);
  uint64_t v2 = __chkstk_darwin(v140);
  v138 = (char *)&v131 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  v137 = (char *)&v131 - v4;
  uint64_t v5 = sub_100059F80(&qword_1000BB368);
  __chkstk_darwin(v5 - 8);
  v136 = (char *)&v131 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v135 = type metadata accessor for PlaceMark();
  uint64_t v134 = *(void *)(v135 - 8);
  __chkstk_darwin(v135);
  v141 = (char *)&v131 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v144 = type metadata accessor for Date();
  uint64_t v142 = *(void *)(v144 - 8);
  __chkstk_darwin(v144);
  v143 = (char *)&v131 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Fence.MonitorRegion.Source();
  uint64_t v146 = *(void *)(v9 - 8);
  uint64_t v147 = v9;
  __chkstk_darwin(v9);
  v149 = (char *)&v131 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v148 = type metadata accessor for Fence.MonitorRegion();
  uint64_t v150 = *(void *)(v148 - 8);
  uint64_t v11 = __chkstk_darwin(v148);
  v133 = (char *)&v131 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v11);
  v132 = (char *)&v131 - v14;
  __chkstk_darwin(v13);
  v145 = (char *)&v131 - v15;
  uint64_t v16 = type metadata accessor for Fence.AcceptanceStatus();
  uint64_t v154 = *(void *)(v16 - 8);
  uint64_t v155 = v16;
  uint64_t v17 = __chkstk_darwin(v16);
  v152 = (char *)&v131 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  v153 = (char *)&v131 - v19;
  uint64_t v20 = type metadata accessor for Fence.Variant();
  uint64_t v158 = *(void *)(v20 - 8);
  uint64_t v159 = v20;
  uint64_t v21 = __chkstk_darwin(v20);
  v151 = (char *)&v131 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __chkstk_darwin(v21);
  v156 = (char *)&v131 - v24;
  uint64_t v25 = __chkstk_darwin(v23);
  v160 = (char *)&v131 - v26;
  __chkstk_darwin(v25);
  uint64_t v28 = (char *)&v131 - v27;
  v161 = (void *)type metadata accessor for UUID();
  uint64_t v29 = *(v161 - 1);
  __chkstk_darwin(v161);
  uint64_t v31 = (char *)&v131 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = type metadata accessor for Fence.ID();
  uint64_t v33 = *(void *)(v32 - 8);
  __chkstk_darwin(v32);
  uint64_t v35 = (char *)&v131 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v36 = [objc_allocWithZone((Class)FMFFence) init];
  Fence.id.getter();
  Fence.ID.id.getter();
  uint64_t v37 = v32;
  long long v38 = v28;
  (*(void (**)(char *, uint64_t))(v33 + 8))(v35, v37);
  uint64_t v39 = v158;
  uint64_t v40 = v159;
  UUID.uuidString.getter();
  (*(void (**)(char *, void *))(v29 + 8))(v31, v161);
  String.lowercased()();
  swift_bridgeObjectRelease();
  NSString v41 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v36 setIdentifier:v41];

  [v36 setActive:1];
  Fence.label.getter();
  NSString v42 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  v161 = v36;
  [v36 setLabel:v42];

  Fence.variant.getter();
  uint64_t v43 = *(void (**)(char *, char *, uint64_t))(v39 + 16);
  id v44 = v160;
  v43(v160, v38, v40);
  uint64_t v45 = v44;
  int v46 = (*(uint64_t (**)(char *, uint64_t))(v39 + 88))(v44, v40);
  if (v46 != enum case for Fence.Variant.oneTime(_:)
    && v46 != enum case for Fence.Variant.recurring(_:)
    && v46 != enum case for Fence.Variant.scheduled(_:))
  {
    _s5ErrorOMa();
    sub_1000691A4();
    swift_allocError();
    v43(v47, v38, v40);
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    long long v48 = *(void (**)(char *, uint64_t))(v39 + 8);
    v48(v44, v40);
    v48(v38, v40);
    id v49 = v161;
LABEL_39:

    return v49;
  }
  BOOL v50 = v46 != enum case for Fence.Variant.oneTime(_:);
  long long v51 = *(void (**)(char *, uint64_t))(v39 + 8);
  v51(v45, v40);
  v51(v38, v40);
  id v49 = v161;
  [v161 setRecurring:v50];
  long long v52 = v156;
  Fence.variant.getter();
  id v53 = v157;
  id v54 = sub_10006141C();
  if (v53)
  {
    v51(v52, v40);
    goto LABEL_39;
  }
  long long v55 = v54;
  v51(v52, v40);
  [v49 setTrigger:v55];

  uint64_t v56 = v151;
  Fence.variant.getter();
  id v57 = sub_100061820();
  v51(v56, v40);
  [v49 setSchedule:v57];

  long long v58 = v153;
  Fence.acceptanceStatus.getter();
  uint64_t v59 = v154;
  long long v60 = *(void (**)(char *, char *, uint64_t))(v154 + 16);
  long long v61 = v152;
  long long v62 = v58;
  uint64_t v63 = v155;
  v60(v152, v62, v155);
  int v64 = (*(uint64_t (**)(char *, uint64_t))(v59 + 88))(v61, v63);
  if (v64 == enum case for Fence.AcceptanceStatus.pendingHidden(_:))
  {
    v65 = (id *)&FMFFenceAcceptanceStatusPendingHidden;
LABEL_11:
    uint64_t v67 = v149;
    uint64_t v66 = v150;
    goto LABEL_12;
  }
  if (v64 == enum case for Fence.AcceptanceStatus.pending(_:))
  {
    v65 = (id *)&FMFFenceAcceptanceStatusPending;
    goto LABEL_11;
  }
  uint64_t v67 = v149;
  uint64_t v66 = v150;
  if (v64 != enum case for Fence.AcceptanceStatus.accepted(_:))
  {
    _s5ErrorOMa();
    sub_1000691A4();
    swift_allocError();
    v126 = v153;
    uint64_t v127 = v155;
    v60(v128, v153, v155);
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    v129 = *(void (**)(char *, uint64_t))(v154 + 8);
    v129(v152, v127);
    v129(v126, v127);
    goto LABEL_39;
  }
  v65 = (id *)&FMFFenceAcceptanceStatusAccepted;
LABEL_12:
  v68 = *(void (**)(char *, uint64_t))(v154 + 8);
  id v69 = *v65;
  v68(v153, v155);
  [v49 setAcceptanceStatus:v69];

  v70 = v145;
  Fence.region.getter();
  Fence.MonitorRegion.source.getter();
  v71 = *(void (**)(char *, uint64_t))(v66 + 8);
  uint64_t v72 = v148;
  v71(v70, v148);
  uint64_t v73 = sub_100061D34();
  uint64_t v158 = 0;
  (*(void (**)(char *, uint64_t))(v146 + 8))(v67, v147);
  [v49 setLocationType:v73];
  v74 = v132;
  Fence.region.getter();
  Fence.MonitorRegion.center.getter();
  double v76 = v75;
  double v78 = v77;
  v71(v74, v72);
  v79 = v133;
  Fence.region.getter();
  Fence.MonitorRegion.radius.getter();
  double v81 = v80;
  v71(v79, v72);
  v82 = v143;
  static Date.now.getter();
  id v83 = objc_allocWithZone((Class)CLLocation);
  Class isa = Date._bridgeToObjectiveC()().super.isa;
  id v85 = [v83 initWithCoordinate:isa verticalAccuracy:v76 horizontalAccuracy:v78 altitude:v78 timestamp:v81];

  v86 = *(char **)(v142 + 8);
  v160 = (char *)(v142 + 8);
  v151 = v86;
  ((void (*)(char *, uint64_t))v86)(v82, v144);
  [v49 setLocation:v85];

  uint64_t v159 = v1;
  Fence.placemark.getter();
  uint64_t v87 = PlaceMark.locality.getter();
  if (v88) {
    v89 = (char *)v87;
  }
  else {
    v89 = 0;
  }
  v152 = v89;
  PlaceMark.administrativeArea.getter();
  uint64_t v90 = PlaceMark.country.getter();
  if (v91) {
    v92 = (char *)v90;
  }
  else {
    v92 = 0;
  }
  v153 = v92;
  uint64_t v93 = PlaceMark.stateCode.getter();
  if (v94) {
    uint64_t v95 = v93;
  }
  else {
    uint64_t v95 = 0;
  }
  uint64_t v154 = v95;
  uint64_t v96 = PlaceMark.streetAddress.getter();
  if (v97) {
    uint64_t v98 = v96;
  }
  else {
    uint64_t v98 = 0;
  }
  uint64_t v155 = v98;
  uint64_t v99 = PlaceMark.streetName.getter();
  if (v100) {
    v101 = (char *)v99;
  }
  else {
    v101 = 0;
  }
  v156 = v101;
  id v157 = objc_allocWithZone((Class)FMFPlacemark);
  NSString v102 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  NSString v103 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  NSString v104 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  NSString v105 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  NSString v106 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  NSString v107 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v108 = [v157 initWithLocality:v102 administrativeArea:v103 country:v104 state:v105 streetAddress:v106 streetName:v107];

  uint64_t v109 = PlaceMark.formattedAddressLines.getter();
  Class v110 = (Class)v109;
  if (v109)
  {
    sub_100062740(v109);
    swift_bridgeObjectRelease();
    Class v110 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  v111 = v136;
  [v108 setFormattedAddressLines:v110];

  (*(void (**)(char *, uint64_t))(v134 + 8))(v141, v135);
  id v49 = v161;
  [v161 setPlacemark:v108];

  Fence.muteEndDate.getter();
  uint64_t v112 = v144;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v142 + 48))(v111, 1, v144) == 1)
  {
    Class v113 = 0;
    v114 = (void (*)(char *, uint64_t))v151;
  }
  else
  {
    Class v113 = Date._bridgeToObjectiveC()().super.isa;
    v114 = (void (*)(char *, uint64_t))v151;
    ((void (*)(char *, uint64_t))v151)(v111, v112);
  }
  [v49 setMuteEndDate:v113];

  v115 = v137;
  Fence.finder.getter();
  v116 = v138;
  Fence.createdBy.getter();
  char v117 = static Fence.Participant.== infix(_:_:)();
  v118 = *(void (**)(char *, uint64_t))(v139 + 8);
  v119 = v116;
  uint64_t v120 = v140;
  v118(v119, v140);
  v118(v115, v120);
  v121 = (id *)&FMFFenceTypeNotifyMe;
  if ((v117 & 1) == 0) {
    v121 = (id *)&FMFFenceTypeNotifyOther;
  }
  id v122 = *v121;
  [v49 setType:v122];

  v123 = v143;
  Fence.updatedAt.getter();
  Class v124 = Date._bridgeToObjectiveC()().super.isa;
  v114(v123, v112);
  [v49 setTimestamp:v124];

  uint64_t v125 = v158;
  sub_100061F88(v49);
  if (v125) {
    goto LABEL_39;
  }
  return v49;
}

id sub_100059884(uint64_t a1)
{
  id result = &_swiftEmptyArrayStorage;
  uint64_t v4 = *(void *)(a1 + 16);
  if (v4)
  {
    uint64_t v15 = v1;
    uint64_t v5 = *(void *)(type metadata accessor for PersonHandle() - 8);
    uint64_t v6 = a1 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    swift_bridgeObjectRetain();
    uint64_t v7 = self;
    uint64_t v8 = *(void *)(v5 + 72);
    while (1)
    {
      id result = [v7 sharedInstance:v15];
      if (!result) {
        break;
      }
      uint64_t v9 = result;
      PersonHandle.id.getter();
      NSString v10 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      id v11 = [v9 followerHandleForIdentifier:v10];

      if (!v11)
      {
        _s5ErrorOMa();
        sub_1000691A4();
        swift_allocError();
        uint64_t v13 = v12;
        uint64_t *v12 = PersonHandle.id.getter();
        v13[1] = v14;
        swift_storeEnumTagMultiPayload();
        swift_willThrow();
        swift_bridgeObjectRelease();
        return (id)swift_bridgeObjectRelease();
      }
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      if (*(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
      v6 += v8;
      if (!--v4)
      {
        swift_bridgeObjectRelease();
        return &_swiftEmptyArrayStorage;
      }
    }
    __break(1u);
  }
  return result;
}

char *sub_100059AA0(unint64_t a1, SEL *a2)
{
  if (a1 >> 62) {
    goto LABEL_17;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = _CocoaArrayWrapper.endIndex.getter())
  {
    uint64_t v4 = (char *)&_swiftEmptyArrayStorage;
    uint64_t v5 = 4;
    while (1)
    {
      id v6 = (a1 & 0xC000000000000001) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
         : *(id *)(a1 + 8 * v5);
      uint64_t v7 = v6;
      uint64_t v8 = v5 - 3;
      if (__OFADD__(v5 - 4, 1)) {
        break;
      }
      id v9 = [v6 *a2];
      if (v9)
      {
        NSString v10 = v9;
        uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v13 = v12;

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v4 = sub_100062F48(0, *((void *)v4 + 2) + 1, 1, v4);
        }
        unint64_t v15 = *((void *)v4 + 2);
        unint64_t v14 = *((void *)v4 + 3);
        if (v15 >= v14 >> 1) {
          uint64_t v4 = sub_100062F48((char *)(v14 > 1), v15 + 1, 1, v4);
        }
        *((void *)v4 + 2) = v15 + 1;
        uint64_t v16 = &v4[16 * v15];
        *((void *)v16 + 4) = v11;
        *((void *)v16 + 5) = v13;
      }
      else
      {
      }
      ++v5;
      if (v8 == v3) {
        goto LABEL_19;
      }
    }
    __break(1u);
LABEL_17:
    swift_bridgeObjectRetain();
  }
  uint64_t v4 = (char *)&_swiftEmptyArrayStorage;
LABEL_19:
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_100059C40(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_100059C84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100069390(a1, &qword_1000BB300);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100059E64(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_100059F80(&qword_1000BB300);
  __chkstk_darwin(v7 - 8);
  id v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  void v11[4] = a1;
  v11[5] = v3;
  v11[6] = a2;
  v11[7] = a3;
  id v12 = a1;
  id v13 = v3;
  swift_retain();
  sub_100059C84((uint64_t)v9, (uint64_t)&unk_1000BB310, (uint64_t)v11);
  return swift_release();
}

uint64_t sub_100059F80(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100059FC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[5] = a6;
  v7[6] = a7;
  v7[3] = a4;
  void v7[4] = a5;
  uint64_t v8 = type metadata accessor for UUID();
  v7[7] = v8;
  v7[8] = *(void *)(v8 - 8);
  v7[9] = swift_task_alloc();
  v7[10] = swift_task_alloc();
  sub_100059F80(&qword_1000BB4E8);
  v7[11] = swift_task_alloc();
  uint64_t v9 = type metadata accessor for Fence.ID();
  v7[12] = v9;
  v7[13] = *(void *)(v9 - 8);
  v7[14] = swift_task_alloc();
  uint64_t v10 = type metadata accessor for Fence();
  v7[15] = v10;
  v7[16] = *(void *)(v10 - 8);
  v7[17] = swift_task_alloc();
  v7[18] = swift_task_alloc();
  v7[19] = swift_task_alloc();
  v7[20] = swift_task_alloc();
  v7[21] = swift_task_alloc();
  return _swift_task_switch(sub_10005A1B4, 0, 0);
}

uint64_t sub_10005A1B4()
{
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v2 = *(void *)(v0 + 104);
  uint64_t v3 = *(void *)(v0 + 88);
  id v4 = [*(id *)(v0 + 24) identifier];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  Fence.ID.init(string:)();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_100069390(*(void *)(v0 + 88), &qword_1000BB4E8);
LABEL_5:
    sub_10005B4F4(*(id *)(v0 + 24), *(void *)(v0 + 136));
    uint64_t v11 = (void *)swift_task_alloc();
    *(void *)(v0 + 232) = v11;
    *uint64_t v11 = v0;
    v11[1] = sub_10005AC40;
    uint64_t v13 = *(void *)(v0 + 136);
    uint64_t v12 = *(void *)(v0 + 144);
    return Session.addFence(_:)(v12, v13);
  }
  uint64_t v6 = *(void *)(v0 + 72);
  uint64_t v5 = *(void *)(v0 + 80);
  uint64_t v7 = *(void *)(v0 + 56);
  uint64_t v8 = *(void *)(v0 + 64);
  (*(void (**)(void, void, void))(*(void *)(v0 + 104) + 32))(*(void *)(v0 + 112), *(void *)(v0 + 88), *(void *)(v0 + 96));
  Fence.ID.id.getter();
  static UUID.nilUUID.getter();
  sub_100068F54(&qword_1000BB4F0, (void (*)(uint64_t))&type metadata accessor for UUID);
  char v9 = dispatch thunk of static Equatable.== infix(_:_:)();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  v10(v6, v7);
  v10(v5, v7);
  if (v9)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 104) + 8))(*(void *)(v0 + 112), *(void *)(v0 + 96));
    goto LABEL_5;
  }
  *(void *)(v0 + 176) = *(void *)(*(void *)(v0 + 32) + OBJC_IVAR____TtC4fmfd17FindMyLocateShims_session);
  unint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v0 + 184) = v14;
  *unint64_t v14 = v0;
  v14[1] = sub_10005A530;
  return Session.fences()();
}

uint64_t sub_10005A530(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 192) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_10005AF38;
  }
  else
  {
    *(void *)(v4 + 200) = a1;
    uint64_t v5 = sub_10005A658;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_10005A658()
{
  uint64_t v1 = *(void *)(v0 + 192);
  uint64_t v2 = *(void *)(v0 + 112);
  uint64_t v3 = sub_10005B30C(*(void *)(v0 + 200));
  swift_bridgeObjectRelease();
  uint64_t v4 = swift_task_alloc();
  *(void *)(v4 + 16) = v2;
  LOBYTE(v2) = sub_100065374((uint64_t (*)(char *))sub_100069300, v4, (uint64_t)v3);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  if ((v2 & 1) == 0)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 104) + 8))(*(void *)(v0 + 112), *(void *)(v0 + 96));
    sub_10005B4F4(*(id *)(v0 + 24), *(void *)(v0 + 136));
    if (!v1)
    {
      uint64_t v12 = (void *)swift_task_alloc();
      *(void *)(v0 + 232) = v12;
      void *v12 = v0;
      v12[1] = sub_10005AC40;
      JUMPOUT(0x10006E260);
    }
    goto LABEL_5;
  }
  sub_10005B4F4(*(id *)(v0 + 24), *(void *)(v0 + 152));
  if (v1)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 104) + 8))(*(void *)(v0 + 112), *(void *)(v0 + 96));
LABEL_5:
    uint64_t v5 = *(void (**)(void, void *))(v0 + 40);
    uint64_t v6 = (void *)_convertErrorToNSError(_:)();
    v5(0, v6);

    swift_errorRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
    return v7();
  }
  char v9 = (void *)swift_task_alloc();
  *(void *)(v0 + 208) = v9;
  *char v9 = v0;
  v9[1] = sub_10005A934;
  uint64_t v11 = *(void *)(v0 + 152);
  uint64_t v10 = *(void *)(v0 + 160);
  return Session.updateFence(_:)(v10, v11);
}

uint64_t sub_10005A934()
{
  uint64_t v2 = (void *)*v1;
  v2[27] = v0;
  swift_task_dealloc();
  uint64_t v3 = v2[19];
  uint64_t v4 = v2[15];
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v2[16] + 8);
  if (v0)
  {
    v5(v3, v4);
    uint64_t v6 = sub_10005B04C;
  }
  else
  {
    v2[28] = v5;
    v5(v3, v4);
    uint64_t v6 = sub_10005AAAC;
  }
  return _swift_task_switch(v6, 0, 0);
}

uint64_t sub_10005AAAC()
{
  (*(void (**)(void, void))(v0[13] + 8))(v0[14], v0[12]);
  uint64_t v1 = v0[27];
  uint64_t v2 = (void (*)(uint64_t, uint64_t))v0[28];
  (*(void (**)(void, void, void))(v0[16] + 32))(v0[21], v0[20], v0[15]);
  id v3 = sub_10005883C();
  uint64_t v4 = v0[21];
  uint64_t v5 = v0[15];
  if (v1)
  {
    v2(v0[21], v0[15]);
    uint64_t v6 = (void (*)(void, void *))v0[5];
    uint64_t v7 = (void *)_convertErrorToNSError(_:)();
    v6(0, v7);

    swift_errorRelease();
  }
  else
  {
    uint64_t v8 = v3;
    ((void (*)(id, void))v0[5])(v3, 0);

    v2(v4, v5);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  char v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_10005AC40()
{
  uint64_t v2 = (void *)*v1;
  v2[30] = v0;
  swift_task_dealloc();
  uint64_t v3 = v2[17];
  uint64_t v4 = v2[15];
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v2[16] + 8);
  if (v0)
  {
    v5(v3, v4);
    uint64_t v6 = sub_10005B160;
  }
  else
  {
    v2[31] = v5;
    v5(v3, v4);
    uint64_t v6 = sub_10005ADB8;
  }
  return _swift_task_switch(v6, 0, 0);
}

uint64_t sub_10005ADB8()
{
  uint64_t v1 = v0[30];
  uint64_t v2 = (void (*)(uint64_t, uint64_t))v0[31];
  (*(void (**)(void, void, void))(v0[16] + 32))(v0[21], v0[18], v0[15]);
  id v3 = sub_10005883C();
  uint64_t v4 = v0[21];
  uint64_t v5 = v0[15];
  if (v1)
  {
    v2(v0[21], v0[15]);
    uint64_t v6 = (void (*)(void, void *))v0[5];
    uint64_t v7 = (void *)_convertErrorToNSError(_:)();
    v6(0, v7);

    swift_errorRelease();
  }
  else
  {
    uint64_t v8 = v3;
    ((void (*)(id, void))v0[5])(v3, 0);

    v2(v4, v5);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  char v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_10005AF38()
{
  (*(void (**)(void, void))(v0[13] + 8))(v0[14], v0[12]);
  uint64_t v1 = (void (*)(void, void *))v0[5];
  uint64_t v2 = (void *)_convertErrorToNSError(_:)();
  v1(0, v2);

  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_10005B04C()
{
  (*(void (**)(void, void))(v0[13] + 8))(v0[14], v0[12]);
  uint64_t v1 = (void (*)(void, void *))v0[5];
  uint64_t v2 = (void *)_convertErrorToNSError(_:)();
  v1(0, v2);

  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_10005B160()
{
  uint64_t v1 = *(void (**)(void, void *))(v0 + 40);
  uint64_t v2 = (void *)_convertErrorToNSError(_:)();
  v1(0, v2);

  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_10005B260()
{
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v5 = v0[6];
  uint64_t v4 = v0[7];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_10006A97C;
  return sub_100059FC4((uint64_t)v6, v7, v8, v2, v3, v5, v4);
}

unint64_t *sub_10005B30C(uint64_t a1)
{
  uint64_t v15 = type metadata accessor for Fence.ID();
  uint64_t v3 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (v6)
  {
    v13[1] = v1;
    uint64_t v16 = (unint64_t *)&_swiftEmptyArrayStorage;
    sub_100065D78(0, v6, 0);
    uint64_t v7 = v16;
    uint64_t v8 = *(void *)(type metadata accessor for Fence() - 8);
    uint64_t v9 = a1 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v14 = *(void *)(v8 + 72);
    do
    {
      Fence.id.getter();
      uint64_t v16 = v7;
      unint64_t v11 = v7[2];
      unint64_t v10 = v7[3];
      if (v11 >= v10 >> 1)
      {
        sub_100065D78(v10 > 1, v11 + 1, 1);
        uint64_t v7 = v16;
      }
      v7[2] = v11 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))((unint64_t)v7+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(void *)(v3 + 72) * v11, v5, v15);
      v9 += v14;
      --v6;
    }
    while (v6);
  }
  return v7;
}

void sub_10005B4F4(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for Date();
  uint64_t v166 = *(void *)(v4 - 8);
  uint64_t v5 = __chkstk_darwin(v4);
  v164 = (char *)v154 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v154 - v7;
  uint64_t v9 = sub_100059F80(&qword_1000BB350);
  __chkstk_darwin(v9 - 8);
  v177 = (char *)v154 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100059F80(&qword_1000BB368);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  v165 = (char *)v154 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v167 = (char *)v154 - v14;
  uint64_t v176 = type metadata accessor for Fence.ID();
  uint64_t v175 = *(void *)(v176 - 8);
  uint64_t v15 = __chkstk_darwin(v176);
  v174 = (char *)v154 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v178 = (char *)v154 - v17;
  uint64_t v183 = type metadata accessor for PlaceMark();
  uint64_t v182 = *(void *)(v183 - 8);
  uint64_t v18 = __chkstk_darwin(v183);
  v173 = (char *)v154 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  v184 = (char *)v154 - v20;
  uint64_t v181 = type metadata accessor for Fence.MonitorRegion();
  uint64_t v180 = *(void *)(v181 - 8);
  uint64_t v21 = __chkstk_darwin(v181);
  v172 = (char *)v154 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  v185 = (char *)v154 - v23;
  uint64_t v24 = type metadata accessor for Fence.MonitorRegion.Source();
  uint64_t v187 = *(void *)(v24 - 8);
  uint64_t v188 = v24;
  uint64_t v25 = __chkstk_darwin(v24);
  v179 = (char *)v154 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v25);
  v186 = (char *)v154 - v27;
  uint64_t v28 = type metadata accessor for Fence.AcceptanceStatus();
  uint64_t v29 = *(void *)(v28 - 8);
  uint64_t v191 = v28;
  uint64_t v192 = v29;
  uint64_t v30 = __chkstk_darwin(v28);
  v171 = (char *)v154 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v30);
  v193 = (char *)v154 - v32;
  uint64_t v33 = type metadata accessor for Fence.Variant();
  uint64_t v34 = *(void *)(v33 - 8);
  uint64_t v189 = v33;
  uint64_t v190 = v34;
  uint64_t v35 = __chkstk_darwin(v33);
  v170 = (char *)v154 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v35);
  long long v38 = (char *)v154 - v37;
  uint64_t v39 = type metadata accessor for Fence.Participant();
  uint64_t v40 = *(void *)(v39 - 8);
  uint64_t v41 = __chkstk_darwin(v39);
  v169 = (char *)v154 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = __chkstk_darwin(v41);
  v168 = (char *)v154 - v44;
  uint64_t v45 = __chkstk_darwin(v43);
  id v47 = (char *)v154 - v46;
  __chkstk_darwin(v45);
  id v49 = (char *)v154 - v48;
  if (![a1 isActive])
  {
    _s5ErrorOMa();
    sub_1000691A4();
    swift_allocError();
    long long v62 = v61;
    id v63 = [a1 identifier];
    uint64_t v64 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v66 = v65;

    *long long v62 = v64;
    v62[1] = v66;
    swift_storeEnumTagMultiPayload();
    swift_willThrow();

    return;
  }
  uint64_t v163 = v4;
  v161 = v8;
  uint64_t v162 = a2;
  unsigned int v50 = [a1 isFromMe];
  long long v51 = *(void (**)(char *, uint64_t, uint64_t))(v40 + 104);
  unsigned int v52 = enum case for Fence.Participant.me(_:);
  uint64_t v195 = v39;
  unsigned int v53 = enum case for Fence.Participant.other(_:);
  if (v50) {
    uint64_t v54 = enum case for Fence.Participant.me(_:);
  }
  else {
    uint64_t v54 = enum case for Fence.Participant.other(_:);
  }
  v51(v49, v54, v195);
  if ([a1 isOnMe]) {
    uint64_t v55 = v53;
  }
  else {
    uint64_t v55 = v52;
  }
  uint64_t v56 = v195;
  v51(v47, v55, v195);
  id v57 = a1;
  long long v58 = v194;
  sub_100060A94(v57, (uint64_t)v38);
  uint64_t v59 = v47;
  if (v58)
  {

    long long v60 = *(void (**)(char *, uint64_t))(v40 + 8);
    v60(v47, v56);
    v60(v49, v56);
    return;
  }
  v160 = v38;
  uint64_t v159 = v49;
  v194 = (void **)v57;
  id v67 = [v57 acceptanceStatus];
  uint64_t v68 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v70 = v69;
  swift_bridgeObjectRelease();
  uint64_t v71 = HIBYTE(v70) & 0xF;
  if ((v70 & 0x2000000000000000) == 0) {
    uint64_t v71 = v68 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v158 = v40;
  if (!v71)
  {
    double v76 = (unsigned int *)&enum case for Fence.AcceptanceStatus.pendingHidden(_:);
    uint64_t v77 = v191;
LABEL_33:

    uint64_t v89 = v192;
    (*(void (**)(char *, void, uint64_t))(v192 + 104))(v193, *v76, v77);
    uint64_t v90 = v194;
    goto LABEL_36;
  }
  uint64_t v72 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v74 = v73;
  if (v72 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v74 == v75)
  {
    double v76 = (unsigned int *)&enum case for Fence.AcceptanceStatus.pendingHidden(_:);
    uint64_t v40 = v158;
    uint64_t v77 = v191;
LABEL_29:
    swift_bridgeObjectRelease_n();
    goto LABEL_33;
  }
  char v78 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v77 = v191;
  if (v78)
  {
    double v76 = (unsigned int *)&enum case for Fence.AcceptanceStatus.pendingHidden(_:);
LABEL_32:
    uint64_t v40 = v158;
    goto LABEL_33;
  }
  uint64_t v79 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v81 = v80;
  if (v79 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v81 == v82)
  {
    double v76 = (unsigned int *)&enum case for Fence.AcceptanceStatus.pending(_:);
LABEL_28:
    uint64_t v40 = v158;
    goto LABEL_29;
  }
  char v83 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v83)
  {
    double v76 = (unsigned int *)&enum case for Fence.AcceptanceStatus.pending(_:);
    goto LABEL_32;
  }
  uint64_t v84 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v86 = v85;
  if (v84 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v86 == v87)
  {
    double v76 = (unsigned int *)&enum case for Fence.AcceptanceStatus.accepted(_:);
    goto LABEL_28;
  }
  char v88 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v88)
  {
    double v76 = (unsigned int *)&enum case for Fence.AcceptanceStatus.accepted(_:);
    goto LABEL_32;
  }
  _s5ErrorOMa();
  sub_1000691A4();
  uint64_t v91 = swift_allocError();
  void *v92 = v67;
  swift_storeEnumTagMultiPayload();
  swift_willThrow();
  uint64_t v40 = v158;
  uint64_t v89 = v192;
  uint64_t v90 = v194;
  if (v91)
  {

LABEL_39:
    (*(void (**)(char *, uint64_t))(v190 + 8))(v160, v189);
    uint64_t v95 = *(void (**)(char *, uint64_t))(v40 + 8);
    v95(v59, v56);
    v95(v159, v56);
    return;
  }
LABEL_36:
  id v93 = [v90 locationType];
  id v94 = v93;
  if ((unint64_t)v93 < 8)
  {
    (*(void (**)(char *, void, uint64_t))(v187 + 104))(v186, *(unsigned int *)*(&off_1000A3798 + (void)v93), v188);
    goto LABEL_41;
  }
  _s5ErrorOMa();
  sub_1000691A4();
  uint64_t v96 = swift_allocError();
  *uint64_t v97 = v94;
  uint64_t v90 = v194;
  swift_storeEnumTagMultiPayload();
  swift_willThrow();
  if (v96)
  {

    (*(void (**)(char *, uint64_t))(v89 + 8))(v193, v77);
    goto LABEL_39;
  }
LABEL_41:
  id v98 = [v90 location];
  [v98 coordinate];

  id v99 = [v90 location];
  [v99 horizontalAccuracy];

  (*(void (**)(char *, char *, uint64_t))(v187 + 16))(v179, v186, v188);
  Fence.MonitorRegion.init(center:radius:source:)();
  id v100 = [v90 placemark];
  id v101 = [v100 formattedAddressLines];
  v179 = v59;
  if (v101)
  {
    NSString v102 = v101;
    uint64_t v103 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v104 = *(void *)(v103 + 16);
    if (v104)
    {
      uint64_t v157 = (uint64_t)v100;
      uint64_t v105 = v103 + 32;
      uint64_t v156 = v103;
      swift_bridgeObjectRetain();
      NSString v106 = (char *)&_swiftEmptyArrayStorage;
      do
      {
        sub_10006943C(v105, (uint64_t)v199);
        sub_10006943C((uint64_t)v199, (uint64_t)v196);
        if ((swift_dynamicCast() & 1) == 0)
        {
          uint64_t v197 = 0;
          uint64_t v198 = 0;
        }
        sub_1000693EC((uint64_t)v199);
        uint64_t v108 = v198;
        if (v198)
        {
          uint64_t v109 = v197;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            NSString v106 = sub_100062F48(0, *((void *)v106 + 2) + 1, 1, v106);
          }
          unint64_t v111 = *((void *)v106 + 2);
          unint64_t v110 = *((void *)v106 + 3);
          if (v111 >= v110 >> 1) {
            NSString v106 = sub_100062F48((char *)(v110 > 1), v111 + 1, 1, v106);
          }
          *((void *)v106 + 2) = v111 + 1;
          NSString v107 = &v106[16 * v111];
          *((void *)v107 + 4) = v109;
          *((void *)v107 + 5) = v108;
        }
        v105 += 32;
        --v104;
      }
      while (v104);
      swift_bridgeObjectRelease_n();
      id v100 = (id)v157;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  id v112 = [v100 locality];
  uint64_t v157 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v156 = v113;

  id v114 = [v100 administrativeArea];
  uint64_t v155 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v154[5] = v115;

  id v116 = [v100 country];
  v154[4] = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v154[3] = v117;

  id v118 = [v100 state];
  v154[2] = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v154[1] = v119;

  id v120 = [v100 streetAddress];
  v154[0] = static String._unconditionallyBridgeFromObjectiveC(_:)();

  id v121 = [v100 streetName];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  id v122 = v184;
  PlaceMark.init(locality:administrativeArea:country:state:streetAddress:streetName:formattedAddress:coarseAddress:poiAddress:smallAddress:mediumAddress:largeAddress:)();

  v123 = v194;
  uint64_t v157 = (uint64_t)sub_100066840(v194);
  id v124 = [v123 identifier];
  uint64_t v125 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v127 = v126;

  v128 = v178;
  sub_1000611C4(v125, v127);
  uint64_t v129 = v158;
  v130 = v159;
  uint64_t v131 = v191;
  (*(void (**)(char *, char *, uint64_t))(v175 + 16))(v174, v128, v176);
  id v132 = [v123 label];
  uint64_t v156 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v155 = v133;

  uint64_t v134 = *(void (**)(char *, char *, uint64_t))(v129 + 16);
  uint64_t v135 = v130;
  uint64_t v136 = v131;
  uint64_t v137 = v195;
  v134(v168, v135, v195);
  v134(v169, v179, v137);
  (*(void (**)(char *, char *, uint64_t))(v190 + 16))(v170, v160, v189);
  (*(void (**)(char *, char *, uint64_t))(v192 + 16))(v171, v193, v136);
  (*(void (**)(char *, char *, uint64_t))(v180 + 16))(v172, v185, v181);
  (*(void (**)(char *, char *, uint64_t))(v182 + 16))(v173, v122, v183);
  id v138 = [v123 muteEndDate];
  if (v138)
  {
    uint64_t v139 = v138;
    uint64_t v140 = v167;
    static Date._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v141 = v166;
    uint64_t v142 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v166 + 56);
    v142(v140, 0, 1, v163);
  }
  else
  {
    uint64_t v141 = v166;
    uint64_t v142 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v166 + 56);
    v142(v167, 1, 1, v163);
  }
  uint64_t v143 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v143 - 8) + 56))(v177, 1, 1, v143);
  id v144 = [v194 timestamp];
  if (!v144)
  {
    uint64_t v148 = (uint64_t)v165;
    v142(v165, 1, 1, v163);
    goto LABEL_62;
  }
  v145 = v144;
  uint64_t v146 = v164;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v147 = *(void (**)(char *, char *, uint64_t))(v141 + 32);
  uint64_t v148 = (uint64_t)v165;
  v149 = v146;
  uint64_t v150 = v163;
  v147(v165, v149, v163);
  v142((char *)v148, 0, 1, v150);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v141 + 48))(v148, 1, v150) == 1)
  {
LABEL_62:
    static Date.now.getter();
    sub_100069390(v148, &qword_1000BB368);
    goto LABEL_63;
  }
  v147(v161, (char *)v148, v150);
LABEL_63:
  uint64_t v151 = v191;
  Fence.init(id:label:createdBy:finder:variant:acceptanceStatus:region:placemark:others:muteEndDate:ckRecordIdentifier:ckRecordZoneOwnerName:updatedAt:)();

  (*(void (**)(char *, uint64_t))(v175 + 8))(v178, v176);
  (*(void (**)(char *, uint64_t))(v182 + 8))(v184, v183);
  (*(void (**)(char *, uint64_t))(v180 + 8))(v185, v181);
  (*(void (**)(char *, uint64_t))(v187 + 8))(v186, v188);
  (*(void (**)(char *, uint64_t))(v192 + 8))(v193, v151);
  (*(void (**)(char *, uint64_t))(v190 + 8))(v160, v189);
  v152 = *(void (**)(char *, uint64_t))(v129 + 8);
  uint64_t v153 = v195;
  v152(v179, v195);
  v152(v159, v153);
}

uint64_t sub_10005CD14(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_100059F80(&qword_1000BB300);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  void v11[4] = a1;
  v11[5] = a2;
  v11[6] = a3;
  v11[7] = v3;
  id v12 = a1;
  swift_retain();
  id v13 = v3;
  sub_100059C84((uint64_t)v9, (uint64_t)&unk_1000BB320, (uint64_t)v11);
  return swift_release();
}

uint64_t sub_10005CE30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  void v7[4] = a6;
  v7[5] = a7;
  v7[2] = a4;
  v7[3] = a5;
  uint64_t v8 = type metadata accessor for Fence.ID();
  v7[6] = v8;
  v7[7] = *(void *)(v8 - 8);
  v7[8] = swift_task_alloc();
  sub_100059F80(&qword_1000BB350);
  v7[9] = swift_task_alloc();
  uint64_t v9 = type metadata accessor for UUID();
  v7[10] = v9;
  v7[11] = *(void *)(v9 - 8);
  v7[12] = swift_task_alloc();
  v7[13] = swift_task_alloc();
  return _swift_task_switch(sub_10005CF90, 0, 0);
}

uint64_t sub_10005CF90()
{
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v2 = *(void *)(v0 + 88);
  uint64_t v3 = *(void *)(v0 + 72);
  id v4 = [*(id *)(v0 + 16) identifier];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  UUID.init(uuidString:)();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    uint64_t v5 = *(void (**)(void))(v0 + 24);
    uint64_t v6 = *(void **)(v0 + 16);
    sub_100069390(*(void *)(v0 + 72), &qword_1000BB350);
    id v7 = [v6 identifier];
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v10 = v9;

    sub_100065760();
    swift_allocError();
    *(void *)uint64_t v11 = v8;
    *(void *)(v11 + 8) = v10;
    *(unsigned char *)(v11 + 16) = 0;
    id v12 = (void *)_convertErrorToNSError(_:)();
    v5();

    swift_errorRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    id v13 = *(uint64_t (**)(void))(v0 + 8);
    return v13();
  }
  else
  {
    uint64_t v15 = *(void *)(v0 + 96);
    uint64_t v16 = *(void *)(v0 + 104);
    uint64_t v17 = *(void *)(v0 + 80);
    uint64_t v18 = *(void *)(v0 + 88);
    (*(void (**)(uint64_t, void, uint64_t))(v18 + 32))(v16, *(void *)(v0 + 72), v17);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v15, v16, v17);
    Fence.ID.init(id:)();
    uint64_t v19 = (void *)swift_task_alloc();
    *(void *)(v0 + 112) = v19;
    void *v19 = v0;
    v19[1] = sub_10005D1F4;
    uint64_t v20 = *(void *)(v0 + 64);
    return Session.deleteFence(id:)(v20);
  }
}

uint64_t sub_10005D1F4()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 64);
  uint64_t v3 = *(void *)(*(void *)v1 + 56);
  uint64_t v4 = *(void *)(*(void *)v1 + 48);
  *(void *)(*(void *)v1 + 120) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (v0) {
    uint64_t v5 = sub_10005D418;
  }
  else {
    uint64_t v5 = sub_10005D364;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_10005D364()
{
  uint64_t v1 = *(void *)(v0 + 104);
  uint64_t v2 = *(void *)(v0 + 80);
  uint64_t v3 = *(void *)(v0 + 88);
  (*(void (**)(void))(v0 + 24))(0);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_10005D418()
{
  uint64_t v1 = (void (*)(void))v0[3];
  (*(void (**)(void, void))(v0[11] + 8))(v0[13], v0[10]);
  uint64_t v2 = (void *)_convertErrorToNSError(_:)();
  v1();

  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_10005D4E0()
{
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v5 = v0[6];
  uint64_t v4 = v0[7];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_10006A97C;
  return sub_10005CE30((uint64_t)v6, v7, v8, v2, v3, v5, v4);
}

uint64_t sub_10005D708(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_100059F80(&qword_1000BB300);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  uint64_t v9 = (void *)swift_allocObject();
  void v9[2] = 0;
  void v9[3] = 0;
  void v9[4] = v2;
  v9[5] = a1;
  v9[6] = a2;
  id v10 = v2;
  swift_retain();
  sub_100059C84((uint64_t)v7, (uint64_t)&unk_1000BB330, (uint64_t)v9);
  return swift_release();
}

uint64_t sub_10005D81C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void v6[4] = a5;
  v6[5] = a6;
  v6[3] = a4;
  uint64_t v7 = type metadata accessor for Fence();
  v6[6] = v7;
  v6[7] = *(void *)(v7 - 8);
  v6[8] = swift_task_alloc();
  return _swift_task_switch(sub_10005D8E0, 0, 0);
}

uint64_t sub_10005D8E0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v1;
  void *v1 = v0;
  v1[1] = sub_10005D980;
  return Session.fences()();
}

uint64_t sub_10005D980(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 80) = a1;
  *(void *)(v3 + 88) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_10005DE18;
  }
  else {
    uint64_t v4 = sub_10005DA94;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_10005DA94()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v23 = v0 + 2;
    uint64_t v3 = v0[7];
    uint64_t v6 = *(void (**)(void, uint64_t, void))(v3 + 16);
    uint64_t v4 = v3 + 16;
    uint64_t v5 = v6;
    uint64_t v7 = v1 + ((*(unsigned __int8 *)(v4 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 64));
    uint64_t v8 = (void (**)(void, void))(v4 - 8);
    uint64_t v25 = *(void *)(v4 + 56);
    uint64_t v9 = v0[11];
    swift_bridgeObjectRetain();
    uint64_t v24 = v0;
    uint64_t v22 = v6;
    uint64_t v21 = (void (**)(void, void))(v4 - 8);
    do
    {
      v5(v0[8], v7, v0[6]);
      sub_10005883C();
      if (v9)
      {
        if (qword_1000BB890 != -1) {
          swift_once();
        }
        uint64_t v10 = type metadata accessor for Logger();
        sub_100068F9C(v10, (uint64_t)qword_1000BB898);
        swift_errorRetain();
        swift_errorRetain();
        uint64_t v11 = Logger.logObject.getter();
        os_log_type_t v12 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v11, v12))
        {
          id v13 = (uint8_t *)swift_slowAlloc();
          uint64_t v14 = (void *)swift_slowAlloc();
          *(_DWORD *)id v13 = 138412290;
          swift_errorRetain();
          uint64_t v15 = v4;
          uint64_t v16 = _swift_stdlib_bridgeErrorToNSError();
          *uint64_t v23 = v16;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *uint64_t v14 = v16;
          uint64_t v4 = v15;
          swift_errorRelease();
          swift_errorRelease();
          _os_log_impl((void *)&_mh_execute_header, v11, v12, "Failed to convert to FMFFence: %@", v13, 0xCu);
          sub_100059F80(&qword_1000BB488);
          swift_arrayDestroy();
          uint64_t v8 = v21;
          swift_slowDealloc();
          uint64_t v5 = v22;
          uint64_t v0 = v24;
          swift_slowDealloc();

          swift_errorRelease();
        }
        else
        {
          swift_errorRelease();
          swift_errorRelease();
          swift_errorRelease();
        }
        (*v8)(v0[8], v0[6]);
      }
      else
      {
        (*v8)(v0[8], v0[6]);
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        if (*(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        }
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
      }
      uint64_t v9 = 0;
      v7 += v25;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  uint64_t v17 = (void (*)(uint64_t, void))v0[4];
  swift_bridgeObjectRelease();
  uint64_t v18 = sub_100066594((unint64_t)&_swiftEmptyArrayStorage);
  swift_bridgeObjectRelease();
  v17(v18, 0);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v19 = (uint64_t (*)(void))v0[1];
  return v19();
}

uint64_t sub_10005DE18()
{
  uint64_t v1 = *(void (**)(void, void *))(v0 + 32);
  uint64_t v2 = (void *)_convertErrorToNSError(_:)();
  v1(0, v2);

  swift_errorRelease();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_10005DEB4()
{
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_10006A97C;
  return sub_10005D81C((uint64_t)v5, v6, v7, v2, v3, v4);
}

void sub_10005E0B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    sub_100068ADC(0, &qword_1000BB3D0);
    sub_100068B18();
    v4.super.Class isa = Set._bridgeToObjectiveC()().super.isa;
  }
  else
  {
    v4.super.Class isa = 0;
  }
  Class isa = v4.super.isa;
  (*(void (**)(uint64_t))(a3 + 16))(a3);
}

uint64_t sub_10005E158(unint64_t a1, void (*a2)(void, void), uint64_t a3)
{
  uint64_t v7 = sub_100059F80(&qword_1000BB300);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for PersonHandle();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  id v13 = (char *)v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v14 = sub_100059AA0(a1, (SEL *)&selRef_identifier);
    int64_t v15 = *((void *)v14 + 2);
    if (v15)
    {
      uint64_t v28 = v9;
      uint64_t v29 = v3;
      uint64_t v30 = a2;
      uint64_t v31 = a3;
      uint64_t v32 = _swiftEmptyArrayStorage;
      sub_100065674(0, v15, 0);
      uint64_t v16 = v32;
      v27[1] = v14;
      uint64_t v17 = v14 + 40;
      do
      {
        swift_bridgeObjectRetain();
        PersonHandle.init(id:)();
        uint64_t v32 = v16;
        unint64_t v19 = v16[2];
        unint64_t v18 = v16[3];
        if (v19 >= v18 >> 1)
        {
          sub_100065674(v18 > 1, v19 + 1, 1);
          uint64_t v16 = v32;
        }
        v17 += 16;
        v16[2] = v19 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))((unint64_t)v16+ ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))+ *(void *)(v11 + 72) * v19, v13, v10);
        --v15;
      }
      while (v15);
      swift_bridgeObjectRelease();
      a2 = v30;
      a3 = v31;
      uint64_t v9 = v28;
      uint64_t v3 = v29;
      if (v16[2]) {
        goto LABEL_8;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v16 = _swiftEmptyArrayStorage;
      if (_swiftEmptyArrayStorage[2])
      {
LABEL_8:
        uint64_t v20 = type metadata accessor for TaskPriority();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v9, 1, 1, v20);
        uint64_t v21 = (void *)swift_allocObject();
        void v21[2] = 0;
        v21[3] = 0;
        void v21[4] = v3;
        void v21[5] = v16;
        v21[6] = a2;
        v21[7] = a3;
        uint64_t v22 = v3;
        swift_retain();
        sub_100059C84((uint64_t)v9, (uint64_t)&unk_1000BB340, (uint64_t)v21);
        return swift_release();
      }
    }
    swift_bridgeObjectRelease();
    sub_100065760();
    swift_allocError();
    *(_OWORD *)uint64_t v25 = xmmword_10007E920;
    *(unsigned char *)(v25 + 16) = 2;
    uint64_t v26 = (void *)_convertErrorToNSError(_:)();
    a2(0, v26);

    return swift_errorRelease();
  }
  else
  {
    uint64_t v24 = *(uint64_t (**)(void, uint64_t))((swift_isaMask & *v3) + 0x68);
    return v24(a2, a3);
  }
}

uint64_t sub_10005E4EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[5] = a6;
  v7[6] = a7;
  v7[3] = a4;
  void v7[4] = a5;
  uint64_t v8 = type metadata accessor for Fence();
  v7[7] = v8;
  v7[8] = *(void *)(v8 - 8);
  v7[9] = swift_task_alloc();
  return _swift_task_switch(sub_10005E5B0, 0, 0);
}

uint64_t sub_10005E5B0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v1;
  void *v1 = v0;
  v1[1] = sub_10005E650;
  return Session.fences()();
}

uint64_t sub_10005E650(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 88) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_10005EB2C;
  }
  else
  {
    *(void *)(v4 + 96) = a1;
    uint64_t v5 = sub_10005E778;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_10005E778()
{
  uint64_t v2 = v0[11];
  uint64_t v1 = v0[12];
  uint64_t v3 = v0[4];
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_100067650(v1, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = *((void *)v4 + 2);
  if (v5)
  {
    uint64_t v27 = v0 + 2;
    uint64_t v6 = v0[8];
    uint64_t v9 = *(void (**)(void, char *, void))(v6 + 16);
    uint64_t v7 = v6 + 16;
    uint64_t v8 = v9;
    uint64_t v10 = &v4[(*(unsigned __int8 *)(v7 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 64)];
    uint64_t v11 = (void (**)(void, void))(v7 - 8);
    uint64_t v12 = *(void *)(v7 + 56);
    swift_bridgeObjectRetain();
    uint64_t v28 = v0;
    uint64_t v26 = v9;
    uint64_t v24 = v12;
    uint64_t v25 = (void (**)(void, void))(v7 - 8);
    do
    {
      v8(v0[9], v10, v0[7]);
      sub_10005883C();
      if (v2)
      {
        if (qword_1000BB890 != -1) {
          swift_once();
        }
        uint64_t v13 = type metadata accessor for Logger();
        sub_100068F9C(v13, (uint64_t)qword_1000BB898);
        swift_errorRetain();
        swift_errorRetain();
        uint64_t v14 = Logger.logObject.getter();
        os_log_type_t v15 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v14, v15))
        {
          uint64_t v16 = (uint8_t *)swift_slowAlloc();
          uint64_t v17 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v16 = 138412290;
          swift_errorRetain();
          uint64_t v18 = v7;
          uint64_t v19 = _swift_stdlib_bridgeErrorToNSError();
          uint64_t *v27 = v19;
          uint64_t v12 = v24;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *uint64_t v17 = v19;
          uint64_t v7 = v18;
          swift_errorRelease();
          swift_errorRelease();
          _os_log_impl((void *)&_mh_execute_header, v14, v15, "Failed to convert to FMFFence: %@", v16, 0xCu);
          sub_100059F80(&qword_1000BB488);
          swift_arrayDestroy();
          uint64_t v11 = v25;
          swift_slowDealloc();
          uint64_t v8 = v26;
          uint64_t v0 = v28;
          swift_slowDealloc();

          swift_errorRelease();
        }
        else
        {
          swift_errorRelease();
          swift_errorRelease();
          swift_errorRelease();
        }
        (*v11)(v0[9], v0[7]);
      }
      else
      {
        (*v11)(v0[9], v0[7]);
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        if (*(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        }
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
      }
      uint64_t v2 = 0;
      v10 += v12;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease();
  }
  uint64_t v20 = (void (*)(uint64_t, void))v0[5];
  swift_bridgeObjectRelease();
  uint64_t v21 = sub_100066594((unint64_t)_swiftEmptyArrayStorage);
  swift_bridgeObjectRelease();
  v20(v21, 0);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v22 = (uint64_t (*)(void))v0[1];
  return v22();
}

uint64_t sub_10005EB2C()
{
  uint64_t v1 = *(void (**)(void, void *))(v0 + 40);
  uint64_t v2 = (void *)_convertErrorToNSError(_:)();
  v1(0, v2);

  swift_errorRelease();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_10005EC70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t))((swift_isaMask & *v7) + 0x80))(a1, a2, a3, a4, a5, 0, a6, a7);
}

uint64_t sub_10005EF08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void (*a7)(void), void (*a8)(void))
{
  uint64_t v103 = a4;
  NSString v107 = a7;
  uint64_t v108 = a8;
  uint64_t v104 = a6;
  uint64_t v109 = a3;
  uint64_t v9 = sub_100059F80(&qword_1000BB300);
  __chkstk_darwin(v9 - 8);
  uint64_t v106 = (uint64_t)&v92 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for Fence.TriggerPosition();
  uint64_t v100 = *(void *)(v11 - 8);
  uint64_t v101 = v11;
  uint64_t v12 = *(void *)(v100 + 64);
  uint64_t v13 = __chkstk_darwin(v11);
  __chkstk_darwin(v13);
  os_log_type_t v15 = (char *)&v92 - v14;
  uint64_t v16 = sub_100059F80(&qword_1000BB350);
  __chkstk_darwin(v16 - 8);
  uint64_t v18 = (char *)&v92 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for UUID();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(void *)(v20 + 64);
  uint64_t v22 = __chkstk_darwin(v19);
  __chkstk_darwin(v22);
  uint64_t v24 = (char *)&v92 - v23;
  uint64_t v105 = a2;
  UUID.init(uuidString:)();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19) == 1)
  {
    sub_100069390((uint64_t)v18, &qword_1000BB350);
    sub_100065760();
    swift_allocError();
    uint64_t v25 = v109;
    *(void *)uint64_t v26 = v105;
    *(void *)(v26 + 8) = v25;
    *(unsigned char *)(v26 + 16) = 0;
    swift_bridgeObjectRetain();
    uint64_t v27 = (void *)_convertErrorToNSError(_:)();
    v107();

    return swift_errorRelease();
  }
  uint64_t v105 = v21;
  uint64_t v97 = (char *)&v92 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v98 = (char *)&v92 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v109 = v12;
  id v99 = v15;
  uint64_t v28 = v20 + 32;
  uint64_t v29 = *(void (**)(char *, char *, uint64_t))(v20 + 32);
  v29(v24, v18, v19);
  uint64_t v30 = v24;
  uint64_t v31 = v20;
  uint64_t v32 = v104;
  if (!v104)
  {
    sub_100065760();
    swift_allocError();
    *(void *)uint64_t v45 = 0;
    *(void *)(v45 + 8) = 0;
    *(unsigned char *)(v45 + 16) = 2;
    uint64_t v46 = (void *)_convertErrorToNSError(_:)();
    v107();

    (*(void (**)(char *, uint64_t))(v31 + 8))(v24, v19);
    return swift_errorRelease();
  }
  uint64_t v33 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v35 = v34;
  uint64_t v36 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v94 = v29;
  uint64_t v95 = v28;
  uint64_t v96 = v24;
  if (v33 != v36 || v35 != v37)
  {
    char v48 = _stringCompareWithSmolCheck(_:_:expecting:)();
    id v49 = v32;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v48) {
      goto LABEL_12;
    }
    uint64_t v72 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v74 = v73;
    if (v72 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v74 == v75)
    {
      uint64_t v38 = v19;
      uint64_t v39 = v96;
      goto LABEL_7;
    }
    char v76 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v76)
    {
LABEL_12:
      uint64_t v38 = v19;
      uint64_t v39 = v96;
      uint64_t v41 = (unsigned int *)&enum case for Fence.TriggerPosition.inside(_:);
    }
    else
    {
      uint64_t v77 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v79 = v78;
      if (v77 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v79 == v80) {
        goto LABEL_22;
      }
      char v81 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v81 & 1) == 0)
      {
        uint64_t v82 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v84 = v83;
        if (v82 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v84 == v85)
        {
LABEL_22:
          uint64_t v38 = v19;
          uint64_t v39 = v96;
          uint64_t v41 = (unsigned int *)&enum case for Fence.TriggerPosition.outside(_:);
          goto LABEL_8;
        }
        char v86 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v86 & 1) == 0)
        {
          uint64_t v87 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v89 = v88;
          sub_100065760();
          swift_allocError();
          *(void *)uint64_t v90 = v87;
          *(void *)(v90 + 8) = v89;
          *(unsigned char *)(v90 + 16) = 1;
          uint64_t v91 = (void *)_convertErrorToNSError(_:)();
          v107();

          (*(void (**)(char *, uint64_t))(v31 + 8))(v96, v19);
          return swift_errorRelease();
        }
      }
      uint64_t v38 = v19;
      uint64_t v39 = v96;
      uint64_t v41 = (unsigned int *)&enum case for Fence.TriggerPosition.outside(_:);
    }
    uint64_t v43 = v100;
    uint64_t v44 = v101;
    uint64_t v42 = v106;
    goto LABEL_14;
  }
  uint64_t v38 = v19;
  uint64_t v39 = v30;
  id v40 = v32;
LABEL_7:
  uint64_t v41 = (unsigned int *)&enum case for Fence.TriggerPosition.inside(_:);
LABEL_8:
  uint64_t v42 = v106;
  swift_bridgeObjectRelease_n();
  uint64_t v43 = v100;
  uint64_t v44 = v101;
LABEL_14:
  long long v51 = v98;
  unsigned int v50 = v99;
  unsigned int v52 = v97;
  *id v99 = v32;
  uint64_t v53 = *v41;
  uint64_t v54 = v50;
  (*(void (**)(void *, uint64_t, uint64_t))(v43 + 104))(v50, v53, v44);
  uint64_t v55 = type metadata accessor for TaskPriority();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v55 - 8) + 56))(v42, 1, 1, v55);
  uint64_t v56 = *(void (**)(char *, char *, uint64_t))(v31 + 16);
  uint64_t v93 = v38;
  v56(v52, v39, v38);
  uint64_t v57 = v44;
  (*(void (**)(char *, void *, uint64_t))(v43 + 16))(v51, v54, v44);
  long long v58 = v52;
  unint64_t v59 = (*(unsigned __int8 *)(v31 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80);
  unint64_t v60 = (v105 + *(unsigned __int8 *)(v43 + 80) + v59) & ~(unint64_t)*(unsigned __int8 *)(v43 + 80);
  unint64_t v61 = (v109 + v60 + 7) & 0xFFFFFFFFFFFFFFF8;
  long long v62 = v32;
  id v63 = (char *)swift_allocObject();
  *((void *)v63 + 2) = 0;
  *((void *)v63 + 3) = 0;
  uint64_t v64 = v102;
  *((void *)v63 + 4) = v102;
  uint64_t v65 = &v63[v59];
  uint64_t v66 = v93;
  v94(v65, v58, v93);
  uint64_t v67 = v57;
  (*(void (**)(char *, char *, uint64_t))(v43 + 32))(&v63[v60], v98, v57);
  uint64_t v68 = (void (**)(void))&v63[v61];
  unint64_t v69 = v108;
  *uint64_t v68 = v107;
  v68[1] = v69;
  id v70 = v62;
  id v71 = v64;
  swift_retain();
  sub_100059C84(v106, (uint64_t)&unk_1000BB360, (uint64_t)v63);
  swift_release();

  (*(void (**)(void *, uint64_t))(v43 + 8))(v99, v67);
  return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v96, v66);
}

uint64_t sub_10005F6D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void v8[5] = a7;
  v8[6] = a8;
  void v8[3] = a5;
  void v8[4] = a6;
  v8[2] = a4;
  uint64_t v9 = type metadata accessor for UUID();
  v8[7] = v9;
  uint8_t v8[8] = *(void *)(v9 - 8);
  v8[9] = swift_task_alloc();
  uint64_t v10 = type metadata accessor for Fence.ID();
  v8[10] = v10;
  v8[11] = *(void *)(v10 - 8);
  v8[12] = swift_task_alloc();
  sub_100059F80(&qword_1000BB4A8);
  v8[13] = swift_task_alloc();
  return _swift_task_switch(sub_10005F824, 0, 0);
}

uint64_t sub_10005F824()
{
  (*(void (**)(void, void, void))(v0[8] + 16))(v0[9], v0[3], v0[7]);
  Fence.ID.init(id:)();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[14] = v1;
  void *v1 = v0;
  v1[1] = sub_10005F904;
  uint64_t v3 = v0[12];
  uint64_t v2 = v0[13];
  uint64_t v4 = v0[4];
  return Session.triggerFence(id:position:)(v2, v3, v4);
}

uint64_t sub_10005F904()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 96);
  uint64_t v4 = *(void *)(*v1 + 88);
  uint64_t v5 = *(void *)(*v1 + 80);
  *(void *)(*v1 + 120) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  if (v0)
  {
    uint64_t v6 = sub_10005FB10;
  }
  else
  {
    sub_100069390(*(void *)(v2 + 104), &qword_1000BB4A8);
    uint64_t v6 = sub_10005FA8C;
  }
  return _swift_task_switch(v6, 0, 0);
}

uint64_t sub_10005FA8C()
{
  (*(void (**)(void))(v0 + 40))(0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10005FB10()
{
  uint64_t v1 = *(void (**)(void))(v0 + 40);
  uint64_t v2 = (void *)_convertErrorToNSError(_:)();
  v1();

  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_10005FDD4(void *a1, uint64_t a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t v9 = sub_100059F80(&qword_1000BB368);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  __chkstk_darwin(v9 - 8);
  uint64_t v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100059F80(&qword_1000BB300);
  __chkstk_darwin(v13 - 8);
  os_log_type_t v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v16 = a3;
    id v17 = a1;
    id v18 = [v17 identifier];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v32 = v21;
      uint64_t v33 = v20;

      uint64_t v22 = type metadata accessor for TaskPriority();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v15, 1, 1, v22);
      sub_100065934(a2, (uint64_t)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
      unint64_t v23 = (*(unsigned __int8 *)(v10 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
      unint64_t v24 = (v11 + v23 + 7) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v25 = (void *)swift_allocObject();
      v25[2] = 0;
      v25[3] = 0;
      uint64_t v26 = v32;
      void v25[4] = v33;
      v25[5] = v26;
      sub_1000659A0((uint64_t)v12, (uint64_t)v25 + v23);
      *(void *)((char *)v25 + v24) = v4;
      uint64_t v27 = (void (**)(void))((char *)v25 + ((v24 + 15) & 0xFFFFFFFFFFFFFFF8));
      void *v27 = v16;
      v27[1] = a4;
      id v28 = v4;
      swift_retain();
      sub_100059C84((uint64_t)v15, (uint64_t)&unk_1000BB378, (uint64_t)v25);

      return swift_release();
    }
  }
  sub_100065760();
  swift_allocError();
  *(_OWORD *)uint64_t v30 = xmmword_10007E920;
  *(unsigned char *)(v30 + 16) = 2;
  uint64_t v31 = (void *)_convertErrorToNSError(_:)();
  a3();

  return swift_errorRelease();
}

uint64_t sub_10006008C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[6] = a8;
  v8[7] = v13;
  void v8[4] = a6;
  void v8[5] = a7;
  v8[2] = a4;
  void v8[3] = a5;
  sub_100059F80(&qword_1000BB368);
  uint8_t v8[8] = swift_task_alloc();
  uint64_t v9 = type metadata accessor for Date();
  v8[9] = v9;
  v8[10] = *(void *)(v9 - 8);
  v8[11] = swift_task_alloc();
  uint64_t v10 = type metadata accessor for PersonHandle();
  v8[12] = v10;
  v8[13] = *(void *)(v10 - 8);
  v8[14] = swift_task_alloc();
  return _swift_task_switch(sub_1000601E8, 0, 0);
}

uint64_t sub_1000601E8()
{
  uint64_t v1 = v0[9];
  uint64_t v2 = v0[10];
  uint64_t v3 = v0[8];
  uint64_t v4 = v0[4];
  swift_bridgeObjectRetain();
  PersonHandle.init(id:)();
  sub_100065934(v4, v3);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_100069390(v0[8], &qword_1000BB368);
    uint64_t v5 = (void *)swift_task_alloc();
    v0[15] = v5;
    *uint64_t v5 = v0;
    v5[1] = sub_1000603BC;
    uint64_t v6 = v0[14];
    return Session.unmuteFences(for:)(v6);
  }
  else
  {
    (*(void (**)(void, void, void))(v0[10] + 32))(v0[11], v0[8], v0[9]);
    uint64_t v7 = (void *)swift_task_alloc();
    v0[17] = v7;
    *uint64_t v7 = v0;
    v7[1] = sub_1000604D0;
    uint64_t v8 = v0[14];
    uint64_t v9 = v0[11];
    return Session.muteFences(for:untilDate:)(v8, v9);
  }
}

uint64_t sub_1000603BC()
{
  *(void *)(*(void *)v1 + 128) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_100060824;
  }
  else {
    uint64_t v2 = sub_1000606A4;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000604D0()
{
  *(void *)(*(void *)v1 + 144) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_10006074C;
  }
  else {
    uint64_t v2 = sub_1000605E4;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000605E4()
{
  (*(void (**)(void, void))(*(void *)(v0 + 80) + 8))(*(void *)(v0 + 88), *(void *)(v0 + 72));
  (*(void (**)(void))(v0 + 48))(0);
  (*(void (**)(void, void))(*(void *)(v0 + 104) + 8))(*(void *)(v0 + 112), *(void *)(v0 + 96));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000606A4()
{
  (*(void (**)(void))(v0 + 48))(0);
  (*(void (**)(void, void))(*(void *)(v0 + 104) + 8))(*(void *)(v0 + 112), *(void *)(v0 + 96));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10006074C()
{
  (*(void (**)(void, void))(v0[10] + 8))(v0[11], v0[9]);
  uint64_t v1 = (void (*)(void))v0[6];
  uint64_t v2 = (void *)_convertErrorToNSError(_:)();
  v1();
  swift_errorRelease();

  (*(void (**)(void, void))(v0[13] + 8))(v0[14], v0[12]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_100060824()
{
  uint64_t v1 = (void (*)(void))v0[6];
  uint64_t v2 = (void *)_convertErrorToNSError(_:)();
  v1();
  swift_errorRelease();

  (*(void (**)(void, void))(v0[13] + 8))(v0[14], v0[12]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

id sub_100060A50()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FindMyLocateShims();
  return [super dealloc];
}

void sub_100060A94(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v52 = a2;
  uint64_t v3 = type metadata accessor for TimeZone();
  __chkstk_darwin(v3 - 8);
  long long v51 = (char *)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Fence.DaysOfWeek();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = type metadata accessor for Fence.TimeOfDay();
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  __chkstk_darwin(v7);
  unsigned int v8 = [a1 isRecurring];
  id v9 = [a1 trigger];
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  BOOL v15 = v10 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v12 == v13;
  if (!v8)
  {
    if (v15)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v22 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v22 & 1) == 0)
      {
        uint64_t v32 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v34 = v33;
        if (v32 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v34 == v35)
        {
          swift_bridgeObjectRelease_n();
        }
        else
        {
          char v37 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v37 & 1) == 0)
          {

            _s5ErrorOMa();
            sub_1000691A4();
            swift_allocError();
            uint64_t v43 = v42;
            id v44 = [a1 trigger];
LABEL_33:
            *uint64_t v43 = v44;
LABEL_34:
            swift_storeEnumTagMultiPayload();
            swift_willThrow();

            return;
          }
        }

        unint64_t v23 = (unsigned int *)&enum case for Fence.Trigger.leaving(_:);
LABEL_17:
        uint64_t v24 = *v23;
        uint64_t v25 = type metadata accessor for Fence.Trigger();
        uint64_t v20 = v52;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 104))(v52, v24, v25);
        uint64_t v21 = (unsigned int *)&enum case for Fence.Variant.oneTime(_:);
        goto LABEL_18;
      }
    }

    unint64_t v23 = (unsigned int *)&enum case for Fence.Trigger.arriving(_:);
    goto LABEL_17;
  }
  if (v15)
  {
    swift_bridgeObjectRelease_n();
LABEL_13:

    id v17 = (unsigned int *)&enum case for Fence.Trigger.arriving(_:);
LABEL_14:
    uint64_t v18 = *v17;
    uint64_t v19 = type metadata accessor for Fence.Trigger();
    uint64_t v20 = v52;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 104))(v52, v18, v19);
    uint64_t v21 = (unsigned int *)&enum case for Fence.Variant.recurring(_:);
LABEL_18:
    uint64_t v26 = *v21;
    uint64_t v27 = type metadata accessor for Fence.Variant();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 104))(v20, v26, v27);
    return;
  }
  char v16 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v16) {
    goto LABEL_13;
  }
  uint64_t v28 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v30 = v29;
  if (v28 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v30 == v31)
  {
    swift_bridgeObjectRelease_n();
LABEL_26:

    id v17 = (unsigned int *)&enum case for Fence.Trigger.leaving(_:);
    goto LABEL_14;
  }
  char v36 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v36) {
    goto LABEL_26;
  }
  uint64_t v38 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v40 = v39;
  if (v38 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v40 == v41)
  {

    swift_bridgeObjectRelease_n();
    goto LABEL_36;
  }
  char v45 = _stringCompareWithSmolCheck(_:_:expecting:)();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v45 & 1) == 0)
  {
    _s5ErrorOMa();
    sub_1000691A4();
    swift_allocError();
    uint64_t v43 = v50;
    id v44 = [a1 trigger];
    goto LABEL_33;
  }
LABEL_36:
  id v46 = [a1 schedule];
  if (!v46)
  {
    _s5ErrorOMa();
    sub_1000691A4();
    swift_allocError();
    goto LABEL_34;
  }
  id v47 = v46;
  [v46 startHour];
  [v47 startMin];
  Fence.TimeOfDay.init(hour:minute:)();
  [v47 endHour];
  [v47 endMin];
  Fence.TimeOfDay.init(hour:minute:)();
  unint64_t v48 = (unint64_t)[v47 daysOfWeek];
  if ((v48 & 0x8000000000000000) == 0 && v48 < 0x100)
  {
    Fence.DaysOfWeek.init(rawValue:)();
    id v49 = [v47 timeZone];
    static TimeZone._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v20 = v52;
    Fence.Schedule.init(start:end:daysOfWeek:timeZone:)();

    uint64_t v21 = (unsigned int *)&enum case for Fence.Variant.scheduled(_:);
    goto LABEL_18;
  }
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t sub_1000611C4(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_100059F80(&qword_1000BB350);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for UUID();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)v17 - v12;
  UUID.init(uuidString:)();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_100069390((uint64_t)v6, &qword_1000BB350);
    uint64_t v14 = HIBYTE(a2) & 0xF;
    if ((a2 & 0x2000000000000000) == 0) {
      uint64_t v14 = a1 & 0xFFFFFFFFFFFFLL;
    }
    if (v14)
    {
      _s5ErrorOMa();
      sub_1000691A4();
      swift_allocError();
      *BOOL v15 = a1;
      v15[1] = a2;
      swift_storeEnumTagMultiPayload();
      return swift_willThrow();
    }
    else
    {
      swift_bridgeObjectRelease();
      return Fence.ID.init()();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v13, v6, v7);
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
    Fence.ID.init(id:)();
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v13, v7);
  }
}

id sub_10006141C()
{
  uint64_t v1 = type metadata accessor for Fence.Variant();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Fence.Trigger();
  uint64_t v28 = *(void *)(v5 - 8);
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v27 - v9;
  uint64_t v11 = v0;
  uint64_t v12 = v0;
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
  v13(v4, v12, v1);
  int v14 = (*(uint64_t (**)(char *, uint64_t))(v2 + 88))(v4, v1);
  if (v14 == enum case for Fence.Variant.oneTime(_:) || v14 == enum case for Fence.Variant.recurring(_:))
  {
    (*(void (**)(char *, uint64_t))(v2 + 96))(v4, v1);
    uint64_t v16 = v28;
    id v17 = *(void (**)(char *, char *, uint64_t))(v28 + 32);
    v17(v10, v4, v5);
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v8, v10, v5);
    int v18 = (*(uint64_t (**)(char *, uint64_t))(v16 + 88))(v8, v5);
    id v19 = (id)v5;
    if (v18 == enum case for Fence.Trigger.arriving(_:))
    {
      (*(void (**)(char *, uint64_t))(v16 + 8))(v10, v5);
      uint64_t v20 = (id *)&FMFFenceTriggerArriving;
    }
    else
    {
      if (v18 != enum case for Fence.Trigger.leaving(_:))
      {
        _s5ErrorOMa();
        sub_1000691A4();
        swift_allocError();
        v17(v25, v10, v5);
        swift_storeEnumTagMultiPayload();
        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v16 + 8))(v8, v5);
        return v19;
      }
      (*(void (**)(char *, uint64_t))(v16 + 8))(v10, v5);
      uint64_t v20 = (id *)&FMFFenceTriggerLeaving;
    }
    return *v20;
  }
  else if (v14 == enum case for Fence.Variant.scheduled(_:))
  {
    uint64_t v21 = *(void (**)(char *, uint64_t))(v2 + 8);
    id v19 = FMFFenceTriggerScheduled;
    v21(v4, v1);
  }
  else
  {
    uint64_t v22 = v11;
    unint64_t v23 = (void (*)(uint64_t, uint64_t, uint64_t))v13;
    id v19 = (id)_s5ErrorOMa();
    sub_1000691A4();
    swift_allocError();
    v23(v24, v22, v1);
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  return v19;
}

id sub_100061820()
{
  uint64_t v0 = type metadata accessor for TimeZone();
  uint64_t v33 = *(void *)(v0 - 8);
  uint64_t v34 = v0;
  __chkstk_darwin(v0);
  uint64_t v32 = (char *)&v28 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = type metadata accessor for Fence.TimeOfDay();
  uint64_t v30 = *(void *)(v2 - 8);
  uint64_t v31 = v2;
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Fence.DaysOfWeek();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Fence.Variant();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for Fence.Schedule();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v35, v9);
  if ((*(unsigned int (**)(char *, uint64_t))(v10 + 88))(v12, v9) == enum case for Fence.Variant.scheduled(_:))
  {
    (*(void (**)(char *, uint64_t))(v10 + 96))(v12, v9);
    uint64_t v28 = v13;
    uint64_t v29 = v14;
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v12, v13);
    id v17 = [objc_allocWithZone((Class)FMFSchedule) init];
    Fence.Schedule.daysOfWeek.getter();
    unsigned __int8 v18 = Fence.DaysOfWeek.rawValue.getter();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    [v17 setDaysOfWeek:v18];
    Fence.Schedule.start.getter();
    uint64_t v19 = Fence.TimeOfDay.hour.getter();
    uint64_t v20 = v31;
    uint64_t v21 = *(void (**)(char *, uint64_t))(v30 + 8);
    v21(v4, v31);
    [v17 setStartHour:v19];
    Fence.Schedule.start.getter();
    uint64_t v22 = Fence.TimeOfDay.minute.getter();
    v21(v4, v20);
    [v17 setStartMin:v22];
    Fence.Schedule.end.getter();
    uint64_t v23 = Fence.TimeOfDay.hour.getter();
    v21(v4, v20);
    [v17 setEndHour:v23];
    Fence.Schedule.end.getter();
    uint64_t v24 = Fence.TimeOfDay.minute.getter();
    v21(v4, v20);
    [v17 setEndMin:v24];
    uint64_t v25 = v32;
    Fence.Schedule.timeZone.getter();
    Class isa = TimeZone._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v33 + 8))(v25, v34);
    [v17 setTimeZone:isa];

    (*(void (**)(char *, uint64_t))(v29 + 8))(v16, v28);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    return 0;
  }
  return v17;
}

uint64_t sub_100061D34()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Fence.MonitorRegion.Source();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v6(v5, v1, v2);
  int v7 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  uint64_t result = 0;
  if (v7 != enum case for Fence.MonitorRegion.Source.unknown(_:))
  {
    if (v7 == enum case for Fence.MonitorRegion.Source.currentLocation(_:))
    {
      return 1;
    }
    else if (v7 == enum case for Fence.MonitorRegion.Source.friendLocation(_:))
    {
      return 2;
    }
    else if (v7 == enum case for Fence.MonitorRegion.Source.labelledLocation(_:))
    {
      return 3;
    }
    else if (v7 == enum case for Fence.MonitorRegion.Source.addressBook(_:))
    {
      return 4;
    }
    else if (v7 == enum case for Fence.MonitorRegion.Source.custom(_:))
    {
      return 5;
    }
    else if (v7 == enum case for Fence.MonitorRegion.Source.droppedPin(_:))
    {
      return 6;
    }
    else if (v7 == enum case for Fence.MonitorRegion.Source.tool(_:))
    {
      return 7;
    }
    else
    {
      _s5ErrorOMa();
      sub_1000691A4();
      swift_allocError();
      v6(v9, v1, v2);
      swift_storeEnumTagMultiPayload();
      swift_willThrow();
      return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
  }
  return result;
}

void sub_100061F88(void *a1)
{
  id v42 = a1;
  uint64_t v2 = type metadata accessor for Fence.Participant();
  uint64_t v43 = *(void *)(v2 - 8);
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v5 = &v38[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = __chkstk_darwin(v3);
  uint64_t v8 = &v38[-v7];
  __chkstk_darwin(v6);
  uint64_t v10 = &v38[-v9];
  id v11 = [self sharedInstance];
  if (!v11)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  uint64_t v12 = v11;
  id v13 = [v11 account];

  if (v13)
  {
    id v14 = [v13 dsid];

    if (v14)
    {
      uint64_t v15 = Fence.others.getter();
      unint64_t v16 = (unint64_t)sub_100059884(v15);
      swift_bridgeObjectRelease();
      if (v1)
      {

        return;
      }
      if (v16 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v37 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        if (v37) {
          goto LABEL_10;
        }
      }
      else if (*(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
LABEL_10:
        unint64_t v41 = v16;
        Fence.createdBy.getter();
        id v17 = *(uint64_t (**)(unsigned char *, uint64_t))(v43 + 88);
        int v18 = v17(v10, v2);
        if (v18 == enum case for Fence.Participant.me(_:))
        {
          id v19 = v42;
          int v20 = v18;
          [v42 setFromMe:1];
          [v19 setCreatedByIdentifier:v14];

          Fence.findee.getter();
          int v21 = v17(v8, v2);
          if (v21 == v20)
          {
            Class isa = Array._bridgeToObjectiveC()().super.isa;
            [v19 setFollowerIds:isa];

            NSString v23 = String._bridgeToObjectiveC()();
            [v19 setFriendIdentifier:v23];

            sub_100068ADC(0, &qword_1000BB3C0);
            v24.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
            swift_bridgeObjectRelease();
LABEL_30:
            [v19 setRecipients:v24.super.isa];

            return;
          }
          unint64_t v30 = v41;
          if (v21 != enum case for Fence.Participant.other(_:))
          {
            swift_bridgeObjectRelease();
            _s5ErrorOMa();
            sub_1000691A4();
            swift_allocError();
            Fence.findee.getter();
            swift_storeEnumTagMultiPayload();
            swift_willThrow();
            (*(void (**)(unsigned char *, uint64_t))(v43 + 8))(v8, v2);
            return;
          }
          Class v31 = Array._bridgeToObjectiveC()().super.isa;
          [v19 setFollowerIds:v31];

          if ((v30 & 0xC000000000000001) == 0)
          {
            if (*(void *)((v30 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
              goto LABEL_24;
            }
            __break(1u);
          }
LABEL_36:
          id v33 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          goto LABEL_25;
        }
        uint64_t v40 = v17;
        if (v18 != enum case for Fence.Participant.other(_:))
        {
          swift_bridgeObjectRelease();

          _s5ErrorOMa();
          sub_1000691A4();
          swift_allocError();
          Fence.createdBy.getter();
          swift_storeEnumTagMultiPayload();
          swift_willThrow();
          (*(void (**)(unsigned char *, uint64_t))(v43 + 8))(v10, v2);
          return;
        }
        int v39 = v18;
        int v25 = enum case for Fence.Participant.me(_:);

        id v19 = v42;
        [v42 setFromMe:0];
        NSString v26 = String._bridgeToObjectiveC()();
        [v19 setCreatedByIdentifier:v26];

        Fence.findee.getter();
        int v27 = v40(v5, v2);
        if (v27 == v25)
        {
          sub_100059AA0(v41, (SEL *)&selRef_serverId);
          swift_bridgeObjectRelease();
          Class v28 = Array._bridgeToObjectiveC()().super.isa;
          swift_bridgeObjectRelease();
          [v19 setFollowerIds:v28];

          NSString v29 = String._bridgeToObjectiveC()();
          [v19 setFriendIdentifier:v29];

LABEL_29:
          sub_100068ADC(0, &qword_1000BB3C0);
          v24.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
          goto LABEL_30;
        }
        unint64_t v30 = v41;
        if (v27 != v39)
        {
          swift_bridgeObjectRelease();
          _s5ErrorOMa();
          sub_1000691A4();
          swift_allocError();
          Fence.findee.getter();
          swift_storeEnumTagMultiPayload();
          swift_willThrow();
          (*(void (**)(unsigned char *, uint64_t))(v43 + 8))(v5, v2);
          return;
        }
        Class v32 = Array._bridgeToObjectiveC()().super.isa;
        [v19 setFollowerIds:v32];

        if ((v30 & 0xC000000000000001) != 0) {
          goto LABEL_36;
        }
        if (*(void *)((v30 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
LABEL_24:
          id v33 = *(id *)(v30 + 32);
LABEL_25:
          uint64_t v34 = v33;
          swift_bridgeObjectRelease();
          id v35 = [v34 serverId];

          if (v35)
          {
            static String._unconditionallyBridgeFromObjectiveC(_:)();
          }
          NSString v36 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease();
          [v19 setFriendIdentifier:v36];

          goto LABEL_29;
        }
        __break(1u);
        goto LABEL_38;
      }
      swift_bridgeObjectRelease();

      _s5ErrorOMa();
      sub_1000691A4();
      swift_allocError();
    }
    else
    {
      _s5ErrorOMa();
      sub_1000691A4();
      swift_allocError();
    }
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    return;
  }
LABEL_39:
  __break(1u);
}

void *sub_100062740(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = &_swiftEmptyArrayStorage;
  if (v1)
  {
    uint64_t v9 = &_swiftEmptyArrayStorage;
    sub_100065654(0, v1, 0);
    uint64_t v2 = &_swiftEmptyArrayStorage;
    uint64_t v4 = a1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_100065654(0, v2[2] + 1, 1);
        uint64_t v2 = v9;
      }
      unint64_t v6 = v2[2];
      unint64_t v5 = v2[3];
      if (v6 >= v5 >> 1)
      {
        sub_100065654(v5 > 1, v6 + 1, 1);
        uint64_t v2 = v9;
      }
      v4 += 16;
      v2[2] = v6 + 1;
      sub_100069200(&v8, &v2[4 * v6 + 4]);
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_100062868(uint64_t a1, uint64_t a2)
{
  return sub_100062C68(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_10006288C(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t sub_100062904(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_100062984@<X0>(void *a1@<X8>)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1000629CC()
{
  uint64_t v0 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v2 = v1;
  if (v0 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_100062A5C@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100062AA4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100062AD0(uint64_t a1)
{
  uint64_t v2 = sub_100068F54(&qword_1000BB5F8, type metadata accessor for FMFFenceAcceptanceStatus);
  uint64_t v3 = sub_100068F54(&qword_1000BB600, type metadata accessor for FMFFenceAcceptanceStatus);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100062B8C(uint64_t a1)
{
  uint64_t v2 = sub_100068F54(&qword_1000BB608, type metadata accessor for FMFFenceTrigger);
  uint64_t v3 = sub_100068F54((unint64_t *)&unk_1000BB610, type metadata accessor for FMFFenceTrigger);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100062C50(uint64_t a1, uint64_t a2)
{
  return sub_100062C68(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100062C68(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100062CAC()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100062D00()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100062D74(uint64_t a1, int *a2)
{
  unint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_100062E50;
  return v6(a1);
}

uint64_t sub_100062E50()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

char *sub_100062F48(char *result, int64_t a2, char a3, char *a4)
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
      sub_100059F80(&qword_1000BB498);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      id v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      id v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 32]) {
          memmove(v13, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_1000664A0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_100063058(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    id v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100059F80(&qword_1000BB4D0);
  uint64_t v10 = *(void *)(type metadata accessor for PersonHandle() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  id v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  void v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for PersonHandle() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1000666E8(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_1000632C0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100063394(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10006943C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_10006943C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000693EC((uint64_t)v12);
  return v7;
}

uint64_t sub_100063394(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100063550(a5, a6);
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
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
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

uint64_t sub_100063550(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000635E8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000637C8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000637C8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000635E8(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100063760(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100063760(uint64_t a1, uint64_t a2)
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
  sub_100059F80(&qword_1000BB510);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1000637C8(char a1, int64_t a2, char a3, char *a4)
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
    sub_100059F80(&qword_1000BB510);
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
  id v13 = a4 + 32;
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100063918(void *a1, void *a2)
{
  unint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v8 = a2;
    uint64_t v9 = __CocoaSet.member(for:)();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_100068ADC(0, &qword_1000BB3D0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v27;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = __CocoaSet.count.getter();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    Swift::Int v22 = sub_100063BB8(v7, result + 1);
    Class v28 = (void *)v22;
    if (*(void *)(v22 + 24) <= *(void *)(v22 + 16))
    {
      id v26 = v8;
      sub_100063DB0();
      NSString v23 = v28;
    }
    else
    {
      NSString v23 = (void *)v22;
      id v24 = v8;
    }
    sub_10006444C((uint64_t)v8, v23);
    uint64_t *v3 = (uint64_t)v23;
  }
  else
  {
    Swift::Int v11 = *(void *)(v6 + 40);
    swift_bridgeObjectRetain();
    Swift::Int v12 = NSObject._rawHashValue(seed:)(v11);
    uint64_t v13 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v14 = v12 & ~v13;
    if ((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
    {
      sub_100068ADC(0, &qword_1000BB3D0);
      id v15 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
      char v16 = static NSObject.== infix(_:_:)();

      if (v16)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        int v20 = *(void **)(*(void *)(*v3 + 48) + 8 * v14);
        *a1 = v20;
        id v21 = v20;
        return 0;
      }
      uint64_t v17 = ~v13;
      while (1)
      {
        unint64_t v14 = (v14 + 1) & v17;
        if (((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14) & 1) == 0) {
          break;
        }
        id v18 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
        char v19 = static NSObject.== infix(_:_:)();

        if (v19) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v29 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    id v8 = a2;
    sub_1000644D0((uint64_t)v8, v14, isUniquelyReferenced_nonNull_native);
    uint64_t *v3 = v29;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

Swift::Int sub_100063BB8(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_100059F80(&qword_1000BB490);
    uint64_t v2 = static _SetStorage.convert(_:capacity:)();
    uint64_t v14 = v2;
    __CocoaSet.makeIterator()();
    if (__CocoaSet.Iterator.next()())
    {
      sub_100068ADC(0, &qword_1000BB3D0);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_100063DB0();
          uint64_t v2 = v14;
        }
        Swift::Int result = NSObject._rawHashValue(seed:)(*(void *)(v2 + 40));
        uint64_t v4 = v2 + 56;
        uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v6 = result & ~v5;
        unint64_t v7 = v6 >> 6;
        if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v9 = 0;
          unint64_t v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v11 = v7 == v10;
            if (v7 == v10) {
              unint64_t v7 = 0;
            }
            v9 |= v11;
            uint64_t v12 = *(void *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
        ++*(void *)(v2 + 16);
      }
      while (__CocoaSet.Iterator.next()());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return (Swift::Int)&_swiftEmptySetSingleton;
  }
  return v2;
}

uint64_t sub_100063DB0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100059F80(&qword_1000BB490);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    Class v28 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    unint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v15 = v14 | (v12 << 6);
      }
      else
      {
        int64_t v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          int64_t v12 = v16 + 1;
          if (v16 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v17 = v6[v12];
          if (!v17)
          {
            int64_t v12 = v16 + 2;
            if (v16 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v17 = v6[v12];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v28;
                uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v6 = -1 << v27;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v12 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v6[v12];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      uint64_t v19 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
      uint64_t result = NSObject._rawHashValue(seed:)(*(void *)(v4 + 40));
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v20) >> 6;
        do
        {
          if (++v22 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v25 = v22 == v24;
          if (v22 == v24) {
            unint64_t v22 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_100064050()
{
  uint64_t v1 = v0;
  uint64_t v42 = type metadata accessor for PersonHandle();
  uint64_t v2 = *(void *)(v42 - 8);
  __chkstk_darwin(v42);
  unint64_t v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  sub_100059F80(&qword_1000BB4C8);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 56);
    uint64_t v37 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & v8;
    id v35 = v0;
    int64_t v36 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v39 = v2;
    uint64_t v11 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    uint64_t v38 = v6;
    unint64_t v14 = v41;
    uint64_t v15 = v42;
    while (1)
    {
      if (v10)
      {
        unint64_t v17 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        int64_t v40 = v13;
        unint64_t v18 = v17 | (v13 << 6);
      }
      else
      {
        int64_t v19 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v19 >= v36) {
          goto LABEL_33;
        }
        unint64_t v20 = v37[v19];
        int64_t v21 = v13 + 1;
        if (!v20)
        {
          int64_t v21 = v13 + 2;
          if (v13 + 2 >= v36) {
            goto LABEL_33;
          }
          unint64_t v20 = v37[v21];
          if (!v20)
          {
            int64_t v21 = v13 + 3;
            if (v13 + 3 >= v36) {
              goto LABEL_33;
            }
            unint64_t v20 = v37[v21];
            if (!v20)
            {
              uint64_t v22 = v13 + 4;
              if (v13 + 4 >= v36)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v35;
                uint64_t v34 = 1 << *(unsigned char *)(v4 + 32);
                if (v34 > 63) {
                  bzero(v37, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v37 = -1 << v34;
                }
                *(void *)(v4 + 16) = 0;
                break;
              }
              unint64_t v20 = v37[v22];
              if (!v20)
              {
                while (1)
                {
                  int64_t v21 = v22 + 1;
                  if (__OFADD__(v22, 1)) {
                    goto LABEL_39;
                  }
                  if (v21 >= v36) {
                    goto LABEL_33;
                  }
                  unint64_t v20 = v37[v21];
                  ++v22;
                  if (v20) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v21 = v13 + 4;
            }
          }
        }
LABEL_23:
        unint64_t v10 = (v20 - 1) & v20;
        int64_t v40 = v21;
        unint64_t v18 = __clz(__rbit64(v20)) + (v21 << 6);
      }
      uint64_t v23 = v4;
      uint64_t v24 = *(void *)(v4 + 48);
      uint64_t v25 = *(void *)(v39 + 72);
      uint64_t v26 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 32);
      v26(v14, v24 + v25 * v18, v15);
      uint64_t v6 = v38;
      sub_100068F54(&qword_1000BB4B0, (void (*)(uint64_t))&type metadata accessor for PersonHandle);
      uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
      uint64_t v27 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v28 = result & ~v27;
      unint64_t v29 = v28 >> 6;
      if (((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v30 = 0;
        unint64_t v31 = (unint64_t)(63 - v27) >> 6;
        do
        {
          if (++v29 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v32 = v29 == v31;
          if (v29 == v31) {
            unint64_t v29 = 0;
          }
          v30 |= v32;
          uint64_t v33 = *(void *)(v11 + 8 * v29);
        }
        while (v33 == -1);
        unint64_t v16 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(void *)(v11 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v26)(*(void *)(v6 + 48) + v16 * v25, v41, v42);
      ++*(void *)(v6 + 16);
      uint64_t v4 = v23;
      int64_t v13 = v40;
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v6;
  return result;
}

unint64_t sub_10006444C(uint64_t a1, void *a2)
{
  NSObject._rawHashValue(seed:)(a2[5]);
  unint64_t result = _HashTable.nextHole(atOrAfter:)();
  *(void *)((char *)a2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 56) |= 1 << result;
  *(void *)(a2[6] + 8 * result) = a1;
  ++a2[2];
  return result;
}

void sub_1000644D0(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_100063DB0();
  }
  else
  {
    if (v7 > v6)
    {
      sub_1000648F8();
      goto LABEL_14;
    }
    sub_100064D48();
  }
  uint64_t v8 = *v3;
  Swift::Int v9 = NSObject._rawHashValue(seed:)(*(void *)(*v3 + 40));
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_100068ADC(0, &qword_1000BB3D0);
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = static NSObject.== infix(_:_:)();

    if (v12)
    {
LABEL_13:
      ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
    }
    else
    {
      uint64_t v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v14 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
        char v15 = static NSObject.== infix(_:_:)();

        if (v15) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v16 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v16 + 48) + 8 * a2) = a1;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18) {
    __break(1u);
  }
  else {
    *(void *)(v16 + 16) = v19;
  }
}

uint64_t sub_100064658(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v31 = a1;
  uint64_t v6 = type metadata accessor for PersonHandle();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  Swift::Int v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  unint64_t v28 = v3;
  uint64_t v29 = v7;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_100064050();
  }
  else
  {
    if (v11 > v10)
    {
      sub_100064AA4();
      goto LABEL_12;
    }
    sub_100064FC4();
  }
  uint64_t v12 = *v3;
  sub_100068F54(&qword_1000BB4B0, (void (*)(uint64_t))&type metadata accessor for PersonHandle);
  uint64_t v13 = dispatch thunk of Hashable._rawHashValue(seed:)();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  uint64_t v30 = v12;
  uint64_t v15 = v12 + 56;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v16 = ~v14;
    uint64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v18 = v7 + 16;
    uint64_t v17 = v19;
    uint64_t v20 = *(void *)(v18 + 56);
    do
    {
      v17(v9, *(void *)(v30 + 48) + v20 * a2, v6);
      sub_100068F54(&qword_1000BB4B8, (void (*)(uint64_t))&type metadata accessor for PersonHandle);
      char v21 = dispatch thunk of static Equatable.== infix(_:_:)();
      (*(void (**)(char *, uint64_t))(v18 - 8))(v9, v6);
      if (v21) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v16;
    }
    while (((*(void *)(v15 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v22 = v29;
  uint64_t v23 = *v28;
  *(void *)(v23 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v22 + 32))(*(void *)(v23 + 48) + *(void *)(v22 + 72) * a2, v31, v6);
  uint64_t v25 = *(void *)(v23 + 16);
  BOOL v26 = __OFADD__(v25, 1);
  uint64_t v27 = v25 + 1;
  if (!v26)
  {
    *(void *)(v23 + 16) = v27;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

id sub_1000648F8()
{
  uint64_t v1 = v0;
  sub_100059F80(&qword_1000BB490);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_100064AA4()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for PersonHandle();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100059F80(&qword_1000BB4C8);
  uint64_t v6 = *v0;
  uint64_t v7 = static _SetStorage.copy(original:)();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    id result = (void *)swift_release();
LABEL_27:
    uint64_t *v1 = v8;
    return result;
  }
  uint64_t v22 = v1;
  id result = (void *)(v7 + 56);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v10) {
    id result = memmove(result, (const void *)(v6 + 56), 8 * v10);
  }
  uint64_t v23 = v6 + 56;
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 56);
  int64_t v24 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v18 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v18 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v18);
    ++v11;
    if (!v19)
    {
      int64_t v11 = v18 + 1;
      if (v18 + 1 >= v24) {
        goto LABEL_25;
      }
      unint64_t v19 = *(void *)(v23 + 8 * v11);
      if (!v19)
      {
        int64_t v11 = v18 + 2;
        if (v18 + 2 >= v24) {
          goto LABEL_25;
        }
        unint64_t v19 = *(void *)(v23 + 8 * v11);
        if (!v19) {
          break;
        }
      }
    }
LABEL_24:
    unint64_t v14 = (v19 - 1) & v19;
    unint64_t v16 = __clz(__rbit64(v19)) + (v11 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v3 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v17, v2);
    id result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v17, v5, v2);
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v24)
  {
LABEL_25:
    id result = (void *)swift_release();
    uint64_t v1 = v22;
    goto LABEL_27;
  }
  unint64_t v19 = *(void *)(v23 + 8 * v20);
  if (v19)
  {
    int64_t v11 = v20;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v11 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v11 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v11);
    ++v20;
    if (v19) {
      goto LABEL_24;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_100064D48()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100059F80(&qword_1000BB490);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  unint64_t v28 = v0;
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v12);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    Swift::Int v19 = *(void *)(v4 + 40);
    id v20 = *(id *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = NSObject._rawHashValue(seed:)(v19);
    uint64_t v21 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v26 = v23 == v25;
        if (v23 == v25) {
          unint64_t v23 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v10 + 8 * v23);
      }
      while (v27 == -1);
      unint64_t v13 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(void *)(*(void *)(v4 + 48) + 8 * v13) = v20;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v28;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_100064FC4()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for PersonHandle();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  sub_100059F80(&qword_1000BB4C8);
  uint64_t v7 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v8;
    return result;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v10 = *(void *)(v6 + 56);
  uint64_t v34 = v0;
  uint64_t v35 = v6 + 56;
  if (v9 < 64) {
    uint64_t v11 = ~(-1 << v9);
  }
  else {
    uint64_t v11 = -1;
  }
  unint64_t v12 = v11 & v10;
  int64_t v36 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v37 = v3 + 16;
  uint64_t v13 = v7 + 56;
  uint64_t v38 = v3;
  unint64_t v14 = (uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32);
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  while (1)
  {
    if (v12)
    {
      unint64_t v18 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v19 = v18 | (v16 << 6);
      goto LABEL_24;
    }
    int64_t v20 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v20 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v20);
    ++v16;
    if (!v21)
    {
      int64_t v16 = v20 + 1;
      if (v20 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v21 = *(void *)(v35 + 8 * v16);
      if (!v21)
      {
        int64_t v16 = v20 + 2;
        if (v20 + 2 >= v36) {
          goto LABEL_33;
        }
        unint64_t v21 = *(void *)(v35 + 8 * v16);
        if (!v21) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v19 = __clz(__rbit64(v21)) + (v16 << 6);
LABEL_24:
    uint64_t v23 = v6;
    uint64_t v24 = *(void *)(v6 + 48);
    uint64_t v25 = *(void *)(v38 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v38 + 16))(v5, v24 + v25 * v19, v2);
    sub_100068F54(&qword_1000BB4B0, (void (*)(uint64_t))&type metadata accessor for PersonHandle);
    uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
    uint64_t v26 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v13 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v17 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t result = (*v14)(*(void *)(v8 + 48) + v17 * v25, v5, v2);
    ++*(void *)(v8 + 16);
    uint64_t v6 = v23;
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v36)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v34;
    goto LABEL_35;
  }
  unint64_t v21 = *(void *)(v35 + 8 * v22);
  if (v21)
  {
    int64_t v16 = v22;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v16 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v16 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v16);
    ++v22;
    if (v21) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

BOOL sub_100065374(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v38 = a1;
  uint64_t v39 = type metadata accessor for Fence.ID();
  uint64_t v6 = *(void *)(v39 - 8);
  __chkstk_darwin(v39);
  uint64_t v8 = (char *)v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100059F80(&qword_1000BB4E8);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void *)(a3 + 16);
  if (v12)
  {
    unint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
    uint64_t v13 = v6 + 16;
    uint64_t v37 = v14;
    uint64_t v15 = a3 + ((*(unsigned __int8 *)(v13 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 64));
    uint64_t v16 = *(void *)(v13 + 56);
    uint64_t v34 = v8;
    uint64_t v35 = (uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 32);
    uint64_t v31 = v16;
    uint64_t v32 = (void (**)(char *))(v13 + 16);
    uint64_t v33 = (void (**)(char *, uint64_t))(v13 - 8);
    v29[2] = a3;
    swift_bridgeObjectRetain();
    int64_t v36 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 40);
    v29[1] = (v13 + 40) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    while (1)
    {
      uint64_t v17 = v39;
      uint64_t v18 = v13;
      v37(v11, v15, v39);
      unint64_t v19 = *v36;
      (*v36)(v11, 0, 1, v17);
      int v20 = (*v35)(v11, 1, v17);
      BOOL v21 = v20 != 1;
      if (v20 == 1) {
        break;
      }
      unint64_t v30 = v19;
      int64_t v22 = v11;
      uint64_t v23 = v34;
      uint64_t v24 = v22;
      (*v32)(v34);
      char v25 = v38(v23);
      if (v4)
      {
        (*v33)(v23, v17);
        swift_bridgeObjectRelease();
        return v21;
      }
      char v26 = v25;
      (*v33)(v23, v17);
      if (v26) {
        break;
      }
      v15 += v31;
      --v12;
      uint64_t v4 = 0;
      uint64_t v13 = v18;
      uint64_t v11 = v24;
      if (!v12)
      {
        v30(v24, 1, 1, v39);
        goto LABEL_9;
      }
    }
  }
  else
  {
    unint64_t v27 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
    swift_bridgeObjectRetain();
    v27(v11, 1, 1, v39);
LABEL_9:
    BOOL v21 = 0;
  }
  swift_bridgeObjectRelease();
  return v21;
}

uint64_t sub_100065654(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100065DF0(a1, a2, a3, *v3);
  uint64_t *v3 = (char *)result;
  return result;
}

uint64_t sub_100065674(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100065F60(a1, a2, a3, (void *)*v3, &qword_1000BB4D0, (uint64_t (*)(void))&type metadata accessor for PersonHandle);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_1000656B4()
{
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v5 = v0[6];
  uint64_t v4 = v0[7];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_10006A97C;
  return sub_10005E4EC((uint64_t)v6, v7, v8, v2, v3, v5, v4);
}

unint64_t sub_100065760()
{
  unint64_t result = qword_1000BB348;
  if (!qword_1000BB348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000BB348);
  }
  return result;
}

uint64_t sub_1000657B8()
{
  uint64_t v2 = *(void *)(type metadata accessor for UUID() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v2 + 64);
  uint64_t v5 = *(void *)(type metadata accessor for Fence.TriggerPosition() - 8);
  unint64_t v6 = (v3 + v4 + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v0 + 32);
  uint64_t v8 = v0 + v3;
  uint64_t v9 = v0 + v6;
  uint64_t v10 = (uint64_t *)(v0 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v11 = *v10;
  uint64_t v12 = v10[1];
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v13;
  *uint64_t v13 = v1;
  v13[1] = sub_10006A97C;
  return sub_10005F6D0((uint64_t)v13, v14, v15, v7, v8, v9, v11, v12);
}

uint64_t sub_100065934(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100059F80(&qword_1000BB368);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000659A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100059F80(&qword_1000BB368);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100065A08()
{
  uint64_t v2 = *(void *)(sub_100059F80(&qword_1000BB368) - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v4 = (*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v5 = *(void *)(v0 + 32);
  uint64_t v6 = *(void *)(v0 + 40);
  uint64_t v7 = *(void *)(v0 + v4);
  uint64_t v8 = v0 + v3;
  uint64_t v9 = *(void *)(v0 + ((v4 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v10;
  *uint64_t v10 = v1;
  v10[1] = sub_10006A97C;
  return sub_10006008C((uint64_t)v10, v11, v12, v5, v6, v8, v7, v9);
}

uint64_t type metadata accessor for FindMyLocateShims()
{
  return self;
}

uint64_t sub_100065B68(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 1u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for FindMyLocateShims.Error(uint64_t a1)
{
  return sub_100065B90(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_100065B90(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 1u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s4fmfd17FindMyLocateShimsC5ErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_100065B68(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for FindMyLocateShims.Error(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_100065B68(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_100065B90(v6, v7, v8);
  return a1;
}

__n128 initializeWithTake for FindMyLocateShims.Error(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for FindMyLocateShims.Error(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_100065B90(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for FindMyLocateShims.Error(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for FindMyLocateShims.Error(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_100065D34(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_100065D50(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)__n128 result = a2 - 2;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for FindMyLocateShims.Error()
{
  return &type metadata for FindMyLocateShims.Error;
}

uint64_t sub_100065D78(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100065F60(a1, a2, a3, (void *)*v3, &qword_1000BB500, (uint64_t (*)(void))&type metadata accessor for Fence.ID);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_100065DB4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100065F60(a1, a2, a3, (void *)*v3, &qword_1000BB4C0, (uint64_t (*)(void))&type metadata accessor for Fence);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_100065DF0(char a1, int64_t a2, char a3, char *a4)
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
    sub_100059F80(&qword_1000BB4A0);
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
  uint64_t v14 = a4 + 32;
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100065F60(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t (*a6)(void))
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (!v12)
  {
    uint64_t v16 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100059F80(a5);
  uint64_t v13 = *(void *)(a6(0) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v16 = (void *)swift_allocObject();
  size_t v17 = j__malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_34;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  uint64_t v19 = *(void *)(a6(0) - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  BOOL v21 = (char *)v16 + v20;
  int64_t v22 = (char *)a4 + v20;
  if (a1)
  {
    if (v16 < a4 || v21 >= &v22[*(void *)(v19 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v23 = *(void *)(v19 + 72) * v11;
  uint64_t v24 = &v21[v23];
  unint64_t v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v16;
  }
LABEL_36:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1000661A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PersonHandle();
  uint64_t v5 = __chkstk_darwin(v4);
  int64_t v7 = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  int64_t v10 = (char *)v23 - v9;
  if (!*(void *)(a2 + 16)) {
    return 1;
  }
  uint64_t v24 = *(void *)(a1 + 16);
  if (!v24) {
    return 1;
  }
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  uint64_t v11 = v8 + 16;
  uint64_t v25 = a1 + ((*(unsigned __int8 *)(v11 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 64));
  uint64_t v28 = *(void *)(v11 + 56);
  char v29 = v12;
  uint64_t v27 = a2 + 56;
  uint64_t v13 = (void (**)(char *, uint64_t))(v11 - 8);
  v23[1] = a1;
  swift_bridgeObjectRetain();
  uint64_t v14 = 0;
  while (1)
  {
    uint64_t v26 = v14;
    v29(v10, v25 + v28 * v14, v4);
    if (*(void *)(a2 + 16))
    {
      sub_100068F54(&qword_1000BB4B0, (void (*)(uint64_t))&type metadata accessor for PersonHandle);
      uint64_t v15 = dispatch thunk of Hashable._rawHashValue(seed:)();
      uint64_t v16 = -1 << *(unsigned char *)(a2 + 32);
      unint64_t v17 = v15 & ~v16;
      if ((*(void *)(v27 + ((v17 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v17)) {
        break;
      }
    }
LABEL_4:
    uint64_t v14 = v26 + 1;
    (*v13)(v10, v4);
    if (v14 == v24)
    {
      uint64_t v21 = 1;
      goto LABEL_13;
    }
  }
  uint64_t v18 = ~v16;
  while (1)
  {
    v29(v7, *(void *)(a2 + 48) + v17 * v28, v4);
    sub_100068F54(&qword_1000BB4B8, (void (*)(uint64_t))&type metadata accessor for PersonHandle);
    char v19 = dispatch thunk of static Equatable.== infix(_:_:)();
    unint64_t v20 = *v13;
    (*v13)(v7, v4);
    if (v19) {
      break;
    }
    unint64_t v17 = (v17 + 1) & v18;
    if (((*(void *)(v27 + ((v17 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v17) & 1) == 0) {
      goto LABEL_4;
    }
  }
  v20(v10, v4);
  uint64_t v21 = 0;
LABEL_13:
  swift_bridgeObjectRelease();
  return v21;
}

uint64_t sub_1000664A0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100066594(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  sub_100068ADC(0, &qword_1000BB3D0);
  sub_100068B18();
  uint64_t result = Set.init(minimumCapacity:)();
  uint64_t v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v4) {
      return v10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v4) {
      return v10;
    }
  }
  if (v4 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        unint64_t v6 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)();
        sub_100063918(&v9, v6);
      }
    }
    else
    {
      int64_t v7 = (void **)(a1 + 32);
      do
      {
        uint64_t v8 = *v7++;
        sub_100063918(&v9, v8);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000666E8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(type metadata accessor for PersonHandle() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unint64_t *sub_100066840(void **a1)
{
  uint64_t v2 = sub_100059F80(&qword_1000BB508);
  __chkstk_darwin(v2 - 8);
  unint64_t v60 = (char *)&v56 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for PersonHandle();
  uint64_t v68 = *(void *)(v4 - 8);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v66 = (char *)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  long long v62 = (char *)&v56 - v8;
  __chkstk_darwin(v7);
  uint64_t v10 = (__objc2_prop *)((char *)&v56 - v9);
  if ([a1 isOnMe])
  {
    if ([a1 isFromMe])
    {
      id v11 = [a1 recipients];
      sub_100068ADC(0, &qword_1000BB3C0);
      unint64_t v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

      if (v12 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v13 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        if (v13) {
          goto LABEL_5;
        }
      }
      else
      {
        uint64_t v13 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (v13)
        {
LABEL_5:
          uint64_t v67 = v4;
          id v70 = (unint64_t *)&_swiftEmptyArrayStorage;
          a1 = (void **)&v70;
          uint64_t result = (unint64_t *)sub_100065674(0, v13 & ~(v13 >> 63), 0);
          if ((v13 & 0x8000000000000000) == 0)
          {
            uint64_t v15 = 0;
            uint64_t v16 = v70;
            uint64_t v66 = (char *)(v12 & 0xC000000000000001);
            while (v13 != v15)
            {
              if (v66) {
                unint64_t v17 = (void **)specialized _ArrayBuffer._getElementSlowPath(_:)();
              }
              else {
                unint64_t v17 = (void **)*(id *)(v12 + 8 * v15 + 32);
              }
              a1 = v17;
              uint64_t result = (unint64_t *)[v17 identifier];
              if (!result) {
                goto LABEL_55;
              }
              uint64_t v18 = result;
              static String._unconditionallyBridgeFromObjectiveC(_:)();

              PersonHandle.init(id:)();
              id v70 = v16;
              unint64_t v20 = v16[2];
              unint64_t v19 = v16[3];
              if (v20 >= v19 >> 1)
              {
                a1 = (void **)&v70;
                sub_100065674(v19 > 1, v20 + 1, 1);
                uint64_t v16 = v70;
              }
              ++v15;
              v16[2] = v20 + 1;
              (*(void (**)(unint64_t, __objc2_prop *, uint64_t))(v68 + 32))((unint64_t)v16+ ((*(unsigned __int8 *)(v68 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v68 + 80))+ *(void *)(v68 + 72) * v20, v10, v67);
              if (v13 == v15)
              {
                swift_bridgeObjectRelease();
                return v16;
              }
            }
            __break(1u);
LABEL_48:
            swift_once();
LABEL_23:
            uint64_t v25 = type metadata accessor for Logger();
            sub_100068F9C(v25, (uint64_t)qword_1000BB898);
            uint64_t v26 = a1;
            uint64_t v27 = Logger.logObject.getter();
            os_log_type_t v28 = static os_log_type_t.error.getter();
            if (os_log_type_enabled(v27, v28))
            {
              char v29 = (uint8_t *)swift_slowAlloc();
              id v70 = (unint64_t *)swift_slowAlloc();
              *(_DWORD *)char v29 = 136380675;
              id v30 = [v26 v10[234].name];
              uint64_t v31 = static String._unconditionallyBridgeFromObjectiveC(_:)();
              unint64_t v33 = v32;

              uint64_t v69 = sub_1000632C0(v31, v33, (uint64_t *)&v70);
              UnsafeMutableRawBufferPointer.copyMemory(from:)();

              swift_bridgeObjectRelease();
              _os_log_impl((void *)&_mh_execute_header, v27, v28, "Couldn't find handle for friendIdentifier=%{private}s", v29, 0xCu);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();
            }
            else
            {
            }
            return (unint64_t *)&_swiftEmptyArrayStorage;
          }
          __break(1u);
          goto LABEL_54;
        }
      }
    }
    else
    {
      id v34 = [a1 followerIds];
      uint64_t v35 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v36 = *(void *)(v35 + 16);
      if (v36)
      {
        unint64_t v59 = (void **)&v70;
        uint64_t v64 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v68 + 48);
        uint64_t v65 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v68 + 56);
        id v63 = (void (**)(char *, uint64_t, uint64_t))(v68 + 32);
        swift_bridgeObjectRetain();
        uint64_t v56 = v35;
        uint64_t v37 = (unint64_t *)(v35 + 40);
        uint64_t v16 = (unint64_t *)&_swiftEmptyArrayStorage;
        *(void *)&long long v38 = 136380675;
        long long v58 = v38;
        uint64_t v57 = (char *)&type metadata for Any + 8;
        uint64_t v39 = (uint64_t)v60;
        uint64_t v67 = v4;
        while (1)
        {
          uint64_t v40 = *(v37 - 1);
          unint64_t v41 = *v37;
          uint64_t result = (unint64_t *)[self sharedInstance:v56 v57];
          if (!result) {
            break;
          }
          uint64_t v42 = result;
          NSString v43 = String._bridgeToObjectiveC()();
          id v44 = [v42 followerHandleForServerId:v43];

          if (v44
            && (id v45 = [v44 identifier], v44, v45))
          {
            static String._unconditionallyBridgeFromObjectiveC(_:)();

            PersonHandle.init(id:)();
            uint64_t v46 = 0;
          }
          else
          {
            if (qword_1000BB890 != -1) {
              swift_once();
            }
            uint64_t v47 = type metadata accessor for Logger();
            sub_100068F9C(v47, (uint64_t)qword_1000BB898);
            swift_bridgeObjectRetain_n();
            unint64_t v48 = Logger.logObject.getter();
            os_log_type_t v49 = static os_log_type_t.error.getter();
            if (os_log_type_enabled(v48, v49))
            {
              unsigned int v50 = (uint8_t *)swift_slowAlloc();
              id v70 = (unint64_t *)swift_slowAlloc();
              *(_DWORD *)unsigned int v50 = v58;
              unint64_t v61 = v16;
              swift_bridgeObjectRetain();
              uint64_t v69 = sub_1000632C0(v40, v41, (uint64_t *)&v70);
              uint64_t v16 = v61;
              uint64_t v39 = (uint64_t)v60;
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              swift_bridgeObjectRelease_n();
              _os_log_impl((void *)&_mh_execute_header, v48, v49, "Couldn't find handle for followerID=%{private}s", v50, 0xCu);
              uint64_t v46 = 1;
              swift_arrayDestroy();
              swift_slowDealloc();
              uint64_t v4 = v67;
              swift_slowDealloc();
            }
            else
            {
              swift_bridgeObjectRelease_n();

              uint64_t v46 = 1;
            }
          }
          (*v65)(v39, v46, 1, v4);
          if ((*v64)(v39, 1, v4) == 1)
          {
            sub_100069390(v39, &qword_1000BB508);
          }
          else
          {
            long long v51 = v62;
            uint64_t v52 = *v63;
            (*v63)(v62, v39, v4);
            v52(v66, (uint64_t)v51, v4);
            uint64_t v53 = v36;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              uint64_t v16 = (unint64_t *)sub_100063058(0, v16[2] + 1, 1, (unint64_t)v16);
            }
            unint64_t v55 = v16[2];
            unint64_t v54 = v16[3];
            if (v55 >= v54 >> 1) {
              uint64_t v16 = (unint64_t *)sub_100063058(v54 > 1, v55 + 1, 1, (unint64_t)v16);
            }
            v16[2] = v55 + 1;
            v52((char *)v16+ ((*(unsigned __int8 *)(v68 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v68 + 80))+ *(void *)(v68 + 72) * v55, (uint64_t)v66, v4);
            uint64_t v36 = v53;
          }
          v37 += 2;
          if (!--v36)
          {
            swift_bridgeObjectRelease_n();
            return v16;
          }
        }
LABEL_54:
        __break(1u);
LABEL_55:
        __break(1u);
        goto LABEL_56;
      }
    }
    swift_bridgeObjectRelease();
    return (unint64_t *)&_swiftEmptyArrayStorage;
  }
  uint64_t result = (unint64_t *)[self sharedInstance];
  if (result)
  {
    uint64_t v21 = result;
    uint64_t v10 = &stru_1000B6000;
    NSString v22 = [a1 friendIdentifier];
    if (!v22)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)();
      NSString v22 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
    }
    id v23 = [v21 followingHandleForServerId:v22];

    if (v23)
    {
      id v24 = [v23 identifier];

      if (v24)
      {
        static String._unconditionallyBridgeFromObjectiveC(_:)();

        sub_100059F80(&qword_1000BB4D0);
        uint64_t v16 = (unint64_t *)swift_allocObject();
        *((_OWORD *)v16 + 1) = xmmword_10007E930;
        PersonHandle.init(id:)();
        return v16;
      }
    }
    if (qword_1000BB890 == -1) {
      goto LABEL_23;
    }
    goto LABEL_48;
  }
LABEL_56:
  __break(1u);
  return result;
}

uint64_t sub_10006725C(unint64_t a1, void *a2, void (**a3)(void, void, void))
{
  uint64_t v6 = type metadata accessor for PersonHandle();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100059F80(&qword_1000BB300);
  __chkstk_darwin(v10 - 8);
  unint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a3;
  if (a1)
  {
    _Block_copy(a3);
    uint64_t v14 = sub_100059AA0(a1, (SEL *)&selRef_identifier);
    int64_t v15 = *((void *)v14 + 2);
    if (v15)
    {
      uint64_t v27 = v12;
      os_log_type_t v28 = a3;
      char v29 = a2;
      uint64_t v30 = v13;
      uint64_t v31 = _swiftEmptyArrayStorage;
      sub_100065674(0, v15, 0);
      uint64_t v16 = v31;
      unint64_t v17 = v14 + 40;
      do
      {
        swift_bridgeObjectRetain();
        PersonHandle.init(id:)();
        uint64_t v31 = v16;
        unint64_t v19 = v16[2];
        unint64_t v18 = v16[3];
        if (v19 >= v18 >> 1)
        {
          sub_100065674(v18 > 1, v19 + 1, 1);
          uint64_t v16 = v31;
        }
        v17 += 16;
        v16[2] = v19 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))((unint64_t)v16+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(void *)(v7 + 72) * v19, v9, v6);
        --v15;
      }
      while (v15);
      swift_bridgeObjectRelease();
      a2 = v29;
      uint64_t v13 = v30;
      unint64_t v12 = v27;
      a3 = v28;
      if (v16[2]) {
        goto LABEL_8;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v16 = _swiftEmptyArrayStorage;
      if (_swiftEmptyArrayStorage[2])
      {
LABEL_8:
        uint64_t v20 = type metadata accessor for TaskPriority();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v12, 1, 1, v20);
        uint64_t v21 = (void *)swift_allocObject();
        void v21[2] = 0;
        v21[3] = 0;
        void v21[4] = a2;
        void v21[5] = v16;
        v21[6] = sub_100068A80;
        v21[7] = v13;
        NSString v22 = a2;
        swift_retain();
        sub_100059C84((uint64_t)v12, (uint64_t)&unk_1000BB3C8, (uint64_t)v21);
        swift_release();
        return swift_release();
      }
    }
    swift_bridgeObjectRelease();
    sub_100065760();
    swift_allocError();
    *(_OWORD *)uint64_t v24 = xmmword_10007E920;
    *(unsigned char *)(v24 + 16) = 2;
    uint64_t v25 = (void *)_convertErrorToNSError(_:)();
    ((void (**)(void, void, void *))a3)[2](a3, 0, v25);

    swift_errorRelease();
    return swift_release();
  }
  id v23 = *(void (**)(void, uint64_t))((swift_isaMask & *a2) + 0x68);
  _Block_copy(a3);
  v23(sub_100068A80, v13);

  return swift_release();
}

char *sub_100067650(uint64_t a1, uint64_t a2)
{
  uint64_t v48 = a2;
  uint64_t v4 = type metadata accessor for PersonHandle();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  unint64_t v60 = (char *)&v37 - v9;
  uint64_t v10 = type metadata accessor for Fence();
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v47 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v52 = (char *)&v37 - v14;
  uint64_t result = (char *)_swiftEmptyArrayStorage;
  long long v62 = (char *)_swiftEmptyArrayStorage;
  uint64_t v46 = *(void *)(a1 + 16);
  if (v46)
  {
    uint64_t v37 = v2;
    uint64_t v16 = 0;
    unint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
    uint64_t v17 = v13 + 16;
    uint64_t v42 = v18;
    unint64_t v39 = (*(unsigned __int8 *)(v17 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 64);
    uint64_t v41 = a1 + v39;
    uint64_t v59 = v5 + 16;
    uint64_t v49 = *(void *)(v17 + 56);
    uint64_t v57 = (void (**)(char *, uint64_t))(v5 + 8);
    long long v38 = (void (**)(char *, uint64_t))(v17 - 8);
    uint64_t v40 = (void (**)(char *, char *, uint64_t))(v17 + 16);
    uint64_t v44 = v10;
    uint64_t v45 = v5;
    uint64_t v43 = v17;
    do
    {
      uint64_t v51 = v16;
      v42(v52, v41 + v49 * v16, v10);
      uint64_t v19 = Fence.others.getter();
      uint64_t v20 = *(void *)(v19 + 16);
      uint64_t v54 = sub_100068F54(&qword_1000BB4B0, (void (*)(uint64_t))&type metadata accessor for PersonHandle);
      uint64_t v21 = Set.init(minimumCapacity:)();
      uint64_t v55 = v20;
      uint64_t v50 = v19;
      if (v20)
      {
        uint64_t v22 = 0;
        unint64_t v53 = v19 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
        uint64_t v58 = *(void *)(v5 + 72);
        id v23 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
        do
        {
          uint64_t v56 = v22;
          v23(v60, v53 + v58 * v22, v4);
          swift_bridgeObjectRetain();
          uint64_t v26 = dispatch thunk of Hashable._rawHashValue(seed:)();
          uint64_t v27 = -1 << *(unsigned char *)(v21 + 32);
          unint64_t v28 = v26 & ~v27;
          if ((*(void *)(v21 + 56 + ((v28 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v28))
          {
            uint64_t v29 = ~v27;
            while (1)
            {
              v23(v8, *(void *)(v21 + 48) + v28 * v58, v4);
              sub_100068F54(&qword_1000BB4B8, (void (*)(uint64_t))&type metadata accessor for PersonHandle);
              char v30 = dispatch thunk of static Equatable.== infix(_:_:)();
              uint64_t v31 = *v57;
              (*v57)(v8, v4);
              if (v30) {
                break;
              }
              unint64_t v28 = (v28 + 1) & v29;
              if (((*(void *)(v21 + 56 + ((v28 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v28) & 1) == 0) {
                goto LABEL_7;
              }
            }
            swift_bridgeObjectRelease();
            v31(v60, v4);
          }
          else
          {
LABEL_7:
            swift_bridgeObjectRelease();
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            uint64_t v25 = v60;
            v23(v8, (unint64_t)v60, v4);
            uint64_t v61 = v21;
            sub_100064658((uint64_t)v8, v28, isUniquelyReferenced_nonNull_native);
            uint64_t v21 = v61;
            swift_bridgeObjectRelease();
            (*v57)(v25, v4);
          }
          uint64_t v22 = v56 + 1;
        }
        while (v56 + 1 != v55);
      }
      swift_bridgeObjectRelease();
      char v32 = sub_1000661A8(v48, v21);
      swift_bridgeObjectRelease();
      if (v32)
      {
        unint64_t v33 = *v40;
        uint64_t v10 = v44;
        (*v40)(v47, v52, v44);
        id v34 = v62;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_100065DB4(0, *((void *)v34 + 2) + 1, 1);
          id v34 = v62;
        }
        unint64_t v36 = *((void *)v34 + 2);
        unint64_t v35 = *((void *)v34 + 3);
        if (v36 >= v35 >> 1)
        {
          sub_100065DB4(v35 > 1, v36 + 1, 1);
          id v34 = v62;
        }
        *((void *)v34 + 2) = v36 + 1;
        v33(&v34[v39 + v36 * v49], v47, v10);
        long long v62 = v34;
      }
      else
      {
        uint64_t v10 = v44;
        (*v38)(v52, v44);
      }
      uint64_t v5 = v45;
      uint64_t v16 = v51 + 1;
    }
    while (v51 + 1 != v46);
    return v62;
  }
  return result;
}

uint64_t sub_100067C10(uint64_t a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5, void *a6, void *a7, void (**a8)(void, void))
{
  uint64_t v95 = a7;
  uint64_t v96 = a4;
  id v101 = a6;
  uint64_t v103 = a3;
  uint64_t v10 = sub_100059F80(&qword_1000BB300);
  __chkstk_darwin(v10 - 8);
  uint64_t v97 = (uint64_t)v87 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v100 = type metadata accessor for Fence.TriggerPosition();
  uint64_t v94 = *(void *)(v100 - 8);
  uint64_t v12 = *(void *)(v94 + 64);
  uint64_t v13 = __chkstk_darwin(v100);
  id v99 = (char *)v87 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  id v98 = (char *)v87 - v14;
  uint64_t v15 = sub_100059F80(&qword_1000BB350);
  __chkstk_darwin(v15 - 8);
  uint64_t v17 = (char *)v87 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for UUID();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(void *)(v19 + 64);
  uint64_t v21 = __chkstk_darwin(v18);
  __chkstk_darwin(v21);
  id v23 = (char *)v87 - v22;
  uint64_t v102 = swift_allocObject();
  *(void *)(v102 + 16) = a8;
  _Block_copy(a8);
  uint64_t v24 = a2;
  uint64_t v25 = v103;
  UUID.init(uuidString:)();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18) != 1)
  {
    uint64_t v91 = v20;
    uint64_t v92 = v12;
    uint64_t v103 = (char *)v87 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v90 = a8;
    unint64_t v28 = *(void (**)(char *, char *, uint64_t))(v19 + 32);
    v28(v23, v17, v18);
    id v29 = v101;
    if (!v101)
    {
      sub_100065760();
      swift_allocError();
      *(void *)uint64_t v46 = 0;
      *(void *)(v46 + 8) = 0;
      *(unsigned char *)(v46 + 16) = 2;
      uint64_t v47 = (void *)_convertErrorToNSError(_:)();
      ((void (**)(void, void *))v90)[2](v90, v47);

      (*(void (**)(char *, uint64_t))(v19 + 8))(v23, v18);
      goto LABEL_10;
    }
    uint64_t v88 = v19;
    uint64_t v89 = v18;
    uint64_t v93 = v23;
    uint64_t v30 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v32 = v31;
    uint64_t v33 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v87[0] = v28;
    v87[1] = v19 + 32;
    if (v30 == v33 && v32 == v34)
    {
      id v35 = v29;
      id v36 = v29;
LABEL_7:
      uint64_t v37 = (unsigned int *)&enum case for Fence.TriggerPosition.inside(_:);
LABEL_8:
      uint64_t v39 = v102;
      long long v38 = v103;
      uint64_t v40 = v99;
      uint64_t v41 = v100;
      uint64_t v42 = v94;
      uint64_t v43 = v97;
      swift_bridgeObjectRelease_n();
      uint64_t v44 = v93;
      uint64_t v45 = v98;
      goto LABEL_14;
    }
    char v48 = _stringCompareWithSmolCheck(_:_:expecting:)();
    id v49 = v29;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v48) {
      goto LABEL_12;
    }
    uint64_t v67 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v69 = v68;
    if (v67 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v69 == v70)
    {
      id v35 = v29;
      goto LABEL_7;
    }
    char v71 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v71)
    {
LABEL_12:
      id v35 = v29;
      uint64_t v37 = (unsigned int *)&enum case for Fence.TriggerPosition.inside(_:);
    }
    else
    {
      uint64_t v72 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v74 = v73;
      if (v72 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v74 == v75)
      {
LABEL_22:
        id v35 = v29;
        uint64_t v37 = (unsigned int *)&enum case for Fence.TriggerPosition.outside(_:);
        goto LABEL_8;
      }
      char v76 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v76 & 1) == 0)
      {
        uint64_t v77 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v79 = v78;
        if (v77 != static String._unconditionallyBridgeFromObjectiveC(_:)() || v79 != v80)
        {
          char v81 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v40 = v99;
          long long v38 = v103;
          if ((v81 & 1) == 0)
          {
            uint64_t v82 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            uint64_t v84 = v83;
            sub_100065760();
            swift_allocError();
            *(void *)uint64_t v85 = v82;
            *(void *)(v85 + 8) = v84;
            *(unsigned char *)(v85 + 16) = 1;
            char v86 = (void *)_convertErrorToNSError(_:)();
            ((void (**)(void, void *))v90)[2](v90, v86);

            (*(void (**)(char *, uint64_t))(v88 + 8))(v93, v89);
            goto LABEL_10;
          }
          id v35 = v29;
          uint64_t v37 = (unsigned int *)&enum case for Fence.TriggerPosition.outside(_:);
          uint64_t v39 = v102;
          uint64_t v44 = v93;
          uint64_t v42 = v94;
          uint64_t v43 = v97;
          uint64_t v45 = v98;
          uint64_t v41 = v100;
LABEL_14:
          *(void *)uint64_t v45 = v35;
          uint64_t v50 = *v37;
          uint64_t v51 = v45;
          (*(void (**)(char *, uint64_t, uint64_t))(v42 + 104))(v45, v50, v41);
          uint64_t v52 = type metadata accessor for TaskPriority();
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v52 - 8) + 56))(v43, 1, 1, v52);
          uint64_t v53 = v41;
          uint64_t v54 = v88;
          uint64_t v55 = v89;
          (*(void (**)(char *, char *, uint64_t))(v88 + 16))(v38, v44, v89);
          (*(void (**)(char *, char *, uint64_t))(v42 + 16))(v40, v51, v53);
          unint64_t v56 = (*(unsigned __int8 *)(v54 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v54 + 80);
          uint64_t v57 = v38;
          unint64_t v58 = (v91 + *(unsigned __int8 *)(v42 + 80) + v56) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80);
          unint64_t v59 = (v92 + v58 + 7) & 0xFFFFFFFFFFFFFFF8;
          unint64_t v60 = (char *)swift_allocObject();
          *((void *)v60 + 2) = 0;
          *((void *)v60 + 3) = 0;
          uint64_t v61 = v95;
          *((void *)v60 + 4) = v95;
          ((void (*)(char *, char *, uint64_t))v87[0])(&v60[v56], v57, v55);
          uint64_t v62 = v100;
          (*(void (**)(char *, char *, uint64_t))(v42 + 32))(&v60[v58], v99, v100);
          id v63 = (uint64_t (**)())&v60[v59];
          *id v63 = sub_10006A978;
          v63[1] = (uint64_t (*)())v39;
          id v64 = v101;
          id v65 = v61;
          swift_retain();
          sub_100059C84(v97, (uint64_t)&unk_1000BB3B8, (uint64_t)v60);
          swift_release();

          (*(void (**)(char *, uint64_t))(v42 + 8))(v98, v62);
          (*(void (**)(char *, uint64_t))(v54 + 8))(v93, v55);
          return swift_release();
        }
        goto LABEL_22;
      }
      id v35 = v29;
      uint64_t v37 = (unsigned int *)&enum case for Fence.TriggerPosition.outside(_:);
    }
    uint64_t v39 = v102;
    long long v38 = v103;
    uint64_t v44 = v93;
    uint64_t v42 = v94;
    uint64_t v40 = v99;
    uint64_t v41 = v100;
    uint64_t v43 = v97;
    uint64_t v45 = v98;
    goto LABEL_14;
  }
  sub_100069390((uint64_t)v17, &qword_1000BB350);
  sub_100065760();
  swift_allocError();
  *(void *)uint64_t v26 = v24;
  *(void *)(v26 + 8) = v25;
  *(unsigned char *)(v26 + 16) = 0;
  swift_bridgeObjectRetain();
  uint64_t v27 = (void *)_convertErrorToNSError(_:)();
  ((void (**)(void, void *))a8)[2](a8, v27);

LABEL_10:
  swift_errorRelease();
  return swift_release();
}

uint64_t sub_100068450(void *a1, uint64_t a2, void *a3, void (**a4)(void, void))
{
  uint64_t v8 = sub_100059F80(&qword_1000BB368);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(v8 - 8);
  uint64_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100059F80(&qword_1000BB300);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a4;
  if (a1)
  {
    _Block_copy(a4);
    id v16 = a1;
    id v17 = [v16 identifier];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v32 = v20;

      uint64_t v21 = type metadata accessor for TaskPriority();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v14, 1, 1, v21);
      sub_100065934(a2, (uint64_t)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
      unint64_t v22 = (*(unsigned __int8 *)(v9 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
      unint64_t v23 = (v10 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v24 = (void *)swift_allocObject();
      v24[2] = 0;
      v24[3] = 0;
      uint64_t v25 = v32;
      void v24[4] = v19;
      v24[5] = v25;
      sub_1000659A0((uint64_t)v11, (uint64_t)v24 + v22);
      *(void *)((char *)v24 + v23) = a3;
      uint64_t v26 = (uint64_t (**)())((char *)v24 + ((v23 + 15) & 0xFFFFFFFFFFFFFFF8));
      *uint64_t v26 = sub_10006878C;
      v26[1] = (uint64_t (*)())v15;
      id v27 = a3;
      swift_retain();
      sub_100059C84((uint64_t)v14, (uint64_t)&unk_1000BB3B0, (uint64_t)v24);

      swift_release();
      return swift_release();
    }
  }
  else
  {
    _Block_copy(a4);
  }
  sub_100065760();
  swift_allocError();
  *(_OWORD *)uint64_t v29 = xmmword_10007E920;
  *(unsigned char *)(v29 + 16) = 2;
  uint64_t v30 = (void *)_convertErrorToNSError(_:)();
  ((void (**)(void, void *))a4)[2](a4, v30);

  swift_errorRelease();

  return swift_release();
}

uint64_t sub_100068754()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10006878C()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_1000687A4()
{
  uint64_t v1 = *(void *)(sub_100059F80(&qword_1000BB368) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 48) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = type metadata accessor for Date();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
  }
  unint64_t v7 = (v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF8;

  swift_release();

  return _swift_deallocObject(v0, v8 + 16, v2 | 7);
}

uint64_t sub_100068908()
{
  uint64_t v1 = type metadata accessor for UUID();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = type metadata accessor for Fence.TriggerPosition();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v4 + v5 + v8) & ~v8;
  uint64_t v10 = v3 | v8 | 7;
  unint64_t v11 = ((*(void *)(v7 + 64) + v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_unknownObjectRelease();

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);
  swift_release();

  return _swift_deallocObject(v0, v11, v10);
}

void sub_100068A80(uint64_t a1, uint64_t a2)
{
  sub_10005E0B4(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_100068A8C()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_100068ADC(uint64_t a1, unint64_t *a2)
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

unint64_t sub_100068B18()
{
  unint64_t result = qword_1000BB3D8;
  if (!qword_1000BB3D8)
  {
    sub_100068ADC(255, &qword_1000BB3D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000BB3D8);
  }
  return result;
}

uint64_t sub_100068B84()
{
  swift_unknownObjectRelease();

  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100068BD0()
{
  swift_unknownObjectRelease();

  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_100068C20()
{
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v5 = v0[6];
  uint64_t v4 = v0[7];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_100068CCC;
  return sub_10005CE30((uint64_t)v6, v7, v8, v2, v3, v5, v4);
}

uint64_t sub_100068CCC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100068DC0()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_100068DDC()
{
  swift_unknownObjectRelease();

  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_100068E2C()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100068E6C()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_10006A97C;
  return sub_100057A94((uint64_t)v3, v4, v5, v2);
}

unint64_t sub_100068F00()
{
  unint64_t result = qword_1000BB408;
  if (!qword_1000BB408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000BB408);
  }
  return result;
}

uint64_t sub_100068F54(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100068F9C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100068FD4()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100069014()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t result = (uint64_t)[v1 respondsToSelector:"didUpdateFences:"];
  if (result)
  {
    sub_100068ADC(0, &qword_1000BB3D0);
    sub_100068B18();
    swift_unknownObjectRetain();
    Class isa = Set._bridgeToObjectiveC()().super.isa;
    [v1 didUpdateFences:isa];

    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_1000690DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000690EC()
{
  return swift_release();
}

uint64_t *sub_1000690F4(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t _s5ErrorOMa()
{
  uint64_t result = qword_1000BB948;
  if (!qword_1000BB948) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_1000691A4()
{
  unint64_t result = qword_1000BB940;
  if (!qword_1000BB940)
  {
    _s5ErrorOMa();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000BB940);
  }
  return result;
}

_OWORD *sub_100069200(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100069210()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100069248(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100068CCC;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1000BB4D8 + dword_1000BB4D8);
  return v6(a1, v4);
}

uint64_t sub_100069300()
{
  return dispatch thunk of static Equatable.== infix(_:_:)() & 1;
}

uint64_t sub_100069390(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100059F80(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000693EC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10006943C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

char *sub_100069498(char *a1, char **a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *(void *)a1 = *a2;
    a1 = &v9[(v5 + 16) & ~(unint64_t)v5];
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 1u:
        uint64_t v7 = *a2;
        *(void *)a1 = *a2;
        uint64_t v8 = v7;
        swift_storeEnumTagMultiPayload();
        break;
      case 3u:
      case 7u:
      case 9u:
        uint64_t v15 = a2[1];
        *(void *)a1 = *a2;
        *((void *)a1 + 1) = v15;
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 4u:
        uint64_t v11 = type metadata accessor for Fence.Variant();
        (*(void (**)(char *, char **, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
        swift_storeEnumTagMultiPayload();
        break;
      case 5u:
        uint64_t v12 = type metadata accessor for Fence.AcceptanceStatus();
        (*(void (**)(char *, char **, uint64_t))(*(void *)(v12 - 8) + 16))(a1, a2, v12);
        swift_storeEnumTagMultiPayload();
        break;
      case 6u:
        uint64_t v13 = type metadata accessor for Fence.MonitorRegion.Source();
        (*(void (**)(char *, char **, uint64_t))(*(void *)(v13 - 8) + 16))(a1, a2, v13);
        swift_storeEnumTagMultiPayload();
        break;
      case 8u:
      case 0xBu:
        uint64_t v14 = type metadata accessor for Fence.Participant();
        (*(void (**)(char *, char **, uint64_t))(*(void *)(v14 - 8) + 16))(a1, a2, v14);
        swift_storeEnumTagMultiPayload();
        break;
      case 0xAu:
        uint64_t v16 = type metadata accessor for Fence.Trigger();
        (*(void (**)(char *, char **, uint64_t))(*(void *)(v16 - 8) + 16))(a1, a2, v16);
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(v6 + 64));
        break;
    }
  }
  return a1;
}

void sub_100069818(void **a1)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
    case 1u:
      uint64_t v2 = *a1;

      return;
    case 3u:
    case 7u:
    case 9u:
      swift_bridgeObjectRelease();
      return;
    case 4u:
      uint64_t v3 = type metadata accessor for Fence.Variant();
      goto LABEL_13;
    case 5u:
      uint64_t v3 = type metadata accessor for Fence.AcceptanceStatus();
      goto LABEL_13;
    case 6u:
      uint64_t v3 = type metadata accessor for Fence.MonitorRegion.Source();
      goto LABEL_13;
    case 8u:
    case 0xBu:
      uint64_t v3 = type metadata accessor for Fence.Participant();
      goto LABEL_13;
    case 0xAu:
      uint64_t v3 = type metadata accessor for Fence.Trigger();
LABEL_13:
      uint64_t v4 = *(void (**)(void **, uint64_t))(*(void *)(v3 - 8) + 8);
      v4(a1, v3);
      break;
    default:
      return;
  }
}

void **sub_100069958(void **a1, void **a2, uint64_t a3)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
    case 1u:
      uint64_t v6 = *a2;
      *a1 = *a2;
      id v7 = v6;
      goto LABEL_10;
    case 3u:
    case 7u:
    case 9u:
      uint64_t v11 = a2[1];
      *a1 = *a2;
      a1[1] = v11;
      swift_bridgeObjectRetain();
      goto LABEL_10;
    case 4u:
      uint64_t v8 = type metadata accessor for Fence.Variant();
      (*(void (**)(void **, void **, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
      goto LABEL_10;
    case 5u:
      uint64_t v9 = type metadata accessor for Fence.AcceptanceStatus();
      (*(void (**)(void **, void **, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
      goto LABEL_10;
    case 6u:
      uint64_t v10 = type metadata accessor for Fence.MonitorRegion.Source();
      (*(void (**)(void **, void **, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
      goto LABEL_10;
    case 8u:
    case 0xBu:
      uint64_t v13 = type metadata accessor for Fence.Participant();
      (*(void (**)(void **, void **, uint64_t))(*(void *)(v13 - 8) + 16))(a1, a2, v13);
      goto LABEL_10;
    case 0xAu:
      uint64_t v12 = type metadata accessor for Fence.Trigger();
      (*(void (**)(void **, void **, uint64_t))(*(void *)(v12 - 8) + 16))(a1, a2, v12);
LABEL_10:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

void **sub_100069C6C(void **a1, void **a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100069FA8((uint64_t)a1);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 1u:
        uint64_t v6 = *a2;
        *a1 = *a2;
        id v7 = v6;
        goto LABEL_11;
      case 3u:
      case 7u:
      case 9u:
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        goto LABEL_11;
      case 4u:
        uint64_t v8 = type metadata accessor for Fence.Variant();
        (*(void (**)(void **, void **, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
        goto LABEL_11;
      case 5u:
        uint64_t v9 = type metadata accessor for Fence.AcceptanceStatus();
        (*(void (**)(void **, void **, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
        goto LABEL_11;
      case 6u:
        uint64_t v10 = type metadata accessor for Fence.MonitorRegion.Source();
        (*(void (**)(void **, void **, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
        goto LABEL_11;
      case 8u:
      case 0xBu:
        uint64_t v12 = type metadata accessor for Fence.Participant();
        (*(void (**)(void **, void **, uint64_t))(*(void *)(v12 - 8) + 16))(a1, a2, v12);
        goto LABEL_11;
      case 0xAu:
        uint64_t v11 = type metadata accessor for Fence.Trigger();
        (*(void (**)(void **, void **, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
LABEL_11:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

uint64_t sub_100069FA8(uint64_t a1)
{
  uint64_t v2 = _s5ErrorOMa();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_10006A004(void *a1, const void *a2, uint64_t a3)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 4u:
      uint64_t v6 = type metadata accessor for Fence.Variant();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      goto LABEL_8;
    case 5u:
      uint64_t v7 = type metadata accessor for Fence.AcceptanceStatus();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      goto LABEL_8;
    case 6u:
      uint64_t v8 = type metadata accessor for Fence.MonitorRegion.Source();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
      goto LABEL_8;
    case 8u:
    case 0xBu:
      uint64_t v10 = type metadata accessor for Fence.Participant();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(a1, a2, v10);
      goto LABEL_8;
    case 0xAu:
      uint64_t v9 = type metadata accessor for Fence.Trigger();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 32))(a1, a2, v9);
LABEL_8:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

void *sub_10006A27C(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100069FA8((uint64_t)a1);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 4u:
        uint64_t v6 = type metadata accessor for Fence.Variant();
        (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
        goto LABEL_9;
      case 5u:
        uint64_t v7 = type metadata accessor for Fence.AcceptanceStatus();
        (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
        goto LABEL_9;
      case 6u:
        uint64_t v8 = type metadata accessor for Fence.MonitorRegion.Source();
        (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
        goto LABEL_9;
      case 8u:
      case 0xBu:
        uint64_t v10 = type metadata accessor for Fence.Participant();
        (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(a1, a2, v10);
        goto LABEL_9;
      case 0xAu:
        uint64_t v9 = type metadata accessor for Fence.Trigger();
        (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 32))(a1, a2, v9);
LABEL_9:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

uint64_t sub_10006A504(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_10006A52C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_10006A558()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_10006A568()
{
  uint64_t result = type metadata accessor for Fence.Variant();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for Fence.AcceptanceStatus();
    if (v2 <= 0x3F)
    {
      uint64_t result = type metadata accessor for Fence.MonitorRegion.Source();
      if (v3 <= 0x3F)
      {
        uint64_t result = type metadata accessor for Fence.Participant();
        if (v4 <= 0x3F)
        {
          uint64_t result = type metadata accessor for Fence.Trigger();
          if (v5 <= 0x3F)
          {
            swift_initEnumMetadataMultiPayload();
            return 0;
          }
        }
      }
    }
  }
  return result;
}

void type metadata accessor for FMFFenceLocationType(uint64_t a1)
{
}

void type metadata accessor for FMFFenceAcceptanceStatus(uint64_t a1)
{
}

void type metadata accessor for FMFFenceTrigger(uint64_t a1)
{
}

void sub_10006A748(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_10006A790()
{
  return sub_100068F54(&qword_1000BB5C8, type metadata accessor for FMFFenceTrigger);
}

uint64_t sub_10006A7D8()
{
  return sub_100068F54(&qword_1000BB5D0, type metadata accessor for FMFFenceTrigger);
}

uint64_t sub_10006A820()
{
  return sub_100068F54(&qword_1000BB5D8, type metadata accessor for FMFFenceTrigger);
}

uint64_t sub_10006A868()
{
  return sub_100068F54(&qword_1000BB5E0, type metadata accessor for FMFFenceAcceptanceStatus);
}

uint64_t sub_10006A8B0()
{
  return sub_100068F54(&qword_1000BB5E8, type metadata accessor for FMFFenceAcceptanceStatus);
}

uint64_t sub_10006A8F8()
{
  return sub_100068F54(&qword_1000BB5F0, type metadata accessor for FMFFenceAcceptanceStatus);
}

void sub_10006A940()
{
}

void sub_10006A980(void *a1)
{
  unint64_t v1 = [a1 localizedDescription];
  sub_10000AA0C();
  sub_10000A9EC((void *)&_mh_execute_header, v2, v3, "Failed to update model cache with data: %@.", v4, v5, v6, v7, v8);
}

void sub_10006AA04(void *a1)
{
  unint64_t v1 = [a1 localizedDescription];
  sub_10000AA0C();
  sub_10000A9EC((void *)&_mh_execute_header, v2, v3, "Failed to encrypt model cache with data: %@.", v4, v5, v6, v7, v8);
}

void sub_10006AA88(void *a1)
{
  unint64_t v1 = [a1 localizedDescription];
  sub_10000AA0C();
  sub_10000A9EC((void *)&_mh_execute_header, v2, v3, "Failed to plist encode model cache with data: %@.", v4, v5, v6, v7, v8);
}

void sub_10006AB0C(void *a1)
{
  unint64_t v1 = [a1 localizedDescription];
  sub_10000AA0C();
  sub_10000A9EC((void *)&_mh_execute_header, v2, v3, "Error unarchiving decrypted model cache: %@", v4, v5, v6, v7, v8);
}

void sub_10006AB90(void *a1)
{
  unint64_t v1 = [a1 localizedDescription];
  sub_10000AA0C();
  sub_10000A9EC((void *)&_mh_execute_header, v2, v3, "Error decrypting model cache: %@", v4, v5, v6, v7, v8);
}

void sub_10006AC14(void *a1)
{
  unint64_t v1 = [a1 localizedDescription];
  sub_10000AA0C();
  sub_10000A9EC((void *)&_mh_execute_header, v2, v3, "Error unarchiving encrypted model cache: %@", v4, v5, v6, v7, v8);
}

void sub_10006AC98(void *a1)
{
  unint64_t v1 = [a1 localizedDescription];
  sub_10000AA0C();
  sub_10000A9EC((void *)&_mh_execute_header, v2, v3, "Error removing local model cache: %@", v4, v5, v6, v7, v8);
}

void sub_10006AD1C()
{
  sub_10001167C();
  sub_1000116B4((void *)&_mh_execute_header, v0, v1, "%s: error bootstrapping privateCloudDatabase: %@", v2, v3, v4, v5, 2u);
}

void sub_10006AD90()
{
  sub_10001167C();
  sub_1000116B4((void *)&_mh_execute_header, v0, v1, "%s: error: %@", v2, v3, v4, v5, 2u);
}

void sub_10006AE04(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 localizedDescription];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Subscription error: %@.", (uint8_t *)&v4, 0xCu);
}

void sub_10006AE9C()
{
  v3[0] = 136315650;
  sub_10001167C();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%s: bad invitationToken: %@ or shareURL: %@", (uint8_t *)v3, 0x20u);
}

void sub_10006AF28()
{
  int v2 = 136315906;
  sub_100011690();
  sub_1000116EC((void *)&_mh_execute_header, v0, v1, "%s: error: %@, NOT RETRYING, shareURL: %@ invitationToken: %@", v2);
}

void sub_10006AFA0()
{
  int v2 = 136315906;
  sub_100011690();
  sub_1000116EC((void *)&_mh_execute_header, v0, v1, "%s: error: %@, retrying first time, shareURL: %@ invitationToken: %@", v2);
}

void sub_10006B018()
{
  sub_10001167C();
  sub_1000116B4((void *)&_mh_execute_header, v0, v1, "%s: Fetch changes with completion error- not notifying records did change. Error: %@:", v2, v3, v4, v5, 2u);
}

void sub_10006B08C()
{
  sub_10001167C();
  sub_1000116B4((void *)&_mh_execute_header, v0, v1, "%s: Fetch changes with completion error- not notifying records did change. Error: %@:", v2, v3, v4, v5, 2u);
}

void sub_10006B100(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006B138(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to encode share invitation, error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10006B1B0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006B1E8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to decode share invitation, error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10006B260(void *a1, NSObject *a2)
{
  v3[0] = 67109120;
  v3[1] = [a1 processIdentifier];
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Refusing client %d due to missing entitlement.", (uint8_t *)v3, 8u);
}

void sub_10006B2EC()
{
  sub_10000AA0C();
  sub_100013CAC((void *)&_mh_execute_header, v0, v1, "Unable to send command(%@) due to missing iCloud account", v2, v3, v4, v5, v6);
}

void sub_10006B354()
{
  sub_10000AA0C();
  sub_100013CAC((void *)&_mh_execute_header, v0, v1, "Unable to send command(%@) due to missing credentials", v2, v3, v4, v5, v6);
}

void sub_10006B3BC()
{
  sub_10000AA0C();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "command.password == nil, renewing account credentials for command: %@ with force: %d", v2, 0x12u);
}

void sub_10006B444()
{
  sub_10000AA0C();
  sub_100013CAC((void *)&_mh_execute_header, v0, v1, "Unable to send command(%@) due to 5XX grace period", v2, v3, v4, v5, v6);
}

void sub_10006B4AC()
{
  sub_10000AA0C();
  sub_100013CAC((void *)&_mh_execute_header, v0, v1, "Unable to send command(%@) due to account status unauthorized", v2, v3, v4, v5, v6);
}

void sub_10006B514()
{
  sub_10000AA0C();
  sub_100013CAC((void *)&_mh_execute_header, v0, v1, "Unable to send command(%@) due to not first unlocked", v2, v3, v4, v5, v6);
}

void sub_10006B57C(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error stopping sharing to handles in block list: %@ Error: %@", (uint8_t *)&v4, 0x16u);
}

void sub_10006B608(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  sub_100022648((void *)&_mh_execute_header, a2, a3, "%@: Refresh failed during deviceSharingLocation %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_10006B684()
{
  sub_10000AA0C();
  sub_100013CAC((void *)&_mh_execute_header, v0, v1, "%@: contactForPayload failed: FMFErrorPayloadLengthUnsupported", v2, v3, v4, v5, v6);
}

void sub_10006B6EC()
{
  sub_10000AA0C();
  sub_100013CAC((void *)&_mh_execute_header, v0, v1, "%@: contactForPayload failed: FMFErrorPayloadDecryptionFailed", v2, v3, v4, v5, v6);
}

void sub_10006B754()
{
  sub_1000226A0();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%@: contactForPayload failed: FMFErrorPayloadDecryptionFailed - handleIdentifier: %@", v1, 0x16u);
}

void sub_10006B7C8()
{
  sub_100022668();
  sub_100022648((void *)&_mh_execute_header, v0, v1, "%@: contactForPayload failed: FMFErrorNoContactMatching - handleIdentifier: %@");
}

void sub_10006B830()
{
  sub_10000AA0C();
  sub_100013CAC((void *)&_mh_execute_header, v0, v1, "%@: handleAndLocationForPayload failed: FMFErrorPayloadLengthUnsupported", v2, v3, v4, v5, v6);
}

void sub_10006B898()
{
  sub_10000AA0C();
  sub_100013CAC((void *)&_mh_execute_header, v0, v1, "%@: handleAndLocationForPayload failed: FMFErrorPayloadDecryptionFailed", v2, v3, v4, v5, v6);
}

void sub_10006B900()
{
  sub_1000226A0();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%@: handleAndLocationForPayload failed: FMFErrorPayloadDecryptionFailed - handle: %@", v1, 0x16u);
}

void sub_10006B974()
{
  sub_10000AA0C();
  sub_100013CAC((void *)&_mh_execute_header, v0, v1, "%@: decryptPayload failed: FMFErrorPayloadLengthUnsupported", v2, v3, v4, v5, v6);
}

void sub_10006B9DC()
{
  sub_10000AA0C();
  sub_100013CAC((void *)&_mh_execute_header, v0, v1, "%@: decryptPayload failed: FMFErrorPayloadDecryptionFailed", v2, v3, v4, v5, v6);
}

void sub_10006BA44()
{
  sub_10000AA0C();
  sub_100013CAC((void *)&_mh_execute_header, v0, v1, "%@: decryptPayload failed: error converting dictionary to string", v2, v3, v4, v5, v6);
}

void sub_10006BAAC()
{
  sub_10000AA0C();
  sub_100013CAC((void *)&_mh_execute_header, v0, v1, "%@: dataForPayload failed: FMFErrorPayloadLengthUnsupported", v2, v3, v4, v5, v6);
}

void sub_10006BB14()
{
  sub_10000AA0C();
  sub_100013CAC((void *)&_mh_execute_header, v0, v1, "%@: dataForPayload failed: FMFErrorPayloadDecryptionFailed", v2, v3, v4, v5, v6);
}

void sub_10006BB7C()
{
  sub_100022680();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%@: dataForPayload failed: FMFErrorPayloadDecryptionFailed - handle: %@, locationDict: %@", v1, 0x20u);
}

void sub_10006BBF0()
{
  sub_100022668();
  sub_100022648((void *)&_mh_execute_header, v0, v1, "%@: Using provided token: %@");
}

void sub_10006BC58()
{
  sub_10000AA0C();
  sub_100013CAC((void *)&_mh_execute_header, v0, v1, "%@:dataForPayload failed: FMFErrorPayloadLengthUnsupported", v2, v3, v4, v5, v6);
}

void sub_10006BCC0()
{
  sub_100022668();
  sub_100022648((void *)&_mh_execute_header, v0, v1, "%@:encryptPayload failed: FMFErrorPayloadEncryptionFailed - decryptedPayload: %@");
}

void sub_10006BD28()
{
  sub_10000AA0C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%@: Sending refresh client to get new token", v1, 0xCu);
}

void sub_10006BD9C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "NSKeyedUnarchiver error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10006BE14(os_log_t log)
{
  int v1 = 134217984;
  uint64_t v2 = -25300;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "SecItemCopyMatching succeeded with empty results and result %ld", (uint8_t *)&v1, 0xCu);
}

void sub_10006BE94(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "com.apple.Dataclass.ShareLocation data class missing from iCloud account", v1, 2u);
}

void sub_10006BED8()
{
  sub_10000AA0C();
  sub_100013CAC((void *)&_mh_execute_header, v0, v1, "Error completing aa_updatePropertiesForAppleAccount : %@ try to renew credential", v2, v3, v4, v5, v6);
}

void sub_10006BF40()
{
  sub_10000AA0C();
  sub_100013CAC((void *)&_mh_execute_header, v0, v1, "Error saving the account after aa_updatePropertiesForAppleAccount : %@", v2, v3, v4, v5, v6);
}

void sub_10006BFA8(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 appHostnameFromSettings];
  sub_10000AA0C();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Updating FMF app hostname: %@", v4, 0xCu);
}

void sub_10006C03C()
{
  sub_10000AA0C();
  sub_100013CAC((void *)&_mh_execute_header, v0, v1, "Error getting credential: %@", v2, v3, v4, v5, v6);
}

void sub_10006C0A4()
{
  sub_10000AA0C();
  sub_100013CAC((void *)&_mh_execute_header, v0, v1, "Invalid APS Env value returned from iCloud Setup: %@, falling back to production", v2, v3, v4, v5, v6);
}

void sub_10006C10C(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[FMFFenceManager informParticipantOfRemovedFenceWithID:ckRecordID:]_block_invoke";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: error: No followed or follower handle for fence", (uint8_t *)&v1, 0xCu);
}

void sub_10006C190()
{
  sub_10003AD64();
  sub_1000116B4((void *)&_mh_execute_header, v0, v1, "%s: could not find fence with ID: %@", v2, v3, v4, v5, 2u);
}

void sub_10006C208()
{
  sub_10001167C();
  sub_1000116B4((void *)&_mh_execute_header, v0, v1, "%s: error: %@", v2, v3, v4, v5, 2u);
}

void sub_10006C27C()
{
  sub_10003AD64();
  sub_1000116B4((void *)&_mh_execute_header, v0, v1, "%s: could not find fence with ID: %@", v2, v3, v4, v5, 2u);
}

void sub_10006C2F4()
{
  sub_10001167C();
  sub_1000116B4((void *)&_mh_execute_header, v0, v1, "%s: error: %@", v2, v3, v4, v5, 2u);
}

void sub_10006C368()
{
  sub_10001167C();
  sub_1000116B4((void *)&_mh_execute_header, v0, v1, "%s: error: %@", v2, v3, v4, v5, 2u);
}

void sub_10006C3DC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "*** Trying to explicitly init FMFAPSHandler. Use 'instanceForEnvironment:'", v1, 2u);
}

void sub_10006C420(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "*** The AOSUserNotificationMgr_iOS singleton seems to have been deallocated. This is unexpected & damaging.", v1, 2u);
}

void sub_10006C464(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "*** Trying to explicitly init AOSUserNotificationMgr_iOS. Use 'sharedInstance'", v1, 2u);
}

void sub_10006C4A8(int *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error while creating a CFUserNotification : %ld", (uint8_t *)&v3, 0xCu);
}

void sub_10006C524(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Cannot update fence due to missing credentials", v1, 2u);
}

void sub_10006C568(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Cannot update favorites due to missing credentials", v1, 2u);
}

void sub_10006C5AC()
{
  sub_10001167C();
  sub_1000116B4((void *)&_mh_execute_header, v0, v1, "%s: write error: %@", v2, v3, v4, v5, 2u);
}

void sub_10006C620()
{
  sub_10001167C();
  sub_1000116B4((void *)&_mh_execute_header, v0, v1, "%s: archive error: %@", v2, v3, v4, v5, 2u);
}

void sub_10006C694()
{
  sub_10001167C();
  sub_1000116B4((void *)&_mh_execute_header, v0, v1, "%s: error: %@", v2, v3, v4, v5, 2u);
}

void sub_10006C708()
{
  sub_10001167C();
  sub_1000116B4((void *)&_mh_execute_header, v0, v1, "%s: no file at %@", v2, v3, v4, v5, 2u);
}

void sub_10006C77C()
{
  sub_10001167C();
  sub_1000116B4((void *)&_mh_execute_header, v0, v1, "%s: unarchive error: %@", v2, v3, v4, v5, 2u);
}

void sub_10006C7F0()
{
  sub_10001167C();
  sub_1000116B4((void *)&_mh_execute_header, v0, v1, "%s: read error: %@", v2, v3, v4, v5, 2u);
}

void sub_10006C864()
{
  v1[0] = 136315394;
  sub_10001167C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s: no file at %@", (uint8_t *)v1, 0x16u);
}

void sub_10006C8E4()
{
  sub_10001167C();
  sub_1000116B4((void *)&_mh_execute_header, v0, v1, "%s: write error: %@", v2, v3, v4, v5, 2u);
}

void sub_10006C958()
{
  sub_10001167C();
  sub_1000116B4((void *)&_mh_execute_header, v0, v1, "%s: archive error: %@", v2, v3, v4, v5, 2u);
}

void sub_10006C9CC()
{
  sub_10001167C();
  sub_1000116B4((void *)&_mh_execute_header, v0, v1, "%s: error: %@", v2, v3, v4, v5, 2u);
}

void sub_10006CA40()
{
  sub_10001167C();
  sub_1000116B4((void *)&_mh_execute_header, v0, v1, "%s: no file at %@", v2, v3, v4, v5, 2u);
}

void sub_10006CAB4()
{
  sub_10001167C();
  sub_1000116B4((void *)&_mh_execute_header, v0, v1, "%s: write error: %@", v2, v3, v4, v5, 2u);
}

void sub_10006CB28()
{
  sub_10001167C();
  sub_1000116B4((void *)&_mh_execute_header, v0, v1, "%s: archive error: %@", v2, v3, v4, v5, 2u);
}

void sub_10006CB9C()
{
  sub_10001167C();
  sub_1000116B4((void *)&_mh_execute_header, v0, v1, "%s: unarchive error: %@", v2, v3, v4, v5, 2u);
}

void sub_10006CC10()
{
  sub_10001167C();
  sub_1000116B4((void *)&_mh_execute_header, v0, v1, "%s: read error: %@", v2, v3, v4, v5, 2u);
}

void sub_10006CC84()
{
  v1[0] = 136315394;
  sub_10001167C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s: no file at %@", (uint8_t *)v1, 0x16u);
}

void sub_10006CD04()
{
  sub_10001167C();
  sub_1000116B4((void *)&_mh_execute_header, v0, v1, "%s: write error: %@", v2, v3, v4, v5, 2u);
}

void sub_10006CD78()
{
  sub_10001167C();
  sub_1000116B4((void *)&_mh_execute_header, v0, v1, "%s: archive error: %@", v2, v3, v4, v5, 2u);
}

void sub_10006CDEC()
{
  sub_10001167C();
  sub_1000116B4((void *)&_mh_execute_header, v0, v1, "%s: error: %@", v2, v3, v4, v5, 2u);
}

void sub_10006CE60()
{
  sub_10001167C();
  sub_1000116B4((void *)&_mh_execute_header, v0, v1, "%s: no file at %@", v2, v3, v4, v5, 2u);
}

void sub_10006CED4()
{
  sub_10001167C();
  sub_1000116B4((void *)&_mh_execute_header, v0, v1, "%s: unarchive error: %@", v2, v3, v4, v5, 2u);
}

void sub_10006CF48()
{
  sub_10001167C();
  sub_1000116B4((void *)&_mh_execute_header, v0, v1, "%s: read error: %@", v2, v3, v4, v5, 2u);
}

void sub_10006CFBC()
{
  sub_10001167C();
  sub_1000116B4((void *)&_mh_execute_header, v0, v1, "%s: no file at %@", v2, v3, v4, v5, 2u);
}

void sub_10006D030()
{
  sub_10004E878();
  sub_1000116B4((void *)&_mh_execute_header, v0, v1, "%s: write error: %@", v2, v3, v4, v5, 2u);
}

void sub_10006D0A8()
{
  sub_10004E878();
  sub_1000116B4((void *)&_mh_execute_header, v0, v1, "%s: error creating path error: %@", v2, v3, v4, v5, 2u);
}

void sub_10006D120()
{
  sub_10001167C();
  sub_1000116B4((void *)&_mh_execute_header, v0, v1, "%s: error archiving data: %@", v2, v3, v4, v5, 2u);
}

void sub_10006D194()
{
  sub_10001167C();
  sub_1000116B4((void *)&_mh_execute_header, v0, v1, "%s: error unarchiving: %@", v2, v3, v4, v5, 2u);
}

void sub_10006D208()
{
  sub_10001167C();
  sub_1000116B4((void *)&_mh_execute_header, v0, v1, "%s: read error: %@", v2, v3, v4, v5, 2u);
}

void sub_10006D27C()
{
  sub_10001167C();
  sub_1000116B4((void *)&_mh_execute_header, v0, v1, "%s: error: %@", v2, v3, v4, v5, 2u);
}

void sub_10006D2F0()
{
  int v2 = 136315650;
  sub_10004E83C();
  sub_10004E858((void *)&_mh_execute_header, v0, v1, "%s: error posting: %@ uuid: %@", v2);
}

void sub_10006D368()
{
  int v2 = 136315650;
  sub_10004E83C();
  sub_10004E858((void *)&_mh_execute_header, v0, v1, "%s: error posting: %@ uuid: %@", v2);
}

void sub_10006D3E0()
{
  int v2 = 136315650;
  sub_10004E83C();
  sub_10004E858((void *)&_mh_execute_header, v0, v1, "%s: error posting: %@ uuid: %@", v2);
}

void sub_10006D458(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "+[FMFFence(Notifications) shouldPostForStatus:givenPreviousStatus:]";
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "%s: shouldn't be here", (uint8_t *)&v1, 0xCu);
}

void sub_10006D4DC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%@: Error encrypting....", (uint8_t *)&v2, 0xCu);
}

void sub_10006D554(NSObject *a1)
{
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "FMFClientSession: SecRandomCopyBytes failed with error: %d", (uint8_t *)v3, 8u);
}

void sub_10006D5E4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%@: Error decrypting....", (uint8_t *)&v2, 0xCu);
}

void sub_10006D65C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006D6D4()
{
  sub_10001167C();
  sub_1000116B4((void *)&_mh_execute_header, v0, v1, "%s: error: %@", v2, v3, v4, v5, 2u);
}

void sub_10006D748(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006D7C0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006D838()
{
  sub_10001167C();
  sub_1000116B4((void *)&_mh_execute_header, v0, v1, "%s: error: %@", v2, v3, v4, v5, 2u);
}

void sub_10006D8AC()
{
  sub_10001167C();
  sub_1000116B4((void *)&_mh_execute_header, v0, v1, "%s: error: %@", v2, v3, v4, v5, 2u);
}

void sub_10006D920()
{
  sub_10001167C();
  sub_1000116B4((void *)&_mh_execute_header, v0, v1, "%s: triggerAfterAcceptanceError %@", v2, v3, v4, v5, 2u);
}

void sub_10006D994(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006DA0C()
{
  sub_10001167C();
  sub_1000116B4((void *)&_mh_execute_header, v0, v1, "%s: error: %@", v2, v3, v4, v5, 2u);
}

void sub_10006DA80()
{
  sub_10001167C();
  sub_1000116B4((void *)&_mh_execute_header, v0, v1, "%s: error: %@", v2, v3, v4, v5, 2u);
}

void sub_10006DAF4(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a2 + 32);
  int v4 = 136315650;
  uint64_t v5 = "-[FMFFenceSequencer cleanupRemovedFenceInformationWithFenceID:ckRecordID:]_block_invoke";
  __int16 v6 = 2112;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Error removing zone from CK. Error: %@, RecordID: %@", (uint8_t *)&v4, 0x20u);
}

void sub_10006DB90(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [*(id *)(a2 + 32) recordID];
  int v6 = 136315650;
  uint64_t v7 = "+[FMFFenceSequencer ckCheckForStaleZonesForFence:withCompletion:]_block_invoke";
  __int16 v8 = 2112;
  uint64_t v9 = a1;
  __int16 v10 = 2112;
  uint64_t v11 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s: Error removing zone from CK. Error: %@, RecordID: %@", (uint8_t *)&v6, 0x20u);
}

void sub_10006DC54()
{
  sub_10001167C();
  sub_1000116B4((void *)&_mh_execute_header, v0, v1, "%s: could not get recordID for fence %@", v2, v3, v4, v5, 2u);
}

void sub_10006DCC8()
{
  sub_10001167C();
  sub_1000116B4((void *)&_mh_execute_header, v0, v1, "%s: could not find record for fence %@", v2, v3, v4, v5, 2u);
}

void sub_10006DD3C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)Date._bridgeToObjectiveC()();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t static Date.now.getter()
{
  return static Date.now.getter();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t UUID.init(uuidString:)()
{
  return UUID.init(uuidString:)();
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

uint64_t static UUID.nilUUID.getter()
{
  return static UUID.nilUUID.getter();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

NSTimeZone __swiftcall TimeZone._bridgeToObjectiveC()()
{
  return (NSTimeZone)TimeZone._bridgeToObjectiveC()();
}

uint64_t static TimeZone._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static TimeZone._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for TimeZone()
{
  return type metadata accessor for TimeZone();
}

uint64_t type metadata accessor for ClientOrigin()
{
  return type metadata accessor for ClientOrigin();
}

uint64_t PersonHandle.init(id:)()
{
  return PersonHandle.init(id:)();
}

uint64_t PersonHandle.id.getter()
{
  return PersonHandle.id.getter();
}

uint64_t type metadata accessor for PersonHandle()
{
  return type metadata accessor for PersonHandle();
}

uint64_t type metadata accessor for RequestOrigin()
{
  return type metadata accessor for RequestOrigin();
}

uint64_t RequestOrigin.init(_:)()
{
  return RequestOrigin.init(_:)();
}

uint64_t Fence.DaysOfWeek.init(rawValue:)()
{
  return Fence.DaysOfWeek.init(rawValue:)();
}

uint64_t Fence.DaysOfWeek.rawValue.getter()
{
  return Fence.DaysOfWeek.rawValue.getter();
}

uint64_t type metadata accessor for Fence.DaysOfWeek()
{
  return type metadata accessor for Fence.DaysOfWeek();
}

uint64_t static Fence.Participant.== infix(_:_:)()
{
  return static Fence.Participant.== infix(_:_:)();
}

uint64_t type metadata accessor for Fence.Participant()
{
  return type metadata accessor for Fence.Participant();
}

uint64_t Fence.muteEndDate.getter()
{
  return Fence.muteEndDate.getter();
}

uint64_t type metadata accessor for Fence.UpdateStream.AsyncIterator()
{
  return type metadata accessor for Fence.UpdateStream.AsyncIterator();
}

uint64_t Fence.UpdateStream.makeAsyncIterator()()
{
  return Fence.UpdateStream.makeAsyncIterator()();
}

uint64_t Fence.UpdateStream.Snapshot.fences.getter()
{
  return Fence.UpdateStream.Snapshot.fences.getter();
}

uint64_t type metadata accessor for Fence.UpdateStream.Snapshot()
{
  return type metadata accessor for Fence.UpdateStream.Snapshot();
}

uint64_t type metadata accessor for Fence.MonitorRegion.Source()
{
  return type metadata accessor for Fence.MonitorRegion.Source();
}

uint64_t Fence.MonitorRegion.init(center:radius:source:)()
{
  return Fence.MonitorRegion.init(center:radius:source:)();
}

uint64_t Fence.MonitorRegion.center.getter()
{
  return Fence.MonitorRegion.center.getter();
}

uint64_t Fence.MonitorRegion.radius.getter()
{
  return Fence.MonitorRegion.radius.getter();
}

uint64_t Fence.MonitorRegion.source.getter()
{
  return Fence.MonitorRegion.source.getter();
}

uint64_t type metadata accessor for Fence.MonitorRegion()
{
  return type metadata accessor for Fence.MonitorRegion();
}

uint64_t type metadata accessor for Fence.TriggerPosition()
{
  return type metadata accessor for Fence.TriggerPosition();
}

uint64_t type metadata accessor for Fence.AcceptanceStatus()
{
  return type metadata accessor for Fence.AcceptanceStatus();
}

uint64_t Fence.acceptanceStatus.getter()
{
  return Fence.acceptanceStatus.getter();
}

uint64_t Fence.ID.id.getter()
{
  return Fence.ID.id.getter();
}

uint64_t Fence.ID.init(id:)()
{
  return Fence.ID.init(id:)();
}

uint64_t Fence.ID.init(string:)()
{
  return Fence.ID.init(string:)();
}

uint64_t Fence.ID.init()()
{
  return Fence.ID.init()();
}

uint64_t type metadata accessor for Fence.ID()
{
  return type metadata accessor for Fence.ID();
}

uint64_t Fence.init(id:label:createdBy:finder:variant:acceptanceStatus:region:placemark:others:muteEndDate:ckRecordIdentifier:ckRecordZoneOwnerName:updatedAt:)()
{
  return Fence.init(id:label:createdBy:finder:variant:acceptanceStatus:region:placemark:others:muteEndDate:ckRecordIdentifier:ckRecordZoneOwnerName:updatedAt:)();
}

uint64_t Fence.id.getter()
{
  return Fence.id.getter();
}

uint64_t Fence.label.getter()
{
  return Fence.label.getter();
}

uint64_t Fence.findee.getter()
{
  return Fence.findee.getter();
}

uint64_t Fence.finder.getter()
{
  return Fence.finder.getter();
}

uint64_t Fence.others.getter()
{
  return Fence.others.getter();
}

uint64_t Fence.region.getter()
{
  return Fence.region.getter();
}

uint64_t type metadata accessor for Fence.Trigger()
{
  return type metadata accessor for Fence.Trigger();
}

uint64_t type metadata accessor for Fence.Variant()
{
  return type metadata accessor for Fence.Variant();
}

uint64_t Fence.variant.getter()
{
  return Fence.variant.getter();
}

uint64_t Fence.Schedule.daysOfWeek.getter()
{
  return Fence.Schedule.daysOfWeek.getter();
}

uint64_t Fence.Schedule.end.getter()
{
  return Fence.Schedule.end.getter();
}

uint64_t Fence.Schedule.init(start:end:daysOfWeek:timeZone:)()
{
  return Fence.Schedule.init(start:end:daysOfWeek:timeZone:)();
}

uint64_t Fence.Schedule.start.getter()
{
  return Fence.Schedule.start.getter();
}

uint64_t Fence.Schedule.timeZone.getter()
{
  return Fence.Schedule.timeZone.getter();
}

uint64_t type metadata accessor for Fence.Schedule()
{
  return type metadata accessor for Fence.Schedule();
}

uint64_t Fence.TimeOfDay.init(hour:minute:)()
{
  return Fence.TimeOfDay.init(hour:minute:)();
}

uint64_t Fence.TimeOfDay.hour.getter()
{
  return Fence.TimeOfDay.hour.getter();
}

uint64_t Fence.TimeOfDay.minute.getter()
{
  return Fence.TimeOfDay.minute.getter();
}

uint64_t type metadata accessor for Fence.TimeOfDay()
{
  return type metadata accessor for Fence.TimeOfDay();
}

uint64_t Fence.createdBy.getter()
{
  return Fence.createdBy.getter();
}

uint64_t Fence.placemark.getter()
{
  return Fence.placemark.getter();
}

uint64_t Fence.updatedAt.getter()
{
  return Fence.updatedAt.getter();
}

uint64_t type metadata accessor for Fence()
{
  return type metadata accessor for Fence();
}

uint64_t type metadata accessor for Session()
{
  return type metadata accessor for Session();
}

uint64_t Session.init(_:)()
{
  return Session.init(_:)();
}

uint64_t PlaceMark.streetName.getter()
{
  return PlaceMark.streetName.getter();
}

uint64_t PlaceMark.streetAddress.getter()
{
  return PlaceMark.streetAddress.getter();
}

uint64_t PlaceMark.administrativeArea.getter()
{
  return PlaceMark.administrativeArea.getter();
}

uint64_t PlaceMark.formattedAddressLines.getter()
{
  return PlaceMark.formattedAddressLines.getter();
}

uint64_t PlaceMark.country.getter()
{
  return PlaceMark.country.getter();
}

uint64_t PlaceMark.init(locality:administrativeArea:country:state:streetAddress:streetName:formattedAddress:coarseAddress:poiAddress:smallAddress:mediumAddress:largeAddress:)()
{
  return PlaceMark.init(locality:administrativeArea:country:state:streetAddress:streetName:formattedAddress:coarseAddress:poiAddress:smallAddress:mediumAddress:largeAddress:)();
}

uint64_t PlaceMark.locality.getter()
{
  return PlaceMark.locality.getter();
}

uint64_t PlaceMark.stateCode.getter()
{
  return PlaceMark.stateCode.getter();
}

uint64_t type metadata accessor for PlaceMark()
{
  return type metadata accessor for PlaceMark();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t Logger.init(_:)()
{
  return Logger.init(_:)();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::String __swiftcall String.lowercased()()
{
  uint64_t v0 = String.lowercased()();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)Set._bridgeToObjectiveC()();
}

uint64_t Set.init(minimumCapacity:)()
{
  return Set.init(minimumCapacity:)();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t StringProtocol.contains<A>(_:)()
{
  return StringProtocol.contains<A>(_:)();
}

uint64_t _HashTable.nextHole(atOrAfter:)()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t __CocoaSet.makeIterator()()
{
  return __CocoaSet.makeIterator()();
}

uint64_t __CocoaSet.count.getter()
{
  return __CocoaSet.count.getter();
}

uint64_t __CocoaSet.member(for:)()
{
  return __CocoaSet.member(for:)();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t static _SetStorage.convert(_:capacity:)()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Error._getEmbeddedNSError()()
{
  return Error._getEmbeddedNSError()();
}

uint64_t Error._code.getter()
{
  return Error._code.getter();
}

uint64_t Error._domain.getter()
{
  return Error._domain.getter();
}

uint64_t Error._userInfo.getter()
{
  return Error._userInfo.getter();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

uint64_t CCCryptorGCM()
{
  return _CCCryptorGCM();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA1(data, len, md);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterPostNotificationWithOptions(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, CFOptionFlags options)
{
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFRange v5 = _CFStringFind(theString, stringToFind, compareOptions);
  CFIndex length = v5.length;
  CFIndex location = v5.location;
  result.CFIndex length = length;
  result.CFIndex location = location;
  return result;
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return _CFUserNotificationCancel(userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return _CFUserNotificationCreateRunLoopSource(allocator, userNotification, callout, order);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationReceiveResponse(userNotification, timeout, responseFlags);
}

uint64_t CKDatabaseScopeString()
{
  return _CKDatabaseScopeString();
}

uint64_t CKXPCSuitableError()
{
  return _CKXPCSuitableError();
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  CLLocationCoordinate2D v4 = _CLLocationCoordinate2DMake(latitude, longitude);
  double v3 = v4.longitude;
  double v2 = v4.latitude;
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t IDSCopyIDForEmailAddress()
{
  return _IDSCopyIDForEmailAddress();
}

uint64_t IDSCopyIDForPhoneNumber()
{
  return _IDSCopyIDForPhoneNumber();
}

uint64_t IDSCopyRawAddressForDestination()
{
  return _IDSCopyRawAddressForDestination();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetSInt32Answer()
{
  return _MGGetSInt32Answer();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return _NSSearchPathForDirectoriesInDomains(directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return _SecItemAdd(attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return _SecItemCopyMatching(query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return _SecItemDelete(query);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return _SecRandomCopyBytes(rnd, count, bytes);
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return _getpid();
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

uint64_t stringForCKErrorCode()
{
  return _stringForCKErrorCode();
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

uint64_t swift_deletedMethodError()
{
  return _swift_deletedMethodError();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
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

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
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

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

int timingsafe_bcmp(const void *__b1, const void *__b2, size_t __len)
{
  return _timingsafe_bcmp(__b1, __b2, __len);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return _waitpid(a1, a2, a3);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
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

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_date(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

uint64_t xpc_set_event()
{
  return _xpc_set_event();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend_FMFErrorAsString_(void *a1, const char *a2, ...)
{
  return [a1 FMFErrorAsString:];
}

id objc_msgSend_FMFServiceHost(void *a1, const char *a2, ...)
{
  return _[a1 FMFServiceHost];
}

id objc_msgSend_FMFServiceService(void *a1, const char *a2, ...)
{
  return _[a1 FMFServiceService];
}

id objc_msgSend_FMFServiceUseSSL(void *a1, const char *a2, ...)
{
  return _[a1 FMFServiceUseSSL];
}

id objc_msgSend_IDSRecipientFromHandle_(void *a1, const char *a2, ...)
{
  return [a1 IDSRecipientFromHandle:];
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLQueryAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 URLQueryAllowedCharacterSet];
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return [a1 URLWithString:];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__activityBlock(void *a1, const char *a2, ...)
{
  return _[a1 _activityBlock];
}

id objc_msgSend__addFence_clientSession_ckShare_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_addFence:clientSession:ckShare:completion:");
}

id objc_msgSend__alertTimeoutInterval(void *a1, const char *a2, ...)
{
  return _[a1 _alertTimeoutInterval];
}

id objc_msgSend__clearOldMappingPacketsOverLimit_(void *a1, const char *a2, ...)
{
  return [a1 _clearOldMappingPacketsOverLimit:];
}

id objc_msgSend__configFromServer(void *a1, const char *a2, ...)
{
  return _[a1 _configFromServer];
}

id objc_msgSend__dateFromHour_andMinute_(void *a1, const char *a2, ...)
{
  return [a1 _dateFromHour:andMinute:];
}

id objc_msgSend__dayStringForDayOfWeek_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_dayStringForDayOfWeek:");
}

id objc_msgSend__decryptPayload_withToken_withSession_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_decryptPayload:withToken:withSession:");
}

id objc_msgSend__deviceInfoForKey_(void *a1, const char *a2, ...)
{
  return [a1 _deviceInfoForKey:];
}

id objc_msgSend__devices(void *a1, const char *a2, ...)
{
  return _[a1 _devices];
}

id objc_msgSend__encryptPayload_(void *a1, const char *a2, ...)
{
  return [a1 _encryptPayload:];
}

id objc_msgSend__enumerateDaysOfWeekInFMFDaysOfWeek_callback_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_enumerateDaysOfWeekInFMFDaysOfWeek:callback:");
}

id objc_msgSend__filterLocatableHandles_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_filterLocatableHandles:");
}

id objc_msgSend__followerHandleMapWithIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 _followerHandleMapWithIdentifier];
}

id objc_msgSend__followerHandleMapWithServerId(void *a1, const char *a2, ...)
{
  return _[a1 _followerHandleMapWithServerId];
}

id objc_msgSend__followingHandleMapWithIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 _followingHandleMapWithIdentifier];
}

id objc_msgSend__followingHandleMapWithServerId(void *a1, const char *a2, ...)
{
  return _[a1 _followingHandleMapWithServerId];
}

id objc_msgSend__futureFollowerRequestMapWithIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 _futureFollowerRequestMapWithIdentifier];
}

id objc_msgSend__futureFollowerRequestsInternal(void *a1, const char *a2, ...)
{
  return _[a1 _futureFollowerRequestsInternal];
}

id objc_msgSend__futureFollowingRequestsInternal(void *a1, const char *a2, ...)
{
  return _[a1 _futureFollowingRequestsInternal];
}

id objc_msgSend__handleWithData_withHandlesKey_forIdentifier_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleWithData:withHandlesKey:forIdentifier:");
}

id objc_msgSend__handlesInternal(void *a1, const char *a2, ...)
{
  return _[a1 _handlesInternal];
}

id objc_msgSend__highPriorityRefreshInterval(void *a1, const char *a2, ...)
{
  return _[a1 _highPriorityRefreshInterval];
}

id objc_msgSend__internalClientSessionPIDsString(void *a1, const char *a2, ...)
{
  return _[a1 _internalClientSessionPIDsString];
}

id objc_msgSend__isApplicationForClientSessionInForeground_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_isApplicationForClientSessionInForeground:");
}

id objc_msgSend__locationDictionary(void *a1, const char *a2, ...)
{
  return _[a1 _locationDictionary];
}

id objc_msgSend__meDevice(void *a1, const char *a2, ...)
{
  return _[a1 _meDevice];
}

id objc_msgSend__myInfo(void *a1, const char *a2, ...)
{
  return _[a1 _myInfo];
}

id objc_msgSend__postAliveNotification(void *a1, const char *a2, ...)
{
  return _[a1 _postAliveNotification];
}

id objc_msgSend__preferences(void *a1, const char *a2, ...)
{
  return _[a1 _preferences];
}

id objc_msgSend__receivedDeletedFenceInformationMessage_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_receivedDeletedFenceInformationMessage:");
}

id objc_msgSend__receivedFenceTriggerMessage_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_receivedFenceTriggerMessage:");
}

id objc_msgSend__receivedShareInvitationMessage_fromID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_receivedShareInvitationMessage:fromID:");
}

id objc_msgSend__recipients(void *a1, const char *a2, ...)
{
  return _[a1 _recipients];
}

id objc_msgSend__refreshForSession_withReason_withCompletion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_refreshForSession:withReason:withCompletion:");
}

id objc_msgSend__refreshLocationsForHandles_(void *a1, const char *a2, ...)
{
  return [a1 _refreshLocationsForHandles:];
}

id objc_msgSend__registerUnlockRefresh(void *a1, const char *a2, ...)
{
  return _[a1 _registerUnlockRefresh];
}

id objc_msgSend__removeFence_clientSession_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_removeFence:clientSession:completion:");
}

id objc_msgSend__scheduleRefresh(void *a1, const char *a2, ...)
{
  return _[a1 _scheduleRefresh];
}

id objc_msgSend__scheduleRegistrationSanityCheck(void *a1, const char *a2, ...)
{
  return _[a1 _scheduleRegistrationSanityCheck];
}

id objc_msgSend__sendInitForSession_withCompletion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_sendInitForSession:withCompletion:");
}

id objc_msgSend__sendMessage_toHandle_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_sendMessage:toHandle:error:");
}

id objc_msgSend__sendMessage_toHandles_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_sendMessage:toHandles:error:");
}

id objc_msgSend__sendRefreshOfType_(void *a1, const char *a2, ...)
{
  return [a1 _sendRefreshOfType:];
}

id objc_msgSend__serverContext(void *a1, const char *a2, ...)
{
  return _[a1 _serverContext];
}

id objc_msgSend__strictlyUnarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_strictlyUnarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend__timeTillMinCallback(void *a1, const char *a2, ...)
{
  return _[a1 _timeTillMinCallback];
}

id objc_msgSend__updateInviteTimer(void *a1, const char *a2, ...)
{
  return _[a1 _updateInviteTimer];
}

id objc_msgSend__verifyLaunchEventsConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 _verifyLaunchEventsConfiguration];
}

id objc_msgSend__xpcTransactionNameFor_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_xpcTransactionNameFor:");
}

id objc_msgSend_aa_authToken(void *a1, const char *a2, ...)
{
  return [a1 aa_authToken];
}

id objc_msgSend_aa_fmfAccount(void *a1, const char *a2, ...)
{
  return [a1 aa_fmfAccount];
}

id objc_msgSend_aa_personID(void *a1, const char *a2, ...)
{
  return [a1 aa_personID];
}

id objc_msgSend_aa_primaryAppleAccount(void *a1, const char *a2, ...)
{
  return [a1 aa_primaryAppleAccount];
}

id objc_msgSend_aa_updatePropertiesForAppleAccount_completion_(void *a1, const char *a2, ...)
{
  return [a1 aa_updatePropertiesForAppleAccount:completion:];
}

id objc_msgSend_abDidChange(void *a1, const char *a2, ...)
{
  return _[a1 abDidChange];
}

id objc_msgSend_abPreferencesDidChange(void *a1, const char *a2, ...)
{
  return _[a1 abPreferencesDidChange];
}

id objc_msgSend_abbreviation(void *a1, const char *a2, ...)
{
  return _[a1 abbreviation];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _[a1 absoluteString];
}

id objc_msgSend_acceptCKShareWithURL_invitationToken_completion_(void *a1, const char *a2, ...)
{
  return [a1 acceptCKShareWithURL:x0 invitationToken:x1 completion:x2];
}

id objc_msgSend_acceptCKShareWithURLString_invitationTokenBase64String_(void *a1, const char *a2, ...)
{
  return [a1 acceptCKShareWithURLString:x0 invitationTokenBase64String:x1];
}

id objc_msgSend_acceptanceStatus(void *a1, const char *a2, ...)
{
  return _[a1 acceptanceStatus];
}

id objc_msgSend_accepted(void *a1, const char *a2, ...)
{
  return _[a1 accepted];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return _[a1 account];
}

id objc_msgSend_accountQueue(void *a1, const char *a2, ...)
{
  return _[a1 accountQueue];
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return _[a1 accounts];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return _[a1 activate];
}

id objc_msgSend_activateNotification_(void *a1, const char *a2, ...)
{
  return [a1 activateNotification:];
}

id objc_msgSend_activeCFNotificationsByCategory(void *a1, const char *a2, ...)
{
  return _[a1 activeCFNotificationsByCategory];
}

id objc_msgSend_activeDevice(void *a1, const char *a2, ...)
{
  return _[a1 activeDevice];
}

id objc_msgSend_activeUserNotifications(void *a1, const char *a2, ...)
{
  return _[a1 activeUserNotifications];
}

id objc_msgSend_addClientSession_(void *a1, const char *a2, ...)
{
  return [a1 addClientSession:];
}

id objc_msgSend_addDelegate_forService_listenerID_queue_(void *a1, const char *a2, ...)
{
  return [a1 addDelegate:forService:listenerID:queue:];
}

id objc_msgSend_addDelegate_queue_(void *a1, const char *a2, ...)
{
  return [a1 addDelegate:queue:];
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return [a1 addEntriesFromDictionary:];
}

id objc_msgSend_addFavorite_(void *a1, const char *a2, ...)
{
  return [a1 addFavorite:];
}

id objc_msgSend_addFavorite_clientSession_completion_(void *a1, const char *a2, ...)
{
  return [a1 addFavorite:x0 clientSession:x1 completion:x2];
}

id objc_msgSend_addFence_clientSession_completion_(void *a1, const char *a2, ...)
{
  return [a1 addFence:clientSession:completion:];
}

id objc_msgSend_addFence_completion_(void *a1, const char *a2, ...)
{
  return [a1 addFence:completion:];
}

id objc_msgSend_addNetworkReachableObserver_selector_(void *a1, const char *a2, ...)
{
  return [a1 addNetworkReachableObserver:];
}

id objc_msgSend_addNotificationRequest_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 addNotificationRequest:withCompletionHandler:];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 addObjectsFromArray:];
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:x0 selector:x1 name:x2 object:x3];
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return [a1 addObserverForName:object:queue:usingBlock:];
}

id objc_msgSend_addObservers(void *a1, const char *a2, ...)
{
  return _[a1 addObservers];
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return [a1 addOperation:];
}

id objc_msgSend_addParticipant_(void *a1, const char *a2, ...)
{
  return [a1 addParticipant:];
}

id objc_msgSend_administrativeArea(void *a1, const char *a2, ...)
{
  return _[a1 administrativeArea];
}

id objc_msgSend_alertActionInfoForAction_andURL_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "alertActionInfoForAction:andURL:");
}

id objc_msgSend_alertId(void *a1, const char *a2, ...)
{
  return _[a1 alertId];
}

id objc_msgSend_alertLevel(void *a1, const char *a2, ...)
{
  return _[a1 alertLevel];
}

id objc_msgSend_aliasServerIds(void *a1, const char *a2, ...)
{
  return _[a1 aliasServerIds];
}

id objc_msgSend_allBlacklistRules(void *a1, const char *a2, ...)
{
  return _[a1 allBlacklistRules];
}

id objc_msgSend_allDevices(void *a1, const char *a2, ...)
{
  return _[a1 allDevices];
}

id objc_msgSend_allFences(void *a1, const char *a2, ...)
{
  return _[a1 allFences];
}

id objc_msgSend_allFencesWithoutCKData(void *a1, const char *a2, ...)
{
  return _[a1 allFencesWithoutCKData];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allLocations(void *a1, const char *a2, ...)
{
  return _[a1 allLocations];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_allowFriendRequests(void *a1, const char *a2, ...)
{
  return _[a1 allowFriendRequests];
}

id objc_msgSend_allowInitForSessionCreation(void *a1, const char *a2, ...)
{
  return _[a1 allowInitForSessionCreation];
}

id objc_msgSend_alternateButtonAction(void *a1, const char *a2, ...)
{
  return _[a1 alternateButtonAction];
}

id objc_msgSend_alternateButtonTitle(void *a1, const char *a2, ...)
{
  return _[a1 alternateButtonTitle];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return _[a1 anyObject];
}

id objc_msgSend_appHostnameFromSettings(void *a1, const char *a2, ...)
{
  return _[a1 appHostnameFromSettings];
}

id objc_msgSend_appName(void *a1, const char *a2, ...)
{
  return _[a1 appName];
}

id objc_msgSend_appVersion(void *a1, const char *a2, ...)
{
  return _[a1 appVersion];
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return [a1 appendData:];
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return [a1 appendFormat:];
}

id objc_msgSend_applicationInfoForPID_(void *a1, const char *a2, ...)
{
  return [a1 applicationInfoForPID:];
}

id objc_msgSend_applicationIsInstalled_(void *a1, const char *a2, ...)
{
  return [a1 applicationIsInstalled:];
}

id objc_msgSend_approveFriendshipRequest_forSession_completion_(void *a1, const char *a2, ...)
{
  return [a1 approveFriendshipRequest:forSession:completion:];
}

id objc_msgSend_apsConnection(void *a1, const char *a2, ...)
{
  return _[a1 apsConnection];
}

id objc_msgSend_apsEnvironment(void *a1, const char *a2, ...)
{
  return _[a1 apsEnvironment];
}

id objc_msgSend_apsEnvironmentConstantForiCloudBagKey_(void *a1, const char *a2, ...)
{
  return [a1 apsEnvironmentConstantForiCloudBagKey:];
}

id objc_msgSend_apsHandler(void *a1, const char *a2, ...)
{
  return _[a1 apsHandler];
}

id objc_msgSend_apsToken(void *a1, const char *a2, ...)
{
  return _[a1 apsToken];
}

id objc_msgSend_apsTokenData(void *a1, const char *a2, ...)
{
  return _[a1 apsTokenData];
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return [a1 archivedDataWithRootObject:x0 requiringSecureCoding:x1 error:x2];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
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

id objc_msgSend_authToken(void *a1, const char *a2, ...)
{
  return _[a1 authToken];
}

id objc_msgSend_authTokenFromKeychain(void *a1, const char *a2, ...)
{
  return _[a1 authTokenFromKeychain];
}

id objc_msgSend_authorizationStatusForBundle_(void *a1, const char *a2, ...)
{
  return [a1 authorizationStatusForBundle:];
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 base64EncodedStringWithOptions:];
}

id objc_msgSend_beginTransaction_(void *a1, const char *a2, ...)
{
  return [a1 beginTransaction:];
}

id objc_msgSend_blockFMFChannel(void *a1, const char *a2, ...)
{
  return _[a1 blockFMFChannel];
}

id objc_msgSend_blockingDialogs(void *a1, const char *a2, ...)
{
  return _[a1 blockingDialogs];
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return [a1 BOOLForKey:];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_boostrapScheduled(void *a1, const char *a2, ...)
{
  return _[a1 boostrapScheduled];
}

id objc_msgSend_bootstrap(void *a1, const char *a2, ...)
{
  return _[a1 bootstrap];
}

id objc_msgSend_bootstrapAccountWithReason_(void *a1, const char *a2, ...)
{
  return [a1 bootstrapAccountWithReason:];
}

id objc_msgSend_bootstrapRetryInterval(void *a1, const char *a2, ...)
{
  return _[a1 bootstrapRetryInterval];
}

id objc_msgSend_buildVersion(void *a1, const char *a2, ...)
{
  return _[a1 buildVersion];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return [a1 bundleForClass:];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundleWithPath_(void *a1, const char *a2, ...)
{
  return [a1 bundleWithPath:];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return [a1 cStringUsingEncoding:];
}

id objc_msgSend_cache(void *a1, const char *a2, ...)
{
  return _[a1 cache];
}

id objc_msgSend_cacheDirectory(void *a1, const char *a2, ...)
{
  return _[a1 cacheDirectory];
}

id objc_msgSend_cacheFileURL(void *a1, const char *a2, ...)
{
  return _[a1 cacheFileURL];
}

id objc_msgSend_cachedFirstInvitedDate(void *a1, const char *a2, ...)
{
  return _[a1 cachedFirstInvitedDate];
}

id objc_msgSend_cachedRedirects(void *a1, const char *a2, ...)
{
  return _[a1 cachedRedirects];
}

id objc_msgSend_cachedRedirectsFromDefaults(void *a1, const char *a2, ...)
{
  return _[a1 cachedRedirectsFromDefaults];
}

id objc_msgSend_cachedTapMessages(void *a1, const char *a2, ...)
{
  return _[a1 cachedTapMessages];
}

id objc_msgSend_cachesWarmedUp(void *a1, const char *a2, ...)
{
  return _[a1 cachesWarmedUp];
}

id objc_msgSend_callerIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 callerIdentifier];
}

id objc_msgSend_canAddFollower(void *a1, const char *a2, ...)
{
  return _[a1 canAddFollower];
}

id objc_msgSend_canAddFriend(void *a1, const char *a2, ...)
{
  return _[a1 canAddFriend];
}

id objc_msgSend_canOfferToHandles_forSession_completion_(void *a1, const char *a2, ...)
{
  return [a1 canOfferToHandles:forSession:completion:];
}

id objc_msgSend_capabilities(void *a1, const char *a2, ...)
{
  return _[a1 capabilities];
}

id objc_msgSend_category(void *a1, const char *a2, ...)
{
  return _[a1 category];
}

id objc_msgSend_changesToBeNotified(void *a1, const char *a2, ...)
{
  return _[a1 changesToBeNotified];
}

id objc_msgSend_characterSetWithCharactersInString_(void *a1, const char *a2, ...)
{
  return [a1 characterSetWithCharactersInString:];
}

id objc_msgSend_checkForChangedFencesPastInviteDate_(void *a1, const char *a2, ...)
{
  return [a1 checkForChangedFencesPastInviteDate:];
}

id objc_msgSend_checkHeartbeat(void *a1, const char *a2, ...)
{
  return _[a1 checkHeartbeat];
}

id objc_msgSend_checkIDSStatusOfRecipientForService_(void *a1, const char *a2, ...)
{
  return [a1 checkIDSStatusOfRecipientForService:];
}

id objc_msgSend_checkin(void *a1, const char *a2, ...)
{
  return _[a1 checkin];
}

id objc_msgSend_ckCheckForStaleZonesForFence_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 ckCheckForStaleZonesForFence:withCompletion:];
}

id objc_msgSend_ckCreateRecordForFence_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 ckCreateRecordForFence:withCompletion:];
}

id objc_msgSend_ckCreateRecordIDForFence_withCompletion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "ckCreateRecordIDForFence:withCompletion:");
}

id objc_msgSend_ckDeleteRecordForFence_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 ckDeleteRecordForFence:withCompletion:];
}

id objc_msgSend_ckRecordID(void *a1, const char *a2, ...)
{
  return _[a1 ckRecordID];
}

id objc_msgSend_ckRecordName(void *a1, const char *a2, ...)
{
  return _[a1 ckRecordName];
}

id objc_msgSend_ckRecordZoneID(void *a1, const char *a2, ...)
{
  return _[a1 ckRecordZoneID];
}

id objc_msgSend_ckRecordZoneName(void *a1, const char *a2, ...)
{
  return _[a1 ckRecordZoneName];
}

id objc_msgSend_ckRecordZoneNameForRecordName_(void *a1, const char *a2, ...)
{
  return [a1 ckRecordZoneNameForRecordName:];
}

id objc_msgSend_ckRecordZoneOwnerName(void *a1, const char *a2, ...)
{
  return _[a1 ckRecordZoneOwnerName];
}

id objc_msgSend_ckUpdateRecordForFence_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 ckUpdateRecordForFence:withCompletion:];
}

id objc_msgSend_cleanup(void *a1, const char *a2, ...)
{
  return _[a1 cleanup];
}

id objc_msgSend_cleanupCaches(void *a1, const char *a2, ...)
{
  return _[a1 cleanupCaches];
}

id objc_msgSend_cleanupLegacyStoredDataIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 cleanupLegacyStoredDataIfNeeded];
}

id objc_msgSend_cleanupOldModel(void *a1, const char *a2, ...)
{
  return _[a1 cleanupOldModel];
}

id objc_msgSend_cleanupRemovedFenceInformationWithFenceID_ckRecordID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "cleanupRemovedFenceInformationWithFenceID:ckRecordID:");
}

id objc_msgSend_clearDataAndServerContext(void *a1, const char *a2, ...)
{
  return _[a1 clearDataAndServerContext];
}

id objc_msgSend_clearRedirectsCache(void *a1, const char *a2, ...)
{
  return _[a1 clearRedirectsCache];
}

id objc_msgSend_clearSavedInvalidMappingPackets(void *a1, const char *a2, ...)
{
  return _[a1 clearSavedInvalidMappingPackets];
}

id objc_msgSend_clearSavedMappingPackets(void *a1, const char *a2, ...)
{
  return _[a1 clearSavedMappingPackets];
}

id objc_msgSend_clearStaleFenceStatusForFenceID_(void *a1, const char *a2, ...)
{
  return [a1 clearStaleFenceStatusForFenceID:];
}

id objc_msgSend_clearStaleFenceTriggerForFence_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "clearStaleFenceTriggerForFence:");
}

id objc_msgSend_clearStaleStatusForRemovedFenceID_(void *a1, const char *a2, ...)
{
  return [a1 clearStaleStatusForRemovedFenceID:];
}

id objc_msgSend_clearTapMessagesCache(void *a1, const char *a2, ...)
{
  return _[a1 clearTapMessagesCache];
}

id objc_msgSend_clientBundleId(void *a1, const char *a2, ...)
{
  return _[a1 clientBundleId];
}

id objc_msgSend_clientContext(void *a1, const char *a2, ...)
{
  return _[a1 clientContext];
}

id objc_msgSend_clientInfoVersionTagString(void *a1, const char *a2, ...)
{
  return _[a1 clientInfoVersionTagString];
}

id objc_msgSend_clientPid(void *a1, const char *a2, ...)
{
  return _[a1 clientPid];
}

id objc_msgSend_clientProxy(void *a1, const char *a2, ...)
{
  return _[a1 clientProxy];
}

id objc_msgSend_clientSession(void *a1, const char *a2, ...)
{
  return _[a1 clientSession];
}

id objc_msgSend_clientSessions(void *a1, const char *a2, ...)
{
  return _[a1 clientSessions];
}

id objc_msgSend_cloudKitAPSHandler(void *a1, const char *a2, ...)
{
  return _[a1 cloudKitAPSHandler];
}

id objc_msgSend_cloudKitPushTopic(void *a1, const char *a2, ...)
{
  return _[a1 cloudKitPushTopic];
}

id objc_msgSend_coalescedAppContexts(void *a1, const char *a2, ...)
{
  return _[a1 coalescedAppContexts];
}

id objc_msgSend_coalescedCommands(void *a1, const char *a2, ...)
{
  return _[a1 coalescedCommands];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_coleasedRefreshPriority(void *a1, const char *a2, ...)
{
  return _[a1 coleasedRefreshPriority];
}

id objc_msgSend_commandDataContext(void *a1, const char *a2, ...)
{
  return _[a1 commandDataContext];
}

id objc_msgSend_commandServerContext(void *a1, const char *a2, ...)
{
  return _[a1 commandServerContext];
}

id objc_msgSend_commandStatus(void *a1, const char *a2, ...)
{
  return _[a1 commandStatus];
}

id objc_msgSend_companionDeviceId(void *a1, const char *a2, ...)
{
  return _[a1 companionDeviceId];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return [a1 compare:];
}

id objc_msgSend_compare_options_(void *a1, const char *a2, ...)
{
  return [a1 compare:options:];
}

id objc_msgSend_completionBlock(void *a1, const char *a2, ...)
{
  return _[a1 completionBlock];
}

id objc_msgSend_components_fromDate_(void *a1, const char *a2, ...)
{
  return [a1 components:fromDate:];
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return [a1 componentsJoinedByString:];
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return _[a1 configuration];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return _[a1 connection];
}

id objc_msgSend_container(void *a1, const char *a2, ...)
{
  return _[a1 container];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return [a1 containsObject:];
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return _[a1 coordinate];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countForObject_(void *a1, const char *a2, ...)
{
  return [a1 countForObject:];
}

id objc_msgSend_country(void *a1, const char *a2, ...)
{
  return _[a1 country];
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return _[a1 countryCode];
}

id objc_msgSend_createDatabaseSubscriptionOperationWithSubscriptionId_database_(void *a1, const char *a2, ...)
{
  return [a1 createDatabaseSubscriptionOperationWithSubscriptionId:database:];
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return [a1 createDirectoryAtPath:x0 withIntermediateDirectories:x1 attributes:x2 error:x3];
}

id objc_msgSend_createIDForRecordWithName_inZoneWithName_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 createIDForRecordWithName:inZoneWithName:withCompletion:];
}

id objc_msgSend_createdByIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 createdByIdentifier];
}

id objc_msgSend_credentialForAccount_error_(void *a1, const char *a2, ...)
{
  return [a1 credentialForAccount:error:];
}

id objc_msgSend_credentialItemForKey_(void *a1, const char *a2, ...)
{
  return [a1 credentialItemForKey:];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return _[a1 currentCalendar];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _[a1 currentHandler];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return _[a1 currentLocale];
}

id objc_msgSend_currentOperation(void *a1, const char *a2, ...)
{
  return _[a1 currentOperation];
}

id objc_msgSend_currentRemoteDevicesForDestinations_service_listenerID_queue_completionBlock_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "currentRemoteDevicesForDestinations:service:listenerID:queue:completionBlock:");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_dataArchiver(void *a1, const char *a2, ...)
{
  return _[a1 dataArchiver];
}

id objc_msgSend_dataForAccount_service_(void *a1, const char *a2, ...)
{
  return [a1 dataForAccount:service:];
}

id objc_msgSend_dataTaskWithRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 dataTaskWithRequest:];
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return [a1 dataUsingEncoding:];
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return [a1 dataWithBytes:];
}

id objc_msgSend_dataWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 dataWithCapacity:];
}

id objc_msgSend_dataWithContentsOfFile_options_error_(void *a1, const char *a2, ...)
{
  return [a1 dataWithContentsOfFile:x0 options:x1 error:x2];
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return [a1 dataWithJSONObject:x0 options:x1 error:x2];
}

id objc_msgSend_dataWithLength_(void *a1, const char *a2, ...)
{
  return [a1 dataWithLength:];
}

id objc_msgSend_databaseWithDatabaseScope_(void *a1, const char *a2, ...)
{
  return [a1 databaseWithDatabaseScope:];
}

id objc_msgSend_dataclassProperties(void *a1, const char *a2, ...)
{
  return _[a1 dataclassProperties];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return [a1 dateByAddingTimeInterval:];
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

id objc_msgSend_daysOfWeek(void *a1, const char *a2, ...)
{
  return _[a1 daysOfWeek];
}

id objc_msgSend_declineFriendshipRequest_forSession_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "declineFriendshipRequest:forSession:completion:");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeObjectOfClasses:forKey:];
}

id objc_msgSend_decryptWithKey_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "decryptWithKey:error:");
}

id objc_msgSend_defaultButtonAction(void *a1, const char *a2, ...)
{
  return _[a1 defaultButtonAction];
}

id objc_msgSend_defaultButtonTitle(void *a1, const char *a2, ...)
{
  return _[a1 defaultButtonTitle];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultQueue(void *a1, const char *a2, ...)
{
  return _[a1 defaultQueue];
}

id objc_msgSend_defaultSessionConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 defaultSessionConfiguration];
}

id objc_msgSend_defaultSound(void *a1, const char *a2, ...)
{
  return _[a1 defaultSound];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _[a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_deleteFence_completion_(void *a1, const char *a2, ...)
{
  return [a1 deleteFence:completion:];
}

id objc_msgSend_deleteRecordWithRecordID_inDatabaseWithScope_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 deleteRecordWithRecordID:x0 inDatabaseWithScope:x1 withCompletion:x2];
}

id objc_msgSend_deleteRecordZonesWithID_fromDatabase_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 deleteRecordZonesWithID:fromDatabase:withCompletion:];
}

id objc_msgSend_deleteZoneWithID_inDatabase_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 deleteZoneWithID:x0 inDatabase:x1 withCompletion:x2];
}

id objc_msgSend_deltasFromExisting_usingLatest_forKey_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "deltasFromExisting:usingLatest:forKey:");
}

id objc_msgSend_deregisterDelegate_(void *a1, const char *a2, ...)
{
  return [a1 deregisterDelegate:];
}

id objc_msgSend_deregisterWithAPS(void *a1, const char *a2, ...)
{
  return _[a1 deregisterWithAPS];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_descriptorForRequiredKeysForStyle_(void *a1, const char *a2, ...)
{
  return [a1 descriptorForRequiredKeysForStyle:];
}

id objc_msgSend_determineNewMeDevice(void *a1, const char *a2, ...)
{
  return _[a1 determineNewMeDevice];
}

id objc_msgSend_deviceClass(void *a1, const char *a2, ...)
{
  return _[a1 deviceClass];
}

id objc_msgSend_deviceId(void *a1, const char *a2, ...)
{
  return _[a1 deviceId];
}

id objc_msgSend_deviceName(void *a1, const char *a2, ...)
{
  return _[a1 deviceName];
}

id objc_msgSend_deviceSharingLocation(void *a1, const char *a2, ...)
{
  return _[a1 deviceSharingLocation];
}

id objc_msgSend_deviceUDID(void *a1, const char *a2, ...)
{
  return _[a1 deviceUDID];
}

id objc_msgSend_deviceWithId_name_idsDeviceId_isActive_isThisDevice_isCompanionDevice_isAutoMeCapable_(void *a1, const char *a2, ...)
{
  return [a1 deviceWithId:x0 name:x1 idsDeviceId:x2 isActive:x3 isThisDevice:x4 isCompanionDevice:x5 isAutoMeCapable:x6];
}

id objc_msgSend_devicesFromData_meDeviceId_thisDeviceId_companionDeviceId_(void *a1, const char *a2, ...)
{
  return [a1 devicesFromData:x0 meDeviceId:x1 thisDeviceId:x2 companionDeviceId:x3];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryForKey_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryForKey:];
}

id objc_msgSend_dictionaryValue(void *a1, const char *a2, ...)
{
  return _[a1 dictionaryValue];
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithCapacity:];
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithContentsOfFile:];
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObject:forKey:];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_dictionaryWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjectsAndKeys:];
}

id objc_msgSend_didAddFollowerHandle_(void *a1, const char *a2, ...)
{
  return [a1 didAddFollowerHandle:];
}

id objc_msgSend_didChangeActiveLocationSharingDevice_(void *a1, const char *a2, ...)
{
  return [a1 didChangeActiveLocationSharingDevice:];
}

id objc_msgSend_didReceiveAPSMessage_onTopic_(void *a1, const char *a2, ...)
{
  return [a1 didReceiveAPSMessage:onTopic:];
}

id objc_msgSend_didReceiveAPSToken_(void *a1, const char *a2, ...)
{
  return [a1 didReceiveAPSToken:];
}

id objc_msgSend_didReceiveFriendshipRequest_(void *a1, const char *a2, ...)
{
  return [a1 didReceiveFriendshipRequest:];
}

id objc_msgSend_didReceiveServerError_(void *a1, const char *a2, ...)
{
  return [a1 didReceiveServerError:];
}

id objc_msgSend_didRemoveFollowerHandle_(void *a1, const char *a2, ...)
{
  return [a1 didRemoveFollowerHandle:];
}

id objc_msgSend_didStartFollowingHandle_(void *a1, const char *a2, ...)
{
  return [a1 didStartFollowingHandle:];
}

id objc_msgSend_didStopFollowingHandle_(void *a1, const char *a2, ...)
{
  return [a1 didStopFollowingHandle:];
}

id objc_msgSend_didUpdateActiveDeviceList_(void *a1, const char *a2, ...)
{
  return [a1 didUpdateActiveDeviceList:];
}

id objc_msgSend_didUpdateFavorites_(void *a1, const char *a2, ...)
{
  return [a1 didUpdateFavorites:];
}

id objc_msgSend_didUpdateFences_(void *a1, const char *a2, ...)
{
  return [a1 didUpdateFences:];
}

id objc_msgSend_didUpdateFollowers_(void *a1, const char *a2, ...)
{
  return [a1 didUpdateFollowers:];
}

id objc_msgSend_didUpdateFollowing_(void *a1, const char *a2, ...)
{
  return [a1 didUpdateFollowing:];
}

id objc_msgSend_didUpdateHideFromFollowersStatus_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "didUpdateHideFromFollowersStatus:");
}

id objc_msgSend_didUpdateLocations_(void *a1, const char *a2, ...)
{
  return [a1 didUpdateLocations:];
}

id objc_msgSend_didUpdatePendingOffersForHandles_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "didUpdatePendingOffersForHandles:");
}

id objc_msgSend_didUpdatePreferences_(void *a1, const char *a2, ...)
{
  return [a1 didUpdatePreferences:];
}

id objc_msgSend_digestCommand_(void *a1, const char *a2, ...)
{
  return [a1 digestCommand:];
}

id objc_msgSend_dismissMsgOnLock(void *a1, const char *a2, ...)
{
  return _[a1 dismissMsgOnLock];
}

id objc_msgSend_dismissMsgOnUnlock(void *a1, const char *a2, ...)
{
  return _[a1 dismissMsgOnUnlock];
}

id objc_msgSend_dispayOfferAlertDialogsWithoutRepeatForError_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "dispayOfferAlertDialogsWithoutRepeatForError:");
}

id objc_msgSend_displayLocationName(void *a1, const char *a2, ...)
{
  return _[a1 displayLocationName];
}

id objc_msgSend_displayNameForContact_andHandle_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "displayNameForContact:andHandle:");
}

id objc_msgSend_displayiCloudUserNotificationWithTitleLocKey_messageLocKey_switchString_doNotSwitch_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "displayiCloudUserNotificationWithTitleLocKey:messageLocKey:switchString:doNotSwitch:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_donateFollowingsChangeEventsForAddedFollowings_removedFollowings_(void *a1, const char *a2, ...)
{
  return [a1 donateFollowingsChangeEventsForAddedFollowings:x0 removedFollowings:x1];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_dsIds(void *a1, const char *a2, ...)
{
  return _[a1 dsIds];
}

id objc_msgSend_dsid(void *a1, const char *a2, ...)
{
  return _[a1 dsid];
}

id objc_msgSend_e928760c5fbc1719e59c427e2be01ce6(void *a1, const char *a2, ...)
{
  return _[a1 e928760c5fbc1719e59c427e2be01ce6];
}

id objc_msgSend_email(void *a1, const char *a2, ...)
{
  return _[a1 email];
}

id objc_msgSend_emailAddress(void *a1, const char *a2, ...)
{
  return _[a1 emailAddress];
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeObject:forKey:];
}

id objc_msgSend_encryptWithKey_error_(void *a1, const char *a2, ...)
{
  return [a1 encryptWithKey:x0 error:x1];
}

id objc_msgSend_encryptedValuesByKey(void *a1, const char *a2, ...)
{
  return _[a1 encryptedValuesByKey];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return _[a1 endDate];
}

id objc_msgSend_endHour(void *a1, const char *a2, ...)
{
  return _[a1 endHour];
}

id objc_msgSend_endMin(void *a1, const char *a2, ...)
{
  return _[a1 endMin];
}

id objc_msgSend_endTransaction_(void *a1, const char *a2, ...)
{
  return [a1 endTransaction:];
}

id objc_msgSend_enqueueNotification_postingStyle_coalesceMask_forModes_(void *a1, const char *a2, ...)
{
  return [a1 enqueueNotification:x0 postingStyle:x1 coalesceMask:x2 forModes:x3];
}

id objc_msgSend_enter5XXGracePeriod(void *a1, const char *a2, ...)
{
  return _[a1 enter5XXGracePeriod];
}

id objc_msgSend_enumToStringMap(void *a1, const char *a2, ...)
{
  return _[a1 enumToStringMap];
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateKeysAndObjectsUsingBlock:];
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateObjectsUsingBlock:];
}

id objc_msgSend_enumeratorAtPath_(void *a1, const char *a2, ...)
{
  return [a1 enumeratorAtPath:];
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return _[a1 environment];
}

id objc_msgSend_environmentName(void *a1, const char *a2, ...)
{
  return _[a1 environmentName];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return _[a1 error];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 errorWithDomain:x0 code:x1 userInfo:x2];
}

id objc_msgSend_executeNextOperation(void *a1, const char *a2, ...)
{
  return _[a1 executeNextOperation];
}

id objc_msgSend_executeWithCompletion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "executeWithCompletion:");
}

id objc_msgSend_executionCompletionBlock(void *a1, const char *a2, ...)
{
  return _[a1 executionCompletionBlock];
}

id objc_msgSend_exit5XXGracePeriod(void *a1, const char *a2, ...)
{
  return _[a1 exit5XXGracePeriod];
}

id objc_msgSend_expireInitTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 expireInitTimestamp];
}

id objc_msgSend_expiresByGroupId(void *a1, const char *a2, ...)
{
  return _[a1 expiresByGroupId];
}

id objc_msgSend_expiresDate(void *a1, const char *a2, ...)
{
  return _[a1 expiresDate];
}

id objc_msgSend_exportedInterface(void *a1, const char *a2, ...)
{
  return _[a1 exportedInterface];
}

id objc_msgSend_extendFriendshipOfferRequest_forSession_callerId_completion_(void *a1, const char *a2, ...)
{
  return [a1 extendFriendshipOfferRequest:x0 forSession:x1 callerId:x2 completion:x3];
}

id objc_msgSend_favoriteHandles(void *a1, const char *a2, ...)
{
  return _[a1 favoriteHandles];
}

id objc_msgSend_favoriteOrder(void *a1, const char *a2, ...)
{
  return _[a1 favoriteOrder];
}

id objc_msgSend_favorites(void *a1, const char *a2, ...)
{
  return _[a1 favorites];
}

id objc_msgSend_favoritesData(void *a1, const char *a2, ...)
{
  return _[a1 favoritesData];
}

id objc_msgSend_favoritesDataFromHandles_(void *a1, const char *a2, ...)
{
  return [a1 favoritesDataFromHandles:];
}

id objc_msgSend_favoritesHandlesInHandles_(void *a1, const char *a2, ...)
{
  return [a1 favoritesHandlesInHandles:];
}

id objc_msgSend_favoritesHandlesUpdateQueue(void *a1, const char *a2, ...)
{
  return _[a1 favoritesHandlesUpdateQueue];
}

id objc_msgSend_favoritesManager(void *a1, const char *a2, ...)
{
  return _[a1 favoritesManager];
}

id objc_msgSend_favoritesSequencer(void *a1, const char *a2, ...)
{
  return _[a1 favoritesSequencer];
}

id objc_msgSend_fence(void *a1, const char *a2, ...)
{
  return _[a1 fence];
}

id objc_msgSend_fenceDictionariesFromResponseDictionary_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "fenceDictionariesFromResponseDictionary:");
}

id objc_msgSend_fenceManager(void *a1, const char *a2, ...)
{
  return _[a1 fenceManager];
}

id objc_msgSend_fenceManager_didModifyFence_clientSession_withCompletion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "fenceManager:didModifyFence:clientSession:withCompletion:");
}

id objc_msgSend_fenceManager_didModifyFence_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 fenceManager:didModifyFence:withCompletion:];
}

id objc_msgSend_fenceSequencer(void *a1, const char *a2, ...)
{
  return _[a1 fenceSequencer];
}

id objc_msgSend_fenceWithID_(void *a1, const char *a2, ...)
{
  return [a1 fenceWithID:];
}

id objc_msgSend_fences(void *a1, const char *a2, ...)
{
  return _[a1 fences];
}

id objc_msgSend_fencesForHandles_(void *a1, const char *a2, ...)
{
  return [a1 fencesForHandles:];
}

id objc_msgSend_fencesForHandles_completion_(void *a1, const char *a2, ...)
{
  return [a1 fencesForHandles:completion:];
}

id objc_msgSend_fencesFromFenceDictionaries_(void *a1, const char *a2, ...)
{
  return [a1 fencesFromFenceDictionaries:];
}

id objc_msgSend_fencesOnMeByMe(void *a1, const char *a2, ...)
{
  return _[a1 fencesOnMeByMe];
}

id objc_msgSend_fencesOnMeByOthers(void *a1, const char *a2, ...)
{
  return _[a1 fencesOnMeByOthers];
}

id objc_msgSend_fencesOnOthersByMe(void *a1, const char *a2, ...)
{
  return _[a1 fencesOnOthersByMe];
}

id objc_msgSend_fencesOnOthersByOthers(void *a1, const char *a2, ...)
{
  return _[a1 fencesOnOthersByOthers];
}

id objc_msgSend_fetchAllRecordZonesOperation(void *a1, const char *a2, ...)
{
  return _[a1 fetchAllRecordZonesOperation];
}

id objc_msgSend_fetchChangeConfigurationsForZonesWithIDs_inScope_(void *a1, const char *a2, ...)
{
  return [a1 fetchChangeConfigurationsForZonesWithIDs:inScope:];
}

id objc_msgSend_fetchChangedRecordZonesWithID_andDeleteRecordZonesWithID_fromDatabase_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 fetchChangedRecordZonesWithID:andDeleteRecordZonesWithID:fromDatabase:withCompletion:];
}

id objc_msgSend_fetchChangedRecordZonesWithID_fromDatabase_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 fetchChangedRecordZonesWithID:x0 fromDatabase:x1 withCompletion:x2];
}

id objc_msgSend_fetchChangesFromDatabase_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 fetchChangesFromDatabase:x0 withCompletion:x1];
}

id objc_msgSend_fetchChangesWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 fetchChangesWithCompletion:];
}

id objc_msgSend_fetchLocationForHandles_callerId_priority_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "fetchLocationForHandles:callerId:priority:completion:")];
}

id objc_msgSend_fetchLocationForHandles_forSession_callerId_priority_completionBlock_(void *a1, const char *a2, ...)
{
  return [a1 fetchLocationForHandles:x0 forSession:x1 callerId:x2 priority:x3 completionBlock:x4];
}

id objc_msgSend_fetchShareParticipantsForHandles_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 fetchShareParticipantsForHandles:x0 withCompletion:x1];
}

id objc_msgSend_fetchUserRecordIDWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 fetchUserRecordIDWithCompletionHandler:];
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return [a1 fileExistsAtPath:];
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return [a1 fileURLWithPath:];
}

id objc_msgSend_filteredSetUsingPredicate_(void *a1, const char *a2, ...)
{
  return [a1 filteredSetUsingPredicate:];
}

id objc_msgSend_findMyLocationChangeStream(void *a1, const char *a2, ...)
{
  return _[a1 findMyLocationChangeStream];
}

id objc_msgSend_finishEncoding(void *a1, const char *a2, ...)
{
  return _[a1 finishEncoding];
}

id objc_msgSend_finishWithFence_error_(void *a1, const char *a2, ...)
{
  return [a1 finishWithFence:error:];
}

id objc_msgSend_firstFutureStartDateFromHiddenScheduledFences_order_(void *a1, const char *a2, ...)
{
  return [a1 firstFutureStartDateFromHiddenScheduledFences:order:];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_firstWeekday(void *a1, const char *a2, ...)
{
  return _[a1 firstWeekday];
}

id objc_msgSend_fm_filter_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "fm_filter:");
}

id objc_msgSend_fm_firstObjectPassingTest_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "fm_firstObjectPassingTest:");
}

id objc_msgSend_fm_hexString(void *a1, const char *a2, ...)
{
  return [a1 fm_hexString];
}

id objc_msgSend_fm_map_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "fm_map:");
}

id objc_msgSend_fm_nullToNil(void *a1, const char *a2, ...)
{
  return [a1 fm_nullToNil];
}

id objc_msgSend_fm_randomBytes_(void *a1, const char *a2, ...)
{
  return [a1 fm_randomBytes:];
}

id objc_msgSend_fm_safeSetObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 fm_safeSetObject:forKey:];
}

id objc_msgSend_fmfAccountToken(void *a1, const char *a2, ...)
{
  return _[a1 fmfAccountToken];
}

id objc_msgSend_fmfAppHostName(void *a1, const char *a2, ...)
{
  return _[a1 fmfAppHostName];
}

id objc_msgSend_fmfAppToken(void *a1, const char *a2, ...)
{
  return _[a1 fmfAppToken];
}

id objc_msgSend_fmfIDSService(void *a1, const char *a2, ...)
{
  return _[a1 fmfIDSService];
}

id objc_msgSend_fmf_otherParticipants(void *a1, const char *a2, ...)
{
  return [a1 fmf_otherParticipants];
}

id objc_msgSend_fmf_withCurrentUserDefaultName(void *a1, const char *a2, ...)
{
  return [a1 fmf_withCurrentUserDefaultName];
}

id objc_msgSend_followedGivenName(void *a1, const char *a2, ...)
{
  return _[a1 followedGivenName];
}

id objc_msgSend_followedHandleForFence_(void *a1, const char *a2, ...)
{
  return [a1 followedHandleForFence:];
}

id objc_msgSend_follower(void *a1, const char *a2, ...)
{
  return _[a1 follower];
}

id objc_msgSend_followerGivenName(void *a1, const char *a2, ...)
{
  return _[a1 followerGivenName];
}

id objc_msgSend_followerHandleForFence_(void *a1, const char *a2, ...)
{
  return [a1 followerHandleForFence:];
}

id objc_msgSend_followerHandleForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 followerHandleForIdentifier:];
}

id objc_msgSend_followerHandleForServerId_(void *a1, const char *a2, ...)
{
  return [a1 followerHandleForServerId:];
}

id objc_msgSend_followerHandles(void *a1, const char *a2, ...)
{
  return _[a1 followerHandles];
}

id objc_msgSend_followerIds(void *a1, const char *a2, ...)
{
  return _[a1 followerIds];
}

id objc_msgSend_followersFullyInited(void *a1, const char *a2, ...)
{
  return _[a1 followersFullyInited];
}

id objc_msgSend_followersInfoReceived(void *a1, const char *a2, ...)
{
  return _[a1 followersInfoReceived];
}

id objc_msgSend_followersUsingData_(void *a1, const char *a2, ...)
{
  return [a1 followersUsingData:];
}

id objc_msgSend_following(void *a1, const char *a2, ...)
{
  return _[a1 following];
}

id objc_msgSend_followingFullyInited(void *a1, const char *a2, ...)
{
  return _[a1 followingFullyInited];
}

id objc_msgSend_followingHandleForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 followingHandleForIdentifier:];
}

id objc_msgSend_followingHandleForServerId_(void *a1, const char *a2, ...)
{
  return [a1 followingHandleForServerId:];
}

id objc_msgSend_followingHandles(void *a1, const char *a2, ...)
{
  return _[a1 followingHandles];
}

id objc_msgSend_followingInfoReceived(void *a1, const char *a2, ...)
{
  return _[a1 followingInfoReceived];
}

id objc_msgSend_forceRefreshWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 forceRefreshWithCompletion:];
}

id objc_msgSend_formattedAddress(void *a1, const char *a2, ...)
{
  return _[a1 formattedAddress];
}

id objc_msgSend_friendIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 friendIdentifier];
}

id objc_msgSend_friendIds(void *a1, const char *a2, ...)
{
  return _[a1 friendIds];
}

id objc_msgSend_friendRequestId(void *a1, const char *a2, ...)
{
  return _[a1 friendRequestId];
}

id objc_msgSend_friendRequestsFromData_forType_(void *a1, const char *a2, ...)
{
  return [a1 friendRequestsFromData:x0 forType:x1];
}

id objc_msgSend_friendshipRequestToHandles_fromHandle_withType_groupId_withEndDate_(void *a1, const char *a2, ...)
{
  return [a1 friendshipRequestToHandles:x0 fromHandle:x1 withType:x2 groupId:x3 withEndDate:x4];
}

id objc_msgSend_fromHandle(void *a1, const char *a2, ...)
{
  return _[a1 fromHandle];
}

id objc_msgSend_futureFollowerRequests(void *a1, const char *a2, ...)
{
  return _[a1 futureFollowerRequests];
}

id objc_msgSend_futureFollowingRequests(void *a1, const char *a2, ...)
{
  return _[a1 futureFollowingRequests];
}

id objc_msgSend_genericFriendName(void *a1, const char *a2, ...)
{
  return _[a1 genericFriendName];
}

id objc_msgSend_getAccountEmailAddress(void *a1, const char *a2, ...)
{
  return _[a1 getAccountEmailAddress];
}

id objc_msgSend_getContactForHandle_(void *a1, const char *a2, ...)
{
  return [a1 getContactForHandle:];
}

id objc_msgSend_getContactForHandle_keysToFetch_(void *a1, const char *a2, ...)
{
  return [a1 getContactForHandle:x0 keysToFetch:x1];
}

id objc_msgSend_getFenceWithCKRecordName_timeout_block_(void *a1, const char *a2, ...)
{
  return [a1 getFenceWithCKRecordName:x0 timeout:x1 block:x2];
}

id objc_msgSend_getFenceWithID_timeout_block_(void *a1, const char *a2, ...)
{
  return [a1 getFenceWithID:x0 timeout:x1 block:x2];
}

id objc_msgSend_getFences_(void *a1, const char *a2, ...)
{
  return [a1 getFences:];
}

id objc_msgSend_getHandlesSharingLocationsWithMe_(void *a1, const char *a2, ...)
{
  return [a1 getHandlesSharingLocationsWithMe:];
}

id objc_msgSend_getHandlesSharingLocationsWithMeWithGroupId_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "getHandlesSharingLocationsWithMeWithGroupId:completion:");
}

id objc_msgSend_getHandlesSharingMyLocation_(void *a1, const char *a2, ...)
{
  return [a1 getHandlesSharingMyLocation:];
}

id objc_msgSend_getHandlesSharingMyLocationWithGroupId_completion_(void *a1, const char *a2, ...)
{
  return [a1 getHandlesSharingMyLocationWithGroupId:completion:];
}

id objc_msgSend_getHandlesWithPendingOffers_(void *a1, const char *a2, ...)
{
  return [a1 getHandlesWithPendingOffers:];
}

id objc_msgSend_getHandlesWithPendingOffersSync(void *a1, const char *a2, ...)
{
  return _[a1 getHandlesWithPendingOffersSync];
}

id objc_msgSend_getLocationForHandles_forSession_callerId_priority_completionBlock_(void *a1, const char *a2, ...)
{
  return [a1 getLocationForHandles:forSession:callerId:priority:completionBlock:];
}

id objc_msgSend_getPendingFriendshipRequestsWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 getPendingFriendshipRequestsWithCompletion:];
}

id objc_msgSend_getPendingMappingPacketsForHandle_groupId_forSession_completion_(void *a1, const char *a2, ...)
{
  return [a1 getPendingMappingPacketsForHandle:groupId:forSession:completion:];
}

id objc_msgSend_graceInterval401InSec(void *a1, const char *a2, ...)
{
  return _[a1 graceInterval401InSec];
}

id objc_msgSend_graceInterval5XXInSec(void *a1, const char *a2, ...)
{
  return _[a1 graceInterval5XXInSec];
}

id objc_msgSend_groupId(void *a1, const char *a2, ...)
{
  return _[a1 groupId];
}

id objc_msgSend_handle(void *a1, const char *a2, ...)
{
  return _[a1 handle];
}

id objc_msgSend_handleAlarmForAlarmName_(void *a1, const char *a2, ...)
{
  return [a1 handleAlarmForAlarmName:];
}

id objc_msgSend_handleAlertAction_(void *a1, const char *a2, ...)
{
  return [a1 handleAlertAction:];
}

id objc_msgSend_handleDarwinNotificationsWithHandlers_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "handleDarwinNotificationsWithHandlers:");
}

id objc_msgSend_handleDistributedNotificationsWithHandlers_(void *a1, const char *a2, ...)
{
  return [a1 handleDistributedNotificationsWithHandlers:];
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_handleIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 handleIdentifiers];
}

id objc_msgSend_handleIdentityLossWithCompletion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "handleIdentityLossWithCompletion:");
}

id objc_msgSend_handleMessage_onTopic_(void *a1, const char *a2, ...)
{
  return [a1 handleMessage:onTopic:];
}

id objc_msgSend_handleReceiveCKShareWithURLString_invitationTokenBase64String_(void *a1, const char *a2, ...)
{
  return [a1 handleReceiveCKShareWithURLString:x0 invitationTokenBase64String:x1];
}

id objc_msgSend_handleWithId_(void *a1, const char *a2, ...)
{
  return [a1 handleWithId:];
}

id objc_msgSend_handleWithId_serverId_(void *a1, const char *a2, ...)
{
  return [a1 handleWithId:serverId:];
}

id objc_msgSend_handles(void *a1, const char *a2, ...)
{
  return _[a1 handles];
}

id objc_msgSend_handles_minusHandle_(void *a1, const char *a2, ...)
{
  return [a1 handles:minusHandle:];
}

id objc_msgSend_handlesFromData_forType_(void *a1, const char *a2, ...)
{
  return [a1 handlesFromData:forType:];
}

id objc_msgSend_handlesFromData_withHandlesKey_(void *a1, const char *a2, ...)
{
  return [a1 handlesFromData:x0 withHandlesKey:x1];
}

id objc_msgSend_handlesQueue(void *a1, const char *a2, ...)
{
  return _[a1 handlesQueue];
}

id objc_msgSend_handlesToLocate(void *a1, const char *a2, ...)
{
  return _[a1 handlesToLocate];
}

id objc_msgSend_hasCredentials(void *a1, const char *a2, ...)
{
  return _[a1 hasCredentials];
}

id objc_msgSend_hasFirstUnlocked(void *a1, const char *a2, ...)
{
  return _[a1 hasFirstUnlocked];
}

id objc_msgSend_hasIDSFenceCapabilityForHandle_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 hasIDSFenceCapabilityForHandle:withCompletion:];
}

id objc_msgSend_hasModelInitialized(void *a1, const char *a2, ...)
{
  return _[a1 hasModelInitialized];
}

id objc_msgSend_hasPendingOfferToHandle_withGroupId_(void *a1, const char *a2, ...)
{
  return [a1 hasPendingOfferToHandle:withGroupId:];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return [a1 hasPrefix:];
}

id objc_msgSend_hashForToken_(void *a1, const char *a2, ...)
{
  return [a1 hashForToken:];
}

id objc_msgSend_hashedAPSTokenMatchesStoredToken_(void *a1, const char *a2, ...)
{
  return [a1 hashedAPSTokenMatchesStoredToken:];
}

id objc_msgSend_heartbeatIntervalInSec(void *a1, const char *a2, ...)
{
  return _[a1 heartbeatIntervalInSec];
}

id objc_msgSend_hideKeychainUI(void *a1, const char *a2, ...)
{
  return _[a1 hideKeychainUI];
}

id objc_msgSend_hideLocation(void *a1, const char *a2, ...)
{
  return _[a1 hideLocation];
}

id objc_msgSend_horizontalAccuracy(void *a1, const char *a2, ...)
{
  return _[a1 horizontalAccuracy];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return _[a1 host];
}

id objc_msgSend_iCloudAccountName(void *a1, const char *a2, ...)
{
  return _[a1 iCloudAccountName];
}

id objc_msgSend_iCloudId(void *a1, const char *a2, ...)
{
  return _[a1 iCloudId];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_idsCorrelationIdentifierWithCompletion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "idsCorrelationIdentifierWithCompletion:");
}

id objc_msgSend_idsDeviceId(void *a1, const char *a2, ...)
{
  return _[a1 idsDeviceId];
}

id objc_msgSend_idsStatus(void *a1, const char *a2, ...)
{
  return _[a1 idsStatus];
}

id objc_msgSend_idsValidatedHandlesStatus(void *a1, const char *a2, ...)
{
  return _[a1 idsValidatedHandlesStatus];
}

id objc_msgSend_importMappingPacket_forSession_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "importMappingPacket:forSession:completion:");
}

id objc_msgSend_infoByWindowStartDate_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "infoByWindowStartDate:");
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return _[a1 infoDictionary];
}

id objc_msgSend_informParticipantOfRemovedFenceWithID_ckRecordID_(void *a1, const char *a2, ...)
{
  return [a1 informParticipantOfRemovedFenceWithID:ckRecordID:];
}

id objc_msgSend_initFailed(void *a1, const char *a2, ...)
{
  return _[a1 initFailed];
}

id objc_msgSend_initForAvocadoIdentifier_inBundleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initForAvocadoIdentifier:x0 inBundleIdentifier:x1];
}

id objc_msgSend_initForReadingFromData_error_(void *a1, const char *a2, ...)
{
  return [a1 initForReadingFromData:x0 error:x1];
}

id objc_msgSend_initForWritingWithMutableData_(void *a1, const char *a2, ...)
{
  return [a1 initForWritingWithMutableData:];
}

id objc_msgSend_initSingleton(void *a1, const char *a2, ...)
{
  return _[a1 initSingleton];
}

id objc_msgSend_initWithAlertId_(void *a1, const char *a2, ...)
{
  return [a1 initWithAlertId:];
}

id objc_msgSend_initWithAllowFriendRequests_forSession_(void *a1, const char *a2, ...)
{
  return [a1 initWithAllowFriendRequests:forSession:];
}

id objc_msgSend_initWithBase64EncodedString_options_(void *a1, const char *a2, ...)
{
  return [a1 initWithBase64EncodedString:x0 options:x1];
}

id objc_msgSend_initWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithBundleIdentifier:];
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 initWithCapacity:];
}

id objc_msgSend_initWithClientSession_(void *a1, const char *a2, ...)
{
  return [a1 initWithClientSession:];
}

id objc_msgSend_initWithClientSession_andFavorites_(void *a1, const char *a2, ...)
{
  return [a1 initWithClientSession:andFavorites:];
}

id objc_msgSend_initWithClientSession_andFence_(void *a1, const char *a2, ...)
{
  return [a1 initWithClientSession:andFence:];
}

id objc_msgSend_initWithClientSession_device_(void *a1, const char *a2, ...)
{
  return [a1 initWithClientSession:device:];
}

id objc_msgSend_initWithClientSession_friendRequestId_accepted_(void *a1, const char *a2, ...)
{
  return [a1 initWithClientSession:x0 friendRequestId:x1 accepted:x2];
}

id objc_msgSend_initWithClientSession_handles_(void *a1, const char *a2, ...)
{
  return [a1 initWithClientSession:handles:];
}

id objc_msgSend_initWithClientSession_handles_groupId_(void *a1, const char *a2, ...)
{
  return [a1 initWithClientSession:x0 handles:x1 groupId:x2];
}

id objc_msgSend_initWithClientSession_handles_groupId_expiresDate_(void *a1, const char *a2, ...)
{
  return [a1 initWithClientSession:x0 handles:x1 groupId:x2 expiresDate:x3];
}

id objc_msgSend_initWithClientSession_idsClientStatusMap_(void *a1, const char *a2, ...)
{
  return [a1 initWithClientSession:idsClientStatusMap:];
}

id objc_msgSend_initWithClientSession_mappingPacketToken_(void *a1, const char *a2, ...)
{
  return [a1 initWithClientSession:mappingPacketToken];
}

id objc_msgSend_initWithConnection_(void *a1, const char *a2, ...)
{
  return [a1 initWithConnection:];
}

id objc_msgSend_initWithContainerID_options_(void *a1, const char *a2, ...)
{
  return [a1 initWithContainerID:options:];
}

id objc_msgSend_initWithContainerIdentifier_environment_(void *a1, const char *a2, ...)
{
  return [a1 initWithContainerIdentifier:environment:];
}

id objc_msgSend_initWithCoordinate_altitude_horizontalAccuracy_verticalAccuracy_timestamp_(void *a1, const char *a2, ...)
{
  return [a1 initWithCoordinate:x0 altitude:x1 horizontalAccuracy:x2 verticalAccuracy:x3 timestamp:x4];
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:x0 encoding:x1];
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return [a1 initWithDelegate:];
}

id objc_msgSend_initWithDescription_andTimeout_(void *a1, const char *a2, ...)
{
  return [a1 initWithDescription:andTimeout:];
}

id objc_msgSend_initWithDeviceId_(void *a1, const char *a2, ...)
{
  return [a1 initWithDeviceId:];
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return [a1 initWithDictionary:];
}

id objc_msgSend_initWithDictionary_forHandle_maxLocatingInterval_TTL_(void *a1, const char *a2, ...)
{
  return [a1 initWithDictionary:x0 forHandle:x1 maxLocatingInterval:x2 TTL:x3];
}

id objc_msgSend_initWithEmailAddress_(void *a1, const char *a2, ...)
{
  return [a1 initWithEmailAddress:];
}

id objc_msgSend_initWithEnvironmentName_(void *a1, const char *a2, ...)
{
  return [a1 initWithEnvironmentName:];
}

id objc_msgSend_initWithEnvironmentName_namedDelegatePort_queue_(void *a1, const char *a2, ...)
{
  return [a1 initWithEnvironmentName:namedDelegatePort:queue:];
}

id objc_msgSend_initWithFavorites_clientSession_completion_(void *a1, const char *a2, ...)
{
  return [a1 initWithFavorites:clientSession:completion:];
}

id objc_msgSend_initWithFenceManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithFenceManager:];
}

id objc_msgSend_initWithFileURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithFileURL:];
}

id objc_msgSend_initWithFromHandle_toHandle_ofType_groupId_endDate_requestId_(void *a1, const char *a2, ...)
{
  return [a1 initWithFromHandle:x0 toHandle:x1 ofType:x2 groupId:x3 endDate:x4 requestId:x5];
}

id objc_msgSend_initWithHandles_forSession_callerId_priority_reason_completionBlock_(void *a1, const char *a2, ...)
{
  return [a1 initWithHandles:v5 forSession:v6 callerId:v7 priority:v8 reason:v9 completionBlock:v10];
}

id objc_msgSend_initWithHideLocation_forSession_(void *a1, const char *a2, ...)
{
  return [a1 initWithHideLocation:forSession:];
}

id objc_msgSend_initWithIDSHandle_locationChangeType_(void *a1, const char *a2, ...)
{
  return [a1 initWithIDSHandle:x0 locationChangeType:x1];
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifier:];
}

id objc_msgSend_initWithLocality_administrativeArea_country_state_streetAddress_streetName_(void *a1, const char *a2, ...)
{
  return [a1 initWithLocality:x0 administrativeArea:x1 country:x2 state:x3 streetAddress:x4 streetName:x5];
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return [a1 initWithMachServiceName:];
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 initWithObjects:];
}

id objc_msgSend_initWithPhoneNumber_(void *a1, const char *a2, ...)
{
  return [a1 initWithPhoneNumber:];
}

id objc_msgSend_initWithPreviousServerChangeToken_(void *a1, const char *a2, ...)
{
  return [a1 initWithPreviousServerChangeToken:];
}

id objc_msgSend_initWithRecordName_zoneID_(void *a1, const char *a2, ...)
{
  return [a1 initWithRecordName:zoneID:];
}

id objc_msgSend_initWithRecordType_recordID_(void *a1, const char *a2, ...)
{
  return [a1 initWithRecordType:recordID:];
}

id objc_msgSend_initWithRecordZoneID_(void *a1, const char *a2, ...)
{
  return [a1 initWithRecordZoneID:];
}

id objc_msgSend_initWithRecordZoneIDs_configurationsByRecordZoneID_(void *a1, const char *a2, ...)
{
  return [a1 initWithRecordZoneIDs:x0 configurationsByRecordZoneID:x1];
}

id objc_msgSend_initWithRecordZonesToSave_recordZoneIDsToDelete_(void *a1, const char *a2, ...)
{
  return [a1 initWithRecordZonesToSave:x0 recordZoneIDsToDelete:x1];
}

id objc_msgSend_initWithRecordsToSave_recordIDsToDelete_(void *a1, const char *a2, ...)
{
  return [a1 initWithRecordsToSave:recordIDsToSave recordIDsToDelete:recordIDsToDelete];
}

id objc_msgSend_initWithService_(void *a1, const char *a2, ...)
{
  return [a1 initWithService:];
}

id objc_msgSend_initWithSet_(void *a1, const char *a2, ...)
{
  return [a1 initWithSet:];
}

id objc_msgSend_initWithShareMetadatas_(void *a1, const char *a2, ...)
{
  return [a1 initWithShareMetadatas:];
}

id objc_msgSend_initWithShareURLs_invitationTokensByShareURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithShareURLs:x0 invitationTokensByShareURL:x1];
}

id objc_msgSend_initWithSubscriptionID_(void *a1, const char *a2, ...)
{
  return [a1 initWithSubscriptionID:];
}

id objc_msgSend_initWithSubscriptionsToSave_subscriptionIDsToDelete_(void *a1, const char *a2, ...)
{
  return [a1 initWithSubscriptionsToSave:subscriptionIDsToSave subscriptionIDsToDelete:subscriptionIDsToDelete];
}

id objc_msgSend_initWithURL_cachePolicy_timeoutInterval_(void *a1, const char *a2, ...)
{
  return [a1 initWithURL:x0 cachePolicy:x1 timeoutInterval:x2];
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return [a1 initWithUUIDString:];
}

id objc_msgSend_initWithUserIdentityLookupInfos_(void *a1, const char *a2, ...)
{
  return [a1 initWithUserIdentityLookupInfos:];
}

id objc_msgSend_initWithZoneID_(void *a1, const char *a2, ...)
{
  return [a1 initWithZoneID:];
}

id objc_msgSend_initWithZoneName_ownerName_(void *a1, const char *a2, ...)
{
  return [a1 initWithZoneName:x0 ownerName:x1];
}

id objc_msgSend_initializeModelForSession_withReason_completion_(void *a1, const char *a2, ...)
{
  return [a1 initializeModelForSession:withReason:completion:];
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return [a1 insertObject:atIndex:];
}

id objc_msgSend_instanceForEnvironment_(void *a1, const char *a2, ...)
{
  return [a1 instanceForEnvironment:];
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

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return [a1 interfaceWithProtocol:];
}

id objc_msgSend_internalClientSessions(void *a1, const char *a2, ...)
{
  return _[a1 internalClientSessions];
}

id objc_msgSend_intersectSet_(void *a1, const char *a2, ...)
{
  return [a1 intersectSet:];
}

id objc_msgSend_intersectsSet_(void *a1, const char *a2, ...)
{
  return [a1 intersectsSet:];
}

id objc_msgSend_invalidLocation(void *a1, const char *a2, ...)
{
  return _[a1 invalidLocation];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invalidateAndCancel(void *a1, const char *a2, ...)
{
  return _[a1 invalidateAndCancel];
}

id objc_msgSend_invalidateMappingPackets_completion_(void *a1, const char *a2, ...)
{
  return [a1 invalidateMappingPackets:x0 completion:x1];
}

id objc_msgSend_invitationToken(void *a1, const char *a2, ...)
{
  return _[a1 invitationToken];
}

id objc_msgSend_inviteDate(void *a1, const char *a2, ...)
{
  return _[a1 inviteDate];
}

id objc_msgSend_inviteFencesPastInviteDate_(void *a1, const char *a2, ...)
{
  return [a1 inviteFencesPastInviteDate];
}

id objc_msgSend_invitePending(void *a1, const char *a2, ...)
{
  return _[a1 invitePending];
}

id objc_msgSend_isAccountAuthorized(void *a1, const char *a2, ...)
{
  return _[a1 isAccountAuthorized];
}

id objc_msgSend_isAccountBootstrapped(void *a1, const char *a2, ...)
{
  return _[a1 isAccountBootstrapped];
}

id objc_msgSend_isAccountSignedIn(void *a1, const char *a2, ...)
{
  return _[a1 isAccountSignedIn];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return _[a1 isActive];
}

id objc_msgSend_isActiveAutoMeDevice(void *a1, const char *a2, ...)
{
  return _[a1 isActiveAutoMeDevice];
}

id objc_msgSend_isActiveDevice(void *a1, const char *a2, ...)
{
  return _[a1 isActiveDevice];
}

id objc_msgSend_isAllowFriendRequestsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isAllowFriendRequestsEnabled];
}

id objc_msgSend_isAudioAccessory(void *a1, const char *a2, ...)
{
  return _[a1 isAudioAccessory];
}

id objc_msgSend_isCurrentAt_(void *a1, const char *a2, ...)
{
  return [a1 isCurrentAt:];
}

id objc_msgSend_isCurrentUser(void *a1, const char *a2, ...)
{
  return _[a1 isCurrentUser];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return [a1 isEqual:];
}

id objc_msgSend_isEqualToArray_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToArray:];
}

id objc_msgSend_isEqualToData_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToData:];
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

id objc_msgSend_isFMFAppRemoved(void *a1, const char *a2, ...)
{
  return _[a1 isFMFAppRemoved];
}

id objc_msgSend_isFromMe(void *a1, const char *a2, ...)
{
  return _[a1 isFromMe];
}

id objc_msgSend_isIdentityLossError_(void *a1, const char *a2, ...)
{
  return [a1 isIdentityLossError:];
}

id objc_msgSend_isIn5XXGracePeriod(void *a1, const char *a2, ...)
{
  return _[a1 isIn5XXGracePeriod];
}

id objc_msgSend_isInMultiUserMode(void *a1, const char *a2, ...)
{
  return _[a1 isInMultiUserMode];
}

id objc_msgSend_isInternalBuild(void *a1, const char *a2, ...)
{
  return _[a1 isInternalBuild];
}

id objc_msgSend_isLocatingInProgress(void *a1, const char *a2, ...)
{
  return _[a1 isLocatingInProgress];
}

id objc_msgSend_isLocationShiftRequiredForCoordinate_(void *a1, const char *a2, ...)
{
  return [a1 isLocationShiftRequiredForCoordinate:];
}

id objc_msgSend_isLocked(void *a1, const char *a2, ...)
{
  return _[a1 isLocked];
}

id objc_msgSend_isMoreRecentThan_(void *a1, const char *a2, ...)
{
  return [a1 isMoreRecentThan:];
}

id objc_msgSend_isMuted(void *a1, const char *a2, ...)
{
  return _[a1 isMuted];
}

id objc_msgSend_isNetworkReachable(void *a1, const char *a2, ...)
{
  return _[a1 isNetworkReachable];
}

id objc_msgSend_isOnMe(void *a1, const char *a2, ...)
{
  return _[a1 isOnMe];
}

id objc_msgSend_isPasscodeSet(void *a1, const char *a2, ...)
{
  return _[a1 isPasscodeSet];
}

id objc_msgSend_isPending(void *a1, const char *a2, ...)
{
  return _[a1 isPending];
}

id objc_msgSend_isProvisionedForDataclass_(void *a1, const char *a2, ...)
{
  return [a1 isProvisionedForDataclass:];
}

id objc_msgSend_isReachable(void *a1, const char *a2, ...)
{
  return _[a1 isReachable];
}

id objc_msgSend_isRecurring(void *a1, const char *a2, ...)
{
  return _[a1 isRecurring];
}

id objc_msgSend_isRegionAllowed(void *a1, const char *a2, ...)
{
  return _[a1 isRegionAllowed];
}

id objc_msgSend_isRenewingAccountCredentials(void *a1, const char *a2, ...)
{
  return _[a1 isRenewingAccountCredentials];
}

id objc_msgSend_isShallowLocate(void *a1, const char *a2, ...)
{
  return _[a1 isShallowLocate];
}

id objc_msgSend_isSharingThroughGroupId_(void *a1, const char *a2, ...)
{
  return [a1 isSharingThroughGroupId:];
}

id objc_msgSend_isStatusValidAtDate_reason_(void *a1, const char *a2, ...)
{
  return [a1 isStatusValidAtDate:reason:];
}

id objc_msgSend_isString_equalToString_(void *a1, const char *a2, ...)
{
  return [a1 isString:equalToString:];
}

id objc_msgSend_isSupported(void *a1, const char *a2, ...)
{
  return _[a1 isSupported];
}

id objc_msgSend_isThisDevice(void *a1, const char *a2, ...)
{
  return _[a1 isThisDevice];
}

id objc_msgSend_isThisDeviceRegistered(void *a1, const char *a2, ...)
{
  return _[a1 isThisDeviceRegistered];
}

id objc_msgSend_isUpdateGeoFenceCompleted(void *a1, const char *a2, ...)
{
  return _[a1 isUpdateGeoFenceCompleted];
}

id objc_msgSend_isUpdatingAccountCredentials(void *a1, const char *a2, ...)
{
  return _[a1 isUpdatingAccountCredentials];
}

id objc_msgSend_isUserAction(void *a1, const char *a2, ...)
{
  return _[a1 isUserAction];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return _[a1 isValid];
}

id objc_msgSend_isValidPendingOffer_(void *a1, const char *a2, ...)
{
  return [a1 isValidPendingOffer:];
}

id objc_msgSend_jsonResponseDictionary(void *a1, const char *a2, ...)
{
  return _[a1 jsonResponseDictionary];
}

id objc_msgSend_jsonResponseParseError(void *a1, const char *a2, ...)
{
  return _[a1 jsonResponseParseError];
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 keyEnumerator];
}

id objc_msgSend_keychainItemForService_withUsername_returningItem_(void *a1, const char *a2, ...)
{
  return [a1 keychainItemForService:withUsername:returningItem:];
}

id objc_msgSend_keychainManager(void *a1, const char *a2, ...)
{
  return _[a1 keychainManager];
}

id objc_msgSend_keysOfEntriesPassingTest_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "keysOfEntriesPassingTest:");
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return _[a1 label];
}

id objc_msgSend_lastLoggedInPrsId(void *a1, const char *a2, ...)
{
  return _[a1 lastLoggedInPrsId];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_lastRefreshDate(void *a1, const char *a2, ...)
{
  return _[a1 lastRefreshDate];
}

id objc_msgSend_lastSuccessfulInitDate(void *a1, const char *a2, ...)
{
  return _[a1 lastSuccessfulInitDate];
}

id objc_msgSend_lastSuccessfulResponseTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 lastSuccessfulResponseTimestamp];
}

id objc_msgSend_latest401TS(void *a1, const char *a2, ...)
{
  return _[a1 latest401TS];
}

id objc_msgSend_latest5XXTS(void *a1, const char *a2, ...)
{
  return _[a1 latest5XXTS];
}

id objc_msgSend_latestXPCActivityRegistrationTime(void *a1, const char *a2, ...)
{
  return _[a1 latestXPCActivityRegistrationTime];
}

id objc_msgSend_lazyInitTimeoutInSec(void *a1, const char *a2, ...)
{
  return _[a1 lazyInitTimeoutInSec];
}

id objc_msgSend_lazyInitTimeoutInSecStoredValue(void *a1, const char *a2, ...)
{
  return _[a1 lazyInitTimeoutInSecStoredValue];
}

id objc_msgSend_lazyTimeLoaded(void *a1, const char *a2, ...)
{
  return _[a1 lazyTimeLoaded];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return _[a1 listener];
}

id objc_msgSend_localTimeZone(void *a1, const char *a2, ...)
{
  return _[a1 localTimeZone];
}

id objc_msgSend_locality(void *a1, const char *a2, ...)
{
  return _[a1 locality];
}

id objc_msgSend_localizedDaysOfWeekString(void *a1, const char *a2, ...)
{
  return _[a1 localizedDaysOfWeekString];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_localizedEndTimeString(void *a1, const char *a2, ...)
{
  return _[a1 localizedEndTimeString];
}

id objc_msgSend_localizedNotificationTextForStatus_atDate_(void *a1, const char *a2, ...)
{
  return [a1 localizedNotificationTextForStatus:atDate:];
}

id objc_msgSend_localizedRequestNotificationStringForFollower_locationName_(void *a1, const char *a2, ...)
{
  return [a1 localizedRequestNotificationStringForFollower:locationName:];
}

id objc_msgSend_localizedStartTimeString(void *a1, const char *a2, ...)
{
  return _[a1 localizedStartTimeString];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringForKey:value:table:];
}

id objc_msgSend_localizedStringFromDate_dateStyle_timeStyle_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "localizedStringFromDate:dateStyle:timeStyle:")];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return _[a1 location];
}

id objc_msgSend_locationForHandle_(void *a1, const char *a2, ...)
{
  return [a1 locationForHandle:];
}

id objc_msgSend_locationFromRefresh_(void *a1, const char *a2, ...)
{
  return [a1 locationFromRefresh:];
}

id objc_msgSend_locationHidden(void *a1, const char *a2, ...)
{
  return _[a1 locationHidden];
}

id objc_msgSend_locationServicesEnabled(void *a1, const char *a2, ...)
{
  return _[a1 locationServicesEnabled];
}

id objc_msgSend_locationTTL(void *a1, const char *a2, ...)
{
  return _[a1 locationTTL];
}

id objc_msgSend_locationType(void *a1, const char *a2, ...)
{
  return _[a1 locationType];
}

id objc_msgSend_locationsForHandles_(void *a1, const char *a2, ...)
{
  return [a1 locationsForHandles:];
}

id objc_msgSend_lookupInfo(void *a1, const char *a2, ...)
{
  return _[a1 lookupInfo];
}

id objc_msgSend_lookupInfosForHandles_(void *a1, const char *a2, ...)
{
  return [a1 lookupInfosForHandles:];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseString];
}

id objc_msgSend_machServiceName(void *a1, const char *a2, ...)
{
  return _[a1 machServiceName];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return _[a1 mainQueue];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 mainRunLoop];
}

id objc_msgSend_makeObjectsPerformSelector_(void *a1, const char *a2, ...)
{
  return [a1 makeObjectsPerformSelector:];
}

id objc_msgSend_mappingPacketToken(void *a1, const char *a2, ...)
{
  return _[a1 mappingPacketToken];
}

id objc_msgSend_maxBootstrapInterval(void *a1, const char *a2, ...)
{
  return _[a1 maxBootstrapInterval];
}

id objc_msgSend_maxLocatingInterval(void *a1, const char *a2, ...)
{
  return _[a1 maxLocatingInterval];
}

id objc_msgSend_maxLocationRefreshTimeout(void *a1, const char *a2, ...)
{
  return _[a1 maxLocationRefreshTimeout];
}

id objc_msgSend_maxTriesToRegisterDevice(void *a1, const char *a2, ...)
{
  return _[a1 maxTriesToRegisterDevice];
}

id objc_msgSend_maxWaitTimeForRegisterMS(void *a1, const char *a2, ...)
{
  return _[a1 maxWaitTimeForRegisterMS];
}

id objc_msgSend_member_(void *a1, const char *a2, ...)
{
  return [a1 member:];
}

id objc_msgSend_migrateLegacyKeychainItems(void *a1, const char *a2, ...)
{
  return _[a1 migrateLegacyKeychainItems];
}

id objc_msgSend_minCallbackInterval(void *a1, const char *a2, ...)
{
  return _[a1 minCallbackInterval];
}

id objc_msgSend_minusSet_(void *a1, const char *a2, ...)
{
  return [a1 minusSet:];
}

id objc_msgSend_modelCache(void *a1, const char *a2, ...)
{
  return _[a1 modelCache];
}

id objc_msgSend_modelDidLoad(void *a1, const char *a2, ...)
{
  return _[a1 modelDidLoad];
}

id objc_msgSend_modelSpecificLocalizedStringKeyForKey_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "modelSpecificLocalizedStringKeyForKey:");
}

id objc_msgSend_modelVersion(void *a1, const char *a2, ...)
{
  return _[a1 modelVersion];
}

id objc_msgSend_msgText(void *a1, const char *a2, ...)
{
  return _[a1 msgText];
}

id objc_msgSend_msgTitle(void *a1, const char *a2, ...)
{
  return _[a1 msgTitle];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return _[a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_muteEndDate(void *a1, const char *a2, ...)
{
  return _[a1 muteEndDate];
}

id objc_msgSend_muteFences_withEndDate_completion_(void *a1, const char *a2, ...)
{
  return [a1 muteFences:withEndDate:completion:];
}

id objc_msgSend_muteFencesForHandle_untilDate_completion_(void *a1, const char *a2, ...)
{
  return [a1 muteFencesForHandle:x0 untilDate:x1 completion:x2];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_networkReachabilityUpdated_(void *a1, const char *a2, ...)
{
  return [a1 networkReachabilityUpdated:];
}

id objc_msgSend_nextTransactionId(void *a1, const char *a2, ...)
{
  return _[a1 nextTransactionId];
}

id objc_msgSend_notLoggedIntoiCloudAlert(void *a1, const char *a2, ...)
{
  return _[a1 notLoggedIntoiCloudAlert];
}

id objc_msgSend_notNowRequestToHandles_fromHandle_(void *a1, const char *a2, ...)
{
  return [a1 notNowRequestToHandles:fromHandle:];
}

id objc_msgSend_notificationWithName_object_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 notificationWithName:object:userInfo:];
}

id objc_msgSend_notifyClientOfUpdates_(void *a1, const char *a2, ...)
{
  return [a1 notifyClientOfUpdates:];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _[a1 now];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numberOfFriendsAndFollowers(void *a1, const char *a2, ...)
{
  return _[a1 numberOfFriendsAndFollowers];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return [a1 numberWithBool:];
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return [a1 numberWithDouble:];
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInt:];
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInteger:];
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInteger:];
}

id objc_msgSend_numberWithUnsignedLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedLong:];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndex:];
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndexedSubscript:];
}

id objc_msgSend_objectForInfoDictionaryKey_(void *a1, const char *a2, ...)
{
  return [a1 objectForInfoDictionaryKey:];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:];
}

id objc_msgSend_objectForKey_ofClass_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:ofClass:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_objectsPassingTest_(void *a1, const char *a2, ...)
{
  return [a1 objectsPassingTest:];
}

id objc_msgSend_offerExpireDateForHandle_withGroupId_(void *a1, const char *a2, ...)
{
  return [a1 offerExpireDateForHandle:withGroupId:];
}

id objc_msgSend_offerPending(void *a1, const char *a2, ...)
{
  return _[a1 offerPending];
}

id objc_msgSend_openSensitiveURL_withOptions_(void *a1, const char *a2, ...)
{
  return [a1 openSensitiveURL:withOptions:];
}

id objc_msgSend_openURL_withOptions_(void *a1, const char *a2, ...)
{
  return [a1 openURL:x0 withOptions:x1];
}

id objc_msgSend_operationType(void *a1, const char *a2, ...)
{
  return _[a1 operationType];
}

id objc_msgSend_osBuildVersion(void *a1, const char *a2, ...)
{
  return _[a1 osBuildVersion];
}

id objc_msgSend_osName(void *a1, const char *a2, ...)
{
  return _[a1 osName];
}

id objc_msgSend_osVersion(void *a1, const char *a2, ...)
{
  return _[a1 osVersion];
}

id objc_msgSend_ownerName(void *a1, const char *a2, ...)
{
  return _[a1 ownerName];
}

id objc_msgSend_packetsToInvalidate(void *a1, const char *a2, ...)
{
  return _[a1 packetsToInvalidate];
}

id objc_msgSend_participants(void *a1, const char *a2, ...)
{
  return _[a1 participants];
}

id objc_msgSend_password(void *a1, const char *a2, ...)
{
  return _[a1 password];
}

id objc_msgSend_passwordData(void *a1, const char *a2, ...)
{
  return _[a1 passwordData];
}

id objc_msgSend_pathForResource_ofType_(void *a1, const char *a2, ...)
{
  return [a1 pathForResource:ofType:];
}

id objc_msgSend_pathSuffix(void *a1, const char *a2, ...)
{
  return _[a1 pathSuffix];
}

id objc_msgSend_pathToAllUnacceptedCKSharesInDatabaseWithScope_(void *a1, const char *a2, ...)
{
  return [a1 pathToAllUnacceptedCKSharesInDatabaseWithScope:];
}

id objc_msgSend_pathToDataForRecordWithID_inDatabaseWithScope_(void *a1, const char *a2, ...)
{
  return [a1 pathToDataForRecordWithID:inDatabaseWithScope:];
}

id objc_msgSend_pathToDataForUnacceptedCKShareTokenForShareURL_InDatabaseWithScope_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "pathToDataForUnacceptedCKShareTokenForShareURL:InDatabaseWithScope:");
}

id objc_msgSend_pathToServerChangeTokenDataForScope_(void *a1, const char *a2, ...)
{
  return [a1 pathToServerChangeTokenDataForScope:];
}

id objc_msgSend_pathToServerChangeTokenDataForZoneWithID_inDatabaseWithScope_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "pathToServerChangeTokenDataForZoneWithID:inDatabaseWithScope:");
}

id objc_msgSend_pathToTriggerDataForFenceWithID_(void *a1, const char *a2, ...)
{
  return [a1 pathToTriggerDataForFenceWithID:];
}

id objc_msgSend_pendingFenceWithCKRecordName_(void *a1, const char *a2, ...)
{
  return [a1 pendingFenceWithCKRecordName:];
}

id objc_msgSend_pendingHandleFromData_withEmailKey_(void *a1, const char *a2, ...)
{
  return [a1 pendingHandleFromData:x0 withEmailKey:x1];
}

id objc_msgSend_pendingOfferHandles(void *a1, const char *a2, ...)
{
  return _[a1 pendingOfferHandles];
}

id objc_msgSend_pendingPushes(void *a1, const char *a2, ...)
{
  return _[a1 pendingPushes];
}

id objc_msgSend_phoneNumber(void *a1, const char *a2, ...)
{
  return _[a1 phoneNumber];
}

id objc_msgSend_placemark(void *a1, const char *a2, ...)
{
  return _[a1 placemark];
}

id objc_msgSend_platform(void *a1, const char *a2, ...)
{
  return _[a1 platform];
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return _[a1 port];
}

id objc_msgSend_postConfirmationNotificationWithUUID_atDate_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "postConfirmationNotificationWithUUID:atDate:");
}

id objc_msgSend_postConfirmationWithUUID_forFenceWithID_withText_forDate_completion_(void *a1, const char *a2, ...)
{
  return [a1 postConfirmationWithUUID:forFenceWithID:withText:forDate:completion:];
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationName:nil object:nil];
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationName:object:userInfo:];
}

id objc_msgSend_postReceiveTriggerNotificationWithUUID_forStatus_atDate_triggerLocation_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "postReceiveTriggerNotificationWithUUID:forStatus:atDate:triggerLocation:");
}

id objc_msgSend_postReceiveTriggerWithUUID_forFenceWithID_friendID_withText_forDate_triggerLocation_fenceLocation_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "postReceiveTriggerWithUUID:forFenceWithID:friendID:withText:forDate:triggerLocation:fenceLocation:completion:");
}

id objc_msgSend_postTriggerNotificationWithUUID_forStatus_atDate_triggerLocation_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "postTriggerNotificationWithUUID:forStatus:atDate:triggerLocation:");
}

id objc_msgSend_postTriggerWithUUID_forFenceWithID_followerID_withText_forDate_triggerLocation_fenceLocation_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "postTriggerWithUUID:forFenceWithID:followerID:withText:forDate:triggerLocation:fenceLocation:completion:");
}

id objc_msgSend_predicateWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 predicateWithBlock:];
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 predicateWithFormat:];
}

id objc_msgSend_preflightValidateCommand_(void *a1, const char *a2, ...)
{
  return [a1 preflightValidateCommand:];
}

id objc_msgSend_prettyGivenNameForHandle_(void *a1, const char *a2, ...)
{
  return [a1 prettyGivenNameForHandle:];
}

id objc_msgSend_prettyNameForHandle_(void *a1, const char *a2, ...)
{
  return [a1 prettyNameForHandle:];
}

id objc_msgSend_previousStartDateFrom_(void *a1, const char *a2, ...)
{
  return [a1 previousStartDateFrom:];
}

id objc_msgSend_previouslyAtLocationForDate_(void *a1, const char *a2, ...)
{
  return [a1 previouslyAtLocationForDate:];
}

id objc_msgSend_privateCloudDatabase(void *a1, const char *a2, ...)
{
  return _[a1 privateCloudDatabase];
}

id objc_msgSend_processCKError_(void *a1, const char *a2, ...)
{
  return [a1 processCKError:];
}

id objc_msgSend_processCommandError(void *a1, const char *a2, ...)
{
  return _[a1 processCommandError];
}

id objc_msgSend_processCommandResponse_(void *a1, const char *a2, ...)
{
  return [a1 processCommandResponse:];
}

id objc_msgSend_processId(void *a1, const char *a2, ...)
{
  return _[a1 processId];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 processIdentifier];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_productType(void *a1, const char *a2, ...)
{
  return _[a1 productType];
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return [a1 propertyListWithData:x0 options:x1 format:x2 error:x3];
}

id objc_msgSend_publicToken(void *a1, const char *a2, ...)
{
  return _[a1 publicToken];
}

id objc_msgSend_qualifiedIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 qualifiedIdentifier];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return _[a1 queue];
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return [a1 raise:];
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return [a1 rangeOfString:];
}

id objc_msgSend_readDictionaryAndClasses_error_(void *a1, const char *a2, ...)
{
  return [a1 readDictionaryAndClasses:error];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return _[a1 reason];
}

id objc_msgSend_receiveTriggerWithUUID_forFence_withStatus_atDate_triggerLocation_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "receiveTriggerWithUUID:forFence:withStatus:atDate:triggerLocation:completion:");
}

id objc_msgSend_receiveTriggerWithUUID_forFenceWithID_withStatus_atDate_triggerLocation_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "receiveTriggerWithUUID:forFenceWithID:withStatus:atDate:triggerLocation:");
}

id objc_msgSend_receiveTriggerWithUUID_status_atDate_triggerLocation_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "receiveTriggerWithUUID:status:atDate:triggerLocation:completion:");
}

id objc_msgSend_receivedMappingPacket_completion_(void *a1, const char *a2, ...)
{
  return [a1 receivedMappingPacket:completion:];
}

id objc_msgSend_recipients(void *a1, const char *a2, ...)
{
  return _[a1 recipients];
}

id objc_msgSend_recordID(void *a1, const char *a2, ...)
{
  return _[a1 recordID];
}

id objc_msgSend_recordName(void *a1, const char *a2, ...)
{
  return _[a1 recordName];
}

id objc_msgSend_recordWithID_inDatabaseWithScope_(void *a1, const char *a2, ...)
{
  return [a1 recordWithID:inDatabaseWithScope:];
}

id objc_msgSend_recordWithID_inScope_(void *a1, const char *a2, ...)
{
  return [a1 recordWithID:inScope:];
}

id objc_msgSend_records(void *a1, const char *a2, ...)
{
  return _[a1 records];
}

id objc_msgSend_recurringAndScheduledFencesForHandles_(void *a1, const char *a2, ...)
{
  return [a1 recurringAndScheduledFencesForHandles:];
}

id objc_msgSend_redirectedHostname(void *a1, const char *a2, ...)
{
  return _[a1 redirectedHostname];
}

id objc_msgSend_redirectsUpdaterQueue(void *a1, const char *a2, ...)
{
  return _[a1 redirectsUpdaterQueue];
}

id objc_msgSend_refreshDueToTapWithMessage_(void *a1, const char *a2, ...)
{
  return [a1 refreshDueToTapWithMessage:];
}

id objc_msgSend_refreshForSession_withReason_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 refreshForSession:withReason:withCompletion:];
}

id objc_msgSend_refreshIDStatusForDestination_service_listenerID_queue_completionBlock_(void *a1, const char *a2, ...)
{
  return [a1 refreshIDStatusForDestination:x0 service:x1 listenerID:x2 queue:x3 completionBlock:x4];
}

id objc_msgSend_refreshLocationForHandles_forSession_callerId_priority_reason_completionBlock_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "refreshLocationForHandles:forSession:callerId:priority:reason:completionBlock:");
}

id objc_msgSend_refreshLocationsForSession_(void *a1, const char *a2, ...)
{
  return [a1 refreshLocationsForSession:];
}

id objc_msgSend_refreshScheduled(void *a1, const char *a2, ...)
{
  return _[a1 refreshScheduled];
}

id objc_msgSend_refreshTimer(void *a1, const char *a2, ...)
{
  return _[a1 refreshTimer];
}

id objc_msgSend_registerAlarms(void *a1, const char *a2, ...)
{
  return _[a1 registerAlarms];
}

id objc_msgSend_registerDefaults_(void *a1, const char *a2, ...)
{
  return [a1 registerDefaults:];
}

id objc_msgSend_registerDelegate_forTopic_(void *a1, const char *a2, ...)
{
  return [a1 registerDelegate:forTopic:];
}

id objc_msgSend_registerSignalHandlers(void *a1, const char *a2, ...)
{
  return _[a1 registerSignalHandlers];
}

id objc_msgSend_registerWithAPS(void *a1, const char *a2, ...)
{
  return _[a1 registerWithAPS];
}

id objc_msgSend_registerXPCEventHandlers(void *a1, const char *a2, ...)
{
  return _[a1 registerXPCEventHandlers];
}

id objc_msgSend_registeredDelegates(void *a1, const char *a2, ...)
{
  return _[a1 registeredDelegates];
}

id objc_msgSend_registrationCheckTimer(void *a1, const char *a2, ...)
{
  return _[a1 registrationCheckTimer];
}

id objc_msgSend_registrationRetries(void *a1, const char *a2, ...)
{
  return _[a1 registrationRetries];
}

id objc_msgSend_reloadTimeline(void *a1, const char *a2, ...)
{
  return _[a1 reloadTimeline];
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxyWithErrorHandler:];
}

id objc_msgSend_removeAllFenceRecordZonesWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 removeAllFenceRecordZonesWithCompletion:];
}

id objc_msgSend_removeAllFenceRecordsZonesInDatabase_withCompletion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "removeAllFenceRecordsZonesInDatabase:withCompletion:");
}

id objc_msgSend_removeAllFriendHandles(void *a1, const char *a2, ...)
{
  return _[a1 removeAllFriendHandles];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeCharactersInString_(void *a1, const char *a2, ...)
{
  return [a1 removeCharactersInString:];
}

id objc_msgSend_removeClientSession_(void *a1, const char *a2, ...)
{
  return [a1 removeClientSession:];
}

id objc_msgSend_removeDevice_forSession_completion_(void *a1, const char *a2, ...)
{
  return [a1 removeDevice:forSession:completion:];
}

id objc_msgSend_removeFavorite_(void *a1, const char *a2, ...)
{
  return [a1 removeFavorite:];
}

id objc_msgSend_removeFavorite_clientSession_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "removeFavorite:clientSession:completion:");
}

id objc_msgSend_removeFence_clientSession_completion_(void *a1, const char *a2, ...)
{
  return [a1 removeFence:clientSession:completion:];
}

id objc_msgSend_removeFutureFollowerRequest_(void *a1, const char *a2, ...)
{
  return [a1 removeFutureFollowerRequest:];
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return [a1 removeItemAtPath:x0 error:x1];
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return [a1 removeItemAtURL:error:];
}

id objc_msgSend_removeKey_inDomain_(void *a1, const char *a2, ...)
{
  return [a1 removeKey:inDomain:];
}

id objc_msgSend_removeKeychainItemForService_withUsername_(void *a1, const char *a2, ...)
{
  return [a1 removeKeychainItemForService:withUsername:];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return [a1 removeObject:];
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectAtIndex:];
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectForKey:];
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectsForKeys:];
}

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectsInArray:];
}

id objc_msgSend_removeObjectsInRange_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectsInRange:];
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:];
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:name:object:];
}

id objc_msgSend_removeParticipant_(void *a1, const char *a2, ...)
{
  return [a1 removeParticipant:];
}

id objc_msgSend_removeRecordWithID_inDatabaseWithScope_error_(void *a1, const char *a2, ...)
{
  return [a1 removeRecordWithID:inDatabaseWithScope:error:];
}

id objc_msgSend_removeServerChangeTokenForZoneWithID_inDatabaseWithScope_error_(void *a1, const char *a2, ...)
{
  return [a1 removeServerChangeTokenForZoneWithID:inDatabaseWithScope:error:];
}

id objc_msgSend_removeStoredAPSToken(void *a1, const char *a2, ...)
{
  return _[a1 removeStoredAPSToken];
}

id objc_msgSend_removeUnacceptedShareInvitationWithShareURLString_inDatabaseWithScope_error_(void *a1, const char *a2, ...)
{
  return [a1 removeUnacceptedShareInvitationWithShareURLString:x0 inDatabaseWithScope:x1 error:x2];
}

id objc_msgSend_removeUnrecoverableManateeFences_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 removeUnrecoverableManateeFences:withCompletion:];
}

id objc_msgSend_renewAccountCredentials_(void *a1, const char *a2, ...)
{
  return [a1 renewAccountCredentials:];
}

id objc_msgSend_renewCredentialsForAccount_force_reason_completion_(void *a1, const char *a2, ...)
{
  return [a1 renewCredentialsForAccount:force:reason:completion:];
}

id objc_msgSend_requestId(void *a1, const char *a2, ...)
{
  return _[a1 requestId];
}

id objc_msgSend_requestTokens(void *a1, const char *a2, ...)
{
  return _[a1 requestTokens];
}

id objc_msgSend_requestTokensStatusMap(void *a1, const char *a2, ...)
{
  return _[a1 requestTokensStatusMap];
}

id objc_msgSend_requestWithIdentifier_content_trigger_(void *a1, const char *a2, ...)
{
  return [a1 requestWithIdentifier:content:trigger:];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return _[a1 reset];
}

id objc_msgSend_resetABCachesInSession(void *a1, const char *a2, ...)
{
  return _[a1 resetABCachesInSession];
}

id objc_msgSend_resetABPreferencesCachesInSession(void *a1, const char *a2, ...)
{
  return _[a1 resetABPreferencesCachesInSession];
}

id objc_msgSend_resetModelToUninitialized(void *a1, const char *a2, ...)
{
  return _[a1 resetModelToUninitialized];
}

id objc_msgSend_resetRefreshTimer(void *a1, const char *a2, ...)
{
  return _[a1 resetRefreshTimer];
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return _[a1 response];
}

id objc_msgSend_responseId(void *a1, const char *a2, ...)
{
  return _[a1 responseId];
}

id objc_msgSend_restoreKeychainUI(void *a1, const char *a2, ...)
{
  return _[a1 restoreKeychainUI];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_retryAcceptShareWithURLString_invitationToken_forError_retryCount_(void *a1, const char *a2, ...)
{
  return [a1 retryAcceptShareWithURLString:x0 invitationToken:x1 forError:x2 retryCount:x3];
}

id objc_msgSend_retryAfterCredentialUpdate(void *a1, const char *a2, ...)
{
  return _[a1 retryAfterCredentialUpdate];
}

id objc_msgSend_retryAfterRenewCount(void *a1, const char *a2, ...)
{
  return _[a1 retryAfterRenewCount];
}

id objc_msgSend_retryCount(void *a1, const char *a2, ...)
{
  return _[a1 retryCount];
}

id objc_msgSend_retryInviteUnacceptedCKShares(void *a1, const char *a2, ...)
{
  return _[a1 retryInviteUnacceptedCKShares];
}

id objc_msgSend_retryOperationQueue(void *a1, const char *a2, ...)
{
  return _[a1 retryOperationQueue];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _[a1 run];
}

id objc_msgSend_safelyMapKey_toObject_(void *a1, const char *a2, ...)
{
  return [a1 safelyMapKey:toObject:];
}

id objc_msgSend_safelySetObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 safelySetObject:forKey:];
}

id objc_msgSend_sanitizeBlockList(void *a1, const char *a2, ...)
{
  return _[a1 sanitizeBlockList];
}

id objc_msgSend_sanitizeLocationsCache_(void *a1, const char *a2, ...)
{
  return [a1 sanitizeLocationsCache:];
}

id objc_msgSend_sanitizeLocationsCacheTimer(void *a1, const char *a2, ...)
{
  return _[a1 sanitizeLocationsCacheTimer];
}

id objc_msgSend_saveDictionary_error_(void *a1, const char *a2, ...)
{
  return [a1 saveDictionary:error];
}

id objc_msgSend_saveFavorites_clientSession_completion_(void *a1, const char *a2, ...)
{
  return [a1 saveFavorites:clientSession:completion:];
}

id objc_msgSend_saveFavoritesOperation(void *a1, const char *a2, ...)
{
  return _[a1 saveFavoritesOperation];
}

id objc_msgSend_saveFavoritesOperationExecutionQueue(void *a1, const char *a2, ...)
{
  return _[a1 saveFavoritesOperationExecutionQueue];
}

id objc_msgSend_saveFavoritesOperationUpdateQueue(void *a1, const char *a2, ...)
{
  return _[a1 saveFavoritesOperationUpdateQueue];
}

id objc_msgSend_saveVerifiedAccount_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 saveVerifiedAccount:withCompletionHandler:];
}

id objc_msgSend_schedule(void *a1, const char *a2, ...)
{
  return _[a1 schedule];
}

id objc_msgSend_scheduleRefreshBefore_(void *a1, const char *a2, ...)
{
  return [a1 scheduleRefreshBefore:];
}

id objc_msgSend_scheduleTimerFired(void *a1, const char *a2, ...)
{
  return _[a1 scheduleTimerFired];
}

id objc_msgSend_scheduledFences(void *a1, const char *a2, ...)
{
  return _[a1 scheduledFences];
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return [a1 scheduledTimerWithTimeInterval:x0 target:x1 selector:x2 userInfo:x3 repeats:x4];
}

id objc_msgSend_scheduler(void *a1, const char *a2, ...)
{
  return _[a1 scheduler];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return _[a1 scheme];
}

id objc_msgSend_scope(void *a1, const char *a2, ...)
{
  return _[a1 scope];
}

id objc_msgSend_scopeStringForAccountWithScope_(void *a1, const char *a2, ...)
{
  return [a1 scopeStringForAccountWithScope:];
}

id objc_msgSend_secondsFromGMT(void *a1, const char *a2, ...)
{
  return _[a1 secondsFromGMT];
}

id objc_msgSend_selectedHandles(void *a1, const char *a2, ...)
{
  return _[a1 selectedHandles];
}

id objc_msgSend_sendCommand_completionBlock_(void *a1, const char *a2, ...)
{
  return [a1 sendCommand:];
}

id objc_msgSend_sendDeletedFenceMessageWithFenceID_ckRecordID_toHandles_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "sendDeletedFenceMessageWithFenceID:ckRecordID:toHandles:error:");
}

id objc_msgSend_sendEvent_(void *a1, const char *a2, ...)
{
  return [a1 sendEvent:];
}

id objc_msgSend_sendFMFIDSPacket_toHandle_(void *a1, const char *a2, ...)
{
  return [a1 sendFMFIDSPacket:toHandle:];
}

id objc_msgSend_sendFMFIDSPacketsForHandleIdToMappingIdentifiers_(void *a1, const char *a2, ...)
{
  return [a1 sendFMFIDSPacketsForHandleIdToMappingIdentifiers:];
}

id objc_msgSend_sendFriendshipInviteRequest_forSession_callerId_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "sendFriendshipInviteRequest:forSession:callerId:completion:");
}

id objc_msgSend_sendFriendshipOfferRequest_forSession_callerId_completion_(void *a1, const char *a2, ...)
{
  return [a1 sendFriendshipOfferRequest:x0 forSession:x1 callerId:x2 completion:x3];
}

id objc_msgSend_sendFriendshipOfferToHandles_groupId_callerId_endDate_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "sendFriendshipOfferToHandles:groupId:callerId:endDate:completion:");
}

id objc_msgSend_sendInitWithLazyCheckForSession_withReason_completion_(void *a1, const char *a2, ...)
{
  return [a1 sendInitWithLazyCheckForSession:withReason:completion:];
}

id objc_msgSend_sendMappingPacket_toHandle_(void *a1, const char *a2, ...)
{
  return [a1 sendMappingPacket:toHandle:];
}

id objc_msgSend_sendMessage_toDestinations_priority_options_identifier_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "sendMessage:toDestinations:priority:options:identifier:error:");
}

id objc_msgSend_sendMessage_toIdentifier_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "sendMessage:toIdentifier:error:");
}

id objc_msgSend_sendNotNowRequest_forSession_callerId_completion_(void *a1, const char *a2, ...)
{
  return [a1 sendNotNowRequest:forSession:callerId:completion:];
}

id objc_msgSend_sendOnlyFMFChannel(void *a1, const char *a2, ...)
{
  return _[a1 sendOnlyFMFChannel];
}

id objc_msgSend_sendRequest(void *a1, const char *a2, ...)
{
  return _[a1 sendRequest];
}

id objc_msgSend_sendShareURL_andInvitationToken_recordName_toDestinationID_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "sendShareURL:andInvitationToken:recordName:toDestinationID:error:");
}

id objc_msgSend_sendTriggerWithUUID_forFenceWithID_withStatus_forDate_triggerLocation_toHandles_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "sendTriggerWithUUID:forFenceWithID:withStatus:forDate:triggerLocation:toHandles:error:");
}

id objc_msgSend_sendUpdateGeoFenceCommand(void *a1, const char *a2, ...)
{
  return _[a1 sendUpdateGeoFenceCommand];
}

id objc_msgSend_senderCorrelationIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 senderCorrelationIdentifier];
}

id objc_msgSend_senderIsValid_idsSenderRequirement_fenceId_ckRecordName_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 senderIsValid:idsSenderRequirement:fenceId:ckRecordName:withCompletion:];
}

id objc_msgSend_sequencer(void *a1, const char *a2, ...)
{
  return _[a1 sequencer];
}

id objc_msgSend_serverChangeTokenForDatabaseWithScope_(void *a1, const char *a2, ...)
{
  return [a1 serverChangeTokenForDatabaseWithScope:];
}

id objc_msgSend_serverChangeTokenForZoneWithID_inDatabaseWithScope_(void *a1, const char *a2, ...)
{
  return [a1 serverChangeTokenForZoneWithID:inDatabaseWithScope:];
}

id objc_msgSend_serverChangeTokens(void *a1, const char *a2, ...)
{
  return _[a1 serverChangeTokens];
}

id objc_msgSend_serverContextQueue(void *a1, const char *a2, ...)
{
  return _[a1 serverContextQueue];
}

id objc_msgSend_serverId(void *a1, const char *a2, ...)
{
  return _[a1 serverId];
}

id objc_msgSend_serverIds(void *a1, const char *a2, ...)
{
  return _[a1 serverIds];
}

id objc_msgSend_serverInteractionController(void *a1, const char *a2, ...)
{
  return _[a1 serverInteractionController];
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return _[a1 serviceName];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return _[a1 session];
}

id objc_msgSend_sessionConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 sessionConfiguration];
}

id objc_msgSend_sessionWithConfiguration_delegate_delegateQueue_(void *a1, const char *a2, ...)
{
  return [a1 sessionWithConfiguration:x0 delegate:x1 delegateQueue:x2];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAcceptSharesCompletionBlock_(void *a1, const char *a2, ...)
{
  return [a1 setAcceptSharesCompletionBlock:];
}

id objc_msgSend_setAcceptanceStatus_(void *a1, const char *a2, ...)
{
  return [a1 setAcceptanceStatus:];
}

id objc_msgSend_setAccepted_(void *a1, const char *a2, ...)
{
  return [a1 setAccepted:];
}

id objc_msgSend_setAccountStateAuthorizedDueTo401(void *a1, const char *a2, ...)
{
  return _[a1 setAccountStateAuthorizedDueTo401];
}

id objc_msgSend_setAccountStateUnauthorizedDueTo401(void *a1, const char *a2, ...)
{
  return _[a1 setAccountStateUnauthorizedDueTo401];
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return [a1 setActive:];
}

id objc_msgSend_setActiveCFNotificationsByCategory_(void *a1, const char *a2, ...)
{
  return [a1 setActiveCFNotificationsByCategory:];
}

id objc_msgSend_setActiveDevice_(void *a1, const char *a2, ...)
{
  return [a1 setActiveDevice:];
}

id objc_msgSend_setActiveDevice_forSession_completion_(void *a1, const char *a2, ...)
{
  return [a1 setActiveDevice:forSession:completion:];
}

id objc_msgSend_setActiveUserNotifications_(void *a1, const char *a2, ...)
{
  return [a1 setActiveUserNotifications:];
}

id objc_msgSend_setAlertId_(void *a1, const char *a2, ...)
{
  return [a1 setAlertId:];
}

id objc_msgSend_setAliasServerIds_(void *a1, const char *a2, ...)
{
  return [a1 setAliasServerIds:];
}

id objc_msgSend_setAllFences_(void *a1, const char *a2, ...)
{
  return [a1 setAllFences:];
}

id objc_msgSend_setAllFencesWithoutCKData_(void *a1, const char *a2, ...)
{
  return [a1 setAllFencesWithoutCKData:];
}

id objc_msgSend_setAllowFriendRequests_(void *a1, const char *a2, ...)
{
  return [a1 setAllowFriendRequests:];
}

id objc_msgSend_setAllowFriendRequestsEnabled_forSession_completion_(void *a1, const char *a2, ...)
{
  return [a1 setAllowFriendRequestsEnabled:forSession:completion:];
}

id objc_msgSend_setAlternateButtonAction_(void *a1, const char *a2, ...)
{
  return [a1 setAlternateButtonAction:];
}

id objc_msgSend_setAlternateButtonTitle_(void *a1, const char *a2, ...)
{
  return [a1 setAlternateButtonTitle:];
}

id objc_msgSend_setAppHostnameFromSettings_(void *a1, const char *a2, ...)
{
  return [a1 setAppHostnameFromSettings:];
}

id objc_msgSend_setApsConnection_(void *a1, const char *a2, ...)
{
  return [a1 setApsConnection:];
}

id objc_msgSend_setApsEnvironment_(void *a1, const char *a2, ...)
{
  return [a1 setApsEnvironment:];
}

id objc_msgSend_setApsHandler_(void *a1, const char *a2, ...)
{
  return [a1 setApsHandler:];
}

id objc_msgSend_setAuthToken_(void *a1, const char *a2, ...)
{
  return [a1 setAuthToken:];
}

id objc_msgSend_setAuthTokenStatus_(void *a1, const char *a2, ...)
{
  return [a1 setAuthTokenStatus:];
}

id objc_msgSend_setAutomaticallyRetryNetworkFailures_(void *a1, const char *a2, ...)
{
  return [a1 setAutomaticallyRetryNetworkFailures:];
}

id objc_msgSend_setBackedUp_(void *a1, const char *a2, ...)
{
  return [a1 setBackedUp:];
}

id objc_msgSend_setBlockingDialogs_(void *a1, const char *a2, ...)
{
  return [a1 setBlockingDialogs:];
}

id objc_msgSend_setBody_(void *a1, const char *a2, ...)
{
  return [a1 setBody:];
}

id objc_msgSend_setBoostrapScheduled_(void *a1, const char *a2, ...)
{
  return [a1 setBoostrapScheduled:];
}

id objc_msgSend_setBootstrapRetryInterval_(void *a1, const char *a2, ...)
{
  return [a1 setBootstrapRetryInterval:];
}

id objc_msgSend_setByAddingObjectsFromSet_(void *a1, const char *a2, ...)
{
  return [a1 setByAddingObjectsFromSet:];
}

id objc_msgSend_setCachedFirstInvitedDate_(void *a1, const char *a2, ...)
{
  return [a1 setCachedFirstInvitedDate:];
}

id objc_msgSend_setCachedRedirects_(void *a1, const char *a2, ...)
{
  return [a1 setCachedRedirects:];
}

id objc_msgSend_setCachedTapMessages_(void *a1, const char *a2, ...)
{
  return [a1 setCachedTapMessages:];
}

id objc_msgSend_setCachesWarmedUp_(void *a1, const char *a2, ...)
{
  return [a1 setCachesWarmedUp:];
}

id objc_msgSend_setCallerId_(void *a1, const char *a2, ...)
{
  return [a1 setCallerId:];
}

id objc_msgSend_setCallerIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setCallerIdentifier:];
}

id objc_msgSend_setCategory_(void *a1, const char *a2, ...)
{
  return [a1 setCategory:];
}

id objc_msgSend_setCategoryIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setCategoryIdentifier:];
}

id objc_msgSend_setChangeTokenUpdatedBlock_(void *a1, const char *a2, ...)
{
  return [a1 setChangeTokenUpdatedBlock:];
}

id objc_msgSend_setChangesToBeNotified_(void *a1, const char *a2, ...)
{
  return [a1 setChangesToBeNotified:];
}

id objc_msgSend_setCkRecordName_(void *a1, const char *a2, ...)
{
  return [a1 setCkRecordName:];
}

id objc_msgSend_setCkRecordZoneOwnerName_(void *a1, const char *a2, ...)
{
  return [a1 setCkRecordZoneOwnerName:];
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return [a1 setClasses:forSelector:argumentIndex:ofReply:];
}

id objc_msgSend_setClientBundleId_(void *a1, const char *a2, ...)
{
  return [a1 setClientBundleId:];
}

id objc_msgSend_setClientPid_(void *a1, const char *a2, ...)
{
  return [a1 setClientPid:];
}

id objc_msgSend_setClientSession_(void *a1, const char *a2, ...)
{
  return [a1 setClientSession:];
}

id objc_msgSend_setCloudKitAPSHandler_(void *a1, const char *a2, ...)
{
  return [a1 setCloudKitAPSHandler:];
}

id objc_msgSend_setCoalescedAppContexts_(void *a1, const char *a2, ...)
{
  return [a1 setCoalescedAppContexts:];
}

id objc_msgSend_setCoalescedCommands_(void *a1, const char *a2, ...)
{
  return [a1 setCoalescedCommands:];
}

id objc_msgSend_setColeasedRefreshPriority_(void *a1, const char *a2, ...)
{
  return [a1 setColeasedRefreshPriority:];
}

id objc_msgSend_setCommandDataContext_(void *a1, const char *a2, ...)
{
  return [a1 setCommandDataContext:];
}

id objc_msgSend_setCommandServerContext_(void *a1, const char *a2, ...)
{
  return [a1 setCommandServerContext:];
}

id objc_msgSend_setCommandStatus_(void *a1, const char *a2, ...)
{
  return [a1 setCommandStatus:];
}

id objc_msgSend_setCompletionBlock_(void *a1, const char *a2, ...)
{
  return [a1 setCompletionBlock:];
}

id objc_msgSend_setConnection_(void *a1, const char *a2, ...)
{
  return [a1 setConnection:];
}

id objc_msgSend_setContainer_(void *a1, const char *a2, ...)
{
  return [a1 setContainer:];
}

id objc_msgSend_setCreateDirectories_(void *a1, const char *a2, ...)
{
  return [a1 setCreateDirectories:];
}

id objc_msgSend_setCurrentOperation_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentOperation:];
}

id objc_msgSend_setData_forAccount_service_synchronizable_dataProtectionClass_migratable_(void *a1, const char *a2, ...)
{
  return [a1 setData:x0 forAccount:x1 service:x2 synchronizable:x3 dataProtectionClass:x4 migratable:x5];
}

id objc_msgSend_setDataArchiver_(void *a1, const char *a2, ...)
{
  return [a1 setDataArchiver:];
}

id objc_msgSend_setDataProtectionClass_(void *a1, const char *a2, ...)
{
  return [a1 setDataProtectionClass:];
}

id objc_msgSend_setDatabase_(void *a1, const char *a2, ...)
{
  return [a1 setDatabase:];
}

id objc_msgSend_setDate_(void *a1, const char *a2, ...)
{
  return [a1 setDate:];
}

id objc_msgSend_setDaysOfWeek_(void *a1, const char *a2, ...)
{
  return [a1 setDaysOfWeek:];
}

id objc_msgSend_setDefaultButtonAction_(void *a1, const char *a2, ...)
{
  return [a1 setDefaultButtonAction:];
}

id objc_msgSend_setDefaultButtonTitle_(void *a1, const char *a2, ...)
{
  return [a1 setDefaultButtonTitle:];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}

id objc_msgSend_setDestinations_(void *a1, const char *a2, ...)
{
  return [a1 setDestinations:];
}

id objc_msgSend_setDeviceId_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceId:];
}

id objc_msgSend_setDiscretionaryNetworkBehavior_(void *a1, const char *a2, ...)
{
  return [a1 setDiscretionaryNetworkBehavior:];
}

id objc_msgSend_setDismissMsgOnLock_(void *a1, const char *a2, ...)
{
  return [a1 setDismissMsgOnLock:];
}

id objc_msgSend_setDismissMsgOnUnlock_(void *a1, const char *a2, ...)
{
  return [a1 setDismissMsgOnUnlock:];
}

id objc_msgSend_setDsid_(void *a1, const char *a2, ...)
{
  return [a1 setDsid:];
}

id objc_msgSend_setEnabledTopics_(void *a1, const char *a2, ...)
{
  return [a1 setEnabledTopics:];
}

id objc_msgSend_setEndHour_(void *a1, const char *a2, ...)
{
  return [a1 setEndHour:];
}

id objc_msgSend_setEndMin_(void *a1, const char *a2, ...)
{
  return [a1 setEndMin:];
}

id objc_msgSend_setEnumToStringMap_(void *a1, const char *a2, ...)
{
  return [a1 setEnumToStringMap:];
}

id objc_msgSend_setEnvironmentName_(void *a1, const char *a2, ...)
{
  return [a1 setEnvironmentName:];
}

id objc_msgSend_setError_(void *a1, const char *a2, ...)
{
  return [a1 setError:];
}

id objc_msgSend_setExecutionCompletionBlock_(void *a1, const char *a2, ...)
{
  return [a1 setExecutionCompletionBlock:];
}

id objc_msgSend_setExpiresByGroupId_(void *a1, const char *a2, ...)
{
  return [a1 setExpiresByGroupId:];
}

id objc_msgSend_setExpiresDate_(void *a1, const char *a2, ...)
{
  return [a1 setExpiresDate:];
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return [a1 setExportedInterface:];
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return [a1 setExportedObject:];
}

id objc_msgSend_setFavoriteHandles_(void *a1, const char *a2, ...)
{
  return [a1 setFavoriteHandles:];
}

id objc_msgSend_setFavoriteOrder_(void *a1, const char *a2, ...)
{
  return [a1 setFavoriteOrder:];
}

id objc_msgSend_setFavorites_(void *a1, const char *a2, ...)
{
  return [a1 setFavorites:];
}

id objc_msgSend_setFavoritesData_(void *a1, const char *a2, ...)
{
  return [a1 setFavoritesData:];
}

id objc_msgSend_setFavoritesSequencer_(void *a1, const char *a2, ...)
{
  return [a1 setFavoritesSequencer:];
}

id objc_msgSend_setFence_(void *a1, const char *a2, ...)
{
  return [a1 setFence:];
}

id objc_msgSend_setFenceManager_(void *a1, const char *a2, ...)
{
  return [a1 setFenceManager:];
}

id objc_msgSend_setFenceSequencer_(void *a1, const char *a2, ...)
{
  return [a1 setFenceSequencer:];
}

id objc_msgSend_setFences_(void *a1, const char *a2, ...)
{
  return [a1 setFences:];
}

id objc_msgSend_setFencesFromResponseDictionary_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 setFencesFromResponseDictionary:withCompletion:];
}

id objc_msgSend_setFencesOnMeByMe_(void *a1, const char *a2, ...)
{
  return [a1 setFencesOnMeByMe:];
}

id objc_msgSend_setFencesOnMeByOthers_(void *a1, const char *a2, ...)
{
  return [a1 setFencesOnMeByOthers:];
}

id objc_msgSend_setFencesOnOthersByMe_(void *a1, const char *a2, ...)
{
  return [a1 setFencesOnOthersByMe:];
}

id objc_msgSend_setFencesOnOthersByOthers_(void *a1, const char *a2, ...)
{
  return [a1 setFencesOnOthersByOthers:];
}

id objc_msgSend_setFencesWithoutCKData_(void *a1, const char *a2, ...)
{
  return [a1 setFencesWithoutCKData:];
}

id objc_msgSend_setFetchDatabaseChangesCompletionBlock_(void *a1, const char *a2, ...)
{
  return [a1 setFetchDatabaseChangesCompletionBlock:];
}

id objc_msgSend_setFetchRecordZoneChangesCompletionBlock_(void *a1, const char *a2, ...)
{
  return [a1 setFetchRecordZoneChangesCompletionBlock:];
}

id objc_msgSend_setFetchRecordZonesCompletionBlock_(void *a1, const char *a2, ...)
{
  return [a1 setFetchRecordZonesCompletionBlock:];
}

id objc_msgSend_setFetchShareMetadataCompletionBlock_(void *a1, const char *a2, ...)
{
  return [a1 setFetchShareMetadataCompletionBlock:];
}

id objc_msgSend_setFetchShareParticipantsCompletionBlock_(void *a1, const char *a2, ...)
{
  return [a1 setFetchShareParticipantsCompletionBlock:];
}

id objc_msgSend_setFetchStatus_(void *a1, const char *a2, ...)
{
  return [a1 setFetchStatus:];
}

id objc_msgSend_setFmfAppHostName_(void *a1, const char *a2, ...)
{
  return [a1 setFmfAppHostName:];
}

id objc_msgSend_setFmfAppToken_(void *a1, const char *a2, ...)
{
  return [a1 setFmfAppToken:];
}

id objc_msgSend_setFmfHostName_(void *a1, const char *a2, ...)
{
  return [a1 setFmfHostName:];
}

id objc_msgSend_setFmfToken_(void *a1, const char *a2, ...)
{
  return [a1 setFmfToken:];
}

id objc_msgSend_setFmf_otherParticipants_(void *a1, const char *a2, ...)
{
  return [a1 setFmf_otherParticipants:];
}

id objc_msgSend_setFollower_(void *a1, const char *a2, ...)
{
  return [a1 setFollower:];
}

id objc_msgSend_setFollowerHandles_(void *a1, const char *a2, ...)
{
  return [a1 setFollowerHandles:];
}

id objc_msgSend_setFollowersFullyInited_(void *a1, const char *a2, ...)
{
  return [a1 setFollowersFullyInited:];
}

id objc_msgSend_setFollowersInfoReceived_(void *a1, const char *a2, ...)
{
  return [a1 setFollowersInfoReceived:];
}

id objc_msgSend_setFollowing_(void *a1, const char *a2, ...)
{
  return [a1 setFollowing:];
}

id objc_msgSend_setFollowingFullyInited_(void *a1, const char *a2, ...)
{
  return [a1 setFollowingFullyInited:];
}

id objc_msgSend_setFollowingHandles_(void *a1, const char *a2, ...)
{
  return [a1 setFollowingHandles:];
}

id objc_msgSend_setFollowingInfoReceived_(void *a1, const char *a2, ...)
{
  return [a1 setFollowingInfoReceived:];
}

id objc_msgSend_setFriendIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setFriendIdentifier:];
}

id objc_msgSend_setFriendRequestId_(void *a1, const char *a2, ...)
{
  return [a1 setFriendRequestId:];
}

id objc_msgSend_setFromMe_(void *a1, const char *a2, ...)
{
  return [a1 setFromMe:];
}

id objc_msgSend_setFutureFollowerRequests_(void *a1, const char *a2, ...)
{
  return [a1 setFutureFollowerRequests:];
}

id objc_msgSend_setGroup_(void *a1, const char *a2, ...)
{
  return [a1 setGroup:];
}

id objc_msgSend_setGroupId_(void *a1, const char *a2, ...)
{
  return [a1 setGroupId:];
}

id objc_msgSend_setHTTPCookieAcceptPolicy_(void *a1, const char *a2, ...)
{
  return [a1 setHTTPCookieAcceptPolicy:];
}

id objc_msgSend_setHTTPCookieStorage_(void *a1, const char *a2, ...)
{
  return [a1 setHTTPCookieStorage:];
}

id objc_msgSend_setHTTPMethod_(void *a1, const char *a2, ...)
{
  return [a1 setHTTPMethod:];
}

id objc_msgSend_setHandles_(void *a1, const char *a2, ...)
{
  return [a1 setHandles:];
}

id objc_msgSend_setHandlesQueue_(void *a1, const char *a2, ...)
{
  return [a1 setHandlesQueue:];
}

id objc_msgSend_setHandlesToBeLocated_(void *a1, const char *a2, ...)
{
  return [a1 setHandlesToBeLocated:];
}

id objc_msgSend_setHasModelInitialized_(void *a1, const char *a2, ...)
{
  return [a1 setHasModelInitialized:];
}

id objc_msgSend_setHashedDSID_(void *a1, const char *a2, ...)
{
  return [a1 setHashedDSID:];
}

id objc_msgSend_setHideLocation_(void *a1, const char *a2, ...)
{
  return [a1 setHideLocation:];
}

id objc_msgSend_setHideMyLocationEnabled_forSession_completion_(void *a1, const char *a2, ...)
{
  return [a1 setHideMyLocationEnabled:forSession:completion:];
}

id objc_msgSend_setHost_(void *a1, const char *a2, ...)
{
  return [a1 setHost:];
}

id objc_msgSend_setHour_(void *a1, const char *a2, ...)
{
  return [a1 setHour:];
}

id objc_msgSend_setICloudId_(void *a1, const char *a2, ...)
{
  return [a1 setICloudId:];
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setIdentifier:];
}

id objc_msgSend_setIdsStatus_(void *a1, const char *a2, ...)
{
  return [a1 setIdsStatus:];
}

id objc_msgSend_setInteger_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setInteger:forKey:];
}

id objc_msgSend_setInternalClientSessions_(void *a1, const char *a2, ...)
{
  return [a1 setInternalClientSessions:];
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return [a1 setInterruptionHandler:];
}

id objc_msgSend_setInterruptionLevel_(void *a1, const char *a2, ...)
{
  return [a1 setInterruptionLevel:];
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return [a1 setInvalidationHandler:];
}

id objc_msgSend_setInvitationSentToIds_(void *a1, const char *a2, ...)
{
  return [a1 setInvitationSentToIds:];
}

id objc_msgSend_setInvitePending_(void *a1, const char *a2, ...)
{
  return [a1 setInvitePending:];
}

id objc_msgSend_setIsPendingRefresh_(void *a1, const char *a2, ...)
{
  return [a1 setIsPendingRefresh:];
}

id objc_msgSend_setIsReachable_(void *a1, const char *a2, ...)
{
  return [a1 setIsReachable:];
}

id objc_msgSend_setIsRefreshInProgress_(void *a1, const char *a2, ...)
{
  return [a1 setIsRefreshInProgress:];
}

id objc_msgSend_setIsRenewingAccountCredentials_(void *a1, const char *a2, ...)
{
  return [a1 setIsRenewingAccountCredentials:];
}

id objc_msgSend_setIsShallowLocate_(void *a1, const char *a2, ...)
{
  return [a1 setIsShallowLocate:];
}

id objc_msgSend_setIsUpdateGeoFenceCompleted_(void *a1, const char *a2, ...)
{
  return [a1 setIsUpdateGeoFenceCompleted:];
}

id objc_msgSend_setIsUpdatingAccountCredentials_(void *a1, const char *a2, ...)
{
  return [a1 setIsUpdatingAccountCredentials:];
}

id objc_msgSend_setKeychainItemForService_withUsername_value_accessibility_(void *a1, const char *a2, ...)
{
  return [a1 setKeychainItemForService:withUsername:value:accessibility:];
}

id objc_msgSend_setKeychainManager_(void *a1, const char *a2, ...)
{
  return [a1 setKeychainManager:];
}

id objc_msgSend_setLabel_(void *a1, const char *a2, ...)
{
  return [a1 setLabel:];
}

id objc_msgSend_setLastRefreshDate_(void *a1, const char *a2, ...)
{
  return [a1 setLastRefreshDate:];
}

id objc_msgSend_setLastSuccessfulInitDate_(void *a1, const char *a2, ...)
{
  return [a1 setLastSuccessfulInitDate:];
}

id objc_msgSend_setLastSuccessfulResponseTimestamp_(void *a1, const char *a2, ...)
{
  return [a1 setLastSuccessfulResponseTimestamp:];
}

id objc_msgSend_setLatest401TS_(void *a1, const char *a2, ...)
{
  return [a1 setLatest401TS:];
}

id objc_msgSend_setLatest5XXTS_(void *a1, const char *a2, ...)
{
  return [a1 setLatest5XXTS:];
}

id objc_msgSend_setLatestXPCActivityRegistrationTime_(void *a1, const char *a2, ...)
{
  return [a1 setLatestXPCActivityRegistrationTime:];
}

id objc_msgSend_setLaunchOnRebootActivity_keepAliveActivity_(void *a1, const char *a2, ...)
{
  return [a1 setLaunchOnRebootActivity:keepAliveActivity:];
}

id objc_msgSend_setLazyInitTimeoutInSecStoredValue_(void *a1, const char *a2, ...)
{
  return [a1 setLazyInitTimeoutInSecStoredValue:];
}

id objc_msgSend_setLazyTimeLoaded_(void *a1, const char *a2, ...)
{
  return [a1 setLazyTimeLoaded:];
}

id objc_msgSend_setListener_(void *a1, const char *a2, ...)
{
  return [a1 setListener:];
}

id objc_msgSend_setLocatingInProgress_(void *a1, const char *a2, ...)
{
  return [a1 setLocatingInProgress:];
}

id objc_msgSend_setLocation_(void *a1, const char *a2, ...)
{
  return [a1 setLocation:];
}

id objc_msgSend_setLocationType_(void *a1, const char *a2, ...)
{
  return [a1 setLocationType:];
}

id objc_msgSend_setLocations_(void *a1, const char *a2, ...)
{
  return [a1 setLocations:];
}

id objc_msgSend_setLocationsFromData_(void *a1, const char *a2, ...)
{
  return [a1 setLocationsFromData:];
}

id objc_msgSend_setMappingPacketToken_(void *a1, const char *a2, ...)
{
  return [a1 setMappingPacketToken:];
}

id objc_msgSend_setMinute_(void *a1, const char *a2, ...)
{
  return [a1 setMinute:];
}

id objc_msgSend_setModelVersion_(void *a1, const char *a2, ...)
{
  return [a1 setModelVersion:];
}

id objc_msgSend_setModifyRecordZonesCompletionBlock_(void *a1, const char *a2, ...)
{
  return [a1 setModifyRecordZonesCompletionBlock:];
}

id objc_msgSend_setModifyRecordsCompletionBlock_(void *a1, const char *a2, ...)
{
  return [a1 setModifyRecordsCompletionBlock:];
}

id objc_msgSend_setModifySubscriptionsCompletionBlock_(void *a1, const char *a2, ...)
{
  return [a1 setModifySubscriptionsCompletionBlock:];
}

id objc_msgSend_setMsgText_(void *a1, const char *a2, ...)
{
  return [a1 setMsgText:];
}

id objc_msgSend_setMsgTitle_(void *a1, const char *a2, ...)
{
  return [a1 setMsgTitle:];
}

id objc_msgSend_setMuteEndDate_(void *a1, const char *a2, ...)
{
  return [a1 setMuteEndDate:];
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return [a1 setName:];
}

id objc_msgSend_setNonNotifiableRecipients_(void *a1, const char *a2, ...)
{
  return [a1 setNonNotifiableRecipients:];
}

id objc_msgSend_setNotificationInfo_(void *a1, const char *a2, ...)
{
  return [a1 setNotificationInfo:];
}

id objc_msgSend_setNumberOfFriendsAndFollowers_(void *a1, const char *a2, ...)
{
  return [a1 setNumberOfFriendsAndFollowers:];
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKey:];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKeyedSubscript:];
}

id objc_msgSend_setOfferPending_(void *a1, const char *a2, ...)
{
  return [a1 setOfferPending:];
}

id objc_msgSend_setOperationType_(void *a1, const char *a2, ...)
{
  return [a1 setOperationType:];
}

id objc_msgSend_setPacketsToInvalidate_(void *a1, const char *a2, ...)
{
  return [a1 setPacketsToInvalidate:];
}

id objc_msgSend_setPassword_(void *a1, const char *a2, ...)
{
  return [a1 setPassword:];
}

id objc_msgSend_setPending_(void *a1, const char *a2, ...)
{
  return [a1 setPending:];
}

id objc_msgSend_setPendingOfferHandles_(void *a1, const char *a2, ...)
{
  return [a1 setPendingOfferHandles:];
}

id objc_msgSend_setPendingPushes_(void *a1, const char *a2, ...)
{
  return [a1 setPendingPushes:];
}

id objc_msgSend_setPerShareCompletionBlock_(void *a1, const char *a2, ...)
{
  return [a1 setPerShareCompletionBlock:];
}

id objc_msgSend_setPerShareMetadataBlock_(void *a1, const char *a2, ...)
{
  return [a1 setPerShareMetadataBlock:];
}

id objc_msgSend_setPlacemark_(void *a1, const char *a2, ...)
{
  return [a1 setPlacemark:];
}

id objc_msgSend_setPort_(void *a1, const char *a2, ...)
{
  return [a1 setPort:];
}

id objc_msgSend_setPreferredColeasedRefreshPriority_(void *a1, const char *a2, ...)
{
  return [a1 setPreferredColeasedRefreshPriority:];
}

id objc_msgSend_setPreviousServerChangeToken_(void *a1, const char *a2, ...)
{
  return [a1 setPreviousServerChangeToken:];
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return [a1 setPriority:];
}

id objc_msgSend_setQualifiedIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setQualifiedIdentifier:];
}

id objc_msgSend_setQueue_(void *a1, const char *a2, ...)
{
  return [a1 setQueue:];
}

id objc_msgSend_setReachable_(void *a1, const char *a2, ...)
{
  return [a1 setReachable:];
}

id objc_msgSend_setReason_(void *a1, const char *a2, ...)
{
  return [a1 setReason:];
}

id objc_msgSend_setRecipients_(void *a1, const char *a2, ...)
{
  return [a1 setRecipients:];
}

id objc_msgSend_setRecordChangedBlock_(void *a1, const char *a2, ...)
{
  return [a1 setRecordChangedBlock:];
}

id objc_msgSend_setRecordWithIDWasDeletedBlock_(void *a1, const char *a2, ...)
{
  return [a1 setRecordWithIDWasDeletedBlock:];
}

id objc_msgSend_setRecordZoneChangeTokensUpdatedBlock_(void *a1, const char *a2, ...)
{
  return [a1 setRecordZoneChangeTokensUpdatedBlock:];
}

id objc_msgSend_setRecordZoneFetchCompletionBlock_(void *a1, const char *a2, ...)
{
  return [a1 setRecordZoneFetchCompletionBlock:];
}

id objc_msgSend_setRecordZoneWithIDChangedBlock_(void *a1, const char *a2, ...)
{
  return [a1 setRecordZoneWithIDChangedBlock:];
}

id objc_msgSend_setRecordZoneWithIDWasDeletedBlock_(void *a1, const char *a2, ...)
{
  return [a1 setRecordZoneWithIDWasDeletedBlock:];
}

id objc_msgSend_setRedirectsUpdaterQueue_(void *a1, const char *a2, ...)
{
  return [a1 setRedirectsUpdaterQueue:];
}

id objc_msgSend_setRefreshScheduled_(void *a1, const char *a2, ...)
{
  return [a1 setRefreshScheduled:];
}

id objc_msgSend_setRefreshTimer_(void *a1, const char *a2, ...)
{
  return [a1 setRefreshTimer:];
}

id objc_msgSend_setRegisteredDelegates_(void *a1, const char *a2, ...)
{
  return [a1 setRegisteredDelegates:];
}

id objc_msgSend_setRegistrationCheckTimer_(void *a1, const char *a2, ...)
{
  return [a1 setRegistrationCheckTimer:];
}

id objc_msgSend_setRegistrationRetries_(void *a1, const char *a2, ...)
{
  return [a1 setRegistrationRetries:];
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return [a1 setRemoteObjectInterface:];
}

id objc_msgSend_setRequestCachePolicy_(void *a1, const char *a2, ...)
{
  return [a1 setRequestCachePolicy:];
}

id objc_msgSend_setRequestTokens_(void *a1, const char *a2, ...)
{
  return [a1 setRequestTokens:];
}

id objc_msgSend_setRequestTokensStatusCode_(void *a1, const char *a2, ...)
{
  return [a1 setRequestTokensStatusCode:];
}

id objc_msgSend_setRequestTokensStatusMap_(void *a1, const char *a2, ...)
{
  return [a1 setRequestTokensStatusMap:];
}

id objc_msgSend_setRequiresSecureCoding_(void *a1, const char *a2, ...)
{
  return [a1 setRequiresSecureCoding:];
}

id objc_msgSend_setResponseId_(void *a1, const char *a2, ...)
{
  return [a1 setResponseId:];
}

id objc_msgSend_setRetryAfterRenewCount_(void *a1, const char *a2, ...)
{
  return [a1 setRetryAfterRenewCount:];
}

id objc_msgSend_setRetryCount_(void *a1, const char *a2, ...)
{
  return [a1 setRetryCount:];
}

id objc_msgSend_setSanitizeLocationsCacheTimer_(void *a1, const char *a2, ...)
{
  return [a1 setSanitizeLocationsCacheTimer:];
}

id objc_msgSend_setSaveFavoritesOperation_(void *a1, const char *a2, ...)
{
  return [a1 setSaveFavoritesOperation:];
}

id objc_msgSend_setSchedule_(void *a1, const char *a2, ...)
{
  return [a1 setSchedule:];
}

id objc_msgSend_setSchedules_(void *a1, const char *a2, ...)
{
  return [a1 setSchedules:];
}

id objc_msgSend_setScheme_(void *a1, const char *a2, ...)
{
  return [a1 setScheme:];
}

id objc_msgSend_setSelectedHandles_(void *a1, const char *a2, ...)
{
  return [a1 setSelectedHandles:];
}

id objc_msgSend_setSequencer_(void *a1, const char *a2, ...)
{
  return [a1 setSequencer:];
}

id objc_msgSend_setServerContextQueue_(void *a1, const char *a2, ...)
{
  return [a1 setServerContextQueue:];
}

id objc_msgSend_setServerHost_(void *a1, const char *a2, ...)
{
  return [a1 setServerHost:];
}

id objc_msgSend_setServerId_(void *a1, const char *a2, ...)
{
  return [a1 setServerId:];
}

id objc_msgSend_setServerInteractionController_(void *a1, const char *a2, ...)
{
  return [a1 setServerInteractionController:];
}

id objc_msgSend_setServerProtocolScheme_(void *a1, const char *a2, ...)
{
  return [a1 setServerProtocolScheme:];
}

id objc_msgSend_setSession_(void *a1, const char *a2, ...)
{
  return [a1 setSession:];
}

id objc_msgSend_setShareParticipantFetchedBlock_(void *a1, const char *a2, ...)
{
  return [a1 setShareParticipantFetchedBlock:];
}

id objc_msgSend_setShouldSendContentAvailable_(void *a1, const char *a2, ...)
{
  return [a1 setShouldSendContentAvailable:];
}

id objc_msgSend_setShowMessage_(void *a1, const char *a2, ...)
{
  return [a1 setShowMessage:];
}

id objc_msgSend_setShowMsgInLockScreen_(void *a1, const char *a2, ...)
{
  return [a1 setShowMsgInLockScreen:];
}

id objc_msgSend_setSkippedReasons_(void *a1, const char *a2, ...)
{
  return [a1 setSkippedReasons:];
}

id objc_msgSend_setSkippedRefreshReasons_(void *a1, const char *a2, ...)
{
  return [a1 setSkippedRefreshReasons:];
}

id objc_msgSend_setSound_(void *a1, const char *a2, ...)
{
  return [a1 setSound:];
}

id objc_msgSend_setStartHour_(void *a1, const char *a2, ...)
{
  return [a1 setStartHour:];
}

id objc_msgSend_setStartMin_(void *a1, const char *a2, ...)
{
  return [a1 setStartMin:];
}

id objc_msgSend_setStatus_forDate_(void *a1, const char *a2, ...)
{
  return [a1 setStatus:forDate:];
}

id objc_msgSend_setStatusMap_(void *a1, const char *a2, ...)
{
  return [a1 setStatusMap:];
}

id objc_msgSend_setStatusMapFromServer_(void *a1, const char *a2, ...)
{
  return [a1 setStatusMapFromServer:];
}

id objc_msgSend_setStoreController_(void *a1, const char *a2, ...)
{
  return [a1 setStoreController:];
}

id objc_msgSend_setStoredConfigLoaded_(void *a1, const char *a2, ...)
{
  return [a1 setStoredConfigLoaded:];
}

id objc_msgSend_setThreadIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setThreadIdentifier:];
}

id objc_msgSend_setTimeZone_(void *a1, const char *a2, ...)
{
  return [a1 setTimeZone:];
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return [a1 setTitle:];
}

id objc_msgSend_setTopic_(void *a1, const char *a2, ...)
{
  return [a1 setTopic:];
}

id objc_msgSend_setTrackingTimestamp_(void *a1, const char *a2, ...)
{
  return [a1 setTrackingTimestamp:];
}

id objc_msgSend_setTransactionId_(void *a1, const char *a2, ...)
{
  return [a1 setTransactionId:];
}

id objc_msgSend_setTriggerForRepeatedFenceBeforeAccpetanceWithTriggerStatus_date_location_(void *a1, const char *a2, ...)
{
  return [a1 setTriggerForRepeatedFenceBeforeAccpetanceWithTriggerStatus:x0 date:x1 location:x2];
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return [a1 setType:];
}

id objc_msgSend_setURLCache_(void *a1, const char *a2, ...)
{
  return [a1 setURLCache:];
}

id objc_msgSend_setURLCredentialStorage_(void *a1, const char *a2, ...)
{
  return [a1 setURLCredentialStorage:];
}

id objc_msgSend_setUpdateCompletionBlock_(void *a1, const char *a2, ...)
{
  return [a1 setUpdateCompletionBlock:];
}

id objc_msgSend_setUpdatedFence_(void *a1, const char *a2, ...)
{
  return [a1 setUpdatedFence:];
}

id objc_msgSend_setUseZoneWidePCS_(void *a1, const char *a2, ...)
{
  return [a1 setUseZoneWidePCS:];
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return [a1 setUserInfo:];
}

id objc_msgSend_setUsername_(void *a1, const char *a2, ...)
{
  return [a1 setUsername:];
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setValue:forKey:];
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

id objc_msgSend_set_appleIDContext_(void *a1, const char *a2, ...)
{
  return [a1 set_appleIDContext:];
}

id objc_msgSend_set_configFromServer_(void *a1, const char *a2, ...)
{
  return [a1 set_configFromServer:];
}

id objc_msgSend_set_devices_(void *a1, const char *a2, ...)
{
  return [a1 set_devices:];
}

id objc_msgSend_set_features_(void *a1, const char *a2, ...)
{
  return [a1 set_features:];
}

id objc_msgSend_set_followerHandleMapWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 set_followerHandleMapWithIdentifier:];
}

id objc_msgSend_set_followerHandleMapWithServerId_(void *a1, const char *a2, ...)
{
  return [a1 set_followerHandleMapWithServerId:];
}

id objc_msgSend_set_followerHandlesInternal_(void *a1, const char *a2, ...)
{
  return [a1 set_followerHandlesInternal:];
}

id objc_msgSend_set_followingHandleMapWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 set_followingHandleMapWithIdentifier:];
}

id objc_msgSend_set_followingHandleMapWithServerId_(void *a1, const char *a2, ...)
{
  return [a1 set_followingHandleMapWithServerId:];
}

id objc_msgSend_set_followingHandlesInternal_(void *a1, const char *a2, ...)
{
  return [a1 set_followingHandlesInternal:];
}

id objc_msgSend_set_futureFollowerRequestMapWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 set_futureFollowerRequestMapWithIdentifier:];
}

id objc_msgSend_set_futureFollowerRequestsInternal_(void *a1, const char *a2, ...)
{
  return [a1 set_futureFollowerRequestsInternal:];
}

id objc_msgSend_set_futureFollowingRequestsInternal_(void *a1, const char *a2, ...)
{
  return [a1 set_futureFollowingRequestsInternal:];
}

id objc_msgSend_set_handlesInternal_(void *a1, const char *a2, ...)
{
  return [a1 set_handlesInternal:];
}

id objc_msgSend_set_locationDictionary_(void *a1, const char *a2, ...)
{
  return [a1 set_locationDictionary:];
}

id objc_msgSend_set_meDevice_(void *a1, const char *a2, ...)
{
  return [a1 set_meDevice:];
}

id objc_msgSend_set_myInfo_(void *a1, const char *a2, ...)
{
  return [a1 set_myInfo:];
}

id objc_msgSend_set_preferences_(void *a1, const char *a2, ...)
{
  return [a1 set_preferences:];
}

id objc_msgSend_set_serverContext_(void *a1, const char *a2, ...)
{
  return [a1 set_serverContext:];
}

id objc_msgSend_setupAuthentication(void *a1, const char *a2, ...)
{
  return _[a1 setupAuthentication];
}

id objc_msgSend_shareInvitationTokenFromString_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "shareInvitationTokenFromString:error:");
}

id objc_msgSend_shareMyLocationSystemServiceEnabled(void *a1, const char *a2, ...)
{
  return _[a1 shareMyLocationSystemServiceEnabled];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _[a1 shared];
}

id objc_msgSend_sharedAddressBook(void *a1, const char *a2, ...)
{
  return _[a1 sharedAddressBook];
}

id objc_msgSend_sharedCloudDatabase(void *a1, const char *a2, ...)
{
  return _[a1 sharedCloudDatabase];
}

id objc_msgSend_sharedConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 sharedConfiguration];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return _[a1 sharedConnection];
}

id objc_msgSend_sharedDefaults(void *a1, const char *a2, ...)
{
  return _[a1 sharedDefaults];
}

id objc_msgSend_sharedHandleTransactionQueue(void *a1, const char *a2, ...)
{
  return _[a1 sharedHandleTransactionQueue];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedNetworkObserver(void *a1, const char *a2, ...)
{
  return _[a1 sharedNetworkObserver];
}

id objc_msgSend_sharedPrivacyManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedPrivacyManager];
}

id objc_msgSend_shiftCoordinate_accuracy_withCompletionHandler_mustGoToNetworkCallback_errorHandler_callbackQueue_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:");
}

id objc_msgSend_shiftLocations_(void *a1, const char *a2, ...)
{
  return [a1 shiftLocations:];
}

id objc_msgSend_shortDisplayNameForContact_andHandle_(void *a1, const char *a2, ...)
{
  return [a1 shortDisplayNameForContact:andHandle:];
}

id objc_msgSend_shortNameFormatPrefersNicknames(void *a1, const char *a2, ...)
{
  return _[a1 shortNameFormatPrefersNicknames];
}

id objc_msgSend_shouldDisplayAlerts(void *a1, const char *a2, ...)
{
  return _[a1 shouldDisplayAlerts];
}

id objc_msgSend_shouldIncludeDataContext(void *a1, const char *a2, ...)
{
  return _[a1 shouldIncludeDataContext];
}

id objc_msgSend_shouldIncludeServerContext(void *a1, const char *a2, ...)
{
  return _[a1 shouldIncludeServerContext];
}

id objc_msgSend_shouldPostForStatus_atDate_reason_(void *a1, const char *a2, ...)
{
  return [a1 shouldPostForStatus:atDate:reason:];
}

id objc_msgSend_shouldPostForStatus_givenPreviousStatus_(void *a1, const char *a2, ...)
{
  return [a1 shouldPostForStatus:givenPreviousStatus:];
}

id objc_msgSend_shouldUseCloudKitStore(void *a1, const char *a2, ...)
{
  return _[a1 shouldUseCloudKitStore];
}

id objc_msgSend_showForbiddenRegionAlert(void *a1, const char *a2, ...)
{
  return _[a1 showForbiddenRegionAlert];
}

id objc_msgSend_showLocationServicesSwitchOffAlert(void *a1, const char *a2, ...)
{
  return _[a1 showLocationServicesSwitchOffAlert];
}

id objc_msgSend_showMaxFollowersLimitReachedAlert(void *a1, const char *a2, ...)
{
  return _[a1 showMaxFollowersLimitReachedAlert];
}

id objc_msgSend_showMessage(void *a1, const char *a2, ...)
{
  return _[a1 showMessage];
}

id objc_msgSend_showMsgInLockScreen(void *a1, const char *a2, ...)
{
  return _[a1 showMsgInLockScreen];
}

id objc_msgSend_showRestrictedAlert(void *a1, const char *a2, ...)
{
  return _[a1 showRestrictedAlert];
}

id objc_msgSend_showShareMyLocationSystemServiceOffAlert(void *a1, const char *a2, ...)
{
  return _[a1 showShareMyLocationSystemServiceOffAlert];
}

id objc_msgSend_showShareMyLocationiCloudSettingsOffAlert(void *a1, const char *a2, ...)
{
  return _[a1 showShareMyLocationiCloudSettingsOffAlert];
}

id objc_msgSend_showSwitchMeDeviceAlertUsingCurrentMeDeviceName_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "showSwitchMeDeviceAlertUsingCurrentMeDeviceName:completion:")
}

id objc_msgSend_signal(void *a1, const char *a2, ...)
{
  return _[a1 signal];
}

id objc_msgSend_skippedReasons(void *a1, const char *a2, ...)
{
  return _[a1 skippedReasons];
}

id objc_msgSend_sortDescriptorWithKey_ascending_(void *a1, const char *a2, ...)
{
  return [a1 sortDescriptorWithKey:ascending:];
}

id objc_msgSend_sortedArrayUsingDescriptors_(void *a1, const char *a2, ...)
{
  return [a1 sortedArrayUsingDescriptors:];
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return [a1 sortedArrayUsingSelector:];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return _[a1 source];
}

id objc_msgSend_sourceVersionFromVersionFile(void *a1, const char *a2, ...)
{
  return _[a1 sourceVersionFromVersionFile];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_startHour(void *a1, const char *a2, ...)
{
  return _[a1 startHour];
}

id objc_msgSend_startListeningForNotifications(void *a1, const char *a2, ...)
{
  return _[a1 startListeningForNotifications];
}

id objc_msgSend_startMin(void *a1, const char *a2, ...)
{
  return _[a1 startMin];
}

id objc_msgSend_startup(void *a1, const char *a2, ...)
{
  return _[a1 startup];
}

id objc_msgSend_startupComplete(void *a1, const char *a2, ...)
{
  return _[a1 startupComplete];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_statusByWindowStartDateByFenceID(void *a1, const char *a2, ...)
{
  return _[a1 statusByWindowStartDateByFenceID];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return _[a1 statusCode];
}

id objc_msgSend_statusForDate_(void *a1, const char *a2, ...)
{
  return [a1 statusForDate:];
}

id objc_msgSend_statusMap(void *a1, const char *a2, ...)
{
  return _[a1 statusMap];
}

id objc_msgSend_statusMapFromServer(void *a1, const char *a2, ...)
{
  return _[a1 statusMapFromServer];
}

id objc_msgSend_stopListeningForNotifications(void *a1, const char *a2, ...)
{
  return _[a1 stopListeningForNotifications];
}

id objc_msgSend_stopSharingMyLocationWithHandles_forSession_groupId_callerId_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "stopSharingMyLocationWithHandles:forSession:groupId:callerId:completion:");
}

id objc_msgSend_stopSharingMyLocationWithHandles_groupId_callerId_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "stopSharingMyLocationWithHandles:groupId:callerId:completion:");
}

id objc_msgSend_stopTimer(void *a1, const char *a2, ...)
{
  return _[a1 stopTimer];
}

id objc_msgSend_storeController(void *a1, const char *a2, ...)
{
  return _[a1 storeController];
}

id objc_msgSend_storeInvalidMappingPacketsForFutureRemoval_(void *a1, const char *a2, ...)
{
  return [a1 storeInvalidMappingPacketsForFutureRemoval:];
}

id objc_msgSend_storeMappingPacket_(void *a1, const char *a2, ...)
{
  return [a1 storeMappingPacket:];
}

id objc_msgSend_storeRedirectsToDefaults(void *a1, const char *a2, ...)
{
  return _[a1 storeRedirectsToDefaults];
}

id objc_msgSend_storeSavedAPSToken_(void *a1, const char *a2, ...)
{
  return [a1 storeSavedAPSToken:];
}

id objc_msgSend_storeTapMessagesToDefaults(void *a1, const char *a2, ...)
{
  return _[a1 storeTapMessagesToDefaults];
}

id objc_msgSend_storedConfigLoaded(void *a1, const char *a2, ...)
{
  return _[a1 storedConfigLoaded];
}

id objc_msgSend_storedDSID(void *a1, const char *a2, ...)
{
  return _[a1 storedDSID];
}

id objc_msgSend_storedDSIDMatchesDSID_(void *a1, const char *a2, ...)
{
  return [a1 storedDSIDMatchesDSID:];
}

id objc_msgSend_streetAddress(void *a1, const char *a2, ...)
{
  return _[a1 streetAddress];
}

id objc_msgSend_streetName(void *a1, const char *a2, ...)
{
  return _[a1 streetName];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(void *a1, const char *a2, ...)
{
  return [a1 stringByAddingPercentEncodingWithAllowedCharacters:];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingPathComponent:];
}

id objc_msgSend_stringByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingPathExtension:];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingString:];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 stringByDeletingLastPathComponent];
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

id objc_msgSend_stringForReasonCode_(void *a1, const char *a2, ...)
{
  return [a1 stringForReasonCode:];
}

id objc_msgSend_stringFromBootstrapReason_(void *a1, const char *a2, ...)
{
  return [a1 stringFromBootstrapReason:];
}

id objc_msgSend_stringFromShareInvitationToken_error_(void *a1, const char *a2, ...)
{
  return [a1 stringFromShareInvitationToken:error];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return [a1 stringWithCString:];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return [a1 stringWithUTF8String:];
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return [a1 subarrayWithRange:];
}

id objc_msgSend_subdataWithRange_(void *a1, const char *a2, ...)
{
  return [a1 subdataWithRange:];
}

id objc_msgSend_subscribeToChangesInDatabase_(void *a1, const char *a2, ...)
{
  return [a1 subscribeToChangesInDatabase:];
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return [a1 substringFromIndex:];
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return [a1 substringToIndex:];
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return [a1 substringWithRange:];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return _[a1 synchronize];
}

id objc_msgSend_tapContext(void *a1, const char *a2, ...)
{
  return _[a1 tapContext];
}

id objc_msgSend_tapMessagesFromDefaults(void *a1, const char *a2, ...)
{
  return _[a1 tapMessagesFromDefaults];
}

id objc_msgSend_thisDeviceId(void *a1, const char *a2, ...)
{
  return _[a1 thisDeviceId];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceDate:x0];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceNow];
}

id objc_msgSend_timeZone(void *a1, const char *a2, ...)
{
  return _[a1 timeZone];
}

id objc_msgSend_timeZoneWithName_(void *a1, const char *a2, ...)
{
  return [a1 timeZoneWithName:];
}

id objc_msgSend_timeout(void *a1, const char *a2, ...)
{
  return _[a1 timeout];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return _[a1 timestamp];
}

id objc_msgSend_toHandles(void *a1, const char *a2, ...)
{
  return _[a1 toHandles];
}

id objc_msgSend_topic(void *a1, const char *a2, ...)
{
  return _[a1 topic];
}

id objc_msgSend_trackingTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 trackingTimestamp];
}

id objc_msgSend_transcriptDelegateStartEnabled(void *a1, const char *a2, ...)
{
  return _[a1 transcriptDelegateStartEnabled];
}

id objc_msgSend_transcriptDelegateStopEnabled(void *a1, const char *a2, ...)
{
  return _[a1 transcriptDelegateStopEnabled];
}

id objc_msgSend_trigger(void *a1, const char *a2, ...)
{
  return _[a1 trigger];
}

id objc_msgSend_triggerAfterAcceptanceWithUUID_forFencewithID_withStatus_withAcceptanceStatus_atDate_triggerLocation_clientSession_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "triggerAfterAcceptanceWithUUID:forFencewithID:withStatus:withAcceptanceStatus:atDate:triggerLocation:clientSession:completion:");
}

id objc_msgSend_triggerForRepeatedFenceBeforeAcceptanceWithFence_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "triggerForRepeatedFenceBeforeAcceptanceWithFence:");
}

id objc_msgSend_triggerManager(void *a1, const char *a2, ...)
{
  return _[a1 triggerManager];
}

id objc_msgSend_triggerManager_didModifyFence_clientSession_withCompletion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "triggerManager:didModifyFence:clientSession:withCompletion:");
}

id objc_msgSend_triggerManager_didModifyFence_withCompletion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "triggerManager:didModifyFence:withCompletion:");
}

id objc_msgSend_triggerRepeatedFence_clientSesssion_afterAccpetanceWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 triggerRepeatedFence:clientSesssion:afterAccpetanceWithCompletion:];
}

id objc_msgSend_triggerWithUUID_forFence_withStatus_atDate_triggerLocation_clientSession_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "triggerWithUUID:forFence:withStatus:atDate:triggerLocation:clientSession:completion:");
}

id objc_msgSend_triggerWithUUID_forFenceWithID_withStatus_atDate_triggerLocation_clientSession_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "triggerWithUUID:forFenceWithID:withStatus:atDate:triggerLocation:clientSession:completion:");
}

id objc_msgSend_triggerWithUUID_forFenceWithID_withStatus_forDate_completion_(void *a1, const char *a2, ...)
{
  return [a1 triggerWithUUID:x0 forFenceWithID:x1 withStatus:x2 forDate:x3 completion:x4];
}

id objc_msgSend_triggerWithUUID_forFenceWithID_withStatus_forDate_triggerLocation_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "triggerWithUUID:forFenceWithID:withStatus:forDate:triggerLocation:completion:");
}

id objc_msgSend_triggerWithUUID_status_atDate_triggerLocation_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "triggerWithUUID:status:atDate:triggerLocation:completion:");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_unacceptedShareInvitationsInDatabaseWithScope_(void *a1, const char *a2, ...)
{
  return [a1 unacceptedShareInvitationsInDatabaseWithScope:];
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return [a1 unarchivedObjectOfClasses:x0 fromData:x1 error:x2];
}

id objc_msgSend_unformattedInternationalRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 unformattedInternationalRepresentation];
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return [a1 unionSet:];
}

id objc_msgSend_unlockState(void *a1, const char *a2, ...)
{
  return _[a1 unlockState];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongValue];
}

id objc_msgSend_updateAccountCredentials_(void *a1, const char *a2, ...)
{
  return [a1 updateAccountCredentials:];
}

id objc_msgSend_updateAccountInfo(void *a1, const char *a2, ...)
{
  return _[a1 updateAccountInfo];
}

id objc_msgSend_updateAccountWithFMFTokens(void *a1, const char *a2, ...)
{
  return _[a1 updateAccountWithFMFTokens];
}

id objc_msgSend_updateClientsWithLocallyStoredModelCache(void *a1, const char *a2, ...)
{
  return _[a1 updateClientsWithLocallyStoredModelCache];
}

id objc_msgSend_updateCompletionBlock(void *a1, const char *a2, ...)
{
  return _[a1 updateCompletionBlock];
}

id objc_msgSend_updateFence_clientSession_completion_(void *a1, const char *a2, ...)
{
  return [a1 updateFence:clientSession:completion:];
}

id objc_msgSend_updateFenceMuteEndDate_(void *a1, const char *a2, ...)
{
  return [a1 updateFenceMuteEndDate:];
}

id objc_msgSend_updateFollowers_withCombinedGroupIdsFromPending_(void *a1, const char *a2, ...)
{
  return [a1 updateFollowers:withCombinedGroupIdsFromPending:];
}

id objc_msgSend_updateFriendsFollowersCount_(void *a1, const char *a2, ...)
{
  return [a1 updateFriendsFollowersCount:];
}

id objc_msgSend_updateFromFence_(void *a1, const char *a2, ...)
{
  return [a1 updateFromFence:];
}

id objc_msgSend_updateFromRecord_(void *a1, const char *a2, ...)
{
  return [a1 updateFromRecord:];
}

id objc_msgSend_updateHandle_(void *a1, const char *a2, ...)
{
  return [a1 updateHandle:];
}

id objc_msgSend_updateHandles_withFavoriteArray_(void *a1, const char *a2, ...)
{
  return [a1 updateHandles:withFavoriteArray:];
}

id objc_msgSend_updateHandlesWithFavorites_(void *a1, const char *a2, ...)
{
  return [a1 updateHandlesWithFavorites:];
}

id objc_msgSend_updateHeartbeat(void *a1, const char *a2, ...)
{
  return _[a1 updateHeartbeat];
}

id objc_msgSend_updateIDSStatusForHandle_(void *a1, const char *a2, ...)
{
  return [a1 updateIDSStatusForHandle:];
}

id objc_msgSend_updateInited(void *a1, const char *a2, ...)
{
  return _[a1 updateInited];
}

id objc_msgSend_updateIsActive_isThisDevice_(void *a1, const char *a2, ...)
{
  return [a1 updateIsActive:isThisDevice:];
}

id objc_msgSend_updateLastLoggedInPrsId_(void *a1, const char *a2, ...)
{
  return [a1 updateLastLoggedInPrsId:];
}

id objc_msgSend_updateLazyInitTimeoutInSecStoredValue_(void *a1, const char *a2, ...)
{
  return [a1 updateLazyInitTimeoutInSecStoredValue:];
}

id objc_msgSend_updateModelCacheWithData_(void *a1, const char *a2, ...)
{
  return [a1 updateModelCacheWithData:];
}

id objc_msgSend_updateRecord_andShare_inDatabase_withCompletion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "updateRecord:andShare:inDatabase:withCompletion:");
}

id objc_msgSend_updateRecord_inDatabaseWithScope_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "updateRecord:inDatabaseWithScope:error:");
}

id objc_msgSend_updateRecord_inZoneSharedWith_inDatabaseWithScope_withCompletion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "updateRecord:inZoneSharedWith:inDatabaseWithScope:withCompletion:");
}

id objc_msgSend_updateRedirectsCache_(void *a1, const char *a2, ...)
{
  return [a1 updateRedirectsCache:];
}

id objc_msgSend_updateServerChangeToken_forDatabaseWithScope_error_(void *a1, const char *a2, ...)
{
  return [a1 updateServerChangeToken:forDatabaseWithScope:error:];
}

id objc_msgSend_updateServerChangeToken_forZoneWithID_inDatabaseWithScope_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "updateServerChangeToken:forZoneWithID:inDatabaseWithScope:error:");
}

id objc_msgSend_updateSessionCaches_forSessions_pushAllData_(void *a1, const char *a2, ...)
{
  return [a1 updateSessionCaches:forSessions:pushAllData:];
}

id objc_msgSend_updateStoredDSID_(void *a1, const char *a2, ...)
{
  return [a1 updateStoredDSID];
}

id objc_msgSend_updateTapMessagesCache_(void *a1, const char *a2, ...)
{
  return [a1 updateTapMessagesCache:];
}

id objc_msgSend_updateTrackingTimestampForHandle_timestamp_(void *a1, const char *a2, ...)
{
  return [a1 updateTrackingTimestampForHandle:timestamp:];
}

id objc_msgSend_updateUnacceptedShareInvitationsWithShareURLString_invitationTokenBase64String_InDatabaseWithScope_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "updateUnacceptedShareInvitationsWithShareURLString:invitationTokenBase64String:InDatabaseWithScope:error:");
}

id objc_msgSend_updateWithCachedHandles_(void *a1, const char *a2, ...)
{
  return [a1 updateWithCachedHandles:];
}

id objc_msgSend_updateZoneWithID_inDatabase_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 updateZoneWithID:inDatabase:withCompletion:];
}

id objc_msgSend_updateZoneWithID_withShareRecipients_inDatabase_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 updateZoneWithID:withShareRecipients:inDatabase:withCompletion:];
}

id objc_msgSend_upsellTimeoutInSeconds(void *a1, const char *a2, ...)
{
  return _[a1 upsellTimeoutInSeconds];
}

id objc_msgSend_upselliCloudAlert(void *a1, const char *a2, ...)
{
  return _[a1 upselliCloudAlert];
}

id objc_msgSend_upselliCloudIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 upselliCloudIfNeeded];
}

id objc_msgSend_userIdentity(void *a1, const char *a2, ...)
{
  return _[a1 userIdentity];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_userLocateWaitIntervalInMS(void *a1, const char *a2, ...)
{
  return _[a1 userLocateWaitIntervalInMS];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return _[a1 username];
}

id objc_msgSend_valueForCapability_(void *a1, const char *a2, ...)
{
  return [a1 valueForCapability:];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return [a1 valueForEntitlement:];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return [a1 valueForKey:];
}

id objc_msgSend_valueForResponseHTTPHeader_(void *a1, const char *a2, ...)
{
  return [a1 valueForResponseHTTPHeader:];
}

id objc_msgSend_wait(void *a1, const char *a2, ...)
{
  return _[a1 wait];
}

id objc_msgSend_wasRedirected(void *a1, const char *a2, ...)
{
  return _[a1 wasRedirected];
}

id objc_msgSend_wasSuccessful(void *a1, const char *a2, ...)
{
  return _[a1 wasSuccessful];
}

id objc_msgSend_weakToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return _[a1 weakToStrongObjectsMapTable];
}

id objc_msgSend_weekdaySymbols(void *a1, const char *a2, ...)
{
  return _[a1 weekdaySymbols];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 whitespaceAndNewlineCharacterSet];
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return [a1 writeToFile:x0 options:x1 error:x2];
}

id objc_msgSend_xpcDarwinEventHandlers(void *a1, const char *a2, ...)
{
  return _[a1 xpcDarwinEventHandlers];
}

id objc_msgSend_xpcDistributedEventHandlers(void *a1, const char *a2, ...)
{
  return _[a1 xpcDistributedEventHandlers];
}

id objc_msgSend_zoneID(void *a1, const char *a2, ...)
{
  return _[a1 zoneID];
}

id objc_msgSend_zoneName(void *a1, const char *a2, ...)
{
  return _[a1 zoneName];
}

id objc_msgSend_zoneServerChangeTokens(void *a1, const char *a2, ...)
{
  return _[a1 zoneServerChangeTokens];
}