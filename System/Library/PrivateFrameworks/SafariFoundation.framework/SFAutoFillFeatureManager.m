@interface SFAutoFillFeatureManager
+ (BOOL)defaultValueForPasswordAndCreditCardAutoFill;
+ (SFAutoFillFeatureManager)sharedFeatureManager;
+ (__CFString)autoFillPreferencesDomain;
+ (id)_syncManager;
+ (void)autoFillPreferencesDidChange;
- (BOOL)isAutoFillFromKeychainRestricted;
- (BOOL)shouldAutoFillPasswords;
- (BOOL)shouldAutoFillPasswordsFromKeychain;
- (SFAutoFillFeatureManager)init;
- (id)_getBundleRecordIdentifierWithString:(id)a3;
- (id)_getVerificationCodeProviderBundleIdentifier;
- (void)_refreshCachedAutoFillRestrictionValues;
- (void)_refreshCachedisPasswordsAppInstalled;
- (void)dealloc;
- (void)reportPasswordAutoFillProviderTelemetry;
- (void)setShouldAutoFillPasswords:(BOOL)a3;
- (void)setShouldAutoFillPasswordsFromKeychain:(BOOL)a3;
- (void)test_overrideShouldAutoFillFromKeychain:(BOOL)a3;
@end

@implementation SFAutoFillFeatureManager

+ (SFAutoFillFeatureManager)sharedFeatureManager
{
  if (sharedFeatureManager_onceToken != -1) {
    dispatch_once(&sharedFeatureManager_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedFeatureManager_sharedObserver;
  return (SFAutoFillFeatureManager *)v2;
}

uint64_t __48__SFAutoFillFeatureManager_sharedFeatureManager__block_invoke()
{
  sharedFeatureManager_sharedObserver = objc_alloc_init(SFAutoFillFeatureManager);
  return MEMORY[0x270F9A758]();
}

- (SFAutoFillFeatureManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFAutoFillFeatureManager;
  v2 = [(SFAutoFillFeatureManager *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F53C50] sharedConnection];
    if (objc_opt_respondsToSelector()) {
      [v3 registerObserver:v2];
    }
    else {
      [v3 addObserver:v2];
    }
    [(SFAutoFillFeatureManager *)v2 _refreshCachedAutoFillRestrictionValues];
    [(SFAutoFillFeatureManager *)v2 _refreshCachedisPasswordsAppInstalled];
    v4 = [MEMORY[0x263F087C8] defaultCenter];
    [v4 addObserver:v2 selector:sel__refreshCachedisPasswordsAppInstalled name:@"com.apple.LaunchServices.applicationRegistered" object:0];
    [v4 addObserver:v2 selector:sel__refreshCachedisPasswordsAppInstalled name:@"com.apple.LaunchServices.applicationUnregistered" object:0];
    v5 = v2;
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F53C50] sharedConnection];
  if (objc_opt_respondsToSelector()) {
    [v3 unregisterObserver:self];
  }
  else {
    [v3 removeObserver:self];
  }
  v4 = [MEMORY[0x263F087C8] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)SFAutoFillFeatureManager;
  [(SFAutoFillFeatureManager *)&v5 dealloc];
}

+ (id)_syncManager
{
  v2 = (void *)_syncManager_syncManager;
  if (!_syncManager_syncManager)
  {
    uint64_t v9 = 0;
    v10 = &v9;
    uint64_t v11 = 0x2050000000;
    v3 = (void *)getNPSManagerClass_softClass;
    uint64_t v12 = getNPSManagerClass_softClass;
    if (!getNPSManagerClass_softClass)
    {
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __getNPSManagerClass_block_invoke;
      v8[3] = &unk_264390A98;
      v8[4] = &v9;
      __getNPSManagerClass_block_invoke((uint64_t)v8);
      v3 = (void *)v10[3];
    }
    v4 = v3;
    _Block_object_dispose(&v9, 8);
    id v5 = objc_alloc_init(v4);
    v6 = (void *)_syncManager_syncManager;
    _syncManager_syncManager = (uint64_t)v5;

    v2 = (void *)_syncManager_syncManager;
  }
  return v2;
}

+ (void)autoFillPreferencesDidChange
{
  CFPreferencesAppSynchronize((CFStringRef)[a1 autoFillPreferencesDomain]);
  id v4 = [a1 _syncManager];
  v3 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"AutoFillPasswords", @"AutoFillFromAddressBook", 0);
  [v4 synchronizeUserDefaultsDomain:@"com.apple.WebUI" keys:v3];
}

- (BOOL)shouldAutoFillPasswordsFromKeychain
{
  if (self->_shouldOverrideShouldAutoFillFromKeychain)
  {
    BOOL v2 = !self->_overrideShouldAutoFillFromKeychainValue;
  }
  else
  {
    if (!self->_cachedisPasswordsAppInstalled || self->_cachedAutoFillRestrictionValue == 2)
    {
      LOBYTE(v3) = 0;
      return v3;
    }
    int v3 = [(SFAutoFillFeatureManager *)self shouldAutoFillPasswords];
    if (!v3) {
      return v3;
    }
    Boolean keyExistsAndHasValidFormat = 0;
    CFStringRef v4 = (const __CFString *)[(id)objc_opt_class() autoFillPreferencesDomain];
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"AutoFillPasswords", v4, &keyExistsAndHasValidFormat);
    if (!keyExistsAndHasValidFormat)
    {
      LOBYTE(v3) = [(id)objc_opt_class() defaultValueForPasswordAndCreditCardAutoFill];
      return v3;
    }
    BOOL v2 = AppBooleanValue == 0;
  }
  LOBYTE(v3) = !v2;
  return v3;
}

- (void)setShouldAutoFillPasswordsFromKeychain:(BOOL)a3
{
  int v3 = (CFPropertyListRef *)MEMORY[0x263EFFB40];
  if (!a3) {
    int v3 = (CFPropertyListRef *)MEMORY[0x263EFFB38];
  }
  CFPreferencesSetAppValue(@"AutoFillPasswords", *v3, +[SFAutoFillFeatureManager autoFillPreferencesDomain]);
  +[SFAutoFillFeatureManager autoFillPreferencesDidChange];
}

- (BOOL)shouldAutoFillPasswords
{
  return self->_cachedPasswordAutoFillEffectiveValue != 2;
}

- (void)setShouldAutoFillPasswords:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  CFStringRef v4 = [MEMORY[0x263F53C50] sharedConnection];
  [v4 setBoolValue:v3 forSetting:*MEMORY[0x263F53A00]];

  if (!v3)
  {
    id v5 = +[SFCredentialProviderExtensionManager sharedManager];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v6 = objc_msgSend(v5, "extensionsSync", 0);
    objc_super v7 = (void *)[v6 copy];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          [v5 setExtension:*(void *)(*((void *)&v12 + 1) + 8 * v11++) isEnabled:0];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

+ (BOOL)defaultValueForPasswordAndCreditCardAutoFill
{
  if (isUsingEducationMode_onceToken != -1) {
    dispatch_once(&isUsingEducationMode_onceToken, &__block_literal_global_144);
  }
  return isUsingEducationMode_usingEducationMode
      || CFPreferencesGetAppBooleanValue(@"DefaultValueForPasswordAndCreditCardAutoFill", +[SFAutoFillFeatureManager autoFillPreferencesDomain], 0) != 0;
}

+ (__CFString)autoFillPreferencesDomain
{
  if (autoFillPreferencesDomain_onceToken != -1) {
    dispatch_once(&autoFillPreferencesDomain_onceToken, &__block_literal_global_30);
  }
  return (__CFString *)autoFillPreferencesDomain_sAutoFillPreferenceDomain;
}

uint64_t __53__SFAutoFillFeatureManager_autoFillPreferencesDomain__block_invoke()
{
  uint64_t result = CPCopySharedResourcesPreferencesDomainForDomain();
  autoFillPreferencesDomain_sAutoFillPreferenceDomain = result;
  return result;
}

- (void)_refreshCachedAutoFillRestrictionValues
{
  id v3 = [MEMORY[0x263F53C50] sharedConnection];
  self->_cachedAutoFillRestrictionValue = [v3 BOOLRestrictionForFeature:*MEMORY[0x263F53A30]];
  self->_cachedPasswordAutoFillEffectiveValue = [v3 effectiveBoolValueForSetting:*MEMORY[0x263F53A00]];
}

- (void)_refreshCachedisPasswordsAppInstalled
{
  self->_cachedisPasswordsAppInstalled = [MEMORY[0x263F662A0] isPasswordsAppInstalled];
}

- (BOOL)isAutoFillFromKeychainRestricted
{
  return self->_cachedAutoFillRestrictionValue == 2;
}

- (id)_getBundleRecordIdentifierWithString:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F01898];
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = (void *)[objc_alloc(NSURL) initWithString:v4];

  id v15 = 0;
  objc_super v7 = (void *)[v5 initWithURL:v6 error:&v15];
  id v8 = v15;

  uint64_t v9 = [v7 bundleRecord];
  uint64_t v10 = [v9 bundleIdentifier];
  uint64_t v11 = [v10 length];

  if (v11)
  {
    id v12 = v9;
  }
  else
  {
    if (v8)
    {
      long long v13 = WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[SFAutoFillFeatureManager _getBundleRecordIdentifierWithString:](v13, v8);
      }
    }
    id v12 = 0;
  }

  return v12;
}

- (id)_getVerificationCodeProviderBundleIdentifier
{
  id v3 = [(SFAutoFillFeatureManager *)self _getBundleRecordIdentifierWithString:@"otpauth://abc"];
  id v4 = [(SFAutoFillFeatureManager *)self _getBundleRecordIdentifierWithString:@"otpauth-migration://abc"];
  id v5 = [v3 bundleIdentifier];
  uint64_t v6 = *MEMORY[0x263F664C8];
  if ([v5 isEqualToString:*MEMORY[0x263F664C8]]) {
    BOOL v7 = v4 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {

LABEL_8:
    uint64_t v10 = v3;
    goto LABEL_10;
  }
  id v8 = [v4 bundleIdentifier];
  char v9 = [v8 isEqualToString:v6];

  if (v9) {
    goto LABEL_8;
  }
  uint64_t v10 = v4;
LABEL_10:
  uint64_t v11 = [v10 bundleIdentifier];

  return v11;
}

- (void)reportPasswordAutoFillProviderTelemetry
{
  id v3 = +[SFCredentialProviderExtensionManager sharedManager];
  id v4 = [v3 getEnabledExtensionsSynchronously];
  BOOL v5 = [v4 count] != 0;

  uint64_t v6 = [MEMORY[0x263F66258] sharedLogger];
  objc_msgSend(v6, "reportIsUsingPasswordsApp:isUsingCredentialProviderExtension:", -[SFAutoFillFeatureManager shouldAutoFillPasswordsFromKeychain](self, "shouldAutoFillPasswordsFromKeychain"), v5);

  id v8 = [MEMORY[0x263F66258] sharedLogger];
  BOOL v7 = [(SFAutoFillFeatureManager *)self _getVerificationCodeProviderBundleIdentifier];
  [v8 reportVerificationCodeProvider:v7];
}

- (void)test_overrideShouldAutoFillFromKeychain:(BOOL)a3
{
  self->_shouldOverrideShouldAutoFillFromKeychain = 1;
  self->_overrideShouldAutoFillFromKeychainValue = a3;
}

- (void)_getBundleRecordIdentifierWithString:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_218FBF000, v3, OS_LOG_TYPE_ERROR, "Verification Code bundle identifier does not exist, error: %@", (uint8_t *)&v5, 0xCu);
}

@end