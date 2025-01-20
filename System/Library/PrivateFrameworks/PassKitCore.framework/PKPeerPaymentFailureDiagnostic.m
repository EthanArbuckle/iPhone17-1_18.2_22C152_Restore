@interface PKPeerPaymentFailureDiagnostic
+ (BOOL)supportsSecureCoding;
- (NSError)error;
- (NSString)transactionIdentifier;
- (PKPeerPaymentFailureDiagnostic)initWithCoder:(id)a3;
- (int64_t)reasonCode;
- (unint64_t)flowType;
- (unint64_t)role;
- (void)encodeWithCoder:(id)a3;
- (void)setError:(id)a3;
- (void)setFlowType:(unint64_t)a3;
- (void)setReasonCode:(int64_t)a3;
- (void)setRole:(unint64_t)a3;
- (void)setTransactionIdentifier:(id)a3;
@end

@implementation PKPeerPaymentFailureDiagnostic

- (PKPeerPaymentFailureDiagnostic)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPeerPaymentFailureDiagnostic;
  v5 = [(PKPeerPaymentFailureDiagnostic *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    error = v5->_error;
    v5->_error = (NSError *)v6;

    v5->_flowType = [v4 decodeIntegerForKey:@"flowType"];
    v5->_reasonCode = [v4 decodeIntegerForKey:@"reasonCode"];
    v5->_role = [v4 decodeIntegerForKey:@"role"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionIdentifier"];
    transactionIdentifier = v5->_transactionIdentifier;
    v5->_transactionIdentifier = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  error = self->_error;
  id v5 = a3;
  [v5 encodeObject:error forKey:@"error"];
  [v5 encodeInteger:self->_flowType forKey:@"flowType"];
  [v5 encodeInteger:self->_reasonCode forKey:@"reasonCode"];
  [v5 encodeInteger:self->_role forKey:@"role"];
  [v5 encodeObject:self->_transactionIdentifier forKey:@"transactionIdentifier"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (unint64_t)flowType
{
  return self->_flowType;
}

- (void)setFlowType:(unint64_t)a3
{
  self->_flowType = a3;
}

- (int64_t)reasonCode
{
  return self->_reasonCode;
}

- (void)setReasonCode:(int64_t)a3
{
  self->_reasonCode = a3;
}

- (unint64_t)role
{
  return self->_role;
}

- (void)setRole:(unint64_t)a3
{
  self->_role = a3;
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (void)setTransactionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end