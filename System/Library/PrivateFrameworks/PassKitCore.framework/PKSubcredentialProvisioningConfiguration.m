@interface PKSubcredentialProvisioningConfiguration
- (PKSubcredentialProvisioningConfiguration)initWithConfigurationType:(int64_t)a3;
- (id)acceptInvitationConfiguration;
- (id)localDeviceConfiguration;
- (id)ownerConfiguration;
- (id)remoteDeviceConfiguration;
- (id)remoteDeviceInvitation;
- (id)transitionTable;
- (int64_t)configurationType;
- (int64_t)startingState;
@end

@implementation PKSubcredentialProvisioningConfiguration

- (PKSubcredentialProvisioningConfiguration)initWithConfigurationType:(int64_t)a3
{
  result = [(PKSubcredentialProvisioningConfiguration *)self init];
  if (result) {
    result->_configurationType = a3;
  }
  return result;
}

- (id)localDeviceConfiguration
{
  if (self->_configurationType > 1uLL) {
    v2 = 0;
  }
  else {
    v2 = self;
  }
  return v2;
}

- (id)ownerConfiguration
{
  if (self->_configurationType) {
    v2 = 0;
  }
  else {
    v2 = self;
  }
  return v2;
}

- (id)remoteDeviceConfiguration
{
  if (self->_configurationType == 2) {
    v2 = self;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (id)acceptInvitationConfiguration
{
  if (self->_configurationType == 1) {
    v2 = self;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (id)remoteDeviceInvitation
{
  if ((self->_configurationType & 0xFFFFFFFFFFFFFFFELL) == 2) {
    v2 = self;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (id)transitionTable
{
  return 0;
}

- (int64_t)startingState
{
  return 0;
}

- (int64_t)configurationType
{
  return self->_configurationType;
}

@end