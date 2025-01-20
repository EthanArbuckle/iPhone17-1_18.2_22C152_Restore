uint64_t start()
{
  NSObject *v0;
  NSObject *v1;
  void *v2;
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  signal(15, (void (__cdecl *)(int))1);
  v0 = dispatch_get_global_queue(2, 0);
  v1 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v0);

  dispatch_source_set_event_handler(v1, &stru_100004120);
  dispatch_resume(v1);
  SULogInfo();
  +[SUUtility setIsDaemon:1];
  v3 = +[SUManagerServer sharedInstance];
  v4 = +[SUCoreDevice sharedDevice];
  v5 = [v4 isBootedOSSecureInternal];

  if (v5)
  {
    SULogInfo();
    v6 = +[SUCoreSimulate sharedSimulator];
    [v6 clearAllEventAlterations];

    v7 = +[SUCoreSimulate sharedSimulator];
    [v7 adoptAllEventAlterations:@"/var/MobileSoftwareUpdate/Controller/SoftwareUpdateCore/SUServices.simulations"];

    v8 = +[SUCoreSimulate sharedSimulator];
    [v8 dumpAllEventAlterations];
  }
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_100004160);
  v9 = +[SUCoreConfigServer sharedServerSettings];
  [v3 runUntilIdleExit];
  SULogInfo();

  return 0;
}

void sub_100003410(id a1)
{
}

void sub_100003430(id a1, OS_xpc_object *a2)
{
  v2 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(a2, _xpc_event_key_name)];
  SULogInfo();
  v3 = +[SUUtility mainWorkQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003514;
  block[3] = &unk_100004188;
  id v6 = v2;
  id v4 = v2;
  dispatch_async(v3, block);
}

void sub_100003514(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  SULogInfo();
  id v3 = +[SUScheduler sharedInstance];
  [v3 handleXPCEvent:*(void *)(a1 + 32)];
}

uint64_t SULogInfo()
{
  return _SULogInfo();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
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

void exit(int a1)
{
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_release(id a1)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_clearAllEventAlterations(void *a1, const char *a2, ...)
{
  return [a1 clearAllEventAlterations];
}

id objc_msgSend_dumpAllEventAlterations(void *a1, const char *a2, ...)
{
  return [a1 dumpAllEventAlterations];
}

id objc_msgSend_isBootedOSSecureInternal(void *a1, const char *a2, ...)
{
  return [a1 isBootedOSSecureInternal];
}

id objc_msgSend_mainWorkQueue(void *a1, const char *a2, ...)
{
  return [a1 mainWorkQueue];
}

id objc_msgSend_runUntilIdleExit(void *a1, const char *a2, ...)
{
  return [a1 runUntilIdleExit];
}

id objc_msgSend_sharedDevice(void *a1, const char *a2, ...)
{
  return [a1 sharedDevice];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedServerSettings(void *a1, const char *a2, ...)
{
  return [a1 sharedServerSettings];
}

id objc_msgSend_sharedSimulator(void *a1, const char *a2, ...)
{
  return [a1 sharedSimulator];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}