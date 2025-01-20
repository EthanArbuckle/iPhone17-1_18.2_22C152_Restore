@interface PKAccountEnhancedMerchant
+ (BOOL)supportsSecureCoding;
- (BOOL)hasLinkedApplication;
- (BOOL)hasMapsLocations;
- (BOOL)hasWebsite;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAccountEnhancedMerchant:(id)a3;
- (BOOL)suppressPaymentSheetRewardsHint;
- (NSCopying)identifier;
- (NSDate)paymentSheetOverrideEnd;
- (NSDate)paymentSheetOverrideStart;
- (NSNumber)adamID;
- (NSSet)brandMUIDs;
- (NSSet)enhancedRewardsProgramIdentifiers;
- (NSSet)excludedMUIDs;
- (NSSet)mapsSearchStrings;
- (NSSet)paymentIdentifiers;
- (NSString)description;
- (NSString)detailedDescription;
- (NSString)disclosures;
- (NSString)mapsSearchText;
- (NSString)name;
- (NSString)paymentSheetMerchantRewardsText;
- (NSString)paymentSheetRewardsText;
- (NSString)privateIdentifier;
- (NSURL)loyaltyPassURL;
- (NSURL)website;
- (PKAccountEnhancedMerchant)init;
- (PKAccountEnhancedMerchant)initWithCoder:(id)a3;
- (PKAccountEnhancedMerchant)initWithDictionary:(id)a3;
- (PKRemoteImageSet)iconImage;
- (PKRemoteImageSet)logoImage;
- (id)brandMUIDsAsJSONString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)excludedMUIDsAsJSONString;
- (id)hashedPaymentIdentifiers;
- (id)mapsSearchStringsAsJSONString;
- (id)paymentIdentifiersAsJSONString;
- (unint64_t)hash;
- (void)_initWithMerchantDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAdamID:(id)a3;
- (void)setBrandMUIDs:(id)a3;
- (void)setBrandMUIDsFromJSONString:(id)a3;
- (void)setDetailedDescription:(id)a3;
- (void)setDisclosures:(id)a3;
- (void)setEnhancedRewardsProgramIdentifiers:(id)a3;
- (void)setEnhancedRewardsProgramIdentifiersFromJSONString:(id)a3;
- (void)setExcludedMUIDs:(id)a3;
- (void)setExcludedMUIDsFromJSONString:(id)a3;
- (void)setIconImage:(id)a3;
- (void)setLogoImage:(id)a3;
- (void)setLoyaltyPassURL:(id)a3;
- (void)setMapsSearchStrings:(id)a3;
- (void)setMapsSearchStringsFromJSONString:(id)a3;
- (void)setMapsSearchText:(id)a3;
- (void)setName:(id)a3;
- (void)setPaymentIdentifiers:(id)a3;
- (void)setPaymentIdentifiersFromJSONString:(id)a3;
- (void)setPaymentSheetMerchantRewardsText:(id)a3;
- (void)setPaymentSheetOverrideEnd:(id)a3;
- (void)setPaymentSheetOverrideStart:(id)a3;
- (void)setPaymentSheetRewardsText:(id)a3;
- (void)setPrivateIdentifier:(id)a3;
- (void)setSuppressPaymentSheetRewardsHint:(BOOL)a3;
- (void)setWebsite:(id)a3;
@end

@implementation PKAccountEnhancedMerchant

- (PKAccountEnhancedMerchant)init
{
  v10.receiver = self;
  v10.super_class = (Class)PKAccountEnhancedMerchant;
  v2 = [(PKAccountEnhancedMerchant *)&v10 init];
  if (v2)
  {
    v3 = [PKRemoteImageSet alloc];
    uint64_t v4 = MEMORY[0x1E4F1CBF0];
    uint64_t v5 = [(PKRemoteImageSet *)v3 initWithName:@"logoImage" dictionaries:MEMORY[0x1E4F1CBF0]];
    logoImage = v2->_logoImage;
    v2->_logoImage = (PKRemoteImageSet *)v5;

    v7 = [[PKRemoteImageSet alloc] initWithName:@"iconImage" dictionaries:v4];
    iconImage = v2->_iconImage;
    v2->_iconImage = v7;
  }
  return v2;
}

- (PKAccountEnhancedMerchant)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)PKAccountEnhancedMerchant;
    uint64_t v5 = [(PKAccountEnhancedMerchant *)&v9 init];
    v6 = v5;
    if (v5) {
      [(PKAccountEnhancedMerchant *)v5 _initWithMerchantDictionary:v4];
    }
    self = v6;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_initWithMerchantDictionary:(id)a3
{
  id v50 = a3;
  id v4 = [v50 PKStringForKey:@"privateIdentifier"];
  privateIdentifier = self->_privateIdentifier;
  self->_privateIdentifier = v4;

  v6 = [v50 PKStringForKey:@"name"];
  name = self->_name;
  self->_name = v6;

  v8 = [v50 PKStringForKey:@"description"];
  detailedDescription = self->_detailedDescription;
  self->_detailedDescription = v8;

  objc_super v10 = [v50 PKArrayForKey:@"logoImage"];
  v11 = [[PKRemoteImageSet alloc] initWithName:@"logoImage" dictionaries:v10];
  logoImage = self->_logoImage;
  self->_logoImage = v11;

  v13 = [v50 PKArrayForKey:@"iconImage"];
  v14 = [[PKRemoteImageSet alloc] initWithName:@"iconImage" dictionaries:v13];
  iconImage = self->_iconImage;
  self->_iconImage = v14;

  v16 = [v50 PKStringForKey:@"adamID"];
  v17 = [v16 nonZeroUnsignedLongLongNSNumberValue];
  adamID = self->_adamID;
  self->_adamID = v17;

  v19 = [v50 objectForKey:@"brandMUIDs"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v20 = [v19 nonZeroUnsignedLongLongSetValue];
    brandMUIDs = self->_brandMUIDs;
    self->_brandMUIDs = v20;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(PKAccountEnhancedMerchant *)self setBrandMUIDsFromJSONString:v19];
      goto LABEL_7;
    }
    brandMUIDs = self->_brandMUIDs;
    self->_brandMUIDs = 0;
  }

LABEL_7:
  v22 = [v50 objectForKey:@"excludedMUIDs"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v23 = [v22 nonZeroUnsignedLongLongSetValue];
    excludedMUIDs = self->_excludedMUIDs;
    self->_excludedMUIDs = v23;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(PKAccountEnhancedMerchant *)self setExcludedMUIDsFromJSONString:v22];
      goto LABEL_13;
    }
    excludedMUIDs = self->_excludedMUIDs;
    self->_excludedMUIDs = 0;
  }

LABEL_13:
  v25 = [v50 PKURLForKey:@"website"];
  website = self->_website;
  self->_website = v25;

  v27 = [v50 PKURLForKey:@"loyaltyPassURL"];
  loyaltyPassURL = self->_loyaltyPassURL;
  self->_loyaltyPassURL = v27;

  v29 = [v50 objectForKey:@"paymentIdentifiers"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v30 = [v29 stringSetValue];
    paymentIdentifiers = self->_paymentIdentifiers;
    self->_paymentIdentifiers = v30;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(PKAccountEnhancedMerchant *)self setPaymentIdentifiersFromJSONString:v29];
      goto LABEL_19;
    }
    paymentIdentifiers = self->_paymentIdentifiers;
    self->_paymentIdentifiers = 0;
  }

LABEL_19:
  v32 = [v50 objectForKey:@"mapsSearchStrings"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v33 = [v32 stringSetValue];
    mapsSearchStrings = self->_mapsSearchStrings;
    self->_mapsSearchStrings = v33;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(PKAccountEnhancedMerchant *)self setMapsSearchStringsFromJSONString:v32];
      goto LABEL_25;
    }
    mapsSearchStrings = self->_mapsSearchStrings;
    self->_mapsSearchStrings = 0;
  }

LABEL_25:
  v35 = [v50 PKStringForKey:@"disclosures"];
  disclosures = self->_disclosures;
  self->_disclosures = v35;

  v37 = [v50 PKStringForKey:@"mapsSearchText"];
  mapsSearchText = self->_mapsSearchText;
  self->_mapsSearchText = v37;

  v39 = [v50 PKStringForKey:@"paymentSheetRewardsText"];
  paymentSheetRewardsText = self->_paymentSheetRewardsText;
  self->_paymentSheetRewardsText = v39;

  v41 = [v50 PKStringForKey:@"paymentSheetMerchantRewardsText"];
  paymentSheetMerchantRewardsText = self->_paymentSheetMerchantRewardsText;
  self->_paymentSheetMerchantRewardsText = v41;

  self->_suppressPaymentSheetRewardsHint = [v50 PKBoolForKey:@"suppressPaymentSheetRewardsHint"];
  v43 = [v50 PKDateForKey:@"paymentSheetOverrideStart"];
  paymentSheetOverrideStart = self->_paymentSheetOverrideStart;
  self->_paymentSheetOverrideStart = v43;

  v45 = [v50 PKDateForKey:@"paymentSheetOverrideEnd"];
  paymentSheetOverrideEnd = self->_paymentSheetOverrideEnd;
  self->_paymentSheetOverrideEnd = v45;

  v47 = [v50 objectForKey:@"enhancedRewardsProgramIdentifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v48 = [v47 stringSetValue];
    enhancedRewardsProgramIdentifiers = self->_enhancedRewardsProgramIdentifiers;
    self->_enhancedRewardsProgramIdentifiers = v48;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(PKAccountEnhancedMerchant *)self setEnhancedRewardsProgramIdentifiersFromJSONString:v47];
      goto LABEL_31;
    }
    enhancedRewardsProgramIdentifiers = self->_enhancedRewardsProgramIdentifiers;
    self->_enhancedRewardsProgramIdentifiers = 0;
  }

LABEL_31:
}

- (void)setBrandMUIDsFromJSONString:(id)a3
{
  if (a3)
  {
    id v4 = [a3 jsonNonZeroUnsignedLongLongNSNumberSetValue];
    brandMUIDs = self->_brandMUIDs;
    self->_brandMUIDs = v4;
  }
  else
  {
    brandMUIDs = self->_brandMUIDs;
    self->_brandMUIDs = 0;
  }
}

- (void)setExcludedMUIDsFromJSONString:(id)a3
{
  if (a3)
  {
    id v4 = [a3 jsonNonZeroUnsignedLongLongNSNumberSetValue];
    excludedMUIDs = self->_excludedMUIDs;
    self->_excludedMUIDs = v4;
  }
  else
  {
    excludedMUIDs = self->_excludedMUIDs;
    self->_excludedMUIDs = 0;
  }
}

- (void)setPaymentIdentifiersFromJSONString:(id)a3
{
  if (a3)
  {
    id v4 = [a3 jsonStringSetValue];
    paymentIdentifiers = self->_paymentIdentifiers;
    self->_paymentIdentifiers = v4;
  }
  else
  {
    paymentIdentifiers = self->_paymentIdentifiers;
    self->_paymentIdentifiers = 0;
  }
}

- (void)setEnhancedRewardsProgramIdentifiersFromJSONString:(id)a3
{
  if (a3)
  {
    id v4 = [a3 jsonStringSetValue];
    enhancedRewardsProgramIdentifiers = self->_enhancedRewardsProgramIdentifiers;
    self->_enhancedRewardsProgramIdentifiers = v4;
  }
  else
  {
    enhancedRewardsProgramIdentifiers = self->_enhancedRewardsProgramIdentifiers;
    self->_enhancedRewardsProgramIdentifiers = 0;
  }
}

- (void)setMapsSearchStringsFromJSONString:(id)a3
{
  if (a3)
  {
    id v4 = [a3 jsonStringSetValue];
    mapsSearchStrings = self->_mapsSearchStrings;
    self->_mapsSearchStrings = v4;
  }
  else
  {
    mapsSearchStrings = self->_mapsSearchStrings;
    self->_mapsSearchStrings = 0;
  }
}

- (id)brandMUIDsAsJSONString
{
  return [(NSSet *)self->_brandMUIDs jsonString];
}

- (id)excludedMUIDsAsJSONString
{
  return [(NSSet *)self->_excludedMUIDs jsonString];
}

- (id)paymentIdentifiersAsJSONString
{
  return [(NSSet *)self->_paymentIdentifiers jsonString];
}

- (id)mapsSearchStringsAsJSONString
{
  return [(NSSet *)self->_mapsSearchStrings jsonString];
}

- (BOOL)hasMapsLocations
{
  return [(NSSet *)self->_brandMUIDs count] != 0;
}

- (BOOL)hasLinkedApplication
{
  return self->_adamID || [0 unsignedLongLongValue] != 0;
}

- (id)hashedPaymentIdentifiers
{
  v2 = [(NSSet *)self->_paymentIdentifiers allObjects];
  v3 = objc_msgSend(v2, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_221);

  id v4 = [MEMORY[0x1E4F1CAD0] setWithArray:v3];

  return v4;
}

id __53__PKAccountEnhancedMerchant_hashedPaymentIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 dataUsingEncoding:4];
  v3 = [v2 SHA256Hash];
  id v4 = [v3 hexEncoding];
  uint64_t v5 = [v4 lowercaseString];
  v6 = objc_msgSend(v5, "pk_stringIfNotEmpty");

  return v6;
}

- (BOOL)hasWebsite
{
  return self->_website != 0;
}

- (NSString)description
{
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"<%@: %p; ",
                 objc_opt_class(),
                 self);
  [v3 appendFormat:@"privateIdentifier: '%@'; ", self->_privateIdentifier];
  [v3 appendFormat:@"name: '%@'; ", self->_name];
  id v4 = [(NSString *)self->_detailedDescription truncatedStringWithEllipsis];
  [v3 appendFormat:@"description: '%@'; ", v4];

  [v3 appendFormat:@"logoImage: '%@'; ", self->_logoImage];
  [v3 appendFormat:@"iconImage: '%@'; ", self->_iconImage];
  [v3 appendFormat:@"adamID: '%@'; ", self->_adamID];
  uint64_t v5 = [(NSSet *)self->_brandMUIDs jsonString];
  [v3 appendFormat:@"brandMUIDs: '%@'; ", v5];

  v6 = [(NSSet *)self->_excludedMUIDs jsonString];
  [v3 appendFormat:@"excludedMUIDs: '%@'; ", v6];

  v7 = [(NSURL *)self->_website absoluteString];
  [v3 appendFormat:@"website: '%@'; ", v7];

  v8 = [(NSURL *)self->_loyaltyPassURL absoluteString];
  [v3 appendFormat:@"loyaltyPassURL: '%@'; ", v8];

  objc_super v9 = [(NSSet *)self->_paymentIdentifiers jsonString];
  [v3 appendFormat:@"paymentIdentifiers: '%@'", v9];

  objc_super v10 = [(NSString *)self->_disclosures truncatedStringWithEllipsis];
  [v3 appendFormat:@"disclosures: '%@'", v10];

  [v3 appendFormat:@"mapsSearchText: '%@'", self->_mapsSearchText];
  v11 = [(NSSet *)self->_mapsSearchStrings jsonString];
  [v3 appendFormat:@"mapsSearchStrings: '%@'", v11];

  [v3 appendFormat:@"paymentSheetRewardsText: '%@'", self->_paymentSheetRewardsText];
  [v3 appendFormat:@"paymentSheetMerchantRewardsText: '%@'", self->_paymentSheetMerchantRewardsText];
  objc_msgSend(v3, "appendFormat:", @"suppressPaymentSheetRewardsHint: '%d'", self->_suppressPaymentSheetRewardsHint);
  [v3 appendFormat:@"paymentSheetOverrideStart: '%@'", self->_paymentSheetOverrideStart];
  [v3 appendFormat:@"paymentSheetOverrideEnd: '%@'", self->_paymentSheetOverrideEnd];
  v12 = [(NSSet *)self->_enhancedRewardsProgramIdentifiers jsonString];
  [v3 appendFormat:@"enhancedRewardsProgramIdentifiers: '%@'", v12];

  [v3 appendFormat:@">"];
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKAccountEnhancedMerchant *)a3;
  uint64_t v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKAccountEnhancedMerchant *)self isEqualToAccountEnhancedMerchant:v5];

  return v6;
}

- (BOOL)isEqualToAccountEnhancedMerchant:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_89;
  }
  BOOL v6 = (void *)*((void *)v4 + 2);
  v7 = self->_privateIdentifier;
  v8 = v6;
  if (v7 == v8)
  {
  }
  else
  {
    objc_super v9 = v8;
    if (!v7 || !v8) {
      goto LABEL_88;
    }
    BOOL v10 = [(NSString *)v7 isEqualToString:v8];

    if (!v10) {
      goto LABEL_89;
    }
  }
  v11 = (void *)*((void *)v5 + 3);
  v7 = self->_name;
  v12 = v11;
  if (v7 == v12)
  {
  }
  else
  {
    objc_super v9 = v12;
    if (!v7 || !v12) {
      goto LABEL_88;
    }
    BOOL v13 = [(NSString *)v7 isEqualToString:v12];

    if (!v13) {
      goto LABEL_89;
    }
  }
  v14 = (void *)*((void *)v5 + 4);
  v7 = self->_detailedDescription;
  v15 = v14;
  if (v7 == v15)
  {
  }
  else
  {
    objc_super v9 = v15;
    if (!v7 || !v15) {
      goto LABEL_88;
    }
    BOOL v16 = [(NSString *)v7 isEqualToString:v15];

    if (!v16) {
      goto LABEL_89;
    }
  }
  logoImage = self->_logoImage;
  v18 = (PKRemoteImageSet *)*((void *)v5 + 5);
  if (logoImage && v18)
  {
    if (!-[PKRemoteImageSet isEqual:](logoImage, "isEqual:")) {
      goto LABEL_89;
    }
  }
  else if (logoImage != v18)
  {
    goto LABEL_89;
  }
  iconImage = self->_iconImage;
  v20 = (PKRemoteImageSet *)*((void *)v5 + 6);
  if (iconImage && v20)
  {
    if (!-[PKRemoteImageSet isEqual:](iconImage, "isEqual:")) {
      goto LABEL_89;
    }
  }
  else if (iconImage != v20)
  {
    goto LABEL_89;
  }
  adamID = self->_adamID;
  v22 = (NSNumber *)*((void *)v5 + 7);
  if (adamID && v22)
  {
    if ((-[NSNumber isEqual:](adamID, "isEqual:") & 1) == 0) {
      goto LABEL_89;
    }
  }
  else if (adamID != v22)
  {
    goto LABEL_89;
  }
  brandMUIDs = self->_brandMUIDs;
  v24 = (NSSet *)*((void *)v5 + 8);
  if (brandMUIDs && v24)
  {
    if ((-[NSSet isEqual:](brandMUIDs, "isEqual:") & 1) == 0) {
      goto LABEL_89;
    }
  }
  else if (brandMUIDs != v24)
  {
    goto LABEL_89;
  }
  excludedMUIDs = self->_excludedMUIDs;
  v26 = (NSSet *)*((void *)v5 + 9);
  if (excludedMUIDs && v26)
  {
    if ((-[NSSet isEqual:](excludedMUIDs, "isEqual:") & 1) == 0) {
      goto LABEL_89;
    }
  }
  else if (excludedMUIDs != v26)
  {
    goto LABEL_89;
  }
  website = self->_website;
  v28 = (NSURL *)*((void *)v5 + 10);
  if (website && v28)
  {
    if ((-[NSURL isEqual:](website, "isEqual:") & 1) == 0) {
      goto LABEL_89;
    }
  }
  else if (website != v28)
  {
    goto LABEL_89;
  }
  loyaltyPassURL = self->_loyaltyPassURL;
  v30 = (NSURL *)*((void *)v5 + 11);
  if (loyaltyPassURL && v30)
  {
    if ((-[NSURL isEqual:](loyaltyPassURL, "isEqual:") & 1) == 0) {
      goto LABEL_89;
    }
  }
  else if (loyaltyPassURL != v30)
  {
    goto LABEL_89;
  }
  paymentIdentifiers = self->_paymentIdentifiers;
  v32 = (NSSet *)*((void *)v5 + 12);
  if (paymentIdentifiers && v32)
  {
    if ((-[NSSet isEqual:](paymentIdentifiers, "isEqual:") & 1) == 0) {
      goto LABEL_89;
    }
  }
  else if (paymentIdentifiers != v32)
  {
    goto LABEL_89;
  }
  v33 = (void *)*((void *)v5 + 13);
  v7 = self->_disclosures;
  v34 = v33;
  if (v7 == v34)
  {
  }
  else
  {
    objc_super v9 = v34;
    if (!v7 || !v34) {
      goto LABEL_88;
    }
    BOOL v35 = [(NSString *)v7 isEqualToString:v34];

    if (!v35) {
      goto LABEL_89;
    }
  }
  v36 = (void *)*((void *)v5 + 14);
  v7 = self->_mapsSearchText;
  v37 = v36;
  if (v7 == v37)
  {
  }
  else
  {
    objc_super v9 = v37;
    if (!v7 || !v37) {
      goto LABEL_88;
    }
    BOOL v38 = [(NSString *)v7 isEqualToString:v37];

    if (!v38) {
      goto LABEL_89;
    }
  }
  mapsSearchStrings = self->_mapsSearchStrings;
  v40 = (NSSet *)*((void *)v5 + 15);
  if (mapsSearchStrings && v40)
  {
    if ((-[NSSet isEqual:](mapsSearchStrings, "isEqual:") & 1) == 0) {
      goto LABEL_89;
    }
  }
  else if (mapsSearchStrings != v40)
  {
    goto LABEL_89;
  }
  v41 = (void *)*((void *)v5 + 16);
  v7 = self->_paymentSheetRewardsText;
  v42 = v41;
  if (v7 == v42)
  {
  }
  else
  {
    objc_super v9 = v42;
    if (!v7 || !v42) {
      goto LABEL_88;
    }
    BOOL v43 = [(NSString *)v7 isEqualToString:v42];

    if (!v43) {
      goto LABEL_89;
    }
  }
  v44 = (void *)*((void *)v5 + 17);
  v7 = self->_paymentSheetMerchantRewardsText;
  v45 = v44;
  if (v7 == v45)
  {

    goto LABEL_92;
  }
  objc_super v9 = v45;
  if (!v7 || !v45)
  {
LABEL_88:

    goto LABEL_89;
  }
  BOOL v46 = [(NSString *)v7 isEqualToString:v45];

  if (!v46) {
    goto LABEL_89;
  }
LABEL_92:
  paymentSheetOverrideStart = self->_paymentSheetOverrideStart;
  id v50 = (NSDate *)*((void *)v5 + 18);
  if (paymentSheetOverrideStart && v50)
  {
    if ((-[NSDate isEqual:](paymentSheetOverrideStart, "isEqual:") & 1) == 0) {
      goto LABEL_89;
    }
  }
  else if (paymentSheetOverrideStart != v50)
  {
    goto LABEL_89;
  }
  paymentSheetOverrideEnd = self->_paymentSheetOverrideEnd;
  v52 = (NSDate *)*((void *)v5 + 19);
  if (!paymentSheetOverrideEnd || !v52)
  {
    if (paymentSheetOverrideEnd == v52) {
      goto LABEL_102;
    }
LABEL_89:
    char v47 = 0;
    goto LABEL_90;
  }
  if ((-[NSDate isEqual:](paymentSheetOverrideEnd, "isEqual:") & 1) == 0) {
    goto LABEL_89;
  }
LABEL_102:
  if (self->_suppressPaymentSheetRewardsHint != v5[8]) {
    goto LABEL_89;
  }
  enhancedRewardsProgramIdentifiers = self->_enhancedRewardsProgramIdentifiers;
  v54 = (NSSet *)*((void *)v5 + 20);
  if (enhancedRewardsProgramIdentifiers && v54) {
    char v47 = -[NSSet isEqual:](enhancedRewardsProgramIdentifiers, "isEqual:");
  }
  else {
    char v47 = enhancedRewardsProgramIdentifiers == v54;
  }
LABEL_90:

  return v47;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_privateIdentifier];
  [v3 safelyAddObject:self->_name];
  [v3 safelyAddObject:self->_detailedDescription];
  [v3 safelyAddObject:self->_logoImage];
  [v3 safelyAddObject:self->_iconImage];
  [v3 safelyAddObject:self->_adamID];
  [v3 safelyAddObject:self->_brandMUIDs];
  [v3 safelyAddObject:self->_excludedMUIDs];
  [v3 safelyAddObject:self->_website];
  [v3 safelyAddObject:self->_loyaltyPassURL];
  [v3 safelyAddObject:self->_paymentIdentifiers];
  [v3 safelyAddObject:self->_disclosures];
  [v3 safelyAddObject:self->_mapsSearchText];
  [v3 safelyAddObject:self->_paymentSheetRewardsText];
  [v3 safelyAddObject:self->_paymentSheetMerchantRewardsText];
  [v3 safelyAddObject:self->_paymentSheetOverrideStart];
  [v3 safelyAddObject:self->_paymentSheetOverrideEnd];
  [v3 safelyAddObject:self->_enhancedRewardsProgramIdentifiers];
  [v3 safelyAddObject:self->_mapsSearchStrings];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_suppressPaymentSheetRewardsHint - v4 + 32 * v4;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountEnhancedMerchant)initWithCoder:(id)a3
{
  id v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)PKAccountEnhancedMerchant;
  unint64_t v5 = [(PKAccountEnhancedMerchant *)&v53 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"privateIdentifier"];
    privateIdentifier = v5->_privateIdentifier;
    v5->_privateIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"description"];
    detailedDescription = v5->_detailedDescription;
    v5->_detailedDescription = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"logoImage"];
    logoImage = v5->_logoImage;
    v5->_logoImage = (PKRemoteImageSet *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iconImage"];
    iconImage = v5->_iconImage;
    v5->_iconImage = (PKRemoteImageSet *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"adamID"];
    adamID = v5->_adamID;
    v5->_adamID = (NSNumber *)v16;

    v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    v21 = objc_msgSend(v18, "setWithObjects:", v19, v20, objc_opt_class(), 0);
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"brandMUIDs"];
    brandMUIDs = v5->_brandMUIDs;
    v5->_brandMUIDs = (NSSet *)v22;

    uint64_t v24 = [v4 decodeObjectOfClasses:v21 forKey:@"excludedMUIDs"];
    excludedMUIDs = v5->_excludedMUIDs;
    v5->_excludedMUIDs = (NSSet *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"website"];
    website = v5->_website;
    v5->_website = (NSURL *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"loyaltyPassURL"];
    loyaltyPassURL = v5->_loyaltyPassURL;
    v5->_loyaltyPassURL = (NSURL *)v28;

    v30 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v31 = objc_opt_class();
    uint64_t v32 = objc_opt_class();
    v33 = objc_msgSend(v30, "setWithObjects:", v31, v32, objc_opt_class(), 0);
    uint64_t v34 = [v4 decodeObjectOfClasses:v33 forKey:@"paymentIdentifiers"];
    paymentIdentifiers = v5->_paymentIdentifiers;
    v5->_paymentIdentifiers = (NSSet *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"disclosures"];
    disclosures = v5->_disclosures;
    v5->_disclosures = (NSString *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mapsSearchText"];
    mapsSearchText = v5->_mapsSearchText;
    v5->_mapsSearchText = (NSString *)v38;

    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentSheetRewardsText"];
    paymentSheetRewardsText = v5->_paymentSheetRewardsText;
    v5->_paymentSheetRewardsText = (NSString *)v40;

    uint64_t v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentSheetMerchantRewardsText"];
    paymentSheetMerchantRewardsText = v5->_paymentSheetMerchantRewardsText;
    v5->_paymentSheetMerchantRewardsText = (NSString *)v42;

    v5->_suppressPaymentSheetRewardsHint = [v4 decodeBoolForKey:@"suppressPaymentSheetRewardsHint"];
    uint64_t v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentSheetOverrideStart"];
    paymentSheetOverrideStart = v5->_paymentSheetOverrideStart;
    v5->_paymentSheetOverrideStart = (NSDate *)v44;

    uint64_t v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentSheetOverrideEnd"];
    paymentSheetOverrideEnd = v5->_paymentSheetOverrideEnd;
    v5->_paymentSheetOverrideEnd = (NSDate *)v46;

    uint64_t v48 = [v4 decodeObjectOfClasses:v33 forKey:@"enhancedRewardsProgramIdentifier"];
    enhancedRewardsProgramIdentifiers = v5->_enhancedRewardsProgramIdentifiers;
    v5->_enhancedRewardsProgramIdentifiers = (NSSet *)v48;

    uint64_t v50 = [v4 decodeObjectOfClasses:v33 forKey:@"mapsSearchStrings"];
    mapsSearchStrings = v5->_mapsSearchStrings;
    v5->_mapsSearchStrings = (NSSet *)v50;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  privateIdentifier = self->_privateIdentifier;
  id v5 = a3;
  [v5 encodeObject:privateIdentifier forKey:@"privateIdentifier"];
  [v5 encodeObject:self->_name forKey:@"name"];
  [v5 encodeObject:self->_detailedDescription forKey:@"description"];
  [v5 encodeObject:self->_logoImage forKey:@"logoImage"];
  [v5 encodeObject:self->_iconImage forKey:@"iconImage"];
  [v5 encodeObject:self->_adamID forKey:@"adamID"];
  [v5 encodeObject:self->_brandMUIDs forKey:@"brandMUIDs"];
  [v5 encodeObject:self->_excludedMUIDs forKey:@"excludedMUIDs"];
  [v5 encodeObject:self->_website forKey:@"website"];
  [v5 encodeObject:self->_loyaltyPassURL forKey:@"loyaltyPassURL"];
  [v5 encodeObject:self->_paymentIdentifiers forKey:@"paymentIdentifiers"];
  [v5 encodeObject:self->_disclosures forKey:@"disclosures"];
  [v5 encodeObject:self->_mapsSearchText forKey:@"mapsSearchText"];
  [v5 encodeObject:self->_paymentSheetRewardsText forKey:@"paymentSheetRewardsText"];
  [v5 encodeObject:self->_paymentSheetMerchantRewardsText forKey:@"paymentSheetMerchantRewardsText"];
  [v5 encodeBool:self->_suppressPaymentSheetRewardsHint forKey:@"suppressPaymentSheetRewardsHint"];
  [v5 encodeObject:self->_paymentSheetOverrideStart forKey:@"paymentSheetOverrideStart"];
  [v5 encodeObject:self->_paymentSheetOverrideEnd forKey:@"paymentSheetOverrideEnd"];
  [v5 encodeObject:self->_enhancedRewardsProgramIdentifiers forKey:@"enhancedRewardsProgramIdentifier"];
  [v5 encodeObject:self->_mapsSearchStrings forKey:@"mapsSearchStrings"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_privateIdentifier copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_name copyWithZone:a3];
  objc_super v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSString *)self->_detailedDescription copyWithZone:a3];
  v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  id v12 = [(PKRemoteImageSet *)self->_logoImage copyWithZone:a3];
  BOOL v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  id v14 = [(PKRemoteImageSet *)self->_iconImage copyWithZone:a3];
  v15 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v14;

  uint64_t v16 = [(NSNumber *)self->_adamID copyWithZone:a3];
  v17 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v16;

  uint64_t v18 = [(NSSet *)self->_brandMUIDs deepCopyWithZone:a3];
  uint64_t v19 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v18;

  uint64_t v20 = [(NSSet *)self->_excludedMUIDs deepCopyWithZone:a3];
  v21 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v20;

  uint64_t v22 = [(NSURL *)self->_website copyWithZone:a3];
  v23 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v22;

  uint64_t v24 = [(NSURL *)self->_loyaltyPassURL copyWithZone:a3];
  v25 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v24;

  uint64_t v26 = [(NSSet *)self->_paymentIdentifiers deepCopyWithZone:a3];
  v27 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v26;

  uint64_t v28 = [(NSString *)self->_disclosures copyWithZone:a3];
  v29 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v28;

  uint64_t v30 = [(NSString *)self->_mapsSearchText copyWithZone:a3];
  uint64_t v31 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v30;

  uint64_t v32 = [(NSString *)self->_paymentSheetRewardsText copyWithZone:a3];
  v33 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v32;

  uint64_t v34 = [(NSString *)self->_paymentSheetMerchantRewardsText copyWithZone:a3];
  BOOL v35 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v34;

  *(unsigned char *)(v5 + 8) = self->_suppressPaymentSheetRewardsHint;
  uint64_t v36 = [(NSDate *)self->_paymentSheetOverrideStart copyWithZone:a3];
  v37 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v36;

  uint64_t v38 = [(NSDate *)self->_paymentSheetOverrideEnd copyWithZone:a3];
  v39 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v38;

  uint64_t v40 = [(NSSet *)self->_enhancedRewardsProgramIdentifiers deepCopyWithZone:a3];
  v41 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v40;

  uint64_t v42 = [(NSSet *)self->_mapsSearchStrings deepCopyWithZone:a3];
  BOOL v43 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v42;

  return (id)v5;
}

- (NSCopying)identifier
{
  return (NSCopying *)self->_privateIdentifier;
}

- (NSString)privateIdentifier
{
  return self->_privateIdentifier;
}

- (void)setPrivateIdentifier:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)detailedDescription
{
  return self->_detailedDescription;
}

- (void)setDetailedDescription:(id)a3
{
}

- (PKRemoteImageSet)logoImage
{
  return self->_logoImage;
}

- (void)setLogoImage:(id)a3
{
}

- (PKRemoteImageSet)iconImage
{
  return self->_iconImage;
}

- (void)setIconImage:(id)a3
{
}

- (NSNumber)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(id)a3
{
}

- (NSSet)brandMUIDs
{
  return self->_brandMUIDs;
}

- (void)setBrandMUIDs:(id)a3
{
}

- (NSSet)excludedMUIDs
{
  return self->_excludedMUIDs;
}

- (void)setExcludedMUIDs:(id)a3
{
}

- (NSURL)website
{
  return self->_website;
}

- (void)setWebsite:(id)a3
{
}

- (NSURL)loyaltyPassURL
{
  return self->_loyaltyPassURL;
}

- (void)setLoyaltyPassURL:(id)a3
{
}

- (NSSet)paymentIdentifiers
{
  return self->_paymentIdentifiers;
}

- (void)setPaymentIdentifiers:(id)a3
{
}

- (NSString)disclosures
{
  return self->_disclosures;
}

- (void)setDisclosures:(id)a3
{
}

- (NSString)mapsSearchText
{
  return self->_mapsSearchText;
}

- (void)setMapsSearchText:(id)a3
{
}

- (NSSet)mapsSearchStrings
{
  return self->_mapsSearchStrings;
}

- (void)setMapsSearchStrings:(id)a3
{
}

- (NSString)paymentSheetRewardsText
{
  return self->_paymentSheetRewardsText;
}

- (void)setPaymentSheetRewardsText:(id)a3
{
}

- (NSString)paymentSheetMerchantRewardsText
{
  return self->_paymentSheetMerchantRewardsText;
}

- (void)setPaymentSheetMerchantRewardsText:(id)a3
{
}

- (BOOL)suppressPaymentSheetRewardsHint
{
  return self->_suppressPaymentSheetRewardsHint;
}

- (void)setSuppressPaymentSheetRewardsHint:(BOOL)a3
{
  self->_suppressPaymentSheetRewardsHint = a3;
}

- (NSDate)paymentSheetOverrideStart
{
  return self->_paymentSheetOverrideStart;
}

- (void)setPaymentSheetOverrideStart:(id)a3
{
}

- (NSDate)paymentSheetOverrideEnd
{
  return self->_paymentSheetOverrideEnd;
}

- (void)setPaymentSheetOverrideEnd:(id)a3
{
}

- (NSSet)enhancedRewardsProgramIdentifiers
{
  return self->_enhancedRewardsProgramIdentifiers;
}

- (void)setEnhancedRewardsProgramIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enhancedRewardsProgramIdentifiers, 0);
  objc_storeStrong((id *)&self->_paymentSheetOverrideEnd, 0);
  objc_storeStrong((id *)&self->_paymentSheetOverrideStart, 0);
  objc_storeStrong((id *)&self->_paymentSheetMerchantRewardsText, 0);
  objc_storeStrong((id *)&self->_paymentSheetRewardsText, 0);
  objc_storeStrong((id *)&self->_mapsSearchStrings, 0);
  objc_storeStrong((id *)&self->_mapsSearchText, 0);
  objc_storeStrong((id *)&self->_disclosures, 0);
  objc_storeStrong((id *)&self->_paymentIdentifiers, 0);
  objc_storeStrong((id *)&self->_loyaltyPassURL, 0);
  objc_storeStrong((id *)&self->_website, 0);
  objc_storeStrong((id *)&self->_excludedMUIDs, 0);
  objc_storeStrong((id *)&self->_brandMUIDs, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_logoImage, 0);
  objc_storeStrong((id *)&self->_detailedDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_privateIdentifier, 0);
}

@end