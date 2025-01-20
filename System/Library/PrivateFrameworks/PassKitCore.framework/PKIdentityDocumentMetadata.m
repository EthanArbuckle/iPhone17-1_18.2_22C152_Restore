@interface PKIdentityDocumentMetadata
+ (BOOL)supportsSecureCoding;
- (NSString)cardConfigurationIdentifier;
- (NSString)cardTemplateIdentifier;
- (NSString)credentialIdentifier;
- (NSString)description;
- (NSString)serverEnvironmentIdentifier;
- (NSString)sharingInstanceIdentifier;
- (PKAddPassMetadataPreview)underlyingPreview;
- (PKIdentityDocumentMetadata)initWithCoder:(id)a3;
- (PKIdentityDocumentMetadata)initWithProvisioningCredentialIdentifier:(id)a3 sharingInstanceIdentifier:(id)a4 cardConfigurationIdentifier:(id)a5 cardTemplateIdentifier:(id)a6 requiresSimultaneousRequestRouting:(BOOL)a7 preview:(id)a8;
- (PKIdentityDocumentMetadata)initWithPushProvisioningTarget:(id)a3 preview:(id)a4;
- (PKPushProvisioningTarget)provisioningTarget;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_extendableDescription:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setProvisioningTarget:(id)a3;
- (void)setServerEnvironmentIdentifier:(id)a3;
- (void)setUnderlyingPreview:(id)a3;
@end

@implementation PKIdentityDocumentMetadata

- (PKIdentityDocumentMetadata)initWithProvisioningCredentialIdentifier:(id)a3 sharingInstanceIdentifier:(id)a4 cardConfigurationIdentifier:(id)a5 cardTemplateIdentifier:(id)a6 requiresSimultaneousRequestRouting:(BOOL)a7 preview:(id)a8
{
  id v14 = a8;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = [PKPushProvisioningTarget alloc];
  v20 = (void *)[v18 copy];

  v21 = (void *)[v16 copy];
  v22 = (void *)[v17 copy];

  v23 = (void *)[v15 copy];
  LOBYTE(v27) = a7;
  v24 = [(PKPushProvisioningTarget *)v19 initWithAppleIdentifier:0 appleIdentifierType:3 provisioningCredentialIdentifier:v20 cardConfigurationIdentifier:v21 sharingInstanceIdentifier:v22 nonce:0 accountHash:0 templateIdentifier:v23 relyingPartyIdentifier:0 requiresSimultaneousRequestRouting:v27 targetDevice:0 environmentIdentifier:0];

  v25 = [(PKIdentityDocumentMetadata *)self initWithPushProvisioningTarget:v24 preview:v14];
  return v25;
}

- (PKIdentityDocumentMetadata)initWithPushProvisioningTarget:(id)a3 preview:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKIdentityDocumentMetadata;
  v9 = [(PKIdentityDocumentMetadata *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_provisioningTarget, a3);
    objc_storeStrong((id *)&v10->_underlyingPreview, a4);
  }

  return v10;
}

- (PKAddPassMetadataPreview)underlyingPreview
{
  return self->_underlyingPreview;
}

- (void)setUnderlyingPreview:(id)a3
{
}

- (PKPushProvisioningTarget)provisioningTarget
{
  return self->_provisioningTarget;
}

- (void)setProvisioningTarget:(id)a3
{
}

- (NSString)credentialIdentifier
{
  return [(PKPushProvisioningTarget *)self->_provisioningTarget provisioningCredentialIdentifier];
}

- (NSString)sharingInstanceIdentifier
{
  return [(PKPushProvisioningTarget *)self->_provisioningTarget sharingInstanceIdentifier];
}

- (NSString)cardTemplateIdentifier
{
  v2 = [(PKPushProvisioningTarget *)self->_provisioningTarget templateIdentifier];
  v3 = v2;
  if (!v2) {
    v2 = &stru_1EE0F5368;
  }
  v4 = v2;

  return v4;
}

- (NSString)cardConfigurationIdentifier
{
  v2 = [(PKPushProvisioningTarget *)self->_provisioningTarget cardConfigurationIdentifier];
  v3 = v2;
  if (!v2) {
    v2 = &stru_1EE0F5368;
  }
  v4 = v2;

  return v4;
}

- (NSString)serverEnvironmentIdentifier
{
  v2 = [(PKPushProvisioningTarget *)self->_provisioningTarget environmentIdentifier];
  v3 = v2;
  if (!v2) {
    v2 = &stru_1EE0F5368;
  }
  v4 = v2;

  return v4;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [(PKIdentityDocumentMetadata *)self _extendableDescription:v3];
  [v3 appendFormat:@">"];
  v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (void)_extendableDescription:(id)a3
{
  underlyingPreview = self->_underlyingPreview;
  id v5 = a3;
  [v5 appendFormat:@"passPreview: '%@'; ", underlyingPreview];
  [v5 appendFormat:@"provisioningTarget: '%@';", self->_provisioningTarget];
}

- (PKIdentityDocumentMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKIdentityDocumentMetadata;
  id v5 = [(PKIdentityDocumentMetadata *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preview"];
    underlyingPreview = v5->_underlyingPreview;
    v5->_underlyingPreview = (PKAddPassMetadataPreview *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"provisioningTarget"];
    provisioningTarget = v5->_provisioningTarget;
    v5->_provisioningTarget = (PKPushProvisioningTarget *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  underlyingPreview = self->_underlyingPreview;
  id v5 = a3;
  [v5 encodeObject:underlyingPreview forKey:@"preview"];
  [v5 encodeObject:self->_provisioningTarget forKey:@"provisioningTarget"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(PKAddPassMetadataPreview *)self->_underlyingPreview copy];
  uint64_t v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(PKPushProvisioningTarget *)self->_provisioningTarget copy];
  uint64_t v8 = (void *)v4[1];
  v4[1] = v7;

  return v4;
}

- (void)setServerEnvironmentIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverEnvironmentIdentifier, 0);
  objc_storeStrong((id *)&self->_underlyingPreview, 0);
  objc_storeStrong((id *)&self->_provisioningTarget, 0);
}

@end