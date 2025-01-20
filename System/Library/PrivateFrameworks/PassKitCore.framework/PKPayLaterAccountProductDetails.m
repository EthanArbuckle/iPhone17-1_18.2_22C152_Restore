@interface PKPayLaterAccountProductDetails
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSTimeZone)productTimeZone;
- (PKCurrencyAmount)amountPaid;
- (PKCurrencyAmount)currentBalance;
- (PKCurrencyAmount)maximumSinglePurchaseAmount;
- (PKCurrencyAmount)minimumSinglePurchaseAmount;
- (PKCurrencyAmount)totalFinanced;
- (PKPayLaterAccountProductDetails)initWithCoder:(id)a3;
- (PKPayLaterAccountProductDetails)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAmountPaid:(id)a3;
- (void)setCurrentBalance:(id)a3;
- (void)setMaximumSinglePurchaseAmount:(id)a3;
- (void)setMinimumSinglePurchaseAmount:(id)a3;
- (void)setProductTimeZone:(id)a3;
- (void)setTotalFinanced:(id)a3;
@end

@implementation PKPayLaterAccountProductDetails

- (PKPayLaterAccountProductDetails)initWithDictionary:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKPayLaterAccountProductDetails;
  v5 = [(PKPayLaterAccountProductDetails *)&v20 init];
  if (v5)
  {
    v6 = [v4 PKStringForKey:@"productTimeZone"];
    if (v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:v6];
      productTimeZone = v5->_productTimeZone;
      v5->_productTimeZone = (NSTimeZone *)v7;
    }
    uint64_t v9 = [v4 PKCurrencyAmountForKey:@"minimumSinglePurchaseAmount"];
    minimumSinglePurchaseAmount = v5->_minimumSinglePurchaseAmount;
    v5->_minimumSinglePurchaseAmount = (PKCurrencyAmount *)v9;

    uint64_t v11 = [v4 PKCurrencyAmountForKey:@"maximumSinglePurchaseAmount"];
    maximumSinglePurchaseAmount = v5->_maximumSinglePurchaseAmount;
    v5->_maximumSinglePurchaseAmount = (PKCurrencyAmount *)v11;

    uint64_t v13 = [v4 PKCurrencyAmountForKey:@"currentBalance"];
    currentBalance = v5->_currentBalance;
    v5->_currentBalance = (PKCurrencyAmount *)v13;

    uint64_t v15 = [v4 PKCurrencyAmountForKey:@"totalFinanced"];
    totalFinanced = v5->_totalFinanced;
    v5->_totalFinanced = (PKCurrencyAmount *)v15;

    uint64_t v17 = [v4 PKCurrencyAmountForKey:@"amountPaid"];
    amountPaid = v5->_amountPaid;
    v5->_amountPaid = (PKCurrencyAmount *)v17;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterAccountProductDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKPayLaterAccountProductDetails;
  v5 = [(PKPayLaterAccountProductDetails *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productTimeZone"];
    productTimeZone = v5->_productTimeZone;
    v5->_productTimeZone = (NSTimeZone *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"minimumSinglePurchaseAmount"];
    minimumSinglePurchaseAmount = v5->_minimumSinglePurchaseAmount;
    v5->_minimumSinglePurchaseAmount = (PKCurrencyAmount *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maximumSinglePurchaseAmount"];
    maximumSinglePurchaseAmount = v5->_maximumSinglePurchaseAmount;
    v5->_maximumSinglePurchaseAmount = (PKCurrencyAmount *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentBalance"];
    currentBalance = v5->_currentBalance;
    v5->_currentBalance = (PKCurrencyAmount *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalFinanced"];
    totalFinanced = v5->_totalFinanced;
    v5->_totalFinanced = (PKCurrencyAmount *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"amountPaid"];
    amountPaid = v5->_amountPaid;
    v5->_amountPaid = (PKCurrencyAmount *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  productTimeZone = self->_productTimeZone;
  id v5 = a3;
  [v5 encodeObject:productTimeZone forKey:@"productTimeZone"];
  [v5 encodeObject:self->_minimumSinglePurchaseAmount forKey:@"minimumSinglePurchaseAmount"];
  [v5 encodeObject:self->_maximumSinglePurchaseAmount forKey:@"maximumSinglePurchaseAmount"];
  [v5 encodeObject:self->_currentBalance forKey:@"currentBalance"];
  [v5 encodeObject:self->_totalFinanced forKey:@"totalFinanced"];
  [v5 encodeObject:self->_amountPaid forKey:@"amountPaid"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_29;
  }
  productTimeZone = self->_productTimeZone;
  uint64_t v6 = (NSTimeZone *)v4[1];
  if (productTimeZone && v6)
  {
    if ((-[NSTimeZone isEqual:](productTimeZone, "isEqual:") & 1) == 0) {
      goto LABEL_29;
    }
  }
  else if (productTimeZone != v6)
  {
    goto LABEL_29;
  }
  minimumSinglePurchaseAmount = self->_minimumSinglePurchaseAmount;
  uint64_t v8 = (PKCurrencyAmount *)v4[2];
  if (minimumSinglePurchaseAmount && v8)
  {
    if (!-[PKCurrencyAmount isEqual:](minimumSinglePurchaseAmount, "isEqual:")) {
      goto LABEL_29;
    }
  }
  else if (minimumSinglePurchaseAmount != v8)
  {
    goto LABEL_29;
  }
  maximumSinglePurchaseAmount = self->_maximumSinglePurchaseAmount;
  uint64_t v10 = (PKCurrencyAmount *)v4[3];
  if (maximumSinglePurchaseAmount && v10)
  {
    if (!-[PKCurrencyAmount isEqual:](maximumSinglePurchaseAmount, "isEqual:")) {
      goto LABEL_29;
    }
  }
  else if (maximumSinglePurchaseAmount != v10)
  {
    goto LABEL_29;
  }
  currentBalance = self->_currentBalance;
  uint64_t v12 = (PKCurrencyAmount *)v4[4];
  if (currentBalance && v12)
  {
    if (!-[PKCurrencyAmount isEqual:](currentBalance, "isEqual:")) {
      goto LABEL_29;
    }
  }
  else if (currentBalance != v12)
  {
    goto LABEL_29;
  }
  totalFinanced = self->_totalFinanced;
  uint64_t v14 = (PKCurrencyAmount *)v4[5];
  if (!totalFinanced || !v14)
  {
    if (totalFinanced == v14) {
      goto LABEL_25;
    }
LABEL_29:
    BOOL v17 = 0;
    goto LABEL_30;
  }
  if (!-[PKCurrencyAmount isEqual:](totalFinanced, "isEqual:")) {
    goto LABEL_29;
  }
LABEL_25:
  amountPaid = self->_amountPaid;
  uint64_t v16 = (PKCurrencyAmount *)v4[6];
  if (amountPaid && v16) {
    BOOL v17 = -[PKCurrencyAmount isEqual:](amountPaid, "isEqual:");
  }
  else {
    BOOL v17 = amountPaid == v16;
  }
LABEL_30:

  return v17;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_productTimeZone];
  [v3 safelyAddObject:self->_minimumSinglePurchaseAmount];
  [v3 safelyAddObject:self->_maximumSinglePurchaseAmount];
  [v3 safelyAddObject:self->_currentBalance];
  [v3 safelyAddObject:self->_totalFinanced];
  [v3 safelyAddObject:self->_amountPaid];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"productTimeZone: '%@'; ", self->_productTimeZone];
  [v3 appendFormat:@"minimumSinglePurchaseAmount: '%@'; ", self->_minimumSinglePurchaseAmount];
  [v3 appendFormat:@"maximumSinglePurchaseAmount: '%@'; ", self->_maximumSinglePurchaseAmount];
  [v3 appendFormat:@"currentBalance: '%@'; ", self->_currentBalance];
  [v3 appendFormat:@"totalFinanced: '%@'; ", self->_totalFinanced];
  [v3 appendFormat:@"amountPaid: '%@'; ", self->_amountPaid];
  [v3 appendFormat:@">"];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKPayLaterAccountProductDetails allocWithZone:](PKPayLaterAccountProductDetails, "allocWithZone:") init];
  uint64_t v6 = [(NSTimeZone *)self->_productTimeZone copyWithZone:a3];
  productTimeZone = v5->_productTimeZone;
  v5->_productTimeZone = (NSTimeZone *)v6;

  uint64_t v8 = [(PKCurrencyAmount *)self->_minimumSinglePurchaseAmount copyWithZone:a3];
  minimumSinglePurchaseAmount = v5->_minimumSinglePurchaseAmount;
  v5->_minimumSinglePurchaseAmount = v8;

  uint64_t v10 = [(PKCurrencyAmount *)self->_maximumSinglePurchaseAmount copyWithZone:a3];
  maximumSinglePurchaseAmount = v5->_maximumSinglePurchaseAmount;
  v5->_maximumSinglePurchaseAmount = v10;

  uint64_t v12 = [(PKCurrencyAmount *)self->_currentBalance copyWithZone:a3];
  currentBalance = v5->_currentBalance;
  v5->_currentBalance = v12;

  uint64_t v14 = [(PKCurrencyAmount *)self->_totalFinanced copyWithZone:a3];
  totalFinanced = v5->_totalFinanced;
  v5->_totalFinanced = v14;

  uint64_t v16 = [(PKCurrencyAmount *)self->_amountPaid copyWithZone:a3];
  amountPaid = v5->_amountPaid;
  v5->_amountPaid = v16;

  return v5;
}

- (NSTimeZone)productTimeZone
{
  return self->_productTimeZone;
}

- (void)setProductTimeZone:(id)a3
{
}

- (PKCurrencyAmount)minimumSinglePurchaseAmount
{
  return self->_minimumSinglePurchaseAmount;
}

- (void)setMinimumSinglePurchaseAmount:(id)a3
{
}

- (PKCurrencyAmount)maximumSinglePurchaseAmount
{
  return self->_maximumSinglePurchaseAmount;
}

- (void)setMaximumSinglePurchaseAmount:(id)a3
{
}

- (PKCurrencyAmount)currentBalance
{
  return self->_currentBalance;
}

- (void)setCurrentBalance:(id)a3
{
}

- (PKCurrencyAmount)totalFinanced
{
  return self->_totalFinanced;
}

- (void)setTotalFinanced:(id)a3
{
}

- (PKCurrencyAmount)amountPaid
{
  return self->_amountPaid;
}

- (void)setAmountPaid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amountPaid, 0);
  objc_storeStrong((id *)&self->_totalFinanced, 0);
  objc_storeStrong((id *)&self->_currentBalance, 0);
  objc_storeStrong((id *)&self->_maximumSinglePurchaseAmount, 0);
  objc_storeStrong((id *)&self->_minimumSinglePurchaseAmount, 0);
  objc_storeStrong((id *)&self->_productTimeZone, 0);
}

@end