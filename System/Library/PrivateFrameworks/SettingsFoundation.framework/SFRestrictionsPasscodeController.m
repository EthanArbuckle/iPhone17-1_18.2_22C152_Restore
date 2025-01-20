@interface SFRestrictionsPasscodeController
+ (BOOL)hasHashAndSaltLegacyPassword;
+ (BOOL)legacyRestrictionsInEffect;
+ (BOOL)settingEnabled;
+ (BOOL)validatePIN:(id)a3;
+ (id)_generateSalt;
+ (id)_keychainPasswordForRestrictions;
+ (id)hashForHashAndSaltLegacyRestrictions;
+ (id)newHashDataForPassword:(id)a3 andSalt:(id)a4;
+ (id)pinFromHashAndSaltLegacyPassword;
+ (id)saltForHashAndSaltLegacyRestrictions;
+ (void)_migrateRestrictionsPasscodeIfNeeded;
+ (void)_removeKeychainPasswordForRestrictions;
+ (void)_setKeychainPasswordForRestrictions:(id)a3;
+ (void)migrateRestrictionsPasscode;
+ (void)pinFromHashAndSaltLegacyPassword;
+ (void)removePasswordForHashAndSaltLegacyRestrictions;
+ (void)setPIN:(id)a3;
+ (void)validateKeychainWithScreenTime;
@end

@implementation SFRestrictionsPasscodeController

uint64_t __72__SFRestrictionsPasscodeController__migrateRestrictionsPasscodeIfNeeded__block_invoke()
{
  +[SFRestrictionsPasscodeController migrateRestrictionsPasscode];
  return +[SFRestrictionsPasscodeController validateKeychainWithScreenTime];
}

+ (BOOL)legacyRestrictionsInEffect
{
  if (SpringBoardPreferenceDomain_once != -1) {
    dispatch_once(&SpringBoardPreferenceDomain_once, &__block_literal_global_79);
  }
  v2 = (void *)CFPreferencesCopyAppValue(@"SBParentalControlsPIN", (CFStringRef)SpringBoardPreferenceDomain_springBoardDomain);
  if (v2) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = +[SFRestrictionsPasscodeController hasHashAndSaltLegacyPassword];
  }

  return v3;
}

+ (void)migrateRestrictionsPasscode
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_2154D9000, v0, v1, "Migrating Restrictions passcode from springboard file.", v2, v3, v4, v5, v6);
}

+ (BOOL)hasHashAndSaltLegacyPassword
{
  uint64_t v2 = +[SFRestrictionsPasscodeController hashForHashAndSaltLegacyRestrictions];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (id)hashForHashAndSaltLegacyRestrictions
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.restrictionspassword"];
  BOOL v3 = [v2 dataForKey:@"RestrictionsPasswordKey"];

  return v3;
}

+ (void)validateKeychainWithScreenTime
{
  uint64_t v2 = [a1 _keychainPasswordForRestrictions];
  if (v2)
  {
    BOOL v3 = getSTManagementState();
    if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __66__SFRestrictionsPasscodeController_validateKeychainWithScreenTime__block_invoke;
      v6[3] = &unk_2642477F8;
      dispatch_semaphore_t v7 = v4;
      uint64_t v5 = v4;
      [v3 authenticateRestrictionsPasscode:v2 completionHandler:v6];
      dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
    }
  }
}

+ (BOOL)settingEnabled
{
  +[SFRestrictionsPasscodeController _migrateRestrictionsPasscodeIfNeeded];
  uint64_t v2 = getSTManagementState();
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0 && ([v2 isRestrictionsPasscodeSet] & 1) != 0)
  {
    BOOL v3 = 1;
  }
  else
  {
    dispatch_semaphore_t v4 = +[SFRestrictionsPasscodeController _keychainPasswordForRestrictions];
    if (v4) {
      BOOL v3 = 1;
    }
    else {
      BOOL v3 = +[SFRestrictionsPasscodeController legacyRestrictionsInEffect];
    }
  }
  return v3;
}

+ (id)_keychainPasswordForRestrictions
{
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 0, 0);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F171B8], (const void *)*MEMORY[0x263F171C8]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F16ED8], @"user");
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F17090], @"ParentalControls");
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F17520], (const void *)*MEMORY[0x263EFFB40]);
  CFTypeRef result = 0;
  OSStatus v3 = SecItemCopyMatching(Mutable, &result);
  dispatch_semaphore_t v4 = 0;
  uint64_t v5 = (void *)result;
  if (v3) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = result == 0;
  }
  if (!v6) {
    dispatch_semaphore_t v4 = (void *)[[NSString alloc] initWithData:result encoding:4];
  }
  CFRelease(Mutable);

  return v4;
}

+ (void)_migrateRestrictionsPasscodeIfNeeded
{
  if (_migrateRestrictionsPasscodeIfNeeded_onceToken != -1) {
    dispatch_once(&_migrateRestrictionsPasscodeIfNeeded_onceToken, &__block_literal_global_1);
  }
}

intptr_t __66__SFRestrictionsPasscodeController_validateKeychainWithScreenTime__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    OSStatus v3 = SFLogForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __66__SFRestrictionsPasscodeController_validateKeychainWithScreenTime__block_invoke_cold_2();
    }
  }
  else
  {
    +[SFRestrictionsPasscodeController _removeKeychainPasswordForRestrictions];
    OSStatus v3 = SFLogForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __66__SFRestrictionsPasscodeController_validateKeychainWithScreenTime__block_invoke_cold_1();
    }
  }

  AnalyticsSendEventLazy();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id __66__SFRestrictionsPasscodeController_validateKeychainWithScreenTime__block_invoke_23()
{
  v3[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = @"KeychainMigration";
  v3[0] = &unk_26C610668;
  v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:&v2 count:1];
  return v0;
}

id __66__SFRestrictionsPasscodeController_validateKeychainWithScreenTime__block_invoke_29()
{
  v3[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = @"KeychainMigration";
  v3[0] = &unk_26C610680;
  v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:&v2 count:1];
  return v0;
}

+ (void)setPIN:(id)a3
{
  id v3 = a3;
  if (SpringBoardPreferenceDomain_once != -1) {
    dispatch_once(&SpringBoardPreferenceDomain_once, &__block_literal_global_79);
  }
  CFStringRef v4 = (const __CFString *)SpringBoardPreferenceDomain_springBoardDomain;
  Boolean keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(@"SBParentalControlsEnabled", (CFStringRef)SpringBoardPreferenceDomain_springBoardDomain, &keyExistsAndHasValidFormat))
  {
    BOOL v5 = keyExistsAndHasValidFormat == 0;
  }
  else
  {
    BOOL v5 = 1;
  }
  int v6 = !v5;
  dispatch_semaphore_t v7 = getSTManagementState();
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v7 setRestrictionsPasscode:v3 completionHandler:&__block_literal_global_41];
    if (v3) {
      goto LABEL_16;
    }
  }
  else if (v3)
  {
    +[SFRestrictionsPasscodeController _setKeychainPasswordForRestrictions:v3];
    goto LABEL_16;
  }
  +[SFRestrictionsPasscodeController _removeKeychainPasswordForRestrictions];
LABEL_16:
  if ((v3 != 0) != v6)
  {
    if (v3) {
      v8 = (CFPropertyListRef *)MEMORY[0x263EFFB40];
    }
    else {
      v8 = (CFPropertyListRef *)MEMORY[0x263EFFB38];
    }
    ADClientAddValueForScalarKey();
    CFPreferencesSetAppValue(@"SBParentalControlsEnabled", *v8, v4);
    CFPreferencesAppSynchronize(v4);
    GSSendAppPreferencesChanged();
  }
}

void __43__SFRestrictionsPasscodeController_setPIN___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = SFLogForCategory(0);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __43__SFRestrictionsPasscodeController_setPIN___block_invoke_cold_1();
    }
  }
}

+ (BOOL)validatePIN:(id)a3
{
  id v3 = a3;
  +[SFRestrictionsPasscodeController _migrateRestrictionsPasscodeIfNeeded];
  CFStringRef v4 = getSTManagementState();
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __48__SFRestrictionsPasscodeController_validatePIN___block_invoke;
    v10[3] = &unk_264247840;
    v13 = &v14;
    id v11 = v3;
    int v6 = v5;
    v12 = v6;
    [v4 authenticateRestrictionsPasscode:v11 completionHandler:v10];
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    char v7 = *((unsigned char *)v15 + 24) != 0;

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    v8 = +[SFRestrictionsPasscodeController _keychainPasswordForRestrictions];
    char v7 = [v3 isEqualToString:v8];
  }
  return v7;
}

intptr_t __48__SFRestrictionsPasscodeController_validatePIN___block_invoke(void *a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = +[SFRestrictionsPasscodeController _keychainPasswordForRestrictions];
    if (v3)
    {
      CFStringRef v4 = (void *)a1[4];
      dispatch_semaphore_t v5 = +[SFRestrictionsPasscodeController _keychainPasswordForRestrictions];
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v4 isEqualToString:v5];
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  int v6 = a1[5];
  return dispatch_semaphore_signal(v6);
}

+ (void)_removeKeychainPasswordForRestrictions
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_2154D9000, v0, v1, "%{Public}s: Could not remove password for Restrictions: error %ld", v2, v3, v4, v5, 2u);
}

+ (void)_setKeychainPasswordForRestrictions:(id)a3
{
  uint64_t v3 = [a3 dataUsingEncoding:4];
  CFTypeRef result = 0;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 0, 0);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F171B8], (const void *)*MEMORY[0x263F171C8]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F16ED8], @"user");
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F17090], @"ParentalControls");
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F16E90], (const void *)*MEMORY[0x263F16ED0]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F170C0], MEMORY[0x263EFFA88]);
  int v6 = +[SFRestrictionsPasscodeController _keychainPasswordForRestrictions];

  if (v6)
  {
    char v7 = CFDictionaryCreateMutable(v4, 0, 0, 0);
    CFDictionaryAddValue(v7, (const void *)*MEMORY[0x263F175A8], v3);
    if (SecItemUpdate(Mutable, v7))
    {
      v8 = SFLogForCategory(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        +[SFRestrictionsPasscodeController _setKeychainPasswordForRestrictions:]();
      }
    }
    CFRelease(v7);
  }
  else
  {
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F175A8], v3);
    if (SecItemAdd(Mutable, &result))
    {
      v9 = SFLogForCategory(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[SFRestrictionsPasscodeController _setKeychainPasswordForRestrictions:]();
      }
    }
  }
  CFRelease(Mutable);
}

+ (id)pinFromHashAndSaltLegacyPassword
{
  uint64_t v2 = +[SFRestrictionsPasscodeController hashForHashAndSaltLegacyRestrictions];
  uint64_t v3 = +[SFRestrictionsPasscodeController saltForHashAndSaltLegacyRestrictions];
  uint64_t v4 = 0;
  while (1)
  {
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%04d", v4);
    id v6 = +[SFRestrictionsPasscodeController newHashDataForPassword:v5 andSalt:v3];
    char v7 = [v6 isEqualToData:v2];

    if (v7) {
      break;
    }

    uint64_t v4 = (v4 + 1);
    if (v4 == 10000)
    {
      v8 = SFLogForCategory(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        +[SFRestrictionsPasscodeController pinFromHashAndSaltLegacyPassword](v8);
      }

      uint64_t v5 = 0;
      break;
    }
  }

  return v5;
}

+ (id)_generateSalt
{
  uint32_t v4 = arc4random();
  uint64_t v2 = [MEMORY[0x263EFF8F8] dataWithBytes:&v4 length:4];
  return v2;
}

+ (id)newHashDataForPassword:(id)a3 andSalt:(id)a4
{
  id v5 = a4;
  id v6 = [a3 dataUsingEncoding:4];
  char v7 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:20];
  if (v5 && v6) {
    SecKeyFromPassphraseDataHMACSHA1();
  }

  return v7;
}

+ (id)saltForHashAndSaltLegacyRestrictions
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.restrictionspassword"];
  uint64_t v3 = [v2 dataForKey:@"RestrictionsPasswordSalt"];

  return v3;
}

+ (void)removePasswordForHashAndSaltLegacyRestrictions
{
  id v2 = (id)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.restrictionspassword"];
  [v2 removeObjectForKey:@"RestrictionsPasswordKey"];
  [v2 removeObjectForKey:@"RestrictionsPasswordSalt"];
}

void __66__SFRestrictionsPasscodeController_validateKeychainWithScreenTime__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_2154D9000, v0, v1, "Keychain passcode matches Screen Time Passcode.", v2, v3, v4, v5, v6);
}

void __66__SFRestrictionsPasscodeController_validateKeychainWithScreenTime__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_2154D9000, v0, OS_LOG_TYPE_ERROR, "Keychain passcode does not match Screen Time Passcode. User should reset restriction passcode.", v1, 2u);
}

void __43__SFRestrictionsPasscodeController_setPIN___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_2154D9000, v0, OS_LOG_TYPE_ERROR, "Passcode failed to save in Screen Time.", v1, 2u);
}

+ (void)_setKeychainPasswordForRestrictions:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_2154D9000, v0, v1, "%{Public}s: Could not add password for Restrictions: error %ld", v2, v3, v4, v5, 2u);
}

+ (void)_setKeychainPasswordForRestrictions:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_2154D9000, v0, v1, "%{Public}s: Could not change password for Restrictions: error %ld", v2, v3, v4, v5, 2u);
}

+ (void)pinFromHashAndSaltLegacyPassword
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "+[SFRestrictionsPasscodeController pinFromHashAndSaltLegacyPassword]";
  _os_log_error_impl(&dword_2154D9000, log, OS_LOG_TYPE_ERROR, "%{Public}s: Couldn't find legacy hash and salt restrictions pin.", (uint8_t *)&v1, 0xCu);
}

@end