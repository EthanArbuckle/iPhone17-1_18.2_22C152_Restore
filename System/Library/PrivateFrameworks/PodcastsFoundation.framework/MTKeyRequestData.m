@interface MTKeyRequestData
- (NSData)keyData;
- (NSNumber)secureInvalidationDsid;
- (NSString)contentAdamId;
- (NSString)keyIdentifier;
- (void)setContentAdamId:(id)a3;
- (void)setKeyData:(id)a3;
- (void)setKeyIdentifier:(id)a3;
- (void)setSecureInvalidationDsid:(id)a3;
@end

@implementation MTKeyRequestData

- (NSData)keyData
{
  return self->_keyData;
}

- (void)setKeyData:(id)a3
{
}

- (NSString)keyIdentifier
{
  return self->_keyIdentifier;
}

- (void)setKeyIdentifier:(id)a3
{
}

- (NSString)contentAdamId
{
  return self->_contentAdamId;
}

- (void)setContentAdamId:(id)a3
{
}

- (NSNumber)secureInvalidationDsid
{
  return self->_secureInvalidationDsid;
}

- (void)setSecureInvalidationDsid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureInvalidationDsid, 0);
  objc_storeStrong((id *)&self->_contentAdamId, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
  objc_storeStrong((id *)&self->_keyData, 0);
}

@end