@interface EPSagaOperandUUID
+ (BOOL)supportsSecureCoding;
- (EPRoutingSlip)routingSlip;
- (EPSagaOperandUUID)initWithCoder:(id)a3;
- (EPSagaOperandUUID)initWithUUID:(id)a3;
- (NSObject)value;
- (NSString)description;
- (NSUUID)uuid;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EPSagaOperandUUID

- (EPSagaOperandUUID)initWithUUID:(id)a3
{
  id v5 = a3;
  v6 = [(EPSagaOperandUUID *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_uuid, a3);
  }

  return v7;
}

- (NSObject)value
{
  return self->_uuid;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EPSagaOperandUUID)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(EPSagaOperandUUID *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;
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
  id v5 = [(EPSagaOperandUUID *)self uuid];
  uint64_t v6 = [v5 UUIDString];
  v7 = +[NSString stringWithFormat:@"%@: %@", v4, v6];

  return (NSString *)v7;
}

- (EPRoutingSlip)routingSlip
{
  return 0;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
}

@end