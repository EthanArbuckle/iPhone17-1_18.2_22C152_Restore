@interface PKPayLaterFinancingOptionFundingSource
+ (BOOL)supportsSecureCoding;
- (BOOL)autoPayment;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (PKPayLaterFinancingOptionFundingSource)initWithAccountFundingSource:(id)a3;
- (PKPayLaterFinancingOptionFundingSource)initWithCoder:(id)a3;
- (PKPayLaterFinancingOptionFundingSource)initWithDictionary:(id)a3;
- (PKPayLaterFinancingOptionFundingSource)initWithPaymentPass:(id)a3 paymentApplication:(id)a4;
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
- (void)setType:(unint64_t)a3;
@end

@implementation PKPayLaterFinancingOptionFundingSource

- (PKPayLaterFinancingOptionFundingSource)initWithPaymentPass:(id)a3 paymentApplication:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PKPayLaterFinancingOptionFundingSource;
  v8 = [(PKPayLaterFinancingOptionFundingSource *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = 1;
    v10 = [[PKPayLaterFundingSourcePaymentPassDetails alloc] initWithPaymentPass:v6 paymentApplication:v7];
    details = v9->_details;
    v9->_details = (PKPayLaterFundingSourceDetails *)v10;
  }
  return v9;
}

- (PKPayLaterFinancingOptionFundingSource)initWithAccountFundingSource:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPayLaterFinancingOptionFundingSource;
  v5 = [(PKPayLaterFinancingOptionFundingSource *)&v10 init];
  id v6 = v5;
  if (v5)
  {
    v5->_type = 2;
    id v7 = [[PKPayLaterFundingSourceBankDetails alloc] initWithAccountFundingSource:v4];
    details = v6->_details;
    v6->_details = (PKPayLaterFundingSourceDetails *)v7;
  }
  return v6;
}

- (PKPayLaterFinancingOptionFundingSource)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKPayLaterFinancingOptionFundingSource;
  v5 = [(PKPayLaterFinancingOptionFundingSource *)&v16 init];
  if (v5)
  {
    id v6 = [v4 PKStringForKey:@"type"];
    id v7 = v6;
    if (v6)
    {
      v5->_type = PKPayLaterFundingSourceTypeFromString(v6);
      p_type = &v5->_type;
    }
    else
    {
      v9 = [v4 PKStringForKey:@"sourceType"];
      v5->_type = PKPayLaterFundingSourceTypeFromString(v9);
      p_type = &v5->_type;
    }
    v5->_autoPayment = [v4 PKBoolForKey:@"autoPayment"];
    objc_super v10 = [v4 PKDictionaryForKey:@"sourceDetails"];
    if (![v10 count]) {
      goto LABEL_12;
    }
    unint64_t v11 = *p_type;
    if (*p_type != 3)
    {
      if (v11 == 2)
      {
        v12 = PKPayLaterFundingSourceBankDetails;
        goto LABEL_11;
      }
      if (v11 != 1)
      {
LABEL_12:

        goto LABEL_13;
      }
    }
    v12 = PKPayLaterFundingSourcePaymentPassDetails;
LABEL_11:
    uint64_t v13 = [[v12 alloc] initWithDictionary:v10 type:v5->_type];
    details = v5->_details;
    v5->_details = (PKPayLaterFundingSourceDetails *)v13;

    goto LABEL_12;
  }
LABEL_13:

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = PKPayLaterFundingSourceTypeToString(self->_type);
  [v3 setObject:v4 forKeyedSubscript:@"type"];

  v5 = [NSNumber numberWithBool:self->_autoPayment];
  [v3 setObject:v5 forKeyedSubscript:@"autoPayment"];

  details = self->_details;
  if (details)
  {
    id v7 = [(PKPayLaterFundingSourceDetails *)details dictionaryRepresentation];
    [v3 setObject:v7 forKeyedSubscript:@"sourceDetails"];
  }
  v8 = (void *)[v3 copy];

  return v8;
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
  id v4 = (PKPayLaterFinancingOptionFundingSource *)a3;
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
        id v6 = v5;
        details = self->_details;
        v8 = v6->_details;
        if (details && v8)
        {
          if ((-[PKPayLaterFundingSourceDetails isEqual:](details, "isEqual:") & 1) == 0) {
            goto LABEL_13;
          }
        }
        else if (details != v8)
        {
          goto LABEL_13;
        }
        if (self->_autoPayment == v6->_autoPayment)
        {
          BOOL v9 = self->_type == v6->_type;
LABEL_14:

          goto LABEL_15;
        }
LABEL_13:
        BOOL v9 = 0;
        goto LABEL_14;
      }
    }
    BOOL v9 = 0;
  }
LABEL_15:

  return v9;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_details];
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterFinancingOptionFundingSource;
  id v4 = [(PKPayLaterFinancingOptionFundingSource *)&v9 hash];
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

- (PKPayLaterFinancingOptionFundingSource)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPayLaterFinancingOptionFundingSource;
  uint64_t v5 = [(PKPayLaterFinancingOptionFundingSource *)&v13 init];
  if (v5)
  {
    v5->_autoPayment = [v4 decodeBoolForKey:@"autoPayment"];
    v5->_unint64_t type = [v4 decodeIntegerForKey:@"type"];
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    objc_super v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"sourceDetails"];
    details = v5->_details;
    v5->_details = (PKPayLaterFundingSourceDetails *)v10;
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
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKPayLaterFinancingOptionFundingSource allocWithZone:](PKPayLaterFinancingOptionFundingSource, "allocWithZone:") init];
  v5->_BOOL autoPayment = self->_autoPayment;
  uint64_t v6 = [(PKPayLaterFundingSourceDetails *)self->_details copyWithZone:a3];
  details = v5->_details;
  v5->_details = (PKPayLaterFundingSourceDetails *)v6;

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
}

@end