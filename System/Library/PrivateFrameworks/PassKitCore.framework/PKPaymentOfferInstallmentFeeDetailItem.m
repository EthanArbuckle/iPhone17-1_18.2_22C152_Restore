@interface PKPaymentOfferInstallmentFeeDetailItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)feeDate;
- (PKCurrencyAmount)feeAmount;
- (PKCurrencyAmount)totalFees;
- (PKPaymentOfferInstallmentFeeDetailItem)initWithCoder:(id)a3;
- (PKPaymentOfferInstallmentFeeDetailItem)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)feesInterval;
- (unint64_t)feesPeriod;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPaymentOfferInstallmentFeeDetailItem

- (PKPaymentOfferInstallmentFeeDetailItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKPaymentOfferInstallmentFeeDetailItem;
  v5 = [(PKPaymentOfferInstallmentFeeDetailItem *)&v21 init];
  if (v5)
  {
    v6 = [v4 PKStringForKey:@"type"];
    v7 = v6;
    if (v6 != @"recurring")
    {
      if (v6)
      {
        char v8 = [(__CFString *)v6 isEqualToString:@"recurring"];

        if (v8) {
          goto LABEL_5;
        }
        v10 = v7;
        if (v10 == @"oneTime"
          || (v11 = v10,
              int v12 = [(__CFString *)v10 isEqualToString:@"oneTime"],
              v11,
              v12))
        {
          uint64_t v9 = 2;
          goto LABEL_10;
        }
      }
      uint64_t v9 = 0;
      goto LABEL_10;
    }
LABEL_5:
    uint64_t v9 = 1;
LABEL_10:

    v5->_type = v9;
    uint64_t v13 = [v4 PKCurrencyAmountForKey:@"feeAmount"];
    feeAmount = v5->_feeAmount;
    v5->_feeAmount = (PKCurrencyAmount *)v13;

    uint64_t v15 = [v4 PKCurrencyAmountForKey:@"totalFees"];
    totalFees = v5->_totalFees;
    v5->_totalFees = (PKCurrencyAmount *)v15;

    v17 = [v4 PKStringForKey:@"feesPeriod"];
    v5->_feesPeriod = PKPaymentOfferPeriodFromString(v17);

    v5->_feesInterval = [v4 PKIntegerForKey:@"feesInterval"];
    uint64_t v18 = [v4 PKDateForKey:@"feeDate"];
    feeDate = v5->_feeDate;
    v5->_feeDate = (NSDate *)v18;
  }
  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = v3;
  unint64_t type = self->_type;
  v6 = @"unknown";
  if (type == 1) {
    v6 = @"recurring";
  }
  if (type == 2) {
    v7 = @"oneTime";
  }
  else {
    v7 = v6;
  }
  [v3 setObject:v7 forKeyedSubscript:@"type"];
  char v8 = [(PKCurrencyAmount *)self->_feeAmount dictionaryRepresentation];
  [v4 setObject:v8 forKeyedSubscript:@"feeAmount"];

  uint64_t v9 = [(PKCurrencyAmount *)self->_totalFees dictionaryRepresentation];
  [v4 setObject:v9 forKeyedSubscript:@"totalFees"];

  v10 = PKPaymentOfferPeriodToString(self->_feesPeriod);
  [v4 setObject:v10 forKeyedSubscript:@"feesPeriod"];

  v11 = [NSNumber numberWithInteger:self->_feesInterval];
  [v4 setObject:v11 forKeyedSubscript:@"feesInterval"];

  int v12 = PKISO8601DateStringFromDate(self->_feeDate);
  [v4 setObject:v12 forKeyedSubscript:self->_feeDate];

  uint64_t v13 = (void *)[v4 copy];
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPaymentOfferInstallmentFeeDetailItem *)a3;
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
        feeAmount = self->_feeAmount;
        char v8 = v6->_feeAmount;
        if (feeAmount && v8)
        {
          if (!-[PKCurrencyAmount isEqual:](feeAmount, "isEqual:")) {
            goto LABEL_24;
          }
        }
        else if (feeAmount != v8)
        {
          goto LABEL_24;
        }
        totalFees = self->_totalFees;
        v11 = v6->_totalFees;
        if (totalFees && v11)
        {
          if (!-[PKCurrencyAmount isEqual:](totalFees, "isEqual:")) {
            goto LABEL_24;
          }
        }
        else if (totalFees != v11)
        {
          goto LABEL_24;
        }
        feeDate = self->_feeDate;
        uint64_t v13 = v6->_feeDate;
        if (feeDate && v13)
        {
          if ((-[NSDate isEqual:](feeDate, "isEqual:") & 1) == 0) {
            goto LABEL_24;
          }
        }
        else if (feeDate != v13)
        {
          goto LABEL_24;
        }
        if (self->_type == v6->_type && self->_feesPeriod == v6->_feesPeriod)
        {
          BOOL v9 = self->_feesInterval == v6->_feesInterval;
LABEL_25:

          goto LABEL_26;
        }
LABEL_24:
        BOOL v9 = 0;
        goto LABEL_25;
      }
    }
    BOOL v9 = 0;
  }
LABEL_26:

  return v9;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_feeAmount];
  [v3 safelyAddObject:self->_totalFees];
  [v3 safelyAddObject:self->_feeDate];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_type - v4 + 32 * v4;
  int64_t v6 = self->_feesInterval - v5 + 32 * v5;
  unint64_t v7 = self->_feesPeriod - v6 + 32 * v6;

  return v7;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  unint64_t type = self->_type;
  unint64_t v5 = @"unknown";
  if (type == 1) {
    unint64_t v5 = @"recurring";
  }
  if (type == 2) {
    int64_t v6 = @"oneTime";
  }
  else {
    int64_t v6 = v5;
  }
  [v3 appendFormat:@"type: '%@'; ", v6];
  [v3 appendFormat:@"feeAmount: '%@'; ", self->_feeAmount];
  [v3 appendFormat:@"totalFees: '%@'; ", self->_totalFees];
  unint64_t v7 = PKPaymentOfferPeriodToString(self->_feesPeriod);
  [v3 appendFormat:@"feesPeriod: '%@'; ", v7];

  objc_msgSend(v3, "appendFormat:", @"feesInterval: %ld; ", self->_feesInterval);
  [v3 appendFormat:@"feeDate: '%@'; ", self->_feeDate];
  [v3 appendFormat:@">"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentOfferInstallmentFeeDetailItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentOfferInstallmentFeeDetailItem;
  unint64_t v5 = [(PKPaymentOfferInstallmentFeeDetailItem *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"feeAmount"];
    feeAmount = v5->_feeAmount;
    v5->_feeAmount = (PKCurrencyAmount *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalFees"];
    totalFees = v5->_totalFees;
    v5->_totalFees = (PKCurrencyAmount *)v8;

    v5->_feesPeriod = [v4 decodeIntegerForKey:@"feesPeriod"];
    v5->_feesInterval = [v4 decodeIntegerForKey:@"feesInterval"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"feeDate"];
    feeDate = v5->_feeDate;
    v5->_feeDate = (NSDate *)v10;

    v5->_unint64_t type = [v4 decodeIntegerForKey:@"type"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  feeAmount = self->_feeAmount;
  id v5 = a3;
  [v5 encodeObject:feeAmount forKey:@"feeAmount"];
  [v5 encodeObject:self->_totalFees forKey:@"totalFees"];
  [v5 encodeObject:self->_feeDate forKey:@"feeDate"];
  [v5 encodeInteger:self->_feesPeriod forKey:@"feesPeriod"];
  [v5 encodeInteger:self->_feesInterval forKey:@"feesInterval"];
  [v5 encodeInteger:self->_type forKey:@"type"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKPaymentOfferInstallmentFeeDetailItem allocWithZone:](PKPaymentOfferInstallmentFeeDetailItem, "allocWithZone:") init];
  uint64_t v6 = [(PKCurrencyAmount *)self->_feeAmount copyWithZone:a3];
  feeAmount = v5->_feeAmount;
  v5->_feeAmount = v6;

  uint64_t v8 = [(PKCurrencyAmount *)self->_totalFees copyWithZone:a3];
  totalFees = v5->_totalFees;
  v5->_totalFees = v8;

  uint64_t v10 = [(NSDate *)self->_feeDate copyWithZone:a3];
  feeDate = v5->_feeDate;
  v5->_feeDate = (NSDate *)v10;

  v5->_feesPeriod = self->_feesPeriod;
  v5->_feesInterval = self->_feesInterval;
  v5->_unint64_t type = self->_type;
  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (PKCurrencyAmount)feeAmount
{
  return self->_feeAmount;
}

- (PKCurrencyAmount)totalFees
{
  return self->_totalFees;
}

- (unint64_t)feesPeriod
{
  return self->_feesPeriod;
}

- (int64_t)feesInterval
{
  return self->_feesInterval;
}

- (NSDate)feeDate
{
  return self->_feeDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feeDate, 0);
  objc_storeStrong((id *)&self->_totalFees, 0);
  objc_storeStrong((id *)&self->_feeAmount, 0);
}

@end