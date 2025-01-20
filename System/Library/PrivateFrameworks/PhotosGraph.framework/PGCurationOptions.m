@interface PGCurationOptions
+ (id)defaultOptions;
- (BOOL)failIfMinimumDurationNotReached;
- (BOOL)focusOnInterestingItems;
- (BOOL)focusOnPeople;
- (BOOL)identicalDedupingIsEnabled;
- (BOOL)includesAllFaces;
- (BOOL)lastPassMovieAdditionIsEnabled;
- (BOOL)movieDedupingIsEnabled;
- (BOOL)semanticalDedupingIsEnabled;
- (BOOL)semanticalDedupingUsesAdaptiveSimilarStacking;
- (BOOL)shouldSkipClustering;
- (BOOL)skipCurationIfEligibleItemsFitTargetDuration;
- (BOOL)useDurationBasedCuration;
- (NSSet)personLocalIdentifiersToFocus;
- (NSSet)uuidsOfEligibleAssets;
- (NSSet)uuidsOfRequiredAssets;
- (PGCurationOptions)initWithDictionaryRepresentation:(id)a3;
- (PGCurationOptions)initWithDuration:(unint64_t)a3;
- (double)defaultDurationOfLivePhoto;
- (double)defaultDurationOfStillPhoto;
- (double)defaultDurationOfVideo;
- (double)minimumDuration;
- (double)targetDuration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)duration;
- (unint64_t)minimumNumberOfItems;
- (unint64_t)targetNumberOfItems;
- (unsigned)sharingFilter;
- (void)setDefaultDurationOfLivePhoto:(double)a3;
- (void)setDefaultDurationOfStillPhoto:(double)a3;
- (void)setDefaultDurationOfVideo:(double)a3;
- (void)setDuration:(unint64_t)a3;
- (void)setFailIfMinimumDurationNotReached:(BOOL)a3;
- (void)setFocusOnInterestingItems:(BOOL)a3;
- (void)setFocusOnPeople:(BOOL)a3;
- (void)setIdenticalDedupingEnabled:(BOOL)a3;
- (void)setIncludesAllFaces:(BOOL)a3;
- (void)setLastPassMovieAdditionEnabled:(BOOL)a3;
- (void)setMinimumDuration:(double)a3;
- (void)setMinimumNumberOfItems:(unint64_t)a3;
- (void)setMovieDedupingEnabled:(BOOL)a3;
- (void)setPersonLocalIdentifiersToFocus:(id)a3;
- (void)setSemanticalDedupingEnabled:(BOOL)a3;
- (void)setSemanticalDedupingUsesAdaptiveSimilarStacking:(BOOL)a3;
- (void)setSharingFilter:(unsigned __int16)a3;
- (void)setShouldSkipClustering:(BOOL)a3;
- (void)setSkipCurationIfEligibleItemsFitTargetDuration:(BOOL)a3;
- (void)setTargetDuration:(double)a3;
- (void)setTargetNumberOfItems:(unint64_t)a3;
- (void)setUseDurationBasedCuration:(BOOL)a3;
- (void)setUuidsOfEligibleAssets:(id)a3;
- (void)setUuidsOfRequiredAssets:(id)a3;
@end

@implementation PGCurationOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personLocalIdentifiersToFocus, 0);
  objc_storeStrong((id *)&self->_uuidsOfEligibleAssets, 0);
  objc_storeStrong((id *)&self->_uuidsOfRequiredAssets, 0);
}

- (void)setTargetNumberOfItems:(unint64_t)a3
{
  self->_targetNumberOfItems = a3;
}

- (unint64_t)targetNumberOfItems
{
  return self->_targetNumberOfItems;
}

- (void)setSharingFilter:(unsigned __int16)a3
{
  self->_sharingFilter = a3;
}

- (unsigned)sharingFilter
{
  return self->_sharingFilter;
}

- (void)setMinimumNumberOfItems:(unint64_t)a3
{
  self->_minimumNumberOfItems = a3;
}

- (unint64_t)minimumNumberOfItems
{
  return self->_minimumNumberOfItems;
}

- (void)setTargetDuration:(double)a3
{
  self->_targetDuration = a3;
}

- (double)targetDuration
{
  return self->_targetDuration;
}

- (void)setMinimumDuration:(double)a3
{
  self->_minimumDuration = a3;
}

- (double)minimumDuration
{
  return self->_minimumDuration;
}

- (void)setDefaultDurationOfVideo:(double)a3
{
  self->_defaultDurationOfVideo = a3;
}

- (double)defaultDurationOfVideo
{
  return self->_defaultDurationOfVideo;
}

- (void)setDefaultDurationOfLivePhoto:(double)a3
{
  self->_defaultDurationOfLivePhoto = a3;
}

- (double)defaultDurationOfLivePhoto
{
  return self->_defaultDurationOfLivePhoto;
}

- (void)setDefaultDurationOfStillPhoto:(double)a3
{
  self->_defaultDurationOfStillPhoto = a3;
}

- (double)defaultDurationOfStillPhoto
{
  return self->_defaultDurationOfStillPhoto;
}

- (void)setSkipCurationIfEligibleItemsFitTargetDuration:(BOOL)a3
{
  self->_skipCurationIfEligibleItemsFitTargetDuration = a3;
}

- (BOOL)skipCurationIfEligibleItemsFitTargetDuration
{
  return self->_skipCurationIfEligibleItemsFitTargetDuration;
}

- (void)setFailIfMinimumDurationNotReached:(BOOL)a3
{
  self->_failIfMinimumDurationNotReached = a3;
}

- (BOOL)failIfMinimumDurationNotReached
{
  return self->_failIfMinimumDurationNotReached;
}

- (void)setUseDurationBasedCuration:(BOOL)a3
{
  self->_useDurationBasedCuration = a3;
}

- (BOOL)useDurationBasedCuration
{
  return self->_useDurationBasedCuration;
}

- (void)setPersonLocalIdentifiersToFocus:(id)a3
{
}

- (NSSet)personLocalIdentifiersToFocus
{
  return self->_personLocalIdentifiersToFocus;
}

- (void)setFocusOnInterestingItems:(BOOL)a3
{
  self->_focusOnInterestingItems = a3;
}

- (BOOL)focusOnInterestingItems
{
  return self->_focusOnInterestingItems;
}

- (void)setFocusOnPeople:(BOOL)a3
{
  self->_focusOnPeople = a3;
}

- (BOOL)focusOnPeople
{
  return self->_focusOnPeople;
}

- (void)setUuidsOfEligibleAssets:(id)a3
{
}

- (NSSet)uuidsOfEligibleAssets
{
  return self->_uuidsOfEligibleAssets;
}

- (void)setUuidsOfRequiredAssets:(id)a3
{
}

- (NSSet)uuidsOfRequiredAssets
{
  return self->_uuidsOfRequiredAssets;
}

- (void)setShouldSkipClustering:(BOOL)a3
{
  self->_shouldSkipClustering = a3;
}

- (BOOL)shouldSkipClustering
{
  return self->_shouldSkipClustering;
}

- (void)setLastPassMovieAdditionEnabled:(BOOL)a3
{
  self->_lastPassMovieAdditionEnabled = a3;
}

- (BOOL)lastPassMovieAdditionIsEnabled
{
  return self->_lastPassMovieAdditionEnabled;
}

- (void)setMovieDedupingEnabled:(BOOL)a3
{
  self->_movieDedupingEnabled = a3;
}

- (BOOL)movieDedupingIsEnabled
{
  return self->_movieDedupingEnabled;
}

- (void)setSemanticalDedupingUsesAdaptiveSimilarStacking:(BOOL)a3
{
  self->_semanticalDedupingUsesAdaptiveSimilarStacking = a3;
}

- (BOOL)semanticalDedupingUsesAdaptiveSimilarStacking
{
  return self->_semanticalDedupingUsesAdaptiveSimilarStacking;
}

- (void)setSemanticalDedupingEnabled:(BOOL)a3
{
  self->_semanticalDedupingEnabled = a3;
}

- (BOOL)semanticalDedupingIsEnabled
{
  return self->_semanticalDedupingEnabled;
}

- (void)setIdenticalDedupingEnabled:(BOOL)a3
{
  self->_identicalDedupingEnabled = a3;
}

- (BOOL)identicalDedupingIsEnabled
{
  return self->_identicalDedupingEnabled;
}

- (void)setIncludesAllFaces:(BOOL)a3
{
  self->_includesAllFaces = a3;
}

- (BOOL)includesAllFaces
{
  return self->_includesAllFaces;
}

- (void)setDuration:(unint64_t)a3
{
  self->_duration = a3;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [NSNumber numberWithUnsignedInteger:self->_duration];
  [v3 setObject:v4 forKeyedSubscript:@"duration"];

  v5 = [NSNumber numberWithBool:self->_includesAllFaces];
  [v3 setObject:v5 forKeyedSubscript:@"includesAllFaces"];

  v6 = [NSNumber numberWithBool:self->_identicalDedupingEnabled];
  [v3 setObject:v6 forKeyedSubscript:@"identicalDedupingEnabled"];

  v7 = [NSNumber numberWithBool:self->_semanticalDedupingEnabled];
  [v3 setObject:v7 forKeyedSubscript:@"semanticalDedupingEnabled"];

  v8 = [NSNumber numberWithBool:self->_semanticalDedupingUsesAdaptiveSimilarStacking];
  [v3 setObject:v8 forKeyedSubscript:@"semanticalDedupingUsesAdaptiveSimilarStacking"];

  v9 = [NSNumber numberWithBool:self->_movieDedupingEnabled];
  [v3 setObject:v9 forKeyedSubscript:@"movieDedupingEnabled"];

  v10 = [NSNumber numberWithBool:self->_lastPassMovieAdditionEnabled];
  [v3 setObject:v10 forKeyedSubscript:@"lastPassMovieAdditionEnabled"];

  v11 = [NSNumber numberWithBool:self->_shouldSkipClustering];
  [v3 setObject:v11 forKeyedSubscript:@"shouldSkipClustering"];

  v12 = [(NSSet *)self->_uuidsOfRequiredAssets allObjects];
  [v3 setObject:v12 forKeyedSubscript:@"uuidsOfRequiredAssets"];

  v13 = [(NSSet *)self->_uuidsOfEligibleAssets allObjects];
  [v3 setObject:v13 forKeyedSubscript:@"uuidsOfEligibleAssets"];

  v14 = [NSNumber numberWithBool:self->_focusOnPeople];
  [v3 setObject:v14 forKeyedSubscript:@"focusOnPeople"];

  v15 = [NSNumber numberWithBool:self->_focusOnInterestingItems];
  [v3 setObject:v15 forKeyedSubscript:@"focusOnInterestingItems"];

  v16 = [(NSSet *)self->_personLocalIdentifiersToFocus allObjects];
  [v3 setObject:v16 forKeyedSubscript:@"personLocalIdentifiersToFocus"];

  v17 = [NSNumber numberWithBool:self->_useDurationBasedCuration];
  [v3 setObject:v17 forKeyedSubscript:@"useDurationBasedCuration"];

  v18 = [NSNumber numberWithBool:self->_failIfMinimumDurationNotReached];
  [v3 setObject:v18 forKeyedSubscript:@"failIfMinimumDurationNotReached"];

  v19 = [NSNumber numberWithBool:self->_skipCurationIfEligibleItemsFitTargetDuration];
  [v3 setObject:v19 forKeyedSubscript:@"skipCurationIfEligibleItemsFitTargetDuration"];

  v20 = [NSNumber numberWithDouble:self->_defaultDurationOfStillPhoto];
  [v3 setObject:v20 forKeyedSubscript:@"defaultDurationOfStillPhoto"];

  v21 = [NSNumber numberWithDouble:self->_defaultDurationOfLivePhoto];
  [v3 setObject:v21 forKeyedSubscript:@"defaultDurationOfLivePhoto"];

  v22 = [NSNumber numberWithDouble:self->_defaultDurationOfVideo];
  [v3 setObject:v22 forKeyedSubscript:@"defaultDurationOfVideo"];

  v23 = [NSNumber numberWithDouble:self->_minimumDuration];
  [v3 setObject:v23 forKeyedSubscript:@"minimumDuration"];

  v24 = [NSNumber numberWithDouble:self->_targetDuration];
  [v3 setObject:v24 forKeyedSubscript:@"targetDuration"];

  v25 = [NSNumber numberWithUnsignedInteger:self->_minimumNumberOfItems];
  [v3 setObject:v25 forKeyedSubscript:@"minimumNumberOfItems"];

  v26 = [NSNumber numberWithUnsignedShort:self->_sharingFilter];
  [v3 setObject:v26 forKeyedSubscript:@"sharingFilter"];

  v27 = [NSNumber numberWithUnsignedInteger:self->_targetNumberOfItems];
  [v3 setObject:v27 forKeyedSubscript:@"targetNumberOfItems"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v4 + 24) = self->_duration;
  *(unsigned char *)(v4 + 15) = self->_focusOnPeople;
  *(unsigned char *)(v4 + 16) = self->_focusOnInterestingItems;
  *(unsigned char *)(v4 + 8) = self->_includesAllFaces;
  *(unsigned char *)(v4 + 9) = self->_identicalDedupingEnabled;
  *(unsigned char *)(v4 + 10) = self->_semanticalDedupingEnabled;
  *(unsigned char *)(v4 + 11) = self->_semanticalDedupingUsesAdaptiveSimilarStacking;
  *(unsigned char *)(v4 + 12) = self->_movieDedupingEnabled;
  *(unsigned char *)(v4 + 13) = self->_lastPassMovieAdditionEnabled;
  *(unsigned char *)(v4 + 14) = self->_shouldSkipClustering;
  uint64_t v5 = [(NSSet *)self->_uuidsOfRequiredAssets copy];
  v6 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v5;

  uint64_t v7 = [(NSSet *)self->_uuidsOfEligibleAssets copy];
  v8 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v7;

  uint64_t v9 = [(NSSet *)self->_personLocalIdentifiersToFocus copy];
  v10 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = v9;

  *(unsigned char *)(v4 + 17) = self->_useDurationBasedCuration;
  *(unsigned char *)(v4 + 18) = self->_failIfMinimumDurationNotReached;
  *(unsigned char *)(v4 + 19) = self->_skipCurationIfEligibleItemsFitTargetDuration;
  *(double *)(v4 + 56) = self->_defaultDurationOfStillPhoto;
  *(double *)(v4 + 64) = self->_defaultDurationOfLivePhoto;
  *(double *)(v4 + 72) = self->_defaultDurationOfVideo;
  *(double *)(v4 + 80) = self->_minimumDuration;
  *(double *)(v4 + 88) = self->_targetDuration;
  *(void *)(v4 + 96) = self->_minimumNumberOfItems;
  *(_WORD *)(v4 + 20) = self->_sharingFilter;
  *(void *)(v4 + 104) = self->_targetNumberOfItems;
  return (id)v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PGCurationOptions;
  uint64_t v4 = [(PGCurationOptions *)&v8 description];
  uint64_t v5 = [(PGCurationOptions *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@: %@", v4, v5];

  return v6;
}

- (PGCurationOptions)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)PGCurationOptions;
  uint64_t v5 = [(PGCurationOptions *)&v48 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"duration"];
    v5->_duration = [v6 integerValue];

    uint64_t v7 = [v4 objectForKeyedSubscript:@"includesAllFaces"];
    v5->_includesAllFaces = [v7 BOOLValue];

    objc_super v8 = [v4 objectForKeyedSubscript:@"identicalDedupingEnabled"];
    v5->_identicalDedupingEnabled = [v8 BOOLValue];

    uint64_t v9 = [v4 objectForKeyedSubscript:@"semanticalDedupingEnabled"];
    v5->_semanticalDedupingEnabled = [v9 BOOLValue];

    v10 = [v4 objectForKeyedSubscript:@"semanticalDedupingUsesAdaptiveSimilarStacking"];
    v5->_semanticalDedupingUsesAdaptiveSimilarStacking = [v10 BOOLValue];

    v11 = [v4 objectForKeyedSubscript:@"movieDedupingEnabled"];
    v5->_movieDedupingEnabled = [v11 BOOLValue];

    v12 = [v4 objectForKeyedSubscript:@"lastPassMovieAdditionEnabled"];
    v5->_lastPassMovieAdditionEnabled = [v12 BOOLValue];

    v13 = [v4 objectForKeyedSubscript:@"shouldSkipClustering"];
    v5->_shouldSkipClustering = [v13 BOOLValue];

    v14 = (void *)MEMORY[0x1E4F1CAD0];
    v15 = [v4 objectForKeyedSubscript:@"uuidsOfRequiredAssets"];
    uint64_t v16 = [v14 setWithArray:v15];
    uuidsOfRequiredAssets = v5->_uuidsOfRequiredAssets;
    v5->_uuidsOfRequiredAssets = (NSSet *)v16;

    v18 = (void *)MEMORY[0x1E4F1CAD0];
    v19 = [v4 objectForKeyedSubscript:@"uuidsOfEligibleAssets"];
    uint64_t v20 = [v18 setWithArray:v19];
    uuidsOfEligibleAssets = v5->_uuidsOfEligibleAssets;
    v5->_uuidsOfEligibleAssets = (NSSet *)v20;

    v22 = [v4 objectForKeyedSubscript:@"focusOnPeople"];
    v5->_focusOnPeople = [v22 BOOLValue];

    v23 = [v4 objectForKeyedSubscript:@"focusOnInterestingItems"];
    v5->_focusOnInterestingItems = [v23 BOOLValue];

    v24 = (void *)MEMORY[0x1E4F1CAD0];
    v25 = [v4 objectForKeyedSubscript:@"personLocalIdentifiersToFocus"];
    uint64_t v26 = [v24 setWithArray:v25];
    personLocalIdentifiersToFocus = v5->_personLocalIdentifiersToFocus;
    v5->_personLocalIdentifiersToFocus = (NSSet *)v26;

    v28 = [v4 objectForKeyedSubscript:@"useDurationBasedCuration"];
    v5->_useDurationBasedCuration = [v28 BOOLValue];

    v29 = [v4 objectForKeyedSubscript:@"failIfMinimumDurationNotReached"];
    v5->_failIfMinimumDurationNotReached = [v29 BOOLValue];

    v30 = [v4 objectForKeyedSubscript:@"skipCurationIfEligibleItemsFitTargetDuration"];
    v5->_skipCurationIfEligibleItemsFitTargetDuration = [v30 BOOLValue];

    v31 = [v4 objectForKeyedSubscript:@"defaultDurationOfStillPhoto"];
    v32 = v31;
    if (v31)
    {
      [v31 doubleValue];
      v5->_defaultDurationOfStillPhoto = v33;
    }
    else
    {
      v34 = [v4 objectForKeyedSubscript:@"defaultDurationOfPhoto"];
      [v34 doubleValue];
      v5->_defaultDurationOfStillPhoto = v35;
    }
    v36 = [v4 objectForKeyedSubscript:@"defaultDurationOfLivePhoto"];
    [v36 doubleValue];
    v5->_defaultDurationOfLivePhoto = v37;

    v38 = [v4 objectForKeyedSubscript:@"defaultDurationOfVideo"];
    [v38 doubleValue];
    v5->_defaultDurationOfVideo = v39;

    v40 = [v4 objectForKeyedSubscript:@"minimumDuration"];
    [v40 doubleValue];
    v5->_minimumDuration = v41;

    v42 = [v4 objectForKeyedSubscript:@"targetDuration"];
    [v42 doubleValue];
    v5->_targetDuration = v43;

    v44 = [v4 objectForKeyedSubscript:@"minimumNumberOfItems"];
    v5->_minimumNumberOfItems = [v44 unsignedIntegerValue];

    v45 = [v4 objectForKeyedSubscript:@"sharingFilter"];
    v5->_sharingFilter = [v45 unsignedShortValue];

    v46 = [v4 objectForKeyedSubscript:@"targetNumberOfItems"];
    v5->_targetNumberOfItems = [v46 unsignedIntegerValue];
  }
  return v5;
}

- (PGCurationOptions)initWithDuration:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PGCurationOptions;
  result = [(PGCurationOptions *)&v5 init];
  if (result)
  {
    result->_duration = a3;
    result->_identicalDedupingEnabled = 1;
    result->_semanticalDedupingUsesAdaptiveSimilarStacking = 1;
    result->_lastPassMovieAdditionEnabled = 1;
    *(_WORD *)&result->_useDurationBasedCuration = 0;
    result->_skipCurationIfEligibleItemsFitTargetDuration = 0;
    *(_OWORD *)&result->_defaultDurationOfStillPhoto = xmmword_1D1F4F160;
    *(_OWORD *)&result->_defaultDurationOfVideo = xmmword_1D1F4F170;
    result->_targetDuration = 60.0;
    result->_sharingFilter = 2;
    *(_OWORD *)&result->_minimumNumberOfItems = xmmword_1D1F4F180;
  }
  return result;
}

+ (id)defaultOptions
{
  v2 = (void *)[objc_alloc((Class)a1) initWithDuration:2];
  return v2;
}

@end