@interface FCAuthKitAuthorizationCredential
- (FCAuthKitAuthorizationCredential)initWithAuthorizationCode:(id)a3 identityToken:(id)a4 userIdentifier:(id)a5 email:(id)a6 familyName:(id)a7 givenName:(id)a8;
- (NSString)authorizationCode;
- (NSString)email;
- (NSString)familyName;
- (NSString)givenName;
- (NSString)identityToken;
- (NSString)userIdentifier;
@end

@implementation FCAuthKitAuthorizationCredential

- (FCAuthKitAuthorizationCredential)initWithAuthorizationCode:(id)a3 identityToken:(id)a4 userIdentifier:(id)a5 email:(id)a6 familyName:(id)a7 givenName:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)FCAuthKitAuthorizationCredential;
  v18 = [(FCAuthKitAuthorizationCredential *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_authorizationCode, a3);
    objc_storeStrong((id *)&v19->_identityToken, a4);
    objc_storeStrong((id *)&v19->_userIdentifier, a5);
    objc_storeStrong((id *)&v19->_email, a6);
    objc_storeStrong((id *)&v19->_familyName, a7);
    objc_storeStrong((id *)&v19->_givenName, a8);
  }

  return v19;
}

- (NSString)authorizationCode
{
  return self->_authorizationCode;
}

- (NSString)identityToken
{
  return self->_identityToken;
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (NSString)email
{
  return self->_email;
}

- (NSString)familyName
{
  return self->_familyName;
}

- (NSString)givenName
{
  return self->_givenName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_givenName, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_identityToken, 0);
  objc_storeStrong((id *)&self->_authorizationCode, 0);
}

@end