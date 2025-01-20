void sub_2234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2268(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_2278(uint64_t a1)
{
}

void sub_2280(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    id v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v3, "count"));
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v3;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "path", (void)v15);
        v14 = +[ATAsset downloadAssetWithIdentifier:v13 dataclass:@"File" prettyName:v13];
        [v14 setPath:v13];
        [v14 setIsRestore:1];
        objc_msgSend(v14, "setPriority:", objc_msgSend(v12, "priority"));
        [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v14];
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

void sub_24BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2960(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t MBGetDefaultLog()
{
  return _MBGetDefaultLog();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _MBLog()
{
  return __MBLog();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__initializeOutstandingAssets(void *a1, const char *a2, ...)
{
  return [a1 _initializeOutstandingAssets];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_outstandingAssets(void *a1, const char *a2, ...)
{
  return [a1 outstandingAssets];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return [a1 priority];
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPriority:");
}
2);
    goto LABEL_27;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    long long v17 = v8;
    long long v18 = 2112;
    v19 = v9;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_ERROR, "=atc-plugin= Failed to restore LocalStorage asset %@: %@", buf, 0x16u);
    _MBLog();
  }

  v14 = [v9 domain];
  if (![v14 isEqualToString:@"ATError"]
    || [v9 code] == (char *)&dword_4 + 3
    || [v9 code] == &dword_8
    || [v9 code] == (char *)&dword_C + 2
    || [v9 code] == &dword_10
    || [v9 code] == (char *)&dword_8 + 1
    || [v9 code] == (char *)&dword_10 + 2
    || [v9 code] == &dword_4
    || [v9 code] == (char *)&dword_10 + 3
    || [v9 code] == &dword_14
    || [v9 code] == (char *)&dword_18 + 1
    || [v9 code] == (char *)&dword_18 + 3
    || [v9 code] == &dword_18
    || [v9 code] == (char *)&dword_1C + 3
    || [v9 code] == &stru_20
    || [v9 code] == (char *)&stru_20.cmd + 1
    || [v9 code] == (char *)&stru_20.cmd + 2)
  {
  }
  else
  {
    long long v15 = [v9 code] == (char *)&stru_20.cmd + 3;

    if (!v15)
    {
      v11 = MBGetDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v17 = v8;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "=atc-plugin= Unrecoverable error. Will not attempt to restore LocalStorage asset %@", buf, 0xCu);
        _MBLog();
      }
      goto LABEL_4;
    }
  }
  MBGetDefaultLog();
  v12 = (MBATCPlugin *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v17 = v8;
    _os_log_impl(&dword_0, &v12->super, OS_LOG_TYPE_DEFAULT, "=atc-plugin= Potentially recoverable error. Will attempt to restore LocalStorage asset %@", buf, 0xCu);
    _MBLog();
  }
LABEL_27:
}

- (NSMutableArray)outstandingAssets
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setOutstandingAssets:(id)a3
{
}

- (void).cxx_destruct
{
}

@end