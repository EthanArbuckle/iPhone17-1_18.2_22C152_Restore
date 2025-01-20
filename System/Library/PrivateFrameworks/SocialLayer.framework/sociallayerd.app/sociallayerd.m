void sub_1000037E4(int a1)
{
  void block[4];
  int v2;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = nullsub_1;
  block[3] = &unk_100004100;
  v2 = a1;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_10000385C(id a1)
{
  v1 = dispatch_get_global_queue(0, 0);
  uint64_t v2 = 0;
  v3 = (id *)&unk_100008028;
  do
  {
    int v4 = dword_100003E68[v2];
    dispatch_source_t v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, v4, 0, v1);
    v6 = (void *)qword_100008068;
    qword_100008068 = (uint64_t)v5;

    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100003988;
    handler[3] = &unk_100004100;
    int v8 = v4;
    dispatch_source_set_event_handler((dispatch_source_t)qword_100008068, handler);
    objc_storeStrong(v3, (id)qword_100008068);
    dispatch_resume((dispatch_object_t)qword_100008068);
    signal(v4, (void (__cdecl *)(int))1);
    ++v2;
    ++v3;
  }
  while (v2 != 7);
}

void sub_100003988(uint64_t a1)
{
}

uint64_t start()
{
  if (qword_100008060 != -1) {
    dispatch_once(&qword_100008060, &stru_100004140);
  }
  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v2 = dispatch_queue_attr_make_with_qos_class(v1, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v3 = dispatch_queue_create("SLDCloudKitSync exterior", v2);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003AD4;
  block[3] = &unk_100004190;
  dispatch_queue_t v9 = v3;
  int v4 = v3;
  dispatch_async(v4, block);
  id v5 = objc_alloc_init((Class)SocialLayerDaemon);
  [v5 setupListeners];

  v6 = +[NSRunLoop currentRunLoop];
  [v6 run];

  return 0;
}

void sub_100003AD4(uint64_t a1)
{
  uint64_t v2 = +[SLDCloudKitSyncWriter sharedInstance];
  dispatch_queue_t v3 = *(NSObject **)(a1 + 32);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100003B80;
  handler[3] = &unk_100004168;
  id v6 = v2;
  id v4 = v2;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", v3, handler);
}

uint64_t sub_100003B80(uint64_t a1, xpc_object_t xdict)
{
  string = xpc_dictionary_get_string(xdict, _xpc_event_key_name);
  if (!strcmp(string, "com.apple.spotlight.SyndicatedContentDeleted")
    || (uint64_t result = strcmp(string, "com.apple.spotlight.SyndicatedContentRefreshed"), !result))
  {
    id v5 = *(void **)(a1 + 32);
    return (uint64_t)[v5 invalidateHighlights];
  }
  return result;
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
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

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_setupListeners(void *a1, const char *a2, ...)
{
  return [a1 setupListeners];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}