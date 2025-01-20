@interface PKAccountPaymentFundingSource
+ (BOOL)supportsSecureCoding;
+ (Class)fundingDetailsClassForFundingSourceType:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)accountSuffix;
- (NSString)identifier;
- (PKAccountPaymentFundingDetails)fundingDetails;
- (PKAccountPaymentFundingSource)initWithCoder:(id)a3;
- (PKAccountPaymentFundingSource)initWithDictionary:(id)a3;
- (PKAccountPaymentFundingSource)initWithType:(int64_t)a3;
- (id)bankAccountRepresentation;
- (id)description;
- (id)displayDescription;
- (id)hashComponentWithCertificatesResponse:(id)a3;
- (id)jsonDictionaryRepresentation;
- (id)jsonDictionaryRepresentationWithCertificatesResponse:(id)a3;
- (id)jsonString;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountSuffix:(id)a3;
- (void)setFundingDetails:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation PKAccountPaymentFundingSource

+ (Class)fundingDetailsClassForFundingSourceType:(int64_t)a3
{
  v4 = objc_opt_class();
  if ((a3 & 0xFFFFFFFFFFFFFFFBLL) == 1 || a3 == 2) {
    v4 = objc_opt_class();
  }
  return (Class)v4;
}

- (PKAccountPaymentFundingSource)initWithType:(int64_t)a3
{
  v5 = (void *)[(id)objc_opt_class() fundingDetailsClassForFundingSourceType:a3];
  if ([v5 isSubclassOfClass:objc_opt_class()]
    && (id v6 = objc_alloc_init((Class)v5)) != 0)
  {
    v7 = v6;
    v12.receiver = self;
    v12.super_class = (Class)PKAccountPaymentFundingSource;
    v8 = [(PKAccountPaymentFundingSource *)&v12 init];
    v9 = v8;
    if (v8)
    {
      v8->_type = a3;
      objc_storeStrong((id *)&v8->_fundingDetails, v7);
    }
    self = v9;

    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (PKAccountPaymentFundingSource)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKAccountPaymentFundingSource;
  v5 = [(PKAccountPaymentFundingSource *)&v15 init];
  if (v5)
  {
    id v6 = [v4 PKStringForKey:@"accountSuffix"];
    v7 = [v4 PKStringForKey:@"type"];
    v8 = [v4 PKDictionaryForKey:@"fundingDetails"];
    if (v6) {
      objc_storeStrong((id *)&v5->_accountSuffix, v6);
    }
    if (v7) {
      v5->_type = PKAccountPaymentFundingSourceTypeFromString(v7);
    }
    if (v8)
    {
      v9 = (objc_class *)[(id)objc_opt_class() fundingDetailsClassForFundingSourceType:v5->_type];
      if ([(objc_class *)v9 isSubclassOfClass:objc_opt_class()])
      {
        uint64_t v10 = [[v9 alloc] initWithDictionary:v8];
        fundingDetails = v5->_fundingDetails;
        v5->_fundingDetails = (PKAccountPaymentFundingDetails *)v10;
      }
    }
    uint64_t v12 = [v4 PKStringForKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v12;
  }
  return v5;
}

- (id)bankAccountRepresentation
{
  if ((self->_type | 4) == 5)
  {
    v3 = self->_fundingDetails;
    id v4 = [[PKBankAccountInformation alloc] initWithType:1];
    [(PKBankAccountInformation *)v4 setAccountNumber:self->_accountSuffix];
    [(PKBankAccountInformation *)v4 setIdentifier:self->_identifier];
    v5 = [(PKAccountPaymentFundingDetails *)v3 name];
    [(PKBankAccountInformation *)v4 setBankName:v5];

    uint64_t v6 = [(PKAccountPaymentFundingDetails *)v3 status];
    [(PKBankAccountInformation *)v4 setStatus:v6];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)displayDescription
{
  v7 = 0;
  switch(self->_type)
  {
    case 1:
    case 5:
      v9 = self->_accountSuffix;
      uint64_t v10 = [(PKAccountPaymentFundingSource *)self fundingDetails];
      v11 = [v10 name];
      v17 = v11;
      if (v11)
      {
        id v18 = v11;
      }
      else
      {
        PKLocalizedFeatureString(@"ACCOUNT_SERVICE_BANK_ACCOUNT_DEFAULT_NAME", 2, 0, v12, v13, v14, v15, v16, v28);
        id v18 = (id)objc_claimAutoreleasedReturnValue();
      }
      v20 = v18;

      if (v9)
      {
        PKLocalizedFeatureString(@"ACCOUNT_SERVICE_BANK_ACCOUNT_DISPLAY_DESCRIPTION_FORMAT", 2, @"%1$@%2$@", v21, v22, v23, v24, v25, (uint64_t)v20);
        id v26 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v26 = v20;
      }
      v7 = v26;

      break;
    case 2:
      v19 = @"ACCOUNT_SERVICE_PAYMENT_INFORMATION_DISPLAY_DESCRIPTION_TYPE_APC";
      goto LABEL_6;
    case 3:
      v19 = @"ACCOUNT_SERVICE_PAYMENT_INFORMATION_DISPLAY_DESCRIPTION_TYPE_OFFLINE";
LABEL_6:
      v7 = PKLocalizedFeatureString(v19, 2, 0, v2, v3, v4, v5, v6, v28);
      break;
    default:
      break;
  }
  return v7;
}

- (id)jsonString
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F28D90];
  uint64_t v3 = [(PKAccountPaymentFundingSource *)self jsonDictionaryRepresentation];
  id v9 = 0;
  uint64_t v4 = [v2 dataWithJSONObject:v3 options:2 error:&v9];
  id v5 = v9;

  if (v5)
  {
    uint64_t v6 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Error forming json dictionary for CloudKit with error: %@", buf, 0xCu);
    }

    v7 = 0;
  }
  else
  {
    v7 = (void *)[[NSString alloc] initWithData:v4 encoding:4];
  }

  return v7;
}

- (id)jsonDictionaryRepresentation
{
  return [(PKAccountPaymentFundingSource *)self jsonDictionaryRepresentationWithCertificatesResponse:0];
}

- (id)jsonDictionaryRepresentationWithCertificatesResponse:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v6 = v5;
  identifier = self->_identifier;
  if (identifier)
  {
    [v5 setObject:identifier forKeyedSubscript:@"identifier"];
  }
  else
  {
    v8 = [(PKAccountPaymentFundingDetails *)self->_fundingDetails jsonDictionaryRepresentationWithCertificatesResponse:v4];
    if ([v8 count]) {
      [v6 setObject:v8 forKeyedSubscript:@"fundingDetails"];
    }
  }
  [v6 setObject:self->_accountSuffix forKeyedSubscript:@"accountSuffix"];
  id v9 = PKAccountPaymentFundingSourceTypeToString(self->_type);
  [v6 setObject:v9 forKeyedSubscript:@"type"];

  uint64_t v10 = (void *)[v6 copy];
  return v10;
}

- (id)hashComponentWithCertificatesResponse:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28E78] string];
  uint64_t v6 = v5;
  int64_t type = self->_type;
  if (type == 2)
  {
    identifier = @"APC";
LABEL_8:
    [v6 appendString:identifier];
    goto LABEL_9;
  }
  if (type != 1) {
    goto LABEL_9;
  }
  [v5 appendString:@"ACH"];
  identifier = (__CFString *)self->_identifier;
  if (identifier) {
    goto LABEL_8;
  }
  id v9 = [(PKAccountPaymentFundingDetails *)self->_fundingDetails hashComponentWithCertificatesResponse:v4];
  if (v9) {
    [v6 appendString:v9];
  }

LABEL_9:
  uint64_t v10 = (void *)[v6 copy];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountPaymentFundingSource)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKAccountPaymentFundingSource;
  id v5 = [(PKAccountPaymentFundingSource *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountSuffix"];
    accountSuffix = v5->_accountSuffix;
    v5->_accountSuffix = (NSString *)v8;

    v5->_int64_t type = [v4 decodeIntegerForKey:@"type"];
    uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"fundingDetails"];
    fundingDetails = v5->_fundingDetails;
    v5->_fundingDetails = (PKAccountPaymentFundingDetails *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_accountSuffix forKey:@"accountSuffix"];
  [v5 encodeInteger:self->_type forKey:@"type"];
  [v5 encodeObject:self->_fundingDetails forKey:@"fundingDetails"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_17;
  }
  identifier = self->_identifier;
  uint64_t v6 = (NSString *)v4[1];
  if (identifier && v6)
  {
    if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0) {
      goto LABEL_17;
    }
  }
  else if (identifier != v6)
  {
    goto LABEL_17;
  }
  accountSuffix = self->_accountSuffix;
  uint64_t v8 = (NSString *)v4[3];
  if (accountSuffix && v8)
  {
    if ((-[NSString isEqual:](accountSuffix, "isEqual:") & 1) == 0) {
      goto LABEL_17;
    }
  }
  else if (accountSuffix != v8)
  {
    goto LABEL_17;
  }
  fundingDetails = self->_fundingDetails;
  uint64_t v10 = (PKAccountPaymentFundingDetails *)v4[4];
  if (!fundingDetails || !v10)
  {
    if (fundingDetails == v10) {
      goto LABEL_15;
    }
LABEL_17:
    BOOL v11 = 0;
    goto LABEL_18;
  }
  if (!-[PKAccountPaymentFundingDetails isEqual:](fundingDetails, "isEqual:")) {
    goto LABEL_17;
  }
LABEL_15:
  BOOL v11 = self->_type == v4[2];
LABEL_18:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_accountSuffix];
  [v3 safelyAddObject:self->_fundingDetails];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_type - v4 + 32 * v4;

  return v5;
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  [v3 appendFormat:@"accountSuffix: '%@'; ", self->_accountSuffix];
  uint64_t v4 = PKAccountPaymentFundingSourceTypeToString(self->_type);
  [v3 appendFormat:@"type: '%@'; ", v4];

  [v3 appendFormat:@"fundingDetails: '%@'; ", self->_fundingDetails];
  [v3 appendFormat:@">"];
  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
}

- (NSString)accountSuffix
{
  return self->_accountSuffix;
}

- (void)setAccountSuffix:(id)a3
{
}

- (PKAccountPaymentFundingDetails)fundingDetails
{
  return self->_fundingDetails;
}

- (void)setFundingDetails:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fundingDetails, 0);
  objc_storeStrong((id *)&self->_accountSuffix, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end