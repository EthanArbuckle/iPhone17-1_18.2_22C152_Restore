@interface SFAutoFillPasskey
+ (BOOL)supportsSecureCoding;
- (NSData)userHandle;
- (NSString)customTitle;
- (NSString)relyingPartyIdentifier;
- (NSString)username;
- (SFAutoFillPasskey)initWithCoder:(id)a3;
- (SFAutoFillPasskey)initWithCoreAutoFillPasskey:(id)a3;
- (SFAutoFillPasskeyIdentifier)identifier;
- (WBSAutoFillPasskey)corePasskey;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SFAutoFillPasskey

- (SFAutoFillPasskey)initWithCoreAutoFillPasskey:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFAutoFillPasskey;
  v6 = [(SFAutoFillPasskey *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_corePasskey, a3);
    v8 = v7;
  }

  return v7;
}

- (NSString)username
{
  return (NSString *)[(WBSAutoFillPasskey *)self->_corePasskey username];
}

- (NSString)customTitle
{
  return (NSString *)[(WBSAutoFillPasskey *)self->_corePasskey customTitle];
}

- (NSString)relyingPartyIdentifier
{
  return (NSString *)[(WBSAutoFillPasskey *)self->_corePasskey relyingPartyIdentifier];
}

- (SFAutoFillPasskeyIdentifier)identifier
{
  v3 = [SFAutoFillPasskeyIdentifier alloc];
  v4 = [(WBSAutoFillPasskey *)self->_corePasskey identifier];
  id v5 = [(SFAutoFillPasskeyIdentifier *)v3 initWithCoreIdentifier:v4];

  return v5;
}

- (NSData)userHandle
{
  v2 = [(WBSAutoFillPasskey *)self->_corePasskey identifier];
  v3 = [v2 credentialID];
  v4 = [v3 dataUsingEncoding:4];

  return (NSData *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFAutoFillPasskey)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFAutoFillPasskey;
  id v5 = [(SFAutoFillPasskey *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"corePasskey"];
    corePasskey = v5->_corePasskey;
    v5->_corePasskey = (WBSAutoFillPasskey *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (WBSAutoFillPasskey)corePasskey
{
  return self->_corePasskey;
}

- (void).cxx_destruct
{
}

@end