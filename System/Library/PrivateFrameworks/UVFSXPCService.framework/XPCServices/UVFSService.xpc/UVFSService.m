int main(int argc, const char **argv, const char **envp)
{
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v3) {
    sub_1000219B8(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  v11 = +[NSMutableArray arrayWithCapacity:16];
  v12 = (void *)UVFSServiceConnections;
  UVFSServiceConnections = v11;

  v13 = objc_opt_new();
  v14 = +[NSXPCListener serviceListener];
  v15 = (void *)UVFSServiceListener;
  UVFSServiceListener = v14;

  [(id)UVFSServiceListener setDelegate:v13];
  v16 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v16) {
    sub_10002197C(v16, v17, v18, v19, v20, v21, v22, v23);
  }
  [(id)UVFSServiceListener resume];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
    sub_100021934();
  }

  return 0;
}

void sub_100003E14(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_1000048E0(uint64_t a1)
{
  v1 = +[NSDictionary sharedKeySetForKeys:*(void *)(a1 + 32)];
  uint64_t v2 = +[NSMutableDictionary dictionaryWithSharedKeySet:v1];
  v3 = (void *)qword_100040328;
  qword_100040328 = v2;

  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100022058();
  }
}

void sub_100004968(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_100004990(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1000049C4(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

id sub_100005660(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_1000062E4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100006314(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_100006330(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t sub_1000068A4(const char *a1, unsigned int a2)
{
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100022C00();
  }
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.filesystems.userfs_helper", 0, 0);
  if (!mach_service) {
    sub_1000229A0();
  }
  uint64_t v5 = mach_service;
  if (xpc_get_type(mach_service) != (xpc_type_t)&_xpc_type_connection) {
    sub_100022BD4();
  }
  xpc_connection_set_event_handler(v5, &stru_100038718);
  xpc_connection_resume(v5);
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v6, "path", a1);
  xpc_dictionary_set_int64(v6, "flags", a2);
  xpc_object_t v7 = xpc_connection_send_message_with_reply_sync(v5, v6);
  v8 = v7;
  if (!v7 || xpc_get_type(v7) != (xpc_type_t)&_xpc_type_dictionary)
  {
    uint64_t v9 = (id)userfs_log_default;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100022A44(v8 == 0, v8, v9);
    }

    uint64_t v10 = 0xFFFFFFFFLL;
    int64_t int64 = 5;
    goto LABEL_10;
  }
  uint64_t v10 = xpc_dictionary_dup_fd(v8, "fd");
  v14 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
  {
    sub_100022B5C(v10, v14);
    if ((v10 & 0x80000000) == 0) {
      goto LABEL_15;
    }
  }
  else if ((v10 & 0x80000000) == 0)
  {
LABEL_15:
    int64_t int64 = 0;
    goto LABEL_10;
  }
  int64_t int64 = xpc_dictionary_get_int64(v8, "error");
  v15 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100022AE4(int64, v15);
  }
  if (!int64) {
    int64_t int64 = 5;
  }
LABEL_10:
  xpc_connection_cancel(v5);
  v12 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_1000229CC(v10, int64, v12);
  }
  *__error() = int64;

  return v10;
}

void sub_100006AD4(void *a1, uint64_t a2, int a3)
{
  uint64_t v5 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100022D8C(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (a3 == -536870896)
  {
    v13 = (void *)userfs_log_default;
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100022CE0(v13, a1);
    }
    id v14 = a1;
    objc_sync_enter(v14);
    v15 = [v14 volumes];
    v16 = +[NSArray arrayWithArray:v15];

    objc_sync_exit(v14);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v17 = v16;
    id v18 = [v17 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v18)
    {
      uint64_t v20 = *(void *)v36;
      *(void *)&long long v19 = 136315394;
      long long v34 = v19;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v36 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          if (objc_msgSend(v22, "useKOIO", v34, (void)v35))
          {
            [v22 revokeDeviceIfNeeded];
            v23 = (void *)userfs_log_default;
            if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEFAULT))
            {
              v24 = v23;
              v25 = [v14 deviceName];
              *(_DWORD *)buf = v34;
              v40 = "DeviceNotification";
              __int16 v41 = 2112;
              v42 = v25;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s[%@]: revoked block devices for kernel", buf, 0x16u);
            }
          }
        }
        id v18 = [v17 countByEnumeratingWithState:&v35 objects:v43 count:16];
      }
      while (v18);
    }

    [v14 close];
    [v14 terminateVolumesWithErrors];
  }
  v26 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100022C68(v26, v27, v28, v29, v30, v31, v32, v33);
  }
}

void sub_100006D58(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100007B88(uint64_t a1)
{
  v4[0] = @"fsTypeName";
  v4[1] = @"volumeCount";
  uint64_t v1 = *(void *)(a1 + 40);
  v5[0] = *(void *)(a1 + 32);
  v5[1] = v1;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

void sub_100007E5C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100007FC4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100008404(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100008754(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void sub_100008774(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x12u);
}

void sub_1000087AC(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_1000087E0(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

unsigned char *sub_1000087FC(unsigned char *result, unsigned char *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

void sub_10000880C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void sub_100008824(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

void sub_100008844(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x20u);
}

void notifyMainServiceAndExit(void *a1, int a2)
{
  id v2 = a1;
  dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
  v3 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v28 = "notifyMainServiceAndExit";
    __int16 v29 = 2112;
    id v30 = v2;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s:start:%@", buf, 0x16u);
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = (id)UVFSServiceConnections;
  id v4 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v22 + 1) + 8 * (void)v7);
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_100008BA4;
        v20[3] = &unk_100038740;
        uint64_t v9 = v17;
        v21 = v9;
        uint64_t v10 = [v8 remoteObjectProxyWithErrorHandler:v20];
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_100008C08;
        v18[3] = &unk_100038740;
        uint64_t v11 = v9;
        long long v19 = v11;
        [v10 serviceExitingForDevice:v2 withReply:v18];
        dispatch_time_t v12 = dispatch_time(0, 1000000000);
        if (dispatch_semaphore_wait(v11, v12))
        {
          v13 = userfs_log_default;
          if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            uint64_t v28 = "notifyMainServiceAndExit";
            _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s:error:timeout", buf, 0xCu);
          }
        }
        [v8 invalidate];

        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v5);
  }

  [(id)UVFSServiceListener invalidate];
  id v14 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v28 = "notifyMainServiceAndExit";
    __int16 v29 = 1024;
    LODWORD(v30) = a2;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s:finish:exiting:%d", buf, 0x12u);
  }
  exit(a2);
}

void sub_100008BA4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100023680();
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100008C08(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100023700();
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000906C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100009084(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100009094(uint64_t a1)
{
}

void sub_10000909C(uint64_t a1, void *a2)
{
}

void sub_10000A634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose(&a67, 8);
  _Unwind_Resume(a1);
}

void sub_10000A6A8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void sub_10000A728(id a1)
{
  if (os_log_type_enabled((os_log_t)uvfsservice_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100023D74();
  }
}

void sub_10000B7BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000B7D4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000B7E4(uint64_t a1)
{
}

void sub_10000B7EC(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

id sub_10000BE88(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_1000246C4();
  }
  [*(id *)(a1 + 32) LIDisableSearch];
  return [*(id *)(a1 + 32) LISearchAbortAll];
}

void sub_10000BEE0(uint64_t a1)
{
  [*(id *)(a1 + 32) pauseIOQueue];
  [*(id *)(a1 + 32) resumeIOQueue];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 632);
  *(void *)(v2 + 632) = 0;

  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100024760();
  }
  [*(id *)(a1 + 32) purgeMappingTables];
  uint64_t v4 = *(unsigned int *)(a1 + 40);
  if ((v4 & 8) == 0)
  {
    [*(id *)(*(void *)(a1 + 32) + 544) syncTheFileSystem:1];
    uint64_t v4 = *(unsigned int *)(a1 + 40);
  }
  [*(id *)(*(void *)(a1 + 32) + 544) unloadFileSystem:v4];
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10002472C();
  }
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 544);
  *(void *)(v5 + 544) = 0;

  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_1000246F8();
  }
}

void sub_10000C6E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
}

void sub_10000C724(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (a2)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
    goto LABEL_11;
  }
  if (v5)
  {
    uint64_t v7 = (const char *)[v5 bytes];
    if (!strcmp(v7, "fat") || !strcmp(v7, "exfat"))
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v9 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = @"ExFATCameraDeviceManager";
      goto LABEL_10;
    }
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100024A74();
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;
LABEL_10:

LABEL_11:
  uint64_t v11 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v13[0] = 67109634;
    v13[1] = a2;
    __int16 v14 = 2048;
    v15 = v6;
    __int16 v16 = 2112;
    uint64_t v17 = v12;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "isDCIM: LIGetFSAttr(): Got result %d, with value: %p, fsClass: %@", (uint8_t *)v13, 0x1Cu);
  }
}

void sub_10000C8B0(uint64_t a1, int a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9, void *a10)
{
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  uint64_t v24 = *(void *)(a1 + 32);
  uint64_t v23 = a1 + 32;
  *(_DWORD *)(*(void *)(v24 + 8) + 24) = a2;
  if (!*(_DWORD *)(*(void *)(*(void *)v23 + 8) + 24))
  {
    id v25 = v17;
    v26 = [v25 bytes];
    if (v26 && v26[6] != 2)
    {
      if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_100024D30();
      }
      *(_DWORD *)(*(void *)(*(void *)v23 + 8) + 24) = 2;
    }
    id v27 = v25;
    uint64_t v28 = v27;
    if (v27)
    {
      id v30 = [v27 bytes];
      if (v30)
      {
        __int16 v29 = userfs_log_default;
        if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
        {
          sub_100024C6C((uint64_t)v30, (uint64_t)v29, &v31);
          __int16 v29 = v31;
        }
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          sub_100024BD4((uint64_t)v30, (uint64_t)v29, &v31);
          __int16 v29 = v31;
        }
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
          sub_100024B54();
        }
      }
    }
  }
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100024ADC();
  }
}

void sub_10000DE9C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) rootNode];
  [v2 syncTheFileSystem:1];

  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100025188();
  }
  dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 504));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 504);
  *(void *)(v3 + 504) = 0;
}

void sub_10000ED30(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void *)userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    id v12 = *(id *)(a1 + 48);
    v13 = v9;
    id v14 = [v12 UTF8String];
    uint64_t v15 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138413570;
    uint64_t v17 = v10;
    __int16 v18 = 2112;
    uint64_t v19 = v11;
    __int16 v20 = 1024;
    int v21 = a2;
    __int16 v22 = 2080;
    id v23 = v14;
    __int16 v24 = 2048;
    uint64_t v25 = v15;
    __int16 v26 = 2048;
    id v27 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "LILookup(%@/%@): reply(%d, %s, %p, %p)", buf, 0x3Au);
  }
  (*(void (**)(void, void))(*(void *)(a1 + 80) + 16))(*(void *)(a1 + 80), *(unsigned int *)(a1 + 88));
}

void sub_10000F21C(uint64_t a1, int a2, unint64_t a3)
{
  id v6 = *(id *)(a1 + 32);
  if (a2)
  {
    id v7 = 0;
  }
  else
  {
    if (*(void *)(a1 + 48) <= a3) {
      goto LABEL_6;
    }
    id v9 = v6;
    uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "subdataWithRange:", 0, a3);
    id v6 = v9;
    id v7 = (void *)v8;
  }

  id v6 = v7;
LABEL_6:
  id v10 = v6;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_10000F4AC(uint64_t a1)
{
  uint64_t v3 = 0;
  [*(id *)(a1 + 32) readData:*(void *)(a1 + 64) intoDataBuffer:*(void *)(a1 + 40) withLengthOut:&v3];
  [*(id *)(*(void *)(a1 + 48) + 656) reenableSystemSleep];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

void sub_10000F708(uint64_t a1)
{
  uint64_t v6 = 0;
  id v2 = [*(id *)(a1 + 32) writeData:*(void *)(a1 + 64) fromBuffer:*(void *)(a1 + 40) withLengthOut:&v6];
  if (!v2 && !objc_msgSend(*(id *)(a1 + 32), "lfn_wasWritten")) {
    objc_msgSend(*(id *)(a1 + 32), "setLfn_wasWritten:", 1);
  }
  [*(id *)(*(void *)(a1 + 48) + 656) reenableSystemSleep];
  uint64_t v3 = v6;
  uint64_t v4 = *(void *)(a1 + 56);
  id v5 = [*(id *)(a1 + 48) getFreeSpaceInVolume];
  (*(void (**)(uint64_t, id, uint64_t, void *))(v4 + 16))(v4, v2, v3, v5);
}

void sub_10000FA60(uint64_t a1)
{
  uint64_t v2 = (*(_DWORD *)(a1 + 80) & 0x3F) + 1;
  unsigned int v8 = (*(_DWORD *)(a1 + 80) & 0x3F) + 1;
  uint64_t v3 = +[NSMutableData dataWithLength:24 * v2];
  id v4 = objc_msgSend(*(id *)(a1 + 32), "blockmapWithRange:startIO:flags:operationID:extentCount:extents:", *(void *)(a1 + 56), *(void *)(a1 + 64), *(unsigned int *)(a1 + 84), *(unsigned int *)(a1 + 80), *(void *)(a1 + 72), &v8, v3);
  id v5 = 0;
  if (!v4 && v8)
  {
    id v5 = objc_msgSend(v3, "subdataWithRange:", 0, 24 * v8);
  }
  [*(id *)(*(void *)(a1 + 40) + 656) reenableSystemSleep];
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = [*(id *)(a1 + 40) getFreeSpaceInVolume];
  (*(void (**)(uint64_t, id, void *, void *))(v6 + 16))(v6, v4, v5, v7);
}

uint64_t sub_10000FDF0(uint64_t a1)
{
  if (!objc_msgSend(*(id *)(a1 + 32), "endIOWithRange:status:flags:operationID:", *(void *)(a1 + 56), *(void *)(a1 + 64), *(unsigned int *)(a1 + 80), *(unsigned int *)(a1 + 84), *(void *)(a1 + 72))&& (*(unsigned char *)(a1 + 85) & 2) != 0&& !objc_msgSend(*(id *)(a1 + 32), "lfn_wasWritten"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setLfn_wasWritten:", 1);
  }
  [*(id *)(*(void *)(a1 + 40) + 656) reenableSystemSleep];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

void sub_100012E48(uint64_t a1, int a2, unint64_t a3)
{
  uint64_t v6 = [*(id *)(a1 + 32) createDispatchData];
  id v7 = v6;
  if (a2)
  {
    unsigned int v8 = 0;
  }
  else
  {
    if (*(void *)(a1 + 48) <= a3) {
      goto LABEL_6;
    }
    id v10 = v6;
    uint64_t v9 = objc_msgSend(v6, "subdataWithRange:", 0, a3);
    id v7 = v10;
    unsigned int v8 = (void *)v9;
  }

  id v7 = v8;
LABEL_6:
  id v11 = v7;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10001303C(uint64_t a1, int a2, unint64_t a3)
{
  uint64_t v6 = [*(id *)(a1 + 32) createDispatchData];
  id v7 = v6;
  if (a2)
  {
    unsigned int v8 = 0;
  }
  else
  {
    if (*(void *)(a1 + 48) <= a3) {
      goto LABEL_6;
    }
    id v10 = v6;
    uint64_t v9 = objc_msgSend(v6, "subdataWithRange:", 0, a3);
    id v7 = v10;
    unsigned int v8 = (void *)v9;
  }

  id v7 = v8;
LABEL_6:
  id v11 = v7;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_100014710(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"com.apple.ResourceFork"]) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = (uint64_t)[v1 isEqualToString:@"com.apple.decmpfs"];
  }

  return v2;
}

id sub_100015DC8(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    uint64_t v3 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v1 count]);
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = v2;
    id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if ((sub_100014710(v9) & 1) == 0) {
            objc_msgSend(v3, "addObject:", v9, (void)v11);
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void sub_100016234(id a1, id a2, liveFilesSearchRequest *a3, BOOL *a4)
{
}

void sub_100016314(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 callerID] == *(id *)(a1 + 32)) {
    [v4 abortSearch];
  }
}

uint64_t sub_100017208(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_1000172B0(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100025EB8();
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 40) allKeys];
  id v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v3)
  {
    id v5 = 0;
    goto LABEL_21;
  }
  id v4 = v3;
  id v5 = 0;
  uint64_t v6 = *(void *)v17;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(void *)v17 != v6) {
        objc_enumerationMutation(v2);
      }
      unsigned int v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
      uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 544) getFH];
      unsigned __int8 v10 = [v8 isEqualToString:v9];

      if ((v10 & 1) == 0)
      {
        long long v11 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKey:v8];

        unint64_t v12 = (unint64_t)objc_msgSend(v11, "lfn_inUseClientSet");
        objc_msgSend(v11, "setLfn_inUseClientSet:", v12 & ~*(void *)(a1 + 40));
        if ((*(void *)(a1 + 40) & v12) != 0 && !objc_msgSend(v11, "lfn_inUseClientSet"))
        {
          long long v13 = objc_msgSend(v11, "lfn_name");
          if ([v13 isEqualToString:&stru_100038E98]) {
            goto LABEL_14;
          }
          long long v14 = objc_msgSend(v11, "lfn_parent");

          if (v14)
          {
            uint64_t v15 = *(void **)(a1 + 32);
            long long v13 = objc_msgSend(v11, "lfn_parent");
            [v15 removeFromNameCache:v11 withParent:v13];
LABEL_14:
          }
          [*(id *)(a1 + 32) removeFromFHCache:v11];
          [v11 reclaim];
        }
        id v5 = v11;
        continue;
      }
    }
    id v4 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  }
  while (v4);
LABEL_21:

  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100025E4C();
  }
}

void sub_100019198(_Unwind_Exception *a1)
{
}

void sub_100019298(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) parentFH];
  id v4 = [*(id *)(a1 + 40) elementName];
  id v5 = [*(id *)(a1 + 48) searchLIClientID];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100019364;
  v6[3] = &unk_1000389E8;
  long long v7 = *(_OWORD *)(a1 + 56);
  [v2 lookupin:v3 name:v4 forClient:v5 usingFlags:0 requestID:-1 reply:v6];
}

void sub_100019364(uint64_t a1, int a2, int a3, id obj)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

uint64_t sub_100019384(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) getNodeForFH:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) withError:*(void *)(*(void *)(a1 + 56) + 8) + 24];

  return _objc_release_x1();
}

void sub_1000193E4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) getFH];
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 48) searchLIClientID];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000194A8;
  v6[3] = &unk_1000389E8;
  long long v7 = *(_OWORD *)(a1 + 64);
  [v2 lookupin:v3 name:v4 forClient:v5 usingFlags:0 requestID:-1 reply:v6];
}

void sub_1000194A8(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v8 = v7;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a4);
    id v7 = v8;
  }
}

id sub_10001952C(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  void v4[2] = sub_1000195B0;
  v4[3] = &unk_100038A88;
  long long v5 = *(_OWORD *)(a1 + 48);
  return [v1 listXattrsOf:v2 requestID:-1 reply:v4];
}

void sub_1000195B0(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    id v6 = v7;
  }
}

void sub_100019634(uint64_t a1)
{
  uint64_t v3 = a1 + 40;
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(*(void *)(*(void *)(v3 + 16) + 8) + 40);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001973C;
  v8[3] = &unk_100038820;
  long long v9 = *(_OWORD *)(v3 + 24);
  [v4 xattrOf:v5 named:v2 requestID:-1 reply:v8];
  int v6 = *(_DWORD *)(*(void *)(*(void *)(v3 + 24) + 8) + 24);
  if (v6 != 93)
  {
    if (v6)
    {
      if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100026228();
      }
    }
    else
    {
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      if (v7) {
        [*(id *)(a1 + 48) setObject:v7 forKeyedSubscript:*(void *)(a1 + 40)];
      }
    }
  }
}

void sub_10001973C(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    id v6 = v7;
  }
}

id sub_1000197C0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v3 = *(void **)(a1 + 32);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  void v5[2] = sub_100019848;
  v5[3] = &unk_100038820;
  long long v6 = *(_OWORD *)(a1 + 56);
  return [v3 xattrOf:v2 named:v1 requestID:-1 reply:v5];
}

void sub_100019848(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    id v6 = v7;
  }
}

id sub_1000198CC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) searchLIClientID];

  return [v2 reclaim:v1 forClient:v3 requestID:-1 reply:&stru_100038B40];
}

void sub_100019924(id a1, int a2, NSData *a3)
{
  uint64_t v4 = a3;
  if (a2 && os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000262BC();
  }
}

void sub_100019988(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) getFH];
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 48) searchLIClientID];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100019A4C;
  v6[3] = &unk_1000389E8;
  long long v7 = *(_OWORD *)(a1 + 64);
  [v2 lookupin:v3 name:v4 forClient:v5 usingFlags:0 requestID:-1 reply:v6];
}

void sub_100019A4C(uint64_t a1, int a2, int a3, id obj)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

uint64_t sub_100019A6C(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) getNodeForFH:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) withError:*(void *)(*(void *)(a1 + 56) + 8) + 24];

  return _objc_release_x1();
}

void sub_100019ACC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) getFH];
  objc_msgSend(v2, "reclaim:forClient:requestID:reply:", v3, objc_msgSend(*(id *)(a1 + 40), "searchLIClientID"), -1, &stru_100038B88);
}

unsigned char *sub_100019D20(uint64_t a1, unsigned int a2)
{
  result = [*(id *)(a1 + 32) mutableBytes];
  if (*(_DWORD *)(a1 + 40) > a2) {
    result[a2] = 1;
  }
  return result;
}

uint64_t sub_100019D64(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 544), "scanVolumeForFileIDs:count:returningAttributes:withBlock:", objc_msgSend(*(id *)(a1 + 40), "bytes"), *(unsigned int *)(a1 + 72), 257, *(void *)(a1 + 56));
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);

  return v2();
}

void sub_100019F4C(uint64_t a1)
{
  uint64_t v35 = 0;
  long long v36 = &v35;
  uint64_t v37 = 0x3032000000;
  long long v38 = sub_10000B7D4;
  v39 = sub_10000B7E4;
  id v40 = 0;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = sub_10000B7D4;
  uint64_t v33 = sub_10000B7E4;
  id v34 = 0;
  uint64_t v25 = 0;
  __int16 v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10001A498;
  v24[3] = &unk_100038C00;
  v24[4] = &v35;
  v24[5] = &v29;
  v24[6] = &v25;
  id v23 = objc_retainBlock(v24);
  uint64_t v2 = +[NSMutableDictionary dictionary];
  int v21 = (char *)[*(id *)(a1 + 32) bytes];
  if (*(_DWORD *)(a1 + 64))
  {
    unint64_t v3 = 0;
    uint64_t v4 = 0;
    id v5 = 0;
    id v6 = 0;
    while (1)
    {
      long long v7 = (void *)v36[5];
      v36[5] = 0;

      id v8 = (void *)v30[5];
      v30[5] = 0;

      *((unsigned char *)v26 + 24) = 0;
      if ([*(id *)(*(void *)(a1 + 40) + 544) scanVolumeForFileIDs:&v21[8 * v3] count:1 returningAttributes:769 withBlock:v23])
      {
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        goto LABEL_29;
      }
      if (*((unsigned char *)v26 + 24)) {
        break;
      }
      unint64_t v12 = v5;
LABEL_22:
      ++v3;
      id v5 = v12;
      if (v3 >= *(unsigned int *)(a1 + 64)) {
        goto LABEL_26;
      }
    }
    long long v9 = v4;
    unint64_t v22 = v3;
    unsigned __int8 v10 = [ (id) v36[5] bytes];
    if (v10[9] == *(void *)(a1 + 56))
    {
      uint64_t v11 = 0;
    }
    else
    {
      uint64_t v11 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
    }

    long long v13 = +[NSDictionary dictionaryWithObjectsAndKeys:v36[5], @"attributes", v30[5], @"name", v11, @"parent", 0];

    unint64_t v12 = +[NSNumber numberWithUnsignedLongLong:v10[8]];

    [v2 setObject:v13 forKeyedSubscript:v12];
    while (2)
    {
      id v6 = (void *)v11;
      while (1)
      {
        if (v10[9] == *(void *)(a1 + 56))
        {
          uint64_t v4 = v13;
          goto LABEL_21;
        }
        long long v14 = [v2 objectForKeyedSubscript:v6];

        if (!v14) {
          break;
        }
        uint64_t v15 = [v14 objectForKeyedSubscript:@"attributes"];
        long long v16 = (void *)v36[5];
        v36[5] = v15;

        uint64_t v17 = [v14 objectForKeyedSubscript:@"parent"];

        unsigned __int8 v10 = [ (id) v36[5] bytes];
        id v6 = (void *)v17;
        long long v13 = v14;
      }
      long long v18 = (void *)v36[5];
      v36[5] = 0;

      long long v19 = (void *)v30[5];
      v30[5] = 0;

      *((unsigned char *)v26 + 24) = 0;
      if (![*(id *)(*(void *)(a1 + 40) + 544) scanVolumeForFileIDs:v10 + 9 count:1 returningAttributes:769 withBlock:v23])
      {
        if (*((unsigned char *)v26 + 24))
        {
          unsigned __int8 v10 = [ (id) v36[5] bytes];
          if (v10[9] == *(void *)(a1 + 56))
          {
            uint64_t v11 = 0;
          }
          else
          {
            uint64_t v11 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
          }

          long long v13 = +[NSDictionary dictionaryWithObjectsAndKeys:v36[5], @"attributes", v30[5], @"name", v11, @"parent", 0];
          uint64_t v20 = +[NSNumber numberWithUnsignedLongLong:v10[8]];

          [v2 setObject:v13 forKeyedSubscript:v20];
          unint64_t v12 = (void *)v20;
          continue;
        }
        uint64_t v4 = 0;
LABEL_21:
        unint64_t v3 = v22;
        goto LABEL_22;
      }
      break;
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    uint64_t v4 = 0;
    id v5 = v12;
  }
  else
  {
    id v6 = 0;
    unint64_t v12 = 0;
    uint64_t v4 = 0;
LABEL_26:
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v5 = v12;
  }
LABEL_29:

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
}

void sub_10001A44C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_10001A498(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = +[NSData dataWithBytes:a3 length:184];
  uint64_t v7 = *(void *)(a1[4] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = +[NSString stringWithUTF8String:a4];
  uint64_t v10 = *(void *)(a1[5] + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
}

void sub_10001A648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001A660(uint64_t a1, int a2, id a3)
{
  if (!a2)
  {
    uint64_t v13 = v3;
    uint64_t v14 = v4;
    uint64_t v6 = [a3 bytes];
    unint64_t add = 0;
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v11 = *v6 * *(void *)(v7 + 488);
    unint64_t add = atomic_fetch_add((atomic_ullong *volatile)(v7 + 512), 1uLL);
    uint64_t v8 = +[NSData dataWithBytes:&v11 length:16];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

void sub_10001B064(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_10001B0A0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x1Cu);
}

void sub_10001B0C0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void sub_10001B0DC(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_10001B158(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

uint64_t sub_10001B184()
{
  return v0;
}

const char *sub_10001B190()
{
  return dispatch_queue_get_label(0);
}

void sub_10001B1C8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 8u);
}

void sub_10001B1EC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_10001B23C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_10001B708(id a1)
{
  uint64_t v1 = objc_alloc_init(UserFSSleepManager);
  uint64_t v2 = (void *)qword_100040340;
  qword_100040340 = (uint64_t)v1;

  uint64_t v3 = livefs_std_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "UFSPM: Created shared sleep manager", v4, 2u);
  }
}

void sub_10001B800(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(_DWORD *)(v1 + 12);
  if (!v2)
  {
    uint64_t v4 = +[NSNumber numberWithInt:255];
    IOPMAssertionSetProperty(*(_DWORD *)(*(void *)(a1 + 32) + 8), @"AssertLevel", v4);

    uint64_t v1 = *(void *)(a1 + 32);
    int v2 = *(_DWORD *)(v1 + 12);
  }
  *(_DWORD *)(v1 + 12) = v2 + 1;
}

void sub_10001B908(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(_DWORD *)(v1 + 12);
  if (!v2)
  {
    if (*(void *)(v1 + 24))
    {
      int v2 = 0;
    }
    else
    {
      dispatch_source_t v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *(dispatch_queue_t *)(a1 + 40));
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void **)(v5 + 24);
      *(void *)(v5 + 24) = v4;

      dispatch_source_set_timer(*(dispatch_source_t *)(*(void *)(a1 + 32) + 24), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL);
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(NSObject **)(v7 + 24);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10001BAB4;
      handler[3] = &unk_100038668;
      handler[4] = v7;
      dispatch_source_set_event_handler(v8, handler);
      uint64_t v9 = *(NSObject **)(*(void *)(a1 + 32) + 24);
      dispatch_time_t v10 = dispatch_time(0, 6000000000);
      dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
      dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 24));
      uint64_t v11 = +[NSNumber numberWithInt:255];
      IOPMAssertionSetProperty(*(_DWORD *)(*(void *)(a1 + 32) + 8), @"AssertLevel", v11);
      unint64_t v12 = livefs_std_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "UFSPM: Preventing machine sleep.", v13, 2u);
      }

      uint64_t v1 = *(void *)(a1 + 32);
      int v2 = *(_DWORD *)(v1 + 12);
    }
  }
  *(_DWORD *)(v1 + 12) = v2 + 1;
}

void sub_10001BAB4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(NSObject **)(v1 + 16);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001BB28;
  block[3] = &unk_100038668;
  block[4] = v1;
  dispatch_sync(v2, block);
}

void sub_10001BB28(uint64_t a1)
{
  uint64_t v1 = a1 + 32;
  if (*(_DWORD *)(*(void *)(a1 + 32) + 12))
  {
    int v2 = livefs_std_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      sub_100026528(v1, v2);
    }

    uint64_t v3 = *(NSObject **)(*(void *)v1 + 24);
    dispatch_time_t v4 = dispatch_time(0, 6000000000);
    dispatch_source_set_timer(v3, v4, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  }
  else
  {
    uint64_t v5 = +[NSNumber numberWithInt:0];
    dispatch_source_cancel(*(dispatch_source_t *)(*(void *)v1 + 24));
    uint64_t v6 = *(void **)(*(void *)v1 + 24);
    *(void *)(*(void *)v1 + 24) = 0;

    IOPMAssertionSetProperty(*(_DWORD *)(*(void *)v1 + 8), @"AssertLevel", v5);
    uint64_t v7 = livefs_std_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "UFSPM: timer: Allowing machine sleep.", v8, 2u);
    }
  }
}

void sub_10001BCC8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(_DWORD *)(v1 + 12);
  if (v2)
  {
    *(_DWORD *)(v1 + 12) = v2 - 1;
  }
  else
  {
    uint64_t v3 = livefs_std_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      sub_1000265A8(v3);
    }
  }
}

void sub_10001C190(uint64_t a1)
{
}

void sub_10001C6B8(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) targetVolume];
  int v2 = [*(id *)(a1 + 32) startLocation];
  uint64_t v3 = [*(id *)(a1 + 32) searchCriteria];
  dispatch_time_t v4 = [*(id *)(a1 + 32) searchToken];
  uint64_t v5 = [*(id *)(a1 + 32) resultsHandler];
  [v6 searchVolume:v2 withCriteria:v3 withSearchToken:v4 andWithResultsHandler:v5];
}

void sub_10001C8D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_10001C8EC(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10001DE38(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100020BF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100020C10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100020C20(uint64_t a1)
{
}

void sub_100020C28(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_time_t v4 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10002759C((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v3;
  id v13 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100020CAC(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100027608();
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100020FD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_100020FF8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000276C4((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v3;
  id v13 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10002107C(uint64_t a1, void *a2, void *a3)
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

void sub_1000214C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1000214EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000276C4((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v3;
  id v13 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100021570(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void initAllUVFSdecmpfsRegistration()
{
  qword_100040368 = (uint64_t)off_1000402B8;
  unk_100040370 = &off_1000402D0;
  qword_100040388 = (uint64_t)off_1000402B8;
  unk_100040390 = &off_1000402D0;
  qword_100040398 = (uint64_t)off_1000402B8;
  unk_1000403A0 = &off_1000402D0;
  qword_1000403A8 = (uint64_t)off_1000402B8;
  unk_1000403B0 = &off_1000402D0;
}

uint64_t decmpGetFunc(unsigned int a1, int a2)
{
  if (a1 > 0xFE) {
    return 0;
  }
  id v4 = (void *)qword_100040350[a1];
  if (!v4)
  {
    uint64_t v5 = userfs_log_default;
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100027A10(a1, v5);
    }
    return 0;
  }
  if (a2 == 2) {
    return v4[2];
  }
  if (a2 != 1)
  {
    if (!a2) {
      return *v4;
    }
    return 0;
  }
  return v4[1];
}

uint64_t sub_1000216B0(uint64_t result, void *a2, void *a3)
{
  *a2 = 0;
  *a3 = *(void *)(result + 12);
  return result;
}

uint64_t sub_1000216C0()
{
  return decompressWithCallback();
}

uint64_t sub_10002174C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (!a5) {
    return 22;
  }
  if (!a4)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    id v13 = +[NSMutableData dataWithLength:184];
    if (!v13) {
      return 12;
    }
    uint64_t v14 = *(uint64_t (**)(uint64_t, id))(v12 + 80);
    id v15 = v13;
    uint64_t v10 = v14(v11, [v15 mutableBytes]);
    if (!v10) {
      *a5 = *((void *)[v15 mutableBytes] + 6);
    }

    return v10;
  }
  uint64_t v7 = a1 + 32;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v8 = *(uint64_t (**)(uint64_t))(*(void *)(v7 + 8) + 288);

  return v8(v6);
}

void sub_100021814(uint64_t a1, void *a2, unint64_t *a3)
{
  unint64_t v3 = (*a3 + (unsigned __int16)*a2 + 0xFFFF) & 0xFFFFFFFFFFFF0000;
  *a2 &= 0xFFFFFFFFFFFF0000;
  *a3 = v3;
}

uint64_t sub_10002183C(uint64_t a1)
{
  if (*(_DWORD *)a1 < 0x18u) {
    return 0;
  }
  uint64_t v1 = *(void *)(a1 + 20) & 1;
  unint64_t v2 = *(void *)(a1 + 20) & 0xFFFFFFFFFFFFFFFELL;
  if (v2)
  {
    unint64_t v3 = userfs_log_default;
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100027A88(v2, v3);
    }
  }
  return v1;
}

void sub_1000218B0()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "connection:reject", v0, 2u);
}

void sub_1000218F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100021934()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "resume returned", v0, 2u);
}

void sub_10002197C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000219B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000219F4()
{
  sub_100004984();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "loadFileSystemDylibPassingParameterDict:faileddlopen:%s", v1, 0xCu);
}

void sub_100021A68()
{
  sub_1000049AC();
  sub_100004990((void *)&_mh_execute_header, v0, v1, "loadFileSystemDylibPassingParameterDict:faileddlsym", v2, v3, v4, v5, v6);
}

void sub_100021A9C()
{
  sub_1000049AC();
  sub_100004990((void *)&_mh_execute_header, v0, v1, "loadFileSystemDylibPassingParameterDict:failedPluginInit", v2, v3, v4, v5, v6);
}

void sub_100021AD0()
{
  sub_1000049C4(__stack_chk_guard);
  sub_1000049B8();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "loadFileSystemDylibPassingParameterDict:notvalidDyLib:%llu:%d", v2, 0x12u);
}

void sub_100021B58()
{
  sub_1000049AC();
  sub_100004990((void *)&_mh_execute_header, v0, v1, "loadFileSystemDylibPassingParameterDict:failedfsops_init", v2, v3, v4, v5, v6);
}

void sub_100021B8C()
{
  sub_1000049C4(__stack_chk_guard);
  sub_1000049B8();
  sub_100004968((void *)&_mh_execute_header, v0, v1, "loadFileSystemDylibPassingParameterDict:opsVectorLoaded:%@", v2, v3, v4, v5, v6);
}

void sub_100021BF4()
{
  sub_1000049C4(__stack_chk_guard);
  sub_1000049B8();
  sub_100004968((void *)&_mh_execute_header, v0, v1, "loadFileSystemDylibPassingParameterDict:inited:%@", v2, v3, v4, v5, v6);
}

void sub_100021C5C()
{
  sub_1000049C4(__stack_chk_guard);
  sub_1000049B8();
  sub_100004968((void *)&_mh_execute_header, v0, v1, "loadFileSystemDylibPassingParameterDict:loaded:%@", v2, v3, v4, v5, v6);
}

void sub_100021CC4()
{
  sub_1000049B8();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_fault_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_FAULT, "underflow for UVFS plug-in refcount: %@, %p", v2, 0x16u);
}

void sub_100021D48()
{
  sub_100004984();
  sub_100004968((void *)&_mh_execute_header, v0, v1, "getSupprtedFilesystems: %@", v2, v3, v4, v5, v6);
}

void sub_100021DB0()
{
  sub_1000049AC();
  sub_100004990((void *)&_mh_execute_header, v0, v1, "getSupportedFilesystems: could not get supported filesystems, defaulting to standard one", v2, v3, v4, v5, v6);
}

void sub_100021DE4()
{
  sub_1000049AC();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Running debug build, additinal filesystem might be loaded", v1, 2u);
}

void sub_100021E24()
{
  sub_100004984();
  sub_100004968((void *)&_mh_execute_header, v0, v1, "getUVFSPluginForFS:loading dylib:%@", v2, v3, v4, v5, v6);
}

void sub_100021E8C()
{
  sub_100004984();
  sub_100004968((void *)&_mh_execute_header, v0, v1, "getUVFSPluginForFS:taking a ref:%@", v2, v3, v4, v5, v6);
}

void sub_100021EF4()
{
  sub_100004984();
  sub_100004968((void *)&_mh_execute_header, v0, v1, "getUVFSPluginForFS:about to dispatch_once:%@", v2, v3, v4, v5, v6);
}

void sub_100021F5C()
{
  sub_100004984();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "getUVFSPluginForFS:unknownFS:%@", v1, 0xCu);
}

void sub_100021FD0()
{
  sub_100004984();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "getUVFSPluginForFS:start:%@:%@", v2, 0x16u);
}

void sub_100022058()
{
  sub_1000049AC();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "getUVFSPluginForFS:created static array", v1, 2u);
}

void sub_100022098()
{
  sub_100006300();
  sub_100006330((void *)&_mh_execute_header, v0, v1, "%s: Empty iterator, couldn't find volume IO media of bsdName: %@, can't find partitions and disk properties!", v2, v3, v4, v5, 2u);
}

void sub_10002210C()
{
  sub_100006300();
  sub_100006330((void *)&_mh_execute_header, v0, v1, "%s: Couldn't find IO service of %@, can't find partitions and disk properties!", v2, v3, v4, v5, 2u);
}

void sub_100022180()
{
  sub_100006300();
  sub_100006330((void *)&_mh_execute_header, v0, v1, "%s: Encountered errors while trying to find device for bsdName: %@, can't find partitions and disk properties!", v2, v3, v4, v5, 2u);
}

void sub_1000221F4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002226C(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "-[UVFSAnalytics discoverPartitions:]";
  sub_100006314((void *)&_mh_execute_header, (int)a2, a3, "%s: Partition size wasn't found in the partition, won't log it to telemetry.", a1);
}

void sub_1000222B0(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "-[UVFSAnalytics discoverPartitions:]";
  sub_100006314((void *)&_mh_execute_header, (int)a2, a3, "%s: Partition type wasn't found in the partition, won't log it to telemetry.", a1);
}

void sub_1000222F4(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "-[UVFSAnalytics discoverPartitions:]";
  sub_100006314((void *)&_mh_execute_header, (int)a2, a3, "%s: Couldn't find child partition properties, won't log this partition's properties", a1);
}

void sub_100022338(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000223B0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100022428(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000224A0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100022518(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100022590(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100022608(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100022680(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "rawDeviceInit:failIOkitgetMedia:%@", (uint8_t *)&v2, 0xCu);
}

void sub_1000226F8()
{
  sub_10000873C();
  sub_100008754((void *)&_mh_execute_header, v0, v1, "rawDeviceInit:failAddIOKitNotification:%@:%d");
}

void sub_100022760(int *a1, NSObject *a2)
{
  int v2 = *a1;
  v3[0] = 67109376;
  v3[1] = 0;
  __int16 v4 = 1024;
  int v5 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "rawDeviceInit:deviceOpened:%d:%d", (uint8_t *)v3, 0xEu);
}

void sub_1000227E8()
{
  sub_10000873C();
  sub_100008754((void *)&_mh_execute_header, v0, v1, "rawDeviceInit:failOpen:%@, %d");
}

void sub_100022850()
{
  sub_10000873C();
  sub_100008754((void *)&_mh_execute_header, v0, v1, "rawDeviceInit:failOpen:2:%@, %d");
}

void sub_1000228B8()
{
  sub_10000873C();
  sub_100008754((void *)&_mh_execute_header, v0, v1, "rawDeviceInit:failOpenFile:%@, %d");
}

void sub_100022920(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = 22;
  sub_100008774((void *)&_mh_execute_header, a2, a3, "rawDeviceInit:fileOpen:%@:%d", (uint8_t *)&v3);
}

void sub_1000229A0()
{
  __assert_rtn("userfs_open", "LiveFSRawDevice.m", 94, "server != NULL");
}

void sub_1000229CC(uint64_t a1, uint64_t a2, NSObject *a3)
{
  LOWORD(v3) = 2048;
  *(void *)((char *)&v3 + 2) = a2;
  sub_100008824((void *)&_mh_execute_header, a2, a3, "open:return:%d:%lld", 67109376, (void)v3);
}

void sub_100022A44(char a1, xpc_object_t object, os_log_t log)
{
  if (a1) {
    uint64_t v4 = "NULL";
  }
  else {
    uint64_t v4 = xpc_copy_description(object);
  }
  int v5 = 136446210;
  int v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "open:invalidReply:%{public}s", (uint8_t *)&v5, 0xCu);
}

void sub_100022AE4(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "open:error:%d", (uint8_t *)v2, 8u);
}

void sub_100022B5C(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "open:fd:%d", (uint8_t *)v2, 8u);
}

void sub_100022BD4()
{
  __assert_rtn("userfs_open", "LiveFSRawDevice.m", 95, "xpc_get_type(server) == XPC_TYPE_CONNECTION");
}

void sub_100022C00()
{
  sub_10000873C();
  sub_100008824((void *)&_mh_execute_header, v0, v1, "open:%{public}s:flags:0x%x");
}

void sub_100022C68(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100022CE0(void *a1, void *a2)
{
  long long v3 = a1;
  uint64_t v4 = [a2 deviceName];
  v6[0] = 136315394;
  sub_100006300();
  sub_10000880C((void *)&_mh_execute_header, v3, v5, "%s:kIOMessageServiceIsTerminated:%@", (uint8_t *)v6);
}

void sub_100022D8C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100022E04()
{
  v2[0] = 136315394;
  sub_100006300();
  sub_10000880C((void *)&_mh_execute_header, v0, v1, "%s:UUID:%@", (uint8_t *)v2);
}

void sub_100022E7C()
{
  v2[0] = 136315394;
  sub_100008864();
  sub_100008774((void *)&_mh_execute_header, v0, v1, "%s: got error: %d while trying to get UUID", (uint8_t *)v2);
}

void sub_100022EF4()
{
  sub_1000087AC(__stack_chk_guard);
  sub_1000087B8();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x1Cu);
}

void sub_100022F88()
{
  v2[0] = 136315394;
  sub_100006300();
  sub_10000880C((void *)&_mh_execute_header, v0, v1, "%s:UUID:%@", (uint8_t *)v2);
}

void sub_100023000()
{
  v2[0] = 136315394;
  sub_100008864();
  sub_100008774((void *)&_mh_execute_header, v0, v1, "%s: got error on re-alloc: %d", (uint8_t *)v2);
}

void sub_100023078()
{
  sub_1000087AC(__stack_chk_guard);
  *(_DWORD *)long long v3 = 136315650;
  *(void *)&v3[4] = "-[LiveFSRawDevice getVolumesFromDeviceForFileSystem:]";
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = v0;
  *(_WORD *)&v3[22] = 2112;
  sub_100008844((void *)&_mh_execute_header, v1, v2, "%s:%@:fsName:%@:finish", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], v1);
}

void sub_100023100(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)long long v3 = 138412546;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 1024;
  *(_DWORD *)&v3[14] = a2;
  sub_100008754((void *)&_mh_execute_header, a2, a3, "device:%@:scanvol:error:%d", *(void *)v3, *(void *)&v3[8], *(_WORD *)&v3[16]);
}

void sub_10002317C(unsigned char *a1, unsigned char *a2)
{
  sub_1000087FC(a1, a2);
  sub_1000087E0((void *)&_mh_execute_header, v2, v3, "getVolumeFromDevice:checkAndMountVolumeWithCreds:error:skipping", v4);
}

void sub_1000231A8(unsigned char *a1, unsigned char *a2)
{
  sub_1000087FC(a1, a2);
  sub_1000087E0((void *)&_mh_execute_header, v2, v3, "getVolumeFromDevice:checkAndMountVolumeWithCreds:EAUTH", v4);
}

void sub_1000231D4(unsigned char *a1, unsigned char *a2)
{
  sub_1000087FC(a1, a2);
  sub_1000087E0((void *)&_mh_execute_header, v2, v3, "getVolumeFromDevice:checkAndMountVolumeWithCreds:fsck:error:skipping", v4);
}

void sub_100023200()
{
  sub_1000087AC(__stack_chk_guard);
  sub_1000087C8();
  sub_10000880C((void *)&_mh_execute_header, v0, (uint64_t)v0, "getVolumeFromDevice:%@:taste:fail:%@:skipping", v1);
}

void sub_100023270()
{
  sub_1000087AC(__stack_chk_guard);
  sub_1000087C8();
  sub_1000087B8();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x16u);
}

void sub_1000232E0()
{
  sub_1000087AC(__stack_chk_guard);
  sub_10000878C();
  sub_1000087B8();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x20u);
}

void sub_10002335C()
{
  sub_1000087AC(__stack_chk_guard);
  int v2 = 136315650;
  sub_10000878C();
  sub_100008844((void *)&_mh_execute_header, v0, v1, "%s:%@:fsName:%{public}@:start", v2);
}

void sub_1000233D0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100023408(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100023440(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "LFSRD:cancelIOKitTerminateNotification:release:error:%d", (uint8_t *)v2, 8u);
}

void sub_1000234B8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000234F0(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  os_log_t v3 = a2;
  int v4 = *__error();
  int v6 = 138412546;
  uint64_t v7 = v2;
  __int16 v8 = 1024;
  int v9 = v4;
  sub_100008774((void *)&_mh_execute_header, v3, v5, "[%@]:close:error:%d", (uint8_t *)&v6);
}

void sub_100023590(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100023608(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100023680()
{
  v1[0] = 136315394;
  sub_100006300();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s:connection:error:%@", (uint8_t *)v1, 0x16u);
}

void sub_100023700()
{
  v1[0] = 136315394;
  sub_100006300();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s:error:%@", (uint8_t *)v1, 0x16u);
}

void sub_100023780()
{
  sub_1000049AC();
  sub_100004990((void *)&_mh_execute_header, v0, v1, "exit", v2, v3, v4, v5, v6);
}

void sub_1000237B4(uint64_t a1, int a2, os_log_t log)
{
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "reply:%u:%@", (uint8_t *)v3, 0x12u);
}

void sub_10002383C()
{
  sub_1000049AC();
  sub_100003E14((void *)&_mh_execute_header, v0, v1, "iokit:queue:create:done", v2, v3, v4, v5, v6);
}

void sub_100023870()
{
  sub_1000049AC();
  sub_100004990((void *)&_mh_execute_header, v0, v1, "main: unable to create IOKit notification queue", v2, v3, v4, v5, v6);
}

void sub_1000238A4()
{
  sub_1000049AC();
  sub_100003E14((void *)&_mh_execute_header, v0, v1, "logger:create:done", v2, v3, v4, v5, v6);
}

void sub_1000238D8(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 136315394;
  uint64_t v4 = "-[UVFSService ejectVolumesForDevice:how:withReply:]";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s: reply(%@)", (uint8_t *)&v3, 0x16u);
}

void sub_10002396C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000239E4()
{
  sub_1000049AC();
  sub_100004990((void *)&_mh_execute_header, v0, v1, "Unlock request on volume which isn't locked", v2, v3, v4, v5, v6);
}

void sub_100023A18()
{
  sub_1000049AC();
  sub_100004990((void *)&_mh_execute_header, v0, v1, "Unlock request on volume lacking preVol object", v2, v3, v4, v5, v6);
}

void sub_100023A4C()
{
  sub_1000049AC();
  sub_100004990((void *)&_mh_execute_header, v0, v1, "unlockVolume:lifsdService:connectionRefused", v2, v3, v4, v5, v6);
}

void sub_100023A80()
{
  sub_100004984();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Error updating volume domain error after unlock. Perhaps disconnect volume %@ and reconnect", v1, 0xCu);
}

void sub_100023AF4()
{
  sub_100004984();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "device:%{public}@:userfsd:connection:refused:exiting", v1, 0xCu);
}

void sub_100023B68()
{
  sub_100004984();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "device:%{public}@:raw:device:creation:error:%@:exiting", v2, 0x16u);
}

void sub_100023BEC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = a2;
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2048;
  id v9 = [a3 count];
  _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "device:%{public}@:rawDevice:loadedVolumes:%lu", (uint8_t *)&v6, 0x16u);
}

void sub_100023CA4()
{
  sub_100004984();
  sub_100004968((void *)&_mh_execute_header, v0, v1, "device:%{public}@:rawDevice:created", v2, v3, v4, v5, v6);
}

void sub_100023D0C()
{
  sub_100004984();
  sub_100004968((void *)&_mh_execute_header, v0, v1, "device:%{public}@:userfsd:connected", v2, v3, v4, v5, v6);
}

void sub_100023D74()
{
  sub_1000049AC();
  sub_100003E14((void *)&_mh_execute_header, v0, v1, "main:gIOKitNotificationQueue:drained", v2, v3, v4, v5, v6);
}

void sub_100023DA8()
{
  sub_1000049AC();
  sub_100004990((void *)&_mh_execute_header, v0, v1, "Failed to init external storage volume object", v2, v3, v4, v5, v6);
}

void sub_100023DDC()
{
  sub_10001B1E0();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "userFSVolume:init:enableSpotlight:%d:_spotlightEnabled:%d", v2, 0xEu);
}

void sub_100023E6C()
{
  sub_1000049AC();
  sub_100004990((void *)&_mh_execute_header, v0, v1, "LFM init: unable to get block size.", v2, v3, v4, v5, v6);
}

void sub_100023EA0()
{
  sub_1000049AC();
  sub_100003E14((void *)&_mh_execute_header, v0, v1, "LiveFSVolume init: No Volume Name entry was found, setting to Untitled.", v2, v3, v4, v5, v6);
}

void sub_100023ED4()
{
  sub_10001B230();
  sub_10001B158((void *)&_mh_execute_header, v0, v1, "LiveFSVolume init: could not get volume name [error- %d], setting to ERRORNAME.", v2, v3, v4, v5, v6);
}

void sub_100023F3C(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = a2;
  [v3 bytes];
  sub_100004984();
  _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "LFM init: unable to set volume name to '%s'.", v5, 0xCu);
}

void sub_100023FDC()
{
  sub_1000049AC();
  sub_100003E14((void *)&_mh_execute_header, v0, v1, "LFM init: Got empty VolumeName - set as Untitled.", v2, v3, v4, v5, v6);
}

void sub_100024010()
{
  sub_1000049AC();
  sub_10001B0C0((void *)&_mh_execute_header, v0, v1, "Updating userFSVolume without root node and error state == nil", v2, v3, v4, v5, v6);
}

void sub_100024044()
{
  sub_1000049B8();
  sub_10001B0DC((void *)&_mh_execute_header, v0, v1, "userFSVolume:init:registerSpotLightNotifier:%@:error:%@");
}

void sub_1000240BC()
{
  sub_1000049AC();
  sub_100004990((void *)&_mh_execute_header, v0, v1, "userFSVolume:init:failed to create spotlight notifier", v2, v3, v4, v5, v6);
}

void sub_1000240F0()
{
  sub_100004984();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "LFM: unregisterWithMounterService: got an error during unmount: %@", v2, v3, v4, v5, v6);
}

void sub_100024158()
{
  sub_100004984();
  sub_100004968((void *)&_mh_execute_header, v0, v1, "LFM: unregisterWithMounterService: start: %@", v2, v3, v4, v5, v6);
}

void sub_1000241C0()
{
  sub_1000049B8();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "userFSVolume: unregisterWithLiveFSService: error ejecting the volume: %@", v2, v3, v4, v5, v6);
}

void sub_100024230()
{
  sub_1000049B8();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "userFSVolume: forgetVolume: error forgeting the volume: %@", v2, v3, v4, v5, v6);
}

void sub_1000242A0()
{
  sub_10001B21C();
  sub_100008824((void *)&_mh_execute_header, v0, v1, "userFSVolume:unregister:%@:how:%d");
}

void sub_100024318(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 48);
  uint64_t v3 = a2;
  v5[0] = 67109120;
  v5[1] = [v2 count];
  sub_10001B1C8((void *)&_mh_execute_header, v3, v4, "liveFSVolume:purging:NameToFHTable[%d]", (uint8_t *)v5);
}

void sub_1000243B4(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "liveFSVolume:purging:FHToNodeTable:rootNode:reclaim:skipped", buf, 2u);
}

void sub_1000243F4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = a2;
  v5[0] = 67109120;
  v5[1] = [v2 count];
  sub_10001B1C8((void *)&_mh_execute_header, v3, v4, "liveFSVolume:purging:FHToNodeTable[%d]", (uint8_t *)v5);
}

void sub_100024490()
{
  sub_100004984();
  sub_100004968((void *)&_mh_execute_header, v0, v1, "getNodeFromFileID: inode [%llu] does not exists in mountFHtoNodeTable", v2, v3, v4, v5, v6);
}

void sub_1000244F8(uint64_t a1, uint64_t a2)
{
  LODWORD(v4) = 134218240;
  *(void *)((char *)&v4 + 4) = a2;
  sub_10001B1B8();
  sub_10001B0DC((void *)&_mh_execute_header, v2, v3, "getNodeFromFileID: inode [%llu] exists in mountFHtoNodeTable - liveFSNode [%p]", (void)v4, DWORD2(v4));
}

void sub_100024568()
{
  dispatch_queue_get_label(0);
  sub_10001B114();
  sub_10001B0A0((void *)&_mh_execute_header, v0, v1, "liveFSVolume:unmount:%@:queue:%s:how:%#x:finish", v2, v3, v4, v5, v6);
}

void sub_1000245FC()
{
  sub_1000049AC();
  sub_100003E14((void *)&_mh_execute_header, v0, v1, "liveFSVolume:unmount:all:searches:stopped", v2, v3, v4, v5, v6);
}

void sub_100024630()
{
  dispatch_queue_get_label(0);
  sub_10001B114();
  sub_10001B0A0((void *)&_mh_execute_header, v0, v1, "userFSVolume:unmount:%@:queue:%s:how:%#x:start", v2, v3, v4, v5, v6);
}

void sub_1000246C4()
{
  sub_1000049AC();
  sub_100003E14((void *)&_mh_execute_header, v0, v1, "liveFSVolume:unmount:disabling:stoping:search", v2, v3, v4, v5, v6);
}

void sub_1000246F8()
{
  sub_1000049AC();
  sub_100003E14((void *)&_mh_execute_header, v0, v1, "liveFSVolume:unmount:rootNode:set:to:nil", v2, v3, v4, v5, v6);
}

void sub_10002472C()
{
  sub_1000049AC();
  sub_100003E14((void *)&_mh_execute_header, v0, v1, "liveFSVolume:unmount:unloaded:filesystem", v2, v3, v4, v5, v6);
}

void sub_100024760()
{
  sub_1000049AC();
  sub_100003E14((void *)&_mh_execute_header, v0, v1, "liveFSVolume:unmount:appleDoubleManager:set:to:nil", v2, v3, v4, v5, v6);
}

void sub_100024794(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)sub_10001B184() volumeName];
  sub_100004984();
  sub_10001B064((void *)&_mh_execute_header, v1, v4, "LFM: created AppleDouble manager instance for volume %@", v5);
}

void sub_10002482C(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)sub_10001B184() volumeName];
  sub_100004984();
  sub_10001B064((void *)&_mh_execute_header, v1, v4, "LFM: volume %@ supports xattrs natively", v5);
}

void sub_1000248C4()
{
  sub_1000049AC();
  sub_100003E14((void *)&_mh_execute_header, v0, v1, "isDCIM: returning NO", v2, v3, v4, v5, v6);
}

void sub_1000248F8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100024970()
{
  sub_1000049AC();
  sub_100003E14((void *)&_mh_execute_header, v0, v1, "isDCIM: LIGetFSAttr(): returning NO", v2, v3, v4, v5, v6);
}

void sub_1000249A4()
{
  sub_1000049AC();
  sub_100003E14((void *)&_mh_execute_header, v0, v1, "isDCIM: returning YES", v2, v3, v4, v5, v6);
}

void sub_1000249D8()
{
  sub_100004984();
  sub_100004968((void *)&_mh_execute_header, v0, v1, "isDCIM: Got following paths: %@", v2, v3, v4, v5, v6);
}

void sub_100024A40()
{
  sub_1000049AC();
  sub_100003E14((void *)&_mh_execute_header, v0, v1, "isDCIM: will check if FAT/exFAT volume should handled by Photos", v2, v3, v4, v5, v6);
}

void sub_100024A74()
{
  sub_100004984();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "isDCIM: Photos does not support: %s", v2, v3, v4, v5, v6);
}

void sub_100024ADC()
{
  sub_10001B1E0();
  sub_10001B1C8((void *)&_mh_execute_header, v0, v1, "isDCIM: LILookup result: %d", v2);
}

void sub_100024B54()
{
  sub_10001B138();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "lifa: at:%lu mt:%lu   ct:%lu", v1, 0x20u);
}

void sub_100024BD4(uint64_t a1, uint64_t a2, void *a3)
{
  sub_10001B138();
  _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "lifa: s:%llu as:%llu fid:%llu", v5, 0x20u);
  *a3 = userfs_log_default;
}

void sub_100024C6C(uint64_t a1, uint64_t a2, void *a3)
{
  sub_10001B21C();
  int v12 = v4;
  __int16 v13 = v5;
  int v14 = v6;
  __int16 v15 = v5;
  int v16 = v7;
  __int16 v17 = v5;
  int v18 = v8;
  __int16 v19 = v5;
  int v20 = v9;
  _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "lifa: vm:%#016llx t:%d m:%#05o nl:%u u:%d g:%d", v11, 0x2Au);
  *a3 = userfs_log_default;
}

void sub_100024D30()
{
  sub_1000049AC();
  sub_100003E14((void *)&_mh_execute_header, v0, v1, "isDCIM: found the name, but type is wrong, setting ENOENT", v2, v3, v4, v5, v6);
}

void sub_100024D64()
{
  sub_1000049AC();
  sub_100003E14((void *)&_mh_execute_header, v0, v1, "I/O queue is paused", v2, v3, v4, v5, v6);
}

void sub_100024D98()
{
  sub_1000049AC();
  sub_100003E14((void *)&_mh_execute_header, v0, v1, "Pausing I/O queue", v2, v3, v4, v5, v6);
}

void sub_100024DCC()
{
  sub_10001B230();
  sub_10001B1C8((void *)&_mh_execute_header, v0, v1, "pauseIOQueue - counter [%d]", v2);
}

void sub_100024E38()
{
  sub_10001B230();
  sub_10001B1C8((void *)&_mh_execute_header, v0, v1, "I/O queue Resumed: counter [%d]", v2);
}

void sub_100024EA4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000062E4((void *)&_mh_execute_header, a1, a3, "%s: Got name = nil.", a5, a6, a7, a8, 2u);
}

void sub_100024F1C()
{
  sub_100008864();
  sub_10001B1EC((void *)&_mh_execute_header, v0, v1, "%s: back-end returned error = %d.", v2, v3, v4, v5, 2u);
}

void sub_100024F90()
{
  sub_100004984();
  sub_100004968((void *)&_mh_execute_header, v0, v1, "pathToStringNode:node:%@, called on the unlinked node", v2, v3, v4, v5, v6);
}

void sub_100024FF8()
{
  sub_10001B0FC();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "pathToStringNode:node:%@name:%@, failed to get UTF8 representation", v1, 0x16u);
}

void sub_100025070()
{
  sub_10001B0FC();
  sub_10001B0DC((void *)&_mh_execute_header, v0, v1, "pathToStringNode:node:%@name:%@");
}

void sub_1000250D8()
{
  sub_10001B208();
  *(void *)&void v4[2] = v0;
  sub_100008824((void *)&_mh_execute_header, v1, v2, "syncer timer: dispatch timer skipped: %d, %p", v3, *(const void **)v4);
}

void sub_100025154()
{
  sub_1000049AC();
  sub_100003E14((void *)&_mh_execute_header, v0, v1, "syncer timer: dispatched syncer time to 200ms+-10ms", v2, v3, v4, v5, v6);
}

void sub_100025188()
{
  sub_1000049AC();
  sub_100003E14((void *)&_mh_execute_header, v0, v1, "syncer timer: synced", v2, v3, v4, v5, v6);
}

void sub_1000251BC()
{
  sub_100008864();
  sub_10001B1EC((void *)&_mh_execute_header, v0, v1, "%s: failed to register fd with kernel. status: %d.", v2, v3, v4, v5, 2u);
}

void sub_100025230()
{
  v1[0] = 136315394;
  sub_100008864();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "%s: failed to register fd with kernel. status: %d.", (uint8_t *)v1, 0x12u);
}

void sub_1000252B0()
{
  sub_100008864();
  sub_10001B1EC((void *)&_mh_execute_header, v0, v1, "%s: closeFileDescriptorForKernel() failed, status: %d.", v2, v3, v4, v5, 2u);
}

void sub_100025324()
{
  sub_100004984();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "LIGetAttr(%@):unable to get attribute:return EIO", v2, v3, v4, v5, v6);
}

void sub_10002538C()
{
  sub_100004984();
  sub_100004968((void *)&_mh_execute_header, v0, v1, "LIGetAttr(%@): start", v2, v3, v4, v5, v6);
}

void sub_1000253F4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = a3;
  uint8_t v6 = objc_msgSend(a2, "lfn_name");
  int v7 = 138412802;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  os_log_t v10 = a2;
  __int16 v11 = 2112;
  int v12 = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "LISetAttr(%@): notifying spotlight for node: %@ and name: [%@]", (uint8_t *)&v7, 0x20u);
}

void sub_1000254BC()
{
  sub_100004984();
  sub_100004968((void *)&_mh_execute_header, v0, v1, "LISetAttr(%@): start", v2, v3, v4, v5, v6);
}

void sub_100025524()
{
  sub_10001B0FC();
  sub_10001B0DC((void *)&_mh_execute_header, v0, v1, "LILookup(%@/%@): start");
}

void sub_10002558C(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[userFSVolume readLinkOf:requestID:reply:]";
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "%s: failed to encode link content", (uint8_t *)&v1, 0xCu);
}

void sub_100025610()
{
  sub_100004984();
  sub_100004968((void *)&_mh_execute_header, v0, v1, "LIReadLink(%@): start", v2, v3, v4, v5, v6);
}

void sub_100025678()
{
  sub_1000049AC();
  sub_10001B0C0((void *)&_mh_execute_header, v0, v1, "?!?!?!? IO QUEUE IS PAUSED ?!?!?!?!?", v2, v3, v4, v5, v6);
}

void sub_1000256AC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100025724(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002579C()
{
  sub_10001B1AC();
  sub_10001B190();
  sub_10001B07C();
  sub_10001B0A0((void *)&_mh_execute_header, v0, v1, "removeItem(): finished reply(%d, %p) on %s", v2, v3, v4, v5, v6);
}

void sub_100025818()
{
  sub_10001B208();
  *(void *)&_DWORD v3[2] = v0;
  sub_100008824((void *)&_mh_execute_header, v0, v1, "removeItem(): running reply(%d, %p)", v2, *(const void **)v3);
}

void sub_100025888()
{
  sub_10001B1E0();
  sub_10001B158((void *)&_mh_execute_header, v0, v1, "Failed to retrieve deleted node (%d)", v2, v3, v4, v5, v6);
}

void sub_1000258F4()
{
  sub_10001B1AC();
  sub_10001B190();
  sub_10001B07C();
  sub_10001B0A0((void *)&_mh_execute_header, v0, v1, "removeDirectory(): finished reply(%d, %p) on %s", v2, v3, v4, v5, v6);
}

void sub_100025970()
{
  sub_10001B1AC();
  sub_10001B190();
  sub_10001B07C();
  sub_10001B0A0((void *)&_mh_execute_header, v0, v1, "removeDirectory(): running reply(%d, %p) on %s", v2, v3, v4, v5, v6);
}

void sub_1000259EC()
{
  sub_1000049AC();
  sub_100003E14((void *)&_mh_execute_header, v0, v1, "LIRename(), fromName has a FH outstanding, will update", v2, v3, v4, v5, v6);
}

void sub_100025A20()
{
  sub_1000049AC();
  sub_100003E14((void *)&_mh_execute_header, v0, v1, "LIRename(): toName has a FH outstanding, will make it dead", v2, v3, v4, v5, v6);
}

void sub_100025A54()
{
  sub_1000049AC();
  sub_10001B0C0((void *)&_mh_execute_header, v0, v1, "LIRename(): SWAP with AppleDouble??", v2, v3, v4, v5, v6);
}

void sub_100025A88()
{
  sub_1000049AC();
  sub_100003E14((void *)&_mh_execute_header, v0, v1, "LISetXattr:LIXattrHowRemove:appledouble:enoent:return:0", v2, v3, v4, v5, v6);
}

void sub_100025ABC(void *a1, void *a2, int a3)
{
  uint64_t v5 = a1;
  uint8_t v6 = objc_msgSend(a2, "lfn_appledouble");
  sub_100004984();
  __int16 v8 = 1024;
  int v9 = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "LISetXattr:AD[%@]:how:%d", v7, 0x12u);
}

void sub_100025B78()
{
  sub_1000049AC();
  sub_100003E14((void *)&_mh_execute_header, v0, v1, "LISetXattr:opening appledouble for writing", v2, v3, v4, v5, v6);
}

void sub_100025BAC()
{
  sub_1000049AC();
  sub_100003E14((void *)&_mh_execute_header, v0, v1, "LISetXattr:LIXattrHowRemove:appledouble:exists", v2, v3, v4, v5, v6);
}

void sub_100025BE0()
{
  sub_1000049AC();
  sub_100003E14((void *)&_mh_execute_header, v0, v1, "LISetXattr, setting appledouble not opened for Writing to nil", v2, v3, v4, v5, v6);
}

void sub_100025C14()
{
  sub_10001B1AC();
  id v3 = v2;
  id v4 = v1;
  [v3 UTF8String];
  id v5 = objc_retainBlock(v0);
  sub_10001B1B8();
  sub_10001B23C((void *)&_mh_execute_header, v6, v7, "LIListXattrs(%s, %p): reply (0, @[]) : noXattrPresent", v8, v9, v10, v11, 2u);
}

void sub_100025CC8()
{
  sub_10001B1AC();
  id v3 = v2;
  id v4 = v1;
  [v3 UTF8String];
  id v5 = objc_retainBlock(v0);
  sub_10001B1B8();
  sub_10001B23C((void *)&_mh_execute_header, v6, v7, "LIListXattrs(%s, %p): start", v8, v9, v10, v11, 2u);
}

void sub_100025D7C()
{
  sub_1000049AC();
  sub_100003E14((void *)&_mh_execute_header, v0, v1, "LISearchAbortAll- stoping all live searches", v2, v3, v4, v5, v6);
}

void sub_100025DB0()
{
  sub_100004984();
  sub_100004968((void *)&_mh_execute_header, v0, v1, "LISearchAbortAllClientSearches- stoping all live searches for client %llu", v2, v3, v4, v5, v6);
}

void sub_100025E18()
{
  sub_1000049AC();
  sub_100003E14((void *)&_mh_execute_header, v0, v1, "LISearchAbort", v2, v3, v4, v5, v6);
}

void sub_100025E4C()
{
  sub_1000049B8();
  sub_100004968((void *)&_mh_execute_header, v0, v1, "LICCinvalidateFileNodesForConnection:0x%llx:finish", v2, v3, v4, v5, v6);
}

void sub_100025EB8()
{
  sub_1000049B8();
  sub_100004968((void *)&_mh_execute_header, v0, v1, "LICCinvalidateFileNodesForConnection:0x%llx:start", v2, v3, v4, v5, v6);
}

void sub_100025F24()
{
  sub_100004984();
  sub_100004968((void *)&_mh_execute_header, v0, v1, "searchVolume:finish:%@", v2, v3, v4, v5, v6);
}

void sub_100025F8C()
{
  sub_10001B1E0();
  sub_10001B158((void *)&_mh_execute_header, v0, v1, "searchVolume:searchRequest:invalid:%d", v2, v3, v4, v5, v6);
}

void sub_100025FFC()
{
  sub_1000049AC();
  sub_100004990((void *)&_mh_execute_header, v0, v1, "searchVolume:scanDir:notSupported:aborting", v2, v3, v4, v5, v6);
}

void sub_100026030(uint8_t *buf, uint64_t a2, _DWORD *a3, os_log_t log)
{
  int v4 = *(_DWORD *)(*(void *)a2 + 24);
  *(_DWORD *)buf = 67109120;
  *a3 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "searchVolume:scanDir:aborting:error:%d", buf, 8u);
}

void sub_100026084()
{
  sub_10001B174();
  _DWORD *v1 = 138412290;
  void *v3 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "searchVolume:scanDir:bad:cookie:skipping:%@", v4, 0xCu);
}

void sub_1000260D8()
{
  sub_10001B174();
  _DWORD *v1 = 138412290;
  void *v3 = v2;
  sub_10001B064((void *)&_mh_execute_header, v5, (uint64_t)v3, "search:push:[%@]@0", v4);
}

void sub_100026124()
{
  sub_10001B174();
  _DWORD *v1 = 138412290;
  void *v3 = v2;
  sub_10001B064((void *)&_mh_execute_header, v5, (uint64_t)v3, "search: trying to get xattrs: %@", v4);
}

void sub_100026170(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  sub_10001B064((void *)&_mh_execute_header, a3, (uint64_t)a3, "searchRequest:push:%@", (uint8_t *)a2);
}

void sub_1000261C0()
{
  sub_100004984();
  sub_100004968((void *)&_mh_execute_header, v0, v1, "searchVolume:start:%@", v2, v3, v4, v5, v6);
}

void sub_100026228()
{
  sub_10001B1E0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "search: got error %d from getXattr for '%@'", v2, 0x12u);
}

void sub_1000262BC()
{
  sub_10001B230();
  sub_10001B158((void *)&_mh_execute_header, v0, v1, "search: got error from reclaim: %d", v2, v3, v4, v5, v6);
}

void sub_100026324()
{
  sub_1000049AC();
  sub_100004990((void *)&_mh_execute_header, v0, v1, "getVolumeFromDevice:FSmount:failed", v2, v3, v4, v5, v6);
}

void sub_100026358(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)sub_10001B184() deviceName];
  sub_100004984();
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "getVolumeFromDevice:CHECK_AND_REPAIR:failed:%@", v5, 0xCu);
}

void sub_1000263F8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)sub_10001B184() deviceName];
  sub_100004984();
  sub_10001B064((void *)&_mh_execute_header, v2, v5, "getVolumeFromDevice:CHECK_AND_REPAIR:start:%@", v6);
}

void sub_100026490(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)sub_10001B184() deviceName];
  sub_100004984();
  sub_10001B064((void *)&_mh_execute_header, v2, v5, "getVolumeFromDevice:QUICK_CHECK:start:%@", v6);
}

void sub_100026528(uint64_t a1, NSObject *a2)
{
  int v2 = *(_DWORD *)(*(void *)a1 + 12);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "UFSPM: timer: sleepCount: %d, rescheduling timer", (uint8_t *)v3, 8u);
}

void sub_1000265A8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "UFSPM: overrelease of powerassertion", v1, 2u);
}

void sub_1000265EC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100026664(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000266DC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100026748(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "liveFilesSearchRequest:alloced:clientid:0x%llx", (uint8_t *)&v3, 0xCu);
}

void sub_1000267C4(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  int v3 = 136315394;
  uint64_t v4 = "-[liveFilesSearchRequest invalidateConnections]";
  __int16 v5 = 2048;
  uint64_t v6 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s:clientid:0x%llx:start", (uint8_t *)&v3, 0x16u);
}

void sub_100026854()
{
  sub_100004984();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "LFN[%p]: Generated fileID is less then 3: %llu", v2, 0x16u);
}

void sub_1000268D8()
{
  sub_100004984();
  __int16 v3 = 1024;
  int v4 = v0;
  sub_100008774((void *)&_mh_execute_header, v1, (uint64_t)v1, "LFN[%p]: dealoc failed to reclaim: %d", v2);
}

void sub_100026954()
{
  sub_100004984();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "LFN[%p]: non-null UVFS node on dealoc, reclaiming", v1, 0xCu);
}

void sub_1000269C8()
{
  v2[0] = 136315394;
  sub_100008864();
  sub_100008774((void *)&_mh_execute_header, v0, v1, "%s: got error: %d, clamping down to EIO", (uint8_t *)v2);
}

void sub_100026A40()
{
  v2[0] = 136315394;
  sub_100008864();
  sub_100008774((void *)&_mh_execute_header, v0, v1, "%s: got error on re-alloc: %d", (uint8_t *)v2);
}

void sub_100026AB8()
{
  sub_1000049AC();
  sub_100004990((void *)&_mh_execute_header, v0, v1, "decmpfsFetchCompressedHeader: failed to allocate compressedFileHeader", v2, v3, v4, v5, v6);
}

void sub_100026AEC()
{
  sub_10001B1E0();
  sub_10001B158((void *)&_mh_execute_header, v0, v1, "decmpfsFetchCompressedHeader: invalid header type [%d]", v2, v3, v4, v5, v6);
}

void sub_100026B5C()
{
  sub_10001B1E0();
  __int16 v2 = 1024;
  int v3 = 1668116582;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "decmpfsFetchCompressedHeader: compression_magic [%d] != DECMPFS_MAGIC [%d]", v1, 0xEu);
}

void sub_100026BEC()
{
  sub_10001B230();
  sub_10001B158((void *)&_mh_execute_header, v0, v1, "decmpfsFetchCompressedHeader: getXAttr ended with error %d", v2, v3, v4, v5, v6);
}

void sub_100026C54(uint64_t a1, NSObject *a2)
{
  int v2 = *(_DWORD *)(*(void *)a1 + 8);
  uint64_t v3 = *(void *)(*(void *)a1 + 12);
  v4[0] = 67109376;
  v4[1] = v2;
  __int16 v5 = 2048;
  uint64_t v6 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "decmpfsFetchCompressedHeader: header type [%d] header size [%llu]", (uint8_t *)v4, 0x12u);
}

void sub_100026CE4()
{
  sub_10001B1E0();
  sub_10001B158((void *)&_mh_execute_header, v0, v1, "verifyFileIsFSCompressed: decmpfsFetchCompressedHeader: ended with error [%d]", v2, v3, v4, v5, v6);
}

void sub_100026D50()
{
  sub_1000049AC();
  sub_100004990((void *)&_mh_execute_header, v0, v1, "getCompressionFileInfo: error seting stream as nil", v2, v3, v4, v5, v6);
}

void sub_100026D84()
{
  sub_1000049AC();
  sub_100004990((void *)&_mh_execute_header, v0, v1, "getCompressionFileInfo: failed to allocate attr", v2, v3, v4, v5, v6);
}

void sub_100026DB8()
{
  sub_1000049AC();
  sub_100003E14((void *)&_mh_execute_header, v0, v1, "getCompressionFileInfo: this file is not compressed", v2, v3, v4, v5, v6);
}

void sub_100026DEC()
{
  sub_10001B1E0();
  sub_10001B158((void *)&_mh_execute_header, v0, v1, "getCompressionFileInfo: verifyFileIsFSCompressed ended with error [%d]", v2, v3, v4, v5, v6);
}

void sub_100026E58(uint64_t a1, uint8_t *buf, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 8);
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "LFN:getAttrData:returning fresh attrs with valid mask %#016llx", buf, 0xCu);
}

void sub_100026EA4()
{
  sub_10001B230();
  sub_10001B158((void *)&_mh_execute_header, v0, v1, "LFN: getAttrData: error getting attribute data: %d", v2, v3, v4, v5, v6);
}

void sub_100026F0C(uint64_t a1, uint8_t *buf, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 8);
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "LFN:getAttrData: returning cached attrs with valid mask %#016llx", buf, 0xCu);
}

void sub_100026F58()
{
  sub_1000049AC();
  sub_100003E14((void *)&_mh_execute_header, v0, v1, "LFN: setAttributeTo: Ignoring call with zero validmask", v2, v3, v4, v5, v6);
}

void sub_100026F8C()
{
  sub_1000049AC();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Got successful setattr, but no attributes out, returning EINVAL", v1, 2u);
}

void sub_100026FCC(void *a1, void *a2, int a3)
{
  id v5 = a1;
  uint8_t v6 = a2;
  uint64_t v7 = *((void *)[v5 bytes] + 1);
  v9[0] = 67109376;
  v9[1] = a3;
  __int16 v10 = 2048;
  uint64_t v11 = v7;
  sub_100008774((void *)&_mh_execute_header, v6, v8, "Error setting attribute: %d[0x%llx]", (uint8_t *)v9);
}

void sub_100027084()
{
  sub_1000049AC();
  sub_100003E14((void *)&_mh_execute_header, v0, v1, "LFN: setAttributeTo: attempted to modify UF_COMPRESSED", v2, v3, v4, v5, v6);
}

void sub_1000270B8(int *a1, int a2, os_log_t log)
{
  int v3 = *a1;
  v4[0] = 67109376;
  v4[1] = a2;
  __int16 v5 = 1024;
  int v6 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "LFN: setAttributeTo: bsd flags filtered: raw-flags 0x%08x, filtered-flags 0x%08x", (uint8_t *)v4, 0xEu);
}

void sub_100027144()
{
  sub_100004984();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "LFN[%p]: attempt to lookup null name, returning EINVAL", v1, 0xCu);
}

void sub_1000271B8()
{
  sub_1000049AC();
  sub_100004990((void *)&_mh_execute_header, v0, v1, "fetchUncompressedData: FETCH_CMPF_FUNC doesn't exist", v2, v3, v4, v5, v6);
}

void sub_1000271EC()
{
  sub_10001B230();
  sub_10001B158((void *)&_mh_execute_header, v0, v1, "fetchUncompressedData: fetch ended with error %d", v2, v3, v4, v5, v6);
}

void sub_100027254()
{
  sub_1000049AC();
  sub_100004990((void *)&_mh_execute_header, v0, v1, "readUncompressedData: FETCH_CMPF_FUNC doesn't exist", v2, v3, v4, v5, v6);
}

void sub_100027288()
{
  sub_10001B230();
  sub_10001B158((void *)&_mh_execute_header, v0, v1, "readUncompressedData: fetchUncompressedData failed with error %d", v2, v3, v4, v5, v6);
}

void sub_1000272F0(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(*(void *)a1 + 12);
  int v4 = 134218240;
  uint64_t v5 = a2;
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "readUncompressedData: asked to read at offset [%llu] behind file size [%llu]", (uint8_t *)&v4, 0x16u);
}

void sub_100027380()
{
  sub_10001B230();
  sub_10001B158((void *)&_mh_execute_header, v0, v1, "readUncompressedData: decmpfsFetchCompressedHeader error: %d", v2, v3, v4, v5, v6);
}

void sub_1000273E8()
{
  sub_10001B230();
  sub_10001B158((void *)&_mh_execute_header, v0, v1, "fsops_stream_reclaim: failed with error: %d", v2, v3, v4, v5, v6);
}

void sub_100027450()
{
  sub_1000049AC();
  sub_100004990((void *)&_mh_execute_header, v0, v1, "listXattr- last char of returned buffer is not null terminated", v2, v3, v4, v5, v6);
}

void sub_100027484(void *a1, id a2, void *a3)
{
  uint64_t v5 = *a1;
  id v6 = a2;
  uint64_t v7 = a3;
  uint64_t v8 = *((void *)[v6 bytes] + 3);
  int v9 = 136315906;
  __int16 v10 = "-[liveFSNode setFileSystemAttributes:toValue:andResult:]";
  __int16 v11 = 2048;
  int v12 = a1;
  __int16 v13 = 2048;
  uint64_t v14 = v5;
  __int16 v15 = 2048;
  uint64_t v16 = v8;
  _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s: %p *%p %llu", (uint8_t *)&v9, 0x2Au);
}

void sub_100027564(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002759C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100027608()
{
  v2[0] = 136315394;
  sub_1000215D0();
  sub_10000880C((void *)&_mh_execute_header, v0, v1, "%s: got reply, with error: %@", (uint8_t *)v2);
}

void sub_10002768C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000276C4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100027730()
{
  v2[0] = 136315394;
  sub_1000215D0();
  sub_10000880C((void *)&_mh_execute_header, v0, v1, "%s:return3:NO:error:%@", (uint8_t *)v2);
}

void sub_1000277B8(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[externalVolumeServiceLiveFSClient sameVolumeAlreadyLoaded:device:withError:]";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s:return:YES", (uint8_t *)&v1, 0xCu);
}

void sub_10002783C()
{
  v1[0] = 136315394;
  sub_1000215D0();
  sub_10000880C((void *)&_mh_execute_header, v0, (uint64_t)v0, "%s:return2:NO:error:%@", (uint8_t *)v1);
}

void sub_1000278C8()
{
  v1[0] = 136315394;
  sub_1000215D0();
  sub_10000880C((void *)&_mh_execute_header, v0, (uint64_t)v0, "%s:return1:NO:error:%@", (uint8_t *)v1);
}

void sub_100027954(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002798C(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[externalVolumeServiceLiveFSClient sameVolumeAlreadyLoaded:device:withError:]";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s:start", (uint8_t *)&v1, 0xCu);
}

void sub_100027A10(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "decmpGetFunc: decompressors[%d] == NULL", (uint8_t *)v2, 8u);
}

void sub_100027A88(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "get_decompression_flags_chunked: unknown type4 flags %llx\n", (uint8_t *)&v2, 0xCu);
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return _IOBSDNameMatching(mainPort, options, bsdName);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return _IONotificationPortCreate(mainPort);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

IOReturn IOPMAssertionCreateWithProperties(CFDictionaryRef AssertionProperties, IOPMAssertionID *AssertionID)
{
  return _IOPMAssertionCreateWithProperties(AssertionProperties, AssertionID);
}

IOReturn IOPMAssertionSetProperty(IOPMAssertionID theAssertion, CFStringRef theProperty, CFTypeRef theValue)
{
  return _IOPMAssertionSetProperty(theAssertion, theProperty, theValue);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperties(entry, properties, allocator, options);
}

kern_return_t IORegistryEntryGetChildIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return _IORegistryEntryGetChildIterator(entry, plane, iterator);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return _IORegistryEntryGetParentEntry(entry, plane, parent);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntrySearchCFProperty(entry, plane, key, allocator, options);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return _IOServiceAddInterestNotification(notifyPort, service, interestType, callback, refCon, notification);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return _IOServiceGetMatchingServices(mainPort, matching, existing);
}

void _Block_object_dispose(const void *a1, const int a2)
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

double __exp10(double a1)
{
  return ___exp10(a1);
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

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return _close(a1);
}

uint64_t decompressWithCallback()
{
  return _decompressWithCallback();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return _dispatch_block_create(flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return _dispatch_queue_get_label(queue);
}

uint64_t dispatch_queue_set_label_nocopy()
{
  return _dispatch_queue_set_label_nocopy();
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

int dlclose(void *__handle)
{
  return _dlclose(__handle);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

uint64_t getNSErrorFromLiveFSErrno()
{
  return _getNSErrorFromLiveFSErrno();
}

pid_t getpid(void)
{
  return _getpid();
}

uint64_t livefs_std_log()
{
  return _livefs_std_log();
}

long double log10(long double __x)
{
  return _log10(__x);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
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

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
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

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return _pthread_rwlock_destroy(a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return _pthread_rwlock_init(a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return _pthread_rwlock_rdlock(a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return _pthread_rwlock_unlock(a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return _pthread_rwlock_wrlock(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return _strlcpy(__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return _xpc_connection_send_message_with_reply_sync(connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_dup_fd(xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

id objc_msgSend_ADFileErr(void *a1, const char *a2, ...)
{
  return [a1 ADFileErr];
}

id objc_msgSend_FSOps(void *a1, const char *a2, ...)
{
  return [a1 FSOps];
}

id objc_msgSend_LIDisableSearch(void *a1, const char *a2, ...)
{
  return [a1 LIDisableSearch];
}

id objc_msgSend_LISearchAbortAll(void *a1, const char *a2, ...)
{
  return [a1 LISearchAbortAll];
}

id objc_msgSend_SearchRequests(void *a1, const char *a2, ...)
{
  return [a1 SearchRequests];
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

id objc_msgSend_UVFSNode(void *a1, const char *a2, ...)
{
  return [a1 UVFSNode];
}

id objc_msgSend_abortSearch(void *a1, const char *a2, ...)
{
  return [a1 abortSearch];
}

id objc_msgSend_aborted(void *a1, const char *a2, ...)
{
  return [a1 aborted];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allowSearch(void *a1, const char *a2, ...)
{
  return [a1 allowSearch];
}

id objc_msgSend_appleDoubleManager(void *a1, const char *a2, ...)
{
  return [a1 appleDoubleManager];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_callerID(void *a1, const char *a2, ...)
{
  return [a1 callerID];
}

id objc_msgSend_cancelNotifications(void *a1, const char *a2, ...)
{
  return [a1 cancelNotifications];
}

id objc_msgSend_checkAndUnloadPlugin(void *a1, const char *a2, ...)
{
  return [a1 checkAndUnloadPlugin];
}

id objc_msgSend_clientID(void *a1, const char *a2, ...)
{
  return [a1 clientID];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_containerFileExists(void *a1, const char *a2, ...)
{
  return [a1 containerFileExists];
}

id objc_msgSend_cookie(void *a1, const char *a2, ...)
{
  return [a1 cookie];
}

id objc_msgSend_cookieVerifier(void *a1, const char *a2, ...)
{
  return [a1 cookieVerifier];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createAppleDoubleManagerIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 createAppleDoubleManagerIfNeeded];
}

id objc_msgSend_createDispatchData(void *a1, const char *a2, ...)
{
  return [a1 createDispatchData];
}

id objc_msgSend_defaultClient(void *a1, const char *a2, ...)
{
  return [a1 defaultClient];
}

id objc_msgSend_deviceFD(void *a1, const char *a2, ...)
{
  return [a1 deviceFD];
}

id objc_msgSend_deviceIsClosed(void *a1, const char *a2, ...)
{
  return [a1 deviceIsClosed];
}

id objc_msgSend_deviceIsFile(void *a1, const char *a2, ...)
{
  return [a1 deviceIsFile];
}

id objc_msgSend_deviceIsReadOnly(void *a1, const char *a2, ...)
{
  return [a1 deviceIsReadOnly];
}

id objc_msgSend_deviceName(void *a1, const char *a2, ...)
{
  return [a1 deviceName];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_disk(void *a1, const char *a2, ...)
{
  return [a1 disk];
}

id objc_msgSend_diskBlockSize(void *a1, const char *a2, ...)
{
  return [a1 diskBlockSize];
}

id objc_msgSend_diskSize(void *a1, const char *a2, ...)
{
  return [a1 diskSize];
}

id objc_msgSend_diskType(void *a1, const char *a2, ...)
{
  return [a1 diskType];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_elementName(void *a1, const char *a2, ...)
{
  return [a1 elementName];
}

id objc_msgSend_errorForAuthError(void *a1, const char *a2, ...)
{
  return [a1 errorForAuthError];
}

id objc_msgSend_errorState(void *a1, const char *a2, ...)
{
  return [a1 errorState];
}

id objc_msgSend_filename(void *a1, const char *a2, ...)
{
  return [a1 filename];
}

id objc_msgSend_forceUpdateAttrs(void *a1, const char *a2, ...)
{
  return [a1 forceUpdateAttrs];
}

id objc_msgSend_fsPlugin(void *a1, const char *a2, ...)
{
  return [a1 fsPlugin];
}

id objc_msgSend_fsTypeName(void *a1, const char *a2, ...)
{
  return [a1 fsTypeName];
}

id objc_msgSend_fullPath(void *a1, const char *a2, ...)
{
  return [a1 fullPath];
}

id objc_msgSend_getAttrData(void *a1, const char *a2, ...)
{
  return [a1 getAttrData];
}

id objc_msgSend_getCompressionFileInfo(void *a1, const char *a2, ...)
{
  return [a1 getCompressionFileInfo];
}

id objc_msgSend_getDeviceFD(void *a1, const char *a2, ...)
{
  return [a1 getDeviceFD];
}

id objc_msgSend_getFH(void *a1, const char *a2, ...)
{
  return [a1 getFH];
}

id objc_msgSend_getFreeSpaceInVolume(void *a1, const char *a2, ...)
{
  return [a1 getFreeSpaceInVolume];
}

id objc_msgSend_getLinkCount(void *a1, const char *a2, ...)
{
  return [a1 getLinkCount];
}

id objc_msgSend_getLogPartition(void *a1, const char *a2, ...)
{
  return [a1 getLogPartition];
}

id objc_msgSend_getNextObjectIdentifier(void *a1, const char *a2, ...)
{
  return [a1 getNextObjectIdentifier];
}

id objc_msgSend_getSupportedFilesystems(void *a1, const char *a2, ...)
{
  return [a1 getSupportedFilesystems];
}

id objc_msgSend_getUserFSSleepManager(void *a1, const char *a2, ...)
{
  return [a1 getUserFSSleepManager];
}

id objc_msgSend_getVolumeCredentialFromKeychain(void *a1, const char *a2, ...)
{
  return [a1 getVolumeCredentialFromKeychain];
}

id objc_msgSend_getVolumePort(void *a1, const char *a2, ...)
{
  return [a1 getVolumePort];
}

id objc_msgSend_grantLIFSKextAccessToFD(void *a1, const char *a2, ...)
{
  return [a1 grantLIFSKextAccessToFD];
}

id objc_msgSend_hiddenStatus(void *a1, const char *a2, ...)
{
  return [a1 hiddenStatus];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_interfaceForListeners(void *a1, const char *a2, ...)
{
  return [a1 interfaceForListeners];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidateAllConnections(void *a1, const char *a2, ...)
{
  return [a1 invalidateAllConnections];
}

id objc_msgSend_invalidateConnections(void *a1, const char *a2, ...)
{
  return [a1 invalidateConnections];
}

id objc_msgSend_isCaseSensitive(void *a1, const char *a2, ...)
{
  return [a1 isCaseSensitive];
}

id objc_msgSend_isDCIM(void *a1, const char *a2, ...)
{
  return [a1 isDCIM];
}

id objc_msgSend_isErasable(void *a1, const char *a2, ...)
{
  return [a1 isErasable];
}

id objc_msgSend_itemId(void *a1, const char *a2, ...)
{
  return [a1 itemId];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadFileSystemDyLib(void *a1, const char *a2, ...)
{
  return [a1 loadFileSystemDyLib];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_metaDataRequests(void *a1, const char *a2, ...)
{
  return [a1 metaDataRequests];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_newClient(void *a1, const char *a2, ...)
{
  return [a1 newClient];
}

id objc_msgSend_noXattrsPresent(void *a1, const char *a2, ...)
{
  return [a1 noXattrsPresent];
}

id objc_msgSend_parentFH(void *a1, const char *a2, ...)
{
  return [a1 parentFH];
}

id objc_msgSend_partitionSize(void *a1, const char *a2, ...)
{
  return [a1 partitionSize];
}

id objc_msgSend_partitionTableType(void *a1, const char *a2, ...)
{
  return [a1 partitionTableType];
}

id objc_msgSend_partitionType(void *a1, const char *a2, ...)
{
  return [a1 partitionType];
}

id objc_msgSend_partitions(void *a1, const char *a2, ...)
{
  return [a1 partitions];
}

id objc_msgSend_pauseIOQueue(void *a1, const char *a2, ...)
{
  return [a1 pauseIOQueue];
}

id objc_msgSend_peek(void *a1, const char *a2, ...)
{
  return [a1 peek];
}

id objc_msgSend_pop(void *a1, const char *a2, ...)
{
  return [a1 pop];
}

id objc_msgSend_preVolInfo(void *a1, const char *a2, ...)
{
  return [a1 preVolInfo];
}

id objc_msgSend_purgeMappingTables(void *a1, const char *a2, ...)
{
  return [a1 purgeMappingTables];
}

id objc_msgSend_purgeNameToFHTable(void *a1, const char *a2, ...)
{
  return [a1 purgeNameToFHTable];
}

id objc_msgSend_purpose(void *a1, const char *a2, ...)
{
  return [a1 purpose];
}

id objc_msgSend_readOnly(void *a1, const char *a2, ...)
{
  return [a1 readOnly];
}

id objc_msgSend_reclaim(void *a1, const char *a2, ...)
{
  return [a1 reclaim];
}

id objc_msgSend_reclaimFile(void *a1, const char *a2, ...)
{
  return [a1 reclaimFile];
}

id objc_msgSend_reenableSystemSleep(void *a1, const char *a2, ...)
{
  return [a1 reenableSystemSleep];
}

id objc_msgSend_registerSpotlightNotifer(void *a1, const char *a2, ...)
{
  return [a1 registerSpotlightNotifer];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeFile(void *a1, const char *a2, ...)
{
  return [a1 removeFile];
}

id objc_msgSend_resultsHandler(void *a1, const char *a2, ...)
{
  return [a1 resultsHandler];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_resumeIOQueue(void *a1, const char *a2, ...)
{
  return [a1 resumeIOQueue];
}

id objc_msgSend_revokeDeviceIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 revokeDeviceIfNeeded];
}

id objc_msgSend_revokeLIFSKextAccessToFD(void *a1, const char *a2, ...)
{
  return [a1 revokeLIFSKextAccessToFD];
}

id objc_msgSend_rootNode(void *a1, const char *a2, ...)
{
  return [a1 rootNode];
}

id objc_msgSend_searchCriteria(void *a1, const char *a2, ...)
{
  return [a1 searchCriteria];
}

id objc_msgSend_searchGroup(void *a1, const char *a2, ...)
{
  return [a1 searchGroup];
}

id objc_msgSend_searchLIClientID(void *a1, const char *a2, ...)
{
  return [a1 searchLIClientID];
}

id objc_msgSend_searchToken(void *a1, const char *a2, ...)
{
  return [a1 searchToken];
}

id objc_msgSend_sendEvent(void *a1, const char *a2, ...)
{
  return [a1 sendEvent];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_startLocation(void *a1, const char *a2, ...)
{
  return [a1 startLocation];
}

id objc_msgSend_startSearch(void *a1, const char *a2, ...)
{
  return [a1 startSearch];
}

id objc_msgSend_startSyncerIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 startSyncerIfNeeded];
}

id objc_msgSend_supportsHardLinks(void *a1, const char *a2, ...)
{
  return [a1 supportsHardLinks];
}

id objc_msgSend_supportsPersistentObjectIdentifier(void *a1, const char *a2, ...)
{
  return [a1 supportsPersistentObjectIdentifier];
}

id objc_msgSend_takeAReference(void *a1, const char *a2, ...)
{
  return [a1 takeAReference];
}

id objc_msgSend_targetVolume(void *a1, const char *a2, ...)
{
  return [a1 targetVolume];
}

id objc_msgSend_terminateVolumesWithErrors(void *a1, const char *a2, ...)
{
  return [a1 terminateVolumesWithErrors];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_useKOIO(void *a1, const char *a2, ...)
{
  return [a1 useKOIO];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_volume(void *a1, const char *a2, ...)
{
  return [a1 volume];
}

id objc_msgSend_volumeCount(void *a1, const char *a2, ...)
{
  return [a1 volumeCount];
}

id objc_msgSend_volumeLabel(void *a1, const char *a2, ...)
{
  return [a1 volumeLabel];
}

id objc_msgSend_volumeLoadErrorReason(void *a1, const char *a2, ...)
{
  return [a1 volumeLoadErrorReason];
}

id objc_msgSend_volumeLoadStatus(void *a1, const char *a2, ...)
{
  return [a1 volumeLoadStatus];
}

id objc_msgSend_volumeName(void *a1, const char *a2, ...)
{
  return [a1 volumeName];
}

id objc_msgSend_volumeRawDevice(void *a1, const char *a2, ...)
{
  return [a1 volumeRawDevice];
}

id objc_msgSend_volumes(void *a1, const char *a2, ...)
{
  return [a1 volumes];
}

id objc_msgSend_xattrOf_named_requestID_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xattrOf:named:requestID:reply:");
}