@interface PKSavingsAccountDetails
+ (BOOL)supportsSecureCoding;
- (BOOL)fccStepUpRequired;
- (BOOL)isEqual:(id)a3;
- (BOOL)moreInfoRequired;
- (BOOL)termsAcceptanceRequired;
- (NSDate)createdDate;
- (NSDate)lastUpdatedDate;
- (NSString)accountNumber;
- (NSString)businessChatIdentifier;
- (NSString)contactNumber;
- (NSString)countryCode;
- (NSString)currencyCode;
- (NSString)routingNumber;
- (NSString)termsIdentifier;
- (NSTimeZone)productTimeZone;
- (NSURL)contactWebsite;
- (NSURL)privacyPolicyURL;
- (PKSavingsAccountDetails)initWithCoder:(id)a3;
- (PKSavingsAccountDetails)initWithDictionary:(id)a3;
- (PKSavingsAccountStepUpDetails)fccStepUpDetails;
- (PKSavingsAccountSummary)accountSummary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountNumber:(id)a3;
- (void)setAccountSummary:(id)a3;
- (void)setBusinessChatIdentifier:(id)a3;
- (void)setContactNumber:(id)a3;
- (void)setContactWebsite:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setCreatedDate:(id)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setFccStepUpDetails:(id)a3;
- (void)setFccStepUpRequired:(BOOL)a3;
- (void)setLastUpdatedDate:(id)a3;
- (void)setMoreInfoRequired:(BOOL)a3;
- (void)setPrivacyPolicyURL:(id)a3;
- (void)setProductTimeZone:(id)a3;
- (void)setRoutingNumber:(id)a3;
- (void)setTermsAcceptanceRequired:(BOOL)a3;
- (void)setTermsIdentifier:(id)a3;
@end

@implementation PKSavingsAccountDetails

- (PKSavingsAccountDetails)initWithDictionary:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)PKSavingsAccountDetails;
  v5 = [(PKSavingsAccountDetails *)&v40 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKDateForKey:@"lastUpdatedDate"];
    lastUpdatedDate = v5->_lastUpdatedDate;
    v5->_lastUpdatedDate = (NSDate *)v6;

    uint64_t v8 = [v4 PKDateForKey:@"createdDate"];
    createdDate = v5->_createdDate;
    v5->_createdDate = (NSDate *)v8;

    uint64_t v10 = [v4 PKStringForKey:@"countryCode"];
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v10;

    uint64_t v12 = [v4 PKStringForKey:@"currencyCode"];
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v12;

    uint64_t v14 = [v4 PKStringForKey:@"routingNumber"];
    routingNumber = v5->_routingNumber;
    v5->_routingNumber = (NSString *)v14;

    uint64_t v16 = [v4 PKStringForKey:@"accountNumber"];
    accountNumber = v5->_accountNumber;
    v5->_accountNumber = (NSString *)v16;

    v18 = [v4 PKStringForKey:@"productTimeZone"];
    if (v18)
    {
      uint64_t v19 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:v18];
      productTimeZone = v5->_productTimeZone;
      v5->_productTimeZone = (NSTimeZone *)v19;
    }
    v5->_moreInfoRequired = [v4 PKBoolForKey:@"moreInfoRequired"];
    v5->_fccStepUpRequired = [v4 PKBoolForKey:@"fccStepUpRequired"];
    v21 = [PKSavingsAccountStepUpDetails alloc];
    v22 = [v4 PKDictionaryForKey:@"fccStepUpDetails"];
    uint64_t v23 = [(PKSavingsAccountStepUpDetails *)v21 initWithDictionary:v22];
    fccStepUpDetails = v5->_fccStepUpDetails;
    v5->_fccStepUpDetails = (PKSavingsAccountStepUpDetails *)v23;

    v5->_termsAcceptanceRequired = [v4 PKBoolForKey:@"termsAcceptanceRequired"];
    uint64_t v25 = [v4 PKStringForKey:@"termsIdentifier"];
    termsIdentifier = v5->_termsIdentifier;
    v5->_termsIdentifier = (NSString *)v25;

    uint64_t v27 = [v4 PKURLForKey:@"privacyPolicyURL"];
    privacyPolicyURL = v5->_privacyPolicyURL;
    v5->_privacyPolicyURL = (NSURL *)v27;

    uint64_t v29 = [v4 PKStringForKey:@"businessChatIdentifier"];
    businessChatIdentifier = v5->_businessChatIdentifier;
    v5->_businessChatIdentifier = (NSString *)v29;

    uint64_t v31 = [v4 PKURLForKey:@"contactWebsite"];
    contactWebsite = v5->_contactWebsite;
    v5->_contactWebsite = (NSURL *)v31;

    uint64_t v33 = [v4 PKStringForKey:@"contactNumber"];
    contactNumber = v5->_contactNumber;
    v5->_contactNumber = (NSString *)v33;

    v35 = [PKSavingsAccountSummary alloc];
    v36 = [v4 PKDictionaryForKey:@"accountSummary"];
    uint64_t v37 = [(PKSavingsAccountSummary *)v35 initWithDictionary:v36];
    accountSummary = v5->_accountSummary;
    v5->_accountSummary = (PKSavingsAccountSummary *)v37;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSavingsAccountDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)PKSavingsAccountDetails;
  v5 = [(PKSavingsAccountDetails *)&v35 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUpdatedDate"];
    lastUpdatedDate = v5->_lastUpdatedDate;
    v5->_lastUpdatedDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"createdDate"];
    createdDate = v5->_createdDate;
    v5->_createdDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"countryCode"];
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyCode"];
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"routingNumber"];
    routingNumber = v5->_routingNumber;
    v5->_routingNumber = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountNumber"];
    accountNumber = v5->_accountNumber;
    v5->_accountNumber = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productTimeZone"];
    productTimeZone = v5->_productTimeZone;
    v5->_productTimeZone = (NSTimeZone *)v18;

    v5->_moreInfoRequired = [v4 decodeBoolForKey:@"moreInfoRequired"];
    v5->_fccStepUpRequired = [v4 decodeBoolForKey:@"fccStepUpRequired"];
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fccStepUpDetails"];
    fccStepUpDetails = v5->_fccStepUpDetails;
    v5->_fccStepUpDetails = (PKSavingsAccountStepUpDetails *)v20;

    v5->_termsAcceptanceRequired = [v4 decodeBoolForKey:@"termsAcceptanceRequired"];
    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"termsIdentifier"];
    termsIdentifier = v5->_termsIdentifier;
    v5->_termsIdentifier = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"privacyPolicyURL"];
    privacyPolicyURL = v5->_privacyPolicyURL;
    v5->_privacyPolicyURL = (NSURL *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"businessChatIdentifier"];
    businessChatIdentifier = v5->_businessChatIdentifier;
    v5->_businessChatIdentifier = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contactWebsite"];
    contactWebsite = v5->_contactWebsite;
    v5->_contactWebsite = (NSURL *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contactNumber"];
    contactNumber = v5->_contactNumber;
    v5->_contactNumber = (NSString *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountSummary"];
    accountSummary = v5->_accountSummary;
    v5->_accountSummary = (PKSavingsAccountSummary *)v32;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  createdDate = self->_createdDate;
  id v5 = a3;
  [v5 encodeObject:createdDate forKey:@"createdDate"];
  [v5 encodeObject:self->_lastUpdatedDate forKey:@"lastUpdatedDate"];
  [v5 encodeObject:self->_countryCode forKey:@"countryCode"];
  [v5 encodeObject:self->_currencyCode forKey:@"currencyCode"];
  [v5 encodeObject:self->_routingNumber forKey:@"routingNumber"];
  [v5 encodeObject:self->_accountNumber forKey:@"accountNumber"];
  [v5 encodeObject:self->_productTimeZone forKey:@"productTimeZone"];
  [v5 encodeBool:self->_moreInfoRequired forKey:@"moreInfoRequired"];
  [v5 encodeBool:self->_fccStepUpRequired forKey:@"fccStepUpRequired"];
  [v5 encodeObject:self->_fccStepUpDetails forKey:@"fccStepUpDetails"];
  [v5 encodeBool:self->_termsAcceptanceRequired forKey:@"termsAcceptanceRequired"];
  [v5 encodeObject:self->_termsIdentifier forKey:@"termsIdentifier"];
  [v5 encodeObject:self->_privacyPolicyURL forKey:@"privacyPolicyURL"];
  [v5 encodeObject:self->_businessChatIdentifier forKey:@"businessChatIdentifier"];
  [v5 encodeObject:self->_contactWebsite forKey:@"contactWebsite"];
  [v5 encodeObject:self->_contactNumber forKey:@"contactNumber"];
  [v5 encodeObject:self->_accountSummary forKey:@"accountSummary"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_74;
  }
  createdDate = self->_createdDate;
  uint64_t v6 = (NSDate *)v4[3];
  if (createdDate && v6)
  {
    if ((-[NSDate isEqual:](createdDate, "isEqual:") & 1) == 0) {
      goto LABEL_74;
    }
  }
  else if (createdDate != v6)
  {
    goto LABEL_74;
  }
  lastUpdatedDate = self->_lastUpdatedDate;
  uint64_t v8 = (NSDate *)v4[2];
  if (lastUpdatedDate && v8)
  {
    if ((-[NSDate isEqual:](lastUpdatedDate, "isEqual:") & 1) == 0) {
      goto LABEL_74;
    }
  }
  else if (lastUpdatedDate != v8)
  {
    goto LABEL_74;
  }
  v9 = (void *)v4[4];
  uint64_t v10 = self->_countryCode;
  v11 = v9;
  if (v10 == v11)
  {
  }
  else
  {
    uint64_t v12 = v11;
    if (!v10 || !v11)
    {

      goto LABEL_74;
    }
    BOOL v13 = [(NSString *)v10 isEqualToString:v11];

    if (!v13) {
      goto LABEL_74;
    }
  }
  currencyCode = self->_currencyCode;
  v15 = (NSString *)v4[5];
  if (currencyCode && v15)
  {
    if ((-[NSString isEqual:](currencyCode, "isEqual:") & 1) == 0) {
      goto LABEL_74;
    }
  }
  else if (currencyCode != v15)
  {
    goto LABEL_74;
  }
  routingNumber = self->_routingNumber;
  v17 = (NSString *)v4[6];
  if (routingNumber && v17)
  {
    if ((-[NSString isEqual:](routingNumber, "isEqual:") & 1) == 0) {
      goto LABEL_74;
    }
  }
  else if (routingNumber != v17)
  {
    goto LABEL_74;
  }
  accountNumber = self->_accountNumber;
  uint64_t v19 = (NSString *)v4[7];
  if (accountNumber && v19)
  {
    if ((-[NSString isEqual:](accountNumber, "isEqual:") & 1) == 0) {
      goto LABEL_74;
    }
  }
  else if (accountNumber != v19)
  {
    goto LABEL_74;
  }
  productTimeZone = self->_productTimeZone;
  v21 = (NSTimeZone *)v4[8];
  if (productTimeZone && v21)
  {
    if ((-[NSTimeZone isEqual:](productTimeZone, "isEqual:") & 1) == 0) {
      goto LABEL_74;
    }
  }
  else if (productTimeZone != v21)
  {
    goto LABEL_74;
  }
  if (self->_moreInfoRequired != *((unsigned __int8 *)v4 + 8)
    || self->_fccStepUpRequired != *((unsigned __int8 *)v4 + 9)
    || self->_termsAcceptanceRequired != *((unsigned __int8 *)v4 + 10))
  {
    goto LABEL_74;
  }
  termsIdentifier = self->_termsIdentifier;
  uint64_t v23 = (NSString *)v4[10];
  if (termsIdentifier && v23)
  {
    if ((-[NSString isEqual:](termsIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_74;
    }
  }
  else if (termsIdentifier != v23)
  {
    goto LABEL_74;
  }
  privacyPolicyURL = self->_privacyPolicyURL;
  uint64_t v25 = (NSURL *)v4[11];
  if (privacyPolicyURL && v25)
  {
    if ((-[NSURL isEqual:](privacyPolicyURL, "isEqual:") & 1) == 0) {
      goto LABEL_74;
    }
  }
  else if (privacyPolicyURL != v25)
  {
    goto LABEL_74;
  }
  businessChatIdentifier = self->_businessChatIdentifier;
  uint64_t v27 = (NSString *)v4[12];
  if (businessChatIdentifier && v27)
  {
    if ((-[NSString isEqual:](businessChatIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_74;
    }
  }
  else if (businessChatIdentifier != v27)
  {
    goto LABEL_74;
  }
  contactWebsite = self->_contactWebsite;
  uint64_t v29 = (NSURL *)v4[13];
  if (contactWebsite && v29)
  {
    if ((-[NSURL isEqual:](contactWebsite, "isEqual:") & 1) == 0) {
      goto LABEL_74;
    }
  }
  else if (contactWebsite != v29)
  {
    goto LABEL_74;
  }
  contactNumber = self->_contactNumber;
  uint64_t v31 = (NSString *)v4[14];
  if (contactNumber && v31)
  {
    if ((-[NSString isEqual:](contactNumber, "isEqual:") & 1) == 0) {
      goto LABEL_74;
    }
  }
  else if (contactNumber != v31)
  {
    goto LABEL_74;
  }
  accountSummary = self->_accountSummary;
  uint64_t v33 = (PKSavingsAccountSummary *)v4[15];
  if (!accountSummary || !v33)
  {
    if (accountSummary == v33) {
      goto LABEL_70;
    }
LABEL_74:
    BOOL v36 = 0;
    goto LABEL_75;
  }
  if (!-[PKSavingsAccountSummary isEqual:](accountSummary, "isEqual:")) {
    goto LABEL_74;
  }
LABEL_70:
  fccStepUpDetails = self->_fccStepUpDetails;
  objc_super v35 = (PKSavingsAccountStepUpDetails *)v4[9];
  if (fccStepUpDetails && v35) {
    BOOL v36 = -[PKSavingsAccountStepUpDetails isEqual:](fccStepUpDetails, "isEqual:");
  }
  else {
    BOOL v36 = fccStepUpDetails == v35;
  }
LABEL_75:

  return v36;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_createdDate];
  [v3 safelyAddObject:self->_lastUpdatedDate];
  [v3 safelyAddObject:self->_countryCode];
  [v3 safelyAddObject:self->_currencyCode];
  [v3 safelyAddObject:self->_accountNumber];
  [v3 safelyAddObject:self->_routingNumber];
  [v3 safelyAddObject:self->_productTimeZone];
  [v3 safelyAddObject:self->_termsIdentifier];
  [v3 safelyAddObject:self->_privacyPolicyURL];
  [v3 safelyAddObject:self->_businessChatIdentifier];
  [v3 safelyAddObject:self->_contactWebsite];
  [v3 safelyAddObject:self->_contactNumber];
  [v3 safelyAddObject:self->_accountSummary];
  [v3 safelyAddObject:self->_fccStepUpDetails];
  uint64_t v4 = PKCombinedHash(17, v3);
  uint64_t v5 = self->_moreInfoRequired - v4 + 32 * v4;
  uint64_t v6 = self->_fccStepUpRequired - v5 + 32 * v5;
  unint64_t v7 = self->_termsAcceptanceRequired - v6 + 32 * v6;

  return v7;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  uint64_t v4 = [(NSDate *)self->_lastUpdatedDate description];
  [v3 appendFormat:@"lastUpdatedDate: '%@'; ", v4];

  uint64_t v5 = [(NSDate *)self->_createdDate description];
  [v3 appendFormat:@"createdDate: '%@'; ", v5];

  [v3 appendFormat:@"countryCode: '%@'; ", self->_countryCode];
  [v3 appendFormat:@"currencyCode: '%@'; ", self->_currencyCode];
  [v3 appendFormat:@"routingNumber: '%@'; ", self->_routingNumber];
  [v3 appendFormat:@"accountNumber: '%@'; ", self->_accountNumber];
  [v3 appendFormat:@"productTimeZone: '%@'; ", self->_productTimeZone];
  if (self->_moreInfoRequired) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  [v3 appendFormat:@"moreInfoRequired: '%@'; ", v6];
  if (self->_fccStepUpRequired) {
    unint64_t v7 = @"YES";
  }
  else {
    unint64_t v7 = @"NO";
  }
  [v3 appendFormat:@"fccStepUpRequired: '%@'; ", v7];
  uint64_t v8 = [(PKSavingsAccountStepUpDetails *)self->_fccStepUpDetails description];
  [v3 appendFormat:@"fccStepUpDetails: '%@'; ", v8];

  if (self->_termsAcceptanceRequired) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  [v3 appendFormat:@"termsAcceptanceRequired: '%@'; ", v9];
  [v3 appendFormat:@"termsIdentifier: '%@'; ", self->_termsIdentifier];
  [v3 appendFormat:@"privacyPolicyURL: '%@'; ", self->_privacyPolicyURL];
  [v3 appendFormat:@"businessChatIdentifier: '%@'; ", self->_businessChatIdentifier];
  [v3 appendFormat:@"contactWebsite: '%@'; ", self->_contactWebsite];
  [v3 appendFormat:@"contactNumber: '%@'; ", self->_contactNumber];
  uint64_t v10 = [(PKSavingsAccountSummary *)self->_accountSummary description];
  [v3 appendFormat:@"summary: '%@'; ", v10];

  [v3 appendFormat:@">"];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[PKSavingsAccountDetails allocWithZone:](PKSavingsAccountDetails, "allocWithZone:") init];
  uint64_t v6 = [(NSDate *)self->_lastUpdatedDate copyWithZone:a3];
  lastUpdatedDate = v5->_lastUpdatedDate;
  v5->_lastUpdatedDate = (NSDate *)v6;

  uint64_t v8 = [(NSDate *)self->_createdDate copyWithZone:a3];
  createdDate = v5->_createdDate;
  v5->_createdDate = (NSDate *)v8;

  uint64_t v10 = [(NSString *)self->_countryCode copyWithZone:a3];
  countryCode = v5->_countryCode;
  v5->_countryCode = (NSString *)v10;

  uint64_t v12 = [(NSString *)self->_currencyCode copyWithZone:a3];
  currencyCode = v5->_currencyCode;
  v5->_currencyCode = (NSString *)v12;

  uint64_t v14 = [(NSString *)self->_routingNumber copyWithZone:a3];
  routingNumber = v5->_routingNumber;
  v5->_routingNumber = (NSString *)v14;

  uint64_t v16 = [(NSString *)self->_accountNumber copyWithZone:a3];
  accountNumber = v5->_accountNumber;
  v5->_accountNumber = (NSString *)v16;

  uint64_t v18 = [(NSTimeZone *)self->_productTimeZone copyWithZone:a3];
  productTimeZone = v5->_productTimeZone;
  v5->_productTimeZone = (NSTimeZone *)v18;

  v5->_moreInfoRequired = self->_moreInfoRequired;
  v5->_fccStepUpRequired = self->_fccStepUpRequired;
  uint64_t v20 = [(PKSavingsAccountStepUpDetails *)self->_fccStepUpDetails copyWithZone:a3];
  fccStepUpDetails = v5->_fccStepUpDetails;
  v5->_fccStepUpDetails = v20;

  v5->_termsAcceptanceRequired = self->_termsAcceptanceRequired;
  uint64_t v22 = [(NSString *)self->_termsIdentifier copyWithZone:a3];
  termsIdentifier = v5->_termsIdentifier;
  v5->_termsIdentifier = (NSString *)v22;

  uint64_t v24 = [(NSURL *)self->_privacyPolicyURL copyWithZone:a3];
  privacyPolicyURL = v5->_privacyPolicyURL;
  v5->_privacyPolicyURL = (NSURL *)v24;

  uint64_t v26 = [(NSString *)self->_businessChatIdentifier copyWithZone:a3];
  businessChatIdentifier = v5->_businessChatIdentifier;
  v5->_businessChatIdentifier = (NSString *)v26;

  uint64_t v28 = [(NSURL *)self->_contactWebsite copyWithZone:a3];
  contactWebsite = v5->_contactWebsite;
  v5->_contactWebsite = (NSURL *)v28;

  uint64_t v30 = [(NSString *)self->_contactNumber copyWithZone:a3];
  contactNumber = v5->_contactNumber;
  v5->_contactNumber = (NSString *)v30;

  uint64_t v32 = [(PKSavingsAccountSummary *)self->_accountSummary copyWithZone:a3];
  accountSummary = v5->_accountSummary;
  v5->_accountSummary = v32;

  return v5;
}

- (NSDate)lastUpdatedDate
{
  return self->_lastUpdatedDate;
}

- (void)setLastUpdatedDate:(id)a3
{
}

- (NSDate)createdDate
{
  return self->_createdDate;
}

- (void)setCreatedDate:(id)a3
{
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
}

- (NSString)routingNumber
{
  return self->_routingNumber;
}

- (void)setRoutingNumber:(id)a3
{
}

- (NSString)accountNumber
{
  return self->_accountNumber;
}

- (void)setAccountNumber:(id)a3
{
}

- (NSTimeZone)productTimeZone
{
  return self->_productTimeZone;
}

- (void)setProductTimeZone:(id)a3
{
}

- (BOOL)moreInfoRequired
{
  return self->_moreInfoRequired;
}

- (void)setMoreInfoRequired:(BOOL)a3
{
  self->_moreInfoRequired = a3;
}

- (BOOL)fccStepUpRequired
{
  return self->_fccStepUpRequired;
}

- (void)setFccStepUpRequired:(BOOL)a3
{
  self->_fccStepUpRequired = a3;
}

- (PKSavingsAccountStepUpDetails)fccStepUpDetails
{
  return self->_fccStepUpDetails;
}

- (void)setFccStepUpDetails:(id)a3
{
}

- (BOOL)termsAcceptanceRequired
{
  return self->_termsAcceptanceRequired;
}

- (void)setTermsAcceptanceRequired:(BOOL)a3
{
  self->_termsAcceptanceRequired = a3;
}

- (NSString)termsIdentifier
{
  return self->_termsIdentifier;
}

- (void)setTermsIdentifier:(id)a3
{
}

- (NSURL)privacyPolicyURL
{
  return self->_privacyPolicyURL;
}

- (void)setPrivacyPolicyURL:(id)a3
{
}

- (NSString)businessChatIdentifier
{
  return self->_businessChatIdentifier;
}

- (void)setBusinessChatIdentifier:(id)a3
{
}

- (NSURL)contactWebsite
{
  return self->_contactWebsite;
}

- (void)setContactWebsite:(id)a3
{
}

- (NSString)contactNumber
{
  return self->_contactNumber;
}

- (void)setContactNumber:(id)a3
{
}

- (PKSavingsAccountSummary)accountSummary
{
  return self->_accountSummary;
}

- (void)setAccountSummary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountSummary, 0);
  objc_storeStrong((id *)&self->_contactNumber, 0);
  objc_storeStrong((id *)&self->_contactWebsite, 0);
  objc_storeStrong((id *)&self->_businessChatIdentifier, 0);
  objc_storeStrong((id *)&self->_privacyPolicyURL, 0);
  objc_storeStrong((id *)&self->_termsIdentifier, 0);
  objc_storeStrong((id *)&self->_fccStepUpDetails, 0);
  objc_storeStrong((id *)&self->_productTimeZone, 0);
  objc_storeStrong((id *)&self->_accountNumber, 0);
  objc_storeStrong((id *)&self->_routingNumber, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_createdDate, 0);
  objc_storeStrong((id *)&self->_lastUpdatedDate, 0);
}

@end