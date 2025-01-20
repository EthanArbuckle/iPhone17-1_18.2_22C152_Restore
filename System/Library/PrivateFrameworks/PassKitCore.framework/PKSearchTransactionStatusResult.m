@interface PKSearchTransactionStatusResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (PKSearchTransactionStatusResult)initWithCoder:(id)a3;
- (int64_t)transactionStatus;
- (unint64_t)hash;
- (unint64_t)tokenType;
- (void)encodeWithCoder:(id)a3;
- (void)setTransactionStatus:(int64_t)a3;
@end

@implementation PKSearchTransactionStatusResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)tokenType
{
  return 5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (PKSearchTransactionStatusResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PKSearchTransactionStatusResult *)self init];
  if (v5) {
    v5->_transactionStatus = [v4 decodeIntegerForKey:@"transactionStatus"];
  }

  return v5;
}

- (NSString)description
{
  v6.receiver = self;
  v6.super_class = (Class)PKSearchTransactionStatusResult;
  v3 = [(PKSearchTransactionStatusResult *)&v6 description];
  id v4 = (void *)[v3 mutableCopy];

  objc_msgSend(v4, "appendFormat:", @"transactionStatus: '%lu'; ", self->_transactionStatus);
  [v4 appendFormat:@">"];
  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_transactionStatus == v4[1];

  return v5;
}

- (unint64_t)hash
{
  return self->_transactionStatus + 527;
}

- (int64_t)transactionStatus
{
  return self->_transactionStatus;
}

- (void)setTransactionStatus:(int64_t)a3
{
  self->_transactionStatus = a3;
}

@end