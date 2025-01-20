@interface PKSearchTransactionGroupResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (PKPaymentTransactionGroup)group;
- (PKSearchTransactionGroupResult)initWithCoder:(id)a3;
- (unint64_t)hash;
- (unint64_t)tokenType;
- (void)encodeWithCoder:(id)a3;
- (void)setGroup:(id)a3;
@end

@implementation PKSearchTransactionGroupResult

- (unint64_t)tokenType
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (PKSearchTransactionGroupResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PKSearchTransactionGroupResult *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"group"];
    group = v5->_group;
    v5->_group = (PKPaymentTransactionGroup *)v6;
  }
  return v5;
}

- (NSString)description
{
  v6.receiver = self;
  v6.super_class = (Class)PKSearchTransactionGroupResult;
  v3 = [(PKSearchTransactionGroupResult *)&v6 description];
  id v4 = (void *)[v3 mutableCopy];

  [v4 appendFormat:@"group: '%@'; ", self->_group];
  [v4 appendFormat:@">"];
  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    group = self->_group;
    objc_super v6 = (PKPaymentTransactionGroup *)v4[1];
    if (group && v6) {
      BOOL v7 = -[PKPaymentTransactionGroup isEqual:](group, "isEqual:");
    }
    else {
      BOOL v7 = group == v6;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_group];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (PKPaymentTransactionGroup)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
}

- (void).cxx_destruct
{
}

@end