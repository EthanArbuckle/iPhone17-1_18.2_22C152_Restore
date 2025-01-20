void sub_22289DA90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22289DC50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_2228A1A70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id UNSLocalizedFormatStringForKey(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = UNSBundle();
  v4 = [v3 localizedStringForKey:v2 value:&stru_26D509FA0 table:0];

  return v4;
}

id UNSBundle()
{
  if (UNSBundle___onceToken != -1) {
    dispatch_once(&UNSBundle___onceToken, &__block_literal_global_0);
  }
  v0 = (void *)UNSBundle___userNotificationBundle;
  return v0;
}

void sub_2228A3A84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t UNShowPreviewsSettingFromBBContentPreviewSetting(uint64_t a1)
{
  if (a1 == 3) {
    return 2;
  }
  else {
    return a1 == 2;
  }
}

BOOL UNNotificationGroupingSettingFromBBBulletinGroupingSetting(BOOL result)
{
  if (result != 2) {
    return result == 1;
  }
  return result;
}

void sub_2228A634C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void UNSShowCriticalAlertAuthorizationAlert(void *a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  id v20 = a3;
  v7 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v22 = v5;
    _os_log_impl(&dword_22289A000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Show critical alert user authorization prompt", buf, 0xCu);
  }
  if (![v6 length])
  {
    id v8 = v5;

    id v6 = v8;
  }
  v9 = UNSLocalizedFormatStringForKey(@"%@", @"CRITICAL_ALERT_PERMISSION_ALERT_TITLE");
  v10 = objc_msgSend(NSString, "localizedStringWithFormat:", v9, v6);
  unsigned int v11 = UNSDeviceClass() - 1;
  v19 = v5;
  if (v11 > 5) {
    v12 = @"CRITICAL_ALERT_PERMISSION_ALERT_BODY_DEFAULT";
  }
  else {
    v12 = off_26462F130[v11];
  }
  v13 = UNSLocalizedStringForKey(v12);
  v14 = UNSLocalizedStringForKey(@"PERMISSION_ALERT_DENY");
  v15 = UNSLocalizedStringForKey(@"PERMISSION_ALERT_ALLOW");
  v16 = UNSBundle();
  v17 = [v16 bundlePath];
  objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v10, *MEMORY[0x263EFFFC8], v13, *MEMORY[0x263EFFFD8], v15, *MEMORY[0x263F00020], v14, *MEMORY[0x263EFFFE8], MEMORY[0x263EFFA88], *MEMORY[0x263F795D0], MEMORY[0x263EFFA88], *MEMORY[0x263F79610], MEMORY[0x263EFFA88], *MEMORY[0x263F79668], @"critical-alert-40", *MEMORY[0x263F79648], v17,
    *MEMORY[0x263F79650],
    0);
  CFDictionaryRef v18 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  UNSShowAuthorizationAlert(v18, v20);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void UNSShowAuthorizationAlert(const __CFDictionary *a1, void *a2)
{
  id v3 = a2;
  SInt32 error = 0;
  CFUserNotificationRef v4 = CFUserNotificationCreate(0, 0.0, 0x23uLL, &error, a1);
  if (v4)
  {
    CFUserNotificationRef v5 = v4;
    if (!error)
    {
      id v6 = [MEMORY[0x263F08D40] valueWithPointer:v4];
      v7 = _UNNotificationAlertResultBlockMap();
      id v8 = (void *)[v3 copy];
      v9 = _Block_copy(v8);
      [v7 setObject:v9 forKey:v6];

      CFRetain(v5);
      RunLoopSource = CFUserNotificationCreateRunLoopSource(0, v5, (CFUserNotificationCallBack)_UNSAuthorizationAlertResponseHandler, 0);
      Main = CFRunLoopGetMain();
      CFRunLoopAddSource(Main, RunLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE78]);
      CFRelease(RunLoopSource);
    }
    CFRelease(v5);
  }
}

id _UNNotificationAlertResultBlockMap()
{
  if (_UNNotificationAlertResultBlockMap_onceToken != -1) {
    dispatch_once(&_UNNotificationAlertResultBlockMap_onceToken, &__block_literal_global);
  }
  v0 = (void *)_UNNotificationAlertResultBlockMap___map;
  return v0;
}

void _UNSAuthorizationAlertResponseHandler(const void *a1, uint64_t a2)
{
  id v9 = [MEMORY[0x263F08D40] valueWithPointer:a1];
  CFUserNotificationRef v4 = _UNNotificationAlertResultBlockMap();
  uint64_t v5 = [v4 objectForKey:v9];
  id v6 = (void *)v5;
  if (a2 == 1) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = -1;
  }
  if (a2 == 2) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = v7;
  }
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, v8);
  [v4 removeObjectForKey:v9];
  CFRelease(a1);
}

void UNSShowDeliveryAuthorizationAlert(const __CFDictionary *a1, void *a2)
{
  id v3 = a2;
  SInt32 error = 0;
  CFUserNotificationRef v4 = CFUserNotificationCreate(0, 0.0, 0x20uLL, &error, a1);
  if (v4)
  {
    CFUserNotificationRef v5 = v4;
    if (!error)
    {
      id v6 = [MEMORY[0x263F08D40] valueWithPointer:v4];
      uint64_t v7 = _UNNotificationAlertResultBlockMap();
      uint64_t v8 = (void *)[v3 copy];
      id v9 = _Block_copy(v8);
      [v7 setObject:v9 forKey:v6];

      CFRetain(v5);
      RunLoopSource = CFUserNotificationCreateRunLoopSource(0, v5, (CFUserNotificationCallBack)_UNSDeliveryAuthorizationAlertResponseHandler, 0);
      Main = CFRunLoopGetMain();
      CFRunLoopAddSource(Main, RunLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE78]);
      CFRelease(RunLoopSource);
    }
    CFRelease(v5);
  }
}

void _UNSDeliveryAuthorizationAlertResponseHandler(const void *a1, unint64_t a2)
{
  id v8 = [MEMORY[0x263F08D40] valueWithPointer:a1];
  CFUserNotificationRef v4 = _UNNotificationAlertResultBlockMap();
  uint64_t v5 = [v4 objectForKey:v8];
  id v6 = (void *)v5;
  if (a2 >= 3) {
    uint64_t v7 = -1;
  }
  else {
    uint64_t v7 = a2;
  }
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, v7);
  [v4 removeObjectForKey:v8];
  CFRelease(a1);
}

void __UNSBundle_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v1 = (void *)UNSBundle___userNotificationBundle;
  UNSBundle___userNotificationBundle = v0;
}

id UNSLocalizedStringForKey(void *a1)
{
  id v1 = a1;
  id v2 = UNSBundle();
  id v3 = [v2 localizedStringForKey:v1 value:&stru_26D509FA0 table:0];

  return v3;
}

uint64_t UNSDeviceClass()
{
  if (UNSDeviceClass_once != -1) {
    dispatch_once(&UNSDeviceClass_once, &__block_literal_global_5);
  }
  return UNSDeviceClass_deviceClass;
}

uint64_t __UNSDeviceClass_block_invoke()
{
  uint64_t result = MGGetSInt32Answer();
  UNSDeviceClass_deviceClass = result;
  return result;
}

void sub_2228A7CB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_2228A7FB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2228A8214(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2228A86E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2228A9880(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t kNSAdaptiveImageGlyphAttributeName_block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

uint64_t UNSupportedAuthorizationOptionsForPushSettings(char a1)
{
  return a1 & 7;
}

uint64_t UNEnabledAuthorizationOptionsForPushSettings(unint64_t a1)
{
  return (a1 >> 3) & 7;
}

void sub_2228AC1DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2228AD18C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 96));
  objc_destroyWeak((id *)(v5 - 88));
  _Unwind_Resume(a1);
}

void UNSUserNotificationServerRun()
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  uint64_t v0 = dispatch_get_global_queue(0, 0);
  dispatch_async(v0, &__block_literal_global_2);
}

id __UNSUserNotificationServerRun_block_invoke()
{
  return +[UNSUserNotificationServer sharedInstance];
}

void sub_2228AE138(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2228AE34C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t _UNSBackgroundRefreshApplicationsDidChange(uint64_t a1, void *a2)
{
  return [a2 _backgroundRefreshApplicationsDidChange];
}

uint64_t _UNSTimeDidChangeSignificantly(uint64_t a1, void *a2)
{
  return [a2 _timeDidChangeSignificantly];
}

void UNSTriggerLocationArrow(void *a1)
{
  id v1 = a1;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v2 = +[UNSUserNotificationServer sharedInstance];
  [v2 _triggerLocationArrowForBundleIdentifier:v1];
}

void UNSBuildForegroundAction(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v8 = +[UNSUserNotificationServer sharedInstance];
  [v8 _buildForegroundAction:v7 queue:v6 completionHandler:v5];
}

void UNSDidCompleteDeliveryOfForegroundAction(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_ERROR)) {
      UNSDidCompleteDeliveryOfForegroundAction_cold_1();
    }
  }
  else
  {
    UNCDecodeNotificationActionSelector();
  }
}

void __UNSDidCompleteDeliveryOfForegroundAction_block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = *MEMORY[0x263F1E060];
  if (v14)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_ERROR)) {
      __UNSDidCompleteDeliveryOfForegroundAction_block_invoke_cold_1(v15);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v20 = v11;
      __int16 v21 = 2112;
      id v22 = v10;
      _os_log_impl(&dword_22289A000, v15, OS_LOG_TYPE_DEFAULT, "UNSDidCompleteDeliveryOfForegroundAction removing notificationID: %@ bundleID: %@", buf, 0x16u);
    }
    v16 = +[UNSUserNotificationServer sharedInstance];
    id v18 = v11;
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
    [v16 _removeNotificationRecordsForIdentifiers:v17 bundleIdentifier:v10];
  }
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t _IsTelephonyDevice()
{
  if (_IsTelephonyDevice_once != -1) {
    dispatch_once(&_IsTelephonyDevice_once, &__block_literal_global_3);
  }
  return _IsTelephonyDevice_telephonyDevice;
}

void UNSExampleUserNotificationCenterRegister()
{
  if (UNSExampleUserNotificationCenterRegister_onceToken != -1) {
    dispatch_once(&UNSExampleUserNotificationCenterRegister_onceToken, &__block_literal_global_5);
  }
}

void __UNSExampleUserNotificationCenterRegister_block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x223CA06B0]();
  id v1 = objc_alloc_init(UNSExampleUserNotificationCenter);
  id v2 = (void *)__sharedInstance;
  __sharedInstance = (uint64_t)v1;
}

void sub_2228B3F2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2228B4380(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_2228B4B88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void UNSShowNotificationDeliveryAuthorizationAlert(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v21 = v7;
    _os_log_impl(&dword_22289A000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Show notification delivery user authorization prompt", buf, 0xCu);
  }
  if (![v8 length])
  {
    id v12 = v7;

    id v8 = v12;
  }
  id v13 = UNSLocalizedFormatStringForKey(@"%@", @"USER_NOTIFICATION_PERMISSION_ALERT_TITLE");
  id v14 = objc_msgSend(NSString, "localizedStringWithFormat:", v13, v8);
  if (![v9 length])
  {
    uint64_t v15 = UNSLocalizedStringForKey(@"USER_NOTIFICATION_PERMISSION_ALERT_BODY");

    id v9 = (id)v15;
  }
  v16 = UNSLocalizedStringForKey(@"PERMISSION_ALERT_DENY");
  v17 = UNSLocalizedStringForKey(@"PERMISSION_ALERT_ALLOW");
  id v18 = UNSLocalizedStringForKey(@"PERMISSION_ALERT_DELIVERY_SCHEDULED");
  objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v14, *MEMORY[0x263EFFFC8], v9, *MEMORY[0x263EFFFD8], v17, *MEMORY[0x263EFFFE8], v18, *MEMORY[0x263F00020], v16, *MEMORY[0x263F00000], MEMORY[0x263EFFA88], *MEMORY[0x263F795D0], 0);
  CFDictionaryRef v19 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  UNSShowDeliveryAuthorizationAlert(v19, v10);
}

void sub_2228BBDAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2228BC410(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2228BC970(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return v0;
}

void OUTLINED_FUNCTION_4_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_2228BFA40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,id location)
{
  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_2228C0A34(_Unwind_Exception *a1)
{
  objc_sync_exit(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 72));
  _Unwind_Resume(a1);
}

void sub_2228C127C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2228C13E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2228C1554(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2228C2EE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id a29)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a29);
  _Block_object_dispose((const void *)(v29 - 176), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_2228C3DB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,id location,char a32)
{
  objc_destroyWeak(v32);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v33 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_2228C4A5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
  objc_destroyWeak(v47);
  objc_destroyWeak(location);
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose((const void *)(v49 - 256), 8);
  objc_destroyWeak(v48);
  _Block_object_dispose((const void *)(v49 - 208), 8);
  objc_destroyWeak((id *)(v49 - 160));
  objc_destroyWeak((id *)(v49 - 152));
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__30(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__31(uint64_t a1)
{
}

void OUTLINED_FUNCTION_1_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_2228C6F30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2228C7628(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void UNSShowNotificationAuthorizationAlert(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = v7;
    _os_log_impl(&dword_22289A000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Show notification user authorization prompt", buf, 0xCu);
  }
  if (![v8 length])
  {
    id v12 = v7;

    id v8 = v12;
  }
  id v13 = UNSLocalizedFormatStringForKey(@"%@", @"USER_NOTIFICATION_PERMISSION_ALERT_TITLE");
  id v14 = objc_msgSend(NSString, "localizedStringWithFormat:", v13, v8);
  if (![v9 length])
  {
    uint64_t v15 = UNSLocalizedStringForKey(@"USER_NOTIFICATION_PERMISSION_ALERT_BODY");

    id v9 = (id)v15;
  }
  v16 = UNSLocalizedStringForKey(@"PERMISSION_ALERT_DENY");
  v17 = UNSLocalizedStringForKey(@"PERMISSION_ALERT_ALLOW");
  objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v14, *MEMORY[0x263EFFFC8], v9, *MEMORY[0x263EFFFD8], v17, *MEMORY[0x263F00020], v16, *MEMORY[0x263EFFFE8], MEMORY[0x263EFFA88], *MEMORY[0x263F795D0], 0);
  CFDictionaryRef v18 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  UNSShowAuthorizationAlert(v18, v10);
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

uint64_t BBContentPreviewSettingFromUNShowPreviewsSetting(uint64_t a1)
{
  uint64_t v1 = 1;
  if (a1 == 1) {
    uint64_t v1 = 2;
  }
  if (a1 == 2) {
    return 3;
  }
  else {
    return v1;
  }
}

BOOL UNNotificationSettingFromBBAnnounceSetting(BOOL result)
{
  if (result != 2) {
    return result == 1;
  }
  return result;
}

uint64_t UNNotificationAnnouncementCarPlaySettingFromBBAnnounceCarPlaySetting(uint64_t result)
{
  if ((unint64_t)(result - 1) >= 3) {
    return 0;
  }
  return result;
}

uint64_t BBAnnounceSettingFromUNNotificationSetting(uint64_t result)
{
  if (result == 1) {
    uint64_t v1 = 1;
  }
  else {
    uint64_t v1 = -1;
  }
  if (result != 2) {
    return v1;
  }
  return result;
}

uint64_t BBAnnounceCarPlaySettingFromUNNotificationAnnouncementCarPlaySetting(uint64_t result)
{
  if ((unint64_t)(result - 1) >= 3) {
    return -1;
  }
  return result;
}

BOOL BBBulletinGroupingSettingFromUNNotificationGroupingSetting(BOOL result)
{
  if (result != 2) {
    return result == 1;
  }
  return result;
}

uint64_t UNNotificationSettingFromBBScheduledDeliverySetting(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 3) {
    return 0;
  }
  else {
    return qword_2228DAAB8[a1 + 1];
  }
}

uint64_t BBScheduledDeliverySettingFromUNNotificationSetting(unint64_t a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return qword_2228DAAD8[a1];
  }
}

uint64_t UNNotificationSettingFromBBSystemSetting(unint64_t a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return qword_2228DAAD8[a1];
  }
}

uint64_t BBSystemSettingFromUNNotificationSetting(unint64_t a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return qword_2228DAAD8[a1];
  }
}

uint64_t UNNotificationListDisplayStyleSettingFromBBNotificationListDisplayStyleSetting(uint64_t a1)
{
  if (a1 == 3) {
    return 2;
  }
  else {
    return a1 == 2;
  }
}

uint64_t BBNotificationListDisplayStyleSettingFromUNNotificationListDisplayStyleSetting(uint64_t a1)
{
  uint64_t v1 = 1;
  if (a1 == 1) {
    uint64_t v1 = 2;
  }
  if (a1 == 2) {
    return 3;
  }
  else {
    return v1;
  }
}

uint64_t sub_2228CBE40(uint64_t a1)
{
  return sub_2228CBE88(a1, qword_267F839F0);
}

uint64_t sub_2228CBE6C(uint64_t a1)
{
  return sub_2228CBE88(a1, qword_267F83750);
}

uint64_t sub_2228CBE88(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_2228D8288();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_2228D8278();
}

uint64_t static Logger.daemon.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_267F83748 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2228D8288();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_267F83750);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void sub_2228CBFE0(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void type metadata accessor for BBPublisherDestinations()
{
  if (!qword_267F83840)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_267F83840);
    }
  }
}

void __swiftcall UNSSummaryServiceAdapter.init()(UNSSummaryServiceAdapter *__return_ptr retstr)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  objc_msgSend(v1, sel_init);
}

id UNSSummaryServiceAdapter.init()()
{
  uint64_t v13 = sub_2228D8428();
  uint64_t v1 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2228D8418();
  MEMORY[0x270FA5388]();
  sub_2228D82B8();
  MEMORY[0x270FA5388]();
  uint64_t v12 = OBJC_IVAR___UNSSummaryServiceAdapter_queue;
  v11[1] = sub_2228CEC40(0, &qword_26AC12008);
  uint64_t v4 = v0;
  sub_2228D82A8();
  uint64_t v15 = MEMORY[0x263F8EE78];
  sub_2228CD258(&qword_26AC12000, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC11FC8);
  sub_2228CD2A0((unint64_t *)&unk_26AC11FD0, &qword_26AC11FC8);
  sub_2228D8498();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F8F130], v13);
  *(void *)(v11[2] + v12) = sub_2228D8458();
  uint64_t v5 = OBJC_IVAR___UNSSummaryServiceAdapter_queue_observers;
  uint64_t v6 = MEMORY[0x263F8EE78];
  *(void *)&v4[v5] = sub_2228CD478(MEMORY[0x263F8EE78], &qword_26AC12018);
  uint64_t v7 = OBJC_IVAR___UNSSummaryServiceAdapter_queue_summaryBundlesByBundleId;
  *(void *)&v4[v7] = sub_2228CD360(v6, &qword_267F838F8);
  sub_2228D7FC8();
  *(void *)&v4[OBJC_IVAR___UNSSummaryServiceAdapter_summaryService] = sub_2228D7FA8();
  type metadata accessor for SummaryServiceHelper();
  uint64_t v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  *(void *)&v4[OBJC_IVAR___UNSSummaryServiceAdapter_summaryServiceHelper] = v8;

  v14.receiver = v4;
  v14.super_class = (Class)UNSSummaryServiceAdapter;
  id v9 = objc_msgSendSuper2(&v14, sel_init);
  swift_retain();
  swift_retain();
  sub_2228D7FB8();
  swift_release();
  swift_unknownObjectWeakAssign();
  sub_2228CC4DC();

  return v9;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_2228CC4DC()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AC11FE0);
  MEMORY[0x270FA5388]();
  uint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_2228D83B8();
  uint64_t v4 = *(void *)(v3 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  uint64_t v5 = (void *)swift_allocObject();
  v5[2] = 0;
  v5[3] = 0;
  v5[4] = v0;
  int v6 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3);
  id v7 = v0;
  if (v6 == 1)
  {
    sub_2228D08D4((uint64_t)v2);
  }
  else
  {
    sub_2228D83A8();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v2, v3);
    if (v5[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v8 = sub_2228D8398();
      uint64_t v10 = v9;
      swift_unknownObjectRelease();
      if (v10 | v8)
      {
        v12[0] = 0;
        v12[1] = 0;
        v12[2] = v8;
        v12[3] = v10;
      }
    }
  }
  swift_task_create();
  return swift_release();
}

uint64_t UNSSummaryServiceAdapter.add(_:forBundleIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2228CC958(a1, a2, a3, (uint64_t)&unk_26D509B70, (uint64_t)sub_2228CD234, (uint64_t)&block_descriptor);
}

uint64_t sub_2228CC744(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (uint64_t *)(a1 + OBJC_IVAR___UNSSummaryServiceAdapter_queue_observers);
  swift_beginAccess();
  uint64_t v6 = *v5;
  if (*(void *)(*v5 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v7 = sub_2228D2448(a2, a3);
    if (v8)
    {
      uint64_t v9 = *(void *)(*(void *)(v6 + 56) + 8 * v7);
      swift_endAccess();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    swift_bridgeObjectRelease();
  }
  swift_endAccess();
  uint64_t v9 = MEMORY[0x263F8EE78];
LABEL_6:
  uint64_t v10 = swift_unknownObjectRetain();
  MEMORY[0x223C9FFB0](v10);
  if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_2228D8378();
  }
  sub_2228D8388();
  sub_2228D8368();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v13 = *v5;
  *uint64_t v5 = 0x8000000000000000;
  sub_2228CF4E4(v9, a2, a3, isUniquelyReferenced_nonNull_native);
  *uint64_t v5 = v13;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

uint64_t sub_2228CC8D4(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t UNSSummaryServiceAdapter.remove(_:forBundleIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2228CC958(a1, a2, a3, (uint64_t)&unk_26D509BC0, (uint64_t)sub_2228CD33C, (uint64_t)&block_descriptor_6);
}

uint64_t sub_2228CC958(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v22 = a5;
  uint64_t v23 = a6;
  uint64_t v10 = sub_2228D8298();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_2228D82B8();
  uint64_t v14 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388]();
  v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = *(void *)&v6[OBJC_IVAR___UNSSummaryServiceAdapter_queue];
  v17 = (void *)swift_allocObject();
  v17[2] = v6;
  v17[3] = a2;
  v17[4] = a3;
  v17[5] = a1;
  aBlock[4] = v22;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2228CC8D4;
  aBlock[3] = v23;
  CFDictionaryRef v18 = _Block_copy(aBlock);
  CFDictionaryRef v19 = v6;
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  sub_2228D82A8();
  uint64_t v26 = MEMORY[0x263F8EE78];
  sub_2228CD258(&qword_26AC11FA8, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC11FB0);
  sub_2228CD2A0((unint64_t *)&unk_26AC11FB8, &qword_26AC11FB0);
  sub_2228D8498();
  MEMORY[0x223CA00C0](0, v16, v13, v18);
  _Block_release(v18);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v25);
  return swift_release();
}

uint64_t sub_2228CCC18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  char v8 = sub_2228CCD68(v13, a2, a3);
  if (!*v7)
  {
    ((void (*)(void *, void))v8)(v13, 0);
    goto LABEL_6;
  }
  uint64_t v9 = v7;
  swift_unknownObjectRetain();
  uint64_t v10 = sub_2228D00BC(v9, a4);
  uint64_t result = swift_unknownObjectRelease();
  if (*v9 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_2228D8508();
    uint64_t result = swift_bridgeObjectRelease();
    if (v12 >= v10) {
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v12 = *(void *)((*v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v12 >= v10)
    {
LABEL_4:
      sub_2228D03DC(v10, v12);
      ((void (*)(void *, void))v8)(v13, 0);
LABEL_6:
      swift_endAccess();
      return swift_bridgeObjectRelease();
    }
  }
  __break(1u);
  return result;
}

void (*sub_2228CCD68(void *a1, uint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = malloc(0x30uLL);
  *a1 = v6;
  v6[4] = a3;
  swift_bridgeObjectRetain();
  v6[5] = sub_2228CFB70(v6, a2, a3);
  return sub_2228CCDE8;
}

void sub_2228CCDE8(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 40))(*a1, 0);
  swift_bridgeObjectRelease();
  free(v1);
}

uint64_t sub_2228CCE54(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v8 = sub_2228D82E8();
  uint64_t v10 = v9;
  swift_unknownObjectRetain();
  id v11 = a1;
  a5(a3, v8, v10);
  swift_unknownObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t UNSSummaryServiceAdapter.groupSummaries(forNotificationIdentifier:bundleIdentifier:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC12010);
  sub_2228D8438();
  return v1;
}

void sub_2228CCF60(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  id v11 = (uint64_t *)(a1 + OBJC_IVAR___UNSSummaryServiceAdapter_queue_summaryBundlesByBundleId);
  swift_beginAccess();
  uint64_t v12 = *v11;
  if (!*(void *)(v12 + 16))
  {
    swift_endAccess();
LABEL_11:
    id v23 = 0;
    goto LABEL_12;
  }
  swift_bridgeObjectRetain();
  unint64_t v13 = sub_2228D2448(a2, a3);
  if ((v14 & 1) == 0)
  {
    swift_endAccess();
LABEL_10:
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  uint64_t v15 = *(void *)(*(void *)(v12 + 56) + 8 * v13);
  swift_endAccess();
  swift_retain();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v16 = *(void *)(v15 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_release();
  if (!*(void *)(v16 + 16) || (unint64_t v17 = sub_2228D2448(a4, a5), (v18 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  uint64_t v19 = *(void *)(*(void *)(v16 + 56) + 8 * v17);
  swift_retain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v20 = *(void **)(v19 + 16);
  if (*(void *)(v19 + 32))
  {
    id v21 = v20;
    swift_bridgeObjectRetain();
    uint64_t v22 = (void *)sub_2228D82D8();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v21 = v20;
    uint64_t v22 = 0;
  }
  id v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F84300]), sel_initWithSpotlightIdentifier_threadSummary_, v22, v21);
  swift_release();

LABEL_12:
  *a6 = v23;
}

uint64_t type metadata accessor for SummaryServiceHelper()
{
  return self;
}

uint64_t sub_2228CD234()
{
  return sub_2228CC744(v0[2], v0[3], v0[4]);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_2228CD258(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2228CD2A0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t objectdestroyTm()
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2228CD33C()
{
  return sub_2228CCC18(v0[2], v0[3], v0[4], v0[5]);
}

void sub_2228CD348(void *a1@<X8>)
{
}

unint64_t sub_2228CD360(uint64_t a1, uint64_t *a2)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v3 = (void *)sub_2228D8538();
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  uint64_t v5 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v6 = *(v5 - 2);
    uint64_t v7 = *(v5 - 1);
    uint64_t v8 = *v5;
    swift_bridgeObjectRetain();
    swift_retain();
    unint64_t result = sub_2228D2448(v6, v7);
    if (v10) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    id v11 = (uint64_t *)(v3[6] + 16 * result);
    *id v11 = v6;
    v11[1] = v7;
    *(void *)(v3[7] + 8 * result) = v8;
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v5 += 3;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_2228CD478(uint64_t a1, uint64_t *a2)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v3 = (void *)sub_2228D8538();
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  uint64_t v5 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v6 = *(v5 - 2);
    uint64_t v7 = *(v5 - 1);
    uint64_t v8 = *v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_2228D2448(v6, v7);
    if (v10) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    id v11 = (uint64_t *)(v3[6] + 16 * result);
    *id v11 = v6;
    v11[1] = v7;
    *(void *)(v3[7] + 8 * result) = v8;
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v5 += 3;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_2228CD590(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  sub_2228D7FE8();
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 24) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_2228CD630;
  return MEMORY[0x270F834B0]();
}

uint64_t sub_2228CD630(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
  else
  {
    *(void *)(v4 + 32) = a1;
    return MEMORY[0x270FA2498](sub_2228CD77C, 0, 0);
  }
}

uint64_t sub_2228CD77C()
{
  sub_2228CD7F0(*(void *)(v0 + 32));
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2228CD7F0(uint64_t a1)
{
  uint64_t v3 = sub_2228D8298();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2228D82B8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  char v10 = (char *)v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15[0] = *(void *)&v1[OBJC_IVAR___UNSSummaryServiceAdapter_queue];
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v1;
  *(void *)(v11 + 24) = a1;
  aBlock[4] = sub_2228CECBC;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2228CC8D4;
  aBlock[3] = &block_descriptor_39;
  uint64_t v12 = _Block_copy(aBlock);
  BOOL v13 = v1;
  swift_bridgeObjectRetain();
  sub_2228D82A8();
  v15[1] = MEMORY[0x263F8EE78];
  sub_2228CD258(&qword_26AC11FA8, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC11FB0);
  sub_2228CD2A0((unint64_t *)&unk_26AC11FB8, &qword_26AC11FB0);
  sub_2228D8498();
  MEMORY[0x223CA00C0](0, v10, v6, v12);
  _Block_release(v12);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return swift_release();
}

uint64_t sub_2228CDAA8(unint64_t isUniquelyReferenced_nonNull_native)
{
  unint64_t v2 = sub_2228CD478(MEMORY[0x263F8EE78], &qword_267F838E8);
  if (isUniquelyReferenced_nonNull_native >> 62) {
    goto LABEL_74;
  }
  uint64_t v3 = *(void *)((isUniquelyReferenced_nonNull_native & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = sub_2228D8508())
  {
    if (v3 < 1) {
      goto LABEL_113;
    }
    uint64_t v4 = 0;
    v120 = (uint64_t *)(v131 + OBJC_IVAR___UNSSummaryServiceAdapter_queue_summaryBundlesByBundleId);
    unint64_t v122 = isUniquelyReferenced_nonNull_native & 0xC000000000000001;
    unint64_t v117 = isUniquelyReferenced_nonNull_native;
    uint64_t v121 = v3;
    while (1)
    {
      if (v122) {
        id v5 = (id)MEMORY[0x223CA0140](v4, isUniquelyReferenced_nonNull_native);
      }
      else {
        id v5 = *(id *)(isUniquelyReferenced_nonNull_native + 8 * v4 + 32);
      }
      uint64_t v6 = v5;
      id v7 = objc_msgSend(v5, sel_bundleIdentifier, log);
      uint64_t v8 = sub_2228D82E8();
      uint64_t v10 = v9;

      id v11 = objc_msgSend(v6, sel_notificationIdentifier);
      if (!v11)
      {

        goto LABEL_6;
      }
      uint64_t v12 = v11;
      uint64_t v13 = sub_2228D82E8();
      uint64_t v15 = v14;

      if (*(void *)(v2 + 16))
      {
        swift_bridgeObjectRetain();
        unint64_t v16 = sub_2228D2448(v8, v10);
        unint64_t v17 = (void *)MEMORY[0x263F8EE78];
        if (v18)
        {
          unint64_t v17 = *(void **)(*(void *)(v2 + 56) + 8 * v16);
          swift_bridgeObjectRetain();
        }
        swift_bridgeObjectRelease();
      }
      else
      {
        unint64_t v17 = (void *)MEMORY[0x263F8EE78];
      }
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v17 = sub_2228D201C(0, v17[2] + 1, 1, v17);
      }
      unint64_t v20 = v17[2];
      unint64_t v19 = v17[3];
      id v126 = v6;
      if (v20 >= v19 >> 1) {
        unint64_t v17 = sub_2228D201C((void *)(v19 > 1), v20 + 1, 1, v17);
      }
      v17[2] = v20 + 1;
      id v21 = &v17[2 * v20];
      buf = (uint8_t *)v13;
      v21[4] = v13;
      v21[5] = v15;
      uint64_t v128 = v15;
      swift_bridgeObjectRetain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v135[0] = v2;
      unint64_t v23 = sub_2228D2448(v8, v10);
      uint64_t v24 = *(void *)(v2 + 16);
      BOOL v25 = (v22 & 1) == 0;
      uint64_t v26 = v24 + v25;
      if (__OFADD__(v24, v25)) {
        break;
      }
      char v27 = v22;
      if (*(void *)(v2 + 24) >= v26)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          sub_2228CF99C(&qword_267F838E8);
        }
      }
      else
      {
        sub_2228CEFF8(v26, isUniquelyReferenced_nonNull_native, &qword_267F838E8);
        unint64_t v28 = sub_2228D2448(v8, v10);
        if ((v27 & 1) != (v29 & 1)) {
          goto LABEL_114;
        }
        unint64_t v23 = v28;
      }
      char isUniquelyReferenced_nonNull_native = v117;
      unint64_t v2 = v135[0];
      if (v27)
      {
        uint64_t v30 = *(void *)(v135[0] + 56);
        swift_bridgeObjectRelease();
        *(void *)(v30 + 8 * v23) = v17;
      }
      else
      {
        *(void *)(v135[0] + 8 * (v23 >> 6) + 64) |= 1 << v23;
        v31 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v23);
        uint64_t *v31 = v8;
        v31[1] = v10;
        *(void *)(*(void *)(v2 + 56) + 8 * v23) = v17;
        uint64_t v32 = *(void *)(v2 + 16);
        BOOL v33 = __OFADD__(v32, 1);
        uint64_t v34 = v32 + 1;
        if (v33) {
          goto LABEL_73;
        }
        *(void *)(v2 + 16) = v34;
        swift_bridgeObjectRetain();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v35 = v126;
      id v36 = objc_msgSend(v126, sel_content);
      uint64_t v3 = v121;
      if (v36)
      {
        id v37 = v36;
        swift_beginAccess();
        uint64_t v38 = *v120;
        type = v37;
        if (*(void *)(*v120 + 16))
        {
          swift_bridgeObjectRetain();
          unint64_t v39 = sub_2228D2448(v8, v10);
          if (v40)
          {
            uint64_t v41 = *(void *)(*(void *)(v38 + 56) + 8 * v39);
            swift_endAccess();
            swift_retain();
            swift_bridgeObjectRelease();
            goto LABEL_44;
          }
          swift_bridgeObjectRelease();
        }
        swift_endAccess();
        _s13SummaryBundleCMa();
        uint64_t v41 = swift_allocObject();
        *(void *)(v41 + 16) = sub_2228CD360(MEMORY[0x263F8EE78], &qword_267F838F0);
        swift_beginAccess();
        swift_bridgeObjectRetain();
        swift_retain();
        char v52 = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v132 = *v120;
        uint64_t *v120 = 0x8000000000000000;
        sub_2228CF664(v41, v8, v10, v52, &qword_267F838F8);
        uint64_t *v120 = v132;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_endAccess();
LABEL_44:
        swift_bridgeObjectRelease();
        v53 = (uint64_t *)(v41 + 16);
        swift_beginAccess();
        uint64_t v54 = *(void *)(v41 + 16);
        if (*(void *)(v54 + 16))
        {
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          unint64_t v55 = sub_2228D2448((uint64_t)buf, v128);
          if (v56)
          {
            v57 = *(void **)(*(void *)(v54 + 56) + 8 * v55);
            swift_retain();
            swift_bridgeObjectRelease_n();
            goto LABEL_49;
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        _s11SummaryItemCMa();
        v57 = (void *)swift_allocObject();
        v57[3] = 0;
        v57[4] = 0;
        v57[2] = 0;
        swift_beginAccess();
        swift_bridgeObjectRetain();
        swift_retain();
        char v58 = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v133 = *v53;
        uint64_t *v53 = 0x8000000000000000;
        sub_2228CF664((uint64_t)v57, (uint64_t)buf, v128, v58, &qword_267F838F0);
        uint64_t *v53 = v133;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_endAccess();
LABEL_49:
        swift_bridgeObjectRelease();
        if (!objc_msgSend(v126, sel_isGroupSummary))
        {
          if (qword_267F83740 != -1) {
            swift_once();
          }
          uint64_t v65 = sub_2228D8288();
          __swift_project_value_buffer(v65, (uint64_t)qword_267F839F0);
          id v66 = v126;
          v67 = sub_2228D8268();
          os_log_type_t v68 = sub_2228D8408();
          v69 = v67;
          if (os_log_type_enabled(v67, v68))
          {
            v70 = (uint8_t *)swift_slowAlloc();
            uint64_t v129 = swift_slowAlloc();
            v135[0] = v129;
            bufb = v70;
            *(_DWORD *)v70 = 136315138;
            id v71 = objc_msgSend(v66, sel_spotlightIdentifier);
            uint64_t v72 = sub_2228D82E8();
            unint64_t v74 = v73;

            uint64_t v75 = v72;
            uint64_t v3 = v121;
            sub_2228D5068(v75, v74, v135);
            sub_2228D8478();

            char isUniquelyReferenced_nonNull_native = v117;
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_22289A000, v69, v68, "[SummaryServiceAdapter] Did not expect non group summary for spotlightIdentifier: %s", bufb, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x223CA0C70](v129, -1, -1);
            MEMORY[0x223CA0C70](bufb, -1, -1);

            swift_release();
            swift_release();
          }
          else
          {

            swift_release();
            swift_release();
          }
          goto LABEL_7;
        }
        v59 = (void *)v57[2];
        v57[2] = type;
        id v60 = type;

        id v61 = objc_msgSend(v126, sel_spotlightIdentifier);
        uint64_t v62 = sub_2228D82E8();
        uint64_t v64 = v63;
        swift_release();

        uint64_t v3 = v121;
        v57[3] = v62;
        v57[4] = v64;
        swift_release();
LABEL_6:
        swift_bridgeObjectRelease();
        goto LABEL_7;
      }
      swift_beginAccess();
      uint64_t v42 = *v120;
      if (*(void *)(*v120 + 16))
      {
        swift_bridgeObjectRetain();
        unint64_t v43 = sub_2228D2448(v8, v10);
        if (v44)
        {
          uint64_t v45 = *(void *)(*(void *)(v42 + 56) + 8 * v43);
          swift_endAccess();
          swift_retain();
          swift_bridgeObjectRelease_n();
          v46 = (uint64_t *)(v45 + 16);
          swift_beginAccess();
          uint64_t v47 = *(void *)(v45 + 16);
          if (*(void *)(v47 + 16))
          {
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            unint64_t v48 = sub_2228D2448((uint64_t)buf, v128);
            if (v49)
            {
              uint64_t v50 = *(void *)(*(void *)(v47 + 56) + 8 * v48);
              swift_retain();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if (objc_msgSend(v126, sel_isGroupSummary))
              {
                v51 = *(void **)(v50 + 16);
                *(void *)(v50 + 16) = 0;

                if (*(void *)(v50 + 16)) {
                  goto LABEL_41;
                }
LABEL_66:
                swift_beginAccess();
                swift_bridgeObjectRetain();
                unint64_t v85 = sub_2228D2448((uint64_t)buf, v128);
                char v87 = v86;
                swift_bridgeObjectRelease();
                if (v87)
                {
                  char v88 = swift_isUniquelyReferenced_nonNull_native();
                  uint64_t v89 = *v46;
                  uint64_t v134 = *v46;
                  uint64_t *v46 = 0x8000000000000000;
                  if ((v88 & 1) == 0)
                  {
                    sub_2228CF7EC(&qword_267F838F0);
                    uint64_t v89 = v134;
                  }
                  swift_bridgeObjectRelease();
                  sub_2228CF30C(v85, v89);
                  uint64_t *v46 = v89;
                  swift_bridgeObjectRelease();
                }
                swift_endAccess();
                swift_bridgeObjectRelease();
                swift_release();

                swift_release();
                swift_release();
                char isUniquelyReferenced_nonNull_native = v117;
              }
              else
              {
                if (qword_267F83740 != -1) {
                  swift_once();
                }
                uint64_t v76 = sub_2228D8288();
                __swift_project_value_buffer(v76, (uint64_t)qword_267F839F0);
                id v77 = v126;
                v78 = sub_2228D8268();
                os_log_type_t v79 = sub_2228D8408();
                if (os_log_type_enabled(v78, v79))
                {
                  os_log_type_t typea = v79;
                  v80 = (uint8_t *)swift_slowAlloc();
                  uint64_t v116 = swift_slowAlloc();
                  v135[0] = v116;
                  *(_DWORD *)v80 = 136315138;
                  v115 = v80;
                  id v81 = objc_msgSend(v77, sel_spotlightIdentifier);
                  uint64_t v82 = sub_2228D82E8();
                  log = v78;
                  unint64_t v84 = v83;

                  char isUniquelyReferenced_nonNull_native = v117;
                  sub_2228D5068(v82, v84, v135);
                  v35 = v126;
                  sub_2228D8478();

                  swift_bridgeObjectRelease();
                  _os_log_impl(&dword_22289A000, log, typea, "[SummaryServiceAdapter] Did not expect non group summary for spotlightIdentifier: %s", v115, 0xCu);
                  swift_arrayDestroy();
                  MEMORY[0x223CA0C70](v116, -1, -1);
                  MEMORY[0x223CA0C70](v115, -1, -1);

                  if (!*(void *)(v50 + 16)) {
                    goto LABEL_66;
                  }
                }
                else
                {

                  if (!*(void *)(v50 + 16)) {
                    goto LABEL_66;
                  }
                }
LABEL_41:
                swift_release();
                swift_release();
                swift_bridgeObjectRelease();
              }
            }
            else
            {
              swift_release();

              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
            }
          }
          else
          {
            swift_release();

            swift_bridgeObjectRelease();
          }
          uint64_t v3 = v121;
          goto LABEL_7;
        }
        swift_bridgeObjectRelease();
      }
      swift_endAccess();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

LABEL_7:
      if (v3 == ++v4) {
        goto LABEL_75;
      }
    }
    __break(1u);
LABEL_73:
    __break(1u);
LABEL_74:
    swift_bridgeObjectRetain();
  }
LABEL_75:
  swift_bridgeObjectRelease();
  v90 = (uint8_t *)(v2 + 64);
  uint64_t v91 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v92 = -1;
  if (v91 < 64) {
    uint64_t v92 = ~(-1 << v91);
  }
  unint64_t v93 = v92 & *(void *)(v2 + 64);
  v130 = (uint64_t *)(v131 + OBJC_IVAR___UNSSummaryServiceAdapter_queue_observers);
  id v127 = (id)((unint64_t)(v91 + 63) >> 6);
  swift_bridgeObjectRetain();
  uint64_t v94 = 0;
  bufa = (uint8_t *)(v2 + 64);
  while (v93)
  {
    unint64_t v95 = __clz(__rbit64(v93));
    v93 &= v93 - 1;
    unint64_t v96 = v95 | (v94 << 6);
LABEL_96:
    unint64_t v100 = v2;
    v101 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v96);
    uint64_t v103 = *v101;
    uint64_t v102 = v101[1];
    swift_beginAccess();
    uint64_t v104 = *v130;
    uint64_t v105 = *(void *)(*v130 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (!v105 || (unint64_t v106 = sub_2228D2448(v103, v102), (v107 & 1) == 0))
    {
      swift_endAccess();
      unint64_t v2 = v100;
      goto LABEL_79;
    }
    unint64_t v108 = *(void *)(*(void *)(v104 + 56) + 8 * v106);
    swift_endAccess();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    if (v108 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v109 = sub_2228D8508();
      swift_bridgeObjectRelease();
      unint64_t v2 = v100;
      if (!v109) {
        goto LABEL_79;
      }
    }
    else
    {
      uint64_t v109 = *(void *)((v108 & 0xFFFFFFFFFFFFFF8) + 0x10);
      unint64_t v2 = v100;
      if (!v109) {
        goto LABEL_79;
      }
    }
    if (v109 < 1) {
      goto LABEL_111;
    }
    uint64_t v110 = 0;
    do
    {
      if ((v108 & 0xC000000000000001) != 0)
      {
        v111 = (void *)MEMORY[0x223CA0140](v110, v108);
      }
      else
      {
        v111 = *(void **)(v108 + 8 * v110 + 32);
        swift_unknownObjectRetain();
      }
      ++v110;
      v112 = (void *)sub_2228D8348();
      objc_msgSend(v111, sel_summaryServiceAdapter_didReceiveGroupSummariesForNotificationIdentifiers_, v131, v112);
      swift_unknownObjectRelease();
    }
    while (v109 != v110);
    unint64_t v2 = v100;
    v90 = bufa;
LABEL_79:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v97 = v94 + 1;
  if (__OFADD__(v94, 1))
  {
    __break(1u);
LABEL_111:
    __break(1u);
    goto LABEL_112;
  }
  if (v97 >= (uint64_t)v127) {
    goto LABEL_109;
  }
  unint64_t v98 = *(void *)&v90[8 * v97];
  ++v94;
  if (v98) {
    goto LABEL_95;
  }
  uint64_t v94 = v97 + 1;
  if (v97 + 1 >= (uint64_t)v127) {
    goto LABEL_109;
  }
  unint64_t v98 = *(void *)&v90[8 * v94];
  if (v98) {
    goto LABEL_95;
  }
  uint64_t v94 = v97 + 2;
  if (v97 + 2 >= (uint64_t)v127) {
    goto LABEL_109;
  }
  unint64_t v98 = *(void *)&v90[8 * v94];
  if (v98)
  {
LABEL_95:
    unint64_t v93 = (v98 - 1) & v98;
    unint64_t v96 = __clz(__rbit64(v98)) + (v94 << 6);
    goto LABEL_96;
  }
  uint64_t v99 = v97 + 3;
  if (v99 >= (uint64_t)v127)
  {
LABEL_109:
    swift_release();
    return swift_bridgeObjectRelease();
  }
  unint64_t v98 = *(void *)&v90[8 * v99];
  if (v98)
  {
    uint64_t v94 = v99;
    goto LABEL_95;
  }
  while (1)
  {
    uint64_t v94 = v99 + 1;
    if (__OFADD__(v99, 1)) {
      break;
    }
    if (v94 >= (uint64_t)v127) {
      goto LABEL_109;
    }
    unint64_t v98 = *(void *)&v90[8 * v94];
    ++v99;
    if (v98) {
      goto LABEL_95;
    }
  }
LABEL_112:
  __break(1u);
LABEL_113:
  __break(1u);
LABEL_114:
  uint64_t result = sub_2228D8568();
  __break(1u);
  return result;
}

uint64_t sub_2228CE9EC()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t _s13SummaryBundleCMa()
{
  return self;
}

uint64_t sub_2228CEA48()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t _s11SummaryItemCMa()
{
  return self;
}

uint64_t type metadata accessor for UNSSummaryServiceAdapter(uint64_t a1)
{
  return sub_2228CEC40(a1, &qword_267F838D8);
}

uint64_t sub_2228CEC08()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t sub_2228CEC40(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_2228CEC7C()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2228CECBC()
{
  return sub_2228CDAA8(*(void *)(v0 + 24));
}

uint64_t sub_2228CECE4(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  char v37 = a2;
  uint64_t v7 = sub_2228D8528();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_40;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v36 = v6 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v6 + 64);
  int64_t v35 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v35) {
      break;
    }
    unint64_t v23 = (void *)(v6 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v35)
        {
LABEL_33:
          swift_release();
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v35) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v36 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v11 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = (uint64_t *)(*(void *)(v6 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void *)(*(void *)(v6 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    sub_2228D8588();
    sub_2228D8318();
    uint64_t result = sub_2228D8598();
    uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    unint64_t v19 = (void *)(*(void *)(v8 + 48) + 16 * v18);
    void *v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v8 + 56) + 8 * v18) = v33;
    ++*(void *)(v8 + 16);
  }
  swift_release();
  unint64_t v23 = (void *)(v6 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v6 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v23 = -1 << v34;
  }
  *(void *)(v6 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v4 = v8;
  return result;
}

uint64_t sub_2228CEFF8(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  char v37 = a2;
  uint64_t v7 = sub_2228D8528();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_40;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v36 = v6 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v6 + 64);
  int64_t v35 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v35) {
      break;
    }
    unint64_t v23 = (void *)(v6 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v35)
        {
LABEL_33:
          swift_release();
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v35) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v36 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v11 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = (uint64_t *)(*(void *)(v6 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void *)(*(void *)(v6 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_2228D8588();
    sub_2228D8318();
    uint64_t result = sub_2228D8598();
    uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    unint64_t v19 = (void *)(*(void *)(v8 + 48) + 16 * v18);
    void *v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v8 + 56) + 8 * v18) = v33;
    ++*(void *)(v8 + 16);
  }
  swift_release();
  unint64_t v23 = (void *)(v6 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v6 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v23 = -1 << v34;
  }
  *(void *)(v6 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v4 = v8;
  return result;
}

unint64_t sub_2228CF30C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_2228D84A8();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_2228D8588();
        swift_bridgeObjectRetain();
        sub_2228D8318();
        uint64_t v9 = sub_2228D8598();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          uint64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            _OWORD *v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          uint64_t v15 = (void *)(v14 + 8 * v3);
          unint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            void *v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  uint64_t *v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_2228CF4E4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_2228D2448(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_2228CF99C(&qword_26AC12018);
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_2228CEFF8(v15, a4 & 1, &qword_26AC12018);
  unint64_t v21 = sub_2228D2448(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_2228D8568();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  unint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  *unint64_t v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v26;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2228CF664(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  uint64_t v7 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_2228D2448(a2, a3);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= v17 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= v17 && (a4 & 1) == 0)
  {
    sub_2228CF7EC(a5);
LABEL_7:
    uint64_t v20 = (void *)*v7;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7];
      uint64_t result = swift_release();
      *(void *)(v21 + 8 * v14) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_2228CECE4(v17, a4 & 1, a5);
  unint64_t v23 = sub_2228D2448(a2, a3);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_17:
    uint64_t result = sub_2228D8568();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  uint64_t v20 = (void *)*v7;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  BOOL v25 = (uint64_t *)(v20[6] + 16 * v14);
  uint64_t *v25 = a2;
  v25[1] = a3;
  *(void *)(v20[7] + 8 * v14) = a1;
  uint64_t v26 = v20[2];
  BOOL v27 = __OFADD__(v26, 1);
  uint64_t v28 = v26 + 1;
  if (v27)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v20[2] = v28;
  return swift_bridgeObjectRetain();
}

void *sub_2228CF7EC(uint64_t *a1)
{
  unint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_2228D8518();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *unint64_t v2 = v5;
    return result;
  }
  uint64_t result = (void *)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    uint64_t result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v7 + 8 * v10);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 16 * v16;
    char v18 = (void *)(*(void *)(v3 + 48) + 16 * v16);
    uint64_t v19 = v18[1];
    uint64_t v20 = 8 * v16;
    uint64_t v21 = *(void *)(*(void *)(v3 + 56) + v20);
    char v22 = (void *)(*(void *)(v5 + 48) + v17);
    *char v22 = *v18;
    v22[1] = v19;
    *(void *)(*(void *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_retain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v7 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2228CF99C(uint64_t *a1)
{
  unint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_2228D8518();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *unint64_t v2 = v5;
    return result;
  }
  uint64_t result = (void *)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    uint64_t result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v7 + 8 * v10);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 16 * v16;
    char v18 = (void *)(*(void *)(v3 + 48) + 16 * v16);
    uint64_t v19 = v18[1];
    uint64_t v20 = 8 * v16;
    uint64_t v21 = *(void *)(*(void *)(v3 + 56) + v20);
    char v22 = (void *)(*(void *)(v5 + 48) + v17);
    *char v22 = *v18;
    v22[1] = v19;
    *(void *)(*(void *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v7 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void sub_2228CFB4C(void *a1@<X8>)
{
  sub_2228CCF60(v1[2], v1[3], v1[4], v1[5], v1[6], a1);
}

void (*sub_2228CFB70(void *a1, uint64_t a2, uint64_t a3))(uint64_t a1)
{
  unint64_t v6 = malloc(0x58uLL);
  *a1 = v6;
  v6[8] = a3;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  swift_bridgeObjectRetain();
  v6[9] = sub_2228CFE38(v6);
  v6[10] = sub_2228CFC90(v6 + 4, a2, a3, isUniquelyReferenced_nonNull_native);
  return sub_2228CFC1C;
}

void sub_2228CFC1C(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  unint64_t v2 = *(void (**)(void *, void))(*(void *)a1 + 72);
  (*(void (**)(void))(*(void *)a1 + 80))();
  swift_bridgeObjectRelease();
  v2(v1, 0);
  free(v1);
}

void (*sub_2228CFC90(void *a1, uint64_t a2, uint64_t a3, char a4))(uint64_t **a1)
{
  uint64_t v5 = v4;
  int64_t v10 = malloc(0x30uLL);
  *a1 = v10;
  v10[2] = a3;
  v10[3] = v4;
  v10[1] = a2;
  uint64_t v11 = *v4;
  unint64_t v13 = sub_2228D2448(a2, a3);
  *((unsigned char *)v10 + 40) = v12 & 1;
  uint64_t v14 = *(void *)(v11 + 16);
  BOOL v15 = (v12 & 1) == 0;
  uint64_t v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
  }
  else
  {
    char v17 = v12;
    uint64_t v18 = *(void *)(v11 + 24);
    if (v18 >= v16 && (a4 & 1) != 0)
    {
LABEL_7:
      v10[4] = v13;
      if (v17)
      {
LABEL_8:
        uint64_t v19 = *(void *)(*(void *)(*v5 + 56) + 8 * v13);
LABEL_12:
        void *v10 = v19;
        return sub_2228CFDE8;
      }
LABEL_11:
      uint64_t v19 = 0;
      goto LABEL_12;
    }
    if (v18 >= v16 && (a4 & 1) == 0)
    {
      sub_2228CF99C(&qword_26AC12018);
      goto LABEL_7;
    }
    sub_2228CEFF8(v16, a4 & 1, &qword_26AC12018);
    unint64_t v20 = sub_2228D2448(a2, a3);
    if ((v17 & 1) == (v21 & 1))
    {
      unint64_t v13 = v20;
      v10[4] = v20;
      if (v17) {
        goto LABEL_8;
      }
      goto LABEL_11;
    }
  }
  uint64_t result = (void (*)(uint64_t **))sub_2228D8568();
  __break(1u);
  return result;
}

void sub_2228CFDE8(uint64_t **a1)
{
  uint64_t v1 = *a1;
  sub_2228CFE74(*a1, *((unsigned char *)*a1 + 40), (uint64_t *)(*a1)[3], (*a1)[4], (*a1)[1], (*a1)[2]);
  swift_bridgeObjectRelease();
  free(v1);
}

uint64_t (*sub_2228CFE38(void *a1))(uint64_t result)
{
  *a1 = *v1;
  a1[1] = v1;
  void *v1 = 0x8000000000000000;
  return sub_2228CFE68;
}

uint64_t sub_2228CFE68(uint64_t result)
{
  **(void **)(result + 8) = *(void *)result;
  return result;
}

uint64_t *sub_2228CFE74(uint64_t *result, char a2, uint64_t *a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8 = *result;
  if (*result)
  {
    uint64_t v9 = (void *)*a3;
    if (a2)
    {
      *(void *)(v9[7] + 8 * a4) = v8;
    }
    else
    {
      v9[(a4 >> 6) + 8] |= 1 << a4;
      int64_t v10 = (void *)(v9[6] + 16 * a4);
      void *v10 = a5;
      v10[1] = a6;
      *(void *)(v9[7] + 8 * a4) = v8;
      uint64_t v11 = v9[2];
      BOOL v12 = __OFADD__(v11, 1);
      uint64_t v13 = v11 + 1;
      if (v12)
      {
        __break(1u);
        return result;
      }
      v9[2] = v13;
      swift_bridgeObjectRetain();
    }
  }
  else if (a2)
  {
    swift_arrayDestroy();
    sub_2228CF30C(a4, *a3);
  }
  return (uint64_t *)swift_bridgeObjectRetain();
}

void sub_2228CFF4C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_2228D8508();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x223CA0150);
}

uint64_t sub_2228CFFC8(unint64_t a1, uint64_t a2)
{
  if (a1 >> 62) {
    goto LABEL_11;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v5 = 0;
  if (v4)
  {
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        uint64_t v6 = MEMORY[0x223CA0140](v5, a1);
      }
      else
      {
        uint64_t v6 = *(void *)(a1 + 8 * v5 + 32);
        swift_unknownObjectRetain();
      }
      swift_unknownObjectRelease();
      if (v6 == a2) {
        break;
      }
      uint64_t v7 = v5 + 1;
      if (__OFADD__(v5, 1))
      {
        __break(1u);
LABEL_11:
        swift_bridgeObjectRetain();
        uint64_t v4 = sub_2228D8508();
        swift_bridgeObjectRelease();
        uint64_t v5 = 0;
        if (!v4) {
          return v5;
        }
      }
      else
      {
        ++v5;
        if (v7 == v4) {
          return 0;
        }
      }
    }
  }
  return v5;
}

uint64_t sub_2228D00BC(unint64_t *a1, uint64_t a2)
{
  unint64_t v5 = swift_bridgeObjectRetain();
  unint64_t v6 = sub_2228CFFC8(v5, a2);
  char v8 = v7;
  swift_bridgeObjectRelease();
  if (v2) {
    return v6;
  }
  if ((v8 & 1) == 0)
  {
    unint64_t v9 = v6 + 1;
    if (__OFADD__(v6, 1)) {
      goto LABEL_54;
    }
    if (*a1 >> 62)
    {
LABEL_55:
      swift_bridgeObjectRetain();
      uint64_t v24 = sub_2228D8508();
      swift_bridgeObjectRelease();
      if (v9 != v24) {
        goto LABEL_6;
      }
    }
    else if (v9 != *(void *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_6:
      for (unint64_t i = v6 + 5; ; ++i)
      {
        unint64_t v11 = i - 4;
        unint64_t v12 = *a1;
        if ((*a1 & 0xC000000000000001) != 0)
        {
          uint64_t v13 = MEMORY[0x223CA0140](i - 4);
        }
        else
        {
          if ((v11 & 0x8000000000000000) != 0)
          {
            __break(1u);
LABEL_45:
            __break(1u);
LABEL_46:
            __break(1u);
LABEL_47:
            __break(1u);
LABEL_48:
            __break(1u);
LABEL_49:
            __break(1u);
LABEL_50:
            __break(1u);
LABEL_51:
            __break(1u);
LABEL_52:
            __break(1u);
LABEL_53:
            __break(1u);
LABEL_54:
            __break(1u);
            goto LABEL_55;
          }
          if (v11 >= *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_45;
          }
          uint64_t v13 = *(void *)(v12 + 8 * i);
          swift_unknownObjectRetain();
        }
        swift_unknownObjectRelease();
        if (v13 != a2) {
          break;
        }
LABEL_32:
        unint64_t v9 = i - 3;
        if (__OFADD__(v11, 1)) {
          goto LABEL_46;
        }
        if (*a1 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v21 = sub_2228D8508();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v21 = *(void *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
        if (v9 == v21) {
          return v6;
        }
      }
      if (v11 == v6)
      {
LABEL_31:
        if (__OFADD__(v6++, 1)) {
          goto LABEL_47;
        }
        goto LABEL_32;
      }
      unint64_t v9 = *a1;
      if ((*a1 & 0xC000000000000001) != 0)
      {
        uint64_t v14 = MEMORY[0x223CA0140](v6, *a1);
        unint64_t v9 = *a1;
        if ((*a1 & 0xC000000000000001) == 0)
        {
LABEL_17:
          if ((v11 & 0x8000000000000000) != 0) {
            goto LABEL_50;
          }
          if (v11 >= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_51;
          }
          uint64_t v15 = *(void *)(v9 + 8 * i);
          swift_unknownObjectRetain();
          goto LABEL_20;
        }
      }
      else
      {
        if ((v6 & 0x8000000000000000) != 0) {
          goto LABEL_48;
        }
        if (v6 >= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_49;
        }
        uint64_t v14 = *(void *)(v9 + 8 * v6 + 32);
        swift_unknownObjectRetain();
        if ((v9 & 0xC000000000000001) == 0) {
          goto LABEL_17;
        }
      }
      uint64_t v15 = MEMORY[0x223CA0140](i - 4, v9);
      unint64_t v9 = *a1;
LABEL_20:
      int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *a1 = v9;
      if (!isUniquelyReferenced_nonNull_bridgeObject
        || (v9 & 0x8000000000000000) != 0
        || (v9 & 0x4000000000000000) != 0)
      {
        sub_2228CFF4C(v9);
        unint64_t v9 = v17;
        *a1 = v17;
      }
      *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 8 * v6 + 0x20) = v15;
      swift_unknownObjectRelease();
      sub_2228D8368();
      unint64_t v9 = *a1;
      int v18 = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *a1 = v9;
      if (!v18 || (v9 & 0x8000000000000000) != 0 || (v9 & 0x4000000000000000) != 0)
      {
        sub_2228CFF4C(v9);
        unint64_t v9 = v19;
        *a1 = v19;
      }
      if ((v11 & 0x8000000000000000) != 0) {
        goto LABEL_52;
      }
      if (v11 >= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_53;
      }
      *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 8 * i) = v14;
      swift_unknownObjectRelease();
      sub_2228D8368();
      goto LABEL_31;
    }
    return v6;
  }
  unint64_t v22 = *a1;
  if (!(v22 >> 62)) {
    return *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRetain();
  uint64_t v25 = sub_2228D8508();
  swift_bridgeObjectRelease();
  return v25;
}

uint64_t sub_2228D03DC(uint64_t a1, uint64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v2 = a2;
    uint64_t v4 = a1;
    if (!(*v3 >> 62))
    {
      if (*(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= a2) {
        goto LABEL_4;
      }
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_2228D8508();
  swift_bridgeObjectRelease();
  if (v21 < v2) {
    goto LABEL_33;
  }
LABEL_4:
  uint64_t v6 = v2 - v4;
  if (__OFSUB__(v2, v4))
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  uint64_t v5 = v4 - v2;
  if (__OFSUB__(0, v6))
  {
LABEL_35:
    __break(1u);
LABEL_36:
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_2228D8508();
    swift_bridgeObjectRelease();
    uint64_t v8 = v7 + v5;
    if (!__OFADD__(v7, v5)) {
      goto LABEL_8;
    }
LABEL_38:
    __break(1u);
LABEL_39:
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_2228D8508();
    swift_bridgeObjectRelease();
    unint64_t v9 = *v3;
    goto LABEL_15;
  }
  if (*v3 >> 62) {
    goto LABEL_36;
  }
  uint64_t v7 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v8 = v7 - v6;
  if (__OFADD__(v7, v5)) {
    goto LABEL_38;
  }
LABEL_8:
  unint64_t v9 = *v3;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  unint64_t *v3 = v9;
  uint64_t v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v9 & 0x8000000000000000) == 0 && (v9 & 0x4000000000000000) == 0)
  {
    uint64_t v11 = v9 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_18;
    }
    uint64_t v7 = 1;
  }
  if (v9 >> 62) {
    goto LABEL_39;
  }
  uint64_t v12 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v12 <= v8) {
    uint64_t v12 = v8;
  }
  swift_bridgeObjectRetain();
  unint64_t *v3 = MEMORY[0x223CA0150](v7, v12, 1, v9);
  swift_bridgeObjectRelease();
  uint64_t v11 = *v3 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  uint64_t v13 = v11 + 32;
  uint64_t v14 = (char *)(v11 + 32 + 8 * v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F83900);
  swift_arrayDestroy();
  if (v5)
  {
    if (*v3 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_2228D8508();
      swift_bridgeObjectRelease();
      uint64_t v16 = v22 - v2;
      if (!__OFSUB__(v22, v2))
      {
LABEL_21:
        if (v16 < 0)
        {
LABEL_46:
          uint64_t result = sub_2228D8548();
          __break(1u);
          return result;
        }
        unint64_t v17 = (char *)(v13 + 8 * v2);
        if (v4 != v2 || v14 >= &v17[8 * v16]) {
          memmove(v14, v17, 8 * v16);
        }
        if (!(*v3 >> 62))
        {
          uint64_t v18 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
          uint64_t v19 = v18 + v5;
          if (!__OFADD__(v18, v5))
          {
LABEL_27:
            *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) = v19;
            goto LABEL_28;
          }
          goto LABEL_45;
        }
LABEL_43:
        swift_bridgeObjectRetain();
        uint64_t v23 = sub_2228D8508();
        swift_bridgeObjectRelease();
        uint64_t v19 = v23 + v5;
        if (!__OFADD__(v23, v5)) {
          goto LABEL_27;
        }
LABEL_45:
        __break(1u);
        goto LABEL_46;
      }
    }
    else
    {
      uint64_t v15 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t v16 = v15 - v2;
      if (!__OFSUB__(v15, v2)) {
        goto LABEL_21;
      }
    }
    __break(1u);
    goto LABEL_43;
  }
LABEL_28:
  return sub_2228D8368();
}

uint64_t sub_2228D06EC()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2228D072C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_2228D07E0;
  return sub_2228CD590(a1, v4, v5, v6);
}

uint64_t sub_2228D07E0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2228D08D4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AC11FE0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2228D0944(uint64_t a1)
{
  return sub_2228D099C(a1, qword_267F83A08);
}

uint64_t sub_2228D0970(uint64_t a1)
{
  return sub_2228D099C(a1, qword_26AC120F0);
}

uint64_t sub_2228D099C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_2228D8288();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_2228D8278();
}

uint64_t sub_2228D0A14()
{
  sub_2228D8038();
  uint64_t result = sub_2228D8028();
  qword_267F83920 = result;
  return result;
}

uint64_t sub_2228D0A48(void *a1, void *a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  return sub_2228D0C04(a1, a2, a3, a4, a5, a6, (uint64_t)&unk_26D509D50, (uint64_t)sub_2228D29BC, MEMORY[0x263F841E8]);
}

uint64_t sub_2228D0BB4(void *a1, void *a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  return sub_2228D0C04(a1, a2, a3, a4, a5, a6, (uint64_t)&unk_26D509D00, (uint64_t)sub_2228D29BC, MEMORY[0x263F841F0]);
}

uint64_t sub_2228D0C04(void *a1, void *a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void (*a9)(char *, uint64_t, uint64_t))
{
  uint64_t v34 = a7;
  uint64_t v35 = a3;
  uint64_t v31 = a1;
  uint64_t v36 = a5;
  uint64_t v37 = a6;
  uint64_t v38 = a9;
  uint64_t v39 = a8;
  uint64_t v12 = sub_2228D8238();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  uint64_t v15 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v16 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v30 - v17;
  sub_2228D167C(a1, a2, a4, (uint64_t)&v30 - v17);
  sub_2228D80B8();
  uint64_t v33 = sub_2228D80A8();
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v18, v12);
  unint64_t v19 = (*(unsigned __int8 *)(v13 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  unint64_t v20 = (v14 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v21 = (v20 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v22 = (v21 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v23 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v13 + 32))(v23 + v19, v16, v12);
  uint64_t v24 = v36;
  *(void *)(v23 + v20) = v35;
  uint64_t v25 = v31;
  *(void *)(v23 + v21) = v31;
  uint64_t v26 = (void *)(v23 + v22);
  uint64_t v27 = v37;
  *uint64_t v26 = v24;
  v26[1] = v27;
  *(void *)(v23 + ((v22 + 23) & 0xFFFFFFFFFFFFFFF8)) = v32;
  id v28 = v25;
  swift_retain();
  v38(v18, v39, v23);
  swift_release();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v18, v12);
}

uint64_t sub_2228D0F38(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v21 = a3;
  uint64_t v22 = a4;
  uint64_t v8 = sub_2228D8238();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v21 - v13;
  sub_2228D167C(a1, 0, a2, (uint64_t)&v21 - v13);
  sub_2228D80B8();
  sub_2228D80A8();
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
  unint64_t v15 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  unint64_t v16 = (v10 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v17 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v17 + v15, v12, v8);
  uint64_t v18 = (void *)(v17 + v16);
  uint64_t v19 = v22;
  *uint64_t v18 = v21;
  v18[1] = v19;
  *(void *)(v17 + ((v16 + 23) & 0xFFFFFFFFFFFFFFF8)) = v5;
  swift_retain();
  sub_2228D8098();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v14, v8);
}

uint64_t sub_2228D11E4(unint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v43 = a3;
  uint64_t v37 = a2;
  uint64_t v4 = sub_2228D80E8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2228D8238();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  char v44 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v33 - v12;
  if (!(a1 >> 62))
  {
    uint64_t v14 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v14) {
      goto LABEL_3;
    }
LABEL_24:
    swift_bridgeObjectRelease();
    if (UNCUseGroupService()) {
      goto LABEL_21;
    }
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_2228D8508();
  if (!v14) {
    goto LABEL_24;
  }
LABEL_3:
  if (v14 < 1)
  {
    __break(1u);
    goto LABEL_27;
  }
  uint64_t v34 = v7;
  uint64_t v35 = v5;
  uint64_t v36 = v4;
  uint64_t v15 = 0;
  uint64_t v39 = v9 + 32;
  unint64_t v40 = a1 & 0xC000000000000001;
  uint64_t v38 = v9 + 8;
  unint64_t v16 = MEMORY[0x263F8EE78];
  uint64_t v41 = v14;
  unint64_t v42 = a1;
  do
  {
    if (v40) {
      id v17 = (id)MEMORY[0x223CA0140](v15, a1);
    }
    else {
      id v17 = *(id *)(a1 + 8 * v15 + 32);
    }
    uint64_t v18 = v17;
    id v19 = objc_msgSend(v17, sel_categoryID);
    if (v19)
    {
      unint64_t v20 = v19;
      uint64_t v21 = sub_2228D82E8();
      uint64_t v23 = v22;

      uint64_t v24 = v37;
      if (*(void *)(v37 + 16) && (unint64_t v25 = sub_2228D2448(v21, v23), (v26 & 1) != 0))
      {
        uint64_t v27 = *(void **)(*(void *)(v24 + 56) + 8 * v25);
        id v28 = v27;
      }
      else
      {
        uint64_t v27 = 0;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v27 = 0;
    }
    sub_2228D167C(v18, v27, v43, (uint64_t)v13);
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v44, v13, v8);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v16 = sub_2228D212C(0, *(void *)(v16 + 16) + 1, 1, v16);
    }
    unint64_t v30 = *(void *)(v16 + 16);
    unint64_t v29 = *(void *)(v16 + 24);
    if (v30 >= v29 >> 1) {
      unint64_t v16 = sub_2228D212C(v29 > 1, v30 + 1, 1, v16);
    }
    ++v15;
    *(void *)(v16 + 16) = v30 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v16+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(void *)(v9 + 72) * v30, v44, v8);

    (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v8);
    a1 = v42;
  }
  while (v41 != v15);
  swift_bridgeObjectRelease();
  uint64_t v5 = v35;
  uint64_t v4 = v36;
  uint64_t v7 = v34;
  if (UNCUseGroupService())
  {
LABEL_21:
    if (qword_267F83778 == -1)
    {
LABEL_22:
      __swift_instantiateConcreteTypeFromMangledName(&qword_267F83930);
      uint64_t v31 = swift_allocObject();
      *(_OWORD *)(v31 + 16) = xmmword_2228DABF0;
      sub_2228D80C8();
      uint64_t v45 = v31;
      sub_2228D2394();
      __swift_instantiateConcreteTypeFromMangledName(&qword_267F83940);
      sub_2228D23EC();
      sub_2228D8498();
      sub_2228D8008();
      swift_bridgeObjectRelease();
      return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
LABEL_27:
    swift_once();
    goto LABEL_22;
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_2228D167C@<X0>(void *a1@<X0>, void *a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  id v40 = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC11EB8);
  MEMORY[0x270FA5388]();
  uint64_t v39 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2228D8228();
  uint64_t v42 = *(void *)(v8 - 8);
  uint64_t v43 = v8;
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC11EB0);
  MEMORY[0x270FA5388]();
  uint64_t v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_2228D8188();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v45 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v16 = objc_msgSend(self, sel_notificationForBulletin_, a1);
  id v17 = a2;
  sub_2228D8108();
  id v18 = objc_msgSend(a1, sel_title);
  uint64_t v41 = v10;
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = sub_2228D82E8();
    uint64_t v37 = v21;
    uint64_t v38 = v20;
  }
  else
  {
    uint64_t v37 = 0;
    uint64_t v38 = 0;
  }
  uint64_t v44 = a4;
  id v22 = objc_msgSend(a1, sel_subtitle);
  if (v22)
  {
    uint64_t v23 = v22;
    sub_2228D82E8();
  }
  id v24 = objc_msgSend(a1, sel_message);
  if (v24)
  {
    unint64_t v25 = v24;
    sub_2228D82E8();
  }
  id v26 = objc_msgSend(a1, sel_summary);
  objc_msgSend(a1, sel_isHighlight);
  uint64_t v27 = v45;
  sub_2228D8168();
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v12, v27, v13);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v12, 0, 1, v13);
  sub_2228D81A8();
  if (objc_msgSend(a1, sel_hasCriticalIcon)) {
    objc_msgSend(a1, sel_interruptionLevel);
  }
  objc_msgSend(a1, sel_interruptionLevel);
  objc_msgSend(a1, sel_ignoresQuietMode);
  id v28 = v41;
  sub_2228D8218();
  uint64_t v30 = v42;
  uint64_t v29 = v43;
  uint64_t v31 = v39;
  (*(void (**)(char *, char *, uint64_t))(v42 + 16))(v39, v28, v43);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v31, 0, 1, v29);
  sub_2228D8148();
  objc_msgSend(v40, sel_allowPrivateProperties);
  sub_2228D81B8();
  id v32 = objc_msgSend(a1, sel_communicationContext);
  if (v32)
  {
    uint64_t v33 = v32;
    id v34 = (id)UNCommunicationContextFromBBCommunicationContext();
    sub_2228D81C8();
  }
  (*(void (**)(char *, uint64_t))(v30 + 8))(v28, v29);
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v45, v13);
}

UNSNotificationPipelineAdapter __swiftcall UNSNotificationPipelineAdapter.init()()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return (UNSNotificationPipelineAdapter)objc_msgSend(v0, sel_init);
}

id UNSNotificationPipelineAdapter.init()()
{
  v1.super_class = (Class)UNSNotificationPipelineAdapter;
  return objc_msgSendSuper2(&v1, sel_init);
}

uint64_t type metadata accessor for UNSNotificationPipelineAdapter(uint64_t a1)
{
  return sub_2228CEC40(a1, &qword_267F83928);
}

void sub_2228D1CCC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void (*a5)(id, uint64_t, uint64_t), uint64_t a6)
{
  uint64_t v12 = sub_2228D80E8();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!UNCUseGroupService()) {
    goto LABEL_6;
  }
  uint64_t v21 = a4;
  id v22 = a5;
  uint64_t v23 = a6;
  if (qword_267F83778 != -1) {
    swift_once();
  }
  uint64_t v20 = qword_267F83920;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC12088);
  uint64_t v16 = sub_2228D8238();
  uint64_t v17 = *(void *)(v16 - 8);
  unint64_t v18 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_2228DABF0;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v17 + 16))(v19 + v18, a2, v16);
  if ((a3 & 0x8000000000000000) == 0)
  {
    sub_2228D80D8();
    sub_2228D8008();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    a5 = v22;
    a6 = v23;
    a4 = v21;
LABEL_6:
    sub_2228D2DEC(a4, a3, a1, a5, a6);
    return;
  }
  __break(1u);
}

uint64_t sub_2228D1EF8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = UNCUseGroupService();
  if (v4)
  {
    if (qword_267F83778 != -1) {
      swift_once();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F83950);
    sub_2228D80F8();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_2228DABF0;
    sub_2228D81D8();
    sub_2228D8018();
    uint64_t v4 = swift_bridgeObjectRelease();
  }
  return a3(v4);
}

void *sub_2228D201C(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_267F83960);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2228D25A4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2228D212C(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC12088);
  uint64_t v10 = *(void *)(sub_2228D8238() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_2228D84F8();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_2228D8238() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_2228D2698(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

unint64_t sub_2228D2394()
{
  unint64_t result = qword_267F83938;
  if (!qword_267F83938)
  {
    sub_2228D80E8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F83938);
  }
  return result;
}

unint64_t sub_2228D23EC()
{
  unint64_t result = qword_267F83948;
  if (!qword_267F83948)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F83940);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F83948);
  }
  return result;
}

unint64_t sub_2228D2448(uint64_t a1, uint64_t a2)
{
  sub_2228D8588();
  sub_2228D8318();
  uint64_t v4 = sub_2228D8598();
  return sub_2228D24C0(a1, a2, v4);
}

unint64_t sub_2228D24C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_2228D8558() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_2228D8558() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_2228D25A4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_2228D8548();
  __break(1u);
  return result;
}

uint64_t sub_2228D2698(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_2228D8238() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = sub_2228D8548();
  __break(1u);
  return result;
}

uint64_t sub_2228D27F4()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2228D282C()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_2228D283C()
{
  uint64_t v1 = sub_2228D8238();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_2228D28EC(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_2228D8238() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8));
  return sub_2228D1EF8(a1, v1 + v4, v5);
}

uint64_t sub_2228D2998()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_2228D29C0(uint64_t a1)
{
  uint64_t v2 = sub_2228D8258();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  unint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v12 - v7;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 1, v2) == 1)
  {
    sub_2228D3870(a1, &qword_26AC12080);
  }
  else
  {
    uint64_t v9 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 32);
    v9(v8, a1, v2);
    v9(v6, (uint64_t)v8, v2);
    int v10 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v6, v2);
    if (v10 != *MEMORY[0x263F84510])
    {
      if (v10 == *MEMORY[0x263F844E8]) {
        return 1;
      }
      if (v10 == *MEMORY[0x263F844F0]) {
        return 2;
      }
      if (v10 == *MEMORY[0x263F84500]) {
        return 3;
      }
      if (v10 == *MEMORY[0x263F84508]) {
        return 4;
      }
      if (v10 == *MEMORY[0x263F844F8]) {
        return 5;
      }
      (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    }
  }
  return 0;
}

uint64_t sub_2228D2BE4(uint64_t a1)
{
  uint64_t v2 = sub_2228D8248();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  unint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v12 - v7;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 1, v2) == 1)
  {
    sub_2228D3870(a1, &qword_26AC12078);
  }
  else
  {
    uint64_t v9 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 32);
    v9(v8, a1, v2);
    v9(v6, (uint64_t)v8, v2);
    int v10 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v6, v2);
    if (v10 != *MEMORY[0x263F844D8])
    {
      if (v10 == *MEMORY[0x263F844C0]) {
        return 1;
      }
      if (v10 == *MEMORY[0x263F844C8]) {
        return 2;
      }
      if (v10 == *MEMORY[0x263F844D0]) {
        return 3;
      }
      if (v10 == *MEMORY[0x263F844B8]) {
        return 4;
      }
      (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    }
  }
  return 0;
}

void sub_2228D2DEC(void *a1, uint64_t a2, uint64_t a3, void (*a4)(id, uint64_t, uint64_t), uint64_t a5)
{
  uint64_t v85 = a5;
  char v86 = a4;
  uint64_t v84 = a2;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC11EB8);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  id v77 = (char *)&v72 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  id v81 = (char *)&v72 - v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC11EB0);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v82 = (char *)&v72 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  BOOL v15 = (char *)&v72 - v14;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC11EA8);
  MEMORY[0x270FA5388](v16 - 8);
  v78 = (char *)&v72 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_2228D7F68();
  uint64_t v79 = *(void *)(v18 - 8);
  uint64_t v80 = v18;
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  uint64_t v75 = (char *)&v72 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v76 = (char *)&v72 - v21;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC12078);
  MEMORY[0x270FA5388](v22 - 8);
  id v24 = (char *)&v72 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC12080);
  MEMORY[0x270FA5388](v25 - 8);
  uint64_t v27 = (char *)&v72 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_2228D8238();
  uint64_t v29 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v31 = (char *)&v72 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AC11EC0);
  MEMORY[0x270FA5388](v32);
  id v34 = (void **)((char *)&v72 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_2228D3808(a3, (uint64_t)v34);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    (*(void (**)(char *, void **, uint64_t))(v29 + 32))(v31, v34, v28);
    sub_2228D8128();
    objc_msgSend(a1, sel_setPriorityNotificationStatus_, sub_2228D29C0((uint64_t)v27));
    sub_2228D8118();
    objc_msgSend(a1, sel_setNotificationSummaryStatus_, sub_2228D2BE4((uint64_t)v24));
    char v45 = sub_2228D7FF8();
    v46 = a1;
    uint64_t v47 = (uint64_t)v81;
    if (v45)
    {
      sub_2228D81E8();
      if (v48)
      {
        char v49 = (void *)sub_2228D82D8();
        swift_bridgeObjectRelease();
      }
      else
      {
        char v49 = 0;
      }
      objc_msgSend(v46, sel_setMessage_, v49);
    }
    uint64_t v72 = v29;
    uint64_t v73 = v28;
    sub_2228D8198();
    uint64_t v50 = sub_2228D8188();
    uint64_t v51 = *(void *)(v50 - 8);
    unint64_t v74 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v51 + 48);
    int v52 = v74(v15, 1, v50);
    id v83 = v46;
    if (v52 == 1)
    {
      sub_2228D3870((uint64_t)v15, &qword_26AC11EB0);
      uint64_t v53 = (uint64_t)v78;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v79 + 56))(v78, 1, 1, v80);
    }
    else
    {
      uint64_t v54 = v78;
      sub_2228D8178();
      uint64_t v53 = (uint64_t)v54;
      (*(void (**)(char *, uint64_t))(v51 + 8))(v15, v50);
      uint64_t v55 = v79;
      char v56 = v54;
      uint64_t v57 = v80;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v79 + 48))(v56, 1, v80) != 1)
      {
        char v58 = v76;
        (*(void (**)(char *, uint64_t, uint64_t))(v55 + 32))(v76, v53, v57);
        v78 = (char *)sub_2228CEC40(0, &qword_267F83958);
        (*(void (**)(char *, char *, uint64_t))(v55 + 16))(v75, v58, v57);
        v59 = (void *)sub_2228D8468();
        objc_msgSend(v46, sel_setSummary_, v59);

        (*(void (**)(char *, uint64_t))(v55 + 8))(v58, v57);
LABEL_18:
        sub_2228D8138();
        uint64_t v60 = sub_2228D8228();
        uint64_t v61 = *(void *)(v60 - 8);
        uint64_t v62 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v61 + 48);
        if (v62(v47, 1, v60) == 1)
        {
          sub_2228D3870(v47, &qword_26AC11EB8);
          uint64_t v63 = 0;
        }
        else
        {
          uint64_t v63 = (void *)sub_2228D81F8();
          (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v47, v60);
        }
        objc_msgSend(v83, sel_setEventBehavior_, v63);

        uint64_t v64 = (uint64_t)v82;
        sub_2228D8198();
        if (v74((char *)v64, 1, v50) == 1)
        {
          sub_2228D3870(v64, &qword_26AC11EB0);
        }
        else
        {
          char v65 = sub_2228D8158();
          (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v64, v50);
          if (v65)
          {
            uint64_t v70 = (uint64_t)v77;
            sub_2228D8138();
            if (v62(v70, 1, v60) == 1)
            {
              sub_2228D3870(v70, &qword_26AC11EB8);
              id v66 = v83;
            }
            else
            {
              char v71 = sub_2228D8208();
              (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v70, v60);
              id v66 = v83;
              if (v71)
              {
                objc_msgSend(v83, sel_setIsHighlight_, 0);
                goto LABEL_25;
              }
            }
            objc_msgSend(v66, sel_setIsHighlight_, 1);
            uint64_t v67 = v84 | 0x200;
            goto LABEL_26;
          }
        }
        id v66 = v83;
        objc_msgSend(v83, sel_setIsHighlight_, 0);
LABEL_25:
        uint64_t v67 = v84;
LABEL_26:
        uint64_t v69 = v72;
        uint64_t v68 = v73;
        v86(v66, v67, 0);
        (*(void (**)(char *, uint64_t))(v69 + 8))(v31, v68);
        return;
      }
    }
    sub_2228D3870(v53, &qword_26AC11EA8);
    objc_msgSend(v46, sel_setSummary_, 0);
    goto LABEL_18;
  }
  uint64_t v35 = *v34;
  if (qword_267F83768 != -1) {
    swift_once();
  }
  uint64_t v36 = sub_2228D8288();
  __swift_project_value_buffer(v36, (uint64_t)qword_267F83A08);
  id v37 = v35;
  id v38 = v35;
  uint64_t v39 = sub_2228D8268();
  os_log_type_t v40 = sub_2228D8408();
  if (os_log_type_enabled(v39, v40))
  {
    uint64_t v41 = (uint8_t *)swift_slowAlloc();
    uint64_t v42 = swift_slowAlloc();
    uint64_t v88 = v42;
    *(_DWORD *)uint64_t v41 = 136315138;
    swift_getErrorValue();
    uint64_t v43 = sub_2228D8578();
    uint64_t v87 = sub_2228D5068(v43, v44, &v88);
    sub_2228D8478();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_22289A000, v39, v40, "Failed to update notification via adapter: %s", v41, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223CA0C70](v42, -1, -1);
    MEMORY[0x223CA0C70](v41, -1, -1);
  }
  else
  {
  }
  objc_msgSend(a1, sel_setPriorityNotificationStatus_, 4);
  objc_msgSend(a1, sel_setNotificationSummaryStatus_, 3);
  v86(a1, v84, 1);
}

uint64_t sub_2228D3808(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AC11EC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2228D3870(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t objectdestroy_9Tm()
{
  uint64_t v1 = sub_2228D8238();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  swift_release();
  return MEMORY[0x270FA0238](v0, ((((v6 + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8, v5);
}

void sub_2228D39A0(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_2228D8238() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_2228D1CCC(a1, v1 + v4, *(void *)(v1 + v5), *(void **)(v1 + ((v5 + 15) & 0xFFFFFFFFFFFFFFF8)), *(void (**)(id, uint64_t, uint64_t))(v1 + ((((v5 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)), *(void *)(v1 + ((((v5 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8));
}

void __swiftcall UNSServerActionHandler.init()(UNSServerActionHandler *__return_ptr retstr)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  objc_msgSend(v1, sel_init);
}

char *UNSServerActionHandler.init()()
{
  id v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AC11FE0);
  MEMORY[0x270FA5388](v2 - 8);
  unint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectWeakInit();
  uint64_t v5 = OBJC_IVAR___UNSServerActionHandler_vendor;
  unint64_t v6 = v0;
  sub_2228D8308();
  sub_2228D7F98();
  swift_allocObject();
  *(void *)&v0[v5] = sub_2228D7F78();
  uint64_t v7 = &unk_267F83000;
  *(void *)&v6[OBJC_IVAR___UNSServerActionHandler_fetchTask] = 0;
  if (qword_26AC11FA0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_2228D8288();
  __swift_project_value_buffer(v8, (uint64_t)qword_26AC120F0);
  uint64_t v9 = v6;
  uint64_t v10 = sub_2228D8268();
  os_log_type_t v11 = sub_2228D8408();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v25 = v4;
    uint64_t v14 = v13;
    *(_DWORD *)uint64_t v12 = 136315138;
    uint64_t v27 = v13;
    uint64_t v26 = *(void *)&v1[v5];
    swift_retain();
    uint64_t v15 = sub_2228D82F8();
    uint64_t v26 = sub_2228D5068(v15, v16, &v27);
    sub_2228D8478();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22289A000, v10, v11, "ServerActionHandler init(): vendor: %s", v12, 0xCu);
    swift_arrayDestroy();
    uint64_t v17 = v14;
    unint64_t v4 = v25;
    MEMORY[0x223CA0C70](v17, -1, -1);
    uint64_t v18 = v12;
    uint64_t v7 = (void *)&unk_267F83000;
    MEMORY[0x223CA0C70](v18, -1, -1);
  }
  else
  {
  }
  v28.receiver = v9;
  v28.super_class = (Class)UNSServerActionHandler;
  uint64_t v19 = (char *)objc_msgSendSuper2(&v28, sel_init);
  uint64_t v20 = sub_2228D83B8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v4, 1, 1, v20);
  uint64_t v21 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v22 = (void *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = v21;
  *(void *)&v19[v7[303]] = sub_2228D4964((uint64_t)v4, (uint64_t)&unk_267F83988, (uint64_t)v22);
  swift_release();
  return v19;
}

uint64_t sub_2228D3E34()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2228D3E6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[6] = a4;
  uint64_t v5 = sub_2228D8088();
  v4[7] = v5;
  v4[8] = *(void *)(v5 - 8);
  v4[9] = swift_task_alloc();
  v4[10] = swift_task_alloc();
  v4[11] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AC11ED0);
  v4[12] = swift_task_alloc();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC11FF8);
  v4[13] = v6;
  v4[14] = *(void *)(v6 - 8);
  v4[15] = swift_task_alloc();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC11FF0);
  v4[16] = v7;
  v4[17] = *(void *)(v7 - 8);
  v4[18] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2228D4038, 0, 0);
}

uint64_t sub_2228D4038()
{
  uint64_t v1 = v0[6] + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x223CA0D10](v1);
  v0[19] = v2;
  uint64_t v3 = v0[15];
  if (v2)
  {
    uint64_t v4 = v0[13];
    uint64_t v5 = v0[14];
    sub_2228D7F88();
    sub_2228D83C8();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
    uint64_t v6 = (void *)swift_task_alloc();
    v0[20] = v6;
    *uint64_t v6 = v0;
    v6[1] = sub_2228D41D4;
    uint64_t v7 = v0[16];
    uint64_t v8 = v0[12];
    return MEMORY[0x270FA1F68](v8, 0, 0, v7);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v9 = (uint64_t (*)(void))v0[1];
    return v9();
  }
}

uint64_t sub_2228D41D4()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2228D42D0, 0, 0);
}

uint64_t sub_2228D42D0()
{
  uint64_t v53 = v0;
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v2 = *(void *)(v0 + 56);
  uint64_t v3 = *(void *)(v0 + 64);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    uint64_t v4 = *(void **)(v0 + 152);
    (*(void (**)(void, void))(*(void *)(v0 + 136) + 8))(*(void *)(v0 + 144), *(void *)(v0 + 128));

LABEL_9:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v16 = *(uint64_t (**)(void))(v0 + 8);
    return v16();
  }
  (*(void (**)(void, uint64_t, uint64_t))(v3 + 32))(*(void *)(v0 + 88), v1, v2);
  if (sub_2228D83F8())
  {
    if (qword_26AC11FA0 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_2228D8288();
    __swift_project_value_buffer(v5, (uint64_t)qword_26AC120F0);
    uint64_t v6 = sub_2228D8268();
    os_log_type_t v7 = sub_2228D8408();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_22289A000, v6, v7, "ServerActionHandler init() task cancelled", v8, 2u);
      MEMORY[0x223CA0C70](v8, -1, -1);
    }
    uint64_t v9 = *(void *)(v0 + 144);
    uint64_t v10 = *(void **)(v0 + 152);
    uint64_t v11 = *(void *)(v0 + 128);
    uint64_t v12 = *(void *)(v0 + 136);
    uint64_t v13 = *(void *)(v0 + 88);
    uint64_t v14 = *(void *)(v0 + 56);
    uint64_t v15 = *(void *)(v0 + 64);

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v9, v11);
    goto LABEL_9;
  }
  if (qword_26AC11FA0 != -1) {
    swift_once();
  }
  uint64_t v18 = *(void **)(v0 + 152);
  uint64_t v19 = *(void *)(v0 + 80);
  uint64_t v20 = *(void *)(v0 + 88);
  uint64_t v21 = *(void *)(v0 + 56);
  uint64_t v22 = *(void *)(v0 + 64);
  uint64_t v23 = sub_2228D8288();
  __swift_project_value_buffer(v23, (uint64_t)qword_26AC120F0);
  uint64_t v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16);
  v24(v19, v20, v21);
  id v25 = v18;
  uint64_t v26 = sub_2228D8268();
  os_log_type_t v27 = sub_2228D8408();
  BOOL v28 = os_log_type_enabled(v26, v27);
  uint64_t v29 = *(void **)(v0 + 152);
  uint64_t v30 = *(void *)(v0 + 80);
  if (v28)
  {
    uint64_t v31 = *(void *)(v0 + 64);
    uint64_t v32 = *(void *)(v0 + 72);
    uint64_t v33 = *(void *)(v0 + 56);
    os_log_type_t type = v27;
    uint64_t v34 = swift_slowAlloc();
    uint64_t v51 = swift_slowAlloc();
    uint64_t v52 = v51;
    *(_DWORD *)uint64_t v34 = 136315394;
    v24(v32, v30, v33);
    uint64_t v35 = sub_2228D82F8();
    *(void *)(v34 + 4) = sub_2228D5068(v35, v36, &v52);
    swift_bridgeObjectRelease();
    id v37 = *(void (**)(uint64_t, uint64_t))(v31 + 8);
    v37(v30, v33);
    *(_WORD *)(v34 + 12) = 2080;
    *(void *)(v0 + 40) = objc_msgSend(v29, sel_delegate);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F839C8);
    uint64_t v38 = sub_2228D82F8();
    *(void *)(v34 + 14) = sub_2228D5068(v38, v39, &v52);
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_22289A000, v26, type, "ServerActionHandler init() vendor returned: %s sending to delegate: %s", (uint8_t *)v34, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x223CA0C70](v51, -1, -1);
    MEMORY[0x223CA0C70](v34, -1, -1);
  }
  else
  {
    id v37 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 64) + 8);
    v37(*(void *)(v0 + 80), *(void *)(v0 + 56));
  }
  id v40 = objc_msgSend(*(id *)(v0 + 152), sel_delegate);
  if (v40)
  {
    uint64_t v41 = v40;
    sub_2228D8048();
    uint64_t v42 = (void *)sub_2228D82D8();
    swift_bridgeObjectRelease();
    sub_2228D8068();
    uint64_t v43 = (void *)sub_2228D82D8();
    swift_bridgeObjectRelease();
    sub_2228D8058();
    unint64_t v44 = (void *)sub_2228D82D8();
    swift_bridgeObjectRelease();
    sub_2228D8078();
    if (v45)
    {
      v46 = (void *)sub_2228D82D8();
      swift_bridgeObjectRelease();
    }
    else
    {
      v46 = 0;
    }
    objc_msgSend(v41, sel_performAction_forNotification_inApp_withUserText_, v42, v43, v44, v46);

    swift_unknownObjectRelease();
  }
  v37(*(void *)(v0 + 88), *(void *)(v0 + 56));
  uint64_t v47 = (void *)swift_task_alloc();
  *(void *)(v0 + 160) = v47;
  void *v47 = v0;
  v47[1] = sub_2228D41D4;
  uint64_t v48 = *(void *)(v0 + 128);
  uint64_t v49 = *(void *)(v0 + 96);
  return MEMORY[0x270FA1F68](v49, 0, 0, v48);
}

uint64_t sub_2228D4870()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2228D48B0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  os_log_type_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_2228D07E0;
  return sub_2228D3E6C(a1, v4, v5, v6);
}

uint64_t sub_2228D4964(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2228D83B8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2228D83A8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_2228D08D4(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2228D8398();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

id sub_2228D4B2C()
{
  if (qword_26AC11FA0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_2228D8288();
  __swift_project_value_buffer(v1, (uint64_t)qword_26AC120F0);
  uint64_t v2 = v0;
  uint64_t v3 = sub_2228D8268();
  os_log_type_t v4 = sub_2228D8408();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 138412290;
    uint64_t v7 = v2;
    sub_2228D8478();
    *uint64_t v6 = v2;

    _os_log_impl(&dword_22289A000, v3, v4, "ServerActionHandler deinit %@ - cancelling task", v5, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F839A0);
    swift_arrayDestroy();
    MEMORY[0x223CA0C70](v6, -1, -1);
    MEMORY[0x223CA0C70](v5, -1, -1);
  }
  else
  {
  }
  if (*(void *)&v2[OBJC_IVAR___UNSServerActionHandler_fetchTask])
  {
    swift_retain();
    sub_2228D83E8();
    swift_release();
  }
  v9.receiver = v2;
  v9.super_class = (Class)UNSServerActionHandler;
  return objc_msgSendSuper2(&v9, sel_dealloc);
}

uint64_t sub_2228D4DA8(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_2228D4DB8(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_2228D4DF4(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  os_log_type_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_2228D4ED0;
  return v6(a1);
}

uint64_t sub_2228D4ED0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2228D4FC8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_2228D4FF0(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_2228D5068(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_2228D8478();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_2228D5068(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2228D513C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2228D5788((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_2228D5788((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2228D513C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_2228D8488();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_2228D52F8(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_2228D84E8();
  if (!v8)
  {
    sub_2228D84F8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_2228D8548();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_2228D52F8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_2228D5390(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2228D5570(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_2228D5570(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2228D5390(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_2228D5508(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_2228D84B8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_2228D84F8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_2228D8328();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_2228D8548();
    __break(1u);
LABEL_14:
    uint64_t result = sub_2228D84F8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_2228D5508(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F839A8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2228D5570(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F839A8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_2228D8548();
  __break(1u);
  return result;
}

unsigned char **sub_2228D56C0(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  unsigned char *v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

unint64_t type metadata accessor for UNSServerActionHandler()
{
  unint64_t result = qword_267F83998;
  if (!qword_267F83998)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267F83998);
  }
  return result;
}

uint64_t sub_2228D5710(uint64_t a1)
{
  return a1;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_2228D5788(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2228D57E4()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2228D581C(uint64_t a1)
{
  unint64_t v4 = *(int **)(v1 + 16);
  size_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *size_t v5 = v2;
  v5[1] = sub_2228D07E0;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_267F839B0 + dword_267F839B0);
  return v6(a1, v4);
}

uint64_t sub_2228D58D4()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void UNSDidCompleteDeliveryOfForegroundAction_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_22289A000, v0, v1, "UNSDidCompleteDeliveryOfForegroundAction with error: %@", v2, v3, v4, v5, v6);
}

void __UNSDidCompleteDeliveryOfForegroundAction_block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_22289A000, log, OS_LOG_TYPE_ERROR, "UNSDidCompleteDeliveryOfForegroundAction failed to decode data", v1, 2u);
}

uint64_t sub_2228D7F68()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t sub_2228D7F78()
{
  return MEMORY[0x270F83480]();
}

uint64_t sub_2228D7F88()
{
  return MEMORY[0x270F83488]();
}

uint64_t sub_2228D7F98()
{
  return MEMORY[0x270F83490]();
}

uint64_t sub_2228D7FA8()
{
  return MEMORY[0x270F83498]();
}

uint64_t sub_2228D7FB8()
{
  return MEMORY[0x270F834A0]();
}

uint64_t sub_2228D7FC8()
{
  return MEMORY[0x270F834A8]();
}

uint64_t sub_2228D7FE8()
{
  return MEMORY[0x270F834B8]();
}

uint64_t sub_2228D7FF8()
{
  return MEMORY[0x270F834C0]();
}

uint64_t sub_2228D8008()
{
  return MEMORY[0x270F834C8]();
}

uint64_t sub_2228D8018()
{
  return MEMORY[0x270F834D0]();
}

uint64_t sub_2228D8028()
{
  return MEMORY[0x270F834D8]();
}

uint64_t sub_2228D8038()
{
  return MEMORY[0x270F834E0]();
}

uint64_t sub_2228D8048()
{
  return MEMORY[0x270F834E8]();
}

uint64_t sub_2228D8058()
{
  return MEMORY[0x270F834F0]();
}

uint64_t sub_2228D8068()
{
  return MEMORY[0x270F834F8]();
}

uint64_t sub_2228D8078()
{
  return MEMORY[0x270F83500]();
}

uint64_t sub_2228D8088()
{
  return MEMORY[0x270F83508]();
}

uint64_t sub_2228D8098()
{
  return MEMORY[0x270F83510]();
}

uint64_t sub_2228D80A8()
{
  return MEMORY[0x270F83518]();
}

uint64_t sub_2228D80B8()
{
  return MEMORY[0x270F83520]();
}

uint64_t sub_2228D80C8()
{
  return MEMORY[0x270F83548]();
}

uint64_t sub_2228D80D8()
{
  return MEMORY[0x270F83550]();
}

uint64_t sub_2228D80E8()
{
  return MEMORY[0x270F83558]();
}

uint64_t sub_2228D80F8()
{
  return MEMORY[0x270F83590]();
}

uint64_t sub_2228D8108()
{
  return MEMORY[0x270F835B0]();
}

uint64_t sub_2228D8118()
{
  return MEMORY[0x270F835B8]();
}

uint64_t sub_2228D8128()
{
  return MEMORY[0x270F835C8]();
}

uint64_t sub_2228D8138()
{
  return MEMORY[0x270F835D8]();
}

uint64_t sub_2228D8148()
{
  return MEMORY[0x270F835E0]();
}

uint64_t sub_2228D8158()
{
  return MEMORY[0x270F83600]();
}

uint64_t sub_2228D8168()
{
  return MEMORY[0x270F83610]();
}

uint64_t sub_2228D8178()
{
  return MEMORY[0x270F83628]();
}

uint64_t sub_2228D8188()
{
  return MEMORY[0x270F83630]();
}

uint64_t sub_2228D8198()
{
  return MEMORY[0x270F83650]();
}

uint64_t sub_2228D81A8()
{
  return MEMORY[0x270F83658]();
}

uint64_t sub_2228D81B8()
{
  return MEMORY[0x270F836B0]();
}

uint64_t sub_2228D81C8()
{
  return MEMORY[0x270F836C0]();
}

uint64_t sub_2228D81D8()
{
  return MEMORY[0x270F836D0]();
}

uint64_t sub_2228D81E8()
{
  return MEMORY[0x270F836D8]();
}

uint64_t sub_2228D81F8()
{
  return MEMORY[0x270F836E8]();
}

uint64_t sub_2228D8208()
{
  return MEMORY[0x270F83708]();
}

uint64_t sub_2228D8218()
{
  return MEMORY[0x270F83710]();
}

uint64_t sub_2228D8228()
{
  return MEMORY[0x270F83720]();
}

uint64_t sub_2228D8238()
{
  return MEMORY[0x270F83748]();
}

uint64_t sub_2228D8248()
{
  return MEMORY[0x270F837A8]();
}

uint64_t sub_2228D8258()
{
  return MEMORY[0x270F837B0]();
}

uint64_t sub_2228D8268()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2228D8278()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2228D8288()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2228D8298()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_2228D82A8()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_2228D82B8()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_2228D82C8()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_2228D82D8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2228D82E8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2228D82F8()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_2228D8308()
{
  return MEMORY[0x270F83560]();
}

uint64_t sub_2228D8318()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2228D8328()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2228D8338()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_2228D8348()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_2228D8358()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_2228D8368()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2228D8378()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_2228D8388()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_2228D8398()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2228D83A8()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2228D83B8()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2228D83C8()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_2228D83E8()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_2228D83F8()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_2228D8408()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2228D8418()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_2228D8428()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_2228D8438()
{
  return MEMORY[0x270FA0D88]();
}

uint64_t sub_2228D8448()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_2228D8458()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_2228D8468()
{
  return MEMORY[0x270EF1FD0]();
}

uint64_t sub_2228D8478()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2228D8488()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2228D8498()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_2228D84A8()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_2228D84B8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2228D84C8()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2228D84D8()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_2228D84E8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2228D84F8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2228D8508()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2228D8518()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_2228D8528()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_2228D8538()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2228D8548()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2228D8558()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2228D8568()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2228D8578()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_2228D8588()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2228D8598()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t BBPublisherDestinationStrings()
{
  return MEMORY[0x270F128F8]();
}

uint64_t BSBundleIDForPID()
{
  return MEMORY[0x270F106D8]();
}

uint64_t BSBundlePathForPID()
{
  return MEMORY[0x270F106E0]();
}

uint64_t BSIsSymbolicLinkAtPath()
{
  return MEMORY[0x270F10868]();
}

uint64_t BSSystemRootDirectory()
{
  return MEMORY[0x270F10970]();
}

uint64_t BSXPCConnectionHasEntitlement()
{
  return MEMORY[0x270F10990]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E68]();
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x270EE54C8](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE54D0](allocator, userNotification, callout, order);
}

uint64_t INBundleProxyCanDonateIntent()
{
  return MEMORY[0x270EF51A8]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x270EF2BD8](directory, domainMask, expandTilde);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

uint64_t TCCAccessCopyBundleIdentifiersForService()
{
  return MEMORY[0x270F795B8]();
}

uint64_t UNAuthorizationStatusString()
{
  return MEMORY[0x270F063F8]();
}

uint64_t UNCDaemonEnabled()
{
  return MEMORY[0x270F06410]();
}

uint64_t UNCDecodeNotificationActionSelector()
{
  return MEMORY[0x270F83568]();
}

uint64_t UNCPowerLogUserNotificationDefaultTriggerEvent()
{
  return MEMORY[0x270F83570]();
}

uint64_t UNCRemoteServicesNeeded()
{
  return MEMORY[0x270F06420]();
}

uint64_t UNCUseGroupService()
{
  return MEMORY[0x270F06428]();
}

uint64_t UNCUsePipeline()
{
  return MEMORY[0x270F06430]();
}

uint64_t UNCommunicationContextFromBBCommunicationContext()
{
  return MEMORY[0x270F83880]();
}

uint64_t UNFormatLocalizedStringInBundleWithDefaultValue()
{
  return MEMORY[0x270F06470]();
}

uint64_t UNIsInternalInstall()
{
  return MEMORY[0x270F06478]();
}

uint64_t UNNotificationAttachmentFamilyMaximumSize()
{
  return MEMORY[0x270F06488]();
}

uint64_t UNNotificationDestinationStrings()
{
  return MEMORY[0x270F06490]();
}

uint64_t UNSafeCast()
{
  return MEMORY[0x270F064A8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
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

void dispatch_assert_queue_V2(dispatch_queue_t queue)
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
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

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
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

void objc_moveWeak(id *to, id *from)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

uint64_t self
{
  return MEMORY[0x270F9A730]();
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t sandbox_check_by_audit_token()
{
  return MEMORY[0x270EDB298]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}