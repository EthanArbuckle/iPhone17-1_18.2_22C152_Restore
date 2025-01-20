void sub_4ED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_4EF4(uint64_t a1, void *a2)
{
  id v15 = a2;
  v3 = [v15 applicationType];
  if ([v3 isEqualToString:@"System"])
  {
  }
  else
  {
    v4 = [v15 applicationType];
    unsigned int v5 = [v4 isEqualToString:@"Internal"];

    v6 = v15;
    if (!v5) {
      goto LABEL_5;
    }
  }
  v7 = [v15 diskUsage];
  v8 = [v7 staticUsage];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) += [v8 unsignedLongLongValue];

  v6 = v15;
LABEL_5:
  v9 = [v6 diskUsage];
  v10 = [v9 dynamicUsage];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) += [v10 unsignedLongLongValue];

  v11 = [v15 dataContainerURL];
  v12 = [v11 path];
  v13 = [v12 stringByAppendingString:@"/Library/Caches/"];

  if (v13) {
    uint64_t v14 = ATGetDiskUsageForPath();
  }
  else {
    uint64_t v14 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) += v14;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 32);
}

void sub_54CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

uint64_t sub_5514(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_5524(uint64_t a1)
{
}

void sub_552C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (a3)
  {
    v6 = [a3 description];
    v7 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138543362;
      v12 = v6;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "failed to get cloud document usage. err=%{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void *sub_5624(void *a1)
{
  v5[0] = 0;
  if (!qword_CA70)
  {
    v5[1] = _NSConcreteStackBlock;
    v5[2] = (void *)3221225472;
    v5[3] = sub_57A8;
    v5[4] = &unk_82C0;
    v5[5] = v5;
    long long v6 = off_82A8;
    uint64_t v7 = 0;
    qword_CA70 = _sl_dlopen();
  }
  v2 = (void *)qword_CA70;
  if (!qword_CA70)
  {
    a1 = +[NSAssertionHandler currentHandler];
    v2 = +[NSString stringWithUTF8String:"void *CloudDocsLibrary(void)"];
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v2, @"UserDataClient.m", 19, @"%s", v5[0]);

    __break(1u);
    goto LABEL_7;
  }
  v3 = v5[0];
  if (v5[0]) {
LABEL_7:
  }
    free(v3);
  result = dlsym(v2, "BRGetTotalApplicationDocumentUsage");
  *(void *)(*(void *)(a1[4] + 8) + 24) = result;
  off_CA68 = *(_UNKNOWN **)(*(void *)(a1[4] + 8) + 24);
  return result;
}

uint64_t sub_57A8()
{
  uint64_t result = _sl_dlopen();
  qword_CA70 = result;
  return result;
}

void sub_5F0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a50, 8);
  _Block_object_dispose(&a57, 8);
  _Block_object_dispose(&a64, 8);
  _Block_object_dispose((const void *)(v64 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_5F58(uint64_t a1)
{
  [*(id *)(a1 + 32) _fileUsageMetrics];
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  *(_OWORD *)(v2 + 32) = v3;
  *(void *)(v2 + 48) = v4;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_5FAC(uint64_t a1)
{
  [*(id *)(a1 + 32) _iCloudUsageMetrics];
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  *(_OWORD *)(v2 + 32) = v3;
  *(void *)(v2 + 48) = v4;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_6000(uint64_t a1)
{
  [*(id *)(a1 + 32) _appUsageMetricsUsingCacheDeleteData:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(*(void *)(a1 + 56) + 8);
  *(_OWORD *)(v2 + 32) = v3;
  *(void *)(v2 + 48) = v4;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_6058(uint64_t a1)
{
  [*(id *)(a1 + 32) _cacheDeleteUsageMetricsUsingCacheDeleteData:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(*(void *)(a1 + 56) + 8);
  *(_OWORD *)(v2 + 32) = v3;
  *(void *)(v2 + 48) = v4;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t ATGetDiskUsageForPath()
{
  return _ATGetDiskUsageForPath();
}

uint64_t ATGetPhysicalSizeForLogicalSize()
{
  return _ATGetPhysicalSizeForLogicalSize();
}

uint64_t ATGetUsageForPath()
{
  return _ATGetUsageForPath();
}

uint64_t CacheDeleteCopyItemizedPurgeableSpaceWithInfo()
{
  return _CacheDeleteCopyItemizedPurgeableSpaceWithInfo();
}

uint64_t _ATLogCategorySyncBundle()
{
  return __ATLogCategorySyncBundle();
}

uint64_t _ATLogCategorySyncBundle_Oversize()
{
  return __ATLogCategorySyncBundle_Oversize();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
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

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void free(void *a1)
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__fileUsageMetrics(void *a1, const char *a2, ...)
{
  return [a1 _fileUsageMetrics];
}

id objc_msgSend__iCloudUsageMetrics(void *a1, const char *a2, ...)
{
  return [a1 _iCloudUsageMetrics];
}

id objc_msgSend_applicationType(void *a1, const char *a2, ...)
{
  return [a1 applicationType];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentThread(void *a1, const char *a2, ...)
{
  return [a1 currentThread];
}

id objc_msgSend_dataContainerURL(void *a1, const char *a2, ...)
{
  return [a1 dataContainerURL];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_diskUsage(void *a1, const char *a2, ...)
{
  return [a1 diskUsage];
}

id objc_msgSend_dynamicUsage(void *a1, const char *a2, ...)
{
  return [a1 dynamicUsage];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_qualityOfService(void *a1, const char *a2, ...)
{
  return [a1 qualityOfService];
}

id objc_msgSend_staticUsage(void *a1, const char *a2, ...)
{
  return [a1 staticUsage];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}