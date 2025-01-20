@interface POPreferences
+ (BOOL)BOOLValueForKey:(__CFString *)a3 defaultValue:(BOOL)a4;
+ (BOOL)forceKerberosTGTExchange;
+ (BOOL)requireRootCAInSystemTrustStore;
+ (NSNumber)forceExtensionSDKVersion;
+ (id)numberValueForKey:(__CFString *)a3 defaultValue:(id)a4;
@end

@implementation POPreferences

+ (BOOL)BOOLValueForKey:(__CFString *)a3 defaultValue:(BOOL)a4
{
  CFStringRef v6 = (const __CFString *)*MEMORY[0x263EFFE50];
  v7 = (void *)CFPreferencesCopyValue(a3, @"com.apple.PlatformSSO", (CFStringRef)*MEMORY[0x263EFFE58], (CFStringRef)*MEMORY[0x263EFFE50]);
  if (v7
    || (v7 = (void *)CFPreferencesCopyValue(a3, @"com.apple.PlatformSSO", (CFStringRef)*MEMORY[0x263EFFE70], v6)) != 0)
  {
    a4 = [v7 BOOLValue];
  }
  return a4;
}

+ (id)numberValueForKey:(__CFString *)a3 defaultValue:(id)a4
{
  CFStringRef v5 = (const __CFString *)*MEMORY[0x263EFFE58];
  CFStringRef v6 = (const __CFString *)*MEMORY[0x263EFFE50];
  id v7 = a4;
  v8 = (void *)CFPreferencesCopyValue(a3, @"com.apple.PlatformSSO", v5, v6);
  v9 = v8;
  if (v8) {
    CFPropertyListRef v10 = v8;
  }
  else {
    CFPropertyListRef v10 = CFPreferencesCopyValue(a3, @"com.apple.PlatformSSO", (CFStringRef)*MEMORY[0x263EFFE70], v6);
  }
  v11 = (void *)v10;

  if (v11) {
    v12 = v11;
  }
  else {
    v12 = v7;
  }
  id v13 = v12;

  return v13;
}

+ (BOOL)requireRootCAInSystemTrustStore
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__POPreferences_requireRootCAInSystemTrustStore__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (requireRootCAInSystemTrustStore_onceToken != -1) {
    dispatch_once(&requireRootCAInSystemTrustStore_onceToken, block);
  }
  return requireRootCAInSystemTrustStore_requireRootCAInSystemTrustStore;
}

void __48__POPreferences_requireRootCAInSystemTrustStore__block_invoke(uint64_t a1)
{
  if (AppSSOCoreLibraryCore() && ![getSOUtilsClass() isInternalBuild])
  {
    char v3 = 1;
  }
  else
  {
    CFStringRef v2 = (const __CFString *)*MEMORY[0x263EFFE68];
    CFPreferencesSynchronize(@"com.apple.PlatformSSO", (CFStringRef)*MEMORY[0x263EFFE58], (CFStringRef)*MEMORY[0x263EFFE68]);
    CFPreferencesSynchronize(@"com.apple.PlatformSSO", (CFStringRef)*MEMORY[0x263EFFE70], v2);
    char v3 = [*(id *)(a1 + 32) BOOLValueForKey:@"RequireRootCAInSystemTrustStore" defaultValue:1];
  }
  requireRootCAInSystemTrustStore_requireRootCAInSystemTrustStore = v3;
  v4 = PO_LOG_POPreferences();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __48__POPreferences_requireRootCAInSystemTrustStore__block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  }
}

+ (BOOL)forceKerberosTGTExchange
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__POPreferences_forceKerberosTGTExchange__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (forceKerberosTGTExchange_onceToken != -1) {
    dispatch_once(&forceKerberosTGTExchange_onceToken, block);
  }
  return forceKerberosTGTExchange_forceKerberosTGTExchange;
}

void __41__POPreferences_forceKerberosTGTExchange__block_invoke(uint64_t a1)
{
  int v2 = [getSOUtilsClass() isInternalBuild];
  if (v2)
  {
    CFPreferencesSynchronize(@"com.apple.PlatformSSO", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE68]);
    LOBYTE(v2) = [*(id *)(a1 + 32) BOOLValueForKey:@"ForceKerberosTGTExchange" defaultValue:0];
  }
  forceKerberosTGTExchange_forceKerberosTGTExchange = v2;
  char v3 = PO_LOG_POPreferences();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __41__POPreferences_forceKerberosTGTExchange__block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

+ (NSNumber)forceExtensionSDKVersion
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__POPreferences_forceExtensionSDKVersion__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (forceExtensionSDKVersion_onceToken != -1) {
    dispatch_once(&forceExtensionSDKVersion_onceToken, block);
  }
  int v2 = (void *)forceExtensionSDKVersion_forceExtensionSDKVersion;
  return (NSNumber *)v2;
}

void __41__POPreferences_forceExtensionSDKVersion__block_invoke(uint64_t a1)
{
  if ([getSOUtilsClass() isInternalBuild])
  {
    CFPreferencesSynchronize(@"com.apple.PlatformSSO", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE68]);
    uint64_t v2 = [*(id *)(a1 + 32) numberValueForKey:@"ForceExtensionSDKVersion" defaultValue:0];
  }
  else
  {
    uint64_t v2 = 0;
  }
  char v3 = (void *)forceExtensionSDKVersion_forceExtensionSDKVersion;
  forceExtensionSDKVersion_forceExtensionSDKVersion = v2;

  uint64_t v4 = PO_LOG_POPreferences();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __41__POPreferences_forceExtensionSDKVersion__block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  }
}

void __48__POPreferences_requireRootCAInSystemTrustStore__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_259DFE000, a1, a3, "requireRootCAInSystemTrustStore=%{public}s", a5, a6, a7, a8, 2u);
}

void __41__POPreferences_forceKerberosTGTExchange__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_259DFE000, a1, a3, "forceKerberosTGTExchange=%{public}s", a5, a6, a7, a8, 2u);
}

void __41__POPreferences_forceExtensionSDKVersion__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_259DFE000, a1, a3, "forceExtensionSDKVersion=%{public}@", a5, a6, a7, a8, 2u);
}

@end