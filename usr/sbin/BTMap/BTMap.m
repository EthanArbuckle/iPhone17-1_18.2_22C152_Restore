id sub_1000019CC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleEvent:a2];
}

void sub_1000019D8()
{
  v0 = qword_10000D088;
  if (os_log_type_enabled((os_log_t)qword_10000D088, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "Language did change, exiting", v1, 2u);
  }
  exit(1);
}

id sub_100002170(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleEvent:a2];
}

void sub_100002238(id a1)
{
  v1 = +[NSValue valueWithPointer:&_xpc_type_BOOL];
  v7[0] = v1;
  v8[0] = &stru_1000084B0;
  v2 = +[NSValue valueWithPointer:&_xpc_type_int64];
  v7[1] = v2;
  v8[1] = &stru_1000084D0;
  v3 = +[NSValue valueWithPointer:&_xpc_type_uint64];
  v7[2] = v3;
  v8[2] = &stru_1000084F0;
  v4 = +[NSValue valueWithPointer:&_xpc_type_double];
  v7[3] = v4;
  v8[3] = &stru_100008510;
  uint64_t v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:4];
  v6 = (void *)qword_10000D050;
  qword_10000D050 = v5;
}

NSNumber *__cdecl sub_100002370(id a1, OS_xpc_object *a2)
{
  BOOL value = xpc_BOOL_get_value(a2);

  return +[NSNumber numberWithBool:value];
}

NSNumber *__cdecl sub_1000023B4(id a1, OS_xpc_object *a2)
{
  int64_t value = xpc_int64_get_value(a2);

  return +[NSNumber numberWithLongLong:value];
}

NSNumber *__cdecl sub_1000023F8(id a1, OS_xpc_object *a2)
{
  uint64_t value = xpc_uint64_get_value(a2);

  return +[NSNumber numberWithUnsignedLongLong:value];
}

NSNumber *__cdecl sub_10000243C(id a1, OS_xpc_object *a2)
{
  double value = xpc_double_get_value(a2);

  return +[NSNumber numberWithDouble:value];
}

void sub_100002520(id a1)
{
  v1 = +[NSValue valueWithPointer:&_xpc_type_string];
  v4 = v1;
  uint64_t v5 = &stru_100008570;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  v3 = (void *)qword_10000D060;
  qword_10000D060 = v2;
}

NSString *__cdecl sub_1000025C8(id a1, OS_xpc_object *a2)
{
  string_ptr = xpc_string_get_string_ptr(a2);

  return +[NSString stringWithUTF8String:string_ptr];
}

void sub_1000026B0(id a1)
{
  v1 = +[NSValue valueWithPointer:&_xpc_type_dictionary];
  v4 = v1;
  uint64_t v5 = &stru_1000085D0;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  v3 = (void *)qword_10000D070;
  qword_10000D070 = v2;
}

OS_xpc_object *__cdecl sub_100002758(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;

  return v2;
}

void sub_100002BA8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_100002BC8()
{
  return v0;
}

uint64_t sub_100002BD4(char *category)
{
  qword_10000D088 = (uint64_t)os_log_create("com.apple.bluetooth", category);

  return _objc_release_x1();
}

void sub_100002CA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100002D0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

id sub_100002EB4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _timerEvent];
}

id sub_100002EBC(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTimer:0];
}

void sub_100002FA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

uint64_t start()
{
  sub_100002BD4("BTMap");
  uint64_t v0 = [[BTXpcService alloc] initWithName:"com.apple.BTServer.map" sessionClass:objc_opt_class()];
  if (v0)
  {
    v1 = +[NSRunLoop currentRunLoop];
    [v1 run];
  }
  return 1;
}

void sub_1000039BC(id a1, NSArray *a2)
{
}

void sub_100003C3C(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = qword_10000D088;
  if (os_log_type_enabled((os_log_t)qword_10000D088, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Adding guid %@ to pending send list", buf, 0xCu);
  }
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 32) pendingSendGuids];
  [v5 addObject:v3];

  v17[0] = @"kMessageGUID";
  v17[1] = @"kBody";
  uint64_t v6 = *(void *)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  v18[0] = v3;
  v18[1] = v6;
  v17[2] = @"kRecipientPhoneNumber";
  v8 = v7;
  if (!v7)
  {
    v8 = +[NSNull null];
  }
  v18[2] = v8;
  v17[3] = @"kRecipientEmail";
  v9 = *(void **)(a1 + 56);
  uint64_t v10 = v9;
  if (!v9)
  {
    uint64_t v10 = +[NSNull null];
  }
  v18[3] = v10;
  v17[4] = @"kDate";
  v11 = +[NSDate date];
  v18[4] = v11;
  v12 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:5];

  if (!v9)
  {

    if (v7) {
      goto LABEL_9;
    }
LABEL_11:

    goto LABEL_9;
  }
  if (!v7) {
    goto LABEL_11;
  }
LABEL_9:
  v13 = +[NSMutableArray array];
  [v13 addObject:v12];
  CFStringRef v15 = @"kMessagesInfo";
  v16 = v13;
  v14 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  [*(id *)(a1 + 32) sendMsg:@"kPendingSendMessage" args:v14];
}

void sub_100003F0C(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[NSMutableArray array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v3 reverseObjectEnumerator];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(a1 + 32) serializeIMSPIMessage:*(void *)(*((void *)&v12 + 1) + 8 * (void)v9)];
        [v4 addObject:v10];

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v7);
  }

  CFStringRef v16 = @"kMessagesInfo";
  v17 = v4;
  v11 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  [*(id *)(a1 + 32) sendReplyToMsg:*(void *)(a1 + 40) status:1 args:v11];
}

void sub_100004DA4(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Failed to create XPC server", v1, 2u);
}

void sub_100004DE8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "XPC server error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100004E60(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unexpected XPC server event: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100004ED8(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "XPC connection does not have the proper entitlement, cancelling", v1, 2u);
}

void sub_100004F1C(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Ignoring request to add ellipsis as there is insufficient space. bufferMaxLength = %lu", (uint8_t *)&v2, 0xCu);
}

void sub_100004F94(char a1, void *a2)
{
  if (a1) {
    CFStringRef v3 = @"reply";
  }
  else {
    CFStringRef v3 = @"message";
  }
  id v4 = a2;
  uint64_t v5 = [(id)sub_100002BC8() description];
  int v6 = 138412546;
  CFStringRef v7 = v3;
  __int16 v8 = 2112;
  v9 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Sending XPC %@: %@", (uint8_t *)&v6, 0x16u);
}

void sub_100005064(void *a1)
{
  id v2 = a1;
  CFStringRef v3 = [(id)sub_100002BC8() description];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "Received XPC message: %@", (uint8_t *)&v4, 0xCu);
}

void sub_100005108(void *a1)
{
  id v2 = a1;
  CFStringRef v3 = [(id)sub_100002BC8() description];
  sub_100002BA8((void *)&_mh_execute_header, v4, v5, "XPC connection error: %@", v6, v7, v8, v9, 2u);
}

void sub_10000519C(void *a1)
{
  id v2 = a1;
  CFStringRef v3 = [(id)sub_100002BC8() description];
  sub_100002BA8((void *)&_mh_execute_header, v4, v5, "Unexpected XPC connection event: %@", v6, v7, v8, v9, 2u);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

uint64_t IMSPIMessageSummary()
{
  return _IMSPIMessageSummary();
}

uint64_t IMSPIQueryMessageWithGUID()
{
  return _IMSPIQueryMessageWithGUID();
}

uint64_t IMSPIQueryMessages()
{
  return _IMSPIQueryMessages();
}

uint64_t IMSPISendMessageWithAttachmentsReturningGUID()
{
  return _IMSPISendMessageWithAttachmentsReturningGUID();
}

uint64_t WriteStackshotReportWithPID()
{
  return _WriteStackshotReportWithPID();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return __CFXPCCreateXPCObjectFromCFObject();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

void bzero(void *a1, size_t a2)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

pid_t getpid(void)
{
  return _getpid();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return _xpc_connection_copy_entitlement_value();
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

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  return _xpc_double_get_value(xdouble);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return _xpc_int64_get_value(xint);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return _xpc_string_get_string_ptr(xstring);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return _xpc_uint64_get_value(xuint);
}

id objc_msgSend_ID(void *a1, const char *a2, ...)
{
  return [a1 ID];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__imMessageItem(void *a1, const char *a2, ...)
{
  return [a1 _imMessageItem];
}

id objc_msgSend__startTimer(void *a1, const char *a2, ...)
{
  return [a1 _startTimer];
}

id objc_msgSend__stopTimer(void *a1, const char *a2, ...)
{
  return [a1 _stopTimer];
}

id objc_msgSend__timeout(void *a1, const char *a2, ...)
{
  return [a1 _timeout];
}

id objc_msgSend_accountTypeName(void *a1, const char *a2, ...)
{
  return [a1 accountTypeName];
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return [a1 address];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_beginTransaction(void *a1, const char *a2, ...)
{
  return [a1 beginTransaction];
}

id objc_msgSend_blockUntilConnected(void *a1, const char *a2, ...)
{
  return [a1 blockUntilConnected];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_disconnectFromDaemon(void *a1, const char *a2, ...)
{
  return [a1 disconnectFromDaemon];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_endTransaction(void *a1, const char *a2, ...)
{
  return [a1 endTransaction];
}

id objc_msgSend_guid(void *a1, const char *a2, ...)
{
  return [a1 guid];
}

id objc_msgSend_isAudioMessage(void *a1, const char *a2, ...)
{
  return [a1 isAudioMessage];
}

id objc_msgSend_isFromMe(void *a1, const char *a2, ...)
{
  return [a1 isFromMe];
}

id objc_msgSend_isMuted(void *a1, const char *a2, ...)
{
  return [a1 isMuted];
}

id objc_msgSend_isRead(void *a1, const char *a2, ...)
{
  return [a1 isRead];
}

id objc_msgSend_isSent(void *a1, const char *a2, ...)
{
  return [a1 isSent];
}

id objc_msgSend_isTransacting(void *a1, const char *a2, ...)
{
  return [a1 isTransacting];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_pendingSendGuids(void *a1, const char *a2, ...)
{
  return [a1 pendingSendGuids];
}

id objc_msgSend_plainBody(void *a1, const char *a2, ...)
{
  return [a1 plainBody];
}

id objc_msgSend_recipient(void *a1, const char *a2, ...)
{
  return [a1 recipient];
}

id objc_msgSend_registerForIMCoreNotifications(void *a1, const char *a2, ...)
{
  return [a1 registerForIMCoreNotifications];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 reverseObjectEnumerator];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_sender(void *a1, const char *a2, ...)
{
  return [a1 sender];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return [a1 service];
}

id objc_msgSend_sessionClass(void *a1, const char *a2, ...)
{
  return [a1 sessionClass];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_subject(void *a1, const char *a2, ...)
{
  return [a1 subject];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_timeDelivered(void *a1, const char *a2, ...)
{
  return [a1 timeDelivered];
}

id objc_msgSend_timer(void *a1, const char *a2, ...)
{
  return [a1 timer];
}

id objc_msgSend_timerTransactionCount(void *a1, const char *a2, ...)
{
  return [a1 timerTransactionCount];
}

id objc_msgSend_transactionCount(void *a1, const char *a2, ...)
{
  return [a1 transactionCount];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_watchdog(void *a1, const char *a2, ...)
{
  return [a1 watchdog];
}