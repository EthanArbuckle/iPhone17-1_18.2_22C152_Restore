@interface SSSilentEnrollmentContext
- (NSData)parameters;
- (NSNumber)accountIdentifier;
- (NSString)URLString;
- (NSString)headerADSID;
- (NSString)headerGSToken;
- (NSString)headerGuid;
- (NSString)headerMMeClientInfo;
- (NSString)headerMMeDeviceId;
- (void)setAccountIdentifier:(id)a3;
- (void)setHeaderADSID:(id)a3;
- (void)setHeaderGSToken:(id)a3;
- (void)setHeaderGuid:(id)a3;
- (void)setHeaderMMeClientInfo:(id)a3;
- (void)setHeaderMMeDeviceId:(id)a3;
- (void)setParameters:(id)a3;
- (void)setURLString:(id)a3;
@end

@implementation SSSilentEnrollmentContext

- (NSNumber)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSString)headerADSID
{
  return self->_headerADSID;
}

- (void)setHeaderADSID:(id)a3
{
}

- (NSString)headerGSToken
{
  return self->_headerGSToken;
}

- (void)setHeaderGSToken:(id)a3
{
}

- (NSString)headerGuid
{
  return self->_headerGuid;
}

- (void)setHeaderGuid:(id)a3
{
}

- (NSString)headerMMeClientInfo
{
  return self->_headerMMeClientInfo;
}

- (void)setHeaderMMeClientInfo:(id)a3
{
}

- (NSString)headerMMeDeviceId
{
  return self->_headerMMeDeviceId;
}

- (void)setHeaderMMeDeviceId:(id)a3
{
}

- (NSData)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- (NSString)URLString
{
  return self->_URLString;
}

- (void)setURLString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URLString, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_headerMMeDeviceId, 0);
  objc_storeStrong((id *)&self->_headerMMeClientInfo, 0);
  objc_storeStrong((id *)&self->_headerGuid, 0);
  objc_storeStrong((id *)&self->_headerGSToken, 0);
  objc_storeStrong((id *)&self->_headerADSID, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end