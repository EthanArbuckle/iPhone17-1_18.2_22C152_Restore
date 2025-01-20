@interface SUScriptSubscriptionStatusResponse
+ (id)webScriptNameForKeyName:(id)a3;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (NSNumber)acceptedStoreTermsVersion;
- (NSNumber)carrierBundlingErrorCode;
- (NSNumber)latestStoreTermsVersion;
- (NSString)accountIdentifier;
- (NSString)accountStatus;
- (NSString)accountStatusNeedsAuthentication;
- (NSString)accountStatusNotSubscribed;
- (NSString)accountStatusSubscribed;
- (NSString)accountStatusUnknown;
- (NSString)carrierBundlingStatus;
- (NSString)eligibilityStatus;
- (NSString)eligibilityStatusEligible;
- (NSString)eligibilityStatusNotEligible;
- (NSString)eligibilityStatusUnknown;
- (NSString)sessionIdentifier;
- (SUScriptDictionary)rawResponseData;
- (SUScriptSubscriptionStatusResponse)initWithSubscriptionStatus:(id)a3 isFinal:(BOOL)a4;
- (id)_className;
- (id)hasFamily;
- (id)hasFamilyMembers;
- (id)isDiscoveryModeEligible;
- (id)isFamilyOrganizer;
- (id)isFamilySubscription;
- (id)isFinal;
- (id)isSubscribed;
- (id)scriptAttributeKeys;
- (unint64_t)hash;
@end

@implementation SUScriptSubscriptionStatusResponse

- (SUScriptSubscriptionStatusResponse)initWithSubscriptionStatus:(id)a3 isFinal:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v55.receiver = self;
  v55.super_class = (Class)SUScriptSubscriptionStatusResponse;
  v7 = [(SUScriptObject *)&v55 init];
  if (!v7) {
    goto LABEL_60;
  }
  v8 = [v6 sessionIdentifier];
  uint64_t v9 = [v8 copy];
  sessionIdentifier = v7->_sessionIdentifier;
  v7->_sessionIdentifier = (NSString *)v9;

  uint64_t v11 = [v6 statusType];
  uint64_t v12 = [v6 reasonType];
  if (v11 == 2)
  {
    if (v12 == 4) {
      [(SUScriptSubscriptionStatusResponse *)v7 accountStatusNeedsAuthentication];
    }
    else {
    uint64_t v13 = [(SUScriptSubscriptionStatusResponse *)v7 accountStatusNotSubscribed];
    }
    goto LABEL_11;
  }
  if (v11 != 1)
  {
    if (v11)
    {
LABEL_12:
      v16 = (void *)*MEMORY[0x263EFFB40];
      v17 = (void *)*MEMORY[0x263EFFB38];
      v18 = (void *)*MEMORY[0x263EFFB38];
      goto LABEL_13;
    }
    uint64_t v13 = [(SUScriptSubscriptionStatusResponse *)v7 accountStatusUnknown];
LABEL_11:
    accountStatus = v7->_accountStatus;
    v7->_accountStatus = (NSString *)v13;

    goto LABEL_12;
  }
  uint64_t v14 = [(SUScriptSubscriptionStatusResponse *)v7 accountStatusSubscribed];
  v15 = v7->_accountStatus;
  v7->_accountStatus = (NSString *)v14;

  v16 = (void *)*MEMORY[0x263EFFB40];
  v17 = (void *)*MEMORY[0x263EFFB38];
  v18 = (void *)*MEMORY[0x263EFFB40];
LABEL_13:
  objc_storeStrong(&v7->_subscribed, v18);
  unint64_t v20 = [v6 carrierBundlingStatusType];
  unint64_t v21 = v20;
  if (v20 <= 4)
  {
    v22 = *off_264814720[v20];
    carrierBundlingStatus = v7->_carrierBundlingStatus;
    v7->_carrierBundlingStatus = &v22->isa;
  }
  unint64_t v50 = v21;
  BOOL v49 = v4;
  uint64_t v24 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "carrierBundlingErrorCode"));
  carrierBundlingErrorCode = v7->_carrierBundlingErrorCode;
  v7->_carrierBundlingErrorCode = (NSNumber *)v24;

  if ([v6 isDiscoveryModeEligible]) {
    v26 = v16;
  }
  else {
    v26 = v17;
  }
  objc_storeStrong(&v7->_discoveryModeEligible, v26);
  if ([v6 isHeadOfHousehold]) {
    v27 = v16;
  }
  else {
    v27 = v17;
  }
  objc_storeStrong(&v7->_familyOrganizer, v27);
  if (v12 == 2 && v11 == 1) {
    v29 = v16;
  }
  else {
    v29 = v17;
  }
  objc_storeStrong(&v7->_familySubscription, v29);
  if ([v6 hasFamily]) {
    v30 = v16;
  }
  else {
    v30 = v17;
  }
  objc_storeStrong(&v7->_hasFamily, v30);
  if ([v6 hasFamilyGreaterThanOneMember]) {
    v31 = v16;
  }
  else {
    v31 = v17;
  }
  objc_storeStrong(&v7->_hasFamilyMembers, v31);
  [v6 termsStatusList];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v32 = (id)objc_claimAutoreleasedReturnValue();
  id v33 = (id)[v32 countByEnumeratingWithState:&v51 objects:v56 count:16];
  if (v33)
  {
    uint64_t v34 = *(void *)v52;
    while (2)
    {
      for (i = 0; i != v33; i = (char *)i + 1)
      {
        if (*(void *)v52 != v34) {
          objc_enumerationMutation(v32);
        }
        v36 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        if ([v36 type] == 1)
        {
          id v33 = v36;
          goto LABEL_43;
        }
      }
      id v33 = (id)[v32 countByEnumeratingWithState:&v51 objects:v56 count:16];
      if (v33) {
        continue;
      }
      break;
    }
  }
LABEL_43:

  uint64_t v37 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v33, "acceptedVersion"));
  acceptedStoreTermsVersion = v7->_acceptedStoreTermsVersion;
  v7->_acceptedStoreTermsVersion = (NSNumber *)v37;

  uint64_t v39 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v33, "currentVersion"));
  latestStoreTermsVersion = v7->_latestStoreTermsVersion;
  v7->_latestStoreTermsVersion = (NSNumber *)v39;

  if (v11 == 1 || v50 - 1 <= 1)
  {
    uint64_t v43 = [(SUScriptSubscriptionStatusResponse *)v7 eligibilityStatusEligible];
    eligibilityStatus = v7->_eligibilityStatus;
    v7->_eligibilityStatus = (NSString *)v43;
    BOOL v41 = v49;
  }
  else
  {
    BOOL v41 = v49;
    if (v11 == 2 && v50 == 3)
    {
      uint64_t v42 = [(SUScriptSubscriptionStatusResponse *)v7 eligibilityStatusNotEligible];
    }
    else
    {
      uint64_t v42 = [(SUScriptSubscriptionStatusResponse *)v7 eligibilityStatusUnknown];
    }
    eligibilityStatus = v7->_eligibilityStatus;
    v7->_eligibilityStatus = (NSString *)v42;
  }

  v45 = [v6 responseDictionary];
  if (v45) {
    v46 = [[SUScriptDictionary alloc] initWithDictionary:v45];
  }
  else {
    v46 = 0;
  }
  objc_storeStrong((id *)&v7->_rawResponseData, v46);
  if (v45) {

  }
  if (v41) {
    v47 = v16;
  }
  else {
    v47 = v17;
  }
  objc_storeStrong(&v7->_final, v47);

LABEL_60:
  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NSNumber *)self->_acceptedStoreTermsVersion unsignedLongLongValue];
  NSUInteger v4 = [(NSString *)self->_sessionIdentifier hash] ^ v3;
  NSUInteger v5 = v4 ^ [(NSString *)self->_accountStatus hash];
  NSUInteger v6 = v5 ^ [self->_subscribed BOOLValue];
  NSUInteger v7 = [(NSString *)self->_carrierBundlingStatus hash];
  NSInteger v8 = v7 ^ [(NSNumber *)self->_carrierBundlingErrorCode integerValue];
  NSInteger v9 = v6 ^ v8 ^ [self->_discoveryModeEligible BOOLValue];
  NSUInteger v10 = [(NSString *)self->_eligibilityStatus hash];
  NSUInteger v11 = v10 ^ [self->_familyOrganizer BOOLValue];
  NSUInteger v12 = v9 ^ v11 ^ [self->_familySubscription BOOLValue];
  uint64_t v13 = [self->_hasFamily BOOLValue];
  uint64_t v14 = v13 ^ [self->_hasFamilyMembers BOOLValue];
  unint64_t v15 = v14 ^ [(NSNumber *)self->_latestStoreTermsVersion unsignedLongLongValue];
  v16 = [(SUScriptDictionary *)self->_rawResponseData dictionary];
  uint64_t v17 = v12 ^ v15 ^ [v16 hash];

  return v17 ^ [self->_final BOOLValue];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (SUScriptSubscriptionStatusResponse *)a3;
  if (self == v4)
  {
    LOBYTE(v24) = 1;
    goto LABEL_26;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    LOBYTE(v24) = 0;
    goto LABEL_26;
  }
  NSUInteger v5 = v4;
  unint64_t v6 = [(NSNumber *)self->_acceptedStoreTermsVersion unsignedLongLongValue];
  if (v6 != [(NSNumber *)v5->_acceptedStoreTermsVersion unsignedLongLongValue]) {
    goto LABEL_22;
  }
  sessionIdentifier = self->_sessionIdentifier;
  if (sessionIdentifier != v5->_sessionIdentifier
    && !-[NSString isEqualToString:](sessionIdentifier, "isEqualToString:"))
  {
    goto LABEL_22;
  }
  accountStatus = self->_accountStatus;
  if (accountStatus != v5->_accountStatus && !-[NSString isEqualToString:](accountStatus, "isEqualToString:")) {
    goto LABEL_22;
  }
  int v9 = [self->_subscribed BOOLValue];
  if (v9 != [v5->_subscribed BOOLValue]) {
    goto LABEL_22;
  }
  carrierBundlingStatus = self->_carrierBundlingStatus;
  if (carrierBundlingStatus != v5->_carrierBundlingStatus
    && !-[NSString isEqualToString:](carrierBundlingStatus, "isEqualToString:"))
  {
    goto LABEL_22;
  }
  if (self->_carrierBundlingErrorCode != v5->_carrierBundlingErrorCode) {
    goto LABEL_22;
  }
  int v11 = [self->_discoveryModeEligible BOOLValue];
  if (v11 != [v5->_discoveryModeEligible BOOLValue]) {
    goto LABEL_22;
  }
  eligibilityStatus = self->_eligibilityStatus;
  if (eligibilityStatus != v5->_eligibilityStatus
    && !-[NSString isEqualToString:](eligibilityStatus, "isEqualToString:"))
  {
    goto LABEL_22;
  }
  int v13 = [self->_familyOrganizer BOOLValue];
  if (v13 != [v5->_familyOrganizer BOOLValue]) {
    goto LABEL_22;
  }
  int v14 = [self->_familySubscription BOOLValue];
  if (v14 != [v5->_familySubscription BOOLValue]) {
    goto LABEL_22;
  }
  int v15 = [self->_hasFamily BOOLValue];
  if (v15 != [v5->_hasFamily BOOLValue]) {
    goto LABEL_22;
  }
  int v16 = [self->_hasFamilyMembers BOOLValue];
  if (v16 != [v5->_hasFamilyMembers BOOLValue]) {
    goto LABEL_22;
  }
  unint64_t v17 = [(NSNumber *)self->_latestStoreTermsVersion unsignedLongLongValue];
  if (v17 != [(NSNumber *)v5->_latestStoreTermsVersion unsignedLongLongValue]) {
    goto LABEL_22;
  }
  v18 = [(SUScriptDictionary *)self->_rawResponseData dictionary];
  uint64_t v19 = [(SUScriptDictionary *)v5->_rawResponseData dictionary];
  if (v18 == (void *)v19)
  {

    goto LABEL_28;
  }
  unint64_t v20 = (void *)v19;
  unint64_t v21 = [(SUScriptDictionary *)self->_rawResponseData dictionary];
  v22 = [(SUScriptDictionary *)v5->_rawResponseData dictionary];
  int v23 = [v21 isEqualToDictionary:v22];

  if (v23)
  {
LABEL_28:
    int v26 = [self->_final BOOLValue];
    int v24 = v26 ^ [v5->_final BOOLValue] ^ 1;
    goto LABEL_23;
  }
LABEL_22:
  LOBYTE(v24) = 0;
LABEL_23:

LABEL_26:
  return v24;
}

- (id)_className
{
  return @"iTunesSubscriptionStatusResponse";
}

- (NSString)accountIdentifier
{
  return (NSString *)&stru_26DB8C5F8;
}

- (NSString)accountStatusNeedsAuthentication
{
  return (NSString *)@"needsAuthentication";
}

- (NSString)accountStatusNotSubscribed
{
  return (NSString *)@"notSubscribed";
}

- (NSString)accountStatusSubscribed
{
  return (NSString *)@"subscribed";
}

- (NSString)accountStatusUnknown
{
  return (NSString *)@"unknown";
}

- (NSString)eligibilityStatusEligible
{
  return (NSString *)@"eligible";
}

- (NSString)eligibilityStatusNotEligible
{
  return (NSString *)@"notEligible";
}

- (NSString)eligibilityStatusUnknown
{
  return (NSString *)@"unknown";
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(id)__KeyMapping_53 objectForKey:v4];
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptSubscriptionStatusResponse;
    NSUInteger v5 = objc_msgSendSuper2(&v7, sel_webScriptNameForKeyName_, v4);
  }

  return v5;
}

- (id)scriptAttributeKeys
{
  v5.receiver = self;
  v5.super_class = (Class)SUScriptSubscriptionStatusResponse;
  v2 = [(SUScriptObject *)&v5 scriptAttributeKeys];
  unint64_t v3 = [(id)__KeyMapping_53 allKeys];
  [v2 addObjectsFromArray:v3];

  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)__KeyMapping_53;
    __KeyMapping_53 = (uint64_t)&unk_26DBD7C60;
  }
}

- (NSNumber)acceptedStoreTermsVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)accountStatus
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)carrierBundlingStatus
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (NSNumber)carrierBundlingErrorCode
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (id)isDiscoveryModeEligible
{
  return objc_getProperty(self, a2, 104, 1);
}

- (NSString)eligibilityStatus
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (id)isFamilyOrganizer
{
  return objc_getProperty(self, a2, 120, 1);
}

- (id)isFamilySubscription
{
  return objc_getProperty(self, a2, 128, 1);
}

- (id)isFinal
{
  return objc_getProperty(self, a2, 136, 1);
}

- (id)hasFamily
{
  return objc_getProperty(self, a2, 144, 1);
}

- (id)hasFamilyMembers
{
  return objc_getProperty(self, a2, 152, 1);
}

- (NSNumber)latestStoreTermsVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 160, 1);
}

- (SUScriptDictionary)rawResponseData
{
  return (SUScriptDictionary *)objc_getProperty(self, a2, 168, 1);
}

- (NSString)sessionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (id)isSubscribed
{
  return objc_getProperty(self, a2, 184, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_subscribed, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_rawResponseData, 0);
  objc_storeStrong((id *)&self->_latestStoreTermsVersion, 0);
  objc_storeStrong(&self->_hasFamilyMembers, 0);
  objc_storeStrong(&self->_hasFamily, 0);
  objc_storeStrong(&self->_final, 0);
  objc_storeStrong(&self->_familySubscription, 0);
  objc_storeStrong(&self->_familyOrganizer, 0);
  objc_storeStrong((id *)&self->_eligibilityStatus, 0);
  objc_storeStrong(&self->_discoveryModeEligible, 0);
  objc_storeStrong((id *)&self->_carrierBundlingErrorCode, 0);
  objc_storeStrong((id *)&self->_carrierBundlingStatus, 0);
  objc_storeStrong((id *)&self->_accountStatus, 0);

  objc_storeStrong((id *)&self->_acceptedStoreTermsVersion, 0);
}

@end