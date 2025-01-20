@interface PSHotspotModeSettingsDetail
+ (BOOL)deviceSupportsPersonalHotspot;
+ (BOOL)isDiscoverable;
+ (BOOL)isEnabled;
+ (NETRBClient)getNETRBClient;
+ (id)iconImage;
+ (id)preferencesURL;
+ (void)setDiscoverable:(BOOL)a3;
+ (void)setEnabled:(BOOL)a3;
@end

@implementation PSHotspotModeSettingsDetail

+ (id)preferencesURL
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=ROOT#INTERNET_TETHERING"];
}

+ (id)iconImage
{
  return (id)objc_msgSend(MEMORY[0x1E4F42A80], "ps_synchronousIconWithTypeIdentifier:", @"com.apple.graphic-icon.personal-hotspot");
}

+ (BOOL)deviceSupportsPersonalHotspot
{
  return MGGetBoolAnswer();
}

+ (NETRBClient)getNETRBClient
{
  result = (NETRBClient *)_netrbClient;
  if (!_netrbClient)
  {
    v3 = (void *)MEMORY[0x1E4F14428];
    id v4 = MEMORY[0x1E4F14428];
    id v5 = v3;
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x2020000000;
    v6 = get_NETRBClientCreateSymbolLoc_ptr;
    v14 = get_NETRBClientCreateSymbolLoc_ptr;
    if (!get_NETRBClientCreateSymbolLoc_ptr)
    {
      v7 = (void *)NetrbLibrary();
      v12[3] = (uint64_t)dlsym(v7, "_NETRBClientCreate");
      get_NETRBClientCreateSymbolLoc_ptr = (_UNKNOWN *)v12[3];
      v6 = (void *)v12[3];
    }
    _Block_object_dispose(&v11, 8);
    if (!v6)
    {
      v10 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
      _Block_object_dispose(&v11, 8);
      _Unwind_Resume(v10);
    }
    v8 = (void *)MEMORY[0x1E4F14428];
    uint64_t v9 = ((uint64_t (*)(void, void *, void))v6)(MEMORY[0x1E4F14428], &__block_literal_global_36, 0);

    _netrbClient = v9;
    return (NETRBClient *)_netrbClient;
  }
  return result;
}

uint64_t __45__PSHotspotModeSettingsDetail_getNETRBClient__block_invoke()
{
  return 0;
}

+ (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[PSHotspotModeSettingsDetail getNETRBClient];
  if (v3) {
    uint64_t v5 = 1023;
  }
  else {
    uint64_t v5 = 1022;
  }
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  v6 = (void (*)(NETRBClient *, uint64_t))get_NETRBClientSetGlobalServiceStateSymbolLoc_ptr;
  uint64_t v13 = get_NETRBClientSetGlobalServiceStateSymbolLoc_ptr;
  if (!get_NETRBClientSetGlobalServiceStateSymbolLoc_ptr)
  {
    v7 = (void *)NetrbLibrary();
    v11[3] = (uint64_t)dlsym(v7, "_NETRBClientSetGlobalServiceState");
    get_NETRBClientSetGlobalServiceStateSymbolLoc_ptr = (_UNKNOWN *)v11[3];
    v6 = (void (*)(NETRBClient *, uint64_t))v11[3];
  }
  _Block_object_dispose(&v10, 8);
  if (!v6)
  {
    uint64_t v9 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v10, 8);
    _Unwind_Resume(v9);
  }
  v6(v4, v5);
  uint64_t v8 = wifiManager;
  if (!wifiManager) {
    uint64_t v8 = PSWiFiManagerClientCreate(*MEMORY[0x1E4F1CF80]);
  }
  wifiManager = v8;
  PSWiFiManagerClientSetMISDiscoveryState(v8, v3, v3 ^ 1);
}

+ (BOOL)isEnabled
{
  v2 = +[PSHotspotModeSettingsDetail getNETRBClient];
  int v7 = 0;
  int v8 = 1020;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  BOOL v3 = (void (*)(NETRBClient *, int *, int *))get_NETRBClientGetGlobalServiceStateSymbolLoc_ptr;
  v17 = get_NETRBClientGetGlobalServiceStateSymbolLoc_ptr;
  if (!get_NETRBClientGetGlobalServiceStateSymbolLoc_ptr)
  {
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __get_NETRBClientGetGlobalServiceStateSymbolLoc_block_invoke;
    uint64_t v12 = &unk_1E5C5D4D8;
    uint64_t v13 = &v14;
    id v4 = (void *)NetrbLibrary();
    v15[3] = (uint64_t)dlsym(v4, "_NETRBClientGetGlobalServiceState");
    get_NETRBClientGetGlobalServiceStateSymbolLoc_ptr = *(_UNKNOWN **)(v13[1] + 24);
    BOOL v3 = (void (*)(NETRBClient *, int *, int *))v15[3];
  }
  _Block_object_dispose(&v14, 8);
  if (!v3)
  {
    v6 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v14, 8);
    _Unwind_Resume(v6);
  }
  v3(v2, &v8, &v7);
  return v8 == 1023;
}

+ (void)setDiscoverable:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 && !+[PSHotspotModeSettingsDetail isEnabled])
  {
    +[PSHotspotModeSettingsDetail setEnabled:1];
  }
  else
  {
    uint64_t v4 = wifiManager;
    if (!wifiManager) {
      uint64_t v4 = PSWiFiManagerClientCreate(*MEMORY[0x1E4F1CF80]);
    }
    wifiManager = v4;
    PSWiFiManagerClientSetMISDiscoveryState(v4, v3, v3 ^ 1);
  }
}

+ (BOOL)isDiscoverable
{
  uint64_t v2 = wifiManager;
  if (!wifiManager) {
    uint64_t v2 = PSWiFiManagerClientCreate(*MEMORY[0x1E4F1CF80]);
  }
  wifiManager = v2;
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x2020000000;
  BOOL v3 = (uint64_t (*)(uint64_t))getWiFiManagerClientGetMISDiscoveryStateSymbolLoc_ptr;
  uint64_t v10 = getWiFiManagerClientGetMISDiscoveryStateSymbolLoc_ptr;
  if (!getWiFiManagerClientGetMISDiscoveryStateSymbolLoc_ptr)
  {
    uint64_t v4 = (void *)MobileWiFiLibrary();
    v8[3] = (uint64_t)dlsym(v4, "WiFiManagerClientGetMISDiscoveryState");
    getWiFiManagerClientGetMISDiscoveryStateSymbolLoc_ptr = (_UNKNOWN *)v8[3];
    BOOL v3 = (uint64_t (*)(uint64_t))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v3)
  {
    v6 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v6);
  }
  return v3(v2);
}

@end