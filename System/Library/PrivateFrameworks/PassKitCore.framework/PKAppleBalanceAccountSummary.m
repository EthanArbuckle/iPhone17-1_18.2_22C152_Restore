@interface PKAppleBalanceAccountSummary
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDecimalNumber)currentBalance;
- (PKAppleBalanceAccountSummary)initWithCoder:(id)a3;
- (PKAppleBalanceAccountSummary)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrentBalance:(id)a3;
@end

@implementation PKAppleBalanceAccountSummary

- (PKAppleBalanceAccountSummary)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(PKAppleBalanceAccountSummary *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 PKDecimalNumberFromStringForKey:@"currentBalance"];
    currentBalance = v5->_currentBalance;
    v5->_currentBalance = (NSDecimalNumber *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAppleBalanceAccountSummary)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PKAppleBalanceAccountSummary *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentBalance"];
    currentBalance = v5->_currentBalance;
    v5->_currentBalance = (NSDecimalNumber *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    currentBalance = self->_currentBalance;
    uint64_t v6 = (NSDecimalNumber *)v4[1];
    if (currentBalance && v6) {
      char v7 = -[NSDecimalNumber isEqual:](currentBalance, "isEqual:");
    }
    else {
      char v7 = currentBalance == v6;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_currentBalance];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  unint64_t v4 = [(NSDecimalNumber *)self->_currentBalance stringValue];
  [v3 appendFormat:@"currentBalance: '%@'; ", v4];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[PKAppleBalanceAccountSummary allocWithZone:](PKAppleBalanceAccountSummary, "allocWithZone:") init];
  uint64_t v6 = [(NSDecimalNumber *)self->_currentBalance copyWithZone:a3];
  currentBalance = v5->_currentBalance;
  v5->_currentBalance = (NSDecimalNumber *)v6;

  return v5;
}

- (NSDecimalNumber)currentBalance
{
  return self->_currentBalance;
}

- (void)setCurrentBalance:(id)a3
{
}

- (void).cxx_destruct
{
}

@end