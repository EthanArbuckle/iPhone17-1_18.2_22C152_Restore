@interface PGWallpaperLibraryAnalysisSummary
- (BOOL)libraryIsEmpty;
- (BOOL)libraryIsProcessedEnough;
- (PGWallpaperLibraryAnalysisSummary)initWithPhotoLibrary:(id)a3;
- (double)ratioOfAssetsAtOrAboveFaceAnalysisVersion;
- (double)ratioOfAssetsAtOrAboveSceneAnalysisVersion;
@end

@implementation PGWallpaperLibraryAnalysisSummary

- (BOOL)libraryIsEmpty
{
  return self->_libraryIsEmpty;
}

- (BOOL)libraryIsProcessedEnough
{
  return self->_libraryIsProcessedEnough;
}

- (double)ratioOfAssetsAtOrAboveFaceAnalysisVersion
{
  return self->_ratioOfAssetsAtOrAboveFaceAnalysisVersion;
}

- (double)ratioOfAssetsAtOrAboveSceneAnalysisVersion
{
  return self->_ratioOfAssetsAtOrAboveSceneAnalysisVersion;
}

- (PGWallpaperLibraryAnalysisSummary)initWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PGWallpaperLibraryAnalysisSummary;
  v5 = [(PGWallpaperLibraryAnalysisSummary *)&v17 init];
  v6 = v5;
  if (v5)
  {
    *(_WORD *)&v5->_libraryIsProcessedEnough = 0;
    v5->_ratioOfAssetsAtOrAboveSceneAnalysisVersion = 0.0;
    v5->_ratioOfAssetsAtOrAboveFaceAnalysisVersion = 0.0;
    [v4 ratioOfAssetsAtOrAboveSceneAnalysisVersion:88];
    v6->_ratioOfAssetsAtOrAboveSceneAnalysisVersion = v7;
    v8 = [v4 faceAnalysisProgressCounts];
    v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F74500]];
    v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F74508]];
    [v10 doubleValue];
    double v12 = v11;

    double v13 = 0.0;
    if (v12 > 0.0)
    {
      objc_msgSend(v9, "doubleValue", 0.0);
      double v13 = v14 / v12;
    }
    v6->_ratioOfAssetsAtOrAboveFaceAnalysisVersion = v13;
    BOOL v15 = v6->_ratioOfAssetsAtOrAboveSceneAnalysisVersion >= 0.75;
    if (v13 < 0.75) {
      BOOL v15 = 0;
    }
    v6->_libraryIsProcessedEnough = v15;
    v6->_libraryIsEmpty = v12 == 0.0;
  }
  return v6;
}

@end