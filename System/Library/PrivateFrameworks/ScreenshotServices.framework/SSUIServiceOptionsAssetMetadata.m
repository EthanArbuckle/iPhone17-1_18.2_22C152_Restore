@interface SSUIServiceOptionsAssetMetadata
- (NSArray)assetDescription;
- (SSUIServiceOptionsAssetMetadata)initWithBSXPCCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)setAssetDescription:(id)a3;
@end

@implementation SSUIServiceOptionsAssetMetadata

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = [(SSUIServiceOptionsAssetMetadata *)self assetDescription];
  [v4 setAssetDescription:v5];

  return v4;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SSUIServiceOptionsAssetMetadata *)self assetDescription];
  [v4 encodeCollection:v5 forKey:@"SSUIServiceMetadataKey"];
}

- (SSUIServiceOptionsAssetMetadata)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SSUIServiceOptionsAssetMetadata *)self init];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [v4 decodeCollectionOfClass:v6 containingClass:objc_opt_class() forKey:@"SSUIServiceMetadataKey"];

  assetDescription = v5->_assetDescription;
  v5->_assetDescription = (NSArray *)v7;

  return v5;
}

- (NSArray)assetDescription
{
  return self->_assetDescription;
}

- (void)setAssetDescription:(id)a3
{
}

- (void).cxx_destruct
{
}

@end