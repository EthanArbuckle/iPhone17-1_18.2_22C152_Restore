@interface PKSEConsistencyCheckRequestedAction
- (PKSEConsistencyCheckDeviceCredential)deviceCredential;
- (PKSEConsistencyCheckRequestedAction)init;
- (PKSEConsistencyCheckRequestedAction)initWithActions:(int64_t)a3 deviceCredential:(id)a4 address:(id)a5;
- (PKSECredentialAddress)address;
- (id)description;
- (int64_t)actions;
@end

@implementation PKSEConsistencyCheckRequestedAction

- (PKSEConsistencyCheckRequestedAction)init
{
  return 0;
}

- (PKSEConsistencyCheckRequestedAction)initWithActions:(int64_t)a3 deviceCredential:(id)a4 address:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PKSEConsistencyCheckRequestedAction;
  v11 = [(PKSEConsistencyCheckRequestedAction *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_actions = a3;
    objc_storeStrong((id *)&v11->_deviceCredential, a4);
    objc_storeStrong((id *)&v12->_address, a5);
  }

  return v12;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  v4 = PKConsistencyCheckCleanupActionsToString(self->_actions);
  [v3 appendFormat:@"actions: '%@'; ", v4];

  [v3 appendFormat:@"deviceCredential: '%@'; ", self->_deviceCredential];
  [v3 appendFormat:@"address: '%@'; ", self->_address];
  [v3 appendFormat:@">"];
  return v3;
}

- (int64_t)actions
{
  return self->_actions;
}

- (PKSEConsistencyCheckDeviceCredential)deviceCredential
{
  return self->_deviceCredential;
}

- (PKSECredentialAddress)address
{
  return self->_address;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_deviceCredential, 0);
}

@end