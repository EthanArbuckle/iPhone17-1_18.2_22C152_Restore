@interface TetraPublicSigningKeyWrapper
- (BOOL)verifyTetraMessageSignature:(id)a3 formatter:(id)a4;
- (BOOL)verifyTetraRegistrationSignature:(id)a3 formatter:(id)a4;
- (SigningPublicKey)signingKey;
- (TetraPublicSigningKeyWrapper)initWithCompactRepresentation:(id)a3;
- (TetraPublicSigningKeyWrapper)initWithSigningPublicKey:(id)a3;
- (id)compactRepresentation;
- (id)lookupIdentifier;
- (void)setSigningKey:(id)a3;
@end

@implementation TetraPublicSigningKeyWrapper

- (id)lookupIdentifier
{
  v2 = [(PublicKey *)self->_signingKey dataRepresentation];
  v3 = [v2 base64EncodedStringWithOptions:0];

  return v3;
}

- (id)compactRepresentation
{
  v2 = [(PublicKey *)self->_signingKey key];
  v3 = [v2 dataRepresentation];

  return v3;
}

- (TetraPublicSigningKeyWrapper)initWithCompactRepresentation:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TetraPublicSigningKeyWrapper;
  v5 = [(TetraPublicSigningKeyWrapper *)&v12 init];
  if (!v5) {
    goto LABEL_3;
  }
  id v11 = 0;
  v6 = [[SigningPublicKey alloc] initWithData:v4 error:&v11];
  id v7 = v11;
  signingKey = v5->_signingKey;
  v5->_signingKey = v6;

  v9 = (TetraPublicSigningKeyWrapper *)v5->_signingKey;
  if (v9) {
LABEL_3:
  }
    v9 = v5;

  return v9;
}

- (TetraPublicSigningKeyWrapper)initWithSigningPublicKey:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TetraPublicSigningKeyWrapper;
  v6 = [(TetraPublicSigningKeyWrapper *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_signingKey, a3);
  }

  return v7;
}

- (BOOL)verifyTetraRegistrationSignature:(id)a3 formatter:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(TetraPublicSigningKeyWrapper *)self signingKey];
  char v9 = [v8 verifySignature:v7 formatter:v6];

  return v9;
}

- (BOOL)verifyTetraMessageSignature:(id)a3 formatter:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(TetraPublicSigningKeyWrapper *)self signingKey];
  char v9 = [v8 verifySignature:v7 formatter:v6];

  return v9;
}

- (SigningPublicKey)signingKey
{
  return (SigningPublicKey *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSigningKey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end