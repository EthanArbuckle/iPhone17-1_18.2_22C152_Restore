@interface PKSearchTransactionPeerPaymentSubTypeResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (PKSearchTransactionPeerPaymentSubTypeResult)initWithCoder:(id)a3;
- (int64_t)subType;
- (unint64_t)hash;
- (unint64_t)tokenType;
- (void)encodeWithCoder:(id)a3;
- (void)setSubType:(int64_t)a3;
@end

@implementation PKSearchTransactionPeerPaymentSubTypeResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)tokenType
{
  return 7;
}

- (void)encodeWithCoder:(id)a3
{
}

- (PKSearchTransactionPeerPaymentSubTypeResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PKSearchTransactionPeerPaymentSubTypeResult *)self init];
  if (v5) {
    v5->_subType = [v4 decodeIntegerForKey:@"subType"];
  }

  return v5;
}

- (NSString)description
{
  v6.receiver = self;
  v6.super_class = (Class)PKSearchTransactionPeerPaymentSubTypeResult;
  v3 = [(PKSearchTransactionPeerPaymentSubTypeResult *)&v6 description];
  id v4 = (void *)[v3 mutableCopy];

  objc_msgSend(v4, "appendFormat:", @"subType: '%lu'; ", self->_subType);
  [v4 appendFormat:@">"];
  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_subType == v4[1];

  return v5;
}

- (unint64_t)hash
{
  return self->_subType + 527;
}

- (int64_t)subType
{
  return self->_subType;
}

- (void)setSubType:(int64_t)a3
{
  self->_subType = a3;
}

@end