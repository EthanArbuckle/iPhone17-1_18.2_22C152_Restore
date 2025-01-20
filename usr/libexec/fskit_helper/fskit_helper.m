void start()
{
  uint64_t v0;
  id v1;
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  v0 = objc_opt_new();
  v1 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.fskit.fskit_helper"];
  [v1 setDelegate:v0];
  v2 = fskit_std_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "FSKitHelper: listening", v5, 2u);
  }

  v3 = objc_opt_new();
  v4 = (void *)qword_1000087B8;
  qword_1000087B8 = v3;

  [v1 resume];
  dispatch_main();
}

void sub_100001BD4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100001CC8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100001E14(uint64_t a1)
{
  v2 = (const char *)[*(id *)(a1 + 32) UTF8String];
  v3 = fskit_std_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "FSKitHelper:message:processing:start", buf, 2u);
  }

  v4 = (void *)os_transaction_create();
  unsigned int v5 = [*(id *)(a1 + 40) euid];
  unsigned int v6 = [*(id *)(a1 + 40) egid];
  if (!v2 || (gid_t v7 = v6, (v8 = realpath_DARWIN_EXTSN(v2, (char *)buf)) == 0))
  {
    int v10 = 2;
    goto LABEL_8;
  }
  v9 = v8;
  if (strncmp(v8, "/dev/rdisk", 0xAuLL))
  {
    int v10 = 22;
LABEL_8:
    v11 = fskit_std_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100002984();
    }

    goto LABEL_11;
  }
  v14 = fskit_std_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    int v15 = *(_DWORD *)(a1 + 64);
    int v20 = 136315906;
    v21 = v9;
    __int16 v22 = 1024;
    int v23 = v15;
    __int16 v24 = 1024;
    unsigned int v25 = v5;
    __int16 v26 = 1024;
    gid_t v27 = v7;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "FSKitHelper:message:processing:open:%s:flags:%d:uid:%d:gid:%d", (uint8_t *)&v20, 0x1Eu);
  }

  *__error() = 0;
  BOOL v16 = (v5 | v7) != 0;
  if (!(v5 | v7) || !pthread_setugid_np(v5, v7)) {
    goto LABEL_23;
  }
  v17 = fskit_std_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    sub_100002A7C(v5, v7, v17);
  }

  int v10 = *__error();
  if (v10)
  {
    uint64_t v18 = 0xFFFFFFFFLL;
  }
  else
  {
LABEL_23:
    uint64_t v18 = open(v9, *(_DWORD *)(a1 + 64));
    int v10 = *__error();
    if (!v16)
    {
      if ((v18 & 0x80000000) != 0) {
        goto LABEL_28;
      }
      goto LABEL_25;
    }
  }
  pthread_setugid_np(0xFFFFFF9B, 0xFFFFFF9B);
  if ((v18 & 0x80000000) != 0)
  {
LABEL_28:
    v19 = fskit_std_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1000029F8();
    }

    if (v10) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_25:
  if (v10)
  {
LABEL_11:
    v12 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v10 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_12;
  }
LABEL_31:
  v12 = +[FSBlockDeviceResource resourceWithBSDName:*(void *)(a1 + 48) devicePath:*(void *)(a1 + 32) fileDescriptor:v18 writable:(*(_DWORD *)(a1 + 64) >> 1) & 1];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  close(v18);
LABEL_12:

  v13 = fskit_std_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    LOWORD(v20) = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "FSKitHelper:message:processing:done", (uint8_t *)&v20, 2u);
  }
}

void sub_1000022C0(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  unsigned int v3 = [*(id *)(a1 + 32) isRevoked];
  v4 = fskit_std_log();
  unsigned int v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100002B94(v2);
    }

    uint64_t v6 = *(void *)(a1 + 40);
    gid_t v7 = fs_errorForPOSIXError();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v8 = *v2;
      v9 = [*v2 getResourceID];
      *(_DWORD *)v19 = 136315650;
      *(void *)&v19[4] = "-[FSKitHelper wipeFS:replyHandler:]_block_invoke";
      __int16 v20 = 2048;
      id v21 = v8;
      __int16 v22 = 2112;
      int v23 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s:start:resource(%p):resourceID(%@)", v19, 0x20u);
    }
    *(void *)v19 = 0;
    int v10 = fskit_std_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_100002D5C(v2, v10);
    }

    v11 = os_transaction_create();
    [*v2 fileDescriptor];
    [*v2 blockSize];
    int v12 = wipefs_alloc();
    if (v12)
    {
      int v13 = v12;
      v14 = fskit_std_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100002CE4(v13);
      }

      int v15 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v13 userInfo:0];
    }
    else
    {
      int v16 = wipefs_wipe();
      if (v16)
      {
        int v17 = v16;
        uint64_t v18 = fskit_std_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_100002C6C(v17);
        }

        int v15 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v17 userInfo:0];
      }
      else
      {
        int v15 = 0;
      }
      wipefs_free();

      v11 = fskit_std_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        sub_100002C28(v11);
      }
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_1000026CC(uint64_t a1)
{
  v2 = fskit_std_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    unsigned int v3 = *(void **)(a1 + 32);
    v4 = [v3 getResourceID];
    int v13 = 136315650;
    v14 = "-[FSKitHelper revoke:replyHandler:]_block_invoke";
    __int16 v15 = 2048;
    int v16 = v3;
    __int16 v17 = 2112;
    uint64_t v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s:start:resource(%p):resourceID(%@)", (uint8_t *)&v13, 0x20u);
  }
  unsigned int v5 = *(void **)(a1 + 32);
  if (v5 && ([v5 devicePath], uint64_t v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    id v7 = [*(id *)(a1 + 32) devicePath];
    int v8 = revoke((const char *)[v7 UTF8String]);

    if (v8) {
      int v9 = *__error();
    }
    else {
      int v9 = 0;
    }
  }
  else
  {
    int v9 = 22;
  }
  int v10 = fskit_std_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315394;
    v14 = "-[FSKitHelper revoke:replyHandler:]_block_invoke";
    __int16 v15 = 1024;
    LODWORD(v16) = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s:reply(%d)", (uint8_t *)&v13, 0x12u);
  }

  uint64_t v11 = *(void *)(a1 + 40);
  int v12 = fs_errorForPOSIXError();
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
}

void sub_1000028B0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1000028DC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000028FC(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "FSKitHelper:connection:reject", v1, 2u);
}

void sub_100002940(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "FSKitHelper:connection:accept", v1, 2u);
}

void sub_100002984()
{
  sub_1000028D0();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "FSKitHelper: %{public}s: invalid path\n", v1, 0xCu);
}

void sub_1000029F8()
{
  sub_1000028D0();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "FSKitHelper: %{public}s: error=%d\n", v2, 0x12u);
}

void sub_100002A7C(int a1, int a2, os_log_t log)
{
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to setugid to (%d,%d)", (uint8_t *)v3, 0xEu);
}

void sub_100002B04(void *a1)
{
  os_log_t v1 = [a1 BSDName];
  sub_10000289C();
  sub_1000028B0((void *)&_mh_execute_header, v2, v3, "%s:reply(EBADF): Can't find queue for BSD name (%@), resource was revoked already, can't wipeFS", v4, v5, v6, v7, 2u);
}

void sub_100002B94(id *a1)
{
  os_log_t v1 = [*a1 BSDName];
  sub_10000289C();
  sub_1000028B0((void *)&_mh_execute_header, v2, v3, "%s:reply(EBADF): BSD name (%@) resource was revoked already, can't wipeFS", v4, v5, v6, v7, 2u);
}

void sub_100002C28(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "FSKitHelper:wipeFS:done", v1, 2u);
}

void sub_100002C6C(int a1)
{
  strerror(a1);
  sub_1000028D0();
  sub_1000028DC((void *)&_mh_execute_header, v1, v2, "FSKitHelper:wipeFS:wipefs_wipe:%s", v3, v4, v5, v6, v7);
}

void sub_100002CE4(int a1)
{
  strerror(a1);
  sub_1000028D0();
  sub_1000028DC((void *)&_mh_execute_header, v1, v2, "FSKitHelper:wipeFS:wipefs_alloc:%s", v3, v4, v5, v6, v7);
}

void sub_100002D5C(id *a1, NSObject *a2)
{
  unsigned int v4 = [*a1 fileDescriptor];
  id v5 = [*a1 blockSize];
  v6[0] = 67109376;
  v6[1] = v4;
  __int16 v7 = 2048;
  id v8 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "FSKitHelper:wipeFS:start:fd:%d:blockSize:%llu", (uint8_t *)v6, 0x12u);
}

void sub_100002E10(void *a1)
{
  uint64_t v1 = [a1 BSDName];
  sub_10000289C();
  sub_1000028B0((void *)&_mh_execute_header, v2, v3, "%s:reply(EINVAL): Can't find queue for BSD name (%@), resource wasn't opened or was revoked already", v4, v5, v6, v7, 2u);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
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

int close(int a1)
{
  return _close(a1);
}

void dispatch_main(void)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

uint64_t fs_errorForPOSIXError()
{
  return _fs_errorForPOSIXError();
}

uint64_t fskit_std_log()
{
  return _fskit_std_log();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

int pthread_setugid_np(uid_t a1, gid_t a2)
{
  return _pthread_setugid_np(a1, a2);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

int revoke(const char *a1)
{
  return _revoke(a1);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

uint64_t wipefs_alloc()
{
  return _wipefs_alloc();
}

uint64_t wipefs_free()
{
  return _wipefs_free();
}

uint64_t wipefs_wipe()
{
  return _wipefs_wipe();
}

id objc_msgSend_BSDName(void *a1, const char *a2, ...)
{
  return [a1 BSDName];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_blockSize(void *a1, const char *a2, ...)
{
  return [a1 blockSize];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_devicePath(void *a1, const char *a2, ...)
{
  return [a1 devicePath];
}

id objc_msgSend_egid(void *a1, const char *a2, ...)
{
  return [a1 egid];
}

id objc_msgSend_euid(void *a1, const char *a2, ...)
{
  return [a1 euid];
}

id objc_msgSend_fileDescriptor(void *a1, const char *a2, ...)
{
  return [a1 fileDescriptor];
}

id objc_msgSend_getResourceID(void *a1, const char *a2, ...)
{
  return [a1 getResourceID];
}

id objc_msgSend_isRevoked(void *a1, const char *a2, ...)
{
  return [a1 isRevoked];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return [a1 valueForEntitlement:];
}