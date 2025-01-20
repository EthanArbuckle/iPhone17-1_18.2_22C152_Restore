@interface PGPetWallpaperSuggestionCandidate
- (PGPetWallpaperSuggestionCandidate)initWithFace:(id)a3 inAsset:(id)a4;
- (PHAsset)asset;
- (PHFace)face;
- (PNWallpaperCropResult)cropResult;
@end

@implementation PGPetWallpaperSuggestionCandidate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cropResult, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_face, 0);
}

- (PNWallpaperCropResult)cropResult
{
  return (PNWallpaperCropResult *)objc_getProperty(self, a2, 24, 1);
}

- (PHAsset)asset
{
  return (PHAsset *)objc_getProperty(self, a2, 16, 1);
}

- (PHFace)face
{
  return (PHFace *)objc_getProperty(self, a2, 8, 1);
}

- (PGPetWallpaperSuggestionCandidate)initWithFace:(id)a3 inAsset:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PGPetWallpaperSuggestionCandidate;
  v9 = [(PGPetWallpaperSuggestionCandidate *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_face, a3);
    objc_storeStrong((id *)&v10->_asset, a4);
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F8E880]) initWithAsset:v8 classification:2];
    cropResult = v10->_cropResult;
    v10->_cropResult = (PNWallpaperCropResult *)v11;
  }
  return v10;
}

@end