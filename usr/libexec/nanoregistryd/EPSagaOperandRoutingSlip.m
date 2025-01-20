@interface EPSagaOperandRoutingSlip
+ (BOOL)supportsSecureCoding;
- (EPRoutingSlip)childRoutingSlip;
- (EPRoutingSlip)routingSlip;
- (EPSagaOperandRoutingSlip)initWithChildRoutingSlip:(id)a3;
- (EPSagaOperandRoutingSlip)initWithCoder:(id)a3;
- (NSObject)value;
- (NSString)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EPSagaOperandRoutingSlip

- (EPSagaOperandRoutingSlip)initWithChildRoutingSlip:(id)a3
{
  id v5 = a3;
  v6 = [(EPSagaOperandRoutingSlip *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_childRoutingSlip, a3);
  }

  return v7;
}

- (NSObject)value
{
  return self->_childRoutingSlip;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EPSagaOperandRoutingSlip)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(EPSagaOperandRoutingSlip *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"childRoutingSlip"];
    childRoutingSlip = v5->_childRoutingSlip;
    v5->_childRoutingSlip = (EPRoutingSlip *)v6;
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
  id v5 = [(EPSagaOperandRoutingSlip *)self childRoutingSlip];
  uint64_t v6 = +[NSString stringWithFormat:@"%@: %@", v4, v5];

  return (NSString *)v6;
}

- (EPRoutingSlip)routingSlip
{
  return 0;
}

- (EPRoutingSlip)childRoutingSlip
{
  return self->_childRoutingSlip;
}

- (void).cxx_destruct
{
}

@end