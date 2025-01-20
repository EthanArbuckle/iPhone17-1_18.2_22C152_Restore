@interface SSAccount
+ (BOOL)backingAccountIsDemoAccount:(id)a3;
+ (BOOL)backingAccountIsLocalAccount:(id)a3;
+ (BOOL)isManagedAppleIDFromAuthenticationResponseDictionary:(id)a3;
+ (BOOL)isNewCustomerFromAuthenticationResponseDictionary:(id)a3;
+ (id)DSIDFromAuthenticationResponseDictionary:(id)a3;
+ (id)_countryCodeFromStorefrontIdentifier:(id)a3;
+ (id)_displayedServerPromptKeyWithIdentifier:(id)a3;
+ (id)_lastAttemptForServerPromptKeyWithIdentifier:(id)a3;
+ (id)_valueForFirstAvailableKeyPath:(id)a3 inDictionary:(id)a4;
+ (id)accountNameFromAuthenticationResponseDictionary:(id)a3;
+ (id)altDSIDFromAuthenticationResponseDictionary:(id)a3;
+ (id)creditsStringFromAuthenticationResponseDictionary:(id)a3;
+ (id)firstNameFromAuthenticationResponseDictionary:(id)a3;
+ (id)lastNameFromAuthenticationResponseDictionary:(id)a3;
+ (id)secureTokenForIdentifier:(id)a3;
+ (id)serverValueForAccountPasswordSettingValue:(int64_t)a3;
+ (id)storeFrontIdentifierFromURLResponse:(id)a3;
+ (int64_t)accountKindFromAuthenticationResponseDictionary:(id)a3;
- (ACAccount)backingAccount;
- (BOOL)didFallbackToPassword;
- (BOOL)displayedServerPromptWithIdentifier:(id)a3;
- (BOOL)hasBrokenDSID;
- (BOOL)isActive;
- (BOOL)isActiveLockerAccount;
- (BOOL)isAuthenticated;
- (BOOL)isDemoAccount;
- (BOOL)isDirty;
- (BOOL)isDuplicate:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocalAccount;
- (BOOL)isManagedAppleID;
- (BOOL)isNewCustomer;
- (BOOL)isSocialEnabled;
- (BOOL)mergeValuesFromAccount:(id)a3;
- (NSArray)automaticDownloadKinds;
- (NSDictionary)privacyAcknowledgement;
- (NSNumber)uniqueIdentifier;
- (NSString)ITunesPassSerialNumber;
- (NSString)accountName;
- (NSString)altDSID;
- (NSString)creditsString;
- (NSString)demoAccountRawPassword;
- (NSString)description;
- (NSString)firstName;
- (NSString)lastName;
- (NSString)localizedName;
- (NSString)passwordEquivalentToken;
- (NSString)rawPassword;
- (NSString)secureToken;
- (NSString)storeFrontIdentifier;
- (OS_dispatch_queue)backingAccountAccessQueue;
- (SSAccount)init;
- (SSAccount)initWithBackingAccount:(id)a3;
- (SSAccount)initWithXPCEncoding:(id)a3;
- (id)_backingAccount;
- (id)accountPropertyForKey:(id)a3;
- (id)copyLockdownRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (id)eligibilityForService:(int64_t)a3;
- (id)hashedDescription;
- (id)lastAttemptDateForServerPromptWithIdentifier:(id)a3;
- (id)popBiometricToken;
- (int64_t)accountKind;
- (int64_t)accountScope;
- (int64_t)accountSource;
- (int64_t)availableServiceTypes;
- (int64_t)enabledServiceTypes;
- (int64_t)freeDownloadsPasswordSetting;
- (int64_t)paidPurchasesPasswordSetting;
- (unint64_t)hash;
- (void)_addAccountPropertyBitmask:(int64_t)a3 forKey:(id)a4;
- (void)_removeAccountPropertyBitmask:(int64_t)a3 forKey:(id)a4;
- (void)_sendMessage:(id)a3 withReply:(id)a4;
- (void)_setAccountProperty:(id)a3 forKey:(id)a4;
- (void)_setBackingAccount:(id)a3;
- (void)acceptTermsAndConditions:(id)a3 withCompletionBlock:(id)a4;
- (void)addAvailableServiceTypes:(int64_t)a3;
- (void)addEnabledServiceTypes:(int64_t)a3;
- (void)getDownloadKindsEligibleForContentRestoreWithBlock:(id)a3;
- (void)getEligibilityForService:(int64_t)a3 completionBlock:(id)a4;
- (void)getITunesMatchStatusWithCompletionBlock:(id)a3;
- (void)getKeybagSyncDataWithType:(int64_t)a3 completionHandler:(id)a4;
- (void)getPurchasedItemsForItems:(id)a3 completionBlock:(id)a4;
- (void)getTermsAndConditionsWithBlock:(id)a3;
- (void)removeAvailableServiceTypes:(int64_t)a3;
- (void)removeEnabledServiceTypes:(int64_t)a3;
- (void)resetTransientData;
- (void)setAccountKind:(int64_t)a3;
- (void)setAccountName:(id)a3;
- (void)setAccountScope:(int64_t)a3;
- (void)setAccountSource:(int64_t)a3;
- (void)setActive:(BOOL)a3;
- (void)setActiveLockerAccount:(BOOL)a3;
- (void)setAltDSID:(id)a3;
- (void)setAuthenticated:(BOOL)a3;
- (void)setAutomaticDownloadKinds:(id)a3;
- (void)setAvailableServiceTypes:(int64_t)a3;
- (void)setBackingAccountAccessQueue:(id)a3;
- (void)setBiometricToken:(id)a3;
- (void)setCreditsString:(id)a3;
- (void)setDidFallbackToPassword:(BOOL)a3;
- (void)setDisplayedServerPrompt:(BOOL)a3 withIdentifier:(id)a4;
- (void)setEligibility:(id)a3 forServiceType:(int64_t)a4;
- (void)setEnabledServiceTypes:(int64_t)a3;
- (void)setFirstName:(id)a3;
- (void)setFreeDownloadsPasswordSetting:(int64_t)a3;
- (void)setITunesPassSerialNumber:(id)a3;
- (void)setLastAttemptDate:(id)a3 forServerPromptWithIdentifier:(id)a4;
- (void)setLastName:(id)a3;
- (void)setLockdownDictionary:(id)a3;
- (void)setManagedAppleID:(BOOL)a3;
- (void)setNewCustomer:(BOOL)a3;
- (void)setPaidPurchasesPasswordSetting:(int64_t)a3;
- (void)setPasswordEquivalentToken:(id)a3;
- (void)setPrivacyAcknowledgement:(id)a3;
- (void)setRawPassword:(id)a3;
- (void)setSecureToken:(id)a3;
- (void)setSocialEnabled:(BOOL)a3;
- (void)setStoreFrontIdentifier:(id)a3;
- (void)setStoreFrontIdentifier:(id)a3 forRequest:(id)a4 response:(id)a5;
- (void)setUniqueIdentifier:(id)a3;
- (void)updateAccountPasswordSettings:(id)a3;
- (void)updateAccountPasswordSettingsWithRequestProperties:(id)a3 completionBlock:(id)a4;
@end

@implementation SSAccount

- (NSString)storeFrontIdentifier
{
  return (NSString *)[(SSAccount *)self accountPropertyForKey:@"storefrontID"];
}

- (SSAccount)initWithBackingAccount:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SSAccount;
  v6 = [(SSAccount *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_backingAccount, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.StoreServices.SSAccount.backingAccountAccessQueue", MEMORY[0x1E4F14430]);
    backingAccountAccessQueue = v7->_backingAccountAccessQueue;
    v7->_backingAccountAccessQueue = (OS_dispatch_queue *)v8;
  }
  return v7;
}

- (BOOL)hasBrokenDSID
{
  v3 = [(SSAccount *)self uniqueIdentifier];
  if (v3)
  {
    v4 = [(SSAccount *)self uniqueIdentifier];
    char v5 = [v4 isEqualToNumber:&unk_1EF9A97E0];
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

- (NSNumber)uniqueIdentifier
{
  if ([(SSAccount *)self isLocalAccount])
  {
    v3 = &unk_1EF9A97F8;
  }
  else
  {
    v4 = [(SSAccount *)self backingAccountAccessQueue];
    dispatch_assert_queue_not_V2(v4);

    uint64_t v8 = 0;
    v9 = &v8;
    uint64_t v10 = 0x3032000000;
    objc_super v11 = __Block_byref_object_copy__15;
    v12 = __Block_byref_object_dispose__15;
    id v13 = 0;
    char v5 = [(SSAccount *)self backingAccountAccessQueue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __29__SSAccount_uniqueIdentifier__block_invoke;
    v7[3] = &unk_1E5BA6F30;
    v7[4] = self;
    v7[5] = &v8;
    dispatch_sync(v5, v7);

    v3 = SSAccountGetUniqueIdentifierFromValue((void *)v9[5]);
    _Block_object_dispose(&v8, 8);
  }
  return (NSNumber *)v3;
}

- (BOOL)isLocalAccount
{
  v2 = self;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v3 = [(SSAccount *)self backingAccountAccessQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__SSAccount_isLocalAccount__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __21__SSAccount_isActive__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _backingAccount];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isActive];
}

void __35__SSAccount_accountPropertyForKey___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _backingAccount];
  uint64_t v2 = [v5 accountPropertyForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __27__SSAccount_isLocalAccount__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_opt_class();
  id v3 = [*(id *)(a1 + 32) _backingAccount];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 backingAccountIsLocalAccount:v3];
}

+ (BOOL)backingAccountIsLocalAccount:(id)a3
{
  return objc_msgSend(a3, "ams_isLocalAccount");
}

- (BOOL)isActive
{
  uint64_t v2 = self;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [(SSAccount *)self backingAccountAccessQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __21__SSAccount_isActive__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (id)accountPropertyForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(SSAccount *)self backingAccountAccessQueue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__15;
  v17 = __Block_byref_object_dispose__15;
  id v18 = 0;
  uint64_t v6 = [(SSAccount *)self backingAccountAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__SSAccount_accountPropertyForKey___block_invoke;
  block[3] = &unk_1E5BA6F80;
  id v11 = v4;
  v12 = &v13;
  block[4] = self;
  id v7 = v4;
  dispatch_sync(v6, block);

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (id)_backingAccount
{
  id v3 = [(SSAccount *)self backingAccountAccessQueue];
  dispatch_assert_queue_V2(v3);

  backingAccount = self->_backingAccount;
  return backingAccount;
}

- (OS_dispatch_queue)backingAccountAccessQueue
{
  return self->_backingAccountAccessQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingAccountAccessQueue, 0);
  objc_storeStrong((id *)&self->_bioToken, 0);
  objc_storeStrong((id *)&self->_backingAccount, 0);
}

- (SSAccount)init
{
  id v3 = objc_alloc(MEMORY[0x1E4F179B0]);
  id v4 = +[SSAccountStore defaultStore];
  id v5 = [v4 iTunesStoreAccountType];
  uint64_t v6 = (void *)[v3 initWithAccountType:v5];
  id v7 = [(SSAccount *)self initWithBackingAccount:v6];

  if (v7) {
    [(SSAccount *)v7 setActive:0];
  }
  return v7;
}

- (int64_t)accountKind
{
  uint64_t v2 = [(SSAccount *)self accountPropertyForKey:@"kind"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (NSString)accountName
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__15;
  id v11 = __Block_byref_object_dispose__15;
  id v12 = 0;
  int64_t v3 = [(SSAccount *)self backingAccountAccessQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __24__SSAccount_accountName__block_invoke;
  v6[3] = &unk_1E5BA6F30;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __24__SSAccount_accountName__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _backingAccount];
  uint64_t v2 = [v5 username];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (int64_t)accountScope
{
  id v3 = [(SSAccount *)self accountPropertyForKey:@"scope"];
  if (!v3)
  {
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
    id v4 = [(SSAccount *)self backingAccountAccessQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __25__SSAccount_accountScope__block_invoke;
    v8[3] = &unk_1E5BA6F30;
    v8[4] = self;
    v8[5] = &v9;
    dispatch_sync(v4, v8);

    if (*((unsigned char *)v10 + 24)) {
      id v5 = &unk_1EF9A97C8;
    }
    else {
      id v5 = &unk_1EF9A97E0;
    }
    id v3 = v5;
    _Block_object_dispose(&v9, 8);
  }
  int64_t v6 = [v3 integerValue];

  return v6;
}

void __25__SSAccount_accountScope__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _backingAccount];
  uint64_t v2 = [v4 accountType];
  id v3 = [v2 identifier];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 isEqualToString:*MEMORY[0x1E4F17898]];
}

- (NSString)altDSID
{
  return (NSString *)[(SSAccount *)self accountPropertyForKey:@"altDSID"];
}

- (NSArray)automaticDownloadKinds
{
  uint64_t v2 = [(SSAccount *)self accountPropertyForKey:@"automaticDownloadKinds"];
  id v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (int64_t)availableServiceTypes
{
  uint64_t v2 = [(SSAccount *)self accountPropertyForKey:@"availableServiceTypes"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (ACAccount)backingAccount
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__15;
  uint64_t v11 = __Block_byref_object_dispose__15;
  id v12 = 0;
  int64_t v3 = [(SSAccount *)self backingAccountAccessQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __27__SSAccount_backingAccount__block_invoke;
  v6[3] = &unk_1E5BA6F30;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (ACAccount *)v4;
}

void __27__SSAccount_backingAccount__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _backingAccount];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSString)creditsString
{
  return (NSString *)[(SSAccount *)self accountPropertyForKey:@"accountCredits"];
}

- (NSString)demoAccountRawPassword
{
  return 0;
}

- (BOOL)didFallbackToPassword
{
  uint64_t v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = [(SSAccount *)self backingAccountAccessQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__SSAccount_didFallbackToPassword__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __34__SSAccount_didFallbackToPassword__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 24);
  return result;
}

- (BOOL)displayedServerPromptWithIdentifier:(id)a3
{
  id v4 = a3;
  if (SSDebugShouldDisableServerPrompts())
  {
    char v5 = 1;
  }
  else
  {
    uint64_t v6 = [(id)objc_opt_class() _displayedServerPromptKeyWithIdentifier:v4];
    uint64_t v7 = [(SSAccount *)self accountPropertyForKey:v6];
    char v5 = [v7 BOOLValue];
  }
  return v5;
}

- (BOOL)isDirty
{
  uint64_t v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = [(SSAccount *)self backingAccountAccessQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __20__SSAccount_isDirty__block_invoke;
  v5[3] = &unk_1E5BA6FC8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __20__SSAccount_isDirty__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _backingAccount];
  if ([v4 isDirty])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    uint64_t v2 = [v4 dirtyAccountProperties];
    if ([v2 count])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
    else
    {
      uint64_t v3 = [v4 dirtyDataclassProperties];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 count] != 0;
    }
  }
}

- (int64_t)enabledServiceTypes
{
  uint64_t v2 = [(SSAccount *)self accountPropertyForKey:@"enabledServiceTypes"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (NSString)firstName
{
  return (NSString *)[(SSAccount *)self accountPropertyForKey:@"firstName"];
}

- (BOOL)isAuthenticated
{
  uint64_t v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  int64_t v3 = [(SSAccount *)self backingAccountAccessQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__SSAccount_isAuthenticated__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __28__SSAccount_isAuthenticated__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _backingAccount];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isAuthenticated];
}

- (BOOL)isSocialEnabled
{
  return [(SSAccount *)self enabledServiceTypes] & 1;
}

- (id)lastAttemptDateForServerPromptWithIdentifier:(id)a3
{
  id v4 = a3;
  char v5 = [(id)objc_opt_class() _lastAttemptForServerPromptKeyWithIdentifier:v4];

  uint64_t v6 = [(SSAccount *)self accountPropertyForKey:v5];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  return v8;
}

- (NSString)lastName
{
  return (NSString *)[(SSAccount *)self accountPropertyForKey:@"lastName"];
}

- (NSString)localizedName
{
  int64_t v3 = [(SSAccount *)self firstName];
  if (v3)
  {

LABEL_4:
    id v5 = objc_alloc_init(MEMORY[0x1E4F28F30]);
    uint64_t v6 = [(SSAccount *)self lastName];
    [v5 setFamilyName:v6];

    uint64_t v7 = [(SSAccount *)self firstName];
    [v5 setGivenName:v7];

    id v8 = objc_alloc_init(MEMORY[0x1E4F28F38]);
    char v9 = [v8 stringFromPersonNameComponents:v5];

    goto LABEL_5;
  }
  id v4 = [(SSAccount *)self lastName];

  if (v4) {
    goto LABEL_4;
  }
  char v9 = 0;
LABEL_5:
  return (NSString *)v9;
}

void __29__SSAccount_uniqueIdentifier__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _backingAccount];
  uint64_t v2 = objc_msgSend(v5, "_ss_DSID");
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (int64_t)accountSource
{
  uint64_t v2 = [(SSAccount *)self accountPropertyForKey:@"accountSource"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (int64_t)freeDownloadsPasswordSetting
{
  uint64_t v2 = [(SSAccount *)self accountPropertyForKey:@"freeDownloadsPasswordSetting"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (BOOL)isActiveLockerAccount
{
  uint64_t v2 = [(SSAccount *)self accountPropertyForKey:@"isActiveLockerAccount"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isDemoAccount
{
  uint64_t v2 = [(SSAccount *)self backingAccount];
  char v3 = objc_msgSend(v2, "ams_isDemoAccount");

  return v3;
}

- (BOOL)isDuplicate:(id)a3
{
  id v4 = a3;
  id v5 = [(SSAccount *)self backingAccount];
  uint64_t v6 = [v4 backingAccount];

  LOBYTE(v4) = objc_msgSend(v5, "_ss_isDuplicate:", v6);
  return (char)v4;
}

- (BOOL)isManagedAppleID
{
  uint64_t v2 = [(SSAccount *)self accountPropertyForKey:@"isManagedAppleID"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isNewCustomer
{
  uint64_t v2 = [(SSAccount *)self accountPropertyForKey:@"isNewCustomer"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSString)ITunesPassSerialNumber
{
  return (NSString *)[(SSAccount *)self accountPropertyForKey:@"iTunesPassSerialNumber"];
}

- (int64_t)paidPurchasesPasswordSetting
{
  uint64_t v2 = [(SSAccount *)self accountPropertyForKey:@"paidPurchasesPasswordSetting"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (NSString)passwordEquivalentToken
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__15;
  uint64_t v11 = __Block_byref_object_dispose__15;
  id v12 = 0;
  int64_t v3 = [(SSAccount *)self backingAccountAccessQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__SSAccount_passwordEquivalentToken__block_invoke;
  v6[3] = &unk_1E5BA6FC8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __36__SSAccount_passwordEquivalentToken__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) _backingAccount];
  uint64_t v2 = [v6 credential];
  uint64_t v3 = [v2 credentialItemForKey:*MEMORY[0x1E4F17930]];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (NSString)rawPassword
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__15;
  uint64_t v11 = __Block_byref_object_dispose__15;
  id v12 = 0;
  uint64_t v3 = [(SSAccount *)self backingAccountAccessQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __24__SSAccount_rawPassword__block_invoke;
  v6[3] = &unk_1E5BA6FC8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __24__SSAccount_rawPassword__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _backingAccount];
  uint64_t v2 = objc_msgSend(v5, "ams_rawPassword");
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSString)secureToken
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(SSAccount *)self backingAccount];
  id v5 = [v4 identifier];
  id v6 = [v3 secureTokenForIdentifier:v5];

  return (NSString *)v6;
}

- (void)setPasswordEquivalentToken:(id)a3
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = SSIsInternalBuild();
  if (v4 && v5 && ([v4 hasSuffix:@"PET"] & 1) == 0)
  {
    id v6 = +[SSLogConfig sharedAccountsAuthenticationConfig];
    if (!v6)
    {
      id v6 = +[SSLogConfig sharedConfig];
    }
    int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    uint64_t v9 = [v6 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      v8 &= 2u;
    }
    if (v8)
    {
      [(SSAccount *)self hashedDescription];
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v20) = 12;
      uint64_t v10 = (void *)_os_log_send_and_compose_impl();

      if (v10)
      {
        uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, location, v20);
        free(v10);
        SSFileLog(v6, @"%@", v12, v13, v14, v15, v16, v17, (uint64_t)v11);
      }
    }
    else
    {
    }
  }
  objc_initWeak(location, self);
  id v18 = [(SSAccount *)self backingAccountAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__SSAccount_setPasswordEquivalentToken___block_invoke;
  block[3] = &unk_1E5BA8860;
  objc_copyWeak(&v23, location);
  id v22 = v4;
  id v19 = v4;
  dispatch_barrier_async(v18, block);

  objc_destroyWeak(&v23);
  objc_destroyWeak(location);
}

void __40__SSAccount_setPasswordEquivalentToken___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained _backingAccount];
  uint64_t v3 = [v2 credential];
  if (!v3)
  {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F179C0]) initWithPassword:0];
    [v2 setCredential:v3];
  }
  uint64_t v4 = *MEMORY[0x1E4F17930];
  int v5 = [v3 credentialItemForKey:*MEMORY[0x1E4F17930]];
  char v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  if ((v6 & 1) == 0) {
    [v3 setCredentialItem:*(void *)(a1 + 32) forKey:v4];
  }
}

- (void)setRawPassword:(id)a3
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = SSIsInternalBuild();
  if (v4 && v5 && [v4 hasSuffix:@"PET"])
  {
    char v6 = +[SSLogConfig sharedAccountsAuthenticationConfig];
    if (!v6)
    {
      char v6 = +[SSLogConfig sharedConfig];
    }
    int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    uint64_t v9 = [v6 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      v8 &= 2u;
    }
    if (v8)
    {
      [(SSAccount *)self hashedDescription];
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v20) = 12;
      uint64_t v10 = (void *)_os_log_send_and_compose_impl();

      if (v10)
      {
        uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, location, v20);
        free(v10);
        SSFileLog(v6, @"%@", v12, v13, v14, v15, v16, v17, (uint64_t)v11);
      }
    }
    else
    {
    }
  }
  objc_initWeak(location, self);
  id v18 = [(SSAccount *)self backingAccountAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__SSAccount_setRawPassword___block_invoke;
  block[3] = &unk_1E5BA8860;
  objc_copyWeak(&v23, location);
  id v22 = v4;
  id v19 = v4;
  dispatch_barrier_async(v18, block);

  objc_destroyWeak(&v23);
  objc_destroyWeak(location);
}

void __28__SSAccount_setRawPassword___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained _backingAccount];
  uint64_t v3 = [v2 credential];
  if (!v3)
  {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F179C0]) initWithPassword:0];
    [v2 setCredential:v3];
  }
  uint64_t v4 = *MEMORY[0x1E4F17970];
  int v5 = [v3 credentialItemForKey:*MEMORY[0x1E4F17970]];
  char v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  if ((v6 & 1) == 0) {
    [v3 setCredentialItem:*(void *)(a1 + 32) forKey:v4];
  }
}

- (void)setAccountKind:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(SSAccount *)self _setAccountProperty:v4 forKey:@"kind"];
}

- (void)setAccountName:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  int v5 = [(SSAccount *)self backingAccountAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__SSAccount_setAccountName___block_invoke;
  block[3] = &unk_1E5BA8860;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __28__SSAccount_setAccountName___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained _backingAccount];
  uint64_t v3 = [v2 username];
  char v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  if ((v4 & 1) == 0)
  {
    int v5 = [WeakRetained _backingAccount];
    [v5 setUsername:*(void *)(a1 + 32)];
  }
}

- (void)setAccountScope:(int64_t)a3
{
  int v5 = objc_msgSend(NSNumber, "numberWithInteger:");
  [(SSAccount *)self _setAccountProperty:v5 forKey:@"scope"];

  if (a3 == 1)
  {
    id v6 = [(SSAccount *)self backingAccountAccessQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __29__SSAccount_setAccountScope___block_invoke;
    block[3] = &unk_1E5BA7040;
    void block[4] = self;
    dispatch_barrier_sync(v6, block);
  }
}

void __29__SSAccount_setAccountScope___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStoreForMediaType:", *MEMORY[0x1E4F4D9F0]);
  id v4 = [v2 accountTypeWithAccountTypeIdentifier:*MEMORY[0x1E4F17898]];

  uint64_t v3 = [*(id *)(a1 + 32) _backingAccount];
  [v3 setAccountType:v4];
}

- (void)setAccountSource:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(SSAccount *)self _setAccountProperty:v4 forKey:@"accountSource"];
}

- (void)setActive:(BOOL)a3
{
  objc_initWeak(&location, self);
  int v5 = [(SSAccount *)self backingAccountAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23__SSAccount_setActive___block_invoke;
  block[3] = &unk_1E5BA9228;
  objc_copyWeak(&v7, &location);
  BOOL v8 = a3;
  dispatch_barrier_async(v5, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __23__SSAccount_setActive___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained _backingAccount];
  int v3 = [v2 isActive];
  int v4 = *(unsigned __int8 *)(a1 + 40);

  if (v4 != v3)
  {
    int v5 = [WeakRetained _backingAccount];
    [v5 setActive:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (void)setActiveLockerAccount:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(SSAccount *)self _setAccountProperty:v4 forKey:@"isActiveLockerAccount"];
}

- (void)setAltDSID:(id)a3
{
}

- (void)setAuthenticated:(BOOL)a3
{
  objc_initWeak(&location, self);
  int v5 = [(SSAccount *)self backingAccountAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__SSAccount_setAuthenticated___block_invoke;
  block[3] = &unk_1E5BA9228;
  objc_copyWeak(&v7, &location);
  BOOL v8 = a3;
  dispatch_barrier_async(v5, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __30__SSAccount_setAuthenticated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained _backingAccount];
  int v3 = [v2 isAuthenticated];
  int v4 = *(unsigned __int8 *)(a1 + 40);

  if (v4 != v3)
  {
    int v5 = [WeakRetained _backingAccount];
    [v5 setAuthenticated:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (void)setAutomaticDownloadKinds:(id)a3
{
  id v4 = (id)[a3 copy];
  [(SSAccount *)self _setAccountProperty:v4 forKey:@"automaticDownloadKinds"];
}

- (void)setAvailableServiceTypes:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(SSAccount *)self _setAccountProperty:v4 forKey:@"availableServiceTypes"];
}

- (void)setCreditsString:(id)a3
{
}

- (void)setDidFallbackToPassword:(BOOL)a3
{
  int v5 = [(SSAccount *)self backingAccountAccessQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__SSAccount_setDidFallbackToPassword___block_invoke;
  v6[3] = &unk_1E5BA8060;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_barrier_async(v5, v6);
}

uint64_t __38__SSAccount_setDidFallbackToPassword___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 24) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setDisplayedServerPrompt:(BOOL)a3 withIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v8 = [(id)objc_opt_class() _displayedServerPromptKeyWithIdentifier:v6];

  BOOL v7 = [NSNumber numberWithBool:v4];
  [(SSAccount *)self _setAccountProperty:v7 forKey:v8];
}

- (void)setEnabledServiceTypes:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(SSAccount *)self _setAccountProperty:v4 forKey:@"enabledServiceTypes"];
}

- (void)setFirstName:(id)a3
{
}

- (void)setFreeDownloadsPasswordSetting:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(SSAccount *)self _setAccountProperty:v4 forKey:@"freeDownloadsPasswordSetting"];
}

- (void)setITunesPassSerialNumber:(id)a3
{
}

- (void)setLastAttemptDate:(id)a3 forServerPromptWithIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(id)objc_opt_class() _lastAttemptForServerPromptKeyWithIdentifier:v6];

  [(SSAccount *)self _setAccountProperty:v7 forKey:v8];
}

- (void)setLastName:(id)a3
{
}

- (void)setManagedAppleID:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(SSAccount *)self _setAccountProperty:v4 forKey:@"isManagedAppleID"];
}

- (void)setNewCustomer:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(SSAccount *)self _setAccountProperty:v4 forKey:@"isNewCustomer"];
}

- (void)setPaidPurchasesPasswordSetting:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(SSAccount *)self _setAccountProperty:v4 forKey:@"paidPurchasesPasswordSetting"];
}

- (void)setSecureToken:(id)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(SSAccount *)self backingAccount];
  id v6 = [v5 identifier];

  uint64_t v7 = [v6 length];
  uint64_t v8 = +[SSLogConfig sharedAccountsAuthenticationConfig];
  id v9 = (void *)v8;
  if (v7)
  {
    if (!v8)
    {
      id v9 = +[SSLogConfig sharedConfig];
    }
    int v10 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v11 = v10 | 2;
    }
    else {
      int v11 = v10;
    }
    uint64_t v12 = [v9 OSLogObject];
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      v11 &= 2u;
    }
    if (v11)
    {
      *(_DWORD *)result = 138543618;
      *(void *)&result[4] = objc_opt_class();
      __int16 v71 = 2112;
      v72 = v6;
      id v13 = *(id *)&result[4];
      LODWORD(v68) = 22;
      v67 = result;
      uint64_t v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14) {
        goto LABEL_13;
      }
      uint64_t v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, result, v68);
      free(v14);
      SSFileLog(v9, @"%@", v15, v16, v17, v18, v19, v20, (uint64_t)v12);
    }

LABEL_13:
    CFAllocatorRef v21 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B5C0], v6);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B850], @"com.apple.itunesstored.token");
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B978], (const void *)*MEMORY[0x1E4F3B988]);
    id v9 = [v4 dataUsingEncoding:4];
    id v23 = [(SSAccount *)self secureToken];
    v24 = v23;
    if (v23)
    {
      if (([v23 isEqualToString:v4] & 1) == 0)
      {
        id v69 = v4;
        v25 = +[SSLogConfig sharedAccountsAuthenticationConfig];
        if (!v25)
        {
          v25 = +[SSLogConfig sharedConfig];
        }
        int v26 = objc_msgSend(v25, "shouldLog", v67);
        if ([v25 shouldLogToDisk]) {
          int v27 = v26 | 2;
        }
        else {
          int v27 = v26;
        }
        v28 = [v25 OSLogObject];
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
          int v29 = v27;
        }
        else {
          int v29 = v27 & 2;
        }
        if (v29)
        {
          v30 = objc_opt_class();
          *(_DWORD *)result = 138543362;
          *(void *)&result[4] = v30;
          id v31 = v30;
          LODWORD(v68) = 12;
          v32 = (void *)_os_log_send_and_compose_impl();

          id v4 = v69;
          if (!v32)
          {
LABEL_52:

            v66 = CFDictionaryCreateMutable(v21, 0, 0, 0);
            CFDictionaryAddValue(v66, (const void *)*MEMORY[0x1E4F3B558], (const void *)*MEMORY[0x1E4F3B578]);
            CFDictionaryAddValue(v66, (const void *)*MEMORY[0x1E4F3BD38], v9);
            SecItemUpdate(Mutable, v66);
            CFRelease(v66);
            goto LABEL_53;
          }
          v28 = objc_msgSend(NSString, "stringWithCString:encoding:", v32, 4, result, v68);
          free(v32);
          SSFileLog(v25, @"%@", v33, v34, v35, v36, v37, v38, (uint64_t)v28);
        }
        else
        {
          id v4 = v69;
        }

        goto LABEL_52;
      }
LABEL_53:
      CFRelease(Mutable);

      goto LABEL_54;
    }
    v51 = +[SSLogConfig sharedAccountsAuthenticationConfig];
    if (!v51)
    {
      v51 = +[SSLogConfig sharedConfig];
    }
    int v52 = objc_msgSend(v51, "shouldLog", v67);
    if ([v51 shouldLogToDisk]) {
      int v53 = v52 | 2;
    }
    else {
      int v53 = v52;
    }
    v54 = [v51 OSLogObject];
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT)) {
      int v55 = v53;
    }
    else {
      int v55 = v53 & 2;
    }
    if (v55)
    {
      v56 = objc_opt_class();
      *(_DWORD *)result = 138543362;
      *(void *)&result[4] = v56;
      id v57 = v4;
      id v58 = v56;
      LODWORD(v68) = 12;
      v59 = (void *)_os_log_send_and_compose_impl();

      id v4 = v57;
      if (!v59)
      {
LABEL_48:

        *(void *)result = 0;
        CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B558], (const void *)*MEMORY[0x1E4F3B578]);
        CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BD38], v9);
        SecItemAdd(Mutable, (CFTypeRef *)result);
        goto LABEL_53;
      }
      v54 = objc_msgSend(NSString, "stringWithCString:encoding:", v59, 4, result, v68);
      free(v59);
      SSFileLog(v51, @"%@", v60, v61, v62, v63, v64, v65, (uint64_t)v54);
    }

    goto LABEL_48;
  }
  if (!v8)
  {
    id v9 = +[SSLogConfig sharedConfig];
  }
  int v39 = [v9 shouldLog];
  if ([v9 shouldLogToDisk]) {
    v39 |= 2u;
  }
  v40 = [v9 OSLogObject];
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
    int v41 = v39;
  }
  else {
    int v41 = v39 & 2;
  }
  if (v41)
  {
    *(_DWORD *)result = 138543362;
    *(void *)&result[4] = objc_opt_class();
    id v42 = *(id *)&result[4];
    LODWORD(v68) = 12;
    v43 = (void *)_os_log_send_and_compose_impl();

    if (v43)
    {
      v44 = objc_msgSend(NSString, "stringWithCString:encoding:", v43, 4, result, v68);
      free(v43);
      SSFileLog(v9, @"%@", v45, v46, v47, v48, v49, v50, (uint64_t)v44);
    }
  }
  else
  {
  }
LABEL_54:
}

- (void)setSocialEnabled:(BOOL)a3
{
  if (a3) {
    [(SSAccount *)self _addAccountPropertyBitmask:1 forKey:@"enabledServiceTypes"];
  }
  else {
    [(SSAccount *)self _removeAccountPropertyBitmask:1 forKey:@"enabledServiceTypes"];
  }
}

- (void)setStoreFrontIdentifier:(id)a3
{
}

- (void)setStoreFrontIdentifier:(id)a3 forRequest:(id)a4 response:(id)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(SSAccount *)self accountPropertyForKey:@"storefrontID"];
  if (v7
    && +[SSDevice deviceIsInternalBuild]
    && ![(SSAccount *)self isLocalAccount])
  {
    if (v6)
    {
      uint64_t v8 = [(id)objc_opt_class() _countryCodeFromStorefrontIdentifier:v7];
      id v9 = [(id)objc_opt_class() _countryCodeFromStorefrontIdentifier:v6];
      if (([v8 isEqualToString:v9] & 1) == 0)
      {
        int v10 = +[SSLogConfig sharedAccountsStorefrontConfig];
        if (!v10)
        {
          int v10 = +[SSLogConfig sharedConfig];
        }
        int v11 = [v10 shouldLog];
        if ([v10 shouldLogToDisk]) {
          int v12 = v11 | 2;
        }
        else {
          int v12 = v11;
        }
        id v13 = [v10 OSLogObject];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          int v14 = v12;
        }
        else {
          int v14 = v12 & 2;
        }
        if (v14)
        {
          uint64_t v15 = objc_opt_class();
          id v45 = v15;
          [(SSAccount *)self hashedDescription];
          id v42 = v44 = v9;
          SSHashIfNeeded(v7);
          uint64_t v16 = v43 = v13;
          uint64_t v17 = SSHashIfNeeded(v6);
          +[SSStackShot generateSymbolicatedStackShot];
          int v46 = 138544386;
          uint64_t v47 = v15;
          __int16 v48 = 2114;
          uint64_t v49 = v42;
          __int16 v50 = 2114;
          v51 = v16;
          __int16 v52 = 2114;
          int v53 = v17;
          uint64_t v55 = v54 = 2114;
          uint64_t v18 = (void *)v55;
          LODWORD(v41) = 52;
          v40 = &v46;
          uint64_t v19 = (void *)_os_log_send_and_compose_impl();

          id v9 = v44;
          if (!v19)
          {
LABEL_18:

            goto LABEL_30;
          }
          id v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v19, 4, &v46, v41);
          free(v19);
          SSFileLog(v10, @"%@", v20, v21, v22, v23, v24, v25, (uint64_t)v13);
        }

        goto LABEL_18;
      }
    }
    else
    {
      uint64_t v8 = +[SSLogConfig sharedAccountsStorefrontConfig];
      if (!v8)
      {
        uint64_t v8 = +[SSLogConfig sharedConfig];
      }
      int v26 = [v8 shouldLog];
      if ([v8 shouldLogToDisk]) {
        int v27 = v26 | 2;
      }
      else {
        int v27 = v26;
      }
      id v9 = [v8 OSLogObject];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        int v28 = v27;
      }
      else {
        int v28 = v27 & 2;
      }
      if (v28)
      {
        int v29 = objc_opt_class();
        id v30 = v29;
        id v31 = [(SSAccount *)self hashedDescription];
        v32 = +[SSStackShot generateSymbolicatedStackShot];
        int v46 = 138543874;
        uint64_t v47 = v29;
        __int16 v48 = 2114;
        uint64_t v49 = v31;
        __int16 v50 = 2114;
        v51 = v32;
        LODWORD(v41) = 32;
        v40 = &v46;
        uint64_t v33 = (void *)_os_log_send_and_compose_impl();

        if (!v33)
        {
LABEL_31:

          goto LABEL_32;
        }
        id v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v33, 4, &v46, v41);
        free(v33);
        SSFileLog(v8, @"%@", v34, v35, v36, v37, v38, v39, (uint64_t)v9);
      }
    }
LABEL_30:

    goto LABEL_31;
  }
LABEL_32:
  [(SSAccount *)self _setAccountProperty:v6, @"storefrontID", v40 forKey];
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  id v4 = [(SSAccount *)self backingAccountAccessQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __28__SSAccount_copyXPCEncoding__block_invoke;
  v8[3] = &unk_1E5BA7018;
  id v5 = v3;
  id v9 = v5;
  int v10 = self;
  dispatch_sync(v4, v8);

  id v6 = v5;
  return v6;
}

void __28__SSAccount_copyXPCEncoding__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) _backingAccount];
  SSXPCDictionarySetObject(v1, "0", v2);
}

- (SSAccount)initWithXPCEncoding:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (!v5 || MEMORY[0x1A62689E0](v5) != MEMORY[0x1E4F14590])
  {
    int v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"SSAccount.m" lineNumber:606 description:@"-[SSAccount initWithXPCEncoding:] provided with an invalid xpc_object_t object."];
  }
  uint64_t v7 = [(SSAccount *)self init];
  if (v7)
  {
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = SSXPCDictionaryCopyObjectWithClass(v6, "0", v8);
    backingAccount = v7->_backingAccount;
    v7->_backingAccount = (ACAccount *)v9;
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SSAccount *)self backingAccountAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__SSAccount_copyWithZone___block_invoke;
  block[3] = &unk_1E5BA86D0;
  void block[4] = self;
  id v13 = a3;
  id v7 = v5;
  id v12 = v7;
  dispatch_sync(v6, block);

  uint64_t v8 = v12;
  id v9 = v7;

  return v9;
}

void __26__SSAccount_copyWithZone___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _backingAccount];
  xpc_object_t v3 = (void *)[v2 copyWithZone:*(void *)(a1 + 48)];

  id v4 = [*(id *)(a1 + 40) backingAccountAccessQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __26__SSAccount_copyWithZone___block_invoke_2;
  v6[3] = &unk_1E5BA7018;
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v5 = v3;
  dispatch_barrier_async(v4, v6);
}

uint64_t __26__SSAccount_copyWithZone___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setBackingAccount:*(void *)(a1 + 40)];
}

- (NSString)description
{
  xpc_object_t v3 = (void *)MEMORY[0x1E4F28E78];
  v16.receiver = self;
  v16.super_class = (Class)SSAccount;
  id v4 = [(SSAccount *)&v16 description];
  id v5 = [v3 stringWithFormat:@"%@:", v4];

  if ([(SSAccount *)self isLocalAccount])
  {
    [v5 appendFormat:@" Local Account"];
  }
  else
  {
    uint64_t v15 = [(SSAccount *)self altDSID];
    id v6 = [(SSAccount *)self uniqueIdentifier];
    id v7 = [(SSAccount *)self accountName];
    id v8 = [(SSAccount *)self backingAccount];
    id v9 = [v8 identifier];
    int64_t v10 = [(SSAccount *)self accountScope];
    if ([(SSAccount *)self isActive]) {
      int v11 = @"YES";
    }
    else {
      int v11 = @"NO";
    }
    if ([(SSAccount *)self isAuthenticated]) {
      id v12 = @"YES";
    }
    else {
      id v12 = @"NO";
    }
    [v5 appendFormat:@" altDSID = %@ | DSID = %@ | username = %@ | backingIdentifier = %@ | scope = %ld | active = %@ | authenticated = %@", v15, v6, v7, v9, v10, v11, v12];
  }
  id v13 = [(SSAccount *)self storeFrontIdentifier];
  [v5 appendFormat:@" | storefront = %@>", v13];

  return (NSString *)v5;
}

- (unint64_t)hash
{
  id v2 = [(SSAccount *)self uniqueIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    goto LABEL_2;
  }
  if (-[SSAccount isLocalAccount](self, "isLocalAccount") && ([v4 isLocalAccount] & 1) != 0)
  {
    char v6 = 1;
    goto LABEL_3;
  }
  id v8 = [(SSAccount *)self altDSID];
  if (v8)
  {
    LODWORD(v9) = 0;
  }
  else
  {
    int64_t v10 = [v4 altDSID];
    LODWORD(v9) = v10 == 0;
  }
  int v11 = [(SSAccount *)self uniqueIdentifier];
  if (v11)
  {
    uint64_t v9 = 0;
  }
  else
  {
    id v12 = [v4 uniqueIdentifier];
    uint64_t v9 = v12 ? 0 : v9;
  }
  id v13 = [(SSAccount *)self accountName];
  if (v13)
  {
  }
  else
  {
    int v14 = [v4 accountName];

    char v15 = v9 ^ 1;
    if (v14) {
      char v15 = 1;
    }
    if ((v15 & 1) == 0)
    {
      objc_super v16 = [(SSAccount *)self backingAccount];
      uint64_t v17 = [v16 identifier];
      uint64_t v18 = [v4 backingAccount];
      uint64_t v19 = [v18 identifier];
      char v6 = [v17 isEqualToString:v19];

      goto LABEL_3;
    }
  }
  int64_t v20 = [(SSAccount *)self accountScope];
  if (v20 != [v4 accountScope]) {
    goto LABEL_2;
  }
  uint64_t v21 = [(SSAccount *)self altDSID];
  if (v21 || ([v4 altDSID], (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v22 = [(SSAccount *)self altDSID];
    uint64_t v23 = [v4 altDSID];
    int v24 = [v22 isEqual:v23];

    if (v21)
    {

      if (!v24) {
        goto LABEL_2;
      }
    }
    else
    {

      if ((v24 & 1) == 0) {
        goto LABEL_2;
      }
    }
  }
  uint64_t v25 = [(SSAccount *)self uniqueIdentifier];
  if (!v25)
  {
    uint64_t v9 = [v4 uniqueIdentifier];
    if (!v9)
    {
LABEL_35:
      int v29 = [(SSAccount *)self accountName];
      if (v29 || ([v4 accountName], (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        id v30 = [(SSAccount *)self accountName];
        id v31 = [v4 accountName];
        int v32 = [v30 isEqual:v31] ^ 1;

        if (v29)
        {
LABEL_41:

          char v6 = v32 ^ 1;
          goto LABEL_3;
        }
      }
      else
      {
        LOBYTE(v32) = 0;
      }

      goto LABEL_41;
    }
  }
  int v26 = [(SSAccount *)self uniqueIdentifier];
  int v27 = [v4 uniqueIdentifier];
  int v28 = [v26 isEqual:v27];

  if (!v25)
  {

    if ((v28 & 1) == 0) {
      goto LABEL_2;
    }
    goto LABEL_35;
  }

  if (v28) {
    goto LABEL_35;
  }
LABEL_2:
  char v6 = 0;
LABEL_3:

  return v6;
}

- (void)acceptTermsAndConditions:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(SSMutableURLRequestProperties);
  [(SSMutableURLRequestProperties *)v8 setITunesStoreRequest:1];
  [(SSMutableURLRequestProperties *)v8 setURLBagKey:@"terms-check"];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  int64_t v10 = NSNumber;
  uint64_t v11 = [v7 currentVersionIdentifier];

  id v12 = [v10 numberWithLongLong:v11];
  [v9 setObject:v12 forKey:@"accepted"];

  id v13 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v9 options:0 error:0];
  [(SSMutableURLRequestProperties *)v8 setHTTPBody:v13];

  [(SSMutableURLRequestProperties *)v8 setHTTPMethod:@"POST"];
  int v14 = [[SSURLConnectionRequest alloc] initWithRequestProperties:v8];
  char v15 = [[SSAuthenticationContext alloc] initWithAccount:self];
  [(SSURLConnectionRequest *)v14 setAuthenticationContext:v15];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __58__SSAccount_acceptTermsAndConditions_withCompletionBlock___block_invoke;
  v17[3] = &unk_1E5BA9250;
  id v18 = v6;
  id v16 = v6;
  [(SSURLConnectionRequest *)v14 startWithConnectionResponseBlock:v17];
}

void __58__SSAccount_acceptTermsAndConditions_withCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7)
  {
    if (v5)
    {
      id v8 = [SSTermsAndConditions alloc];
      id v9 = [v5 bodyData];
      id v12 = v6;
      int64_t v10 = [(SSTermsAndConditions *)v8 initWithResponseData:v9 error:&v12];
      id v11 = v12;

      uint64_t v7 = *(void *)(a1 + 32);
      id v6 = v11;
    }
    else
    {
      int64_t v10 = 0;
    }
    (*(void (**)(uint64_t, BOOL, id))(v7 + 16))(v7, [(SSTermsAndConditions *)v10 isUserAccepted], v6);
  }
}

- (id)eligibilityForService:(int64_t)a3
{
  id v4 = [(SSAccount *)self accountPropertyForKey:@"eligibleServices"];
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", a3);
  id v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (void)getDownloadKindsEligibleForContentRestoreWithBlock:(id)a3
{
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"nil completionBlock"];
  }
  id v5 = objc_alloc_init(SSURLBagContext);
  [(SSURLBagContext *)v5 setBagType:SSURLBagTypeForAccountScope([(SSAccount *)self accountScope])];
  id v6 = [(SSAccount *)self uniqueIdentifier];
  [(SSURLBagContext *)v5 setUserIdentifier:v6];

  uint64_t v7 = [[SSURLBag alloc] initWithURLBagContext:v5];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__SSAccount_getDownloadKindsEligibleForContentRestoreWithBlock___block_invoke;
  v9[3] = &unk_1E5BA9278;
  id v10 = v4;
  id v8 = v4;
  [(SSURLBag *)v7 loadValueForKey:@"p2-content-restore" completionBlock:v9];
}

void __64__SSAccount_getDownloadKindsEligibleForContentRestoreWithBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v7 objectForKey:@"allowed-kinds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_5;
    }
  }
  id v6 = 0;
LABEL_5:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getEligibilityForService:(int64_t)a3 completionBlock:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(SSVSubscriptionStatusRequest);
  [(SSVSubscriptionStatusRequest *)v6 setCarrierBundleProvisioningStyle:0];
  id v7 = [[SSAuthenticationContext alloc] initWithAccount:self];
  [(SSVSubscriptionStatusRequest *)v6 setAuthenticationContext:v7];
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  char v13 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__SSAccount_getEligibilityForService_completionBlock___block_invoke;
  v9[3] = &unk_1E5BA92A0;
  id v8 = v5;
  id v10 = v8;
  id v11 = v12;
  [(SSVSubscriptionStatusRequest *)v6 startWithStatusResponseBlock:v9];

  _Block_object_dispose(v12, 8);
}

void __54__SSAccount_getEligibilityForService_completionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v10 = a2;
  id v6 = a4;
  if (*(void *)(a1 + 32) && !*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    if (v10)
    {
      uint64_t v7 = [v10 accountStatus];
      if (v7 == 2)
      {
        uint64_t v8 = 0;
        goto LABEL_9;
      }
      if (v7 == 3)
      {
        uint64_t v8 = 1;
LABEL_9:
        id v9 = (void *)[objc_alloc(NSNumber) initWithBool:v8];
        goto LABEL_10;
      }
    }
    id v9 = 0;
LABEL_10:
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (void)getPurchasedItemsForItems:(id)a3 completionBlock:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    uint64_t v8 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v8)
    {
      uint64_t v8 = +[SSLogConfig sharedConfig];
    }
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    id v11 = [v8 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      int v12 = v10;
    }
    else {
      int v12 = v10 & 2;
    }
    if (v12)
    {
      int v27 = 136446210;
      int v28 = "-[SSAccount getPurchasedItemsForItems:completionBlock:]";
      LODWORD(v24) = 12;
      char v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_15:

        goto LABEL_16;
      }
      id v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v27, v24);
      free(v13);
      SSFileLog(v8, @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    }

    goto LABEL_15;
  }
LABEL_16:
  if (!v6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"nil completionBlock"];
  }
  xpc_object_t v20 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v20, "0", 67);
  SSXPCDictionarySetObject(v20, "2", v7);

  uint64_t v21 = [[SSAuthenticationContext alloc] initWithAccount:self];
  SSXPCDictionarySetObject(v20, "1", v21);
  uint64_t v22 = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __55__SSAccount_getPurchasedItemsForItems_completionBlock___block_invoke;
  v25[3] = &unk_1E5BA92C8;
  id v26 = v6;
  id v23 = v6;
  [(SSXPCConnection *)v22 sendMessage:v20 withReply:v25];
}

void __55__SSAccount_getPurchasedItemsForItems_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3 == (id)MEMORY[0x1E4F14520])
  {
    uint64_t v5 = 121;
    goto LABEL_6;
  }
  if (!v3 || MEMORY[0x1A62689E0](v3) != MEMORY[0x1E4F14590])
  {
    uint64_t v5 = 111;
LABEL_6:
    uint64_t v6 = SSError(@"SSErrorDomain", v5, 0, 0);
    unint64_t v7 = 0;
    goto LABEL_7;
  }
  id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
  char v13 = xpc_dictionary_get_value(v4, "2");
  uint64_t v6 = [v12 initWithXPCEncoding:v13];

  uint64_t v14 = xpc_dictionary_get_value(v4, "1");
  uint64_t v15 = objc_opt_class();
  unint64_t v7 = (unint64_t)SSXPCCreateNSArrayFromXPCEncodedArray(v14, v15);

LABEL_7:
  if (!(v6 | v7))
  {
    uint64_t v6 = SSError(@"SSErrorDomain", 100, 0, 0);
  }
  uint64_t v8 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__SSAccount_getPurchasedItemsForItems_completionBlock___block_invoke_2;
  block[3] = &unk_1E5BA6EB8;
  id v9 = *(id *)(a1 + 32);
  id v18 = (id)v6;
  id v19 = v9;
  id v17 = (id)v7;
  id v10 = (id)v6;
  id v11 = (id)v7;
  dispatch_async(v8, block);
}

uint64_t __55__SSAccount_getPurchasedItemsForItems_completionBlock___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getTermsAndConditionsWithBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(SSMutableURLRequestProperties);
  [(SSMutableURLRequestProperties *)v5 setITunesStoreRequest:1];
  [(SSMutableURLRequestProperties *)v5 setURLBagKey:@"terms-check"];
  uint64_t v6 = [[SSURLConnectionRequest alloc] initWithRequestProperties:v5];
  unint64_t v7 = [[SSAuthenticationContext alloc] initWithAccount:self];
  [(SSURLConnectionRequest *)v6 setAuthenticationContext:v7];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__SSAccount_getTermsAndConditionsWithBlock___block_invoke;
  v9[3] = &unk_1E5BA9250;
  id v10 = v4;
  id v8 = v4;
  [(SSURLConnectionRequest *)v6 startWithConnectionResponseBlock:v9];
}

void __44__SSAccount_getTermsAndConditionsWithBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7)
  {
    if (v5)
    {
      id v8 = [SSTermsAndConditions alloc];
      id v9 = [v5 bodyData];
      id v12 = v6;
      id v10 = [(SSTermsAndConditions *)v8 initWithResponseData:v9 error:&v12];
      id v11 = v12;

      uint64_t v7 = *(void *)(a1 + 32);
      id v6 = v11;
    }
    else
    {
      id v10 = 0;
    }
    (*(void (**)(uint64_t, SSTermsAndConditions *, id))(v7 + 16))(v7, v10, v6);
  }
}

+ (int64_t)accountKindFromAuthenticationResponseDictionary:(id)a3
{
  id v3 = [a3 valueForKeyPath:@"accountInfo.accountKind"];
  int64_t v4 = (objc_opt_respondsToSelector() & 1) != 0 && [v3 intValue] == 1;

  return v4;
}

+ (id)accountNameFromAuthenticationResponseDictionary:(id)a3
{
  id v3 = [a1 _valueForFirstAvailableKeyPath:&unk_1EF9A9990 inDictionary:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v4 = v3;
  }
  else {
    int64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (void)addAvailableServiceTypes:(int64_t)a3
{
}

- (void)addEnabledServiceTypes:(int64_t)a3
{
}

+ (id)altDSIDFromAuthenticationResponseDictionary:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"altDsPersonId"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v4 = v3;
  }
  else {
    int64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

+ (BOOL)backingAccountIsDemoAccount:(id)a3
{
  return objc_msgSend(a3, "ams_isDemoAccount");
}

+ (id)creditsStringFromAuthenticationResponseDictionary:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"creditDisplay"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v4 = v3;
  }
  else {
    int64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

+ (id)DSIDFromAuthenticationResponseDictionary:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"dsPersonId"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v4 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "longLongValue"));
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

+ (id)firstNameFromAuthenticationResponseDictionary:(id)a3
{
  id v3 = [a3 valueForKeyPath:@"accountInfo.address.firstName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v4 = v3;
  }
  else {
    int64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (void)getITunesMatchStatusWithCompletionBlock:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v5 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v5)
    {
      id v5 = +[SSLogConfig sharedConfig];
    }
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    id v8 = [v5 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      int v9 = v7;
    }
    else {
      int v9 = v7 & 2;
    }
    if (v9)
    {
      int v24 = 136446210;
      uint64_t v25 = "-[SSAccount getITunesMatchStatusWithCompletionBlock:]";
      LODWORD(v21) = 12;
      id v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      id v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v24, v21);
      free(v10);
      SSFileLog(v5, @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  id v17 = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
  xpc_object_t v18 = SSXPCCreateMessageDictionary(130);
  id v19 = [(SSAccount *)self uniqueIdentifier];
  SSXPCDictionarySetObject(v18, "1", v19);

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __53__SSAccount_getITunesMatchStatusWithCompletionBlock___block_invoke;
  v22[3] = &unk_1E5BA92C8;
  id v23 = v4;
  id v20 = v4;
  [(SSXPCConnection *)v17 sendMessage:v18 withReply:v22];
}

void __53__SSAccount_getITunesMatchStatusWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_object_t xdict = v3;
  if (v3 == (id)MEMORY[0x1E4F14520])
  {
    uint64_t v4 = 121;
    goto LABEL_6;
  }
  if (!v3 || MEMORY[0x1A62689E0](v3) != MEMORY[0x1E4F14590])
  {
    uint64_t v4 = 111;
LABEL_6:
    id v5 = SSError(@"SSErrorDomain", v4, 0, 0);
    int64_t int64 = 0;
    goto LABEL_7;
  }
  id v8 = objc_alloc(MEMORY[0x1E4F28C58]);
  int v9 = xpc_dictionary_get_value(xdict, "1");
  id v5 = (void *)[v8 initWithXPCEncoding:v9];

  int64_t int64 = xpc_dictionary_get_int64(xdict, "0");
LABEL_7:
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, int64_t, void *))(v7 + 16))(v7, int64, v5);
  }
}

- (void)getKeybagSyncDataWithType:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    uint64_t v7 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v7)
    {
      uint64_t v7 = +[SSLogConfig sharedConfig];
    }
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    id v10 = [v7 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      int v11 = v9;
    }
    else {
      int v11 = v9 & 2;
    }
    if (v11)
    {
      int v26 = 136446210;
      int v27 = "-[SSAccount getKeybagSyncDataWithType:completionHandler:]";
      LODWORD(v23) = 12;
      uint64_t v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_15:

        goto LABEL_16;
      }
      id v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v26, v23);
      free(v12);
      SSFileLog(v7, @"%@", v13, v14, v15, v16, v17, v18, (uint64_t)v10);
    }

    goto LABEL_15;
  }
LABEL_16:
  xpc_object_t v19 = SSXPCCreateMessageDictionary(139);
  xpc_dictionary_set_int64(v19, "1", a3);
  id v20 = [(SSAccount *)self uniqueIdentifier];
  SSXPCDictionarySetObject(v19, "2", v20);

  uint64_t v21 = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __57__SSAccount_getKeybagSyncDataWithType_completionHandler___block_invoke;
  v24[3] = &unk_1E5BA92C8;
  id v25 = v6;
  id v22 = v6;
  [(SSXPCConnection *)v21 sendMessage:v19 withReply:v24];
}

void __57__SSAccount_getKeybagSyncDataWithType_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    xpc_object_t xdict = v3;
    if (v3 == (id)MEMORY[0x1E4F14520])
    {
      uint64_t v6 = SSError(@"SSErrorDomain", 121, 0, 0);
      uint64_t v8 = 0;
    }
    else
    {
      id v4 = objc_alloc(MEMORY[0x1E4F28C58]);
      id v5 = xpc_dictionary_get_value(xdict, "2");
      uint64_t v6 = [v4 initWithXPCEncoding:v5];

      uint64_t v7 = objc_opt_class();
      uint64_t v8 = SSXPCDictionaryCopyObjectWithClass(xdict, "1", v7);
    }
    if (!(v8 | v6))
    {
      uint64_t v6 = SSError(@"SSErrorDomain", 100, 0, 0);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

    id v3 = xdict;
  }
}

- (id)hashedDescription
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  v21.receiver = self;
  v21.super_class = (Class)SSAccount;
  id v4 = [(SSAccount *)&v21 description];
  id v5 = [v3 stringWithFormat:@"%@:", v4];

  if ([(SSAccount *)self isLocalAccount])
  {
    [v5 appendFormat:@" Local Account"];
  }
  else
  {
    id v20 = [(SSAccount *)self altDSID];
    uint64_t v17 = SSHashIfNeeded(v20);
    xpc_object_t v19 = [(SSAccount *)self uniqueIdentifier];
    uint64_t v18 = [v19 stringValue];
    uint64_t v16 = SSHashIfNeeded(v18);
    uint64_t v6 = [(SSAccount *)self accountName];
    uint64_t v7 = SSHashIfNeeded(v6);
    uint64_t v8 = [(SSAccount *)self backingAccount];
    int v9 = [v8 identifier];
    int64_t v10 = [(SSAccount *)self accountScope];
    if ([(SSAccount *)self isActive]) {
      int v11 = @"YES";
    }
    else {
      int v11 = @"NO";
    }
    if ([(SSAccount *)self isAuthenticated]) {
      uint64_t v12 = @"YES";
    }
    else {
      uint64_t v12 = @"NO";
    }
    [v5 appendFormat:@" altDSID = %@ | DSID = %@ | username = %@ | backingIdentifier = %@ | scope = %ld | active = %@ | authenticated = %@", v17, v16, v7, v9, v10, v11, v12];
  }
  uint64_t v13 = [(SSAccount *)self storeFrontIdentifier];
  uint64_t v14 = SSHashIfNeeded(v13);
  [v5 appendFormat:@" | storefront = %@>", v14];

  return v5;
}

+ (BOOL)isManagedAppleIDFromAuthenticationResponseDictionary:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"isManagedStudent"];
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

+ (BOOL)isNewCustomerFromAuthenticationResponseDictionary:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"newCustomer"];
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

+ (id)lastNameFromAuthenticationResponseDictionary:(id)a3
{
  id v3 = [a3 valueForKeyPath:@"accountInfo.address.lastName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = v3;
  }
  else {
    char v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (NSDictionary)privacyAcknowledgement
{
  return (NSDictionary *)[(SSAccount *)self accountPropertyForKey:@"privacyAcknowledgement"];
}

- (void)removeAvailableServiceTypes:(int64_t)a3
{
}

- (void)removeEnabledServiceTypes:(int64_t)a3
{
}

- (void)resetTransientData
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  [(SSAccount *)self setAuthenticated:0];
  [(SSAccount *)self setPasswordEquivalentToken:0];
  [(SSAccount *)self setRawPassword:0];
  [(SSAccount *)self setSecureToken:0];
  id v3 = +[SSAccountStore defaultStore];
  id v21 = 0;
  char v4 = [v3 saveAccount:self verifyCredentials:0 error:&v21];
  id v5 = v21;

  if ((v4 & 1) == 0)
  {
    uint64_t v6 = +[SSLogConfig sharedAccountsConfig];
    if (!v6)
    {
      uint64_t v6 = +[SSLogConfig sharedConfig];
    }
    int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    int v9 = [v6 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      v8 &= 2u;
    }
    if (v8)
    {
      int64_t v10 = objc_opt_class();
      id v11 = v10;
      uint64_t v12 = [(SSAccount *)self hashedDescription];
      int v22 = 138543874;
      uint64_t v23 = v10;
      __int16 v24 = 2114;
      id v25 = v12;
      __int16 v26 = 2114;
      id v27 = v5;
      LODWORD(v20) = 32;
      uint64_t v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_13:

        goto LABEL_14;
      }
      int v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v22, v20);
      free(v13);
      SSFileLog(v6, @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v9);
    }

    goto LABEL_13;
  }
LABEL_14:
}

+ (id)secureTokenForIdentifier:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 length])
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B5C0], v3);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B850], @"com.apple.itunesstored.token");
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B978], (const void *)*MEMORY[0x1E4F3B988]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BC70], (const void *)*MEMORY[0x1E4F1CFD0]);
    CFTypeRef result = 0;
    uint64_t v5 = SecItemCopyMatching(Mutable, &result);
    uint64_t v6 = (void *)result;
    if (v5 || ![(id)result length])
    {
      int v7 = +[SSLogConfig sharedAccountsAuthenticationConfig];
      if (!v7)
      {
        int v7 = +[SSLogConfig sharedConfig];
      }
      int v8 = [v7 shouldLog];
      if ([v7 shouldLogToDisk]) {
        int v9 = v8 | 2;
      }
      else {
        int v9 = v8;
      }
      int64_t v10 = [v7 OSLogObject];
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        v9 &= 2u;
      }
      if (v9)
      {
        id v11 = objc_opt_class();
        uint64_t v12 = NSNumber;
        id v13 = v11;
        uint64_t v14 = [v12 numberWithInt:v5];
        int v49 = 138543618;
        id v50 = v11;
        __int16 v51 = 2114;
        __int16 v52 = v14;
        LODWORD(v47) = 22;
        uint64_t v15 = (void *)_os_log_send_and_compose_impl();

        if (!v15)
        {
          int v22 = 0;
          goto LABEL_15;
        }
        int64_t v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v49, v47);
        free(v15);
        SSFileLog(v7, @"%@", v16, v17, v18, v19, v20, v21, (uint64_t)v10);
      }
      int v22 = 0;
    }
    else
    {
      int v22 = (void *)[[NSString alloc] initWithData:v6 encoding:4];
      int v7 = +[SSLogConfig sharedAccountsAuthenticationConfig];
      if (!v7)
      {
        int v7 = +[SSLogConfig sharedConfig];
      }
      int v36 = [v7 shouldLog];
      if ([v7 shouldLogToDisk]) {
        int v37 = v36 | 2;
      }
      else {
        int v37 = v36;
      }
      int64_t v10 = [v7 OSLogObject];
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        v37 &= 2u;
      }
      if (v37)
      {
        uint64_t v38 = objc_opt_class();
        int v49 = 138543362;
        id v50 = v38;
        id v39 = v38;
        LODWORD(v47) = 12;
        v40 = (void *)_os_log_send_and_compose_impl();

        if (!v40) {
          goto LABEL_15;
        }
        int64_t v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v40, 4, &v49, v47);
        free(v40);
        SSFileLog(v7, @"%@", v41, v42, v43, v44, v45, v46, (uint64_t)v10);
      }
    }

LABEL_15:
    CFRelease(Mutable);

    goto LABEL_28;
  }
  uint64_t v23 = +[SSLogConfig sharedAccountsAuthenticationConfig];
  if (!v23)
  {
    uint64_t v23 = +[SSLogConfig sharedConfig];
  }
  int v24 = [v23 shouldLog];
  if ([v23 shouldLogToDisk]) {
    int v25 = v24 | 2;
  }
  else {
    int v25 = v24;
  }
  __int16 v26 = [v23 OSLogObject];
  if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
    v25 &= 2u;
  }
  if (!v25) {
    goto LABEL_26;
  }
  int v49 = 138543362;
  id v50 = (id)objc_opt_class();
  id v27 = v50;
  LODWORD(v47) = 12;
  uint64_t v28 = (void *)_os_log_send_and_compose_impl();

  if (v28)
  {
    __int16 v26 = objc_msgSend(NSString, "stringWithCString:encoding:", v28, 4, &v49, v47);
    free(v28);
    SSFileLog(v23, @"%@", v29, v30, v31, v32, v33, v34, (uint64_t)v26);
LABEL_26:
  }
  int v22 = 0;
LABEL_28:

  return v22;
}

- (void)setEligibility:(id)a3 forServiceType:(int64_t)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  int v7 = [(SSAccount *)self backingAccountAccessQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__SSAccount_setEligibility_forServiceType___block_invoke;
  v9[3] = &unk_1E5BA92F0;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a4;
  id v10 = v6;
  id v8 = v6;
  dispatch_barrier_async(v7, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __43__SSAccount_setEligibility_forServiceType___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained _backingAccount];
  id v3 = [v2 accountPropertyForKey:@"eligibleServices"];

  if (v3) {
    id v4 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v3];
  }
  else {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  uint64_t v5 = v4;
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", *(void *)(a1 + 48));
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    [v5 setObject:v7 forKeyedSubscript:v6];
  }
  else {
    [v5 removeObjectForKey:v6];
  }
  if (![v5 count])
  {

    uint64_t v5 = 0;
  }
  id v8 = [WeakRetained _backingAccount];
  [v8 setAccountProperty:v5 forKey:@"eligibleServices"];
}

- (void)setPrivacyAcknowledgement:(id)a3
{
}

+ (id)storeFrontIdentifierFromURLResponse:(id)a3
{
  v12[4] = *MEMORY[0x1E4F143B8];
  v12[0] = @"X-Set-Apple-Store-Front";
  id v4 = a3;
  uint64_t v5 = [@"X-Set-Apple-Store-Front" lowercaseString];
  v12[1] = v5;
  v12[2] = @"X-Apple-Request-Store-Front";
  void v12[3] = @"x-apple-request-store-front";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:4];
  uint64_t v7 = [v4 allHeaderFields];

  id v8 = [a1 _valueForFirstAvailableKeyPath:v6 inDictionary:v7];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v9 = v8;
  }
  else {
    int v9 = 0;
  }
  id v10 = v9;

  return v10;
}

- (id)copyLockdownRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(SSAccount *)self altDSID];
  if (v4) {
    [v3 setObject:v4 forKey:@"AltDSID"];
  }
  uint64_t v5 = [(SSAccount *)self creditsString];

  if (v5) {
    [v3 setObject:v5 forKey:@"CreditDisplayString"];
  }
  id v6 = [(SSAccount *)self uniqueIdentifier];

  if (v6) {
    [v3 setObject:v6 forKey:@"DSPersonID"];
  }
  uint64_t v7 = [(SSAccount *)self accountName];

  if (v7) {
    [v3 setObject:v7 forKey:@"AppleID"];
  }
  id v8 = [(SSAccount *)self ITunesPassSerialNumber];

  if (v8) {
    [v3 setObject:v8 forKey:@"AccountITunesPassSerial"];
  }
  int v9 = [(SSAccount *)self storeFrontIdentifier];

  if (v9) {
    [v3 setObject:v9 forKey:@"AccountStoreFront"];
  }
  id v10 = [(SSAccount *)self firstName];

  if (v10) {
    [v3 setObject:v10 forKey:@"FirstName"];
  }
  id v11 = [(SSAccount *)self lastName];

  if (v11) {
    [v3 setObject:v11 forKey:@"LastName"];
  }
  uint64_t v12 = objc_msgSend(NSNumber, "numberWithInteger:", -[SSAccount accountKind](self, "accountKind"));
  [v3 setObject:v12 forKey:@"AccountKind"];

  if ([(SSAccount *)self accountScope] == 1) {
    id v13 = @"sandbox";
  }
  else {
    id v13 = @"production";
  }
  [v3 setObject:v13 forKey:@"AccountURLBagType"];
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithInteger:", -[SSAccount availableServiceTypes](self, "availableServiceTypes"));
  [v3 setObject:v14 forKey:@"AccountAvailableServiceTypes"];

  uint64_t v15 = objc_msgSend(NSNumber, "numberWithInteger:", -[SSAccount enabledServiceTypes](self, "enabledServiceTypes"));
  [v3 setObject:v15 forKey:@"AccountServiceTypes"];

  uint64_t v16 = objc_msgSend(NSNumber, "numberWithInteger:", -[SSAccount freeDownloadsPasswordSetting](self, "freeDownloadsPasswordSetting"));
  [v3 setObject:v16 forKey:@"AccountFreeDownloadsPasswordSetting"];

  uint64_t v17 = objc_msgSend(NSNumber, "numberWithInteger:", -[SSAccount paidPurchasesPasswordSetting](self, "paidPurchasesPasswordSetting"));
  [v3 setObject:v17 forKey:@"AccountPaidPurchasesPasswordSetting"];

  uint64_t v18 = objc_msgSend(NSNumber, "numberWithBool:", -[SSAccount isNewCustomer](self, "isNewCustomer"));
  [v3 setObject:v18 forKey:@"AccountIsNewCustomer"];

  uint64_t v19 = objc_msgSend(NSNumber, "numberWithBool:", -[SSAccount didFallbackToPassword](self, "didFallbackToPassword"));
  [v3 setObject:v19 forKey:@"DidFallbackToPassword"];

  uint64_t v20 = objc_msgSend(NSNumber, "numberWithBool:", -[SSAccount isSocialEnabled](self, "isSocialEnabled"));
  [v3 setObject:v20 forKey:@"AccountSocialEnabled"];

  if ([(SSAccount *)self accountSource] == 1) {
    uint64_t v21 = @"iTunes";
  }
  else {
    uint64_t v21 = @"device";
  }
  [v3 setObject:v21 forKey:@"AccountSource"];
  int v22 = objc_msgSend(NSNumber, "numberWithBool:", -[SSAccount isManagedAppleID](self, "isManagedAppleID"));
  [v3 setObject:v22 forKey:@"AccountIsManagedAppleID"];

  uint64_t v23 = [(SSAccount *)self backingAccountAccessQueue];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __39__SSAccount_copyLockdownRepresentation__block_invoke;
  v28[3] = &unk_1E5BA7018;
  v28[4] = self;
  id v24 = v3;
  id v29 = v24;
  dispatch_sync(v23, v28);

  int v25 = v29;
  id v26 = v24;

  return v26;
}

void __39__SSAccount_copyLockdownRepresentation__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _backingAccount];
  id v3 = [v2 accountPropertyForKey:@"eligibleServices"];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__SSAccount_copyLockdownRepresentation__block_invoke_2;
  v4[3] = &unk_1E5BA7248;
  id v5 = *(id *)(a1 + 40);
  [v3 enumerateKeysAndObjectsUsingBlock:v4];
}

void __39__SSAccount_copyLockdownRepresentation__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  if ([a3 BOOLValue])
  {
    id v5 = *(void **)(a1 + 32);
    [v7 integerValue];
    id v6 = SSVLockdownAccountServiceEligibilityKey();
    [v5 setObject:MEMORY[0x1E4F1CC38] forKey:v6];
  }
}

- (BOOL)mergeValuesFromAccount:(id)a3
{
  uint64_t v449 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 creditsString];
  v442 = v4;
  if (v5)
  {
    uint64_t v6 = [(SSAccount *)self creditsString];
    if (v5 == (void *)v6)
    {
    }
    else
    {
      id v7 = (void *)v6;
      id v8 = [(SSAccount *)self creditsString];
      char v9 = [v5 isEqual:v8];

      if ((v9 & 1) == 0)
      {
        id v10 = +[SSLogConfig sharedAccountsConfig];
        if (!v10)
        {
          id v10 = +[SSLogConfig sharedConfig];
        }
        int v11 = [v10 shouldLog];
        if ([v10 shouldLogToDisk]) {
          int v12 = v11 | 2;
        }
        else {
          int v12 = v11;
        }
        id v13 = [v10 OSLogObject];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
          int v14 = v12;
        }
        else {
          int v14 = v12 & 2;
        }
        if (v14)
        {
          id v15 = (id)objc_opt_class();
          uint64_t v16 = [(SSAccount *)self accountName];
          SSHashIfNeeded(v16);
          id v17 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v18 = [v4 accountName];
          SSHashIfNeeded(v18);
          id v19 = (id)objc_claimAutoreleasedReturnValue();
          int v443 = 138543874;
          id v444 = v15;
          __int16 v445 = 2114;
          id v446 = v17;
          __int16 v447 = 2114;
          id v448 = v19;
          LODWORD(v440) = 32;
          v421 = &v443;
          uint64_t v20 = (void *)_os_log_send_and_compose_impl();

          id v4 = v442;
          if (!v20)
          {
LABEL_16:

            [(SSAccount *)self setCreditsString:v5];
            BOOL v27 = 1;
            goto LABEL_19;
          }
          id v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v20, 4, &v443, v440);
          free(v20);
          SSFileLog(v10, @"%@", v21, v22, v23, v24, v25, v26, (uint64_t)v13);
        }

        goto LABEL_16;
      }
    }
  }
  BOOL v27 = 0;
LABEL_19:
  uint64_t v28 = objc_msgSend(v4, "uniqueIdentifier", v421);

  if (!v28) {
    goto LABEL_36;
  }
  uint64_t v29 = [(SSAccount *)self uniqueIdentifier];
  if (v28 != (void *)v29)
  {
    uint64_t v30 = (void *)v29;
    uint64_t v31 = [(SSAccount *)self uniqueIdentifier];
    char v32 = [v28 isEqual:v31];

    if (v32) {
      goto LABEL_36;
    }
    uint64_t v33 = +[SSLogConfig sharedAccountsConfig];
    if (!v33)
    {
      uint64_t v33 = +[SSLogConfig sharedConfig];
    }
    int v34 = [v33 shouldLog];
    if ([v33 shouldLogToDisk]) {
      int v35 = v34 | 2;
    }
    else {
      int v35 = v34;
    }
    int v36 = [v33 OSLogObject];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
      int v37 = v35;
    }
    else {
      int v37 = v35 & 2;
    }
    if (v37)
    {
      id v38 = (id)objc_opt_class();
      id v39 = [(SSAccount *)self accountName];
      SSHashIfNeeded(v39);
      id v40 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v41 = [v4 accountName];
      SSHashIfNeeded(v41);
      id v42 = (id)objc_claimAutoreleasedReturnValue();
      int v443 = 138543874;
      id v444 = v38;
      __int16 v445 = 2114;
      id v446 = v40;
      __int16 v447 = 2114;
      id v448 = v42;
      LODWORD(v440) = 32;
      v422 = &v443;
      uint64_t v43 = (void *)_os_log_send_and_compose_impl();

      id v4 = v442;
      if (!v43)
      {
LABEL_34:

        [(SSAccount *)self setUniqueIdentifier:v28];
        BOOL v27 = 1;
        goto LABEL_36;
      }
      int v36 = objc_msgSend(NSString, "stringWithCString:encoding:", v43, 4, &v443, v440);
      free(v43);
      SSFileLog(v33, @"%@", v44, v45, v46, v47, v48, v49, (uint64_t)v36);
    }

    goto LABEL_34;
  }

LABEL_36:
  id v50 = objc_msgSend(v4, "accountName", v422);

  if (!v50) {
    goto LABEL_53;
  }
  uint64_t v51 = [(SSAccount *)self accountName];
  if (v50 != (void *)v51)
  {
    __int16 v52 = (void *)v51;
    uint64_t v53 = [(SSAccount *)self accountName];
    char v54 = [v50 isEqual:v53];

    if (v54) {
      goto LABEL_53;
    }
    uint64_t v55 = +[SSLogConfig sharedAccountsConfig];
    if (!v55)
    {
      uint64_t v55 = +[SSLogConfig sharedConfig];
    }
    int v56 = [v55 shouldLog];
    if ([v55 shouldLogToDisk]) {
      int v57 = v56 | 2;
    }
    else {
      int v57 = v56;
    }
    id v58 = [v55 OSLogObject];
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT)) {
      int v59 = v57;
    }
    else {
      int v59 = v57 & 2;
    }
    if (v59)
    {
      id v60 = (id)objc_opt_class();
      uint64_t v61 = [(SSAccount *)self accountName];
      SSHashIfNeeded(v61);
      id v62 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v63 = [v4 accountName];
      SSHashIfNeeded(v63);
      id v64 = (id)objc_claimAutoreleasedReturnValue();
      int v443 = 138543874;
      id v444 = v60;
      __int16 v445 = 2114;
      id v446 = v62;
      __int16 v447 = 2114;
      id v448 = v64;
      LODWORD(v440) = 32;
      v423 = &v443;
      uint64_t v65 = (void *)_os_log_send_and_compose_impl();

      id v4 = v442;
      if (!v65)
      {
LABEL_51:

        [(SSAccount *)self setAccountName:v50];
        BOOL v27 = 1;
        goto LABEL_53;
      }
      id v58 = objc_msgSend(NSString, "stringWithCString:encoding:", v65, 4, &v443, v440);
      free(v65);
      SSFileLog(v55, @"%@", v66, v67, v68, v69, v70, v71, (uint64_t)v58);
    }

    goto LABEL_51;
  }

LABEL_53:
  v72 = objc_msgSend(v4, "altDSID", v423);

  if (!v72) {
    goto LABEL_70;
  }
  uint64_t v73 = [(SSAccount *)self altDSID];
  if (v72 != (void *)v73)
  {
    v74 = (void *)v73;
    v75 = [(SSAccount *)self altDSID];
    char v76 = [v72 isEqual:v75];

    if (v76) {
      goto LABEL_70;
    }
    v77 = +[SSLogConfig sharedAccountsConfig];
    if (!v77)
    {
      v77 = +[SSLogConfig sharedConfig];
    }
    int v78 = [v77 shouldLog];
    if ([v77 shouldLogToDisk]) {
      int v79 = v78 | 2;
    }
    else {
      int v79 = v78;
    }
    v80 = [v77 OSLogObject];
    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT)) {
      int v81 = v79;
    }
    else {
      int v81 = v79 & 2;
    }
    if (v81)
    {
      id v82 = (id)objc_opt_class();
      v83 = [(SSAccount *)self accountName];
      SSHashIfNeeded(v83);
      id v84 = (id)objc_claimAutoreleasedReturnValue();
      v85 = [v4 accountName];
      SSHashIfNeeded(v85);
      id v86 = (id)objc_claimAutoreleasedReturnValue();
      int v443 = 138543874;
      id v444 = v82;
      __int16 v445 = 2114;
      id v446 = v84;
      __int16 v447 = 2114;
      id v448 = v86;
      LODWORD(v440) = 32;
      v424 = &v443;
      v87 = (void *)_os_log_send_and_compose_impl();

      id v4 = v442;
      if (!v87)
      {
LABEL_68:

        [(SSAccount *)self setAltDSID:v72];
        BOOL v27 = 1;
        goto LABEL_70;
      }
      v80 = objc_msgSend(NSString, "stringWithCString:encoding:", v87, 4, &v443, v440);
      free(v87);
      SSFileLog(v77, @"%@", v88, v89, v90, v91, v92, v93, (uint64_t)v80);
    }

    goto LABEL_68;
  }

LABEL_70:
  v94 = objc_msgSend(v4, "ITunesPassSerialNumber", v424);

  if (!v94) {
    goto LABEL_87;
  }
  uint64_t v95 = [(SSAccount *)self ITunesPassSerialNumber];
  if (v94 != (void *)v95)
  {
    v96 = (void *)v95;
    v97 = [(SSAccount *)self ITunesPassSerialNumber];
    char v98 = [v94 isEqual:v97];

    if (v98) {
      goto LABEL_87;
    }
    v99 = +[SSLogConfig sharedAccountsConfig];
    if (!v99)
    {
      v99 = +[SSLogConfig sharedConfig];
    }
    int v100 = [v99 shouldLog];
    if ([v99 shouldLogToDisk]) {
      int v101 = v100 | 2;
    }
    else {
      int v101 = v100;
    }
    v102 = [v99 OSLogObject];
    if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT)) {
      int v103 = v101;
    }
    else {
      int v103 = v101 & 2;
    }
    if (v103)
    {
      id v104 = (id)objc_opt_class();
      v105 = [(SSAccount *)self accountName];
      SSHashIfNeeded(v105);
      id v106 = (id)objc_claimAutoreleasedReturnValue();
      v107 = [v4 accountName];
      SSHashIfNeeded(v107);
      id v108 = (id)objc_claimAutoreleasedReturnValue();
      int v443 = 138543874;
      id v444 = v104;
      __int16 v445 = 2114;
      id v446 = v106;
      __int16 v447 = 2114;
      id v448 = v108;
      LODWORD(v440) = 32;
      v425 = &v443;
      v109 = (void *)_os_log_send_and_compose_impl();

      id v4 = v442;
      if (!v109)
      {
LABEL_85:

        [(SSAccount *)self setITunesPassSerialNumber:v94];
        BOOL v27 = 1;
        goto LABEL_87;
      }
      v102 = objc_msgSend(NSString, "stringWithCString:encoding:", v109, 4, &v443, v440);
      free(v109);
      SSFileLog(v99, @"%@", v110, v111, v112, v113, v114, v115, (uint64_t)v102);
    }

    goto LABEL_85;
  }

LABEL_87:
  v116 = objc_msgSend(v4, "secureToken", v425);

  if (!v116) {
    goto LABEL_104;
  }
  uint64_t v117 = [(SSAccount *)self secureToken];
  if (v116 != (void *)v117)
  {
    v118 = (void *)v117;
    v119 = [(SSAccount *)self secureToken];
    char v120 = [v116 isEqual:v119];

    if (v120) {
      goto LABEL_104;
    }
    v121 = +[SSLogConfig sharedAccountsConfig];
    if (!v121)
    {
      v121 = +[SSLogConfig sharedConfig];
    }
    int v122 = [v121 shouldLog];
    if ([v121 shouldLogToDisk]) {
      int v123 = v122 | 2;
    }
    else {
      int v123 = v122;
    }
    v124 = [v121 OSLogObject];
    if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT)) {
      int v125 = v123;
    }
    else {
      int v125 = v123 & 2;
    }
    if (v125)
    {
      id v126 = (id)objc_opt_class();
      v127 = [(SSAccount *)self accountName];
      SSHashIfNeeded(v127);
      id v128 = (id)objc_claimAutoreleasedReturnValue();
      v129 = [v4 accountName];
      SSHashIfNeeded(v129);
      id v130 = (id)objc_claimAutoreleasedReturnValue();
      int v443 = 138543874;
      id v444 = v126;
      __int16 v445 = 2114;
      id v446 = v128;
      __int16 v447 = 2114;
      id v448 = v130;
      LODWORD(v440) = 32;
      v426 = &v443;
      v131 = (void *)_os_log_send_and_compose_impl();

      id v4 = v442;
      if (!v131)
      {
LABEL_102:

        [(SSAccount *)self setSecureToken:v116];
        BOOL v27 = 1;
        goto LABEL_104;
      }
      v124 = objc_msgSend(NSString, "stringWithCString:encoding:", v131, 4, &v443, v440);
      free(v131);
      SSFileLog(v121, @"%@", v132, v133, v134, v135, v136, v137, (uint64_t)v124);
    }

    goto LABEL_102;
  }

LABEL_104:
  v138 = objc_msgSend(v4, "storeFrontIdentifier", v426);

  if (!v138) {
    goto LABEL_121;
  }
  uint64_t v139 = [(SSAccount *)self storeFrontIdentifier];
  if (v138 != (void *)v139)
  {
    v140 = (void *)v139;
    v141 = [(SSAccount *)self storeFrontIdentifier];
    char v142 = [v138 isEqual:v141];

    if (v142) {
      goto LABEL_121;
    }
    v143 = +[SSLogConfig sharedAccountsConfig];
    if (!v143)
    {
      v143 = +[SSLogConfig sharedConfig];
    }
    int v144 = [v143 shouldLog];
    if ([v143 shouldLogToDisk]) {
      int v145 = v144 | 2;
    }
    else {
      int v145 = v144;
    }
    v146 = [v143 OSLogObject];
    if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT)) {
      int v147 = v145;
    }
    else {
      int v147 = v145 & 2;
    }
    if (v147)
    {
      id v148 = (id)objc_opt_class();
      v149 = [(SSAccount *)self accountName];
      SSHashIfNeeded(v149);
      id v150 = (id)objc_claimAutoreleasedReturnValue();
      v151 = [v4 accountName];
      SSHashIfNeeded(v151);
      id v152 = (id)objc_claimAutoreleasedReturnValue();
      int v443 = 138543874;
      id v444 = v148;
      __int16 v445 = 2114;
      id v446 = v150;
      __int16 v447 = 2114;
      id v448 = v152;
      LODWORD(v440) = 32;
      v427 = &v443;
      v153 = (void *)_os_log_send_and_compose_impl();

      id v4 = v442;
      if (!v153)
      {
LABEL_119:

        [(SSAccount *)self setStoreFrontIdentifier:v138];
        BOOL v27 = 1;
        goto LABEL_121;
      }
      v146 = objc_msgSend(NSString, "stringWithCString:encoding:", v153, 4, &v443, v440);
      free(v153);
      SSFileLog(v143, @"%@", v154, v155, v156, v157, v158, v159, (uint64_t)v146);
    }

    goto LABEL_119;
  }

LABEL_121:
  v160 = objc_msgSend(v4, "firstName", v427);

  if (!v160) {
    goto LABEL_138;
  }
  uint64_t v161 = [(SSAccount *)self firstName];
  if (v160 != (void *)v161)
  {
    v162 = (void *)v161;
    v163 = [(SSAccount *)self firstName];
    char v164 = [v160 isEqual:v163];

    if (v164) {
      goto LABEL_138;
    }
    v165 = +[SSLogConfig sharedAccountsConfig];
    if (!v165)
    {
      v165 = +[SSLogConfig sharedConfig];
    }
    int v166 = [v165 shouldLog];
    if ([v165 shouldLogToDisk]) {
      int v167 = v166 | 2;
    }
    else {
      int v167 = v166;
    }
    v168 = [v165 OSLogObject];
    if (os_log_type_enabled(v168, OS_LOG_TYPE_DEFAULT)) {
      int v169 = v167;
    }
    else {
      int v169 = v167 & 2;
    }
    if (v169)
    {
      id v170 = (id)objc_opt_class();
      v171 = [(SSAccount *)self accountName];
      SSHashIfNeeded(v171);
      id v172 = (id)objc_claimAutoreleasedReturnValue();
      v173 = [v4 accountName];
      SSHashIfNeeded(v173);
      id v174 = (id)objc_claimAutoreleasedReturnValue();
      int v443 = 138543874;
      id v444 = v170;
      __int16 v445 = 2114;
      id v446 = v172;
      __int16 v447 = 2114;
      id v448 = v174;
      LODWORD(v440) = 32;
      v428 = &v443;
      v175 = (void *)_os_log_send_and_compose_impl();

      id v4 = v442;
      if (!v175)
      {
LABEL_136:

        [(SSAccount *)self setFirstName:v160];
        BOOL v27 = 1;
        goto LABEL_138;
      }
      v168 = objc_msgSend(NSString, "stringWithCString:encoding:", v175, 4, &v443, v440);
      free(v175);
      SSFileLog(v165, @"%@", v176, v177, v178, v179, v180, v181, (uint64_t)v168);
    }

    goto LABEL_136;
  }

LABEL_138:
  v182 = objc_msgSend(v4, "lastName", v428);

  v441 = v182;
  if (!v182) {
    goto LABEL_155;
  }
  uint64_t v183 = [(SSAccount *)self lastName];
  if (v182 == (void *)v183)
  {

    goto LABEL_155;
  }
  v184 = (void *)v183;
  v185 = [(SSAccount *)self lastName];
  char v186 = [v182 isEqual:v185];

  if (v186) {
    goto LABEL_155;
  }
  v187 = +[SSLogConfig sharedAccountsConfig];
  if (!v187)
  {
    v187 = +[SSLogConfig sharedConfig];
  }
  int v188 = [v187 shouldLog];
  if ([v187 shouldLogToDisk]) {
    int v189 = v188 | 2;
  }
  else {
    int v189 = v188;
  }
  v190 = [v187 OSLogObject];
  if (os_log_type_enabled(v190, OS_LOG_TYPE_DEFAULT)) {
    int v191 = v189;
  }
  else {
    int v191 = v189 & 2;
  }
  if (!v191) {
    goto LABEL_153;
  }
  id v192 = (id)objc_opt_class();
  v193 = [(SSAccount *)self accountName];
  SSHashIfNeeded(v193);
  id v194 = (id)objc_claimAutoreleasedReturnValue();
  v195 = [v4 accountName];
  SSHashIfNeeded(v195);
  id v196 = (id)objc_claimAutoreleasedReturnValue();
  int v443 = 138543874;
  id v444 = v192;
  __int16 v445 = 2114;
  id v446 = v194;
  __int16 v447 = 2114;
  id v448 = v196;
  LODWORD(v440) = 32;
  v429 = &v443;
  v197 = (void *)_os_log_send_and_compose_impl();

  id v4 = v442;
  v182 = v441;
  if (v197)
  {
    v190 = objc_msgSend(NSString, "stringWithCString:encoding:", v197, 4, &v443, v440);
    free(v197);
    SSFileLog(v187, @"%@", v198, v199, v200, v201, v202, v203, (uint64_t)v190);
LABEL_153:
  }
  [(SSAccount *)self setLastName:v182];
  BOOL v27 = 1;
LABEL_155:
  if (!objc_msgSend(v4, "isActiveLockerAccount", v429)) {
    goto LABEL_170;
  }
  v204 = +[SSLogConfig sharedAccountsConfig];
  if (!v204)
  {
    v204 = +[SSLogConfig sharedConfig];
  }
  int v205 = [v204 shouldLog];
  if ([v204 shouldLogToDisk]) {
    int v206 = v205 | 2;
  }
  else {
    int v206 = v205;
  }
  v207 = [v204 OSLogObject];
  if (os_log_type_enabled(v207, OS_LOG_TYPE_DEFAULT)) {
    int v208 = v206;
  }
  else {
    int v208 = v206 & 2;
  }
  if (!v208)
  {
    v182 = v441;
    goto LABEL_168;
  }
  id v209 = (id)objc_opt_class();
  v210 = [(SSAccount *)self accountName];
  SSHashIfNeeded(v210);
  id v211 = (id)objc_claimAutoreleasedReturnValue();
  v212 = [v4 accountName];
  SSHashIfNeeded(v212);
  id v213 = (id)objc_claimAutoreleasedReturnValue();
  int v443 = 138543874;
  id v444 = v209;
  __int16 v445 = 2114;
  id v446 = v211;
  __int16 v447 = 2114;
  id v448 = v213;
  LODWORD(v440) = 32;
  v430 = &v443;
  v214 = (void *)_os_log_send_and_compose_impl();

  id v4 = v442;
  v182 = v441;
  if (v214)
  {
    v207 = objc_msgSend(NSString, "stringWithCString:encoding:", v214, 4, &v443, v440);
    free(v214);
    SSFileLog(v204, @"%@", v215, v216, v217, v218, v219, v220, (uint64_t)v207);
LABEL_168:
  }
  BOOL v27 = 1;
  [(SSAccount *)self setActiveLockerAccount:1];
LABEL_170:
  if (v4)
  {
    int64_t v221 = [(SSAccount *)self accountKind];
    if (v221 == [v4 accountKind]) {
      goto LABEL_185;
    }
    v222 = +[SSLogConfig sharedAccountsConfig];
    if (!v222)
    {
      v222 = +[SSLogConfig sharedConfig];
    }
    int v223 = objc_msgSend(v222, "shouldLog", v430);
    if ([v222 shouldLogToDisk]) {
      int v224 = v223 | 2;
    }
    else {
      int v224 = v223;
    }
    v225 = [v222 OSLogObject];
    if (os_log_type_enabled(v225, OS_LOG_TYPE_DEFAULT)) {
      int v226 = v224;
    }
    else {
      int v226 = v224 & 2;
    }
    if (v226)
    {
      id v227 = (id)objc_opt_class();
      v228 = [(SSAccount *)self accountName];
      SSHashIfNeeded(v228);
      id v229 = (id)objc_claimAutoreleasedReturnValue();
      v230 = [v4 accountName];
      SSHashIfNeeded(v230);
      id v231 = (id)objc_claimAutoreleasedReturnValue();
      int v443 = 138543874;
      id v444 = v227;
      __int16 v445 = 2114;
      id v446 = v229;
      __int16 v447 = 2114;
      id v448 = v231;
      LODWORD(v440) = 32;
      v430 = &v443;
      v232 = (void *)_os_log_send_and_compose_impl();

      id v4 = v442;
      if (!v232)
      {
LABEL_184:

        -[SSAccount setAccountKind:](self, "setAccountKind:", [v4 accountKind]);
        BOOL v27 = 1;
LABEL_185:
        int64_t v239 = [(SSAccount *)self accountScope];
        if (v239 == [v4 accountScope]) {
          goto LABEL_199;
        }
        v240 = +[SSLogConfig sharedAccountsConfig];
        if (!v240)
        {
          v240 = +[SSLogConfig sharedConfig];
        }
        int v241 = [v240 shouldLog];
        if ([v240 shouldLogToDisk]) {
          int v242 = v241 | 2;
        }
        else {
          int v242 = v241;
        }
        v243 = [v240 OSLogObject];
        if (os_log_type_enabled(v243, OS_LOG_TYPE_DEFAULT)) {
          int v244 = v242;
        }
        else {
          int v244 = v242 & 2;
        }
        if (v244)
        {
          id v245 = (id)objc_opt_class();
          v246 = [(SSAccount *)self accountName];
          SSHashIfNeeded(v246);
          id v247 = (id)objc_claimAutoreleasedReturnValue();
          v248 = [v4 accountName];
          SSHashIfNeeded(v248);
          id v249 = (id)objc_claimAutoreleasedReturnValue();
          int v443 = 138543874;
          id v444 = v245;
          __int16 v445 = 2114;
          id v446 = v247;
          __int16 v447 = 2114;
          id v448 = v249;
          LODWORD(v440) = 32;
          v431 = &v443;
          v250 = (void *)_os_log_send_and_compose_impl();

          id v4 = v442;
          if (!v250)
          {
LABEL_198:

            -[SSAccount setAccountScope:](self, "setAccountScope:", [v4 accountScope]);
            BOOL v27 = 1;
LABEL_199:
            int64_t v257 = [(SSAccount *)self accountSource];
            if (v257 == [v4 accountSource]) {
              goto LABEL_213;
            }
            v258 = +[SSLogConfig sharedAccountsConfig];
            if (!v258)
            {
              v258 = +[SSLogConfig sharedConfig];
            }
            int v259 = [v258 shouldLog];
            if ([v258 shouldLogToDisk]) {
              int v260 = v259 | 2;
            }
            else {
              int v260 = v259;
            }
            v261 = [v258 OSLogObject];
            if (os_log_type_enabled(v261, OS_LOG_TYPE_DEFAULT)) {
              int v262 = v260;
            }
            else {
              int v262 = v260 & 2;
            }
            if (v262)
            {
              id v263 = (id)objc_opt_class();
              v264 = [(SSAccount *)self accountName];
              SSHashIfNeeded(v264);
              id v265 = (id)objc_claimAutoreleasedReturnValue();
              v266 = [v4 accountName];
              SSHashIfNeeded(v266);
              id v267 = (id)objc_claimAutoreleasedReturnValue();
              int v443 = 138543874;
              id v444 = v263;
              __int16 v445 = 2114;
              id v446 = v265;
              __int16 v447 = 2114;
              id v448 = v267;
              LODWORD(v440) = 32;
              v432 = &v443;
              v268 = (void *)_os_log_send_and_compose_impl();

              id v4 = v442;
              if (!v268)
              {
LABEL_212:

                -[SSAccount setAccountSource:](self, "setAccountSource:", [v4 accountSource]);
                BOOL v27 = 1;
LABEL_213:
                int v275 = [(SSAccount *)self didFallbackToPassword];
                if (v275 == [v4 didFallbackToPassword]) {
                  goto LABEL_227;
                }
                v276 = +[SSLogConfig sharedAccountsConfig];
                if (!v276)
                {
                  v276 = +[SSLogConfig sharedConfig];
                }
                int v277 = [v276 shouldLog];
                if ([v276 shouldLogToDisk]) {
                  int v278 = v277 | 2;
                }
                else {
                  int v278 = v277;
                }
                v279 = [v276 OSLogObject];
                if (os_log_type_enabled(v279, OS_LOG_TYPE_DEFAULT)) {
                  int v280 = v278;
                }
                else {
                  int v280 = v278 & 2;
                }
                if (v280)
                {
                  id v281 = (id)objc_opt_class();
                  v282 = [(SSAccount *)self accountName];
                  SSHashIfNeeded(v282);
                  id v283 = (id)objc_claimAutoreleasedReturnValue();
                  v284 = [v4 accountName];
                  SSHashIfNeeded(v284);
                  id v285 = (id)objc_claimAutoreleasedReturnValue();
                  int v443 = 138543874;
                  id v444 = v281;
                  __int16 v445 = 2114;
                  id v446 = v283;
                  __int16 v447 = 2114;
                  id v448 = v285;
                  LODWORD(v440) = 32;
                  v433 = &v443;
                  v286 = (void *)_os_log_send_and_compose_impl();

                  id v4 = v442;
                  if (!v286)
                  {
LABEL_226:

                    -[SSAccount setDidFallbackToPassword:](self, "setDidFallbackToPassword:", [v4 didFallbackToPassword]);
                    BOOL v27 = 1;
LABEL_227:
                    int64_t v293 = [(SSAccount *)self freeDownloadsPasswordSetting];
                    if (v293 == [v4 freeDownloadsPasswordSetting]) {
                      goto LABEL_241;
                    }
                    v294 = +[SSLogConfig sharedAccountsConfig];
                    if (!v294)
                    {
                      v294 = +[SSLogConfig sharedConfig];
                    }
                    int v295 = [v294 shouldLog];
                    if ([v294 shouldLogToDisk]) {
                      int v296 = v295 | 2;
                    }
                    else {
                      int v296 = v295;
                    }
                    v297 = [v294 OSLogObject];
                    if (os_log_type_enabled(v297, OS_LOG_TYPE_DEFAULT)) {
                      int v298 = v296;
                    }
                    else {
                      int v298 = v296 & 2;
                    }
                    if (v298)
                    {
                      id v299 = (id)objc_opt_class();
                      v300 = [(SSAccount *)self accountName];
                      SSHashIfNeeded(v300);
                      id v301 = (id)objc_claimAutoreleasedReturnValue();
                      v302 = [v4 accountName];
                      SSHashIfNeeded(v302);
                      id v303 = (id)objc_claimAutoreleasedReturnValue();
                      int v443 = 138543874;
                      id v444 = v299;
                      __int16 v445 = 2114;
                      id v446 = v301;
                      __int16 v447 = 2114;
                      id v448 = v303;
                      LODWORD(v440) = 32;
                      v434 = &v443;
                      v304 = (void *)_os_log_send_and_compose_impl();

                      id v4 = v442;
                      if (!v304)
                      {
LABEL_240:

                        -[SSAccount setFreeDownloadsPasswordSetting:](self, "setFreeDownloadsPasswordSetting:", [v4 freeDownloadsPasswordSetting]);
                        BOOL v27 = 1;
LABEL_241:
                        int v311 = [(SSAccount *)self isManagedAppleID];
                        if (v311 == [v4 isManagedAppleID]) {
                          goto LABEL_255;
                        }
                        v312 = +[SSLogConfig sharedAccountsConfig];
                        if (!v312)
                        {
                          v312 = +[SSLogConfig sharedConfig];
                        }
                        int v313 = [v312 shouldLog];
                        if ([v312 shouldLogToDisk]) {
                          int v314 = v313 | 2;
                        }
                        else {
                          int v314 = v313;
                        }
                        v315 = [v312 OSLogObject];
                        if (os_log_type_enabled(v315, OS_LOG_TYPE_DEFAULT)) {
                          int v316 = v314;
                        }
                        else {
                          int v316 = v314 & 2;
                        }
                        if (v316)
                        {
                          id v317 = (id)objc_opt_class();
                          v318 = [(SSAccount *)self accountName];
                          SSHashIfNeeded(v318);
                          id v319 = (id)objc_claimAutoreleasedReturnValue();
                          v320 = [v4 accountName];
                          SSHashIfNeeded(v320);
                          id v321 = (id)objc_claimAutoreleasedReturnValue();
                          int v443 = 138543874;
                          id v444 = v317;
                          __int16 v445 = 2114;
                          id v446 = v319;
                          __int16 v447 = 2114;
                          id v448 = v321;
                          LODWORD(v440) = 32;
                          v435 = &v443;
                          v322 = (void *)_os_log_send_and_compose_impl();

                          id v4 = v442;
                          if (!v322)
                          {
LABEL_254:

                            -[SSAccount setManagedAppleID:](self, "setManagedAppleID:", [v4 isManagedAppleID]);
                            BOOL v27 = 1;
LABEL_255:
                            int v329 = [(SSAccount *)self isNewCustomer];
                            if (v329 == [v4 isNewCustomer]) {
                              goto LABEL_269;
                            }
                            v330 = +[SSLogConfig sharedAccountsConfig];
                            if (!v330)
                            {
                              v330 = +[SSLogConfig sharedConfig];
                            }
                            int v331 = [v330 shouldLog];
                            if ([v330 shouldLogToDisk]) {
                              int v332 = v331 | 2;
                            }
                            else {
                              int v332 = v331;
                            }
                            v333 = [v330 OSLogObject];
                            if (os_log_type_enabled(v333, OS_LOG_TYPE_DEFAULT)) {
                              int v334 = v332;
                            }
                            else {
                              int v334 = v332 & 2;
                            }
                            if (v334)
                            {
                              id v335 = (id)objc_opt_class();
                              v336 = [(SSAccount *)self accountName];
                              SSHashIfNeeded(v336);
                              id v337 = (id)objc_claimAutoreleasedReturnValue();
                              v338 = [v4 accountName];
                              SSHashIfNeeded(v338);
                              id v339 = (id)objc_claimAutoreleasedReturnValue();
                              int v443 = 138543874;
                              id v444 = v335;
                              __int16 v445 = 2114;
                              id v446 = v337;
                              __int16 v447 = 2114;
                              id v448 = v339;
                              LODWORD(v440) = 32;
                              v436 = &v443;
                              v340 = (void *)_os_log_send_and_compose_impl();

                              id v4 = v442;
                              if (!v340)
                              {
LABEL_268:

                                -[SSAccount setNewCustomer:](self, "setNewCustomer:", [v4 isNewCustomer]);
                                BOOL v27 = 1;
LABEL_269:
                                int64_t v347 = [(SSAccount *)self paidPurchasesPasswordSetting];
                                if (v347 == [v4 paidPurchasesPasswordSetting]) {
                                  goto LABEL_283;
                                }
                                v348 = +[SSLogConfig sharedAccountsConfig];
                                if (!v348)
                                {
                                  v348 = +[SSLogConfig sharedConfig];
                                }
                                int v349 = [v348 shouldLog];
                                if ([v348 shouldLogToDisk]) {
                                  int v350 = v349 | 2;
                                }
                                else {
                                  int v350 = v349;
                                }
                                v351 = [v348 OSLogObject];
                                if (os_log_type_enabled(v351, OS_LOG_TYPE_DEFAULT)) {
                                  int v352 = v350;
                                }
                                else {
                                  int v352 = v350 & 2;
                                }
                                if (v352)
                                {
                                  id v353 = (id)objc_opt_class();
                                  v354 = [(SSAccount *)self accountName];
                                  SSHashIfNeeded(v354);
                                  id v355 = (id)objc_claimAutoreleasedReturnValue();
                                  v356 = [v4 accountName];
                                  SSHashIfNeeded(v356);
                                  id v357 = (id)objc_claimAutoreleasedReturnValue();
                                  int v443 = 138543874;
                                  id v444 = v353;
                                  __int16 v445 = 2114;
                                  id v446 = v355;
                                  __int16 v447 = 2114;
                                  id v448 = v357;
                                  LODWORD(v440) = 32;
                                  v437 = &v443;
                                  v358 = (void *)_os_log_send_and_compose_impl();

                                  id v4 = v442;
                                  if (!v358)
                                  {
LABEL_282:

                                    -[SSAccount setPaidPurchasesPasswordSetting:](self, "setPaidPurchasesPasswordSetting:", [v4 paidPurchasesPasswordSetting]);
                                    BOOL v27 = 1;
LABEL_283:
                                    uint64_t v365 = objc_msgSend(v4, "availableServiceTypes", v437);
                                    if (v365 == [(SSAccount *)self availableServiceTypes]) {
                                      goto LABEL_297;
                                    }
                                    v366 = +[SSLogConfig sharedAccountsConfig];
                                    if (!v366)
                                    {
                                      v366 = +[SSLogConfig sharedConfig];
                                    }
                                    int v367 = [v366 shouldLog];
                                    if ([v366 shouldLogToDisk]) {
                                      int v368 = v367 | 2;
                                    }
                                    else {
                                      int v368 = v367;
                                    }
                                    v369 = [v366 OSLogObject];
                                    if (os_log_type_enabled(v369, OS_LOG_TYPE_DEFAULT)) {
                                      int v370 = v368;
                                    }
                                    else {
                                      int v370 = v368 & 2;
                                    }
                                    if (v370)
                                    {
                                      id v371 = (id)objc_opt_class();
                                      v372 = [(SSAccount *)self accountName];
                                      SSHashIfNeeded(v372);
                                      id v373 = (id)objc_claimAutoreleasedReturnValue();
                                      v374 = [v442 accountName];
                                      SSHashIfNeeded(v374);
                                      id v375 = (id)objc_claimAutoreleasedReturnValue();
                                      int v443 = 138543874;
                                      id v444 = v371;
                                      __int16 v445 = 2114;
                                      id v446 = v373;
                                      __int16 v447 = 2114;
                                      id v448 = v375;
                                      LODWORD(v440) = 32;
                                      v438 = &v443;
                                      v376 = (void *)_os_log_send_and_compose_impl();

                                      if (!v376)
                                      {
LABEL_296:

                                        [(SSAccount *)self setAvailableServiceTypes:v365];
                                        BOOL v27 = 1;
                                        id v4 = v442;
LABEL_297:
                                        uint64_t v383 = objc_msgSend(v4, "enabledServiceTypes", v438);
                                        if (v383 == [(SSAccount *)self enabledServiceTypes]) {
                                          goto LABEL_310;
                                        }
                                        v384 = +[SSLogConfig sharedAccountsConfig];
                                        if (!v384)
                                        {
                                          v384 = +[SSLogConfig sharedConfig];
                                        }
                                        int v385 = [v384 shouldLog];
                                        if ([v384 shouldLogToDisk]) {
                                          v385 |= 2u;
                                        }
                                        v386 = [v384 OSLogObject];
                                        if (os_log_type_enabled(v386, OS_LOG_TYPE_DEFAULT)) {
                                          int v387 = v385;
                                        }
                                        else {
                                          int v387 = v385 & 2;
                                        }
                                        if (v387)
                                        {
                                          id v388 = (id)objc_opt_class();
                                          v389 = [(SSAccount *)self accountName];
                                          SSHashIfNeeded(v389);
                                          id v390 = (id)objc_claimAutoreleasedReturnValue();
                                          v391 = [v442 accountName];
                                          SSHashIfNeeded(v391);
                                          id v392 = (id)objc_claimAutoreleasedReturnValue();
                                          int v443 = 138543874;
                                          id v444 = v388;
                                          __int16 v445 = 2114;
                                          id v446 = v390;
                                          __int16 v447 = 2114;
                                          id v448 = v392;
                                          LODWORD(v440) = 32;
                                          v439 = &v443;
                                          v393 = (void *)_os_log_send_and_compose_impl();

                                          if (!v393)
                                          {
LABEL_309:

                                            [(SSAccount *)self setEnabledServiceTypes:v383];
                                            BOOL v27 = 1;
                                            id v4 = v442;
LABEL_310:
                                            v400 = objc_msgSend(v4, "eligibilityForService:", 0, v439);
                                            int v401 = [v400 BOOLValue];
                                            v402 = [(SSAccount *)self eligibilityForService:0];
                                            int v403 = [v402 BOOLValue];

                                            v182 = v441;
                                            if (v401 == v403)
                                            {
LABEL_323:

                                              goto LABEL_324;
                                            }
                                            v404 = +[SSLogConfig sharedAccountsConfig];
                                            if (!v404)
                                            {
                                              v404 = +[SSLogConfig sharedConfig];
                                            }
                                            int v405 = [v404 shouldLog];
                                            if ([v404 shouldLogToDisk]) {
                                              v405 |= 2u;
                                            }
                                            v406 = [v404 OSLogObject];
                                            if (os_log_type_enabled(v406, OS_LOG_TYPE_DEFAULT)) {
                                              int v407 = v405;
                                            }
                                            else {
                                              int v407 = v405 & 2;
                                            }
                                            if (v407)
                                            {
                                              id v408 = (id)objc_opt_class();
                                              v409 = [(SSAccount *)self accountName];
                                              SSHashIfNeeded(v409);
                                              id v410 = (id)objc_claimAutoreleasedReturnValue();
                                              v411 = [v442 accountName];
                                              SSHashIfNeeded(v411);
                                              id v412 = (id)objc_claimAutoreleasedReturnValue();
                                              int v443 = 138543874;
                                              id v444 = v408;
                                              __int16 v445 = 2114;
                                              id v446 = v410;
                                              __int16 v447 = 2114;
                                              id v448 = v412;
                                              LODWORD(v440) = 32;
                                              v413 = (void *)_os_log_send_and_compose_impl();

                                              v182 = v441;
                                              if (!v413)
                                              {
LABEL_322:

                                                [(SSAccount *)self setEligibility:v400 forServiceType:0];
                                                BOOL v27 = 1;
                                                id v4 = v442;
                                                goto LABEL_323;
                                              }
                                              v406 = objc_msgSend(NSString, "stringWithCString:encoding:", v413, 4, &v443, v440);
                                              free(v413);
                                              SSFileLog(v404, @"%@", v414, v415, v416, v417, v418, v419, (uint64_t)v406);
                                            }

                                            goto LABEL_322;
                                          }
                                          v386 = objc_msgSend(NSString, "stringWithCString:encoding:", v393, 4, &v443, v440);
                                          free(v393);
                                          SSFileLog(v384, @"%@", v394, v395, v396, v397, v398, v399, (uint64_t)v386);
                                        }

                                        goto LABEL_309;
                                      }
                                      v369 = objc_msgSend(NSString, "stringWithCString:encoding:", v376, 4, &v443, v440);
                                      free(v376);
                                      SSFileLog(v366, @"%@", v377, v378, v379, v380, v381, v382, (uint64_t)v369);
                                    }

                                    goto LABEL_296;
                                  }
                                  v351 = objc_msgSend(NSString, "stringWithCString:encoding:", v358, 4, &v443, v440);
                                  free(v358);
                                  SSFileLog(v348, @"%@", v359, v360, v361, v362, v363, v364, (uint64_t)v351);
                                }

                                goto LABEL_282;
                              }
                              v333 = objc_msgSend(NSString, "stringWithCString:encoding:", v340, 4, &v443, v440);
                              free(v340);
                              SSFileLog(v330, @"%@", v341, v342, v343, v344, v345, v346, (uint64_t)v333);
                            }

                            goto LABEL_268;
                          }
                          v315 = objc_msgSend(NSString, "stringWithCString:encoding:", v322, 4, &v443, v440);
                          free(v322);
                          SSFileLog(v312, @"%@", v323, v324, v325, v326, v327, v328, (uint64_t)v315);
                        }

                        goto LABEL_254;
                      }
                      v297 = objc_msgSend(NSString, "stringWithCString:encoding:", v304, 4, &v443, v440);
                      free(v304);
                      SSFileLog(v294, @"%@", v305, v306, v307, v308, v309, v310, (uint64_t)v297);
                    }

                    goto LABEL_240;
                  }
                  v279 = objc_msgSend(NSString, "stringWithCString:encoding:", v286, 4, &v443, v440);
                  free(v286);
                  SSFileLog(v276, @"%@", v287, v288, v289, v290, v291, v292, (uint64_t)v279);
                }

                goto LABEL_226;
              }
              v261 = objc_msgSend(NSString, "stringWithCString:encoding:", v268, 4, &v443, v440);
              free(v268);
              SSFileLog(v258, @"%@", v269, v270, v271, v272, v273, v274, (uint64_t)v261);
            }

            goto LABEL_212;
          }
          v243 = objc_msgSend(NSString, "stringWithCString:encoding:", v250, 4, &v443, v440);
          free(v250);
          SSFileLog(v240, @"%@", v251, v252, v253, v254, v255, v256, (uint64_t)v243);
        }

        goto LABEL_198;
      }
      v225 = objc_msgSend(NSString, "stringWithCString:encoding:", v232, 4, &v443, v440);
      free(v232);
      SSFileLog(v222, @"%@", v233, v234, v235, v236, v237, v238, (uint64_t)v225);
    }

    goto LABEL_184;
  }
LABEL_324:

  return v27;
}

- (id)popBiometricToken
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__15;
  int v11 = __Block_byref_object_dispose__15;
  id v12 = 0;
  id v3 = [(SSAccount *)self backingAccountAccessQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __30__SSAccount_popBiometricToken__block_invoke;
  v6[3] = &unk_1E5BA6F30;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __30__SSAccount_popBiometricToken__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 16));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;
}

- (void)setBiometricToken:(id)a3
{
  id v4 = a3;
  id v5 = [(SSAccount *)self backingAccountAccessQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__SSAccount_setBiometricToken___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(v5, v7);
}

void __31__SSAccount_setBiometricToken___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v5 = *(void **)(v2 + 16);
  id v4 = (id *)(v2 + 16);
  if (v5 != v3) {
    objc_storeStrong(v4, v3);
  }
}

- (void)setLockdownDictionary:(id)a3
{
  id v25 = a3;
  id v4 = [v25 objectForKey:@"AltDSID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SSAccount *)self setAltDSID:v4];
  }
  id v5 = [v25 objectForKey:@"DSPersonID"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SSAccount *)self setUniqueIdentifier:v5];
  }
  id v6 = [v25 objectForKey:@"AppleID"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SSAccount *)self setAccountName:v6];
  }
  uint64_t v7 = [v25 objectForKey:@"AccountKind"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    -[SSAccount setAccountKind:](self, "setAccountKind:", [v7 integerValue]);
  }
  id v8 = [v25 objectForKey:@"CreditDisplayString"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SSAccount *)self setCreditsString:v8];
  }
  uint64_t v9 = [v25 objectForKey:@"AccountURLBagType"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    -[SSAccount setAccountScope:](self, "setAccountScope:", [v9 isEqualToString:@"sandbox"]);
  }
  id v10 = [v25 objectForKey:@"AccountAvailableServiceTypes"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    -[SSAccount setAvailableServiceTypes:](self, "setAvailableServiceTypes:", [v10 integerValue]);
  }
  int v11 = [v25 objectForKey:@"AccountServiceTypes"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    -[SSAccount setEnabledServiceTypes:](self, "setEnabledServiceTypes:", [v11 integerValue]);
  }
  else
  {
    id v12 = [v25 objectForKey:@"AccountSocialEnabled"];

    if (objc_opt_respondsToSelector()) {
      -[SSAccount setSocialEnabled:](self, "setSocialEnabled:", [v12 BOOLValue]);
    }
    int v11 = v12;
  }
  id v13 = [v25 objectForKey:@"DidFallbackToPassword"];

  if (objc_opt_respondsToSelector()) {
    -[SSAccount setDidFallbackToPassword:](self, "setDidFallbackToPassword:", [v13 BOOLValue]);
  }
  int v14 = [v25 objectForKey:@"AccountIsNewCustomer"];

  if (objc_opt_respondsToSelector()) {
    -[SSAccount setNewCustomer:](self, "setNewCustomer:", [v14 BOOLValue]);
  }
  id v15 = [v25 objectForKey:@"AccountSource"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    -[SSAccount setAccountSource:](self, "setAccountSource:", [v15 isEqualToString:@"iTunes"]);
  }
  uint64_t v16 = [v25 objectForKey:@"AccountStoreFront"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SSAccount *)self setStoreFrontIdentifier:v16];
  }
  id v17 = [v25 objectForKey:@"AccountITunesPassSerial"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SSAccount *)self setITunesPassSerialNumber:v17];
  }
  uint64_t v18 = [v25 objectForKey:@"FirstName"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SSAccount *)self setFirstName:v18];
  }
  id v19 = [v25 objectForKey:@"LastName"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SSAccount *)self setLastName:v19];
  }
  uint64_t v20 = SSVLockdownAccountServiceEligibilityKey();
  uint64_t v21 = [v25 objectForKey:v20];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SSAccount *)self setEligibility:v21 forServiceType:0];
  }
  uint64_t v22 = [v25 objectForKey:@"AccountFreeDownloadsPasswordSetting"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    -[SSAccount setFreeDownloadsPasswordSetting:](self, "setFreeDownloadsPasswordSetting:", [v22 integerValue]);
  }
  uint64_t v23 = [v25 objectForKey:@"AccountPaidPurchasesPasswordSetting"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    -[SSAccount setPaidPurchasesPasswordSetting:](self, "setPaidPurchasesPasswordSetting:", [v23 integerValue]);
  }
  uint64_t v24 = [v25 objectForKey:@"AccountIsManagedAppleID"];

  if (objc_opt_respondsToSelector()) {
    -[SSAccount setManagedAppleID:](self, "setManagedAppleID:", [v24 BOOLValue]);
  }
}

+ (id)serverValueForAccountPasswordSettingValue:(int64_t)a3
{
  id v3 = @"always";
  if (a3 == 2) {
    id v3 = @"sometimes";
  }
  if (a3 == 3) {
    return @"never";
  }
  else {
    return v3;
  }
}

- (void)updateAccountPasswordSettings:(id)a3
{
}

- (void)updateAccountPasswordSettingsWithRequestProperties:(id)a3 completionBlock:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v8 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v8)
    {
      id v8 = +[SSLogConfig sharedConfig];
    }
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    int v11 = [v8 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      int v12 = v10;
    }
    else {
      int v12 = v10 & 2;
    }
    if (v12)
    {
      int v29 = 136446210;
      uint64_t v30 = "-[SSAccount updateAccountPasswordSettingsWithRequestProperties:completionBlock:]";
      LODWORD(v26) = 12;
      id v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_15:

        goto LABEL_16;
      }
      int v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v29, v26);
      free(v13);
      SSFileLog(v8, @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    }

    goto LABEL_15;
  }
LABEL_16:
  if ((SSIsDaemon() & 1) == 0)
  {
    xpc_object_t v20 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v20, "0", 151);
    uint64_t v21 = [(SSAccount *)self uniqueIdentifier];
    SSXPCDictionarySetObject(v20, "1", v21);

    uint64_t v22 = objc_msgSend(NSNumber, "numberWithInt:", -[SSAccount freeDownloadsPasswordSetting](self, "freeDownloadsPasswordSetting"));
    SSXPCDictionarySetObject(v20, "2", v22);

    uint64_t v23 = objc_msgSend(NSNumber, "numberWithInt:", -[SSAccount paidPurchasesPasswordSetting](self, "paidPurchasesPasswordSetting"));
    SSXPCDictionarySetObject(v20, "3", v23);

    if (v6)
    {
      uint64_t v24 = (void *)[v6 copyXPCEncoding];
      if (v24) {
        xpc_dictionary_set_value(v20, "4", v24);
      }
    }
    id v25 = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __80__SSAccount_updateAccountPasswordSettingsWithRequestProperties_completionBlock___block_invoke;
    v27[3] = &unk_1E5BA92C8;
    id v28 = v7;
    [(SSXPCConnection *)v25 sendMessage:v20 withReply:v27];
  }
}

void __80__SSAccount_updateAccountPasswordSettingsWithRequestProperties_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3 == (id)MEMORY[0x1E4F14520])
  {
    uint64_t v5 = 121;
  }
  else
  {
    if (v3 && MEMORY[0x1A62689E0](v3) == MEMORY[0x1E4F14590])
    {
      id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
      int v11 = xpc_dictionary_get_value(v4, "2");
      id v6 = (void *)[v10 initWithXPCEncoding:v11];

      goto LABEL_7;
    }
    uint64_t v5 = 111;
  }
  id v6 = SSError(@"SSErrorDomain", v5, 0, 0);
LABEL_7:
  id v7 = dispatch_get_global_queue(0, 0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__SSAccount_updateAccountPasswordSettingsWithRequestProperties_completionBlock___block_invoke_2;
  void v12[3] = &unk_1E5BA7328;
  id v8 = *(id *)(a1 + 32);
  id v13 = v6;
  id v14 = v8;
  id v9 = v6;
  dispatch_async(v7, v12);
}

uint64_t __80__SSAccount_updateAccountPasswordSettingsWithRequestProperties_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_addAccountPropertyBitmask:(int64_t)a3 forKey:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  id v7 = [(SSAccount *)self backingAccountAccessQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__SSAccount__addAccountPropertyBitmask_forKey___block_invoke;
  v9[3] = &unk_1E5BA92F0;
  objc_copyWeak(v11, &location);
  id v10 = v6;
  v11[1] = (id)a3;
  id v8 = v6;
  dispatch_barrier_async(v7, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __47__SSAccount__addAccountPropertyBitmask_forKey___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained _backingAccount];
  id v3 = [v2 accountPropertyForKey:*(void *)(a1 + 32)];
  uint64_t v4 = [v3 integerValue];

  if (v4 != (*(void *)(a1 + 48) | v4))
  {
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v2 setAccountProperty:v5 forKey:*(void *)(a1 + 32)];
  }
}

+ (id)_countryCodeFromStorefrontIdentifier:(id)a3
{
  id v3 = [a3 componentsSeparatedByString:@","];
  uint64_t v4 = [v3 firstObject];

  uint64_t v5 = [v4 componentsSeparatedByString:@"-"];
  id v6 = [v5 firstObject];

  return v6;
}

+ (id)_displayedServerPromptKeyWithIdentifier:(id)a3
{
  return (id)[NSString stringWithFormat:@"displayedServerPrompt-%@", a3];
}

+ (id)_lastAttemptForServerPromptKeyWithIdentifier:(id)a3
{
  return (id)[NSString stringWithFormat:@"lastAttemptForServerPrompt-%@", a3];
}

- (void)_removeAccountPropertyBitmask:(int64_t)a3 forKey:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  id v7 = [(SSAccount *)self backingAccountAccessQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__SSAccount__removeAccountPropertyBitmask_forKey___block_invoke;
  v9[3] = &unk_1E5BA92F0;
  objc_copyWeak(v11, &location);
  id v10 = v6;
  v11[1] = (id)a3;
  id v8 = v6;
  dispatch_barrier_async(v7, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __50__SSAccount__removeAccountPropertyBitmask_forKey___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained _backingAccount];
  id v3 = [v2 accountPropertyForKey:*(void *)(a1 + 32)];
  uint64_t v4 = [v3 integerValue];

  if (v4 != (v4 & ~*(void *)(a1 + 48)))
  {
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v2 setAccountProperty:v5 forKey:*(void *)(a1 + 32)];
  }
}

- (void)_sendMessage:(id)a3 withReply:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __36__SSAccount__sendMessage_withReply___block_invoke;
  v9[3] = &unk_1E5BA92C8;
  id v10 = v5;
  id v8 = v5;
  [(SSXPCConnection *)v7 sendMessage:v6 withReply:v9];
}

void __36__SSAccount__sendMessage_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (v3 == (id)MEMORY[0x1E4F14520])
  {
    uint64_t v4 = 121;
    goto LABEL_6;
  }
  if (!v3 || MEMORY[0x1A62689E0](v3) != MEMORY[0x1E4F14590])
  {
    uint64_t v4 = 111;
LABEL_6:
    id v5 = SSError(@"SSErrorDomain", v4, 0, 0);
    id v6 = 0;
    goto LABEL_7;
  }
  id v6 = v7;
  id v5 = 0;
LABEL_7:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_setAccountProperty:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(SSAccount *)self backingAccountAccessQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  id v11[2] = __40__SSAccount__setAccountProperty_forKey___block_invoke;
  v11[3] = &unk_1E5BA9318;
  objc_copyWeak(&v14, &location);
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_barrier_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __40__SSAccount__setAccountProperty_forKey___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained _backingAccount];
  id v3 = [v2 accountPropertyForKey:*(void *)(a1 + 32)];
  char v4 = [v3 isEqual:*(void *)(a1 + 40)];

  if ((v4 & 1) == 0)
  {
    id v5 = [WeakRetained _backingAccount];
    [v5 setAccountProperty:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  }
}

- (void)_setBackingAccount:(id)a3
{
  char v4 = (ACAccount *)a3;
  id v5 = [(SSAccount *)self backingAccountAccessQueue];
  dispatch_assert_queue_V2(v5);

  backingAccount = self->_backingAccount;
  self->_backingAccount = v4;
}

+ (id)_valueForFirstAvailableKeyPath:(id)a3 inDictionary:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = objc_msgSend(v6, "valueForKeyPath:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        if (v12)
        {
          id v13 = (void *)v12;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  id v13 = 0;
LABEL_11:

  return v13;
}

- (void)setBackingAccountAccessQueue:(id)a3
{
}

@end