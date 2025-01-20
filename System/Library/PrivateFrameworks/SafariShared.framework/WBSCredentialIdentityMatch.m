@interface WBSCredentialIdentityMatch
- (NSExtension)extension;
- (NSString)completion;
- (SFCredentialIdentity)credentialIdentity;
- (SFSafariCredential)resolvedCredential;
- (WBSCredentialIdentityMatch)initWithCredentialIdentity:(id)a3 extension:(id)a4;
- (id)resolvedMatchWithCredential:(id)a3;
@end

@implementation WBSCredentialIdentityMatch

- (WBSCredentialIdentityMatch)initWithCredentialIdentity:(id)a3 extension:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WBSCredentialIdentityMatch;
  v9 = [(WBSCredentialIdentityMatch *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_credentialIdentity, a3);
    objc_storeStrong((id *)&v10->_extension, a4);
    v11 = v10;
  }

  return v10;
}

- (id)resolvedMatchWithCredential:(id)a3
{
  id v4 = a3;
  v5 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_storeStrong(v5 + 1, self->_credentialIdentity);
  objc_storeStrong(v5 + 2, self->_extension);
  id v6 = v5[3];
  v5[3] = v4;

  return v5;
}

- (NSString)completion
{
  return (NSString *)[(SFCredentialIdentity *)self->_credentialIdentity user];
}

- (SFCredentialIdentity)credentialIdentity
{
  return self->_credentialIdentity;
}

- (NSExtension)extension
{
  return self->_extension;
}

- (SFSafariCredential)resolvedCredential
{
  return self->_resolvedCredential;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedCredential, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_credentialIdentity, 0);
}

@end