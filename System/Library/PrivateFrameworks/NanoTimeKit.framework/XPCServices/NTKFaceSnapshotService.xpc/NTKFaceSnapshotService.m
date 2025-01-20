void sub_10000202C(id a1)
{
  NSObject *v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *v4;
  uint64_t vars8;

  v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_UTILITY, 0);
  v2 = dispatch_queue_create("com.apple.nanotimekit.snapshot.connections", v1);
  v3 = (void *)qword_100008838;
  qword_100008838 = (uint64_t)v2;
}

int main(int argc, const char **argv, const char **envp)
{
  objc_opt_class();
  v4 = +[NSNotificationCenter defaultCenter];
  v5 = +[NSOperationQueue mainQueue];
  id v6 = [v4 addObserverForName:NSCurrentLocaleDidChangeNotification object:0 queue:v5 usingBlock:&stru_1000042C8];

  v7 = objc_opt_new();
  v8 = +[NSXPCListener serviceListener];
  [v8 setDelegate:v7];
  [v8 resume];
  v9 = +[NSRunLoop mainRunLoop];
  [v9 run];

  return 0;
}

void sub_100002260(id a1, NSNotification *a2)
{
  v2 = a2;
  v3 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Aborting due to locale change…", v4, 2u);
  }

  exit(1);
}

void sub_100002324(id a1)
{
  qword_100008848 = (uint64_t)objc_alloc_init((Class)NTKFaceSnapshotter);
  _objc_release_x1();
}

void sub_1000028B8(uint64_t a1)
{
  +[NTKFaceSnapshotService _prepareForSnapshot];
  v2 = +[NTKFaceSnapshotService sharedSnapshotter];
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000029A0;
  v5[3] = &unk_100004338;
  id v6 = v3;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  [v2 provideSnapshotOfFace:v6 options:v4 completion:v5];
}

void sub_1000029A0(id *a1, char a2, void *a3)
{
  id v5 = a3;
  +[NTKFaceSnapshotService _purgeSnapshotCausedCachedData];
  dispatch_time_t v6 = dispatch_time(0, 50000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002AA8;
  block[3] = &unk_100004310;
  id v10 = a1[4];
  id v11 = a1[5];
  id v7 = a1[6];
  char v14 = a2;
  id v12 = v5;
  id v13 = v7;
  id v8 = v5;
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_100002AA8(uint64_t a1)
{
  v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = [*(id *)(a1 + 32) name];
    uint64_t v4 = [*(id *)(a1 + 32) configuration];
    int v6 = 138543618;
    id v7 = v3;
    __int16 v8 = 2114;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Finished snapshot request for %{public}@ - %{public}@", (uint8_t *)&v6, 0x16u);
  }
  [*(id *)(a1 + 40) logCurrentInterval];
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 48));
  }
  return result;
}

void sub_100002BB8(uint64_t a1)
{
  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  uint64_t v3 = +[NTKCompanionComplicationCollectionManager sharedComplicationCollectionForDevice:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = v3;

  int v6 = *(void **)(*(void *)(a1 + 32) + 8);
  if (v6)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100002D48;
    v13[3] = &unk_100004388;
    char v14 = v2;
    [v6 performAfterLoad:v13];
  }
  else
  {
    dispatch_group_leave(v2);
  }
  dispatch_group_enter(v2);
  uint64_t v7 = +[NTKCompanionWidgetComplicationManager instanceForDevice:*(void *)(a1 + 40)];
  uint64_t v8 = *(void *)(a1 + 32);
  v9 = *(void **)(v8 + 16);
  *(void *)(v8 + 16) = v7;

  id v10 = *(void **)(*(void *)(a1 + 32) + 16);
  if (v10)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100002D50;
    v11[3] = &unk_100004388;
    id v12 = v2;
    [v10 performAfterLoad:v11];
  }
  else
  {
    dispatch_group_leave(v2);
  }
  dispatch_group_notify(v2, (dispatch_queue_t)&_dispatch_main_q, *(dispatch_block_t *)(a1 + 48));
}

void sub_100002D48(uint64_t a1)
{
}

void sub_100002D50(uint64_t a1)
{
}

void sub_100002D9C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  id v5 = "-[NTKFaceSnapshotService provideSnapshotOfFaceInstanceDescriptor:options:completion:]";
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Exiting early, no completion given for snapshotting face %@ %s", (uint8_t *)&v2, 0x16u);
}

void sub_100002E28(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Warning: face's device is nil, Face: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t CTFontRemoveFromCaches()
{
  return _CTFontRemoveFromCaches();
}

id MTLCreateSystemDefaultDevice(void)
{
  return _MTLCreateSystemDefaultDevice();
}

uint64_t _NTKLoggingObjectForDomain()
{
  return __NTKLoggingObjectForDomain();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__clearAllCachedImagesAndAssets(void *a1, const char *a2, ...)
{
  return [a1 _clearAllCachedImagesAndAssets];
}

id objc_msgSend__evictAllItemsFromFontAndFontDescriptorCaches(void *a1, const char *a2, ...)
{
  return [a1 _evictAllItemsFromFontAndFontDescriptorCaches];
}

id objc_msgSend__prepareForSnapshot(void *a1, const char *a2, ...)
{
  return [a1 _prepareForSnapshot];
}

id objc_msgSend__purgeDevice(void *a1, const char *a2, ...)
{
  return [a1 _purgeDevice];
}

id objc_msgSend__purgeSnapshotCausedCachedData(void *a1, const char *a2, ...)
{
  return [a1 _purgeSnapshotCausedCachedData];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_isLocked(void *a1, const char *a2, ...)
{
  return [a1 isLocked];
}

id objc_msgSend_logCurrentInterval(void *a1, const char *a2, ...)
{
  return [a1 logCurrentInterval];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_sharedQueue(void *a1, const char *a2, ...)
{
  return [a1 sharedQueue];
}

id objc_msgSend_sharedSnapshotter(void *a1, const char *a2, ...)
{
  return [a1 sharedSnapshotter];
}

id objc_msgSend_unlockedSinceBoot(void *a1, const char *a2, ...)
{
  return [a1 unlockedSinceBoot];
}