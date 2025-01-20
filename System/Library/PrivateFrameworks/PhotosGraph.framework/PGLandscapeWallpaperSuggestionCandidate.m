@interface PGLandscapeWallpaperSuggestionCandidate
- (PGLandscapeWallpaperSuggestionCandidate)initWithAsset:(id)a3;
- (PHAsset)asset;
- (PNWallpaperCropResult)cropResult;
@end

@implementation PGLandscapeWallpaperSuggestionCandidate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cropResult, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (PNWallpaperCropResult)cropResult
{
  return (PNWallpaperCropResult *)objc_getProperty(self, a2, 16, 1);
}

- (PHAsset)asset
{
  return (PHAsset *)objc_getProperty(self, a2, 8, 1);
}

- (PGLandscapeWallpaperSuggestionCandidate)initWithAsset:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGLandscapeWallpaperSuggestionCandidate;
  v6 = [(PGLandscapeWallpaperSuggestionCandidate *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_asset, a3);
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F8E880]) initWithAsset:v5 classification:3];
    cropResult = v7->_cropResult;
    v7->_cropResult = (PNWallpaperCropResult *)v8;
  }
  return v7;
}

@end