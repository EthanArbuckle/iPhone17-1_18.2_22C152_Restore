void sub_100003F34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100003F54(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100004360(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100004380(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100004754(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100004768(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained timeoutCanOccur])
  {
    [WeakRetained setTimeoutCanOccur:0];
    v1 = [WeakRetained transitionOperation];
    id v2 = [v1 timeout:0];

    id v3 = objc_alloc_init((Class)NSOperationQueue);
    v4 = [WeakRetained transitionOperation];
    [v3 addOperation:v4];
  }
}

void sub_100004AC4(id a1)
{
  qword_1000A7468 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  _objc_release_x1();
}

void sub_100004B08(id a1)
{
  qword_1000A7468 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  _objc_release_x1();
}

void sub_100004FF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100005024(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100005034(uint64_t a1)
{
}

void sub_10000503C(uint64_t a1, void *a2)
{
  uint64_t v3 = kKTApplicationIdentifierIDS;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000050EC;
  v6[3] = &unk_10008CB60;
  uint64_t v8 = *(void *)(a1 + 48);
  long long v5 = *(_OWORD *)(a1 + 32);
  id v4 = (id)v5;
  long long v7 = v5;
  [a2 accountKey:v3 complete:v6];
}

void sub_1000050EC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100005188(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000051E8(id a1)
{
  qword_1000A7468 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  _objc_release_x1();
}

void sub_10000522C(id a1)
{
  qword_1000A7468 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  _objc_release_x1();
}

void sub_100005270(id a1)
{
  qword_1000A7468 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  _objc_release_x1();
}

void sub_100005664(id a1)
{
  qword_1000A7468 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  _objc_release_x1();
}

void sub_1000056A8(id a1)
{
  qword_1000A7468 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  _objc_release_x1();
}

void sub_1000056EC(id a1)
{
  qword_1000A7468 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  _objc_release_x1();
}

void sub_100005730(id a1, KTIDSSession *a2)
{
  id v2 = a2;
  uint64_t v3 = [(KTIDSSession *)v2 state];
  if (([v3 isEqual:kTransparencyStaticKeyStateCodeAvailable] & 1) != 0
    || ([v3 isEqual:kTransparencyStaticKeyStateCodeError] & 1) != 0)
  {
    v15[0] = kTransparencyStaticKeySessionID;
    id v4 = [(KTIDSSession *)v2 sessionID];
    v15[1] = kTransparencyStaticKeyState;
    v16[0] = v4;
    v16[1] = v3;
    id v5 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

    if (qword_1000A7460 != -1) {
      dispatch_once(&qword_1000A7460, &stru_10008CCF0);
    }
    id v6 = qword_1000A7468;
    if (os_log_type_enabled((os_log_t)qword_1000A7468, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543874;
      v10 = (void *)kTransparencyStaticKeyNotification;
      __int16 v11 = 1024;
      int v12 = 1;
      __int16 v13 = 2112;
      v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Posting notification: %{public}@: options = 0x%08x, %@", (uint8_t *)&v9, 0x1Cu);
    }
    uint64_t v7 = +[NSDistributedNotificationCenter defaultCenter];
    [v7 postNotificationName:kTransparencyStaticKeyNotification object:0 userInfo:v5 options:1];
  }
  else
  {
    if (qword_1000A7460 != -1) {
      dispatch_once(&qword_1000A7460, &stru_10008CCD0);
    }
    uint64_t v8 = qword_1000A7468;
    if (os_log_type_enabled((os_log_t)qword_1000A7468, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Dropped notification: %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
}

void sub_100005974(id a1)
{
  qword_1000A7468 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  _objc_release_x1();
}

void sub_1000059B8(id a1)
{
  qword_1000A7468 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  _objc_release_x1();
}

void sub_1000059FC(id a1)
{
  qword_1000A7468 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  _objc_release_x1();
}

void sub_100005D68(id a1)
{
  qword_1000A7468 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  _objc_release_x1();
}

uint64_t start()
{
  +[NSError _setFileNameLocalizationEnabled:0];
  bzero(buf, 0x400uLL);
  if (!_set_user_dir_suffix()
    || !confstr(65537, (char *)buf, 0x400uLL)
    || mkdir((const char *)buf, 0x1C0u) && *__error() != 17)
  {
    if (qword_1000A7460 != -1) {
      dispatch_once(&qword_1000A7460, &stru_10008CD90);
    }
    v14 = (void *)qword_1000A7468;
    if (os_log_type_enabled((os_log_t)qword_1000A7468, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = v14;
      int v16 = *__error();
      v17 = __error();
      v18 = strerror(*v17);
      int v24 = 67109378;
      int v25 = v16;
      __int16 v26 = 2080;
      v27 = v18;
      v19 = "failed to initialize temporary directory (%d): %s";
LABEL_23:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v24, 0x12u);
    }
LABEL_24:
    exit(1);
  }
  v0 = realpath_DARWIN_EXTSN((const char *)buf, 0);
  if (!v0)
  {
    if (qword_1000A7460 != -1) {
      dispatch_once(&qword_1000A7460, &stru_10008CDB0);
    }
    v20 = (void *)qword_1000A7468;
    if (os_log_type_enabled((os_log_t)qword_1000A7468, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = v20;
      int v21 = *__error();
      v22 = __error();
      v23 = strerror(*v22);
      int v24 = 67109378;
      int v25 = v21;
      __int16 v26 = 2080;
      v27 = v23;
      v19 = "failed to resolve temporary directory (%d): %s";
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  v1 = v0;
  setenv("SQLITE_TMPDIR", v0, 1);
  free(v1);
  uint64_t v3 = objc_alloc_init(IDSServiceDelegate);
  dispatch_queue_t v4 = dispatch_queue_create("main-ids-queue", 0);
  [(IDSServiceDelegate *)v3 setXpcQueue:v4];

  id v5 = [[KTIDSSessionHandler alloc] initWithTransport:0 transparencyd:0 peerName:0];
  [(IDSServiceDelegate *)v3 setIdsTransport:v5];

  id v6 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.transparencyd.ids"];
  [v6 setDelegate:v3];
  [v6 resume];
  uint64_t v7 = [(IDSServiceDelegate *)v3 xpcQueue];
  signal(15, (void (__cdecl *)(int))1);
  dispatch_source_t v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v7);
  int v9 = (void *)qword_1000A7470;
  qword_1000A7470 = (uint64_t)v8;

  dispatch_source_set_event_handler((dispatch_source_t)qword_1000A7470, &stru_10008CDD0);
  dispatch_activate((dispatch_object_t)qword_1000A7470);

  if (qword_1000A7460 != -1) {
    dispatch_once(&qword_1000A7460, &stru_10008CD50);
  }
  v10 = qword_1000A7468;
  if (os_log_type_enabled((os_log_t)qword_1000A7468, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "transparencyStaticKey accepting work", buf, 2u);
  }
  __int16 v11 = +[NSRunLoop mainRunLoop];
  [v11 run];

  if (qword_1000A7460 != -1) {
    dispatch_once(&qword_1000A7460, &stru_10008CD70);
  }
  int v12 = qword_1000A7468;
  if (os_log_type_enabled((os_log_t)qword_1000A7468, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "transparencyStaticKey stopping", buf, 2u);
  }

  return 1;
}

void sub_1000062F0(id a1)
{
  qword_1000A7468 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  _objc_release_x1();
}

void sub_100006334(id a1)
{
  qword_1000A7468 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  _objc_release_x1();
}

void sub_100006378(id a1)
{
  qword_1000A7468 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  _objc_release_x1();
}

void sub_1000063BC(id a1)
{
  qword_1000A7468 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  _objc_release_x1();
}

void sub_100006400(id a1)
{
  if (qword_1000A7460 != -1) {
    dispatch_once(&qword_1000A7460, &stru_10008CDF0);
  }
  v1 = qword_1000A7468;
  if (os_log_type_enabled((os_log_t)qword_1000A7468, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Received signal SIGTERM. Will terminate when clean.", v2, 2u);
  }
  xpc_transaction_exit_clean();
  xpc_transaction_try_exit_clean();
}

void sub_100006494(id a1)
{
  qword_1000A7468 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  _objc_release_x1();
}

void sub_100006A14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100006A50(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained allDependentsSuccessful])
    {
      [v2 groupStart];
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v3 = [v2 error];
        int v4 = 138412290;
        id v5 = v3;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Not running due to some failed dependent: %@", (uint8_t *)&v4, 0xCu);
      }
      [v2 cancel];
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v4) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "received callback for released object", (uint8_t *)&v4, 2u);
  }
}

void sub_100006B78(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained completeOperation];
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "received callback for released object", v3, 2u);
  }
}

void sub_1000072F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100007310(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 72);
  return result;
}

void sub_1000073EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100007404(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 73);
  return result;
}

uint64_t sub_10000758C(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 73) = 1;
  return result;
}

uint64_t sub_1000075A4(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 72) = 1;
  return result;
}

void sub_100007990(uint64_t a1)
{
  if ([*(id *)(a1 + 32) fillInError])
  {
    id v2 = *(void **)(a1 + 32);
    uint64_t v3 = [v2 internalSuccesses];
    [v2 allSuccessful:v3];
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 72) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 73) = 1;
}

void sub_100007CBC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100007EE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100007F08(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100008908(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100008920(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100008930(uint64_t a1)
{
}

void sub_100008938(void *a1)
{
  id v2 = (void *)a1[4];
  id v7 = [v2 idsHandleLookup];
  uint64_t v3 = [v7 objectForKeyedSubscript:a1[5]];
  uint64_t v4 = [v2 mapMailbox:v3];
  uint64_t v5 = *(void *)(a1[6] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void sub_100008B5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100008B74(void *a1)
{
  id v2 = (void *)a1[4];
  id v7 = [v2 sessionIDLookup];
  uint64_t v3 = [v7 objectForKeyedSubscript:a1[5]];
  uint64_t v4 = [v2 mapMailbox:v3];
  uint64_t v5 = *(void *)(a1[6] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void sub_100008CD8(uint64_t a1)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = [*(id *)(a1 + 32) sessionIDLookup];
  uint64_t v3 = [v2 allValues];

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
        dispatch_source_t v8 = *(void **)(a1 + 40);
        int v9 = [*(id *)(a1 + 32) mapMailbox:*(void *)(*((void *)&v10 + 1) + 8 * (void)v7)];
        [v8 addObject:v9];

        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

void sub_100008FE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100009004(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) sessionIDLookup];
  uint64_t v3 = (id *)(a1 + 40);
  id v4 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  id v5 = *(void **)(a1 + 32);
  if (v4)
  {
    [v5 removeMailbox:v4];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    uint64_t v6 = [v5 oslog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100068364(v3);
    }
  }
}

void sub_100009500(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100009518(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) peer];
  uint64_t v3 = +[NSMutableArray arrayWithObject:v2];

  id v4 = [*(id *)(a1 + 32) otherNamesForPeer];
  id v5 = [v4 allObjects];
  [v3 addObjectsFromArray:v5];

  [*(id *)(a1 + 40) dumpState:@"setupMailbox"];
  uint64_t v6 = [*(id *)(a1 + 40) oslog];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v3 componentsJoinedByString:@","];
    *(_DWORD *)buf = 141558274;
    uint64_t v48 = 1752392040;
    __int16 v49 = 2112;
    uint64_t v50 = (uint64_t)v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Peer handles for setup: %{mask.hash}@", buf, 0x16u);
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v8 = v3;
  id v9 = [v8 countByEnumeratingWithState:&v43 objects:v59 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v44;
LABEL_5:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v44 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void *)(*((void *)&v43 + 1) + 8 * v12);
      v14 = [*(id *)(a1 + 40) idsHandleLookup:v43];
      uint64_t v15 = [v14 objectForKeyedSubscript:v13];
      uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
      v17 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = v15;

      if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
        break;
      }
      if (v10 == (id)++v12)
      {
        id v10 = [v8 countByEnumeratingWithState:&v43 objects:v59 count:16];
        if (v10) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    v18 = [*(id *)(a1 + 40) oslog];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) handleID];
      v20 = [v19 kt_hexString];
      int v21 = [*(id *)(a1 + 32) peer];
      *(_DWORD *)buf = 138543874;
      uint64_t v48 = (uint64_t)v20;
      __int16 v49 = 2160;
      uint64_t v50 = 1752392040;
      __int16 v51 = 2112;
      uint64_t v52 = (uint64_t)v21;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "connecting existing mailbox %{public}@ peer: %{mask.hash}@", buf, 0x20u);
    }
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setPeer:*(void *)(a1 + 32)];
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setMyPublicInfo:*(void *)(a1 + 48)];
    v22 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) stateMachine];
    v23 = [v22 currentState];

    if (([v23 isEqual:off_1000A6758] & 1) == 0
      && ([v23 isEqual:off_1000A6760] & 1) == 0)
    {
      int v24 = [*(id *)(a1 + 40) oslog];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        int v25 = [*(id *)(a1 + 32) peer];
        *(_DWORD *)buf = 141558530;
        uint64_t v48 = 1752392040;
        __int16 v49 = 2112;
        uint64_t v50 = (uint64_t)v25;
        __int16 v51 = 2114;
        uint64_t v52 = (uint64_t)v23;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "resetting mailbox peer: %{mask.hash}@ state: %{public}@", buf, 0x20u);
      }
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) restart];
    }
  }
  else
  {
    __int16 v26 = [SKMailbox alloc];
    v27 = [*(id *)(a1 + 40) oslog];
    uint64_t v28 = *(void *)(a1 + 48);
    v29 = [*(id *)(a1 + 32) peer];
    v30 = [(SKMailbox *)v26 initWithLogging:v27 publicInfo:v28 peerIDSID:v29 session:*(void *)(a1 + 40)];
    uint64_t v31 = *(void *)(*(void *)(a1 + 56) + 8);
    v32 = *(void **)(v31 + 40);
    *(void *)(v31 + 40) = v30;

    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setPeer:*(void *)(a1 + 32)];
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setMyPublicInfo:*(void *)(a1 + 48)];
    v23 = [*(id *)(a1 + 40) oslog];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v33 = [*(id *)(a1 + 32) peer];
      v34 = [*(id *)(a1 + 32) otherNamesForPeer];
      v35 = [v34 allObjects];
      v36 = [v35 componentsJoinedByString:@","];
      v37 = [*(id *)(a1 + 32) lastUsedAddressOfMe];
      *(_DWORD *)buf = 141559298;
      uint64_t v48 = 1752392040;
      __int16 v49 = 2112;
      uint64_t v50 = (uint64_t)v33;
      __int16 v51 = 2160;
      uint64_t v52 = 1752392040;
      __int16 v53 = 2112;
      v54 = v36;
      __int16 v55 = 2160;
      uint64_t v56 = 1752392040;
      __int16 v57 = 2112;
      v58 = v37;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "starting new mailbox with peer: %{mask.hash}@ other known handles: %{mask.hash}@ lastMe: %{mask.hash}@", buf, 0x3Eu);
    }
  }

  v38 = [*(id *)(a1 + 32) lastUsedAddressOfMe];

  if (v38)
  {
    v39 = [*(id *)(a1 + 40) oslog];
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v40 = [*(id *)(a1 + 32) lastUsedAddressOfMe];
      *(_DWORD *)buf = 138543362;
      uint64_t v48 = (uint64_t)v40;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Using send handle: %{public}@", buf, 0xCu);
    }
    v41 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    v42 = [*(id *)(a1 + 32) lastUsedAddressOfMe];
    [v41 setSourceIDSID:v42];
  }
  [*(id *)(a1 + 40) addMailbox:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) v43];
}

id sub_10000A294(uint64_t a1)
{
  return _[*(id *)(a1 + 32) recvSelected:*(void *)(a1 + 40)];
}

void sub_10000A44C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) idsHandleLookup];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 56) data];
    [v3 recvCommit:v4];
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) oslog];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 48);
      int v7 = 141558274;
      uint64_t v8 = 1752392040;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ktCommit: mb not found for %{mask.hash}@", (uint8_t *)&v7, 0x16u);
    }
  }
}

void sub_10000A640(uint64_t a1, int a2)
{
  id v4 = [*(id *)(a1 + 32) oslog];
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      int v13 = 141558274;
      uint64_t v14 = 1752392040;
      __int16 v15 = 2112;
      uint64_t v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "runIfHaveContact: have contact for %{mask.hash}@", (uint8_t *)&v13, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100068508(a1, v5, v7, v8, v9, v10, v11, v12);
    }
  }
}

void sub_10000A96C(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) data];
  [v1 recvReplyB:v2];
}

void sub_10000AC00(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) data];
  [v1 recvDiscloseA:v2];
}

void sub_10000AEA4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) data];
  [v1 recvConfirm:v2];
}

void sub_10000B444(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) oslog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100068880();
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000B518;
    v9[3] = &unk_10008CF78;
    v9[4] = *(void *)(a1 + 32);
    [a2 ttr:v7 fromHandle:v8 complete:v9];
  }
}

void sub_10000B518(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) oslog];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000688E8();
    }
  }
}

void sub_10000B578(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) oslog];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100068950();
  }
}

void sub_10000BC40(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) oslog];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v6 localSessionID];
    uint64_t v9 = [v8 kt_hexString];
    int v10 = 138543618;
    id v11 = v5;
    __int16 v12 = 2114;
    int v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "mailbox-handle: %{public}@ session: %{public}@", (uint8_t *)&v10, 0x16u);
  }
}

void sub_10000BEE4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) oslog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000689B8();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000BFF8;
    v8[3] = &unk_10008CF50;
    uint64_t v7 = *(void **)(a1 + 40);
    v8[4] = *(void *)(a1 + 32);
    id v9 = v7;
    id v10 = *(id *)(a1 + 48);
    [a2 haveContact:v9 complete:v8];
  }
}

void sub_10000BFF8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) oslog];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100068A20(a1, (uint64_t)v4, v5);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10000C080(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) oslog];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100068AAC();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000C228(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000C270(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10000C28C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_10000C2B4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

BOOL sub_1000105E8(int a1)
{
  return a1 != -72499473;
}

void sub_100011764(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100011788(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = +[NSDate dateWithTimeIntervalSinceNow:0.0];
  [WeakRetained setFinishDate:v1];
}

void sub_100011B1C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100011B38(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained finishingBlock];
    v4[2]();

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v5 = [v3 completionHandlerDidRunCondition];
    [v5 fulfill];

    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = [v3 dependencies];
    id v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [v3 removeDependency:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        }
        id v8 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v8);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "completion handler called on deallocated operation instance", buf, 2u);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

id sub_100011E54(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isCancelled];
  if ((result & 1) == 0)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 setTimeoutCanOccur:0];
  }
  return result;
}

BOOL sub_100012058(id a1, id a2, unint64_t a3, BOOL *a4)
{
  return [a2 isFinished:a3, a4] ^ 1;
}

void sub_100012330(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100012344(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained timeoutCanOccur])
  {
    v1 = [WeakRetained _onqueueTimeoutError];
    [WeakRetained setError:v1];

    [WeakRetained setTimeoutCanOccur:0];
    [WeakRetained cancel];
  }
}

void sub_100012450(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100012878(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id obj)
{
}

void sub_100012A6C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100012A8C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000137AC(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  id v3 = [*(id *)(a1 + 32) stateInit];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v9 = [v8 objectAtIndexedSubscript:0];
        uint64_t v10 = [v8 objectAtIndexedSubscript:1];
        [v2 setObject:v10 forKeyedSubscript:v9];
      }
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  long long v11 = (void *)qword_1000A7480;
  qword_1000A7480 = (uint64_t)v2;
}

void sub_1000139A4(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  id v3 = [*(id *)(a1 + 32) stateInit];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v9 = [v8 objectAtIndexedSubscript:0];
        uint64_t v10 = [v8 objectAtIndexedSubscript:1];
        [v2 setObject:v9 forKeyedSubscript:v10];
      }
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  long long v11 = (void *)qword_1000A7490;
  qword_1000A7490 = (uint64_t)v2;
}

void sub_100013B50(id a1)
{
  v1 = +[NSMutableSet set];
  [v1 addObject:@"Unlocked"];
  [v1 addObject:@"AccountChanged"];
  [v1 addObject:@"CKAccountChanged"];
  [v1 addObject:@"RepairIDSFlag"];
  [v1 addObject:@"ConfigBagFetch"];
  [v1 addObject:@"ManateeViewChanged"];
  [v1 addObject:@"FetchIDMS"];
  [v1 addObject:@"ValidateSelf"];
  [v1 addObject:@"CheckAccountSignatures"];
  [v1 addObject:@"FetchSelf"];
  [v1 addObject:@"FetchPublicKeys"];
  [v1 addObject:@"CheckIDSRegistration"];
  [v1 addObject:@"ValidateSelfOptIn"];
  [v1 addObject:@"ChangeOptInState"];
  [v1 addObject:@"EnsureIdentity"];
  [v1 addObject:@"CloudKitOutgoing"];
  [v1 addObject:@"CloudKitIncoming"];
  [v1 addObject:@"CloudKitZoneRecreate"];
  [v1 addObject:@"OctagonTrustChanged"];
  [v1 addObject:@"CheckKTAccountKey"];
  [v1 addObject:@"StatusUpdate"];
  [v1 addObject:@"CheckKTAccountKeyChanged"];
  [v1 addObject:@"IDSStatusChanged"];
  [v1 addObject:@"CheckServerOptIn"];
  [v1 addObject:@"PokeIDS"];
  id v2 = (void *)qword_1000A74A0;
  qword_1000A74A0 = (uint64_t)v1;
}

uint64_t sub_100013D28()
{
  if (qword_1000A74B0 != -1) {
    dispatch_once(&qword_1000A74B0, &stru_10008D318);
  }
  return qword_1000A74B8;
}

void sub_100013D6C(id a1)
{
  qword_1000A74B8 = (uint64_t)objc_alloc_init((Class)NSData);
}

id sub_100013D94(id result)
{
  if (!result) {
    return result;
  }
  v1 = +[NSMutableArray arrayWithObject:result];
  id result = [(NSMutableArray *)v1 count];
  if (!result) {
    return result;
  }
  v30 = v42;
  uint64_t v31 = v44;
  v32 = v40;
  uint64_t v28 = v38;
  v29 = v46;
  v27 = v48;
  do
  {
    id v2 = [(NSMutableArray *)v1 lastObject];
    [(NSMutableArray *)v1 removeLastObject];
    [v2 setUnknownFields:0];
    id v3 = [(id)objc_opt_class() descriptor];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v4 = (void *)v3[1];
    id v5 = [v4 countByEnumeratingWithState:&v49 objects:v54 count:16];
    if (!v5) {
      goto LABEL_36;
    }
    id v6 = v5;
    uint64_t v7 = *(void *)v50;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v50 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        if (*(unsigned __int8 *)(v9[1] + 30) - 15 <= 1)
        {
          unsigned int v10 = [*(id *)(*((void *)&v49 + 1) + 8 * i) fieldType];
          if (v10 == 2)
          {
            uint64_t v16 = v2[8];
            if (v16) {
              v17 = *(void **)(v16 + *(unsigned int *)(v9[1] + 24));
            }
            else {
              v17 = 0;
            }
            switch([v9 mapKeyDataType])
            {
              case 0u:
                v47[0] = _NSConcreteStackBlock;
                v47[1] = 3221225472;
                v48[0] = sub_100014364;
                v48[1] = &unk_10008D340;
                v48[2] = v1;
                v18 = v47;
                goto LABEL_33;
              case 1u:
              case 0xBu:
                v45[0] = _NSConcreteStackBlock;
                v45[1] = 3221225472;
                v46[0] = sub_10001436C;
                v46[1] = &unk_10008D368;
                v46[2] = v1;
                v18 = v45;
                goto LABEL_33;
              case 2u:
              case 7u:
              case 9u:
                v43[0] = _NSConcreteStackBlock;
                v43[1] = 3221225472;
                v44[0] = sub_100014374;
                v44[1] = &unk_10008D390;
                v44[2] = v1;
                v18 = v43;
                goto LABEL_33;
              case 4u:
              case 0xCu:
                v41[0] = _NSConcreteStackBlock;
                v41[1] = 3221225472;
                v42[0] = sub_10001437C;
                v42[1] = &unk_10008D3B8;
                v42[2] = v1;
                v18 = v41;
                goto LABEL_33;
              case 5u:
              case 8u:
              case 0xAu:
                v39[0] = _NSConcreteStackBlock;
                v39[1] = 3221225472;
                v40[0] = sub_100014384;
                v40[1] = &unk_10008D3E0;
                v40[2] = v1;
                v18 = v39;
                goto LABEL_33;
              case 0xEu:
                v37[0] = _NSConcreteStackBlock;
                v37[1] = 3221225472;
                v38[0] = sub_10001438C;
                v38[1] = &unk_10008D408;
                v38[2] = v1;
                v18 = v37;
LABEL_33:
                [v17 enumerateKeysAndObjectsUsingBlock:v18];
                break;
              default:
                continue;
            }
          }
          else if (v10 == 1)
          {
            uint64_t v14 = v2[8];
            if (v14) {
              long long v15 = *(void **)(v14 + *(unsigned int *)(v9[1] + 24));
            }
            else {
              long long v15 = 0;
            }
            if ([v15 count]) {
              [(NSMutableArray *)v1 addObjectsFromArray:v15];
            }
          }
          else
          {
            if (v10) {
              continue;
            }
            long long v11 = (_DWORD *)v9[1];
            unint64_t v12 = v11[5];
            if ((v12 & 0x80000000) != 0)
            {
              uint64_t v13 = v2[8];
              if (*(_DWORD *)(v13 + 4 * -(int)v12) != v11[4]) {
                continue;
              }
LABEL_24:
              [(NSMutableArray *)v1 addObject:*(void *)(v13 + v11[6])];
              continue;
            }
            uint64_t v13 = v2[8];
            if ((*(_DWORD *)(v13 + ((v12 >> 3) & 0x1FFFFFFC)) >> v12)) {
              goto LABEL_24;
            }
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v49 objects:v54 count:16];
    }
    while (v6);
LABEL_36:
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v19 = [v2 extensionsCurrentlySet];
    id v20 = [v19 countByEnumeratingWithState:&v33 objects:v53 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v34;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(void *)v34 != v22) {
            objc_enumerationMutation(v19);
          }
          int v24 = *(void **)(*((void *)&v33 + 1) + 8 * (void)j);
          if ([v24 dataType] - 15 <= 1)
          {
            unsigned int v25 = [v24 isRepeated];
            id v26 = [v2 getExtension:v24];
            if (v25) {
              [(NSMutableArray *)v1 addObjectsFromArray:v26];
            }
            else {
              [(NSMutableArray *)v1 addObject:v26];
            }
          }
        }
        id v21 = [v19 countByEnumeratingWithState:&v33 objects:v53 count:16];
      }
      while (v21);
    }
    id result = [(NSMutableArray *)v1 count];
  }
  while (result);
  return result;
}

uint64_t sub_10001432C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 64);
  if (v2) {
    return *(void *)(v2 + *(unsigned int *)(*(void *)(a2 + 8) + 24));
  }
  else {
    return 0;
  }
}

id sub_100014364(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObject:];
}

id sub_10001436C(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObject:];
}

id sub_100014374(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObject:];
}

id sub_10001437C(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObject:];
}

id sub_100014384(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObject:];
}

id sub_10001438C(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObject:];
}

id sub_100014394(id result)
{
  if ((int)result >= 30008) {
    return +[NSException raise:NSInternalInconsistencyException, @"Linked to ProtocolBuffer runtime version %d, but code compiled needing at least %d!", 30007, result format];
  }
  if ((int)result <= 30000) {
    return +[NSException raise:NSInternalInconsistencyException, @"Proto generation source compiled against runtime version %d, but this version of the runtime only supports back to %d!", result, 30001 format];
  }
  return result;
}

id sub_10001441C()
{
  return +[NSException raise:NSInternalInconsistencyException, @"Proto generation source appears to have been from a version newer that this runtime (%d).", 30007 format];
}

id sub_100014460(id result)
{
  if (result != 30001) {
    return +[NSException raise:NSInternalInconsistencyException, @"Linked to ProtocolBuffer runtime version %d, but code compiled with version %d!", 30001, result, v1, v2 format];
  }
  return result;
}

BOOL sub_1000144B8(void *a1, uint64_t a2)
{
  id v3 = [objc_msgSend(a1, "descriptor") fieldWithNumber:a2];

  return sub_100014500((uint64_t)a1, (uint64_t)v3);
}

BOOL sub_100014500(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0;
  if (a1 && a2)
  {
    uint64_t v3 = *(void *)(a2 + 8);
    if ((*(_WORD *)(v3 + 28) & 0xF02) != 0)
    {
      uint64_t v4 = *(void *)(a1 + 64);
      if (v4) {
        id v5 = *(void **)(v4 + *(unsigned int *)(v3 + 24));
      }
      else {
        id v5 = 0;
      }
      return [v5 count] != 0;
    }
    else
    {
      unint64_t v6 = *(unsigned int *)(v3 + 20);
      if ((v6 & 0x80000000) != 0) {
        return *(_DWORD *)(*(void *)(a1 + 64) + 4 * -(int)v6) == *(_DWORD *)(v3 + 16);
      }
      else {
        return (*(_DWORD *)(*(void *)(a1 + 64) + ((v6 >> 3) & 0x1FFFFFFC)) >> v6) & 1;
      }
    }
  }
  return v2;
}

void sub_1000145D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  unint64_t v4 = *(unsigned int *)(v3 + 20);
  if ((v4 & 0x80000000) != 0)
  {
    uint64_t v5 = *(void *)(a1 + 64);
    if (*(_DWORD *)(v5 + 4 * -(int)v4) != *(_DWORD *)(v3 + 16)) {
      return;
    }
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 64);
    if (((*(_DWORD *)(v5 + ((v4 >> 3) & 0x1FFFFFFC)) >> v4) & 1) == 0) {
      return;
    }
  }
  if ((*(_WORD *)(v3 + 28) & 0xF02) != 0 || *(unsigned __int8 *)(v3 + 30) - 13 <= 3)
  {
    uint64_t v6 = *(unsigned int *)(v3 + 24);

    *(void *)(v5 + v6) = 0;
    LODWORD(v4) = *(_DWORD *)(v3 + 20);
  }
  uint64_t v7 = *(void *)(a1 + 64);
  if ((v4 & 0x80000000) != 0) {
    *(_DWORD *)(v7 + 4 * -(int)v4) = 0;
  }
  else {
    *(_DWORD *)(v7 + 4 * (v4 >> 5)) &= ~(1 << v4);
  }
}

uint64_t sub_1000146C0(uint64_t result, unsigned int a2, int a3, int a4)
{
  uint64_t v4 = *(void *)(result + 64);
  if ((a2 & 0x80000000) != 0)
  {
    if (!a4) {
      a3 = 0;
    }
    *(_DWORD *)(v4 + 4 * -a2) = a3;
  }
  else
  {
    unsigned int v5 = a2 >> 5;
    int v6 = 1 << a2;
    if (a4) {
      int v7 = *(_DWORD *)(v4 + 4 * v5) | v6;
    }
    else {
      int v7 = *(_DWORD *)(v4 + 4 * v5) & ~v6;
    }
    *(_DWORD *)(v4 + 4 * v5) = v7;
  }
  return result;
}

void sub_100014714(uint64_t a1, id *a2)
{
  unsigned int v4 = *(_DWORD *)(*((void *)[a2[2] objectAtIndexedSubscript:0] + 1) + 20);

  sub_100014780(a1, a2, v4, 0);
}

void sub_100014780(uint64_t a1, void *a2, unsigned int a3, int a4)
{
  int v5 = *(_DWORD *)(*(void *)(a1 + 64) - 4 * (int)a3);
  if (v5 != a4 && v5 != 0)
  {
    id v8 = [a2 fieldWithNumber:];
    if (v8)
    {
      uint64_t v9 = v8[1];
      if ((*(_WORD *)(v9 + 28) & 0xF02) != 0 || *(unsigned __int8 *)(v9 + 30) - 13 <= 3)
      {
        uint64_t v10 = *(void *)(a1 + 64);
        uint64_t v11 = *(unsigned int *)(v9 + 24);

        *(void *)(v10 + v11) = 0;
      }
    }
    uint64_t v12 = *(void *)(a1 + 64);
    if ((a3 & 0x80000000) != 0) {
      *(_DWORD *)(v12 + 4 * -a3) = 0;
    }
    else {
      *(_DWORD *)(v12 + 4 * (a3 >> 5)) &= ~(1 << a3);
    }
  }
}

BOOL sub_10001485C(uint64_t a1, unsigned int a2, int a3)
{
  if ((a2 & 0x80000000) != 0) {
    return *(_DWORD *)(*(void *)(a1 + 64) + 4 * -a2) == a3;
  }
  else {
    return (*(_DWORD *)(*(void *)(a1 + 64) + 4 * (a2 >> 5)) >> a2) & 1;
  }
}

uint64_t sub_1000148A8(uint64_t a1, int a2)
{
  return *(unsigned int *)(*(void *)(a1 + 64) - 4 * a2);
}

void sub_1000148C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(_DWORD **)(a2 + 8);
  unint64_t v3 = v2[5];
  if ((v3 & 0x80000000) != 0)
  {
    uint64_t v4 = *(void *)(a1 + 64);
    if (*(_DWORD *)(v4 + 4 * -(int)v3) == v2[4]) {
      return;
    }
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 64);
    if ((*(_DWORD *)(v4 + ((v3 >> 3) & 0x1FFFFFFC)) >> v3)) {
      return;
    }
  }
  uint64_t v5 = v2[6];
  uint64_t v6 = *(void *)(v4 + v5);
  id v7 = (id)v6;
  *(void *)(v4 + v5) = 0;
  sub_10002DD6C(v6);
}

uint64_t sub_100014974(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;

  return sub_1000149B8(a1, a2, v5);
}

uint64_t sub_1000149B8(uint64_t a1, void *a2, void *a3)
{
  unint64_t v3 = a3;
  uint64_t v6 = a2[1];
  int v7 = *(unsigned __int8 *)(v6 + 30);
  __int16 v8 = *(_WORD *)(v6 + 28);
  if ((v8 & 0xF02) != 0)
  {
    uint64_t v9 = *(void *)(a1 + 64);
    uint64_t v10 = *(unsigned int *)(v6 + 24);
    uint64_t v11 = *(char **)(v9 + v10);
    *(void *)(v9 + v10) = a3;
    if (!v11) {
      goto LABEL_32;
    }
    if ([a2 fieldType] == 1)
    {
      if ((v7 - 13) <= 3)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = &OBJC_IVAR___TransparencyGPBAutocreatedArray__autocreator;
          goto LABEL_29;
        }
LABEL_31:

        goto LABEL_32;
      }
      uint64_t v12 = &OBJC_IVAR___TransparencyGPBInt32Array__autocreator;
    }
    else if ([a2 mapKeyDataType] == 14 && (v7 - 13) <= 3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_31;
      }
      uint64_t v12 = &OBJC_IVAR___TransparencyGPBAutocreatedDictionary__autocreator;
    }
    else
    {
      uint64_t v12 = &OBJC_IVAR___TransparencyGPBInt32Int32Dictionary__autocreator;
    }
LABEL_29:
    uint64_t v22 = *v12;
    if (*(void *)&v11[v22] == a1) {
      *(void *)&v11[v22] = 0;
    }
    goto LABEL_31;
  }
  uint64_t v13 = (void *)a2[2];
  if (v13)
  {
    sub_100014780(a1, v13, *(_DWORD *)(v6 + 20), *(_DWORD *)(v6 + 16));
    __int16 v8 = *(_WORD *)(v6 + 28);
  }
  BOOL v14 = v3 != 0;
  if ((v8 & 0x20) != 0 && ![v3 length])
  {

    BOOL v14 = 0;
    unint64_t v3 = 0;
  }
  unint64_t v15 = *(unsigned int *)(v6 + 20);
  uint64_t v16 = *(void *)(a1 + 64);
  if ((v15 & 0x80000000) != 0)
  {
    int v19 = *(_DWORD *)(v6 + 16);
    if (!v14) {
      int v19 = 0;
    }
    *(_DWORD *)(v16 + 4 * -(int)v15) = v19;
  }
  else
  {
    unint64_t v17 = v15 >> 5;
    int v18 = 1 << v15;
    if (v14) {
      *(_DWORD *)(v16 + 4 * v17) |= v18;
    }
    else {
      *(_DWORD *)(v16 + 4 * v17) &= ~v18;
    }
  }
  uint64_t v20 = *(void *)(a1 + 64);
  uint64_t v21 = *(unsigned int *)(v6 + 24);
  uint64_t v11 = *(char **)(v20 + v21);
  *(void *)(v20 + v21) = v3;
  if (v11)
  {
    if ((v7 - 15) <= 1 && sub_10002DA48((uint64_t)v11, a1)) {
      sub_10002DD6C((uint64_t)v11);
    }
    goto LABEL_31;
  }
LABEL_32:

  return sub_10002DA58(a1);
}

uint64_t sub_100014BE0(uint64_t a1, void *a2)
{
  id v3 = sub_100014C40(a1, a2);
  if ((*(_WORD *)(a2[1] + 28) & 0x1000) == 0)
  {
    if ([a2 isValidEnumValue:v3]) {
      return v3;
    }
    else {
      return 4222467823;
    }
  }
  return (uint64_t)v3;
}

id sub_100014C40(uint64_t a1, void *a2)
{
  uint64_t v2 = (_DWORD *)a2[1];
  unint64_t v3 = v2[5];
  if ((v3 & 0x80000000) != 0)
  {
    uint64_t v4 = *(void *)(a1 + 64);
    if (*(_DWORD *)(v4 + 4 * -(int)v3) == v2[4]) {
      return (id)*(unsigned int *)(v4 + v2[6]);
    }
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 64);
    if ((*(_DWORD *)(v4 + ((v3 >> 3) & 0x1FFFFFFC)) >> v3)) {
      return (id)*(unsigned int *)(v4 + v2[6]);
    }
  }
  return [a2 defaultValue];
}

id sub_100014CCC(void *a1, void *a2, uint64_t a3)
{
  if ((objc_msgSend(a2, "isValidEnumValue:") & 1) == 0) {
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, @"%@.%@: Attempt to set an unknown enum value (%d)", objc_opt_class(), [a2 name], a3);
  }

  return sub_100014D78(a1, (uint64_t)a2, a3);
}

id sub_100014D78(void *a1, uint64_t a2, int a3)
{
  uint64_t v6 = *(void **)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 8);
  if (v6) {
    sub_100014780((uint64_t)a1, v6, *(_DWORD *)(v7 + 20), *(_DWORD *)(v7 + 16));
  }
  *(_DWORD *)(a1[8] + *(unsigned int *)(v7 + 24)) = a3;
  if (a3) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = (*(_WORD *)(v7 + 28) & 0x20) == 0;
  }
  unint64_t v9 = *(unsigned int *)(v7 + 20);
  uint64_t v10 = a1[8];
  if ((v9 & 0x80000000) != 0)
  {
    if (v8) {
      int v13 = *(_DWORD *)(v7 + 16);
    }
    else {
      int v13 = 0;
    }
    *(_DWORD *)(v10 + 4 * -(int)v9) = v13;
  }
  else
  {
    unint64_t v11 = v9 >> 5;
    int v12 = 1 << v9;
    if (v8) {
      *(_DWORD *)(v10 + 4 * v11) |= v12;
    }
    else {
      *(_DWORD *)(v10 + 4 * v11) &= ~v12;
    }
  }

  return sub_10002DA58(a1);
}

BOOL sub_100014E78(uint64_t a1, void *a2)
{
  uint64_t v2 = (_DWORD *)a2[1];
  int v3 = v2[4];
  unint64_t v4 = v2[5];
  if ((v4 & 0x80000000) == 0)
  {
    uint64_t v5 = *(void *)(a1 + 64);
    if ((*(_DWORD *)(v5 + ((v4 >> 3) & 0x1FFFFFFC)) >> v4)) {
      goto LABEL_3;
    }
    return (unint64_t)[a2 defaultValue] & 1;
  }
  uint64_t v5 = *(void *)(a1 + 64);
  if (*(_DWORD *)(v5 + 4 * -(int)v4) != v3) {
    return (unint64_t)[a2 defaultValue] & 1;
  }
LABEL_3:
  unint64_t v6 = v2[6];
  if ((v6 & 0x80000000) != 0) {
    return *(_DWORD *)(v5 + 4 * -(int)v6) == v3;
  }
  else {
    return (*(_DWORD *)(v5 + ((v6 >> 3) & 0x1FFFFFFC)) >> v6) & 1;
  }
}

void *sub_100014F20(void *a1, uint64_t a2, int a3)
{
  if (a1)
  {
    if (a2) {
      return sub_100014F30(a1, a2, a3);
    }
  }
  return a1;
}

id sub_100014F30(void *a1, uint64_t a2, int a3)
{
  uint64_t v5 = *(void *)(a2 + 8);
  unint64_t v6 = *(void **)(a2 + 16);
  if (v6) {
    sub_100014780((uint64_t)a1, v6, *(_DWORD *)(v5 + 20), *(_DWORD *)(v5 + 16));
  }
  unint64_t v7 = *(unsigned int *)(v5 + 24);
  uint64_t v8 = a1[8];
  if ((v7 & 0x80000000) != 0)
  {
    int v11 = *(_DWORD *)(v5 + 16);
    if (!a3) {
      int v11 = 0;
    }
    *(_DWORD *)(v8 + 4 * -(int)v7) = v11;
    if (a3) {
      goto LABEL_9;
    }
  }
  else
  {
    unint64_t v9 = v7 >> 5;
    int v10 = 1 << v7;
    if (a3)
    {
      *(_DWORD *)(v8 + 4 * v9) |= v10;
LABEL_9:
      BOOL v12 = 1;
      goto LABEL_12;
    }
    *(_DWORD *)(v8 + 4 * v9) &= ~v10;
  }
  BOOL v12 = (*(_WORD *)(v5 + 28) & 0x20) == 0;
LABEL_12:
  unint64_t v13 = *(unsigned int *)(v5 + 20);
  uint64_t v14 = a1[8];
  if ((v13 & 0x80000000) != 0)
  {
    if (v12) {
      int v17 = *(_DWORD *)(v5 + 16);
    }
    else {
      int v17 = 0;
    }
    *(_DWORD *)(v14 + 4 * -(int)v13) = v17;
  }
  else
  {
    unint64_t v15 = v13 >> 5;
    int v16 = 1 << v13;
    if (v12) {
      *(_DWORD *)(v14 + 4 * v15) |= v16;
    }
    else {
      *(_DWORD *)(v14 + 4 * v15) &= ~v16;
    }
  }

  return sub_10002DA58(a1);
}

void *sub_100015064(void *a1, uint64_t a2, int a3)
{
  if (a1)
  {
    if (a2) {
      return sub_100014D78(a1, a2, a3);
    }
  }
  return a1;
}

id sub_100015074(uint64_t a1, void *a2)
{
  uint64_t v2 = (_DWORD *)a2[1];
  unint64_t v3 = v2[5];
  if ((v3 & 0x80000000) != 0)
  {
    uint64_t v4 = *(void *)(a1 + 64);
    if (*(_DWORD *)(v4 + 4 * -(int)v3) == v2[4]) {
      return *(id *)(v4 + v2[6]);
    }
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 64);
    if ((*(_DWORD *)(v4 + ((v3 >> 3) & 0x1FFFFFFC)) >> v3)) {
      return *(id *)(v4 + v2[6]);
    }
  }
  return [a2 defaultValue];
}

void *sub_1000150E8(void *a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    if (a2) {
      return sub_1000150F8(a1, a2, a3);
    }
  }
  return a1;
}

id sub_1000150F8(void *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = *(void **)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 8);
  if (v6) {
    sub_100014780((uint64_t)a1, v6, *(_DWORD *)(v7 + 20), *(_DWORD *)(v7 + 16));
  }
  *(void *)(a1[8] + *(unsigned int *)(v7 + 24)) = a3;
  if (a3) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = (*(_WORD *)(v7 + 28) & 0x20) == 0;
  }
  unint64_t v9 = *(unsigned int *)(v7 + 20);
  uint64_t v10 = a1[8];
  if ((v9 & 0x80000000) != 0)
  {
    if (v8) {
      int v13 = *(_DWORD *)(v7 + 16);
    }
    else {
      int v13 = 0;
    }
    *(_DWORD *)(v10 + 4 * -(int)v9) = v13;
  }
  else
  {
    unint64_t v11 = v9 >> 5;
    int v12 = 1 << v9;
    if (v8) {
      *(_DWORD *)(v10 + 4 * v11) |= v12;
    }
    else {
      *(_DWORD *)(v10 + 4 * v11) &= ~v12;
    }
  }

  return sub_10002DA58(a1);
}

float sub_1000151F0(uint64_t a1, void *a2)
{
  uint64_t v2 = (_DWORD *)a2[1];
  unint64_t v3 = v2[5];
  if ((v3 & 0x80000000) != 0)
  {
    uint64_t v4 = *(void *)(a1 + 64);
    if (*(_DWORD *)(v4 + 4 * -(int)v3) == v2[4]) {
      return *(float *)(v4 + v2[6]);
    }
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 64);
    if ((*(_DWORD *)(v4 + ((v3 >> 3) & 0x1FFFFFFC)) >> v3)) {
      return *(float *)(v4 + v2[6]);
    }
  }
  LODWORD(result) = [a2 defaultValue];
  return result;
}

void *sub_10001527C(void *a1, uint64_t a2, float a3)
{
  if (a1)
  {
    if (a2) {
      return sub_10001528C(a1, a2, a3);
    }
  }
  return a1;
}

id sub_10001528C(void *a1, uint64_t a2, float a3)
{
  unint64_t v6 = *(void **)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 8);
  if (v6) {
    sub_100014780((uint64_t)a1, v6, *(_DWORD *)(v7 + 20), *(_DWORD *)(v7 + 16));
  }
  *(float *)(a1[8] + *(unsigned int *)(v7 + 24)) = a3;
  BOOL v8 = a3 != 0.0 || (*(_WORD *)(v7 + 28) & 0x20) == 0;
  unint64_t v9 = *(unsigned int *)(v7 + 20);
  uint64_t v10 = a1[8];
  if ((v9 & 0x80000000) != 0)
  {
    if (v8) {
      int v13 = *(_DWORD *)(v7 + 16);
    }
    else {
      int v13 = 0;
    }
    *(_DWORD *)(v10 + 4 * -(int)v9) = v13;
  }
  else
  {
    unint64_t v11 = v9 >> 5;
    int v12 = 1 << v9;
    if (v8) {
      *(_DWORD *)(v10 + 4 * v11) |= v12;
    }
    else {
      *(_DWORD *)(v10 + 4 * v11) &= ~v12;
    }
  }

  return sub_10002DA58(a1);
}

double sub_100015388(uint64_t a1, void *a2)
{
  uint64_t v2 = (_DWORD *)a2[1];
  unint64_t v3 = v2[5];
  if ((v3 & 0x80000000) != 0)
  {
    uint64_t v4 = *(void *)(a1 + 64);
    if (*(_DWORD *)(v4 + 4 * -(int)v3) == v2[4]) {
      return *(double *)(v4 + v2[6]);
    }
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 64);
    if ((*(_DWORD *)(v4 + ((v3 >> 3) & 0x1FFFFFFC)) >> v3)) {
      return *(double *)(v4 + v2[6]);
    }
  }
  return COERCE_DOUBLE([a2 defaultValue]);
}

void *sub_100015414(void *a1, uint64_t a2, double a3)
{
  if (a1)
  {
    if (a2) {
      return sub_100015424(a1, a2, a3);
    }
  }
  return a1;
}

id sub_100015424(void *a1, uint64_t a2, double a3)
{
  unint64_t v6 = *(void **)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 8);
  if (v6) {
    sub_100014780((uint64_t)a1, v6, *(_DWORD *)(v7 + 20), *(_DWORD *)(v7 + 16));
  }
  *(double *)(a1[8] + *(unsigned int *)(v7 + 24)) = a3;
  BOOL v8 = a3 != 0.0 || (*(_WORD *)(v7 + 28) & 0x20) == 0;
  unint64_t v9 = *(unsigned int *)(v7 + 20);
  uint64_t v10 = a1[8];
  if ((v9 & 0x80000000) != 0)
  {
    if (v8) {
      int v13 = *(_DWORD *)(v7 + 16);
    }
    else {
      int v13 = 0;
    }
    *(_DWORD *)(v10 + 4 * -(int)v9) = v13;
  }
  else
  {
    unint64_t v11 = v9 >> 5;
    int v12 = 1 << v9;
    if (v8) {
      *(_DWORD *)(v10 + 4 * v11) |= v12;
    }
    else {
      *(_DWORD *)(v10 + 4 * v11) &= ~v12;
    }
  }

  return sub_10002DA58(a1);
}

uint64_t sub_100015524(uint64_t result, void *a2, void *a3)
{
  if (result && a2)
  {
    uint64_t v4 = result;
    id v5 = [a3 copy];
    return sub_1000149B8(v4, a2, v5);
  }
  return result;
}

uint64_t sub_100015584(uint64_t result, void *a2, void *a3)
{
  if (result && a2)
  {
    uint64_t v4 = result;
    id v5 = a3;
    return sub_1000149B8(v4, a2, v5);
  }
  return result;
}

char *sub_1000155DC(const char *a1, BOOL a2)
{
  Protocol = objc_getProtocol("TransparencyGPBMessageSignatureProtocol");
  return protocol_getMethodDescription(Protocol, a1, 0, a2).types;
}

__CFString *sub_100015620(void *a1, __CFString *a2)
{
  uint64_t v2 = &stru_10008F418;
  if (a1)
  {
    if (a2) {
      uint64_t v4 = a2;
    }
    else {
      uint64_t v4 = &stru_10008F418;
    }
    uint64_t v2 = (__CFString *)+[NSMutableString string];
    sub_100015680(a1, v2, v4);
  }
  return v2;
}

id sub_100015680(void *a1, void *a2, __CFString *a3)
{
  id v5 = a1;
  unint64_t v6 = [a1 descriptor];
  uint64_t v7 = (void *)v6[1];
  BOOL v8 = (char *)[v7 count];
  unint64_t v9 = [v6 extensionRanges];
  unsigned int v10 = [v6 extensionRangesCount];
  id v11 = [[objc_msgSend(v5, "extensionsCurrentlySet") sortedArrayUsingSelector:@"compareByFieldNumber:"];
  if (v8) {
    BOOL v12 = 0;
  }
  else {
    BOOL v12 = v10 == 0;
  }
  if (!v12)
  {
    int v13 = v11;
    uint64_t v14 = 0;
    unint64_t v15 = v10;
    unint64_t v16 = 0;
    v59 = v77;
    v60 = v73;
    v69 = v5;
    id v62 = v11;
    v63 = v9;
    v66 = a3;
    unint64_t v67 = v15;
    v64 = v8;
    v65 = v7;
    do
    {
      if (v14 == v8)
      {
        uint64_t v17 = v16++;
        sub_100016994(v5, v13, v9[v17], a2, a3);
        uint64_t v14 = v8;
        continue;
      }
      if (v16 != v15)
      {
        int v18 = [v7 objectAtIndexedSubscript:v14];
        int v19 = &v9[v16];
        if (*(_DWORD *)(v18[1] + 16) >= *(_DWORD *)v19)
        {
          ++v16;
          sub_100016994(v5, v13, *v19, a2, a3);
          continue;
        }
      }
      v70 = v14 + 1;
      v71 = [v7 objectAtIndexedSubscript:v14];
      unsigned int v20 = [v71 fieldType];
      unsigned int v21 = v20;
      if (v20 == 2 || v20 == 1)
      {
        uint64_t v25 = v5[8];
        unint64_t v68 = v16;
        if (v25) {
          id v26 = *(void **)(v25 + *(unsigned int *)(v71[1] + 24));
        }
        else {
          id v26 = 0;
        }
        unint64_t v27 = (unint64_t)[v26 count];
        if (v27) {
          goto LABEL_21;
        }
      }
      else
      {
        if (v20)
        {
          uint64_t v14 = v70;
          continue;
        }
        uint64_t v22 = v71[1];
        unint64_t v23 = *(unsigned int *)(v22 + 20);
        unint64_t v68 = v16;
        if ((v23 & 0x80000000) != 0) {
          unsigned int v24 = *(_DWORD *)(v5[8] + 4 * -(int)v23) == *(_DWORD *)(v22 + 16);
        }
        else {
          unsigned int v24 = (*(_DWORD *)(v5[8] + ((v23 >> 3) & 0x1FFFFFFC)) >> v23) & 1;
        }
        id v26 = 0;
        unint64_t v27 = v24;
        if (v24)
        {
LABEL_21:
          uint64_t v28 = (NSString *)[v71 textFormatName];
          if ([(NSString *)v28 length]) {
            goto LABEL_24;
          }
          uint64_t v28 = +[NSString stringWithFormat:@"%u", *(unsigned int *)(v71[1] + 16)];
          if (v27 < 2)
          {
            a3 = v66;
            id v5 = v69;
            CFStringRef v29 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"  # %@", [v71 name]);
          }
          else
          {
            [a2 appendFormat:@"%@# %@\n", a3, [v71 name]];
LABEL_24:
            CFStringRef v29 = &stru_10008F418;
          }
          if (v21 == 2)
          {
            unsigned int v30 = [v71 mapKeyDataType];
            a3 = v66;
            int v31 = *(unsigned __int8 *)(v71[1] + 30);
            v61 = +[NSString stringWithFormat:@"%@%@ {%@\n", v66, v28, v29, v59, v60];
            v32 = +[NSString stringWithFormat:@"%@%@ {\n", v66, v28];
            long long v33 = +[NSString stringWithFormat:@"%@}\n", v66];
            long long v34 = +[NSString stringWithFormat:@"%@  key: ", v66];
            long long v35 = ":";
            if ((v31 - 15) < 2) {
              long long v35 = "";
            }
            long long v36 = +[NSString stringWithFormat:@"%@  value%s ", v66, v35];
            v79[0] = 0;
            v79[1] = v79;
            v79[2] = 0x2020000000;
            char v80 = 1;
            if (v30 == 14 && (v31 - 13) <= 3)
            {
              v76[0] = _NSConcreteStackBlock;
              v76[1] = 3221225472;
              v77[0] = sub_100016F74;
              v77[1] = &unk_10008D480;
              v77[2] = a2;
              v77[3] = v61;
              v77[4] = v32;
              v77[5] = v34;
              char v78 = v31;
              v77[6] = v36;
              v77[7] = v66;
              v77[8] = v33;
              v77[9] = v79;
              [v26 enumerateKeysAndObjectsUsingBlock:v76];
            }
            else
            {
              v72[0] = _NSConcreteStackBlock;
              v72[1] = 3221225472;
              v73[0] = sub_1000170C0;
              v73[1] = &unk_10008D4A8;
              v73[9] = v33;
              v73[10] = v79;
              v73[2] = a2;
              v73[3] = v61;
              char v74 = v30;
              v73[4] = v32;
              v73[5] = v34;
              char v75 = v31;
              v73[6] = v36;
              v73[7] = v66;
              v73[8] = v71;
              [v26 enumerateForTextFormat:v72];
            }
            _Block_object_dispose(v79, 8);
            id v5 = v69;
            uint64_t v14 = v70;
          }
          else
          {
            uint64_t v37 = 0;
            int v38 = *(unsigned __int8 *)(v71[1] + 30);
            if ((v38 - 15) >= 2) {
              v39 = ":";
            }
            else {
              v39 = "";
            }
            do
            {
              [a2 appendFormat:@"%@%@%s ", a3, v28, v39];
              switch(v38)
              {
                case 0:
                  if (v26) {
                    unsigned int v45 = [v26 valueAtIndex:v37];
                  }
                  else {
                    unsigned int v45 = sub_100014E78((uint64_t)v5, v71);
                  }
                  if (v45) {
                    CFStringRef v53 = @"true";
                  }
                  else {
                    CFStringRef v53 = @"false";
                  }
                  [a2 appendString:v53];
                  break;
                case 1:
                case 11:
                  if (v26) {
                    id v42 = [v26 valueAtIndex:v37];
                  }
                  else {
                    id v42 = sub_100014C40((uint64_t)v5, v71);
                  }
                  [a2 appendFormat:@"%u", v42, v58];
                  break;
                case 2:
                case 7:
                case 9:
                  if (v26) {
                    id v40 = [v26 valueAtIndex:v37];
                  }
                  else {
                    id v40 = sub_100014C40((uint64_t)v5, v71);
                  }
                  [a2 appendFormat:@"%d", v40, v58];
                  break;
                case 3:
                  if (v26) {
                    [v26 valueAtIndex:v37];
                  }
                  else {
                    float v46 = sub_1000151F0((uint64_t)v5, v71);
                  }
                  [a2 appendFormat:@"%.*g", 6, v46];
                  break;
                case 4:
                case 12:
                  if (v26) {
                    id v43 = [v26 valueAtIndex:v37];
                  }
                  else {
                    id v43 = sub_100015074((uint64_t)v5, v71);
                  }
                  [a2 appendFormat:@"%llu", v43, v58];
                  break;
                case 5:
                case 8:
                case 10:
                  if (v26) {
                    id v41 = [v26 valueAtIndex:v37];
                  }
                  else {
                    id v41 = sub_100015074((uint64_t)v5, v71);
                  }
                  [a2 appendFormat:@"%lld", v41, v58];
                  break;
                case 6:
                  if (v26) {
                    [v26 valueAtIndex:v37];
                  }
                  else {
                    double v47 = sub_100015388((uint64_t)v5, v71);
                  }
                  [a2 appendFormat:@"%.*lg", 15, *(void *)&v47];
                  break;
                case 13:
                  if (v26) {
                    uint64_t v48 = [v26 objectAtIndex:v37];
                  }
                  else {
                    uint64_t v48 = sub_10002ED6C((uint64_t)v5, v71);
                  }
                  sub_100016480(v48, a2);
                  break;
                case 14:
                  if (v26) {
                    long long v49 = [v26 objectAtIndex:v37];
                  }
                  else {
                    long long v49 = sub_10002ED6C((uint64_t)v5, v71);
                  }
                  sub_100016DDC(v49, a2);
                  break;
                case 15:
                case 16:
                  if (v26) {
                    long long v44 = [v26 objectAtIndex:v37];
                  }
                  else {
                    long long v44 = sub_10002ED6C((uint64_t)v5, v71);
                  }
                  long long v52 = v44;
                  [a2 appendFormat:@"{%@\n", v29];
                  sub_100015680(v52, a2, [(__CFString *)a3 stringByAppendingString:@"  "]);
                  [a2 appendFormat:@"%@}", a3];
                  CFStringRef v29 = &stru_10008F418;
                  id v5 = v69;
                  break;
                case 17:
                  if (v26)
                  {
                    id v50 = [v26 rawValueAtIndex:v37];
                    long long v51 = v71;
                  }
                  else
                  {
                    long long v51 = v71;
                    id v50 = sub_100014C40((uint64_t)v5, v71);
                  }
                  id v54 = [v51 enumDescriptor];
                  if (v54 && (id v55 = [v54 textFormatNameForValue:v50]) != 0) {
                    [a2 appendString:v55];
                  }
                  else {
                    [a2 appendFormat:@"%d", v50];
                  }
                  id v5 = v69;
                  a3 = v66;
                  break;
                default:
                  break;
              }
              [a2 appendFormat:@"%@\n", v29];
              ++v37;
            }
            while (v27 != v37);
            uint64_t v14 = v70;
          }
          BOOL v8 = v64;
          uint64_t v7 = v65;
          int v13 = v62;
          unint64_t v9 = v63;
          goto LABEL_94;
        }
      }
      uint64_t v14 = v70;
LABEL_94:
      unint64_t v15 = v67;
      unint64_t v16 = v68;
    }
    while (v14 < v8 || v16 < v15);
  }
  uint64_t v56 = sub_100015FD4([v5 unknownFields], a3);
  id result = [(__CFString *)v56 length];
  if (result)
  {
    [a2 appendFormat:@"%@# --- Unknown fields ---\n", a3];
    return [a2 appendString:v56];
  }
  return result;
}

void sub_100015F70(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

__CFString *sub_100015FD4(void *a1, const __CFString *a2)
{
  uint64_t v2 = &stru_10008F418;
  if (a1)
  {
    uint64_t v4 = a2 ? (__CFString *)a2 : &stru_10008F418;
    uint64_t v2 = (__CFString *)+[NSMutableString string];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id obj = [a1 sortedFields];
    id v26 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v26)
    {
      uint64_t v25 = *(void *)v44;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v44 != v25) {
            objc_enumerationMutation(obj);
          }
          uint64_t v28 = v5;
          unint64_t v6 = *(void **)(*((void *)&v43 + 1) + 8 * v5);
          id v7 = [v6 number];
          id v8 = [v6 varintList];
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472;
          void v41[2] = sub_1000163CC;
          v41[3] = &unk_10008D430;
          v41[4] = v2;
          v41[5] = v4;
          int v42 = (int)v7;
          [v8 enumerateValuesWithBlock:v41];
          id v9 = [v6 fixed32List];
          v39[0] = _NSConcreteStackBlock;
          v39[1] = 3221225472;
          void v39[2] = sub_100016408;
          v39[3] = &unk_10008D458;
          v39[4] = v2;
          v39[5] = v4;
          int v40 = (int)v7;
          [v9 enumerateValuesWithBlock:v39];
          id v10 = [v6 fixed64List];
          v37[0] = _NSConcreteStackBlock;
          v37[1] = 3221225472;
          void v37[2] = sub_100016444;
          v37[3] = &unk_10008D430;
          v37[4] = v2;
          v37[5] = v4;
          int v38 = (int)v7;
          [v10 enumerateValuesWithBlock:v37];
          long long v35 = 0u;
          long long v36 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          unint64_t v27 = v6;
          id v11 = [v6 lengthDelimitedList];
          id v12 = [v11 countByEnumeratingWithState:&v33 objects:v48 count:16];
          if (v12)
          {
            id v13 = v12;
            uint64_t v14 = *(void *)v34;
            do
            {
              for (i = 0; i != v13; i = (char *)i + 1)
              {
                if (*(void *)v34 != v14) {
                  objc_enumerationMutation(v11);
                }
                unint64_t v16 = *(void **)(*((void *)&v33 + 1) + 8 * i);
                [(__CFString *)v2 appendFormat:@"%@%d: ", v4, v7];
                sub_100016480(v16, v2);
                [(__CFString *)v2 appendString:@"\n"];
              }
              id v13 = [v11 countByEnumeratingWithState:&v33 objects:v48 count:16];
            }
            while (v13);
          }
          long long v31 = 0u;
          long long v32 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          id v17 = [v27 groupList];
          id v18 = [v17 countByEnumeratingWithState:&v29 objects:v47 count:16];
          if (v18)
          {
            id v19 = v18;
            uint64_t v20 = *(void *)v30;
            do
            {
              for (j = 0; j != v19; j = (char *)j + 1)
              {
                if (*(void *)v30 != v20) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v22 = *(void *)(*((void *)&v29 + 1) + 8 * (void)j);
                [(__CFString *)v2 appendFormat:@"%@%d: {\n", v4, v7];
                [(__CFString *)v2 appendString:sub_100015FD4(v22, [(__CFString *)v4 stringByAppendingString:@"  "])];
                [(__CFString *)v2 appendFormat:@"%@}\n", v4];
              }
              id v19 = [v17 countByEnumeratingWithState:&v29 objects:v47 count:16];
            }
            while (v19);
          }
          uint64_t v5 = v28 + 1;
        }
        while ((id)(v28 + 1) != v26);
        id v26 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
      }
      while (v26);
    }
  }
  return v2;
}

id sub_1000163CC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendFormat:@"%@%d: %llu\n", *(void *)(a1 + 40), *(unsigned int *)(a1 + 48), a2];
}

id sub_100016408(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendFormat:@"%@%d: 0x%X\n", *(void *)(a1 + 40), *(unsigned int *)(a1 + 48), a2];
}

id sub_100016444(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendFormat:@"%@%d: 0x%llX\n", *(void *)(a1 + 40), *(unsigned int *)(a1 + 48), a2];
}

id sub_100016480(void *a1, void *a2)
{
  uint64_t v4 = (char *)[a1 bytes];
  uint64_t v5 = (uint64_t)[a1 length];
  [a2 appendString:@"\""];
  if (v5 >= 1)
  {
    unint64_t v6 = &v4[v5];
    do
    {
      uint64_t v7 = *v4;
      if ((int)v7 > 33)
      {
        switch(v7)
        {
          case '""':
            id v8 = a2;
            CFStringRef v9 = @"\\\"";
            goto LABEL_16;
          case '\'':
            id v8 = a2;
            CFStringRef v9 = @"\\'";
            goto LABEL_16;
          case '\\':
            id v8 = a2;
            CFStringRef v9 = @"\\\\"";
            goto LABEL_16;
        }
      }
      else
      {
        switch(v7)
        {
          case 9:
            id v8 = a2;
            CFStringRef v9 = @"\\t";
            goto LABEL_16;
          case 0xA:
            id v8 = a2;
            CFStringRef v9 = @"\\n";
            goto LABEL_16;
          case 0xD:
            id v8 = a2;
            CFStringRef v9 = @"\\r";
LABEL_16:
            [v8 appendString:v9];
            goto LABEL_17;
        }
      }
      if ((v7 & 0x80000000) != 0)
      {
        if (!__maskrune(*v4, 0x40000uLL))
        {
LABEL_23:
          [a2 appendFormat:@"\\%03o", v7];
          goto LABEL_17;
        }
      }
      else if ((_DefaultRuneLocale.__runetype[v7] & 0x40000) == 0)
      {
        goto LABEL_23;
      }
      [a2 appendFormat:@"%c", v7];
LABEL_17:
      ++v4;
    }
    while (v4 < v6);
  }

  return [a2 appendString:@"\""];
}

NSString *sub_100016638(char *a1, int a2, void *a3)
{
  unint64_t v3 = 0;
  if (a1 && a3)
  {
    unint64_t v23 = a1;
    int v6 = sub_10001681C(&v23);
    if (v6 < 1)
    {
      return 0;
    }
    else
    {
      int v7 = v6;
      while (1)
      {
        int v8 = sub_10001681C(&v23);
        CFStringRef v9 = v23;
        if (v8 == a2) {
          break;
        }
        id v10 = v23 + 1;
        while (*v10++)
          ;
        unint64_t v23 = v10;
        if (v7-- < 2) {
          return 0;
        }
      }
      if (*v23)
      {
        unint64_t v3 = +[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", [a3 length]);
        char v14 = *v9;
        if (*v9)
        {
          uint64_t v15 = 0;
          while (1)
          {
            if (v14 < 0)
            {
              [(NSMutableString *)v3 appendString:@"_"];
              char v14 = *v9;
            }
            int v16 = v14 & 0x1F;
            int v17 = v14 & 0x60;
            if (v17 == 32) {
              break;
            }
            if (v17 == 64)
            {
              uint64_t v18 = __toupper((char)[a3 characterAtIndex:v15]);
LABEL_21:
              [(NSMutableString *)v3 appendFormat:@"%c", v18];
              ++v15;
              --v16;
            }
            if (v16 >= 1)
            {
              uint64_t v19 = v16;
              uint64_t v20 = v15;
              do
              {
                id v21 = [a3 characterAtIndex:v20];
                if (v17 == 96) {
                  [(NSMutableString *)v3 appendFormat:@"%c", __toupper((char)v21)];
                }
                else {
                  [(NSMutableString *)v3 appendFormat:@"%C", v21];
                }
                ++v20;
                --v19;
              }
              while (v19);
            }
            v15 += v16;
            int v22 = *++v9;
            char v14 = v22;
            if (!v22) {
              return (NSString *)v3;
            }
          }
          uint64_t v18 = __tolower((char)[a3 characterAtIndex:v15]);
          goto LABEL_21;
        }
      }
      else
      {
        return +[NSString stringWithUTF8String:v23 + 1];
      }
    }
  }
  return (NSString *)v3;
}

uint64_t sub_10001681C(char **a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = *(*a1)++;
  if ((v2 & 0x80000000) != 0)
  {
    unsigned int v3 = v2 & 0x7F;
    int v4 = v1[1];
    *a1 = v1 + 2;
    int v5 = v4 << 7;
    if ((v4 & 0x80000000) == 0) {
      return v5 | v3;
    }
    v3 |= v5 & 0x3F80;
    int v6 = v1[2];
    *a1 = v1 + 3;
    int v5 = v6 << 14;
    if ((v6 & 0x80000000) == 0) {
      return v5 | v3;
    }
    v3 |= v5 & 0x1FC000;
    int v7 = v1[3];
    *a1 = v1 + 4;
    int v5 = v7 << 21;
    if (v7 < 0)
    {
      int v9 = v1[4];
      *a1 = v1 + 5;
      uint64_t v2 = v5 & 0xFE00000 | (v9 << 28) | v3;
      if (v9 < 0)
      {
        uint64_t v10 = 0;
        while (1)
        {
          int v11 = v1[v10 + 5];
          *a1 = &v1[v10 + 6];
          if ((v11 & 0x80000000) == 0) {
            break;
          }
          if (++v10 == 5)
          {
            +[NSException raise:NSParseErrorException format:@"Unable to read varint32"];
            return v2;
          }
        }
      }
    }
    else
    {
      return v5 | v3;
    }
  }
  return v2;
}

void sub_100016908(uint64_t a1, void *a2, unsigned int a3)
{
}

BOOL sub_100016910(objc_class *a1, const char *a2)
{
  unsigned int outCount = 0;
  unsigned int v3 = class_copyMethodList(a1, &outCount);
  if (outCount)
  {
    for (unint64_t i = 0; i < outCount; ++i)
    {
      SEL Name = method_getName(v3[i]);
      BOOL v6 = Name == a2;
      if (Name == a2) {
        break;
      }
    }
  }
  else
  {
    BOOL v6 = 0;
  }
  free(v3);
  return v6;
}

id sub_100016994(void *a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id result = [a2 countByEnumeratingWithState:&v32 objects:v36 count:16];
  id v28 = result;
  if (result)
  {
    uint64_t v27 = *(void *)v33;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v33 != v27) {
          objc_enumerationMutation(a2);
        }
        uint64_t v30 = v7;
        int v8 = *(void **)(*((void *)&v32 + 1) + 8 * v7);
        id result = [v8 fieldNumber];
        if (result >= a3)
        {
          id v9 = result;
          if (result >= HIDWORD(a3)) {
            return result;
          }
          id v10 = [a1 getExtension:v8];
          unsigned int v11 = [v8 isRepeated];
          if (v11)
          {
            uint64_t v12 = (uint64_t)[v10 count];
            id v13 = [v8 singletonName];
            if (v12 != 1)
            {
              [a4 appendFormat:@"%@# [%@]\n", a5, v13];
              unsigned int v14 = [v8 dataType];
              if (!v12) {
                goto LABEL_7;
              }
              unsigned int v15 = v14;
              CFStringRef v16 = &stru_10008F418;
              goto LABEL_16;
            }
          }
          else
          {
            id v13 = [v8 singletonName];
          }
          CFStringRef v16 = +[NSString stringWithFormat:@"  # [%@]", v13];
          unsigned int v15 = [v8 dataType];
          uint64_t v12 = 1;
LABEL_16:
          uint64_t v17 = 0;
          if (v15 - 15 >= 2) {
            uint64_t v18 = ":";
          }
          else {
            uint64_t v18 = "";
          }
          do
          {
            id v19 = v10;
            if (v11) {
              id v19 = [v10 objectAtIndex:v17];
            }
            [a4 appendFormat:@"%@%u%s ", a5, v9, v18];
            switch(v15)
            {
              case 0u:
                if ([v19 BOOLValue]) {
                  CFStringRef v22 = @"true";
                }
                else {
                  CFStringRef v22 = @"false";
                }
                [a4 appendString:v22];
                break;
              case 1u:
              case 0xBu:
                [a4 appendFormat:@"%u", [v19 unsignedIntValue], v24];
                break;
              case 2u:
                id v20 = [v19 unsignedIntValue];
                goto LABEL_34;
              case 3u:
                [v19 floatValue];
                [a4 appendFormat:@"%.*g", 6, v21];
                break;
              case 4u:
              case 0xCu:
                [a4 appendFormat:@"%llu", [v19 unsignedLongLongValue], v24];
                break;
              case 5u:
              case 8u:
              case 0xAu:
                [a4 appendFormat:@"%lld", [v19 longLongValue], v24];
                break;
              case 6u:
                [v19 doubleValue];
                [a4 appendFormat:@"%.*lg", 15, v23];
                break;
              case 7u:
              case 9u:
              case 0x11u:
                id v20 = [v19 intValue];
LABEL_34:
                [a4 appendFormat:@"%d", v20, v24];
                break;
              case 0xDu:
                sub_100016480(v19, a4);
                break;
              case 0xEu:
                sub_100016DDC(v19, a4);
                break;
              case 0xFu:
              case 0x10u:
                [a4 appendFormat:@"{%@\n", v16];
                sub_100015680(v19, a4, [a5 stringByAppendingString:@"  "]);
                [a4 appendFormat:@"%@}", a5];
                CFStringRef v16 = &stru_10008F418;
                break;
              default:
                break;
            }
            [a4 appendFormat:@"%@\n", v16];
            ++v17;
          }
          while (v12 != v17);
        }
LABEL_7:
        uint64_t v7 = v30 + 1;
      }
      while ((id)(v30 + 1) != v28);
      id result = [a2 countByEnumeratingWithState:&v32 objects:v36 count:16];
      id v28 = result;
    }
    while (result);
  }
  return result;
}

id sub_100016DDC(void *a1, void *a2)
{
  [a2 appendString:@"\""];
  int v4 = (char *)[a1 length];
  if (v4)
  {
    int v5 = v4;
    for (unint64_t i = 0; v5 != i; ++i)
    {
      id v7 = [a1 characterAtIndex:i];
      if ((int)v7 > 33)
      {
        switch(v7)
        {
          case '""':
            int v8 = a2;
            CFStringRef v9 = @"\\\"";
            break;
          case '\'':
            int v8 = a2;
            CFStringRef v9 = @"\\'";
            break;
          case '\\':
            int v8 = a2;
            CFStringRef v9 = @"\\\\"";
            break;
          default:
LABEL_19:
            if (v7 > 0x1F) {
              [a2 appendFormat:@"%C", v7, v11, v12];
            }
            else {
              [a2 appendFormat:@"\\%d%d%d", 0, v7 >> 3, v7 & 7];
            }
            continue;
        }
      }
      else
      {
        switch(v7)
        {
          case 9:
            int v8 = a2;
            CFStringRef v9 = @"\\t";
            break;
          case 0xA:
            int v8 = a2;
            CFStringRef v9 = @"\\n";
            break;
          case 0xD:
            int v8 = a2;
            CFStringRef v9 = @"\\r";
            break;
          default:
            goto LABEL_19;
        }
      }
      [v8 appendString:v9];
    }
  }

  return [a2 appendString:@"\""];
}

id sub_100016F74(uint64_t a1, void *a2, void *a3)
{
  BOOL v6 = *(void **)(a1 + 32);
  uint64_t v7 = 40;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)) {
    uint64_t v7 = 48;
  }
  [v6 appendString:*(void *)(a1 + v7)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
  [*(id *)(a1 + 32) appendString:*(void *)(a1 + 56)];
  sub_100016DDC(a2, *(void **)(a1 + 32));
  [*(id *)(a1 + 32) appendString:@"\n"];
  [*(id *)(a1 + 32) appendString:*(void *)(a1 + 64)];
  int v8 = *(unsigned __int8 *)(a1 + 96);
  switch(v8)
  {
    case 13:
      sub_100016480(a3, *(void **)(a1 + 32));
      break;
    case 15:
      [*(id *)(a1 + 32) appendString:@"{\n"];
      sub_100015680(a3, *(void *)(a1 + 32), [*(id *)(a1 + 72) stringByAppendingString:@"    "]);
      [*(id *)(a1 + 32) appendFormat:@"%@  }", *(void *)(a1 + 72)];
      break;
    case 14:
      sub_100016DDC(a3, *(void **)(a1 + 32));
      break;
  }
  [*(id *)(a1 + 32) appendString:@"\n"];
  CFStringRef v9 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 80);

  return [v9 appendString:v10];
}

id sub_1000170C0(uint64_t a1, void *a2, void *a3)
{
  BOOL v6 = *(void **)(a1 + 32);
  uint64_t v7 = 40;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)) {
    uint64_t v7 = 48;
  }
  [v6 appendString:*(void *)(a1 + v7)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 0;
  int v8 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 104) == 14)
  {
    [v8 appendString:*(void *)(a1 + 56)];
    sub_100016DDC(a2, *(void **)(a1 + 32));
    [*(id *)(a1 + 32) appendString:@"\n"];
  }
  else
  {
    [v8 appendFormat:@"%@%@\n", *(void *)(a1 + 56), a2];
  }
  [*(id *)(a1 + 32) appendString:*(void *)(a1 + 64)];
  switch(*(unsigned char *)(a1 + 105))
  {
    case 0xD:
      sub_100016480(a3, *(void **)(a1 + 32));
      break;
    case 0xE:
      sub_100016DDC(a3, *(void **)(a1 + 32));
      break;
    case 0xF:
      [*(id *)(a1 + 32) appendString:@"{\n"];
      sub_100015680(a3, *(void *)(a1 + 32), [*(id *)(a1 + 72) stringByAppendingString:@"    "]);
      [*(id *)(a1 + 32) appendFormat:@"%@  }", *(void *)(a1 + 72)];
      break;
    case 0x11:
      id v11 = [a3 intValue];
      id v12 = [*(id *)(a1 + 80) enumDescriptor];
      if (v12)
      {
        id v13 = [v12 textFormatNameForValue:v11];
        if (v13)
        {
          id v10 = v13;
          CFStringRef v9 = *(void **)(a1 + 32);
          goto LABEL_14;
        }
      }
      [*(id *)(a1 + 32) appendFormat:@"%d", v11];
      break;
    default:
      CFStringRef v9 = *(void **)(a1 + 32);
      id v10 = a3;
LABEL_14:
      [v9 appendString:v10];
      break;
  }
  [*(id *)(a1 + 32) appendString:@"\n"];
  unsigned int v14 = *(void **)(a1 + 32);
  uint64_t v15 = *(void *)(a1 + 88);

  return [v14 appendString:v15];
}

unint64_t SASIDSProtocolNumbers_EnumDescriptor()
{
  if (!atomic_load((unint64_t *)&qword_1000A74C8))
  {
    id v1 = +[TransparencyGPBEnumDescriptor allocDescriptorForName:@"SASIDSProtocolNumbers" valueNames:"Announce" values:&unk_100085384 count:8 enumVerifier:SASIDSProtocolNumbers_IsValidValue extraTextFormatInfo:&unk_1000853A4];
    uint64_t v2 = 0;
    atomic_compare_exchange_strong(&qword_1000A74C8, (unint64_t *)&v2, (unint64_t)v1);
    if (v2) {
  }
    }
  return atomic_load((unint64_t *)&qword_1000A74C8);
}

BOOL SASIDSProtocolNumbers_IsValidValue(unsigned int a1)
{
  return a1 < 8;
}

unint64_t SASTeardownReason_EnumDescriptor()
{
  if (!atomic_load((unint64_t *)&qword_1000A74D0))
  {
    id v1 = +[TransparencyGPBEnumDescriptor allocDescriptorForName:@"SASTeardownReason" valueNames:"NewerSession" values:&unk_1000853CC count:1 enumVerifier:SASTeardownReason_IsValidValue extraTextFormatInfo:&unk_1000853D0];
    uint64_t v2 = 0;
    atomic_compare_exchange_strong(&qword_1000A74D0, (unint64_t *)&v2, (unint64_t)v1);
    if (v2) {
  }
    }
  return atomic_load((unint64_t *)&qword_1000A74D0);
}

BOOL SASTeardownReason_IsValidValue(int a1)
{
  return a1 == 0;
}

unint64_t SASProtocol_EnumDescriptor()
{
  if (!atomic_load((unint64_t *)&qword_1000A74D8))
  {
    id v1 = +[TransparencyGPBEnumDescriptor allocDescriptorForName:@"SASProtocol" valueNames:"HmacSha256Version1" values:&unk_1000853FC count:2 enumVerifier:SASProtocol_IsValidValue extraTextFormatInfo:&unk_100085450];
    uint64_t v2 = 0;
    atomic_compare_exchange_strong(&qword_1000A74D8, (unint64_t *)&v2, (unint64_t)v1);
    if (v2) {
  }
    }
  return atomic_load((unint64_t *)&qword_1000A74D8);
}

BOOL SASProtocol_IsValidValue(unsigned int a1)
{
  return a1 < 2;
}

TransparencyGPBFileDescriptor *sub_10001756C()
{
  id result = (TransparencyGPBFileDescriptor *)qword_1000A7518;
  if (!qword_1000A7518)
  {
    id result = [[TransparencyGPBFileDescriptor alloc] initWithPackage:&stru_10008F418 syntax:3];
    qword_1000A7518 = (uint64_t)result;
  }
  return result;
}

uint64_t SASTeardown_Reason_RawValue(uint64_t a1)
{
  id v2 = [[+[SASTeardown descriptor](SASTeardown, "descriptor") fieldWithNumber:2];

  return sub_100014E70(a1, v2);
}

id SetSASTeardown_Reason_RawValue(void *a1, int a2)
{
  id v4 = [[+[SASTeardown descriptor](SASTeardown, "descriptor") fieldWithNumber:2];

  return sub_100014E74(a1, (uint64_t)v4, a2);
}

void sub_100017A9C(uint64_t a1, void *a2, void *a3)
{
  id v4 = [a2 copy];
  [a3 addField:v4];
}

int sub_100017DD4(id a1, const void *a2, const void *a3)
{
  if (*(void *)a2 == *(void *)a3) {
    int v3 = 0;
  }
  else {
    int v3 = -1;
  }
  if (*(void *)a2 > *(void *)a3) {
    return 1;
  }
  else {
    return v3;
  }
}

int sub_100017F48(id a1, const void *a2, const void *a3)
{
  if (*(void *)a2 == *(void *)a3) {
    int v3 = 0;
  }
  else {
    int v3 = -1;
  }
  if (*(void *)a2 > *(void *)a3) {
    return 1;
  }
  else {
    return v3;
  }
}

id sub_100018020(uint64_t a1, void *a2, void *a3)
{
  id result = [a2 serializedSize];
  *a3 += result;
  return result;
}

id sub_100018074(uint64_t a1, void *a2)
{
  return [_objc_msgSend(a2, "writeAsMessageSetExtensionToOutput:");
}

id sub_1000180C0(uint64_t a1, void *a2, void *a3)
{
  id result = [a2 serializedSizeAsMessageSetExtension];
  *a3 += result;
  return result;
}

void sub_1000182D8(uint64_t a1, void *a2, void *a3)
{
  id v5 = [a2 number];
  if (!v5) {
    +[NSException raise:NSInvalidArgumentException format:@"Zero is not a valid field number."];
  }
  id v6 = [a3 mutableFieldForNumber:v5 create:0];
  if (v6)
  {
    _[v6 mergeFromField:a2];
  }
  else
  {
    id v7 = [a2 copy];
    [a3 addField:v7];
  }
}

void sub_1000187C4(id a1)
{
  xpc_transaction_exit_clean();

  xpc_transaction_try_exit_clean();
}

id sub_100018B98(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Received signal SIGTERM. Will terminate when clean.", v3, 2u);
  }
  return [*(id *)(a1 + 32) signalEventHander];
}

uint64_t sub_100018D30(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

unint64_t sub_100018DFC()
{
  if (!atomic_load((unint64_t *)&qword_1000A7548))
  {
    id v1 = +[TransparencyGPBEnumDescriptor allocDescriptorForName:@"TransparencyGPBSyntax" valueNames:"SyntaxProto2" values:&unk_10008548C count:2 enumVerifier:sub_100018E7C flags:0];
    uint64_t v2 = 0;
    atomic_compare_exchange_strong(&qword_1000A7548, (unint64_t *)&v2, (unint64_t)v1);
    if (v2) {
  }
    }
  return atomic_load((unint64_t *)&qword_1000A7548);
}

BOOL sub_100018E7C(unsigned int a1)
{
  return a1 < 2;
}

unint64_t sub_100018E88()
{
  if (!atomic_load((unint64_t *)&qword_1000A7550))
  {
    id v1 = +[TransparencyGPBEnumDescriptor allocDescriptorForName:@"TransparencyGPBField_Kind" valueNames:"TypeUnknown" values:&unk_100085568 count:19 enumVerifier:sub_100018F08 flags:0];
    uint64_t v2 = 0;
    atomic_compare_exchange_strong(&qword_1000A7550, (unint64_t *)&v2, (unint64_t)v1);
    if (v2) {
  }
    }
  return atomic_load((unint64_t *)&qword_1000A7550);
}

BOOL sub_100018F08(unsigned int a1)
{
  return a1 < 0x13;
}

unint64_t sub_100018F14()
{
  if (!atomic_load((unint64_t *)&qword_1000A7558))
  {
    id v1 = +[TransparencyGPBEnumDescriptor allocDescriptorForName:@"TransparencyGPBField_Cardinality" valueNames:"CardinalityUnknown" values:&unk_100085604 count:4 enumVerifier:sub_100018F94 flags:0];
    uint64_t v2 = 0;
    atomic_compare_exchange_strong(&qword_1000A7558, (unint64_t *)&v2, (unint64_t)v1);
    if (v2) {
  }
    }
  return atomic_load((unint64_t *)&qword_1000A7558);
}

BOOL sub_100018F94(unsigned int a1)
{
  return a1 < 4;
}

uint64_t sub_100019010(uint64_t a1)
{
  id v2 = [[+[TransparencyGPBType descriptor](TransparencyGPBType) fieldWithNumber:6];

  return sub_100014E70(a1, v2);
}

id sub_10001905C(void *a1, int a2)
{
  id v4 = [[+[TransparencyGPBType descriptor](TransparencyGPBType) fieldWithNumber:6];

  return sub_100014E74(a1, (uint64_t)v4, a2);
}

uint64_t sub_100019134(uint64_t a1)
{
  id v2 = [[+[TransparencyGPBField descriptor](TransparencyGPBField) fieldWithNumber:1];

  return sub_100014E70(a1, v2);
}

id sub_100019180(void *a1, int a2)
{
  id v4 = [[+[TransparencyGPBField descriptor](TransparencyGPBField) fieldWithNumber:1];

  return sub_100014E74(a1, (uint64_t)v4, a2);
}

uint64_t sub_1000191D4(uint64_t a1)
{
  id v2 = [[+[TransparencyGPBField descriptor](TransparencyGPBField) fieldWithNumber:2];

  return sub_100014E70(a1, v2);
}

id sub_100019220(void *a1, int a2)
{
  id v4 = [[+[TransparencyGPBField descriptor](TransparencyGPBField) fieldWithNumber:2];

  return sub_100014E74(a1, (uint64_t)v4, a2);
}

uint64_t sub_1000192E4(uint64_t a1)
{
  id v2 = [[+[TransparencyGPBEnum descriptor](TransparencyGPBEnum) fieldWithNumber:5];

  return sub_100014E70(a1, v2);
}

id sub_100019330(void *a1, int a2)
{
  id v4 = [[+[TransparencyGPBEnum descriptor](TransparencyGPBEnum) fieldWithNumber:5];

  return sub_100014E74(a1, (uint64_t)v4, a2);
}

id sub_100019990(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onqueueSetFlag:*(void *)(a1 + 40)];
}

uint64_t sub_100019BCC(uint64_t a1, uint64_t a2)
{
  return a2;
}

CFStringRef sub_100019BD8(char *cStr)
{
  return CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x8000100u);
}

BOOL sub_100019BF4(const char *a1, const char *a2)
{
  return strcmp(a1, a2) == 0;
}

uint64_t sub_100019C14(unsigned char *a1)
{
  LOBYTE(v1) = *a1;
  if (*a1)
  {
    unsigned int v2 = 0;
    unsigned int v3 = 1;
    do
    {
      unsigned int v2 = (1025 * (v2 + (char)v1)) ^ ((1025 * (v2 + (char)v1)) >> 6);
      int v1 = a1[v3++];
    }
    while (v1);
    unsigned int v4 = 9 * v2;
  }
  else
  {
    unsigned int v4 = 0;
  }
  return 32769 * (v4 ^ (v4 >> 11));
}

uint64_t sub_100019CCC(objc_class *a1, const char *a2)
{
  uint64_t result = (uint64_t)sub_100019DAC(a1, a2);
  if (result)
  {
    uint64_t v5 = result;
    id v6 = sub_1000155DC("getClassValue", 0);
    SEL Name = class_getName(a1);
    MetaClass = objc_getMetaClass(Name);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100019F00;
    block[3] = &unk_10008D5A8;
    block[4] = v5;
    CFStringRef v9 = imp_implementationWithBlock(block);
    return class_addMethod(MetaClass, a2, v9, v6) || sub_100016910(MetaClass, a2);
  }
  return result;
}

const void *sub_100019DAC(objc_class *a1, SEL sel)
{
  SEL Name = sel_getName(sel);
  int v4 = *(unsigned __int8 *)Name;
  if (v4 != 95)
  {
    id v6 = Name;
    uint64_t v7 = 1;
    if (!*Name)
    {
LABEL_6:
      int v8 = class_getName(a1);
      size_t v9 = strlen(v8);
      __chkstk_darwin();
      id v11 = (char *)&v14 - v10;
      bzero((char *)&v14 - v10, v12);
      memcpy(v11, v8, v9);
      v11[v9] = 95;
      memcpy(&v11[v9 + 1], v6, v7 - 1);
      v11[v9 + v7] = 0;
      os_unfair_lock_lock((os_unfair_lock_t)&unk_1000A7598);
      Value = CFDictionaryGetValue((CFDictionaryRef)qword_1000A7588, v11);
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000A7598);
      return Value;
    }
    while (v4 != 58)
    {
      int v4 = Name[v7++];
      if (!v4) {
        goto LABEL_6;
      }
    }
  }
  return 0;
}

uint64_t sub_100019F00(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

uint64_t sub_100019FD8(uint64_t a1)
{
  id v2 = [[+[TransparencyGPBApi descriptor](TransparencyGPBApi) fieldWithNumber:7];

  return sub_100014E70(a1, v2);
}

id sub_10001A024(void *a1, int a2)
{
  id v4 = [[+[TransparencyGPBApi descriptor](TransparencyGPBApi) fieldWithNumber:7];

  return sub_100014E74(a1, (uint64_t)v4, a2);
}

uint64_t sub_10001A0FC(uint64_t a1)
{
  id v2 = [[+[TransparencyGPBMethod descriptor](TransparencyGPBMethod) fieldWithNumber:7];

  return sub_100014E70(a1, v2);
}

id sub_10001A148(void *a1, int a2)
{
  id v4 = [[+[TransparencyGPBMethod descriptor](TransparencyGPBMethod) fieldWithNumber:7];

  return sub_100014E74(a1, (uint64_t)v4, a2);
}

uint64_t *sub_10001A40C(uint64_t *result, uint64_t a2)
{
  unsigned int v3 = result;
  uint64_t v4 = result[2];
  if (v4 == result[1])
  {
    uint64_t result = sub_10001D4B4(result);
    uint64_t v4 = v3[2];
  }
  uint64_t v5 = *v3;
  v3[2] = v4 + 1;
  *(unsigned char *)(v5 + v4) = a2;
  uint64_t v6 = v3[2];
  if (v6 == v3[1])
  {
    uint64_t result = sub_10001D4B4(v3);
    uint64_t v6 = v3[2];
  }
  uint64_t v7 = *v3;
  v3[2] = v6 + 1;
  *(unsigned char *)(v7 + v6) = BYTE1(a2);
  uint64_t v8 = v3[2];
  if (v8 == v3[1])
  {
    uint64_t result = sub_10001D4B4(v3);
    uint64_t v8 = v3[2];
  }
  uint64_t v9 = *v3;
  v3[2] = v8 + 1;
  *(unsigned char *)(v9 + v8) = BYTE2(a2);
  uint64_t v10 = v3[2];
  if (v10 == v3[1])
  {
    uint64_t result = sub_10001D4B4(v3);
    uint64_t v10 = v3[2];
  }
  uint64_t v11 = *v3;
  v3[2] = v10 + 1;
  *(unsigned char *)(v11 + v10) = BYTE3(a2);
  uint64_t v12 = v3[2];
  if (v12 == v3[1])
  {
    uint64_t result = sub_10001D4B4(v3);
    uint64_t v12 = v3[2];
  }
  uint64_t v13 = *v3;
  v3[2] = v12 + 1;
  *(unsigned char *)(v13 + v12) = BYTE4(a2);
  uint64_t v14 = v3[2];
  if (v14 == v3[1])
  {
    uint64_t result = sub_10001D4B4(v3);
    uint64_t v14 = v3[2];
  }
  uint64_t v15 = *v3;
  v3[2] = v14 + 1;
  *(unsigned char *)(v15 + v14) = BYTE5(a2);
  uint64_t v16 = v3[2];
  if (v16 == v3[1])
  {
    uint64_t result = sub_10001D4B4(v3);
    uint64_t v16 = v3[2];
  }
  uint64_t v17 = *v3;
  v3[2] = v16 + 1;
  *(unsigned char *)(v17 + v16) = BYTE6(a2);
  uint64_t v18 = v3[2];
  if (v18 == v3[1])
  {
    uint64_t result = sub_10001D4B4(v3);
    uint64_t v18 = v3[2];
  }
  uint64_t v19 = *v3;
  v3[2] = v18 + 1;
  *(unsigned char *)(v19 + v18) = HIBYTE(a2);
  return result;
}

uint64_t *sub_10001A5F4(uint64_t *result, int a2)
{
  unsigned int v3 = result;
  uint64_t v4 = result[2];
  if (v4 == result[1])
  {
    uint64_t result = sub_10001D4B4(result);
    uint64_t v4 = v3[2];
  }
  uint64_t v5 = *v3;
  v3[2] = v4 + 1;
  *(unsigned char *)(v5 + v4) = a2;
  uint64_t v6 = v3[2];
  if (v6 == v3[1])
  {
    uint64_t result = sub_10001D4B4(v3);
    uint64_t v6 = v3[2];
  }
  uint64_t v7 = *v3;
  v3[2] = v6 + 1;
  *(unsigned char *)(v7 + v6) = BYTE1(a2);
  uint64_t v8 = v3[2];
  if (v8 == v3[1])
  {
    uint64_t result = sub_10001D4B4(v3);
    uint64_t v8 = v3[2];
  }
  uint64_t v9 = *v3;
  v3[2] = v8 + 1;
  *(unsigned char *)(v9 + v8) = BYTE2(a2);
  uint64_t v10 = v3[2];
  if (v10 == v3[1])
  {
    uint64_t result = sub_10001D4B4(v3);
    uint64_t v10 = v3[2];
  }
  uint64_t v11 = *v3;
  v3[2] = v10 + 1;
  *(unsigned char *)(v11 + v10) = HIBYTE(a2);
  return result;
}

uint64_t *sub_10001A72C(uint64_t *result, unint64_t a2)
{
  unint64_t v2 = a2;
  unsigned int v3 = result;
  if (a2 >= 0x80)
  {
    do
    {
      uint64_t v5 = v3[2];
      if (v5 == v3[1])
      {
        uint64_t result = sub_10001D4B4(v3);
        uint64_t v5 = v3[2];
      }
      uint64_t v6 = *v3;
      v3[2] = v5 + 1;
      *(unsigned char *)(v6 + v5) = v2 | 0x80;
      unint64_t v4 = v2 >> 7;
      BOOL v7 = v2 >= 0x4000;
      v2 >>= 7;
    }
    while (v7);
  }
  else
  {
    LOBYTE(v4) = a2;
  }
  uint64_t v8 = v3[2];
  if (v8 == v3[1])
  {
    uint64_t result = sub_10001D4B4(v3);
    uint64_t v8 = v3[2];
  }
  uint64_t v9 = *v3;
  v3[2] = v8 + 1;
  *(unsigned char *)(v9 + v8) = v4;
  return result;
}

uint64_t *sub_10001A88C(uint64_t *result, unsigned int a2)
{
  if ((a2 & 0x80000000) != 0) {
    return sub_10001A72C(result, (int)a2);
  }
  else {
    return sub_10001ABC8(result, a2);
  }
}

uint64_t *sub_10001ABC8(uint64_t *result, unsigned int a2)
{
  unsigned int v2 = a2;
  unsigned int v3 = result;
  if (a2 >= 0x80)
  {
    do
    {
      uint64_t v5 = v3[2];
      if (v5 == v3[1])
      {
        uint64_t result = sub_10001D4B4(v3);
        uint64_t v5 = v3[2];
      }
      uint64_t v6 = *v3;
      v3[2] = v5 + 1;
      *(unsigned char *)(v6 + v5) = v2 | 0x80;
      unsigned int v4 = v2 >> 7;
      BOOL v7 = v2 >= 0x4000;
      v2 >>= 7;
    }
    while (v7);
  }
  else
  {
    LOBYTE(v4) = a2;
  }
  uint64_t v8 = v3[2];
  if (v8 == v3[1])
  {
    uint64_t result = sub_10001D4B4(v3);
    uint64_t v8 = v3[2];
  }
  uint64_t v9 = *v3;
  v3[2] = v8 + 1;
  *(unsigned char *)(v9 + v8) = v4;
  return result;
}

uint64_t *sub_10001AFDC(uint64_t *a1, int a2, unsigned int a3)
{
  unsigned int v5 = sub_100027BFC(a2, 0);
  sub_10001ABC8(a1, v5);

  return sub_10001ABC8(a1, a3);
}

void sub_10001B3B0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001B3C8(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += 8;
  return result;
}

uint64_t sub_10001B3E0()
{
  return 8;
}

id sub_10001B3E8(uint64_t a1)
{
  return [*(id *)(a1 + 32) writeDoubleNoTag:];
}

id sub_10001B3F0(uint64_t a1)
{
  return [*(id *)(a1 + 32) writeDouble:*(unsigned int *)(a1 + 40)];
}

void sub_10001B590(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001B5A8(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += 4;
  return result;
}

uint64_t sub_10001B5C0()
{
  return 4;
}

id sub_10001B5C8(uint64_t a1)
{
  return [*(id *)(a1 + 32) writeFloatNoTag:];
}

id sub_10001B5D0(uint64_t a1)
{
  return [*(id *)(a1 + 32) writeFloat:*(unsigned int *)(a1 + 40)];
}

void sub_10001B770(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001B788(uint64_t a1, unint64_t a2)
{
  uint64_t result = sub_10001D778(a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

id sub_10001B7C8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeUInt64NoTag:a2];
}

id sub_10001B7D4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeUInt64:*(unsigned int *)(a1 + 40) value:a2];
}

void sub_10001B978(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001B990(uint64_t a1, unint64_t a2)
{
  uint64_t result = sub_10001D778(a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

id sub_10001B9CC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeInt64NoTag:a2];
}

id sub_10001B9D8(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) writeInt64:*(unsigned int *)(a1 + 40) value:a2];
}

void sub_10001BB7C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001BB94(uint64_t result, unsigned int a2)
{
  uint64_t v2 = 10;
  uint64_t v3 = 1;
  uint64_t v4 = 2;
  uint64_t v5 = 3;
  uint64_t v6 = 4;
  if (a2 >> 28) {
    uint64_t v6 = 5;
  }
  if (a2 >= 0x200000) {
    uint64_t v5 = v6;
  }
  if (a2 >= 0x4000) {
    uint64_t v4 = v5;
  }
  if (a2 >= 0x80) {
    uint64_t v3 = v4;
  }
  if ((a2 & 0x80000000) == 0) {
    uint64_t v2 = v3;
  }
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += v2;
  return result;
}

uint64_t sub_10001BBEC(unsigned int a1)
{
  uint64_t v1 = 1;
  uint64_t v2 = 2;
  uint64_t v3 = 3;
  uint64_t v4 = 4;
  if (a1 >> 28) {
    uint64_t v4 = 5;
  }
  if (a1 >= 0x200000) {
    uint64_t v3 = v4;
  }
  if (a1 >= 0x4000) {
    uint64_t v2 = v3;
  }
  if (a1 >= 0x80) {
    uint64_t v1 = v2;
  }
  if ((a1 & 0x80000000) == 0) {
    return v1;
  }
  else {
    return 10;
  }
}

id sub_10001BC30(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeInt32NoTag:a2];
}

id sub_10001BC3C(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) writeInt32:*(unsigned int *)(a1 + 40) value:a2];
}

void sub_10001BDE0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001BDF8(uint64_t result, unsigned int a2)
{
  uint64_t v2 = 1;
  uint64_t v3 = 2;
  uint64_t v4 = 3;
  uint64_t v5 = 4;
  if (a2 >> 28) {
    uint64_t v5 = 5;
  }
  if (a2 >= 0x200000) {
    uint64_t v4 = v5;
  }
  if (a2 >= 0x4000) {
    uint64_t v3 = v4;
  }
  if (a2 >= 0x80) {
    uint64_t v2 = v3;
  }
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += v2;
  return result;
}

uint64_t sub_10001BE44(unsigned int a1)
{
  uint64_t v1 = 2;
  uint64_t v2 = 3;
  uint64_t v3 = 4;
  if (a1 >> 28) {
    uint64_t v3 = 5;
  }
  if (a1 >= 0x200000) {
    uint64_t v2 = v3;
  }
  if (a1 >= 0x4000) {
    uint64_t v1 = v2;
  }
  if (a1 >= 0x80) {
    return v1;
  }
  else {
    return 1;
  }
}

id sub_10001BE7C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeUInt32NoTag:a2];
}

id sub_10001BE88(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeUInt32:*(unsigned int *)(a1 + 40) value:a2];
}

void sub_10001C02C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001C044(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += 8;
  return result;
}

id sub_10001C05C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeFixed64NoTag:a2];
}

id sub_10001C068(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeFixed64:*(unsigned int *)(a1 + 40) value:a2];
}

void sub_10001C20C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001C224(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += 4;
  return result;
}

id sub_10001C23C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeFixed32NoTag:a2];
}

id sub_10001C248(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeFixed32:*(unsigned int *)(a1 + 40) value:a2];
}

void sub_10001C3EC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001C404(uint64_t result, int a2)
{
  unsigned int v2 = (2 * a2) ^ (a2 >> 31);
  uint64_t v3 = 2;
  uint64_t v4 = 3;
  uint64_t v5 = 4;
  if (v2 >> 28) {
    uint64_t v5 = 5;
  }
  if (v2 >= 0x200000) {
    uint64_t v4 = v5;
  }
  if (v2 >= 0x4000) {
    uint64_t v3 = v4;
  }
  if (v2 >= 0x80) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 1;
  }
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += v6;
  return result;
}

uint64_t sub_10001C458(int a1)
{
  unsigned int v1 = (2 * a1) ^ (a1 >> 31);
  uint64_t v2 = 2;
  uint64_t v3 = 3;
  uint64_t v4 = 4;
  if (v1 >> 28) {
    uint64_t v4 = 5;
  }
  if (v1 >= 0x200000) {
    uint64_t v3 = v4;
  }
  if (v1 >= 0x4000) {
    uint64_t v2 = v3;
  }
  if (v1 >= 0x80) {
    return v2;
  }
  else {
    return 1;
  }
}

id sub_10001C498(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeSInt32NoTag:a2];
}

id sub_10001C4A4(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) writeSInt32:*(unsigned int *)(a1 + 40) value:a2];
}

void sub_10001C648(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001C660(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_10001D778((2 * a2) ^ (a2 >> 63));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_10001C6A0(uint64_t a1)
{
  return sub_10001D778((2 * a1) ^ (a1 >> 63));
}

id sub_10001C6AC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeSInt64NoTag:a2];
}

id sub_10001C6B8(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) writeSInt64:*(unsigned int *)(a1 + 40) value:a2];
}

void sub_10001C85C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001C874(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += 8;
  return result;
}

id sub_10001C88C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeSFixed64NoTag:a2];
}

id sub_10001C898(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) writeSFixed64:*(unsigned int *)(a1 + 40) value:a2];
}

void sub_10001CA3C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001CA54(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += 4;
  return result;
}

id sub_10001CA6C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeSFixed32NoTag:a2];
}

id sub_10001CA78(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) writeSFixed32:*(unsigned int *)(a1 + 40) value:a2];
}

void sub_10001CC1C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001CC34(uint64_t result)
{
  return result;
}

uint64_t sub_10001CC4C()
{
  return 1;
}

id sub_10001CC54(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeBoolNoTag:a2];
}

id sub_10001CC60(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeBool:*(unsigned int *)(a1 + 40) value:a2];
}

void sub_10001CE04(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001CE1C(uint64_t result, unsigned int a2)
{
  uint64_t v2 = 10;
  uint64_t v3 = 1;
  uint64_t v4 = 2;
  uint64_t v5 = 3;
  uint64_t v6 = 4;
  if (a2 >> 28) {
    uint64_t v6 = 5;
  }
  if (a2 >= 0x200000) {
    uint64_t v5 = v6;
  }
  if (a2 >= 0x4000) {
    uint64_t v4 = v5;
  }
  if (a2 >= 0x80) {
    uint64_t v3 = v4;
  }
  if ((a2 & 0x80000000) == 0) {
    uint64_t v2 = v3;
  }
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += v2;
  return result;
}

id sub_10001CE74(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeEnumNoTag:a2];
}

id sub_10001CE80(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeEnum:*(unsigned int *)(a1 + 40) value:a2];
}

void *sub_10001D4B4(void *result)
{
  uint64_t v1 = result;
  if (!result[3]) {
    uint64_t result = +[NSException raise:@"OutOfSpace" format:&stru_10008F418];
  }
  if (v1[2])
  {
    uint64_t result = [v1[3] write:*v1];
    if (result != (void *)v1[2]) {
      uint64_t result = +[NSException raise:@"WriteFailed" format:&stru_10008F418];
    }
    v1[2] = 0;
  }
  return result;
}

uint64_t sub_10001D778(unint64_t a1)
{
  if (a1 < 0x80) {
    return 1;
  }
  if (a1 < 0x4000) {
    return 2;
  }
  if (a1 < 0x200000) {
    return 3;
  }
  if (!(a1 >> 28)) {
    return 4;
  }
  if (!(a1 >> 35)) {
    return 5;
  }
  if (!(a1 >> 42)) {
    return 6;
  }
  if (!(a1 >> 49)) {
    return 7;
  }
  uint64_t v2 = 9;
  if ((a1 & 0x8000000000000000) != 0) {
    uint64_t v2 = 10;
  }
  if (HIBYTE(a1)) {
    return v2;
  }
  else {
    return 8;
  }
}

char *sub_10001D808(void *a1)
{
  uint64_t v1 = (char *)[a1 lengthOfBytesUsingEncoding:4];
  uint64_t v2 = 1;
  uint64_t v3 = 2;
  uint64_t v4 = 3;
  uint64_t v5 = 4;
  if (v1 >> 28) {
    uint64_t v5 = 5;
  }
  if (v1 >= 0x200000) {
    uint64_t v4 = v5;
  }
  if (v1 >= 0x4000) {
    uint64_t v3 = v4;
  }
  if (v1 >= 0x80) {
    uint64_t v2 = v3;
  }
  return &v1[v2];
}

char *sub_10001D860(void *a1)
{
  uint64_t v1 = (char *)[a1 serializedSize];
  uint64_t v2 = 1;
  uint64_t v3 = 2;
  uint64_t v4 = 3;
  uint64_t v5 = 4;
  if (v1 >> 28) {
    uint64_t v5 = 5;
  }
  if (v1 >= 0x200000) {
    uint64_t v4 = v5;
  }
  if (v1 >= 0x4000) {
    uint64_t v3 = v4;
  }
  if (v1 >= 0x80) {
    uint64_t v2 = v3;
  }
  return &v1[v2];
}

char *sub_10001D8B0(void *a1)
{
  uint64_t v1 = (char *)[a1 length];
  uint64_t v2 = 1;
  uint64_t v3 = 2;
  uint64_t v4 = 3;
  uint64_t v5 = 4;
  if (v1 >> 28) {
    uint64_t v5 = 5;
  }
  if (v1 >= 0x200000) {
    uint64_t v4 = v5;
  }
  if (v1 >= 0x4000) {
    uint64_t v3 = v4;
  }
  if (v1 >= 0x80) {
    uint64_t v2 = v3;
  }
  return &v1[v2];
}

uint64_t sub_10001D900(int a1)
{
  unsigned int v1 = sub_100027BFC(a1, 0);
  uint64_t v2 = 10;
  uint64_t v3 = 11;
  uint64_t v4 = 12;
  if (v1 >> 28) {
    uint64_t v4 = 13;
  }
  if (v1 >= 0x200000) {
    uint64_t v3 = v4;
  }
  if (v1 >= 0x4000) {
    uint64_t v2 = v3;
  }
  if (v1 >= 0x80) {
    return v2;
  }
  else {
    return 9;
  }
}

uint64_t sub_10001D950(int a1)
{
  unsigned int v1 = sub_100027BFC(a1, 0);
  uint64_t v2 = 2;
  uint64_t v3 = 3;
  uint64_t v4 = 4;
  if (v1 >> 28) {
    uint64_t v4 = 5;
  }
  if (v1 >= 0x200000) {
    uint64_t v3 = v4;
  }
  if (v1 >= 0x4000) {
    uint64_t v2 = v3;
  }
  if (v1 >= 0x80) {
    return v2;
  }
  else {
    return 1;
  }
}

uint64_t sub_10001D9A0(int a1)
{
  unsigned int v1 = sub_100027BFC(a1, 0);
  uint64_t v2 = 6;
  uint64_t v3 = 7;
  uint64_t v4 = 8;
  if (v1 >> 28) {
    uint64_t v4 = 9;
  }
  if (v1 >= 0x200000) {
    uint64_t v3 = v4;
  }
  if (v1 >= 0x4000) {
    uint64_t v2 = v3;
  }
  if (v1 >= 0x80) {
    return v2;
  }
  else {
    return 5;
  }
}

uint64_t sub_10001D9F0(int a1, unint64_t a2)
{
  unsigned int v3 = sub_100027BFC(a1, 0);
  uint64_t v4 = 2;
  uint64_t v5 = 3;
  uint64_t v6 = 4;
  if (v3 >> 28) {
    uint64_t v6 = 5;
  }
  if (v3 >= 0x200000) {
    uint64_t v5 = v6;
  }
  if (v3 >= 0x4000) {
    uint64_t v4 = v5;
  }
  if (v3 >= 0x80) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = 1;
  }
  return sub_10001D778(a2) + v7;
}

uint64_t sub_10001DA58(int a1, unsigned int a2)
{
  unsigned int v3 = sub_100027BFC(a1, 0);
  uint64_t v4 = 1;
  uint64_t v5 = 2;
  uint64_t v6 = 3;
  uint64_t v7 = 4;
  if (v3 >> 28) {
    uint64_t v7 = 5;
  }
  if (v3 >= 0x200000) {
    uint64_t v6 = v7;
  }
  if (v3 >= 0x4000) {
    uint64_t v5 = v6;
  }
  if (v3 >= 0x80) {
    uint64_t v4 = v5;
  }
  uint64_t v8 = 10;
  uint64_t v9 = 1;
  uint64_t v10 = 2;
  uint64_t v11 = 3;
  uint64_t v12 = 4;
  if (a2 >> 28) {
    uint64_t v12 = 5;
  }
  if (a2 >= 0x200000) {
    uint64_t v11 = v12;
  }
  if (a2 >= 0x4000) {
    uint64_t v10 = v11;
  }
  if (a2 >= 0x80) {
    uint64_t v9 = v10;
  }
  if ((a2 & 0x80000000) == 0) {
    uint64_t v8 = v9;
  }
  return v8 + v4;
}

uint64_t sub_10001DAF8(int a1)
{
  unsigned int v1 = sub_100027BFC(a1, 0);
  uint64_t v2 = 3;
  uint64_t v3 = 4;
  uint64_t v4 = 5;
  if (v1 >> 28) {
    uint64_t v4 = 6;
  }
  if (v1 >= 0x200000) {
    uint64_t v3 = v4;
  }
  if (v1 >= 0x4000) {
    uint64_t v2 = v3;
  }
  if (v1 >= 0x80) {
    return v2;
  }
  else {
    return 2;
  }
}

char *sub_10001DB48(int a1, void *a2)
{
  unsigned int v3 = sub_100027BFC(a1, 0);
  uint64_t v4 = 2;
  uint64_t v5 = 3;
  uint64_t v6 = 4;
  if (v3 >> 28) {
    uint64_t v6 = 5;
  }
  if (v3 >= 0x200000) {
    uint64_t v5 = v6;
  }
  if (v3 >= 0x4000) {
    uint64_t v4 = v5;
  }
  if (v3 >= 0x80) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = 1;
  }
  uint64_t v8 = (char *)[a2 lengthOfBytesUsingEncoding:4];
  uint64_t v9 = 1;
  uint64_t v10 = 2;
  uint64_t v11 = 3;
  uint64_t v12 = 4;
  if (v8 >> 28) {
    uint64_t v12 = 5;
  }
  if (v8 >= 0x200000) {
    uint64_t v11 = v12;
  }
  if (v8 >= 0x4000) {
    uint64_t v10 = v11;
  }
  if (v8 >= 0x80) {
    uint64_t v9 = v10;
  }
  return &v8[v7 + v9];
}

char *sub_10001DBEC(int a1, void *a2)
{
  unsigned int v3 = sub_100027BFC(a1, 0);
  uint64_t v4 = 4;
  uint64_t v5 = 6;
  uint64_t v6 = 10;
  if (!(v3 >> 28)) {
    uint64_t v6 = 8;
  }
  if (v3 >= 0x200000) {
    uint64_t v5 = v6;
  }
  if (v3 >= 0x4000) {
    uint64_t v4 = v5;
  }
  if (v3 >= 0x80) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = 2;
  }
  return (char *)[a2 serializedSize] + v7;
}

char *sub_10001DC58(int a1, void *a2)
{
  unsigned int v3 = sub_100027BFC(a1, 0);
  uint64_t v4 = 2;
  uint64_t v5 = 3;
  uint64_t v6 = 4;
  if (v3 >> 28) {
    uint64_t v6 = 5;
  }
  if (v3 >= 0x200000) {
    uint64_t v5 = v6;
  }
  if (v3 >= 0x4000) {
    uint64_t v4 = v5;
  }
  if (v3 >= 0x80) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = 1;
  }
  uint64_t v8 = (char *)[a2 serializedSize];
  uint64_t v9 = 1;
  uint64_t v10 = 2;
  uint64_t v11 = 3;
  uint64_t v12 = 4;
  if (v8 >> 28) {
    uint64_t v12 = 5;
  }
  if (v8 >= 0x200000) {
    uint64_t v11 = v12;
  }
  if (v8 >= 0x4000) {
    uint64_t v10 = v11;
  }
  if (v8 >= 0x80) {
    uint64_t v9 = v10;
  }
  return &v8[v7 + v9];
}

char *sub_10001DCF8(int a1, void *a2)
{
  unsigned int v3 = sub_100027BFC(a1, 0);
  uint64_t v4 = 2;
  uint64_t v5 = 3;
  uint64_t v6 = 4;
  if (v3 >> 28) {
    uint64_t v6 = 5;
  }
  if (v3 >= 0x200000) {
    uint64_t v5 = v6;
  }
  if (v3 >= 0x4000) {
    uint64_t v4 = v5;
  }
  if (v3 >= 0x80) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = 1;
  }
  uint64_t v8 = (char *)[a2 length];
  uint64_t v9 = 1;
  uint64_t v10 = 2;
  uint64_t v11 = 3;
  uint64_t v12 = 4;
  if (v8 >> 28) {
    uint64_t v12 = 5;
  }
  if (v8 >= 0x200000) {
    uint64_t v11 = v12;
  }
  if (v8 >= 0x4000) {
    uint64_t v10 = v11;
  }
  if (v8 >= 0x80) {
    uint64_t v9 = v10;
  }
  return &v8[v7 + v9];
}

uint64_t sub_10001DD98(int a1, unsigned int a2)
{
  unsigned int v3 = sub_100027BFC(a1, 0);
  uint64_t v4 = 1;
  uint64_t v5 = 2;
  uint64_t v6 = 3;
  uint64_t v7 = 4;
  if (v3 >> 28) {
    uint64_t v7 = 5;
  }
  if (v3 >= 0x200000) {
    uint64_t v6 = v7;
  }
  if (v3 >= 0x4000) {
    uint64_t v5 = v6;
  }
  if (v3 >= 0x80) {
    uint64_t v4 = v5;
  }
  uint64_t v8 = 1;
  uint64_t v9 = 2;
  uint64_t v10 = 3;
  uint64_t v11 = 4;
  if (a2 >> 28) {
    uint64_t v11 = 5;
  }
  if (a2 >= 0x200000) {
    uint64_t v10 = v11;
  }
  if (a2 >= 0x4000) {
    uint64_t v9 = v10;
  }
  if (a2 >= 0x80) {
    uint64_t v8 = v9;
  }
  return v8 + v4;
}

uint64_t sub_10001DE2C(int a1, int a2)
{
  unsigned int v3 = sub_100027BFC(a1, 0);
  uint64_t v4 = 1;
  uint64_t v5 = 2;
  uint64_t v6 = 3;
  uint64_t v7 = 4;
  if (v3 >> 28) {
    uint64_t v7 = 5;
  }
  if (v3 >= 0x200000) {
    uint64_t v6 = v7;
  }
  if (v3 >= 0x4000) {
    uint64_t v5 = v6;
  }
  if (v3 >= 0x80) {
    uint64_t v4 = v5;
  }
  unsigned int v8 = (2 * a2) ^ (a2 >> 31);
  uint64_t v9 = 2;
  uint64_t v10 = 3;
  uint64_t v11 = 4;
  if (v8 >> 28) {
    uint64_t v11 = 5;
  }
  if (v8 >= 0x200000) {
    uint64_t v10 = v11;
  }
  if (v8 >= 0x4000) {
    uint64_t v9 = v10;
  }
  if (v8 >= 0x80) {
    uint64_t v12 = v9;
  }
  else {
    uint64_t v12 = 1;
  }
  return v12 + v4;
}

uint64_t sub_10001DEC8(int a1, uint64_t a2)
{
  unsigned int v3 = sub_100027BFC(a1, 0);
  uint64_t v4 = 2;
  uint64_t v5 = 3;
  uint64_t v6 = 4;
  if (v3 >> 28) {
    uint64_t v6 = 5;
  }
  if (v3 >= 0x200000) {
    uint64_t v5 = v6;
  }
  if (v3 >= 0x4000) {
    uint64_t v4 = v5;
  }
  if (v3 >= 0x80) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = 1;
  }
  return sub_10001D778((2 * a2) ^ (a2 >> 63)) + v7;
}

char *sub_10001DF34(unsigned int a1, void *a2)
{
  unsigned int v4 = sub_100027BFC(1, 0);
  uint64_t v5 = 4;
  uint64_t v6 = 6;
  uint64_t v7 = 10;
  if (!(v4 >> 28)) {
    uint64_t v7 = 8;
  }
  if (v4 >= 0x200000) {
    uint64_t v6 = v7;
  }
  if (v4 >= 0x4000) {
    uint64_t v5 = v6;
  }
  if (v4 >= 0x80) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = 2;
  }
  uint64_t v9 = sub_10001DD98(2, a1) + v8;
  return &sub_10001DC58(3, a2)[v9];
}

char *sub_10001DFC4(unsigned int a1, void *a2)
{
  unsigned int v4 = sub_100027BFC(1, 0);
  uint64_t v5 = 4;
  uint64_t v6 = 6;
  uint64_t v7 = 10;
  if (!(v4 >> 28)) {
    uint64_t v7 = 8;
  }
  if (v4 >= 0x200000) {
    uint64_t v6 = v7;
  }
  if (v4 >= 0x4000) {
    uint64_t v5 = v6;
  }
  if (v4 >= 0x80) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = 2;
  }
  uint64_t v9 = sub_10001DD98(2, a1) + v8;
  return &sub_10001DCF8(3, a2)[v9];
}

uint64_t sub_10001E054(int a1, int a2)
{
  unsigned int v3 = sub_100027BFC(a1, 0);
  uint64_t v4 = 1;
  uint64_t v5 = 2;
  uint64_t v6 = 3;
  uint64_t v7 = 4;
  if (v3 >> 28) {
    uint64_t v7 = 5;
  }
  if (v3 >= 0x200000) {
    uint64_t v6 = v7;
  }
  if (v3 >= 0x4000) {
    uint64_t v5 = v6;
  }
  if (v3 >= 0x80) {
    uint64_t v4 = v5;
  }
  return v4 << (a2 == 16);
}

id sub_10001E324(uint64_t a1)
{
  [*(id *)(a1 + 32) setInitialDelay:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setCurrentDelay:[*(id *)(a1 + 32) initialDelay]];
  unint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    double v3 = (double)*(unint64_t *)(a1 + 48) / (double)v2;
  }
  else {
    double v3 = 1.0;
  }
  [*(id *)(a1 + 32) setBackoff:v3];
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void **)(a1 + 32);

  return _[v5 setMaximumDelay:v4];
}

id sub_10001E66C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onqueueTrigger:*(void *)(a1 + 40) maximumDelay:-1];
}

void sub_10001E748(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_10001E75C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setLiveRequest:1];
  unint64_t v2 = [WeakRetained liveRequestReceived];
  [v2 fulfill];

  if (*(void *)(a1 + 40) == -1) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = *(void *)(a1 + 40);
  }
  [WeakRetained _onqueueTrigger:v3];
}

void sub_10001EAE0(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_10001EAF4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setLiveRequest:1];
  uint64_t v1 = [WeakRetained liveRequestReceived];
  [v1 fulfill];

  [WeakRetained _onqueueTrigger:0 maximumDelay:-1];
}

void sub_10001EF24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_10001EF50(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _onqueueTimerTick];
}

void sub_10001F018(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) timer];
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    uint64_t v4 = [*(id *)(a1 + 32) timer];
    intptr_t v5 = dispatch_source_testcancel(v4);

    if (!v5)
    {
      uint64_t v6 = [*(id *)(a1 + 32) timer];
      dispatch_source_cancel(v6);
    }
  }
}

void sub_10001FC0C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

SEL sub_1000204F8(char *__s, char *str, const char *a3, int a4)
{
  if (!__s && !a3 && (a4 & 1) == 0)
  {
    return sel_getUid(str);
  }
  if (__s) {
    size_t v9 = strlen(__s);
  }
  else {
    size_t v9 = 0;
  }
  size_t v10 = strlen(str);
  size_t v11 = v10;
  if (a3)
  {
    size_t v10 = strlen(a3);
    size_t v12 = v10;
  }
  else
  {
    size_t v12 = 0;
  }
  uint64_t v18 = (uint64_t)&v18;
  size_t v13 = v11 + v9 + v12;
  uint64_t v14 = 1;
  if (a4) {
    uint64_t v14 = 2;
  }
  size_t v15 = v13 + v14;
  __chkstk_darwin(v10);
  uint64_t v17 = (char *)&v18 - v16;
  bzero((char *)&v18 - v16, v15);
  if (!__s)
  {
    memcpy(v17, str, v11);
    if (!a3) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  memcpy(v17, __s, v9);
  memcpy(&v17[v9], str, v11);
  v17[v9] = __toupper(v17[v9]);
  if (a3) {
LABEL_17:
  }
    memcpy(&v17[v9 + v11], a3, v12);
LABEL_18:
  if (a4) {
    v17[v13] = 58;
  }
  v17[v15 - 1] = 0;
  return sel_getUid(v17);
}

uint64_t sub_10002094C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  unsigned int v2 = *(unsigned __int16 *)(v1 + 28);
  if ((v2 & 0xF00) != 0)
  {
    int v3 = 15;
    LOBYTE(v4) = 0;
  }
  else
  {
    int v3 = *(unsigned __int8 *)(v1 + 30);
    int v4 = (v2 >> 2) & 1;
  }
  int v5 = sub_100027C24(v3, v4);
  int v6 = *(_DWORD *)(v1 + 16);

  return sub_100027BFC(v6, v5);
}

uint64_t sub_1000209A8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  int v2 = sub_100027C24(*(unsigned __int8 *)(v1 + 30), (*(_WORD *)(v1 + 28) & 4) == 0);
  int v3 = *(_DWORD *)(v1 + 16);

  return sub_100027BFC(v3, v2);
}

void sub_100021298(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100021F30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100021F70(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v5 = objc_alloc_init(KTCondition);
  int v4 = [*(id *)(a1 + 32) mutableStateConditions];
  [v4 setObject:v5 forKeyedSubscript:v3];
}

void sub_100021FF4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v2 = [WeakRetained queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002209C;
  block[3] = &unk_10008CE40;
  id v5 = WeakRetained;
  id v3 = WeakRetained;
  dispatch_sync(v2, block);
}

id sub_10002209C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onqueueSendAnyPendingFlags];
}

void sub_1000221A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000221C0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000221D0(uint64_t a1)
{
}

void sub_1000221D8(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) mutableStateConditions];
  id v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100022808(id a1)
{
  qword_1000A75C8 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  _objc_release_x1();
}

void sub_100022C0C(id a1)
{
  qword_1000A75C8 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  _objc_release_x1();
}

void sub_100022C50(id a1)
{
  qword_1000A75C8 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  _objc_release_x1();
}

void sub_100022C94(id a1)
{
  qword_1000A75C8 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  _objc_release_x1();
}

void sub_100022E0C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100022E2C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = [WeakRetained queue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100022EE0;
  v4[3] = &unk_10008CEB0;
  id v5 = *(id *)(a1 + 32);
  id v6 = WeakRetained;
  dispatch_sync(v3, v4);
}

id sub_100022EE0(uint64_t a1)
{
  if (qword_1000A75C0 != -1) {
    dispatch_once(&qword_1000A75C0, &stru_10008DA80);
  }
  uint64_t v2 = (void *)qword_1000A75C8;
  if (os_log_type_enabled((os_log_t)qword_1000A75C8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    int v4 = v2;
    id v5 = [v3 nextState];
    id v6 = [*(id *)(a1 + 32) intendedState];
    uint64_t v7 = [*(id *)(a1 + 40) currentFlags];
    uint64_t v8 = [v7 contentsAsString];
    size_t v9 = [*(id *)(a1 + 40) pendingFlagsString];
    size_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = [v10 error];
    size_t v12 = (void *)v11;
    *(_DWORD *)buf = 138544642;
    CFStringRef v13 = @"(no error)";
    id v41 = v5;
    if (v11) {
      CFStringRef v13 = (const __CFString *)v11;
    }
    __int16 v42 = 2114;
    long long v43 = v6;
    __int16 v44 = 2114;
    long long v45 = v8;
    __int16 v46 = 2114;
    double v47 = v9;
    __int16 v48 = 2114;
    long long v49 = v10;
    __int16 v50 = 2114;
    CFStringRef v51 = v13;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Finishing state transition attempt (ending in %{public}@, intended: %{public}@, f:[%{public}@], p:[%{public}@]): %{public}@ %{public}@", buf, 0x3Eu);
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v14 = [*(id *)(a1 + 40) stateMachineWatchers];
  id v15 = [v14 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v15)
  {
    id v17 = v15;
    uint64_t v18 = *(void *)v36;
    *(void *)&long long v16 = 138543362;
    long long v34 = v16;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v36 != v18) {
          objc_enumerationMutation(v14);
        }
        id v20 = *(void **)(*((void *)&v35 + 1) + 8 * (void)v19);
        if (qword_1000A75C0 != -1) {
          dispatch_once(&qword_1000A75C0, &stru_10008DAA0);
        }
        float v21 = qword_1000A75C8;
        if (os_log_type_enabled((os_log_t)qword_1000A75C8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v34;
          id v41 = v20;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "notifying watcher: %{public}@", buf, 0xCu);
        }
        [v20 onqueueHandleTransition:*(void *)(a1 + 32) v34];
        uint64_t v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      id v17 = [v14 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v17);
  }

  CFStringRef v22 = [*(id *)(a1 + 40) stateMachineWatchers];
  id v23 = [v22 count];

  if (v23)
  {
    uint64_t v24 = [*(id *)(a1 + 40) stateMachineWatchers];
    uint64_t v25 = (uint64_t)[v24 count];

    if (v25 >= 1)
    {
      unint64_t v26 = v25 + 1;
      do
      {
        uint64_t v27 = [*(id *)(a1 + 40) stateMachineWatchers];
        id v28 = [v27 objectAtIndexedSubscript:v26 - 2];
        long long v29 = [v28 result];
        unsigned int v30 = [v29 isFinished];

        if (v30)
        {
          long long v31 = [*(id *)(a1 + 40) stateMachineWatchers];
          [v31 removeObjectAtIndex:v26 - 2];
        }
        --v26;
      }
      while (v26 > 1);
    }
  }
  long long v32 = [*(id *)(a1 + 32) nextState];
  [*(id *)(a1 + 40) setCurrentState:v32];

  [*(id *)(a1 + 40) setNextStateMachineCycleOperation:0];
  return [*(id *)(a1 + 40) _onqueueStartNextStateMachineOperation:1];
}

void sub_1000232A4(id a1)
{
  qword_1000A75C8 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  _objc_release_x1();
}

void sub_1000232E8(id a1)
{
  qword_1000A75C8 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  _objc_release_x1();
}

id sub_1000233B4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onqueuePokeStateMachine];
}

id sub_1000234BC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onqueueHandleFlag:*(void *)(a1 + 40)];
}

id sub_1000235F8(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _onqueueHandlePendingFlag:*(void *)(a1 + 40)];
}

id sub_1000236D0(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _onqueueHandlePendingFlag:*(void *)(a1 + 40)];
}

id sub_100023830(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _onqueueCancelPendingFlag:*(void *)(a1 + 40)];
}

void sub_1000239C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000239E8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100023A7C;
  block[3] = &unk_10008CE40;
  void block[4] = WeakRetained;
  dispatch_sync(v2, block);
}

id sub_100023A7C(uint64_t a1)
{
  if (qword_1000A75C0 != -1) {
    dispatch_once(&qword_1000A75C0, &stru_10008DAE8);
  }
  uint64_t v2 = qword_1000A75C8;
  if (os_log_type_enabled((os_log_t)qword_1000A75C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Finished waiting for operation", v4, 2u);
  }
  return [*(id *)(a1 + 32) _onqueueSendAnyPendingFlags];
}

void sub_100023B14(id a1)
{
  qword_1000A75C8 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  _objc_release_x1();
}

id sub_100023BE0(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAllowPendingFlags:0];
}

void sub_100023D08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100023D20(uint64_t a1)
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v2 = [*(id *)(a1 + 32) pendingFlags];
  uint64_t v3 = [v2 allKeys];

  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * (void)v7);
        size_t v9 = [*(id *)(a1 + 32) pendingFlags];
        size_t v10 = [v9 objectForKeyedSubscript:v8];
        uint64_t v11 = [v10 description];
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v11 forKeyedSubscript:v8];

        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

void sub_100023FA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100023FB8(uint64_t a1)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = [*(id *)(a1 + 32) currentFlags];
  uint64_t v3 = [v2 dumpFlags];

  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:*(void *)(*((void *)&v8 + 1) + 8 * (void)v7) forKeyedSubscript:*(void *)(*((void *)&v8 + 1) + 8 * (void)v7)];
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

void sub_100024634(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100024690(id a1)
{
  qword_1000A75C8 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  _objc_release_x1();
}

void sub_1000246D4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100024770;
    block[3] = &unk_10008CE40;
    void block[4] = v2;
    dispatch_sync(v3, block);
  }
}

id sub_100024770(uint64_t a1)
{
  if (qword_1000A75C0 != -1) {
    dispatch_once(&qword_1000A75C0, &stru_10008DB50);
  }
  uint64_t v2 = qword_1000A75C8;
  if (os_log_type_enabled((os_log_t)qword_1000A75C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Unlock occurred", v4, 2u);
  }
  [*(id *)(a1 + 32) setConditionChecksInFlight:((unint64_t)[*(id *)(a1 + 32) conditionChecksInFlight] & 0xFFFFFFFFFFFFFFFELL)];
  [*(id *)(a1 + 32) _onqueueRecheckConditions];
  return [*(id *)(a1 + 32) _onqueueSendAnyPendingFlags];
}

void sub_100024828(id a1)
{
  qword_1000A75C8 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  _objc_release_x1();
}

void sub_10002486C(id a1)
{
  qword_1000A75C8 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  _objc_release_x1();
}

void sub_1000248B0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002494C;
    block[3] = &unk_10008CE40;
    void block[4] = v2;
    dispatch_sync(v3, block);
  }
}

id sub_10002494C(uint64_t a1)
{
  if (qword_1000A75C0 != -1) {
    dispatch_once(&qword_1000A75C0, &stru_10008DB90);
  }
  uint64_t v2 = qword_1000A75C8;
  if (os_log_type_enabled((os_log_t)qword_1000A75C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Network is reachable", v4, 2u);
  }
  [*(id *)(a1 + 32) setConditionChecksInFlight:((unint64_t)[*(id *)(a1 + 32) conditionChecksInFlight] & 0xFFFFFFFFFFFFFFFDLL)];
  [*(id *)(a1 + 32) _onqueueRecheckConditions];
  return [*(id *)(a1 + 32) _onqueueSendAnyPendingFlags];
}

void sub_100024A04(id a1)
{
  qword_1000A75C8 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  _objc_release_x1();
}

void sub_100024FAC(id a1)
{
  qword_1000A75C8 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  _objc_release_x1();
}

void sub_100024FF0(id a1)
{
  qword_1000A75C8 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  _objc_release_x1();
}

void sub_100025034(id a1)
{
  qword_1000A75C8 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  _objc_release_x1();
}

void sub_10002512C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) testHoldStates];
  [v2 addObject:*(void *)(a1 + 40)];
}

id sub_100025234(uint64_t a1)
{
  if (qword_1000A75C0 != -1) {
    dispatch_once(&qword_1000A75C0, &stru_10008DC10);
  }
  id v2 = qword_1000A75C8;
  if (os_log_type_enabled((os_log_t)qword_1000A75C8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Releasing state machine test pause from %@", (uint8_t *)&v6, 0xCu);
  }
  id v4 = [*(id *)(a1 + 40) testHoldStates];
  [v4 removeObject:*(void *)(a1 + 32)];

  return [*(id *)(a1 + 40) _onqueuePokeStateMachine];
}

void sub_100025324(id a1)
{
  qword_1000A75C8 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  _objc_release_x1();
}

void sub_100025428(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100025440(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) nextStateMachineCycleOperation];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v2 == 0;
}

void sub_10002557C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100025594(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) nextStateMachineCycleOperation];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v2 == 0;
}

void sub_10002566C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) holdStateMachineOperation];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) operationQueue];
    id v4 = [*(id *)(a1 + 32) holdStateMachineOperation];
    [v3 addOperation:v4];

    id v5 = *(void **)(a1 + 32);
    [v5 setHoldStateMachineOperation:0];
  }
}

id sub_1000257A8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) holdStateMachineOperation];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) operationQueue];
    id v4 = [*(id *)(a1 + 32) holdStateMachineOperation];
    [v3 addOperation:v4];

    [*(id *)(a1 + 32) setHoldStateMachineOperation:0];
  }
  [*(id *)(a1 + 32) setHalted:1];
  [*(id *)(a1 + 32) setAllowPendingFlags:0];
  id v5 = *(void **)(a1 + 32);

  return [v5 _onqueuePokeStateMachine];
}

id sub_100025908(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) stateMachineRequests];
  [v2 addObject:*(void *)(a1 + 40)];

  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 _onqueuePokeStateMachine];
}

id sub_100025A0C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) stateMachineWatchers];
  [v2 addObject:*(void *)(a1 + 40)];

  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 _onqueuePokeStateMachine];
}

id sub_100025B10(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _onqueueRegisterMultiStateArrivalWatcher:*(void *)(a1 + 40)];
}

void sub_100025EA8(id a1)
{
  qword_1000A75C8 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  _objc_release_x1();
}

void sub_100025EEC(uint64_t a1)
{
  if (qword_1000A75C0 != -1) {
    dispatch_once(&qword_1000A75C0, &stru_10008DC50);
  }
  id v2 = (void *)qword_1000A75C8;
  if (os_log_type_enabled((os_log_t)qword_1000A75C8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(a1 + 40);
    id v5 = v2;
    uint64_t v6 = [v3 error];
    uint64_t v7 = (void *)v6;
    CFStringRef v8 = @"no error";
    if (v6) {
      CFStringRef v8 = (const __CFString *)v6;
    }
    int v11 = 138543618;
    uint64_t v12 = v4;
    __int16 v13 = 2114;
    CFStringRef v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Returning '%{public}@' result: %{public}@", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v9 = *(void *)(a1 + 48);
  long long v10 = [*(id *)(a1 + 40) error];
  (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
}

void sub_100026024(id a1)
{
  qword_1000A75C8 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  _objc_release_x1();
}

void sub_1000264FC(id a1)
{
  qword_1000A75C8 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  _objc_release_x1();
}

void sub_100026540(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (qword_1000A75C0 != -1) {
    dispatch_once(&qword_1000A75C0, &stru_10008DCB8);
  }
  uint64_t v4 = (void *)qword_1000A75C8;
  if (os_log_type_enabled((os_log_t)qword_1000A75C8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v5 = *(void **)(a1 + 40);
    uint64_t v7 = v4;
    CFStringRef v8 = [v5 result];
    uint64_t v9 = [v8 error];
    long long v10 = (void *)v9;
    CFStringRef v11 = @"no error";
    if (v9) {
      CFStringRef v11 = (const __CFString *)v9;
    }
    int v17 = 138543618;
    uint64_t v18 = v6;
    __int16 v19 = 2114;
    CFStringRef v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Returning '%{public}@' result: %{public}@", (uint8_t *)&v17, 0x16u);
  }
  uint64_t v12 = *(void *)(a1 + 48);
  if (v12)
  {
    __int16 v13 = [*(id *)(a1 + 40) result];
    CFStringRef v14 = [v13 error];
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v14);
  }
  long long v15 = [*(id *)(a1 + 40) result];
  long long v16 = [v15 error];
  [v3 setError:v16];
}

void sub_1000266E4(id a1)
{
  qword_1000A75C8 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  _objc_release_x1();
}

id sub_100026A60(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 8);
  if (*(unsigned char *)(v5 + 45))
  {
    if ((*(unsigned char *)(v5 + 45) & 2) != 0)
    {
      [a3 writeTag:*(unsigned int *)(v5 + 40) format:2];
      unint64_t v10 = *(char *)(v5 + 44);
      if (v10 > 6)
      {
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v13 = [a2 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v12 = 0;
          uint64_t v15 = *(void *)v25;
          do
          {
            for (unint64_t i = 0; i != v14; unint64_t i = (char *)i + 1)
            {
              if (*(void *)v25 != v15) {
                objc_enumerationMutation(a2);
              }
              v12 += (uint64_t)sub_100027944((id)*(unsigned __int8 *)(v5 + 44), *(void **)(*((void *)&v24 + 1) + 8 * i));
            }
            id v14 = [a2 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v14);
        }
        else
        {
          uint64_t v12 = 0;
        }
      }
      else
      {
        uint64_t v11 = qword_100085658[v10];
        uint64_t v12 = (void)[a2 count] * v11;
      }
      [a3 writeRawVarintSizeTAs32:v12];
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id result = [a2 countByEnumeratingWithState:&v20 objects:&v28 count:16];
      if (result)
      {
        id v17 = result;
        uint64_t v18 = *(void *)v21;
        do
        {
          __int16 v19 = 0;
          do
          {
            if (*(void *)v21 != v18) {
              objc_enumerationMutation(a2);
            }
            switch(*(unsigned char *)(v5 + 44))
            {
              case 0:
                [a3 writeBoolNoTag:[*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) BOOLValue]];
                break;
              case 1:
                [a3 writeFixed32NoTag:[*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) unsignedIntValue]];
                break;
              case 2:
                [a3 writeSFixed32NoTag:[*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) intValue]];
                break;
              case 3:
                [*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) floatValue];
                [a3 writeFloatNoTag:];
                break;
              case 4:
                [a3 writeFixed64NoTag:[*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) unsignedLongLongValue]];
                break;
              case 5:
                [a3 writeSFixed64NoTag:[(*(id *)(*((void *)&v20 + 1) + 8 * (void)v19)) longLongValue]];
                break;
              case 6:
                [*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) doubleValue];
                [a3 writeDoubleNoTag:];
                break;
              case 7:
                [a3 writeInt32NoTag:[*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) intValue]];
                break;
              case 8:
                [a3 writeInt64NoTag:[(*(id *)(*((void *)&v20 + 1) + 8 * (void)v19)) longLongValue]];
                break;
              case 9:
                [a3 writeSInt32NoTag:[*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) intValue]];
                break;
              case 0xA:
                [a3 writeSInt64NoTag:[*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) longLongValue]];
                break;
              case 0xB:
                [a3 writeUInt32NoTag:[*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) unsignedIntValue]];
                break;
              case 0xC:
                [a3 writeUInt64NoTag:[*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) unsignedLongLongValue]];
                break;
              case 0xD:
                [a3 writeBytesNoTag:*(void *)(*((void *)&v20 + 1) + 8 * (void)v19)];
                break;
              case 0xE:
                [a3 writeStringNoTag:*(void *)(*((void *)&v20 + 1) + 8 * (void)v19)];
                break;
              case 0xF:
                [a3 writeMessageNoTag:*(void *)(*((void *)&v20 + 1) + 8 * (void)v19)];
                break;
              case 0x10:
                [a3 writeGroupNoTag:*(unsigned int *)(v5 + 40) value:*(void *)(*((void *)&v20 + 1) + 8 * (void)v19)];
                break;
              case 0x11:
                [a3 writeEnumNoTag:[*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) intValue]];
                break;
              default:
                break;
            }
            __int16 v19 = (char *)v19 + 1;
          }
          while (v17 != v19);
          id result = [a2 countByEnumeratingWithState:&v20 objects:&v28 count:16];
          id v17 = result;
        }
        while (result);
      }
    }
    else
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id result = [a2 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (result)
      {
        id v7 = result;
        uint64_t v8 = *(void *)v29;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v29 != v8) {
              objc_enumerationMutation(a2);
            }
            sub_100026F14(*(id *)(*((void *)&v28 + 1) + 8 * (void)v9), v5, a3);
            uint64_t v9 = (char *)v9 + 1;
          }
          while (v7 != v9);
          id result = [a2 countByEnumeratingWithState:&v28 objects:v32 count:16];
          id v7 = result;
        }
        while (result);
      }
    }
  }
  else
  {
    return sub_100026F14(a2, v5, a3);
  }
  return result;
}

id sub_100026F14(id result, uint64_t a2, void *a3)
{
  switch(*(unsigned char *)(a2 + 44))
  {
    case 0:
      uint64_t v4 = *(unsigned int *)(a2 + 40);
      id v5 = [result BOOLValue];
      id result = [a3 writeBool:v4 value:v5];
      break;
    case 1:
      uint64_t v18 = *(unsigned int *)(a2 + 40);
      id v19 = [result unsignedIntValue];
      id result = [a3 writeFixed32:v18 value:v19];
      break;
    case 2:
      uint64_t v6 = *(unsigned int *)(a2 + 40);
      id v7 = [result intValue];
      id result = _[a3 writeSFixed32:v6 value:v7];
      break;
    case 3:
      uint64_t v20 = *(unsigned int *)(a2 + 40);
      [result floatValue];
      id result = [a3 writeFloat:v20];
      break;
    case 4:
      uint64_t v8 = *(unsigned int *)(a2 + 40);
      id v9 = [result unsignedLongLongValue];
      id result = [a3 writeFixed64:v8 value:v9];
      break;
    case 5:
      uint64_t v21 = *(unsigned int *)(a2 + 40);
      id v22 = [result longLongValue];
      id result = _[a3 writeSFixed64:v21 value:v22];
      break;
    case 6:
      uint64_t v23 = *(unsigned int *)(a2 + 40);
      [result doubleValue];
      id result = [a3 writeDouble:v23];
      break;
    case 7:
      uint64_t v24 = *(unsigned int *)(a2 + 40);
      id v25 = [result intValue];
      id result = _[a3 writeInt32:v24 value:v25];
      break;
    case 8:
      uint64_t v26 = *(unsigned int *)(a2 + 40);
      id v27 = [result longLongValue];
      id result = _[a3 writeInt64:v26 value:v27];
      break;
    case 9:
      uint64_t v10 = *(unsigned int *)(a2 + 40);
      id v11 = [result intValue];
      id result = _[a3 writeSInt32:v10 value:v11];
      break;
    case 0xA:
      uint64_t v28 = *(unsigned int *)(a2 + 40);
      id v29 = [result longLongValue];
      id result = _[a3 writeSInt64:v28 value:v29];
      break;
    case 0xB:
      uint64_t v12 = *(unsigned int *)(a2 + 40);
      id v13 = [result unsignedIntValue];
      id result = [a3 writeUInt32:v12 value:v13];
      break;
    case 0xC:
      uint64_t v14 = *(unsigned int *)(a2 + 40);
      id v15 = [result unsignedLongLongValue];
      id result = [a3 writeUInt64:v14 value:v15];
      break;
    case 0xD:
      uint64_t v30 = *(unsigned int *)(a2 + 40);
      id result = [a3 writeBytes:v30 value:result];
      break;
    case 0xE:
      uint64_t v16 = *(unsigned int *)(a2 + 40);
      id result = [a3 writeString:v16 value:result];
      break;
    case 0xF:
      uint64_t v31 = *(unsigned int *)(a2 + 40);
      if ((*(unsigned char *)(a2 + 45) & 4) != 0)
      {
        id result = _[a3 writeMessageSetExtension:v31 value:result];
      }
      else
      {
        id result = [a3 writeMessage:v31 value:result];
      }
      break;
    case 0x10:
      uint64_t v17 = *(unsigned int *)(a2 + 40);
      id result = [a3 writeGroup:v17 value:result];
      break;
    case 0x11:
      uint64_t v32 = *(unsigned int *)(a2 + 40);
      id v33 = [result intValue];
      id result = [a3 writeEnum:v32 value:v33];
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100027330(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 8);
  if (*(unsigned char *)(v3 + 45))
  {
    if ((*(unsigned char *)(v3 + 45) & 2) != 0)
    {
      unint64_t v11 = *(char *)(v3 + 44);
      if (v11 > 6)
      {
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v14 = [a2 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v13 = 0;
          uint64_t v16 = *(void *)v20;
          do
          {
            for (unint64_t i = 0; i != v15; unint64_t i = (char *)i + 1)
            {
              if (*(void *)v20 != v16) {
                objc_enumerationMutation(a2);
              }
              v13 += (uint64_t)sub_100027944((id)*(unsigned __int8 *)(v3 + 44), *(void **)(*((void *)&v19 + 1) + 8 * i));
            }
            id v15 = [a2 countByEnumeratingWithState:&v19 objects:v23 count:16];
          }
          while (v15);
        }
        else
        {
          uint64_t v13 = 0;
        }
      }
      else
      {
        uint64_t v12 = qword_100085658[v11];
        uint64_t v13 = (void)[a2 count] * v12;
      }
      uint64_t v18 = sub_10001D950(*(_DWORD *)(v3 + 40));
      return v18 + v13 + sub_10001BE44(v13);
    }
    else
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v6 = [a2 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = 0;
        uint64_t v9 = *(void *)v20;
        do
        {
          for (j = 0; j != v7; j = (char *)j + 1)
          {
            if (*(void *)v20 != v9) {
              objc_enumerationMutation(a2);
            }
            v8 += sub_100027578(v3, *(void **)(*((void *)&v19 + 1) + 8 * (void)j));
          }
          id v7 = [a2 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v7);
      }
      else
      {
        return 0;
      }
    }
    return v8;
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 8);
    return sub_100027578(v4, a2);
  }
}

uint64_t sub_100027578(uint64_t result, void *a2)
{
  switch(*(unsigned char *)(result + 44))
  {
    case 0:
      int v2 = *(_DWORD *)(result + 40);
      [a2 BOOLValue];
      return sub_10001DAF8(v2);
    case 1:
      int v16 = *(_DWORD *)(result + 40);
      [a2 unsignedIntValue];
      int v4 = v16;
      return sub_10001D9A0(v4);
    case 2:
      int v3 = *(_DWORD *)(result + 40);
      [a2 intValue];
      int v4 = v3;
      return sub_10001D9A0(v4);
    case 3:
      int v17 = *(_DWORD *)(result + 40);
      [a2 floatValue];
      int v4 = v17;
      return sub_10001D9A0(v4);
    case 4:
      int v5 = *(_DWORD *)(result + 40);
      [a2 unsignedLongLongValue];
      int v6 = v5;
      return sub_10001D900(v6);
    case 5:
      int v18 = *(_DWORD *)(result + 40);
      [a2 longLongValue];
      int v6 = v18;
      return sub_10001D900(v6);
    case 6:
      int v19 = *(_DWORD *)(result + 40);
      [a2 doubleValue];
      int v6 = v19;
      return sub_10001D900(v6);
    case 7:
      int v20 = *(_DWORD *)(result + 40);
      unsigned int v21 = [a2 intValue];
      int v22 = v20;
      goto LABEL_40;
    case 8:
      int v23 = *(_DWORD *)(result + 40);
      id v12 = [a2 longLongValue];
      int v13 = v23;
      goto LABEL_19;
    case 9:
      int v7 = *(_DWORD *)(result + 40);
      int v8 = [a2 intValue];
      return sub_10001DE2C(v7, v8);
    case 0xA:
      int v24 = *(_DWORD *)(result + 40);
      id v25 = [a2 longLongValue];
      return sub_10001DEC8(v24, (uint64_t)v25);
    case 0xB:
      int v9 = *(_DWORD *)(result + 40);
      unsigned int v10 = [a2 unsignedIntValue];
      return sub_10001DD98(v9, v10);
    case 0xC:
      int v11 = *(_DWORD *)(result + 40);
      id v12 = [a2 unsignedLongLongValue];
      int v13 = v11;
LABEL_19:
      id result = sub_10001D9F0(v13, (unint64_t)v12);
      break;
    case 0xD:
      int v26 = *(_DWORD *)(result + 40);
      id result = (uint64_t)sub_10001DCF8(v26, a2);
      break;
    case 0xE:
      int v14 = *(_DWORD *)(result + 40);
      id result = (uint64_t)sub_10001DB48(v14, a2);
      break;
    case 0xF:
      char v27 = *(unsigned char *)(result + 45);
      unsigned int v28 = *(_DWORD *)(result + 40);
      if ((v27 & 4) != 0)
      {
        id result = (uint64_t)sub_10001DF34(v28, a2);
      }
      else
      {
        id result = (uint64_t)sub_10001DC58(v28, a2);
      }
      break;
    case 0x10:
      int v15 = *(_DWORD *)(result + 40);
      id result = (uint64_t)sub_10001DBEC(v15, a2);
      break;
    case 0x11:
      int v29 = *(_DWORD *)(result + 40);
      unsigned int v21 = [a2 intValue];
      int v22 = v29;
LABEL_40:
      id result = sub_10001DA58(v22, v21);
      break;
    default:
      return result;
  }
  return result;
}

id sub_100027944(id result, void *a2)
{
  switch((int)result)
  {
    case 0:
      [a2 BOOLValue];
      return (id)sub_10001CC4C();
    case 1:
      [a2 unsignedIntValue];
      return (id)sub_10001B5C0();
    case 2:
      [a2 intValue];
      return (id)sub_10001B5C0();
    case 3:
      [a2 floatValue];
      return (id)sub_10001B5C0();
    case 4:
      [a2 unsignedLongLongValue];
      return (id)sub_10001B3E0();
    case 5:
      [a2 longLongValue];
      return (id)sub_10001B3E0();
    case 6:
      [a2 doubleValue];
      return (id)sub_10001B3E0();
    case 7:
      unsigned int v2 = [a2 intValue];
      goto LABEL_25;
    case 8:
      id v3 = [a2 longLongValue];
      goto LABEL_28;
    case 9:
      int v4 = [a2 intValue];
      return (id)sub_10001C458(v4);
    case 10:
      id v5 = [a2 longLongValue];
      return (id)sub_10001C6A0((uint64_t)v5);
    case 11:
      unsigned int v6 = [a2 unsignedIntValue];
      return (id)sub_10001BE44(v6);
    case 12:
      id v3 = [a2 unsignedLongLongValue];
LABEL_28:
      id result = (id)sub_10001B7C4((unint64_t)v3);
      break;
    case 13:
      id result = sub_10001D8B0(a2);
      break;
    case 14:
      id result = sub_10001D808(a2);
      break;
    case 15:
      id result = sub_10001D860(a2);
      break;
    case 16:
      id result = [a2 serializedSize];
      break;
    case 17:
      unsigned int v2 = [a2 intValue];
LABEL_25:
      id result = (id)sub_10001BBEC(v2);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100027BFC(int a1, int a2)
{
  return a2 | (8 * a1);
}

uint64_t sub_100027C04(char a1)
{
  return a1 & 7;
}

uint64_t sub_100027C0C(unsigned int a1)
{
  return a1 >> 3;
}

BOOL sub_100027C14(int a1)
{
  return (~a1 & 6) != 0;
}

uint64_t sub_100027C24(int a1, char a2)
{
  if (a2) {
    return 2;
  }
  else {
    return dword_100085690[a1];
  }
}

void sub_100027FD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_100027FFC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained stateMachine];
  [v1 handleFlag:off_1000A6718];
}

id sub_10002878C(uint64_t a1)
{
  return [*(id *)(a1 + 32) onQueueUpdateState];
}

void sub_10002887C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100028890(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) onQueueMapMailbox];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void sub_1000289F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100028A08(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100028A18(uint64_t a1)
{
}

uint64_t sub_100028A20(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) onQueueMapMailbox];

  return _objc_release_x1();
}

void sub_100028DB8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100028E20(id a1)
{
  v4[0] = off_1000A6710;
  v4[1] = off_1000A6718;
  v4[2] = off_1000A6720;
  v4[3] = off_1000A6728;
  void v4[4] = off_1000A6730;
  v4[5] = off_1000A6738;
  v4[6] = off_1000A6740;
  v4[7] = off_1000A6748;
  v4[8] = off_1000A6750;
  uint64_t v1 = +[NSArray arrayWithObjects:v4 count:9];
  uint64_t v2 = +[NSSet setWithArray:v1];
  id v3 = (void *)qword_1000A75E0;
  qword_1000A75E0 = v2;
}

void sub_100028F68(id a1)
{
  v4[0] = off_1000A6758;
  v4[1] = off_1000A6760;
  v4[2] = off_1000A6768;
  v4[3] = off_1000A6770;
  void v4[4] = off_1000A6778;
  v4[5] = off_1000A6780;
  v4[6] = off_1000A6788;
  v4[7] = off_1000A6790;
  v4[8] = off_1000A6798;
  void v4[9] = off_1000A67A0;
  v4[10] = off_1000A67A8;
  v4[11] = off_1000A67B0;
  v4[12] = off_1000A67B8;
  uint64_t v1 = +[NSArray arrayWithObjects:v4 count:13];
  uint64_t v2 = +[NSSet setWithArray:v1];
  id v3 = (void *)qword_1000A75F0;
  qword_1000A75F0 = v2;
}

void sub_1000292A0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) handleID];
    int v4 = [v3 kt_hexString];
    int v6 = 138543362;
    int v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "got announce %{public}@", (uint8_t *)&v6, 0xCu);
  }
  [*(id *)(a1 + 32) setGotAnnounceData:*(void *)(a1 + 40)];
  if ((int)[*(id *)(a1 + 32) beforeRatelimit] < 1)
  {
    id v5 = [*(id *)(a1 + 32) recvRatelimit];
    [v5 trigger];
  }
  else
  {
    [*(id *)(a1 + 32) setBeforeRatelimit:*(id *)(a1 + 32) beforeRatelimit] - 1);
    id v5 = [*(id *)(a1 + 32) stateMachine];
    [v5 _onqueueHandleFlag:off_1000A6718];
  }
}

void sub_100029684(uint64_t a1)
{
  [*(id *)(a1 + 32) setGotCommitData:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) stateMachine];
  [v2 _onqueueHandleFlag:off_1000A6720];
}

void sub_1000298D4(uint64_t a1)
{
  [*(id *)(a1 + 32) setGotReplyBData:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) stateMachine];
  [v2 _onqueueHandleFlag:off_1000A6728];
}

void sub_100029B44(uint64_t a1)
{
  [*(id *)(a1 + 32) setGotRevealData:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) stateMachine];
  [v2 _onqueueHandleFlag:off_1000A6730];
}

void sub_100029D8C(uint64_t a1)
{
  [*(id *)(a1 + 32) setGotConfirmData:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) stateMachine];
  [v2 _onqueueHandleFlag:off_1000A6738];
}

void sub_100029F30(uint64_t a1)
{
  [*(id *)(a1 + 32) setGotSelected:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) stateMachine];
  [v2 _onqueueHandleFlag:off_1000A6750];
}

void sub_10002A2E4(uint64_t a1)
{
  [*(id *)(a1 + 32) setGotTeardown:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) stateMachine];
  [v2 _onqueueHandleFlag:off_1000A6740];
}

void sub_10002B3F8(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) myPublicInfo];

  id v5 = *(void **)(a1 + 32);
  if (!v4)
  {
    unsigned int v21 = [v5 log];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100068F4C();
    }
    goto LABEL_12;
  }
  int v6 = [v5 gotAnnounceData];

  int v7 = *(void **)(a1 + 32);
  if (!v6)
  {
    unsigned int v21 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100068F80();
    }
LABEL_12:

    goto LABEL_15;
  }
  int v8 = [*(id *)(a1 + 32) gotAnnounceData];
  unsigned int v9 = [v7 validateAnnounce:v8];

  if (v9)
  {
    unsigned int v10 = [*(id *)(a1 + 32) peerSessionID];
    int v11 = [*(id *)(a1 + 32) peerAnnounce];
    id v12 = [v11 sessionId];
    unsigned __int8 v13 = [v10 isEqual:v12];

    int v14 = [*(id *)(a1 + 32) peerAnnounce];
    int v15 = [v14 sessionId];
    [*(id *)(a1 + 32) setPeerSessionID:v15];

    int v16 = [*(id *)(a1 + 32) peerAnnounce];
    int v17 = [v16 peerSessionId];
    int v18 = [*(id *)(a1 + 32) localSessionID];
    unsigned __int8 v19 = [v17 isEqual:v18];

    if (v19)
    {
      if ((v13 & 1) == 0) {
        [*(id *)(a1 + 32) sendAnnounce];
      }
      [*(id *)(a1 + 32) updateState];
      int v20 = off_1000A6770;
    }
    else
    {
      [*(id *)(a1 + 32) sendAnnounce];
      int v20 = off_1000A6768;
    }
    [v3 setNextState:v20];
  }
LABEL_15:
}

void sub_10002B5E8(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) peerAnnounce];

  id v5 = *(void **)(a1 + 32);
  if (v4)
  {
    int v6 = [v5 peerAnnounce];
    int v7 = [*(id *)(a1 + 32) localSessionID];
    int v8 = [v6 sessionId];
    int64_t v9 = +[KTIDSSessionHandler compareLocalSessionID:v7 remoteSessionID:v8];

    switch(v9)
    {
      case 0:
        int v26 = [*(id *)(a1 + 32) log];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          char v27 = [*(id *)(a1 + 32) peer];
          unsigned int v28 = [*(id *)(a1 + 32) localSessionID];
          int v29 = [v28 kt_hexString];
          uint64_t v30 = [v6 sessionId];
          uint64_t v31 = [v30 kt_hexString];
          int v42 = 141558786;
          uint64_t v43 = 1752392040;
          __int16 v44 = 2112;
          long long v45 = v27;
          __int16 v46 = 2114;
          double v47 = v29;
          __int16 v48 = 2114;
          long long v49 = v31;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "ktAnnounce picking session from me %{mask.hash}@ negotiated: %{public}@ peer %{public}@", (uint8_t *)&v42, 0x2Au);
        }
        id v32 = objc_alloc((Class)KTVaudenaySAS);
        id v33 = [*(id *)(a1 + 32) myPublicInfo];
        long long v34 = +[KTVaudenaySASConfiguration sha256Transparency];
        id v35 = [v32 initInitiatorWithPublic:v33 configuration:v34];
        [*(id *)(a1 + 32) setSas:v35];

        long long v36 = [*(id *)(a1 + 32) localSessionID];
        [*(id *)(a1 + 32) setNegotiatedSessionID:v36];

        long long v37 = [v6 sessionId];
        long long v38 = +[NSData dataWithData:v37];
        [*(id *)(a1 + 32) setPeerSessionID:v38];

        v39 = [*(id *)(a1 + 32) session];
        int v40 = [*(id *)(a1 + 32) negotiatedSessionID];
        [v39 negotiatedSessionID:v40 forMailbox:*(void *)(a1 + 32)];

        [*(id *)(a1 + 32) sendCommitA];
        [v3 setNextState:off_1000A6780];
        goto LABEL_17;
      case 2:
        unsigned __int8 v19 = [*(id *)(a1 + 32) log];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          id v41 = [*(id *)(a1 + 32) peer];
          int v42 = 141558274;
          uint64_t v43 = 1752392040;
          __int16 v44 = 2112;
          long long v45 = v41;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "ktAnnounce invalid session %{mask.hash}@", (uint8_t *)&v42, 0x16u);
        }
        break;
      case 1:
        unsigned int v10 = [*(id *)(a1 + 32) log];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int v11 = [*(id *)(a1 + 32) peer];
          id v12 = [v6 sessionId];
          unsigned __int8 v13 = [v12 kt_hexString];
          int v14 = [*(id *)(a1 + 32) localSessionID];
          int v15 = [v14 kt_hexString];
          int v42 = 141558786;
          uint64_t v43 = 1752392040;
          __int16 v44 = 2112;
          long long v45 = v11;
          __int16 v46 = 2114;
          double v47 = v13;
          __int16 v48 = 2114;
          long long v49 = v15;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "ktAnnounce picking session from peer %{mask.hash}@ negotiated: %{public}@ local: %{public}@", (uint8_t *)&v42, 0x2Au);
        }
        int v16 = [v6 sessionId];
        int v17 = +[NSData dataWithData:v16];
        [*(id *)(a1 + 32) setPeerSessionID:v17];

        int v18 = [*(id *)(a1 + 32) peerSessionID];
        [*(id *)(a1 + 32) setNegotiatedSessionID:v18];

        unsigned __int8 v19 = +[KTVaudenaySASConfiguration sha256Transparency];
        id v20 = objc_alloc((Class)KTVaudenaySAS);
        unsigned int v21 = [*(id *)(a1 + 32) myPublicInfo];
        id v22 = [v20 initAcceptorWithPublic:v21 configuration:v19];
        [*(id *)(a1 + 32) setSas:v22];

        int v23 = [*(id *)(a1 + 32) session];
        int v24 = [*(id *)(a1 + 32) negotiatedSessionID];
        [v23 negotiatedSessionID:v24 forMailbox:*(void *)(a1 + 32)];

        [*(id *)(a1 + 32) sendSelected];
        [v3 setNextState:off_1000A6778];
        break;
      default:
LABEL_17:

        goto LABEL_18;
    }

    goto LABEL_17;
  }
  id v25 = [v5 log];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    sub_100068FB4();
  }

  [v3 setNextState:off_1000A67B0];
LABEL_18:
}

void sub_10002BB78(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) sas];

  id v5 = *(void **)(a1 + 32);
  if (v4)
  {
    int v6 = [v5 gotCommitData];

    if (v6)
    {
      int v7 = [*(id *)(a1 + 32) gotCommitData];
      id v23 = 0;
      int v8 = +[TransparencyGPBMessage parseFromData:v7 error:&v23];
      int64_t v9 = v23;

      if (v8)
      {
        unsigned int v10 = [v8 publicInfo];
        id v11 = [v10 length];

        if (v11)
        {
          id v12 = [v8 aCommitRandom];
          id v13 = [v12 length];

          if (v13)
          {
            int v14 = [v8 publicInfo];
            [*(id *)(a1 + 32) setPeerPublicInfo:v14];

            int v15 = [*(id *)(a1 + 32) sas];
            int v16 = [v8 publicInfo];
            [v15 setPeerPublic:v16];

            int v17 = [*(id *)(a1 + 32) sas];
            int v18 = [v8 aCommitRandom];
            [v17 setInitiatorUndisclosedRandom:v18];

            [*(id *)(a1 + 32) sendSetupB];
            unsigned __int8 v19 = [v3 intendedState];
            [v3 setNextState:v19];

LABEL_20:
            goto LABEL_21;
          }
          id v22 = [*(id *)(a1 + 32) log];
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            sub_1000690EC();
          }
        }
        else
        {
          id v22 = [*(id *)(a1 + 32) log];
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            sub_1000690B8();
          }
        }

        unsigned int v21 = off_1000A67A8;
      }
      else
      {
        id v20 = [*(id *)(a1 + 32) log];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_100069050();
        }

        [*(id *)(a1 + 32) setGotCommitData:0];
        unsigned int v21 = off_1000A6788;
      }
      [v3 setNextState:v21];
      goto LABEL_20;
    }
    int64_t v9 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10006901C();
    }
  }
  else
  {
    int64_t v9 = [v5 log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100068FE8();
    }
  }
LABEL_21:
}

void sub_10002BE28(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) sas];
  if (v4
    && (id v5 = (void *)v4,
        [*(id *)(a1 + 32) gotReplyBData],
        int v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    int v7 = [*(id *)(a1 + 32) gotReplyBData];
    id v22 = 0;
    int v8 = +[TransparencyGPBMessage parseFromData:v7 error:&v22];
    int64_t v9 = v22;

    unsigned int v10 = *(void **)(a1 + 32);
    id v11 = [v8 sessionId];
    unsigned __int8 v12 = [v10 matchSession:v11 op:@"replyB"];

    id v13 = *(void **)(a1 + 32);
    if (v12)
    {
      int v14 = [v8 peerSessionId];
      int v15 = [v13 matchPeerSessionID:v14 op:@"replyB"];

      if (v15)
      {
        [v3 setNextState:v15];
      }
      else
      {
        int v16 = [v8 publicInfo];
        [*(id *)(a1 + 32) setPeerPublicInfo:v16];

        int v17 = [*(id *)(a1 + 32) sas];
        int v18 = [v8 publicInfo];
        [v17 setPeerPublic:v18];

        unsigned __int8 v19 = [*(id *)(a1 + 32) sas];
        id v20 = [v8 bRandom];
        [v19 setPeerRandom:v20];

        [*(id *)(a1 + 32) sendRevealA];
        [*(id *)(a1 + 32) sendConfirm];
        [*(id *)(a1 + 32) updateState];
        unsigned int v21 = [v3 intendedState];
        [v3 setNextState:v21];
      }
    }
    else
    {
      [*(id *)(a1 + 32) setGotReplyBData:0];
      [v3 setNextState:off_1000A6780];
    }
  }
  else
  {
    int64_t v9 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100069120();
    }
  }
}

void sub_10002C078(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) sas];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) gotRevealData];
    id v23 = 0;
    int v6 = +[TransparencyGPBMessage parseFromData:v5 error:&v23];
    int v7 = v23;

    int v8 = *(void **)(a1 + 32);
    if (!v6)
    {
      int v16 = [*(id *)(a1 + 32) log];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100069188();
      }

      [v3 setError:v7];
      goto LABEL_19;
    }
    int64_t v9 = [v6 sessionId];
    unsigned __int8 v10 = [v8 matchSession:v9 op:@"DiscloseA"];

    id v11 = *(void **)(a1 + 32);
    if ((v10 & 1) == 0)
    {
      [*(id *)(a1 + 32) setGotRevealData:0];
      [v3 setNextState:off_1000A6788];
LABEL_19:

      goto LABEL_20;
    }
    unsigned __int8 v12 = [v6 peerSessionId];
    id v13 = [v11 matchPeerSessionID:v12 op:@"DiscloseA"];

    if (v13)
    {
      int v14 = v3;
      int v15 = v13;
    }
    else
    {
      int v17 = [*(id *)(a1 + 32) sas];
      int v18 = [v6 aRandom];
      unsigned __int8 v19 = [v17 setPeerRandom:v18];

      id v20 = *(void **)(a1 + 32);
      if (v19)
      {
        [v20 sendConfirm];
        [*(id *)(a1 + 32) updateState];
        unsigned int v21 = [v3 intendedState];
        [v3 setNextState:v21];

LABEL_18:
        goto LABEL_19;
      }
      id v22 = [v20 log];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_1000691BC();
      }

      int v15 = off_1000A67B0;
      int v14 = v3;
    }
    [v14 setNextState:v15];
    goto LABEL_18;
  }
  int v7 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_100069154();
  }
LABEL_20:
}

void sub_10002C2D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) gotConfirmData];
  id v13 = 0;
  id v5 = +[TransparencyGPBMessage parseFromData:v4 error:&v13];
  id v6 = v13;

  int v7 = *(void **)(a1 + 32);
  int v8 = [v5 sessionId];
  LOBYTE(v7) = [v7 matchSession:v8 op:@"confirm"];

  int64_t v9 = *(void **)(a1 + 32);
  if (v7)
  {
    unsigned __int8 v10 = [v5 peerSessionId];
    id v11 = [v9 matchPeerSessionID:v10 op:@"confirm"];

    if (v11)
    {
      [v3 setNextState:v11];
    }
    else
    {
      unsigned __int8 v12 = [v3 intendedState];
      [v3 setNextState:v12];
    }
  }
  else
  {
    [v9 setGotConfirmData:0];
    [v3 setNextState:off_1000A6790];
  }
}

void sub_10002D090(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_10002D294(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002D41C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL sub_10002D540(id a1, id a2, unint64_t a3, BOOL *a4)
{
  return [a2 isFinished:a3, a4] ^ 1;
}

void sub_10002D87C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_10002D898(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = [WeakRetained dependencies];
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
        [WeakRetained removeDependency:*(void *)(*((void *)&v7 + 1) + 8 * (void)v6)];
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

void *sub_10002DA04(objc_class *a1, uint64_t a2, void *a3)
{
  uint64_t v5 = objc_alloc_init(a1);
  v5[4] = a2;
  v5[5] = a3;
  return v5;
}

BOOL sub_10002DA48(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) == a2;
}

id sub_10002DA58(void *a1)
{
  id result = (id)a1[4];
  if (result)
  {
    id v3 = (void *)a1[5];
    if (v3) {
      return (id)sub_100014974((uint64_t)result, v3, a1);
    }
    else {
      return [result setExtension:a1[6]];
    }
  }
  return result;
}

id sub_10002DA80(void *a1, uint64_t a2)
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = (void *)*((void *)[(id)objc_opt_class() descriptor] + 1);
  id result = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (result)
  {
    id v6 = result;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      long long v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v8);
        if ([v9 fieldType] == 1 && sub_10001432C((uint64_t)a1, (uint64_t)v9) == a2)
        {
          if (*(unsigned __int8 *)(v9[1] + 30) - 13 >= 4) {
            long long v10 = &OBJC_IVAR___TransparencyGPBInt32Array__autocreator;
          }
          else {
            long long v10 = &OBJC_IVAR___TransparencyGPBAutocreatedArray__autocreator;
          }
          *(void *)(a2 + *v10) = 0;
          return sub_10002DA58(a1);
        }
        long long v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id result = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      id v6 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

id sub_10002DBEC(void *a1, uint64_t a2)
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = (void *)*((void *)[(id)objc_opt_class() descriptor] + 1);
  id result = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (result)
  {
    id v6 = result;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      long long v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v8);
        if ([v9 fieldType] == 2 && sub_10001432C((uint64_t)a1, (uint64_t)v9) == a2)
        {
          if ([v9 mapKeyDataType] == 14
            && *(unsigned __int8 *)(v9[1] + 30) - 13 < 4)
          {
            long long v10 = &OBJC_IVAR___TransparencyGPBAutocreatedDictionary__autocreator;
          }
          else
          {
            long long v10 = &OBJC_IVAR___TransparencyGPBInt32Int32Dictionary__autocreator;
          }
          *(void *)(a2 + *v10) = 0;
          return sub_10002DA58(a1);
        }
        long long v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id result = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      id v6 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

void sub_10002DD6C(uint64_t a1)
{
  if (a1)
  {
    if (*(void *)(a1 + 32))
    {
      *(void *)(a1 + 32) = 0;

      *(void *)(a1 + 40) = 0;
      *(void *)(a1 + 48) = 0;
    }
  }
}

NSError *sub_10002E078(void *a1)
{
  if (!objc_msgSend(objc_msgSend(a1, "name"), "isEqual:", @"TransparencyGPBCodedInputStreamException")|| (id result = (NSError *)objc_msgSend(objc_msgSend(a1, "userInfo"), "objectForKeyedSubscript:", @"TransparencyGPBCodedInputStreamUnderlyingErrorKey")) == 0)
  {
    id v3 = [a1 reason];
    if ([v3 length])
    {
      CFStringRef v5 = @"Reason";
      id v6 = v3;
      id v4 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
    }
    else
    {
      id v4 = 0;
    }
    return +[NSError errorWithDomain:@"TransparencyGPBMessageErrorDomain" code:-100 userInfo:v4];
  }
  return result;
}

void sub_10002E68C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = [a3 copyWithZone:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setObject:v5 forKey:a2];
}

NSMutableDictionary *sub_10002E770(void *a1, uint64_t a2)
{
  if (![a1 count]) {
    return 0;
  }
  id v4 = -[NSMutableDictionary initWithCapacity:](+[NSMutableDictionary allocWithZone:](NSMutableDictionary, "allocWithZone:", a2), "initWithCapacity:", [a1 count]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v5 = [a1 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v29;
    uint64_t v21 = *(void *)v29;
    id v22 = v4;
    do
    {
      long long v8 = 0;
      id v23 = v6;
      do
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(a1);
        }
        long long v9 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v8);
        id v10 = [a1 objectForKey:v9];
        unsigned int v11 = *(unsigned __int8 *)(v9[1] + 44) - 15;
        if ([v9 isRepeated])
        {
          if (v11 > 1)
          {
            id v18 = [v10 mutableCopyWithZone:a2];
            goto LABEL_20;
          }
          id v12 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v10 count]];
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          id v13 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v25;
            do
            {
              for (unint64_t i = 0; i != v14; unint64_t i = (char *)i + 1)
              {
                if (*(void *)v25 != v15) {
                  objc_enumerationMutation(v10);
                }
                id v17 = [*(id *)(*((void *)&v24 + 1) + 8 * i) copyWithZone:a2];
                [v12 addObject:v17];
              }
              id v14 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
            }
            while (v14);
          }
          id v4 = v22;
          [(NSMutableDictionary *)v22 setObject:v12 forKey:v9];

          uint64_t v7 = v21;
          id v6 = v23;
        }
        else
        {
          if (v11 <= 1)
          {
            id v18 = [v10 copyWithZone:a2];
LABEL_20:
            unsigned __int8 v19 = v18;
            [(NSMutableDictionary *)v4 setObject:v18 forKey:v9];

            goto LABEL_22;
          }
          [(NSMutableDictionary *)v4 setObject:v10 forKey:v9];
        }
LABEL_22:
        long long v8 = (char *)v8 + 1;
      }
      while (v8 != v6);
      id v6 = [a1 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v6);
  }
  return v4;
}

void *sub_10002ED6C(uint64_t a1, void *a2)
{
  uint64_t v4 = a2[1];
  if (*(unsigned __int8 *)(v4 + 30) - 15 >= 2)
  {
    if (sub_10001485C(a1, *(_DWORD *)(v4 + 20), *(_DWORD *)(v4 + 16))) {
      return *(void **)(*(void *)(a1 + 64) + *(unsigned int *)(a2[1] + 24));
    }
    else {
      return [a2 defaultValue];
    }
  }
  else
  {
    id v5 = (unint64_t *)(*(void *)(a1 + 64) + *(unsigned int *)(v4 + 24));
    id v6 = (void *)atomic_load(v5);
    if (!v6)
    {
      id v6 = objc_alloc_init((Class)[a2 msgClass]);
      void v6[4] = a1;
      uint64_t v7 = a2;
      uint64_t v8 = 0;
      v6[5] = v7;
      atomic_compare_exchange_strong((atomic_ullong *volatile)v5, (unint64_t *)&v8, (unint64_t)v6);
      if (v8)
      {
        sub_10002DD6C((uint64_t)v6);

        return (void *)v8;
      }
    }
  }
  return v6;
}

void sub_10002F15C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_10002F17C(void *result, void *a2, void *a3, unsigned char *a4)
{
  if (*(unsigned __int8 *)(a2[1] + 44) - 15 <= 1)
  {
    id v6 = result;
    if ([a2 isRepeated])
    {
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      id result = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (!result) {
        return result;
      }
      id v7 = result;
      uint64_t v8 = *(void *)v11;
LABEL_5:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(a3);
        }
        id result = [*(id *)(*((void *)&v10 + 1) + 8 * v9) isInitialized];
        if (!result) {
          break;
        }
        if (v7 == (id)++v9)
        {
          id result = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
          id v7 = result;
          if (result) {
            goto LABEL_5;
          }
          return result;
        }
      }
    }
    else
    {
      id result = [a3 isInitialized];
      if (result) {
        return result;
      }
    }
    *(unsigned char *)(*(void *)(v6[4] + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

uint64_t sub_100030494(uint64_t a1, void *a2)
{
  [a2 containingMessageClass];
  uint64_t result = objc_opt_isKindOfClass();
  if ((result & 1) == 0) {
    return (uint64_t)[NSException raise:format:](NSException, @"raise:format:", NSInvalidArgumentException, @"Extension %@ used on wrong class (%@ instead of %@)", [a2 singletonName], objc_opt_class(), objc_msgSend(a2, @"containingMessageClass"));
  }
  return result;
}

void sub_100030E6C(void *a1, int a2, uint64_t *a3, uint64_t a4, void *a5)
{
  if (a2)
  {
    int v9 = sub_10003AD64(a3 + 1);
    unint64_t v10 = sub_10003B204((uint64_t)(a3 + 1), v9);
    while (sub_10003B258((uint64_t)(a3 + 1)))
    {
      CFStringRef v11 = sub_10003526C(a1, a5, a3, a4, 0);
      if (v11)
      {
        long long v12 = (__CFString *)v11;
        [a5 addExtension:a1 value:v11];
      }
    }
    sub_10003B250((uint64_t)(a3 + 1), v10);
  }
  else
  {
    uint64_t v13 = a1[1];
    if (*(unsigned char *)(v13 + 45))
    {
      CFStringRef v15 = sub_10003526C(a1, a5, a3, a4, 0);
      if (!v15) {
        return;
      }
      id v17 = (__CFString *)v15;
      [a5 addExtension:a1 value:v15];
    }
    else
    {
      if (*(unsigned __int8 *)(v13 + 44) - 15 > 1) {
        id v14 = 0;
      }
      else {
        id v14 = [a5 getExistingExtension:a1];
      }
      CFStringRef v16 = sub_10003526C(a1, a5, a3, a4, v14);
      if (!v16) {
        return;
      }
      id v17 = (__CFString *)v16;
      [a5 setExtension:a1 value:v16];
    }
  }
}

uint64_t sub_100031034(void *a1)
{
  uint64_t result = a1[1];
  if (!result)
  {
    a1[1] = objc_alloc_init(TransparencyGPBUnknownFieldSet);
    sub_10002DA58(a1);
    return a1[1];
  }
  return result;
}

uint64_t sub_1000317AC(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(unsigned __int8 *)(a2[1] + 30);
  id v6 = (uint64_t *)(a3 + 8);
  id v7 = sub_100032468((uint64_t)a1, a2);
  int v8 = sub_10003AD64(v6);
  unint64_t v9 = sub_10003B204((uint64_t)v6, v8);
  while (sub_10003B258((uint64_t)v6))
  {
    switch(v5)
    {
      case 0:
        uint64_t v10 = sub_10003AE3C(v6);
        goto LABEL_14;
      case 1:
      case 2:
        uint64_t v10 = sub_10003ADB8(v6);
        goto LABEL_14;
      case 3:
        *(float *)&double v11 = sub_10003AC9C(v6);
        [v7 addValue:v11];
        continue;
      case 4:
      case 5:
        uint64_t v10 = sub_10003AD7C(v6);
        goto LABEL_14;
      case 6:
        [v7 addValue:sub_10003AC60(v6)];
        continue;
      case 7:
      case 11:
        uint64_t v10 = sub_10003AD64(v6);
        goto LABEL_14;
      case 8:
      case 12:
        uint64_t v10 = sub_10003ACD8(v6);
        goto LABEL_14;
      case 9:
        uint64_t v10 = sub_10003ADF4(v6);
        goto LABEL_14;
      case 10:
        uint64_t v10 = sub_10003AE18(v6);
LABEL_14:
        [v7 addValue:v10];
        break;
      case 17:
        uint64_t v12 = sub_10003AD64(v6);
        if ((*(_WORD *)(a2[1] + 28) & 0x1000) != 0 && ![a2 isValidEnumValue:v12]) {
          [(id)sub_100031034(a1) mergeVarintField:*(unsigned int *)(a2[1] + 16) value:v12];
        }
        else {
          [v7 addRawValue:v12];
        }
        break;
      default:
        continue;
    }
  }

  return sub_10003B250((uint64_t)v6, v9);
}

void sub_1000319E4(void *a1, void *a2, uint64_t *a3, uint64_t a4)
{
  int v8 = sub_100032468((uint64_t)a1, a2);
  unint64_t v9 = a3 + 1;
  switch(*(unsigned char *)(a2[1] + 30))
  {
    case 0:
      sub_10003AE3C(v9);
      goto LABEL_10;
    case 1:
    case 2:
      sub_10003ADB8(v9);
      goto LABEL_10;
    case 3:
      *(float *)&double v10 = sub_10003AC9C(v9);
      double v11 = v8;
      goto LABEL_6;
    case 4:
    case 5:
      sub_10003AD7C(v9);
      goto LABEL_27;
    case 6:
      double v10 = sub_10003AC60(v9);
      double v11 = v8;
      goto LABEL_6;
    case 7:
    case 0xB:
      sub_10003AD64(v9);
      goto LABEL_10;
    case 8:
    case 0xC:
      sub_10003ACD8(v9);
      goto LABEL_27;
    case 9:
      sub_10003ADF4(v9);
LABEL_10:
      double v11 = v8;
      goto LABEL_6;
    case 0xA:
      sub_10003AE18(v9);
LABEL_27:
      double v11 = v8;
LABEL_6:
      [v11 addValue:v10];
      return;
    case 0xD:
      uint64_t v12 = sub_10003B110(v9);
      goto LABEL_31;
    case 0xE:
      uint64_t v12 = (void *)sub_10003B00C(v9);
LABEL_31:
      id v14 = v12;
      id v18 = v12;
      uint64_t v13 = v8;
      goto LABEL_32;
    case 0xF:
      id v18 = objc_alloc_init((Class)[a2 msgClass]);
      [a3 readMessage:v18 extensionRegistry:a4];
      goto LABEL_17;
    case 0x10:
      id v18 = objc_alloc_init((Class)[a2 msgClass]);
      [a3 readGroup:*(unsigned int *)(a2[1] + 16) message:v18 extensionRegistry:a4];
LABEL_17:
      uint64_t v13 = v8;
      id v14 = v18;
LABEL_32:
      [v13 addObject:v14];

      break;
    case 0x11:
      uint64_t v15 = sub_10003AD64(v9);
      if ((*(_WORD *)(a2[1] + 28) & 0x1000) != 0 && ![a2 isValidEnumValue:v15])
      {
        CFStringRef v16 = (void *)sub_100031034(a1);
        uint64_t v17 = *(unsigned int *)(a2[1] + 16);
        [v16 mergeVarintField:v17 value:v15];
      }
      else
      {
        [v8 addRawValue:v15];
      }
      break;
    default:
      return;
  }
}

void *sub_100031D34(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)sub_10001432C(a1, (uint64_t)a2);
  if (!v4)
  {
    uint64_t v4 = sub_10003571C(a2, 0);
    sub_1000149B8(a1, a2, v4);
  }
  return v4;
}

void *sub_100032468(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)sub_10001432C(a1, (uint64_t)a2);
  if (!v4)
  {
    uint64_t v4 = sub_100035DC8(a2, 0);
    sub_1000149B8(a1, a2, v4);
  }
  return v4;
}

void sub_100033818(_Unwind_Exception *a1)
{
}

uint64_t sub_100033930(uint64_t a1)
{
  uint64_t result = sub_10001CC4C();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_10003396C(uint64_t a1)
{
  uint64_t result = sub_10001B5C0();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_1000339A8(uint64_t a1)
{
  uint64_t result = sub_10001B5C0();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_1000339E4(uint64_t a1)
{
  uint64_t result = sub_10001B5C0();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_100033A1C(uint64_t a1)
{
  uint64_t result = sub_10001B3E0();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_100033A58(uint64_t a1)
{
  uint64_t result = sub_10001B3E0();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_100033A94(uint64_t a1)
{
  uint64_t result = sub_10001B3E0();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_100033ACC(uint64_t a1, unsigned int a2)
{
  uint64_t result = sub_10001BBEC(a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_100033B08(uint64_t a1, unint64_t a2)
{
  uint64_t result = sub_10001B7C4(a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_100033B44(uint64_t a1, int a2)
{
  uint64_t result = sub_10001C458(a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_100033B80(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_10001C6A0(a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_100033BBC(uint64_t a1, unsigned int a2)
{
  uint64_t result = sub_10001BE44(a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_100033BF8(uint64_t a1, unint64_t a2)
{
  uint64_t result = sub_10001B7C4(a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_100033C34(uint64_t a1, unsigned int a2)
{
  uint64_t result = sub_10001BBEC(a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

BOOL sub_100034E90(uint64_t a1, uint64_t a2)
{
  return sub_10001485C(a2, *(_DWORD *)(a1 + 32), *(_DWORD *)(a1 + 36));
}

void sub_100034EA0(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {
    uint64_t v5 = objc_opt_class();
    if (*(void *)(*(void *)(a1 + 32) + 48)) {
      id v6 = *(const char **)(*(void *)(a1 + 32) + 48);
    }
    else {
      id v6 = 0;
    }
    +[NSException raise:NSInvalidArgumentException, @"%@: %@ can only be set to NO (to clear field).", v5, NSStringFromSelector(v6) format];
  }
  uint64_t v7 = *(void *)(a1 + 32);

  sub_1000145D0(a2, v7);
}

uint64_t sub_100034F7C(uint64_t a1, uint64_t a2)
{
  return sub_1000148A8(a2, *(_DWORD *)(a1 + 32));
}

TransparencyGPBAutocreatedArray *sub_100034F8C(uint64_t a1, objc_class *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = (unint64_t *)(*((void *)a2 + 8) + *(unsigned int *)(v2[1] + 24));
  uint64_t result = (TransparencyGPBAutocreatedArray *)atomic_load(v3);
  if (!result)
  {
    uint64_t result = sub_100035DC8(v2, a2);
    uint64_t v5 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)v3, (unint64_t *)&v5, (unint64_t)result);
    if (v5)
    {
      if (*(unsigned __int8 *)(v2[1] + 30) - 13 >= 4) {
        id v6 = &OBJC_IVAR___TransparencyGPBInt32Array__autocreator;
      }
      else {
        id v6 = &OBJC_IVAR___TransparencyGPBAutocreatedArray__autocreator;
      }
      *(Class *)((char *)&result->super.super.super.isa + *v6) = 0;

      return (TransparencyGPBAutocreatedArray *)v5;
    }
  }
  return result;
}

TransparencyGPBAutocreatedDictionary *sub_100035028(uint64_t a1, objc_class *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = (unint64_t *)(*((void *)a2 + 8) + *(unsigned int *)(v2[1] + 24));
  uint64_t v4 = (TransparencyGPBAutocreatedDictionary *)atomic_load(v3);
  if (!v4)
  {
    uint64_t v4 = sub_10003571C(*(void **)(a1 + 32), a2);
    uint64_t v5 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)v3, (unint64_t *)&v5, (unint64_t)v4);
    if (v5)
    {
      if ([v2 mapKeyDataType] == 14
        && *(unsigned __int8 *)(v2[1] + 30) - 13 < 4)
      {
        id v6 = &OBJC_IVAR___TransparencyGPBAutocreatedDictionary__autocreator;
      }
      else
      {
        id v6 = &OBJC_IVAR___TransparencyGPBInt32Int32Dictionary__autocreator;
      }
      *(Class *)((char *)&v4->super.super.super.isa + *v6) = 0;

      return (TransparencyGPBAutocreatedDictionary *)v5;
    }
  }
  return v4;
}

uint64_t sub_1000350E8(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_100014974(a2, *(void **)(a1 + 32), a3);
}

id sub_1000350F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (void *)sub_10001432C(a2, *(void *)(a1 + 32));

  return [v2 count];
}

CFStringRef sub_10003526C(void *a1, void *a2, uint64_t *a3, uint64_t a4, void *a5)
{
  uint64_t v5 = a1[1];
  int v8 = a3 + 1;
  switch(*(unsigned char *)(v5 + 44))
  {
    case 0:
      id v11 = objc_alloc((Class)NSNumber);
      BOOL v12 = sub_10003AE3C(v8);
      return (const __CFString *)_[v11 initWithBool:v12];
    case 1:
      id v13 = objc_alloc((Class)NSNumber);
      uint64_t v14 = sub_10003ADB8(v8);
      goto LABEL_17;
    case 2:
      id v15 = objc_alloc((Class)NSNumber);
      uint64_t v16 = sub_10003ADB8(v8);
      goto LABEL_15;
    case 3:
      id v17 = objc_alloc((Class)NSNumber);
      sub_10003AC9C(v8);
      return (const __CFString *)_[v17 initWithFloat:v18];
    case 4:
      id v19 = objc_alloc((Class)NSNumber);
      uint64_t v20 = sub_10003AD7C(v8);
      goto LABEL_21;
    case 5:
      id v26 = objc_alloc((Class)NSNumber);
      uint64_t v27 = sub_10003AD7C(v8);
      goto LABEL_39;
    case 6:
      id v28 = objc_alloc((Class)NSNumber);
      sub_10003AC60(v8);
      return (const __CFString *)_[v28 initWithDouble:v29];
    case 7:
      id v15 = objc_alloc((Class)NSNumber);
      uint64_t v16 = sub_10003AD64(v8);
      goto LABEL_15;
    case 8:
      id v26 = objc_alloc((Class)NSNumber);
      uint64_t v27 = sub_10003ACD8(v8);
      goto LABEL_39;
    case 9:
      id v15 = objc_alloc((Class)NSNumber);
      uint64_t v16 = sub_10003ADF4(v8);
LABEL_15:
      uint64_t v21 = v16;
      id v22 = v15;
      goto LABEL_30;
    case 0xA:
      id v26 = objc_alloc((Class)NSNumber);
      uint64_t v27 = sub_10003AE18(v8);
LABEL_39:
      return (const __CFString *)_[v26 initWithLongLong:v27];
    case 0xB:
      id v13 = objc_alloc((Class)NSNumber);
      uint64_t v14 = sub_10003AD64(v8);
LABEL_17:
      return (const __CFString *)_[v13 initWithUnsignedInt:v14];
    case 0xC:
      id v19 = objc_alloc((Class)NSNumber);
      uint64_t v20 = sub_10003ACD8(v8);
LABEL_21:
      return (const __CFString *)_[v19 initWithUnsignedLongLong:v20];
    case 0xD:
      return (const __CFString *)sub_10003B110(a3 + 1);
    case 0xE:
      return sub_10003B00C(a3 + 1);
    case 0xF:
    case 0x10:
      if (a5) {
        id v10 = a5;
      }
      else {
        id v10 = objc_alloc_init((Class)[objc_msgSend(objc_msgSend(objc_msgSend(a1, "msgClass"), "descriptor"), "messageClass")]);
      }
      id v30 = v10;
      if (*(unsigned char *)(v5 + 44) == 16)
      {
        [a3 readGroup:*(unsigned int *)(v5 + 40) message:v10 extensionRegistry:a4];
      }
      else if ((*(unsigned char *)(v5 + 45) & 4) != 0)
      {
        [v10 mergeFromCodedInputStream:a3 extensionRegistry:a4];
      }
      else
      {
        [a3 readMessage:v10 extensionRegistry:a4];
      }
      return (const __CFString *)v30;
    case 0x11:
      uint64_t v24 = sub_10003AD64(a3 + 1);
      id v25 = [a1 enumDescriptor];
      if ([v25 isClosed]
        && !((unsigned int (*)(uint64_t))[v25 enumVerifier])(v24))
      {
        [(id)sub_100031034(a2) mergeVarintField:*(unsigned int *)(a1[1] + 40) value:v24];
        return 0;
      }
      else
      {
        id v22 = objc_alloc((Class)NSNumber);
        uint64_t v21 = v24;
LABEL_30:
        return (const __CFString *)_[v22 initWithInt:v21];
      }
    default:
      return 0;
  }
}

TransparencyGPBAutocreatedDictionary *sub_10003571C(void *a1, objc_class *a2)
{
  unsigned int v4 = [a1 mapKeyDataType];
  uint64_t result = 0;
  int v6 = *(unsigned __int8 *)(a1[1] + 30);
  switch(v4)
  {
    case 0u:
      uint64_t result = 0;
      switch(*(unsigned char *)(a1[1] + 30))
      {
        case 0:
          uint64_t v7 = TransparencyGPBBoolBoolDictionary;
          goto LABEL_65;
        case 1:
        case 0xB:
          uint64_t v7 = TransparencyGPBBoolUInt32Dictionary;
          goto LABEL_65;
        case 2:
        case 7:
        case 9:
          uint64_t v7 = TransparencyGPBBoolInt32Dictionary;
          goto LABEL_65;
        case 3:
          uint64_t v7 = TransparencyGPBBoolFloatDictionary;
          goto LABEL_65;
        case 4:
        case 0xC:
          uint64_t v7 = TransparencyGPBBoolUInt64Dictionary;
          goto LABEL_65;
        case 5:
        case 8:
        case 0xA:
          uint64_t v7 = TransparencyGPBBoolInt64Dictionary;
          goto LABEL_65;
        case 6:
          uint64_t v7 = TransparencyGPBBoolDoubleDictionary;
          goto LABEL_65;
        case 0xD:
        case 0xE:
        case 0xF:
          uint64_t v7 = TransparencyGPBBoolObjectDictionary;
          goto LABEL_65;
        case 0x10:
          return result;
        case 0x11:
          int v8 = TransparencyGPBBoolEnumDictionary;
          goto LABEL_74;
        default:
          goto LABEL_66;
      }
    case 1u:
    case 0xBu:
      uint64_t result = 0;
      switch(*(unsigned char *)(a1[1] + 30))
      {
        case 0:
          uint64_t v7 = TransparencyGPBUInt32BoolDictionary;
          goto LABEL_65;
        case 1:
        case 0xB:
          uint64_t v7 = TransparencyGPBUInt32UInt32Dictionary;
          goto LABEL_65;
        case 2:
        case 7:
        case 9:
          uint64_t v7 = TransparencyGPBUInt32Int32Dictionary;
          goto LABEL_65;
        case 3:
          uint64_t v7 = TransparencyGPBUInt32FloatDictionary;
          goto LABEL_65;
        case 4:
        case 0xC:
          uint64_t v7 = TransparencyGPBUInt32UInt64Dictionary;
          goto LABEL_65;
        case 5:
        case 8:
        case 0xA:
          uint64_t v7 = TransparencyGPBUInt32Int64Dictionary;
          goto LABEL_65;
        case 6:
          uint64_t v7 = TransparencyGPBUInt32DoubleDictionary;
          goto LABEL_65;
        case 0xD:
        case 0xE:
        case 0xF:
          uint64_t v7 = TransparencyGPBUInt32ObjectDictionary;
          goto LABEL_65;
        case 0x10:
          return result;
        case 0x11:
          int v8 = TransparencyGPBUInt32EnumDictionary;
          goto LABEL_74;
        default:
          goto LABEL_66;
      }
    case 2u:
    case 7u:
    case 9u:
      uint64_t result = 0;
      switch(*(unsigned char *)(a1[1] + 30))
      {
        case 0:
          uint64_t v7 = TransparencyGPBInt32BoolDictionary;
          goto LABEL_65;
        case 1:
        case 0xB:
          uint64_t v7 = TransparencyGPBInt32UInt32Dictionary;
          goto LABEL_65;
        case 2:
        case 7:
        case 9:
          uint64_t v7 = TransparencyGPBInt32Int32Dictionary;
          goto LABEL_65;
        case 3:
          uint64_t v7 = TransparencyGPBInt32FloatDictionary;
          goto LABEL_65;
        case 4:
        case 0xC:
          uint64_t v7 = TransparencyGPBInt32UInt64Dictionary;
          goto LABEL_65;
        case 5:
        case 8:
        case 0xA:
          uint64_t v7 = TransparencyGPBInt32Int64Dictionary;
          goto LABEL_65;
        case 6:
          uint64_t v7 = TransparencyGPBInt32DoubleDictionary;
          goto LABEL_65;
        case 0xD:
        case 0xE:
        case 0xF:
          uint64_t v7 = TransparencyGPBInt32ObjectDictionary;
          goto LABEL_65;
        case 0x10:
          return result;
        case 0x11:
          int v8 = TransparencyGPBInt32EnumDictionary;
          goto LABEL_74;
        default:
          goto LABEL_66;
      }
    case 3u:
    case 6u:
    case 0xDu:
    case 0xFu:
    case 0x10u:
    case 0x11u:
      return result;
    case 4u:
    case 0xCu:
      uint64_t result = 0;
      switch(*(unsigned char *)(a1[1] + 30))
      {
        case 0:
          uint64_t v7 = TransparencyGPBUInt64BoolDictionary;
          goto LABEL_65;
        case 1:
        case 0xB:
          uint64_t v7 = TransparencyGPBUInt64UInt32Dictionary;
          goto LABEL_65;
        case 2:
        case 7:
        case 9:
          uint64_t v7 = TransparencyGPBUInt64Int32Dictionary;
          goto LABEL_65;
        case 3:
          uint64_t v7 = TransparencyGPBUInt64FloatDictionary;
          goto LABEL_65;
        case 4:
        case 0xC:
          uint64_t v7 = TransparencyGPBUInt64UInt64Dictionary;
          goto LABEL_65;
        case 5:
        case 8:
        case 0xA:
          uint64_t v7 = TransparencyGPBUInt64Int64Dictionary;
          goto LABEL_65;
        case 6:
          uint64_t v7 = TransparencyGPBUInt64DoubleDictionary;
          goto LABEL_65;
        case 0xD:
        case 0xE:
        case 0xF:
          uint64_t v7 = TransparencyGPBUInt64ObjectDictionary;
          goto LABEL_65;
        case 0x10:
          return result;
        case 0x11:
          int v8 = TransparencyGPBUInt64EnumDictionary;
          goto LABEL_74;
        default:
          goto LABEL_66;
      }
    case 5u:
    case 8u:
    case 0xAu:
      uint64_t result = 0;
      switch(*(unsigned char *)(a1[1] + 30))
      {
        case 0:
          uint64_t v7 = TransparencyGPBInt64BoolDictionary;
          goto LABEL_65;
        case 1:
        case 0xB:
          uint64_t v7 = TransparencyGPBInt64UInt32Dictionary;
          goto LABEL_65;
        case 2:
        case 7:
        case 9:
          uint64_t v7 = TransparencyGPBInt64Int32Dictionary;
          goto LABEL_65;
        case 3:
          uint64_t v7 = TransparencyGPBInt64FloatDictionary;
          goto LABEL_65;
        case 4:
        case 0xC:
          uint64_t v7 = TransparencyGPBInt64UInt64Dictionary;
          goto LABEL_65;
        case 5:
        case 8:
        case 0xA:
          uint64_t v7 = TransparencyGPBInt64Int64Dictionary;
          goto LABEL_65;
        case 6:
          uint64_t v7 = TransparencyGPBInt64DoubleDictionary;
          goto LABEL_65;
        case 0xD:
        case 0xE:
        case 0xF:
          uint64_t v7 = TransparencyGPBInt64ObjectDictionary;
          goto LABEL_65;
        case 0x10:
          return result;
        case 0x11:
          int v8 = TransparencyGPBInt64EnumDictionary;
          goto LABEL_74;
        default:
          goto LABEL_66;
      }
    case 0xEu:
      uint64_t result = 0;
      switch(*(unsigned char *)(a1[1] + 30))
      {
        case 0:
          uint64_t v7 = TransparencyGPBStringBoolDictionary;
          goto LABEL_65;
        case 1:
        case 0xB:
          uint64_t v7 = TransparencyGPBStringUInt32Dictionary;
          goto LABEL_65;
        case 2:
        case 7:
        case 9:
          uint64_t v7 = TransparencyGPBStringInt32Dictionary;
          goto LABEL_65;
        case 3:
          uint64_t v7 = TransparencyGPBStringFloatDictionary;
          goto LABEL_65;
        case 4:
        case 0xC:
          uint64_t v7 = TransparencyGPBStringUInt64Dictionary;
          goto LABEL_65;
        case 5:
        case 8:
        case 0xA:
          uint64_t v7 = TransparencyGPBStringInt64Dictionary;
          goto LABEL_65;
        case 6:
          uint64_t v7 = TransparencyGPBStringDoubleDictionary;
LABEL_65:
          uint64_t result = (TransparencyGPBAutocreatedDictionary *)objc_alloc_init(v7);
          goto LABEL_66;
        case 0xD:
        case 0xE:
        case 0xF:
          if (a2)
          {
            uint64_t result = objc_alloc_init(TransparencyGPBAutocreatedDictionary);
            goto LABEL_69;
          }
          uint64_t result = (TransparencyGPBAutocreatedDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          break;
        case 0x10:
          return result;
        case 0x11:
          int v8 = TransparencyGPBStringEnumDictionary;
LABEL_74:
          uint64_t result = (TransparencyGPBAutocreatedDictionary *)[[[v8 alloc] initWithValidationFunction:[objc_msgSend(objc_msgSend(a1, "enumDescriptor"), "enumVerifier")]]
          if (a2) {
            goto LABEL_67;
          }
          return result;
        default:
          goto LABEL_66;
      }
      break;
    default:
LABEL_66:
      if (a2)
      {
LABEL_67:
        if (v4 == 14 && (v6 - 13) <= 3) {
LABEL_69:
        }
          unint64_t v9 = &OBJC_IVAR___TransparencyGPBAutocreatedDictionary__autocreator;
        else {
          unint64_t v9 = &OBJC_IVAR___TransparencyGPBInt32Int32Dictionary__autocreator;
        }
        *(Class *)((char *)&result->super.super.super.isa + *v9) = a2;
      }
      break;
  }
  return result;
}

TransparencyGPBAutocreatedArray *sub_100035DC8(void *a1, objc_class *a2)
{
  int v3 = *(unsigned __int8 *)(a1[1] + 30);
  switch(*(unsigned char *)(a1[1] + 30))
  {
    case 0:
      uint64_t v5 = TransparencyGPBBoolArray;
      goto LABEL_16;
    case 1:
    case 0xB:
      uint64_t v5 = TransparencyGPBUInt32Array;
      goto LABEL_16;
    case 2:
    case 7:
    case 9:
      uint64_t v5 = TransparencyGPBInt32Array;
      goto LABEL_16;
    case 3:
      uint64_t v5 = TransparencyGPBFloatArray;
      goto LABEL_16;
    case 4:
    case 0xC:
      uint64_t v5 = TransparencyGPBUInt64Array;
      goto LABEL_16;
    case 5:
    case 8:
    case 0xA:
      uint64_t v5 = TransparencyGPBInt64Array;
      goto LABEL_16;
    case 6:
      uint64_t v5 = TransparencyGPBDoubleArray;
LABEL_16:
      uint64_t result = (TransparencyGPBAutocreatedArray *)objc_alloc_init(v5);
      if (a2) {
        goto LABEL_17;
      }
      return result;
    case 0xD:
    case 0xE:
    case 0xF:
    case 0x10:
      if (a2)
      {
        uint64_t result = objc_alloc_init(TransparencyGPBAutocreatedArray);
LABEL_18:
        int v6 = &OBJC_IVAR___TransparencyGPBAutocreatedArray__autocreator;
LABEL_20:
        *(Class *)((char *)&result->super.super.super.isa + *v6) = a2;
      }
      else
      {
        return (TransparencyGPBAutocreatedArray *)objc_alloc_init((Class)NSMutableArray);
      }
      return result;
    case 0x11:
      uint64_t result = [[[TransparencyGPBEnumArray alloc] initWithValidationFunction:objc_msgSend(objc_msgSend(a1, "enumDescriptor"), "enumVerifier")];
      if (!a2) {
        return result;
      }
      goto LABEL_17;
    default:
      uint64_t result = 0;
      if (!a2) {
        return result;
      }
LABEL_17:
      if ((v3 - 13) <= 3) {
        goto LABEL_18;
      }
      int v6 = &OBJC_IVAR___TransparencyGPBInt32Array__autocreator;
      goto LABEL_20;
  }
}

BOOL sub_100035F74(uint64_t a1, uint64_t a2)
{
  return sub_100014E78(a2, *(void **)(a1 + 32));
}

id sub_100035F84(uint64_t a1, uint64_t a2)
{
  return sub_100014C40(a2, *(void **)(a1 + 32));
}

id sub_100035F94(uint64_t a1, uint64_t a2)
{
  return sub_100014C40(a2, *(void **)(a1 + 32));
}

float sub_100035FA4(uint64_t a1, uint64_t a2)
{
  return sub_1000151F0(a2, *(void **)(a1 + 32));
}

id sub_100035FB4(uint64_t a1, uint64_t a2)
{
  return sub_100015074(a2, *(void **)(a1 + 32));
}

id sub_100035FC4(uint64_t a1, uint64_t a2)
{
  return sub_100015074(a2, *(void **)(a1 + 32));
}

double sub_100035FD4(uint64_t a1, uint64_t a2)
{
  return sub_100015388(a2, *(void **)(a1 + 32));
}

id sub_100035FE4(uint64_t a1, uint64_t a2)
{
  return sub_100014C40(a2, *(void **)(a1 + 32));
}

id sub_100035FF4(uint64_t a1, uint64_t a2)
{
  return sub_100015074(a2, *(void **)(a1 + 32));
}

id sub_100036004(uint64_t a1, uint64_t a2)
{
  return sub_100014C40(a2, *(void **)(a1 + 32));
}

id sub_100036014(uint64_t a1, uint64_t a2)
{
  return sub_100015074(a2, *(void **)(a1 + 32));
}

id sub_100036024(uint64_t a1, uint64_t a2)
{
  return sub_100014C40(a2, *(void **)(a1 + 32));
}

id sub_100036034(uint64_t a1, uint64_t a2)
{
  return sub_100015074(a2, *(void **)(a1 + 32));
}

void *sub_100036044(uint64_t a1, uint64_t a2)
{
  return sub_10002ED6C(a2, *(void **)(a1 + 32));
}

void *sub_100036054(uint64_t a1, uint64_t a2)
{
  return sub_10002ED6C(a2, *(void **)(a1 + 32));
}

void *sub_100036064(uint64_t a1, uint64_t a2)
{
  return sub_10002ED6C(a2, *(void **)(a1 + 32));
}

void *sub_100036074(uint64_t a1, uint64_t a2)
{
  return sub_10002ED6C(a2, *(void **)(a1 + 32));
}

uint64_t sub_100036084(uint64_t a1, uint64_t a2)
{
  return sub_100014BE0(a2, *(void **)(a1 + 32));
}

id sub_100036094(uint64_t a1, void *a2, int a3)
{
  return sub_100014F30(a2, *(void *)(a1 + 32), a3);
}

id sub_1000360A4(uint64_t a1, void *a2, int a3)
{
  return sub_100014D78(a2, *(void *)(a1 + 32), a3);
}

id sub_1000360B4(uint64_t a1, void *a2, int a3)
{
  return sub_100014D78(a2, *(void *)(a1 + 32), a3);
}

id sub_1000360C4(uint64_t a1, void *a2, float a3)
{
  return sub_10001528C(a2, *(void *)(a1 + 32), a3);
}

id sub_1000360D4(uint64_t a1, void *a2, uint64_t a3)
{
  return sub_1000150F8(a2, *(void *)(a1 + 32), a3);
}

id sub_1000360E4(uint64_t a1, void *a2, uint64_t a3)
{
  return sub_1000150F8(a2, *(void *)(a1 + 32), a3);
}

id sub_1000360F4(uint64_t a1, void *a2, double a3)
{
  return sub_100015424(a2, *(void *)(a1 + 32), a3);
}

id sub_100036104(uint64_t a1, void *a2, int a3)
{
  return sub_100014D78(a2, *(void *)(a1 + 32), a3);
}

id sub_100036114(uint64_t a1, void *a2, uint64_t a3)
{
  return sub_1000150F8(a2, *(void *)(a1 + 32), a3);
}

id sub_100036124(uint64_t a1, void *a2, int a3)
{
  return sub_100014D78(a2, *(void *)(a1 + 32), a3);
}

id sub_100036134(uint64_t a1, void *a2, uint64_t a3)
{
  return sub_1000150F8(a2, *(void *)(a1 + 32), a3);
}

id sub_100036144(uint64_t a1, void *a2, int a3)
{
  return sub_100014D78(a2, *(void *)(a1 + 32), a3);
}

id sub_100036154(uint64_t a1, void *a2, uint64_t a3)
{
  return sub_1000150F8(a2, *(void *)(a1 + 32), a3);
}

uint64_t sub_100036164(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned int v4 = *(void **)(a1 + 32);
  id v5 = [a3 copy];

  return sub_1000149B8(a2, v4, v5);
}

uint64_t sub_1000361AC(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned int v4 = *(void **)(a1 + 32);
  id v5 = [a3 copy];

  return sub_1000149B8(a2, v4, v5);
}

uint64_t sub_1000361F4(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_100014974(a2, *(void **)(a1 + 32), a3);
}

uint64_t sub_100036204(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_100014974(a2, *(void **)(a1 + 32), a3);
}

id sub_100036214(uint64_t a1, void *a2, uint64_t a3)
{
  return sub_100014CCC(a2, *(void **)(a1 + 32), a3);
}

void sub_100036278(id a1)
{
  qword_1000A7610 = objc_alloc_init(TransparencyIDSConfigBag);

  _objc_release_x1();
}

void sub_100036740(void *key, const __CFDictionary *a2, CFDictionaryRef theDict)
{
  Value = (void *)CFDictionaryGetValue(theDict, key);
  if (Value)
  {
    CFDictionaryApplyFunction(a2, (CFDictionaryApplierFunction)sub_1000367F8, Value);
  }
  else
  {
    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, a2);
    CFDictionarySetValue(theDict, key, MutableCopy);
    CFRelease(MutableCopy);
  }
}

void sub_1000367F8(void *key, void *value, CFMutableDictionaryRef theDict)
{
}

void sub_100036FBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
}

uint64_t sub_100036FEC(uint64_t a1, unint64_t a2)
{
  uint64_t result = sub_10001D9F0(*(_DWORD *)(a1 + 40), a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_100037028(uint64_t a1)
{
  uint64_t result = sub_10001D9A0(*(_DWORD *)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_100037064(uint64_t a1)
{
  uint64_t result = sub_10001D900(*(_DWORD *)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

id sub_10003756C(uint64_t a1, uint64_t a2)
{
  return [[*(id *)(a1 + 32) appendFormat:@"\t%llu\n" withObject:a2];
}

id sub_10003759C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendFormat:@"\t%u\n", a2];
}

id sub_1000375CC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendFormat:@"\t%llu\n", a2];
}

unint64_t sub_100037A74()
{
  if (!atomic_load((unint64_t *)&qword_1000A7618))
  {
    id v1 = +[TransparencyGPBEnumDescriptor allocDescriptorForName:@"TransparencyGPBNullValue" valueNames:"NullValue" values:&unk_100085704 count:1 enumVerifier:sub_100037AF4 flags:0];
    uint64_t v2 = 0;
    atomic_compare_exchange_strong(&qword_1000A7618, (unint64_t *)&v2, (unint64_t)v1);
    if (v2) {
  }
    }
  return atomic_load((unint64_t *)&qword_1000A7618);
}

BOOL sub_100037AF4(int a1)
{
  return a1 == 0;
}

uint64_t sub_100037BFC(uint64_t a1)
{
  id v2 = [[+[TransparencyGPBValue descriptor](TransparencyGPBValue) fieldWithNumber:1];

  return sub_100014E70(a1, v2);
}

id sub_100037C48(void *a1, int a2)
{
  id v4 = [[+[TransparencyGPBValue descriptor](TransparencyGPBValue) fieldWithNumber:1];

  return sub_100014E74(a1, (uint64_t)v4, a2);
}

void sub_100037C9C(uint64_t a1)
{
  id v2 = [(id *)[+[TransparencyGPBValue descriptor](TransparencyGPBValue, "descriptor") oneofs] objectAtIndex:0];

  sub_100014714(a1, v2);
}

void sub_100039048(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100039078(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    int v3 = [*(id *)(a1 + 32) transitionOperation];
    id v4 = [v3 error];

    if (v4)
    {
      id v5 = [v4 domain];
      if ([v5 isEqualToString:@"KTResultOperationError"])
      {
        id v6 = [v4 code];

        if (v6 == (id)3)
        {
          uint64_t v7 = [WeakRetained queue];
          v8[0] = _NSConcreteStackBlock;
          v8[1] = 3221225472;
          v8[2] = sub_1000391A8;
          v8[3] = &unk_10008CEB0;
          id v9 = WeakRetained;
          id v10 = v4;
          dispatch_sync(v7, v8);
        }
      }
      else
      {
      }
    }
  }
}

id sub_1000391A8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onqueuePerformTimeoutWithUnderlyingError:*(void *)(a1 + 40)];
}

void sub_1000391B4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    int v3 = [WeakRetained queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100039260;
    block[3] = &unk_10008CE40;
    id v5 = v2;
    dispatch_async(v3, block);
  }
}

void sub_100039260(uint64_t a1)
{
  id v2 = +[NSError errorWithDomain:@"KTResultOperationError" code:4 description:@"SIGTERM happened"];
  [*(id *)(a1 + 32) _onqueuePerformTimeoutWithUnderlyingError:v2];
}

void sub_10003972C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100039750(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _onqueuePerformTimeoutWithUnderlyingError:0];
}

void sub_10003A938(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_10003A94C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _onqueuePerformTimeoutWithUnderlyingError];
}

id sub_10003AB00(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) completed];
  if ((result & 1) == 0)
  {
    int v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 onqueueStartFinishOperation:v4];
  }
  return result;
}

double sub_10003AC60(void *a1)
{
  sub_10003B0A0(a1, 8);
  uint64_t v2 = a1[2];
  double result = *(double *)(*a1 + v2);
  a1[2] = v2 + 8;
  return result;
}

float sub_10003AC9C(void *a1)
{
  sub_10003B0A0(a1, 4);
  uint64_t v2 = a1[2];
  float result = *(float *)(*a1 + v2);
  a1[2] = v2 + 4;
  return result;
}

uint64_t sub_10003ACDC(uint64_t *a1)
{
  unint64_t v2 = 0;
  uint64_t v3 = 0;
  while (v2 <= 0x3F)
  {
    sub_10003B0A0(a1, 1);
    uint64_t v4 = *a1;
    uint64_t v5 = a1[2];
    a1[2] = v5 + 1;
    LOBYTE(v4) = *(unsigned char *)(v4 + v5);
    v3 |= (v4 & 0x7F) << v2;
    v2 += 7;
    if ((v4 & 0x80) == 0) {
      return v3;
    }
  }
  sub_10003AF14(-105, @"Invalid VarInt64");
  return 0;
}

uint64_t sub_10003AD64(uint64_t *a1)
{
  return sub_10003ACDC(a1);
}

uint64_t sub_10003AD7C(void *a1)
{
  sub_10003B0A0(a1, 8);
  uint64_t v2 = a1[2];
  uint64_t result = *(void *)(*a1 + v2);
  a1[2] = v2 + 8;
  return result;
}

uint64_t sub_10003ADB8(void *a1)
{
  sub_10003B0A0(a1, 4);
  uint64_t v2 = a1[2];
  uint64_t result = *(unsigned int *)(*a1 + v2);
  a1[2] = v2 + 4;
  return result;
}

uint64_t sub_10003ADF4(uint64_t *a1)
{
  unsigned int v1 = sub_10003ACDC(a1);
  return -(v1 & 1) ^ (v1 >> 1);
}

unint64_t sub_10003AE18(uint64_t *a1)
{
  unint64_t v1 = sub_10003ACDC(a1);
  return -(uint64_t)(v1 & 1) ^ (v1 >> 1);
}

BOOL sub_10003AE3C(uint64_t *a1)
{
  return sub_10003ACDC(a1) != 0;
}

uint64_t sub_10003AE5C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 == *(void *)(a1 + 8) || v2 == *(void *)(a1 + 24))
  {
    uint64_t v3 = 0;
    *(_DWORD *)(a1 + 32) = 0;
  }
  else
  {
    uint64_t v3 = sub_10003ACDC((uint64_t *)a1);
    *(_DWORD *)(a1 + 32) = v3;
    if (!sub_100027C14(v3))
    {
      sub_10003AF14(-103, @"Invalid wireformat in tag.");
      uint64_t v3 = *(unsigned int *)(a1 + 32);
    }
    if (!sub_100027C0C(v3))
    {
      sub_10003AF14(-103, @"A zero field number on the wire is invalid.");
      return *(unsigned int *)(a1 + 32);
    }
  }
  return v3;
}

BOOL sub_10003AEF0(void *a1)
{
  uint64_t v1 = a1[2];
  return v1 == a1[1] || v1 == a1[3];
}

id sub_10003AF14(uint64_t a1, void *a2)
{
  if ([a2 length])
  {
    CFStringRef v8 = @"Reason";
    id v9 = a2;
    uint64_t v4 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  }
  else
  {
    uint64_t v4 = 0;
  }
  CFStringRef v6 = @"TransparencyGPBCodedInputStreamUnderlyingErrorKey";
  uint64_t v7 = +[NSError errorWithDomain:@"TransparencyGPBCodedInputStreamErrorDomain" code:a1 userInfo:v4];
  return [+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", @"TransparencyGPBCodedInputStreamException", a2, +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1]) raise];
}

CFStringRef sub_10003B00C(uint64_t *a1)
{
  int v2 = sub_10003ACDC(a1);
  if (!v2) {
    return &stru_10008F418;
  }
  sub_10003B0A0(a1, v2);
  CFStringRef result = (const __CFString *)[objc_alloc((Class)NSString) initWithBytes:*a1 + a1[2] length:v2 encoding:4];
  a1[2] += v2;
  if (!result)
  {
    sub_10003AF14(-104, 0);
    return 0;
  }
  return result;
}

void *sub_10003B0A0(void *result, uint64_t a2)
{
  int v2 = result;
  unint64_t v3 = result[2] + a2;
  if (v3 > result[1]) {
    CFStringRef result = sub_10003AF14(-100, 0);
  }
  unint64_t v4 = v2[3];
  if (v3 > v4)
  {
    v2[2] = v4;
    return sub_10003AF14(-101, 0);
  }
  return result;
}

id sub_10003B110(uint64_t *a1)
{
  unsigned int v2 = sub_10003ACDC(a1);
  if ((v2 & 0x80000000) != 0) {
    return 0;
  }
  sub_10003B0A0(a1, v2);
  id result = [objc_alloc((Class)NSData) initWithBytes:*a1 + a1[2] length:v2];
  a1[2] += v2;
  return result;
}

id sub_10003B188(uint64_t *a1)
{
  unsigned int v2 = sub_10003ACDC(a1);
  if ((v2 & 0x80000000) != 0) {
    return 0;
  }
  sub_10003B0A0(a1, v2);
  id result = [objc_alloc((Class)NSData) initWithBytesNoCopy:*a1 + a1[2] length:v2 freeWhenDone:0];
  a1[2] += v2;
  return result;
}

unint64_t sub_10003B204(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a1 + 24);
  unint64_t v4 = *(void *)(a1 + 16) + a2;
  if (v4 > v3) {
    sub_10003AF14(-102, 0);
  }
  *(void *)(a1 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v4;
  return v3;
}

uint64_t sub_10003B250(uint64_t result, uint64_t a2)
{
  *(void *)(result + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t sub_10003B258(uint64_t a1)
{
  return *(void *)(a1 + 24) - *(void *)(a1 + 16);
}

_DWORD *sub_10003B264(_DWORD *result, int a2)
{
  if (result[8] != a2) {
    return sub_10003AF14(-103, @"Unexpected tag read");
  }
  return result;
}

uint64_t sub_10003BB70(void *a1, uint64_t a2)
{
  int v4 = *(unsigned __int8 *)(*(void *)(a2 + 8) + 30);
  id v5 = [a1 keyEnumerator];
  id v6 = [v5 nextObject];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = 0;
    do
    {
      id v9 = [a1 objectForKeyedSubscript:v7];
      id v10 = sub_10001DB48(1, v7);
      id v11 = &v10[(void)sub_10003BC54(v9, v4)];
      v8 += (uint64_t)&v11[sub_10001BE44(v11)];
      id v7 = [v5 nextObject];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v12 = sub_10001E054(*(_DWORD *)(*(void *)(a2 + 8) + 16), 15);
  return v8 + (void)[a1 count] * v12;
}

char *sub_10003BC54(void *a1, int a2)
{
  switch(a2)
  {
    case 13:
      return sub_10001DCF8(2, a1);
    case 14:
      return sub_10001DB48(2, a1);
    case 15:
      return sub_10001DC58(2, a1);
  }
  return 0;
}

id sub_10003BC9C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 8);
  int v6 = *(unsigned __int8 *)(v5 + 30);
  uint64_t v7 = sub_100027BFC(*(_DWORD *)(v5 + 16), 2);
  id v8 = [a2 keyEnumerator];
  id result = [v8 nextObject];
  if (result)
  {
    id v10 = result;
    do
    {
      id v11 = [a2 objectForKeyedSubscript:v10];
      [a1 writeInt32NoTag:v7];
      unsigned int v12 = sub_10001DB48(1, v10);
      [a1 writeInt32NoTag:sub_10003BC54(v11, v6) + v12];
      [a1 writeString:1 value:v10];
      sub_10003BD88(a1, (const char *)v11, v6);
      id result = [v8 nextObject];
      id v10 = result;
    }
    while (result);
  }
  return result;
}

void *sub_10003BD88(void *a1, const char *a2, int a3)
{
  switch(a3)
  {
    case 13:
      return [a1 writeBytes:2 value:a2];
    case 14:
      return [a1 writeString:2 value:a2];
    case 15:
      return [a1 writeMessage:2 value:a2];
  }
  return a1;
}

BOOL sub_10003BDC8(void *a1)
{
  id v1 = [a1 objectEnumerator];
  do
  {
    id v2 = [v1 nextObject];
    id v3 = v2;
  }
  while (v2 && ([v2 isInitialized] & 1) != 0);
  return v3 == 0;
}

void sub_10003BE10(void *a1, uint64_t *a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = [a4 mapKeyDataType];
  int v10 = *(unsigned __int8 *)(a4[1] + 30);
  uint64_t v24 = 0;
  id v25 = 0;
  if (v10 == 17) {
    uint64_t v24 = (__CFString *)[a4 defaultValue];
  }
  int v11 = sub_100027C24((int)v9, 0);
  int v12 = sub_100027BFC(1, v11);
  int v13 = sub_100027C24(v10, 0);
  int v14 = sub_100027BFC(2, v13);
  while (1)
  {
    while (1)
    {
      uint64_t v15 = sub_10003AE5C((uint64_t)(a2 + 1));
      if (v15 == v12)
      {
        uint64_t v16 = (id *)&v25;
        id v17 = a2;
        int v18 = (int)v9;
        goto LABEL_8;
      }
      uint64_t v19 = v15;
      if (v15 != v14) {
        break;
      }
      uint64_t v16 = (id *)&v24;
      id v17 = a2;
      int v18 = v10;
LABEL_8:
      sub_10003C090(v17, v16, v18, a3, a4);
    }
    if (!v15) {
      break;
    }
    if (([a2 skipField:v15] & 1) == 0) {
      goto LABEL_32;
    }
  }
  uint64_t v20 = v25;
  if (v9 == 14 && !v25)
  {
    uint64_t v20 = &stru_10008F418;
    id v25 = v20;
  }
  uint64_t v21 = v24;
  if ((v10 - 13) > 3u || v24) {
    goto LABEL_25;
  }
  switch(v10)
  {
    case 13:
      id v22 = (__CFString *)(id)sub_100013D28();
LABEL_23:
      uint64_t v21 = v22;
      uint64_t v24 = v22;
      goto LABEL_25;
    case 15:
      id v22 = (__CFString *)[a4 msgClass:v19];
      goto LABEL_23;
    case 14:
      id v22 = &stru_10008F418;
      goto LABEL_23;
  }
  uint64_t v21 = 0;
LABEL_25:
  if (v9 == 14 && (v10 - 13) <= 3u)
  {
    [a1 setObject:v21 forKey:v20];
    goto LABEL_34;
  }
  if (v10 == 17
    && (*(_WORD *)(a4[1] + 28) & 0x1000) != 0
    && ![a4 isValidEnumValue:v21])
  {
    [a5 addUnknownMapEntry:*(unsigned int *)(a4[1] + 16) value:[a1 serializedDataForUnknownValue:v21 forKey:&v25 keyDataType:v9]];
  }
  else
  {
    [a1 setTransparencyGPBGenericValue:&v24 forTransparencyGPBGenericValueKey:&v25];
  }
LABEL_32:
  if (((_BYTE)v9 - 13) > 3u) {
    goto LABEL_35;
  }
  uint64_t v20 = v25;
LABEL_34:

LABEL_35:
  if ((v10 - 13) <= 3u) {
}
  }

void sub_10003C090(uint64_t *a1, id *a2, int a3, uint64_t a4, void *a5)
{
  switch(a3)
  {
    case 0:
      *(unsigned char *)a2 = sub_10003AE3C(a1 + 1);
      return;
    case 1:
    case 2:
      int v7 = sub_10003ADB8(a1 + 1);
      goto LABEL_15;
    case 3:
      *(float *)a2 = sub_10003AC9C(a1 + 1);
      return;
    case 4:
    case 5:
      uint64_t v8 = sub_10003AD7C(a1 + 1);
      goto LABEL_12;
    case 6:
      *(double *)a2 = sub_10003AC60(a1 + 1);
      return;
    case 7:
    case 11:
    case 17:
      int v7 = sub_10003AD64(a1 + 1);
      goto LABEL_15;
    case 8:
    case 12:
      uint64_t v8 = sub_10003ACD8(a1 + 1);
      goto LABEL_12;
    case 9:
      int v7 = sub_10003ADF4(a1 + 1);
LABEL_15:
      *(_DWORD *)a2 = v7;
      return;
    case 10:
      uint64_t v8 = sub_10003AE18(a1 + 1);
      goto LABEL_12;
    case 13:

      uint64_t v8 = (uint64_t)sub_10003B110(a1 + 1);
      goto LABEL_12;
    case 14:

      uint64_t v8 = (uint64_t)sub_10003B00C(a1 + 1);
LABEL_12:
      *a2 = (id)v8;
      break;
    case 15:
      id v10 = objc_alloc_init((Class)[a5 msgClass]);
      [a1 readMessage:v10 extensionRegistry:a4];

      *a2 = v10;
      break;
    default:
      return;
  }
}

uint64_t sub_10003C750(unsigned int a1, int a2, int a3)
{
  if (a3 == 1) {
    return sub_10001D9A0(a2);
  }
  if (a3 == 11) {
    return sub_10001DD98(a2, a1);
  }
  return 0;
}

uint64_t sub_10003C9D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%u", a2];
  int v6 = +[NSString stringWithFormat:@"%u", a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_10003D044(unsigned int a1, int a2, int a3)
{
  switch(a3)
  {
    case 2:
      return sub_10001D9A0(a2);
    case 9:
      return sub_10001DE2C(a2, a1);
    case 7:
      return sub_10001DA58(a2, a1);
  }
  return 0;
}

id sub_10003D1E4(id result, uint64_t a2, uint64_t a3, int a4)
{
  switch(a4)
  {
    case 2:
      return _[result writeSFixed32:a3 value:a2];
    case 9:
      return _[result writeSInt32:a3 value:a2];
    case 7:
      return _[result writeInt32:a3 value:a2];
  }
  return result;
}

uint64_t sub_10003D2EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%u", a2];
  int v6 = +[NSString stringWithFormat:@"%d", a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_10003D958(unint64_t a1, int a2, int a3)
{
  if (a3 == 4) {
    return sub_10001D900(a2);
  }
  if (a3 == 12) {
    return sub_10001D9F0(a2, a1);
  }
  return 0;
}

uint64_t sub_10003DBD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%u", a2];
  int v6 = +[NSString stringWithFormat:@"%llu", a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_10003E244(unint64_t a1, int a2, int a3)
{
  switch(a3)
  {
    case 5:
      return sub_10001D900(a2);
    case 10:
      return sub_10001DEC8(a2, a1);
    case 8:
      return sub_10001D9F0(a2, a1);
  }
  return 0;
}

id sub_10003E3E4(id result, uint64_t a2, uint64_t a3, int a4)
{
  switch(a4)
  {
    case 5:
      return _[result writeSFixed64:a3 value:a2];
    case 10:
      return _[result writeSInt64:a3 value:a2];
    case 8:
      return _[result writeInt64:a3 value:a2];
  }
  return result;
}

uint64_t sub_10003E4EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%u", a2];
  int v6 = +[NSString stringWithFormat:@"%lld", a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_10003ED54(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%u", a2];
  if (a3) {
    CFStringRef v6 = @"true";
  }
  else {
    CFStringRef v6 = @"false";
  }
  int v7 = *(uint64_t (**)(uint64_t, NSString *, const __CFString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_10003F5B0(uint64_t a1, uint64_t a2, float a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%u", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%.*g", 6, a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_10003FE2C(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%u", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%.*lg", 15, *(void *)&a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

BOOL sub_100040160(int a1)
{
  return a1 != -72499473;
}

uint64_t sub_1000407C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%u", a2];
  CFStringRef v6 = +[NSNumber numberWithInt:a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSNumber *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_100041400(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%u", a2];
  CFStringRef v6 = *(uint64_t (**)(uint64_t, NSString *, uint64_t))(v4 + 16);

  return v6(v4, v5, a3);
}

uint64_t sub_100041C6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%d", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%u", a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1000424E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%d", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%d", a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_100042D84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%d", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%llu", a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1000435FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%d", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%lld", a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_100043E44(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%d", a2];
  if (a3) {
    CFStringRef v6 = @"true";
  }
  else {
    CFStringRef v6 = @"false";
  }
  int v7 = *(uint64_t (**)(uint64_t, NSString *, const __CFString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_100044680(uint64_t a1, uint64_t a2, float a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%d", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%.*g", 6, a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_100044EDC(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%d", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%.*lg", 15, *(void *)&a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_100045820(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%d", a2];
  CFStringRef v6 = +[NSNumber numberWithInt:a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSNumber *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_10004643C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%d", a2];
  CFStringRef v6 = *(uint64_t (**)(uint64_t, NSString *, uint64_t))(v4 + 16);

  return v6(v4, v5, a3);
}

uint64_t sub_100046CC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%llu", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%u", a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_100047560(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%llu", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%d", a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_100047E18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%llu", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%llu", a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1000486B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%llu", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%lld", a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_100048F20(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%llu", a2];
  if (a3) {
    CFStringRef v6 = @"true";
  }
  else {
    CFStringRef v6 = @"false";
  }
  int v7 = *(uint64_t (**)(uint64_t, NSString *, const __CFString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_10004977C(uint64_t a1, uint64_t a2, float a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%llu", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%.*g", 6, a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_100049FF8(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%llu", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%.*lg", 15, *(void *)&a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_10004A97C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%llu", a2];
  CFStringRef v6 = +[NSNumber numberWithInt:a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSNumber *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_10004B5B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%llu", a2];
  CFStringRef v6 = *(uint64_t (**)(uint64_t, NSString *, uint64_t))(v4 + 16);

  return v6(v4, v5, a3);
}

uint64_t sub_10004BE24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%lld", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%u", a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_10004C69C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%lld", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%d", a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_10004CF34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%lld", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%llu", a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_10004D7AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%lld", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%lld", a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_10004DFFC(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%lld", a2];
  if (a3) {
    CFStringRef v6 = @"true";
  }
  else {
    CFStringRef v6 = @"false";
  }
  int v7 = *(uint64_t (**)(uint64_t, NSString *, const __CFString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_10004E838(uint64_t a1, uint64_t a2, float a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%lld", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%.*g", 6, a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_10004F094(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%lld", a2];
  CFStringRef v6 = +[NSString stringWithFormat:@"%.*lg", 15, *(void *)&a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSString *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_10004F9D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%lld", a2];
  CFStringRef v6 = +[NSNumber numberWithInt:a3];
  int v7 = *(uint64_t (**)(uint64_t, NSString *, NSNumber *))(v4 + 16);

  return v7(v4, v5, v6);
}

uint64_t sub_1000505F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%lld", a2];
  CFStringRef v6 = *(uint64_t (**)(uint64_t, NSString *, uint64_t))(v4 + 16);

  return v6(v4, v5, a3);
}

uint64_t sub_100050E30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%u", a3];
  CFStringRef v6 = *(uint64_t (**)(uint64_t, uint64_t, NSString *))(v4 + 16);

  return v6(v4, a2, v5);
}

uint64_t sub_100051618(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%d", a3];
  CFStringRef v6 = *(uint64_t (**)(uint64_t, uint64_t, NSString *))(v4 + 16);

  return v6(v4, a2, v5);
}

uint64_t sub_100051E20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%llu", a3];
  CFStringRef v6 = *(uint64_t (**)(uint64_t, uint64_t, NSString *))(v4 + 16);

  return v6(v4, a2, v5);
}

uint64_t sub_100052608(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%lld", a3];
  CFStringRef v6 = *(uint64_t (**)(uint64_t, uint64_t, NSString *))(v4 + 16);

  return v6(v4, a2, v5);
}

uint64_t sub_100052DC8(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3) {
    CFStringRef v4 = @"true";
  }
  else {
    CFStringRef v4 = @"false";
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, const __CFString *))(v3 + 16))(v3, a2, v4);
}

uint64_t sub_100053540(uint64_t a1, uint64_t a2, float a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%.*g", 6, a3];
  CFStringRef v6 = *(uint64_t (**)(uint64_t, uint64_t, NSString *))(v4 + 16);

  return v6(v4, a2, v5);
}

uint64_t sub_100053D10(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[NSString stringWithFormat:@"%.*lg", 15, *(void *)&a3];
  CFStringRef v6 = *(uint64_t (**)(uint64_t, uint64_t, NSString *))(v4 + 16);

  return v6(v4, a2, v5);
}

uint64_t sub_1000545BC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, NSNumber *))(v3 + 16);

  return v5(v3, a2, v4);
}

uint64_t sub_100058DB4()
{
  return 0;
}

void sub_100058DC0()
{
}

void sub_100058DE8()
{
  qword_1000A9E60 = (uint64_t)&off_10008E748;
}

uint64_t *sub_100058DFC()
{
  if (qword_1000A7640 != -1) {
    swift_once();
  }
  return &qword_1000A9E60;
}

uint64_t sub_100058E48()
{
  return sub_1000591E4(&qword_1000A7640);
}

void sub_100058E6C(uint64_t a1@<X8>)
{
  sub_100060F54();
  *(void *)a1 = v2;
  *(unsigned char *)(a1 + _Block_object_dispose(&STACK[0x410], 8) = v3;
  *(unsigned char *)(a1 + 9) = v4 & 1;
}

uint64_t sub_100058EA0()
{
  return *(void *)v0;
}

uint64_t sub_100058EA8@<X0>(void *a1@<X8>)
{
  return sub_100059298(&qword_1000A7640, &qword_1000A9E60, a1);
}

void sub_100058ECC(uint64_t a1@<X8>)
{
  sub_100060F54();
  *(void *)a1 = v2;
  *(unsigned char *)(a1 + _Block_object_dispose(&STACK[0x410], 8) = v3;
  *(unsigned char *)(a1 + 9) = v4 & 1;
}

void sub_100058F04(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100058F14(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100067C10();

  return Enum.hash(into:)(a1, a2, v4);
}

BOOL sub_100058F64(uint64_t a1, uint64_t *a2)
{
  return sub_100058F80(*(void *)a1, *(unsigned __int8 *)(a1 + 8), *a2);
}

BOOL sub_100058F80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1 == a3;
}

uint64_t sub_100058FA0(uint64_t a1, char a2)
{
  if (a2) {
    return 0;
  }
  return result;
}

void sub_100058FAC()
{
  qword_1000A9E68 = (uint64_t)&off_10008E7E8;
}

uint64_t *sub_100058FC0()
{
  if (qword_1000A7648 != -1) {
    swift_once();
  }
  return &qword_1000A9E68;
}

uint64_t sub_10005900C()
{
  return sub_1000591E4(&qword_1000A7648);
}

uint64_t sub_100059030@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = result;
  *(unsigned char *)(a2 + _Block_object_dispose(&STACK[0x410], 8) = result == 0;
  *(unsigned char *)(a2 + 9) = 0;
  return result;
}

uint64_t sub_100059048()
{
  if (v0[8]) {
    return 0;
  }
  else {
    return *(void *)v0;
  }
}

uint64_t sub_100059060@<X0>(void *a1@<X8>)
{
  return sub_100059298(&qword_1000A7648, &qword_1000A9E68, a1);
}

void *sub_100059084@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2 = *result == 0;
  *(void *)a2 = *result;
  char v3 = v2;
  *(unsigned char *)(a2 + _Block_object_dispose(&STACK[0x410], 8) = v3;
  *(unsigned char *)(a2 + 9) = 0;
  return result;
}

void sub_1000590A0(void *a1@<X8>)
{
  if (*(unsigned char *)(v1 + 8)) {
    *a1 = 0;
  }
  else {
    *a1 = *(void *)v1;
  }
}

uint64_t sub_1000590BC(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100062A08();

  return Enum.hash(into:)(a1, a2, v4);
}

BOOL sub_100059108(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  if (a1[1]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = *a1;
  }
  if (*((unsigned char *)a2 + 8)) {
    uint64_t v2 = 0;
  }
  return v3 == v2;
}

BOOL sub_10005914C(BOOL result, char a2)
{
  if (a2) {
    return result;
  }
  return result;
}

void sub_100059160()
{
  qword_1000A9E70 = (uint64_t)&off_10008E818;
}

uint64_t *sub_100059174()
{
  if (qword_1000A7650 != -1) {
    swift_once();
  }
  return &qword_1000A9E70;
}

uint64_t sub_1000591C0()
{
  return sub_1000591E4(&qword_1000A7650);
}

uint64_t sub_1000591E4(void *a1)
{
  if (*a1 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

void sub_100059230(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + _Block_object_dispose(&STACK[0x410], 8) = 1;
}

unint64_t sub_100059240@<X0>(unint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = result;
  *(unsigned char *)(a2 + _Block_object_dispose(&STACK[0x410], 8) = result < 2;
  *(unsigned char *)(a2 + 9) = 0;
  return result;
}

uint64_t sub_100059258()
{
  if (v0[8]) {
    return *(void *)v0 != 0;
  }
  else {
    return *(void *)v0;
  }
}

uint64_t sub_100059274@<X0>(void *a1@<X8>)
{
  return sub_100059298(&qword_1000A7650, &qword_1000A9E70, a1);
}

uint64_t sub_100059298@<X0>(void *a1@<X2>, void *a2@<X3>, void *a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  *a3 = *a2;

  return swift_bridgeObjectRetain();
}

void *sub_1000592F0@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2 = *result >= 2uLL;
  *(void *)a2 = *result;
  char v3 = !v2;
  *(unsigned char *)(a2 + _Block_object_dispose(&STACK[0x410], 8) = v3;
  *(unsigned char *)(a2 + 9) = 0;
  return result;
}

void sub_10005930C(void *a1@<X8>)
{
  uint64_t v2 = *v1;
  if (*((unsigned char *)v1 + 8)) {
    uint64_t v2 = *v1 != 0;
  }
  *a1 = v2;
}

Swift::Int sub_10005932C()
{
  return Hasher._finalize()();
}

uint64_t sub_100059398(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_1000612D8();

  return Enum.hash(into:)(a1, a2, v4);
}

Swift::Int sub_1000593E4()
{
  return Hasher._finalize()();
}

BOOL sub_10005944C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  if (*((unsigned char *)a1 + 8)) {
    uint64_t v2 = *a1 != 0;
  }
  uint64_t v3 = *a2 != 0;
  if (!*((unsigned char *)a2 + 8)) {
    uint64_t v3 = *a2;
  }
  return v2 == v3;
}

void *sub_100059488()
{
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_100059494()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_10005949C(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v1 = a1;
  return result;
}

uint64_t (*sub_1000594C8())()
{
  return nullsub_8;
}

uint64_t sub_1000594E8()
{
  return 0;
}

uint64_t sub_1000594F4()
{
  uint64_t v1 = *(void *)(v0 + 8);
  sub_100060F68(v1, *(void *)(v0 + 16));
  return v1;
}

uint64_t sub_100059528(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_100060FC0(*(void *)(v2 + 8), *(void *)(v2 + 16));
  *(void *)(v2 + _Block_object_dispose(&STACK[0x410], 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*sub_100059560())()
{
  return nullsub_8;
}

uint64_t (*sub_100059580())()
{
  return nullsub_8;
}

uint64_t sub_1000595A4@<X0>(uint64_t a1@<X8>)
{
  return sub_10005979C(type metadata accessor for SASAnnounce, a1);
}

uint64_t sub_1000595BC(uint64_t a1)
{
  return sub_100059834(a1, type metadata accessor for SASAnnounce);
}

uint64_t (*sub_1000595D4())()
{
  return nullsub_8;
}

uint64_t sub_10005961C@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = &_swiftEmptyArrayStorage;
  *(_OWORD *)(a1 + _Block_object_dispose(&STACK[0x410], 8) = xmmword_100085710;
  *(_OWORD *)(a1 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = xmmword_100085710;
  type metadata accessor for SASAnnounce(0);
  return UnknownStorage.init()();
}

uint64_t sub_10005966C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_100060F68(v1, *(void *)(v0 + 24));
  return v1;
}

uint64_t sub_1000596A0(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_100060FC0(*(void *)(v2 + 16), *(void *)(v2 + 24));
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t (*sub_1000596D8())()
{
  return nullsub_8;
}

uint64_t sub_1000596F8()
{
  uint64_t v1 = *(void *)(v0 + 32);
  sub_100060F68(v1, *(void *)(v0 + 40));
  return v1;
}

uint64_t sub_10005972C(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_100060FC0(*(void *)(v2 + 32), *(void *)(v2 + 40));
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t (*sub_100059764())()
{
  return nullsub_8;
}

uint64_t sub_100059784@<X0>(uint64_t a1@<X8>)
{
  return sub_10005979C(type metadata accessor for SASCommit, a1);
}

uint64_t sub_10005979C@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1(0) + 28);
  uint64_t v5 = type metadata accessor for UnknownStorage();
  CFStringRef v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t sub_10005981C(uint64_t a1)
{
  return sub_100059834(a1, type metadata accessor for SASCommit);
}

uint64_t sub_100059834(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v4 = v2 + *(int *)(a2(0) + 28);
  uint64_t v5 = type metadata accessor for UnknownStorage();
  CFStringRef v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);

  return v6(v4, a1, v5);
}

uint64_t (*sub_1000598B0())()
{
  return nullsub_8;
}

uint64_t sub_1000598F8@<X0>(_OWORD *a1@<X8>)
{
  return sub_100059E00((void (*)(void))type metadata accessor for SASCommit, a1);
}

uint64_t sub_100059910@<X0>(uint64_t a1@<X8>)
{
  return sub_10005A744(type metadata accessor for SASSelected, a1);
}

uint64_t sub_100059928(uint64_t a1)
{
  return sub_10005A7DC(a1, type metadata accessor for SASSelected);
}

uint64_t (*sub_100059940())()
{
  return nullsub_8;
}

uint64_t sub_100059988@<X0>(_OWORD *a1@<X8>)
{
  *a1 = xmmword_100085710;
  type metadata accessor for SASSelected(0);
  return UnknownStorage.init()();
}

uint64_t sub_1000599C8()
{
  return *(void *)(v0 + 16);
}

uint64_t sub_1000599D4(uint64_t result, char a2)
{
  *(void *)(v2 + 16) = result;
  *(unsigned char *)(v2 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2 & 1;
  return result;
}

uint64_t sub_1000599E4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for SASTeardown(0) + 24);
  uint64_t v4 = type metadata accessor for UnknownStorage();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t sub_100059A5C(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for SASTeardown(0) + 24);
  uint64_t v4 = type metadata accessor for UnknownStorage();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);

  return v5(v3, a1, v4);
}

uint64_t (*sub_100059AD4())()
{
  return nullsub_8;
}

uint64_t sub_100059B1C@<X0>(uint64_t a1@<X8>)
{
  *(_OWORD *)a1 = xmmword_100085710;
  *(void *)(a1 + 16) = 0;
  *(unsigned char *)(a1 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  type metadata accessor for SASTeardown(0);
  return UnknownStorage.init()();
}

uint64_t sub_100059B68()
{
  uint64_t v1 = *(void *)(v0 + 48);
  sub_100060F68(v1, *(void *)(v0 + 56));
  return v1;
}

uint64_t sub_100059B9C(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_100060FC0(*(void *)(v2 + 48), *(void *)(v2 + 56));
  *(void *)(v2 + 4_Block_object_dispose(&STACK[0x410], 8) = a1;
  *(void *)(v2 + 56) = a2;
  return result;
}

uint64_t (*sub_100059BD4())()
{
  return nullsub_8;
}

uint64_t sub_100059BF4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for SASSetupB(0) + 32);
  uint64_t v4 = type metadata accessor for UnknownStorage();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t sub_100059C6C(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for SASSetupB(0) + 32);
  uint64_t v4 = type metadata accessor for UnknownStorage();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);

  return v5(v3, a1, v4);
}

uint64_t (*sub_100059CE4())()
{
  return nullsub_8;
}

uint64_t sub_100059D2C@<X0>(_OWORD *a1@<X8>)
{
  *a1 = xmmword_100085710;
  a1[1] = xmmword_100085710;
  a1[2] = xmmword_100085710;
  a1[3] = xmmword_100085710;
  type metadata accessor for SASSetupB(0);
  return UnknownStorage.init()();
}

uint64_t sub_100059D70@<X0>(uint64_t a1@<X8>)
{
  return sub_10005979C(type metadata accessor for SASReveal, a1);
}

uint64_t sub_100059D88(uint64_t a1)
{
  return sub_100059834(a1, type metadata accessor for SASReveal);
}

uint64_t (*sub_100059DA0())()
{
  return nullsub_8;
}

uint64_t sub_100059DE8@<X0>(_OWORD *a1@<X8>)
{
  return sub_100059E00((void (*)(void))type metadata accessor for SASReveal, a1);
}

uint64_t sub_100059E00@<X0>(void (*a1)(void)@<X0>, _OWORD *a2@<X8>)
{
  *a2 = xmmword_100085710;
  a2[1] = xmmword_100085710;
  a2[2] = xmmword_100085710;
  a1(0);
  return UnknownStorage.init()();
}

uint64_t sub_100059E4C()
{
  uint64_t v1 = *(void *)v0;
  sub_100060F68(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t sub_100059E80(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_100060FC0(*(void *)v2, *(void *)(v2 + 8));
  *(void *)uint64_t v2 = a1;
  *(void *)(v2 + _Block_object_dispose(&STACK[0x410], 8) = a2;
  return result;
}

uint64_t sub_100059EB8()
{
  return 0;
}

uint64_t sub_100059EC0()
{
  return *(void *)(v0 + 16);
}

uint64_t sub_100059EC8(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t sub_100059ED0()
{
  uint64_t v1 = *(void *)(v0 + 24);
  sub_100060F68(v1, *(void *)(v0 + 32));
  return v1;
}

uint64_t sub_100059F04(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_100060FC0(*(void *)(v2 + 24), *(void *)(v2 + 32));
  *(void *)(v2 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return result;
}

uint64_t sub_100059F3C@<X0>(uint64_t a1@<X8>)
{
  return sub_10005979C(type metadata accessor for SASConfirm, a1);
}

uint64_t sub_100059F54(uint64_t a1)
{
  return sub_100059834(a1, type metadata accessor for SASConfirm);
}

uint64_t (*sub_100059F6C())()
{
  return nullsub_8;
}

uint64_t sub_100059FB4@<X0>(uint64_t a1@<X8>)
{
  *(_OWORD *)a1 = xmmword_100085710;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  *(void *)(a1 + 32) = 0xC000000000000000;
  type metadata accessor for SASConfirm(0);
  return UnknownStorage.init()();
}

uint64_t sub_10005A000()
{
  return 0;
}

uint64_t sub_10005A00C()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_10005A03C(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t sub_10005A074()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_10005A07C(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a1;
  return result;
}

uint64_t sub_10005A0A8@<X0>(uint64_t a1@<X8>)
{
  return sub_10005979C(type metadata accessor for ErrorDomainCode, a1);
}

uint64_t sub_10005A0C0(uint64_t a1)
{
  return sub_100059834(a1, type metadata accessor for ErrorDomainCode);
}

uint64_t (*sub_10005A0D8())()
{
  return nullsub_8;
}

uint64_t sub_10005A120@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  a1[2] = 0;
  a1[3] = &_swiftEmptyArrayStorage;
  type metadata accessor for ErrorDomainCode(0);
  return UnknownStorage.init()();
}

uint64_t sub_10005A168@<X0>(void *a1@<X8>)
{
  uint64_t v3 = sub_100061118(&qword_1000A6BE0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for IDSFailingDevice(0);
  sub_10006117C(v1 + *(int *)(v6 + 24), (uint64_t)v5);
  uint64_t v7 = type metadata accessor for ErrorDomainCode(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v5, 1, v7) != 1) {
    return sub_1000611E4((uint64_t)v5, (uint64_t)a1);
  }
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  a1[2] = 0;
  a1[3] = &_swiftEmptyArrayStorage;
  UnknownStorage.init()();
  return sub_100067D2C((uint64_t)v5, &qword_1000A6BE0);
}

uint64_t sub_10005A27C(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for IDSFailingDevice(0) + 24);
  sub_100067D2C(v3, &qword_1000A6BE0);
  sub_1000611E4(a1, v3);
  uint64_t v4 = type metadata accessor for ErrorDomainCode(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(v3, 0, 1, v4);
}

void (*sub_10005A314(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  *uint64_t v3 = v1;
  uint64_t v4 = sub_100061118(&qword_1000A6BE0);
  uint64_t v5 = malloc(*(void *)(*(void *)(v4 - 8) + 64));
  v3[1] = v5;
  uint64_t v6 = type metadata accessor for ErrorDomainCode(0);
  v3[2] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = v7;
  v3[3] = v7;
  size_t v9 = *(void *)(v7 + 64);
  v3[4] = malloc(v9);
  id v10 = malloc(v9);
  v3[5] = v10;
  uint64_t v11 = *(int *)(type metadata accessor for IDSFailingDevice(0) + 24);
  *((_DWORD *)v3 + 12) = v11;
  sub_10006117C(v1 + v11, (uint64_t)v5);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v6) == 1)
  {
    void *v10 = 0;
    v10[1] = 0xE000000000000000;
    v10[2] = 0;
    v10[3] = &_swiftEmptyArrayStorage;
    UnknownStorage.init()();
    sub_100067D2C((uint64_t)v5, &qword_1000A6BE0);
  }
  else
  {
    sub_1000611E4((uint64_t)v5, (uint64_t)v10);
  }
  return sub_10005A49C;
}

void sub_10005A49C(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(int *)(*(void *)a1 + 48);
  uint64_t v4 = *(void **)(*(void *)a1 + 32);
  uint64_t v5 = *(void **)(*(void *)a1 + 40);
  uint64_t v6 = *(void *)(*(void *)a1 + 16);
  uint64_t v7 = *(void *)(*(void *)a1 + 24);
  uint64_t v8 = *(void **)(*(void *)a1 + 8);
  uint64_t v9 = **(void **)a1 + v3;
  if (a2)
  {
    sub_100067C64(*(void *)(*(void *)a1 + 40), (uint64_t)v4, type metadata accessor for ErrorDomainCode);
    sub_100067D2C(v9, &qword_1000A6BE0);
    sub_1000611E4((uint64_t)v4, v9);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56))(v9, 0, 1, v6);
    sub_100067CCC((uint64_t)v5, type metadata accessor for ErrorDomainCode);
  }
  else
  {
    sub_100067D2C(**(void **)a1 + v3, &qword_1000A6BE0);
    sub_1000611E4((uint64_t)v5, v9);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56))(v9, 0, 1, v6);
  }
  free(v5);
  free(v4);
  free(v8);

  free(v2);
}

BOOL sub_10005A5C4()
{
  uint64_t v1 = sub_100061118(&qword_1000A6BE0);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for IDSFailingDevice(0);
  sub_10006117C(v0 + *(int *)(v4 + 24), (uint64_t)v3);
  uint64_t v5 = type metadata accessor for ErrorDomainCode(0);
  BOOL v6 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v3, 1, v5) != 1;
  sub_100067D2C((uint64_t)v3, &qword_1000A6BE0);
  return v6;
}

uint64_t sub_10005A6A4()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for IDSFailingDevice(0) + 24);
  sub_100067D2C(v1, &qword_1000A6BE0);
  uint64_t v2 = type metadata accessor for ErrorDomainCode(0);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 1, 1, v2);
}

uint64_t sub_10005A72C@<X0>(uint64_t a1@<X8>)
{
  return sub_10005A744(type metadata accessor for IDSFailingDevice, a1);
}

uint64_t sub_10005A744@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1(0) + 20);
  uint64_t v5 = type metadata accessor for UnknownStorage();
  BOOL v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t sub_10005A7C4(uint64_t a1)
{
  return sub_10005A7DC(a1, type metadata accessor for IDSFailingDevice);
}

uint64_t sub_10005A7DC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v4 = v2 + *(int *)(a2(0) + 20);
  uint64_t v5 = type metadata accessor for UnknownStorage();
  BOOL v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);

  return v6(v4, a1, v5);
}

uint64_t (*sub_10005A858())()
{
  return nullsub_8;
}

uint64_t sub_10005A8A0@<X0>(_OWORD *a1@<X8>)
{
  *a1 = xmmword_100085710;
  uint64_t v2 = type metadata accessor for IDSFailingDevice(0);
  UnknownStorage.init()();
  uint64_t v3 = (char *)a1 + *(int *)(v2 + 24);
  uint64_t v4 = type metadata accessor for ErrorDomainCode(0);
  uint64_t v5 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(v3, 1, 1, v4);
}

uint64_t sub_10005A938@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for ErrorDomainCode(0);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(a1, 1, 1, v2);
}

uint64_t sub_10005A9A4()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_10005A9D4(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t sub_10005AA0C()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_10005AA3C(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t sub_10005AA74()
{
  return *(void *)(v0 + 48);
}

uint64_t sub_10005AA7C(uint64_t result)
{
  *(void *)(v1 + 4_Block_object_dispose(&STACK[0x410], 8) = result;
  return result;
}

uint64_t sub_10005AA84()
{
  return *(void *)(v0 + 56);
}

uint64_t sub_10005AA8C(uint64_t result)
{
  *(void *)(v1 + 56) = result;
  return result;
}

uint64_t (*sub_10005AA94())()
{
  return nullsub_8;
}

uint64_t sub_10005AAB4()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_10005AABC(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 64) = a1;
  return result;
}

uint64_t (*sub_10005AAE8())()
{
  return nullsub_8;
}

uint64_t sub_10005AB08@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for SASTTR(0) + 40);
  uint64_t v4 = type metadata accessor for UnknownStorage();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t sub_10005AB80(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for SASTTR(0) + 40);
  uint64_t v4 = type metadata accessor for UnknownStorage();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);

  return v5(v3, a1, v4);
}

uint64_t (*sub_10005ABF8())()
{
  return nullsub_8;
}

uint64_t sub_10005AC40@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  a1[2] = 0;
  a1[3] = 0xE000000000000000;
  a1[4] = 0;
  a1[5] = 0xE000000000000000;
  a1[6] = 0;
  a1[7] = 0;
  a1[8] = &_swiftEmptyArrayStorage;
  type metadata accessor for SASTTR(0);
  return UnknownStorage.init()();
}

uint64_t sub_10005AC94()
{
  uint64_t v0 = type metadata accessor for _NameMap();
  sub_100067D88(v0, qword_1000A9E78);
  sub_1000612A0(v0, (uint64_t)qword_1000A9E78);
  sub_100061118(&qword_1000A7380);
  uint64_t v1 = (int *)(sub_100061118(&qword_1000A7388) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_100085720;
  unint64_t v4 = v23 + v3;
  unint64_t v5 = v23 + v3 + v1[14];
  *(void *)(v23 + v3) = 0;
  *(void *)unint64_t v5 = "announce";
  *(void *)(v5 + _Block_object_dispose(&STACK[0x410], 8) = 8;
  *(unsigned char *)(v5 + 16) = 2;
  uint64_t v6 = enum case for _NameMap.NameDescription.same(_:);
  uint64_t v7 = type metadata accessor for _NameMap.NameDescription();
  uint64_t v8 = *(void (**)(void))(*(void *)(v7 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v8)(v5, v6, v7);
  unint64_t v9 = v4 + v2 + v1[14];
  *(void *)(v4 + v2) = 1;
  *(void *)unint64_t v9 = "commit";
  *(void *)(v9 + _Block_object_dispose(&STACK[0x410], 8) = 6;
  *(unsigned char *)(v9 + 16) = 2;
  v8();
  id v10 = (void *)(v4 + 2 * v2);
  uint64_t v11 = (char *)v10 + v1[14];
  void *v10 = 2;
  *(void *)uint64_t v11 = "selected";
  *((void *)v11 + 1) = 8;
  v11[16] = 2;
  v8();
  int v12 = (void *)(v4 + 3 * v2);
  int v13 = (char *)v12 + v1[14];
  *int v12 = 3;
  *(void *)int v13 = "teardown";
  *((void *)v13 + 1) = 8;
  v13[16] = 2;
  v8();
  int v14 = (void *)(v4 + 4 * v2);
  uint64_t v15 = (char *)v14 + v1[14];
  void *v14 = 4;
  *(void *)uint64_t v15 = "setupB";
  *((void *)v15 + 1) = 6;
  v15[16] = 2;
  v8();
  uint64_t v16 = (void *)(v4 + 5 * v2);
  id v17 = (char *)v16 + v1[14];
  void *v16 = 5;
  *(void *)id v17 = "revealA";
  *((void *)v17 + 1) = 7;
  v17[16] = 2;
  v8();
  int v18 = (void *)(v4 + 6 * v2);
  uint64_t v19 = (char *)v18 + v1[14];
  void *v18 = 6;
  *(void *)uint64_t v19 = "confirm";
  *((void *)v19 + 1) = 7;
  v19[16] = 2;
  v8();
  uint64_t v20 = (void *)(v4 + 7 * v2);
  uint64_t v21 = (char *)v20 + v1[14];
  void *v20 = 7;
  *(void *)uint64_t v21 = "tapToRadar";
  *((void *)v21 + 1) = 10;
  v21[16] = 2;
  v8();
  return _NameMap.init(dictionaryLiteral:)();
}

uint64_t sub_10005AFC0()
{
  return sub_10005F798(&qword_1000A7658, (uint64_t)qword_1000A9E78);
}

uint64_t sub_10005AFE4@<X0>(uint64_t a1@<X8>)
{
  return sub_10005F810(&qword_1000A7658, (uint64_t)qword_1000A9E78, a1);
}

uint64_t sub_10005B008@<X0>(uint64_t a1@<X8>)
{
  return sub_10005FEF8(&qword_1000A7658, (uint64_t)qword_1000A9E78, a1);
}

uint64_t sub_10005B02C(uint64_t a1)
{
  return sub_10005BF88(a1, qword_1000A9E90, 0, (uint64_t)"newerSession", 12);
}

uint64_t sub_10005B048()
{
  return sub_10005F798(&qword_1000A7660, (uint64_t)qword_1000A9E90);
}

uint64_t sub_10005B06C@<X0>(uint64_t a1@<X8>)
{
  return sub_10005F810(&qword_1000A7660, (uint64_t)qword_1000A9E90, a1);
}

uint64_t sub_10005B090@<X0>(uint64_t a1@<X8>)
{
  return sub_10005FEF8(&qword_1000A7660, (uint64_t)qword_1000A9E90, a1);
}

uint64_t sub_10005B0B4()
{
  uint64_t v0 = type metadata accessor for _NameMap();
  sub_100067D88(v0, qword_1000A9EA8);
  sub_1000612A0(v0, (uint64_t)qword_1000A9EA8);
  sub_100061118(&qword_1000A7380);
  uint64_t v1 = (int *)(sub_100061118(&qword_1000A7388) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100085730;
  unint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *unint64_t v5 = 0;
  *(void *)unint64_t v6 = "HMAC_SHA256_VERSION_1";
  *(void *)(v6 + _Block_object_dispose(&STACK[0x410], 8) = 21;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = enum case for _NameMap.NameDescription.same(_:);
  uint64_t v8 = type metadata accessor for _NameMap.NameDescription();
  unint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  id v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 1;
  *(void *)id v10 = "HMAC_SHA256_VERSION_2";
  *((void *)v10 + 1) = 21;
  v10[16] = 2;
  v9();
  return _NameMap.init(dictionaryLiteral:)();
}

uint64_t sub_10005B26C()
{
  return sub_10005F798(&qword_1000A7668, (uint64_t)qword_1000A9EA8);
}

uint64_t sub_10005B290@<X0>(uint64_t a1@<X8>)
{
  return sub_10005F810(&qword_1000A7668, (uint64_t)qword_1000A9EA8, a1);
}

uint64_t sub_10005B2B4@<X0>(uint64_t a1@<X8>)
{
  return sub_10005FEF8(&qword_1000A7668, (uint64_t)qword_1000A9EA8, a1);
}

const char *sub_10005B2D8()
{
  return "SASAnnounce";
}

uint64_t sub_10005B2E4()
{
  return 0x756F6E6E41534153;
}

uint64_t sub_10005B304()
{
  uint64_t v0 = type metadata accessor for _NameMap();
  sub_100067D88(v0, qword_1000A9EC0);
  sub_1000612A0(v0, (uint64_t)qword_1000A9EC0);
  sub_100061118(&qword_1000A7380);
  uint64_t v1 = (int *)(sub_100061118(&qword_1000A7388) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100085740;
  unint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *unint64_t v5 = 1;
  *(void *)unint64_t v6 = "aProtocolVersion";
  *(void *)(v6 + _Block_object_dispose(&STACK[0x410], 8) = 16;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = enum case for _NameMap.NameDescription.same(_:);
  uint64_t v8 = type metadata accessor for _NameMap.NameDescription();
  unint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  id v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)id v10 = "sessionID";
  *((void *)v10 + 1) = 9;
  v10[16] = 2;
  v9();
  uint64_t v11 = (uint64_t)v5 + 2 * v2 + v1[14];
  *(void *)((char *)v5 + 2 * v2) = 6;
  *(void *)uint64_t v11 = "peerSessionID";
  *(void *)(v11 + _Block_object_dispose(&STACK[0x410], 8) = 13;
  *(unsigned char *)(v11 + 16) = 2;
  v9();
  return _NameMap.init(dictionaryLiteral:)();
}

uint64_t sub_10005B508()
{
  return sub_10005F798(&qword_1000A7670, (uint64_t)qword_1000A9EC0);
}

uint64_t sub_10005B52C@<X0>(uint64_t a1@<X8>)
{
  return sub_10005F810(&qword_1000A7670, (uint64_t)qword_1000A9EC0, a1);
}

uint64_t sub_10005B550()
{
  uint64_t result = dispatch thunk of Decoder.nextFieldNumber()();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 6 || result == 2)
      {
        dispatch thunk of Decoder.decodeSingularBytesField(value:)();
      }
      else if (result == 1)
      {
        sub_1000612D8();
        dispatch thunk of Decoder.decodeRepeatedEnumField<A>(value:)();
      }
      uint64_t result = dispatch thunk of Decoder.nextFieldNumber()();
    }
  }
  return result;
}

uint64_t sub_10005B648()
{
  if (!*(void *)(*v0 + 16)
    || (sub_1000612D8(), uint64_t result = dispatch thunk of Visitor.visitPackedEnumField<A>(value:fieldNumber:)(), !v1))
  {
    uint64_t v3 = v0[1];
    unint64_t v4 = v0[2];
    switch(v4 >> 62)
    {
      case 1uLL:
        if ((int)v3 != v3 >> 32) {
          goto LABEL_9;
        }
        goto LABEL_10;
      case 2uLL:
        if (*(void *)(v3 + 16) != *(void *)(v3 + 24)) {
          goto LABEL_9;
        }
        goto LABEL_10;
      case 3uLL:
        goto LABEL_10;
      default:
        if ((v4 & 0xFF000000000000) == 0) {
          goto LABEL_10;
        }
LABEL_9:
        uint64_t result = dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)();
        if (!v1)
        {
LABEL_10:
          uint64_t v5 = v0[3];
          unint64_t v6 = v0[4];
          switch(v6 >> 62)
          {
            case 1uLL:
              if ((int)v5 != v5 >> 32) {
                goto LABEL_16;
              }
              goto LABEL_17;
            case 2uLL:
              if (*(void *)(v5 + 16) != *(void *)(v5 + 24)) {
                goto LABEL_16;
              }
              goto LABEL_17;
            case 3uLL:
              goto LABEL_17;
            default:
              if ((v6 & 0xFF000000000000) == 0) {
                goto LABEL_17;
              }
LABEL_16:
              uint64_t result = dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)();
              if (!v1)
              {
LABEL_17:
                type metadata accessor for SASAnnounce(0);
                uint64_t result = UnknownStorage.traverse<A>(visitor:)();
              }
              break;
          }
        }
        break;
    }
  }
  return result;
}

Swift::Int sub_10005B808()
{
  return sub_10005FC5C((void (*)(void))type metadata accessor for SASAnnounce, &qword_1000A6BF0, (void (*)(uint64_t))type metadata accessor for SASAnnounce);
}

uint64_t sub_10005B850@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = &_swiftEmptyArrayStorage;
  *(_OWORD *)(a1 + _Block_object_dispose(&STACK[0x410], 8) = xmmword_100085710;
  *(_OWORD *)(a1 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = xmmword_100085710;
  return UnknownStorage.init()();
}

uint64_t (*sub_10005B898())()
{
  return nullsub_8;
}

uint64_t sub_10005B8BC()
{
  return sub_10005B550();
}

uint64_t sub_10005B8D4()
{
  return sub_10005B648();
}

uint64_t sub_10005B8F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000629C0(&qword_1000A7360, (void (*)(uint64_t))type metadata accessor for SASAnnounce);

  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t sub_10005B970@<X0>(uint64_t a1@<X8>)
{
  return sub_10005FEF8(&qword_1000A7670, (uint64_t)qword_1000A9EC0, a1);
}

uint64_t sub_10005B994(uint64_t a1)
{
  uint64_t v2 = sub_1000629C0(&qword_1000A6CD8, (void (*)(uint64_t))type metadata accessor for SASAnnounce);

  return Message.debugDescription.getter(a1, v2);
}

uint64_t sub_10005BA04()
{
  sub_1000629C0(&qword_1000A6CD8, (void (*)(uint64_t))type metadata accessor for SASAnnounce);

  return Message.hash(into:)();
}

const char *sub_10005BA84()
{
  return "SASCommit";
}

uint64_t sub_10005BA90()
{
  return 0x696D6D6F43534153;
}

uint64_t sub_10005BAAC()
{
  uint64_t v0 = type metadata accessor for _NameMap();
  sub_100067D88(v0, qword_1000A9ED8);
  sub_1000612A0(v0, (uint64_t)qword_1000A9ED8);
  sub_100061118(&qword_1000A7380);
  uint64_t v1 = (int *)(sub_100061118(&qword_1000A7388) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100085740;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "sessionID";
  *(void *)(v6 + _Block_object_dispose(&STACK[0x410], 8) = 9;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = enum case for _NameMap.NameDescription.same(_:);
  uint64_t v8 = type metadata accessor for _NameMap.NameDescription();
  unint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  id v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)id v10 = "publicInfo";
  *((void *)v10 + 1) = 10;
  v10[16] = 2;
  v9();
  uint64_t v11 = (uint64_t)v5 + 2 * v2 + v1[14];
  *(void *)((char *)v5 + 2 * v2) = 3;
  *(void *)uint64_t v11 = "aCommitRandom";
  *(void *)(v11 + _Block_object_dispose(&STACK[0x410], 8) = 13;
  *(unsigned char *)(v11 + 16) = 2;
  v9();
  return _NameMap.init(dictionaryLiteral:)();
}

uint64_t sub_10005BCB0()
{
  return sub_10005F798(&qword_1000A7678, (uint64_t)qword_1000A9ED8);
}

uint64_t sub_10005BCD4@<X0>(uint64_t a1@<X8>)
{
  return sub_10005F810(&qword_1000A7678, (uint64_t)qword_1000A9ED8, a1);
}

uint64_t sub_10005BCF8()
{
  return sub_10005D84C();
}

uint64_t sub_10005BD10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10005D920(a1, a2, a3, (void (*)(void))type metadata accessor for SASCommit);
}

uint64_t sub_10005BD3C(uint64_t a1, uint64_t a2)
{
  return sub_10006193C(a1, a2, type metadata accessor for SASCommit) & 1;
}

Swift::Int sub_10005BD6C()
{
  return sub_10005FC5C((void (*)(void))type metadata accessor for SASCommit, &qword_1000A6BF8, (void (*)(uint64_t))type metadata accessor for SASCommit);
}

uint64_t sub_10005BDB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000629C0(&qword_1000A7358, (void (*)(uint64_t))type metadata accessor for SASCommit);

  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t sub_10005BE34@<X0>(uint64_t a1@<X8>)
{
  return sub_10005FEF8(&qword_1000A7678, (uint64_t)qword_1000A9ED8, a1);
}

uint64_t sub_10005BE58(uint64_t a1)
{
  uint64_t v2 = sub_1000629C0(&qword_1000A6CF0, (void (*)(uint64_t))type metadata accessor for SASCommit);

  return Message.debugDescription.getter(a1, v2);
}

uint64_t sub_10005BEC4()
{
  sub_1000629C0(&qword_1000A6CF0, (void (*)(uint64_t))type metadata accessor for SASCommit);

  return Message.hash(into:)();
}

const char *sub_10005BF40()
{
  return "SASSelected";
}

uint64_t sub_10005BF4C()
{
  return 0x63656C6553534153;
}

uint64_t sub_10005BF6C(uint64_t a1)
{
  return sub_10005BF88(a1, qword_1000A9EF0, 1, (uint64_t)"sessionID", 9);
}

uint64_t sub_10005BF88(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = type metadata accessor for _NameMap();
  sub_100067D88(v9, a2);
  sub_1000612A0(v9, (uint64_t)a2);
  sub_100061118(&qword_1000A7380);
  id v10 = (int *)(sub_100061118(&qword_1000A7388) - 8);
  unint64_t v11 = (*(unsigned __int8 *)(*(void *)v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v10 + 80);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_100085750;
  unint64_t v13 = v12 + v11 + v10[14];
  *(void *)(v12 + v11) = a3;
  *(void *)unint64_t v13 = a4;
  *(void *)(v13 + _Block_object_dispose(&STACK[0x410], 8) = a5;
  *(unsigned char *)(v13 + 16) = 2;
  uint64_t v14 = enum case for _NameMap.NameDescription.same(_:);
  uint64_t v15 = type metadata accessor for _NameMap.NameDescription();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 104))(v13, v14, v15);
  return _NameMap.init(dictionaryLiteral:)();
}

uint64_t sub_10005C0EC()
{
  return sub_10005F798(&qword_1000A7680, (uint64_t)qword_1000A9EF0);
}

uint64_t sub_10005C110@<X0>(uint64_t a1@<X8>)
{
  return sub_10005F810(&qword_1000A7680, (uint64_t)qword_1000A9EF0, a1);
}

uint64_t sub_10005C134()
{
  while (1)
  {
    uint64_t result = dispatch thunk of Decoder.nextFieldNumber()();
    if (v0 || (v2 & 1) != 0) {
      break;
    }
    if (result == 1) {
      dispatch thunk of Decoder.decodeSingularBytesField(value:)();
    }
  }
  return result;
}

uint64_t sub_10005C1A4()
{
  uint64_t v2 = *v0;
  unint64_t v3 = v0[1];
  switch(v3 >> 62)
  {
    case 1uLL:
      if ((int)v2 != v2 >> 32) {
        goto LABEL_7;
      }
      goto LABEL_8;
    case 2uLL:
      if (*(void *)(v2 + 16) != *(void *)(v2 + 24)) {
        goto LABEL_7;
      }
      goto LABEL_8;
    case 3uLL:
      goto LABEL_8;
    default:
      if ((v3 & 0xFF000000000000) == 0) {
        goto LABEL_8;
      }
LABEL_7:
      uint64_t result = dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)();
      if (!v1)
      {
LABEL_8:
        type metadata accessor for SASSelected(0);
        return UnknownStorage.traverse<A>(visitor:)();
      }
      return result;
  }
}

Swift::Int sub_10005C298()
{
  return sub_10005FC5C((void (*)(void))type metadata accessor for SASSelected, &qword_1000A6C00, (void (*)(uint64_t))type metadata accessor for SASSelected);
}

uint64_t sub_10005C2E0@<X0>(_OWORD *a1@<X8>)
{
  *a1 = xmmword_100085710;
  return UnknownStorage.init()();
}

uint64_t (*sub_10005C314())()
{
  return nullsub_8;
}

uint64_t sub_10005C338()
{
  return sub_10005C134();
}

uint64_t sub_10005C350()
{
  return sub_10005C1A4();
}

uint64_t sub_10005C368(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000629C0(&qword_1000A7350, (void (*)(uint64_t))type metadata accessor for SASSelected);

  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t sub_10005C3E4@<X0>(uint64_t a1@<X8>)
{
  return sub_10005FEF8(&qword_1000A7680, (uint64_t)qword_1000A9EF0, a1);
}

uint64_t sub_10005C408(uint64_t a1)
{
  uint64_t v2 = sub_1000629C0(&qword_1000A6D08, (void (*)(uint64_t))type metadata accessor for SASSelected);

  return Message.debugDescription.getter(a1, v2);
}

uint64_t sub_10005C474()
{
  sub_1000629C0(&qword_1000A6D08, (void (*)(uint64_t))type metadata accessor for SASSelected);

  return Message.hash(into:)();
}

const char *sub_10005C4F0()
{
  return "SASTeardown";
}

uint64_t sub_10005C4FC()
{
  return 0x6472616554534153;
}

uint64_t sub_10005C51C(uint64_t a1)
{
  return sub_10005C53C(a1, qword_1000A9F08, (uint64_t)"sessionID", (uint64_t)"reason", 6);
}

uint64_t sub_10005C53C(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = type metadata accessor for _NameMap();
  sub_100067D88(v7, a2);
  sub_1000612A0(v7, (uint64_t)a2);
  sub_100061118(&qword_1000A7380);
  uint64_t v8 = (int *)(sub_100061118(&qword_1000A7388) - 8);
  uint64_t v9 = *(void *)(*(void *)v8 + 72);
  unint64_t v10 = (*(unsigned __int8 *)(*(void *)v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v8 + 80);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_100085730;
  uint64_t v12 = (void *)(v11 + v10);
  unint64_t v13 = v11 + v10 + v8[14];
  *uint64_t v12 = 1;
  *(void *)unint64_t v13 = a3;
  *(void *)(v13 + _Block_object_dispose(&STACK[0x410], 8) = 9;
  *(unsigned char *)(v13 + 16) = 2;
  uint64_t v14 = enum case for _NameMap.NameDescription.same(_:);
  uint64_t v15 = type metadata accessor for _NameMap.NameDescription();
  uint64_t v16 = *(void (**)(void))(*(void *)(v15 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v16)(v13, v14, v15);
  id v17 = (char *)v12 + v9 + v8[14];
  *(void *)((char *)v12 + v9) = 2;
  *(void *)id v17 = a4;
  *((void *)v17 + 1) = a5;
  v17[16] = 2;
  v16();
  return _NameMap.init(dictionaryLiteral:)();
}

uint64_t sub_10005C6EC()
{
  return sub_10005F798(&qword_1000A7688, (uint64_t)qword_1000A9F08);
}

uint64_t sub_10005C710@<X0>(uint64_t a1@<X8>)
{
  return sub_10005F810(&qword_1000A7688, (uint64_t)qword_1000A9F08, a1);
}

uint64_t sub_10005C734()
{
  uint64_t result = dispatch thunk of Decoder.nextFieldNumber()();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 2)
      {
        sub_100062A08();
        dispatch thunk of Decoder.decodeSingularEnumField<A>(value:)();
      }
      else if (result == 1)
      {
        dispatch thunk of Decoder.decodeSingularBytesField(value:)();
      }
      uint64_t result = dispatch thunk of Decoder.nextFieldNumber()();
    }
  }
  return result;
}

uint64_t sub_10005C818()
{
  uint64_t v2 = *(void *)v0;
  unint64_t v3 = *(void *)(v0 + 8);
  switch(v3 >> 62)
  {
    case 1uLL:
      if ((int)v2 != v2 >> 32) {
        goto LABEL_7;
      }
      goto LABEL_8;
    case 2uLL:
      if (*(void *)(v2 + 16) != *(void *)(v2 + 24)) {
        goto LABEL_7;
      }
      goto LABEL_8;
    case 3uLL:
      goto LABEL_8;
    default:
      if ((v3 & 0xFF000000000000) == 0) {
        goto LABEL_8;
      }
LABEL_7:
      uint64_t result = dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)();
      if (!v1)
      {
LABEL_8:
        if ((*(unsigned char *)(v0 + 24) & 1) != 0
          || !*(void *)(v0 + 16)
          || (sub_100062A08(), uint64_t result = dispatch thunk of Visitor.visitSingularEnumField<A>(value:fieldNumber:)(), !v1))
        {
          type metadata accessor for SASTeardown(0);
          return UnknownStorage.traverse<A>(visitor:)();
        }
      }
      return result;
  }
}

Swift::Int sub_10005C960()
{
  return sub_10005FC5C((void (*)(void))type metadata accessor for SASTeardown, &qword_1000A6C10, (void (*)(uint64_t))type metadata accessor for SASTeardown);
}

uint64_t sub_10005C9A8@<X0>(uint64_t a1@<X8>)
{
  *(_OWORD *)a1 = xmmword_100085710;
  *(void *)(a1 + 16) = 0;
  *(unsigned char *)(a1 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return UnknownStorage.init()();
}

uint64_t sub_10005C9E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 24);
  uint64_t v5 = type metadata accessor for UnknownStorage();
  unint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t sub_10005CA50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 24);
  uint64_t v5 = type metadata accessor for UnknownStorage();
  unint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);

  return v6(v4, a1, v5);
}

uint64_t (*sub_10005CAC0())()
{
  return nullsub_8;
}

uint64_t sub_10005CAE4()
{
  return sub_10005C734();
}

uint64_t sub_10005CAFC()
{
  return sub_10005C818();
}

uint64_t sub_10005CB14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000629C0(&qword_1000A7348, (void (*)(uint64_t))type metadata accessor for SASTeardown);

  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t sub_10005CB90@<X0>(uint64_t a1@<X8>)
{
  return sub_10005FEF8(&qword_1000A7688, (uint64_t)qword_1000A9F08, a1);
}

uint64_t sub_10005CBB4(uint64_t a1)
{
  uint64_t v2 = sub_1000629C0(&qword_1000A6D20, (void (*)(uint64_t))type metadata accessor for SASTeardown);

  return Message.debugDescription.getter(a1, v2);
}

uint64_t sub_10005CC20()
{
  sub_1000629C0(&qword_1000A6D20, (void (*)(uint64_t))type metadata accessor for SASTeardown);

  return Message.hash(into:)();
}

const char *sub_10005CC9C()
{
  return "SASSetupB";
}

uint64_t sub_10005CCA8()
{
  return 0x7075746553534153;
}

uint64_t sub_10005CCC4()
{
  uint64_t v0 = type metadata accessor for _NameMap();
  sub_100067D88(v0, qword_1000A9F20);
  sub_1000612A0(v0, (uint64_t)qword_1000A9F20);
  sub_100061118(&qword_1000A7380);
  uint64_t v1 = (int *)(sub_100061118(&qword_1000A7388) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100085760;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 1;
  *(void *)unint64_t v6 = "sessionID";
  *(void *)(v6 + _Block_object_dispose(&STACK[0x410], 8) = 9;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = enum case for _NameMap.NameDescription.same(_:);
  uint64_t v8 = type metadata accessor for _NameMap.NameDescription();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 2;
  *(void *)unint64_t v10 = "bRandom";
  *(void *)(v10 + _Block_object_dispose(&STACK[0x410], 8) = 7;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  uint64_t v11 = (void *)(v5 + 2 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  *uint64_t v11 = 3;
  *(void *)uint64_t v12 = "publicInfo";
  *((void *)v12 + 1) = 10;
  v12[16] = 2;
  v9();
  unint64_t v13 = (void *)(v5 + 3 * v2);
  uint64_t v14 = (char *)v13 + v1[14];
  *unint64_t v13 = 4;
  *(void *)uint64_t v14 = "peerSessionID";
  *((void *)v14 + 1) = 13;
  v14[16] = 2;
  v9();
  return _NameMap.init(dictionaryLiteral:)();
}

uint64_t sub_10005CEFC()
{
  return sub_10005F798(&qword_1000A7690, (uint64_t)qword_1000A9F20);
}

uint64_t sub_10005CF20@<X0>(uint64_t a1@<X8>)
{
  return sub_10005F810(&qword_1000A7690, (uint64_t)qword_1000A9F20, a1);
}

uint64_t sub_10005CF44()
{
  uint64_t result = dispatch thunk of Decoder.nextFieldNumber()();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
        case 2:
        case 3:
        case 4:
          dispatch thunk of Decoder.decodeSingularBytesField(value:)();
          break;
        default:
          break;
      }
      uint64_t result = dispatch thunk of Decoder.nextFieldNumber()();
    }
  }
  return result;
}

uint64_t sub_10005D024()
{
  uint64_t v2 = *v0;
  unint64_t v3 = v0[1];
  switch(v3 >> 62)
  {
    case 1uLL:
      if ((int)v2 != v2 >> 32) {
        goto LABEL_7;
      }
      goto LABEL_8;
    case 2uLL:
      if (*(void *)(v2 + 16) != *(void *)(v2 + 24)) {
        goto LABEL_7;
      }
      goto LABEL_8;
    case 3uLL:
      goto LABEL_8;
    default:
      if ((v3 & 0xFF000000000000) == 0) {
        goto LABEL_8;
      }
LABEL_7:
      uint64_t result = dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)();
      if (!v1)
      {
LABEL_8:
        uint64_t v5 = v0[2];
        unint64_t v6 = v0[3];
        switch(v6 >> 62)
        {
          case 1uLL:
            if ((int)v5 != v5 >> 32) {
              goto LABEL_14;
            }
            goto LABEL_15;
          case 2uLL:
            if (*(void *)(v5 + 16) != *(void *)(v5 + 24)) {
              goto LABEL_14;
            }
            goto LABEL_15;
          case 3uLL:
            goto LABEL_15;
          default:
            if ((v6 & 0xFF000000000000) == 0) {
              goto LABEL_15;
            }
LABEL_14:
            uint64_t result = dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)();
            if (!v1)
            {
LABEL_15:
              uint64_t v7 = v0[4];
              unint64_t v8 = v0[5];
              switch(v8 >> 62)
              {
                case 1uLL:
                  if ((int)v7 != v7 >> 32) {
                    goto LABEL_21;
                  }
                  goto LABEL_22;
                case 2uLL:
                  if (*(void *)(v7 + 16) != *(void *)(v7 + 24)) {
                    goto LABEL_21;
                  }
                  goto LABEL_22;
                case 3uLL:
                  goto LABEL_22;
                default:
                  if ((v8 & 0xFF000000000000) == 0) {
                    goto LABEL_22;
                  }
LABEL_21:
                  uint64_t result = dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)();
                  if (!v1)
                  {
LABEL_22:
                    uint64_t v9 = v0[6];
                    unint64_t v10 = v0[7];
                    switch(v10 >> 62)
                    {
                      case 1uLL:
                        if ((int)v9 != v9 >> 32) {
                          goto LABEL_28;
                        }
                        goto LABEL_29;
                      case 2uLL:
                        if (*(void *)(v9 + 16) != *(void *)(v9 + 24)) {
                          goto LABEL_28;
                        }
                        goto LABEL_29;
                      case 3uLL:
                        goto LABEL_29;
                      default:
                        if ((v10 & 0xFF000000000000) == 0) {
                          goto LABEL_29;
                        }
LABEL_28:
                        uint64_t result = dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)();
                        if (!v1)
                        {
LABEL_29:
                          type metadata accessor for SASSetupB(0);
                          uint64_t result = UnknownStorage.traverse<A>(visitor:)();
                        }
                        break;
                    }
                  }
                  break;
              }
            }
            break;
        }
      }
      return result;
  }
}

Swift::Int sub_10005D2A4()
{
  return sub_10005FC5C((void (*)(void))type metadata accessor for SASSetupB, &qword_1000A6C18, (void (*)(uint64_t))type metadata accessor for SASSetupB);
}

uint64_t sub_10005D2EC@<X0>(_OWORD *a1@<X8>)
{
  *a1 = xmmword_100085710;
  a1[1] = xmmword_100085710;
  a1[2] = xmmword_100085710;
  a1[3] = xmmword_100085710;
  return UnknownStorage.init()();
}

uint64_t sub_10005D31C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 32);
  uint64_t v5 = type metadata accessor for UnknownStorage();
  unint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t sub_10005D38C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 32);
  uint64_t v5 = type metadata accessor for UnknownStorage();
  unint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);

  return v6(v4, a1, v5);
}

uint64_t (*sub_10005D3FC())()
{
  return nullsub_8;
}

uint64_t sub_10005D420()
{
  return sub_10005CF44();
}

uint64_t sub_10005D438()
{
  return sub_10005D024();
}

uint64_t sub_10005D450(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000629C0(&qword_1000A7340, (void (*)(uint64_t))type metadata accessor for SASSetupB);

  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t sub_10005D4CC@<X0>(uint64_t a1@<X8>)
{
  return sub_10005FEF8(&qword_1000A7690, (uint64_t)qword_1000A9F20, a1);
}

uint64_t sub_10005D4F0(uint64_t a1)
{
  uint64_t v2 = sub_1000629C0(&qword_1000A6D38, (void (*)(uint64_t))type metadata accessor for SASSetupB);

  return Message.debugDescription.getter(a1, v2);
}

uint64_t sub_10005D55C()
{
  sub_1000629C0(&qword_1000A6D38, (void (*)(uint64_t))type metadata accessor for SASSetupB);

  return Message.hash(into:)();
}

const char *sub_10005D5D8()
{
  return "SASReveal";
}

uint64_t sub_10005D5E4()
{
  return 0x6165766552534153;
}

uint64_t sub_10005D600()
{
  uint64_t v0 = type metadata accessor for _NameMap();
  sub_100067D88(v0, qword_1000A9F38);
  sub_1000612A0(v0, (uint64_t)qword_1000A9F38);
  sub_100061118(&qword_1000A7380);
  uint64_t v1 = (int *)(sub_100061118(&qword_1000A7388) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100085740;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "sessionID";
  *(void *)(v6 + _Block_object_dispose(&STACK[0x410], 8) = 9;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = enum case for _NameMap.NameDescription.same(_:);
  uint64_t v8 = type metadata accessor for _NameMap.NameDescription();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)unint64_t v10 = "aRandom";
  *((void *)v10 + 1) = 7;
  v10[16] = 2;
  v9();
  uint64_t v11 = (uint64_t)v5 + 2 * v2 + v1[14];
  *(void *)((char *)v5 + 2 * v2) = 3;
  *(void *)uint64_t v11 = "peerSessionID";
  *(void *)(v11 + _Block_object_dispose(&STACK[0x410], 8) = 13;
  *(unsigned char *)(v11 + 16) = 2;
  v9();
  return _NameMap.init(dictionaryLiteral:)();
}

uint64_t sub_10005D804()
{
  return sub_10005F798(&qword_1000A7698, (uint64_t)qword_1000A9F38);
}

uint64_t sub_10005D828@<X0>(uint64_t a1@<X8>)
{
  return sub_10005F810(&qword_1000A7698, (uint64_t)qword_1000A9F38, a1);
}

uint64_t sub_10005D84C()
{
  uint64_t result = dispatch thunk of Decoder.nextFieldNumber()();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 3 || result == 2 || result == 1) {
        dispatch thunk of Decoder.decodeSingularBytesField(value:)();
      }
      uint64_t result = dispatch thunk of Decoder.nextFieldNumber()();
    }
  }
  return result;
}

uint64_t sub_10005D8F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10005D920(a1, a2, a3, (void (*)(void))type metadata accessor for SASReveal);
}

uint64_t sub_10005D920(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  uint64_t v6 = *v4;
  unint64_t v7 = v4[1];
  switch(v7 >> 62)
  {
    case 1uLL:
      if ((int)v6 != v6 >> 32) {
        goto LABEL_7;
      }
      goto LABEL_8;
    case 2uLL:
      if (*(void *)(v6 + 16) != *(void *)(v6 + 24)) {
        goto LABEL_7;
      }
      goto LABEL_8;
    case 3uLL:
      goto LABEL_8;
    default:
      if ((v7 & 0xFF000000000000) == 0) {
        goto LABEL_8;
      }
LABEL_7:
      uint64_t result = dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)();
      if (!v5)
      {
LABEL_8:
        uint64_t v10 = v4[2];
        unint64_t v11 = v4[3];
        switch(v11 >> 62)
        {
          case 1uLL:
            if ((int)v10 != v10 >> 32) {
              goto LABEL_14;
            }
            goto LABEL_15;
          case 2uLL:
            if (*(void *)(v10 + 16) != *(void *)(v10 + 24)) {
              goto LABEL_14;
            }
            goto LABEL_15;
          case 3uLL:
            goto LABEL_15;
          default:
            if ((v11 & 0xFF000000000000) == 0) {
              goto LABEL_15;
            }
LABEL_14:
            uint64_t result = dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)();
            if (!v5)
            {
LABEL_15:
              uint64_t v12 = v4[4];
              unint64_t v13 = v4[5];
              switch(v13 >> 62)
              {
                case 1uLL:
                  if ((int)v12 != v12 >> 32) {
                    goto LABEL_21;
                  }
                  goto LABEL_22;
                case 2uLL:
                  if (*(void *)(v12 + 16) != *(void *)(v12 + 24)) {
                    goto LABEL_21;
                  }
                  goto LABEL_22;
                case 3uLL:
                  goto LABEL_22;
                default:
                  if ((v13 & 0xFF000000000000) == 0) {
                    goto LABEL_22;
                  }
LABEL_21:
                  uint64_t result = dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)();
                  if (!v5)
                  {
LABEL_22:
                    a4(0);
                    uint64_t result = UnknownStorage.traverse<A>(visitor:)();
                  }
                  break;
              }
            }
            break;
        }
      }
      return result;
  }
}

uint64_t sub_10005DB28(uint64_t a1, uint64_t a2)
{
  return sub_10006193C(a1, a2, type metadata accessor for SASReveal) & 1;
}

Swift::Int sub_10005DB58()
{
  return sub_10005FC5C((void (*)(void))type metadata accessor for SASReveal, &qword_1000A6C20, (void (*)(uint64_t))type metadata accessor for SASReveal);
}

uint64_t sub_10005DBA0@<X0>(_OWORD *a1@<X8>)
{
  *a1 = xmmword_100085710;
  a1[1] = xmmword_100085710;
  a1[2] = xmmword_100085710;
  return UnknownStorage.init()();
}

uint64_t sub_10005DBD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000629C0(&qword_1000A7338, (void (*)(uint64_t))type metadata accessor for SASReveal);

  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t sub_10005DC4C@<X0>(uint64_t a1@<X8>)
{
  return sub_10005FEF8(&qword_1000A7698, (uint64_t)qword_1000A9F38, a1);
}

uint64_t sub_10005DC70(uint64_t a1)
{
  uint64_t v2 = sub_1000629C0(&qword_1000A6D50, (void (*)(uint64_t))type metadata accessor for SASReveal);

  return Message.debugDescription.getter(a1, v2);
}

uint64_t sub_10005DCDC()
{
  sub_1000629C0(&qword_1000A6D50, (void (*)(uint64_t))type metadata accessor for SASReveal);

  return Message.hash(into:)();
}

const char *sub_10005DD58()
{
  return "SASConfirm";
}

uint64_t sub_10005DD64()
{
  return 0x69666E6F43534153;
}

uint64_t sub_10005DD80()
{
  uint64_t v0 = type metadata accessor for _NameMap();
  sub_100067D88(v0, qword_1000A9F50);
  sub_1000612A0(v0, (uint64_t)qword_1000A9F50);
  sub_100061118(&qword_1000A7380);
  uint64_t v1 = (int *)(sub_100061118(&qword_1000A7388) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100085740;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "sessionID";
  *(void *)(v6 + _Block_object_dispose(&STACK[0x410], 8) = 9;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = enum case for _NameMap.NameDescription.same(_:);
  uint64_t v8 = type metadata accessor for _NameMap.NameDescription();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)uint64_t v10 = "sentTime";
  *((void *)v10 + 1) = 8;
  v10[16] = 2;
  v9();
  uint64_t v11 = (uint64_t)v5 + 2 * v2 + v1[14];
  *(void *)((char *)v5 + 2 * v2) = 3;
  *(void *)uint64_t v11 = "peerSessionID";
  *(void *)(v11 + _Block_object_dispose(&STACK[0x410], 8) = 13;
  *(unsigned char *)(v11 + 16) = 2;
  v9();
  return _NameMap.init(dictionaryLiteral:)();
}

uint64_t sub_10005DF84()
{
  return sub_10005F798(&qword_1000A76A0, (uint64_t)qword_1000A9F50);
}

uint64_t sub_10005DFA8@<X0>(uint64_t a1@<X8>)
{
  return sub_10005F810(&qword_1000A76A0, (uint64_t)qword_1000A9F50, a1);
}

uint64_t sub_10005DFCC()
{
  uint64_t result = dispatch thunk of Decoder.nextFieldNumber()();
  if (!v0)
  {
    while (1)
    {
      if (v2) {
        return result;
      }
      switch(result)
      {
        case 3:
          goto LABEL_10;
        case 2:
          dispatch thunk of Decoder.decodeSingularInt64Field(value:)();
          break;
        case 1:
LABEL_10:
          dispatch thunk of Decoder.decodeSingularBytesField(value:)();
          break;
      }
      uint64_t result = dispatch thunk of Decoder.nextFieldNumber()();
    }
  }
  return result;
}

uint64_t sub_10005E084()
{
  uint64_t v2 = *v0;
  unint64_t v3 = v0[1];
  switch(v3 >> 62)
  {
    case 1uLL:
      if ((int)v2 != v2 >> 32) {
        goto LABEL_7;
      }
      goto LABEL_8;
    case 2uLL:
      if (*(void *)(v2 + 16) != *(void *)(v2 + 24)) {
        goto LABEL_7;
      }
      goto LABEL_8;
    case 3uLL:
      goto LABEL_8;
    default:
      if ((v3 & 0xFF000000000000) == 0) {
        goto LABEL_8;
      }
LABEL_7:
      uint64_t result = dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)();
      if (!v1)
      {
LABEL_8:
        if (!v0[2] || (uint64_t result = dispatch thunk of Visitor.visitSingularInt64Field(value:fieldNumber:)(), !v1))
        {
          uint64_t v5 = v0[3];
          unint64_t v6 = v0[4];
          switch(v6 >> 62)
          {
            case 1uLL:
              if ((int)v5 != v5 >> 32) {
                goto LABEL_16;
              }
              goto LABEL_17;
            case 2uLL:
              if (*(void *)(v5 + 16) != *(void *)(v5 + 24)) {
                goto LABEL_16;
              }
              goto LABEL_17;
            case 3uLL:
              goto LABEL_17;
            default:
              if ((v6 & 0xFF000000000000) == 0) {
                goto LABEL_17;
              }
LABEL_16:
              uint64_t result = dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)();
              if (!v1)
              {
LABEL_17:
                type metadata accessor for SASConfirm(0);
                uint64_t result = UnknownStorage.traverse<A>(visitor:)();
              }
              break;
          }
        }
      }
      return result;
  }
}

Swift::Int sub_10005E224()
{
  return sub_10005FC5C((void (*)(void))type metadata accessor for SASConfirm, &qword_1000A6C28, (void (*)(uint64_t))type metadata accessor for SASConfirm);
}

uint64_t sub_10005E26C@<X0>(uint64_t a1@<X8>)
{
  *(_OWORD *)a1 = xmmword_100085710;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  *(void *)(a1 + 32) = 0xC000000000000000;
  return UnknownStorage.init()();
}

uint64_t sub_10005E2A4()
{
  return sub_10005DFCC();
}

uint64_t sub_10005E2BC()
{
  return sub_10005E084();
}

uint64_t sub_10005E2D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000629C0(&qword_1000A7330, (void (*)(uint64_t))type metadata accessor for SASConfirm);

  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t sub_10005E350@<X0>(uint64_t a1@<X8>)
{
  return sub_10005FEF8(&qword_1000A76A0, (uint64_t)qword_1000A9F50, a1);
}

uint64_t sub_10005E374(uint64_t a1)
{
  uint64_t v2 = sub_1000629C0(&qword_1000A6D68, (void (*)(uint64_t))type metadata accessor for SASConfirm);

  return Message.debugDescription.getter(a1, v2);
}

uint64_t sub_10005E3E0()
{
  sub_1000629C0(&qword_1000A6D68, (void (*)(uint64_t))type metadata accessor for SASConfirm);

  return Message.hash(into:)();
}

void *sub_10005E45C()
{
  return &unk_1000857F0;
}

uint64_t sub_10005E468()
{
  return 0x6D6F44726F727245;
}

uint64_t sub_10005E48C()
{
  uint64_t v0 = type metadata accessor for _NameMap();
  sub_100067D88(v0, qword_1000A9F68);
  sub_1000612A0(v0, (uint64_t)qword_1000A9F68);
  sub_100061118(&qword_1000A7380);
  uint64_t v1 = (int *)(sub_100061118(&qword_1000A7388) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100085740;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "errorDomain";
  *(void *)(v6 + _Block_object_dispose(&STACK[0x410], 8) = 11;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = enum case for _NameMap.NameDescription.same(_:);
  uint64_t v8 = type metadata accessor for _NameMap.NameDescription();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)uint64_t v10 = "errorCode";
  *((void *)v10 + 1) = 9;
  v10[16] = 2;
  v9();
  uint64_t v11 = (uint64_t)v5 + 2 * v2 + v1[14];
  *(void *)((char *)v5 + 2 * v2) = 3;
  *(void *)uint64_t v11 = "underlyingErrors";
  *(void *)(v11 + _Block_object_dispose(&STACK[0x410], 8) = 16;
  *(unsigned char *)(v11 + 16) = 2;
  v9();
  return _NameMap.init(dictionaryLiteral:)();
}

uint64_t sub_10005E690()
{
  return sub_10005F798(&qword_1000A76A8, (uint64_t)qword_1000A9F68);
}

uint64_t sub_10005E6B4@<X0>(uint64_t a1@<X8>)
{
  return sub_10005F810(&qword_1000A76A8, (uint64_t)qword_1000A9F68, a1);
}

uint64_t sub_10005E6D8()
{
  uint64_t result = dispatch thunk of Decoder.nextFieldNumber()();
  uint64_t v3 = v0;
  if (!v0)
  {
    while (1)
    {
      if (v2) {
        return result;
      }
      if (result == 3) {
        break;
      }
      if (result == 2)
      {
        uint64_t v4 = v3;
        dispatch thunk of Decoder.decodeSingularInt64Field(value:)();
        goto LABEL_5;
      }
      if (result == 1)
      {
        uint64_t v4 = v3;
        dispatch thunk of Decoder.decodeSingularStringField(value:)();
        goto LABEL_5;
      }
LABEL_6:
      uint64_t result = dispatch thunk of Decoder.nextFieldNumber()();
    }
    type metadata accessor for ErrorDomainCode(0);
    sub_1000629C0(&qword_1000A6C30, (void (*)(uint64_t))type metadata accessor for ErrorDomainCode);
    uint64_t v4 = v3;
    dispatch thunk of Decoder.decodeRepeatedMessageField<A>(value:)();
LABEL_5:
    uint64_t v3 = v4;
    goto LABEL_6;
  }
  return result;
}

uint64_t sub_10005E814()
{
  unint64_t v2 = v0[1];
  uint64_t v3 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0) {
    uint64_t v3 = *v0 & 0xFFFFFFFFFFFFLL;
  }
  if (!v3 || (uint64_t result = dispatch thunk of Visitor.visitSingularStringField(value:fieldNumber:)(), !v1))
  {
    if (!v0[2] || (uint64_t result = dispatch thunk of Visitor.visitSingularInt64Field(value:fieldNumber:)(), !v1))
    {
      if (!*(void *)(v0[3] + 16)
        || (type metadata accessor for ErrorDomainCode(0),
            sub_1000629C0(&qword_1000A6C30, (void (*)(uint64_t))type metadata accessor for ErrorDomainCode),
            uint64_t result = dispatch thunk of Visitor.visitRepeatedMessageField<A>(value:fieldNumber:)(),
            !v1))
      {
        type metadata accessor for ErrorDomainCode(0);
        return UnknownStorage.traverse<A>(visitor:)();
      }
    }
  }
  return result;
}

Swift::Int sub_10005E964()
{
  return sub_10005FC5C((void (*)(void))type metadata accessor for ErrorDomainCode, &qword_1000A6C38, (void (*)(uint64_t))type metadata accessor for ErrorDomainCode);
}

uint64_t sub_10005E9AC@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  a1[2] = 0;
  a1[3] = &_swiftEmptyArrayStorage;
  return UnknownStorage.init()();
}

uint64_t sub_10005E9E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 28);
  uint64_t v5 = type metadata accessor for UnknownStorage();
  unint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t sub_10005EA50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 28);
  uint64_t v5 = type metadata accessor for UnknownStorage();
  unint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);

  return v6(v4, a1, v5);
}

uint64_t sub_10005EAC0()
{
  return sub_10005E6D8();
}

uint64_t sub_10005EAD8()
{
  return sub_10005E814();
}

uint64_t sub_10005EAF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000629C0(&qword_1000A7328, (void (*)(uint64_t))type metadata accessor for ErrorDomainCode);

  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t sub_10005EB6C@<X0>(uint64_t a1@<X8>)
{
  return sub_10005FEF8(&qword_1000A76A8, (uint64_t)qword_1000A9F68, a1);
}

uint64_t sub_10005EB90(uint64_t a1)
{
  uint64_t v2 = sub_1000629C0(&qword_1000A6C30, (void (*)(uint64_t))type metadata accessor for ErrorDomainCode);

  return Message.debugDescription.getter(a1, v2);
}

uint64_t sub_10005EBFC()
{
  sub_1000629C0(&qword_1000A6C30, (void (*)(uint64_t))type metadata accessor for ErrorDomainCode);

  return Message.hash(into:)();
}

void *sub_10005EC78()
{
  return &unk_10008E738;
}

unint64_t sub_10005EC84()
{
  return 0xD000000000000010;
}

uint64_t sub_10005ECA0(uint64_t a1)
{
  return sub_10005C53C(a1, qword_1000A9F80, (uint64_t)"pushToken", (uint64_t)"error", 5);
}

uint64_t sub_10005ECC0()
{
  return sub_10005F798(&qword_1000A76B0, (uint64_t)qword_1000A9F80);
}

uint64_t sub_10005ECE4@<X0>(uint64_t a1@<X8>)
{
  return sub_10005F810(&qword_1000A76B0, (uint64_t)qword_1000A9F80, a1);
}

uint64_t sub_10005ED08()
{
  uint64_t result = dispatch thunk of Decoder.nextFieldNumber()();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 2)
      {
        type metadata accessor for IDSFailingDevice(0);
        type metadata accessor for ErrorDomainCode(0);
        sub_1000629C0(&qword_1000A6C30, (void (*)(uint64_t))type metadata accessor for ErrorDomainCode);
        dispatch thunk of Decoder.decodeSingularMessageField<A>(value:)();
      }
      else if (result == 1)
      {
        dispatch thunk of Decoder.decodeSingularBytesField(value:)();
      }
      uint64_t result = dispatch thunk of Decoder.nextFieldNumber()();
    }
  }
  return result;
}

uint64_t sub_10005EE30()
{
  uint64_t v2 = *v0;
  unint64_t v3 = v0[1];
  switch(v3 >> 62)
  {
    case 1uLL:
      if ((int)v2 != v2 >> 32) {
        goto LABEL_7;
      }
      goto LABEL_8;
    case 2uLL:
      if (*(void *)(v2 + 16) != *(void *)(v2 + 24)) {
        goto LABEL_7;
      }
      goto LABEL_8;
    case 3uLL:
      goto LABEL_8;
    default:
      if ((v3 & 0xFF000000000000) == 0) {
        goto LABEL_8;
      }
LABEL_7:
      uint64_t result = dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)();
      if (!v1)
      {
LABEL_8:
        uint64_t result = sub_10005EF40((uint64_t)v0);
        if (!v1)
        {
          type metadata accessor for IDSFailingDevice(0);
          return UnknownStorage.traverse<A>(visitor:)();
        }
      }
      return result;
  }
}

uint64_t sub_10005EF40(uint64_t a1)
{
  uint64_t v2 = sub_100061118(&qword_1000A6BE0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for ErrorDomainCode(0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for IDSFailingDevice(0);
  sub_10006117C(a1 + *(int *)(v9 + 24), (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1) {
    return sub_100067D2C((uint64_t)v4, &qword_1000A6BE0);
  }
  sub_1000611E4((uint64_t)v4, (uint64_t)v8);
  sub_1000629C0(&qword_1000A6C30, (void (*)(uint64_t))type metadata accessor for ErrorDomainCode);
  dispatch thunk of Visitor.visitSingularMessageField<A>(value:fieldNumber:)();
  return sub_100067CCC((uint64_t)v8, type metadata accessor for ErrorDomainCode);
}

Swift::Int sub_10005F12C()
{
  return sub_10005FC5C((void (*)(void))type metadata accessor for IDSFailingDevice, &qword_1000A6C40, (void (*)(uint64_t))type metadata accessor for IDSFailingDevice);
}

uint64_t sub_10005F174@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  *a2 = xmmword_100085710;
  UnknownStorage.init()();
  uint64_t v4 = (char *)a2 + *(int *)(a1 + 24);
  uint64_t v5 = type metadata accessor for ErrorDomainCode(0);
  uint64_t v6 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);

  return v6(v4, 1, 1, v5);
}

uint64_t sub_10005F204@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 20);
  uint64_t v5 = type metadata accessor for UnknownStorage();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t sub_10005F274(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 20);
  uint64_t v5 = type metadata accessor for UnknownStorage();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);

  return v6(v4, a1, v5);
}

uint64_t sub_10005F2E4()
{
  return sub_10005ED08();
}

uint64_t sub_10005F2FC()
{
  return sub_10005EE30();
}

uint64_t sub_10005F314(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000629C0(&qword_1000A7320, (void (*)(uint64_t))type metadata accessor for IDSFailingDevice);

  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t sub_10005F390@<X0>(uint64_t a1@<X8>)
{
  return sub_10005FEF8(&qword_1000A76B0, (uint64_t)qword_1000A9F80, a1);
}

uint64_t sub_10005F3B4(uint64_t a1)
{
  uint64_t v2 = sub_1000629C0(&qword_1000A6C48, (void (*)(uint64_t))type metadata accessor for IDSFailingDevice);

  return Message.debugDescription.getter(a1, v2);
}

uint64_t sub_10005F420()
{
  sub_1000629C0(&qword_1000A6C48, (void (*)(uint64_t))type metadata accessor for IDSFailingDevice);

  return Message.hash(into:)();
}

const char *sub_10005F49C()
{
  return "SASTTR";
}

uint64_t sub_10005F4A8()
{
  return 0x525454534153;
}

uint64_t sub_10005F4BC()
{
  uint64_t v0 = type metadata accessor for _NameMap();
  sub_100067D88(v0, qword_1000A9F98);
  sub_1000612A0(v0, (uint64_t)qword_1000A9F98);
  sub_100061118(&qword_1000A7380);
  uint64_t v1 = (int *)(sub_100061118(&qword_1000A7388) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100085770;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 1;
  *(void *)unint64_t v6 = "unique";
  *(void *)(v6 + _Block_object_dispose(&STACK[0x410], 8) = 6;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = enum case for _NameMap.NameDescription.same(_:);
  uint64_t v8 = type metadata accessor for _NameMap.NameDescription();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 2;
  *(void *)unint64_t v10 = "title";
  *(void *)(v10 + _Block_object_dispose(&STACK[0x410], 8) = 5;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  uint64_t v11 = (void *)(v5 + 2 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  *uint64_t v11 = 3;
  *(void *)uint64_t v12 = "description";
  *((void *)v12 + 1) = 11;
  v12[16] = 2;
  v9();
  unint64_t v13 = (void *)(v5 + 3 * v2);
  uint64_t v14 = (char *)v13 + v1[14];
  *unint64_t v13 = 4;
  *(void *)uint64_t v14 = "relatedRadar";
  *((void *)v14 + 1) = 12;
  v14[16] = 2;
  v9();
  uint64_t v15 = (void *)(v5 + 4 * v2);
  uint64_t v16 = (char *)v15 + v1[14];
  *uint64_t v15 = 5;
  *(void *)uint64_t v16 = "radar";
  *((void *)v16 + 1) = 5;
  v16[16] = 2;
  v9();
  id v17 = (void *)(v5 + 5 * v2);
  int v18 = (char *)v17 + v1[14];
  void *v17 = 6;
  *(void *)int v18 = "idsFailingDevices";
  *((void *)v18 + 1) = 17;
  v18[16] = 2;
  v9();
  return _NameMap.init(dictionaryLiteral:)();
}

uint64_t sub_10005F774()
{
  return sub_10005F798(qword_1000A76B8, (uint64_t)qword_1000A9F98);
}

uint64_t sub_10005F798(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for _NameMap();

  return sub_1000612A0(v3, a2);
}

uint64_t sub_10005F7EC@<X0>(uint64_t a1@<X8>)
{
  return sub_10005F810(qword_1000A76B8, (uint64_t)qword_1000A9F98, a1);
}

uint64_t sub_10005F810@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for _NameMap();
  uint64_t v6 = sub_1000612A0(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

uint64_t sub_10005F8A8()
{
  uint64_t result = dispatch thunk of Decoder.nextFieldNumber()();
  uint64_t v3 = v0;
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
        case 2:
        case 3:
          uint64_t v4 = v3;
          dispatch thunk of Decoder.decodeSingularStringField(value:)();
          goto LABEL_5;
        case 4:
        case 5:
          uint64_t v4 = v3;
          dispatch thunk of Decoder.decodeSingularInt64Field(value:)();
          goto LABEL_5;
        case 6:
          type metadata accessor for IDSFailingDevice(0);
          sub_1000629C0(&qword_1000A6C48, (void (*)(uint64_t))type metadata accessor for IDSFailingDevice);
          uint64_t v4 = v3;
          dispatch thunk of Decoder.decodeRepeatedMessageField<A>(value:)();
LABEL_5:
          uint64_t v3 = v4;
          break;
        default:
          break;
      }
      uint64_t result = dispatch thunk of Decoder.nextFieldNumber()();
    }
  }
  return result;
}

uint64_t sub_10005FA40()
{
  unint64_t v2 = v0[1];
  uint64_t v3 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0) {
    uint64_t v3 = *v0 & 0xFFFFFFFFFFFFLL;
  }
  if (!v3 || (uint64_t result = dispatch thunk of Visitor.visitSingularStringField(value:fieldNumber:)(), !v1))
  {
    unint64_t v5 = v0[3];
    uint64_t v6 = HIBYTE(v5) & 0xF;
    if ((v5 & 0x2000000000000000) == 0) {
      uint64_t v6 = v0[2] & 0xFFFFFFFFFFFFLL;
    }
    if (!v6 || (uint64_t result = dispatch thunk of Visitor.visitSingularStringField(value:fieldNumber:)(), !v1))
    {
      unint64_t v7 = v0[5];
      uint64_t v8 = HIBYTE(v7) & 0xF;
      if ((v7 & 0x2000000000000000) == 0) {
        uint64_t v8 = v0[4] & 0xFFFFFFFFFFFFLL;
      }
      if (!v8 || (uint64_t result = dispatch thunk of Visitor.visitSingularStringField(value:fieldNumber:)(), !v1))
      {
        if (!v0[6] || (uint64_t result = dispatch thunk of Visitor.visitSingularInt64Field(value:fieldNumber:)(), !v1))
        {
          if (!v0[7] || (uint64_t result = dispatch thunk of Visitor.visitSingularInt64Field(value:fieldNumber:)(), !v1))
          {
            if (!*(void *)(v0[8] + 16)
              || (type metadata accessor for IDSFailingDevice(0),
                  sub_1000629C0(&qword_1000A6C48, (void (*)(uint64_t))type metadata accessor for IDSFailingDevice), uint64_t result = dispatch thunk of Visitor.visitRepeatedMessageField<A>(value:fieldNumber:)(), !v1))
            {
              type metadata accessor for SASTTR(0);
              return UnknownStorage.traverse<A>(visitor:)();
            }
          }
        }
      }
    }
  }
  return result;
}

Swift::Int sub_10005FC14()
{
  return sub_10005FC5C((void (*)(void))type metadata accessor for SASTTR, &qword_1000A6C50, (void (*)(uint64_t))type metadata accessor for SASTTR);
}

Swift::Int sub_10005FC5C(void (*a1)(void), unint64_t *a2, void (*a3)(uint64_t))
{
  return Hasher._finalize()();
}

uint64_t sub_10005FCE4@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  a1[2] = 0;
  a1[3] = 0xE000000000000000;
  a1[4] = 0;
  a1[5] = 0xE000000000000000;
  a1[6] = 0;
  a1[7] = 0;
  a1[8] = &_swiftEmptyArrayStorage;
  return UnknownStorage.init()();
}

uint64_t sub_10005FD24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 40);
  uint64_t v5 = type metadata accessor for UnknownStorage();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t sub_10005FD94(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 40);
  uint64_t v5 = type metadata accessor for UnknownStorage();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);

  return v6(v4, a1, v5);
}

uint64_t (*sub_10005FE04())()
{
  return nullsub_8;
}

uint64_t sub_10005FE28()
{
  return sub_10005F8A8();
}

uint64_t sub_10005FE40()
{
  return sub_10005FA40();
}

uint64_t sub_10005FE58(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000629C0(&qword_1000A7318, (void (*)(uint64_t))type metadata accessor for SASTTR);

  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t sub_10005FED4@<X0>(uint64_t a1@<X8>)
{
  return sub_10005FEF8(qword_1000A76B8, (uint64_t)qword_1000A9F98, a1);
}

uint64_t sub_10005FEF8@<X0>(void *a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for _NameMap();
  uint64_t v6 = sub_1000612A0(v5, a2);
  unint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

uint64_t sub_10005FF94(uint64_t a1)
{
  uint64_t v2 = sub_1000629C0((unint64_t *)&qword_1000A6DA0, (void (*)(uint64_t))type metadata accessor for SASTTR);

  return Message.debugDescription.getter(a1, v2);
}

Swift::Int sub_100060000()
{
  return Hasher._finalize()();
}

uint64_t sub_100060058()
{
  sub_1000629C0((unint64_t *)&qword_1000A6DA0, (void (*)(uint64_t))type metadata accessor for SASTTR);

  return Message.hash(into:)();
}

Swift::Int sub_1000600D4()
{
  return Hasher._finalize()();
}

uint64_t sub_100060128@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  unint64_t v7 = (const void *)__s1;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = (a2 >> 32) - (int)a2;
      if (a2 >> 32 < (int)a2)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      sub_100060F68(a2, a3);
      unint64_t v10 = (char *)__DataStorage._bytes.getter();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = __DataStorage._offset.getter();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = __DataStorage._length.getter();
      if (v12 >= v9) {
        size_t v13 = (a2 >> 32) - (int)a2;
      }
      else {
        size_t v13 = v12;
      }
      if (!v7)
      {
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        JUMPOUT(0x10006038CLL);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = sub_100060FC0(a2, a3);
      BOOL v8 = v14 == 0;
LABEL_24:
      char v24 = v8;
LABEL_29:
      *a4 = v24;
      return __s1;
    case 2uLL:
      uint64_t v15 = *(void *)(a2 + 16);
      uint64_t v16 = *(void *)(a2 + 24);
      swift_retain();
      swift_retain();
      id v17 = (char *)__DataStorage._bytes.getter();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = __DataStorage._offset.getter();
      if (__OFSUB__(v15, v18)) {
        goto LABEL_32;
      }
      v17 += v15 - v18;
LABEL_17:
      BOOL v19 = __OFSUB__(v16, v15);
      int64_t v20 = v16 - v15;
      if (v19) {
        goto LABEL_31;
      }
      uint64_t v21 = __DataStorage._length.getter();
      if (v21 >= v20) {
        size_t v22 = v20;
      }
      else {
        size_t v22 = v21;
      }
      if (!v7) {
        goto LABEL_37;
      }
      if (!v17) {
        goto LABEL_38;
      }
      int v23 = memcmp(v7, v17, v22);
      swift_release();
      __s1 = swift_release();
      BOOL v8 = v23 == 0;
      goto LABEL_24;
    case 3uLL:
      if (!__s1) {
        goto LABEL_39;
      }
      char v24 = 1;
      goto LABEL_29;
    default:
      uint64_t __s2 = a2;
      __int16 v26 = a3;
      char v27 = BYTE2(a3);
      char v28 = BYTE3(a3);
      char v29 = BYTE4(a3);
      char v30 = BYTE5(a3);
      if (__s1)
      {
        __s1 = memcmp((const void *)__s1, &__s2, BYTE6(a3));
        BOOL v8 = __s1 == 0;
        goto LABEL_24;
      }
      __break(1u);
      goto LABEL_35;
  }
}

uint64_t sub_10006039C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ErrorDomainCode(0);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  unint64_t v7 = (char *)&v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100061118(&qword_1000A6BE0);
  __chkstk_darwin(v8 - 8);
  unint64_t v10 = (char *)&v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = sub_100061118(&qword_1000A7378);
  __chkstk_darwin(v65);
  uint64_t v12 = (char *)&v55 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = type metadata accessor for IDSFailingDevice(0);
  uint64_t v13 = __chkstk_darwin(v67);
  uint64_t v15 = (uint64_t *)((char *)&v55 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v13);
  uint64_t v18 = (uint64_t *)((char *)&v55 - v17);
  uint64_t v19 = *(void *)(a1 + 16);
  if (v19 != *(void *)(a2 + 16)) {
    goto LABEL_55;
  }
  if (!v19 || a1 == a2)
  {
    char v52 = 1;
    return v52 & 1;
  }
  uint64_t v63 = v4;
  v64 = v12;
  uint64_t v58 = v7;
  v59 = v10;
  unint64_t v20 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v61 = 0;
  id v62 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  uint64_t v60 = *(void *)(v16 + 72);
  uint64_t v21 = v19 - 1;
  uint64_t v56 = a2;
  uint64_t v57 = a1;
  while (2)
  {
    sub_100067C64(a1 + v20, (uint64_t)v18, type metadata accessor for IDSFailingDevice);
    sub_100067C64(a2 + v20, (uint64_t)v15, type metadata accessor for IDSFailingDevice);
    uint64_t v22 = *v18;
    unint64_t v23 = v18[1];
    uint64_t v24 = *v15;
    unint64_t v25 = v15[1];
    uint64_t v26 = 0;
    switch(v23 >> 62)
    {
      case 1uLL:
        LODWORD(v26) = HIDWORD(v22) - v22;
        if (__OFSUB__(HIDWORD(v22), v22))
        {
          __break(1u);
LABEL_58:
          __break(1u);
LABEL_59:
          __break(1u);
LABEL_60:
          __break(1u);
LABEL_61:
          __break(1u);
LABEL_62:
          __break(1u);
LABEL_63:
          __break(1u);
LABEL_64:
          __break(1u);
        }
        uint64_t v26 = (int)v26;
        break;
      case 2uLL:
        uint64_t v28 = *(void *)(v22 + 16);
        uint64_t v27 = *(void *)(v22 + 24);
        BOOL v29 = __OFSUB__(v27, v28);
        uint64_t v26 = v27 - v28;
        if (!v29) {
          break;
        }
        goto LABEL_58;
      case 3uLL:
        break;
      default:
        uint64_t v26 = BYTE6(v23);
        break;
    }
    uint64_t v66 = v21;
    switch(v25 >> 62)
    {
      case 1uLL:
        LODWORD(v30) = HIDWORD(v24) - v24;
        if (__OFSUB__(HIDWORD(v24), v24)) {
          goto LABEL_59;
        }
        uint64_t v30 = (int)v30;
LABEL_15:
        if (v26 != v30) {
          goto LABEL_54;
        }
        if (v26 >= 1)
        {
          switch(v23 >> 62)
          {
            case 1uLL:
              uint64_t v55 = (v22 >> 32) - (int)v22;
              if (v22 >> 32 < (int)v22) {
                goto LABEL_61;
              }
              sub_100060F68(v22, v23);
              uint64_t v33 = __DataStorage._bytes.getter();
              if (!v33) {
                goto LABEL_25;
              }
              uint64_t v34 = __DataStorage._offset.getter();
              if (__OFSUB__((int)v22, v34)) {
                goto LABEL_63;
              }
              v33 += (int)v22 - v34;
LABEL_25:
              __DataStorage._length.getter();
              uint64_t v35 = v61;
              sub_100060128(v33, v24, v25, (char *)__s1);
              uint64_t v61 = v35;
              sub_100060FC0(v22, v23);
              break;
            case 2uLL:
              uint64_t v36 = *(void *)(v22 + 16);
              uint64_t v37 = *(void *)(v22 + 24);
              swift_retain();
              swift_retain();
              uint64_t v38 = __DataStorage._bytes.getter();
              if (!v38) {
                goto LABEL_29;
              }
              uint64_t v39 = __DataStorage._offset.getter();
              if (__OFSUB__(v36, v39)) {
                goto LABEL_64;
              }
              v38 += v36 - v39;
LABEL_29:
              if (__OFSUB__(v37, v36)) {
                goto LABEL_62;
              }
              __DataStorage._length.getter();
              uint64_t v40 = v61;
              sub_100060128(v38, v24, v25, (char *)__s1);
              uint64_t v61 = v40;
              swift_release();
              swift_release();
              break;
            case 3uLL:
              memset(__s1, 0, 14);
              goto LABEL_33;
            default:
              __s1[0] = v22;
              LOWORD(__s1[1]) = v23;
              BYTE2(__s1[1]) = BYTE2(v23);
              BYTE3(__s1[1]) = BYTE3(v23);
              BYTE4(__s1[1]) = BYTE4(v23);
              BYTE5(__s1[1]) = BYTE5(v23);
LABEL_33:
              uint64_t v42 = v61;
              sub_100060128((uint64_t)__s1, v24, v25, &v68);
              uint64_t v61 = v42;
              char v41 = v68;
              goto LABEL_34;
          }
          char v41 = __s1[0];
          a2 = v56;
LABEL_34:
          a1 = v57;
          if ((v41 & 1) == 0) {
            goto LABEL_54;
          }
        }
LABEL_35:
        uint64_t v43 = *(int *)(v67 + 24);
        uint64_t v44 = (uint64_t)v15 + v43;
        uint64_t v45 = (uint64_t)v64;
        uint64_t v46 = (uint64_t)&v64[*(int *)(v65 + 48)];
        sub_10006117C((uint64_t)v18 + v43, (uint64_t)v64);
        sub_10006117C(v44, v46);
        uint64_t v47 = v63;
        __int16 v48 = *v62;
        if ((*v62)(v45, 1, v63) == 1)
        {
          if (v48(v46, 1, v47) != 1)
          {
            CFStringRef v53 = &qword_1000A7378;
            goto LABEL_53;
          }
          sub_100067D2C(v45, &qword_1000A6BE0);
LABEL_45:
          type metadata accessor for UnknownStorage();
          sub_1000629C0(&qword_1000A7370, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
          char v52 = dispatch thunk of static Equatable.== infix(_:_:)();
          sub_100067CCC((uint64_t)v15, type metadata accessor for IDSFailingDevice);
          sub_100067CCC((uint64_t)v18, type metadata accessor for IDSFailingDevice);
          uint64_t v21 = v66 - 1;
          if ((v52 & 1) == 0) {
            return v52 & 1;
          }
          v20 += v60;
          if (!v66) {
            return v52 & 1;
          }
          continue;
        }
        long long v49 = v59;
        sub_10006117C(v45, (uint64_t)v59);
        if (v48(v46, 1, v47) != 1)
        {
          __int16 v50 = v58;
          sub_1000611E4(v46, (uint64_t)v58);
          if ((*v49 != *v50 || v49[1] != v50[1]) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0
            || v49[2] != v50[2]
            || (sub_100060C50(v49[3], v50[3]) & 1) == 0)
          {
            sub_100067CCC((uint64_t)v50, type metadata accessor for ErrorDomainCode);
            CFStringRef v53 = &qword_1000A6BE0;
            goto LABEL_52;
          }
          type metadata accessor for UnknownStorage();
          sub_1000629C0(&qword_1000A7370, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
          char v51 = dispatch thunk of static Equatable.== infix(_:_:)();
          sub_100067CCC((uint64_t)v50, type metadata accessor for ErrorDomainCode);
          sub_100067CCC((uint64_t)v49, type metadata accessor for ErrorDomainCode);
          sub_100067D2C((uint64_t)v64, &qword_1000A6BE0);
          if ((v51 & 1) == 0) {
            goto LABEL_54;
          }
          goto LABEL_45;
        }
        CFStringRef v53 = &qword_1000A7378;
LABEL_52:
        sub_100067CCC((uint64_t)v49, type metadata accessor for ErrorDomainCode);
        uint64_t v45 = (uint64_t)v64;
LABEL_53:
        sub_100067D2C(v45, v53);
LABEL_54:
        sub_100067CCC((uint64_t)v15, type metadata accessor for IDSFailingDevice);
        sub_100067CCC((uint64_t)v18, type metadata accessor for IDSFailingDevice);
LABEL_55:
        char v52 = 0;
        return v52 & 1;
      case 2uLL:
        uint64_t v32 = *(void *)(v24 + 16);
        uint64_t v31 = *(void *)(v24 + 24);
        BOOL v29 = __OFSUB__(v31, v32);
        uint64_t v30 = v31 - v32;
        if (!v29) {
          goto LABEL_15;
        }
        goto LABEL_60;
      case 3uLL:
        if (v26) {
          goto LABEL_54;
        }
        goto LABEL_35;
      default:
        uint64_t v30 = BYTE6(v25);
        goto LABEL_15;
    }
  }
}

uint64_t sub_100060C50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ErrorDomainCode(0);
  uint64_t v5 = __chkstk_darwin(v4);
  unint64_t v7 = (uint64_t *)((char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v5);
  unint64_t v10 = (uint64_t *)((char *)&v19 - v9);
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11 != *(void *)(a2 + 16))
  {
LABEL_20:
    char v15 = 0;
    return v15 & 1;
  }
  if (v11 && a1 != a2)
  {
    unint64_t v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    uint64_t v20 = *(void *)(v8 + 72);
    uint64_t v13 = v11 - 1;
    while (1)
    {
      sub_100067C64(a1 + v12, (uint64_t)v10, type metadata accessor for ErrorDomainCode);
      sub_100067C64(a2 + v12, (uint64_t)v7, type metadata accessor for ErrorDomainCode);
      BOOL v14 = *v10 == *v7 && v10[1] == v7[1];
      if (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0
        || v10[2] != v7[2]
        || (sub_100060C50(v10[3], v7[3]) & 1) == 0)
      {
        break;
      }
      type metadata accessor for UnknownStorage();
      sub_1000629C0(&qword_1000A7370, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
      char v15 = dispatch thunk of static Equatable.== infix(_:_:)();
      sub_100067CCC((uint64_t)v7, type metadata accessor for ErrorDomainCode);
      sub_100067CCC((uint64_t)v10, type metadata accessor for ErrorDomainCode);
      BOOL v17 = v13-- != 0;
      if (v15)
      {
        v12 += v20;
        if (v17) {
          continue;
        }
      }
      return v15 & 1;
    }
    sub_100067CCC((uint64_t)v7, type metadata accessor for ErrorDomainCode);
    sub_100067CCC((uint64_t)v10, type metadata accessor for ErrorDomainCode);
    goto LABEL_20;
  }
  char v15 = 1;
  return v15 & 1;
}

uint64_t sub_100060EC8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (v2 && a1 != a2)
  {
    uint64_t v3 = (unsigned char *)(a1 + 40);
    uint64_t v4 = (unsigned char *)(a2 + 40);
    do
    {
      uint64_t v5 = *((void *)v4 - 1);
      if (*v3) {
        uint64_t v6 = *((void *)v3 - 1) != 0;
      }
      else {
        uint64_t v6 = *((void *)v3 - 1);
      }
      if (*v4 == 1)
      {
        if (v5)
        {
          if (v6 != 1) {
            return 0;
          }
        }
        else if (v6)
        {
          return 0;
        }
      }
      else if (v6 != v5)
      {
        return 0;
      }
      v3 += 16;
      v4 += 16;
      --v2;
    }
    while (v2);
  }
  return 1;
}

uint64_t sub_100060F68(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

uint64_t sub_100060FC0(uint64_t a1, unint64_t a2)
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

uint64_t type metadata accessor for SASAnnounce(uint64_t a1)
{
  return sub_100061268(a1, (uint64_t *)&unk_1000A9DC0);
}

uint64_t type metadata accessor for SASCommit(uint64_t a1)
{
  return sub_100061268(a1, (uint64_t *)&unk_1000A9DD0);
}

uint64_t type metadata accessor for SASSelected(uint64_t a1)
{
  return sub_100061268(a1, (uint64_t *)&unk_1000A9DE0);
}

uint64_t type metadata accessor for SASTeardown(uint64_t a1)
{
  return sub_100061268(a1, (uint64_t *)&unk_1000A9DF0);
}

uint64_t type metadata accessor for SASSetupB(uint64_t a1)
{
  return sub_100061268(a1, (uint64_t *)&unk_1000A9E00);
}

uint64_t type metadata accessor for SASReveal(uint64_t a1)
{
  return sub_100061268(a1, (uint64_t *)&unk_1000A9E10);
}

uint64_t type metadata accessor for SASConfirm(uint64_t a1)
{
  return sub_100061268(a1, (uint64_t *)&unk_1000A9E20);
}

uint64_t type metadata accessor for ErrorDomainCode(uint64_t a1)
{
  return sub_100061268(a1, (uint64_t *)&unk_1000A9E30);
}

uint64_t sub_100061118(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for IDSFailingDevice(uint64_t a1)
{
  return sub_100061268(a1, (uint64_t *)&unk_1000A9E40);
}

uint64_t sub_10006117C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100061118(&qword_1000A6BE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000611E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ErrorDomainCode(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for SASTTR(uint64_t a1)
{
  return sub_100061268(a1, (uint64_t *)&unk_1000A9E50);
}

uint64_t sub_100061268(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000612A0(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_1000612D8()
{
  unint64_t result = qword_1000A6BE8;
  if (!qword_1000A6BE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000A6BE8);
  }
  return result;
}

uint64_t sub_10006132C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t __s1 = a1;
  __int16 v9 = a2;
  char v10 = BYTE2(a2);
  char v11 = BYTE3(a2);
  char v12 = BYTE4(a2);
  char v13 = BYTE5(a2);
  sub_100060128((uint64_t)&__s1, a3, a4, &v7);
  if (!v4) {
    char v5 = v7;
  }
  return v5 & 1;
}

uint64_t sub_100061404(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = __DataStorage._bytes.getter();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = __DataStorage._offset.getter();
    if (__OFSUB__(a1, result))
    {
LABEL_9:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  __DataStorage._length.getter();
  sub_100060128(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

uint64_t sub_1000614BC(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v_Block_object_dispose(&STACK[0x410], 8) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
        JUMPOUT(0x100061724);
      }
      uint64_t v8 = (int)v8;
LABEL_6:
      switch(a4 >> 62)
      {
        case 1uLL:
          LODWORD(v12) = HIDWORD(a3) - a3;
          if (__OFSUB__(HIDWORD(a3), a3)) {
            goto LABEL_27;
          }
          uint64_t v12 = (int)v12;
LABEL_11:
          if (v8 == v12)
          {
            if (v8 < 1)
            {
              char v17 = 1;
            }
            else
            {
              switch(a2 >> 62)
              {
                case 1uLL:
                  if (a1 >> 32 < (int)a1) {
                    goto LABEL_29;
                  }
                  sub_100060F68(a3, a4);
                  sub_100060F68(a1, a2);
                  char v17 = sub_100061404((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
                  sub_100060FC0(a3, a4);
                  uint64_t v18 = a1;
                  unint64_t v19 = a2;
                  break;
                case 2uLL:
                  uint64_t v20 = a2 & 0x3FFFFFFFFFFFFFFFLL;
                  uint64_t v21 = *(void *)(a1 + 16);
                  uint64_t v22 = *(void *)(a1 + 24);
                  sub_100060F68(a3, a4);
                  swift_retain();
                  swift_retain();
                  char v17 = sub_100061404(v21, v22, v20, a3, a4);
                  sub_100060FC0(a3, a4);
                  swift_release();
                  swift_release();
                  return v17 & 1;
                case 3uLL:
                  sub_100060F68(a3, a4);
                  uint64_t v16 = 0;
                  uint64_t v15 = 0;
                  goto LABEL_22;
                default:
                  sub_100060F68(a3, a4);
                  uint64_t v15 = a2 & 0xFFFFFFFFFFFFFFLL;
                  uint64_t v16 = a1;
LABEL_22:
                  char v17 = sub_10006132C(v16, v15, a3, a4);
                  uint64_t v18 = a3;
                  unint64_t v19 = a4;
                  break;
              }
              sub_100060FC0(v18, v19);
            }
          }
          else
          {
            char v17 = 0;
          }
          return v17 & 1;
        case 2uLL:
          uint64_t v14 = *(void *)(a3 + 16);
          uint64_t v13 = *(void *)(a3 + 24);
          BOOL v11 = __OFSUB__(v13, v14);
          uint64_t v12 = v13 - v14;
          if (!v11) {
            goto LABEL_11;
          }
          goto LABEL_28;
        case 3uLL:
          char v17 = v8 == 0;
          return v17 & 1;
        default:
          uint64_t v12 = BYTE6(a4);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v10 = *(void *)(a1 + 16);
      uint64_t v9 = *(void *)(a1 + 24);
      BOOL v11 = __OFSUB__(v9, v10);
      uint64_t v8 = v9 - v10;
      if (!v11) {
        goto LABEL_6;
      }
      goto LABEL_26;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v8 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_100061754(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UnknownStorage();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v16 - v9;
  if ((sub_1000614BC(*(void *)a1, *(void *)(a1 + 8), *(void *)a2, *(void *)(a2 + 8)) & 1) != 0
    && (sub_1000614BC(*(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a2 + 16), *(void *)(a2 + 24)) & 1) != 0
    && (sub_1000614BC(*(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a2 + 32), *(void *)(a2 + 40)) & 1) != 0
    && (sub_1000614BC(*(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a2 + 48), *(void *)(a2 + 56)) & 1) != 0)
  {
    uint64_t v11 = type metadata accessor for SASSetupB(0);
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v12(v10, a1 + *(int *)(v11 + 32), v4);
    v12(v8, a2 + *(int *)(v11 + 32), v4);
    sub_1000629C0(&qword_1000A7370, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
    char v13 = dispatch thunk of static Equatable.== infix(_:_:)();
    uint64_t v14 = *(void (**)(char *, uint64_t))(v5 + 8);
    v14(v8, v4);
    v14(v10, v4);
  }
  else
  {
    char v13 = 0;
  }
  return v13 & 1;
}

uint64_t sub_10006193C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v6 = type metadata accessor for UnknownStorage();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v18 - v11;
  if ((sub_1000614BC(*(void *)a1, *(void *)(a1 + 8), *(void *)a2, *(void *)(a2 + 8)) & 1) != 0
    && (sub_1000614BC(*(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a2 + 16), *(void *)(a2 + 24)) & 1) != 0
    && (sub_1000614BC(*(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a2 + 32), *(void *)(a2 + 40)) & 1) != 0)
  {
    uint64_t v13 = a3(0);
    uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
    v14(v12, a1 + *(int *)(v13 + 28), v6);
    v14(v10, a2 + *(int *)(v13 + 28), v6);
    sub_1000629C0(&qword_1000A7370, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
    char v15 = dispatch thunk of static Equatable.== infix(_:_:)();
    uint64_t v16 = *(void (**)(char *, uint64_t))(v7 + 8);
    v16(v10, v6);
    v16(v12, v6);
  }
  else
  {
    char v15 = 0;
  }
  return v15 & 1;
}

uint64_t sub_100061B1C(char *a1, char *a2)
{
  uint64_t v4 = type metadata accessor for UnknownStorage();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v18 - v9;
  BOOL v11 = *(void *)a1 == *(void *)a2 && *((void *)a1 + 1) == *((void *)a2 + 1);
  if (v11 || (char v12 = 0, (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0))
  {
    BOOL v13 = *((void *)a1 + 2) == *((void *)a2 + 2) && *((void *)a1 + 3) == *((void *)a2 + 3);
    if (v13 || (char v12 = 0, (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0))
    {
      if (*((void *)a1 + 4) == *((void *)a2 + 4) && *((void *)a1 + 5) == *((void *)a2 + 5)
        || (char v12 = 0, (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0))
      {
        if (*((void *)a1 + 6) == *((void *)a2 + 6)
          && *((void *)a1 + 7) == *((void *)a2 + 7)
          && (sub_10006039C(*((void *)a1 + 8), *((void *)a2 + 8)) & 1) != 0)
        {
          uint64_t v14 = type metadata accessor for SASTTR(0);
          char v15 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
          v15(v10, &a1[*(int *)(v14 + 40)], v4);
          v15(v8, &a2[*(int *)(v14 + 40)], v4);
          sub_1000629C0(&qword_1000A7370, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
          char v12 = dispatch thunk of static Equatable.== infix(_:_:)();
          uint64_t v16 = *(void (**)(char *, uint64_t))(v5 + 8);
          v16(v8, v4);
          v16(v10, v4);
        }
        else
        {
          char v12 = 0;
        }
      }
    }
  }
  return v12 & 1;
}

uint64_t sub_100061D64(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UnknownStorage();
  uint64_t v51 = *(void *)(v4 - 8);
  uint64_t v52 = v4;
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v45 - v8;
  uint64_t v10 = type metadata accessor for ErrorDomainCode(0);
  uint64_t v53 = *(void *)(v10 - 8);
  uint64_t v54 = v10;
  __chkstk_darwin(v10);
  char v12 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100061118(&qword_1000A7378);
  __chkstk_darwin(v13);
  char v15 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100061118(&qword_1000A6BE0);
  uint64_t v17 = __chkstk_darwin(v16 - 8);
  unint64_t v19 = (char *)&v45 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __chkstk_darwin(v17);
  uint64_t v22 = (char *)&v45 - v21;
  __chkstk_darwin(v20);
  uint64_t v24 = (char *)&v45 - v23;
  if ((sub_1000614BC(*(void *)a1, *(void *)(a1 + 8), *(void *)a2, *(void *)(a2 + 8)) & 1) == 0) {
    goto LABEL_8;
  }
  long long v49 = v7;
  __int16 v50 = v19;
  uint64_t v46 = v12;
  __int16 v48 = v9;
  uint64_t v25 = type metadata accessor for IDSFailingDevice(0);
  sub_10006117C(a1 + *(int *)(v25 + 24), (uint64_t)v24);
  sub_10006117C(a2 + *(int *)(v25 + 24), (uint64_t)v22);
  uint64_t v26 = (uint64_t)&v15[*(int *)(v13 + 48)];
  sub_10006117C((uint64_t)v24, (uint64_t)v15);
  sub_10006117C((uint64_t)v22, v26);
  uint64_t v27 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v53 + 48);
  int v28 = v27(v15, 1, v54);
  uint64_t v29 = a2;
  uint64_t v30 = a1;
  uint64_t v31 = (uint64_t)v15;
  uint64_t v47 = v29;
  if (v28 == 1)
  {
    uint64_t v32 = v25;
    sub_100067D2C((uint64_t)v22, &qword_1000A6BE0);
    sub_100067D2C((uint64_t)v24, &qword_1000A6BE0);
    if (v27((char *)v26, 1, v54) == 1)
    {
      sub_100067D2C(v31, &qword_1000A6BE0);
LABEL_11:
      uint64_t v39 = v51;
      uint64_t v38 = v52;
      uint64_t v40 = *(void (**)(char *, uint64_t, uint64_t))(v51 + 16);
      char v41 = v48;
      v40(v48, v30 + *(int *)(v32 + 20), v52);
      uint64_t v42 = v47 + *(int *)(v32 + 20);
      uint64_t v43 = v49;
      v40(v49, v42, v38);
      sub_1000629C0(&qword_1000A7370, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
      char v34 = dispatch thunk of static Equatable.== infix(_:_:)();
      uint64_t v44 = *(void (**)(char *, uint64_t))(v39 + 8);
      v44(v43, v38);
      v44(v41, v38);
      return v34 & 1;
    }
    goto LABEL_7;
  }
  uint64_t v33 = v50;
  sub_10006117C((uint64_t)v15, (uint64_t)v50);
  if (v27((char *)v26, 1, v54) == 1)
  {
    sub_100067D2C((uint64_t)v22, &qword_1000A6BE0);
    sub_100067D2C((uint64_t)v24, &qword_1000A6BE0);
    sub_100067CCC((uint64_t)v33, type metadata accessor for ErrorDomainCode);
LABEL_7:
    sub_100067D2C(v31, &qword_1000A7378);
    goto LABEL_8;
  }
  uint64_t v32 = v25;
  uint64_t v36 = v46;
  sub_1000611E4(v26, (uint64_t)v46);
  char v37 = sub_10006225C(v33, v36);
  sub_100067CCC((uint64_t)v36, type metadata accessor for ErrorDomainCode);
  sub_100067D2C((uint64_t)v22, &qword_1000A6BE0);
  sub_100067D2C((uint64_t)v24, &qword_1000A6BE0);
  sub_100067CCC((uint64_t)v33, type metadata accessor for ErrorDomainCode);
  sub_100067D2C(v31, &qword_1000A6BE0);
  if (v37) {
    goto LABEL_11;
  }
LABEL_8:
  char v34 = 0;
  return v34 & 1;
}

uint64_t sub_10006225C(char *a1, char *a2)
{
  uint64_t v4 = type metadata accessor for UnknownStorage();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v17 - v9;
  BOOL v11 = *(void *)a1 == *(void *)a2 && *((void *)a1 + 1) == *((void *)a2 + 1);
  if (v11 || (char v12 = 0, (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0))
  {
    if (*((void *)a1 + 2) == *((void *)a2 + 2)
      && (sub_100060C50(*((void *)a1 + 3), *((void *)a2 + 3)) & 1) != 0)
    {
      uint64_t v13 = type metadata accessor for ErrorDomainCode(0);
      uint64_t v14 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
      v14(v10, &a1[*(int *)(v13 + 28)], v4);
      v14(v8, &a2[*(int *)(v13 + 28)], v4);
      sub_1000629C0(&qword_1000A7370, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
      char v12 = dispatch thunk of static Equatable.== infix(_:_:)();
      char v15 = *(void (**)(char *, uint64_t))(v5 + 8);
      v15(v8, v4);
      v15(v10, v4);
    }
    else
    {
      char v12 = 0;
    }
  }
  return v12 & 1;
}

uint64_t sub_100062448(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UnknownStorage();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v17 - v9;
  if ((sub_1000614BC(*(void *)a1, *(void *)(a1 + 8), *(void *)a2, *(void *)(a2 + 8)) & 1) == 0) {
    goto LABEL_7;
  }
  if (*(unsigned char *)(a1 + 24))
  {
    if ((*(unsigned char *)(a2 + 24) & 1) == 0)
    {
      uint64_t v11 = 0;
      goto LABEL_8;
    }
LABEL_9:
    uint64_t v13 = type metadata accessor for SASTeardown(0);
    uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v14(v10, a1 + *(int *)(v13 + 24), v4);
    v14(v8, a2 + *(int *)(v13 + 24), v4);
    sub_1000629C0(&qword_1000A7370, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
    char v12 = dispatch thunk of static Equatable.== infix(_:_:)();
    char v15 = *(void (**)(char *, uint64_t))(v5 + 8);
    v15(v8, v4);
    v15(v10, v4);
    return v12 & 1;
  }
  uint64_t v11 = *(void *)(a1 + 16);
  if (*(unsigned char *)(a2 + 24))
  {
    if (v11) {
      goto LABEL_7;
    }
    goto LABEL_9;
  }
LABEL_8:
  if (v11 == *(void *)(a2 + 16)) {
    goto LABEL_9;
  }
LABEL_7:
  char v12 = 0;
  return v12 & 1;
}

uint64_t sub_100062630(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UnknownStorage();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v16 - v9;
  if (sub_1000614BC(*(void *)a1, *(void *)(a1 + 8), *(void *)a2, *(void *)(a2 + 8)))
  {
    uint64_t v11 = type metadata accessor for SASSelected(0);
    char v12 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v12(v10, a1 + *(int *)(v11 + 20), v4);
    v12(v8, a2 + *(int *)(v11 + 20), v4);
    sub_1000629C0(&qword_1000A7370, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
    char v13 = dispatch thunk of static Equatable.== infix(_:_:)();
    uint64_t v14 = *(void (**)(char *, uint64_t))(v5 + 8);
    v14(v8, v4);
    v14(v10, v4);
  }
  else
  {
    char v13 = 0;
  }
  return v13 & 1;
}

uint64_t sub_1000627E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UnknownStorage();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v16 - v9;
  if ((sub_100060EC8(*(void *)a1, *(void *)a2) & 1) != 0
    && (sub_1000614BC(*(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a2 + 8), *(void *)(a2 + 16)) & 1) != 0
    && (sub_1000614BC(*(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a2 + 24), *(void *)(a2 + 32)) & 1) != 0)
  {
    uint64_t v11 = type metadata accessor for SASAnnounce(0);
    char v12 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v12(v10, a1 + *(int *)(v11 + 28), v4);
    v12(v8, a2 + *(int *)(v11 + 28), v4);
    sub_1000629C0(&qword_1000A7370, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
    char v13 = dispatch thunk of static Equatable.== infix(_:_:)();
    uint64_t v14 = *(void (**)(char *, uint64_t))(v5 + 8);
    v14(v8, v4);
    v14(v10, v4);
  }
  else
  {
    char v13 = 0;
  }
  return v13 & 1;
}

uint64_t sub_1000629C0(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_100062A08()
{
  unint64_t result = qword_1000A6C08;
  if (!qword_1000A6C08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000A6C08);
  }
  return result;
}

uint64_t sub_100062A5C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = type metadata accessor for UnknownStorage();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v16 - v9;
  if ((sub_1000614BC(*a1, a1[1], *a2, a2[1]) & 1) != 0
    && a1[2] == a2[2]
    && (sub_1000614BC(a1[3], a1[4], a2[3], a2[4]) & 1) != 0)
  {
    uint64_t v11 = type metadata accessor for SASConfirm(0);
    char v12 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
    v12(v10, (char *)a1 + *(int *)(v11 + 28), v4);
    v12(v8, (char *)a2 + *(int *)(v11 + 28), v4);
    sub_1000629C0(&qword_1000A7370, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
    char v13 = dispatch thunk of static Equatable.== infix(_:_:)();
    uint64_t v14 = *(void (**)(char *, uint64_t))(v5 + 8);
    v14(v8, v4);
    v14(v10, v4);
  }
  else
  {
    char v13 = 0;
  }
  return v13 & 1;
}

unint64_t sub_100062C38()
{
  unint64_t result = qword_1000A6C58;
  if (!qword_1000A6C58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000A6C58);
  }
  return result;
}

unint64_t sub_100062C90()
{
  unint64_t result = qword_1000A6C60;
  if (!qword_1000A6C60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000A6C60);
  }
  return result;
}

uint64_t sub_100062CE4()
{
  return sub_100062FB4(&qword_1000A6C68, &qword_1000A6C70);
}

uint64_t sub_100062D0C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100062D58()
{
  unint64_t result = qword_1000A6C78;
  if (!qword_1000A6C78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000A6C78);
  }
  return result;
}

unint64_t sub_100062DB0()
{
  unint64_t result = qword_1000A6C80;
  if (!qword_1000A6C80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000A6C80);
  }
  return result;
}

unint64_t sub_100062E08()
{
  unint64_t result = qword_1000A6C88;
  if (!qword_1000A6C88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000A6C88);
  }
  return result;
}

uint64_t sub_100062E5C()
{
  return sub_100062FB4(&qword_1000A6C90, &qword_1000A6C98);
}

unint64_t sub_100062E88()
{
  unint64_t result = qword_1000A6CA0;
  if (!qword_1000A6CA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000A6CA0);
  }
  return result;
}

unint64_t sub_100062EE0()
{
  unint64_t result = qword_1000A6CA8;
  if (!qword_1000A6CA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000A6CA8);
  }
  return result;
}

unint64_t sub_100062F38()
{
  unint64_t result = qword_1000A6CB0;
  if (!qword_1000A6CB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000A6CB0);
  }
  return result;
}

uint64_t sub_100062F8C()
{
  return sub_100062FB4(&qword_1000A6CB8, &qword_1000A6CC0);
}

uint64_t sub_100062FB4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100062D0C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100063008()
{
  unint64_t result = qword_1000A6CC8;
  if (!qword_1000A6CC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000A6CC8);
  }
  return result;
}

uint64_t sub_10006305C()
{
  return sub_1000629C0(&qword_1000A6CD0, (void (*)(uint64_t))type metadata accessor for SASAnnounce);
}

uint64_t sub_1000630A4()
{
  return sub_1000629C0(&qword_1000A6CD8, (void (*)(uint64_t))type metadata accessor for SASAnnounce);
}

uint64_t sub_1000630EC()
{
  return sub_1000629C0(&qword_1000A6BF0, (void (*)(uint64_t))type metadata accessor for SASAnnounce);
}

uint64_t sub_100063134()
{
  return sub_1000629C0(&qword_1000A6CE0, (void (*)(uint64_t))type metadata accessor for SASAnnounce);
}

uint64_t sub_10006317C()
{
  return sub_1000629C0(&qword_1000A6CE8, (void (*)(uint64_t))type metadata accessor for SASCommit);
}

uint64_t sub_1000631C4()
{
  return sub_1000629C0(&qword_1000A6CF0, (void (*)(uint64_t))type metadata accessor for SASCommit);
}

uint64_t sub_10006320C()
{
  return sub_1000629C0(&qword_1000A6BF8, (void (*)(uint64_t))type metadata accessor for SASCommit);
}

uint64_t sub_100063254()
{
  return sub_1000629C0(&qword_1000A6CF8, (void (*)(uint64_t))type metadata accessor for SASCommit);
}

uint64_t sub_10006329C()
{
  return sub_1000629C0(&qword_1000A6D00, (void (*)(uint64_t))type metadata accessor for SASSelected);
}

uint64_t sub_1000632E4()
{
  return sub_1000629C0(&qword_1000A6D08, (void (*)(uint64_t))type metadata accessor for SASSelected);
}

uint64_t sub_10006332C()
{
  return sub_1000629C0(&qword_1000A6C00, (void (*)(uint64_t))type metadata accessor for SASSelected);
}

uint64_t sub_100063374()
{
  return sub_1000629C0(&qword_1000A6D10, (void (*)(uint64_t))type metadata accessor for SASSelected);
}

uint64_t sub_1000633BC()
{
  return sub_1000629C0(&qword_1000A6D18, (void (*)(uint64_t))type metadata accessor for SASTeardown);
}

uint64_t sub_100063404()
{
  return sub_1000629C0(&qword_1000A6D20, (void (*)(uint64_t))type metadata accessor for SASTeardown);
}

uint64_t sub_10006344C()
{
  return sub_1000629C0(&qword_1000A6C10, (void (*)(uint64_t))type metadata accessor for SASTeardown);
}

uint64_t sub_100063494()
{
  return sub_1000629C0(&qword_1000A6D28, (void (*)(uint64_t))type metadata accessor for SASTeardown);
}

uint64_t sub_1000634DC()
{
  return sub_1000629C0(&qword_1000A6D30, (void (*)(uint64_t))type metadata accessor for SASSetupB);
}

uint64_t sub_100063524()
{
  return sub_1000629C0(&qword_1000A6D38, (void (*)(uint64_t))type metadata accessor for SASSetupB);
}

uint64_t sub_10006356C()
{
  return sub_1000629C0(&qword_1000A6C18, (void (*)(uint64_t))type metadata accessor for SASSetupB);
}

uint64_t sub_1000635B4()
{
  return sub_1000629C0(&qword_1000A6D40, (void (*)(uint64_t))type metadata accessor for SASSetupB);
}

uint64_t sub_1000635FC()
{
  return sub_1000629C0(&qword_1000A6D48, (void (*)(uint64_t))type metadata accessor for SASReveal);
}

uint64_t sub_100063644()
{
  return sub_1000629C0(&qword_1000A6D50, (void (*)(uint64_t))type metadata accessor for SASReveal);
}

uint64_t sub_10006368C()
{
  return sub_1000629C0(&qword_1000A6C20, (void (*)(uint64_t))type metadata accessor for SASReveal);
}

uint64_t sub_1000636D4()
{
  return sub_1000629C0(&qword_1000A6D58, (void (*)(uint64_t))type metadata accessor for SASReveal);
}

uint64_t sub_10006371C()
{
  return sub_1000629C0(&qword_1000A6D60, (void (*)(uint64_t))type metadata accessor for SASConfirm);
}

uint64_t sub_100063764()
{
  return sub_1000629C0(&qword_1000A6D68, (void (*)(uint64_t))type metadata accessor for SASConfirm);
}

uint64_t sub_1000637AC()
{
  return sub_1000629C0(&qword_1000A6C28, (void (*)(uint64_t))type metadata accessor for SASConfirm);
}

uint64_t sub_1000637F4()
{
  return sub_1000629C0(&qword_1000A6D70, (void (*)(uint64_t))type metadata accessor for SASConfirm);
}

uint64_t sub_10006383C()
{
  return sub_1000629C0(&qword_1000A6D78, (void (*)(uint64_t))type metadata accessor for ErrorDomainCode);
}

uint64_t sub_100063884()
{
  return sub_1000629C0(&qword_1000A6C30, (void (*)(uint64_t))type metadata accessor for ErrorDomainCode);
}

uint64_t sub_1000638CC()
{
  return sub_1000629C0(&qword_1000A6C38, (void (*)(uint64_t))type metadata accessor for ErrorDomainCode);
}

uint64_t sub_100063914()
{
  return sub_1000629C0(&qword_1000A6D80, (void (*)(uint64_t))type metadata accessor for ErrorDomainCode);
}

uint64_t sub_10006395C()
{
  return sub_1000629C0(&qword_1000A6D88, (void (*)(uint64_t))type metadata accessor for IDSFailingDevice);
}

uint64_t sub_1000639A4()
{
  return sub_1000629C0(&qword_1000A6C48, (void (*)(uint64_t))type metadata accessor for IDSFailingDevice);
}

uint64_t sub_1000639EC()
{
  return sub_1000629C0(&qword_1000A6C40, (void (*)(uint64_t))type metadata accessor for IDSFailingDevice);
}

uint64_t sub_100063A34()
{
  return sub_1000629C0(&qword_1000A6D90, (void (*)(uint64_t))type metadata accessor for IDSFailingDevice);
}

uint64_t sub_100063A7C()
{
  return sub_1000629C0(&qword_1000A6D98, (void (*)(uint64_t))type metadata accessor for SASTTR);
}

uint64_t sub_100063AC4()
{
  return sub_1000629C0((unint64_t *)&qword_1000A6DA0, (void (*)(uint64_t))type metadata accessor for SASTTR);
}

uint64_t sub_100063B0C()
{
  return sub_1000629C0(&qword_1000A6C50, (void (*)(uint64_t))type metadata accessor for SASTTR);
}

uint64_t sub_100063B54()
{
  return sub_1000629C0(&qword_1000A6DA8, (void (*)(uint64_t))type metadata accessor for SASTTR);
}

uint64_t initializeBufferWithCopyOfBuffer for SASIDSProtocolNumbers(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + _Block_object_dispose(&STACK[0x410], 8) = *((unsigned char *)a2 + 8);
  *(void *)unint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for SASIDSProtocolNumbers()
{
  return &type metadata for SASIDSProtocolNumbers;
}

ValueMetadata *type metadata accessor for SASTeardownReason()
{
  return &type metadata for SASTeardownReason;
}

uint64_t getEnumTagSinglePayload for SASProtocol(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SASProtocol(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)unint64_t result = 0;
    *(unsigned char *)(result + _Block_object_dispose(&STACK[0x410], 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 1;
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
  *(unsigned char *)(result + 9) = v3;
  return result;
}

uint64_t sub_100063C24(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100063C40(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)unint64_t result = (a2 - 1);
    *(unsigned char *)(result + _Block_object_dispose(&STACK[0x410], 8) = 1;
  }
  else
  {
    *(unsigned char *)(result + _Block_object_dispose(&STACK[0x410], 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for SASProtocol()
{
  return &type metadata for SASProtocol;
}

uint64_t *sub_100063C70(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v8 = a2[1];
    unint64_t v9 = a2[2];
    swift_bridgeObjectRetain();
    sub_100060F68(v8, v9);
    a1[1] = v8;
    a1[2] = v9;
    uint64_t v10 = a2[3];
    unint64_t v11 = a2[4];
    sub_100060F68(v10, v11);
    a1[3] = v10;
    a1[4] = v11;
    uint64_t v12 = *(int *)(a3 + 28);
    char v13 = (char *)a1 + v12;
    uint64_t v14 = (char *)a2 + v12;
    uint64_t v15 = type metadata accessor for UnknownStorage();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  }
  return a1;
}

uint64_t sub_100063D70(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  sub_100060FC0(*(void *)(a1 + 8), *(void *)(a1 + 16));
  sub_100060FC0(*(void *)(a1 + 24), *(void *)(a1 + 32));
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = type metadata accessor for UnknownStorage();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *sub_100063DF8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  unint64_t v7 = a2[2];
  swift_bridgeObjectRetain();
  sub_100060F68(v6, v7);
  a1[1] = v6;
  a1[2] = v7;
  uint64_t v8 = a2[3];
  unint64_t v9 = a2[4];
  sub_100060F68(v8, v9);
  a1[3] = v8;
  a1[4] = v9;
  uint64_t v10 = *(int *)(a3 + 28);
  unint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
  return a1;
}

void *sub_100063EB0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[1];
  unint64_t v7 = a2[2];
  sub_100060F68(v6, v7);
  uint64_t v8 = a1[1];
  unint64_t v9 = a1[2];
  a1[1] = v6;
  a1[2] = v7;
  sub_100060FC0(v8, v9);
  uint64_t v10 = a2[3];
  unint64_t v11 = a2[4];
  sub_100060F68(v10, v11);
  uint64_t v12 = a1[3];
  unint64_t v13 = a1[4];
  a1[3] = v10;
  a1[4] = v11;
  sub_100060FC0(v12, v13);
  uint64_t v14 = *(int *)(a3 + 28);
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 24))(v15, v16, v17);
  return a1;
}

uint64_t sub_100063F84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + _Block_object_dispose(&STACK[0x410], 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v4 = *(int *)(a3 + 28);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = type metadata accessor for UnknownStorage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *sub_100064010(void *a1, uint64_t a2, uint64_t a3)
{
  *a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = a1[1];
  unint64_t v7 = a1[2];
  *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 8);
  sub_100060FC0(v6, v7);
  uint64_t v8 = a1[3];
  unint64_t v9 = a1[4];
  *(_OWORD *)(a1 + 3) = *(_OWORD *)(a2 + 24);
  sub_100060FC0(v8, v9);
  uint64_t v10 = *(int *)(a3 + 28);
  unint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 40))(v11, v12, v13);
  return a1;
}

uint64_t sub_1000640BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000640D0);
}

uint64_t sub_1000640D0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for UnknownStorage();
    unint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    unint64_t v11 = (char *)a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_100064180(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100064194);
}

void *sub_100064194(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *unint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for UnknownStorage();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 28);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_10006423C()
{
  return sub_1000665C4();
}

uint64_t sub_100064270(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100064284);
}

uint64_t sub_100064288(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10006429C);
}

uint64_t sub_1000642A0()
{
  return sub_1000665C4();
}

uint64_t *sub_1000642B4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = *a2;
    unint64_t v8 = a2[1];
    sub_100060F68(*a2, v8);
    *a1 = v7;
    a1[1] = v8;
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = (char *)a1 + v9;
    unint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = type metadata accessor for UnknownStorage();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
  }
  return a1;
}

uint64_t sub_10006439C(uint64_t a1, uint64_t a2)
{
  sub_100060FC0(*(void *)a1, *(void *)(a1 + 8));
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = type metadata accessor for UnknownStorage();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

uint64_t *sub_100064418(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  unint64_t v7 = a2[1];
  sub_100060F68(*a2, v7);
  *a1 = v6;
  a1[1] = v7;
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  return a1;
}

uint64_t *sub_1000644B0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  unint64_t v7 = a2[1];
  sub_100060F68(*a2, v7);
  uint64_t v8 = *a1;
  unint64_t v9 = a1[1];
  *a1 = v6;
  a1[1] = v7;
  sub_100060FC0(v8, v9);
  uint64_t v10 = *(int *)(a3 + 20);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

_OWORD *sub_100064550(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t *sub_1000645CC(uint64_t *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_100060FC0(v6, v7);
  uint64_t v8 = *(int *)(a3 + 20);
  unint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t sub_10006465C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100064670);
}

uint64_t sub_100064670(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 12)
  {
    uint64_t v4 = *(void *)(a1 + 8) >> 60;
    if (((4 * v4) & 0xC) != 0) {
      return 16 - ((4 * v4) & 0xC | (v4 >> 2));
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v8 = type metadata accessor for UnknownStorage();
    unint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_10006472C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100064740);
}

void *sub_100064740(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 12)
  {
    *unint64_t result = 0;
    result[1] = (unint64_t)(((-(int)a2 >> 2) & 3) - 4 * a2) << 60;
  }
  else
  {
    uint64_t v7 = type metadata accessor for UnknownStorage();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_1000647F0()
{
  uint64_t result = type metadata accessor for UnknownStorage();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_100064888(unint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = v13 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = *(void *)a2;
    unint64_t v8 = *(void *)(a2 + 8);
    sub_100060F68(*(void *)a2, v8);
    *(void *)a1 = v7;
    *(void *)(a1 + _Block_object_dispose(&STACK[0x410], 8) = v8;
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    *(unsigned char *)(a1 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(a2 + 24);
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = a1 + v9;
    uint64_t v11 = a2 + v9;
    uint64_t v12 = type metadata accessor for UnknownStorage();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
  }
  return a1;
}

uint64_t sub_100064980(uint64_t a1, uint64_t a2)
{
  sub_100060FC0(*(void *)a1, *(void *)(a1 + 8));
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = type metadata accessor for UnknownStorage();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

uint64_t sub_1000649FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a2;
  unint64_t v7 = *(void *)(a2 + 8);
  sub_100060F68(*(void *)a2, v7);
  *(void *)a1 = v6;
  *(void *)(a1 + _Block_object_dispose(&STACK[0x410], 8) = v7;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = type metadata accessor for UnknownStorage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  return a1;
}

uint64_t sub_100064AA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a2;
  unint64_t v7 = *(void *)(a2 + 8);
  sub_100060F68(*(void *)a2, v7);
  uint64_t v8 = *(void *)a1;
  unint64_t v9 = *(void *)(a1 + 8);
  *(void *)a1 = v6;
  *(void *)(a1 + _Block_object_dispose(&STACK[0x410], 8) = v7;
  sub_100060FC0(v8, v9);
  uint64_t v10 = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = v10;
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = type metadata accessor for UnknownStorage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  return a1;
}

uint64_t sub_100064B54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = type metadata accessor for UnknownStorage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t sub_100064BE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a1;
  unint64_t v7 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_100060FC0(v6, v7);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = type metadata accessor for UnknownStorage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t sub_100064C80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100064C94);
}

uint64_t sub_100064C94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 12)
  {
    uint64_t v4 = *(void *)(a1 + 8) >> 60;
    if (((4 * v4) & 0xC) != 0) {
      return 16 - ((4 * v4) & 0xC | (v4 >> 2));
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v8 = type metadata accessor for UnknownStorage();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_100064D50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100064D64);
}

void *sub_100064D64(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 12)
  {
    *uint64_t result = 0;
    result[1] = (unint64_t)(((-(int)a2 >> 2) & 3) - 4 * a2) << 60;
  }
  else
  {
    uint64_t v7 = type metadata accessor for UnknownStorage();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 24);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_100064E14()
{
  uint64_t result = type metadata accessor for UnknownStorage();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_100064EB4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = *a2;
    unint64_t v8 = a2[1];
    sub_100060F68(*a2, v8);
    *a1 = v7;
    a1[1] = v8;
    uint64_t v9 = a2[2];
    unint64_t v10 = a2[3];
    sub_100060F68(v9, v10);
    a1[2] = v9;
    a1[3] = v10;
    uint64_t v11 = a2[4];
    unint64_t v12 = a2[5];
    sub_100060F68(v11, v12);
    a1[4] = v11;
    a1[5] = v12;
    uint64_t v13 = a2[6];
    unint64_t v14 = a2[7];
    sub_100060F68(v13, v14);
    a1[6] = v13;
    a1[7] = v14;
    uint64_t v15 = *(int *)(a3 + 32);
    uint64_t v16 = (char *)a1 + v15;
    uint64_t v17 = (char *)a2 + v15;
    uint64_t v18 = type metadata accessor for UnknownStorage();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
  }
  return a1;
}

uint64_t sub_100064FD8(uint64_t a1, uint64_t a2)
{
  sub_100060FC0(*(void *)a1, *(void *)(a1 + 8));
  sub_100060FC0(*(void *)(a1 + 16), *(void *)(a1 + 24));
  sub_100060FC0(*(void *)(a1 + 32), *(void *)(a1 + 40));
  sub_100060FC0(*(void *)(a1 + 48), *(void *)(a1 + 56));
  uint64_t v4 = a1 + *(int *)(a2 + 32);
  uint64_t v5 = type metadata accessor for UnknownStorage();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

uint64_t *sub_10006506C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  unint64_t v7 = a2[1];
  sub_100060F68(*a2, v7);
  *a1 = v6;
  a1[1] = v7;
  uint64_t v8 = a2[2];
  unint64_t v9 = a2[3];
  sub_100060F68(v8, v9);
  a1[2] = v8;
  a1[3] = v9;
  uint64_t v10 = a2[4];
  unint64_t v11 = a2[5];
  sub_100060F68(v10, v11);
  a1[4] = v10;
  a1[5] = v11;
  uint64_t v12 = a2[6];
  unint64_t v13 = a2[7];
  sub_100060F68(v12, v13);
  a1[6] = v12;
  a1[7] = v13;
  uint64_t v14 = *(int *)(a3 + 32);
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
  return a1;
}

uint64_t *sub_100065140(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  unint64_t v7 = a2[1];
  sub_100060F68(*a2, v7);
  uint64_t v8 = *a1;
  unint64_t v9 = a1[1];
  *a1 = v6;
  a1[1] = v7;
  sub_100060FC0(v8, v9);
  uint64_t v10 = a2[2];
  unint64_t v11 = a2[3];
  sub_100060F68(v10, v11);
  uint64_t v12 = a1[2];
  unint64_t v13 = a1[3];
  a1[2] = v10;
  a1[3] = v11;
  sub_100060FC0(v12, v13);
  uint64_t v14 = a2[4];
  unint64_t v15 = a2[5];
  sub_100060F68(v14, v15);
  uint64_t v16 = a1[4];
  unint64_t v17 = a1[5];
  a1[4] = v14;
  a1[5] = v15;
  sub_100060FC0(v16, v17);
  uint64_t v18 = a2[6];
  unint64_t v19 = a2[7];
  sub_100060F68(v18, v19);
  uint64_t v20 = a1[6];
  unint64_t v21 = a1[7];
  a1[6] = v18;
  a1[7] = v19;
  sub_100060FC0(v20, v21);
  uint64_t v22 = *(int *)(a3 + 32);
  uint64_t v23 = (char *)a1 + v22;
  uint64_t v24 = (char *)a2 + v22;
  uint64_t v25 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 24))(v23, v24, v25);
  return a1;
}

_OWORD *sub_100065234(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  long long v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = *(int *)(a3 + 32);
  unint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  return a1;
}

uint64_t *sub_1000652B8(uint64_t *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_100060FC0(v6, v7);
  uint64_t v8 = a1[2];
  unint64_t v9 = a1[3];
  *((_OWORD *)a1 + 1) = a2[1];
  sub_100060FC0(v8, v9);
  uint64_t v10 = a1[4];
  unint64_t v11 = a1[5];
  *((_OWORD *)a1 + 2) = a2[2];
  sub_100060FC0(v10, v11);
  uint64_t v12 = a1[6];
  unint64_t v13 = a1[7];
  *((_OWORD *)a1 + 3) = a2[3];
  sub_100060FC0(v12, v13);
  uint64_t v14 = *(int *)(a3 + 32);
  unint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 40))(v15, v16, v17);
  return a1;
}

uint64_t sub_100065378(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10006538C);
}

uint64_t sub_10006538C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 12)
  {
    uint64_t v4 = *(void *)(a1 + 8) >> 60;
    if (((4 * v4) & 0xC) != 0) {
      return 16 - ((4 * v4) & 0xC | (v4 >> 2));
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v8 = type metadata accessor for UnknownStorage();
    unint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 32);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_100065448(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10006545C);
}

void *sub_10006545C(void *result, uint64_t a2, int a3, uint64_t a4)
{
  long long v5 = result;
  if (a3 == 12)
  {
    *uint64_t result = 0;
    result[1] = (unint64_t)(((-(int)a2 >> 2) & 3) - 4 * a2) << 60;
  }
  else
  {
    uint64_t v7 = type metadata accessor for UnknownStorage();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 32);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_10006550C()
{
  uint64_t result = type metadata accessor for UnknownStorage();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1000655A8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = *a2;
    unint64_t v8 = a2[1];
    sub_100060F68(*a2, v8);
    *a1 = v7;
    a1[1] = v8;
    uint64_t v9 = a2[2];
    unint64_t v10 = a2[3];
    sub_100060F68(v9, v10);
    a1[2] = v9;
    a1[3] = v10;
    uint64_t v11 = a2[4];
    unint64_t v12 = a2[5];
    sub_100060F68(v11, v12);
    a1[4] = v11;
    a1[5] = v12;
    uint64_t v13 = *(int *)(a3 + 28);
    uint64_t v14 = (char *)a1 + v13;
    unint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = type metadata accessor for UnknownStorage();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  }
  return a1;
}

uint64_t sub_1000656B8(uint64_t a1, uint64_t a2)
{
  sub_100060FC0(*(void *)a1, *(void *)(a1 + 8));
  sub_100060FC0(*(void *)(a1 + 16), *(void *)(a1 + 24));
  sub_100060FC0(*(void *)(a1 + 32), *(void *)(a1 + 40));
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = type metadata accessor for UnknownStorage();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

uint64_t *sub_100065744(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  unint64_t v7 = a2[1];
  sub_100060F68(*a2, v7);
  *a1 = v6;
  a1[1] = v7;
  uint64_t v8 = a2[2];
  unint64_t v9 = a2[3];
  sub_100060F68(v8, v9);
  a1[2] = v8;
  a1[3] = v9;
  uint64_t v10 = a2[4];
  unint64_t v11 = a2[5];
  sub_100060F68(v10, v11);
  a1[4] = v10;
  a1[5] = v11;
  uint64_t v12 = *(int *)(a3 + 28);
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  return a1;
}

uint64_t *sub_100065804(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  unint64_t v7 = a2[1];
  sub_100060F68(*a2, v7);
  uint64_t v8 = *a1;
  unint64_t v9 = a1[1];
  *a1 = v6;
  a1[1] = v7;
  sub_100060FC0(v8, v9);
  uint64_t v10 = a2[2];
  unint64_t v11 = a2[3];
  sub_100060F68(v10, v11);
  uint64_t v12 = a1[2];
  unint64_t v13 = a1[3];
  a1[2] = v10;
  a1[3] = v11;
  sub_100060FC0(v12, v13);
  uint64_t v14 = a2[4];
  unint64_t v15 = a2[5];
  sub_100060F68(v14, v15);
  uint64_t v16 = a1[4];
  unint64_t v17 = a1[5];
  a1[4] = v14;
  a1[5] = v15;
  sub_100060FC0(v16, v17);
  uint64_t v18 = *(int *)(a3 + 28);
  unint64_t v19 = (char *)a1 + v18;
  uint64_t v20 = (char *)a2 + v18;
  uint64_t v21 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 24))(v19, v20, v21);
  return a1;
}

_OWORD *sub_1000658DC(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  uint64_t v5 = *(int *)(a3 + 28);
  uint64_t v6 = (char *)a1 + v5;
  unint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

uint64_t *sub_100065960(uint64_t *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_100060FC0(v6, v7);
  uint64_t v8 = a1[2];
  unint64_t v9 = a1[3];
  *((_OWORD *)a1 + 1) = a2[1];
  sub_100060FC0(v8, v9);
  uint64_t v10 = a1[4];
  unint64_t v11 = a1[5];
  *((_OWORD *)a1 + 2) = a2[2];
  sub_100060FC0(v10, v11);
  uint64_t v12 = *(int *)(a3 + 28);
  unint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  return a1;
}

uint64_t sub_100065A10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100065A24);
}

uint64_t sub_100065A28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100065A3C);
}

uint64_t *sub_100065A40(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = *a2;
    unint64_t v8 = a2[1];
    sub_100060F68(*a2, v8);
    *a1 = v7;
    a1[1] = v8;
    uint64_t v9 = a2[3];
    a1[2] = a2[2];
    unint64_t v10 = a2[4];
    sub_100060F68(v9, v10);
    a1[3] = v9;
    a1[4] = v10;
    uint64_t v11 = *(int *)(a3 + 28);
    uint64_t v12 = (char *)a1 + v11;
    unint64_t v13 = (char *)a2 + v11;
    uint64_t v14 = type metadata accessor for UnknownStorage();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  }
  return a1;
}

uint64_t sub_100065B44(uint64_t a1, uint64_t a2)
{
  sub_100060FC0(*(void *)a1, *(void *)(a1 + 8));
  sub_100060FC0(*(void *)(a1 + 24), *(void *)(a1 + 32));
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = type metadata accessor for UnknownStorage();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

uint64_t *sub_100065BC8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  unint64_t v7 = a2[1];
  sub_100060F68(*a2, v7);
  *a1 = v6;
  a1[1] = v7;
  uint64_t v8 = a2[3];
  a1[2] = a2[2];
  unint64_t v9 = a2[4];
  sub_100060F68(v8, v9);
  a1[3] = v8;
  a1[4] = v9;
  uint64_t v10 = *(int *)(a3 + 28);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
  return a1;
}

uint64_t *sub_100065C7C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  unint64_t v7 = a2[1];
  sub_100060F68(*a2, v7);
  uint64_t v8 = *a1;
  unint64_t v9 = a1[1];
  *a1 = v6;
  a1[1] = v7;
  sub_100060FC0(v8, v9);
  a1[2] = a2[2];
  uint64_t v10 = a2[3];
  unint64_t v11 = a2[4];
  sub_100060F68(v10, v11);
  uint64_t v12 = a1[3];
  unint64_t v13 = a1[4];
  a1[3] = v10;
  a1[4] = v11;
  sub_100060FC0(v12, v13);
  uint64_t v14 = *(int *)(a3 + 28);
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 24))(v15, v16, v17);
  return a1;
}

uint64_t sub_100065D40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v4 = *(int *)(a3 + 28);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = type metadata accessor for UnknownStorage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t sub_100065DCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a1;
  unint64_t v7 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_100060FC0(v6, v7);
  uint64_t v8 = *(void *)(a2 + 32);
  uint64_t v9 = *(void *)(a1 + 24);
  unint64_t v10 = *(void *)(a1 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = v8;
  sub_100060FC0(v9, v10);
  uint64_t v11 = *(int *)(a3 + 28);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = type metadata accessor for UnknownStorage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t sub_100065E74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100065E88);
}

uint64_t sub_100065E8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 12)
  {
    uint64_t v4 = *(void *)(a1 + 8) >> 60;
    if (((4 * v4) & 0xC) != 0) {
      return 16 - ((4 * v4) & 0xC | (v4 >> 2));
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v8 = type metadata accessor for UnknownStorage();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_100065F48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100065F5C);
}

void *sub_100065F60(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 12)
  {
    *uint64_t result = 0;
    result[1] = (unint64_t)(((-(int)a2 >> 2) & 3) - 4 * a2) << 60;
  }
  else
  {
    uint64_t v7 = type metadata accessor for UnknownStorage();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 28);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_100066010()
{
  return sub_1000665C4();
}

uint64_t *sub_10006602C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  char v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *char v3 = *a2;
    char v3 = (uint64_t *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    uint64_t v7 = *(int *)(a3 + 28);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = type metadata accessor for UnknownStorage();
    uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(v8, v9, v10);
  }
  return v3;
}

uint64_t sub_100066124(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = type metadata accessor for UnknownStorage();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *sub_1000661A4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for UnknownStorage();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  return a1;
}

void *sub_10006624C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *sub_100066308(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 28);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

void *sub_100066384(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 28);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t sub_100066420(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100066434);
}

uint64_t sub_100066434(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for UnknownStorage();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1000664E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000664F8);
}

uint64_t sub_1000664F8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + _Block_object_dispose(&STACK[0x410], 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for UnknownStorage();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_1000665A0()
{
  return sub_1000665C4();
}

uint64_t sub_1000665C4()
{
  uint64_t result = type metadata accessor for UnknownStorage();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_100066658(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v20 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = *a2;
    unint64_t v8 = a2[1];
    sub_100060F68(*a2, v8);
    *a1 = v7;
    a1[1] = v8;
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = type metadata accessor for UnknownStorage();
    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    v13(v10, v11, v12);
    uint64_t v14 = *(int *)(a3 + 24);
    uint64_t v15 = (uint64_t *)((char *)a1 + v14);
    uint64_t v16 = (uint64_t *)((char *)a2 + v14);
    uint64_t v17 = type metadata accessor for ErrorDomainCode(0);
    uint64_t v18 = *(void *)(v17 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
    {
      uint64_t v19 = sub_100061118(&qword_1000A6BE0);
      memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64));
    }
    else
    {
      uint64_t v21 = v16[1];
      *uint64_t v15 = *v16;
      v15[1] = v21;
      uint64_t v22 = v16[3];
      void v15[2] = v16[2];
      v15[3] = v22;
      uint64_t v23 = *(int *)(v17 + 28);
      uint64_t v24 = (char *)v15 + v23;
      uint64_t v25 = (char *)v16 + v23;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v13(v24, v25, v12);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
    }
  }
  return a1;
}

uint64_t sub_10006684C(uint64_t a1, uint64_t a2)
{
  sub_100060FC0(*(void *)a1, *(void *)(a1 + 8));
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = type metadata accessor for UnknownStorage();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v10(v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 24);
  uint64_t v7 = type metadata accessor for ErrorDomainCode(0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7);
  if (!result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v9 = v6 + *(int *)(v7 + 28);
    return ((uint64_t (*)(uint64_t, uint64_t))v10)(v9, v5);
  }
  return result;
}

uint64_t *sub_10006696C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  unint64_t v7 = a2[1];
  sub_100060F68(*a2, v7);
  *a1 = v6;
  a1[1] = v7;
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = type metadata accessor for UnknownStorage();
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
  v12(v9, v10, v11);
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = (uint64_t *)((char *)a1 + v13);
  uint64_t v15 = (uint64_t *)((char *)a2 + v13);
  uint64_t v16 = type metadata accessor for ErrorDomainCode(0);
  uint64_t v17 = *(void *)(v16 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
  {
    uint64_t v18 = sub_100061118(&qword_1000A6BE0);
    memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    uint64_t v19 = v15[1];
    void *v14 = *v15;
    v14[1] = v19;
    uint64_t v20 = v15[3];
    v14[2] = v15[2];
    v14[3] = v20;
    uint64_t v21 = *(int *)(v16 + 28);
    uint64_t v22 = (char *)v14 + v21;
    uint64_t v23 = (char *)v15 + v21;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v22, v23, v11);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  return a1;
}

uint64_t *sub_100066B10(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  unint64_t v7 = a2[1];
  sub_100060F68(*a2, v7);
  uint64_t v8 = *a1;
  unint64_t v9 = a1[1];
  *a1 = v6;
  a1[1] = v7;
  sub_100060FC0(v8, v9);
  uint64_t v10 = *(int *)(a3 + 20);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = type metadata accessor for UnknownStorage();
  uint64_t v28 = *(void *)(v13 - 8);
  uint64_t v29 = v13;
  uint64_t v14 = *(void (**)(char *, char *))(v28 + 24);
  v14(v11, v12);
  uint64_t v15 = *(int *)(a3 + 24);
  uint64_t v16 = (uint64_t *)((char *)a1 + v15);
  uint64_t v17 = (uint64_t *)((char *)a2 + v15);
  uint64_t v18 = type metadata accessor for ErrorDomainCode(0);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v19 + 48);
  LODWORD(v12) = v20(v16, 1, v18);
  int v21 = v20(v17, 1, v18);
  if (!v12)
  {
    if (!v21)
    {
      void *v16 = *v17;
      v16[1] = v17[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      void v16[2] = v17[2];
      v16[3] = v17[3];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      ((void (*)(char *, char *, uint64_t))v14)((char *)v16 + *(int *)(v18 + 28), (char *)v17 + *(int *)(v18 + 28), v29);
      return a1;
    }
    sub_100067CCC((uint64_t)v16, type metadata accessor for ErrorDomainCode);
    goto LABEL_6;
  }
  if (v21)
  {
LABEL_6:
    uint64_t v26 = sub_100061118(&qword_1000A6BE0);
    memcpy(v16, v17, *(void *)(*(void *)(v26 - 8) + 64));
    return a1;
  }
  void *v16 = *v17;
  v16[1] = v17[1];
  void v16[2] = v17[2];
  v16[3] = v17[3];
  uint64_t v22 = *(int *)(v18 + 28);
  uint64_t v23 = (char *)v16 + v22;
  uint64_t v24 = (char *)v17 + v22;
  uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v28 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v25(v23, v24, v29);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
  return a1;
}

_OWORD *sub_100066D90(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  unint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for UnknownStorage();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (_OWORD *)((char *)a1 + v11);
  uint64_t v13 = (_OWORD *)((char *)a2 + v11);
  uint64_t v14 = type metadata accessor for ErrorDomainCode(0);
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    uint64_t v16 = sub_100061118(&qword_1000A6BE0);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    long long v17 = v13[1];
    *uint64_t v12 = *v13;
    v12[1] = v17;
    v10((char *)v12 + *(int *)(v14 + 28), (char *)v13 + *(int *)(v14 + 28), v9);
    (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  return a1;
}

uint64_t *sub_100066F04(uint64_t *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_100060FC0(v6, v7);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = type metadata accessor for UnknownStorage();
  uint64_t v25 = *(void *)(v11 - 8);
  uint64_t v26 = v11;
  uint64_t v12 = *(void (**)(char *, char *))(v25 + 40);
  v12(v9, v10);
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = (uint64_t *)((char *)a1 + v13);
  uint64_t v15 = (void *)((char *)a2 + v13);
  uint64_t v16 = type metadata accessor for ErrorDomainCode(0);
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v17 + 48);
  LODWORD(v10) = v18(v14, 1, v16);
  int v19 = v18(v15, 1, v16);
  if (!v10)
  {
    if (!v19)
    {
      uint64_t v23 = v15[1];
      void *v14 = *v15;
      v14[1] = v23;
      swift_bridgeObjectRelease();
      uint64_t v24 = v15[3];
      v14[2] = v15[2];
      v14[3] = v24;
      swift_bridgeObjectRelease();
      ((void (*)(char *, char *, uint64_t))v12)((char *)v14 + *(int *)(v16 + 28), (char *)v15 + *(int *)(v16 + 28), v26);
      return a1;
    }
    sub_100067CCC((uint64_t)v14, type metadata accessor for ErrorDomainCode);
    goto LABEL_6;
  }
  if (v19)
  {
LABEL_6:
    uint64_t v21 = sub_100061118(&qword_1000A6BE0);
    memcpy(v14, v15, *(void *)(*(void *)(v21 - 8) + 64));
    return a1;
  }
  long long v20 = *((_OWORD *)v15 + 1);
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  *((_OWORD *)v14 + 1) = v20;
  (*(void (**)(char *, char *, uint64_t))(v25 + 32))((char *)v14 + *(int *)(v16 + 28), (char *)v15 + *(int *)(v16 + 28), v26);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  return a1;
}

uint64_t sub_10006712C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100067140);
}

uint64_t sub_100067140(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 12)
  {
    uint64_t v4 = *(void *)(a1 + 8) >> 60;
    if (((4 * v4) & 0xC) != 0) {
      return 16 - ((4 * v4) & 0xC | (v4 >> 2));
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v8 = type metadata accessor for UnknownStorage();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 20);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_100061118(&qword_1000A6BE0);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 24);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t sub_10006727C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100067290);
}

void *sub_100067290(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 12)
  {
    *uint64_t result = 0;
    result[1] = (unint64_t)(((-(int)a2 >> 2) & 3) - 4 * a2) << 60;
  }
  else
  {
    uint64_t v8 = type metadata accessor for UnknownStorage();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = (char *)v5 + *(int *)(a4 + 20);
      uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return (void *)v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_100061118(&qword_1000A6BE0);
      uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = (char *)v5 + *(int *)(a4 + 24);
      return (void *)v14(v16, a2, a2, v15);
    }
  }
  return result;
}

void sub_1000673C8()
{
  type metadata accessor for UnknownStorage();
  if (v0 <= 0x3F)
  {
    sub_10006749C();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_10006749C()
{
  if (!qword_1000A7248)
  {
    type metadata accessor for ErrorDomainCode(255);
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000A7248);
    }
  }
}

void *sub_1000674F4(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  char v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *char v3 = *a2;
    char v3 = (void *)(v13 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + _Block_object_dispose(&STACK[0x410], 8) = v5;
    uint64_t v6 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v6;
    uint64_t v7 = a2[5];
    *(void *)(a1 + 32) = a2[4];
    *(void *)(a1 + 40) = v7;
    *(_OWORD *)(a1 + 4_Block_object_dispose(&STACK[0x410], 8) = *((_OWORD *)a2 + 3);
    uint64_t v8 = *(int *)(a3 + 40);
    uint64_t v9 = a1 + v8;
    uint64_t v10 = (uint64_t)a2 + v8;
    *(void *)(a1 + 64) = a2[8];
    uint64_t v11 = type metadata accessor for UnknownStorage();
    uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
  }
  return v3;
}

uint64_t sub_10006761C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 40);
  uint64_t v5 = type metadata accessor for UnknownStorage();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

uint64_t sub_1000676AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + _Block_object_dispose(&STACK[0x410], 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v5;
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  *(_OWORD *)(a1 + 4_Block_object_dispose(&STACK[0x410], 8) = *(_OWORD *)(a2 + 48);
  uint64_t v7 = *(int *)(a3 + 40);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  uint64_t v10 = type metadata accessor for UnknownStorage();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  return a1;
}

void *sub_100067784(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 40);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t sub_100067888(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  long long v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 4_Block_object_dispose(&STACK[0x410], 8) = v5;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  uint64_t v6 = *(int *)(a3 + 40);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = type metadata accessor for UnknownStorage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  return a1;
}

uint64_t sub_100067914(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + _Block_object_dispose(&STACK[0x410], 8) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v8;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 4_Block_object_dispose(&STACK[0x410], 8) = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRelease();
  uint64_t v9 = *(int *)(a3 + 40);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = type metadata accessor for UnknownStorage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  return a1;
}

uint64_t sub_1000679D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000679EC);
}

uint64_t sub_1000679EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for UnknownStorage();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 40);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_100067A9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100067AB0);
}

uint64_t sub_100067AB0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + _Block_object_dispose(&STACK[0x410], 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for UnknownStorage();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 40);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_100067B58()
{
  uint64_t result = type metadata accessor for UnknownStorage();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_100067C10()
{
  unint64_t result = qword_1000A7368;
  if (!qword_1000A7368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000A7368);
  }
  return result;
}

uint64_t sub_100067C64(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100067CCC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100067D2C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100061118(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t *sub_100067D88(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100067E30(uint64_t a1, unint64_t a2)
{
  return sub_100068024(a1, a2);
}

id sub_100067F40()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id sub_100067F74()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super init];
}

id sub_100067FEC()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super dealloc];
}

uint64_t sub_100068024(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = type metadata accessor for BinaryDecodingOptions();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = type metadata accessor for SASTTR(0);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = a1;
  unint64_t v13 = a2;
  uint64_t v11 = 0;
  memset(v10, 0, sizeof(v10));
  sub_100060F68(a1, a2);
  BinaryDecodingOptions.init()();
  sub_1000681BC();
  Message.init<A>(serializedBytes:extensions:partial:options:)();
  if (!v2)
  {
    uint64_t v6 = Message.serializedData(partial:)();
    sub_100068214((uint64_t)v8);
  }
  return v6;
}

uint64_t type metadata accessor for SASValidateTTRMessage()
{
  return self;
}

unint64_t sub_1000681BC()
{
  unint64_t result = qword_1000A6DA0;
  if (!qword_1000A6DA0)
  {
    type metadata accessor for SASTTR(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000A6DA0);
  }
  return result;
}

uint64_t sub_100068214(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SASTTR(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_100068270()
{
  unint64_t v0 = [0 kt_hexString];
  sub_10000C244();
  sub_10000C2B4((void *)&_mh_execute_header, v1, v2, "find: no sessionID: [%{public}@]", v3, v4, v5, v6, v7);
}

void sub_1000682FC()
{
  sub_10000C244();
  sub_10000C228((void *)&_mh_execute_header, v0, v1, "invalid sessionID: [%{public}@]", v2, v3, v4, v5, v6);
}

void sub_100068364(id *a1)
{
  uint64_t v1 = [*a1 kt_hexString];
  sub_10000C244();
  sub_10000C2B4((void *)&_mh_execute_header, v2, v3, "delete: no sessionID: [%{public}@]", v4, v5, v6, v7, v8);
}

void sub_1000683EC(unsigned __int16 a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%d no peerHandle", (uint8_t *)v2, 8u);
}

void sub_100068468(unsigned __int16 a1, uint64_t a2, os_log_t log)
{
  v3[0] = 67109634;
  v3[1] = a1;
  __int16 v4 = 2160;
  uint64_t v5 = 1752392040;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%d can't convert peerHandle %{mask.hash}@", (uint8_t *)v3, 0x1Cu);
}

void sub_100068508(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006858C()
{
  sub_10000C2A8();
  sub_10000C270((void *)&_mh_execute_header, v0, v1, "ktRevealA: no session, reject", v2, v3, v4, v5, v6);
}

void sub_1000685C0()
{
  sub_10000C250();
  sub_10000C28C((void *)&_mh_execute_header, v0, v1, "ktTeardown: no known session, rejected, %{mask.hash}@", v2, v3, v4, v5, v6);
}

void sub_100068628()
{
  sub_10000C250();
  sub_10000C28C((void *)&_mh_execute_header, v0, v1, "ktTeardown: no packet, %{mask.hash}@", v2, v3, v4, v5, v6);
}

void sub_100068690(void *a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [a1 sessionId];
  uint8_t v6 = [v5 kt_hexString];
  uint64_t v7 = [a2 localSessionID];
  uint8_t v8 = [v7 kt_hexString];
  uint64_t v9 = [a2 peerSessionID];
  uint64_t v10 = [v9 kt_hexString];
  int v11 = 138412802;
  uint64_t v12 = v6;
  __int16 v13 = 2112;
  uint64_t v14 = v8;
  __int16 v15 = 2112;
  uint64_t v16 = v10;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "ktTeardown: session didn't match: %@ vs (%@/%@)", (uint8_t *)&v11, 0x20u);
}

void sub_1000687B0()
{
  sub_10000C244();
  sub_10000C228((void *)&_mh_execute_header, v0, v1, "ktTTR: failed to parse %{public}@", v2, v3, v4, v5, v6);
}

void sub_100068818()
{
  sub_10000C2A8();
  sub_10000C270((void *)&_mh_execute_header, v0, v1, "ktTTR: no TTR", v2, v3, v4, v5, v6);
}

void sub_10006884C()
{
  sub_10000C2A8();
  sub_10000C270((void *)&_mh_execute_header, v0, v1, "ktTTR: no TTR (ff)", v2, v3, v4, v5, v6);
}

void sub_100068880()
{
  sub_10000C244();
  sub_10000C228((void *)&_mh_execute_header, v0, v1, "ktTTR: failed send %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000688E8()
{
  sub_10000C244();
  sub_10000C228((void *)&_mh_execute_header, v0, v1, "ktTTR: failed trigger ttr %{public}@", v2, v3, v4, v5, v6);
}

void sub_100068950()
{
  sub_10000C244();
  sub_10000C228((void *)&_mh_execute_header, v0, v1, "ktTTR: error handler %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000689B8()
{
  sub_10000C244();
  sub_10000C228((void *)&_mh_execute_header, v0, v1, "haveContact: failed send %{public}@", v2, v3, v4, v5, v6);
}

void sub_100068A20(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "haveContact: %@: failed trigger ttr %{public}@", (uint8_t *)&v4, 0x16u);
}

void sub_100068AAC()
{
  sub_10000C244();
  sub_10000C228((void *)&_mh_execute_header, v0, v1, "haveContact: error handler %{public}@", v2, v3, v4, v5, v6);
}

void sub_100068B14()
{
  sub_10000C244();
  sub_10000C228((void *)&_mh_execute_header, v0, v1, "onQueueMapMailbox unknown state: %@", v2, v3, v4, v5, v6);
}

void sub_100068B7C(void *a1)
{
  uint64_t v2 = [a1 negotiatedSessionID];
  uint64_t v3 = [v2 kt_hexString];
  uint64_t v4 = [a1 peerSessionID];
  uint64_t v5 = [v4 kt_hexString];
  sub_10002D078();
  sub_10002D090((void *)&_mh_execute_header, v6, v7, "confirming session neg: %{public}@ (local id %{public}@)", v8, v9, v10, v11, v12);
}

void sub_100068C48()
{
  sub_10000C2A8();
  sub_10000C270((void *)&_mh_execute_header, v0, v1, "validateAnnounce not present", v2, v3, v4, v5, v6);
}

void sub_100068C7C()
{
  sub_10000C244();
  sub_10000C228((void *)&_mh_execute_header, v0, v1, "validateAnnounce parse failed: %@", v2, v3, v4, v5, v6);
}

void sub_100068CE4()
{
  sub_10000C2A8();
  sub_10000C270((void *)&_mh_execute_header, v0, v1, "no session id too short", v2, v3, v4, v5, v6);
}

void sub_100068D18()
{
  sub_10000C2A8();
  sub_10000C270((void *)&_mh_execute_header, v0, v1, "announceMismatch not present", v2, v3, v4, v5, v6);
}

void sub_100068D4C()
{
  sub_10000C244();
  sub_10000C228((void *)&_mh_execute_header, v0, v1, "announceMismatch parse failed: %@", v2, v3, v4, v5, v6);
}

void sub_100068DB4(void *a1, void *a2)
{
  uint64_t v3 = [a1 localSessionID];
  uint64_t v4 = [v3 kt_hexString];
  uint64_t v5 = [a2 peerSessionId];
  uint8_t v6 = [v5 kt_hexString];
  sub_10002D078();
  sub_10002D090((void *)&_mh_execute_header, v7, v8, "announceMismatch sessionId mismatch: %{public}@ vs peer idea of self %{public}@", v9, v10, v11, v12, v13);
}

void sub_100068E80(void *a1, void *a2)
{
  uint64_t v3 = [a1 peerSessionID];
  uint64_t v4 = [v3 kt_hexString];
  uint64_t v5 = [a2 sessionId];
  uint8_t v6 = [v5 kt_hexString];
  sub_10002D078();
  sub_10002D090((void *)&_mh_execute_header, v7, v8, "announceMismatch peerSessionId mismatch: %{public}@ vs peer idea %{public}@", v9, v10, v11, v12, v13);
}

void sub_100068F4C()
{
  sub_10000C2A8();
  sub_10000C270((void *)&_mh_execute_header, v0, v1, "announce w/o peer info", v2, v3, v4, v5, v6);
}

void sub_100068F80()
{
  sub_10000C2A8();
  sub_10000C270((void *)&_mh_execute_header, v0, v1, "announce w/o announce", v2, v3, v4, v5, v6);
}

void sub_100068FB4()
{
  sub_10000C2A8();
  sub_10000C270((void *)&_mh_execute_header, v0, v1, "decide-ab have no peer announce", v2, v3, v4, v5, v6);
}

void sub_100068FE8()
{
  sub_10000C2A8();
  sub_10000C270((void *)&_mh_execute_header, v0, v1, "commit-a: no SAS for session", v2, v3, v4, v5, v6);
}

void sub_10006901C()
{
  sub_10000C2A8();
  sub_10000C270((void *)&_mh_execute_header, v0, v1, "commit-a: commit data", v2, v3, v4, v5, v6);
}

void sub_100069050()
{
  sub_10000C244();
  sub_10000C228((void *)&_mh_execute_header, v0, v1, "commit-a: session don't parse: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000690B8()
{
  sub_10000C2A8();
  sub_10000C270((void *)&_mh_execute_header, v0, v1, "commit-a: session length 0", v2, v3, v4, v5, v6);
}

void sub_1000690EC()
{
  sub_10000C2A8();
  sub_10000C270((void *)&_mh_execute_header, v0, v1, "commit-a: random length 0", v2, v3, v4, v5, v6);
}

void sub_100069120()
{
  sub_10000C2A8();
  sub_10000C270((void *)&_mh_execute_header, v0, v1, "ktSetupB: no SAS for session", v2, v3, v4, v5, v6);
}

void sub_100069154()
{
  sub_10000C2A8();
  sub_10000C270((void *)&_mh_execute_header, v0, v1, "DiscloseA: no SAS for session", v2, v3, v4, v5, v6);
}

void sub_100069188()
{
  sub_10000C2A8();
  sub_10000C270((void *)&_mh_execute_header, v0, v1, "DiscloseA: parse failed", v2, v3, v4, v5, v6);
}

void sub_1000691BC()
{
  sub_10000C2A8();
  sub_10000C270((void *)&_mh_execute_header, v0, v1, "ktRevealA: reveal mismatch", v2, v3, v4, v5, v6);
}

uint64_t __DataStorage._bytes.getter()
{
  return __DataStorage._bytes.getter();
}

uint64_t __DataStorage._length.getter()
{
  return __DataStorage._length.getter();
}

uint64_t __DataStorage._offset.getter()
{
  return __DataStorage._offset.getter();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t UnknownStorage.traverse<A>(visitor:)()
{
  return UnknownStorage.traverse<A>(visitor:)();
}

uint64_t UnknownStorage.init()()
{
  return UnknownStorage.init()();
}

uint64_t type metadata accessor for UnknownStorage()
{
  return type metadata accessor for UnknownStorage();
}

uint64_t BinaryDecodingOptions.init()()
{
  return BinaryDecodingOptions.init()();
}

uint64_t type metadata accessor for BinaryDecodingOptions()
{
  return type metadata accessor for BinaryDecodingOptions();
}

uint64_t _MessageImplementationBase._protobuf_generated_isEqualTo(other:)()
{
  return _MessageImplementationBase._protobuf_generated_isEqualTo(other:)();
}

uint64_t dispatch thunk of Decoder.nextFieldNumber()()
{
  return dispatch thunk of Decoder.nextFieldNumber()();
}

uint64_t dispatch thunk of Decoder.decodeRepeatedEnumField<A>(value:)()
{
  return dispatch thunk of Decoder.decodeRepeatedEnumField<A>(value:)();
}

uint64_t dispatch thunk of Decoder.decodeSingularEnumField<A>(value:)()
{
  return dispatch thunk of Decoder.decodeSingularEnumField<A>(value:)();
}

uint64_t dispatch thunk of Decoder.decodeSingularBytesField(value:)()
{
  return dispatch thunk of Decoder.decodeSingularBytesField(value:)();
}

uint64_t dispatch thunk of Decoder.decodeSingularInt64Field(value:)()
{
  return dispatch thunk of Decoder.decodeSingularInt64Field(value:)();
}

uint64_t dispatch thunk of Decoder.decodeSingularStringField(value:)()
{
  return dispatch thunk of Decoder.decodeSingularStringField(value:)();
}

uint64_t dispatch thunk of Decoder.decodeRepeatedMessageField<A>(value:)()
{
  return dispatch thunk of Decoder.decodeRepeatedMessageField<A>(value:)();
}

uint64_t dispatch thunk of Decoder.decodeSingularMessageField<A>(value:)()
{
  return dispatch thunk of Decoder.decodeSingularMessageField<A>(value:)();
}

uint64_t Message.isInitialized.getter()
{
  return Message.isInitialized.getter();
}

uint64_t Message.serializedData(partial:)()
{
  return Message.serializedData(partial:)();
}

uint64_t Message.init<A>(serializedBytes:extensions:partial:options:)()
{
  return Message.init<A>(serializedBytes:extensions:partial:options:)();
}

uint64_t Message.hash(into:)()
{
  return Message.hash(into:)();
}

uint64_t dispatch thunk of Visitor.visitPackedEnumField<A>(value:fieldNumber:)()
{
  return dispatch thunk of Visitor.visitPackedEnumField<A>(value:fieldNumber:)();
}

uint64_t dispatch thunk of Visitor.visitSingularEnumField<A>(value:fieldNumber:)()
{
  return dispatch thunk of Visitor.visitSingularEnumField<A>(value:fieldNumber:)();
}

uint64_t dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)()
{
  return dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)();
}

uint64_t dispatch thunk of Visitor.visitSingularInt64Field(value:fieldNumber:)()
{
  return dispatch thunk of Visitor.visitSingularInt64Field(value:fieldNumber:)();
}

uint64_t dispatch thunk of Visitor.visitSingularStringField(value:fieldNumber:)()
{
  return dispatch thunk of Visitor.visitSingularStringField(value:fieldNumber:)();
}

uint64_t dispatch thunk of Visitor.visitRepeatedMessageField<A>(value:fieldNumber:)()
{
  return dispatch thunk of Visitor.visitRepeatedMessageField<A>(value:fieldNumber:)();
}

uint64_t dispatch thunk of Visitor.visitSingularMessageField<A>(value:fieldNumber:)()
{
  return dispatch thunk of Visitor.visitSingularMessageField<A>(value:fieldNumber:)();
}

uint64_t type metadata accessor for _NameMap.NameDescription()
{
  return type metadata accessor for _NameMap.NameDescription();
}

uint64_t _NameMap.init(dictionaryLiteral:)()
{
  return _NameMap.init(dictionaryLiteral:)();
}

uint64_t type metadata accessor for _NameMap()
{
  return type metadata accessor for _NameMap();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateMutableCopy(allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return _CFDictionaryGetCount(theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
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

CFHashCode CFHash(CFTypeRef cf)
{
  return _CFHash(cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

uint64_t IDSCopyAddressDestinationForDestination()
{
  return _IDSCopyAddressDestinationForDestination();
}

uint64_t IDSCopyBestGuessIDForID()
{
  return _IDSCopyBestGuessIDForID();
}

id NSAllocateObject(Class aClass, NSUInteger extraBytes, NSZone *zone)
{
  return _NSAllocateObject(aClass, extraBytes, zone);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

NSZone *__cdecl NSZoneFromPointer(void *ptr)
{
  return _NSZoneFromPointer(ptr);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return _SecRandomCopyBytes(rnd, count, bytes);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _IDSIDProtocolVersionNumber()
{
  return __IDSIDProtocolVersionNumber();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return ___maskrune(a1, a2);
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return ___tolower(a1);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return ___toupper(a1);
}

uint64_t _os_assumes_log()
{
  return __os_assumes_log();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void abort(void)
{
}

void bzero(void *a1, size_t a2)
{
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return _class_addMethod(cls, name, imp, types);
}

Method *__cdecl class_copyMethodList(Class cls, unsigned int *outCount)
{
  return _class_copyMethodList(cls, outCount);
}

size_t class_getInstanceSize(Class cls)
{
  return _class_getInstanceSize(cls);
}

const char *__cdecl class_getName(Class cls)
{
  return _class_getName(cls);
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return _confstr(a1, a2, a3);
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

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return _dispatch_source_testcancel(source);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return _dispatch_walltime(when, delta);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

IMP imp_implementationWithBlock(id block)
{
  return _imp_implementationWithBlock(block);
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

SEL method_getName(Method m)
{
  return _method_getName(m);
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

long double modf(long double __x, long double *__y)
{
  return _modf(__x, __y);
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

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

Class objc_getMetaClass(const char *name)
{
  return _objc_getMetaClass(name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

Protocol *__cdecl objc_getProtocol(const char *name)
{
  return _objc_getProtocol(name);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

Class objc_lookUpClass(const char *name)
{
  return _objc_lookUpClass(name);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  objc_method_description MethodDescription = _protocol_getMethodDescription(p, aSel, isRequiredMethod, isInstanceMethod);
  types = MethodDescription.types;
  name = MethodDescription.name;
  result.types = types;
  result.name = name;
  return result;
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return _reallocf(__ptr, __size);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

const char *__cdecl sel_getName(SEL sel)
{
  return _sel_getName(sel);
}

SEL sel_getUid(const char *str)
{
  return _sel_getUid(str);
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return _setenv(__name, __value, __overwrite);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
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

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

uint64_t xpc_transaction_try_exit_clean()
{
  return _xpc_transaction_try_exit_clean();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend__onqueueContains_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_onqueueContains:");
}

id objc_msgSend__onqueueHandleFlag_(void *a1, const char *a2, ...)
{
  return [_onqueueHandleFlag:];
}

id objc_msgSend__onqueueNextStateMachineTransition(void *a1, const char *a2, ...)
{
  return _[a1 _onqueueNextStateMachineTransition];
}

id objc_msgSend__onqueueNextStateMachineTransition_flags_pendingFlags_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_onqueueNextStateMachineTransition:flags:pendingFlags:");
}

id objc_msgSend__onqueuePerformTimeoutWithUnderlyingError(void *a1, const char *a2, ...)
{
  return _[a1 _onqueuePerformTimeoutWithUnderlyingError];
}

id objc_msgSend__onqueuePerformTimeoutWithUnderlyingError_(void *a1, const char *a2, ...)
{
  return [_onqueuePerformTimeoutWithUnderlyingError:];
}

id objc_msgSend__onqueuePokeStateMachine(void *a1, const char *a2, ...)
{
  return _[a1 _onqueuePokeStateMachine];
}

id objc_msgSend__onqueueRecheckConditions(void *a1, const char *a2, ...)
{
  return _[a1 _onqueueRecheckConditions];
}

id objc_msgSend__onqueueRemoveFlag_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_onqueueRemoveFlag:");
}

id objc_msgSend__onqueueSendAnyPendingFlags(void *a1, const char *a2, ...)
{
  return _[a1 _onqueueSendAnyPendingFlags];
}

id objc_msgSend__onqueueSetFlag_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_onqueueSetFlag:");
}

id objc_msgSend__onqueueStart(void *a1, const char *a2, ...)
{
  return _[a1 _onqueueStart];
}

id objc_msgSend__onqueueStartNextStateMachineOperation_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_onqueueStartNextStateMachineOperation:");
}

id objc_msgSend__onqueueTimeoutError(void *a1, const char *a2, ...)
{
  return _[a1 _onqueueTimeoutError];
}

id objc_msgSend__onqueueTimerTick(void *a1, const char *a2, ...)
{
  return _[a1 _onqueueTimerTick];
}

id objc_msgSend__onqueueTrigger_maximumDelay_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_onqueueTrigger:maximumDelay:");
}

id objc_msgSend__setFileNameLocalizationEnabled_(void *a1, const char *a2, ...)
{
  return [a1 _setFileNameLocalizationEnabled:];
}

id objc_msgSend__setQueue_(void *a1, const char *a2, ...)
{
  return [a1 _setQueue:];
}

id objc_msgSend_aCommitRandom(void *a1, const char *a2, ...)
{
  return _[a1 aCommitRandom];
}

id objc_msgSend_aRandom(void *a1, const char *a2, ...)
{
  return _[a1 aRandom];
}

id objc_msgSend_accountKey_complete_(void *a1, const char *a2, ...)
{
  return [a1 accountKey:complete:];
}

id objc_msgSend_active(void *a1, const char *a2, ...)
{
  return _[a1 active];
}

id objc_msgSend_addDelegate_withDelegateProperties_queue_(void *a1, const char *a2, ...)
{
  return [a1 addDelegate:withDelegateProperties:queue:];
}

id objc_msgSend_addDependency_(void *a1, const char *a2, ...)
{
  return [a1 addDependency:];
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return [a1 addEntriesFromDictionary:];
}

id objc_msgSend_addExecutionBlock_(void *a1, const char *a2, ...)
{
  return [a1 addExecutionBlock:];
}

id objc_msgSend_addExtension_value_(void *a1, const char *a2, ...)
{
  return [a1 addExtension:value:];
}

id objc_msgSend_addExtensions_(void *a1, const char *a2, ...)
{
  return [a1 addExtensions:];
}

id objc_msgSend_addField_(void *a1, const char *a2, ...)
{
  return [a1 addField:];
}

id objc_msgSend_addFixed32_(void *a1, const char *a2, ...)
{
  return [a1 addFixed32:];
}

id objc_msgSend_addFixed64_(void *a1, const char *a2, ...)
{
  return [a1 addFixed64:];
}

id objc_msgSend_addGroup_(void *a1, const char *a2, ...)
{
  return [a1 addGroup:];
}

id objc_msgSend_addLengthDelimited_(void *a1, const char *a2, ...)
{
  return [a1 addLengthDelimited:];
}

id objc_msgSend_addMailbox_(void *a1, const char *a2, ...)
{
  return [a1 addMailbox:];
}

id objc_msgSend_addNullableDependency_(void *a1, const char *a2, ...)
{
  return [a1 addNullableDependency:];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 addObjectsFromArray:];
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return [a1 addOperation:];
}

id objc_msgSend_addRawEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return [a1 addRawEntriesFromDictionary:];
}

id objc_msgSend_addRawValue_(void *a1, const char *a2, ...)
{
  return [a1 addRawValue:];
}

id objc_msgSend_addRawValues_count_(void *a1, const char *a2, ...)
{
  return [a1 addRawValues:count:];
}

id objc_msgSend_addRawValuesFromArray_(void *a1, const char *a2, ...)
{
  return [a1 addRawValuesFromArray:];
}

id objc_msgSend_addUnknownMapEntry_value_(void *a1, const char *a2, ...)
{
  return [a1 addUnknownMapEntry:value:];
}

id objc_msgSend_addValue_(void *a1, const char *a2, ...)
{
  return [a1 addValue:];
}

id objc_msgSend_addValues_count_(void *a1, const char *a2, ...)
{
  return [a1 addValues:x0 count:x1];
}

id objc_msgSend_addValuesFromArray_(void *a1, const char *a2, ...)
{
  return [a1 addValuesFromArray:];
}

id objc_msgSend_addVarint_(void *a1, const char *a2, ...)
{
  return [a1 addVarint:];
}

id objc_msgSend_afterOperation(void *a1, const char *a2, ...)
{
  return _[a1 afterOperation];
}

id objc_msgSend_allDependentsSuccessful(void *a1, const char *a2, ...)
{
  return _[a1 allDependentsSuccessful];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allSMFlags(void *a1, const char *a2, ...)
{
  return _[a1 allSMFlags];
}

id objc_msgSend_allSMStates(void *a1, const char *a2, ...)
{
  return _[a1 allSMStates];
}

id objc_msgSend_allSuccessful_(void *a1, const char *a2, ...)
{
  return [a1 allSuccessful:];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_allocDescriptorForClass_messageName_fileDescription_fields_fieldCount_storageSize_flags_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:");
}

id objc_msgSend_allocDescriptorForClass_rootClass_file_fields_fieldCount_storageSize_flags_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:");
}

id objc_msgSend_allocDescriptorForName_valueNames_values_count_enumVerifier_extraTextFormatInfo_(void *a1, const char *a2, ...)
{
  return [a1 allocDescriptorForName:x0 valueNames:x1 values:x2 count:x3 enumVerifier:x4 extraTextFormatInfo:x5];
}

id objc_msgSend_allocDescriptorForName_valueNames_values_count_enumVerifier_flags_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "allocDescriptorForName:valueNames:values:count:enumVerifier:flags:");
}

id objc_msgSend_allocDescriptorForName_valueNames_values_count_enumVerifier_flags_extraTextFormatInfo_(void *a1, const char *a2, ...)
{
  return [a1 allocDescriptorForName:x0 valueNames:x1 values:x2 count:x3 enumVerifier:x4 flags:x5 extraTextFormatInfo:x6];
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return [a1 allocWithZone:];
}

id objc_msgSend_allowPendingFlags(void *a1, const char *a2, ...)
{
  return _[a1 allowPendingFlags];
}

id objc_msgSend_alternateWireType(void *a1, const char *a2, ...)
{
  return _[a1 alternateWireType];
}

id objc_msgSend_announceMismatch(void *a1, const char *a2, ...)
{
  return _[a1 announceMismatch];
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return [a1 appendFormat:];
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return [a1 appendString:];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObject:];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:count:];
}

id objc_msgSend_asPathStep(void *a1, const char *a2, ...)
{
  return _[a1 asPathStep];
}

id objc_msgSend_bRandom(void *a1, const char *a2, ...)
{
  return _[a1 bRandom];
}

id objc_msgSend_backoff(void *a1, const char *a2, ...)
{
  return _[a1 backoff];
}

id objc_msgSend_bag(void *a1, const char *a2, ...)
{
  return _[a1 bag];
}

id objc_msgSend_beforeRatelimit(void *a1, const char *a2, ...)
{
  return _[a1 beforeRatelimit];
}

id objc_msgSend_blockOperationWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 blockOperationWithBlock:];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_calcValueNameOffsets(void *a1, const char *a2, ...)
{
  return _[a1 calcValueNameOffsets];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _[a1 cancel];
}

id objc_msgSend_cancelAllOperations(void *a1, const char *a2, ...)
{
  return _[a1 cancelAllOperations];
}

id objc_msgSend_chain(void *a1, const char *a2, ...)
{
  return _[a1 chain];
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 characterAtIndex:];
}

id objc_msgSend_checkLastTagWas_(void *a1, const char *a2, ...)
{
  return [a1 checkLastTagWas:];
}

id objc_msgSend_checkReachabilityOperation(void *a1, const char *a2, ...)
{
  return _[a1 checkReachabilityOperation];
}

id objc_msgSend_checkUnlockOperation(void *a1, const char *a2, ...)
{
  return _[a1 checkUnlockOperation];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return _[a1 close];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return [a1 compare:];
}

id objc_msgSend_compareLocalSessionID_remoteSessionID_(void *a1, const char *a2, ...)
{
  return [a1 compareLocalSessionID:remoteSessionID];
}

id objc_msgSend_complete(void *a1, const char *a2, ...)
{
  return _[a1 complete];
}

id objc_msgSend_completeOperation(void *a1, const char *a2, ...)
{
  return _[a1 completeOperation];
}

id objc_msgSend_completed(void *a1, const char *a2, ...)
{
  return _[a1 completed];
}

id objc_msgSend_completionHandlerDidRunCondition(void *a1, const char *a2, ...)
{
  return _[a1 completionHandlerDidRunCondition];
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return [a1 componentsJoinedByString:];
}

id objc_msgSend_computeSerializedSizeAsField_(void *a1, const char *a2, ...)
{
  return [a1 computeSerializedSizeAsField:];
}

id objc_msgSend_conditionChecksInFlight(void *a1, const char *a2, ...)
{
  return _[a1 conditionChecksInFlight];
}

id objc_msgSend_conditions(void *a1, const char *a2, ...)
{
  return _[a1 conditions];
}

id objc_msgSend_containingMessageClass(void *a1, const char *a2, ...)
{
  return _[a1 containingMessageClass];
}

id objc_msgSend_containingType(void *a1, const char *a2, ...)
{
  return _[a1 containingType];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentsAsString(void *a1, const char *a2, ...)
{
  return _[a1 contentsAsString];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyFieldsInto_zone_descriptor_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "copyFieldsInto:zone:descriptor:");
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return [a1 copyWithZone:];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countOfFields(void *a1, const char *a2, ...)
{
  return _[a1 countOfFields];
}

id objc_msgSend_createOperationToFinishAttempt_(void *a1, const char *a2, ...)
{
  return [a1 createOperationToFinishAttempt:];
}

id objc_msgSend_currentConditions(void *a1, const char *a2, ...)
{
  return _[a1 currentConditions];
}

id objc_msgSend_currentDelay(void *a1, const char *a2, ...)
{
  return _[a1 currentDelay];
}

id objc_msgSend_currentFlags(void *a1, const char *a2, ...)
{
  return _[a1 currentFlags];
}

id objc_msgSend_currentReachability(void *a1, const char *a2, ...)
{
  return _[a1 currentReachability];
}

id objc_msgSend_currentState(void *a1, const char *a2, ...)
{
  return _[a1 currentState];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_dataType(void *a1, const char *a2, ...)
{
  return _[a1 dataType];
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return [a1 dataUsingEncoding:];
}

id objc_msgSend_dataWithData_(void *a1, const char *a2, ...)
{
  return [a1 dataWithData:];
}

id objc_msgSend_dataWithLength_(void *a1, const char *a2, ...)
{
  return [a1 dataWithLength:];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return [a1 dateWithTimeIntervalSinceNow:];
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeObjectOfClass:forKey:];
}

id objc_msgSend_deepCopyWithZone_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "deepCopyWithZone:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultValue(void *a1, const char *a2, ...)
{
  return _[a1 defaultValue];
}

id objc_msgSend_deleteSessionByID_(void *a1, const char *a2, ...)
{
  return [a1 deleteSessionByID:];
}

id objc_msgSend_deletedHandles(void *a1, const char *a2, ...)
{
  return _[a1 deletedHandles];
}

id objc_msgSend_dependOnBeforeGroupFinished_(void *a1, const char *a2, ...)
{
  return [a1 dependOnBeforeGroupFinished:];
}

id objc_msgSend_dependencies(void *a1, const char *a2, ...)
{
  return _[a1 dependencies];
}

id objc_msgSend_dependenciesDescriptionError(void *a1, const char *a2, ...)
{
  return _[a1 dependenciesDescriptionError];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_descriptionError(void *a1, const char *a2, ...)
{
  return _[a1 descriptionError];
}

id objc_msgSend_descriptionErrorCode(void *a1, const char *a2, ...)
{
  return _[a1 descriptionErrorCode];
}

id objc_msgSend_descriptor(void *a1, const char *a2, ...)
{
  return _[a1 descriptor];
}

id objc_msgSend_destinationIDSID(void *a1, const char *a2, ...)
{
  return _[a1 destinationIDSID];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_didChangeValueForKey_(void *a1, const char *a2, ...)
{
  return [a1 didChangeValueForKey:];
}

id objc_msgSend_doWatchedStateMachineRPC_sourceStates_path_transitionOp_reply_(void *a1, const char *a2, ...)
{
  return [a1 doWatchedStateMachineRPC:x0 sourceStates:x1 path:x2 transitionOp:x3 reply:x4];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_dumpFlags(void *a1, const char *a2, ...)
{
  return _[a1 dumpFlags];
}

id objc_msgSend_dumpState_(void *a1, const char *a2, ...)
{
  return [a1 dumpState:];
}

id objc_msgSend_earlierDate_(void *a1, const char *a2, ...)
{
  return [a1 earlierDate:];
}

id objc_msgSend_enumDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 enumDescriptor];
}

id objc_msgSend_enumVerifier(void *a1, const char *a2, ...)
{
  return _[a1 enumVerifier];
}

id objc_msgSend_enumerateForTextFormat_(void *a1, const char *a2, ...)
{
  return [a1 enumerateForTextFormat:];
}

id objc_msgSend_enumerateKeysAndBoolsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateKeysAndBoolsUsingBlock:];
}

id objc_msgSend_enumerateKeysAndDoublesUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateKeysAndDoublesUsingBlock:];
}

id objc_msgSend_enumerateKeysAndFloatsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateKeysAndFloatsUsingBlock:];
}

id objc_msgSend_enumerateKeysAndInt32sUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateKeysAndInt32sUsingBlock:];
}

id objc_msgSend_enumerateKeysAndInt64sUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateKeysAndInt64sUsingBlock:];
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateKeysAndObjectsUsingBlock:];
}

id objc_msgSend_enumerateKeysAndRawValuesUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateKeysAndRawValuesUsingBlock:];
}

id objc_msgSend_enumerateKeysAndUInt32sUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateKeysAndUInt32sUsingBlock:];
}

id objc_msgSend_enumerateKeysAndUInt64sUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateKeysAndUInt64sUsingBlock:];
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateObjectsUsingBlock:];
}

id objc_msgSend_enumerateRawValuesWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateRawValuesWithBlock:];
}

id objc_msgSend_enumerateValuesWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateValuesWithBlock:];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return _[a1 error];
}

id objc_msgSend_errorWithDomain_code_description_(void *a1, const char *a2, ...)
{
  return [a1 errorWithDomain:code:description:];
}

id objc_msgSend_errorWithDomain_code_description_underlying_(void *a1, const char *a2, ...)
{
  return [a1 errorWithDomain:x0 code:x1 description:x2 underlying:x3];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 errorWithDomain:code:userInfo:];
}

id objc_msgSend_errorWithDomain_code_userInfo_description_underlying_(void *a1, const char *a2, ...)
{
  return [a1 errorWithDomain:code:userInfo:description:underlying:];
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 exceptionWithName:reason:userInfo:];
}

id objc_msgSend_expectedFailure(void *a1, const char *a2, ...)
{
  return _[a1 expectedFailure];
}

id objc_msgSend_expire(void *a1, const char *a2, ...)
{
  return _[a1 expire];
}

id objc_msgSend_extensionForDescriptor_fieldNumber_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "extensionForDescriptor:fieldNumber:");
}

id objc_msgSend_extensionRanges(void *a1, const char *a2, ...)
{
  return _[a1 extensionRanges];
}

id objc_msgSend_extensionRangesCount(void *a1, const char *a2, ...)
{
  return _[a1 extensionRangesCount];
}

id objc_msgSend_extensionRegistry(void *a1, const char *a2, ...)
{
  return _[a1 extensionRegistry];
}

id objc_msgSend_extensionsCurrentlySet(void *a1, const char *a2, ...)
{
  return _[a1 extensionsCurrentlySet];
}

id objc_msgSend_failStates(void *a1, const char *a2, ...)
{
  return _[a1 failStates];
}

id objc_msgSend_fieldNumber(void *a1, const char *a2, ...)
{
  return _[a1 fieldNumber];
}

id objc_msgSend_fieldType(void *a1, const char *a2, ...)
{
  return _[a1 fieldType];
}

id objc_msgSend_fieldWithNumber_(void *a1, const char *a2, ...)
{
  return [a1 fieldWithNumber:];
}

id objc_msgSend_file(void *a1, const char *a2, ...)
{
  return _[a1 file];
}

id objc_msgSend_fillInError(void *a1, const char *a2, ...)
{
  return _[a1 fillInError];
}

id objc_msgSend_findSessionByHandle_(void *a1, const char *a2, ...)
{
  return [a1 findSessionByHandle:];
}

id objc_msgSend_findSessionByID_(void *a1, const char *a2, ...)
{
  return [a1 findSessionByID:];
}

id objc_msgSend_finishDate(void *a1, const char *a2, ...)
{
  return _[a1 finishDate];
}

id objc_msgSend_finishOperation(void *a1, const char *a2, ...)
{
  return _[a1 finishOperation];
}

id objc_msgSend_finishingBlock(void *a1, const char *a2, ...)
{
  return _[a1 finishingBlock];
}

id objc_msgSend_fireTime(void *a1, const char *a2, ...)
{
  return _[a1 fireTime];
}

id objc_msgSend_fixed32List(void *a1, const char *a2, ...)
{
  return _[a1 fixed32List];
}

id objc_msgSend_fixed64List(void *a1, const char *a2, ...)
{
  return _[a1 fixed64List];
}

id objc_msgSend_flag(void *a1, const char *a2, ...)
{
  return _[a1 flag];
}

id objc_msgSend_flagConditions(void *a1, const char *a2, ...)
{
  return _[a1 flagConditions];
}

id objc_msgSend_flags(void *a1, const char *a2, ...)
{
  return _[a1 flags];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_flush(void *a1, const char *a2, ...)
{
  return _[a1 flush];
}

id objc_msgSend_followStates(void *a1, const char *a2, ...)
{
  return _[a1 followStates];
}

id objc_msgSend_fulfill(void *a1, const char *a2, ...)
{
  return _[a1 fulfill];
}

id objc_msgSend_fullName(void *a1, const char *a2, ...)
{
  return _[a1 fullName];
}

id objc_msgSend_futureBlock(void *a1, const char *a2, ...)
{
  return _[a1 futureBlock];
}

id objc_msgSend_generateSessionID(void *a1, const char *a2, ...)
{
  return _[a1 generateSessionID];
}

id objc_msgSend_getBytes_maxLength_usedLength_encoding_options_range_remainingRange_(void *a1, const char *a2, ...)
{
  return [a1 getBytes:x0 maxLength:x1 usedLength:x2 encoding:x3 options:x4 range:x5 remainingRange:x6];
}

id objc_msgSend_getEnumTextFormatNameForIndex_(void *a1, const char *a2, ...)
{
  return [a1 getEnumTextFormatNameForIndex:];
}

id objc_msgSend_getExistingExtension_(void *a1, const char *a2, ...)
{
  return [a1 getExistingExtension:];
}

id objc_msgSend_getExtension_(void *a1, const char *a2, ...)
{
  return [a1 getExtension:];
}

id objc_msgSend_gotAnnounceData(void *a1, const char *a2, ...)
{
  return _[a1 gotAnnounceData];
}

id objc_msgSend_gotCommitData(void *a1, const char *a2, ...)
{
  return _[a1 gotCommitData];
}

id objc_msgSend_gotConfirmData(void *a1, const char *a2, ...)
{
  return _[a1 gotConfirmData];
}

id objc_msgSend_gotReplyBData(void *a1, const char *a2, ...)
{
  return _[a1 gotReplyBData];
}

id objc_msgSend_gotRevealData(void *a1, const char *a2, ...)
{
  return _[a1 gotRevealData];
}

id objc_msgSend_gotSelected(void *a1, const char *a2, ...)
{
  return _[a1 gotSelected];
}

id objc_msgSend_groupList(void *a1, const char *a2, ...)
{
  return _[a1 groupList];
}

id objc_msgSend_groupStart(void *a1, const char *a2, ...)
{
  return _[a1 groupStart];
}

id objc_msgSend_haltOperation(void *a1, const char *a2, ...)
{
  return _[a1 haltOperation];
}

id objc_msgSend_halted(void *a1, const char *a2, ...)
{
  return _[a1 halted];
}

id objc_msgSend_handleExternalRequest_(void *a1, const char *a2, ...)
{
  return [a1 handleExternalRequest:];
}

id objc_msgSend_handleFlag_(void *a1, const char *a2, ...)
{
  return [a1 handleFlag:];
}

id objc_msgSend_handleID(void *a1, const char *a2, ...)
{
  return _[a1 handleID];
}

id objc_msgSend_hasInternalDiagnostics(void *a1, const char *a2, ...)
{
  return _[a1 hasInternalDiagnostics];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return [a1 hasPrefix:];
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return [a1 hasSuffix:];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_haveContact_complete_(void *a1, const char *a2, ...)
{
  return [a1 haveContact:x0 complete:x1];
}

id objc_msgSend_holdStateMachineOperation(void *a1, const char *a2, ...)
{
  return _[a1 holdStateMachineOperation];
}

id objc_msgSend_idsHandleLookup(void *a1, const char *a2, ...)
{
  return _[a1 idsHandleLookup];
}

id objc_msgSend_idsTransport(void *a1, const char *a2, ...)
{
  return _[a1 idsTransport];
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_indexesOfObjectsPassingTest_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "indexesOfObjectsPassingTest:");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _[a1 init];
}

id objc_msgSend_init_sourceStates_serialQueue_timeout_transitionOp_(void *a1, const char *a2, ...)
{
  return [a1 init:x0 sourceStates:x1 serialQueue:x2 timeout:x3 transitionOp:x4];
}

id objc_msgSend_initAcceptorWithPublic_configuration_(void *a1, const char *a2, ...)
{
  return [a1 initAcceptorWithPublic:configuration:];
}

id objc_msgSend_initAsSuccess(void *a1, const char *a2, ...)
{
  return _[a1 initAsSuccess];
}

id objc_msgSend_initInitiatorWithPublic_configuration_(void *a1, const char *a2, ...)
{
  return [a1 initInitiatorWithPublic:configuration];
}

id objc_msgSend_initIntending_errorState_(void *a1, const char *a2, ...)
{
  return [a1 initIntending:errorState:];
}

id objc_msgSend_initNamed_serialQueue_path_initialRequest_(void *a1, const char *a2, ...)
{
  return [a1 initNamed:x0 serialQueue:x1 path:x2 initialRequest:x3];
}

id objc_msgSend_initWithBools_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 initWithBools:forKeys:count:];
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return [a1 initWithBytes:length:];
}

id objc_msgSend_initWithBytes_length_encoding_(void *a1, const char *a2, ...)
{
  return [a1 initWithBytes:x0 length:x1 encoding:x2];
}

id objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return [a1 initWithBytesNoCopy:x0 length:x1 freeWhenDone:x2];
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 initWithCapacity:];
}

id objc_msgSend_initWithClass_messageName_fileDescription_fields_storageSize_wireFormat_(void *a1, const char *a2, ...)
{
  return [a1 initWithClass:x0 messageName:x1 fileDescription:x2 fields:x3 storageSize:x4 wireFormat:x5];
}

id objc_msgSend_initWithCodedInputStream_extensionRegistry_error_(void *a1, const char *a2, ...)
{
  return [a1 initWithCodedInputStream:x0 extensionRegistry:x1 error:x2];
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:];
}

id objc_msgSend_initWithData_error_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:error:];
}

id objc_msgSend_initWithData_extensionRegistry_error_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:x0 extensionRegistry:x1 error:x2];
}

id objc_msgSend_initWithDoubles_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 initWithDoubles:x0 forKeys:x1 count:x2];
}

id objc_msgSend_initWithFieldDescription_descriptorFlags_(void *a1, const char *a2, ...)
{
  return [a1 initWithFieldDescription:descriptorFlags:];
}

id objc_msgSend_initWithFloats_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 initWithFloats:x0 forKeys:x1 count:x2];
}

id objc_msgSend_initWithInt32s_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 initWithInt32s:x0 forKeys:x1 count:x2];
}

id objc_msgSend_initWithInt64s_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 initWithInt64s:x0 forKeys:x1 count:x2];
}

id objc_msgSend_initWithLogging_publicInfo_peerIDSID_session_(void *a1, const char *a2, ...)
{
  return [a1 initWithLogging:x0 publicInfo:x1 peerIDSID:x2 session:x3];
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return [a1 initWithMachServiceName:];
}

id objc_msgSend_initWithMessage_typeURLPrefix_error_(void *a1, const char *a2, ...)
{
  return [a1 initWithMessage:x0 typeURLPrefix:x1 error:x2];
}

id objc_msgSend_initWithName_delay_keepProcessAlive_dependencyDescriptionCode_block_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:x0 delay:x1 keepProcessAlive:x2 dependencyDescriptionCode:x3 block:x4];
}

id objc_msgSend_initWithName_fields_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:fields:];
}

id objc_msgSend_initWithName_initialDelay_continuingDelay_keepProcessAlive_dependencyDescriptionCode_block_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:x0 initialDelay:x1 continuingDelay:x2 keepProcessAlive:x3 dependencyDescriptionCode:x4 block:x5];
}

id objc_msgSend_initWithName_states_flags_initialState_queue_stateEngine_lockStateTracker_reachabilityTracker_idsConfigBag_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:x0 states:x1 flags:x2 initialState:x3 queue:x4 stateEngine:x5 lockStateTracker:x6 reachabilityTracker:x7 idsConfigBag:x8];
}

id objc_msgSend_initWithNumber_(void *a1, const char *a2, ...)
{
  return [a1 initWithNumber:];
}

id objc_msgSend_initWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 initWithObjects:];
}

id objc_msgSend_initWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 initWithObjects:forKeys:count:];
}

id objc_msgSend_initWithOutputStream_(void *a1, const char *a2, ...)
{
  return [a1 initWithOutputStream:];
}

id objc_msgSend_initWithOutputStream_data_(void *a1, const char *a2, ...)
{
  return [a1 initWithOutputStream:x0 data:x1];
}

id objc_msgSend_initWithPackage_objcPrefix_syntax_(void *a1, const char *a2, ...)
{
  return [a1 initWithPackage:a2 objcPrefix:a3 syntax:a4];
}

id objc_msgSend_initWithPackage_syntax_(void *a1, const char *a2, ...)
{
  return [a1 initWithPackage:x0 syntax:x1];
}

id objc_msgSend_initWithPath_(void *a1, const char *a2, ...)
{
  return [a1 initWithPath:];
}

id objc_msgSend_initWithPeer_(void *a1, const char *a2, ...)
{
  return [a1 initWithPeer:];
}

id objc_msgSend_initWithProtobufData_type_isResponse_(void *a1, const char *a2, ...)
{
  return [a1 initWithProtobufData:x0 type:x1 isResponse:x2];
}

id objc_msgSend_initWithQueue_flags_(void *a1, const char *a2, ...)
{
  return [a1 initWithQueue:flags:];
}

id objc_msgSend_initWithSIGTERMNotification_(void *a1, const char *a2, ...)
{
  return [a1 initWithSIGTERMNotification:];
}

id objc_msgSend_initWithService_(void *a1, const char *a2, ...)
{
  return [a1 initWithService:];
}

id objc_msgSend_initWithState_pathStep_(void *a1, const char *a2, ...)
{
  return [a1 initWithState:x0 pathStep:x1];
}

id objc_msgSend_initWithTransport_transparencyd_peerName_(void *a1, const char *a2, ...)
{
  return [a1 initWithTransport:transparencyd:peerName:];
}

id objc_msgSend_initWithUInt32s_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 initWithUInt32s:forKeys:count:];
}

id objc_msgSend_initWithUInt64s_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 initWithUInt64s:x0 forKeys:x1 count:x2];
}

id objc_msgSend_initWithValidationFunction_(void *a1, const char *a2, ...)
{
  return [a1 initWithValidationFunction:];
}

id objc_msgSend_initWithValidationFunction_capacity_(void *a1, const char *a2, ...)
{
  return [a1 initWithValidationFunction:_objc_msgSend(a1, "validationFunction") capacity:_objc_msgSend(a1, "capacity")];
}

id objc_msgSend_initWithValidationFunction_rawValues_count_(void *a1, const char *a2, ...)
{
  return [a1 initWithValidationFunction:x0 rawValues:x1 count:x2];
}

id objc_msgSend_initWithValidationFunction_rawValues_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 initWithValidationFunction:x0 rawValues:x1 forKeys:x2 count:x3];
}

id objc_msgSend_initWithValueArray_(void *a1, const char *a2, ...)
{
  return [a1 initWithValueArray:];
}

id objc_msgSend_initWithValues_count_(void *a1, const char *a2, ...)
{
  return [a1 initWithValues:x0 count:x1];
}

id objc_msgSend_initialDelay(void *a1, const char *a2, ...)
{
  return _[a1 initialDelay];
}

id objc_msgSend_initialState(void *a1, const char *a2, ...)
{
  return _[a1 initialState];
}

id objc_msgSend_initiator(void *a1, const char *a2, ...)
{
  return _[a1 initiator];
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return [a1 insertObject:atIndex:];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_intendedPath(void *a1, const char *a2, ...)
{
  return _[a1 intendedPath];
}

id objc_msgSend_intendedState(void *a1, const char *a2, ...)
{
  return _[a1 intendedState];
}

id objc_msgSend_interface(void *a1, const char *a2, ...)
{
  return _[a1 interface];
}

id objc_msgSend_internalClear_(void *a1, const char *a2, ...)
{
  return [a1 internalClear:];
}

id objc_msgSend_internalResizeToCapacity_(void *a1, const char *a2, ...)
{
  return [a1 internalResizeToCapacity:];
}

id objc_msgSend_internalSuccesses(void *a1, const char *a2, ...)
{
  return _[a1 internalSuccesses];
}

id objc_msgSend_invalidateTimeout(void *a1, const char *a2, ...)
{
  return _[a1 invalidateTimeout];
}

id objc_msgSend_invokeIDSSupportWithBlock_errorHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "invokeIDSSupportWithBlock:errorHandler:");
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return _[a1 isCancelled];
}

id objc_msgSend_isClosed(void *a1, const char *a2, ...)
{
  return _[a1 isClosed];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return [a1 isEqual:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isExecuting(void *a1, const char *a2, ...)
{
  return _[a1 isExecuting];
}

id objc_msgSend_isExpectedFailure_expected_(void *a1, const char *a2, ...)
{
  return [a1 isExpectedFailure:expected:];
}

id objc_msgSend_isFieldTag_(void *a1, const char *a2, ...)
{
  return [a1 isFieldTag:];
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return _[a1 isFinished];
}

id objc_msgSend_isInitialized(void *a1, const char *a2, ...)
{
  return _[a1 isInitialized];
}

id objc_msgSend_isLocked(void *a1, const char *a2, ...)
{
  return _[a1 isLocked];
}

id objc_msgSend_isPackable(void *a1, const char *a2, ...)
{
  return _[a1 isPackable];
}

id objc_msgSend_isPending(void *a1, const char *a2, ...)
{
  return _[a1 isPending];
}

id objc_msgSend_isReady(void *a1, const char *a2, ...)
{
  return _[a1 isReady];
}

id objc_msgSend_isRepeated(void *a1, const char *a2, ...)
{
  return _[a1 isRepeated];
}

id objc_msgSend_isRequired(void *a1, const char *a2, ...)
{
  return _[a1 isRequired];
}

id objc_msgSend_isSubclassOfClass_(void *a1, const char *a2, ...)
{
  return [a1 isSubclassOfClass:];
}

id objc_msgSend_isValidEnumValue_(void *a1, const char *a2, ...)
{
  return [a1 isValidEnumValue:];
}

id objc_msgSend_isWireFormat(void *a1, const char *a2, ...)
{
  return _[a1 isWireFormat];
}

id objc_msgSend_keepProcessAlive(void *a1, const char *a2, ...)
{
  return _[a1 keepProcessAlive];
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 keyEnumerator];
}

id objc_msgSend_ktAccountPublicIDWithPublicKeyInfo_error_(void *a1, const char *a2, ...)
{
  return [a1 ktAccountPublicIDWithPublicKeyInfo:x0 error:x1];
}

id objc_msgSend_kt_dataWithHexString_(void *a1, const char *a2, ...)
{
  return [a1 kt_dataWithHexString:];
}

id objc_msgSend_kt_hexString(void *a1, const char *a2, ...)
{
  return [a1 kt_hexString];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_lastUsedAddressOfMe(void *a1, const char *a2, ...)
{
  return _[a1 lastUsedAddressOfMe];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_lengthDelimitedList(void *a1, const char *a2, ...)
{
  return _[a1 lengthDelimitedList];
}

id objc_msgSend_lengthOfBytesUsingEncoding_(void *a1, const char *a2, ...)
{
  return [a1 lengthOfBytesUsingEncoding:];
}

id objc_msgSend_listSessions(void *a1, const char *a2, ...)
{
  return _[a1 listSessions];
}

id objc_msgSend_liveRequest(void *a1, const char *a2, ...)
{
  return _[a1 liveRequest];
}

id objc_msgSend_liveRequestReceived(void *a1, const char *a2, ...)
{
  return _[a1 liveRequestReceived];
}

id objc_msgSend_localSessionID(void *a1, const char *a2, ...)
{
  return _[a1 localSessionID];
}

id objc_msgSend_lockStateTracker(void *a1, const char *a2, ...)
{
  return _[a1 lockStateTracker];
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return _[a1 log];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 mainRunLoop];
}

id objc_msgSend_makeOperationDependency(void *a1, const char *a2, ...)
{
  return _[a1 makeOperationDependency];
}

id objc_msgSend_mapKeyDataType(void *a1, const char *a2, ...)
{
  return _[a1 mapKeyDataType];
}

id objc_msgSend_mapMailbox(void *a1, const char *a2, ...)
{
  return _[a1 mapMailbox];
}

id objc_msgSend_mapMailbox_(void *a1, const char *a2, ...)
{
  return [a1 mapMailbox:];
}

id objc_msgSend_matchPeerSessionID_op_(void *a1, const char *a2, ...)
{
  return [a1 matchPeerSessionID:op:];
}

id objc_msgSend_matchSession_op_(void *a1, const char *a2, ...)
{
  return [a1 matchSession:op:];
}

id objc_msgSend_maximumDelay(void *a1, const char *a2, ...)
{
  return _[a1 maximumDelay];
}

id objc_msgSend_mergeDelimitedFromCodedInputStream_extensionRegistry_(void *a1, const char *a2, ...)
{
  return [a1 mergeDelimitedFromCodedInputStream:x0 extensionRegistry:x1];
}

id objc_msgSend_mergeFieldFrom_input_(void *a1, const char *a2, ...)
{
  return [a1 mergeFieldFrom:input:];
}

id objc_msgSend_mergeFrom_(void *a1, const char *a2, ...)
{
  return [a1 mergeFrom:];
}

id objc_msgSend_mergeFromCodedInputStream_(void *a1, const char *a2, ...)
{
  return [a1 mergeFromCodedInputStream:];
}

id objc_msgSend_mergeFromCodedInputStream_extensionRegistry_(void *a1, const char *a2, ...)
{
  return [a1 mergeFromCodedInputStream:x0 extensionRegistry:x1];
}

id objc_msgSend_mergeFromData_extensionRegistry_(void *a1, const char *a2, ...)
{
  return [a1 mergeFromData:x0 extensionRegistry:x1];
}

id objc_msgSend_mergeUnknownFields_(void *a1, const char *a2, ...)
{
  return [a1 mergeUnknownFields:];
}

id objc_msgSend_mergeVarintField_value_(void *a1, const char *a2, ...)
{
  return [a1 mergeVarintField:x0 value:x1];
}

id objc_msgSend_messageClass(void *a1, const char *a2, ...)
{
  return _[a1 messageClass];
}

id objc_msgSend_msgClass(void *a1, const char *a2, ...)
{
  return _[a1 msgClass];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return _[a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_mutableCopyWithZone_(void *a1, const char *a2, ...)
{
  return [a1 mutableCopyWithZone:];
}

id objc_msgSend_mutableFieldForNumber_create_(void *a1, const char *a2, ...)
{
  return [a1 mutableFieldForNumber:x0 create:x1];
}

id objc_msgSend_mutableStateConditions(void *a1, const char *a2, ...)
{
  return _[a1 mutableStateConditions];
}

id objc_msgSend_myPublicInfo(void *a1, const char *a2, ...)
{
  return _[a1 myPublicInfo];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_named_entering_(void *a1, const char *a2, ...)
{
  return [a1 named:entering:];
}

id objc_msgSend_named_intending_errorState_withBlockTakingSelf_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "named:intending:errorState:withBlockTakingSelf:");
}

id objc_msgSend_named_withBlock_(void *a1, const char *a2, ...)
{
  return [a1 named:withBlock:];
}

id objc_msgSend_named_withBlockTakingSelf_(void *a1, const char *a2, ...)
{
  return [a1 named:withBlockTakingSelf:];
}

id objc_msgSend_nanos(void *a1, const char *a2, ...)
{
  return _[a1 nanos];
}

id objc_msgSend_negotiatedSessionID(void *a1, const char *a2, ...)
{
  return _[a1 negotiatedSessionID];
}

id objc_msgSend_negotiatedSessionID_forMailbox_(void *a1, const char *a2, ...)
{
  return [a1 negotiatedSessionID:forMailbox:];
}

id objc_msgSend_nextFireTime(void *a1, const char *a2, ...)
{
  return _[a1 nextFireTime];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return _[a1 nextObject];
}

id objc_msgSend_nextState(void *a1, const char *a2, ...)
{
  return _[a1 nextState];
}

id objc_msgSend_nextStateMachineCycleOperation(void *a1, const char *a2, ...)
{
  return _[a1 nextStateMachineCycleOperation];
}

id objc_msgSend_nextStep_(void *a1, const char *a2, ...)
{
  return [a1 nextStep:];
}

id objc_msgSend_number(void *a1, const char *a2, ...)
{
  return _[a1 number];
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

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithLongLong:];
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInt:];
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedLongLong:];
}

id objc_msgSend_objcPrefix(void *a1, const char *a2, ...)
{
  return _[a1 objcPrefix];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndex:];
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndexedSubscript:];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 objectEnumerator];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_objectsAtIndexes_(void *a1, const char *a2, ...)
{
  return [a1 objectsAtIndexes:];
}

id objc_msgSend_onQueueMapMailbox(void *a1, const char *a2, ...)
{
  return _[a1 onQueueMapMailbox];
}

id objc_msgSend_onQueueStartOver_clearAnnounce_flags_(void *a1, const char *a2, ...)
{
  return [a1 onQueueStartOver:clearAnnounce:flags:];
}

id objc_msgSend_onQueueUpdateState(void *a1, const char *a2, ...)
{
  return _[a1 onQueueUpdateState];
}

id objc_msgSend_oneofs(void *a1, const char *a2, ...)
{
  return _[a1 oneofs];
}

id objc_msgSend_onqueueCheckExpectedFailure_attempt_(void *a1, const char *a2, ...)
{
  return [a1 onqueueCheckExpectedFailure:attempt:];
}

id objc_msgSend_onqueueEnterState_(void *a1, const char *a2, ...)
{
  return [a1 onqueueEnterState:];
}

id objc_msgSend_onqueueHandleTransition_(void *a1, const char *a2, ...)
{
  return [a1 onqueueHandleTransition:];
}

id objc_msgSend_onqueueProcessTransition_(void *a1, const char *a2, ...)
{
  return [a1 onqueueProcessTransition:];
}

id objc_msgSend_onqueueStartFinishOperation(void *a1, const char *a2, ...)
{
  return _[a1 onqueueStartFinishOperation];
}

id objc_msgSend_onqueueStartFinishOperation_(void *a1, const char *a2, ...)
{
  return [a1 onqueueStartFinishOperation:];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return _[a1 open];
}

id objc_msgSend_operationCount(void *a1, const char *a2, ...)
{
  return _[a1 operationCount];
}

id objc_msgSend_operationDependency(void *a1, const char *a2, ...)
{
  return _[a1 operationDependency];
}

id objc_msgSend_operationDependencyDescriptionCode(void *a1, const char *a2, ...)
{
  return _[a1 operationDependencyDescriptionCode];
}

id objc_msgSend_operationQueue(void *a1, const char *a2, ...)
{
  return _[a1 operationQueue];
}

id objc_msgSend_operationStateString(void *a1, const char *a2, ...)
{
  return _[a1 operationStateString];
}

id objc_msgSend_operationWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 operationWithBlock:];
}

id objc_msgSend_operations(void *a1, const char *a2, ...)
{
  return _[a1 operations];
}

id objc_msgSend_oslog(void *a1, const char *a2, ...)
{
  return _[a1 oslog];
}

id objc_msgSend_otherNamesForPeer(void *a1, const char *a2, ...)
{
  return _[a1 otherNamesForPeer];
}

id objc_msgSend_packWithMessage_typeURLPrefix_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "packWithMessage:typeURLPrefix:error:");
}

id objc_msgSend_package(void *a1, const char *a2, ...)
{
  return _[a1 package];
}

id objc_msgSend_parseFromData_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "parseFromData:error:");
}

id objc_msgSend_parseMessageSet_extensionRegistry_(void *a1, const char *a2, ...)
{
  return [a1 parseMessageSet:extensionRegistry:];
}

id objc_msgSend_parseUnknownField_extensionRegistry_tag_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "parseUnknownField:extensionRegistry:tag:");
}

id objc_msgSend_pathFromDictionary_(void *a1, const char *a2, ...)
{
  return [a1 pathFromDictionary:];
}

id objc_msgSend_pathStep(void *a1, const char *a2, ...)
{
  return _[a1 pathStep];
}

id objc_msgSend_paused(void *a1, const char *a2, ...)
{
  return _[a1 paused];
}

id objc_msgSend_peer(void *a1, const char *a2, ...)
{
  return _[a1 peer];
}

id objc_msgSend_peerAnnounce(void *a1, const char *a2, ...)
{
  return _[a1 peerAnnounce];
}

id objc_msgSend_peerDisconnected(void *a1, const char *a2, ...)
{
  return _[a1 peerDisconnected];
}

id objc_msgSend_peerHandles(void *a1, const char *a2, ...)
{
  return _[a1 peerHandles];
}

id objc_msgSend_peerIDMismatchCounter(void *a1, const char *a2, ...)
{
  return _[a1 peerIDMismatchCounter];
}

id objc_msgSend_peerPublicInfo(void *a1, const char *a2, ...)
{
  return _[a1 peerPublicInfo];
}

id objc_msgSend_peerSessionID(void *a1, const char *a2, ...)
{
  return _[a1 peerSessionID];
}

id objc_msgSend_peerSessionId(void *a1, const char *a2, ...)
{
  return _[a1 peerSessionId];
}

id objc_msgSend_peerStorage(void *a1, const char *a2, ...)
{
  return _[a1 peerStorage];
}

id objc_msgSend_pendingDependenciesString_(void *a1, const char *a2, ...)
{
  return [a1 pendingDependenciesString:];
}

id objc_msgSend_pendingFlags(void *a1, const char *a2, ...)
{
  return _[a1 pendingFlags];
}

id objc_msgSend_pendingFlagsScheduler(void *a1, const char *a2, ...)
{
  return _[a1 pendingFlagsScheduler];
}

id objc_msgSend_pendingFlagsString(void *a1, const char *a2, ...)
{
  return _[a1 pendingFlagsString];
}

id objc_msgSend_pointerValue(void *a1, const char *a2, ...)
{
  return _[a1 pointerValue];
}

id objc_msgSend_postNotificationName_object_userInfo_options_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationName:object:userInfo:options:];
}

id objc_msgSend_predictedNextFireTime(void *a1, const char *a2, ...)
{
  return _[a1 predictedNextFireTime];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 processIdentifier];
}

id objc_msgSend_publicInfo(void *a1, const char *a2, ...)
{
  return _[a1 publicInfo];
}

id objc_msgSend_publicKeyInfo(void *a1, const char *a2, ...)
{
  return _[a1 publicKeyInfo];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return _[a1 queue];
}

id objc_msgSend_raise(void *a1, const char *a2, ...)
{
  return _[a1 raise];
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return [a1 raise:format:];
}

id objc_msgSend_rangeOfString_options_(void *a1, const char *a2, ...)
{
  return [a1 rangeOfString:x0 options:x1];
}

id objc_msgSend_rawValueAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 rawValueAtIndex:];
}

id objc_msgSend_reachabilityDependency(void *a1, const char *a2, ...)
{
  return _[a1 reachabilityDependency];
}

id objc_msgSend_reachabilityTracker(void *a1, const char *a2, ...)
{
  return _[a1 reachabilityTracker];
}

id objc_msgSend_readGroup_message_extensionRegistry_(void *a1, const char *a2, ...)
{
  return [a1 readGroup:message:extensionRegistry:];
}

id objc_msgSend_readMapEntry_extensionRegistry_field_parentMessage_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "readMapEntry:extensionRegistry:field:parentMessage:");
}

id objc_msgSend_readMessage_extensionRegistry_(void *a1, const char *a2, ...)
{
  return [a1 readMessage:x0 extensionRegistry:x1];
}

id objc_msgSend_readUnknownGroup_message_(void *a1, const char *a2, ...)
{
  return [a1 readUnknownGroup:message];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return _[a1 reason];
}

id objc_msgSend_recheck(void *a1, const char *a2, ...)
{
  return _[a1 recheck];
}

id objc_msgSend_recvAnnounce_(void *a1, const char *a2, ...)
{
  return [a1 recvAnnounce:];
}

id objc_msgSend_recvCommit_(void *a1, const char *a2, ...)
{
  return [a1 recvCommit:];
}

id objc_msgSend_recvConfirm_(void *a1, const char *a2, ...)
{
  return [a1 recvConfirm:];
}

id objc_msgSend_recvDiscloseA_(void *a1, const char *a2, ...)
{
  return [a1 recvDiscloseA];
}

id objc_msgSend_recvRatelimit(void *a1, const char *a2, ...)
{
  return _[a1 recvRatelimit];
}

id objc_msgSend_recvReplyB_(void *a1, const char *a2, ...)
{
  return [a1 recvReplyB:];
}

id objc_msgSend_recvTeardown_(void *a1, const char *a2, ...)
{
  return [a1 recvTeardown:];
}

id objc_msgSend_registerStateTransitionWatcher_(void *a1, const char *a2, ...)
{
  return [a1 registerStateTransitionWatcher:];
}

id objc_msgSend_remainingPath(void *a1, const char *a2, ...)
{
  return _[a1 remainingPath];
}

id objc_msgSend_removeAddressLookup_(void *a1, const char *a2, ...)
{
  return [a1 removeAddressLookup:];
}

id objc_msgSend_removeDependenciesUponCompletion(void *a1, const char *a2, ...)
{
  return _[a1 removeDependenciesUponCompletion];
}

id objc_msgSend_removeDependency_(void *a1, const char *a2, ...)
{
  return [a1 removeDependency:];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return _[a1 removeLastObject];
}

id objc_msgSend_removeMailbox_(void *a1, const char *a2, ...)
{
  return [a1 removeMailbox:];
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

id objc_msgSend_removeSessionIDLookup_(void *a1, const char *a2, ...)
{
  return [a1 removeSessionIDLookup:];
}

id objc_msgSend_replaceObjectAtIndex_withObject_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "replaceObjectAtIndex:withObject:");
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return _[a1 reset];
}

id objc_msgSend_resetSession_(void *a1, const char *a2, ...)
{
  return [a1 resetSession:];
}

id objc_msgSend_restart(void *a1, const char *a2, ...)
{
  return _[a1 restart];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return _[a1 result];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _[a1 run];
}

id objc_msgSend_runBeforeGroupFinished_(void *a1, const char *a2, ...)
{
  return [a1 runBeforeGroupFinished:];
}

id objc_msgSend_runIfHaveContact_complete_(void *a1, const char *a2, ...)
{
  return [a1 runIfHaveContact:complete:];
}

id objc_msgSend_sas(void *a1, const char *a2, ...)
{
  return _[a1 sas];
}

id objc_msgSend_sasCode(void *a1, const char *a2, ...)
{
  return _[a1 sasCode];
}

id objc_msgSend_sasTTR_toHandle_pushToken_(void *a1, const char *a2, ...)
{
  return [a1 sasTTR:toHandle:pushToken:];
}

id objc_msgSend_seconds(void *a1, const char *a2, ...)
{
  return _[a1 seconds];
}

id objc_msgSend_selfAccountKey_(void *a1, const char *a2, ...)
{
  return [a1 selfAccountKey:];
}

id objc_msgSend_selfRandom(void *a1, const char *a2, ...)
{
  return _[a1 selfRandom];
}

id objc_msgSend_selfname(void *a1, const char *a2, ...)
{
  return _[a1 selfname];
}

id objc_msgSend_semaphore(void *a1, const char *a2, ...)
{
  return _[a1 semaphore];
}

id objc_msgSend_sendAnnounce(void *a1, const char *a2, ...)
{
  return _[a1 sendAnnounce];
}

id objc_msgSend_sendCommitA(void *a1, const char *a2, ...)
{
  return _[a1 sendCommitA];
}

id objc_msgSend_sendConfirm(void *a1, const char *a2, ...)
{
  return _[a1 sendConfirm];
}

id objc_msgSend_sendMessage_data_(void *a1, const char *a2, ...)
{
  return [a1 sendMessage:data:];
}

id objc_msgSend_sendMessage_data_targets_fromHandle_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "sendMessage:data:targets:fromHandle:");
}

id objc_msgSend_sendMessage_data_targets_sourceID_(void *a1, const char *a2, ...)
{
  return [a1 sendMessage:x0 data:x1 targets:x2 sourceID:x3];
}

id objc_msgSend_sendMessage_data_toID_sourceID_(void *a1, const char *a2, ...)
{
  return [a1 sendMessage:data:toID:sourceID:];
}

id objc_msgSend_sendProtobuf_toDestinations_priority_options_identifier_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "sendProtobuf:toDestinations:priority:options:identifier:error:");
}

id objc_msgSend_sendRevealA(void *a1, const char *a2, ...)
{
  return _[a1 sendRevealA];
}

id objc_msgSend_sendSelected(void *a1, const char *a2, ...)
{
  return _[a1 sendSelected];
}

id objc_msgSend_sendSetupB(void *a1, const char *a2, ...)
{
  return _[a1 sendSetupB];
}

id objc_msgSend_sendTearDown_idsHandle_because_(void *a1, const char *a2, ...)
{
  return [a1 sendTearDown:idsHandle:because:];
}

id objc_msgSend_sendTeardown(void *a1, const char *a2, ...)
{
  return _[a1 sendTeardown];
}

id objc_msgSend_sentAnnounce(void *a1, const char *a2, ...)
{
  return _[a1 sentAnnounce];
}

id objc_msgSend_sentTeardown(void *a1, const char *a2, ...)
{
  return _[a1 sentTeardown];
}

id objc_msgSend_sentTime(void *a1, const char *a2, ...)
{
  return _[a1 sentTime];
}

id objc_msgSend_serializedDataForUnknownValue_forKey_keyDataType_(void *a1, const char *a2, ...)
{
  return [a1 serializedDataForUnknownValue:x0 forKey:x1 keyDataType:x2];
}

id objc_msgSend_serializedSize(void *a1, const char *a2, ...)
{
  return _[a1 serializedSize];
}

id objc_msgSend_serializedSizeAsMessageSet(void *a1, const char *a2, ...)
{
  return _[a1 serializedSizeAsMessageSet];
}

id objc_msgSend_serializedSizeAsMessageSetExtension(void *a1, const char *a2, ...)
{
  return _[a1 serializedSizeAsMessageSetExtension];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return _[a1 service];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return _[a1 session];
}

id objc_msgSend_sessionID(void *a1, const char *a2, ...)
{
  return _[a1 sessionID];
}

id objc_msgSend_sessionIDLookup(void *a1, const char *a2, ...)
{
  return _[a1 sessionIDLookup];
}

id objc_msgSend_sessionId(void *a1, const char *a2, ...)
{
  return _[a1 sessionId];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setACommitRandom_(void *a1, const char *a2, ...)
{
  return [a1 setACommitRandom:];
}

id objc_msgSend_setARandom_(void *a1, const char *a2, ...)
{
  return [a1 setARandom:];
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return [a1 setActive:];
}

id objc_msgSend_setAllowPendingFlags_(void *a1, const char *a2, ...)
{
  return [a1 setAllowPendingFlags:];
}

id objc_msgSend_setBRandom_(void *a1, const char *a2, ...)
{
  return [a1 setBRandom:];
}

id objc_msgSend_setBackoff_(void *a1, const char *a2, ...)
{
  return [a1 setBackoff:];
}

id objc_msgSend_setBag_(void *a1, const char *a2, ...)
{
  return [a1 setBag:];
}

id objc_msgSend_setBeforeRatelimit_(void *a1, const char *a2, ...)
{
  return [a1 setBeforeRatelimit:];
}

id objc_msgSend_setByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 setByAddingObjectsFromArray:];
}

id objc_msgSend_setCheckReachabilityOperation_(void *a1, const char *a2, ...)
{
  return [a1 setCheckReachabilityOperation:];
}

id objc_msgSend_setCheckUnlockOperation_(void *a1, const char *a2, ...)
{
  return [a1 setCheckUnlockOperation:];
}

id objc_msgSend_setComplete_(void *a1, const char *a2, ...)
{
  return [a1 setComplete:];
}

id objc_msgSend_setCompletionBlock_(void *a1, const char *a2, ...)
{
  return [a1 setCompletionBlock:];
}

id objc_msgSend_setConditionChecksInFlight_(void *a1, const char *a2, ...)
{
  return [a1 setConditionChecksInFlight:];
}

id objc_msgSend_setCurrentConditions_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentConditions:];
}

id objc_msgSend_setCurrentDelay_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentDelay:];
}

id objc_msgSend_setCurrentState_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentState:];
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return [a1 setDateFormat:];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}

id objc_msgSend_setDeletedHandles_(void *a1, const char *a2, ...)
{
  return [a1 setDeletedHandles:];
}

id objc_msgSend_setDescriptionErrorCode_(void *a1, const char *a2, ...)
{
  return [a1 setDescriptionErrorCode:];
}

id objc_msgSend_setDestinationIDSID_(void *a1, const char *a2, ...)
{
  return [a1 setDestinationIDSID:];
}

id objc_msgSend_setError_(void *a1, const char *a2, ...)
{
  return [a1 setError:];
}

id objc_msgSend_setExpire_(void *a1, const char *a2, ...)
{
  return [a1 setExpire:];
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return [a1 setExportedInterface:];
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return [a1 setExportedObject:];
}

id objc_msgSend_setExtension_value_(void *a1, const char *a2, ...)
{
  return [a1 setExtension:value:];
}

id objc_msgSend_setFillInError_(void *a1, const char *a2, ...)
{
  return [a1 setFillInError:];
}

id objc_msgSend_setFinishDate_(void *a1, const char *a2, ...)
{
  return [a1 setFinishDate:];
}

id objc_msgSend_setGotAnnounceData_(void *a1, const char *a2, ...)
{
  return [a1 setGotAnnounceData:];
}

id objc_msgSend_setGotCommitData_(void *a1, const char *a2, ...)
{
  return [a1 setGotCommitData:];
}

id objc_msgSend_setGotConfirmData_(void *a1, const char *a2, ...)
{
  return [a1 setGotConfirmData:];
}

id objc_msgSend_setGotReplyBData_(void *a1, const char *a2, ...)
{
  return [a1 setGotReplyBData:];
}

id objc_msgSend_setGotRevealData_(void *a1, const char *a2, ...)
{
  return [a1 setGotRevealData:];
}

id objc_msgSend_setGotSelected_(void *a1, const char *a2, ...)
{
  return [a1 setGotSelected:];
}

id objc_msgSend_setGotTeardown_(void *a1, const char *a2, ...)
{
  return [a1 setGotTeardown:];
}

id objc_msgSend_setHalted_(void *a1, const char *a2, ...)
{
  return [a1 setHalted:];
}

id objc_msgSend_setHandleID_(void *a1, const char *a2, ...)
{
  return [a1 setHandleID:];
}

id objc_msgSend_setHoldStateMachineOperation_(void *a1, const char *a2, ...)
{
  return [a1 setHoldStateMachineOperation:];
}

id objc_msgSend_setIdsHandleLookup_(void *a1, const char *a2, ...)
{
  return [a1 setIdsHandleLookup:];
}

id objc_msgSend_setIdsTransport_(void *a1, const char *a2, ...)
{
  return [a1 setIdsTransport:];
}

id objc_msgSend_setInitialDelay_(void *a1, const char *a2, ...)
{
  return [a1 setInitialDelay:];
}

id objc_msgSend_setInitiatorUndisclosedRandom_(void *a1, const char *a2, ...)
{
  return [a1 setInitiatorUndisclosedRandom:];
}

id objc_msgSend_setLength_(void *a1, const char *a2, ...)
{
  return [a1 setLength:];
}

id objc_msgSend_setLiveRequest_(void *a1, const char *a2, ...)
{
  return [a1 setLiveRequest:];
}

id objc_msgSend_setLiveRequestReceived_(void *a1, const char *a2, ...)
{
  return [a1 setLiveRequestReceived:];
}

id objc_msgSend_setLocalSessionID_(void *a1, const char *a2, ...)
{
  return [a1 setLocalSessionID:];
}

id objc_msgSend_setLog_(void *a1, const char *a2, ...)
{
  return [a1 setLog:];
}

id objc_msgSend_setMessagedAction_forIncomingRequestsOfType_(void *a1, const char *a2, ...)
{
  return [a1 setMessagedAction:forIncomingRequestsOfType:];
}

id objc_msgSend_setMyPublicInfo_(void *a1, const char *a2, ...)
{
  return [a1 setMyPublicInfo:];
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return [a1 setName:];
}

id objc_msgSend_setNanos_(void *a1, const char *a2, ...)
{
  return [a1 setNanos:];
}

id objc_msgSend_setNegotiatedSessionID_(void *a1, const char *a2, ...)
{
  return [a1 setNegotiatedSessionID:];
}

id objc_msgSend_setNextState_(void *a1, const char *a2, ...)
{
  return [a1 setNextState:];
}

id objc_msgSend_setNextStateMachineCycleOperation_(void *a1, const char *a2, ...)
{
  return [a1 setNextStateMachineCycleOperation:];
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKey:];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKeyedSubscript:];
}

id objc_msgSend_setOperationDependency_(void *a1, const char *a2, ...)
{
  return [a1 setOperationDependency:];
}

id objc_msgSend_setOslog_(void *a1, const char *a2, ...)
{
  return [a1 setOslog:];
}

id objc_msgSend_setPaused_(void *a1, const char *a2, ...)
{
  return [a1 setPaused:];
}

id objc_msgSend_setPeer_(void *a1, const char *a2, ...)
{
  return [a1 setPeer:];
}

id objc_msgSend_setPeerAccountIdentity_(void *a1, const char *a2, ...)
{
  return [a1 setPeerAccountIdentity:];
}

id objc_msgSend_setPeerAnnounce_(void *a1, const char *a2, ...)
{
  return [a1 setPeerAnnounce:];
}

id objc_msgSend_setPeerDisconnected_(void *a1, const char *a2, ...)
{
  return [a1 setPeerDisconnected:];
}

id objc_msgSend_setPeerIDMismatchCounter_(void *a1, const char *a2, ...)
{
  return [a1 setPeerIDMismatchCounter:];
}

id objc_msgSend_setPeerIDSID_(void *a1, const char *a2, ...)
{
  return [a1 setPeerIDSID:];
}

id objc_msgSend_setPeerPublic_(void *a1, const char *a2, ...)
{
  return [a1 setPeerPublic:];
}

id objc_msgSend_setPeerPublicInfo_(void *a1, const char *a2, ...)
{
  return [a1 setPeerPublicInfo:];
}

id objc_msgSend_setPeerRandom_(void *a1, const char *a2, ...)
{
  return [a1 setPeerRandom:];
}

id objc_msgSend_setPeerSessionID_(void *a1, const char *a2, ...)
{
  return [a1 setPeerSessionID:];
}

id objc_msgSend_setPeerSessionId_(void *a1, const char *a2, ...)
{
  return [a1 setPeerSessionId:];
}

id objc_msgSend_setPeerStorage_(void *a1, const char *a2, ...)
{
  return [a1 setPeerStorage:];
}

id objc_msgSend_setPredictedNextFireTime_(void *a1, const char *a2, ...)
{
  return [a1 setPredictedNextFireTime:];
}

id objc_msgSend_setProtobufAction_forIncomingRequestsOfType_(void *a1, const char *a2, ...)
{
  return [a1 setProtobufAction:forIncomingRequestsOfType:];
}

id objc_msgSend_setPublicInfo_(void *a1, const char *a2, ...)
{
  return [a1 setPublicInfo:];
}

id objc_msgSend_setQualityOfService_(void *a1, const char *a2, ...)
{
  return [a1 setQualityOfService:];
}

id objc_msgSend_setQueue_(void *a1, const char *a2, ...)
{
  return [a1 setQueue:];
}

id objc_msgSend_setRecvRatelimit_(void *a1, const char *a2, ...)
{
  return [a1 setRecvRatelimit:];
}

id objc_msgSend_setRemainingPath_(void *a1, const char *a2, ...)
{
  return [a1 setRemainingPath:];
}

id objc_msgSend_setSas_(void *a1, const char *a2, ...)
{
  return [a1 setSas:];
}

id objc_msgSend_setSasCode_(void *a1, const char *a2, ...)
{
  return [a1 setSasCode:];
}

id objc_msgSend_setSeconds_(void *a1, const char *a2, ...)
{
  return [a1 setSeconds:];
}

id objc_msgSend_setSentAnnounce_(void *a1, const char *a2, ...)
{
  return [a1 setSentAnnounce:];
}

id objc_msgSend_setSentTeardown_(void *a1, const char *a2, ...)
{
  return [a1 setSentTeardown:];
}

id objc_msgSend_setSentTime_(void *a1, const char *a2, ...)
{
  return [a1 setSentTime:];
}

id objc_msgSend_setService_(void *a1, const char *a2, ...)
{
  return [a1 setService:];
}

id objc_msgSend_setSession_(void *a1, const char *a2, ...)
{
  return [a1 setSession:];
}

id objc_msgSend_setSessionExpire_(void *a1, const char *a2, ...)
{
  return [a1 setSessionExpire:];
}

id objc_msgSend_setSessionID_(void *a1, const char *a2, ...)
{
  return [a1 setSessionID:];
}

id objc_msgSend_setSessionIDLookup_(void *a1, const char *a2, ...)
{
  return [a1 setSessionIDLookup:];
}

id objc_msgSend_setSessionId_(void *a1, const char *a2, ...)
{
  return [a1 setSessionId:];
}

id objc_msgSend_setSigTerm_(void *a1, const char *a2, ...)
{
  return [a1 setSigTerm:];
}

id objc_msgSend_setSourceIDSID_(void *a1, const char *a2, ...)
{
  return [a1 setSourceIDSID:];
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return [a1 setState:];
}

id objc_msgSend_setStateMachine_(void *a1, const char *a2, ...)
{
  return [a1 setStateMachine:];
}

id objc_msgSend_setStateMachineQueue_(void *a1, const char *a2, ...)
{
  return [a1 setStateMachineQueue:];
}

id objc_msgSend_setStateUpdate_(void *a1, const char *a2, ...)
{
  return [a1 setStateUpdate:];
}

id objc_msgSend_setTimeoutCanOccur_(void *a1, const char *a2, ...)
{
  return [a1 setTimeoutCanOccur:];
}

id objc_msgSend_setTimer_(void *a1, const char *a2, ...)
{
  return [a1 setTimer:];
}

id objc_msgSend_setTransaction_(void *a1, const char *a2, ...)
{
  return [a1 setTransaction:];
}

id objc_msgSend_setTransparencyGPBGenericValue_forTransparencyGPBGenericValueKey_(void *a1, const char *a2, ...)
{
  return [a1 setTransparencyGPBGenericValue:forTransparencyGPBGenericValueKey:];
}

id objc_msgSend_setTransparencyd_(void *a1, const char *a2, ...)
{
  return [a1 setTransparencyd:];
}

id objc_msgSend_setTransport_(void *a1, const char *a2, ...)
{
  return [a1 setTransport:];
}

id objc_msgSend_setTypeURL_(void *a1, const char *a2, ...)
{
  return [a1 setTypeURL:];
}

id objc_msgSend_setUnknownFields_(void *a1, const char *a2, ...)
{
  return [a1 setUnknownFields:];
}

id objc_msgSend_setUpdateQueue_(void *a1, const char *a2, ...)
{
  return [a1 setUpdateQueue:];
}

id objc_msgSend_setValue_(void *a1, const char *a2, ...)
{
  return [a1 setValue:];
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return [a1 setWithArray:];
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return [a1 setWithObject:];
}

id objc_msgSend_setXpcQueue_(void *a1, const char *a2, ...)
{
  return [a1 setXpcQueue:];
}

id objc_msgSend_setup(void *a1, const char *a2, ...)
{
  return _[a1 setup];
}

id objc_msgSend_setupExtraTextInfo_(void *a1, const char *a2, ...)
{
  return [a1 setupExtraTextInfo:];
}

id objc_msgSend_setupMailbox_publicInfo_(void *a1, const char *a2, ...)
{
  return [a1 setupMailbox:publicInfo:];
}

id objc_msgSend_setupOneofs_count_firstHasIndex_(void *a1, const char *a2, ...)
{
  return [a1 setupOneofs:x0 count:x1 firstHasIndex:x2];
}

id objc_msgSend_setupTransport(void *a1, const char *a2, ...)
{
  return _[a1 setupTransport];
}

id objc_msgSend_sha256Transparency(void *a1, const char *a2, ...)
{
  return _[a1 sha256Transparency];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_shortAuthenticationString(void *a1, const char *a2, ...)
{
  return _[a1 shortAuthenticationString];
}

id objc_msgSend_sigTerm(void *a1, const char *a2, ...)
{
  return _[a1 sigTerm];
}

id objc_msgSend_signalEventHander(void *a1, const char *a2, ...)
{
  return _[a1 signalEventHander];
}

id objc_msgSend_singletonName(void *a1, const char *a2, ...)
{
  return _[a1 singletonName];
}

id objc_msgSend_singletonNameC(void *a1, const char *a2, ...)
{
  return _[a1 singletonNameC];
}

id objc_msgSend_skipField_(void *a1, const char *a2, ...)
{
  return [a1 skipField:];
}

id objc_msgSend_skipMessage(void *a1, const char *a2, ...)
{
  return _[a1 skipMessage];
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return [a1 sortedArrayUsingSelector:];
}

id objc_msgSend_sortedFields(void *a1, const char *a2, ...)
{
  return _[a1 sortedFields];
}

id objc_msgSend_sourceIDS(void *a1, const char *a2, ...)
{
  return _[a1 sourceIDS];
}

id objc_msgSend_sourceStates(void *a1, const char *a2, ...)
{
  return _[a1 sourceStates];
}

id objc_msgSend_startMessageDelegate_onQueue_(void *a1, const char *a2, ...)
{
  return [a1 startMessageDelegate:onQueue:];
}

id objc_msgSend_startOperation(void *a1, const char *a2, ...)
{
  return _[a1 startOperation];
}

id objc_msgSend_startSession(void *a1, const char *a2, ...)
{
  return _[a1 startSession];
}

id objc_msgSend_startSession_(void *a1, const char *a2, ...)
{
  return [a1 startSession:];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_stateConditions(void *a1, const char *a2, ...)
{
  return _[a1 stateConditions];
}

id objc_msgSend_stateEngine(void *a1, const char *a2, ...)
{
  return _[a1 stateEngine];
}

id objc_msgSend_stateInit(void *a1, const char *a2, ...)
{
  return _[a1 stateInit];
}

id objc_msgSend_stateMachine(void *a1, const char *a2, ...)
{
  return _[a1 stateMachine];
}

id objc_msgSend_stateMachineQueue(void *a1, const char *a2, ...)
{
  return _[a1 stateMachineQueue];
}

id objc_msgSend_stateMachineRequests(void *a1, const char *a2, ...)
{
  return _[a1 stateMachineRequests];
}

id objc_msgSend_stateMachineWatchers(void *a1, const char *a2, ...)
{
  return _[a1 stateMachineWatchers];
}

id objc_msgSend_stateUpdate(void *a1, const char *a2, ...)
{
  return _[a1 stateUpdate];
}

id objc_msgSend_states(void *a1, const char *a2, ...)
{
  return _[a1 states];
}

id objc_msgSend_staticKeyFeatureNotEnabled_(void *a1, const char *a2, ...)
{
  return [a1 staticKeyFeatureNotEnabled:];
}

id objc_msgSend_stopTransaction(void *a1, const char *a2, ...)
{
  return _[a1 stopTransaction];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingString:];
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return [a1 stringFromDate:];
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 stringWithCapacity:];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return [a1 stringWithUTF8String:];
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return [a1 substringFromIndex:];
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return [a1 substringToIndex:];
}

id objc_msgSend_successDependencies(void *a1, const char *a2, ...)
{
  return _[a1 successDependencies];
}

id objc_msgSend_successState(void *a1, const char *a2, ...)
{
  return _[a1 successState];
}

id objc_msgSend_superclass(void *a1, const char *a2, ...)
{
  return _[a1 superclass];
}

id objc_msgSend_syntax(void *a1, const char *a2, ...)
{
  return _[a1 syntax];
}

id objc_msgSend_tearDown_toID_fromID_(void *a1, const char *a2, ...)
{
  return [a1 tearDown:x0 toID:x1 fromID:x2];
}

id objc_msgSend_teardownMailbox_(void *a1, const char *a2, ...)
{
  return [a1 teardownMailbox:];
}

id objc_msgSend_testHoldStates(void *a1, const char *a2, ...)
{
  return _[a1 testHoldStates];
}

id objc_msgSend_textFormatName(void *a1, const char *a2, ...)
{
  return _[a1 textFormatName];
}

id objc_msgSend_textFormatNameForValue_(void *a1, const char *a2, ...)
{
  return [a1 textFormatNameForValue:];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceDate:];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceNow];
}

id objc_msgSend_timeout(void *a1, const char *a2, ...)
{
  return _[a1 timeout];
}

id objc_msgSend_timeout_(void *a1, const char *a2, ...)
{
  return [a1 timeout:];
}

id objc_msgSend_timeoutCanOccur(void *a1, const char *a2, ...)
{
  return _[a1 timeoutCanOccur];
}

id objc_msgSend_timeoutQueue(void *a1, const char *a2, ...)
{
  return _[a1 timeoutQueue];
}

id objc_msgSend_timer(void *a1, const char *a2, ...)
{
  return _[a1 timer];
}

id objc_msgSend_toID(void *a1, const char *a2, ...)
{
  return _[a1 toID];
}

id objc_msgSend_transaction(void *a1, const char *a2, ...)
{
  return _[a1 transaction];
}

id objc_msgSend_transitionOperation(void *a1, const char *a2, ...)
{
  return _[a1 transitionOperation];
}

id objc_msgSend_transparencyd(void *a1, const char *a2, ...)
{
  return _[a1 transparencyd];
}

id objc_msgSend_transport(void *a1, const char *a2, ...)
{
  return _[a1 transport];
}

id objc_msgSend_trigger(void *a1, const char *a2, ...)
{
  return _[a1 trigger];
}

id objc_msgSend_triggerAt_(void *a1, const char *a2, ...)
{
  return [a1 triggerAt:];
}

id objc_msgSend_ttr_fromHandle_complete_(void *a1, const char *a2, ...)
{
  return [a1 ttr:fromHandle:complete:];
}

id objc_msgSend_typeURL(void *a1, const char *a2, ...)
{
  return _[a1 typeURL];
}

id objc_msgSend_undisclosedInitiatorRandom(void *a1, const char *a2, ...)
{
  return _[a1 undisclosedInitiatorRandom];
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return [a1 unionSet:];
}

id objc_msgSend_unknownFields(void *a1, const char *a2, ...)
{
  return _[a1 unknownFields];
}

id objc_msgSend_unlockDependency(void *a1, const char *a2, ...)
{
  return _[a1 unlockDependency];
}

id objc_msgSend_unregister(void *a1, const char *a2, ...)
{
  return _[a1 unregister];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongLongValue];
}

id objc_msgSend_updateQueue(void *a1, const char *a2, ...)
{
  return _[a1 updateQueue];
}

id objc_msgSend_updateState(void *a1, const char *a2, ...)
{
  return _[a1 updateState];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_validateAnnounce_(void *a1, const char *a2, ...)
{
  return [a1 validateAnnounce:];
}

id objc_msgSend_validateWithMessage_error_(void *a1, const char *a2, ...)
{
  return [a1 validateWithMessage:error];
}

id objc_msgSend_validationFunc(void *a1, const char *a2, ...)
{
  return _[a1 validationFunc];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_valueAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 valueAtIndex:];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return [a1 valueForEntitlement:];
}

id objc_msgSend_valueWithPointer_(void *a1, const char *a2, ...)
{
  return [a1 valueWithPointer:];
}

id objc_msgSend_varintList(void *a1, const char *a2, ...)
{
  return _[a1 varintList];
}

id objc_msgSend_wait_(void *a1, const char *a2, ...)
{
  return [a1 wait:];
}

id objc_msgSend_waitUntilFinished(void *a1, const char *a2, ...)
{
  return _[a1 waitUntilFinished];
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return _[a1 weakObjectsHashTable];
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return [a1 willChangeValueForKey:];
}

id objc_msgSend_wireType(void *a1, const char *a2, ...)
{
  return _[a1 wireType];
}

id objc_msgSend_write_maxLength_(void *a1, const char *a2, ...)
{
  return [a1 write:x0 maxLength:x1];
}

id objc_msgSend_writeBool_value_(void *a1, const char *a2, ...)
{
  return [a1 writeBool:value:];
}

id objc_msgSend_writeBoolNoTag_(void *a1, const char *a2, ...)
{
  return [a1 writeBoolNoTag:];
}

id objc_msgSend_writeBytes_value_(void *a1, const char *a2, ...)
{
  return [a1 writeBytes:x0 value:x1];
}

id objc_msgSend_writeBytesArray_values_(void *a1, const char *a2, ...)
{
  return [a1 writeBytesArray:values:];
}

id objc_msgSend_writeBytesNoTag_(void *a1, const char *a2, ...)
{
  return [a1 writeBytesNoTag:];
}

id objc_msgSend_writeDelimitedToCodedOutputStream_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "writeDelimitedToCodedOutputStream:");
}

id objc_msgSend_writeDouble_value_(void *a1, const char *a2, ...)
{
  return [a1 writeDouble:value:];
}

id objc_msgSend_writeDoubleNoTag_(void *a1, const char *a2, ...)
{
  return [a1 writeDoubleNoTag:];
}

id objc_msgSend_writeEnum_value_(void *a1, const char *a2, ...)
{
  return [a1 writeEnum:value];
}

id objc_msgSend_writeEnumNoTag_(void *a1, const char *a2, ...)
{
  return [a1 writeEnumNoTag:];
}

id objc_msgSend_writeExtensionsToCodedOutputStream_range_sortedExtensions_(void *a1, const char *a2, ...)
{
  return [a1 writeExtensionsToCodedOutputStream:x0 range:x1 sortedExtensions:x2];
}

id objc_msgSend_writeField_toCodedOutputStream_(void *a1, const char *a2, ...)
{
  return [a1 writeField:toCodedOutputStream:];
}

id objc_msgSend_writeFixed32_value_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "writeFixed32:value:");
}

id objc_msgSend_writeFixed32Array_values_tag_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "writeFixed32Array:values:tag:");
}

id objc_msgSend_writeFixed32NoTag_(void *a1, const char *a2, ...)
{
  return [a1 writeFixed32NoTag:];
}

id objc_msgSend_writeFixed64_value_(void *a1, const char *a2, ...)
{
  return [a1 writeFixed64:value:];
}

id objc_msgSend_writeFixed64Array_values_tag_(void *a1, const char *a2, ...)
{
  return [a1 writeFixed64Array:values:tag:];
}

id objc_msgSend_writeFixed64NoTag_(void *a1, const char *a2, ...)
{
  return [a1 writeFixed64NoTag:];
}

id objc_msgSend_writeFloat_value_(void *a1, const char *a2, ...)
{
  return [a1 writeFloat:x0 value:x1];
}

id objc_msgSend_writeFloatNoTag_(void *a1, const char *a2, ...)
{
  return [a1 writeFloatNoTag:];
}

id objc_msgSend_writeGroup_value_(void *a1, const char *a2, ...)
{
  return [a1 writeGroup:value];
}

id objc_msgSend_writeGroupNoTag_value_(void *a1, const char *a2, ...)
{
  return [a1 writeGroupNoTag:value:];
}

id objc_msgSend_writeInt32NoTag_(void *a1, const char *a2, ...)
{
  return [a1 writeInt32NoTag:];
}

id objc_msgSend_writeInt64NoTag_(void *a1, const char *a2, ...)
{
  return [a1 writeInt64NoTag:];
}

id objc_msgSend_writeMessage_value_(void *a1, const char *a2, ...)
{
  return [a1 writeMessage:value:];
}

id objc_msgSend_writeMessageNoTag_(void *a1, const char *a2, ...)
{
  return [a1 writeMessageNoTag:];
}

id objc_msgSend_writeRawMessageSetExtension_value_(void *a1, const char *a2, ...)
{
  return [a1 writeRawMessageSetExtension:x0 value:x1];
}

id objc_msgSend_writeRawVarintSizeTAs32_(void *a1, const char *a2, ...)
{
  return [a1 writeRawVarintSizeTAs32:];
}

id objc_msgSend_writeSFixed32NoTag_(void *a1, const char *a2, ...)
{
  return [a1 writeSFixed32NoTag:];
}

id objc_msgSend_writeSFixed64NoTag_(void *a1, const char *a2, ...)
{
  return [a1 writeSFixed64NoTag:];
}

id objc_msgSend_writeSInt32NoTag_(void *a1, const char *a2, ...)
{
  return [a1 writeSInt32NoTag:];
}

id objc_msgSend_writeSInt64NoTag_(void *a1, const char *a2, ...)
{
  return [a1 writeSInt64NoTag:];
}

id objc_msgSend_writeString_value_(void *a1, const char *a2, ...)
{
  return [a1 writeString:value];
}

id objc_msgSend_writeStringNoTag_(void *a1, const char *a2, ...)
{
  return [a1 writeStringNoTag:];
}

id objc_msgSend_writeTag_format_(void *a1, const char *a2, ...)
{
  return [a1 writeTag:format:];
}

id objc_msgSend_writeToCodedOutputStream_(void *a1, const char *a2, ...)
{
  return [a1 writeToCodedOutputStream:];
}

id objc_msgSend_writeToOutput_(void *a1, const char *a2, ...)
{
  return [a1 writeToOutput:];
}

id objc_msgSend_writeUInt32_value_(void *a1, const char *a2, ...)
{
  return [a1 writeUInt32:value:];
}

id objc_msgSend_writeUInt32NoTag_(void *a1, const char *a2, ...)
{
  return [a1 writeUInt32NoTag:];
}

id objc_msgSend_writeUInt64_value_(void *a1, const char *a2, ...)
{
  return [a1 writeUInt64:x0 value:x1];
}

id objc_msgSend_writeUInt64Array_values_tag_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "writeUInt64Array:values:tag:");
}

id objc_msgSend_writeUInt64NoTag_(void *a1, const char *a2, ...)
{
  return [a1 writeUInt64NoTag:];
}

id objc_msgSend_writeUnknownGroup_value_(void *a1, const char *a2, ...)
{
  return [a1 writeUnknownGroup:value:];
}

id objc_msgSend_xpcQueue(void *a1, const char *a2, ...)
{
  return _[a1 xpcQueue];
}