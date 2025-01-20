void STKAlertSessionManagerStart()
{
  if (STKAlertSessionManagerStartInternal___once != -1) {
    dispatch_once(&STKAlertSessionManagerStartInternal___once, &__block_literal_global);
  }
}

void *STKAlertSessionManagerSetDeviceLanguage(uint64_t a1)
{
  if (STKAlertSessionManagerStartInternal___once != -1) {
    dispatch_once(&STKAlertSessionManagerStartInternal___once, &__block_literal_global);
  }
  NSLog(&cfstr_StkLockScreenN.isa, a1);
  if (__stkSessionManager) {
    [(id)__stkSessionManager setDeviceLanguage:a1];
  }
  if (__class0SessionManager) {
    [(id)__class0SessionManager setDeviceLanguage:a1];
  }
  result = (void *)__ussdSessionManager;
  if (__ussdSessionManager)
  {
    return (void *)[result setDeviceLanguage:a1];
  }
  return result;
}

void __STKAlertSessionManagerStartInternal_block_invoke()
{
  NSLog(&cfstr_StkSessionsAre.isa);
  v6 = objc_alloc_init(STKCarrierSubscriptionMonitor);
  v0 = [[STKSIMToolkitAlertSessionManager alloc] initWithSubscriptionMonitor:v6];
  v1 = (void *)__stkSessionManager;
  __stkSessionManager = (uint64_t)v0;

  v2 = [[STKClass0SMSAlertSessionManager alloc] initWithSubscriptionMonitor:v6];
  v3 = (void *)__class0SessionManager;
  __class0SessionManager = (uint64_t)v2;

  v4 = [[STKUSSDAlertSessionManager alloc] initWithSubscriptionMonitor:v6];
  v5 = (void *)__ussdSessionManager;
  __ussdSessionManager = (uint64_t)v4;
}

void sub_221DC3834(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void _queue_USSDHandler(uint64_t a1, const void *a2, uint64_t a3, void *a4)
{
  if (!a2)
  {
    v18 = [MEMORY[0x263F08690] currentHandler];
    v19 = objc_msgSend(NSString, "stringWithUTF8String:", "void _queue_USSDHandler(CTServerConnectionRef, CFStringRef, CFDictionaryRef, void *)");
    [v18 handleFailureInFunction:v19 file:@"STKUSSDAlertSessionManager.m" lineNumber:400 description:@"Received CT notification without name"];
  }
  v7 = a4;
  BSDispatchQueueAssert();
  v8 = [v7 log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    _queue_USSDHandler_cold_1((uint64_t)a2, a3, v8);
  }

  v9 = (void *)MEMORY[0x263EFFA78];
  if (a3) {
    v9 = (void *)a3;
  }
  id v10 = v9;
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F03490]))
  {
    uint64_t v11 = 1;
  }
  else if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F034D0]))
  {
    uint64_t v11 = 2;
  }
  else if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F03498]))
  {
    uint64_t v11 = 3;
  }
  else if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F034A8]))
  {
    uint64_t v11 = 4;
  }
  else
  {
    if (!CFEqual(a2, (CFTypeRef)*MEMORY[0x263F034D8]))
    {
      v16 = [MEMORY[0x263F08690] currentHandler];
      v17 = objc_msgSend(NSString, "stringWithUTF8String:", "void _queue_USSDHandler(CTServerConnectionRef, CFStringRef, CFDictionaryRef, void *)");
      [(_STKUSSDResponseProvider *)v16 handleFailureInFunction:v17, @"STKUSSDAlertSessionManager.m", 417, @"Unhandled CT notification: %@", a2 file lineNumber description];

      goto LABEL_18;
    }
    uint64_t v11 = 5;
  }
  v12 = [_STKUSSDResponseProvider alloc];
  uint64_t v13 = v7[4];
  uint64_t v14 = v7[6];
  v15 = [v7 log];
  v16 = [(_STKUSSDResponseProvider *)v12 initWithQueue:v13 telephonyClient:v14 options:v10 logger:v15];

  objc_msgSend(v7, "_queue_handleUSSDEvent:responder:userInfo:", v11, v16, v10);
LABEL_18:
}

void sub_221DC744C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_221DC93D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_221DCBBDC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void _queue_SIMToolkitHandler(uint64_t a1, const void *a2, void *a3, void *a4)
{
  if (!a2)
  {
    id v10 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v11 = objc_msgSend(NSString, "stringWithUTF8String:", "void _queue_SIMToolkitHandler(CTServerConnectionRef, CFStringRef, CFDictionaryRef, void *)");
    [v10 handleFailureInFunction:v11 file:@"STKSIMToolkitAlertSessionManager.m" lineNumber:760 description:@"Received CT notification without name"];
  }
  v20 = a4;
  BSDispatchQueueAssert();
  v7 = (void *)MEMORY[0x263EFFA78];
  if (a3) {
    v7 = a3;
  }
  id v8 = v7;
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F03280]))
  {
    uint64_t v9 = 1;
LABEL_33:
    v12 = [v8 valueForKey:*MEMORY[0x263F032B8]];
    uint64_t v13 = (int)[v12 intValue];

    uint64_t v14 = [v20[18] subscriptionContextForSlot:v13];
    v15 = [_STKSIMToolkitResponseProvider alloc];
    id v16 = v20[4];
    id v17 = v20[5];
    v18 = [v20 log];
    v19 = [(_STKSIMToolkitResponseProvider *)v15 initWithQueue:v16 telephonyClient:v17 context:v14 options:v8 logger:v18];

    objc_msgSend(v20, "_queue_handleSIMToolkitEvent:responder:userInfo:", v9, v19, v8);
    goto LABEL_34;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F03288]))
  {
    uint64_t v9 = 2;
    goto LABEL_33;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F03298]))
  {
    uint64_t v9 = 3;
    goto LABEL_33;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F03278]))
  {
    uint64_t v9 = 4;
    goto LABEL_33;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F03118]))
  {
    uint64_t v9 = 5;
    goto LABEL_33;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F03168]))
  {
    uint64_t v9 = 6;
    goto LABEL_33;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F03240]))
  {
    uint64_t v9 = 7;
    goto LABEL_33;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F03110]))
  {
    uint64_t v9 = 8;
    goto LABEL_33;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F030E8]))
  {
    uint64_t v9 = 9;
    goto LABEL_33;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F03190]))
  {
    uint64_t v9 = 10;
    goto LABEL_33;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F031A0]))
  {
    uint64_t v9 = 11;
    goto LABEL_33;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F03198]))
  {
    uint64_t v9 = 12;
    goto LABEL_33;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F032B0]))
  {
    uint64_t v9 = 13;
    goto LABEL_33;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F03270]))
  {
    uint64_t v9 = 14;
    goto LABEL_33;
  }
  uint64_t v14 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(NSString, "stringWithUTF8String:", "void _queue_SIMToolkitHandler(CTServerConnectionRef, CFStringRef, CFDictionaryRef, void *)");
  v19 = (_STKSIMToolkitResponseProvider *)objc_claimAutoreleasedReturnValue();
  [v14 handleFailureInFunction:v19, @"STKSIMToolkitAlertSessionManager.m", 775, @"Unhandled CT notification: %@", a2 file lineNumber description];
LABEL_34:
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void sub_221DCD1BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t STKUSSDHostCommunicationInterface()
{
  return [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D46B768];
}

id STKUSSDSessionCommunicationInterface()
{
  v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D46CC78];
  uint64_t v1 = (void *)MEMORY[0x263EFFA08];
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v1, "setWithObjects:", v2, v3, v4, objc_opt_class(), 0);
  [v0 setClasses:v5 forSelector:sel_sessionDidReceiveSupplementaryServicesEvent_ argumentIndex:0 ofReply:0];

  return v0;
}

__CFString *NSStringFromSTKSIMToolkitEvent(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xD) {
    return @"unknown";
  }
  else {
    return off_2645F48D8[a1 - 1];
  }
}

__CFString *NSStringFromSTKSessionResponseType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6) {
    return @"Success";
  }
  else {
    return off_2645F4948[a1 - 1];
  }
}

void sub_221DCF328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void _STKWithLock(os_unfair_lock_s *a1, void *a2)
{
  uint64_t v3 = a1 + 2;
  uint64_t v4 = a2;
  v5 = a1;
  os_unfair_lock_lock(v3);
  v4[2](v4);

  os_unfair_lock_unlock(v3);
}

void sub_221DCF768(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_221DD04FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_221DD136C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_221DD1A68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_221DD1AD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_221DD1CE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_221DD20B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_221DD2200(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id STKCommonLog()
{
  if (STKCommonLog_onceToken != -1) {
    dispatch_once(&STKCommonLog_onceToken, &__block_literal_global_5);
  }
  v0 = (void *)STKCommonLog___log;

  return v0;
}

uint64_t __STKCommonLog_block_invoke()
{
  STKCommonLog___log = (uint64_t)os_log_create("com.apple.telephony.stk", "common");

  return MEMORY[0x270F9A758]();
}

id STKSIMToolkitLog()
{
  if (STKSIMToolkitLog_onceToken != -1) {
    dispatch_once(&STKSIMToolkitLog_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)STKSIMToolkitLog___log;

  return v0;
}

uint64_t __STKSIMToolkitLog_block_invoke()
{
  STKSIMToolkitLog___log = (uint64_t)os_log_create("com.apple.telephony.simtoolkit", "default");

  return MEMORY[0x270F9A758]();
}

id STKUSSDLog()
{
  if (STKUSSDLog_onceToken != -1) {
    dispatch_once(&STKUSSDLog_onceToken, &__block_literal_global_8);
  }
  v0 = (void *)STKUSSDLog___log;

  return v0;
}

uint64_t __STKUSSDLog_block_invoke()
{
  STKUSSDLog___log = (uint64_t)os_log_create("com.apple.telephony.ussd", "default");

  return MEMORY[0x270F9A758]();
}

id STKClass0SMSLog()
{
  if (STKClass0SMSLog_onceToken != -1) {
    dispatch_once(&STKClass0SMSLog_onceToken, &__block_literal_global_11);
  }
  v0 = (void *)STKClass0SMSLog___log;

  return v0;
}

uint64_t __STKClass0SMSLog_block_invoke()
{
  STKClass0SMSLog___log = (uint64_t)os_log_create("com.apple.telephony.class0sms", "default");

  return MEMORY[0x270F9A758]();
}

void _queue_USSDHandler_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v6 = [MEMORY[0x263F29CA0] sharedInstance];
  int v7 = [v6 isInternalInstall];
  if (v7)
  {
    id v8 = [NSString stringWithFormat:@" %@", a2];
  }
  else
  {
    id v8 = &stru_26D4601D0;
  }
  *(_DWORD *)buf = 138412546;
  uint64_t v10 = a1;
  __int16 v11 = 2112;
  v12 = v8;
  _os_log_debug_impl(&dword_221DC0000, a3, OS_LOG_TYPE_DEBUG, "Received CT USSD notification: %@%@", buf, 0x16u);
  if (v7) {
}
  }

void AudioServicesPlaySystemSound(SystemSoundID inSystemSoundID)
{
}

uint64_t AudioServicesStartSystemSound()
{
  return MEMORY[0x270EE2240]();
}

uint64_t AudioServicesStopSystemSound()
{
  return MEMORY[0x270EE2248]();
}

uint64_t BSDeserializeArrayOfBSXPCEncodableObjectsFromXPCDictionaryWithKey()
{
  return MEMORY[0x270F10700]();
}

uint64_t BSDeserializeStringFromXPCDictionaryWithKey()
{
  return MEMORY[0x270F10740]();
}

uint64_t BSDispatchQueueAssert()
{
  return MEMORY[0x270F10750]();
}

uint64_t BSDispatchQueueCreateWithQualityOfService()
{
  return MEMORY[0x270F10790]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x270F107B8]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x270F107C8]();
}

uint64_t BSFloatLessThanOrEqualToFloat()
{
  return MEMORY[0x270F10820]();
}

uint64_t BSSerializeArrayOfBSXPCEncodableObjectsToXPCDictionaryWithKey()
{
  return MEMORY[0x270F108F0]();
}

uint64_t BSSerializeStringToXPCDictionaryWithKey()
{
  return MEMORY[0x270F10930]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFArrayRef CFBundleCopyBundleLocalizations(CFBundleRef bundle)
{
  return (CFArrayRef)MEMORY[0x270EE4540](bundle);
}

CFArrayRef CFBundleCopyLocalizationsForPreferences(CFArrayRef locArray, CFArrayRef prefArray)
{
  return (CFArrayRef)MEMORY[0x270EE4570](locArray, prefArray);
}

uint64_t CFBundleCopyLocalizedStringForLocalization()
{
  return MEMORY[0x270EE4580]();
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x270EE45C8](bundleID);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x270EE4A60]();
}

CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFLocaleKey key)
{
  return (CFTypeRef)MEMORY[0x270EE4AD0](locale, key);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t CTCopyCurrentCalls()
{
  return MEMORY[0x270EE8678]();
}

uint64_t CTSubscriptionSlotAsString()
{
  return MEMORY[0x270EE8720]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x270F4AE48]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t SBSSetIdleText()
{
  return MEMORY[0x270F771D0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CTServerConnectionCreate()
{
  return MEMORY[0x270EE87B0]();
}

uint64_t _CTServerConnectionRegisterForNotification()
{
  return MEMORY[0x270EE8860]();
}

uint64_t _CTServerConnectionSetTargetQueue()
{
  return MEMORY[0x270EE88B0]();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x270EDA768](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC050](xdict, key);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  MEMORY[0x270EDC080](xdict, key);
  return result;
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC0B0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}