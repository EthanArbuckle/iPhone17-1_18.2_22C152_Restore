@interface PKPayLaterFinancingAmount
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (PKCurrencyAmount)currencyAmount;
- (PKCurrencyAmount)merchantCurrencyAmount;
- (PKPayLaterFinancingAmount)initWithCoder:(id)a3;
- (PKPayLaterFinancingAmount)initWithCurrencyAmount:(id)a3;
- (PKPayLaterFinancingAmount)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrencyAmount:(id)a3;
- (void)setMerchantCurrencyAmount:(id)a3;
@end

@implementation PKPayLaterFinancingAmount

- (PKPayLaterFinancingAmount)initWithCurrencyAmount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterFinancingAmount;
  v6 = [(PKPayLaterFinancingAmount *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_currencyAmount, a3);
  }

  return v7;
}

- (PKPayLaterFinancingAmount)initWithDictionary:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 count] >= 2)
  {
    v18.receiver = self;
    v18.super_class = (Class)PKPayLaterFinancingAmount;
    v6 = [(PKPayLaterFinancingAmount *)&v18 init];
    if (v6)
    {
      v7 = [v4 PKDecimalNumberFromStringForKey:@"amount"];
      v8 = [v4 PKStringForKey:@"amountCurrency"];
      objc_super v9 = v8;
      if (v7 && v8)
      {
        uint64_t v10 = PKCurrencyAmountCreate(v7, v8, 0);
        currencyAmount = v6->_currencyAmount;
        v6->_currencyAmount = (PKCurrencyAmount *)v10;
      }
      v12 = [v4 PKDecimalNumberFromStringForKey:@"merchantAmount"];
      v13 = [v4 PKStringForKey:@"merchantAmountCurrency"];
      v14 = v13;
      if (v12 && v13)
      {
        uint64_t v15 = PKCurrencyAmountCreate(v12, v13, 0);
        merchantCurrencyAmount = v6->_merchantCurrencyAmount;
        v6->_merchantCurrencyAmount = (PKCurrencyAmount *)v15;
      }
    }
    self = v6;
    id v5 = self;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v6 = [(PKCurrencyAmount *)self->_currencyAmount copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(PKCurrencyAmount *)self->_merchantCurrencyAmount copyWithZone:a3];
  objc_super v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPayLaterFinancingAmount *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = v5;
        currencyAmount = self->_currencyAmount;
        id v8 = v6->_currencyAmount;
        if (currencyAmount && v8)
        {
          if (-[PKCurrencyAmount isEqual:](currencyAmount, "isEqual:"))
          {
LABEL_7:
            merchantCurrencyAmount = self->_merchantCurrencyAmount;
            uint64_t v10 = v6->_merchantCurrencyAmount;
            if (merchantCurrencyAmount && v10) {
              char v11 = -[PKCurrencyAmount isEqual:](merchantCurrencyAmount, "isEqual:");
            }
            else {
              char v11 = merchantCurrencyAmount == v10;
            }
            goto LABEL_15;
          }
        }
        else if (currencyAmount == v8)
        {
          goto LABEL_7;
        }
        char v11 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    char v11 = 0;
  }
LABEL_16:

  return v11;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_currencyAmount];
  [v3 safelyAddObject:self->_merchantCurrencyAmount];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  currencyAmount = self->_currencyAmount;
  id v5 = a3;
  [v5 encodeObject:currencyAmount forKey:@"currencyAmount"];
  [v5 encodeObject:self->_merchantCurrencyAmount forKey:@"merchantCurrencyAmount"];
}

- (PKPayLaterFinancingAmount)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPayLaterFinancingAmount;
  id v5 = [(PKPayLaterFinancingAmount *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyAmount"];
    currencyAmount = v5->_currencyAmount;
    v5->_currencyAmount = (PKCurrencyAmount *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantCurrencyAmount"];
    merchantCurrencyAmount = v5->_merchantCurrencyAmount;
    v5->_merchantCurrencyAmount = (PKCurrencyAmount *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"currencyAmount: %@; ", self->_currencyAmount];
  [v3 appendFormat:@"merchantCurrencyAmount: %@; ", self->_merchantCurrencyAmount];
  [v3 appendFormat:@">"];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (PKCurrencyAmount)currencyAmount
{
  return self->_currencyAmount;
}

- (void)setCurrencyAmount:(id)a3
{
}

- (PKCurrencyAmount)merchantCurrencyAmount
{
  return self->_merchantCurrencyAmount;
}

- (void)setMerchantCurrencyAmount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merchantCurrencyAmount, 0);
  objc_storeStrong((id *)&self->_currencyAmount, 0);
}

@end