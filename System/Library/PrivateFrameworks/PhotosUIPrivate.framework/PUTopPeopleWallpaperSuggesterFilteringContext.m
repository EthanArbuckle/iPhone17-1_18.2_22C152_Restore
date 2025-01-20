@interface PUTopPeopleWallpaperSuggesterFilteringContext
- (BOOL)favoritePersonsAreVIPs;
- (BOOL)requiresNoBlink;
- (BOOL)requiresOutdoor;
- (BOOL)requiresSmile;
- (PUTopPeopleWallpaperSuggesterFilteringContext)init;
- (double)maximumFaceRoll;
- (double)maximumFaceSize;
- (double)minimumCropScore;
- (double)minimumFaceQuality;
- (double)minimumFaceSize;
- (double)minimumWallpaperScore;
- (double)normalizedDeviationForImportantPersons;
- (double)normalizedDeviationForVeryImportantPersons;
- (double)timeIntervalForCandidateDeduping;
- (id)dictionaryRepresentation;
- (unint64_t)minimumNumberOfCandidatesForEligiblePerson;
- (void)setFavoritePersonsAreVIPs:(BOOL)a3;
- (void)setMaximumFaceRoll:(double)a3;
- (void)setMaximumFaceSize:(double)a3;
- (void)setMinimumCropScore:(double)a3;
- (void)setMinimumFaceQuality:(double)a3;
- (void)setMinimumFaceSize:(double)a3;
- (void)setMinimumNumberOfCandidatesForEligiblePerson:(unint64_t)a3;
- (void)setMinimumWallpaperScore:(double)a3;
- (void)setNormalizedDeviationForImportantPersons:(double)a3;
- (void)setNormalizedDeviationForVeryImportantPersons:(double)a3;
- (void)setRequiresNoBlink:(BOOL)a3;
- (void)setRequiresOutdoor:(BOOL)a3;
- (void)setRequiresSmile:(BOOL)a3;
- (void)setTimeIntervalForCandidateDeduping:(double)a3;
@end

@implementation PUTopPeopleWallpaperSuggesterFilteringContext

- (void)setRequiresOutdoor:(BOOL)a3
{
  self->_requiresOutdoor = a3;
}

- (BOOL)requiresOutdoor
{
  return self->_requiresOutdoor;
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

- (void)setMinimumNumberOfCandidatesForEligiblePerson:(unint64_t)a3
{
  self->_minimumNumberOfCandidatesForEligiblePerson = a3;
}

- (unint64_t)minimumNumberOfCandidatesForEligiblePerson
{
  return self->_minimumNumberOfCandidatesForEligiblePerson;
}

- (void)setFavoritePersonsAreVIPs:(BOOL)a3
{
  self->_favoritePersonsAreVIPs = a3;
}

- (BOOL)favoritePersonsAreVIPs
{
  return self->_favoritePersonsAreVIPs;
}

- (void)setNormalizedDeviationForImportantPersons:(double)a3
{
  self->_normalizedDeviationForImportantPersons = a3;
}

- (double)normalizedDeviationForImportantPersons
{
  return self->_normalizedDeviationForImportantPersons;
}

- (void)setNormalizedDeviationForVeryImportantPersons:(double)a3
{
  self->_normalizedDeviationForVeryImportantPersons = a3;
}

- (double)normalizedDeviationForVeryImportantPersons
{
  return self->_normalizedDeviationForVeryImportantPersons;
}

- (id)dictionaryRepresentation
{
  v19[13] = *MEMORY[0x1E4F143B8];
  v18[0] = @"PGPeopleWallpaperSuggesterFilteringContextNormalizedDeviationForVeryImportantPersons";
  v17 = [NSNumber numberWithDouble:self->_normalizedDeviationForVeryImportantPersons];
  v19[0] = v17;
  v18[1] = @"PGPeopleWallpaperSuggesterFilteringContextNormalizedDeviationForImportantPersons";
  v16 = [NSNumber numberWithDouble:self->_normalizedDeviationForImportantPersons];
  v19[1] = v16;
  v18[2] = @"PGPeopleWallpaperSuggesterFilteringContextFavoritePersonsAreVIPs";
  v15 = [NSNumber numberWithBool:self->_favoritePersonsAreVIPs];
  v19[2] = v15;
  v18[3] = @"PGPeopleWallpaperSuggesterFilteringContextMinimumNumberOfCandidatesForEligiblePerson";
  v14 = [NSNumber numberWithUnsignedInteger:self->_minimumNumberOfCandidatesForEligiblePerson];
  v19[3] = v14;
  v18[4] = @"PGSinglePersonWallpaperAssetSuggesterFilteringContextTimeIntervalForCandidateDeduping";
  v3 = [NSNumber numberWithDouble:self->_timeIntervalForCandidateDeduping];
  v19[4] = v3;
  v18[5] = @"PGSinglePersonWallpaperAssetSuggesterFilteringContextRequiresSmile";
  v4 = [NSNumber numberWithBool:self->_requiresSmile];
  v19[5] = v4;
  v18[6] = @"PGSinglePersonWallpaperAssetSuggesterFilteringContextRequiresNoBlink";
  v5 = [NSNumber numberWithBool:self->_requiresNoBlink];
  v19[6] = v5;
  v18[7] = @"PGSinglePersonWallpaperAssetSuggesterFilteringContextMinimumFaceQuality";
  v6 = [NSNumber numberWithDouble:self->_minimumFaceQuality];
  v19[7] = v6;
  v18[8] = @"PGSinglePersonWallpaperAssetSuggesterFilteringContextMinimumFaceSize";
  v7 = [NSNumber numberWithDouble:self->_minimumFaceSize];
  v19[8] = v7;
  v18[9] = @"PGSinglePersonWallpaperAssetSuggesterFilteringContextMaximumFaceSize";
  v8 = [NSNumber numberWithDouble:self->_maximumFaceSize];
  v19[9] = v8;
  v18[10] = @"PGSinglePersonWallpaperAssetSuggesterFilteringContextMaximumFaceRoll";
  v9 = [NSNumber numberWithDouble:self->_maximumFaceRoll];
  v19[10] = v9;
  v18[11] = @"PGSinglePersonWallpaperAssetSuggesterFilteringContextMinimumWallpaperScore";
  v10 = [NSNumber numberWithDouble:self->_minimumWallpaperScore];
  v19[11] = v10;
  v18[12] = @"PGSinglePersonWallpaperAssetSuggesterFilteringContextMinimumCropScore";
  v11 = [NSNumber numberWithDouble:self->_minimumCropScore];
  v19[12] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:13];

  return v12;
}

- (PUTopPeopleWallpaperSuggesterFilteringContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)PUTopPeopleWallpaperSuggesterFilteringContext;
  result = [(PUTopPeopleWallpaperSuggesterFilteringContext *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_normalizedDeviationForVeryImportantPersons = xmmword_1AEFF7CA0;
    result->_favoritePersonsAreVIPs = 1;
    result->_minimumNumberOfCandidatesForEligiblePerson = 1;
    *(_WORD *)&result->_requiresSmile = 257;
    *(_OWORD *)&result->_timeIntervalForCandidateDeduping = xmmword_1AEFF7CB0;
    *(_OWORD *)&result->_minimumFaceSize = xmmword_1AEFF7CC0;
    *(_OWORD *)&result->_maximumFaceRoll = xmmword_1AEFF7CD0;
    result->_minimumCropScore = 0.6;
  }
  return result;
}

@end