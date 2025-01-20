void __isRunningInDemoMode_block_invoke()
{
  void *v0;
  CFPropertyListRef v1;
  const void *v2;
  CFTypeID v3;
  uint64_t vars8;

  v0 = (void *)MEMORY[0x261140ED0]();
  v1 = CFPreferencesCopyValue(@"StoreDemoMode", @"com.apple.demo-settings", @"mobile", (CFStringRef)*MEMORY[0x263EFFE50]);
  if (v1)
  {
    v2 = v1;
    CFAutorelease(v1);
    v3 = CFGetTypeID(v2);
    if (v3 == CFBooleanGetTypeID()) {
      isRunningInDemoMode_result = CFBooleanGetValue((CFBooleanRef)v2) != 0;
    }
  }
}

PDCFileBackedConsentStore *PDCGlobalConsentStoreInstance()
{
  v0 = [PDCFileBackedConsentStore alloc];
  v1 = [NSURL fileURLWithPath:@"/var/mobile/Library/com.apple.PrivacyDisclosure/consents/"];
  v2 = [(PDCFileBackedConsentStore *)v0 initWithConsentStoreURL:v1];

  v3 = PDCGlobalBackupManager();
  v4 = v3;
  if (v3)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __PDCGlobalConsentStoreInstance_block_invoke;
    v6[3] = &unk_265479E98;
    id v7 = v3;
    [(PDCFileBackedConsentStore *)v2 setChangeObserver:v6];
  }

  return v2;
}

uint64_t PDCGlobalBackupManager()
{
  return 0;
}

uint64_t __isGreenTea_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  isGreenTea_uint64_t result = result;
  return result;
}

id PDCGlobalDeviceSettings()
{
  if (PDCGlobalDeviceSettings_once != -1) {
    dispatch_once(&PDCGlobalDeviceSettings_once, &__block_literal_global);
  }
  v0 = (void *)PDCGlobalDeviceSettings_result;

  return v0;
}

uint64_t __PDCGlobalDeviceSettings_block_invoke()
{
  PDCGlobalDeviceSettings_uint64_t result = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.PrivacyDisclosure"];

  return MEMORY[0x270F9A758]();
}

void sub_25A655828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25A655EAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getSBSRemoteAlertPresentationTargetClass()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getSBSRemoteAlertPresentationTargetClass_softClass;
  uint64_t v7 = getSBSRemoteAlertPresentationTargetClass_softClass;
  if (!getSBSRemoteAlertPresentationTargetClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getSBSRemoteAlertPresentationTargetClass_block_invoke;
    v3[3] = &unk_265479DF0;
    v3[4] = &v4;
    __getSBSRemoteAlertPresentationTargetClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_25A655FA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getBSMutableSettingsClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("BSMutableSettings");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getBSMutableSettingsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getBSMutableSettingsClass_block_invoke_cold_1();
    BaseBoardLibrary();
  }
}

void BaseBoardLibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!BaseBoardLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __BaseBoardLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_265479E10;
    uint64_t v3 = 0;
    BaseBoardLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!BaseBoardLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __BaseBoardLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  BaseBoardLibraryCore_frameworkLibrary = result;
  return result;
}

void __getSBSRemoteAlertDefinitionClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SBSRemoteAlertDefinition");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSBSRemoteAlertDefinitionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getSBSRemoteAlertDefinitionClass_block_invoke_cold_1();
    SpringBoardServicesLibrary();
  }
}

void SpringBoardServicesLibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!SpringBoardServicesLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __SpringBoardServicesLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_265479E48;
    uint64_t v3 = 0;
    SpringBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!SpringBoardServicesLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __SpringBoardServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SpringBoardServicesLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getSBSRemoteAlertConfigurationContextClass_block_invoke(uint64_t a1)
{
  SpringBoardServicesLibrary();
  Class result = objc_getClass("SBSRemoteAlertConfigurationContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSBSRemoteAlertConfigurationContextClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getSBSRemoteAlertConfigurationContextClass_block_invoke_cold_1();
    return (Class)__getBSActionClass_block_invoke(v3);
  }
  return result;
}

Class __getBSActionClass_block_invoke(uint64_t a1)
{
  BaseBoardLibrary();
  Class result = objc_getClass("BSAction");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getBSActionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getBSActionClass_block_invoke_cold_1();
    return (Class)__getSBSRemoteAlertHandleClass_block_invoke(v3);
  }
  return result;
}

Class __getSBSRemoteAlertHandleClass_block_invoke(uint64_t a1)
{
  SpringBoardServicesLibrary();
  Class result = objc_getClass("SBSRemoteAlertHandle");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSBSRemoteAlertHandleClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getSBSRemoteAlertHandleClass_block_invoke_cold_1();
    return (Class)__getSBSRemoteAlertActivationContextClass_block_invoke(v3);
  }
  return result;
}

Class __getSBSRemoteAlertActivationContextClass_block_invoke(uint64_t a1)
{
  SpringBoardServicesLibrary();
  Class result = objc_getClass("SBSRemoteAlertActivationContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSBSRemoteAlertActivationContextClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getSBSRemoteAlertActivationContextClass_block_invoke_cold_1();
    return __getSBSRemoteAlertPresentationTargetClass_block_invoke(v3);
  }
  return result;
}

Class __getSBSRemoteAlertPresentationTargetClass_block_invoke(uint64_t a1)
{
  SpringBoardServicesLibrary();
  Class result = objc_getClass("SBSRemoteAlertPresentationTarget");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSBSRemoteAlertPresentationTargetClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getSBSRemoteAlertPresentationTargetClass_block_invoke_cold_1();
    return (Class)__getSBSRemoteAlertPresentationTargetPredicateClass_block_invoke(v3);
  }
  return result;
}

Class __getSBSRemoteAlertPresentationTargetPredicateClass_block_invoke(uint64_t a1)
{
  SpringBoardServicesLibrary();
  Class result = objc_getClass("SBSRemoteAlertPresentationTargetPredicate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSBSRemoteAlertPresentationTargetPredicateClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                            + 24);
  }
  else
  {
    uint64_t v3 = (void *)__getSBSRemoteAlertPresentationTargetPredicateClass_block_invoke_cold_1();
    return (Class)+[PDCPreflightRequestHandle alreadyCompletedRequestHandle];
  }
  return result;
}

uint64_t PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureCore()
{
  if (PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureCore_onceToken != -1) {
    dispatch_once(&PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureCore_onceToken, &__block_literal_global_2);
  }
  return PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureCore_log;
}

void __PDCGlobalConsentStoreInstance_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = NSString;
  objc_msgSend(a2, "consentRecordURLForBundleIdentifier:");
  id v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithUTF8String:", objc_msgSend(v4, "fileSystemRepresentation"));
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 32) backupFileAtPath:v5];
}

id PDCCurrentRegulatoryDisclosureVersionForApplicationIdentity(void *a1)
{
  id v1 = a1;
  id v7 = 0;
  long long v2 = [v1 findApplicationRecordWithError:&v7];
  id v3 = v7;
  if (v3)
  {
    id v4 = PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureCore();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      PDCCurrentRegulatoryDisclosureVersionForApplicationIdentity_cold_1((uint64_t)v1, (uint64_t)v3, v4);
    }
    id v5 = 0;
  }
  else
  {
    id v5 = PDCCurrentRegulatoryDisclosureVersionForApplicationRecord(v2);
  }

  return v5;
}

id PDCCurrentRegulatoryDisclosureVersionForApplicationRecord(void *a1)
{
  id v1 = a1;
  if (objc_opt_respondsToSelector())
  {
    long long v2 = [v1 regulatoryPrivacyDisclosureVersion];
  }
  else
  {
    id v3 = (void *)MEMORY[0x263F086E0];
    id v4 = [v1 URL];

    id v1 = [v3 bundleWithURL:v4];

    id v5 = [v1 infoDictionary];
    long long v2 = PDCCurrentRegulatoryDisclosureVersionForInfoPlistContent(v5);
  }

  return v2;
}

id PDCCurrentRegulatoryDisclosureVersionForInfoPlistContent(void *a1)
{
  id v1 = [a1 objectForKeyedSubscript:@"NSRegulatoryPrivacyDisclosure"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v2 = [v1 objectForKeyedSubscript:@"NSRegulatoryPrivacyDisclosureVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v3 = v2;
    }
    else {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

uint64_t PDCSetOneTimeImplicitConsentState(void *a1, const char *a2)
{
  if (a2) {
    return [a1 setInteger:2 forKey:@"kOneTimeImplicitConsentGranted"];
  }
  else {
    return [a1 removeObjectForKey:@"kOneTimeImplicitConsentGranted"];
  }
}

uint64_t PDCSetOneTimeImplicitConsentGranted(void *a1, const char *a2)
{
  if (a2) {
    return [a1 setInteger:2 forKey:@"kOneTimeImplicitConsentGranted"];
  }
  else {
    return [a1 removeObjectForKey:@"kOneTimeImplicitConsentGranted"];
  }
}

uint64_t PDCPerformOneTimeImplicitConsentGrant(char a1, void *a2, void *a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if ([v7 integerForKey:@"kOneTimeImplicitConsentGranted"] == 2) {
    goto LABEL_17;
  }
  if (a1)
  {
    [v7 setInteger:2 forKey:@"kOneTimeImplicitConsentGranted"];
LABEL_17:
    uint64_t v21 = 0;
    goto LABEL_18;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v10 = objc_msgSend(v9, "allApplications", 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v16 = [v15 regulatoryPrivacyDisclosureVersion];
        uint64_t v17 = [v15 bundleIdentifier];
        v18 = (void *)v17;
        if (v16) {
          BOOL v19 = v17 == 0;
        }
        else {
          BOOL v19 = 1;
        }
        if (!v19) {
          id v20 = (id)[v8 writeUserConsentedRegulatoryDisclosureVersion:v16 forBundleIdentifier:v17];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v12);
  }

  [v7 setInteger:2 forKey:@"kOneTimeImplicitConsentGranted"];
  uint64_t v21 = 1;
LABEL_18:

  return v21;
}

id PDCGlobalApplicationEnvironment()
{
  if (PDCGlobalApplicationEnvironment_once != -1) {
    dispatch_once(&PDCGlobalApplicationEnvironment_once, &__block_literal_global_5);
  }
  v0 = (void *)PDCGlobalApplicationEnvironment_result;

  return v0;
}

uint64_t __PDCGlobalApplicationEnvironment_block_invoke()
{
  PDCGlobalApplicationEnvironment_Class result = objc_alloc_init(PDCLSBackedApplicationEnvironment);

  return MEMORY[0x270F9A758]();
}

id PDCApplicationIdentityToLSApplicationIdentity(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      PDCApplicationIdentityToLSApplicationIdentity_cold_1();
    }
  }

  return v1;
}

uint64_t __getBSMutableSettingsClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSBSRemoteAlertDefinitionClass_block_invoke_cold_1(v0);
}

uint64_t __getSBSRemoteAlertDefinitionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSBSRemoteAlertConfigurationContextClass_block_invoke_cold_1(v0);
}

uint64_t __getSBSRemoteAlertConfigurationContextClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getBSActionClass_block_invoke_cold_1(v0);
}

uint64_t __getBSActionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSBSRemoteAlertHandleClass_block_invoke_cold_1(v0);
}

uint64_t __getSBSRemoteAlertHandleClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSBSRemoteAlertActivationContextClass_block_invoke_cold_1(v0);
}

uint64_t __getSBSRemoteAlertActivationContextClass_block_invoke_cold_1()
{
  return __getSBSRemoteAlertPresentationTargetClass_block_invoke_cold_1();
}

uint64_t __getSBSRemoteAlertPresentationTargetClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSBSRemoteAlertPresentationTargetPredicateClass_block_invoke_cold_1(v0);
}

uint64_t __getSBSRemoteAlertPresentationTargetPredicateClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[PDCFileBackedConsentStore userConsentedRegulatoryDisclosureVersionForBundleIdentifier:](v0);
}

void PDCCurrentRegulatoryDisclosureVersionForApplicationIdentity_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_25A653000, log, OS_LOG_TYPE_ERROR, "Attempt to locate app %@ failed: %@", (uint8_t *)&v3, 0x16u);
}

void PDCApplicationIdentityToLSApplicationIdentity_cold_1()
{
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x270EE4440](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

uint64_t ct_green_tea_logging_enabled()
{
  return MEMORY[0x270F91840]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x270ED9468](label, attr, target);
}

void free(void *a1)
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

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
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

int unlink(const char *a1)
{
  return MEMORY[0x270EDB9A8](a1);
}