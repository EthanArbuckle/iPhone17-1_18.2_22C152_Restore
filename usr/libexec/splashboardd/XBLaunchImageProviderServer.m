@interface XBLaunchImageProviderServer
+ (id)sharedInstance;
- (XBLaunchImageProviderServer)init;
- (id)_transactionWorkForClient:(id)a3;
- (unsigned)_onMain_createLaunchWindowForClient:(id)a3 withLaunchRequest:(id)a4 appInfo:(id)a5 captureInfo:(id *)a6 captureOptions:(int64_t)a7 error:(id *)a8;
- (void)_queue_handleGetLaunchImage:(id)a3 forClient:(id)a4;
- (void)_removeTransactionWorkForClient:(id)a3;
- (void)_setTransactionWork:(id)a3 forClient:(id)a4;
- (void)queue_clientAdded:(id)a3;
- (void)queue_clientRemoved:(id)a3;
- (void)queue_handleMessage:(id)a3 client:(id)a4;
- (void)run;
@end

@implementation XBLaunchImageProviderServer

- (void)_removeTransactionWorkForClient:(id)a3
{
  p_accessLock = &self->_accessLock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_accessLock);
  os_unfair_lock_lock(p_accessLock);
  [(NSMapTable *)self->_accessLock_clientTransactionWorkMap removeObjectForKey:v5];

  os_unfair_lock_unlock(p_accessLock);
}

- (id)_transactionWorkForClient:(id)a3
{
  p_accessLock = &self->_accessLock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_accessLock);
  os_unfair_lock_lock(p_accessLock);
  v6 = [(NSMapTable *)self->_accessLock_clientTransactionWorkMap objectForKey:v5];

  os_unfair_lock_unlock(p_accessLock);

  return v6;
}

- (void)queue_clientRemoved:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000208C;
  block[3] = &unk_10000C758;
  block[4] = self;
  id v7 = a3;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  v4 = v8;
  id v5 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  [(XBLaunchImageProviderServer *)self _removeTransactionWorkForClient:v5];
}

- (void)queue_clientAdded:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(XBLaunchImageClientTransactionWork);
  [(XBLaunchImageProviderServer *)self _setTransactionWork:v5 forClient:v4];
}

- (void)queue_handleMessage:(id)a3 client:(id)a4
{
  xpc_object_t xdict = a3;
  id v6 = a4;
  int64_t int64 = xpc_dictionary_get_int64(xdict, XBLaunchImageProviderMessageKeyMessageType);
  if (int64 == 1)
  {
    [(XBLaunchImageProviderServer *)self _handlePreheat:xdict forClient:v6];
  }
  else if (!int64)
  {
    [(XBLaunchImageProviderServer *)self _queue_handleGetLaunchImage:xdict forClient:v6];
  }
}

- (void)_setTransactionWork:(id)a3 forClient:(id)a4
{
  p_accessLock = &self->_accessLock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_assert_not_owner(p_accessLock);
  os_unfair_lock_lock(p_accessLock);
  [(NSMapTable *)self->_accessLock_clientTransactionWorkMap setObject:v8 forKey:v7];

  os_unfair_lock_unlock(p_accessLock);
}

+ (id)sharedInstance
{
  if (qword_1000115B0 != -1) {
    dispatch_once(&qword_1000115B0, &stru_10000C6C8);
  }
  v2 = (void *)qword_1000115A8;

  return v2;
}

- (XBLaunchImageProviderServer)init
{
  v8.receiver = self;
  v8.super_class = (Class)XBLaunchImageProviderServer;
  v2 = [(XBLaunchImageProviderServer *)&v8 initWithServiceName:XBApplicationLaunchImageServiceName];
  if (v2)
  {
    v3 = objc_alloc_init(_XBMemoryMonitor);
    memoryMonitor = v2->_memoryMonitor;
    v2->_memoryMonitor = v3;

    v2->_accessLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = +[NSMapTable strongToStrongObjectsMapTable];
    accessLock_clientTransactionWorkMap = v2->_accessLock_clientTransactionWorkMap;
    v2->_accessLock_clientTransactionWorkMap = (NSMapTable *)v5;
  }
  return v2;
}

- (void)run
{
  v3 = sub_10000272C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Running", buf, 2u);
  }

  if (qword_1000115B8 != -1) {
    dispatch_once(&qword_1000115B8, &stru_10000C6E8);
  }
  id v4 = [(XBLaunchImageProviderServer *)self queue];
  dispatch_async(v4, &stru_10000C708);

  v5.receiver = self;
  v5.super_class = (Class)XBLaunchImageProviderServer;
  [(XBLaunchImageProviderServer *)&v5 run];
}

- (void)_queue_handleGetLaunchImage:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->BSBaseXPCServer_opaque[OBJC_IVAR___BSBaseXPCServer__queue]);
  xpc_object_t xdict = v6;
  objc_super v8 = BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
  v34 = BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
  LODWORD(v9) = xpc_dictionary_get_BOOL(v6, XBLaunchImageProviderMessageKeyCreateCaptureInfo);
  v10 = [v7 connection];
  BSPIDForXPCConnection();
  v11 = BSProcessDescriptionForPID();

  v12 = sub_1000027C4();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [v8 bundleIdentifier];
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Running image request from %{public}@ for %@", buf, 0x16u);
  }
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x2020000000;
  int v53 = XBInvalidContextId;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v56 = sub_100006084;
  v57 = sub_100006094;
  id v58 = 0;
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x3032000000;
  v50[3] = sub_100006084;
  v50[4] = sub_100006094;
  id v51 = 0;
  v14 = [v7 connection];
  v15 = +[BSAuditToken tokenFromXPCConnection:v14];

  if ([v15 hasEntitlement:XBApplicationLaunchImageCaptureEntitlement]) {
    goto LABEL_8;
  }
  if (v15)
  {
    [v15 realToken];
  }
  else
  {
    long long v48 = 0u;
    long long v49 = 0u;
  }
  if (BSAuditTokenRepresentsPlatformBinary())
  {
LABEL_8:
    char v16 = (char)v9;
    if (v9) {
      LOBYTE(v9) = [v15 hasEntitlement:XBApplicationLaunchImageCaarCaptureEntitlement];
    }
    *(void *)v54 = 0;
    *(void *)&v54[8] = 0;
    pthread_dependency_init_np();
    Main = CFRunLoopGetMain();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000609C;
    block[3] = &unk_10000C780;
    char v46 = v16;
    char v47 = (char)v9;
    v42 = v52;
    block[4] = self;
    id v39 = v7;
    id v40 = v34;
    id v9 = v8;
    id v41 = v9;
    v43 = v50;
    v44 = buf;
    v45 = v54;
    CFRunLoopPerformBlock(Main, kCFRunLoopCommonModes, block);
    v18 = CFRunLoopGetMain();
    CFRunLoopWakeUp(v18);
    pthread_dependency_wait_np();
    memoryMonitor = self->_memoryMonitor;
    v20 = [v9 bundleIdentifier];
    [(_XBMemoryMonitor *)memoryMonitor recordMemoryForBundleID:v20];

    LOBYTE(v9) = v16;
  }
  else
  {
    v21 = sub_1000027C4();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100006F54((uint64_t)v11, v21);
    }

    id v22 = objc_alloc((Class)XBLaunchImageError);
    v23 = [v8 bundleIdentifier];
    id v24 = [v22 initWithCode:10 bundleID:v23 reason:@"The client is unentitled" fatal:0];
    v25 = *(void **)(*(void *)&buf[8] + 40);
    *(void *)(*(void *)&buf[8] + 40) = v24;
  }
  v26 = +[BSXPCReply replyForMessage:xdict];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100006164;
  v36[3] = &unk_10000C7A8;
  v36[4] = v52;
  v36[5] = buf;
  char v37 = (char)v9;
  v36[6] = v50;
  [v26 sendReply:v36];
  v27 = *(void **)(*(void *)&buf[8] + 40);
  if (v27)
  {
    if ([v27 isFatal])
    {
      v31 = sub_1000027C4();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        id v32 = [*(id *)(*(void *)&buf[8] + 40) code];
        v33 = [v8 bundleIdentifier];
        *(_DWORD *)v54 = 134218242;
        *(void *)&v54[4] = v32;
        *(_WORD *)&v54[12] = 2114;
        *(void *)&v54[14] = v33;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "XBLaunchImageProviderServer encountered a fatal error with code: %ld during launch image generation for bundleID: %{public}@", v54, 0x16u);
      }
      exit(0);
    }
    v28 = sub_1000027C4();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      id v29 = [*(id *)(*(void *)&buf[8] + 40) code];
      v30 = [v8 bundleIdentifier];
      *(_DWORD *)v54 = 134218242;
      *(void *)&v54[4] = v29;
      *(_WORD *)&v54[12] = 2114;
      *(void *)&v54[14] = v30;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "XBLaunchImageProviderServer encountered an error with code: %ld during launch image generation for bundleID: %{public}@", v54, 0x16u);
    }
  }

  _Block_object_dispose(v50, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(v52, 8);
}

- (unsigned)_onMain_createLaunchWindowForClient:(id)a3 withLaunchRequest:(id)a4 appInfo:(id)a5 captureInfo:(id *)a6 captureOptions:(int64_t)a7 error:(id *)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v17 = sub_1000027C4();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    int v31 = 67109376;
    *(_DWORD *)id v32 = qos_class_self();
    *(_WORD *)&v32[4] = 1024;
    *(_DWORD *)&v32[6] = BSPthreadGetCurrentPriority();
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Running on main thread at QoS %d with priority %d.", (uint8_t *)&v31, 0xEu);
  }

  v18 = +[NSDate date];
  v19 = [(XBLaunchImageProviderServer *)self _transactionWorkForClient:v16];

  v20 = [v19 contextWrapper];
  if (!v20)
  {
    v21 = +[XBLaunchImageContextWrapper contextWrapperForApplicationWithCompatibilityInfo:v15 launchRequest:v14 captureOptions:a7];
    [v19 setContextWrapper:v21];
    if (!a6) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v21 = v20;
  [v20 updateLaunchRequest:v14];
  if (a6)
  {
LABEL_5:
    *a6 = [v21 captureInformation];
  }
LABEL_6:
  unsigned int v22 = XBInvalidContextId;
  v23 = [v21 error];
  if (v23 || (unsigned int v26 = [v21 contextID]) == 0 || v22 == v26)
  {
    [v21 invalidate];
    [v19 setContextWrapper:0];
    id v24 = sub_1000027C4();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = [v15 bundleIdentifier];
      int v31 = 138412546;
      *(void *)id v32 = v25;
      *(_WORD *)&v32[8] = 2112;
      double v33 = *(double *)&v23;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[%@] launch image generation failed with error: %@", (uint8_t *)&v31, 0x16u);
    }
    if (a8 && v23) {
      *a8 = v23;
    }
  }
  else
  {
    unsigned int v22 = [v21 contextID];
    v27 = sub_1000027C4();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = [v15 bundleIdentifier];
      [v18 timeIntervalSinceNow];
      int v31 = 138412546;
      *(void *)id v32 = v28;
      *(_WORD *)&v32[8] = 2048;
      double v33 = -v29;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[%@] launch image generation completed after %.3fs", (uint8_t *)&v31, 0x16u);
    }
  }

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessLock_clientTransactionWorkMap, 0);

  objc_storeStrong((id *)&self->_memoryMonitor, 0);
}

@end