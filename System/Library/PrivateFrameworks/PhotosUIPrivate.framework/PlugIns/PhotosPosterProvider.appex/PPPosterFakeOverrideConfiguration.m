@interface PPPosterFakeOverrideConfiguration
- (BOOL)applySmartCrop;
- (BOOL)includeBackfillLayers;
- (BOOL)includeInactiveLayers;
- (NSString)assetIdentifier;
- (NSURL)assetURL;
- (PPPosterFakeOverrideConfiguration)initWithAssetIdentifier:(id)a3;
@end

@implementation PPPosterFakeOverrideConfiguration

- (void).cxx_destruct
{
}

- (NSString)assetIdentifier
{
  return self->_assetIdentifier;
}

- (BOOL)includeInactiveLayers
{
  return 1;
}

- (BOOL)includeBackfillLayers
{
  return 0;
}

- (BOOL)applySmartCrop
{
  return 1;
}

- (NSURL)assetURL
{
  return 0;
}

- (PPPosterFakeOverrideConfiguration)initWithAssetIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PPPosterFakeOverrideConfiguration;
  v6 = [(PPPosterFakeOverrideConfiguration *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_assetIdentifier, a3);
  }

  return v7;
}

@end