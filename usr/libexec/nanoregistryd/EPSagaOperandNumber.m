@interface EPSagaOperandNumber
+ (BOOL)supportsSecureCoding;
- (EPRoutingSlip)routingSlip;
- (EPSagaOperandNumber)initWithCoder:(id)a3;
- (EPSagaOperandNumber)initWithNumber:(id)a3;
- (NSNumber)number;
- (NSObject)value;
- (NSString)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EPSagaOperandNumber

- (EPSagaOperandNumber)initWithNumber:(id)a3
{
  id v5 = a3;
  v6 = [(EPSagaOperandNumber *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_number, a3);
  }

  return v7;
}

- (NSObject)value
{
  return self->_number;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EPSagaOperandNumber)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(EPSagaOperandNumber *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"number"];
    number = v5->_number;
    v5->_number = (NSNumber *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(EPSagaOperandNumber *)self number];
  uint64_t v6 = +[NSString stringWithFormat:@"%@: %@", v4, v5];

  return (NSString *)v6;
}

- (EPRoutingSlip)routingSlip
{
  return 0;
}

- (NSNumber)number
{
  return self->_number;
}

- (void).cxx_destruct
{
}

@end