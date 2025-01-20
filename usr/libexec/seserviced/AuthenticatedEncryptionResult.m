@interface AuthenticatedEncryptionResult
+ (id)withCipherText:(id)a3 authenticationTag:(id)a4;
- (NSData)authenticationTag;
- (NSData)cipherText;
@end

@implementation AuthenticatedEncryptionResult

+ (id)withCipherText:(id)a3 authenticationTag:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  v8 = (void *)v7[1];
  v7[1] = v5;
  id v9 = v5;

  v10 = (void *)v7[2];
  v7[2] = v6;

  return v7;
}

- (NSData)cipherText
{
  return self->_cipherText;
}

- (NSData)authenticationTag
{
  return self->_authenticationTag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationTag, 0);

  objc_storeStrong((id *)&self->_cipherText, 0);
}

@end