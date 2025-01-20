@interface PKShareablePassMetadataPreview
+ (BOOL)supportsSecureCoding;
+ (PKShareablePassMetadataPreview)previewWithTemplateIdentifier:(NSString *)templateIdentifier;
- (NSString)ownerDisplayName;
- (NSString)provisioningTemplateIdentifier;
- (PKShareablePassMetadataPreview)initWithCoder:(id)a3;
- (PKShareablePassMetadataPreview)initWithTemplateIdentifier:(NSString *)templateIdentifier;
- (id)_initWithPassThumbnail:(CGImage *)a3 localizedDescription:(id)a4 provisioningTemplateIdentifier:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_extendableDescription:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setOwnerDisplayName:(NSString *)ownerDisplayName;
- (void)setProvisioningTemplateIdentifier:(id)a3;
@end

@implementation PKShareablePassMetadataPreview

+ (PKShareablePassMetadataPreview)previewWithTemplateIdentifier:(NSString *)templateIdentifier
{
  v3 = templateIdentifier;
  id v4 = [[PKShareablePassMetadataPreview alloc] _initWithPassThumbnail:0 localizedDescription:0 provisioningTemplateIdentifier:v3];

  return (PKShareablePassMetadataPreview *)v4;
}

- (PKShareablePassMetadataPreview)initWithTemplateIdentifier:(NSString *)templateIdentifier
{
  id v4 = templateIdentifier;
  v5 = [[PKShareablePassMetadataPreview alloc] _initWithPassThumbnail:0 localizedDescription:0 provisioningTemplateIdentifier:v4];

  return v5;
}

- (id)_initWithPassThumbnail:(CGImage *)a3 localizedDescription:(id)a4 provisioningTemplateIdentifier:(id)a5
{
  id v9 = a5;
  v10 = [(PKAddPassMetadataPreview *)self initWithPassThumbnail:a3 localizedDescription:a4];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_provisioningTemplateIdentifier, a5);
  }

  return v11;
}

- (PKShareablePassMetadataPreview)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKShareablePassMetadataPreview;
  v5 = [(PKAddPassMetadataPreview *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ownerDisplayName"];
    ownerDisplayName = v5->_ownerDisplayName;
    v5->_ownerDisplayName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"provisioningTemplateIdentifier"];
    provisioningTemplateIdentifier = v5->_provisioningTemplateIdentifier;
    v5->_provisioningTemplateIdentifier = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKShareablePassMetadataPreview;
  id v4 = a3;
  [(PKAddPassMetadataPreview *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_ownerDisplayName, @"ownerDisplayName", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_provisioningTemplateIdentifier forKey:@"provisioningTemplateIdentifier"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_extendableDescription:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKShareablePassMetadataPreview;
  id v4 = a3;
  [(PKAddPassMetadataPreview *)&v5 _extendableDescription:v4];
  [v4 appendFormat:@"ownerDisplayName: '%@'; ", self->_ownerDisplayName];
  objc_msgSend(v4, "appendFormat:", @"provisioningTemplateIdentifier: '%@'; ",
    self->_provisioningTemplateIdentifier);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PKShareablePassMetadataPreview;
  id v4 = [(PKAddPassMetadataPreview *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_ownerDisplayName copy];
  uint64_t v6 = (void *)v4[4];
  v4[4] = v5;

  uint64_t v7 = [(NSString *)self->_provisioningTemplateIdentifier copy];
  uint64_t v8 = (void *)v4[5];
  v4[5] = v7;

  return v4;
}

- (NSString)ownerDisplayName
{
  return self->_ownerDisplayName;
}

- (void)setOwnerDisplayName:(NSString *)ownerDisplayName
{
}

- (NSString)provisioningTemplateIdentifier
{
  return self->_provisioningTemplateIdentifier;
}

- (void)setProvisioningTemplateIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisioningTemplateIdentifier, 0);
  objc_storeStrong((id *)&self->_ownerDisplayName, 0);
}

@end