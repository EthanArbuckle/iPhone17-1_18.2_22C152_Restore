@interface PKSearchTransactionSourceResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (PKSearchTransactionSourceResult)initWithCoder:(id)a3;
- (unint64_t)hash;
- (unint64_t)tokenType;
- (unint64_t)transactionSource;
- (void)encodeWithCoder:(id)a3;
- (void)setTransactionSource:(unint64_t)a3;
@end

@implementation PKSearchTransactionSourceResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)tokenType
{
  return 6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (PKSearchTransactionSourceResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PKSearchTransactionSourceResult *)self init];
  if (v5) {
    v5->_transactionSource = [v4 decodeIntegerForKey:@"transactionSource"];
  }

  return v5;
}

- (NSString)description
{
  v6.receiver = self;
  v6.super_class = (Class)PKSearchTransactionSourceResult;
  v3 = [(PKSearchTransactionSourceResult *)&v6 description];
  id v4 = (void *)[v3 mutableCopy];

  objc_msgSend(v4, "appendFormat:", @"transactionSource: '%lu'; ", self->_transactionSource);
  [v4 appendFormat:@">"];
  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_transactionSource == v4[1];

  return v5;
}

- (unint64_t)hash
{
  return self->_transactionSource + 527;
}

- (unint64_t)transactionSource
{
  return self->_transactionSource;
}

- (void)setTransactionSource:(unint64_t)a3
{
  self->_transactionSource = a3;
}

@end