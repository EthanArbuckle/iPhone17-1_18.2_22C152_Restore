@interface NFMWiFiManager
+ (id)sharedManager;
- (void)setHoldWiFiAssertion:(BOOL)a3;
@end

@implementation NFMWiFiManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedManager___sharedManager;
  return v2;
}

uint64_t __31__NFMWiFiManager_sharedManager__block_invoke()
{
  sharedManager___sharedManager = objc_alloc_init(NFMWiFiManager);
  return MEMORY[0x270F9A758]();
}

- (void)setHoldWiFiAssertion:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    NSLog(&cfstr_TookWifiAssert.isa, a2);
  }
  else {
    NSLog(&cfstr_ReleasedWifiAs.isa, a2);
  }
  uint64_t v4 = __wifiManager;
  if (__wifiManager)
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x2020000000;
    v5 = (unsigned int (*)(uint64_t))getWiFiManagerClientGetTypeSymbolLoc_ptr;
    v15 = getWiFiManagerClientGetTypeSymbolLoc_ptr;
    if (!getWiFiManagerClientGetTypeSymbolLoc_ptr)
    {
      v6 = (void *)MobileWiFiLibrary();
      v13[3] = (uint64_t)dlsym(v6, "WiFiManagerClientGetType");
      getWiFiManagerClientGetTypeSymbolLoc_ptr = (_UNKNOWN *)v13[3];
      v5 = (unsigned int (*)(uint64_t))v13[3];
    }
    _Block_object_dispose(&v12, 8);
    if (!v5) {
      -[NFMWiFiManager setHoldWiFiAssertion:]();
    }
    if (v5(v4) != v3)
    {
      uint64_t v7 = __wifiManager;
      uint64_t v12 = 0;
      v13 = &v12;
      uint64_t v14 = 0x2020000000;
      v8 = (void (*)(uint64_t, BOOL))getWiFiManagerClientSetTypeSymbolLoc_ptr;
      v15 = getWiFiManagerClientSetTypeSymbolLoc_ptr;
      if (!getWiFiManagerClientSetTypeSymbolLoc_ptr)
      {
        v9 = (void *)MobileWiFiLibrary();
        v13[3] = (uint64_t)dlsym(v9, "WiFiManagerClientSetType");
        getWiFiManagerClientSetTypeSymbolLoc_ptr = (_UNKNOWN *)v13[3];
        v8 = (void (*)(uint64_t, BOOL))v13[3];
      }
      _Block_object_dispose(&v12, 8);
      if (!v8) {
        -[NFMWiFiManager setHoldWiFiAssertion:]();
      }
      v8(v7, v3);
    }
  }
  else
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x2020000000;
    v10 = (uint64_t (*)(void, BOOL))getWiFiManagerClientCreateSymbolLoc_ptr;
    v15 = getWiFiManagerClientCreateSymbolLoc_ptr;
    if (!getWiFiManagerClientCreateSymbolLoc_ptr)
    {
      v11 = (void *)MobileWiFiLibrary();
      v13[3] = (uint64_t)dlsym(v11, "WiFiManagerClientCreate");
      getWiFiManagerClientCreateSymbolLoc_ptr = (_UNKNOWN *)v13[3];
      v10 = (uint64_t (*)(void, BOOL))v13[3];
    }
    _Block_object_dispose(&v12, 8);
    if (!v10) {
      -[NFMWiFiManager setHoldWiFiAssertion:]();
    }
    __wifiManager = v10(*MEMORY[0x263EFFB08], v3);
  }
}

- (void)setHoldWiFiAssertion:.cold.1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  __39__NFMLeashManager_beginMonitoringLeash__block_invoke_cold_1(v0);
}

@end