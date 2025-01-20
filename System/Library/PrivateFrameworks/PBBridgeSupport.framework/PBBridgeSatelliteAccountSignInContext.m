@interface PBBridgeSatelliteAccountSignInContext
- (NSDictionary)acceptedTermsInfo;
- (NSString)pairingParentAltDSID;
- (NSString)pairingParentUsername;
- (NSString)password;
- (NSString)username;
- (void)setAcceptedTermsInfo:(id)a3;
- (void)setPairingParentAltDSID:(id)a3;
- (void)setPairingParentUsername:(id)a3;
- (void)setPassword:(id)a3;
- (void)setUsername:(id)a3;
@end

@implementation PBBridgeSatelliteAccountSignInContext

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (NSDictionary)acceptedTermsInfo
{
  return self->_acceptedTermsInfo;
}

- (void)setAcceptedTermsInfo:(id)a3
{
}

- (NSString)pairingParentAltDSID
{
  return self->_pairingParentAltDSID;
}

- (void)setPairingParentAltDSID:(id)a3
{
}

- (NSString)pairingParentUsername
{
  return self->_pairingParentUsername;
}

- (void)setPairingParentUsername:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingParentUsername, 0);
  objc_storeStrong((id *)&self->_pairingParentAltDSID, 0);
  objc_storeStrong((id *)&self->_acceptedTermsInfo, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

@end