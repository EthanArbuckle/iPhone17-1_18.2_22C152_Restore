@interface PKPayLaterPaymentFundingSource
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFundingSource:(id)a3;
- (NSString)description;
- (NSString)identifier;
- (PKCurrencyAmount)refundAmount;
- (PKPayLaterFundingSourceDetails)details;
- (PKPayLaterPaymentFundingSource)initWithCoder:(id)a3;
- (PKPayLaterPaymentFundingSource)initWithDictionary:(id)a3;
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
- (void)setDetails:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setRefundAmount:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PKPayLaterPaymentFundingSource

- (PKPayLaterPaymentFundingSource)initWithDictionary:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKPayLaterPaymentFundingSource;
  v5 = [(PKPayLaterPaymentFundingSource *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = [v4 PKStringForKey:@"sourceType"];
    v9 = v8;
    if (v8)
    {
      v5->_type = PKPayLaterFundingSourceTypeFromString(v8);
      p_type = &v5->_type;
    }
    else
    {
      v11 = [v4 PKStringForKey:@"type"];
      v5->_type = PKPayLaterFundingSourceTypeFromString(v11);
      p_type = &v5->_type;
    }
    uint64_t v12 = [v4 PKCurrencyAmountForKey:@"refundAmount"];
    refundAmount = v5->_refundAmount;
    v5->_refundAmount = (PKCurrencyAmount *)v12;

    v14 = [v4 PKDictionaryForKey:@"sourceDetails"];
    if (![v14 count]) {
      goto LABEL_12;
    }
    unint64_t v15 = *p_type;
    if (*p_type != 3)
    {
      if (v15 == 2)
      {
        v16 = PKPayLaterFundingSourceBankDetails;
        goto LABEL_11;
      }
      if (v15 != 1)
      {
LABEL_12:

        goto LABEL_13;
      }
    }
    v16 = PKPayLaterFundingSourcePaymentPassDetails;
LABEL_11:
    uint64_t v17 = [[v16 alloc] initWithDictionary:v14 type:v5->_type];
    details = v5->_details;
    v5->_details = (PKPayLaterFundingSourceDetails *)v17;

    goto LABEL_12;
  }
LABEL_13:

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_identifier forKeyedSubscript:@"identifier"];
  id v4 = PKPayLaterFundingSourceTypeToString(self->_type);
  [v3 setObject:v4 forKeyedSubscript:@"sourceType"];

  v5 = [(PKPayLaterFundingSourceDetails *)self->_details dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"sourceDetails"];

  uint64_t v6 = [(PKCurrencyAmount *)self->_refundAmount dictionaryRepresentation];
  [v3 setObject:v6 forKeyedSubscript:@"refundAmount"];

  v7 = (void *)[v3 copy];
  return v7;
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

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPayLaterPaymentFundingSource *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPayLaterPaymentFundingSource *)self isEqualToFundingSource:v5];

  return v6;
}

- (BOOL)isEqualToFundingSource:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_15;
  }
  BOOL v6 = (void *)v4[4];
  v7 = self->_identifier;
  v8 = v6;
  if (v7 == v8)
  {
  }
  else
  {
    v9 = v8;
    if (!v7 || !v8)
    {

      goto LABEL_15;
    }
    BOOL v10 = [(NSString *)v7 isEqualToString:v8];

    if (!v10) {
      goto LABEL_15;
    }
  }
  if (self->_type != v5[1])
  {
LABEL_15:
    BOOL v13 = 0;
    goto LABEL_16;
  }
  details = self->_details;
  uint64_t v12 = (PKPayLaterFundingSourceDetails *)v5[2];
  if (details && v12)
  {
    if (-[PKPayLaterFundingSourceDetails isEqual:](details, "isEqual:")) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  if (details != v12) {
    goto LABEL_15;
  }
LABEL_17:
  refundAmount = self->_refundAmount;
  v16 = (PKCurrencyAmount *)v5[3];
  if (refundAmount && v16) {
    BOOL v13 = -[PKCurrencyAmount isEqual:](refundAmount, "isEqual:");
  }
  else {
    BOOL v13 = refundAmount == v16;
  }
LABEL_16:

  return v13;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_details];
  [v3 safelyAddObject:self->_refundAmount];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_type - v4 + 32 * v4;

  return v5;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  uint64_t v4 = PKPayLaterFundingSourceTypeToString(self->_type);
  [v3 appendFormat:@"type: '%@'; ", v4];

  if (self->_identifier) {
    [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  }
  [v3 appendFormat:@"details: '%@'; ", self->_details];
  if (self->_refundAmount) {
    [v3 appendFormat:@"refundAmount: '%@'; ", self->_refundAmount];
  }
  [v3 appendFormat:@">"];
  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterPaymentFundingSource)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPayLaterPaymentFundingSource;
  unint64_t v5 = [(PKPayLaterPaymentFundingSource *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_unint64_t type = [v4 decodeIntegerForKey:@"sourceType"];
    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"sourceDetails"];
    details = v5->_details;
    v5->_details = (PKPayLaterFundingSourceDetails *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"refundAmount"];
    refundAmount = v5->_refundAmount;
    v5->_refundAmount = (PKCurrencyAmount *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeInteger:self->_type forKey:@"sourceType"];
  [v5 encodeObject:self->_details forKey:@"sourceDetails"];
  [v5 encodeObject:self->_refundAmount forKey:@"refundAmount"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKPayLaterPaymentFundingSource allocWithZone:](PKPayLaterPaymentFundingSource, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  uint64_t v8 = [(PKPayLaterFundingSourceDetails *)self->_details copyWithZone:a3];
  details = v5->_details;
  v5->_details = (PKPayLaterFundingSourceDetails *)v8;

  v5->_unint64_t type = self->_type;
  uint64_t v10 = [(PKCurrencyAmount *)self->_refundAmount copyWithZone:a3];
  refundAmount = v5->_refundAmount;
  v5->_refundAmount = v10;

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

- (PKCurrencyAmount)refundAmount
{
  return self->_refundAmount;
}

- (void)setRefundAmount:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_refundAmount, 0);
  objc_storeStrong((id *)&self->_details, 0);
}

@end