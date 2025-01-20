@interface PKShareablePassMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)requiresUnifiedAccessCapableDevice;
- (CGImageRef)passThumbnailImage;
- (NSString)accountHash;
- (NSString)cardConfigurationIdentifier;
- (NSString)cardTemplateIdentifier;
- (NSString)credentialIdentifier;
- (NSString)description;
- (NSString)localizedDescription;
- (NSString)ownerDisplayName;
- (NSString)relyingPartyIdentifier;
- (NSString)serverEnvironmentIdentifier;
- (NSString)sharingInstanceIdentifier;
- (NSString)templateIdentifier;
- (PKAddPassMetadataPreview)underlyingPreview;
- (PKPushProvisioningTarget)provisioningTarget;
- (PKShareablePassMetadata)initWithCoder:(id)a3;
- (PKShareablePassMetadata)initWithProvisioningCredentialIdentifier:(NSString *)credentialIdentifier cardConfigurationIdentifier:(NSString *)cardConfigurationIdentifier sharingInstanceIdentifier:(NSString *)sharingInstanceIdentifier passThumbnailImage:(CGImageRef)passThumbnailImage ownerDisplayName:(NSString *)ownerDisplayName localizedDescription:(NSString *)localizedDescription;
- (PKShareablePassMetadata)initWithProvisioningCredentialIdentifier:(NSString *)credentialIdentifier sharingInstanceIdentifier:(NSString *)sharingInstanceIdentifier cardConfigurationIdentifier:(NSString *)templateIdentifier preview:(PKShareablePassMetadataPreview *)preview;
- (PKShareablePassMetadata)initWithProvisioningCredentialIdentifier:(NSString *)credentialIdentifier sharingInstanceIdentifier:(NSString *)sharingInstanceIdentifier cardTemplateIdentifier:(NSString *)templateIdentifier preview:(PKShareablePassMetadataPreview *)preview;
- (PKShareablePassMetadata)initWithProvisioningCredentialIdentifier:(NSString *)credentialIdentifier sharingInstanceIdentifier:(NSString *)sharingInstanceIdentifier passThumbnailImage:(CGImageRef)passThumbnailImage ownerDisplayName:(NSString *)ownerDisplayName localizedDescription:(NSString *)localizedDescription accountHash:(NSString *)accountHash templateIdentifier:(NSString *)templateIdentifier relyingPartyIdentifier:(NSString *)relyingPartyIdentifier requiresUnifiedAccessCapableDevice:(BOOL)requiresUnifiedAccessCapableDevice;
- (PKShareablePassMetadata)initWithProvisioningCredentialIdentifier:(id)a3 cardConfigurationIdentifier:(id)a4 sharingInstanceIdentifier:(id)a5;
- (PKShareablePassMetadata)initWithPushProvisioningTarget:(id)a3;
- (PKShareablePassMetadataPreview)preview;
- (id)_initWithProvisioningCredentialIdentifier:(id)a3 cardConfigurationIdentifier:(id)a4 sharingInstanceIdentifier:(id)a5 passThumbnailImage:(CGImage *)a6 ownerDisplayName:(id)a7 localizedDescription:(id)a8 accountHash:(id)a9 templateIdentifier:(id)a10 relyingPartyIdentifier:(id)a11 requiresUnifiedAccessCapableDevice:(BOOL)a12 passPreviewMetadata:(id)a13;
- (id)_initWithPushProvisioningTarget:(id)a3 passThumbnailImage:(CGImage *)a4 ownerDisplayName:(id)a5 localizedDescription:(id)a6 passPreviewMetadata:(id)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountHash:(NSString *)accountHash;
- (void)setProvisioningTarget:(id)a3;
- (void)setRelyingPartyIdentifier:(NSString *)relyingPartyIdentifier;
- (void)setRequiresUnifiedAccessCapableDevice:(BOOL)requiresUnifiedAccessCapableDevice;
- (void)setServerEnvironmentIdentifier:(NSString *)serverEnvironmentIdentifier;
- (void)setUnderlyingPreview:(id)a3;
@end

@implementation PKShareablePassMetadata

- (PKShareablePassMetadata)initWithProvisioningCredentialIdentifier:(id)a3 cardConfigurationIdentifier:(id)a4 sharingInstanceIdentifier:(id)a5
{
  LOBYTE(v6) = 0;
  return (PKShareablePassMetadata *)[(PKShareablePassMetadata *)self _initWithProvisioningCredentialIdentifier:a3 cardConfigurationIdentifier:a4 sharingInstanceIdentifier:a5 passThumbnailImage:0 ownerDisplayName:0 localizedDescription:0 accountHash:0 templateIdentifier:0 relyingPartyIdentifier:0 requiresUnifiedAccessCapableDevice:v6 passPreviewMetadata:0];
}

- (PKShareablePassMetadata)initWithProvisioningCredentialIdentifier:(NSString *)credentialIdentifier cardConfigurationIdentifier:(NSString *)cardConfigurationIdentifier sharingInstanceIdentifier:(NSString *)sharingInstanceIdentifier passThumbnailImage:(CGImageRef)passThumbnailImage ownerDisplayName:(NSString *)ownerDisplayName localizedDescription:(NSString *)localizedDescription
{
  LOBYTE(v9) = 0;
  return (PKShareablePassMetadata *)[(PKShareablePassMetadata *)self _initWithProvisioningCredentialIdentifier:credentialIdentifier cardConfigurationIdentifier:cardConfigurationIdentifier sharingInstanceIdentifier:sharingInstanceIdentifier passThumbnailImage:passThumbnailImage ownerDisplayName:ownerDisplayName localizedDescription:localizedDescription accountHash:0 templateIdentifier:0 relyingPartyIdentifier:0 requiresUnifiedAccessCapableDevice:v9 passPreviewMetadata:0];
}

- (PKShareablePassMetadata)initWithProvisioningCredentialIdentifier:(NSString *)credentialIdentifier sharingInstanceIdentifier:(NSString *)sharingInstanceIdentifier passThumbnailImage:(CGImageRef)passThumbnailImage ownerDisplayName:(NSString *)ownerDisplayName localizedDescription:(NSString *)localizedDescription accountHash:(NSString *)accountHash templateIdentifier:(NSString *)templateIdentifier relyingPartyIdentifier:(NSString *)relyingPartyIdentifier requiresUnifiedAccessCapableDevice:(BOOL)requiresUnifiedAccessCapableDevice
{
  LOBYTE(v12) = requiresUnifiedAccessCapableDevice;
  return (PKShareablePassMetadata *)[(PKShareablePassMetadata *)self _initWithProvisioningCredentialIdentifier:credentialIdentifier cardConfigurationIdentifier:0 sharingInstanceIdentifier:sharingInstanceIdentifier passThumbnailImage:passThumbnailImage ownerDisplayName:ownerDisplayName localizedDescription:localizedDescription accountHash:accountHash templateIdentifier:templateIdentifier relyingPartyIdentifier:relyingPartyIdentifier requiresUnifiedAccessCapableDevice:v12 passPreviewMetadata:0];
}

- (PKShareablePassMetadata)initWithProvisioningCredentialIdentifier:(NSString *)credentialIdentifier sharingInstanceIdentifier:(NSString *)sharingInstanceIdentifier cardTemplateIdentifier:(NSString *)templateIdentifier preview:(PKShareablePassMetadataPreview *)preview
{
  LOBYTE(v7) = 0;
  return (PKShareablePassMetadata *)[(PKShareablePassMetadata *)self _initWithProvisioningCredentialIdentifier:credentialIdentifier cardConfigurationIdentifier:0 sharingInstanceIdentifier:sharingInstanceIdentifier passThumbnailImage:0 ownerDisplayName:0 localizedDescription:0 accountHash:0 templateIdentifier:templateIdentifier relyingPartyIdentifier:0 requiresUnifiedAccessCapableDevice:v7 passPreviewMetadata:preview];
}

- (PKShareablePassMetadata)initWithProvisioningCredentialIdentifier:(NSString *)credentialIdentifier sharingInstanceIdentifier:(NSString *)sharingInstanceIdentifier cardConfigurationIdentifier:(NSString *)templateIdentifier preview:(PKShareablePassMetadataPreview *)preview
{
  LOBYTE(v7) = 0;
  return (PKShareablePassMetadata *)[(PKShareablePassMetadata *)self _initWithProvisioningCredentialIdentifier:credentialIdentifier cardConfigurationIdentifier:templateIdentifier sharingInstanceIdentifier:sharingInstanceIdentifier passThumbnailImage:0 ownerDisplayName:0 localizedDescription:0 accountHash:0 templateIdentifier:0 relyingPartyIdentifier:0 requiresUnifiedAccessCapableDevice:v7 passPreviewMetadata:preview];
}

- (id)_initWithProvisioningCredentialIdentifier:(id)a3 cardConfigurationIdentifier:(id)a4 sharingInstanceIdentifier:(id)a5 passThumbnailImage:(CGImage *)a6 ownerDisplayName:(id)a7 localizedDescription:(id)a8 accountHash:(id)a9 templateIdentifier:(id)a10 relyingPartyIdentifier:(id)a11 requiresUnifiedAccessCapableDevice:(BOOL)a12 passPreviewMetadata:(id)a13
{
  id v36 = a13;
  id v18 = a11;
  id v19 = a10;
  id v20 = a9;
  id v35 = a8;
  id v21 = a7;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  v25 = [PKPushProvisioningTarget alloc];
  v26 = (void *)[v24 copy];

  v27 = (void *)[v23 copy];
  v28 = (void *)[v22 copy];

  v29 = (void *)[v19 copy];
  v30 = (void *)[v18 copy];

  LOBYTE(v34) = a12;
  v31 = [(PKPushProvisioningTarget *)v25 initWithAppleIdentifier:0 appleIdentifierType:3 provisioningCredentialIdentifier:v26 cardConfigurationIdentifier:v27 sharingInstanceIdentifier:v28 nonce:0 accountHash:v20 templateIdentifier:v29 relyingPartyIdentifier:v30 requiresSimultaneousRequestRouting:v34 targetDevice:0 environmentIdentifier:0];

  id v32 = [(PKShareablePassMetadata *)self _initWithPushProvisioningTarget:v31 passThumbnailImage:a6 ownerDisplayName:v21 localizedDescription:v35 passPreviewMetadata:v36];
  return v32;
}

- (PKShareablePassMetadata)initWithPushProvisioningTarget:(id)a3
{
  return (PKShareablePassMetadata *)[(PKShareablePassMetadata *)self _initWithPushProvisioningTarget:a3 passThumbnailImage:0 ownerDisplayName:0 localizedDescription:0 passPreviewMetadata:0];
}

- (id)_initWithPushProvisioningTarget:(id)a3 passThumbnailImage:(CGImage *)a4 ownerDisplayName:(id)a5 localizedDescription:(id)a6 passPreviewMetadata:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = v16;
  if (v16) {
    id v18 = v16;
  }
  else {
    id v18 = [[PKShareablePassMetadataPreview alloc] _initWithPassThumbnail:0 localizedDescription:0 provisioningTemplateIdentifier:0];
  }
  id v19 = v18;
  v24.receiver = self;
  v24.super_class = (Class)PKShareablePassMetadata;
  id v20 = [(PKShareablePassMetadata *)&v24 init];
  if (v20)
  {
    if (v14)
    {
      id v21 = (void *)[v14 copy];
      [v19 setOwnerDisplayName:v21];
    }
    if (a4) {
      [v19 setPassThumbnailImage:a4];
    }
    if (v15)
    {
      id v22 = (void *)[v15 copy];
      [v19 setLocalizedDescription:v22];
    }
    objc_storeStrong((id *)&v20->_provisioningTarget, a3);
    objc_storeStrong((id *)&v20->_preview, v19);
  }

  return v20;
}

- (PKAddPassMetadataPreview)underlyingPreview
{
  return (PKAddPassMetadataPreview *)self->_preview;
}

- (void)setUnderlyingPreview:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)&self->_preview, a3);
  }
  else
  {
    uint64_t v6 = PKLogFacilityTypeGetObject(0x1BuLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Unable to set underlying preview as it is not the expected subclass: %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (PKPushProvisioningTarget)provisioningTarget
{
  return self->_provisioningTarget;
}

- (void)setProvisioningTarget:(id)a3
{
}

- (NSString)accountHash
{
  return [(PKPushProvisioningTarget *)self->_provisioningTarget accountHash];
}

- (void)setAccountHash:(NSString *)accountHash
{
}

- (NSString)relyingPartyIdentifier
{
  return [(PKPushProvisioningTarget *)self->_provisioningTarget relyingPartyIdentifier];
}

- (void)setRelyingPartyIdentifier:(NSString *)relyingPartyIdentifier
{
}

- (NSString)templateIdentifier
{
  return [(PKPushProvisioningTarget *)self->_provisioningTarget templateIdentifier];
}

- (BOOL)requiresUnifiedAccessCapableDevice
{
  return [(PKPushProvisioningTarget *)self->_provisioningTarget requiresSimultaneousRequestRouting];
}

- (void)setRequiresUnifiedAccessCapableDevice:(BOOL)requiresUnifiedAccessCapableDevice
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

- (void)setServerEnvironmentIdentifier:(NSString *)serverEnvironmentIdentifier
{
}

- (CGImageRef)passThumbnailImage
{
  return [(PKAddPassMetadataPreview *)self->_preview passThumbnailImage];
}

- (NSString)localizedDescription
{
  return [(PKAddPassMetadataPreview *)self->_preview localizedDescription];
}

- (NSString)ownerDisplayName
{
  return [(PKShareablePassMetadataPreview *)self->_preview ownerDisplayName];
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"passPreview: '%@'; ", self->_preview];
  [v3 appendFormat:@"provisioningTarget: '%@';", self->_provisioningTarget];
  [v3 appendFormat:@">"];
  v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (PKShareablePassMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKShareablePassMetadata;
  id v5 = [(PKShareablePassMetadata *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preview"];
    preview = v5->_preview;
    v5->_preview = (PKShareablePassMetadataPreview *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"provisioningTarget"];
    provisioningTarget = v5->_provisioningTarget;
    v5->_provisioningTarget = (PKPushProvisioningTarget *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  preview = self->_preview;
  id v15 = a3;
  [v15 encodeObject:preview forKey:@"preview"];
  [v15 encodeObject:self->_provisioningTarget forKey:@"provisioningTarget"];
  id v5 = [(PKPushProvisioningTarget *)self->_provisioningTarget provisioningCredentialIdentifier];
  [v15 encodeObject:v5 forKey:@"credentialIdentifier"];

  uint64_t v6 = [(PKPushProvisioningTarget *)self->_provisioningTarget cardConfigurationIdentifier];
  [v15 encodeObject:v6 forKey:@"cardConfigurationIdentifier"];

  int v7 = [(PKPushProvisioningTarget *)self->_provisioningTarget sharingInstanceIdentifier];
  [v15 encodeObject:v7 forKey:@"sharingInstanceIdentifier"];

  uint64_t v8 = [(PKAddPassMetadataPreview *)self->_preview pkPassThumbnailImage];
  [v15 encodeObject:v8 forKey:@"thumbnailImage"];

  uint64_t v9 = [(PKAddPassMetadataPreview *)self->_preview localizedDescription];
  [v15 encodeObject:v9 forKey:@"localizedDescription"];

  v10 = [(PKShareablePassMetadataPreview *)self->_preview ownerDisplayName];
  [v15 encodeObject:v10 forKey:@"ownerDisplayName"];

  objc_super v11 = [(PKPushProvisioningTarget *)self->_provisioningTarget nonce];
  [v15 encodeObject:v11 forKey:@"nonce"];

  uint64_t v12 = [(PKPushProvisioningTarget *)self->_provisioningTarget accountHash];
  [v15 encodeObject:v12 forKey:@"accountHash"];

  id v13 = [(PKPushProvisioningTarget *)self->_provisioningTarget templateIdentifier];
  [v15 encodeObject:v13 forKey:@"templateIdentifier"];

  id v14 = [(PKPushProvisioningTarget *)self->_provisioningTarget relyingPartyIdentifier];
  [v15 encodeObject:v14 forKey:@"relyingPartyIdentifier"];

  objc_msgSend(v15, "encodeBool:forKey:", -[PKPushProvisioningTarget requiresSimultaneousRequestRouting](self->_provisioningTarget, "requiresSimultaneousRequestRouting"), @"requiresUnifiedAccessCapableDevice");
  objc_msgSend(v15, "encodeInteger:forKey:", -[PKPushProvisioningTarget targetDevice](self->_provisioningTarget, "targetDevice"), @"targetDevice");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(PKShareablePassMetadataPreview *)self->_preview copy];
  uint64_t v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(PKPushProvisioningTarget *)self->_provisioningTarget copy];
  uint64_t v8 = (void *)v4[1];
  v4[1] = v7;

  return v4;
}

- (PKShareablePassMetadataPreview)preview
{
  return self->_preview;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preview, 0);
  objc_storeStrong((id *)&self->_provisioningTarget, 0);
}

@end