@interface PKIssuerProvisioningExtensionStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)passEntriesAvailable;
- (BOOL)remotePassEntriesAvailable;
- (BOOL)requiresAuthentication;
- (PKIssuerProvisioningExtensionStatus)init;
- (PKIssuerProvisioningExtensionStatus)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setPassEntriesAvailable:(BOOL)passEntriesAvailable;
- (void)setRemotePassEntriesAvailable:(BOOL)remotePassEntriesAvailable;
- (void)setRequiresAuthentication:(BOOL)requiresAuthentication;
@end

@implementation PKIssuerProvisioningExtensionStatus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKIssuerProvisioningExtensionStatus)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKIssuerProvisioningExtensionStatus;
  result = [(PKIssuerProvisioningExtensionStatus *)&v3 init];
  if (result) {
    *(_WORD *)&result->_requiresAuthentication = 0;
  }
  return result;
}

- (PKIssuerProvisioningExtensionStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKIssuerProvisioningExtensionStatus;
  v5 = [(PKIssuerProvisioningExtensionStatus *)&v7 init];
  if (v5)
  {
    v5->_requiresAuthentication = [v4 decodeBoolForKey:@"requiresAuthentication"];
    v5->_passEntriesAvailable = [v4 decodeBoolForKey:@"passEntriesAvailable"];
    v5->_remotePassEntriesAvailable = [v4 decodeBoolForKey:@"remotePassEntriesAvailable"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL requiresAuthentication = self->_requiresAuthentication;
  id v5 = a3;
  [v5 encodeBool:requiresAuthentication forKey:@"requiresAuthentication"];
  [v5 encodeBool:self->_passEntriesAvailable forKey:@"passEntriesAvailable"];
  [v5 encodeBool:self->_remotePassEntriesAvailable forKey:@"remotePassEntriesAvailable"];
}

- (id)description
{
  v2 = @"YES";
  if (self->_requiresAuthentication) {
    objc_super v3 = @"YES";
  }
  else {
    objc_super v3 = @"NO";
  }
  if (self->_passEntriesAvailable) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  if (!self->_remotePassEntriesAvailable) {
    v2 = @"NO";
  }
  return (id)[NSString stringWithFormat:@"requiresAuthentication: %@ passEntriesAvailable: %@ remotePassEntriesAvailable: %@", v3, v4, v2];
}

- (BOOL)requiresAuthentication
{
  return self->_requiresAuthentication;
}

- (void)setRequiresAuthentication:(BOOL)requiresAuthentication
{
  self->_BOOL requiresAuthentication = requiresAuthentication;
}

- (BOOL)passEntriesAvailable
{
  return self->_passEntriesAvailable;
}

- (void)setPassEntriesAvailable:(BOOL)passEntriesAvailable
{
  self->_passEntriesAvailable = passEntriesAvailable;
}

- (BOOL)remotePassEntriesAvailable
{
  return self->_remotePassEntriesAvailable;
}

- (void)setRemotePassEntriesAvailable:(BOOL)remotePassEntriesAvailable
{
  self->_remotePassEntriesAvailable = remotePassEntriesAvailable;
}

@end