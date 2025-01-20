void start(int a1, char **a2)
{
  int v4;
  os_log_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  VolumeManagerDelegate *v12;
  NSObject *v13;
  id v14;
  void *v15;
  NSObject *v16;
  VolumeManagerNSXPCListenerDelegate *v17;
  NSObject *v18;
  VolumeManagerNSXPCListenerDelegate *v19;
  id v20;
  NSObject *v21;
  void *v22;
  dispatch_queue_t v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  _DWORD v27[2];

  do
  {
    while (1)
    {
      v4 = getopt(a1, a2, "S");
      if (v4 != 83) {
        break;
      }
      byte_10000D698 = 1;
    }
  }
  while (v4 != -1);
  v5 = os_log_create("com.apple.filesystems.userfsd", "main");
  v6 = (void *)qword_10000D6C0;
  qword_10000D6C0 = (uint64_t)v5;

  if (!v5) {
    err(73, "main:error creating default log.");
  }
  v7 = qword_10000D6C0;
  if (os_log_type_enabled((os_log_t)qword_10000D6C0, OS_LOG_TYPE_DEFAULT))
  {
    v27[0] = 67109120;
    v27[1] = byte_10000D698;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "main:start:spotlight:%d]", (uint8_t *)v27, 8u);
  }
  v8 = objc_alloc_init((Class)NSMutableDictionary);
  v9 = (void *)qword_10000D6A8;
  qword_10000D6A8 = (uint64_t)v8;

  v10 = objc_alloc_init((Class)NSMutableDictionary);
  v11 = (void *)qword_10000D6B0;
  qword_10000D6B0 = (uint64_t)v10;

  v12 = objc_alloc_init(VolumeManagerDelegate);
  if (!v12)
  {
    v13 = qword_10000D6C0;
    if (os_log_type_enabled((os_log_t)qword_10000D6C0, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v27[0]) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "main:volumeManager:delegate:alloc:failed", (uint8_t *)v27, 2u);
    }
    err(73, "main:externalVolumeDelegate:aloc:failed");
  }
  v14 = +[LiveFSVolumeManager newServiceProxyObjectWithDelegate:v12];
  v15 = (void *)qword_10000D6A0;
  qword_10000D6A0 = (uint64_t)v14;

  if (!qword_10000D6A0)
  {
    v16 = qword_10000D6C0;
    if (os_log_type_enabled((os_log_t)qword_10000D6C0, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v27[0]) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "main:volumeManager:alloc:failed", (uint8_t *)v27, 2u);
    }
    err(73, "main:externalVolumeManager:alloc:failed");
  }
  v17 = objc_alloc_init(VolumeManagerNSXPCListenerDelegate);
  if (!v17)
  {
    v18 = qword_10000D6C0;
    if (os_log_type_enabled((os_log_t)qword_10000D6C0, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v27[0]) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "main:volumeManager:listener:delegate:create:failed", (uint8_t *)v27, 2u);
    }
    err(73, "Can't create delegate for the mount service.\n");
  }
  v19 = v17;
  [(VolumeManagerNSXPCListenerDelegate *)v17 setServer:qword_10000D6A0];
  v20 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.filesystems.localLiveFiles"];
  if (!v20)
  {
    v21 = qword_10000D6C0;
    if (os_log_type_enabled((os_log_t)qword_10000D6C0, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v27[0]) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "main:volumeManager:listener:create:failed", (uint8_t *)v27, 2u);
    }
    err(73, "Can't create mount service listener.\n");
  }
  v22 = v20;
  [v20 setDelegate:v19];
  v23 = dispatch_queue_create("com.apple.userfsd.volumeManager.requests", 0);
  v24 = (void *)qword_10000D6B8;
  qword_10000D6B8 = (uint64_t)v23;

  if (!qword_10000D6B8)
  {
    v25 = qword_10000D6C0;
    if (os_log_type_enabled((os_log_t)qword_10000D6C0, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v27[0]) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "main:volumeManager:dispatchQueue:create:fail.", (uint8_t *)v27, 2u);
    }
    err(73, "main: unable to create LiveFSService queue\n");
  }
  objc_msgSend(v22, "_setQueue:");
  sub_100001CB8();
  [v22 resume];
  [(id)qword_10000D6A0 initializationFinished];
  v26 = qword_10000D6C0;
  if (os_log_type_enabled((os_log_t)qword_10000D6C0, OS_LOG_TYPE_INFO))
  {
    LOWORD(v27[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "main:VolumeManager:started", (uint8_t *)v27, 2u);
  }
  dispatch_main();
}

void sub_100001CB8()
{
  id v0 = +[LiveFSMountClient newClientForProvider:@"com.apple.filesystems.UserFS.FileProvider"];
  v1 = v0;
  if (v0) {
    BOOL v2 = qword_10000D6A0 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    v3 = qword_10000D6C0;
    if (os_log_type_enabled((os_log_t)qword_10000D6C0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "cleanupStateIfNeeded:mounterServer:notReachable:skiping", buf, 2u);
    }
    int v4 = 0;
    int v5 = 0;
    goto LABEL_58;
  }
  id v48 = 0;
  v6 = [v0 allMounts:&v48];
  id v7 = v48;
  if (os_log_type_enabled((os_log_t)qword_10000D6C0, OS_LOG_TYPE_DEBUG)) {
    sub_10000483C();
  }
  if (v7) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v6 == 0;
  }
  char v10 = !v9;
  if (v9)
  {
    if (v7)
    {
      if (os_log_type_enabled((os_log_t)qword_10000D6C0, OS_LOG_TYPE_ERROR)) {
        sub_1000047C8();
      }
    }
    else
    {
      if (!v6)
      {
        v33 = qword_10000D6C0;
        if (os_log_type_enabled((os_log_t)qword_10000D6C0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "cleanupStateIfNeeded:mounterService:noMounts:finish", buf, 2u);
        }
      }
      id v7 = 0;
    }
    int v4 = 0;
    int v5 = 0;
  }
  else
  {
    char v36 = v10;
    v39 = v1;
    v11 = objc_opt_new();
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v37 = v6;
    id v12 = v6;
    id v13 = [v12 countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v13)
    {
      id v14 = v13;
      int v38 = 0;
      uint64_t v15 = *(void *)v45;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v45 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          v18 = [v17 objectForKeyedSubscript:LiveFSMounterVolumeProviderNameKey];
          unsigned int v19 = [v18 isEqualToString:@"com.apple.filesystems.UserFS.FileProvider"];

          if (v19)
          {
            v20 = [v17 objectForKeyedSubscript:LiveFSMounterVolumeNameKey];
            [v11 addObject:v20];

            ++v38;
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v44 objects:v52 count:16];
      }
      while (v14);
    }
    else
    {
      int v38 = 0;
    }

    if (os_log_type_enabled((os_log_t)qword_10000D6C0, OS_LOG_TYPE_DEBUG)) {
      sub_100004760();
    }
    id v35 = objc_alloc_init((Class)NSMutableDictionary);
    v21 = [v35 allKeys];
    v22 = +[NSSet setWithArray:v21];
    [v11 minusSet:v22];

    if (os_log_type_enabled((os_log_t)qword_10000D6C0, OS_LOG_TYPE_DEBUG)) {
      sub_1000046F8();
    }
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v23 = v11;
    id v24 = [v23 countByEnumeratingWithState:&v40 objects:v51 count:16];
    if (v24)
    {
      id v25 = v24;
      id v7 = 0;
      int v5 = 0;
      uint64_t v26 = *(void *)v41;
      do
      {
        for (j = 0; j != v25; j = (char *)j + 1)
        {
          v28 = v7;
          if (*(void *)v41 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v29 = *(void *)(*((void *)&v40 + 1) + 8 * (void)j);
          v30 = [@"com.apple.filesystems.userfsd" stringByAppendingPathComponent:v29];
          v31 = qword_10000D6C0;
          if (os_log_type_enabled((os_log_t)qword_10000D6C0, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v50 = v29;
            _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "cleanUpStateIfNeeded:unmounting:%@", buf, 0xCu);
          }
          id v7 = [v39 unmountVolume:v30 how:6];

          if (v7)
          {
            v32 = qword_10000D6C0;
            if (os_log_type_enabled((os_log_t)qword_10000D6C0, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v50 = v29;
              _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "cleanUpStateIfNeeded: failed to cleanup volume: %@", buf, 0xCu);
            }
          }
          else
          {
            ++v5;
          }
        }
        id v25 = [v23 countByEnumeratingWithState:&v40 objects:v51 count:16];
      }
      while (v25);
    }
    else
    {
      id v7 = 0;
      int v5 = 0;
    }

    v1 = v39;
    v6 = v37;
    char v10 = v36;
    int v4 = v38;
  }

  if (v10)
  {
LABEL_58:
    v34 = qword_10000D6C0;
    if (os_log_type_enabled((os_log_t)qword_10000D6C0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v50 = v4;
      *(_WORD *)&v50[4] = 1024;
      *(_DWORD *)&v50[6] = v5;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "cleanupStateIfNeeded:finish:kernelMounts:%d:cleanedup:%d", buf, 0xEu);
    }
  }
}

void sub_10000223C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1000025F0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void sub_100002758(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100002888(uint64_t a1)
{
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = sub_100002C24;
  v30 = sub_100002C34;
  id v31 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = sub_100002C24;
  id v24 = sub_100002C34;
  id v25 = 0;
  id v2 = (id)qword_10000D6A8;
  objc_sync_enter(v2);
  v3 = (void *)qword_10000D6A8;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100002C3C;
  v16[3] = &unk_100008298;
  id v17 = *(id *)(a1 + 32);
  v18 = &v26;
  unsigned int v19 = &v20;
  [v3 enumerateKeysAndObjectsUsingBlock:v16];

  objc_sync_exit(v2);
  if (v27[5])
  {
    int v4 = qword_10000D6C0;
    if (os_log_type_enabled((os_log_t)qword_10000D6C0, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = v27[5];
      *(_DWORD *)buf = 138412290;
      *(void *)v33 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "connection interrupted:%@", buf, 0xCu);
    }
  }
  v6 = (void *)v21[5];
  if (v6)
  {
    if ([v6 exited])
    {
      id v7 = (id)qword_10000D6C0;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v8 = [(id)v21[5] pid];
        uint64_t v9 = v27[5];
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v33 = v8;
        *(_WORD *)&v33[4] = 2112;
        *(void *)&v33[6] = v9;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Cleaning up UVFSService[%d] for device %@.", buf, 0x12u);
      }

      id v10 = (id)qword_10000D6A8;
      objc_sync_enter(v10);
      v11 = [(id)qword_10000D6A8 objectForKeyedSubscript:v27[5]];
      id v12 = v11;
      if (v11
        && ([v11 UUID],
            id v13 = objc_claimAutoreleasedReturnValue(),
            unsigned int v14 = [v13 isEqual:*(void *)(a1 + 32)],
            v13,
            v14))
      {
        [(id)qword_10000D6A8 removeObjectForKey:v27[5]];
      }
      else
      {
        uint64_t v15 = qword_10000D6C0;
        if (os_log_type_enabled((os_log_t)qword_10000D6C0, OS_LOG_TYPE_ERROR)) {
          sub_100004C40(v15);
        }
      }

      objc_sync_exit(v10);
    }
    else if (os_log_type_enabled((os_log_t)qword_10000D6C0, OS_LOG_TYPE_ERROR))
    {
      sub_100004C84();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_10000D6C0, OS_LOG_TYPE_ERROR))
  {
    sub_100004BD8();
  }
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
}

void sub_100002BE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

uint64_t sub_100002C24(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100002C34(uint64_t a1)
{
}

void sub_100002C3C(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v11 = a2;
  id v8 = a3;
  uint64_t v9 = [v8 UUID];
  unsigned int v10 = [v9 isEqual:a1[4]];

  if (v10)
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
    *a4 = 1;
  }
}

void sub_100003430(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,id location,char a45)
{
  objc_sync_exit(v46);
  objc_destroyWeak(v45);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose((const void *)(v47 - 256), 8);
  _Block_object_dispose((const void *)(v47 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_100003494(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained handleInvalidation:*(void *)(a1 + 32) fileSystemType:*(void *)(a1 + 40) service:*(void *)(a1 + 48)];
    id WeakRetained = v3;
  }
}

void sub_1000034EC()
{
  if (os_log_type_enabled((os_log_t)qword_10000D6C0, OS_LOG_TYPE_ERROR)) {
    sub_100004D54();
  }
}

void sub_100003538(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)qword_10000D6C0, OS_LOG_TYPE_ERROR)) {
    sub_100004DC0();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  id v6 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000035BC(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v6 = obj;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100003638(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  unsigned int v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000379C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100003C20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  objc_sync_exit(v29);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_100003C54(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100003CB4(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100003D14(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000041B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

uint64_t sub_1000041F8(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = +[NSDictionary dictionaryWithDictionary:a2];

  return _objc_release_x1();
}

void sub_10000424C(uint64_t a1, void *a2)
{
}

uint64_t sub_100004674(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100004684(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100004694(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_1000046A4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000046D0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_1000046F8()
{
  sub_100002258();
  sub_10000223C((void *)&_mh_execute_header, v0, v1, "cleanUpStateIfNeeded:cleanupSet:%@", v2, v3, v4, v5, v6);
}

void sub_100004760()
{
  sub_100002258();
  sub_10000223C((void *)&_mh_execute_header, v0, v1, "cleanUpStateIfNeeded:userfsKernelMounts:%@", v2, v3, v4, v5, v6);
}

void sub_1000047C8()
{
  sub_100002258();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "cleanUpStateIfNeeded:mounterServiceError:%@:finish", v1, 0xCu);
}

void sub_10000483C()
{
  sub_100002258();
  sub_10000223C((void *)&_mh_execute_header, v0, v1, "cleanUpStateIfNeeded:kernelMounts: %@", v2, v3, v4, v5, v6);
}

void sub_1000048A4(void *a1, void *a2)
{
  uint64_t v3 = a1;
  [a2 processIdentifier];
  v4[0] = 136315394;
  sub_1000025DC();
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s:pid:%d:rejecting", (uint8_t *)v4, 0x12u);
}

void sub_100004948(void *a1, void *a2)
{
  id v3 = a1;
  [a2 processIdentifier];
  sub_1000025DC();
  sub_1000025F0((void *)&_mh_execute_header, v4, v5, "%s:pid:%d:accepting", v6, v7, v8, v9, 2u);
}

void sub_1000049DC(void *a1, void *a2)
{
  id v3 = a1;
  [a2 processIdentifier];
  sub_1000025DC();
  sub_1000025F0((void *)&_mh_execute_header, v4, v5, "%s:pid:%d:start", v6, v7, v8, v9, 2u);
}

void sub_100004A70(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Got exit notificaiton for non-tracked device:%@", (uint8_t *)&v2, 0xCu);
}

void sub_100004AE8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Marking UVFSService for device %@ as exited", (uint8_t *)&v2, 0xCu);
}

void sub_100004B60(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Got exit notification for device %@", (uint8_t *)&v2, 0xCu);
}

void sub_100004BD8()
{
  sub_100004694(__stack_chk_guard);
  sub_1000046EC();
  sub_1000046A4((void *)&_mh_execute_header, v0, v1, "UVFSService for device %@ not found, ignoring", v2, v3, v4, v5, v6);
}

void sub_100004C40(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "There is a newer UVFSService for the device, ignoring", v1, 2u);
}

void sub_100004C84()
{
  sub_100004694(__stack_chk_guard);
  sub_1000046EC();
  sub_1000046A4((void *)&_mh_execute_header, v0, v1, "Trying to cleanup non-exited UVFSService for device %@", v2, v3, v4, v5, v6);
}

void sub_100004CEC()
{
  sub_100004694(__stack_chk_guard);
  sub_1000046EC();
  sub_1000046A4((void *)&_mh_execute_header, v0, v1, "liveFSService:delegate:addDisk:XPCService:startup:error:%@", v2, v3, v4, v5, v6);
}

void sub_100004D54()
{
  sub_1000046EC();
  sub_1000046A4((void *)&_mh_execute_header, v0, v1, "connection invalidated:%@", v2, v3, v4, v5, v6);
}

void sub_100004DC0()
{
  sub_100002258();
  sub_1000046A4((void *)&_mh_execute_header, v0, v1, "liveFSService:delegate:addDisk:connection:error:%@", v2, v3, v4, v5, v6);
}

void sub_100004E28(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100004EA8()
{
  sub_1000046C0();
  sub_1000046D0((void *)&_mh_execute_header, v0, v1, "%s: UVFSServices: %@", v2, v3, v4, v5, 2u);
}

void sub_100004F30()
{
  sub_100002258();
  sub_1000046C0();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "ejecting:unknown:device:%@:%@", v1, 0x16u);
}

void sub_100004FB4()
{
  sub_100004694(__stack_chk_guard);
  int v1 = 136315394;
  uint64_t v2 = "-[VolumeManagerDelegate LiveMountService:ejectDisk:usingFlags:reply:]";
  sub_1000046C0();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s:helper:forcing:failed:%@", (uint8_t *)&v1, 0x16u);
}

void sub_100005038()
{
  sub_100004694(__stack_chk_guard);
  sub_1000046C0();
  sub_1000046D0((void *)&_mh_execute_header, v0, v1, "%s:helper:reply:%@, forcing it", v2, v3, v4, v5, 2u);
}

void sub_1000050B0()
{
  sub_100002258();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "ejected device: %@", v1, 0xCu);
}

void sub_100005124()
{
  sub_100004694(__stack_chk_guard);
  sub_1000046EC();
  sub_1000046A4((void *)&_mh_execute_header, v0, v1, "eject error: %@", v2, v3, v4, v5, v6);
}

void sub_10000518C()
{
  sub_100002258();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "Found %@ device hosting %d volumes", v2, 0x12u);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_main(void)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void err(int a1, const char *a2, ...)
{
}

uint64_t getNSErrorFromLiveFSErrno()
{
  return _getNSErrorFromLiveFSErrno();
}

int getopt(int a1, char *const a2[], const char *a3)
{
  return _getopt(a1, a2, a3);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
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

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_exited(void *a1, const char *a2, ...)
{
  return [a1 exited];
}

id objc_msgSend_helper(void *a1, const char *a2, ...)
{
  return [a1 helper];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_initializationFinished(void *a1, const char *a2, ...)
{
  return [a1 initializationFinished];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return [a1 pid];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return [a1 server];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}