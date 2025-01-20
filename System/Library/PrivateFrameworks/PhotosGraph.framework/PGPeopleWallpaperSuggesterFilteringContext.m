@interface PGPeopleWallpaperSuggesterFilteringContext
- (BOOL)favoritePersonsAreVIPs;
- (BOOL)isEqual:(id)a3;
- (double)normalizedDeviationForImportantPersons;
- (double)normalizedDeviationForVeryImportantPersons;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)initForAmbient;
- (id)initForCameraStyleable;
- (id)initForPeopleInOrientation:(int64_t)a3;
- (id)initForTopPeople:(BOOL)a3 withDictionary:(id)a4 orientation:(int64_t)a5;
- (id)initForTopPeopleInOrientation:(int64_t)a3;
- (int64_t)minimumPersonImportance;
- (unint64_t)minimumNumberOfCandidatesForEligiblePerson;
- (void)_commonInitForPeople;
- (void)setFavoritePersonsAreVIPs:(BOOL)a3;
- (void)setMinimumNumberOfCandidatesForEligiblePerson:(unint64_t)a3;
- (void)setMinimumPersonImportance:(int64_t)a3;
- (void)setNormalizedDeviationForImportantPersons:(double)a3;
- (void)setNormalizedDeviationForVeryImportantPersons:(double)a3;
- (void)updateFilteringContextWithDictionary:(id)a3;
@end

@implementation PGPeopleWallpaperSuggesterFilteringContext

- (void)setMinimumNumberOfCandidatesForEligiblePerson:(unint64_t)a3
{
  self->_minimumNumberOfCandidatesForEligiblePerson = a3;
}

- (unint64_t)minimumNumberOfCandidatesForEligiblePerson
{
  return self->_minimumNumberOfCandidatesForEligiblePerson;
}

- (void)setMinimumPersonImportance:(int64_t)a3
{
  self->_minimumPersonImportance = a3;
}

- (int64_t)minimumPersonImportance
{
  return self->_minimumPersonImportance;
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
  v14[5] = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)PGPeopleWallpaperSuggesterFilteringContext;
  v3 = [(PGSinglePersonWallpaperAssetSuggesterFilteringContext *)&v12 dictionaryRepresentation];
  v4 = (void *)[v3 mutableCopy];

  v13[0] = @"PGPeopleWallpaperSuggesterFilteringContextNormalizedDeviationForVeryImportantPersons";
  v5 = [NSNumber numberWithDouble:self->_normalizedDeviationForVeryImportantPersons];
  v14[0] = v5;
  v13[1] = @"PGPeopleWallpaperSuggesterFilteringContextNormalizedDeviationForImportantPersons";
  v6 = [NSNumber numberWithDouble:self->_normalizedDeviationForImportantPersons];
  v14[1] = v6;
  v13[2] = @"PGPeopleWallpaperSuggesterFilteringContextFavoritePersonsAreVIPs";
  v7 = [NSNumber numberWithBool:self->_favoritePersonsAreVIPs];
  v14[2] = v7;
  v13[3] = @"PGPeopleWallpaperSuggesterFilteringContextMinimumPersonImportance";
  v8 = [NSNumber numberWithInteger:self->_minimumPersonImportance];
  v14[3] = v8;
  v13[4] = @"PGPeopleWallpaperSuggesterFilteringContextMinimumNumberOfCandidatesForEligiblePerson";
  v9 = [NSNumber numberWithUnsignedInteger:self->_minimumNumberOfCandidatesForEligiblePerson];
  v14[4] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:5];
  [v4 addEntriesFromDictionary:v10];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PGPeopleWallpaperSuggesterFilteringContext *)a3;
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
      v9.receiver = self;
      v9.super_class = (Class)PGPeopleWallpaperSuggesterFilteringContext;
      BOOL v6 = [(PGSinglePersonWallpaperAssetSuggesterFilteringContext *)&v9 isEqual:v7]
        && v7->_normalizedDeviationForVeryImportantPersons == self->_normalizedDeviationForVeryImportantPersons
        && v7->_normalizedDeviationForImportantPersons == self->_normalizedDeviationForImportantPersons
        && v7->_favoritePersonsAreVIPs == self->_favoritePersonsAreVIPs
        && v7->_minimumPersonImportance == self->_minimumPersonImportance
        && v7->_minimumNumberOfCandidatesForEligiblePerson == self->_minimumNumberOfCandidatesForEligiblePerson;
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
  v5.receiver = self;
  v5.super_class = (Class)PGPeopleWallpaperSuggesterFilteringContext;
  id result = [(PGSinglePersonWallpaperAssetSuggesterFilteringContext *)&v5 copyWithZone:a3];
  *((void *)result + 14) = *(void *)&self->_normalizedDeviationForVeryImportantPersons;
  *((void *)result + 15) = *(void *)&self->_normalizedDeviationForImportantPersons;
  *((unsigned char *)result + 104) = self->_favoritePersonsAreVIPs;
  *((void *)result + 16) = self->_minimumPersonImportance;
  *((void *)result + 17) = self->_minimumNumberOfCandidatesForEligiblePerson;
  return result;
}

- (id)initForTopPeople:(BOOL)a3 withDictionary:(id)a4 orientation:(int64_t)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGPeopleWallpaperSuggesterFilteringContext;
  id v9 = [(PGSinglePersonWallpaperAssetSuggesterFilteringContext *)&v12 initForTopPeople:v6 withDictionary:v8 orientation:a5];
  v10 = v9;
  if (v9) {
    [v9 updateFilteringContextWithDictionary:v8];
  }

  return v10;
}

- (void)updateFilteringContextWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PGPeopleWallpaperSuggesterFilteringContext;
  [(PGSinglePersonWallpaperAssetSuggesterFilteringContext *)&v17 updateFilteringContextWithDictionary:v4];
  objc_super v5 = [v4 objectForKeyedSubscript:@"PGPeopleWallpaperSuggesterFilteringContextNormalizedDeviationForVeryImportantPersons"];
  if (v5)
  {
    BOOL v6 = [v4 objectForKeyedSubscript:@"PGPeopleWallpaperSuggesterFilteringContextNormalizedDeviationForVeryImportantPersons"];
    [v6 doubleValue];
    self->_normalizedDeviationForVeryImportantPersons = v7;
  }
  id v8 = [v4 objectForKeyedSubscript:@"PGPeopleWallpaperSuggesterFilteringContextNormalizedDeviationForImportantPersons"];
  if (v8)
  {
    id v9 = [v4 objectForKeyedSubscript:@"PGPeopleWallpaperSuggesterFilteringContextNormalizedDeviationForImportantPersons"];
    [v9 doubleValue];
    self->_normalizedDeviationForImportantPersons = v10;
  }
  v11 = [v4 objectForKeyedSubscript:@"PGPeopleWallpaperSuggesterFilteringContextFavoritePersonsAreVIPs"];
  if (v11)
  {
    objc_super v12 = [v4 objectForKeyedSubscript:@"PGPeopleWallpaperSuggesterFilteringContextFavoritePersonsAreVIPs"];
    self->_favoritePersonsAreVIPs = [v12 BOOLValue];
  }
  v13 = [v4 objectForKeyedSubscript:@"PGPeopleWallpaperSuggesterFilteringContextMinimumPersonImportance"];
  if (v13)
  {
    v14 = [v4 objectForKeyedSubscript:@"PGPeopleWallpaperSuggesterFilteringContextMinimumPersonImportance"];
    self->_minimumPersonImportance = [v14 unsignedIntegerValue];
  }
  v15 = [v4 objectForKeyedSubscript:@"PGPeopleWallpaperSuggesterFilteringContextMinimumNumberOfCandidatesForEligiblePerson"];
  if (v15)
  {
    v16 = [v4 objectForKeyedSubscript:@"PGPeopleWallpaperSuggesterFilteringContextMinimumNumberOfCandidatesForEligiblePerson"];
    self->_minimumNumberOfCandidatesForEligiblePerson = [v16 unsignedIntegerValue];
  }
}

- (void)_commonInitForPeople
{
  self->_normalizedDeviationForVeryImportantPersons = 1.0;
  self->_normalizedDeviationForImportantPersons = 0.5;
  self->_favoritePersonsAreVIPs = 1;
  self->_minimumPersonImportance = -1;
  self->_minimumNumberOfCandidatesForEligiblePerson = 1;
}

- (id)initForCameraStyleable
{
  v5.receiver = self;
  v5.super_class = (Class)PGPeopleWallpaperSuggesterFilteringContext;
  id v2 = [(PGSinglePersonWallpaperAssetSuggesterFilteringContext *)&v5 initForCameraStyleable];
  v3 = v2;
  if (v2) {
    [v2 _commonInitForPeople];
  }
  return v3;
}

- (id)initForAmbient
{
  v5.receiver = self;
  v5.super_class = (Class)PGPeopleWallpaperSuggesterFilteringContext;
  id v2 = [(PGSinglePersonWallpaperAssetSuggesterFilteringContext *)&v5 initForAmbient];
  v3 = v2;
  if (v2) {
    [v2 _commonInitForPeople];
  }
  return v3;
}

- (id)initForPeopleInOrientation:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PGPeopleWallpaperSuggesterFilteringContext;
  id v3 = [(PGSinglePersonWallpaperAssetSuggesterFilteringContext *)&v6 initForPeopleInOrientation:a3];
  id v4 = v3;
  if (v3) {
    [v3 _commonInitForPeople];
  }
  return v4;
}

- (id)initForTopPeopleInOrientation:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PGPeopleWallpaperSuggesterFilteringContext;
  id result = [(PGSinglePersonWallpaperAssetSuggesterFilteringContext *)&v4 initForTopPeopleInOrientation:a3];
  if (result)
  {
    *((void *)result + 14) = 0x3FF0000000000000;
    *((void *)result + 15) = 0x3FE0000000000000;
    *((unsigned char *)result + 104) = 1;
    *((void *)result + 16) = 2;
    *((void *)result + 17) = 1;
  }
  return result;
}

@end