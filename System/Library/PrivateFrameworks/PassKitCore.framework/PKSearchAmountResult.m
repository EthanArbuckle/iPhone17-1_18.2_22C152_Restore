@interface PKSearchAmountResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (PKCurrencyAmount)amount;
- (PKSearchAmountResult)initWithCoder:(id)a3;
- (int64_t)comparison;
- (unint64_t)hash;
- (unint64_t)tokenType;
- (void)encodeWithCoder:(id)a3;
- (void)setAmount:(id)a3;
- (void)setComparison:(int64_t)a3;
@end

@implementation PKSearchAmountResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)tokenType
{
  return 2;
}

- (void)encodeWithCoder:(id)a3
{
  amount = self->_amount;
  id v5 = a3;
  [v5 encodeObject:amount forKey:@"amount"];
  [v5 encodeInteger:self->_comparison forKey:@"comparison"];
}

- (PKSearchAmountResult)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PKSearchAmountResult *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"amount"];
    amount = v5->_amount;
    v5->_amount = (PKCurrencyAmount *)v6;

    v5->_comparison = [v4 decodeIntegerForKey:@"comparison"];
  }

  return v5;
}

- (NSString)description
{
  v6.receiver = self;
  v6.super_class = (Class)PKSearchAmountResult;
  v3 = [(PKSearchAmountResult *)&v6 description];
  id v4 = (void *)[v3 mutableCopy];

  [v4 appendFormat:@"amount: '%@'; ", self->_amount];
  objc_msgSend(v4, "appendFormat:", @"comparison: '%lu'; ", self->_comparison);
  [v4 appendFormat:@">"];
  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_7;
  }
  amount = self->_amount;
  objc_super v6 = (PKCurrencyAmount *)v4[1];
  if (!amount || !v6)
  {
    if (amount == v6) {
      goto LABEL_5;
    }
LABEL_7:
    BOOL v7 = 0;
    goto LABEL_8;
  }
  if (!-[PKCurrencyAmount isEqual:](amount, "isEqual:")) {
    goto LABEL_7;
  }
LABEL_5:
  BOOL v7 = self->_comparison == v4[2];
LABEL_8:

  return v7;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_amount];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_comparison - v4 + 32 * v4;

  return v5;
}

- (PKCurrencyAmount)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
}

- (int64_t)comparison
{
  return self->_comparison;
}

- (void)setComparison:(int64_t)a3
{
  self->_comparison = a3;
}

- (void).cxx_destruct
{
}

@end