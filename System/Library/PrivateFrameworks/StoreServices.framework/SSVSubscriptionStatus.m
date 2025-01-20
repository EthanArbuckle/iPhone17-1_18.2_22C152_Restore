@interface SSVSubscriptionStatus
- (BOOL)hasFamily;
- (BOOL)hasFamilyMembers;
- (BOOL)hasOfflineSlot;
- (BOOL)hasOfflineSlots;
- (BOOL)isDiscoveryModeEligible;
- (BOOL)isEqualToStatus:(id)a3;
- (BOOL)isFamilyOrganizer;
- (BOOL)isFamilySubscription;
- (BOOL)isFreeTrialIneligible;
- (BOOL)isSubscribed;
- (BOOL)isSubscriptionPurchaser;
- (NSArray)accountPermissions;
- (NSDate)subscriptionExpirationDate;
- (NSDictionary)rawResponseData;
- (NSNumber)accountIdentifier;
- (NSString)cellularOperatorName;
- (NSString)description;
- (NSString)phoneNumber;
- (NSString)sessionIdentifier;
- (SSVSubscriptionStatus)initWithUserDefaultsRepresentation:(id)a3;
- (SSVSubscriptionStatus)initWithXPCEncoding:(id)a3;
- (id)copyUserDefaultsRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (int64_t)accountStatus;
- (int64_t)carrierBundlingErrorCode;
- (int64_t)carrierBundlingStatus;
- (unint64_t)acceptedStoreTermsVersion;
- (unint64_t)latestStoreTermsVersion;
- (void)_setSubscribed:(BOOL)a3;
- (void)resetAccountBasedProperties;
- (void)resetCarrierBundlingProperties;
- (void)setAcceptedStoreTermsVersion:(unint64_t)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setAccountPermissions:(id)a3;
- (void)setAccountStatus:(int64_t)a3;
- (void)setCarrierBundlingErrorCode:(int64_t)a3;
- (void)setCarrierBundlingStatus:(int64_t)a3;
- (void)setCellularOperatorName:(id)a3;
- (void)setDiscoveryModeEligible:(BOOL)a3;
- (void)setFamilyOrganizer:(BOOL)a3;
- (void)setFamilySubscription:(BOOL)a3;
- (void)setFreeTrialIneligible:(BOOL)a3;
- (void)setHasFamily:(BOOL)a3;
- (void)setHasFamilyMembers:(BOOL)a3;
- (void)setHasOfflineSlots:(BOOL)a3;
- (void)setLatestStoreTermsVersion:(unint64_t)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setRawResponseData:(id)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)setSubscriptionExpirationDate:(id)a3;
- (void)setSubscriptionPurchaser:(BOOL)a3;
- (void)setValuesUsingStatusDictionary:(id)a3;
@end

@implementation SSVSubscriptionStatus

- (BOOL)isSubscribed
{
  return self->_accountStatus == 3;
}

- (NSDate)subscriptionExpirationDate
{
  if (self->_subscriptionExpirationTime <= 2.22044605e-16)
  {
    v2 = 0;
  }
  else
  {
    v2 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
  }
  return (NSDate *)v2;
}

- (NSString)description
{
  unint64_t accountStatus = self->_accountStatus;
  if (accountStatus > 4) {
    v4 = 0;
  }
  else {
    v4 = off_1E5BAD8F8[accountStatus];
  }
  unint64_t carrierBundlingStatus = self->_carrierBundlingStatus;
  if (carrierBundlingStatus > 4) {
    v6 = 0;
  }
  else {
    v6 = off_1E5BAD920[carrierBundlingStatus];
  }
  v7 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)SSVSubscriptionStatus;
  v8 = [(SSVSubscriptionStatus *)&v11 description];
  v9 = [v7 stringWithFormat:@"%@ accountIdentifier %@ accountStatus %@ carrierBundlingStatus: %@", v8, self->_accountIdentifier, v4, v6];

  return (NSString *)v9;
}

- (SSVSubscriptionStatus)initWithUserDefaultsRepresentation:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v41.receiver = self;
    v41.super_class = (Class)SSVSubscriptionStatus;
    v5 = [(SSVSubscriptionStatus *)&v41 init];
    if (v5)
    {
      v6 = [v4 objectForKey:@"aid"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(SSVSubscriptionStatus *)v5 setAccountIdentifier:v6];
      }
      v7 = [v4 objectForKey:@"astv"];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        -[SSVSubscriptionStatus setAcceptedStoreTermsVersion:](v5, "setAcceptedStoreTermsVersion:", [v7 unsignedLongLongValue]);
      }
      v8 = [v4 objectForKey:@"cb"];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        -[SSVSubscriptionStatus setCarrierBundlingStatus:](v5, "setCarrierBundlingStatus:", [v8 integerValue]);
      }
      v9 = [v4 objectForKey:@"cbec"];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        -[SSVSubscriptionStatus setCarrierBundlingErrorCode:](v5, "setCarrierBundlingErrorCode:", [v9 integerValue]);
      }
      v10 = [v4 objectForKey:@"con"];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(SSVSubscriptionStatus *)v5 setCellularOperatorName:v10];
      }
      objc_super v11 = [v4 objectForKey:@"dm"];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        -[SSVSubscriptionStatus setDiscoveryModeEligible:](v5, "setDiscoveryModeEligible:", [v11 BOOLValue]);
      }
      v12 = [v4 objectForKey:@"exp"];

      if (objc_opt_respondsToSelector())
      {
        id v13 = objc_alloc(MEMORY[0x1E4F1C9C8]);
        [v12 doubleValue];
        v14 = objc_msgSend(v13, "initWithTimeIntervalSinceReferenceDate:");
        [(SSVSubscriptionStatus *)v5 setSubscriptionExpirationDate:v14];
      }
      v15 = [v4 objectForKey:@"hoh"];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        -[SSVSubscriptionStatus setFamilyOrganizer:](v5, "setFamilyOrganizer:", [v15 BOOLValue]);
      }
      v16 = [v4 objectForKey:@"fs"];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        -[SSVSubscriptionStatus setFamilySubscription:](v5, "setFamilySubscription:", [v16 BOOLValue]);
      }
      v17 = [v4 objectForKey:@"ft"];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        -[SSVSubscriptionStatus setFreeTrialIneligible:](v5, "setFreeTrialIneligible:", [v17 BOOLValue]);
      }
      v18 = [v4 objectForKey:@"hf"];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        -[SSVSubscriptionStatus setHasFamily:](v5, "setHasFamily:", [v18 BOOLValue]);
      }
      v19 = [v4 objectForKey:@"hfm"];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        -[SSVSubscriptionStatus setHasFamilyMembers:](v5, "setHasFamilyMembers:", [v19 BOOLValue]);
      }
      v20 = [v4 objectForKey:@"hos"];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        -[SSVSubscriptionStatus setHasOfflineSlots:](v5, "setHasOfflineSlots:", [v20 BOOLValue]);
      }
      v21 = [v4 objectForKey:@"lstv"];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        -[SSVSubscriptionStatus setLatestStoreTermsVersion:](v5, "setLatestStoreTermsVersion:", [v21 unsignedLongLongValue]);
      }
      v22 = [v4 objectForKey:@"pn"];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(SSVSubscriptionStatus *)v5 setPhoneNumber:v22];
      }
      v23 = [v4 objectForKey:@"pur"];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        -[SSVSubscriptionStatus setSubscriptionPurchaser:](v5, "setSubscriptionPurchaser:", [v23 BOOLValue]);
      }
      v24 = [v4 objectForKey:@"sid"];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(SSVSubscriptionStatus *)v5 setSessionIdentifier:v24];
      }
      v25 = [v4 objectForKey:@"ast"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        -[SSVSubscriptionStatus setAccountStatus:](v5, "setAccountStatus:", [v25 integerValue]);
      }
      else
      {
        v26 = [v4 objectForKey:@"sb"];

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          -[SSVSubscriptionStatus _setSubscribed:](v5, "_setSubscribed:", [v26 BOOLValue]);
        }
        v25 = v26;
      }
      v27 = [v4 objectForKey:@"prms"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v29 = v27;
        uint64_t v30 = [v29 countByEnumeratingWithState:&v37 objects:v42 count:16];
        if (v30)
        {
          uint64_t v31 = v30;
          uint64_t v32 = *(void *)v38;
          do
          {
            uint64_t v33 = 0;
            do
            {
              if (*(void *)v38 != v32) {
                objc_enumerationMutation(v29);
              }
              uint64_t v34 = *(void *)(*((void *)&v37 + 1) + 8 * v33);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(v28, "addObject:", v34, (void)v37);
              }
              ++v33;
            }
            while (v31 != v33);
            uint64_t v31 = [v29 countByEnumeratingWithState:&v37 objects:v42 count:16];
          }
          while (v31);
        }

        [(SSVSubscriptionStatus *)v5 setAccountPermissions:v28];
      }
      v35 = objc_msgSend(v4, "objectForKey:", @"raw", (void)v37);

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(SSVSubscriptionStatus *)v5 setRawResponseData:v35];
      }
    }
  }
  else
  {

    v5 = 0;
  }

  return v5;
}

- (id)copyUserDefaultsRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = v3;
  accountIdentifier = self->_accountIdentifier;
  if (accountIdentifier) {
    [v3 setObject:accountIdentifier forKey:@"aid"];
  }
  accountPermissions = self->_accountPermissions;
  if (accountPermissions) {
    [v4 setObject:accountPermissions forKey:@"prms"];
  }
  cellularOperatorName = self->_cellularOperatorName;
  if (cellularOperatorName) {
    [v4 setObject:cellularOperatorName forKey:@"con"];
  }
  phoneNumber = self->_phoneNumber;
  if (phoneNumber) {
    [v4 setObject:phoneNumber forKey:@"pn"];
  }
  sessionIdentifier = self->_sessionIdentifier;
  if (sessionIdentifier) {
    [v4 setObject:sessionIdentifier forKey:@"sid"];
  }
  v10 = [NSNumber numberWithInteger:self->_accountStatus];
  [v4 setObject:v10 forKey:@"ast"];

  objc_super v11 = [NSNumber numberWithUnsignedLongLong:self->_acceptedStoreTermsVersion];
  [v4 setObject:v11 forKey:@"astv"];

  v12 = [NSNumber numberWithInteger:self->_carrierBundlingStatus];
  [v4 setObject:v12 forKey:@"cb"];

  id v13 = [NSNumber numberWithInteger:self->_carrierBundlingErrorCode];
  [v4 setObject:v13 forKey:@"cbec"];

  v14 = [NSNumber numberWithBool:self->_discoveryModeEligible];
  [v4 setObject:v14 forKey:@"dm"];

  v15 = [NSNumber numberWithDouble:self->_subscriptionExpirationTime];
  [v4 setObject:v15 forKey:@"exp"];

  v16 = [NSNumber numberWithBool:self->_familyOrganizer];
  [v4 setObject:v16 forKey:@"hoh"];

  v17 = [NSNumber numberWithBool:self->_familySubscription];
  [v4 setObject:v17 forKey:@"fs"];

  v18 = [NSNumber numberWithBool:self->_freeTrialIneligible];
  [v4 setObject:v18 forKey:@"ft"];

  v19 = [NSNumber numberWithBool:self->_hasFamily];
  [v4 setObject:v19 forKey:@"hf"];

  v20 = [NSNumber numberWithBool:self->_hasFamilyMembers];
  [v4 setObject:v20 forKey:@"hfm"];

  v21 = [NSNumber numberWithBool:self->_hasOfflineSlots];
  [v4 setObject:v21 forKey:@"hos"];

  v22 = [NSNumber numberWithUnsignedLongLong:self->_latestStoreTermsVersion];
  [v4 setObject:v22 forKey:@"lstv"];

  v23 = [NSNumber numberWithBool:self->_subscriptionPurchaser];
  [v4 setObject:v23 forKey:@"pur"];

  rawResponseData = self->_rawResponseData;
  if (rawResponseData) {
    [v4 setObject:rawResponseData forKey:@"raw"];
  }
  return v4;
}

- (void)resetAccountBasedProperties
{
  [(SSVSubscriptionStatus *)self setAccountIdentifier:0];
  [(SSVSubscriptionStatus *)self setAccountPermissions:0];
  [(SSVSubscriptionStatus *)self setAccountStatus:0];
  [(SSVSubscriptionStatus *)self setFamilyOrganizer:0];
  [(SSVSubscriptionStatus *)self setFamilySubscription:0];
  [(SSVSubscriptionStatus *)self setFreeTrialIneligible:0];
  [(SSVSubscriptionStatus *)self setHasFamily:0];
  [(SSVSubscriptionStatus *)self setHasFamilyMembers:0];
  [(SSVSubscriptionStatus *)self setHasOfflineSlots:0];
  [(SSVSubscriptionStatus *)self setSubscriptionExpirationDate:0];
  [(SSVSubscriptionStatus *)self setAcceptedStoreTermsVersion:0];
  [(SSVSubscriptionStatus *)self setLatestStoreTermsVersion:0];
  [(SSVSubscriptionStatus *)self setSubscriptionPurchaser:0];
}

- (void)resetCarrierBundlingProperties
{
  [(SSVSubscriptionStatus *)self setCarrierBundlingStatus:0];
  [(SSVSubscriptionStatus *)self setCarrierBundlingErrorCode:0];
  [(SSVSubscriptionStatus *)self setCellularOperatorName:0];
  [(SSVSubscriptionStatus *)self setPhoneNumber:0];
  [(SSVSubscriptionStatus *)self setSessionIdentifier:0];
}

- (void)setSubscriptionExpirationDate:(id)a3
{
  [a3 timeIntervalSinceReferenceDate];
  self->_subscriptionExpirationTime = v4;
}

- (void)setValuesUsingStatusDictionary:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(SSVSubscriptionStatus *)self setRawResponseData:v4];
  v5 = [v4 objectForKey:@"music"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v5 = 0;
  }
  v6 = [v5 objectForKey:@"reason"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  v8 = [v5 objectForKey:@"expirationDate"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v9 = [v8 unsignedLongLongValue];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_12;
    }
    unint64_t v9 = strtoull((const char *)[v8 UTF8String], 0, 10);
  }
  if (v9)
  {
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:(double)v9 / 1000.0];
    [(SSVSubscriptionStatus *)self setSubscriptionExpirationDate:v10];
  }
LABEL_12:
  long long v40 = v8;
  objc_super v11 = [v5 objectForKey:@"isPurchaser"];

  if (objc_opt_respondsToSelector()) {
    -[SSVSubscriptionStatus setSubscriptionPurchaser:](self, "setSubscriptionPurchaser:", [v11 BOOLValue]);
  }
  v12 = [v5 objectForKey:@"hasOfflineSlots"];

  if (objc_opt_respondsToSelector()) {
    -[SSVSubscriptionStatus setHasOfflineSlots:](self, "setHasOfflineSlots:", [v12 BOOLValue]);
  }
  id v13 = [v5 objectForKey:@"isNotEligibleForFreeTrial"];

  if (objc_opt_respondsToSelector()) {
    -[SSVSubscriptionStatus setFreeTrialIneligible:](self, "setFreeTrialIneligible:", [v13 BOOLValue]);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14 = [v5 objectForKey:@"status"];
  }
  else
  {
    v14 = 0;
  }
  objc_opt_class();
  v42 = v14;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = [v4 objectForKey:@"isFuseEnabled"];
    if (objc_opt_respondsToSelector()) {
      [(SSVSubscriptionStatus *)self setAccountStatus:3];
    }

    v14 = v42;
    goto LABEL_43;
  }
  if ([v14 isEqualToString:@"Enabled"])
  {
    [(SSVSubscriptionStatus *)self setAccountStatus:3];
    v15 = [v5 objectForKey:@"source"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v15 isEqualToString:@"Apple"]) {
        goto LABEL_28;
      }
      if ([v15 isEqualToString:@"Carrier"])
      {
LABEL_27:
        [(SSVSubscriptionStatus *)self setCarrierBundlingStatus:1];
        goto LABEL_28;
      }
    }
    if ([v7 isEqualToString:@"Carrier"]) {
      goto LABEL_27;
    }
LABEL_28:
    if ([v7 isEqualToString:@"Family"]) {
      [(SSVSubscriptionStatus *)self setFamilySubscription:1];
    }

    goto LABEL_43;
  }
  if ([v14 isEqualToString:@"Glide"])
  {
    v17 = self;
    uint64_t v18 = 4;
  }
  else
  {
    if (![v14 isEqualToString:@"Disabled"])
    {
      if ([v14 isEqualToString:@"Discovery"])
      {
        [(SSVSubscriptionStatus *)self setDiscoveryModeEligible:1];
      }
      else if ([v14 isEqualToString:@"Unlinked"])
      {
        [(SSVSubscriptionStatus *)self setCarrierBundlingStatus:4];
      }
      goto LABEL_43;
    }
    if ([v7 isEqualToString:@"InvalidToken"])
    {
      v17 = self;
      uint64_t v18 = 1;
    }
    else
    {
      v17 = self;
      uint64_t v18 = 2;
    }
  }
  [(SSVSubscriptionStatus *)v17 setAccountStatus:v18];
LABEL_43:
  v19 = [v4 objectForKey:@"family"];
  objc_opt_class();
  uint64_t v43 = v19;
  if (objc_opt_isKindOfClass())
  {
    v20 = [v19 objectForKey:@"hasFamily"];
    if (objc_opt_respondsToSelector()) {
      -[SSVSubscriptionStatus setHasFamily:](self, "setHasFamily:", [v20 BOOLValue]);
    }
    v21 = [v19 objectForKey:@"hasFamilyGreaterThanOneMember"];

    if (objc_opt_respondsToSelector()) {
      -[SSVSubscriptionStatus setHasFamilyMembers:](self, "setHasFamilyMembers:", [v21 BOOLValue]);
    }
    v22 = [v19 objectForKey:@"isHoH"];

    if (objc_opt_respondsToSelector()) {
      -[SSVSubscriptionStatus setFamilyOrganizer:](self, "setFamilyOrganizer:", [v22 BOOLValue]);
    }

    v14 = v42;
  }
  v23 = [v4 objectForKey:@"terms"];
  objc_opt_class();
  objc_super v41 = v7;
  long long v39 = v23;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v30 = 0;
    uint64_t v25 = 0;
    goto LABEL_76;
  }
  long long v38 = v13;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v24 = v23;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (!v25)
  {
    uint64_t v30 = 0;
    id v31 = v24;
    goto LABEL_75;
  }
  v36 = self;
  id v37 = v4;
  uint64_t v26 = *(void *)v45;
LABEL_54:
  uint64_t v27 = 0;
  while (1)
  {
    if (*(void *)v45 != v26) {
      objc_enumerationMutation(v24);
    }
    id v28 = *(void **)(*((void *)&v44 + 1) + 8 * v27);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_60;
    }
    id v29 = [v28 objectForKey:@"type"];
    if (![v29 compare:@"Store" options:1]) {
      break;
    }

LABEL_60:
    if (v25 == ++v27)
    {
      uint64_t v25 = [v24 countByEnumeratingWithState:&v44 objects:v48 count:16];
      if (v25) {
        goto LABEL_54;
      }
      uint64_t v30 = 0;
      id v31 = v24;
      self = v36;
      id v4 = v37;
      goto LABEL_74;
    }
  }
  id v31 = v28;

  if (!v31)
  {
    uint64_t v30 = 0;
    uint64_t v25 = 0;
    self = v36;
    id v4 = v37;
    id v13 = v38;
    v14 = v42;
    goto LABEL_76;
  }
  uint64_t v32 = [v31 objectForKey:@"agreedToTerms"];
  self = v36;
  id v4 = v37;
  if (objc_opt_respondsToSelector()) {
    uint64_t v30 = [v32 unsignedLongLongValue];
  }
  else {
    uint64_t v30 = 0;
  }
  uint64_t v33 = [v31 objectForKey:@"latestTerms"];

  if (objc_opt_respondsToSelector()) {
    uint64_t v25 = [v33 unsignedLongLongValue];
  }
  else {
    uint64_t v25 = 0;
  }

LABEL_74:
  v14 = v42;
LABEL_75:

  id v13 = v38;
LABEL_76:
  [(SSVSubscriptionStatus *)self setAcceptedStoreTermsVersion:v30];
  [(SSVSubscriptionStatus *)self setLatestStoreTermsVersion:v25];
  uint64_t v34 = [v5 objectForKey:@"isAdmin"];
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v34 BOOLValue])
  {
    v35 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"admin", @"social", 0);
    [(SSVSubscriptionStatus *)self setAccountPermissions:v35];

    v14 = v42;
  }
}

- (BOOL)isEqualToStatus:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SSVSubscriptionStatus *)self rawResponseData];
  uint64_t v6 = [v4 rawResponseData];

  char v7 = (v5 | v6) == 0;
  if (v6) {
    char v7 = [(id)v5 isEqualToDictionary:v6];
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (double *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(SSVSubscriptionStatus *)self accountIdentifier];
  [v4 setAccountIdentifier:v5];

  uint64_t v6 = [(SSVSubscriptionStatus *)self accountPermissions];
  [v4 setAccountPermissions:v6];

  objc_msgSend(v4, "setAccountStatus:", -[SSVSubscriptionStatus accountStatus](self, "accountStatus"));
  objc_msgSend(v4, "setAcceptedStoreTermsVersion:", -[SSVSubscriptionStatus acceptedStoreTermsVersion](self, "acceptedStoreTermsVersion"));
  objc_msgSend(v4, "setCarrierBundlingStatus:", -[SSVSubscriptionStatus carrierBundlingStatus](self, "carrierBundlingStatus"));
  objc_msgSend(v4, "setCarrierBundlingErrorCode:", -[SSVSubscriptionStatus carrierBundlingErrorCode](self, "carrierBundlingErrorCode"));
  char v7 = [(SSVSubscriptionStatus *)self cellularOperatorName];
  [v4 setCellularOperatorName:v7];

  objc_msgSend(v4, "setDiscoveryModeEligible:", -[SSVSubscriptionStatus isDiscoveryModeEligible](self, "isDiscoveryModeEligible"));
  objc_msgSend(v4, "setFamilyOrganizer:", -[SSVSubscriptionStatus isFamilyOrganizer](self, "isFamilyOrganizer"));
  objc_msgSend(v4, "setFamilySubscription:", -[SSVSubscriptionStatus isFamilySubscription](self, "isFamilySubscription"));
  objc_msgSend(v4, "setFreeTrialIneligible:", -[SSVSubscriptionStatus isFreeTrialIneligible](self, "isFreeTrialIneligible"));
  objc_msgSend(v4, "setHasFamily:", -[SSVSubscriptionStatus hasFamily](self, "hasFamily"));
  objc_msgSend(v4, "setHasFamilyMembers:", -[SSVSubscriptionStatus hasFamilyMembers](self, "hasFamilyMembers"));
  objc_msgSend(v4, "setHasOfflineSlots:", -[SSVSubscriptionStatus hasOfflineSlots](self, "hasOfflineSlots"));
  objc_msgSend(v4, "setLatestStoreTermsVersion:", -[SSVSubscriptionStatus latestStoreTermsVersion](self, "latestStoreTermsVersion"));
  v8 = [(SSVSubscriptionStatus *)self phoneNumber];
  [v4 setPhoneNumber:v8];

  unint64_t v9 = [(SSVSubscriptionStatus *)self rawResponseData];
  [v4 setRawResponseData:v9];

  v10 = [(SSVSubscriptionStatus *)self sessionIdentifier];
  [v4 setSessionIdentifier:v10];

  v4[12] = self->_subscriptionExpirationTime;
  objc_msgSend(v4, "setSubscriptionPurchaser:", -[SSVSubscriptionStatus isSubscriptionPurchaser](self, "isSubscriptionPurchaser"));
  return v4;
}

- (SSVSubscriptionStatus)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && MEMORY[0x1A62689E0](v4) == MEMORY[0x1E4F14590])
  {
    v28.receiver = self;
    v28.super_class = (Class)SSVSubscriptionStatus;
    uint64_t v6 = [(SSVSubscriptionStatus *)&v28 init];
    if (v6)
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = SSXPCDictionaryCopyObjectWithClass(v5, "0", v8);
      accountIdentifier = v6->_accountIdentifier;
      v6->_accountIdentifier = (NSNumber *)v9;

      v6->_unint64_t accountStatus = xpc_dictionary_get_int64(v5, "1");
      v6->_acceptedStoreTermsVersion = xpc_dictionary_get_uint64(v5, "13");
      v6->_unint64_t carrierBundlingStatus = xpc_dictionary_get_int64(v5, "2");
      v6->_carrierBundlingErrorCode = xpc_dictionary_get_int64(v5, "19");
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = SSXPCDictionaryCopyObjectWithClass(v5, "4", v11);
      cellularOperatorName = v6->_cellularOperatorName;
      v6->_cellularOperatorName = (NSString *)v12;

      v6->_discoveryModeEligible = xpc_dictionary_get_BOOL(v5, "3");
      v6->_familyOrganizer = xpc_dictionary_get_BOOL(v5, "9");
      v6->_familySubscription = xpc_dictionary_get_BOOL(v5, "8");
      v6->_freeTrialIneligible = xpc_dictionary_get_BOOL(v5, "18");
      v6->_hasFamily = xpc_dictionary_get_BOOL(v5, "10");
      v6->_hasFamilyMembers = xpc_dictionary_get_BOOL(v5, "11");
      v6->_hasOfflineSlots = xpc_dictionary_get_BOOL(v5, "16");
      v6->_latestStoreTermsVersion = xpc_dictionary_get_uint64(v5, "14");
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = SSXPCDictionaryCopyObjectWithClass(v5, "5", v14);
      phoneNumber = v6->_phoneNumber;
      v6->_phoneNumber = (NSString *)v15;

      uint64_t v17 = objc_opt_class();
      uint64_t v18 = SSXPCDictionaryCopyObjectWithClass(v5, "17", v17);
      rawResponseData = v6->_rawResponseData;
      v6->_rawResponseData = (NSDictionary *)v18;

      uint64_t v20 = objc_opt_class();
      uint64_t v21 = SSXPCDictionaryCopyObjectWithClass(v5, "6", v20);
      sessionIdentifier = v6->_sessionIdentifier;
      v6->_sessionIdentifier = (NSString *)v21;

      v6->_subscriptionExpirationTime = xpc_dictionary_get_double(v5, "12");
      v6->_subscriptionPurchaser = xpc_dictionary_get_BOOL(v5, "15");
      v23 = xpc_dictionary_get_value(v5, "7");
      uint64_t v24 = objc_opt_class();
      id v25 = SSXPCCreateNSArrayFromCFTypeArray(v23, v24);
      uint64_t v26 = [v25 copy];
      accountPermissions = v6->_accountPermissions;
      v6->_accountPermissions = (NSArray *)v26;
    }
  }
  else
  {

    uint64_t v6 = 0;
  }

  return v6;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetObject(v3, "0", self->_accountIdentifier);
  SSXPCDictionarySetObject(v3, "7", self->_accountPermissions);
  xpc_dictionary_set_int64(v3, "1", [(SSVSubscriptionStatus *)self accountStatus]);
  xpc_dictionary_set_uint64(v3, "13", self->_acceptedStoreTermsVersion);
  xpc_dictionary_set_int64(v3, "2", [(SSVSubscriptionStatus *)self carrierBundlingStatus]);
  xpc_dictionary_set_int64(v3, "19", [(SSVSubscriptionStatus *)self carrierBundlingErrorCode]);
  SSXPCDictionarySetObject(v3, "4", self->_cellularOperatorName);
  xpc_dictionary_set_BOOL(v3, "3", [(SSVSubscriptionStatus *)self isDiscoveryModeEligible]);
  xpc_dictionary_set_BOOL(v3, "9", [(SSVSubscriptionStatus *)self isFamilyOrganizer]);
  xpc_dictionary_set_BOOL(v3, "8", [(SSVSubscriptionStatus *)self isFamilySubscription]);
  xpc_dictionary_set_BOOL(v3, "18", [(SSVSubscriptionStatus *)self isFreeTrialIneligible]);
  xpc_dictionary_set_BOOL(v3, "10", [(SSVSubscriptionStatus *)self hasFamily]);
  xpc_dictionary_set_BOOL(v3, "11", [(SSVSubscriptionStatus *)self hasFamilyMembers]);
  xpc_dictionary_set_BOOL(v3, "16", [(SSVSubscriptionStatus *)self hasOfflineSlots]);
  xpc_dictionary_set_uint64(v3, "14", self->_latestStoreTermsVersion);
  SSXPCDictionarySetObject(v3, "5", self->_phoneNumber);
  SSXPCDictionarySetObject(v3, "17", self->_rawResponseData);
  SSXPCDictionarySetObject(v3, "6", self->_sessionIdentifier);
  xpc_dictionary_set_double(v3, "12", self->_subscriptionExpirationTime);
  xpc_dictionary_set_BOOL(v3, "15", self->_subscriptionPurchaser);
  return v3;
}

- (void)_setSubscribed:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 3;
  }
  else {
    uint64_t v3 = 2;
  }
  [(SSVSubscriptionStatus *)self setAccountStatus:v3];
}

- (NSNumber)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSArray)accountPermissions
{
  return self->_accountPermissions;
}

- (void)setAccountPermissions:(id)a3
{
}

- (int64_t)accountStatus
{
  return self->_accountStatus;
}

- (void)setAccountStatus:(int64_t)a3
{
  self->_unint64_t accountStatus = a3;
}

- (unint64_t)acceptedStoreTermsVersion
{
  return self->_acceptedStoreTermsVersion;
}

- (void)setAcceptedStoreTermsVersion:(unint64_t)a3
{
  self->_acceptedStoreTermsVersion = a3;
}

- (int64_t)carrierBundlingStatus
{
  return self->_carrierBundlingStatus;
}

- (void)setCarrierBundlingStatus:(int64_t)a3
{
  self->_unint64_t carrierBundlingStatus = a3;
}

- (int64_t)carrierBundlingErrorCode
{
  return self->_carrierBundlingErrorCode;
}

- (void)setCarrierBundlingErrorCode:(int64_t)a3
{
  self->_carrierBundlingErrorCode = a3;
}

- (NSString)cellularOperatorName
{
  return self->_cellularOperatorName;
}

- (void)setCellularOperatorName:(id)a3
{
}

- (BOOL)isDiscoveryModeEligible
{
  return self->_discoveryModeEligible;
}

- (void)setDiscoveryModeEligible:(BOOL)a3
{
  self->_discoveryModeEligible = a3;
}

- (BOOL)isFamilyOrganizer
{
  return self->_familyOrganizer;
}

- (void)setFamilyOrganizer:(BOOL)a3
{
  self->_familyOrganizer = a3;
}

- (BOOL)isFamilySubscription
{
  return self->_familySubscription;
}

- (void)setFamilySubscription:(BOOL)a3
{
  self->_familySubscription = a3;
}

- (BOOL)isFreeTrialIneligible
{
  return self->_freeTrialIneligible;
}

- (void)setFreeTrialIneligible:(BOOL)a3
{
  self->_freeTrialIneligible = a3;
}

- (BOOL)hasFamily
{
  return self->_hasFamily;
}

- (void)setHasFamily:(BOOL)a3
{
  self->_hasFamily = a3;
}

- (BOOL)hasFamilyMembers
{
  return self->_hasFamilyMembers;
}

- (void)setHasFamilyMembers:(BOOL)a3
{
  self->_hasFamilyMembers = a3;
}

- (BOOL)hasOfflineSlots
{
  return self->_hasOfflineSlots;
}

- (void)setHasOfflineSlots:(BOOL)a3
{
  self->_hasOfflineSlots = a3;
}

- (unint64_t)latestStoreTermsVersion
{
  return self->_latestStoreTermsVersion;
}

- (void)setLatestStoreTermsVersion:(unint64_t)a3
{
  self->_latestStoreTermsVersion = a3;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (NSDictionary)rawResponseData
{
  return self->_rawResponseData;
}

- (void)setRawResponseData:(id)a3
{
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (BOOL)isSubscriptionPurchaser
{
  return self->_subscriptionPurchaser;
}

- (void)setSubscriptionPurchaser:(BOOL)a3
{
  self->_subscriptionPurchaser = a3;
}

- (BOOL)hasOfflineSlot
{
  return self->_hasOfflineSlot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_rawResponseData, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_cellularOperatorName, 0);
  objc_storeStrong((id *)&self->_accountPermissions, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end