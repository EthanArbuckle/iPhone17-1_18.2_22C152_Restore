@interface SSUIServiceOptions
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (SSUIServiceOptions)initWithBSXPCCoder:(id)a3;
- (SSUIServiceOptionsAssetMetadata)assetMetadata;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)flashStyle;
- (unint64_t)saveLocation;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)setAssetMetadata:(id)a3;
- (void)setFlashStyle:(unint64_t)a3;
- (void)setSaveLocation:(unint64_t)a3;
@end

@implementation SSUIServiceOptions

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setFlashStyle:", -[SSUIServiceOptions flashStyle](self, "flashStyle"));
  objc_msgSend(v4, "setSaveLocation:", -[SSUIServiceOptions saveLocation](self, "saveLocation"));
  v5 = [(SSUIServiceOptions *)self assetMetadata];
  [v4 setAssetMetadata:v5];

  return v4;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeUInt64:forKey:", -[SSUIServiceOptions flashStyle](self, "flashStyle"), @"SSUIServiceFlashStyleKey");
  objc_msgSend(v4, "encodeUInt64:forKey:", -[SSUIServiceOptions saveLocation](self, "saveLocation"), @"SSUIServiceSaveLocationKey");
  id v5 = [(SSUIServiceOptions *)self assetMetadata];
  [v4 encodeObject:v5 forKey:@"SSUIServiceMetadataKey"];
}

- (SSUIServiceOptions)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SSUIServiceOptions *)self init];
  v5->_flashStyle = [v4 decodeUInt64ForKey:@"SSUIServiceFlashStyleKey"];
  v5->_saveLocation = [v4 decodeUInt64ForKey:@"SSUIServiceSaveLocationKey"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SSUIServiceMetadataKey"];

  assetMetadata = v5->_assetMetadata;
  v5->_assetMetadata = (SSUIServiceOptionsAssetMetadata *)v6;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SSUIServiceOptions *)a3;
  BOOL v7 = 1;
  if (self != v4)
  {
    unint64_t v5 = [(SSUIServiceOptions *)self flashStyle];
    if (v5 != [(SSUIServiceOptions *)v4 flashStyle]
      || (unint64_t v6 = [(SSUIServiceOptions *)self saveLocation],
          v6 != [(SSUIServiceOptions *)v4 saveLocation]))
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)flashStyle
{
  return self->_flashStyle;
}

- (void)setFlashStyle:(unint64_t)a3
{
  self->_flashStyle = a3;
}

- (unint64_t)saveLocation
{
  return self->_saveLocation;
}

- (void)setSaveLocation:(unint64_t)a3
{
  self->_saveLocation = a3;
}

- (SSUIServiceOptionsAssetMetadata)assetMetadata
{
  return self->_assetMetadata;
}

- (void)setAssetMetadata:(id)a3
{
}

- (void).cxx_destruct
{
}

@end