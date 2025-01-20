@interface PKSearchTransactionRewardsResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDecimalNumber)rewardsValue;
- (NSString)description;
- (PKSearchTransactionRewardsResult)initWithCoder:(id)a3;
- (unint64_t)hash;
- (unint64_t)rewardsValueUnit;
- (unint64_t)tokenType;
- (void)encodeWithCoder:(id)a3;
- (void)setRewardsValue:(id)a3;
- (void)setRewardsValueUnit:(unint64_t)a3;
@end

@implementation PKSearchTransactionRewardsResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)tokenType
{
  return 8;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t rewardsValueUnit = self->_rewardsValueUnit;
  id v5 = a3;
  [v5 encodeInteger:rewardsValueUnit forKey:@"rewardsValueUnit"];
  [v5 encodeObject:self->_rewardsValue forKey:@"rewardsValue"];
}

- (PKSearchTransactionRewardsResult)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PKSearchTransactionRewardsResult *)self init];
  if (v5)
  {
    v5->_unint64_t rewardsValueUnit = [v4 decodeIntegerForKey:@"rewardsValueUnit"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rewardsValue"];
    rewardsValue = v5->_rewardsValue;
    v5->_rewardsValue = (NSDecimalNumber *)v6;
  }
  return v5;
}

- (NSString)description
{
  v6.receiver = self;
  v6.super_class = (Class)PKSearchTransactionRewardsResult;
  v3 = [(PKSearchTransactionRewardsResult *)&v6 description];
  id v4 = (void *)[v3 mutableCopy];

  objc_msgSend(v4, "appendFormat:", @"rewardsValueUnit: '%lu'; ", self->_rewardsValueUnit);
  [v4 appendFormat:@"rewardsValue: '%@'; ", self->_rewardsValue];
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
  rewardsValue = self->_rewardsValue;
  objc_super v6 = (NSDecimalNumber *)v4[1];
  if (!rewardsValue || !v6)
  {
    if (rewardsValue == v6) {
      goto LABEL_5;
    }
LABEL_7:
    BOOL v7 = 0;
    goto LABEL_8;
  }
  if ((-[NSDecimalNumber isEqual:](rewardsValue, "isEqual:") & 1) == 0) {
    goto LABEL_7;
  }
LABEL_5:
  BOOL v7 = self->_rewardsValueUnit == v4[2];
LABEL_8:

  return v7;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_rewardsValue];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_rewardsValueUnit - v4 + 32 * v4;

  return v5;
}

- (NSDecimalNumber)rewardsValue
{
  return self->_rewardsValue;
}

- (void)setRewardsValue:(id)a3
{
}

- (unint64_t)rewardsValueUnit
{
  return self->_rewardsValueUnit;
}

- (void)setRewardsValueUnit:(unint64_t)a3
{
  self->_unint64_t rewardsValueUnit = a3;
}

- (void).cxx_destruct
{
}

@end