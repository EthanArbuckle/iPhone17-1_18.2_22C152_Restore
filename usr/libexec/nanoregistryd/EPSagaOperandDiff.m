@interface EPSagaOperandDiff
+ (BOOL)supportsSecureCoding;
- (EPRoutingSlip)routingSlip;
- (EPSagaOperandDiff)initWithCoder:(id)a3;
- (EPSagaOperandDiff)initWithDiff:(id)a3;
- (NRDiffProtocol)diff;
- (NSObject)value;
- (NSString)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EPSagaOperandDiff

- (EPSagaOperandDiff)initWithDiff:(id)a3
{
  id v5 = a3;
  v6 = [(EPSagaOperandDiff *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_diff, a3);
  }

  return v7;
}

- (NSObject)value
{
  return self->_diff;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EPSagaOperandDiff)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(EPSagaOperandDiff *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"diff"];
    diff = v5->_diff;
    v5->_diff = (NRDiffProtocol *)v6;
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
  id v5 = [(EPSagaOperandDiff *)self diff];
  uint64_t v6 = +[NSString stringWithFormat:@"%@: %@", v4, v5];

  return (NSString *)v6;
}

- (EPRoutingSlip)routingSlip
{
  return 0;
}

- (NRDiffProtocol)diff
{
  return self->_diff;
}

- (void).cxx_destruct
{
}

@end