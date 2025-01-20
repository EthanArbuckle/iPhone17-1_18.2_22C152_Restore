@interface PKPaymentRewardsRedemptionTransactionDetails
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)timestamp;
- (NSNumber)merchantCategoryCode;
- (NSString)descriptionText;
- (NSString)identifier;
- (NSString)merchantRawName;
- (PKCurrencyAmount)monetaryValue;
- (PKPaymentRewardsRedemptionTransactionDetails)initWithCoder:(id)a3;
- (PKPaymentRewardsRedemptionTransactionDetails)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDescriptionText:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMerchantCategoryCode:(id)a3;
- (void)setMerchantRawName:(id)a3;
- (void)setMonetaryValue:(id)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation PKPaymentRewardsRedemptionTransactionDetails

- (PKPaymentRewardsRedemptionTransactionDetails)initWithDictionary:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKPaymentRewardsRedemptionTransactionDetails;
  v5 = [(PKPaymentRewardsRedemptionTransactionDetails *)&v20 init];
  if (!v5) {
    goto LABEL_5;
  }
  uint64_t v6 = [v4 PKStringForKey:@"identifier"];
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  uint64_t v8 = [v4 PKDateForKey:@"timestamp"];
  timestamp = v5->_timestamp;
  v5->_timestamp = (NSDate *)v8;

  uint64_t v10 = [v4 PKStringForKey:@"description"];
  descriptionText = v5->_descriptionText;
  v5->_descriptionText = (NSString *)v10;

  uint64_t v12 = [v4 PKCurrencyAmountForKey:@"monetaryValue"];
  monetaryValue = v5->_monetaryValue;
  v5->_monetaryValue = (PKCurrencyAmount *)v12;

  uint64_t v14 = [v4 PKDecimalNumberFromStringForKey:@"merchantCategoryCode"];
  merchantCategoryCode = v5->_merchantCategoryCode;
  v5->_merchantCategoryCode = (NSNumber *)v14;

  uint64_t v16 = [v4 PKStringForKey:@"merchantRawName"];
  merchantRawName = v5->_merchantRawName;
  v5->_merchantRawName = (NSString *)v16;

  if (!v5->_identifier) {
    goto LABEL_6;
  }
  if (v5->_merchantRawName && v5->_monetaryValue) {
LABEL_5:
  }
    v18 = v5;
  else {
LABEL_6:
  }
    v18 = 0;

  return v18;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_identifier forKeyedSubscript:@"identifier"];
  id v4 = PKW3CDateStringFromDate(self->_timestamp);
  [v3 setObject:v4 forKeyedSubscript:@"timestamp"];

  [v3 setObject:self->_descriptionText forKeyedSubscript:@"description"];
  v5 = [(PKCurrencyAmount *)self->_monetaryValue dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"monetaryValue"];

  uint64_t v6 = [(NSNumber *)self->_merchantCategoryCode stringValue];
  [v3 setObject:v6 forKeyedSubscript:@"merchantCategoryCode"];

  [v3 setObject:self->_merchantRawName forKeyedSubscript:@"merchantRawName"];
  v7 = (void *)[v3 copy];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPaymentRewardsRedemptionTransactionDetails *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = v5;
        identifier = self->_identifier;
        uint64_t v8 = v6->_identifier;
        if (identifier && v8)
        {
          if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0) {
            goto LABEL_33;
          }
        }
        else if (identifier != v8)
        {
          goto LABEL_33;
        }
        timestamp = self->_timestamp;
        v11 = v6->_timestamp;
        if (timestamp && v11)
        {
          if ((-[NSDate isEqual:](timestamp, "isEqual:") & 1) == 0) {
            goto LABEL_33;
          }
        }
        else if (timestamp != v11)
        {
          goto LABEL_33;
        }
        descriptionText = self->_descriptionText;
        v13 = v6->_descriptionText;
        if (descriptionText && v13)
        {
          if ((-[NSString isEqual:](descriptionText, "isEqual:") & 1) == 0) {
            goto LABEL_33;
          }
        }
        else if (descriptionText != v13)
        {
          goto LABEL_33;
        }
        monetaryValue = self->_monetaryValue;
        v15 = v6->_monetaryValue;
        if (monetaryValue && v15)
        {
          if (!-[PKCurrencyAmount isEqual:](monetaryValue, "isEqual:")) {
            goto LABEL_33;
          }
        }
        else if (monetaryValue != v15)
        {
          goto LABEL_33;
        }
        merchantCategoryCode = self->_merchantCategoryCode;
        v17 = v6->_merchantCategoryCode;
        if (merchantCategoryCode && v17)
        {
          if (-[NSNumber isEqual:](merchantCategoryCode, "isEqual:"))
          {
LABEL_29:
            merchantRawName = self->_merchantRawName;
            v19 = v6->_merchantRawName;
            if (merchantRawName && v19) {
              char v9 = -[NSString isEqual:](merchantRawName, "isEqual:");
            }
            else {
              char v9 = merchantRawName == v19;
            }
            goto LABEL_34;
          }
        }
        else if (merchantCategoryCode == v17)
        {
          goto LABEL_29;
        }
LABEL_33:
        char v9 = 0;
LABEL_34:

        goto LABEL_35;
      }
    }
    char v9 = 0;
  }
LABEL_35:

  return v9;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_timestamp];
  [v3 safelyAddObject:self->_descriptionText];
  [v3 safelyAddObject:self->_monetaryValue];
  [v3 safelyAddObject:self->_merchantCategoryCode];
  [v3 safelyAddObject:self->_merchantRawName];
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentRewardsRedemptionTransactionDetails;
  id v4 = [(PKPaymentRewardsRedemptionTransactionDetails *)&v7 hash];
  unint64_t v5 = PKCombinedHash((uint64_t)v4, v3);

  return v5;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  [v3 appendFormat:@"timestamp: '%@'; ", self->_timestamp];
  [v3 appendFormat:@"description: '%@'; ", self->_descriptionText];
  [v3 appendFormat:@"monetaryValue: '%@'; ", self->_monetaryValue];
  [v3 appendFormat:@"merchantCategoryCode: '%@'; ", self->_merchantCategoryCode];
  [v3 appendFormat:@"merchantRawName: '%@'; ", self->_merchantRawName];
  [v3 appendFormat:@">"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentRewardsRedemptionTransactionDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKPaymentRewardsRedemptionTransactionDetails;
  unint64_t v5 = [(PKPaymentRewardsRedemptionTransactionDetails *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"description"];
    descriptionText = v5->_descriptionText;
    v5->_descriptionText = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"monetaryValue"];
    monetaryValue = v5->_monetaryValue;
    v5->_monetaryValue = (PKCurrencyAmount *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantCategoryCode"];
    merchantCategoryCode = v5->_merchantCategoryCode;
    v5->_merchantCategoryCode = (NSNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantRawName"];
    merchantRawName = v5->_merchantRawName;
    v5->_merchantRawName = (NSString *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_timestamp forKey:@"timestamp"];
  [v5 encodeObject:self->_descriptionText forKey:@"description"];
  [v5 encodeObject:self->_monetaryValue forKey:@"monetaryValue"];
  [v5 encodeObject:self->_merchantCategoryCode forKey:@"merchantCategoryCode"];
  [v5 encodeObject:self->_merchantRawName forKey:@"merchantRawName"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSDate *)self->_timestamp copyWithZone:a3];
  char v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSString *)self->_descriptionText copyWithZone:a3];
  v11 = (void *)v5[4];
  v5[4] = v10;

  id v12 = [(PKCurrencyAmount *)self->_monetaryValue copyWithZone:a3];
  v13 = (void *)v5[3];
  v5[3] = v12;

  uint64_t v14 = [(NSNumber *)self->_merchantCategoryCode copyWithZone:a3];
  v15 = (void *)v5[5];
  v5[5] = v14;

  uint64_t v16 = [(NSString *)self->_merchantRawName copyWithZone:a3];
  v17 = (void *)v5[6];
  v5[6] = v16;

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (PKCurrencyAmount)monetaryValue
{
  return self->_monetaryValue;
}

- (void)setMonetaryValue:(id)a3
{
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (void)setDescriptionText:(id)a3
{
}

- (NSNumber)merchantCategoryCode
{
  return self->_merchantCategoryCode;
}

- (void)setMerchantCategoryCode:(id)a3
{
}

- (NSString)merchantRawName
{
  return self->_merchantRawName;
}

- (void)setMerchantRawName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merchantRawName, 0);
  objc_storeStrong((id *)&self->_merchantCategoryCode, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong((id *)&self->_monetaryValue, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end