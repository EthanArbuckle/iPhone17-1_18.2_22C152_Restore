_UNKNOWN **ACCSQLiteJournalSuffixes()
{
  return &off_5A708;
}

id acc_userDefaults_BOOLForKey(uint64_t a1)
{
  v2 = +[ACCUserDefaults sharedDefaults];
  id v3 = [v2 BOOLForKey:a1];

  return v3;
}

uint64_t acc_userDefaults_copyStringForKey(uint64_t a1)
{
  v2 = +[ACCUserDefaults sharedDefaults];
  uint64_t v3 = [v2 stringForKey:a1];

  return v3;
}

uint64_t acc_userDefaults_copyArrayForKey(uint64_t a1)
{
  v2 = +[ACCUserDefaults sharedDefaults];
  uint64_t v3 = [v2 arrayForKey:a1];

  return v3;
}

uint64_t acc_userDefaults_copyDictionaryForKey(uint64_t a1)
{
  v2 = +[ACCUserDefaults sharedDefaults];
  uint64_t v3 = [v2 dictionaryForKey:a1];

  return v3;
}

id acc_userDefaults_copyIntegerForKey(uint64_t a1)
{
  v2 = +[ACCUserDefaults sharedDefaults];
  id v3 = [v2 integerForKey:a1];

  return v3;
}

double acc_userDefaults_copyDoubleForKey(uint64_t a1)
{
  v2 = +[ACCUserDefaults sharedDefaults];
  [v2 doubleForKey:a1];
  double v4 = v3;

  return v4;
}

void acc_userDefaults_setArrayForKey(uint64_t a1, uint64_t a2)
{
  id v4 = +[ACCUserDefaults sharedDefaults];
  [v4 setObject:a2 forKey:a1];
}

void acc_userDefaults_setIntegerForKey(uint64_t a1, uint64_t a2)
{
  id v4 = +[ACCUserDefaults sharedDefaults];
  [v4 setInteger:a2 forKey:a1];
}

void acc_userDefaults_setDoubleForKey(uint64_t a1, double a2)
{
  id v4 = +[ACCUserDefaults sharedDefaults];
  [v4 setDouble:a1 forKey:a2];
}

id acc_userDefaultsIapd_BOOLForKey(uint64_t a1)
{
  v2 = +[ACCUserDefaults sharedDefaultsIapd];
  id v3 = [v2 BOOLForKey:a1];

  return v3;
}

uint64_t acc_userDefaultsIapd_copyStringForKey(uint64_t a1)
{
  v2 = +[ACCUserDefaults sharedDefaultsIapd];
  uint64_t v3 = [v2 stringForKey:a1];

  return v3;
}

uint64_t acc_userDefaultsIapd_copyArrayForKey(uint64_t a1)
{
  v2 = +[ACCUserDefaults sharedDefaultsIapd];
  uint64_t v3 = [v2 arrayForKey:a1];

  return v3;
}

uint64_t acc_userDefaultsIapd_copyDictionaryForKey(uint64_t a1)
{
  v2 = +[ACCUserDefaults sharedDefaultsIapd];
  uint64_t v3 = [v2 dictionaryForKey:a1];

  return v3;
}

id acc_userDefaultsIapd_copyIntegerForKey(uint64_t a1)
{
  v2 = +[ACCUserDefaults sharedDefaultsIapd];
  id v3 = [v2 integerForKey:a1];

  return v3;
}

double acc_userDefaultsIapd_copyDoubleForKey(uint64_t a1)
{
  v2 = +[ACCUserDefaults sharedDefaultsIapd];
  [v2 doubleForKey:a1];
  double v4 = v3;

  return v4;
}

id acc_userDefaultsLogging_BOOLForKey(uint64_t a1)
{
  v2 = +[ACCUserDefaults sharedDefaultsLogging];
  id v3 = [v2 BOOLForKey:a1];

  return v3;
}

id acc_userNotifications_generateIdentifier(uint64_t a1, uint64_t a2)
{
  id v3 = 0;
  if (a1 && a2)
  {
    id v3 = +[NSString stringWithFormat:@"%@_%@", a1, a2];
    uint64_t v2 = vars8;
  }
  return v3;
}

ACCUserNotification *acc_userNotifications_accessoryNotSupported()
{
  v0 = objc_alloc_init(ACCUserNotification);
  [(ACCUserNotification *)v0 setType:2];
  v1 = acc_strings_bundle();
  uint64_t v2 = [v1 localizedStringForKey:@"Accessory Not Supported" value:&stru_51F10 table:0];
  [(ACCUserNotification *)v0 setTitle:v2];

  id v3 = acc_strings_bundle();
  double v4 = [v3 localizedStringForKey:@"This accessory is not supported by this device." value:&stru_51F10 table:0];
  [(ACCUserNotification *)v0 setMessage:v4];

  [(ACCUserNotification *)v0 setIsModal:0];
  [(ACCUserNotification *)v0 setPresentViaSystemAperture:1];

  return v0;
}

ACCUserNotification *acc_userNotifications_chargingNotSupported()
{
  v0 = objc_alloc_init(ACCUserNotification);
  [(ACCUserNotification *)v0 setType:2];
  v1 = acc_strings_bundle();
  uint64_t v2 = [v1 localizedStringForKey:@"Charging Not Supported" value:&stru_51F10 table:0];
  [(ACCUserNotification *)v0 setTitle:v2];

  id v3 = acc_strings_bundle();
  double v4 = [v3 localizedStringForKey:@"Charging with this accessory is not supported by Apple Device." value:&stru_51F10 table:0];
  [(ACCUserNotification *)v0 setMessage:v4];

  v5 = acc_strings_bundle();
  v6 = [v5 localizedStringForKey:@"Dismiss" value:&stru_51F10 table:0];
  [(ACCUserNotification *)v0 setDefaultButtonName:v6];

  [(ACCUserNotification *)v0 setIsModal:0];

  return v0;
}

ACCUserNotification *acc_userNotifications_unlockToUseAccessories()
{
  v0 = objc_alloc_init(ACCUserNotification);
  [(ACCUserNotification *)v0 setType:2];
  v1 = acc_strings_bundle();
  uint64_t v2 = [v1 localizedStringForKey:@"Accessory Connected" value:&stru_51F10 table:0];
  [(ACCUserNotification *)v0 setTitle:v2];

  id v3 = acc_strings_bundle();
  double v4 = [v3 localizedStringForKey:@"Unlock %@ to use accessories" value:&stru_51F10 table:0];
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, systemInfo_copyDeviceClass());
  [(ACCUserNotification *)v0 setMessage:v5];

  [(ACCUserNotification *)v0 setIsModal:0];
  [(ACCUserNotification *)v0 setDismissOnUnlock:1];
  [(ACCUserNotification *)v0 setIgnoreQuietMode:1];
  [(ACCUserNotification *)v0 setSystemSoundID:&off_5A798];

  return v0;
}

ACCUserNotification *acc_userNotifications_disabledHSAID()
{
  v0 = objc_alloc_init(ACCUserNotification);
  [(ACCUserNotification *)v0 setType:1];
  v1 = acc_strings_bundle();
  uint64_t v2 = [v1 localizedStringForKey:@"Serial Boot-Arg Detected" value:&stru_51F10 table:0];
  [(ACCUserNotification *)v0 setTitle:v2];

  id v3 = acc_strings_bundle();
  double v4 = [v3 localizedStringForKey:@"There are known compatibility issues with the 'serial' boot-arg and Smart Connector accessories, even for those not using HSAID. Please disable the 'serial' boot-arg when using Smart Connector accessories.", &stru_51F10, 0 value table];
  [(ACCUserNotification *)v0 setMessage:v4];

  [(ACCUserNotification *)v0 setIsModal:0];

  return v0;
}

void sub_A2C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_B154(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_B430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
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

void sub_C060(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  objc_destroyWeak(v25);
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a25, 8);
  objc_destroyWeak((id *)(v26 - 112));
  _Unwind_Resume(a1);
}

void sub_C60C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_C9F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id _platform()
{
  v0 = (void *)MGCopyAnswer();

  return v0;
}

id _productVersion()
{
  v0 = (void *)MGCopyAnswer();

  return v0;
}

id _modelNumber()
{
  v0 = (void *)MGCopyAnswer();

  return v0;
}

id _productType()
{
  v0 = (void *)MGCopyAnswer();

  return v0;
}

void sub_D880(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void ___isDeviceAnalyticsEnabled_block_invoke(id a1)
{
  _isDeviceAnalyticsEnabled_dataCollectionEnabled = DiagnosticLogSubmissionEnabled();
}

CFStringRef CFCreateUUIDString()
{
  CFUUIDRef v0 = CFUUIDCreate(kCFAllocatorDefault);
  CFStringRef v1 = CFUUIDCreateString(kCFAllocatorDefault, v0);
  if (v0) {
    CFRelease(v0);
  }
  return v1;
}

CFStringRef CFArrayCreateRawValuesString(const __CFArray *a1, int a2)
{
  CFMutableStringRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0);
  CFStringAppend(Mutable, @"{\n");
  v5.length = CFArrayGetCount(a1);
  if (a2) {
    v6 = (void (__cdecl *)(const void *, void *))_CFArraySetPrintRawValuesApplierFunctionHex;
  }
  else {
    v6 = (void (__cdecl *)(const void *, void *))_CFArraySetPrintRawValuesApplierFunctionDecimal;
  }
  v5.location = 0;
  CFArrayApplyFunction(a1, v5, v6, Mutable);
  CFStringAppend(Mutable, @"}");
  CFStringRef Copy = CFStringCreateCopy(kCFAllocatorDefault, Mutable);
  if (Mutable) {
    CFRelease(Mutable);
  }
  return Copy;
}

void _CFArraySetPrintRawValuesApplierFunctionHex(uint64_t a1, CFMutableStringRef theString)
{
}

void _CFArraySetPrintRawValuesApplierFunctionDecimal(uint64_t a1, CFMutableStringRef theString)
{
}

CFStringRef CFSetCreateRawValuesString(const __CFSet *a1, int a2)
{
  CFMutableStringRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0);
  CFStringAppend(Mutable, @"{\n");
  if (a2) {
    CFRange v5 = (void (__cdecl *)(const void *, void *))_CFArraySetPrintRawValuesApplierFunctionHex;
  }
  else {
    CFRange v5 = (void (__cdecl *)(const void *, void *))_CFArraySetPrintRawValuesApplierFunctionDecimal;
  }
  CFSetApplyFunction(a1, v5, Mutable);
  CFStringAppend(Mutable, @"}");
  CFStringRef Copy = CFStringCreateCopy(kCFAllocatorDefault, Mutable);
  if (Mutable) {
    CFRelease(Mutable);
  }
  return Copy;
}

CFStringRef CFDictCreateRawKeyValueString(const __CFDictionary *a1, int a2)
{
  CFMutableStringRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0);
  CFStringAppend(Mutable, @"{\n");
  if (a2) {
    CFRange v5 = (void (__cdecl *)(const void *, const void *, void *))_CFDictPrintRawKeyValueApplierFunctionHex;
  }
  else {
    CFRange v5 = (void (__cdecl *)(const void *, const void *, void *))_CFDictPrintRawKeyValueApplierFunctionDecimal;
  }
  CFDictionaryApplyFunction(a1, v5, Mutable);
  CFStringAppend(Mutable, @"}");
  CFStringRef Copy = CFStringCreateCopy(kCFAllocatorDefault, Mutable);
  if (Mutable) {
    CFRelease(Mutable);
  }
  return Copy;
}

void _CFDictPrintRawKeyValueApplierFunctionHex(uint64_t a1, uint64_t a2, CFMutableStringRef theString)
{
  CFStringAppendFormat(theString, 0, @"\t%p = %p;\n", a1, a2);
}

void _CFDictPrintRawKeyValueApplierFunctionDecimal(uint64_t a1, uint64_t a2, CFMutableStringRef theString)
{
  CFStringAppendFormat(theString, 0, @"\t%lu = %lu;\n", a1, a2);
}

__CFString *CFStringCreateFromCFData(const __CFData *a1, const __CFString *a2)
{
  if (!a1) {
    return &stru_51F10;
  }
  BytePtr = CFDataGetBytePtr(a1);
  CFIndex Length = CFDataGetLength(a1);
  CFMutableStringRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0);
  if (Length >= 1)
  {
    do
    {
      unsigned int v7 = *BytePtr++;
      CFStringAppendFormat(Mutable, 0, a2, v7);
      --Length;
    }
    while (Length);
  }
  CFStringRef Copy = CFStringCreateCopy(kCFAllocatorDefault, Mutable);
  if (Mutable) {
    CFRelease(Mutable);
  }
  return (__CFString *)Copy;
}

CFStringRef CFStringCreateFromFormat(uint64_t a1, const __CFString *a2)
{
  CFMutableStringRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0);
  CFStringAppendFormat(Mutable, 0, a2, a1);
  CFStringRef Copy = CFStringCreateCopy(kCFAllocatorDefault, Mutable);
  if (Mutable) {
    CFRelease(Mutable);
  }
  return Copy;
}

CFSetRef CFDictionaryGetKeys(const __CFDictionary *a1, int a2)
{
  if (!a1) {
    return 0;
  }
  id v3 = a2 ? &kCFTypeSetCallBacks : 0;
  CFMutableSetRef Mutable = CFSetCreateMutable(kCFAllocatorDefault, 0, v3);
  if (!Mutable) {
    return 0;
  }
  CFSetRef v5 = Mutable;
  CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)CFDictionaryApplierFunction_addKeyToMutableSet, Mutable);
  CFSetRef Copy = CFSetCreateCopy(kCFAllocatorDefault, v5);
  CFRelease(v5);
  return Copy;
}

void CFDictionaryApplierFunction_addKeyToMutableSet(void *value, int a2, CFMutableSetRef theSet)
{
  if (value)
  {
    if (theSet) {
      CFSetAddValue(theSet, value);
    }
  }
}

char *createCStringFromCFString(const __CFString *a1, CFStringEncoding a2)
{
  CFIndex bufferSize = 0;
  if (!a1) {
    return 0;
  }
  v9.length = CFStringGetLength(a1);
  v9.location = 0;
  CFStringGetBytes(a1, v9, 0x8000100u, 0, 0, 0, 0, &bufferSize);
  double v4 = (char *)malloc_type_malloc(++bufferSize, 0x4FF45A26uLL);
  int CString = CFStringGetCString(a1, v4, bufferSize, a2);
  if (v4) {
    BOOL v6 = CString == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    free(v4);
    return 0;
  }
  return v4;
}

void CFDictionaryApplierFunction_addValueToMutableDictionary(void *key, void *value, CFMutableDictionaryRef theDict)
{
  if (key)
  {
    if (theDict) {
      CFDictionaryAddValue(theDict, key, value);
    }
  }
}

void CFDictionaryApplierFunction_setValueInMutableDictionary(void *key, void *value, CFMutableDictionaryRef theDict)
{
  if (key)
  {
    if (theDict) {
      CFDictionarySetValue(theDict, key, value);
    }
  }
}

void CFSetApplierFunction_removeValueFromMutableDictionary(void *key, CFMutableDictionaryRef theDict)
{
}

void executeOnMainThreadSync(uint64_t a1)
{
  if (pthread_main_np())
  {
    uint64_t v2 = *(void (**)(uint64_t))(a1 + 16);
    v2(a1);
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = __executeOnMainThreadSync_block_invoke;
    block[3] = &unk_512F0;
    block[4] = a1;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

uint64_t __executeOnMainThreadSync_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void executeOnMainThreadAsync(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = __executeOnMainThreadAsync_block_invoke;
  block[3] = &unk_51318;
  block[4] = a1;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t __executeOnMainThreadAsync_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void init_logging_modules(uint64_t a1, char a2, uint64_t a3)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = __init_logging_modules_block_invoke;
  block[3] = &__block_descriptor_tmp_0;
  char v4 = a2;
  block[4] = a3;
  void block[5] = a1;
  if (init_logging_modules_onceToken != -1) {
    dispatch_once(&init_logging_modules_onceToken, block);
  }
}

void __init_logging_modules_block_invoke(uint64_t a1)
{
  uint64_t v2 = "0:8^{sqlite3=}16";
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    int v5 = 0;
    do
    {
      uint64_t v6 = *(void *)(a1 + 32);
      unsigned int v7 = *(const char **)(v6 + v3);
      if (!v7)
      {
        unsigned int v7 = "<Undefined>";
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v12) = v4;
          _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Subsystem missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
          uint64_t v6 = *(void *)(a1 + 32);
          unsigned int v7 = "<Undefined>";
        }
      }
      v8 = *(const char **)(v6 + v3 + 8);
      if (!v8)
      {
        v8 = "<Undefined>";
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          __init_logging_modules_block_invoke_cold_1(v15, v4, &v16);
          v8 = "<Undefined>";
        }
      }
      os_log_t v9 = os_log_create(v7, v8);
      *(void *)(*(void *)(a1 + 40) + 8 * v4) = v9;
      if (v9)
      {
        ++v5;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v12 = v7;
          __int16 v13 = 2080;
          uint64_t v14 = v8;
          _os_log_debug_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Created log object %s: %s", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v12 = v7;
        __int16 v13 = 2080;
        uint64_t v14 = v8;
        _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to create os_log_t object %s: %s!", buf, 0x16u);
      }
      ++v4;
      unint64_t v10 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16;
    }
    while (v4 < v10);
    uint64_t v2 = "v24@0:8^{sqlite3=}16" + 4;
  }
  else
  {
    LODWORD(v10) = 0;
    int v5 = 0;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = *((void *)v2 + 289);
    LODWORD(v12) = v5;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Created %d log object(s)!", buf, 8u);
    LODWORD(v10) = *(unsigned __int8 *)(a1 + 48);
  }
  gLogObjects = *(void *)(a1 + 40);
  gNumLogObjects = v10;
}

CFNumberRef acc_analytics_createBucketizedAnalyticEventDuration(unint64_t a1)
{
  if ((uint64_t)a1 > 299)
  {
    if (a1 > 0x258)
    {
      if (a1 > 0x708)
      {
        if (a1 > 0xE10)
        {
          if (a1 > 0x3840)
          {
            if (a1 > 0xA8C0)
            {
              if (a1 > 0x15180)
              {
                if (a1 > 0x3F480)
                {
                  if (a1 > 0x93A80) {
                    char v1 = 10;
                  }
                  else {
                    char v1 = 9;
                  }
                }
                else
                {
                  char v1 = 8;
                }
              }
              else
              {
                char v1 = 7;
              }
            }
            else
            {
              char v1 = 6;
            }
          }
          else
          {
            char v1 = 5;
          }
        }
        else
        {
          char v1 = 4;
        }
      }
      else
      {
        char v1 = 3;
      }
    }
    else
    {
      char v1 = 2;
    }
  }
  else
  {
    char v1 = 1;
  }
  char valuePtr = v1;
  return CFNumberCreate(kCFAllocatorDefault, kCFNumberCharType, &valuePtr);
}

CFNumberRef acc_analytics_createBucketizedUnlockDialogAnalyticEventTime(unint64_t a1)
{
  if ((uint64_t)a1 > 3599)
  {
    if (a1 > 0x1518)
    {
      if (a1 > 0x1C20)
      {
        if (a1 > 0x2A30)
        {
          if (a1 > 0x3840)
          {
            if (a1 > 0x7080)
            {
              if (a1 > 0xA8C0)
              {
                if (a1 > 0x15180)
                {
                  if (a1 > 0x3F480) {
                    char v1 = 10;
                  }
                  else {
                    char v1 = 9;
                  }
                }
                else
                {
                  char v1 = 8;
                }
              }
              else
              {
                char v1 = 7;
              }
            }
            else
            {
              char v1 = 6;
            }
          }
          else
          {
            char v1 = 5;
          }
        }
        else
        {
          char v1 = 4;
        }
      }
      else
      {
        char v1 = 3;
      }
    }
    else
    {
      char v1 = 2;
    }
  }
  else
  {
    char v1 = 1;
  }
  char valuePtr = v1;
  return CFNumberCreate(kCFAllocatorDefault, kCFNumberCharType, &valuePtr);
}

CFNumberRef acc_analytics_createBucketizedWiredAuthDuration(unint64_t a1)
{
  if (a1 > 0x1F3)
  {
    if (a1 > 0x3E8)
    {
      if (a1 > 0x5DC)
      {
        if (a1 > 0x7D0)
        {
          if (a1 > 0x1388)
          {
            if (a1 > 0x2710)
            {
              if (a1 > 0x3A98)
              {
                if (a1 > 0x4E20)
                {
                  if (a1 > 0x7530) {
                    char v1 = 10;
                  }
                  else {
                    char v1 = 9;
                  }
                }
                else
                {
                  char v1 = 8;
                }
              }
              else
              {
                char v1 = 7;
              }
            }
            else
            {
              char v1 = 6;
            }
          }
          else
          {
            char v1 = 5;
          }
        }
        else
        {
          char v1 = 4;
        }
      }
      else
      {
        char v1 = 3;
      }
    }
    else
    {
      char v1 = 2;
    }
  }
  else
  {
    char v1 = 1;
  }
  char valuePtr = v1;
  return CFNumberCreate(kCFAllocatorDefault, kCFNumberCharType, &valuePtr);
}

CFNumberRef acc_analytics_createBucketizedInductiveAuthDuration(unint64_t a1)
{
  if (a1 > 0xE)
  {
    if (a1 > 0x1E)
    {
      if (a1 > 0x2D)
      {
        if (a1 > 0x3C)
        {
          if (a1 > 0x5A)
          {
            if (a1 > 0x78)
            {
              if (a1 > 0x96)
              {
                if (a1 > 0xB4)
                {
                  if (a1 > 0xFA) {
                    char v1 = 10;
                  }
                  else {
                    char v1 = 9;
                  }
                }
                else
                {
                  char v1 = 8;
                }
              }
              else
              {
                char v1 = 7;
              }
            }
            else
            {
              char v1 = 6;
            }
          }
          else
          {
            char v1 = 5;
          }
        }
        else
        {
          char v1 = 4;
        }
      }
      else
      {
        char v1 = 3;
      }
    }
    else
    {
      char v1 = 2;
    }
  }
  else
  {
    char v1 = 1;
  }
  char valuePtr = v1;
  return CFNumberCreate(kCFAllocatorDefault, kCFNumberCharType, &valuePtr);
}

CFNumberRef acc_analytics_createBucketizedBatteryChargeLevel(unsigned int a1)
{
  if ((int)a1 > 9)
  {
    if (a1 > 0x14)
    {
      if (a1 > 0x1E)
      {
        if (a1 > 0x28)
        {
          if (a1 > 0x32)
          {
            if (a1 > 0x3C)
            {
              if (a1 > 0x46)
              {
                if (a1 > 0x50)
                {
                  if (a1 > 0x5A) {
                    char v1 = 10;
                  }
                  else {
                    char v1 = 9;
                  }
                }
                else
                {
                  char v1 = 8;
                }
              }
              else
              {
                char v1 = 7;
              }
            }
            else
            {
              char v1 = 6;
            }
          }
          else
          {
            char v1 = 5;
          }
        }
        else
        {
          char v1 = 4;
        }
      }
      else
      {
        char v1 = 3;
      }
    }
    else
    {
      char v1 = 2;
    }
  }
  else
  {
    char v1 = 1;
  }
  char valuePtr = v1;
  return CFNumberCreate(kCFAllocatorDefault, kCFNumberCharType, &valuePtr);
}

CFNumberRef acc_analytics_createBucketizedBatteryChargeDelta(int a1)
{
  if (a1 > -90)
  {
    if (a1 > -80)
    {
      if (a1 > -70)
      {
        if (a1 > -60)
        {
          if (a1 > -50)
          {
            if (a1 > -40)
            {
              if (a1 > -30)
              {
                if (a1 > -20)
                {
                  if (a1 > -10)
                  {
                    if (a1 <= 0)
                    {
                      char v1 = 10;
                    }
                    else if (a1 > 0xA)
                    {
                      if (a1 > 0x14)
                      {
                        if (a1 > 0x1E)
                        {
                          if (a1 > 0x28)
                          {
                            if (a1 > 0x32)
                            {
                              if (a1 > 0x3C)
                              {
                                if (a1 > 0x46)
                                {
                                  if (a1 > 0x50)
                                  {
                                    if (a1 > 0x5A) {
                                      char v1 = 20;
                                    }
                                    else {
                                      char v1 = 19;
                                    }
                                  }
                                  else
                                  {
                                    char v1 = 18;
                                  }
                                }
                                else
                                {
                                  char v1 = 17;
                                }
                              }
                              else
                              {
                                char v1 = 16;
                              }
                            }
                            else
                            {
                              char v1 = 15;
                            }
                          }
                          else
                          {
                            char v1 = 14;
                          }
                        }
                        else
                        {
                          char v1 = 13;
                        }
                      }
                      else
                      {
                        char v1 = 12;
                      }
                    }
                    else
                    {
                      char v1 = 11;
                    }
                  }
                  else
                  {
                    char v1 = 9;
                  }
                }
                else
                {
                  char v1 = 8;
                }
              }
              else
              {
                char v1 = 7;
              }
            }
            else
            {
              char v1 = 6;
            }
          }
          else
          {
            char v1 = 5;
          }
        }
        else
        {
          char v1 = 4;
        }
      }
      else
      {
        char v1 = 3;
      }
    }
    else
    {
      char v1 = 2;
    }
  }
  else
  {
    char v1 = 1;
  }
  char valuePtr = v1;
  return CFNumberCreate(kCFAllocatorDefault, kCFNumberCharType, &valuePtr);
}

CFNumberRef acc_analytics_createBucketizeBatteryPackConnectionDuration(unint64_t a1)
{
  if (a1 > 0x1B773F)
  {
    if (a1 > 0x36F267)
    {
      if (a1 > 0x6DE0E7)
      {
        if (a1 > 0xDBBDE7)
        {
          if (a1 > 0x1B777E7)
          {
            if (a1 > 0x29331E7)
            {
              if (a1 > 0x5265FE7)
              {
                if (a1 > 0xF7317E7)
                {
                  if (a1 > 0x240C87E7) {
                    char v1 = 10;
                  }
                  else {
                    char v1 = 9;
                  }
                }
                else
                {
                  char v1 = 8;
                }
              }
              else
              {
                char v1 = 7;
              }
            }
            else
            {
              char v1 = 6;
            }
          }
          else
          {
            char v1 = 5;
          }
        }
        else
        {
          char v1 = 4;
        }
      }
      else
      {
        char v1 = 3;
      }
    }
    else
    {
      char v1 = 2;
    }
  }
  else
  {
    char v1 = 1;
  }
  char valuePtr = v1;
  return CFNumberCreate(kCFAllocatorDefault, kCFNumberCharType, &valuePtr);
}

CFNumberRef acc_analytics_createBucketizePowerSourceChargingTime(unint64_t a1)
{
  if (a1 > 0x3E7)
  {
    if (a1 > 0xDBB9F)
    {
      if (a1 > 0x1B7B27)
      {
        if (a1 > 0x36F267)
        {
          if (a1 > 0x6DE0E7)
          {
            if (a1 > 0xDBBDE7)
            {
              if (a1 > 0x1B777E7)
              {
                if (a1 > 0x29331E7)
                {
                  if (a1 > 0x5265FE7)
                  {
                    if (a1 > 0xF7317E7)
                    {
                      if (a1 > 0x240C87E7) {
                        char v1 = 12;
                      }
                      else {
                        char v1 = 11;
                      }
                    }
                    else
                    {
                      char v1 = 10;
                    }
                  }
                  else
                  {
                    char v1 = 9;
                  }
                }
                else
                {
                  char v1 = 8;
                }
              }
              else
              {
                char v1 = 7;
              }
            }
            else
            {
              char v1 = 6;
            }
          }
          else
          {
            char v1 = 5;
          }
        }
        else
        {
          char v1 = 4;
        }
      }
      else
      {
        char v1 = 3;
      }
    }
    else
    {
      char v1 = 2;
    }
  }
  else
  {
    char v1 = 1;
  }
  char valuePtr = v1;
  return CFNumberCreate(kCFAllocatorDefault, kCFNumberCharType, &valuePtr);
}

void __38__ueaPluginSystemSettingsMonitor_init__block_invoke(uint64_t a1)
{
  uint64_t v2 = +[NSNotificationCenter defaultCenter];
  [v2 addObserver:*(void *)(a1 + 32) selector:"airplaneModeOrBTSettingChanged:" name:ueaPluginSystemSettingsAirplaneModeChanged object:0];

  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:*(void *)(a1 + 32) selector:"airplaneModeOrBTSettingChanged:" name:ueaPluginSystemSettingsBluetoothSettomgChanged object:0];

  if (gLogObjects && gNumLogObjects >= 3)
  {
    unint64_t v4 = *(id *)(gLogObjects + 16);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init]();
    }
    unint64_t v4 = &_os_log_default;
    id v5 = &_os_log_default;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Registered for : airplaneMode and bluetooth setting change", buf, 2u);
  }

  if (gLogObjects && gNumLogObjects >= 3)
  {
    uint64_t v6 = *(id *)(gLogObjects + 16);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init]();
    }
    uint64_t v6 = &_os_log_default;
    id v7 = &_os_log_default;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Init _airplaneMode", v17, 2u);
  }

  v8 = objc_alloc_init(AirplaneMode);
  uint64_t v9 = *(void *)(a1 + 32);
  unint64_t v10 = *(void **)(v9 + 16);
  *(void *)(v9 + 16) = v8;

  if (gLogObjects && gNumLogObjects >= 3)
  {
    uint64_t v11 = *(id *)(gLogObjects + 16);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init]();
    }
    uint64_t v11 = &_os_log_default;
    id v12 = &_os_log_default;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v16 = 0;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Init _bluetoothSetting", v16, 2u);
  }

  __int16 v13 = objc_alloc_init(BluetoothSetting);
  uint64_t v14 = *(void *)(a1 + 32);
  v15 = *(void **)(v14 + 24);
  *(void *)(v14 + 24) = v13;
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0xEu);
}

uint64_t _serviceAdded(void *a1, io_iterator_t iterator)
{
  uint64_t result = IOIteratorNext(iterator);
  if (result)
  {
    uint64_t v5 = result;
    do
    {
      [a1 _handleServiceAdded:v5];
      IOObjectRelease(v5);
      uint64_t result = IOIteratorNext(iterator);
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

unint64_t systemInfo_getCurrentUnixTime()
{
  CFUUIDRef v0 = +[NSDate date];
  [v0 timeIntervalSince1970];
  double v2 = v1;

  unint64_t v3 = vcvtad_u64_f64(v2);
  if (v2 <= 0.0) {
    return 0;
  }
  else {
    return v3;
  }
}

unint64_t systemInfo_getCurrentUnixTimeMS()
{
  CFUUIDRef v0 = +[NSDate date];
  [v0 timeIntervalSince1970];
  double v2 = v1;

  unint64_t v3 = vcvtad_u64_f64(v2 * 1000.0);
  if (v2 <= 0.0) {
    return 0;
  }
  else {
    return v3;
  }
}

uint64_t systemInfo_isInternalBuild()
{
  if (systemInfo_isInternalBuild_onceToken != -1) {
    dispatch_once(&systemInfo_isInternalBuild_onceToken, &__block_literal_global_3);
  }
  return systemInfo_isInternalBuild_internalBuild;
}

void __systemInfo_isInternalBuild_block_invoke(id a1)
{
  systemInfo_isInternalBuild_internalBuild = MGGetBoolAnswer();
}

uint64_t systemInfo_isDeveloperBuild()
{
  if (systemInfo_isDeveloperBuild_onceToken != -1) {
    dispatch_once(&systemInfo_isDeveloperBuild_onceToken, &__block_literal_global_3);
  }
  return systemInfo_isDeveloperBuild_developerBuild;
}

void __systemInfo_isDeveloperBuild_block_invoke(id a1)
{
  double v1 = (const void *)MGCopyAnswer();
  if (v1)
  {
    double v2 = v1;
    systemInfo_isDeveloperBuild_developerBuild = CFEqual(v1, @"Beta") != 0;
    CFRelease(v2);
  }
  else
  {
    systemInfo_isDeveloperBuild_developerBuild = 0;
  }
}

uint64_t systemInfo_systemSupportsPearl()
{
  if (systemInfo_systemSupportsPearl_onceToken != -1) {
    dispatch_once(&systemInfo_systemSupportsPearl_onceToken, &__block_literal_global_11);
  }
  return systemInfo_systemSupportsPearl_supportsPearl;
}

void __systemInfo_systemSupportsPearl_block_invoke(id a1)
{
  systemInfo_systemSupportsPearl_supportsPearl = MGGetBoolAnswer();
}

uint64_t systemInfo_systemSupportsWAPI()
{
  if (systemInfo_systemSupportsWAPI_onceToken != -1) {
    dispatch_once(&systemInfo_systemSupportsWAPI_onceToken, &__block_literal_global_16);
  }
  return systemInfo_systemSupportsWAPI_supportsWAPI;
}

void __systemInfo_systemSupportsWAPI_block_invoke(id a1)
{
  systemInfo_systemSupportsWAPI_supportsWAPI = MGGetBoolAnswer();
}

uint64_t systemInfo_copyDeviceClass()
{
  return MGCopyAnswer();
}

id systemInfo_isHomePod()
{
  CFUUIDRef v0 = (void *)MGCopyAnswer();
  id v1 = [v0 isEqualToString:@"AudioAccessory"];

  return v1;
}

uint64_t systemInfo_copyRegionCode()
{
  if (systemInfo_copyRegionCode_onceToken != -1) {
    dispatch_once(&systemInfo_copyRegionCode_onceToken, &__block_literal_global_24);
  }
  if (systemInfo_copyRegionCode_regionCode)
  {
    CFTypeID v0 = CFGetTypeID((CFTypeRef)systemInfo_copyRegionCode_regionCode);
    if (v0 == CFStringGetTypeID()) {
      return systemInfo_copyRegionCode_regionCode;
    }
  }
  uint64_t result = 0;
  systemInfo_copyRegionCode_regionCode = 0;
  return result;
}

void __systemInfo_copyRegionCode_block_invoke(id a1)
{
  systemInfo_copyRegionCode_regionCode = MGCopyAnswer();
}

const void *systemInfo_copyProductType()
{
  uint64_t result = (const void *)MGCopyAnswer();
  if (result)
  {
    id v1 = result;
    CFTypeID v2 = CFGetTypeID(result);
    if (v2 == CFStringGetTypeID()) {
      return v1;
    }
    else {
      return 0;
    }
  }
  return result;
}

const void *systemInfo_copyProductVersion()
{
  uint64_t result = (const void *)MGCopyAnswer();
  if (result)
  {
    id v1 = result;
    CFTypeID v2 = CFGetTypeID(result);
    if (v2 == CFStringGetTypeID()) {
      return v1;
    }
    else {
      return 0;
    }
  }
  return result;
}

void sub_141FC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 88), 8);
  _Unwind_Resume(a1);
}

void init_logging()
{
}

void acc_restrictedMode_accessoryAttached()
{
  v1[0] = 1;
  int v0 = ACMKernelControl(34);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v1[0] = 67109120;
    v1[1] = v0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "acmStatus (accessoryAttached): %d", (uint8_t *)v1, 8u);
  }
}

void acc_restrictedMode_accessoryDetached()
{
  v1[0] = 1;
  int v0 = ACMKernelControl(37);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v1[0] = 67109120;
    v1[1] = v0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "acmStatus (accessoryDetached): %d", (uint8_t *)v1, 8u);
  }
}

id acc_strings_bundle()
{
  int v0 = (void *)acc_strings_bundle_bundle;
  if (!acc_strings_bundle_bundle)
  {
    uint64_t v1 = +[NSBundle bundleWithIdentifier:kACCIdentifiers_CoreAccessoriesBundleID];
    CFTypeID v2 = (void *)acc_strings_bundle_bundle;
    acc_strings_bundle_bundle = v1;

    int v0 = (void *)acc_strings_bundle_bundle;
  }

  return v0;
}

id acc_strings_placeholder_Unknown()
{
  int v0 = acc_strings_bundle();
  uint64_t v1 = [v0 localizedStringForKey:@"Unknown" value:&stru_51F10 table:0];

  return v1;
}

CFBundleRef acc_strings_bundleCF()
{
  CFBundleRef result = (CFBundleRef)acc_strings_bundleCF_bundle;
  if (!acc_strings_bundleCF_bundle)
  {
    CFBundleRef result = CFBundleGetBundleWithIdentifier(kCFACCIdentifiers_CoreAccessoriesBundleID);
    acc_strings_bundleCF_bundle = (uint64_t)result;
  }
  return result;
}

uint64_t acc_strings_copyPlaceholder_Unknown()
{
  return objc_claimAutoreleasedReturnValue();
}

void printDictionaryDelta(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = +[NSMutableSet set];
  uint64_t v6 = [v3 allKeys];
  [v5 addObjectsFromArray:v6];

  id v7 = [v4 allKeys];
  [v5 addObjectsFromArray:v7];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = *(void *)v22;
    *(void *)&long long v10 = 138412802;
    long long v20 = v10;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v15 = objc_msgSend(v3, "objectForKeyedSubscript:", v14, v20, (void)v21);
        int v16 = [v4 objectForKeyedSubscript:v14];
        unsigned __int8 v17 = [v15 isEqual:v16];

        if ((v17 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = [v3 objectForKeyedSubscript:v14];
          v19 = [v4 objectForKeyedSubscript:v14];
          *(_DWORD *)buf = v20;
          uint64_t v26 = v14;
          __int16 v27 = 2112;
          v28 = v18;
          __int16 v29 = 2112;
          v30 = v19;
          _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: %@ -> %@", buf, 0x20u);
        }
      }
      id v11 = [v8 countByEnumeratingWithState:&v21 objects:v31 count:16];
    }
    while (v11);
  }
}

id _serviceNotification(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return [a1 _handleNotificationForService:a2 messageType:a3 messageArgument:a4];
}

ACCUserNotification *ACCUNCreate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, uint64_t a10)
{
  v19 = objc_alloc_init(ACCUserNotification);
  [(ACCUserNotification *)v19 setType:a1];
  [(ACCUserNotification *)v19 setTitle:a2];
  [(ACCUserNotification *)v19 setMessage:a3];
  [(ACCUserNotification *)v19 setDefaultButtonName:a4];
  [(ACCUserNotification *)v19 setOtherButtonName:a5];
  [(ACCUserNotification *)v19 setIconURL:a6];
  [(ACCUserNotification *)v19 setIsModal:a7];
  [(ACCUserNotification *)v19 setTimeout:a9];
  [(ACCUserNotification *)v19 setIdentifier:a8];
  [(ACCUserNotification *)v19 setGroupIdentifier:a10];
  return v19;
}

BOOL ACCUNSetModal(void *a1, uint64_t a2)
{
  if (a1) {
    [a1 setIsModal:a2];
  }
  return a1 != 0;
}

BOOL ACCUNSetDismissOnUnlock(void *a1, uint64_t a2)
{
  if (a1) {
    [a1 setDismissOnUnlock:a2];
  }
  return a1 != 0;
}

BOOL ACCUNSetIdentifier(void *a1, uint64_t a2)
{
  if (a1) {
    [a1 setIdentifier:a2];
  }
  return a1 != 0;
}

BOOL ACCUNSetGroupIdentifier(void *a1, uint64_t a2)
{
  if (a1) {
    [a1 setGroupIdentifier:a2];
  }
  return a1 != 0;
}

void *ACCUNCopyUUIDString(void *result)
{
  if (result)
  {
    [result uuid];
    return objc_claimAutoreleasedReturnValue();
  }
  return result;
}

id logObjectForModule(int a1)
{
  if (gLogObjects) {
    BOOL v1 = gNumLogObjects <= a1;
  }
  else {
    BOOL v1 = 1;
  }
  if (v1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      logObjectForModule_cold_1();
    }
    id v3 = &_os_log_default;
    id v2 = &_os_log_default;
  }
  else
  {
    id v3 = *(id *)(gLogObjects + 8 * a1);
  }

  return v3;
}

void DigitalIDEventProviderCallback(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v9 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    if (a1 == 2)
    {
      [v7 removeDigitalIDClient:a2];
    }
    else if (a1 == 1)
    {
      [v7 addDigitalIDClient:a2];
    }
  }
}

void BTServiceEventProviderCallback(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v9 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    if (a1 == 2)
    {
      [v7 removeBTServiceClient:a2];
    }
    else if (a1 == 1)
    {
      [v7 addBTServiceClient:a2];
    }
  }
}

void SystemPowerCallback(void *a1, uint64_t a2, int a3, intptr_t a4)
{
  id v6 = a1;
  if (a3 != -536870288)
  {
    if (a3 == -536870144)
    {
      id v7 = v6;
      EnableAccessoryPower();
      goto LABEL_6;
    }
    if (a3 != -536870272) {
      goto LABEL_7;
    }
  }
  id v7 = v6;
  IOAllowPowerChange((io_connect_t)[v6 systemPowerPort], a4);
LABEL_6:
  id v6 = v7;
LABEL_7:
}

void __43__accessorydMatchingPlugin_initWithModule___block_invoke(id a1, int a2)
{
  uint64_t state64 = 0xAAAAAAAAAAAAAAAALL;
  notify_get_state(a2, &state64);
  uint64_t v2 = state64;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 4;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init]();
    }
    uint64_t v5 = &_os_log_default;
    id v4 = &_os_log_default;
  }
  else
  {
    uint64_t v5 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = "YES";
    if (!v2) {
      id v6 = "NO";
    }
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "SpringBoard lock state changed! (newSpringBoardLockState: %s)", (uint8_t *)&buf, 0xCu);
  }

  if (!v2)
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    id v7 = _uiQueue();
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    int v16 = ___isUnlockDialogPresent_block_invoke;
    unsigned __int8 v17 = &unk_51700;
    uint64_t v18 = &v11;
    dispatch_sync(v7, &buf);

    LODWORD(v7) = *((unsigned __int8 *)v12 + 24);
    _Block_object_dispose(&v11, 8);
    if (v7)
    {
      if (gLogObjects && gNumLogObjects >= 4)
      {
        id v8 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          -[AirplaneMode init]();
        }
        id v8 = &_os_log_default;
        id v9 = &_os_log_default;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Unlock notification presented when SpringBoard unlocked, dismissing user notification...", (uint8_t *)&buf, 2u);
      }

      _dismissUnlockDialog();
    }
  }
}

id _uiQueue()
{
  if (_uiQueue_onceToken != -1) {
    dispatch_once(&_uiQueue_onceToken, &__block_literal_global_907);
  }
  int v0 = (void *)_uiQueue_uiQueue;

  return v0;
}

void __35__accessorydMatchingPlugin_dealloc__block_invoke(id a1)
{
  if (_gUnlockNotificationTimer) {
    dispatch_source_cancel((dispatch_source_t)_gUnlockNotificationTimer);
  }
}

id __66__accessorydMatchingPlugin_startIOAccessoryManagerEventMonitoring__block_invoke(uint64_t a1)
{
  kern_return_t v7;
  mach_error_t v8;
  NSObject *v9;
  id v10;
  IONotificationPort *v11;
  CFDictionaryRef v12;
  NSObject *v13;
  id v14;

  id result = [*(id *)(a1 + 32) isIOAccessoryManagerMonitorRunning];
  if ((result & 1) == 0)
  {
    if (![*(id *)(a1 + 32) ioAccessoryManagerClassNotify]) {
      [*(id *)(a1 + 32) setIoAccessoryManagerClassNotify:IONotificationPortCreate(kIOMainPortDefault)];
    }
    BOOL v3 = (IONotificationPort *)[*(id *)(a1 + 32) ioAccessoryManagerClassNotify];
    id v4 = [*(id *)(a1 + 32) ioAccessoryEventQueue];
    IONotificationPortSetDispatchQueue(v3, v4);

    uint64_t v5 = (IONotificationPort *)[*(id *)(a1 + 32) ioAccessoryManagerClassNotify];
    CFDictionaryRef v6 = IOServiceMatching("IOAccessoryManager");
    id v7 = IOServiceAddMatchingNotification(v5, "IOServiceFirstPublish", v6, (IOServiceMatchingCallback)IOAccessoryManagerAdded, *(void **)(a1 + 32), (io_iterator_t *)(*(void *)(a1 + 32) + 24));
    if (v7)
    {
      id v8 = v7;
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v9 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          -[AirplaneMode init]();
        }
        id v9 = &_os_log_default;
        long long v10 = &_os_log_default;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __66__accessorydMatchingPlugin_startIOAccessoryManagerEventMonitoring__block_invoke_cold_3(v8);
      }
    }
    else
    {
      IOAccessoryManagerAdded(*(void **)(a1 + 32), (io_iterator_t)[*(id *)(a1 + 32) ioAccessoryManagerClassIteratorArrived]);
    }
    uint64_t v11 = (IONotificationPort *)[*(id *)(a1 + 32) ioAccessoryManagerClassNotify];
    uint64_t v12 = IOServiceMatching("IOAccessoryManager");
    if (IOServiceAddMatchingNotification(v11, "IOServiceTerminate", v12, (IOServiceMatchingCallback)IOAccessoryManagerTerminated, *(void **)(a1 + 32), (io_iterator_t *)(*(void *)(a1 + 32) + 28)))
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        uint64_t v13 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          -[AirplaneMode init]();
        }
        uint64_t v13 = &_os_log_default;
        char v14 = &_os_log_default;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __66__accessorydMatchingPlugin_startIOAccessoryManagerEventMonitoring__block_invoke_cold_1();
      }
    }
    else
    {
      IOAccessoryManagerTerminated(*(void **)(a1 + 32), (io_iterator_t)[*(id *)(a1 + 32) ioAccessoryManagerClassIteratorTerminated]);
    }
    return [*(id *)(a1 + 32) setIsIOAccessoryManagerMonitorRunning:1];
  }
  return result;
}

void IOAccessoryManagerAdded(void *a1, io_iterator_t a2)
{
  kern_return_t v8;
  kern_return_t v9;
  id *p_isa;
  int v11;
  BOOL v12;
  id v13;
  NSObject *v14;
  id *v15;
  int v16;
  NSObject *v17;
  __objc2_class *v18;
  unsigned int v19;
  unsigned int v20;
  id *v21;
  int v22;
  NSObject *v23;
  id v24;
  const void *v25;
  const void *v26;
  int v27;
  BOOL v28;
  int v29;
  BOOL v30;
  id v31;
  void *v32;
  AttachEvent *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  AttachEvent *v42;
  void *v43;
  int USBConnectTypePublished;
  int v45;
  id *v46;
  int v47;
  NSObject *v48;
  NSObject *v49;
  CFStringRef v50;
  CFStringRef v51;
  id *v52;
  int v53;
  NSObject *v54;
  id v55;
  kern_return_t v56;
  int v57;
  int v58;
  NSObject *v59;
  NSObject *v60;
  const char *v61;
  int v62;
  id *v63;
  int v64;
  NSObject *v65;
  id v66;
  id v67;
  void *v68;
  id *v69;
  int v70;
  id v71;
  id *v72;
  int v73;
  NSObject *v74;
  id v75;
  uint32_t v76;
  int v77;
  uint64_t v78;
  io_iterator_t v79;
  __CFString *v80;
  __CFString *v81;
  char v82;
  char v83;
  char v84;
  unsigned __int8 v85;
  unsigned int v86;
  char v87;
  int v88;
  char v89;
  int v90;
  __int16 v91;
  io_object_t notification;
  io_connect_t connect;
  uint8_t buf[4];
  unsigned char v95[10];
  _DWORD v96[4];

  id v3 = a1;
  uint64_t v4 = IOIteratorNext(a2);
  if (v4)
  {
    uint64_t v5 = v4;
    CFDictionaryRef v6 = ueaPluginSystemSettingsMonitor;
    v80 = kCFACCUserDefaultsKey_EnableIndonesiaInductiveTx;
    v81 = kCFACCUserDefaultsKey_EnableChinaInductiveTx;
    v79 = a2;
    do
    {
      notification = 0;
      uint64_t PrimaryPort = IOAccessoryManagerGetPrimaryPort();
      v91 = -21846;
      v90 = -1431655766;
      id v8 = IOServiceAddInterestNotification((IONotificationPortRef)[v3 ioAccessoryManagerClassNotify], v5, "IOGeneralInterest", (IOServiceInterestCallback)IOAccessoryManagerEventCallback, v3, &notification);
      if (v8)
      {
        id v9 = v8;
        p_isa = (id *)&v6[62].isa->isa;
        uint64_t v11 = gNumLogObjects;
        if (p_isa) {
          uint64_t v12 = gNumLogObjects < 1;
        }
        else {
          uint64_t v12 = 1;
        }
        if (v12)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 134218240;
            *(void *)v95 = p_isa;
            *(_WORD *)&v95[8] = 1024;
            v96[0] = v11;
            _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          uint64_t v13 = &_os_log_default;
          char v14 = &_os_log_default;
        }
        else
        {
          char v14 = *p_isa;
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 136315394;
          *(void *)v95 = "void IOAccessoryManagerAdded(void *, io_iterator_t)";
          *(_WORD *)&v95[8] = 1024;
          v96[0] = v9;
          _os_log_error_impl(&dword_0, v14, OS_LOG_TYPE_ERROR, "%s IOServiceAddInterestNotification fail status: %02X\n", buf, 0x12u);
        }
      }
      else
      {
        [v3 setDigitalIDMatchingEnabled:1];
      }
      switch(PrimaryPort)
      {
        case 1:
          goto LABEL_19;
        case 0x200:
          uint64_t v18 = v6;
          v19 = acc_userDefaults_BOOLForKey((uint64_t)v81);
          long long v20 = acc_userDefaults_BOOLForKey((uint64_t)v80);
          long long v21 = (id *)&v18[62].isa->isa;
          long long v22 = gNumLogObjects;
          if (v21 && gNumLogObjects >= 1)
          {
            long long v23 = *v21;
          }
          else
          {
            long long v23 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 134218240;
              *(void *)v95 = v21;
              *(_WORD *)&v95[8] = 1024;
              v96[0] = v22;
              _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            long long v24 = &_os_log_default;
          }
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 67109376;
            *(_DWORD *)v95 = v19 ^ 1;
            *(_WORD *)&v95[4] = 1024;
            *(_DWORD *)&v95[6] = v20 ^ 1;
            _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "kIOAccessoryPortID0Pin: _notifyDriverOfInductiveTxSetting: disableChinaInductiveTx:%x, disableIndonesiaInductiveTx:%x", buf, 0xEu);
          }

          v25 = (const void *)systemInfo_copyRegionCode();
          if (v25)
          {
            uint64_t v26 = v25;
            __int16 v27 = CFEqual(v25, @"CH");
            v28 = CFEqual(v26, @"SA")
               || CFEqual(v26, @"FE")
               || CFEqual(v26, @"PA")
               || CFEqual(v26, @"ID") != 0;
            if (v27) {
              __int16 v29 = v19;
            }
            else {
              __int16 v29 = 1;
            }
            if (v29 == 1 && ((!v28 | v20) & 1) != 0)
            {
              v30 = 1;
              CFDictionaryRef v6 = ueaPluginSystemSettingsMonitor;
            }
            else
            {
              v50 = (const __CFString *)systemInfo_copyProductType();
              CFDictionaryRef v6 = ueaPluginSystemSettingsMonitor;
              if (v50)
              {
                v51 = v50;
                v30 = CFEqual(v50, @"iPhone13,1")
                   || CFEqual(v51, @"iPhone13,2")
                   || CFEqual(v51, @"iPhone13,3")
                   || CFEqual(v51, @"iPhone13,4")
                   || CFEqual(v51, @"iPhone14,2")
                   || CFEqual(v51, @"iPhone14,3")
                   || CFEqual(v51, @"iPhone14,4")
                   || CFEqual(v51, @"iPhone14,5")
                   || CFEqual(v51, @"iPhone14,6")
                   || CFEqual(v51, @"iPhone14,7")
                   || CFEqual(v51, @"iPhone14,8")
                   || CFEqual(v51, @"iPhone15,2")
                   || CFEqual(v51, @"iPhone15,3")
                   || CFEqual(v51, @"iPhone15,4")
                   || CFEqual(v51, @"iPhone15,5")
                   || CFEqual(v51, @"iPhone16,1")
                   || CFEqual(v51, @"iPhone16,2");
                CFRelease(v51);
              }
              else
              {
                v30 = 0;
              }
            }
            CFRelease(v26);
          }
          else
          {
            v30 = 1;
            CFDictionaryRef v6 = ueaPluginSystemSettingsMonitor;
          }
          v52 = (id *)&v6[62].isa->isa;
          v53 = gNumLogObjects;
          v54 = &_os_log_default;
          if (v52 && gNumLogObjects >= 1)
          {
            v54 = *v52;
          }
          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 134218240;
              *(void *)v95 = v52;
              *(_WORD *)&v95[8] = 1024;
              v96[0] = v53;
              _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v55 = &_os_log_default;
          }
          if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 67109120;
            *(_DWORD *)v95 = v30;
            _os_log_impl(&dword_0, v54, OS_LOG_TYPE_INFO, "_notifyDriverOfInductiveTxSetting:%d", buf, 8u);
          }

          connect = 0;
          v56 = IOServiceOpen(v5, mach_task_self_, 0, &connect);
          if (v56 || !connect)
          {
            v59 = logObjectForModule(0);
            if (!os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
              goto LABEL_142;
            }
            *(_DWORD *)long long buf = 67109632;
            *(_DWORD *)v95 = v56;
            *(_WORD *)&v95[4] = 1024;
            *(_DWORD *)&v95[6] = connect;
            LOWORD(v96[0]) = 1024;
            *(_DWORD *)((char *)v96 + 2) = v5;
            v60 = v59;
            v61 = "_notifyDriverOfInductiveTxSetting: IOServiceOpen fail kernStatus:%02X, ioConnForService:%04X ioService:%d";
            v76 = 20;
          }
          else
          {
            if (v30)
            {
              v57 = IOAccessoryManagerAllowFeatures();
              if (v57)
              {
                v58 = v57;
                v59 = logObjectForModule(0);
                if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)long long buf = 67109376;
                  *(_DWORD *)v95 = 0x200000;
                  *(_WORD *)&v95[4] = 1024;
                  *(_DWORD *)&v95[6] = v58;
                  v60 = v59;
                  v61 = "_notifyDriverOfInductiveTxSetting: IOAccMgrAllowFeatures 0x%x fail kernStatus:%02X";
                  goto LABEL_140;
                }
LABEL_142:

                CFDictionaryRef v6 = ueaPluginSystemSettingsMonitor;
              }
LABEL_96:
              if (connect) {
                IOServiceClose(connect);
              }
              break;
            }
            v62 = IOAccessoryManagerRevokeFeatures();
            if (!v62) {
              goto LABEL_96;
            }
            v77 = v62;
            v59 = logObjectForModule(0);
            if (!os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
              goto LABEL_142;
            }
            *(_DWORD *)long long buf = 67109376;
            *(_DWORD *)v95 = 0x200000;
            *(_WORD *)&v95[4] = 1024;
            *(_DWORD *)&v95[6] = v77;
            v60 = v59;
            v61 = "_notifyDriverOfInductiveTxSetting: IOAccMgrRevokeFeatures 0x%x fail kernStatus:%02X";
LABEL_140:
            v76 = 14;
          }
          _os_log_error_impl(&dword_0, v60, OS_LOG_TYPE_ERROR, v61, buf, v76);
          goto LABEL_142;
        case 0x100:
LABEL_19:
          connect = -1;
          v89 = 0;
          if (IOAccessoryManagerGetDigitalID()) {
            goto LABEL_146;
          }
          LOBYTE(v88) = 0;
          v15 = (id *)&v6[62].isa->isa;
          int v16 = gNumLogObjects;
          if (v15 && gNumLogObjects >= 1)
          {
            unsigned __int8 v17 = *v15;
          }
          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 134218240;
              *(void *)v95 = v15;
              *(_WORD *)&v95[8] = 1024;
              v96[0] = v16;
              _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v31 = &_os_log_default;
            unsigned __int8 v17 = &_os_log_default;
          }
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            v32 = +[NSData dataWithBytes:&v90 length:6];
            *(_DWORD *)long long buf = 138412290;
            *(void *)v95 = v32;
            _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "IOAccessoryManagerAdded launching clients due to accDigitalID: %@", buf, 0xCu);
          }
          if (IOAccessoryManagerGetUSBConnectType()) {
            connect = -1;
          }
          v86 = _digitalIDSupportsTransport((char *)&v90, 0);
          v84 = _digitalIDSupportsTransport((char *)&v90, 1);
          v83 = _digitalIDSupportsTransport((char *)&v90, 2);
          v82 = _digitalIDSupportsTransport((char *)&v90, 3);
          _hook_digitalIDAttached(&v88);
          if ((_BYTE)v88) {
            _generateUnlockDialogSeenAnalyticEvent(v5, v3);
          }
          v85 = [v3 launchDigitalIDClients];
          v33 = [AttachEvent alloc];
          v34 = +[NSNumber numberWithUnsignedLongLong:systemInfo_getCurrentUnixTimeMS()];
          v35 = +[NSNumber numberWithInt:connect];
          v36 = +[NSNumber numberWithInt:PrimaryPort];
          v37 = [v3 restrictedModeEnabled];
          v38 = v3;
          v39 = v88;
          v40 = +[NSData dataWithBytes:&v90 length:6];
          BYTE2(v78) = v82;
          BYTE1(v78) = v83;
          LOBYTE(v78) = v84;
          v41 = v39;
          id v3 = v38;
          v42 = -[AttachEvent initWithTimestamp:connectType:primaryPort:restrictedModeEnabled:dialogShown:supportsUSB:supportsUART:supportsMB:supportsAIDBulkPipes:digitalID:](v33, "initWithTimestamp:connectType:primaryPort:restrictedModeEnabled:dialogShown:supportsUSB:supportsUART:supportsMB:supportsAIDBulkPipes:digitalID:", v34, v35, v36, v37, v41, v86, v78, v40);

          v43 = [v3 rmEventArray];
          [v43 addObject:v42];

          a2 = v79;
          CFDictionaryRef v6 = ueaPluginSystemSettingsMonitor;
          if ((v85 & 1) == 0)
          {
LABEL_146:
            if (IOAccessoryManagerGetUSBConnectType() || connect - 2 > 3) {
              goto LABEL_124;
            }
            v88 = -1;
            USBConnectTypePublished = IOAccessoryManagerGetUSBConnectTypePublished();
            if (USBConnectTypePublished)
            {
              v45 = USBConnectTypePublished;
              v46 = (id *)&v6[62].isa->isa;
              v47 = gNumLogObjects;
              if (v46 && gNumLogObjects >= 1)
              {
                v48 = *v46;
                v49 = &_os_log_default;
              }
              else
              {
                v49 = &_os_log_default;
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)long long buf = 134218240;
                  *(void *)v95 = v46;
                  *(_WORD *)&v95[8] = 1024;
                  v96[0] = v47;
                  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                }
                v66 = &_os_log_default;
                v48 = &_os_log_default;
              }
              if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 67109120;
                *(_DWORD *)v95 = v45;
                _os_log_error_impl(&dword_0, v48, OS_LOG_TYPE_ERROR, "IOAccessoryManagerGetUSBConnectTypePublished failed with error: 0x%08x", buf, 8u);
              }
            }
            else
            {
              v87 = 0;
              v63 = (id *)&v6[62].isa->isa;
              v64 = gNumLogObjects;
              if (v63 && gNumLogObjects >= 1)
              {
                v65 = *v63;
              }
              else
              {
                v65 = &_os_log_default;
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)long long buf = 134218240;
                  *(void *)v95 = v63;
                  *(_WORD *)&v95[8] = 1024;
                  v96[0] = v64;
                  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                }
                v67 = &_os_log_default;
              }
              if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 67109632;
                *(_DWORD *)v95 = PrimaryPort;
                *(_WORD *)&v95[4] = 1024;
                *(_DWORD *)&v95[6] = connect;
                LOWORD(v96[0]) = 1024;
                *(_DWORD *)((char *)v96 + 2) = v88;
                _os_log_impl(&dword_0, v65, OS_LOG_TYPE_DEFAULT, "IOAccessoryManagerAdded primaryPort: %d, connectType: %d, connectTypePublished: %d", buf, 0x14u);
              }

              _hook_usbConnectTypeChanged(connect, v88, &v87);
              if (v87)
              {
                v68 = +[NSNumber numberWithInt:PrimaryPort];
                [v3 updateRMDialogShownForPrimaryPort:v68];

                _generateUnlockDialogSeenAnalyticEvent(v5, v3);
              }
              v49 = &_os_log_default;
            }
            v69 = (id *)&v6[62].isa->isa;
            v70 = gNumLogObjects;
            if (v69 && gNumLogObjects >= 1)
            {
              v49 = *v69;
            }
            else
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 134218240;
                *(void *)v95 = v69;
                *(_WORD *)&v95[8] = 1024;
                v96[0] = v70;
                _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              v71 = &_os_log_default;
            }
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 67109120;
              *(_DWORD *)v95 = connect;
              _os_log_impl(&dword_0, v49, OS_LOG_TYPE_DEFAULT, "IOAccessoryManagerAdded launching clients due to cableType: %d", buf, 8u);
            }

            if (([v3 launchDigitalIDClients] & 1) == 0)
            {
LABEL_124:
              v72 = (id *)&v6[62].isa->isa;
              v73 = gNumLogObjects;
              if (v72 && gNumLogObjects >= 1)
              {
                v74 = *v72;
              }
              else
              {
                v74 = &_os_log_default;
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)long long buf = 134218240;
                  *(void *)v95 = v72;
                  *(_WORD *)&v95[8] = 1024;
                  v96[0] = v73;
                  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                }
                v75 = &_os_log_default;
              }
              if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)long long buf = 0;
                _os_log_impl(&dword_0, v74, OS_LOG_TYPE_DEFAULT, "Enabling acc_power for primary ports", buf, 2u);
              }

              EnableAccessoryPower();
            }
          }
          break;
      }
      IOObjectRelease(v5);
      uint64_t v5 = IOIteratorNext(a2);
    }
    while (v5);
  }
}

void IOAccessoryManagerTerminated(void *a1, io_iterator_t a2)
{
  id v3 = a1;
  io_object_t v4 = IOIteratorNext(a2);
  if (v4)
  {
    io_object_t v5 = v4;
    do
    {
      uint64_t PrimaryPort = IOAccessoryManagerGetPrimaryPort();
      id v7 = [v3 chargeConfigDict];
      id v8 = +[NSNumber numberWithInt:PrimaryPort];
      [v7 removeObjectForKey:v8];

      uint64_t v9 = gLogObjects;
      int v10 = gNumLogObjects;
      if (gLogObjects) {
        BOOL v11 = gNumLogObjects < 1;
      }
      else {
        BOOL v11 = 1;
      }
      if (v11)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 134218240;
          uint64_t v16 = v9;
          __int16 v17 = 1024;
          int v18 = v10;
          _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        id v12 = &_os_log_default;
        uint64_t v13 = &_os_log_default;
      }
      else
      {
        uint64_t v13 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        char v14 = [v3 chargeConfigDict];
        *(_DWORD *)long long buf = 138412290;
        uint64_t v16 = (uint64_t)v14;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "chargeConfigDict: %@", buf, 0xCu);
      }
      IOObjectRelease(v5);
      io_object_t v5 = IOIteratorNext(a2);
    }
    while (v5);
  }
}

void __65__accessorydMatchingPlugin_stopIOAccessoryManagerEventMonitoring__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) digitalIDTokenSet];
  id v3 = [v2 count];

  if (!v3 && [*(id *)(a1 + 32) isIOAccessoryManagerMonitorRunning])
  {
    if ([*(id *)(a1 + 32) digitalIDMatchingEnabled]
      && [*(id *)(a1 + 32) ioAccessoryManagerClassNotify])
    {
      IONotificationPortDestroy((IONotificationPortRef)[*(id *)(a1 + 32) ioAccessoryManagerClassNotify]);
      [*(id *)(a1 + 32) setIoAccessoryManagerClassNotify:0];
      [*(id *)(a1 + 32) setDigitalIDMatchingEnabled:0];
    }
    io_object_t v4 = *(void **)(a1 + 32);
    [v4 setIsIOAccessoryManagerMonitorRunning:0];
  }
}

id __67__accessorydMatchingPlugin_startUSBRestrictedModeTimeoutMonitoring__block_invoke(uint64_t a1)
{
  kern_return_t v7;
  mach_error_t v8;
  NSObject *v9;
  id v10;

  id result = [*(id *)(a1 + 32) isUSBRestrictedModeTimeoutMonitorRunning];
  if ((result & 1) == 0)
  {
    if (![*(id *)(a1 + 32) ioResourceNotifyPort]) {
      [*(id *)(a1 + 32) setIoResourceNotifyPort:IONotificationPortCreate(kIOMainPortDefault)];
    }
    id v3 = (IONotificationPort *)[*(id *)(a1 + 32) ioResourceNotifyPort];
    io_object_t v4 = [*(id *)(a1 + 32) ioAccessoryEventQueue];
    IONotificationPortSetDispatchQueue(v3, v4);

    io_object_t v5 = IOServiceMatching("IOResources");
    if (v5)
    {
      CFDictionaryRef v6 = v5;
      CFDictionarySetValue(v5, @"IOResourceMatch", @"AppleUSBRestrictedModeTimeout");
      id v7 = IOServiceAddMatchingNotification((IONotificationPortRef)[*(id *)(a1 + 32) ioResourceNotifyPort], "IOServicePublish", v6, (IOServiceMatchingCallback)USBRestrictedModeTimeoutChange, *(void **)(a1 + 32), (io_iterator_t *)(*(void *)(a1 + 32) + 40));
      if (v7)
      {
        id v8 = v7;
        if (gLogObjects && gNumLogObjects >= 1)
        {
          uint64_t v9 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            -[AirplaneMode init]();
          }
          uint64_t v9 = &_os_log_default;
          int v10 = &_os_log_default;
        }
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          __67__accessorydMatchingPlugin_startUSBRestrictedModeTimeoutMonitoring__block_invoke_cold_1(v8);
        }
      }
      else
      {
        USBRestrictedModeTimeoutChange(*(void **)(a1 + 32), (io_iterator_t)[*(id *)(a1 + 32) ioResourceIterator]);
      }
    }
    return [*(id *)(a1 + 32) setIsUSBRestrictedModeTimeoutMonitorRunning:1];
  }
  return result;
}

void USBRestrictedModeTimeoutChange(void *a1, io_iterator_t a2)
{
  id v3 = a1;
  for (io_registry_entry_t i = IOIteratorNext(a2); i; io_registry_entry_t i = IOIteratorNext(a2))
  {
    CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(i, @"AppleUSBRestrictedModeTimeout", kCFAllocatorDefault, 0);
    if (CFProperty)
    {
      CFNumberRef v6 = CFProperty;
      unsigned int valuePtr = -1431655766;
      CFNumberGetValue(CFProperty, kCFNumberIntType, &valuePtr);
      [v3 setUsbRestrictedModeTimeout:valuePtr];
      CFRelease(v6);
    }
  }
}

void __66__accessorydMatchingPlugin_stopUSBRestrictedModeTimeoutMonitoring__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) digitalIDTokenSet];
  id v3 = [v2 count];

  if (!v3 && [*(id *)(a1 + 32) isUSBRestrictedModeTimeoutMonitorRunning])
  {
    if ([*(id *)(a1 + 32) ioResourceNotifyPort])
    {
      IONotificationPortDestroy((IONotificationPortRef)[*(id *)(a1 + 32) ioResourceNotifyPort]);
      [*(id *)(a1 + 32) setIoResourceNotifyPort:0];
    }
    io_object_t v4 = *(void **)(a1 + 32);
    [v4 setIsUSBRestrictedModeTimeoutMonitorRunning:0];
  }
}

void serviceAddedTRM(void *a1, io_iterator_t a2)
{
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 4;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init]();
    }
    CFNumberRef v6 = &_os_log_default;
    id v5 = &_os_log_default;
  }
  else
  {
    CFNumberRef v6 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    serviceAddedTRM_cold_2();
  }

  id v7 = a1;
  io_object_t v8 = IOIteratorNext(a2);
  if (v8)
  {
    io_registry_entry_t v9 = v8;
    do
    {
      CFNumberRef CFProperty = (void *)IORegistryEntryCreateCFProperty(v9, @"IOAccessoryPrimaryDevicePort", kCFAllocatorDefault, 0);
      unsigned int v11 = [CFProperty intValue];

      uint64_t v12 = gLogObjects;
      int v13 = gNumLogObjects;
      if (gLogObjects) {
        BOOL v14 = gNumLogObjects < 4;
      }
      else {
        BOOL v14 = 1;
      }
      if (v14)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 134218240;
          uint64_t v25 = v12;
          __int16 v26 = 1024;
          int v27 = v13;
          _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        id v15 = &_os_log_default;
        uint64_t v16 = &_os_log_default;
      }
      else
      {
        uint64_t v16 = *(id *)(gLogObjects + 24);
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 67109120;
        LODWORD(v25) = v11;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "Registering for TRM interest notifications (primaryPortNumber: %d)...", buf, 8u);
      }

      io_object_t notification = 0;
      if (IOServiceAddInterestNotification((IONotificationPortRef)[v7 ioNotifyPortTRM], v9, "IOGeneralInterest", (IOServiceInterestCallback)serviceNotificationTRM, v7, &notification))
      {
        uint64_t v17 = gLogObjects;
        int v18 = gNumLogObjects;
        if (gLogObjects && gNumLogObjects >= 4)
        {
          v19 = *(id *)(gLogObjects + 24);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 134218240;
            uint64_t v25 = v17;
            __int16 v26 = 1024;
            int v27 = v18;
            _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          id v20 = &_os_log_default;
          v19 = &_os_log_default;
        }
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          serviceAddedTRM_cold_1(&v21, v22);
        }
      }
      IOObjectRelease(v9);
      io_registry_entry_t v9 = IOIteratorNext(a2);
    }
    while (v9);
  }
  [v7 trmStatusDidChange];
}

id serviceRemovedTRM(void *a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 4;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init]();
    }
    BOOL v4 = &_os_log_default;
    id v3 = &_os_log_default;
  }
  else
  {
    BOOL v4 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    serviceRemovedTRM_cold_1();
  }

  return [a1 trmStatusDidChange];
}

void IOAccessoryPortAdded(void *a1, io_iterator_t a2)
{
  id v5 = a1;
  io_object_t v3 = IOIteratorNext(a2);
  if (v3)
  {
    io_object_t v4 = v3;
    do
    {
      if (IOAccessoryPortGetPort() == 2) {
        [v5 handleUSBPortAdded];
      }
      IOObjectRelease(v4);
      io_object_t v4 = IOIteratorNext(a2);
    }
    while (v4);
  }
}

void IOAccessoryPortTerminated(void *a1, io_iterator_t a2)
{
  id v3 = a1;
  io_object_t v4 = IOIteratorNext(a2);
  if (v4)
  {
    io_object_t v5 = v4;
    do
    {
      if (IOAccessoryPortGetPort() == 2 && IOAccessoryPortGetManagerPrimaryPort() == 1)
      {
        [v3 handleUSBPortTerminated];
        uint64_t v6 = gLogObjects;
        int v7 = gNumLogObjects;
        if (gLogObjects && gNumLogObjects >= 1)
        {
          io_object_t v8 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 134218240;
            uint64_t v11 = v6;
            __int16 v12 = 1024;
            int v13 = v7;
            _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          id v9 = &_os_log_default;
          io_object_t v8 = &_os_log_default;
        }
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 67109120;
          LODWORD(v11) = v5;
          _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Terminated kIOAccessoryPortIDUSB port with service %d", buf, 8u);
        }
      }
      IOObjectRelease(v5);
      io_object_t v5 = IOIteratorNext(a2);
    }
    while (v5);
  }
}

id __50__accessorydMatchingPlugin_startBluetoothMatching__block_invoke(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) connectedToBTServer];
  if ((result & 1) == 0)
  {
    id v3 = [*(id *)(a1 + 32) attachToBTServer];
    io_object_t v4 = *(void **)(a1 + 32);
    return [v4 setConnectedToBTServer:v3];
  }
  return result;
}

id __49__accessorydMatchingPlugin_stopBluetoothMatching__block_invoke(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) connectedToBTServer];
  if (result)
  {
    id result = [*(id *)(a1 + 32) detachFromBTServer];
    if (result)
    {
      id v3 = *(void **)(a1 + 32);
      return [v3 setConnectedToBTServer:0];
    }
  }
  return result;
}

void BTSessionCallback(id a1, int a2, int a3, void *a4)
{
  id v7 = a4;
  if (a2 == 2)
  {
    id v9 = v7;
    BOOL v8 = [v7 btSession] == a1;
    id v7 = v9;
    if (v8)
    {
      [v9 setBtSession:0];
      [v9 setConnectedToBTServer:0];
      [v9 startBluetoothMatching];
      goto LABEL_9;
    }
  }
  else if (!a2 && a1 && !a3)
  {
    id v9 = v7;
    [v7 setBtSession:a1];
    [v9 findKnownBTDevices];
    BTServiceAddCallbacks();
LABEL_9:
    id v7 = v9;
  }
}

void __66__accessorydMatchingPlugin_setRoleSwapMaskDueToCarPlayStateChange__block_invoke(uint64_t a1, char a2)
{
  io_object_t v4 = [*(id *)(a1 + 32) carPlayEventQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __66__accessorydMatchingPlugin_setRoleSwapMaskDueToCarPlayStateChange__block_invoke_2;
  v5[3] = &unk_51668;
  v5[4] = *(void *)(a1 + 32);
  char v6 = a2;
  dispatch_async(v4, v5);
}

void __66__accessorydMatchingPlugin_setRoleSwapMaskDueToCarPlayStateChange__block_invoke_2(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) isCarPlayAllowed];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 == v2)
  {
    if (gLogObjects) {
      BOOL v4 = gNumLogObjects < 1;
    }
    else {
      BOOL v4 = 1;
    }
    if (v4)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[AirplaneMode init]();
      }
      BOOL v8 = &_os_log_default;
      id v5 = &_os_log_default;
    }
    else
    {
      BOOL v8 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      unsigned int v9 = *(unsigned __int8 *)(a1 + 40);
      unsigned int v10 = [*(id *)(a1 + 32) isCarPlayAllowed];
      int v13 = 136315650;
      BOOL v14 = "-[accessorydMatchingPlugin setRoleSwapMaskDueToCarPlayStateChange]_block_invoke";
      __int16 v15 = 1024;
      unsigned int v16 = v9;
      __int16 v17 = 1024;
      unsigned int v18 = v10;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "%s role swap mask properly configured, carplayAllowed: %d self.isCarPlayAllowed = %d", (uint8_t *)&v13, 0x18u);
    }
  }
  else
  {
    [*(id *)(a1 + 32) setIsCarPlayAllowed:v3 != 0];
    [*(id *)(a1 + 32) setRoleSwapMaskWritten:0];
    if (gLogObjects) {
      BOOL v6 = gNumLogObjects < 1;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[AirplaneMode init]();
      }
      uint64_t v11 = &_os_log_default;
      id v7 = &_os_log_default;
    }
    else
    {
      uint64_t v11 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v12 = [*(id *)(a1 + 32) isCarPlayAllowed];
      int v13 = 136315394;
      BOOL v14 = "-[accessorydMatchingPlugin setRoleSwapMaskDueToCarPlayStateChange]_block_invoke_2";
      __int16 v15 = 1024;
      unsigned int v16 = v12;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "%s self.isCarPlayAllowed: %d", (uint8_t *)&v13, 0x12u);
    }

    [*(id *)(a1 + 32) setRoleSwapMaskForUSBPort];
  }
}

id CarPlayStateChanged(uint64_t a1, void *a2)
{
  return [a2 setRoleSwapMaskDueToCarPlayStateChange];
}

void __46__accessorydMatchingPlugin_handleUSBPortAdded__block_invoke(uint64_t a1, char a2)
{
  BOOL v4 = [*(id *)(a1 + 32) carPlayEventQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __46__accessorydMatchingPlugin_handleUSBPortAdded__block_invoke_2;
  v5[3] = &unk_51668;
  v5[4] = *(void *)(a1 + 32);
  char v6 = a2;
  dispatch_async(v4, v5);
}

id __46__accessorydMatchingPlugin_handleUSBPortAdded__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsCarPlayAllowed:*(unsigned __int8 *)(a1 + 40)];
  [*(id *)(a1 + 32) setRoleSwapMaskWritten:0];
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 1;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init]();
    }
    BOOL v4 = &_os_log_default;
    id v3 = &_os_log_default;
  }
  else
  {
    BOOL v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = [*(id *)(a1 + 32) isCarPlayAllowed];
    int v7 = 136315394;
    BOOL v8 = "-[accessorydMatchingPlugin handleUSBPortAdded]_block_invoke_2";
    __int16 v9 = 1024;
    unsigned int v10 = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%s self.isCarPlayAllowed = %d", (uint8_t *)&v7, 0x12u);
  }

  return [*(id *)(a1 + 32) setRoleSwapMaskForUSBPort];
}

uint64_t _shouldPresentUnlockDialog()
{
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 0;
  CFDictionaryRef v0 = IOServiceMatching("IOAccessoryTRM");
  io_iterator_t existing = 0;
  if (!IOServiceGetMatchingServices(kIOMainPortDefault, v0, &existing))
  {
    int v1 = 0;
    while (1)
    {
      io_registry_entry_t v2 = IOIteratorNext(existing);
      io_registry_entry_t v3 = v2;
      if (!v2) {
        break;
      }
      io_registry_entry_t parent = 0;
      if (IORegistryEntryGetParentEntry(v2, "IOService", &parent)) {
        BOOL v4 = 1;
      }
      else {
        BOOL v4 = parent == 0;
      }
      if (v4
        || (unsigned int v5 = (void *)IORegistryEntryCreateCFProperty(parent, @"PortType", kCFAllocatorDefault, 0),
            unsigned int v6 = [v5 intValue],
            v5,
            int v7 = (void *)IORegistryEntryCreateCFProperty(parent, @"PortNumber", kCFAllocatorDefault, 0),
            unsigned int v8 = [v7 intValue],
            v7,
            IOObjectRelease(parent),
            v6 != 2))
      {
        CFNumberRef CFProperty = (void *)IORegistryEntryCreateCFProperty(v3, @"SupervisedAccessoryAttached", kCFAllocatorDefault, 0);
        unsigned int v13 = [CFProperty BOOLValue];

        BOOL v14 = (void *)IORegistryEntryCreateCFProperty(v3, @"SupervisedTransportsRestricted", kCFAllocatorDefault, 0);
        unsigned int v15 = [v14 BOOLValue];

        unsigned int v16 = (void *)IORegistryEntryCreateCFProperty(v3, @"IOAccessoryPrimaryDevicePort", kCFAllocatorDefault, 0);
        unsigned int v17 = [v16 intValue];

        uint64_t v18 = gLogObjects;
        int v19 = gNumLogObjects;
        if (gLogObjects && gNumLogObjects >= 4)
        {
          id v20 = *(id *)(gLogObjects + 24);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 134218240;
            *(void *)v40 = v18;
            *(_WORD *)&v40[8] = 1024;
            v41[0] = v19;
            _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          id v21 = &_os_log_default;
          id v20 = &_os_log_default;
        }
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 67109632;
          *(_DWORD *)v40 = v13;
          *(_WORD *)&v40[4] = 1024;
          *(_DWORD *)&v40[6] = v15;
          LOWORD(v41[0]) = 1024;
          *(_DWORD *)((char *)v41 + 2) = v17;
          _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "supervisedAccessoryAttached: %d, supervisedTransportsRestricted: %d, primaryPortNumber: %d", buf, 0x14u);
        }

        if ((v13 & v15) == 1) {
          *((unsigned char *)v36 + 24) = 1;
        }
        ++v1;
      }
      else
      {
        uint64_t v9 = gLogObjects;
        int v10 = gNumLogObjects;
        if (gLogObjects && gNumLogObjects >= 4)
        {
          uint64_t v11 = *(id *)(gLogObjects + 24);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 134218240;
            *(void *)v40 = v9;
            *(_WORD *)&v40[8] = 1024;
            v41[0] = v10;
            _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          id v22 = &_os_log_default;
          uint64_t v11 = &_os_log_default;
        }
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 67109120;
          *(_DWORD *)v40 = v8;
          _os_log_debug_impl(&dword_0, v11, OS_LOG_TYPE_DEBUG, "Ignoring USB-C port... (portNumber: %d)", buf, 8u);
        }
      }
      IOObjectRelease(v3);
    }
    IOObjectRelease(existing);
    if (gLogObjects) {
      BOOL v23 = gNumLogObjects < 4;
    }
    else {
      BOOL v23 = 1;
    }
    if (v23)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[AirplaneMode init]();
      }
      uint64_t v25 = &_os_log_default;
      id v24 = &_os_log_default;
    }
    else
    {
      uint64_t v25 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      _shouldPresentUnlockDialog_cold_2();
    }

    __int16 v26 = _uiQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = ___shouldPresentUnlockDialog_block_invoke;
    block[3] = &unk_51700;
    block[4] = &v35;
    dispatch_sync(v26, block);

    if (gLogObjects && gNumLogObjects >= 4)
    {
      int v27 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[AirplaneMode init]();
      }
      int v27 = &_os_log_default;
      id v28 = &_os_log_default;
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      if (*((unsigned char *)v36 + 24)) {
        __int16 v29 = "YES";
      }
      else {
        __int16 v29 = "NO";
      }
      *(_DWORD *)long long buf = 136315138;
      *(void *)v40 = v29;
      _os_log_impl(&dword_0, v27, OS_LOG_TYPE_DEFAULT, "shouldPresentUnlockDialog: %s", buf, 0xCu);
    }
  }
  uint64_t v30 = *((unsigned __int8 *)v36 + 24);
  _Block_object_dispose(&v35, 8);
  return v30;
}

void sub_1F050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _dismissUnlockDialog()
{
  CFDictionaryRef v0 = _uiQueue();
  dispatch_sync(v0, &__block_literal_global_963);
}

uint64_t serviceAddedLDCM(void *a1, io_iterator_t iterator)
{
  uint64_t result = IOIteratorNext(iterator);
  if (result)
  {
    io_registry_entry_t v4 = result;
    while (1)
    {
      uint64_t v5 = gLogObjects;
      int v6 = gNumLogObjects;
      if (!gLogObjects || gNumLogObjects < 5)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 134218240;
          uint64_t v33 = v5;
          __int16 v34 = 1024;
          int v35 = v6;
          _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        id v8 = &_os_log_default;
        uint64_t v9 = &_os_log_default;
      }
      else
      {
        uint64_t v9 = *(id *)(gLogObjects + 32);
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        serviceAddedLDCM_cold_3(&v25, v26);
      }

      id v10 = a1;
      CFNumberRef CFProperty = (void *)IORegistryEntryCreateCFProperty(v4, @"IOAccessoryPrimaryDevicePort", kCFAllocatorDefault, 0);
      unsigned int v12 = [CFProperty intValue];

      uint64_t v13 = gLogObjects;
      int v14 = gNumLogObjects;
      if (gLogObjects && gNumLogObjects >= 5)
      {
        unsigned int v15 = *(id *)(gLogObjects + 32);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 134218240;
          uint64_t v33 = v13;
          __int16 v34 = 1024;
          int v35 = v14;
          _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        id v16 = &_os_log_default;
        unsigned int v15 = &_os_log_default;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 67109120;
        LODWORD(v33) = v12;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "Registering for LDCM interest notifications (primaryPortNumber: %d)...", buf, 8u);
      }

      io_object_t notification = [v10 ioNotificationLDCM];
      if (notification) {
        break;
      }
      if (IOServiceAddInterestNotification((IONotificationPortRef)[v10 ioNotifyPortLDCM], v4, "IOGeneralInterest", (IOServiceInterestCallback)serviceNotificationLDCM, v10, &notification))
      {
        uint64_t v20 = gLogObjects;
        int v21 = gNumLogObjects;
        if (gLogObjects && gNumLogObjects >= 5)
        {
          int v19 = *(id *)(gLogObjects + 32);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 134218240;
            uint64_t v33 = v20;
            __int16 v34 = 1024;
            int v35 = v21;
            _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          id v23 = &_os_log_default;
          int v19 = &_os_log_default;
        }
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          serviceAddedTRM_cold_1(&v29, v30);
        }
        goto LABEL_40;
      }
      serviceLDCMMitigationStatusChanged(v10, v4);
LABEL_41:

      IOObjectRelease(v4);
      uint64_t result = IOIteratorNext(iterator);
      io_registry_entry_t v4 = result;
      if (!result) {
        return result;
      }
    }
    uint64_t v17 = gLogObjects;
    int v18 = gNumLogObjects;
    if (gLogObjects && gNumLogObjects >= 5)
    {
      int v19 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 134218240;
        uint64_t v33 = v17;
        __int16 v34 = 1024;
        int v35 = v18;
        _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
      }
      id v22 = &_os_log_default;
      int v19 = &_os_log_default;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      serviceAddedLDCM_cold_2(&v27, v28);
    }
LABEL_40:

    goto LABEL_41;
  }
  return result;
}

void __51__accessorydMatchingPlugin_portManager_didAddPort___block_invoke(uint64_t a1)
{
  int v1 = (void *)_portsPendingUserAuthorization;
  io_registry_entry_t v2 = *(void **)(a1 + 32);
  +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v2 registryEntryID]);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v1 setObject:v2 forKey:v3];
}

void __54__accessorydMatchingPlugin_portManager_didRemovePort___block_invoke(uint64_t a1)
{
  int v1 = (void *)_portsPendingUserAuthorization;
  +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [*(id *)(a1 + 32) registryEntryID]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 removeObjectForKey:v2];
}

void __75__accessorydMatchingPlugin_portManager_didUpdateAuthorizationStateForPort___block_invoke(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) userAuthorizationPending];
  id v3 = (void *)_portsPendingUserAuthorization;
  if (v2)
  {
    io_registry_entry_t v4 = *(void **)(a1 + 32);
    +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v4 registryEntryID]);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4);
  }
  else
  {
    +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [*(id *)(a1 + 32) registryEntryID]);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObjectForKey:");
  }
}

uint64_t accessorydMatchingPlugin_Initialize(uint64_t a1)
{
  gAccessorydMatchingPlugin = [[accessorydMatchingPlugin alloc] initWithModule:a1];

  return _objc_release_x1();
}

void EnableAccessoryPower()
{
  kern_return_t v13;
  kern_return_t v14;
  uint64_t v15;
  int v16;
  NSObject *v17;
  int v18;
  int v19;
  uint64_t v20;
  int v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  io_connect_t connect;
  io_iterator_t existing;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;

  connect = 0;
  io_iterator_t existing = -1431655766;
  if (gLogObjects) {
    BOOL v0 = gNumLogObjects < 1;
  }
  else {
    BOOL v0 = 1;
  }
  if (v0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init]();
    }
    unsigned int v2 = &_os_log_default;
    id v1 = &_os_log_default;
  }
  else
  {
    unsigned int v2 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    char v29 = "kern_return_t EnableAccessoryPower(void)";
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "%s Enabling Accessory Power.\n", buf, 0xCu);
  }

  CFDictionaryRef v3 = IOServiceMatching("IOAccessoryManager");
  if (IOServiceGetMatchingServices(kIOMainPortDefault, v3, &existing))
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      io_registry_entry_t v4 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[AirplaneMode init]();
      }
      io_registry_entry_t v4 = &_os_log_default;
      char v25 = &_os_log_default;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      EnableAccessoryPower_cold_1();
    }
  }
  else
  {
    io_object_t v5 = IOIteratorNext(existing);
    if (v5)
    {
      io_service_t v6 = v5;
      do
      {
        int PrimaryPort = IOAccessoryManagerGetPrimaryPort();
        if (IOAccessoryManagerPowerModeIsSupported() && PrimaryPort != 512)
        {
          uint64_t v8 = gLogObjects;
          int v9 = gNumLogObjects;
          if (gLogObjects) {
            BOOL v10 = gNumLogObjects < 1;
          }
          else {
            BOOL v10 = 1;
          }
          if (v10)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 134218240;
              char v29 = (const char *)v8;
              uint64_t v30 = 1024;
              v31 = v9;
              _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            id v11 = &_os_log_default;
            unsigned int v12 = &_os_log_default;
          }
          else
          {
            unsigned int v12 = *(id *)gLogObjects;
          }
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 136315394;
            char v29 = "kern_return_t EnableAccessoryPower(void)";
            uint64_t v30 = 1024;
            v31 = PrimaryPort;
            _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "%s Enabling Accessory Power on port %d.\n", buf, 0x12u);
          }

          uint64_t v13 = IOServiceOpen(v6, mach_task_self_, 0, &connect);
          if (v13)
          {
            int v14 = v13;
            unsigned int v15 = gLogObjects;
            id v16 = gNumLogObjects;
            if (gLogObjects && gNumLogObjects >= 1)
            {
              uint64_t v17 = *(id *)gLogObjects;
            }
            else
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 134218240;
                char v29 = (const char *)v15;
                uint64_t v30 = 1024;
                v31 = v16;
                _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              id v23 = &_os_log_default;
              uint64_t v17 = &_os_log_default;
            }
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 136315394;
              char v29 = "kern_return_t EnableAccessoryPower(void)";
              uint64_t v30 = 1024;
              v31 = v14;
              _os_log_error_impl(&dword_0, v17, OS_LOG_TYPE_ERROR, "%s IOServiceOpen failed: %#x\n", buf, 0x12u);
            }
          }
          else
          {
            int v18 = IOAccessoryManagerConfigurePower();
            if (v18)
            {
              int v19 = v18;
              uint64_t v20 = gLogObjects;
              int v21 = gNumLogObjects;
              if (gLogObjects && gNumLogObjects >= 1)
              {
                id v22 = *(id *)gLogObjects;
              }
              else
              {
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)long long buf = 134218240;
                  char v29 = (const char *)v20;
                  uint64_t v30 = 1024;
                  v31 = v21;
                  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                }
                id v24 = &_os_log_default;
                id v22 = &_os_log_default;
              }
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 136315650;
                char v29 = "kern_return_t EnableAccessoryPower(void)";
                uint64_t v30 = 1024;
                v31 = v19;
                v32 = 1024;
                uint64_t v33 = PrimaryPort;
                _os_log_error_impl(&dword_0, v22, OS_LOG_TYPE_ERROR, "%s IOAccessoryManagerConfigurePower didn't enable power %#x for primaryPort: %d\n", buf, 0x18u);
              }
            }
            IOServiceClose(connect);
          }
        }
        IOObjectRelease(v6);
        io_service_t v6 = IOIteratorNext(existing);
      }
      while (v6);
    }
    IOObjectRelease(existing);
  }
}

void BTServiceCallback(uint64_t a1, uint64_t a2, int a3, int a4, int a5, void *a6)
{
  if (!a3 && a4 == 11 && !a5)
  {
    id v6 = a6;
    if (v6 && BTDeviceGetSupportedServices())
    {
      if (gLogObjects && gNumLogObjects >= 2)
      {
        int v7 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          -[AirplaneMode init]();
        }
        int v7 = &_os_log_default;
        id v8 = &_os_log_default;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        BTServiceCallback_cold_1(v7, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
}

void IOAccessoryManagerEventCallback(void *a1, uint64_t a2, int a3)
{
  id v5 = a1;
  if (v5)
  {
    uint64_t PrimaryPort = IOAccessoryManagerGetPrimaryPort();
    unsigned int v177 = -1;
    int v176 = -1;
    char v175 = 0;
    unsigned int v174 = 0;
    __int16 v173 = -21846;
    int v172 = -1431655766;
    if (!a2)
    {
      if (gLogObjects) {
        BOOL v9 = gNumLogObjects < 1;
      }
      else {
        BOOL v9 = 1;
      }
      if (v9)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          -[AirplaneMode init]();
        }
        uint64_t v11 = &_os_log_default;
        id v10 = &_os_log_default;
      }
      else
      {
        uint64_t v11 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        IOAccessoryManagerEventCallback_cold_1();
      }
      goto LABEL_25;
    }
    uint64_t v7 = PrimaryPort;
    if (a3 <= -469794747)
    {
      switch(a3)
      {
        case -469794799:
          goto LABEL_26;
        case -469794798:
        case -469794794:
        case -469794793:
          goto LABEL_234;
        case -469794797:
        case -469794792:
          if (gLogObjects && gNumLogObjects >= 1)
          {
            id v8 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              -[AirplaneMode init]();
            }
            id v8 = &_os_log_default;
            id v23 = &_os_log_default;
          }
          if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
            goto LABEL_114;
          }
          if (a3 == -469794797) {
            id v24 = "kIOAccessoryManagerMessageAccessoryDetected";
          }
          else {
            id v24 = "kIOAccessoryManagerMessageAccessoryRemoved";
          }
          *(_DWORD *)long long buf = 136315394;
          *(void *)v179 = v24;
          *(_WORD *)&v179[8] = 1024;
          *(_DWORD *)v180 = v7;
          char v25 = "%s received on primaryPort: %d";
          __int16 v26 = v8;
          os_log_type_t v27 = OS_LOG_TYPE_INFO;
          uint32_t v28 = 18;
          goto LABEL_113;
        case -469794796:
          if (IOAccessoryPortGetServiceWithPort())
          {
            IOAccessoryPortGetManagerPrimaryPort();
            if (IOAccessoryManagerGetServiceWithPrimaryPort())
            {
              if (IOAccessoryManagerGetUSBConnectType())
              {
                uint64_t v11 = logObjectForModule(0);
                if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
                  IOAccessoryManagerEventCallback_cold_10();
                }
                goto LABEL_25;
              }
              if (IOAccessoryManagerGetUSBConnectTypePublished())
              {
                uint64_t v11 = logObjectForModule(0);
                if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
                  IOAccessoryManagerEventCallback_cold_9();
                }
                goto LABEL_25;
              }
              LOBYTE(out_token) = 0;
              v100 = logObjectForModule(0);
              if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 67109632;
                *(_DWORD *)v179 = v7;
                *(_WORD *)&v179[4] = 1024;
                *(_DWORD *)&v179[6] = v177;
                *(_WORD *)v180 = 1024;
                *(_DWORD *)&v180[2] = v176;
                _os_log_impl(&dword_0, v100, OS_LOG_TYPE_DEFAULT, "kIOAccessoryManagerMessageUSBConnectChange primaryPort: %d, connectType: %d, connectTypePublished: %d", buf, 0x14u);
              }

              _hook_usbConnectTypeChanged(v177, v176, &out_token);
              if ((_BYTE)out_token)
              {
                v101 = +[NSNumber numberWithInt:v7];
                [v5 updateRMDialogShownForPrimaryPort:v101];

                _generateUnlockDialogSeenAnalyticEvent(a2, v5);
              }
              v102 = [v5 chargeConfigDict];

              if (!v102)
              {
                v103 = +[NSMutableDictionary dictionary];
                [v5 setChargeConfigDict:v103];
              }
              v104 = [v5 chargeConfigDict];
              v105 = +[NSNumber numberWithInt:v7];
              v74 = [v104 objectForKey:v105];

              if (v74)
              {
                v106 = [(AttachEvent *)v74 objectForKey:@"lightningCableType"];
                v107 = v106;
                if (!v106 || (unsigned int v108 = [v106 intValue], v108 == v177))
                {
                  BOOL v109 = 0;
LABEL_198:

                  v114 = logObjectForModule(0);
                  if (os_log_type_enabled(v114, OS_LOG_TYPE_INFO))
                  {
                    v115 = [v5 chargeConfigDict];
                    *(_DWORD *)long long buf = 138412290;
                    *(void *)v179 = v115;
                    _os_log_impl(&dword_0, v114, OS_LOG_TYPE_INFO, "chargeConfigDict: %@", buf, 0xCu);
                  }
                  if (!v177)
                  {
                    uint64_t v116 = [v5 cachedUSBConnectType];
                    if (v116)
                    {
                      v117 = (void *)v116;
                      unsigned int v118 = v177;
                      v119 = [v5 cachedUSBConnectType];
                      unsigned int v120 = [v119 intValue];

                      if (v118 != v120)
                      {
                        v121 = +[NSNumber numberWithUnsignedLongLong:systemInfo_getCurrentUnixTimeMS()];
                        [v5 setLastUSBAccessoryDetachTime:v121];

                        v122 = [v5 pluginDefaults];
                        v123 = [v5 lastUSBAccessoryDetachTime];
                        [v122 setObject:v123 forKey:@"lastUSBDetach"];

                        v124 = logObjectForModule(0);
                        if (os_log_type_enabled(v124, OS_LOG_TYPE_INFO))
                        {
                          v125 = [v5 lastUSBAccessoryDetachTime];
                          *(_DWORD *)long long buf = 138412546;
                          *(void *)v179 = v125;
                          *(_WORD *)&v179[8] = 1024;
                          *(_DWORD *)v180 = v177;
                          _os_log_impl(&dword_0, v124, OS_LOG_TYPE_INFO, "lastUSBAccessoryDetachTime: %@, connectType: %d", buf, 0x12u);
                        }
                      }
                    }
                    v126 = [v5 carPlayEventQueue];
                    v170[0] = _NSConcreteStackBlock;
                    v170[1] = 3221225472;
                    v170[2] = __IOAccessoryManagerEventCallback_block_invoke;
                    v170[3] = &unk_51448;
                    id v171 = v5;
                    dispatch_async(v126, v170);
                  }
                  if (v109)
                  {
                    if (IOAccessoryManagerGetDigitalID())
                    {
                      v127 = logObjectForModule(0);
                      if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR)) {
                        IOAccessoryManagerEventCallback_cold_3();
                      }
                    }
                    else
                    {
                      *(_DWORD *)long long buf = 0;
                      int USBCurrentLimit = IOAccessoryManagerGetUSBCurrentLimit();
                      if (USBCurrentLimit != -536870183 && USBCurrentLimit)
                      {
                        v136 = logObjectForModule(0);
                        if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR)) {
                          IOAccessoryManagerEventCallback_cold_7();
                        }
                      }
                      else
                      {
                        v129 = +[NSNumber numberWithInt:v177];
                        v130 = +[NSNumber numberWithInt:v7];
                        v131 = +[NSData dataWithBytes:&v172 length:6];
                        [v5 updateUSBConectType:v129 ForPrimaryPort:v130 WithDigitalID:v131];

                        v132 = CFStringCreateFromCFData((const __CFData *)+[NSData dataWithBytes:&v172 length:6], @"%02X");
                        v185[0] = @"lightningCableType";
                        v155 = +[NSNumber numberWithInt:v177];
                        v186[0] = v155;
                        v185[1] = @"unlockedSinceBoot";
                        v133 = +[NSNumber numberWithBool:MKBDeviceUnlockedSinceBoot() != 0];
                        v186[1] = v133;
                        v185[2] = @"deviceIsPowered";
                        v134 = +[NSNumber numberWithBool:*(_DWORD *)buf != 0];
                        v186[2] = v134;
                        v185[3] = @"lightningDigitalID";
                        v153 = v132;
                        if (v132) {
                          v135 = (void *)CFRetain(v132);
                        }
                        else {
                          v135 = 0;
                        }
                        v186[3] = v135;
                        v185[4] = @"lightningPrimaryPortNumber";
                        v137 = +[NSNumber numberWithInt:v7];
                        v186[4] = v137;
                        v185[5] = @"screenIsLocked";
                        int v138 = MKBGetDeviceLockState();
                        BOOL v139 = (v138 - 1) < 2;
                        if (v138 == 3) {
                          BOOL v139 = 0;
                        }
                        if (v138) {
                          BOOL v140 = v139;
                        }
                        else {
                          BOOL v140 = 0;
                        }
                        v141 = +[NSNumber numberWithBool:v140];
                        v186[5] = v141;
                        v142 = +[NSDictionary dictionaryWithObjects:v186 forKeys:v185 count:6];
                        v143 = +[NSMutableDictionary dictionaryWithDictionary:v142];

                        v144 = [v5 analyticsQueue];
                        v167[0] = _NSConcreteStackBlock;
                        v167[1] = 3221225472;
                        v167[2] = __IOAccessoryManagerEventCallback_block_invoke_862;
                        v167[3] = &unk_515B0;
                        v136 = v143;
                        v168 = v136;
                        unsigned int v169 = v177;
                        dispatch_async(v144, v167);

                        if (v153) {
                          CFRelease(v153);
                        }
                      }
                    }
                  }
                  uint64_t v145 = v177;
                  if (v177 - 2 <= 3)
                  {
                    _generateUSBAccessoryConnectionStatisticsEvent(v5, v7, (char *)&v172, v177);
                    v146 = logObjectForModule(0);
                    if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)long long buf = 67109120;
                      *(_DWORD *)v179 = v177;
                      _os_log_impl(&dword_0, v146, OS_LOG_TYPE_DEFAULT, "IOAccessoryManagerEventCallback kIOAccessoryManagerMessageUSBConnectChange launching clients due to connectType: %d", buf, 8u);
                    }

                    [v5 launchDigitalIDClients];
                    uint64_t v145 = v177;
                  }
                  v147 = +[NSNumber numberWithInt:v145];
                  [v5 setCachedUSBConnectType:v147];

                  v148 = [v5 pluginDefaults];
                  v149 = [v5 cachedUSBConnectType];
                  [v148 setObject:v149 forKey:@"cachedUSBConnectType"];

                  goto LABEL_233;
                }
                v112 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
                [(AttachEvent *)v74 setObject:v112 forKey:@"lightningCableType"];
              }
              else
              {
                v187 = @"lightningCableType";
                v110 = +[NSNumber numberWithInt:v177];
                v188 = v110;
                v111 = +[NSDictionary dictionaryWithObjects:&v188 forKeys:&v187 count:1];
                v107 = +[NSMutableDictionary dictionaryWithDictionary:v111];

                v112 = [v5 chargeConfigDict];
                v113 = +[NSNumber numberWithInt:v7];
                [v112 setObject:v107 forKey:v113];
              }
              BOOL v109 = v177 - 1 < 0xFFFFFFFE;
              goto LABEL_198;
            }
            uint64_t v11 = logObjectForModule(0);
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
              IOAccessoryManagerEventCallback_cold_6();
            }
          }
          else
          {
            uint64_t v11 = logObjectForModule(0);
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
              IOAccessoryManagerEventCallback_cold_5();
            }
          }
          break;
        case -469794795:
          if (PrimaryPort != 256 && PrimaryPort != 1) {
            goto LABEL_234;
          }
          int out_token = 0;
          int USBChargingVoltage = IOAccessoryManagerGetUSBChargingVoltage();
          int v19 = USBChargingVoltage;
          if (USBChargingVoltage != -536870183 && USBChargingVoltage)
          {
            uint64_t v20 = logObjectForModule(0);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
              IOAccessoryManagerEventCallback_cold_14();
            }
          }
          int v21 = IOAccessoryManagerGetUSBCurrentLimit();
          int v22 = v21;
          if (v21 != -536870183 && v21)
          {
            v78 = logObjectForModule(0);
            if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
              IOAccessoryManagerEventCallback_cold_7();
            }
          }
          else
          {
            _hook_currentLimitChanged();
          }
          if (v19 && v19 != -536870183 || v22 && v22 != -536870183) {
            goto LABEL_234;
          }
          v79 = logObjectForModule(0);
          if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 67109632;
            *(_DWORD *)v179 = v7;
            *(_WORD *)&v179[4] = 1024;
            *(_DWORD *)&v179[6] = v174;
            *(_WORD *)v180 = 1024;
            *(_DWORD *)&v180[2] = out_token;
            _os_log_impl(&dword_0, v79, OS_LOG_TYPE_INFO, "kIOAccessoryManagerMessageUSBCurrentLimitChange primaryPort: %d, currentLimit: %d, chargeVoltage: %d", buf, 0x14u);
          }

          v80 = [v5 chargeConfigDict];

          if (!v80)
          {
            v81 = +[NSMutableDictionary dictionary];
            [v5 setChargeConfigDict:v81];
          }
          v82 = [v5 chargeConfigDict];
          v83 = +[NSNumber numberWithInt:v7];
          v74 = [v82 objectForKey:v83];

          if (!v74)
          {
            v183[0] = @"lightningCableType";
            v88 = +[NSNumber numberWithInt:0];
            v184[0] = v88;
            v183[1] = @"chargingVoltage";
            v89 = +[NSNumber numberWithUnsignedInt:out_token];
            v184[1] = v89;
            v183[2] = @"chargingCurrent";
            v90 = +[NSNumber numberWithUnsignedInt:v174];
            v184[2] = v90;
            v91 = +[NSDictionary dictionaryWithObjects:v184 forKeys:v183 count:3];
            v84 = +[NSMutableDictionary dictionaryWithDictionary:v91];

            v92 = [v5 chargeConfigDict];
            v93 = +[NSNumber numberWithInt:v7];
            [v92 setObject:v84 forKey:v93];

            goto LABEL_182;
          }
          v84 = [(AttachEvent *)v74 objectForKey:@"chargingVoltage"];
          v85 = [(AttachEvent *)v74 objectForKey:@"chargingCurrent"];
          if (v84)
          {
            unsigned int v86 = [v84 intValue];
            uint64_t v87 = out_token;
            if (v86 == out_token) {
              goto LABEL_176;
            }
          }
          else
          {
            uint64_t v87 = out_token;
          }
          v94 = +[NSNumber numberWithInt:v87];
          [(AttachEvent *)v74 setObject:v94 forKey:@"chargingVoltage"];

LABEL_176:
          if (v85)
          {
            unsigned int v95 = [v85 intValue];
            uint64_t v96 = v174;
            if (v95 == v174) {
              goto LABEL_181;
            }
          }
          else
          {
            uint64_t v96 = v174;
          }
          v97 = +[NSNumber numberWithInt:v96];
          [(AttachEvent *)v74 setObject:v97 forKey:@"chargingCurrent"];

LABEL_181:
LABEL_182:

          v98 = logObjectForModule(0);
          if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
          {
            v99 = [v5 chargeConfigDict];
            *(_DWORD *)long long buf = 138412290;
            *(void *)v179 = v99;
            _os_log_impl(&dword_0, v98, OS_LOG_TYPE_INFO, "chargeConfigDict: %@", buf, 0xCu);
          }
          goto LABEL_233;
        default:
          if (a3 == -536870896)
          {
            if (gLogObjects && gNumLogObjects >= 1)
            {
              uint64_t v17 = *(id *)gLogObjects;
            }
            else
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                -[AirplaneMode init]();
              }
              uint64_t v17 = &_os_log_default;
              id v52 = &_os_log_default;
            }
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 67109120;
              *(_DWORD *)v179 = v7;
              _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "kIOMessageServiceIsTerminated recieved on primaryPort: %d", buf, 8u);
            }

            v53 = +[NSNumber numberWithInt:v7];
            unsigned int v54 = [v5 doAttachEventsForPrimaryPortExistInList:v53];

            if (v54)
            {
              v55 = +[NSNumber numberWithUnsignedLongLong:systemInfo_getCurrentUnixTimeMS()];
              v56 = [DetachEvent alloc];
              v57 = +[NSNumber numberWithInt:v7];
              v58 = -[DetachEvent initWithTimestamp:primaryPort:restrictedModeEnabled:](v56, "initWithTimestamp:primaryPort:restrictedModeEnabled:", v55, v57, [v5 restrictedModeEnabled]);

              v59 = [v5 rmEventArray];
              [v59 addObject:v58];

              dispatch_time_t v60 = dispatch_walltime(0, 65000000000);
              v61 = [v5 ioAccessoryEventQueue];
              v156[0] = _NSConcreteStackBlock;
              v156[1] = 3221225472;
              v156[2] = __IOAccessoryManagerEventCallback_block_invoke_867;
              v156[3] = &unk_516B8;
              id v157 = v5;
              id v158 = v55;
              int v159 = v7;
              id v62 = v55;
              dispatch_after(v60, v61, v156);
            }
            _updateCachedAccessoryDetachTimes(v5, v7);
            _removeCachedDigitalID(v5, v7);
          }
          goto LABEL_234;
      }
      goto LABEL_25;
    }
    if ((a3 + 469794746) < 2)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v16 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          -[AirplaneMode init]();
        }
        id v16 = &_os_log_default;
        id v46 = &_os_log_default;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 67109888;
        *(_DWORD *)v179 = -469794746;
        *(_WORD *)&v179[4] = 1024;
        *(_DWORD *)&v179[6] = -469794745;
        *(_WORD *)v180 = 1024;
        *(_DWORD *)&v180[2] = a3;
        __int16 v181 = 1024;
        int v182 = v7;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "kIOAccessoryManagerMessageAccIDScorpiusUnknown(%x)/Pencil(%x) %x recieved on primaryPort: %d", buf, 0x1Au);
      }

      int out_token = -1;
      if (notify_register_check("com.apple.accessories.scp.objdetect", &out_token))
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          id v8 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            -[AirplaneMode init]();
          }
          id v8 = &_os_log_default;
          id v51 = &_os_log_default;
        }
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 136315138;
          *(void *)v179 = "com.apple.accessories.scp.objdetect";
          char v25 = "Faied to register for %s notification!";
          __int16 v26 = v8;
          os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
          uint32_t v28 = 12;
LABEL_113:
          _os_log_impl(&dword_0, v26, v27, v25, buf, v28);
        }
LABEL_114:
      }
      else
      {
        if (a3 == -469794745) {
          uint64_t v48 = 2;
        }
        else {
          uint64_t v48 = 1;
        }
        notify_set_state(out_token, v48);
        notify_cancel(out_token);
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v49 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            -[AirplaneMode init]();
          }
          v49 = &_os_log_default;
          id v76 = &_os_log_default;
        }
        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 136315138;
          *(void *)v179 = "com.apple.accessories.scp.objdetect";
          _os_log_impl(&dword_0, v49, OS_LOG_TYPE_INFO, "Post notification %s!", buf, 0xCu);
        }

        notify_post("com.apple.accessories.scp.objdetect");
      }
    }
    else if (a3 == -469794716)
    {
LABEL_26:
      uint64_t v12 = [v5 carPlayEventQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __IOAccessoryManagerEventCallback_block_invoke_864;
      block[3] = &unk_51448;
      id v13 = v5;
      id v165 = v13;
      dispatch_async(v12, block);

      uint64_t v14 = +[NSNumber numberWithUnsignedLongLong:systemInfo_getCurrentUnixTimeMS()];
      if (gLogObjects && gNumLogObjects >= 1)
      {
        uint64_t v15 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          -[AirplaneMode init]();
        }
        uint64_t v15 = &_os_log_default;
        id v29 = &_os_log_default;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 67109120;
        *(_DWORD *)v179 = v7;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "kIOAccessoryManagerMessageDetach/AccIDNoneConnected received on primaryPort: %d", buf, 8u);
      }

      uint64_t v30 = [v13 chargeConfigDict];
      v31 = +[NSNumber numberWithInt:v7];
      [v30 removeObjectForKey:v31];

      if (gLogObjects && gNumLogObjects >= 1)
      {
        v32 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          -[AirplaneMode init]();
        }
        v32 = &_os_log_default;
        id v33 = &_os_log_default;
      }
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        __int16 v34 = [v13 chargeConfigDict];
        *(_DWORD *)long long buf = 138412290;
        *(void *)v179 = v34;
        _os_log_impl(&dword_0, v32, OS_LOG_TYPE_INFO, "chargeConfigDict: %@", buf, 0xCu);
      }
      if (gLogObjects && gNumLogObjects >= 4)
      {
        int v35 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          -[AirplaneMode init]();
        }
        int v35 = &_os_log_default;
        id v36 = &_os_log_default;
      }
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_0, v35, OS_LOG_TYPE_DEFAULT, "_hook_detach() called!", buf, 2u);
      }

      uint64_t v37 = [DetachEvent alloc];
      char v38 = +[NSNumber numberWithInt:v7];
      v39 = -[DetachEvent initWithTimestamp:primaryPort:restrictedModeEnabled:](v37, "initWithTimestamp:primaryPort:restrictedModeEnabled:", v14, v38, [v13 restrictedModeEnabled]);

      v40 = [v13 rmEventArray];
      [v40 addObject:v39];

      dispatch_time_t v41 = dispatch_walltime(0, 65000000000);
      v42 = [v13 ioAccessoryEventQueue];
      v160[0] = _NSConcreteStackBlock;
      v160[1] = 3221225472;
      v160[2] = __IOAccessoryManagerEventCallback_block_invoke_865;
      v160[3] = &unk_516B8;
      id v43 = v13;
      id v161 = v43;
      id v44 = v14;
      id v162 = v44;
      int v163 = v7;
      dispatch_after(v41, v42, v160);

      _updateCachedAccessoryDetachTimes(v43, v7);
      _removeCachedDigitalID(v43, v7);
      int out_token = -1;
      if (notify_register_check("com.apple.accessories.scp.objdetect", &out_token))
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v45 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            -[AirplaneMode init]();
          }
          v45 = &_os_log_default;
          id v50 = &_os_log_default;
        }
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 136315138;
          *(void *)v179 = "com.apple.accessories.scp.objdetect";
          _os_log_impl(&dword_0, v45, OS_LOG_TYPE_DEFAULT, "Failed to register for %s notification!", buf, 0xCu);
        }
      }
      else
      {
        notify_set_state(out_token, 0);
        notify_cancel(out_token);
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v47 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            -[AirplaneMode init]();
          }
          v47 = &_os_log_default;
          id v63 = &_os_log_default;
        }
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 136315138;
          *(void *)v179 = "com.apple.accessories.scp.objdetect";
          _os_log_impl(&dword_0, v47, OS_LOG_TYPE_INFO, "Post notification %s!", buf, 0xCu);
        }

        notify_post("com.apple.accessories.scp.objdetect");
      }
    }
    else if (a3 == -469794725)
    {
      if (IOAccessoryManagerGetDigitalID())
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          uint64_t v11 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            -[AirplaneMode init]();
          }
          uint64_t v11 = &_os_log_default;
          id v77 = &_os_log_default;
        }
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          IOAccessoryManagerEventCallback_cold_3();
        }
LABEL_25:

        goto LABEL_234;
      }
      LOBYTE(out_token) = 0;
      unsigned int v154 = _digitalIDSupportsTransport((char *)&v172, 0);
      char v152 = _digitalIDSupportsTransport((char *)&v172, 1);
      char cf = _digitalIDSupportsTransport((char *)&v172, 2);
      char v64 = _digitalIDSupportsTransport((char *)&v172, 3);
      _generateUART_MB_AIDB_AccessoryConnectionStatisticsEvent(v5, v7, (char *)&v172);
      if (IOAccessoryManagerGetUSBConnectType()) {
        unsigned int v177 = -1;
      }
      _hook_digitalIDAttached(&out_token);
      if ((_BYTE)out_token) {
        _generateUnlockDialogSeenAnalyticEvent(a2, v5);
      }
      if (v7 == 256 || v7 == 1)
      {
        v65 = logObjectForModule(0);
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          v66 = +[NSData dataWithBytes:&v172 length:6];
          *(_DWORD *)long long buf = 138412290;
          *(void *)v179 = v66;
          _os_log_impl(&dword_0, v65, OS_LOG_TYPE_DEFAULT, "IOAccessoryManagerEventCallback kIOAccessoryManagerMessageAccIDDigitalID launching clients due to accDigitalID: %@", buf, 0xCu);
        }
        [v5 launchDigitalIDClients];
      }
      v67 = [AttachEvent alloc];
      v68 = +[NSNumber numberWithUnsignedLongLong:systemInfo_getCurrentUnixTimeMS()];
      v69 = +[NSNumber numberWithInt:v177];
      v70 = +[NSNumber numberWithInt:v7];
      id v71 = [v5 restrictedModeEnabled];
      uint64_t v72 = out_token;
      v73 = +[NSData dataWithBytes:&v172 length:6];
      BYTE2(v150) = v64;
      BYTE1(v150) = cf;
      LOBYTE(v150) = v152;
      v74 = -[AttachEvent initWithTimestamp:connectType:primaryPort:restrictedModeEnabled:dialogShown:supportsUSB:supportsUART:supportsMB:supportsAIDBulkPipes:digitalID:](v67, "initWithTimestamp:connectType:primaryPort:restrictedModeEnabled:dialogShown:supportsUSB:supportsUART:supportsMB:supportsAIDBulkPipes:digitalID:", v68, v69, v70, v71, v72, v154, v150, v73);

      v75 = [v5 rmEventArray];
      [v75 addObject:v74];

      _cacheDigitalID(v5, v7, (uint64_t)&v172);
LABEL_233:
    }
  }
LABEL_234:
}

uint64_t _digitalIDSupportsTransport(char *a1, int a2)
{
  uint64_t v23 = v2;
  uint64_t v24 = v3;
  switch(a2)
  {
    case 0:
      uint64_t result = 0;
      char v6 = *a1;
      if ((v6 & 0x20) == 0 && (v6 & 0x18) != 0)
      {
        if (gLogObjects) {
          BOOL v7 = gNumLogObjects < 1;
        }
        else {
          BOOL v7 = 1;
        }
        if (v7)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            -[AirplaneMode init]();
          }
          uint64_t v14 = &_os_log_default;
          id v8 = &_os_log_default;
        }
        else
        {
          uint64_t v14 = *(id *)gLogObjects;
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          __int16 v22 = 0;
          uint64_t v15 = "Accessory's digitalID supports USB";
          id v16 = (uint8_t *)&v22;
          goto LABEL_51;
        }
        goto LABEL_52;
      }
      break;
    case 1:
      uint64_t result = 0;
      char v9 = *a1;
      if ((v9 & 0x20) == 0 && (v9 & 3) != 0)
      {
        if (gLogObjects) {
          BOOL v10 = gNumLogObjects < 1;
        }
        else {
          BOOL v10 = 1;
        }
        if (v10)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            -[AirplaneMode init]();
          }
          uint64_t v14 = &_os_log_default;
          id v11 = &_os_log_default;
        }
        else
        {
          uint64_t v14 = *(id *)gLogObjects;
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          __int16 v21 = 0;
          uint64_t v15 = "Accessory's digitalID supports UART";
          id v16 = (uint8_t *)&v21;
          goto LABEL_51;
        }
        goto LABEL_52;
      }
      break;
    case 2:
      if ((*a1 & 0x24) != 4) {
        goto LABEL_34;
      }
      if (gLogObjects) {
        BOOL v12 = gNumLogObjects < 1;
      }
      else {
        BOOL v12 = 1;
      }
      if (v12)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          -[AirplaneMode init]();
        }
        uint64_t v14 = &_os_log_default;
        id v13 = &_os_log_default;
      }
      else
      {
        uint64_t v14 = *(id *)gLogObjects;
      }
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
        goto LABEL_52;
      }
      __int16 v20 = 0;
      uint64_t v15 = "Accessory's digitalID supports MikeyBus";
      id v16 = (uint8_t *)&v20;
      goto LABEL_51;
    case 3:
      if (*a1 & 0x20) == 0 && (a1[2])
      {
        if (gLogObjects) {
          BOOL v17 = gNumLogObjects < 1;
        }
        else {
          BOOL v17 = 1;
        }
        if (v17)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            -[AirplaneMode init]();
          }
          uint64_t v14 = &_os_log_default;
          id v18 = &_os_log_default;
        }
        else
        {
          uint64_t v14 = *(id *)gLogObjects;
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          __int16 v19 = 0;
          uint64_t v15 = "Accessory's digitalID supports AIDB Bulk Pipes";
          id v16 = (uint8_t *)&v19;
LABEL_51:
          _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, v15, v16, 2u);
        }
LABEL_52:

        uint64_t result = 1;
      }
      else
      {
LABEL_34:
        uint64_t result = 0;
      }
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

void _hook_digitalIDAttached(unsigned char *a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 4;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init]();
    }
    io_registry_entry_t v4 = &_os_log_default;
    id v3 = &_os_log_default;
  }
  else
  {
    io_registry_entry_t v4 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "_hook_digitalIDAttached() called!", v5, 2u);
  }

  if (a1) {
    *a1 = 0;
  }
}

void _generateUnlockDialogSeenAnalyticEvent(uint64_t a1, void *a2)
{
  id v2 = a2;
  unsigned int v36 = -1;
  char v35 = 0;
  __int16 v34 = -21846;
  unsigned int v32 = 0;
  int v33 = -1431655766;
  unsigned int v31 = 0;
  if (!v2)
  {
    __int16 v21 = logObjectForModule(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      _generateUnlockDialogSeenAnalyticEvent_cold_1();
    }
    goto LABEL_37;
  }
  if (!IOAccessoryManagerGetDigitalID())
  {
    id v3 = CFStringCreateFromCFData((const __CFData *)+[NSData dataWithBytes:&v33 length:6], @"%02X");
    if (v3)
    {
      io_registry_entry_t v4 = v3;
      if (IOAccessoryPortGetServiceWithPort())
      {
        Manageruint64_t PrimaryPort = IOAccessoryPortGetManagerPrimaryPort();
        if (IOAccessoryManagerGetServiceWithPrimaryPort())
        {
          if (IOAccessoryManagerGetUSBConnectType())
          {
            id v18 = logObjectForModule(0);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              IOAccessoryManagerEventCallback_cold_10();
            }
          }
          else
          {
            int USBChargingVoltage = IOAccessoryManagerGetUSBChargingVoltage();
            if (USBChargingVoltage != -536870183 && USBChargingVoltage)
            {
              if (gLogObjects && gNumLogObjects >= 1)
              {
                id v18 = *(id *)gLogObjects;
              }
              else
              {
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                  -[AirplaneMode init]();
                }
                id v18 = &_os_log_default;
                id v19 = &_os_log_default;
              }
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
                IOAccessoryManagerEventCallback_cold_14();
              }
            }
            else
            {
              int USBCurrentLimit = IOAccessoryManagerGetUSBCurrentLimit();
              if (USBCurrentLimit != -536870183 && USBCurrentLimit)
              {
                if (gLogObjects && gNumLogObjects >= 1)
                {
                  id v18 = *(id *)gLogObjects;
                }
                else
                {
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                    -[AirplaneMode init]();
                  }
                  id v18 = &_os_log_default;
                  id v20 = &_os_log_default;
                }
                if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
                  IOAccessoryManagerEventCallback_cold_7();
                }
              }
              else
              {
                v37[0] = @"lightningCableType";
                os_log_type_t v27 = +[NSNumber numberWithInt:v36];
                v38[0] = v27;
                v37[1] = @"lightningPrimaryPortNumber";
                __int16 v26 = +[NSNumber numberWithInt:ManagerPrimaryPort];
                v38[1] = v26;
                v37[2] = @"lightningDigitalID";
                char v25 = (void *)CFRetain(v4);
                v38[2] = v25;
                v37[3] = @"deviceIsPowered";
                uint64_t v24 = +[NSNumber numberWithBool:v31 != 0];
                v38[3] = v24;
                v37[4] = @"chargingVoltage";
                uint64_t v23 = +[NSNumber numberWithInt:v32];
                v38[4] = v23;
                v37[5] = @"chargingCurrent";
                id v8 = +[NSNumber numberWithInt:v31];
                v38[5] = v8;
                v38[6] = @"1.2";
                v37[6] = @"eventVersion";
                v37[7] = @"unlockedSinceBoot";
                char v9 = +[NSNumber numberWithBool:MKBDeviceUnlockedSinceBoot() != 0];
                v38[7] = v9;
                v37[8] = @"supportsUSB";
                +[NSNumber numberWithBool:_digitalIDSupportsTransport((char *)&v33, 0)];
                BOOL v10 = v28 = v4;
                v38[8] = v10;
                v37[9] = @"supportsUART";
                id v11 = +[NSNumber numberWithBool:_digitalIDSupportsTransport((char *)&v33, 1)];
                v38[9] = v11;
                v37[10] = @"supportsMikeyBus";
                BOOL v12 = +[NSNumber numberWithBool:_digitalIDSupportsTransport((char *)&v33, 2)];
                v38[10] = v12;
                v37[11] = @"supportsAIDBulkPipes";
                id v13 = +[NSNumber numberWithBool:_digitalIDSupportsTransport((char *)&v33, 3)];
                v38[11] = v13;
                v37[12] = @"restrictedModeTimeout";
                uint64_t v14 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v2 usbRestrictedModeTimeout]);
                v38[12] = v14;
                uint64_t v15 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:13];
                id v16 = +[NSMutableDictionary dictionaryWithDictionary:v15];

                io_registry_entry_t v4 = v28;
                BOOL v17 = [v2 analyticsQueue];
                block[0] = _NSConcreteStackBlock;
                block[1] = 3221225472;
                block[2] = ___generateUnlockDialogSeenAnalyticEvent_block_invoke;
                block[3] = &unk_51448;
                id v30 = v16;
                id v18 = v16;
                dispatch_async(v17, block);
              }
            }
          }
        }
        else
        {
          id v18 = logObjectForModule(0);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            IOAccessoryManagerEventCallback_cold_6();
          }
        }
      }
      else
      {
        id v18 = logObjectForModule(0);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          IOAccessoryManagerEventCallback_cold_5();
        }
      }

      CFRelease(v4);
      goto LABEL_29;
    }
    __int16 v21 = logObjectForModule(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      _generateUnlockDialogSeenAnalyticEvent_cold_2();
    }
LABEL_37:

    goto LABEL_29;
  }
  __int16 v22 = logObjectForModule(0);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    _generateUnlockDialogSeenAnalyticEvent_cold_10();
  }

LABEL_29:
}

void _hook_usbConnectTypeChanged(int a1, int a2, unsigned char *a3)
{
  if (gLogObjects) {
    BOOL v6 = gNumLogObjects < 4;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init]();
    }
    id v8 = &_os_log_default;
    id v7 = &_os_log_default;
  }
  else
  {
    id v8 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15[0]) = 0;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "_hook_usbConnectTypeChanged() called!", (uint8_t *)v15, 2u);
  }

  if (_hook_usbConnectTypeChanged_onceToken != -1) {
    dispatch_once(&_hook_usbConnectTypeChanged_onceToken, &__block_literal_global_885);
  }
  if (gLogObjects && gNumLogObjects >= 4)
  {
    char v9 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init]();
    }
    char v9 = &_os_log_default;
    id v10 = &_os_log_default;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 67109632;
    v15[1] = a1;
    __int16 v16 = 1024;
    int v17 = a2;
    __int16 v18 = 1024;
    int v19 = _hook_usbConnectTypeChanged_previousConnectTypePublished;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "_hook_usbConnectTypeChanged: (connectType: %d, connectTypePublished: %d, previousConnectTypePublished: %d)", (uint8_t *)v15, 0x14u);
  }

  if (!_hook_usbConnectTypeChanged_usbTypeCDevice)
  {
    if ((a2 - 2) > 3)
    {
      if ((a2 + 1) <= 1
        && (_hook_usbConnectTypeChanged_previousConnectTypePublished - 2) <= 3)
      {
        if (gLogObjects && gNumLogObjects >= 4)
        {
          BOOL v12 = *(id *)(gLogObjects + 24);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            -[AirplaneMode init]();
          }
          BOOL v12 = &_os_log_default;
          id v14 = &_os_log_default;
        }
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v15[0]) = 0;
          _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "USB was detached!", (uint8_t *)v15, 2u);
        }

        acc_restrictedMode_accessoryDetached();
      }
    }
    else if ((_hook_usbConnectTypeChanged_previousConnectTypePublished + 1) <= 1)
    {
      if (gLogObjects && gNumLogObjects >= 4)
      {
        id v11 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          -[AirplaneMode init]();
        }
        id v11 = &_os_log_default;
        id v13 = &_os_log_default;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15[0]) = 0;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "USB was attached!", (uint8_t *)v15, 2u);
      }

      acc_restrictedMode_accessoryAttached();
    }
  }
  _hook_usbConnectTypeChanged_previousConnectTypePublished = a2;
  if (a3) {
    *a3 = 0;
  }
}

void _generateUART_MB_AIDB_AccessoryConnectionStatisticsEvent(void *a1, uint64_t a2, char *a3)
{
  id v5 = a1;
  uint64_t v6 = _digitalIDSupportsTransport(a3, 1);
  uint64_t v7 = _digitalIDSupportsTransport(a3, 2);
  uint64_t v8 = _digitalIDSupportsTransport(a3, 3);
  if ((v6 & 1) == 0 && (v7 & 1) == 0 && !v8) {
    goto LABEL_57;
  }
  id v71 = v5;
  uint64_t v9 = v8;
  unsigned int v69 = v7;
  if (v6)
  {
    id v10 = v5;
    unint64_t CurrentUnixTimeMS = systemInfo_getCurrentUnixTimeMS();
    BOOL v12 = [v10 uartAccessoryDetachTimesDict];
    id v13 = (__CFString *)CFStringCreateFromFormat(a2, @"%d");
    id v14 = [v12 objectForKey:v13];

    if (v14)
    {
      id v15 = [v14 unsignedLongLongValue];
      if (gLogObjects && gNumLogObjects >= 1)
      {
        __int16 v16 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          -[AirplaneMode init]();
        }
        __int16 v16 = &_os_log_default;
        id v17 = &_os_log_default;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 134218496;
        unint64_t v77 = CurrentUnixTimeMS;
        __int16 v78 = 2048;
        id v79 = [v14 unsignedLongLongValue];
        __int16 v80 = 2048;
        unint64_t v81 = CurrentUnixTimeMS - (void)v15;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "now: %llu, lastUARTAccessoryDetachTime: %llu, lastUARTDetachEventDuration: %llu", buf, 0x20u);
      }
      unint64_t v68 = CurrentUnixTimeMS - (void)v15;

      __int16 v18 = [v10 uartAccessoryDetachTimesDict];
      int v19 = (__CFString *)CFStringCreateFromFormat(a2, @"%d");
      [v18 removeObjectForKey:v19];

      id v20 = [v10 pluginDefaults];
      __int16 v21 = [v10 uartAccessoryDetachTimesDict];
      [v20 setObject:v21 forKey:@"uartDetachTimes"];
    }
    else
    {
      unint64_t v68 = 0;
    }

    id v5 = v71;
    LODWORD(v8) = v9;
    uint64_t v7 = v69;
    if (v69)
    {
LABEL_19:
      id v22 = v5;
      unint64_t v23 = systemInfo_getCurrentUnixTimeMS();
      uint64_t v24 = [v22 mikeyBusAccessoryDetachTimesDict];
      char v25 = (__CFString *)CFStringCreateFromFormat(a2, @"%d");
      __int16 v26 = [v24 objectForKey:v25];

      if (v26)
      {
        id v27 = [v26 unsignedLongLongValue];
        if (gLogObjects && gNumLogObjects >= 1)
        {
          uint32_t v28 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            -[AirplaneMode init]();
          }
          uint32_t v28 = &_os_log_default;
          id v29 = &_os_log_default;
        }
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          id v30 = [v26 unsignedLongLongValue];
          *(_DWORD *)long long buf = 134218496;
          unint64_t v77 = v23;
          __int16 v78 = 2048;
          id v79 = v30;
          __int16 v80 = 2048;
          unint64_t v81 = v23 - (void)v27;
          _os_log_impl(&dword_0, v28, OS_LOG_TYPE_INFO, "now: %llu, lastMikeyBusAccessoryDetachTime: %llu, lastMikeyBusDetachEventDuration: %llu", buf, 0x20u);
        }
        unint64_t v67 = v23 - (void)v27;

        unsigned int v31 = [v22 mikeyBusAccessoryDetachTimesDict];
        unsigned int v32 = (__CFString *)CFStringCreateFromFormat(a2, @"%d");
        [v31 removeObjectForKey:v32];

        int v33 = [v22 pluginDefaults];
        __int16 v34 = [v22 mikeyBusAccessoryDetachTimesDict];
        [v33 setObject:v34 forKey:@"mikeyBusDetachTimes"];
      }
      else
      {
        unint64_t v67 = 0;
      }

      id v5 = v71;
      uint64_t v7 = v69;
      if (v9) {
        goto LABEL_30;
      }
      goto LABEL_11;
    }
  }
  else
  {
    unint64_t v68 = 0;
    if (v7) {
      goto LABEL_19;
    }
  }
  unint64_t v67 = 0;
  if (v8)
  {
LABEL_30:
    id v35 = v5;
    unint64_t v36 = systemInfo_getCurrentUnixTimeMS();
    uint64_t v37 = [v35 aidBulkPipeAccessoryDetachTimesDict];
    char v38 = (__CFString *)CFStringCreateFromFormat(a2, @"%d");
    v39 = [v37 objectForKey:v38];

    if (v39)
    {
      id v40 = [v39 unsignedLongLongValue];
      if (gLogObjects && gNumLogObjects >= 1)
      {
        dispatch_time_t v41 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          -[AirplaneMode init]();
        }
        dispatch_time_t v41 = &_os_log_default;
        id v42 = &_os_log_default;
      }
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        id v43 = [v39 unsignedLongLongValue];
        *(_DWORD *)long long buf = 134218496;
        unint64_t v77 = v36;
        __int16 v78 = 2048;
        id v79 = v43;
        __int16 v80 = 2048;
        unint64_t v81 = v36 - (void)v40;
        _os_log_impl(&dword_0, v41, OS_LOG_TYPE_INFO, "now: %llu, lastAIDBulkPipeAccessoryDetachTime: %llu, lastMikeyBusDetachEventDuration: %llu", buf, 0x20u);
      }
      unint64_t v66 = v36 - (void)v40;

      id v44 = [v35 aidBulkPipeAccessoryDetachTimesDict];
      v45 = (__CFString *)CFStringCreateFromFormat(a2, @"%d");
      [v44 removeObjectForKey:v45];

      id v46 = [v35 pluginDefaults];
      v47 = [v35 aidBulkPipeAccessoryDetachTimesDict];
      [v46 setObject:v47 forKey:@"aidBulkPipeDetachTimes"];
    }
    else
    {
      unint64_t v66 = 0;
    }

    id v5 = v71;
    uint64_t v7 = v69;
    goto LABEL_41;
  }
LABEL_11:
  unint64_t v66 = 0;
LABEL_41:
  uint64_t v48 = CFStringCreateFromCFData((const __CFData *)+[NSData dataWithBytes:a3 length:6], @"%02X");
  v74[0] = @"screenIsLocked";
  int v49 = MKBGetDeviceLockState();
  BOOL v50 = (v49 - 1) < 2;
  if (v49 == 3) {
    BOOL v50 = 0;
  }
  if (v49) {
    BOOL v51 = v50;
  }
  else {
    BOOL v51 = 0;
  }
  id v52 = +[NSNumber numberWithBool:v51];
  v75[0] = v52;
  v74[1] = @"unlockedSinceBoot";
  v53 = +[NSNumber numberWithBool:MKBDeviceUnlockedSinceBoot() != 0];
  v75[1] = v53;
  v74[2] = @"lightningDigitalID";
  v70 = v48;
  if (v48) {
    uint64_t v48 = (void *)CFRetain(v48);
  }
  v75[2] = v48;
  v74[3] = @"lightningPrimaryPortNumber";
  unsigned int v54 = +[NSNumber numberWithInt:a2];
  v75[3] = v54;
  v74[4] = @"supportsUART";
  v55 = +[NSNumber numberWithBool:v6];
  v75[4] = v55;
  v74[5] = @"supportsMikeyBus";
  v56 = +[NSNumber numberWithBool:v7];
  v75[5] = v56;
  v74[6] = @"supportsAIDBulkPipes";
  v57 = +[NSNumber numberWithBool:v9];
  v75[6] = v57;
  v75[7] = @"1.0";
  v74[7] = @"eventVersion";
  v74[8] = @"restrictedModeTimeout";
  v58 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v5 usbRestrictedModeTimeout]);
  v75[8] = v58;
  v59 = +[NSDictionary dictionaryWithObjects:v75 forKeys:v74 count:9];
  dispatch_time_t v60 = +[NSMutableDictionary dictionaryWithDictionary:v59];

  if (v68)
  {
    CFNumberRef BucketizedAnalyticEventDuration = acc_analytics_createBucketizedAnalyticEventDuration(v68 / 0x3E8);
    [v60 setObject:BucketizedAnalyticEventDuration forKey:@"timeSinceLastUARTDetach"];
  }
  if (v67)
  {
    CFNumberRef v62 = acc_analytics_createBucketizedAnalyticEventDuration(v67 / 0x3E8);
    [v60 setObject:v62 forKey:@"timeSinceLastMikeyBusDetach"];
  }
  id v5 = v71;
  if (v66)
  {
    CFNumberRef v63 = acc_analytics_createBucketizedAnalyticEventDuration(v66 / 0x3E8);
    [v60 setObject:v63 forKey:@"timeSinceLastAIDBulkPipeDetach"];
  }
  char v64 = [v71 analyticsQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = ___generateUART_MB_AIDB_AccessoryConnectionStatisticsEvent_block_invoke;
  block[3] = &unk_51448;
  id v65 = v60;
  id v73 = v65;
  dispatch_async(v64, block);

  if (v70) {
    CFRelease(v70);
  }

LABEL_57:
}

void _cacheDigitalID(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  uint64_t v6 = [v5 digitalIDCacheDict];

  if (!v6)
  {
    uint64_t v7 = +[NSMutableDictionary dictionary];
    [v5 setDigitalIDCacheDict:v7];
  }
  uint64_t v8 = [v5 digitalIDCacheDict];
  uint64_t v9 = +[NSData dataWithBytes:a3 length:6];
  id v10 = (__CFString *)CFStringCreateFromFormat(a2, @"%d");
  [v8 setObject:v9 forKey:v10];

  id v11 = [v5 pluginDefaults];
  BOOL v12 = [v5 digitalIDCacheDict];
  [v11 setObject:v12 forKey:@"cachedDigitalID"];

  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v13 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init]();
    }
    id v13 = &_os_log_default;
    id v14 = &_os_log_default;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v15 = [v5 digitalIDCacheDict];
    int v16 = 138412290;
    id v17 = v15;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "kIOAccessoryManagerMessageAccIDDigitalID digitalIDCacheDict: %@", (uint8_t *)&v16, 0xCu);
  }
}

id __IOAccessoryManagerEventCallback_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setRoleSwapMaskForUSBPort];
}

void __IOAccessoryManagerEventCallback_block_invoke_862(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 1;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init]();
    }
    io_registry_entry_t v4 = &_os_log_default;
    id v3 = &_os_log_default;
  }
  else
  {
    io_registry_entry_t v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = @"com.apple.accessories.cable.typeChanged";
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "CoreAnalytics event: %@\neventDict: %@", (uint8_t *)&v7, 0x16u);
  }

  AnalyticsSendEvent();
  if (*(_DWORD *)(a1 + 40) != 1)
  {
    uint64_t v6 = +[ACCAnalytics loggerForUser:0];
    [v6 logACCAnalyticsForEventNamed:@"accessoryCableTypeChanged" withAttributes:*(void *)(a1 + 32)];
  }
}

void _generateUSBAccessoryConnectionStatisticsEvent(void *a1, uint64_t a2, char *a3, uint64_t a4)
{
  id v7 = a1;
  if (_digitalIDSupportsTransport(a3, 0))
  {
    uint64_t v8 = [v7 lastUSBAccessoryDetachTime];

    unint64_t v36 = v7;
    if (v8)
    {
      id v9 = v7;
      unint64_t CurrentUnixTimeMS = systemInfo_getCurrentUnixTimeMS();
      id v11 = [v9 lastUSBAccessoryDetachTime];
      id v12 = [v11 unsignedLongLongValue];

      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v13 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          -[AirplaneMode init]();
        }
        id v13 = &_os_log_default;
        id v15 = &_os_log_default;
      }
      unint64_t v14 = CurrentUnixTimeMS - (void)v12;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v16 = [v9 lastUSBAccessoryDetachTime];
        *(_DWORD *)long long buf = 134218496;
        unint64_t v42 = CurrentUnixTimeMS;
        __int16 v43 = 2048;
        id v44 = [v16 unsignedLongLongValue];
        __int16 v45 = 2048;
        unint64_t v46 = v14;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "now: %llu, lastUSBAccessoryDetachTime: %llu, lastUSBDetachEventDuration: %llu", buf, 0x20u);
      }
      [v9 setLastUSBAccessoryDetachTime:0];
      id v17 = [v9 pluginDefaults];
      [v17 removeObjectForKey:@"lastUSBDetach"];

      id v7 = v36;
    }
    else
    {
      unint64_t v14 = 0;
    }
    __int16 v18 = CFStringCreateFromCFData((const __CFData *)+[NSData dataWithBytes:a3 length:6], @"%02X");
    v39[0] = @"screenIsLocked";
    int v19 = MKBGetDeviceLockState();
    BOOL v20 = (v19 - 1) < 2;
    if (v19 == 3) {
      BOOL v20 = 0;
    }
    if (v19) {
      BOOL v21 = v20;
    }
    else {
      BOOL v21 = 0;
    }
    id v22 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v21, NSMutableDictionary);
    v40[0] = v22;
    v39[1] = @"unlockedSinceBoot";
    unint64_t v23 = +[NSNumber numberWithBool:MKBDeviceUnlockedSinceBoot() != 0];
    v40[1] = v23;
    v39[2] = @"lightningDigitalID";
    unint64_t v35 = v14;
    if (v18) {
      uint64_t v24 = (void *)CFRetain(v18);
    }
    else {
      uint64_t v24 = 0;
    }
    v40[2] = v24;
    v39[3] = @"lightningPrimaryPortNumber";
    char v25 = +[NSNumber numberWithInt:a2];
    v40[3] = v25;
    v39[4] = @"supportsUSB";
    __int16 v26 = +[NSNumber numberWithBool:1];
    v40[4] = v26;
    v40[5] = @"1.0";
    v39[5] = @"eventVersion";
    v39[6] = @"lightningCableType";
    id v27 = +[NSNumber numberWithInt:a4];
    v40[6] = v27;
    v39[7] = @"restrictedModeTimeout";
    uint32_t v28 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v7 usbRestrictedModeTimeout]);
    v40[7] = v28;
    id v29 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:8];
    id v30 = [v34 dictionaryWithDictionary:v29];

    if (v35)
    {
      CFNumberRef BucketizedAnalyticEventDuration = acc_analytics_createBucketizedAnalyticEventDuration(v35 / 0x3E8);
      [v30 setObject:BucketizedAnalyticEventDuration forKey:@"timeSinceLastUSBDetach"];
    }
    id v7 = v36;
    unsigned int v32 = [v36 analyticsQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = ___generateUSBAccessoryConnectionStatisticsEvent_block_invoke;
    block[3] = &unk_51448;
    id v33 = v30;
    id v38 = v33;
    dispatch_async(v32, block);

    if (v18) {
      CFRelease(v18);
    }
  }
}

void _hook_currentLimitChanged()
{
  if (gLogObjects) {
    BOOL v0 = gNumLogObjects < 4;
  }
  else {
    BOOL v0 = 1;
  }
  if (v0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init]();
    }
    BOOL v2 = &_os_log_default;
    id v1 = &_os_log_default;
  }
  else
  {
    BOOL v2 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "_hook_currentLimitChanged() called!", buf, 2u);
  }

  *(_DWORD *)long long buf = 0;
  if (!IOAccessoryPortGetServiceWithPort())
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      io_registry_entry_t v4 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[AirplaneMode init]();
      }
      io_registry_entry_t v4 = &_os_log_default;
      id v5 = &_os_log_default;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      IOAccessoryManagerEventCallback_cold_5();
    }
    goto LABEL_32;
  }
  IOAccessoryPortGetManagerPrimaryPort();
  if (!IOAccessoryManagerGetServiceWithPrimaryPort())
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      io_registry_entry_t v4 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[AirplaneMode init]();
      }
      io_registry_entry_t v4 = &_os_log_default;
      id v6 = &_os_log_default;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      IOAccessoryManagerEventCallback_cold_6();
    }
LABEL_32:

    unsigned int v3 = 0;
    goto LABEL_33;
  }
  if (IOAccessoryManagerGetUSBCurrentLimit()) {
    unsigned int v3 = 0;
  }
  else {
    unsigned int v3 = *(_DWORD *)buf;
  }
LABEL_33:
  if (gLogObjects && gNumLogObjects >= 4)
  {
    id v7 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init]();
    }
    id v7 = &_os_log_default;
    id v8 = &_os_log_default;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109376;
    *(_DWORD *)&uint8_t buf[4] = v3;
    LOWORD(v18) = 1024;
    *(_DWORD *)((char *)&v18 + 2) = _hook_currentLimitChanged_previousUSBCurrentLimitMA;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "_hook_currentLimitChanged: (usbCurrentLimitMA: %dma, previousUSBCurrentLimitMA: %dma)", buf, 0xEu);
  }

  uint64_t v13 = 0;
  unint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  id v9 = _uiQueue();
  *(void *)long long buf = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  int v19 = ___isUnlockDialogTimerRunning_block_invoke;
  BOOL v20 = &unk_51700;
  BOOL v21 = &v13;
  dispatch_sync(v9, buf);

  LODWORD(v9) = *((unsigned __int8 *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  if (v9 && _hook_currentLimitChanged_previousUSBCurrentLimitMA <= 0x1F3 && v3 >= 0x1F4)
  {
    if (gLogObjects && gNumLogObjects >= 4)
    {
      uint64_t v10 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[AirplaneMode init]();
      }
      uint64_t v10 = &_os_log_default;
      id v11 = &_os_log_default;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = (SBSBatteryUIDismissDuration * 1000.0);
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Resetting unlock dialog timer to %ums...", buf, 8u);
    }

    id v12 = _uiQueue();
    dispatch_sync(v12, &__block_literal_global_874);
  }
  _hook_currentLimitChanged_previousUSBCurrentLimitMA = v3;
}

uint64_t __IOAccessoryManagerEventCallback_block_invoke_863(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 1;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init]();
    }
    io_registry_entry_t v4 = &_os_log_default;
    id v3 = &_os_log_default;
  }
  else
  {
    io_registry_entry_t v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138412546;
    id v8 = @"com.apple.accessories.charging.configurationChanged";
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "CoreAnalytics event: %@\neventDict: %@", (uint8_t *)&v7, 0x16u);
  }

  return AnalyticsSendEvent();
}

id __IOAccessoryManagerEventCallback_block_invoke_864(uint64_t a1)
{
  return [*(id *)(a1 + 32) setRoleSwapMaskForUSBPort];
}

void __IOAccessoryManagerEventCallback_block_invoke_865(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  [v1 processAnalyticsEventListUsingTime:v2 scanReason:0 primaryPort:v3];
}

void _updateCachedAccessoryDetachTimes(void *a1, uint64_t a2)
{
  id v3 = a1;
  io_registry_entry_t v4 = [v3 digitalIDCacheDict];
  uint64_t v5 = (__CFString *)CFStringCreateFromFormat(a2, @"%d");
  id v6 = [v4 objectForKey:v5];

  if (v6)
  {
    int v7 = +[NSNumber numberWithUnsignedLongLong:systemInfo_getCurrentUnixTimeMS()];
    __int16 v27 = -21846;
    int v26 = -1431655766;
    [v6 getBytes:&v26 length:6];
    if (_digitalIDSupportsTransport((char *)&v26, 1))
    {
      id v8 = [v3 uartAccessoryDetachTimesDict];
      __int16 v9 = (__CFString *)CFStringCreateFromFormat(a2, @"%d");
      [v8 setObject:v7 forKey:v9];

      uint64_t v10 = [v3 pluginDefaults];
      id v11 = [v3 uartAccessoryDetachTimesDict];
      [v10 setObject:v11 forKey:@"uartDetachTimes"];

      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v12 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          -[AirplaneMode init]();
        }
        id v12 = &_os_log_default;
        id v13 = &_os_log_default;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412546;
        id v29 = v7;
        __int16 v30 = 1024;
        int v31 = a2;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "kIOAccessoryManagerMessageDetach/kIOAccessoryManagerMessageAccIDNoneConnected lastUARTAccessoryDetachTime: %@ for primaryPort: %d", buf, 0x12u);
      }
    }
    if (_digitalIDSupportsTransport((char *)&v26, 2))
    {
      unint64_t v14 = [v3 mikeyBusAccessoryDetachTimesDict];
      uint64_t v15 = (__CFString *)CFStringCreateFromFormat(a2, @"%d");
      [v14 setObject:v7 forKey:v15];

      char v16 = [v3 pluginDefaults];
      id v17 = [v3 mikeyBusAccessoryDetachTimesDict];
      [v16 setObject:v17 forKey:@"mikeyBusDetachTimes"];

      if (gLogObjects && gNumLogObjects >= 1)
      {
        uint64_t v18 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          -[AirplaneMode init]();
        }
        uint64_t v18 = &_os_log_default;
        id v19 = &_os_log_default;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412546;
        id v29 = v7;
        __int16 v30 = 1024;
        int v31 = a2;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "kIOAccessoryManagerMessageDetach/kIOAccessoryManagerMessageAccIDNoneConnected lastMikeyBusAccessoryDetachTime: %@ for primaryPort: %d", buf, 0x12u);
      }
    }
    if (_digitalIDSupportsTransport((char *)&v26, 3))
    {
      BOOL v20 = [v3 aidBulkPipeAccessoryDetachTimesDict];
      BOOL v21 = (__CFString *)CFStringCreateFromFormat(a2, @"%d");
      [v20 setObject:v7 forKey:v21];

      id v22 = [v3 pluginDefaults];
      unint64_t v23 = [v3 aidBulkPipeAccessoryDetachTimesDict];
      [v22 setObject:v23 forKey:@"aidBulkPipeDetachTimes"];

      if (gLogObjects && gNumLogObjects >= 1)
      {
        uint64_t v24 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          -[AirplaneMode init]();
        }
        uint64_t v24 = &_os_log_default;
        id v25 = &_os_log_default;
      }
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412546;
        id v29 = v7;
        __int16 v30 = 1024;
        int v31 = a2;
        _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "kIOAccessoryManagerMessageDetach/kIOAccessoryManagerMessageAccIDNoneConnected lastAIDBulkPipeAccessoryDetachTime: %@ for primaryPort: %d", buf, 0x12u);
      }
    }
  }
}

void _removeCachedDigitalID(void *a1, uint64_t a2)
{
  id v3 = a1;
  io_registry_entry_t v4 = [v3 digitalIDCacheDict];
  uint64_t v5 = (__CFString *)CFStringCreateFromFormat(a2, @"%02X");
  [v4 removeObjectForKey:v5];

  id v6 = [v3 pluginDefaults];
  int v7 = [v3 digitalIDCacheDict];
  [v6 setObject:v7 forKey:@"cachedDigitalID"];

  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v8 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init]();
    }
    id v8 = &_os_log_default;
    id v9 = &_os_log_default;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = [v3 digitalIDCacheDict];
    int v11 = 138412290;
    id v12 = v10;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "kIOAccessoryManagerMessageDetach/kIOAccessoryManagerMessageAccIDNoneConnected digitalIDCacheDict: %@", (uint8_t *)&v11, 0xCu);
  }
}

void __IOAccessoryManagerEventCallback_block_invoke_867(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  [v1 processAnalyticsEventListUsingTime:v2 scanReason:0 primaryPort:v3];
}

void ___generateUSBAccessoryConnectionStatisticsEvent_block_invoke(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 1;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init]();
    }
    io_registry_entry_t v4 = &_os_log_default;
    id v3 = &_os_log_default;
  }
  else
  {
    io_registry_entry_t v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138412546;
    id v8 = @"com.apple.accessories.connection.statistics";
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "CoreAnalytics event: %@\neventDict: %@", (uint8_t *)&v7, 0x16u);
  }

  AnalyticsSendEvent();
  AnalyticsSendEvent();
  if (systemInfo_isInternalBuild())
  {
    id v6 = +[ACCAnalytics loggerForUser:0];
    [v6 logACCAnalyticsForEventNamed:@"accessoryConnectionStatistics" withAttributes:*(void *)(a1 + 32)];
  }
}

void ___hook_currentLimitChanged_block_invoke(id a1)
{
  _gUnlockNotificationTimerRunning = 1;
  source = _unlockDialogTimer();
  dispatch_time_t v1 = dispatch_time(0, (uint64_t)(SBSBatteryUIDismissDuration * 1000000000.0));
  dispatch_source_set_timer(source, v1, 0xFFFFFFFFFFFFFFFFLL, 0x2FAF080uLL);
}

id _unlockDialogTimer()
{
  if (_unlockDialogTimer_onceToken != -1) {
    dispatch_once(&_unlockDialogTimer_onceToken, &__block_literal_global_876);
  }
  BOOL v0 = (void *)_gUnlockNotificationTimer;

  return v0;
}

uint64_t ___isUnlockDialogTimerRunning_block_invoke(uint64_t result)
{
  if (_gUnlockNotificationTimerRunning == 1) {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  }
  return result;
}

void ___unlockDialogTimer_block_invoke(id a1)
{
  id v3 = dispatch_get_global_queue(2, 0);
  dispatch_source_t v1 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v3);
  BOOL v2 = (void *)_gUnlockNotificationTimer;
  _gUnlockNotificationTimer = (uint64_t)v1;
}

void ___generateUnlockDialogSeenAnalyticEvent_block_invoke(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 1;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init]();
    }
    io_registry_entry_t v4 = &_os_log_default;
    id v3 = &_os_log_default;
  }
  else
  {
    io_registry_entry_t v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v22 = 138412546;
    unint64_t v23 = @"com.apple.accessories.unlockDialogSeen";
    __int16 v24 = 2112;
    uint64_t v25 = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "CoreAnalytics event: %@\neventDict: %@", (uint8_t *)&v22, 0x16u);
  }

  AnalyticsSendEvent();
  if (systemInfo_systemSupportsPearl() && systemInfo_isInternalBuild())
  {
    id v6 = *(void **)(a1 + 32);
    CFDictionaryRef v7 = IOServiceMatching("ApplePearlSEPDriver");
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v7);
    if (MatchingService)
    {
      io_registry_entry_t v9 = MatchingService;
      CFNumberRef CFProperty = IORegistryEntryCreateCFProperty(MatchingService, @"CombinedSequenceEnabled", kCFAllocatorDefault, 0);
      int v11 = (void *)IORegistryEntryCreateCFProperty(v9, @"CombinedSequenceAutoSet", kCFAllocatorDefault, 0);
      id v12 = v11;
      if (CFProperty && v11)
      {
        unsigned int v13 = [v11 BOOLValue];
        unsigned int v14 = [CFProperty BOOLValue];
        if (v13)
        {
          uint64_t v15 = @"autoDisabled";
          char v16 = @"autoEnabled";
        }
        else
        {
          uint64_t v15 = @"explicitlyDisabled";
          char v16 = @"explicitlyEnabled";
        }
        if (v14) {
          uint64_t v15 = v16;
        }
        id v19 = v15;
      }
      else
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          id v17 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            -[AirplaneMode init]();
          }
          id v17 = &_os_log_default;
          id v20 = &_os_log_default;
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          ___generateUnlockDialogSeenAnalyticEvent_block_invoke_cold_3();
        }

        id v19 = @"errorOccurred";
      }
      IOObjectRelease(v9);
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        CFNumberRef CFProperty = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          -[AirplaneMode init]();
        }
        CFNumberRef CFProperty = &_os_log_default;
        id v18 = &_os_log_default;
      }
      if (os_log_type_enabled(CFProperty, OS_LOG_TYPE_ERROR)) {
        ___generateUnlockDialogSeenAnalyticEvent_block_invoke_cold_1();
      }
      id v19 = @"errorOccurred";
    }

    [v6 setObject:v19 forKey:@"fastPathState"];
  }
  BOOL v21 = +[ACCAnalytics loggerForUser:1];
  [v21 logACCAnalyticsForEventNamed:@"accessoryUnlockDialogSeen" withAttributes:*(void *)(a1 + 32)];
}

void ___hook_usbConnectTypeChanged_block_invoke(id a1)
{
  _hook_usbConnectTypeChanged_usbTypeCDevice = MGGetBoolAnswer();
}

id serviceNotificationTRM(void *a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 4;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init]();
    }
    io_registry_entry_t v4 = &_os_log_default;
    id v3 = &_os_log_default;
  }
  else
  {
    io_registry_entry_t v4 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    serviceNotificationTRM_cold_1();
  }

  return [a1 trmStatusDidChange];
}

void serviceNotificationLDCM(void *a1, io_registry_entry_t a2, int a3)
{
  if (gLogObjects) {
    BOOL v6 = gNumLogObjects < 5;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init]();
    }
    id v8 = &_os_log_default;
    id v7 = &_os_log_default;
  }
  else
  {
    id v8 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    serviceNotificationLDCM_cold_2();
  }

  if (a3 == -469794613)
  {
    if (gLogObjects && gNumLogObjects >= 5)
    {
      io_registry_entry_t v9 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[AirplaneMode init]();
      }
      io_registry_entry_t v9 = &_os_log_default;
      id v10 = &_os_log_default;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v11 = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "LDCM mitigation state changed!", v11, 2u);
    }

    serviceLDCMMitigationStatusChanged(a1, a2);
  }
}

void serviceLDCMMitigationStatusChanged(void *a1, io_registry_entry_t a2)
{
  id v3 = a1;
  CFNumberRef CFProperty = (void *)IORegistryEntryCreateCFProperty(a2, @"MitigationsStatus", kCFAllocatorDefault, 0);
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 5;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init]();
    }
    id v7 = &_os_log_default;
    id v6 = &_os_log_default;
  }
  else
  {
    id v7 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    serviceLDCMMitigationStatusChanged_cold_5();
  }

  if ([CFProperty unsignedIntValue] == 2)
  {
    id v8 = +[NSProcessInfo processInfo];
    io_registry_entry_t v9 = [v8 processName];
    id v10 = +[NSString stringWithFormat:@"%@ (%i) : %p", v9, getpid(), v3];

    int v11 = [[IOUIAngelService alloc] initWithIdentifier:v10];
    [v3 setAngelServiceLDCM:v11];

    id v12 = [v3 angelServiceLDCM];
    [v12 setDelegate:v3];

    unsigned int v13 = [v3 angelServiceLDCM];
    [v13 activate];

    if (gLogObjects && gNumLogObjects >= 5)
    {
      unsigned int v14 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[AirplaneMode init]();
      }
      unsigned int v14 = &_os_log_default;
      id v16 = &_os_log_default;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      serviceLDCMMitigationStatusChanged_cold_1();
    }

    id v17 = [v3 angelServiceLDCM];
    [v17 setIntrusiveUI:1 completion:&__block_literal_global_902];
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 5)
    {
      uint64_t v15 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[AirplaneMode init]();
      }
      uint64_t v15 = &_os_log_default;
      id v18 = &_os_log_default;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      serviceLDCMMitigationStatusChanged_cold_3();
    }

    id v10 = [v3 angelServiceLDCM];
    [v10 setIntrusiveUI:0 completion:&__block_literal_global_905];
  }
}

void __serviceLDCMMitigationStatusChanged_block_invoke(id a1, NSError *a2)
{
  BOOL v2 = a2;
  id v3 = v2;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects <= 4;
  }
  else {
    BOOL v4 = 1;
  }
  int v5 = !v4;
  if (v2)
  {
    if (v5)
    {
      id v6 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[AirplaneMode init]();
      }
      id v6 = &_os_log_default;
      id v7 = &_os_log_default;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __serviceLDCMMitigationStatusChanged_block_invoke_cold_3();
    }
  }
  else
  {
    if (v5)
    {
      id v6 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[AirplaneMode init]();
      }
      id v6 = &_os_log_default;
      id v8 = &_os_log_default;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __serviceLDCMMitigationStatusChanged_block_invoke_cold_1();
    }
  }
}

void __serviceLDCMMitigationStatusChanged_block_invoke_903(id a1, NSError *a2)
{
  BOOL v2 = a2;
  id v3 = v2;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects <= 4;
  }
  else {
    BOOL v4 = 1;
  }
  int v5 = !v4;
  if (v2)
  {
    if (v5)
    {
      id v6 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[AirplaneMode init]();
      }
      id v6 = &_os_log_default;
      id v7 = &_os_log_default;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __serviceLDCMMitigationStatusChanged_block_invoke_cold_3();
    }
  }
  else
  {
    if (v5)
    {
      id v6 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[AirplaneMode init]();
      }
      id v6 = &_os_log_default;
      id v8 = &_os_log_default;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __serviceLDCMMitigationStatusChanged_block_invoke_903_cold_1();
    }
  }
}

void ___uiQueue_block_invoke(id a1)
{
  _uiQueue_uiQueue = (uint64_t)dispatch_queue_create("com.apple.accessorydMatchingPlugin.uiQueue", 0);

  _objc_release_x1();
}

uint64_t ___isUnlockDialogPresent_block_invoke(uint64_t result)
{
  if (_gUnlockNotification) {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  }
  return result;
}

void ___shouldPresentUnlockDialog_block_invoke(uint64_t a1)
{
  id v2 = [(id)_portsPendingUserAuthorization count];
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 4;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init]();
    }
    int v5 = &_os_log_default;
    id v4 = &_os_log_default;
  }
  else
  {
    int v5 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 134217984;
    id v7 = v2;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "numPortsPendingUserAuthorization: %lu", (uint8_t *)&v6, 0xCu);
  }

  if (v2) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

void ___presentUnlockDialog_block_invoke(id a1)
{
  dispatch_source_t v1 = _uiQueue();
  dispatch_sync(v1, &__block_literal_global_924);
}

void ___presentUnlockDialog_block_invoke_2(id a1)
{
  dispatch_source_t v1 = _unlockDialogTimer();
  dispatch_source_set_timer(v1, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x2FAF080uLL);

  id v2 = _unlockDialogTimer();
  dispatch_source_set_event_handler(v2, &__block_literal_global_926);

  BOOL v3 = _unlockDialogTimer();
  dispatch_resume(v3);
}

void ___presentUnlockDialog_block_invoke_3(id a1)
{
  if (gLogObjects) {
    BOOL v1 = gNumLogObjects < 4;
  }
  else {
    BOOL v1 = 1;
  }
  if (v1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init]();
    }
    BOOL v3 = &_os_log_default;
    id v2 = &_os_log_default;
  }
  else
  {
    BOOL v3 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Unlock dialog timer fired!", buf, 2u);
  }

  id v4 = _uiQueue();
  dispatch_sync(v4, &__block_literal_global_929);

  if (_shouldPresentUnlockDialog())
  {
    int v5 = _uiQueue();
    dispatch_async(v5, &__block_literal_global_932);
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 4)
    {
      int v5 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[AirplaneMode init]();
      }
      int v5 = &_os_log_default;
      id v6 = &_os_log_default;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Unlock dialog should no longer be presented, not presenting unlock dialog!", v7, 2u);
    }
  }
}

void ___presentUnlockDialog_block_invoke_927(id a1)
{
  _gUnlockNotificationTimerRunning = 0;
  if (gLogObjects) {
    BOOL v1 = gNumLogObjects < 4;
  }
  else {
    BOOL v1 = 1;
  }
  if (v1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init]();
    }
    BOOL v3 = &_os_log_default;
    id v2 = &_os_log_default;
  }
  else
  {
    BOOL v3 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = "NO";
    if (_gUnlockNotificationTimerRunning) {
      int v5 = "YES";
    }
    else {
      int v5 = "NO";
    }
    if (_gUnlockNotification) {
      id v4 = "YES";
    }
    int v6 = 136315394;
    id v7 = v5;
    __int16 v8 = 2080;
    io_registry_entry_t v9 = v4;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "_gUnlockNotificationTimerRunning: %s, _gUnlockNotification: %s", (uint8_t *)&v6, 0x16u);
  }
}

void ___presentUnlockDialog_block_invoke_930(id a1)
{
  if (!_gUnlockNotification)
  {
    if (gLogObjects) {
      BOOL v1 = gNumLogObjects < 4;
    }
    else {
      BOOL v1 = 1;
    }
    if (v1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[AirplaneMode init]();
      }
      BOOL v3 = &_os_log_default;
      id v2 = &_os_log_default;
    }
    else
    {
      BOOL v3 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Presenting unlock notification...", (uint8_t *)&v9, 2u);
    }

    if (_acc_userNotifications_restrictedModeUnlock_onceToken != -1) {
      dispatch_once(&_acc_userNotifications_restrictedModeUnlock_onceToken, &__block_literal_global_941);
    }
    objc_storeStrong((id *)&_gUnlockNotification, (id)_acc_userNotifications_restrictedModeUnlock_userNotification);
    id v4 = +[ACCUserNotificationManager sharedManager];
    [v4 presentNotification:_gUnlockNotification completionHandler:&__block_literal_global_936];

    if (gLogObjects && gNumLogObjects >= 4)
    {
      int v5 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[AirplaneMode init]();
      }
      int v5 = &_os_log_default;
      id v6 = &_os_log_default;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = "NO";
      if (_gUnlockNotificationTimerRunning) {
        __int16 v8 = "YES";
      }
      else {
        __int16 v8 = "NO";
      }
      if (_gUnlockNotification) {
        id v7 = "YES";
      }
      int v9 = 136315394;
      id v10 = v8;
      __int16 v11 = 2080;
      id v12 = v7;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "_gUnlockNotificationTimerRunning: %s, _gUnlockNotification: %s", (uint8_t *)&v9, 0x16u);
    }
  }
}

void ___presentUnlockDialog_block_invoke_934(id a1, int a2)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 4;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init]();
    }
    id v4 = &_os_log_default;
    id v3 = &_os_log_default;
  }
  else
  {
    id v4 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    ___presentUnlockDialog_block_invoke_934_cold_1();
  }

  int v5 = (void *)_gUnlockNotification;
  _gUnlockNotification = 0;
}

void ___presentUnlockDialog_block_invoke_937(id a1)
{
  if (gLogObjects) {
    BOOL v1 = gNumLogObjects < 4;
  }
  else {
    BOOL v1 = 1;
  }
  if (v1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init]();
    }
    id v3 = &_os_log_default;
    id v2 = &_os_log_default;
  }
  else
  {
    id v3 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = "NO";
    if (_gUnlockNotificationTimerRunning) {
      int v5 = "YES";
    }
    else {
      int v5 = "NO";
    }
    if (_gUnlockNotification) {
      id v4 = "YES";
    }
    int v20 = 136315394;
    BOOL v21 = v5;
    __int16 v22 = 2080;
    unint64_t v23 = v4;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "_presentUnlockDialog: (_gUnlockNotificationTimerRunning: %s, _gUnlockNotification: %s)", (uint8_t *)&v20, 0x16u);
  }

  if (gLogObjects) {
    BOOL v6 = gNumLogObjects <= 3;
  }
  else {
    BOOL v6 = 1;
  }
  int v7 = !v6;
  if ((_gUnlockNotificationTimerRunning & 1) != 0 || _gUnlockNotification)
  {
    if (v7)
    {
      int v9 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[AirplaneMode init]();
      }
      int v9 = &_os_log_default;
      id v10 = &_os_log_default;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      __int16 v11 = "Unlock dialog timer already running or dialog already up - not starting timer again.";
      id v12 = v9;
      uint32_t v13 = 2;
LABEL_51:
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v20, v13);
    }
  }
  else
  {
    if (v7)
    {
      __int16 v8 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[AirplaneMode init]();
      }
      __int16 v8 = &_os_log_default;
      id v14 = &_os_log_default;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 67109120;
      LODWORD(v21) = 1500;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Starting unlock dialog timer for %dms...", (uint8_t *)&v20, 8u);
    }

    _gUnlockNotificationTimerRunning = 1;
    uint64_t v15 = _unlockDialogTimer();
    dispatch_time_t v16 = dispatch_time(0, 1500000000);
    dispatch_source_set_timer(v15, v16, 0xFFFFFFFFFFFFFFFFLL, 0x2FAF080uLL);

    if (gLogObjects && gNumLogObjects >= 4)
    {
      int v9 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[AirplaneMode init]();
      }
      int v9 = &_os_log_default;
      id v17 = &_os_log_default;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = "NO";
      if (_gUnlockNotificationTimerRunning) {
        id v19 = "YES";
      }
      else {
        id v19 = "NO";
      }
      if (_gUnlockNotification) {
        id v18 = "YES";
      }
      int v20 = 136315394;
      BOOL v21 = v19;
      __int16 v22 = 2080;
      unint64_t v23 = v18;
      __int16 v11 = "_gUnlockNotificationTimerRunning: %s, _gUnlockNotification: %s";
      id v12 = v9;
      uint32_t v13 = 22;
      goto LABEL_51;
    }
  }
}

void ___acc_userNotifications_restrictedModeUnlock_block_invoke(id a1)
{
  BOOL v1 = objc_alloc_init(ACCUserNotification);
  id v2 = (void *)_acc_userNotifications_restrictedModeUnlock_userNotification;
  _acc_userNotifications_restrictedModeUnlock_userNotification = (uint64_t)v1;

  [(id)_acc_userNotifications_restrictedModeUnlock_userNotification setType:2];
  id v3 = acc_strings_bundle();
  id v4 = _localizedStringFromTableInBundle(@"Accessory Connected", v3);
  [(id)_acc_userNotifications_restrictedModeUnlock_userNotification setTitle:v4];

  int v5 = acc_strings_bundle();
  BOOL v6 = _localizedStringFromTableInBundle(@"Unlock %@ to use accessories", v5);
  int v7 = (void *)systemInfo_copyDeviceClass();
  __int16 v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v7);
  [(id)_acc_userNotifications_restrictedModeUnlock_userNotification setMessage:v8];

  [(id)_acc_userNotifications_restrictedModeUnlock_userNotification setIsModal:0];
  [(id)_acc_userNotifications_restrictedModeUnlock_userNotification setDismissOnUnlock:1];
  [(id)_acc_userNotifications_restrictedModeUnlock_userNotification setIgnoreQuietMode:1];
  int v9 = (void *)_acc_userNotifications_restrictedModeUnlock_userNotification;

  [v9 setSystemSoundID:&off_5A7C8];
}

id _localizedStringFromTableInBundle(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  int v5 = v4;
  if (!v4)
  {
    BOOL v6 = 0;
    uint64_t v15 = 0;
    goto LABEL_21;
  }
  BOOL v6 = [v4 localizations];
  if (!v6) {
    goto LABEL_20;
  }
  int v7 = (void *)CFPreferencesCopyValue(@"AppleLanguages", kCFPreferencesAnyApplication, @"mobile", kCFPreferencesAnyHost);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_19;
  }
  __int16 v8 = +[NSBundle preferredLocalizationsFromArray:v6 forPreferences:v7];
  if (![v8 count])
  {

LABEL_19:
LABEL_20:
    uint64_t v15 = objc_msgSend(v5, "localizedStringForKey:value:table:", v3, v3, @"Localizable", (void)v17);
    goto LABEL_21;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    while (2)
    {
      for (io_registry_entry_t i = 0; i != v11; io_registry_entry_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = objc_msgSend(v5, "localizedStringForKey:value:table:localization:", v3, 0, @"Localizable", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
        if (v14)
        {
          uint64_t v15 = (void *)v14;
          goto LABEL_16;
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  uint64_t v15 = 0;
LABEL_16:

  if (!v15) {
    goto LABEL_20;
  }
LABEL_21:

  return v15;
}

void ___dismissUnlockDialog_block_invoke(id a1)
{
  if (_gUnlockNotification)
  {
    if (gLogObjects) {
      BOOL v1 = gNumLogObjects < 4;
    }
    else {
      BOOL v1 = 1;
    }
    if (v1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[AirplaneMode init]();
      }
      id v3 = &_os_log_default;
      id v2 = &_os_log_default;
    }
    else
    {
      id v3 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Dismissing unlock notification...", v6, 2u);
    }

    id v4 = +[ACCUserNotificationManager sharedManager];
    [v4 dismissNotification:_gUnlockNotification];

    int v5 = (void *)_gUnlockNotification;
    _gUnlockNotification = 0;
  }
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

unsigned char *OUTLINED_FUNCTION_8(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = 0;
  *a2 = 0;
  return result;
}

void OUTLINED_FUNCTION_10(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void OUTLINED_FUNCTION_12(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_15(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t acm_explicit_bzero(void *a1, rsize_t __n)
{
  return memset_s(a1, __n, 0, __n);
}

uint64_t acm_get_mem()
{
  return _allocatedMem_0;
}

void *acm_mem_alloc_data(size_t size)
{
  uint64_t result = malloc_type_calloc(1uLL, size, 0xCB62F0E9uLL);
  if (result) {
    _allocatedMem_2 += size;
  }
  return result;
}

void acm_mem_free_data(void *a1, rsize_t __n)
{
  if (a1)
  {
    memset_s(a1, __n, 0, __n);
    free(a1);
    uint64_t v4 = _allocatedMem_2 - __n;
    if (_allocatedMem_2 < __n) {
      uint64_t v4 = 0;
    }
    _allocatedMem_2 = v4;
  }
}

void *acm_mem_alloc(size_t size)
{
  uint64_t result = malloc_type_calloc(1uLL, size, 0xDB9956F0uLL);
  if (result) {
    _allocatedMem_3 += size;
  }
  return result;
}

void acm_mem_free(void *a1, rsize_t __n)
{
  if (a1)
  {
    memset_s(a1, __n, 0, __n);
    free(a1);
    uint64_t v4 = _allocatedMem_3 - __n;
    if (_allocatedMem_3 < __n) {
      uint64_t v4 = 0;
    }
    _allocatedMem_3 = v4;
  }
}

const char *acm_mem_alloc_info(const char *result, const void *a2, uint64_t a3, const char *a4, int a5, const char *a6)
{
  if (a2) {
    _allocatedMem_0 += a3;
  }
  if (gACMLoggingLevel <= 0x1Eu)
  {
    BOOL v6 = "NULL";
    if (result) {
      int v7 = result;
    }
    else {
      int v7 = "NULL";
    }
    if (a4) {
      __int16 v8 = a4;
    }
    else {
      __int16 v8 = "NULL";
    }
    if (a6) {
      BOOL v6 = a6;
    }
    return (const char *)printf("%s: %s: mem: type=%s ptr=%p size=%u (total=%u raw=%u data=%u types=%u) %s:%d (%s).\n", "ACM", "acm_mem_alloc_info", v7, a2, a3, _allocatedMem_0, 0, _allocatedMem_2, _allocatedMem_3, v8, a5, v6);
  }
  return result;
}

const char *acm_mem_free_info(const char *result, const void *a2, unint64_t a3, const char *a4, int a5, const char *a6)
{
  if (a2)
  {
    uint64_t v6 = _allocatedMem_0 - a3;
    if (_allocatedMem_0 < a3) {
      uint64_t v6 = 0;
    }
    _allocatedMem_0 = v6;
  }
  if (gACMLoggingLevel <= 0x1Eu)
  {
    int v7 = "NULL";
    if (result) {
      __int16 v8 = result;
    }
    else {
      __int16 v8 = "NULL";
    }
    if (a4) {
      uint64_t v9 = a4;
    }
    else {
      uint64_t v9 = "NULL";
    }
    if (a6) {
      int v7 = a6;
    }
    return (const char *)printf("%s: %s: mem: type=%s ptr=%p size=%u (total=%u raw=%u data=%u types=%u) %s:%d (%s).\n", "ACM", "acm_mem_free_info", v8, a2, a3, _allocatedMem_0, 0, _allocatedMem_2, _allocatedMem_3, v9, a5, v7);
  }
  return result;
}

uint64_t GetSerializedVerifyPolicySize(uint64_t a1, char *__s1, uint64_t a3, uint64_t a4, _DWORD *a5, unsigned int a6, void *a7)
{
  unsigned int v14 = 0;
  uint64_t result = 4294967293;
  if (a1 && __s1 && a7)
  {
    size_t v12 = strnlen(__s1, 0x81uLL);
    if (v12 > 0x80)
    {
      return 4294967293;
    }
    else
    {
      size_t v13 = v12;
      uint64_t result = getLengthOfParameters(a5, a6, &v14);
      if (!result) {
        *a7 = v13 + v14 + 26;
      }
    }
  }
  return result;
}

uint64_t getLengthOfParameters(_DWORD *a1, unsigned int a2, _DWORD *a3)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "getLengthOfParameters");
  }
  if (a3)
  {
    *a3 = 0;
    int v6 = 0;
    if (a2)
    {
      uint64_t v7 = a2;
      while (1)
      {
        uint64_t v8 = checkParameter(a1);
        if (v8) {
          break;
        }
        int v9 = v6 + 8;
        int v10 = a1[4];
        v6 += v10 + 8;
        if (__CFADD__(v10, v9)) {
          goto LABEL_10;
        }
        a1 += 6;
        if (!--v7) {
          goto LABEL_9;
        }
      }
      uint64_t v11 = v8;
      unsigned int v12 = 70;
    }
    else
    {
LABEL_9:
      uint64_t v11 = 0;
      *a3 = v6;
      unsigned int v12 = 10;
    }
  }
  else
  {
LABEL_10:
    unsigned int v12 = 70;
    uint64_t v11 = 4294967293;
  }
  if (v12 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "getLengthOfParameters", (int)v11);
  }
  return v11;
}

uint64_t SerializeVerifyPolicy(_OWORD *a1, char *__s1, char a3, uint64_t a4, _DWORD *a5, unsigned int a6, _OWORD *a7, size_t *a8)
{
  unint64_t v21 = 0;
  uint64_t result = 4294967293;
  if (a1)
  {
    if (__s1)
    {
      if (a8)
      {
        if (a7)
        {
          if (a6 <= 0xA && (a5 != 0) == (a6 != 0))
          {
            int v15 = a4;
            uint64_t result = GetSerializedVerifyPolicySize((uint64_t)a1, __s1, 0, a4, a5, a6, &v21);
            if (!result)
            {
              if (*a8 < v21) {
                return 4294967293;
              }
              *a7 = *a1;
              size_t v17 = strnlen(__s1, 0x81uLL);
              if (v17 > 0x80)
              {
                return 4294967293;
              }
              else
              {
                size_t v18 = v17;
                memcpy(a7 + 1, __s1, v17 + 1);
                long long v19 = (char *)a7 + v18;
                v19[17] = a3;
                *(_DWORD *)(v19 + 18) = v15;
                size_t v20 = v18 + 22;
                uint64_t result = serializeParameters((uint64_t)a5, a6, (uint64_t)a7, (uint64_t *)&v20);
                if (!result) {
                  *a8 = v20;
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t serializeParameters(uint64_t a1, int a2, uint64_t a3, uint64_t *a4)
{
  LODWORD(v6) = a2;
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "serializeParameters");
  }
  unsigned int v8 = 70;
  uint64_t v9 = 4294967293;
  if (a3 && a4)
  {
    uint64_t v10 = *a4;
    *(_DWORD *)(a3 + v10) = v6;
    uint64_t v11 = v10 + 4;
    if (v6)
    {
      uint64_t v6 = v6;
      while (1)
      {
        *(_OWORD *)__src = *(_OWORD *)a1;
        size_t __n = *(void *)(a1 + 16);
        uint64_t v12 = checkParameter(__src);
        if (v12) {
          break;
        }
        size_t v13 = (_DWORD *)(a3 + v11);
        size_t v14 = __n;
        *size_t v13 = __src[0];
        v13[1] = v14;
        v11 += 8;
        if (v14)
        {
          memcpy((void *)(a3 + v11), __src[1], v14);
          v11 += v14;
        }
        a1 += 24;
        if (!--v6) {
          goto LABEL_11;
        }
      }
      uint64_t v9 = v12;
      unsigned int v8 = 70;
    }
    else
    {
LABEL_11:
      uint64_t v9 = 0;
      *a4 = v11;
      unsigned int v8 = 10;
    }
  }
  if (v8 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "serializeParameters", (int)v9);
  }
  return v9;
}

uint64_t DeserializeVerifyPolicy(uint64_t a1, unint64_t a2, _OWORD *a3, void *a4, BOOL *a5, _DWORD *a6, void *a7, _DWORD *a8)
{
  uint32_t v28 = 0;
  unsigned int v27 = 0;
  uint64_t v8 = 4294967293;
  unint64_t v9 = a2 - 16;
  if (a2 >= 0x10 && a1 && a3 && a4 && a5 && a6 && a7 && a8)
  {
    *a3 = *(_OWORD *)a1;
    unint64_t v17 = strnlen((const char *)(a1 + 16), a2 - 16);
    if (v17 > 0x80 || v9 <= v17) {
      return 4294967293;
    }
    int v26 = a4;
    unint64_t v18 = v17 + 1;
    long long v19 = acm_mem_alloc_data(v17 + 1);
    acm_mem_alloc_info("<data>", v19, v17 + 1, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 349, "DeserializeVerifyPolicy");
    if (!v19) {
      return 4294967292;
    }
    memcpy(v19, (const void *)(a1 + 16), v17 + 1);
    unint64_t v29 = v17 + 17;
    if (v17 + 17 == a2 || (size_t v20 = a5, v21 = *(unsigned char *)(a1 + v17 + 17) != 0, v29 = v17 + 18, a2 - (v17 + 18) < 4))
    {
      uint64_t v8 = 4294967293;
    }
    else
    {
      unint64_t v25 = v17 + 1;
      __int16 v22 = a8;
      int v23 = *(_DWORD *)(a1 + v17 + 18);
      unint64_t v29 = v17 + 22;
      uint64_t v8 = deserializeParameters(a1, a2, &v29, &v28, &v27);
      if (!v8)
      {
        *int v26 = v19;
        *size_t v20 = v21;
        *a6 = v23;
        *a7 = v28;
        *__int16 v22 = v27;
        return v8;
      }
      unint64_t v18 = v25;
    }
    acm_mem_free_info("<data>", v19, v18, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 378, "DeserializeVerifyPolicy");
    acm_mem_free_data(v19, v18);
    if (v28) {
      Util_SafeDeallocParameters(v28, v27);
    }
  }
  return v8;
}

uint64_t deserializeParameters(uint64_t a1, unint64_t a2, unint64_t *a3, void *a4, _DWORD *a5)
{
  uint64_t v10 = ueaPluginSystemSettingsMonitor;
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "deserializeParameters");
  }
  unsigned int v11 = 70;
  uint64_t v12 = 4294967293;
  if (!a1 || !a3 || !a4 || !a5) {
    goto LABEL_25;
  }
  unint64_t v13 = *a3;
  if (a2 <= *a3)
  {
    LODWORD(v14) = 0;
LABEL_23:
    dispatch_time_t v16 = 0;
LABEL_24:
    uint64_t v12 = 0;
    *a4 = v16;
    *a5 = v14;
    unsigned int v11 = 10;
    *a3 = v13;
    goto LABEL_25;
  }
  if (a2 - *a3 < 4 || (uint64_t v14 = *(unsigned int *)(a1 + v13), v14 > 0xA))
  {
    unsigned int v11 = 70;
    uint64_t v12 = 4294967293;
    goto LABEL_25;
  }
  v13 += 4;
  if (!v14) {
    goto LABEL_23;
  }
  int v27 = v14;
  uint64_t v15 = 24 * v14;
  dispatch_time_t v16 = (char *)acm_mem_alloc(24 * v14);
  acm_mem_alloc_info("array of ACMParameter", v16, v15, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 194, "deserializeParameters");
  if (!v16)
  {
    unsigned int v11 = 70;
    uint64_t v12 = 4294967292;
    goto LABEL_25;
  }
  __int16 v24 = a4;
  unint64_t v25 = a5;
  int v26 = a3;
  uint64_t v17 = 0;
  while (1)
  {
    unint64_t v18 = &v16[v17];
    *(void *)&v16[v17 + 8] = 0;
    if (a2 - v13 < 8
      || (*(_DWORD *)unint64_t v18 = *(_DWORD *)(a1 + v13), a2 - (v13 + 4) < 4)
      || (long long v19 = &v16[v17],
          size_t v20 = *(unsigned int *)(a1 + v13 + 4),
          *(_DWORD *)&v16[v17 + 16] = v20,
          v13 += 8,
          a2 - v13 < v20))
    {
      unsigned int v11 = 70;
      uint64_t v12 = 4294967293;
      goto LABEL_31;
    }
    uint64_t v21 = checkParameter(&v16[v17]);
    if (v21)
    {
      uint64_t v12 = v21;
      unsigned int v11 = 70;
      goto LABEL_31;
    }
    if (v20) {
      break;
    }
LABEL_20:
    v17 += 24;
    if (v15 == v17)
    {
      uint64_t v10 = ueaPluginSystemSettingsMonitor;
      a5 = v25;
      a3 = v26;
      a4 = v24;
      LODWORD(v14) = v27;
      goto LABEL_24;
    }
  }
  __int16 v22 = acm_mem_alloc_data(v20);
  acm_mem_alloc_info("<data>", v22, v20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 212, "deserializeParameters");
  *((void *)v18 + 1) = v22;
  if (v22)
  {
    memcpy(v22, (const void *)(a1 + v13), *((unsigned int *)v19 + 4));
    v13 += *((unsigned int *)v19 + 4);
    goto LABEL_20;
  }
  unsigned int v11 = 70;
  uint64_t v12 = 4294967292;
LABEL_31:
  uint64_t v10 = ueaPluginSystemSettingsMonitor;
LABEL_25:
  if (v11 >= BYTE4(v10[39].isa)) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "deserializeParameters", (int)v12);
  }
  return v12;
}

uint64_t GetSerializedVerifyAclConstraintSize(int a1, uint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, uint64_t a7, uint64_t a8, _DWORD *a9, unsigned int a10, void *a11)
{
  unsigned int v18 = 0;
  uint64_t result = 4294967293;
  if (a3)
  {
    if (a11)
    {
      if (a10 <= 0xA && (a9 != 0) == (a10 != 0))
      {
        uint64_t result = getLengthOfParameters(a9, a10, &v18);
        if (!result)
        {
          uint64_t v15 = 29;
          if (a1 == 32) {
            uint64_t v15 = 33;
          }
          uint64_t v16 = v15 + a4;
          if (a1 == 32) {
            uint64_t v17 = a6;
          }
          else {
            uint64_t v17 = 0;
          }
          *a11 = v16 + v17 + v18;
        }
      }
    }
  }
  return result;
}

uint64_t SerializeVerifyAclConstraint(int a1, _OWORD *a2, const void *a3, unsigned int a4, const void *a5, unsigned int a6, char a7, int a8, _DWORD *a9, unsigned int a10, uint64_t a11, void *a12)
{
  if (!a3) {
    return 4294967293;
  }
  uint64_t result = 4294967293;
  if (a12) {
    BOOL v14 = a11 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14 && a10 <= 0xA && (a9 != 0) == (a10 != 0))
  {
    unsigned int v31 = 0;
    uint64_t result = getLengthOfParameters(a9, a10, &v31);
    if (!result)
    {
      uint64_t v21 = 29;
      if (a1 == 32) {
        uint64_t v21 = 33;
      }
      uint64_t v22 = v21 + a4;
      if (a1 == 32) {
        uint64_t v23 = a6;
      }
      else {
        uint64_t v23 = 0;
      }
      if (*a12 < v22 + v23 + (unint64_t)v31)
      {
        return 4294967293;
      }
      else
      {
        int v28 = a8;
        if (a2)
        {
          *(_OWORD *)a11 = *a2;
        }
        else
        {
          *(void *)a11 = 0;
          *(void *)(a11 + 8) = 0;
        }
        *(_DWORD *)(a11 + 16) = a4;
        memcpy((void *)(a11 + 20), a3, a4);
        uint64_t v24 = a4 + 20;
        if (a1 == 32)
        {
          *(_DWORD *)(a11 + v24) = a6;
          uint64_t v25 = a4 + 24;
          memcpy((void *)(a11 + v25), a5, a6);
          uint64_t v24 = v25 + a6;
        }
        uint64_t v26 = a11 + v24;
        *(unsigned char *)uint64_t v26 = a7;
        *(_DWORD *)(v26 + 1) = v28;
        uint64_t v30 = v24 + 5;
        uint64_t result = serializeParameters((uint64_t)a9, a10, a11, &v30);
        if (!result) {
          *a12 = v30;
        }
      }
    }
  }
  return result;
}

uint64_t DeserializeVerifyAclConstraint(int a1, uint64_t a2, unsigned int a3, _OWORD *a4, void *a5, _DWORD *a6, size_t *a7, _DWORD *a8, BOOL *a9, _DWORD *a10, void *a11, _DWORD *a12)
{
  id v33 = 0;
  unint64_t v34 = 0;
  unsigned int v32 = 0;
  uint64_t v12 = 4294967293;
  if (a2 && a4 && a5 && a6 && a9 && a10 && a11 && a12 && a3 >= 0x10)
  {
    unint64_t v16 = a3;
    *a4 = *(_OWORD *)a2;
    unint64_t v34 = 16;
    if ((a3 & 0xFFFFFFFC) == 0x10)
    {
      uint64_t v12 = 4294967293;
    }
    else
    {
      unint64_t v20 = *(unsigned int *)(a2 + 16);
      unint64_t v34 = 20;
      uint64_t v21 = acm_mem_alloc_data(v20);
      acm_mem_alloc_info("<data>", v21, v20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 532, "DeserializeVerifyAclConstraint");
      if (v21)
      {
        if (v16 - 20 < v20) {
          goto LABEL_24;
        }
        memcpy(v21, (const void *)(a2 + 20), v20);
        unint64_t v22 = v20 + 20;
        unint64_t v34 = v20 + 20;
        unsigned int v31 = a5;
        if (a1 != 32)
        {
          uint64_t v25 = 0;
          LODWORD(v23) = 0;
          goto LABEL_19;
        }
        if (v16 - v22 < 4)
        {
LABEL_24:
          uint64_t v25 = 0;
          LODWORD(v23) = 0;
        }
        else
        {
          size_t v23 = *(unsigned int *)(a2 + v22);
          unint64_t v24 = v20 + 24;
          unint64_t v34 = v20 + 24;
          uint64_t v25 = acm_mem_alloc_data(v23);
          acm_mem_alloc_info("<data>", v25, v23, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 544, "DeserializeVerifyAclConstraint");
          if (!v25)
          {
            uint64_t v12 = 4294967292;
LABEL_26:
            acm_mem_free_info("<data>", v21, v20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 580, "DeserializeVerifyAclConstraint");
            acm_mem_free_data(v21, v20);
            if (v25)
            {
              acm_mem_free_info("<data>", v25, v23, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 583, "DeserializeVerifyAclConstraint");
              acm_mem_free_data(v25, v23);
            }
            goto LABEL_30;
          }
          if (v16 - v24 >= v23)
          {
            memcpy(v25, (const void *)(a2 + v24), v23);
            unint64_t v22 = v24 + v23;
            unint64_t v34 = v24 + v23;
LABEL_19:
            if (v22 != v16)
            {
              BOOL v26 = *(unsigned char *)(a2 + v22) != 0;
              unint64_t v34 = v22 + 1;
              if (v16 - (v22 + 1) >= 4)
              {
                unint64_t v30 = v20;
                int v27 = v23;
                size_t v23 = (size_t)v25;
                int v28 = *(_DWORD *)(a2 + v22 + 1);
                unint64_t v34 = v22 + 5;
                uint64_t v12 = deserializeParameters(a2, v16, &v34, &v33, &v32);
                if (!v12)
                {
                  void *v31 = v21;
                  *a7 = v23;
                  *a8 = v27;
                  *a6 = v30;
                  *a9 = v26;
                  *a10 = v28;
                  *a11 = v33;
                  *a12 = v32;
                  return v12;
                }
                uint64_t v25 = (void *)v23;
                LODWORD(v23) = v27;
                unint64_t v20 = v30;
                goto LABEL_26;
              }
            }
          }
        }
        uint64_t v12 = 4294967293;
        goto LABEL_26;
      }
      uint64_t v12 = 4294967292;
    }
  }
LABEL_30:
  if (v33) {
    Util_SafeDeallocParameters(v33, v32);
  }
  return v12;
}

uint64_t GetSerializedProcessAclSize(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, unsigned int a5, uint64_t a6, _DWORD *a7, unsigned int a8, void *a9)
{
  unsigned int v12 = 0;
  uint64_t result = 4294967293;
  if (a2 && a3 && a9 && a8 <= 0xA && (a7 != 0) == (a8 != 0))
  {
    uint64_t result = getLengthOfParameters(a7, a8, &v12);
    if (!result) {
      *a9 = a3 + (unint64_t)a5 + v12 + 36;
    }
  }
  return result;
}

uint64_t SerializeProcessAcl(_OWORD *a1, const void *a2, unsigned int a3, const void *a4, unsigned int a5, uint64_t a6, _DWORD *a7, unsigned int a8, uint64_t a9, unint64_t *a10)
{
  unint64_t v23 = 0;
  uint64_t result = 4294967293;
  if (a2 && a3)
  {
    BOOL v15 = !a10 || a9 == 0;
    if (!v15 && a8 <= 0xA && (a7 != 0) == (a8 != 0))
    {
      int v17 = a6;
      uint64_t result = GetSerializedProcessAclSize(4294967293, (uint64_t)a2, a3, (uint64_t)a4, a5, a6, a7, a8, &v23);
      if (!result)
      {
        if (*a10 < v23)
        {
          return 4294967293;
        }
        else
        {
          if (a1)
          {
            *(_OWORD *)a9 = *a1;
          }
          else
          {
            *(void *)a9 = 0;
            *(void *)(a9 + 8) = 0;
          }
          *(_DWORD *)(a9 + 16) = a3;
          memcpy((void *)(a9 + 20), a2, a3);
          *(_DWORD *)(a9 + a3 + 20) = a5;
          uint64_t v21 = a3 + 24;
          if (a5)
          {
            memcpy((void *)(a9 + v21), a4, a5);
            v21 += a5;
          }
          *(_DWORD *)(a9 + v21) = v17;
          unint64_t v22 = v21 + 4;
          uint64_t result = serializeParameters((uint64_t)a7, a8, a9, (uint64_t *)&v22);
          if (!result) {
            *a10 = v22;
          }
        }
      }
    }
  }
  return result;
}

uint64_t DeserializeProcessAcl(uint64_t a1, unsigned int a2, _OWORD *a3, void *a4, _DWORD *a5, void *a6, unsigned int *a7, _DWORD *a8, void *a9, _DWORD *a10)
{
  v39 = 0;
  unint64_t v40 = 0;
  unsigned int v38 = 0;
  uint64_t v10 = 4294967293;
  if (a1)
  {
    if (a3)
    {
      unsigned int v11 = a4;
      if (a4)
      {
        unsigned int v12 = a5;
        if (a5)
        {
          unint64_t v13 = a6;
          if (a6)
          {
            BOOL v14 = a7;
            if (a7)
            {
              BOOL v15 = a8;
              if (a8)
              {
                if (a9 && a10 && a2 >= 0x10)
                {
                  unint64_t v17 = a2;
                  *a3 = *(_OWORD *)a1;
                  unint64_t v40 = 16;
                  if ((a2 & 0xFFFFFFFC) == 0x10)
                  {
                    uint64_t v10 = 4294967293;
                  }
                  else
                  {
                    unint64_t v18 = *(unsigned int *)(a1 + 16);
                    unint64_t v40 = 20;
                    long long v19 = acm_mem_alloc_data(v18);
                    acm_mem_alloc_info("<data>", v19, v18, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 722, "DeserializeProcessAcl");
                    if (v19)
                    {
                      if (v17 - 20 < v18
                        || (memcpy(v19, (const void *)(a1 + 20), v18), unint64_t v40 = v18 + 20, v17 - (v18 + 20) < 4))
                      {
                        unsigned int v32 = 0;
                        unsigned int v37 = 0;
                        uint64_t v10 = 4294967293;
                      }
                      else
                      {
                        size_t v20 = *(unsigned int *)(a1 + v18 + 20);
                        unint64_t v21 = v18 + 24;
                        unint64_t v40 = v18 + 24;
                        unsigned int v37 = v20;
                        if (!v20)
                        {
                          unint64_t v36 = 0;
                          goto LABEL_20;
                        }
                        id v33 = v12;
                        unint64_t v34 = v11;
                        unint64_t v22 = v13;
                        unint64_t v23 = v14;
                        unint64_t v24 = v15;
                        size_t v25 = v20;
                        BOOL v26 = acm_mem_alloc_data(v20);
                        acm_mem_alloc_info("<data>", v26, v25, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 734, "DeserializeProcessAcl");
                        if (v26)
                        {
                          int v27 = v26;
                          unsigned int v11 = v34;
                          if (v17 - v21 >= v25)
                          {
                            unint64_t v36 = v27;
                            memcpy(v27, (const void *)(a1 + v21), v25);
                            v21 += v25;
                            unint64_t v40 = v21;
                            BOOL v15 = v24;
                            BOOL v14 = v23;
                            unint64_t v13 = v22;
                            unsigned int v12 = v33;
LABEL_20:
                            if (v17 - v21 < 4)
                            {
                              uint64_t v10 = 4294967293;
                            }
                            else
                            {
                              unint64_t v35 = v18;
                              int v28 = v19;
                              unint64_t v29 = v15;
                              int v30 = *(_DWORD *)(a1 + v21);
                              unint64_t v40 = v21 + 4;
                              uint64_t v10 = deserializeParameters(a1, v17, &v40, &v39, &v38);
                              if (!v10)
                              {
                                *unsigned int v11 = v28;
                                _DWORD *v12 = v35;
                                *unint64_t v13 = v36;
                                *BOOL v14 = v37;
                                *unint64_t v29 = v30;
                                *a9 = v39;
                                *a10 = v38;
                                return v10;
                              }
                              long long v19 = v28;
                              unint64_t v18 = v35;
                            }
                            unsigned int v32 = v36;
                            goto LABEL_32;
                          }
                          uint64_t v10 = 4294967293;
                          unsigned int v32 = v27;
                        }
                        else
                        {
                          unsigned int v32 = 0;
                          uint64_t v10 = 4294967292;
                        }
                      }
LABEL_32:
                      acm_mem_free_info("<data>", v19, v18, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 763, "DeserializeProcessAcl");
                      acm_mem_free_data(v19, v18);
                      if (v32)
                      {
                        acm_mem_free_info("<data>", v32, v37, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 766, "DeserializeProcessAcl");
                        acm_mem_free_data(v32, v37);
                      }
                      goto LABEL_34;
                    }
                    uint64_t v10 = 4294967292;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_34:
  if (v39) {
    Util_SafeDeallocParameters(v39, v38);
  }
  return v10;
}

uint64_t GetSerializedRequirementSize(_DWORD *a1, uint64_t *a2)
{
  uint64_t v12 = 0;
  uint64_t result = 4294967293;
  if (!a1) {
    return result;
  }
  if (!a2) {
    return result;
  }
  int v5 = *a1;
  if (*a1 > 0x1Cu) {
    return result;
  }
  if (((1 << v5) & 0x1FFCFF4E) != 0)
  {
    uint64_t result = 0;
    *a2 = a1[3] + 16;
    return result;
  }
  if (((1 << v5) & 0x30) == 0)
  {
    if (v5 != 7) {
      return result;
    }
    *a2 = 24;
    uint64_t v9 = a1[5];
    if (v9)
    {
      uint64_t v10 = a1 + 6;
      uint64_t v11 = 24;
      do
      {
        uint64_t result = GetSerializedRequirementSize(*v10, &v12);
        if (result) {
          break;
        }
        v11 += v12;
        *a2 = v11;
        ++v10;
        --v9;
      }
      while (v9);
      return result;
    }
    return 0;
  }
  *a2 = 20;
  uint64_t v6 = a1[4];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = a1 + 5;
  uint64_t v8 = 20;
  while (1)
  {
    uint64_t result = GetSerializedRequirementSize(*v7, &v12);
    if (result) {
      break;
    }
    v8 += v12;
    *a2 = v8;
    ++v7;
    if (!--v6) {
      return 0;
    }
  }
  return result;
}

uint64_t SerializeRequirement(_DWORD *a1, _OWORD *a2, uint64_t *a3)
{
  unint64_t v12 = 0;
  uint64_t result = 4294967293;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        uint64_t result = GetSerializedRequirementSize(a1, (uint64_t *)&v12);
        if (!result)
        {
          if (v12 > *a3) {
            return 4294967293;
          }
          *a2 = *(_OWORD *)a1;
          int v7 = *a1;
          uint64_t result = 4294967293;
          if (*a1 <= 0x1Cu)
          {
            if (((1 << v7) & 0x1FFCFF4E) != 0)
            {
              memcpy(a2 + 1, a1 + 4, a1[3]);
              uint64_t v8 = a1[3] + 16;
LABEL_9:
              uint64_t result = 0;
              *a3 = v8;
              return result;
            }
            if (((1 << v7) & 0x30) != 0)
            {
              *((_DWORD *)a2 + 4) = a1[4];
              if (!a1[4])
              {
                uint64_t v8 = 20;
                goto LABEL_9;
              }
              uint64_t v9 = 0;
              uint64_t v8 = 20;
              while (1)
              {
                uint64_t v11 = *a3 - v8;
                uint64_t result = SerializeRequirement(*(void *)&a1[2 * v9 + 5], (char *)a2 + v8, &v11);
                if (result) {
                  break;
                }
                v8 += v11;
                if (++v9 >= (unint64_t)a1[4]) {
                  goto LABEL_9;
                }
              }
            }
            else if (v7 == 7)
            {
              *((void *)a2 + 2) = *((void *)a1 + 2);
              if (!a1[5])
              {
                uint64_t v8 = 24;
                goto LABEL_9;
              }
              uint64_t v10 = 0;
              uint64_t v8 = 24;
              while (1)
              {
                uint64_t v11 = *a3 - v8;
                uint64_t result = SerializeRequirement(*(void *)&a1[2 * v10 + 6], (char *)a2 + v8, &v11);
                if (result) {
                  break;
                }
                v8 += v11;
                if (++v10 >= (unint64_t)a1[5]) {
                  goto LABEL_9;
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t DeserializeRequirement(unsigned int *a1, unint64_t a2, void **a3, size_t *a4)
{
  __dst = 0;
  uint64_t v4 = 4294967293;
  if (a1)
  {
    if (a2 >= 0x10)
    {
      if (a3)
      {
        if (a4)
        {
          unsigned int v9 = *a1;
          if (v9 <= 0x1C)
          {
            if (((1 << v9) & 0x1FFCFF4E) != 0)
            {
              size_t v10 = a1[3] + 16;
              if (v10 > a2) {
                goto LABEL_36;
              }
              uint64_t v11 = Util_AllocRequirement(v9, 0, &__dst);
              if (!v11)
              {
                if (__dst)
                {
                  memcpy(__dst, a1, v10);
LABEL_11:
                  uint64_t v4 = 0;
                  *a4 = v10;
                  *a3 = __dst;
                  return v4;
                }
                return 4294967292;
              }
              goto LABEL_35;
            }
            if (((1 << v9) & 0x30) != 0)
            {
              uint64_t v13 = a1[4];
              if (8 * v13 + 20 > a2) {
                goto LABEL_36;
              }
              uint64_t v11 = Util_AllocRequirement(v9, v13, &__dst);
              if (v11) {
                goto LABEL_35;
              }
              BOOL v14 = __dst;
              if (!__dst) {
                return 4294967292;
              }
              if (*((_DWORD *)__dst + 3) == 84)
              {
                long long v15 = *(_OWORD *)a1;
                *((_DWORD *)__dst + 4) = a1[4];
                *BOOL v14 = v15;
                *((_DWORD *)__dst + 3) = 84;
                if (!a1[4])
                {
                  size_t v10 = 20;
                  goto LABEL_11;
                }
                uint64_t v16 = 0;
                size_t v10 = 20;
                while (1)
                {
                  uint64_t v21 = 0;
                  uint64_t v22 = 0;
                  uint64_t v11 = DeserializeRequirement((char *)a1 + v10, a2 - v10, &v22, &v21);
                  if (v11) {
                    goto LABEL_35;
                  }
                  *(void *)((char *)__dst + 8 * v16 + 20) = v22;
                  v10 += v21;
                  if (++v16 >= (unint64_t)a1[4]) {
                    goto LABEL_11;
                  }
                }
              }
              goto LABEL_39;
            }
            if (v9 == 7)
            {
              uint64_t v17 = a1[5];
              if (8 * v17 + 24 <= a2)
              {
                uint64_t v11 = Util_AllocRequirement(7, v17, &__dst);
                if (!v11)
                {
                  unint64_t v18 = __dst;
                  if (!__dst) {
                    return 4294967292;
                  }
                  if (*((_DWORD *)__dst + 3) != 88)
                  {
LABEL_39:
                    uint64_t v4 = 4294967291;
                    goto LABEL_36;
                  }
                  long long v19 = *(_OWORD *)a1;
                  *((void *)__dst + 2) = *((void *)a1 + 2);
                  *unint64_t v18 = v19;
                  *((_DWORD *)__dst + 3) = 88;
                  if (!a1[5])
                  {
                    size_t v10 = 24;
                    goto LABEL_11;
                  }
                  uint64_t v20 = 0;
                  size_t v10 = 24;
                  while (1)
                  {
                    uint64_t v21 = 0;
                    uint64_t v22 = 0;
                    uint64_t v11 = DeserializeRequirement((char *)a1 + v10, a2 - v10, &v22, &v21);
                    if (v11) {
                      break;
                    }
                    *((void *)__dst + v20 + 3) = v22;
                    v10 += v21;
                    if (++v20 >= (unint64_t)a1[5]) {
                      goto LABEL_11;
                    }
                  }
                }
LABEL_35:
                uint64_t v4 = v11;
              }
            }
          }
        }
      }
    }
  }
LABEL_36:
  if (__dst) {
    Util_DeallocRequirement((int *)__dst);
  }
  return v4;
}

uint64_t GetSerializedCredentialSize(_DWORD *a1, void *a2)
{
  uint64_t result = 4294967293;
  if (a1 && a2 && *a1 <= 0x17u && ((1 << *a1) & 0xFFF7FE) != 0)
  {
    uint64_t result = 0;
    *a2 = a1[7] + 32;
  }
  return result;
}

uint64_t SerializeCredential(unsigned int *__src, void *__dst, size_t *a3)
{
  uint64_t result = 4294967293;
  if (__src && __dst && a3)
  {
    unsigned int v6 = *__src;
    if (*__src <= 0x17 && ((1 << *__src) & 0xFFF7FE) != 0)
    {
      size_t v8 = __src[7] + 32;
      if (v8 <= *a3 && v6 <= 0x17 && ((1 << v6) & 0xFFF7FE) != 0)
      {
        memcpy(__dst, __src, v8);
        uint64_t result = 0;
        *a3 = __src[7] + 32;
      }
    }
  }
  return result;
}

uint64_t DeserializeCredential(unsigned int *a1, unint64_t a2, void **a3, void *a4)
{
  __dst = 0;
  uint64_t v4 = 4294967293;
  if (a2 >= 0x20 && a1 && a3 && a4)
  {
    unsigned int v8 = *a1;
    uint64_t v10 = a1[7];
    switch(*a1)
    {
      case 1u:
        if (v10 == 28) {
          goto LABEL_7;
        }
        return v4;
      case 2u:
        if (v10 == 136) {
          goto LABEL_7;
        }
        return v4;
      case 3u:
        if (v10 == 305) {
          goto LABEL_7;
        }
        return v4;
      case 4u:
      case 5u:
      case 6u:
      case 8u:
      case 0xEu:
      case 0x10u:
      case 0x13u:
      case 0x16u:
      case 0x17u:
        if (!v10) {
          goto LABEL_7;
        }
        return v4;
      case 7u:
        if (v10 == 56) {
          goto LABEL_7;
        }
        return v4;
      case 9u:
        if (v10 == 24) {
          goto LABEL_7;
        }
        return v4;
      case 0xAu:
        if (v10 == 52) {
          goto LABEL_7;
        }
        return v4;
      case 0xCu:
      case 0xFu:
        if (v10 == 8) {
          goto LABEL_7;
        }
        return v4;
      case 0xDu:
      case 0x15u:
        if (v10 == 132) {
          goto LABEL_7;
        }
        return v4;
      case 0x11u:
        if (v10 == 81) {
          goto LABEL_7;
        }
        return v4;
      case 0x12u:
        if (v10 == 20) {
          goto LABEL_7;
        }
        return v4;
      case 0x14u:
        if (v10 != 32) {
          return v4;
        }
LABEL_7:
        uint64_t v4 = Util_AllocCredential(*a1, &__dst);
        if (v4)
        {
          if (__dst)
          {
LABEL_16:
            Util_DeallocCredential(__dst);
            return v4;
          }
        }
        else
        {
          if (__dst)
          {
            if (*((_DWORD *)__dst + 1) > 3u || *((_DWORD *)__dst + 2) > 0x50u)
            {
              uint64_t v4 = 4294967293;
            }
            else
            {
              uint64_t v4 = 4294967293;
              if (v8 <= 0x17 && ((1 << v8) & 0xFFF7FE) != 0 && v10 + 32 <= a2)
              {
                memcpy(__dst, a1, v10 + 32);
                uint64_t v4 = 0;
                *a3 = __dst;
                *a4 = v10 + 32;
                return v4;
              }
            }
            goto LABEL_16;
          }
          uint64_t v4 = 4294967292;
        }
        break;
      default:
        return v4;
    }
  }
  return v4;
}

uint64_t CopyCredential(uint64_t a1, void **a2)
{
  __dst = 0;
  uint64_t v2 = 4294967293;
  if (a1 && a2)
  {
    uint64_t v2 = Util_AllocCredential(*(_DWORD *)a1, &__dst);
    if (v2)
    {
      if (__dst) {
        Util_DeallocCredential(__dst);
      }
    }
    else if (__dst)
    {
      memcpy(__dst, (const void *)a1, *(unsigned int *)(a1 + 28) + 32);
      uint64_t v2 = 0;
      *a2 = __dst;
    }
    else
    {
      return 4294967292;
    }
  }
  return v2;
}

uint64_t CompareCredentials(void *__s1, void *__s2, unsigned char *a3)
{
  uint64_t v3 = 4294967293;
  if (__s1)
  {
    uint64_t v4 = __s2;
    if (__s2)
    {
      if (a3)
      {
        unsigned int v6 = __s1;
        if (*(_DWORD *)__s1 == *(_DWORD *)__s2)
        {
          uint64_t v7 = *((unsigned int *)__s1 + 7);
          if (v7 == *((_DWORD *)__s2 + 7))
          {
            uint64_t v3 = 4294967293;
            switch(*(_DWORD *)__s1)
            {
              case 1:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3]) {
                  break;
                }
                uint64_t v13 = (char *)__s1 + 44;
                BOOL v14 = (char *)__s2 + 44;
                goto LABEL_74;
              case 2:
                if (*((_DWORD *)__s1 + 8) != *((_DWORD *)__s2 + 8)) {
                  break;
                }
                size_t v8 = *((unsigned int *)__s1 + 9);
                if (v8 != *((_DWORD *)__s2 + 9)) {
                  break;
                }
                __s2 += 5;
                __s1 += 5;
                goto LABEL_8;
              case 3:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3]) {
                  break;
                }
                uint64_t v13 = (char *)(__s1 + 13);
                BOOL v14 = (char *)(__s2 + 13);
                goto LABEL_74;
              case 4:
              case 5:
              case 6:
              case 8:
              case 0xC:
              case 0xE:
              case 0xF:
              case 0x10:
              case 0x11:
              case 0x12:
              case 0x13:
              case 0x16:
              case 0x17:
                size_t v8 = v7 + 32;
                goto LABEL_8;
              case 7:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3]) {
                  break;
                }
                BOOL isNullOrEqualMem2 = _isNullOrEqualMem2((unint64_t)(__s1 + 4), 0x20uLL, (unint64_t)(__s2 + 4), 32);
                if (!isNullOrEqualMem2) {
                  goto LABEL_100;
                }
                uint64_t v13 = (char *)(v6 + 8);
                BOOL v14 = (char *)(v4 + 8);
                size_t v21 = 24;
                uint64_t v22 = 24;
                goto LABEL_103;
              case 9:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3]) {
                  break;
                }
                uint64_t v13 = (char *)(__s1 + 5);
                BOOL v14 = (char *)(__s2 + 5);
                goto LABEL_74;
              case 0xA:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3]) {
                  break;
                }
                BOOL isNullOrEqualMem2 = _isNullOrEqualMem2((unint64_t)__s1 + 36, 0x10uLL, (unint64_t)__s2 + 36, 16);
                if (!isNullOrEqualMem2) {
                  goto LABEL_100;
                }
                uint64_t v13 = (char *)v6 + 52;
                BOOL v14 = (char *)v4 + 52;
LABEL_74:
                size_t v21 = 16;
                uint64_t v22 = 16;
                goto LABEL_103;
              case 0xD:
                size_t v8 = *((unsigned int *)__s1 + 8);
                if (v8 != *((_DWORD *)__s2 + 8)) {
                  break;
                }
                __s2 = (void *)((char *)__s2 + 36);
                __s1 = (void *)((char *)__s1 + 36);
LABEL_8:
                LOBYTE(isNullOrEqualMem2) = memcmp(__s1, __s2, v8) == 0;
                goto LABEL_100;
              case 0x14:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3]) {
                  break;
                }
                BOOL v14 = (char *)(__s2 + 4);
                uint64_t v13 = (char *)(__s1 + 4);
                size_t v21 = 32;
                uint64_t v22 = 32;
                goto LABEL_103;
              case 0x15:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3]) {
                  break;
                }
                uint64_t v13 = (char *)__s1 + 36;
                BOOL v14 = (char *)__s2 + 36;
                size_t v21 = 128;
                uint64_t v22 = 128;
LABEL_103:
                LOBYTE(isNullOrEqualMem2) = _isNullOrEqualMem2((unint64_t)v13, v21, (unint64_t)v14, v22);
                goto LABEL_100;
              default:
                return v3;
            }
          }
        }
        LOBYTE(isNullOrEqualMem2) = 0;
LABEL_100:
        uint64_t v3 = 0;
        *a3 = isNullOrEqualMem2;
      }
    }
  }
  return v3;
}

BOOL _isNullOrEqualMem2(unint64_t __s1, size_t __n, unint64_t __s2, uint64_t a4)
{
  if (__n != a4) {
    return 0;
  }
  if (!(__s1 | __s2)) {
    return 1;
  }
  BOOL result = 0;
  BOOL v6 = __s1 == 0;
  if (__s2)
  {
    BOOL v7 = 1;
  }
  else
  {
    BOOL v6 = 0;
    BOOL v7 = __s1 == 0;
  }
  if (v7 && !v6) {
    return memcmp((const void *)__s1, (const void *)__s2, __n) == 0;
  }
  return result;
}

uint64_t GetSerializedAddCredentialSize(uint64_t a1, _DWORD *a2, int a3, void *a4)
{
  if (a1) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = a3 == 2;
  }
  char v5 = !v4;
  uint64_t result = 4294967293;
  if (a4 && a2 && (v5 & 1) == 0 && *a2 <= 0x17u && ((1 << *a2) & 0xFFF7FE) != 0)
  {
    uint64_t result = 0;
    *a4 = a2[7] + 52;
  }
  return result;
}

uint64_t SerializeAddCredential(_OWORD *a1, unsigned int *__src, int a3, uint64_t a4, void *a5)
{
  if (a1) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = a3 == 2;
  }
  char v7 = !v6;
  uint64_t result = 4294967293;
  if (a5)
  {
    if (a4)
    {
      if (__src)
      {
        if ((v7 & 1) == 0)
        {
          uint64_t result = 4294967293;
          if (*__src <= 0x17 && ((1 << *__src) & 0xFFF7FE) != 0 && *a5 >= (unint64_t)__src[7] + 52)
          {
            if (a1)
            {
              *(_OWORD *)a4 = *a1;
            }
            else
            {
              *(void *)a4 = 0;
              *(void *)(a4 + 8) = 0;
            }
            uint64_t v13 = *a5 - 16;
            uint64_t result = SerializeCredential(__src, (void *)(a4 + 16), (size_t *)&v13);
            if (!result)
            {
              size_t v12 = v13;
              *(_DWORD *)(v13 + a4 + 16) = a3;
              *a5 = v12 + 20;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t DeserializeAddCredential(uint64_t a1, unint64_t a2, _OWORD *a3, void *a4, _DWORD *a5)
{
  size_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v5 = 4294967293;
  if (a1 && a2 >= 0x34 && a3 && a4 && a5)
  {
    *a3 = *(_OWORD *)a1;
    uint64_t v10 = DeserializeCredential((unsigned int *)(a1 + 16), a2 - 16, (void **)&v12, &v13);
    if (v10)
    {
      uint64_t v5 = v10;
    }
    else if (a2 - (v13 + 16) >= 4)
    {
      uint64_t v5 = 0;
      *a5 = *(_DWORD *)(a1 + v13 + 16);
      *a4 = v12;
      return v5;
    }
  }
  if (v12) {
    Util_DeallocCredential(v12);
  }
  return v5;
}

uint64_t DeserializeAddCredentialType(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  uint64_t result = 4294967293;
  if (a2 >= 0x34 && a1)
  {
    if (a3)
    {
      uint64_t result = 0;
      *a3 = *(_DWORD *)(a1 + 16);
    }
  }
  return result;
}

uint64_t GetSerializedRemoveCredentialSize(uint64_t a1, _DWORD *a2, int a3, void *a4)
{
  if (a1) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = a3 == 2;
  }
  char v5 = !v4;
  uint64_t result = 4294967293;
  if (a4 && a2 && (v5 & 1) == 0 && *a2 <= 0x17u && ((1 << *a2) & 0xFFF7FE) != 0)
  {
    uint64_t result = 0;
    *a4 = a2[7] + 52;
  }
  return result;
}

uint64_t GetSerializedReplacePassphraseCredentialSize(uint64_t a1, _DWORD *a2, int a3, void *a4)
{
  if (a1) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = a3 == 2;
  }
  char v5 = !v4;
  uint64_t result = 4294967293;
  if (a4 && a2 && (v5 & 1) == 0 && *a2 <= 0x17u && ((1 << *a2) & 0xFFF7FE) != 0)
  {
    uint64_t result = 0;
    *a4 = a2[7] + 52;
  }
  return result;
}

uint64_t SerializeCredentialList(unsigned int **a1, unsigned int a2, unsigned int *a3, void *a4)
{
  if (a2) {
    BOOL v6 = a1 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6 || a3 == 0 || a4 == 0) {
    return 4294967293;
  }
  v16[7] = v4;
  v16[8] = v5;
  *a3 = a2;
  if (a2)
  {
    uint64_t v11 = a1;
    uint64_t v12 = a2;
    uint64_t v13 = 4;
    while (1)
    {
      BOOL v14 = *v11;
      if (!*v11) {
        return 4294967293;
      }
      v16[0] = *a4 - v13;
      uint64_t result = SerializeCredential(v14, (char *)a3 + v13, v16);
      if (result) {
        return result;
      }
      v13 += v16[0];
      ++v11;
      if (!--v12) {
        goto LABEL_18;
      }
    }
  }
  else
  {
    uint64_t v13 = 4;
LABEL_18:
    uint64_t result = 0;
    *a4 = v13;
  }
  return result;
}

uint64_t DeserializeCredentialList(unsigned int *a1, uint64_t a2, void *a3, _DWORD *a4)
{
  uint64_t v15 = 0;
  uint64_t v4 = 4294967293;
  if (a1)
  {
    if (a3)
    {
      if (a4)
      {
        uint64_t v8 = *a1;
        if (v8 <= 0x3E8)
        {
          if (v8)
          {
            uint64_t v10 = (char *)acm_mem_alloc(8 * v8);
            acm_mem_alloc_info("array of ACMCredentialRef", v10, 8 * v8, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 1778, "DeserializeCredentialList");
            if (v10)
            {
              uint64_t v11 = 0;
              uint64_t v12 = 4;
              while (1)
              {
                uint64_t v13 = DeserializeCredential((unsigned int *)((char *)a1 + v12), a2 - v12, (void **)&v10[v11], &v15);
                if (v13) {
                  break;
                }
                v12 += v15;
                v11 += 8;
                if (8 * v8 == v11) {
                  goto LABEL_12;
                }
              }
              uint64_t v4 = v13;
              DeallocCredentialList((_DWORD **)v10, v8);
            }
            else
            {
              return 4294967292;
            }
          }
          else
          {
            uint64_t v10 = 0;
LABEL_12:
            uint64_t v4 = 0;
            *a4 = v8;
            *a3 = v10;
          }
        }
      }
    }
  }
  return v4;
}

void DeallocCredentialList(_DWORD **a1, unsigned int a2)
{
  if (a1)
  {
    uint64_t v3 = a2;
    if (a2)
    {
      uint64_t v4 = a1;
      uint64_t v5 = a2;
      do
      {
        if (*v4)
        {
          Util_DeallocCredential(*v4);
          *uint64_t v4 = 0;
        }
        ++v4;
        --v5;
      }
      while (v5);
    }
    unint64_t v6 = 8 * v3;
    acm_mem_free_info("array of ACMCredentialRef", a1, v6, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 1816, "DeallocCredentialList");
    acm_mem_free(a1, v6);
  }
}

uint64_t GetSerializedGetContextPropertySize(uint64_t a1, uint64_t a2, void *a3)
{
  if (!a3) {
    return 4294967293;
  }
  uint64_t result = 0;
  *a3 = 20;
  return result;
}

__n128 SerializeGetContextProperty(__n128 *a1, unsigned __int32 a2, __n128 *a3, void *a4)
{
  if (a1 && a3 && a4 && *a4 >= 0x14uLL)
  {
    __n128 result = *a1;
    *a3 = *a1;
    a3[1].n128_u32[0] = a2;
    *a4 = 20;
  }
  return result;
}

uint64_t DeserializeGetContextProperty(uint64_t a1, unint64_t a2, _OWORD *a3, _DWORD *a4)
{
  uint64_t result = 4294967293;
  if (a2 >= 0x10 && a1 && a3 && a4)
  {
    *a3 = *(_OWORD *)a1;
    if ((a2 & 0xFFFFFFFFFFFFFFFCLL) != 0x10)
    {
      uint64_t result = 0;
      *a4 = *(_DWORD *)(a1 + 16);
    }
  }
  return result;
}

uint64_t LibSer_GetAclAuthMethod_GetSize(uint64_t a1, void *a2)
{
  if (!a2) {
    return 4294967293;
  }
  uint64_t result = 0;
  *a2 = 16;
  return result;
}

__n128 LibSer_GetAclAuthMethod_Serialize(__n128 *a1, __n128 *a2, void *a3)
{
  if (a1 && a2 && a3 && *a3 >= 0x10uLL)
  {
    __n128 result = *a1;
    *a2 = *a1;
    *a3 = 16;
  }
  return result;
}

__n128 LibSer_GetAclAuthMethod_Deserialize(__n128 *a1, unint64_t a2, __n128 *a3)
{
  if (a2 >= 0x10 && a1)
  {
    if (a3)
    {
      __n128 result = *a1;
      *a3 = *a1;
    }
  }
  return result;
}

uint64_t LibSer_ContextCredentialGetProperty_GetSize(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!a4) {
    return 4294967293;
  }
  uint64_t result = 0;
  *a4 = 24;
  return result;
}

__n128 LibSer_ContextCredentialGetProperty_Serialize(__n128 *a1, unsigned __int32 a2, unsigned __int32 a3, __n128 *a4, void *a5)
{
  if (a1 && a4 && a5 && *a5 >= 0x18uLL)
  {
    __n128 result = *a1;
    *a4 = *a1;
    a4[1].n128_u32[0] = a2;
    a4[1].n128_u32[1] = a3;
    *a5 = 24;
  }
  return result;
}

__n128 LibSer_ContextCredentialGetProperty_Deserialize(__n128 *a1, unint64_t a2, __n128 *a3, _DWORD *a4, _DWORD *a5)
{
  if (a2 >= 0x18 && a1 && a3 && a4)
  {
    if (a5)
    {
      __n128 result = *a1;
      *a3 = *a1;
      *a4 = a1[1].n128_u32[0];
      *a5 = a1[1].n128_u32[1];
    }
  }
  return result;
}

uint64_t LibSer_GlobalContextCredentialGetProperty_GetSize(void *a1)
{
  if (!a1) {
    return 4294967293;
  }
  uint64_t result = 0;
  *a1 = 8;
  return result;
}

uint64_t LibSer_GlobalContextCredentialGetProperty_Serialize(int a1, int a2, _DWORD *a3, void *a4)
{
  uint64_t result = 4294967293;
  if (a3 && a4 && *a4 >= 8uLL)
  {
    uint64_t result = 0;
    *a3 = a1;
    a3[1] = a2;
    *a4 = 8;
  }
  return result;
}

uint64_t LibSer_GlobalContextCredentialGetProperty_Deserialize(_DWORD *a1, unint64_t a2, _DWORD *a3, _DWORD *a4)
{
  uint64_t result = 4294967293;
  if (a2 >= 8 && a1 && a3)
  {
    if (a4)
    {
      uint64_t result = 0;
      *a3 = *a1;
      *a4 = a1[1];
    }
  }
  return result;
}

uint64_t LibSer_RemoveCredentialByType_GetSize(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!a4) {
    return 4294967293;
  }
  uint64_t result = 0;
  *a4 = 24;
  return result;
}

__n128 LibSer_RemoveCredentialByType_Serialize(__n128 *a1, unsigned __int32 a2, unsigned __int32 a3, __n128 *a4, void *a5)
{
  if (a1 && a4 && a5 && *a5 >= 0x18uLL)
  {
    __n128 result = *a1;
    *a4 = *a1;
    a4[1].n128_u32[0] = a2;
    a4[1].n128_u32[1] = a3;
    *a5 = 24;
  }
  return result;
}

__n128 LibSer_RemoveCredentialByType_Deserialize(__n128 *a1, unint64_t a2, __n128 *a3, _DWORD *a4, _DWORD *a5)
{
  if (a2 >= 0x18 && a1 && a3 && a4)
  {
    if (a5)
    {
      __n128 result = *a1;
      *a3 = *a1;
      *a4 = a1[1].n128_u32[0];
      *a5 = a1[1].n128_u32[1];
    }
  }
  return result;
}

uint64_t LibSer_DeleteContext_GetSize(uint64_t a1, void *a2)
{
  if (!a2) {
    return 4294967293;
  }
  uint64_t result = 0;
  *a2 = 16;
  return result;
}

__n128 LibSer_DeleteContext_Serialize(__n128 *a1, __n128 *a2, void *a3)
{
  if (a1 && a2 && a3 && *a3 >= 0x10uLL)
  {
    __n128 result = *a1;
    *a2 = *a1;
    *a3 = 16;
  }
  return result;
}

__n128 LibSer_DeleteContext_Deserialize(__n128 *a1, unint64_t a2, __n128 *a3)
{
  if (a2 >= 0x10 && a1)
  {
    if (a3)
    {
      __n128 result = *a1;
      *a3 = *a1;
    }
  }
  return result;
}

uint64_t LibSer_StorageAnyCmd_DeserializeCommonFields(uint64_t a1, unint64_t a2, _OWORD *a3, _DWORD *a4)
{
  uint64_t result = 4294967293;
  if (a1 && a2 >= 0x14)
  {
    if (a3) {
      *a3 = *(_OWORD *)a1;
    }
    uint64_t result = 0;
    if (a4) {
      *a4 = *(_DWORD *)(a1 + 16);
    }
  }
  return result;
}

uint64_t LibSer_StorageSetData_GetSize(uint64_t a1, _DWORD *a2, unsigned int a3, void *a4)
{
  unsigned int v7 = 0;
  if (!a4) {
    return 4294967291;
  }
  uint64_t result = getLengthOfParameters(a2, a3, &v7);
  if (!result) {
    *a4 = a1 + v7 + 28;
  }
  return result;
}

uint64_t LibSer_StorageSetData_Serialize(_OWORD *a1, int a2, const void *a3, size_t a4, _DWORD *a5, unsigned int a6, uint64_t a7, size_t *a8)
{
  uint64_t result = 4294967293;
  if (a1)
  {
    if (a2)
    {
      if (a7)
      {
        if (a8)
        {
          unsigned int v18 = 0;
          uint64_t result = getLengthOfParameters(a5, a6, &v18);
          if (!result)
          {
            if (*a8 < a4 + v18 + 28)
            {
              return 4294967293;
            }
            else
            {
              *(_OWORD *)a7 = *a1;
              *(_DWORD *)(a7 + 16) = a2;
              *(_DWORD *)(a7 + 20) = a4;
              memcpy((void *)(a7 + 24), a3, a4);
              size_t v17 = a4 + 24;
              uint64_t result = serializeParameters((uint64_t)a5, a6, a7, (uint64_t *)&v17);
              if (!result) {
                *a8 = v17;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t LibSer_StorageSetData_Deserialize(uint64_t a1, unint64_t a2, _OWORD *a3, _DWORD *a4, void *a5, void *a6, void *a7, _DWORD *a8)
{
  uint64_t v10 = 4294967293;
  if (a1 && a2 >= 0x18 && a6 && a3 && a4 && a5 && a7 && a8)
  {
    v14[1] = v8;
    v14[2] = v9;
    *a3 = *(_OWORD *)a1;
    *a4 = *(_DWORD *)(a1 + 16);
    uint64_t v11 = *(unsigned int *)(a1 + 20);
    v14[0] = 24;
    *a6 = v11;
    if (v11)
    {
      unint64_t v12 = v11 + 24;
      if (v12 > a2) {
        return 4294967293;
      }
      *a5 = a1 + 24;
      v14[0] = v12;
    }
    else
    {
      *a5 = 0;
    }
    return deserializeParameters(a1, a2, v14, a7, a8);
  }
  return v10;
}

uint64_t LibSer_StorageGetData_GetSize(_DWORD *a1, unsigned int a2, void *a3)
{
  unsigned int v5 = 0;
  if (!a3) {
    return 4294967291;
  }
  uint64_t result = getLengthOfParameters(a1, a2, &v5);
  if (!result) {
    *a3 = v5 + 25;
  }
  return result;
}

uint64_t LibSer_StorageGetData_Serialize(_OWORD *a1, int a2, char a3, _DWORD *a4, unsigned int a5, uint64_t a6, void *a7)
{
  uint64_t result = 4294967293;
  if (a1)
  {
    if (a2)
    {
      if (a6)
      {
        if (a7)
        {
          unsigned int v16 = 0;
          uint64_t result = getLengthOfParameters(a4, a5, &v16);
          if (!result)
          {
            if (*a7 < (unint64_t)v16 + 25)
            {
              return 4294967293;
            }
            else
            {
              *(_OWORD *)a6 = *a1;
              *(_DWORD *)(a6 + 16) = a2;
              *(unsigned char *)(a6 + 20) = a3;
              uint64_t v15 = 21;
              uint64_t result = serializeParameters((uint64_t)a4, a5, a6, &v15);
              if (!result) {
                *a7 = v15;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t LibSer_StorageGetData_Deserialize(uint64_t a1, unint64_t a2, _OWORD *a3, _DWORD *a4, BOOL *a5, void *a6, _DWORD *a7)
{
  uint64_t v9 = 4294967293;
  if (a1 && a2 >= 0x15 && a3 && a4 && a5)
  {
    v11[1] = v7;
    v11[2] = v8;
    *a3 = *(_OWORD *)a1;
    *a4 = *(_DWORD *)(a1 + 16);
    *a5 = *(unsigned char *)(a1 + 20) != 0;
    v11[0] = 21;
    return deserializeParameters(a1, a2, v11, a6, a7);
  }
  return v9;
}

uint64_t LibSer_GetUnlockSecret_GetSize(_DWORD *a1, unsigned int a2, void *a3)
{
  unsigned int v5 = 0;
  if (!a3) {
    return 4294967291;
  }
  uint64_t result = getLengthOfParameters(a1, a2, &v5);
  if (!result) {
    *a3 = v5 + 20;
  }
  return result;
}

uint64_t LibSer_GetUnlockSecret_Serialize(_OWORD *a1, _DWORD *a2, unsigned int a3, _OWORD *a4, void *a5)
{
  uint64_t result = 4294967293;
  if (a1)
  {
    if (a4)
    {
      if (a5)
      {
        unsigned int v12 = 0;
        uint64_t result = getLengthOfParameters(a2, a3, &v12);
        if (!result)
        {
          if (*a5 < (unint64_t)v12 + 20)
          {
            return 4294967293;
          }
          else
          {
            *a4 = *a1;
            uint64_t v11 = 16;
            uint64_t result = serializeParameters((uint64_t)a2, a3, (uint64_t)a4, &v11);
            if (!result) {
              *a5 = v11;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t LibSer_GetUnlockSecret_Deserialize(_OWORD *a1, unint64_t a2, _OWORD *a3, void *a4, _DWORD *a5)
{
  if (!a1) {
    return 4294967293;
  }
  uint64_t result = 4294967293;
  if (a2 >= 0x10 && a3 && a4)
  {
    if (a5)
    {
      v9[1] = v5;
      v9[2] = v6;
      *a3 = *a1;
      v9[0] = 16;
      return deserializeParameters((uint64_t)a1, a2, v9, a4, a5);
    }
  }
  return result;
}

uint64_t LibSer_GetUnlockSecretResponse_GetSize(uint64_t a1, void *a2)
{
  if (!a2) {
    return 4294967291;
  }
  uint64_t result = 0;
  *a2 = a1 + 1;
  return result;
}

uint64_t LibSer_GetUnlockSecretResponse_Serialize(void *__src, size_t __n, char a3, unsigned char *a4, void *a5)
{
  uint64_t result = 4294967293;
  if (__src && __n && a4 && a5)
  {
    size_t v9 = __n + 1;
    if (*a5 < __n + 1)
    {
      return 4294967293;
    }
    else
    {
      *a4 = a3;
      memcpy(a4 + 1, __src, __n);
      uint64_t result = 0;
      *a5 = v9;
    }
  }
  return result;
}

uint64_t LibSer_GetUnlockSecretResponse_Deserialize(unsigned char *a1, uint64_t a2, void *a3, void *a4, unsigned char *a5)
{
  uint64_t result = 4294967293;
  if (a2 && a5 && a1 && a3)
  {
    if (a4)
    {
      uint64_t result = 0;
      *a5 = *a1;
      *a3 = a1 + 1;
      *a4 = a2 - 1;
    }
  }
  return result;
}

uint64_t LibSer_SEPControl_GetSize(uint64_t a1, _DWORD *a2, unsigned int a3, void *a4)
{
  unsigned int v7 = 0;
  if (!a4) {
    return 4294967291;
  }
  uint64_t result = getLengthOfParameters(a2, a3, &v7);
  if (!result) {
    *a4 = a1 + v7 + 24;
  }
  return result;
}

uint64_t LibSer_SEPControl_Serialize(_OWORD *a1, _DWORD *a2, unsigned int a3, const void *a4, size_t a5, uint64_t a6, void *a7)
{
  uint64_t result = 4294967293;
  if (a6)
  {
    if (a7)
    {
      unsigned int v18 = 0;
      uint64_t result = getLengthOfParameters(a2, a3, &v18);
      if (!result)
      {
        if (*a7 < a5 + v18 + 24)
        {
          return 4294967293;
        }
        else
        {
          if (a1)
          {
            *(_OWORD *)a6 = *a1;
          }
          else
          {
            *(void *)a6 = 0;
            *(void *)(a6 + 8) = 0;
          }
          uint64_t v17 = 16;
          uint64_t result = serializeParameters((uint64_t)a2, a3, a6, &v17);
          if (!result)
          {
            uint64_t v15 = v17;
            *(_DWORD *)(a6 + v17) = a5;
            uint64_t v16 = v15 + 4;
            memcpy((void *)(a6 + v15 + 4), a4, a5);
            uint64_t result = 0;
            *a7 = v16 + a5;
          }
        }
      }
    }
  }
  return result;
}

uint64_t LibSer_SEPControl_Deserialize(_OWORD *a1, unint64_t a2, _OWORD *a3, void *a4, _DWORD *a5, unint64_t *a6, void *a7)
{
  if (!a1) {
    return 4294967293;
  }
  uint64_t result = 4294967293;
  if (a2 >= 0x18 && a7 && a3 && a4 && a5 && a6)
  {
    *a3 = *a1;
    unint64_t v12 = 16;
    uint64_t result = deserializeParameters((uint64_t)a1, a2, &v12, a4, a5);
    if (!result)
    {
      unint64_t v11 = (unint64_t)a1 + v12 + 4;
      *a7 = *(unsigned int *)((char *)a1 + v12);
      *a6 = v11;
    }
  }
  return result;
}

uint64_t LibSer_SEPControlResponse_GetSize(uint64_t a1, void *a2)
{
  if (!a2) {
    return 4294967291;
  }
  uint64_t result = 0;
  *a2 = a1 + 4;
  return result;
}

uint64_t LibSer_SEPControlResponse_Serialize(void *__src, size_t __n, _DWORD *a3, uint64_t *a4)
{
  uint64_t result = 4294967293;
  if (a3 && a4)
  {
    uint64_t v8 = __n + 4;
    if (*a4 < __n + 4)
    {
      return 4294967293;
    }
    else
    {
      *a3 = __n;
      if (__src) {
        memcpy(a3 + 1, __src, __n);
      }
      else {
        uint64_t v8 = 4;
      }
      uint64_t result = 0;
      *a4 = v8;
    }
  }
  return result;
}

uint64_t LibSer_SEPControlResponse_Deserialize(unsigned int *a1, unint64_t a2, void *a3, void *a4)
{
  if (!a1) {
    return 4294967293;
  }
  uint64_t result = 4294967293;
  if (a2 >= 4 && a3 && a4)
  {
    uint64_t result = 0;
    unsigned int v7 = *a1;
    unint64_t v6 = a1 + 1;
    *a4 = v7;
    if (!v7) {
      unint64_t v6 = 0;
    }
    *a3 = v6;
  }
  return result;
}

uint64_t checkParameter(_DWORD *a1)
{
  if (!a1) {
    return 4294967293;
  }
  switch(*a1)
  {
    case 0:
    case 0xC:
      if (a1[4]) {
        return 4294967293;
      }
      break;
    case 1:
    case 4:
    case 5:
    case 0xA:
      if (a1[4] != 4) {
        return 4294967293;
      }
      break;
    case 2:
    case 6:
    case 7:
      if (a1[4] != 16) {
        return 4294967293;
      }
      break;
    case 3:
      if ((a1[4] - 1001) < 0xFFFFFC18) {
        return 4294967293;
      }
      break;
    case 8:
    case 9:
      if (a1[4] != 1) {
        return 4294967293;
      }
      break;
    case 0xB:
      if (a1[4] > 0x400u) {
        return 4294967293;
      }
      break;
    default:
      return 4294967293;
  }
  return 0;
}

uint64_t LibCall_ACMKernelControl_Block()
{
  uint64_t v0 = off_50A50();
  uint64_t v2 = v1;
  size_t v4 = v3;
  unint64_t v6 = v5;
  int v8 = v7;
  uint64_t v10 = v9;
  unint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, void, char *, size_t, uint64_t, uint64_t))v0;
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMKernelControl_Block");
  }
  uint64_t v16 = 0x2000;
  uint64_t v12 = LibCall_ACMKernelControl(v11, v10, v8, v6, v4, (uint64_t)v17, (uint64_t)&v16);
  if (v2)
  {
    if (v16) {
      uint64_t v13 = v17;
    }
    else {
      uint64_t v13 = 0;
    }
    (*(void (**)(uint64_t, unsigned char *))(v2 + 16))(v2, v13);
  }
  if (v12) {
    unsigned int v14 = 70;
  }
  else {
    unsigned int v14 = 10;
  }
  if (v14 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMKernelControl_Block", (int)v12);
  }
  return v12;
}

uint64_t LibCall_ACMSEPControl_Block(uint64_t (*a1)(uint64_t, uint64_t, void, char *, uint64_t, unsigned int *, unint64_t *), uint64_t a2, const void *a3, size_t a4, uint64_t a5, _DWORD *a6, unsigned int a7, uint64_t a8)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSEPControl_Block");
  }
  size_t v20 = 1024;
  uint64_t v16 = LibCall_ACMSEPControl(a1, a2, a3, a4, a5, a6, a7, v21, &v20);
  if (a8)
  {
    if (v20) {
      uint64_t v17 = v21;
    }
    else {
      uint64_t v17 = 0;
    }
    (*(void (**)(uint64_t, unsigned char *))(a8 + 16))(a8, v17);
  }
  if (v16) {
    unsigned int v18 = 70;
  }
  else {
    unsigned int v18 = 10;
  }
  if (v18 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSEPControl_Block", (int)v16);
  }
  return v16;
}

uint64_t LibCall_ACMGlobalContextCredentialGetProperty_Block(uint64_t result, uint64_t a2, int a3, int a4, uint64_t a5)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, void, int *, uint64_t, unsigned char *, uint64_t *))result;
  if (gACMLoggingLevel <= 0xAu) {
    uint64_t result = printf("%s: %s: called.\n", "ACM", "LibCall_ACMGlobalContextCredentialGetProperty_Block");
  }
  uint64_t v14 = 256;
  if (v9)
  {
    uint64_t v13 = 8;
    uint64_t result = LibSer_GlobalContextCredentialGetProperty_Serialize(a3, a4, &v15, &v13);
    if (result)
    {
LABEL_7:
      uint64_t v10 = result;
      goto LABEL_8;
    }
    if (v13 == 8)
    {
      uint64_t result = v9(a2, 27, 0, &v15, 8, v16, &v14);
      goto LABEL_7;
    }
    uint64_t v10 = 4294967291;
  }
  else
  {
    uint64_t v10 = 4294967293;
  }
LABEL_8:
  if (a5)
  {
    if (v14) {
      unint64_t v11 = v16;
    }
    else {
      unint64_t v11 = 0;
    }
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned char *))(a5 + 16))(a5, v10, v11);
  }
  if (v10) {
    unsigned int v12 = 70;
  }
  else {
    unsigned int v12 = 10;
  }
  if (v12 >= gACMLoggingLevel) {
    return printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMGlobalContextCredentialGetProperty_Block", (int)v10);
  }
  return result;
}

uint64_t LibCall_ACMContextVerifyPolicy_Block(uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, char *a4, uint64_t a5)
{
  return LibCall_ACMContextVerifyPolicyWithPreflight_Block(a1, a2, a3, a4, 0, a5);
}

uint64_t LibCall_ACMContextVerifyPolicyWithPreflight_Block(uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, char *__s1, uint64_t a5, uint64_t a6)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextVerifyPolicyWithPreflight_Block");
  }
  uint64_t v17 = 0;
  BOOL v16 = 0;
  unsigned int v12 = 70;
  uint64_t v13 = 4294967293;
  if (a3 && __s1 && a6)
  {
    uint64_t v13 = LibCall_ACMContextVerifyPolicyEx(a1, a2, a3, __s1, a5, 0, 0, 0, &v16, &v17);
    uint64_t v14 = v17;
    if (!v13)
    {
      (*(void (**)(uint64_t, BOOL, int *))(a6 + 16))(a6, v16, v17);
      uint64_t v14 = v17;
    }
    if (v14) {
      Util_DeallocRequirement(v14);
    }
    if (v13) {
      unsigned int v12 = 70;
    }
    else {
      unsigned int v12 = 10;
    }
  }
  if (v12 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextVerifyPolicyWithPreflight_Block", (int)v13);
  }
  return v13;
}

int *LibCall_ACMContextVerifyPolicyEx_Block(uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, char *__s1, uint64_t a5, _DWORD *a6, unsigned int a7, uint64_t a8, uint64_t a9)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextVerifyPolicyEx_Block");
  }
  BOOL v17 = 0;
  unsigned int v18 = 0;
  uint64_t v22 = 0;
  BOOL v21 = 0;
  uint64_t v19 = 4294967293;
  if (a3 && __s1 && a9)
  {
    uint64_t v19 = LibCall_ACMContextVerifyPolicyEx(a1, a2, a3, __s1, a5, a6, a7, a8, &v21, &v22);
    unsigned int v18 = v22;
    BOOL v17 = v21;
  }
  (*(void (**)(uint64_t, uint64_t, BOOL, int *))(a9 + 16))(a9, v19, v17, v18);
  uint64_t result = v22;
  if (v22) {
    uint64_t result = (int *)Util_DeallocRequirement(v22);
  }
  if (gACMLoggingLevel <= 0xAu) {
    return (int *)printf("%s: %s: returning.\n", "ACM", "LibCall_ACMContextVerifyPolicyEx_Block");
  }
  return result;
}

uint64_t LibCall_ACMGlobalContextVerifyPolicy_Block(uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, char *a3, uint64_t a4, _DWORD *a5, unsigned int a6, uint64_t a7)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMGlobalContextVerifyPolicy_Block");
  }
  *(void *)int v15 = 0;
  uint64_t result = LibCall_ACMContextCreate((uint64_t (*)(uint64_t, uint64_t, void, void, void, unsigned char *, uint64_t *))a1, a2, v15, 0, 1);
  if (result)
  {
    if (a7) {
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void, void))(a7 + 16))(a7, result, 0, 0);
    }
  }
  else
  {
    uint64_t result = (uint64_t)LibCall_ACMContextVerifyPolicyEx_Block(a1, a2, *(_OWORD **)v15, a3, a4, a5, a6, 0xFFFFFFFFLL, a7);
  }
  if (*(void *)v15) {
    uint64_t result = LibCall_ACMContextDelete((void (*)(uint64_t, uint64_t, void, void *, uint64_t, void, void))a1, a2, *(void **)v15, 1);
  }
  if (gACMLoggingLevel <= 0xAu) {
    return printf("%s: %s: returning.\n", "ACM", "LibCall_ACMGlobalContextVerifyPolicy_Block");
  }
  return result;
}

uint64_t LibCall_ACMGetEnvironmentVariable_Block(uint64_t (*a1)(uint64_t, uint64_t, void, int *, uint64_t, uint64_t, uint64_t), uint64_t a2, int a3, uint64_t a4)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMGetEnvironmentVariable_Block");
  }
  uint64_t v14 = 128;
  if (!a4)
  {
    unsigned int v12 = 70;
    uint64_t v9 = 4294967293;
    goto LABEL_17;
  }
  if (a3 == 36)
  {
    int v8 = acm_mem_alloc_data(0x800uLL);
    acm_mem_alloc_info("<data>", v8, 2048, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCallBlock.c", 162, "LibCall_ACMGetEnvironmentVariable_Block");
    if (!v8)
    {
      unsigned int v12 = 70;
      uint64_t v9 = 4294967292;
      goto LABEL_17;
    }
    uint64_t v14 = 2048;
    uint64_t v9 = LibCall_ACMGetEnvironmentVariable(a1, a2, 36, (uint64_t)v8, (uint64_t)&v14);
    if (!v9)
    {
      if (v14) {
        uint64_t v10 = v8;
      }
      else {
        uint64_t v10 = 0;
      }
      (*(void (**)(uint64_t, void *))(a4 + 16))(a4, v10);
      acm_mem_free_info("<data>", v8, 0x800uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCallBlock.c", 176, "LibCall_ACMGetEnvironmentVariable_Block");
      acm_mem_free_data(v8, 0x800uLL);
LABEL_16:
      unsigned int v12 = 10;
      goto LABEL_17;
    }
    acm_mem_free_info("<data>", v8, 0x800uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCallBlock.c", 176, "LibCall_ACMGetEnvironmentVariable_Block");
    acm_mem_free_data(v8, 0x800uLL);
  }
  else
  {
    uint64_t v9 = LibCall_ACMGetEnvironmentVariable(a1, a2, a3, (uint64_t)v15, (uint64_t)&v14);
    if (!v9)
    {
      if (v14) {
        unint64_t v11 = v15;
      }
      else {
        unint64_t v11 = 0;
      }
      (*(void (**)(uint64_t, unsigned char *))(a4 + 16))(a4, v11);
      goto LABEL_16;
    }
  }
  unsigned int v12 = 70;
LABEL_17:
  if (v12 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMGetEnvironmentVariable_Block", (int)v9);
  }
  return v9;
}

uint64_t LibCall_ACMTRMLoadState_Block()
{
  uint64_t v0 = off_50A50();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  unint64_t v5 = (uint64_t (*)(uint64_t, uint64_t, void, void, void, uint64_t, uint64_t))v0;
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMTRMLoadState_Block");
  }
  uint64_t v10 = 0x2000;
  if (v2)
  {
    uint64_t v6 = LibCall_ACMTRMLoadState(v5, v4, (uint64_t)v11, (uint64_t)&v10);
    if (v6)
    {
      unsigned int v8 = 70;
    }
    else
    {
      if (v10) {
        int v7 = v11;
      }
      else {
        int v7 = 0;
      }
      (*(void (**)(uint64_t, unsigned char *))(v2 + 16))(v2, v7);
      unsigned int v8 = 10;
    }
  }
  else
  {
    unsigned int v8 = 70;
    uint64_t v6 = 4294967293;
  }
  if (v8 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMTRMLoadState_Block", (int)v6);
  }
  return v6;
}

uint64_t LibCall_ACMContextUnloadToImage_Block()
{
  uint64_t v0 = off_50A50();
  uint64_t v2 = v1;
  uint64_t v3 = v0;
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextUnloadToImage_Block");
  }
  if (v2)
  {
    uint64_t v4 = LibCall_ACMContextUnloadToImage(v3);
    if (v4)
    {
      unsigned int v5 = 70;
    }
    else
    {
      (*(void (**)(uint64_t, unsigned char *))(v2 + 16))(v2, v7);
      unsigned int v5 = 10;
    }
  }
  else
  {
    unsigned int v5 = 70;
    uint64_t v4 = 4294967293;
  }
  if (v5 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextUnloadToImage_Block", (int)v4);
  }
  return v4;
}

uint64_t LibCall_ACMGetAclAuthMethod_Block(uint64_t result, uint64_t a2, __n128 *a3, uint64_t a4)
{
  int v7 = (void (*)(uint64_t, uint64_t, void, __n128 *, uint64_t, unsigned char *, uint64_t *, __n128))result;
  if (gACMLoggingLevel <= 0xAu) {
    uint64_t result = printf("%s: %s: called.\n", "ACM", "LibCall_ACMGetAclAuthMethod_Block");
  }
  uint64_t v11 = 256;
  if (v7 && a3 && a4)
  {
    uint64_t v10 = 16;
    __n128 AclAuthMethod_Serialize = LibSer_GetAclAuthMethod_Serialize(a3, &v12, &v10);
    if (!v9 && v10 == 16) {
      v7(a2, 31, 0, &v12, 16, v13, &v11, AclAuthMethod_Serialize);
    }
    goto LABEL_9;
  }
  if (a4) {
LABEL_9:
  }
    uint64_t result = (*(uint64_t (**)(uint64_t))(a4 + 16))(a4);
  if (gACMLoggingLevel <= 0xAu) {
    return printf("%s: %s: returning.\n", "ACM", "LibCall_ACMGetAclAuthMethod_Block");
  }
  return result;
}

uint64_t LibCall_ACMContextVerifyAclConstraint(uint64_t a1, uint64_t a2, _OWORD *a3, const void *a4, uint64_t a5, unsigned __int8 a6, _DWORD *a7, unsigned int a8, unsigned int a9, uint64_t a10)
{
  return verifyAclConstraintForOperationCommandInternal(a1, a2, 0xBu, a3, a4, a5, 0, 0, a6, a7, a8, a9, a10);
}

uint64_t verifyAclConstraintForOperationCommandInternal(uint64_t result, uint64_t a2, unsigned __int8 a3, _OWORD *a4, const void *a5, uint64_t a6, const void *a7, unsigned int a8, unsigned __int8 a9, _DWORD *a10, unsigned int a11, unsigned int a12, uint64_t a13)
{
  size_t v20 = (uint64_t (*)(uint64_t, uint64_t, void, void *, size_t, unsigned int *, unint64_t *))result;
  if (gACMLoggingLevel <= 0xAu) {
    uint64_t result = printf("%s: %s: called.\n", "ACM", "verifyAclConstraintForOperationCommandInternal");
  }
  size_t v25 = 0;
  BOOL v24 = 0;
  if (a4 && a5 && a6 && a13)
  {
    uint64_t v21 = verifyAclConstraintInternal(v20, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, &v24, &v25);
    uint64_t v22 = v25;
    BOOL v23 = v24;
  }
  else
  {
    if (!a13) {
      goto LABEL_10;
    }
    uint64_t v22 = 0;
    BOOL v23 = 0;
    uint64_t v21 = 4294967293;
  }
  (*(void (**)(uint64_t, uint64_t, BOOL, int *))(a13 + 16))(a13, v21, v23, v22);
  uint64_t result = (uint64_t)v25;
  if (v25) {
    uint64_t result = Util_DeallocRequirement(v25);
  }
LABEL_10:
  if (gACMLoggingLevel <= 0xAu) {
    return printf("%s: %s: returning.\n", "ACM", "verifyAclConstraintForOperationCommandInternal");
  }
  return result;
}

uint64_t LibCall_ACMContextVerifyAclConstraintForOperation(uint64_t a1, uint64_t a2, _OWORD *a3, const void *a4, uint64_t a5, const void *a6, unsigned int a7, unsigned __int8 a8, _DWORD *a9, unsigned int a10, unsigned int a11, uint64_t a12)
{
  return verifyAclConstraintForOperationCommandInternal(a1, a2, 0x20u, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
}

uint64_t Util_GetBitCount(uint64_t a1)
{
  uint8x8_t v1 = (uint8x8_t)vcnt_s8((int8x8_t)a1);
  v1.i16[0] = vaddlv_u8(v1);
  return v1.u32[0];
}

char *Util_isNullOrZeroMemory(unsigned char *a1, uint64_t a2)
{
  if (!a1) {
    return (char *)&dword_0 + 1;
  }
  if (*a1) {
    return 0;
  }
  return (char *)(memcmp(a1, a1 + 1, a2 - 1) == 0);
}

BOOL Util_isNonNullEqualMemory(void *__s1, size_t __n, void *__s2, uint64_t a4)
{
  if (__n != a4) {
    return 0;
  }
  BOOL result = 0;
  if (__s1)
  {
    if (__s2) {
      return memcmp(__s1, __s2, __n) == 0;
    }
  }
  return result;
}

char *Util_hexDumpToStrHelper(char *result, unint64_t a2, uint64_t a3, unint64_t a4)
{
  if (!result && a2) {
    Util_hexDumpToStrHelper_cold_1();
  }
  if (!a3 && a4) {
    Util_hexDumpToStrHelper_cold_2();
  }
  if (a2 >= a4) {
    unint64_t v4 = a4;
  }
  else {
    unint64_t v4 = a2;
  }
  if (v4)
  {
    unsigned int v5 = (unsigned char *)(a3 + 1);
    do
    {
      *(v5 - 1) = a0123456789abcd_0[(unint64_t)*result >> 4];
      char v6 = *result++;
      unsigned char *v5 = a0123456789abcd_0[v6 & 0xF];
      v5 += 2;
      --v4;
    }
    while (v4);
  }
  return result;
}

uint64_t Util_WriteToBuffer(uint64_t a1, size_t a2, void *a3, void *__src, size_t __n)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "Util_WriteToBuffer");
  }
  if (a3)
  {
    uint64_t v10 = *a3;
    size_t v11 = *a3 + __n;
    if (!__CFADD__(*a3, __n))
    {
      if (a1 && v11 > a2)
      {
        uint64_t v12 = 4294967276;
        goto LABEL_19;
      }
      if (!a1 || !__src || !__n) {
        goto LABEL_12;
      }
      if (!__CFADD__(a1, v10))
      {
        memcpy((void *)(a1 + v10), __src, __n);
LABEL_12:
        uint64_t v12 = 0;
        *a3 = v11;
        unsigned int v13 = 10;
        goto LABEL_13;
      }
    }
    uint64_t v12 = 4294967291;
  }
  else
  {
    uint64_t v12 = 4294967293;
  }
LABEL_19:
  unsigned int v13 = 70;
LABEL_13:
  if (v13 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "Util_WriteToBuffer", (int)v12);
  }
  return v12;
}

uint64_t Util_ReadFromBuffer(uint64_t a1, size_t a2, void *a3, void *__dst, size_t __n)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "Util_ReadFromBuffer");
  }
  uint64_t v10 = 4294967293;
  unsigned int v11 = 70;
  if (a1 && a3)
  {
    uint64_t v12 = *a3;
    size_t v13 = *a3 + __n;
    if (!__CFADD__(*a3, __n))
    {
      if (v13 > a2)
      {
        uint64_t v10 = 4294967276;
        goto LABEL_17;
      }
      if (!__dst || !__n) {
        goto LABEL_11;
      }
      if (!__CFADD__(a1, v12))
      {
        memcpy(__dst, (const void *)(a1 + v12), __n);
LABEL_11:
        uint64_t v10 = 0;
        *a3 = v13;
        unsigned int v11 = 10;
        goto LABEL_12;
      }
    }
    uint64_t v10 = 4294967291;
LABEL_17:
    unsigned int v11 = 70;
  }
LABEL_12:
  if (v11 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "Util_ReadFromBuffer", (int)v10);
  }
  return v10;
}

unint64_t Util_KeybagLockStateToEnvVar(unsigned int a1)
{
  unint64_t v1 = 0x2010103020201uLL >> (8 * a1);
  if (a1 >= 7) {
    LOBYTE(v1) = 1;
  }
  return v1 & 3;
}

void Util_SafeDeallocParameters(unsigned int *a1, unsigned int a2)
{
  if (a1)
  {
    uint64_t v3 = a2;
    if (a2)
    {
      unint64_t v4 = a1 + 4;
      uint64_t v5 = a2;
      do
      {
        char v6 = (void *)*((void *)v4 - 1);
        if (v6)
        {
          unint64_t v7 = *v4;
          acm_mem_free_info("<data>", *((const void **)v4 - 1), v7, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 118, "Util_SafeDeallocParameters");
          acm_mem_free_data(v6, v7);
        }
        v4 += 6;
        --v5;
      }
      while (v5);
    }
    acm_mem_free_info("array of ACMParameter", a1, 24 * v3, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 121, "Util_SafeDeallocParameters");
    acm_mem_free(a1, 24 * v3);
  }
}

uint64_t Util_DeallocCredential(_DWORD *a1)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "Util_DeallocCredential");
  }
  if (a1)
  {
    uint64_t v2 = 4294967293;
    unsigned int v3 = 70;
    switch(*a1)
    {
      case 1:
        unint64_t v4 = "ACMCredential - ACMCredentialDataPasscodeValidated";
        rsize_t v5 = 60;
        char v6 = a1;
        unint64_t v7 = 60;
        int v8 = 144;
        goto LABEL_6;
      case 2:
        unint64_t v4 = "ACMCredential - ACMCredentialDataPassphraseEntered";
        rsize_t v5 = 168;
        char v6 = a1;
        unint64_t v7 = 168;
        int v8 = 136;
        goto LABEL_6;
      case 3:
        unint64_t v4 = "ACMCredential - ACMCredentialDataBiometryMatched";
        rsize_t v5 = 337;
        char v6 = a1;
        unint64_t v7 = 337;
        int v8 = 140;
        goto LABEL_6;
      case 4:
      case 5:
      case 6:
      case 8:
      case 0xE:
      case 0x10:
      case 0x13:
      case 0x16:
      case 0x17:
        unint64_t v4 = "ACMCredential";
        rsize_t v5 = 32;
        char v6 = a1;
        unint64_t v7 = 32;
        int v8 = 189;
        goto LABEL_6;
      case 7:
        unint64_t v4 = "ACMCredential - ACMCredentialDataUserOutputDisplayed";
        rsize_t v5 = 88;
        char v6 = a1;
        unint64_t v7 = 88;
        int v8 = 152;
        goto LABEL_6;
      case 9:
        unint64_t v4 = "ACMCredential - ACMCredentialDataContinuityUnlock";
        rsize_t v5 = 56;
        char v6 = a1;
        unint64_t v7 = 56;
        int v8 = 156;
        goto LABEL_6;
      case 0xA:
        unint64_t v4 = "ACMCredential - ACMCredentialDataPasscodeValidated2";
        rsize_t v5 = 84;
        char v6 = a1;
        unint64_t v7 = 84;
        int v8 = 148;
        goto LABEL_6;
      case 0xC:
      case 0xF:
        unint64_t v4 = "ACMCredential - ACMCredentialDataKextDenyList";
        rsize_t v5 = 40;
        char v6 = a1;
        unint64_t v7 = 40;
        int v8 = 161;
        goto LABEL_6;
      case 0xD:
        unint64_t v4 = "ACMCredential - ACMCredentialDataPassphraseExtractable";
        rsize_t v5 = 164;
        char v6 = a1;
        unint64_t v7 = 164;
        int v8 = 132;
        goto LABEL_6;
      case 0x11:
        unint64_t v4 = "ACMCredential - ACMCredentialDataSecureIntent";
        rsize_t v5 = 113;
        char v6 = a1;
        unint64_t v7 = 113;
        int v8 = 165;
        goto LABEL_6;
      case 0x12:
        unint64_t v4 = "ACMCredential - ACMCredentialDataBiometryMatchAttempted";
        rsize_t v5 = 52;
        char v6 = a1;
        unint64_t v7 = 52;
        int v8 = 169;
        goto LABEL_6;
      case 0x14:
        unint64_t v4 = "ACMCredential - ACMCredentialDataAP";
        rsize_t v5 = 64;
        char v6 = a1;
        unint64_t v7 = 64;
        int v8 = 173;
        goto LABEL_6;
      case 0x15:
        unint64_t v4 = "ACMCredential - ACMCredentialDataSignature";
        rsize_t v5 = 164;
        char v6 = a1;
        unint64_t v7 = 164;
        int v8 = 177;
LABEL_6:
        acm_mem_free_info(v4, v6, v7, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", v8, "Util_DeallocCredential");
        acm_mem_free(a1, v5);
        uint64_t v2 = 0;
        unsigned int v3 = 10;
        break;
      default:
        break;
    }
  }
  else
  {
    uint64_t v2 = 4294967293;
    unsigned int v3 = 70;
  }
  if (v3 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "Util_DeallocCredential", (int)v2);
  }
  return v2;
}

uint64_t Util_AllocCredential(int a1, void *a2)
{
  if (!a2) {
    return 4294967293;
  }
  uint64_t result = 4294967293;
  switch(a1)
  {
    case 1:
      rsize_t v5 = acm_mem_alloc(0x3CuLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataPasscodeValidated", v5, 60, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 226, "Util_AllocCredential");
      int v6 = 28;
      goto LABEL_4;
    case 2:
      rsize_t v5 = acm_mem_alloc(0xA8uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataPassphraseEntered", v5, 168, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 216, "Util_AllocCredential");
      int v6 = 136;
      goto LABEL_4;
    case 3:
      rsize_t v5 = acm_mem_alloc(0x151uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataBiometryMatched", v5, 337, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 221, "Util_AllocCredential");
      int v6 = 305;
      goto LABEL_4;
    case 4:
    case 5:
    case 6:
    case 8:
    case 14:
    case 16:
    case 19:
    case 22:
    case 23:
      rsize_t v5 = acm_mem_alloc(0x20uLL);
      acm_mem_alloc_info("ACMCredential", v5, 32, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 280, "Util_AllocCredential");
      int v6 = 0;
      goto LABEL_4;
    case 7:
      rsize_t v5 = acm_mem_alloc(0x58uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataUserOutputDisplayed", v5, 88, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 236, "Util_AllocCredential");
      int v6 = 56;
      goto LABEL_4;
    case 9:
      rsize_t v5 = acm_mem_alloc(0x38uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataContinuityUnlock", v5, 56, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 241, "Util_AllocCredential");
      int v6 = 24;
      goto LABEL_4;
    case 10:
      rsize_t v5 = acm_mem_alloc(0x54uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataPasscodeValidated2", v5, 84, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 231, "Util_AllocCredential");
      int v6 = 52;
      goto LABEL_4;
    case 12:
    case 15:
      rsize_t v5 = acm_mem_alloc(0x28uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataKextDenyList", v5, 40, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 247, "Util_AllocCredential");
      int v6 = 8;
      goto LABEL_4;
    case 13:
      rsize_t v5 = acm_mem_alloc(0xA4uLL);
      unint64_t v7 = "ACMCredential - ACMCredentialDataPassphraseExtractable";
      int v8 = v5;
      int v9 = 211;
      goto LABEL_18;
    case 17:
      rsize_t v5 = acm_mem_alloc(0x71uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataSecureIntent", v5, 113, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 252, "Util_AllocCredential");
      int v6 = 81;
      goto LABEL_4;
    case 18:
      rsize_t v5 = acm_mem_alloc(0x34uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataBiometryMatchAttempted", v5, 52, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 257, "Util_AllocCredential");
      int v6 = 20;
      goto LABEL_4;
    case 20:
      rsize_t v5 = acm_mem_alloc(0x40uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataAP", v5, 64, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 262, "Util_AllocCredential");
      int v6 = 32;
      goto LABEL_4;
    case 21:
      rsize_t v5 = acm_mem_alloc(0xA4uLL);
      unint64_t v7 = "ACMCredential - ACMCredentialDataSignature";
      int v8 = v5;
      int v9 = 267;
LABEL_18:
      acm_mem_alloc_info(v7, v8, 164, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", v9, "Util_AllocCredential");
      int v6 = 132;
LABEL_4:
      if (v5)
      {
        uint64_t result = 0;
        _DWORD *v5 = a1;
        v5[1] = 1;
        v5[7] = v6;
        v5[3] = -1;
        *a2 = v5;
      }
      else
      {
        uint64_t result = 4294967292;
      }
      break;
    default:
      return result;
  }
  return result;
}

uint64_t Util_AllocRequirement(int a1, uint64_t a2, void *a3)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "Util_AllocRequirement");
  }
  if (a3)
  {
    uint64_t v6 = 4294967293;
    unsigned int v7 = 70;
    switch(a1)
    {
      case 1:
        int v8 = acm_mem_alloc(0x14uLL);
        unsigned int v11 = "ACMRequirement - ACMRequirementDataPasscodeValidated";
        uint64_t v12 = v8;
        int v13 = 338;
        goto LABEL_49;
      case 2:
        int v8 = acm_mem_alloc(0x14uLL);
        unsigned int v11 = "ACMRequirement - ACMRequirementDataPassphraseEntered";
        uint64_t v12 = v8;
        int v13 = 343;
        goto LABEL_49;
      case 3:
        int v8 = acm_mem_alloc(0xACuLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataBiometryMatched", v8, 172, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 348, "Util_AllocRequirement");
        int v9 = 156;
        if (!v8) {
          goto LABEL_50;
        }
        goto LABEL_6;
      case 4:
        if ((unint64_t)(a2 - 11) < 0xFFFFFFFFFFFFFFF6) {
          goto LABEL_53;
        }
        int v8 = acm_mem_alloc(0x64uLL);
        uint64_t v14 = "ACMRequirement - ACMRequirementDataOr";
        int v15 = v8;
        int v16 = 406;
        goto LABEL_28;
      case 5:
        if ((unint64_t)(a2 - 11) < 0xFFFFFFFFFFFFFFF6) {
          goto LABEL_53;
        }
        int v8 = acm_mem_alloc(0x64uLL);
        uint64_t v14 = "ACMRequirement - ACMRequirementDataAnd";
        int v15 = v8;
        int v16 = 398;
LABEL_28:
        acm_mem_alloc_info(v14, v15, 100, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", v16, "Util_AllocRequirement");
        int v9 = 84;
        if (!v8) {
          goto LABEL_50;
        }
        goto LABEL_6;
      case 6:
      case 9:
      case 10:
      case 11:
      case 12:
      case 14:
      case 15:
      case 18:
      case 19:
      case 22:
      case 23:
      case 27:
      case 28:
        int v8 = acm_mem_alloc(0x10uLL);
        acm_mem_alloc_info("ACMRequirement", v8, 16, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 333, "Util_AllocRequirement");
        int v9 = 0;
        if (v8) {
          goto LABEL_6;
        }
        goto LABEL_50;
      case 7:
        if ((unint64_t)(a2 - 11) < 0xFFFFFFFFFFFFFFF6) {
          goto LABEL_53;
        }
        int v8 = acm_mem_alloc(0x68uLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataKofN", v8, 104, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 391, "Util_AllocRequirement");
        int v9 = 88;
        if (!v8) {
          goto LABEL_50;
        }
        goto LABEL_6;
      case 8:
        int v8 = acm_mem_alloc(0x410uLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataAccessGroups", v8, 1040, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 378, "Util_AllocRequirement");
        int v9 = 1024;
        if (!v8) {
          goto LABEL_50;
        }
        goto LABEL_6;
      case 13:
        int v8 = acm_mem_alloc(0x30uLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataUserOutputDisplayed", v8, 48, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 363, "Util_AllocRequirement");
        int v9 = 32;
        if (!v8) {
          goto LABEL_50;
        }
        goto LABEL_6;
      case 16:
      case 17:
        break;
      case 20:
        int v8 = acm_mem_alloc(0x14uLL);
        unsigned int v11 = "ACMRequirement - ACMRequirementDataSecureIntent";
        uint64_t v12 = v8;
        int v13 = 353;
        goto LABEL_49;
      case 21:
        int v8 = acm_mem_alloc(0x14uLL);
        unsigned int v11 = "ACMRequirement - ACMRequirementDataBiometryMatchAttempted";
        uint64_t v12 = v8;
        int v13 = 358;
LABEL_49:
        acm_mem_alloc_info(v11, v12, 20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", v13, "Util_AllocRequirement");
        int v9 = 4;
        if (!v8) {
          goto LABEL_50;
        }
        goto LABEL_6;
      case 24:
        int v8 = acm_mem_alloc(0x434uLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataAP", v8, 1076, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 368, "Util_AllocRequirement");
        int v9 = 1060;
        if (!v8) {
          goto LABEL_50;
        }
        goto LABEL_6;
      case 25:
        int v8 = acm_mem_alloc(0x3BuLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataKeyRef", v8, 59, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 373, "Util_AllocRequirement");
        int v9 = 43;
        if (!v8) {
          goto LABEL_50;
        }
        goto LABEL_6;
      case 26:
        int v8 = acm_mem_alloc(0x2CuLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataRatchet", v8, 44, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 384, "Util_AllocRequirement");
        int v9 = 28;
        if (!v8)
        {
LABEL_50:
          uint64_t v6 = 4294967292;
          goto LABEL_54;
        }
LABEL_6:
        _DWORD *v8 = a1;
        *(void *)(v8 + 1) = 0x100000001;
        v8[3] = v9;
        if ((a1 & 0xFFFFFFFE) == 4)
        {
          v8[4] = a2;
        }
        else if (a1 == 1000)
        {
          v8[13] = a2;
        }
        else if (a1 == 7)
        {
          v8[5] = a2;
        }
        uint64_t v6 = 0;
        *a3 = v8;
        unsigned int v7 = 10;
        break;
      default:
        switch(a1)
        {
          case 1000:
            if ((unint64_t)(a2 - 11) < 0xFFFFFFFFFFFFFFF6) {
              goto LABEL_53;
            }
            int v8 = acm_mem_alloc(0x88uLL);
            acm_mem_alloc_info("ACMRequirement - ACMRequirementDataKofNWithAttributes", v8, 136, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 414, "Util_AllocRequirement");
            int v9 = 120;
            if (!v8) {
              goto LABEL_50;
            }
            goto LABEL_6;
          case 1001:
            int v8 = acm_mem_alloc(0xB8uLL);
            acm_mem_alloc_info("ACMRequirement - ACMRequirementDataBiometryMatchedWithAttributes", v8, 184, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 419, "Util_AllocRequirement");
            int v9 = 168;
            if (!v8) {
              goto LABEL_50;
            }
            goto LABEL_6;
          case 1002:
            int v8 = acm_mem_alloc(0x14uLL);
            unsigned int v11 = "ACMRequirement - ACMRequirementDataPushButtonWithAttributes";
            uint64_t v12 = v8;
            int v13 = 424;
            goto LABEL_49;
          case 1003:
            int v8 = acm_mem_alloc(0x14uLL);
            unsigned int v11 = "ACMRequirement - ACMRequirementDataSecureStateWithAttributes";
            uint64_t v12 = v8;
            int v13 = 429;
            goto LABEL_49;
          case 1004:
            int v8 = acm_mem_alloc(0x20uLL);
            acm_mem_alloc_info("ACMRequirement - ACMRequirementDataPasscodeValidatedWithAttributes", v8, 32, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 434, "Util_AllocRequirement");
            int v9 = 16;
            if (!v8) {
              goto LABEL_50;
            }
            goto LABEL_6;
          default:
            goto LABEL_17;
        }
    }
  }
  else
  {
LABEL_53:
    uint64_t v6 = 4294967293;
LABEL_54:
    unsigned int v7 = 70;
  }
LABEL_17:
  if (v7 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "Util_AllocRequirement", (int)v6);
  }
  return v6;
}

uint64_t Util_CreateRequirement(int a1, uint64_t a2)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "Util_CreateRequirement");
  }
  uint64_t v5 = 0;
  Util_AllocRequirement(a1, a2, &v5);
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: returning.\n", "ACM", "Util_CreateRequirement");
  }
  return v5;
}

uint64_t Util_DeallocRequirement(int *a1)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "Util_DeallocRequirement");
  }
  if (!a1)
  {
    uint64_t v7 = 4294967293;
    unsigned int v8 = 70;
    goto LABEL_28;
  }
  int v2 = *a1;
  if (*a1 > 6)
  {
    if (v2 == 7)
    {
      if (a1[5])
      {
        unint64_t v6 = 0;
        do
          Util_DeallocRequirement(*(void *)&a1[2 * v6++ + 6]);
        while (v6 < a1[5]);
      }
    }
    else
    {
      if (v2 != 1000) {
        goto LABEL_25;
      }
      if (a1[13])
      {
        unint64_t v4 = 0;
        do
          Util_DeallocRequirement(*(void *)&a1[2 * v4++ + 14]);
        while (v4 < a1[13]);
      }
    }
  }
  else if (v2 == 4)
  {
    if (a1[4])
    {
      unint64_t v5 = 0;
      do
        Util_DeallocRequirement(*(void *)&a1[2 * v5++ + 5]);
      while (v5 < a1[4]);
    }
  }
  else
  {
    if (v2 != 5) {
      goto LABEL_25;
    }
    if (a1[4])
    {
      unint64_t v3 = 0;
      do
        Util_DeallocRequirement(*(void *)&a1[2 * v3++ + 5]);
      while (v3 < a1[4]);
    }
  }
  int v2 = *a1;
LABEL_25:
  uint64_t v7 = 4294967293;
  unsigned int v8 = 70;
  switch(v2)
  {
    case 1:
      int v9 = "ACMRequirement - ACMRequirementDataPasscodeValidated";
      rsize_t v10 = 20;
      unsigned int v11 = a1;
      unint64_t v12 = 20;
      int v13 = 542;
      goto LABEL_27;
    case 2:
      int v9 = "ACMRequirement - ACMRequirementDataPassphraseEntered";
      rsize_t v10 = 20;
      unsigned int v11 = a1;
      unint64_t v12 = 20;
      int v13 = 546;
      goto LABEL_27;
    case 3:
      int v9 = "ACMRequirement - ACMRequirementDataBiometryMatched";
      rsize_t v10 = 172;
      unsigned int v11 = a1;
      unint64_t v12 = 172;
      int v13 = 550;
      goto LABEL_27;
    case 4:
      int v9 = "ACMRequirement - ACMRequirementDataOr";
      rsize_t v10 = 100;
      unsigned int v11 = a1;
      unint64_t v12 = 100;
      int v13 = 595;
      goto LABEL_27;
    case 5:
      int v9 = "ACMRequirement - ACMRequirementDataAnd";
      rsize_t v10 = 100;
      unsigned int v11 = a1;
      unint64_t v12 = 100;
      int v13 = 589;
      goto LABEL_27;
    case 6:
    case 9:
    case 10:
    case 11:
    case 12:
    case 14:
    case 15:
    case 18:
    case 19:
    case 22:
    case 23:
    case 27:
    case 28:
      int v9 = "ACMRequirement";
      rsize_t v10 = 16;
      unsigned int v11 = a1;
      unint64_t v12 = 16;
      int v13 = 538;
      goto LABEL_27;
    case 7:
      int v9 = "ACMRequirement - ACMRequirementDataKofN";
      rsize_t v10 = 104;
      unsigned int v11 = a1;
      unint64_t v12 = 104;
      int v13 = 584;
      goto LABEL_27;
    case 8:
      int v9 = "ACMRequirement - ACMRequirementDataAccessGroups";
      rsize_t v10 = 1040;
      unsigned int v11 = a1;
      unint64_t v12 = 1040;
      int v13 = 574;
      goto LABEL_27;
    case 13:
      int v9 = "ACMRequirement - ACMRequirementDataUserOutputDisplayed";
      rsize_t v10 = 48;
      unsigned int v11 = a1;
      unint64_t v12 = 48;
      int v13 = 562;
      goto LABEL_27;
    case 16:
    case 17:
      break;
    case 20:
      int v9 = "ACMRequirement - ACMRequirementDataSecureIntent";
      rsize_t v10 = 20;
      unsigned int v11 = a1;
      unint64_t v12 = 20;
      int v13 = 554;
      goto LABEL_27;
    case 21:
      int v9 = "ACMRequirement - ACMRequirementDataBiometryMatchAttempted";
      rsize_t v10 = 20;
      unsigned int v11 = a1;
      unint64_t v12 = 20;
      int v13 = 558;
      goto LABEL_27;
    case 24:
      int v9 = "ACMRequirement - ACMRequirementDataAP";
      rsize_t v10 = 1076;
      unsigned int v11 = a1;
      unint64_t v12 = 1076;
      int v13 = 566;
      goto LABEL_27;
    case 25:
      int v9 = "ACMRequirement - ACMRequirementDataKeyRef";
      rsize_t v10 = 59;
      unsigned int v11 = a1;
      unint64_t v12 = 59;
      int v13 = 570;
      goto LABEL_27;
    case 26:
      int v9 = "ACMRequirement - ACMRequirementDataRatchet";
      rsize_t v10 = 44;
      unsigned int v11 = a1;
      unint64_t v12 = 44;
      int v13 = 579;
LABEL_27:
      acm_mem_free_info(v9, v11, v12, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", v13, "Util_DeallocRequirement");
      acm_mem_free(a1, v10);
      uint64_t v7 = 0;
      unsigned int v8 = 10;
      break;
    default:
      switch(v2)
      {
        case 1000:
          int v9 = "ACMRequirement - ACMRequirementDataKofNWithAttributes";
          rsize_t v10 = 136;
          unsigned int v11 = a1;
          unint64_t v12 = 136;
          int v13 = 601;
          goto LABEL_27;
        case 1001:
          int v9 = "ACMRequirement - ACMRequirementDataBiometryMatchedWithAttributes";
          rsize_t v10 = 184;
          unsigned int v11 = a1;
          unint64_t v12 = 184;
          int v13 = 605;
          goto LABEL_27;
        case 1002:
          int v9 = "ACMRequirement - ACMRequirementDataPushButtonWithAttributes";
          rsize_t v10 = 20;
          unsigned int v11 = a1;
          unint64_t v12 = 20;
          int v13 = 609;
          goto LABEL_27;
        case 1003:
          int v9 = "ACMRequirement - ACMRequirementDataSecureStateWithAttributes";
          rsize_t v10 = 20;
          unsigned int v11 = a1;
          unint64_t v12 = 20;
          int v13 = 613;
          goto LABEL_27;
        case 1004:
          int v9 = "ACMRequirement - ACMRequirementDataPasscodeValidatedWithAttributes";
          rsize_t v10 = 32;
          unsigned int v11 = a1;
          unint64_t v12 = 32;
          int v13 = 617;
          goto LABEL_27;
        default:
          goto LABEL_28;
      }
  }
LABEL_28:
  if (v8 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "Util_DeallocRequirement", (int)v7);
  }
  return v7;
}

void Util_hexDumpToStrHelper_cold_1()
{
}

void Util_hexDumpToStrHelper_cold_2()
{
}

uint64_t ACMContextCreate(uint64_t *a1)
{
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    unsigned int v8 = "ACMLib";
    __int16 v9 = 2080;
    rsize_t v10 = "ACMContextCreate";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v6 = 0;
  uint64_t v2 = LibCall_ACMContextCreate((uint64_t (*)(uint64_t, uint64_t, void, void, void, unsigned char *, uint64_t *))ioKitTransport, (uint64_t)&v6, a1, &_logLevel, 1);
  if (v2)
  {
    updateLogLevelFromKext();
    unsigned int v3 = 70;
  }
  else
  {
    unsigned int v3 = 10;
    if (a1 && _logLevel <= 0x28u)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        uint64_t v4 = *a1;
        if (*a1) {
          LODWORD(v4) = *(_DWORD *)(v4 + 16);
        }
        *(_DWORD *)long long buf = 136315650;
        unsigned int v8 = "ACMLib";
        __int16 v9 = 2080;
        rsize_t v10 = "ACMContextCreate";
        __int16 v11 = 1024;
        LODWORD(v12) = v4;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: CS[%u] created.\n", buf, 0x1Cu);
      }
      unsigned int v3 = 10;
    }
  }
  if (v3 >= _logLevel && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    unsigned int v8 = "ACMLib";
    __int16 v9 = 2080;
    rsize_t v10 = "ACMContextCreate";
    __int16 v11 = 2048;
    uint64_t v12 = (int)v2;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v2;
}

uint64_t ioKitTransport(uint64_t *a1, int a2, char a3, const void *a4, size_t a5, void *a6, size_t *a7)
{
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315394;
    uint64_t v19 = "ACMLib";
    __int16 v20 = 2080;
    uint64_t v21 = "ioKitTransport";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v18, 0x16u);
  }
  if (a1)
  {
    uint64_t v14 = init();
    unsigned int v15 = 70;
    if (v14)
    {
      uint64_t v16 = v14;
    }
    else
    {
      uint64_t v16 = performCommand(*a1, a2, a3, a4, a5, a6, a7);
      if (v16) {
        unsigned int v15 = 70;
      }
      else {
        unsigned int v15 = 10;
      }
    }
  }
  else
  {
    unsigned int v15 = 70;
    uint64_t v16 = 4294967293;
  }
  if (v15 >= _logLevel && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315650;
    uint64_t v19 = "ACMLib";
    __int16 v20 = 2080;
    uint64_t v21 = "ioKitTransport";
    __int16 v22 = 2048;
    uint64_t v23 = (int)v16;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v18, 0x20u);
  }
  return v16;
}

_DWORD *ACMContextCreateWithExternalForm(_OWORD *a1, uint64_t a2)
{
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    rsize_t v10 = "ACMLib";
    __int16 v11 = 2080;
    uint64_t v12 = "ACMContextCreateWithExternalForm";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v8 = 0;
  uint64_t v4 = LibCall_ACMContextCreateWithExternalForm((uint64_t (*)(uint64_t, uint64_t, void, _OWORD *, uint64_t, void *, uint64_t *))ioKitTransport, (uint64_t)&v8, a1, a2, &_logLevel, 1);
  if (v4)
  {
    if (_logLevel <= 0x28u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      int v5 = v4[4];
      *(_DWORD *)long long buf = 136315650;
      rsize_t v10 = "ACMLib";
      __int16 v11 = 2080;
      uint64_t v12 = "ACMContextCreateWithExternalForm";
      __int16 v13 = 1024;
      LODWORD(v14) = v5;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: CS[%u] acquired.\n", buf, 0x1Cu);
    }
    unsigned int v6 = 30;
  }
  else
  {
    updateLogLevelFromKext();
    unsigned int v6 = 70;
  }
  if (v6 >= _logLevel && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    rsize_t v10 = "ACMLib";
    __int16 v11 = 2080;
    uint64_t v12 = "ACMContextCreateWithExternalForm";
    __int16 v13 = 2048;
    uint64_t v14 = v4;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, -> ctx = %p.\n", buf, 0x20u);
  }
  return v4;
}

uint64_t ACMContextDelete(_DWORD *a1, int a2)
{
  unsigned int v4 = _logLevel;
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    uint64_t v14 = "ACMContextDelete";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
    unsigned int v4 = _logLevel;
  }
  if (a1 && v4 <= 0x28 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v5 = a1[4];
    unsigned int v6 = "deleted";
    *(_DWORD *)long long buf = 136315906;
    uint64_t v12 = "ACMLib";
    uint64_t v14 = "ACMContextDelete";
    __int16 v13 = 2080;
    if (a2) {
      unsigned int v6 = "destroyed";
    }
    __int16 v15 = 1024;
    LODWORD(v16[0]) = v5;
    WORD2(v16[0]) = 2080;
    *(void *)((char *)v16 + 6) = v6;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: CS[%u] %s.\n", buf, 0x26u);
  }
  rsize_t v10 = a1;
  uint64_t v7 = LibCall_ACMContextDelete((void (*)(uint64_t, uint64_t, void, void *, uint64_t, void, void))ioKitTransport, (uint64_t)&v10, a1, a2);
  if (v7) {
    unsigned int v8 = 70;
  }
  else {
    unsigned int v8 = 10;
  }
  if (v8 >= _logLevel && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    uint64_t v14 = "ACMContextDelete";
    __int16 v15 = 2048;
    v16[0] = (int)v7;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v7;
}

void ACMContextGetExternalForm(const void *a1, uint64_t a2)
{
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    int v5 = "ACMLib";
    __int16 v6 = 2080;
    uint64_t v7 = "ACMContextGetExternalForm";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v4, 0x16u);
  }
  if (!a1 || !a2 || init() || performCommand((uint64_t)a1, 19, 0, a1, 0x10uLL, 0, 0)) {
    (*(void (**)(uint64_t, void, void))(a2 + 16))(a2, 0, 0);
  }
  else {
    (*(void (**)(uint64_t, const void *, uint64_t))(a2 + 16))(a2, a1, 16);
  }
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    int v5 = "ACMLib";
    __int16 v6 = 2080;
    uint64_t v7 = "ACMContextGetExternalForm";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning.\n", (uint8_t *)&v4, 0x16u);
  }
}

uint64_t init()
{
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    uint64_t v7 = "ACMLib";
    __int16 v8 = 2080;
    __int16 v9 = "init";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v6, 0x16u);
  }
  if (_initialized)
  {
    uint64_t v0 = 0;
  }
  else
  {
    CFDictionaryRef v1 = IOServiceMatching("AppleCredentialManager");
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v1);
    if (!MatchingService)
    {
      unsigned int v4 = 70;
      uint64_t v0 = 4294967291;
      goto LABEL_10;
    }
    io_object_t v3 = MatchingService;
    uint64_t v0 = IOServiceOpen(MatchingService, mach_task_self_, 0, (io_connect_t *)&_connect);
    if (v0)
    {
      unsigned int v4 = 70;
      goto LABEL_10;
    }
    IOObjectRelease(v3);
    _initialized = 1;
  }
  unsigned int v4 = 10;
LABEL_10:
  if (v4 >= _logLevel && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    uint64_t v7 = "ACMLib";
    __int16 v8 = 2080;
    __int16 v9 = "init";
    __int16 v10 = 2048;
    uint64_t v11 = (int)v0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v6, 0x20u);
  }
  return v0;
}

uint64_t performCommand(uint64_t a1, int a2, char a3, const void *a4, size_t a5, void *a6, size_t *a7)
{
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    size_t v25 = "ACMLib";
    __int16 v26 = 2080;
    int v27 = "performCommand";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  size_t inputStructCnt = 0;
  uint64_t v14 = LibCall_BuildCommand(a2, 0, a3, a4, a5, &inputStructCnt);
  if (v14)
  {
    __int16 v15 = v14;
    if (!a6 && a7)
    {
      uint64_t v18 = 4294967293;
    }
    else
    {
      if (a7) {
        size_t v16 = *a7;
      }
      else {
        size_t v16 = 0;
      }
      size_t v22 = v16;
      uint64_t v17 = IOConnectCallStructMethod(_connect, 0, v14, inputStructCnt, a6, &v22);
      uint64_t v18 = v17;
      if (a1) {
        LODWORD(a1) = *(_DWORD *)(a1 + 16);
      }
      if (v17)
      {
        if (_logLevel <= 0x46u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 136316418;
          size_t v25 = "ACMLib";
          __int16 v26 = 2080;
          int v27 = "performCommand";
          __int16 v28 = 1024;
          *(_DWORD *)unint64_t v29 = a2;
          *(_WORD *)&v29[4] = 1024;
          *(_DWORD *)&v29[6] = a1;
          __int16 v30 = 1024;
          int v31 = v18;
          __int16 v32 = 1024;
          int v33 = v18;
          _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: cmd(%u) on CS[%u] -> err 0x%x (%d).\n", buf, 0x2Eu);
        }
      }
      else
      {
        if (_logLevel <= 0x28u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 136315906;
          size_t v25 = "ACMLib";
          __int16 v26 = 2080;
          int v27 = "performCommand";
          __int16 v28 = 1024;
          *(_DWORD *)unint64_t v29 = a2;
          *(_WORD *)&v29[4] = 1024;
          *(_DWORD *)&v29[6] = a1;
          _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: cmd(%u) on CS[%u] -> ok.\n", buf, 0x22u);
        }
        uint64_t v18 = 0;
        if (a7) {
          *a7 = v22;
        }
      }
    }
    size_t v19 = inputStructCnt;
    acm_mem_free_info("<data>", v15, inputStructCnt, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 134, "performCommand");
    acm_mem_free_data(v15, v19);
    if (v18) {
      unsigned int v20 = 70;
    }
    else {
      unsigned int v20 = 10;
    }
  }
  else
  {
    unsigned int v20 = 70;
    uint64_t v18 = 4294967291;
  }
  if (v20 >= _logLevel && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    size_t v25 = "ACMLib";
    __int16 v26 = 2080;
    int v27 = "performCommand";
    __int16 v28 = 2048;
    *(void *)unint64_t v29 = (int)v18;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v18;
}

uint64_t ACMContextAddCredential(_OWORD *a1, unsigned int *a2)
{
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    int v6 = "ACMLib";
    __int16 v7 = 2080;
    __int16 v8 = "ACMContextAddCredential";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v5, 0x16u);
  }
  return ACMContextAddCredentialWithScope(a1, a2, 1);
}

uint64_t ACMContextAddCredentialWithScope(_OWORD *a1, unsigned int *a2, int a3)
{
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    uint64_t v18 = "ACMLib";
    __int16 v19 = 2080;
    unsigned int v20 = "ACMContextAddCredentialWithScope";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  size_t size = 0;
  if (a1) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = a3 == 2;
  }
  char v7 = !v6;
  unsigned int v8 = 70;
  uint64_t v9 = 4294967293;
  if (a2 && (v7 & 1) == 0)
  {
    uint64_t SerializedAddCredentialSize = init();
    if (SerializedAddCredentialSize
      || (uint64_t SerializedAddCredentialSize = GetSerializedAddCredentialSize((uint64_t)a1, a2, a3, &size),
          SerializedAddCredentialSize))
    {
      uint64_t v9 = SerializedAddCredentialSize;
      unsigned int v8 = 70;
    }
    else
    {
      size_t v11 = size;
      uint64_t v12 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v12, v11, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 325, "ACMContextAddCredentialWithScope");
      if (v12)
      {
        uint64_t v13 = SerializeAddCredential(a1, a2, a3, (uint64_t)v12, &size);
        if (!v13) {
          uint64_t v13 = performCommand((uint64_t)a1, 5, 0, v12, size, 0, 0);
        }
        uint64_t v9 = v13;
        size_t v14 = size;
        acm_mem_free_info("<data>", v12, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 338, "ACMContextAddCredentialWithScope");
        acm_mem_free_data(v12, v14);
        if (v9) {
          unsigned int v8 = 70;
        }
        else {
          unsigned int v8 = 10;
        }
      }
      else
      {
        unsigned int v8 = 70;
        uint64_t v9 = 4294967292;
      }
    }
  }
  if (v8 >= _logLevel && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    uint64_t v18 = "ACMLib";
    __int16 v19 = 2080;
    unsigned int v20 = "ACMContextAddCredentialWithScope";
    __int16 v21 = 2048;
    uint64_t v22 = (int)v9;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v9;
}

uint64_t ACMContextRemoveCredentialsByType(_OWORD *a1, int a2)
{
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    BOOL v6 = "ACMLib";
    __int16 v7 = 2080;
    unsigned int v8 = "ACMContextRemoveCredentialsByType";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v5, 0x16u);
  }
  return ACMContextRemoveCredentialsByTypeAndScope(a1, a2, 1);
}

uint64_t ACMContextRemoveCredentialsByTypeAndScope(_OWORD *a1, int a2, int a3)
{
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    size_t v14 = "ACMContextRemoveCredentialsByTypeAndScope";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v11, 0x16u);
  }
  if (a1 || a3 == 2)
  {
    uint64_t v6 = init();
    if (v6)
    {
      uint64_t v8 = v6;
      unsigned int v9 = 70;
    }
    else
    {
      __int16 v7 = acm_mem_alloc_data(0x18uLL);
      acm_mem_alloc_info("<data>", v7, 24, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 386, "ACMContextRemoveCredentialsByTypeAndScope");
      if (v7)
      {
        if (a1)
        {
          *__int16 v7 = *a1;
        }
        else
        {
          *(void *)__int16 v7 = 0;
          *((void *)v7 + 1) = 0;
        }
        *((_DWORD *)v7 + 4) = a2;
        *((_DWORD *)v7 + 5) = a3;
        uint64_t v8 = performCommand((uint64_t)a1, 9, 0, v7, 0x18uLL, 0, 0);
        acm_mem_free_info("<data>", v7, 0x18uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 407, "ACMContextRemoveCredentialsByTypeAndScope");
        acm_mem_free_data(v7, 0x18uLL);
        if (v8) {
          unsigned int v9 = 70;
        }
        else {
          unsigned int v9 = 10;
        }
      }
      else
      {
        unsigned int v9 = 70;
        uint64_t v8 = 4294967292;
      }
    }
  }
  else
  {
    unsigned int v9 = 70;
    uint64_t v8 = 4294967293;
  }
  if (v9 >= _logLevel && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315650;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    size_t v14 = "ACMContextRemoveCredentialsByTypeAndScope";
    __int16 v15 = 2048;
    uint64_t v16 = (int)v8;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v11, 0x20u);
  }
  return v8;
}

uint64_t ACMContextRemoveCredentialsByValue(uint64_t a1, _DWORD *a2)
{
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    uint64_t v6 = "ACMLib";
    __int16 v7 = 2080;
    uint64_t v8 = "ACMContextRemoveCredentialsByValue";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v5, 0x16u);
  }
  return ACMContextRemoveCredentialsByValueAndScope(a1, a2, 1);
}

uint64_t ACMContextRemoveCredentialsByValueAndScope(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    uint64_t v18 = "ACMLib";
    __int16 v19 = 2080;
    unsigned int v20 = "ACMContextRemoveCredentialsByValueAndScope";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  size_t size = 0;
  if (a1) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = a3 == 2;
  }
  char v7 = !v6;
  unsigned int v8 = 70;
  uint64_t v9 = 4294967293;
  if (a2 && (v7 & 1) == 0)
  {
    uint64_t v10 = init();
    if (v10 || (uint64_t v10 = GetSerializedRemoveCredentialSize(a1, a2, a3, &size), v10))
    {
      uint64_t v9 = v10;
      unsigned int v8 = 70;
    }
    else
    {
      size_t v11 = size;
      uint64_t v12 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v12, v11, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 457, "ACMContextRemoveCredentialsByValueAndScope");
      if (v12)
      {
        uint64_t v13 = SerializeRemoveCredential(a1, a2, a3, v12, &size);
        if (!v13) {
          uint64_t v13 = performCommand(a1, 6, 0, v12, size, 0, 0);
        }
        uint64_t v9 = v13;
        size_t v14 = size;
        acm_mem_free_info("<data>", v12, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 470, "ACMContextRemoveCredentialsByValueAndScope");
        acm_mem_free_data(v12, v14);
        if (v9) {
          unsigned int v8 = 70;
        }
        else {
          unsigned int v8 = 10;
        }
      }
      else
      {
        unsigned int v8 = 70;
        uint64_t v9 = 4294967292;
      }
    }
  }
  if (v8 >= _logLevel && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    uint64_t v18 = "ACMLib";
    __int16 v19 = 2080;
    unsigned int v20 = "ACMContextRemoveCredentialsByValueAndScope";
    __int16 v21 = 2048;
    uint64_t v22 = (int)v9;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v9;
}

uint64_t ACMContextContainsCredentialType(_OWORD *a1, int a2)
{
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    BOOL v6 = "ACMLib";
    __int16 v7 = 2080;
    unsigned int v8 = "ACMContextContainsCredentialType";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v5, 0x16u);
  }
  return ACMContextContainsCredentialTypeEx(a1, a2, 0);
}

uint64_t ACMContextContainsCredentialTypeEx(_OWORD *a1, int a2, int a3)
{
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    uint64_t v16 = "ACMLib";
    __int16 v17 = 2080;
    uint64_t v18 = "ACMContextContainsCredentialTypeEx";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  int v14 = 0;
  size_t v13 = 4;
  if (a1)
  {
    uint64_t v6 = init();
    if (v6)
    {
      uint64_t v11 = v6;
      unsigned int v8 = 70;
    }
    else
    {
      __int16 v7 = acm_mem_alloc_data(0x18uLL);
      acm_mem_alloc_info("<data>", v7, 24, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 576, "ACMContextContainsCredentialTypeEx");
      unsigned int v8 = 70;
      if (v7)
      {
        *(_OWORD *)__int16 v7 = *a1;
        v7[4] = a2;
        v7[5] = a3;
        unsigned int v9 = performCommand((uint64_t)a1, 4, 0, v7, 0x18uLL, &v14, &v13);
        if (v14) {
          unsigned int v10 = 0;
        }
        else {
          unsigned int v10 = -7;
        }
        if (v9) {
          uint64_t v11 = v9;
        }
        else {
          uint64_t v11 = v10;
        }
        acm_mem_free_info("<data>", v7, 0x18uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 590, "ACMContextContainsCredentialTypeEx");
        acm_mem_free_data(v7, 0x18uLL);
        if (v11) {
          unsigned int v8 = 70;
        }
        else {
          unsigned int v8 = 10;
        }
      }
      else
      {
        uint64_t v11 = 4294967292;
      }
    }
  }
  else
  {
    unsigned int v8 = 70;
    uint64_t v11 = 4294967293;
  }
  if (v8 >= _logLevel && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    uint64_t v16 = "ACMLib";
    __int16 v17 = 2080;
    uint64_t v18 = "ACMContextContainsCredentialTypeEx";
    __int16 v19 = 2048;
    uint64_t v20 = (int)v11;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v11;
}

uint64_t ACMGlobalContextAddCredential(unsigned int *a1)
{
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    unsigned int v8 = "ACMLib";
    __int16 v9 = 2080;
    unsigned int v10 = "ACMGlobalContextAddCredential";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v6 = 0;
  if (a1)
  {
    uint64_t v2 = ACMContextCreate((uint64_t *)&v6);
    if (!v2) {
      uint64_t v2 = ACMContextAddCredentialWithScope(v6, a1, 2);
    }
    uint64_t v3 = v2;
    if (v6) {
      ACMContextDelete(v6, 1);
    }
    if (v3) {
      unsigned int v4 = 70;
    }
    else {
      unsigned int v4 = 10;
    }
  }
  else
  {
    unsigned int v4 = 70;
    uint64_t v3 = 4294967293;
  }
  if (v4 >= _logLevel && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    unsigned int v8 = "ACMLib";
    __int16 v9 = 2080;
    unsigned int v10 = "ACMGlobalContextAddCredential";
    __int16 v11 = 2048;
    uint64_t v12 = (int)v3;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v3;
}

uint64_t ACMGlobalContextRemoveCredentialsByType(int a1)
{
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    unsigned int v8 = "ACMLib";
    __int16 v9 = 2080;
    unsigned int v10 = "ACMGlobalContextRemoveCredentialsByType";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v6 = 0;
  uint64_t v2 = ACMContextCreate((uint64_t *)&v6);
  if (!v2) {
    uint64_t v2 = ACMContextRemoveCredentialsByTypeAndScope(v6, a1, 2);
  }
  uint64_t v3 = v2;
  if (v6) {
    ACMContextDelete(v6, 1);
  }
  if (v3) {
    unsigned int v4 = 70;
  }
  else {
    unsigned int v4 = 10;
  }
  if (v4 >= _logLevel && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    unsigned int v8 = "ACMLib";
    __int16 v9 = 2080;
    unsigned int v10 = "ACMGlobalContextRemoveCredentialsByType";
    __int16 v11 = 2048;
    uint64_t v12 = (int)v3;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v3;
}

uint64_t ACMContextRemovePassphraseCredentialsByPurposeAndScope(_OWORD *a1, int a2, int a3)
{
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    int v14 = "ACMContextRemovePassphraseCredentialsByPurposeAndScope";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v11, 0x16u);
  }
  if (a1 || a3 == 2)
  {
    uint64_t v6 = init();
    if (v6)
    {
      uint64_t v8 = v6;
      unsigned int v9 = 70;
    }
    else
    {
      __int16 v7 = acm_mem_alloc_data(0x18uLL);
      acm_mem_alloc_info("<data>", v7, 24, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 492, "ACMContextRemovePassphraseCredentialsByPurposeAndScope");
      if (v7)
      {
        if (a1)
        {
          *__int16 v7 = *a1;
        }
        else
        {
          *(void *)__int16 v7 = 0;
          *((void *)v7 + 1) = 0;
        }
        *((_DWORD *)v7 + 4) = a2;
        *((_DWORD *)v7 + 5) = a3;
        uint64_t v8 = performCommand((uint64_t)a1, 16, 0, v7, 0x18uLL, 0, 0);
        acm_mem_free_info("<data>", v7, 0x18uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 513, "ACMContextRemovePassphraseCredentialsByPurposeAndScope");
        acm_mem_free_data(v7, 0x18uLL);
        if (v8) {
          unsigned int v9 = 70;
        }
        else {
          unsigned int v9 = 10;
        }
      }
      else
      {
        unsigned int v9 = 70;
        uint64_t v8 = 4294967292;
      }
    }
  }
  else
  {
    unsigned int v9 = 70;
    uint64_t v8 = 4294967293;
  }
  if (v9 >= _logLevel && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315650;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    int v14 = "ACMContextRemovePassphraseCredentialsByPurposeAndScope";
    __int16 v15 = 2048;
    uint64_t v16 = (int)v8;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v11, 0x20u);
  }
  return v8;
}

uint64_t ACMContextReplacePassphraseCredentialsWithScope(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    uint64_t v18 = "ACMLib";
    __int16 v19 = 2080;
    uint64_t v20 = "ACMContextReplacePassphraseCredentialsWithScope";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  size_t size = 0;
  if (a1) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = a3 == 2;
  }
  char v7 = !v6;
  unsigned int v8 = 70;
  uint64_t v9 = 4294967293;
  if (a2 && (v7 & 1) == 0)
  {
    uint64_t SerializedReplacePassphraseCredentialSize = init();
    if (SerializedReplacePassphraseCredentialSize
      || (uint64_t SerializedReplacePassphraseCredentialSize = GetSerializedReplacePassphraseCredentialSize(a1, a2, a3, &size),
          SerializedReplacePassphraseCredentialSize))
    {
      uint64_t v9 = SerializedReplacePassphraseCredentialSize;
      unsigned int v8 = 70;
    }
    else
    {
      size_t v11 = size;
      uint64_t v12 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v12, v11, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 538, "ACMContextReplacePassphraseCredentialsWithScope");
      if (v12)
      {
        uint64_t v13 = SerializeReplacePassphraseCredential(a1, a2, a3, v12, &size);
        if (!v13) {
          uint64_t v13 = performCommand(a1, 15, 0, v12, size, 0, 0);
        }
        uint64_t v9 = v13;
        bzero(v12, size);
        size_t v14 = size;
        acm_mem_free_info("<data>", v12, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 552, "ACMContextReplacePassphraseCredentialsWithScope");
        acm_mem_free_data(v12, v14);
        if (v9) {
          unsigned int v8 = 70;
        }
        else {
          unsigned int v8 = 10;
        }
      }
      else
      {
        unsigned int v8 = 70;
        uint64_t v9 = 4294967292;
      }
    }
  }
  if (v8 >= _logLevel && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    uint64_t v18 = "ACMLib";
    __int16 v19 = 2080;
    uint64_t v20 = "ACMContextReplacePassphraseCredentialsWithScope";
    __int16 v21 = 2048;
    uint64_t v22 = (int)v9;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v9;
}

uint64_t ACMContextContainsPassphraseCredentialWithPurpose(_OWORD *a1, int a2, int a3)
{
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    uint64_t v16 = "ACMLib";
    __int16 v17 = 2080;
    uint64_t v18 = "ACMContextContainsPassphraseCredentialWithPurpose";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  int v14 = 0;
  size_t v13 = 4;
  if (a1)
  {
    uint64_t v6 = init();
    if (v6)
    {
      uint64_t v11 = v6;
      unsigned int v8 = 70;
    }
    else
    {
      char v7 = acm_mem_alloc_data(0x18uLL);
      acm_mem_alloc_info("<data>", v7, 24, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 614, "ACMContextContainsPassphraseCredentialWithPurpose");
      unsigned int v8 = 70;
      if (v7)
      {
        *(_OWORD *)char v7 = *a1;
        v7[4] = a2;
        v7[5] = a3;
        unsigned int v9 = performCommand((uint64_t)a1, 13, 0, v7, 0x18uLL, &v14, &v13);
        if (v14) {
          unsigned int v10 = 0;
        }
        else {
          unsigned int v10 = -7;
        }
        if (v9) {
          uint64_t v11 = v9;
        }
        else {
          uint64_t v11 = v10;
        }
        acm_mem_free_info("<data>", v7, 0x18uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 628, "ACMContextContainsPassphraseCredentialWithPurpose");
        acm_mem_free_data(v7, 0x18uLL);
        if (v11) {
          unsigned int v8 = 70;
        }
        else {
          unsigned int v8 = 10;
        }
      }
      else
      {
        uint64_t v11 = 4294967292;
      }
    }
  }
  else
  {
    unsigned int v8 = 70;
    uint64_t v11 = 4294967293;
  }
  if (v8 >= _logLevel && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    uint64_t v16 = "ACMLib";
    __int16 v17 = 2080;
    uint64_t v18 = "ACMContextContainsPassphraseCredentialWithPurpose";
    __int16 v19 = 2048;
    uint64_t v20 = (int)v11;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v11;
}

uint64_t ACMContextVerifyPolicy(_OWORD *a1, char *a2, uint64_t a3)
{
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    uint64_t v11 = "ACMLib";
    __int16 v12 = 2080;
    size_t v13 = "ACMContextVerifyPolicy";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  unsigned int v9 = a1;
  uint64_t v6 = LibCall_ACMContextVerifyPolicy_Block((uint64_t (*)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *))ioKitTransport, (uint64_t)&v9, a1, a2, a3);
  if (v6) {
    unsigned int v7 = 70;
  }
  else {
    unsigned int v7 = 10;
  }
  if (v7 >= _logLevel && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    uint64_t v11 = "ACMLib";
    __int16 v12 = 2080;
    size_t v13 = "ACMContextVerifyPolicy";
    __int16 v14 = 2048;
    uint64_t v15 = (int)v6;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v6;
}

uint64_t ACMContextVerifyPolicyWithPreflight(_OWORD *a1, char *__s1, uint64_t a3, uint64_t a4)
{
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    size_t v13 = "ACMLib";
    __int16 v14 = 2080;
    uint64_t v15 = "ACMContextVerifyPolicyWithPreflight";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v11 = a1;
  uint64_t v8 = LibCall_ACMContextVerifyPolicyWithPreflight_Block((uint64_t (*)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *))ioKitTransport, (uint64_t)&v11, a1, __s1, a3, a4);
  if (v8) {
    unsigned int v9 = 70;
  }
  else {
    unsigned int v9 = 10;
  }
  if (v9 >= _logLevel && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    size_t v13 = "ACMLib";
    __int16 v14 = 2080;
    uint64_t v15 = "ACMContextVerifyPolicyWithPreflight";
    __int16 v16 = 2048;
    uint64_t v17 = (int)v8;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v8;
}

void ACMContextVerifyPolicyEx(_OWORD *a1, char *__s1, uint64_t a3, _DWORD *a4, unsigned int a5, uint64_t a6, uint64_t a7)
{
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    __int16 v16 = "ACMLib";
    __int16 v17 = 2080;
    uint64_t v18 = "ACMContextVerifyPolicyEx";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  __int16 v14 = a1;
  LibCall_ACMContextVerifyPolicyEx_Block((uint64_t (*)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *))ioKitTransport, (uint64_t)&v14, a1, __s1, a3, a4, a5, a6, a7);
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    __int16 v16 = "ACMLib";
    __int16 v17 = 2080;
    uint64_t v18 = "ACMContextVerifyPolicyEx";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }
}

void ACMGlobalContextVerifyPolicy(char *a1, uint64_t a2, _DWORD *a3, unsigned int a4, uint64_t a5)
{
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    size_t v13 = "ACMLib";
    __int16 v14 = 2080;
    uint64_t v15 = "ACMGlobalContextVerifyPolicy";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  *(void *)uint64_t v11 = 0;
  uint64_t v10 = ACMContextCreate((uint64_t *)v11);
  if (v10)
  {
    if (a5) {
      (*(void (**)(uint64_t, uint64_t, void, void))(a5 + 16))(a5, v10, 0, 0);
    }
  }
  else
  {
    ACMContextVerifyPolicyEx(*(_OWORD **)v11, a1, a2, a3, a4, 0xFFFFFFFFLL, a5);
  }
  if (*(void *)v11) {
    ACMContextDelete(*(_DWORD **)v11, 1);
  }
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    size_t v13 = "ACMLib";
    __int16 v14 = 2080;
    uint64_t v15 = "ACMGlobalContextVerifyPolicy";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }
}

uint64_t ACMContextVerifyAclConstraint(_OWORD *a1, const void *a2, uint64_t a3, unsigned __int8 a4, _DWORD *a5, unsigned int a6, unsigned int a7, uint64_t a8)
{
  unsigned int v9 = a1;
  return LibCall_ACMContextVerifyAclConstraint((uint64_t)ioKitTransport, (uint64_t)&v9, a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t ACMContextVerifyAclConstraintForOperation(_OWORD *a1, const void *a2, uint64_t a3, const void *a4, unsigned int a5, unsigned __int8 a6, _DWORD *a7, unsigned int a8, unsigned int a9, uint64_t a10)
{
  uint64_t v11 = a1;
  return LibCall_ACMContextVerifyAclConstraintForOperation((uint64_t)ioKitTransport, (uint64_t)&v11, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

uint64_t ACMContextGetTrackingNumber(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 16);
  }
  return result;
}

uint64_t ACMParseAclAndCopyConstraintCharacteristics(const void *a1, uint64_t a2, uint64_t a3)
{
  size_t __n = 4096;
  size_t size = 0;
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    uint64_t v22 = "ACMLib";
    __int16 v23 = 2080;
    BOOL v24 = "ACMParseAclAndCopyConstraintCharacteristics";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v6 = 4294967293;
  if (!a1 || !a2 || !a3) {
    goto LABEL_28;
  }
  uint64_t SerializedProcessAclSize = init();
  if (SerializedProcessAclSize
    || (uint64_t SerializedProcessAclSize = GetSerializedProcessAclSize(0, (uint64_t)a1, a2, 0, 0, 0, 0, 0, &size),
        SerializedProcessAclSize))
  {
    uint64_t v6 = SerializedProcessAclSize;
LABEL_28:
    (*(void (**)(uint64_t, uint64_t, void, uint64_t))(a3 + 16))(a3, v6, 0, 4096);
    goto LABEL_19;
  }
  size_t v8 = size;
  unsigned int v9 = acm_mem_alloc_data(size);
  acm_mem_alloc_info("<data>", v9, v8, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 744, "ACMParseAclAndCopyConstraintCharacteristics");
  if (!v9)
  {
    uint64_t v6 = 4294967292;
    goto LABEL_28;
  }
  uint64_t v10 = SerializeProcessAcl(0, a1, a2, 0, 0, 0, 0, 0, (uint64_t)v9, &size);
  if (v10)
  {
    uint64_t v6 = v10;
    __int16 v12 = 0;
    __int16 v14 = 0;
    size_t v11 = 4096;
    goto LABEL_15;
  }
  size_t v11 = 4096;
  __int16 v12 = acm_mem_alloc_data(0x1000uLL);
  acm_mem_alloc_info("<data>", v12, 4096, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 750, "ACMParseAclAndCopyConstraintCharacteristics");
  if (!v12)
  {
    __int16 v14 = 0;
LABEL_31:
    uint64_t v6 = 4294967292;
    goto LABEL_15;
  }
  uint64_t v13 = performCommand(0, 20, 0, v9, size, v12, &__n);
  size_t v11 = __n;
  if (v13)
  {
    uint64_t v6 = v13;
    __int16 v14 = 0;
    goto LABEL_15;
  }
  __int16 v14 = acm_mem_alloc_data(__n);
  acm_mem_alloc_info("<data>", v14, v11, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 756, "ACMParseAclAndCopyConstraintCharacteristics");
  size_t v11 = __n;
  if (!v14) {
    goto LABEL_31;
  }
  memcpy(v14, v12, __n);
  uint64_t v6 = 0;
  size_t v11 = __n;
LABEL_15:
  (*(void (**)(uint64_t, uint64_t, void *, size_t))(a3 + 16))(a3, v6, v14, v11);
  size_t v15 = size;
  acm_mem_free_info("<data>", v9, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 767, "ACMParseAclAndCopyConstraintCharacteristics");
  acm_mem_free_data(v9, v15);
  if (v12)
  {
    acm_mem_free_info("<data>", v12, 0x1000uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 770, "ACMParseAclAndCopyConstraintCharacteristics");
    acm_mem_free_data(v12, 0x1000uLL);
  }
  if (v14)
  {
    size_t v16 = __n;
    acm_mem_free_info("<data>", v14, __n, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 773, "ACMParseAclAndCopyConstraintCharacteristics");
    acm_mem_free_data(v14, v16);
  }
LABEL_19:
  if (v6) {
    unsigned int v17 = 70;
  }
  else {
    unsigned int v17 = 10;
  }
  if (v17 >= _logLevel && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    uint64_t v22 = "ACMLib";
    __int16 v23 = 2080;
    BOOL v24 = "ACMParseAclAndCopyConstraintCharacteristics";
    __int16 v25 = 2048;
    uint64_t v26 = (int)v6;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v6;
}

uint64_t ACMCredentialGetProperty(int *a1, int a2, uint64_t a3)
{
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    __int16 v12 = "ACMLib";
    __int16 v13 = 2080;
    __int16 v14 = "ACMCredentialGetProperty";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  unsigned int v6 = 70;
  uint64_t v7 = 4294967293;
  if (a1 && a3)
  {
    uint64_t v7 = LibCall_ACMCredentialGetPropertyData(a1, a2, &v10, &v9);
    if (v7)
    {
      unsigned int v6 = 70;
    }
    else
    {
      (*(void (**)(uint64_t, int *, uint64_t))(a3 + 16))(a3, v10, v9);
      unsigned int v6 = 10;
    }
  }
  if (v6 >= _logLevel && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    __int16 v12 = "ACMLib";
    __int16 v13 = 2080;
    __int16 v14 = "ACMCredentialGetProperty";
    __int16 v15 = 2048;
    uint64_t v16 = (int)v7;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v7;
}

void ACMRequirementGetSubrequirements(int *a1, uint64_t a2)
{
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    uint64_t v9 = "ACMLib";
    __int16 v10 = 2080;
    size_t v11 = "ACMRequirementGetSubrequirements";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v8, 0x16u);
  }
  if (a1 && a2)
  {
    int v4 = *a1;
    if (*a1 == 4)
    {
      if (a1[4])
      {
        unint64_t v6 = 0;
        do
          (*(void (**)(uint64_t, void))(a2 + 16))(a2, *(void *)&a1[2 * v6++ + 5]);
        while (v6 < a1[4]);
      }
    }
    else if (v4 == 5)
    {
      if (a1[4])
      {
        unint64_t v7 = 0;
        do
          (*(void (**)(uint64_t, void))(a2 + 16))(a2, *(void *)&a1[2 * v7++ + 5]);
        while (v7 < a1[4]);
      }
    }
    else if (v4 == 7 && a1[5])
    {
      unint64_t v5 = 0;
      do
        (*(void (**)(uint64_t, void))(a2 + 16))(a2, *(void *)&a1[2 * v5++ + 6]);
      while (v5 < a1[5]);
    }
  }
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    uint64_t v9 = "ACMLib";
    __int16 v10 = 2080;
    size_t v11 = "ACMRequirementGetSubrequirements";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning.\n", (uint8_t *)&v8, 0x16u);
  }
}

uint64_t ACMRequirementGetProperty(int *a1, int a2, uint64_t a3)
{
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    __int16 v12 = "ACMLib";
    __int16 v13 = 2080;
    __int16 v14 = "ACMRequirementGetProperty";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  unint64_t v9 = 0;
  __int16 v10 = 0;
  unsigned int v6 = 70;
  uint64_t v7 = 4294967293;
  if (a1 && a3)
  {
    uint64_t v7 = LibCall_ACMRequirementGetPropertyData(a1, a2, &v10, &v9);
    if (v7)
    {
      unsigned int v6 = 70;
    }
    else
    {
      (*(void (**)(uint64_t, int *, unint64_t))(a3 + 16))(a3, v10, v9);
      unsigned int v6 = 10;
    }
  }
  if (v6 >= _logLevel && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    __int16 v12 = "ACMLib";
    __int16 v13 = 2080;
    __int16 v14 = "ACMRequirementGetProperty";
    __int16 v15 = 2048;
    uint64_t v16 = (int)v7;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v7;
}

uint64_t ACMRequirementGetProperties(int *a1, uint64_t a2)
{
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    unint64_t v9 = "ACMLib";
    __int16 v10 = 2080;
    size_t v11 = "ACMRequirementGetProperties";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v4 = 4294967293;
  unsigned int v5 = 70;
  if (a1 && a2)
  {
    (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 1, a1, 4);
    (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 2, a1 + 1, 4);
    (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 3, a1 + 2, 4);
    uint64_t v4 = 0;
    int v6 = *a1;
    unsigned int v5 = 10;
    switch(*a1)
    {
      case 1:
        goto LABEL_10;
      case 2:
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 200, a1 + 4, 4);
        goto LABEL_13;
      case 3:
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 100, a1 + 4, 4);
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 300, a1 + 5, 8);
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 302, a1 + 9, 8);
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 301, a1 + 13, 8);
        goto LABEL_13;
      case 4:
      case 5:
      case 6:
        break;
      case 7:
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 700, a1 + 4, 4);
        goto LABEL_13;
      default:
        if (v6 != 20 && v6 != 21) {
          break;
        }
LABEL_10:
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 100, a1 + 4, 4);
LABEL_13:
        uint64_t v4 = 0;
        unsigned int v5 = 10;
        break;
    }
  }
  if (v5 >= _logLevel && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315650;
    unint64_t v9 = "ACMLib";
    __int16 v10 = 2080;
    size_t v11 = "ACMRequirementGetProperties";
    __int16 v12 = 2048;
    uint64_t v13 = (int)v4;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v8, 0x20u);
  }
  return v4;
}

void ACMGetAclAuthMethod(__n128 *a1, uint64_t a2)
{
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    int v6 = "ACMLib";
    __int16 v7 = 2080;
    int v8 = "ACMGetAclAuthMethod";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v4 = a1;
  LibCall_ACMGetAclAuthMethod_Block((uint64_t)ioKitTransport, (uint64_t)&v4, a1, a2);
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    int v6 = "ACMLib";
    __int16 v7 = 2080;
    int v8 = "ACMGetAclAuthMethod";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }
}

uint64_t ACMSetEnvironmentVariable(int a1, const void *a2, size_t a3)
{
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    size_t v11 = "ACMLib";
    __int16 v12 = 2080;
    uint64_t v13 = "ACMSetEnvironmentVariable";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v9 = 0;
  uint64_t v6 = LibCall_ACMSetEnvironmentVariable((uint64_t (*)(uint64_t, uint64_t, void, char *, size_t, void, void))ioKitTransport, (uint64_t)&v9, a1, 0, 0, 0, a2, a3);
  if (v6) {
    unsigned int v7 = 70;
  }
  else {
    unsigned int v7 = 10;
  }
  if (v7 >= _logLevel && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315906;
    size_t v11 = "ACMLib";
    __int16 v12 = 2080;
    uint64_t v13 = "ACMSetEnvironmentVariable";
    __int16 v14 = 2048;
    uint64_t v15 = (int)v6;
    __int16 v16 = 1024;
    int v17 = a1;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld, var=%u.\n", buf, 0x26u);
  }
  return v6;
}

uint64_t ACMSetEnvironmentVariableWithAccessPolicy(int a1, _OWORD *a2, _OWORD *a3, uint64_t a4, const void *a5, size_t a6)
{
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    int v17 = "ACMLib";
    __int16 v18 = 2080;
    __int16 v19 = "ACMSetEnvironmentVariableWithAccessPolicy";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v15 = 0;
  uint64_t v12 = LibCall_ACMSetEnvironmentVariable((uint64_t (*)(uint64_t, uint64_t, void, char *, size_t, void, void))ioKitTransport, (uint64_t)&v15, a1, a2, a3, a4, a5, a6);
  if (v12) {
    unsigned int v13 = 70;
  }
  else {
    unsigned int v13 = 10;
  }
  if (v13 >= _logLevel && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315906;
    int v17 = "ACMLib";
    __int16 v18 = 2080;
    __int16 v19 = "ACMSetEnvironmentVariableWithAccessPolicy";
    __int16 v20 = 2048;
    uint64_t v21 = (int)v12;
    __int16 v22 = 1024;
    int v23 = a1;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld, var=%u.\n", buf, 0x26u);
  }
  return v12;
}

uint64_t ACMGetEnvironmentVariable(int a1, uint64_t a2)
{
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    uint64_t v9 = "ACMLib";
    __int16 v10 = 2080;
    size_t v11 = "ACMGetEnvironmentVariable";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v7 = 0;
  uint64_t v4 = LibCall_ACMGetEnvironmentVariable_Block((uint64_t (*)(uint64_t, uint64_t, void, int *, uint64_t, uint64_t, uint64_t))ioKitTransport, (uint64_t)&v7, a1, a2);
  if (v4) {
    unsigned int v5 = 70;
  }
  else {
    unsigned int v5 = 10;
  }
  if (v5 >= _logLevel && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315906;
    uint64_t v9 = "ACMLib";
    __int16 v10 = 2080;
    size_t v11 = "ACMGetEnvironmentVariable";
    __int16 v12 = 2048;
    uint64_t v13 = (int)v4;
    __int16 v14 = 1024;
    int v15 = a1;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld, var=%u.\n", buf, 0x26u);
  }
  return v4;
}

uint64_t ACMKernelControl(int a1)
{
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    uint64_t v6 = "ACMLib";
    __int16 v7 = 2080;
    int v8 = "ACMKernelControl";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v2 = LibCall_ACMKernelControl_Block();
  if (v2) {
    unsigned int v3 = 70;
  }
  else {
    unsigned int v3 = 10;
  }
  if (v3 >= _logLevel && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315906;
    uint64_t v6 = "ACMLib";
    __int16 v7 = 2080;
    int v8 = "ACMKernelControl";
    __int16 v9 = 2048;
    uint64_t v10 = (int)v2;
    __int16 v11 = 1024;
    int v12 = a1;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld, code=%u.\n", buf, 0x26u);
  }
  return v2;
}

uint64_t ACMSEPControl(const void *a1, size_t a2, uint64_t a3)
{
  uint64_t v4 = 0;
  return LibCall_ACMSEPControl_Block((uint64_t (*)(uint64_t, uint64_t, void, char *, uint64_t, unsigned int *, unint64_t *))ioKitTransport, (uint64_t)&v4, a1, a2, 0, 0, 0, a3);
}

uint64_t ACMSEPControlEx(uint64_t a1, _DWORD *a2, unsigned int a3, const void *a4, size_t a5, uint64_t a6)
{
  uint64_t v7 = 0;
  return LibCall_ACMSEPControl_Block((uint64_t (*)(uint64_t, uint64_t, void, char *, uint64_t, unsigned int *, unint64_t *))ioKitTransport, (uint64_t)&v7, a4, a5, a1, a2, a3, a6);
}

void ACMGlobalContextCredentialGetProperty(int a1, int a2, uint64_t a3)
{
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    int v8 = "ACMLib";
    __int16 v9 = 2080;
    uint64_t v10 = "ACMGlobalContextCredentialGetProperty";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v6 = 0;
  LibCall_ACMGlobalContextCredentialGetProperty_Block((uint64_t)ioKitTransport, (uint64_t)&v6, a1, a2, a3);
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    int v8 = "ACMLib";
    __int16 v9 = 2080;
    uint64_t v10 = "ACMGlobalContextCredentialGetProperty";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }
}

void ACMContextCredentialGetProperty(__n128 *a1, unsigned __int32 a2, unsigned __int32 a3, uint64_t a4)
{
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    __int16 v16 = "ACMLib";
    __int16 v17 = 2080;
    __int16 v18 = "ACMContextCredentialGetProperty";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v10 = 256;
  if (a4)
  {
    __int16 v9 = a1;
    uint64_t v8 = LibCall_ACMContextCredentialGetProperty((uint64_t (*)(uint64_t, uint64_t, void, __n128 *, uint64_t, uint64_t, uint64_t, __n128))ioKitTransport, (uint64_t)&v9, a1, a2, a3, (uint64_t)buf, (uint64_t)&v10);
    (*(void (**)(uint64_t, uint64_t, uint8_t *, uint64_t))(a4 + 16))(a4, v8, buf, v10);
  }
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int16 v11 = 136315394;
    int v12 = "ACMLib";
    __int16 v13 = 2080;
    __int16 v14 = "ACMContextCredentialGetProperty";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning.\n", v11, 0x16u);
  }
}

uint64_t ACMContextSetData(_OWORD *a1, int a2, const void *a3, size_t a4)
{
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    int v12 = "ACMLib";
    __int16 v13 = 2080;
    __int16 v14 = "ACMContextSetData";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v8 = ACMContextSetDataEx(a1, a2, 0, 0, a3, a4);
  if (v8) {
    unsigned int v9 = 70;
  }
  else {
    unsigned int v9 = 10;
  }
  if (v9 >= _logLevel && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315650;
    int v12 = "ACMLib";
    __int16 v13 = 2080;
    __int16 v14 = "ACMContextSetData";
    __int16 v15 = 2048;
    uint64_t v16 = (int)v8;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v11, 0x20u);
  }
  return v8;
}

uint64_t ACMContextSetDataEx(_OWORD *a1, int a2, _DWORD *a3, unsigned int a4, const void *a5, size_t a6)
{
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    __int16 v17 = "ACMLib";
    __int16 v18 = 2080;
    __int16 v19 = "ACMContextSetDataEx";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  __int16 v15 = a1;
  uint64_t v12 = LibCall_ACMContextSetData((uint64_t (*)(uint64_t, uint64_t, void, void *, size_t, void, void))ioKitTransport, (uint64_t)&v15, a1, a2, a3, a4, a5, a6);
  if (v12) {
    unsigned int v13 = 70;
  }
  else {
    unsigned int v13 = 10;
  }
  if (v13 >= _logLevel && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    __int16 v17 = "ACMLib";
    __int16 v18 = 2080;
    __int16 v19 = "ACMContextSetDataEx";
    __int16 v20 = 2048;
    uint64_t v21 = (int)v12;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v12;
}

uint64_t ACMContextGetData(_OWORD *a1, int a2, uint64_t a3)
{
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    uint64_t v10 = "ACMLib";
    __int16 v11 = 2080;
    uint64_t v12 = "ACMContextGetData";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v9, 0x16u);
  }
  uint64_t Data = ACMContextGetDataEx(a1, a2, 0, 0, a3);
  if (Data) {
    unsigned int v7 = 70;
  }
  else {
    unsigned int v7 = 10;
  }
  if (v7 >= _logLevel && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315650;
    uint64_t v10 = "ACMLib";
    __int16 v11 = 2080;
    uint64_t v12 = "ACMContextGetData";
    __int16 v13 = 2048;
    uint64_t v14 = (int)Data;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v9, 0x20u);
  }
  return Data;
}

uint64_t ACMContextGetDataEx(_OWORD *a1, int a2, _DWORD *a3, unsigned int a4, uint64_t a5)
{
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int size_4 = 136315394;
    BOOL v24 = "ACMLib";
    __int16 v25 = 2080;
    uint64_t v26 = "ACMContextGetDataEx";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&size_4, 0x16u);
  }
  unsigned int size = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 4;
  __int16 v19 = a1;
  uint64_t v10 = LibCall_ACMContextGetData((uint64_t (*)(uint64_t, uint64_t, void, void *, size_t, uint64_t, uint64_t))ioKitTransport, (uint64_t)&v19, a1, a2, 1, a3, a4, (uint64_t)&size, (uint64_t)&v21);
  if (!v10)
  {
    uint64_t v11 = size;
    if (size)
    {
      uint64_t v12 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v12, v11, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 1199, "ACMContextGetDataEx");
      if (!v12)
      {
        unsigned int v16 = 70;
        uint64_t v14 = 4294967292;
        goto LABEL_15;
      }
      uint64_t v20 = size;
      __int16 v18 = a1;
      uint64_t v13 = LibCall_ACMContextGetData((uint64_t (*)(uint64_t, uint64_t, void, void *, size_t, uint64_t, uint64_t))ioKitTransport, (uint64_t)&v18, a1, a2, 0, a3, a4, (uint64_t)v12, (uint64_t)&v20);
      uint64_t v14 = v13;
      if (a5 && !v13) {
        (*(void (**)(uint64_t, void *, uint64_t))(a5 + 16))(a5, v12, v20);
      }
      rsize_t v15 = size;
      acm_mem_free_info("<data>", v12, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 1213, "ACMContextGetDataEx");
      acm_mem_free_data(v12, v15);
      if (v14) {
        goto LABEL_11;
      }
    }
    else if (a5)
    {
      (*(void (**)(uint64_t, void, void))(a5 + 16))(a5, 0, 0);
    }
    uint64_t v14 = 0;
    unsigned int v16 = 10;
    goto LABEL_15;
  }
  uint64_t v14 = v10;
LABEL_11:
  unsigned int v16 = 70;
LABEL_15:
  if (v16 >= _logLevel && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int size_4 = 136315650;
    BOOL v24 = "ACMLib";
    __int16 v25 = 2080;
    uint64_t v26 = "ACMContextGetDataEx";
    __int16 v27 = 2048;
    uint64_t v28 = (int)v14;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&size_4, 0x20u);
  }
  return v14;
}

uint64_t ACMContextGetDataProperty(_OWORD *a1, unsigned __int16 a2, unsigned __int16 a3, uint64_t a4)
{
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    uint64_t v14 = "ACMContextGetDataProperty";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v11, 0x16u);
  }
  uint64_t Data = ACMContextGetData(a1, a2 | (a3 << 16), a4);
  if (Data) {
    unsigned int v9 = 70;
  }
  else {
    unsigned int v9 = 10;
  }
  if (v9 >= _logLevel && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315650;
    uint64_t v12 = "ACMLib";
    __int16 v13 = 2080;
    uint64_t v14 = "ACMContextGetDataProperty";
    __int16 v15 = 2048;
    uint64_t v16 = (int)Data;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v11, 0x20u);
  }
  return Data;
}

uint64_t ACMContextGetInfo(long long *a1, int a2, void *a3)
{
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    int v11 = "ACMLib";
    __int16 v12 = 2080;
    __int16 v13 = "ACMContextGetInfo";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  unsigned int v9 = a1;
  uint64_t v6 = LibCall_ACMContextGetInfo((uint64_t (*)(uint64_t, uint64_t, void, int *, uint64_t, _OWORD *, unint64_t *))ioKitTransport, (uint64_t)&v9, a1, a2, a3);
  if (v6) {
    unsigned int v7 = 70;
  }
  else {
    unsigned int v7 = 10;
  }
  if (v7 >= _logLevel && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    int v11 = "ACMLib";
    __int16 v12 = 2080;
    __int16 v13 = "ACMContextGetInfo";
    __int16 v14 = 2048;
    uint64_t v15 = (int)v6;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v6;
}

uint64_t ACMPing()
{
  uint64_t v1 = 0;
  return LibCall_ACMPing((uint64_t (*)(uint64_t, uint64_t, void, void, void, void, void))ioKitTransport, (uint64_t)&v1, 29);
}

void updateLogLevelFromKext()
{
  if (_logLevel <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    unsigned int v5 = "ACMLib";
    __int16 v6 = 2080;
    unsigned int v7 = "updateLogLevelFromKext";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  if (IOConnectCallScalarMethod(_connect, 2u, 0, 0, &output, &outputCnt)) {
    goto LABEL_8;
  }
  unsigned __int8 v0 = output;
  unsigned int v1 = output;
  _logLevel = output;
  if (output <= 0x1EuLL && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    unsigned int v5 = "ACMLib";
    __int16 v6 = 2080;
    unsigned int v7 = "updateLogLevelFromKext";
    __int16 v8 = 1024;
    int v9 = v0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: log level set to %d.\n", buf, 0x1Cu);
LABEL_8:
    unsigned int v1 = _logLevel;
  }
  if (v1 <= 0xA && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    unsigned int v5 = "ACMLib";
    __int16 v6 = 2080;
    unsigned int v7 = "updateLogLevelFromKext";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }
}

unsigned char *LibCall_BuildCommand(char a1, char a2, char a3, const void *a4, size_t a5, void *a6)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_BuildCommand");
  }
  __int16 v12 = 0;
  if (a5) {
    BOOL v13 = a4 == 0;
  }
  else {
    BOOL v13 = 0;
  }
  if (!v13 && a6)
  {
    if (a5 >= 0xFFFFFFFFFFFFFFF8)
    {
      __int16 v12 = 0;
    }
    else
    {
      __int16 v12 = acm_mem_alloc_data(a5 + 8);
      acm_mem_alloc_info("<data>", v12, a5 + 8, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 22, "LibCall_BuildCommand");
      if (v12)
      {
        *a6 = a5 + 8;
        *(_DWORD *)__int16 v12 = 1396920900;
        v12[4] = a1;
        v12[5] = a2;
        v12[6] = a3;
        if (a5) {
          memcpy(v12 + 8, a4, a5);
        }
      }
    }
  }
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: returning.\n", "ACM", "LibCall_BuildCommand");
  }
  return v12;
}

uint64_t LibCall_ACMContextCreate(uint64_t (*a1)(uint64_t, uint64_t, void, void, void, unsigned char *, uint64_t *), uint64_t a2, void *a3, unsigned char *a4, int a5)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextCreate");
  }
  unsigned int v10 = 70;
  uint64_t v11 = 4294967293;
  if (!a1 || !a3) {
    goto LABEL_25;
  }
  __int16 v12 = acm_mem_alloc(0x14uLL);
  acm_mem_alloc_info("ACMHandleWithPayload", v12, 20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 50, "LibCall_ACMContextCreate");
  if (!v12)
  {
    unsigned int v10 = 70;
    uint64_t v11 = 4294967292;
    goto LABEL_25;
  }
  memset(v19, 0, sizeof(v19));
  if (a5)
  {
    uint64_t v18 = 21;
    uint64_t v13 = a1(a2, 36, 0, 0, 0, v19, &v18);
    if (!v13)
    {
      if (v18 != 21)
      {
        uint64_t v11 = 4294967291;
        goto LABEL_23;
      }
      uint64_t v11 = 0;
      goto LABEL_20;
    }
    uint64_t v11 = v13;
    if (v13 != -3)
    {
LABEL_23:
      acm_mem_free_info("ACMHandleWithPayload", v12, 0x14uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 89, "LibCall_ACMContextCreate");
      acm_mem_free(v12, 0x14uLL);
      unsigned int v10 = 70;
      goto LABEL_25;
    }
  }
  uint64_t v18 = 17;
  unsigned int v14 = a1(a2, 1, 0, 0, 0, v19, &v18);
  if (v18 == 17) {
    unsigned int v15 = 0;
  }
  else {
    unsigned int v15 = -5;
  }
  if (v14) {
    uint64_t v11 = v14;
  }
  else {
    uint64_t v11 = v15;
  }
  if (!v14 && v18 == 17)
  {
LABEL_20:
    int v16 = *(_DWORD *)&v19[17];
    *(_OWORD *)__int16 v12 = *(_OWORD *)v19;
    v12[4] = v16;
    *a3 = v12;
    if (a4) {
      *a4 = v19[16];
    }
  }
  if (v11) {
    goto LABEL_23;
  }
  unsigned int v10 = 10;
LABEL_25:
  if (v10 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextCreate", (int)v11);
  }
  return v11;
}

_DWORD *LibCall_ACMContextCreateWithExternalForm(uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, uint64_t, void *, uint64_t *), uint64_t a2, _OWORD *a3, uint64_t a4, unsigned char *a5, int a6)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextCreateWithExternalForm");
  }
  __int16 v12 = 0;
  unsigned int v13 = 70;
  int v14 = -3;
  if (a1 && a3 && a4 == 16)
  {
    memset(v21, 0, 9);
    if (a6)
    {
      uint64_t v20 = 9;
      int v15 = a1(a2, 37, 0, a3, 16, v21, &v20);
      if (!v15)
      {
        if (v20 == 9)
        {
          int v14 = 0;
          goto LABEL_19;
        }
        int v14 = -5;
        goto LABEL_28;
      }
      int v14 = v15;
      if (v15 != -3) {
        goto LABEL_28;
      }
    }
    uint64_t v20 = 5;
    int v16 = a1(a2, 18, 0, a3, 16, v21, &v20);
    if (v20 == 5) {
      int v17 = 0;
    }
    else {
      int v17 = -5;
    }
    if (v16) {
      int v14 = v16;
    }
    else {
      int v14 = v17;
    }
    if (!v16 && v20 == 5)
    {
LABEL_19:
      if (LODWORD(v21[0]))
      {
        __int16 v12 = acm_mem_alloc(0x14uLL);
        acm_mem_alloc_info("ACMHandleWithPayload", v12, 20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 128, "LibCall_ACMContextCreateWithExternalForm");
        if (!v12)
        {
          unsigned int v13 = 70;
          int v14 = -4;
          goto LABEL_31;
        }
        int v18 = *(_DWORD *)((char *)v21 + 5);
        *(_OWORD *)__int16 v12 = *a3;
        v12[4] = v18;
        if (a5) {
          *a5 = BYTE4(v21[0]);
        }
        if (v14)
        {
          acm_mem_free_info("ACMHandleWithPayload", v12, 0x14uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 147, "LibCall_ACMContextCreateWithExternalForm");
          acm_mem_free(v12, 0x14uLL);
LABEL_29:
          unsigned int v13 = 70;
          goto LABEL_31;
        }
      }
      else
      {
        __int16 v12 = 0;
      }
      goto LABEL_30;
    }
LABEL_28:
    __int16 v12 = 0;
    if (v14) {
      goto LABEL_29;
    }
LABEL_30:
    int v14 = 0;
    unsigned int v13 = 10;
  }
LABEL_31:
  if (v13 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextCreateWithExternalForm", v14);
  }
  return v12;
}

uint64_t LibCall_ACMContextDelete(void (*a1)(uint64_t, uint64_t, void, void *, uint64_t, void, void), uint64_t a2, void *a3, int a4)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextDelete");
  }
  if (a1 && a3)
  {
    if (a4) {
      a1(a2, 2, 0, a3, 16, 0, 0);
    }
    goto LABEL_7;
  }
  if (a3)
  {
LABEL_7:
    acm_mem_free_info("ACMHandleWithPayload", a3, 0x14uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 172, "LibCall_ACMContextDelete");
    acm_mem_free(a3, 0x14uLL);
    uint64_t v8 = 0;
    unsigned int v9 = 10;
    goto LABEL_8;
  }
  unsigned int v9 = 70;
  uint64_t v8 = 4294967293;
LABEL_8:
  if (v9 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextDelete", (int)v8);
  }
  return v8;
}

uint64_t LibCall_ACMContexAddCredentialWithScope(uint64_t (*a1)(uint64_t, uint64_t, void, void *, size_t, void, void), uint64_t a2, _OWORD *a3, unsigned int *a4, int a5)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContexAddCredentialWithScope");
  }
  size_t size = 0;
  if (a3) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = a5 == 2;
  }
  char v11 = !v10;
  unsigned int v12 = 70;
  uint64_t v13 = 4294967293;
  if (a4 && (v11 & 1) == 0)
  {
    uint64_t SerializedAddCredentialSize = GetSerializedAddCredentialSize((uint64_t)a3, a4, a5, &size);
    if (SerializedAddCredentialSize)
    {
      uint64_t v13 = SerializedAddCredentialSize;
      unsigned int v12 = 70;
    }
    else
    {
      size_t v15 = size;
      int v16 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v16, v15, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 192, "LibCall_ACMContexAddCredentialWithScope");
      if (v16)
      {
        uint64_t v17 = SerializeAddCredential(a3, a4, a5, (uint64_t)v16, &size);
        if (!v17) {
          uint64_t v17 = a1(a2, 5, 0, v16, size, 0, 0);
        }
        uint64_t v13 = v17;
        size_t v18 = size;
        acm_mem_free_info("<data>", v16, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 203, "LibCall_ACMContexAddCredentialWithScope");
        acm_mem_free_data(v16, v18);
        if (v13) {
          unsigned int v12 = 70;
        }
        else {
          unsigned int v12 = 10;
        }
      }
      else
      {
        unsigned int v12 = 70;
        uint64_t v13 = 4294967292;
      }
    }
  }
  if (v12 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContexAddCredentialWithScope", (int)v13);
  }
  return v13;
}

uint64_t LibCall_ACMContexRemoveCredentialsByTypeAndScope(uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, uint64_t, void, void), uint64_t a2, _OWORD *a3, int a4, int a5)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContexRemoveCredentialsByTypeAndScope");
  }
  if (a3 || a5 == 2)
  {
    BOOL v10 = acm_mem_alloc_data(0x18uLL);
    acm_mem_alloc_info("<data>", v10, 24, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 217, "LibCall_ACMContexRemoveCredentialsByTypeAndScope");
    if (v10)
    {
      if (a3)
      {
        *BOOL v10 = *a3;
      }
      else
      {
        *(void *)BOOL v10 = 0;
        *((void *)v10 + 1) = 0;
      }
      *((_DWORD *)v10 + 4) = a4;
      *((_DWORD *)v10 + 5) = a5;
      uint64_t v11 = a1(a2, 9, 0, v10, 24, 0, 0);
      acm_mem_free_info("<data>", v10, 0x18uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 233, "LibCall_ACMContexRemoveCredentialsByTypeAndScope");
      acm_mem_free_data(v10, 0x18uLL);
      if (v11) {
        unsigned int v12 = 70;
      }
      else {
        unsigned int v12 = 10;
      }
    }
    else
    {
      unsigned int v12 = 70;
      uint64_t v11 = 4294967292;
    }
  }
  else
  {
    unsigned int v12 = 70;
    uint64_t v11 = 4294967293;
  }
  if (v12 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContexRemoveCredentialsByTypeAndScope", (int)v11);
  }
  return v11;
}

uint64_t LibCall_ACMContextRemoveCredentialsByValueAndScope(uint64_t (*a1)(uint64_t, uint64_t, void, void *, size_t, void, void), uint64_t a2, uint64_t a3, _DWORD *a4, uint64_t a5)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextRemoveCredentialsByValueAndScope");
  }
  size_t size = 0;
  if (a3) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = a5 == 2;
  }
  char v11 = !v10;
  unsigned int v12 = 70;
  uint64_t v13 = 4294967293;
  if (a4 && (v11 & 1) == 0)
  {
    uint64_t v14 = GetSerializedRemoveCredentialSize(a3, a4, a5, &size);
    if (v14)
    {
      uint64_t v13 = v14;
      unsigned int v12 = 70;
    }
    else
    {
      size_t v15 = size;
      int v16 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v16, v15, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 251, "LibCall_ACMContextRemoveCredentialsByValueAndScope");
      if (v16)
      {
        uint64_t v17 = SerializeRemoveCredential(a3, a4, a5, v16, &size);
        if (!v17) {
          uint64_t v17 = a1(a2, 6, 0, v16, size, 0, 0);
        }
        uint64_t v13 = v17;
        size_t v18 = size;
        acm_mem_free_info("<data>", v16, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 264, "LibCall_ACMContextRemoveCredentialsByValueAndScope");
        acm_mem_free_data(v16, v18);
        if (v13) {
          unsigned int v12 = 70;
        }
        else {
          unsigned int v12 = 10;
        }
      }
      else
      {
        unsigned int v12 = 70;
        uint64_t v13 = 4294967292;
      }
    }
  }
  if (v12 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextRemoveCredentialsByValueAndScope", (int)v13);
  }
  return v13;
}

uint64_t LibCall_ACMContextVerifyPolicyAndCopyRequirementEx(uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, char *__s1, uint64_t a5, _DWORD *a6, unsigned int a7, uint64_t a8, BOOL *a9, void *a10)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
  }
  size_t v32 = 0;
  size_t size = 0;
  __int16 v30 = 0;
  unint64_t v31 = 4096;
  unsigned int v18 = 70;
  uint64_t v19 = 4294967293;
  size_t v29 = 0;
  if (a1 && a3 && __s1 && a9)
  {
    if ((a6 != 0) != (a7 != 0))
    {
      unsigned int v18 = 70;
      uint64_t v19 = 4294967293;
    }
    else
    {
      uint64_t SerializedVerifyPolicySize = GetSerializedVerifyPolicySize((uint64_t)a3, __s1, a5, a8, a6, a7, &size);
      if (SerializedVerifyPolicySize)
      {
        uint64_t v19 = SerializedVerifyPolicySize;
        unsigned int v18 = 70;
      }
      else
      {
        size_t v21 = size;
        __int16 v22 = acm_mem_alloc_data(size);
        acm_mem_alloc_info("<data>", v22, v21, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 293, "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
        if (v22)
        {
          size_t v32 = size;
          uint64_t v23 = SerializeVerifyPolicy(a3, __s1, a5, a8, a6, a7, v22, &v32);
          if (v23)
          {
            uint64_t v19 = v23;
            BOOL v24 = 0;
          }
          else
          {
            BOOL v24 = (unsigned int *)acm_mem_alloc_data(0x1000uLL);
            acm_mem_alloc_info("<data>", v24, 4096, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 300, "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
            if (v24)
            {
              uint64_t v25 = a1(a2, 3, 0, v22, v32, v24, &v31);
              if (v25)
              {
                uint64_t v19 = v25;
              }
              else
              {
                unint64_t v26 = v31 - 4;
                if (v31 < 4)
                {
                  uint64_t v19 = 4294967291;
                }
                else
                {
                  *a9 = *v24 != 0;
                  if (a10)
                  {
                    uint64_t v19 = DeserializeRequirement(v24 + 1, v26, &v30, &v29);
                    if (!v19) {
                      *a10 = v30;
                    }
                  }
                  else
                  {
                    uint64_t v19 = 0;
                  }
                }
              }
            }
            else
            {
              uint64_t v19 = 4294967292;
            }
          }
          size_t v27 = size;
          acm_mem_free_info("<data>", v22, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 324, "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
          acm_mem_free_data(v22, v27);
          if (v24)
          {
            acm_mem_free_info("<data>", v24, 0x1000uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 327, "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
            acm_mem_free_data(v24, 0x1000uLL);
          }
          if (v19) {
            unsigned int v18 = 70;
          }
          else {
            unsigned int v18 = 10;
          }
        }
        else
        {
          unsigned int v18 = 70;
          uint64_t v19 = 4294967292;
        }
      }
    }
  }
  if (v18 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx", (int)v19);
  }
  return v19;
}

uint64_t LibCall_ACMRequirementDelete(uint64_t a1, int *a2)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMRequirementDelete");
  }
  unsigned int v4 = 70;
  uint64_t v5 = 4294967293;
  if (a1 && a2)
  {
    uint64_t v5 = Util_DeallocRequirement(a2);
    if (v5) {
      unsigned int v4 = 70;
    }
    else {
      unsigned int v4 = 10;
    }
  }
  if (v4 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMRequirementDelete", (int)v5);
  }
  return v5;
}

uint64_t LibCall_ACMKernelControl(uint64_t (*a1)(uint64_t, uint64_t, void, char *, size_t, uint64_t, uint64_t), uint64_t a2, int a3, const void *a4, size_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v13 = a1;
  if (gACMLoggingLevel <= 0xAu) {
    a1 = (uint64_t (*)(uint64_t, uint64_t, void, char *, size_t, uint64_t, uint64_t))printf("%s: %s: called.\n", "ACM", "LibCall_ACMKernelControl");
  }
  if (!v13) {
    goto LABEL_16;
  }
  BOOL v14 = a5 != 0;
  if (a4) {
    BOOL v14 = a5 - 4097 < 0xFFFFFFFFFFFFF000;
  }
  if (v14)
  {
LABEL_16:
    unsigned int v18 = 70;
    uint64_t v17 = 4294967293;
  }
  else
  {
    uint64_t v20 = (uint64_t)&v20;
    off_50A58(a1);
    size_t v15 = (_DWORD *)((char *)&v20 - ((a5 + 19) & 0xFFFFFFFFFFFFFFF0));
    _DWORD *v15 = a3;
    int v16 = v15 + 1;
    if (a5)
    {
      memcpy(v15 + 1, a4, a5);
      int v16 = (_DWORD *)((char *)v16 + a5);
    }
    if (v16 != (_DWORD *)((char *)v15 + a5 + 4)) {
      LibCall_ACMKernelControl_cold_1();
    }
    uint64_t v17 = v13(a2, 26, 0, (char *)&v20 - ((a5 + 19) & 0xFFFFFFFFFFFFFFF0), a5 + 4, a6, a7);
    if (v17) {
      unsigned int v18 = 70;
    }
    else {
      unsigned int v18 = 10;
    }
  }
  if (v18 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMKernelControl", (int)v17);
  }
  return v17;
}

_DWORD *LibCall_ACMCredentialDelete(_DWORD *a1)
{
  if (a1) {
    return (_DWORD *)Util_DeallocCredential(a1);
  }
  return a1;
}

unsigned int *LibCall_ACMCredentialGetType(unsigned int *result)
{
  if (result) {
    return (unsigned int *)*result;
  }
  return result;
}

uint64_t LibCall_ACMCredentialSetProperty(int *a1, int a2, _OWORD *__src, size_t __n)
{
  if (!a1) {
    return 4294967293;
  }
  int v4 = __n;
  if ((__src != 0) != (__n != 0)) {
    return 4294967293;
  }
  uint64_t result = 4294967293;
  if (a2 > 399)
  {
    if (a2 > 601)
    {
      if (a2 <= 801)
      {
        if (a2 != 602)
        {
          if (a2 == 701)
          {
            if (__n <= 0x80 && *a1 == 13)
            {
              a1[8] = __n;
              BOOL v14 = a1 + 9;
LABEL_118:
              memcpy(v14, __src, __n);
              return 0;
            }
          }
          else if (a2 == 801 && __n == 16 && *a1 == 17)
          {
            uint64_t result = 0;
            *((_OWORD *)a1 + 2) = *__src;
          }
          return result;
        }
        BOOL v13 = *a1 == 12 || *a1 == 15;
        if (__n != 4 || !v13) {
          return result;
        }
LABEL_79:
        uint64_t result = 0;
        a1[9] = *(_DWORD *)__src;
        return result;
      }
      if (a2 == 802)
      {
        if (__n != 65 || *a1 != 17) {
          return result;
        }
        uint64_t result = 0;
        *((_OWORD *)a1 + 3) = *__src;
        long long v11 = __src[1];
        long long v16 = __src[2];
        long long v17 = __src[3];
        *((unsigned char *)a1 + 112) = *((unsigned char *)__src + 64);
        *((_OWORD *)a1 + 5) = v16;
        *((_OWORD *)a1 + 6) = v17;
        goto LABEL_92;
      }
      if (a2 != 901)
      {
        if (a2 == 1001 && __n <= 0x80 && *a1 == 21)
        {
          memcpy(a1 + 9, __src, __n);
          uint64_t result = 0;
          a1[8] = v4;
        }
        return result;
      }
      if (__n != 32 || *a1 != 20) {
        return result;
      }
    }
    else
    {
      if (a2 > 501)
      {
        switch(a2)
        {
          case 502:
            if (__n == 16 && *a1 == 10)
            {
LABEL_102:
              uint64_t result = 0;
              *(_OWORD *)(a1 + 13) = *__src;
            }
            break;
          case 503:
            if (__n == 16 && *a1 == 10)
            {
              uint64_t result = 0;
              long long v15 = *__src;
LABEL_99:
              *(_OWORD *)(a1 + 17) = v15;
            }
            break;
          case 601:
            BOOL v9 = *a1 == 12 || *a1 == 15;
            BOOL v10 = v9;
            if (__n == 4 && v10)
            {
LABEL_64:
              uint64_t result = 0;
              a1[8] = *(_DWORD *)__src;
            }
            break;
        }
        return result;
      }
      if (a2 != 400)
      {
        if (a2 != 401)
        {
          if (a2 == 501 && __n == 16 && *a1 == 10)
          {
LABEL_16:
            uint64_t result = 0;
            *(_OWORD *)(a1 + 9) = *__src;
          }
          return result;
        }
        if (__n != 24 || *a1 != 7) {
          return result;
        }
        uint64_t result = 0;
        long long v11 = *__src;
        *((void *)a1 + 10) = *((void *)__src + 2);
LABEL_92:
        *((_OWORD *)a1 + 4) = v11;
        return result;
      }
      if (__n != 32 || *a1 != 7) {
        return result;
      }
    }
    uint64_t result = 0;
    long long v18 = __src[1];
    *((_OWORD *)a1 + 2) = *__src;
    *((_OWORD *)a1 + 3) = v18;
    return result;
  }
  if (a2 > 199)
  {
    switch(a2)
    {
      case 300:
        if (__n == 16 && *a1 == 3) {
          goto LABEL_16;
        }
        break;
      case 301:
        if (__n == 32 && *a1 == 3)
        {
          uint64_t result = 0;
          long long v15 = *__src;
          *(_OWORD *)(a1 + 21) = __src[1];
          goto LABEL_99;
        }
        break;
      case 302:
        if (__n == 16 && *a1 == 3) {
          goto LABEL_102;
        }
        break;
      case 303:
        if (__n == 65 && *a1 == 3)
        {
          uint64_t result = 0;
          *(_OWORD *)(a1 + 30) = *__src;
          long long v19 = __src[1];
          long long v20 = __src[2];
          long long v21 = __src[3];
          *((unsigned char *)a1 + 184) = *((unsigned char *)__src + 64);
          *(_OWORD *)(a1 + 42) = v21;
          *(_OWORD *)(a1 + 38) = v20;
          *(_OWORD *)(a1 + 34) = v19;
        }
        break;
      case 304:
        if (__n == 16 && *a1 == 3)
        {
          uint64_t result = 0;
          *(_OWORD *)((char *)a1 + 185) = *__src;
        }
        break;
      case 305:
        if (__n == 4 && *a1 == 3)
        {
          uint64_t result = 0;
          *(int *)((char *)a1 + 201) = *(_DWORD *)__src;
        }
        break;
      case 306:
        if (__n <= 0x80 && *a1 == 3)
        {
          memcpy((char *)a1 + 209, __src, __n);
          uint64_t result = 0;
          *(int *)((char *)a1 + 205) = v4;
        }
        break;
      default:
        if (a2 == 200)
        {
          if (__n <= 0x80 && *a1 == 2)
          {
            a1[9] = __n;
            BOOL v14 = a1 + 10;
            goto LABEL_118;
          }
        }
        else if (a2 == 201 && __n == 4 && *a1 == 2)
        {
          goto LABEL_64;
        }
        break;
    }
    return result;
  }
  if (a2 > 100)
  {
    if (a2 == 101)
    {
      if (__n == 4)
      {
        switch(*a1)
        {
          case 1:
          case 3:
          case 9:
          case 10:
            goto LABEL_64;
          case 2:
          case 4:
          case 5:
          case 6:
          case 7:
          case 8:
            return result;
          default:
            if (*a1 == 18) {
              goto LABEL_64;
            }
            break;
        }
      }
      return result;
    }
    if (a2 != 102 || __n != 4 || *a1 != 1) {
      return result;
    }
    goto LABEL_79;
  }
  if (a2 == 5)
  {
    if (__n == 4)
    {
      uint64_t result = 0;
      a1[3] = *(_DWORD *)__src;
    }
  }
  else if (a2 == 100 && __n == 16)
  {
    int v7 = *a1;
    if (*a1 > 8)
    {
      if (v7 == 9)
      {
        uint64_t v8 = a1 + 10;
        a1[9] = 16;
      }
      else
      {
        if (v7 != 18) {
          return result;
        }
        uint64_t v8 = a1 + 9;
      }
    }
    else if (v7 == 1)
    {
      uint64_t v8 = a1 + 11;
      a1[10] = 16;
    }
    else
    {
      if (v7 != 3) {
        return result;
      }
      uint64_t v8 = a1 + 26;
      a1[25] = 16;
    }
    uint64_t result = 0;
    _OWORD *v8 = *__src;
  }
  return result;
}

uint64_t LibCall_ACMCredentialGetPropertyData(int *a1, int a2, int **a3, uint64_t *a4)
{
  uint64_t result = 4294967293;
  if (!a1 || !a3 || !a4) {
    return result;
  }
  if (a2 > 399)
  {
    if (a2 > 601)
    {
      if (a2 > 801)
      {
        if (a2 == 802)
        {
          if (*a1 != 17) {
            return result;
          }
          long long v11 = a1 + 12;
LABEL_87:
          uint64_t v12 = 65;
          BOOL v13 = v11;
          uint64_t v14 = 65;
        }
        else
        {
          if (a2 != 901)
          {
            if (a2 != 1001 || *a1 != 21) {
              return result;
            }
            long long v15 = a1 + 9;
            if (Util_isNullOrZeroMemory((unsigned char *)a1 + 36, 128))
            {
              long long v15 = 0;
              uint64_t v10 = 0;
            }
            else
            {
              uint64_t v10 = a1[8];
            }
            uint64_t result = 0;
            *a3 = v15;
LABEL_99:
            *a4 = v10;
            return result;
          }
          if (*a1 != 20) {
            return result;
          }
          long long v11 = a1 + 8;
          uint64_t v12 = 32;
          BOOL v13 = v11;
          uint64_t v14 = 32;
        }
      }
      else
      {
        if (a2 == 602)
        {
          if (*a1 != 15 && *a1 != 12) {
            return result;
          }
          goto LABEL_61;
        }
        if (a2 == 701)
        {
          if (*a1 != 13) {
            return result;
          }
          uint64_t result = 0;
          *a3 = a1 + 9;
          uint64_t v10 = a1[8];
          goto LABEL_99;
        }
        if (a2 != 801 || *a1 != 17) {
          return result;
        }
        long long v11 = a1 + 8;
        uint64_t v12 = 16;
        BOOL v13 = v11;
        uint64_t v14 = 16;
      }
      unsigned int v19 = Util_isNullOrZeroMemory(v13, v14);
      uint64_t result = 0;
      BOOL v20 = v19 == 0;
      if (v19) {
        long long v21 = 0;
      }
      else {
        long long v21 = (int *)v11;
      }
      if (v20) {
        uint64_t v22 = v12;
      }
      else {
        uint64_t v22 = 0;
      }
      *a3 = v21;
      *a4 = v22;
      return result;
    }
    if (a2 > 501)
    {
      if (a2 == 502)
      {
        if (*a1 != 10) {
          return result;
        }
        BOOL v9 = a1 + 13;
      }
      else
      {
        if (a2 != 503)
        {
          if (a2 != 601 || *a1 != 15 && *a1 != 12) {
            return result;
          }
          goto LABEL_77;
        }
        if (*a1 != 10) {
          return result;
        }
        BOOL v9 = a1 + 17;
      }
LABEL_68:
      *a3 = v9;
      uint64_t result = (uint64_t)Util_isNullOrZeroMemory(v9, 16);
      if (result)
      {
        uint64_t result = 0;
        *a4 = 0;
        *a3 = 0;
        return result;
      }
LABEL_70:
      uint64_t v10 = 16;
      goto LABEL_99;
    }
    if (a2 == 400)
    {
      if (*a1 != 7) {
        return result;
      }
      uint64_t result = 0;
      long long v16 = a1 + 8;
LABEL_84:
      *a3 = v16;
      uint64_t v10 = 32;
      goto LABEL_99;
    }
    if (a2 == 401)
    {
      if (*a1 != 7) {
        return result;
      }
      uint64_t result = 0;
      *a3 = a1 + 16;
      uint64_t v10 = 24;
      goto LABEL_99;
    }
    if (a2 != 501 || *a1 != 10) {
      return result;
    }
LABEL_15:
    BOOL v9 = a1 + 9;
    goto LABEL_68;
  }
  if (a2 > 199)
  {
    switch(a2)
    {
      case 300:
        if (*a1 == 3)
        {
          uint64_t result = 0;
          uint64_t v8 = a1 + 9;
          goto LABEL_50;
        }
        break;
      case 301:
        if (*a1 == 3)
        {
          uint64_t result = 0;
          long long v16 = a1 + 17;
          goto LABEL_84;
        }
        break;
      case 302:
        if (*a1 == 3)
        {
          uint64_t result = 0;
          uint64_t v8 = a1 + 13;
          goto LABEL_50;
        }
        break;
      case 303:
        if (*a1 == 3)
        {
          long long v11 = a1 + 30;
          goto LABEL_87;
        }
        break;
      case 304:
        if (*a1 == 3)
        {
          uint64_t result = 0;
          uint64_t v8 = (int *)((char *)a1 + 185);
LABEL_50:
          *a3 = v8;
          goto LABEL_70;
        }
        break;
      case 305:
        if (*a1 == 3)
        {
          uint64_t result = 0;
          long long v17 = (int *)((char *)a1 + 201);
          goto LABEL_97;
        }
        break;
      case 306:
        if (*a1 == 3)
        {
          uint64_t result = 0;
          uint64_t v10 = *(unsigned int *)((char *)a1 + 205);
          uint64_t v23 = (int *)((char *)a1 + 209);
          if (!*(int *)((char *)a1 + 205)) {
            uint64_t v23 = 0;
          }
          *a3 = v23;
          goto LABEL_99;
        }
        break;
      default:
        if (a2 == 200)
        {
          if (*a1 == 2)
          {
            uint64_t result = 0;
            *a3 = a1 + 10;
            uint64_t v10 = a1[9];
            goto LABEL_99;
          }
        }
        else if (a2 == 201 && *a1 == 2)
        {
          goto LABEL_77;
        }
        break;
    }
    return result;
  }
  if (a2 > 99)
  {
    if (a2 != 100)
    {
      if (a2 != 101)
      {
        if (a2 != 102 || *a1 != 1) {
          return result;
        }
LABEL_61:
        uint64_t result = 0;
        long long v17 = a1 + 9;
        goto LABEL_97;
      }
      if (*a1 > 0x12 || ((1 << *a1) & 0x4060A) == 0) {
        return result;
      }
LABEL_77:
      uint64_t result = 0;
      long long v17 = a1 + 8;
LABEL_97:
      *a3 = v17;
LABEL_98:
      uint64_t v10 = 4;
      goto LABEL_99;
    }
    int v18 = *a1;
    if (*a1 <= 8)
    {
      if (v18 == 1)
      {
        BOOL v9 = a1 + 11;
      }
      else
      {
        if (v18 != 3) {
          return result;
        }
        BOOL v9 = a1 + 26;
      }
      goto LABEL_68;
    }
    if (v18 == 9)
    {
      BOOL v9 = a1 + 10;
      goto LABEL_68;
    }
    if (v18 != 18) {
      return result;
    }
    goto LABEL_15;
  }
  switch(a2)
  {
    case 1:
      uint64_t result = 0;
      *a3 = a1 + 4;
      uint64_t v10 = 8;
      goto LABEL_99;
    case 2:
      uint64_t result = 0;
      long long v17 = a1 + 6;
      goto LABEL_97;
    case 3:
      uint64_t result = 0;
      *a3 = a1;
      goto LABEL_98;
    case 4:
      uint64_t result = 0;
      long long v17 = a1 + 1;
      goto LABEL_97;
    case 5:
      uint64_t result = 0;
      long long v17 = a1 + 3;
      goto LABEL_97;
    default:
      return result;
  }
  return result;
}

unsigned int *LibCall_ACMRequirementGetType(unsigned int *result)
{
  if (result) {
    return (unsigned int *)*result;
  }
  return result;
}

uint64_t LibCall_ACMRequirementGetState(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 4);
  }
  return result;
}

uint64_t LibCall_ACMRequirementGetPriority(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 8);
  }
  return result;
}

uint64_t LibCall_ACMRequirementGetPropertyData(int *a1, int a2, int **a3, unint64_t *a4)
{
  uint64_t v4 = 4294967293;
  if (!a1 || !a3 || !a4) {
    return v4;
  }
  uint64_t v4 = 4294967293;
  if (a2 > 399)
  {
    if (a2 > 600)
    {
      if (a2 == 601)
      {
        if (*a1 == 26)
        {
          if (a1[3] >= 0x1C)
          {
            int v7 = a1 + 7;
LABEL_45:
            *a3 = v7;
            unint64_t v10 = 16;
            goto LABEL_72;
          }
          return 4294967282;
        }
        return 4294967293;
      }
      if (a2 != 602)
      {
        if (a2 != 700) {
          return v4;
        }
        if (*a1 == 7)
        {
LABEL_28:
          uint64_t v8 = a1 + 4;
          goto LABEL_58;
        }
        return 4294967293;
      }
      if (*a1 != 26) {
        return 4294967293;
      }
      if (a1[3] < 0x1C) {
        return 4294967282;
      }
      *a3 = a1 + 4;
      unint64_t v10 = 8;
    }
    else
    {
      if (a2 == 400)
      {
        if (*a1 == 13)
        {
          BOOL v9 = a1 + 4;
LABEL_64:
          *a3 = v9;
          unint64_t v10 = 32;
          goto LABEL_72;
        }
        return 4294967293;
      }
      if (a2 != 500)
      {
        if (a2 != 600) {
          return v4;
        }
        if (*a1 == 26)
        {
          if (a1[3] >= 0x1C)
          {
            uint64_t v8 = a1 + 6;
LABEL_58:
            *a3 = v8;
            goto LABEL_59;
          }
          return 4294967282;
        }
        return 4294967293;
      }
      if (*a1 != 25) {
        return 4294967293;
      }
      *a3 = a1 + 4;
      unint64_t v10 = 43;
    }
LABEL_72:
    uint64_t v4 = 0;
    *a4 = v10;
    return v4;
  }
  if (a2 > 99)
  {
    switch(a2)
    {
      case 300:
        if (*a1 != 3) {
          return 4294967293;
        }
        int v7 = a1 + 5;
        goto LABEL_45;
      case 301:
        if (*a1 != 3) {
          return 4294967293;
        }
        BOOL v9 = a1 + 13;
        goto LABEL_64;
      case 302:
        if (*a1 != 3) {
          return 4294967293;
        }
        int v7 = a1 + 9;
        goto LABEL_45;
      case 303:
        if (*a1 != 3) {
          return 4294967293;
        }
        unint64_t v10 = 0;
        long long v11 = a1 + 21;
        break;
      case 304:
        if (*a1 != 3) {
          return 4294967293;
        }
        if (a1[3] < 0x9C) {
          return 4294967282;
        }
        uint64_t v8 = a1 + 41;
        goto LABEL_58;
      case 305:
        if (*a1 != 3) {
          return 4294967293;
        }
        if (a1[3] < 0x9C) {
          return 4294967282;
        }
        uint64_t v8 = a1 + 42;
        goto LABEL_58;
      case 306:
        if (*a1 != 24) {
          return 4294967293;
        }
        *a3 = a1 + 5;
        unint64_t v10 = a1[4];
        goto LABEL_72;
      case 307:
        if (*a1 != 24) {
          return 4294967293;
        }
        BOOL v9 = a1 + 261;
        goto LABEL_64;
      default:
        if (a2 == 100)
        {
          int v13 = *a1;
          if (*a1 > 19)
          {
            if (v13 == 20 || v13 == 21) {
              goto LABEL_28;
            }
          }
          else if (v13 == 1 || v13 == 3)
          {
            goto LABEL_28;
          }
          return v4;
        }
        if (a2 != 200) {
          return v4;
        }
        if (*a1 != 2) {
          return 4294967293;
        }
        goto LABEL_28;
    }
    while ((Util_isNullOrZeroMemory((unsigned char *)v11 + v10, 16) & 1) == 0)
    {
      BOOL v12 = v10 >= 0x40;
      v10 += 16;
      if (v12)
      {
        unint64_t v10 = 80;
        goto LABEL_71;
      }
    }
    if (!v10) {
      long long v11 = 0;
    }
LABEL_71:
    *a3 = v11;
    goto LABEL_72;
  }
  switch(a2)
  {
    case 1:
      *a3 = a1;
LABEL_59:
      unint64_t v10 = 4;
      goto LABEL_72;
    case 2:
      uint64_t v8 = a1 + 1;
      goto LABEL_58;
    case 3:
      uint64_t v8 = a1 + 2;
      goto LABEL_58;
  }
  return v4;
}

uint64_t LibCall_ACMPing(uint64_t (*a1)(uint64_t, uint64_t, void, void, void, void, void), uint64_t a2, uint64_t a3)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMPing");
  }
  unsigned int v6 = 70;
  if (a1 && (a3 == 47 || a3 == 29))
  {
    uint64_t v7 = a1(a2, a3, 0, 0, 0, 0, 0);
    if (v7) {
      unsigned int v6 = 70;
    }
    else {
      unsigned int v6 = 10;
    }
  }
  else
  {
    uint64_t v7 = 4294967293;
  }
  if (v6 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMPing", (int)v7);
  }
  return v7;
}

uint64_t LibCall_ACMKernDoubleClickNotify(uint64_t (*a1)(uint64_t, uint64_t, void, void, void, void, void), uint64_t a2)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMKernDoubleClickNotify");
  }
  unsigned int v4 = 70;
  if (a1)
  {
    uint64_t v5 = a1(a2, 28, 0, 0, 0, 0, 0);
    if (v5) {
      unsigned int v4 = 70;
    }
    else {
      unsigned int v4 = 10;
    }
  }
  else
  {
    uint64_t v5 = 4294967293;
  }
  if (v4 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMKernDoubleClickNotify", (int)v5);
  }
  return v5;
}

uint64_t LibCall_ACMContextCredentialGetProperty(uint64_t (*a1)(uint64_t, uint64_t, void, __n128 *, uint64_t, uint64_t, uint64_t, __n128), uint64_t a2, __n128 *a3, unsigned __int32 a4, unsigned __int32 a5, uint64_t a6, uint64_t a7)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextCredentialGetProperty");
  }
  unsigned int v14 = 70;
  uint64_t v15 = 4294967293;
  if (a1)
  {
    if (a3)
    {
      uint64_t v15 = 4294967293;
      if (a6)
      {
        if (a7)
        {
          uint64_t v19 = 24;
          __n128 Property_Serialize = LibSer_ContextCredentialGetProperty_Serialize(a3, a4, a5, &v20, &v19);
          if (v16)
          {
            uint64_t v15 = v16;
          }
          else if (v19 == 24)
          {
            uint64_t v15 = a1(a2, 33, 0, &v20, 24, a6, a7, Property_Serialize);
            if (!v15)
            {
              unsigned int v14 = 10;
              goto LABEL_11;
            }
          }
          else
          {
            uint64_t v15 = 4294967291;
          }
          unsigned int v14 = 70;
        }
      }
    }
  }
LABEL_11:
  if (v14 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextCredentialGetProperty", (int)v15);
  }
  return v15;
}

uint64_t LibCall_ACMGlobalContextCredentialGetProperty(uint64_t (*a1)(uint64_t, uint64_t, void, int *, uint64_t, uint64_t, uint64_t), uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMGlobalContextCredentialGetProperty");
  }
  unsigned int v12 = 70;
  uint64_t v13 = 4294967293;
  if (a1 && a5 && a6)
  {
    uint64_t v16 = 8;
    uint64_t Property_Serialize = LibSer_GlobalContextCredentialGetProperty_Serialize(a3, a4, &v17, &v16);
    if (Property_Serialize)
    {
      uint64_t v13 = Property_Serialize;
    }
    else if (v16 == 8)
    {
      uint64_t v13 = a1(a2, 27, 0, &v17, 8, a5, a6);
      if (!v13)
      {
        unsigned int v12 = 10;
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v13 = 4294967291;
    }
    unsigned int v12 = 70;
  }
LABEL_10:
  if (v12 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMGlobalContextCredentialGetProperty", (int)v13);
  }
  return v13;
}

uint64_t LibCall_ACMContextVerifyPolicyEx(uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, char *__s1, uint64_t a5, _DWORD *a6, unsigned int a7, uint64_t a8, BOOL *a9, int **a10)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextVerifyPolicyEx");
  }
  unint64_t v31 = 4096;
  size_t size = 0;
  size_t v29 = 0;
  __int16 v30 = 0;
  uint64_t v18 = 4294967293;
  if (!a3 || !__s1 || !a9)
  {
LABEL_18:
    if (!v18) {
      goto LABEL_21;
    }
    goto LABEL_19;
  }
  uint64_t SerializedVerifyPolicySize = GetSerializedVerifyPolicySize((uint64_t)a3, __s1, a5, a8, a6, a7, &size);
  if (!SerializedVerifyPolicySize)
  {
    size_t v20 = size;
    long long v21 = acm_mem_alloc_data(size);
    acm_mem_alloc_info("<data>", v21, v20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1257, "LibCall_ACMContextVerifyPolicyEx");
    if (v21)
    {
      uint64_t v22 = SerializeVerifyPolicy(a3, __s1, a5, a8, a6, a7, v21, &size);
      if (v22)
      {
        uint64_t v18 = v22;
        uint64_t v23 = 0;
      }
      else
      {
        uint64_t v23 = (unsigned int *)acm_mem_alloc_data(0x1000uLL);
        acm_mem_alloc_info("<data>", v23, 4096, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1263, "LibCall_ACMContextVerifyPolicyEx");
        if (v23)
        {
          uint64_t v24 = a1(a2, 3, 0, v21, size, v23, &v31);
          if (v24)
          {
            uint64_t v18 = v24;
          }
          else
          {
            unint64_t v25 = v31 - 4;
            if (v31 < 4)
            {
              uint64_t v18 = 4294967291;
            }
            else
            {
              *a9 = *v23 != 0;
              if (a10)
              {
                uint64_t v18 = DeserializeRequirement(v23 + 1, v25, (void **)&v30, &v29);
                if (!v18) {
                  *a10 = v30;
                }
              }
              else
              {
                uint64_t v18 = 0;
              }
            }
          }
        }
        else
        {
          uint64_t v18 = 4294967292;
        }
      }
      size_t v26 = size;
      acm_mem_free_info("<data>", v21, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1288, "LibCall_ACMContextVerifyPolicyEx");
      acm_mem_free_data(v21, v26);
      if (v23)
      {
        acm_mem_free_info("<data>", v23, 0x1000uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1291, "LibCall_ACMContextVerifyPolicyEx");
        acm_mem_free_data(v23, 0x1000uLL);
      }
    }
    else
    {
      uint64_t v18 = 4294967292;
    }
    goto LABEL_18;
  }
  uint64_t v18 = SerializedVerifyPolicySize;
LABEL_19:
  if (v30) {
    Util_DeallocRequirement(v30);
  }
LABEL_21:
  if (v18) {
    unsigned int v27 = 70;
  }
  else {
    unsigned int v27 = 10;
  }
  if (v27 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextVerifyPolicyEx", (int)v18);
  }
  return v18;
}

uint64_t LibCall_ACMGlobalContextVerifyPolicyEx(uint64_t (*a1)(uint64_t, uint64_t, void, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, char *a3, uint64_t a4, _DWORD *a5, unsigned int a6, BOOL *a7, int **a8)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMGlobalContextVerifyPolicyEx");
  }
  *(void *)size_t v20 = 0;
  uint64_t v16 = LibCall_ACMContextCreate((uint64_t (*)(uint64_t, uint64_t, void, void, void, unsigned char *, uint64_t *))a1, a2, v20, 0, 1);
  if (!v16) {
    uint64_t v16 = LibCall_ACMContextVerifyPolicyEx(a1, a2, *(_OWORD **)v20, a3, a4, a5, a6, 0xFFFFFFFFLL, a7, a8);
  }
  uint64_t v17 = v16;
  if (*(void *)v20) {
    LibCall_ACMContextDelete((void (*)(uint64_t, uint64_t, void, void *, uint64_t, void, void))a1, a2, *(void **)v20, 1);
  }
  if (v17) {
    unsigned int v18 = 70;
  }
  else {
    unsigned int v18 = 10;
  }
  if (v18 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMGlobalContextVerifyPolicyEx", (int)v17);
  }
  return v17;
}

uint64_t LibCall_ACMGetEnvironmentVariable(uint64_t (*a1)(uint64_t, uint64_t, void, int *, uint64_t, uint64_t, uint64_t), uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  int v12 = a3;
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMGetEnvironmentVariable");
  }
  unsigned int v9 = 70;
  uint64_t v10 = 4294967293;
  if (a1 && a4 && a5)
  {
    uint64_t v10 = a1(a2, 25, 0, &v12, 4, a4, a5);
    if (v10) {
      unsigned int v9 = 70;
    }
    else {
      unsigned int v9 = 10;
    }
  }
  if (v9 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMGetEnvironmentVariable", (int)v10);
  }
  return v10;
}

uint64_t LibCall_ACMSetEnvironmentVariable(uint64_t (*a1)(uint64_t, uint64_t, void, char *, size_t, void, void), uint64_t a2, int a3, _OWORD *a4, _OWORD *a5, uint64_t a6, const void *a7, size_t a8)
{
  uint64_t v15 = a1;
  if (gACMLoggingLevel <= 0xAu) {
    a1 = (uint64_t (*)(uint64_t, uint64_t, void, char *, size_t, void, void))printf("%s: %s: called.\n", "ACM", "LibCall_ACMSetEnvironmentVariable");
  }
  if (!v15 || a6 != 16 * (a5 != 0)) {
    goto LABEL_20;
  }
  BOOL v16 = a8 != 0;
  if (a7) {
    BOOL v16 = a8 - 129 < 0xFFFFFFFFFFFFFF80;
  }
  if (!v16)
  {
    off_50A58(a1);
    uint64_t v17 = (char *)&v21 - ((a8 + 59) & 0xFFFFFFFFFFFFFFF0);
    *(_DWORD *)uint64_t v17 = a3;
    *((_DWORD *)v17 + 1) = 2;
    *((_DWORD *)v17 + 2) = a8;
    *(_OWORD *)(v17 + 12) = 0u;
    *(_OWORD *)(v17 + 28) = 0u;
    if (a4) {
      *(_OWORD *)(v17 + 12) = *a4;
    }
    if (a5) {
      *(_OWORD *)(v17 + 28) = *a5;
    }
    if (a8) {
      memcpy(v17 + 44, a7, a8);
    }
    uint64_t v18 = v15(a2, 44, 0, (char *)&v21 - ((a8 + 59) & 0xFFFFFFFFFFFFFFF0), a8 + 44, 0, 0);
    if (v18) {
      unsigned int v19 = 70;
    }
    else {
      unsigned int v19 = 10;
    }
  }
  else
  {
LABEL_20:
    unsigned int v19 = 70;
    uint64_t v18 = 4294967293;
  }
  if (v19 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSetEnvironmentVariable", (int)v18);
  }
  return v18;
}

uint64_t LibCall_ACMTRMLoadState(uint64_t (*a1)(uint64_t, uint64_t, void, void, void, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMTRMLoadState");
  }
  unsigned int v8 = 70;
  uint64_t v9 = 4294967293;
  if (a1 && a3 && a4)
  {
    uint64_t v9 = a1(a2, 38, 0, 0, 0, a3, a4);
    if (v9) {
      unsigned int v8 = 70;
    }
    else {
      unsigned int v8 = 10;
    }
  }
  if (v8 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMTRMLoadState", (int)v9);
  }
  return v9;
}

uint64_t LibCall_ACMTRMSaveState(uint64_t (*a1)(uint64_t, uint64_t, void, uint64_t, uint64_t, void, void), uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMTRMSaveState");
  }
  if (a1)
  {
    BOOL v10 = (unint64_t)(a4 - 8193) < 0xFFFFFFFFFFFFE000;
    if (!a3) {
      BOOL v10 = a4 != 0;
    }
    unsigned int v11 = 70;
    if (!v10)
    {
      if (a5) {
        uint64_t v12 = 43;
      }
      else {
        uint64_t v12 = 39;
      }
      uint64_t v13 = a1(a2, v12, 0, a3, a4, 0, 0);
      if (v13) {
        unsigned int v11 = 70;
      }
      else {
        unsigned int v11 = 10;
      }
      goto LABEL_13;
    }
  }
  else
  {
    unsigned int v11 = 70;
  }
  uint64_t v13 = 4294967293;
LABEL_13:
  if (v11 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMTRMSaveState", (int)v13);
  }
  return v13;
}

uint64_t LibCall_ACMContextLoadFromImage(uint64_t a1)
{
  uint64_t v1 = off_50A58(a1);
  unsigned int v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, char *, uint64_t, _OWORD *, unint64_t *))v1;
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextLoadFromImage");
  }
  unsigned int v11 = 70;
  uint64_t v12 = 4294967293;
  if (v10 && v7 && (unint64_t)(v5 - 4097) >= 0xFFFFFFFFFFFFF000)
  {
    uint64_t v13 = acm_mem_alloc(0x14uLL);
    acm_mem_alloc_info("ACMHandleWithPayload", v13, 20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1447, "LibCall_ACMContextLoadFromImage");
    if (v13)
    {
      bzero(v21, 0x1005uLL);
      char v20 = 1;
      *(_WORD *)&v21[1] = 6;
      __int16 v22 = v5;
      __memcpy_chk();
      memset(v18, 0, sizeof(v18));
      uint64_t v19 = 0;
      unint64_t v17 = 280;
      uint64_t v14 = v10(v9, 48, 0, &v20, 4102, v18, &v17);
      if (v14)
      {
        uint64_t v12 = v14;
      }
      else if (v17 < 0x18)
      {
        uint64_t v12 = 4294967291;
      }
      else
      {
        if (LOBYTE(v18[0]))
        {
          uint64_t v12 = 0;
          int v15 = DWORD1(v18[1]);
          *(_OWORD *)uint64_t v13 = *(_OWORD *)((char *)v18 + 4);
          v13[4] = v15;
          *unsigned int v3 = v13;
          unsigned int v11 = 10;
          goto LABEL_11;
        }
        uint64_t v12 = 4294967280;
      }
      acm_mem_free_info("ACMHandleWithPayload", v13, 0x14uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1508, "LibCall_ACMContextLoadFromImage");
      acm_mem_free(v13, 0x14uLL);
      unsigned int v11 = 70;
    }
    else
    {
      unsigned int v11 = 70;
      uint64_t v12 = 4294967292;
    }
  }
LABEL_11:
  if (v11 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextLoadFromImage", (int)v12);
  }
  return v12;
}

uint64_t LibCall_ACMContextUnloadToImage(uint64_t a1)
{
  uint64_t v1 = off_50A58(a1);
  unsigned int v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, int *, uint64_t, unsigned char *, int *))v1;
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextUnloadToImage");
  }
  unsigned int v11 = 70;
  uint64_t v12 = 4294967293;
  if (v10 && v5 && v3)
  {
    long long v21 = 0uLL;
    int v20 = 1310721;
    if (v7) {
      long long v21 = *v7;
    }
    else {
      long long v21 = 0uLL;
    }
    bzero(v17, 0x1106uLL);
    *(void *)BOOL v16 = 4358;
    uint64_t v13 = v10(v9, 49, 0, &v20, 20, v17, v16);
    if (v13)
    {
      uint64_t v12 = v13;
LABEL_18:
      unsigned int v11 = 70;
      goto LABEL_14;
    }
    if (*(void *)v16 < 6uLL)
    {
      unsigned int v11 = 70;
      uint64_t v12 = 4294967291;
    }
    else
    {
      if (v17[0])
      {
        uint64_t v15 = v18;
        uint64_t v12 = Util_ReadFromBuffer((uint64_t)v17, *(size_t *)v16, &v15, v5, (unsigned __int16)__n);
        if (!v12)
        {
          *unsigned int v3 = v15 - v18;
          unsigned int v11 = 10;
          goto LABEL_14;
        }
        goto LABEL_18;
      }
      unsigned int v11 = 70;
      uint64_t v12 = 4294967280;
    }
  }
LABEL_14:
  if (v11 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextUnloadToImage", (int)v12);
  }
  return v12;
}

uint64_t LibCall_ACMContextSetData(uint64_t (*a1)(uint64_t, uint64_t, void, void *, size_t, void, void), uint64_t a2, _OWORD *a3, int a4, _DWORD *a5, unsigned int a6, const void *a7, size_t a8)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextSetData");
  }
  size_t size = 0;
  unsigned int v16 = 70;
  uint64_t v17 = 4294967293;
  if (a1 && a3)
  {
    if ((a7 != 0) != (a8 != 0))
    {
      unsigned int v16 = 70;
      uint64_t v17 = 4294967293;
    }
    else if (a8 > 0xE00)
    {
      unsigned int v16 = 70;
      uint64_t v17 = 4294967276;
    }
    else
    {
      uint64_t v18 = LibSer_StorageSetData_GetSize(a8, a5, a6, &size);
      if (v18)
      {
        uint64_t v17 = v18;
        unsigned int v16 = 70;
      }
      else
      {
        size_t v19 = size;
        int v20 = acm_mem_alloc_data(size);
        acm_mem_alloc_info("<data>", v20, v19, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1593, "LibCall_ACMContextSetData");
        if (v20)
        {
          uint64_t v21 = LibSer_StorageSetData_Serialize(a3, a4, a7, a8, a5, a6, (uint64_t)v20, &size);
          if (!v21) {
            uint64_t v21 = a1(a2, 40, 0, v20, size, 0, 0);
          }
          uint64_t v17 = v21;
          size_t v22 = size;
          acm_mem_free_info("<data>", v20, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1605, "LibCall_ACMContextSetData");
          acm_mem_free_data(v20, v22);
          if (v17) {
            unsigned int v16 = 70;
          }
          else {
            unsigned int v16 = 10;
          }
        }
        else
        {
          unsigned int v16 = 70;
          uint64_t v17 = 4294967292;
        }
      }
    }
  }
  if (v16 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextSetData", (int)v17);
  }
  return v17;
}

uint64_t LibCall_ACMContextGetData(uint64_t (*a1)(uint64_t, uint64_t, void, void *, size_t, uint64_t, uint64_t), uint64_t a2, _OWORD *a3, int a4, char a5, _DWORD *a6, unsigned int a7, uint64_t a8, uint64_t a9)
{
  if (gACMLoggingLevel <= 0xAu)
  {
    uint64_t v16 = a8;
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextGetData");
    a8 = v16;
  }
  size_t size = 0;
  unsigned int v17 = 70;
  uint64_t v18 = 4294967293;
  if (a1)
  {
    uint64_t v26 = a2;
    if (a3)
    {
      uint64_t v18 = 4294967293;
      if (a8)
      {
        if (a9)
        {
          uint64_t v19 = a8;
          uint64_t v20 = LibSer_StorageGetData_GetSize(a6, a7, &size);
          if (v20)
          {
            uint64_t v18 = v20;
            unsigned int v17 = 70;
          }
          else
          {
            size_t v21 = size;
            size_t v22 = acm_mem_alloc_data(size);
            acm_mem_alloc_info("<data>", v22, v21, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1628, "LibCall_ACMContextGetData");
            if (v22)
            {
              uint64_t Data_Serialize = LibSer_StorageGetData_Serialize(a3, a4, a5, a6, a7, (uint64_t)v22, &size);
              if (!Data_Serialize) {
                uint64_t Data_Serialize = a1(v26, 41, 0, v22, size, v19, a9);
              }
              uint64_t v18 = Data_Serialize;
              size_t v24 = size;
              acm_mem_free_info("<data>", v22, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1640, "LibCall_ACMContextGetData");
              acm_mem_free_data(v22, v24);
              if (v18) {
                unsigned int v17 = 70;
              }
              else {
                unsigned int v17 = 10;
              }
            }
            else
            {
              unsigned int v17 = 70;
              uint64_t v18 = 4294967292;
            }
          }
        }
      }
    }
  }
  if (v17 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextGetData", (int)v18);
  }
  return v18;
}

uint64_t LibCall_ACMPublishTrustedAccessories(uint64_t (*a1)(uint64_t, uint64_t, void, char *, size_t, void, void), uint64_t a2, const void *a3, size_t a4)
{
  uint64_t v7 = a1;
  if (gACMLoggingLevel <= 0xAu) {
    a1 = (uint64_t (*)(uint64_t, uint64_t, void, char *, size_t, void, void))printf("%s: %s: called.\n", "ACM", "LibCall_ACMPublishTrustedAccessories");
  }
  if (v7)
  {
    if (a3) {
      BOOL v8 = 1;
    }
    else {
      BOOL v8 = a4 == 0;
    }
    char v9 = !v8;
    unsigned int v10 = 70;
    uint64_t v11 = 4294967293;
    if ((a4 & 0xF) == 0 && a4 <= 0x100 && (v9 & 1) == 0)
    {
      off_50A58(a1);
      uint64_t v12 = (_DWORD *)((char *)&v14 - ((a4 + 23) & 0xFFFFFFFFFFFFFFF0));
      _DWORD *v12 = 1;
      v12[1] = a4;
      if (a4) {
        memcpy(v12 + 2, a3, a4);
      }
      uint64_t v11 = v7(a2, 45, 0, (char *)&v14 - ((a4 + 23) & 0xFFFFFFFFFFFFFFF0), a4 + 8, 0, 0);
      if (v11) {
        unsigned int v10 = 70;
      }
      else {
        unsigned int v10 = 10;
      }
    }
  }
  else
  {
    unsigned int v10 = 70;
    uint64_t v11 = 4294967293;
  }
  if (v10 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMPublishTrustedAccessories", (int)v11);
  }
  return v11;
}

uint64_t LibCall_ACMContextGetInfo(uint64_t (*a1)(uint64_t, uint64_t, void, int *, uint64_t, _OWORD *, unint64_t *), uint64_t a2, long long *a3, int a4, void *a5)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextGetInfo");
  }
  unsigned int v10 = 70;
  uint64_t v11 = 4294967293;
  if (a3 && a1 && a5)
  {
    int v16 = 1;
    int v18 = a4;
    long long v17 = *a3;
    memset(v15, 0, 140);
    unint64_t v14 = 140;
    uint64_t v12 = a1(a2, 46, 0, &v16, 24, v15, &v14);
    if (v12)
    {
      uint64_t v11 = v12;
    }
    else if (v14 < 0xC)
    {
      uint64_t v11 = 4294967291;
    }
    else
    {
      if (LODWORD(v15[0]))
      {
        uint64_t v11 = 0;
        *a5 = *(void *)((char *)v15 + 4);
        unsigned int v10 = 10;
        goto LABEL_10;
      }
      uint64_t v11 = 4294967281;
    }
    unsigned int v10 = 70;
  }
LABEL_10:
  if (v10 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextGetInfo", (int)v11);
  }
  return v11;
}

uint64_t verifyAclConstraintInternal(uint64_t (*a1)(uint64_t, uint64_t, void, void *, size_t, unsigned int *, unint64_t *), uint64_t a2, uint64_t a3, _OWORD *a4, const void *a5, uint64_t a6, const void *a7, unsigned int a8, unsigned __int8 a9, _DWORD *a10, unsigned int a11, unsigned int a12, BOOL *a13, int **a14)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "verifyAclConstraintInternal");
  }
  size_t v36 = 0;
  unint64_t v34 = 0;
  unint64_t v35 = 4096;
  size_t v33 = 0;
  uint64_t v20 = 4294967293;
  if (!a4 || !a5 || !a6 || !a13)
  {
LABEL_19:
    if (!v20) {
      goto LABEL_22;
    }
    goto LABEL_20;
  }
  uint64_t SerializedVerifyAclConstraintSize = GetSerializedVerifyAclConstraintSize(a3, (uint64_t)a4, (uint64_t)a5, a6, (uint64_t)a7, a8, a9, a12, a10, a11, &v36);
  if (!SerializedVerifyAclConstraintSize)
  {
    uint64_t v22 = v36;
    uint64_t v23 = acm_mem_alloc_data(v36);
    acm_mem_alloc_info("<data>", v23, v22, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1929, "verifyAclConstraintInternal");
    if (v23)
    {
      uint64_t v24 = SerializeVerifyAclConstraint(a3, a4, a5, a6, a7, a8, a9, a12, a10, a11, (uint64_t)v23, &v36);
      if (v24)
      {
        uint64_t v20 = v24;
        unint64_t v25 = 0;
      }
      else
      {
        unint64_t v25 = (unsigned int *)acm_mem_alloc_data(0x1000uLL);
        acm_mem_alloc_info("<data>", v25, 4096, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1935, "verifyAclConstraintInternal");
        if (v25)
        {
          uint64_t v26 = a1(a2, a3, 0, v23, v36, v25, &v35);
          if (v26)
          {
            uint64_t v20 = v26;
          }
          else
          {
            unint64_t v27 = v35 - 4;
            if (v35 < 4)
            {
              uint64_t v20 = 4294967291;
            }
            else
            {
              *a13 = *v25 != 0;
              if (a14)
              {
                uint64_t v20 = DeserializeRequirement(v25 + 1, v27, (void **)&v34, &v33);
                if (!v20) {
                  *a14 = v34;
                }
              }
              else
              {
                uint64_t v20 = 0;
              }
            }
          }
        }
        else
        {
          uint64_t v20 = 4294967292;
        }
      }
      rsize_t v28 = v36;
      acm_mem_free_info("<data>", v23, v36, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1958, "verifyAclConstraintInternal");
      acm_mem_free_data(v23, v28);
      if (v25)
      {
        acm_mem_free_info("<data>", v25, 0x1000uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1961, "verifyAclConstraintInternal");
        acm_mem_free_data(v25, 0x1000uLL);
      }
    }
    else
    {
      uint64_t v20 = 4294967292;
    }
    goto LABEL_19;
  }
  uint64_t v20 = SerializedVerifyAclConstraintSize;
LABEL_20:
  if (v34) {
    Util_DeallocRequirement(v34);
  }
LABEL_22:
  if (v20) {
    unsigned int v29 = 70;
  }
  else {
    unsigned int v29 = 10;
  }
  if (v29 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "verifyAclConstraintInternal", (int)v20);
  }
  return v20;
}

uint64_t LibCall_ACMSecContextProcessAcl(uint64_t (*a1)(uint64_t, uint64_t, void, char *, uint64_t, int *, uint64_t *), uint64_t a2, _OWORD *a3, unsigned __int8 *a4, uint64_t a5, unsigned __int8 *a6, uint64_t a7, _DWORD *a8, unsigned int a9, unsigned int a10, _DWORD *a11, BOOL *a12)
{
  return processAclCommandInternal(a1, a2, 12, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, 0, 0);
}

uint64_t processAclCommandInternal(uint64_t (*a1)(uint64_t, uint64_t, void, char *, uint64_t, int *, uint64_t *), uint64_t a2, int a3, _OWORD *a4, unsigned __int8 *a5, uint64_t a6, unsigned __int8 *a7, uint64_t a8, _DWORD *a9, unsigned int a10, unsigned int a11, _DWORD *a12, BOOL *a13, void *a14, unint64_t *a15)
{
  unsigned int v19 = gACMLoggingLevel;
  if (gACMLoggingLevel <= 0xAu)
  {
    printf("%s: %s: called.\n", "ACM", "processAclCommandInternal");
    unsigned int v19 = gACMLoggingLevel;
  }
  if (v19 <= 0x14)
  {
    printf("%s: %s: command = %u.\n", "ACM", "processAclCommandInternal", a3);
    unsigned int v19 = gACMLoggingLevel;
    if (gACMLoggingLevel <= 0x14u)
    {
      printf("%s: %s: context = %p.\n", "ACM", "processAclCommandInternal", a4);
      unsigned int v19 = gACMLoggingLevel;
      if (gACMLoggingLevel <= 0x14u)
      {
        printf("%s: %s: acl = %p, aclCFIndex Length = %zu.\n", "ACM", "processAclCommandInternal", a5, a6);
        unsigned int v19 = gACMLoggingLevel;
        if (gACMLoggingLevel <= 0x14u)
        {
          printf("%s: %s (len=%u): acl:", "ACM", "processAclCommandInternal", a6);
          unsigned int v19 = gACMLoggingLevel;
        }
      }
    }
  }
  if (a6)
  {
    uint64_t v20 = a6;
    size_t v21 = a5;
    do
    {
      if (v19 <= 0x14)
      {
        printf("%02x ", *v21);
        unsigned int v19 = gACMLoggingLevel;
      }
      ++v21;
      --v20;
    }
    while (v20);
  }
  if (v19 < 0x15)
  {
    putchar(10);
    unsigned int v19 = gACMLoggingLevel;
    if (gACMLoggingLevel <= 0x14u)
    {
      printf("%s: %s: operation = %p, operationCFIndex Length = %zu.\n", "ACM", "processAclCommandInternal", a7, a8);
      unsigned int v19 = gACMLoggingLevel;
      if (gACMLoggingLevel <= 0x14u)
      {
        printf("%s: %s (len=%u): operation:", "ACM", "processAclCommandInternal", a8);
        unsigned int v19 = gACMLoggingLevel;
      }
    }
  }
  int v39 = a3;
  if (a8)
  {
    uint64_t v22 = a8;
    uint64_t v23 = a7;
    do
    {
      if (v19 <= 0x14)
      {
        printf("%02x ", *v23);
        unsigned int v19 = gACMLoggingLevel;
      }
      ++v23;
      --v22;
    }
    while (v22);
  }
  if (v19 < 0x15)
  {
    putchar(10);
    if (gACMLoggingLevel <= 0x14u)
    {
      printf("%s: %s: parameters = %p, parameterCount = %u.\n", "ACM", "processAclCommandInternal", a9, a10);
      if (gACMLoggingLevel <= 0x14u)
      {
        printf("%s: %s: maxGlobalCredentialAge = %u.\n", "ACM", "processAclCommandInternal", a11);
        if (gACMLoggingLevel <= 0x14u)
        {
          printf("%s: %s: constraintState = %p.\n", "ACM", "processAclCommandInternal", a12);
          if (gACMLoggingLevel <= 0x14u) {
            printf("%s: %s: requirePasscode = %p.\n", "ACM", "processAclCommandInternal", a13);
          }
        }
      }
    }
  }
  if (a7 || a9 || a12)
  {
    if (a5) {
      BOOL v26 = a6 == 0;
    }
    else {
      BOOL v26 = 1;
    }
    int v27 = v26;
    unsigned int v24 = 70;
    uint64_t v25 = 4294967293;
    if (!a7) {
      goto LABEL_79;
    }
    if (!a8) {
      goto LABEL_79;
    }
    if (v27) {
      goto LABEL_79;
    }
    unsigned int v24 = 70;
    uint64_t v25 = 4294967293;
    if ((a9 != 0) != (a10 != 0) || !a12) {
      goto LABEL_79;
    }
    size_t v45 = 0;
    unint64_t v44 = 4096;
    if (gACMLoggingLevel <= 0xAu) {
      printf("%s: %s: called.\n", "ACM", "processAclInternal");
    }
    uint64_t SerializedProcessAclSize = GetSerializedProcessAclSize((uint64_t)a4, (uint64_t)a5, a6, (uint64_t)a7, a8, a11, a9, a10, &v45);
    if (SerializedProcessAclSize)
    {
      uint64_t v25 = SerializedProcessAclSize;
      unsigned int v37 = 70;
      goto LABEL_74;
    }
    uint64_t v29 = v45;
    __int16 v30 = acm_mem_alloc_data(v45);
    acm_mem_alloc_info("<data>", v30, v29, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1776, "processAclInternal");
    if (!v30)
    {
      unsigned int v37 = 70;
      uint64_t v25 = 4294967292;
      goto LABEL_74;
    }
    unint64_t v44 = 4096;
    unint64_t v31 = acm_mem_alloc_data(0x1000uLL);
    acm_mem_alloc_info("<data>", v31, 4096, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1780, "processAclInternal");
    if (!v31)
    {
      unint64_t v35 = 0;
      unint64_t v34 = 0;
      uint64_t v25 = 4294967292;
      goto LABEL_68;
    }
    uint64_t v32 = SerializeProcessAcl(a4, a5, a6, a7, a8, a11, a9, a10, (uint64_t)v30, &v45);
    if (v32 || (uint64_t v32 = a1(a2, v39, 0, (char *)v30, v45, v31, (uint64_t *)&v44), v32))
    {
      uint64_t v25 = v32;
      unint64_t v34 = 0;
      unint64_t v35 = 0;
      goto LABEL_67;
    }
    unint64_t v33 = v44;
    if (v44 >= 8)
    {
      *a12 = *v31;
      if (a13) {
        *a13 = v31[1] != 0;
      }
      uint64_t v25 = 0;
      unint64_t v34 = 0;
      if (v39 != 30 || !a14)
      {
        unint64_t v35 = 0;
        goto LABEL_67;
      }
      unint64_t v35 = 0;
      if (!a15)
      {
LABEL_67:
        acm_mem_free_info("<data>", v31, 0x1000uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1817, "processAclInternal");
        acm_mem_free_data(v31, 0x1000uLL);
LABEL_68:
        rsize_t v36 = v45;
        acm_mem_free_info("<data>", v30, v45, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1821, "processAclInternal");
        acm_mem_free_data(v30, v36);
        if (v25 && v35)
        {
          acm_mem_free_info("<data>", v35, v34, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1825, "processAclInternal");
          acm_mem_free_data(v35, v34);
          unsigned int v37 = 70;
        }
        else if (v25)
        {
          unsigned int v37 = 70;
        }
        else
        {
          unsigned int v37 = 10;
        }
LABEL_74:
        if (v37 >= gACMLoggingLevel) {
          printf("%s: %s: returning, err = %ld.\n", "ACM", "processAclInternal", (int)v25);
        }
        goto LABEL_76;
      }
      if (v33 >= 0xC)
      {
        unint64_t v34 = v31[2];
        if (v34)
        {
          if (v33 >= v34 + 12)
          {
            unint64_t v35 = acm_mem_alloc_data(v31[2]);
            acm_mem_alloc_info("<data>", v35, v34, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1805, "processAclInternal");
            if (v35)
            {
              memcpy(v35, v31 + 3, v34);
              uint64_t v25 = 0;
              *a14 = v35;
              *a15 = v34;
            }
            else
            {
              uint64_t v25 = 4294967292;
            }
            goto LABEL_67;
          }
          goto LABEL_84;
        }
        unint64_t v34 = 0;
        unint64_t v35 = 0;
        uint64_t v25 = 0;
        goto LABEL_67;
      }
    }
    unint64_t v34 = 0;
LABEL_84:
    unint64_t v35 = 0;
    uint64_t v25 = 4294967291;
    goto LABEL_67;
  }
  if (a4)
  {
    unsigned int v24 = 70;
    uint64_t v25 = 4294967293;
    goto LABEL_79;
  }
  unsigned int v24 = 70;
  uint64_t v25 = 4294967293;
  if (a5 && a13 && a6)
  {
    uint64_t v25 = aclRequiresPasscodeInternal(a1, a2, a5, a6, a13);
LABEL_76:
    if (v25) {
      unsigned int v24 = 70;
    }
    else {
      unsigned int v24 = 10;
    }
  }
LABEL_79:
  if (v24 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "processAclCommandInternal", (int)v25);
  }
  return v25;
}

uint64_t LibCall_ACMSecContextProcessAclAndCopyAuthMethod(uint64_t (*a1)(uint64_t, uint64_t, void, char *, uint64_t, int *, uint64_t *), uint64_t a2, _OWORD *a3, unsigned __int8 *a4, uint64_t a5, unsigned __int8 *a6, uint64_t a7, _DWORD *a8, unsigned int a9, unsigned int a10, _DWORD *a11, BOOL *a12, void *a13, unint64_t *a14)
{
  return processAclCommandInternal(a1, a2, 30, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14);
}

uint64_t LibCall_ACMSecContextVerifyAclConstraintAndCopyRequirement(uint64_t (*a1)(uint64_t, uint64_t, void, void *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, const void *a4, uint64_t a5, const void *a6, unsigned int a7, unsigned __int8 a8, _DWORD *a9, unsigned int a10, unsigned int a11, BOOL *a12, int **a13)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSecContextVerifyAclConstraintAndCopyRequirement");
  }
  unsigned int v21 = 70;
  uint64_t v22 = 4294967293;
  if (a3)
  {
    if (a4)
    {
      if (a5)
      {
        unsigned int v21 = 70;
        uint64_t v22 = 4294967293;
        if ((a9 != 0) == (a10 != 0))
        {
          if (a12)
          {
            uint64_t v22 = verifyAclConstraintInternal(a1, a2, 11, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
            if (v22) {
              unsigned int v21 = 70;
            }
            else {
              unsigned int v21 = 10;
            }
          }
        }
      }
    }
  }
  if (v21 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSecContextVerifyAclConstraintAndCopyRequirement", (int)v22);
  }
  return v22;
}

uint64_t LibCall_ACMSecCredentialProviderEnrollmentStateChangedForUser(uint64_t (*a1)(uint64_t, uint64_t, void, char *, uint64_t, void, void), uint64_t a2, const void *a3, unsigned int a4, _OWORD *a5, uint64_t a6, int a7, _OWORD *a8, uint64_t a9)
{
  int v16 = a1;
  if (gACMLoggingLevel <= 0xAu) {
    a1 = (uint64_t (*)(uint64_t, uint64_t, void, char *, uint64_t, void, void))printf("%s: %s: called.\n", "ACM", "LibCall_ACMSecCredentialProviderEnrollmentStateChangedForUser");
  }
  BOOL v17 = a4 - 113 < 0xFFFFFF90;
  if (!a3) {
    BOOL v17 = a4 != 0;
  }
  if (v17)
  {
    unsigned int v18 = 70;
    uint64_t v19 = 4294967293;
  }
  else
  {
    unsigned int v18 = 70;
    uint64_t v19 = 4294967293;
    if (a8)
    {
      if (a9 == 16)
      {
        uint64_t v19 = 4294967293;
        if (a5)
        {
          if (a6 == 16)
          {
            uint64_t v20 = a4 + 36;
            off_50A58(a1);
            uint64_t v22 = (char *)&v24 - ((v21 + 51) & 0x1FFFFFFF0);
            *(_DWORD *)uint64_t v22 = a7;
            *(_OWORD *)(v22 + 4) = *a8;
            *(_OWORD *)(v22 + 20) = *a5;
            if (a3) {
              memcpy(v22 + 36, a3, v21);
            }
            uint64_t v19 = v16(a2, 14, 0, v22, v20, 0, 0);
            if (v19) {
              unsigned int v18 = 70;
            }
            else {
              unsigned int v18 = 10;
            }
          }
        }
      }
    }
  }
  if (v18 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSecCredentialProviderEnrollmentStateChangedForUser", (int)v19);
  }
  return v19;
}

uint64_t LibCall_ACMSecSetBuiltinBiometry(uint64_t (*a1)(uint64_t, uint64_t, void, char *, size_t, void, void), uint64_t a2, char a3)
{
  char v9 = a3;
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSecSetBuiltinBiometry");
  }
  uint64_t v5 = LibCall_ACMSetEnvironmentVariable(a1, a2, 30, 0, 0, 0, &v9, 1uLL);
  uint64_t v6 = v5;
  if (v5) {
    unsigned int v7 = 70;
  }
  else {
    unsigned int v7 = 10;
  }
  if (v7 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSecSetBuiltinBiometry", (int)v5);
  }
  return v6;
}

uint64_t LibCall_ACMSecSetBiometryAvailability(uint64_t (*a1)(uint64_t, uint64_t, void, int *, uint64_t, uint64_t, uint64_t), uint64_t a2, char a3, int a4)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSecSetBiometryAvailability");
  }
  char v15 = 0;
  unint64_t v14 = 1;
  char v13 = 0;
  uint64_t v8 = LibCall_ACMGetEnvironmentVariable(a1, a2, 6, (uint64_t)&v15, (uint64_t)&v14);
  if (v8)
  {
    uint64_t v11 = v8;
    unsigned int v9 = 70;
  }
  else
  {
    unsigned int v9 = 70;
    if (v14 > 1)
    {
      uint64_t v11 = 4294967291;
    }
    else
    {
      char v10 = v15 & ~a3;
      if (a4) {
        char v10 = v15 | a3;
      }
      char v13 = v10;
      uint64_t v11 = LibCall_ACMSetEnvironmentVariable((uint64_t (*)(uint64_t, uint64_t, void, char *, size_t, void, void))a1, a2, 6, 0, 0, 0, &v13, 1uLL);
      if (v11) {
        unsigned int v9 = 70;
      }
      else {
        unsigned int v9 = 10;
      }
    }
  }
  if (v9 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSecSetBiometryAvailability", (int)v11);
  }
  return v11;
}

uint64_t LibCall_ACMSecContextGetUnlockSecret(uint64_t (*a1)(void, void, void, void, void, void, void), uint64_t a2, _OWORD *a3, _DWORD *a4, unsigned int a5, void *a6, size_t *a7, unsigned char *a8)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSecContextGetUnlockSecret");
  }
  memset(v27, 0, sizeof(v27));
  uint64_t v25 = 64;
  uint64_t v24 = 129;
  if (!a3) {
    goto LABEL_18;
  }
  unsigned int v16 = 70;
  uint64_t v17 = 4294967293;
  if (!a6 || !a7 || !a8) {
    goto LABEL_14;
  }
  if ((a4 != 0) != (a5 != 0))
  {
LABEL_18:
    unsigned int v16 = 70;
    uint64_t v17 = 4294967293;
    goto LABEL_14;
  }
  uint64_t UnlockSecret_Serialize = LibSer_GetUnlockSecret_Serialize(a3, a4, a5, v27, &v25);
  if (UnlockSecret_Serialize
    || (uint64_t UnlockSecret_Serialize = a1(a2, 50, 0, v27, v25, v26, &v24), UnlockSecret_Serialize)
    || (size_t __n = 0,
        __src = 0,
        char v21 = 0,
        uint64_t UnlockSecret_Serialize = LibSer_GetUnlockSecretResponse_Deserialize(v26, v24, &__src, &__n, &v21),
        UnlockSecret_Serialize))
  {
    uint64_t v17 = UnlockSecret_Serialize;
  }
  else
  {
    size_t v19 = __n;
    if (*a7 < __n)
    {
      uint64_t v17 = 4294967276;
    }
    else
    {
      if (__src)
      {
        memcpy(a6, __src, __n);
        uint64_t v17 = 0;
        *a7 = v19;
        *a8 = v21;
        unsigned int v16 = 10;
        goto LABEL_14;
      }
      uint64_t v17 = 4294967291;
    }
  }
  unsigned int v16 = 70;
LABEL_14:
  if (v16 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSecContextGetUnlockSecret", (int)v17);
  }
  return v17;
}

uint64_t LibCall_ACMSEPControl(uint64_t (*a1)(uint64_t, uint64_t, void, char *, uint64_t, unsigned int *, unint64_t *), uint64_t a2, const void *a3, size_t a4, uint64_t a5, _DWORD *a6, unsigned int a7, void *a8, size_t *a9)
{
  __int16 v30 = a8;
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSEPControl");
  }
  unint64_t v33 = 1024;
  uint64_t v34 = 0;
  if (!a1) {
    goto LABEL_17;
  }
  BOOL v16 = a4 - 4097 < 0xFFFFFFFFFFFFF000;
  if (!a3) {
    BOOL v16 = a4 != 0;
  }
  if (v16)
  {
LABEL_17:
    unsigned int v25 = 70;
    uint64_t v24 = 4294967293;
    goto LABEL_21;
  }
  uint64_t Size = LibSer_SEPControl_GetSize(a4, a6, a7, &v34);
  if (Size)
  {
LABEL_18:
    uint64_t v24 = Size;
LABEL_25:
    unsigned int v25 = 70;
    goto LABEL_21;
  }
  uint64_t v18 = a5;
  uint64_t v19 = a2;
  uint64_t v20 = (_OWORD *)off_50A58(v18);
  uint64_t v22 = (char *)&v29 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = LibSer_SEPControl_Serialize(v20, a6, a7, a3, a4, (uint64_t)v22, &v34);
  if (v23)
  {
    uint64_t v24 = v23;
    goto LABEL_20;
  }
  uint64_t v24 = a1(v19, 51, 0, v22, v34, v35, &v33);
  if (v24)
  {
LABEL_20:
    unsigned int v25 = 70;
    goto LABEL_21;
  }
  unsigned int v25 = 10;
  BOOL v26 = v30;
  if (!v30 || !a9) {
    goto LABEL_21;
  }
  size_t v31 = 0;
  uint64_t v32 = 0;
  uint64_t Size = LibSer_SEPControlResponse_Deserialize(v35, v33, &v32, &v31);
  if (Size) {
    goto LABEL_18;
  }
  size_t v27 = v31;
  if (*a9 < v31)
  {
    uint64_t v24 = 4294967276;
    goto LABEL_25;
  }
  if (v32) {
    memcpy(v26, v32, v31);
  }
  uint64_t v24 = 0;
  *a9 = v27;
  unsigned int v25 = 10;
LABEL_21:
  if (v25 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSEPControl", (int)v24);
  }
  return v24;
}

uint64_t aclRequiresPasscodeInternal(uint64_t (*a1)(uint64_t, uint64_t, void, char *, uint64_t, int *, uint64_t *), uint64_t a2, const void *a3, unsigned int a4, unsigned char *a5)
{
  int v19 = 0;
  uint64_t v18 = 4;
  size_t v10 = a4;
  uint64_t v11 = a4 + 4;
  off_50A58(a1);
  uint64_t v12 = (unsigned int *)((char *)&v17 - ((v10 + 19) & 0x1FFFFFFF0));
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "aclRequiresPasscodeInternal");
  }
  unsigned int v13 = 70;
  uint64_t v14 = 4294967293;
  if (a3 && a5)
  {
    unsigned int *v12 = a4;
    memcpy(v12 + 1, a3, v10);
    uint64_t v15 = a1(a2, 17, 0, (char *)&v17 - ((v10 + 19) & 0x1FFFFFFF0), v11, &v19, &v18);
    if (v15)
    {
      uint64_t v14 = v15;
      unsigned int v13 = 70;
    }
    else if (v18 == 4)
    {
      uint64_t v14 = 0;
      *a5 = 1;
      unsigned int v13 = 10;
    }
    else
    {
      unsigned int v13 = 70;
      uint64_t v14 = 4294967291;
    }
  }
  if (v13 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "aclRequiresPasscodeInternal", (int)v14);
  }
  return v14;
}

void LibCall_ACMKernelControl_cold_1()
{
  __assert_rtn("LibCall_ACMKernelControl", "LibCall.c", 373, "commandCursor == commandBuffer + sizeof(commandBuffer)");
}

void __init_logging_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)long long buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
}

void logObjectForModule_cold_1()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_1_0(&dword_0, &_os_log_default, v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
}

void __66__accessorydMatchingPlugin_startIOAccessoryManagerEventMonitoring__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_0, v0, v1, "ret = 0x%X for kIOAccessoryManagerClass kIOTerminatedNotification", v2, v3, v4, v5, v6);
}

void __66__accessorydMatchingPlugin_startIOAccessoryManagerEventMonitoring__block_invoke_cold_3(mach_error_t a1)
{
  mach_error_string(a1);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_15(&dword_0, v1, v2, "could not register for IOAccessoryManager matching: %s\n", v3, v4, v5, v6, v7);
}

void __67__accessorydMatchingPlugin_startUSBRestrictedModeTimeoutMonitoring__block_invoke_cold_1(mach_error_t a1)
{
  mach_error_string(a1);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_15(&dword_0, v1, v2, "could not register for RestrictedMode timeout notifications: %s\n", v3, v4, v5, v6, v7);
}

void serviceAddedTRM_cold_1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_8(a1, a2);
  OUTLINED_FUNCTION_10(&dword_0, v2, v3, "Could not register for interest notification!", v4);
}

void serviceAddedTRM_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_0, v0, v1, "serviceAddedTRM()!", v2, v3, v4, v5, v6);
}

void serviceRemovedTRM_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_0, v0, v1, "serviceRemovedTRM()!", v2, v3, v4, v5, v6);
}

void _shouldPresentUnlockDialog_cold_2()
{
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_0, v0, OS_LOG_TYPE_DEBUG, "Found %u legacy TRM service(s)!", v1, 8u);
}

void serviceAddedLDCM_cold_2(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_8(a1, a2);
  OUTLINED_FUNCTION_10(&dword_0, v2, v3, "Already registered for LDCM interest notifications", v4);
}

void serviceAddedLDCM_cold_3(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_8(a1, a2);
  _os_log_debug_impl(&dword_0, v2, OS_LOG_TYPE_DEBUG, "serviceAddedLDCM()!", v3, 2u);
}

void EnableAccessoryPower_cold_1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1_0(&dword_0, v0, v1, "%s could not find IOAccessoryManager services: %#x\n", v2, v3, v4, v5, 2u);
}

void BTServiceCallback_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOAccessoryManagerEventCallback_cold_1()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_1_0(&dword_0, v0, v1, "%s ioService:%02X is NULL!\n", v2, v3, v4, v5, 2u);
}

void IOAccessoryManagerEventCallback_cold_3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_0, v0, v1, "IOAccessoryManagerGetDigitalID failed with error: 0x%08x", v2, v3, v4, v5, v6);
}

void IOAccessoryManagerEventCallback_cold_5()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_0, v0, v1, "IOAccessoryPortGetServiceWithPort failed!", v2, v3, v4, v5, v6);
}

void IOAccessoryManagerEventCallback_cold_6()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_0, v0, v1, "IOAccessoryPortGetManagerPrimaryPort/IOAccessoryManagerGetServiceWithPrimaryPort failed!", v2, v3, v4, v5, v6);
}

void IOAccessoryManagerEventCallback_cold_7()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_0, v0, v1, "IOAccessoryManagerGetUSBCurrentLimit failed with error: 0x%08x", v2, v3, v4, v5, v6);
}

void IOAccessoryManagerEventCallback_cold_9()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_0, v0, v1, "IOAccessoryManagerGetUSBConnectTypePublished failed with error: 0x%08x", v2, v3, v4, v5, v6);
}

void IOAccessoryManagerEventCallback_cold_10()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_0, v0, v1, "IOAccessoryManagerGetUSBConnectType failed with error: 0x%08x", v2, v3, v4, v5, v6);
}

void IOAccessoryManagerEventCallback_cold_14()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_0, v0, v1, "IOAccessoryManagerGetUSBChargingVoltage failed with error: 0x%08x", v2, v3, v4, v5, v6);
}

void _generateUnlockDialogSeenAnalyticEvent_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_0, v0, v1, "plugin = NULL", v2, v3, v4, v5, v6);
}

void _generateUnlockDialogSeenAnalyticEvent_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_0, v0, v1, "CFStringCreateFromCFData failed!", v2, v3, v4, v5, v6);
}

void _generateUnlockDialogSeenAnalyticEvent_cold_10()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_0, v0, v1, "IOAccessoryManagerGetDigitalID failed with error: %08x", v2, v3, v4, v5, v6);
}

void ___generateUnlockDialogSeenAnalyticEvent_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_0, v0, v1, "couldn't find ApplePearlSEPDriver", v2, v3, v4, v5, v6);
}

void ___generateUnlockDialogSeenAnalyticEvent_block_invoke_cold_3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_0, v0, v1, "couldn't find CombinedSequence properties", v2, v3, v4, v5, v6);
}

void serviceNotificationTRM_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_0, v0, v1, "serviceNotificationTRM()!", v2, v3, v4, v5, v6);
}

void serviceNotificationLDCM_cold_2()
{
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_0, v0, OS_LOG_TYPE_DEBUG, "serviceNotificationLDCM(): messageType: %d", v1, 8u);
}

void serviceLDCMMitigationStatusChanged_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_0, v0, v1, "Enabling criticalUI", v2, v3, v4, v5, v6);
}

void serviceLDCMMitigationStatusChanged_cold_3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_0, v0, v1, "Disabling criticalUI", v2, v3, v4, v5, v6);
}

void serviceLDCMMitigationStatusChanged_cold_5()
{
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_0, v0, OS_LOG_TYPE_DEBUG, "mitigationStatus: %@", v1, 0xCu);
}

void __serviceLDCMMitigationStatusChanged_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_0, v0, v1, "CriticalUI set", v2, v3, v4, v5, v6);
}

void __serviceLDCMMitigationStatusChanged_block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_0, v0, v1, "Failed to display criticalUI: %@", v2, v3, v4, v5, v6);
}

void __serviceLDCMMitigationStatusChanged_block_invoke_903_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_0, v0, v1, "Removed critical UI", v2, v3, v4, v5, v6);
}

void ___presentUnlockDialog_block_invoke_934_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_0, v0, v1, "Setting _gUnlockNotification = nil...", v2, v3, v4, v5, v6);
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

uint64_t BTDeviceGetAddressString()
{
  return _BTDeviceGetAddressString();
}

uint64_t BTDeviceGetSupportedServices()
{
  return _BTDeviceGetSupportedServices();
}

uint64_t BTLocalDeviceGetConnectedDevices()
{
  return _BTLocalDeviceGetConnectedDevices();
}

uint64_t BTLocalDeviceGetDefault()
{
  return _BTLocalDeviceGetDefault();
}

uint64_t BTServiceAddCallbacks()
{
  return _BTServiceAddCallbacks();
}

uint64_t BTSessionAttachWithQueue()
{
  return _BTSessionAttachWithQueue();
}

uint64_t BTSessionDetachWithQueue()
{
  return _BTSessionDetachWithQueue();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA256(data, len, md);
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return _CFBundleGetBundleWithIdentifier(bundleID);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return _CFRunLoopGetMain();
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

CFSetRef CFSetCreateCopy(CFAllocatorRef allocator, CFSetRef theSet)
{
  return _CFSetCreateCopy(allocator, theSet);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return _CFSetCreateMutable(allocator, capacity, callBacks);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return _CFStringCreateCopy(alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return _CFStringCreateMutable(alloc, maxLength);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return _CFStringGetBytes(theString, range, encoding, lossByte, isExternalRepresentation, buffer, maxBufLen, usedBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return _CFUUIDCreate(alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return _CFUUIDCreateString(alloc, uuid);
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return _CFUserNotificationCancel(userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationReceiveResponse(userNotification, timeout, responseFlags);
}

uint64_t CRHandleConnectionForBluetoothAddress()
{
  return _CRHandleConnectionForBluetoothAddress();
}

uint64_t CRIsCarPlayAllowed()
{
  return _CRIsCarPlayAllowed();
}

uint64_t DiagnosticLogSubmissionEnabled()
{
  return _DiagnosticLogSubmissionEnabled();
}

uint64_t IOAccessoryManagerAllowFeatures()
{
  return _IOAccessoryManagerAllowFeatures();
}

uint64_t IOAccessoryManagerConfigurePower()
{
  return _IOAccessoryManagerConfigurePower();
}

uint64_t IOAccessoryManagerGetDigitalID()
{
  return _IOAccessoryManagerGetDigitalID();
}

uint64_t IOAccessoryManagerGetPrimaryPort()
{
  return _IOAccessoryManagerGetPrimaryPort();
}

uint64_t IOAccessoryManagerGetServiceWithPrimaryPort()
{
  return _IOAccessoryManagerGetServiceWithPrimaryPort();
}

uint64_t IOAccessoryManagerGetUSBChargingVoltage()
{
  return _IOAccessoryManagerGetUSBChargingVoltage();
}

uint64_t IOAccessoryManagerGetUSBConnectType()
{
  return _IOAccessoryManagerGetUSBConnectType();
}

uint64_t IOAccessoryManagerGetUSBConnectTypePublished()
{
  return _IOAccessoryManagerGetUSBConnectTypePublished();
}

uint64_t IOAccessoryManagerGetUSBCurrentLimit()
{
  return _IOAccessoryManagerGetUSBCurrentLimit();
}

uint64_t IOAccessoryManagerPowerModeIsSupported()
{
  return _IOAccessoryManagerPowerModeIsSupported();
}

uint64_t IOAccessoryManagerRevokeFeatures()
{
  return _IOAccessoryManagerRevokeFeatures();
}

uint64_t IOAccessoryPortGetManagerPrimaryPort()
{
  return _IOAccessoryPortGetManagerPrimaryPort();
}

uint64_t IOAccessoryPortGetPort()
{
  return _IOAccessoryPortGetPort();
}

uint64_t IOAccessoryPortGetServiceWithPort()
{
  return _IOAccessoryPortGetServiceWithPort();
}

uint64_t IOAccessoryStartVoltageEventMonitor()
{
  return _IOAccessoryStartVoltageEventMonitor();
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return _IOAllowPowerChange(kernelPort, notificationID);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return _IOConnectCallScalarMethod(connection, selector, input, inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallStructMethod(connection, selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return _IODeregisterForSystemPower(notifier);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return _IONotificationPortCreate(mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return _IOObjectRetain(object);
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return _IORegisterForSystemPower(refcon, thePortRef, callback, notifier);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperties(entry, properties, allocator, options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return _IORegistryEntryGetParentEntry(entry, plane, parent);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return _IORegistryEntryGetRegistryEntryID(entry, entryID);
}

kern_return_t IORegistryEntrySetCFProperties(io_registry_entry_t entry, CFTypeRef properties)
{
  return _IORegistryEntrySetCFProperties(entry, properties);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return _IOServiceAddInterestNotification(notifyPort, service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return _IOServiceAddMatchingNotification(notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return _IOServiceGetMatchingServices(mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

OSStatus SecTrustEvaluate(SecTrustRef trust, SecTrustResultType *result)
{
  return _SecTrustEvaluate(trust, result);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopySystemVersionDictionary()
{
  return __CFCopySystemVersionDictionary();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t __memcpy_chk()
{
  return ___memcpy_chk();
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

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
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

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
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

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return _dispatch_walltime(when, delta);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return _getpid();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return _mach_error_string(error_value);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return _memset_s(__s, __smax, __c, __n);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return _notify_set_state(token, state64);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
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
  return _objc_msgSendSuper2(a1, a2);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int pthread_main_np(void)
{
  return _pthread_main_np();
}

int putchar(int a1)
{
  return _putchar(a1);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_blob(a1, a2, a3, n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return _sqlite3_bind_double(a1, a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return _sqlite3_bind_int(a1, a2, a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return _sqlite3_bind_int64(a1, a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return _sqlite3_bind_null(a1, a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_text(a1, a2, a3, a4, a5);
}

int sqlite3_busy_timeout(sqlite3 *a1, int ms)
{
  return _sqlite3_busy_timeout(a1, ms);
}

int sqlite3_changes(sqlite3 *a1)
{
  return _sqlite3_changes(a1);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return _sqlite3_clear_bindings(a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return _sqlite3_close(a1);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return _sqlite3_close_v2(a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_blob(a1, iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_bytes(a1, iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return _sqlite3_column_count(pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_double(a1, iCol);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int(a1, iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int64(a1, iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return _sqlite3_column_name(a1, N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_text(a1, iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_type(a1, iCol);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return _sqlite3_exec(a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_result_codes(sqlite3 *a1, int onoff)
{
  return _sqlite3_extended_result_codes(a1, onoff);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return _sqlite3_finalize(pStmt);
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return _sqlite3_last_insert_rowid(a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return _sqlite3_open_v2(filename, ppDb, flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return _sqlite3_prepare_v2(db, zSql, nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return _sqlite3_reset(pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return _sqlite3_step(a1);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return _strnlen(__s1, __n);
}

void xpc_event_provider_create()
{
  while (1)
    ;
}

void xpc_event_provider_token_fire()
{
  while (1)
    ;
}

id objc_msgSend_ACCSQLiteClassName(void *a1, const char *a2, ...)
{
  return [a1 ACCSQLiteClassName];
}

id objc_msgSend_CKHexString(void *a1, const char *a2, ...)
{
  return [a1 CKHexString];
}

id objc_msgSend_CKUppercaseHexStringWithoutSpaces(void *a1, const char *a2, ...)
{
  return [a1 CKUppercaseHexStringWithoutSpaces];
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

id objc_msgSend__callWarningHandler(void *a1, const char *a2, ...)
{
  return [a1 _callWarningHandler];
}

id objc_msgSend__createSchemaHash(void *a1, const char *a2, ...)
{
  return [a1 _createSchemaHash];
}

id objc_msgSend__periodicVacuum(void *a1, const char *a2, ...)
{
  return [a1 _periodicVacuum];
}

id objc_msgSend__startInterestNotifications(void *a1, const char *a2, ...)
{
  return [a1 _startInterestNotifications];
}

id objc_msgSend__startMatchingNotifications(void *a1, const char *a2, ...)
{
  return [a1 _startMatchingNotifications];
}

id objc_msgSend__stopInterestNotifications(void *a1, const char *a2, ...)
{
  return [a1 _stopInterestNotifications];
}

id objc_msgSend__stopMatchingNotifications(void *a1, const char *a2, ...)
{
  return [a1 _stopMatchingNotifications];
}

id objc_msgSend__synchronousModeString(void *a1, const char *a2, ...)
{
  return [a1 _synchronousModeString];
}

id objc_msgSend__updatePropertiesFromService(void *a1, const char *a2, ...)
{
  return [a1 _updatePropertiesFromService];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_accDigitalID(void *a1, const char *a2, ...)
{
  return [a1 accDigitalID];
}

id objc_msgSend_accSupoortsMikeyBus(void *a1, const char *a2, ...)
{
  return [a1 accSupoortsMikeyBus];
}

id objc_msgSend_accSupoortsUART(void *a1, const char *a2, ...)
{
  return [a1 accSupoortsUART];
}

id objc_msgSend_accSupoortsUSB(void *a1, const char *a2, ...)
{
  return [a1 accSupoortsUSB];
}

id objc_msgSend_accessorydEventsBeforeFirstUnlock(void *a1, const char *a2, ...)
{
  return [a1 accessorydEventsBeforeFirstUnlock];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_aidBulkPipeAccessoryDetachTimesDict(void *a1, const char *a2, ...)
{
  return [a1 aidBulkPipeAccessoryDetachTimesDict];
}

id objc_msgSend_airplaneMode(void *a1, const char *a2, ...)
{
  return [a1 airplaneMode];
}

id objc_msgSend_airplaneModeChanged(void *a1, const char *a2, ...)
{
  return [a1 airplaneModeChanged];
}

id objc_msgSend_allEvents(void *a1, const char *a2, ...)
{
  return [a1 allEvents];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjectsByColumnName(void *a1, const char *a2, ...)
{
  return [a1 allObjectsByColumnName];
}

id objc_msgSend_allTableNames(void *a1, const char *a2, ...)
{
  return [a1 allTableNames];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_analyticsQueue(void *a1, const char *a2, ...)
{
  return [a1 analyticsQueue];
}

id objc_msgSend_angelServiceLDCM(void *a1, const char *a2, ...)
{
  return [a1 angelServiceLDCM];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_attachToBTServer(void *a1, const char *a2, ...)
{
  return [a1 attachToBTServer];
}

id objc_msgSend_authenticationMethod(void *a1, const char *a2, ...)
{
  return [a1 authenticationMethod];
}

id objc_msgSend_authorizationPending(void *a1, const char *a2, ...)
{
  return [a1 authorizationPending];
}

id objc_msgSend_authorizationRequired(void *a1, const char *a2, ...)
{
  return [a1 authorizationRequired];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return [a1 begin];
}

id objc_msgSend_bluetoothEnabled(void *a1, const char *a2, ...)
{
  return [a1 bluetoothEnabled];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_btEventQueue(void *a1, const char *a2, ...)
{
  return [a1 btEventQueue];
}

id objc_msgSend_btServiceTokenSet(void *a1, const char *a2, ...)
{
  return [a1 btServiceTokenSet];
}

id objc_msgSend_btSession(void *a1, const char *a2, ...)
{
  return [a1 btSession];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cachedUSBConnectType(void *a1, const char *a2, ...)
{
  return [a1 cachedUSBConnectType];
}

id objc_msgSend_carPlayEventQueue(void *a1, const char *a2, ...)
{
  return [a1 carPlayEventQueue];
}

id objc_msgSend_chargeConfigDict(void *a1, const char *a2, ...)
{
  return [a1 chargeConfigDict];
}

id objc_msgSend_chargeVoltage(void *a1, const char *a2, ...)
{
  return [a1 chargeVoltage];
}

id objc_msgSend_clearAllData(void *a1, const char *a2, ...)
{
  return [a1 clearAllData];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_columnCount(void *a1, const char *a2, ...)
{
  return [a1 columnCount];
}

id objc_msgSend_completionHandlers(void *a1, const char *a2, ...)
{
  return [a1 completionHandlers];
}

id objc_msgSend_connectType(void *a1, const char *a2, ...)
{
  return [a1 connectType];
}

id objc_msgSend_connectedToBTServer(void *a1, const char *a2, ...)
{
  return [a1 connectedToBTServer];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createBackingUserNotification(void *a1, const char *a2, ...)
{
  return [a1 createBackingUserNotification];
}

id objc_msgSend_currentLimit(void *a1, const char *a2, ...)
{
  return [a1 currentLimit];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_dateFormatter(void *a1, const char *a2, ...)
{
  return [a1 dateFormatter];
}

id objc_msgSend_dbUserVersion(void *a1, const char *a2, ...)
{
  return [a1 dbUserVersion];
}

id objc_msgSend_defaultButtonName(void *a1, const char *a2, ...)
{
  return [a1 defaultButtonName];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_detachFromBTServer(void *a1, const char *a2, ...)
{
  return [a1 detachFromBTServer];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_digitalIDCacheDict(void *a1, const char *a2, ...)
{
  return [a1 digitalIDCacheDict];
}

id objc_msgSend_digitalIDEventProvider(void *a1, const char *a2, ...)
{
  return [a1 digitalIDEventProvider];
}

id objc_msgSend_digitalIDMatchingEnabled(void *a1, const char *a2, ...)
{
  return [a1 digitalIDMatchingEnabled];
}

id objc_msgSend_digitalIDTokenSet(void *a1, const char *a2, ...)
{
  return [a1 digitalIDTokenSet];
}

id objc_msgSend_dismissOnUnlock(void *a1, const char *a2, ...)
{
  return [a1 dismissOnUnlock];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_dropAllTables(void *a1, const char *a2, ...)
{
  return [a1 dropAllTables];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return [a1 duration];
}

id objc_msgSend_end(void *a1, const char *a2, ...)
{
  return [a1 end];
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 ephemeralSessionConfiguration];
}

id objc_msgSend_eventCacheLock(void *a1, const char *a2, ...)
{
  return [a1 eventCacheLock];
}

id objc_msgSend_figaroBagURL(void *a1, const char *a2, ...)
{
  return [a1 figaroBagURL];
}

id objc_msgSend_figaroUploadURL(void *a1, const char *a2, ...)
{
  return [a1 figaroUploadURL];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_findKnownBTDevices(void *a1, const char *a2, ...)
{
  return [a1 findKnownBTDevices];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_groupIdentifier(void *a1, const char *a2, ...)
{
  return [a1 groupIdentifier];
}

id objc_msgSend_handleUSBPortAdded(void *a1, const char *a2, ...)
{
  return [a1 handleUSBPortAdded];
}

id objc_msgSend_handleUSBPortTerminated(void *a1, const char *a2, ...)
{
  return [a1 handleUSBPortTerminated];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_ignoreQuietMode(void *a1, const char *a2, ...)
{
  return [a1 ignoreQuietMode];
}

id objc_msgSend_incrementSuccessCount(void *a1, const char *a2, ...)
{
  return [a1 incrementSuccessCount];
}

id objc_msgSend_incrementWrapFailureCount(void *a1, const char *a2, ...)
{
  return [a1 incrementWrapFailureCount];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_initComplete(void *a1, const char *a2, ...)
{
  return [a1 initComplete];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interestNotificationsStarted(void *a1, const char *a2, ...)
{
  return [a1 interestNotificationsStarted];
}

id objc_msgSend_interface(void *a1, const char *a2, ...)
{
  return [a1 interface];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidateAndCancel(void *a1, const char *a2, ...)
{
  return [a1 invalidateAndCancel];
}

id objc_msgSend_invalidationHandler(void *a1, const char *a2, ...)
{
  return [a1 invalidationHandler];
}

id objc_msgSend_ioAccessoryEventQueue(void *a1, const char *a2, ...)
{
  return [a1 ioAccessoryEventQueue];
}

id objc_msgSend_ioAccessoryManagerClassIteratorArrived(void *a1, const char *a2, ...)
{
  return [a1 ioAccessoryManagerClassIteratorArrived];
}

id objc_msgSend_ioAccessoryManagerClassIteratorTerminated(void *a1, const char *a2, ...)
{
  return [a1 ioAccessoryManagerClassIteratorTerminated];
}

id objc_msgSend_ioAccessoryManagerClassNotify(void *a1, const char *a2, ...)
{
  return [a1 ioAccessoryManagerClassNotify];
}

id objc_msgSend_ioAccessoryPortClassIteratorArrived(void *a1, const char *a2, ...)
{
  return [a1 ioAccessoryPortClassIteratorArrived];
}

id objc_msgSend_ioAccessoryPortClassIteratorTerminated(void *a1, const char *a2, ...)
{
  return [a1 ioAccessoryPortClassIteratorTerminated];
}

id objc_msgSend_ioAccessoryPortClassNotify(void *a1, const char *a2, ...)
{
  return [a1 ioAccessoryPortClassNotify];
}

id objc_msgSend_ioAddedIteratorLDCM(void *a1, const char *a2, ...)
{
  return [a1 ioAddedIteratorLDCM];
}

id objc_msgSend_ioAddedIteratorTRM(void *a1, const char *a2, ...)
{
  return [a1 ioAddedIteratorTRM];
}

id objc_msgSend_ioMatchingDictionary(void *a1, const char *a2, ...)
{
  return [a1 ioMatchingDictionary];
}

id objc_msgSend_ioNotification(void *a1, const char *a2, ...)
{
  return [a1 ioNotification];
}

id objc_msgSend_ioNotificationLDCM(void *a1, const char *a2, ...)
{
  return [a1 ioNotificationLDCM];
}

id objc_msgSend_ioNotificationPort(void *a1, const char *a2, ...)
{
  return [a1 ioNotificationPort];
}

id objc_msgSend_ioNotifyPortLDCM(void *a1, const char *a2, ...)
{
  return [a1 ioNotifyPortLDCM];
}

id objc_msgSend_ioNotifyPortTRM(void *a1, const char *a2, ...)
{
  return [a1 ioNotifyPortTRM];
}

id objc_msgSend_ioRemovedIteratorTRM(void *a1, const char *a2, ...)
{
  return [a1 ioRemovedIteratorTRM];
}

id objc_msgSend_ioResourceIterator(void *a1, const char *a2, ...)
{
  return [a1 ioResourceIterator];
}

id objc_msgSend_ioResourceNotifyPort(void *a1, const char *a2, ...)
{
  return [a1 ioResourceNotifyPort];
}

id objc_msgSend_ioServiceAddedIterator(void *a1, const char *a2, ...)
{
  return [a1 ioServiceAddedIterator];
}

id objc_msgSend_isCarPlayAllowed(void *a1, const char *a2, ...)
{
  return [a1 isCarPlayAllowed];
}

id objc_msgSend_isIOAccessoryManagerMonitorRunning(void *a1, const char *a2, ...)
{
  return [a1 isIOAccessoryManagerMonitorRunning];
}

id objc_msgSend_isIntegerNumber(void *a1, const char *a2, ...)
{
  return [a1 isIntegerNumber];
}

id objc_msgSend_isModal(void *a1, const char *a2, ...)
{
  return [a1 isModal];
}

id objc_msgSend_isOpen(void *a1, const char *a2, ...)
{
  return [a1 isOpen];
}

id objc_msgSend_isUSBRestrictedModeTimeoutMonitorRunning(void *a1, const char *a2, ...)
{
  return [a1 isUSBRestrictedModeTimeoutMonitorRunning];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return [a1 isValid];
}

id objc_msgSend_lastInsertRowID(void *a1, const char *a2, ...)
{
  return [a1 lastInsertRowID];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastUSBAccessoryDetachTime(void *a1, const char *a2, ...)
{
  return [a1 lastUSBAccessoryDetachTime];
}

id objc_msgSend_launchDigitalIDClients(void *a1, const char *a2, ...)
{
  return [a1 launchDigitalIDClients];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizations(void *a1, const char *a2, ...)
{
  return [a1 localizations];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_loggingQueue(void *a1, const char *a2, ...)
{
  return [a1 loggingQueue];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_matchingNotificationsStarted(void *a1, const char *a2, ...)
{
  return [a1 matchingNotificationsStarted];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return [a1 message];
}

id objc_msgSend_mikeyBusAccessoryDetachTimesDict(void *a1, const char *a2, ...)
{
  return [a1 mikeyBusAccessoryDetachTimesDict];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_objCType(void *a1, const char *a2, ...)
{
  return [a1 objCType];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 objectEnumerator];
}

id objc_msgSend_otherButtonName(void *a1, const char *a2, ...)
{
  return [a1 otherButtonName];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return [a1 pid];
}

id objc_msgSend_pluginDefaults(void *a1, const char *a2, ...)
{
  return [a1 pluginDefaults];
}

id objc_msgSend_pluginEventsBeforeFirstUnlock(void *a1, const char *a2, ...)
{
  return [a1 pluginEventsBeforeFirstUnlock];
}

id objc_msgSend_portDescription(void *a1, const char *a2, ...)
{
  return [a1 portDescription];
}

id objc_msgSend_portsMutable(void *a1, const char *a2, ...)
{
  return [a1 portsMutable];
}

id objc_msgSend_powerState(void *a1, const char *a2, ...)
{
  return [a1 powerState];
}

id objc_msgSend_presentViaSystemAperture(void *a1, const char *a2, ...)
{
  return [a1 presentViaSystemAperture];
}

id objc_msgSend_previousFailureCount(void *a1, const char *a2, ...)
{
  return [a1 previousFailureCount];
}

id objc_msgSend_primaryPort(void *a1, const char *a2, ...)
{
  return [a1 primaryPort];
}

id objc_msgSend_printRMEventArray(void *a1, const char *a2, ...)
{
  return [a1 printRMEventArray];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return [a1 processName];
}

id objc_msgSend_protectionSpace(void *a1, const char *a2, ...)
{
  return [a1 protectionSpace];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_rearLightningUSBPortExists(void *a1, const char *a2, ...)
{
  return [a1 rearLightningUSBPortExists];
}

id objc_msgSend_registryEntryID(void *a1, const char *a2, ...)
{
  return [a1 registryEntryID];
}

id objc_msgSend_remoteTarget(void *a1, const char *a2, ...)
{
  return [a1 remoteTarget];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeAllStatements(void *a1, const char *a2, ...)
{
  return [a1 removeAllStatements];
}

id objc_msgSend_removeStandardModeEvents(void *a1, const char *a2, ...)
{
  return [a1 removeStandardModeEvents];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_resetAfterStepError(void *a1, const char *a2, ...)
{
  return [a1 resetAfterStepError];
}

id objc_msgSend_restrictedModeEnabled(void *a1, const char *a2, ...)
{
  return [a1 restrictedModeEnabled];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_rmDialogShown(void *a1, const char *a2, ...)
{
  return [a1 rmDialogShown];
}

id objc_msgSend_rmEventArray(void *a1, const char *a2, ...)
{
  return [a1 rmEventArray];
}

id objc_msgSend_roleSwapMaskWritten(void *a1, const char *a2, ...)
{
  return [a1 roleSwapMaskWritten];
}

id objc_msgSend_scanEventsListForPrimaryPortsSeen(void *a1, const char *a2, ...)
{
  return [a1 scanEventsListForPrimaryPortsSeen];
}

id objc_msgSend_schema(void *a1, const char *a2, ...)
{
  return [a1 schema];
}

id objc_msgSend_schemaVersion(void *a1, const char *a2, ...)
{
  return [a1 schemaVersion];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_serverTrust(void *a1, const char *a2, ...)
{
  return [a1 serverTrust];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return [a1 service];
}

id objc_msgSend_servicePropertiesFiltered(void *a1, const char *a2, ...)
{
  return [a1 servicePropertiesFiltered];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setRoleSwapMaskDueToCarPlayStateChange(void *a1, const char *a2, ...)
{
  return [a1 setRoleSwapMaskDueToCarPlayStateChange];
}

id objc_msgSend_setRoleSwapMaskForUSBPort(void *a1, const char *a2, ...)
{
  return [a1 setRoleSwapMaskForUSBPort];
}

id objc_msgSend_sharedDefaults(void *a1, const char *a2, ...)
{
  return [a1 sharedDefaults];
}

id objc_msgSend_sharedDefaultsIapd(void *a1, const char *a2, ...)
{
  return [a1 sharedDefaultsIapd];
}

id objc_msgSend_sharedDefaultsLogging(void *a1, const char *a2, ...)
{
  return [a1 sharedDefaultsLogging];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_shouldVacuum(void *a1, const char *a2, ...)
{
  return [a1 shouldVacuum];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_startBluetoothMatching(void *a1, const char *a2, ...)
{
  return [a1 startBluetoothMatching];
}

id objc_msgSend_startIOAccessoryManagerEventMonitoring(void *a1, const char *a2, ...)
{
  return [a1 startIOAccessoryManagerEventMonitoring];
}

id objc_msgSend_startListeningForIOAccessoryPortClass(void *a1, const char *a2, ...)
{
  return [a1 startListeningForIOAccessoryPortClass];
}

id objc_msgSend_startListeningForLDCMMitigationStatusChange(void *a1, const char *a2, ...)
{
  return [a1 startListeningForLDCMMitigationStatusChange];
}

id objc_msgSend_startTRMMonitoring(void *a1, const char *a2, ...)
{
  return [a1 startTRMMonitoring];
}

id objc_msgSend_startUSBRestrictedModeTimeoutMonitoring(void *a1, const char *a2, ...)
{
  return [a1 startUSBRestrictedModeTimeoutMonitoring];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_step(void *a1, const char *a2, ...)
{
  return [a1 step];
}

id objc_msgSend_stopBluetoothMatching(void *a1, const char *a2, ...)
{
  return [a1 stopBluetoothMatching];
}

id objc_msgSend_stopIOAccessoryManagerEventMonitoring(void *a1, const char *a2, ...)
{
  return [a1 stopIOAccessoryManagerEventMonitoring];
}

id objc_msgSend_stopListeningForIOAccessoryPortClass(void *a1, const char *a2, ...)
{
  return [a1 stopListeningForIOAccessoryPortClass];
}

id objc_msgSend_stopListeningForLDCMMitigationStatusChange(void *a1, const char *a2, ...)
{
  return [a1 stopListeningForLDCMMitigationStatusChange];
}

id objc_msgSend_stopTRMMonitoring(void *a1, const char *a2, ...)
{
  return [a1 stopTRMMonitoring];
}

id objc_msgSend_stopUSBRestrictedModeTimeoutMonitoring(void *a1, const char *a2, ...)
{
  return [a1 stopUSBRestrictedModeTimeoutMonitoring];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringByStandardizingPath(void *a1, const char *a2, ...)
{
  return [a1 stringByStandardizingPath];
}

id objc_msgSend_successCount(void *a1, const char *a2, ...)
{
  return [a1 successCount];
}

id objc_msgSend_summaryCounts(void *a1, const char *a2, ...)
{
  return [a1 summaryCounts];
}

id objc_msgSend_synchronousMode(void *a1, const char *a2, ...)
{
  return [a1 synchronousMode];
}

id objc_msgSend_systemPowerPort(void *a1, const char *a2, ...)
{
  return [a1 systemPowerPort];
}

id objc_msgSend_systemSoundID(void *a1, const char *a2, ...)
{
  return [a1 systemSoundID];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeout(void *a1, const char *a2, ...)
{
  return [a1 timeout];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_transportsUnauthorized(void *a1, const char *a2, ...)
{
  return [a1 transportsUnauthorized];
}

id objc_msgSend_trmStatusDidChange(void *a1, const char *a2, ...)
{
  return [a1 trmStatusDidChange];
}

id objc_msgSend_tryToOpenDatabase(void *a1, const char *a2, ...)
{
  return [a1 tryToOpenDatabase];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_uartAccessoryDetachTimesDict(void *a1, const char *a2, ...)
{
  return [a1 uartAccessoryDetachTimesDict];
}

id objc_msgSend_underlyingAssertion(void *a1, const char *a2, ...)
{
  return [a1 underlyingAssertion];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_uploadDate(void *a1, const char *a2, ...)
{
  return [a1 uploadDate];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}

id objc_msgSend_usbRestrictedModeTimeout(void *a1, const char *a2, ...)
{
  return [a1 usbRestrictedModeTimeout];
}

id objc_msgSend_user(void *a1, const char *a2, ...)
{
  return [a1 user];
}

id objc_msgSend_userAuthorizationPending(void *a1, const char *a2, ...)
{
  return [a1 userAuthorizationPending];
}

id objc_msgSend_userAuthorizationStatusDescription(void *a1, const char *a2, ...)
{
  return [a1 userAuthorizationStatusDescription];
}

id objc_msgSend_userInteractive(void *a1, const char *a2, ...)
{
  return [a1 userInteractive];
}

id objc_msgSend_userNotificationCF(void *a1, const char *a2, ...)
{
  return [a1 userNotificationCF];
}

id objc_msgSend_userNotificationCFDict(void *a1, const char *a2, ...)
{
  return [a1 userNotificationCFDict];
}

id objc_msgSend_userNotifications(void *a1, const char *a2, ...)
{
  return [a1 userNotifications];
}

id objc_msgSend_userVersion(void *a1, const char *a2, ...)
{
  return [a1 userVersion];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_warningHandler(void *a1, const char *a2, ...)
{
  return [a1 warningHandler];
}

id objc_msgSend_wrapFailureCount(void *a1, const char *a2, ...)
{
  return [a1 wrapFailureCount];
}