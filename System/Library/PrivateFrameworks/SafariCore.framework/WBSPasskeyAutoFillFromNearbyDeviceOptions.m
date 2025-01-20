@interface WBSPasskeyAutoFillFromNearbyDeviceOptions
+ (BOOL)supportsSecureCoding;
- (NSUUID)operationUUID;
- (NSXPCListenerEndpoint)agentEndpoint;
- (WBSPasskeyAutoFillFromNearbyDeviceOptions)initWithCoder:(id)a3;
- (WBSPasskeyAutoFillFromNearbyDeviceOptions)initWithOperationUUID:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WBSPasskeyAutoFillFromNearbyDeviceOptions

- (WBSPasskeyAutoFillFromNearbyDeviceOptions)initWithOperationUUID:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSPasskeyAutoFillFromNearbyDeviceOptions;
  v6 = [(WBSPasskeyAutoFillFromNearbyDeviceOptions *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_operationUUID, a3);
    v8 = v7;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSPasskeyAutoFillFromNearbyDeviceOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"operationUUID"];

  v6 = [(WBSPasskeyAutoFillFromNearbyDeviceOptions *)self initWithOperationUUID:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSUUID)operationUUID
{
  return self->_operationUUID;
}

- (NSXPCListenerEndpoint)agentEndpoint
{
  return self->_agentEndpoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_agentEndpoint, 0);
  objc_storeStrong((id *)&self->_operationUUID, 0);
}

@end