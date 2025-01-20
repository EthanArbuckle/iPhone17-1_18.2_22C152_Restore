@interface PGPetWallpaperSuggesterFilteringContext
- (BOOL)bypassCropScoreCheck;
- (BOOL)ignoreClockOverlap;
- (double)maximumCropZoomRatio;
- (double)maximumFaceSize;
- (double)maximumLowLightScore;
- (double)minimumCropScore;
- (double)minimumFaceSize;
- (double)minimumWallpaperScore;
- (double)timeIntervalForCandidateDeduping;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initForAmbient;
- (id)initForPetsInOrientation:(int64_t)a3;
- (id)initForTopPets:(BOOL)a3 withDictionary:(id)a4 orientation:(int64_t)a5;
- (id)initForTopPetsInOrientation:(int64_t)a3;
- (int64_t)orientation;
- (void)_commonInitWithOrientation:(int64_t)a3;
- (void)setBypassCropScoreCheck:(BOOL)a3;
- (void)setIgnoreClockOverlap:(BOOL)a3;
- (void)setMaximumCropZoomRatio:(double)a3;
- (void)setMaximumFaceSize:(double)a3;
- (void)setMaximumLowLightScore:(double)a3;
- (void)setMinimumCropScore:(double)a3;
- (void)setMinimumFaceSize:(double)a3;
- (void)setMinimumWallpaperScore:(double)a3;
- (void)setTimeIntervalForCandidateDeduping:(double)a3;
@end

@implementation PGPetWallpaperSuggesterFilteringContext

- (void)setBypassCropScoreCheck:(BOOL)a3
{
  self->_bypassCropScoreCheck = a3;
}

- (BOOL)bypassCropScoreCheck
{
  return self->_bypassCropScoreCheck;
}

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

- (void)setMaximumFaceSize:(double)a3
{
  self->_maximumFaceSize = a3;
}

- (double)maximumFaceSize
{
  return self->_maximumFaceSize;
}

- (void)setMinimumFaceSize:(double)a3
{
  self->_minimumFaceSize = a3;
}

- (double)minimumFaceSize
{
  return self->_minimumFaceSize;
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

- (id)copyWithZone:(_NSZone *)a3
{
  id result = +[PGPetWallpaperSuggesterFilteringContext allocWithZone:a3];
  *((void *)result + 3) = *(void *)&self->_minimumWallpaperScore;
  *((void *)result + 4) = *(void *)&self->_minimumCropScore;
  *((unsigned char *)result + 8) = self->_ignoreClockOverlap;
  *((void *)result + 5) = *(void *)&self->_timeIntervalForCandidateDeduping;
  *((void *)result + 6) = *(void *)&self->_minimumFaceSize;
  *((void *)result + 7) = *(void *)&self->_maximumFaceSize;
  *((void *)result + 8) = *(void *)&self->_maximumLowLightScore;
  *((void *)result + 9) = *(void *)&self->_maximumCropZoomRatio;
  return result;
}

- (id)initForTopPets:(BOOL)a3 withDictionary:(id)a4 orientation:(int64_t)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  if (v6) {
    v9 = [(PGPetWallpaperSuggesterFilteringContext *)self initForTopPetsInOrientation:a5];
  }
  else {
    v9 = [(PGPetWallpaperSuggesterFilteringContext *)self initForPetsInOrientation:a5];
  }
  v10 = v9;
  if (v9)
  {
    v11 = [v8 objectForKeyedSubscript:@"minimumWallpaperScore"];
    if (v11)
    {
      v12 = [v8 objectForKeyedSubscript:@"minimumWallpaperScore"];
      [v12 doubleValue];
      v10[3] = v13;
    }
    v14 = [v8 objectForKeyedSubscript:@"minimumCropScore"];
    if (v14)
    {
      v15 = [v8 objectForKeyedSubscript:@"minimumCropScore"];
      [v15 doubleValue];
      v10[4] = v16;
    }
    v17 = [v8 objectForKeyedSubscript:@"ignoreClockOverlap"];
    if (v17)
    {
      v18 = [v8 objectForKeyedSubscript:@"ignoreClockOverlap"];
      *((unsigned char *)v10 + 8) = [v18 BOOLValue];
    }
    v19 = [v8 objectForKeyedSubscript:@"timeIntervalForCandidateDeduping"];
    if (v19)
    {
      v20 = [v8 objectForKeyedSubscript:@"timeIntervalForCandidateDeduping"];
      [v20 doubleValue];
      v10[5] = v21;
    }
    v22 = [v8 objectForKeyedSubscript:@"minimumFaceSize"];
    if (v22)
    {
      v23 = [v8 objectForKeyedSubscript:@"minimumFaceSize"];
      [v23 doubleValue];
      v10[6] = v24;
    }
    v25 = [v8 objectForKeyedSubscript:@"maximumFaceSize"];
    if (v25)
    {
      v26 = [v8 objectForKeyedSubscript:@"maximumFaceSize"];
      [v26 doubleValue];
      v10[7] = v27;
    }
    v28 = [v8 objectForKeyedSubscript:@"maximumLowLightScore"];
    if (v28)
    {
      v29 = [v8 objectForKeyedSubscript:@"maximumLowLightScore"];
      [v29 doubleValue];
      v10[8] = v30;
    }
    v31 = [v8 objectForKeyedSubscript:@"maximumCropZoomRatio"];
    if (v31)
    {
      v32 = [v8 objectForKeyedSubscript:@"maximumCropZoomRatio"];
      [v32 doubleValue];
      v10[9] = v33;
    }
  }

  return v10;
}

- (void)_commonInitWithOrientation:(int64_t)a3
{
  self->_orientation = a3;
  *(_OWORD *)&self->_minimumWallpaperScore = xmmword_1D1F4F1C0;
  self->_ignoreClockOverlap = 0;
  *(_OWORD *)&self->_timeIntervalForCandidateDeduping = xmmword_1D1F4F1E0;
  *(_OWORD *)&self->_maximumFaceSize = xmmword_1D1F4F150;
  self->_maximumCropZoomRatio = 1.45;
}

- (id)initForAmbient
{
  v5.receiver = self;
  v5.super_class = (Class)PGPetWallpaperSuggesterFilteringContext;
  v2 = [(PGPetWallpaperSuggesterFilteringContext *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(PGPetWallpaperSuggesterFilteringContext *)v2 _commonInitWithOrientation:2];
    v3->_bypassCropScoreCheck = 1;
  }
  return v3;
}

- (id)initForPetsInOrientation:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PGPetWallpaperSuggesterFilteringContext;
  v4 = [(PGPetWallpaperSuggesterFilteringContext *)&v7 init];
  objc_super v5 = v4;
  if (v4) {
    [(PGPetWallpaperSuggesterFilteringContext *)v4 _commonInitWithOrientation:a3];
  }
  return v5;
}

- (id)initForTopPetsInOrientation:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PGPetWallpaperSuggesterFilteringContext;
  v4 = [(PGPetWallpaperSuggesterFilteringContext *)&v7 init];
  objc_super v5 = v4;
  if (v4)
  {
    [(PGPetWallpaperSuggesterFilteringContext *)v4 _commonInitWithOrientation:a3];
    v5->_bypassCropScoreCheck = 1;
  }
  return v5;
}

@end