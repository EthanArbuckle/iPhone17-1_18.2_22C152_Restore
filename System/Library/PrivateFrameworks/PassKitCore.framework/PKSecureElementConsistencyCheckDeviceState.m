@interface PKSecureElementConsistencyCheckDeviceState
- (NSArray)applets;
- (NSArray)deviceCredentials;
- (NSArray)devicePaymentApplications;
- (NSArray)passCredentials;
- (NSDictionary)passIsoBlobHashForCredentialIdentifier;
- (void)setApplets:(id)a3;
- (void)setDeviceCredentials:(id)a3;
- (void)setDevicePaymentApplications:(id)a3;
- (void)setPassCredentials:(id)a3;
- (void)setPassIsoBlobHashForCredentialIdentifier:(id)a3;
@end

@implementation PKSecureElementConsistencyCheckDeviceState

- (NSArray)applets
{
  return self->_applets;
}

- (void)setApplets:(id)a3
{
}

- (NSArray)devicePaymentApplications
{
  return self->_devicePaymentApplications;
}

- (void)setDevicePaymentApplications:(id)a3
{
}

- (NSArray)passCredentials
{
  return self->_passCredentials;
}

- (void)setPassCredentials:(id)a3
{
}

- (NSArray)deviceCredentials
{
  return self->_deviceCredentials;
}

- (void)setDeviceCredentials:(id)a3
{
}

- (NSDictionary)passIsoBlobHashForCredentialIdentifier
{
  return self->_passIsoBlobHashForCredentialIdentifier;
}

- (void)setPassIsoBlobHashForCredentialIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passIsoBlobHashForCredentialIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceCredentials, 0);
  objc_storeStrong((id *)&self->_passCredentials, 0);
  objc_storeStrong((id *)&self->_devicePaymentApplications, 0);
  objc_storeStrong((id *)&self->_applets, 0);
}

@end