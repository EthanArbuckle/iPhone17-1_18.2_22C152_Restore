@interface TCSTinCanUserDefaults
+ (NSString)allowListKey;
+ (NSString)storeDemoAllowlistKey;
+ (NSString)suggestionExpiryReasonAllowlistedValue;
+ (id)defaults;
- (void)clearUserData;
@end

@implementation TCSTinCanUserDefaults

+ (NSString)allowListKey
{
  if (allowListKey_onceToken != -1) {
    dispatch_once(&allowListKey_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)allowListKey_TCSDefaultsAllowlistKey;
  return (NSString *)v2;
}

void __37__TCSTinCanUserDefaults_allowListKey__block_invoke()
{
  id v2 = (id)[@"tel" mutableCopy];
  [v2 appendString:@"ist"];
  [v2 insertString:@"Whi" atIndex:0];
  uint64_t v0 = [v2 copy];
  v1 = (void *)allowListKey_TCSDefaultsAllowlistKey;
  allowListKey_TCSDefaultsAllowlistKey = v0;
}

+ (NSString)storeDemoAllowlistKey
{
  id v2 = [a1 allowListKey];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__TCSTinCanUserDefaults_storeDemoAllowlistKey__block_invoke;
  block[3] = &unk_2644C8B50;
  id v8 = v2;
  uint64_t v3 = storeDemoAllowlistKey_onceToken;
  id v4 = v2;
  if (v3 != -1) {
    dispatch_once(&storeDemoAllowlistKey_onceToken, block);
  }
  v5 = (NSString *)(id)storeDemoAllowlistKey_TCSDefaultsStoreDemoAllowlistKey;

  return v5;
}

void __46__TCSTinCanUserDefaults_storeDemoAllowlistKey__block_invoke(uint64_t a1)
{
  id v3 = (id)[*(id *)(a1 + 32) mutableCopy];
  [v3 insertString:@"StoreDemo" atIndex:0];
  uint64_t v1 = [v3 copy];
  id v2 = (void *)storeDemoAllowlistKey_TCSDefaultsStoreDemoAllowlistKey;
  storeDemoAllowlistKey_TCSDefaultsStoreDemoAllowlistKey = v1;
}

+ (NSString)suggestionExpiryReasonAllowlistedValue
{
  id v2 = [a1 allowListKey];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__TCSTinCanUserDefaults_suggestionExpiryReasonAllowlistedValue__block_invoke;
  block[3] = &unk_2644C8B50;
  id v8 = v2;
  uint64_t v3 = suggestionExpiryReasonAllowlistedValue_onceToken;
  id v4 = v2;
  if (v3 != -1) {
    dispatch_once(&suggestionExpiryReasonAllowlistedValue_onceToken, block);
  }
  v5 = (NSString *)(id)suggestionExpiryReasonAllowlistedValue_TCSDefaultsSuggestionExpiryReasonAllowlistedValue;

  return v5;
}

void __63__TCSTinCanUserDefaults_suggestionExpiryReasonAllowlistedValue__block_invoke(uint64_t a1)
{
  id v3 = (id)[*(id *)(a1 + 32) mutableCopy];
  [v3 appendString:@"ed"];
  uint64_t v1 = [v3 copy];
  id v2 = (void *)suggestionExpiryReasonAllowlistedValue_TCSDefaultsSuggestionExpiryReasonAllowlistedValue;
  suggestionExpiryReasonAllowlistedValue_TCSDefaultsSuggestionExpiryReasonAllowlistedValue = v1;
}

+ (id)defaults
{
  id v3 = [MEMORY[0x263F086E0] mainBundle];
  id v4 = [v3 bundleIdentifier];
  char v5 = [@"com.apple.tincan" isEqualToString:v4];

  if (v5)
  {
    uint64_t v6 = [a1 standardUserDefaults];
  }
  else
  {
    uint64_t v6 = [objc_alloc((Class)a1) initWithSuiteName:@"com.apple.tincan"];
  }
  v7 = (void *)v6;
  if (+[TCSBehavior isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot])
  {
    [v7 _tcsEnsureProtectionClass];
  }
  else
  {
    _TCSInitializeLogging();
    id v8 = TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_21E834000, v8, OS_LOG_TYPE_DEFAULT, "TCSTinCanUserDefaults waiting for first-unlock.", v12, 2u);
    }
    v9 = [MEMORY[0x263F08A00] defaultCenter];
    v10 = +[TCSBehavior sharedBehavior];
    [v9 addObserver:v7 selector:sel__tcsHandleDeviceFirstUnlock name:@"TCSFirstUnlockNotification" object:v10];
  }
  return v7;
}

- (void)clearUserData
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  id v2 = "-[TCSTinCanUserDefaults clearUserData]";
  _os_log_error_impl(&dword_21E834000, log, OS_LOG_TYPE_ERROR, "%s: attempt to clear user data before first device unlock.", (uint8_t *)&v1, 0xCu);
}

void __38__TCSTinCanUserDefaults_clearUserData__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263EFF9C0];
  uint64_t v3 = +[TCSTinCanUserDefaults allowListKey];
  id v4 = objc_msgSend(v2, "setWithObjects:", @"Unavailable", v3, @"Suggestions", @"SuggestionsFirstGenerated", @"SuggestionsPreviouslyGenerated", @"ContactPhotoHashes", 0);

  _TCSInitializeLogging();
  char v5 = TCSLogDefault;
  if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21E834000, v5, OS_LOG_TYPE_DEFAULT, "Clearing Walkie-Talkie user data from defaults.", buf, 2u);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (([@"AppIsInstalled" isEqualToString:v11] & 1) == 0) {
          [*(id *)(a1 + 32) removeObjectForKey:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v8);
  }

  if (NPSHasCompletedInitialSync())
  {
    [v6 removeObject:@"ContactPhotoHashes"];
    v12 = objc_opt_new();
    [v12 synchronizeUserDefaultsDomain:@"com.apple.tincan" keys:v6];
  }
}

@end