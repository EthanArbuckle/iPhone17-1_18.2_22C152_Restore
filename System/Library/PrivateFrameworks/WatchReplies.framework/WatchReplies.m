id WRBundle()
{
  void *v0;
  uint64_t vars8;

  if (WRBundle_onceToken != -1) {
    dispatch_once(&WRBundle_onceToken, &__block_literal_global);
  }
  v0 = (void *)WRBundle_sWRBundle;

  return v0;
}

uint64_t __WRBundle_block_invoke()
{
  WRBundle_sWRBundle = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.WatchReplies"];

  return MEMORY[0x270F9A758]();
}

void sub_22A5E4084(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id WRLocalizedCategoryString(void *a1, unint64_t a2, void *a3)
{
  if (a2 > 9) {
    v4 = 0;
  }
  else {
    v4 = off_2648810F0[a2];
  }
  v5 = (void *)MEMORY[0x263F086E0];
  id v6 = a3;
  id v7 = a1;
  v8 = [v5 bundleWithIdentifier:@"com.apple.WatchReplies"];
  v9 = WRLocalizedStringForLanguage(v6, v7, v4, v8);

  return v9;
}

id WRDeviceLanguage()
{
  v0 = (void *)MEMORY[0x263EFF960];
  v1 = [MEMORY[0x263EFF960] currentLocale];
  v2 = [v1 localeIdentifier];
  v3 = [v0 canonicalLanguageIdentifierFromString:v2];

  return v3;
}

id WRLocalizedStringForLanguage(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v7 = a1;
  id v8 = a2;
  v9 = a3;
  id v10 = a4;
  v11 = WRDeviceLanguage();
  if (![(__CFString *)v7 length])
  {
    v12 = v11;

    id v7 = v12;
  }
  if ([(__CFString *)v9 length])
  {
    if (v10) {
      goto LABEL_5;
    }
  }
  else
  {

    v9 = @"Localizable";
    if (v10) {
      goto LABEL_5;
    }
  }
  id v10 = [MEMORY[0x263F086E0] mainBundle];
LABEL_5:
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v31 = [v8 UTF8String];
    uint64_t v32 = [(__CFString *)v7 UTF8String];
    uint64_t v33 = [(__CFString *)v9 UTF8String];
    id v34 = [v10 bundleIdentifier];
    *(_DWORD *)buf = 136315906;
    uint64_t v37 = v31;
    __int16 v38 = 2080;
    uint64_t v39 = v32;
    __int16 v40 = 2080;
    uint64_t v41 = v33;
    __int16 v42 = 2080;
    uint64_t v43 = [v34 UTF8String];
    _os_log_debug_impl(&dword_22A5E2000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "#quickboard Lookup '%s' in %s, table: %s bundle: %s", buf, 0x2Au);
  }
  if ([(__CFString *)v7 isEqualToString:v11]) {
    goto LABEL_33;
  }
  if ([(__CFString *)v7 isEqualToString:@"zh-Hant"]
    && ([MEMORY[0x263EFF960] currentLocale],
        v13 = objc_claimAutoreleasedReturnValue(),
        [v13 objectForKey:*MEMORY[0x263EFF4D0]],
        v14 = objc_claimAutoreleasedReturnValue(),
        int v15 = [v14 isEqualToString:@"HK"],
        v14,
        v13,
        v15))
  {

    id v7 = @"zh-HK";
  }
  else if (!v7)
  {
    goto LABEL_21;
  }
  v16 = [MEMORY[0x263EFF960] canonicalLocaleIdentifierFromString:v7];
  if (v16)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      WRLocalizedStringForLanguage_cold_4(v16);
    }
    v17 = [v10 localizations];
    v35 = v16;
    v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v35 count:1];
    v19 = [MEMORY[0x263F086E0] preferredLocalizationsFromArray:v17 forPreferences:0];
    v20 = [v18 arrayByAddingObjectsFromArray:v19];

    v21 = [MEMORY[0x263EFF960] mostPreferredLanguageOf:v17 withPreferredLanguages:v20 forUsage:1 options:1];

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      WRLocalizedStringForLanguage_cold_3(v21);
    }

    id v7 = v21;
  }

LABEL_21:
  if (WRLocalizedStringForLanguage_onceToken != -1) {
    dispatch_once(&WRLocalizedStringForLanguage_onceToken, &__block_literal_global_0);
  }
  v22 = NSString;
  v23 = [v10 bundleIdentifier];
  v24 = [v22 stringWithFormat:@"%@%@%@", v23, v7, v9];

  v25 = [(id)WRLocalizedStringForLanguage_stringTablesCache objectForKey:v24];
  if (!v25)
  {
    v26 = @"Localizable";
    if (v9) {
      v26 = v9;
    }
    v27 = v26;
    v28 = [v10 pathForResource:v27 ofType:@"strings" inDirectory:0 forLocalization:v7];
    v25 = [NSDictionary dictionaryWithContentsOfFile:v28];
    if ([v25 count])
    {
      [(id)WRLocalizedStringForLanguage_stringTablesCache setObject:v25 forKey:v24];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
        WRLocalizedStringForLanguage_cold_2(v27, v28);
      }
    }
  }
  v29 = [v25 objectForKey:v8];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    WRLocalizedStringForLanguage_cold_1((uint64_t)v25, v29);
  }

  if (!v29)
  {
LABEL_33:
    v29 = [v10 localizedStringForKey:v8 value:0 table:v9];
  }

  return v29;
}

uint64_t __WRLocalizedStringForLanguage_block_invoke()
{
  WRLocalizedStringForLanguage_stringTablesCache = (uint64_t)objc_alloc_init(MEMORY[0x263EFF8E0]);

  return MEMORY[0x270F9A758]();
}

uint64_t _WRCannedRepliesStore_handleStoreChange(uint64_t a1, void *a2)
{
  return [a2 handleStoreChange];
}

void sub_22A5E5C68(_Unwind_Exception *exc_buf, int a2)
{
  if (a2)
  {
    objc_begin_catch(exc_buf);
    JUMPOUT(0x22A5E5BFCLL);
  }
  _Unwind_Resume(exc_buf);
}

void sub_22A5E5EBC(_Unwind_Exception *exc_buf, int a2)
{
  if (a2)
  {
    objc_begin_catch(exc_buf);
    JUMPOUT(0x22A5E5E54);
  }
  _Unwind_Resume(exc_buf);
}

void sub_22A5E67BC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  objc_begin_catch(a1);
  JUMPOUT(0x22A5E66ECLL);
}

void sub_22A5E6B08(_Unwind_Exception *exc_buf, int a2)
{
  if (a2)
  {
    objc_begin_catch(exc_buf);
    JUMPOUT(0x22A5E6AB8);
  }
  _Unwind_Resume(exc_buf);
}

void WRLocalizedStringForLanguage_cold_1(uint64_t a1, id a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (a1) {
    v2 = "Has";
  }
  else {
    v2 = "No";
  }
  int v3 = 136315394;
  v4 = v2;
  __int16 v5 = 2080;
  uint64_t v6 = [a2 UTF8String];
  _os_log_debug_impl(&dword_22A5E2000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "#quickboard %s table, found: %s", (uint8_t *)&v3, 0x16u);
}

void WRLocalizedStringForLanguage_cold_2(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 136315394;
  uint64_t v4 = [a1 UTF8String];
  __int16 v5 = 2080;
  uint64_t v6 = [a2 UTF8String];
  _os_log_debug_impl(&dword_22A5E2000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "#quickboard Cached table %s at path %s", (uint8_t *)&v3, 0x16u);
}

void WRLocalizedStringForLanguage_cold_3(void *a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = [a1 UTF8String];
  _os_log_debug_impl(&dword_22A5E2000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "#quickboard Preferred language %s", (uint8_t *)&v1, 0xCu);
}

void WRLocalizedStringForLanguage_cold_4(void *a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = [a1 UTF8String];
  _os_log_debug_impl(&dword_22A5E2000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "#quickboard Cannonical language %s", (uint8_t *)&v1, 0xCu);
}

uint64_t BPSAccessoryColor()
{
  return MEMORY[0x270F12818]();
}

uint64_t BPSAccessoryHighlightColor()
{
  return MEMORY[0x270F12820]();
}

uint64_t BPSBridgeTintColor()
{
  return MEMORY[0x270F12828]();
}

uint64_t BPSDeviceHasCapabilityForString()
{
  return MEMORY[0x270F12838]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
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

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

void objc_terminate(void)
{
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