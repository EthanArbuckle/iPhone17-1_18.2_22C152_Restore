@interface PGSettlingEffectWallpaperSuggesterFilteringContext
+ (BOOL)shouldRunSettlingEffectForAsset:(id)a3 subtype:(unsigned __int16)a4;
+ (double)minimumSettlingEffectScoreForSuggestionSubtype:(unsigned __int16)a3 mediaAnalysisVersion:(unint64_t)a4;
- (BOOL)ignoreClockOverlap;
- (double)maximumCropZoomRatio;
- (double)maximumLowLightScore;
- (double)minimumCropScore;
- (double)minimumWallpaperScore;
- (double)timeIntervalForCandidateDeduping;
- (id)initInOrientation:(int64_t)a3;
- (int64_t)orientation;
- (void)_commonInitInOrientation:(int64_t)a3;
- (void)setIgnoreClockOverlap:(BOOL)a3;
- (void)setMaximumCropZoomRatio:(double)a3;
- (void)setMaximumLowLightScore:(double)a3;
- (void)setMinimumCropScore:(double)a3;
- (void)setMinimumWallpaperScore:(double)a3;
- (void)setTimeIntervalForCandidateDeduping:(double)a3;
@end

@implementation PGSettlingEffectWallpaperSuggesterFilteringContext

- (void)setMaximumCropZoomRatio:(double)a3
{
  self->_maximumCropZoomRatio = a3;
}

- (double)maximumCropZoomRatio
{
  return self->_maximumCropZoomRatio;
}

- (void)setMaximumLowLightScore:(double)a3
{
  self->_maximumLowLightScore = a3;
}

- (double)maximumLowLightScore
{
  return self->_maximumLowLightScore;
}

- (void)setTimeIntervalForCandidateDeduping:(double)a3
{
  self->_timeIntervalForCandidateDeduping = a3;
}

- (double)timeIntervalForCandidateDeduping
{
  return self->_timeIntervalForCandidateDeduping;
}

- (void)setIgnoreClockOverlap:(BOOL)a3
{
  self->_ignoreClockOverlap = a3;
}

- (BOOL)ignoreClockOverlap
{
  return self->_ignoreClockOverlap;
}

- (void)setMinimumCropScore:(double)a3
{
  self->_minimumCropScore = a3;
}

- (double)minimumCropScore
{
  return self->_minimumCropScore;
}

- (void)setMinimumWallpaperScore:(double)a3
{
  self->_minimumWallpaperScore = a3;
}

- (double)minimumWallpaperScore
{
  return self->_minimumWallpaperScore;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)_commonInitInOrientation:(int64_t)a3
{
  self->_orientation = a3;
  *(_OWORD *)&self->_minimumWallpaperScore = xmmword_1D1F4F140;
  self->_ignoreClockOverlap = 1;
  *(_OWORD *)&self->_timeIntervalForCandidateDeduping = xmmword_1D1F4F150;
  self->_maximumCropZoomRatio = 999.0;
}

- (id)initInOrientation:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PGSettlingEffectWallpaperSuggesterFilteringContext;
  v4 = [(PGSettlingEffectWallpaperSuggesterFilteringContext *)&v7 init];
  v5 = v4;
  if (v4) {
    [(PGSettlingEffectWallpaperSuggesterFilteringContext *)v4 _commonInitInOrientation:a3];
  }
  return v5;
}

+ (BOOL)shouldRunSettlingEffectForAsset:(id)a3 subtype:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  +[PGSettlingEffectScoreHelper analyzedSettlingEffectScoreForAsset:v6 requestedOnDemand:0];
  float v8 = v7;
  v9 = [v6 mediaAnalysisProperties];
  objc_msgSend(a1, "minimumSettlingEffectScoreForSuggestionSubtype:mediaAnalysisVersion:", v4, objc_msgSend(v9, "mediaAnalysisVersion"));
  double v11 = v10;

  double v12 = v8;
  BOOL v13 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO);
  if (v11 > v12)
  {
    if (v13)
    {
      v14 = [v6 uuid];
      int v18 = 138412802;
      v19 = v14;
      __int16 v20 = 2048;
      double v21 = v12;
      __int16 v22 = 2048;
      double v23 = v11;
      v15 = MEMORY[0x1E4F14500];
      v16 = "[PGSettlingEffectWallpaperContexts] Asset: %@, Skip running FRC (%.2f < %.2f)";
      goto LABEL_6;
    }
  }
  else if (v13)
  {
    v14 = [v6 uuid];
    int v18 = 138412802;
    v19 = v14;
    __int16 v20 = 2048;
    double v21 = v12;
    __int16 v22 = 2048;
    double v23 = v11;
    v15 = MEMORY[0x1E4F14500];
    v16 = "[PGSettlingEffectWallpaperContexts] Asset: %@, Should run FRC (%.2f >= %.2f)";
LABEL_6:
    _os_log_impl(&dword_1D1805000, v15, OS_LOG_TYPE_INFO, v16, (uint8_t *)&v18, 0x20u);
  }
  return v11 <= v12;
}

+ (double)minimumSettlingEffectScoreForSuggestionSubtype:(unsigned __int16)a3 mediaAnalysisVersion:(unint64_t)a4
{
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F8EB40]) initWithMediaAnalysisVersion:a4];
  uint64_t v5 = [v4 settlingEffectScoreNode];
  if (v5)
  {
    id v6 = (void *)v5;
  }
  else
  {
    id v7 = objc_alloc(MEMORY[0x1E4F8EB40]);
    float v8 = objc_msgSend(v7, "initWithMediaAnalysisVersion:", objc_msgSend(MEMORY[0x1E4F8EB40], "latestVersion"));

    id v6 = [v8 settlingEffectScoreNode];
    uint64_t v4 = v8;
  }
  [v6 operatingPoint];
  double v10 = v9;

  return v10;
}

@end