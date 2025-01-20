id sub_10000226C(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleCancel];
}

void sub_100002274(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 connection:*(void *)(a1 + 32) didRecieveData:*(void *)(a1 + 40)];
}

void sub_100002380(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 connection:*(void *)(a1 + 32) didCloseConnection:0];
}

id sub_100002674(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleConnection:a2];
}

uint64_t start()
{
  v1 = objc_alloc_init(MIDaemon);
  NSLog(@"mapinspectord is launched!");
  CFRunLoopRun();
  NSLog(@"mapinspectord is done!");

  return 0;
}

void sub_100002B34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100002B4C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100002B5C(uint64_t a1)
{
}

void sub_100002B64(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary)
  {
    if (lockdown_copy_checkin_info())
    {
      v4 = [[MIXPCConnection alloc] initWithXPCConnection:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
      (*(void (**)(void, void, MIXPCConnection *))(a1 + 48))(*(void *)(a1 + 32), *(void *)(a1 + 56), v4);
    }
    else
    {
      v4 = [[MILockdownConnection alloc] initWithLockdownInfo:0];
      (*(void (**)(void, void, MIXPCConnection *))(a1 + 48))(*(void *)(a1 + 32), *(void *)(a1 + 56), v4);
      xpc_connection_cancel(*(xpc_connection_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
      uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
      v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = 0;

      CFRelease(0);
    }
  }
}

id sub_100002D88(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleEvent:a2];
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

void CFRunLoopRun(void)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

void NSLog(NSString *format, ...)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCMessage()
{
  return __CFXPCCreateCFObjectFromXPCMessage();
}

uint64_t _CFXPCCreateXPCMessageWithCFObject()
{
  return __CFXPCCreateXPCMessageWithCFObject();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

uint64_t lockdown_copy_checkin_info()
{
  return _lockdown_copy_checkin_info();
}

uint64_t lockdown_disconnect()
{
  return _lockdown_disconnect();
}

uint64_t lockdown_receive_message()
{
  return _lockdown_receive_message();
}

uint64_t lockdown_send_message()
{
  return _lockdown_send_message();
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

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

uint64_t secure_lockdown_checkin()
{
  return _secure_lockdown_checkin();
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

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentThread(void *a1, const char *a2, ...)
{
  return [a1 currentThread];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_handleCancel(void *a1, const char *a2, ...)
{
  return [a1 handleCancel];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}