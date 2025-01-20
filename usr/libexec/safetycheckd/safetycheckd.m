uint64_t sub_1000024C0(uint64_t a1)
{
  uint64_t vars8;

  qword_100008470 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_100002758(uint64_t a1, xpc_object_t xdict)
{
  v3 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(xdict, _xpc_event_key_name)];
  v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) handleXPCEventWithName:v3];
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

uint64_t start()
{
  v1 = (void *)os_transaction_create();
  v2 = +[SCDaemon sharedDaemon];
  [v2 start];

  v3 = +[NSRunLoop mainRunLoop];
  [v3 run];

  return 0;
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
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

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_XPCListenerPairs(void *a1, const char *a2, ...)
{
  return [a1 XPCListenerPairs];
}

id objc_msgSend__listenersByEventName(void *a1, const char *a2, ...)
{
  return [a1 _listenersByEventName];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_backgroundSystemTasks(void *a1, const char *a2, ...)
{
  return [a1 backgroundSystemTasks];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_first(void *a1, const char *a2, ...)
{
  return [a1 first];
}

id objc_msgSend_interestedEvents(void *a1, const char *a2, ...)
{
  return [a1 interestedEvents];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_notifyDListeners(void *a1, const char *a2, ...)
{
  return [a1 notifyDListeners];
}

id objc_msgSend_registerXPCEventHandlers(void *a1, const char *a2, ...)
{
  return [a1 registerXPCEventHandlers];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_sharedDaemon(void *a1, const char *a2, ...)
{
  return [a1 sharedDaemon];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_tasks(void *a1, const char *a2, ...)
{
  return [a1 tasks];
}

id objc_msgSend_underlyingErrors(void *a1, const char *a2, ...)
{
  return [a1 underlyingErrors];
}

id objc_msgSend_wakeXPCListeners(void *a1, const char *a2, ...)
{
  return [a1 wakeXPCListeners];
}

id objc_msgSend_workQueue(void *a1, const char *a2, ...)
{
  return [a1 workQueue];
}