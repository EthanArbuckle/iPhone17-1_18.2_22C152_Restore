@interface PPPosterOverrideConfiguration
- (BOOL)applySmartCrop;
- (BOOL)includeBackfillLayers;
- (BOOL)includeInactiveLayers;
- (NSString)assetIdentifier;
- (NSURL)assetURL;
- (PPPosterOverrideConfiguration)initWithWFWallpaperConfiguration:(id)a3;
- (PUWFWallpaperConfiguration)wallpaperConfiguration;
@end

@implementation PPPosterOverrideConfiguration

- (void).cxx_destruct
{
}

- (PUWFWallpaperConfiguration)wallpaperConfiguration
{
  return self->_wallpaperConfiguration;
}

- (BOOL)includeInactiveLayers
{
  v2 = [(PPPosterOverrideConfiguration *)self wallpaperConfiguration];
  BOOL v3 = [v2 location] != (id)1;

  return v3;
}

- (BOOL)includeBackfillLayers
{
  v2 = [(PPPosterOverrideConfiguration *)self wallpaperConfiguration];
  BOOL v3 = [v2 usePreview];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)applySmartCrop
{
  v2 = [(PPPosterOverrideConfiguration *)self wallpaperConfiguration];
  BOOL v3 = [v2 smartCrop];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (NSString)assetIdentifier
{
  v2 = [(PPPosterOverrideConfiguration *)self wallpaperConfiguration];
  BOOL v3 = [v2 assetIdentifier];

  return (NSString *)v3;
}

- (NSURL)assetURL
{
  v2 = [(PPPosterOverrideConfiguration *)self wallpaperConfiguration];
  BOOL v3 = [v2 assetURL];

  return (NSURL *)v3;
}

- (PPPosterOverrideConfiguration)initWithWFWallpaperConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PPPosterOverrideConfiguration;
  v6 = [(PPPosterOverrideConfiguration *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_wallpaperConfiguration, a3);
  }

  return v7;
}

@end