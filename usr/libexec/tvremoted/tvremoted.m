int main(int argc, const char **argv, const char **envp)
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  TVRDServer *v7;
  id v8;
  void *v9;
  uint8_t v11[16];

  v3 = _TVRDXPCLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "The tvremote daemon is starting.", v11, 2u);
  }

  if ((_set_user_dir_suffix() & 1) == 0)
  {
    v5 = _TVRDXPCLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      main_cold_1(v5);
    }
  }
  v6 = +[TVRDLaunchEventHandlers sharedInstance];
  [v6 setupHandlers];

  v7 = objc_alloc_init(TVRDServer);
  v8 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.tvremotecore.xpc"];
  [v8 setDelegate:v7];
  [v8 resume];
  v9 = +[NSRunLoop currentRunLoop];
  [v9 run];

  return 0;
}

id _TVRDIRLog()
{
  if (_TVRDIRLog_onceToken != -1) {
    dispatch_once(&_TVRDIRLog_onceToken, &__block_literal_global);
  }
  v0 = (void *)_TVRDIRLog_log;

  return v0;
}

id _TVRDXPCLog()
{
  if (_TVRDXPCLog_onceToken != -1) {
    dispatch_once(&_TVRDXPCLog_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)_TVRDXPCLog_log;

  return v0;
}

void sub_10000377C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100003FF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000044D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100007138(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100007EF0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1000082F4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100008DB8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

void sub_100009BA8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 88));
  _Unwind_Resume(a1);
}

void sub_10000F588(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000105AC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void main_cold_1(NSObject *a1)
{
  int v2 = *__error();
  v3 = __error();
  uint64_t v4 = strerror(*v3);
  v5[0] = 67109378;
  v5[1] = v2;
  __int16 v6 = 2080;
  v7 = v4;
  _os_log_fault_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_FAULT, "_set_user_dir_suffix failed. Error code: %d, Error: %s", (uint8_t *)v5, 0x12u);
}

uint64_t CFGetInt64()
{
  return _CFGetInt64();
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t GestaltGetDeviceClass()
{
  return _GestaltGetDeviceClass();
}

uint64_t IRAppleTVControlEventTypeToString()
{
  return _IRAppleTVControlEventTypeToString();
}

uint64_t IRCandidateClassificationToString()
{
  return _IRCandidateClassificationToString();
}

uint64_t TVRCDeviceConnectionTypeDescription()
{
  return _TVRCDeviceConnectionTypeDescription();
}

uint64_t TVRCMakeError()
{
  return _TVRCMakeError();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

uint64_t _TVRCAddStateHandlerWithName()
{
  return __TVRCAddStateHandlerWithName();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
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

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_name(pid, buffer, buffersize);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend__activateIRSessionManager(void *a1, const char *a2, ...)
{
  return [a1 _activateIRSessionManager];
}

id objc_msgSend__createAssertionExpirationTimer(void *a1, const char *a2, ...)
{
  return [a1 _createAssertionExpirationTimer];
}

id objc_msgSend__enableTVRemoteControlCenterModule(void *a1, const char *a2, ...)
{
  return [a1 _enableTVRemoteControlCenterModule];
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return [a1 _init];
}

id objc_msgSend__invalidate(void *a1, const char *a2, ...)
{
  return [a1 _invalidate];
}

id objc_msgSend__invalidateIRSessionManager(void *a1, const char *a2, ...)
{
  return [a1 _invalidateIRSessionManager];
}

id objc_msgSend__invalidateRemoteAlertHandle(void *a1, const char *a2, ...)
{
  return [a1 _invalidateRemoteAlertHandle];
}

id objc_msgSend__newLockScreenBehaviour(void *a1, const char *a2, ...)
{
  return [a1 _newLockScreenBehaviour];
}

id objc_msgSend__removeAllIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 _removeAllIdentifiers];
}

id objc_msgSend__restartIRSession(void *a1, const char *a2, ...)
{
  return [a1 _restartIRSession];
}

id objc_msgSend__setup(void *a1, const char *a2, ...)
{
  return [a1 _setup];
}

id objc_msgSend__setupDistnotedHandlers(void *a1, const char *a2, ...)
{
  return [a1 _setupDistnotedHandlers];
}

id objc_msgSend__setupNotificationHandlers(void *a1, const char *a2, ...)
{
  return [a1 _setupNotificationHandlers];
}

id objc_msgSend__setupNotifydHandlers(void *a1, const char *a2, ...)
{
  return [a1 _setupNotifydHandlers];
}

id objc_msgSend__setupSession(void *a1, const char *a2, ...)
{
  return [a1 _setupSession];
}

id objc_msgSend__startGeneralDeviceQuery(void *a1, const char *a2, ...)
{
  return [a1 _startGeneralDeviceQuery];
}

id objc_msgSend__stopGeneralDeviceQuery(void *a1, const char *a2, ...)
{
  return [a1 _stopGeneralDeviceQuery];
}

id objc_msgSend_acquireLockScreenAssertion(void *a1, const char *a2, ...)
{
  return [a1 acquireLockScreenAssertion];
}

id objc_msgSend_alertHandle(void *a1, const char *a2, ...)
{
  return [a1 alertHandle];
}

id objc_msgSend_allIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 allIdentifiers];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_alternateIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 alternateIdentifiers];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_assertion(void *a1, const char *a2, ...)
{
  return [a1 assertion];
}

id objc_msgSend_attentionState(void *a1, const char *a2, ...)
{
  return [a1 attentionState];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_build(void *a1, const char *a2, ...)
{
  return [a1 build];
}

id objc_msgSend_button(void *a1, const char *a2, ...)
{
  return [a1 button];
}

id objc_msgSend_buttonType(void *a1, const char *a2, ...)
{
  return [a1 buttonType];
}

id objc_msgSend_cachedDevices(void *a1, const char *a2, ...)
{
  return [a1 cachedDevices];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_candidate(void *a1, const char *a2, ...)
{
  return [a1 candidate];
}

id objc_msgSend_candidateIdentifier(void *a1, const char *a2, ...)
{
  return [a1 candidateIdentifier];
}

id objc_msgSend_candidateResults(void *a1, const char *a2, ...)
{
  return [a1 candidateResults];
}

id objc_msgSend_challengeAttributes(void *a1, const char *a2, ...)
{
  return [a1 challengeAttributes];
}

id objc_msgSend_challengeType(void *a1, const char *a2, ...)
{
  return [a1 challengeType];
}

id objc_msgSend_classification(void *a1, const char *a2, ...)
{
  return [a1 classification];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_codeToEnterOnDevice(void *a1, const char *a2, ...)
{
  return [a1 codeToEnterOnDevice];
}

id objc_msgSend_conciseDescription(void *a1, const char *a2, ...)
{
  return [a1 conciseDescription];
}

id objc_msgSend_connect(void *a1, const char *a2, ...)
{
  return [a1 connect];
}

id objc_msgSend_connectionContextByID(void *a1, const char *a2, ...)
{
  return [a1 connectionContextByID];
}

id objc_msgSend_connectionState(void *a1, const char *a2, ...)
{
  return [a1 connectionState];
}

id objc_msgSend_connectionType(void *a1, const char *a2, ...)
{
  return [a1 connectionType];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
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

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_deviceIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 deviceIdentifiers];
}

id objc_msgSend_deviceQueryObservers(void *a1, const char *a2, ...)
{
  return [a1 deviceQueryObservers];
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return [a1 devices];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_disconnect(void *a1, const char *a2, ...)
{
  return [a1 disconnect];
}

id objc_msgSend_eventType(void *a1, const char *a2, ...)
{
  return [a1 eventType];
}

id objc_msgSend_filteredDeviceListHandler(void *a1, const char *a2, ...)
{
  return [a1 filteredDeviceListHandler];
}

id objc_msgSend_firstUnlocked(void *a1, const char *a2, ...)
{
  return [a1 firstUnlocked];
}

id objc_msgSend_generalDeviceQuery(void *a1, const char *a2, ...)
{
  return [a1 generalDeviceQuery];
}

id objc_msgSend_hasStarted(void *a1, const char *a2, ...)
{
  return [a1 hasStarted];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_identifierToCandidateMap(void *a1, const char *a2, ...)
{
  return [a1 identifierToCandidateMap];
}

id objc_msgSend_identifierToDeviceMap(void *a1, const char *a2, ...)
{
  return [a1 identifierToDeviceMap];
}

id objc_msgSend_idsIdentifier(void *a1, const char *a2, ...)
{
  return [a1 idsIdentifier];
}

id objc_msgSend_informDeviceQueryObserversWithUpdatedSuggestions(void *a1, const char *a2, ...)
{
  return [a1 informDeviceQueryObserversWithUpdatedSuggestions];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidateAssertionExpirationTimer(void *a1, const char *a2, ...)
{
  return [a1 invalidateAssertionExpirationTimer];
}

id objc_msgSend_irSession(void *a1, const char *a2, ...)
{
  return [a1 irSession];
}

id objc_msgSend_irSessionManager(void *a1, const char *a2, ...)
{
  return [a1 irSessionManager];
}

id objc_msgSend_isLockScreenAssertionActive(void *a1, const char *a2, ...)
{
  return [a1 isLockScreenAssertionActive];
}

id objc_msgSend_isManagedConfigProfileInstalled(void *a1, const char *a2, ...)
{
  return [a1 isManagedConfigProfileInstalled];
}

id objc_msgSend_isPersistOnLockScreenEnabled(void *a1, const char *a2, ...)
{
  return [a1 isPersistOnLockScreenEnabled];
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return [a1 isRunning];
}

id objc_msgSend_isWakeToRemoteOnLockScreenDisabled(void *a1, const char *a2, ...)
{
  return [a1 isWakeToRemoteOnLockScreenDisabled];
}

id objc_msgSend_keyboardController(void *a1, const char *a2, ...)
{
  return [a1 keyboardController];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_mutableIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 mutableIdentifiers];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_pause(void *a1, const char *a2, ...)
{
  return [a1 pause];
}

id objc_msgSend_phase(void *a1, const char *a2, ...)
{
  return [a1 phase];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_refreshState(void *a1, const char *a2, ...)
{
  return [a1 refreshState];
}

id objc_msgSend_releaseLockScreenAssertion(void *a1, const char *a2, ...)
{
  return [a1 releaseLockScreenAssertion];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_requestCurrentContext(void *a1, const char *a2, ...)
{
  return [a1 requestCurrentContext];
}

id objc_msgSend_requestCurrentRecommendedDevices(void *a1, const char *a2, ...)
{
  return [a1 requestCurrentRecommendedDevices];
}

id objc_msgSend_requestInterface(void *a1, const char *a2, ...)
{
  return [a1 requestInterface];
}

id objc_msgSend_requestedModuleEnablement(void *a1, const char *a2, ...)
{
  return [a1 requestedModuleEnablement];
}

id objc_msgSend_responseInterface(void *a1, const char *a2, ...)
{
  return [a1 responseInterface];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_screenLocked(void *a1, const char *a2, ...)
{
  return [a1 screenLocked];
}

id objc_msgSend_sendReturnKey(void *a1, const char *a2, ...)
{
  return [a1 sendReturnKey];
}

id objc_msgSend_serviceToken(void *a1, const char *a2, ...)
{
  return [a1 serviceToken];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setupHandlers(void *a1, const char *a2, ...)
{
  return [a1 setupHandlers];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startAssertionExpirationTimer(void *a1, const char *a2, ...)
{
  return [a1 startAssertionExpirationTimer];
}

id objc_msgSend_stateDictionary(void *a1, const char *a2, ...)
{
  return [a1 stateDictionary];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_suggestedDevices(void *a1, const char *a2, ...)
{
  return [a1 suggestedDevices];
}

id objc_msgSend_systemMonitor(void *a1, const char *a2, ...)
{
  return [a1 systemMonitor];
}

id objc_msgSend_throttleSeconds(void *a1, const char *a2, ...)
{
  return [a1 throttleSeconds];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_xpcConnection(void *a1, const char *a2, ...)
{
  return [a1 xpcConnection];
}