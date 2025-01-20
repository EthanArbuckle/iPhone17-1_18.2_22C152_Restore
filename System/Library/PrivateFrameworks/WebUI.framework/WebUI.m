void sub_21C35784C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t WBS_LOG_CHANNEL_PREFIXScreenTime()
{
  if (WBS_LOG_CHANNEL_PREFIXScreenTime_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXScreenTime_onceToken, &__block_literal_global_13);
  }
  return WBS_LOG_CHANNEL_PREFIXScreenTime_log;
}

void sub_21C358D90(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 104));
  _Unwind_Resume(a1);
}

uint64_t WBUAutoFillGetEnabledDataClasses()
{
  v0 = objc_alloc_init(WBUFormDataController);
  uint64_t v1 = [(WBUFormDataController *)v0 shouldAutoFillPasswords];
  if ([(WBUFormDataController *)v0 shouldAutoFillFromCreditCardData]) {
    v1 |= 2uLL;
  }

  return v1;
}

void WBUAutoFillDisableDataClasses(char a1)
{
  v2 = objc_alloc_init(WBUFormDataController);
  v3 = v2;
  if (a1)
  {
    [(WBUFormDataController *)v2 setShouldAutoFillPasswords:0];
    v2 = v3;
  }
  if ((a1 & 2) != 0)
  {
    [(WBUFormDataController *)v3 setShouldAutoFillFromCreditCardData:0];
    v2 = v3;
  }
}

void WBUAutoFillClearDataClasses(char a1)
{
  if (a1)
  {
    v2 = objc_alloc_init(WBUFormDataController);
    [(WBUFormDataController *)v2 clearAllFormCredentials];
  }
  if ((a1 & 2) != 0)
  {
    id v3 = +[WBUCreditCardDataController sharedCreditCardDataController];
    [v3 clearCreditCardData];
  }
}

void sub_21C359B60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t WBS_LOG_CHANNEL_PREFIXAutoFill()
{
  if (WBS_LOG_CHANNEL_PREFIXAutoFill_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXAutoFill_onceToken, &__block_literal_global_2);
  }
  return WBS_LOG_CHANNEL_PREFIXAutoFill_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXCookiePolicy()
{
  if (WBS_LOG_CHANNEL_PREFIXCookiePolicy_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXCookiePolicy_onceToken, &__block_literal_global_4);
  }
  return WBS_LOG_CHANNEL_PREFIXCookiePolicy_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill()
{
  if (WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill_onceToken, &__block_literal_global_7_0);
  }
  return WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill_log;
}

void sub_21C35C2AC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

BOOL frameHasTrustedCertificateChain(void *a1)
{
  id v1 = a1;
  v2 = objc_msgSend(v1, "webui_URL");
  id v3 = [v2 host];

  if (![v3 length])
  {
LABEL_8:
    BOOL v5 = 0;
    goto LABEL_9;
  }
  v4 = (__SecTrust *)objc_msgSend(v1, "webui_serverTrust");
  BOOL v5 = (BOOL)v4;
  if (v4)
  {
    CFIndex CertificateCount = SecTrustGetCertificateCount(v4);
    if (CertificateCount >= 2)
    {
      CFIndex v7 = 0;
      CFIndex v8 = CertificateCount - 1;
      do
      {
        SecTrustGetCertificateAtIndex((SecTrustRef)v5, v7);
        if (SecCertificateGetSignatureHashAlgorithm() == 4) {
          goto LABEL_8;
        }
      }
      while (v8 != ++v7);
    }
    BOOL v5 = SecTrustEvaluateWithError((SecTrustRef)v5, 0);
  }
LABEL_9:

  return v5;
}

void sub_21C35EBB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
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

void sub_21C35FA5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C360838(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

id titleTextForSavingNewPassword()
{
  if (![MEMORY[0x263F662A0] isPasswordsAppInstalled]) {
    +[WBUFormDataController keychainSyncEnabled];
  }
  v0 = _WBSLocalizedString();
  return v0;
}

void sub_21C3611E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_21C3631CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v28 - 248), 8);
  _Block_object_dispose((const void *)(v28 - 200), 8);
  _Block_object_dispose((const void *)(v28 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_21C363D18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a65, 8);
  _Unwind_Resume(a1);
}

void sub_21C364B8C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 88));
  _Unwind_Resume(a1);
}

void sub_21C364D50(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21C364EA8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21C36616C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v28 - 152), 8);
  _Unwind_Resume(a1);
}

void __SafariCompletionsDBPath_block_invoke()
{
  uint64_t v0 = [(id)CPSharedResourcesDirectory() stringByAppendingPathComponent:@"Library/Safari"];
  uint64_t v1 = (void *)SafariCompletionsDBPath_path;
  SafariCompletionsDBPath_path = v0;

  v2 = [MEMORY[0x263F08850] defaultManager];
  objc_msgSend(v2, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", SafariCompletionsDBPath_path, 0);

  id v5 = [(id)SafariCompletionsDBPath_path stringByAppendingPathComponent:@"FormValues.plist"];
  uint64_t v3 = [v5 stringByResolvingSymlinksInPath];
  v4 = (void *)SafariCompletionsDBPath_path;
  SafariCompletionsDBPath_path = v3;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x270F0CDD0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

CFStringRef SecCertificateCopySubjectSummary(SecCertificateRef certificate)
{
  return (CFStringRef)MEMORY[0x270EFD7C0](certificate);
}

uint64_t SecCertificateGetSignatureHashAlgorithm()
{
  return MEMORY[0x270EFD818]();
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return MEMORY[0x270EFD948](identityRef, certificateRef);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x270EFDD60](trust, error);
}

SecCertificateRef SecTrustGetCertificateAtIndex(SecTrustRef trust, CFIndex ix)
{
  return (SecCertificateRef)MEMORY[0x270EFDD70](trust, ix);
}

CFIndex SecTrustGetCertificateCount(SecTrustRef trust)
{
  return MEMORY[0x270EFDD78](trust);
}

uint64_t WBSCurrentPasswordSavingBehavior()
{
  return MEMORY[0x270F5C318]();
}

void WBSSharedParsecGlobalFeedbackDispatcher()
{
  while (1)
    ;
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _WBSLocalizedString()
{
  return MEMORY[0x270F5C338]();
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
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
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