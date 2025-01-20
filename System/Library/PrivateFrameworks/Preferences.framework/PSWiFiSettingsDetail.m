@interface PSWiFiSettingsDetail
+ (BOOL)isEnabled;
+ (id)iconImage;
+ (id)preferencesURL;
+ (void)setEnabled:(BOOL)a3;
@end

@implementation PSWiFiSettingsDetail

+ (id)preferencesURL
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=WIFI"];
}

+ (id)iconImage
{
  return (id)objc_msgSend(MEMORY[0x1E4F42A80], "ps_synchronousIconWithTypeIdentifier:", @"com.apple.graphic-icon.wifi");
}

+ (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = PSWiFiManagerClientCreate(*MEMORY[0x1E4F1CF80]);
  if (v4)
  {
    v5 = (const void *)v4;
    CFRunLoopRef Current = CFRunLoopGetCurrent();
    uint64_t v7 = *MEMORY[0x1E4F1D418];
    PSWiFiManagerClientScheduleWithRunLoop((uint64_t)v5, (uint64_t)Current, *MEMORY[0x1E4F1D418]);
    v8 = (void *)PSWiFiManagerClientCopyDevices((uint64_t)v5);
    if ([v8 count])
    {
      v9 = [v8 objectAtIndexedSubscript:0];

      if (PSWiFiDeviceClientGetPower((uint64_t)v9) != v3)
      {
        v10 = _PSLoggingFacility();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v16[0]) = 0;
          _os_log_impl(&dword_1A6597000, v10, OS_LOG_TYPE_DEFAULT, "Toggled Wifi State.", (uint8_t *)v16, 2u);
        }

        uint64_t v18 = 0;
        v19 = &v18;
        uint64_t v20 = 0x2020000000;
        v11 = (void (*)(const void *, BOOL))getWiFiManagerClientSetPowerSymbolLoc_ptr;
        v21 = getWiFiManagerClientSetPowerSymbolLoc_ptr;
        if (!getWiFiManagerClientSetPowerSymbolLoc_ptr)
        {
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __getWiFiManagerClientSetPowerSymbolLoc_block_invoke;
          v16[3] = &unk_1E5C5D4D8;
          v17 = &v18;
          v12 = (void *)MobileWiFiLibrary();
          v13 = dlsym(v12, "WiFiManagerClientSetPower");
          *(void *)(v17[1] + 24) = v13;
          getWiFiManagerClientSetPowerSymbolLoc_ptr = *(_UNKNOWN **)(v17[1] + 24);
          v11 = (void (*)(const void *, BOOL))v19[3];
        }
        _Block_object_dispose(&v18, 8);
        if (!v11)
        {
          v15 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
          _Block_object_dispose(&v18, 8);
          _Unwind_Resume(v15);
        }
        v11(v5, v3);
      }
    }
    CFRunLoopRef v14 = CFRunLoopGetCurrent();
    PSWiFiManagerClientUnscheduleFromRunLoop((uint64_t)v5, (uint64_t)v14, v7);
    CFRelease(v5);
  }
}

+ (BOOL)isEnabled
{
  uint64_t v2 = PSWiFiManagerClientCreate(*MEMORY[0x1E4F1CF80]);
  if (!v2) {
    return 0;
  }
  BOOL v3 = (const void *)v2;
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  uint64_t v5 = *MEMORY[0x1E4F1D418];
  PSWiFiManagerClientScheduleWithRunLoop((uint64_t)v3, (uint64_t)Current, *MEMORY[0x1E4F1D418]);
  v6 = (void *)PSWiFiManagerClientCopyDevices((uint64_t)v3);
  if ([v6 count])
  {
    uint64_t v7 = [v6 objectAtIndexedSubscript:0];

    BOOL v8 = PSWiFiDeviceClientGetPower((uint64_t)v7) != 0;
  }
  else
  {
    BOOL v8 = 0;
  }
  CFRunLoopRef v9 = CFRunLoopGetCurrent();
  PSWiFiManagerClientUnscheduleFromRunLoop((uint64_t)v3, (uint64_t)v9, v5);
  CFRelease(v3);

  return v8;
}

@end