@interface PKSearchTransactionTypeResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (PKSearchTransactionTypeResult)initWithCoder:(id)a3;
- (int64_t)transactionType;
- (unint64_t)hash;
- (unint64_t)tokenType;
- (void)encodeWithCoder:(id)a3;
- (void)setTransactionType:(int64_t)a3;
@end

@implementation PKSearchTransactionTypeResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)tokenType
{
  return 4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (PKSearchTransactionTypeResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PKSearchTransactionTypeResult *)self init];
  if (v5) {
    v5->_transactionType = [v4 decodeIntegerForKey:@"transactionType"];
  }

  return v5;
}

- (NSString)description
{
  v6.receiver = self;
  v6.super_class = (Class)PKSearchTransactionTypeResult;
  v3 = [(PKSearchTransactionTypeResult *)&v6 description];
  id v4 = (void *)[v3 mutableCopy];

  objc_msgSend(v4, "appendFormat:", @"transactionType: '%lu'; ", self->_transactionType);
  [v4 appendFormat:@">"];
  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_transactionType == v4[1];

  return v5;
}

- (unint64_t)hash
{
  return self->_transactionType + 527;
}

- (int64_t)transactionType
{
  return self->_transactionType;
}

- (void)setTransactionType:(int64_t)a3
{
  self->_transactionType = a3;
}

@end