uint64_t __PCPrefsQueue_block_invoke()
{
  uint64_t vars8;

  PCPrefsQueue_prefsQueue = (uint64_t)dispatch_queue_create("PC-Prefs-Queue", 0);
  return MEMORY[0x1F41817F8]();
}

void sub_1D340EF18(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D340F064(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1D340F324(_Unwind_Exception *exception_object)
{
}

void sub_1D340F3B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1D340F5D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D340F658(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1D340FB38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1D340FD04(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D34100D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3410258(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D34104F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3410B08(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3410C08(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id _GetPowerMonitoringQueue()
{
  if (_GetPowerMonitoringQueue_onceToken != -1) {
    dispatch_once(&_GetPowerMonitoringQueue_onceToken, &__block_literal_global_165);
  }
  v0 = (void *)sPowerMonitoringQueue;
  return v0;
}

__CFString *PCStringFromDate(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    if (PCStringFromDate_onceToken != -1) {
      dispatch_once(&PCStringFromDate_onceToken, &__block_literal_global_5);
    }
    v2 = [(id)PCStringFromDate_formatter stringFromDate:v1];
  }
  else
  {
    v2 = @"(null)";
  }

  return v2;
}

void sub_1D3411C10(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __loadPCPrefsIfNeeded_block_invoke(unsigned char *a1)
{
  if (a1[32] && PCPrefsNeedLoading == 1)
  {
    CFStringRef Copy = CFStringCreateCopy(0, @"com.apple.persistentconnection");
    CFPreferencesAppSynchronize(Copy);
    CFRelease(Copy);
    PCPrefsNeedLoading = 0;
  }
  if (a1[33] && PCPrefsNeedLoadingConnectionClassNoSettings == 1)
  {
    CFStringRef v3 = CFStringCreateCopy(0, @"com.apple.persistentconnection-nosettings");
    CFPreferencesAppSynchronize(v3);
    CFRelease(v3);
    PCPrefsNeedLoadingConnectionClassNoSettings = 0;
  }
  if (a1[34])
  {
    if (PCPrefsNeedLoadingConnectionClassMailContactsCalendars == 1)
    {
      CFStringRef v4 = CFStringCreateCopy(0, @"com.apple.persistentconnection-mcc");
      CFPreferencesAppSynchronize(v4);
      CFRelease(v4);
      PCPrefsNeedLoadingConnectionClassMailContactsCalendars = 0;
    }
  }
}

uint64_t PCSettingsGetClassPollInterval(int a1)
{
  if (registerForPCPrefChanges_onceToken != -1) {
    dispatch_once(&registerForPCPrefChanges_onceToken, &__block_literal_global_2);
  }
  loadPCPrefsIfNeeded(a1 == 0, a1 == 1);
  int valuePtr = 0;
  if (!a1)
  {
    CFStringRef v2 = @"com.apple.persistentconnection-nosettings";
    goto LABEL_7;
  }
  if (a1 == 1)
  {
    CFStringRef v2 = @"com.apple.persistentconnection-mcc";
LABEL_7:
    CFStringRef Copy = CFStringCreateCopy(0, v2);
    goto LABEL_9;
  }
  CFStringRef Copy = 0;
LABEL_9:
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  CFNumberRef v5 = (const __CFNumber *)CFPreferencesCopyValue(@"PCDefaultPollInterval", Copy, @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  if (v5)
  {
    CFNumberRef v6 = v5;
    CFTypeID v7 = CFGetTypeID(v5);
    if (v7 == CFNumberGetTypeID()) {
      CFNumberGetValue(v6, kCFNumberIntType, &valuePtr);
    }
    v8 = v6;
LABEL_13:
    CFRelease(v8);
    goto LABEL_14;
  }
  if (a1)
  {
    if (a1 == 1)
    {
      CFStringRef v10 = CFStringCreateCopy(0, @"com.apple.persistentconnection");
      CFNumberRef v11 = (const __CFNumber *)CFPreferencesCopyValue(@"PCDefaultPollInterval", v10, @"mobile", v4);
      if (v11)
      {
        CFNumberRef v12 = v11;
        CFTypeID v13 = CFGetTypeID(v11);
        if (v13 == CFNumberGetTypeID()) {
          CFNumberGetValue(v12, kCFNumberIntType, &valuePtr);
        }
        CFRelease(v10);
        v8 = v12;
      }
      else
      {
        v8 = v10;
      }
      goto LABEL_13;
    }
  }
  else
  {
    int valuePtr = 1800;
  }
LABEL_14:
  if (Copy) {
    CFRelease(Copy);
  }
  if (valuePtr < 0) {
    return 0xFFFFFFFFLL;
  }
  else {
    return valuePtr;
  }
}

uint64_t PCSettingsGetClassPushEnabled(int a1)
{
  if (registerForPCPrefChanges_onceToken != -1) {
    dispatch_once(&registerForPCPrefChanges_onceToken, &__block_literal_global_2);
  }
  loadPCPrefsIfNeeded(a1 == 0, a1 == 1);
  if (!a1)
  {
    CFStringRef v2 = @"com.apple.persistentconnection-nosettings";
    goto LABEL_7;
  }
  if (a1 == 1)
  {
    CFStringRef v2 = @"com.apple.persistentconnection-mcc";
LABEL_7:
    CFStringRef Copy = CFStringCreateCopy(0, v2);
    goto LABEL_9;
  }
  CFStringRef Copy = 0;
LABEL_9:
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  CFBooleanRef v5 = (const __CFBoolean *)CFPreferencesCopyValue(@"PCEnablePush", Copy, @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  if (v5)
  {
    CFBooleanRef v6 = v5;
    CFTypeID v7 = CFGetTypeID(v5);
    if (v7 == CFBooleanGetTypeID())
    {
      uint64_t Value = CFBooleanGetValue(v6);
      if (!Copy) {
        goto LABEL_20;
      }
LABEL_19:
      CFRelease(Copy);
      goto LABEL_20;
    }
LABEL_18:
    uint64_t Value = 1;
    if (!Copy) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  if (a1 != 1)
  {
    CFBooleanRef v6 = 0;
    goto LABEL_18;
  }
  CFStringRef v9 = CFStringCreateCopy(0, @"com.apple.persistentconnection");
  CFBooleanRef v10 = (const __CFBoolean *)CFPreferencesCopyValue(@"PCEnablePush", v9, @"mobile", v4);
  CFBooleanRef v6 = v10;
  if (v10 && (CFTypeID v11 = CFGetTypeID(v10), v11 == CFBooleanGetTypeID())) {
    uint64_t Value = CFBooleanGetValue(v6);
  }
  else {
    uint64_t Value = 1;
  }
  CFRelease(v9);
  if (Copy) {
    goto LABEL_19;
  }
LABEL_20:
  if (v6) {
    CFRelease(v6);
  }
  return Value;
}

void loadPCPrefsIfNeeded(char a1, char a2)
{
  CFStringRef v4 = PCPrefsQueue();
  CFBooleanRef v5 = v4;
  if (v4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __loadPCPrefsIfNeeded_block_invoke;
    block[3] = &__block_descriptor_35_e5_v8__0l;
    char v7 = 1;
    char v8 = a1;
    char v9 = a2;
    dispatch_sync(v4, block);
  }
}

id PCPrefsQueue()
{
  if (PCPrefsQueue_onceToken != -1) {
    dispatch_once(&PCPrefsQueue_onceToken, &__block_literal_global_52);
  }
  v0 = (void *)PCPrefsQueue_prefsQueue;
  return v0;
}

void __registerForPCPrefChanges_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_PCPrefsChangedNotification, @"PCPreferencesDidChangeNotificationInternal", 0, CFNotificationSuspensionBehaviorCoalesce);
}

void sub_1D3415B94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D3418378(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1D3418408(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1D34186F8(_Unwind_Exception *exception_object)
{
}

void sub_1D341882C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D34189D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3418B18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1D3418B90(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3418C08(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3418C80(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3418EBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  objc_sync_exit(v7);
  _Block_object_dispose((const void *)(v8 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1D34191D4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3419CCC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3419D3C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3419EBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1D341A52C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D341AD10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1D341AE10(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D341AE8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1D341B0E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1D341BA14(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D341BD58(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D341BDC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1D341BE74(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D341BF2C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D341BFA0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D341C010(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D341C128(_Unwind_Exception *exception_object)
{
}

void sub_1D341C264(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D341C2E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D341C3F8(_Unwind_Exception *exception_object)
{
}

void sub_1D341C578(_Unwind_Exception *exception_object)
{
}

void sub_1D341C5F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D341C668(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D341C6DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D341C750(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D341C880(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D341C9BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D341CAF8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D341CC2C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D341CD74(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D341D29C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D341D69C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D341D7B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D341D8FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1D341D9A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1D341F368(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D341F4D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
}

void sub_1D341F65C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D341FA38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1D341FC10(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D341FD5C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D341FDE4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3420028(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D342070C(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    id v2 = objc_begin_catch(a1);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      __49__PCConnectionManager__saveWWANKeepAliveInterval__block_invoke_2_cold_1((uint64_t)v2);
    }
    objc_end_catch();
    JUMPOUT(0x1D34206D0);
  }
  _Unwind_Resume(a1);
}

void PCSettingsSetClassPushEnabled(int a1, int a2)
{
  if (a1)
  {
    CFBooleanRef v6 = [[PCDistributedLock alloc] initWithName:@"com.apple.persistentconnection.settings.lock"];
    [(PCDistributedLock *)v6 lock];
    if (registerForPCPrefChanges_onceToken != -1) {
      dispatch_once(&registerForPCPrefChanges_onceToken, &__block_literal_global_2);
    }
    loadPCPrefsIfNeeded(0, a1 == 1);
    if (a1 == 1) {
      CFStringRef Copy = CFStringCreateCopy(0, @"com.apple.persistentconnection-mcc");
    }
    else {
      CFStringRef Copy = 0;
    }
    CFBooleanRef v5 = (CFPropertyListRef *)MEMORY[0x1E4F1CFD0];
    if (!a2) {
      CFBooleanRef v5 = (CFPropertyListRef *)MEMORY[0x1E4F1CFC8];
    }
    CFPreferencesSetValue(@"PCEnablePush", *v5, Copy, @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    synchronizeAndNotify(Copy);
    CFRelease(Copy);
    [(PCDistributedLock *)v6 unlock];
  }
}

void synchronizeAndNotify(const __CFString *a1)
{
  if (a1 && CFStringGetLength(a1) >= 1) {
    CFPreferencesAppSynchronize(a1);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"PCPreferencesDidChangeNotificationInternal", 0, 0, 1u);
}

void PCSettingsSetClassPollInterval(int a1, int a2)
{
  int valuePtr = a2;
  if (a1)
  {
    CFStringRef v3 = [[PCDistributedLock alloc] initWithName:@"com.apple.persistentconnection.settings.lock"];
    [(PCDistributedLock *)v3 lock];
    if (registerForPCPrefChanges_onceToken != -1) {
      dispatch_once(&registerForPCPrefChanges_onceToken, &__block_literal_global_2);
    }
    loadPCPrefsIfNeeded(0, a1 == 1);
    if (a1 == 1) {
      CFStringRef Copy = CFStringCreateCopy(0, @"com.apple.persistentconnection-mcc");
    }
    else {
      CFStringRef Copy = 0;
    }
    CFNumberRef v5 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    CFPreferencesSetValue(@"PCDefaultPollInterval", v5, Copy, @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    CFRelease(v5);
    synchronizeAndNotify(Copy);
    CFRelease(Copy);
    [(PCDistributedLock *)v3 unlock];
  }
}

uint64_t PCSettingsGetPollInterval(uint64_t a1, const __CFString *a2)
{
  int v2 = a1;
  if (PCSettingsGetStyle(a1, a2) == 2) {
    return 0xFFFFFFFFLL;
  }
  return PCSettingsGetClassPollInterval(v2);
}

uint64_t PCSettingsGetStyle(uint64_t result, const __CFString *a2)
{
  if (result)
  {
    int v2 = result;
    if (a2)
    {
      result = (uint64_t)_PCSettingsGetStyle(result, a2);
      if (result == 1)
      {
LABEL_7:
        if ((int)PCSettingsGetClassPollInterval(v2) >= 0) {
          return 1;
        }
        else {
          return 2;
        }
      }
      if (result) {
        return result;
      }
    }
    if (PCSettingsGetClassPushEnabled(v2)) {
      return 0;
    }
    goto LABEL_7;
  }
  return result;
}

CFNumberRef _PCSettingsGetStyle(int a1, const __CFString *a2)
{
  if (!a2)
  {
    CFBooleanRef v10 = [MEMORY[0x1E4F28B00] currentHandler];
    CFTypeID v11 = objc_msgSend(NSString, "stringWithUTF8String:", "PCConnectionStyle _PCSettingsGetStyle(PCConnectionClassType, CFStringRef)");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, @"PCSettings.m", 314, @"%s requires a non-NULL serviceIdentifier", "PCConnectionStyle _PCSettingsGetStyle(PCConnectionClassType, CFStringRef)");
  }
  if (registerForPCPrefChanges_onceToken != -1) {
    dispatch_once(&registerForPCPrefChanges_onceToken, &__block_literal_global_2);
  }
  loadPCPrefsIfNeeded(a1 == 0, a1 == 1);
  CFDictionaryRef v4 = (const __CFDictionary *)copyServiceIdentifierDictionary(a1, a2);
  if (!v4) {
    return 0;
  }
  CFDictionaryRef v5 = v4;
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v4, @"PCStyle");
  CFNumberRef v7 = Value;
  if (Value)
  {
    CFTypeID v8 = CFGetTypeID(Value);
    if (v8 == CFNumberGetTypeID())
    {
      uint64_t valuePtr = 0;
      CFNumberGetValue(v7, kCFNumberLongType, &valuePtr);
      CFNumberRef v7 = (const __CFNumber *)valuePtr;
    }
    else
    {
      CFNumberRef v7 = 0;
    }
  }
  CFRelease(v5);
  return v7;
}

CFPropertyListRef copyServiceIdentifierDictionary(int a1, const __CFString *a2)
{
  if (registerForPCPrefChanges_onceToken != -1) {
    dispatch_once(&registerForPCPrefChanges_onceToken, &__block_literal_global_2);
  }
  loadPCPrefsIfNeeded(a1 == 0, a1 == 1);
  MutableCFStringRef Copy = CFStringCreateMutableCopy(0, 0, @"PCServiceIdentifier-");
  CFStringAppend(MutableCopy, a2);
  if (!a1)
  {
    CFStringRef v6 = @"com.apple.persistentconnection-nosettings";
    goto LABEL_7;
  }
  CFStringRef Copy = 0;
  if (a1 == 1)
  {
    CFStringRef v6 = @"com.apple.persistentconnection-mcc";
LABEL_7:
    CFStringRef Copy = CFStringCreateCopy(0, v6);
  }
  CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  CFPropertyListRef v8 = CFPreferencesCopyValue(MutableCopy, Copy, @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  CFPropertyListRef v9 = v8;
  if (a1 == 1 && !v8)
  {
    CFStringRef v10 = CFStringCreateCopy(0, @"com.apple.persistentconnection");
    CFPropertyListRef v9 = CFPreferencesCopyValue(MutableCopy, v10, @"mobile", v7);
    CFRelease(v10);
  }
  CFRelease(MutableCopy);
  if (v9)
  {
    CFTypeID v11 = CFGetTypeID(v9);
    if (v11 != CFDictionaryGetTypeID())
    {
      CFRelease(v9);
      CFPropertyListRef v9 = 0;
    }
  }
  CFRelease(Copy);
  return v9;
}

void PCSettingsSetStyle(int a1, const __CFString *a2, int a3)
{
  int valuePtr = a3;
  if (a1)
  {
    CFDictionaryRef v5 = [[PCDistributedLock alloc] initWithName:@"com.apple.persistentconnection.settings.lock"];
    [(PCDistributedLock *)v5 lock];
    if (registerForPCPrefChanges_onceToken != -1) {
      dispatch_once(&registerForPCPrefChanges_onceToken, &__block_literal_global_2);
    }
    loadPCPrefsIfNeeded(0, a1 == 1);
    CFNumberRef v6 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    setServiceIdentifierKeyAndValue(a1, a2, @"PCStyle", v6);
    CFRelease(v6);
    [(PCDistributedLock *)v5 unlock];
  }
}

void setServiceIdentifierKeyAndValue(int a1, const __CFString *a2, const void *a3, const void *a4)
{
  if (registerForPCPrefChanges_onceToken != -1) {
    dispatch_once(&registerForPCPrefChanges_onceToken, &__block_literal_global_2);
  }
  loadPCPrefsIfNeeded(0, a1 == 1);
  CFDictionaryRef v8 = (const __CFDictionary *)copyServiceIdentifierDictionary(a1, a2);
  if (v8)
  {
    CFDictionaryRef v9 = v8;
    MutableCFStringRef Copy = CFDictionaryCreateMutableCopy(0, 0, v8);
    CFRelease(v9);
  }
  else
  {
    MutableCFStringRef Copy = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  }
  CFDictionarySetValue(MutableCopy, a3, a4);
  if (registerForPCPrefChanges_onceToken != -1) {
    dispatch_once(&registerForPCPrefChanges_onceToken, &__block_literal_global_2);
  }
  loadPCPrefsIfNeeded(0, a1 == 1);
  if (!a1)
  {
    CFStringRef v11 = @"com.apple.persistentconnection-nosettings";
    goto LABEL_12;
  }
  if (a1 == 1)
  {
    CFStringRef v11 = @"com.apple.persistentconnection-mcc";
LABEL_12:
    CFStringRef Copy = CFStringCreateCopy(0, v11);
    goto LABEL_14;
  }
  CFStringRef Copy = 0;
LABEL_14:
  CFMutableStringRef v13 = CFStringCreateMutableCopy(0, 0, @"PCServiceIdentifier-");
  CFStringAppend(v13, a2);
  CFStringRef v14 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  CFPropertyListRef v15 = CFPreferencesCopyValue(v13, Copy, @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  if (v15)
  {
    v16 = v15;
    if (!CFEqual(v15, MutableCopy))
    {
      CFPreferencesSetValue(v13, MutableCopy, Copy, @"mobile", v14);
      synchronizeAndNotify(Copy);
    }
    CFRelease(v16);
  }
  else
  {
    CFPreferencesSetValue(v13, MutableCopy, Copy, @"mobile", v14);
    synchronizeAndNotify(Copy);
  }
  CFRelease(Copy);
  CFRelease(v13);
  CFRelease(MutableCopy);
}

void PCSettingsSetDefaultStyle(int a1, const __CFString *a2, int a3)
{
  int valuePtr = a3;
  if (a1)
  {
    CFDictionaryRef v5 = [[PCDistributedLock alloc] initWithName:@"com.apple.persistentconnection.settings.lock"];
    [(PCDistributedLock *)v5 lock];
    if (registerForPCPrefChanges_onceToken != -1) {
      dispatch_once(&registerForPCPrefChanges_onceToken, &__block_literal_global_2);
    }
    loadPCPrefsIfNeeded(0, a1 == 1);
    CFDictionaryRef v6 = (const __CFDictionary *)copyServiceIdentifierDictionary(a1, a2);
    if (v6)
    {
      CFNumberRef v7 = v6;
      if (!CFDictionaryContainsKey(v6, @"PCStyle"))
      {
        CFNumberRef v8 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
        setServiceIdentifierKeyAndValue(a1, a2, @"PCStyle", v8);
        CFRelease(v8);
      }
    }
    else
    {
      CFNumberRef v7 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
      setServiceIdentifierKeyAndValue(a1, a2, @"PCStyle", v7);
    }
    CFRelease(v7);
    [(PCDistributedLock *)v5 unlock];
  }
}

void PCSettingsPurgeDictionariesExceptForCurrent(int a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    CFDictionaryRef v4 = [[PCDistributedLock alloc] initWithName:@"com.apple.persistentconnection.settings.lock"];
    [(PCDistributedLock *)v4 lock];
    if (a1 == 1) {
      CFStringRef Copy = CFStringCreateCopy(0, @"com.apple.persistentconnection-mcc");
    }
    else {
      CFStringRef Copy = 0;
    }
    v19 = v4;
    if (registerForPCPrefChanges_onceToken != -1) {
      dispatch_once(&registerForPCPrefChanges_onceToken, &__block_literal_global_2);
    }
    loadPCPrefsIfNeeded(0, a1 == 1);
    CFStringRef applicationID = Copy;
    CFStringRef hostName = (const __CFString *)*MEMORY[0x1E4F1D3C8];
    CFArrayRef v6 = CFPreferencesCopyKeyList(Copy, @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    theArray = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
    CFIndex Length = CFStringGetLength(@"PCServiceIdentifier-");
    context = (void *)MEMORY[0x1D94354F0]();
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    CFArrayRef v8 = v6;
    uint64_t v9 = [(__CFArray *)v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          CFMutableStringRef v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if ([v13 hasPrefix:@"PCServiceIdentifier-"])
          {
            CFStringRef v14 = [v13 substringFromIndex:Length];
            char v15 = [a2 containsObject:v14];

            if ((v15 & 1) == 0) {
              CFArrayAppendValue(theArray, v13);
            }
          }
        }
        uint64_t v10 = [(__CFArray *)v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v10);
    }

    if (CFArrayGetCount(theArray) >= 1)
    {
      CFPreferencesSetMultiple(0, theArray, applicationID, @"mobile", hostName);
      CFPreferencesAppSynchronize(applicationID);
    }
    if (v8) {
      CFRelease(v8);
    }
    CFRelease(theArray);
    CFRelease(applicationID);
    [(PCDistributedLock *)v19 unlock];
  }
}

uint64_t PCSettingsGetGlobalMCCForceManualWhenRoaming()
{
  if (registerForPCPrefChanges_onceToken != -1) {
    dispatch_once(&registerForPCPrefChanges_onceToken, &__block_literal_global_2);
  }
  loadPCPrefsIfNeeded(0, 1);
  CFStringRef Copy = CFStringCreateCopy(0, @"com.apple.persistentconnection-mcc");
  CFBooleanRef v1 = (const __CFBoolean *)CFPreferencesCopyValue(@"PCForceManualWhenRoaming", Copy, @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  if (v1)
  {
    CFBooleanRef v2 = v1;
    CFTypeID v3 = CFGetTypeID(v1);
    if (v3 == CFBooleanGetTypeID()) {
      uint64_t Value = CFBooleanGetValue(v2);
    }
    else {
      uint64_t Value = 0;
    }
    CFRelease(v2);
  }
  else
  {
    uint64_t Value = 0;
  }
  CFRelease(Copy);
  return Value;
}

void PCSettingsSetGlobalMCCForceManualWhenRoaming(int a1)
{
  CFDictionaryRef v4 = [[PCDistributedLock alloc] initWithName:@"com.apple.persistentconnection.settings.lock"];
  [(PCDistributedLock *)v4 lock];
  if (registerForPCPrefChanges_onceToken != -1) {
    dispatch_once(&registerForPCPrefChanges_onceToken, &__block_literal_global_2);
  }
  loadPCPrefsIfNeeded(0, 1);
  CFStringRef Copy = CFStringCreateCopy(0, @"com.apple.persistentconnection-mcc");
  CFTypeID v3 = (CFPropertyListRef *)MEMORY[0x1E4F1CFD0];
  if (!a1) {
    CFTypeID v3 = (CFPropertyListRef *)MEMORY[0x1E4F1CFC8];
  }
  CFPreferencesSetValue(@"PCForceManualWhenRoaming", *v3, Copy, @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  synchronizeAndNotify(Copy);
  CFRelease(Copy);
  [(PCDistributedLock *)v4 unlock];
}

CFBooleanRef PCSettingsGetForceManualWhenRoamingForMCCAccount(const __CFString *a1)
{
  if (registerForPCPrefChanges_onceToken != -1) {
    dispatch_once(&registerForPCPrefChanges_onceToken, &__block_literal_global_2);
  }
  loadPCPrefsIfNeeded(0, 1);
  CFDictionaryRef v2 = (const __CFDictionary *)copyServiceIdentifierDictionary(1, a1);
  if (!v2) {
    return 0;
  }
  CFDictionaryRef v3 = v2;
  CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(v2, @"PCForceManualWhenRoaming");
  CFBooleanRef v5 = Value;
  if (Value)
  {
    CFTypeID v6 = CFGetTypeID(Value);
    if (v6 == CFBooleanGetTypeID()) {
      CFBooleanRef v5 = (const __CFBoolean *)(CFBooleanGetValue(v5) != 0);
    }
    else {
      CFBooleanRef v5 = 0;
    }
  }
  CFRelease(v3);
  return v5;
}

void PCSettingsSetForceManualWhenRoamingForMCCAccount(const __CFString *a1, int a2)
{
  CFBooleanRef v5 = [[PCDistributedLock alloc] initWithName:@"com.apple.persistentconnection.settings.lock"];
  [(PCDistributedLock *)v5 lock];
  if (registerForPCPrefChanges_onceToken != -1) {
    dispatch_once(&registerForPCPrefChanges_onceToken, &__block_literal_global_2);
  }
  loadPCPrefsIfNeeded(0, 1);
  CFDictionaryRef v4 = (const void **)MEMORY[0x1E4F1CFD0];
  if (!a2) {
    CFDictionaryRef v4 = (const void **)MEMORY[0x1E4F1CFC8];
  }
  setServiceIdentifierKeyAndValue(1, a1, @"PCForceManualWhenRoaming", *v4);
  [(PCDistributedLock *)v5 unlock];
}

void _PCPrefsChangedNotification()
{
  v0 = PCPrefsQueue();
  dispatch_sync(v0, &__block_literal_global_50);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"PCPreferencesDidChangeNotification", 0, 0, 1u);
}

void __setPCPrefsNeedLoad_block_invoke()
{
  PCPrefsNeedLoading = 1;
  PCPrefsNeedLoadingConnectionClassNoSettings = 1;
  PCPrefsNeedLoadingConnectionClassMailContactsCalendars = 1;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x12u);
}

uint64_t __PCStringFromDate_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  CFBooleanRef v1 = (void *)PCStringFromDate_formatter;
  PCStringFromDate_formatter = (uint64_t)v0;

  CFDictionaryRef v2 = (void *)PCStringFromDate_formatter;
  return [v2 setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
}

id PCSharedSerialQueue()
{
  if (PCSharedSerialQueue_onceToken != -1) {
    dispatch_once(&PCSharedSerialQueue_onceToken, &__block_literal_global_6);
  }
  id v0 = (void *)PCSharedSerialQueue_sQueue;
  return v0;
}

uint64_t __PCSharedSerialQueue_block_invoke()
{
  PCSharedSerialQueue_sQueue = (uint64_t)dispatch_queue_create("PCSharedSerialQueue", 0);
  return MEMORY[0x1F41817F8]();
}

NSObject *PCCreateQueue(const char *a1)
{
  CFBooleanRef v1 = dispatch_queue_create(a1, 0);
  CFDictionaryRef v2 = PCSharedSerialQueue();
  dispatch_set_target_queue(v1, v2);

  return v1;
}

void *PCWeakLinkSymbol(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _PCDLHandleForLibrary_onceToken;
  id v5 = a1;
  if (v4 != -1) {
    dispatch_once(&_PCDLHandleForLibrary_onceToken, &__block_literal_global_9);
  }
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  CFTypeID v6 = _PCDLHandleForLibrary_queue;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  char v15 = ___PCDLHandleForLibrary_block_invoke_2;
  v16 = &unk_1E698E078;
  id v17 = v3;
  v18 = &v19;
  id v7 = v3;
  dispatch_sync(v6, &v13);
  CFArrayRef v8 = (void *)v20[3];

  _Block_object_dispose(&v19, 8);
  id v9 = v5;
  uint64_t v10 = (const char *)objc_msgSend(v9, "UTF8String", v13, v14, v15, v16);

  uint64_t v11 = dlsym(v8, v10);
  return v11;
}

void sub_1D3423C20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void _dynamicStoreCallback(uint64_t a1, void *a2, void *a3)
{
  id v5 = (void *)MEMORY[0x1D94354F0]();
  id v6 = a2;
  id v7 = [a3 object];
  [v7 _dynamicStoreCallbackForKeys:v6];
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

void __ServerConnectionCallback(uint64_t a1, const void *a2, uint64_t a3, void *a4)
{
  id v7 = (void *)MEMORY[0x1D94354F0]();
  CFArrayRef v8 = [a4 object];
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x1E4F23B38])) {
    [v8 _processCallStatusChanged:a3];
  }
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

void sub_1D3427674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1D34289F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3428A70(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3428C4C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3428E74(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3429098(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D34292BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D34298D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3429A64(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3429BB8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3429C4C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D3429DC4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

double PCScheduledWakeRTCPrecision()
{
  if (PCScheduledWakeRTCPrecision_onceToken != -1) {
    dispatch_once(&PCScheduledWakeRTCPrecision_onceToken, &__block_literal_global_9);
  }
  return *(double *)&PCScheduledWakeRTCPrecision_scheduledWakeRTCPrecision;
}

void __PCScheduledWakeRTCPrecision_block_invoke()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  Boolean keyExistsAndHasValidFormat = 0;
  id v0 = (__CFString *)[[NSString alloc] initWithFormat:@"/var/mobile/Library/Preferences/%@", @"com.apple.persistentconnection"];
  AppIntegerCFBooleanRef Value = CFPreferencesGetAppIntegerValue(@"PCScheduledWakeRTCPrecisionOverride", v0, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v2 = AppIntegerValue < 1;
  }
  else {
    BOOL v2 = 1;
  }
  if (!v2)
  {
    double v3 = (double)AppIntegerValue;
    uint64_t v4 = +[PCLog timer];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v7 = @"PCScheduledWakeRTCPrecisionOverride";
      __int16 v8 = 2048;
      double v9 = v3;
      _os_log_impl(&dword_1D340D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ set. Setting PCScheduledWakeRTCPrecision to %g seconds.", buf, 0x16u);
    }

    PCScheduledWakeRTCPrecision_scheduledWakeRTCPrecision = *(void *)&v3;
  }
}

void sub_1D342A774(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D342ACAC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D342AF20(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D342AFA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1D342B018(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1D342B080(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void __PCShouldUseSystemActivityAssertion_block_invoke()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  Boolean keyExistsAndHasValidFormat = 0;
  id v0 = (__CFString *)[[NSString alloc] initWithFormat:@"/var/mobile/Library/Preferences/%@", @"com.apple.persistentconnection"];
  AppBooleanCFBooleanRef Value = CFPreferencesGetAppBooleanValue(@"PCShouldUseSystemActivityAssertion", v0, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    int v2 = AppBooleanValue;
    double v3 = +[PCLog timer];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = @"YES";
      if (!v2) {
        uint64_t v4 = @"NO";
      }
      *(_DWORD *)buf = 138543618;
      id v7 = @"PCShouldUseSystemActivityAssertion";
      __int16 v8 = 2114;
      double v9 = v4;
      _os_log_impl(&dword_1D340D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ set. Setting PCShouldUseSystemActivityAssertion to %{public}@.", buf, 0x16u);
    }

    PCShouldUseSystemActivityAssertion_shouldUse = v2 != 0;
  }
}

void _powerChangedHandler(uint64_t a1, uint64_t a2, int a3, intptr_t a4)
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__1;
  uint64_t v19 = __Block_byref_object_dispose__1;
  id v20 = 0;
  id v6 = _GetPowerMonitoringQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___powerChangedHandler_block_invoke;
  block[3] = &unk_1E698E2A8;
  void block[4] = &v15;
  dispatch_sync(v6, block);

  HIDWORD(v7) = a3;
  LODWORD(v7) = a3 + 536870288;
  switch((v7 >> 4))
  {
    case 0u:
      uint64_t v10 = +[PCLog timer];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl(&dword_1D340D000, v10, OS_LOG_TYPE_DEFAULT, "System can sleep query received: kIOMessageCanSystemSleep", v13, 2u);
      }

      goto LABEL_18;
    case 1u:
      CFNumberRef v12 = +[PCLog timer];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl(&dword_1D340D000, v12, OS_LOG_TYPE_DEFAULT, "System will sleep: kIOMessageSystemWillSleep", v13, 2u);
      }

      _CallTimersWithSelector((void *)v16[5], (uint64_t)sel__powerNotificationSleepIsImminent);
LABEL_18:
      IOAllowPowerChange(sPMConnection, a4);
      goto LABEL_19;
    case 2u:
    case 9u:
      if (a3 == -536870256)
      {
        __int16 v8 = +[PCLog timer];
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_14;
        }
        *(_WORD *)uint64_t v13 = 0;
        double v9 = "System will not sleep: kIOMessageSystemWillNotSleep";
      }
      else
      {
        __int16 v8 = +[PCLog timer];
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_14;
        }
        *(_WORD *)uint64_t v13 = 0;
        double v9 = "System woke: kIOMessageSystemHasPoweredOn";
      }
      _os_log_impl(&dword_1D340D000, v8, OS_LOG_TYPE_DEFAULT, v9, v13, 2u);
LABEL_14:

      _CallTimersWithSelector((void *)v16[5], (uint64_t)sel__powerNotificationSleepIsNotImminent);
LABEL_19:
      _Block_object_dispose(&v15, 8);

      return;
    case 0xBu:
      uint64_t v11 = +[PCLog timer];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl(&dword_1D340D000, v11, OS_LOG_TYPE_DEFAULT, "System is waking: kIOMessageSystemWillPowerOn", v13, 2u);
      }

      goto LABEL_19;
    default:
      goto LABEL_19;
  }
}

void sub_1D342B658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

uint64_t ___powerChangedHandler_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [(id)sPowerMonitoringTimers copy];
  return MEMORY[0x1F41817F8]();
}

void _CallTimersWithSelector(void *a1, uint64_t a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = a1;
  uint64_t v3 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(obj);
        }
        unint64_t v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        __int16 v8 = (void *)MEMORY[0x1D94354F0]();
        double v9 = [v7 _getTimerRunLoop];
        uint64_t v10 = [v7 _getTimerMode];
        uint64_t v11 = (void *)v10;
        if (v9) {
          BOOL v12 = v10 == 0;
        }
        else {
          BOOL v12 = 1;
        }
        if (v12)
        {
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = ___CallTimersWithSelector_block_invoke;
          v15[3] = &unk_1E698E168;
          v15[4] = v7;
          v15[5] = a2;
          [v7 _performBlockOnQueue:v15];
        }
        else
        {
          uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObject:v10];
          [v9 performSelector:a2 target:v7 argument:0 order:0 modes:v13];

          CFRunLoopWakeUp((CFRunLoopRef)[v9 getCFRunLoop]);
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }
}

uint64_t pcdeprecated_CTServerConnectionHandleReply()
{
  return MEMORY[0x1F40DF180]();
}

void sub_1D342BB40(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9730](data, *(void *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1F40D7968](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D79A8](allocator, capacity, theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFArrayRef)MEMORY[0x1F40D7EB8](applicationID, userName, hostName);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE8](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetMultiple(CFDictionaryRef keysToSet, CFArrayRef keysToRemove, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B8]();
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1F40D8210](allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x1F40D8220](theSet);
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1F40D83F0](alloc, theString);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8410](alloc, maxLength, theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

uint64_t CTCallGetCallSubType()
{
  return MEMORY[0x1F40DEF30]();
}

uint64_t CUTWeakLinkClass()
{
  return MEMORY[0x1F4112A70]();
}

uint64_t CUTWeakLinkSymbol()
{
  return MEMORY[0x1F4112A78]();
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x1F40E8678](*(void *)&kernelPort, notificationID);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return MEMORY[0x1F40E8778](notifier);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

IOReturn IOPMAssertionCreateWithDescription(CFStringRef AssertionType, CFStringRef Name, CFStringRef Details, CFStringRef HumanReadableReason, CFStringRef LocalizationBundlePath, CFTimeInterval Timeout, CFStringRef TimeoutAction, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x1F40E8F70](AssertionType, Name, Details, HumanReadableReason, LocalizationBundlePath, TimeoutAction, AssertionID, Timeout);
}

IOReturn IOPMAssertionCreateWithName(CFStringRef AssertionType, IOPMAssertionLevel AssertionLevel, CFStringRef AssertionName, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x1F40E8F78](AssertionType, *(void *)&AssertionLevel, AssertionName, AssertionID);
}

uint64_t IOPMAssertionDeclareSystemActivity()
{
  return MEMORY[0x1F40E8F90]();
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x1F40E8FA8](*(void *)&AssertionID);
}

IOReturn IOPMCancelScheduledPowerEvent(CFDateRef time_to_wake, CFStringRef my_id, CFStringRef type)
{
  return MEMORY[0x1F40E8FC0](time_to_wake, my_id, type);
}

CFArrayRef IOPMCopyScheduledPowerEvents(void)
{
  return (CFArrayRef)MEMORY[0x1F40E9018]();
}

uint64_t IOPMRequestSysWake()
{
  return MEMORY[0x1F40E9050]();
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return MEMORY[0x1F40E9148](refcon, thePortRef, callback, notifier);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1F40E9240](*(void *)&connect);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

void NSLog(NSString *format, ...)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x1F4101DA8](store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x1F4101DB0](allocator, name, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterfaceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef ifname, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x1F4101DE8](allocator, domain, ifname, entity);
}

Boolean SCDynamicStoreSetDispatchQueue(SCDynamicStoreRef store, dispatch_queue_t queue)
{
  return MEMORY[0x1F4101E08](store, queue);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return MEMORY[0x1F4101E18](store, keys, patterns);
}

SCPreferencesRef SCPreferencesCreateWithAuthorization(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID, AuthorizationRef authorization)
{
  return (SCPreferencesRef)MEMORY[0x1F4102000](allocator, name, prefsID, authorization);
}

CFPropertyListRef SCPreferencesGetValue(SCPreferencesRef prefs, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x1F4102010](prefs, key);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CTServerConnectionCreate()
{
  return MEMORY[0x1F40DF0B0]();
}

uint64_t _CTServerConnectionCreateOnTargetQueue()
{
  return MEMORY[0x1F40DF0C8]();
}

uint64_t _CTServerConnectionGetCDRXWithLTEState()
{
  return MEMORY[0x1F40DF110]();
}

uint64_t _CTServerConnectionRegisterForNotification()
{
  return MEMORY[0x1F40DF1D0]();
}

uint64_t _CTServerConnectionSetTargetQueue()
{
  return MEMORY[0x1F40DF218]();
}

uint64_t _CTServerConnectionUnregisterForNotification()
{
  return MEMORY[0x1F40DF238]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
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

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CB3A0](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
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
  return MEMORY[0x1F40CBD30](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1F40CD058](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1F40CD088](*(void *)&token, state64);
}

uint64_t nw_interface_copy_delegate_interface()
{
  return MEMORY[0x1F40F3228]();
}

uint32_t nw_interface_get_index(nw_interface_t interface)
{
  return MEMORY[0x1F40F3240](interface);
}

const char *__cdecl nw_interface_get_name(nw_interface_t interface)
{
  return (const char *)MEMORY[0x1F40F3248](interface);
}

uint64_t nw_interface_shallow_compare()
{
  return MEMORY[0x1F40F3278]();
}

nw_parameters_t nw_parameters_create(void)
{
  return (nw_parameters_t)MEMORY[0x1F40F3488]();
}

uint64_t nw_parameters_set_allow_ultra_constrained()
{
  return MEMORY[0x1F40F35B0]();
}

uint64_t nw_parameters_set_prohibited_interface_subtypes()
{
  return MEMORY[0x1F40F3708]();
}

uint64_t nw_parameters_set_prohibited_interface_types()
{
  return MEMORY[0x1F40F3710]();
}

void nw_parameters_set_required_interface_type(nw_parameters_t parameters, nw_interface_type_t interface_type)
{
}

uint64_t nw_path_copy_interface()
{
  return MEMORY[0x1F40F3828]();
}

uint64_t nw_path_create_evaluator_for_endpoint()
{
  return MEMORY[0x1F40F3858]();
}

uint64_t nw_path_evaluator_cancel()
{
  return MEMORY[0x1F40F3878]();
}

uint64_t nw_path_evaluator_copy_path()
{
  return MEMORY[0x1F40F3880]();
}

uint64_t nw_path_evaluator_set_update_handler()
{
  return MEMORY[0x1F40F38B0]();
}

uint64_t nw_path_get_reason_description()
{
  return MEMORY[0x1F40F3928]();
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x1F40F3938](path);
}

uint64_t nw_path_is_ultra_constrained()
{
  return MEMORY[0x1F40F3990]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1F4181B28](sel);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEA30](objects, count);
}

void xpc_array_set_uint64(xpc_object_t xarray, size_t index, uint64_t value)
{
}