@interface _PUPosterOverrideConfiguration
- (BOOL)applySmartCrop;
- (BOOL)includeBackfillLayers;
- (BOOL)includeInactiveLayers;
- (NSString)assetIdentifier;
- (NSURL)assetURL;
- (_PUPosterOverrideConfiguration)initWithSettings:(id)a3 assetURL:(id)a4 assetIdentifier:(id)a5;
@end

@implementation _PUPosterOverrideConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetIdentifier, 0);
  objc_storeStrong((id *)&self->_assetURL, 0);
}

- (BOOL)includeInactiveLayers
{
  return self->_includeInactiveLayers;
}

- (BOOL)includeBackfillLayers
{
  return self->_includeBackfillLayers;
}

- (BOOL)applySmartCrop
{
  return self->_applySmartCrop;
}

- (NSString)assetIdentifier
{
  return self->_assetIdentifier;
}

- (NSURL)assetURL
{
  return self->_assetURL;
}

- (_PUPosterOverrideConfiguration)initWithSettings:(id)a3 assetURL:(id)a4 assetIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_PUPosterOverrideConfiguration;
  v11 = [(_PUPosterOverrideConfiguration *)&v14 init];
  if (v11)
  {
    if ([v8 useAssetURL]) {
      v12 = v9;
    }
    else {
      v12 = 0;
    }
    objc_storeStrong((id *)&v11->_assetURL, v12);
    objc_storeStrong((id *)&v11->_assetIdentifier, a5);
    v11->_applySmartCrop = [v8 smartCropEnabled];
    v11->_includeBackfillLayers = [v8 previewEnabled];
  }

  return v11;
}

@end