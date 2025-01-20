void sub_100007044(id a1)
{
  uint64_t vars8;

  qword_100189860 = objc_alloc_init(F13Server);

  _objc_release_x1();
}

void sub_1000079E8(uint64_t a1)
{
  v2 = sub_100068600();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_1000C63AC(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  v10 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v10);
  uint64_t v12 = [WeakRetained extension];
  if (!v12) {
    goto LABEL_6;
  }
  v13 = (void *)v12;
  id v14 = objc_loadWeakRetained(v10);
  v15 = [v14 extension];
  v16 = [v15 _plugIn];
  if ([v16 active])
  {

LABEL_6:
    goto LABEL_7;
  }
  id v29 = objc_loadWeakRetained(v10);
  unsigned __int8 v30 = [v29 appInstallationInProgress];

  if ((v30 & 1) == 0)
  {
    v31 = sub_100068600();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
      sub_1000C6374(v31, v32, v33, v34, v35, v36, v37, v38);
    }

    id v39 = objc_loadWeakRetained(v10);
    v40 = [v39 extension];
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_100007C6C;
    v43[3] = &unk_100151AA0;
    objc_copyWeak(&v44, v10);
    [v40 beginExtensionRequestWithInputItems:0 completion:v43];

    objc_destroyWeak(&v44);
    goto LABEL_18;
  }
LABEL_7:
  id v17 = objc_loadWeakRetained(v10);
  unsigned int v18 = [v17 appInstallationInProgress];

  if (v18)
  {
    v19 = sub_100068600();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v42 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "F13Server: Extension not running, but not launching extension because app installation is in progress", v42, 2u);
    }
LABEL_13:

    goto LABEL_18;
  }
  id v20 = objc_loadWeakRetained(v10);
  v21 = [v20 extension];

  if (!v21)
  {
    v19 = sub_100068600();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_1000C633C(v19, v22, v23, v24, v25, v26, v27, v28);
    }
    goto LABEL_13;
  }
LABEL_18:
  id v41 = objc_loadWeakRetained(v10);
  [v41 verifyExtensionIsRunning];
}

void sub_100007C58(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100007C6C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id WeakRetained = sub_100068600();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      id v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, WeakRetained, OS_LOG_TYPE_DEFAULT, "F13Server: Error launching extension: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained setExtensionContextIdentifier:v5];
  }
}

void sub_100007DC4(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) extensionContextIdentifier];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) extension];
    uint64_t v4 = [*(id *)(a1 + 32) extensionContextIdentifier];
    [v3 cancelExtensionRequestWithIdentifier:v4];

    [*(id *)(a1 + 32) setExtensionContextIdentifier:0];
    id v5 = *(void **)(a1 + 32);
    [v5 setExtension:0];
  }
}

void sub_100008438(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_1000088A4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100008924(id a1)
{
  qword_100189870 = objc_alloc_init(MSDAudioController);

  _objc_release_x1();
}

void sub_100008A38(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100008B3C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100008E34(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = [a2 objectForKeyedSubscript:kFigRoutingContextNotificationPayloadKey_RouteConfigUpdateReason];
  if ([v5 isEqualToString:kFigRoutingContextNotificationPayloadValue_ConfigUpdateReasonStarted])
  {
    *a3 = 1;
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

void sub_100009194(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = [a2 objectForKeyedSubscript:kFigRoutingContextNotificationPayloadKey_RouteConfigUpdateReason];
  if (([v5 isEqualToString:kFigRoutingContextNotificationPayloadValue_ConfigUpdateReasonEndedSuccess] & 1) != 0|| objc_msgSend(v5, "isEqualToString:", kFigRoutingContextNotificationPayloadValue_ConfigUpdateReasonEndedFailed))
  {
    *a3 = 1;
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

id sub_100009974(uint64_t a1)
{
  v2 = sub_100068600();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "MSDAudioController: Received notification of available routes changed!", v4, 2u);
  }

  [*(id *)(a1 + 32) lock];
  [*(id *)(a1 + 32) signal];
  return [*(id *)(a1 + 32) unlock];
}

void sub_100009D44(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 userInfo];
  uint64_t v4 = [v3 objectForKeyedSubscript:kFigRoutingContextNotificationPayloadKey_RouteConfigUpdateID];
  id v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MSDAudioController: Route config updated with info: %{public}@", buf, 0xCu);
  }

  if ([*(id *)(a1 + 32) isEqualToString:v4]) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_100009F50(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100009F88(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_100009FB0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10000A30C(id a1)
{
  qword_100189880 = objc_alloc_init(MSDConfigurationProfileManager);

  _objc_release_x1();
}

void sub_10000AC6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000AC84(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  if (v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    id v6 = sub_100068600();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000C6D1C();
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000AED8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000B690(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000B6D0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000B6E0(uint64_t a1)
{
}

void sub_10000B6E8(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 userInfo];
  uint64_t v4 = sub_100068600();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    uint64_t v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received completion notification with info: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  id v5 = [v3 objectForKey:@"Result"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v5 BOOLValue];

  uint64_t v6 = [v3 objectForKey:@"Error"];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  int v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000C968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_10000C98C(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = [v4 setupIntraComponentDependency:*(unsigned char *)(a1 + 48) == 0];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  v19 = v4;
  if (*(void *)(v6 + 40))
  {
    [v4 addInstallDependency:context, v4];
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  objc_storeStrong((id *)(v6 + 40), a2);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v22 objects:v34 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v13 = [v7 objectForKey:v12 context];
        uint64_t v14 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKey:v12];
        if (v14)
        {
          v15 = [v13 firstObject];
          v16 = [v14 lastObject];
          id v17 = sub_100068600();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            v21 = [v15 component];
            id v20 = [v16 component];
            *(_DWORD *)buf = 138413058;
            uint64_t v27 = v15;
            __int16 v28 = 2112;
            id v29 = v21;
            __int16 v30 = 2112;
            v31 = v16;
            __int16 v32 = 2112;
            uint64_t v33 = v20;
            _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Setting up inter-operation dependency: %@(%@) -> %@(%@)", buf, 0x2Au);
          }
          [v15 addDependency:v16];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v22 objects:v34 count:16];
    }
    while (v9);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addEntriesFromDictionary:v7];
}

void sub_10000D838(id a1)
{
  qword_100189890 = objc_alloc_init(MSDS3UploadHandler);

  _objc_release_x1();
}

void sub_10000DB88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000DBAC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000DBBC(uint64_t a1)
{
}

void sub_10000DBC4(uint64_t a1)
{
  v2 = +[NSFileManager defaultManager];
  uint64_t v3 = +[MSDHelperAgent sharedInstance];
  unsigned int v4 = [v3 collectDemoLogsToFolder:*(void *)(a1 + 32)];

  id v5 = sub_100068600();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Collection of logs succeeded, lets upload these logs.", buf, 2u);
    }

    id v7 = objc_alloc_init(MSDS3UploadRequest);
    [(MSDS3UploadRequest *)v7 setS3url:*(void *)(a1 + 40)];
    [(MSDS3UploadRequest *)v7 setLogFilePath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/DekotaLogs.tar.gz"];
    [(MSDS3UploadRequest *)v7 setRetryAttempts:*(void *)(a1 + 72)];
    [(MSDS3UploadRequest *)v7 setHttpHeaders:*(void *)(a1 + 48)];
    id v8 = +[MSDServerRequestHandler sharedInstance];
    id v9 = [v8 handleRequestSync:v7];

    uint64_t v10 = [v9 error];

    v11 = sub_100068600();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        uint64_t v13 = [v9 error];
        id v14 = [v13 code];
        v15 = [v9 error];
        v16 = [v15 localizedDescription];
        *(_DWORD *)buf = 134218242;
        id v25 = v14;
        __int16 v26 = 2114;
        uint64_t v27 = v16;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Log upload failed. Inform hub of error. Error: %ld, Reason: %{public}@", buf, 0x16u);
      }
      uint64_t v17 = [v9 error];
      uint64_t v18 = *(void *)(*(void *)(a1 + 64) + 8);
      v11 = *(NSObject **)(v18 + 40);
      *(void *)(v18 + 40) = v17;
    }
    else if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Log upload completed successfully.", buf, 2u);
    }

    uint64_t v21 = *(void *)(*(void *)(a1 + 64) + 8);
    id obj = *(id *)(v21 + 40);
    [v2 removeItemAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/DekotaLogs.tar.gz" error:&obj];
    objc_storeStrong((id *)(v21 + 40), obj);
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Log collection failed. Inform hub of error.", buf, 2u);
    }

    uint64_t v19 = *(void *)(*(void *)(a1 + 64) + 8);
    id v22 = *(id *)(v19 + 40);
    sub_1000C3140(&v22, 3727744742, @"Failed to upload MobileStoreDemo logs to S3.");
    id v20 = v22;
    id v7 = *(MSDS3UploadRequest **)(v19 + 40);
    *(void *)(v19 + 40) = v20;
  }

  [*(id *)(a1 + 56) setUploadInProgress:0];
  [*(id *)(a1 + 56) demoLogUploadCompleted:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
}

void sub_10000EE5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose((const void *)(v40 - 200), 8);
  _Block_object_dispose((const void *)(v40 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000EEA0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000EEB0(uint64_t a1)
{
}

void sub_10000EEB8(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[4] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(a1[5] + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1[6] + 8) + 40));
}

void sub_10000EF5C(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void sub_10000EFC4(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void sub_10000F02C(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void sub_10000F094(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void sub_10000F4F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_10000F534(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[4] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(a1[5] + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1[6] + 8) + 40));
}

void sub_10000F5D8(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void sub_10000F988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_10000F9B4(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void sub_10000FA1C(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void sub_10000FC88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000FCB0(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void sub_100010034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100010050(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000102CC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = sub_100068600();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000C71DC(v6);
    }

    id v9 = v6;
    goto LABEL_10;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v5 ak_redactedCopy];
    int v14 = 138543362;
    v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Account authentication completed with results: %{public}@", (uint8_t *)&v14, 0xCu);
  }
  if (![*(id *)(a1 + 32) _isAllowListedAccount:*(void *)(a1 + 40) withAuthResults:v5])
  {
    id v9 = +[NSError errorDomainMSDWithCode:3727741044 message:@"Account is not allowed."];
LABEL_10:
    uint64_t v13 = v9;
    id v12 = 0;
    goto LABEL_11;
  }
  uint64_t v11 = +[NSMutableDictionary dictionaryWithDictionary:v5];
  [v11 setObject:*(void *)(a1 + 48) forKeyedSubscript:AKAuthenticationRawPasswordKey];
  id v12 = [v11 copy];

  uint64_t v13 = 0;
LABEL_11:
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void sub_100010764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100010788(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = sub_100068600();
  uint64_t v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Signing in to Apple ID completed!", v15, 2u);
    }
    id v8 = 0;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000C7260();
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v7 = [v5 allValues];
    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v17;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          id v12 = [v11 error];

          if (v12)
          {
            id v8 = [v11 error];
            goto LABEL_17;
          }
        }
        id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
  }
LABEL_17:

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  int v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = 0;
}

void sub_100010CF8(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  if ((char *)[v6 statusCode] - 200 > (char *)0x63)
  {
    id v12 = sub_100068600();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000C7300();
    }

    if (v7)
    {
      id v13 = v7;
    }
    else
    {
      id v13 = +[NSError errorDomainMSDWithCode:3727744512 message:@"Unexpected server response."];
    }
    id v11 = v13;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v8 = v6;
    id v9 = objc_alloc((Class)AAiCloudTermsAgreeRequest);
    uint64_t v10 = [v8 agreeURL];

    id v11 = [v9 initWithURLString:v10 account:*(void *)(a1 + 32)];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100010E84;
    v14[3] = &unk_100151D58;
    id v15 = *(id *)(a1 + 40);
    [v11 performRequestWithHandler:v14];
  }
}

void sub_100010E84(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = (char *)[a3 statusCode] - 200;
  id v8 = sub_100068600();
  id v9 = v8;
  if ((unint64_t)v7 > 0x63)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000C736C();
    }

    if (v6)
    {
      id v10 = v6;
    }
    else
    {
      id v10 = +[NSError errorDomainMSDWithCode:3727744512 message:@"Unexpected server response."];
    }
    id v11 = v10;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Successfully agreed to iCloud terms!", v12, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_1000111DC(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = sub_100068600();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Signing out from Apple ID completed!", v13, 2u);
    }
    id v8 = 0;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000C73D8();
    }

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = [v5 allValues];
    id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          id v12 = [v11 error];

          if (v12)
          {
            id v8 = [v11 error];
            goto LABEL_17;
          }
        }
        id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
  }
LABEL_17:

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001139C(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    id v7 = sub_100068600();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Signing out from Apple ID completed!", v9, 2u);
    }
    id v8 = 0;
  }
  else
  {
    id v8 = v5;
    id v7 = sub_100068600();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000C7444(v8);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001164C(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = sub_100068600();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000C74C8(v5);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100011B38(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = sub_100068600();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "iCloud account features have been successfully updated!", v8, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_1000C75C0(v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100011CF8(uint64_t a1, char a2)
{
  id v4 = sub_100068600();
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "'Find My' service has been successfully enabled!", buf, 2u);
    }

    id v6 = sub_100068600();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Toggling 'Send Last Location'...", buf, 2u);
    }

    id v7 = +[FMDFMIPManager sharedInstance];
    uint64_t v8 = *(unsigned __int8 *)(a1 + 40);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100011E94;
    v10[3] = &unk_100151DF8;
    id v11 = *(id *)(a1 + 32);
    [v7 setLowBatteryLocateEnabled:v8 withCompletion:v10];

    uint64_t v9 = v11;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000C7644();
    }

    uint64_t v9 = +[NSError errorDomainMSDWithCode:3727744768 message:@"An error has occurred."];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_100011E94(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100068600();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000C7678(v3);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "'Send Last Location' has been successfully toggled!", v6, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000122FC(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [a2 objectForKeyedSubscript:AKAuthenticationPasswordKey];
    [v3 aa_setPassword:v4];

    id v5 = [objc_alloc((Class)AAFMIPAuthenticateRequest) initWithAccount:*(void *)(a1 + 32)];
    id v6 = sub_100068600();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Sending AAFMIPAuthenticateRequest...", buf, 2u);
    }

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10001246C;
    v8[3] = &unk_100151E70;
    id v10 = *(id *)(a1 + 48);
    id v9 = *(id *)(a1 + 40);
    [v5 performRequestWithHandler:v8];
  }
  else
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v7();
  }
}

void sub_10001246C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  uint64_t v11 = [v10 fmipWipeToken];
  id v12 = (void *)v11;
  uint64_t v27 = 0;
  __int16 v28 = &v27;
  uint64_t v29 = 0x3032000000;
  __int16 v30 = sub_10000EEA0;
  v31 = sub_10000EEB0;
  id v32 = 0;
  if (v10 && v11)
  {
    id v13 = sub_100068600();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received AAFMIPAuthenticateResponse!", buf, 2u);
    }

    long long v14 = sub_100068600();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Disabling 'Find My' service...", buf, 2u);
    }

    long long v15 = +[NSNotificationCenter defaultCenter];
    uint64_t v16 = AAUIDeviceLocatorStateDidChangeNotification;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100012784;
    v23[3] = &unk_100151E48;
    id v24 = *(id *)(a1 + 32);
    __int16 v26 = &v27;
    id v25 = *(id *)(a1 + 40);
    uint64_t v17 = [v15 addObserverForName:v16 object:0 queue:0 usingBlock:v23];
    long long v18 = (void *)v28[5];
    v28[5] = v17;

    [*(id *)(a1 + 32) disableInContext:2 withWipeToken:v12];
    long long v19 = v24;
  }
  else
  {
    id v20 = sub_100068600();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = [v9 localizedDescription];
      sub_1000C7730(v21, (uint64_t)buf, v20);
    }

    if (v9)
    {
      id v22 = v9;
    }
    else
    {
      id v22 = +[NSError errorDomainMSDWithCode:3727741043 message:@"Failed to authenticate account with server."];
    }
    long long v19 = v22;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }

  _Block_object_dispose(&v27, 8);
}

void sub_100012750(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100012784(uint64_t a1)
{
  v2 = sub_100068600();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v3 = [*(id *)(a1 + 32) isStateKnown];
    unsigned int v4 = [*(id *)(a1 + 32) isChangingState];
    unsigned int v5 = [*(id *)(a1 + 32) isEnabled];
    v11[0] = 67109632;
    v11[1] = v3;
    __int16 v12 = 1024;
    unsigned int v13 = v4;
    __int16 v14 = 1024;
    unsigned int v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "'Find My' service state changed! isStateKnown = %{BOOL}d isChaningState = %{BOOL}d isEnabled = %{BOOL}d", (uint8_t *)v11, 0x14u);
  }

  uint64_t result = (uint64_t)[*(id *)(a1 + 32) isStateKnown];
  if (result)
  {
    uint64_t result = (uint64_t)[*(id *)(a1 + 32) isChangingState];
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)[*(id *)(a1 + 32) isEnabled];
      if ((result & 1) == 0)
      {
        id v7 = sub_100068600();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v11[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "'Find My' service is now disabled.", (uint8_t *)v11, 2u);
        }

        id v8 = +[NSNotificationCenter defaultCenter];
        [v8 removeObserver:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

        uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
        id v10 = *(void **)(v9 + 40);
        *(void *)(v9 + 40) = 0;

        return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
      }
    }
  }
  return result;
}

void sub_10001303C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001306C(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = sub_100068600();
  unsigned int v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000C78D0(v3);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "iCloud keychain has been successfully synced!", v8, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;
}

void sub_100013B98(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = sub_100068600();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"NO";
    if (a2) {
      CFStringRef v7 = @"YES";
    }
    int v8 = 138412546;
    CFStringRef v9 = v7;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Removal of account completed with success: %@, error: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100013D1C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_100014204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001422C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001423C(uint64_t a1)
{
}

uint64_t sub_100014244(uint64_t a1)
{
  v2 = MISProvisioningProfileGetUUID();
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v2];

  return 1;
}

void sub_100014404(id a1)
{
  qword_1001898A0 = objc_alloc_init(MSDAnalytics);

  _objc_release_x1();
}

void sub_100014678(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10001468C(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_100016F78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100016F9C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100016FAC(uint64_t a1)
{
}

void sub_100016FB4(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) stringByAppendingPathComponent:a2];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  int v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isEqualToString:@"/"] & 1) == 0)
  {
    CFStringRef v9 = [*(id *)(a1 + 32) nonContainerizedContentRoots];
    unsigned int v10 = [v9 containsObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

    if (v10)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
}

void sub_100017F8C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_100017FD0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void sub_100017FF0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1000188B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

uint64_t sub_1000188F8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100018908(uint64_t a1)
{
}

void sub_100018910(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (!a2 || v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
    int v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000C8B20(a1, v7);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100018B4C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_10001CB6C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_10001D0C8(id a1)
{
  qword_1001898B0 = objc_alloc_init(MSDAppPrivacyPermissionsHelper);

  _objc_release_x1();
}

void sub_10001E7BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001E7E0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001E7F0(uint64_t a1)
{
}

void sub_10001E7F8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = sub_100068600();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000C97A0((uint64_t)v6, v7);
    }
  }
  else
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v8 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v5);
          }
          uint64_t v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          uint64_t v13 = [v12 name];
          unsigned int v14 = [v13 isEqualToString:@"com.apple.preferences.networkprivacy"];

          if (v14) {
            objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v12);
          }
        }
        id v9 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
    }
    uint64_t v15 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (!v15)
    {
      id v16 = [objc_alloc((Class)NEConfiguration) initWithName:@"com.apple.preferences.networkprivacy" grade:2];
      uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 8);
      long long v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;

      uint64_t v15 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    long long v19 = [v15 pathController];

    if (!v19)
    {
      id v20 = objc_alloc_init((Class)NEPathController);
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setPathController:v20];
    }
    uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) pathController];
    [v7 setEnabled:1];
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void sub_10001EBB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10001EBD4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    uint64_t v4 = sub_100068600();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000C9818(v3, v4);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void sub_10001F5CC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_10001FC88(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002012C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100020568(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id obj)
{
}

void sub_1000206D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002081C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100020914(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10002098C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100020AA8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100020BBC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100020CAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100020DB8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100020FCC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000211E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000225E8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100022838(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100022D84(_Unwind_Exception *a1)
{
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 120));
  _Unwind_Resume(a1);
}

void sub_100022DD8(uint64_t a1)
{
  v2 = sub_100068600();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_1000C9DE4(a1);
  }

  id v3 = +[NSError errorDomainMSDWithCode:3727741186 message:@"Failed to establish xpc connection to demod."];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _hanldeAuthCompletionWithError:v3];
}

void sub_100022E64(uint64_t a1)
{
  v2 = sub_100068600();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_1000C9E6C(a1);
  }

  id v3 = +[NSError errorDomainMSDWithCode:3727741186 message:@"Failed to establish xpc connection to demod."];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _hanldeAuthCompletionWithError:v3];
}

void sub_100022EF0(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _hanldeAuthCompletionWithError:v3];
}

void sub_100022F4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handlePasswordPromptWithFlags:a2 throttleSeconds:a3];
}

void sub_100023240(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_10002325C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _activate];
}

void sub_100023368(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_10002338C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100068600();
  uint64_t v5 = v4;
  if (!v3)
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
LABEL_9:

      goto LABEL_10;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v12 = 138543362;
    id v13 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Handler successfully activated!", (uint8_t *)&v12, 0xCu);
LABEL_8:

    goto LABEL_9;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1000C9EF4(a1, v3);
  }

  id v6 = (id *)(a1 + 32);
  id v7 = objc_loadWeakRetained(v6);
  id v8 = [v7 completionHandler];

  if (v8)
  {
    id v9 = [v3 localizedDescription];
    uint64_t v5 = +[NSError errorDomainMSDWithCode:3727741107 message:@"Cannot authenticate demo peer." reason:v9];

    id WeakRetained = objc_loadWeakRetained(v6);
    uint64_t v11 = [WeakRetained completionHandler];
    ((void (**)(void, NSObject *))v11)[2](v11, v5);

    goto LABEL_8;
  }
LABEL_10:
}

void sub_100023934(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_100023950(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _fetchPairingSecretFromServer];
}

void sub_100023B50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100023B8C(id *a1, void *a2)
{
  id v3 = a2;
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  uint64_t v5 = [WeakRetained queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100023C70;
  v7[3] = &unk_100152040;
  objc_copyWeak(&v9, a1);
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
}

void sub_100023C70(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleKVStoreResponse:*(void *)(a1 + 32)];
}

void sub_100023FF4(id a1)
{
  qword_1001898C0 = objc_alloc_init(MSDSessionMetrics);

  _objc_release_x1();
}

void sub_100024204(uint64_t a1)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v2 = [[*(id *)(a1 + 32) transactionMetrics];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v7 resourceFetchType] != (id)3)
        {
          id v8 = [[MSDSessionTransactionData alloc] initWithData:v7];
          [*(id *)(a1 + 40) saveToFile:v8];
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

void sub_1000245AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100026FA8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_100027238(id a1)
{
  qword_1001898D0 = objc_alloc_init(MSDPreferencesFile);

  _objc_release_x1();
}

void sub_1000273D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1000274A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000276B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100027778(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100027838(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100027C8C(id a1)
{
  v1 = [@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata" stringByAppendingPathComponent:@"com.apple.MobileStoreDemo"];
  id v4 = [v1 stringByAppendingPathExtension:@"plist"];

  uint64_t v2 = +[NSURL fileURLWithPath:v4 isDirectory:0];
  id v3 = (void *)qword_1001898E0;
  qword_1001898E0 = v2;
}

void sub_100027DD0(id a1)
{
  v1 = objc_alloc_init(MSDTestInterface);
  uint64_t v2 = (void *)qword_1001898F0;
  qword_1001898F0 = (uint64_t)v1;

  id v3 = (void *)qword_1001898F0;

  [v3 start];
}

id sub_1000280C0(uint64_t a1)
{
  return [*(id *)(a1 + 32) pushTestLog:*(void *)(a1 + 40)];
}

void sub_100028474(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 userInfo];
  [v2 sendTestEvents:v3];
}

void sub_10002922C(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v8 = [v4 groupContainerPaths];
  id v7 = [v5 path];

  [v8 setObject:v7 forKey:v6];
}

void sub_1000292C0(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v8 = [v4 groupContainerPaths];
  id v7 = [v5 path];

  [v8 setObject:v7 forKey:v6];
}

void sub_100029990(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_100068600();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Clearing app data container: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) _createUninstallOperationForContainer:v5 ofType:@"AppData" containerPath:v6 isContainerized:1];
}

void sub_100029A74(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_100068600();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Clearing plugin data container: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) _createUninstallOperationForContainer:v5 ofType:@"ExtensionData" containerPath:v6 isContainerized:1];
}

void sub_100029B58(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_100068600();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Clearing group data container: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) _createUninstallOperationForContainer:v5 ofType:@"GroupData" containerPath:v6 isContainerized:1];
}

void sub_10002A99C(id a1)
{
  qword_100189908 = objc_alloc_init(MSDDemoPeerCommander);

  _objc_release_x1();
}

void sub_10002AC34(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002AEA4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002AF8C;
  block[3] = &unk_100152388;
  id v12 = v6;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v8;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v7, block);
}

void sub_10002AF8C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = [v2 localizedDescription];
    id v11 = +[NSError errorDomainMSDWithCode:3727741108 message:@"Cannot communicate with demo peer." reason:v3];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v4 = [*(id *)(a1 + 40) payload];
    id v5 = [v4 objectForKeyedSubscript:@"Result"];

    if (v5 && [v5 BOOLValue])
    {
      id v6 = [*(id *)(a1 + 40) payload];
      id v7 = [v6 mutableCopy];

      [v7 removeObjectForKey:@"Result"];
      [v7 removeObjectForKey:@"Reason"];
      uint64_t v8 = *(void *)(a1 + 48);
      id v9 = +[NSDictionary dictionaryWithDictionary:v7];
      (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v9, 0);

      id v11 = 0;
    }
    else
    {
      id v10 = [*(id *)(a1 + 40) payload];
      id v7 = [v10 objectForKeyedSubscript:@"Reason"];

      if (v7) {
        +[NSError errorDomainMSDWithCode:3727741109 message:@"Cannot execute command on demo peer." reason:v7];
      }
      else {
      id v11 = +[NSError errorDomainMSDWithCode:3727741109 message:@"Cannot execute command on demo peer."];
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

void sub_10002BB7C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 96));
  _Unwind_Resume(a1);
}

void sub_10002BBC4(uint64_t a1)
{
  uint64_t v2 = sub_100068600();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_1000CA750();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setXpcConnection:0];
}

void sub_10002BC24(uint64_t a1)
{
  uint64_t v2 = sub_100068600();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_1000CA784();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setXpcConnection:0];
}

void sub_10002BC84(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained xpcConnection];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) discoveredPeers];
    id v6 = [v5 allValues];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        id v11 = 0;
        do
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v11);
          id v13 = objc_loadWeakRetained(v2);
          id v14 = [v13 xpcConnection:v16];
          uint64_t v15 = [v14 remoteObjectProxy];
          [v15 providerDidDiscoverNewPeer:v12];

          id v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }
  }
}

void sub_10002C120(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100068600();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = [v3 localizedDescription];
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "MSDDemoPeerCommander: Pairing completed with peer: %{public}@ error: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  id v7 = [*(id *)(a1 + 40) pairingHandlers];
  [v7 removeObjectForKey:*(void *)(a1 + 48)];
}

uint64_t sub_10002C314(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10002C41C(uint64_t a1, void *a2, void *a3)
{
  id v21 = a2;
  id v5 = a3;
  id v6 = v5;
  if (!v5)
  {
    id v7 = [*(id *)(a1 + 32) discoveredPeers];
    int v8 = [v7 objectForKey:*(void *)(a1 + 40)];

    if (v8)
    {
      uint64_t v9 = [v21 objectForKeyedSubscript:@"DeviceInfo"];
      __int16 v10 = v9;
      if (v9)
      {
        id v11 = [v9 objectForKeyedSubscript:kMSDKPeerDemoDevicePropertyDeviceName];
        if (v11)
        {
          uint64_t v12 = [v8 deviceName];
          unsigned __int8 v13 = [v11 isEqualToString:v12];

          if ((v13 & 1) == 0)
          {
            id v14 = +[MSDDemoPeerPairingManager sharedInstance];
            [v14 updateDeviceNameForPairedPeerOfUUID:*(void *)(a1 + 40) withNewName:v11];
          }
        }
        uint64_t v15 = [v21 objectForKeyedSubscript:@"ProtocolVersion"];
        if (v15) {
          long long v16 = (_UNKNOWN **)v15;
        }
        else {
          long long v16 = &off_100162000;
        }
        id v17 = [v10 mutableCopy];
        [v17 setObject:v16 forKey:@"ProtocolVersion"];
        [v8 refreshDevicePropertiesUsingProperties:v17];
        long long v18 = [*(id *)(a1 + 32) xpcConnection];

        if (v18)
        {
          long long v19 = [*(id *)(a1 + 32) xpcConnection];
          id v20 = [v19 remoteObjectProxy];
          [v20 providerDidUpdateDeviceInfoOnPeerOfID:*(void *)(a1 + 40) withNewProperties:v17];
        }
        id v6 = 0;
      }
      else
      {
        id v6 = +[NSError errorDomainMSDWithCode:3727741109 message:@"Cannot execute command on demo peer."];
      }
    }
    else
    {
      id v6 = +[NSError errorDomainMSDWithCode:3727741104 message:@"Cannot find specified demo peer."];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t sub_10002C844(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10002C9C4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10002CAB8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10002CC7C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10002CE88(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10002D050(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
    id v8 = 0;
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v23 = a1;
    __int16 v10 = [a2 objectForKeyedSubscript:@"AppArchiveList"];
    id v11 = +[NSMutableArray arrayWithCapacity:0];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v12 = v10;
    id v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v13)
    {
      id v14 = v13;
      id v8 = 0;
      uint64_t v15 = *(void *)v26;
LABEL_5:
      long long v16 = 0;
      id v17 = v8;
      while (1)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v18 = *(void *)(*((void *)&v25 + 1) + 8 * (void)v16);
        uint64_t v19 = objc_opt_class();
        id v24 = v17;
        id v20 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v19 fromData:v18 error:&v24];
        id v8 = v24;

        if (!v20) {
          break;
        }
        [v11 addObject:v20];

        long long v16 = (char *)v16 + 1;
        id v17 = v8;
        if (v14 == v16)
        {
          id v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
          if (v14) {
            goto LABEL_5;
          }
          goto LABEL_17;
        }
      }
      id v21 = sub_100068600();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_1000CA7B8();
      }

      long long v22 = [v8 localizedDescription];
      id v7 = +[NSError errorDomainMSDWithCode:3727741108 message:@"Cannot communicate with demo peer." reason:v22];

      a1 = v23;
      id v6 = 0;
      if (v7)
      {
        uint64_t v9 = 0;
        goto LABEL_19;
      }
    }
    else
    {
      id v8 = 0;
LABEL_17:

      a1 = v23;
      id v6 = 0;
    }
    uint64_t v9 = +[NSArray arrayWithArray:v11];
    id v7 = 0;
LABEL_19:
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10002D474(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10002D620(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10002D714(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
    id v8 = 0;
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v23 = a1;
    __int16 v10 = [a2 objectForKeyedSubscript:@"EnvArchiveList"];
    id v11 = +[NSMutableArray arrayWithCapacity:0];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v12 = v10;
    id v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v13)
    {
      id v14 = v13;
      id v8 = 0;
      uint64_t v15 = *(void *)v26;
LABEL_5:
      long long v16 = 0;
      id v17 = v8;
      while (1)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v18 = *(void *)(*((void *)&v25 + 1) + 8 * (void)v16);
        uint64_t v19 = objc_opt_class();
        id v24 = v17;
        id v20 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v19 fromData:v18 error:&v24];
        id v8 = v24;

        if (!v20) {
          break;
        }
        [v11 addObject:v20];

        long long v16 = (char *)v16 + 1;
        id v17 = v8;
        if (v14 == v16)
        {
          id v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
          if (v14) {
            goto LABEL_5;
          }
          goto LABEL_17;
        }
      }
      id v21 = sub_100068600();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_1000CA840();
      }

      long long v22 = [v8 localizedDescription];
      id v7 = +[NSError errorDomainMSDWithCode:3727741108 message:@"Cannot communicate with demo peer." reason:v22];

      a1 = v23;
      id v6 = 0;
      if (v7)
      {
        uint64_t v9 = 0;
        goto LABEL_19;
      }
    }
    else
    {
      id v8 = 0;
LABEL_17:

      a1 = v23;
      id v6 = 0;
    }
    uint64_t v9 = +[NSArray arrayWithArray:v11];
    id v7 = 0;
LABEL_19:
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10002DAF8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10002DD08(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10002DDFC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10002DEF0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
    id v8 = 0;
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v23 = a1;
    __int16 v10 = [a2 objectForKeyedSubscript:@"TestScriptArchiveList"];
    id v11 = +[NSMutableArray arrayWithCapacity:0];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v12 = v10;
    id v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v13)
    {
      id v14 = v13;
      id v8 = 0;
      uint64_t v15 = *(void *)v26;
LABEL_5:
      long long v16 = 0;
      id v17 = v8;
      while (1)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v18 = *(void *)(*((void *)&v25 + 1) + 8 * (void)v16);
        uint64_t v19 = objc_opt_class();
        id v24 = v17;
        id v20 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v19 fromData:v18 error:&v24];
        id v8 = v24;

        if (!v20) {
          break;
        }
        [v11 addObject:v20];

        long long v16 = (char *)v16 + 1;
        id v17 = v8;
        if (v14 == v16)
        {
          id v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
          if (v14) {
            goto LABEL_5;
          }
          goto LABEL_17;
        }
      }
      id v21 = sub_100068600();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_1000CA8C8(v8);
      }

      long long v22 = [v8 localizedDescription];
      id v7 = +[NSError errorDomainMSDWithCode:3727741108 message:@"Cannot communicate with demo peer." reason:v22];

      a1 = v23;
      id v6 = 0;
      if (v7)
      {
        uint64_t v9 = 0;
        goto LABEL_19;
      }
    }
    else
    {
      id v8 = 0;
LABEL_17:

      a1 = v23;
      id v6 = 0;
    }
    uint64_t v9 = +[NSArray arrayWithArray:v11];
    id v7 = 0;
LABEL_19:
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10002E34C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10002E440(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
    id v8 = 0;
    uint64_t v9 = 0;
  }
  else
  {
    __int16 v10 = [a2 objectForKeyedSubscript:@"GKResultsArchive"];
    id v13 = 0;
    uint64_t v9 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v10 error:&v13];
    id v8 = v13;
    id v7 = 0;
    if (!v9)
    {
      id v11 = sub_100068600();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1000CA94C(v8);
      }

      id v12 = [v8 localizedDescription];
      id v7 = +[NSError errorDomainMSDWithCode:3727741108 message:@"Cannot communicate with demo peer." reason:v12];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10002E680(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
    id v8 = 0;
    uint64_t v9 = 0;
  }
  else
  {
    __int16 v10 = [a2 objectForKeyedSubscript:@"GKMetricsArchive"];
    id v13 = 0;
    uint64_t v9 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v10 error:&v13];
    id v8 = v13;
    id v7 = 0;
    if (!v9)
    {
      id v11 = sub_100068600();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1000CA9D0(v8);
      }

      id v12 = [v8 localizedDescription];
      id v7 = +[NSError errorDomainMSDWithCode:3727741108 message:@"Cannot communicate with demo peer." reason:v12];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10002E8C0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    uint64_t v10 = [a2 objectForKeyedSubscript:@"LSMeasurementsData"];
    if (v10)
    {
      uint64_t v9 = (void *)v10;
      id v8 = 0;
      goto LABEL_6;
    }
    id v11 = sub_100068600();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000CAA54();
    }

    id v7 = +[NSError errorDomainMSDWithCode:3727741108 message:@"Cannot communicate with demo peer."];
  }
  id v8 = v7;
  uint64_t v9 = 0;
LABEL_6:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10002EA7C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 objectForKeyedSubscript:@"HSCoachingSuggestion"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10002EBE8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
    id v8 = 0;
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v10 = [a2 objectForKeyedSubscript:@"IPDStatusArchive"];
    id v13 = 0;
    uint64_t v9 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v10 error:&v13];
    id v8 = v13;
    id v7 = 0;
    if (!v9)
    {
      id v11 = sub_100068600();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1000CAA88(v8);
      }

      id v12 = [v8 localizedDescription];
      id v7 = +[NSError errorDomainMSDWithCode:3727741108 message:@"Cannot communicate with demo peer." reason:v12];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10002EE28(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10002F010(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
    id v8 = &off_100162F98;
  }
  else
  {
    uint64_t v9 = [a2 objectForKeyedSubscript:@"FinalIPD"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v8 = v9;
      id v7 = 0;
    }
    else
    {
      uint64_t v10 = sub_100068600();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1000CAB0C();
      }

      id v7 = +[NSError errorDomainMSDWithCode:3727741108 message:@"Cannot communicate with demo peer."];
      id v8 = &off_100162F98;
    }
  }
  uint64_t v11 = *(void *)(a1 + 32);
  [v8 doubleValue];
  (*(void (**)(uint64_t, id))(v11 + 16))(v11, v7);
}

void sub_10002F214(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
    id v8 = &off_100162018;
  }
  else
  {
    uint64_t v9 = [a2 objectForKeyedSubscript:@"IPDResetStage"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v8 = v9;
      id v7 = 0;
    }
    else
    {
      uint64_t v10 = sub_100068600();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1000CAB40();
      }

      id v7 = +[NSError errorDomainMSDWithCode:3727741108 message:@"Cannot communicate with demo peer."];
      id v8 = &off_100162018;
    }
  }
  (*(void (**)(void, id, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v8 unsignedIntegerValue], v7);
}

void sub_10002F41C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
    id v8 = 0;
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v10 = [a2 objectForKeyedSubscript:@"AXSettingsArchive"];
    id v13 = 0;
    uint64_t v9 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v10 error:&v13];
    id v8 = v13;
    id v7 = 0;
    if (!v9)
    {
      uint64_t v11 = sub_100068600();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1000CAB74(v8);
      }

      id v12 = [v8 localizedDescription];
      id v7 = +[NSError errorDomainMSDWithCode:3727741108 message:@"Cannot communicate with demo peer." reason:v12];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10002F77C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10002F870(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10002FC58(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10002FD38(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10002FDFC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) identifier];
  id v3 = [*(id *)(a1 + 40) nearbyObjects];
  id v4 = [v3 objectForKey:v2];

  if (!v4)
  {
    id v5 = [*(id *)(a1 + 40) nearbyObjects];
    [v5 setObject:*(void *)(a1 + 32) forKey:v2];
  }
  id v6 = [*(id *)(a1 + 40) discoveredPeers];
  id v7 = [v6 objectForKey:v2];

  if (v7)
  {
    id v8 = [*(id *)(a1 + 32) isInBubble];
    uint64_t v9 = sub_100068600();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v7;
      __int16 v19 = 1024;
      int v20 = (int)v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "MSDDemoPeerCommander: Peer '%{public}@' is in bubble: %{BOOL}d", buf, 0x12u);
    }

    [v7 setIsInBubble:v8];
    uint64_t v10 = [*(id *)(a1 + 40) xpcConnection];

    if (v10)
    {
      uint64_t v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v8, kMSDKPeerDemoDevicePropertyIsInBubble);
      long long v16 = v11;
      id v12 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];

      id v13 = [*(id *)(a1 + 40) xpcConnection];
      id v14 = [v13 remoteObjectProxy];
      [v14 providerDidUpdateDeviceInfoOnPeerOfID:v2 withNewProperties:v12];
    }
  }
}

void sub_1000300B0(uint64_t a1)
{
  id v2 = [objc_alloc((Class)MSDKPeerDemoDevice) initWithMSDRapportDevice:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) _handleDiscoveryOfNewPeer:v2];
}

void sub_1000301C4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) discoveredPeers];
  id v3 = [*(id *)(a1 + 40) identifier];
  id v5 = [v2 objectForKey:v3];

  id v4 = v5;
  if (v5)
  {
    [*(id *)(a1 + 32) _handleLossOfExistingPeer:v5];
    id v4 = v5;
  }
}

void sub_10003030C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) discoveredPeers];
  id v3 = [*(id *)(a1 + 40) identifier];
  id v5 = [v2 objectForKey:v3];

  id v4 = v5;
  if (v5)
  {
    [*(id *)(a1 + 32) _handleUpdateOfExistingPeer:v5];
    id v4 = v5;
  }
}

void sub_10003054C(id *a1)
{
  id v2 = sub_100068600();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a1[4];
    id v4 = a1[5];
    int v10 = 138543618;
    id v11 = v3;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "MSDDemoPeerCommander: Received event message: %{public}@ from device: %{public}@", (uint8_t *)&v10, 0x16u);
  }

  id v5 = [a1[6] discoveredPeers];
  id v6 = [a1[5] identifier];
  id v7 = [v5 objectForKey:v6];

  if (v7)
  {
    id v8 = [a1[4] identifier];
    unsigned int v9 = [v8 isEqualToString:@"com.apple.MobileStoreDemo.UpdateDeviceInfo"];

    if (v9) {
      [a1[6] _handleUpdateDeviceEventMessage:a1[4] fromPeer:v7];
    }
  }
}

void sub_100030828(id a1)
{
  qword_100189910 = objc_alloc_init(MSDPairedWatchProxy);

  _objc_release_x1();
}

void sub_10003099C(id a1, PSYSyncSession *a2, NSSet *a3, NSError *a4)
{
  id v4 = a4;
  if (v4)
  {
    id v5 = sub_100068600();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000CAD00(v4, v5);
    }
  }
}

void sub_1000316FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_10003171C(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100031840(id a1)
{
  qword_100189920 = objc_alloc_init(MSDBluetoothHelper);

  _objc_release_x1();
}

void sub_100032610(id a1)
{
  qword_100189930 = objc_alloc_init(MSDPushNotificationHandler);

  _objc_release_x1();
}

void sub_100033658(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10003369C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000336AC(uint64_t a1)
{
}

void sub_1000336B4(uint64_t a1, void *a2, const char *a3, unsigned char *a4)
{
  id v7 = a2;
  unsigned int v9 = +[MSDSignedManifest getComponentFromPath:v7 forManifestVersion:*(void *)(a1 + 32)];
  int v10 = sub_100068600();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v48 = a3;
    __int16 v49 = 2114;
    v50 = v7;
    __int16 v51 = 2114;
    v52 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%lu] Building component for signed manifest item: %{public}@(%{public}@)", buf, 0x20u);
  }

  if (!v9)
  {
    uint64_t v23 = 0;
    id v11 = 0;
    goto LABEL_53;
  }
  if (![*(id *)(a1 + 40) getComponentProgressStatus:v9])
  {
    uint64_t v15 = [*(id *)(a1 + 48) signedManifest];
    unsigned int v16 = [v15 isItemBackup:v7];

    id v17 = [*(id *)(a1 + 48) signedManifest];
    uint64_t v18 = v17;
    if (v16)
    {
      unsigned int v19 = [v17 isItemDeviceSettings:v9];

      if (v19)
      {
        int v20 = sub_100068600();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v48 = "-[MSDComponentBuilder buildComponentsFromManifest]_block_invoke";
          __int16 v49 = 2114;
          v50 = v9;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s - building settings dict for component %{public}@", buf, 0x16u);
        }

        uint64_t v21 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) buildSettingsOperationWithIdentifier:v9];
      }
      else
      {
        uint64_t v21 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) buildBackupOperationsWithPath:v7 andIndex:a3];
      }
    }
    else
    {
      unsigned int v22 = [v17 isItemSystemAppData:v7];

      if (v22)
      {
        uint64_t v21 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) buildSystemAppOperationsWithIdentifier:v9];
      }
      else
      {
        uint64_t v37 = [*(id *)(a1 + 48) signedManifest];
        unsigned int v38 = [v37 isItemApp:v7];

        if (v38)
        {
          id v39 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
          uint64_t v40 = [*(id *)(a1 + 48) appItemToDefer];
          id v11 = [v39 buildAppOperationsWithIdentifier:v9 shouldDeferApp:[v40 isEqualToString:v9]];

          if (([*(id *)(a1 + 48) forBackgroundDownload] & 1) == 0
            && [*(id *)(a1 + 56) containsObject:v9]
            && ([v9 isEqualToString:@"com.apple.ist.windward"] & 1) == 0
            && ([v9 isEqualToString:@"com.apple.ist.DemoDiscoveryApp"] & 1) == 0
            && ([v9 isEqualToString:@"com.apple.ist.demoloop"] & 1) == 0
            && ([v9 isEqualToString:@"com.apple.ist.DigitalSignage.iOS"] & 1) == 0
            && ([v9 isEqualToString:@"com.apple.ist.dast"] & 1) == 0)
          {
            id v41 = sub_100068600();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v48 = v9;
              _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Building remove operations for app: %{public}@", buf, 0xCu);
            }

            uint64_t v23 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) buildAppRemovalOperationsWithIdentifier:v9];
            if (!v23) {
              goto LABEL_53;
            }
            goto LABEL_18;
          }
LABEL_17:
          uint64_t v23 = 0;
LABEL_18:
          if (v11)
          {
            id v24 = [[MSDComponent alloc] initWithName:v9 andOperations:v11];
            if (v24)
            {
              long long v25 = v24;
              if (v23) {
                [(MSDComponent *)v24 addRemoveOperations:v23];
              }
              uint64_t v26 = [*(id *)(a1 + 48) appItemToDefer];
              if (v26)
              {
                long long v27 = (void *)v26;
                long long v28 = [*(id *)(a1 + 48) appItemToDefer];
                if ([v28 isEqualToString:v9])
                {
                  [*(id *)(a1 + 48) signedManifest];
                  uint64_t v29 = v23;
                  v31 = __int16 v30 = v8;
                  unsigned int v46 = [v31 isItemApp:v7];

                  id v8 = v30;
                  uint64_t v23 = v29;

                  if (v46)
                  {
                    id v32 = sub_100068600();
                    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Deferring the update of app item as requested.", buf, 2u);
                    }

                    uint64_t v33 = *(void *)(*(void *)(a1 + 72) + 8);
                    uint64_t v34 = *(void **)(v33 + 40);
                    *(void *)(v33 + 40) = v25;
                    uint64_t v35 = v25;

LABEL_32:
                    goto LABEL_33;
                  }
                }
                else
                {
                }
              }
              uint64_t v36 = sub_100068600();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v48 = (const char *)v25;
                _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Component built successfully: %{public}@", buf, 0xCu);
              }

              [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) addObject:v25];
              goto LABEL_32;
            }
          }
LABEL_53:
          v45 = sub_100068600();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
            sub_1000CB330(v45);
          }

          *a4 = 1;
          *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
          goto LABEL_32;
        }
        v42 = [*(id *)(a1 + 48) signedManifest];
        unsigned int v43 = [v42 isItemConfigurationProfile:v7];

        id v11 = sub_100068600();
        BOOL v44 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
        if (!v43)
        {
          if (!v44) {
            goto LABEL_33;
          }
          *(_WORD *)buf = 0;
          __int16 v12 = "Ignore unrecognized item in signed manifest.";
          id v13 = v11;
          uint32_t v14 = 2;
          goto LABEL_7;
        }
        if (v44)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Building config profile operation.", buf, 2u);
        }

        uint64_t v21 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) buildConfigurationProfileOperationsWithIdentifier:v9];
      }
    }
    id v11 = v21;
    goto LABEL_17;
  }
  id v11 = sub_100068600();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v48 = v9;
    __int16 v12 = "Skip already processed component: %{public}@";
    id v13 = v11;
    uint32_t v14 = 12;
LABEL_7:
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
  }
LABEL_33:
}

uint64_t sub_100034084()
{
  v0 = +[MSDLocalMessageResponder sharedInstance];
  [v0 start];

  id v1 = +[MSDTestInterface sharedInstance];
  return 0;
}

uint64_t sub_1000340D4()
{
  v0 = +[MSDLocalEventStreamHandler sharedInstance];
  [v0 start];

  return 0;
}

uint64_t sub_100034110()
{
  v0 = +[MSDMailProcessor sharedInstance];
  [v0 start];

  return 0;
}

uint64_t start(uint64_t a1, void **a2)
{
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x2020000000;
  int v62 = 0;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = sub_1000347F4;
  v57 = sub_100034804;
  id v58 = 0;
  id v3 = +[MSDTargetDevice sharedInstance];
  uint64_t v4 = +[MSDHelperAgent sharedInstance];
  v42 = +[MSDProgressUpdater sharedInstance];
  id v5 = objc_alloc_init(MSDLegacyMigrationHelper);
  unsigned int v6 = [v3 isVerifiedDemoDevice];
  unsigned int v7 = [v3 isOfflineMode];
  unsigned __int8 v8 = [v3 dcotaOfflineModeDevice];
  unsigned int v9 = [v3 isVerifiedPOSDevice];
  unsigned int v10 = [v3 isBetterTogetherDemo];
  unsigned __int8 v41 = v8;
  id v11 = (void *)v4;
  __int16 v12 = sub_100068600();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = *a2;
    *(_DWORD *)buf = 136446210;
    v64 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}s started", buf, 0xCu);
  }

  uint32_t v14 = sub_100068600();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = [(MSDLegacyMigrationHelper *)v5 osVersionStr];
    *(_DWORD *)buf = 138543362;
    v64 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "OS version: %{public}@", buf, 0xCu);
  }
  unsigned int v16 = sub_100068600();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = [v3 demodVersion];
    *(_DWORD *)buf = 138543362;
    v64 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "demod version: %{public}@", buf, 0xCu);
  }
  uint64_t v18 = sub_100068600();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v19 = [v3 packageVersion];
    *(_DWORD *)buf = 138543362;
    v64 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Package version: %{public}@", buf, 0xCu);
  }
  if ([(MSDLegacyMigrationHelper *)v5 doPreSkyMigration]) {
    [v3 clearUpNvramIfNeeded];
  }
  if ((v6 | v9) == 1)
  {
    [v3 setupWorkFolderForBootTask];
    if ([(MSDLegacyMigrationHelper *)v5 doPreSkyMigration])
    {
      [v3 migrateDemoDeviceToDemoVolume];
      [v3 clearUpF200FootprintIfNeeded];
    }
    [v3 createMobileStoreDemoCache];
  }
  else if (v7)
  {
    [v3 setupFactoryDemoDeviceMetadataFolder];
  }
  unsigned int v20 = [v3 mode];
  *((_DWORD *)v60 + 6) = v20;
  if (v20 - 1 <= 8)
  {
    uint64_t v21 = os_transaction_create();
    unsigned int v22 = (void *)v54[5];
    v54[5] = v21;
  }
  if (v6)
  {
    if ([(MSDLegacyMigrationHelper *)v5 doPreSkyMigration]) {
      +[MSDBundleProgressTracker migratePreferencesFromLegacyDevicesIfNeeded];
    }
    if ([(MSDLegacyMigrationHelper *)v5 doPreSydneyMigration])
    {
      [v3 cleanUpPreferencesFile];
      if (([v3 migrateCellularSupportFlag] & 1) == 0)
      {
        uint64_t v23 = sub_100068600();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          sub_1000CB3B8(v23);
        }
      }
    }
    [v42 loadBundles];
  }
  id v24 = +[MSDKeychainManager sharedInstance];
  long long v25 = [v24 getItemForKey:@"com.apple.mobilestoredemo.keychainItemID"];
  BOOL v26 = v25 != 0;

  if (v26)
  {
    long long v27 = +[MSDCryptoHandler sharedInstance];
    [v27 createSecretKeyIfNeeded];

    if (v10)
    {
      long long v28 = +[MSDPairedWatchProxy sharedInstance];
      [v28 bootstrap];
    }
    uint64_t v29 = +[MSDDemoPeerPairingManager sharedInstance];
    [v29 restorePairedPeersDataIfNeeded];

    __int16 v30 = +[MSDTestPreferences sharedInstance];
    unsigned int v31 = [v30 enablePeerDemoService];

    if (v31)
    {
      id v32 = +[MSDDemoPeerResponder sharedInstance];
      [v32 start];
    }
  }
  if (v6) {
    [(MSDLegacyMigrationHelper *)v5 saveOSVerionAfterMigration];
  }
  uint64_t v33 = +[MSDWorkQueueSet sharedInstance];
  uint64_t v34 = [v33 demoUpdateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003480C;
  block[3] = &unk_1001525D0;
  id v35 = v3;
  id v44 = v35;
  unsigned int v46 = &v59;
  BOOL v48 = v26;
  char v49 = v9;
  id v36 = v11;
  id v45 = v36;
  v47 = &v53;
  unsigned __int8 v50 = v41;
  char v51 = v6;
  char v52 = v7;
  dispatch_async(v34, block);

  id v37 = +[F13Server sharedInstance];
  unsigned int v38 = sub_100068600();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Starting the xpc and mail services as soon as device boot up.", buf, 2u);
  }

  sub_100034110();
  sub_100034084();
  sub_1000340D4();
  id v39 = +[NSRunLoop currentRunLoop];
  [v39 run];

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v59, 8);
  return 0;
}

void sub_100034780(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t sub_1000347F4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100034804(uint64_t a1)
{
}

void sub_10003480C(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) allowSnapshotMode];
  id v3 = +[MSDDemoUpdateStatusHub sharedInstance];
  uint64_t v4 = +[MSDDemoUpdateController sharedInstance];
  id v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v92 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "DeviceMode = %d. Checking startup tasks...", buf, 8u);
  }
  v86 = (void *)v4;

  if (*(unsigned char *)(a1 + 64))
  {
    unsigned int v7 = +[MSDLanguageAndRegionManager sharedInstance];
    [v7 restoreDeviceLanguageAndRegionIfNeeded];

    unsigned __int8 v8 = +[MSDBluetoothHelper sharedInstance];
    [v8 restoreBTPairingRecordIfNeeded];

    [*(id *)(a1 + 32) configureNetworkInterface];
    [*(id *)(a1 + 32) waitForNetworkReachability];
    unsigned int v9 = +[MSDS3UploadHandler sharedInstance];
    [v9 uploadDemoLogsIfNeeded];

    [*(id *)(a1 + 32) registerCAHearbeatActivity];
    [*(id *)(a1 + 32) configureGreyMatterAutoUpdate];
  }
  unsigned int v10 = +[MSDUIHelper sharedInstance];
  [v3 registerDemoUpdateStatusDelegate:v10];

  id v11 = +[MSDProgressUpdater sharedInstance];
  [v3 registerDemoUpdateStatusDelegate:v11];

  __int16 v12 = [*(id *)(a1 + 32) getSavedRequest];
  unsigned int v13 = [*(id *)(a1 + 32) getSavedFlag];
  int v14 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v14 == 4)
  {
    uint64_t v15 = +[MSDProgressUpdater sharedInstance];
    [v15 updateStage:201];

    int v14 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  if (v14 != 2 && v14 != 4)
  {
    if (v14 != 7) {
      goto LABEL_18;
    }
    uint64_t v21 = +[MSDOSUpdaterController sharedInstance];
    unsigned __int8 v22 = [v21 isOSUpdateInProgress];

    if (v22) {
      goto LABEL_18;
    }
  }
  id v17 = [*(id *)(a1 + 32) getSavedCompleteByInterval];
  uint64_t v18 = +[MSDDemoUpdateTimeKeeper sharedInstance];
  unsigned int v19 = [v18 setCompletionTime:v17 reserveTimeForCleanup:1];

  if (!v19)
  {
LABEL_18:
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
      || (int v23 = *(unsigned __int8 *)(a1 + 65), *(unsigned char *)(a1 + 65)))
    {
      [*(id *)(a1 + 32) holdPowerAssertion];
      int v23 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    }
    if (v23 == 5) {
      unsigned int v24 = 0;
    }
    else {
      unsigned int v24 = v2;
    }
    if (v24 == 1) {
      [*(id *)(a1 + 32) manageDeviceSnapshot:@"DeleteSnapshot"];
    }
    if ([*(id *)(a1 + 32) snapshotRevertFlagged])
    {
      [*(id *)(a1 + 32) resetSystemTimeCache];
      long long v25 = +[MSDAccountManager sharedInstance];
      [v25 forceiCloudKeychainToSyncWithServer];

      +[MSDGreyMatterHelper restorePrivateAccessTokens];
      [*(id *)(a1 + 32) saveSnapshotRevertFlagged:0];
    }
    switch(*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      case 0:
        unsigned int v31 = [*(id *)(a1 + 32) cachedBundleInstallState];
        unsigned int v32 = [v31 isEqualToString:@"cachedBundleInstallWaitMigration"];

        if (v32)
        {
          uint64_t v33 = os_transaction_create();
          uint64_t v34 = *(void *)(*(void *)(a1 + 56) + 8);
          id v35 = *(void **)(v34 + 40);
          *(void *)(v34 + 40) = v33;

          id v36 = +[MSDUIHelper sharedInstance];
          [v36 startFullScreenUIWith:@"CACHED_BUNDLE_INSTALL" allowCancel:1 disableIdleTimer:1];

          id v37 = sub_100068600();
          uint64_t v29 = v86;
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Data Migration in process, waiting to finish...", buf, 2u);
          }

          unsigned __int8 v38 = [v86 migrateDataWithBlockingUI:*(unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) startMigration:0];
          id v39 = +[MSDLanguageAndRegionManager sharedInstance];
          [v39 restoreDeviceLanguageAndRegionIfNeeded];

          [*(id *)(a1 + 40) clearStagedDeviceAfterUpdateProcess];
          [*(id *)(a1 + 32) setCachedBundleInstallState:@"cachedBundleInstallDone"];
          if (!*(unsigned char *)(a1 + 66))
          {
            [*(id *)(a1 + 32) cleanupDummyPreferenceFile];
            [*(id *)(a1 + 32) destroyWorkFolderForBootTask];
          }
          uint64_t v40 = *(void *)(*(void *)(a1 + 56) + 8);
          unsigned __int8 v41 = *(void **)(v40 + 40);
          *(void *)(v40 + 40) = 0;

          v42 = +[MSDUIHelper sharedInstance];
          [v42 stopFullScreenUI:0];

          if ((v38 & 1) == 0) {
            goto LABEL_96;
          }
        }
        else
        {
          v60 = [*(id *)(a1 + 32) cachedBundleInstallState];
          unsigned int v61 = [v60 isEqualToString:@"cachedBundleInstallInProgress"];

          uint64_t v29 = v86;
          if (v61)
          {
            int v62 = +[MSDWorkQueueSet sharedInstance];
            v63 = [v62 demoUpdateQueue];
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_10003566C;
            block[3] = &unk_100151AF0;
            id v88 = *(id *)(a1 + 32);
            dispatch_async(v63, block);

            id v50 = v88;
            goto LABEL_68;
          }
        }
        v64 = sub_100068600();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
        {
          int v65 = *(unsigned __int8 *)(a1 + 67);
          int v66 = *(unsigned __int8 *)(a1 + 68);
          int v67 = *(unsigned __int8 *)(a1 + 66);
          *(_DWORD *)buf = 67109632;
          *(_DWORD *)v92 = v65;
          *(_WORD *)&v92[4] = 1024;
          *(_DWORD *)&v92[6] = v66;
          __int16 v93 = 1024;
          int v94 = v67;
          _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "Device is DCOTA device: %{BOOL}d; is Offline Mode Device: %{BOOL}d; is DCOTA Offline Mode Device:%{BOOL}d",
            buf,
            0x14u);
        }

        if ((*(unsigned char *)(a1 + 67) || *(unsigned char *)(a1 + 66)) && !*(unsigned char *)(a1 + 64))
        {
          v68 = [*(id *)(a1 + 32) getDemoEnrollmentFlag];

          v69 = [*(id *)(a1 + 32) getDemoEnrollmentFlag];
          unsigned int v70 = [v69 isEqualToString:@"enrollmentSuccess"];

          v71 = sub_100068600();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v92 = v68 != 0;
            *(_WORD *)&v92[4] = 1024;
            *(_DWORD *)&v92[6] = v70;
            _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "Device did attempt enrollment:  %{BOOL}d; success: %{BOOL}d",
              buf,
              0xEu);
          }

          char v72 = v68 ? v70 : 1;
          if ((v72 & 1) == 0)
          {
            uint64_t v73 = os_transaction_create();
            uint64_t v74 = *(void *)(*(void *)(a1 + 56) + 8);
            v75 = *(void **)(v74 + 40);
            *(void *)(v74 + 40) = v73;

            long long v28 = +[MSDFindMyHub sharedInstance];
            [v28 handleEnrollmentRetryUponFirstLaunch];
            goto LABEL_95;
          }
        }
        goto LABEL_96;
      case 1:
        if ([*(id *)(a1 + 32) waitingForCommand])
        {
          unsigned int v43 = +[MSDUIHelper sharedInstance];
          [v43 startFullScreenUIWith:@"IN_PROGRESS" allowCancel:0];

          [*(id *)(a1 + 32) startWaitingForCommandTimer];
          id v44 = +[MSDMailProcessor sharedInstance];
          [v44 setWaitingForCommand:1];
          goto LABEL_42;
        }
        v76 = +[MSDProgressUpdater sharedInstance];
        [v76 updateStage:100];

        if (v12) {
          [v3 demoUpdateCompleted:v12];
        }
        [*(id *)(a1 + 32) deleteOperationRequest];
        goto LABEL_64;
      case 2:
        id v45 = +[MSDUIHelper sharedInstance];
        [v45 startFullScreenUIWith:@"IN_PROGRESS" allowCancel:1];

        if ((v13 & 4) != 0)
        {
          if (([*(id *)(a1 + 32) switchModeImmediately:4] & 1) == 0)
          {
            long long v28 = sub_100068600();
            uint64_t v29 = v86;
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
              sub_1000CB47C(v28);
            }
            goto LABEL_95;
          }
        }
        else
        {
          if ((v13 & 8) != 0)
          {
            v81 = sub_100068600();
            if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)v92 = 5;
              *(_WORD *)&v92[4] = 1024;
              *(_DWORD *)&v92[6] = 2;
              _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "Switch to mode %d from mode %d to complete snapshot revert.", buf, 0xEu);
            }

            uint64_t v29 = v86;
            if ([*(id *)(a1 + 32) switchModeImmediately:5]) {
              goto LABEL_96;
            }
            long long v28 = sub_100068600();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
              sub_1000CB3FC(v28);
            }
            goto LABEL_95;
          }
          [*(id *)(a1 + 32) deleteConfigurationApp];
          if ([*(id *)(a1 + 32) backgroundDownloadState] == (id)1
            || [*(id *)(a1 + 32) backgroundDownloadState] == (id)2)
          {
            [*(id *)(a1 + 32) setBackgroundDownloadState:4];
            [*(id *)(a1 + 32) setBackgroundDownloadActive:0];
          }
          unsigned int v46 = +[MSDPlatform sharedInstance];
          if ([v46 macOS])
          {
            unsigned int v47 = 1;
          }
          else
          {
            v82 = +[MSDPlatform sharedInstance];
            unsigned int v47 = [v82 iOS];
          }
          if (v47 && v13 == 2)
          {
            v83 = +[MSDProgressUpdater sharedInstance];
            [v83 updateStage:17];

            id v44 = +[MSDPricingUpdateController sharedInstance];
            [v44 setSwitchModeAfterCompletion:1];
LABEL_42:

            goto LABEL_64;
          }
          if (v13)
          {
            uint64_t v29 = v86;
            if ([v86 updateDemoContent]) {
              goto LABEL_96;
            }
            long long v28 = sub_100068600();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              __int16 v30 = "Device is busy?";
LABEL_32:
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, v30, buf, 2u);
            }
LABEL_95:

LABEL_96:
            unsigned int v19 = 0;
            goto LABEL_97;
          }
        }
LABEL_64:
        unsigned int v19 = 0;
        goto LABEL_65;
      case 3:
        v84 = sub_100068600();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, "kMSDModePreRebootDataStaged is obsoleted in Azul so we should NOT reach here!", buf, 2u);
        }

        id v85 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:@"kMSDModePreRebootDataStaged is obsoleted in Azul" userInfo:0];
        objc_exception_throw(v85);
      case 4:
        if ((v13 & 4) != 0)
        {
          v77 = +[MSDUIHelper sharedInstance];
          [v77 startFullScreenUIWith:@"IN_PROGRESS" allowCancel:1 disableIdleTimer:1];

          uint64_t v29 = v86;
          if ([v86 continueToUpdateAccountContent]) {
            [*(id *)(a1 + 32) switchModeImmediately:5];
          }
        }
        else
        {
          uint64_t v29 = v86;
          if ([v86 migrateDataWithBlockingUI:4 startMigration:1])
          {
            [*(id *)(a1 + 32) configureNetworkInterface];
            [*(id *)(a1 + 32) waitForNetworkReachability];
            [*(id *)(a1 + 40) clearStagedDeviceAfterUpdateProcess];
            BOOL v48 = +[MSDContentCacheManager sharedInstance];
            [v48 clearCache];

            [*(id *)(a1 + 32) cleanUpBackgroundState:1];
            [v86 setIOSSpecificSettings];
            [v86 setAutomatedDeviceGroupStoreID];
            if ([v86 continueToUpdateDemoContent])
            {
              char v49 = *(void **)(a1 + 32);
              v89[0] = _NSConcreteStackBlock;
              v89[1] = 3221225472;
              v89[2] = sub_10003562C;
              v89[3] = &unk_1001525A8;
              id v90 = v49;
              [v90 waitForBuddy:v89];
              id v50 = v90;
LABEL_68:
            }
          }
        }
        goto LABEL_96;
      case 5:
        char v51 = +[MSDProgressUpdater sharedInstance];
        [v51 updateStage:100];

        if (v12) {
          [v3 demoUpdateCompleted:v12];
        }
        [*(id *)(a1 + 32) deleteOperationRequestAndQuitHelper];
        [*(id *)(a1 + 32) setupCoreAnalyticsLogsUploadTimer];
        [*(id *)(a1 + 32) setupStoreHoursManager];
        [*(id *)(a1 + 32) setupSnapshotRevertTimer];
        char v52 = +[MSDDeviceDataCollector sharedInstance];
        [v52 setupCollectAppUsageDataTimer];

        uint64_t v53 = +[MSDAccountManager sharedInstance];
        [v53 setupTrustedPeerChangeNotificationObserver];

        unsigned int v54 = [*(id *)(a1 + 32) backgroundDownloadActive];
        uint64_t v55 = sub_100068600();
        BOOL v56 = os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT);
        if (v54)
        {
          uint64_t v29 = v86;
          if (v56)
          {
            id v57 = [*(id *)(a1 + 32) backgroundDownloadState];
            *(_DWORD *)buf = 134217984;
            *(void *)v92 = v57;
            _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Background download enabled and its status is:%lu", buf, 0xCu);
          }

          long long v28 = +[MSDBackgroundDownload sharedInstance];
          [v28 kickOffBackgroundDownload];
          goto LABEL_95;
        }
        uint64_t v29 = v86;
        if (v56)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Background download not enabled.", buf, 2u);
        }

        goto LABEL_96;
      case 6:
      case 8:
        BOOL v26 = +[MSDUIHelper sharedInstance];
        [v26 startFullScreenUIWith:@"IN_PROGRESS" allowCancel:0];

        if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == 6) {
          uint64_t v27 = 0;
        }
        else {
          uint64_t v27 = 9;
        }
        [*(id *)(a1 + 32) switchModeImmediately:v27];
        goto LABEL_64;
      case 7:
        id v58 = +[MSDProgressUpdater sharedInstance];
        uint64_t v59 = [v58 backgroundBundle];
        if ([v59 bundleState] == 1)
        {

          uint64_t v29 = v86;
        }
        else
        {
          v78 = +[MSDProgressUpdater sharedInstance];
          v79 = [v78 backgroundBundle];
          unsigned int v80 = [v79 bundleState];

          uint64_t v29 = v86;
          if (v80 != 2) {
            goto LABEL_94;
          }
        }
        [*(id *)(a1 + 32) setBackgroundDownloadState:4];
        [*(id *)(a1 + 32) setBackgroundDownloadActive:0];
LABEL_94:
        long long v28 = +[MSDOSUpdaterController sharedInstance];
        [v28 startOSUpdate];
        goto LABEL_95;
      default:
        long long v28 = sub_100068600();
        uint64_t v29 = v86;
        if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_95;
        }
        *(_WORD *)buf = 0;
        __int16 v30 = "Unknown demo install state";
        goto LABEL_32;
    }
  }
  unsigned int v20 = +[MSDDemoUpdateStatusHub sharedInstance];
  [v20 demoUpdateFailed:v19];

  if ([v19 code] == (id)3727741184) {
    [*(id *)(a1 + 32) forceSwitchToDemoModeIfNeeded];
  }
LABEL_65:
  uint64_t v29 = v86;
LABEL_97:
}

id sub_10003562C(uint64_t a1)
{
  [*(id *)(a1 + 32) markContentInstallingInstalled];
  unsigned int v2 = *(void **)(a1 + 32);

  return [v2 switchModeImmediately:5];
}

id sub_10003566C(uint64_t a1)
{
  unsigned int v2 = sub_100068600();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Cached bundle install in progress, resuming cached bundle install", v4, 2u);
  }

  return [*(id *)(a1 + 32) kickOffCachedBundleInstall];
}

void sub_1000371CC(id a1)
{
  qword_100189940 = objc_alloc_init(MSDCache);

  _objc_release_x1();
}

void sub_100037438(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000374F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000375F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000376D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000377F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000379AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100037B90(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100037CB8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100037DB4(id a1)
{
  qword_100189950 = objc_alloc_init(MSDLocalMessageResponder);

  _objc_release_x1();
}

void sub_1000383F0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) xpcListener];
  id v5 = v3;
  int v6 = sub_100068730();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1000CBC5C();
  }

  xpc_type_t type = xpc_get_type(v5);
  unsigned __int8 v8 = sub_100068730();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1000CBC28();
  }

  if (type != (xpc_type_t)&_xpc_type_connection)
  {
    if (v5 == &_xpc_error_termination_imminent)
    {
      unsigned int v13 = sub_100068730();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      LOWORD(v18) = 0;
      int v14 = "XPC connection will be closed";
    }
    else
    {
      unsigned int v13 = sub_100068730();
      BOOL v15 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v5 != &_xpc_error_connection_invalid)
      {
        if (v15)
        {
          LODWORD(v18) = 136446210;
          *(void *)((char *)&v18 + 4) = xpc_dictionary_get_string(v5, _xpc_error_key_description);
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Got XPC error on listener connection: %{public}s", (uint8_t *)&v18, 0xCu);
        }

        unsigned int v16 = +[MSDLocalMessageResponder sharedInstance];
        id v17 = [v16 xpcListener];
        xpc_connection_cancel(v17);

        exit(1);
      }
      if (!v15)
      {
LABEL_18:

        exit(0);
      }
      LOWORD(v18) = 0;
      int v14 = "No XPC connection, exiting";
    }
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v18, 2u);
    goto LABEL_18;
  }
  unsigned int v9 = sub_100068730();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_1000CBBF4();
  }

  id v10 = v5;
  id v11 = sub_100068730();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Start to deal with new connection", (uint8_t *)&v18, 2u);
  }

  *(void *)&long long v18 = _NSConcreteStackBlock;
  *((void *)&v18 + 1) = 3221225472;
  unsigned int v19 = sub_10003DC28;
  unsigned int v20 = &unk_100152638;
  id v21 = v10;
  __int16 v12 = (_xpc_connection_s *)v10;
  xpc_connection_set_event_handler(v12, &v18);
  xpc_connection_resume(v12);
}

void sub_10003C0D4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 240), 8);
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10003C344(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10003C354(uint64_t a1)
{
}

void sub_10003C35C(uint64_t a1)
{
  unsigned int v2 = sub_100068730();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v14 = "-[MSDLocalMessageResponder handleMessage:from:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s: waiting for buddy to quit.", buf, 0xCu);
  }

  [*(id *)(a1 + 32) waitForBuddyWithTimeout];
  id v3 = +[MSDUIHelper sharedInstance];
  [v3 startFullScreenUIWith:@"IN_PROGRESS" allowCancel:1];

  id v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 72);
  uint64_t v9 = *(void *)(*(void *)(a1 + 88) + 8);
  id obj = *(id *)(v9 + 40);
  unsigned __int8 v10 = [v4 enrollForDeviceName:v5 pairingCredential:v6 hubHostName:v7 hubPort:v8 error:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v10;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)
    || ([*(id *)(a1 + 32) setDemoEnrollmentFlag:@"enrollmentSuccess"],
        !*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)))
  {
    [*(id *)(a1 + 32) setDemoEnrollmentFlag:@"enrollmentFailed"];
    id v11 = +[MSDUIHelper sharedInstance];
    [v11 stopFullScreenUI:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
  }
}

void sub_10003C4E4(uint64_t a1)
{
  unsigned int v2 = +[MSDUIHelper sharedInstance];
  [v2 startFullScreenUIWith:@"IN_PROGRESS" allowCancel:1];

  id v3 = +[MSDDemoUpdateTimeKeeper sharedInstance];
  id v4 = [v3 setCompletionTime:*(unsigned int *)(a1 + 48) reserveTimeForCleanup:1];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) updateDemoContent];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v5 = sub_100068600();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Device is busy?", v6, 2u);
    }
  }
}

void sub_10003C5C8(uint64_t a1)
{
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  if (!reply) {
    xpc_object_t reply = xpc_dictionary_create(0, 0, 0);
  }
  if ([*(id *)(a1 + 40) isContentFrozen])
  {
    [*(id *)(a1 + 40) manageDeviceSnapshot:@"CommitSnapshot"];
  }
  else
  {
    id v3 = sub_100068600();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Snapshot commit not allowed in current state.", v4, 2u);
    }
  }
  xpc_dictionary_set_BOOL(reply, "Acknowledged", 1);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 48), reply);
}

id sub_10003C6A0(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) getDemoEnrollmentFlag];

  if ([*(id *)(a1 + 32) isVerifiedDemoDevice])
  {
    if (!v2)
    {
      [*(id *)(a1 + 32) setupDemoDeviceMetadataFolder];
      [*(id *)(a1 + 32) setDemoEnrollmentFlag:@"enrollmentStarted"];
    }
  }
  else if ([*(id *)(a1 + 32) isVerifiedPOSDevice])
  {
    [*(id *)(a1 + 32) setupDemoDeviceMetadataFolder];
    [*(id *)(a1 + 32) setPOSDeviceFlag];
  }
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 48));
  if ([*(id *)(a1 + 32) isVerifiedDemoDevice])
  {
    if (v2)
    {
      BOOL v15 = sub_100068730();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        unsigned int v32 = "DemoPrepare";
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Skipping %s request because it already ran once", buf, 0xCu);
      }
      goto LABEL_35;
    }
    [*(id *)(a1 + 32) setDemoDeviceFlag];
    [*(id *)(a1 + 32) registerCAHearbeatActivity];
    id v3 = +[MSDKeychainManager sharedInstance];
    id v4 = [v3 getItemForKey:@"com.apple.mobilestoredemo.keychainItemID"];

    if (!v4)
    {
      uint64_t v5 = sub_100068730();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        unsigned int v32 = "-[MSDLocalMessageResponder handleMessage:from:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: waiting for buddy to quit.", buf, 0xCu);
      }

      [*(id *)(a1 + 32) waitForBuddyWithTimeout];
      uint64_t v6 = +[MSDUIHelper sharedInstance];
      [v6 startFullScreenUIWith:@"IN_PROGRESS" allowCancel:0];

      string = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 56), "SSID");
      if (string)
      {
        uint64_t v8 = string;
        uint64_t v9 = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 56), "Password");
        if (v9)
        {
          unsigned __int8 v10 = +[NSString stringWithUTF8String:v9];
        }
        else
        {
          unsigned __int8 v10 = 0;
        }
        unsigned int v16 = sub_100068730();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446210;
          unsigned int v32 = v8;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Setting up WiFi: ssid = %{public}s", buf, 0xCu);
        }

        for (unint64_t i = 4; i > 1; --i)
        {
          long long v18 = +[MSDWiFiHelper sharedInstance];
          unsigned int v19 = +[NSString stringWithUTF8String:v8];
          *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [v18 configureWiFi:v19 password:v10];

          if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
            goto LABEL_26;
          }
          sleep(5u);
        }
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
        {
LABEL_26:
          [*(id *)(a1 + 32) waitForNetworkReachability];

          goto LABEL_27;
        }
        uint64_t v27 = +[NSError errorDomainMSDWithCode:3727741072 message:@"Failed to configure WiFi."];
        uint64_t v28 = *(void *)(*(void *)(a1 + 80) + 8);
        uint64_t v29 = *(void **)(v28 + 40);
        *(void *)(v28 + 40) = v27;
      }
      else
      {
LABEL_27:
        unsigned int v20 = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 56), "PreferredStoreID");
        if (v20)
        {
          id v21 = +[NSString stringWithUTF8String:v20];
          [*(id *)(a1 + 32) setPreferredStoreID:v21];
        }
        unsigned __int8 v22 = sub_100068730();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          unsigned int v32 = "-[MSDLocalMessageResponder handleMessage:from:]_block_invoke";
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s: requesting discoverAndEnrollWithHub.", buf, 0xCu);
        }

        int v23 = +[MSDFindMyHub sharedInstance];
        uint64_t v24 = *(void *)(*(void *)(a1 + 80) + 8);
        id obj = *(id *)(v24 + 40);
        unsigned __int8 v25 = [v23 discoverAndEnrollWithHub:&obj];
        objc_storeStrong((id *)(v24 + 40), obj);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v25;

        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
          [*(id *)(a1 + 32) setDemoEnrollmentFlag:@"enrollmentSuccess"];
        }
      }
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
      {
        [*(id *)(a1 + 32) setDemoEnrollmentFlag:@"enrollmentFailed"];
        BOOL v15 = +[MSDUIHelper sharedInstance];
        [v15 stopFullScreenUI:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
LABEL_35:
      }
    }
  }
  else
  {
    id v11 = +[MSDTargetDevice sharedInstance];
    unsigned int v12 = [v11 isVerifiedPOSDevice];

    if (!v12)
    {
      int v14 = sub_100068730();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "This device is not a demo device.", buf, 2u);
      }

      BOOL v15 = +[MSDUIHelper sharedInstance];
      [v15 startFullScreenUIWith:@"NOT_VERIFIED" allowCancel:1];
      goto LABEL_35;
    }
    id v13 = +[F13Server sharedInstance];
  }
  return [*(id *)(a1 + 64) setDemoPrepareInProgress:0];
}

intptr_t sub_10003CC08(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_10003CC10(uint64_t a1)
{
  return [*(id *)(a1 + 32) kickOffCachedBundleInstall];
}

void sub_10003CC18(uint64_t a1)
{
  [*(id *)(a1 + 32) switchModeImmediately:7];
  id v1 = +[MSDOSUpdaterController sharedInstance];
  [v1 startOSUpdate];
}

id sub_10003CC6C(uint64_t a1)
{
  [*(id *)(a1 + 32) kickOffCachedBundleInstall];
  unsigned int v2 = *(void **)(a1 + 40);

  return [v2 setDemoPrepareInProgress:0];
}

uint64_t sub_10003CCAC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (xpc_get_type(v4) != (xpc_type_t)&_xpc_type_string) {
    goto LABEL_14;
  }
  string_ptr = xpc_string_get_string_ptr(v4);
  if (!strncmp(string_ptr, "CurrentWiFiSSID", 0x10uLL))
  {
    uint64_t v7 = +[MSDWiFiHelper sharedInstance];
    uint64_t v8 = [v7 getCurrentWiFiSsid];
  }
  else
  {
    if (strncmp(string_ptr, "PersistentWiFiSSID", 0x13uLL))
    {
      if (!strncmp(string_ptr, "EmbeddedSIMInstalled", 0x15uLL))
      {
        id v11 = +[MSDCellularHelper sharedInstance];
        unsigned __int8 v12 = [v11 embeddedSIMInstalled];

        xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), string_ptr, v12);
      }
      else if (!strncmp(string_ptr, "ActiveNetworkInterface", 0x17uLL))
      {
        xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), string_ptr, (uint64_t)[*(id *)(a1 + 40) fetchActiveNetworkInterface]);
      }
      else
      {
        uint64_t v6 = sub_100068600();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 136446210;
          int v14 = string_ptr;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received unrecognized key for network info: %{public}s", (uint8_t *)&v13, 0xCu);
        }
      }
      goto LABEL_14;
    }
    uint64_t v7 = +[MSDWiFiHelper sharedInstance];
    uint64_t v8 = [v7 getPersistentWiFiSsid];
  }
  uint64_t v9 = (void *)v8;

  if (v9) {
    xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 32), string_ptr, (const char *)[v9 UTF8String]);
  }

LABEL_14:
  return 1;
}

void sub_10003D240(uint64_t a1, BOOL a2, BOOL a3, uint64_t a4)
{
  xpc_object_t xdict = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  xpc_dictionary_set_BOOL(xdict, "Result", a4 == 0);
  if (!a4)
  {
    xpc_dictionary_set_BOOL(xdict, "Eligible", a2);
    xpc_dictionary_set_BOOL(xdict, "ShowUI", a3);
  }
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), xdict);
}

void sub_10003D3BC(uint64_t a1, uint64_t a2)
{
  xpc_object_t message = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  xpc_dictionary_set_BOOL(message, "Result", a2 == 0);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), message);
}

void sub_10003D648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_10003D684(void *a1, void *a2, void *a3)
{
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = a3 == 0;
  if (a2)
  {
    uint64_t v5 = *(void **)(*(void *)(a1[5] + 8) + 40);
    char v6 = *(unsigned char *)(*(void *)(a1[4] + 8) + 24);
    id v12 = a3;
    id v7 = a2;
    xpc_dictionary_set_BOOL(v5, "Result", v6);
    uint64_t v8 = *(void **)(*(void *)(a1[5] + 8) + 40);
    id v9 = v7;
    id v10 = [v9 bytes];
    id v11 = [v9 length];

    xpc_dictionary_set_data(v8, "ResultData", v10, (size_t)v11);
    xpc_connection_send_message(*(xpc_connection_t *)(*(void *)(a1[6] + 8) + 40), *(xpc_object_t *)(*(void *)(a1[5] + 8) + 40));
  }
}

void sub_10003DC28(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  uint64_t v5 = sub_100068730();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000CBC28();
  }

  char v6 = sub_100068730();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (v7) {
      sub_1000CC6C4();
    }

    if (v3 == &_xpc_error_connection_invalid)
    {
      id v10 = sub_100068730();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "XPC disconnected by client", buf, 2u);
      }

      id v9 = +[MSDLocalMessageResponder sharedInstance];
      [v9 lostClientConnection:*(void *)(a1 + 32)];
    }
    else
    {
      if (v3 != &_xpc_error_termination_imminent) {
        goto LABEL_10;
      }
      id v9 = sub_100068730();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "XPC connection will be closed", v11, 2u);
      }
    }
  }
  else
  {
    if (v7) {
      sub_1000CC758();
    }

    if (type != (xpc_type_t)&_xpc_type_dictionary) {
      sub_1000CC72C();
    }
    uint64_t v8 = +[MSDLocalMessageResponder sharedInstance];
    [v8 handleMessage:v3 from:*(void *)(a1 + 32)];

    id v9 = sub_100068730();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_1000CC6F8();
    }
  }

LABEL_10:
}

void sub_10003E5E4(id a1)
{
  id v1 = objc_alloc_init(MSDAirPlayAssistedSender);
  uint64_t v2 = qword_100189968;
  qword_100189968 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_10003E884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10003E89C(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) state];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result == (id)1;
  return result;
}

void sub_10003EAFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10003EB28(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) _activateSenderUsingParameters:*(void *)(a1 + 40) discoveryMode:*(void *)(a1 + 56)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (_BYTE)result;
  return result;
}

id sub_10003F1A4(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _handleTimeoutTimerFired];
}

void sub_10003F4E8(uint64_t a1)
{
  uint64_t v2 = sub_100068600();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) _NSStringFromSenderState:[*(id *)(a1 + 32) state]];
    int v25 = 138543362;
    BOOL v26 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "MSDAirPlayAssistedSender: Received AV output device changed notification when in state: %{public}@", (uint8_t *)&v25, 0xCu);
  }
  if ([*(id *)(a1 + 32) state] != (id)1)
  {
    if ([*(id *)(a1 + 32) state] == (id)2) {
      [*(id *)(a1 + 32) _stopActivation];
    }
    unsigned int v4 = [*(id *)(a1 + 32) _isAirPlayStreaming];
    uint64_t v5 = *(void **)(a1 + 32);
    if (v4)
    {
      [v5 setState:3];
      char v6 = +[MSDAudioController sharedInstance];
      unsigned __int8 v7 = [v6 addRouteToSystemMusicForSpeaker];

      if (v7) {
        return;
      }
      uint64_t v8 = sub_100068600();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1000CCA80(v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
    else
    {
      [v5 setState:1];
      uint64_t v16 = +[MSDAudioController sharedInstance];
      unsigned __int8 v17 = [v16 removeRouteToSystemMusicForSpeaker];

      if (v17) {
        return;
      }
      uint64_t v8 = sub_100068600();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1000CCAB8(v8, v18, v19, v20, v21, v22, v23, v24);
      }
    }
  }
}

void sub_10003FB38(id a1)
{
  id v1 = objc_alloc_init(MSDPricingUpdateController);
  uint64_t v2 = qword_100189970;
  qword_100189970 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_10003FCFC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10004015C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) heartBeatMonitor];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) heartBeatMonitor];
    [v3 invalidate];
  }
  unsigned int v4 = *(void **)(a1 + 32);

  return [v4 setHeartBeatMonitor:0];
}

void sub_100040274(uint64_t a1)
{
  uint64_t v2 = sub_100068600();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = 120;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Starting timer for Pricing (will trigger in %d seconds).", (uint8_t *)v4, 8u);
  }

  id v3 = +[NSTimer scheduledTimerWithTimeInterval:*(void *)(a1 + 32) target:"pricingUpdateTimeOut:" selector:0 userInfo:0 repeats:120.0];
  [*(id *)(a1 + 32) setHeartBeatMonitor:v3];
}

id sub_100041BB0()
{
  if (qword_100189988 != -1) {
    dispatch_once(&qword_100189988, &stru_100152870);
  }
  v0 = (void *)qword_100189980;

  return v0;
}

void sub_100041C04(id a1)
{
  id v1 = +[MSDPlatform sharedInstance];
  unsigned int v2 = [v1 watchOS];

  if (v2)
  {
    +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", @"/var/mobile/Demo.mov", @"/var/mobile/Demo.plist", @"/var/mobile/Media", @"/var/mobile/Library/AddressBook", @"/var/mobile/Library/Alarms", @"/var/mobile/Library/Calendar", @"/var/mobile/Library/CallHistoryDB", @"/var/mobile/Library/Carousel", @"/var/mobile/Library/Health", @"/var/mobile/Library/Maps", @"/var/mobile/Library/MapsHistory.plist", @"/var/mobile/Library/NanoMailKit", @"/var/mobile/Library/NanoMusicSync", @"/var/mobile/Library/NanoPasses", @"/var/mobile/Library/NanoPodcasts", @"/var/mobile/Library/NanoPhotos", @"/var/mobile/Library/NanoWeatherDemo",
      @"/var/mobile/Library/News",
      @"/var/mobile/Library/RetailDemo",
      @"/var/mobile/Library/Reminders",
      @"/var/mobile/Library/SMS",
      @"/var/mobile/Library/UserConfigurationProfiles",
      @"/var/mobile/Library/Preferences/.GlobalPreferences.plist",
      @"/var/mobile/Library/Preferences/.GlobalPreferences_m.plist",
      @"/var/mobile/Library/Preferences/com.apple.Accessibility.plist",
      @"/var/mobile/Library/Preferences/com.apple.ActivitySharing.plist",
      @"/var/mobile/Library/Preferences/com.apple.AppleMediaServices.plist",
      @"/var/mobile/Library/Preferences/com.apple.assistant.backedup.plist",
      @"/var/mobile/Library/Preferences/com.apple.assistant.nano.plist",
      @"/var/mobile/Library/Preferences/com.apple.assistant.support.plist",
      @"/var/mobile/Library/Preferences/com.apple.backboardd.plist",
      @"/var/mobile/Library/Preferences/com.apple.Carousel.plist",
      @"/var/mobile/Library/Preferences/com.apple.coremedia.plist",
      @"/var/mobile/Library/Preferences/com.apple.ControlCenter.plist",
      @"/var/mobile/Library/Preferences/com.apple.DeepBreathing.plist",
      @"/var/mobile/Library/Preferences/com.apple.demo-settings.plist",
      @"/var/mobile/Library/Preferences/com.apple.findmy.plist",
      @"/var/mobile/Library/Preferences/com.apple.healthd.plist",
      @"/var/mobile/Library/Preferences/com.apple.ids.plist",
      @"/var/mobile/Library/Preferences/com.apple.locationd.plist",
      @"/var/mobile/Library/Preferences/com.apple.mobileme.fmf1.plist",
      @"/var/mobile/Library/Preferences/com.apple.mobilephone.plist",
      @"/var/mobile/Library/Preferences/com.apple.mobilephone.speeddial.plist",
      @"/var/mobile/Library/Preferences/com.apple.mobiletimer.plist",
      @"/var/mobile/Library/Preferences/com.apple.nanobuddy.plist",
      @"/var/mobile/Library/Preferences/com.apple.nanolifestyle.plist",
      @"/var/mobile/Library/Preferences/com.apple.nanolifestyle.privacy.plist",
      @"/var/mobile/Library/Preferences/com.apple.NanoMediaUI.plist",
      @"/var/mobile/Library/Preferences/com.apple.NanoMusicSync.plist",
      @"/var/mobile/Library/Preferences/com.apple.nanopassbook.plist",
      @"/var/mobile/Library/Preferences/com.apple.nanophotos.plist",
      @"/var/mobile/Library/Preferences/com.apple.nanonews.sync.plist",
      @"/var/mobile/Library/Preferences/com.apple.Noise.plist",
      @"/var/mobile/Library/Preferences/com.apple.podcasts.plist",
      @"/var/mobile/Library/Preferences/com.apple.SessionTrackerApp.plist",
      @"/var/mobile/Library/Preferences/com.apple.stockholm.plist",
      @"/var/mobile/Library/Preferences/com.apple.system.prefs.plist",
      @"/var/mobile/Library/Preferences/com.apple.timed.plist",
      @"/var/mobile/Library/Preferences/com.apple.voicememod.plist",
      @"/var/mobile/Library/Preferences/group.com.apple.stocks.plist",
      @"/var/mobile/Library/Preferences/Avalon");
  }
  else
  {
    id v3 = +[MSDPlatform sharedInstance];
    unsigned int v4 = [v3 tvOS];

    if (!v4) {
      return;
    }
    +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", @"/var/mobile/Media/DCIM", @"/var/mobile/Media/PhotoData", @"/var/mobile/Library/Preferences/com.apple.demo-settings.plist", @"/var/MobileDevice/ProvisioningProfiles", @"/var/mobile/Library/com.apple.HeadBoard/HBDemoModeAppOrder", @"/var/mobile/Library/com.apple.HeadBoard/AppOrder.plist", @"/var/mobile/Library/Preferences/.GlobalPreferences.plist", @"/var/mobile/Library/Preferences/.GlobalPreferences_m.plist", @"/var/mobile/Library/DemoLoop", 0, v7, v8, v9, v10, v11, v12, v13,
      v14,
      v15,
      v16,
      v17,
      v18,
      v19,
      v20,
      v21,
      v22,
      v23,
      v24,
      v25,
      v26,
      v27,
      v28,
      v29,
      v30,
      v31,
      v32,
      v33,
      v34,
      v35,
      v36,
      v37,
      v38,
      v39,
      v40,
      v41,
      v42,
      v43,
      v44,
      v45,
      v46,
      v47,
      v48,
      v49,
      v50,
      v51,
      v52,
      v53,
      v54,
      v55,
      v56,
      v57);
  uint64_t v5 = };
  uint64_t v6 = qword_100189980;
  qword_100189980 = v5;

  _objc_release_x1(v5, v6);
}

id sub_100042044()
{
  if (qword_100189998 != -1) {
    dispatch_once(&qword_100189998, &stru_100152890);
  }
  v0 = (void *)qword_100189990;

  return v0;
}

void sub_100042098(id a1)
{
  id v1 = +[MSDPlatform sharedInstance];
  unsigned int v2 = [v1 watchOS];

  if (v2)
  {
    uint64_t v3 = +[NSArray arrayWithObjects:@"/var/mobile/Library/Caches/sharedCaches/com.apple.WatchListKit.NSURLCache", @"/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/VaryState.db-shm", @"/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/VaryState.db-wal", @"/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/VaryState.db", @"/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/Cache.db", @"/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/Cache.db-wal", @"/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/Cache.db-shm", @"/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/fsCachedData", 0];
  }
  else
  {
    unsigned int v4 = +[MSDPlatform sharedInstance];
    unsigned int v5 = [v4 tvOS];

    if (!v5) {
      return;
    }
    uint64_t v3 = +[NSArray array];
  }
  uint64_t v6 = qword_100189990;
  qword_100189990 = v3;

  _objc_release_x1(v3, v6);
}

id sub_1000421AC()
{
  if (qword_1001899A8 != -1) {
    dispatch_once(&qword_1001899A8, &stru_1001528B0);
  }
  v0 = (void *)qword_1001899A0;

  return v0;
}

void sub_100042200(id a1)
{
  id v1 = +[MSDPlatform sharedInstance];
  unsigned int v2 = [v1 watchOS];

  if (v2)
  {
    uint64_t v3 = +[NSArray arrayWithObjects:@"systemgroup.com.apple.configurationprofiles", 0];
  }
  else
  {
    unsigned int v4 = +[MSDPlatform sharedInstance];
    unsigned int v5 = [v4 tvOS];

    if (!v5) {
      return;
    }
    uint64_t v3 = +[NSArray array];
  }
  uint64_t v6 = qword_1001899A0;
  qword_1001899A0 = v3;

  _objc_release_x1(v3, v6);
}

id sub_1000422D0()
{
  if (qword_1001899B8 != -1) {
    dispatch_once(&qword_1001899B8, &stru_1001528D0);
  }
  v0 = (void *)qword_1001899B0;

  return v0;
}

void sub_100042324(id a1)
{
  uint64_t v1 = +[NSArray arrayWithObjects:@"/.com.apple.mobile_container_manager.metadata.plist", @"/Library/Caches", @"/Library/SyncedPreferences", @"/Library/Saved Application State", @"/SystemData/com.apple.AuthenticationServices", 0];
  uint64_t v2 = qword_1001899B0;
  qword_1001899B0 = v1;

  _objc_release_x1(v1, v2);
}

id sub_1000423A0()
{
  if (qword_1001899C8 != -1) {
    dispatch_once(&qword_1001899C8, &stru_1001528F0);
  }
  v0 = (void *)qword_1001899C0;

  return v0;
}

void sub_1000423F4(id a1)
{
  uint64_t v1 = +[NSArray arrayWithObjects:@"/.com.apple.mobile_container_manager.metadata.plist", @"/Library/Caches", @"/Library/SyncedPreferences", @"/Library/Saved Application State", @"/SystemData/com.apple.AuthenticationServices", 0];
  uint64_t v2 = qword_1001899C0;
  qword_1001899C0 = v1;

  _objc_release_x1(v1, v2);
}

id sub_100042470()
{
  v4[0] = @"ContentRootDomain";
  v0 = sub_100041BB0();
  v4[1] = @"SystemContainerDomain";
  v5[0] = v0;
  uint64_t v1 = sub_1000421AC();
  v5[1] = v1;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

void sub_10004258C(id a1)
{
  uint64_t v1 = objc_alloc_init(MSDAppSwitcherManager);
  uint64_t v2 = qword_1001899D8;
  qword_1001899D8 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_100043788(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    unsigned int v5 = sub_100068600();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000CD190(v4, v5);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000437F4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    unsigned int v5 = sub_100068600();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000CD21C(v4, v5);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000438B4(id a1)
{
  uint64_t v1 = objc_alloc_init(MSDAVFlashlight);
  uint64_t v2 = qword_1001899E8;
  qword_1001899E8 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_100043AC4(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setFlashTimer:*(unsigned int *)(a1 + 40)];

  id v4 = objc_loadWeakRetained(v2);
  [v4 _startFlash];
}

id sub_100043BAC(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  return +[NSTimer scheduledTimerWithTimeInterval:*(void *)(a1 + 32) target:"_stopFlash:" selector:0 userInfo:0 repeats:(double)*(unint64_t *)&a2];
}

void sub_100043F08(id a1)
{
  uint64_t v1 = objc_alloc_init(MSDDemoPeerPairingManager);
  uint64_t v2 = qword_1001899F8;
  qword_1001899F8 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_100044844(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100044870(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100044880(uint64_t a1)
{
}

void sub_100044888(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    unsigned int v5 = sub_100068600();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000CD8F8(a1, (uint64_t)v4, v5);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100044AC8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_100044B00(uint64_t a1)
{
  uint64_t v2 = sub_100068600();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_1000CD974();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained pairingManager];
  [v4 invalidate];
}

void sub_100044B6C(uint64_t a1)
{
  uint64_t v2 = sub_100068600();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_1000CD9A8();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setPairingManager:0];
}

void sub_100044E18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_100044E48(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000450DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100045100(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000453C0(id a1, CUPairedPeer *a2, unint64_t a3, BOOL *a4)
{
  id v5 = a2;
  id v6 = sub_100068600();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [(CUPairedPeer *)v5 detailedDescription];
    int v8 = 134218242;
    unint64_t v9 = a3;
    __int16 v10 = 2114;
    id v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "MSDDemoPeerPairingManager: [%lu] %{public}@", (uint8_t *)&v8, 0x16u);
  }
}

void sub_100046FD0(id a1)
{
  uint64_t v1 = objc_alloc_init(MSDWallpaperManager);
  uint64_t v2 = qword_100189A08;
  qword_100189A08 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_1000475CC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    [v4 changed];
    id v6 = PRSWallpaperObserverLocationsDescription();
    int v7 = 138543362;
    int v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Poster config changed with transition: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  [*(id *)(a1 + 32) _handleWallpaperConfigChange];
}

void sub_10004794C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = sub_100068600();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000CE420(v3);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100047FDC(id a1)
{
  uint64_t v1 = objc_alloc_init(MSDCellularHelper);
  uint64_t v2 = qword_100189A10;
  qword_100189A10 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_100048250(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100048268(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100048278(uint64_t a1)
{
}

void sub_100048280(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) cellularSlotsInfo];
  id v2 = [v6 copy];
  uint64_t v3 = +[NSDictionary dictionaryWithObject:v2 forKey:@"Slots"];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_100048440(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100048458(uint64_t a1)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [*(id *)(a1 + 32) cellularSlotsInfo];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (unint64_t i = 0; i != v4; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        int v7 = [*(id *)(*((void *)&v8 + 1) + 8 * i) objectForKeyedSubscript:@"SimType"];
        if (v7)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if ([v7 isEqual:&off_1001620A8])
            {
              *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;

              goto LABEL_13;
            }
          }
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

void sub_1000486D4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100048804(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100048894(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100048C90(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100048D84(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchCellularPlanItems];
}

void sub_10004966C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_100049680(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _activate];
}

void sub_100049778(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_10004978C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _deactivate];
}

void sub_100049BDC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v6);
  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v7 - 96));
  _Unwind_Resume(a1);
}

void sub_100049C54(uint64_t a1)
{
  id v2 = sub_100068600();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_1000CE4A4();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _deactivate];
}

void sub_100049CB0(uint64_t a1)
{
  id v2 = sub_100068600();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_1000CE4E4();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _deactivate];
}

void sub_100049D0C(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleRPCompanionLinkDeviceFound:v3];
}

void sub_100049D68(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleRPCompanionLinkDeviceLost:v3];
}

void sub_100049DC4(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _handleRPCompanionLinkDeviceChanged:v5 withChanges:a3];
}

void sub_100049E30(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100068600();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000CE524(v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v7 = [WeakRetained rpClient];
    long long v8 = [v7 activeDevices];
    int v9 = 138412290;
    long long v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MSDRapportDeviceExplorer: Known devices: %@", (uint8_t *)&v9, 0xCu);
  }
}

void sub_10004A5EC(uint64_t a1)
{
  if ([*(id *)(a1 + 32) droppedByRapport])
  {
    id v2 = [*(id *)(a1 + 40) devices];
    [v2 removeObject:*(void *)(a1 + 32)];

    id v3 = [*(id *)(a1 + 40) observer];

    if (v3)
    {
      id v5 = [*(id *)(a1 + 40) observer];
      [v5 explorerDidLoseDevice:*(void *)(a1 + 32)];
    }
  }
  else
  {
    id v4 = sub_100068600();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "MSDRapportDeviceExplorer: Ignore device lost event as device was found again after it was reportedly dropped.", buf, 2u);
    }
  }
}

void sub_10004AB38(int a1, int a2, CFStringRef theString1)
{
  if (CFEqual(theString1, @"com.apple.purplebuddy.setupdone"))
  {
    id v3 = sub_100068600();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Received notification: buddy finished setup", v5, 2u);
    }

    id v4 = +[MSDTargetDevice sharedInstance];
    [v4 invokeHandler:1];
  }
}

void sub_10004AC2C(id a1)
{
  uint64_t v1 = objc_alloc_init(MSDTargetDevice);
  id v2 = (void *)qword_100189A28;
  qword_100189A28 = (uint64_t)v1;

  [(id)qword_100189A28 setModeLock:&off_1001620D8];
  id v3 = (void *)qword_100189A28;

  _[v3 setBuddyCompletionHandlerLock:&off_1001620D8];
}

void sub_10004B8D4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10004BB14(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10004BDF0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10004BF58(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10004C2DC(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = sub_100068600();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138543362;
      id v5 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Request to wipeOutDevice failed =  %{public}@", (uint8_t *)&v4, 0xCu);
    }
  }
}

void sub_10004C9C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10004D014(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10004D0F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10004D2A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10004DE50(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v4 = +[MSDTargetDevice sharedInstance];
    id v5 = (__CFString *)v3;
    if ([(__CFString *)v5 isEqualToString:@"MSDDemoManualUpdateState"])
    {
      __int16 v78 = 0;
      [*(id *)(a1 + 32) manualUpdateMode:(char *)&v78 + 1 allowChange:&v78];
      id v6 = *(void **)(a1 + 40);
      uint64_t v7 = +[NSNumber numberWithBool:HIBYTE(v78)];
      [v6 setObject:v7 forKey:@"MSDDemoManualUpdateCurrentMode"];

      long long v8 = *(void **)(a1 + 40);
      int v9 = +[NSNumber numberWithBool:v78];
      CFStringRef v10 = @"MSDDemoManualUpdateAllowChange";
      long long v11 = v8;
LABEL_4:
      id v12 = v9;
LABEL_5:
      [v11 setObject:v12 forKey:v10];
LABEL_22:

      goto LABEL_23;
    }
    if ([(__CFString *)v5 isEqualToString:@"MSDDemoContentStatus"])
    {
      uint64_t v13 = +[MSDProgressUpdater sharedInstance];

      if (!v13)
      {
LABEL_23:

        goto LABEL_24;
      }
      uint64_t v14 = *(void **)(a1 + 40);
      uint64_t v15 = +[MSDProgressUpdater sharedInstance];
      uint64_t v16 = [v15 getContentStatus];
      [v14 setObject:v16 forKey:@"MSDDemoContentStatus"];

      uint64_t v17 = *(void **)(a1 + 40);
      uint64_t v18 = +[MSDProgressUpdater sharedInstance];
      uint64_t v19 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v18 getInternalStatus]);
      [v17 setObject:v19 forKey:@"InternalStatus"];

LABEL_9:
      goto LABEL_23;
    }
    if ([(__CFString *)v5 isEqualToString:@"MSDDemoLastRebootTime"])
    {
      uint64_t v20 = [v4 lastRebootTime];
      if (!v20) {
        goto LABEL_23;
      }
      goto LABEL_18;
    }
    if ([(__CFString *)v5 isEqualToString:@"MSDDemoLastRevertTime"])
    {
      uint64_t v20 = [*(id *)(a1 + 32) lastSnapshotRevertTime];
      if (!v20) {
        goto LABEL_23;
      }
LABEL_18:
      int v9 = v20;
      uint64_t v21 = *(void **)(a1 + 40);
      uint64_t v22 = [v20 toString];
LABEL_19:
      id v23 = (id)v22;
      uint64_t v24 = v21;
      id v25 = v23;
      CFStringRef v26 = v5;
LABEL_20:
      [v24 setObject:v25 forKey:v26];
LABEL_21:

      goto LABEL_22;
    }
    if ([(__CFString *)v5 isEqualToString:@"MSDLastShallowRefreshTime"])
    {
      uint64_t v20 = [*(id *)(a1 + 32) lastShallowRefreshTime];
      if (!v20) {
        goto LABEL_23;
      }
      goto LABEL_18;
    }
    if ([(__CFString *)v5 isEqualToString:@"MSDDemoNANDSize"])
    {
      uint64_t v27 = +[MSDNPIMaskValues sharedInstance];
      unsigned int v28 = [v27 isNPIDevice];

      if (v28)
      {
        uint64_t v29 = +[MSDNPIMaskValues sharedInstance];
        uint64_t v30 = [v29 getMaskValueForKey:@"MSDDemoNANDSize"];

        if (v30)
        {
          objc_opt_class();
          uint64_t v18 = v30;
          if (objc_opt_isKindOfClass())
          {
LABEL_35:
            [*(id *)(a1 + 40) setObject:v18 forKey:v5];
            goto LABEL_9;
          }
        }
      }
      else
      {
        uint64_t v30 = 0;
      }
      uint64_t v18 = [v4 nandSize];

      if (!v18) {
        goto LABEL_23;
      }
      goto LABEL_35;
    }
    uint64_t v31 = +[MSDPlatform sharedInstance];
    if ([v31 macOS])
    {
      unsigned int v32 = [(__CFString *)v5 isEqualToString:@"MSDPricingRequestUpdate"];

      if (!v32) {
        goto LABEL_42;
      }
LABEL_38:
      uint64_t v35 = +[MSDPricingUpdateController sharedInstance];
      id v36 = [v35 needUpdate];

      uint64_t v37 = *(void **)(a1 + 40);
      uint64_t v38 = +[NSNumber numberWithBool:v36];
      goto LABEL_39;
    }
    uint64_t v33 = +[MSDPlatform sharedInstance];
    if ([v33 iOS])
    {
      unsigned __int8 v34 = [(__CFString *)v5 isEqualToString:@"MSDPricingRequestUpdate"];

      if (v34) {
        goto LABEL_38;
      }
    }
    else
    {
    }
LABEL_42:
    if ([(__CFString *)v5 isEqualToString:@"MSDDemoAcceptUATContent"])
    {
      uint64_t v39 = +[MSDPlatform sharedInstance];
      unsigned __int8 v40 = [v39 macOS];

      if (v40)
      {
        int v9 = &__kCFBooleanFalse;
      }
      else
      {
        int v9 = (void *)MGCopyAnswer();
        if (!v9) {
          goto LABEL_23;
        }
      }
      uint64_t v21 = *(void **)(a1 + 40);
      uint64_t v22 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v9 BOOLValue] ^ 1);
      goto LABEL_19;
    }
    if ([(__CFString *)v5 isEqualToString:@"MSDDemoProductDescription"])
    {
      uint64_t v41 = +[MSDNPIMaskValues sharedInstance];
      unsigned int v42 = [v41 isNPIDevice];

      if (v42)
      {
        uint64_t v43 = +[MSDNPIMaskValues sharedInstance];
        int v9 = [v43 getMaskValueForKey:@"MSDDemoProductDescription"];

        if (v9)
        {
          objc_opt_class();
          uint64_t v44 = (uint64_t)v9;
          if (objc_opt_isKindOfClass()) {
            goto LABEL_66;
          }
        }
      }
      else
      {
        int v9 = 0;
      }
      uint64_t v50 = (void *)MGCopyAnswer();
      id v23 = v50;
      if (v50)
      {
        uint64_t v44 = [v50 objectForKey:@"ArtworkDeviceProductDescription"];

        if (v44)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {

            int v9 = (void *)v44;
LABEL_66:
            long long v11 = *(void **)(a1 + 40);
            id v12 = (void *)v44;
            goto LABEL_67;
          }
        }
        unsigned int v61 = sub_100068600();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
          sub_1000CEC54();
        }
        int v9 = (void *)v44;
      }
      else
      {
        unsigned int v61 = sub_100068600();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
          sub_1000CEC20();
        }
      }

      goto LABEL_21;
    }
    if (([(__CFString *)v5 isEqualToString:@"MSDDemoCarrierBundleID"] & 1) != 0
      || [(__CFString *)v5 isEqualToString:@"MSDDemoCarrierBundleVersion"])
    {
      uint64_t v45 = (void *)MGCopyAnswer();
      int v9 = v45;
      if (v45 && [v45 count])
      {
        uint64_t v46 = [v9 objectAtIndex:0];
        unsigned int v47 = [(__CFString *)v5 isEqualToString:@"MSDDemoCarrierBundleID"];
        uint64_t v48 = &kCFBundleIdentifierKey;
        if (!v47) {
          uint64_t v48 = &kCFBundleVersionKey;
        }
        uint64_t v49 = [v46 objectForKey:*v48];
        if (v49) {
          [*(id *)(a1 + 40) setObject:v49 forKey:v5];
        }
      }
      goto LABEL_22;
    }
    if ([(__CFString *)v5 isEqualToString:@"MSDHubSuppliedSettingsID"])
    {
      int v9 = [v4 hubSuppliedSettings];
      if (!v9) {
        goto LABEL_22;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_22;
      }
      uint64_t v51 = [v9 objectForKey:@"SettingsID"];
      id v23 = v51;
      if (!v51 || ![v51 length]) {
        goto LABEL_21;
      }
      uint64_t v24 = *(void **)(a1 + 40);
      CFStringRef v26 = @"SettingsID";
      goto LABEL_74;
    }
    if ([(__CFString *)v5 isEqualToString:@"MSDNetworkInterfacesEnabled"])
    {
      int v9 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [*(id *)(a1 + 32) fetchActiveNetworkInterface]);
      long long v11 = *(void **)(a1 + 40);
      CFStringRef v10 = @"MSDNetworkInterfacesEnabled";
      goto LABEL_4;
    }
    if ([(__CFString *)v5 isEqualToString:@"MSDCurrentWiFiSSID"])
    {
      uint64_t v52 = +[MSDWiFiHelper sharedInstance];
      int v9 = [v52 getCurrentWiFiSsid];

      if (!v9) {
        goto LABEL_22;
      }
      long long v11 = *(void **)(a1 + 40);
      CFStringRef v10 = @"MSDCurrentWiFiSSID";
      goto LABEL_4;
    }
    if ([(__CFString *)v5 isEqualToString:@"MSDPersistentWiFiSSID"])
    {
      uint64_t v53 = +[MSDWiFiHelper sharedInstance];
      int v9 = [v53 getPersistentWiFiSsid];

      if (!v9) {
        goto LABEL_22;
      }
      long long v11 = *(void **)(a1 + 40);
      CFStringRef v10 = @"MSDPersistentWiFiSSID";
      goto LABEL_4;
    }
    if ([(__CFString *)v5 isEqualToString:@"MSDCellularConfiguration"])
    {
      uint64_t v54 = +[MSDNPIMaskValues sharedInstance];
      unsigned int v55 = [v54 isNPIDevice];

      if (v55)
      {
        uint64_t v56 = +[MSDNPIMaskValues sharedInstance];
        uint64_t v57 = [v56 getMaskValueForKey:@"MSDCellularConfiguration"];

        if (v57)
        {
          objc_opt_class();
          uint64_t v18 = v57;
          if (objc_opt_isKindOfClass()) {
            goto LABEL_35;
          }
        }
      }
      else
      {
        uint64_t v57 = 0;
      }
      id v58 = +[MSDCellularHelper sharedInstance];
      uint64_t v18 = [v58 cellularInfo];

      if (!v18) {
        goto LABEL_23;
      }
      goto LABEL_35;
    }
    if ([(__CFString *)v5 isEqualToString:@"MinOSVersionAvailable"])
    {
      int v9 = [v4 minOSVersionAvailable];
      if (!v9) {
        goto LABEL_22;
      }
LABEL_111:
      long long v11 = *(void **)(a1 + 40);
      goto LABEL_40;
    }
    if ([(__CFString *)v5 isEqualToString:@"MSDApnsKey"])
    {
      uint64_t v59 = +[MSDPushNotificationHandler sharedInstance];
      uint64_t v60 = [v59 apsToken];
      goto LABEL_110;
    }
    if ([(__CFString *)v5 isEqualToString:@"MSDDemoSystemLanguage"])
    {
      uint64_t v59 = +[MSDLanguageAndRegionManager sharedInstance];
      uint64_t v60 = [v59 getCurrentDeviceLanguage];
      goto LABEL_110;
    }
    if ([(__CFString *)v5 isEqualToString:@"MSDDemoSystemRegion"])
    {
      uint64_t v59 = +[MSDLanguageAndRegionManager sharedInstance];
      uint64_t v60 = [v59 getCurrentDeviceRegion];
      goto LABEL_110;
    }
    if ([(__CFString *)v5 isEqualToString:@"MSDDemoPreferencesLanguage"])
    {
      uint64_t v59 = +[MSDLanguageAndRegionManager sharedInstance];
      uint64_t v60 = [v59 getDemoPreferencesLanguage];
      goto LABEL_110;
    }
    if ([(__CFString *)v5 isEqualToString:@"MSDDemoPreferencesRegion"])
    {
      uint64_t v59 = +[MSDLanguageAndRegionManager sharedInstance];
      uint64_t v60 = [v59 getDemoPreferencesRegion];
LABEL_110:
      int v9 = (void *)v60;

      if (!v9) {
        goto LABEL_22;
      }
      goto LABEL_111;
    }
    if ([(__CFString *)v5 isEqualToString:@"IdleDuration"])
    {
      int v62 = +[MSDSystemMonitor sharedInstance];
      id v63 = [v62 systemIdleDuration];

      uint64_t v37 = *(void **)(a1 + 40);
      uint64_t v38 = +[NSNumber numberWithUnsignedInteger:v63];
    }
    else
    {
      if (![(__CFString *)v5 isEqualToString:@"MSDTotalStorageAvailable"])
      {
        if ([(__CFString *)v5 isEqualToString:@"UniqueDeviceID"])
        {
          int v65 = *(void **)(a1 + 40);
          int v66 = [*(id *)(a1 + 32) udid];
          [v65 setObject:v66 forKey:v5];

          goto LABEL_23;
        }
        if ([(__CFString *)v5 isEqualToString:@"PairedDeviceInfo"])
        {
          int v9 = +[MSDPairedWatchProxy sharedInstance];
          if (![*(id *)(a1 + 32) isBetterTogetherDemo]
            || ![v9 paired])
          {
            goto LABEL_22;
          }
          id v23 = objc_alloc_init((Class)NSMutableDictionary);
          int v67 = [v9 udid];
          [v23 setObject:v67 forKey:@"UniqueDeviceID"];

          v68 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v9 reachable]);
          [v23 setObject:v68 forKey:@"IsReachable"];

          if (([v9 reachable] & 1) == 0)
          {
            v69 = [v9 lastSeenDate];

            if (v69)
            {
              unsigned int v70 = [v9 lastSeenDate];
              [v23 setObject:v70 forKey:@"LastSeenDate"];
            }
          }
          uint64_t v24 = *(void **)(a1 + 40);
          CFStringRef v26 = @"PairedDeviceInfo";
LABEL_74:
          id v25 = v23;
          goto LABEL_20;
        }
        if ([(__CFString *)v5 isEqualToString:@"xRyzf9zFE/ycr/wJPweZvQ"])
        {
          int v9 = (void *)MGCopyAnswer();
          if (!v9) {
            goto LABEL_22;
          }
          long long v11 = *(void **)(a1 + 40);
          CFStringRef v10 = @"InternationalMobileEquipmentIdentity2";
          goto LABEL_4;
        }
        unsigned int v71 = [(__CFString *)v5 isEqualToString:@"PartNumber"];
        char v72 = +[MSDNPIMaskValues sharedInstance];
        unsigned int v73 = [v72 isNPIDevice];

        if (v71)
        {
          if (v73)
          {
            uint64_t v74 = +[MSDNPIMaskValues sharedInstance];
            uint64_t v18 = [v74 getMaskValueForKey:v5];
          }
          else
          {
            uint64_t v74 = (void *)MGCopyAnswer();
            v76 = (void *)MGCopyAnswer();
            uint64_t v18 = [v74 stringByAppendingString:v76];
          }
          goto LABEL_35;
        }
        if (!v73
          || (+[MSDNPIMaskValues sharedInstance],
              v75 = objc_claimAutoreleasedReturnValue(),
              [v75 getMaskValueForKey:v5],
              int v9 = objc_claimAutoreleasedReturnValue(),
              v75,
              !v9))
        {
          int v9 = (void *)MGCopyAnswer();
          if (!v9) {
            goto LABEL_23;
          }
        }
        goto LABEL_111;
      }
      CFDictionaryRef v64 = (const __CFDictionary *)MGCopyAnswer();
      if (!v64) {
        goto LABEL_23;
      }
      uint64_t v77 = 0;
      sub_10004EB48(v64, kMGQDiskUsageTotalDataAvailable, &v77);
      uint64_t v37 = *(void **)(a1 + 40);
      uint64_t v38 = +[NSNumber numberWithLongLong:v77];
    }
LABEL_39:
    int v9 = (void *)v38;
    long long v11 = v37;
LABEL_40:
    id v12 = v9;
LABEL_67:
    CFStringRef v10 = v5;
    goto LABEL_5;
  }
LABEL_24:
}

CFNumberRef sub_10004EB48(const __CFDictionary *a1, const void *a2, void *a3)
{
  CFNumberRef result = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  if (result)
  {
    CFNumberRef v5 = result;
    CFTypeID v6 = CFGetTypeID(result);
    CFNumberRef result = (const __CFNumber *)CFNumberGetTypeID();
    if ((const __CFNumber *)v6 == result)
    {
      return (const __CFNumber *)CFNumberGetValue(v5, kCFNumberSInt64Type, a3);
    }
  }
  return result;
}

void sub_100051848(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 bundleIdentifier];
  int v4 = +[LSApplicationProxy applicationProxyForIdentifier:v3];

  if ([v4 isDeletable])
  {
    CFNumberRef v5 = *(void **)(a1 + 32);
    CFTypeID v6 = [v7 bundleIdentifier];
    [v5 addObject:v6];
  }
}

void sub_100051A74(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = *(void **)(a1 + 32);
  int v4 = [v10 bundleIdentifier];
  LODWORD(v3) = [v3 containsObject:v4];

  CFNumberRef v5 = v10;
  if (v3)
  {
    CFTypeID v6 = [v10 bundleIdentifier];
    id v7 = +[LSApplicationProxy applicationProxyForIdentifier:v6];

    if ([v7 isInstalled] && (objc_msgSend(v7, "isPlaceholder") & 1) == 0)
    {
      long long v8 = *(void **)(a1 + 40);
      int v9 = [v10 bundleIdentifier];
      [v8 addObject:v9];
    }
    CFNumberRef v5 = v10;
  }
}

void sub_100051EFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100051F38(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(void **)(a1 + 32);
  CFNumberRef v5 = [v3 bundleIdentifier];
  LODWORD(v4) = [v4 containsObject:v5];

  if (v4)
  {
    CFTypeID v6 = [v3 bundleIdentifier];
    id v7 = +[LSApplicationProxy applicationProxyForIdentifier:v6];

    if ([v7 isInstalled] && (objc_msgSend(v7, "isPlaceholder") & 1) == 0)
    {
      long long v8 = *(void **)(a1 + 32);
      int v9 = [v3 bundleIdentifier];
      [v8 removeObject:v9];

      id v10 = sub_100068600();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        long long v11 = [v3 bundleIdentifier];
        int v12 = 138543362;
        uint64_t v13 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "System app %{public}@ has been installed.", (uint8_t *)&v12, 0xCu);
      }
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    }
  }
}

id sub_100053934(uint64_t a1)
{
  id v2 = +[MSDStoreHoursManager sharedInstance];
  [v2 evaluateStoreStatusAgainstCurrentTime];

  id v3 = +[MSDStoreHoursManager sharedInstance];
  [v3 setupStoreOpenCloseTimers];

  id result = [*(id *)(a1 + 32) isContentFrozen];
  if (result)
  {
    CFNumberRef v5 = *(void **)(a1 + 32);
    return [v5 setupSnapshotRevertTimer];
  }
  return result;
}

id sub_1000539C0(uint64_t a1)
{
  return _[*(id *)(a1 + 32) handleStoreOpenNotification];
}

id sub_1000539C8(uint64_t a1)
{
  return _[*(id *)(a1 + 32) handleStoreClosedNotification];
}

void sub_100053A20(id a1)
{
  uint64_t v1 = sub_100068600();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "It's time to submit CoreAnalytics logs!", v4, 2u);
  }

  id v2 = +[MSDAnalytics sharedInstance];
  [v2 rollOverCoreAnalyticsLogs];

  id v3 = +[MSDAnalytics sharedInstance];
  [v3 uploadCoreAnalyticsLogs];
}

void sub_100053B60(uint64_t a1)
{
  id v2 = +[NSDate dateWithTimeIntervalSinceNow:30.0];
  id v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v3);
  CFNumberRef v5 = [WeakRetained caLogsUploadTimer];

  if (v5)
  {
    id v6 = objc_loadWeakRetained(v3);
    id v7 = [v6 caLogsUploadTimer];
    [v7 invalidate];

    id v8 = objc_loadWeakRetained(v3);
    [v8 setCaLogsUploadTimer:0];
  }
  if (os_variant_has_internal_content())
  {
    int v9 = +[MSDTestPreferences sharedInstance];
    [v9 caLogsUploadInterval];
    double v11 = v10;

    if (v11 <= 0.0) {
      double v11 = 7200.0;
    }
  }
  else
  {
    double v11 = 7200.0;
  }
  int v12 = sub_100068600();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 134217984;
    double v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "CoreAnalytics logs upload timer interval set to: %f (seconds)", (uint8_t *)&v20, 0xCu);
  }

  id v13 = objc_alloc((Class)NSTimer);
  id v14 = objc_loadWeakRetained(v3);
  id v15 = [v13 initWithFireDate:v2 interval:v14 target:"caLogsUploadTimerHandler:" selector:0 userInfo:1 repeats:v11];
  id v16 = objc_loadWeakRetained(v3);
  [v16 setCaLogsUploadTimer:v15];

  uint64_t v17 = +[NSRunLoop currentRunLoop];
  id v18 = objc_loadWeakRetained(v3);
  uint64_t v19 = [v18 caLogsUploadTimer];
  [v17 addTimer:v19 forMode:NSDefaultRunLoopMode];
}

void sub_100053E78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100053E8C(uint64_t a1)
{
  id v2 = sub_100068600();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "It's time for snapshot revert!", v12, 2u);
  }

  id v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v3);
  if (([WeakRetained isBetterTogetherDemo] & 1) == 0)
  {

LABEL_10:
    id v11 = objc_loadWeakRetained(v3);
    [v11 revertSnapshot];
    goto LABEL_11;
  }
  CFNumberRef v5 = +[MSDPairedWatchProxy sharedInstance];
  unsigned int v6 = [v5 paired];

  if (!v6) {
    goto LABEL_10;
  }
  id v7 = +[MSDPairedWatchProxy sharedInstance];
  unsigned __int8 v8 = [v7 revertSnapshot];

  if (v8) {
    goto LABEL_10;
  }
  int v9 = sub_100068600();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_1000CF674();
  }

  id v10 = objc_loadWeakRetained(v3);
  [v10 saveOperationRequest:@"Restart" requestFlag:0 completeBy:0];

  id v11 = objc_loadWeakRetained(v3);
  [v11 reboot];
LABEL_11:
}

void sub_100054084(uint64_t a1)
{
  id v2 = +[MSDStoreHoursManager sharedInstance];
  id v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  CFNumberRef v5 = [WeakRetained snapshotRevertTimer];

  if (v5)
  {
    id v6 = objc_loadWeakRetained(v3);
    id v7 = [v6 snapshotRevertTimer];
    [v7 invalidate];

    id v8 = objc_loadWeakRetained(v3);
    [v8 setSnapshotRevertTimer:0];
  }
  id v9 = objc_loadWeakRetained(v3);
  unsigned int v10 = [v9 allowSnapshotRevertTimer];

  if (v10)
  {
    id v11 = [v2 nextContentRevertDate];
    int v12 = +[NSDate distantFuture];
    unsigned int v13 = [v11 isEqualToDate:v12];

    if (v13)
    {
      id v14 = sub_100068600();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Disable snapshot revert timer for the near future.", (uint8_t *)&v23, 2u);
      }
    }
    else
    {
      id v15 = objc_alloc((Class)NSTimer);
      id v16 = objc_loadWeakRetained(v3);
      id v17 = [v15 initWithFireDate:v11 interval:v16 target:"snapshotRevertTimerHandler:" selector:0 userInfo:0 repeats:0.0];
      id v18 = objc_loadWeakRetained(v3);
      [v18 setSnapshotRevertTimer:v17];

      uint64_t v19 = +[NSRunLoop currentRunLoop];
      id v20 = objc_loadWeakRetained(v3);
      double v21 = [v20 snapshotRevertTimer];
      [v19 addTimer:v21 forMode:NSDefaultRunLoopMode];

      id v14 = sub_100068600();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = [v11 toString];
        int v23 = 138543362;
        uint64_t v24 = v22;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Periodic snapshot revert timer scheduled: %{public}@", (uint8_t *)&v23, 0xCu);
      }
    }
  }
}

void sub_1000547A0(id a1, OS_xpc_object *a2)
{
  id v2 = a2;
  if (xpc_activity_get_state(v2) == 2)
  {
    id v3 = sub_100068600();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_1000CF7C8();
    }

    int v4 = +[MSDAnalyticsEventHandler sharedInstance];
    [v4 sendHeartbeatEvent];

    xpc_activity_set_state(v2, 5);
  }
}

id sub_100054E54(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) waitForCommandTimer];
  [v2 invalidate];

  id v3 = *(void **)(a1 + 32);

  return [v3 setWaitForCommandTimer:0];
}

void sub_100054F18(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100054FC0;
  v3[3] = &unk_100152CF0;
  v3[4] = *(void *)(a1 + 32);
  id v2 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v3 block:300.0];
  [*(id *)(a1 + 32) setWaitForCommandTimer:v2];
}

void sub_100054FC0(uint64_t a1)
{
  id v2 = sub_100068600();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Didn't receive a valid command within given time, go to demo mode now.", v4, 2u);
  }

  [*(id *)(a1 + 32) setWaitingForCommand:0];
  [*(id *)(a1 + 32) setWaitForCommandTimer:0];
  id v3 = +[MSDPairedWatchProxy sharedInstance];
  if ([*(id *)(a1 + 32) isBetterTogetherDemo] && objc_msgSend(v3, "paired")) {
    [v3 lockSnapshot];
  }
  [*(id *)(a1 + 32) lockSnapshot];
}

intptr_t sub_100055364(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100055408(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100055D20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t sub_100055D6C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100055D7C(uint64_t a1)
{
}

id sub_100055D84(void *a1)
{
  [*(id *)(*(void *)(a1[4] + 8) + 40) lock];
  *(void *)(*(void *)(a1[5] + 8) + 24) = [*(id *)(*(void *)(a1[6] + 8) + 40) fetchActiveNetworkInterface];
  id v2 = sub_100068600();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1[5] + 8) + 24);
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Found active network interfaces: %lu", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(*(void *)(a1[4] + 8) + 40) signal];
  return [*(id *)(*(void *)(a1[4] + 8) + 40) unlock];
}

void sub_100055F70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100055F90(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  if (nw_path_get_status(*(nw_path_t *)(a1 + 32)) == nw_path_status_satisfied)
  {
    unsigned __int32 v4 = nw_interface_get_type(v3) - 1;
    if (v4 <= 2) {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= qword_100102760[v4];
    }
  }

  return 1;
}

CFStringRef sub_100059930(unsigned __int8 *a1)
{
  snprintf(__str, 0x64uLL, "%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x", *a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15],
    a1[16],
    a1[17],
    a1[18],
    a1[19]);
  return CFStringCreateWithCString(kCFAllocatorDefault, __str, 0x8000100u);
}

unsigned __int8 *sub_100059A30(uint64_t a1, const __CFString *a2, const __CFString *a3)
{
  unsigned __int32 v4 = sub_100059A94(a2);
  int v5 = v4;
  if (v4)
  {
    unsigned __int32 v4 = sub_100059A94(a3);
    if (v4)
    {
      for (uint64_t i = 0; i != 20; ++i)
        v5[i] ^= v4[i];
    }
  }
  free(v4);
  return v5;
}

unsigned __int8 *sub_100059A94(const __CFString *a1)
{
  if (!a1) {
    return 0;
  }
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 == CFBooleanGetTypeID())
  {
    uint64_t v3 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0x6A69C61BuLL);
    LOBYTE(c.h0) = CFBooleanGetValue((CFBooleanRef)a1);
    p_CC_SHA1_CTX c = &c;
    CC_LONG Length = 1;
LABEL_10:
    CC_SHA1(p_c, Length, v3);
    return v3;
  }
  if (v2 == CFStringGetTypeID())
  {
    uint64_t v3 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0x877E83E2uLL);
    size_t v6 = CFStringGetLength(a1) + 1;
    id v7 = (char *)malloc_type_calloc(1uLL, v6, 0x9DED1793uLL);
    CFStringGetCString(a1, v7, v6, 0x8000100u);
    CC_SHA1(v7, v6, v3);
    free(v7);
    return v3;
  }
  if (v2 == CFDateGetTypeID())
  {
    uint64_t v3 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0xEAF147E6uLL);
    *(void *)&c.h0 = CFDateGetAbsoluteTime((CFDateRef)a1);
    p_CC_SHA1_CTX c = &c;
    CC_LONG Length = 8;
    goto LABEL_10;
  }
  if (v2 == CFDataGetTypeID())
  {
    uint64_t v3 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0x1991A161uLL);
    BytePtr = CFDataGetBytePtr((CFDataRef)a1);
    CC_LONG Length = CFDataGetLength((CFDataRef)a1);
    p_CC_SHA1_CTX c = (CC_SHA1_CTX *)BytePtr;
    goto LABEL_10;
  }
  if (v2 == CFArrayGetTypeID())
  {
    if (CFArrayGetCount((CFArrayRef)a1))
    {
      memset(&c, 0, sizeof(c));
      if (!sub_10005A348((const __CFArray *)a1))
      {
        uint64_t v3 = (unsigned __int8 *)sub_100059A94(@"array");
        CC_SHA1_Init(&c);
        if (CFArrayGetCount((CFArrayRef)a1) >= 1)
        {
          CFIndex v11 = 0;
          do
          {
            ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a1, v11);
            unsigned int v13 = (unsigned __int8 *)sub_100059A94(ValueAtIndex);
            if (!v13) {
              break;
            }
            id v14 = v13;
            CC_SHA1_Update(&c, v13, 0x14u);
            CC_SHA1_Final(v14, &c);
            if (v3)
            {
              for (uint64_t i = 0; i != 20; ++i)
                v3[i] ^= v14[i];
            }
            free(v14);
            ++v11;
          }
          while (CFArrayGetCount((CFArrayRef)a1) > v11);
        }
        return v3;
      }
      id v9 = sub_100068600();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Failing to hash due to duplicate array entries", v16, 2u);
      }
    }
    return 0;
  }
  if (v2 == CFDictionaryGetTypeID())
  {
    return (unsigned __int8 *)sub_10005A100((const __CFDictionary *)a1);
  }
  if (v2 != CFNumberGetTypeID()) {
    return 0;
  }

  return sub_10005A280((const __CFNumber *)a1);
}

CFDataRef sub_100059DA0(const __CFAllocator *a1, const __CFString *a2, CFStringRef theString1, uint64_t a4, void (*a5)(uint64_t, double, float), uint64_t a6)
{
  memset(&c, 0, sizeof(c));
  if (CFEqual(theString1, @"SHA-1"))
  {
    CFURLRef v20 = CFURLCreateWithFileSystemPath(a1, a2, kCFURLPOSIXPathStyle, 0);
    if (!v20)
    {
      CFIndex v11 = sub_100068600();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1000CFFAC((uint64_t)a2, v11);
      }
      goto LABEL_4;
    }
    CFURLRef v21 = v20;
    uint64_t v22 = CFReadStreamCreateWithFile(a1, v20);
    if (!v22)
    {
      uint64_t v33 = sub_100068600();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        sub_1000D0024();
      }

      CFDataRef v19 = 0;
      goto LABEL_40;
    }
    int v23 = v22;
    if (CFReadStreamOpen(v22))
    {
      if (a5) {
        a5(a6, 0.0, -1.0);
      }
      CC_SHA1_Init(&c);
      uint64_t v24 = (UInt8 *)malloc_type_calloc(1uLL, 0x10000uLL, 0x49093F70uLL);
      if (v24)
      {
        id v25 = v24;
        v52.tv_seCC_SHA1_CTX c = 0;
        *(void *)&v52.tv_useCC_SHA1_CTX c = 0;
        gettimeofday(&v52, 0);
        CFIndex v26 = CFReadStreamRead(v23, v25, 0x10000);
        if (v26 < 1)
        {
LABEL_18:
          CC_SHA1_Final(md, &c);
          CFDataRef v31 = CFDataCreate(a1, md, 20);
          if (v31)
          {
            CFDataRef v19 = v31;
            CFStringRef v32 = sub_100059930(md);
            if (v32) {
              CFRelease(v32);
            }
            if (a5) {
              a5(a6, 1.0, -1.0);
            }
            goto LABEL_38;
          }
          unsigned int v42 = sub_100068600();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
            sub_1000D012C(v42, v43, v44, v45, v46, v47, v48, v49);
          }
        }
        else
        {
          CFIndex v27 = v26;
          uint64_t v28 = 0;
          while (1)
          {
            CC_SHA1_Update(&c, v25, v27);
            v28 += v27;
            v29.n128_u32[0] = -1.0;
            if (a4) {
              v29.n128_f32[0] = (float)v28 / (float)a4;
            }
            if (a5)
            {
              int v30 = ((uint64_t (*)(uint64_t, __n128, float))a5)(a6, v29, -1.0);
              if (v30) {
                break;
              }
            }
            CFIndex v27 = CFReadStreamRead(v23, v25, 0x10000);
            if (v27 <= 0) {
              goto LABEL_18;
            }
          }
          int v50 = v30;
          unsigned int v42 = sub_100068600();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
            sub_1000D0164(v50, v42);
          }
        }

        CFDataRef v19 = 0;
LABEL_38:
        free(v25);
        goto LABEL_39;
      }
      unsigned __int8 v34 = sub_100068600();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        sub_1000D00F4(v34, v35, v36, v37, v38, v39, v40, v41);
      }
    }
    else
    {
      unsigned __int8 v34 = sub_100068600();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        sub_1000D008C();
      }
    }

    CFDataRef v19 = 0;
LABEL_39:
    CFReadStreamClose(v23);
    CFRelease(v23);
LABEL_40:
    CFRelease(v21);
    return v19;
  }
  CFIndex v11 = sub_100068600();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_1000D01DC(v11, v12, v13, v14, v15, v16, v17, v18);
  }
LABEL_4:

  return 0;
}

uint64_t sub_10005A100(const __CFDictionary *a1)
{
  if (!CFDictionaryGetCount(a1)) {
    return 0;
  }
  memset(&v12, 0, sizeof(v12));
  uint64_t v2 = sub_100059A94(@"dictionary");
  int64_t Count = CFDictionaryGetCount(a1);
  unsigned __int32 v4 = (const void **)malloc_type_calloc(Count, 8uLL, 0x6004044C4A2DFuLL);
  CFDictionaryGetKeysAndValues(a1, v4, 0);
  if (Count >= 1)
  {
    for (uint64_t i = 0; i != Count; ++i)
    {
      size_t v6 = (void *)sub_100059A94(v4[i]);
      Value = CFDictionaryGetValue(a1, v4[i]);
      id v8 = (void *)sub_100059A94(Value);
      CC_SHA1_Init(&v12);
      id v9 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0x663AA81CuLL);
      if (v6)
      {
        CC_SHA1_Update(&v12, v6, 0x14u);
        free(v6);
      }
      if (v8)
      {
        CC_SHA1_Update(&v12, v8, 0x14u);
        free(v8);
      }
      CC_SHA1_Final(v9, &v12);
      if (v2 && v9)
      {
        for (uint64_t j = 0; j != 20; ++j)
          *(unsigned char *)(v2 + j) ^= v9[j];
      }
      free(v9);
    }
  }
  free(v4);
  return v2;
}

unsigned __int8 *sub_10005A280(const __CFNumber *a1)
{
  uint64_t v2 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0xFF7F1A96uLL);
  uint64_t valuePtr = 0;
  CFNumberGetValue(a1, kCFNumberSInt64Type, &valuePtr);
  if ((unint64_t)(valuePtr + 1) >= 0xE) {
    size_t v3 = 8;
  }
  else {
    size_t v3 = 4;
  }
  if ((unint64_t)(valuePtr + 1) < 0xE) {
    CFNumberType v4 = kCFNumberSInt32Type;
  }
  else {
    CFNumberType v4 = kCFNumberSInt64Type;
  }
  int v5 = malloc_type_calloc(1uLL, v3, 0xD98972E9uLL);
  CFNumberGetValue(a1, v4, v5);
  CC_SHA1(v5, v3, v2);
  free(v5);
  return v2;
}

uint64_t sub_10005A348(const __CFArray *a1)
{
  CFIndex Count = CFArrayGetCount(a1);
  if (Count < 1) {
    return 0;
  }
  CFIndex v3 = Count;
  CFIndex v4 = 0;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(a1, v4);
    v7.location = 0;
    v7.length = v3;
    if (CFArrayGetCountOfValue(a1, v7, ValueAtIndex) >= 2) {
      break;
    }
    if (v3 == ++v4) {
      return 0;
    }
  }
  return 1;
}

intptr_t sub_10005A57C(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10005A83C(id a1)
{
  uint64_t v1 = objc_alloc_init(MSDFindMyHub);
  uint64_t v2 = (void *)qword_100189A40;
  qword_100189A40 = (uint64_t)v1;

  CFIndex v3 = +[MSDTargetDevice sharedInstance];
  [(id)qword_100189A40 setDevice:v3];

  id v4 = (id)objc_opt_new();
  [(id)qword_100189A40 setStoresSearched:v4];
}

void sub_10005B568(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 error];
  id v5 = [v3 eligible];
  id v6 = [v3 showUI];

  if (!v4)
  {
    CFRange v7 = sub_100068600();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109120;
      v11[1] = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Successfully checked in device to DU; saving device eligibility: %d",
        (uint8_t *)v11,
        8u);
    }

    id v8 = +[MSDPreferencesFile sharedInstance];
    id v9 = +[NSNumber numberWithBool:v5];
    [v8 setObject:v9 forKey:@"DemoEligible"];
  }
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, id, id, void *))(v10 + 16))(v10, v5, v6, v4);
  }
}

void sub_10005B860(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

void sub_10005BB70(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    id v5 = [v3 data];
    id v4 = [v3 error];

    (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
  }
}

void sub_10005BCDC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10005BEB8(uint64_t a1)
{
  uint64_t v2 = sub_100068600();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Cellular plan did change, retrying enrollment in Offline Mode", v4, 2u);
  }

  return [*(id *)(a1 + 32) handleEnrollmentRetryUponFirstLaunch];
}

void sub_10005C3B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

uint64_t sub_10005C3F0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10005C400(uint64_t a1)
{
}

void sub_10005C408(uint64_t a1, char a2, int a3, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v7 = obj;
  **(unsigned char **)(a1 + 48) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void sub_10005D034(uint64_t a1)
{
  uint64_t v2 = sub_100068600();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) toString];
    int v4 = *(unsigned __int8 *)(a1 + 48);
    int v18 = 138543618;
    CFDataRef v19 = v3;
    __int16 v20 = 1026;
    int v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "FMH retry timer scheduled: %{public}@, isFirstLaunch: %{public, BOOL}d", (uint8_t *)&v18, 0x12u);
  }
  uint64_t v5 = [*(id *)(a1 + 40) retryTimer];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [*(id *)(a1 + 40) retryTimer];
    unsigned int v8 = [v7 isValid];

    if (v8)
    {
      id v9 = [*(id *)(a1 + 40) retryTimer];
      [v9 invalidate];

      [*(id *)(a1 + 40) setRetryTimer:0];
    }
  }
  id v10 = objc_alloc((Class)NSTimer);
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v13 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  uint64_t v14 = +[NSDictionary dictionaryWithObject:v13 forKey:@"isFirstLaunch"];
  id v15 = [v10 initWithFireDate:v11 interval:v12 target:"handleRetryTimerFireForEnrollment:" selector:v14 userInfo:0 repeats:0.0];
  [*(id *)(a1 + 40) setRetryTimer:v15];

  uint64_t v16 = +[NSRunLoop currentRunLoop];
  uint64_t v17 = [*(id *)(a1 + 40) retryTimer];
  [v16 addTimer:v17 forMode:NSDefaultRunLoopMode];
}

id sub_10005D328(uint64_t a1)
{
  return [*(id *)(a1 + 32) retryEnrollmentWithHub:*(unsigned __int8 *)(a1 + 40)];
}

void sub_10005D61C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10005E050(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10005E20C(id a1)
{
  uint64_t v1 = objc_alloc_init(MSDDeviceDataCollector);
  uint64_t v2 = (void *)qword_100189A50;
  qword_100189A50 = (uint64_t)v1;

  id v4 = +[NSUUID UUID];
  id v3 = [v4 UUIDString];
  [(id)qword_100189A50 setSessionUUID:v3];
}

void sub_10005E304(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10005E540(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10005E7C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10005E7E4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100068600();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000D0764((uint64_t)v3, v4);
  }

  uint64_t v17 = [v3 objectForKeyedSubscript:@"bundleID"];
  uint64_t v5 = [v3 objectForKeyedSubscript:@"executableName"];
  id v6 = *(void **)(a1 + 32);
  id v7 = [v3 objectForKeyedSubscript:@"sessionStartTime"];
  unsigned int v8 = [v6 stringFromDate:v7];

  id v9 = [v3 objectForKeyedSubscript:@"sessionEndTime"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [*(id *)(a1 + 32) stringFromDate:v9];
  }
  else
  {
    id v10 = @"<NOT_SET>";
  }
  uint64_t v11 = [v3 objectForKeyedSubscript:@"appDuration"];
  uint64_t v12 = +[MSDAnalyticsEventHandler sharedInstance];
  uint64_t v13 = *(void *)(a1 + 56);
  uint64_t v14 = *(void *)(a1 + 40);
  uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v16 = *(void *)(v15 + 24);
  *(void *)(v15 + 24) = v16 + 1;
  [v11 doubleValue];
  [v12 sendAppUsageDataEvent:v17 withExecutable:v5 sessionUUID:v14 sessionStart:v8 sessionEnd:v10 sessionDuration:v13 appOrder:v16];
}

void sub_10005F220(id a1)
{
  uint64_t v1 = [MSDNPIMaskValues alloc];
  id v4 = +[MSDPreferencesFile sharedInstance];
  uint64_t v2 = [(MSDNPIMaskValues *)v1 initWithPreferencesFile:v4];
  id v3 = (void *)qword_100189A60;
  qword_100189A60 = (uint64_t)v2;
}

void sub_100061520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&a69, 8);
  _Block_object_dispose(&STACK[0x210], 8);
  _Block_object_dispose(&STACK[0x240], 8);
  _Block_object_dispose(&STACK[0x270], 8);
  _Block_object_dispose(&STACK[0x2A0], 8);
  _Block_object_dispose(&STACK[0x2C0], 8);
  _Block_object_dispose(&STACK[0x2E0], 8);
  _Block_object_dispose(&STACK[0x310], 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100061610(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100061620(uint64_t a1)
{
}

void sub_100061628(void *a1, uint64_t a2)
{
  id v3 = [*(id *)(*(void *)(a1[4] + 8) + 40) objectAtIndex:a2];
  id v4 = [*(id *)(*(void *)(a1[5] + 8) + 40) objectForKey:v3];
  uint64_t v5 = *(void **)(*(void *)(a1[6] + 8) + 40);
  uint64_t v6 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v6 + 40);
  unsigned __int8 v7 = [v5 createSymbolicLinkAtPath:v3 withDestinationPath:v4 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  if ((v7 & 1) == 0)
  {
    unsigned int v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [*(id *)(*(void *)(a1[7] + 8) + 40) localizedDescription];
      *(_DWORD *)buf = 138543874;
      uint64_t v12 = v3;
      __int16 v13 = 2114;
      uint64_t v14 = v4;
      __int16 v15 = 2114;
      uint64_t v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Could not create link from %{public}@ to %{public}@ - %{public}@", buf, 0x20u);
    }
    *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = 0;
  }
}

void sub_100061798(void *a1, uint64_t a2)
{
  id v3 = [*(id *)(*(void *)(a1[4] + 8) + 40) objectAtIndex:a2];
  id v4 = [*(id *)(*(void *)(a1[5] + 8) + 40) objectForKey:v3];
  if ([v4 isEqualToString:@"ZERO_SIZE"])
  {
    if (([*(id *)(*(void *)(a1[6] + 8) + 40) createFileAtPath:v3 contents:0 attributes:0] & 1) == 0)
    {
      uint64_t v5 = +[NSError errorDomainMSDWithCode:3727740944 message:@"Cannot write file."];
      uint64_t v6 = *(void *)(a1[7] + 8);
      unsigned __int8 v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;

      unsigned int v8 = sub_100068600();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138543362;
        __int16 v13 = v3;
        id v9 = "Could not create empty file at %{public}@";
        id v10 = v8;
        uint32_t v11 = 12;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, v11);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
  }
  else if (([*(id *)(*(void *)(a1[8] + 8) + 40) copyFileIfPresentInCache:v4 toLocation:v3 verifyHash:*(unsigned __int8 *)(*(void *)(a1[9] + 8) + 24)] & 1) == 0)
  {
    unsigned int v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543618;
      __int16 v13 = v4;
      __int16 v14 = 2114;
      __int16 v15 = v3;
      id v9 = "Could not copy file %{public}@ from content cache to %{public}@";
      id v10 = v8;
      uint32_t v11 = 22;
      goto LABEL_9;
    }
LABEL_10:

    *(unsigned char *)(*(void *)(a1[10] + 8) + 24) = 0;
  }
}

uint64_t sub_100064394(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return 1;
}

BOOL sub_100064D7C(id a1, NSURL *a2, NSError *a3)
{
  id v4 = a2;
  uint64_t v5 = a3;
  uint64_t v6 = sub_100068600();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v7 = [(NSURL *)v4 path];
    int v9 = 136315906;
    id v10 = "-[MSDManifest enumerateAndCollectMetaData:relativeTo:skip:superSet:handler:]_block_invoke";
    __int16 v11 = 2114;
    int v12 = v7;
    __int16 v13 = 2114;
    __int16 v14 = v4;
    __int16 v15 = 2114;
    uint64_t v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: Could not enumerate %{public}@, url=%{public}@, error=%{public}@", (uint8_t *)&v9, 0x2Au);
  }
  return 1;
}

id sub_100065444(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _updateFDCforRequest:*(void *)(a1 + 40)];
}

void sub_100065CC4(uint64_t a1)
{
  if ((uint64_t)[*(id *)(a1 + 32) downloadedSize] >= 1)
  {
    uint64_t v2 = [*(id *)(a1 + 32) downloadSource];

    if (v2)
    {
      id v3 = [*(id *)(a1 + 32) downloadSource];
      unsigned int v4 = [v3 isEqualToString:@"localCachingHub"];
      uint64_t v5 = @"remote";
      if (v4) {
        uint64_t v5 = @"local";
      }
      uint64_t v6 = v5;

      unsigned __int8 v7 = +[MSDProgressUpdater sharedInstance];
      id v8 = [v7 bundleInProgress];

      [v8 updateDownloadedContent:[*(id *)(a1 + 32) downloadedSize] fromSource:v6];
    }
  }
}

id sub_100065DC4(id *a1)
{
  uint64_t v2 = sub_100068600();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [a1[4] fileInfo];
    unsigned int v4 = [v3 fileHash];
    int v11 = 138543362;
    int v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Attempting to download file again: %{public}@", (uint8_t *)&v11, 0xCu);
  }
  uint64_t v5 = sub_1000687C8();
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  unsigned __int8 v7 = (char *)[WeakRetained signpostId];

  if ((unint64_t)(v7 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    id v8 = [a1[4] fileInfo];
    int v9 = [v8 fileHash];
    int v11 = 138412290;
    int v12 = v9;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_EVENT, (os_signpost_id_t)v7, "Retry File Download", "File download retry: %{xcode:string}@", (uint8_t *)&v11, 0xCu);
  }
  [a1[4] setRetryCount:[a1[4] retryCount] - 1];
  return [a1[5] _dispatchRequest:a1[4]];
}

void sub_100066608(id a1)
{
  uint64_t v1 = objc_alloc_init(MSDTestPreferences);
  uint64_t v2 = qword_100189A78;
  qword_100189A78 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_100067650(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_100067664(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _activate];
}

void sub_10006775C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_100067770(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _deactivate];
}

void sub_100067C54(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 64));
  _Unwind_Resume(a1);
}

void sub_100067CA0(id a1)
{
  uint64_t v1 = sub_100068600();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    sub_1000D1714(v1, v2, v3, v4, v5, v6, v7, v8);
  }
}

void sub_100067CE4(id a1)
{
  uint64_t v1 = sub_100068600();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "MSDRapportDeviceAdvertiser: XPC connection to RPCompanionLinkClient invalidated!", v2, 2u);
  }
}

void sub_100067D4C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleLocalDeviceUpdated];
}

void sub_100067D8C(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleRPCompanionClientActivateCompletionWithError:v3];
}

void sub_100067DE8(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_1000D174C(v2);
  }
}

void sub_100067E3C(id a1)
{
  uint64_t v1 = sub_100068600();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    sub_1000D17D4(v1, v2, v3, v4, v5, v6, v7, v8);
  }
}

void sub_100067E80(id a1)
{
  uint64_t v1 = sub_100068600();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    sub_1000D180C(v1, v2, v3, v4, v5, v6, v7, v8);
  }
}

void sub_100067EC4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _handleShowPassword:v5 withFlags:a2];
}

void sub_100067F30(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleHidePasswordWithFlags:a2];
}

id sub_100068600()
{
  if (qword_100189A90 != -1) {
    dispatch_once(&qword_100189A90, &stru_100153078);
  }
  v0 = (void *)qword_100189A88;

  return v0;
}

void sub_100068654(id a1)
{
  os_log_t v1 = os_log_create("com.apple.MobileStoreDemo", "Default");
  uint64_t v2 = qword_100189A88;
  qword_100189A88 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

id sub_100068698()
{
  if (qword_100189AA0 != -1) {
    dispatch_once(&qword_100189AA0, &stru_100153098);
  }
  v0 = (void *)qword_100189A98;

  return v0;
}

void sub_1000686EC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.MobileStoreDemo", "ScreenSaver");
  uint64_t v2 = qword_100189A98;
  qword_100189A98 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

id sub_100068730()
{
  if (qword_100189AB0 != -1) {
    dispatch_once(&qword_100189AB0, &stru_1001530B8);
  }
  v0 = (void *)qword_100189AA8;

  return v0;
}

void sub_100068784(id a1)
{
  os_log_t v1 = os_log_create("com.apple.MobileStoreDemo", "Message");
  uint64_t v2 = qword_100189AA8;
  qword_100189AA8 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

id sub_1000687C8()
{
  if (qword_100189AC0 != -1) {
    dispatch_once(&qword_100189AC0, &stru_1001530D8);
  }
  v0 = (void *)qword_100189AB8;

  return v0;
}

void sub_10006881C(id a1)
{
  if (os_variant_has_internal_content())
  {
    os_log_t v1 = os_log_create("com.apple.MobileStoreDemo", "Signpost");
  }
  else
  {
    os_log_t v1 = (os_log_t)&_os_log_disabled;
    id v2 = &_os_log_disabled;
  }
  uint64_t v3 = (void *)qword_100189AB8;
  qword_100189AB8 = (uint64_t)v1;
}

void sub_10006888C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = a1;
  id v10 = +[MSDLogModel sharedInstance];
  [v10 logWithFormat:v9 andArgs:&a9];
}

void sub_100068940(id a1)
{
  os_log_t v1 = objc_alloc_init(MSDLogModel);
  uint64_t v2 = qword_100189AC8;
  qword_100189AC8 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_100068B18(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100068ED8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100068EF0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100068F00(uint64_t a1)
{
}

void sub_100068F08(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v14 = [*(id *)(a1 + 32) stringByAppendingFormat:@"/%@", a2];
  uint64_t v6 = [*(id *)(a1 + 40) description];
  NSLog(@"Checking existing log file (full path) %@ against %@", v14, v6);

  uint64_t v7 = [*(id *)(a1 + 48) attributesOfItemAtPath:v14 error:0];
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  id v10 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fileCreationDate];
  id v11 = [v10 compare:*(void *)(a1 + 40)];

  if (v11 == (id)-1)
  {
    int v12 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fileCreationDate];
    __int16 v13 = [v12 description];
    NSLog(@"Removing %@ whose creation date is %@.", v14, v13);

    [*(id *)(a1 + 48) removeItemAtPath:v14 error:0];
  }
  *a4 = 0;
}

void sub_1000691E0(id a1)
{
  os_log_t v1 = objc_alloc_init(MSDMailProcessor);
  uint64_t v2 = qword_100189AD8;
  qword_100189AD8 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_10006968C(uint64_t a1)
{
  os_log_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = [WeakRetained pingTimer];

  if (v3)
  {
    id v4 = objc_loadWeakRetained(v1);
    id v5 = [v4 pingTimer];
    [v5 invalidate];
  }
  id v10 = objc_loadWeakRetained(v1);
  double v6 = (double)(unint64_t)[v10 pingInterval];
  id v7 = objc_loadWeakRetained(v1);
  uint64_t v8 = +[NSTimer scheduledTimerWithTimeInterval:v7 target:"handlePingTimerTicking:" selector:0 userInfo:1 repeats:v6];
  id v9 = objc_loadWeakRetained(v1);
  [v9 setPingTimer:v8];
}

void sub_1000699E8(uint64_t a1)
{
  id v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  id v4 = sub_100068730();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Ping and process command (if any)", buf, 2u);
  }

  id v5 = [*(id *)(a1 + 32) pingWithType:*(void *)(a1 + 40)];
  if (v5)
  {
    double v6 = sub_100068730();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received a request: %{public}@", buf, 0xCu);
    }

    id v7 = +[MSDWorkQueueSet sharedInstance];
    uint64_t v8 = [v7 messageQueue];
    id v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    id v11 = sub_100069BFC;
    int v12 = &unk_1001520B0;
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = v5;
    dispatch_async(v8, &v9);
  }
  [*(id *)(a1 + 32) setQueuedPingType:((*(id *)(a1 + 32)) queuedPingType:v9, v10, v11, v12, v13) & ~*(void *)(a1 + 40)];

  objc_sync_exit(v3);
}

void sub_100069BD8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100069BFC(uint64_t a1)
{
  [*(id *)(a1 + 32) processRequest:*(void *)(a1 + 40)];
}

void sub_10006B75C(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 44)
    && ([*(id *)(a1 + 32) updateContentWithDeadline:*(unsigned int *)(a1 + 40)] & 1) == 0)
  {
    id v3 = sub_100068730();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1000D1F84();
    }
  }
  else
  {
    os_log_t v1 = +[MSDDemoUpdateController sharedInstance];
    unsigned __int8 v2 = [v1 updateDemoContent];

    if (v2) {
      return;
    }
    id v3 = sub_100068730();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1000D1F50();
    }
  }
}

void sub_10006B804(id a1)
{
  id v1 = +[MSDOSUpdaterController sharedInstance];
  [v1 startOSUpdate];
}

void sub_10006C054(id a1)
{
  id v1 = objc_alloc_init(MSDKeychainManager);
  uint64_t v2 = qword_100189AE8;
  qword_100189AE8 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_10006C270(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10006C430(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10006C554(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10006C7B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10006C954(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10006D47C(id a1)
{
  id v1 = objc_alloc_init(MSDLocalEventStreamHandler);
  uint64_t v2 = qword_100189B00;
  qword_100189B00 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

id sub_10006D56C(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) handleEvent:a2 fromStream:"com.apple.fsevents.matching"];
}

void sub_10006EDDC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observer];
  [v2 operation:*(void *)(a1 + 32) didProduceNewOperation:*(void *)(a1 + 40) forRollback:*(unsigned __int8 *)(a1 + 48)];
}

void sub_10006F33C(id a1)
{
  id v1 = objc_alloc_init(MSDProcessTestEvents);
  uint64_t v2 = qword_100189B10;
  qword_100189B10 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_10006F49C(id a1, NSString *a2)
{
}

void sub_10006FEEC(id a1)
{
  id v1 = objc_alloc_init(MSDAccountManager);
  uint64_t v2 = qword_100189B20;
  qword_100189B20 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_1000700F4(id a1, int a2)
{
  uint64_t v2 = sub_100068600();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Received notification for trusted peer change!", v4, 2u);
  }

  id v3 = +[MSDTargetDevice sharedInstance];
  [v3 saveiCloudAccountSyncNeeded:1];
}

void sub_1000727F8(id a1)
{
  id v1 = objc_alloc_init(MSDAppHelper);
  uint64_t v2 = qword_100189B30;
  qword_100189B30 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_1000734E8(uint64_t a1, void *a2)
{
  id v3 = [a2 userInfo];
  id v4 = [v3 objectForKey:@"bundleIDs"];

  id v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received app registered notification with bundle IDs: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  [*(id *)(a1 + 32) lock];
  [*(id *)(a1 + 32) signal];
  [*(id *)(a1 + 32) unlock];
}

void sub_100073DE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100073E20(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) demuxQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100073EEC;
  v6[3] = &unk_100152040;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v7 = v3;
  id v5 = v3;
  dispatch_barrier_sync(v4, v6);

  objc_destroyWeak(&v8);
}

void sub_100073EEC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleDownloadPaused:*(void *)(a1 + 32)];
}

void sub_100073F3C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) demuxQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100074008;
  v6[3] = &unk_100152040;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v7 = v3;
  id v5 = v3;
  dispatch_barrier_sync(v4, v6);

  objc_destroyWeak(&v8);
}

void sub_100074008(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleDownloadAborted:*(void *)(a1 + 32)];
}

id sub_10007416C(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchSessionTask:*(void *)(a1 + 40)];
}

id sub_100076858(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchSessionTask:*(void *)(a1 + 40)];
}

void sub_100076D78(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_100076E04(id a1)
{
  id v1 = objc_alloc_init(MSDAnalyticsEventHandler);
  uint64_t v2 = qword_100189B40;
  qword_100189B40 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_100079104(id a1)
{
  id v1 = objc_alloc_init(MSDBAAInterface);
  uint64_t v2 = qword_100189B50;
  qword_100189B50 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_100079434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100079464(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v11 = a3;
  id v7 = a4;
  if (a2 && v11)
  {
    [*(id *)(a1 + 32) setPrivateKey:a2];
    id v8 = [v11 mutableCopy];
    [*(id *)(a1 + 32) setClientCertArray:v8];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  uint64_t v9 = *(void *)(a1 + 48);
  if (v9)
  {
    uint64_t v10 = [*(id *)(a1 + 32) clientCertArray];
    (*(void (**)(uint64_t, void *, id, id))(v9 + 16))(v9, v10, [*(id *)(a1 + 32) privateKey], v7);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10007ADD4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = sub_100068600();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000D3DC4(v3);
    }
  }
  id v5 = [*(id *)(a1 + 32) semaphore];
  dispatch_semaphore_signal(v5);
}

void sub_10007B4D0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10007B520(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10007B530(uint64_t a1)
{
}

void sub_10007B538(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    int v6 = sub_100068600();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000D3F9C();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  id v7 = [*(id *)(a1 + 32) semaphore];
  dispatch_semaphore_signal(v7);
}

void sub_10007B5CC(uint64_t a1, void *a2, char a3)
{
  id v6 = a2;
  if (v6)
  {
    id v7 = sub_100068600();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000D4004();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  id v8 = [*(id *)(a1 + 32) semaphore];
  dispatch_semaphore_signal(v8);
}

void sub_10007B678(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = sub_100068600();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000D406C();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  id v6 = [*(id *)(a1 + 32) semaphore];
  dispatch_semaphore_signal(v6);
}

void sub_10007D6A4(id a1)
{
  uint64_t v1 = objc_alloc_init(MSDBackgroundDownload);
  uint64_t v2 = (void *)qword_100189B60;
  qword_100189B60 = (uint64_t)v1;

  id v3 = +[MSDProgressUpdater sharedInstance];
  id v4 = [v3 backgroundBundle];
  [(id)qword_100189B60 setBundleDownloadInProgress:v4];

  id v5 = (void *)qword_100189B60;

  [v5 setIsBackgroundDownloadQueueEmpty:1];
}

void sub_10007D848(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10007D860(uint64_t a1)
{
  id v3 = +[MSDSystemMonitor sharedInstance];
  id v4 = +[MSDHelperAgent sharedInstance];
  id v5 = +[MSDTargetDevice sharedInstance];
  [*(id *)(a1 + 32) setDevice:v5];

  id v6 = [*(id *)(a1 + 32) device];
  [v6 setBackgroundDownloadActive:1];

  id v7 = [*(id *)(a1 + 32) device];
  [v7 manageDeviceSnapshot:@"MountSnapshot"];

  id v8 = +[MSDProgressUpdater sharedInstance];
  uint64_t v9 = [v8 backgroundBundle];
  [*(id *)(a1 + 32) setBundleDownloadInProgress:v9];

  uint64_t v10 = [*(id *)(a1 + 32) bundleDownloadInProgress];
  [v10 startBundleUpdateTimer];

  if (![v4 stageDeviceForUpdateProcess:1])
  {
    uint64_t v28 = sub_100068600();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_1000D43E4(v28);
    }
    goto LABEL_17;
  }
  id v11 = [*(id *)(a1 + 32) initiateBackgroundDownload];
  if (!v11)
  {
    unint64_t v12 = 0;
    do
    {
      uint64_t v13 = sub_100068600();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1000D43A4(&buf, v36, v13);
      }

      uint64_t v14 = v12 + 1;
      sleep(0x3Cu);
      uint64_t v15 = [*(id *)(a1 + 32) initiateBackgroundDownload];
      id v11 = (void *)v15;
      if (v15) {
        break;
      }
    }
    while (v12++ < 4);
    if (!v15)
    {
      uint64_t v28 = sub_100068600();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_1000D42E8(v14, v28);
      }
LABEL_17:

      CFDataRef v19 = 0;
      int v18 = 0;
      goto LABEL_18;
    }
  }
  uint64_t v17 = [[MSDComponentBuilder alloc] initWithSignedManifest:v11 andOptions:&off_100163048];
  int v18 = [(MSDComponentBuilder *)v17 buildComponentsFromManifest];
  if (!v18)
  {
    uint64_t v33 = sub_100068600();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_1000D4360(v33);
    }

    CFDataRef v19 = 0;
    goto LABEL_12;
  }

  CFDataRef v19 = [[MSDComponentProcessor alloc] initWithQoS:9];
  __int16 v20 = [[MSDComponentManager alloc] initWithComponents:v18 andProcessor:v19];
  [*(id *)(a1 + 32) setComponentManager:v20];

  [v3 registerObserver:*(void *)(a1 + 32)];
  [v3 startSystemIdleDetection];
  int v21 = [*(id *)(a1 + 32) componentManager];
  [v21 startProcessingAllComponents];

  uint64_t v22 = [*(id *)(a1 + 32) componentManager];
  unsigned int v23 = [v22 waitForProcessingCompletionTillDate:0 outError:0];

  [v3 unregisterObserver];
  [v3 stopSystemIdleDetection];
  if (v23)
  {
LABEL_12:
    uint64_t v24 = [*(id *)(a1 + 32) bundleDownloadInProgress];
    [v24 setBundleStateAs:3];

    id v25 = [*(id *)(a1 + 32) device];
    CFIndex v26 = v25;
    uint64_t v27 = 3;
    goto LABEL_19;
  }
LABEL_18:
  __n128 v29 = [*(id *)(a1 + 32) bundleDownloadInProgress];
  [v29 setBundleStateAs:4];

  id v25 = [*(id *)(a1 + 32) device];
  CFIndex v26 = v25;
  uint64_t v27 = 4;
LABEL_19:
  [v25 setBackgroundDownloadState:v27];

  int v30 = [*(id *)(a1 + 32) device];
  [v30 manageDeviceSnapshot:@"UnmountSnapshot"];

  CFDataRef v31 = [*(id *)(a1 + 32) bundleDownloadInProgress];
  [v31 stopBundleUpdateTimer];

  CFStringRef v32 = sub_100068600();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v34 = 0;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Can not continue background download. Exiting...", v34, 2u);
  }

  [*(id *)(a1 + 32) setIsBackgroundDownloadQueueEmpty:1];
}

void sub_10007DFE0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10007E170(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10007E318(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10007EA9C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10007EBB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10007ECC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10007EDB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10007F078(id a1)
{
  uint64_t v1 = objc_alloc_init(MSDLanguageAndRegionManager);
  uint64_t v2 = qword_100189B70;
  qword_100189B70 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_10007F3C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10007F3E4(uint64_t result)
{
  if (*(_DWORD *)(*(void *)(*(void *)(result + 48) + 8) + 24) != -1)
  {
    uint64_t v1 = result;
    uint64_t v2 = sub_100068600();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Deadline for Springboard restart passed.", v3, 2u);
    }

    [*(id *)(v1 + 32) cancelNotifyToken:*(unsigned int *)(*(void *)(*(void *)(v1 + 48) + 8) + 24)];
    id result = *(void *)(v1 + 40);
    if (result) {
      return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
    }
  }
  return result;
}

uint64_t sub_10007F490(uint64_t a1)
{
  int out_token = 0;
  notify_register_check("com.apple.springboard.finishedstartup", &out_token);
  uint64_t result = out_token;
  if (out_token != -1)
  {
    uint64_t state64 = 0;
    uint64_t result = notify_get_state(out_token, &state64);
    if (state64)
    {
      id v3 = sub_100068600();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v4 = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Springboard restarted.", v4, 2u);
      }

      [*(id *)(a1 + 32) cancelNotifyToken:*(unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
      uint64_t result = *(void *)(a1 + 40);
      if (result) {
        return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
      }
    }
  }
  return result;
}

void sub_100080C48(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) completion];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) completion];
    id v8 = [*(id *)(a1 + 32) parseResponseForError:v9 andPayload:v5];
    ((void (**)(void, void *))v7)[2](v7, v8);
  }
}

void sub_100080F94(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) completion];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) completion];
    id v8 = [*(id *)(a1 + 32) parseResponseForError:v9 andPayload:v5];
    ((void (**)(void, void *))v7)[2](v7, v8);
  }
}

void sub_1000810C8(id a1)
{
  uint64_t v1 = objc_alloc_init(MSDLocalization);
  uint64_t v2 = qword_100189B80;
  qword_100189B80 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_10008152C(uint64_t a1)
{
  uint64_t v2 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/MobileStoreDemoKit.framework"];
  uint64_t v43 = +[NSMutableDictionary dictionary];
  p_superclass = &OBJC_METACLASS___MSDComponentCompleteOperation.superclass;
  id v53 = 0;
  id v54 = 0;
  unsigned int v4 = +[MSDLocalization getWarningKeys:&v54 andPlaceHolderWarnings:&v53 forOwnershipWarningFlag:*(void *)(a1 + 32)];
  id v5 = v54;
  id v6 = v53;
  if (v2) {
    BOOL v7 = v4 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    id v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000D50F4(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  else
  {
    uint64_t v16 = [v2 localizations];
    id v8 = v16;
    if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v17 = sub_100068600();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        sub_1000D5074();
      }
      unsigned int v42 = v6;

      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v8 = v8;
      id v46 = [v8 countByEnumeratingWithState:&v49 objects:v59 count:16];
      if (v46)
      {
        uint64_t v45 = *(void *)v50;
        uint64_t v48 = kMMSDPropertyClaimTitleKey;
        uint64_t v47 = kMMSDPropertyClaimBodyKey;
        uint64_t v19 = kMMSDPropertyClaimLinkKey;
        *(void *)&long long v18 = 138543362;
        long long v41 = v18;
        id obj = v8;
        do
        {
          __int16 v20 = 0;
          do
          {
            if (*(void *)v50 != v45) {
              objc_enumerationMutation(obj);
            }
            int v21 = *(void **)(*((void *)&v49 + 1) + 8 * (void)v20);
            uint64_t v22 = [v5 objectForKey:v48, v41];
            unsigned int v23 = [v2 localizedStringForKey:v22 value:0 table:0 localization:v21];

            uint64_t v24 = [v5 objectForKey:v47];
            id v25 = [v2 localizedStringForKey:v24 value:0 table:0 localization:v21];

            CFIndex v26 = [v5 objectForKey:v19];
            uint64_t v27 = [v2 localizedStringForKey:v26 value:0 table:0 localization:v21];

            if (!v27
              || ([v5 objectForKey:v19],
                  uint64_t v28 = objc_claimAutoreleasedReturnValue(),
                  unsigned int v29 = [(__CFString *)v27 isEqualToString:v28],
                  v28,
                  v29))
            {

              uint64_t v27 = &stru_100155450;
            }
            if (v23 && v25)
            {
              v57[0] = v48;
              v57[1] = v47;
              v58[0] = v23;
              v58[1] = v25;
              v57[2] = v19;
              v58[2] = v27;
              int v30 = +[NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:3];
              [v43 setObject:v30 forKey:v21];
              if ([v21 isEqualToString:@"en"])
              {
                int v30 = v30;

                unsigned int v42 = v30;
              }
            }
            else
            {
              int v30 = sub_100068600();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)uint8_t buf = v41;
                uint64_t v56 = v21;
                _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "ERROR - Either title, body or link localized text is missing for locale:  %{public}@", buf, 0xCu);
              }
            }

            __int16 v20 = (char *)v20 + 1;
          }
          while (v46 != v20);
          id v8 = obj;
          id v46 = [obj countByEnumeratingWithState:&v49 objects:v59 count:16];
        }
        while (v46);
      }

      p_superclass = (__objc2_class **)(&OBJC_METACLASS___MSDComponentCompleteOperation + 8);
      id v6 = v42;
    }
    else
    {
      CFDataRef v31 = sub_100068600();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        sub_1000D4FE8(v31, v32, v33, v34, v35, v36, v37, v38);
      }
    }
  }

  [p_superclass + 169 fillInMissingLocales:v43 withOwnershipWarningMsg:v6];
  uint64_t v39 = +[NSDictionary dictionaryWithDictionary:v43];
  uint64_t v40 = (void *)qword_100189B90;
  qword_100189B90 = v39;
}

void sub_100081B14(id a1)
{
  uint64_t v1 = (void *)qword_100189BA0;
  qword_100189BA0 = (uint64_t)&off_100162E60;
}

void sub_1000821E4(id a1)
{
  uint64_t v1 = objc_alloc_init(MSDStoreHoursManager);
  uint64_t v2 = qword_100189BB0;
  qword_100189BB0 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_1000823B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000823D4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained expirationTimer];
  [v1 fire];
}

void sub_1000837C0(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unsigned int v4 = [WeakRetained expirationTimer];

  if (v4)
  {
    id v5 = objc_loadWeakRetained(v2);
    id v6 = [v5 expirationTimer];
    [v6 invalidate];

    id v7 = objc_loadWeakRetained(v2);
    [v7 setExpirationTimer:0];
  }
  id v8 = objc_alloc((Class)NSTimer);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = objc_loadWeakRetained(v2);
  id v11 = [v8 initWithFireDate:v9 interval:v10 target:"storeHourSettingsExpirationHandler:" selector:0 userInfo:0 repeats:0.0];
  id v12 = objc_loadWeakRetained(v2);
  [v12 setExpirationTimer:v11];

  uint64_t v13 = +[NSRunLoop currentRunLoop];
  id v14 = objc_loadWeakRetained(v2);
  uint64_t v15 = [v14 expirationTimer];
  [v13 addTimer:v15 forMode:NSDefaultRunLoopMode];

  uint64_t v16 = sub_100068600();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = [*(id *)(a1 + 32) toString];
    int v18 = 138543362;
    uint64_t v19 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Store hour settings will expire on %{public}@", (uint8_t *)&v18, 0xCu);
  }
}

void sub_100083B1C(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unsigned int v4 = [WeakRetained storeOpenTimer];

  if (v4)
  {
    id v5 = objc_loadWeakRetained(v2);
    id v6 = [v5 storeOpenTimer];
    [v6 invalidate];

    id v7 = objc_loadWeakRetained(v2);
    [v7 setStoreOpenTimer:0];
  }
  id v8 = objc_alloc((Class)NSTimer);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = objc_loadWeakRetained(v2);
  id v11 = [v8 initWithFireDate:v9 interval:v10 target:"storeOpenHandler:" selector:0 userInfo:0 repeats:0.0];
  id v12 = objc_loadWeakRetained(v2);
  [v12 setStoreOpenTimer:v11];

  id v15 = +[NSRunLoop currentRunLoop];
  id v13 = objc_loadWeakRetained(v2);
  id v14 = [v13 storeOpenTimer];
  [v15 addTimer:v14 forMode:NSDefaultRunLoopMode];
}

void sub_100083DE8(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unsigned int v4 = [WeakRetained storeCloseTimer];

  if (v4)
  {
    id v5 = objc_loadWeakRetained(v2);
    id v6 = [v5 storeCloseTimer];
    [v6 invalidate];

    id v7 = objc_loadWeakRetained(v2);
    [v7 setStoreCloseTimer:0];
  }
  id v8 = objc_alloc((Class)NSTimer);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = objc_loadWeakRetained(v2);
  id v11 = [v8 initWithFireDate:v9 interval:v10 target:"storeCloseHandler:" selector:0 userInfo:0 repeats:0.0];
  id v12 = objc_loadWeakRetained(v2);
  [v12 setStoreCloseTimer:v11];

  id v15 = +[NSRunLoop currentRunLoop];
  id v13 = objc_loadWeakRetained(v2);
  id v14 = [v13 storeCloseTimer];
  [v15 addTimer:v14 forMode:NSDefaultRunLoopMode];
}

void sub_10008416C(id a1)
{
  uint64_t v1 = objc_alloc_init(MSDProgressUpdater);
  uint64_t v2 = qword_100189BC0;
  qword_100189BC0 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_100085414(id a1, MSDServerResponse *a2)
{
  uint64_t v2 = a2;
  id v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v4 = [(MSDServerResponse *)v2 error];
    int v5 = 136315394;
    id v6 = "-[MSDProgressUpdater demoUpdateCompleted:]_block_invoke";
    __int16 v7 = 2114;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: sent done status to hub; error=%{public}@",
      (uint8_t *)&v5,
      0x16u);
  }
}

void sub_100085C44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100085C6C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    unsigned int v4 = sub_100068600();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000D5998(a1, (uint64_t)v3, v4);
    }

    char v5 = 0;
  }
  else
  {
    char v5 = 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v5;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100088058(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_1000885E4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 lowercaseString];
  [v2 addObject:v3];
}

void sub_100088690(id a1)
{
  id v1 = [objc_alloc((Class)NSSet) initWithObjects:@"Host", @"X-Apple-HMAC-Sent-Timestamp", nil];
  uint64_t v2 = qword_100189BD0;
  qword_100189BD0 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_100089140(id a1)
{
  uint64_t v1 = [@"X-Apple-HMAC-Sent-Timestamp" lowercaseString];
  uint64_t v2 = qword_100189BE8;
  qword_100189BE8 = v1;

  _objc_release_x1(v1, v2);
}

void sub_100089A8C(id a1)
{
  uint64_t v1 = [@"X-Apple-HMAC-Sent-Timestamp" lowercaseString];
  uint64_t v2 = qword_100189BE8;
  qword_100189BE8 = v1;

  _objc_release_x1(v1, v2);
}

void sub_100089B84(id a1)
{
  uint64_t v1 = objc_alloc_init(MSDSystemMonitor);
  uint64_t v2 = (void *)qword_100189BF0;
  qword_100189BF0 = (uint64_t)v1;

  id v3 = +[MSDPlatform sharedInstance];
  unsigned int v4 = [v3 macOS];

  if (v4)
  {
    +[NSSet setWithObjects:@"com.apple.ist.demoloop", @"com.apple.ScreenSaver.Engine", @"com.apple.ist.DigitalSignage.iOS", 0, v14, v15, v16];
    uint64_t v11 = LABEL_9:;
    goto LABEL_10;
  }
  char v5 = +[MSDPlatform sharedInstance];
  unsigned int v6 = [v5 iOS];

  if (v6)
  {
    +[NSSet setWithObjects:@"com.retailtech.arkenstone", @"com.apple.ist.windward", @"com.apple.ist.DemoDiscoveryApp", @"com.apple.ist.demoloop", @"com.apple.ist.DigitalCatalog", @"com.apple.ist.DigitalSignage.iOS", 0];
    goto LABEL_9;
  }
  __int16 v7 = +[MSDPlatform sharedInstance];
  unsigned int v8 = [v7 watchOS];

  if (v8)
  {
    +[NSSet setWithObjects:@"com.apple.NanoDemo", 0, v12, v13, v14, v15, v16];
    goto LABEL_9;
  }
  uint64_t v9 = +[MSDPlatform sharedInstance];
  unsigned int v10 = [v9 tvOS];

  if (v10)
  {
    +[NSSet setWithObjects:@"com.apple.TVIdleScreen", @"com.apple.PineBoard", @"com.apple.IdleScreen", 0, v14, v15, v16];
    goto LABEL_9;
  }
  uint64_t v11 = +[NSSet set];
LABEL_10:
  uint64_t v17 = (void *)v11;
  [(id)qword_100189BF0 setForegroundAllowedApps:v11];
}

void sub_10008A078(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained diskSpaceMonitoringTimer];

  if (v3)
  {
    id v4 = objc_loadWeakRetained(v1);
    char v5 = [v4 diskSpaceMonitoringTimer];
    [v5 invalidate];
  }
  id v8 = objc_loadWeakRetained(v1);
  unsigned int v6 = +[NSTimer scheduledTimerWithTimeInterval:v8 target:"processDiskSpaceMonitorCallback" selector:0 userInfo:1 repeats:300.0];
  id v7 = objc_loadWeakRetained(v1);
  [v7 setDiskSpaceMonitoringTimer:v6];
}

void sub_10008A204(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained diskSpaceMonitoringTimer];

  if (v3)
  {
    id v4 = objc_loadWeakRetained(v1);
    char v5 = [v4 diskSpaceMonitoringTimer];
    [v5 invalidate];

    id v6 = objc_loadWeakRetained(v1);
    [v6 setDiskSpaceMonitoringTimer:0];
  }
}

void sub_10008A3B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10008A5C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_10008A5F4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained processCoreDuetCallBack];

  return 1;
}

void sub_10008A8F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10008AA64(id a1)
{
  uint64_t v1 = objc_alloc_init(MSDDemoUpdateController);
  uint64_t v2 = qword_100189C00;
  qword_100189C00 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_10008B29C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10008BBA4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10008C4B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10008C7F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10008C9D4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10008CEE4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10008DB50(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = sub_100068600();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000D68E8(v5, v6);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100090184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000901A0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000901B0(uint64_t a1)
{
}

uint64_t sub_1000901B8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = +[NSString stringWithCString:a2 encoding:4];
  xpc_type_t type = xpc_get_type(v5);
  if (type == (xpc_type_t)&_xpc_type_BOOL)
  {
    unsigned int v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v11 = +[NSNumber numberWithBool:xpc_BOOL_get_value(v5)];
LABEL_22:
    uint64_t v15 = v11;
    [v10 setObject:v11 forKey:v6];

    uint64_t v9 = 1;
    goto LABEL_23;
  }
  if (type == (xpc_type_t)&_xpc_type_string)
  {
    unsigned int v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v11 = +[NSString stringWithCString:xpc_string_get_string_ptr(v5) encoding:4];
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_int64)
  {
    unsigned int v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v11 = +[NSNumber numberWithLongLong:xpc_int64_get_value(v5)];
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_uint64)
  {
    unsigned int v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v11 = +[NSNumber numberWithUnsignedLongLong:xpc_uint64_get_value(v5)];
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    uint64_t v12 = *(void **)(a1 + 32);
    unsigned int v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v11 = [v12 initWithXPCDictionary:v5];
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_data)
  {
    bytes_ptr = xpc_data_get_bytes_ptr(v5);
    size_t length = xpc_data_get_length(v5);
    unsigned int v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v11 = +[NSData dataWithBytes:bytes_ptr length:length];
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_array)
  {
    unsigned int v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v11 = +[NSArray arrayWithXPCArray:v5];
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_double)
  {
    unsigned int v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v11 = +[NSNumber numberWithDouble:xpc_double_get_value(v5)];
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_date)
  {
    unsigned int v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v11 = +[NSDate dateWithTimeIntervalSince1970:(double)xpc_date_get_value(v5)];
    goto LABEL_22;
  }
  id v8 = sub_100068600();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_1000D72BC((uint64_t)v6, v8);
  }

  uint64_t v9 = 0;
LABEL_23:

  return v9;
}

void sub_100090FDC(id a1)
{
  uint64_t v1 = objc_alloc_init(MSDDemoManifestCheck);
  uint64_t v2 = qword_100189C10;
  qword_100189C10 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_100092D10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100092D3C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100092D4C(uint64_t a1)
{
}

void sub_100092D54(uint64_t a1, const __CFData *a2, uint64_t a3, unsigned char *a4)
{
  SecCertificateRef v6 = SecCertificateCreateWithData(kCFAllocatorDefault, a2);
  if (v6)
  {
    SecCertificateRef v17 = v6;
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v6];
  }
  else
  {
    id v7 = sub_100068600();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000D82E4(v7, v8, v9, v10, v11, v12, v13, v14);
    }

    uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = 0;

    *a4 = 1;
  }
}

void sub_1000935D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100093604(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  if ([*(id *)(a1 + 32) containsObject:v7])
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    _DWORD v11[2] = sub_100093714;
    v11[3] = &unk_100153828;
    v11[4] = *(void *)(a1 + 40);
    id v9 = v7;
    uint64_t v10 = *(void *)(a1 + 72);
    id v12 = v9;
    uint64_t v16 = v10;
    id v13 = *(id *)(a1 + 48);
    id v14 = *(id *)(a1 + 56);
    id v15 = *(id *)(a1 + 64);
    uint64_t v17 = a4;
    [v8 enumerateKeysAndObjectsUsingBlock:v11];
  }
}

void sub_100093714(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = [*(id *)(a1 + 32) checkType];
  if (v9) {
    [*(id *)(a1 + 32) checkType];
  }
  else {
  uint64_t v10 = [v8 objectForKey:@"RigorousCheckType"];
  }

  uint64_t v11 = sub_100068600();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = *(char **)(a1 + 40);
    *(_DWORD *)uint8_t buf = 138543874;
    unsigned int v23 = v7;
    __int16 v24 = 2114;
    id v25 = v12;
    __int16 v26 = 2114;
    uint64_t v27 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Name: %{public}@, Section Name: %{public}@, Check Type: %{public}@", buf, 0x20u);
  }

  id v13 = [*(id *)(a1 + 32) getComponentData:v8];
  if ([v10 isEqualToString:@"Skip"])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  }
  else if ([v10 isEqualToString:@"Default"])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [*(id *)(a1 + 32) runSecurityChecksForSection:v13 dataType:*(void *)(a1 + 40) componentName:v7 options:*(void *)(a1 + 48)];
  }
  else
  {
    if ([v10 isEqualToString:@"AppleISTCertCheck"])
    {
      id v14 = +[NSString stringWithFormat:@"%@.%@", *(void *)(a1 + 40), v7];
      id v15 = [*(id *)(a1 + 32) allowedISTSignedComponents];
      unsigned int v16 = [v15 containsObject:v14];

      if (v16)
      {
        if ([v7 isEqualToString:*(void *)(a1 + 56)]
          && [*(id *)(a1 + 40) isEqualToString:*(void *)(a1 + 64)])
        {
          uint64_t v17 = sub_100068600();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint8_t buf = 138543362;
            unsigned int v23 = (const char *)v14;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "About to run app layout checks for %{public}@", buf, 0xCu);
          }

          unsigned __int8 v18 = [*(id *)(a1 + 32) runAppLayoutSecurityCheck:v13];
        }
        else
        {
          unsigned __int8 v18 = [*(id *)(a1 + 32) runSecurityChecksForSection:v13 dataType:*(void *)(a1 + 40) componentName:v7 options:*(void *)(a1 + 48)];
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v18;
      }
      else
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
        __int16 v20 = sub_100068600();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_1000D8750();
        }
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
      id v14 = sub_100068600();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = *(void *)(a1 + 40);
        *(_DWORD *)uint8_t buf = 136315906;
        unsigned int v23 = "-[MSDDemoManifestCheck runSecurityCheck:]_block_invoke";
        __int16 v24 = 2114;
        id v25 = v10;
        __int16 v26 = 2114;
        uint64_t v27 = v7;
        __int16 v28 = 2114;
        uint64_t v29 = v19;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s: Unknown rigorous check type (%{public}@) for %{public}@ (from %{public}@).", buf, 0x2Au);
      }
    }
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    int v21 = sub_100068600();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1000D86B4((uint64_t)v7, a1, v21);
    }

    *a4 = 1;
    **(unsigned char **)(a1 + 80) = 1;
  }
}

void sub_1000951B4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100068600();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 name];
    SecCertificateRef v6 = [v3 userInfo];
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Notification received for entitlement check for: %{public}@ %{public}@", (uint8_t *)&v8, 0x16u);
  }
  id v7 = [v3 userInfo];
  [*(id *)(a1 + 32) setItemBeingInstalled:v7];
}

void sub_100096754(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v8 - 120), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100096794(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000967A4(uint64_t a1)
{
}

void sub_1000967AC(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 pathExtension];
  id v5 = [v4 lowercaseString];

  if ([v5 isEqualToString:@"plist"])
  {
    v21[0] = *(void *)(*(void *)(a1[4] + 8) + 40);
    v21[1] = v3;
    SecCertificateRef v6 = +[NSArray arrayWithObjects:v21 count:2];
    id v7 = +[NSString pathWithComponents:v6];

    uint64_t v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138543362;
      __int16 v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Loading factory metadata from path %{public}@", (uint8_t *)&v19, 0xCu);
    }

    id v9 = [[MSDSignedManifestFactoryMetadata alloc] initWithContentPlistFile:v7];
    uint64_t v10 = *(void *)(a1[5] + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    if (*(void *)(*(void *)(a1[5] + 8) + 40))
    {
      [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:];
    }
    else
    {
      uint64_t v12 = sub_100068600();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1000D8DF0((uint64_t)v7, v12, v13, v14, v15, v16, v17, v18);
      }
    }
  }
}

void sub_100097890(id a1)
{
  uint64_t v1 = objc_alloc_init(MSDSettingsRefresher);
  uint64_t v2 = qword_100189C28;
  qword_100189C28 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_100098814(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100098830(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)RadiosPreferences);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 airplaneMode];
}

void sub_10009899C(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)RadiosPreferences);
  [v2 setAirplaneMode:*(unsigned __int8 *)(a1 + 40)];
  id v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 136315394;
    SecCertificateRef v6 = "-[MSDSettingsRefresher setAirplaneMode:]_block_invoke";
    __int16 v7 = 2114;
    uint64_t v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s - Set system airplane mode setting to %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

void sub_100098E44(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_10009AF88(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_10009AF9C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _listenForIncomingRequestMessageOfID:*(void *)(a1 + 32)];
}

void sub_10009B0CC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_10009B0E0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _listenForIncomingEventMessageOfID:*(void *)(a1 + 32)];
}

void sub_10009B258(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_10009B26C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _sendOutgoingRequestMessage:*(void *)(a1 + 32) toDevice:*(void *)(a1 + 40) withCompletion:*(void *)(a1 + 48)];
}

void sub_10009B3E8(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_10009B3FC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _sendOutgoingEventMessage:*(void *)(a1 + 32) toDevice:*(void *)(a1 + 40) withCompletion:*(void *)(a1 + 48)];
}

void sub_10009B530(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_10009B544(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _invalidateSenderRPClientForDevice:*(void *)(a1 + 32)];
}

void sub_10009B838(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 80));
  _Unwind_Resume(a1);
}

void sub_10009B870(uint64_t a1)
{
  id v2 = sub_100068600();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "MSDRapportMessageHandler: XPC connection to listener RPCompanionLinkClient interrupted!", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidateListenerRPClient];
}

void sub_10009B8F0(uint64_t a1)
{
  id v2 = sub_100068600();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "MSDRapportMessageHandler: XPC connection to listener RPCompanionLinkClient invalidated!", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidateListenerRPClient];
}

void sub_10009B970(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = sub_100068600();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000DA0DC(v3, v4);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 40);
    SecCertificateRef v6 = [*(id *)(a1 + 32) listenerRPClient];
    (*(void (**)(uint64_t, void *, void))(v5 + 16))(v5, v6, 0);
  }
}

void sub_10009BC24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10009BC48(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    __int16 v7 = *(void **)(a1 + 32);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10009BD6C;
    v9[3] = &unk_100153978;
    uint64_t v10 = v7;
    objc_copyWeak(&v12, (id *)(a1 + 48));
    uint64_t v11 = *(void *)(a1 + 40);
    [v5 registerRequestID:v10 options:0 handler:v9];
    objc_destroyWeak(&v12);
    uint64_t v8 = v10;
  }
  else
  {
    uint64_t v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000DA174(v8);
    }
  }
}

void sub_10009BD58(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10009BD6C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = dispatch_get_global_queue(21, 0);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10009BEAC;
  v14[3] = &unk_100153950;
  id v15 = *(id *)(a1 + 32);
  id v16 = v7;
  id v17 = v8;
  id v11 = v8;
  id v12 = v7;
  objc_copyWeak(&v20, (id *)(a1 + 48));
  uint64_t v18 = *(void *)(a1 + 40);
  id v19 = v9;
  id v13 = v9;
  dispatch_async(v10, v14);

  objc_destroyWeak(&v20);
}

void sub_10009BEAC(uint64_t a1)
{
  id v2 = sub_100068600();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v17 = 138543618;
    uint64_t v18 = v3;
    __int16 v19 = 2114;
    uint64_t v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "MSDRapportMessageHandler: Received request of ID: %{public}@ payload: %{public}@", (uint8_t *)&v17, 0x16u);
  }

  id v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000DA1B8();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v7 = [WeakRetained observer];

  if (v7)
  {
    id v8 = [[MSDRapportDevice alloc] initWithIncomingOptions:*(void *)(a1 + 48)];
    id v9 = [[MSDRapportMessage alloc] initWithIdentifier:*(void *)(a1 + 32) andPayload:*(void *)(a1 + 40) usingOptions:*(void *)(a1 + 48)];
    id v10 = objc_loadWeakRetained((id *)(a1 + 72));
    id v11 = [v10 observer];
    id v12 = [v11 didReceiveRequestMessage:v9 fromDevice:v8];

    if (v12)
    {
      id v13 = [*(id *)(a1 + 56) _extractRapportPayloadFromMessage:v12];
      uint64_t v14 = [*(id *)(a1 + 56) _extractRapportOptionsFromMessage:v12];
      id v15 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    id v9 = 0;
  }
  id v15 = +[NSError errorDomainMSDWithCode:3727744768 message:@"An error has occurred."];
  id v12 = 0;
  uint64_t v14 = 0;
  id v13 = &__NSDictionary0__struct;
LABEL_10:
  uint64_t v16 = *(void *)(a1 + 64);
  if (v16) {
    (*(void (**)(uint64_t, void *, void *, void *))(v16 + 16))(v16, v13, v14, v15);
  }
}

void sub_10009C230(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10009C254(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = *(void **)(a1 + 32);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10009C370;
    v9[3] = &unk_1001539C8;
    id v10 = v7;
    objc_copyWeak(&v11, (id *)(a1 + 40));
    [v5 registerEventID:v10 options:0 handler:v9];
    objc_destroyWeak(&v11);
    id v8 = v10;
  }
  else
  {
    id v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000DA174(v8);
    }
  }
}

void sub_10009C35C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10009C370(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_100068600();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v23 = 138543618;
    uint64_t v24 = v8;
    __int16 v25 = 2114;
    id v26 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "MSDRapportMessageHandler: Received event of ID: %{public}@ payload: %{public}@", (uint8_t *)&v23, 0x16u);
  }

  id v9 = sub_100068600();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_1000DA224((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);
  }

  uint64_t v16 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v18 = [WeakRetained observer];

  if (v18)
  {
    __int16 v19 = [[MSDRapportDevice alloc] initWithIncomingOptions:v6];
    uint64_t v20 = [[MSDRapportMessage alloc] initWithIdentifier:*(void *)(a1 + 32) andPayload:v5 usingOptions:v6];
    id v21 = objc_loadWeakRetained(v16);
    uint64_t v22 = [v21 observer];
    [v22 didReceiveEventMessage:v20 fromDevice:v19];
  }
}

void sub_10009CB3C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 128));
  _Unwind_Resume(a1);
}

void sub_10009CB94(uint64_t a1)
{
  id v2 = sub_100068600();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_1000DA290();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _invalidateSenderRPClientForDevice:*(void *)(a1 + 32)];
}

void sub_10009CBF8(uint64_t a1)
{
  id v2 = sub_100068600();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_1000DA2F8();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _invalidateSenderRPClientForDevice:*(void *)(a1 + 32)];
}

void sub_10009CC5C(uint64_t a1)
{
  id v2 = sub_100068600();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_1000DA360();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _invalidateSenderRPClientForDevice:*(void *)(a1 + 32)];
}

void sub_10009CCC0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = sub_100068600();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000DA3C8(a1, (uint64_t)v3);
    }

    id v5 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  else
  {
    id v6 = [*(id *)(a1 + 40) senderRPClients];
    [v6 addObject:*(void *)(a1 + 48)];

    id v5 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  v5();
}

void sub_10009D0B0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [*(id *)(a1 + 40) _extractRapportPayloadFromMessage:*(void *)(a1 + 48)];
    uint64_t v8 = [*(id *)(a1 + 40) _extractRapportOptionsFromMessage:*(void *)(a1 + 48)];
    id v9 = *(void **)(a1 + 56);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10009D240;
    v12[3] = &unk_100153A40;
    id v13 = v9;
    id v14 = *(id *)(a1 + 64);
    [v5 sendRequestID:v13 request:v7 options:v8 responseHandler:v12];
  }
  else
  {
    uint64_t v10 = sub_100068600();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000DA454();
    }

    uint64_t v11 = [v6 localizedDescription];
    id v7 = +[NSError errorDomainMSDWithCode:3727741108 message:@"Cannot communicate with demo peer." reason:v11];

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void sub_10009D240(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = sub_100068600();
  uint64_t v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000DA4BC(a1, (uint64_t)v9);
    }

    uint64_t v12 = [v9 localizedDescription];
    id v13 = +[NSError errorDomainMSDWithCode:3727741108 message:@"Cannot communicate with demo peer." reason:v12];

    id v14 = 0;
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      int v23 = 138543618;
      uint64_t v24 = v15;
      __int16 v25 = 2114;
      id v26 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "MSDRapportMessageHandler: Received response for request of ID: %{public}@ payload: %{public}@", (uint8_t *)&v23, 0x16u);
    }

    uint64_t v16 = sub_100068600();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_1000DA224((uint64_t)v8, v16, v17, v18, v19, v20, v21, v22);
    }

    id v14 = [[MSDRapportMessage alloc] initWithIdentifier:*(void *)(a1 + 32) andPayload:v7 usingOptions:v8];
    id v13 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10009D5B0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [*(id *)(a1 + 40) _extractRapportPayloadFromMessage:*(void *)(a1 + 48)];
    id v8 = [*(id *)(a1 + 40) _extractRapportOptionsFromMessage:*(void *)(a1 + 48)];
    id v9 = *(void **)(a1 + 56);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10009D73C;
    v12[3] = &unk_100153A90;
    id v13 = v9;
    id v14 = *(id *)(a1 + 64);
    [v5 sendEventID:v13 event:v7 options:v8 completion:v12];
  }
  else
  {
    uint64_t v10 = sub_100068600();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000DA454();
    }

    uint64_t v11 = [v6 localizedDescription];
    id v7 = +[NSError errorDomainMSDWithCode:3727741108 message:@"Cannot communicate with demo peer." reason:v11];

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void sub_10009D73C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100068600();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000DA548(a1, (uint64_t)v3);
    }

    id v5 = [v3 localizedDescription];
    id v6 = +[NSError errorDomainMSDWithCode:3727741108 message:@"Cannot communicate with demo peer." reason:v5];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MSDRapportMessageHandler: Successfuly sent event of ID: %{public}@", (uint8_t *)&v8, 0xCu);
    }
    id v6 = 0;
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10009DBA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10009DBBC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10009DBCC(uint64_t a1)
{
}

void sub_10009DBD4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 isEqualToString:@"Timeout"])
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v6 forKey:RPOptionTimeoutSeconds];
  }
  else
  {
    uint64_t v7 = sub_100068600();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      id v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "MSDRapportMessageHandler: Unknown options key: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
}

void sub_10009DDC8(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

uint64_t sub_10009DDD4(uint64_t a1, uint64_t a2)
{
  return a2;
}

void sub_10009DFEC(id a1)
{
  uint64_t v1 = objc_alloc_init(MSDXCTestSpawnWrapper);
  uint64_t v2 = qword_100189C30;
  qword_100189C30 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_1000A0EA8(id a1)
{
  uint64_t v1 = objc_alloc_init(MSDFileDownloadCredentials);
  uint64_t v2 = qword_100189C40;
  qword_100189C40 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_1000A2220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000A223C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000A224C(uint64_t a1)
{
}

uint64_t sub_1000A2254(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  xpc_type_t type = xpc_get_type(v5);
  if (type == (xpc_type_t)&_xpc_type_BOOL)
  {
    id v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v10 = +[NSNumber numberWithBool:xpc_BOOL_get_value(v5)];
LABEL_22:
    id v14 = v10;
    [v9 addObject:v10];

    uint64_t v8 = 1;
    goto LABEL_23;
  }
  if (type == (xpc_type_t)&_xpc_type_string)
  {
    id v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v10 = +[NSString stringWithCString:xpc_string_get_string_ptr(v5) encoding:4];
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_int64)
  {
    id v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v10 = +[NSNumber numberWithLongLong:xpc_int64_get_value(v5)];
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_uint64)
  {
    id v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v10 = +[NSNumber numberWithUnsignedLongLong:xpc_uint64_get_value(v5)];
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_data)
  {
    bytes_ptr = xpc_data_get_bytes_ptr(v5);
    size_t length = xpc_data_get_length(v5);
    id v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v10 = +[NSData dataWithBytes:bytes_ptr length:length];
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_double)
  {
    id v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v10 = +[NSNumber numberWithDouble:xpc_double_get_value(v5)];
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    id v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v10 = +[NSDictionary dictionaryWithXPCDictionary:v5];
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_array)
  {
    id v13 = *(void **)(a1 + 32);
    id v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v10 = [v13 initWithXPCArray:v5];
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_date)
  {
    id v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v10 = +[NSDate dateWithTimeIntervalSince1970:(double)xpc_date_get_value(v5)];
    goto LABEL_22;
  }
  uint64_t v7 = sub_100068600();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_1000DB1AC(a2, v7);
  }

  uint64_t v8 = 0;
LABEL_23:

  return v8;
}

void sub_1000A2604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000A261C(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = xpc_string_create((const char *)[v6 UTF8String]);
LABEL_5:
    id v10 = v8;
    xpc_array_append_value(v7, v8);

    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = *(void **)(a1 + 32);
    id v9 = v6;
    uint64_t v8 = xpc_data_create([v9 bytes], (size_t)[v9 length]);
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v6;
    if (!strcmp((const char *)[v11 objCType], "i")
      || (id v12 = v11, !strcmp((const char *)[v12 objCType], "s"))
      || (id v13 = v12, !strcmp((const char *)[v13 objCType], "q"))
      || (id v14 = v13, !strcmp((const char *)[v14 objCType], "q")))
    {
      uint64_t v20 = *(void **)(a1 + 32);
      xpc_object_t v21 = xpc_int64_create((int64_t)[v11 longLongValue]);
    }
    else
    {
      id v15 = v14;
      if (!strcmp((const char *)[v15 objCType], "f")
        || (id v16 = v15, !strcmp((const char *)[v16 objCType], "d")))
      {
        uint64_t v20 = *(void **)(a1 + 32);
        [v15 doubleValue];
        xpc_object_t v21 = xpc_double_create(v25);
      }
      else
      {
        id v17 = v16;
        if (strcmp((const char *)[v17 objCType], "B"))
        {
          id v18 = v17;
          if (strcmp((const char *)[v18 objCType], "c"))
          {
            uint64_t v19 = sub_100068600();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
              sub_1000D7334(v18, v19);
            }

            *a4 = 1;
            *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
            goto LABEL_23;
          }
        }
        uint64_t v20 = *(void **)(a1 + 32);
        xpc_object_t v21 = xpc_BOOL_create((BOOL)[v17 BOOLValue]);
      }
    }
    uint64_t v22 = v21;
    xpc_array_append_value(v20, v21);

LABEL_23:
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = [v6 xpcArrayFromArray];
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = [v6 createXPCDictionary];
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = *(void **)(a1 + 32);
    [v6 timeIntervalSince1970];
    uint64_t v8 = xpc_date_create((uint64_t)v23);
    goto LABEL_5;
  }
  uint64_t v24 = sub_100068600();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    sub_1000DB224(v24);
  }

  *a4 = 1;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
LABEL_6:
}

void sub_1000A29C8(id a1)
{
  uint64_t v1 = objc_alloc_init(MSDContentCacheManager);
  uint64_t v2 = qword_100189C50;
  qword_100189C50 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_1000A2FF4(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned __int8 v20 = 0;
  v23[0] = *(void *)(a1 + 32);
  v23[1] = v3;
  uint64_t v4 = +[NSArray arrayWithObjects:v23 count:2];
  id v5 = +[NSString pathWithComponents:v4];

  id v6 = +[NSData dataWithHexString:v3];
  if (v6)
  {
    uint64_t v7 = +[NSFileManager defaultManager];
    unsigned int v8 = [v7 fileExistsAtPath:v5 isDirectory:&v20];
    int v9 = v20;

    if (v8) {
      BOOL v10 = v9 == 0;
    }
    else {
      BOOL v10 = 0;
    }
    if (!v10 || ([*(id *)(a1 + 48) containsObject:v6] & 1) != 0)
    {
      id v11 = 0;
      goto LABEL_18;
    }
    id v16 = [*(id *)(a1 + 40) fileManager];
    id v18 = 0;
    unsigned __int8 v17 = [v16 removeItemAtPath:v5 error:&v18];
    id v11 = v18;

    if (v17) {
      goto LABEL_18;
    }
    id v15 = sub_100068600();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000DB268((uint64_t)v5, v11, v15);
    }
LABEL_17:

    goto LABEL_18;
  }
  id v12 = sub_100068600();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint8_t buf = 138543362;
    uint64_t v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Removing download in progress %{public}@", buf, 0xCu);
  }

  id v13 = [*(id *)(a1 + 40) fileManager];
  id v19 = 0;
  unsigned __int8 v14 = [v13 removeItemAtPath:v5 error:&v19];
  id v11 = v19;

  if ((v14 & 1) == 0)
  {
    id v15 = sub_100068600();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000DB268((uint64_t)v5, v11, v15);
    }
    goto LABEL_17;
  }
LABEL_18:
}

void sub_1000A3618(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000A36FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000A37E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000A3FEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000A4004(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000A4014(uint64_t a1)
{
}

void sub_1000A401C(uint64_t a1, void *a2)
{
  v6[0] = @"/var/MSDWorkContainer/.MSD_cache_manifest";
  v6[1] = a2;
  id v3 = a2;
  uint64_t v4 = +[NSArray arrayWithObjects:v6 count:2];
  id v5 = +[NSString pathWithComponents:v4];

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v5];
}

void sub_1000A4B00(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1000A4B14(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _start];
}

void sub_1000A4C0C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1000A4C20(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _stop];
}

void sub_1000A5080(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 96));
  _Unwind_Resume(a1);
}

void sub_1000A50C8(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _feedNewRSSIReadingReceivedFromDevice:v3];
}

void sub_1000A5124(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _feedNewRSSIReadingReceivedFromDevice:v3];
}

void sub_1000A5180(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _feedNewRSSIReadingReceivedFromDevice:v3];
}

void sub_1000A51DC(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    id v3 = sub_100068600();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1000DB65C(v2);
    }
  }
}

void sub_1000A5954(id a1)
{
  uint64_t v1 = objc_alloc_init(MSDPlatform);
  uint64_t v2 = qword_100189C60;
  qword_100189C60 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_1000A59D4(id a1)
{
  byte_100189C70 = NSClassFromString(@"MSDHubBundleManager") != 0;
}

void sub_1000A6270(id a1)
{
  uint64_t v1 = objc_alloc_init(MSDOSUpdaterController);
  uint64_t v2 = qword_100189C80;
  qword_100189C80 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

id sub_1000A6A38(uint64_t a1)
{
  return [*(id *)(a1 + 32) switchModeImmediately:5];
}

id sub_1000A6A44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _[*(id *)(a1 + 32) scanResult:a2 error:a3];
}

void sub_1000A6BEC(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = sub_100068600();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      uint64_t v7 = "Software update purge happened successfully.";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, 2u);
    }
  }
  else
  {
    id v6 = sub_100068600();
    BOOL v8 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v8)
      {
        int v9 = [v5 localizedDescription];
        int v10 = 138543362;
        id v11 = v9;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "remove software update failed: %{public}@", (uint8_t *)&v10, 0xCu);
      }
    }
    else if (v8)
    {
      LOWORD(v10) = 0;
      uint64_t v7 = "remove software update failed: no error returned";
      goto LABEL_9;
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id *sub_1000A77BC(id *result, char a2, uint64_t a3)
{
  if ((a2 & 1) == 0) {
    return (id *)[result[4] bail:"-[MSDOSUpdaterController scanResult:error:]_block_invoke" error:a3];
  }
  return result;
}

void sub_1000A7A38(uint64_t a1)
{
  uint64_t v2 = +[MSDProgressUpdater sharedInstance];
  [v2 updateStage:19];

  id v3 = [*(id *)(a1 + 32) manager];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  void v4[2] = sub_1000A7AE8;
  v4[3] = &unk_100153790;
  v4[4] = *(void *)(a1 + 32);
  [v3 installUpdate:v4];
}

id *sub_1000A7AE8(id *result, char a2, uint64_t a3)
{
  if ((a2 & 1) == 0) {
    return (id *)[result[4] bail:"-[MSDOSUpdaterController client:downloadDidFinish:]_block_invoke_2" error:a3];
  }
  return result;
}

void sub_1000A7F48(id a1, BOOL a2, NSError *a3)
{
  id v3 = +[MSDTargetDevice sharedInstance];
  [v3 forceSwitchToDemoModeIfNeeded];
}

void sub_1000A9730(id a1)
{
  uint64_t v1 = objc_alloc_init(MSDServerRequestHandler);
  uint64_t v2 = qword_100189C90;
  qword_100189C90 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_1000A9C08(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000A9CB4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000A9ED8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000AA158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000AA18C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000AA19C(uint64_t a1)
{
}

void sub_1000AA1A4(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000AA32C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 error];

  if (v4)
  {
    id v5 = 0;
    id v6 = 0;
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [v3 credential];
    BOOL v8 = +[MSDKeychainManager sharedInstance];
    int v9 = [v7 dataUsingEncoding:4];
    unsigned __int8 v10 = [v8 saveItem:v9 forKey:@"com.apple.mobilestoredemo.keychainItemID"];

    if (v10)
    {
      id v11 = [*(id *)(a1 + 32) hubServer];
      [v11 overrideHmacKey:v7];

      id v6 = [v3 settingsDict];
      if (v6)
      {
        id v12 = [*(id *)(a1 + 32) device];
        unsigned __int8 v13 = [v12 saveHubSuppliedSettings:v6];

        if ((v13 & 1) == 0)
        {
          unsigned __int8 v14 = sub_100068600();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            int v28 = 136315138;
            uint64_t v29 = "-[MSDServerRequestHandler handleEnroll:]_block_invoke";
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: Cannot save settings dictionary.", (uint8_t *)&v28, 0xCu);
          }
        }
      }
      id v5 = [v6 objectForKey:@"DeviceOptions"];
      if (v5)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v15 = [*(id *)(a1 + 32) device];
          unsigned __int8 v16 = [v15 updateDeviceOptions:v5 skipImutableKeys:0];

          if ((v16 & 1) == 0)
          {
            unsigned __int8 v17 = sub_100068600();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              int v28 = 136315138;
              uint64_t v29 = "-[MSDServerRequestHandler handleEnroll:]_block_invoke";
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s: Cannot set deviceOptions dictionary received during /Register response.", (uint8_t *)&v28, 0xCu);
            }
          }
        }
      }
      id v18 = [v3 hubProtocolVersion];
      id v19 = [*(id *)(a1 + 32) device];
      [v19 setHubProtocolVersion:v18];

      unsigned __int8 v20 = [*(id *)(a1 + 32) device];
      xpc_object_t v21 = [v20 hubProtocolVersion];
      unsigned int v22 = [v21 lowerVersionThan:@"2"];

      if (v22)
      {
        double v23 = sub_100068600();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v24 = [*(id *)(a1 + 32) device];
          double v25 = [v24 hubProtocolVersion];
          int v28 = 138543362;
          uint64_t v29 = v25;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Hub protocol version (%{public}@) is too old.", (uint8_t *)&v28, 0xCu);
        }
      }
    }
    else
    {
      uint64_t v27 = +[NSError errorDomainMSDWithCode:3727740949 message:@"Cannot save enrollment record."];
      [v3 setError:v27];

      id v5 = 0;
      id v6 = 0;
    }
  }
  uint64_t v26 = *(void *)(a1 + 40);
  if (v26) {
    (*(void (**)(uint64_t, id))(v26 + 16))(v26, v3);
  }
}

id sub_1000AA8BC(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) checkIPAForResponse:a2 withRequest:*(void *)(a1 + 40)];
}

id sub_1000AA8CC(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) downloadIPAForResponse:a2 withRequest:*(void *)(a1 + 40)];
}

void sub_1000AAA20(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 error];

  if (!v3)
  {
    id v4 = [*(id *)(a1 + 32) getDownloadFileRequestFromResponse:v9 forFilePath:*(void *)(a1 + 40)];
    if (v4)
    {
      id v5 = v4;
      id v6 = [v4 fileInfo];
      [v6 setSkipHashCheck:1];

      [v5 setCompletion:*(void *)(a1 + 48)];
      [*(id *)(a1 + 32) handleDownloadFile:v5];

      goto LABEL_4;
    }
    uint64_t v7 = +[NSError errorDomainMSDWithCode:3727744512 message:@"Unexpected server response."];
    [v9 setError:v7];
  }
  uint64_t v8 = *(void *)(a1 + 48);
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v9);
  }
LABEL_4:
}

void sub_1000AAF54(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000AB438(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000AB450(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v5)
  {
    id v6 = [v5 error];

    if (!v6)
    {
      uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) credential];
      if (v8)
      {
        uint64_t v7 = (void *)v8;
        id v9 = +[MSDFileDownloadCredentials sharedInstance];
        unsigned __int8 v10 = [v9 updateWithResponseFromGetFileDownloadCredentials:v7];

        if (v10) {
          goto LABEL_6;
        }
        unsigned __int8 v13 = sub_100068600();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_1000DB9C4(v13);
        }

        id v12 = +[NSError errorDomainMSDWithCode:3727744737 message:@"Cannot write file."];
      }
      else
      {
        id v11 = sub_100068600();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_1000DB980(v11);
        }

        id v12 = +[NSError errorDomainMSDWithCode:3727744512 message:@"Unexpected server response."];
        uint64_t v7 = 0;
      }
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setError:v12];

      goto LABEL_6;
    }
  }
  uint64_t v7 = 0;
LABEL_6:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_1000AB7C0(uint64_t a1, void *a2)
{
  id v3 = [a2 error];
  [*(id *)(a1 + 32) setError:v3];

  uint64_t v5 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);

  return _[v4 checkIPAForResponse:v5 withRequest:v6];
}

void sub_1000ABDA4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000AC2EC(id a1)
{
  uint64_t v1 = objc_alloc_init(MSDUIHelper);
  uint64_t v2 = qword_100189CA0;
  qword_100189CA0 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_1000AC4D0(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1000AC4E4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = sub_100068600();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (!v2)
  {
    if (v4)
    {
      *(_WORD *)id v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "App providing UI checking out or app terminated.", v18, 2u);
    }

    uint64_t v17 = *(void *)(a1 + 40);
    id v16 = *(id *)(v17 + 16);
    *(void *)(v17 + 16) = 0;
    goto LABEL_11;
  }
  if (v4)
  {
    *(_WORD *)uint8_t buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "App providing UI checking in.", buf, 2u);
  }

  objc_storeStrong((id *)(*(void *)(a1 + 40) + 16), *(id *)(a1 + 32));
  uint64_t v5 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained(v5);
  uint64_t v7 = [WeakRetained pendingMessage];

  if (v7)
  {
    id v8 = objc_loadWeakRetained(v5);
    id v9 = [v8 connection];
    id v10 = objc_loadWeakRetained(v5);
    id v11 = [v10 pendingMessage];
    xpc_connection_send_message(v9, v11);

    id v12 = objc_loadWeakRetained(v5);
    [v12 setPendingMessage:0];
  }
  id v13 = objc_loadWeakRetained(v5);
  unsigned int v14 = [v13 fullScreenState];

  if (v14 == 1)
  {
    id v15 = objc_loadWeakRetained(v5);
    [v15 setFullScreenState:2];

    id v16 = objc_loadWeakRetained(v5);
    [v16 activateFullScreenUIAppMonitor];
LABEL_11:
  }
}

void sub_1000AC794(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_1000AC7A8(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unsigned int v4 = [WeakRetained fullScreenState];

  if (v4)
  {
    id v5 = objc_loadWeakRetained(v2);
    unsigned int v6 = [v5 allowCancel];
    int v7 = *(unsigned __int8 *)(a1 + 48);

    if (v7 == v6) {
      return;
    }
    uint64_t v15 = *(unsigned __int8 *)(a1 + 48);
    id v16 = objc_loadWeakRetained(v2);
    [v16 setAllowCancel:v15];

    id v18 = +[MSDUIHelper sharedInstance];
    id v17 = objc_loadWeakRetained(v2);
    [v18 demoUpdateAllowCancel:[v17 allowCancel]];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = objc_loadWeakRetained(v2);
    [v9 setMessage:v8];

    uint64_t v10 = *(unsigned __int8 *)(a1 + 48);
    id v11 = objc_loadWeakRetained(v2);
    [v11 setAllowCancel:v10];

    uint64_t v12 = *(unsigned __int8 *)(a1 + 49);
    id v13 = objc_loadWeakRetained(v2);
    [v13 setDisableIdleTimer:v12];

    id v14 = objc_loadWeakRetained(v2);
    [v14 setPendingMessage:0];

    id v18 = objc_loadWeakRetained(v2);
    [v18 requestFullScreenUI];
  }
}

void sub_1000ACA00(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1000ACA14(id *a1)
{
  uint64_t v2 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  unsigned int v4 = [WeakRetained fullScreenState];

  if (v4)
  {
    id v5 = objc_loadWeakRetained(v2);
    [v5 setFullScreenState:0];

    id v6 = objc_loadWeakRetained(v2);
    [v6 setCurrentProgress:0];

    id v7 = objc_loadWeakRetained(v2);
    [v7 deactivateFullScreenUIAppMonitor];

    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    id v9 = v8;
    if (v8)
    {
      xpc_dictionary_set_string(v8, "ContentUpdateStatus", "Completed");
      if (a1[4])
      {
        uint64_t v10 = sub_100068600();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          id v11 = [a1[4] code];
          uint64_t v12 = [a1[4] userInfo];
          *(_DWORD *)uint8_t buf = 134218242;
          id v34 = v11;
          __int16 v35 = 2114;
          uint64_t v36 = v12;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Sending xpc message with error: %td:%{public}@", buf, 0x16u);
        }
        xpc_dictionary_set_int64(v9, "ErrorCode", (int64_t)[a1[4] code]);
        id v13 = [a1[4] domain];
        xpc_dictionary_set_string(v9, "ErrorDomain", (const char *)[v13 cStringUsingEncoding:4]);

        id v14 = [a1[4] userInfo];
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_1000ACD34;
        v31[3] = &unk_100153E48;
        id v32 = v9;
        [v14 enumerateKeysAndObjectsUsingBlock:v31];
      }
      id v15 = objc_loadWeakRetained(v2);
      id v16 = [v15 connection];

      id v17 = objc_loadWeakRetained(v2);
      id v18 = v17;
      if (v16)
      {
        id v19 = [v17 connection];
        xpc_connection_send_message(v19, v9);
      }
      else
      {
        [v17 setPendingMessage:v9];
      }

      unsigned __int8 v20 = [a1[5] remoteAlertHandle];

      if (v20)
      {
        xpc_object_t v21 = [a1[5] remoteAlertHandle];
        [v21 removeObserver:a1[5]];

        unsigned int v22 = [a1[5] remoteAlertHandle];
        [v22 invalidate];

        [a1[5] setRemoteAlertHandle:0];
      }
    }
    else
    {
      double v23 = sub_100068600();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_1000DBBA0(v23, v24, v25, v26, v27, v28, v29, v30);
      }
    }
  }
}

void sub_1000ACD34(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = sub_100068600();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        sub_1000DBC18();
      }

      xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 32), (const char *)[v5 cStringUsingEncoding:4], (const char *)[objc_retainAutorelease(v6) cStringUsingEncoding:4]);
    }
  }
}

void sub_1000ACECC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1000ACEE0(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setFullScreenState:0];

  id v3 = objc_loadWeakRetained(v1);
  [v3 setCurrentProgress:0];

  id v4 = objc_loadWeakRetained(v1);
  [v4 deactivateFullScreenUIAppMonitor];
}

void sub_1000AD0C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_1000AD0E4(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned int v3 = [WeakRetained fullScreenState];

  if (v3 == 1)
  {
    id v4 = sub_100068600();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Timer triggered but still no UI checked in. Requesting blocking UI again...", v6, 2u);
    }

    id v5 = objc_loadWeakRetained(v1);
    [v5 requestFullScreenUI];
  }
}

void sub_1000AD2E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000AD300(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = +[RBSProcessStateDescriptor descriptor];
  [v4 setValues:1];
  [v4 setEndowmentNamespaces:&off_100162F68];
  [v3 setStateDescriptor:v4];
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  id v6 = [WeakRetained fullScreenUIAppId];
  id v7 = +[RBSProcessPredicate predicateMatchingBundleIdentifier:v6];
  id v11 = v7;
  xpc_object_t v8 = +[NSArray arrayWithObjects:&v11 count:1];
  [v3 setPredicates:v8];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000AD4AC;
  v9[3] = &unk_100153E98;
  objc_copyWeak(&v10, a1);
  [v3 setUpdateHandler:v9];
  objc_destroyWeak(&v10);
}

void sub_1000AD490(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1000AD4AC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = [v5 state];
  id v7 = [v6 taskState];

  xpc_object_t v8 = [v5 state];

  id v11 = [v8 endowmentNamespaces];

  id v9 = [v11 containsObject:@"com.apple.frontboard.visibility"];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleFullScreenUIAppStateChange:v7 withVisibility:v9];
}

void sub_1000AD880(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 64));
  _Unwind_Resume(a1);
}

void sub_1000AD8A4(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned int v3 = [WeakRetained fullScreenState];

  if (v3 == 2)
  {
    id v4 = objc_loadWeakRetained(v1);
    [v4 deactivateFullScreenUIAppMonitor];

    id v5 = objc_loadWeakRetained(v1);
    [v5 requestFullScreenUI];
  }
}

void sub_1000AD940(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned int v3 = [WeakRetained fullScreenState];

  if (v3 == 2)
  {
    id v4 = objc_loadWeakRetained(v1);
    [v4 launchFullScreenUI];

    id v5 = objc_loadWeakRetained(v1);
    [v5 demoUpdateProgress:[v5 currentProgress]];
  }
}

void sub_1000AE16C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_1000AE188(uint64_t a1)
{
  if ([*(id *)(a1 + 32) backlightStatus])
  {
    uint64_t v2 = (id *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained(v2);
    [WeakRetained deactivateFullScreenUIAppMonitor];

    id v4 = objc_loadWeakRetained(v2);
    unsigned int v5 = [v4 fullScreenState];

    if (v5 == 2)
    {
      id v6 = objc_loadWeakRetained(v2);
      [v6 requestFullScreenUI];
    }
  }
}

void sub_1000AE444(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1000AE458(uint64_t a1)
{
  uint64_t v2 = sub_100068600();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v4 = [WeakRetained backlightStatus];
    id v5 = [*(id *)(a1 + 32) displayBacklightLevel];
    int v15 = 134218240;
    id v16 = v4;
    __int16 v17 = 2048;
    id v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Backlight changed from %td to %td", (uint8_t *)&v15, 0x16u);
  }
  if ([*(id *)(a1 + 32) displayBacklightLevel] == (id)100)
  {
    id v6 = objc_loadWeakRetained((id *)(a1 + 40));
    id v7 = [v6 backlightStatus];

    if (!v7)
    {
      id v8 = objc_loadWeakRetained((id *)(a1 + 40));
      unsigned int v9 = [v8 fullScreenState];

      if (v9 == 2)
      {
        id v10 = sub_100068600();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v15) = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Device back up, starting full screen UI", (uint8_t *)&v15, 2u);
        }

        id v11 = objc_loadWeakRetained((id *)(a1 + 40));
        [v11 launchFullScreenUI];

        id v12 = objc_loadWeakRetained((id *)(a1 + 40));
        [v12 demoUpdateProgress:[v12 currentProgress]];
      }
    }
  }
  id v13 = [*(id *)(a1 + 32) displayBacklightLevel];
  id v14 = objc_loadWeakRetained((id *)(a1 + 40));
  [v14 setBacklightStatus:v13];
}

void sub_1000AE708(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1000AE71C(uint64_t a1)
{
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = sub_1000AEA0C;
  uint64_t v37 = sub_1000AEA1C;
  id v38 = 0;
  uint64_t v2 = sub_100068600();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint8_t buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "demoUpdateFailed(XPC) is called", buf, 2u);
  }

  unsigned int v3 = *(void **)(a1 + 32);
  if (!v3)
  {
    int v15 = sub_100068600();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000DBCB4(v15, v17, v18, v19, v20, v21, v22, v23);
    }
    goto LABEL_10;
  }
  if ([v3 code] != (id)3727741185)
  {
    xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
    id v5 = (void *)v34[5];
    v34[5] = (uint64_t)v4;

    id v6 = (void *)v34[5];
    if (v6)
    {
      xpc_dictionary_set_string(v6, "ContentUpdateStatus", "Error");
      xpc_dictionary_set_int64((xpc_object_t)v34[5], "ErrorCode", (int64_t)[*(id *)(a1 + 32) code]);
      id v7 = (void *)v34[5];
      id v8 = [*(id *)(a1 + 32) domain];
      xpc_dictionary_set_string(v7, "ErrorDomain", (const char *)[v8 cStringUsingEncoding:4]);

      unsigned int v9 = [*(id *)(a1 + 32) userInfo];
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_1000AEA24;
      v31[3] = &unk_100153EE8;
      void v31[4] = &v33;
      [v9 enumerateKeysAndObjectsUsingBlock:v31];

      id v10 = (id *)(a1 + 40);
      id WeakRetained = objc_loadWeakRetained(v10);
      id v12 = [WeakRetained connection];

      if (v12)
      {
        id v13 = objc_loadWeakRetained(v10);
        id v14 = [v13 connection];
        xpc_connection_send_message(v14, (xpc_object_t)v34[5]);

        int v15 = sub_100068600();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          sub_1000DBDA4();
        }
      }
      else
      {
        uint64_t v16 = v34[5];
        int v15 = objc_loadWeakRetained(v10);
        [v15 setPendingMessage:v16];
      }
    }
    else
    {
      int v15 = sub_100068600();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1000DBD2C(v15, v24, v25, v26, v27, v28, v29, v30);
      }
    }
LABEL_10:
  }
  _Block_object_dispose(&v33, 8);
}

void sub_1000AE9E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000AEA0C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000AEA1C(uint64_t a1)
{
}

void sub_1000AEA24(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = sub_100068600();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        sub_1000DBC18();
      }

      xpc_dictionary_set_string(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), (const char *)[v5 cStringUsingEncoding:4], (const char *)[objc_retainAutorelease(v6) cStringUsingEncoding:4]);
    }
  }
}

void sub_1000AEBCC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1000AEBE0(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  unsigned int v3 = sub_100068600();
  xpc_object_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Sending a progress(XPC)", v19, 2u);
    }

    xpc_dictionary_set_string(v2, "ContentUpdateStatus", "Progress");
    xpc_dictionary_set_int64(v2, "Percentage", *(void *)(a1 + 40));
    id v5 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v7 = [WeakRetained connection];

    id v8 = objc_loadWeakRetained((id *)(a1 + 32));
    unsigned int v9 = v8;
    if (v7)
    {
      id v10 = [v8 connection];
      xpc_connection_send_message(v10, v2);

      unsigned int v9 = sub_100068600();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        sub_1000DBDA4();
      }
    }
    else
    {
      [v8 setPendingMessage:v2];
    }

    uint64_t v11 = *(void *)(a1 + 40);
    xpc_object_t v4 = objc_loadWeakRetained(v5);
    [v4 setCurrentProgress:v11];
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    sub_1000DBDD8(v4, v12, v13, v14, v15, v16, v17, v18);
  }
}

void sub_1000AEE18(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1000AEE2C(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  unsigned int v3 = sub_100068600();
  xpc_object_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = *(unsigned __int8 *)(a1 + 40);
      v18[0] = 67109120;
      v18[1] = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Sending allowCancel(XPC): %d", (uint8_t *)v18, 8u);
    }

    xpc_dictionary_set_string(v2, "ContentUpdateStatus", "AllowContentUpdateCancel");
    xpc_dictionary_set_BOOL(v2, "allowCancel", *(unsigned char *)(a1 + 40));
    id v6 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v8 = [WeakRetained connection];

    unsigned int v9 = objc_loadWeakRetained(v6);
    xpc_object_t v4 = v9;
    if (v8)
    {
      id v10 = [v9 connection];
      xpc_connection_send_message(v10, v2);

      xpc_object_t v4 = sub_100068600();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        sub_1000DBDA4();
      }
    }
    else
    {
      [v9 setPendingMessage:v2];
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    sub_1000DBE50(v4, v11, v12, v13, v14, v15, v16, v17);
  }
}

void sub_1000AF174(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_1000AF1E8(id a1)
{
  uint64_t v1 = objc_alloc_init(MSDEnrollPassword);
  uint64_t v2 = qword_100189CB0;
  qword_100189CB0 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_1000AF52C(id a1)
{
  uint64_t v1 = objc_alloc_init(MSDWorkQueueSet);
  uint64_t v2 = (void *)qword_100189CC0;
  qword_100189CC0 = (uint64_t)v1;

  dispatch_queue_t v3 = dispatch_queue_create("com.apple.msddemoupdate", 0);
  [(id)qword_100189CC0 setDemoUpdateQueue:v3];

  dispatch_queue_t v4 = dispatch_queue_create("com.apple.msdmessage", 0);
  [(id)qword_100189CC0 setMessageQueue:v4];

  dispatch_queue_t v5 = dispatch_queue_create("com.apple.msdpolling", 0);
  [(id)qword_100189CC0 setPollingQueue:v5];

  dispatch_queue_t v6 = dispatch_queue_create("com.apple.backgroundDownloadQueue", 0);
  [(id)qword_100189CC0 setBackgroundDownloadQueue:v6];

  dispatch_queue_t v7 = dispatch_queue_create("com.apple.contentDownloadQueue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
  [(id)qword_100189CC0 setContentDownloadConcurrentQueue:v7];

  id v8 = objc_alloc_init((Class)NSOperationQueue);
  [(id)qword_100189CC0 setOperationQueue:v8];

  unsigned int v9 = [(id)qword_100189CC0 operationQueue];
  id v10 = [(id)qword_100189CC0 contentDownloadConcurrentQueue];
  [v9 setUnderlyingQueue:v10];

  id v11 = [(id)qword_100189CC0 operationQueue];
  [v11 setMaxConcurrentOperationCount:3];
}

void sub_1000AF7EC(id a1)
{
  uint64_t v1 = objc_alloc_init(MSDCryptoHandler);
  uint64_t v2 = qword_100189CD0;
  qword_100189CD0 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_1000B092C(id a1)
{
  uint64_t v1 = objc_alloc_init(MSDHelperAgent);
  uint64_t v2 = qword_100189CE0;
  qword_100189CE0 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_1000B0A84(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  xpc_type_t type = xpc_get_type(v2);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (v2 == (OS_xpc_object *)&_xpc_error_connection_invalid)
    {
      dispatch_queue_t v4 = sub_100068600();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_1000DC530(v4, v12, v13, v14, v15, v16, v17, v18);
      }
    }
    else
    {
      if (v2 != (OS_xpc_object *)&_xpc_error_connection_interrupted) {
        goto LABEL_11;
      }
      dispatch_queue_t v4 = sub_100068600();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_1000DC568(v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }

    goto LABEL_11;
  }
  if (type != (xpc_type_t)&_xpc_type_dictionary) {
    sub_1000DC5A0();
  }
LABEL_11:
}

void sub_1000B5630(id a1)
{
  uint64_t v1 = objc_alloc_init(MSDDemoUpdateStatusHub);
  uint64_t v2 = (void *)qword_100189CF0;
  qword_100189CF0 = (uint64_t)v1;

  id v3 = +[NSMutableSet setWithCapacity:0];
  [(id)qword_100189CF0 setDelegates:v3];
}

void sub_1000B5A84(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1000B5AA4(uint64_t a1, void *a2, unsigned char *a3)
{
  id result = [a2 demoUpdateProgress:*(void *)(a1 + 32)];
  *a3 = 0;
  return result;
}

void sub_1000B5BE4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1000B5BFC(uint64_t a1, void *a2, unsigned char *a3)
{
  id result = [a2 demoUpdateCompleted:*(void *)(a1 + 32)];
  *a3 = 0;
  return result;
}

void sub_1000B5D24(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1000B5D38(uint64_t a1, void *a2, unsigned char *a3)
{
  id result = [a2 demoUpdateFailed:*(void *)(a1 + 32)];
  *a3 = 0;
  return result;
}

void sub_1000B5DDC(id a1)
{
  uint64_t v1 = objc_alloc_init(MSDWiFiHelper);
  uint64_t v2 = qword_100189D00;
  qword_100189D00 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

id sub_1000B7048(uint64_t a1, void *a2)
{
  id result = [a2 type];
  if (result == (id)10)
  {
    dispatch_queue_t v4 = sub_100068600();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Wifi interface is now initialized. Should be safe to proceed..", v5, 2u);
    }

    [*(id *)(a1 + 32) lock];
    [*(id *)(a1 + 32) signal];
    return [*(id *)(a1 + 32) unlock];
  }
  return result;
}

void sub_1000B7A60(id a1)
{
  uint64_t v1 = objc_alloc_init(MSDDemoUpdateTimeKeeper);
  uint64_t v2 = qword_100189D10;
  qword_100189D10 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

id sub_1000B7DC8(uint64_t a1)
{
  uint64_t v2 = sub_100068600();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "The previous completion timer will be invalidated.", v5, 2u);
  }

  id v3 = [*(id *)(a1 + 32) timer];
  [v3 invalidate];

  return [*(id *)(a1 + 32) setTimer:0];
}

void sub_1000B7E58(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) date];
  [v3 timeIntervalSinceNow];
  uint64_t v2 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(void *)(a1 + 32), "forceSwitchToDemoMode:", 0, 0);
  [*(id *)(a1 + 32) setTimer:v2];
}

id sub_1000B7FE8(uint64_t a1)
{
  uint64_t v2 = sub_100068600();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Invalidate fatal error timer.", v5, 2u);
  }

  id v3 = [*(id *)(a1 + 32) timerForFatalError];
  [v3 invalidate];

  return [*(id *)(a1 + 32) setTimerForFatalError:0];
}

void sub_1000B8078(uint64_t a1)
{
  uint64_t v2 = sub_100068600();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(a1 + 40);
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Setting up fatal error timer to trigger %d seconds later.", (uint8_t *)v5, 8u);
  }

  dispatch_queue_t v4 = +[NSTimer scheduledTimerWithTimeInterval:*(void *)(a1 + 32) target:"forceSwitchToDemoMode:" selector:0 userInfo:0 repeats:(double)*(int *)(a1 + 40)];
  [*(id *)(a1 + 32) setTimerForFatalError:v4];
}

void sub_1000B8D48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
}

uint64_t sub_1000B8DD4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000B8DE4(uint64_t a1)
{
}

id sub_1000B8DEC(uint64_t a1, int a2)
{
  dispatch_queue_t v4 = sub_1000687C8();
  uint64_t v5 = (char *)[*(id *)(a1 + 32) signpostId];
  if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v6 = (os_signpost_id_t)v5;
    if (os_signpost_enabled(v4))
    {
      int v7 = *(unsigned __int8 *)(a1 + 104);
      *(_DWORD *)uint8_t buf = 67109120;
      LODWORD(v19) = v7;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_END, v6, "Download File", "File download result: %{xcode:BOOLean}d", buf, 8u);
    }
  }

  if (a2)
  {
    id v8 = [*(id *)(a1 + 40) fileSizeInCache:*(void *)(a1 + 48)];
    uint64_t v9 = sub_1000687C8();
    uint64_t v10 = (char *)[*(id *)(a1 + 32) signpostId];
    if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v11 = (os_signpost_id_t)v10;
      if (os_signpost_enabled(v9))
      {
        *(_DWORD *)uint8_t buf = 134217984;
        id v19 = v8;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, v11, "File Downloaded", "File download size: %{xcode:size-in-bytes}llu", buf, 0xCu);
      }
    }

    if (os_variant_has_internal_content())
    {
      uint64_t v12 = *(void *)(a1 + 48);
      CFStringRef v16 = @"Hash";
      uint64_t v17 = v12;
      uint64_t v13 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setObject:v13 forKey:*(void *)(a1 + 56)];
    }
  }
  else
  {
    uint64_t v14 = sub_100068600();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000DD3E8(a1, v14);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
  }
  [*(id *)(a1 + 72) lock];
  --*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
  [*(id *)(a1 + 72) broadcast];
  return [*(id *)(a1 + 72) unlock];
}

void sub_1000B91BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000B91E4(uint64_t a1, void *a2)
{
  int v3 = [a2 error];
  if (*(void *)(a1 + 32))
  {
    id v5 = v3;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained setError:v5];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    int v3 = v5;
  }
}

void sub_1000B92C8(id a1)
{
  uint64_t v1 = objc_alloc_init(MSDDemoPeerResponder);
  uint64_t v2 = qword_100189D28;
  qword_100189D28 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_1000B95C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000B96D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000B9D38(id a1, MSDServerResponse *a2)
{
  uint64_t v2 = [(MSDServerResponse *)a2 error];
  if (v2)
  {
    int v3 = sub_100068600();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1000DD470(v2, v3);
    }
  }
}

id sub_1000BABCC(uint64_t a1)
{
  [*(id *)(a1 + 32) saveOperationRequest:@"RevertSnapshot" requestFlag:0 completeBy:0];
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2 && [v2 BOOLValue])
  {
    int v3 = *(void **)(a1 + 32);
    return [v3 revertSnapshot];
  }
  else
  {
    id v5 = *(void **)(a1 + 32);
    return _[v5 revertSnapshotAndShutdown];
  }
}

void sub_1000BC9C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000BCA64(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000BCAD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1000BDB9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

BOOL sub_1000BDC1C(id a1, BMStoreEvent *a2)
{
  uint64_t v2 = a2;
  int v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000DDC60(v3);
  }

  dispatch_queue_t v4 = [(BMStoreEvent *)v2 eventBody];
  +[MSDBiomeAppInFocusStream printBMAppInfocusEvent:v4];

  id v5 = [(BMStoreEvent *)v2 eventBody];

  unsigned __int8 v6 = [v5 starting];
  return v6;
}

NSCopying *__cdecl sub_1000BDCC0(id a1, BMStoreEvent *a2)
{
  uint64_t v2 = [(BMStoreEvent *)a2 eventBody];
  int v3 = [v2 bundleID];

  return (NSCopying *)v3;
}

uint64_t sub_1000BDD10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000BDD20(uint64_t a1)
{
}

void sub_1000BDD28(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 state])
  {
    int v7 = sub_100068600();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000DDCE4(v5, v7);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    int v7 = sub_100068600();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      uint64_t v9 = "+[MSDBiomeAppInFocusStream collectAppUsageDataFrom:to:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s - Sink completed successfully.", (uint8_t *)&v8, 0xCu);
    }
  }
}

void sub_1000BDE40(id *a1, void *a2)
{
  id v26 = a2;
  int v3 = [v26 startEvent];
  dispatch_queue_t v4 = [v3 eventBody];

  id v5 = [v26 endEvent];
  id v6 = [v5 eventBody];

  int v7 = sub_100068600();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1000DDE68();
  }

  int v8 = sub_100068600();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1000DDE34();
  }

  +[MSDBiomeAppInFocusStream printBMAppInfocusEvent:v4];
  uint64_t v9 = sub_100068600();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_1000DDE00();
  }

  +[MSDBiomeAppInFocusStream printBMAppInfocusEvent:v6];
  uint64_t v10 = [v4 absoluteTimestamp];
  os_signpost_id_t v11 = [v6 absoluteTimestamp];
  id v12 = v10;
  id v13 = v11;
  uint64_t v14 = a1[5];
  id v15 = a1[6];
  id v16 = v12;
  id v17 = v13;
  uint64_t v18 = v17;
  if (MSDFileDownloadCredentials.vtable == (void **)-3336)
  {
    id v23 = v16;
    id v24 = v17;
LABEL_12:

    goto LABEL_13;
  }
  if (+[MSDBiomeAppInFocusStream timeRange:subsumes:](MSDBiomeAppInFocusStream, "timeRange:subsumes:", v14, v15, v16, v17))
  {
    id v19 = [v4 launchReason];
    unsigned __int8 v20 = [v19 isEqualToString:@"com.apple.SpringBoard.transitionReason.externalrequest"];

    if ((v20 & 1) == 0)
    {
      id v21 = v4;
      id v22 = v6;
      id v23 = v21;
      id v24 = v22;
      +[MSDBiomeAppInFocusStream eventSessionToAppUsage:](MSDBiomeAppInFocusStream, "eventSessionToAppUsage:", v23, v24);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      [a1[4] addObject:v15];
      uint64_t v14 = sub_100068600();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v25 = [v23 bundleID];
        sub_1000DDDA8(v25, buf, v14);
      }
      goto LABEL_12;
    }
  }
LABEL_13:
}

void sub_1000BE0EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000BE120(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 40) = *(id *)(a2 + 40);
  id result = *(id *)(a2 + 48);
  *(void *)(a1 + 48) = result;
  return result;
}

void sub_1000BE15C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 48);
}

void sub_1000BE198(id *a1, void *a2)
{
  id v18 = a2;
  uint64_t v2 = [v18 events];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || ![v2 count])
  {
    uint64_t v14 = sub_100068600();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000DDE9C();
    }
    os_signpost_id_t v11 = 0;
    id v10 = 0;
    dispatch_queue_t v4 = 0;
    goto LABEL_13;
  }
  int v3 = [v2 objectAtIndexedSubscript:0];
  dispatch_queue_t v4 = [v3 eventBody];

  id v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000DDF34();
  }

  +[MSDBiomeAppInFocusStream printBMAppInfocusEvent:v4];
  id v6 = [v4 absoluteTimestamp];
  int v7 = [v4 absoluteTimestamp];
  id v8 = a1[5];
  id v9 = a1[6];
  id v10 = v6;
  os_signpost_id_t v11 = v7;
  if (MSDFileDownloadCredentials.vtable == (void **)-3336)
  {

    uint64_t v14 = v11;
LABEL_13:

    goto LABEL_14;
  }
  if (+[MSDBiomeAppInFocusStream timeRange:subsumes:](MSDBiomeAppInFocusStream, "timeRange:subsumes:", v8, v9, v10, v11))
  {
    id v12 = [v4 launchReason];
    unsigned __int8 v13 = [v12 isEqualToString:@"com.apple.SpringBoard.transitionReason.externalrequest"];

    if ((v13 & 1) == 0)
    {
      uint64_t v14 = v4;
      id v15 = +[MSDBiomeAppInFocusStream eventSessionToAppUsage:](MSDBiomeAppInFocusStream, "eventSessionToAppUsage:", v14, 0);
      [a1[4] addObject:v15];
      id v16 = sub_100068600();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        id v17 = [v14 bundleID];
        sub_1000DDEDC(v17, buf, v16);
      }

      dispatch_queue_t v4 = v14;
      goto LABEL_13;
    }
  }
LABEL_14:
}

void sub_1000BE464(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

int64_t sub_1000BE494(id a1, NSDictionary *a2, NSDictionary *a3)
{
  dispatch_queue_t v4 = a3;
  id v5 = [(NSDictionary *)a2 objectForKeyedSubscript:@"sessionStartTime"];
  id v6 = [(NSDictionary *)v4 objectForKeyedSubscript:@"sessionStartTime"];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

void sub_1000BE6D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000BE874(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000BE9B0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t sub_1000BE9D0(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = a2;
  return result;
}

void sub_1000BE9E8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void sub_1000BEA70(id a1)
{
  uint64_t v1 = objc_alloc_init(MSDLanguageAndRegionHelper);
  uint64_t v2 = qword_100189D30;
  qword_100189D30 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_1000BF35C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000BF4A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1000C1B88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Block_object_dispose((const void *)(v29 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000C1BC4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000C1BD4(uint64_t a1)
{
}

void sub_1000C1BDC(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  if (v8)
  {
    id v9 = [v8 serverType];
    unsigned int v10 = [v9 isEqualToString:@"localCachingHub"];

    if (!v6)
    {
      if (v10)
      {
        uint64_t v25 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) urlSchema];
        [*(id *)(a1 + 32) setLocalHubURLSchema:v25];
      }
      id v26 = +[MSDAnalyticsEventHandler sharedInstance];
      uint64_t v27 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) serverType];
      [v26 sendFileDownloadSourceEvent:v27];

      uint64_t v28 = sub_1000687C8();
      uint64_t v29 = (char *)[*(id *)(a1 + 32) signpostId];
      if ((unint64_t)(v29 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v30 = (os_signpost_id_t)v29;
        if (os_signpost_enabled(v28))
        {
          CFDataRef v31 = [*(id *)(a1 + 40) fileInfo];
          id v32 = [v31 fileHash];
          uint64_t v33 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) serverType];
          int v38 = 138543618;
          uint64_t v39 = v32;
          __int16 v40 = 2114;
          long long v41 = v33;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_EVENT, v30, "Download File", "File with hash %{public}@ downloaded from %{public}@", (uint8_t *)&v38, 0x16u);
        }
      }

      goto LABEL_21;
    }
    if (v10) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), a2);
    }
    if (!v7
      || ([v7 objectForKey:@"statusCode"],
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          uint64_t v12 = *(void *)(*(void *)(a1 + 96) + 8),
          unsigned __int8 v13 = *(void **)(v12 + 40),
          *(void *)(v12 + 40) = v11,
          v13,
          !v11))
    {
      uint64_t v14 = *(void *)(*(void *)(a1 + 96) + 8);
      id v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = &off_100162390;
    }
  }
  uint64_t v16 = [*(id *)(a1 + 48) nextTry];
  uint64_t v17 = *(void *)(*(void *)(a1 + 80) + 8);
  id v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v16;

  id v19 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  if (v19)
  {
    unsigned __int8 v20 = [v19 urlSchema];
    [*(id *)(a1 + 56) setUrlSchema:v20];

    id v21 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) credential];
    id v22 = [v21 objectForKey:@"Headers"];
    [*(id *)(a1 + 56) setCredentialHeaders:v22];

    id v23 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) serverType];
    [*(id *)(a1 + 56) setServerType:v23];

    [*(id *)(a1 + 64) launchTaskWithInfo:*(void *)(a1 + 56)];
    goto LABEL_24;
  }
  id v24 = sub_100068600();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    sub_1000DE33C(a1, v24);
  }

  if ([v6 code] == (id)-1001
    || [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) integerValue] == (id)408)
  {
    [*(id *)(a1 + 32) limitConcurrentRequests];
  }
LABEL_21:
  uint64_t v34 = [*(id *)(a1 + 40) parseResponseForError:v6 andPayload:v7];
  uint64_t v35 = *(void *)(*(void *)(a1 + 104) + 8);
  uint64_t v36 = *(void **)(v35 + 40);
  *(void *)(v35 + 40) = v34;

  uint64_t v37 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) serverType];
  [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) setDownloadSource:v37];

  [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) setLocalHubError:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
  if ([*(id *)(a1 + 72) tryCachingHub]) {
    [*(id *)(a1 + 32) updateLocalHubReachability:*(id *)(a1 + 48) withRequest:*(void *)(a1 + 40) andResponse:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40)];
  }
  [*(id *)(a1 + 32) handleCompletionForDownloadRequest:*(void *)(a1 + 40) withResponse:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) forSession:*(void *)(a1 + 64)];
LABEL_24:
}

void *sub_1000C3140(void *result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    int v3 = result;
    id result = +[NSError errorDomainMSDWithCode:a2 message:a3];
    *int v3 = result;
  }
  return result;
}

void *sub_1000C3188(void *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (result)
  {
    dispatch_queue_t v4 = result;
    id result = +[NSError errorDomainMSDWithCode:a2 message:a3 reason:a4];
    *dispatch_queue_t v4 = result;
  }
  return result;
}

uint64_t sub_1000C31D4(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a1 && !*a1)
  {
    id v8 = v5;
    id v5 = +[NSError errorDomainMSDWithCode:a2 message:v5];
    id v6 = v8;
    *a1 = v5;
  }

  return _objc_release_x1(v5, v6);
}

void sub_1000C3FDC(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_queue_t v4 = sub_100068600();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Log upload completed. Error: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  id v5 = [*(id *)(a1 + 32) completion];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) completion];
    id v7 = [[MSDServerResponse alloc] initWithError:v3];
    ((void (**)(void, MSDServerResponse *))v6)[2](v6, v7);
  }
}

uint64_t sub_1000C40F0()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000C62D8(v0, qword_100189D48);
  sub_1000C5B50(v0, (uint64_t)qword_100189D48);
  return Logger.init(subsystem:category:)();
}

uint64_t static MSDGreyMatter.checkAvailabilityWithCompletion(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_1000C427C(&qword_1001897E8);
  __chkstk_darwin(v5 - 8);
  id v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  id v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  void v9[4] = a1;
  v9[5] = a2;
  v9[6] = v2;
  swift_retain();
  sub_1000C54A8((uint64_t)v7, (uint64_t)&unk_1001897F8, (uint64_t)v9);
  return swift_release();
}

uint64_t sub_1000C427C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000C42C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  sub_1000C427C(&qword_100189838);
  v5[7] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for GenerativeModelsAvailability.ChangeSequence();
  v5[8] = v6;
  v5[9] = *(void *)(v6 - 8);
  v5[10] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for GenerativeModelsAvailability.ChangeSequence.Iterator();
  v5[11] = v7;
  v5[12] = *(void *)(v7 - 8);
  v5[13] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for GenerativeModelsAvailability.Availability();
  v5[14] = v8;
  v5[15] = *(void *)(v8 - 8);
  uint8_t v5[16] = swift_task_alloc();
  v5[17] = swift_task_alloc();
  v5[18] = swift_task_alloc();
  v5[19] = swift_task_alloc();
  v5[20] = swift_task_alloc();
  v5[21] = swift_task_alloc();
  v5[22] = swift_task_alloc();
  uint64_t v9 = type metadata accessor for GenerativeModelsAvailability.Parameters();
  v5[23] = v9;
  v5[24] = *(void *)(v9 - 8);
  v5[25] = swift_task_alloc();
  uint64_t v10 = type metadata accessor for GenerativeModelsAvailability();
  v5[26] = v10;
  v5[27] = *(void *)(v10 - 8);
  v5[28] = swift_task_alloc();
  return _swift_task_switch(sub_1000C456C, 0, 0);
}

uint64_t sub_1000C456C()
{
  uint64_t v52 = v0;
  uint64_t v1 = *(void *)(v0 + 192);
  uint64_t v2 = *(void *)(v0 + 200);
  uint64_t v4 = *(void *)(v0 + 176);
  uint64_t v3 = *(void *)(v0 + 184);
  uint64_t v5 = *(void *)(v0 + 168);
  uint64_t v6 = *(void *)(v0 + 112);
  uint64_t v7 = *(void **)(v0 + 120);
  GenerativeModelsAvailability.Parameters.init(useCaseIdentifiers:)();
  static GenerativeModelsAvailability.current(parameters:)();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v2, v3);
  GenerativeModelsAvailability.availability.getter();
  uint64_t v8 = (void (*)(uint64_t, uint64_t, uint64_t))v7[2];
  *(void *)(v0 + 232) = v8;
  *(void *)(v0 + 240) = (unint64_t)(v7 + 2) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v8(v5, v4, v6);
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))v7[11];
  *(void *)(v0 + 248) = v9;
  *(void *)(v0 + 256) = (unint64_t)(v7 + 11) & 0xFFFFFFFFFFFFLL | 0xA3B5000000000000;
  int v10 = v9(v5, v6);
  LODWORD(v2) = enum case for GenerativeModelsAvailability.Availability.available(_:);
  *(_DWORD *)(v0 + 304) = enum case for GenerativeModelsAvailability.Availability.available(_:);
  uint64_t v11 = (void (*)(uint64_t, uint64_t))v7[1];
  *(void *)(v0 + 264) = v11;
  *(void *)(v0 + 272) = (unint64_t)(v7 + 1) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v11(v5, v6);
  if (v10 == v2)
  {
    if (qword_100189D40 != -1) {
      swift_once();
    }
    uint64_t v12 = *(void *)(v0 + 176);
    uint64_t v13 = *(void *)(v0 + 152);
    uint64_t v14 = *(void *)(v0 + 112);
    uint64_t v15 = type metadata accessor for Logger();
    sub_1000C5B50(v15, (uint64_t)qword_100189D48);
    v8(v13, v12, v14);
    uint64_t v16 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.default.getter();
    BOOL v18 = os_log_type_enabled(v16, v17);
    uint64_t v19 = *(void *)(v0 + 152);
    uint64_t v20 = *(void *)(v0 + 112);
    if (v18)
    {
      id v21 = (uint8_t *)swift_slowAlloc();
      uint64_t v51 = swift_slowAlloc();
      *(_DWORD *)id v21 = 136315138;
      sub_1000C61E0(&qword_100189850, (void (*)(uint64_t))&type metadata accessor for GenerativeModelsAvailability.Availability);
      uint64_t v22 = dispatch thunk of CustomStringConvertible.description.getter();
      *(void *)(v0 + 32) = sub_1000C5B88(v22, v23, &v51);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v11(v19, v20);
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "GM is already available: %s", v21, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      v11(*(void *)(v0 + 152), *(void *)(v0 + 112));
    }

    uint64_t v36 = *(void (**)(uint64_t, uint64_t))(v0 + 264);
    uint64_t v37 = *(void *)(v0 + 216);
    uint64_t v38 = *(void *)(v0 + 224);
    uint64_t v39 = *(void *)(v0 + 208);
    uint64_t v40 = *(void *)(v0 + 176);
    uint64_t v41 = *(void *)(v0 + 112);
    (*(void (**)(void))(v0 + 40))();
    v36(v40, v41);
    (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v38, v39);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unsigned int v42 = *(uint64_t (**)(void))(v0 + 8);
    return v42();
  }
  else
  {
    if (qword_100189D40 != -1) {
      swift_once();
    }
    uint64_t v24 = *(void *)(v0 + 176);
    uint64_t v25 = *(void *)(v0 + 160);
    uint64_t v26 = *(void *)(v0 + 112);
    uint64_t v27 = type metadata accessor for Logger();
    *(void *)(v0 + 280) = sub_1000C5B50(v27, (uint64_t)qword_100189D48);
    v8(v25, v24, v26);
    uint64_t v28 = Logger.logObject.getter();
    os_log_type_t v29 = static os_log_type_t.default.getter();
    BOOL v30 = os_log_type_enabled(v28, v29);
    uint64_t v31 = *(void *)(v0 + 160);
    uint64_t v32 = *(void *)(v0 + 112);
    if (v30)
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      uint64_t v51 = swift_slowAlloc();
      *(_DWORD *)uint64_t v33 = 136315138;
      sub_1000C61E0(&qword_100189850, (void (*)(uint64_t))&type metadata accessor for GenerativeModelsAvailability.Availability);
      uint64_t v34 = dispatch thunk of CustomStringConvertible.description.getter();
      *(void *)(v0 + 24) = sub_1000C5B88(v34, v35, &v51);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v11(v31, v32);
      _os_log_impl((void *)&_mh_execute_header, v28, v29, "GM is not available: %s Waiting for GM availability.", v33, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      v11(*(void *)(v0 + 160), *(void *)(v0 + 112));
    }

    uint64_t v45 = *(void *)(v0 + 72);
    uint64_t v44 = *(void *)(v0 + 80);
    uint64_t v46 = *(void *)(v0 + 64);
    GenerativeModelsAvailability.changes.getter();
    GenerativeModelsAvailability.ChangeSequence.makeAsyncIterator()();
    (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v44, v46);
    uint64_t v47 = sub_1000C61E0(&qword_100189840, (void (*)(uint64_t))&type metadata accessor for GenerativeModelsAvailability.ChangeSequence.Iterator);
    uint64_t v48 = (void *)swift_task_alloc();
    *(void *)(v0 + 288) = v48;
    void *v48 = v0;
    v48[1] = sub_1000C4C60;
    uint64_t v49 = *(void *)(v0 + 88);
    uint64_t v50 = *(void *)(v0 + 56);
    return dispatch thunk of AsyncIteratorProtocol.next()(v50, v49, v47);
  }
}

uint64_t sub_1000C4C60()
{
  *(void *)(*(void *)v1 + 296) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1000C5258;
  }
  else {
    uint64_t v2 = sub_1000C4D74;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000C4D74()
{
  uint64_t v47 = v0;
  uint64_t v1 = *(void *)(v0 + 112);
  uint64_t v2 = *(void *)(v0 + 120);
  uint64_t v3 = *(void *)(v0 + 56);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    uint64_t v4 = (*(uint64_t (**)(void, void))(*(void *)(v0 + 96) + 8))(*(void *)(v0 + 104), *(void *)(v0 + 88));
LABEL_10:
    uint64_t v33 = *(void (**)(uint64_t, uint64_t))(v0 + 264);
    uint64_t v34 = *(void *)(v0 + 216);
    uint64_t v35 = *(void *)(v0 + 224);
    uint64_t v36 = *(void *)(v0 + 208);
    uint64_t v37 = *(void *)(v0 + 176);
    uint64_t v38 = *(void *)(v0 + 112);
    (*(void (**)(uint64_t))(v0 + 40))(v4);
    v33(v37, v38);
    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v35, v36);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v39 = *(uint64_t (**)(void))(v0 + 8);
    return v39();
  }
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 232);
  uint64_t v7 = *(void *)(v0 + 136);
  uint64_t v6 = *(void *)(v0 + 144);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v6, v3, v1);
  v5(v7, v6, v1);
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  BOOL v10 = os_log_type_enabled(v8, v9);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v0 + 264);
  uint64_t v12 = *(void *)(v0 + 136);
  uint64_t v13 = *(void *)(v0 + 112);
  if (v10)
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v46 = swift_slowAlloc();
    *(_DWORD *)uint64_t v14 = 136315138;
    sub_1000C61E0(&qword_100189850, (void (*)(uint64_t))&type metadata accessor for GenerativeModelsAvailability.Availability);
    uint64_t v15 = dispatch thunk of CustomStringConvertible.description.getter();
    *(void *)(v14 + 4) = sub_1000C5B88(v15, v16, &v46);
    swift_bridgeObjectRelease();
    v11(v12, v13);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Received updated availability: %s", (uint8_t *)v14, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    v11(*(void *)(v0 + 136), *(void *)(v0 + 112));
  }

  int v17 = *(_DWORD *)(v0 + 304);
  BOOL v18 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 248);
  uint64_t v19 = *(void *)(v0 + 128);
  uint64_t v20 = *(void *)(v0 + 112);
  (*(void (**)(uint64_t, void, uint64_t))(v0 + 232))(v19, *(void *)(v0 + 144), v20);
  int v21 = v18(v19, v20);
  uint64_t v22 = *(void *)(v0 + 128);
  uint64_t v23 = *(void *)(v0 + 112);
  if (v21 == v17)
  {
    (*(void (**)(void, void))(v0 + 264))(*(void *)(v0 + 128), *(void *)(v0 + 112));
    uint64_t v24 = Logger.logObject.getter();
    os_log_type_t v25 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "GM is now available.", v26, 2u);
      swift_slowDealloc();
    }
    uint64_t v27 = *(void (**)(uint64_t, uint64_t))(v0 + 264);
    uint64_t v28 = *(void *)(v0 + 144);
    uint64_t v30 = *(void *)(v0 + 104);
    uint64_t v29 = *(void *)(v0 + 112);
    uint64_t v31 = *(void *)(v0 + 88);
    uint64_t v32 = *(void *)(v0 + 96);

    v27(v28, v29);
    uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v32 + 8))(v30, v31);
    goto LABEL_10;
  }
  uint64_t v41 = *(void (**)(uint64_t, uint64_t))(v0 + 264);
  v41(*(void *)(v0 + 144), *(void *)(v0 + 112));
  v41(v22, v23);
  uint64_t v42 = sub_1000C61E0(&qword_100189840, (void (*)(uint64_t))&type metadata accessor for GenerativeModelsAvailability.ChangeSequence.Iterator);
  uint64_t v43 = (void *)swift_task_alloc();
  *(void *)(v0 + 288) = v43;
  *uint64_t v43 = v0;
  v43[1] = sub_1000C4C60;
  uint64_t v44 = *(void *)(v0 + 88);
  uint64_t v45 = *(void *)(v0 + 56);
  return dispatch thunk of AsyncIteratorProtocol.next()(v45, v44, v42);
}

uint64_t sub_1000C5258()
{
  *(void *)(v0 + 16) = *(void *)(v0 + 296);
  sub_1000C427C(&qword_100189848);
  uint64_t v1 = swift_dynamicCast();
  return _swift_willThrowTypedImpl(v1, &type metadata for Never, &protocol witness table for Never);
}

uint64_t sub_1000C52DC()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_1000C531C()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_1000C53B4;
  return sub_1000C42C0((uint64_t)v4, v5, v6, v2, v3);
}

uint64_t sub_1000C53B4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000C54A8(uint64_t a1, uint64_t a2, uint64_t a3)
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
  sub_1000C582C(a1);
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

id MSDGreyMatter.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id MSDGreyMatter.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super init];
}

id MSDGreyMatter.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super dealloc];
}

uint64_t type metadata accessor for MSDGreyMatter()
{
  return self;
}

uint64_t sub_1000C57E4()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000C581C()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_1000C582C(uint64_t a1)
{
  uint64_t v2 = sub_1000C427C(&qword_1001897E8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000C588C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1000C5968;
  return v6(a1);
}

uint64_t sub_1000C5968()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000C5A60()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000C5A98(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1000C53B4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100189828 + dword_100189828);
  return v6(a1, v4);
}

uint64_t sub_1000C5B50(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1000C5B88(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000C5C5C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000C6278((uint64_t)v12, *a3);
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
      sub_1000C6278((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000C6228((uint64_t)v12);
  return v7;
}

uint64_t sub_1000C5C5C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_1000C5E18(a5, a6);
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

uint64_t sub_1000C5E18(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000C5EB0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000C6090(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000C6090(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000C5EB0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1000C6028(v2, 0);
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

void *sub_1000C6028(uint64_t a1, uint64_t a2)
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
  sub_1000C427C(&qword_100189858);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  void v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1000C6090(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000C427C(&qword_100189858);
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
  uint64_t v13 = a4 + 32;
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

uint64_t sub_1000C61E0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000C6228(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000C6278(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_1000C62D8(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void sub_1000C633C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000C6374(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000C63AC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000C63E4()
{
  uint64_t v0 = __error();
  strerror(*v0);
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v1, v2, "ip address - inet_ntop failed - %s", v3, v4, v5, v6, v7);
}

void sub_1000C6464()
{
  uint64_t v0 = __error();
  strerror(*v0);
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v1, v2, "net mask - inet_ntop failed - %s", v3, v4, v5, v6, v7);
}

void sub_1000C64E4()
{
  uint64_t v0 = __error();
  strerror(*v0);
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v1, v2, "broadcast addr - inet_ntop failed - %s", v3, v4, v5, v6, v7);
}

void sub_1000C6564(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Missing interface name", buf, 2u);
}

void sub_1000C65A4()
{
  uint64_t v0 = __error();
  strerror(*v0);
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v1, v2, "getifaddrs failed - %s", v3, v4, v5, v6, v7);
}

void sub_1000C6624(uint64_t a1, NSObject *a2, float a3)
{
  int v3 = 134218242;
  double v4 = a3;
  __int16 v5 = 2114;
  uint64_t v6 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "MSDAudioController: Failed to set volume to: %f for category: %{public}@", (uint8_t *)&v3, 0x16u);
}

void sub_1000C66AC(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "MSDAudioController: Failed to get volume for category: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_1000C6724()
{
  sub_100009FA4();
  sub_100009F88((void *)&_mh_execute_header, v0, v1, "MSDAudioController: Failed to select route descriptor: %d", v2, v3, v4, v5, v6);
}

void sub_1000C678C()
{
  sub_100009FA4();
  sub_100009F88((void *)&_mh_execute_header, v0, v1, "MSDAudioController: Failed to copy system music context: %d", v2, v3, v4, v5, v6);
}

void sub_1000C67F4()
{
  sub_100009FA4();
  sub_100009F88((void *)&_mh_execute_header, v0, v1, "MSDAudioController: Failed to remove selectd route descriptor: %d", v2, v3, v4, v5, v6);
}

void sub_1000C685C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000C6894(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 localizedDescription];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "MSDAudioController: Failed to subscribe to AVSystemController died notification: %{public}@", (uint8_t *)&v4, 0xCu);
}

void sub_1000C692C()
{
  sub_100009FA4();
  sub_100009F88((void *)&_mh_execute_header, v0, v1, "MSDAudioController: Failed to set property for FigRouteDiscoverer: %d", v2, v3, v4, v5, v6);
}

void sub_1000C6994(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000C69CC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000C6A04()
{
  sub_100009FA4();
  sub_100009F88((void *)&_mh_execute_header, v0, v1, "MSDAudioController: Failed to create XPC for FigRouteDiscoverer: %d", v2, v3, v4, v5, v6);
}

void sub_1000C6A6C()
{
  sub_100009FA4();
  sub_100009F88((void *)&_mh_execute_header, v0, v1, "MSDAudioController: Failed to copy property from FigRouteDiscoverer: %d", v2, v3, v4, v5, v6);
}

void sub_1000C6AD4(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 localizedDescription];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to remove configuration profile from staging: %{public}@", (uint8_t *)&v4, 0xCu);
}

void sub_1000C6B6C(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to copy file from content cache: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_1000C6BE4()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to get profile data for profile.", v2, v3, v4, v5, v6);
}

void sub_1000C6C18()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to install profile.", v2, v3, v4, v5, v6);
}

void sub_1000C6C4C()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to uninstall profile.", v2, v3, v4, v5, v6);
}

void sub_1000C6C80()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Failed to install configuration profile. error: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000C6CE8()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to remove configuration profile.", v2, v3, v4, v5, v6);
}

void sub_1000C6D1C()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Failed to query isProfileInstalled: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000C6D84()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Failed to install restrictions profile: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000C6DEC()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Failed to uninstall restrictions profile: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000C6E54(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Component retrying: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000C6ECC(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 5;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "DEBUG - Failed to get kMGQDiskUsageAmountDataReserved.  Default to %d percent of disk's free space.", (uint8_t *)v1, 8u);
}

void sub_1000C6F4C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "There is a log upload in progress, ignoring this request", v1, 2u);
}

void sub_1000C6F90(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "S3 URL not available. Informing vhub of the error", v1, 2u);
}

void sub_1000C6FD4()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Timed out turning on 'Find My' service.", v2, v3, v4, v5, v6);
}

void sub_1000C7008()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Timed out configuring iCloud account features.", v2, v3, v4, v5, v6);
}

void sub_1000C703C()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Timed out signing into iCloud account service.", v2, v3, v4, v5, v6);
}

void sub_1000C7070()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Timed out authenticating account credentials.", v2, v3, v4, v5, v6);
}

void sub_1000C70A4()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Timed out signing into iTunes account service.", v2, v3, v4, v5, v6);
}

void sub_1000C70D8()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Timed out signing out iCloud account service.", v2, v3, v4, v5, v6);
}

void sub_1000C710C()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Timed out turning off 'Find My' service.", v2, v3, v4, v5, v6);
}

void sub_1000C7140()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Timed out signing out iTunes account service.", v2, v3, v4, v5, v6);
}

void sub_1000C7174()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to create CDP state controller for primary account!", v2, v3, v4, v5, v6);
}

void sub_1000C71A8()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Timed out waiting for iCloud keychain to sync.", v2, v3, v4, v5, v6);
}

void sub_1000C71DC(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "Failed to authenticate account: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000C7260()
{
  sub_1000088C4();
  sub_100013D1C((void *)&_mh_execute_header, v0, v1, "Failed to sign in to Apple ID with results: %{public}@", v2);
}

void sub_1000C72CC()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to create temporary Apple account.", v2, v3, v4, v5, v6);
}

void sub_1000C7300()
{
  sub_1000088C4();
  sub_100013D1C((void *)&_mh_execute_header, v0, v1, "Failed to fetch iCloud terms: %{public}@", v2);
}

void sub_1000C736C()
{
  sub_1000088C4();
  sub_100013D1C((void *)&_mh_execute_header, v0, v1, "Failed to agree to iCloud terms: %{public}@", v2);
}

void sub_1000C73D8()
{
  sub_1000088C4();
  sub_100013D1C((void *)&_mh_execute_header, v0, v1, "Failed to sign out from Apple ID with results: %{public}@", v2);
}

void sub_1000C7444(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "Failed to sign out from Apple ID with error: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000C74C8(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "Failed to save iCloud account as a managed account: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000C754C()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "No iCloud account found on device.", v2, v3, v4, v5, v6);
}

void sub_1000C7580(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "iCloud account is not provisioned to use this feature.", buf, 2u);
}

void sub_1000C75C0(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "Failed to update iCloud account features: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000C7644()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to enable 'Find My' service.", v2, v3, v4, v5, v6);
}

void sub_1000C7678(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "Failed to toggle 'Send Last Location': %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000C76FC()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "No password for existing account provided.", v2, v3, v4, v5, v6);
}

void sub_1000C7730(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  sub_100013D1C((void *)&_mh_execute_header, a3, (uint64_t)a3, "Failed to obtain 'Find My' wipe token: %{public}@", (uint8_t *)a2);
}

void sub_1000C7780(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 138543362;
  CFStringRef v4 = @"com.apple.private.alloy.mobilestoredemo.icloud";
  sub_100013D1C((void *)&_mh_execute_header, a1, a3, "Failed to create IDSAccountController for IDS service: %{public}@", (uint8_t *)&v3);
}

void sub_1000C77FC(uint64_t a1, NSObject *a2, double a3)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "IDS %{public}@ timed out after %f seconds.", (uint8_t *)&v3, 0x16u);
}

void sub_1000C7880(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  sub_100013D1C((void *)&_mh_execute_header, a3, (uint64_t)a3, "Failed to create CKKSControl object: %{public}@", (uint8_t *)a2);
}

void sub_1000C78D0(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "Failed to sync iCloud keychain: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000C7954()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to create IDSAccountController.", v2, v3, v4, v5, v6);
}

void sub_1000C7988()
{
  sub_1000088C4();
  sub_100013D1C((void *)&_mh_execute_header, v0, v1, "Account not allowlisted: %{public}@", v2);
}

void sub_1000C79F4()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Cannot create regular expression", v2, v3, v4, v5, v6);
}

void sub_1000C7A28(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000C7A94(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000C7B00(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000C7B6C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000C7BA4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000C7BDC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000C7C14(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000C7C8C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000C7D04(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000C7D7C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000C7DF4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000C7E6C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "One or more components have an invalid platformType", v1, 2u);
}

void sub_1000C7EB0(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 136315650;
  *(void *)&v3[4] = "-[MSDSignedManifestV7 initWithManifestData:]";
  *(_WORD *)&v3[12] = 2048;
  *(void *)&v3[14] = a1;
  *(_WORD *)&v3[22] = 2048;
  sub_100017FD0((void *)&_mh_execute_header, a2, a3, "%s - InstallationOrder count (%lu) doesn't match number of components in manifest (%lu)", *(const char **)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_1000C7F38(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000C7FB0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000C8028(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000C80A0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000C8118(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000C8190()
{
  sub_100017F78();
  sub_100017F8C((void *)&_mh_execute_header, v0, v1, "%s - ERROR - Missing Info section for app:  %{public}@", v2, v3, v4, v5, 2u);
}

void sub_1000C8204()
{
  sub_100017F78();
  sub_100017F8C((void *)&_mh_execute_header, v0, v1, "%s - ERROR - Missing both RealSize and Size values for app:  %{public}@", v2, v3, v4, v5, 2u);
}

void sub_1000C8278()
{
  sub_100017F78();
  sub_100017F8C((void *)&_mh_execute_header, v0, v1, "%s - Missing Info section for stand-alone package:  %{public}@", v2, v3, v4, v5, 2u);
}

void sub_1000C82EC()
{
  sub_100017F78();
  sub_100017F8C((void *)&_mh_execute_header, v0, v1, "%s - ERROR - Missing both RealSize and Size values for package:  %{public}@", v2, v3, v4, v5, 2u);
}

void sub_1000C8360()
{
  int v2 = 136315650;
  sub_100017F78();
  sub_100017FD0((void *)&_mh_execute_header, v0, v1, "%s - Missing manifest data for section: %{public}@ for identifier: %{public}@", v2);
}

void sub_1000C83DC()
{
  sub_100017F78();
  sub_100017F8C((void *)&_mh_execute_header, v0, v1, "%s - Missing app object for app:  %{public}@", v2, v3, v4, v5, 2u);
}

void sub_1000C8450()
{
  sub_100017F78();
  sub_100017F8C((void *)&_mh_execute_header, v0, v1, "%s - Missing version number for app:  %{public}@", v2, v3, v4, v5, 2u);
}

void sub_1000C84C4()
{
  sub_100017F78();
  sub_100017F8C((void *)&_mh_execute_header, v0, v1, "%s - Missing package object for stand-alone package:  %{public}@", v2, v3, v4, v5, 2u);
}

void sub_1000C8538()
{
  sub_100017F78();
  sub_100017F8C((void *)&_mh_execute_header, v0, v1, "%s - Missing version number for stand-alone package:  %{public}@", v2, v3, v4, v5, 2u);
}

void sub_1000C85AC()
{
  sub_100017FB8();
  sub_100017FF0((void *)&_mh_execute_header, v0, v1, "Info section is missing for item %{public}@ under component %{public}@.");
}

void sub_1000C8614(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000C868C()
{
  sub_100017FB8();
  sub_100017FF0((void *)&_mh_execute_header, v0, v1, "Unrecognized container type: %{public}@ for component %{public}@");
}

void sub_1000C86F4()
{
  sub_100017FA8();
  sub_100017F8C((void *)&_mh_execute_header, v0, v1, "No component %{public}@ under section %{public}@", v2, v3, v4, v5, 2u);
}

void sub_1000C8778()
{
  sub_100017FA8();
  sub_100017F8C((void *)&_mh_execute_header, v0, v1, "No %{public}@ key in component %{public}@", v2, v3, v4, v5, 2u);
}

void sub_1000C87FC()
{
  sub_100017FA8();
  sub_100017F8C((void *)&_mh_execute_header, v0, v1, "No %{public}@ key in component %{public}@", v2, v3, v4, v5, 2u);
}

void sub_1000C8880(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [a2 localizedDescription];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  int64_t v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Failed to remove file from %{public}@ - %{public}@", (uint8_t *)&v6, 0x16u);
}

void sub_1000C8934(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to set file attributes: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_1000C89AC(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v6 = *__error();
  int v7 = 138543874;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  __int16 v11 = 1024;
  int v12 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Failed to clonefile from %{public}@ to %{public}@ - %{errno}d", (uint8_t *)&v7, 0x1Cu);
}

void sub_1000C8A64(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Timeout launching app.", v1, 2u);
}

void sub_1000C8AA8(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "With options: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_1000C8B20(uint64_t a1, void *a2)
{
  uint64_t v8 = [a2 localizedDescription];
  sub_100018B4C((void *)&_mh_execute_header, v2, v3, "Failed to launch app: %{public}@ error: %{public}@", v4, v5, v6, v7, 2u);
}

void sub_1000C8BC4(uint64_t a1, void *a2)
{
  uint64_t v8 = [a2 localizedDescription];
  sub_100018B4C((void *)&_mh_execute_header, v2, v3, "Failed to terminate app: %{public}@ error: %{public}@", v4, v5, v6, v7, 2u);
}

void sub_1000C8C68(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Cannot load Domains.plist: %{public}@.", (uint8_t *)&v2, 0xCu);
}

void sub_1000C8CE0()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Cannot find CameraRollDomain, or in wrong format.", v2, v3, v4, v5, v6);
}

void sub_1000C8D14()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Cannot find HomeDomain, or in wrong format.", v2, v3, v4, v5, v6);
}

void sub_1000C8D48()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Cannot find KeychainDomain, or in wrong format.", v2, v3, v4, v5, v6);
}

void sub_1000C8D7C()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Cannot find MediaDomain, or in wrong format.", v2, v3, v4, v5, v6);
}

void sub_1000C8DB0()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Cannot find RootDomain, or in wrong format.", v2, v3, v4, v5, v6);
}

void sub_1000C8DE4()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Cannot find SystemPreferencesDomain, or in wrong format.", v2, v3, v4, v5, v6);
}

void sub_1000C8E18()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Cannot find KeyboardDomain, or in wrong format.", v2, v3, v4, v5, v6);
}

void sub_1000C8E4C()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Cannot find RelativePathsNotToBackup under SystemPreferencesDomain.", v2, v3, v4, v5, v6);
}

void sub_1000C8E80()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Cannot find RelativePathsToRemoveOnRestore under RootDomain.", v2, v3, v4, v5, v6);
}

void sub_1000C8EB4()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Cannot find RelativePathsNotToRemoveIfNotRestored under RootDomain.", v2, v3, v4, v5, v6);
}

void sub_1000C8EE8()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Cannot find RelativePathsNotToRestore under RootDomain.", v2, v3, v4, v5, v6);
}

void sub_1000C8F1C()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Cannot find RelativePathsNotToBackup under RootDomain.", v2, v3, v4, v5, v6);
}

void sub_1000C8F50()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Cannot find RelativePathsToBackupAndRestore under MediaDomain.", v2, v3, v4, v5, v6);
}

void sub_1000C8F84()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Cannot find RelativePathsNotToBackup under HomeDomain.", v2, v3, v4, v5, v6);
}

void sub_1000C8FB8()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Cannot find RelativePathsToBackupAndRestore under HomeDomain.", v2, v3, v4, v5, v6);
}

void sub_1000C8FEC()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Backup DoNotDisturb DB - Cannot find RelativePathsToBackupAndRestore under HomeDomain.", v2, v3, v4, v5, v6);
}

void sub_1000C9020()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Backup DoNotDisturb DB - Cannot find RelativePathsToRestoreOnly under HomeDomain.", v2, v3, v4, v5, v6);
}

void sub_1000C9054()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Backup DoNotDisturb DB - Cannot find RelativePathsToOnlyBackupEncrypted under HomeDomain.", v2, v3, v4, v5, v6);
}

void sub_1000C9088()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Backup SafariTabs.db - Cannot find RelativePathsToBackupAndRestore under HomeDomain.", v2, v3, v4, v5, v6);
}

void sub_1000C90BC()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Backup SafariTabs.db - Cannot find RelativePathsToRestoreOnly under HomeDomain.", v2, v3, v4, v5, v6);
}

void sub_1000C90F0()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Backup SafariTabs.db - Cannot find RelativePathsToOnlyBackupEncrypted under HomeDomain.", v2, v3, v4, v5, v6);
}

void sub_1000C9124()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Backup SafariTabs.db - Cannot find RelativePathsNotToBackupToService under HomeDomain.", v2, v3, v4, v5, v6);
}

void sub_1000C9158()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Cannot find RelativePathsToRemoveOnRestore under HomeKitDomain.", v2, v3, v4, v5, v6);
}

void sub_1000C918C()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Cannot find RelativePathsNotToBackupToService under HomeKitDomain.", v2, v3, v4, v5, v6);
}

void sub_1000C91C0()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Cannot find RelativePathsNotToBackupInMegaBackup under HomeKitDomain.", v2, v3, v4, v5, v6);
}

void sub_1000C91F4()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Cannot find RelativePathsToRestoreOnly under HomeKitDomain.", v2, v3, v4, v5, v6);
}

void sub_1000C9228()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Cannot find RelativePathsToOnlyBackupEncrypted under HomeKitDomain.", v2, v3, v4, v5, v6);
}

void sub_1000C925C()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Cannot find RelativePathsNotToBackup under CameraRollDomain.", v2, v3, v4, v5, v6);
}

void sub_1000C9290()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Cannot find RelativePathsToRemoveOnRestore under CameraRollDomain.", v2, v3, v4, v5, v6);
}

void sub_1000C92C4()
{
  sub_1000088C4();
  sub_10001CB6C((void *)&_mh_execute_header, v0, v1, "Operation succeeded: %@", v2, v3, v4, v5, v6);
}

void sub_1000C932C()
{
  sub_1000088C4();
  sub_10001CB6C((void *)&_mh_execute_header, v0, v1, "Operation failed: %@", v2, v3, v4, v5, v6);
}

void sub_1000C9394()
{
  sub_1000088C4();
  sub_10001CB6C((void *)&_mh_execute_header, v0, v1, "Operation retrying: %@", v2, v3, v4, v5, v6);
}

void sub_1000C93FC()
{
  sub_1000088C4();
  sub_10001CB6C((void *)&_mh_execute_header, v0, v1, "Operation skipped: %@", v2, v3, v4, v5, v6);
}

void sub_1000C9464()
{
  sub_1000088C4();
  sub_10001CB6C((void *)&_mh_execute_header, v0, v1, "Operation cancelled: %@", v2, v3, v4, v5, v6);
}

void sub_1000C94CC(void *a1, NSObject *a2)
{
  int v3 = 134217984;
  unint64_t v4 = (unint64_t)[a1 length] >> 1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to malloc bytes of size: %lu", (uint8_t *)&v3, 0xCu);
}

void sub_1000C955C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "String should be all hex digits: %@ (bad digit around %ld)", (uint8_t *)&v3, 0x16u);
}

void sub_1000C95E4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Hex strings should have an even number of digits (%@)", (uint8_t *)&v2, 0xCu);
}

void sub_1000C965C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to grant permission for resource: %{public}@ to bundleID: %{public}@", (uint8_t *)&v3, 0x16u);
}

void sub_1000C96E4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000C971C(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[MSDAppPrivacyPermissionsHelper grantNetworkPermission:toBundleID:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s - Unable to find the appropriate privacy rule.", (uint8_t *)&v1, 0xCu);
}

void sub_1000C97A0(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to load configurations with error %{public}@\n", (uint8_t *)&v2, 0xCu);
}

void sub_1000C9818(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 localizedDescription];
  int v4 = 136315394;
  __int16 v5 = "-[MSDAppPrivacyPermissionsHelper saveNetworkPrivacyConfiguration:]_block_invoke";
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s - Failed to save privacy configuration: %{public}@", (uint8_t *)&v4, 0x16u);
}

void sub_1000C98C4()
{
  sub_10001F5FC();
  uint64_t v3 = [v2 getName];
  sub_10001F5B8();
  uint64_t v5 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%{public}@: Required key not found or in unexpected format: %{public}@", v4, 0x16u);
}

void sub_1000C9964()
{
  sub_10001F5FC();
  uint64_t v1 = [v0 getName];
  sub_10001F5B8();
  sub_10001F5EC();
  sub_10001F5CC((void *)&_mh_execute_header, v2, v3, "%{public}@: '%{public}@' key not found or in unexpected format: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000C99FC()
{
  sub_10001F5FC();
  uint64_t v1 = [v0 getName];
  sub_10001F5B8();
  sub_10001F5EC();
  sub_10001F5CC((void *)&_mh_execute_header, v2, v3, "%{public}@: '%{public}@' key not found or in unexpected format: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000C9A94()
{
  sub_10001F5FC();
  uint64_t v1 = [v0 getName];
  sub_10001F5B8();
  sub_10001F5EC();
  sub_10001F5CC((void *)&_mh_execute_header, v2, v3, "%{public}@: '%{public}@' key not found or in unexpected format: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000C9B2C()
{
  sub_10001F5FC();
  uint64_t v1 = [v0 getName];
  sub_10001F5B8();
  sub_10001F5EC();
  sub_10001F5CC((void *)&_mh_execute_header, v2, v3, "%{public}@: '%{public}@' key not found or in unexpected format: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000C9BC4(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[MSDBundleProgressTracker updateComponentProgress:withResult:withAdditionalInfo:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s - Bundle tracker hasn't been initialized yet.", (uint8_t *)&v1, 0xCu);
}

void sub_1000C9C48(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[MSDBundleProgressTracker updateComponentProgress:withResult:withAdditionalInfo:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s - Missing manifest version in bundle info.", (uint8_t *)&v1, 0xCu);
}

void sub_1000C9CCC(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6 = [a1 criticalComponents];
  int v7 = 134218496;
  uint64_t v8 = a2;
  __int16 v9 = 2048;
  id v10 = [v6 count];
  __int16 v11 = 2048;
  id v12 = [a1 totalComponents];
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "Total Components: %ld. Critical Update: %ld, Full Update: %ld", (uint8_t *)&v7, 0x20u);
}

void sub_1000C9DA0(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Bundle update timer was started previously.", v1, 2u);
}

void sub_1000C9DE4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "%{public}@: XPC connection to RPCompanionLinkClient interrupted!", v4, v5, v6, v7, 2u);
}

void sub_1000C9E6C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "%{public}@: XPC connection to RPCompanionLinkClient invalidated!", v4, v5, v6, v7, 2u);
}

void sub_1000C9EF4(uint64_t a1, void *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v10 = [a2 localizedDescription];
  sub_100018B4C((void *)&_mh_execute_header, v4, v5, "%{public}@: Failed to activate RPCompanionLinkClient: %{public}@", v6, v7, v8, v9, 2u);
}

void sub_1000C9FA8(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 localizedDescription];
  sub_100023F88();
  sub_100018B4C((void *)&_mh_execute_header, v3, v4, "%{public}@: Authentication failed: %{public}@", v5, v6, v7, v8, v9);
}

void sub_1000CA03C(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 localizedDescription];
  sub_100023F88();
  sub_100018B4C((void *)&_mh_execute_header, v3, v4, "%{public}@: Failed to fetch pairing secret: %{public}@", v5, v6, v7, v8, v9);
}

void sub_1000CA0D0()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Failed to retrieve master manifest for %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000CA138(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000CA170(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000CA1E0()
{
  sub_10001F5B8();
  CFStringRef v3 = @"ConfigurationProfiles";
  sub_100026FA8((void *)&_mh_execute_header, v0, v1, "ERROR - Missing data for profile:  %{public}@ under component:  %{public}@", v2);
}

void sub_1000CA258()
{
  sub_10001F5B8();
  CFStringRef v3 = @"ConfigurationProfiles";
  sub_100026FA8((void *)&_mh_execute_header, v0, v1, "ERROR - Missing info for profile:  %{public}@ under component:  %{public}@", v2);
}

void sub_1000CA2D0()
{
  sub_100017FB8();
  sub_100026FA8((void *)&_mh_execute_header, v0, (uint64_t)v0, "ERROR - Missing file hash value for profile:  %{public}@ with UUID:  %{public}@", v1);
}

void sub_1000CA340()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "ERROR - There should be exactly one profile under UUID:  %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000CA3A8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000CA3E0()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Failed to retrieve settings data for %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000CA448()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Failed to initialize operation group for %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000CA4B0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000CA528(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Setting preference %{public}@:%{public}@", (uint8_t *)&v3, 0x16u);
}

void sub_1000CA5B0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000CA628(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000CA6A0(void *a1, NSObject *a2)
{
  int v3 = [a1 info];
  uint64_t v4 = [v3 description];
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed trust evaluation for task: %{public}@", (uint8_t *)&v5, 0xCu);
}

void sub_1000CA750()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "MSDDemoPeerCommander: XPC connection interrupted!", v2, v3, v4, v5, v6);
}

void sub_1000CA784()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "MSDDemoPeerCommander: XPC connection invalidated!", v2, v3, v4, v5, v6);
}

void sub_1000CA7B8()
{
  id v0 = [0 localizedDescription];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v1, v2, "MSDDemoPeerCommander: Failed to unarchive app data: %{public}@", v3, v4, v5, v6, v7);
}

void sub_1000CA840()
{
  id v0 = [0 localizedDescription];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v1, v2, "MSDDemoPeerCommander: Failed to unarchive environment data: %{public}@", v3, v4, v5, v6, v7);
}

void sub_1000CA8C8(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "MSDDemoPeerCommander: Failed to unarchive test script data: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000CA94C(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "MSDDemoPeerCommander: Failed to unarchive GK results data: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000CA9D0(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "MSDDemoPeerCommander: Failed to unarchive GK metrics data: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000CAA54()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "MSDDemoPeerCommander: No LS measurements data found.", v2, v3, v4, v5, v6);
}

void sub_1000CAA88(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "MSDDemoPeerCommander: Failed to unarchive IPD status data: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000CAB0C()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "MSDDemoPeerCommander: No final IPD found.", v2, v3, v4, v5, v6);
}

void sub_1000CAB40()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "MSDDemoPeerCommander: No IPD reset stage found.", v2, v3, v4, v5, v6);
}

void sub_1000CAB74(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "MSDDemoPeerCommander: Failed to unarchive AX settings data: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000CABF8(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "MSDDemoPeerCommander: Failed to archive AX settings: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000CAC7C(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "MSDDemoPeerCommander: Failed to archive WiFi settings: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000CAD00(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 localizedDescription];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to start sync session observer: %{public}@", (uint8_t *)&v4, 0xCu);
}

void sub_1000CAD98(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to execute IDS command on paired watch.", v1, 2u);
}

void sub_1000CADDC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to send IDS command to paired watch.", v1, 2u);
}

void sub_1000CAE20()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to save bt keychain info to demo volume.", v2, v3, v4, v5, v6);
}

void sub_1000CAE54()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Failed to remove existing keychain data file. Error: %{public}@.", v2, v3, v4, v5, v6);
}

void sub_1000CAEBC()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to preserve Bluetooth db and pref files.", v2, v3, v4, v5, v6);
}

void sub_1000CAEF0()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to load bt keychain info from demo volume.", v2, v3, v4, v5, v6);
}

void sub_1000CAF24()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "No need to restore bt pairing record.", v2, v3, v4, v5, v6);
}

void sub_1000CAF58()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Failed to copy BT File: %{public}@.", v2, v3, v4, v5, v6);
}

void sub_1000CAFC0()
{
  sub_1000088C4();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Failed to copy BT File: %{public}@. Error: %{public}@", v2, 0x16u);
}

void sub_1000CB044()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Failed to create BT shelter folder. Error: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000CB0AC()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Failed to remove BT shelter folder. Error: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000CB114(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to DDL lock device.", v1, 2u);
}

void sub_1000CB158(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Device is either not a DDL device or its content is not locked.", v1, 2u);
}

void sub_1000CB19C(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[MSDPushNotificationHandler connection:didReceiveIncomingMessage:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s - Failed to flash the device.", (uint8_t *)&v1, 0xCu);
}

void sub_1000CB220(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Received the following payload in push notification: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_1000CB298(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 apsToken];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Received token from APNS framework: %{public}@", (uint8_t *)&v4, 0xCu);
}

void sub_1000CB330(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to build component from item.", v1, 2u);
}

void sub_1000CB374(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to build components for removing app.", v1, 2u);
}

void sub_1000CB3B8(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to migrate cellular support flag", v1, 2u);
}

void sub_1000CB3FC(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 5;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to switch to mode %d to complete snapshot revert.", (uint8_t *)v1, 8u);
}

void sub_1000CB47C(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 4;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to switch to mode %d to update accounts.", (uint8_t *)v1, 8u);
}

void sub_1000CB4FC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000CB534(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000CB56C(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 localizedDescription];
  sub_1000088C4();
  sub_100013D1C((void *)&_mh_execute_header, a2, v4, "Failed to create device manifest folder: %{public}@", v5);
}

void sub_1000CB5F8()
{
  sub_1000088C4();
  sub_100013D1C((void *)&_mh_execute_header, v0, v1, "Cannot find metadata for path %{public}@", v2);
}

void sub_1000CB664()
{
  sub_1000088C4();
  sub_100013D1C((void *)&_mh_execute_header, v0, v1, "Failed to apply file attributes to files in final: %{public}@", v2);
}

void sub_1000CB6D0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000CB708(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 localizedDescription];
  sub_1000088C4();
  sub_100013D1C((void *)&_mh_execute_header, a2, v4, "Failed to move pseudo content root path: %{public}@", v5);
}

void sub_1000CB794()
{
  sub_1000088C4();
  sub_100013D1C((void *)&_mh_execute_header, v0, v1, "Failed to create parent folder: %{public}@", v2);
}

void sub_1000CB800()
{
  v1[0] = 136315394;
  sub_100017F78();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s - Failed to load bundle:  %{public}@", (uint8_t *)v1, 0x16u);
}

void sub_1000CB880()
{
  v1[0] = 136315394;
  sub_100017F78();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s - Missing Info.plist from bundle:  %{public}@", (uint8_t *)v1, 0x16u);
}

void sub_1000CB900(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000CB96C(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)uint8_t buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "data blob size larger than allowed for 3rd party apps.:%lu", buf, 0xCu);
}

void sub_1000CB9B4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000CBA20(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000CBA8C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Removing non-existing persistent data blob.", v1, 2u);
}

void sub_1000CBAD0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000CBB48(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000CBBC0()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Entitlements is needed.", v2, v3, v4, v5, v6);
}

void sub_1000CBBF4()
{
  sub_10000AEF4();
  sub_100008438((void *)&_mh_execute_header, v0, v1, "It's an XPC_TYPE_CONNECTION", v2, v3, v4, v5, v6);
}

void sub_1000CBC28()
{
  sub_10000AEF4();
  sub_100008438((void *)&_mh_execute_header, v0, v1, "Checking the type", v2, v3, v4, v5, v6);
}

void sub_1000CBC5C()
{
  sub_10000AEF4();
  sub_100008438((void *)&_mh_execute_header, v0, v1, "Received a connection?", v2, v3, v4, v5, v6);
}

void sub_1000CBC90()
{
  sub_1000088C4();
  sub_10001CB6C((void *)&_mh_execute_header, v0, v1, "xpc_object_t message = %{public}s", v2, v3, v4, v5, v6);
}

void sub_1000CBCF8()
{
  sub_100017F78();
  sub_100017F8C((void *)&_mh_execute_header, v0, v1, "%s: required key not found: %{public}@", v2, v3, v4, v5, 2u);
}

void sub_1000CBD6C()
{
  sub_1000088C4();
  sub_10001CB6C((void *)&_mh_execute_header, v0, v1, "query = %{public}s", v2, v3, v4, v5, v6);
}

void sub_1000CBDD4()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Cannot process DemoMaualUpdate command.", v2, v3, v4, v5, v6);
}

void sub_1000CBE08()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Cannot process DemoSnapshotRevert command.", v2, v3, v4, v5, v6);
}

void sub_1000CBE3C()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Cannot process Demo command.", v2, v3, v4, v5, v6);
}

void sub_1000CBE70()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Cannot process Virgin command.", v2, v3, v4, v5, v6);
}

void sub_1000CBEA4()
{
  sub_1000088C4();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Unexpected value type for DeviceOptions (subkey: %{public}s): %{public}@", v2, 0x16u);
}

void sub_1000CBF28()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Cannot convert dictionary into json data.", v2, v3, v4, v5, v6);
}

void sub_1000CBF5C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000CBFD0()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to get languageIdentifier.", v2, v3, v4, v5, v6);
}

void sub_1000CC004()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to get regionCode.", v2, v3, v4, v5, v6);
}

void sub_1000CC038()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "xpcEndTime must be of type XPC_TYPE_DOUBLE", v2, v3, v4, v5, v6);
}

void sub_1000CC06C()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "xpcStartTime must be of type XPC_TYPE_DOUBLE", v2, v3, v4, v5, v6);
}

void sub_1000CC0A0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000CC118()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Device is not demo device, ignoring OS Update request", v2, v3, v4, v5, v6);
}

void sub_1000CC14C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000CC1C4()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Unrecognized action for wallpaper settings management: %s", v2, v3, v4, v5, v6);
}

void sub_1000CC22C()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Device should not be in Offline Mode, ignoring request", v2, v3, v4, v5, v6);
}

void sub_1000CC260(char a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[MSDLocalMessageResponder handleMessage:from:]";
  __int16 v4 = 1024;
  int v5 = a1 & 1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s - isOpen: %d", (uint8_t *)&v2, 0x12u);
}

void sub_1000CC2F0()
{
  v1[0] = 136315394;
  sub_10003DE10();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s - Next open date: %@", (uint8_t *)v1, 0x16u);
}

void sub_1000CC370()
{
  v1[0] = 136315394;
  sub_10003DE10();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s - Next close date: %@", (uint8_t *)v1, 0x16u);
}

void sub_1000CC3F0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000CC468()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to retrieve the evaluate against date from the xpc request", v2, v3, v4, v5, v6);
}

void sub_1000CC49C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000CC514(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000CC58C()
{
  sub_1000088C4();
  sub_10001CB6C((void *)&_mh_execute_header, v0, v1, "unsupported featureFlag %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000CC5F4()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "The client does not have proper entitlement", v2, v3, v4, v5, v6);
}

void sub_1000CC628()
{
  sub_10000AEF4();
  sub_100008438((void *)&_mh_execute_header, v0, v1, "Received a XPC request", v2, v3, v4, v5, v6);
}

void sub_1000CC65C()
{
  sub_10000AEF4();
  sub_100008438((void *)&_mh_execute_header, v0, v1, "Sending XPC (Reboot Timeout) to Pricing App", v2, v3, v4, v5, v6);
}

void sub_1000CC690()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to convert xpc request to dictionary", v2, v3, v4, v5, v6);
}

void sub_1000CC6C4()
{
  sub_10000AEF4();
  sub_100008438((void *)&_mh_execute_header, v0, v1, "It's an XPC_TYPE_ERROR", v2, v3, v4, v5, v6);
}

void sub_1000CC6F8()
{
  sub_10000AEF4();
  sub_100008438((void *)&_mh_execute_header, v0, v1, "Message handled", v2, v3, v4, v5, v6);
}

void sub_1000CC72C()
{
  __assert_rtn("MSD_handle_connection_block_invoke", "MSDLocalMessageResponder.m", 153, "type == XPC_TYPE_DICTIONARY");
}

void sub_1000CC758()
{
  sub_10000AEF4();
  sub_100008438((void *)&_mh_execute_header, v0, v1, "Received an XPC request?", v2, v3, v4, v5, v6);
}

void sub_1000CC78C(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)uint8_t buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "MSDAirPlayAssistedSender: Failed to deserialize input data: %{public}@", buf, 0xCu);
}

void sub_1000CC7E4(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "MSDAirPlayAssistedSender: Unknown AirPlay discovery mode: %lu", (uint8_t *)&v2, 0xCu);
}

void sub_1000CC85C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000CC8C8(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 _NSStringFromSenderState:[a1 state]];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "MSDAirPlayAssistedSender: Activating sender in unexpected state: %{public}@", (uint8_t *)&v4, 0xCu);
}

void sub_1000CC970(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000CC9DC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000CCA48(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000CCA80(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000CCAB8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000CCAF0(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 getName];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}@: failed to convert data to dict", (uint8_t *)&v4, 0xCu);
}

void sub_1000CCB88(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to send ids message to paired device. Identifier: %{public}@, Error: %{public}@", (uint8_t *)&v3, 0x16u);
}

void sub_1000CCC10(uint64_t a1, void *a2)
{
  int v2 = [a2 localizedDescription];
  sub_100023F88();
  sub_100018B4C((void *)&_mh_execute_header, v3, v4, "Failed to send IDS response message. Identifier: %{public}@, Error: %{public}@", v5, v6, v7, v8, v9);
}

void sub_1000CCCA4(uint64_t a1, void *a2)
{
  int v2 = [a2 localizedDescription];
  sub_100023F88();
  sub_100018B4C((void *)&_mh_execute_header, v3, v4, "Failed to send IDS message. Identifier: %{public}@, Error: %{public}@", v5, v6, v7, v8, v9);
}

void sub_1000CCD38()
{
  sub_100017F78();
  sub_100017F8C((void *)&_mh_execute_header, v0, v1, "%s - No AppSwitcher model file exists at path %{public}@", v2, v3, v4, v5, 2u);
}

void sub_1000CCDAC()
{
  sub_100017F78();
  sub_100017F8C((void *)&_mh_execute_header, v0, v1, "%s - AppSwitcher model file could not be stashed at path %{public}@ for an unknown reason", v2, v3, v4, v5, 2u);
}

void sub_1000CCE20()
{
  sub_100017F78();
  sub_100017F8C((void *)&_mh_execute_header, v0, v1, "%s - Containing folder %{public}@ for AppSwitcher model file does not exist", v2, v3, v4, v5, 2u);
}

void sub_1000CCE94(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [a2 description];
  int v6 = 136315650;
  uint64_t v7 = "-[MSDAppSwitcherManager createSwitcherModelAtPath:]";
  __int16 v8 = 2114;
  uint64_t v9 = a1;
  __int16 v10 = 2114;
  __int16 v11 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s - Error writing empty app switcher model to path %{public}@, with error %{public}@", (uint8_t *)&v6, 0x20u);
}

void sub_1000CCF58()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to preserve Thimble long-lived tokens.", v2, v3, v4, v5, v6);
}

void sub_1000CCF8C(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_100017F78();
  sub_100018B4C((void *)&_mh_execute_header, v2, v3, "Failed to remove file: %{public}@ error: %{public}@", v4, v5, v6, v7, 2u);
}

void sub_1000CD01C()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to restore Thimble long-lived tokens.", v2, v3, v4, v5, v6);
}

void sub_1000CD050()
{
  sub_1000088C4();
  sub_100013D1C((void *)&_mh_execute_header, v0, v1, "Failed to unset Pallas URL: %lld", v2);
}

void sub_1000CD0BC()
{
  sub_1000088C4();
  sub_100013D1C((void *)&_mh_execute_header, v0, v1, "Failed to set Pallas URL: %lld", v2);
}

void sub_1000CD128()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Timed out calling eliminateAll() on asset.", v2, v3, v4, v5, v6);
}

void sub_1000CD15C()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Timed out calling eliminateAtomic() on asset.", v2, v3, v4, v5, v6);
}

void sub_1000CD190(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 localizedDescription];
  sub_1000088C4();
  sub_100013D1C((void *)&_mh_execute_header, a2, v4, "Failed to call eliminateAtomic() on asset: %{public}@", v5);
}

void sub_1000CD21C(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 localizedDescription];
  sub_1000088C4();
  sub_100013D1C((void *)&_mh_execute_header, a2, v4, "Failed to call eliminateAll() on asset: %{public}@", v5);
}

void sub_1000CD2A8(int a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[MSDAVFlashlight flash:]";
  __int16 v4 = 1026;
  int v5 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s - INFO - duration:  %{public}d", (uint8_t *)&v2, 0x12u);
}

void sub_1000CD334(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[MSDAVFlashlight flash:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s - Device doesn't have flashlight or flashligh is currently not available.", (uint8_t *)&v1, 0xCu);
}

void sub_1000CD3B8(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[MSDAVFlashlight _startFlash]";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s - INFO - Done flashing ...", (uint8_t *)&v1, 0xCu);
}

void sub_1000CD43C(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[MSDAVFlashlight _startFlash]";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s - INFO - Start flashing ...", (uint8_t *)&v1, 0xCu);
}

void sub_1000CD4C0(void *a1)
{
  uint64_t v7 = [a1 localizedDescription];
  sub_100018B4C((void *)&_mh_execute_header, v1, v2, "Failed to set flashlight level to %{public}.1f - Error:  %{public}@", v3, v4, v5, v6, 2u);
}

void sub_1000CD560(void *a1)
{
  uint64_t v7 = [a1 localizedDescription];
  sub_100018B4C((void *)&_mh_execute_header, v1, v2, "%s - Failed to turn power on - Error:  %{public}@", v3, v4, v5, v6, 2u);
}

void sub_1000CD5FC()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "MSDDemoPeerPairingManager: Failed to read paired peers into data.", v2, v3, v4, v5, v6);
}

void sub_1000CD630()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "MSDDemoPeerPairingManager: Failed to encrypt paired peers data.", v2, v3, v4, v5, v6);
}

void sub_1000CD664()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "MSDDemoPeerPairingManager: Failed to save encrypted data: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000CD6CC()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "MSDDemoPeerPairingManager: Failed to delete file: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000CD734()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "MSDDemoPeerPairingManager: Failed to read encrypted data: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000CD79C()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "MSDDemoPeerPairingManager: Failed to decrypt paired peers data.", v2, v3, v4, v5, v6);
}

void sub_1000CD7D0()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "MSDDemoPeerPairingManager: No matching paired peer found.", v2, v3, v4, v5, v6);
}

void sub_1000CD804()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Failed to find peer with ID %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000CD86C(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[MSDDemoPeerPairingManager removePairedPeer:withCompletion:]";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s - Timed out waiting to remove peer '%{public}@'", (uint8_t *)&v2, 0x16u);
}

void sub_1000CD8F8(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  sub_100017FF0((void *)&_mh_execute_header, a2, a3, "Failed to remove paired peer: '%{public}@' - Error: '%{public}@'", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_1000CD974()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "MSDDemoPeerPairingManager: XPC connection with CUPairingManager interrupted!", v2, v3, v4, v5, v6);
}

void sub_1000CD9A8()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "MSDDemoPeerPairingManager: XPC connection with CUPairingManager invalidated!", v2, v3, v4, v5, v6);
}

void sub_1000CD9DC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000CDA50()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "MSDDemoPeerPairingManager: Timed out getting paired peers.", v2, v3, v4, v5, v6);
}

void sub_1000CDA84()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "MSDDemoPeerPairingManager: Failed to setup CUPairingManager.", v2, v3, v4, v5, v6);
}

void sub_1000CDAB8()
{
  sub_1000088C4();
  sub_100017FF0((void *)&_mh_execute_header, v0, v1, "MSDDemoPeerPairingManager: Failed to save paired peer: %{public}@ error: %{public}@");
}

void sub_1000CDB34()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "MSDDemoPeerPairingManager: Timed out saving paired peer.", v2, v3, v4, v5, v6);
}

void sub_1000CDB68()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "MSDDemoPeerPairingManager: Failed to archive paired peers: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000CDBD0()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "MSDDemoPeerPairingManager: Failed to unarchive paired peers data: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000CDC38()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Must specify device udid in request info", v2, v3, v4, v5, v6);
}

void sub_1000CDC6C()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to get hmac key for server session task", v2, v3, v4, v5, v6);
}

void sub_1000CDCA0()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Cannot create authenticator.", v2, v3, v4, v5, v6);
}

void sub_1000CDCD4(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "Cannot add authentication header - %{public}@.", v4, v5, v6, v7, v8);
}

void sub_1000CDD58()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "URLSchemaLis is not a string.", v2, v3, v4, v5, v6);
}

void sub_1000CDD8C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000CDDFC(void *a1)
{
  uint64_t v1 = [a1 urlSchema];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "Cannot find prefix portion in URLSchema %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000CDE80()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Cannot create URL request.", v2, v3, v4, v5, v6);
}

void sub_1000CDEB4()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Header is not in correct format: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000CDF1C(void *a1)
{
  uint64_t v2 = [a1 fileHash];
  uint8_t v8 = [a1 savePath];
  sub_100046F6C();
  _os_log_error_impl(v3, v4, v5, v6, v7, 0x20u);
}

void sub_1000CDFE8()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Failed to add BAA authentication to request header; error: %@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_1000CE050()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to get generate BAA certificate", v2, v3, v4, v5, v6);
}

void sub_1000CE084()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Could not get file handle for %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000CE0EC()
{
  __error();
  uint64_t v0 = __error();
  strerror(*v0);
  sub_100046F6C();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x1Cu);
}

void sub_1000CE1A4(uint64_t a1, void *a2)
{
  uint64_t v7 = [a2 localizedDescription];
  sub_100046F6C();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x16u);
}

void sub_1000CE250(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "Failed to load wallpaper settings from file: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000CE2D4(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "Failed to write wallpaper settings to file: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000CE358(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "Failed to create parent directory: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000CE3DC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Timed out deleting poster data store.", v1, 2u);
}

void sub_1000CE420(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "Failed to delete poster data store: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000CE4A4()
{
  sub_10000AEF4();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "MSDRapportDeviceExplorer: XPC connection to RPCompanionLinkClient interrupted!", v1, 2u);
}

void sub_1000CE4E4()
{
  sub_10000AEF4();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "MSDRapportDeviceExplorer: XPC connection to RPCompanionLinkClient invalidated!", v1, 2u);
}

void sub_1000CE524(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 localizedDescription];
  sub_1000088C4();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "MSDRapportDeviceExplorer: Failed to activate device discovery client: %{public}@", v4, 0xCu);
}

void sub_1000CE5B8()
{
  sub_10000AEF4();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "MSDRapportDeviceExplorer: Ignore device either not in pairing mode or not yet authenticated.", v1, 2u);
}

void sub_1000CE5F8()
{
  sub_10000AEF4();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "MSDRapportDeviceExplorer: Ignore device both in pairing mode and authenticated.", v1, 2u);
}

void sub_1000CE638()
{
  sub_1000088C4();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "MSDRapportDeviceExplorer: Found RPCompanionLinkDevice: <%{public}@>", v1, 0xCu);
}

void sub_1000CE6AC()
{
  sub_1000088C4();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "MSDRapportDeviceExplorer: Lost RPCompanionLinkDevice: <%{public}@>", v1, 0xCu);
}

void sub_1000CE720()
{
  sub_1000088C4();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "MSDRapportDeviceExplorer: RPCompanionLinkDevice changed: <%{public}@> change flags: %u", v2, 0x12u);
}

void sub_1000CE7A4()
{
  sub_1000088C4();
  sub_100013D1C((void *)&_mh_execute_header, v0, v1, "Not able to remove key:%{public}@", v2);
}

void sub_1000CE810()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Cannot save demo device flag.", v2, v3, v4, v5, v6);
}

void sub_1000CE844()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Entering demo mode is not allowed on this device.", v2, v3, v4, v5, v6);
}

void sub_1000CE878()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Cannot save POS device flag.", v2, v3, v4, v5, v6);
}

void sub_1000CE8AC()
{
  sub_1000088C4();
  sub_100013D1C((void *)&_mh_execute_header, v0, v1, "Failed to remove preference key %{public}@", v2);
}

void sub_1000CE918()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Not able to create dummy preferences file.", v2, v3, v4, v5, v6);
}

void sub_1000CE94C()
{
  sub_1000088C4();
  sub_100013D1C((void *)&_mh_execute_header, v0, v1, "Not able to migrate old preferences file.:%{public}@", v2);
}

void sub_1000CE9B8(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  sub_100013D1C((void *)&_mh_execute_header, a3, (uint64_t)a3, "Not able to create dummy preferences file:%{public}@", (uint8_t *)a2);
}

void sub_1000CEA08()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Not able to create mobilestoredemocache.", v2, v3, v4, v5, v6);
}

void sub_1000CEA3C()
{
  int v2 = 136315650;
  sub_100058F34();
  sub_100017FD0((void *)&_mh_execute_header, v0, v1, "%s - Couldn't move %{public}@ to %{public}@}.", v2);
}

void sub_1000CEAB0(void *a1)
{
  os_log_t v1 = [a1 localizedDescription];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "Cannot create folder %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000CEB34()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Cannot removing preference file in backup path", v2, v3, v4, v5, v6);
}

void sub_1000CEB68(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "Failed to send HID report to Apple Pencil: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000CEBEC()
{
  sub_10000AEF4();
  sub_100008438((void *)&_mh_execute_header, v0, v1, "mode and allowChange should not be nil", v2, v3, v4, v5, v6);
}

void sub_1000CEC20()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Cannot read artworkTraits.", v2, v3, v4, v5, v6);
}

void sub_1000CEC54()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Cannot get product description.", v2, v3, v4, v5, v6);
}

void sub_1000CEC88()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Cannot saved error code for nil request", v2, v3, v4, v5, v6);
}

void sub_1000CECBC()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Cannot get system uptime.", v2, v3, v4, v5, v6);
}

void sub_1000CECF0()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Could not match BSD name.", v2, v3, v4, v5, v6);
}

void sub_1000CED24()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Could not get io iterator", v2, v3, v4, v5, v6);
}

void sub_1000CED58()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Could not get service object", v2, v3, v4, v5, v6);
}

void sub_1000CED8C()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Could not get NAND size from disk0", v2, v3, v4, v5, v6);
}

void sub_1000CEDC0()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Could not find matching service", v2, v3, v4, v5, v6);
}

void sub_1000CEDF4()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Couldn't open master port.", v2, v3, v4, v5, v6);
}

void sub_1000CEE28()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Activation record is NULL", v2, v3, v4, v5, v6);
}

void sub_1000CEE5C(void *a1)
{
  uint64_t v1 = [a1 description];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "Could not get activation record with error - %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000CEEE0(uint64_t a1, NSObject *a2)
{
  int v2 = 136315650;
  uint64_t v3 = "-[MSDTargetDevice installedFactoryBundleID]";
  __int16 v4 = 2114;
  CFStringRef v5 = @"InstalledFactoryBundleID";
  __int16 v6 = 2114;
  uint64_t v7 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: Incorrect demo settings %{public}@: %{public}@", (uint8_t *)&v2, 0x20u);
}

void sub_1000CEF7C(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315138;
  __int16 v4 = "-[MSDTargetDevice hubSuppliedSettings]";
  sub_100013D1C((void *)&_mh_execute_header, a1, a3, "%s: Hub supplied settings not in right format.", (uint8_t *)&v3);
}

void sub_1000CEFF8(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315138;
  __int16 v4 = "-[MSDTargetDevice saveHubSuppliedSettings:]";
  sub_100013D1C((void *)&_mh_execute_header, a1, a3, "%s: Hub supplied settings not in right format.", (uint8_t *)&v3);
}

void sub_1000CF074(uint64_t a1, void *a2)
{
  uint64_t v7 = [a2 localizedDescription];
  sub_100046F6C();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x12u);
}

void sub_1000CF120(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "Failed to create device passcode: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000CF1A4(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "Failed to remove device passcode: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000CF228(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 138543362;
  CFStringRef v4 = @"ownership-warning";
  sub_100013D1C((void *)&_mh_execute_header, a1, a3, "ERROR - Failed to read nvram value for key:  %{public}@", (uint8_t *)&v3);
}

void sub_1000CF2A4()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "ERROR - Failed to convert DDL value to string.", v2, v3, v4, v5, v6);
}

void sub_1000CF2D8()
{
  sub_1000088C4();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "INFO - ddlFlagValue:  %{public}@", v1, 0xCu);
}

void sub_1000CF34C()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Couldn't locate options node in IODeviceTree", v2, v3, v4, v5, v6);
}

void sub_1000CF380()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Couldn't locate bootstrap_port mach port", v2, v3, v4, v5, v6);
}

void sub_1000CF3B4()
{
  sub_100009FA4();
  sub_100009F88((void *)&_mh_execute_header, v0, v1, "Failed to set SEP demo mode: %d", v2, v3, v4, v5, v6);
}

void sub_1000CF41C()
{
  int v2 = 136315650;
  sub_100058F34();
  sub_100017FD0((void *)&_mh_execute_header, v0, v1, "%s: Incorrect demo mode value: %{public}@ for key: %{public}@", v2);
}

void sub_1000CF490(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 138543362;
  CFStringRef v4 = @"com.apple.DemoUpdate";
  sub_100013D1C((void *)&_mh_execute_header, a1, a3, "Cannot uninstall application %{public}@", (uint8_t *)&v3);
}

void sub_1000CF50C()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to take power assertion.", v2, v3, v4, v5, v6);
}

void sub_1000CF540()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to release power assertion.", v2, v3, v4, v5, v6);
}

void sub_1000CF574()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Error:Not able to create Metadata folder in MobileStoreDemo cache.", v2, v3, v4, v5, v6);
}

void sub_1000CF5A8()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Not able to create cache blob.", v2, v3, v4, v5, v6);
}

void sub_1000CF5DC(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_100017F78();
  sub_100046F6C();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x16u);
}

void sub_1000CF674()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to coordinate snapshot revert with paired watch.", v2, v3, v4, v5, v6);
}

void sub_1000CF6A8()
{
  sub_100009FA4();
  sub_100009F88((void *)&_mh_execute_header, v0, v1, "Failed to unlock device keybag: %d", v2, v3, v4, v5, v6);
}

void sub_1000CF710(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "Failed to acquire device keybag lock assertion: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000CF794()
{
  sub_10000AEF4();
  sub_100008438((void *)&_mh_execute_header, v0, v1, "Registering xpc activity for sending over heartbeat to CA.", v2, v3, v4, v5, v6);
}

void sub_1000CF7C8()
{
  sub_10000AEF4();
  sub_100008438((void *)&_mh_execute_header, v0, v1, "Heartbeat XPC activity fired.", v2, v3, v4, v5, v6);
}

void sub_1000CF7FC()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to load mock OS update request.", v2, v3, v4, v5, v6);
}

void sub_1000CF830()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Cannot get darwin notifiy center", v2, v3, v4, v5, v6);
}

void sub_1000CF864()
{
  v1[0] = 138543618;
  sub_100017F78();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Failed to get process handle for %{public}@ with error: %{public}@", (uint8_t *)v1, 0x16u);
}

void sub_1000CF8E4()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to create network path monitor.", v2, v3, v4, v5, v6);
}

void sub_1000CF918()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to reset system time cache.", v2, v3, v4, v5, v6);
}

void sub_1000CF94C()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Cannot get disk usage.", v2, v3, v4, v5, v6);
}

void sub_1000CF980(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315138;
  uint64_t v4 = "-[MSDTargetDevice updateDeviceOptions:skipImutableKeys:]";
  sub_100013D1C((void *)&_mh_execute_header, a1, a3, "%s - Failed to enable do-not-buy in nvram for retail store.", (uint8_t *)&v3);
}

void sub_1000CF9FC(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315138;
  uint64_t v4 = "-[MSDTargetDevice updateDeviceOptions:skipImutableKeys:]";
  sub_100013D1C((void *)&_mh_execute_header, a1, a3, "%s - Failed to enable do-not-buy in nvram for channel store.", (uint8_t *)&v3);
}

void sub_1000CFA78(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315138;
  uint64_t v4 = "-[MSDTargetDevice updateDeviceOptions:skipImutableKeys:]";
  sub_100013D1C((void *)&_mh_execute_header, a1, a3, "%s - storeType must be of type NSString.", (uint8_t *)&v3);
}

void sub_1000CFAF4()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to set BG flag", v2, v3, v4, v5, v6);
}

void sub_1000CFB28()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to remove BG flag", v2, v3, v4, v5, v6);
}

void sub_1000CFB5C()
{
  os_log_t v0 = +[MSDPreferencesFile preferencesFilePath];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v1, v2, "Cannot write %{public}@.", v3, v4, v5, v6, v7);
}

void sub_1000CFBE8()
{
  sub_100009FA4();
  sub_100009F88((void *)&_mh_execute_header, v0, v1, "Failed to get desired icon state from SB. SBGetPendingIconState returned 0x%x", v2, v3, v4, v5, v6);
}

void sub_1000CFC50()
{
  sub_100009FA4();
  sub_100009F88((void *)&_mh_execute_header, v0, v1, "Failed to send desired icon state to SB. SBSetIconState returned 0x%x", v2, v3, v4, v5, v6);
}

void sub_1000CFCB8()
{
  sub_1000088C4();
  sub_100013D1C((void *)&_mh_execute_header, v0, v1, "Failed to set low power mode to mode: %ld", v2);
}

void sub_1000CFD24()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to update signed manifest in demod_helper", v2, v3, v4, v5, v6);
}

void sub_1000CFD58()
{
  __error();
  sub_100046F6C();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0xEu);
}

void sub_1000CFDF0()
{
  sub_10000AEF4();
  sub_100008438((void *)&_mh_execute_header, v0, v1, "No com.apple.Safari.History daemon found", v2, v3, v4, v5, v6);
}

void sub_1000CFE24(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Skipping entitlement check for file:%{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_1000CFE9C(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Entitlement check failed for %{public}@.", (uint8_t *)&v2, 0xCu);
}

void sub_1000CFF14(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 savePath];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "File deletion for %{public}@ failed", (uint8_t *)&v4, 0xCu);
}

void sub_1000CFFAC(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Can't create URL %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_1000D0024()
{
  sub_100017FB8();
  sub_100017FF0((void *)&_mh_execute_header, v0, v1, "Can't create read stream, %{public}@ %{public}@");
}

void sub_1000D008C()
{
  sub_100017FB8();
  sub_100017FF0((void *)&_mh_execute_header, v0, v1, "Can't open read stream %{public}@ *** %{public}@");
}

void sub_1000D00F4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D012C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D0164(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Progress handler returned with status %d; failing verification",
    (uint8_t *)v2,
    8u);
}

void sub_1000D01DC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D0214(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 20;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Timed out after %d minutes waiting for GM availability.", (uint8_t *)v1, 8u);
}

void sub_1000D0294(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 absoluteString];
  int v4 = [v3 stringByRemovingPercentEncoding];
  int v5 = 138543362;
  uint8_t v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Cannot read file %{public}@", (uint8_t *)&v5, 0xCu);
}

void sub_1000D0344(void *a1, uint64_t a2, NSObject *a3)
{
  int v5 = [a1 absoluteString];
  uint8_t v6 = [v5 stringByRemovingPercentEncoding];
  int v7 = 138543618;
  uint8_t v8 = v6;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Cannot read data from %{public}@ - %{public}@.", (uint8_t *)&v7, 0x16u);
}

void sub_1000D0404()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Device not eligible for DCOTA, demod should become dormant...", v2, v3, v4, v5, v6);
}

void sub_1000D0438()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "No or invalid FindMyHub response received", v2, v3, v4, v5, v6);
}

void sub_1000D046C(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[MSDFindMyHub askFindMyHubForHubInfo:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s - Hub URL is not set.", (uint8_t *)&v1, 0xCu);
}

void sub_1000D04F0(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[MSDFindMyHub askFindMyHubForHubInfo:]";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s - Invalid hub URL:  %{public}@", (uint8_t *)&v2, 0x16u);
}

void sub_1000D057C()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to parse hub host name from FindMyHub response.", v2, v3, v4, v5, v6);
}

void sub_1000D05B0(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "FindMyHub failed with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_1000D0628()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Invalid data format in Content.plist.", v2, v3, v4, v5, v6);
}

void sub_1000D065C()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to read Content.plist.", v2, v3, v4, v5, v6);
}

void sub_1000D0690(void *a1, NSObject *a2)
{
  uint64_t v4 = [a1 hubHostName];
  uint64_t v5 = [a1 hubPort];
  int v6 = 136315650;
  int v7 = "-[MSDFindMyHub enrollAndSetup:]";
  __int16 v8 = 2114;
  __int16 v9 = v4;
  __int16 v10 = 2114;
  __int16 v11 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s - invalid hub host name or port; hubHostName=%{public}@; hubPort=%{public}@",
    (uint8_t *)&v6,
    0x20u);
}

void sub_1000D0764(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[MSDDeviceDataCollector collectAppUsageDataForSession:fromStart:toEnd:]_block_invoke";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s - appUsage:  %{public}@", (uint8_t *)&v2, 0x16u);
}

void sub_1000D07F0(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Did not find store list in store search response: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_1000D0868(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to serialize store search result; error: %{public}@",
    (uint8_t *)&v2,
    0xCu);
}

void sub_1000D08E0(uint64_t a1, NSObject *a2)
{
  int v4 = 138543362;
  id v5 = (id)objc_opt_class();
  id v3 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unexpected data type %{public}@ for store list", (uint8_t *)&v4, 0xCu);
}

void sub_1000D0978(void *a1)
{
  uint64_t v1 = [a1 getName];
  sub_10001F5B8();
  sub_100018B4C((void *)&_mh_execute_header, v2, v3, "%{public}@ response payload does not contain: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000D0A08(void *a1)
{
  uint64_t v1 = [a1 getName];
  sub_10001F5B8();
  sub_100018B4C((void *)&_mh_execute_header, v2, v3, "%{public}@: HTTP status code is %{public}@.", v4, v5, v6, v7, v8);
}

void sub_1000D0A9C()
{
  sub_1000088C4();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Failed to remove directory: %{public}@", v1, 0xCu);
}

void sub_1000D0B10(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "Failed to create symbolic link - %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000D0B94(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "Failed to remove symbolic link - %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000D0C18(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 localizedDescription];
  sub_100023F88();
  sub_100018B4C((void *)&_mh_execute_header, v3, v4, "Failed to create %{public}@ - %{public}@", v5, v6, v7, v8, v9);
}

void sub_1000D0CAC(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "Failed to create parent folder - %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000D0D30(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D0D68(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D0DA0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D0DD8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D0E50(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D0EC8()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Could not initialize manifestVerifier", v2, v3, v4, v5, v6);
}

void sub_1000D0EFC()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to parse bundle ID", v2, v3, v4, v5, v6);
}

void sub_1000D0F30()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "InstallationOrder failed the validation.", v2, v3, v4, v5, v6);
}

void sub_1000D0F64(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D0FDC()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "InstallationOrder entry count does not match components listed in manifest.", v2, v3, v4, v5, v6);
}

void sub_1000D1010(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D1088(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D1100(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D1178()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "getBackup is only for old manifest.", v2, v3, v4, v5, v6);
}

void sub_1000D11AC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D1224(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D129C(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[MSDManifest addFilesUsingSourceManifest:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Root path must be the same between source and device manifest.", (uint8_t *)&v1, 0xCu);
}

void sub_1000D1320(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 path];
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_ERROR, "Couldn't get meta data for %{public}@", a1, 0xCu);
}

void sub_1000D1398(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 path];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Couldn't run handler against %{public}@", (uint8_t *)&v4, 0xCu);
}

void sub_1000D1430(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "rootPath already specified. Could not add more files.", v1, 2u);
}

void sub_1000D1474(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 getName];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}@: invalid request", (uint8_t *)&v4, 0xCu);
}

void sub_1000D150C(void *a1, NSObject *a2)
{
  int v4 = [a1 getName];
  uint64_t v5 = [a1 originServer];
  int v6 = 138543618;
  uint64_t v7 = v4;
  __int16 v8 = 2114;
  uint8_t v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}@ download credential for origin server %{public}@ invalid or expired", (uint8_t *)&v6, 0x16u);
}

void sub_1000D15D0(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to rename file to %{public}@: %{public}@", (uint8_t *)&v3, 0x16u);
}

void sub_1000D1658(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to get bundle path for app: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_1000D16D0(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to synchronize with CFPreferences.", v1, 2u);
}

void sub_1000D1714(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D174C(void *a1)
{
  int v1 = [a1 localizedDescription];
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "MSDRapportDeviceAdvertiser: Received an error: %{public}@", v4, v5, v6, v7, 2u);
}

void sub_1000D17D4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D180C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D1844(void *a1)
{
  int v1 = [a1 localizedDescription];
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "MSDRapportDeviceAdvertiser: Failed to activate RPCompanionLinkClient: %{public}@", v4, v5, v6, v7, 2u);
}

void sub_1000D18CC(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 fullKeyList];
  v5[0] = 136315394;
  sub_100017F78();
  sub_100026FA8((void *)&_mh_execute_header, a2, v4, "%s: Cannot get device information for keys: %{public}@", (uint8_t *)v5);
}

void sub_1000D1964(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D19DC(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6 = [a1 localizedDescription];
  int v7 = 136315906;
  __int16 v8 = "-[MSDMailProcessor pingWithType:]";
  __int16 v9 = 2114;
  __int16 v10 = v6;
  __int16 v11 = 2048;
  id v12 = [a1 code];
  __int16 v13 = 2114;
  uint64_t v14 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s: Cannot convert to dictionary - %{public}@(0x%tx). Target: %{public}@", (uint8_t *)&v7, 0x2Au);
}

void sub_1000D1AB4()
{
  v2[0] = 136315394;
  sub_100017F78();
  sub_100026FA8((void *)&_mh_execute_header, v0, v1, "%s: format not correct: %{public}@", (uint8_t *)v2);
}

void sub_1000D1B2C(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 error];
  sub_1000088C4();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Ping returned error: %{public}@", v4, 0xCu);
}

void sub_1000D1BC0()
{
  sub_1000088C4();
  sub_10001CB6C((void *)&_mh_execute_header, v0, v1, "Sending Ping with request: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000D1C28(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D1CA0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D1D18()
{
  sub_1000088C4();
  sub_10001CB6C((void *)&_mh_execute_header, v0, v1, "ping called with type - %lu", v2, v3, v4, v5, v6);
}

void sub_1000D1D80()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to DDL lock device.", v2, v3, v4, v5, v6);
}

void sub_1000D1DB4()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Device is either not a DDL device or its content is not locked.", v2, v3, v4, v5, v6);
}

void sub_1000D1DE8()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Unknown operation requested.", v2, v3, v4, v5, v6);
}

void sub_1000D1E1C()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Cannot save server and port to non-volitile media.", v2, v3, v4, v5, v6);
}

void sub_1000D1E50(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 localizedDescription];
  v5[0] = 136315394;
  sub_100017F78();
  sub_100026FA8((void *)&_mh_execute_header, a2, v4, "%s - updateManifestInfo failed.  Error:  %{public}@", (uint8_t *)v5);
}

void sub_1000D1EE8()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Command %{public}@ not allowed.", v2, v3, v4, v5, v6);
}

void sub_1000D1F50()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Device is busy?", v2, v3, v4, v5, v6);
}

void sub_1000D1F84()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Paired device is busy?", v2, v3, v4, v5, v6);
}

void sub_1000D1FB8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D2030()
{
  v2[0] = 136315394;
  sub_100017F78();
  sub_100026FA8((void *)&_mh_execute_header, v0, v1, "%s: format not correct: %{public}@", (uint8_t *)v2);
}

void sub_1000D20A8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D2114()
{
  sub_100009FA4();
  sub_100009F88((void *)&_mh_execute_header, v0, v1, "Could not save item in keychain:%d", v2, v3, v4, v5, v6);
}

void sub_1000D217C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D21B4()
{
  sub_100009FA4();
  sub_100009F88((void *)&_mh_execute_header, v0, v1, "Failed to retreive item from the keychain. %d", v2, v3, v4, v5, v6);
}

void sub_1000D221C()
{
  sub_100009FA4();
  sub_100009F88((void *)&_mh_execute_header, v0, v1, "Unable to delete item from the keychain. %d", v2, v3, v4, v5, v6);
}

void sub_1000D2284()
{
  sub_100009FA4();
  sub_100009F88((void *)&_mh_execute_header, v0, v1, "Failed to retrieve item from the keychain. %d", v2, v3, v4, v5, v6);
}

void sub_1000D22EC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D2358(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Received unknown XPC event of type: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_1000D23D0(void *a1)
{
  uint64_t v1 = [a1 getName];
  sub_10006DE08();
  sub_100018B4C((void *)&_mh_execute_header, v2, v3, "%{public}@: required key not found or is in unexpected format: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000D2460(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Execution error detected in method selector: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_1000D24D8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to move secondary staging to stashed staging.", v1, 2u);
}

void sub_1000D251C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to move secondary staging to temp device backup.", v1, 2u);
}

void sub_1000D2560(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to register for trusted peer change notification with status: %d", (uint8_t *)v2, 8u);
}

void sub_1000D25D8(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 localizedDescription];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to load account settings: %{public}@", (uint8_t *)&v4, 0xCu);
}

void sub_1000D2670(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Account setup not allowed on this device.", v1, 2u);
}

void sub_1000D26B4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D272C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D27A4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D281C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D2894(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D290C()
{
  sub_100017F78();
  sub_100017F8C((void *)&_mh_execute_header, v0, v1, "%s: iCloud account username in wrong format: %{public}@", v2, v3, v4, v5, 2u);
}

void sub_1000D2980()
{
  sub_100017F78();
  sub_100017F8C((void *)&_mh_execute_header, v0, v1, "%s: iCloud account settings in wrong format: %{public}@", v2, v3, v4, v5, 2u);
}

void sub_1000D29F4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D2A6C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D2AE4()
{
  sub_100017F78();
  sub_100017F8C((void *)&_mh_execute_header, v0, v1, "%s: iTunes account username in wrong format: %{public}@", v2, v3, v4, v5, 2u);
}

void sub_1000D2B58()
{
  sub_100017F78();
  sub_100017F8C((void *)&_mh_execute_header, v0, v1, "%s: iTunes account settings in wrong format: %{public}@", v2, v3, v4, v5, 2u);
}

void sub_1000D2BCC(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}@: Tried all remote URL's, cannot proceed with download", (uint8_t *)&v2, 0xCu);
}

void sub_1000D2C44(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}@: Exceeded Local URL available, local hub unreachable", (uint8_t *)&v2, 0xCu);
}

void sub_1000D2CBC(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%{public}@: No URL schema found in %{public}@", (uint8_t *)&v3, 0x16u);
}

void sub_1000D2D44()
{
  v1[0] = 136315394;
  sub_100017F78();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: Unknown operation identifier - %{public}@", (uint8_t *)v1, 0x16u);
}

void sub_1000D2DC4(void *a1, NSObject *a2)
{
  int v3 = [a1 name];
  v4[0] = 136315394;
  sub_100017F78();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: Illegal operation object instantiated - %{public}@", (uint8_t *)v4, 0x16u);
}

void sub_1000D2E64(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "Failed to fetch process states: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000D2EE8(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 localizedDescription];
  sub_100023F88();
  sub_100018B4C((void *)&_mh_execute_header, v3, v4, "Failed to create LSApplicationRecord for app: %{public}@ error: %{public}@", v5, v6, v7, v8, v9);
}

void sub_1000D2F7C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to observe app registered notification.", v1, 2u);
}

void sub_1000D2FC0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Timed out waiting for app to install.", v1, 2u);
}

void sub_1000D3004()
{
  sub_1000088C4();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "ERROR - Failed to create termination assertion for app:  %{public}@", v1, 0xCu);
}

void sub_1000D3078()
{
  sub_1000088C4();
  sub_10001CB6C((void *)&_mh_execute_header, v0, v1, "DEBUG - Successfully acquiring termination assertion for app:  %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000D30E0(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 localizedDescription];
  sub_100023F88();
  sub_100018B4C((void *)&_mh_execute_header, v3, v4, "ERROR - Failed to acquire termination assertion for app:  %{public}@ - Error:  %{public}@", v5, v6, v7, v8, v9);
}

void sub_1000D3174()
{
  sub_1000088C4();
  sub_10001CB6C((void *)&_mh_execute_header, v0, v1, "DEBUG - Acquiring termination assertion for app:  %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000D31DC()
{
  sub_1000088C4();
  sub_10001CB6C((void *)&_mh_execute_header, v0, v1, "DEBUG - Successfully invalidating termination assertion for app:  %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000D3244(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 localizedDescription];
  sub_100023F88();
  sub_100018B4C((void *)&_mh_execute_header, v3, v4, "ERROR - Failed to invalidate termination assertion for app:  %{public}@ - Error:  %{public}@", v5, v6, v7, v8, v9);
}

void sub_1000D32D8()
{
  sub_1000088C4();
  sub_10001CB6C((void *)&_mh_execute_header, v0, v1, "DEBUG - Invalidating termination assertion for app:  %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000D3340()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Cannot start with a connection", v2, v3, v4, v5, v6);
}

void sub_1000D3374()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Untracked task: %{public}@; canceling...", v2, v3, v4, v5, v6);
}

void sub_1000D33DC()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Not an HTTP response.", v2, v3, v4, v5, v6);
}

void sub_1000D3410(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4 = [a1 info];
  uint64_t v5 = [v4 savePath];
  sub_10006DE08();
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Cannot write data to file %{public}@, error: %{public}@", v6, 0x16u);
}

void sub_1000D34C0()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Unexpected challenge: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000D3528(void *a1)
{
  uint64_t v1 = [a1 description];
  sub_10006DE08();
  sub_100076D78((void *)&_mh_execute_header, v2, v3, "Session task : %{public}@ - didReceiveChallenge() called, authenticationMethod: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000D35B8()
{
  sub_10000AEF4();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "No http response or error; will atempt to retry task",
    v1,
    2u);
}

void sub_1000D35F8(uint64_t a1, void *a2)
{
  [a2 count];
  sub_100076D98();
  sub_100076D78((void *)&_mh_execute_header, v2, v3, "%{public}@:got %lu tasks in running state", v4, v5, v6, v7, v8);
}

void sub_1000D3678(uint64_t a1, void *a2)
{
  [a2 count];
  sub_100076D98();
  sub_100076D78((void *)&_mh_execute_header, v2, v3, "%{public}@:got %lu tasks in paused state", v4, v5, v6, v7, v8);
}

void sub_1000D36F8()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to get request from task info", v2, v3, v4, v5, v6);
}

void sub_1000D372C()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to create download task.", v2, v3, v4, v5, v6);
}

void sub_1000D3760(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 info];
  uint64_t v4 = [v3 savePath];
  sub_1000088C4();
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "File download paused, dispatching task with save path: %@ as paused", v5, 0xCu);
}

void sub_1000D380C()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to create file handle to save response data", v2, v3, v4, v5, v6);
}

void sub_1000D3840()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Input task info is invalid", v2, v3, v4, v5, v6);
}

void sub_1000D3874(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Failed to convert current date to English/Gregorian format.", v1, 2u);
}

void sub_1000D38B8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Failed to convert last bundle update date to English/Gregorian format.", v1, 2u);
}

void sub_1000D38FC(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2114;
  uint64_t v6 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "downloadSize: %lld downloadSizeBucket: %{public}@", (uint8_t *)&v3, 0x16u);
}

void sub_1000D3984(os_log_t log)
{
  int v1 = 136315394;
  uint64_t v2 = "-[MSDBAAInterface generateBAACertficate:]";
  __int16 v3 = 1024;
  int v4 = 60;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Installation timed out after %d seconds", (uint8_t *)&v1, 0x12u);
}

void sub_1000D3A18(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to embedd signatureData or certificate", v1, 2u);
}

void sub_1000D3A5C(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "encountered error:", v1, 2u);
}

void sub_1000D3AA0(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "keyData:%{public}@\t str:%{public}@", (uint8_t *)&v3, 0x16u);
}

void sub_1000D3B28(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "publicKey:%{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_1000D3BA0()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Cannot remove IPA/Patch file from cache: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000D3C08(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [a2 localizedDescription];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  uint8_t v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Cannot remove temp IPA %{public}@ - %{public}@", (uint8_t *)&v6, 0x16u);
}

void sub_1000D3CBC(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "Could not create IXUpdatingAppInstallCoordinator with error - %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000D3D40(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "Could not create IXInitiatingAppInstallCoordinator with error - %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000D3DC4(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "Cannot cancel IPA promise: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000D3E48(uint64_t a1, int *a2, uint8_t *buf, os_log_t log)
{
  int v4 = *a2;
  *(_DWORD *)uint8_t buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1026;
  *(_DWORD *)(buf + 14) = v4;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to open file: %{public}@ - %{public, errno}d", buf, 0x12u);
}

void sub_1000D3EA4()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Failed to malloc memory of %lu bytes.", v2, v3, v4, v5, v6);
}

void sub_1000D3F0C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to instantiate NSData object.", v1, 2u);
}

void sub_1000D3F50(int *a1, uint8_t *buf, os_log_t log)
{
  int v3 = *a1;
  *(_DWORD *)uint8_t buf = 67240192;
  *((_DWORD *)buf + 1) = v3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to read data to buffer: %{public, errno}d", buf, 8u);
}

void sub_1000D3F9C()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Failed to prepare for SZ promise: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000D4004()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Failed to supply bytes to SZ promise: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000D406C()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Failed to finish stream for SZ promise: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000D40D4(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Cannot load domains.plist from %{public}@.", (uint8_t *)&v2, 0xCu);
}

void sub_1000D414C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Cannot find domains.", v1, 2u);
}

void sub_1000D4190(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Cannot generate custom domains.", v1, 2u);
}

void sub_1000D41D4(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Manifest file path %{public}@ is not same as real path: %{public}@", (uint8_t *)&v3, 0x16u);
}

void sub_1000D425C(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  int v3 = "-[WhitelistChecker handleSystemContainerFiles:withMetadata:]";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s:Container check failed for %{public}@", (uint8_t *)&v2, 0x16u);
}

void sub_1000D42E8(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to set background download environment after %ld attempts. Bailing out.", (uint8_t *)&v2, 0xCu);
}

void sub_1000D4360(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to build components from manifest", v1, 2u);
}

void sub_1000D43A4(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to set background download environment. Will try again..", buf, 2u);
}

void sub_1000D43E4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Cannot stage device for update progress.", v1, 2u);
}

void sub_1000D4428(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 device];
  int v4 = 134217984;
  id v5 = [v3 backgroundDownloadState];
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Called quitBackgroundDownload when background state:%lu", (uint8_t *)&v4, 0xCu);
}

void sub_1000D44C4(uint64_t a1, void *a2, NSObject *a3)
{
  id v5 = [a2 name];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  uint8_t v9 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "Dispatching operation %{public}@ to queue %{public}@", (uint8_t *)&v6, 0x16u);
}

void sub_1000D4578(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D45B0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D45E8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D4620()
{
  sub_10000AEF4();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Enrollment has started with DU.", v1, 2u);
}

void sub_1000D4660()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Leaf certificate not found.", v2, v3, v4, v5, v6);
}

void sub_1000D4694()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "The device was pin-ed to a different certificate.", v2, v3, v4, v5, v6);
}

void sub_1000D46C8()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "failed in trust server-applePKI", v2, v3, v4, v5, v6);
}

void sub_1000D46FC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D4774(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D47EC(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "SecTrustEvaluate returned fail: %d", (uint8_t *)v2, 8u);
}

void sub_1000D4864(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D48DC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D4954(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D49C0()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Cannot find common name.", v2, v3, v4, v5, v6);
}

void sub_1000D49F4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D4A6C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D4AE4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D4B5C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D4BD4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D4C4C(void *a1)
{
  uint64_t v1 = [a1 getName];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "%{public}@: Failed to convert input to query items", v4, v5, v6, v7, v8);
}

void sub_1000D4CD0(void *a1)
{
  uint64_t v1 = [a1 getName];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "%{public}@: cannot send request to nil path", v4, v5, v6, v7, v8);
}

void sub_1000D4D54(void *a1)
{
  uint64_t v1 = [a1 getName];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "%{public}@: invalid request", v4, v5, v6, v7, v8);
}

void sub_1000D4DD8(void *a1)
{
  uint64_t v1 = [a1 getName];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "%{public}@: failed to generate post data", v4, v5, v6, v7, v8);
}

void sub_1000D4E5C(void *a1)
{
  uint64_t v1 = [a1 getName];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "%{public}@: cannot send request to nil endpoint", v4, v5, v6, v7, v8);
}

void sub_1000D4EE0(void *a1)
{
  uint64_t v1 = [a1 getName];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "%{public}@: failed to convert to task info", v4, v5, v6, v7, v8);
}

void sub_1000D4F64(os_log_t log)
{
  int v1 = 138543362;
  CFStringRef v2 = @"/Applications/StoreDemoViewService.app";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not load localization bundle at %{public}@", (uint8_t *)&v1, 0xCu);
}

void sub_1000D4FE8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D5074()
{
  v1[0] = 136315394;
  sub_100017F78();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s - allLocalizations = %{public}@", (uint8_t *)v1, 0x16u);
}

void sub_1000D50F4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D5180(os_log_t log)
{
  int v1 = 136315138;
  CFStringRef v2 = "+[MSDLocalization getWarningKeys:andPlaceHolderWarnings:forOwnershipWarningFlag:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s - ERROR - Failed to get device class.", (uint8_t *)&v1, 0xCu);
}

void sub_1000D5204()
{
  sub_100017F78();
  sub_100017F8C((void *)&_mh_execute_header, v0, v1, "%s - ERROR - Invalid ownershipWarningFlag value:  %{public}@", v2, v3, v4, v5, 2u);
}

void sub_1000D5278()
{
  sub_100017F78();
  sub_100017F8C((void *)&_mh_execute_header, v0, v1, "%s - ERROR - Unsupported device class:  %{public}@", v2, v3, v4, v5, 2u);
}

void sub_1000D52EC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Fall back to default store hours.", v1, 2u);
}

void sub_1000D5330()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "No or invalid last updated date for store hour settings: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000D5398(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 toString];
  sub_1000088C4();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Store hour settings have or will be expired on %{public}@", v4, 0xCu);
}

void sub_1000D542C()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Raw store hours not in right format: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000D5494(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to parse raw store hours.", v1, 2u);
}

void sub_1000D54D8()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Store hour not in right order - %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000D5540()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Failed to parse store hour date string - %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000D55A8()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Store hour not in right format - %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000D5610()
{
  sub_100017F78();
  sub_100017F8C((void *)&_mh_execute_header, v0, v1, "%s - Failed to read manifest file:  %{public}@", v2, v3, v4, v5, 2u);
}

void sub_1000D5684(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 localizedDescription];
  v4[0] = 136315394;
  sub_100017F78();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s:  Failed to convert manifest file to property list.  Error:  %{public}@", (uint8_t *)v4, 0x16u);
}

void sub_1000D5724()
{
  sub_100017F78();
  sub_100017F8C((void *)&_mh_execute_header, v0, v1, "%s:  Missing Version number in manifest file:  %{public}@", v2, v3, v4, v5, 2u);
}

void sub_1000D5798(void *a1, NSObject *a2)
{
  int v3 = 136315394;
  uint64_t v4 = "+[MSDSignedManifestFactory readManifestFromFile:]";
  __int16 v5 = 1024;
  unsigned int v6 = [a1 intValue];
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s:  Manifest version %d is not supported yet.", (uint8_t *)&v3, 0x12u);
}

void sub_1000D5838()
{
  sub_100017F78();
  sub_100017F8C((void *)&_mh_execute_header, v0, v1, "%s:  Manifest file is in wrong format:  %{public}@ - Must be NSDictionary.", v2, v3, v4, v5, 2u);
}

void sub_1000D58AC()
{
  sub_100017F78();
  sub_100017F8C((void *)&_mh_execute_header, v0, v1, "%s - Manifest file does not exist:  %{public}@", v2, v3, v4, v5, 2u);
}

void sub_1000D5920(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to delete cache container for: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_1000D5998(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to uninstall app: %{public}@ - %{public}@", (uint8_t *)&v4, 0x16u);
}

void sub_1000D5A24()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "File does not exist at %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000D5A8C(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 localizedDescription];
  sub_100023F88();
  sub_100018B4C((void *)&_mh_execute_header, v3, v4, "Get file attributes failed for %{public}@ with error - %{public}@", v5, v6, v7, v8, v9);
}

void sub_1000D5B20()
{
  sub_10008804C();
  __error();
  sub_100088034();
  sub_100088058((void *)&_mh_execute_header, v0, v1, "Could not extract extended attributes from %{public}@.  Error:  %{public, errno}d", v2, v3, v4, v5, v6);
}

void sub_1000D5B9C()
{
  sub_10008804C();
  __error();
  sub_100088034();
  sub_100088058((void *)&_mh_execute_header, v0, v1, "Could not extract extended attributes from %{public}@. File is expected to have extended attributes.  Error:  %{public, errno}d", v2, v3, v4, v5, v6);
}

void sub_1000D5C18()
{
  sub_10008804C();
  uint64_t v0 = __error();
  strerror(*v0);
  sub_10008801C();
  sub_100018B4C((void *)&_mh_execute_header, v1, v2, "Could not get ACL for %{public}@ with error - %{public}s", v3, v4, v5, v6, v7);
}

void sub_1000D5C98()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Could not allocate buffer for ACL.", v2, v3, v4, v5, v6);
}

void sub_1000D5CCC()
{
  sub_10008804C();
  uint64_t v0 = __error();
  strerror(*v0);
  sub_10008801C();
  sub_100018B4C((void *)&_mh_execute_header, v1, v2, "Could not create ACL binary format for %{public}@ with error - %{public}s", v3, v4, v5, v6, v7);
}

void sub_1000D5D4C()
{
  sub_10008804C();
  uint64_t v0 = __error();
  strerror(*v0);
  sub_10008801C();
  sub_100018B4C((void *)&_mh_execute_header, v1, v2, "Could not validate ACL for %{public}@ with error - %{public}s", v3, v4, v5, v6, v7);
}

void sub_1000D5DCC()
{
  sub_1000088C4();
  sub_100017FF0((void *)&_mh_execute_header, v0, v1, "Could not extract extended file attributes from %{public}@, returned %td");
}

void sub_1000D5E40()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Coud not extract extended file attributes from %{public}@. File is expected to have extended attributes.", v2, v3, v4, v5, v6);
}

void sub_1000D5EA8()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Could not get attribute keys from file %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000D5F10(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 localizedDescription];
  sub_100023F88();
  sub_100018B4C((void *)&_mh_execute_header, v3, v4, "Could not get destination of symbolic link %{public}@ with error - %{public}@", v5, v6, v7, v8, v9);
}

void sub_1000D5FA4()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Cannot get file attribute for %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000D600C()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Cannot get file extended attribute for %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000D6074()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Cannot allocate space.", v2, v3, v4, v5, v6);
}

void sub_1000D60A8()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Inconsistent return value from listxattr.", v2, v3, v4, v5, v6);
}

void sub_1000D60DC()
{
  sub_1000088C4();
  sub_100017FF0((void *)&_mh_execute_header, v0, v1, "Cannot remove extended attribte %{public}s from %{public}@.");
}

void sub_1000D6150()
{
  sub_10008804C();
  uint64_t v0 = __error();
  strerror(*v0);
  sub_10008801C();
  sub_100018B4C((void *)&_mh_execute_header, v1, v2, "Could not create empty ACL for %{public}@ with error - %{public}s", v3, v4, v5, v6, v7);
}

void sub_1000D61D0()
{
  sub_10008804C();
  uint64_t v0 = __error();
  strerror(*v0);
  sub_10008801C();
  sub_100018B4C((void *)&_mh_execute_header, v1, v2, "Could not set ACL for %{public}@ with error - %{public}s", v3, v4, v5, v6, v7);
}

void sub_1000D6250()
{
  sub_10008804C();
  uint64_t v0 = __error();
  strerror(*v0);
  sub_10008801C();
  sub_100018B4C((void *)&_mh_execute_header, v1, v2, "Could not load ACL for %{public}@ with error - %{public}s", v3, v4, v5, v6, v7);
}

void sub_1000D62D0()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Could not set extended attributes on %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000D6338()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Got non-data value", v2, v3, v4, v5, v6);
}

void sub_1000D636C()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Got Non-string key", v2, v3, v4, v5, v6);
}

void sub_1000D63A0()
{
  sub_10008804C();
  __error();
  sub_100088034();
  sub_100088058((void *)&_mh_execute_header, v0, v1, "Could not set file permission on symlink %{public}@ with error - %{public, errno}d", v2, v3, v4, v5, v6);
}

void sub_1000D641C()
{
  sub_10008804C();
  __error();
  sub_100088034();
  sub_100088058((void *)&_mh_execute_header, v0, v1, "Could not set file ownership on symlink %{public}@ with error - %{public, errno}d", v2, v3, v4, v5, v6);
}

void sub_1000D6498(uint64_t a1, char a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2 & 1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "appInforeground: %{public}@, systemInUse: %{BOOL}d", (uint8_t *)&v3, 0x12u);
}

void sub_1000D6524()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "demo updater is busy.", v2, v3, v4, v5, v6);
}

void sub_1000D6558()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Cannot stage device for update progress.", v2, v3, v4, v5, v6);
}

void sub_1000D658C()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "waitForGMAvailability failed.", v2, v3, v4, v5, v6);
}

void sub_1000D65C0()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Failed to retrieve photos restore post processing status: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000D6628()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Failed to retrieve photos moment analysis status: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000D6690(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D671C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D67A8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D6820()
{
  sub_10001F5B8();
  sub_10008F364();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x2Au);
}

void sub_1000D68B4()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Timed out configuring demo state for Mail app.", v2, v3, v4, v5, v6);
}

void sub_1000D68E8(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 localizedDescription];
  sub_1000088C4();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to configure demo state for Mail app: %{public}@", v4, 0xCu);
}

void sub_1000D697C(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [a2 device];
  uint8_t v6 = [v5 OSVersion];
  int v7 = 138543618;
  uint64_t v8 = a1;
  sub_10008F354();
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Content requires OS version >= %{public}@, current OS version is %{public}@.", (uint8_t *)&v7, 0x16u);
}

void sub_1000D6A38()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to create Content.plist cache path", v2, v3, v4, v5, v6);
}

void sub_1000D6A6C()
{
  sub_10001F5B8();
  sub_100017F8C((void *)&_mh_execute_header, v0, v1, "Failed to copy %{public}@ to %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000D6AE0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D6B58()
{
  sub_10001F5B8();
  sub_100017F8C((void *)&_mh_execute_header, v0, v1, "Failed to copy %{public}@ to %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000D6BCC()
{
  sub_10001F5B8();
  sub_10008F364();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x16u);
}

void sub_1000D6C40()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Content.plist does not exist at cache path: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000D6CA8()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Selected bundle metadata do not contain file name", v2, v3, v4, v5, v6);
}

void sub_1000D6CDC()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Failed to load manifest file %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000D6D44()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Failed to copy manifest file with error: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000D6DAC()
{
  sub_10008F354();
  sub_10008F364();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x20u);
}

void sub_1000D6E34()
{
  sub_10008F354();
  sub_100017F8C((void *)&_mh_execute_header, v0, v1, "%s - Failed to create folder:  %{public}@", v2, v3, v4, v5, 2u);
}

void sub_1000D6EAC()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Failed to find cached bundle metadata for language %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000D6F14()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to load cached bundle metadata", v2, v3, v4, v5, v6);
}

void sub_1000D6F48(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D6FC0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D7038(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 getName];
  int v6 = 138543618;
  int v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%{public}@: required key not found or is in unexpected format: %{public}@", (uint8_t *)&v6, 0x16u);
}

void sub_1000D70E8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Is enrolled!", v1, 2u);
}

void sub_1000D712C(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "Failed to list directory contents - %{public}@", v4, v5, v6, v7, 2u);
}

void sub_1000D71B4(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "Failed to remove file: %{public}@", v4, v5, v6, v7, 2u);
}

void sub_1000D723C(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Converted from xpc to NSDictionary: %{public}@", (uint8_t *)&v3, 0xCu);
}

void sub_1000D72BC(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "The value for key %{public}@ has a type that is not supported yet", (uint8_t *)&v2, 0xCu);
}

void sub_1000D7334(void *a1, NSObject *a2)
{
  int v3 = 136315138;
  id v4 = [a1 objCType];
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unsupported NSNumber type: %s for xpc dictionary encoding", (uint8_t *)&v3, 0xCu);
}

void sub_1000D73C4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_opt_class();
  int v7 = 138543618;
  uint64_t v8 = a1;
  sub_10008F354();
  id v6 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "The value for key %{public}@ has unsupported type %{public}@", (uint8_t *)&v7, 0x16u);
}

void sub_1000D7468(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D74EC(void *a1)
{
  int v2 = [a1 localizedDescription];
  [a1 code];
  sub_100090D80();
  sub_10001F5CC((void *)&_mh_execute_header, v3, v4, "Failed to deserialize JSON object with error - %{public}@(0x%tx). Target: %{public}@", v5, v6, v7, v8, v9);
}

void sub_1000D7588()
{
  sub_10008F354();
  sub_100017F8C((void *)&_mh_execute_header, v0, v1, "%s: format not correct: %{public}@", v2, v3, v4, v5, 2u);
}

void sub_1000D7600(void *a1)
{
  uint64_t v2 = [a1 localizedDescription];
  [a1 code];
  sub_100090D80();
  sub_10001F5CC((void *)&_mh_execute_header, v3, v4, "Failed to serialize JSON object - %{public}@(0x%tx). Target: %{public}@", v5, v6, v7, v8, v9);
}

void sub_1000D769C()
{
  sub_10008F354();
  sub_100017F8C((void *)&_mh_execute_header, v0, v1, "%s: Not a valid JSON object: %{public}@", v2, v3, v4, v5, 2u);
}

void sub_1000D7714()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Loading Domains.plist failed", v2, v3, v4, v5, v6);
}

void sub_1000D7748()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "No certificates found in the manifest.", v2, v3, v4, v5, v6);
}

void sub_1000D777C()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "rigorousTesting failed.", v2, v3, v4, v5, v6);
}

void sub_1000D77B0()
{
  sub_100017F78();
  sub_100017F8C((void *)&_mh_execute_header, v0, v1, "%s: No matching certificate for %{public}@.", v2, v3, v4, v5, 2u);
}

void sub_1000D7824(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D789C()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Failed to parse payload for item: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000D7904()
{
  sub_100017F78();
  sub_100017F8C((void *)&_mh_execute_header, v0, v1, "%s: signature type for certificate %{public}@ does not exist", v2, v3, v4, v5, 2u);
}

void sub_1000D7978(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D79F0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D7A68(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D7AE0()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Could not locate the file:%{public}@", v2, v3, v4, v5, v6);
}

void sub_1000D7B48(os_log_t log)
{
  int v1 = 136315394;
  uint64_t v2 = "-[MSDDemoManifestCheck checkFileForEntitlements:forCorrespondingManifestEntry:]";
  __int16 v3 = 1024;
  int v4 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s:There is unexpected invalid signature/entitlements:%08x", (uint8_t *)&v1, 0x12u);
}

void sub_1000D7BD8()
{
  sub_100017F78();
  sub_100017F8C((void *)&_mh_execute_header, v0, v1, "%s Could not find a data container for:%{public}@", v2, v3, v4, v5, 2u);
}

void sub_1000D7C4C()
{
  sub_100017F78();
  sub_100017F8C((void *)&_mh_execute_header, v0, v1, "%s: %{public}@ section is not a dictionary", v2, v3, v4, v5, 2u);
}

void sub_1000D7CC0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D7D38(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D7DB0()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Can not load appleIST leaf certificate", v2, v3, v4, v5, v6);
}

void sub_1000D7DE4()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Can not load appleIST intermediate certificate", v2, v3, v4, v5, v6);
}

void sub_1000D7E18(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D7E90(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D7F08(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D7F78()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "OU did not match for appleIST cert.:%{public}@\n", v2, v3, v4, v5, v6);
}

void sub_1000D7FE0()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "appleIST certificate count is unexpected\n", v2, v3, v4, v5, v6);
}

void sub_1000D8014(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D808C()
{
  sub_1000964C4();
  sub_100017F8C((void *)&_mh_execute_header, v0, v1, "%s: certificate trust evaluation failed: %ld", v2, v3, v4, v5, 2u);
}

void sub_1000D8104(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D817C()
{
  sub_1000964C4();
  sub_100017F8C((void *)&_mh_execute_header, v0, v1, "%s: Cannot evaluate trust: %ld", v2, v3, v4, v5, 2u);
}

void sub_1000D81F4()
{
  sub_1000964C4();
  sub_100017F8C((void *)&_mh_execute_header, v0, v1, "%s: Cannot set anchor certificates: %ld", v2, v3, v4, v5, 2u);
}

void sub_1000D826C()
{
  sub_1000964C4();
  sub_100017F8C((void *)&_mh_execute_header, v0, v1, "%s: Cannot create secure trust object: %ld", v2, v3, v4, v5, 2u);
}

void sub_1000D82E4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D835C(int a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[MSDDemoManifestCheck verifySignature:forData:withKey:]";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s: Failed in verifying signature(%d)", (uint8_t *)&v2, 0x12u);
}

void sub_1000D83E8()
{
  sub_10000AEF4();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "verifySignature is called", v1, 2u);
}

void sub_1000D8428(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D84A0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D8518()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Apps signed by IS&T can only have Provisioning Profiles dependency.", v2, v3, v4, v5, v6);
}

void sub_1000D854C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D85C4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D863C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D86B4(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a2 + 40);
  int v4 = 136315650;
  uint64_t v5 = "-[MSDDemoManifestCheck runSecurityCheck:]_block_invoke";
  __int16 v6 = 2114;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  uint64_t v9 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Failed rigorous check for:%{public}@ (from %{public}@)", (uint8_t *)&v4, 0x20u);
}

void sub_1000D8750()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Apple IST certificate is used to sign %{public}@ unexpected component", v2, v3, v4, v5, v6);
}

void sub_1000D87B8()
{
  sub_100017F78();
  sub_100017F8C((void *)&_mh_execute_header, v0, v1, "%{public}@ key does not exist in component %{public}@", v2, v3, v4, v5, 2u);
}

void sub_1000D882C()
{
  sub_100017F78();
  sub_100017F8C((void *)&_mh_execute_header, v0, v1, "%{public}@ key does not exist in component %{public}@", v2, v3, v4, v5, 2u);
}

void sub_1000D88A0()
{
  sub_100017F78();
  sub_100017F8C((void *)&_mh_execute_header, v0, v1, "%{public}@ key does not exist in component %{public}@", v2, v3, v4, v5, 2u);
}

void sub_1000D8914()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Component %{public}@ is not a Settings component", v2, v3, v4, v5, v6);
}

void sub_1000D897C()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "File attributes are nil for %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000D89E4()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Whitelist checker failed", v2, v3, v4, v5, v6);
}

void sub_1000D8A18()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "System container check failed for file:%{public}@", v2, v3, v4, v5, v6);
}

void sub_1000D8A80()
{
  sub_1000088C4();
  sub_100017FF0((void *)&_mh_execute_header, v0, v1, "File permissions failed for file:%{public}@(%ld)");
}

void sub_1000D8AF4()
{
  sub_1000088C4();
  sub_100017FF0((void *)&_mh_execute_header, v0, v1, "Not a valid fileType (%{public}@) for file: %{public}@");
}

void sub_1000D8B68()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "IS&T signed component in wrong format (no manifest) for %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000D8BD0()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "IS&T signed component in wrong format (symlink target) for %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000D8C38()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Failed to get path components for file: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000D8CA0()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Invalid data container file. %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000D8D08(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
}

void sub_1000D8D7C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
}

void sub_1000D8DF0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D8E5C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D8EC8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D8F34(void *a1, void *a2)
{
  uint64_t v3 = [a1 settingsFilePath];
  uint64_t v4 = [a2 localizedDescription];
  sub_100017FA8();
  sub_10001F5CC((void *)&_mh_execute_header, v5, v6, "%s - Error initializing the default system settings file %{public}@ with values - Error: %{public}@", v7, v8, v9, v10, 2u);
}

void sub_1000D8FF0(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 localizedDescription];
  sub_100017FA8();
  sub_10001F5CC((void *)&_mh_execute_header, v3, v4, "%s - error creating directory at %{public}@. Error: %{public}@", v5, v6, v7, v8, 2u);
}

void sub_1000D909C()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to retrieve device airplane mode setting. The airplane mode will not be refreshed", v2, v3, v4, v5, v6);
}

void sub_1000D90D0()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to retrieve device volume setting. The volume will not be refreshed", v2, v3, v4, v5, v6);
}

void sub_1000D9104()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to retrieve device air drop mode setting. The air drop mode will not be refreshed", v2, v3, v4, v5, v6);
}

void sub_1000D9138()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to retrieve device true tone setting. The true tone will not be refreshed", v2, v3, v4, v5, v6);
}

void sub_1000D916C(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[MSDSettingsRefresher initializeCacheWithValues:]";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s - Initialized settings refresher cache with values from saved file", (uint8_t *)&v1, 0xCu);
}

void sub_1000D91F0(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[MSDSettingsRefresher restoreSavedDeviceSettings]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s - The shallow refresh settings refresher is uninitialized. No settings revert will be done", (uint8_t *)&v1, 0xCu);
}

void sub_1000D9274()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Not restoring device airplane mode setting", v2, v3, v4, v5, v6);
}

void sub_1000D92A8()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Not restoring device volume setting", v2, v3, v4, v5, v6);
}

void sub_1000D92DC()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Not restoring device air drop mode setting", v2, v3, v4, v5, v6);
}

void sub_1000D9310()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Not restoring device true tone setting", v2, v3, v4, v5, v6);
}

void sub_1000D9344(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D93CC()
{
  sub_100017F78();
  sub_100098E44((void *)&_mh_execute_header, v0, v1, "%s - Current system true tone setting: %{public}@", v2, v3, v4, v5, 2u);
}

void sub_1000D9440(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D94C0()
{
  sub_100017F78();
  sub_100098E44((void *)&_mh_execute_header, v0, v1, "%s - Current system AirDrop mode setting: %{public}@", v2, v3, v4, v5, 2u);
}

void sub_1000D9534()
{
  v1[0] = 136315394;
  sub_100017FA8();
  CFStringRef v2 = @"Off";
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s - Invalid current airdrop setting read. Defaulting to %{public}@", (uint8_t *)v1, 0x16u);
}

void sub_1000D95C4()
{
  sub_10000AEF4();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Failed ApplePKI and AxinoePKI trust evaluation", v1, 2u);
}

void sub_1000D9604(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D967C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D96F4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D976C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D97E4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D985C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D98D4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D994C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D99C4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000D9A3C()
{
  sub_1000088C4();
  sub_100013D1C((void *)&_mh_execute_header, v0, v1, "%{public}@ is not app/appex bundle path.", v2);
}

void sub_1000D9AA8()
{
  sub_1000088C4();
  sub_100013D1C((void *)&_mh_execute_header, v0, v1, "Cannot load bundle: %{public}@", v2);
}

void sub_1000D9B14()
{
  sub_1000088C4();
  sub_100013D1C((void *)&_mh_execute_header, v0, v1, "No info.plist in bundle:  %{public}@.", v2);
}

void sub_1000D9B80(void *a1)
{
  uint64_t v1 = [a1 path];
  sub_100017F78();
  sub_100018B4C((void *)&_mh_execute_header, v2, v3, "%s - Failed to get executable URL for app:  %{public}@", v4, v5, v6, v7, 2u);
}

void sub_1000D9C10(void *a1)
{
  uint64_t v1 = [a1 path];
  sub_100017F78();
  sub_100018B4C((void *)&_mh_execute_header, v2, v3, "%s - Failed to get CodeResources URL for app:  %{public}@", v4, v5, v6, v7, 2u);
}

void sub_1000D9CA0(void *a1)
{
  uint64_t v1 = [a1 path];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "Cannot read file %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000D9D24(void *a1)
{
  uint64_t v1 = [a1 path];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "Cannot read data from %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000D9DA8()
{
  sub_1000088C4();
  sub_100013D1C((void *)&_mh_execute_header, v0, v1, "%{public}@ not found or in wrong format.", v2);
}

void sub_1000D9E14(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 138543362;
  CFStringRef v4 = @"CFBundleShortVersionString";
  sub_100013D1C((void *)&_mh_execute_header, a1, a3, "%{public}@ is not a string.", (uint8_t *)&v3);
}

void sub_1000D9E90(void *a1)
{
  uint64_t v1 = [a1 path];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "Cannot load bundle: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000D9F14(void *a1)
{
  uint64_t v1 = [a1 path];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "Cannot find executable file in bundle:  %{public}@.", v4, v5, v6, v7, v8);
}

void sub_1000D9F98()
{
  v1[0] = 136315394;
  sub_100017F78();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s - Failed to find app name under folder:  %{public}@", (uint8_t *)v1, 0x16u);
}

void sub_1000DA018(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [a2 localizedDescription];
  int v6 = 136315650;
  uint64_t v7 = "-[MSDiOSApp serachForFileWithSuffix:inFolder:]";
  __int16 v8 = 2114;
  uint64_t v9 = a1;
  __int16 v10 = 2114;
  __int16 v11 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s - Failed to read contents of folder:  %{public}@ - Error:  %{public}@", (uint8_t *)&v6, 0x20u);
}

void sub_1000DA0DC(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 localizedDescription];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "MSDRapportMessageHandler: Failed to activate RPCompanionLinkClient for listener: %{public}@", (uint8_t *)&v4, 0xCu);
}

void sub_1000DA174(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "MSDRapportMessageHandler: No RPCompanionLinkClient found for listener.", v1, 2u);
}

void sub_1000DA1B8()
{
  sub_10009DDBC();
  sub_10001CB6C((void *)&_mh_execute_header, v0, v1, "MSDRapportMessageHandler: Incoming options: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000DA224(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000DA290()
{
  sub_10009DDC8(__stack_chk_guard);
  sub_10009DDBC();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "MSDRapportMessageHandler: XPC connection to sender RPCompanionLinkClient interrupted for device: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000DA2F8()
{
  sub_10009DDC8(__stack_chk_guard);
  sub_10009DDBC();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "MSDRapportMessageHandler: XPC connection to sender RPCompanionLinkClient invalidated for device: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000DA360()
{
  sub_10009DDC8(__stack_chk_guard);
  sub_10009DDBC();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "MSDRapportMessageHandler: Link connection lost for device: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000DA3C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [[(id)sub_10009DDD4(a1, a2) localizedDescription];
  sub_10009DDA4();
  sub_100018B4C((void *)&_mh_execute_header, v3, v4, "MSDRapportMessageHandler: Failed to activate RPCompanionLinkClient for device: %{public}@ Error:%{public}@", v5, v6, v7, v8, v9);
}

void sub_1000DA454()
{
  sub_10009DDC8(__stack_chk_guard);
  sub_10009DDBC();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "MSDRapportMessageHandler: No RPCompanionLinkClient found for device: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000DA4BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [[(id)sub_10009DDD4(a1, a2) localizedDescription];
  sub_10009DDA4();
  sub_100018B4C((void *)&_mh_execute_header, v3, v4, "MSDRapportMessageHandler: Failed to send request of ID: %{public}@ error: %{public}@", v5, v6, v7, v8, v9);
}

void sub_1000DA548(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [[(id)sub_10009DDD4(a1, a2) localizedDescription];
  sub_10009DDA4();
  sub_100018B4C((void *)&_mh_execute_header, v3, v4, "MSDRapportMessageHandler: Failed to send event of ID: %{public}@ error: %{public}@", v5, v6, v7, v8, v9);
}

void sub_1000DA5D4(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "Failed to load JSON data: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000DA658(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "Failed to deserialize JSON data: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000DA6DC(uint64_t a1, int a2, os_log_t log)
{
  v3[0] = 67240450;
  v3[1] = a2;
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to run xctspawn: %{public, errno}d stdout: %{public}@", (uint8_t *)v3, 0x12u);
}

void sub_1000DA764(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "Failed to locate xctspawn tool: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000DA7E8(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "Failed to get file last modified date: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000DA86C(int a1, NSObject *a2)
{
  v2[0] = 67240192;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to run xctspawn: %{public, errno}d", (uint8_t *)v2, 8u);
}

void sub_1000DA8E4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "No test plan found.", v1, 2u);
}

void sub_1000DA928(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "No test target found.", v1, 2u);
}

void sub_1000DA96C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Device has no previous migration version saved.", v1, 2u);
}

void sub_1000DA9B0(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Previous saved migration version: %{public}@ not in expected format.", (uint8_t *)&v2, 0xCu);
}

void sub_1000DAA28(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "No CDP context found for primary account.", v1, 2u);
}

void sub_1000DAA6C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to get DSID from CDP context.", v1, 2u);
}

void sub_1000DAAB0(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "Failed to query recovery key availability: %{public}@", v4, v5, v6, v7, 2u);
}

void sub_1000DAB38(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "Failed to generate recovery key: %{public}@", v4, v5, v6, v7, 2u);
}

void sub_1000DABC0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "/Register data: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000DAC38(void *a1)
{
  uint64_t v1 = [a1 getName];
  sub_10006DE08();
  sub_100018B4C((void *)&_mh_execute_header, v2, v3, "%{public}@: error from the server: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000DACC8(void *a1)
{
  uint64_t v1 = [a1 getName];
  sub_10006DE08();
  sub_100018B4C((void *)&_mh_execute_header, v2, v3, "%{public}@: required key not found: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000DAD58(void *a1, void *a2)
{
  uint64_t v3 = [a1 path];
  uint64_t v4 = [a2 localizedDescription];
  sub_1000A17DC();
  sub_10001F5CC((void *)&_mh_execute_header, v5, v6, "%s - Failed to load file:  %{public}@ - Error:  %{public}@", v7, v8, v9, v10, 2u);
}

void sub_1000DAE08(void *a1, void *a2)
{
  uint64_t v3 = [a1 path];
  uint64_t v4 = [a2 localizedDescription];
  sub_1000A17DC();
  sub_10001F5CC((void *)&_mh_execute_header, v5, v6, "%s - Failed to save info to file:  %{public}@ - Error:  %{public}@", v7, v8, v9, v10, 2u);
}

void sub_1000DAEB8(uint64_t a1, void *a2)
{
  uint64_t v8 = [a2 localizedDescription];
  sub_10001F5CC((void *)&_mh_execute_header, v2, v3, "%s - Failed to create folder:  %{public}@ - Error:  %{public}@", v4, v5, v6, v7, 2u);
}

void sub_1000DAF6C(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 getName];
  int v6 = 138543618;
  uint64_t v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%{public}@ returned error: %{public}@", (uint8_t *)&v6, 0x16u);
}

void sub_1000DB01C(void *a1)
{
  uint64_t v1 = [a1 getName];
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "%{public}@: no data received.", v4, v5, v6, v7, 2u);
}

void sub_1000DB0A4(void *a1)
{
  uint64_t v1 = [a1 getName];
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "%{public}@: failed to convert data to dict", v4, v5, v6, v7, 2u);
}

void sub_1000DB12C(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Converted from xpc to NSArray: %{public}@", (uint8_t *)&v3, 0xCu);
}

void sub_1000DB1AC(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "The value at index %lu in this xpcArray are of an unsupported type", (uint8_t *)&v2, 0xCu);
}

void sub_1000DB224(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "The values in this NSArray are of an unsupported type", v1, 2u);
}

void sub_1000DB268(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4 = [a2 localizedDescription];
  sub_100023F88();
  sub_100026FA8((void *)&_mh_execute_header, a3, v5, "Error removing file %{public}@: %{public}@", v6);
}

void sub_1000DB304()
{
  sub_100017FB8();
  sub_100026FA8((void *)&_mh_execute_header, v0, (uint64_t)v0, "Failed to copy file from cache to path %{public}@ - %{public}@", v1);
}

void sub_1000DB374()
{
  sub_100017FB8();
  sub_100026FA8((void *)&_mh_execute_header, v0, (uint64_t)v0, "Failed to delete existing file %{public}@ - %{public}@", v1);
}

void sub_1000DB3E4()
{
  sub_1000088C4();
  sub_100013D1C((void *)&_mh_execute_header, v0, v1, "File %{public}@ failed hash check", v2);
}

void sub_1000DB450()
{
  sub_1000088C4();
  sub_100013D1C((void *)&_mh_execute_header, v0, v1, "Failed to delete file: %{public}@ from cache: does not exist", v2);
}

void sub_1000DB4BC(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 localizedDescription];
  sub_1000088C4();
  sub_100013D1C((void *)&_mh_execute_header, a2, v4, "Failed to load app patches list: %{public}@", v5);
}

void sub_1000DB548(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 localizedDescription];
  sub_1000088C4();
  sub_100013D1C((void *)&_mh_execute_header, a2, v4, "Failed to save app patches list: %{public}@", v5);
}

void sub_1000DB5D4(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "MSDNearbyObjectMonitor: Failed to create NIDevicePresenceConfiguration: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000DB65C(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "MSDNearbyObjectMonitor: Failed to activate device scanner: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000DB6E0(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1000088C4();
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "MSDNearbyObjectMonitor: NISession invalidated with error: %{public}@", v4, v5, v6, v7, v8);
}

void sub_1000DB764()
{
  sub_1000088C4();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "MSDNearbyObjectMonitor: Did update region for object: %@", v1, 0xCu);
}

void sub_1000DB7D8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "GreyMatter doesn't become available after OS update.", v1, 2u);
}

void sub_1000DB81C(uint64_t a1, NSObject *a2)
{
  int v2 = 136446210;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to install OS update (%{public}s)", (uint8_t *)&v2, 0xCu);
}

void sub_1000DB894(uint64_t a1, void *a2)
{
  int v2 = [a2 localizedDescription];
  sub_100023F88();
  sub_100018B4C((void *)&_mh_execute_header, v3, v4, "Failed to install OS update (%{public}s) - %{public}@", v5, v6, v7, v8, v9);
}

void sub_1000DB928(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)uint8_t buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Hub host name and port must be saved for handling request: %@", buf, 0xCu);
}

void sub_1000DB980(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "FDC response does not contain credential dictionary", v1, 2u);
}

void sub_1000DB9C4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to update FDC", v1, 2u);
}

void sub_1000DBA08(void *a1)
{
  uint64_t v1 = [a1 appID];
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "Failed to get IPA from server for app %{public}@", v4, v5, v6, v7, 2u);
}

void sub_1000DBA90(void *a1)
{
  uint64_t v1 = [a1 savePath];
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "Cannot find %{public}@", v4, v5, v6, v7, 2u);
}

void sub_1000DBB18(void *a1)
{
  uint64_t v1 = [a1 getName];
  sub_1000088A4((void *)&_mh_execute_header, v2, v3, "%{public}@: does not conform to MSDDownloadFileDetailsProtocol.", v4, v5, v6, v7, 2u);
}

void sub_1000DBBA0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000DBC18()
{
  sub_100017FB8();
  sub_1000AF174((void *)&_mh_execute_header, v0, v1, "Inserting key: %{public}@ obj: %{public}@");
}

void sub_1000DBC80()
{
  sub_10000AEF4();
  sub_100008438((void *)&_mh_execute_header, v0, v1, "Launching Blocking UI as app too, to dismiss CoverSheet", v2, v3, v4, v5, v6);
}

void sub_1000DBCB4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000DBD2C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000DBDA4()
{
  sub_10000AEF4();
  sub_100008438((void *)&_mh_execute_header, v0, v1, "Message send back to xpc client", v2, v3, v4, v5, v6);
}

void sub_1000DBDD8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000DBE50(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000DBEC8()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to generate random bytes", v2, v3, v4, v5, v6);
}

void sub_1000DBEFC()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to save secret key to keychain", v2, v3, v4, v5, v6);
}

void sub_1000DBF30()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "No input data specified.", v2, v3, v4, v5, v6);
}

void sub_1000DBF64()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "No IV specified.", v2, v3, v4, v5, v6);
}

void sub_1000DBF98()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to allocate output buffer.", v2, v3, v4, v5, v6);
}

void sub_1000DBFCC(char a1, int a2, os_log_t log)
{
  uint64_t v3 = "decrypt";
  if ((a1 & 1) == 0) {
    uint64_t v3 = "encrypt";
  }
  int v4 = 136315394;
  uint64_t v5 = v3;
  __int16 v6 = 1024;
  int v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to %s input data - %d", (uint8_t *)&v4, 0x12u);
}

void sub_1000DC06C()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Failed to read keychain items for key: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000DC0D4()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to encrypt and archive keychain items.", v2, v3, v4, v5, v6);
}

void sub_1000DC108()
{
  sub_100017FB8();
  sub_100017FF0((void *)&_mh_execute_header, v0, v1, "Failed to write data to file: %{public}@ error: %{public}@");
}

void sub_1000DC170()
{
  sub_100017FB8();
  sub_100017FF0((void *)&_mh_execute_header, v0, v1, "Failed to read data from file: %{public}@ error: %{public}@");
}

void sub_1000DC1D8()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to decrypt and unarchive keychain items.", v2, v3, v4, v5, v6);
}

void sub_1000DC20C()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Failed to save keychain item: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000DC274(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000DC2E0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000DC350(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000DC3C0()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Failed to archive keychain items: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000DC428()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to encrypt keychain archived data.", v2, v3, v4, v5, v6);
}

void sub_1000DC45C()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to decrypt keychain archived data.", v2, v3, v4, v5, v6);
}

void sub_1000DC490()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Failed to unarchive keychain items: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000DC4F8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000DC530(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000DC568(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000DC5A0()
{
  __assert_rtn("-[MSDHelperAgent init]_block_invoke", "MSDHelperAgent.m", 60, "type == XPC_TYPE_DICTIONARY");
}

void sub_1000DC5CC(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [a2 localizedDescription];
  int v6 = 136315650;
  int v7 = "-[MSDHelperAgent createDeviceManifestForComponent:ofType:withRootPath:userHomePath:andSavePath:]";
  __int16 v8 = 2114;
  uint64_t v9 = a1;
  __int16 v10 = 2114;
  __int16 v11 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s: Failed to load device manifest from: %{public}@ error: %{public}@", (uint8_t *)&v6, 0x20u);
}

void sub_1000DC690(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000DC708(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[MSDHelperAgent cloneFile:to:expectingHash:]";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s: will return.", (uint8_t *)&v1, 0xCu);
}

void sub_1000DC78C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000DC7F8(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[MSDHelperAgent cloneFile:to:expectingHash:]";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s: entered.", (uint8_t *)&v1, 0xCu);
}

void sub_1000DC87C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000DC8F4(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 context];
  uint64_t v4 = [v3 identifier];
  int v5 = 136315394;
  int v6 = "-[MSDSettingsInstallOperation _applySettingToDevice]";
  __int16 v7 = 2114;
  __int16 v8 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s - Error: unsupported device setting %{public}@ found in the manifest", (uint8_t *)&v5, 0x16u);
}

void sub_1000DC9B8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000DCA30(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000DCAA8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000DCB20(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error writing HDR setting to the MSDPreferences file", v1, 2u);
}

void sub_1000DCB64(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 getName];
  int v4 = 138543618;
  int v5 = v3;
  __int16 v6 = 2114;
  CFStringRef v7 = @"statusCode";
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}@ response payload does not contain: %{public}@", (uint8_t *)&v4, 0x16u);
}

void sub_1000DCC10(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Cannot register a nil delegate", v1, 2u);
}

void sub_1000DCC54(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "delegate does not conform to protocol.", v1, 2u);
}

void sub_1000DCC98()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Unable to set power. Error: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000DCD00()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to save wifi settings to our preferences file.", v2, v3, v4, v5, v6);
}

void sub_1000DCD34()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to connect to given Wifi network.", v2, v3, v4, v5, v6);
}

void sub_1000DCD68()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to enable Wifi.", v2, v3, v4, v5, v6);
}

void sub_1000DCD9C()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to load wifi settings from preferences file.", v2, v3, v4, v5, v6);
}

void sub_1000DCDD0()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to connect to given wifi network.", v2, v3, v4, v5, v6);
}

void sub_1000DCE04()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to enable wifi.", v2, v3, v4, v5, v6);
}

void sub_1000DCE38()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "WiFi password in preferences file is invalid.", v2, v3, v4, v5, v6);
}

void sub_1000DCE6C()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Unable to get the known profile from CoreWifi", v2, v3, v4, v5, v6);
}

void sub_1000DCEA0()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Unable to get SSID for current network.", v2, v3, v4, v5, v6);
}

void sub_1000DCED4(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to get wifi password from system keychain. Error: %d", (uint8_t *)v2, 8u);
}

void sub_1000DCF4C()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to save wifi settings in our preferences file.", v2, v3, v4, v5, v6);
}

void sub_1000DCF80(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000DCFF8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000DD070(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Cannot find matching ssid after %d scan attempts.", (uint8_t *)v1, 8u);
}

void sub_1000DD0F0()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Failed to connect to wifi. Error %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000DD158()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "Failed to start monitoring for CWFEventTypeInterfaceAdded event. Error %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000DD1C0(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 localizedDescription];
  sub_1000088C4();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to remove known WiFi network - %{public}@", v4, 0xCu);
}

void sub_1000DD254()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "WiFi settings not in right format.", v2, v3, v4, v5, v6);
}

void sub_1000DD288()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to decrypt WiFi password.", v2, v3, v4, v5, v6);
}

void sub_1000DD2BC()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "Failed to produce final password data.", v2, v3, v4, v5, v6);
}

void sub_1000DD2F0(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)uint8_t buf = 138543618;
  *(void *)(buf + 4) = @"/tmp/DownloadedFileList.plist";
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to save list of downloaded files to:  %{public}@ - Error:  %{public}@", buf, 0x16u);
}

void sub_1000DD35C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "downloadedFileList is not in valid XML format.", v1, 2u);
}

void sub_1000DD3A0(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)uint8_t buf = 138543362;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Cannot find metadata for %{public}@", buf, 0xCu);
}

void sub_1000DD3E8(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 64);
  int v4 = 138543618;
  uint64_t v5 = v2;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to download file %{public}@ to %{public}@", (uint8_t *)&v4, 0x16u);
}

void sub_1000DD470(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 localizedDescription];
  sub_1000088C4();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "MSDDemoPeerResponder: Failed to upload pairing password: %{public}@", v4, 0xCu);
}

void sub_1000DD504(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000DD57C(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[MSDDemoPeerResponder _getDeviceAddresses]";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s - addresses:  %{public}@", (uint8_t *)&v2, 0x16u);
}

void sub_1000DD608()
{
  sub_1000088C4();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Device properties:  %{public}@", v1, 0xCu);
}

void sub_1000DD67C()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "MSDDemoPeerResponder: Input recovery is not supported on iOS!", v2, v3, v4, v5, v6);
}

void sub_1000DD6B0(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [a2 localizedDescription];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "MSDDemoPeerResponder: Failed to create archive for app: %{public}@ error: %{public}@", (uint8_t *)&v6, 0x16u);
}

void sub_1000DD764()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "MSDDemoPeerResponder: Invalid app kind received: %lu", v2, v3, v4, v5, v6);
}

void sub_1000DD7CC()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "MSDDemoPeerResponder: Environment controller is not supported on iOS!", v2, v3, v4, v5, v6);
}

void sub_1000DD800()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "MSDDemoPeerResponder: Enumerating test scripts is not supported on this OS!", v2, v3, v4, v5, v6);
}

void sub_1000DD834()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "MSDDemoPeerResponder: Launching test script is not supported on this OS!", v2, v3, v4, v5, v6);
}

void sub_1000DD868()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "MSDDemoPeerResponder: Obtaining GK results is not supported on iOS!", v2, v3, v4, v5, v6);
}

void sub_1000DD89C()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "MSDDemoPeerResponder: Obtaining GK metrics is not supported on iOS!", v2, v3, v4, v5, v6);
}

void sub_1000DD8D0()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "MSDDemoPeerResponder: Loading LS measurements is not supported on iOS!", v2, v3, v4, v5, v6);
}

void sub_1000DD904()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "MSDDemoPeerResponder: Retrieving HS coaching suggestion is not supported on iOS!", v2, v3, v4, v5, v6);
}

void sub_1000DD938()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "MSDDemoPeerResponder:Reading IPD status is not supported on iOS!", v2, v3, v4, v5, v6);
}

void sub_1000DD96C()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "MSDDemoPeerResponder: Skipping auto IPD adjustment is not supported on iOS!", v2, v3, v4, v5, v6);
}

void sub_1000DD9A0()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "MSDDemoPeerResponder: Initiating IPD reset is not supported on iOS!", v2, v3, v4, v5, v6);
}

void sub_1000DD9D4()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "MSDDemoPeerResponder: Querying IPD reset stage is not supported on iOS!", v2, v3, v4, v5, v6);
}

void sub_1000DDA08()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "MSDDemoPeerResponder: Getting AX settings is not supported on iOS!", v2, v3, v4, v5, v6);
}

void sub_1000DDA3C()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "MSDDemoPeerResponder: Setting AX settings is not supported on iOS!", v2, v3, v4, v5, v6);
}

void sub_1000DDA70()
{
  sub_10000AEF4();
  sub_100009FB0((void *)&_mh_execute_header, v0, v1, "MSDDemoPeerResponder: Wiping user contents is not supported on iOS!", v2, v3, v4, v5, v6);
}

void sub_1000DDAA4()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "MSDDemoPeerResponder: Failed to unarchive WiFi settings data: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000DDB0C()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "MSDDemoPeerResponder: No selector found for message of ID: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000DDB74()
{
  sub_1000088C4();
  sub_10000AED8((void *)&_mh_execute_header, v0, v1, "MSDDemoPeerResponder: No implementation found for message of ID: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000DDBDC()
{
  sub_1000088C4();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "MSDDemoPeerResponder: Received unhandled event message: %{public}@ from device: %{public}@", v2, 0x16u);
}

void sub_1000DDC60(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "+[MSDBiomeAppInFocusStream collectAppUsageDataFrom:to:]_block_invoke";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s - Publisher event:", (uint8_t *)&v1, 0xCu);
}

void sub_1000DDCE4(void *a1, NSObject *a2)
{
  __int16 v3 = [a1 error];
  uint64_t v4 = [v3 localizedDescription];
  int v5 = 136315394;
  uint8_t v6 = "+[MSDBiomeAppInFocusStream collectAppUsageDataFrom:to:]_block_invoke";
  __int16 v7 = 2114;
  __int16 v8 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s - Sink completed with error:  %{public}@", (uint8_t *)&v5, 0x16u);
}

void sub_1000DDDA8(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)uint8_t buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Add closed event for app:  %{public}@", buf, 0xCu);
}

void sub_1000DDE00()
{
  sub_10000AEF4();
  sub_100008438((void *)&_mh_execute_header, v0, v1, "End event:", v2, v3, v4, v5, v6);
}

void sub_1000DDE34()
{
  sub_10000AEF4();
  sub_100008438((void *)&_mh_execute_header, v0, v1, "Start event:", v2, v3, v4, v5, v6);
}

void sub_1000DDE68()
{
  sub_10000AEF4();
  sub_100008438((void *)&_mh_execute_header, v0, v1, "\nPaired event:", v2, v3, v4, v5, v6);
}

void sub_1000DDE9C()
{
  sub_10000AEF4();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Invalid openEventSession", v1, 2u);
}

void sub_1000DDEDC(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)uint8_t buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Add open event for app:  %{public}@", buf, 0xCu);
}

void sub_1000DDF34()
{
  sub_10000AEF4();
  sub_100008438((void *)&_mh_execute_header, v0, v1, "\nOpen event:", v2, v3, v4, v5, v6);
}

void sub_1000DDF68(char a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "rval:  %{BOOL}d", (uint8_t *)v2, 8u);
}

void sub_1000DDFE4()
{
  sub_1000BEA08();
  sub_1000BE9D0(v2, v3, v4, 5.8382e-34);
  _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Subsumed  - start:  %{public}@ - end:  %{public}@", v5, 0x16u);
}

void sub_1000DE03C()
{
  sub_1000BEA08();
  sub_1000BE9D0(v2, v3, v4, 5.8382e-34);
  _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Subsuming - start:  %{public}@ - end:  %{public}@", v5, 0x16u);
}

void sub_1000DE094(void *a1)
{
  uint64_t v1 = [a1 absoluteTimestamp];
  uint64_t v2 = [v1 toString];
  sub_1000BE9B0((void *)&_mh_execute_header, v3, v4, "- Timestamp:      %{public}@", v5, v6, v7, v8, 2u);
}

void sub_1000DE134(void *a1)
{
  [a1 launchType];
  sub_1000BE9E8((void *)&_mh_execute_header, v1, v2, "- Type:           %{public}d", v3, v4, v5, v6, 0);
}

void sub_1000DE1B0(void *a1)
{
  uint64_t v1 = [a1 launchReason];
  sub_1000BE9B0((void *)&_mh_execute_header, v2, v3, "- LaunchReason:   %{public}@", v4, v5, v6, v7, 2u);
}

void sub_1000DE238(void *a1)
{
  [a1 starting];
  sub_1000BE9E8((void *)&_mh_execute_header, v1, v2, "- Starting:       %{BOOL}d", v3, v4, v5, v6, 0);
}

void sub_1000DE2B4(void *a1)
{
  uint64_t v1 = [a1 bundleID];
  sub_1000BE9B0((void *)&_mh_execute_header, v2, v3, "- BundleID:       %{public}@", v4, v5, v6, v7, 2u);
}

void sub_1000DE33C(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = [*(id *)(a1 + 40) getName];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}@: All URL retries exhausted, returning...", (uint8_t *)&v4, 0xCu);
}

void sub_1000DE3D8(void *a1, NSObject *a2)
{
  int v3 = 134217984;
  id v4 = [a1 requestPerSession];
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Decreased concurrent request per session to %ld", (uint8_t *)&v3, 0xCu);
}

void sub_1000DE464(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unknown contaier type: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_1000DE4DC(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [a2 localizedDescription];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Failed to create %{public}@ - %{public}@", (uint8_t *)&v6, 0x16u);
}

uint64_t type metadata accessor for GenerativeModelsAvailability.Availability()
{
  return type metadata accessor for GenerativeModelsAvailability.Availability();
}

uint64_t GenerativeModelsAvailability.Parameters.init(useCaseIdentifiers:)()
{
  return GenerativeModelsAvailability.Parameters.init(useCaseIdentifiers:)();
}

uint64_t type metadata accessor for GenerativeModelsAvailability.Parameters()
{
  return type metadata accessor for GenerativeModelsAvailability.Parameters();
}

uint64_t GenerativeModelsAvailability.availability.getter()
{
  return GenerativeModelsAvailability.availability.getter();
}

uint64_t GenerativeModelsAvailability.ChangeSequence.makeAsyncIterator()()
{
  return GenerativeModelsAvailability.ChangeSequence.makeAsyncIterator()();
}

uint64_t type metadata accessor for GenerativeModelsAvailability.ChangeSequence.Iterator()
{
  return type metadata accessor for GenerativeModelsAvailability.ChangeSequence.Iterator();
}

uint64_t type metadata accessor for GenerativeModelsAvailability.ChangeSequence()
{
  return type metadata accessor for GenerativeModelsAvailability.ChangeSequence();
}

uint64_t GenerativeModelsAvailability.changes.getter()
{
  return GenerativeModelsAvailability.changes.getter();
}

uint64_t static GenerativeModelsAvailability.current(parameters:)()
{
  return static GenerativeModelsAvailability.current(parameters:)();
}

uint64_t type metadata accessor for GenerativeModelsAvailability()
{
  return type metadata accessor for GenerativeModelsAvailability();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
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

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t AMFIDemoModeSetState()
{
  return _AMFIDemoModeSetState();
}

uint64_t APSXPCClientSendCommandCreatingReply()
{
  return _APSXPCClientSendCommandCreatingReply();
}

uint64_t AnalyticsDisableAllTransformSampling()
{
  return _AnalyticsDisableAllTransformSampling();
}

uint64_t AnalyticsRolloverEvents()
{
  return _AnalyticsRolloverEvents();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

uint64_t BYSetupAssistantNeedsToRun()
{
  return _BYSetupAssistantNeedsToRun();
}

uint64_t BiomeLibrary()
{
  return _BiomeLibrary();
}

uint64_t BonjourBrowser_CreateEx()
{
  return _BonjourBrowser_CreateEx();
}

uint64_t BonjourBrowser_SetDispatchQueue()
{
  return _BonjourBrowser_SetDispatchQueue();
}

uint64_t BonjourBrowser_Start()
{
  return _BonjourBrowser_Start();
}

uint64_t BonjourBrowser_Stop()
{
  return _BonjourBrowser_Stop();
}

CCCryptorStatus CCCrypt(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return _CCCrypt(op, alg, options, key, keyLength, iv, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

void CCHmac(CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA1(data, len, md);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return _CC_SHA1_Final(md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return _CC_SHA1_Init(c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return _CC_SHA1_Update(c, data, len);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFIndex CFArrayGetCountOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return _CFArrayGetCountOfValue(theArray, range, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  return _CFDateGetAbsoluteTime(theDate);
}

CFTypeID CFDateGetTypeID(void)
{
  return _CFDateGetTypeID();
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return _CFDictionaryGetCount(theDict);
}

uint64_t CFDictionaryGetInt64()
{
  return _CFDictionaryGetInt64();
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFDataRef CFHTTPMessageCopyBody(CFHTTPMessageRef message)
{
  return _CFHTTPMessageCopyBody(message);
}

CFStringRef CFHTTPMessageCopyHeaderFieldValue(CFHTTPMessageRef message, CFStringRef headerField)
{
  return _CFHTTPMessageCopyHeaderFieldValue(message, headerField);
}

CFStringRef CFHTTPMessageCopyRequestMethod(CFHTTPMessageRef request)
{
  return _CFHTTPMessageCopyRequestMethod(request);
}

CFURLRef CFHTTPMessageCopyRequestURL(CFHTTPMessageRef request)
{
  return _CFHTTPMessageCopyRequestURL(request);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

Boolean CFPreferencesAppValueIsForced(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesAppValueIsForced(key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

uint64_t CFPrefs_RemoveValue()
{
  return _CFPrefs_RemoveValue();
}

uint64_t CFPrefs_SetValue()
{
  return _CFPrefs_SetValue();
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return _CFPropertyListCreateDeepCopy(allocator, propertyList, mutabilityOption);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return _CFReadStreamCreateWithFile(alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return _CFReadStreamOpen(stream);
}

CFIndex CFReadStreamRead(CFReadStreamRef stream, UInt8 *buffer, CFIndex bufferLength)
{
  return _CFReadStreamRead(stream, buffer, bufferLength);
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return _CFStringGetCharactersPtr(theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return _CFURLCreateWithFileSystemPath(allocator, filePath, pathStyle, isDirectory);
}

uint64_t CMBaseObjectGetVTable()
{
  return _CMBaseObjectGetVTable();
}

uint64_t CWFSecItemQueryPassword()
{
  return _CWFSecItemQueryPassword();
}

uint64_t CWFSecItemSetPassword()
{
  return _CWFSecItemSetPassword();
}

uint64_t DMPerformMigration()
{
  return _DMPerformMigration();
}

uint64_t DMPerformMigrationIfNeeded()
{
  return _DMPerformMigrationIfNeeded();
}

uint64_t DeviceIdentityIsSupported()
{
  return _DeviceIdentityIsSupported();
}

uint64_t DeviceIdentityIssueClientCertificateWithCompletion()
{
  return _DeviceIdentityIssueClientCertificateWithCompletion();
}

uint64_t FigRouteDiscovererXPCRemoteCreate()
{
  return _FigRouteDiscovererXPCRemoteCreate();
}

uint64_t FigRoutingContextRemoteCopySystemMusicContext()
{
  return _FigRoutingContextRemoteCopySystemMusicContext();
}

uint64_t IDSKickGetDependent()
{
  return _IDSKickGetDependent();
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return _IOBSDNameMatching(mainPort, options, bsdName);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

kern_return_t IOMasterPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return _IOMasterPort(bootstrapPort, mainPort);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

IOReturn IOPMAssertionCreateWithName(CFStringRef AssertionType, IOPMAssertionLevel AssertionLevel, CFStringRef AssertionName, IOPMAssertionID *AssertionID)
{
  return _IOPMAssertionCreateWithName(AssertionType, AssertionLevel, AssertionName, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return _IOPMAssertionRelease(AssertionID);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return _IORegistryEntryFromPath(mainPort, path);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return _IOServiceGetMatchingServices(mainPort, matching, existing);
}

uint64_t MAECopyActivationRecordWithError()
{
  return _MAECopyActivationRecordWithError();
}

uint64_t MAEDeactivateDeviceWithError()
{
  return _MAEDeactivateDeviceWithError();
}

uint64_t MAGetPallasUrlForType()
{
  return _MAGetPallasUrlForType();
}

uint64_t MASetPallasUrlForType()
{
  return _MASetPallasUrlForType();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetStringAnswer()
{
  return _MGGetStringAnswer();
}

uint64_t MISCopyErrorStringForErrorCode()
{
  return _MISCopyErrorStringForErrorCode();
}

uint64_t MISEnumerateInstalledProvisioningProfiles()
{
  return _MISEnumerateInstalledProvisioningProfiles();
}

uint64_t MISInstallProvisioningProfile()
{
  return _MISInstallProvisioningProfile();
}

uint64_t MISProfileCreateWithFile()
{
  return _MISProfileCreateWithFile();
}

uint64_t MISProfileGetValue()
{
  return _MISProfileGetValue();
}

uint64_t MISProvisioningProfileGetUUID()
{
  return _MISProvisioningProfileGetUUID();
}

uint64_t MISRemoveProvisioningProfile()
{
  return _MISRemoveProvisioningProfile();
}

uint64_t MISValidateSignatureAndCopyInfo()
{
  return _MISValidateSignatureAndCopyInfo();
}

uint64_t MKBDeviceLockAssertion()
{
  return _MKBDeviceLockAssertion();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

uint64_t MKBUnlockDevice()
{
  return _MKBUnlockDevice();
}

uint64_t NSClassFromObject()
{
  return _NSClassFromObject();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

NSString *NSHomeDirectory(void)
{
  return _NSHomeDirectory();
}

NSString *__cdecl NSHomeDirectoryForUser(NSString *userName)
{
  return _NSHomeDirectoryForUser(userName);
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return _NSStringFromRange(range);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t NSStringfromPSYSyncSessionType()
{
  return _NSStringfromPSYSyncSessionType();
}

uint64_t PRSWallpaperObserverLocationsDescription()
{
  return _PRSWallpaperObserverLocationsDescription();
}

uint64_t RBSTaskStateIsRunning()
{
  return _RBSTaskStateIsRunning();
}

uint64_t SBGetPendingIconState()
{
  return _SBGetPendingIconState();
}

uint64_t SBSSpringBoardBlockableServerPort()
{
  return _SBSSpringBoardBlockableServerPort();
}

uint64_t SBSetIconState()
{
  return _SBSetIconState();
}

uint64_t SFProcessIDForProcessNamed()
{
  return _SFProcessIDForProcessNamed();
}

uint64_t SUStringFromUpdateType()
{
  return _SUStringFromUpdateType();
}

OSStatus SecCertificateCopyCommonName(SecCertificateRef certificate, CFStringRef *commonName)
{
  return _SecCertificateCopyCommonName(certificate, commonName);
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return _SecCertificateCopyData(certificate);
}

uint64_t SecCertificateCopyOrganizationalUnit()
{
  return _SecCertificateCopyOrganizationalUnit();
}

uint64_t SecCertificateCopyProperties()
{
  return _SecCertificateCopyProperties();
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return _SecCertificateCreateWithData(allocator, data);
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

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return _SecItemUpdate(query, attributesToUpdate);
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return _SecKeyCopyExternalRepresentation(key, error);
}

CFDataRef SecKeyCreateSignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef dataToSign, CFErrorRef *error)
{
  return _SecKeyCreateSignature(key, algorithm, dataToSign, error);
}

OSStatus SecKeyRawVerify(SecKeyRef key, SecPadding padding, const uint8_t *signedData, size_t signedDataLen, const uint8_t *sig, size_t sigLen)
{
  return _SecKeyRawVerify(key, padding, signedData, signedDataLen, sig, sigLen);
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return _SecKeyVerifySignature(key, algorithm, signedData, signature, error);
}

SecPolicyRef SecPolicyCreateBasicX509(void)
{
  return _SecPolicyCreateBasicX509();
}

uint64_t SecPolicyCreateDemoDigitalCatalogSigning()
{
  return _SecPolicyCreateDemoDigitalCatalogSigning();
}

uint64_t SecPolicyCreateMobileStoreSigner()
{
  return _SecPolicyCreateMobileStoreSigner();
}

SecPolicyRef SecPolicyCreateSSL(Boolean server, CFStringRef hostname)
{
  return _SecPolicyCreateSSL(server, hostname);
}

uint64_t SecPolicyCreateTestMobileStoreSigner()
{
  return _SecPolicyCreateTestMobileStoreSigner();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return _SecRandomCopyBytes(rnd, count, bytes);
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return _SecTaskCopySigningIdentifier(task, error);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

SecKeyRef SecTrustCopyPublicKey(SecTrustRef trust)
{
  return _SecTrustCopyPublicKey(trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return _SecTrustCreateWithCertificates(certificates, policies, trust);
}

OSStatus SecTrustEvaluate(SecTrustRef trust, SecTrustResultType *result)
{
  return _SecTrustEvaluate(trust, result);
}

SecCertificateRef SecTrustGetCertificateAtIndex(SecTrustRef trust, CFIndex ix)
{
  return _SecTrustGetCertificateAtIndex(trust, ix);
}

CFIndex SecTrustGetCertificateCount(SecTrustRef trust)
{
  return _SecTrustGetCertificateCount(trust);
}

OSStatus SecTrustSetAnchorCertificates(SecTrustRef trust, CFArrayRef anchorCertificates)
{
  return _SecTrustSetAnchorCertificates(trust, anchorCertificates);
}

uint64_t TCCAccessCopyInformationForBundleId()
{
  return _TCCAccessCopyInformationForBundleId();
}

uint64_t TCCAccessSetForBundleId()
{
  return _TCCAccessSetForBundleId();
}

uint64_t TMResetToFirstLaunch()
{
  return _TMResetToFirstLaunch();
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
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

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

ssize_t acl_copy_ext(void *buf_p, acl_t acl, ssize_t size)
{
  return _acl_copy_ext(buf_p, acl, size);
}

acl_t acl_copy_int(const void *buf_p)
{
  return _acl_copy_int(buf_p);
}

int acl_free(void *obj_p)
{
  return _acl_free(obj_p);
}

acl_t acl_get_file(const char *path_p, acl_type_t type)
{
  return _acl_get_file(path_p, type);
}

acl_t acl_init(int count)
{
  return _acl_init(count);
}

int acl_set_file(const char *path_p, acl_type_t type, acl_t acl)
{
  return _acl_set_file(path_p, type, acl);
}

ssize_t acl_size(acl_t acl)
{
  return _acl_size(acl);
}

int acl_valid(acl_t acl)
{
  return _acl_valid(acl);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

int close(int a1)
{
  return _close(a1);
}

uint64_t container_create_or_lookup_for_current_user()
{
  return _container_create_or_lookup_for_current_user();
}

uint64_t container_create_or_lookup_path_for_current_user()
{
  return _container_create_or_lookup_path_for_current_user();
}

uint64_t container_delete_all_container_content()
{
  return _container_delete_all_container_content();
}

uint64_t container_free_object()
{
  return _container_free_object();
}

uint64_t container_system_group_path_for_identifier()
{
  return _container_system_group_path_for_identifier();
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return _copyfile(from, to, state, flags);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return _dispatch_data_create(buffer, size, queue, destructor);
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

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
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

long double exp2(long double __x)
{
  return _exp2(__x);
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

int fflush(FILE *a1)
{
  return _fflush(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fputs(const char *a1, FILE *a2)
{
  return _fputs(a1, a2);
}

void free(void *a1)
{
}

void freeifaddrs(ifaddrs *a1)
{
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

int getifaddrs(ifaddrs **a1)
{
  return _getifaddrs(a1);
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return _getxattr(path, name, value, size, position, options);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return _inet_ntop(a1, a2, a3, a4);
}

int kill(pid_t a1, int a2)
{
  return _kill(a1, a2);
}

int lchmod(const char *a1, mode_t a2)
{
  return _lchmod(a1, a2);
}

int lchown(const char *a1, uid_t a2, gid_t a3)
{
  return _lchown(a1, a2, a3);
}

ssize_t listxattr(const char *path, char *namebuff, size_t size, int options)
{
  return _listxattr(path, namebuff, size, options);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
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

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

nw_interface_type_t nw_interface_get_type(nw_interface_t interface)
{
  return _nw_interface_get_type(interface);
}

nw_parameters_t nw_parameters_create(void)
{
  return _nw_parameters_create();
}

void nw_parameters_set_multipath_service(nw_parameters_t parameters, nw_multipath_service_t multipath_service)
{
}

uint64_t nw_path_create_evaluator_for_endpoint()
{
  return _nw_path_create_evaluator_for_endpoint();
}

void nw_path_enumerate_interfaces(nw_path_t path, nw_path_enumerate_interfaces_block_t enumerate_block)
{
}

uint64_t nw_path_evaluator_copy_path()
{
  return _nw_path_evaluator_copy_path();
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return _nw_path_get_status(path);
}

void nw_path_monitor_cancel(nw_path_monitor_t monitor)
{
}

nw_path_monitor_t nw_path_monitor_create(void)
{
  return _nw_path_monitor_create();
}

void nw_path_monitor_set_queue(nw_path_monitor_t monitor, dispatch_queue_t queue)
{
}

void nw_path_monitor_set_update_handler(nw_path_monitor_t monitor, nw_path_monitor_update_handler_t update_handler)
{
}

void nw_path_monitor_start(nw_path_monitor_t monitor)
{
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
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

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return _os_signpost_id_generate(log);
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

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

int removexattr(const char *path, const char *name, int options)
{
  return _removexattr(path, name, options);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return _setxattr(path, name, value, size, position, options);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
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

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
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

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return _vm_deallocate(target_task, address, size);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

void xpc_activity_unregister(const char *identifier)
{
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return _xpc_array_apply(xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return _xpc_array_create(objects, count);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return _xpc_BOOL_create(value);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return _xpc_connection_get_audit_token();
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return _xpc_connection_send_message_with_reply_sync(connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return _xpc_data_create(bytes, length);
}

xpc_object_t xpc_data_create_with_dispatch_data(dispatch_data_t ddata)
{
  return _xpc_data_create_with_dispatch_data(ddata);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return _xpc_data_get_bytes_ptr(xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return _xpc_data_get_length(xdata);
}

xpc_object_t xpc_date_create(int64_t interval)
{
  return _xpc_date_create(interval);
}

int64_t xpc_date_get_value(xpc_object_t xdate)
{
  return _xpc_date_get_value(xdate);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return _xpc_dictionary_apply(xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_array(xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return _xpc_dictionary_get_data(xdict, key, length);
}

int64_t xpc_dictionary_get_date(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_date(xdict, key);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_double(xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
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

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_date(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_object_t xpc_double_create(double value)
{
  return _xpc_double_create(value);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  return _xpc_double_get_value(xdouble);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return _xpc_int64_create(value);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return _xpc_int64_get_value(xint);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return _xpc_string_get_string_ptr(xstring);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return _xpc_uint64_get_value(xuint);
}

id objc_msgSend_App(void *a1, const char *a2, ...)
{
  return _[a1 App];
}

id objc_msgSend_HTTPMethod(void *a1, const char *a2, ...)
{
  return _[a1 HTTPMethod];
}

id objc_msgSend_InFocus(void *a1, const char *a2, ...)
{
  return _[a1 InFocus];
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_MCSetBoolRestriction_value_(void *a1, const char *a2, ...)
{
  return [a1 MCSetBoolRestriction:value:];
}

id objc_msgSend_OSBuild(void *a1, const char *a2, ...)
{
  return _[a1 OSBuild];
}

id objc_msgSend_OSVersion(void *a1, const char *a2, ...)
{
  return _[a1 OSVersion];
}

id objc_msgSend_PLHasCompletedMomentAnalysis(void *a1, const char *a2, ...)
{
  return _[a1 PLHasCompletedMomentAnalysis];
}

id objc_msgSend_PLHasCompletedRestorePostProcessing(void *a1, const char *a2, ...)
{
  return _[a1 PLHasCompletedRestorePostProcessing];
}

id objc_msgSend_RSSI(void *a1, const char *a2, ...)
{
  return _[a1 RSSI];
}

id objc_msgSend_SSID(void *a1, const char *a2, ...)
{
  return _[a1 SSID];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return [a1 URLWithString:];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__NSStringFromSenderState_(void *a1, const char *a2, ...)
{
  return [a1 _NSStringFromSenderState:];
}

id objc_msgSend__NSStringFromVolumeCategory_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_NSStringFromVolumeCategory:");
}

id objc_msgSend__aa_setRawPassword_(void *a1, const char *a2, ...)
{
  return [_aa_setRawPassword:];
}

id objc_msgSend__abortBackgroundDownload(void *a1, const char *a2, ...)
{
  return _[a1 _abortBackgroundDownload];
}

id objc_msgSend__acceptiCloudTermsWithAuthResults_completionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_acceptiCloudTermsWithAuthResults:completionHandler:")];
}

id objc_msgSend__activate(void *a1, const char *a2, ...)
{
  return _[a1 _activate];
}

id objc_msgSend__activateSenderUsingParameters_discoveryMode_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_activateSenderUsingParameters:discoveryMode:");
}

id objc_msgSend__addHMACComponent_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_addHMACComponent:error:");
}

id objc_msgSend__addOperationGroups_(void *a1, const char *a2, ...)
{
  return [a1 _addOperationGroups:];
}

id objc_msgSend__addOperations_(void *a1, const char *a2, ...)
{
  return [a1 _addOperations:];
}

id objc_msgSend__addStagedOperation_forRollback_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_addStagedOperation:forRollback:");
}

id objc_msgSend__addStagedOperations_forRollback_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_addStagedOperations:forRollback:");
}

id objc_msgSend__authenticateAccountWithContext_forService_completionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_authenticateAccountWithContext:forService:completionHandler:")
}

id objc_msgSend__buildAppComponentsNotInManifest_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_buildAppComponentsNotInManifest:");
}

id objc_msgSend__calculateFreeSpaceToReserve_(void *a1, const char *a2, ...)
{
  return [a1 _calculateFreeSpaceToReserve:];
}

id objc_msgSend__cancelAllOperations(void *a1, const char *a2, ...)
{
  return _[a1 _cancelAllOperations];
}

id objc_msgSend__cancelRemainingOperations(void *a1, const char *a2, ...)
{
  return _[a1 _cancelRemainingOperations];
}

id objc_msgSend__clearDataContainer_ofType_(void *a1, const char *a2, ...)
{
  return [a1 _clearDataContainer:ofType:];
}

id objc_msgSend__clearFactoryCache(void *a1, const char *a2, ...)
{
  return _[a1 _clearFactoryCache];
}

id objc_msgSend__cloneComponent(void *a1, const char *a2, ...)
{
  return _[a1 _cloneComponent];
}

id objc_msgSend__cloneOperations_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_cloneOperations:");
}

id objc_msgSend__coalesceDownloadRequestForFileWithSameHash_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_coalesceDownloadRequestForFileWithSameHash:");
}

id objc_msgSend__configureiCloudAccountFeatures_completionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_configureiCloudAccountFeatures:completionHandler:");
}

id objc_msgSend__constructMessageHandlerTable(void *a1, const char *a2, ...)
{
  return _[a1 _constructMessageHandlerTable];
}

id objc_msgSend__contentPlistPathForManifest_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_contentPlistPathForManifest:");
}

id objc_msgSend__createDispatchData(void *a1, const char *a2, ...)
{
  return _[a1 _createDispatchData];
}

id objc_msgSend__createFullIPAInstallOperationsAsFallback(void *a1, const char *a2, ...)
{
  return _[a1 _createFullIPAInstallOperationsAsFallback];
}

id objc_msgSend__createTempAppleAccountFromAuthResults_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_createTempAppleAccountFromAuthResults:");
}

id objc_msgSend__createUninstallOperationForContainer_ofType_containerPath_isContainerized_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_createUninstallOperationForContainer:ofType:containerPath:isContainerized:");
}

id objc_msgSend__dataUsingHexEncoding(void *a1, const char *a2, ...)
{
  return _[a1 _dataUsingHexEncoding];
}

id objc_msgSend__deactivate(void *a1, const char *a2, ...)
{
  return _[a1 _deactivate];
}

id objc_msgSend__defaultIncludedHeaders(void *a1, const char *a2, ...)
{
  return _[a1 _defaultIncludedHeaders];
}

id objc_msgSend__disableFindMyServiceUsingContext_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 _disableFindMyServiceUsingContext:x0 completionHandler:x1];
}

id objc_msgSend__dispatchComponent_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_dispatchComponent:");
}

id objc_msgSend__dispatchNextComponent(void *a1, const char *a2, ...)
{
  return _[a1 _dispatchNextComponent];
}

id objc_msgSend__dispatchOperationForExecution_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_dispatchOperationForExecution:)];
}

id objc_msgSend__dispatchRequest_(void *a1, const char *a2, ...)
{
  return [a1 _dispatchRequest:];
}

id objc_msgSend__downloadAppArchiveFile_ofHash_ofAppUID_currenntAppUID_toFolder_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_downloadAppArchiveFile:ofHash:ofAppUID:currenntAppUID:toFolder:");
}

id objc_msgSend__downloadContentFile_ofHash_toPath_completionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_downloadContentFile:ofHash:toPath:completionHandler:");
}

id objc_msgSend__downloadInstallableFile_ofHash_toPath_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_downloadInstallableFile:ofHash:toPath:");
}

id objc_msgSend__enableFindMyServiceAndSendLastLocation_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 _enableFindMyServiceAndSendLastLocation:x0 completionHandler:x1];
}

id objc_msgSend__endpoint(void *a1, const char *a2, ...)
{
  return _[a1 _endpoint];
}

id objc_msgSend__enforceFreeDiskSpaceRequirement(void *a1, const char *a2, ...)
{
  return _[a1 _enforceFreeDiskSpaceRequirement];
}

id objc_msgSend__ensureListenerRPClientStartedWithCompletion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_ensureListenerRPClientStartedWithCompletion:");
}

id objc_msgSend__ensureSenderRPClientStartedForDevice_withCompletion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_ensureSenderRPClientStartedForDevice:withCompletion:");
}

id objc_msgSend__estimateDiskSpaceRequirementFromOperations_(void *a1, const char *a2, ...)
{
  return [a1 _estimateDiskSpaceRequirementFromOperations:];
}

id objc_msgSend__extractRapportOptionsFromMessage_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_extractRapportOptionsFromMessage:");
}

id objc_msgSend__extractRapportPayloadFromMessage_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_extractRapportPayloadFromMessage:");
}

id objc_msgSend__feedNewRSSIReadingReceivedFromDevice_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_feedNewRSSIReadingReceivedFromDevice:");
}

id objc_msgSend__fetchCellularPlanItems(void *a1, const char *a2, ...)
{
  return _[a1 _fetchCellularPlanItems];
}

id objc_msgSend__fetchPairingSecretFromServer(void *a1, const char *a2, ...)
{
  return _[a1 _fetchPairingSecretFromServer];
}

id objc_msgSend__findMatchingMSDRapportDeviceForRPCompanionLinkDevice_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_findMatchingMSDRapportDeviceForRPCompanionLinkDevice:");
}

id objc_msgSend__findPairedPeerWithUUID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_findPairedPeerWithUUID:");
}

id objc_msgSend__findRouteDescriptorWithRouteUID_usingRouteDiscoverer_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_findRouteDescriptorWithRouteUID:usingRouteDiscoverer:");
}

id objc_msgSend__findRouteDescriptorWithUID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_findRouteDescriptorWithUID:");
}

id objc_msgSend__findSenderRPClientForDevice_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_findSenderRPClientForDevice:");
}

id objc_msgSend__finishDownloadRequest_withReponse_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_finishDownloadRequest:withReponse:");
}

id objc_msgSend__forceIDSToSyncWithServer(void *a1, const char *a2, ...)
{
  return _[a1 _forceIDSToSyncWithServer];
}

id objc_msgSend__forceiCloudKeychainToSyncWithServer(void *a1, const char *a2, ...)
{
  return _[a1 _forceiCloudKeychainToSyncWithServer];
}

id objc_msgSend__forceiCloudKeychainToSyncWithServerAndCompletion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_forceiCloudKeychainToSyncWithServerAndCompletion:");
}

id objc_msgSend__fulfillIXSZTransferPromise_withFile_outError_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_fulfillIXSZTransferPromise:withFile:outError:");
}

id objc_msgSend__getAllPairedPeers(void *a1, const char *a2, ...)
{
  return _[a1 _getAllPairedPeers];
}

id objc_msgSend__getCurrentProtocolVersion(void *a1, const char *a2, ...)
{
  return _[a1 _getCurrentProtocolVersion];
}

id objc_msgSend__getDeviceAddresses(void *a1, const char *a2, ...)
{
  return _[a1 _getDeviceAddresses];
}

id objc_msgSend__handleActiveOperationsDepleted(void *a1, const char *a2, ...)
{
  return _[a1 _handleActiveOperationsDepleted];
}

id objc_msgSend__handleCancelledOperation_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleCancelledOperation:");
}

id objc_msgSend__handleCloseRunningAppsRequest_from_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleCloseRunningAppsRequest:from:");
}

id objc_msgSend__handleCompleteComponent_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleCompleteComponent:");
}

id objc_msgSend__handleCompletionForDownloadRequest_withResponse_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleCompletionForDownloadRequest:withResponse:");
}

id objc_msgSend__handleDeviceCheckInOp_from_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleDeviceCheckInOp:from:");
}

id objc_msgSend__handleDiscoveryOfNewPeer_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleDiscoveryOfNewPeer:");
}

id objc_msgSend__handleFailedOperation_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleFailedOperation:");
}

id objc_msgSend__handleHidePasswordWithFlags_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleHidePasswordWithFlags:");
}

id objc_msgSend__handleInitializeDeviceSettingsOp_from_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleInitializeDeviceSettingsOp:from:");
}

id objc_msgSend__handleKVStoreResponse_(void *a1, const char *a2, ...)
{
  return [a1 _handleKVStoreResponse:];
}

id objc_msgSend__handleLocalDeviceUpdated(void *a1, const char *a2, ...)
{
  return _[a1 _handleLocalDeviceUpdated];
}

id objc_msgSend__handleLossOfExistingPeer_(void *a1, const char *a2, ...)
{
  return [a1 _handleLossOfExistingPeer:];
}

id objc_msgSend__handleMarkAsNotDemo_from_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleMarkAsNotDemo:from:");
}

id objc_msgSend__handlePasswordPromptWithFlags_throttleSeconds_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handlePasswordPromptWithFlags:throttleSeconds:");
}

id objc_msgSend__handleRPCompanionClientActivateCompletionWithError_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleRPCompanionClientActivateCompletionWithError:");
}

id objc_msgSend__handleRPCompanionLinkDeviceChanged_withChanges_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleRPCompanionLinkDeviceChanged:withChanges:");
}

id objc_msgSend__handleRPCompanionLinkDeviceFound_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleRPCompanionLinkDeviceFound:");
}

id objc_msgSend__handleRPCompanionLinkDeviceLost_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleRPCompanionLinkDeviceLost:");
}

id objc_msgSend__handleRefreshDeviceSettingsOp_from_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleRefreshDeviceSettingsOp:from:");
}

id objc_msgSend__handleRetryableOperation_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleRetryableOperation:");
}

id objc_msgSend__handleShowPassword_withFlags_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleShowPassword:withFlags:")];
}

id objc_msgSend__handleSkippedOperation_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleSkippedOperation:");
}

id objc_msgSend__handleStoreSearchOp_from_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleStoreSearchOp:from:");
}

id objc_msgSend__handleSuccessfulOperation_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleSuccessfulOperation:");
}

id objc_msgSend__handleUpdateDeviceEventMessage_fromPeer_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleUpdateDeviceEventMessage:fromPeer:");
}

id objc_msgSend__handleUpdateOfExistingPeer_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleUpdateOfExistingPeer:");
}

id objc_msgSend__handleWallpaperConfigChange(void *a1, const char *a2, ...)
{
  return _[a1 _handleWallpaperConfigChange];
}

id objc_msgSend__hanldeAuthCompletionWithError_(void *a1, const char *a2, ...)
{
  return [_hanldeAuthCompletionWithError:];
}

id objc_msgSend__initializeAVSystemControllerIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _initializeAVSystemControllerIfNeeded];
}

id objc_msgSend__invalidateListenerRPClient(void *a1, const char *a2, ...)
{
  return _[a1 _invalidateListenerRPClient];
}

id objc_msgSend__invalidateSenderRPClientForDevice_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_invalidateSenderRPClientForDevice:");
}

id objc_msgSend__isAirPlayStreaming(void *a1, const char *a2, ...)
{
  return _[a1 _isAirPlayStreaming];
}

id objc_msgSend__isAllowListedAccount_withAuthResults_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_isAllowListedAccount:withAuthResults:");
}

id objc_msgSend__isCurrentDeviceLanguage_andRegion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_isCurrentDeviceLanguage:andRegion:");
}

id objc_msgSend__kickOffContentUpdateForManifest_withOptions_error_(void *a1, const char *a2, ...)
{
  return [_kickOffContentUpdateForManifest:withOptions:error:];
}

id objc_msgSend__listenForIncomingEventMessageOfID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_listenForIncomingEventMessageOfID:");
}

id objc_msgSend__listenForIncomingRequestMessageOfID_(void *a1, const char *a2, ...)
{
  return [a1 _listenForIncomingRequestMessageOfID:];
}

id objc_msgSend__loadCachedManifestPaths(void *a1, const char *a2, ...)
{
  return _[a1 _loadCachedManifestPaths];
}

id objc_msgSend__lowercaseSet(void *a1, const char *a2, ...)
{
  return _[a1 _lowercaseSet];
}

id objc_msgSend__monitorRouteConfigUpdateForUUID_withCallback_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_monitorRouteConfigUpdateForUUID:withCallback:");
}

id objc_msgSend__parseTestScriptsFromXCTSpawnResultDictionary_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_parseTestScriptsFromXCTSpawnResultDictionary:");
}

id objc_msgSend__plugIn(void *a1, const char *a2, ...)
{
  return _[a1 _plugIn];
}

id objc_msgSend__postCompletionNotificationWithResult_andError_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_postCompletionNotificationWithResult:andError:");
}

id objc_msgSend__prepareDeviceInfoDictionaryForRequest_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_prepareDeviceInfoDictionaryForRequest:");
}

id objc_msgSend__queryThermalMitigationStatus(void *a1, const char *a2, ...)
{
  return _[a1 _queryThermalMitigationStatus];
}

id objc_msgSend__queueForOperation_(void *a1, const char *a2, ...)
{
  return [a1 _queueForOperation:];
}

id objc_msgSend__readPairedPeersIntoData(void *a1, const char *a2, ...)
{
  return _[a1 _readPairedPeersIntoData];
}

id objc_msgSend__resetWallpaperSettingsToFactoryDefault(void *a1, const char *a2, ...)
{
  return _[a1 _resetWallpaperSettingsToFactoryDefault];
}

id objc_msgSend__restorePairedPeersFromData_(void *a1, const char *a2, ...)
{
  return [a1 _restorePairedPeersFromData:];
}

id objc_msgSend__restoreStashedStagingToSecondaryStaging(void *a1, const char *a2, ...)
{
  return _[a1 _restoreStashedStagingToSecondaryStaging];
}

id objc_msgSend__retrieveContentRootPath(void *a1, const char *a2, ...)
{
  return _[a1 _retrieveContentRootPath];
}

id objc_msgSend__rollbackFinishedOperations(void *a1, const char *a2, ...)
{
  return _[a1 _rollbackFinishedOperations];
}

id objc_msgSend__saveDisplaySettings(void *a1, const char *a2, ...)
{
  return _[a1 _saveDisplaySettings];
}

id objc_msgSend__savePairedPeer_(void *a1, const char *a2, ...)
{
  return [a1 _savePairedPeer:];
}

id objc_msgSend__selectCachedManifestWithError_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_selectCachedManifestWithError:");
}

id objc_msgSend__sendDownloadStatusUpdateNotification(void *a1, const char *a2, ...)
{
  return _[a1 _sendDownloadStatusUpdateNotification];
}

id objc_msgSend__sendIDSRequestMessageOfType_withPayload_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_sendIDSRequestMessageOfType:withPayload:");
}

id objc_msgSend__sendOutgoingEventMessage_toDevice_withCompletion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_sendOutgoingEventMessage:toDevice:withCompletion:");
}

id objc_msgSend__sendOutgoingRequestMessage_toDevice_withCompletion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_sendOutgoingRequestMessage:toDevice:withCompletion:");
}

id objc_msgSend__sendRequestMessageOfID_andPayload_toPeerOfID_withCompletion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_sendRequestMessageOfID:andPayload:toPeerOfID:withCompletion:");
}

id objc_msgSend__setFlashTimer_(void *a1, const char *a2, ...)
{
  return [a1 _setFlashTimer:];
}

id objc_msgSend__setFlashlightLevel_(void *a1, const char *a2, ...)
{
  return [a1 _setFlashlightLevel:];
}

id objc_msgSend__setMasterKey_(void *a1, const char *a2, ...)
{
  return [a1 _setMasterKey:];
}

id objc_msgSend__setPassword_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_setPassword:");
}

id objc_msgSend__setQueue_(void *a1, const char *a2, ...)
{
  return [a1 _setQueue:];
}

id objc_msgSend__setupInterComponentDependencyOnRetry_(void *a1, const char *a2, ...)
{
  return [a1 _setupInterComponentDependencyOnRetry:];
}

id objc_msgSend__setupPairingManagerIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _setupPairingManagerIfNeeded];
}

id objc_msgSend__setupiCloudAccountWithSettings_outError_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_setupiCloudAccountWithSettings:outError:");
}

id objc_msgSend__setupiTunesAccountWithSettings_outError_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_setupiTunesAccountWithSettings:outError:");
}

id objc_msgSend__signInToAppleIDWithContext_forServices_usingAuthResults_completionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_signInToAppleIDWithContext:forServices:usingAuthResults:completionHandler:");
}

id objc_msgSend__signIniCloudAccount_password_features_recoveryKey_resetCDP_outError_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_signIniCloudAccount:password:features:recoveryKey:resetCDP:outError:");
}

id objc_msgSend__signIniTunesAccount_password_outError_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_signIniTunesAccount:password:outError:");
}

id objc_msgSend__signOutAppleIDForServices_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 _signOutAppleIDForServices:x0 completionHandler:x1];
}

id objc_msgSend__signOutiCloudAccountWithPassword_outError_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_signOutiCloudAccountWithPassword:outError:");
}

id objc_msgSend__signOutiTunesAccount_(void *a1, const char *a2, ...)
{
  return [a1 _signOutiTunesAccount:];
}

id objc_msgSend__signedManifestMinimumOSVersionCheck_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_signedManifestMinimumOSVersionCheck:error:");
}

id objc_msgSend__stageContentPlistForManifest_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_stageContentPlistForManifest:");
}

id objc_msgSend__start(void *a1, const char *a2, ...)
{
  return _[a1 _start];
}

id objc_msgSend__startAWDLDiscoveryUsingBonjour_(void *a1, const char *a2, ...)
{
  return [a1 _startAWDLDiscoveryUsingBonjour:];
}

id objc_msgSend__startFlash(void *a1, const char *a2, ...)
{
  return _[a1 _startFlash];
}

id objc_msgSend__startPosterConfigChangeMonitor(void *a1, const char *a2, ...)
{
  return _[a1 _startPosterConfigChangeMonitor];
}

id objc_msgSend__startProcessingComponentsOnRetry_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_startProcessingComponentsOnRetry:");
}

id objc_msgSend__startTimeoutTimer(void *a1, const char *a2, ...)
{
  return _[a1 _startTimeoutTimer];
}

id objc_msgSend__stop(void *a1, const char *a2, ...)
{
  return _[a1 _stop];
}

id objc_msgSend__stopAWDLDiscovery(void *a1, const char *a2, ...)
{
  return _[a1 _stopAWDLDiscovery];
}

id objc_msgSend__stopActivation(void *a1, const char *a2, ...)
{
  return _[a1 _stopActivation];
}

id objc_msgSend__stopFlash_(void *a1, const char *a2, ...)
{
  return [a1 _stopFlash:];
}

id objc_msgSend__stringForHMAC(void *a1, const char *a2, ...)
{
  return _[a1 _stringForHMAC];
}

id objc_msgSend__systemLocalizedLanguageCodeFromArray_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_systemLocalizedLanguageCodeFromArray:");
}

id objc_msgSend__testProductsPath(void *a1, const char *a2, ...)
{
  return _[a1 _testProductsPath];
}

id objc_msgSend__timingData(void *a1, const char *a2, ...)
{
  return _[a1 _timingData];
}

id objc_msgSend__trySetupAccounts_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_trySetupAccounts:");
}

id objc_msgSend__turnPowerOn(void *a1, const char *a2, ...)
{
  return _[a1 _turnPowerOn];
}

id objc_msgSend__updateLocale(void *a1, const char *a2, ...)
{
  return _[a1 _updateLocale];
}

id objc_msgSend__updateSyncStatusFromSyncSession_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_updateSyncStatusFromSyncSession:");
}

id objc_msgSend__uploadPairingPassword(void *a1, const char *a2, ...)
{
  return _[a1 _uploadPairingPassword];
}

id objc_msgSend__waitForIDSOperationToQuiesceForAccount_forSignOut_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_waitForIDSOperationToQuiesceForAccount:forSignOut:");
}

id objc_msgSend_aa_appleAccountType(void *a1, const char *a2, ...)
{
  return [a1 aa_appleAccountType];
}

id objc_msgSend_aa_isAASignInErrorWithCode_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "aa_isAASignInErrorWithCode:");
}

id objc_msgSend_aa_setPassword_(void *a1, const char *a2, ...)
{
  return [a1 aa_setPassword:];
}

id objc_msgSend_abortProcessing(void *a1, const char *a2, ...)
{
  return _[a1 abortProcessing];
}

id objc_msgSend_aboutToReboot(void *a1, const char *a2, ...)
{
  return _[a1 aboutToReboot];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _[a1 absoluteString];
}

id objc_msgSend_absoluteTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 absoluteTimestamp];
}

id objc_msgSend_accessControlListWithPath_(void *a1, const char *a2, ...)
{
  return [a1 accessControlListWithPath:];
}

id objc_msgSend_accountForService_(void *a1, const char *a2, ...)
{
  return [a1 accountForService:];
}

id objc_msgSend_accountManagerHelper(void *a1, const char *a2, ...)
{
  return _[a1 accountManagerHelper];
}

id objc_msgSend_accountSettings(void *a1, const char *a2, ...)
{
  return _[a1 accountSettings];
}

id objc_msgSend_accountStore(void *a1, const char *a2, ...)
{
  return _[a1 accountStore];
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return _[a1 accounts];
}

id objc_msgSend_ack_(void *a1, const char *a2, ...)
{
  return [a1 ack:];
}

id objc_msgSend_acquireAppTerminationAssertionForApp_(void *a1, const char *a2, ...)
{
  return [a1 acquireAppTerminationAssertionForApp:];
}

id objc_msgSend_acquireDeviceKeybagAssertionIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 acquireDeviceKeybagAssertionIfNeeded];
}

id objc_msgSend_acquireWithError_(void *a1, const char *a2, ...)
{
  return [a1 acquireWithError:];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return _[a1 activate];
}

id objc_msgSend_activateFullScreenUIAppMonitor(void *a1, const char *a2, ...)
{
  return _[a1 activateFullScreenUIAppMonitor];
}

id objc_msgSend_activateSenderUsingParametersData_discoveryMode_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "activateSenderUsingParametersData:discoveryMode:");
}

id objc_msgSend_activateStagedOperations(void *a1, const char *a2, ...)
{
  return _[a1 activateStagedOperations];
}

id objc_msgSend_activateWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 activateWithCompletion:];
}

id objc_msgSend_activateWithConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 activateWithConfiguration:];
}

id objc_msgSend_activateWithContext_(void *a1, const char *a2, ...)
{
  return [a1 activateWithContext:];
}

id objc_msgSend_activated(void *a1, const char *a2, ...)
{
  return _[a1 activated];
}

id objc_msgSend_activationConfigurationFlags(void *a1, const char *a2, ...)
{
  return _[a1 activationConfigurationFlags];
}

id objc_msgSend_active(void *a1, const char *a2, ...)
{
  return _[a1 active];
}

id objc_msgSend_activeComponents(void *a1, const char *a2, ...)
{
  return _[a1 activeComponents];
}

id objc_msgSend_activeDevices(void *a1, const char *a2, ...)
{
  return _[a1 activeDevices];
}

id objc_msgSend_activeOperations(void *a1, const char *a2, ...)
{
  return _[a1 activeOperations];
}

id objc_msgSend_addAppDiffPatchFile_sourceAppUID_targetAppUID_(void *a1, const char *a2, ...)
{
  return [a1 addAppDiffPatchFile:x0 sourceAppUID:x1 targetAppUID:x2];
}

id objc_msgSend_addAuthHeader(void *a1, const char *a2, ...)
{
  return _[a1 addAuthHeader];
}

id objc_msgSend_addAuthenticationHeadersToRequest_includedHeaders_body_algorithm_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "addAuthenticationHeadersToRequest:includedHeaders:body:algorithm:error:");
}

id objc_msgSend_addBAAAuthenticationHeadersToRequest_withBody_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "addBAAAuthenticationHeadersToRequest:withBody:error:");
}

id objc_msgSend_addBundleSpecificCompoments_(void *a1, const char *a2, ...)
{
  return [a1 addBundleSpecificCompoments:];
}

id objc_msgSend_addCheckpointBarrier_(void *a1, const char *a2, ...)
{
  return [a1 addCheckpointBarrier:];
}

id objc_msgSend_addDelegate_queue_(void *a1, const char *a2, ...)
{
  return [a1 addDelegate:queue:];
}

id objc_msgSend_addDependency_(void *a1, const char *a2, ...)
{
  return [a1 addDependency:];
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return [a1 addEntriesFromDictionary:];
}

id objc_msgSend_addInstallDependency_(void *a1, const char *a2, ...)
{
  return [a1 addInstallDependency:];
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
  return [a1 addObserver:x0 selector:x1 name:x2 object:x3];
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return [a1 addObserverForName:object:queue:usingBlock:];
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return [a1 addOperation:];
}

id objc_msgSend_addRemoveOperations_(void *a1, const char *a2, ...)
{
  return [a1 addRemoveOperations:];
}

id objc_msgSend_addRouteToSystemMusicForSpeaker(void *a1, const char *a2, ...)
{
  return _[a1 addRouteToSystemMusicForSpeaker];
}

id objc_msgSend_addSessionTask_(void *a1, const char *a2, ...)
{
  return [a1 addSessionTask:];
}

id objc_msgSend_addTimer_forMode_(void *a1, const char *a2, ...)
{
  return [a1 addTimer:forMode:];
}

id objc_msgSend_addToBundleUpdateTime_(void *a1, const char *a2, ...)
{
  return [a1 addToBundleUpdateTime:];
}

id objc_msgSend_addValue_forHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return [a1 addValue:forHTTPHeaderField:];
}

id objc_msgSend_advertisementFields(void *a1, const char *a2, ...)
{
  return _[a1 advertisementFields];
}

id objc_msgSend_advertiserDidHidePairingPassword(void *a1, const char *a2, ...)
{
  return _[a1 advertiserDidHidePairingPassword];
}

id objc_msgSend_advertiserDidShowPairingPassword_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "advertiserDidShowPairingPassword:");
}

id objc_msgSend_advertiserDidUpdateLocalDevicePublicIDFrom_to_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "advertiserDidUpdateLocalDevicePublicIDFrom:to:");
}

id objc_msgSend_agreeURL(void *a1, const char *a2, ...)
{
  return _[a1 agreeURL];
}

id objc_msgSend_airDropMode(void *a1, const char *a2, ...)
{
  return _[a1 airDropMode];
}

id objc_msgSend_airplaneMode(void *a1, const char *a2, ...)
{
  return _[a1 airplaneMode];
}

id objc_msgSend_ak_redactedCopy(void *a1, const char *a2, ...)
{
  return [a1 ak_redactedCopy];
}

id objc_msgSend_allApplications(void *a1, const char *a2, ...)
{
  return _[a1 allApplications];
}

id objc_msgSend_allDependentOperations(void *a1, const char *a2, ...)
{
  return _[a1 allDependentOperations];
}

id objc_msgSend_allHTTPHeaderFields(void *a1, const char *a2, ...)
{
  return _[a1 allHTTPHeaderFields];
}

id objc_msgSend_allHeaderFields(void *a1, const char *a2, ...)
{
  return _[a1 allHeaderFields];
}

id objc_msgSend_allHomeScreenApplicationBundleIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 allHomeScreenApplicationBundleIdentifiers];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allOperations(void *a1, const char *a2, ...)
{
  return _[a1 allOperations];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return [a1 allocWithZone:];
}

id objc_msgSend_allocateRequest_forSession_(void *a1, const char *a2, ...)
{
  return [a1 allocateRequest:forSession:];
}

id objc_msgSend_allowAccountSetup(void *a1, const char *a2, ...)
{
  return _[a1 allowAccountSetup];
}

id objc_msgSend_allowCancel(void *a1, const char *a2, ...)
{
  return _[a1 allowCancel];
}

id objc_msgSend_allowEnteringDemoMode(void *a1, const char *a2, ...)
{
  return _[a1 allowEnteringDemoMode];
}

id objc_msgSend_allowSnapshotMode(void *a1, const char *a2, ...)
{
  return _[a1 allowSnapshotMode];
}

id objc_msgSend_allowSnapshotRevertTimer(void *a1, const char *a2, ...)
{
  return _[a1 allowSnapshotRevertTimer];
}

id objc_msgSend_allowedISTSignedComponents(void *a1, const char *a2, ...)
{
  return _[a1 allowedISTSignedComponents];
}

id objc_msgSend_allowedSymLinks(void *a1, const char *a2, ...)
{
  return _[a1 allowedSymLinks];
}

id objc_msgSend_alreadyHaveList(void *a1, const char *a2, ...)
{
  return _[a1 alreadyHaveList];
}

id objc_msgSend_alreadyInstalled(void *a1, const char *a2, ...)
{
  return _[a1 alreadyInstalled];
}

id objc_msgSend_alternateDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 alternateDescriptor];
}

id objc_msgSend_annotated_(void *a1, const char *a2, ...)
{
  return [a1 annotated:];
}

id objc_msgSend_anonymousListener(void *a1, const char *a2, ...)
{
  return _[a1 anonymousListener];
}

id objc_msgSend_appDiffPatchFileForSourceAppUID_targetAppUID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "appDiffPatchFileForSourceAppUID:targetAppUID:");
}

id objc_msgSend_appID(void *a1, const char *a2, ...)
{
  return _[a1 appID];
}

id objc_msgSend_appIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 appIdentifier];
}

id objc_msgSend_appInstallationInProgress(void *a1, const char *a2, ...)
{
  return _[a1 appInstallationInProgress];
}

id objc_msgSend_appItemToDefer(void *a1, const char *a2, ...)
{
  return _[a1 appItemToDefer];
}

id objc_msgSend_appPatches(void *a1, const char *a2, ...)
{
  return _[a1 appPatches];
}

id objc_msgSend_appPatchesListFileURL(void *a1, const char *a2, ...)
{
  return _[a1 appPatchesListFileURL];
}

id objc_msgSend_appState(void *a1, const char *a2, ...)
{
  return _[a1 appState];
}

id objc_msgSend_appWithPath_(void *a1, const char *a2, ...)
{
  return [a1 appWithPath:];
}

id objc_msgSend_appendBytes_length_(void *a1, const char *a2, ...)
{
  return [a1 appendBytes:length:];
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return [a1 appendData:];
}

id objc_msgSend_appendDownloadedFileSize_(void *a1, const char *a2, ...)
{
  return [a1 appendDownloadedFileSize:];
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return [a1 appendFormat:];
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return [a1 appendString:];
}

id objc_msgSend_applePKI(void *a1, const char *a2, ...)
{
  return _[a1 applePKI];
}

id objc_msgSend_applicationIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 applicationIdentifier];
}

id objc_msgSend_applicationProxyForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 applicationProxyForIdentifier:];
}

id objc_msgSend_applicationRegistration(void *a1, const char *a2, ...)
{
  return _[a1 applicationRegistration];
}

id objc_msgSend_applicationType(void *a1, const char *a2, ...)
{
  return _[a1 applicationType];
}

id objc_msgSend_applyDownloadPolicy_(void *a1, const char *a2, ...)
{
  return [a1 applyDownloadPolicy:];
}

id objc_msgSend_applyRestrictionDictionary_clientType_clientUUID_localizedClientDescription_localizedWarningMessage_outRestrictionChanged_outEffectiveSettingsChanged_outError_(void *a1, const char *a2, ...)
{
  return [a1 applyRestrictionDictionary:x0 clientType:x1 clientUUID:x2 localizedClientDescription:x3 localizedWarningMessage:x4 outRestrictionChanged:x5 outEffectiveSettingsChanged:x6 outError:x7];
}

id objc_msgSend_appsPrefixForManifestVersion_(void *a1, const char *a2, ...)
{
  return [a1 appsPrefixForManifestVersion:];
}

id objc_msgSend_apsConnection(void *a1, const char *a2, ...)
{
  return _[a1 apsConnection];
}

id objc_msgSend_apsToken(void *a1, const char *a2, ...)
{
  return _[a1 apsToken];
}

id objc_msgSend_archiveAndEncryptKeychainItems_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "archiveAndEncryptKeychainItems:");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return [a1 archivedDataWithRootObject:x0 requiringSecureCoding:x1 error:x2];
}

id objc_msgSend_arguments(void *a1, const char *a2, ...)
{
  return _[a1 arguments];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 arrayByAddingObjectsFromArray:];
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithArray:];
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithCapacity:];
}

id objc_msgSend_arrayWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithContentsOfFile:];
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
  return [a1 arrayWithObjects:];
}

id objc_msgSend_arrayWithXPCArray_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithXPCArray:x0];
}

id objc_msgSend_askFindMyHubForHubInfo_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "askFindMyHubForHubInfo:");
}

id objc_msgSend_associateWithComponent_(void *a1, const char *a2, ...)
{
  return [a1 associateWithComponent:];
}

id objc_msgSend_associateWithParameters_error_(void *a1, const char *a2, ...)
{
  return [a1 associateWithParameters:error:];
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "attributesOfItemAtPath:error:")];
}

id objc_msgSend_authenticate_forTask_completion_(void *a1, const char *a2, ...)
{
  return [a1 authenticate:forTask:completion:];
}

id objc_msgSend_authenticateWithContext_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "authenticateWithContext:completion:");
}

id objc_msgSend_authenticated(void *a1, const char *a2, ...)
{
  return _[a1 authenticated];
}

id objc_msgSend_authenticationMethod(void *a1, const char *a2, ...)
{
  return _[a1 authenticationMethod];
}

id objc_msgSend_authorizationStatusForBundleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 authorizationStatusForBundleIdentifier:];
}

id objc_msgSend_autoFillCDNRequest_(void *a1, const char *a2, ...)
{
  return [a1 autoFillCDNRequest:];
}

id objc_msgSend_autoFillCommandRequest_(void *a1, const char *a2, ...)
{
  return [a1 autoFillCommandRequest:];
}

id objc_msgSend_autoFillRequest_(void *a1, const char *a2, ...)
{
  return [a1 autoFillRequest:];
}

id objc_msgSend_automatedDeviceGroup(void *a1, const char *a2, ...)
{
  return _[a1 automatedDeviceGroup];
}

id objc_msgSend_avDiscoverySession(void *a1, const char *a2, ...)
{
  return _[a1 avDiscoverySession];
}

id objc_msgSend_avOutputContext(void *a1, const char *a2, ...)
{
  return _[a1 avOutputContext];
}

id objc_msgSend_avSystemController(void *a1, const char *a2, ...)
{
  return _[a1 avSystemController];
}

id objc_msgSend_available(void *a1, const char *a2, ...)
{
  return _[a1 available];
}

id objc_msgSend_avgRTT(void *a1, const char *a2, ...)
{
  return _[a1 avgRTT];
}

id objc_msgSend_backToVirgin_(void *a1, const char *a2, ...)
{
  return [a1 backToVirgin:];
}

id objc_msgSend_backgroundBundle(void *a1, const char *a2, ...)
{
  return _[a1 backgroundBundle];
}

id objc_msgSend_backgroundDownloadActive(void *a1, const char *a2, ...)
{
  return _[a1 backgroundDownloadActive];
}

id objc_msgSend_backgroundDownloadQueue(void *a1, const char *a2, ...)
{
  return _[a1 backgroundDownloadQueue];
}

id objc_msgSend_backgroundDownloadState(void *a1, const char *a2, ...)
{
  return _[a1 backgroundDownloadState];
}

id objc_msgSend_backlightStatus(void *a1, const char *a2, ...)
{
  return _[a1 backlightStatus];
}

id objc_msgSend_bail_error_(void *a1, const char *a2, ...)
{
  return [a1 bail:error];
}

id objc_msgSend_bailOnStashedStagingRestoreFailure(void *a1, const char *a2, ...)
{
  return _[a1 bailOnStashedStagingRestoreFailure];
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 base64EncodedStringWithOptions:];
}

id objc_msgSend_batteryCapacity(void *a1, const char *a2, ...)
{
  return _[a1 batteryCapacity];
}

id objc_msgSend_batteryExternalConnectedKey(void *a1, const char *a2, ...)
{
  return _[a1 batteryExternalConnectedKey];
}

id objc_msgSend_beginExtensionRequestWithInputItems_completion_(void *a1, const char *a2, ...)
{
  return [a1 beginExtensionRequestWithInputItems:];
}

id objc_msgSend_bgDownloadPauseReason(void *a1, const char *a2, ...)
{
  return _[a1 bgDownloadPauseReason];
}

id objc_msgSend_bgDownloadPauseStartTime(void *a1, const char *a2, ...)
{
  return _[a1 bgDownloadPauseStartTime];
}

id objc_msgSend_blackListedPaths(void *a1, const char *a2, ...)
{
  return _[a1 blackListedPaths];
}

id objc_msgSend_bleDevice(void *a1, const char *a2, ...)
{
  return _[a1 bleDevice];
}

id objc_msgSend_blocklistedItems(void *a1, const char *a2, ...)
{
  return _[a1 blocklistedItems];
}

id objc_msgSend_bonjourBrowser(void *a1, const char *a2, ...)
{
  return _[a1 bonjourBrowser];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bootstrap(void *a1, const char *a2, ...)
{
  return _[a1 bootstrap];
}

id objc_msgSend_brightnessClient(void *a1, const char *a2, ...)
{
  return _[a1 brightnessClient];
}

id objc_msgSend_broadcast(void *a1, const char *a2, ...)
{
  return _[a1 broadcast];
}

id objc_msgSend_buddyCompletionHandler(void *a1, const char *a2, ...)
{
  return _[a1 buddyCompletionHandler];
}

id objc_msgSend_buddyCompletionHandlerLock(void *a1, const char *a2, ...)
{
  return _[a1 buddyCompletionHandlerLock];
}

id objc_msgSend_buildAppDataOperationsWithIdentifier_andDependencies_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "buildAppDataOperationsWithIdentifier:andDependencies:");
}

id objc_msgSend_buildAppOperationsWithIdentifier_shouldDeferApp_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "buildAppOperationsWithIdentifier:shouldDeferApp:");
}

id objc_msgSend_buildAppRemovalOperationsWithIdentifier_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "buildAppRemovalOperationsWithIdentifier:");
}

id objc_msgSend_buildBackupOperationsWithPath_andIndex_(void *a1, const char *a2, ...)
{
  return [a1 buildBackupOperationsWithPath:andIndex:];
}

id objc_msgSend_buildComponentsFromManifest(void *a1, const char *a2, ...)
{
  return _[a1 buildComponentsFromManifest];
}

id objc_msgSend_buildComponentsNotInManifest(void *a1, const char *a2, ...)
{
  return _[a1 buildComponentsNotInManifest];
}

id objc_msgSend_buildConfigurationProfileOperationsWithIdentifier_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "buildConfigurationProfileOperationsWithIdentifier:");
}

id objc_msgSend_buildLocalURLListFromContext_(void *a1, const char *a2, ...)
{
  return [a1 buildLocalURLListFromContext:];
}

id objc_msgSend_buildProvisioningProfileOperations_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "buildProvisioningProfileOperations:");
}

id objc_msgSend_buildSettingsOperationWithIdentifier_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "buildSettingsOperationWithIdentifier:");
}

id objc_msgSend_buildSystemAppOperationsWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 buildSystemAppOperationsWithIdentifier:];
}

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return _[a1 bundle];
}

id objc_msgSend_bundleDownloadInProgress(void *a1, const char *a2, ...)
{
  return _[a1 bundleDownloadInProgress];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return _[a1 bundleID];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundleInProgress(void *a1, const char *a2, ...)
{
  return _[a1 bundleInProgress];
}

id objc_msgSend_bundleInfo(void *a1, const char *a2, ...)
{
  return _[a1 bundleInfo];
}

id objc_msgSend_bundleLocalizedNameForInstalledApp_(void *a1, const char *a2, ...)
{
  return [a1 bundleLocalizedNameForInstalledApp];
}

id objc_msgSend_bundlePathForInstalledApp_(void *a1, const char *a2, ...)
{
  return [a1 bundlePathForInstalledApp:];
}

id objc_msgSend_bundleState(void *a1, const char *a2, ...)
{
  return _[a1 bundleState];
}

id objc_msgSend_bundleTimerInfo(void *a1, const char *a2, ...)
{
  return _[a1 bundleTimerInfo];
}

id objc_msgSend_bundleType(void *a1, const char *a2, ...)
{
  return _[a1 bundleType];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return _[a1 bundleURL];
}

id objc_msgSend_bundleWithPath_(void *a1, const char *a2, ...)
{
  return [a1 bundleWithPath:];
}

id objc_msgSend_busy(void *a1, const char *a2, ...)
{
  return _[a1 busy];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return [a1 cStringUsingEncoding:];
}

id objc_msgSend_caLogsUploadInterval(void *a1, const char *a2, ...)
{
  return _[a1 caLogsUploadInterval];
}

id objc_msgSend_caLogsUploadTimer(void *a1, const char *a2, ...)
{
  return _[a1 caLogsUploadTimer];
}

id objc_msgSend_cache(void *a1, const char *a2, ...)
{
  return _[a1 cache];
}

id objc_msgSend_cachedBundleInstallAttempted(void *a1, const char *a2, ...)
{
  return _[a1 cachedBundleInstallAttempted];
}

id objc_msgSend_cachedBundleInstallState(void *a1, const char *a2, ...)
{
  return _[a1 cachedBundleInstallState];
}

id objc_msgSend_cachedFDC(void *a1, const char *a2, ...)
{
  return _[a1 cachedFDC];
}

id objc_msgSend_cachedLocalURL(void *a1, const char *a2, ...)
{
  return _[a1 cachedLocalURL];
}

id objc_msgSend_cachingHubAvailable(void *a1, const char *a2, ...)
{
  return _[a1 cachingHubAvailable];
}

id objc_msgSend_cachingHubRequest(void *a1, const char *a2, ...)
{
  return _[a1 cachingHubRequest];
}

id objc_msgSend_cachingHubRetryInterval(void *a1, const char *a2, ...)
{
  return _[a1 cachingHubRetryInterval];
}

id objc_msgSend_canLockSnapshot(void *a1, const char *a2, ...)
{
  return _[a1 canLockSnapshot];
}

id objc_msgSend_canPassCheckpoint(void *a1, const char *a2, ...)
{
  return _[a1 canPassCheckpoint];
}

id objc_msgSend_canRevertSnapshot(void *a1, const char *a2, ...)
{
  return _[a1 canRevertSnapshot];
}

id objc_msgSend_canRunCleanUpForBetterTogetherDevice(void *a1, const char *a2, ...)
{
  return _[a1 canRunCleanUpForBetterTogetherDevice];
}

id objc_msgSend_canStartAccountContentUpdate(void *a1, const char *a2, ...)
{
  return _[a1 canStartAccountContentUpdate];
}

id objc_msgSend_canStartBackgroundDownload(void *a1, const char *a2, ...)
{
  return _[a1 canStartBackgroundDownload];
}

id objc_msgSend_canStartContentUpdate(void *a1, const char *a2, ...)
{
  return _[a1 canStartContentUpdate];
}

id objc_msgSend_canStartOSUpdate(void *a1, const char *a2, ...)
{
  return _[a1 canStartOSUpdate];
}

id objc_msgSend_canStopBackgroundDownload(void *a1, const char *a2, ...)
{
  return _[a1 canStopBackgroundDownload];
}

id objc_msgSend_canUnenrollWithObliteration_consultDeviceOptions_(void *a1, const char *a2, ...)
{
  return [a1 canUnenrollWithObliteration:consultDeviceOptions:];
}

id objc_msgSend_canUnlockSnapshot(void *a1, const char *a2, ...)
{
  return _[a1 canUnlockSnapshot];
}

id objc_msgSend_canUpdateContent(void *a1, const char *a2, ...)
{
  return _[a1 canUpdateContent];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _[a1 cancel];
}

id objc_msgSend_cancelAllOperations(void *a1, const char *a2, ...)
{
  return _[a1 cancelAllOperations];
}

id objc_msgSend_cancelAndRemoveAllSessionTask(void *a1, const char *a2, ...)
{
  return _[a1 cancelAndRemoveAllSessionTask];
}

id objc_msgSend_cancelDemoContentUpdate(void *a1, const char *a2, ...)
{
  return _[a1 cancelDemoContentUpdate];
}

id objc_msgSend_cancelDownload_(void *a1, const char *a2, ...)
{
  return [a1 cancelDownload];
}

id objc_msgSend_cancelExtensionRequestWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 cancelExtensionRequestWithIdentifier:];
}

id objc_msgSend_cancelForReason_client_completion_(void *a1, const char *a2, ...)
{
  return [a1 cancelForReason:client:completion:];
}

id objc_msgSend_cancelNotifyToken_(void *a1, const char *a2, ...)
{
  return [a1 cancelNotifyToken:];
}

id objc_msgSend_cancelOfflineModeEnrollmentRetry(void *a1, const char *a2, ...)
{
  return _[a1 cancelOfflineModeEnrollmentRetry];
}

id objc_msgSend_cancelOperation(void *a1, const char *a2, ...)
{
  return _[a1 cancelOperation];
}

id objc_msgSend_canceled(void *a1, const char *a2, ...)
{
  return _[a1 canceled];
}

id objc_msgSend_canceledByUser(void *a1, const char *a2, ...)
{
  return _[a1 canceledByUser];
}

id objc_msgSend_carrierName(void *a1, const char *a2, ...)
{
  return _[a1 carrierName];
}

id objc_msgSend_cdpContext(void *a1, const char *a2, ...)
{
  return _[a1 cdpContext];
}

id objc_msgSend_cdpController(void *a1, const char *a2, ...)
{
  return _[a1 cdpController];
}

id objc_msgSend_cellularCapable(void *a1, const char *a2, ...)
{
  return _[a1 cellularCapable];
}

id objc_msgSend_cellularInfo(void *a1, const char *a2, ...)
{
  return _[a1 cellularInfo];
}

id objc_msgSend_cellularPlanDidChange_(void *a1, const char *a2, ...)
{
  return [a1 cellularPlanDidChange:];
}

id objc_msgSend_cellularQueue(void *a1, const char *a2, ...)
{
  return _[a1 cellularQueue];
}

id objc_msgSend_cellularSlotsInfo(void *a1, const char *a2, ...)
{
  return _[a1 cellularSlotsInfo];
}

id objc_msgSend_certificateHash(void *a1, const char *a2, ...)
{
  return _[a1 certificateHash];
}

id objc_msgSend_certificatesEncodeToBase64_status_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "certificatesEncodeToBase64:status:");
}

id objc_msgSend_changePasscodeFrom_to_outError_(void *a1, const char *a2, ...)
{
  return [a1 changePasscodeFrom:a2 to:a3 outError:a4];
}

id objc_msgSend_changeWiFiSettingsOnPeer_newSettings_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 changeWiFiSettingsOnPeer:newSettings:withCompletion:];
}

id objc_msgSend_changed(void *a1, const char *a2, ...)
{
  return _[a1 changed];
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 characterAtIndex:];
}

id objc_msgSend_checkAvailabilityWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 checkAvailabilityWithCompletion:];
}

id objc_msgSend_checkEntitlementsWithRequest_from_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "checkEntitlementsWithRequest:from:");
}

id objc_msgSend_checkFileForEntitlements_forCorrespondingManifestEntry_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "checkFileForEntitlements:forCorrespondingManifestEntry:");
}

id objc_msgSend_checkFile_WatchAndTV_withMetaData_(void *a1, const char *a2, ...)
{
  return [a1 checkFile_WatchAndTV:withMetaData:];
}

id objc_msgSend_checkFile_iOS_withMetaData_(void *a1, const char *a2, ...)
{
  return [a1 checkFile_iOS:withMetaData:];
}

id objc_msgSend_checkFile_macOS_withMetaData_(void *a1, const char *a2, ...)
{
  return [a1 checkFile_macOS:withMetaData:];
}

id objc_msgSend_checkIfAllCriticalComponentsTried(void *a1, const char *a2, ...)
{
  return _[a1 checkIfAllCriticalComponentsTried];
}

id objc_msgSend_checkIn_(void *a1, const char *a2, ...)
{
  return [a1 checkIn:];
}

id objc_msgSend_checkInWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 checkInWithCompletion:];
}

id objc_msgSend_checkManifest_(void *a1, const char *a2, ...)
{
  return [a1 checkManifest:];
}

id objc_msgSend_checkPlatformTypeForAllComponents(void *a1, const char *a2, ...)
{
  return _[a1 checkPlatformTypeForAllComponents];
}

id objc_msgSend_checkResourceIsReachableAndReturnError_(void *a1, const char *a2, ...)
{
  return [a1 checkResourceIsReachableAndReturnError:];
}

id objc_msgSend_checkType(void *a1, const char *a2, ...)
{
  return _[a1 checkType];
}

id objc_msgSend_checkWithTimeKeeper_(void *a1, const char *a2, ...)
{
  return [a1 checkWithTimeKeeper:];
}

id objc_msgSend_checker(void *a1, const char *a2, ...)
{
  return _[a1 checker];
}

id objc_msgSend_checkpointBarrier(void *a1, const char *a2, ...)
{
  return _[a1 checkpointBarrier];
}

id objc_msgSend_cleanUpBackgroundState_(void *a1, const char *a2, ...)
{
  return [a1 cleanUpBackgroundState:];
}

id objc_msgSend_cleanUpPreferencesFile(void *a1, const char *a2, ...)
{
  return _[a1 cleanUpPreferencesFile];
}

id objc_msgSend_cleanup(void *a1, const char *a2, ...)
{
  return _[a1 cleanup];
}

id objc_msgSend_cleanupDummyPreferenceFile(void *a1, const char *a2, ...)
{
  return _[a1 cleanupDummyPreferenceFile];
}

id objc_msgSend_clearAppSwitcherForDemoMode(void *a1, const char *a2, ...)
{
  return _[a1 clearAppSwitcherForDemoMode];
}

id objc_msgSend_clearCache(void *a1, const char *a2, ...)
{
  return _[a1 clearCache];
}

id objc_msgSend_clearCacheExceptFileHashes_(void *a1, const char *a2, ...)
{
  return [a1 clearCacheExceptFileHashes:];
}

id objc_msgSend_clearCurrentiOSBuild(void *a1, const char *a2, ...)
{
  return _[a1 clearCurrentiOSBuild];
}

id objc_msgSend_clearDemoLogUploadRequest(void *a1, const char *a2, ...)
{
  return _[a1 clearDemoLogUploadRequest];
}

id objc_msgSend_clearMinOSVersionAvailable(void *a1, const char *a2, ...)
{
  return _[a1 clearMinOSVersionAvailable];
}

id objc_msgSend_clearOSUpdateRequest(void *a1, const char *a2, ...)
{
  return _[a1 clearOSUpdateRequest];
}

id objc_msgSend_clearSafariHistory(void *a1, const char *a2, ...)
{
  return _[a1 clearSafariHistory];
}

id objc_msgSend_clearStagedDeviceAfterUpdateProcess(void *a1, const char *a2, ...)
{
  return _[a1 clearStagedDeviceAfterUpdateProcess];
}

id objc_msgSend_clearUpF200FootprintIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 clearUpF200FootprintIfNeeded];
}

id objc_msgSend_clearUpNvramIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 clearUpNvramIfNeeded];
}

id objc_msgSend_clientCertArray(void *a1, const char *a2, ...)
{
  return _[a1 clientCertArray];
}

id objc_msgSend_clientState(void *a1, const char *a2, ...)
{
  return _[a1 clientState];
}

id objc_msgSend_cloneFailedList(void *a1, const char *a2, ...)
{
  return _[a1 cloneFailedList];
}

id objc_msgSend_cloneFile_to_expectingHash_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "cloneFile:to:expectingHash:");
}

id objc_msgSend_cloneFile_to_expectingHash_correctOwnership_(void *a1, const char *a2, ...)
{
  return [a1 cloneFile:x0 to:x1 expectingHash:x2 correctOwnership:x3];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return _[a1 close];
}

id objc_msgSend_closeFile(void *a1, const char *a2, ...)
{
  return _[a1 closeFile];
}

id objc_msgSend_closedDate(void *a1, const char *a2, ...)
{
  return _[a1 closedDate];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_codeSignaturePath_(void *a1, const char *a2, ...)
{
  return [a1 codeSignaturePath:];
}

id objc_msgSend_codeSignaturePathForAlmondApp(void *a1, const char *a2, ...)
{
  return _[a1 codeSignaturePathForAlmondApp];
}

id objc_msgSend_collectAppUsageDataForSession_fromStart_toEnd_(void *a1, const char *a2, ...)
{
  return [a1 collectAppUsageDataForSession:x0 fromStart:x1 toEnd:x2];
}

id objc_msgSend_collectAppUsageDataFrom_to_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "collectAppUsageDataFrom:to:");
}

id objc_msgSend_collectAppUsageWithSessionStart_andEnd_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "collectAppUsageWithSessionStart:andEnd:");
}

id objc_msgSend_collectDemoLogsToFolder_(void *a1, const char *a2, ...)
{
  return [a1 collectDemoLogsToFolder:];
}

id objc_msgSend_collectTimingDataForTask_withNetworkError_(void *a1, const char *a2, ...)
{
  return [a1 collectTimingDataForTask:withNetworkError:];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return [a1 compare:];
}

id objc_msgSend_compare_options_(void *a1, const char *a2, ...)
{
  return [a1 compare:options:];
}

id objc_msgSend_compareResultToNSString_(void *a1, const char *a2, ...)
{
  return [a1 compareResultToNSString:];
}

id objc_msgSend_compareSavedHubHostNameWithNewHostName(void *a1, const char *a2, ...)
{
  return _[a1 compareSavedHubHostNameWithNewHostName];
}

id objc_msgSend_compareSavedHubHostsWithNewHosts(void *a1, const char *a2, ...)
{
  return _[a1 compareSavedHubHostsWithNewHosts];
}

id objc_msgSend_compareWith_(void *a1, const char *a2, ...)
{
  return [a1 compareWith:];
}

id objc_msgSend_completed(void *a1, const char *a2, ...)
{
  return _[a1 completed];
}

id objc_msgSend_completion(void *a1, const char *a2, ...)
{
  return _[a1 completion];
}

id objc_msgSend_completionHandler(void *a1, const char *a2, ...)
{
  return _[a1 completionHandler];
}

id objc_msgSend_component(void *a1, const char *a2, ...)
{
  return _[a1 component];
}

id objc_msgSend_component_didProduceClonedComponent_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "component:didProduceClonedComponent:");
}

id objc_msgSend_componentDidComplete_(void *a1, const char *a2, ...)
{
  return [a1 componentDidComplete:];
}

id objc_msgSend_componentDidHaveNewOperationStaged_(void *a1, const char *a2, ...)
{
  return [a1 componentDidHaveNewOperationStaged:];
}

id objc_msgSend_componentManager(void *a1, const char *a2, ...)
{
  return _[a1 componentManager];
}

id objc_msgSend_componentProcessor(void *a1, const char *a2, ...)
{
  return _[a1 componentProcessor];
}

id objc_msgSend_components_fromDate_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "components:fromDate:")];
}

id objc_msgSend_componentsFromBundle(void *a1, const char *a2, ...)
{
  return _[a1 componentsFromBundle];
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return [a1 componentsJoinedByString:];
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return [a1 componentsSeparatedByString:];
}

id objc_msgSend_componentsSuccessful(void *a1, const char *a2, ...)
{
  return _[a1 componentsSuccessful];
}

id objc_msgSend_concurrentDownloadOperation(void *a1, const char *a2, ...)
{
  return _[a1 concurrentDownloadOperation];
}

id objc_msgSend_concurrentDownloadRequest(void *a1, const char *a2, ...)
{
  return _[a1 concurrentDownloadRequest];
}

id objc_msgSend_concurrentSession(void *a1, const char *a2, ...)
{
  return _[a1 concurrentSession];
}

id objc_msgSend_condition(void *a1, const char *a2, ...)
{
  return _[a1 condition];
}

id objc_msgSend_conditionLock(void *a1, const char *a2, ...)
{
  return _[a1 conditionLock];
}

id objc_msgSend_configApplePencilToEnterSleepModeIfPaired(void *a1, const char *a2, ...)
{
  return _[a1 configApplePencilToEnterSleepModeIfPaired];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return _[a1 configuration];
}

id objc_msgSend_configurationProfilesSupported(void *a1, const char *a2, ...)
{
  return _[a1 configurationProfilesSupported];
}

id objc_msgSend_configureAutoUpdate_(void *a1, const char *a2, ...)
{
  return [a1 configureAutoUpdate:];
}

id objc_msgSend_configureGreyMatterAutoUpdate(void *a1, const char *a2, ...)
{
  return _[a1 configureGreyMatterAutoUpdate];
}

id objc_msgSend_configureLowPowerMode(void *a1, const char *a2, ...)
{
  return _[a1 configureLowPowerMode];
}

id objc_msgSend_configureNetworkInterface(void *a1, const char *a2, ...)
{
  return _[a1 configureNetworkInterface];
}

id objc_msgSend_configureWiFi_password_(void *a1, const char *a2, ...)
{
  return [a1 configureWiFi:password:];
}

id objc_msgSend_configureWiFiWithPersistentSettings(void *a1, const char *a2, ...)
{
  return _[a1 configureWiFiWithPersistentSettings];
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return [a1 conformsToProtocol:];
}

id objc_msgSend_connectEndDate(void *a1, const char *a2, ...)
{
  return _[a1 connectEndDate];
}

id objc_msgSend_connectStartDate(void *a1, const char *a2, ...)
{
  return _[a1 connectStartDate];
}

id objc_msgSend_connectTo_password_(void *a1, const char *a2, ...)
{
  return [a1 connectTo:password:];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return _[a1 connection];
}

id objc_msgSend_connectionForPricing(void *a1, const char *a2, ...)
{
  return _[a1 connectionForPricing];
}

id objc_msgSend_containerExist_(void *a1, const char *a2, ...)
{
  return [a1 containerExist:];
}

id objc_msgSend_containerType(void *a1, const char *a2, ...)
{
  return _[a1 containerType];
}

id objc_msgSend_containerized(void *a1, const char *a2, ...)
{
  return _[a1 containerized];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return [a1 containsString:];
}

id objc_msgSend_contentBeingInstalled(void *a1, const char *a2, ...)
{
  return _[a1 contentBeingInstalled];
}

id objc_msgSend_contentCacheProtocol(void *a1, const char *a2, ...)
{
  return _[a1 contentCacheProtocol];
}

id objc_msgSend_contentDownloadConcurrentQueue(void *a1, const char *a2, ...)
{
  return _[a1 contentDownloadConcurrentQueue];
}

id objc_msgSend_contentIdentifierString(void *a1, const char *a2, ...)
{
  return _[a1 contentIdentifierString];
}

id objc_msgSend_contentProgress(void *a1, const char *a2, ...)
{
  return _[a1 contentProgress];
}

id objc_msgSend_contentRange(void *a1, const char *a2, ...)
{
  return _[a1 contentRange];
}

id objc_msgSend_contentRootPath(void *a1, const char *a2, ...)
{
  return _[a1 contentRootPath];
}

id objc_msgSend_contentSyncTimeoutInterval(void *a1, const char *a2, ...)
{
  return _[a1 contentSyncTimeoutInterval];
}

id objc_msgSend_contentsOfDirectoryAtPath_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "contentsOfDirectoryAtPath:error:");
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return _[a1 context];
}

id objc_msgSend_contextForPrimaryAccount(void *a1, const char *a2, ...)
{
  return _[a1 contextForPrimaryAccount];
}

id objc_msgSend_continueToUpdateAccountContent(void *a1, const char *a2, ...)
{
  return _[a1 continueToUpdateAccountContent];
}

id objc_msgSend_continueToUpdateDemoContent(void *a1, const char *a2, ...)
{
  return _[a1 continueToUpdateDemoContent];
}

id objc_msgSend_controlObject_(void *a1, const char *a2, ...)
{
  return [a1 controlObject:];
}

id objc_msgSend_convertPingType_(void *a1, const char *a2, ...)
{
  return [a1 convertPingType:];
}

id objc_msgSend_convertToNSData(void *a1, const char *a2, ...)
{
  return _[a1 convertToNSData];
}

id objc_msgSend_coordinatorForAppWithBundleID_withClientID_createIfNotExisting_created_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "coordinatorForAppWithBundleID:withClientID:createIfNotExisting:created:error:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyFileIfPresentInCache_toLocation_verifyHash_(void *a1, const char *a2, ...)
{
  return [a1 copyFileIfPresentInCache:x0 toLocation:x1 verifyHash:x2];
}

id objc_msgSend_copyItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "copyItemAtPath:toPath:error:");
}

id objc_msgSend_copyPropertyForKey_(void *a1, const char *a2, ...)
{
  return [a1 copyPropertyForKey:];
}

id objc_msgSend_copySecretKeyFromKeychain(void *a1, const char *a2, ...)
{
  return _[a1 copySecretKeyFromKeychain];
}

id objc_msgSend_coreDuetContext(void *a1, const char *a2, ...)
{
  return _[a1 coreDuetContext];
}

id objc_msgSend_coreDuetTriggeredPause(void *a1, const char *a2, ...)
{
  return _[a1 coreDuetTriggeredPause];
}

id objc_msgSend_coreLocationOwnedResources(void *a1, const char *a2, ...)
{
  return _[a1 coreLocationOwnedResources];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return [a1 countByEnumeratingWithState:x0, x1, x2];
}

id objc_msgSend_countOfRequestBodyBytesSent(void *a1, const char *a2, ...)
{
  return _[a1 countOfRequestBodyBytesSent];
}

id objc_msgSend_countOfRequestHeaderBytesSent(void *a1, const char *a2, ...)
{
  return _[a1 countOfRequestHeaderBytesSent];
}

id objc_msgSend_countOfResponseBodyBytesReceived(void *a1, const char *a2, ...)
{
  return _[a1 countOfResponseBodyBytesReceived];
}

id objc_msgSend_countOfResponseHeaderBytesReceived(void *a1, const char *a2, ...)
{
  return _[a1 countOfResponseHeaderBytesReceived];
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return _[a1 countryCode];
}

id objc_msgSend_createContainer_(void *a1, const char *a2, ...)
{
  return [a1 createContainer:];
}

id objc_msgSend_createDeviceManifestForComponent_ofType_withRootPath_userHomePath_andSavePath_(void *a1, const char *a2, ...)
{
  return [a1 createDeviceManifestForComponent:x0 ofType:x1 withRootPath:x2 userHomePath:x3 andSavePath:x4];
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return [a1 createDirectoryAtURL:withIntermediateDirectories:attributes:error:];
}

id objc_msgSend_createDownloadCacheFolders(void *a1, const char *a2, ...)
{
  return _[a1 createDownloadCacheFolders];
}

id objc_msgSend_createFileAtPath_contents_attributes_(void *a1, const char *a2, ...)
{
  return [a1 createFileAtPath:x0 contents:x1 attributes:x2];
}

id objc_msgSend_createFullPathList_rootPath_isAllowList_(void *a1, const char *a2, ...)
{
  return [a1 createFullPathList:x0 rootPath:x1 isAllowList:x2];
}

id objc_msgSend_createMobileStoreDemoCache(void *a1, const char *a2, ...)
{
  return _[a1 createMobileStoreDemoCache];
}

id objc_msgSend_createOperationFromIdentifier_withContext_(void *a1, const char *a2, ...)
{
  return [a1 createOperationFromIdentifier:withContext:];
}

id objc_msgSend_createPublicKey_usingPolicy_anchors_(void *a1, const char *a2, ...)
{
  return [a1 createPublicKey:x0 usingPolicy:x1 anchors:x2];
}

id objc_msgSend_createPublicKeyAppleISTSigning_(void *a1, const char *a2, ...)
{
  return [a1 createPublicKeyAppleISTSigning:];
}

id objc_msgSend_createPublicKeyForDevelopmentSigning_(void *a1, const char *a2, ...)
{
  return [a1 createPublicKeyForDevelopmentSigning:];
}

id objc_msgSend_createPublicKeyForDevelopmentSigningStandard_(void *a1, const char *a2, ...)
{
  return [a1 createPublicKeyForDevelopmentSigningStandard:];
}

id objc_msgSend_createPublicKeyForStrongSigning_(void *a1, const char *a2, ...)
{
  return [a1 createPublicKeyForStrongSigning:];
}

id objc_msgSend_createRemovableCounterpartComponent(void *a1, const char *a2, ...)
{
  return _[a1 createRemovableCounterpartComponent];
}

id objc_msgSend_createSearchDictionaryForKey_(void *a1, const char *a2, ...)
{
  return [a1 createSearchDictionaryForKey:];
}

id objc_msgSend_createSecretKeyIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 createSecretKeyIfNeeded];
}

id objc_msgSend_createSignedManifestFromManifestFile_(void *a1, const char *a2, ...)
{
  return [a1 createSignedManifestFromManifestFile:];
}

id objc_msgSend_createSymbolicLinkAtPath_withDestinationPath_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "createSymbolicLinkAtPath:withDestinationPath:error:");
}

id objc_msgSend_createTemporaryPasscodeIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 createTemporaryPasscodeIfNeeded];
}

id objc_msgSend_createXPCDictionary(void *a1, const char *a2, ...)
{
  return _[a1 createXPCDictionary];
}

id objc_msgSend_createXPCEndpoint(void *a1, const char *a2, ...)
{
  return _[a1 createXPCEndpoint];
}

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return _[a1 creationDate];
}

id objc_msgSend_creationList(void *a1, const char *a2, ...)
{
  return _[a1 creationList];
}

id objc_msgSend_creatorSN(void *a1, const char *a2, ...)
{
  return _[a1 creatorSN];
}

id objc_msgSend_creatorUDID(void *a1, const char *a2, ...)
{
  return _[a1 creatorUDID];
}

id objc_msgSend_credential(void *a1, const char *a2, ...)
{
  return _[a1 credential];
}

id objc_msgSend_credentialForTrust_(void *a1, const char *a2, ...)
{
  return [a1 credentialForTrust:];
}

id objc_msgSend_credentialHeaders(void *a1, const char *a2, ...)
{
  return _[a1 credentialHeaders];
}

id objc_msgSend_credentialWithPassword_(void *a1, const char *a2, ...)
{
  return [a1 credentialWithPassword:];
}

id objc_msgSend_credentials(void *a1, const char *a2, ...)
{
  return _[a1 credentials];
}

id objc_msgSend_criticalComponents(void *a1, const char *a2, ...)
{
  return _[a1 criticalComponents];
}

id objc_msgSend_criticalUpdatePrioritized(void *a1, const char *a2, ...)
{
  return _[a1 criticalUpdatePrioritized];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return _[a1 currentCalendar];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _[a1 currentHandler];
}

id objc_msgSend_currentKnownNetworkProfile(void *a1, const char *a2, ...)
{
  return _[a1 currentKnownNetworkProfile];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return _[a1 currentLocale];
}

id objc_msgSend_currentOSVersion(void *a1, const char *a2, ...)
{
  return _[a1 currentOSVersion];
}

id objc_msgSend_currentProgress(void *a1, const char *a2, ...)
{
  return _[a1 currentProgress];
}

id objc_msgSend_currentRetry(void *a1, const char *a2, ...)
{
  return _[a1 currentRetry];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 currentRunLoop];
}

id objc_msgSend_currentStage(void *a1, const char *a2, ...)
{
  return _[a1 currentStage];
}

id objc_msgSend_currentState(void *a1, const char *a2, ...)
{
  return _[a1 currentState];
}

id objc_msgSend_currentTry(void *a1, const char *a2, ...)
{
  return _[a1 currentTry];
}

id objc_msgSend_currentUID(void *a1, const char *a2, ...)
{
  return _[a1 currentUID];
}

id objc_msgSend_currentUniqueIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 currentUniqueIdentifier];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_dataContainerPaths(void *a1, const char *a2, ...)
{
  return _[a1 dataContainerPaths];
}

id objc_msgSend_dataContainerURL(void *a1, const char *a2, ...)
{
  return _[a1 dataContainerURL];
}

id objc_msgSend_dataDict(void *a1, const char *a2, ...)
{
  return _[a1 dataDict];
}

id objc_msgSend_dataFromPropertyList_format_errorDescription_(void *a1, const char *a2, ...)
{
  return [a1 dataFromPropertyList:x0 format:x1 errorDescription:x2];
}

id objc_msgSend_dataTaskWithRequest_(void *a1, const char *a2, ...)
{
  return [a1 dataTaskWithRequest:];
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return [a1 dataUsingEncoding:];
}

id objc_msgSend_dataVolumeCacheFolderPath(void *a1, const char *a2, ...)
{
  return _[a1 dataVolumeCacheFolderPath];
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return [a1 dataWithBytes:length:];
}

id objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return [a1 dataWithBytesNoCopy:x0 length:x1 freeWhenDone:x2];
}

id objc_msgSend_dataWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 dataWithCapacity:];
}

id objc_msgSend_dataWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return [a1 dataWithContentsOfFile:];
}

id objc_msgSend_dataWithContentsOfFile_options_error_(void *a1, const char *a2, ...)
{
  return [a1 dataWithContentsOfFile:x0 options:x1 error:x2];
}

id objc_msgSend_dataWithData_(void *a1, const char *a2, ...)
{
  return [a1 dataWithData:];
}

id objc_msgSend_dataWithHexString_(void *a1, const char *a2, ...)
{
  return [a1 dataWithHexString:];
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_dataWithLength_(void *a1, const char *a2, ...)
{
  return [a1 dataWithLength:];
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return [a1 dataWithPropertyList:x0 format:x1 options:x2 error:x3];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateByAddingComponents_toDate_options_(void *a1, const char *a2, ...)
{
  return [a1 dateByAddingComponents:toDate:options:];
}

id objc_msgSend_dateByAddingUnit_value_toDate_options_(void *a1, const char *a2, ...)
{
  return [a1 dateByAddingUnit:value:toDate:options:];
}

id objc_msgSend_dateBySettingHour_minute_second_ofDate_options_(void *a1, const char *a2, ...)
{
  return [a1 dateBySettingHour:minute:second:ofDate:options:];
}

id objc_msgSend_dateFromString_(void *a1, const char *a2, ...)
{
  return [a1 dateFromString:];
}

id objc_msgSend_dateWithTimeInterval_sinceDate_(void *a1, const char *a2, ...)
{
  return [a1 dateWithTimeInterval:x0 sinceDate:x1];
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

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return _[a1 day];
}

id objc_msgSend_dcotaOfflineModeDevice(void *a1, const char *a2, ...)
{
  return _[a1 dcotaOfflineModeDevice];
}

id objc_msgSend_deactivate(void *a1, const char *a2, ...)
{
  return _[a1 deactivate];
}

id objc_msgSend_deactivateDevice(void *a1, const char *a2, ...)
{
  return _[a1 deactivateDevice];
}

id objc_msgSend_deactivateFullScreenUIAppMonitor(void *a1, const char *a2, ...)
{
  return _[a1 deactivateFullScreenUIAppMonitor];
}

id objc_msgSend_decodeComponentIdx_forSavedString_(void *a1, const char *a2, ...)
{
  return [a1 decodeComponentIdx:forSavedString:];
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeObjectOfClass:forKey:];
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeObjectOfClasses:forKey:];
}

id objc_msgSend_decryptAndUnarchiveKeychainItems_(void *a1, const char *a2, ...)
{
  return [a1 decryptAndUnarchiveKeychainItems:];
}

id objc_msgSend_deepCopy_(void *a1, const char *a2, ...)
{
  return [a1 deepCopy:];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultContextForBackupItem_(void *a1, const char *a2, ...)
{
  return [a1 defaultContextForBackupItem:];
}

id objc_msgSend_defaultContextForContainerizedAppDataItem_(void *a1, const char *a2, ...)
{
  return [a1 defaultContextForContainerizedAppDataItem:];
}

id objc_msgSend_defaultContextForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 defaultContextForIdentifier:];
}

id objc_msgSend_defaultContextForNonContainerizedAppDataItem_(void *a1, const char *a2, ...)
{
  return [a1 defaultContextForNonContainerizedAppDataItem:];
}

id objc_msgSend_defaultLogLevel(void *a1, const char *a2, ...)
{
  return _[a1 defaultLogLevel];
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

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return _[a1 defaultStore];
}

id objc_msgSend_defaultTimeZone(void *a1, const char *a2, ...)
{
  return _[a1 defaultTimeZone];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _[a1 defaultWorkspace];
}

id objc_msgSend_delayRebootForTesting(void *a1, const char *a2, ...)
{
  return _[a1 delayRebootForTesting];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_delegates(void *a1, const char *a2, ...)
{
  return _[a1 delegates];
}

id objc_msgSend_deleteConfigurationApp(void *a1, const char *a2, ...)
{
  return _[a1 deleteConfigurationApp];
}

id objc_msgSend_deleteContainer_(void *a1, const char *a2, ...)
{
  return [a1 deleteContainer:];
}

id objc_msgSend_deleteDataBlob_(void *a1, const char *a2, ...)
{
  return [a1 deleteDataBlob:];
}

id objc_msgSend_deleteDataStoreWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 deleteDataStoreWithCompletion:];
}

id objc_msgSend_deleteFromCache_(void *a1, const char *a2, ...)
{
  return [a1 deleteFromCache:];
}

id objc_msgSend_deleteInstallableFileAfterInstall(void *a1, const char *a2, ...)
{
  return _[a1 deleteInstallableFileAfterInstall];
}

id objc_msgSend_deleteItemForKey_(void *a1, const char *a2, ...)
{
  return [a1 deleteItemForKey:];
}

id objc_msgSend_deleteNVRam_(void *a1, const char *a2, ...)
{
  return [a1 deleteNVRam:];
}

id objc_msgSend_deleteNvram_(void *a1, const char *a2, ...)
{
  return [a1 deleteNvram:];
}

id objc_msgSend_deleteOperationRequest(void *a1, const char *a2, ...)
{
  return _[a1 deleteOperationRequest];
}

id objc_msgSend_deleteOperationRequestAndQuitHelper(void *a1, const char *a2, ...)
{
  return _[a1 deleteOperationRequestAndQuitHelper];
}

id objc_msgSend_deleteSecretKey(void *a1, const char *a2, ...)
{
  return _[a1 deleteSecretKey];
}

id objc_msgSend_deleteSecretKeyInKeychain(void *a1, const char *a2, ...)
{
  return _[a1 deleteSecretKeyInKeychain];
}

id objc_msgSend_demoClient(void *a1, const char *a2, ...)
{
  return _[a1 demoClient];
}

id objc_msgSend_demoLogUploadCompleted_(void *a1, const char *a2, ...)
{
  return [a1 demoLogUploadCompleted:];
}

id objc_msgSend_demoLogUploadRequest(void *a1, const char *a2, ...)
{
  return _[a1 demoLogUploadRequest];
}

id objc_msgSend_demoPrepareInProgress(void *a1, const char *a2, ...)
{
  return _[a1 demoPrepareInProgress];
}

id objc_msgSend_demoSetup(void *a1, const char *a2, ...)
{
  return _[a1 demoSetup];
}

id objc_msgSend_demoUnitServerURL(void *a1, const char *a2, ...)
{
  return _[a1 demoUnitServerURL];
}

id objc_msgSend_demoUpdateAllowCancel_(void *a1, const char *a2, ...)
{
  return [a1 demoUpdateAllowCancel:];
}

id objc_msgSend_demoUpdateCompleted_(void *a1, const char *a2, ...)
{
  return [a1 demoUpdateCompleted:];
}

id objc_msgSend_demoUpdateFailed_(void *a1, const char *a2, ...)
{
  return [a1 demoUpdateFailed:];
}

id objc_msgSend_demoUpdateProgress_(void *a1, const char *a2, ...)
{
  return [a1 demoUpdateProgress:];
}

id objc_msgSend_demoUpdateQueue(void *a1, const char *a2, ...)
{
  return _[a1 demoUpdateQueue];
}

id objc_msgSend_demoUserHomePath(void *a1, const char *a2, ...)
{
  return _[a1 demoUserHomePath];
}

id objc_msgSend_demoVolumeCacheFolderPath(void *a1, const char *a2, ...)
{
  return _[a1 demoVolumeCacheFolderPath];
}

id objc_msgSend_demodReady(void *a1, const char *a2, ...)
{
  return _[a1 demodReady];
}

id objc_msgSend_demodVersion(void *a1, const char *a2, ...)
{
  return _[a1 demodVersion];
}

id objc_msgSend_demuxQueue(void *a1, const char *a2, ...)
{
  return _[a1 demuxQueue];
}

id objc_msgSend_denyMulticast(void *a1, const char *a2, ...)
{
  return _[a1 denyMulticast];
}

id objc_msgSend_dependencies(void *a1, const char *a2, ...)
{
  return _[a1 dependencies];
}

id objc_msgSend_dependents(void *a1, const char *a2, ...)
{
  return _[a1 dependents];
}

id objc_msgSend_deregisterCallback_(void *a1, const char *a2, ...)
{
  return [a1 deregisterCallback:];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_descriptor(void *a1, const char *a2, ...)
{
  return _[a1 descriptor];
}

id objc_msgSend_destinationDevice(void *a1, const char *a2, ...)
{
  return _[a1 destinationDevice];
}

id objc_msgSend_destinationOfSymbolicLinkAtPath_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "destinationOfSymbolicLinkAtPath:error:");
}

id objc_msgSend_destroyWorkFolderForBootTask(void *a1, const char *a2, ...)
{
  return _[a1 destroyWorkFolderForBootTask];
}

id objc_msgSend_detailedDescription(void *a1, const char *a2, ...)
{
  return _[a1 detailedDescription];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return _[a1 device];
}

id objc_msgSend_deviceFlags(void *a1, const char *a2, ...)
{
  return _[a1 deviceFlags];
}

id objc_msgSend_deviceIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 deviceIdentifier];
}

id objc_msgSend_deviceInformation_(void *a1, const char *a2, ...)
{
  return [a1 deviceInformation:];
}

id objc_msgSend_deviceInformationForPing_(void *a1, const char *a2, ...)
{
  return [a1 deviceInformationForPing:];
}

id objc_msgSend_deviceLanguageIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 deviceLanguageIdentifier];
}

id objc_msgSend_deviceLockAssertion(void *a1, const char *a2, ...)
{
  return _[a1 deviceLockAssertion];
}

id objc_msgSend_deviceManifest(void *a1, const char *a2, ...)
{
  return _[a1 deviceManifest];
}

id objc_msgSend_deviceName(void *a1, const char *a2, ...)
{
  return _[a1 deviceName];
}

id objc_msgSend_devicePresenceNotifier(void *a1, const char *a2, ...)
{
  return _[a1 devicePresenceNotifier];
}

id objc_msgSend_devicePresencePreset(void *a1, const char *a2, ...)
{
  return _[a1 devicePresencePreset];
}

id objc_msgSend_devicePublicID(void *a1, const char *a2, ...)
{
  return _[a1 devicePublicID];
}

id objc_msgSend_deviceRegionCode(void *a1, const char *a2, ...)
{
  return _[a1 deviceRegionCode];
}

id objc_msgSend_deviceRegistry(void *a1, const char *a2, ...)
{
  return _[a1 deviceRegistry];
}

id objc_msgSend_deviceScanner(void *a1, const char *a2, ...)
{
  return _[a1 deviceScanner];
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return _[a1 deviceType];
}

id objc_msgSend_deviceUDID(void *a1, const char *a2, ...)
{
  return _[a1 deviceUDID];
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return _[a1 devices];
}

id objc_msgSend_dict(void *a1, const char *a2, ...)
{
  return _[a1 dict];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryFromJsonData_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryFromJsonData:];
}

id objc_msgSend_dictionaryFromXPCDictionary_withDataFromKey_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "dictionaryFromXPCDictionary:withDataFromKey:");
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithCapacity:];
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithContentsOfFile:];
}

id objc_msgSend_dictionaryWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithContentsOfURL:];
}

id objc_msgSend_dictionaryWithContentsOfURL_error_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithContentsOfURL:error:];
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithDictionary:];
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

id objc_msgSend_dictionaryWithXPCDictionary_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithXPCDictionary:];
}

id objc_msgSend_didProgress(void *a1, const char *a2, ...)
{
  return _[a1 didProgress];
}

id objc_msgSend_didReceiveEventMessage_fromDevice_(void *a1, const char *a2, ...)
{
  return [a1 didReceiveEventMessage:fromDevice:];
}

id objc_msgSend_didReceiveNewPauseStatus_forReason_(void *a1, const char *a2, ...)
{
  return [a1 didReceiveNewPauseStatus:forReason:];
}

id objc_msgSend_didReceiveRequestMessage_fromDevice_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "didReceiveRequestMessage:fromDevice:");
}

id objc_msgSend_didUpdateDeviceReachability_(void *a1, const char *a2, ...)
{
  return [a1 didUpdateDeviceReachability:];
}

id objc_msgSend_disableBackgroundInstall(void *a1, const char *a2, ...)
{
  return _[a1 disableBackgroundInstall];
}

id objc_msgSend_disableCoreAnalticsTransformSampling(void *a1, const char *a2, ...)
{
  return _[a1 disableCoreAnalticsTransformSampling];
}

id objc_msgSend_disableIdleTimer(void *a1, const char *a2, ...)
{
  return _[a1 disableIdleTimer];
}

id objc_msgSend_disableInContext_withWipeToken_(void *a1, const char *a2, ...)
{
  return [a1 disableInContext:withWipeToken:];
}

id objc_msgSend_disableLaunchdServicesForWatch(void *a1, const char *a2, ...)
{
  return _[a1 disableLaunchdServicesForWatch];
}

id objc_msgSend_disableNightlyLowPowerMode(void *a1, const char *a2, ...)
{
  return _[a1 disableNightlyLowPowerMode];
}

id objc_msgSend_disableNightlySnapshotRevert(void *a1, const char *a2, ...)
{
  return _[a1 disableNightlySnapshotRevert];
}

id objc_msgSend_disableParallelProcessing(void *a1, const char *a2, ...)
{
  return _[a1 disableParallelProcessing];
}

id objc_msgSend_disassociateAndForgetWiFi(void *a1, const char *a2, ...)
{
  return _[a1 disassociateAndForgetWiFi];
}

id objc_msgSend_disassociateWithReason_(void *a1, const char *a2, ...)
{
  return [a1 disassociateWithReason:];
}

id objc_msgSend_discardStagedOperationsAndTriggerCompletion(void *a1, const char *a2, ...)
{
  return _[a1 discardStagedOperationsAndTriggerCompletion];
}

id objc_msgSend_discoverAndEnrollWithHub_(void *a1, const char *a2, ...)
{
  return [a1 discoverAndEnrollWithHub:];
}

id objc_msgSend_discoverableMode(void *a1, const char *a2, ...)
{
  return _[a1 discoverableMode];
}

id objc_msgSend_discoveredPeers(void *a1, const char *a2, ...)
{
  return _[a1 discoveredPeers];
}

id objc_msgSend_diskSpaceMonitoringTimer(void *a1, const char *a2, ...)
{
  return _[a1 diskSpaceMonitoringTimer];
}

id objc_msgSend_diskSpaceRequired(void *a1, const char *a2, ...)
{
  return _[a1 diskSpaceRequired];
}

id objc_msgSend_diskSpaceTriggeredPause(void *a1, const char *a2, ...)
{
  return _[a1 diskSpaceTriggeredPause];
}

id objc_msgSend_diskSpacedRequired(void *a1, const char *a2, ...)
{
  return _[a1 diskSpacedRequired];
}

id objc_msgSend_dispatchSessionTask_(void *a1, const char *a2, ...)
{
  return [a1 dispatchSessionTask:];
}

id objc_msgSend_dispatchSessionTask_withError_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "dispatchSessionTask:withError:");
}

id objc_msgSend_dispatchTable(void *a1, const char *a2, ...)
{
  return _[a1 dispatchTable];
}

id objc_msgSend_dispatchTime(void *a1, const char *a2, ...)
{
  return _[a1 dispatchTime];
}

id objc_msgSend_displayBacklightLevel(void *a1, const char *a2, ...)
{
  return _[a1 displayBacklightLevel];
}

id objc_msgSend_displayLayoutMonitor(void *a1, const char *a2, ...)
{
  return _[a1 displayLayoutMonitor];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return _[a1 distantFuture];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return _[a1 distantPast];
}

id objc_msgSend_doPreSkyMigration(void *a1, const char *a2, ...)
{
  return _[a1 doPreSkyMigration];
}

id objc_msgSend_doPreSydneyMigration(void *a1, const char *a2, ...)
{
  return _[a1 doPreSydneyMigration];
}

id objc_msgSend_doesAvailableUpdateVersion_andUpdateBuild_matchExpectedUpdateVersion_andUpdateBuild_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "doesAvailableUpdateVersion:andUpdateBuild:matchExpectedUpdateVersion:andUpdateBuild:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_domainLookupEndDate(void *a1, const char *a2, ...)
{
  return _[a1 domainLookupEndDate];
}

id objc_msgSend_domainLookupStartDate(void *a1, const char *a2, ...)
{
  return _[a1 domainLookupStartDate];
}

id objc_msgSend_domains(void *a1, const char *a2, ...)
{
  return _[a1 domains];
}

id objc_msgSend_domainsPlistFilePath(void *a1, const char *a2, ...)
{
  return _[a1 domainsPlistFilePath];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_downloadCredentials(void *a1, const char *a2, ...)
{
  return _[a1 downloadCredentials];
}

id objc_msgSend_downloadFile_(void *a1, const char *a2, ...)
{
  return [a1 downloadFile:];
}

id objc_msgSend_downloadFileForRequest_(void *a1, const char *a2, ...)
{
  return [a1 downloadFileForRequest:];
}

id objc_msgSend_downloadIPACachingHub_(void *a1, const char *a2, ...)
{
  return [a1 downloadIPACachingHub:];
}

id objc_msgSend_downloadIPAPreCachingHub_(void *a1, const char *a2, ...)
{
  return [a1 downloadIPAPreCachingHub:];
}

id objc_msgSend_downloadManager(void *a1, const char *a2, ...)
{
  return _[a1 downloadManager];
}

id objc_msgSend_downloadManifest_(void *a1, const char *a2, ...)
{
  return [a1 downloadManifest:];
}

id objc_msgSend_downloadOnly(void *a1, const char *a2, ...)
{
  return _[a1 downloadOnly];
}

id objc_msgSend_downloadProgressChanged_withPercent_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "downloadProgressChanged:withPercent:");
}

id objc_msgSend_downloadQueue(void *a1, const char *a2, ...)
{
  return _[a1 downloadQueue];
}

id objc_msgSend_downloadRequestCompletions(void *a1, const char *a2, ...)
{
  return _[a1 downloadRequestCompletions];
}

id objc_msgSend_downloadSize(void *a1, const char *a2, ...)
{
  return _[a1 downloadSize];
}

id objc_msgSend_downloadSource(void *a1, const char *a2, ...)
{
  return _[a1 downloadSource];
}

id objc_msgSend_downloadSpeed(void *a1, const char *a2, ...)
{
  return _[a1 downloadSpeed];
}

id objc_msgSend_downloadedBytes(void *a1, const char *a2, ...)
{
  return _[a1 downloadedBytes];
}

id objc_msgSend_downloadedContentSource(void *a1, const char *a2, ...)
{
  return _[a1 downloadedContentSource];
}

id objc_msgSend_downloadedSize(void *a1, const char *a2, ...)
{
  return _[a1 downloadedSize];
}

id objc_msgSend_droppedByRapport(void *a1, const char *a2, ...)
{
  return _[a1 droppedByRapport];
}

id objc_msgSend_dsid(void *a1, const char *a2, ...)
{
  return _[a1 dsid];
}

id objc_msgSend_duServer(void *a1, const char *a2, ...)
{
  return _[a1 duServer];
}

id objc_msgSend_effectiveAppIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 effectiveAppIdentifiers];
}

id objc_msgSend_effectiveExtensionAttributes(void *a1, const char *a2, ...)
{
  return _[a1 effectiveExtensionAttributes];
}

id objc_msgSend_eligible(void *a1, const char *a2, ...)
{
  return _[a1 eligible];
}

id objc_msgSend_eliminateAllForAssetType_completion_(void *a1, const char *a2, ...)
{
  return [a1 eliminateAllForAssetType:completion:];
}

id objc_msgSend_eliminateAtomic_usingClientDomain_forAssetSetIdentifier_awaitingUnlocked_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "eliminateAtomic:usingClientDomain:forAssetSetIdentifier:awaitingUnlocked:completion:");
}

id objc_msgSend_embeddedSIMInstalled(void *a1, const char *a2, ...)
{
  return _[a1 embeddedSIMInstalled];
}

id objc_msgSend_enableAIModelAutoUpdate(void *a1, const char *a2, ...)
{
  return _[a1 enableAIModelAutoUpdate];
}

id objc_msgSend_enableInContext_completion_(void *a1, const char *a2, ...)
{
  return [a1 enableInContext:completion:];
}

id objc_msgSend_enableLogToFile_(void *a1, const char *a2, ...)
{
  return [a1 enableLogToFile:];
}

id objc_msgSend_enablePeerDemoService(void *a1, const char *a2, ...)
{
  return _[a1 enablePeerDemoService];
}

id objc_msgSend_enablePushNotifications(void *a1, const char *a2, ...)
{
  return _[a1 enablePushNotifications];
}

id objc_msgSend_enableSnapshotMode_(void *a1, const char *a2, ...)
{
  return [a1 enableSnapshotMode:];
}

id objc_msgSend_enableWiFi_(void *a1, const char *a2, ...)
{
  return [a1 enableWiFi:];
}

id objc_msgSend_enabledAccounts(void *a1, const char *a2, ...)
{
  return _[a1 enabledAccounts];
}

id objc_msgSend_encodeBase64_ofLength_(void *a1, const char *a2, ...)
{
  return [a1 encodeBase64:x0 ofLength:x1];
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeObject:forKey:];
}

id objc_msgSend_endEvent(void *a1, const char *a2, ...)
{
  return _[a1 endEvent];
}

id objc_msgSend_endOfDay(void *a1, const char *a2, ...)
{
  return _[a1 endOfDay];
}

id objc_msgSend_endowmentNamespaces(void *a1, const char *a2, ...)
{
  return _[a1 endowmentNamespaces];
}

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return _[a1 endpoint];
}

id objc_msgSend_enroll_(void *a1, const char *a2, ...)
{
  return [a1 enroll:];
}

id objc_msgSend_enrollAndSetup_(void *a1, const char *a2, ...)
{
  return [a1 enrollAndSetup:];
}

id objc_msgSend_enrollForDeviceName_pairingCredential_hubHostName_hubPort_error_(void *a1, const char *a2, ...)
{
  return [a1 enrollForDeviceName:x0 pairingCredential:x1 hubHostName:x2 hubPort:x3 error:x4];
}

id objc_msgSend_enrolled(void *a1, const char *a2, ...)
{
  return _[a1 enrolled];
}

id objc_msgSend_entitlementCheckForFile_(void *a1, const char *a2, ...)
{
  return [a1 entitlementCheckForFile:];
}

id objc_msgSend_enumerateAndCollectMetaData_relativeTo_skip_superSet_handler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "enumerateAndCollectMetaData:relativeTo:skip:superSet:handler:");
}

id objc_msgSend_enumerateBundlesOfType_block_(void *a1, const char *a2, ...)
{
  return [a1 enumerateBundlesOfType:block:];
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateKeysAndObjectsUsingBlock:];
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateObjectsUsingBlock:];
}

id objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return _[a1 error];
}

id objc_msgSend_errorCheckedSetBoolValue_forSetting_(void *a1, const char *a2, ...)
{
  return [a1 errorCheckedSetBoolValue:forSetting:];
}

id objc_msgSend_errorDomainMSDWithCode_message_(void *a1, const char *a2, ...)
{
  return [a1 errorDomainMSDWithCode:];
}

id objc_msgSend_errorDomainMSDWithCode_message_reason_(void *a1, const char *a2, ...)
{
  return [a1 errorDomainMSDWithCode:x0 message:x1 reason:x2];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 errorWithDomain:code:userInfo:];
}

id objc_msgSend_errors(void *a1, const char *a2, ...)
{
  return _[a1 errors];
}

id objc_msgSend_evaluateStoreStatusAgainstCurrentTime(void *a1, const char *a2, ...)
{
  return _[a1 evaluateStoreStatusAgainstCurrentTime];
}

id objc_msgSend_evaluateStoreStatusAgainstPointInTime_(void *a1, const char *a2, ...)
{
  return [a1 evaluateStoreStatusAgainstPointInTime:];
}

id objc_msgSend_eventBody(void *a1, const char *a2, ...)
{
  return _[a1 eventBody];
}

id objc_msgSend_eventSessionToAppUsage_(void *a1, const char *a2, ...)
{
  return [a1 eventSessionToAppUsage:];
}

id objc_msgSend_events(void *a1, const char *a2, ...)
{
  return _[a1 events];
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 exceptionWithName:reason:userInfo:];
}

id objc_msgSend_executableURL(void *a1, const char *a2, ...)
{
  return _[a1 executableURL];
}

id objc_msgSend_execute(void *a1, const char *a2, ...)
{
  return _[a1 execute];
}

id objc_msgSend_execute_(void *a1, const char *a2, ...)
{
  return [a1 execute:];
}

id objc_msgSend_existingAccounts(void *a1, const char *a2, ...)
{
  return _[a1 existingAccounts];
}

id objc_msgSend_existingFileSize(void *a1, const char *a2, ...)
{
  return _[a1 existingFileSize];
}

id objc_msgSend_expectedOSBuild(void *a1, const char *a2, ...)
{
  return _[a1 expectedOSBuild];
}

id objc_msgSend_expectedOSVersion(void *a1, const char *a2, ...)
{
  return _[a1 expectedOSVersion];
}

id objc_msgSend_expirationTimer(void *a1, const char *a2, ...)
{
  return _[a1 expirationTimer];
}

id objc_msgSend_explorerDidFindDevice_(void *a1, const char *a2, ...)
{
  return [a1 explorerDidFindDevice:];
}

id objc_msgSend_explorerDidLoseDevice_(void *a1, const char *a2, ...)
{
  return [a1 explorerDidLoseDevice:];
}

id objc_msgSend_explorerDidUpdateDevice_(void *a1, const char *a2, ...)
{
  return [a1 explorerDidUpdateDevice:];
}

id objc_msgSend_extendedAttributeKeysWithPath_(void *a1, const char *a2, ...)
{
  return [a1 extendedAttributeKeysWithPath:];
}

id objc_msgSend_extendedAttributesWithPath_(void *a1, const char *a2, ...)
{
  return [a1 extendedAttributesWithPath:];
}

id objc_msgSend_extension(void *a1, const char *a2, ...)
{
  return _[a1 extension];
}

id objc_msgSend_extensionContextIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 extensionContextIdentifier];
}

id objc_msgSend_extensionsWithMatchingAttributes_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "extensionsWithMatchingAttributes:error:");
}

id objc_msgSend_extractAndUploadTimingData_forServerType_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "extractAndUploadTimingData:forServerType:");
}

id objc_msgSend_extractProtocolVersion(void *a1, const char *a2, ...)
{
  return _[a1 extractProtocolVersion];
}

id objc_msgSend_extractTimingData_forServerType_(void *a1, const char *a2, ...)
{
  return [a1 extractTimingData:forServerType:];
}

id objc_msgSend_fakeActivationDemoBit(void *a1, const char *a2, ...)
{
  return _[a1 fakeActivationDemoBit];
}

id objc_msgSend_fdc(void *a1, const char *a2, ...)
{
  return _[a1 fdc];
}

id objc_msgSend_fdcDelegate(void *a1, const char *a2, ...)
{
  return _[a1 fdcDelegate];
}

id objc_msgSend_features(void *a1, const char *a2, ...)
{
  return _[a1 features];
}

id objc_msgSend_fetchActiveNetworkInterface(void *a1, const char *a2, ...)
{
  return _[a1 fetchActiveNetworkInterface];
}

id objc_msgSend_fetchDeviceInfoFromPeerOfID_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 fetchDeviceInfoFromPeerOfID:withCompletion:];
}

id objc_msgSend_fetchiTunesiCloudAccountsInfo(void *a1, const char *a2, ...)
{
  return _[a1 fetchiTunesiCloudAccountsInfo];
}

id objc_msgSend_file(void *a1, const char *a2, ...)
{
  return _[a1 file];
}

id objc_msgSend_file_blacklisted_(void *a1, const char *a2, ...)
{
  return [a1 file:blacklisted:];
}

id objc_msgSend_file_whitelisted_(void *a1, const char *a2, ...)
{
  return [a1 file:whitelisted:];
}

id objc_msgSend_fileAttributesAllowSet_(void *a1, const char *a2, ...)
{
  return [a1 fileAttributesAllowSet:];
}

id objc_msgSend_fileAttributesWithPath_(void *a1, const char *a2, ...)
{
  return [a1 fileAttributesWithPath:];
}

id objc_msgSend_fileCachePathFromSourcePath_forBackgroundDownload_(void *a1, const char *a2, ...)
{
  return [a1 fileCachePathFromSourcePath:forBackgroundDownload:];
}

id objc_msgSend_fileCreationDate(void *a1, const char *a2, ...)
{
  return _[a1 fileCreationDate];
}

id objc_msgSend_fileDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 fileDescriptor];
}

id objc_msgSend_fileDownloadCachePaths(void *a1, const char *a2, ...)
{
  return _[a1 fileDownloadCachePaths];
}

id objc_msgSend_fileDownloading(void *a1, const char *a2, ...)
{
  return _[a1 fileDownloading];
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return [a1 fileExistsAtPath:];
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return [a1 fileExistsAtPath:isDirectory:];
}

id objc_msgSend_fileGroupOwnerAccountID(void *a1, const char *a2, ...)
{
  return _[a1 fileGroupOwnerAccountID];
}

id objc_msgSend_fileHandle(void *a1, const char *a2, ...)
{
  return _[a1 fileHandle];
}

id objc_msgSend_fileHandleForReading(void *a1, const char *a2, ...)
{
  return _[a1 fileHandleForReading];
}

id objc_msgSend_fileHandleForReadingAtPath_(void *a1, const char *a2, ...)
{
  return [a1 fileHandleForReadingAtPath:];
}

id objc_msgSend_fileHandleForWritingAtPath_(void *a1, const char *a2, ...)
{
  return [a1 fileHandleForWritingAtPath:];
}

id objc_msgSend_fileHash(void *a1, const char *a2, ...)
{
  return _[a1 fileHash];
}

id objc_msgSend_fileHashWithPath_(void *a1, const char *a2, ...)
{
  return [a1 fileHashWithPath:x0];
}

id objc_msgSend_fileInfo(void *a1, const char *a2, ...)
{
  return _[a1 fileInfo];
}

id objc_msgSend_fileManager(void *a1, const char *a2, ...)
{
  return _[a1 fileManager];
}

id objc_msgSend_fileMetaDataWithMetadataDictionary_(void *a1, const char *a2, ...)
{
  return [a1 fileMetaDataWithMetadataDictionary:];
}

id objc_msgSend_fileMetadatatWithPath_(void *a1, const char *a2, ...)
{
  return [a1 fileMetadatatWithPath:];
}

id objc_msgSend_fileName(void *a1, const char *a2, ...)
{
  return _[a1 fileName];
}

id objc_msgSend_fileNameForTodayUnder_prefix_(void *a1, const char *a2, ...)
{
  return [a1 fileNameForTodayUnder:x0 prefix:x1];
}

id objc_msgSend_fileOwnerAccountID(void *a1, const char *a2, ...)
{
  return _[a1 fileOwnerAccountID];
}

id objc_msgSend_filePosixPermissions(void *a1, const char *a2, ...)
{
  return _[a1 filePosixPermissions];
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return _[a1 fileSize];
}

id objc_msgSend_fileSizeInCache_(void *a1, const char *a2, ...)
{
  return [a1 fileSizeInCache:];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 fileSystemRepresentation];
}

id objc_msgSend_fileType(void *a1, const char *a2, ...)
{
  return _[a1 fileType];
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return [a1 fileURLWithPath:];
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return [a1 fileURLWithPath:isDirectory:];
}

id objc_msgSend_fileURLWithString_(void *a1, const char *a2, ...)
{
  return [a1 fileURLWithString:];
}

id objc_msgSend_fillInMissingLocales_withOwnershipWarningMsg_(void *a1, const char *a2, ...)
{
  return [a1 fillInMissingLocales:withOwnershipWarningMsg:];
}

id objc_msgSend_findExtension(void *a1, const char *a2, ...)
{
  return _[a1 findExtension];
}

id objc_msgSend_findFileInCache_(void *a1, const char *a2, ...)
{
  return [a1 findFileInCache:];
}

id objc_msgSend_findMyHub_(void *a1, const char *a2, ...)
{
  return [a1 findMyHub:];
}

id objc_msgSend_findMyHubRetryAtTime(void *a1, const char *a2, ...)
{
  return _[a1 findMyHubRetryAtTime];
}

id objc_msgSend_findMyHubRetryDelay(void *a1, const char *a2, ...)
{
  return _[a1 findMyHubRetryDelay];
}

id objc_msgSend_finishStreamWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return [a1 finishStreamWithCompletionBlock:];
}

id objc_msgSend_finishedOperationContexts(void *a1, const char *a2, ...)
{
  return _[a1 finishedOperationContexts];
}

id objc_msgSend_finishedOperations(void *a1, const char *a2, ...)
{
  return _[a1 finishedOperations];
}

id objc_msgSend_fire(void *a1, const char *a2, ...)
{
  return _[a1 fire];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_flag(void *a1, const char *a2, ...)
{
  return _[a1 flag];
}

id objc_msgSend_flash_(void *a1, const char *a2, ...)
{
  return [a1 flash:];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_flushRecordsToPreferences(void *a1, const char *a2, ...)
{
  return _[a1 flushRecordsToPreferences];
}

id objc_msgSend_fmhDict(void *a1, const char *a2, ...)
{
  return _[a1 fmhDict];
}

id objc_msgSend_fmhURLOverride(void *a1, const char *a2, ...)
{
  return _[a1 fmhURLOverride];
}

id objc_msgSend_fmipWipeToken(void *a1, const char *a2, ...)
{
  return _[a1 fmipWipeToken];
}

id objc_msgSend_folder_contains_(void *a1, const char *a2, ...)
{
  return [a1 folder:contains:];
}

id objc_msgSend_forBackgroundDownload(void *a1, const char *a2, ...)
{
  return _[a1 forBackgroundDownload];
}

id objc_msgSend_forRemoval(void *a1, const char *a2, ...)
{
  return _[a1 forRemoval];
}

id objc_msgSend_forceSwitchToDemoModeIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 forceSwitchToDemoModeIfNeeded];
}

id objc_msgSend_forceSwitchToDemoUpdateModeIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 forceSwitchToDemoUpdateModeIfNeeded];
}

id objc_msgSend_forceiCloudKeychainToSyncWithServer(void *a1, const char *a2, ...)
{
  return _[a1 forceiCloudKeychainToSyncWithServer];
}

id objc_msgSend_forceiCloudKeychainToSyncWithServerAndError_(void *a1, const char *a2, ...)
{
  return [a1 forceiCloudKeychainToSyncWithServerAndError:];
}

id objc_msgSend_foregroundAllowedApps(void *a1, const char *a2, ...)
{
  return _[a1 foregroundAllowedApps];
}

id objc_msgSend_forgetAllKnownWiFiNetworksExcept_(void *a1, const char *a2, ...)
{
  return [a1 forgetAllKnownWiFiNetworksExcept:];
}

id objc_msgSend_freeRequest_forSession_(void *a1, const char *a2, ...)
{
  return [a1 freeRequest:forSession:];
}

id objc_msgSend_freezeBackgroundDownload(void *a1, const char *a2, ...)
{
  return _[a1 freezeBackgroundDownload];
}

id objc_msgSend_fullKeyList(void *a1, const char *a2, ...)
{
  return _[a1 fullKeyList];
}

id objc_msgSend_fullKeysSent(void *a1, const char *a2, ...)
{
  return _[a1 fullKeysSent];
}

id objc_msgSend_fullScreenState(void *a1, const char *a2, ...)
{
  return _[a1 fullScreenState];
}

id objc_msgSend_fullScreenUIAppId(void *a1, const char *a2, ...)
{
  return _[a1 fullScreenUIAppId];
}

id objc_msgSend_fullScreenUIAppMonitor(void *a1, const char *a2, ...)
{
  return _[a1 fullScreenUIAppMonitor];
}

id objc_msgSend_fullScreenUICanceledByUser(void *a1, const char *a2, ...)
{
  return _[a1 fullScreenUICanceledByUser];
}

id objc_msgSend_fullScreenUILaunchError_iOS(void *a1, const char *a2, ...)
{
  return [a1 fullScreenUILaunchError_iOS];
}

id objc_msgSend_generateBAACertficate_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "generateBAACertficate:");
}

id objc_msgSend_generateRandomBytesWithFixedLength(void *a1, const char *a2, ...)
{
  return _[a1 generateRandomBytesWithFixedLength];
}

id objc_msgSend_generateRandomRecoveryKey_(void *a1, const char *a2, ...)
{
  return [a1 generateRandomRecoveryKey:];
}

id objc_msgSend_generateRecoveryKeyWithError_(void *a1, const char *a2, ...)
{
  return [a1 generateRecoveryKeyWithError:];
}

id objc_msgSend_generateiCloudAccountRecoveryKeyWithError_(void *a1, const char *a2, ...)
{
  return [a1 generateiCloudAccountRecoveryKeyWithError:];
}

id objc_msgSend_getAccessControlList(void *a1, const char *a2, ...)
{
  return _[a1 getAccessControlList];
}

id objc_msgSend_getAccountSettings_(void *a1, const char *a2, ...)
{
  return [a1 getAccountSettings:];
}

id objc_msgSend_getActivePairedDevice(void *a1, const char *a2, ...)
{
  return _[a1 getActivePairedDevice];
}

id objc_msgSend_getAllComponentsForUpdate(void *a1, const char *a2, ...)
{
  return _[a1 getAllComponentsForUpdate];
}

id objc_msgSend_getAllFileHash(void *a1, const char *a2, ...)
{
  return _[a1 getAllFileHash];
}

id objc_msgSend_getAllItemsForKey_withAttributes_(void *a1, const char *a2, ...)
{
  return [a1 getAllItemsForKey:withAttributes:];
}

id objc_msgSend_getAllowedISTSignedComponents_(void *a1, const char *a2, ...)
{
  return [a1 getAllowedISTSignedComponents:];
}

id objc_msgSend_getAllowedISTSignedComponentsFromManifest_(void *a1, const char *a2, ...)
{
  return [a1 getAllowedISTSignedComponentsFromManifest:];
}

id objc_msgSend_getAllowedSymLinks(void *a1, const char *a2, ...)
{
  return _[a1 getAllowedSymLinks];
}

id objc_msgSend_getAppDependecies_(void *a1, const char *a2, ...)
{
  return [a1 getAppDependecies:];
}

id objc_msgSend_getAppFileSize_(void *a1, const char *a2, ...)
{
  return [a1 getAppFileSize:];
}

id objc_msgSend_getAppList(void *a1, const char *a2, ...)
{
  return _[a1 getAppList];
}

id objc_msgSend_getAppManifest_(void *a1, const char *a2, ...)
{
  return [a1 getAppManifest:];
}

id objc_msgSend_getAppPrivacyPermissions_(void *a1, const char *a2, ...)
{
  return [a1 getAppPrivacyPermissions:];
}

id objc_msgSend_getAppRealSize_(void *a1, const char *a2, ...)
{
  return [a1 getAppRealSize:];
}

id objc_msgSend_getAppType_(void *a1, const char *a2, ...)
{
  return [a1 getAppType:];
}

id objc_msgSend_getBackup(void *a1, const char *a2, ...)
{
  return _[a1 getBackup];
}

id objc_msgSend_getBackupItemName_(void *a1, const char *a2, ...)
{
  return [a1 getBackupItemName:];
}

id objc_msgSend_getBackupList(void *a1, const char *a2, ...)
{
  return _[a1 getBackupList];
}

id objc_msgSend_getBackupSectionName(void *a1, const char *a2, ...)
{
  return _[a1 getBackupSectionName];
}

id objc_msgSend_getBundleUpdateTime(void *a1, const char *a2, ...)
{
  return _[a1 getBundleUpdateTime];
}

id objc_msgSend_getCLPermissionForBundleID_(void *a1, const char *a2, ...)
{
  return [a1 getCLPermissionForBundleID:];
}

id objc_msgSend_getCachingHubFailureEventForPing(void *a1, const char *a2, ...)
{
  return _[a1 getCachingHubFailureEventForPing];
}

id objc_msgSend_getCellularSimInfo(void *a1, const char *a2, ...)
{
  return _[a1 getCellularSimInfo];
}

id objc_msgSend_getChannelWarningKeys_andPlaceHolderWarnings_forDeviceClass_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "getChannelWarningKeys:andPlaceHolderWarnings:forDeviceClass:");
}

id objc_msgSend_getCodeResourcesURL(void *a1, const char *a2, ...)
{
  return _[a1 getCodeResourcesURL];
}

id objc_msgSend_getComponentData_(void *a1, const char *a2, ...)
{
  return [a1 getComponentData:];
}

id objc_msgSend_getComponentFromPath_forManifestVersion_(void *a1, const char *a2, ...)
{
  return [a1 getComponentFromPath:x0 forManifestVersion:x1];
}

id objc_msgSend_getComponentProgressStatus_(void *a1, const char *a2, ...)
{
  return [a1 getComponentProgressStatus:];
}

id objc_msgSend_getComponentVersion_(void *a1, const char *a2, ...)
{
  return [a1 getComponentVersion:];
}

id objc_msgSend_getComponentsSuccessful(void *a1, const char *a2, ...)
{
  return _[a1 getComponentsSuccessful];
}

id objc_msgSend_getContentStatus(void *a1, const char *a2, ...)
{
  return _[a1 getContentStatus];
}

id objc_msgSend_getContentUpdateType(void *a1, const char *a2, ...)
{
  return _[a1 getContentUpdateType];
}

id objc_msgSend_getCoreLocationOwnedResources(void *a1, const char *a2, ...)
{
  return _[a1 getCoreLocationOwnedResources];
}

id objc_msgSend_getCountStat_inTimingData_(void *a1, const char *a2, ...)
{
  return [a1 getCountStat:inTimingData:];
}

id objc_msgSend_getCredential(void *a1, const char *a2, ...)
{
  return _[a1 getCredential];
}

id objc_msgSend_getCurrentAppUsageSessionUUID(void *a1, const char *a2, ...)
{
  return _[a1 getCurrentAppUsageSessionUUID];
}

id objc_msgSend_getCurrentDeviceLanguage(void *a1, const char *a2, ...)
{
  return _[a1 getCurrentDeviceLanguage];
}

id objc_msgSend_getCurrentDeviceLocaleCode(void *a1, const char *a2, ...)
{
  return _[a1 getCurrentDeviceLocaleCode];
}

id objc_msgSend_getCurrentDevicePreferredLanguage(void *a1, const char *a2, ...)
{
  return _[a1 getCurrentDevicePreferredLanguage];
}

id objc_msgSend_getCurrentDeviceRegion(void *a1, const char *a2, ...)
{
  return _[a1 getCurrentDeviceRegion];
}

id objc_msgSend_getCurrentLocaleCode(void *a1, const char *a2, ...)
{
  return _[a1 getCurrentLocaleCode];
}

id objc_msgSend_getCurrentWiFiSettings_(void *a1, const char *a2, ...)
{
  return [a1 getCurrentWiFiSettings:];
}

id objc_msgSend_getCurrentWiFiSignalStrength(void *a1, const char *a2, ...)
{
  return _[a1 getCurrentWiFiSignalStrength];
}

id objc_msgSend_getCurrentWiFiSsid(void *a1, const char *a2, ...)
{
  return _[a1 getCurrentWiFiSsid];
}

id objc_msgSend_getDataComponentRealSizeFromSection_forIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 getDataComponentRealSizeFromSection:forIdentifier:];
}

id objc_msgSend_getDataDictFromPayload_error_(void *a1, const char *a2, ...)
{
  return [a1 getDataDictFromPayload:x0 error:x1];
}

id objc_msgSend_getDataSectionKeys(void *a1, const char *a2, ...)
{
  return _[a1 getDataSectionKeys];
}

id objc_msgSend_getDefaultLogFolderName(void *a1, const char *a2, ...)
{
  return _[a1 getDefaultLogFolderName];
}

id objc_msgSend_getDefaultRetryDelay(void *a1, const char *a2, ...)
{
  return _[a1 getDefaultRetryDelay];
}

id objc_msgSend_getDemoBundleInfo_(void *a1, const char *a2, ...)
{
  return [a1 getDemoBundleInfo:];
}

id objc_msgSend_getDemoEnrollmentFlag(void *a1, const char *a2, ...)
{
  return _[a1 getDemoEnrollmentFlag];
}

id objc_msgSend_getDemoPreferencesLanguage(void *a1, const char *a2, ...)
{
  return _[a1 getDemoPreferencesLanguage];
}

id objc_msgSend_getDemoPreferencesRegion(void *a1, const char *a2, ...)
{
  return _[a1 getDemoPreferencesRegion];
}

id objc_msgSend_getDemoUpdateInProgress_operationAllowed_(void *a1, const char *a2, ...)
{
  return [a1 getDemoUpdateInProgress:operationAllowed:];
}

id objc_msgSend_getDeviceOptions(void *a1, const char *a2, ...)
{
  return _[a1 getDeviceOptions];
}

id objc_msgSend_getDictFromSection_forIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 getDictFromSection:forIdentifier:];
}

id objc_msgSend_getDispatchTable(void *a1, const char *a2, ...)
{
  return _[a1 getDispatchTable];
}

id objc_msgSend_getDoMigrationForTargetRelease_(void *a1, const char *a2, ...)
{
  return [a1 getDoMigrationForTargetRelease:];
}

id objc_msgSend_getDownloadFileRequestFromResponse_forFilePath_(void *a1, const char *a2, ...)
{
  return [a1 getDownloadFileRequestFromResponse:forFilePath:];
}

id objc_msgSend_getDownloadSizeBucket_(void *a1, const char *a2, ...)
{
  return [a1 getDownloadSizeBucket:];
}

id objc_msgSend_getEmbeddedSimCarrier_(void *a1, const char *a2, ...)
{
  return [a1 getEmbeddedSimCarrier:];
}

id objc_msgSend_getEndpoint(void *a1, const char *a2, ...)
{
  return _[a1 getEndpoint];
}

id objc_msgSend_getEntitlementsFrom_(void *a1, const char *a2, ...)
{
  return [a1 getEntitlementsFrom:];
}

id objc_msgSend_getExcutableURL(void *a1, const char *a2, ...)
{
  return _[a1 getExcutableURL];
}

id objc_msgSend_getExtendedAttributes(void *a1, const char *a2, ...)
{
  return _[a1 getExtendedAttributes];
}

id objc_msgSend_getFileAttributes(void *a1, const char *a2, ...)
{
  return _[a1 getFileAttributes];
}

id objc_msgSend_getFileDownloadCredential_(void *a1, const char *a2, ...)
{
  return [a1 getFileDownloadCredential:];
}

id objc_msgSend_getFileSize(void *a1, const char *a2, ...)
{
  return _[a1 getFileSize];
}

id objc_msgSend_getFileType(void *a1, const char *a2, ...)
{
  return _[a1 getFileType];
}

id objc_msgSend_getFreeSpace(void *a1, const char *a2, ...)
{
  return _[a1 getFreeSpace];
}

id objc_msgSend_getHash(void *a1, const char *a2, ...)
{
  return _[a1 getHash];
}

id objc_msgSend_getHmacKey(void *a1, const char *a2, ...)
{
  return _[a1 getHmacKey];
}

id objc_msgSend_getInfo(void *a1, const char *a2, ...)
{
  return _[a1 getInfo];
}

id objc_msgSend_getInstallationOrder(void *a1, const char *a2, ...)
{
  return _[a1 getInstallationOrder];
}

id objc_msgSend_getInternalStatus(void *a1, const char *a2, ...)
{
  return _[a1 getInternalStatus];
}

id objc_msgSend_getIpv4Interfaces(void *a1, const char *a2, ...)
{
  return _[a1 getIpv4Interfaces];
}

id objc_msgSend_getIsFileDownload(void *a1, const char *a2, ...)
{
  return _[a1 getIsFileDownload];
}

id objc_msgSend_getItemForKey_(void *a1, const char *a2, ...)
{
  return [a1 getItemForKey:];
}

id objc_msgSend_getLastBundleUpdateDate(void *a1, const char *a2, ...)
{
  return _[a1 getLastBundleUpdateDate];
}

id objc_msgSend_getLastMigrationVersion(void *a1, const char *a2, ...)
{
  return _[a1 getLastMigrationVersion];
}

id objc_msgSend_getLocaleCode(void *a1, const char *a2, ...)
{
  return _[a1 getLocaleCode];
}

id objc_msgSend_getManifestData_(void *a1, const char *a2, ...)
{
  return [a1 getManifestData:];
}

id objc_msgSend_getManifestDataFromSection_forIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 getManifestDataFromSection:x0 forIdentifier:x1];
}

id objc_msgSend_getManifestFromSection_forIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 getManifestFromSection:forIdentifier:];
}

id objc_msgSend_getManifestInfoFromSection_forIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 getManifestInfoFromSection:x0 forIdentifier:x1];
}

id objc_msgSend_getMaskValueForKey_(void *a1, const char *a2, ...)
{
  return [a1 getMaskValueForKey:];
}

id objc_msgSend_getName(void *a1, const char *a2, ...)
{
  return _[a1 getName];
}

id objc_msgSend_getNetworkAccessPermissionForBundleID_(void *a1, const char *a2, ...)
{
  return [a1 getNetworkAccessPermissionForBundleID:];
}

id objc_msgSend_getNetworkOwnedResources(void *a1, const char *a2, ...)
{
  return _[a1 getNetworkOwnedResources];
}

id objc_msgSend_getNetworkPrivacyConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 getNetworkPrivacyConfiguration];
}

id objc_msgSend_getOSUpdateRequest(void *a1, const char *a2, ...)
{
  return _[a1 getOSUpdateRequest];
}

id objc_msgSend_getOriginServerFromSection_forIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 getOriginServerFromSection:forIdentifier:];
}

id objc_msgSend_getPairedDevice(void *a1, const char *a2, ...)
{
  return _[a1 getPairedDevice];
}

id objc_msgSend_getPairedPeersWithOptions_completion_(void *a1, const char *a2, ...)
{
  return [a1 getPairedPeersWithOptions:x0 completion:x1];
}

id objc_msgSend_getPercentageProgress(void *a1, const char *a2, ...)
{
  return _[a1 getPercentageProgress];
}

id objc_msgSend_getPersistentWiFiSsid(void *a1, const char *a2, ...)
{
  return _[a1 getPersistentWiFiSsid];
}

id objc_msgSend_getPhysicalSimCarrier_(void *a1, const char *a2, ...)
{
  return [a1 getPhysicalSimCarrier:];
}

id objc_msgSend_getPostData(void *a1, const char *a2, ...)
{
  return _[a1 getPostData];
}

id objc_msgSend_getPowerMode(void *a1, const char *a2, ...)
{
  return _[a1 getPowerMode];
}

id objc_msgSend_getProfileData(void *a1, const char *a2, ...)
{
  return _[a1 getProfileData];
}

id objc_msgSend_getQueryItems(void *a1, const char *a2, ...)
{
  return _[a1 getQueryItems];
}

id objc_msgSend_getRangeHeaderForDownload(void *a1, const char *a2, ...)
{
  return _[a1 getRangeHeaderForDownload];
}

id objc_msgSend_getRealPathForFile_withMetaData_(void *a1, const char *a2, ...)
{
  return [a1 getRealPathForFile:withMetaData:];
}

id objc_msgSend_getRegistrationInfoKeys(void *a1, const char *a2, ...)
{
  return _[a1 getRegistrationInfoKeys];
}

id objc_msgSend_getRequestForTimeout_(void *a1, const char *a2, ...)
{
  return [a1 getRequestForTimeout:];
}

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return [a1 getResourceValue:forKey:error:];
}

id objc_msgSend_getResponseClass(void *a1, const char *a2, ...)
{
  return _[a1 getResponseClass];
}

id objc_msgSend_getRetailWarningKeys_andPlaceHolderWarnings_forDeviceClass_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "getRetailWarningKeys:andPlaceHolderWarnings:forDeviceClass:");
}

id objc_msgSend_getS3ServerFailureEventForPing(void *a1, const char *a2, ...)
{
  return _[a1 getS3ServerFailureEventForPing];
}

id objc_msgSend_getSavedCompleteByInterval(void *a1, const char *a2, ...)
{
  return _[a1 getSavedCompleteByInterval];
}

id objc_msgSend_getSavedError(void *a1, const char *a2, ...)
{
  return _[a1 getSavedError];
}

id objc_msgSend_getSavedFlag(void *a1, const char *a2, ...)
{
  return _[a1 getSavedFlag];
}

id objc_msgSend_getSavedRequest(void *a1, const char *a2, ...)
{
  return _[a1 getSavedRequest];
}

id objc_msgSend_getSavedValues(void *a1, const char *a2, ...)
{
  return _[a1 getSavedValues];
}

id objc_msgSend_getSecurityCheckSectionNames(void *a1, const char *a2, ...)
{
  return _[a1 getSecurityCheckSectionNames];
}

id objc_msgSend_getServerErrorMessage_withDefault_(void *a1, const char *a2, ...)
{
  return [a1 getServerErrorMessage:nil];
}

id objc_msgSend_getSessionForRequest_(void *a1, const char *a2, ...)
{
  return [a1 getSessionForRequest:];
}

id objc_msgSend_getSessionTask_(void *a1, const char *a2, ...)
{
  return [a1 getSessionTask:];
}

id objc_msgSend_getSessionWithMinRequestLoad(void *a1, const char *a2, ...)
{
  return _[a1 getSessionWithMinRequestLoad];
}

id objc_msgSend_getSettingsComponentNames(void *a1, const char *a2, ...)
{
  return _[a1 getSettingsComponentNames];
}

id objc_msgSend_getSettingsDataFromSection_forIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 getSettingsDataFromSection:x0 forIdentifier:x1];
}

id objc_msgSend_getSettingsFromSection_forIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 getSettingsFromSection:forIdentifier:];
}

id objc_msgSend_getSkyEquivalentVersion(void *a1, const char *a2, ...)
{
  return _[a1 getSkyEquivalentVersion];
}

id objc_msgSend_getStandAlonePackageFileSize_(void *a1, const char *a2, ...)
{
  return [a1 getStandAlonePackageFileSize:];
}

id objc_msgSend_getStandAlonePackageList(void *a1, const char *a2, ...)
{
  return _[a1 getStandAlonePackageList];
}

id objc_msgSend_getStandAlonePackageRealSize_(void *a1, const char *a2, ...)
{
  return [a1 getStandAlonePackageRealSize:];
}

id objc_msgSend_getStandAlonePackageVersion_(void *a1, const char *a2, ...)
{
  return [a1 getStandAlonePackageVersion:];
}

id objc_msgSend_getSupervisedRestrictions(void *a1, const char *a2, ...)
{
  return _[a1 getSupervisedRestrictions];
}

id objc_msgSend_getSydneyEquivalentVersion(void *a1, const char *a2, ...)
{
  return _[a1 getSydneyEquivalentVersion];
}

id objc_msgSend_getSystemAppDataList(void *a1, const char *a2, ...)
{
  return _[a1 getSystemAppDataList];
}

id objc_msgSend_getSystemAppDependecies_(void *a1, const char *a2, ...)
{
  return [a1 getSystemAppDependecies:];
}

id objc_msgSend_getSystemAppPrivacyPermissions_(void *a1, const char *a2, ...)
{
  return [a1 getSystemAppPrivacyPermissions:];
}

id objc_msgSend_getSystemContainerKeyword(void *a1, const char *a2, ...)
{
  return _[a1 getSystemContainerKeyword];
}

id objc_msgSend_getTCCPermissionsForBundleID_(void *a1, const char *a2, ...)
{
  return [a1 getTCCPermissionsForBundleID:];
}

id objc_msgSend_getTargetFile(void *a1, const char *a2, ...)
{
  return _[a1 getTargetFile];
}

id objc_msgSend_getTaskInState_(void *a1, const char *a2, ...)
{
  return [a1 getTaskInState:];
}

id objc_msgSend_getTccOwnedResources(void *a1, const char *a2, ...)
{
  return _[a1 getTccOwnedResources];
}

id objc_msgSend_getTimeIntervalWithStart_end_(void *a1, const char *a2, ...)
{
  return [a1 getTimeIntervalWithStart:end:];
}

id objc_msgSend_getURLSchemaList_(void *a1, const char *a2, ...)
{
  return [a1 getURLSchemaList:];
}

id objc_msgSend_getUUIDsOfInstalledProvisioningProfiles(void *a1, const char *a2, ...)
{
  return _[a1 getUUIDsOfInstalledProvisioningProfiles];
}

id objc_msgSend_getUrl(void *a1, const char *a2, ...)
{
  return _[a1 getUrl];
}

id objc_msgSend_getValueFromTestPreferencesForKey_(void *a1, const char *a2, ...)
{
  return [a1 getValueFromTestPreferencesForKey:];
}

id objc_msgSend_getVersion(void *a1, const char *a2, ...)
{
  return _[a1 getVersion];
}

id objc_msgSend_getVolume_forCategory_mode_(void *a1, const char *a2, ...)
{
  return [a1 getVolume:forCategory:mode:];
}

id objc_msgSend_getVolumeForCategory_(void *a1, const char *a2, ...)
{
  return [a1 getVolumeForCategory:];
}

id objc_msgSend_getWarningKeys_andPlaceHolderWarnings_forOwnershipWarningFlag_(void *a1, const char *a2, ...)
{
  return [a1 getWarningKeys:andPlaceHolderWarnings:forOwnershipWarningFlag:];
}

id objc_msgSend_getappIconLayoutBackupName(void *a1, const char *a2, ...)
{
  return _[a1 getappIconLayoutBackupName];
}

id objc_msgSend_grantCLPermission_toBundleID_(void *a1, const char *a2, ...)
{
  return [a1 grantCLPermission:toBundleID:];
}

id objc_msgSend_grantNetworkPermission_toBundleID_(void *a1, const char *a2, ...)
{
  return [a1 grantNetworkPermission:toBundleID:];
}

id objc_msgSend_grantPrivacyPermissions_forAppBundleID_(void *a1, const char *a2, ...)
{
  return [a1 grantPrivacyPermissions:forAppBundleID:];
}

id objc_msgSend_grantPrivacyPermissionsForAllApps(void *a1, const char *a2, ...)
{
  return _[a1 grantPrivacyPermissionsForAllApps];
}

id objc_msgSend_grantTCCPermission_forResource_toBundleID_(void *a1, const char *a2, ...)
{
  return [a1 grantTCCPermission:forResource:toBundleID:];
}

id objc_msgSend_groupContainerPaths(void *a1, const char *a2, ...)
{
  return _[a1 groupContainerPaths];
}

id objc_msgSend_groupContainerURLs(void *a1, const char *a2, ...)
{
  return _[a1 groupContainerURLs];
}

id objc_msgSend_handleCompletionForDownloadRequest_withResponse_forSession_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "handleCompletionForDownloadRequest:withResponse:forSession:");
}

id objc_msgSend_handleDownloadAborted_(void *a1, const char *a2, ...)
{
  return [a1 handleDownloadAborted:];
}

id objc_msgSend_handleDownloadFile_(void *a1, const char *a2, ...)
{
  return [a1 handleDownloadFile:];
}

id objc_msgSend_handleDownloadPaused_(void *a1, const char *a2, ...)
{
  return [a1 handleDownloadPaused:];
}

id objc_msgSend_handleEnrollmentRetryUponFirstLaunch(void *a1, const char *a2, ...)
{
  return _[a1 handleEnrollmentRetryUponFirstLaunch];
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_handleForPredicate_error_(void *a1, const char *a2, ...)
{
  return [a1 handleForPredicate:error:];
}

id objc_msgSend_handleFullScreenUIAppStateChange_withVisibility_(void *a1, const char *a2, ...)
{
  return [a1 handleFullScreenUIAppStateChange:withVisibility:];
}

id objc_msgSend_handleKVStore_(void *a1, const char *a2, ...)
{
  return [a1 handleKVStore:];
}

id objc_msgSend_handleMessage_from_(void *a1, const char *a2, ...)
{
  return [a1 handleMessage:from:];
}

id objc_msgSend_handleRequest_synchronous_(void *a1, const char *a2, ...)
{
  return [a1 handleRequest:x0 synchronous:x1];
}

id objc_msgSend_handleRequestAsync_(void *a1, const char *a2, ...)
{
  return [a1 handleRequestAsync:];
}

id objc_msgSend_handleRequestSync_(void *a1, const char *a2, ...)
{
  return [a1 handleRequestSync:];
}

id objc_msgSend_handleSystemContainerFiles_withMetadata_(void *a1, const char *a2, ...)
{
  return [a1 handleSystemContainerFiles:withMetadata:];
}

id objc_msgSend_handler(void *a1, const char *a2, ...)
{
  return _[a1 handler];
}

id objc_msgSend_hasCompletedMomentAnalysis_error_(void *a1, const char *a2, ...)
{
  return [a1 hasCompletedMomentAnalysis:error];
}

id objc_msgSend_hasCompletedRestorePostProcessing_error_(void *a1, const char *a2, ...)
{
  return [a1 hasCompletedRestorePostProcessing:error];
}

id objc_msgSend_hasFactoryContent(void *a1, const char *a2, ...)
{
  return _[a1 hasFactoryContent];
}

id objc_msgSend_hasFlashlight(void *a1, const char *a2, ...)
{
  return _[a1 hasFlashlight];
}

id objc_msgSend_hasObserver_(void *a1, const char *a2, ...)
{
  return [a1 hasObserver:];
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

id objc_msgSend_hashCheckForFile_(void *a1, const char *a2, ...)
{
  return [a1 hashCheckForFile:];
}

id objc_msgSend_hashForCertificate_(void *a1, const char *a2, ...)
{
  return [a1 hashForCertificate:];
}

id objc_msgSend_heartBeatMonitor(void *a1, const char *a2, ...)
{
  return _[a1 heartBeatMonitor];
}

id objc_msgSend_helperAgent(void *a1, const char *a2, ...)
{
  return _[a1 helperAgent];
}

id objc_msgSend_hexStringRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 hexStringRepresentation];
}

id objc_msgSend_higherVersionThan_(void *a1, const char *a2, ...)
{
  return [a1 higherVersionThan:];
}

id objc_msgSend_hmacKey(void *a1, const char *a2, ...)
{
  return _[a1 hmacKey];
}

id objc_msgSend_holdPowerAssertion(void *a1, const char *a2, ...)
{
  return _[a1 holdPowerAssertion];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return _[a1 host];
}

id objc_msgSend_httpHeaders(void *a1, const char *a2, ...)
{
  return _[a1 httpHeaders];
}

id objc_msgSend_hubCertificateIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 hubCertificateIdentifier];
}

id objc_msgSend_hubHostName(void *a1, const char *a2, ...)
{
  return _[a1 hubHostName];
}

id objc_msgSend_hubHostNameList(void *a1, const char *a2, ...)
{
  return _[a1 hubHostNameList];
}

id objc_msgSend_hubLastOnlineTime(void *a1, const char *a2, ...)
{
  return _[a1 hubLastOnlineTime];
}

id objc_msgSend_hubPort(void *a1, const char *a2, ...)
{
  return _[a1 hubPort];
}

id objc_msgSend_hubProtocolVersion(void *a1, const char *a2, ...)
{
  return _[a1 hubProtocolVersion];
}

id objc_msgSend_hubServer(void *a1, const char *a2, ...)
{
  return _[a1 hubServer];
}

id objc_msgSend_hubSuppliedSettings(void *a1, const char *a2, ...)
{
  return _[a1 hubSuppliedSettings];
}

id objc_msgSend_hubVersion(void *a1, const char *a2, ...)
{
  return _[a1 hubVersion];
}

id objc_msgSend_humanReadableUpdateName(void *a1, const char *a2, ...)
{
  return _[a1 humanReadableUpdateName];
}

id objc_msgSend_iCloudAccount(void *a1, const char *a2, ...)
{
  return _[a1 iCloudAccount];
}

id objc_msgSend_iCloudAccountRecoveryKey(void *a1, const char *a2, ...)
{
  return _[a1 iCloudAccountRecoveryKey];
}

id objc_msgSend_iCloudAccountSyncNeeded(void *a1, const char *a2, ...)
{
  return _[a1 iCloudAccountSyncNeeded];
}

id objc_msgSend_iOS(void *a1, const char *a2, ...)
{
  return _[a1 iOS];
}

id objc_msgSend_iOSHub(void *a1, const char *a2, ...)
{
  return _[a1 iOSHub];
}

id objc_msgSend_iTunesAccount(void *a1, const char *a2, ...)
{
  return _[a1 iTunesAccount];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_identifierFor_applePKI_(void *a1, const char *a2, ...)
{
  return [a1 identifierFor:applePKI:];
}

id objc_msgSend_identityForApplicationJobLabel_(void *a1, const char *a2, ...)
{
  return [a1 identityForApplicationJobLabel:];
}

id objc_msgSend_idsDeviceIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 idsDeviceIdentifier];
}

id objc_msgSend_idsHandler(void *a1, const char *a2, ...)
{
  return _[a1 idsHandler];
}

id objc_msgSend_idsIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 idsIdentifier];
}

id objc_msgSend_idsService(void *a1, const char *a2, ...)
{
  return _[a1 idsService];
}

id objc_msgSend_idsServiceQueue(void *a1, const char *a2, ...)
{
  return _[a1 idsServiceQueue];
}

id objc_msgSend_incomingResponseIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 incomingResponseIdentifier];
}

id objc_msgSend_info(void *a1, const char *a2, ...)
{
  return _[a1 info];
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return _[a1 infoDictionary];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _[a1 init];
}

id objc_msgSend_initAppPlaceholderWithBundleName_bundleID_installType_client_(void *a1, const char *a2, ...)
{
  return [a1 initAppPlaceholderWithBundleName:bundleName bundleID:bundleID installType:installType client:client];
}

id objc_msgSend_initForPrimaryiCloudAccount(void *a1, const char *a2, ...)
{
  return _[a1 initForPrimaryiCloudAccount];
}

id objc_msgSend_initFromTaskInfo_(void *a1, const char *a2, ...)
{
  return [a1 initFromTaskInfo:];
}

id objc_msgSend_initMaskValuesLookUpTable(void *a1, const char *a2, ...)
{
  return _[a1 initMaskValuesLookUpTable];
}

id objc_msgSend_initServer(void *a1, const char *a2, ...)
{
  return _[a1 initServer];
}

id objc_msgSend_initWithASCIIEncodedKey_(void *a1, const char *a2, ...)
{
  return [a1 initWithASCIIEncodedKey:];
}

id objc_msgSend_initWithAccount_(void *a1, const char *a2, ...)
{
  return [a1 initWithAccount:];
}

id objc_msgSend_initWithAccount_termsEntries_preferPassword_(void *a1, const char *a2, ...)
{
  return [a1 initWithAccount:x0 termsEntries:x1 preferPassword:x2];
}

id objc_msgSend_initWithAccountStore_(void *a1, const char *a2, ...)
{
  return [a1 initWithAccountStore:];
}

id objc_msgSend_initWithAccountType_(void *a1, const char *a2, ...)
{
  return [a1 initWithAccountType:];
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return [a1 initWithArray:];
}

id objc_msgSend_initWithAuthenticationResults_(void *a1, const char *a2, ...)
{
  return [a1 initWithAuthenticationResults:];
}

id objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return [a1 initWithBundleIdentifier:x0 allowPlaceholder:x1 error:x2];
}

id objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return [a1 initWithBytesNoCopy:x0 length:x1 freeWhenDone:x2];
}

id objc_msgSend_initWithCDPContext_(void *a1, const char *a2, ...)
{
  return [a1 initWithCDPContext:];
}

id objc_msgSend_initWithCalendarIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithCalendarIdentifier:];
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 initWithCapacity:];
}

id objc_msgSend_initWithCellularAccess_(void *a1, const char *a2, ...)
{
  return [a1 initWithCellularAccess:];
}

id objc_msgSend_initWithCellularAccess_andFDCUpdateDelegate_(void *a1, const char *a2, ...)
{
  return [a1 initWithCellularAccess:andFDCUpdateDelegate:];
}

id objc_msgSend_initWithComponents_andProcessor_(void *a1, const char *a2, ...)
{
  return [a1 initWithComponents:andProcessor:];
}

id objc_msgSend_initWithCondition_(void *a1, const char *a2, ...)
{
  return [a1 initWithCondition:];
}

id objc_msgSend_initWithContentPlistFile_(void *a1, const char *a2, ...)
{
  return [a1 initWithContentPlistFile:];
}

id objc_msgSend_initWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return [a1 initWithContentsOfFile:];
}

id objc_msgSend_initWithContentsOfURL_error_(void *a1, const char *a2, ...)
{
  return [a1 initWithContentsOfURL:error:];
}

id objc_msgSend_initWithContext_(void *a1, const char *a2, ...)
{
  return [a1 initWithContext:];
}

id objc_msgSend_initWithContext_andContentCacheManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithContext:andContentCacheManager:];
}

id objc_msgSend_initWithContext_andContentCacheManager_andTargetDevice_(void *a1, const char *a2, ...)
{
  return [a1 initWithContext:andContentCacheManager:andTargetDevice:];
}

id objc_msgSend_initWithCount_(void *a1, const char *a2, ...)
{
  return [a1 initWithCount:];
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:];
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:x0 encoding:x1];
}

id objc_msgSend_initWithData_forServerType_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:forServerType:];
}

id objc_msgSend_initWithDefaultProfile(void *a1, const char *a2, ...)
{
  return _[a1 initWithDefaultProfile];
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return [a1 initWithDelegate:];
}

id objc_msgSend_initWithDemoModeProfile(void *a1, const char *a2, ...)
{
  return _[a1 initWithDemoModeProfile];
}

id objc_msgSend_initWithDevice_andCompletion_(void *a1, const char *a2, ...)
{
  return [a1 initWithDevice:andCompletion:];
}

id objc_msgSend_initWithDeviceFeatures_(void *a1, const char *a2, ...)
{
  return [a1 initWithDeviceFeatures:];
}

id objc_msgSend_initWithDeviceProperties_(void *a1, const char *a2, ...)
{
  return [a1 initWithDeviceProperties:];
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return [a1 initWithDictionary:];
}

id objc_msgSend_initWithDictionary_andUserHomePath_(void *a1, const char *a2, ...)
{
  return [a1 initWithDictionary:andUserHomePath:];
}

id objc_msgSend_initWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 initWithDomain:x0 code:x1 userInfo:x2];
}

id objc_msgSend_initWithDomainMSDCode_message_(void *a1, const char *a2, ...)
{
  return [a1 initWithDomainMSDCode:message:];
}

id objc_msgSend_initWithDomainMSDCode_message_reason_(void *a1, const char *a2, ...)
{
  return [a1 initWithDomainMSDCode:message:reason:];
}

id objc_msgSend_initWithEnvironmentName_namedDelegatePort_queue_(void *a1, const char *a2, ...)
{
  return [a1 initWithEnvironmentName:x0 namedDelegatePort:x1 queue:x2];
}

id objc_msgSend_initWithError_(void *a1, const char *a2, ...)
{
  return [a1 initWithError:];
}

id objc_msgSend_initWithExplanation_(void *a1, const char *a2, ...)
{
  return [a1 initWithExplanation:];
}

id objc_msgSend_initWithFile_andIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithFile:andIdentifier:];
}

id objc_msgSend_initWithFilePath_(void *a1, const char *a2, ...)
{
  return [a1 initWithFilePath:];
}

id objc_msgSend_initWithFireDate_interval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return [a1 initWithFireDate:x0 interval:x1 target:x2 selector:x3 userInfo:x4 repeats:x5];
}

id objc_msgSend_initWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return [a1 initWithFormat:x0, x1];
}

id objc_msgSend_initWithIdentifier_andIsInBubble_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifier:andIsInBubble:];
}

id objc_msgSend_initWithIdentifier_andLocalizedName_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifier:andLocalizedName:];
}

id objc_msgSend_initWithIdentifier_andPayload_usingOptions_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifier:x0 andPayload:x1 usingOptions:x2];
}

id objc_msgSend_initWithIncomingOptions_(void *a1, const char *a2, ...)
{
  return [a1 initWithIncomingOptions:];
}

id objc_msgSend_initWithInnerBoundary_outerBoundary_error_(void *a1, const char *a2, ...)
{
  return [a1 initWithInnerBoundary:x0 outerBoundary:x1 error:x2];
}

id objc_msgSend_initWithLength_(void *a1, const char *a2, ...)
{
  return [a1 initWithLength:];
}

id objc_msgSend_initWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithLocaleIdentifier:];
}

id objc_msgSend_initWithMSDRapportDevice_(void *a1, const char *a2, ...)
{
  return [a1 initWithMSDRapportDevice:];
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return [a1 initWithMachServiceName:];
}

id objc_msgSend_initWithMachServiceName_options_(void *a1, const char *a2, ...)
{
  return [a1 initWithMachServiceName:x0 options:x1];
}

id objc_msgSend_initWithManifestData_(void *a1, const char *a2, ...)
{
  return [a1 initWithManifestData:];
}

id objc_msgSend_initWithMetadata_andDescriptor_(void *a1, const char *a2, ...)
{
  return [a1 initWithMetadata:andDescriptor:];
}

id objc_msgSend_initWithMode_options_reason_(void *a1, const char *a2, ...)
{
  return [a1 initWithMode:options:reason:];
}

id objc_msgSend_initWithName_andMethods_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:andMethods:];
}

id objc_msgSend_initWithName_andOperations_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:andOperations:];
}

id objc_msgSend_initWithName_client_streamingZipOptions_archiveSize_diskSpaceNeeded_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:x0 client:x1 streamingZipOptions:x2 archiveSize:x3 diskSpaceNeeded:x4];
}

id objc_msgSend_initWithName_client_transferPath_diskSpaceNeeded_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:x0 client:x1 transferPath:x2 diskSpaceNeeded:x3];
}

id objc_msgSend_initWithName_devicePresencePreset_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:devicePresencePreset:];
}

id objc_msgSend_initWithName_grade_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:grade:];
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 initWithObjects:];
}

id objc_msgSend_initWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return [a1 initWithObjectsAndKeys:];
}

id objc_msgSend_initWithObserver_(void *a1, const char *a2, ...)
{
  return [a1 initWithObserver:];
}

id objc_msgSend_initWithOperationGroups_(void *a1, const char *a2, ...)
{
  return [a1 initWithOperationGroups:];
}

id objc_msgSend_initWithOperations_(void *a1, const char *a2, ...)
{
  return [a1 initWithOperations:];
}

id objc_msgSend_initWithPath_(void *a1, const char *a2, ...)
{
  return [a1 initWithPath:];
}

id objc_msgSend_initWithPhotoLibraryURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithPhotoLibraryURL:];
}

id objc_msgSend_initWithPredicate_context_(void *a1, const char *a2, ...)
{
  return [a1 initWithPredicate:x0 context:x1];
}

id objc_msgSend_initWithPreferencesFile_(void *a1, const char *a2, ...)
{
  return [a1 initWithPreferencesFile:];
}

id objc_msgSend_initWithProtobufData_type_isResponse_(void *a1, const char *a2, ...)
{
  return [a1 initWithProtobufData:x0 type:x1 isResponse:x2];
}

id objc_msgSend_initWithQoS_(void *a1, const char *a2, ...)
{
  return [a1 initWithQoS:];
}

id objc_msgSend_initWithRPCompanionLinkDevice_(void *a1, const char *a2, ...)
{
  return [a1 initWithRPCompanionLinkDevice:];
}

id objc_msgSend_initWithRSSI_identifier_model_channel_machContinuousTimeSeconds_(void *a1, const char *a2, ...)
{
  return [a1 initWithRSSI:x0 identifier:x1 model:x2 channel:x3 machContinuousTimeSeconds:x4];
}

id objc_msgSend_initWithReason_(void *a1, const char *a2, ...)
{
  return [a1 initWithReason:];
}

id objc_msgSend_initWithSSID_password_(void *a1, const char *a2, ...)
{
  return [a1 initWithSSID:password:];
}

id objc_msgSend_initWithSceneProvidingProcess_configurationIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithSceneProvidingProcess:configurationIdentifier:];
}

id objc_msgSend_initWithService_(void *a1, const char *a2, ...)
{
  return [a1 initWithService:];
}

id objc_msgSend_initWithSignedManifest_andOptions_(void *a1, const char *a2, ...)
{
  return [a1 initWithSignedManifest:andOptions:];
}

id objc_msgSend_initWithSignedManifest_forBackgroundDownload_verifyHashBeforeStaging_(void *a1, const char *a2, ...)
{
  return [a1 initWithSignedManifest:forBackgroundDownload:verifyHashBeforeStaging:];
}

id objc_msgSend_initWithStartTime_endTime_(void *a1, const char *a2, ...)
{
  return [a1 initWithStartTime:endTime:];
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return [a1 initWithSuiteName:];
}

id objc_msgSend_initWithURL_cachePolicy_timeoutInterval_(void *a1, const char *a2, ...)
{
  return [a1 initWithURL:x0 cachePolicy:x1 timeoutInterval:x2];
}

id objc_msgSend_initWithURLString_account_(void *a1, const char *a2, ...)
{
  return [a1 initWithURLString:x0 account:x1];
}

id objc_msgSend_initWithXPCArray_(void *a1, const char *a2, ...)
{
  return [a1 initWithXPCArray:];
}

id objc_msgSend_initWithXPCDictionary_(void *a1, const char *a2, ...)
{
  return [a1 initWithXPCDictionary:];
}

id objc_msgSend_initializeCacheWithValues_(void *a1, const char *a2, ...)
{
  return [a1 initializeCacheWithValues:];
}

id objc_msgSend_initializeClearAppSwitcherStateForDemoMode(void *a1, const char *a2, ...)
{
  return _[a1 initializeClearAppSwitcherStateForDemoMode];
}

id objc_msgSend_initializeSettingsFileWithDeviceValues(void *a1, const char *a2, ...)
{
  return _[a1 initializeSettingsFileWithDeviceValues];
}

id objc_msgSend_initializeTrackerForBundle_withContentType_(void *a1, const char *a2, ...)
{
  return [a1 initializeTrackerForBundle:withContentType:];
}

id objc_msgSend_initializeWithOverwrite_(void *a1, const char *a2, ...)
{
  return [a1 initializeWithOverwrite:];
}

id objc_msgSend_initiateBackgroundDownload(void *a1, const char *a2, ...)
{
  return _[a1 initiateBackgroundDownload];
}

id objc_msgSend_inputStreamWithFileAtPath_(void *a1, const char *a2, ...)
{
  return [a1 inputStreamWithFileAtPath:];
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return [a1 insertObject:atIndex:];
}

id objc_msgSend_installAndWaitForSystemApps(void *a1, const char *a2, ...)
{
  return _[a1 installAndWaitForSystemApps];
}

id objc_msgSend_installCachedContentForCurrentLocale_(void *a1, const char *a2, ...)
{
  return [a1 installCachedContentForCurrentLocale:];
}

id objc_msgSend_installConfigurationProfile_(void *a1, const char *a2, ...)
{
  return [a1 installConfigurationProfile:];
}

id objc_msgSend_installConfigurationProfileWithData_(void *a1, const char *a2, ...)
{
  return [a1 installConfigurationProfileWithData:];
}

id objc_msgSend_installDefaultConfigurationProfile(void *a1, const char *a2, ...)
{
  return _[a1 installDefaultConfigurationProfile];
}

id objc_msgSend_installError(void *a1, const char *a2, ...)
{
  return _[a1 installError];
}

id objc_msgSend_installProfileData_outError_(void *a1, const char *a2, ...)
{
  return [a1 installProfileData:outError:];
}

id objc_msgSend_installProvisioningProfile_(void *a1, const char *a2, ...)
{
  return [a1 installProvisioningProfile:];
}

id objc_msgSend_installQueue(void *a1, const char *a2, ...)
{
  return _[a1 installQueue];
}

id objc_msgSend_installRestrictionsConfigurationProfile_(void *a1, const char *a2, ...)
{
  return [a1 installRestrictionsConfigurationProfile:];
}

id objc_msgSend_installUpdate_(void *a1, const char *a2, ...)
{
  return [a1 installUpdate:];
}

id objc_msgSend_installationOrder(void *a1, const char *a2, ...)
{
  return _[a1 installationOrder];
}

id objc_msgSend_installedApps(void *a1, const char *a2, ...)
{
  return _[a1 installedApps];
}

id objc_msgSend_installedBundle(void *a1, const char *a2, ...)
{
  return _[a1 installedBundle];
}

id objc_msgSend_installedComponentList(void *a1, const char *a2, ...)
{
  return _[a1 installedComponentList];
}

id objc_msgSend_installedFactoryBundleID(void *a1, const char *a2, ...)
{
  return _[a1 installedFactoryBundleID];
}

id objc_msgSend_installingBundle(void *a1, const char *a2, ...)
{
  return _[a1 installingBundle];
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

id objc_msgSend_interfaceName(void *a1, const char *a2, ...)
{
  return _[a1 interfaceName];
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return [a1 interfaceWithProtocol:];
}

id objc_msgSend_interval(void *a1, const char *a2, ...)
{
  return _[a1 interval];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invalidateAndCancel(void *a1, const char *a2, ...)
{
  return _[a1 invalidateAndCancel];
}

id objc_msgSend_invalidateOutgoingConnectionForDevice_(void *a1, const char *a2, ...)
{
  return [a1 invalidateOutgoingConnectionForDevice:];
}

id objc_msgSend_invalidateWithError_(void *a1, const char *a2, ...)
{
  return [a1 invalidateWithError:];
}

id objc_msgSend_invokeHandler_(void *a1, const char *a2, ...)
{
  return [a1 invokeHandler:];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return _[a1 isActive];
}

id objc_msgSend_isAllDependentInComponentCancelled(void *a1, const char *a2, ...)
{
  return _[a1 isAllDependentInComponentCancelled];
}

id objc_msgSend_isAllowedRequest_relayNeeded_(void *a1, const char *a2, ...)
{
  return [a1 isAllowedRequest:x0, x1];
}

id objc_msgSend_isAlmondApp(void *a1, const char *a2, ...)
{
  return _[a1 isAlmondApp];
}

id objc_msgSend_isBackgroundDownloadQueueEmpty(void *a1, const char *a2, ...)
{
  return _[a1 isBackgroundDownloadQueueEmpty];
}

id objc_msgSend_isBetterTogetherDemo(void *a1, const char *a2, ...)
{
  return _[a1 isBetterTogetherDemo];
}

id objc_msgSend_isBundleInstance_identicalWithNewBundle_(void *a1, const char *a2, ...)
{
  return [a1 isBundleInstance:identicalWithNewBundle:];
}

id objc_msgSend_isCDPEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isCDPEnabled];
}

id objc_msgSend_isCDPManateeAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isCDPManateeAvailable];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return _[a1 isCancelled];
}

id objc_msgSend_isChangingState(void *a1, const char *a2, ...)
{
  return _[a1 isChangingState];
}

id objc_msgSend_isConfigurationProfileInstalled_(void *a1, const char *a2, ...)
{
  return [a1 isConfigurationProfileInstalled:];
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return _[a1 isConnected];
}

id objc_msgSend_isContainerizedComponent_(void *a1, const char *a2, ...)
{
  return [a1 isContainerizedComponent:];
}

id objc_msgSend_isContentFrozen(void *a1, const char *a2, ...)
{
  return _[a1 isContentFrozen];
}

id objc_msgSend_isCoreLocationOwnedResource_(void *a1, const char *a2, ...)
{
  return [a1 isCoreLocationOwnedResource:];
}

id objc_msgSend_isCriticalUpdate(void *a1, const char *a2, ...)
{
  return _[a1 isCriticalUpdate];
}

id objc_msgSend_isDDLDevice(void *a1, const char *a2, ...)
{
  return _[a1 isDDLDevice];
}

id objc_msgSend_isDefaultPairedDevice(void *a1, const char *a2, ...)
{
  return _[a1 isDefaultPairedDevice];
}

id objc_msgSend_isDeletable(void *a1, const char *a2, ...)
{
  return _[a1 isDeletable];
}

id objc_msgSend_isDemoEligible(void *a1, const char *a2, ...)
{
  return _[a1 isDemoEligible];
}

id objc_msgSend_isDemoModeOn(void *a1, const char *a2, ...)
{
  return _[a1 isDemoModeOn];
}

id objc_msgSend_isDeviceReachable(void *a1, const char *a2, ...)
{
  return _[a1 isDeviceReachable];
}

id objc_msgSend_isDiffPatch(void *a1, const char *a2, ...)
{
  return _[a1 isDiffPatch];
}

id objc_msgSend_isDone(void *a1, const char *a2, ...)
{
  return _[a1 isDone];
}

id objc_msgSend_isDownloadComplete(void *a1, const char *a2, ...)
{
  return _[a1 isDownloadComplete];
}

id objc_msgSend_isDownloadPaused(void *a1, const char *a2, ...)
{
  return _[a1 isDownloadPaused];
}

id objc_msgSend_isEarlierDateThan_(void *a1, const char *a2, ...)
{
  return [a1 isEarlierDateThan:];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isEnabled];
}

id objc_msgSend_isEnrolled(void *a1, const char *a2, ...)
{
  return _[a1 isEnrolled];
}

id objc_msgSend_isEnrolled_(void *a1, const char *a2, ...)
{
  return [a1 isEnrolled:];
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

id objc_msgSend_isEqualToDictionary_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToDictionary:];
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToNumber:];
}

id objc_msgSend_isEqualToRPCompanionLinkDevice_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToRPCompanionLinkDevice:];
}

id objc_msgSend_isEqualToSet_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToSet:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isExpired_(void *a1, const char *a2, ...)
{
  return [a1 isExpired:];
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return _[a1 isFileURL];
}

id objc_msgSend_isHubCertificatePinnedTo_applePKI_(void *a1, const char *a2, ...)
{
  return [a1 isHubCertificatePinnedTo:applePKI];
}

id objc_msgSend_isICDPEnabledForDSID_(void *a1, const char *a2, ...)
{
  return [a1 isICDPEnabledForDSID:];
}

id objc_msgSend_isInBubble(void *a1, const char *a2, ...)
{
  return _[a1 isInBubble];
}

id objc_msgSend_isInstalled(void *a1, const char *a2, ...)
{
  return _[a1 isInstalled];
}

id objc_msgSend_isInstalledApp_(void *a1, const char *a2, ...)
{
  return [a1 isInstalledApp:];
}

id objc_msgSend_isInternalBuild(void *a1, const char *a2, ...)
{
  return _[a1 isInternalBuild];
}

id objc_msgSend_isItemApp_(void *a1, const char *a2, ...)
{
  return [a1 isItemApp:];
}

id objc_msgSend_isItemBackup_(void *a1, const char *a2, ...)
{
  return [a1 isItemBackup:];
}

id objc_msgSend_isItemBaseBackup_(void *a1, const char *a2, ...)
{
  return [a1 isItemBaseBackup:];
}

id objc_msgSend_isItemConfigurationProfile_(void *a1, const char *a2, ...)
{
  return [a1 isItemConfigurationProfile:];
}

id objc_msgSend_isItemConfigurationProfileBackup_(void *a1, const char *a2, ...)
{
  return [a1 isItemConfigurationProfileBackup:];
}

id objc_msgSend_isItemDeviceSettings_(void *a1, const char *a2, ...)
{
  return [a1 isItemDeviceSettings:];
}

id objc_msgSend_isItemProvisioningProfileBackup_(void *a1, const char *a2, ...)
{
  return [a1 isItemProvisioningProfileBackup:];
}

id objc_msgSend_isItemStandAlonePackage_(void *a1, const char *a2, ...)
{
  return [a1 isItemStandAlonePackage:];
}

id objc_msgSend_isItemSystemAppData_(void *a1, const char *a2, ...)
{
  return [a1 isItemSystemAppData:];
}

id objc_msgSend_isItemSystemContainerBackup_(void *a1, const char *a2, ...)
{
  return [a1 isItemSystemContainerBackup:];
}

id objc_msgSend_isLaterDateThan_(void *a1, const char *a2, ...)
{
  return [a1 isLaterDateThan:];
}

id objc_msgSend_isLeaf(void *a1, const char *a2, ...)
{
  return _[a1 isLeaf];
}

id objc_msgSend_isLogicSync(void *a1, const char *a2, ...)
{
  return _[a1 isLogicSync];
}

id objc_msgSend_isMacApp_(void *a1, const char *a2, ...)
{
  return [a1 isMacApp:];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return _[a1 isMainThread];
}

id objc_msgSend_isManateeAvailable_(void *a1, const char *a2, ...)
{
  return [a1 isManateeAvailable:];
}

id objc_msgSend_isManualSigning_(void *a1, const char *a2, ...)
{
  return [a1 isManualSigning:];
}

id objc_msgSend_isNPIDevice(void *a1, const char *a2, ...)
{
  return _[a1 isNPIDevice];
}

id objc_msgSend_isNetworkOwnedResource_(void *a1, const char *a2, ...)
{
  return [a1 isNetworkOwnedResource:];
}

id objc_msgSend_isOSUpdateInProgress(void *a1, const char *a2, ...)
{
  return _[a1 isOSUpdateInProgress];
}

id objc_msgSend_isOfflineMode(void *a1, const char *a2, ...)
{
  return _[a1 isOfflineMode];
}

id objc_msgSend_isOptedIn(void *a1, const char *a2, ...)
{
  return _[a1 isOptedIn];
}

id objc_msgSend_isPOSDevice(void *a1, const char *a2, ...)
{
  return _[a1 isPOSDevice];
}

id objc_msgSend_isPasscodeModificationAllowed(void *a1, const char *a2, ...)
{
  return _[a1 isPasscodeModificationAllowed];
}

id objc_msgSend_isPasscodeSet(void *a1, const char *a2, ...)
{
  return _[a1 isPasscodeSet];
}

id objc_msgSend_isPlaceholder(void *a1, const char *a2, ...)
{
  return _[a1 isPlaceholder];
}

id objc_msgSend_isPost(void *a1, const char *a2, ...)
{
  return _[a1 isPost];
}

id objc_msgSend_isPressDemoDevice(void *a1, const char *a2, ...)
{
  return _[a1 isPressDemoDevice];
}

id objc_msgSend_isPressDemoModeEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isPressDemoModeEnabled];
}

id objc_msgSend_isPrimaryBundle(void *a1, const char *a2, ...)
{
  return _[a1 isPrimaryBundle];
}

id objc_msgSend_isProfileInstalledWithIdentifier_completion_(void *a1, const char *a2, ...)
{
  return [a1 isProfileInstalledWithIdentifier:x0 completion:x1];
}

id objc_msgSend_isProvisionedForDataclass_(void *a1, const char *a2, ...)
{
  return [a1 isProvisionedForDataclass:];
}

id objc_msgSend_isProvisioningProfileInstalled_(void *a1, const char *a2, ...)
{
  return [a1 isProvisioningProfileInstalled:];
}

id objc_msgSend_isReadableFileAtPath_(void *a1, const char *a2, ...)
{
  return [a1 isReadableFileAtPath:];
}

id objc_msgSend_isRecoveryKeyAvailable_(void *a1, const char *a2, ...)
{
  return [a1 isRecoveryKeyAvailable:];
}

id objc_msgSend_isRecoveryKeyAvailableWithError_(void *a1, const char *a2, ...)
{
  return [a1 isRecoveryKeyAvailableWithError:];
}

id objc_msgSend_isRoot(void *a1, const char *a2, ...)
{
  return _[a1 isRoot];
}

id objc_msgSend_isSenderReady(void *a1, const char *a2, ...)
{
  return _[a1 isSenderReady];
}

id objc_msgSend_isStateKnown(void *a1, const char *a2, ...)
{
  return _[a1 isStateKnown];
}

id objc_msgSend_isStoreOpenNow(void *a1, const char *a2, ...)
{
  return _[a1 isStoreOpenNow];
}

id objc_msgSend_isSupportedFeatureFlag_(void *a1, const char *a2, ...)
{
  return [a1 isSupportedFeatureFlag:];
}

id objc_msgSend_isSystemContainerPath(void *a1, const char *a2, ...)
{
  return _[a1 isSystemContainerPath];
}

id objc_msgSend_isSystemContainerShared(void *a1, const char *a2, ...)
{
  return _[a1 isSystemContainerShared];
}

id objc_msgSend_isTccOwnedResource_(void *a1, const char *a2, ...)
{
  return [a1 isTccOwnedResource:];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return _[a1 isValid];
}

id objc_msgSend_isValidDataContainerFile_(void *a1, const char *a2, ...)
{
  return [a1 isValidDataContainerFile:];
}

id objc_msgSend_isValidForOriginServer_(void *a1, const char *a2, ...)
{
  return [a1 isValidForOriginServer:];
}

id objc_msgSend_isValidJSONObject_(void *a1, const char *a2, ...)
{
  return [a1 isValidJSONObject:];
}

id objc_msgSend_isValidProductList_(void *a1, const char *a2, ...)
{
  return [a1 isValidProductList:];
}

id objc_msgSend_isValidWiFiSettings_(void *a1, const char *a2, ...)
{
  return [a1 isValidWiFiSettings:];
}

id objc_msgSend_isVerifiedDemoDevice(void *a1, const char *a2, ...)
{
  return _[a1 isVerifiedDemoDevice];
}

id objc_msgSend_isVerifiedPOSDevice(void *a1, const char *a2, ...)
{
  return _[a1 isVerifiedPOSDevice];
}

id objc_msgSend_isVersion_lowerThan_(void *a1, const char *a2, ...)
{
  return [a1 isVersion:lowerThan:];
}

id objc_msgSend_itemBeingInstalled(void *a1, const char *a2, ...)
{
  return _[a1 itemBeingInstalled];
}

id objc_msgSend_justBootUp(void *a1, const char *a2, ...)
{
  return _[a1 justBootUp];
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return _[a1 key];
}

id objc_msgSend_keyPathForBatteryLevel(void *a1, const char *a2, ...)
{
  return _[a1 keyPathForBatteryLevel];
}

id objc_msgSend_keyPathForBatteryStateDataDictionary(void *a1, const char *a2, ...)
{
  return _[a1 keyPathForBatteryStateDataDictionary];
}

id objc_msgSend_keyPathForForegroundApp(void *a1, const char *a2, ...)
{
  return _[a1 keyPathForForegroundApp];
}

id objc_msgSend_keyPathForInUseStatus(void *a1, const char *a2, ...)
{
  return _[a1 keyPathForInUseStatus];
}

id objc_msgSend_keyPathForLastUseDate(void *a1, const char *a2, ...)
{
  return _[a1 keyPathForLastUseDate];
}

id objc_msgSend_kickOffBackgroundDownload(void *a1, const char *a2, ...)
{
  return _[a1 kickOffBackgroundDownload];
}

id objc_msgSend_kickOffCachedBundleInstall(void *a1, const char *a2, ...)
{
  return _[a1 kickOffCachedBundleInstall];
}

id objc_msgSend_knownNetworkProfile(void *a1, const char *a2, ...)
{
  return _[a1 knownNetworkProfile];
}

id objc_msgSend_knownNetworkProfilesWithProperties_(void *a1, const char *a2, ...)
{
  return [a1 knownNetworkProfilesWithProperties:];
}

id objc_msgSend_language(void *a1, const char *a2, ...)
{
  return _[a1 language];
}

id objc_msgSend_languageIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 languageIdentifier];
}

id objc_msgSend_languageIdentifiersForMetadataList_(void *a1, const char *a2, ...)
{
  return [a1 languageIdentifiersForMetadataList:];
}

id objc_msgSend_lastBundleUpdateDate(void *a1, const char *a2, ...)
{
  return _[a1 lastBundleUpdateDate];
}

id objc_msgSend_lastDownloadedByte(void *a1, const char *a2, ...)
{
  return _[a1 lastDownloadedByte];
}

id objc_msgSend_lastJoinedAt(void *a1, const char *a2, ...)
{
  return _[a1 lastJoinedAt];
}

id objc_msgSend_lastJoinedWiFiNetworksProfile(void *a1, const char *a2, ...)
{
  return _[a1 lastJoinedWiFiNetworksProfile];
}

id objc_msgSend_lastMigrationVersion(void *a1, const char *a2, ...)
{
  return _[a1 lastMigrationVersion];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_lastRebootTime(void *a1, const char *a2, ...)
{
  return _[a1 lastRebootTime];
}

id objc_msgSend_lastSeenDate(void *a1, const char *a2, ...)
{
  return _[a1 lastSeenDate];
}

id objc_msgSend_lastSettingsUpdatedTime(void *a1, const char *a2, ...)
{
  return _[a1 lastSettingsUpdatedTime];
}

id objc_msgSend_lastShallowRefreshTime(void *a1, const char *a2, ...)
{
  return _[a1 lastShallowRefreshTime];
}

id objc_msgSend_lastSnapshotRevertTime(void *a1, const char *a2, ...)
{
  return _[a1 lastSnapshotRevertTime];
}

id objc_msgSend_laterDate_(void *a1, const char *a2, ...)
{
  return [a1 laterDate:];
}

id objc_msgSend_latestUpdate(void *a1, const char *a2, ...)
{
  return _[a1 latestUpdate];
}

id objc_msgSend_latitude(void *a1, const char *a2, ...)
{
  return _[a1 latitude];
}

id objc_msgSend_launch(void *a1, const char *a2, ...)
{
  return _[a1 launch];
}

id objc_msgSend_launchApp_withOptions_outError_(void *a1, const char *a2, ...)
{
  return [a1 launchApp:withOptions:outError:];
}

id objc_msgSend_launchDaemon(void *a1, const char *a2, ...)
{
  return _[a1 launchDaemon];
}

id objc_msgSend_launchFullScreenUI(void *a1, const char *a2, ...)
{
  return _[a1 launchFullScreenUI];
}

id objc_msgSend_launchFullScreenUI_ios(void *a1, const char *a2, ...)
{
  return [a1 launchFullScreenUI_ios];
}

id objc_msgSend_launchPath(void *a1, const char *a2, ...)
{
  return _[a1 launchPath];
}

id objc_msgSend_launchReason(void *a1, const char *a2, ...)
{
  return _[a1 launchReason];
}

id objc_msgSend_launchRequest_toSession_(void *a1, const char *a2, ...)
{
  return [a1 launchRequest:toSession:];
}

id objc_msgSend_launchTaskWithInfo_(void *a1, const char *a2, ...)
{
  return [a1 launchTaskWithInfo:];
}

id objc_msgSend_launchTaskWithRequest_(void *a1, const char *a2, ...)
{
  return [a1 launchTaskWithRequest:];
}

id objc_msgSend_launchType(void *a1, const char *a2, ...)
{
  return _[a1 launchType];
}

id objc_msgSend_leafCertificate(void *a1, const char *a2, ...)
{
  return _[a1 leafCertificate];
}

id objc_msgSend_leafOperations(void *a1, const char *a2, ...)
{
  return _[a1 leafOperations];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_limitConcurrentRequests(void *a1, const char *a2, ...)
{
  return _[a1 limitConcurrentRequests];
}

id objc_msgSend_listenForIncomingEventMessageOfID_(void *a1, const char *a2, ...)
{
  return [a1 listenForIncomingEventMessageOfID:];
}

id objc_msgSend_listenForIncomingRequestMessageOfID_(void *a1, const char *a2, ...)
{
  return [a1 listenForIncomingRequestMessageOfID:];
}

id objc_msgSend_listenerRPClient(void *a1, const char *a2, ...)
{
  return _[a1 listenerRPClient];
}

id objc_msgSend_load(void *a1, const char *a2, ...)
{
  return _[a1 load];
}

id objc_msgSend_loadAppPatchesList(void *a1, const char *a2, ...)
{
  return _[a1 loadAppPatchesList];
}

id objc_msgSend_loadBundles(void *a1, const char *a2, ...)
{
  return _[a1 loadBundles];
}

id objc_msgSend_loadConfigurationsWithCompletionQueue_handler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "loadConfigurationsWithCompletionQueue:handler:");
}

id objc_msgSend_loadFromFile(void *a1, const char *a2, ...)
{
  return _[a1 loadFromFile];
}

id objc_msgSend_loadManifestMetadata_(void *a1, const char *a2, ...)
{
  return [a1 loadManifestMetadata:];
}

id objc_msgSend_loadProvisioningProfileFromFile_(void *a1, const char *a2, ...)
{
  return [a1 loadProvisioningProfileFromFile:];
}

id objc_msgSend_loadStashedSwitcherModelFromPath_(void *a1, const char *a2, ...)
{
  return [a1 loadStashedSwitcherModelFromPath:];
}

id objc_msgSend_loadWiFiSettingsFromPreferences(void *a1, const char *a2, ...)
{
  return _[a1 loadWiFiSettingsFromPreferences];
}

id objc_msgSend_localCredential(void *a1, const char *a2, ...)
{
  return _[a1 localCredential];
}

id objc_msgSend_localCredentialForOriginServer_(void *a1, const char *a2, ...)
{
  return [a1 localCredentialForOriginServer:];
}

id objc_msgSend_localDevice(void *a1, const char *a2, ...)
{
  return _[a1 localDevice];
}

id objc_msgSend_localHubError(void *a1, const char *a2, ...)
{
  return _[a1 localHubError];
}

id objc_msgSend_localHubFailureReason(void *a1, const char *a2, ...)
{
  return _[a1 localHubFailureReason];
}

id objc_msgSend_localHubReachable(void *a1, const char *a2, ...)
{
  return _[a1 localHubReachable];
}

id objc_msgSend_localHubURLSchema(void *a1, const char *a2, ...)
{
  return _[a1 localHubURLSchema];
}

id objc_msgSend_localSecret(void *a1, const char *a2, ...)
{
  return _[a1 localSecret];
}

id objc_msgSend_localURLList(void *a1, const char *a2, ...)
{
  return _[a1 localURLList];
}

id objc_msgSend_localWakingRegistrationWithIdentifier_contextualPredicate_callback_(void *a1, const char *a2, ...)
{
  return [a1 localWakingRegistrationWithIdentifier:x0 contextualPredicate:x1 callback:x2];
}

id objc_msgSend_localizationTable(void *a1, const char *a2, ...)
{
  return _[a1 localizationTable];
}

id objc_msgSend_localizations(void *a1, const char *a2, ...)
{
  return _[a1 localizations];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_localizedFailureReason(void *a1, const char *a2, ...)
{
  return _[a1 localizedFailureReason];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return _[a1 localizedName];
}

id objc_msgSend_localizedStringForKey_value_table_localization_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringForKey:x0 value:x1 table:x2 localization:x3];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return _[a1 lock];
}

id objc_msgSend_lockSnapshot(void *a1, const char *a2, ...)
{
  return _[a1 lockSnapshot];
}

id objc_msgSend_lockWhenCondition_beforeDate_(void *a1, const char *a2, ...)
{
  return [a1 lockWhenCondition:beforeDate:];
}

id objc_msgSend_logCache(void *a1, const char *a2, ...)
{
  return _[a1 logCache];
}

id objc_msgSend_logDownloadTaskLaunch_(void *a1, const char *a2, ...)
{
  return [a1 logDownloadTaskLaunch:];
}

id objc_msgSend_logFP(void *a1, const char *a2, ...)
{
  return _[a1 logFP];
}

id objc_msgSend_logFilePath(void *a1, const char *a2, ...)
{
  return _[a1 logFilePath];
}

id objc_msgSend_logMessage_(void *a1, const char *a2, ...)
{
  return [a1 logMessage:];
}

id objc_msgSend_logWithFormat_andArgs_(void *a1, const char *a2, ...)
{
  return [a1 logWithFormat:andArgs:];
}

id objc_msgSend_logicSync(void *a1, const char *a2, ...)
{
  return _[a1 logicSync];
}

id objc_msgSend_loginID(void *a1, const char *a2, ...)
{
  return _[a1 loginID];
}

id objc_msgSend_logsToWrite(void *a1, const char *a2, ...)
{
  return _[a1 logsToWrite];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return _[a1 longValue];
}

id objc_msgSend_longitude(void *a1, const char *a2, ...)
{
  return _[a1 longitude];
}

id objc_msgSend_lookupSystemContainerPathUUID(void *a1, const char *a2, ...)
{
  return _[a1 lookupSystemContainerPathUUID];
}

id objc_msgSend_lostClientConnection_(void *a1, const char *a2, ...)
{
  return [a1 lostClientConnection:];
}

id objc_msgSend_lowerVersionThan_(void *a1, const char *a2, ...)
{
  return [a1 lowerVersionThan:];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseString];
}

id objc_msgSend_macOS(void *a1, const char *a2, ...)
{
  return _[a1 macOS];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return _[a1 mainQueue];
}

id objc_msgSend_manageDataVolume_(void *a1, const char *a2, ...)
{
  return [a1 manageDataVolume:];
}

id objc_msgSend_manageDemoVolume_(void *a1, const char *a2, ...)
{
  return [a1 manageDemoVolume:];
}

id objc_msgSend_manageDeviceSnapshot_(void *a1, const char *a2, ...)
{
  return [a1 manageDeviceSnapshot:];
}

id objc_msgSend_manageUserVolume_(void *a1, const char *a2, ...)
{
  return [a1 manageUserVolume:];
}

id objc_msgSend_manageUserVolume_forUser_(void *a1, const char *a2, ...)
{
  return [a1 manageUserVolume:forUser:];
}

id objc_msgSend_managedStoreDemoMode(void *a1, const char *a2, ...)
{
  return _[a1 managedStoreDemoMode];
}

id objc_msgSend_manager(void *a1, const char *a2, ...)
{
  return _[a1 manager];
}

id objc_msgSend_manifestAndFileDownloadInfoPath(void *a1, const char *a2, ...)
{
  return _[a1 manifestAndFileDownloadInfoPath];
}

id objc_msgSend_manifestInfo(void *a1, const char *a2, ...)
{
  return _[a1 manifestInfo];
}

id objc_msgSend_manifestPath(void *a1, const char *a2, ...)
{
  return _[a1 manifestPath];
}

id objc_msgSend_manifestVerifier(void *a1, const char *a2, ...)
{
  return _[a1 manifestVerifier];
}

id objc_msgSend_manifestVersion(void *a1, const char *a2, ...)
{
  return _[a1 manifestVersion];
}

id objc_msgSend_manualUpdateMode_allowChange_(void *a1, const char *a2, ...)
{
  return [a1 manualUpdateMode:allowChange:];
}

id objc_msgSend_markAsNotDemo_(void *a1, const char *a2, ...)
{
  return [a1 markAsNotDemo:];
}

id objc_msgSend_markAsNotDemoWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 markAsNotDemoWithCompletion:];
}

id objc_msgSend_markBundleInProgressAsBundleCompleted(void *a1, const char *a2, ...)
{
  return _[a1 markBundleInProgressAsBundleCompleted];
}

id objc_msgSend_markBundleInProgressAsCompleted(void *a1, const char *a2, ...)
{
  return _[a1 markBundleInProgressAsCompleted];
}

id objc_msgSend_markContentInstallingInstalled(void *a1, const char *a2, ...)
{
  return _[a1 markContentInstallingInstalled];
}

id objc_msgSend_maskValuesLookUpTable(void *a1, const char *a2, ...)
{
  return _[a1 maskValuesLookUpTable];
}

id objc_msgSend_masterManifest(void *a1, const char *a2, ...)
{
  return _[a1 masterManifest];
}

id objc_msgSend_matchExtension(void *a1, const char *a2, ...)
{
  return _[a1 matchExtension];
}

id objc_msgSend_matchSigningIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 matchSigningIdentifier];
}

id objc_msgSend_matchedLanguagesFromAvailableLanguages_forPreferredLanguages_(void *a1, const char *a2, ...)
{
  return [a1 matchedLanguagesFromAvailableLanguages:forPreferredLanguages:];
}

id objc_msgSend_maxConcurrentRequests(void *a1, const char *a2, ...)
{
  return _[a1 maxConcurrentRequests];
}

id objc_msgSend_maxRetry(void *a1, const char *a2, ...)
{
  return _[a1 maxRetry];
}

id objc_msgSend_maxStoreResults(void *a1, const char *a2, ...)
{
  return _[a1 maxStoreResults];
}

id objc_msgSend_mergedBackupManifest_(void *a1, const char *a2, ...)
{
  return [a1 mergedBackupManifest:];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return _[a1 message];
}

id objc_msgSend_messageHandlerTable(void *a1, const char *a2, ...)
{
  return _[a1 messageHandlerTable];
}

id objc_msgSend_messageQueue(void *a1, const char *a2, ...)
{
  return _[a1 messageQueue];
}

id objc_msgSend_metadataForFile_(void *a1, const char *a2, ...)
{
  return [a1 metadataForFile:];
}

id objc_msgSend_metadataWithLanugageIdentifier_fromList_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "metadataWithLanugageIdentifier:fromList:");
}

id objc_msgSend_methodForSelector_(void *a1, const char *a2, ...)
{
  return [a1 methodForSelector:];
}

id objc_msgSend_methodSelectors(void *a1, const char *a2, ...)
{
  return _[a1 methodSelectors];
}

id objc_msgSend_migrateCellularSupportFlag(void *a1, const char *a2, ...)
{
  return _[a1 migrateCellularSupportFlag];
}

id objc_msgSend_migrateDataWithBlockingUI_startMigration_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "migrateDataWithBlockingUI:startMigration:");
}

id objc_msgSend_migrateDemoDeviceToDemoVolume(void *a1, const char *a2, ...)
{
  return _[a1 migrateDemoDeviceToDemoVolume];
}

id objc_msgSend_migrateNvramToDemoVolume(void *a1, const char *a2, ...)
{
  return _[a1 migrateNvramToDemoVolume];
}

id objc_msgSend_migratePreferenceAndWifiSettingsToDemoVolume(void *a1, const char *a2, ...)
{
  return _[a1 migratePreferenceAndWifiSettingsToDemoVolume];
}

id objc_msgSend_migratePreferencesFromFactoryDevicesIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 migratePreferencesFromFactoryDevicesIfNeeded];
}

id objc_msgSend_migratePreferencesFromLegacyDevicesIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 migratePreferencesFromLegacyDevicesIfNeeded];
}

id objc_msgSend_migrationDone(void *a1, const char *a2, ...)
{
  return _[a1 migrationDone];
}

id objc_msgSend_minOSVersionAvailable(void *a1, const char *a2, ...)
{
  return _[a1 minOSVersionAvailable];
}

id objc_msgSend_minusSet_(void *a1, const char *a2, ...)
{
  return [a1 minusSet:];
}

id objc_msgSend_mockAccountSettingsFile(void *a1, const char *a2, ...)
{
  return _[a1 mockAccountSettingsFile];
}

id objc_msgSend_mockForBetterTogetherDemo(void *a1, const char *a2, ...)
{
  return _[a1 mockForBetterTogetherDemo];
}

id objc_msgSend_mockOSUpdateRequestFile(void *a1, const char *a2, ...)
{
  return _[a1 mockOSUpdateRequestFile];
}

id objc_msgSend_mockPeerProtocolVersion(void *a1, const char *a2, ...)
{
  return _[a1 mockPeerProtocolVersion];
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return _[a1 mode];
}

id objc_msgSend_modeLock(void *a1, const char *a2, ...)
{
  return _[a1 modeLock];
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return _[a1 model];
}

id objc_msgSend_modificationDate(void *a1, const char *a2, ...)
{
  return _[a1 modificationDate];
}

id objc_msgSend_monitorDidUpdateRegionOfNearbyObject_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "monitorDidUpdateRegionOfNearbyObject:");
}

id objc_msgSend_monitorWithConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 monitorWithConfiguration:];
}

id objc_msgSend_month(void *a1, const char *a2, ...)
{
  return _[a1 month];
}

id objc_msgSend_moveFilesToFinalDst_finalPath_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "moveFilesToFinalDst:finalPath:");
}

id objc_msgSend_moveItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "moveItemAtPath:toPath:error:");
}

id objc_msgSend_moveStagingToFinal_finalPath_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "moveStagingToFinal:finalPath:");
}

id objc_msgSend_moveStagingsToFinal_finalPath_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "moveStagingsToFinal:finalPath:");
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return _[a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_nandSize(void *a1, const char *a2, ...)
{
  return _[a1 nandSize];
}

id objc_msgSend_nearbyObjectMonitor(void *a1, const char *a2, ...)
{
  return _[a1 nearbyObjectMonitor];
}

id objc_msgSend_nearbyObjects(void *a1, const char *a2, ...)
{
  return _[a1 nearbyObjects];
}

id objc_msgSend_needUpdate(void *a1, const char *a2, ...)
{
  return _[a1 needUpdate];
}

id objc_msgSend_networkName(void *a1, const char *a2, ...)
{
  return _[a1 networkName];
}

id objc_msgSend_networkOwnedResources(void *a1, const char *a2, ...)
{
  return _[a1 networkOwnedResources];
}

id objc_msgSend_newDateByAddingOneDay(void *a1, const char *a2, ...)
{
  return _[a1 newDateByAddingOneDay];
}

id objc_msgSend_newDateByAddingOneWeek(void *a1, const char *a2, ...)
{
  return _[a1 newDateByAddingOneWeek];
}

id objc_msgSend_newHandleWithDefinition_configurationContext_(void *a1, const char *a2, ...)
{
  return [a1 newHandleWithDefinition:configurationContext:];
}

id objc_msgSend_nextContentRevertDate(void *a1, const char *a2, ...)
{
  return _[a1 nextContentRevertDate];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return _[a1 nextObject];
}

id objc_msgSend_nextRetryTime(void *a1, const char *a2, ...)
{
  return _[a1 nextRetryTime];
}

id objc_msgSend_nextStoreClosedDate(void *a1, const char *a2, ...)
{
  return _[a1 nextStoreClosedDate];
}

id objc_msgSend_nextStoreOpenDate(void *a1, const char *a2, ...)
{
  return _[a1 nextStoreOpenDate];
}

id objc_msgSend_nextTry(void *a1, const char *a2, ...)
{
  return _[a1 nextTry];
}

id objc_msgSend_niSession(void *a1, const char *a2, ...)
{
  return _[a1 niSession];
}

id objc_msgSend_nonContainerizedContentRoots(void *a1, const char *a2, ...)
{
  return _[a1 nonContainerizedContentRoots];
}

id objc_msgSend_notifyBluetoothSample_(void *a1, const char *a2, ...)
{
  return [a1 notifyBluetoothSample:];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _[a1 now];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numConcurrentRequests(void *a1, const char *a2, ...)
{
  return _[a1 numConcurrentRequests];
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

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithLongLong:];
}

id objc_msgSend_numberWithUnsignedChar_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedChar:];
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInteger:];
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedLongLong:];
}

id objc_msgSend_objCType(void *a1, const char *a2, ...)
{
  return _[a1 objCType];
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

id objc_msgSend_objectForKey_ofType_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:ofType:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_obliterate(void *a1, const char *a2, ...)
{
  return _[a1 obliterate];
}

id objc_msgSend_obliterateDeviceWithAdminCredential_(void *a1, const char *a2, ...)
{
  return [a1 obliterateDeviceWithAdminCredential:];
}

id objc_msgSend_observer(void *a1, const char *a2, ...)
{
  return _[a1 observer];
}

id objc_msgSend_observers(void *a1, const char *a2, ...)
{
  return _[a1 observers];
}

id objc_msgSend_offlineDuration(void *a1, const char *a2, ...)
{
  return _[a1 offlineDuration];
}

id objc_msgSend_offsetInFile(void *a1, const char *a2, ...)
{
  return _[a1 offsetInFile];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return _[a1 open];
}

id objc_msgSend_openApplication_withOptions_completion_(void *a1, const char *a2, ...)
{
  return [a1 openApplication:withOptions:completion:];
}

id objc_msgSend_openDate(void *a1, const char *a2, ...)
{
  return _[a1 openDate];
}

id objc_msgSend_openSessionsFromBookmark_(void *a1, const char *a2, ...)
{
  return [a1 openSessionsFromBookmark:];
}

id objc_msgSend_operatingSystemVersion(void *a1, const char *a2, ...)
{
  return _[a1 operatingSystemVersion];
}

id objc_msgSend_operation_didProduceNewOperation_forRollback_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "operation:didProduceNewOperation:forRollback:");
}

id objc_msgSend_operationCanceled(void *a1, const char *a2, ...)
{
  return _[a1 operationCanceled];
}

id objc_msgSend_operationDidStart_(void *a1, const char *a2, ...)
{
  return [a1 operationDidStart:];
}

id objc_msgSend_operationQueue(void *a1, const char *a2, ...)
{
  return _[a1 operationQueue];
}

id objc_msgSend_operationWillFinish_(void *a1, const char *a2, ...)
{
  return [a1 operationWillFinish:];
}

id objc_msgSend_operations(void *a1, const char *a2, ...)
{
  return _[a1 operations];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _[a1 options];
}

id objc_msgSend_optionsWithDictionary_(void *a1, const char *a2, ...)
{
  return [a1 optionsWithDictionary:];
}

id objc_msgSend_originServer(void *a1, const char *a2, ...)
{
  return _[a1 originServer];
}

id objc_msgSend_originServerForApp_(void *a1, const char *a2, ...)
{
  return [a1 originServerForApp:];
}

id objc_msgSend_originServerForBackupManifest_(void *a1, const char *a2, ...)
{
  return [a1 originServerForBackupManifest:];
}

id objc_msgSend_osVersion(void *a1, const char *a2, ...)
{
  return _[a1 osVersion];
}

id objc_msgSend_osVersionStr(void *a1, const char *a2, ...)
{
  return _[a1 osVersionStr];
}

id objc_msgSend_outData(void *a1, const char *a2, ...)
{
  return _[a1 outData];
}

id objc_msgSend_outputDevices(void *a1, const char *a2, ...)
{
  return _[a1 outputDevices];
}

id objc_msgSend_overrideHmacKey_(void *a1, const char *a2, ...)
{
  return [a1 overrideHmacKey:];
}

id objc_msgSend_packageVersion(void *a1, const char *a2, ...)
{
  return _[a1 packageVersion];
}

id objc_msgSend_packetLoss(void *a1, const char *a2, ...)
{
  return _[a1 packetLoss];
}

id objc_msgSend_paired(void *a1, const char *a2, ...)
{
  return _[a1 paired];
}

id objc_msgSend_pairingCredentials(void *a1, const char *a2, ...)
{
  return _[a1 pairingCredentials];
}

id objc_msgSend_pairingHandlers(void *a1, const char *a2, ...)
{
  return _[a1 pairingHandlers];
}

id objc_msgSend_pairingManager(void *a1, const char *a2, ...)
{
  return _[a1 pairingManager];
}

id objc_msgSend_pairingMode(void *a1, const char *a2, ...)
{
  return _[a1 pairingMode];
}

id objc_msgSend_pairingPassword(void *a1, const char *a2, ...)
{
  return _[a1 pairingPassword];
}

id objc_msgSend_parallelInstallQueue(void *a1, const char *a2, ...)
{
  return _[a1 parallelInstallQueue];
}

id objc_msgSend_parallelProcessing(void *a1, const char *a2, ...)
{
  return _[a1 parallelProcessing];
}

id objc_msgSend_parseBundleID_(void *a1, const char *a2, ...)
{
  return [a1 parseBundleID:];
}

id objc_msgSend_parseInstallationOrder(void *a1, const char *a2, ...)
{
  return _[a1 parseInstallationOrder];
}

id objc_msgSend_parseLocaleCode(void *a1, const char *a2, ...)
{
  return _[a1 parseLocaleCode];
}

id objc_msgSend_parseNonContainerizedContentRootSet(void *a1, const char *a2, ...)
{
  return _[a1 parseNonContainerizedContentRootSet];
}

id objc_msgSend_parseRawStoreHours_(void *a1, const char *a2, ...)
{
  return [a1 parseRawStoreHours:];
}

id objc_msgSend_parseResponseForError_andPayload_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "parseResponseForError:andPayload:");
}

id objc_msgSend_parseResponseHeader_statusCode_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "parseResponseHeader:statusCode:");
}

id objc_msgSend_parseSectionForContentRoot_(void *a1, const char *a2, ...)
{
  return [a1 parseSectionForContentRoot:];
}

id objc_msgSend_password(void *a1, const char *a2, ...)
{
  return _[a1 password];
}

id objc_msgSend_patchBackupFolderInStaging_(void *a1, const char *a2, ...)
{
  return [a1 patchBackupFolderInStaging:];
}

id objc_msgSend_patchDomainsPlist_(void *a1, const char *a2, ...)
{
  return [a1 patchDomainsPlist:];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_path_inSuperSet_(void *a1, const char *a2, ...)
{
  return [a1 path:inSuperSet:];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return _[a1 pathComponents];
}

id objc_msgSend_pathController(void *a1, const char *a2, ...)
{
  return _[a1 pathController];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return _[a1 pathExtension];
}

id objc_msgSend_pathForDummyPreferenceFile(void *a1, const char *a2, ...)
{
  return _[a1 pathForDummyPreferenceFile];
}

id objc_msgSend_pathForResource_ofType_inDirectory_forLocalization_(void *a1, const char *a2, ...)
{
  return [a1 pathForResource:x0 ofType:x1 inDirectory:x2 forLocalization:x3];
}

id objc_msgSend_pathRules(void *a1, const char *a2, ...)
{
  return _[a1 pathRules];
}

id objc_msgSend_pathWithComponents_(void *a1, const char *a2, ...)
{
  return [a1 pathWithComponents:];
}

id objc_msgSend_pauseContentUpdateOnError(void *a1, const char *a2, ...)
{
  return _[a1 pauseContentUpdateOnError];
}

id objc_msgSend_pauseProcessing(void *a1, const char *a2, ...)
{
  return _[a1 pauseProcessing];
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return _[a1 payload];
}

id objc_msgSend_pendingComponents(void *a1, const char *a2, ...)
{
  return _[a1 pendingComponents];
}

id objc_msgSend_pendingMessage(void *a1, const char *a2, ...)
{
  return _[a1 pendingMessage];
}

id objc_msgSend_pendingRequests(void *a1, const char *a2, ...)
{
  return _[a1 pendingRequests];
}

id objc_msgSend_percentComplete(void *a1, const char *a2, ...)
{
  return _[a1 percentComplete];
}

id objc_msgSend_percentageProgress(void *a1, const char *a2, ...)
{
  return _[a1 percentageProgress];
}

id objc_msgSend_performCryptoWithSecretKeyOnData_isDecipher_(void *a1, const char *a2, ...)
{
  return [a1 performCryptoWithSecretKeyOnData:isDecipher:];
}

id objc_msgSend_performRequestWithHandler_(void *a1, const char *a2, ...)
{
  return [a1 performRequestWithHandler:];
}

id objc_msgSend_performScanWithParameters_error_(void *a1, const char *a2, ...)
{
  return [a1 performScanWithParameters:x0 error:x1];
}

id objc_msgSend_performiCloudAccountSignInWithContext_outError_(void *a1, const char *a2, ...)
{
  return [a1 performiCloudAccountSignInWithContext:x0 outError:x1];
}

id objc_msgSend_performiCloudAccountSignOutWithContext_outError_(void *a1, const char *a2, ...)
{
  return [a1 performiCloudAccountSignOutWithContext:x0 outError:x1];
}

id objc_msgSend_performiTunesAccountSignInWithContext_outError_(void *a1, const char *a2, ...)
{
  return [a1 performiTunesAccountSignInWithContext:x0 outError:x1];
}

id objc_msgSend_performiTunesAccountSignOutWithContext_outError_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "performiTunesAccountSignOutWithContext:outError:");
}

id objc_msgSend_phase(void *a1, const char *a2, ...)
{
  return _[a1 phase];
}

id objc_msgSend_ping_(void *a1, const char *a2, ...)
{
  return [a1 ping:];
}

id objc_msgSend_pingAndProcess_waitForCompletion_(void *a1, const char *a2, ...)
{
  return [a1 pingAndProcess:waitForCompletion:];
}

id objc_msgSend_pingInterval(void *a1, const char *a2, ...)
{
  return _[a1 pingInterval];
}

id objc_msgSend_pingIntervalToUse(void *a1, const char *a2, ...)
{
  return _[a1 pingIntervalToUse];
}

id objc_msgSend_pingTimer(void *a1, const char *a2, ...)
{
  return _[a1 pingTimer];
}

id objc_msgSend_pingWithType_(void *a1, const char *a2, ...)
{
  return [a1 pingWithType:];
}

id objc_msgSend_pipe(void *a1, const char *a2, ...)
{
  return _[a1 pipe];
}

id objc_msgSend_planItemsShouldUpdate_(void *a1, const char *a2, ...)
{
  return [a1 planItemsShouldUpdate:];
}

id objc_msgSend_platformType(void *a1, const char *a2, ...)
{
  return _[a1 platformType];
}

id objc_msgSend_plugInContainerPaths(void *a1, const char *a2, ...)
{
  return _[a1 plugInContainerPaths];
}

id objc_msgSend_plugInKitPlugins(void *a1, const char *a2, ...)
{
  return _[a1 plugInKitPlugins];
}

id objc_msgSend_pluginIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 pluginIdentifier];
}

id objc_msgSend_pointerValue(void *a1, const char *a2, ...)
{
  return _[a1 pointerValue];
}

id objc_msgSend_pollingQueue(void *a1, const char *a2, ...)
{
  return _[a1 pollingQueue];
}

id objc_msgSend_populateCache(void *a1, const char *a2, ...)
{
  return _[a1 populateCache];
}

id objc_msgSend_populateLookupTableUsingDeviceInfo_(void *a1, const char *a2, ...)
{
  return [a1 populateLookupTableUsingDeviceInfo:];
}

id objc_msgSend_populateStoreHourFromDefaultSettingsForDate_(void *a1, const char *a2, ...)
{
  return [a1 populateStoreHourFromDefaultSettingsForDate:];
}

id objc_msgSend_populateStoreHourFromHubSuppliedSettingsForDate_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "populateStoreHourFromHubSuppliedSettingsForDate:");
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return _[a1 port];
}

id objc_msgSend_postData(void *a1, const char *a2, ...)
{
  return _[a1 postData];
}

id objc_msgSend_postFile(void *a1, const char *a2, ...)
{
  return _[a1 postFile];
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationName:object:userInfo:];
}

id objc_msgSend_postNotificationName_object_userInfo_deliverImmediately_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationName:object:userInfo:deliverImmediately:];
}

id objc_msgSend_posterObserver(void *a1, const char *a2, ...)
{
  return _[a1 posterObserver];
}

id objc_msgSend_preInstalledContent(void *a1, const char *a2, ...)
{
  return _[a1 preInstalledContent];
}

id objc_msgSend_predicateForChangeAtKeyPaths_(void *a1, const char *a2, ...)
{
  return [a1 predicateForChangeAtKeyPaths:];
}

id objc_msgSend_predicateMatchingBundleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 predicateMatchingBundleIdentifier:];
}

id objc_msgSend_predicateMatchingProcessTypeApplication(void *a1, const char *a2, ...)
{
  return _[a1 predicateMatchingProcessTypeApplication];
}

id objc_msgSend_preferencesFile(void *a1, const char *a2, ...)
{
  return _[a1 preferencesFile];
}

id objc_msgSend_preferencesFileExists(void *a1, const char *a2, ...)
{
  return _[a1 preferencesFileExists];
}

id objc_msgSend_preferencesFilePath(void *a1, const char *a2, ...)
{
  return _[a1 preferencesFilePath];
}

id objc_msgSend_preferencesFileUrl(void *a1, const char *a2, ...)
{
  return _[a1 preferencesFileUrl];
}

id objc_msgSend_preferredDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 preferredDescriptor];
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return _[a1 preferredLanguages];
}

id objc_msgSend_preferredLocalizationsFromArray_forPreferences_(void *a1, const char *a2, ...)
{
  return [a1 preferredLocalizationsFromArray:forPreferences:];
}

id objc_msgSend_preferredStoreID(void *a1, const char *a2, ...)
{
  return _[a1 preferredStoreID];
}

id objc_msgSend_prepareBundleInfoDictionary(void *a1, const char *a2, ...)
{
  return _[a1 prepareBundleInfoDictionary];
}

id objc_msgSend_prepareCAData_(void *a1, const char *a2, ...)
{
  return [a1 prepareCAData:];
}

id objc_msgSend_prepareForExtraction_(void *a1, const char *a2, ...)
{
  return [a1 prepareForExtraction:];
}

id objc_msgSend_prepareHubOfflineDurationString(void *a1, const char *a2, ...)
{
  return _[a1 prepareHubOfflineDurationString];
}

id objc_msgSend_prepareQueue(void *a1, const char *a2, ...)
{
  return _[a1 prepareQueue];
}

id objc_msgSend_prepareToWrite_(void *a1, const char *a2, ...)
{
  return [a1 prepareToWrite:];
}

id objc_msgSend_prepareWorkDirectory_writableByNonRoot_(void *a1, const char *a2, ...)
{
  return [a1 prepareWorkDirectory:writableByNonRoot:];
}

id objc_msgSend_preserveAndEncryptKeychainItemsForKey_toFile_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "preserveAndEncryptKeychainItemsForKey:toFile:");
}

id objc_msgSend_preserveBTFiles(void *a1, const char *a2, ...)
{
  return _[a1 preserveBTFiles];
}

id objc_msgSend_preserveBTPairingRecord(void *a1, const char *a2, ...)
{
  return _[a1 preserveBTPairingRecord];
}

id objc_msgSend_preserveBluetoothFileToShelter_(void *a1, const char *a2, ...)
{
  return [a1 preserveBluetoothFileToShelter:];
}

id objc_msgSend_preservePairedPeersData(void *a1, const char *a2, ...)
{
  return _[a1 preservePairedPeersData];
}

id objc_msgSend_preservePrivateAccessTokens(void *a1, const char *a2, ...)
{
  return _[a1 preservePrivateAccessTokens];
}

id objc_msgSend_preserveSecondPartyAppDataToShelter_withReturnErrorMsg_(void *a1, const char *a2, ...)
{
  return [a1 preserveSecondPartyAppDataToShelter:withReturnErrorMsg:];
}

id objc_msgSend_pressDemoMode(void *a1, const char *a2, ...)
{
  return _[a1 pressDemoMode];
}

id objc_msgSend_pressDemoTestTarget(void *a1, const char *a2, ...)
{
  return _[a1 pressDemoTestTarget];
}

id objc_msgSend_pressDemoXCTestProductsPath(void *a1, const char *a2, ...)
{
  return _[a1 pressDemoXCTestProductsPath];
}

id objc_msgSend_prettyPrintSUDescriptor_(void *a1, const char *a2, ...)
{
  return [a1 prettyPrintSUDescriptor:];
}

id objc_msgSend_previousiOSBuild(void *a1, const char *a2, ...)
{
  return _[a1 previousiOSBuild];
}

id objc_msgSend_pricingAppUpdateDeferred(void *a1, const char *a2, ...)
{
  return _[a1 pricingAppUpdateDeferred];
}

id objc_msgSend_print(void *a1, const char *a2, ...)
{
  return _[a1 print];
}

id objc_msgSend_printAllKeys_(void *a1, const char *a2, ...)
{
  return [a1 printAllKeys:];
}

id objc_msgSend_printBMAppInfocusEvent_(void *a1, const char *a2, ...)
{
  return [a1 printBMAppInfocusEvent:];
}

id objc_msgSend_privateKey(void *a1, const char *a2, ...)
{
  return _[a1 privateKey];
}

id objc_msgSend_process(void *a1, const char *a2, ...)
{
  return _[a1 process];
}

id objc_msgSend_process_(void *a1, const char *a2, ...)
{
  return [a1 process:];
}

id objc_msgSend_processCoreDuetCallBack(void *a1, const char *a2, ...)
{
  return _[a1 processCoreDuetCallBack];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 processIdentifier];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_processNewFeatureFlags_oldFeatureFlags_(void *a1, const char *a2, ...)
{
  return [a1 processNewFeatureFlags:oldFeatureFlags:];
}

id objc_msgSend_processRequest_(void *a1, const char *a2, ...)
{
  return [a1 processRequest:];
}

id objc_msgSend_processServerRangeResponse_(void *a1, const char *a2, ...)
{
  return [a1 processServerRangeResponse:];
}

id objc_msgSend_processedContainers(void *a1, const char *a2, ...)
{
  return _[a1 processedContainers];
}

id objc_msgSend_produceNewDependentOperation_forRollback_(void *a1, const char *a2, ...)
{
  return [a1 produceNewDependentOperation:forRollback:];
}

id objc_msgSend_productBuildVersion(void *a1, const char *a2, ...)
{
  return _[a1 productBuildVersion];
}

id objc_msgSend_productSystemName(void *a1, const char *a2, ...)
{
  return _[a1 productSystemName];
}

id objc_msgSend_productType(void *a1, const char *a2, ...)
{
  return _[a1 productType];
}

id objc_msgSend_productVersion(void *a1, const char *a2, ...)
{
  return _[a1 productVersion];
}

id objc_msgSend_profileIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 profileIdentifier];
}

id objc_msgSend_profilePath(void *a1, const char *a2, ...)
{
  return _[a1 profilePath];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return _[a1 progress];
}

id objc_msgSend_propertyList_isValidForFormat_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "propertyList:isValidForFormat:");
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_propertyListWithStream_options_format_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "propertyListWithStream:options:format:error:");
}

id objc_msgSend_protectionSpace(void *a1, const char *a2, ...)
{
  return _[a1 protectionSpace];
}

id objc_msgSend_providerDidDiscoverNewPeer_(void *a1, const char *a2, ...)
{
  return [a1 providerDidDiscoverNewPeer:];
}

id objc_msgSend_providerDidLoseExistingPeerOfID_(void *a1, const char *a2, ...)
{
  return [a1 providerDidLoseExistingPeerOfID:];
}

id objc_msgSend_providerDidUpdateDeviceInfoOnPeerOfID_withNewProperties_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "providerDidUpdateDeviceInfoOnPeerOfID:withNewProperties:");
}

id objc_msgSend_pseudoContentRootPath(void *a1, const char *a2, ...)
{
  return _[a1 pseudoContentRootPath];
}

id objc_msgSend_publicIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 publicIdentifier];
}

id objc_msgSend_publisher(void *a1, const char *a2, ...)
{
  return _[a1 publisher];
}

id objc_msgSend_purgeDownload_(void *a1, const char *a2, ...)
{
  return [a1 purgeDownload:];
}

id objc_msgSend_purgeExistingAssetOfIdentifier_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "purgeExistingAssetOfIdentifier:");
}

id objc_msgSend_purgeExistingAssets(void *a1, const char *a2, ...)
{
  return _[a1 purgeExistingAssets];
}

id objc_msgSend_purged(void *a1, const char *a2, ...)
{
  return _[a1 purged];
}

id objc_msgSend_pushTestEvent_ofType_(void *a1, const char *a2, ...)
{
  return [a1 pushTestEvent:ofType:];
}

id objc_msgSend_pushTestLog_(void *a1, const char *a2, ...)
{
  return [a1 pushTestLog:];
}

id objc_msgSend_pushToTestLog_(void *a1, const char *a2, ...)
{
  return [a1 pushToTestLog:];
}

id objc_msgSend_query(void *a1, const char *a2, ...)
{
  return _[a1 query];
}

id objc_msgSend_queryItemWithName_value_(void *a1, const char *a2, ...)
{
  return [a1 queryItemWithName:value:];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return _[a1 queue];
}

id objc_msgSend_queuedPingType(void *a1, const char *a2, ...)
{
  return _[a1 queuedPingType];
}

id objc_msgSend_quitBackgroundDownload(void *a1, const char *a2, ...)
{
  return _[a1 quitBackgroundDownload];
}

id objc_msgSend_quitHelper(void *a1, const char *a2, ...)
{
  return _[a1 quitHelper];
}

id objc_msgSend_rOS(void *a1, const char *a2, ...)
{
  return _[a1 rOS];
}

id objc_msgSend_raise(void *a1, const char *a2, ...)
{
  return _[a1 raise];
}

id objc_msgSend_raiseInvalidProductListExceptionWithReason_(void *a1, const char *a2, ...)
{
  return [a1 raiseInvalidProductListExceptionWithReason:];
}

id objc_msgSend_raiseInvalidPropertyListObjectExceptionForObject_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "raiseInvalidPropertyListObjectExceptionForObject:");
}

id objc_msgSend_rangeOfFirstMatchInString_options_range_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "rangeOfFirstMatchInString:options:range:");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return [a1 rangeOfString:];
}

id objc_msgSend_rangeValue(void *a1, const char *a2, ...)
{
  return _[a1 rangeValue];
}

id objc_msgSend_rawDataKeyMapping(void *a1, const char *a2, ...)
{
  return _[a1 rawDataKeyMapping];
}

id objc_msgSend_rawTimingData(void *a1, const char *a2, ...)
{
  return _[a1 rawTimingData];
}

id objc_msgSend_reachabilityLastUpdatedTime(void *a1, const char *a2, ...)
{
  return _[a1 reachabilityLastUpdatedTime];
}

id objc_msgSend_reachable(void *a1, const char *a2, ...)
{
  return _[a1 reachable];
}

id objc_msgSend_read_maxLength_(void *a1, const char *a2, ...)
{
  return [a1 read:x0 maxLength:x1];
}

id objc_msgSend_readBoolValueForFeatureFlag_(void *a1, const char *a2, ...)
{
  return [a1 readBoolValueForFeatureFlag:];
}

id objc_msgSend_readDataToEndOfFile(void *a1, const char *a2, ...)
{
  return _[a1 readDataToEndOfFile];
}

id objc_msgSend_readDataUpToLength_error_(void *a1, const char *a2, ...)
{
  return [a1 readDataUpToLength:error:];
}

id objc_msgSend_readManifestFromFile_(void *a1, const char *a2, ...)
{
  return [a1 readManifestFromFile:];
}

id objc_msgSend_readNVRam_(void *a1, const char *a2, ...)
{
  return [a1 readNVRam:];
}

id objc_msgSend_readPlistFile_(void *a1, const char *a2, ...)
{
  return [a1 readPlistFile:];
}

id objc_msgSend_reboot(void *a1, const char *a2, ...)
{
  return _[a1 reboot];
}

id objc_msgSend_rebootDelayForStaging(void *a1, const char *a2, ...)
{
  return _[a1 rebootDelayForStaging];
}

id objc_msgSend_rebootForStage_(void *a1, const char *a2, ...)
{
  return [a1 rebootForStage:];
}

id objc_msgSend_rebootWithSnapshotRevertForStage_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "rebootWithSnapshotRevertForStage:");
}

id objc_msgSend_receivedCompletionNotice_fromRequest_(void *a1, const char *a2, ...)
{
  return [a1 receivedCompletionNotice:fromRequest:];
}

id objc_msgSend_receivedHeartBeat_fromRequest_(void *a1, const char *a2, ...)
{
  return [a1 receivedHeartBeat:fromRequest:];
}

id objc_msgSend_receivedOtherMessages_fromRequest_(void *a1, const char *a2, ...)
{
  return [a1 receivedOtherMessages:fromRequest:];
}

id objc_msgSend_receivedUpdateRequest_fromRequest_(void *a1, const char *a2, ...)
{
  return [a1 receivedUpdateRequest:fromRequest:];
}

id objc_msgSend_recordDownloadedBytes(void *a1, const char *a2, ...)
{
  return _[a1 recordDownloadedBytes];
}

id objc_msgSend_recoveryKey(void *a1, const char *a2, ...)
{
  return _[a1 recoveryKey];
}

id objc_msgSend_redirected(void *a1, const char *a2, ...)
{
  return _[a1 redirected];
}

id objc_msgSend_reducedKeyList(void *a1, const char *a2, ...)
{
  return _[a1 reducedKeyList];
}

id objc_msgSend_refreshDevicePropertiesUsingProperties_(void *a1, const char *a2, ...)
{
  return [a1 refreshDevicePropertiesUsingProperties:];
}

id objc_msgSend_refreshStoreHoursManagerUsingSettings(void *a1, const char *a2, ...)
{
  return _[a1 refreshStoreHoursManagerUsingSettings];
}

id objc_msgSend_regionCode(void *a1, const char *a2, ...)
{
  return _[a1 regionCode];
}

id objc_msgSend_registerCAHearbeatActivity(void *a1, const char *a2, ...)
{
  return _[a1 registerCAHearbeatActivity];
}

id objc_msgSend_registerCallback_(void *a1, const char *a2, ...)
{
  return [a1 registerCallback:];
}

id objc_msgSend_registerDemoUpdateStatusDelegate_(void *a1, const char *a2, ...)
{
  return [a1 registerDemoUpdateStatusDelegate:];
}

id objc_msgSend_registerEntitlementNotificationHandler(void *a1, const char *a2, ...)
{
  return _[a1 registerEntitlementNotificationHandler];
}

id objc_msgSend_registerEventID_options_handler_(void *a1, const char *a2, ...)
{
  return [a1 registerEventID:options:handler:];
}

id objc_msgSend_registerObserver_(void *a1, const char *a2, ...)
{
  return [a1 registerObserver:];
}

id objc_msgSend_registerRequestID_options_handler_(void *a1, const char *a2, ...)
{
  return [a1 registerRequestID:options:handler:];
}

id objc_msgSend_registrationInfo(void *a1, const char *a2, ...)
{
  return _[a1 registrationInfo];
}

id objc_msgSend_regularExpressionWithPattern_options_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "regularExpressionWithPattern:options:error:");
}

id objc_msgSend_releaseAppTerminationAssertion_forApp_(void *a1, const char *a2, ...)
{
  return [a1 releaseAppTerminationAssertion:forApp:];
}

id objc_msgSend_releaseType(void *a1, const char *a2, ...)
{
  return _[a1 releaseType];
}

id objc_msgSend_reload(void *a1, const char *a2, ...)
{
  return _[a1 reload];
}

id objc_msgSend_remoteAlertHandle(void *a1, const char *a2, ...)
{
  return _[a1 remoteAlertHandle];
}

id objc_msgSend_remoteCredential(void *a1, const char *a2, ...)
{
  return _[a1 remoteCredential];
}

id objc_msgSend_remoteCredentialForOriginServer_(void *a1, const char *a2, ...)
{
  return [a1 remoteCredentialForOriginServer:];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return _[a1 remoteObjectProxy];
}

id objc_msgSend_remoteURLList(void *a1, const char *a2, ...)
{
  return _[a1 remoteURLList];
}

id objc_msgSend_removableComponents(void *a1, const char *a2, ...)
{
  return _[a1 removableComponents];
}

id objc_msgSend_removeAccount_withDataclassActions_completion_(void *a1, const char *a2, ...)
{
  return [a1 removeAccount:x0 withDataclassActions:x1 completion:x2];
}

id objc_msgSend_removeAccounts_(void *a1, const char *a2, ...)
{
  return [a1 removeAccounts:];
}

id objc_msgSend_removeAllExtendedAttributes_(void *a1, const char *a2, ...)
{
  return [a1 removeAllExtendedAttributes:];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeAppDiffPatchFileForSourceAppUID_targetAppUID_(void *a1, const char *a2, ...)
{
  return [a1 removeAppDiffPatchFileForSourceAppUID:targetAppUID:];
}

id objc_msgSend_removeBlocklistedItemFromSection_withName_(void *a1, const char *a2, ...)
{
  return [a1 removeBlocklistedItemFromSection:withName:];
}

id objc_msgSend_removeBluetoothPairingRecordIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 removeBluetoothPairingRecordIfNeeded];
}

id objc_msgSend_removeBundleFromPreferences_(void *a1, const char *a2, ...)
{
  return [a1 removeBundleFromPreferences:];
}

id objc_msgSend_removeFileAtPath_(void *a1, const char *a2, ...)
{
  return [a1 removeFileAtPath:];
}

id objc_msgSend_removeFromRunLoop_forMode_(void *a1, const char *a2, ...)
{
  return [a1 removeFromRunLoop:forMode:];
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return [a1 removeItemAtPath:error:];
}

id objc_msgSend_removeKeyFromPreferenceFile_(void *a1, const char *a2, ...)
{
  return [a1 removeKeyFromPreferenceFile:];
}

id objc_msgSend_removeKnownNetworkProfile_reason_error_(void *a1, const char *a2, ...)
{
  return [a1 removeKnownNetworkProfile:reason:error:];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return _[a1 removeLastObject];
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

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:];
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:name:object:];
}

id objc_msgSend_removeOperations(void *a1, const char *a2, ...)
{
  return _[a1 removeOperations];
}

id objc_msgSend_removePairedPeer_options_completion_(void *a1, const char *a2, ...)
{
  return [a1 removePairedPeer:options:completion:];
}

id objc_msgSend_removePairedPeer_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 removePairedPeer:withCompletion:];
}

id objc_msgSend_removeProfileWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 removeProfileWithIdentifier:];
}

id objc_msgSend_removeRouteToSystemMusicForSpeaker(void *a1, const char *a2, ...)
{
  return _[a1 removeRouteToSystemMusicForSpeaker];
}

id objc_msgSend_removeSessionTask_(void *a1, const char *a2, ...)
{
  return [a1 removeSessionTask:];
}

id objc_msgSend_removeTemporaryPasscodeIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 removeTemporaryPasscodeIfNeeded];
}

id objc_msgSend_removeWorkDirectories_(void *a1, const char *a2, ...)
{
  return [a1 removeWorkDirectories:];
}

id objc_msgSend_removeWorkDirectory_(void *a1, const char *a2, ...)
{
  return [a1 removeWorkDirectory:];
}

id objc_msgSend_renameBundleInPrgressToBundleInstalled(void *a1, const char *a2, ...)
{
  return _[a1 renameBundleInPrgressToBundleInstalled];
}

id objc_msgSend_renewRPCompanionLinkDevice_(void *a1, const char *a2, ...)
{
  return [a1 renewRPCompanionLinkDevice:];
}

id objc_msgSend_reportBundleInstallCompleted(void *a1, const char *a2, ...)
{
  return _[a1 reportBundleInstallCompleted];
}

id objc_msgSend_reportCachingHubFailed(void *a1, const char *a2, ...)
{
  return _[a1 reportCachingHubFailed];
}

id objc_msgSend_reportDone_(void *a1, const char *a2, ...)
{
  return [a1 reportDone:];
}

id objc_msgSend_reportError_(void *a1, const char *a2, ...)
{
  return [a1 reportError:];
}

id objc_msgSend_reportS3ServerFailed(void *a1, const char *a2, ...)
{
  return _[a1 reportS3ServerFailed];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return _[a1 request];
}

id objc_msgSend_requestComplete_withResponse_(void *a1, const char *a2, ...)
{
  return [a1 requestComplete:withResponse:];
}

id objc_msgSend_requestEnd(void *a1, const char *a2, ...)
{
  return _[a1 requestEnd];
}

id objc_msgSend_requestEndDate(void *a1, const char *a2, ...)
{
  return _[a1 requestEndDate];
}

id objc_msgSend_requestFullScreenUI(void *a1, const char *a2, ...)
{
  return _[a1 requestFullScreenUI];
}

id objc_msgSend_requestInfo(void *a1, const char *a2, ...)
{
  return _[a1 requestInfo];
}

id objc_msgSend_requestPerSession(void *a1, const char *a2, ...)
{
  return _[a1 requestPerSession];
}

id objc_msgSend_requestStart(void *a1, const char *a2, ...)
{
  return _[a1 requestStart];
}

id objc_msgSend_requestStartDate(void *a1, const char *a2, ...)
{
  return _[a1 requestStartDate];
}

id objc_msgSend_requestStr(void *a1, const char *a2, ...)
{
  return _[a1 requestStr];
}

id objc_msgSend_requestTokenForTopic_identifier_(void *a1, const char *a2, ...)
{
  return [a1 requestTokenForTopic:identifier:];
}

id objc_msgSend_requestWithURL_cachePolicy_timeoutInterval_(void *a1, const char *a2, ...)
{
  return [a1 requestWithURL:cachePolicy:timeoutInterval:];
}

id objc_msgSend_requiredDeletableSystemApps(void *a1, const char *a2, ...)
{
  return _[a1 requiredDeletableSystemApps];
}

id objc_msgSend_resetCDP(void *a1, const char *a2, ...)
{
  return _[a1 resetCDP];
}

id objc_msgSend_resetData(void *a1, const char *a2, ...)
{
  return _[a1 resetData];
}

id objc_msgSend_resetExtension(void *a1, const char *a2, ...)
{
  return _[a1 resetExtension];
}

id objc_msgSend_resetFileHandle(void *a1, const char *a2, ...)
{
  return _[a1 resetFileHandle];
}

id objc_msgSend_resetSystemTimeCache(void *a1, const char *a2, ...)
{
  return _[a1 resetSystemTimeCache];
}

id objc_msgSend_resetTrackerForBundleType_(void *a1, const char *a2, ...)
{
  return [a1 resetTrackerForBundleType:];
}

id objc_msgSend_resetWithRequest_completion_(void *a1, const char *a2, ...)
{
  return [a1 resetWithRequest:completion:];
}

id objc_msgSend_resourceFetchType(void *a1, const char *a2, ...)
{
  return _[a1 resourceFetchType];
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return _[a1 response];
}

id objc_msgSend_responseEnd(void *a1, const char *a2, ...)
{
  return _[a1 responseEnd];
}

id objc_msgSend_responseEndDate(void *a1, const char *a2, ...)
{
  return _[a1 responseEndDate];
}

id objc_msgSend_responseHandlers(void *a1, const char *a2, ...)
{
  return _[a1 responseHandlers];
}

id objc_msgSend_responseStart(void *a1, const char *a2, ...)
{
  return _[a1 responseStart];
}

id objc_msgSend_responseStartDate(void *a1, const char *a2, ...)
{
  return _[a1 responseStartDate];
}

id objc_msgSend_restartBluetooth(void *a1, const char *a2, ...)
{
  return _[a1 restartBluetooth];
}

id objc_msgSend_restartMonitor(void *a1, const char *a2, ...)
{
  return _[a1 restartMonitor];
}

id objc_msgSend_restoreAndDecryptKeychainItemsForKey_fromFile_(void *a1, const char *a2, ...)
{
  return [a1 restoreAndDecryptKeychainItemsForKey:fromFile:];
}

id objc_msgSend_restoreAppDataAttributesUnder_containerType_identifier_manifestUID_deviceUID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "restoreAppDataAttributesUnder:containerType:identifier:manifestUID:deviceUID:");
}

id objc_msgSend_restoreBTPairingRecordIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 restoreBTPairingRecordIfNeeded];
}

id objc_msgSend_restoreBackupAttributesUnder_range_manifestUID_deviceUID_(void *a1, const char *a2, ...)
{
  return [a1 restoreBackupAttributesUnder:x0 range:x1 manifestUID:x2 deviceUID:x3];
}

id objc_msgSend_restoreDeviceLanguageAndRegionIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 restoreDeviceLanguageAndRegionIfNeeded];
}

id objc_msgSend_restorePairedPeersDataIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 restorePairedPeersDataIfNeeded];
}

id objc_msgSend_restorePrivateAccessTokens(void *a1, const char *a2, ...)
{
  return _[a1 restorePrivateAccessTokens];
}

id objc_msgSend_restoreSavedDeviceSettings(void *a1, const char *a2, ...)
{
  return _[a1 restoreSavedDeviceSettings];
}

id objc_msgSend_restoreSystemContainerUUIDPathsInDict_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "restoreSystemContainerUUIDPathsInDict:");
}

id objc_msgSend_restoreWallpaperSettingsIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 restoreWallpaperSettingsIfNeeded];
}

id objc_msgSend_restored(void *a1, const char *a2, ...)
{
  return _[a1 restored];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return _[a1 result];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_resumeProcessing(void *a1, const char *a2, ...)
{
  return _[a1 resumeProcessing];
}

id objc_msgSend_retransmitBytes(void *a1, const char *a2, ...)
{
  return _[a1 retransmitBytes];
}

id objc_msgSend_retrieveAndPopulateBundleInfo_(void *a1, const char *a2, ...)
{
  return [a1 retrieveAndPopulateBundleInfo:];
}

id objc_msgSend_retrieveDataBlob_(void *a1, const char *a2, ...)
{
  return [a1 retrieveDataBlob:];
}

id objc_msgSend_retrieveLegacyContentnIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 retrieveLegacyContentnIdentifier:];
}

id objc_msgSend_retrieveObjectFromPreferences_(void *a1, const char *a2, ...)
{
  return [a1 retrieveObjectFromPreferences:];
}

id objc_msgSend_retrieveSignedManifest(void *a1, const char *a2, ...)
{
  return _[a1 retrieveSignedManifest];
}

id objc_msgSend_retryAfter(void *a1, const char *a2, ...)
{
  return _[a1 retryAfter];
}

id objc_msgSend_retryAttempts(void *a1, const char *a2, ...)
{
  return _[a1 retryAttempts];
}

id objc_msgSend_retryCount(void *a1, const char *a2, ...)
{
  return _[a1 retryCount];
}

id objc_msgSend_retryEnrollmentWithHub_(void *a1, const char *a2, ...)
{
  return [a1 retryEnrollmentWithHub:];
}

id objc_msgSend_retryLeft(void *a1, const char *a2, ...)
{
  return _[a1 retryLeft];
}

id objc_msgSend_retrySessionTask_(void *a1, const char *a2, ...)
{
  return [a1 retrySessionTask:];
}

id objc_msgSend_retryTimer(void *a1, const char *a2, ...)
{
  return _[a1 retryTimer];
}

id objc_msgSend_retryable(void *a1, const char *a2, ...)
{
  return _[a1 retryable];
}

id objc_msgSend_retryableComponents(void *a1, const char *a2, ...)
{
  return _[a1 retryableComponents];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 reverseObjectEnumerator];
}

id objc_msgSend_revertDate(void *a1, const char *a2, ...)
{
  return _[a1 revertDate];
}

id objc_msgSend_revertSnapshot(void *a1, const char *a2, ...)
{
  return _[a1 revertSnapshot];
}

id objc_msgSend_revokeCLPermissionForBundleID_(void *a1, const char *a2, ...)
{
  return [a1 revokeCLPermissionForBundleID:];
}

id objc_msgSend_revokeNetworkPermissionForBundleID_(void *a1, const char *a2, ...)
{
  return [a1 revokeNetworkPermissionForBundleID:];
}

id objc_msgSend_revokePrivacyPermissions_forAppBundleID_(void *a1, const char *a2, ...)
{
  return [a1 revokePrivacyPermissions:forAppBundleID:];
}

id objc_msgSend_revokePrivacyPermissionsForAllApps(void *a1, const char *a2, ...)
{
  return _[a1 revokePrivacyPermissionsForAllApps];
}

id objc_msgSend_revokeTCCPermissionForResource_toBundleID_(void *a1, const char *a2, ...)
{
  return [a1 revokeTCCPermissionForResource:toBundleID:];
}

id objc_msgSend_rollOverCoreAnalyticsLogs(void *a1, const char *a2, ...)
{
  return _[a1 rollOverCoreAnalyticsLogs];
}

id objc_msgSend_rollback(void *a1, const char *a2, ...)
{
  return _[a1 rollback];
}

id objc_msgSend_rollbackOperations(void *a1, const char *a2, ...)
{
  return _[a1 rollbackOperations];
}

id objc_msgSend_rootFileSystemPath(void *a1, const char *a2, ...)
{
  return _[a1 rootFileSystemPath];
}

id objc_msgSend_rootOperations(void *a1, const char *a2, ...)
{
  return _[a1 rootOperations];
}

id objc_msgSend_rootPath(void *a1, const char *a2, ...)
{
  return _[a1 rootPath];
}

id objc_msgSend_rpClient(void *a1, const char *a2, ...)
{
  return _[a1 rpClient];
}

id objc_msgSend_rpDevice(void *a1, const char *a2, ...)
{
  return _[a1 rpDevice];
}

id objc_msgSend_rpDeviceAdvertiser(void *a1, const char *a2, ...)
{
  return _[a1 rpDeviceAdvertiser];
}

id objc_msgSend_rpDeviceExplorer(void *a1, const char *a2, ...)
{
  return _[a1 rpDeviceExplorer];
}

id objc_msgSend_rpLocalDevice(void *a1, const char *a2, ...)
{
  return _[a1 rpLocalDevice];
}

id objc_msgSend_rpMessageHandler(void *a1, const char *a2, ...)
{
  return _[a1 rpMessageHandler];
}

id objc_msgSend_rpServer(void *a1, const char *a2, ...)
{
  return _[a1 rpServer];
}

id objc_msgSend_rpcFetchAndProcessChanges_reply_(void *a1, const char *a2, ...)
{
  return [a1 rpcFetchAndProcessChanges:reply:];
}

id objc_msgSend_rssi(void *a1, const char *a2, ...)
{
  return _[a1 rssi];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _[a1 run];
}

id objc_msgSend_runAppLayoutSecurityCheck_(void *a1, const char *a2, ...)
{
  return [a1 runAppLayoutSecurityCheck:];
}

id objc_msgSend_runCleanUpForBetterTogetherDevice(void *a1, const char *a2, ...)
{
  return _[a1 runCleanUpForBetterTogetherDevice];
}

id objc_msgSend_runFileSecurityChecksForSection_dataType_options_(void *a1, const char *a2, ...)
{
  return [a1 runFileSecurityChecksForSection:x0 dataType:x1 options:x2];
}

id objc_msgSend_runInstallInParallel(void *a1, const char *a2, ...)
{
  return _[a1 runInstallInParallel];
}

id objc_msgSend_runSecurityCheck_(void *a1, const char *a2, ...)
{
  return [a1 runSecurityCheck:];
}

id objc_msgSend_runSecurityChecksForSection_dataType_componentName_options_(void *a1, const char *a2, ...)
{
  return [a1 runSecurityChecksForSection:x0 dataType:x1 componentName:x2 options:x3];
}

id objc_msgSend_runSettingsSecurityCheckForSection_component_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "runSettingsSecurityCheckForSection:component:");
}

id objc_msgSend_runWithConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 runWithConfiguration:];
}

id objc_msgSend_runningApps_(void *a1, const char *a2, ...)
{
  return [a1 runningApps:];
}

id objc_msgSend_s3Server(void *a1, const char *a2, ...)
{
  return _[a1 s3Server];
}

id objc_msgSend_s3ServerFailureReason(void *a1, const char *a2, ...)
{
  return _[a1 s3ServerFailureReason];
}

id objc_msgSend_s3url(void *a1, const char *a2, ...)
{
  return _[a1 s3url];
}

id objc_msgSend_sanitizeTestLog_(void *a1, const char *a2, ...)
{
  return [a1 sanitizeTestLog:];
}

id objc_msgSend_saveAccount_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 saveAccount:withCompletionHandler:];
}

id objc_msgSend_saveAppPatchesList(void *a1, const char *a2, ...)
{
  return _[a1 saveAppPatchesList];
}

id objc_msgSend_saveAvailableOSVersion_andOSBuild_(void *a1, const char *a2, ...)
{
  return [a1 saveAvailableOSVersion:andOSBuild:];
}

id objc_msgSend_saveCache(void *a1, const char *a2, ...)
{
  return _[a1 saveCache];
}

id objc_msgSend_saveConfiguration_withCompletionQueue_handler_(void *a1, const char *a2, ...)
{
  return [a1 saveConfiguration:withCompletionQueue:handler:];
}

id objc_msgSend_saveCurrentDeviceLanguageIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 saveCurrentDeviceLanguageIdentifier];
}

id objc_msgSend_saveCurrentWiFiSettings(void *a1, const char *a2, ...)
{
  return _[a1 saveCurrentWiFiSettings];
}

id objc_msgSend_saveCurrentiOSBuild(void *a1, const char *a2, ...)
{
  return _[a1 saveCurrentiOSBuild];
}

id objc_msgSend_saveCuurentDeviceRegionCode(void *a1, const char *a2, ...)
{
  return _[a1 saveCuurentDeviceRegionCode];
}

id objc_msgSend_saveDemoLogUploadRequest_(void *a1, const char *a2, ...)
{
  return [a1 saveDemoLogUploadRequest:];
}

id objc_msgSend_saveDeviceInfo_(void *a1, const char *a2, ...)
{
  return [a1 saveDeviceInfo:];
}

id objc_msgSend_saveDeviceLanguageIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 saveDeviceLanguageIdentifier:];
}

id objc_msgSend_saveDeviceOptions_(void *a1, const char *a2, ...)
{
  return [a1 saveDeviceOptions:];
}

id objc_msgSend_saveDeviceRegionCode_(void *a1, const char *a2, ...)
{
  return [a1 saveDeviceRegionCode:];
}

id objc_msgSend_saveFindMyHubRetryAtTime_(void *a1, const char *a2, ...)
{
  return [a1 saveFindMyHubRetryAtTime:];
}

id objc_msgSend_saveHubCertificateIdentifer_(void *a1, const char *a2, ...)
{
  return [a1 saveHubCertificateIdentifer:];
}

id objc_msgSend_saveHubCertificateIdentifer_applePKI_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "saveHubCertificateIdentifer:applePKI:");
}

id objc_msgSend_saveHubHostNameList_(void *a1, const char *a2, ...)
{
  return [a1 saveHubHostNameList:];
}

id objc_msgSend_saveHubLastOnlineTime_(void *a1, const char *a2, ...)
{
  return [a1 saveHubLastOnlineTime:];
}

id objc_msgSend_saveHubSuppliedSettings_(void *a1, const char *a2, ...)
{
  return [a1 saveHubSuppliedSettings:];
}

id objc_msgSend_saveInfoToFile_(void *a1, const char *a2, ...)
{
  return [a1 saveInfoToFile:];
}

id objc_msgSend_saveItem_forKey_(void *a1, const char *a2, ...)
{
  return [a1 saveItem:forKey:];
}

id objc_msgSend_saveItem_forKey_withAttributes_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "saveItem:forKey:withAttributes:");
}

id objc_msgSend_saveLastSettingsUpdatedTime_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "saveLastSettingsUpdatedTime:");
}

id objc_msgSend_saveLastShallowRefreshTime_(void *a1, const char *a2, ...)
{
  return [a1 saveLastShallowRefreshTime:];
}

id objc_msgSend_saveLastSnapshotRevertTime_(void *a1, const char *a2, ...)
{
  return [a1 saveLastSnapshotRevertTime:];
}

id objc_msgSend_saveMinOSVersionAvailable_(void *a1, const char *a2, ...)
{
  return [a1 saveMinOSVersionAvailable:];
}

id objc_msgSend_saveNetworkPrivacyConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 saveNetworkPrivacyConfiguration:];
}

id objc_msgSend_saveOSUpdateRequest_(void *a1, const char *a2, ...)
{
  return [a1 saveOSUpdateRequest:];
}

id objc_msgSend_saveOSVerionAfterMigration(void *a1, const char *a2, ...)
{
  return _[a1 saveOSVerionAfterMigration];
}

id objc_msgSend_saveOperationError_(void *a1, const char *a2, ...)
{
  return [a1 saveOperationError:];
}

id objc_msgSend_saveOperationRequest_requestFlag_completeBy_(void *a1, const char *a2, ...)
{
  return [a1 saveOperationRequest:requestFlag:completeBy:];
}

id objc_msgSend_saveOperationRequestIfNeeded_completeBy_(void *a1, const char *a2, ...)
{
  return [a1 saveOperationRequestIfNeeded:completeBy:];
}

id objc_msgSend_savePairedDeviceLastSeenDate_(void *a1, const char *a2, ...)
{
  return [a1 savePairedDeviceLastSeenDate:];
}

id objc_msgSend_savePairedPeer_options_completion_(void *a1, const char *a2, ...)
{
  return [a1 savePairedPeer:options:completion:];
}

id objc_msgSend_savePath(void *a1, const char *a2, ...)
{
  return _[a1 savePath];
}

id objc_msgSend_savePrivacyPermissionsForAllApps_(void *a1, const char *a2, ...)
{
  return [a1 savePrivacyPermissionsForAllApps:];
}

id objc_msgSend_saveRequiredDeletableSystemApps(void *a1, const char *a2, ...)
{
  return _[a1 saveRequiredDeletableSystemApps];
}

id objc_msgSend_saveSecretKeyInKeychain_(void *a1, const char *a2, ...)
{
  return [a1 saveSecretKeyInKeychain:];
}

id objc_msgSend_saveSnapshotRevertFlagged_(void *a1, const char *a2, ...)
{
  return [a1 saveSnapshotRevertFlagged:];
}

id objc_msgSend_saveToFile_(void *a1, const char *a2, ...)
{
  return [a1 saveToFile:];
}

id objc_msgSend_saveTransactionMetric_(void *a1, const char *a2, ...)
{
  return [a1 saveTransactionMetric:];
}

id objc_msgSend_saveWiFiSettingsToPreferences_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "saveWiFiSettingsToPreferences:");
}

id objc_msgSend_saveiCloudAccountRecoveryKey_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "saveiCloudAccountRecoveryKey:");
}

id objc_msgSend_saveiCloudAccountSyncNeeded_(void *a1, const char *a2, ...)
{
  return [a1 saveiCloudAccountSyncNeeded:];
}

id objc_msgSend_sbAppSwitcher(void *a1, const char *a2, ...)
{
  return _[a1 sbAppSwitcher];
}

id objc_msgSend_scanForUpdates_withScanResults_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "scanForUpdates:withScanResults:");
}

id objc_msgSend_scanHexInt_(void *a1, const char *a2, ...)
{
  return [a1 scanHexInt:];
}

id objc_msgSend_scannerWithString_(void *a1, const char *a2, ...)
{
  return [a1 scannerWithString:];
}

id objc_msgSend_scheduleInRunLoop_forMode_(void *a1, const char *a2, ...)
{
  return [a1 scheduleInRunLoop:forMode:];
}

id objc_msgSend_scheduleRetryTimerForEnrollmentAtDate_isFirstLaunch_(void *a1, const char *a2, ...)
{
  return [a1 scheduleRetryTimerForEnrollmentAtDate:isFirstLaunch:];
}

id objc_msgSend_scheduledTimerWithTimeInterval_repeats_block_(void *a1, const char *a2, ...)
{
  return [a1 scheduledTimerWithTimeInterval:repeats:block:];
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return [a1 scheduledTimerWithTimeInterval:x0 target:x1 selector:x2 userInfo:x3 repeats:x4];
}

id objc_msgSend_screenSaverIdleDelay(void *a1, const char *a2, ...)
{
  return _[a1 screenSaverIdleDelay];
}

id objc_msgSend_searchStoreWithOptions_completion_(void *a1, const char *a2, ...)
{
  return [a1 searchStoreWithOptions:];
}

id objc_msgSend_secondaryStagingRootPath(void *a1, const char *a2, ...)
{
  return _[a1 secondaryStagingRootPath];
}

id objc_msgSend_secureConnectionEndDate(void *a1, const char *a2, ...)
{
  return _[a1 secureConnectionEndDate];
}

id objc_msgSend_secureConnectionStartDate(void *a1, const char *a2, ...)
{
  return _[a1 secureConnectionStartDate];
}

id objc_msgSend_secureManifestCheckForSegmentedManifest_options_(void *a1, const char *a2, ...)
{
  return [a1 secureManifestCheckForSegmentedManifest:options:];
}

id objc_msgSend_seekToEndOfFile(void *a1, const char *a2, ...)
{
  return _[a1 seekToEndOfFile];
}

id objc_msgSend_segmentedManifestWithRigorousFlag(void *a1, const char *a2, ...)
{
  return _[a1 segmentedManifestWithRigorousFlag];
}

id objc_msgSend_semaphore(void *a1, const char *a2, ...)
{
  return _[a1 semaphore];
}

id objc_msgSend_sendAppUsageDataEvent_withExecutable_sessionUUID_sessionStart_sessionEnd_sessionDuration_appOrder_appDuration_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "sendAppUsageDataEvent:withExecutable:sessionUUID:sessionStart:sessionEnd:sessionDuration:appOrder:appDuration:");
}

id objc_msgSend_sendAutoEnrollmentAbortEvent_languageCode_countryCode_networkInformation_wifiSSID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "sendAutoEnrollmentAbortEvent:languageCode:countryCode:networkInformation:wifiSSID:");
}

id objc_msgSend_sendAutoEnrollmentResults_(void *a1, const char *a2, ...)
{
  return [a1 sendAutoEnrollmentResults:];
}

id objc_msgSend_sendBgDownloadPausedEvent_forReason_(void *a1, const char *a2, ...)
{
  return [a1 sendBgDownloadPausedEvent:forReason:];
}

id objc_msgSend_sendCommandsToDemod_replyFromDemod_(void *a1, const char *a2, ...)
{
  return [a1 sendCommandsToDemod:replyFromDemod:];
}

id objc_msgSend_sendContentUpdateCompletedEvent_withTimeTaken_cachingHubAvailable_isCriticalUpdate_contentUpdateType_andComponentSuccess_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "sendContentUpdateCompletedEvent:withTimeTaken:cachingHubAvailable:isCriticalUpdate:contentUpdateType:andComponentSuccess:");
}

id objc_msgSend_sendContentUpdateFailureEvent_isFatal_(void *a1, const char *a2, ...)
{
  return [a1 sendContentUpdateFailureEvent:isFatal:];
}

id objc_msgSend_sendEnrollmentFailureEvent_(void *a1, const char *a2, ...)
{
  return [a1 sendEnrollmentFailureEvent:];
}

id objc_msgSend_sendEvent_withPayload_(void *a1, const char *a2, ...)
{
  return [a1 sendEvent:withPayload:];
}

id objc_msgSend_sendEventID_event_options_completion_(void *a1, const char *a2, ...)
{
  return [a1 sendEventID:event:options:completion:];
}

id objc_msgSend_sendFMHFailureEvent_(void *a1, const char *a2, ...)
{
  return [a1 sendFMHFailureEvent:];
}

id objc_msgSend_sendFileDownloadSourceEvent_(void *a1, const char *a2, ...)
{
  return [a1 sendFileDownloadSourceEvent:];
}

id objc_msgSend_sendHeartbeatEvent(void *a1, const char *a2, ...)
{
  return _[a1 sendHeartbeatEvent];
}

id objc_msgSend_sendImmediateDeviceInfoPing(void *a1, const char *a2, ...)
{
  return _[a1 sendImmediateDeviceInfoPing];
}

id objc_msgSend_sendLastShallowRefreshTime_(void *a1, const char *a2, ...)
{
  return [a1 sendLastShallowRefreshTime:];
}

id objc_msgSend_sendNetworkAverageBandwidthEvent_forServerType_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "sendNetworkAverageBandwidthEvent:forServerType:");
}

id objc_msgSend_sendNetworkAverageRTTEvent_forServerType_(void *a1, const char *a2, ...)
{
  return [a1 sendNetworkAverageRTTEvent:forServerType:];
}

id objc_msgSend_sendNetworkFailureEvent_forServerType_(void *a1, const char *a2, ...)
{
  return [a1 sendNetworkFailureEvent:forServerType:];
}

id objc_msgSend_sendNetworkPacketLossEvent_forServerType_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "sendNetworkPacketLossEvent:forServerType:");
}

id objc_msgSend_sendNetworkRawDataEvent_forServerType_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "sendNetworkRawDataEvent:forServerType:");
}

id objc_msgSend_sendOSUpdateFailureEvent_(void *a1, const char *a2, ...)
{
  return [a1 sendOSUpdateFailureEvent:];
}

id objc_msgSend_sendOutgoingRequestMessage_toDevice_withCompletion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "sendOutgoingRequestMessage:toDevice:withCompletion:");
}

id objc_msgSend_sendProtobuf_toDestinations_priority_options_identifier_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "sendProtobuf:toDestinations:priority:options:identifier:error:");
}

id objc_msgSend_sendPushNotificationPing(void *a1, const char *a2, ...)
{
  return _[a1 sendPushNotificationPing];
}

id objc_msgSend_sendQueryForRequest_toPath_maxRetry_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "sendQueryForRequest:toPath:maxRetry:")
}

id objc_msgSend_sendRebootTimeoutMessageToPricing_(void *a1, const char *a2, ...)
{
  return [a1 sendRebootTimeoutMessageToPricing:];
}

id objc_msgSend_sendRequest_toEndpoint_postData_maxRetry_(void *a1, const char *a2, ...)
{
  return [a1 sendRequest:toEndpoint:postData:maxRetry:];
}

id objc_msgSend_sendRequestID_request_options_responseHandler_(void *a1, const char *a2, ...)
{
  return [a1 sendRequestID:x0 request:x1 options:x2 responseHandler:x3];
}

id objc_msgSend_sendRequestMessageOfType_withPayload_andResponseHandler_(void *a1, const char *a2, ...)
{
  return [a1 sendRequestMessageOfType:x0 withPayload:x1 andResponseHandler:x2];
}

id objc_msgSend_sendResponseMessageOfType_withPayload_forRequest_andCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 sendResponseMessageOfType:withPayload:forRequest:andCompletionHandler:];
}

id objc_msgSend_sendTestEvents_(void *a1, const char *a2, ...)
{
  return [a1 sendTestEvents:];
}

id objc_msgSend_sendXPCRequest_(void *a1, const char *a2, ...)
{
  return [a1 sendXPCRequest:];
}

id objc_msgSend_senderRPClients(void *a1, const char *a2, ...)
{
  return _[a1 senderRPClients];
}

id objc_msgSend_sendiCloudSigninFailureEvent_(void *a1, const char *a2, ...)
{
  return [a1 sendiCloudSigninFailureEvent:];
}

id objc_msgSend_sequentialGroupForIdentifiers_andContext_(void *a1, const char *a2, ...)
{
  return [a1 sequentialGroupForIdentifiers:andContext:];
}

id objc_msgSend_sequentialOperationsForIdentifiers_andContext_(void *a1, const char *a2, ...)
{
  return [a1 sequentialOperationsForIdentifiers:andContext:];
}

id objc_msgSend_serachForFileWithSuffix_inFolder_(void *a1, const char *a2, ...)
{
  return [a1 searchForFileWithSuffix:inFolder:];
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return _[a1 serialNumber];
}

id objc_msgSend_serializeCertificateChain_(void *a1, const char *a2, ...)
{
  return [a1 serializeCertificateChain:];
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return _[a1 server];
}

id objc_msgSend_serverList(void *a1, const char *a2, ...)
{
  return _[a1 serverList];
}

id objc_msgSend_serverTrust(void *a1, const char *a2, ...)
{
  return _[a1 serverTrust];
}

id objc_msgSend_serverType(void *a1, const char *a2, ...)
{
  return _[a1 serverType];
}

id objc_msgSend_serviceOwnersManager(void *a1, const char *a2, ...)
{
  return _[a1 serviceOwnersManager];
}

id objc_msgSend_serviceWithDefaultShellEndpoint(void *a1, const char *a2, ...)
{
  return _[a1 serviceWithDefaultShellEndpoint];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return _[a1 session];
}

id objc_msgSend_sessionPublisherWithStreamPublisher_startingBlock_sessionKeyBlock_options_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "sessionPublisherWithStreamPublisher:startingBlock:sessionKeyBlock:options:");
}

id objc_msgSend_sessionTable(void *a1, const char *a2, ...)
{
  return _[a1 sessionTable];
}

id objc_msgSend_sessionUUID(void *a1, const char *a2, ...)
{
  return _[a1 sessionUUID];
}

id objc_msgSend_sessionWithConfiguration_delegate_delegateQueue_(void *a1, const char *a2, ...)
{
  return [a1 sessionWithConfiguration:x0 delegate:x1 delegateQueue:x2];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAboutToReboot_(void *a1, const char *a2, ...)
{
  return [a1 setAboutToReboot:];
}

id objc_msgSend_setAccountManagerHelper_(void *a1, const char *a2, ...)
{
  return [a1 setAccountManagerHelper:];
}

id objc_msgSend_setAccountProperty_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setAccountProperty:forKey:];
}

id objc_msgSend_setAccountSettings_(void *a1, const char *a2, ...)
{
  return [a1 setAccountSettings:];
}

id objc_msgSend_setAccountStore_(void *a1, const char *a2, ...)
{
  return [a1 setAccountStore:];
}

id objc_msgSend_setActivated_(void *a1, const char *a2, ...)
{
  return [a1 setActivated:];
}

id objc_msgSend_setActiveComponents_(void *a1, const char *a2, ...)
{
  return [a1 setActiveComponents:];
}

id objc_msgSend_setActiveOperations_(void *a1, const char *a2, ...)
{
  return [a1 setActiveOperations:];
}

id objc_msgSend_setAirDropMode_(void *a1, const char *a2, ...)
{
  return [a1 setAirDropMode:];
}

id objc_msgSend_setAirplaneMode_(void *a1, const char *a2, ...)
{
  return [a1 setAirplaneMode:];
}

id objc_msgSend_setAllOperations_(void *a1, const char *a2, ...)
{
  return [a1 setAllOperations:];
}

id objc_msgSend_setAllowCancel_(void *a1, const char *a2, ...)
{
  return [a1 setAllowCancel:];
}

id objc_msgSend_setAllowedDevices_(void *a1, const char *a2, ...)
{
  return [a1 setAllowedDevices:];
}

id objc_msgSend_setAllowedISTSignedComponents_(void *a1, const char *a2, ...)
{
  return [a1 setAllowedISTSignedComponents:];
}

id objc_msgSend_setAllowedSymLinks_(void *a1, const char *a2, ...)
{
  return [a1 setAllowedSymLinks:];
}

id objc_msgSend_setAllowsCellularAccess_(void *a1, const char *a2, ...)
{
  return [a1 setAllowsCellularAccess:];
}

id objc_msgSend_setAlreadyHaveList_(void *a1, const char *a2, ...)
{
  return [a1 setAlreadyHaveList:];
}

id objc_msgSend_setAlreadyInstalled_(void *a1, const char *a2, ...)
{
  return [a1 setAlreadyInstalled:];
}

id objc_msgSend_setAppAssetPromise_error_(void *a1, const char *a2, ...)
{
  return [a1 setAppAssetPromise:error:];
}

id objc_msgSend_setAppID_(void *a1, const char *a2, ...)
{
  return [a1 setAppID:];
}

id objc_msgSend_setAppIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setAppIdentifier:];
}

id objc_msgSend_setAppInstallationInProgress_(void *a1, const char *a2, ...)
{
  return [a1 setAppInstallationInProgress:];
}

id objc_msgSend_setAppItemToDefer_(void *a1, const char *a2, ...)
{
  return [a1 setAppItemToDefer:];
}

id objc_msgSend_setAppPatches_(void *a1, const char *a2, ...)
{
  return [a1 setAppPatches:];
}

id objc_msgSend_setAppPatchesListFileURL_(void *a1, const char *a2, ...)
{
  return [a1 setAppPatchesListFileURL:];
}

id objc_msgSend_setApplePKI_(void *a1, const char *a2, ...)
{
  return [a1 setApplePKI:];
}

id objc_msgSend_setApplicationRegistration_(void *a1, const char *a2, ...)
{
  return [a1 setApplicationRegistration:];
}

id objc_msgSend_setApsConnection_(void *a1, const char *a2, ...)
{
  return [a1 setApsConnection:];
}

id objc_msgSend_setApsToken_(void *a1, const char *a2, ...)
{
  return [a1 setApsToken:];
}

id objc_msgSend_setArguments_(void *a1, const char *a2, ...)
{
  return [a1 setArguments:];
}

id objc_msgSend_setAttribute_forKey_error_(void *a1, const char *a2, ...)
{
  return [a1 setAttribute:forKey:error:];
}

id objc_msgSend_setAttributes_ofItemAtPath_error_(void *a1, const char *a2, ...)
{
  return [a1 setAttributes:ofItemAtPath:error:];
}

id objc_msgSend_setAuthCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 setAuthCompletionHandler:];
}

id objc_msgSend_setAuthenticated_(void *a1, const char *a2, ...)
{
  return [a1 setAuthenticated:];
}

id objc_msgSend_setAuthenticationResults_(void *a1, const char *a2, ...)
{
  return [a1 setAuthenticationResults:];
}

id objc_msgSend_setAuthenticationType_(void *a1, const char *a2, ...)
{
  return [a1 setAuthenticationType:];
}

id objc_msgSend_setAuthorizationStatusByType_forBundleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setAuthorizationStatusByType:forBundleIdentifier:];
}

id objc_msgSend_setAutoEnrollmentInfo_withStoreId_withHelpMenuRowSelection_(void *a1, const char *a2, ...)
{
  return [a1 setAutoEnrollmentInfo:withStoreId:withHelpMenuRowSelection:];
}

id objc_msgSend_setAutomatedDeviceGroup_(void *a1, const char *a2, ...)
{
  return [a1 setAutomatedDeviceGroup:];
}

id objc_msgSend_setAutomatedDeviceGroupStoreID(void *a1, const char *a2, ...)
{
  return _[a1 setAutomatedDeviceGroupStoreID];
}

id objc_msgSend_setAvDiscoverySession_(void *a1, const char *a2, ...)
{
  return [a1 setAvDiscoverySession:];
}

id objc_msgSend_setAvOutputContext_(void *a1, const char *a2, ...)
{
  return [a1 setAvOutputContext:];
}

id objc_msgSend_setAvSystemController_(void *a1, const char *a2, ...)
{
  return [a1 setAvSystemController:];
}

id objc_msgSend_setAvgRTT_(void *a1, const char *a2, ...)
{
  return [a1 setAvgRTT:];
}

id objc_msgSend_setBackgroundBundle_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundBundle:];
}

id objc_msgSend_setBackgroundDownloadActive_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundDownloadActive:];
}

id objc_msgSend_setBackgroundDownloadQueue_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundDownloadQueue:];
}

id objc_msgSend_setBackgroundDownloadState_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundDownloadState:];
}

id objc_msgSend_setBacklightStatus_(void *a1, const char *a2, ...)
{
  return [a1 setBacklightStatus:];
}

id objc_msgSend_setBgDownloadPauseReason_(void *a1, const char *a2, ...)
{
  return [a1 setBgDownloadPauseReason:];
}

id objc_msgSend_setBgDownloadPauseStartTime_(void *a1, const char *a2, ...)
{
  return [a1 setBgDownloadPauseStartTime:];
}

id objc_msgSend_setBlackListedPaths_(void *a1, const char *a2, ...)
{
  return [a1 setBlackListedPaths:];
}

id objc_msgSend_setBlocklistedItems_(void *a1, const char *a2, ...)
{
  return [a1 setBlocklistedItems:];
}

id objc_msgSend_setBonjourBrowser_(void *a1, const char *a2, ...)
{
  return [a1 setBonjourBrowser:];
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setBool:forKey:];
}

id objc_msgSend_setBoolValue_forSetting_(void *a1, const char *a2, ...)
{
  return [a1 setBoolValue:forSetting:];
}

id objc_msgSend_setBrightnessClient_(void *a1, const char *a2, ...)
{
  return [a1 setBrightnessClient:];
}

id objc_msgSend_setBuddyCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 setBuddyCompletionHandler:];
}

id objc_msgSend_setBundleDownloadInProgress_(void *a1, const char *a2, ...)
{
  return [a1 setBundleDownloadInProgress:];
}

id objc_msgSend_setBundleID_(void *a1, const char *a2, ...)
{
  return [a1 setBundleID:];
}

id objc_msgSend_setBundleInProgress_(void *a1, const char *a2, ...)
{
  return [a1 setBundleInProgress:];
}

id objc_msgSend_setBundleInfo_(void *a1, const char *a2, ...)
{
  return [a1 setBundleInfo:];
}

id objc_msgSend_setBundleState_(void *a1, const char *a2, ...)
{
  return [a1 setBundleState:];
}

id objc_msgSend_setBundleStateAs_(void *a1, const char *a2, ...)
{
  return [a1 setBundleStateAs:];
}

id objc_msgSend_setBundleTimerInfo_(void *a1, const char *a2, ...)
{
  return [a1 setBundleTimerInfo:];
}

id objc_msgSend_setBundleType_(void *a1, const char *a2, ...)
{
  return [a1 setBundleType:];
}

id objc_msgSend_setBusy_(void *a1, const char *a2, ...)
{
  return [a1 setBusy:];
}

id objc_msgSend_setByAddingObject_(void *a1, const char *a2, ...)
{
  return [a1 setByAddingObject:];
}

id objc_msgSend_setCaLogsUploadTimer_(void *a1, const char *a2, ...)
{
  return [a1 setCaLogsUploadTimer:];
}

id objc_msgSend_setCache_(void *a1, const char *a2, ...)
{
  return [a1 setCache:];
}

id objc_msgSend_setCachedBundleInstallState_(void *a1, const char *a2, ...)
{
  return [a1 setCachedBundleInstallState:];
}

id objc_msgSend_setCachedFDC_(void *a1, const char *a2, ...)
{
  return [a1 setCachedFDC:];
}

id objc_msgSend_setCachedLocalURL_(void *a1, const char *a2, ...)
{
  return [a1 setCachedLocalURL:];
}

id objc_msgSend_setCachingHubAvailable_(void *a1, const char *a2, ...)
{
  return [a1 setCachingHubAvailable:];
}

id objc_msgSend_setCachingHubRequest_(void *a1, const char *a2, ...)
{
  return [a1 setCachingHubRequest:];
}

id objc_msgSend_setCachingHubRetryInterval_(void *a1, const char *a2, ...)
{
  return [a1 setCachingHubRetryInterval:];
}

id objc_msgSend_setCachingHubRetryLock_(void *a1, const char *a2, ...)
{
  return [a1 setCachingHubRetryLock:];
}

id objc_msgSend_setCalendar_(void *a1, const char *a2, ...)
{
  return [a1 setCalendar:];
}

id objc_msgSend_setCanceled_(void *a1, const char *a2, ...)
{
  return [a1 setCanceled:];
}

id objc_msgSend_setCdpContext_(void *a1, const char *a2, ...)
{
  return [a1 setCdpContext:];
}

id objc_msgSend_setCdpController_(void *a1, const char *a2, ...)
{
  return [a1 setCdpController:];
}

id objc_msgSend_setCdpUiProvider_(void *a1, const char *a2, ...)
{
  return [a1 setCdpUiProvider:];
}

id objc_msgSend_setCellularCapable_(void *a1, const char *a2, ...)
{
  return [a1 setCellularCapable:];
}

id objc_msgSend_setCellularQueue_(void *a1, const char *a2, ...)
{
  return [a1 setCellularQueue:];
}

id objc_msgSend_setCellularSlotsInfo_(void *a1, const char *a2, ...)
{
  return [a1 setCellularSlotsInfo:];
}

id objc_msgSend_setCellularTypeStrMapping_(void *a1, const char *a2, ...)
{
  return [a1 setCellularTypeStrMapping:];
}

id objc_msgSend_setChangeFlags_(void *a1, const char *a2, ...)
{
  return [a1 setChangeFlags:];
}

id objc_msgSend_setCheckType_(void *a1, const char *a2, ...)
{
  return [a1 setCheckType:];
}

id objc_msgSend_setChecker_(void *a1, const char *a2, ...)
{
  return [a1 setChecker:];
}

id objc_msgSend_setCheckpointBarrier_(void *a1, const char *a2, ...)
{
  return [a1 setCheckpointBarrier:];
}

id objc_msgSend_setClientCertArray_(void *a1, const char *a2, ...)
{
  return [a1 setClientCertArray:];
}

id objc_msgSend_setCloneFailedList_(void *a1, const char *a2, ...)
{
  return [a1 setCloneFailedList:];
}

id objc_msgSend_setClosedDate_(void *a1, const char *a2, ...)
{
  return [a1 setClosedDate:];
}

id objc_msgSend_setCloudSyncEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setCloudSyncEnabled:];
}

id objc_msgSend_setComplete_(void *a1, const char *a2, ...)
{
  return [a1 setComplete:];
}

id objc_msgSend_setCompletion_(void *a1, const char *a2, ...)
{
  return [a1 setCompletion:];
}

id objc_msgSend_setCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 setCompletionHandler:];
}

id objc_msgSend_setCompletionTime_reserveTimeForCleanup_(void *a1, const char *a2, ...)
{
  return [a1 setCompletionTime:reserveTimeForCleanup:];
}

id objc_msgSend_setCompletionTimeForFatalError_(void *a1, const char *a2, ...)
{
  return [a1 setCompletionTimeForFatalError:];
}

id objc_msgSend_setComponent_(void *a1, const char *a2, ...)
{
  return [a1 setComponent:];
}

id objc_msgSend_setComponentListLock_(void *a1, const char *a2, ...)
{
  return [a1 setComponentListLock:];
}

id objc_msgSend_setComponentLock_(void *a1, const char *a2, ...)
{
  return [a1 setComponentLock:];
}

id objc_msgSend_setComponentManager_(void *a1, const char *a2, ...)
{
  return [a1 setComponentManager:];
}

id objc_msgSend_setComponentProcessor_(void *a1, const char *a2, ...)
{
  return [a1 setComponentProcessor:];
}

id objc_msgSend_setComponentsFromBundle_(void *a1, const char *a2, ...)
{
  return [a1 setComponentsFromBundle:];
}

id objc_msgSend_setComponentsSuccessful_(void *a1, const char *a2, ...)
{
  return [a1 setComponentsSuccessful:];
}

id objc_msgSend_setConcurrentSession_(void *a1, const char *a2, ...)
{
  return [a1 setConcurrentSession:];
}

id objc_msgSend_setCondition_(void *a1, const char *a2, ...)
{
  return [a1 setCondition:];
}

id objc_msgSend_setConditionLock_(void *a1, const char *a2, ...)
{
  return [a1 setConditionLock:];
}

id objc_msgSend_setConfigurationCompleteWithError_(void *a1, const char *a2, ...)
{
  return [a1 setConfigurationCompleteWithError:];
}

id objc_msgSend_setConfigurationProfilesSupported_(void *a1, const char *a2, ...)
{
  return [a1 setConfigurationProfilesSupported:];
}

id objc_msgSend_setConnection_(void *a1, const char *a2, ...)
{
  return [a1 setConnection:];
}

id objc_msgSend_setConnectionForPricing_(void *a1, const char *a2, ...)
{
  return [a1 setConnectionForPricing:];
}

id objc_msgSend_setContainerType_(void *a1, const char *a2, ...)
{
  return [a1 setContainerType:];
}

id objc_msgSend_setContainerized_(void *a1, const char *a2, ...)
{
  return [a1 setContainerized:];
}

id objc_msgSend_setContentBeingInstalled_(void *a1, const char *a2, ...)
{
  return [a1 setContentBeingInstalled:];
}

id objc_msgSend_setContentCacheProtocol_(void *a1, const char *a2, ...)
{
  return [a1 setContentCacheProtocol:];
}

id objc_msgSend_setContentDownloadConcurrentQueue_(void *a1, const char *a2, ...)
{
  return [a1 setContentDownloadConcurrentQueue:];
}

id objc_msgSend_setContentIdentifierString_(void *a1, const char *a2, ...)
{
  return [a1 setContentIdentifierString];
}

id objc_msgSend_setContentRange_(void *a1, const char *a2, ...)
{
  return [a1 setContentRange:];
}

id objc_msgSend_setContentRootPath_(void *a1, const char *a2, ...)
{
  return [a1 setContentRootPath:];
}

id objc_msgSend_setContext_(void *a1, const char *a2, ...)
{
  return [a1 setContext:];
}

id objc_msgSend_setControlFlags_(void *a1, const char *a2, ...)
{
  return [a1 setControlFlags:];
}

id objc_msgSend_setCoreDuetTriggeredPause_(void *a1, const char *a2, ...)
{
  return [a1 setCoreDuetTriggeredPause:];
}

id objc_msgSend_setCoreLocationOwnedResources_(void *a1, const char *a2, ...)
{
  return [a1 setCoreLocationOwnedResources:];
}

id objc_msgSend_setCount_(void *a1, const char *a2, ...)
{
  return [a1 setCount:];
}

id objc_msgSend_setCountryCode_(void *a1, const char *a2, ...)
{
  return [a1 setCountryCode:];
}

id objc_msgSend_setCreationDate_(void *a1, const char *a2, ...)
{
  return [a1 setCreationDate:];
}

id objc_msgSend_setCreationList_(void *a1, const char *a2, ...)
{
  return [a1 setCreationList:];
}

id objc_msgSend_setCreatorSN_(void *a1, const char *a2, ...)
{
  return [a1 setCreatorSN:];
}

id objc_msgSend_setCreatorUDID_(void *a1, const char *a2, ...)
{
  return [a1 setCreatorUDID:];
}

id objc_msgSend_setCredential_(void *a1, const char *a2, ...)
{
  return [a1 setCredential:];
}

id objc_msgSend_setCredentialHeaders_(void *a1, const char *a2, ...)
{
  return [a1 setCredentialHeaders:];
}

id objc_msgSend_setCredentials_(void *a1, const char *a2, ...)
{
  return [a1 setCredentials:];
}

id objc_msgSend_setCriticalComponents_(void *a1, const char *a2, ...)
{
  return [a1 setCriticalComponents:];
}

id objc_msgSend_setCriticalUpdatePrioritized_(void *a1, const char *a2, ...)
{
  return [a1 setCriticalUpdatePrioritized:];
}

id objc_msgSend_setCurrentDirectoryPath_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentDirectoryPath:];
}

id objc_msgSend_setCurrentOSVersion_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentOSVersion:];
}

id objc_msgSend_setCurrentProgress_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentProgress:];
}

id objc_msgSend_setCurrentRetry_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentRetry:];
}

id objc_msgSend_setCurrentTry_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentTry:];
}

id objc_msgSend_setCurrentUID_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentUID:];
}

id objc_msgSend_setCurrentUniqueIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentUniqueIdentifier:];
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return [a1 setData:];
}

id objc_msgSend_setDataContainerPaths_(void *a1, const char *a2, ...)
{
  return [a1 setDataContainerPaths:];
}

id objc_msgSend_setDataDict_(void *a1, const char *a2, ...)
{
  return [a1 setDataDict:];
}

id objc_msgSend_setDataVolumeCacheFolderPath_(void *a1, const char *a2, ...)
{
  return [a1 setDataVolumeCacheFolderPath:];
}

id objc_msgSend_setDate_(void *a1, const char *a2, ...)
{
  return [a1 setDate:];
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return [a1 setDateFormat:];
}

id objc_msgSend_setDefaultLogLevel_(void *a1, const char *a2, ...)
{
  return [a1 setDefaultLogLevel:];
}

id objc_msgSend_setDefaultQueue_(void *a1, const char *a2, ...)
{
  return [a1 setDefaultQueue:];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}

id objc_msgSend_setDelegateQueue_(void *a1, const char *a2, ...)
{
  return [a1 setDelegateQueue:];
}

id objc_msgSend_setDelegates_(void *a1, const char *a2, ...)
{
  return [a1 setDelegates:];
}

id objc_msgSend_setDeleteInstallableFileAfterInstall_(void *a1, const char *a2, ...)
{
  return [a1 setDeleteInstallableFileAfterInstall:];
}

id objc_msgSend_setDemoDeviceFlag(void *a1, const char *a2, ...)
{
  return _[a1 setDemoDeviceFlag];
}

id objc_msgSend_setDemoEnrollmentFlag_(void *a1, const char *a2, ...)
{
  return [a1 setDemoEnrollmentFlag:];
}

id objc_msgSend_setDemoPrepareInProgress_(void *a1, const char *a2, ...)
{
  return [a1 setDemoPrepareInProgress:];
}

id objc_msgSend_setDemoUpdateQueue_(void *a1, const char *a2, ...)
{
  return [a1 setDemoUpdateQueue:];
}

id objc_msgSend_setDemoVolumeCacheFolderPath_(void *a1, const char *a2, ...)
{
  return [a1 setDemoVolumeCacheFolderPath:];
}

id objc_msgSend_setDemodReady_(void *a1, const char *a2, ...)
{
  return [a1 setDemodReady:];
}

id objc_msgSend_setDemuxQueue_(void *a1, const char *a2, ...)
{
  return [a1 setDemuxQueue:];
}

id objc_msgSend_setDenyMulticast_(void *a1, const char *a2, ...)
{
  return [a1 setDenyMulticast:];
}

id objc_msgSend_setDependents_(void *a1, const char *a2, ...)
{
  return [a1 setDependents:];
}

id objc_msgSend_setDestinationDevice_(void *a1, const char *a2, ...)
{
  return [a1 setDestinationDevice:];
}

id objc_msgSend_setDevice_(void *a1, const char *a2, ...)
{
  return [a1 setDevice:];
}

id objc_msgSend_setDeviceChangedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceChangedHandler:];
}

id objc_msgSend_setDeviceFoundHandler_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceFoundHandler:];
}

id objc_msgSend_setDeviceLanguage_andRegion_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceLanguage:andRegion:];
}

id objc_msgSend_setDeviceLanguage_andRegion_sbRestartNeeded_sbRestartHandler_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceLanguage:andRegion:sbRestartNeeded:sbRestartHandler:];
}

id objc_msgSend_setDeviceLockAssertion_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceLockAssertion:];
}

id objc_msgSend_setDeviceLostHandler_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceLostHandler:];
}

id objc_msgSend_setDeviceManifest_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceManifest:];
}

id objc_msgSend_setDeviceMatching_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceMatching:];
}

id objc_msgSend_setDeviceName_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceName:];
}

id objc_msgSend_setDevicePublicID_(void *a1, const char *a2, ...)
{
  return [a1 setDevicePublicID:];
}

id objc_msgSend_setDeviceRegistry_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceRegistry:];
}

id objc_msgSend_setDeviceScanner_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceScanner:];
}

id objc_msgSend_setDeviceUDID_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceUDID:];
}

id objc_msgSend_setDevices_(void *a1, const char *a2, ...)
{
  return [a1 setDevices:];
}

id objc_msgSend_setDisableBackgroundInstall_(void *a1, const char *a2, ...)
{
  return [a1 setDisableBackgroundInstall:];
}

id objc_msgSend_setDisableIdleTimer_(void *a1, const char *a2, ...)
{
  return [a1 setDisableIdleTimer:];
}

id objc_msgSend_setDisconnectHandler_(void *a1, const char *a2, ...)
{
  return [a1 setDisconnectHandler:];
}

id objc_msgSend_setDiscoverableMode_(void *a1, const char *a2, ...)
{
  return [a1 setDiscoverableMode:];
}

id objc_msgSend_setDiscoveredPeers_(void *a1, const char *a2, ...)
{
  return [a1 setDiscoveredPeers:];
}

id objc_msgSend_setDiscoveryMode_(void *a1, const char *a2, ...)
{
  return [a1 setDiscoveryMode:];
}

id objc_msgSend_setDiskSpaceMonitoringTimer_(void *a1, const char *a2, ...)
{
  return [a1 setDiskSpaceMonitoringTimer:];
}

id objc_msgSend_setDiskSpaceRequired_(void *a1, const char *a2, ...)
{
  return [a1 setDiskSpaceRequired:];
}

id objc_msgSend_setDiskSpaceTriggeredPause_(void *a1, const char *a2, ...)
{
  return [a1 setDiskSpaceTriggeredPause:];
}

id objc_msgSend_setDiskSpacedRequired_(void *a1, const char *a2, ...)
{
  return [a1 setDiskSpacedRequired:];
}

id objc_msgSend_setDispatchQueue_(void *a1, const char *a2, ...)
{
  return [a1 setDispatchQueue:];
}

id objc_msgSend_setDispatchTable_(void *a1, const char *a2, ...)
{
  return [a1 setDispatchTable:];
}

id objc_msgSend_setDispatchTime_(void *a1, const char *a2, ...)
{
  return [a1 setDispatchTime:];
}

id objc_msgSend_setDisplayLayoutMonitor_(void *a1, const char *a2, ...)
{
  return [a1 setDisplayLayoutMonitor:];
}

id objc_msgSend_setDoPreSkyMigration_(void *a1, const char *a2, ...)
{
  return [a1 setDoPreSkyMigration:];
}

id objc_msgSend_setDoPreSydneyMigration_(void *a1, const char *a2, ...)
{
  return [a1 setDoPreSydneyMigration:];
}

id objc_msgSend_setDomains_(void *a1, const char *a2, ...)
{
  return [a1 setDomains:];
}

id objc_msgSend_setDomainsPlistFilePath_(void *a1, const char *a2, ...)
{
  return [a1 setDomainsPlistFilePath:];
}

id objc_msgSend_setDownloadCredentials_(void *a1, const char *a2, ...)
{
  return [a1 setDownloadCredentials:];
}

id objc_msgSend_setDownloadFeeAgreementStatus_(void *a1, const char *a2, ...)
{
  return [a1 setDownloadFeeAgreementStatus:];
}

id objc_msgSend_setDownloadManager_(void *a1, const char *a2, ...)
{
  return [a1 setDownloadManager:];
}

id objc_msgSend_setDownloadOnly_(void *a1, const char *a2, ...)
{
  return [a1 setDownloadOnly:];
}

id objc_msgSend_setDownloadQueue_(void *a1, const char *a2, ...)
{
  return [a1 setDownloadQueue:];
}

id objc_msgSend_setDownloadRequestCompletions_(void *a1, const char *a2, ...)
{
  return [a1 setDownloadRequestCompletions:];
}

id objc_msgSend_setDownloadRequestsLock_(void *a1, const char *a2, ...)
{
  return [a1 setDownloadRequestsLock:];
}

id objc_msgSend_setDownloadSource_(void *a1, const char *a2, ...)
{
  return [a1 setDownloadSource:];
}

id objc_msgSend_setDownloadSpeed_(void *a1, const char *a2, ...)
{
  return [a1 setDownloadSpeed:];
}

id objc_msgSend_setDownloadedBytes_(void *a1, const char *a2, ...)
{
  return [a1 setDownloadedBytes:];
}

id objc_msgSend_setDownloadedContentSource_(void *a1, const char *a2, ...)
{
  return [a1 setDownloadedContentSource:];
}

id objc_msgSend_setDownloadedSize_(void *a1, const char *a2, ...)
{
  return [a1 setDownloadedSize:];
}

id objc_msgSend_setDroppedByRapport_(void *a1, const char *a2, ...)
{
  return [a1 setDroppedByRapport:];
}

id objc_msgSend_setDuServer_(void *a1, const char *a2, ...)
{
  return [a1 setDuServer:];
}

id objc_msgSend_setEligible_(void *a1, const char *a2, ...)
{
  return [a1 setEligible:];
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setEnabled:];
}

id objc_msgSend_setEnabled_forDataclass_(void *a1, const char *a2, ...)
{
  return [a1 setEnabled:forDataclass:];
}

id objc_msgSend_setEnabledTopics_(void *a1, const char *a2, ...)
{
  return [a1 setEnabledTopics:];
}

id objc_msgSend_setEndowmentNamespaces_(void *a1, const char *a2, ...)
{
  return [a1 setEndowmentNamespaces:];
}

id objc_msgSend_setEndpoint_(void *a1, const char *a2, ...)
{
  return [a1 setEndpoint:];
}

id objc_msgSend_setEraseDataPlan_(void *a1, const char *a2, ...)
{
  return [a1 setEraseDataPlan:];
}

id objc_msgSend_setError_(void *a1, const char *a2, ...)
{
  return [a1 setError:];
}

id objc_msgSend_setErrorHandler_(void *a1, const char *a2, ...)
{
  return [a1 setErrorHandler:];
}

id objc_msgSend_setEventHandler_(void *a1, const char *a2, ...)
{
  return [a1 setEventHandler:];
}

id objc_msgSend_setExistingAccounts_(void *a1, const char *a2, ...)
{
  return [a1 setExistingAccounts:];
}

id objc_msgSend_setExistingFileSize_(void *a1, const char *a2, ...)
{
  return [a1 setExistingFileSize:];
}

id objc_msgSend_setExpectedOSBuild_(void *a1, const char *a2, ...)
{
  return [a1 setExpectedOSBuild:];
}

id objc_msgSend_setExpectedOSVersion_(void *a1, const char *a2, ...)
{
  return [a1 setExpectedOSVersion:];
}

id objc_msgSend_setExpirationTimer_(void *a1, const char *a2, ...)
{
  return [a1 setExpirationTimer:];
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return [a1 setExportedInterface:];
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return [a1 setExportedObject:];
}

id objc_msgSend_setExtension_(void *a1, const char *a2, ...)
{
  return [a1 setExtension:];
}

id objc_msgSend_setExtensionContextIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setExtensionContextIdentifier:];
}

id objc_msgSend_setFdc_(void *a1, const char *a2, ...)
{
  return [a1 setFdc:];
}

id objc_msgSend_setFdcDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setFdcDelegate:];
}

id objc_msgSend_setFeatures_(void *a1, const char *a2, ...)
{
  return [a1 setFeatures:];
}

id objc_msgSend_setFile_(void *a1, const char *a2, ...)
{
  return [a1 setFile:];
}

id objc_msgSend_setFileDownloadCachePaths_(void *a1, const char *a2, ...)
{
  return [a1 setFileDownloadCachePaths:];
}

id objc_msgSend_setFileDownloading_(void *a1, const char *a2, ...)
{
  return [a1 setFileDownloading:];
}

id objc_msgSend_setFileHandle_(void *a1, const char *a2, ...)
{
  return [a1 setFileHandle:];
}

id objc_msgSend_setFileHash_(void *a1, const char *a2, ...)
{
  return [a1 setFileHash:];
}

id objc_msgSend_setFileInfo_(void *a1, const char *a2, ...)
{
  return [a1 setFileInfo:];
}

id objc_msgSend_setFileManager_(void *a1, const char *a2, ...)
{
  return [a1 setFileManager:];
}

id objc_msgSend_setFileName_(void *a1, const char *a2, ...)
{
  return [a1 setFileName:];
}

id objc_msgSend_setFileType_(void *a1, const char *a2, ...)
{
  return [a1 setFileType:];
}

id objc_msgSend_setFinishedOperations_(void *a1, const char *a2, ...)
{
  return [a1 setFinishedOperations:];
}

id objc_msgSend_setFlag_(void *a1, const char *a2, ...)
{
  return [a1 setFlag:];
}

id objc_msgSend_setFlags_(void *a1, const char *a2, ...)
{
  return [a1 setFlags:];
}

id objc_msgSend_setFlashlightLevel_withError_(void *a1, const char *a2, ...)
{
  return [a1 setFlashlightLevel:withError:];
}

id objc_msgSend_setFmhDict_(void *a1, const char *a2, ...)
{
  return [a1 setFmhDict:];
}

id objc_msgSend_setFmhURLOverride_(void *a1, const char *a2, ...)
{
  return [a1 setFmhURLOverride:];
}

id objc_msgSend_setForBackgroundDownload_(void *a1, const char *a2, ...)
{
  return [a1 setForBackgroundDownload:];
}

id objc_msgSend_setForRemoval_(void *a1, const char *a2, ...)
{
  return [a1 setForRemoval:];
}

id objc_msgSend_setForced_(void *a1, const char *a2, ...)
{
  return [a1 setForced:];
}

id objc_msgSend_setForegroundAllowedApps_(void *a1, const char *a2, ...)
{
  return [a1 setForegroundAllowedApps:];
}

id objc_msgSend_setFreezeBackgroundDownload_(void *a1, const char *a2, ...)
{
  return [a1 setFreezeBackgroundDownload:];
}

id objc_msgSend_setFullKeysSent_(void *a1, const char *a2, ...)
{
  return [a1 setFullKeysSent:];
}

id objc_msgSend_setFullScreenState_(void *a1, const char *a2, ...)
{
  return [a1 setFullScreenState:];
}

id objc_msgSend_setFullScreenUIAppId_(void *a1, const char *a2, ...)
{
  return [a1 setFullScreenUIAppId:];
}

id objc_msgSend_setFullScreenUIAppMonitor_(void *a1, const char *a2, ...)
{
  return [a1 setFullScreenUIAppMonitor:];
}

id objc_msgSend_setFullScreenUILaunchError_iOS_(void *a1, const char *a2, ...)
{
  return [a1 setFullScreenUILaunchError_iOS:];
}

id objc_msgSend_setGroupContainerPaths_(void *a1, const char *a2, ...)
{
  return [a1 setGroupContainerPaths:];
}

id objc_msgSend_setHTTPMethod_(void *a1, const char *a2, ...)
{
  return [a1 setHTTPMethod:];
}

id objc_msgSend_setHandler_(void *a1, const char *a2, ...)
{
  return [a1 setHandler:];
}

id objc_msgSend_setHasEngagedWithCFU_(void *a1, const char *a2, ...)
{
  return [a1 setHasEngagedWithCFU:];
}

id objc_msgSend_setHasFactoryContent_(void *a1, const char *a2, ...)
{
  return [a1 setHasFactoryContent:];
}

id objc_msgSend_setHeartBeatMonitor_(void *a1, const char *a2, ...)
{
  return [a1 setHeartBeatMonitor:];
}

id objc_msgSend_setHelperAgent_(void *a1, const char *a2, ...)
{
  return [a1 setHelperAgent:];
}

id objc_msgSend_setHiddenState_(void *a1, const char *a2, ...)
{
  return [a1 setHiddenState:];
}

id objc_msgSend_setHidePasswordHandler_(void *a1, const char *a2, ...)
{
  return [a1 setHidePasswordHandler:];
}

id objc_msgSend_setHmacKey_(void *a1, const char *a2, ...)
{
  return [a1 setHmacKey:];
}

id objc_msgSend_setHour_(void *a1, const char *a2, ...)
{
  return [a1 setHour:];
}

id objc_msgSend_setHttpHeaders_(void *a1, const char *a2, ...)
{
  return [a1 setHttpHeaders:];
}

id objc_msgSend_setHubCertificateIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setHubCertificateIdentifier:];
}

id objc_msgSend_setHubHostName_(void *a1, const char *a2, ...)
{
  return [a1 setHubHostName:];
}

id objc_msgSend_setHubPort_(void *a1, const char *a2, ...)
{
  return [a1 setHubPort:];
}

id objc_msgSend_setHubProtocolVersion_(void *a1, const char *a2, ...)
{
  return [a1 setHubProtocolVersion:];
}

id objc_msgSend_setHubServer_(void *a1, const char *a2, ...)
{
  return [a1 setHubServer:];
}

id objc_msgSend_setHubVersion_(void *a1, const char *a2, ...)
{
  return [a1 setHubVersion:];
}

id objc_msgSend_setIOS_(void *a1, const char *a2, ...)
{
  return [a1 setIOS:];
}

id objc_msgSend_setIOSSpecificSettings(void *a1, const char *a2, ...)
{
  return _[a1 setIOSSpecificSettings];
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setIdentifier:];
}

id objc_msgSend_setIdsHandler_(void *a1, const char *a2, ...)
{
  return [a1 setIdsHandler:];
}

id objc_msgSend_setIdsService_(void *a1, const char *a2, ...)
{
  return [a1 setIdsService:];
}

id objc_msgSend_setIdsServiceQueue_(void *a1, const char *a2, ...)
{
  return [a1 setIdsServiceQueue:];
}

id objc_msgSend_setImportance_error_(void *a1, const char *a2, ...)
{
  return [a1 setImportance:error:];
}

id objc_msgSend_setIncludeHiddenNetworks_(void *a1, const char *a2, ...)
{
  return [a1 setIncludeHiddenNetworks:];
}

id objc_msgSend_setIncludeProperties_(void *a1, const char *a2, ...)
{
  return [a1 setIncludeProperties:];
}

id objc_msgSend_setInfo_(void *a1, const char *a2, ...)
{
  return [a1 setInfo:];
}

id objc_msgSend_setInitialODRAssetPromises_error_(void *a1, const char *a2, ...)
{
  return [a1 setInitialODRAssetPromises:error:];
}

id objc_msgSend_setInstallError_(void *a1, const char *a2, ...)
{
  return [a1 setInstallError:];
}

id objc_msgSend_setInstallOptions_error_(void *a1, const char *a2, ...)
{
  return [a1 setInstallOptions:error:];
}

id objc_msgSend_setInstallQueue_(void *a1, const char *a2, ...)
{
  return [a1 setInstallQueue:];
}

id objc_msgSend_setInstallTargetType_(void *a1, const char *a2, ...)
{
  return [a1 setInstallTargetType:];
}

id objc_msgSend_setInstallationOrder_(void *a1, const char *a2, ...)
{
  return [a1 setInstallationOrder:];
}

id objc_msgSend_setInstalledBundle_(void *a1, const char *a2, ...)
{
  return [a1 setInstalledBundle:];
}

id objc_msgSend_setInstalledFactoryBundleID_(void *a1, const char *a2, ...)
{
  return [a1 setInstalledFactoryBundleID:];
}

id objc_msgSend_setInstallingBundle_(void *a1, const char *a2, ...)
{
  return [a1 setInstallingBundle:];
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return [a1 setInterruptionHandler:];
}

id objc_msgSend_setInterval_(void *a1, const char *a2, ...)
{
  return [a1 setInterval:];
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return [a1 setInvalidationHandler:];
}

id objc_msgSend_setIsBackgroundDownloadQueueEmpty_(void *a1, const char *a2, ...)
{
  return [a1 setIsBackgroundDownloadQueueEmpty:];
}

id objc_msgSend_setIsCriticalUpdate_(void *a1, const char *a2, ...)
{
  return [a1 setIsCriticalUpdate:];
}

id objc_msgSend_setIsDeviceReachable_(void *a1, const char *a2, ...)
{
  return [a1 setIsDeviceReachable:];
}

id objc_msgSend_setIsDiffPatch_(void *a1, const char *a2, ...)
{
  return [a1 setIsDiffPatch:];
}

id objc_msgSend_setIsDone_(void *a1, const char *a2, ...)
{
  return [a1 setIsDone:];
}

id objc_msgSend_setIsDownloadPaused_(void *a1, const char *a2, ...)
{
  return [a1 setIsDownloadPaused:];
}

id objc_msgSend_setIsEnrolled_(void *a1, const char *a2, ...)
{
  return [a1 setIsEnrolled:];
}

id objc_msgSend_setIsInBubble_(void *a1, const char *a2, ...)
{
  return [a1 setIsInBubble:];
}

id objc_msgSend_setIsInternalBuild_(void *a1, const char *a2, ...)
{
  return [a1 setIsInternalBuild:];
}

id objc_msgSend_setIsLeaf_(void *a1, const char *a2, ...)
{
  return [a1 setIsLeaf:];
}

id objc_msgSend_setIsLogicSync_(void *a1, const char *a2, ...)
{
  return [a1 setIsLogicSync:];
}

id objc_msgSend_setIsNPIDevice_(void *a1, const char *a2, ...)
{
  return [a1 setIsNPIDevice:];
}

id objc_msgSend_setIsOptedIn_(void *a1, const char *a2, ...)
{
  return [a1 setIsOptedIn:];
}

id objc_msgSend_setIsPost_(void *a1, const char *a2, ...)
{
  return [a1 setIsPost:];
}

id objc_msgSend_setIsRoot_(void *a1, const char *a2, ...)
{
  return [a1 setIsRoot:];
}

id objc_msgSend_setIsStoreOpenNow_(void *a1, const char *a2, ...)
{
  return [a1 setIsStoreOpenNow:];
}

id objc_msgSend_setIsUsernameEditable_(void *a1, const char *a2, ...)
{
  return [a1 setIsUsernameEditable:];
}

id objc_msgSend_setItemBeingInstalled_(void *a1, const char *a2, ...)
{
  return [a1 setItemBeingInstalled:];
}

id objc_msgSend_setJustBootUp_(void *a1, const char *a2, ...)
{
  return [a1 setJustBootUp:];
}

id objc_msgSend_setKey_(void *a1, const char *a2, ...)
{
  return [a1 setKey:];
}

id objc_msgSend_setKnownNetworkProfile_(void *a1, const char *a2, ...)
{
  return [a1 setKnownNetworkProfile:];
}

id objc_msgSend_setLanguage_(void *a1, const char *a2, ...)
{
  return [a1 setLanguage:];
}

id objc_msgSend_setLastBundleUpdateDate_(void *a1, const char *a2, ...)
{
  return [a1 setLastBundleUpdateDate:];
}

id objc_msgSend_setLastDownloadedByte_(void *a1, const char *a2, ...)
{
  return [a1 setLastDownloadedByte:];
}

id objc_msgSend_setLastMigrationVersion_(void *a1, const char *a2, ...)
{
  return [a1 setLastMigrationVersion:];
}

id objc_msgSend_setLatitude_(void *a1, const char *a2, ...)
{
  return [a1 setLatitude:];
}

id objc_msgSend_setLaunchPath_(void *a1, const char *a2, ...)
{
  return [a1 setLaunchPath:];
}

id objc_msgSend_setLeafCertificate_(void *a1, const char *a2, ...)
{
  return [a1 setLeafCertificate:];
}

id objc_msgSend_setLength_(void *a1, const char *a2, ...)
{
  return [a1 setLength:];
}

id objc_msgSend_setListenerRPClient_(void *a1, const char *a2, ...)
{
  return [a1 setListenerRPClient:];
}

id objc_msgSend_setLocalCredential_(void *a1, const char *a2, ...)
{
  return [a1 setLocalCredential:];
}

id objc_msgSend_setLocalDeviceUpdatedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setLocalDeviceUpdatedHandler:];
}

id objc_msgSend_setLocalHubError_(void *a1, const char *a2, ...)
{
  return [a1 setLocalHubError:];
}

id objc_msgSend_setLocalHubFailureReason_(void *a1, const char *a2, ...)
{
  return [a1 setLocalHubFailureReason:];
}

id objc_msgSend_setLocalHubReachable_(void *a1, const char *a2, ...)
{
  return [a1 setLocalHubReachable:];
}

id objc_msgSend_setLocalHubURLSchema_(void *a1, const char *a2, ...)
{
  return [a1 setLocalHubURLSchema:];
}

id objc_msgSend_setLocalSecret_(void *a1, const char *a2, ...)
{
  return [a1 setLocalSecret:];
}

id objc_msgSend_setLocalURLList_(void *a1, const char *a2, ...)
{
  return [a1 setLocalURLList:];
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return [a1 setLocale:];
}

id objc_msgSend_setLocaleCodeStr_(void *a1, const char *a2, ...)
{
  return [a1 setLocaleCodeStr:];
}

id objc_msgSend_setLocationStateObserver_(void *a1, const char *a2, ...)
{
  return [a1 setLocationStateObserver:];
}

id objc_msgSend_setLocations_(void *a1, const char *a2, ...)
{
  return [a1 setLocations:];
}

id objc_msgSend_setLogCache_(void *a1, const char *a2, ...)
{
  return [a1 setLogCache:];
}

id objc_msgSend_setLogFP_(void *a1, const char *a2, ...)
{
  return [a1 setLogFP:];
}

id objc_msgSend_setLogFilePath_(void *a1, const char *a2, ...)
{
  return [a1 setLogFilePath:];
}

id objc_msgSend_setLogicSync_(void *a1, const char *a2, ...)
{
  return [a1 setLogicSync:];
}

id objc_msgSend_setLogsToWrite_(void *a1, const char *a2, ...)
{
  return [a1 setLogsToWrite:];
}

id objc_msgSend_setLongitude_(void *a1, const char *a2, ...)
{
  return [a1 setLongitude:];
}

id objc_msgSend_setLowBatteryLocateEnabled_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 setLowBatteryLocateEnabled:withCompletion:];
}

id objc_msgSend_setLowPowerMode_(void *a1, const char *a2, ...)
{
  return [a1 setLowPowerMode:];
}

id objc_msgSend_setMacOS_(void *a1, const char *a2, ...)
{
  return [a1 setMacOS:];
}

id objc_msgSend_setManifestInfo_(void *a1, const char *a2, ...)
{
  return [a1 setManifestInfo:];
}

id objc_msgSend_setManifestVerifier_(void *a1, const char *a2, ...)
{
  return [a1 setManifestVerifier:];
}

id objc_msgSend_setManifestVersion_(void *a1, const char *a2, ...)
{
  return [a1 setManifestVersion:];
}

id objc_msgSend_setMaskValuesLookUpTable_(void *a1, const char *a2, ...)
{
  return [a1 setMaskValuesLookUpTable:];
}

id objc_msgSend_setMasterManifest_(void *a1, const char *a2, ...)
{
  return [a1 setMasterManifest:];
}

id objc_msgSend_setMaxConcurrentOperationCount_(void *a1, const char *a2, ...)
{
  return [a1 setMaxConcurrentOperationCount:];
}

id objc_msgSend_setMaxConcurrentRequests_(void *a1, const char *a2, ...)
{
  return [a1 setMaxConcurrentRequests:];
}

id objc_msgSend_setMaxRetry_(void *a1, const char *a2, ...)
{
  return [a1 setMaxRetry:];
}

id objc_msgSend_setMaxStoreResults_(void *a1, const char *a2, ...)
{
  return [a1 setMaxStoreResults:];
}

id objc_msgSend_setMaximumTerminationResistance_(void *a1, const char *a2, ...)
{
  return [a1 setMaximumTerminationResistance:];
}

id objc_msgSend_setMessage_(void *a1, const char *a2, ...)
{
  return [a1 setMessage:];
}

id objc_msgSend_setMessageHandlerTable_(void *a1, const char *a2, ...)
{
  return [a1 setMessageHandlerTable:];
}

id objc_msgSend_setMessageQueue_(void *a1, const char *a2, ...)
{
  return [a1 setMessageQueue:];
}

id objc_msgSend_setMetadata_forFile_(void *a1, const char *a2, ...)
{
  return [a1 setMetadata:forFile:];
}

id objc_msgSend_setMigrationDone_(void *a1, const char *a2, ...)
{
  return [a1 setMigrationDone:];
}

id objc_msgSend_setMinimumRSSI_(void *a1, const char *a2, ...)
{
  return [a1 setMinimumRSSI:];
}

id objc_msgSend_setMinute_(void *a1, const char *a2, ...)
{
  return [a1 setMinute:];
}

id objc_msgSend_setMode_(void *a1, const char *a2, ...)
{
  return [a1 setMode:];
}

id objc_msgSend_setModeLock_(void *a1, const char *a2, ...)
{
  return [a1 setModeLock:];
}

id objc_msgSend_setModificationDate_(void *a1, const char *a2, ...)
{
  return [a1 setModificationDate:];
}

id objc_msgSend_setMulticastPreferenceSet_(void *a1, const char *a2, ...)
{
  return [a1 setMulticastPreferenceSet:];
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return [a1 setName:];
}

id objc_msgSend_setNearbyObjectMonitor_(void *a1, const char *a2, ...)
{
  return [a1 setNearbyObjectMonitor:];
}

id objc_msgSend_setNearbyObjects_(void *a1, const char *a2, ...)
{
  return [a1 setNearbyObjects:];
}

id objc_msgSend_setNeedUpdate_(void *a1, const char *a2, ...)
{
  return [a1 setNeedUpdate:];
}

id objc_msgSend_setNeedsSandboxExtensions_(void *a1, const char *a2, ...)
{
  return [a1 setNeedsSandboxExtensions:];
}

id objc_msgSend_setNetworkOwnedResources_(void *a1, const char *a2, ...)
{
  return [a1 setNetworkOwnedResources:];
}

id objc_msgSend_setNextContentRevertDate_(void *a1, const char *a2, ...)
{
  return [a1 setNextContentRevertDate:];
}

id objc_msgSend_setNextRetryTime_(void *a1, const char *a2, ...)
{
  return [a1 setNextRetryTime:];
}

id objc_msgSend_setNextStoreClosedDate_(void *a1, const char *a2, ...)
{
  return [a1 setNextStoreClosedDate:];
}

id objc_msgSend_setNextStoreOpenDate_(void *a1, const char *a2, ...)
{
  return [a1 setNextStoreOpenDate:];
}

id objc_msgSend_setNiSession_(void *a1, const char *a2, ...)
{
  return [a1 setNiSession:];
}

id objc_msgSend_setNonContainerizedContentRoots_(void *a1, const char *a2, ...)
{
  return [a1 setNonContainerizedContentRoots:];
}

id objc_msgSend_setNumConcurrentRequests_(void *a1, const char *a2, ...)
{
  return [a1 setNumConcurrentRequests:];
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKey:];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKeyedSubscript:];
}

id objc_msgSend_setObliterate_(void *a1, const char *a2, ...)
{
  return [a1 setObliterate:];
}

id objc_msgSend_setObserver_(void *a1, const char *a2, ...)
{
  return [a1 setObserver:];
}

id objc_msgSend_setObservers_(void *a1, const char *a2, ...)
{
  return [a1 setObservers:];
}

id objc_msgSend_setOfflineDuration_(void *a1, const char *a2, ...)
{
  return [a1 setOfflineDuration:];
}

id objc_msgSend_setOpenDate_(void *a1, const char *a2, ...)
{
  return [a1 setOpenDate:];
}

id objc_msgSend_setOperationQueue_(void *a1, const char *a2, ...)
{
  return [a1 setOperationQueue:];
}

id objc_msgSend_setOptions_(void *a1, const char *a2, ...)
{
  return [a1 setOptions:];
}

id objc_msgSend_setOriginServer_(void *a1, const char *a2, ...)
{
  return [a1 setOriginServer:];
}

id objc_msgSend_setOsVersion_(void *a1, const char *a2, ...)
{
  return [a1 setOsVersion:];
}

id objc_msgSend_setOsVersionStr_(void *a1, const char *a2, ...)
{
  return [a1 setOsVersionStr:];
}

id objc_msgSend_setOutData_(void *a1, const char *a2, ...)
{
  return [a1 setOutData:];
}

id objc_msgSend_setPOSDevice_(void *a1, const char *a2, ...)
{
  return [a1 setPOSDevice:];
}

id objc_msgSend_setPOSDeviceFlag(void *a1, const char *a2, ...)
{
  return _[a1 setPOSDeviceFlag];
}

id objc_msgSend_setPacketLoss_(void *a1, const char *a2, ...)
{
  return [a1 setPacketLoss:];
}

id objc_msgSend_setPairSetupFlags_(void *a1, const char *a2, ...)
{
  return [a1 setPairSetupFlags:];
}

id objc_msgSend_setPaired_(void *a1, const char *a2, ...)
{
  return [a1 setPaired:];
}

id objc_msgSend_setPairingHandlers_(void *a1, const char *a2, ...)
{
  return [a1 setPairingHandlers:];
}

id objc_msgSend_setPairingManager_(void *a1, const char *a2, ...)
{
  return [a1 setPairingManager:];
}

id objc_msgSend_setPairingMode_(void *a1, const char *a2, ...)
{
  return [a1 setPairingMode:];
}

id objc_msgSend_setPairingPassword_(void *a1, const char *a2, ...)
{
  return [a1 setPairingPassword:];
}

id objc_msgSend_setParallelInstallQueue_(void *a1, const char *a2, ...)
{
  return [a1 setParallelInstallQueue:];
}

id objc_msgSend_setParallelProcessing_(void *a1, const char *a2, ...)
{
  return [a1 setParallelProcessing:];
}

id objc_msgSend_setPasscodeModificationAllowed_(void *a1, const char *a2, ...)
{
  return [a1 setPasscodeModificationAllowed:];
}

id objc_msgSend_setPassword_(void *a1, const char *a2, ...)
{
  return [a1 setPassword:];
}

id objc_msgSend_setPasswordType_(void *a1, const char *a2, ...)
{
  return [a1 setPasswordType:];
}

id objc_msgSend_setPath_(void *a1, const char *a2, ...)
{
  return [a1 setPath:];
}

id objc_msgSend_setPathController_(void *a1, const char *a2, ...)
{
  return [a1 setPathController:];
}

id objc_msgSend_setPayload_(void *a1, const char *a2, ...)
{
  return [a1 setPayload:];
}

id objc_msgSend_setPeerChangeToken_(void *a1, const char *a2, ...)
{
  return [a1 setPeerChangeToken:];
}

id objc_msgSend_setPendingComponents_(void *a1, const char *a2, ...)
{
  return [a1 setPendingComponents:];
}

id objc_msgSend_setPendingMessage_(void *a1, const char *a2, ...)
{
  return [a1 setPendingMessage:];
}

id objc_msgSend_setPendingRequests_(void *a1, const char *a2, ...)
{
  return [a1 setPendingRequests:];
}

id objc_msgSend_setPercent_(void *a1, const char *a2, ...)
{
  return [a1 setPercent:];
}

id objc_msgSend_setPercentageProgress_(void *a1, const char *a2, ...)
{
  return [a1 setPercentageProgress:];
}

id objc_msgSend_setPingInterval_(void *a1, const char *a2, ...)
{
  return [a1 setPingInterval:];
}

id objc_msgSend_setPingTimer_(void *a1, const char *a2, ...)
{
  return [a1 setPingTimer:];
}

id objc_msgSend_setPlaceholderPromise_error_(void *a1, const char *a2, ...)
{
  return [a1 setPlaceholderPromise:error:];
}

id objc_msgSend_setPlatformType_(void *a1, const char *a2, ...)
{
  return [a1 setPlatformType:];
}

id objc_msgSend_setPlatformWithManifestProductList_(void *a1, const char *a2, ...)
{
  return [a1 setPlatformWithManifestProductList:];
}

id objc_msgSend_setPlugInContainerPaths_(void *a1, const char *a2, ...)
{
  return [a1 setPlugInContainerPaths:];
}

id objc_msgSend_setPollingQueue_(void *a1, const char *a2, ...)
{
  return [a1 setPollingQueue:];
}

id objc_msgSend_setPort_(void *a1, const char *a2, ...)
{
  return [a1 setPort:];
}

id objc_msgSend_setPostData_(void *a1, const char *a2, ...)
{
  return [a1 setPostData:];
}

id objc_msgSend_setPostFile_(void *a1, const char *a2, ...)
{
  return [a1 setPostFile:];
}

id objc_msgSend_setPosterObserver_(void *a1, const char *a2, ...)
{
  return [a1 setPosterObserver:];
}

id objc_msgSend_setPower_error_(void *a1, const char *a2, ...)
{
  return [a1 setPower:error:];
}

id objc_msgSend_setPowerAssertion_(void *a1, const char *a2, ...)
{
  return [a1 setPowerAssertion:];
}

id objc_msgSend_setPowerMode_fromSource_(void *a1, const char *a2, ...)
{
  return [a1 setPowerMode:fromSource:];
}

id objc_msgSend_setPreInstalledContent_(void *a1, const char *a2, ...)
{
  return [a1 setPreInstalledContent:];
}

id objc_msgSend_setPredicates_(void *a1, const char *a2, ...)
{
  return [a1 setPredicates:];
}

id objc_msgSend_setPreferencesFile_(void *a1, const char *a2, ...)
{
  return [a1 setPreferencesFile:];
}

id objc_msgSend_setPreferredStoreID_(void *a1, const char *a2, ...)
{
  return [a1 setPreferredStoreID:];
}

id objc_msgSend_setPrepareQueue_(void *a1, const char *a2, ...)
{
  return [a1 setPrepareQueue:];
}

id objc_msgSend_setPricingAppUpdateDeferred_(void *a1, const char *a2, ...)
{
  return [a1 setPricingAppUpdateDeferred:];
}

id objc_msgSend_setPrivateKey_(void *a1, const char *a2, ...)
{
  return [a1 setPrivateKey:];
}

id objc_msgSend_setProceeded_(void *a1, const char *a2, ...)
{
  return [a1 setProceeded:];
}

id objc_msgSend_setProfileIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setProfileIdentifier:];
}

id objc_msgSend_setProfilePath_(void *a1, const char *a2, ...)
{
  return [a1 setProfilePath:];
}

id objc_msgSend_setPromptForPasswordHandler_(void *a1, const char *a2, ...)
{
  return [a1 setPromptForPasswordHandler:];
}

id objc_msgSend_setProperty_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setProperty:forKey:];
}

id objc_msgSend_setProtobufAction_forIncomingRequestsOfType_(void *a1, const char *a2, ...)
{
  return [a1 setProtobufAction:forIncomingRequestsOfType:];
}

id objc_msgSend_setProtobufAction_forIncomingResponsesOfType_(void *a1, const char *a2, ...)
{
  return [a1 setProtobufAction:forIncomingResponsesOfType:];
}

id objc_msgSend_setPseudoContentRootPath_(void *a1, const char *a2, ...)
{
  return [a1 setPseudoContentRootPath:];
}

id objc_msgSend_setPurged_(void *a1, const char *a2, ...)
{
  return [a1 setPurged:];
}

id objc_msgSend_setQualityOfService_(void *a1, const char *a2, ...)
{
  return [a1 setQualityOfService:];
}

id objc_msgSend_setQueryItems_(void *a1, const char *a2, ...)
{
  return [a1 setQueryItems:];
}

id objc_msgSend_setQueue_(void *a1, const char *a2, ...)
{
  return [a1 setQueue:];
}

id objc_msgSend_setQueuedPingType_(void *a1, const char *a2, ...)
{
  return [a1 setQueuedPingType:];
}

id objc_msgSend_setROS_(void *a1, const char *a2, ...)
{
  return [a1 setROS:];
}

id objc_msgSend_setRawDataKeyMapping_(void *a1, const char *a2, ...)
{
  return [a1 setRawDataKeyMapping:];
}

id objc_msgSend_setRawTimingData_(void *a1, const char *a2, ...)
{
  return [a1 setRawTimingData:];
}

id objc_msgSend_setReachabilityLastUpdatedTime_(void *a1, const char *a2, ...)
{
  return [a1 setReachabilityLastUpdatedTime:];
}

id objc_msgSend_setReachable_(void *a1, const char *a2, ...)
{
  return [a1 setReachable:];
}

id objc_msgSend_setRebootType_(void *a1, const char *a2, ...)
{
  return [a1 setRebootType:];
}

id objc_msgSend_setRecoveryKey_(void *a1, const char *a2, ...)
{
  return [a1 setRecoveryKey:];
}

id objc_msgSend_setRedirected_(void *a1, const char *a2, ...)
{
  return [a1 setRedirected:];
}

id objc_msgSend_setRegion_(void *a1, const char *a2, ...)
{
  return [a1 setRegion:];
}

id objc_msgSend_setRegistrationInfo_(void *a1, const char *a2, ...)
{
  return [a1 setRegistrationInfo:];
}

id objc_msgSend_setRememberUponSuccessfulAssociation_(void *a1, const char *a2, ...)
{
  return [a1 setRememberUponSuccessfulAssociation:];
}

id objc_msgSend_setRemoteAlertHandle_(void *a1, const char *a2, ...)
{
  return [a1 setRemoteAlertHandle:];
}

id objc_msgSend_setRemoteCredential_(void *a1, const char *a2, ...)
{
  return [a1 setRemoteCredential:];
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return [a1 setRemoteObjectInterface:];
}

id objc_msgSend_setRemoteURLList_(void *a1, const char *a2, ...)
{
  return [a1 setRemoteURLList:];
}

id objc_msgSend_setRemovableComponents_(void *a1, const char *a2, ...)
{
  return [a1 setRemovableComponents:];
}

id objc_msgSend_setRemoveOperations_(void *a1, const char *a2, ...)
{
  return [a1 setRemoveOperations:];
}

id objc_msgSend_setReport_reportLength_withIdentifier_forType_error_(void *a1, const char *a2, ...)
{
  return [a1 setReport:reportLength:withIdentifier:forType:error:];
}

id objc_msgSend_setRequest_(void *a1, const char *a2, ...)
{
  return [a1 setRequest:];
}

id objc_msgSend_setRequestCachePolicy_(void *a1, const char *a2, ...)
{
  return [a1 setRequestCachePolicy:];
}

id objc_msgSend_setRequestDispatchLock_(void *a1, const char *a2, ...)
{
  return [a1 setRequestDispatchLock:];
}

id objc_msgSend_setRequestEnd_(void *a1, const char *a2, ...)
{
  return [a1 setRequestEnd:];
}

id objc_msgSend_setRequestInfo_(void *a1, const char *a2, ...)
{
  return [a1 setRequestInfo:];
}

id objc_msgSend_setRequestPerSession_(void *a1, const char *a2, ...)
{
  return [a1 setRequestPerSession:];
}

id objc_msgSend_setRequestStart_(void *a1, const char *a2, ...)
{
  return [a1 setRequestStart:];
}

id objc_msgSend_setRequestStr_(void *a1, const char *a2, ...)
{
  return [a1 setRequestStr:];
}

id objc_msgSend_setRequestTimeoutCount_(void *a1, const char *a2, ...)
{
  return [a1 setRequestTimeoutCount:];
}

id objc_msgSend_setResetCDP_(void *a1, const char *a2, ...)
{
  return [a1 setResetCDP:];
}

id objc_msgSend_setResponse_(void *a1, const char *a2, ...)
{
  return [a1 setResponse:];
}

id objc_msgSend_setResponseEnd_(void *a1, const char *a2, ...)
{
  return [a1 setResponseEnd:];
}

id objc_msgSend_setResponseHandlers_(void *a1, const char *a2, ...)
{
  return [a1 setResponseHandlers:];
}

id objc_msgSend_setResponseStart_(void *a1, const char *a2, ...)
{
  return [a1 setResponseStart:];
}

id objc_msgSend_setRestored_(void *a1, const char *a2, ...)
{
  return [a1 setRestored:];
}

id objc_msgSend_setResult_(void *a1, const char *a2, ...)
{
  return [a1 setResult:];
}

id objc_msgSend_setRetransmitBytes_(void *a1, const char *a2, ...)
{
  return [a1 setRetransmitBytes:];
}

id objc_msgSend_setRetryAfter_(void *a1, const char *a2, ...)
{
  return [a1 setRetryAfter:];
}

id objc_msgSend_setRetryAttempts_(void *a1, const char *a2, ...)
{
  return [a1 setRetryAttempts:];
}

id objc_msgSend_setRetryCount_(void *a1, const char *a2, ...)
{
  return [a1 setRetryCount:];
}

id objc_msgSend_setRetryLeft_(void *a1, const char *a2, ...)
{
  return [a1 setRetryLeft:];
}

id objc_msgSend_setRetryTimer_(void *a1, const char *a2, ...)
{
  return [a1 setRetryTimer:];
}

id objc_msgSend_setRetryable_(void *a1, const char *a2, ...)
{
  return [a1 setRetryable:];
}

id objc_msgSend_setRetryableComponents_(void *a1, const char *a2, ...)
{
  return [a1 setRetryableComponents:];
}

id objc_msgSend_setRevertDate_(void *a1, const char *a2, ...)
{
  return [a1 setRevertDate:];
}

id objc_msgSend_setRollbackOperations_(void *a1, const char *a2, ...)
{
  return [a1 setRollbackOperations:];
}

id objc_msgSend_setRootFileSystemPath_(void *a1, const char *a2, ...)
{
  return [a1 setRootFileSystemPath:];
}

id objc_msgSend_setRootPath_(void *a1, const char *a2, ...)
{
  return [a1 setRootPath:];
}

id objc_msgSend_setRpClient_(void *a1, const char *a2, ...)
{
  return [a1 setRpClient:];
}

id objc_msgSend_setRpDevice_(void *a1, const char *a2, ...)
{
  return [a1 setRpDevice:];
}

id objc_msgSend_setRpDeviceAdvertiser_(void *a1, const char *a2, ...)
{
  return [a1 setRpDeviceAdvertiser:];
}

id objc_msgSend_setRpDeviceExplorer_(void *a1, const char *a2, ...)
{
  return [a1 setRpDeviceExplorer:];
}

id objc_msgSend_setRpLocalDevice_(void *a1, const char *a2, ...)
{
  return [a1 setRpLocalDevice:];
}

id objc_msgSend_setRpMessageHandler_(void *a1, const char *a2, ...)
{
  return [a1 setRpMessageHandler:];
}

id objc_msgSend_setRpServer_(void *a1, const char *a2, ...)
{
  return [a1 setRpServer:];
}

id objc_msgSend_setS3Server_(void *a1, const char *a2, ...)
{
  return [a1 setS3Server:];
}

id objc_msgSend_setS3ServerFailureReason_(void *a1, const char *a2, ...)
{
  return [a1 setS3ServerFailureReason:];
}

id objc_msgSend_setS3url_(void *a1, const char *a2, ...)
{
  return [a1 setS3url:];
}

id objc_msgSend_setSEPDemoMode_(void *a1, const char *a2, ...)
{
  return [a1 setSEPDemoMode:];
}

id objc_msgSend_setSSIDList_(void *a1, const char *a2, ...)
{
  return [a1 setSSIDList:];
}

id objc_msgSend_setSavePath_(void *a1, const char *a2, ...)
{
  return [a1 setSavePath:];
}

id objc_msgSend_setSbAppSwitcher_(void *a1, const char *a2, ...)
{
  return [a1 setSbAppSwitcher:];
}

id objc_msgSend_setScanRate_(void *a1, const char *a2, ...)
{
  return [a1 setScanRate:];
}

id objc_msgSend_setScanResult_(void *a1, const char *a2, ...)
{
  return [a1 setScanResult:];
}

id objc_msgSend_setSegmentedManifestWithRigorousFlag_(void *a1, const char *a2, ...)
{
  return [a1 setSegmentedManifestWithRigorousFlag:];
}

id objc_msgSend_setSemaphore_(void *a1, const char *a2, ...)
{
  return [a1 setSemaphore:];
}

id objc_msgSend_setSenderRPClients_(void *a1, const char *a2, ...)
{
  return [a1 setSenderRPClients:];
}

id objc_msgSend_setSerialNumber_(void *a1, const char *a2, ...)
{
  return [a1 setSerialNumber:];
}

id objc_msgSend_setServer_(void *a1, const char *a2, ...)
{
  return [a1 setServer:];
}

id objc_msgSend_setServerList_(void *a1, const char *a2, ...)
{
  return [a1 setServerList:];
}

id objc_msgSend_setServerType_(void *a1, const char *a2, ...)
{
  return [a1 setServerType:];
}

id objc_msgSend_setServiceOwnersManager_(void *a1, const char *a2, ...)
{
  return [a1 setServiceOwnersManager:];
}

id objc_msgSend_setServiceType_(void *a1, const char *a2, ...)
{
  return [a1 setServiceType:];
}

id objc_msgSend_setSession_(void *a1, const char *a2, ...)
{
  return [a1 setSession:];
}

id objc_msgSend_setSessionTable_(void *a1, const char *a2, ...)
{
  return [a1 setSessionTable:];
}

id objc_msgSend_setSessionUUID_(void *a1, const char *a2, ...)
{
  return [a1 setSessionUUID:];
}

id objc_msgSend_setSettingsComponentNames_(void *a1, const char *a2, ...)
{
  return [a1 setSettingsComponentNames:];
}

id objc_msgSend_setSettingsDict_(void *a1, const char *a2, ...)
{
  return [a1 setSettingsDict:];
}

id objc_msgSend_setSettingsFilePath_(void *a1, const char *a2, ...)
{
  return [a1 setSettingsFilePath:];
}

id objc_msgSend_setSfAirDropController_(void *a1, const char *a2, ...)
{
  return [a1 setSfAirDropController:];
}

id objc_msgSend_setSharedStore_(void *a1, const char *a2, ...)
{
  return [a1 setSharedStore:];
}

id objc_msgSend_setSharedStoreLock_(void *a1, const char *a2, ...)
{
  return [a1 setSharedStoreLock:];
}

id objc_msgSend_setShouldForgetKnownNetworkUponUnlock_(void *a1, const char *a2, ...)
{
  return [a1 setShouldForgetKnownNetworkUponUnlock:];
}

id objc_msgSend_setShowPasswordHandler_(void *a1, const char *a2, ...)
{
  return [a1 setShowPasswordHandler:];
}

id objc_msgSend_setShowUI_(void *a1, const char *a2, ...)
{
  return [a1 setShowUI:];
}

id objc_msgSend_setSignInContexts_(void *a1, const char *a2, ...)
{
  return [a1 setSignInContexts:];
}

id objc_msgSend_setSignOutContexts_(void *a1, const char *a2, ...)
{
  return [a1 setSignOutContexts:];
}

id objc_msgSend_setSignedManifest_(void *a1, const char *a2, ...)
{
  return [a1 setSignedManifest:];
}

id objc_msgSend_setSigningKey_(void *a1, const char *a2, ...)
{
  return [a1 setSigningKey:];
}

id objc_msgSend_setSignpostId_(void *a1, const char *a2, ...)
{
  return [a1 setSignpostId:];
}

id objc_msgSend_setSkipHashCheck_(void *a1, const char *a2, ...)
{
  return [a1 setSkipHashCheck:];
}

id objc_msgSend_setSkipped_(void *a1, const char *a2, ...)
{
  return [a1 setSkipped:];
}

id objc_msgSend_setSkyEquivalentVersion_(void *a1, const char *a2, ...)
{
  return [a1 setSkyEquivalentVersion:];
}

id objc_msgSend_setSnapshotRevertTimer_(void *a1, const char *a2, ...)
{
  return [a1 setSnapshotRevertTimer:];
}

id objc_msgSend_setStage_(void *a1, const char *a2, ...)
{
  return [a1 setStage:];
}

id objc_msgSend_setStagedOperations_(void *a1, const char *a2, ...)
{
  return [a1 setStagedOperations:];
}

id objc_msgSend_setStaggeredContentUpdateEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setStaggeredContentUpdateEnabled:];
}

id objc_msgSend_setStandardOutput_(void *a1, const char *a2, ...)
{
  return [a1 setStandardOutput:];
}

id objc_msgSend_setStarted_(void *a1, const char *a2, ...)
{
  return [a1 setStarted:];
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return [a1 setState:];
}

id objc_msgSend_setStateDescriptor_(void *a1, const char *a2, ...)
{
  return [a1 setStateDescriptor:];
}

id objc_msgSend_setStateForDemoMode_(void *a1, const char *a2, ...)
{
  return [a1 setStateForDemoMode:];
}

id objc_msgSend_setStatus_(void *a1, const char *a2, ...)
{
  return [a1 setStatus:];
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return [a1 setStatusCode:];
}

id objc_msgSend_setStoreCloseTimer_(void *a1, const char *a2, ...)
{
  return [a1 setStoreCloseTimer:];
}

id objc_msgSend_setStoreHourRecords_(void *a1, const char *a2, ...)
{
  return [a1 setStoreHourRecords:];
}

id objc_msgSend_setStoreId_(void *a1, const char *a2, ...)
{
  return [a1 setStoreId:];
}

id objc_msgSend_setStoreOpenTimer_(void *a1, const char *a2, ...)
{
  return [a1 setStoreOpenTimer:];
}

id objc_msgSend_setStoresSearched_(void *a1, const char *a2, ...)
{
  return [a1 setStoresSearched:];
}

id objc_msgSend_setSubscribers_(void *a1, const char *a2, ...)
{
  return [a1 setSubscribers:];
}

id objc_msgSend_setSuspended_(void *a1, const char *a2, ...)
{
  return [a1 setSuspended:];
}

id objc_msgSend_setSwitchModeAfterCompletion_(void *a1, const char *a2, ...)
{
  return [a1 setSwitchModeAfterCompletion:];
}

id objc_msgSend_setSydneyEquivalentVersion_(void *a1, const char *a2, ...)
{
  return [a1 setSydneyEquivalentVersion:];
}

id objc_msgSend_setSyncSessionObserver_(void *a1, const char *a2, ...)
{
  return [a1 setSyncSessionObserver:];
}

id objc_msgSend_setSyncState_(void *a1, const char *a2, ...)
{
  return [a1 setSyncState:];
}

id objc_msgSend_setTargetDeviceDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setTargetDeviceDelegate:];
}

id objc_msgSend_setTask_(void *a1, const char *a2, ...)
{
  return [a1 setTask:];
}

id objc_msgSend_setTaskManager_(void *a1, const char *a2, ...)
{
  return [a1 setTaskManager:];
}

id objc_msgSend_setTccOwnedResources_(void *a1, const char *a2, ...)
{
  return [a1 setTccOwnedResources:];
}

id objc_msgSend_setTestFileHandle_(void *a1, const char *a2, ...)
{
  return [a1 setTestFileHandle:];
}

id objc_msgSend_setTestQueue_(void *a1, const char *a2, ...)
{
  return [a1 setTestQueue:];
}

id objc_msgSend_setTestScripts_(void *a1, const char *a2, ...)
{
  return [a1 setTestScripts:];
}

id objc_msgSend_setTestScriptsLastModified_(void *a1, const char *a2, ...)
{
  return [a1 setTestScriptsLastModified:];
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return [a1 setText:];
}

id objc_msgSend_setTimeIntervalReservedForCleanup_(void *a1, const char *a2, ...)
{
  return [a1 setTimeIntervalReservedForCleanup:];
}

id objc_msgSend_setTimeZone_(void *a1, const char *a2, ...)
{
  return [a1 setTimeZone:];
}

id objc_msgSend_setTimeoutTimer_(void *a1, const char *a2, ...)
{
  return [a1 setTimeoutTimer:];
}

id objc_msgSend_setTimer_(void *a1, const char *a2, ...)
{
  return [a1 setTimer:];
}

id objc_msgSend_setTimerForFatalError_(void *a1, const char *a2, ...)
{
  return [a1 setTimerForFatalError:];
}

id objc_msgSend_setTotalBytesReceived_(void *a1, const char *a2, ...)
{
  return [a1 setTotalBytesReceived:];
}

id objc_msgSend_setTotalBytesSent_(void *a1, const char *a2, ...)
{
  return [a1 setTotalBytesSent:];
}

id objc_msgSend_setTotalComponents_(void *a1, const char *a2, ...)
{
  return [a1 setTotalComponents:];
}

id objc_msgSend_setTotalFileSize_(void *a1, const char *a2, ...)
{
  return [a1 setTotalFileSize:];
}

id objc_msgSend_setTransaction_(void *a1, const char *a2, ...)
{
  return [a1 setTransaction:];
}

id objc_msgSend_setTrueTone_(void *a1, const char *a2, ...)
{
  return [a1 setTrueTone:];
}

id objc_msgSend_setTryCachingHub_(void *a1, const char *a2, ...)
{
  return [a1 setTryCachingHub:];
}

id objc_msgSend_setTvOS_(void *a1, const char *a2, ...)
{
  return [a1 setTvOS:];
}

id objc_msgSend_setURLCache_(void *a1, const char *a2, ...)
{
  return [a1 setURLCache:];
}

id objc_msgSend_setUdid_(void *a1, const char *a2, ...)
{
  return [a1 setUdid:];
}

id objc_msgSend_setUiHelperQueue_(void *a1, const char *a2, ...)
{
  return [a1 setUiHelperQueue:];
}

id objc_msgSend_setUid_(void *a1, const char *a2, ...)
{
  return [a1 setUid:];
}

id objc_msgSend_setUnderlyingQueue_(void *a1, const char *a2, ...)
{
  return [a1 setUnderlyingQueue:];
}

id objc_msgSend_setUninstallQueue_(void *a1, const char *a2, ...)
{
  return [a1 setUninstallQueue:];
}

id objc_msgSend_setUniqueIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setUniqueIdentifier:];
}

id objc_msgSend_setUpdateHandler_(void *a1, const char *a2, ...)
{
  return [a1 setUpdateHandler:];
}

id objc_msgSend_setUpdateQueue_(void *a1, const char *a2, ...)
{
  return [a1 setUpdateQueue:];
}

id objc_msgSend_setUploadInProgress_(void *a1, const char *a2, ...)
{
  return [a1 setUploadInProgress:];
}

id objc_msgSend_setUrlOverride_(void *a1, const char *a2, ...)
{
  return [a1 setUrlOverride:];
}

id objc_msgSend_setUrlSchema_(void *a1, const char *a2, ...)
{
  return [a1 setUrlSchema:];
}

id objc_msgSend_setUseBAAAuthentication_(void *a1, const char *a2, ...)
{
  return [a1 setUseBAAAuthentication:];
}

id objc_msgSend_setUseDefaultStoreHours_(void *a1, const char *a2, ...)
{
  return [a1 setUseDefaultStoreHours:];
}

id objc_msgSend_setUseDiffPatch_(void *a1, const char *a2, ...)
{
  return [a1 setUseDiffPatch:];
}

id objc_msgSend_setUseFactoryDefault_(void *a1, const char *a2, ...)
{
  return [a1 setUseFactoryDefault:];
}

id objc_msgSend_setUserHomePath_(void *a1, const char *a2, ...)
{
  return [a1 setUserHomePath:];
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return [a1 setUserInfo:];
}

id objc_msgSend_setUserVolumeCacheFolderPath_(void *a1, const char *a2, ...)
{
  return [a1 setUserVolumeCacheFolderPath:];
}

id objc_msgSend_setUsername_(void *a1, const char *a2, ...)
{
  return [a1 setUsername:];
}

id objc_msgSend_setValue_(void *a1, const char *a2, ...)
{
  return [a1 setValue:];
}

id objc_msgSend_setValue_forHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return [a1 setValue:forHTTPHeaderField:];
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setValue:forKey:];
}

id objc_msgSend_setValues_(void *a1, const char *a2, ...)
{
  return [a1 setValues:];
}

id objc_msgSend_setVerifyFileHash_(void *a1, const char *a2, ...)
{
  return [a1 setVerifyFileHash:];
}

id objc_msgSend_setVerifyHashBeforeStaging_(void *a1, const char *a2, ...)
{
  return [a1 setVerifyHashBeforeStaging:];
}

id objc_msgSend_setVolume_(void *a1, const char *a2, ...)
{
  return [a1 setVolume:];
}

id objc_msgSend_setVolumeTo_forCategory_(void *a1, const char *a2, ...)
{
  return [a1 setVolumeTo:forCategory:];
}

id objc_msgSend_setVolumeTo_forCategory_mode_(void *a1, const char *a2, ...)
{
  return [a1 setVolumeTo:forCategory:mode:];
}

id objc_msgSend_setWaitForCommandTimer_(void *a1, const char *a2, ...)
{
  return [a1 setWaitForCommandTimer:];
}

id objc_msgSend_setWaitingForCommand_(void *a1, const char *a2, ...)
{
  return [a1 setWaitingForCommand:];
}

id objc_msgSend_setWallpaperSettingsFilePath_(void *a1, const char *a2, ...)
{
  return [a1 setWallpaperSettingsFilePath:];
}

id objc_msgSend_setWatchOS_(void *a1, const char *a2, ...)
{
  return [a1 setWatchOS:];
}

id objc_msgSend_setWhitelistChecker_(void *a1, const char *a2, ...)
{
  return [a1 setWhitelistChecker:];
}

id objc_msgSend_setWifiInterface_(void *a1, const char *a2, ...)
{
  return [a1 setWifiInterface:];
}

id objc_msgSend_setWifiSettings_(void *a1, const char *a2, ...)
{
  return [a1 setWifiSettings:];
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

id objc_msgSend_setWithSet_(void *a1, const char *a2, ...)
{
  return [a1 setWithSet:];
}

id objc_msgSend_setWorkQueue_(void *a1, const char *a2, ...)
{
  return [a1 setWorkQueue:];
}

id objc_msgSend_setWorkspace_(void *a1, const char *a2, ...)
{
  return [a1 setWorkspace:];
}

id objc_msgSend_setXpcConnection_(void *a1, const char *a2, ...)
{
  return [a1 setXpcConnection:];
}

id objc_msgSend_setXpcListener_(void *a1, const char *a2, ...)
{
  return [a1 setXpcListener:];
}

id objc_msgSend_setXpc_conn_(void *a1, const char *a2, ...)
{
  return [a1 setXpc_conn:];
}

id objc_msgSend_setXpc_sema_(void *a1, const char *a2, ...)
{
  return [a1 setXpc_sema:];
}

id objc_msgSend_set_forceReset_(void *a1, const char *a2, ...)
{
  return [a1 set_forceReset:];
}

id objc_msgSend_set_timingDataOptions_(void *a1, const char *a2, ...)
{
  return [a1 set_timingDataOptions:];
}

id objc_msgSend_settingsComponentNames(void *a1, const char *a2, ...)
{
  return _[a1 settingsComponentNames];
}

id objc_msgSend_settingsDict(void *a1, const char *a2, ...)
{
  return _[a1 settingsDict];
}

id objc_msgSend_settingsFilePath(void *a1, const char *a2, ...)
{
  return _[a1 settingsFilePath];
}

id objc_msgSend_setupAccounts_(void *a1, const char *a2, ...)
{
  return [a1 setupAccounts:];
}

id objc_msgSend_setupCollectAppUsageDataTimer(void *a1, const char *a2, ...)
{
  return _[a1 setupCollectAppUsageDataTimer];
}

id objc_msgSend_setupCoreAnalyticsLogsUploadTimer(void *a1, const char *a2, ...)
{
  return _[a1 setupCoreAnalyticsLogsUploadTimer];
}

id objc_msgSend_setupDemoDeviceMetadataFolder(void *a1, const char *a2, ...)
{
  return _[a1 setupDemoDeviceMetadataFolder];
}

id objc_msgSend_setupDummyPreferenceFile(void *a1, const char *a2, ...)
{
  return _[a1 setupDummyPreferenceFile];
}

id objc_msgSend_setupFactoryDemoDeviceMetadataFolder(void *a1, const char *a2, ...)
{
  return _[a1 setupFactoryDemoDeviceMetadataFolder];
}

id objc_msgSend_setupIntraComponentDependency_(void *a1, const char *a2, ...)
{
  return [a1 setupIntraComponentDependency:];
}

id objc_msgSend_setupOfflineModeEnrollmentRetry(void *a1, const char *a2, ...)
{
  return _[a1 setupOfflineModeEnrollmentRetry];
}

id objc_msgSend_setupRequest_(void *a1, const char *a2, ...)
{
  return [a1 setupRequest:];
}

id objc_msgSend_setupSnapshotRevertTimer(void *a1, const char *a2, ...)
{
  return _[a1 setupSnapshotRevertTimer];
}

id objc_msgSend_setupStoreCloseTimer_(void *a1, const char *a2, ...)
{
  return [a1 setupStoreCloseTimer:];
}

id objc_msgSend_setupStoreHourSettingsExpirationTimer_(void *a1, const char *a2, ...)
{
  return [a1 setupStoreHourSettingsExpirationTimer:];
}

id objc_msgSend_setupStoreHoursManager(void *a1, const char *a2, ...)
{
  return _[a1 setupStoreHoursManager];
}

id objc_msgSend_setupStoreOpenCloseTimers(void *a1, const char *a2, ...)
{
  return _[a1 setupStoreOpenCloseTimers];
}

id objc_msgSend_setupStoreOpenTimer_(void *a1, const char *a2, ...)
{
  return [a1 setupStoreOpenTimer:];
}

id objc_msgSend_setupTrustedPeerChangeNotificationObserver(void *a1, const char *a2, ...)
{
  return _[a1 setupTrustedPeerChangeNotificationObserver];
}

id objc_msgSend_setupWorkFolderForBootTask(void *a1, const char *a2, ...)
{
  return _[a1 setupWorkFolderForBootTask];
}

id objc_msgSend_sfAirDropController(void *a1, const char *a2, ...)
{
  return _[a1 sfAirDropController];
}

id objc_msgSend_sharedAVSystemController(void *a1, const char *a2, ...)
{
  return _[a1 sharedAVSystemController];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return _[a1 sharedConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedManager];
}

id objc_msgSend_sharedManagerForAllUsers(void *a1, const char *a2, ...)
{
  return _[a1 sharedManagerForAllUsers];
}

id objc_msgSend_sharedMonitorForDisplayType_(void *a1, const char *a2, ...)
{
  return [a1 sharedMonitorForDisplayType:];
}

id objc_msgSend_sharedPreferences(void *a1, const char *a2, ...)
{
  return _[a1 sharedPreferences];
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return _[a1 sharedService];
}

id objc_msgSend_sharedStore(void *a1, const char *a2, ...)
{
  return _[a1 sharedStore];
}

id objc_msgSend_sharedSystemScreenContext(void *a1, const char *a2, ...)
{
  return _[a1 sharedSystemScreenContext];
}

id objc_msgSend_shortValue(void *a1, const char *a2, ...)
{
  return _[a1 shortValue];
}

id objc_msgSend_shouldCleanUp_(void *a1, const char *a2, ...)
{
  return [a1 shouldCleanUp:];
}

id objc_msgSend_shouldForgetKnownNetworkUponUnlock(void *a1, const char *a2, ...)
{
  return _[a1 shouldForgetKnownNetworkUponUnlock];
}

id objc_msgSend_shouldRestoreBluetoothPairingRecord(void *a1, const char *a2, ...)
{
  return _[a1 shouldRestoreBluetoothPairingRecord];
}

id objc_msgSend_shouldRestoreSystemContainer_WatchAndTV_shared_(void *a1, const char *a2, ...)
{
  return [a1 shouldRestoreSystemContainer_WatchAndTV:shared:];
}

id objc_msgSend_shouldRestoreSystemContainer_iOS_shared_(void *a1, const char *a2, ...)
{
  return [a1 shouldRestoreSystemContainer_iOS:shared:];
}

id objc_msgSend_shouldRunManifestRigorousTest(void *a1, const char *a2, ...)
{
  return _[a1 shouldRunManifestRigorousTest];
}

id objc_msgSend_shouldTryLocalHub_(void *a1, const char *a2, ...)
{
  return [a1 shouldTryLocalHub:];
}

id objc_msgSend_showUI(void *a1, const char *a2, ...)
{
  return _[a1 showUI];
}

id objc_msgSend_shutdownWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 shutdownWithOptions:];
}

id objc_msgSend_signDataAndEncodeToBase64_withPrivateKey_status_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "signDataAndEncodeToBase64:withPrivateKey:status:");
}

id objc_msgSend_signInToServices_usingContext_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "signInToServices:usingContext:completion:");
}

id objc_msgSend_signOutOfAllServicesUsingContext_completion_(void *a1, const char *a2, ...)
{
  return [a1 signOutOfAllServicesUsingContext:completion:];
}

id objc_msgSend_signOutOfServices_usingContext_completion_(void *a1, const char *a2, ...)
{
  return [a1 signOutOfServices:usingContext:completion:];
}

id objc_msgSend_signal(void *a1, const char *a2, ...)
{
  return _[a1 signal];
}

id objc_msgSend_signalContentUpdateCompletion_andError_(void *a1, const char *a2, ...)
{
  return [a1 signalContentUpdateCompletion:andError:];
}

id objc_msgSend_signedManifest(void *a1, const char *a2, ...)
{
  return _[a1 signedManifest];
}

id objc_msgSend_signedManifestFromManifestData_(void *a1, const char *a2, ...)
{
  return [a1 signedManifestFromManifestData:];
}

id objc_msgSend_signpostId(void *a1, const char *a2, ...)
{
  return _[a1 signpostId];
}

id objc_msgSend_sinkWithBookmark_completion_receiveInput_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "sinkWithBookmark:completion:receiveInput:")];
}

id objc_msgSend_skipDescendants(void *a1, const char *a2, ...)
{
  return _[a1 skipDescendants];
}

id objc_msgSend_skipHashCheck(void *a1, const char *a2, ...)
{
  return _[a1 skipHashCheck];
}

id objc_msgSend_skipVerifyHashBeforeStaging(void *a1, const char *a2, ...)
{
  return _[a1 skipVerifyHashBeforeStaging];
}

id objc_msgSend_skipped(void *a1, const char *a2, ...)
{
  return _[a1 skipped];
}

id objc_msgSend_skyEquivalentVersion(void *a1, const char *a2, ...)
{
  return _[a1 skyEquivalentVersion];
}

id objc_msgSend_sleepForTimeInterval_(void *a1, const char *a2, ...)
{
  return [a1 sleepForTimeInterval:];
}

id objc_msgSend_snapshotRevertFlagged(void *a1, const char *a2, ...)
{
  return _[a1 snapshotRevertFlagged];
}

id objc_msgSend_snapshotRevertTimer(void *a1, const char *a2, ...)
{
  return _[a1 snapshotRevertTimer];
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return [a1 sortedArrayUsingSelector:];
}

id objc_msgSend_ssid(void *a1, const char *a2, ...)
{
  return _[a1 ssid];
}

id objc_msgSend_stage(void *a1, const char *a2, ...)
{
  return _[a1 stage];
}

id objc_msgSend_stageDeviceForUpdateProcess_(void *a1, const char *a2, ...)
{
  return [a1 stageDeviceForUpdateProcess:];
}

id objc_msgSend_stagedOperations(void *a1, const char *a2, ...)
{
  return _[a1 stagedOperations];
}

id objc_msgSend_stagingRootPath(void *a1, const char *a2, ...)
{
  return _[a1 stagingRootPath];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_startBundleUpdateMonitor_inMode_(void *a1, const char *a2, ...)
{
  return [a1 startBundleUpdateMonitor:inMode:];
}

id objc_msgSend_startBundleUpdateTimer(void *a1, const char *a2, ...)
{
  return _[a1 startBundleUpdateTimer];
}

id objc_msgSend_startDownloadWithOptions_withResult_(void *a1, const char *a2, ...)
{
  return [a1 startDownloadWithOptions:withResult:];
}

id objc_msgSend_startEvent(void *a1, const char *a2, ...)
{
  return _[a1 startEvent];
}

id objc_msgSend_startFullScreenUIWith_allowCancel_(void *a1, const char *a2, ...)
{
  return [a1 startFullScreenUIWith:allowCancel:];
}

id objc_msgSend_startFullScreenUIWith_allowCancel_disableIdleTimer_(void *a1, const char *a2, ...)
{
  return [a1 startFullScreenUIWith:allowCancel:disableIdleTimer:];
}

id objc_msgSend_startMonitoringEventType_error_(void *a1, const char *a2, ...)
{
  return [a1 startMonitoringEventType:error:];
}

id objc_msgSend_startOSUpdate(void *a1, const char *a2, ...)
{
  return _[a1 startOSUpdate];
}

id objc_msgSend_startObservingSyncSessionsWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 startObservingSyncSessionsWithCompletion:];
}

id objc_msgSend_startOfDayForDate_(void *a1, const char *a2, ...)
{
  return [a1 startOfDayForDate:];
}

id objc_msgSend_startPeriodicPing(void *a1, const char *a2, ...)
{
  return _[a1 startPeriodicPing];
}

id objc_msgSend_startPowerForegroundAppMonitoring(void *a1, const char *a2, ...)
{
  return _[a1 startPowerForegroundAppMonitoring];
}

id objc_msgSend_startProcessingAllComponents(void *a1, const char *a2, ...)
{
  return _[a1 startProcessingAllComponents];
}

id objc_msgSend_startSystemIdleDetection(void *a1, const char *a2, ...)
{
  return _[a1 startSystemIdleDetection];
}

id objc_msgSend_startWaitingForCommandTimer(void *a1, const char *a2, ...)
{
  return _[a1 startWaitingForCommandTimer];
}

id objc_msgSend_started(void *a1, const char *a2, ...)
{
  return _[a1 started];
}

id objc_msgSend_starting(void *a1, const char *a2, ...)
{
  return _[a1 starting];
}

id objc_msgSend_stashSwitcherModelToPath_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "stashSwitcherModelToPath:");
}

id objc_msgSend_stashSwitcherModelToPath_overwrite_(void *a1, const char *a2, ...)
{
  return [a1 stashSwitcherModelToPath:x0 overwrite:x1];
}

id objc_msgSend_stashWallpaperSettingsIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 stashWallpaperSettingsIfNeeded];
}

id objc_msgSend_stashedStagingRootPath(void *a1, const char *a2, ...)
{
  return _[a1 stashedStagingRootPath];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_statesForPredicate_withDescriptor_error_(void *a1, const char *a2, ...)
{
  return [a1 statesForPredicate:withDescriptor:error:];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return _[a1 status];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return _[a1 statusCode];
}

id objc_msgSend_statusFlags(void *a1, const char *a2, ...)
{
  return _[a1 statusFlags];
}

id objc_msgSend_stopAllAppsExcept_(void *a1, const char *a2, ...)
{
  return [a1 stopAllAppsExcept:];
}

id objc_msgSend_stopBundleUpdateTimer(void *a1, const char *a2, ...)
{
  return _[a1 stopBundleUpdateTimer];
}

id objc_msgSend_stopFullScreenUI_(void *a1, const char *a2, ...)
{
  return [a1 stopFullScreenUI:];
}

id objc_msgSend_stopMonitor(void *a1, const char *a2, ...)
{
  return _[a1 stopMonitor];
}

id objc_msgSend_stopMonitoringEventType_(void *a1, const char *a2, ...)
{
  return [a1 stopMonitoringEventType:];
}

id objc_msgSend_stopSystemIdleDetection(void *a1, const char *a2, ...)
{
  return _[a1 stopSystemIdleDetection];
}

id objc_msgSend_storeCloseTimer(void *a1, const char *a2, ...)
{
  return _[a1 storeCloseTimer];
}

id objc_msgSend_storeDataBlob_withContainerIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 storeDataBlob:x0 withContainerIdentifier:x1];
}

id objc_msgSend_storeDemoMode(void *a1, const char *a2, ...)
{
  return _[a1 storeDemoMode];
}

id objc_msgSend_storeHourRecords(void *a1, const char *a2, ...)
{
  return _[a1 storeHourRecords];
}

id objc_msgSend_storeId(void *a1, const char *a2, ...)
{
  return _[a1 storeId];
}

id objc_msgSend_storeOpenTimer(void *a1, const char *a2, ...)
{
  return _[a1 storeOpenTimer];
}

id objc_msgSend_storeSearch_(void *a1, const char *a2, ...)
{
  return [a1 storeSearch:];
}

id objc_msgSend_storesSearched(void *a1, const char *a2, ...)
{
  return _[a1 storesSearched];
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingFormat:];
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

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return _[a1 stringByDeletingPathExtension];
}

id objc_msgSend_stringByExpandingTildeInPath(void *a1, const char *a2, ...)
{
  return _[a1 stringByExpandingTildeInPath];
}

id objc_msgSend_stringByPaddingToLength_withString_startingAtIndex_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "stringByPaddingToLength:withString:startingAtIndex:");
}

id objc_msgSend_stringByRemovingPercentEncoding(void *a1, const char *a2, ...)
{
  return _[a1 stringByRemovingPercentEncoding];
}

id objc_msgSend_stringByReplacingCharactersInRange_withString_(void *a1, const char *a2, ...)
{
  return [a1 stringByReplacingCharactersInRange:withString:];
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return [a1 stringByReplacingOccurrencesOfString:withString:];
}

id objc_msgSend_stringByStandardizingPath(void *a1, const char *a2, ...)
{
  return _[a1 stringByStandardizingPath];
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return [a1 stringByTrimmingCharactersInSet:];
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return [a1 stringFromDate:];
}

id objc_msgSend_stringFromNSOperatingSystemVersion_(void *a1, const char *a2, ...)
{
  return [a1 stringFromNSOperatingSystemVersion:];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return [a1 stringWithCString:];
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 stringWithCapacity:];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return [a1 stringWithString:];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return [a1 stringWithUTF8String:];
}

id objc_msgSend_strongToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return _[a1 strongToStrongObjectsMapTable];
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return [a1 subarrayWithRange:];
}

id objc_msgSend_submit(void *a1, const char *a2, ...)
{
  return _[a1 submit];
}

id objc_msgSend_subscribers(void *a1, const char *a2, ...)
{
  return _[a1 subscribers];
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

id objc_msgSend_supplyBytes_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "supplyBytes:withCompletionBlock:");
}

id objc_msgSend_supportedFeatureFlags(void *a1, const char *a2, ...)
{
  return _[a1 supportedFeatureFlags];
}

id objc_msgSend_supportedRegions(void *a1, const char *a2, ...)
{
  return _[a1 supportedRegions];
}

id objc_msgSend_suspend(void *a1, const char *a2, ...)
{
  return _[a1 suspend];
}

id objc_msgSend_switchModeAfterCompletion(void *a1, const char *a2, ...)
{
  return _[a1 switchModeAfterCompletion];
}

id objc_msgSend_switchModeImmediately_(void *a1, const char *a2, ...)
{
  return [a1 switchModeImmediately:];
}

id objc_msgSend_switchToBackupFolder(void *a1, const char *a2, ...)
{
  return _[a1 switchToBackupFolder];
}

id objc_msgSend_sydneyEquivalentVersion(void *a1, const char *a2, ...)
{
  return _[a1 sydneyEquivalentVersion];
}

id objc_msgSend_syncAppsWithiCloud(void *a1, const char *a2, ...)
{
  return _[a1 syncAppsWithiCloud];
}

id objc_msgSend_syncSessionObserver(void *a1, const char *a2, ...)
{
  return _[a1 syncSessionObserver];
}

id objc_msgSend_syncSessionState(void *a1, const char *a2, ...)
{
  return _[a1 syncSessionState];
}

id objc_msgSend_syncSessionType(void *a1, const char *a2, ...)
{
  return _[a1 syncSessionType];
}

id objc_msgSend_syncState(void *a1, const char *a2, ...)
{
  return _[a1 syncState];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return _[a1 synchronize];
}

id objc_msgSend_synchronizeFile(void *a1, const char *a2, ...)
{
  return _[a1 synchronizeFile];
}

id objc_msgSend_systemAppPollingInterval(void *a1, const char *a2, ...)
{
  return _[a1 systemAppPollingInterval];
}

id objc_msgSend_systemAppTimeoutInterval(void *a1, const char *a2, ...)
{
  return _[a1 systemAppTimeoutInterval];
}

id objc_msgSend_systemIdleDuration(void *a1, const char *a2, ...)
{
  return _[a1 systemIdleDuration];
}

id objc_msgSend_systemLanguages(void *a1, const char *a2, ...)
{
  return _[a1 systemLanguages];
}

id objc_msgSend_systemLibraryURL(void *a1, const char *a2, ...)
{
  return _[a1 systemLibraryURL];
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return _[a1 systemTimeZone];
}

id objc_msgSend_systemUptime(void *a1, const char *a2, ...)
{
  return _[a1 systemUptime];
}

id objc_msgSend_targetDeviceDelegate(void *a1, const char *a2, ...)
{
  return _[a1 targetDeviceDelegate];
}

id objc_msgSend_targetFileWithPath_(void *a1, const char *a2, ...)
{
  return [a1 targetFileWithPath:];
}

id objc_msgSend_task(void *a1, const char *a2, ...)
{
  return _[a1 task];
}

id objc_msgSend_taskInfoFromCommandRequest_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "taskInfoFromCommandRequest:");
}

id objc_msgSend_taskManager(void *a1, const char *a2, ...)
{
  return _[a1 taskManager];
}

id objc_msgSend_taskState(void *a1, const char *a2, ...)
{
  return _[a1 taskState];
}

id objc_msgSend_tccOwnedResources(void *a1, const char *a2, ...)
{
  return _[a1 tccOwnedResources];
}

id objc_msgSend_terminateApp_outError_(void *a1, const char *a2, ...)
{
  return [a1 terminateApp:x0 outError:x1];
}

id objc_msgSend_terminateApplication_forReason_andReport_withDescription_(void *a1, const char *a2, ...)
{
  return [a1 terminateApplication:forReason:andReport:withDescription:];
}

id objc_msgSend_terminateConfigurationApp(void *a1, const char *a2, ...)
{
  return _[a1 terminateConfigurationApp];
}

id objc_msgSend_terminationStatus(void *a1, const char *a2, ...)
{
  return _[a1 terminationStatus];
}

id objc_msgSend_testFileHandle(void *a1, const char *a2, ...)
{
  return _[a1 testFileHandle];
}

id objc_msgSend_testQueue(void *a1, const char *a2, ...)
{
  return _[a1 testQueue];
}

id objc_msgSend_testScripts(void *a1, const char *a2, ...)
{
  return _[a1 testScripts];
}

id objc_msgSend_testScriptsLastModified(void *a1, const char *a2, ...)
{
  return _[a1 testScriptsLastModified];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _[a1 text];
}

id objc_msgSend_timeIntervalReservedForCleanup(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalReservedForCleanup];
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

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeRange_subsumes_(void *a1, const char *a2, ...)
{
  return [a1 timeRange:subsumes:];
}

id objc_msgSend_timeShowingFatalError(void *a1, const char *a2, ...)
{
  return _[a1 timeShowingFatalError];
}

id objc_msgSend_timeZoneForSecondsFromGMT_(void *a1, const char *a2, ...)
{
  return [a1 timeZoneForSecondsFromGMT:];
}

id objc_msgSend_timeoutTimer(void *a1, const char *a2, ...)
{
  return _[a1 timeoutTimer];
}

id objc_msgSend_timer(void *a1, const char *a2, ...)
{
  return _[a1 timer];
}

id objc_msgSend_timerForFatalError(void *a1, const char *a2, ...)
{
  return _[a1 timerForFatalError];
}

id objc_msgSend_toString(void *a1, const char *a2, ...)
{
  return _[a1 toString];
}

id objc_msgSend_toggleAutoUpdate_forAssetOfIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 toggleAutoUpdate:forAssetOfIdentifier:];
}

id objc_msgSend_toggleSEPDemoModeOnManagedPreferencesChange(void *a1, const char *a2, ...)
{
  return _[a1 toggleSEPDemoModeOnManagedPreferencesChange];
}

id objc_msgSend_topic(void *a1, const char *a2, ...)
{
  return _[a1 topic];
}

id objc_msgSend_totalBytesReceived(void *a1, const char *a2, ...)
{
  return _[a1 totalBytesReceived];
}

id objc_msgSend_totalBytesSent(void *a1, const char *a2, ...)
{
  return _[a1 totalBytesSent];
}

id objc_msgSend_totalComponents(void *a1, const char *a2, ...)
{
  return _[a1 totalComponents];
}

id objc_msgSend_totalFileSize(void *a1, const char *a2, ...)
{
  return _[a1 totalFileSize];
}

id objc_msgSend_transactionMetrics(void *a1, const char *a2, ...)
{
  return _[a1 transactionMetrics];
}

id objc_msgSend_trueTone(void *a1, const char *a2, ...)
{
  return _[a1 trueTone];
}

id objc_msgSend_trustDAServer_(void *a1, const char *a2, ...)
{
  return [a1 trustDAServer:];
}

id objc_msgSend_trustServer_isRedirect_(void *a1, const char *a2, ...)
{
  return [a1 trustServer:isRedirect:];
}

id objc_msgSend_trustServer_withRootCA_withHostName_(void *a1, const char *a2, ...)
{
  return [a1 trustServer:withRootCA:withHostName:];
}

id objc_msgSend_trustServerWithApplePKI_(void *a1, const char *a2, ...)
{
  return [a1 trustServerWithApplePKI:];
}

id objc_msgSend_trustServerWithAxinoePKI_(void *a1, const char *a2, ...)
{
  return [a1 trustServerWithAxinoePKI:];
}

id objc_msgSend_tryCachingHub(void *a1, const char *a2, ...)
{
  return _[a1 tryCachingHub];
}

id objc_msgSend_tryPassword_(void *a1, const char *a2, ...)
{
  return [a1 tryPassword:];
}

id objc_msgSend_tryScheduleDefaultEnrollmentRetry(void *a1, const char *a2, ...)
{
  return _[a1 tryScheduleDefaultEnrollmentRetry];
}

id objc_msgSend_ttl(void *a1, const char *a2, ...)
{
  return _[a1 ttl];
}

id objc_msgSend_turnOnDemoMode(void *a1, const char *a2, ...)
{
  return _[a1 turnOnDemoMode];
}

id objc_msgSend_turnPowerOnWithError_(void *a1, const char *a2, ...)
{
  return [a1 turnPowerOnWithError:];
}

id objc_msgSend_tvOS(void *a1, const char *a2, ...)
{
  return _[a1 tvOS];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_typeOfDemoDevice(void *a1, const char *a2, ...)
{
  return _[a1 typeOfDemoDevice];
}

id objc_msgSend_udid(void *a1, const char *a2, ...)
{
  return _[a1 udid];
}

id objc_msgSend_uiHelperQueue(void *a1, const char *a2, ...)
{
  return _[a1 uiHelperQueue];
}

id objc_msgSend_uid(void *a1, const char *a2, ...)
{
  return _[a1 uid];
}

id objc_msgSend_unarchiveTopLevelObjectWithData_error_(void *a1, const char *a2, ...)
{
  return [a1 unarchiveTopLevelObjectWithData:error:];
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:")
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend_unenroll_(void *a1, const char *a2, ...)
{
  return [a1 unenroll:];
}

id objc_msgSend_unenrollWithObliteration_callUnregister_(void *a1, const char *a2, ...)
{
  return [a1 unenrollWithObliteration:callUnregister:];
}

id objc_msgSend_unenrollWithObliteration_preserveESim_callUnregister_preserveDDLFlag_(void *a1, const char *a2, ...)
{
  return [a1 unenrollWithObliteration:x0 preserveESim:x1 callUnregister:x2 preserveDDLFlag:x3];
}

id objc_msgSend_uninstallAllDemoBundleConfigurationProfiles(void *a1, const char *a2, ...)
{
  return _[a1 uninstallAllDemoBundleConfigurationProfiles];
}

id objc_msgSend_uninstallAppWithBundleID_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "uninstallAppWithBundleID:error:");
}

id objc_msgSend_uninstallAppWithBundleID_requestUserConfirmation_completion_(void *a1, const char *a2, ...)
{
  return [a1 uninstallAppWithBundleID:requestUserConfirmation:completion:];
}

id objc_msgSend_uninstallConfigurationProfile_(void *a1, const char *a2, ...)
{
  return [a1 uninstallConfigurationProfile:];
}

id objc_msgSend_uninstallConfigurationProfileIfNeeded_(void *a1, const char *a2, ...)
{
  return [a1 uninstallConfigurationProfileIfNeeded:];
}

id objc_msgSend_uninstallProvisioningProfileByUUID_(void *a1, const char *a2, ...)
{
  return [a1 uninstallProvisioningProfileByUUID:];
}

id objc_msgSend_uninstallQueue(void *a1, const char *a2, ...)
{
  return _[a1 uninstallQueue];
}

id objc_msgSend_uninstallRestrictionsConfigurationProfile(void *a1, const char *a2, ...)
{
  return _[a1 uninstallRestrictionsConfigurationProfile];
}

id objc_msgSend_unionOrderedSet_(void *a1, const char *a2, ...)
{
  return [a1 unionOrderedSet:];
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return [a1 unionSet:];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 uniqueIdentifier];
}

id objc_msgSend_uniqueName(void *a1, const char *a2, ...)
{
  return _[a1 uniqueName];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return _[a1 unlock];
}

id objc_msgSend_unlockDeviceKeybagIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 unlockDeviceKeybagIfNeeded];
}

id objc_msgSend_unlockSnapshot(void *a1, const char *a2, ...)
{
  return _[a1 unlockSnapshot];
}

id objc_msgSend_unlockWithCondition_(void *a1, const char *a2, ...)
{
  return [a1 unlockWithCondition:];
}

id objc_msgSend_unregisterCAHeartbeatActivity(void *a1, const char *a2, ...)
{
  return _[a1 unregisterCAHeartbeatActivity];
}

id objc_msgSend_unregisterObserver(void *a1, const char *a2, ...)
{
  return _[a1 unregisterObserver];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongLongValue];
}

id objc_msgSend_updateComponentProgress_withResult_withAdditionalInfo_(void *a1, const char *a2, ...)
{
  return [a1 updateComponentProgress:x0 withResult:x1 withAdditionalInfo:x2];
}

id objc_msgSend_updateContentWithDeadline_(void *a1, const char *a2, ...)
{
  return [a1 updateContentWithDeadline:];
}

id objc_msgSend_updateDemoContent(void *a1, const char *a2, ...)
{
  return _[a1 updateDemoContent];
}

id objc_msgSend_updateDeviceNameForPairedPeerOfUUID_withNewName_(void *a1, const char *a2, ...)
{
  return [a1 updateDeviceNameForPairedPeerOfUUID:withNewName:];
}

id objc_msgSend_updateDeviceOptions_skipImutableKeys_(void *a1, const char *a2, ...)
{
  return [a1 updateDeviceOptions:x0 skipImutableKeys:x1];
}

id objc_msgSend_updateDownloadedContent_fromSource_(void *a1, const char *a2, ...)
{
  return [a1 updateDownloadedContent:fromSource:];
}

id objc_msgSend_updateFileDownloadCredentialFromManifestInfo_(void *a1, const char *a2, ...)
{
  return [a1 updateFileDownloadCredentialFromManifestInfo:];
}

id objc_msgSend_updateHubHostNameAndPort(void *a1, const char *a2, ...)
{
  return _[a1 updateHubHostNameAndPort];
}

id objc_msgSend_updateIsInBubble_(void *a1, const char *a2, ...)
{
  return [a1 updateIsInBubble:];
}

id objc_msgSend_updateItemForAttributes_withData_(void *a1, const char *a2, ...)
{
  return [a1 updateItemForAttributes:withData:];
}

id objc_msgSend_updateLocalHubReachability_withRequest_andResponse_(void *a1, const char *a2, ...)
{
  return [a1 updateLocalHubReachability:withRequest:andResponse:];
}

id objc_msgSend_updateManifestInfo_error_(void *a1, const char *a2, ...)
{
  return [a1 updateManifestInfo:error];
}

id objc_msgSend_updatePairedDeviceInfo(void *a1, const char *a2, ...)
{
  return _[a1 updatePairedDeviceInfo];
}

id objc_msgSend_updateQueue(void *a1, const char *a2, ...)
{
  return _[a1 updateQueue];
}

id objc_msgSend_updateSignedManifest(void *a1, const char *a2, ...)
{
  return _[a1 updateSignedManifest];
}

id objc_msgSend_updateStage_(void *a1, const char *a2, ...)
{
  return [a1 updateStage:];
}

id objc_msgSend_updateStoreHours_lastSettingsUpdatedDate_(void *a1, const char *a2, ...)
{
  return [a1 updateStoreHours:lastSettingsUpdatedDate:];
}

id objc_msgSend_updateType(void *a1, const char *a2, ...)
{
  return _[a1 updateType];
}

id objc_msgSend_updateWithResponseFromGetFileDownloadCredentials_(void *a1, const char *a2, ...)
{
  return [a1 updateWithResponseFromGetFileDownloadCredentials:];
}

id objc_msgSend_updateWithResponseFromGetManifestInfo_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "updateWithResponseFromGetManifestInfo:");
}

id objc_msgSend_updatedSession(void *a1, const char *a2, ...)
{
  return _[a1 updatedSession];
}

id objc_msgSend_uploadCoreAnalyticsLogs(void *a1, const char *a2, ...)
{
  return _[a1 uploadCoreAnalyticsLogs];
}

id objc_msgSend_uploadDemoLogsIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 uploadDemoLogsIfNeeded];
}

id objc_msgSend_uploadDemoLogsTo_HttpHeaders_andMaxAttempts_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "uploadDemoLogsTo:HttpHeaders:andMaxAttempts:");
}

id objc_msgSend_uploadInProgress(void *a1, const char *a2, ...)
{
  return _[a1 uploadInProgress];
}

id objc_msgSend_uploadMobileStoreDemoLogs_(void *a1, const char *a2, ...)
{
  return [a1 uploadMobileStoreDemoLogs:];
}

id objc_msgSend_uploadTaskWithRequest_fromData_(void *a1, const char *a2, ...)
{
  return [a1 uploadTaskWithRequest:x0 fromData:x1];
}

id objc_msgSend_uploadTaskWithRequest_fromFile_(void *a1, const char *a2, ...)
{
  return [a1 uploadTaskWithRequest:x0 fromFile:x1];
}

id objc_msgSend_uploadTimingData(void *a1, const char *a2, ...)
{
  return _[a1 uploadTimingData];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return _[a1 uppercaseString];
}

id objc_msgSend_urlOverride(void *a1, const char *a2, ...)
{
  return _[a1 urlOverride];
}

id objc_msgSend_urlSchema(void *a1, const char *a2, ...)
{
  return _[a1 urlSchema];
}

id objc_msgSend_useBAAAuthentication(void *a1, const char *a2, ...)
{
  return _[a1 useBAAAuthentication];
}

id objc_msgSend_useDefaultStoreHours(void *a1, const char *a2, ...)
{
  return _[a1 useDefaultStoreHours];
}

id objc_msgSend_useDiffPatch(void *a1, const char *a2, ...)
{
  return _[a1 useDiffPatch];
}

id objc_msgSend_useFactoryDefault(void *a1, const char *a2, ...)
{
  return _[a1 useFactoryDefault];
}

id objc_msgSend_userDownloadPolicyForDescriptor_existingPolicy_allowCellularOverride_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "userDownloadPolicyForDescriptor:existingPolicy:allowCellularOverride:")];
}

id objc_msgSend_userHomePath(void *a1, const char *a2, ...)
{
  return _[a1 userHomePath];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_userVolumeCacheFolderPath(void *a1, const char *a2, ...)
{
  return _[a1 userVolumeCacheFolderPath];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return _[a1 username];
}

id objc_msgSend_validateISTSignedApp_manifest_(void *a1, const char *a2, ...)
{
  return [a1 validateISTSignedApp:manifest:];
}

id objc_msgSend_validateInstallationOrder(void *a1, const char *a2, ...)
{
  return _[a1 validateInstallationOrder];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return [a1 valueForEntitlement:];
}

id objc_msgSend_valueForExtendedAttributesKey_forPath_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "valueForExtendedAttributesKey:forPath:");
}

id objc_msgSend_valueForHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return [a1 valueForHTTPHeaderField:];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return [a1 valueForKey:];
}

id objc_msgSend_valueForProperty_(void *a1, const char *a2, ...)
{
  return [a1 valueForProperty:];
}

id objc_msgSend_valueWithPointer_(void *a1, const char *a2, ...)
{
  return [a1 valueWithPointer:];
}

id objc_msgSend_verifyDeviceEligibility_error_(void *a1, const char *a2, ...)
{
  return [a1 verifyDeviceEligibility:error];
}

id objc_msgSend_verifyExtensionIsRunning(void *a1, const char *a2, ...)
{
  return _[a1 verifyExtensionIsRunning];
}

id objc_msgSend_verifyFileHash(void *a1, const char *a2, ...)
{
  return _[a1 verifyFileHash];
}

id objc_msgSend_verifyHashBeforeStaging(void *a1, const char *a2, ...)
{
  return _[a1 verifyHashBeforeStaging];
}

id objc_msgSend_verifyManifestSignature_forDataSectionKeys_withOptions_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "verifyManifestSignature:forDataSectionKeys:withOptions:");
}

id objc_msgSend_visibleApps(void *a1, const char *a2, ...)
{
  return _[a1 visibleApps];
}

id objc_msgSend_volume(void *a1, const char *a2, ...)
{
  return _[a1 volume];
}

id objc_msgSend_wait(void *a1, const char *a2, ...)
{
  return _[a1 wait];
}

id objc_msgSend_waitForAppToInstall_withTimeout_(void *a1, const char *a2, ...)
{
  return [a1 waitForAppToInstall:withTimeout:];
}

id objc_msgSend_waitForBuddy_(void *a1, const char *a2, ...)
{
  return [a1 waitForBuddy:];
}

id objc_msgSend_waitForBuddyWithTimeout(void *a1, const char *a2, ...)
{
  return _[a1 waitForBuddyWithTimeout];
}

id objc_msgSend_waitForCommandTimer(void *a1, const char *a2, ...)
{
  return _[a1 waitForCommandTimer];
}

id objc_msgSend_waitForGMAvailability(void *a1, const char *a2, ...)
{
  return _[a1 waitForGMAvailability];
}

id objc_msgSend_waitForNetworkReachability(void *a1, const char *a2, ...)
{
  return _[a1 waitForNetworkReachability];
}

id objc_msgSend_waitForPricing_forReboot_(void *a1, const char *a2, ...)
{
  return [a1 waitForPricing:forReboot:];
}

id objc_msgSend_waitForProcessingCompletionTillDate_outError_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "waitForProcessingCompletionTillDate:outError:");
}

id objc_msgSend_waitForWiFiInterface(void *a1, const char *a2, ...)
{
  return _[a1 waitForWiFiInterface];
}

id objc_msgSend_waitUntilClear(void *a1, const char *a2, ...)
{
  return _[a1 waitUntilClear];
}

id objc_msgSend_waitUntilDate_(void *a1, const char *a2, ...)
{
  return [a1 waitUntilDate:];
}

id objc_msgSend_waitUntilExit(void *a1, const char *a2, ...)
{
  return _[a1 waitUntilExit];
}

id objc_msgSend_waitingForCommand(void *a1, const char *a2, ...)
{
  return _[a1 waitingForCommand];
}

id objc_msgSend_wallpaperSettingsFilePath(void *a1, const char *a2, ...)
{
  return _[a1 wallpaperSettingsFilePath];
}

id objc_msgSend_watchOS(void *a1, const char *a2, ...)
{
  return _[a1 watchOS];
}

id objc_msgSend_whitelistChecker(void *a1, const char *a2, ...)
{
  return _[a1 whitelistChecker];
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 whitespaceCharacterSet];
}

id objc_msgSend_wifiInterface(void *a1, const char *a2, ...)
{
  return _[a1 wifiInterface];
}

id objc_msgSend_wifiSettings(void *a1, const char *a2, ...)
{
  return _[a1 wifiSettings];
}

id objc_msgSend_windwardAppInstallationStarted(void *a1, const char *a2, ...)
{
  return _[a1 windwardAppInstallationStarted];
}

id objc_msgSend_workQueue(void *a1, const char *a2, ...)
{
  return _[a1 workQueue];
}

id objc_msgSend_workspace(void *a1, const char *a2, ...)
{
  return _[a1 workspace];
}

id objc_msgSend_writeData_(void *a1, const char *a2, ...)
{
  return [a1 writeData:];
}

id objc_msgSend_writeData_error_(void *a1, const char *a2, ...)
{
  return [a1 writeData:error:];
}

id objc_msgSend_writeFileHeaders_(void *a1, const char *a2, ...)
{
  return [a1 writeFileHeaders:];
}

id objc_msgSend_writeNvram_withValue_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "writeNvram:withValue:");
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return [a1 writeToFile:atomically:];
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "writeToFile:options:error:");
}

id objc_msgSend_writeToURL_error_(void *a1, const char *a2, ...)
{
  return [a1 writeToURL:error:];
}

id objc_msgSend_xpcArrayFromArray(void *a1, const char *a2, ...)
{
  return _[a1 xpcArrayFromArray];
}

id objc_msgSend_xpcConnection(void *a1, const char *a2, ...)
{
  return _[a1 xpcConnection];
}

id objc_msgSend_xpcListener(void *a1, const char *a2, ...)
{
  return _[a1 xpcListener];
}

id objc_msgSend_xpc_conn(void *a1, const char *a2, ...)
{
  return [a1 xpc_conn];
}

id objc_msgSend_xpc_sema(void *a1, const char *a2, ...)
{
  return [a1 xpc_sema];
}

id objc_msgSend_year(void *a1, const char *a2, ...)
{
  return _[a1 year];
}