@interface FCAppleAccount
+ (id)sharedAccount;
+ (void)enableStoreFrontLocking;
- (ACAccount)activeiTunesAccount;
- (BOOL)isContentStoreFrontSupported;
- (BOOL)isFamilyEligible;
- (BOOL)isFamilySuspended;
- (BOOL)isPrimaryAccountEmailAddress;
- (BOOL)isPrivateDataSyncingEnabled;
- (BOOL)isRunningPPT;
- (BOOL)isSignedInStoreFrontSupported;
- (BOOL)isSuspended;
- (BOOL)isUserSignedInToiCloud;
- (BOOL)isUserSignedIntoiTunes;
- (BOOL)isiCloudSuspended;
- (FCAppleAccount)init;
- (NSArray)allEmailAddresses;
- (NSString)DSID;
- (NSString)altDSID;
- (NSString)appStoreEmailAddress;
- (NSString)contentStoreFrontID;
- (NSString)endpointConnectionClientID;
- (NSString)firstName;
- (NSString)formattedUsername;
- (NSString)fullName;
- (NSString)lastName;
- (NSString)middleName;
- (NSString)normalizedPersonId;
- (NSString)personID;
- (NSString)primaryEmailAddress;
- (NSString)primaryLanguageCode;
- (NSString)supportedContentStoreFrontID;
- (NSString)userStoreFrontID;
- (NSString)username;
- (__CFString)dynamicPrimaryLanguageCode;
- (id)currentStoreFrontID;
- (id)getGSToken;
- (id)getNewGSTokenPromise;
- (id)iCloudAccountDSID;
- (id)iTunesAccountDSID;
- (id)iTunesAccountName;
- (int64_t)ageCategory;
- (int64_t)dynamicSupportedContentLanguage;
- (int64_t)supportedContentLanguage;
- (void)_accountStoreDidChange;
- (void)_reloadAccountsFromAccountStore;
- (void)_setStoreFrontDependentPropertiesWithStoreFrontLockingEnabled:(void *)a1;
- (void)addObserver:(id)a3;
- (void)checkAllDevicesRunningMinimumiOSVersion:(id)a3 macOSVersion:(id)a4 orInactiveForTimeInterval:(double)a5 completionHandler:(id)a6;
- (void)checkAlliOSDevicesRunningMinimumOSVersion:(id)a3 orInactiveForTimeInterval:(double)a4 completionHandler:(id)a5;
- (void)fetchMinimumDeviceVersionsActiveSinceInterval:(double)a3 completionHandler:(id)a4;
- (void)getGSTokenWithCompletionHandler:(id)a3;
- (void)invalidateGSTokenCache;
- (void)loadStoreFrontWithCompletionHandler:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setContentStoreFrontID:(id)a3;
- (void)setDSID:(id)a3;
- (void)setRunningPPT:(BOOL)a3;
- (void)setUserStoreFrontID:(id)a3;
- (void)t_startOverridingContentStoreFrontID:(id)a3;
- (void)t_stopOverridingContentStoreFrontID;
@end

@implementation FCAppleAccount

- (BOOL)isPrivateDataSyncingEnabled
{
  if ([(FCAppleAccount *)self isRunningPPT]) {
    return 0;
  }
  if (self) {
    id Property = objc_getProperty(self, v3, 24, 1);
  }
  else {
    id Property = 0;
  }
  uint64_t v6 = *MEMORY[0x1E4F17AF8];
  return [Property isEnabledForDataclass:v6];
}

- (BOOL)isRunningPPT
{
  return self->_runningPPT;
}

uint64_t __44__FCAppleAccount_dynamicPrimaryLanguageCode__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = a2;
  if (v2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__FCAppleAccount_supportedLanguageCodes__block_invoke;
    block[3] = &unk_1E5B4C018;
    block[4] = v2;
    if (qword_1EB5D1A50 != -1) {
      dispatch_once(&qword_1EB5D1A50, block);
    }
    id v2 = (id)qword_1EB5D1A48;
  }
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (BOOL)isFamilySuspended
{
  if (self) {
    self = (FCAppleAccount *)objc_getProperty(self, a2, 24, 1);
  }
  id v2 = [(FCAppleAccount *)self aa_suspensionInfo];
  char v3 = [v2 isFamilySuspended];

  return v3;
}

- (BOOL)isiCloudSuspended
{
  if (self) {
    self = (FCAppleAccount *)objc_getProperty(self, a2, 24, 1);
  }
  id v2 = [(FCAppleAccount *)self aa_suspensionInfo];
  char v3 = [v2 isiCloudSuspended];

  return v3;
}

void __40__FCAppleAccount_supportedLanguageCodes__block_invoke(uint64_t a1)
{
  char v3 = [*(id *)(a1 + 32) contentStoreFrontID];
  if ([v3 isEqualToString:@"143455"]) {
    objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"en", @"fr", 0);
  }
  else {
  uint64_t v1 = [MEMORY[0x1E4F1CAD0] setWithObject:@"en"];
  }
  id v2 = (void *)qword_1EB5D1A48;
  qword_1EB5D1A48 = v1;
}

- (NSString)normalizedPersonId
{
  if (self) {
    self = (FCAppleAccount *)objc_getProperty(self, a2, 24, 1);
  }
  id v2 = [(FCAppleAccount *)self aa_normalizedPersonID];
  char v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (NSString)middleName
{
  if (self) {
    self = (FCAppleAccount *)objc_getProperty(self, a2, 24, 1);
  }
  id v2 = [(FCAppleAccount *)self aa_middleName];
  char v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (NSString)lastName
{
  if (self) {
    self = (FCAppleAccount *)objc_getProperty(self, a2, 24, 1);
  }
  id v2 = [(FCAppleAccount *)self aa_lastName];
  char v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (NSString)fullName
{
  if (self) {
    self = (FCAppleAccount *)objc_getProperty(self, a2, 24, 1);
  }
  id v2 = [(FCAppleAccount *)self aa_fullName];
  char v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (NSString)formattedUsername
{
  if (self) {
    self = (FCAppleAccount *)objc_getProperty(self, a2, 24, 1);
  }
  id v2 = [(FCAppleAccount *)self aa_formattedUsername];
  char v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (NSString)firstName
{
  if (self) {
    self = (FCAppleAccount *)objc_getProperty(self, a2, 24, 1);
  }
  id v2 = [(FCAppleAccount *)self aa_firstName];
  char v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (BOOL)isSuspended
{
  if (self)
  {
    self = (FCAppleAccount *)objc_getProperty(self, a2, 24, 1);
    uint64_t v2 = vars8;
  }
  return [(FCAppleAccount *)self aa_isSuspended];
}

- (BOOL)isFamilyEligible
{
  if (self)
  {
    self = (FCAppleAccount *)objc_getProperty(self, a2, 24, 1);
    uint64_t v2 = vars8;
  }
  return [(FCAppleAccount *)self aa_isFamilyEligible];
}

- (int64_t)ageCategory
{
  if (self)
  {
    self = (FCAppleAccount *)objc_getProperty(self, a2, 24, 1);
    uint64_t v2 = vars8;
  }
  return [(FCAppleAccount *)self aa_ageCategory];
}

+ (id)sharedAccount
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__FCAppleAccount_sharedAccount__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_209 != -1) {
    dispatch_once(&_MergedGlobals_209, block);
  }
  uint64_t v2 = (void *)qword_1EB5D1A40;
  return v2;
}

- (NSString)primaryLanguageCode
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__FCAppleAccount_primaryLanguageCode__block_invoke;
  block[3] = &unk_1E5B4C018;
  block[4] = self;
  if (qword_1EB5D1A60 != -1) {
    dispatch_once(&qword_1EB5D1A60, block);
  }
  return (NSString *)(id)qword_1EB5D1A58;
}

- (BOOL)isContentStoreFrontSupported
{
  uint64_t v2 = [(FCAppleAccount *)self contentStoreFrontID];
  if (v2)
  {
    char v3 = FCSupportedStoreFrontIDs();
    char v4 = [v3 containsObject:v2];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (NSString)contentStoreFrontID
{
  if (!self
    || (p_contentStoreFrontID = &self->_overrideContentStoreFrontID,
        (char v4 = self->_overrideContentStoreFrontID) == 0)
    || (v5 = v4, Class v6 = NSClassFromString(&cfstr_Xctest.isa), v5, !v6))
  {
    p_contentStoreFrontID = &self->_contentStoreFrontID;
  }
  v7 = *p_contentStoreFrontID;
  if (!v7)
  {
    v8 = FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_1A460D000, v8, OS_LOG_TYPE_ERROR, "Received nil storeFront ID. Falling back to U.S.", v10, 2u);
    }
    v7 = @"143441";
  }
  return (NSString *)v7;
}

- (NSString)endpointConnectionClientID
{
  uint64_t v2 = NewsCoreSensitiveUserDefaults();
  char v3 = [v2 stringForKey:@"report_concern_user_id"];

  if (!v3)
  {
    char v4 = [MEMORY[0x1E4F29128] UUID];
    char v3 = [v4 UUIDString];

    v5 = NewsCoreSensitiveUserDefaults();
    [v5 setValue:v3 forKey:@"report_concern_user_id"];
  }
  return (NSString *)v3;
}

- (BOOL)isUserSignedInToiCloud
{
  if (self) {
    self = (FCAppleAccount *)objc_getProperty(self, a2, 24, 1);
  }
  return self != 0;
}

uint64_t __50__FCAppleAccount_getGSTokenWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __48__FCAppleAccount_notifyObserversOfAccountChange__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    uint64_t v2 = *(void **)(v1 + 56);
  }
  else {
    uint64_t v2 = 0;
  }
  char v3 = objc_msgSend(v2, "copy", (void)v8);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * i) appleAccountChanged];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)getGSTokenWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FCAppleAccount *)self getGSToken];
  uint64_t v6 = zalgo();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__FCAppleAccount_getGSTokenWithCompletionHandler___block_invoke;
  v13[3] = &unk_1E5B59C48;
  id v7 = v4;
  id v14 = v7;
  id v8 = (id)[v5 thenOn:v6 then:v13];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__FCAppleAccount_getGSTokenWithCompletionHandler___block_invoke_2;
  v11[3] = &unk_1E5B4EF68;
  id v12 = v7;
  id v9 = v7;
  id v10 = (id)[v5 error:v11];
}

- (id)getGSToken
{
  base64GSTokenPromise = self->_base64GSTokenPromise;
  if (!base64GSTokenPromise)
  {
    -[FCAppleAccount getNewGSTokenPromise](self);
    id v4 = (NFPromise *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = self->_base64GSTokenPromise;
    self->_base64GSTokenPromise = v4;

    base64GSTokenPromise = self->_base64GSTokenPromise;
  }
  return base64GSTokenPromise;
}

- (void)addObserver:(id)a3
{
  if (self) {
    self = (FCAppleAccount *)self->_observers;
  }
  [(FCAppleAccount *)self addObject:a3];
}

- (id)iTunesAccountName
{
  uint64_t v2 = self;
  if (self) {
    self = (FCAppleAccount *)objc_getProperty(self, a2, 32, 1);
  }
  char v3 = [(FCAppleAccount *)self username];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    if (v2) {
      id Property = objc_getProperty(v2, v5, 32, 1);
    }
    else {
      id Property = 0;
    }
    id v7 = [Property username];
    id v8 = (void *)[v7 copy];
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (BOOL)isPrimaryAccountEmailAddress
{
  if (self) {
    self = (FCAppleAccount *)objc_getProperty(self, a2, 24, 1);
  }
  uint64_t v2 = [(FCAppleAccount *)self username];
  char v3 = objc_msgSend(v2, "ea_isLegalEmailAddress");

  return v3;
}

- (NSString)username
{
  if (self) {
    self = (FCAppleAccount *)objc_getProperty(self, a2, 24, 1);
  }
  uint64_t v2 = [(FCAppleAccount *)self username];
  char v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (id)getNewGSTokenPromise
{
  if (a1)
  {
    uint64_t v2 = a1;
    id v3 = objc_alloc(MEMORY[0x1E4F81BF0]);
    var38[0] = MEMORY[0x1E4F143A8];
    var38[1] = 3221225472;
    var38[2] = __38__FCAppleAccount_getNewGSTokenPromise__block_invoke;
    var38[3] = &unk_1E5B4EEF0;
    var38[4] = v2;
    a1 = (void *)[v3 initWithResolver:var38];
    uint64_t v1 = var38[8];
  }
  return a1;
}

- (void)_setStoreFrontDependentPropertiesWithStoreFrontLockingEnabled:(void *)a1
{
  NewsCoreUserDefaults();
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v18 stringForKey:@"FCAppleAccountContentStoreFrontiTunesDSIDKey"];
  uint64_t v5 = [v18 stringForKey:@"FCAppleAccountContentStoreFrontIDKey"];
  uint64_t v6 = [a1 iTunesAccountDSID];
  id v7 = [a1 currentStoreFrontID];
  id v19 = 0;
  id v20 = 0;
  FCAppleAccountDetermineContentStoreFrontID(v4, v6, v5, v7, &v20, &v19);
  id v8 = v20;
  id v9 = v19;
  if (a2)
  {
    if (v8)
    {
      [v18 setObject:v8 forKey:@"FCAppleAccountContentStoreFrontiTunesDSIDKey"];
      if (v9)
      {
LABEL_4:
        [v18 setObject:v9 forKey:@"FCAppleAccountContentStoreFrontIDKey"];
        goto LABEL_7;
      }
    }
    else
    {
      [v18 removeObjectForKey:@"FCAppleAccountContentStoreFrontiTunesDSIDKey"];
      if (v9) {
        goto LABEL_4;
      }
    }
    [v18 removeObjectForKey:@"FCAppleAccountContentStoreFrontIDKey"];
  }
LABEL_7:
  uint64_t v10 = [v9 copy];
  long long v11 = (void *)a1[10];
  a1[10] = v10;

  uint64_t v12 = [v7 copy];
  uint64_t v13 = (void *)a1[9];
  a1[9] = v12;

  id v14 = [a1 iCloudAccountDSID];
  v15 = v14;
  if (!v14) {
    id v14 = v6;
  }
  uint64_t v16 = [v14 copy];
  v17 = (void *)a1[8];
  a1[8] = v16;
}

- (id)currentStoreFrontID
{
  if (self) {
    self = (FCAppleAccount *)objc_getProperty(self, a2, 32, 1);
  }
  uint64_t v2 = [(FCAppleAccount *)self ams_storefront];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@" -,"];
    uint64_t v4 = [v2 componentsSeparatedByCharactersInSet:v3];
    uint64_t v5 = [v4 firstObject];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (NSString)personID
{
  if (self) {
    self = (FCAppleAccount *)objc_getProperty(self, a2, 24, 1);
  }
  uint64_t v2 = [(FCAppleAccount *)self aa_personID];
  id v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (id)iTunesAccountDSID
{
  if (self) {
    self = (FCAppleAccount *)objc_getProperty(self, a2, 32, 1);
  }
  uint64_t v2 = [(FCAppleAccount *)self ams_DSID];
  id v3 = [v2 stringValue];

  return v3;
}

- (id)iCloudAccountDSID
{
  if (self)
  {
    self = (FCAppleAccount *)objc_getProperty(self, a2, 24, 1);
    uint64_t v2 = vars8;
  }
  return (id)[(FCAppleAccount *)self aa_personID];
}

- (NSString)supportedContentStoreFrontID
{
  uint64_t v2 = [(FCAppleAccount *)self contentStoreFrontID];
  if (!v2
    || (FCSupportedStoreFrontIDs(),
        id v3 = objc_claimAutoreleasedReturnValue(),
        char v4 = [v3 containsObject:v2],
        v3,
        (v4 & 1) == 0))
  {
    uint64_t v5 = @"143441";

    uint64_t v2 = v5;
  }
  return (NSString *)v2;
}

void __38__FCAppleAccount_getNewGSTokenPromise__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v7 = a3;
  id v8 = *(void **)(a1 + 32);
  if (!v8) {
    goto LABEL_17;
  }
  id v9 = objc_getProperty(v8, v6, 24, 1);
  if (v9)
  {
    long long v11 = v9;
    uint64_t v12 = [*(id *)(a1 + 32) iCloudAccountDSID];

    if (v12)
    {
      id Property = *(id *)(a1 + 32);
      if (Property) {
        id Property = objc_getProperty(Property, v10, 24, 1);
      }
      id v14 = Property;
      uint64_t v15 = [*(id *)(a1 + 32) iCloudAccountDSID];
      goto LABEL_13;
    }
  }
  uint64_t v16 = *(void **)(a1 + 32);
  if (!v16)
  {
LABEL_17:
    id v14 = 0;
    goto LABEL_18;
  }
  id v14 = objc_getProperty(v16, v10, 32, 1);
  if (!v14)
  {
LABEL_18:
    v17 = 0;
    goto LABEL_19;
  }
  v17 = [*(id *)(a1 + 32) iTunesAccountDSID];

  if (!v17)
  {
    id v14 = 0;
LABEL_19:
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __38__FCAppleAccount_getNewGSTokenPromise__block_invoke_2;
    v30[3] = &unk_1E5B4CA88;
    id v31 = v7;
    id v20 = v7;
    __38__FCAppleAccount_getNewGSTokenPromise__block_invoke_2((uint64_t)v30);
    id v22 = v31;
    goto LABEL_20;
  }
  id v19 = *(id *)(a1 + 32);
  if (v19) {
    id v19 = objc_getProperty(v19, v18, 32, 1);
  }
  id v14 = v19;
  uint64_t v15 = [*(id *)(a1 + 32) iTunesAccountDSID];
LABEL_13:
  v17 = (void *)v15;
  if (!v14 || !v15) {
    goto LABEL_19;
  }
  id v20 = objc_alloc_init(MEMORY[0x1E4F4EF60]);
  [v20 setServiceIdentifier:@"com.apple.gs.news.auth"];
  v21 = [v14 username];
  [v20 setUsername:v21];

  [v20 setDSID:v17];
  [v20 setIsUsernameEditable:0];
  [v20 setAuthenticationType:0];
  id v22 = objc_alloc_init(MEMORY[0x1E4F4EF68]);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __38__FCAppleAccount_getNewGSTokenPromise__block_invoke_3;
  v25[3] = &unk_1E5B50750;
  id v28 = v7;
  id v14 = v14;
  uint64_t v23 = *(void *)(a1 + 32);
  id v26 = v14;
  uint64_t v27 = v23;
  id v29 = v5;
  id v24 = v7;
  [v22 authenticateWithContext:v20 completion:v25];

LABEL_20:
}

void __38__FCAppleAccount_getNewGSTokenPromise__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "fc_authUserAccountInvalid");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

id __44__FCAppleAccount_dynamicPrimaryLanguageCode__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:a2];
  id v3 = [v2 objectForKey:*MEMORY[0x1E4F1C438]];

  return v3;
}

- (void)setRunningPPT:(BOOL)a3
{
  self->_runningPPT = a3;
}

uint64_t __49__FCAppleAccount__reloadAccountsFromAccountStore__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 accountType];
  char v4 = [v3 identifier];
  if ([v4 isEqual:*MEMORY[0x1E4F17890]]) {
    uint64_t v5 = objc_msgSend(v2, "ams_isLocalAccount");
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t __49__FCAppleAccount__reloadAccountsFromAccountStore__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 accountType];
  char v4 = [v3 identifier];
  if ([v4 isEqual:*MEMORY[0x1E4F17890]]) {
    uint64_t v5 = [v2 isActive];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t __49__FCAppleAccount__reloadAccountsFromAccountStore__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 accountType];
  char v4 = [v3 identifier];
  if ([v4 isEqualToString:*MEMORY[0x1E4F17750]]) {
    uint64_t v5 = objc_msgSend(v2, "aa_isAccountClass:", *MEMORY[0x1E4F4BF38]);
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

+ (void)enableStoreFrontLocking
{
  FCAppleAccountStoreFrontLockingEnabled = 1;
}

uint64_t __31__FCAppleAccount_sharedAccount__block_invoke(uint64_t a1)
{
  qword_1EB5D1A40 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

- (FCAppleAccount)init
{
  v9.receiver = self;
  v9.super_class = (Class)FCAppleAccount;
  id v2 = [(FCAppleAccount *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F179C8] defaultStore];
    accountStore = v2->_accountStore;
    v2->_accountStore = (ACAccountStore *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;

    [(FCAppleAccount *)v2 _reloadAccountsFromAccountStore];
    -[FCAppleAccount _setStoreFrontDependentPropertiesWithStoreFrontLockingEnabled:](v2, FCAppleAccountStoreFrontLockingEnabled);
    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v2 selector:sel__accountStoreDidChange name:*MEMORY[0x1E4F17728] object:v2->_accountStore];
  }
  return v2;
}

- (void)_reloadAccountsFromAccountStore
{
  v39[2] = *MEMORY[0x1E4F143B8];
  if (self)
  {
    id v4 = objc_getProperty(self, a2, 24, 1);
    id v6 = objc_getProperty(self, v5, 32, 1);
    accountStore = self->_accountStore;
  }
  else
  {
    id v6 = 0;
    id v4 = 0;
    accountStore = 0;
  }
  uint64_t v8 = *MEMORY[0x1E4F17890];
  v39[0] = *MEMORY[0x1E4F17750];
  v39[1] = v8;
  objc_super v9 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v10 = accountStore;
  long long v11 = [v9 arrayWithObjects:v39 count:2];
  uint64_t v12 = [(ACAccountStore *)v10 accountsWithAccountTypeIdentifiers:v11 error:0];

  uint64_t v13 = objc_msgSend(v12, "fc_firstObjectPassingTest:", &__block_literal_global_90);
  id v14 = objc_msgSend(v12, "fc_firstObjectPassingTest:", &__block_literal_global_92_1);
  uint64_t v16 = objc_msgSend(v12, "fc_firstObjectPassingTest:", &__block_literal_global_94);
  v17 = (void *)v13;
  if (!v13)
  {
    if (self) {
      id v18 = self->_accountStore;
    }
    else {
      id v18 = 0;
    }
    id v2 = v18;
    v17 = [(ACAccountStore *)v2 aa_primaryAppleAccount];
  }
  if (self) {
    objc_setProperty_atomic(self, v15, v17, 24);
  }
  if (!v13)
  {
  }
  v37 = (void *)v13;
  if (v14)
  {
    int v19 = 0;
    id v20 = v14;
    if (!self) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (v16)
  {
    int v19 = 0;
    id v20 = v16;
    if (!self) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (self) {
    v36 = self->_accountStore;
  }
  else {
    v36 = 0;
  }
  id v2 = v36;
  id v20 = [(ACAccountStore *)v2 ams_localiTunesAccount];
  int v19 = 1;
  if (self) {
LABEL_16:
  }
    objc_setProperty_atomic(self, v15, v20, 32);
LABEL_17:
  if (v19)
  {
  }
  id v21 = v4;
  id v23 = v6;
  if (self)
  {
    id v24 = v12;
    id v26 = v14;
    if (objc_getProperty(self, v22, 24, 1) == v21)
    {
      int v29 = 0;
    }
    else
    {
      uint64_t v27 = objc_msgSend(objc_getProperty(self, v25, 24, 1), "identifier");
      id v28 = [v21 identifier];
      int v29 = [v27 isEqualToString:v28] ^ 1;
    }
    v30 = v16;
    if (objc_getProperty(self, v25, 32, 1) == v23)
    {
      int v34 = 0;
    }
    else
    {
      v32 = objc_msgSend(objc_getProperty(self, v31, 32, 1), "identifier");
      v33 = [v23 identifier];
      int v34 = [v32 isEqualToString:v33] ^ 1;
    }
    int v35 = v29 | v34;
    uint64_t v16 = v30;
    id v14 = v26;
    uint64_t v12 = v24;
    if (v35 == 1)
    {
      -[FCAppleAccount _setStoreFrontDependentPropertiesWithStoreFrontLockingEnabled:](self, FCAppleAccountStoreFrontLockingEnabled);
      [(FCAppleAccount *)self invalidateGSTokenCache];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __48__FCAppleAccount_notifyObserversOfAccountChange__block_invoke;
      block[3] = &unk_1E5B4C018;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

- (void)invalidateGSTokenCache
{
  if (self->_base64GSTokenPromise)
  {
    -[FCAppleAccount getNewGSTokenPromise](self);
    uint64_t v3 = (NFPromise *)objc_claimAutoreleasedReturnValue();
    base64GSTokenPromise = self->_base64GSTokenPromise;
    self->_base64GSTokenPromise = v3;
    MEMORY[0x1F41817F8](v3, base64GSTokenPromise);
  }
}

- (ACAccount)activeiTunesAccount
{
  if (self)
  {
    self = (FCAppleAccount *)objc_getProperty(self, a2, 32, 1);
    uint64_t v2 = vars8;
  }
  return (ACAccount *)self;
}

- (void)loadStoreFrontWithCompletionHandler:(id)a3
{
  id v3 = a3;
  id v4 = +[FCAMSBag bag];
  SEL v5 = [v4 URLForKey:@"metrics/metricsUrl"];
  id v6 = [v5 valuePromise];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__FCAppleAccount_loadStoreFrontWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E5B59B88;
  id v9 = v3;
  id v7 = v3;
  [v6 addFinishBlock:v8];
}

uint64_t __37__FCAppleAccount_primaryLanguageCode__block_invoke(uint64_t a1)
{
  qword_1EB5D1A58 = -[FCAppleAccount dynamicPrimaryLanguageCode](*(__CFString **)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

- (__CFString)dynamicPrimaryLanguageCode
{
  uint64_t v1 = a1;
  if (a1)
  {
    uint64_t v2 = [MEMORY[0x1E4F1CA20] preferredLanguages];
    id v3 = objc_msgSend(v2, "fc_arrayByTransformingWithBlock:", &__block_literal_global_155);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __44__FCAppleAccount_dynamicPrimaryLanguageCode__block_invoke_2;
    v8[3] = &unk_1E5B4DBB0;
    void v8[4] = v1;
    uint64_t v4 = objc_msgSend(v3, "fc_firstObjectPassingTest:", v8);
    SEL v5 = (void *)v4;
    id v6 = @"en";
    if (v4) {
      id v6 = (__CFString *)v4;
    }
    uint64_t v1 = v6;
  }
  return v1;
}

void __54__FCAppleAccount_loadStoreFrontWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138543362;
      id v10 = v6;
      _os_log_error_impl(&dword_1A460D000, v7, OS_LOG_TYPE_ERROR, "failed to obtain metrics URL from bag with error: %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(void))(v8 + 16))();
  }
}

- (BOOL)isUserSignedIntoiTunes
{
  uint64_t v2 = [(FCAppleAccount *)self iTunesAccountDSID];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isSignedInStoreFrontSupported
{
  uint64_t v2 = [(FCAppleAccount *)self currentStoreFrontID];
  if (v2)
  {
    BOOL v3 = FCSupportedStoreFrontIDs();
    char v4 = [v3 containsObject:v2];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (int64_t)supportedContentLanguage
{
  uint64_t v2 = [(FCAppleAccount *)self primaryLanguageCode];
  int64_t v3 = [v2 isEqualToString:@"fr"];

  return v3;
}

- (int64_t)dynamicSupportedContentLanguage
{
  uint64_t v2 = -[FCAppleAccount dynamicPrimaryLanguageCode]((__CFString *)self);
  int64_t v3 = [v2 isEqualToString:@"fr"];

  return v3;
}

- (void)checkAlliOSDevicesRunningMinimumOSVersion:(id)a3 orInactiveForTimeInterval:(double)a4 completionHandler:(id)a5
{
}

- (void)checkAllDevicesRunningMinimumiOSVersion:(id)a3 macOSVersion:(id)a4 orInactiveForTimeInterval:(double)a5 completionHandler:(id)a6
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  int64_t v9 = a3.var1;
  int64_t v10 = a3.var0;
  v27[1] = *MEMORY[0x1E4F143B8];
  id v12 = a6;
  id v14 = objc_alloc_init(MEMORY[0x1E4F4F018]);
  if (self) {
    id Property = objc_getProperty(self, v13, 24, 1);
  }
  else {
    id Property = 0;
  }
  uint64_t v16 = objc_msgSend(Property, "aa_altDSID");
  [v14 setAltDSID:v16];

  [v14 setIncludeUntrustedDevices:1];
  v27[0] = *MEMORY[0x1E4F4EF10];
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  [v14 setServices:v17];

  [v14 setOperatingSystems:&unk_1EF8D8C88];
  id v18 = objc_alloc_init(MEMORY[0x1E4F4EF68]);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __115__FCAppleAccount_checkAllDevicesRunningMinimumiOSVersion_macOSVersion_orInactiveForTimeInterval_completionHandler___block_invoke;
  v20[3] = &unk_1E5B59BD0;
  double v22 = a5;
  int64_t v23 = v10;
  int64_t v24 = v9;
  int64_t v25 = var0;
  int64_t v26 = var1;
  id v21 = v12;
  id v19 = v12;
  [v18 fetchDeviceListWithContext:v14 completion:v20];
}

void __115__FCAppleAccount_checkAllDevicesRunningMinimumiOSVersion_macOSVersion_orInactiveForTimeInterval_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = FCDefaultLog;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v40 = v6;
      _os_log_error_impl(&dword_1A460D000, v7, OS_LOG_TYPE_ERROR, "encountered error fetching device list: %{public}@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v29 = a1;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = v7;
      *(_DWORD *)buf = 134217984;
      v40 = (const char *)[v5 count];
      _os_log_impl(&dword_1A460D000, v8, OS_LOG_TYPE_DEFAULT, "successfully fetched device list with %lu devices", buf, 0xCu);
    }
    int64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v30 = v5;
    id obj = v5;
    uint64_t v10 = [obj countByEnumeratingWithState:&v35 objects:v45 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v36;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v36 != v12) {
            objc_enumerationMutation(obj);
          }
          id v14 = *(void **)(*((void *)&v35 + 1) + 8 * v13);
          uint64_t v15 = (void *)FCDefaultLog;
          if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v16 = v15;
            v17 = [v14 model];
            id v18 = [v14 buildNumber];
            id v19 = [v14 lastUpdatedDate];
            id v20 = objc_msgSend(v19, "fc_stringWithISO8601Format");
            *(_DWORD *)buf = 138543874;
            v40 = v17;
            __int16 v41 = 2114;
            v42 = v18;
            __int16 v43 = 2114;
            v44[0] = v20;
            _os_log_impl(&dword_1A460D000, v16, OS_LOG_TYPE_DEFAULT, "fetched device: %{public}@ %{public}@; last updated %{public}@",
              buf,
              0x20u);
          }
          id v21 = [v14 serialNumber];
          if (v21)
          {
            double v22 = [v9 objectForKeyedSubscript:v21];
            if (!v22
              || ([v14 lastUpdatedDate],
                  int64_t v23 = objc_claimAutoreleasedReturnValue(),
                  [v22 lastUpdatedDate],
                  int64_t v24 = objc_claimAutoreleasedReturnValue(),
                  int v25 = objc_msgSend(v23, "fc_isLaterThan:", v24),
                  v24,
                  v23,
                  v25))
            {
              [v9 setObject:v14 forKeyedSubscript:v21];
            }
          }
          else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            int64_t v26 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "serialNumber");
            *(_DWORD *)buf = 136315906;
            v40 = "-[FCAppleAccount checkAllDevicesRunningMinimumiOSVersion:macOSVersion:orInactiveForTimeInterval:comple"
                  "tionHandler:]_block_invoke";
            __int16 v41 = 2080;
            v42 = "FCAppleAccount.m";
            __int16 v43 = 1024;
            LODWORD(v44[0]) = 403;
            WORD2(v44[0]) = 2114;
            *(void *)((char *)v44 + 6) = v26;
            _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [obj countByEnumeratingWithState:&v35 objects:v45 count:16];
      }
      while (v11);
    }

    uint64_t v27 = [v9 allValues];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[4] = *(void *)(v29 + 40);
    long long v28 = *(_OWORD *)(v29 + 64);
    long long v33 = *(_OWORD *)(v29 + 48);
    long long v34 = v28;
    v32[2] = __115__FCAppleAccount_checkAllDevicesRunningMinimumiOSVersion_macOSVersion_orInactiveForTimeInterval_completionHandler___block_invoke_55;
    v32[3] = &__block_descriptor_72_e24_B16__0__AKRemoteDevice_8l;
    objc_msgSend(v27, "fc_allObjectsPassTest:", v32);

    (*(void (**)(void))(*(void *)(v29 + 32) + 16))();
    id v6 = 0;
    id v5 = v30;
  }
}

uint64_t __115__FCAppleAccount_checkAllDevicesRunningMinimumiOSVersion_macOSVersion_orInactiveForTimeInterval_completionHandler___block_invoke_55(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [v3 operatingSystemVersion];
  id v5 = [v4 componentsSeparatedByString:@"."];

  id v6 = [v5 firstObject];
  uint64_t v7 = [v6 integerValue];

  if ((unint64_t)[v5 count] < 2)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v8 = [v5 objectAtIndexedSubscript:1];
    uint64_t v9 = [v8 integerValue];
  }
  uint64_t v10 = [v3 lastUpdatedDate];
  objc_msgSend(v10, "fc_timeIntervalUntilNow");
  double v12 = v11;
  double v13 = *(double *)(a1 + 32);

  if (v12 > v13)
  {
    uint64_t v14 = 1;
    goto LABEL_21;
  }
  uint64_t v15 = [v3 operatingSystemName];
  int v16 = [v15 isEqualToString:@"iOS"];

  if (v16)
  {
    v17 = (uint64_t *)(a1 + 40);
    id v18 = (uint64_t *)(a1 + 48);
  }
  else
  {
    id v19 = [v3 operatingSystemName];
    int v20 = [v19 isEqualToString:@"macOS"];

    if (!v20)
    {
      uint64_t v21 = 0;
      uint64_t v22 = 0;
      goto LABEL_12;
    }
    v17 = (uint64_t *)(a1 + 56);
    id v18 = (uint64_t *)(a1 + 64);
  }
  uint64_t v21 = *v17;
  uint64_t v22 = *v18;
LABEL_12:
  BOOL v24 = v7 == v21 && v9 >= v22;
  uint64_t v14 = v7 > v21 || v24;
LABEL_21:

  return v14;
}

- (void)fetchMinimumDeviceVersionsActiveSinceInterval:(double)a3 completionHandler:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F4F018]);
  if (self) {
    id Property = objc_getProperty(self, v7, 24, 1);
  }
  else {
    id Property = 0;
  }
  uint64_t v10 = objc_msgSend(Property, "aa_altDSID");
  [v8 setAltDSID:v10];

  [v8 setIncludeUntrustedDevices:1];
  v17[0] = *MEMORY[0x1E4F4EF10];
  double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  [v8 setServices:v11];

  [v8 setOperatingSystems:&unk_1EF8D8CA0];
  id v12 = objc_alloc_init(MEMORY[0x1E4F4EF68]);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __82__FCAppleAccount_fetchMinimumDeviceVersionsActiveSinceInterval_completionHandler___block_invoke;
  v14[3] = &unk_1E5B59C20;
  id v15 = v6;
  double v16 = a3;
  id v13 = v6;
  [v12 fetchDeviceListWithContext:v8 completion:v14];
}

void __82__FCAppleAccount_fetchMinimumDeviceVersionsActiveSinceInterval_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v6)
  {
    uint64_t v71 = a1;
    uint64_t v9 = (void *)FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = v9;
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = [v5 count];
      _os_log_impl(&dword_1A460D000, v10, OS_LOG_TYPE_DEFAULT, "successfully fetched device list with %lu devices", buf, 0xCu);
    }
    double v11 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    id v64 = v5;
    id obj = v5;
    uint64_t v12 = [obj countByEnumeratingWithState:&v80 objects:v97 count:16];
    v73 = v11;
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v81;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v81 != v14) {
            objc_enumerationMutation(obj);
          }
          double v16 = *(void **)(*((void *)&v80 + 1) + 8 * i);
          v17 = (void *)FCDefaultLog;
          if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
          {
            id v18 = v17;
            id v19 = [v16 model];
            int v20 = [v16 buildNumber];
            uint64_t v21 = [v16 lastUpdatedDate];
            uint64_t v22 = objc_msgSend(v21, "fc_stringWithISO8601Format");
            *(_DWORD *)buf = 138543874;
            *(void *)&uint8_t buf[4] = v19;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v20;
            *(_WORD *)&buf[22] = 2114;
            *(void *)&long long v92 = v22;
            _os_log_impl(&dword_1A460D000, v18, OS_LOG_TYPE_DEFAULT, "fetched device: %{public}@ %{public}@; last updated %{public}@",
              buf,
              0x20u);

            double v11 = v73;
          }
          int64_t v23 = [v16 serialNumber];
          if (v23)
          {
            BOOL v24 = [v11 objectForKeyedSubscript:v23];
            if (!v24) {
              goto LABEL_15;
            }
            int v25 = [v16 lastUpdatedDate];
            int64_t v26 = [v24 lastUpdatedDate];
            int v27 = objc_msgSend(v25, "fc_isLaterThan:", v26);

            double v11 = v73;
            if (v27) {
LABEL_15:
            }
              [v11 setObject:v16 forKeyedSubscript:v23];
          }
          else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            long long v28 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "serialNumber");
            *(_DWORD *)buf = 136315906;
            *(void *)&uint8_t buf[4] = "-[FCAppleAccount fetchMinimumDeviceVersionsActiveSinceInterval:completionHandler:]_block_invoke";
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "FCAppleAccount.m";
            *(_WORD *)&buf[22] = 1024;
            LODWORD(v92) = 480;
            WORD2(v92) = 2114;
            *(void *)((char *)&v92 + 6) = v28;
            _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v80 objects:v97 count:16];
      }
      while (v13);
    }

    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    v72 = [v11 allValues];
    uint64_t v29 = [v72 countByEnumeratingWithState:&v76 objects:v96 count:16];
    if (!v29)
    {
      uint64_t v31 = 0;
      uint64_t v70 = 0;
      uint64_t v67 = 0;
      uint64_t v68 = 0;
      uint64_t v65 = 0;
      uint64_t v66 = 0;
      uint64_t v32 = 0;
      id obja = 0;
      uint64_t v34 = a1;
      goto LABEL_86;
    }
    uint64_t v30 = v29;
    uint64_t v31 = 0;
    uint64_t v67 = 0;
    uint64_t v68 = 0;
    uint64_t v65 = 0;
    uint64_t v66 = 0;
    uint64_t v32 = 0;
    id obja = 0;
    uint64_t v33 = *(void *)v77;
    uint64_t v34 = a1;
    uint64_t v69 = *(void *)v77;
    uint64_t v70 = 0;
    while (1)
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v77 != v33) {
          objc_enumerationMutation(v72);
        }
        long long v36 = *(void **)(*((void *)&v76 + 1) + 8 * j);
        long long v37 = [v36 lastUpdatedDate];
        objc_msgSend(v37, "fc_timeIntervalUntilNow");
        double v39 = v38;
        double v40 = *(double *)(v34 + 40);

        if (v39 <= v40)
        {
          __int16 v41 = [v36 operatingSystemVersion];
          v42 = [v41 componentsSeparatedByString:@"."];

          __int16 v43 = [v42 firstObject];
          uint64_t v44 = [v43 integerValue];

          if ((unint64_t)[v42 count] < 2)
          {
            uint64_t v46 = 0;
          }
          else
          {
            v45 = [v42 objectAtIndexedSubscript:1];
            uint64_t v46 = [v45 integerValue];
          }
          v47 = [v36 operatingSystemName];
          int v48 = [v47 isEqualToString:@"iOS"];

          if (v48)
          {
            if (v46 < v70) {
              uint64_t v49 = v44;
            }
            else {
              uint64_t v49 = v31;
            }
            if (v46 < v70) {
              uint64_t v50 = v46;
            }
            else {
              uint64_t v50 = v70;
            }
            if (v44 > v31)
            {
              uint64_t v49 = v31;
              uint64_t v50 = v70;
            }
            if (v44 < v31)
            {
              uint64_t v49 = v44;
              uint64_t v50 = v46;
            }
            BOOL v51 = v31 == 0;
            if (v31) {
              uint64_t v31 = v49;
            }
            else {
              uint64_t v31 = v44;
            }
            if (v51) {
              uint64_t v52 = v46;
            }
            else {
              uint64_t v52 = v50;
            }
            uint64_t v70 = v52;
            goto LABEL_80;
          }
          v53 = [v36 operatingSystemName];
          int v54 = [v53 isEqualToString:@"macOS"];

          if (v54)
          {
            if (v46 < v67) {
              uint64_t v55 = v44;
            }
            else {
              uint64_t v55 = v68;
            }
            if (v46 < v67) {
              uint64_t v56 = v46;
            }
            else {
              uint64_t v56 = v67;
            }
            if (v44 > v68)
            {
              uint64_t v55 = v68;
              uint64_t v56 = v67;
            }
            if (v44 < v68)
            {
              uint64_t v55 = v44;
              uint64_t v56 = v46;
            }
            if (v68) {
              uint64_t v57 = v55;
            }
            else {
              uint64_t v57 = v44;
            }
            if (v68) {
              uint64_t v58 = v56;
            }
            else {
              uint64_t v58 = v46;
            }
            uint64_t v67 = v58;
            uint64_t v68 = v57;
LABEL_80:
            uint64_t v44 = v32;
            uint64_t v46 = (uint64_t)obja;
            uint64_t v34 = v71;
            uint64_t v33 = v69;
LABEL_81:

            uint64_t v32 = v44;
            id obja = (id)v46;
            continue;
          }
          v59 = [v36 operatingSystemName];
          int v60 = [v59 isEqualToString:@"watchOS"];

          if (v60)
          {
            if (!v66)
            {
              uint64_t v65 = v46;
              uint64_t v66 = v44;
              goto LABEL_80;
            }
            uint64_t v34 = v71;
            uint64_t v33 = v69;
            if (v44 < v66 || v44 <= v66 && v46 < v65)
            {
              uint64_t v65 = v46;
              uint64_t v66 = v44;
            }
          }
          else
          {
            v61 = [v36 operatingSystemName];
            int v62 = [v61 isEqualToString:@"visionOS"];

            if (!v62) {
              goto LABEL_80;
            }
            uint64_t v34 = v71;
            uint64_t v33 = v69;
            if (!v32 || v44 < v32 || v44 <= v32 && v46 < (uint64_t)obja) {
              goto LABEL_81;
            }
          }
          uint64_t v44 = v32;
          uint64_t v46 = (uint64_t)obja;
          goto LABEL_81;
        }
      }
      uint64_t v30 = [v72 countByEnumeratingWithState:&v76 objects:v96 count:16];
      if (!v30)
      {
LABEL_86:

        v63 = *(void (**)(void))(*(void *)(v34 + 32) + 16);
        *(void *)buf = v31;
        *(void *)&buf[8] = v70;
        *(void *)&buf[16] = v68;
        *(void *)&long long v92 = v67;
        *((void *)&v92 + 1) = v66;
        uint64_t v93 = v65;
        uint64_t v94 = v32;
        id v95 = obja;
        v63();
        uint64_t v7 = 0;
        id v5 = v64;
        id v8 = v73;
        goto LABEL_87;
      }
    }
  }
  v84[0] = MEMORY[0x1E4F143A8];
  v84[1] = 3221225472;
  v84[2] = __82__FCAppleAccount_fetchMinimumDeviceVersionsActiveSinceInterval_completionHandler___block_invoke_2;
  v84[3] = &unk_1E5B59BF8;
  id v85 = v6;
  id v86 = *(id *)(a1 + 32);
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  __82__FCAppleAccount_fetchMinimumDeviceVersionsActiveSinceInterval_completionHandler___block_invoke_2((uint64_t)v84);

  id v8 = v85;
LABEL_87:
}

uint64_t __82__FCAppleAccount_fetchMinimumDeviceVersionsActiveSinceInterval_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    LODWORD(v15[0]) = 138543362;
    *(void *)((char *)v15 + 4) = v14;
    _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "encountered error fetching device list: %{public}@", (uint8_t *)v15, 0xCu);
  }
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v10 = *(uint64_t (**)(uint64_t, _OWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 16);
  long long v11 = *(_OWORD *)(a1 + 64);
  v15[0] = *(_OWORD *)(a1 + 48);
  v15[1] = v11;
  long long v12 = *(_OWORD *)(a1 + 96);
  v15[2] = *(_OWORD *)(a1 + 80);
  v15[3] = v12;
  return v10(v8, v15, v9, v3, v4, v5, v6, v7);
}

uint64_t __50__FCAppleAccount_getGSTokenWithCompletionHandler___block_invoke(uint64_t a1)
{
  return 0;
}

void __38__FCAppleAccount_getNewGSTokenPromise__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5
    && (uint64_t v7 = *MEMORY[0x1E4F4EDC0],
        [v5 objectForKeyedSubscript:*MEMORY[0x1E4F4EDC0]],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    uint64_t v9 = [v5 objectForKeyedSubscript:@"AKAltDSID"];
    uint64_t v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "aa_altDSID");
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    long long v12 = v11;

    [*(id *)(a1 + 40) setAltDSID:v12];
    uint64_t v13 = [v5 objectForKeyedSubscript:v7];
    uint64_t v14 = [v13 objectForKeyedSubscript:@"com.apple.gs.news.auth"];
    id v15 = [NSString stringWithFormat:@"%@:%@", v12, v14];
    uint64_t v16 = [v15 dataUsingEncoding:4];
    v17 = [v16 base64EncodedStringWithOptions:0];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v19 = (void (**)(id, id))*(id *)(a1 + 48);
    id v18 = v6;
    v19[2](v19, v18);
  }
}

uint64_t __38__FCAppleAccount_getNewGSTokenPromise__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)removeObserver:(id)a3
{
  if (self) {
    self = (FCAppleAccount *)self->_observers;
  }
  [(FCAppleAccount *)self removeObject:a3];
}

- (NSString)primaryEmailAddress
{
  if (self) {
    self = (FCAppleAccount *)objc_getProperty(self, a2, 24, 1);
  }
  uint64_t v2 = [(FCAppleAccount *)self aa_primaryEmail];
  uint64_t v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (NSString)appStoreEmailAddress
{
  uint64_t v3 = [(FCAppleAccount *)self iTunesAccountName];
  int v4 = objc_msgSend(v3, "ea_isLegalEmailAddress");

  if (v4)
  {
    id v5 = [(FCAppleAccount *)self iTunesAccountName];
    id v6 = (void *)[v5 copy];
  }
  else
  {
    id v6 = 0;
  }
  return (NSString *)v6;
}

- (NSArray)allEmailAddresses
{
  uint64_t v3 = objc_opt_new();
  int v4 = [(FCAppleAccount *)self appStoreEmailAddress];

  if (v4)
  {
    id v5 = [(FCAppleAccount *)self appStoreEmailAddress];
    id v6 = (void *)[v5 copy];
    [v3 addObject:v6];
  }
  uint64_t v7 = [(FCAppleAccount *)self primaryEmailAddress];

  if (v7)
  {
    uint64_t v8 = [(FCAppleAccount *)self primaryEmailAddress];
    uint64_t v9 = (void *)[v8 copy];
    [v3 addObject:v9];
  }
  uint64_t v10 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v3];
  id v11 = [v10 array];

  return (NSArray *)v11;
}

- (void)_accountStoreDidChange
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__reloadAccountsFromAccountStore object:0];
  [(FCAppleAccount *)self performSelector:sel__reloadAccountsFromAccountStore withObject:0 afterDelay:1.0];
}

- (void)t_startOverridingContentStoreFrontID:(id)a3
{
  if (self) {
    objc_setProperty_nonatomic_copy(self, a2, a3, 40);
  }
}

- (void)t_stopOverridingContentStoreFrontID
{
  if (self) {
    objc_setProperty_nonatomic_copy(self, a2, 0, 40);
  }
}

- (NSString)DSID
{
  return self->_DSID;
}

- (void)setDSID:(id)a3
{
}

- (NSString)userStoreFrontID
{
  return self->_userStoreFrontID;
}

- (void)setUserStoreFrontID:(id)a3
{
}

- (void)setContentStoreFrontID:(id)a3
{
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_contentStoreFrontID, 0);
  objc_storeStrong((id *)&self->_userStoreFrontID, 0);
  objc_storeStrong((id *)&self->_DSID, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_base64GSTokenPromise, 0);
  objc_storeStrong((id *)&self->_overrideContentStoreFrontID, 0);
  objc_storeStrong((id *)&self->_iTunesAccount, 0);
  objc_storeStrong((id *)&self->_primaryAccount, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end