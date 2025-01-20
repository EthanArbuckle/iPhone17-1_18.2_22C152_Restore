@interface STSTransaction18013Request
- (BOOL)readerAuthenticated;
- (NSData)authenticationACL;
- (NSDictionary)elementsByNamespace;
- (NSString)credentialIdentifier;
- (NSString)docType;
- (NSString)readerMerchantId;
- (void)setAuthenticationACL:(id)a3;
- (void)setCredentialIdentifier:(id)a3;
- (void)setDocType:(id)a3;
- (void)setElementsByNamespace:(id)a3;
- (void)setReaderAuthenticated:(BOOL)a3;
- (void)setReaderMerchantId:(id)a3;
@end

@implementation STSTransaction18013Request

- (NSString)credentialIdentifier
{
  return self->_credentialIdentifier;
}

- (void)setCredentialIdentifier:(id)a3
{
}

- (NSDictionary)elementsByNamespace
{
  return self->_elementsByNamespace;
}

- (void)setElementsByNamespace:(id)a3
{
}

- (NSData)authenticationACL
{
  return self->_authenticationACL;
}

- (void)setAuthenticationACL:(id)a3
{
}

- (BOOL)readerAuthenticated
{
  return self->_readerAuthenticated;
}

- (void)setReaderAuthenticated:(BOOL)a3
{
  self->_readerAuthenticated = a3;
}

- (NSString)readerMerchantId
{
  return self->_readerMerchantId;
}

- (void)setReaderMerchantId:(id)a3
{
}

- (NSString)docType
{
  return self->_docType;
}

- (void)setDocType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_docType, 0);
  objc_storeStrong((id *)&self->_readerMerchantId, 0);
  objc_storeStrong((id *)&self->_authenticationACL, 0);
  objc_storeStrong((id *)&self->_elementsByNamespace, 0);
  objc_storeStrong((id *)&self->_credentialIdentifier, 0);
}

@end