@interface PGSinglePersonWallpaperAssetSuggesterFilteringContext
- (BOOL)bypassCropScoreCheck;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresNoBlink;
- (BOOL)requiresSmile;
- (BOOL)styleableFilter;
- (double)absoluteMinimumWallpaperScore;
- (double)maximumCropZoomRatio;
- (double)maximumFaceRoll;
- (double)maximumFaceSize;
- (double)maximumLowLightScore;
- (double)minimumCropScore;
- (double)minimumFaceQuality;
- (double)minimumFaceSize;
- (double)minimumWallpaperScore;
- (double)timeIntervalForCandidateDeduping;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)initForAmbient;
- (id)initForCameraStyleable;
- (id)initForPeopleInOrientation:(int64_t)a3;
- (id)initForTopPeople:(BOOL)a3 withDictionary:(id)a4 orientation:(int64_t)a5;
- (id)initForTopPeopleInOrientation:(int64_t)a3;
- (int64_t)orientation;
- (void)_commonInitInOrientation:(int64_t)a3;
- (void)setAbsoluteMinimumWallpaperScore:(double)a3;
- (void)setBypassCropScoreCheck:(BOOL)a3;
- (void)setMaximumCropZoomRatio:(double)a3;
- (void)setMaximumFaceRoll:(double)a3;
- (void)setMaximumFaceSize:(double)a3;
- (void)setMaximumLowLightScore:(double)a3;
- (void)setMinimumCropScore:(double)a3;
- (void)setMinimumFaceQuality:(double)a3;
- (void)setMinimumFaceSize:(double)a3;
- (void)setMinimumWallpaperScore:(double)a3;
- (void)setRequiresNoBlink:(BOOL)a3;
- (void)setRequiresSmile:(BOOL)a3;
- (void)setStyleableFilter:(BOOL)a3;
- (void)setTimeIntervalForCandidateDeduping:(double)a3;
- (void)updateFilteringContextWithDictionary:(id)a3;
@end

@implementation PGSinglePersonWallpaperAssetSuggesterFilteringContext

- (void)setStyleableFilter:(BOOL)a3
{
  self->_styleableFilter = a3;
}

- (BOOL)styleableFilter
{
  return self->_styleableFilter;
}

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

- (void)setMinimumCropScore:(double)a3
{
  self->_minimumCropScore = a3;
}

- (double)minimumCropScore
{
  return self->_minimumCropScore;
}

- (void)setAbsoluteMinimumWallpaperScore:(double)a3
{
  self->_absoluteMinimumWallpaperScore = a3;
}

- (double)absoluteMinimumWallpaperScore
{
  return self->_absoluteMinimumWallpaperScore;
}

- (void)setMinimumWallpaperScore:(double)a3
{
  self->_minimumWallpaperScore = a3;
}

- (double)minimumWallpaperScore
{
  return self->_minimumWallpaperScore;
}

- (void)setMaximumFaceRoll:(double)a3
{
  self->_maximumFaceRoll = a3;
}

- (double)maximumFaceRoll
{
  return self->_maximumFaceRoll;
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

- (void)setMinimumFaceQuality:(double)a3
{
  self->_minimumFaceQuality = a3;
}

- (double)minimumFaceQuality
{
  return self->_minimumFaceQuality;
}

- (void)setRequiresNoBlink:(BOOL)a3
{
  self->_requiresNoBlink = a3;
}

- (BOOL)requiresNoBlink
{
  return self->_requiresNoBlink;
}

- (void)setRequiresSmile:(BOOL)a3
{
  self->_requiresSmile = a3;
}

- (BOOL)requiresSmile
{
  return self->_requiresSmile;
}

- (void)setTimeIntervalForCandidateDeduping:(double)a3
{
  self->_timeIntervalForCandidateDeduping = a3;
}

- (double)timeIntervalForCandidateDeduping
{
  return self->_timeIntervalForCandidateDeduping;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (id)dictionaryRepresentation
{
  v18[12] = *MEMORY[0x1E4F143B8];
  v17[0] = @"PGSinglePersonWallpaperAssetSuggesterFilteringContextTimeIntervalForCandidateDeduping";
  v16 = [NSNumber numberWithDouble:self->_timeIntervalForCandidateDeduping];
  v18[0] = v16;
  v17[1] = @"PGSinglePersonWallpaperAssetSuggesterFilteringContextRequiresSmile";
  v15 = [NSNumber numberWithBool:self->_requiresSmile];
  v18[1] = v15;
  v17[2] = @"PGSinglePersonWallpaperAssetSuggesterFilteringContextRequiresNoBlink";
  v14 = [NSNumber numberWithBool:self->_requiresNoBlink];
  v18[2] = v14;
  v17[3] = @"PGSinglePersonWallpaperAssetSuggesterFilteringContextMinimumFaceQuality";
  v3 = [NSNumber numberWithDouble:self->_minimumFaceQuality];
  v18[3] = v3;
  v17[4] = @"PGSinglePersonWallpaperAssetSuggesterFilteringContextMinimumFaceSize";
  v4 = [NSNumber numberWithDouble:self->_minimumFaceSize];
  v18[4] = v4;
  v17[5] = @"PGSinglePersonWallpaperAssetSuggesterFilteringContextMaximumFaceSize";
  v5 = [NSNumber numberWithDouble:self->_maximumFaceSize];
  v18[5] = v5;
  v17[6] = @"PGSinglePersonWallpaperAssetSuggesterFilteringContextMaximumFaceRoll";
  v6 = [NSNumber numberWithDouble:self->_maximumFaceRoll];
  v18[6] = v6;
  v17[7] = @"PGSinglePersonWallpaperAssetSuggesterFilteringContextMinimumWallpaperScore";
  v7 = [NSNumber numberWithDouble:self->_minimumWallpaperScore];
  v18[7] = v7;
  v17[8] = @"PGSinglePersonWallpaperAssetSuggesterFilteringContextAbsoluteMinimumWallpaperScore";
  v8 = [NSNumber numberWithDouble:self->_absoluteMinimumWallpaperScore];
  v18[8] = v8;
  v17[9] = @"PGSinglePersonWallpaperAssetSuggesterFilteringContextMinimumCropScore";
  v9 = [NSNumber numberWithDouble:self->_minimumCropScore];
  v18[9] = v9;
  v17[10] = @"PGSinglePersonWallpaperAssetSuggesterFilteringContextMaximumLowLightScore";
  v10 = [NSNumber numberWithDouble:self->_maximumLowLightScore];
  v18[10] = v10;
  v17[11] = @"PGSinglePersonWallpaperAssetSuggesterFilteringContextMaximumCropZoomRatio";
  v11 = [NSNumber numberWithDouble:self->_maximumCropZoomRatio];
  v18[11] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:12];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PGSinglePersonWallpaperAssetSuggesterFilteringContext *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = v4;
      BOOL v6 = v7->_timeIntervalForCandidateDeduping == self->_timeIntervalForCandidateDeduping
        && v7->_requiresSmile == self->_requiresSmile
        && v7->_requiresNoBlink == self->_requiresNoBlink
        && v7->_minimumFaceQuality == self->_minimumFaceQuality
        && v7->_minimumFaceSize == self->_minimumFaceSize
        && v7->_maximumFaceSize == self->_maximumFaceSize
        && v7->_maximumFaceRoll == self->_maximumFaceRoll
        && v7->_minimumWallpaperScore == self->_minimumWallpaperScore
        && v7->_absoluteMinimumWallpaperScore == self->_absoluteMinimumWallpaperScore
        && v7->_minimumCropScore == self->_minimumCropScore
        && v7->_maximumLowLightScore == self->_maximumLowLightScore
        && v7->_maximumCropZoomRatio == self->_maximumCropZoomRatio;
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = +[PGSinglePersonWallpaperAssetSuggesterFilteringContext allocWithZone:a3];
  *((void *)result + 3) = *(void *)&self->_timeIntervalForCandidateDeduping;
  *((unsigned char *)result + 8) = self->_requiresSmile;
  *((unsigned char *)result + 9) = self->_requiresNoBlink;
  *((void *)result + 4) = *(void *)&self->_minimumFaceQuality;
  *((void *)result + 5) = *(void *)&self->_minimumFaceSize;
  *((void *)result + 6) = *(void *)&self->_maximumFaceSize;
  *((void *)result + 7) = *(void *)&self->_maximumFaceRoll;
  *((void *)result + 8) = *(void *)&self->_minimumWallpaperScore;
  *((void *)result + 9) = *(void *)&self->_absoluteMinimumWallpaperScore;
  *((void *)result + 10) = *(void *)&self->_minimumCropScore;
  *((void *)result + 11) = *(void *)&self->_maximumLowLightScore;
  *((void *)result + 12) = *(void *)&self->_maximumCropZoomRatio;
  return result;
}

- (id)initForTopPeople:(BOOL)a3 withDictionary:(id)a4 orientation:(int64_t)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  if (v6) {
    id v9 = [(PGSinglePersonWallpaperAssetSuggesterFilteringContext *)self initForTopPeopleInOrientation:a5];
  }
  else {
    id v9 = [(PGSinglePersonWallpaperAssetSuggesterFilteringContext *)self initForPeopleInOrientation:a5];
  }
  v10 = v9;
  if (v9) {
    [v9 updateFilteringContextWithDictionary:v8];
  }

  return v10;
}

- (void)updateFilteringContextWithDictionary:(id)a3
{
  id v38 = a3;
  v4 = [v38 objectForKeyedSubscript:@"PGSinglePersonWallpaperAssetSuggesterFilteringContextTimeIntervalForCandidateDeduping"];
  if (v4)
  {
    uint64_t v5 = [v38 objectForKeyedSubscript:@"PGSinglePersonWallpaperAssetSuggesterFilteringContextTimeIntervalForCandidateDeduping"];
    [v5 doubleValue];
    self->_timeIntervalForCandidateDeduping = v6;
  }
  v7 = [v38 objectForKeyedSubscript:@"PGSinglePersonWallpaperAssetSuggesterFilteringContextRequiresSmile"];
  if (v7)
  {
    id v8 = [v38 objectForKeyedSubscript:@"PGSinglePersonWallpaperAssetSuggesterFilteringContextRequiresSmile"];
    self->_requiresSmile = [v8 BOOLValue];
  }
  id v9 = [v38 objectForKeyedSubscript:@"PGSinglePersonWallpaperAssetSuggesterFilteringContextRequiresNoBlink"];
  if (v9)
  {
    v10 = [v38 objectForKeyedSubscript:@"PGSinglePersonWallpaperAssetSuggesterFilteringContextRequiresNoBlink"];
    self->_requiresNoBlink = [v10 BOOLValue];
  }
  v11 = [v38 objectForKeyedSubscript:@"PGSinglePersonWallpaperAssetSuggesterFilteringContextMinimumFaceQuality"];
  if (v11)
  {
    v12 = [v38 objectForKeyedSubscript:@"PGSinglePersonWallpaperAssetSuggesterFilteringContextMinimumFaceQuality"];
    [v12 doubleValue];
    self->_minimumFaceQuality = v13;
  }
  v14 = [v38 objectForKeyedSubscript:@"PGSinglePersonWallpaperAssetSuggesterFilteringContextMinimumFaceSize"];
  if (v14)
  {
    v15 = [v38 objectForKeyedSubscript:@"PGSinglePersonWallpaperAssetSuggesterFilteringContextMinimumFaceSize"];
    [v15 doubleValue];
    self->_minimumFaceSize = v16;
  }
  v17 = [v38 objectForKeyedSubscript:@"PGSinglePersonWallpaperAssetSuggesterFilteringContextMaximumFaceSize"];
  if (v17)
  {
    v18 = [v38 objectForKeyedSubscript:@"PGSinglePersonWallpaperAssetSuggesterFilteringContextMaximumFaceSize"];
    [v18 doubleValue];
    self->_maximumFaceSize = v19;
  }
  v20 = [v38 objectForKeyedSubscript:@"PGSinglePersonWallpaperAssetSuggesterFilteringContextMaximumFaceRoll"];
  if (v20)
  {
    v21 = [v38 objectForKeyedSubscript:@"PGSinglePersonWallpaperAssetSuggesterFilteringContextMaximumFaceRoll"];
    [v21 doubleValue];
    self->_maximumFaceRoll = v22;
  }
  v23 = [v38 objectForKeyedSubscript:@"PGSinglePersonWallpaperAssetSuggesterFilteringContextMinimumWallpaperScore"];
  if (v23)
  {
    v24 = [v38 objectForKeyedSubscript:@"PGSinglePersonWallpaperAssetSuggesterFilteringContextMinimumWallpaperScore"];
    [v24 doubleValue];
    self->_minimumWallpaperScore = v25;
  }
  v26 = [v38 objectForKeyedSubscript:@"PGSinglePersonWallpaperAssetSuggesterFilteringContextAbsoluteMinimumWallpaperScore"];
  if (v26)
  {
    v27 = [v38 objectForKeyedSubscript:@"PGSinglePersonWallpaperAssetSuggesterFilteringContextAbsoluteMinimumWallpaperScore"];
    [v27 doubleValue];
    self->_absoluteMinimumWallpaperScore = v28;
  }
  v29 = [v38 objectForKeyedSubscript:@"PGSinglePersonWallpaperAssetSuggesterFilteringContextMinimumCropScore"];
  if (v29)
  {
    v30 = [v38 objectForKeyedSubscript:@"PGSinglePersonWallpaperAssetSuggesterFilteringContextMinimumCropScore"];
    [v30 doubleValue];
    self->_minimumCropScore = v31;
  }
  v32 = [v38 objectForKeyedSubscript:@"PGSinglePersonWallpaperAssetSuggesterFilteringContextMaximumLowLightScore"];
  if (v32)
  {
    v33 = [v38 objectForKeyedSubscript:@"PGSinglePersonWallpaperAssetSuggesterFilteringContextMaximumLowLightScore"];
    [v33 doubleValue];
    self->_maximumLowLightScore = v34;
  }
  v35 = [v38 objectForKeyedSubscript:@"PGSinglePersonWallpaperAssetSuggesterFilteringContextMaximumCropZoomRatio"];
  if (v35)
  {
    v36 = [v38 objectForKeyedSubscript:@"PGSinglePersonWallpaperAssetSuggesterFilteringContextMaximumCropZoomRatio"];
    [v36 doubleValue];
    self->_maximumCropZoomRatio = v37;
  }
}

- (void)_commonInitInOrientation:(int64_t)a3
{
  self->_orientation = a3;
  *(_OWORD *)&self->_timeIntervalForCandidateDeduping = xmmword_1D1F4F0E0;
  *(_OWORD *)&self->_minimumFaceSize = xmmword_1D1F4F0F0;
  *(_OWORD *)&self->_maximumFaceRoll = xmmword_1D1F4F100;
  *(_OWORD *)&self->_absoluteMinimumWallpaperScore = xmmword_1D1F4F110;
  *(_OWORD *)&self->_maximumLowLightScore = xmmword_1D1F4F120;
  *(_DWORD *)&self->_requiresSmile = 257;
}

- (id)initForCameraStyleable
{
  v5.receiver = self;
  v5.super_class = (Class)PGSinglePersonWallpaperAssetSuggesterFilteringContext;
  v2 = [(PGSinglePersonWallpaperAssetSuggesterFilteringContext *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(PGSinglePersonWallpaperAssetSuggesterFilteringContext *)v2 _commonInitInOrientation:1];
    v3->_minimumFaceQuality = 0.0;
    v3->_minimumWallpaperScore = 0.0;
    v3->_absoluteMinimumWallpaperScore = 0.0;
    v3->_maximumLowLightScore = 1.79769313e308;
    v3->_maximumFaceRoll = 1.57079633;
    *(_DWORD *)&v3->_requiresSmile = 16842752;
  }
  return v3;
}

- (id)initForAmbient
{
  v5.receiver = self;
  v5.super_class = (Class)PGSinglePersonWallpaperAssetSuggesterFilteringContext;
  v2 = [(PGSinglePersonWallpaperAssetSuggesterFilteringContext *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(PGSinglePersonWallpaperAssetSuggesterFilteringContext *)v2 _commonInitInOrientation:2];
    v3->_bypassCropScoreCheck = 1;
  }
  return v3;
}

- (id)initForPeopleInOrientation:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PGSinglePersonWallpaperAssetSuggesterFilteringContext;
  v4 = [(PGSinglePersonWallpaperAssetSuggesterFilteringContext *)&v7 init];
  objc_super v5 = v4;
  if (v4) {
    [(PGSinglePersonWallpaperAssetSuggesterFilteringContext *)v4 _commonInitInOrientation:a3];
  }
  return v5;
}

- (id)initForTopPeopleInOrientation:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PGSinglePersonWallpaperAssetSuggesterFilteringContext;
  v4 = [(PGSinglePersonWallpaperAssetSuggesterFilteringContext *)&v7 init];
  objc_super v5 = v4;
  if (v4)
  {
    [(PGSinglePersonWallpaperAssetSuggesterFilteringContext *)v4 _commonInitInOrientation:a3];
    v5->_bypassCropScoreCheck = 1;
  }
  return v5;
}

@end