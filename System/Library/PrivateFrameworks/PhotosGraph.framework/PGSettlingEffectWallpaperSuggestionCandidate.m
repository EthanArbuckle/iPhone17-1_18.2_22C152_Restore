@interface PGSettlingEffectWallpaperSuggestionCandidate
+ (id)sortDescriptorsForProcessing;
- (PGSettlingEffectWallpaperSuggestionCandidate)initWithAsset:(id)a3 suggestion:(id)a4;
- (PHAsset)asset;
- (PHSuggestion)suggestion;
- (PNWallpaperCropResult)cropResult;
@end

@implementation PGSettlingEffectWallpaperSuggestionCandidate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_cropResult, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (PHSuggestion)suggestion
{
  return (PHSuggestion *)objc_getProperty(self, a2, 24, 1);
}

- (PNWallpaperCropResult)cropResult
{
  return (PNWallpaperCropResult *)objc_getProperty(self, a2, 16, 1);
}

- (PHAsset)asset
{
  return (PHAsset *)objc_getProperty(self, a2, 8, 1);
}

- (PGSettlingEffectWallpaperSuggestionCandidate)initWithAsset:(id)a3 suggestion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PGSettlingEffectWallpaperSuggestionCandidate;
  v9 = [(PGSettlingEffectWallpaperSuggestionCandidate *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_asset, a3);
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F8E880]) initWithAsset:v7 classification:5];
    cropResult = v10->_cropResult;
    v10->_cropResult = (PNWallpaperCropResult *)v11;

    objc_storeStrong((id *)&v10->_suggestion, a4);
  }

  return v10;
}

+ (id)sortDescriptorsForProcessing
{
  v11[7] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"asset.mediaAnalysisProperties.activityScore" ascending:0];
  v3 = objc_msgSend(MEMORY[0x1E4F29008], "sortDescriptorWithKey:ascending:", @"asset.mediaAnalysisProperties.settlingEffectScore", 0, v2);
  v11[1] = v3;
  v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"asset.mediaAnalysisProperties.autoplaySuggestionScore" ascending:0];
  v11[2] = v4;
  v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"asset.mediaAnalysisProperties.wallpaperScore" ascending:0];
  v11[3] = v5;
  v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"asset.favorite" ascending:0];
  v11[4] = v6;
  id v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"asset.creationDate" ascending:0];
  v11[5] = v7;
  id v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"asset.uuid" ascending:1];
  v11[6] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:7];

  return v9;
}

@end