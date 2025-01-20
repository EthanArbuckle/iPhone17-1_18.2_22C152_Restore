id SUSUILog()
{
  void *v0;
  dispatch_block_t block;
  dispatch_once_t *predicate;
  uint64_t vars8;

  predicate = (dispatch_once_t *)&SUSUILog___once;
  block = 0;
  objc_storeStrong(&block, &__block_literal_global_1);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  v0 = (void *)SUSUILog___instance;

  return v0;
}

uint64_t SUSUISetupAssistantNeedsToRun()
{
  char v1 = 0;
  if (MEMORY[0x270FC0208]) {
    char v1 = BYSetupAssistantNeedsToRun() & 1;
  }
  return v1 & 1;
}

uint64_t SUSUIRequiresAlertPresentationAfterUpdate()
{
  id location = objc_alloc_init(SUSUISoftwareUpdateDefaults);
  char v4 = 0;
  char v2 = 0;
  if (([location needsAlertPresentationAfterOTAUpdate] & 1) != 0
    || (v5 = +[SUSUIPreferences sharedInstance],
        char v4 = 1,
        LOBYTE(v1) = 0,
        [(SUSUIPreferences *)v5 needsAlertPresentationAfterOTAUpdate]))
  {
    LOBYTE(v1) = 0;
    if ((SUSUISetupAssistantNeedsToRun() & 1) == 0)
    {
      v3 = +[SUSUIPreferences sharedInstance];
      char v2 = 1;
      int v1 = ![(SUSUIPreferences *)v3 preventPostUpdateAlert];
    }
  }
  char v7 = v1 & 1;
  if (v2) {

  }
  if (v4) {
  objc_storeStrong(&location, 0);
  }
  return v7 & 1;
}

void SUSUICreateInstallationKeybagWithSecret(id obj)
{
  id location = 0;
  objc_storeStrong(&location, obj);
  queue = dispatch_get_global_queue(21, 0);
  uint64_t v2 = MEMORY[0x263EF8330];
  int v3 = -1073741824;
  int v4 = 0;
  v5 = __SUSUICreateInstallationKeybagWithSecret_block_invoke;
  v6 = &unk_26470ABF0;
  id v7 = location;
  dispatch_async(queue, &v2);

  objc_storeStrong(&v7, 0);
  objc_storeStrong(&location, 0);
}

void __SUSUICreateInstallationKeybagWithSecret_block_invoke(void *a1)
{
  location[2] = a1;
  location[1] = a1;
  if (a1[4])
  {
    id v14 = objc_alloc_init(SUSUIControllerClient);
    if (v14)
    {
      if ([v14 createKeybagWithSecret:a1[4]])
      {
        id v13 = SUSUILog();
        os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
        {
          int v3 = v13;
          os_log_type_t v4 = v12;
          __os_log_helper_16_0_0(v11);
          _os_log_impl(&dword_224ECB000, v3, v4, "Successfully created keybag", v11, 2u);
        }
        objc_storeStrong(&v13, 0);
      }
      else
      {
        id v10 = SUSUILog();
        os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
        {
          int v1 = v10;
          os_log_type_t v2 = v9;
          __os_log_helper_16_0_0(v8);
          _os_log_impl(&dword_224ECB000, v1, v2, "Failed to create keybag", v8, 2u);
        }
        objc_storeStrong(&v10, 0);
      }
    }
    objc_storeStrong(&v14, 0);
  }
  else
  {
    location[0] = SUSUILog();
    os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      log = location[0];
      os_log_type_t type = v16;
      __os_log_helper_16_0_0(v15);
      _os_log_impl(&dword_224ECB000, log, type, "No secret provided", v15, 2u);
    }
    objc_storeStrong(location, 0);
  }
}

unsigned char *__os_log_helper_16_0_0(unsigned char *result)
{
  *result = 0;
  result[1] = 0;
  return result;
}

void SUSUICreateInstallationKeybagWithSecretAndHandler(void *a1, void *a2)
{
  id location = 0;
  objc_storeStrong(&location, a1);
  id v11 = 0;
  objc_storeStrong(&v11, a2);
  queue = dispatch_get_global_queue(21, 0);
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = __SUSUICreateInstallationKeybagWithSecretAndHandler_block_invoke;
  v8 = &unk_26470AC18;
  id v9 = location;
  id v10 = v11;
  dispatch_async(queue, &v4);

  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&location, 0);
}

void __SUSUICreateInstallationKeybagWithSecretAndHandler_block_invoke(void *a1)
{
  location[2] = a1;
  location[1] = a1;
  if (!a1[4] && a1[5])
  {
    location[0] = SUSUILog();
    os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      log = location[0];
      os_log_type_t type = v21;
      __os_log_helper_16_0_0(v20);
      _os_log_impl(&dword_224ECB000, log, type, "No secret provided", v20, 2u);
    }
    objc_storeStrong(location, 0);
    (*(void (**)(void))(a1[5] + 16))();
  }
  id v19 = objc_alloc_init(SUSUIControllerClient);
  if (v19)
  {
    if ([v19 createKeybagWithSecret:a1[4]])
    {
      id v18 = SUSUILog();
      os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = v18;
        os_log_type_t v6 = v17;
        __os_log_helper_16_0_0(v16);
        _os_log_impl(&dword_224ECB000, v5, v6, "Successfully created keybag", v16, 2u);
      }
      objc_storeStrong(&v18, 0);
      if (a1[5]) {
        (*(void (**)(void))(a1[5] + 16))();
      }
    }
    else
    {
      id v15 = SUSUILog();
      os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
      {
        int v3 = v15;
        os_log_type_t v4 = v14;
        __os_log_helper_16_0_0(v13);
        _os_log_impl(&dword_224ECB000, v3, v4, "Failed to create keybag", v13, 2u);
      }
      objc_storeStrong(&v15, 0);
      if (a1[5]) {
        (*(void (**)(void))(a1[5] + 16))();
      }
    }
  }
  else
  {
    id v12 = SUSUILog();
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
    {
      int v1 = v12;
      os_log_type_t v2 = v11;
      __os_log_helper_16_0_0(v10);
      _os_log_impl(&dword_224ECB000, v1, v2, "Failed to create SUSUIControllerClient", v10, 2u);
    }
    objc_storeStrong(&v12, 0);
    if (a1[5]) {
      (*(void (**)(void))(a1[5] + 16))();
    }
  }
  objc_storeStrong(&v19, 0);
}

void SUSUIGetPasscodePolicy(id obj)
{
  id location = 0;
  objc_storeStrong(&location, obj);
  if (location)
  {
    queue = dispatch_get_global_queue(21, 0);
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    int v5 = __SUSUIGetPasscodePolicy_block_invoke;
    os_log_type_t v6 = &unk_26470AC68;
    id v7 = location;
    dispatch_async(queue, &v2);

    objc_storeStrong(&v7, 0);
    int v8 = 0;
  }
  else
  {
    int v8 = 1;
  }
  objc_storeStrong(&location, 0);
}

void __SUSUIGetPasscodePolicy_block_invoke(id *a1)
{
  v14[2] = a1;
  v14[1] = a1;
  v14[0] = objc_alloc_init(SUSUIControllerClient);
  if (v14[0])
  {
    id v3 = v14[0];
    uint64_t v8 = MEMORY[0x263EF8330];
    int v9 = -1073741824;
    int v10 = 0;
    os_log_type_t v11 = __SUSUIGetPasscodePolicy_block_invoke_2;
    id v12 = &unk_26470AC40;
    id v13 = a1[4];
    [v3 getPasscodePolicy:&v8];
    objc_storeStrong(&v13, 0);
  }
  else
  {
    os_log_t oslog = (os_log_t)SUSUILog();
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      log = oslog;
      os_log_type_t v2 = type;
      __os_log_helper_16_0_0(v5);
      _os_log_impl(&dword_224ECB000, log, v2, "Failed to create SUSUIControllerClient, returning NotRequired", v5, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    (*((void (**)(void))a1[4] + 2))();
  }
  objc_storeStrong(v14, 0);
}

uint64_t __SUSUIGetPasscodePolicy_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __os_log_helper_16_0_1_4_0(uint64_t result, int a2)
{
  *(unsigned char *)result = 0;
  *(unsigned char *)(result + 1) = 1;
  *(unsigned char *)(result + 2) = 0;
  *(unsigned char *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  return result;
}

uint64_t __os_log_helper_16_0_1_8_0(uint64_t result, uint64_t a2)
{
  *(unsigned char *)result = 0;
  *(unsigned char *)(result + 1) = 1;
  *(unsigned char *)(result + 2) = 0;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

uint64_t __os_log_helper_16_2_1_8_64(uint64_t result, uint64_t a2)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 1;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

void sub_224ED1574()
{
  _Unwind_Resume(v0);
}

uint64_t suPasscodePolicyToSUSUIPasscodePolicyType(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      return 0;
    case 1:
      return 1;
    case 2:
      return 2;
  }
  return v2;
}

void sub_224ED35F8()
{
  _Unwind_Resume(v0);
}

void __SUSUIPreferencesChanged(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v16 = a1;
  uint64_t v15 = a2;
  uint64_t v14 = a3;
  uint64_t v13 = a4;
  uint64_t v12 = a5;
  int v5 = MEMORY[0x263EF83A0];
  uint64_t block = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  int v9 = ____SUSUIPreferencesChanged_block_invoke;
  int v10 = &__block_descriptor_40_e5_v8__0l;
  uint64_t v11 = v15;
  dispatch_async(v5, &block);
}

void __SUSUILog_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)SUSUISubsystem, "Common");
  int v1 = (void *)SUSUILog___instance;
  SUSUILog___instance = (uint64_t)v0;
}

id SUSUILogAuthenticationUI()
{
  predicate = (dispatch_once_t *)&SUSUILogAuthenticationUI___once;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &__block_literal_global_3);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  os_log_t v0 = (void *)SUSUILogAuthenticationUI___instance;

  return v0;
}

void __SUSUILogAuthenticationUI_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)SUSUISubsystem, "AuthenticationUI");
  int v1 = (void *)SUSUILogAuthenticationUI___instance;
  SUSUILogAuthenticationUI___instance = (uint64_t)v0;
}

id SUSUILogEmergencyCallUI()
{
  predicate = (dispatch_once_t *)&SUSUILogEmergencyCallUI___once;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &__block_literal_global_6);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  os_log_t v0 = (void *)SUSUILogEmergencyCallUI___instance;

  return v0;
}

void __SUSUILogEmergencyCallUI_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)SUSUISubsystem, "EmergencyCall");
  int v1 = (void *)SUSUILogEmergencyCallUI___instance;
  SUSUILogEmergencyCallUI___instance = (uint64_t)v0;
}

id SUSUILogKeybagInterface()
{
  predicate = (dispatch_once_t *)&SUSUILogKeybagInterface___once;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &__block_literal_global_9);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  os_log_t v0 = (void *)SUSUILogKeybagInterface___instance;

  return v0;
}

void __SUSUILogKeybagInterface_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)SUSUISubsystem, "Keybag");
  int v1 = (void *)SUSUILogKeybagInterface___instance;
  SUSUILogKeybagInterface___instance = (uint64_t)v0;
}

id SUSUILogPostUpdateAlert()
{
  predicate = (dispatch_once_t *)&SUSUILogPostUpdateAlert___once;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &__block_literal_global_12);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  os_log_t v0 = (void *)SUSUILogPostUpdateAlert___instance;

  return v0;
}

void __SUSUILogPostUpdateAlert_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)SUSUISubsystem, "PostUpdateAlert");
  int v1 = (void *)SUSUILogPostUpdateAlert___instance;
  SUSUILogPostUpdateAlert___instance = (uint64_t)v0;
}

id SUSUILogLaggardsUI()
{
  predicate = (dispatch_once_t *)&SUSUILogLaggardsUI___once;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &__block_literal_global_15);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  os_log_t v0 = (void *)SUSUILogLaggardsUI___instance;

  return v0;
}

void __SUSUILogLaggardsUI_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)SUSUISubsystem, "LaggardsUI");
  int v1 = (void *)SUSUILogLaggardsUI___instance;
  SUSUILogLaggardsUI___instance = (uint64_t)v0;
}

id SUSUILogExtension()
{
  predicate = (dispatch_once_t *)&SUSUILogExtension___once;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &__block_literal_global_18);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  os_log_t v0 = (void *)SUSUILogExtension___instance;

  return v0;
}

void __SUSUILogExtension_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)SUSUISubsystem, "Extension");
  int v1 = (void *)SUSUILogExtension___instance;
  SUSUILogExtension___instance = (uint64_t)v0;
}

uint64_t __os_log_helper_16_2_2_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x270F10758]();
}

uint64_t BSSettingFlagForBool()
{
  return MEMORY[0x270F10940]();
}

uint64_t BSSettingFlagIsYes()
{
  return MEMORY[0x270F10948]();
}

uint64_t BYSetupAssistantNeedsToRun()
{
  return MEMORY[0x270F5D218]();
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

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

uint64_t GSSendAppPreferencesChanged()
{
  return MEMORY[0x270F30690]();
}

uint64_t MKBGetDeviceLockStateInfo()
{
  return MEMORY[0x270F4AE50]();
}

uint64_t MKBLockDeviceNow()
{
  return MEMORY[0x270F4AEB0]();
}

uint64_t MKBUnlockDevice()
{
  return MEMORY[0x270F4AEB8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}