@interface SFAutoFillPasskeyIdentifier
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)credentialID;
- (NSString)groupID;
- (SFAutoFillPasskeyIdentifier)initWithCoder:(id)a3;
- (SFAutoFillPasskeyIdentifier)initWithCoreIdentifier:(id)a3;
- (WBSPublicKeyCredentialIdentifier)coreIdentifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SFAutoFillPasskeyIdentifier

- (SFAutoFillPasskeyIdentifier)initWithCoreIdentifier:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFAutoFillPasskeyIdentifier;
  v6 = [(SFAutoFillPasskeyIdentifier *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_coreIdentifier, a3);
    v8 = v7;
  }

  return v7;
}

- (NSString)credentialID
{
  return (NSString *)[(WBSPublicKeyCredentialIdentifier *)self->_coreIdentifier credentialID];
}

- (NSString)groupID
{
  return (NSString *)[(WBSPublicKeyCredentialIdentifier *)self->_coreIdentifier groupID];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SFAutoFillPasskeyIdentifier *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      coreIdentifier = self->_coreIdentifier;
      v6 = [(SFAutoFillPasskeyIdentifier *)v4 coreIdentifier];
      char v7 = [(WBSPublicKeyCredentialIdentifier *)coreIdentifier isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return [(WBSPublicKeyCredentialIdentifier *)self->_coreIdentifier hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFAutoFillPasskeyIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"coreIdentifier"];

  v6 = [(SFAutoFillPasskeyIdentifier *)self initWithCoreIdentifier:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (WBSPublicKeyCredentialIdentifier)coreIdentifier
{
  return self->_coreIdentifier;
}

- (void).cxx_destruct
{
}

@end