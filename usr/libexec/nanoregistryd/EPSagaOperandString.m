@interface EPSagaOperandString
+ (BOOL)supportsSecureCoding;
- (EPRoutingSlip)routingSlip;
- (EPSagaOperandString)initWithCoder:(id)a3;
- (EPSagaOperandString)initWithString:(id)a3;
- (NSObject)value;
- (NSString)description;
- (NSString)string;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EPSagaOperandString

- (EPSagaOperandString)initWithString:(id)a3
{
  id v5 = a3;
  v6 = [(EPSagaOperandString *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_string, a3);
  }

  return v7;
}

- (NSObject)value
{
  return self->_string;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EPSagaOperandString)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(EPSagaOperandString *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"string"];
    string = v5->_string;
    v5->_string = (NSString *)v6;
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
  id v5 = [(EPSagaOperandString *)self string];
  uint64_t v6 = +[NSString stringWithFormat:@"%@: %@", v4, v5];

  return (NSString *)v6;
}

- (EPRoutingSlip)routingSlip
{
  return 0;
}

- (NSString)string
{
  return self->_string;
}

- (void).cxx_destruct
{
}

@end