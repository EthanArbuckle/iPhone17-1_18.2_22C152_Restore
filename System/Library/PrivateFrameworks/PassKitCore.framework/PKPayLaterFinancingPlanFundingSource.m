@interface PKPayLaterFinancingPlanFundingSource
+ (BOOL)supportsSecureCoding;
- (BOOL)autoPayment;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)identifier;
- (PKPayLaterFinancingPlanFundingSource)initWithCoder:(id)a3;
- (PKPayLaterFinancingPlanFundingSource)initWithDictionary:(id)a3;
- (PKPayLaterFundingSourceDetails)details;
- (id)bankDetails;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)displayName;
- (id)panSuffix;
- (id)paymentPassDetails;
- (id)unmaskedPanSuffix;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setAutoPayment:(BOOL)a3;
- (void)setDetails:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PKPayLaterFinancingPlanFundingSource

- (PKPayLaterFinancingPlanFundingSource)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPayLaterFinancingPlanFundingSource;
  v5 = [(PKPayLaterFinancingPlanFundingSource *)&v15 init];
  if (v5)
  {
    v6 = [v4 PKStringForKey:@"type"];
    v5->_unint64_t type = PKPayLaterFundingSourceTypeFromString(v6);

    uint64_t v7 = [v4 PKStringForKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    v5->_autoPayment = [v4 PKBoolForKey:@"autoPayment"];
    v9 = [v4 PKDictionaryForKey:@"sourceDetails"];
    if ([v9 count])
    {
      unint64_t type = v5->_type;
      switch(type)
      {
        case 3uLL:
          goto LABEL_6;
        case 2uLL:
          v11 = PKPayLaterFundingSourceBankDetails;
          goto LABEL_8;
        case 1uLL:
LABEL_6:
          v11 = PKPayLaterFundingSourcePaymentPassDetails;
LABEL_8:
          uint64_t v12 = [[v11 alloc] initWithDictionary:v9 type:v5->_type];
          details = v5->_details;
          v5->_details = (PKPayLaterFundingSourceDetails *)v12;

          break;
      }
    }
  }
  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = PKPayLaterFundingSourceTypeToString(self->_type);
  [v3 setObject:v4 forKeyedSubscript:@"type"];

  [v3 setObject:self->_identifier forKeyedSubscript:@"identifier"];
  v5 = [NSNumber numberWithBool:self->_autoPayment];
  [v3 setObject:v5 forKeyedSubscript:@"autoPayment"];

  v6 = [(PKPayLaterFundingSourceDetails *)self->_details dictionaryRepresentation];
  [v3 setObject:v6 forKeyedSubscript:@"sourceDetails"];

  uint64_t v7 = (void *)[v3 copy];
  return v7;
}

- (id)paymentPassDetails
{
  if ((self->_type | 2) == 3) {
    v2 = self->_details;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (id)bankDetails
{
  if (self->_type == 2) {
    v2 = self->_details;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (id)displayName
{
  unint64_t type = self->_type;
  switch(type)
  {
    case 3uLL:
      goto LABEL_4;
    case 2uLL:
      id v3 = [(PKPayLaterFundingSourceDetails *)self->_details bankName];
      break;
    case 1uLL:
LABEL_4:
      id v3 = [(PKPayLaterFundingSourceDetails *)self->_details cardName];
      break;
    default:
      id v3 = 0;
      break;
  }
  return v3;
}

- (id)panSuffix
{
  unint64_t type = self->_type;
  if (type != 3)
  {
    if (type == 2)
    {
      uint64_t v3 = [(PKPayLaterFundingSourceDetails *)self->_details accountNumberSuffix];
      id v4 = (void *)v3;
      goto LABEL_7;
    }
    if (type != 1)
    {
      v5 = 0;
      goto LABEL_11;
    }
  }
  uint64_t v3 = [(PKPayLaterFundingSourceDetails *)self->_details cardSuffix];
  id v4 = (void *)v3;
  if (!v3)
  {
    v5 = 0;
    goto LABEL_10;
  }
LABEL_7:
  v5 = PKMaskedPaymentPAN(v3);
LABEL_10:

LABEL_11:
  return v5;
}

- (id)unmaskedPanSuffix
{
  unint64_t type = self->_type;
  switch(type)
  {
    case 3uLL:
      goto LABEL_4;
    case 2uLL:
      uint64_t v3 = [(PKPayLaterFundingSourceDetails *)self->_details accountNumberSuffix];
      break;
    case 1uLL:
LABEL_4:
      uint64_t v3 = [(PKPayLaterFundingSourceDetails *)self->_details cardSuffix];
      break;
    default:
      uint64_t v3 = 0;
      break;
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPayLaterFinancingPlanFundingSource *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v6 = v5;
        details = self->_details;
        v8 = v6->_details;
        if (details && v8)
        {
          if ((-[PKPayLaterFundingSourceDetails isEqual:](details, "isEqual:") & 1) == 0) {
            goto LABEL_20;
          }
        }
        else if (details != v8)
        {
          goto LABEL_20;
        }
        identifier = v6->_identifier;
        v11 = self->_identifier;
        uint64_t v12 = identifier;
        if (v11 == v12)
        {
        }
        else
        {
          v13 = v12;
          if (!v11 || !v12)
          {

            goto LABEL_20;
          }
          BOOL v14 = [(NSString *)v11 isEqualToString:v12];

          if (!v14) {
            goto LABEL_20;
          }
        }
        if (self->_autoPayment == v6->_autoPayment)
        {
          BOOL v9 = self->_type == v6->_type;
LABEL_21:

          goto LABEL_22;
        }
LABEL_20:
        BOOL v9 = 0;
        goto LABEL_21;
      }
    }
    BOOL v9 = 0;
  }
LABEL_22:

  return v9;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_details];
  [v3 safelyAddObject:self->_identifier];
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterFinancingPlanFundingSource;
  id v4 = [(PKPayLaterFinancingPlanFundingSource *)&v9 hash];
  uint64_t v5 = PKCombinedHash((uint64_t)v4, v3);
  uint64_t v6 = self->_autoPayment - v5 + 32 * v5;
  unint64_t v7 = self->_type - v6 + 32 * v6;

  return v7;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = PKPayLaterFundingSourceTypeToString(self->_type);
  [v3 appendFormat:@"type: '%@'; ", v4];

  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  if (self->_autoPayment) {
    uint64_t v5 = @"YES";
  }
  else {
    uint64_t v5 = @"NO";
  }
  [v3 appendFormat:@"autoPayment: '%@'; ", v5];
  [v3 appendFormat:@"details: '%@'; ", self->_details];
  [v3 appendFormat:@">"];
  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterFinancingPlanFundingSource)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPayLaterFinancingPlanFundingSource;
  uint64_t v5 = [(PKPayLaterFinancingPlanFundingSource *)&v15 init];
  if (v5)
  {
    v5->_autoPayment = [v4 decodeBoolForKey:@"autoPayment"];
    v5->_unint64_t type = [v4 decodeIntegerForKey:@"type"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"sourceDetails"];
    details = v5->_details;
    v5->_details = (PKPayLaterFundingSourceDetails *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL autoPayment = self->_autoPayment;
  id v5 = a3;
  [v5 encodeBool:autoPayment forKey:@"autoPayment"];
  [v5 encodeInteger:self->_type forKey:@"type"];
  [v5 encodeObject:self->_details forKey:@"sourceDetails"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKPayLaterFinancingPlanFundingSource allocWithZone:](PKPayLaterFinancingPlanFundingSource, "allocWithZone:") init];
  v5->_BOOL autoPayment = self->_autoPayment;
  uint64_t v6 = [(PKPayLaterFundingSourceDetails *)self->_details copyWithZone:a3];
  details = v5->_details;
  v5->_details = (PKPayLaterFundingSourceDetails *)v6;

  uint64_t v8 = [(NSString *)self->_identifier copyWithZone:a3];
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v8;

  v5->_unint64_t type = self->_type;
  return v5;
}

- (PKPayLaterFundingSourceDetails)details
{
  return self->_details;
}

- (void)setDetails:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_unint64_t type = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)autoPayment
{
  return self->_autoPayment;
}

- (void)setAutoPayment:(BOOL)a3
{
  self->_BOOL autoPayment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_details, 0);
}

@end