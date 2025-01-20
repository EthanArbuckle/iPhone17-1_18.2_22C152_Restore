void sub_100004A48(uint64_t a1, xpc_activity_t activity)
{
  NSObject *v3;
  void block[5];

  if (xpc_activity_get_state(activity) == 2)
  {
    v3 = [*(id *)(a1 + 32) queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100004AE8;
    block[3] = &unk_10000C4A0;
    block[4] = *(void *)(a1 + 32);
    dispatch_sync(v3, block);
  }
}

id sub_100004AE8(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "poking gizmo now", v3, 2u);
  }
  return [*(id *)(a1 + 32) _sendMessage:&off_10000C9F8 to:IDSDefaultPairedDevice identifier:0 expectReply:0];
}

void sub_100004EC4(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) queue];
  dispatch_source_t v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_data_or, 0, 0, v2);
  v4 = (void *)qword_100011800;
  qword_100011800 = (uint64_t)v3;

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100004FE4;
  handler[3] = &unk_10000C4A0;
  handler[4] = *(void *)(a1 + 32);
  dispatch_source_set_event_handler((dispatch_source_t)qword_100011800, handler);
  dispatch_activate((dispatch_object_t)qword_100011800);
}

id sub_100004F90(uint64_t a1)
{
  [*(id *)(a1 + 32) stopWaitingForDeviceUnlock];
  v2 = *(void **)(a1 + 32);

  return [v2 deviceUnlockTimedOut];
}

id sub_100004FCC(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendReplyToPacket];
}

void sub_100004FD4(id a1, int a2)
{
}

id sub_100004FE4(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendReplyToPacket];
}

void sub_100005144(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) session];

  if (v2)
  {
    id v5 = +[NSError errorWithDomain:@"com.apple.security.otpaird" code:8 description:@"pairing session timed out"];
    dispatch_source_t v3 = *(void **)(a1 + 32);
    v4 = [v3 session];
    [v3 session:v4 didCompleteWithSuccess:0 error:v5];
  }
}

void sub_100005B9C(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  v9 = [*(id *)(a1 + 32) queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005C98;
  block[3] = &unk_10000C450;
  char v18 = a2;
  id v14 = v7;
  id v15 = v8;
  v10 = *(void **)(a1 + 40);
  uint64_t v16 = *(void *)(a1 + 32);
  id v17 = v10;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(v9, block);
}

void sub_100005C98(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = *(unsigned __int8 *)(a1 + 64);
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 67109634;
    int v27 = v2;
    __int16 v28 = 2112;
    uint64_t v29 = v3;
    __int16 v30 = 2112;
    uint64_t v31 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "exchangePacket: complete=%d responsePacket=%@ channelError=%@", buf, 0x1Cu);
  }
  id v5 = [*(id *)(a1 + 48) session];

  if (v5)
  {
    if (*(void *)(a1 + 40))
    {
      id v6 = objc_alloc_init((Class)NSMutableDictionary);
      [v6 setObject:&off_10000C9A0 forKeyedSubscript:@"m"];
      id v7 = [*(id *)(a1 + 48) session];
      id v8 = [v7 identifier];
      [v6 setObject:v8 forKeyedSubscript:@"session"];

      v9 = [*(id *)(a1 + 40) description];
      [v6 setObject:v9 forKeyedSubscript:@"error"];

      v10 = *(void **)(a1 + 56);
      if (!v10)
      {
        _os_assert_log();
        _os_crash();
        __break(1u);
      }
      id v11 = [v10 fromID];
      id v12 = [*(id *)(a1 + 56) outgoingResponseIdentifier];
      [*(id *)(a1 + 48) _sendMessage:v6 to:v11 identifier:v12];
      v13 = *(void **)(a1 + 48);
      id v14 = [v13 session];
      id v15 = +[NSError errorWithDomain:@"com.apple.security.otpaird" code:7 description:@"exchangePacket" underlying:*(void *)(a1 + 40)];
      [v13 session:v14 didCompleteWithSuccess:0 error:v15];

      goto LABEL_21;
    }
    if (*(void *)(a1 + 32))
    {
      v25[0] = &off_10000C9B8;
      uint64_t v16 = [*(id *)(a1 + 48) session:@"m" session:@"session"];
      id v17 = [v16 identifier];
      v24[2] = @"packet";
      uint64_t v18 = *(void *)(a1 + 32);
      v25[1] = v17;
      v25[2] = v18;
      v19 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:3];

      v20 = *(void **)(a1 + 56);
      if (v20)
      {
        id v21 = [v20 fromID];
      }
      else
      {
        id v21 = IDSDefaultPairedDevice;
      }
      id v11 = v21;
      v22 = *(void **)(a1 + 56);
      if (v22)
      {
        id v12 = [v22 outgoingResponseIdentifier];
      }
      else
      {
        id v12 = 0;
      }
      [*(id *)(a1 + 48) _sendMessage:v19 to:v11 identifier:v12];
    }
    else
    {
      id v12 = 0;
      id v11 = 0;
    }
    if (*(unsigned char *)(a1 + 64))
    {
      v23 = *(void **)(a1 + 48);
      id v6 = [v23 session];
      [v23 session:v6 didCompleteWithSuccess:1 error:0];
LABEL_21:
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "pairing session went away, dropping exchangePacket response", buf, 2u);
    }
    id v12 = 0;
    id v11 = 0;
  }
}

void sub_1000064C0(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) session];

  if (v2)
  {
    id v9 = [*(id *)(a1 + 32) session];
    [v9 addCompletionHandler:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v3 = [OTPairingSession alloc];
    id v4 = [*(id *)(a1 + 32) initiator];
    id v5 = [*(id *)(a1 + 32) deviceInfo];
    id v6 = [(OTPairingSession *)v3 initAsInitiator:v4 deviceInfo:v5 identifier:0];
    [*(id *)(a1 + 32) setSession:v6];

    [*(id *)(a1 + 32) scheduleSessionTimeout];
    id v7 = [*(id *)(a1 + 32) session];
    [v7 addCompletionHandler:*(void *)(a1 + 40)];

    id v8 = *(void **)(a1 + 32);
    [v8 sendReplyToPacket];
  }
}

void sub_100006894(id a1)
{
  qword_1000117F0 = [[OTPairingService alloc] initAsInitiator:0];

  _objc_release_x1();
}

void start()
{
  uint64_t v1 = +[OTPairingService sharedService];
  int v2 = (void *)qword_100011808;
  qword_100011808 = v1;

  dispatch_main();
}

void sub_100006B00(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = secLogObjForScope();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Notified that the device name has changed", v6, 2u);
  }

  id v5 = [a3 deviceNameUpdateListeners];
  [v5 iterateListeners:&stru_10000C588];
}

void sub_100006B94(id a1, OTDeviceInformationNameUpdateListener *a2)
{
}

void sub_100006EF8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100006FA8(id a1)
{
  memset(&__b, 170, sizeof(__b));
  uname(&__b);
  uint64_t v1 = +[NSString stringWithCString:__b.machine encoding:4];
  int v2 = (void *)qword_100011810;
  qword_100011810 = v1;
}

void sub_10000773C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_100007758(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100007938(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100007A2C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t MGCopyAnswerWithError()
{
  return _MGCopyAnswerWithError();
}

uint64_t MKBDeviceLockAssertion()
{
  return _MKBDeviceLockAssertion();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

CFStringRef SCDynamicStoreCopyComputerName(SCDynamicStoreRef store, CFStringEncoding *nameEncoding)
{
  return _SCDynamicStoreCopyComputerName(store, nameEncoding);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return _SCDynamicStoreCreate(allocator, name, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateComputerName(CFAllocatorRef allocator)
{
  return _SCDynamicStoreKeyCreateComputerName(allocator);
}

Boolean SCDynamicStoreSetDispatchQueue(SCDynamicStoreRef store, dispatch_queue_t queue)
{
  return _SCDynamicStoreSetDispatchQueue(store, queue);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return _SCDynamicStoreSetNotificationKeys(store, keys, patterns);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_assert_log()
{
  return __os_assert_log();
}

uint64_t _os_assumes_log()
{
  return __os_assumes_log();
}

uint64_t _os_crash()
{
  return __os_crash();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return _os_variant_allows_internal_security_policies();
}

uint64_t secLogObjForScope()
{
  return _secLogObjForScope();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

int uname(utsname *a1)
{
  return _uname(a1);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
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

id objc_msgSend_acquireLockAssertion(void *a1, const char *a2, ...)
{
  return [a1 acquireLockAssertion];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_channel(void *a1, const char *a2, ...)
{
  return [a1 channel];
}

id objc_msgSend_completionHandlers(void *a1, const char *a2, ...)
{
  return [a1 completionHandlers];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_deviceInfo(void *a1, const char *a2, ...)
{
  return [a1 deviceInfo];
}

id objc_msgSend_deviceNameUpdateListeners(void *a1, const char *a2, ...)
{
  return [a1 deviceNameUpdateListeners];
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return [a1 devices];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_fromID(void *a1, const char *a2, ...)
{
  return [a1 fromID];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_incomingResponseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 incomingResponseIdentifier];
}

id objc_msgSend_initiator(void *a1, const char *a2, ...)
{
  return [a1 initiator];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_isDefaultPairedDevice(void *a1, const char *a2, ...)
{
  return [a1 isDefaultPairedDevice];
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return [a1 keyEnumerator];
}

id objc_msgSend_listeners(void *a1, const char *a2, ...)
{
  return [a1 listeners];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return [a1 message];
}

id objc_msgSend_messageType(void *a1, const char *a2, ...)
{
  return [a1 messageType];
}

id objc_msgSend_modelID(void *a1, const char *a2, ...)
{
  return [a1 modelID];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_notifyToken(void *a1, const char *a2, ...)
{
  return [a1 notifyToken];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 objectEnumerator];
}

id objc_msgSend_operatingSystemVersionString(void *a1, const char *a2, ...)
{
  return [a1 operatingSystemVersionString];
}

id objc_msgSend_osVersion(void *a1, const char *a2, ...)
{
  return [a1 osVersion];
}

id objc_msgSend_outgoingResponseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 outgoingResponseIdentifier];
}

id objc_msgSend_overriddenMachineID(void *a1, const char *a2, ...)
{
  return [a1 overriddenMachineID];
}

id objc_msgSend_packet(void *a1, const char *a2, ...)
{
  return [a1 packet];
}

id objc_msgSend_packetData(void *a1, const char *a2, ...)
{
  return [a1 packetData];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_scheduleGizmoPoke(void *a1, const char *a2, ...)
{
  return [a1 scheduleGizmoPoke];
}

id objc_msgSend_scheduleSessionTimeout(void *a1, const char *a2, ...)
{
  return [a1 scheduleSessionTimeout];
}

id objc_msgSend_sendReplyToPacket(void *a1, const char *a2, ...)
{
  return [a1 sendReplyToPacket];
}

id objc_msgSend_sentMessageIdentifier(void *a1, const char *a2, ...)
{
  return [a1 sentMessageIdentifier];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return [a1 service];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return [a1 session];
}

id objc_msgSend_sessionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 sessionIdentifier];
}

id objc_msgSend_sessionTimer(void *a1, const char *a2, ...)
{
  return [a1 sessionTimer];
}

id objc_msgSend_setupDeviceNameListener(void *a1, const char *a2, ...)
{
  return [a1 setupDeviceNameListener];
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return [a1 sharedService];
}

id objc_msgSend_stopWaitingForDeviceUnlock(void *a1, const char *a2, ...)
{
  return [a1 stopWaitingForDeviceUnlock];
}

id objc_msgSend_store(void *a1, const char *a2, ...)
{
  return [a1 store];
}

id objc_msgSend_strongToWeakObjectsMapTable(void *a1, const char *a2, ...)
{
  return [a1 strongToWeakObjectsMapTable];
}

id objc_msgSend_uniqueIDOverride(void *a1, const char *a2, ...)
{
  return [a1 uniqueIDOverride];
}

id objc_msgSend_unlockTimer(void *a1, const char *a2, ...)
{
  return [a1 unlockTimer];
}