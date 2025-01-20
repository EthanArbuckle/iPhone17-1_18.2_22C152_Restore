uint64_t sub_100003C30(char *category)
{
  uint64_t vars8;

  qword_10000C908 = (uint64_t)os_log_create("com.apple.bluetooth", category);

  return _objc_release_x1();
}

id sub_100003E58(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _handleEvent:a2];
}

void sub_100003E64()
{
  v0 = qword_10000C908;
  if (os_log_type_enabled((os_log_t)qword_10000C908, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "Language did change, exiting", v1, 2u);
  }
  exit(1);
}

id sub_100004300(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _handleEvent:a2];
}

void sub_1000043C8(id a1)
{
  v1 = +[NSValue valueWithPointer:&_xpc_type_BOOL];
  v7[0] = v1;
  v8[0] = &stru_100008410;
  v2 = +[NSValue valueWithPointer:&_xpc_type_int64];
  v7[1] = v2;
  v8[1] = &stru_100008430;
  v3 = +[NSValue valueWithPointer:&_xpc_type_uint64];
  v7[2] = v3;
  v8[2] = &stru_100008450;
  v4 = +[NSValue valueWithPointer:&_xpc_type_double];
  v7[3] = v4;
  v8[3] = &stru_100008470;
  uint64_t v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:4];
  v6 = (void *)qword_10000C910;
  qword_10000C910 = v5;
}

NSNumber *__cdecl sub_100004500(id a1, OS_xpc_object *a2)
{
  BOOL value = xpc_BOOL_get_value(a2);

  return +[NSNumber numberWithBool:value];
}

NSNumber *__cdecl sub_100004544(id a1, OS_xpc_object *a2)
{
  int64_t value = xpc_int64_get_value(a2);

  return +[NSNumber numberWithLongLong:value];
}

NSNumber *__cdecl sub_100004588(id a1, OS_xpc_object *a2)
{
  uint64_t value = xpc_uint64_get_value(a2);

  return +[NSNumber numberWithUnsignedLongLong:value];
}

NSNumber *__cdecl sub_1000045CC(id a1, OS_xpc_object *a2)
{
  double value = xpc_double_get_value(a2);

  return +[NSNumber numberWithDouble:value];
}

void sub_1000046B0(id a1)
{
  v1 = +[NSValue valueWithPointer:&_xpc_type_string];
  v4 = v1;
  uint64_t v5 = &stru_1000084D0;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  v3 = (void *)qword_10000C920;
  qword_10000C920 = v2;
}

NSString *__cdecl sub_100004758(id a1, OS_xpc_object *a2)
{
  string_ptr = xpc_string_get_string_ptr(a2);

  return +[NSString stringWithUTF8String:string_ptr];
}

void sub_100004840(id a1)
{
  v1 = +[NSValue valueWithPointer:&_xpc_type_dictionary];
  v4 = v1;
  uint64_t v5 = &stru_100008530;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  v3 = (void *)qword_10000C930;
  qword_10000C930 = v2;
}

OS_xpc_object *__cdecl sub_1000048E8(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;

  return v2;
}

void sub_100004C90(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_100004CB0()
{
  return v0;
}

void sub_100004D48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100004DB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

id sub_100004F5C(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _timerEvent];
}

id sub_100004F64(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTimer:0];
}

void sub_100005050(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

uint64_t start()
{
  sub_100003C30("BTPbap");
  uint64_t v0 = [[BTXpcService alloc] initWithName:"com.apple.BTServer.pbap" sessionClass:objc_opt_class()];
  if (v0)
  {
    v1 = +[NSRunLoop currentRunLoop];
    [v1 run];
  }
  return 1;
}

void sub_100005BCC(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Failed to create XPC server", v1, 2u);
}

void sub_100005C10(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "XPC server error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100005C88(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unexpected XPC server event: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100005D00(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "XPC connection does not have the proper entitlement, cancelling", v1, 2u);
}

void sub_100005D44(char a1, void *a2)
{
  if (a1) {
    CFStringRef v3 = @"reply";
  }
  else {
    CFStringRef v3 = @"message";
  }
  id v4 = a2;
  uint64_t v5 = [(id)sub_100004CB0() description];
  int v6 = 138412546;
  CFStringRef v7 = v3;
  __int16 v8 = 2112;
  v9 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Sending XPC %@: %@", (uint8_t *)&v6, 0x16u);
}

void sub_100005E14(void *a1)
{
  id v2 = a1;
  CFStringRef v3 = [(id)sub_100004CB0() description];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "Received XPC message: %@", (uint8_t *)&v4, 0xCu);
}

void sub_100005EB8(void *a1)
{
  id v2 = a1;
  CFStringRef v3 = [(id)sub_100004CB0() description];
  sub_100004C90((void *)&_mh_execute_header, v4, v5, "XPC connection error: %@", v6, v7, v8, v9, 2u);
}

void sub_100005F4C(void *a1)
{
  id v2 = a1;
  CFStringRef v3 = [(id)sub_100004CB0() description];
  sub_100004C90((void *)&_mh_execute_header, v4, v5, "Unexpected XPC connection event: %@", v6, v7, v8, v9, 2u);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSRange v4 = _NSIntersectionRange(range1, range2);
  NSUInteger length = v4.length;
  NSUInteger location = v4.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

uint64_t WriteStackshotReportWithPID()
{
  return _WriteStackshotReportWithPID();
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_date(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
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

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend__callStatusForCall_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_callStatusForCall:");
}

id objc_msgSend__handleConnection_(void *a1, const char *a2, ...)
{
  return [a1 _handleConnection:];
}

id objc_msgSend__objectForKey_dict_optional_converters_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_objectForKey:dict:optional:converters:");
}

id objc_msgSend__predicateForType_(void *a1, const char *a2, ...)
{
  return [a1 _predicateForType:];
}

id objc_msgSend__startTimer(void *a1, const char *a2, ...)
{
  return _[a1 _startTimer];
}

id objc_msgSend__stopTimer(void *a1, const char *a2, ...)
{
  return _[a1 _stopTimer];
}

id objc_msgSend__timeout(void *a1, const char *a2, ...)
{
  return _[a1 _timeout];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addressBookRecordId(void *a1, const char *a2, ...)
{
  return _[a1 addressBookRecordId];
}

id objc_msgSend_andPredicateWithSubpredicates_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "andPredicateWithSubpredicates:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:count:];
}

id objc_msgSend_beginTransaction(void *a1, const char *a2, ...)
{
  return _[a1 beginTransaction];
}

id objc_msgSend_callStatus(void *a1, const char *a2, ...)
{
  return _[a1 callStatus];
}

id objc_msgSend_callerId(void *a1, const char *a2, ...)
{
  return _[a1 callerId];
}

id objc_msgSend_callerIdLabel(void *a1, const char *a2, ...)
{
  return _[a1 callerIdLabel];
}

id objc_msgSend_chManager(void *a1, const char *a2, ...)
{
  return _[a1 chManager];
}

id objc_msgSend_chRecentCalls(void *a1, const char *a2, ...)
{
  return _[a1 chRecentCalls];
}

id objc_msgSend_coalescedCallsWithPredicate_limit_offset_batchSize_(void *a1, const char *a2, ...)
{
  return [a1 coalescedCallsWithPredicate:x0 limit:x1 offset:x2 batchSize:x3];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return _[a1 connection];
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return [a1 containsString:];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 currentRunLoop];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return [a1 dateWithTimeIntervalSinceNow:];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_endTransaction(void *a1, const char *a2, ...)
{
  return _[a1 endTransaction];
}

id objc_msgSend_handleMsg_(void *a1, const char *a2, ...)
{
  return [a1 handleMsg:];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_initWithConnection_(void *a1, const char *a2, ...)
{
  return [a1 initWithConnection:];
}

id objc_msgSend_initWithName_sessionClass_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:sessionClass:];
}

id objc_msgSend_isTransacting(void *a1, const char *a2, ...)
{
  return _[a1 isTransacting];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_numberForKey_optional_dict_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "numberForKey:optional:dict:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndexedSubscript:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_orPredicateWithSubpredicates_(void *a1, const char *a2, ...)
{
  return [a1 orPredicateWithSubpredicates:];
}

id objc_msgSend_predicateForCallsBetweenStartDate_endDate_(void *a1, const char *a2, ...)
{
  return [a1 predicateForCallsBetweenStartDate:endDate:];
}

id objc_msgSend_predicateForCallsWithRemoteParticipantHandleType_(void *a1, const char *a2, ...)
{
  return [a1 predicateForCallsWithRemoteParticipantHandleType:];
}

id objc_msgSend_predicateForCallsWithStatus_(void *a1, const char *a2, ...)
{
  return [a1 predicateForCallsWithStatus:];
}

id objc_msgSend_predicateForCallsWithStatusRead_(void *a1, const char *a2, ...)
{
  return [a1 predicateForCallsWithStatusRead:];
}

id objc_msgSend_providerForRecentCall_(void *a1, const char *a2, ...)
{
  return [a1 providerForRecentCall:];
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return [a1 raise:];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _[a1 run];
}

id objc_msgSend_sendReply_(void *a1, const char *a2, ...)
{
  return [a1 sendReply:];
}

id objc_msgSend_sessionClass(void *a1, const char *a2, ...)
{
  return _[a1 sessionClass];
}

id objc_msgSend_setChRecentCalls_(void *a1, const char *a2, ...)
{
  return [a1 setChRecentCalls:];
}

id objc_msgSend_setCoalescingStrategy_(void *a1, const char *a2, ...)
{
  return [a1 setCoalescingStrategy:];
}

id objc_msgSend_setIsTransacting_(void *a1, const char *a2, ...)
{
  return [a1 setIsTransacting:];
}

id objc_msgSend_setLimitingStartDate_(void *a1, const char *a2, ...)
{
  return [a1 setLimitingStartDate:];
}

id objc_msgSend_setTimer_(void *a1, const char *a2, ...)
{
  return [a1 setTimer:];
}

id objc_msgSend_setTimerTransactionCount_(void *a1, const char *a2, ...)
{
  return [a1 setTimerTransactionCount:];
}

id objc_msgSend_setTransactionCount_(void *a1, const char *a2, ...)
{
  return [a1 setTransactionCount:];
}

id objc_msgSend_stringForKey_optional_dict_(void *a1, const char *a2, ...)
{
  return [a1 stringForKey:x0 optional:x1 dict:x2];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return [a1 stringWithUTF8String:];
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return [a1 subarrayWithRange:];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSince1970];
}

id objc_msgSend_timer(void *a1, const char *a2, ...)
{
  return _[a1 timer];
}

id objc_msgSend_timerTransactionCount(void *a1, const char *a2, ...)
{
  return _[a1 timerTransactionCount];
}

id objc_msgSend_transactionCount(void *a1, const char *a2, ...)
{
  return _[a1 transactionCount];
}

id objc_msgSend_tuCallProviderManager(void *a1, const char *a2, ...)
{
  return _[a1 tuCallProviderManager];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_valueWithPointer_(void *a1, const char *a2, ...)
{
  return [a1 valueWithPointer:x0];
}

id objc_msgSend_watchdog(void *a1, const char *a2, ...)
{
  return _[a1 watchdog];
}

id objc_msgSend_xpcDictForKey_optional_dict_(void *a1, const char *a2, ...)
{
  return [a1 xpcDictForKey:x0 optional:x1 dict:x2];
}