void sub_21EF0A1E4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id defaultLogHandle()
{
  if (defaultLogHandle_once != -1) {
    dispatch_once(&defaultLogHandle_once, &__block_literal_global_2);
  }
  v0 = (void *)defaultLogHandle_defaultLogObj;
  return v0;
}

uint64_t __defaultLogHandle_block_invoke()
{
  defaultLogHandle_defaultLogObj = (uint64_t)os_log_create("com.apple.MobileStoreDemo", "Default");
  return MEMORY[0x270F9A758]();
}

void sub_21EF0A860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void sub_21EF0AC44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *safeAssignError(void *result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    v3 = result;
    result = [MEMORY[0x263F087E8] errorDomainMSDWithCode:a2 message:a3];
    void *v3 = result;
  }
  return result;
}

void *safeAssignErrorWithReason(void *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (result)
  {
    v4 = result;
    result = [MEMORY[0x263F087E8] errorDomainMSDWithCode:a2 message:a3 reason:a4];
    void *v4 = result;
  }
  return result;
}

uint64_t safeAssignErrorNoOverwrite(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a1 && !*a1)
  {
    id v8 = v5;
    id v5 = [MEMORY[0x263F087E8] errorDomainMSDWithCode:a2 message:v5];
    id v6 = v8;
    *a1 = v5;
  }
  return MEMORY[0x270F9A758](v5, v6);
}

void sub_21EF0CA20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_21EF0CAEC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EF0CCF8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EF0CDC0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EF0CE80(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id contentRootList()
{
  if (contentRootList_onceToken != -1) {
    dispatch_once(&contentRootList_onceToken, &__block_literal_global_1);
  }
  v0 = (void *)contentRootList_shared;
  return v0;
}

void __contentRootList_block_invoke()
{
  v0 = +[MSDPlatform sharedInstance];
  int v1 = [v0 watchOS];

  if (v1)
  {
    objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"/var/mobile/Demo.mov", @"/var/mobile/Demo.plist", @"/var/mobile/Media", @"/var/mobile/Library/AddressBook", @"/var/mobile/Library/Alarms", @"/var/mobile/Library/Calendar", @"/var/mobile/Library/CallHistoryDB", @"/var/mobile/Library/Carousel", @"/var/mobile/Library/Health", @"/var/mobile/Library/Maps", @"/var/mobile/Library/MapsHistory.plist", @"/var/mobile/Library/NanoMailKit", @"/var/mobile/Library/NanoMusicSync", @"/var/mobile/Library/NanoPasses", @"/var/mobile/Library/NanoPodcasts", @"/var/mobile/Library/NanoPhotos", @"/var/mobile/Library/NanoWeatherDemo",
      @"/var/mobile/Library/News",
      @"/var/mobile/Library/RetailDemo",
      @"/var/mobile/Library/Reminders",
      @"/var/mobile/Library/SMS",
      @"/var/mobile/Library/UserConfigurationProfiles",
      @"/var/mobile/Library/Preferences/.GlobalPreferences.plist",
      @"/var/mobile/Library/Preferences/.GlobalPreferences_m.plist",
      @"/var/mobile/Library/Preferences/com.apple.Accessibility.plist",
      @"/var/mobile/Library/Preferences/com.apple.ActivitySharing.plist",
      @"/var/mobile/Library/Preferences/com.apple.AppleMediaServices.plist",
      @"/var/mobile/Library/Preferences/com.apple.assistant.backedup.plist",
      @"/var/mobile/Library/Preferences/com.apple.assistant.nano.plist",
      @"/var/mobile/Library/Preferences/com.apple.assistant.support.plist",
      @"/var/mobile/Library/Preferences/com.apple.backboardd.plist",
      @"/var/mobile/Library/Preferences/com.apple.Carousel.plist",
      @"/var/mobile/Library/Preferences/com.apple.coremedia.plist",
      @"/var/mobile/Library/Preferences/com.apple.ControlCenter.plist",
      @"/var/mobile/Library/Preferences/com.apple.DeepBreathing.plist",
      @"/var/mobile/Library/Preferences/com.apple.demo-settings.plist",
      @"/var/mobile/Library/Preferences/com.apple.findmy.plist",
      @"/var/mobile/Library/Preferences/com.apple.healthd.plist",
      @"/var/mobile/Library/Preferences/com.apple.ids.plist",
      @"/var/mobile/Library/Preferences/com.apple.locationd.plist",
      @"/var/mobile/Library/Preferences/com.apple.mobileme.fmf1.plist",
      @"/var/mobile/Library/Preferences/com.apple.mobilephone.plist",
      @"/var/mobile/Library/Preferences/com.apple.mobilephone.speeddial.plist",
      @"/var/mobile/Library/Preferences/com.apple.mobiletimer.plist",
      @"/var/mobile/Library/Preferences/com.apple.nanobuddy.plist",
      @"/var/mobile/Library/Preferences/com.apple.nanolifestyle.plist",
      @"/var/mobile/Library/Preferences/com.apple.nanolifestyle.privacy.plist",
      @"/var/mobile/Library/Preferences/com.apple.NanoMediaUI.plist",
      @"/var/mobile/Library/Preferences/com.apple.NanoMusicSync.plist",
      @"/var/mobile/Library/Preferences/com.apple.nanopassbook.plist",
      @"/var/mobile/Library/Preferences/com.apple.nanophotos.plist",
      @"/var/mobile/Library/Preferences/com.apple.nanonews.sync.plist",
      @"/var/mobile/Library/Preferences/com.apple.Noise.plist",
      @"/var/mobile/Library/Preferences/com.apple.podcasts.plist",
      @"/var/mobile/Library/Preferences/com.apple.SessionTrackerApp.plist",
      @"/var/mobile/Library/Preferences/com.apple.stockholm.plist",
      @"/var/mobile/Library/Preferences/com.apple.system.prefs.plist",
      @"/var/mobile/Library/Preferences/com.apple.timed.plist",
      @"/var/mobile/Library/Preferences/com.apple.voicememod.plist",
      @"/var/mobile/Library/Preferences/group.com.apple.stocks.plist",
      @"/var/mobile/Library/Preferences/Avalon");
  }
  else
  {
    v2 = +[MSDPlatform sharedInstance];
    int v3 = [v2 tvOS];

    if (!v3) {
      return;
    }
    objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"/var/mobile/Media/DCIM", @"/var/mobile/Media/PhotoData", @"/var/mobile/Library/Preferences/com.apple.demo-settings.plist", @"/var/MobileDevice/ProvisioningProfiles", @"/var/mobile/Library/com.apple.HeadBoard/HBDemoModeAppOrder", @"/var/mobile/Library/com.apple.HeadBoard/AppOrder.plist", @"/var/mobile/Library/Preferences/.GlobalPreferences.plist", @"/var/mobile/Library/Preferences/.GlobalPreferences_m.plist", @"/var/mobile/Library/DemoLoop", 0, v4, v5, v6, v7, v8, v9, v10,
      v11,
      v12,
      v13,
      v14,
      v15,
      v16,
      v17,
      v18,
      v19,
      v20,
      v21,
      v22,
      v23,
      v24,
      v25,
      v26,
      v27,
      v28,
      v29,
      v30,
      v31,
      v32,
      v33,
      v34,
      v35,
      v36,
      v37,
      v38,
      v39,
      v40,
      v41,
      v42,
      v43,
      v44,
      v45,
      v46,
      v47,
      v48,
      v49,
      v50,
      v51,
      v52,
      v53,
      v54);
  contentRootList_shared = };
  MEMORY[0x270F9A758]();
}

id doNotExtractList()
{
  if (doNotExtractList_onceToken != -1) {
    dispatch_once(&doNotExtractList_onceToken, &__block_literal_global_250);
  }
  v0 = (void *)doNotExtractList_shared;
  return v0;
}

void __doNotExtractList_block_invoke()
{
  v0 = +[MSDPlatform sharedInstance];
  int v1 = [v0 watchOS];

  if (v1)
  {
    uint64_t v2 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"/var/mobile/Library/Caches/sharedCaches/com.apple.WatchListKit.NSURLCache", @"/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/VaryState.db-shm", @"/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/VaryState.db-wal", @"/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/VaryState.db", @"/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/Cache.db", @"/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/Cache.db-wal", @"/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/Cache.db-shm", @"/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/fsCachedData", 0);
  }
  else
  {
    int v3 = +[MSDPlatform sharedInstance];
    int v4 = [v3 tvOS];

    if (!v4) {
      return;
    }
    uint64_t v2 = [MEMORY[0x263EFF8C0] array];
  }
  doNotExtractList_shared = v2;
  MEMORY[0x270F9A758]();
}

id systemContainerShouldRestoreList()
{
  if (systemContainerShouldRestoreList_onceToken != -1) {
    dispatch_once(&systemContainerShouldRestoreList_onceToken, &__block_literal_global_276);
  }
  v0 = (void *)systemContainerShouldRestoreList_shared;
  return v0;
}

void __systemContainerShouldRestoreList_block_invoke()
{
  v0 = +[MSDPlatform sharedInstance];
  int v1 = [v0 watchOS];

  if (v1)
  {
    uint64_t v2 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"systemgroup.com.apple.configurationprofiles", 0);
  }
  else
  {
    int v3 = +[MSDPlatform sharedInstance];
    int v4 = [v3 tvOS];

    if (!v4) {
      return;
    }
    uint64_t v2 = [MEMORY[0x263EFF8C0] array];
  }
  systemContainerShouldRestoreList_shared = v2;
  MEMORY[0x270F9A758]();
}

id appContainerDoNotExtractList()
{
  if (appContainerDoNotExtractList_onceToken != -1) {
    dispatch_once(&appContainerDoNotExtractList_onceToken, &__block_literal_global_281);
  }
  v0 = (void *)appContainerDoNotExtractList_shared;
  return v0;
}

uint64_t __appContainerDoNotExtractList_block_invoke()
{
  appContainerDoNotExtractList_shared = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"/.com.apple.mobile_container_manager.metadata.plist", @"/Library/Caches", @"/Library/SyncedPreferences", @"/Library/Saved Application State", @"/SystemData/com.apple.AuthenticationServices", 0);
  return MEMORY[0x270F9A758]();
}

id systemContainerDoNotExtractList()
{
  if (systemContainerDoNotExtractList_onceToken != -1) {
    dispatch_once(&systemContainerDoNotExtractList_onceToken, &__block_literal_global_298);
  }
  v0 = (void *)systemContainerDoNotExtractList_shared;
  return v0;
}

uint64_t __systemContainerDoNotExtractList_block_invoke()
{
  systemContainerDoNotExtractList_shared = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"/.com.apple.mobile_container_manager.metadata.plist", @"/Library/Caches", @"/Library/SyncedPreferences", @"/Library/Saved Application State", @"/SystemData/com.apple.AuthenticationServices", 0);
  return MEMORY[0x270F9A758]();
}

id generateCustomDomainsPlistForSecurityRulesCheck()
{
  v5[2] = *MEMORY[0x263EF8340];
  v4[0] = @"ContentRootDomain";
  v0 = contentRootList();
  v4[1] = @"SystemContainerDomain";
  v5[0] = v0;
  int v1 = systemContainerShouldRestoreList();
  v5[1] = v1;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

id screenSaverLogHandle()
{
  if (screenSaverLogHandle_once != -1) {
    dispatch_once(&screenSaverLogHandle_once, &__block_literal_global_4);
  }
  v0 = (void *)screenSaverLogHandle_currentLogObj;
  return v0;
}

uint64_t __screenSaverLogHandle_block_invoke()
{
  screenSaverLogHandle_currentLogObj = (uint64_t)os_log_create("com.apple.MobileStoreDemo", "ScreenSaver");
  return MEMORY[0x270F9A758]();
}

id messageLogHandle()
{
  if (messageLogHandle_once != -1) {
    dispatch_once(&messageLogHandle_once, &__block_literal_global_7);
  }
  v0 = (void *)messageLogHandle_messageLogObj;
  return v0;
}

uint64_t __messageLogHandle_block_invoke()
{
  messageLogHandle_messageLogObj = (uint64_t)os_log_create("com.apple.MobileStoreDemo", "Message");
  return MEMORY[0x270F9A758]();
}

id signpostLogHandle()
{
  if (signpostLogHandle_once != -1) {
    dispatch_once(&signpostLogHandle_once, &__block_literal_global_10);
  }
  v0 = (void *)signpostLogHandle_signpostLogObj;
  return v0;
}

void __signpostLogHandle_block_invoke()
{
  if (os_variant_has_internal_content())
  {
    os_log_t v0 = os_log_create("com.apple.MobileStoreDemo", "Signpost");
  }
  else
  {
    os_log_t v0 = (os_log_t)MEMORY[0x263EF8440];
    id v1 = MEMORY[0x263EF8440];
  }
  uint64_t v2 = (void *)signpostLogHandle_signpostLogObj;
  signpostLogHandle_signpostLogObj = (uint64_t)v0;
}

void MSDLogToFile(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = a1;
  uint64_t v10 = +[MSDLogModel sharedInstance];
  [v10 logWithFormat:v9 andArgs:&a9];
}

void sub_21EF1282C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EF12BEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
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

void sub_21EF134D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x223C3E670](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
}

void sub_21EF13880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_21EF13C08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_21EF166CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_21EF16F8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_21EF1A2BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EF1A4D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EF1A5CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EF1A760(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EF1A98C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EF1ABC8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EF1AE04(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EF1B064(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EF1B2C4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EF1B514(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EF1B760(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EF1B9AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EF1BC04(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EF1BE54(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EF1C090(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EF1C2E8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EF1C53C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EF1C778(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EF1C9B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EF1CC28(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EF1CE64(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EF1D0A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EF1D2EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EF1D530(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EF1D774(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EF1D9B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EF1DBB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EF1DD8C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EF1DF6C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EF1E168(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EF1E340(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EF1E518(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EF1E70C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EF1E8E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EF1EF3C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 112));
  _Unwind_Resume(a1);
}

void sub_21EF1EFF0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EF1F080(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EF1F4E8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EF1F620(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EF1F738(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EF21EC0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EF22100(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_21EF25384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void OUTLINED_FUNCTION_3_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_21EF293EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EF29C2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21EF29EB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_21EF2A8A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EF2AD38(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21EF2B1E8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_3_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

CFStringRef _hashToCFString(unsigned __int8 *a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  snprintf(__str, 0x64uLL, "%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x", *a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15],
    a1[16],
    a1[17],
    a1[18],
    a1[19]);
  return CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], __str, 0x8000100u);
}

unsigned __int8 *_MobileAssetHashAssetData(uint64_t a1, const __CFString *a2, const __CFString *a3)
{
  uint64_t v4 = _hashCFType(a2);
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v4 = _hashCFType(a3);
    if (v4)
    {
      for (uint64_t i = 0; i != 20; ++i)
        v5[i] ^= v4[i];
    }
  }
  free(v4);
  return v5;
}

unsigned __int8 *_hashCFType(const __CFString *a1)
{
  if (!a1) {
    return 0;
  }
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 == CFBooleanGetTypeID())
  {
    uint64_t v3 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0x6A69C61BuLL);
    LOBYTE(c.h0) = CFBooleanGetValue((CFBooleanRef)a1);
    p_CC_SHA1_CTX c = &c;
    CC_LONG Length = 1;
LABEL_10:
    CC_SHA1(p_c, Length, v3);
    return v3;
  }
  if (v2 == CFStringGetTypeID())
  {
    uint64_t v3 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0x877E83E2uLL);
    size_t v6 = CFStringGetLength(a1) + 1;
    uint64_t v7 = (char *)malloc_type_calloc(1uLL, v6, 0x9DED1793uLL);
    CFStringGetCString(a1, v7, v6, 0x8000100u);
    CC_SHA1(v7, v6, v3);
    free(v7);
    return v3;
  }
  if (v2 == CFDateGetTypeID())
  {
    uint64_t v3 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0xEAF147E6uLL);
    *(void *)&c.h0 = MEMORY[0x223C3DFE0](a1);
    p_CC_SHA1_CTX c = &c;
    CC_LONG Length = 8;
    goto LABEL_10;
  }
  if (v2 == CFDataGetTypeID())
  {
    uint64_t v3 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0x1991A161uLL);
    BytePtr = CFDataGetBytePtr((CFDataRef)a1);
    CC_LONG Length = CFDataGetLength((CFDataRef)a1);
    p_CC_SHA1_CTX c = (CC_SHA1_CTX *)BytePtr;
    goto LABEL_10;
  }
  if (v2 == CFArrayGetTypeID())
  {
    if (CFArrayGetCount((CFArrayRef)a1))
    {
      memset(&c, 0, sizeof(c));
      if (!_MobileAssetArrayHasDuplicateEntries((const __CFArray *)a1))
      {
        uint64_t v3 = (unsigned __int8 *)_hashCFType(@"array");
        CC_SHA1_Init(&c);
        if (CFArrayGetCount((CFArrayRef)a1) >= 1)
        {
          CFIndex v11 = 0;
          do
          {
            ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a1, v11);
            uint64_t v13 = (unsigned __int8 *)_hashCFType(ValueAtIndex);
            if (!v13) {
              break;
            }
            uint64_t v14 = v13;
            CC_SHA1_Update(&c, v13, 0x14u);
            CC_SHA1_Final(v14, &c);
            if (v3)
            {
              for (uint64_t i = 0; i != 20; ++i)
                v3[i] ^= v14[i];
            }
            free(v14);
            ++v11;
          }
          while (CFArrayGetCount((CFArrayRef)a1) > v11);
        }
        return v3;
      }
      uint64_t v9 = defaultLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v16 = 0;
        _os_log_impl(&dword_21EF08000, v9, OS_LOG_TYPE_DEFAULT, "Failing to hash due to duplicate array entries", v16, 2u);
      }
    }
    return 0;
  }
  if (v2 == CFDictionaryGetTypeID())
  {
    return (unsigned __int8 *)_hashCFDictionary((const __CFDictionary *)a1);
  }
  if (v2 != CFNumberGetTypeID()) {
    return 0;
  }
  return _hashCFNumber((const __CFNumber *)a1);
}

CFDataRef _MobileAssetCopyFileHash(const __CFAllocator *a1, const __CFString *a2, CFStringRef theString1, uint64_t a4, void (*a5)(uint64_t, double, float), uint64_t a6)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  memset(&c, 0, sizeof(c));
  if (CFEqual(theString1, @"SHA-1"))
  {
    CFURLRef v20 = CFURLCreateWithFileSystemPath(a1, a2, kCFURLPOSIXPathStyle, 0);
    if (!v20)
    {
      CFIndex v11 = defaultLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        _MobileAssetCopyFileHash_cold_1((uint64_t)a2, v11);
      }
      goto LABEL_4;
    }
    CFURLRef v21 = v20;
    uint64_t v22 = CFReadStreamCreateWithFile(a1, v20);
    if (!v22)
    {
      uint64_t v33 = defaultLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        _MobileAssetCopyFileHash_cold_2();
      }

      CFDataRef v19 = 0;
      goto LABEL_40;
    }
    uint64_t v23 = v22;
    if (CFReadStreamOpen(v22))
    {
      if (a5) {
        a5(a6, 0.0, -1.0);
      }
      CC_SHA1_Init(&c);
      uint64_t v24 = (UInt8 *)malloc_type_calloc(1uLL, 0x10000uLL, 0x49093F70uLL);
      if (v24)
      {
        uint64_t v25 = v24;
        v52.tv_seCC_SHA1_CTX c = 0;
        *(void *)&v52.tv_useCC_SHA1_CTX c = 0;
        gettimeofday(&v52, 0);
        CFIndex v26 = CFReadStreamRead(v23, v25, 0x10000);
        if (v26 < 1)
        {
LABEL_18:
          CC_SHA1_Final(md, &c);
          CFDataRef v31 = CFDataCreate(a1, md, 20);
          if (v31)
          {
            CFDataRef v19 = v31;
            CFStringRef v32 = _hashToCFString(md);
            if (v32) {
              CFRelease(v32);
            }
            if (a5) {
              a5(a6, 1.0, -1.0);
            }
            goto LABEL_38;
          }
          uint64_t v42 = defaultLogHandle();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
            _MobileAssetCopyFileHash_cold_5(v42, v43, v44, v45, v46, v47, v48, v49);
          }
        }
        else
        {
          CFIndex v27 = v26;
          uint64_t v28 = 0;
          while (1)
          {
            CC_SHA1_Update(&c, v25, v27);
            v28 += v27;
            v29.n128_u32[0] = -1.0;
            if (a4) {
              v29.n128_f32[0] = (float)v28 / (float)a4;
            }
            if (a5)
            {
              int v30 = ((uint64_t (*)(uint64_t, __n128, float))a5)(a6, v29, -1.0);
              if (v30) {
                break;
              }
            }
            CFIndex v27 = CFReadStreamRead(v23, v25, 0x10000);
            if (v27 <= 0) {
              goto LABEL_18;
            }
          }
          int v50 = v30;
          uint64_t v42 = defaultLogHandle();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
            _MobileAssetCopyFileHash_cold_6(v50, v42);
          }
        }

        CFDataRef v19 = 0;
LABEL_38:
        free(v25);
        goto LABEL_39;
      }
      uint64_t v34 = defaultLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        _MobileAssetCopyFileHash_cold_4(v34, v35, v36, v37, v38, v39, v40, v41);
      }
    }
    else
    {
      uint64_t v34 = defaultLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        _MobileAssetCopyFileHash_cold_3();
      }
    }

    CFDataRef v19 = 0;
LABEL_39:
    CFReadStreamClose(v23);
    CFRelease(v23);
LABEL_40:
    CFRelease(v21);
    return v19;
  }
  CFIndex v11 = defaultLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    _MobileAssetCopyFileHash_cold_7(v11, v12, v13, v14, v15, v16, v17, v18);
  }
LABEL_4:

  return 0;
}

uint64_t _hashCFDictionary(const __CFDictionary *a1)
{
  if (!CFDictionaryGetCount(a1)) {
    return 0;
  }
  memset(&v12, 0, sizeof(v12));
  uint64_t v2 = _hashCFType(@"dictionary");
  int64_t Count = CFDictionaryGetCount(a1);
  uint64_t v4 = (const void **)malloc_type_calloc(Count, 8uLL, 0x6004044C4A2DFuLL);
  CFDictionaryGetKeysAndValues(a1, v4, 0);
  if (Count >= 1)
  {
    for (uint64_t i = 0; i != Count; ++i)
    {
      size_t v6 = (void *)_hashCFType(v4[i]);
      Value = CFDictionaryGetValue(a1, v4[i]);
      uint64_t v8 = (void *)_hashCFType(Value);
      CC_SHA1_Init(&v12);
      uint64_t v9 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0x663AA81CuLL);
      if (v6)
      {
        CC_SHA1_Update(&v12, v6, 0x14u);
        free(v6);
      }
      if (v8)
      {
        CC_SHA1_Update(&v12, v8, 0x14u);
        free(v8);
      }
      CC_SHA1_Final(v9, &v12);
      if (v2 && v9)
      {
        for (uint64_t j = 0; j != 20; ++j)
          *(unsigned char *)(v2 + j) ^= v9[j];
      }
      free(v9);
    }
  }
  free(v4);
  return v2;
}

unsigned __int8 *_hashCFNumber(const __CFNumber *a1)
{
  uint64_t v2 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0xFF7F1A96uLL);
  uint64_t valuePtr = 0;
  CFNumberGetValue(a1, kCFNumberSInt64Type, &valuePtr);
  if ((unint64_t)(valuePtr + 1) >= 0xE) {
    size_t v3 = 8;
  }
  else {
    size_t v3 = 4;
  }
  if ((unint64_t)(valuePtr + 1) < 0xE) {
    CFNumberType v4 = kCFNumberSInt32Type;
  }
  else {
    CFNumberType v4 = kCFNumberSInt64Type;
  }
  uint64_t v5 = malloc_type_calloc(1uLL, v3, 0xD98972E9uLL);
  CFNumberGetValue(a1, v4, v5);
  CC_SHA1(v5, v3, v2);
  free(v5);
  return v2;
}

uint64_t _MobileAssetArrayHasDuplicateEntries(const __CFArray *a1)
{
  CFIndex Count = CFArrayGetCount(a1);
  if (Count < 1) {
    return 0;
  }
  CFIndex v3 = Count;
  CFIndex v4 = 0;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(a1, v4);
    v7.location = 0;
    v7.length = v3;
    if (CFArrayGetCountOfValue(a1, v7, ValueAtIndex) >= 2) {
      break;
    }
    if (v3 == ++v4) {
      return 0;
    }
  }
  return 1;
}

void _MobileAssetCopyFileHash_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21EF08000, a2, OS_LOG_TYPE_ERROR, "Can't create URL %{public}@", (uint8_t *)&v2, 0xCu);
}

void _MobileAssetCopyFileHash_cold_2()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_7(&dword_21EF08000, v0, v1, "Can't create read stream, %{public}@ %{public}@");
}

void _MobileAssetCopyFileHash_cold_3()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_7(&dword_21EF08000, v0, v1, "Can't open read stream %{public}@ *** %{public}@");
}

void _MobileAssetCopyFileHash_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _MobileAssetCopyFileHash_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _MobileAssetCopyFileHash_cold_6(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21EF08000, a2, OS_LOG_TYPE_ERROR, "Progress handler returned with status %d; failing verification",
    (uint8_t *)v2,
    8u);
}

void _MobileAssetCopyFileHash_cold_7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7AF0](data, *(void *)&len, md);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x270ED7AF8](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x270ED7B00](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B08](c, data, *(void *)&len);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFIndex CFArrayGetCountOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x270EE4330](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  MEMORY[0x270EE48C8](theDate);
  return result;
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x270EE48D8]();
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x270EE4D08](applicationID, userName, hostName);
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D20](allocator, propertyList, mutabilityOption);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x270EE4D90](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x270EE4DB8](stream);
}

CFIndex CFReadStreamRead(CFReadStreamRef stream, UInt8 *buffer, CFIndex bufferLength)
{
  return MEMORY[0x270EE4DC0](stream, buffer, bufferLength);
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE53F0](allocator, filePath, pathStyle, isDirectory);
}

kern_return_t IOMasterPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x270EF47B0](*(void *)&bootstrapPort, mainPort);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x270EF49E8](*(void *)&mainPort, path);
}

uint64_t MAECopyActivationRecordWithError()
{
  return MEMORY[0x270F4A8A8]();
}

uint64_t MAEGetActivationStateWithError()
{
  return MEMORY[0x270F4A8C0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x270F95FF8]();
}

uint64_t MISValidateSignatureAndCopyInfo()
{
  return MEMORY[0x270F99F20]();
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

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

OSStatus SecCertificateCopyCommonName(SecCertificateRef certificate, CFStringRef *commonName)
{
  return MEMORY[0x270EFD6E8](certificate, commonName);
}

uint64_t SecCertificateCopyOrganizationalUnit()
{
  return MEMORY[0x270EFD778]();
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x270EFD7E0](allocator, data);
}

OSStatus SecKeyRawVerify(SecKeyRef key, SecPadding padding, const uint8_t *signedData, size_t signedDataLen, const uint8_t *sig, size_t sigLen)
{
  return MEMORY[0x270EFDAB8](key, *(void *)&padding, signedData, signedDataLen, sig, sigLen);
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x270EFDAC8](key, algorithm, signedData, signature, error);
}

uint64_t SecPolicyCreateDemoDigitalCatalogSigning()
{
  return MEMORY[0x270EFDB58]();
}

uint64_t SecPolicyCreateMobileStoreSigner()
{
  return MEMORY[0x270EFDB80]();
}

uint64_t SecPolicyCreateTestMobileStoreSigner()
{
  return MEMORY[0x270EFDBB8]();
}

SecKeyRef SecTrustCopyPublicKey(SecTrustRef trust)
{
  return (SecKeyRef)MEMORY[0x270EFDD30](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x270EFDD40](certificates, policies, trust);
}

OSStatus SecTrustEvaluate(SecTrustRef trust, SecTrustResultType *result)
{
  return MEMORY[0x270EFDD50](trust, result);
}

OSStatus SecTrustSetAnchorCertificates(SecTrustRef trust, CFArrayRef anchorCertificates)
{
  return MEMORY[0x270EFDDA8](trust, anchorCertificates);
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

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t container_create_or_lookup_path_for_current_user()
{
  return MEMORY[0x270ED8F98]();
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x270ED92D0](buffer, size, queue, destructor);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

int fflush(FILE *a1)
{
  return MEMORY[0x270ED9938](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x270ED9A20](a1, a2);
}

void free(void *a1)
{
}

uid_t geteuid(void)
{
  return MEMORY[0x270ED9BF0]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270ED9D98](a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
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

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x270EDAB30]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6D8](__str, __endptr, *(void *)&__base);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x270EDBD10](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDBD18](objects, count);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDBD20]();
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x270EDBDD8](value);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x270EDBDE0](xBOOL);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x270EDBED0](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x270EDBF40](object);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x270EDBF90](bytes, length);
}

xpc_object_t xpc_data_create_with_dispatch_data(dispatch_data_t ddata)
{
  return (xpc_object_t)MEMORY[0x270EDBF98](ddata);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x270EDBFA8](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x270EDBFB8](xdata);
}

xpc_object_t xpc_date_create(int64_t interval)
{
  return (xpc_object_t)MEMORY[0x270EDBFC8](interval);
}

int64_t xpc_date_get_value(xpc_object_t xdate)
{
  return MEMORY[0x270EDBFD8](xdate);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x270EDBFE8](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x270EDC020](original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC050](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x270EDC060](xdict, key, length);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC088](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC0B0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_date(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
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

xpc_object_t xpc_double_create(double value)
{
  return (xpc_object_t)MEMORY[0x270EDC168](value);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  MEMORY[0x270EDC170](xdouble);
  return result;
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x270EDC210](value);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x270EDC218](xint);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x270EDC3D0](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x270EDC3F8](xstring);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x270EDC440](xuint);
}