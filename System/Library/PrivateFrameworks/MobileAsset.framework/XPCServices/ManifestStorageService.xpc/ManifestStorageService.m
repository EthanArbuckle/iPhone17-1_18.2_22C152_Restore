id getRepositoryPath(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t vars8;

  v5 = a1;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
  }
  else
  {
    _MobileAssetLog(0, 3, (uint64_t)"getRepositoryPath", @"ERROR: Invalid string passed to %s", v1, v2, v3, v4, (uint64_t)"getRepositoryPath");
    v6 = 0;
  }

  return v6;
}

void sub_1000029C4(id a1)
{
  qword_10000CD00 = objc_alloc_init(MASecureMobileAssetTypes);
  _objc_release_x1();
}

void sub_100003018(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100003058(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

int main(int argc, const char **argv, const char **envp)
{
  _MobileAssetLog(0, 6, (uint64_t)"main", @"Starting with MobileAsset-%s (built %s %s)", v4, v5, v6, v7, (uint64_t)"1");
  v8 = objc_alloc_init(MAManifestStorageServiceDelegate);
  v9 = +[NSXPCListener serviceListener];
  [v9 setDelegate:v8];
  [v9 resume];

  return 0;
}

id logInfo()
{
  if (qword_10000CD10 != -1) {
    dispatch_once(&qword_10000CD10, &stru_100008308);
  }
  v0 = (void *)qword_10000CD08;
  return v0;
}

void sub_1000032BC(id a1)
{
  qword_10000CD08 = (uint64_t)os_log_create("com.apple.mobileassetd", "Notice");
  _objc_release_x1();
}

id logError()
{
  if (qword_10000CD20 != -1) {
    dispatch_once(&qword_10000CD20, &stru_100008328);
  }
  v0 = (void *)qword_10000CD18;
  return v0;
}

void sub_100003354(id a1)
{
  qword_10000CD18 = (uint64_t)os_log_create("com.apple.mobileassetd", "Error");
  _objc_release_x1();
}

id logDebug()
{
  if (qword_10000CD30 != -1) {
    dispatch_once(&qword_10000CD30, &stru_100008348);
  }
  v0 = (void *)qword_10000CD28;
  return v0;
}

void sub_1000033EC(id a1)
{
  qword_10000CD28 = (uint64_t)os_log_create("com.apple.mobileassetd", "Debug");
  _objc_release_x1();
}

void _MobileAssetLog(uint64_t a1, int a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11 = a4;
  if (byte_10000CD38 | byte_10000CD39)
  {
    *(void *)buf = &a9;
    v12 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:v11 arguments:&a9];
    v13 = v12;
    v14 = @"Unable to allocate log message";
    if (v12) {
      v14 = v12;
    }
    v15 = v14;

    if (byte_10000CD38) {
      NSLog(@"%@", v15);
    }
    if (byte_10000CD39)
    {
      v16 = +[NSFileHandle fileHandleWithStandardOutput];
      v17 = [(__CFString *)v15 dataUsingEncoding:2];
      [v16 writeData:v17];

      v18 = +[NSFileHandle fileHandleWithStandardOutput];
      v19 = [@"\n" dataUsingEncoding:2];
      [v18 writeData:v19];
    }
  }
  if (!byte_10000CD3A)
  {
    if (a2 == 7)
    {
      v24 = logDebug();
      BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG);

      if (v25)
      {
        *(void *)buf = &a9;
        id v22 = [objc_alloc((Class)NSString) initWithFormat:v11 arguments:&a9];
        v23 = logDebug();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
          sub_100005058();
        }
        goto LABEL_21;
      }
    }
    else if (a2 == 3)
    {
      v20 = logError();
      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);

      if (v21)
      {
        *(void *)buf = &a9;
        id v22 = [objc_alloc((Class)NSString) initWithFormat:v11 arguments:&a9];
        v23 = logError();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          sub_100004FE0();
        }
LABEL_21:
      }
    }
    else
    {
      v26 = logInfo();
      BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);

      if (v27)
      {
        id v22 = [objc_alloc((Class)NSString) initWithFormat:v11 arguments:&a9];
        v23 = logInfo();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&buf[4] = a3;
          __int16 v29 = 2114;
          id v30 = v22;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}s: %{public}@", buf, 0x16u);
        }
        goto LABEL_21;
      }
    }
  }
}

void sub_100003924(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _MobileAssetLog(0, 6, (uint64_t)"-[MAManifestStorageService storeManifest:infoPlist:stage:completion:]_block_invoke", @"Storing manifest (stage = %i)", a5, a6, a7, a8, *(unsigned __int8 *)(a1 + 64));
  uint64_t v9 = [*(id *)(a1 + 32) storeManifest:*(void *)(a1 + 40) infoPlist:*(void *)(a1 + 48) stage:*(unsigned __int8 *)(a1 + 64)];
  id v14 = (id)v9;
  if (v9) {
    _MobileAssetLog(0, 3, (uint64_t)"-[MAManifestStorageService storeManifest:infoPlist:stage:completion:]_block_invoke", @"Store failed: %@", v10, v11, v12, v13, v9);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void sub_100003AB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _MobileAssetLog(0, 6, (uint64_t)"-[MAManifestStorageService commitStagedManifestsForSelectors:completion:]_block_invoke", @"Committing staged manifests", a5, a6, a7, a8, v14);
  uint64_t v9 = [*(id *)(a1 + 32) commitStagedManifestsForSelectors:*(void *)(a1 + 40)];
  id v15 = (id)v9;
  if (v9) {
    _MobileAssetLog(0, 3, (uint64_t)"-[MAManifestStorageService commitStagedManifestsForSelectors:completion:]_block_invoke", @"Commit failed: %@", v10, v11, v12, v13, v9);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100003C54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _MobileAssetLog(0, 6, (uint64_t)"-[MAManifestStorageService invalidateManifestForAssetType:specifier:completion:]_block_invoke", @"Invalidating manifest for %@:%@", a5, a6, a7, a8, *(void *)(a1 + 32));
  uint64_t v9 = [*(id *)(a1 + 48) invalidateManifestForAssetType:*(void *)(a1 + 32) specifier:*(void *)(a1 + 40)];
  id v14 = (id)v9;
  if (v9) {
    _MobileAssetLog(0, 3, (uint64_t)"-[MAManifestStorageService invalidateManifestForAssetType:specifier:completion:]_block_invoke", @"Remove failed: %@", v10, v11, v12, v13, v9);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void sub_10000429C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1000042B0(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  *(_DWORD *)a5 = a4;
  if (!a4)
  {
    uint64_t v6 = +[NSData dataWithBytes:a2 length:a3];
    id v14 = 0;
    uint64_t v7 = +[NSPropertyListSerialization propertyListWithData:v6 options:0 format:0 error:&v14];
    id v8 = v14;
    uint64_t v9 = *(void **)(a5 + 8);
    *(void *)(a5 + 8) = v7;

    if (!*(void *)(a5 + 8))
    {
      _MobileAssetLog(0, 3, (uint64_t)"_plist_trust_callback", @"Failed to deserialize info plist: %@", v10, v11, v12, v13, (uint64_t)v8);
      *(_DWORD *)a5 = 79;
    }
  }
}

void sub_100004930(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
}

void sub_100004FE0()
{
  sub_100003740();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%{public}s: %{public}@", v1, 0x16u);
}

void sub_100005058()
{
  sub_100003740();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%{public}s: %{public}@", v1, 0x16u);
}

void NSLog(NSString *format, ...)
{
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

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void free(void *a1)
{
}

uint64_t image4_environment_destroy()
{
  return _image4_environment_destroy();
}

uint64_t image4_environment_flash()
{
  return _image4_environment_flash();
}

uint64_t image4_environment_new()
{
  return _image4_environment_new();
}

uint64_t image4_trust_destroy()
{
  return _image4_trust_destroy();
}

uint64_t image4_trust_evaluate()
{
  return _image4_trust_evaluate();
}

uint64_t image4_trust_new()
{
  return _image4_trust_new();
}

uint64_t image4_trust_set_payload()
{
  return _image4_trust_set_payload();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
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

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath(pid, buffer, buffersize);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int renamex_np(const char *a1, const char *a2, unsigned int a3)
{
  return _renamex_np(a1, a2, a3);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

id objc_msgSend__loadTypes(void *a1, const char *a2, ...)
{
  return [a1 _loadTypes];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_effectiveUserIdentifier(void *a1, const char *a2, ...)
{
  return [a1 effectiveUserIdentifier];
}

id objc_msgSend_fileHandleWithStandardOutput(void *a1, const char *a2, ...)
{
  return [a1 fileHandleWithStandardOutput];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_repositoryPath(void *a1, const char *a2, ...)
{
  return [a1 repositoryPath];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_types(void *a1, const char *a2, ...)
{
  return [a1 types];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:options:error:");
}