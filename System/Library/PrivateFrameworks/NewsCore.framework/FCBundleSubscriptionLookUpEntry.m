@interface FCBundleSubscriptionLookUpEntry
- (BOOL)hasShownRenewalNotice;
- (BOOL)inTrialPeriod;
- (BOOL)isAmplifyUser;
- (BOOL)isPaidBundleViaOfferActivated;
- (BOOL)isPurchaser;
- (FCBundleSubscriptionLookUpEntry)initWithEntryID:(id)a3 bundleChannelIDs:(id)a4 bundleChannelIDsVersion:(id)a5 purchaseID:(id)a6 purchaseValidationState:(unint64_t)a7 dateOfExpiration:(id)a8 hasShownRenewalNotice:(BOOL)a9 inTrialPeriod:(BOOL)a10 isPurchaser:(BOOL)a11 servicesBundlePurchaseID:(id)a12 isAmplifyUser:(BOOL)a13 isPaidBundleViaOfferActivated:(BOOL)a14 initialPurchaseTimestamp:(id)a15;
- (FCBundleSubscriptionLookUpEntry)initWithEntryID:(id)a3 dictionaryRepresentation:(id)a4;
- (NSArray)bundleChannelIDs;
- (NSDate)dateOfExpiration;
- (NSNumber)initialPurchaseTimestamp;
- (NSString)bundleChannelIDsVersion;
- (NSString)identifier;
- (NSString)purchaseID;
- (NSString)servicesBundlePurchaseID;
- (id)bundleSubscription;
- (id)description;
- (id)dictionaryRepresentation;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)purchaseValidationState;
- (void)setBundleChannelIDs:(id)a3;
- (void)setBundleChannelIDsVersion:(id)a3;
- (void)setDateOfExpiration:(id)a3;
- (void)setHasShownRenewalNotice:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setInTrialPeriod:(BOOL)a3;
- (void)setInitialPurchaseTimestamp:(id)a3;
- (void)setIsAmplifyUser:(BOOL)a3;
- (void)setIsPaidBundleViaOfferActivated:(BOOL)a3;
- (void)setIsPurchaser:(BOOL)a3;
- (void)setPurchaseID:(id)a3;
- (void)setPurchaseValidationState:(unint64_t)a3;
- (void)setServicesBundlePurchaseID:(id)a3;
@end

@implementation FCBundleSubscriptionLookUpEntry

- (FCBundleSubscriptionLookUpEntry)initWithEntryID:(id)a3 bundleChannelIDs:(id)a4 bundleChannelIDsVersion:(id)a5 purchaseID:(id)a6 purchaseValidationState:(unint64_t)a7 dateOfExpiration:(id)a8 hasShownRenewalNotice:(BOOL)a9 inTrialPeriod:(BOOL)a10 isPurchaser:(BOOL)a11 servicesBundlePurchaseID:(id)a12 isAmplifyUser:(BOOL)a13 isPaidBundleViaOfferActivated:(BOOL)a14 initialPurchaseTimestamp:(id)a15
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  id v22 = a4;
  id v23 = a5;
  id v24 = a6;
  id v25 = a8;
  id v26 = a12;
  id v27 = a15;
  if (!v21 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v45 = (void *)[[NSString alloc] initWithFormat:@"bundle subscription lookup entry must have an identifier"];
    *(_DWORD *)buf = 136315906;
    v49 = "-[FCBundleSubscriptionLookUpEntry initWithEntryID:bundleChannelIDs:bundleChannelIDsVersion:purchaseID:purchase"
          "ValidationState:dateOfExpiration:hasShownRenewalNotice:inTrialPeriod:isPurchaser:servicesBundlePurchaseID:isAm"
          "plifyUser:isPaidBundleViaOfferActivated:initialPurchaseTimestamp:]";
    __int16 v50 = 2080;
    v51 = "FCBundleSubscriptionLookUpEntry.m";
    __int16 v52 = 1024;
    int v53 = 63;
    __int16 v54 = 2114;
    v55 = v45;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v22) {
      goto LABEL_6;
    }
  }
  else if (v22)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v46 = (void *)[[NSString alloc] initWithFormat:@"bundle subscription lookup entry must have an array of bundle tag IDs"];
    *(_DWORD *)buf = 136315906;
    v49 = "-[FCBundleSubscriptionLookUpEntry initWithEntryID:bundleChannelIDs:bundleChannelIDsVersion:purchaseID:purchase"
          "ValidationState:dateOfExpiration:hasShownRenewalNotice:inTrialPeriod:isPurchaser:servicesBundlePurchaseID:isAm"
          "plifyUser:isPaidBundleViaOfferActivated:initialPurchaseTimestamp:]";
    __int16 v50 = 2080;
    v51 = "FCBundleSubscriptionLookUpEntry.m";
    __int16 v52 = 1024;
    int v53 = 64;
    __int16 v54 = 2114;
    v55 = v46;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  v47.receiver = self;
  v47.super_class = (Class)FCBundleSubscriptionLookUpEntry;
  v28 = [(FCBundleSubscriptionLookUpEntry *)&v47 init];
  v29 = v28;
  if (v28)
  {
    if (v21)
    {
      uint64_t v30 = [v21 copy];
      identifier = v29->_identifier;
      v29->_identifier = (NSString *)v30;

      uint64_t v32 = [v22 copy];
      bundleChannelIDs = v29->_bundleChannelIDs;
      v29->_bundleChannelIDs = (NSArray *)v32;

      uint64_t v34 = [v23 copy];
      bundleChannelIDsVersion = v29->_bundleChannelIDsVersion;
      v29->_bundleChannelIDsVersion = (NSString *)v34;

      uint64_t v36 = [v24 copy];
      purchaseID = v29->_purchaseID;
      v29->_purchaseID = (NSString *)v36;

      v29->_purchaseValidationState = a7;
      uint64_t v38 = [v25 copy];
      dateOfExpiration = v29->_dateOfExpiration;
      v29->_dateOfExpiration = (NSDate *)v38;

      v29->_hasShownRenewalNotice = a9;
      v29->_inTrialPeriod = a10;
      v29->_isPurchaser = a11;
      v29->_isAmplifyUser = a13;
      v29->_isPaidBundleViaOfferActivated = a14;
      uint64_t v40 = [v26 copy];
      servicesBundlePurchaseID = v29->_servicesBundlePurchaseID;
      v29->_servicesBundlePurchaseID = (NSString *)v40;

      uint64_t v42 = [v27 copy];
      initialPurchaseTimestamp = v29->_initialPurchaseTimestamp;
      v29->_initialPurchaseTimestamp = (NSNumber *)v42;
    }
    else
    {
      initialPurchaseTimestamp = v28;
      v29 = 0;
    }
  }
  return v29;
}

- (FCBundleSubscriptionLookUpEntry)initWithEntryID:(id)a3 dictionaryRepresentation:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v37 = v5;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v27 = (void *)[[NSString alloc] initWithFormat:@"bundle subscription lookup entry must have an identifier"];
    *(_DWORD *)buf = 136315906;
    v39 = "-[FCBundleSubscriptionLookUpEntry initWithEntryID:dictionaryRepresentation:]";
    __int16 v40 = 2080;
    v41 = "FCBundleSubscriptionLookUpEntry.m";
    __int16 v42 = 1024;
    int v43 = 95;
    __int16 v44 = 2114;
    v45 = v27;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v7 = [v6 objectForKeyedSubscript:@"BundleLookUpEntryPurchaseValidationState"];
  uint64_t v34 = [v6 objectForKeyedSubscript:@"BundleLookUpEntryBundleChannelIDsKey"];
  v33 = [v34 componentsSeparatedByString:@","];
  uint64_t v32 = [v6 objectForKeyedSubscript:@"BundleLookUpEntryPurchaseIDKey"];
  v31 = [v6 objectForKeyedSubscript:@"BundleLookUpEntryBundleChannelIDsVersionKey"];
  objc_opt_class();
  v8 = [v6 objectForKeyedSubscript:@"BundleLookUpEntryServicesBundlePurchaseIDKey"];
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }
  id v10 = v9;

  v35 = v7;
  int v11 = [v7 intValue];
  v12 = [v6 objectForKeyedSubscript:@"BundleLookUpEntryHasShownRenewalNotice"];
  char v30 = [v12 BOOLValue];

  v13 = [v6 objectForKeyedSubscript:@"BundleLookUpEntryInTrialPeriod"];
  char v14 = [v13 BOOLValue];

  v15 = [v6 objectForKeyedSubscript:@"BundleLookUpEntryIsPurchaser"];
  char v16 = [v15 BOOLValue];

  v17 = [v6 objectForKeyedSubscript:@"BundleLookUpEntryIsAmplifyUser"];
  char v18 = [v17 BOOLValue];

  v19 = [v6 objectForKeyedSubscript:@"BundleLookUpEntryPaidBundleViaOfferActivated"];
  char v20 = [v19 BOOLValue];

  id v21 = [v6 objectForKeyedSubscript:@"BundleLookUpEntryDateOfExpiration"];
  objc_opt_class();
  id v22 = [v6 objectForKeyedSubscript:@"BundleLookUpEntryInitialPurchaseTimestampKey"];
  if (v22)
  {
    if (objc_opt_isKindOfClass()) {
      id v23 = v22;
    }
    else {
      id v23 = 0;
    }
  }
  else
  {
    id v23 = 0;
  }
  id v24 = v23;

  BYTE1(v29) = v20;
  LOBYTE(v29) = v18;
  BYTE2(v28) = v16;
  BYTE1(v28) = v14;
  LOBYTE(v28) = v30;
  id v25 = -[FCBundleSubscriptionLookUpEntry initWithEntryID:bundleChannelIDs:bundleChannelIDsVersion:purchaseID:purchaseValidationState:dateOfExpiration:hasShownRenewalNotice:inTrialPeriod:isPurchaser:servicesBundlePurchaseID:isAmplifyUser:isPaidBundleViaOfferActivated:initialPurchaseTimestamp:](self, "initWithEntryID:bundleChannelIDs:bundleChannelIDsVersion:purchaseID:purchaseValidationState:dateOfExpiration:hasShownRenewalNotice:inTrialPeriod:isPurchaser:servicesBundlePurchaseID:isAmplifyUser:isPaidBundleViaOfferActivated:initialPurchaseTimestamp:", v37, v33, v31, v32, v11, v21, v28, v10, v29, v24);

  return v25;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[FCBundleSubscriptionLookUpEntry purchaseValidationState](self, "purchaseValidationState"));
  objc_msgSend(v3, "fc_safelySetObject:forKey:", v4, @"BundleLookUpEntryPurchaseValidationState");

  id v5 = [(FCBundleSubscriptionLookUpEntry *)self bundleChannelIDs];
  id v6 = [v5 componentsJoinedByString:@","];

  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v6, @"BundleLookUpEntryBundleChannelIDsKey");
  v7 = [(FCBundleSubscriptionLookUpEntry *)self purchaseID];
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v7, @"BundleLookUpEntryPurchaseIDKey");

  v8 = [(FCBundleSubscriptionLookUpEntry *)self bundleChannelIDsVersion];
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v8, @"BundleLookUpEntryBundleChannelIDsVersionKey");

  v9 = [(FCBundleSubscriptionLookUpEntry *)self servicesBundlePurchaseID];
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v9, @"BundleLookUpEntryServicesBundlePurchaseIDKey");

  id v10 = objc_msgSend(NSNumber, "numberWithBool:", -[FCBundleSubscriptionLookUpEntry hasShownRenewalNotice](self, "hasShownRenewalNotice"));
  objc_msgSend(v3, "fc_safelySetObject:forKey:", v10, @"BundleLookUpEntryHasShownRenewalNotice");

  int v11 = [(FCBundleSubscriptionLookUpEntry *)self dateOfExpiration];
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v11, @"BundleLookUpEntryDateOfExpiration");

  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[FCBundleSubscriptionLookUpEntry inTrialPeriod](self, "inTrialPeriod"));
  objc_msgSend(v3, "fc_safelySetObject:forKey:", v12, @"BundleLookUpEntryInTrialPeriod");

  v13 = objc_msgSend(NSNumber, "numberWithBool:", -[FCBundleSubscriptionLookUpEntry isPurchaser](self, "isPurchaser"));
  objc_msgSend(v3, "fc_safelySetObject:forKey:", v13, @"BundleLookUpEntryIsPurchaser");

  char v14 = objc_msgSend(NSNumber, "numberWithBool:", -[FCBundleSubscriptionLookUpEntry isAmplifyUser](self, "isAmplifyUser"));
  objc_msgSend(v3, "fc_safelySetObject:forKey:", v14, @"BundleLookUpEntryIsAmplifyUser");

  v15 = objc_msgSend(NSNumber, "numberWithBool:", -[FCBundleSubscriptionLookUpEntry isPaidBundleViaOfferActivated](self, "isPaidBundleViaOfferActivated"));
  objc_msgSend(v3, "fc_safelySetObject:forKey:", v15, @"BundleLookUpEntryPaidBundleViaOfferActivated");

  char v16 = [(FCBundleSubscriptionLookUpEntry *)self initialPurchaseTimestamp];
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v16, @"BundleLookUpEntryInitialPurchaseTimestampKey");

  v17 = (void *)[v3 copy];
  return v17;
}

- (id)bundleSubscription
{
  v3 = [(FCBundleSubscriptionLookUpEntry *)self purchaseID];
  v4 = [(FCBundleSubscriptionLookUpEntry *)self bundleChannelIDs];
  id v5 = [(FCBundleSubscriptionLookUpEntry *)self bundleChannelIDsVersion];
  HIDWORD(v21) = [(FCBundleSubscriptionLookUpEntry *)self inTrialPeriod];
  BOOL v6 = [(FCBundleSubscriptionLookUpEntry *)self isPurchaser];
  v7 = [(FCBundleSubscriptionLookUpEntry *)self servicesBundlePurchaseID];
  BOOL v8 = [(FCBundleSubscriptionLookUpEntry *)self isAmplifyUser];
  BOOL v9 = [(FCBundleSubscriptionLookUpEntry *)self isPaidBundleViaOfferActivated];
  id v22 = [(FCBundleSubscriptionLookUpEntry *)self initialPurchaseTimestamp];
  id v10 = v3;
  id v11 = v4;
  id v12 = v5;
  id v13 = v7;
  LOBYTE(v21) = v9;
  LOBYTE(v20) = v8;
  char v14 = [[FCBundleSubscription alloc] initWithBundlePurchaseID:v10 bundleChannelIDs:v11 bundleChannelIDsVersion:v12 inTrialPeriod:HIDWORD(v21) isPurchaser:v6 servicesBundlePurchaseID:v13 isAmplifyUser:v20 initialPurchaseTimestamp:v22 isPaidBundleViaOfferActivated:v21];
  v15 = NSNumber;
  char v16 = v14;
  v17 = [v15 numberWithUnsignedInteger:(char *)&v14[2]._bundleChannelIDsVersion + 3];
  char v18 = [NSNumber numberWithUnsignedInteger:-164 - (void)v14];
  objc_setAssociatedObject(v16, (char *)&v14->super.isa + 1, v17, (void *)1);
  objc_setAssociatedObject(v16, (const void *)(-164 - (void)v14), v18, (void *)1);

  return v16;
}

- (id)description
{
  unint64_t v3 = [(FCBundleSubscriptionLookUpEntry *)self purchaseValidationState];
  v4 = @"expired";
  if (v3 != 1) {
    v4 = 0;
  }
  if (v3) {
    id v5 = v4;
  }
  else {
    id v5 = @"valid";
  }
  BOOL v6 = NSString;
  uint64_t v7 = objc_opt_class();
  BOOL v8 = [(FCBundleSubscriptionLookUpEntry *)self identifier];
  BOOL v9 = [(FCBundleSubscriptionLookUpEntry *)self bundleChannelIDsVersion];
  id v10 = [(FCBundleSubscriptionLookUpEntry *)self purchaseID];
  id v11 = [(FCBundleSubscriptionLookUpEntry *)self dateOfExpiration];
  objc_msgSend(v6, "stringWithFormat:", @"<%@: %p; id: %@ channelIDsVersion: %@ purchaseID: %@ validationState: %@ dateOfExpiration: %@ hasShownRenewalNotice: %d>",
    v7,
    self,
    v8,
    v9,
    v10,
    v5,
    v11,
  id v12 = [(FCBundleSubscriptionLookUpEntry *)self hasShownRenewalNotice]);

  return v12;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v5 = [+[FCBundleSubscriptionLookUpEntry allocWithZone:](FCBundleSubscriptionLookUpEntry, "allocWithZone:") init];
  BOOL v6 = (void *)[(NSString *)self->_identifier mutableCopyWithZone:a3];
  [(FCBundleSubscriptionLookUpEntry *)v5 setIdentifier:v6];

  uint64_t v7 = (void *)[(NSArray *)self->_bundleChannelIDs mutableCopyWithZone:a3];
  [(FCBundleSubscriptionLookUpEntry *)v5 setBundleChannelIDs:v7];

  BOOL v8 = (void *)[(NSString *)self->_bundleChannelIDsVersion mutableCopyWithZone:a3];
  [(FCBundleSubscriptionLookUpEntry *)v5 setBundleChannelIDsVersion:v8];

  BOOL v9 = (void *)[(NSString *)self->_purchaseID mutableCopyWithZone:a3];
  [(FCBundleSubscriptionLookUpEntry *)v5 setPurchaseID:v9];

  [(FCBundleSubscriptionLookUpEntry *)v5 setPurchaseValidationState:self->_purchaseValidationState];
  id v10 = (void *)[(NSDate *)self->_dateOfExpiration copyWithZone:a3];
  [(FCBundleSubscriptionLookUpEntry *)v5 setDateOfExpiration:v10];

  [(FCBundleSubscriptionLookUpEntry *)v5 setHasShownRenewalNotice:self->_hasShownRenewalNotice];
  [(FCBundleSubscriptionLookUpEntry *)v5 setInTrialPeriod:self->_inTrialPeriod];
  [(FCBundleSubscriptionLookUpEntry *)v5 setIsPurchaser:self->_isPurchaser];
  [(FCBundleSubscriptionLookUpEntry *)v5 setIsAmplifyUser:self->_isAmplifyUser];
  [(FCBundleSubscriptionLookUpEntry *)v5 setIsPaidBundleViaOfferActivated:self->_isPaidBundleViaOfferActivated];
  id v11 = (void *)[(NSString *)self->_servicesBundlePurchaseID mutableCopyWithZone:a3];
  [(FCBundleSubscriptionLookUpEntry *)v5 setServicesBundlePurchaseID:v11];

  id v12 = (void *)[(NSNumber *)self->_initialPurchaseTimestamp copyWithZone:a3];
  [(FCBundleSubscriptionLookUpEntry *)v5 setInitialPurchaseTimestamp:v12];

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)purchaseID
{
  return self->_purchaseID;
}

- (void)setPurchaseID:(id)a3
{
}

- (NSDate)dateOfExpiration
{
  return self->_dateOfExpiration;
}

- (void)setDateOfExpiration:(id)a3
{
}

- (unint64_t)purchaseValidationState
{
  return self->_purchaseValidationState;
}

- (void)setPurchaseValidationState:(unint64_t)a3
{
  self->_purchaseValidationState = a3;
}

- (BOOL)hasShownRenewalNotice
{
  return self->_hasShownRenewalNotice;
}

- (void)setHasShownRenewalNotice:(BOOL)a3
{
  self->_hasShownRenewalNotice = a3;
}

- (BOOL)inTrialPeriod
{
  return self->_inTrialPeriod;
}

- (void)setInTrialPeriod:(BOOL)a3
{
  self->_inTrialPeriod = a3;
}

- (BOOL)isPurchaser
{
  return self->_isPurchaser;
}

- (void)setIsPurchaser:(BOOL)a3
{
  self->_isPurchaser = a3;
}

- (BOOL)isAmplifyUser
{
  return self->_isAmplifyUser;
}

- (void)setIsAmplifyUser:(BOOL)a3
{
  self->_isAmplifyUser = a3;
}

- (BOOL)isPaidBundleViaOfferActivated
{
  return self->_isPaidBundleViaOfferActivated;
}

- (void)setIsPaidBundleViaOfferActivated:(BOOL)a3
{
  self->_isPaidBundleViaOfferActivated = a3;
}

- (NSString)servicesBundlePurchaseID
{
  return self->_servicesBundlePurchaseID;
}

- (void)setServicesBundlePurchaseID:(id)a3
{
}

- (NSArray)bundleChannelIDs
{
  return self->_bundleChannelIDs;
}

- (void)setBundleChannelIDs:(id)a3
{
}

- (NSString)bundleChannelIDsVersion
{
  return self->_bundleChannelIDsVersion;
}

- (void)setBundleChannelIDsVersion:(id)a3
{
}

- (NSNumber)initialPurchaseTimestamp
{
  return self->_initialPurchaseTimestamp;
}

- (void)setInitialPurchaseTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialPurchaseTimestamp, 0);
  objc_storeStrong((id *)&self->_bundleChannelIDsVersion, 0);
  objc_storeStrong((id *)&self->_bundleChannelIDs, 0);
  objc_storeStrong((id *)&self->_servicesBundlePurchaseID, 0);
  objc_storeStrong((id *)&self->_dateOfExpiration, 0);
  objc_storeStrong((id *)&self->_purchaseID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end