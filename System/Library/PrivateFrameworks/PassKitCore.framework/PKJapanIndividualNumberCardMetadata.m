@interface PKJapanIndividualNumberCardMetadata
+ (BOOL)supportsSecureCoding;
- (NSString)authenticationPassword;
- (NSString)signingPassword;
- (PKJapanIndividualNumberCardMetadata)initWithCoder:(id)a3;
- (PKJapanIndividualNumberCardMetadata)initWithProvisioningCredentialIdentifier:(id)a3 sharingInstanceIdentifier:(id)a4 cardConfigurationIdentifier:(id)a5 preview:(id)a6;
- (PKJapanIndividualNumberCardMetadata)initWithProvisioningCredentialIdentifier:(id)a3 sharingInstanceIdentifier:(id)a4 cardTemplateIdentifier:(id)a5 preview:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)supportDataRepresentationWithSID:(id)a3;
- (void)_extendableDescription:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthenticationPassword:(id)a3;
- (void)setPreview:(id)a3;
- (void)setSigningPassword:(id)a3;
@end

@implementation PKJapanIndividualNumberCardMetadata

- (PKJapanIndividualNumberCardMetadata)initWithProvisioningCredentialIdentifier:(id)a3 sharingInstanceIdentifier:(id)a4 cardTemplateIdentifier:(id)a5 preview:(id)a6
{
  v7.receiver = self;
  v7.super_class = (Class)PKJapanIndividualNumberCardMetadata;
  return [(PKIdentityDocumentMetadata *)&v7 initWithProvisioningCredentialIdentifier:a3 sharingInstanceIdentifier:a4 cardConfigurationIdentifier:0 cardTemplateIdentifier:a5 requiresSimultaneousRequestRouting:1 preview:a6];
}

- (PKJapanIndividualNumberCardMetadata)initWithProvisioningCredentialIdentifier:(id)a3 sharingInstanceIdentifier:(id)a4 cardConfigurationIdentifier:(id)a5 preview:(id)a6
{
  v7.receiver = self;
  v7.super_class = (Class)PKJapanIndividualNumberCardMetadata;
  return [(PKIdentityDocumentMetadata *)&v7 initWithProvisioningCredentialIdentifier:a3 sharingInstanceIdentifier:a4 cardConfigurationIdentifier:a5 cardTemplateIdentifier:0 requiresSimultaneousRequestRouting:1 preview:a6];
}

- (void)setAuthenticationPassword:(id)a3
{
  objc_msgSend(a3, "pk_zString");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  authenticationPassword = self->_authenticationPassword;
  self->_authenticationPassword = v4;
}

- (void)setSigningPassword:(id)a3
{
  objc_msgSend(a3, "pk_zString");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  signingPassword = self->_signingPassword;
  self->_signingPassword = v4;
}

- (id)supportDataRepresentationWithSID:(id)a3
{
  id v4 = a3;
  v5 = [[PKProvisioningJPKISupportData alloc] initWithPIN:self->_authenticationPassword password:self->_signingPassword type:0 sid:v4];

  return v5;
}

- (void)_extendableDescription:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKJapanIndividualNumberCardMetadata;
  id v4 = a3;
  [(PKIdentityDocumentMetadata *)&v7 _extendableDescription:v4];
  if ([(NSString *)self->_authenticationPassword length]) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  [v4 appendFormat:@"authenticationPassword is non-empty: '%@'; ", v5];
  if ([(NSString *)self->_signingPassword length]) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  [v4 appendFormat:@"signingPassword is non-empty: '%@'; ", v6];
}

- (PKJapanIndividualNumberCardMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKJapanIndividualNumberCardMetadata;
  v5 = [(PKIdentityDocumentMetadata *)&v9 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authentication"];
    [(PKJapanIndividualNumberCardMetadata *)v5 setAuthenticationPassword:v6];

    objc_super v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signing"];
    [(PKJapanIndividualNumberCardMetadata *)v5 setSigningPassword:v7];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKJapanIndividualNumberCardMetadata;
  id v4 = a3;
  [(PKIdentityDocumentMetadata *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_authenticationPassword, @"authentication", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_signingPassword forKey:@"signing"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PKJapanIndividualNumberCardMetadata;
  id v4 = [(PKIdentityDocumentMetadata *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_authenticationPassword copy];
  v6 = (void *)v4[4];
  v4[4] = v5;

  uint64_t v7 = [(NSString *)self->_signingPassword copy];
  v8 = (void *)v4[5];
  v4[5] = v7;

  return v4;
}

- (NSString)authenticationPassword
{
  return self->_authenticationPassword;
}

- (NSString)signingPassword
{
  return self->_signingPassword;
}

- (void)setPreview:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preview, 0);
  objc_storeStrong((id *)&self->_signingPassword, 0);
  objc_storeStrong((id *)&self->_authenticationPassword, 0);
}

@end