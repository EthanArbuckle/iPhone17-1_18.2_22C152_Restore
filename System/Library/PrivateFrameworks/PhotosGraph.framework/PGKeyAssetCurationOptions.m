@interface PGKeyAssetCurationOptions
- (BOOL)allowContextualTrip;
- (BOOL)allowGuestAsset;
- (BOOL)avoidPromotingAutoplayableItemsWhenUsingIconicScore;
- (BOOL)complete;
- (BOOL)focusOnPeople;
- (BOOL)isForMemories;
- (BOOL)prefilterAssetsWithFaces;
- (BOOL)promoteAutoplayableItems;
- (BOOL)useContextualCurationOnly;
- (BOOL)useIconicScore;
- (BOOL)useSummarizer;
- (BOOL)wantsGoodSquareCropScore;
- (CLLocation)referenceLocation;
- (NSSet)referencePersonLocalIdentifiers;
- (PGCurationCriteria)curationCriteria;
- (PGKeyAssetCurationOptions)init;
- (PGKeyAssetCurationOptions)initWithDictionaryRepresentation:(id)a3;
- (PGKeyAssetCurationOptions)initWithReferenceAsset:(id)a3;
- (PHAsset)referenceAsset;
- (double)prefilterAssetsWithFacesThreshold;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)minimumNumberOfReferencePersons;
- (void)setAllowContextualTrip:(BOOL)a3;
- (void)setAllowGuestAsset:(BOOL)a3;
- (void)setAvoidPromotingAutoplayableItemsWhenUsingIconicScore:(BOOL)a3;
- (void)setComplete:(BOOL)a3;
- (void)setCurationCriteria:(id)a3;
- (void)setFocusOnPeople:(BOOL)a3;
- (void)setIsForMemories:(BOOL)a3;
- (void)setMinimumNumberOfReferencePersons:(unint64_t)a3;
- (void)setPrefilterAssetsWithFaces:(BOOL)a3;
- (void)setPrefilterAssetsWithFacesThreshold:(double)a3;
- (void)setPromoteAutoplayableItems:(BOOL)a3;
- (void)setReferenceLocation:(id)a3;
- (void)setReferencePersonLocalIdentifiers:(id)a3;
- (void)setUseContextualCurationOnly:(BOOL)a3;
- (void)setUseIconicScore:(BOOL)a3;
- (void)setUseSummarizer:(BOOL)a3;
- (void)setWantsGoodSquareCropScore:(BOOL)a3;
@end

@implementation PGKeyAssetCurationOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curationCriteria, 0);
  objc_storeStrong((id *)&self->_referenceAsset, 0);
  objc_storeStrong((id *)&self->_referencePersonLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_referenceLocation, 0);
}

- (void)setCurationCriteria:(id)a3
{
}

- (PGCurationCriteria)curationCriteria
{
  return self->_curationCriteria;
}

- (PHAsset)referenceAsset
{
  return self->_referenceAsset;
}

- (void)setAvoidPromotingAutoplayableItemsWhenUsingIconicScore:(BOOL)a3
{
  self->_avoidPromotingAutoplayableItemsWhenUsingIconicScore = a3;
}

- (BOOL)avoidPromotingAutoplayableItemsWhenUsingIconicScore
{
  return self->_avoidPromotingAutoplayableItemsWhenUsingIconicScore;
}

- (void)setUseIconicScore:(BOOL)a3
{
  self->_useIconicScore = a3;
}

- (BOOL)useIconicScore
{
  return self->_useIconicScore;
}

- (void)setWantsGoodSquareCropScore:(BOOL)a3
{
  self->_wantsGoodSquareCropScore = a3;
}

- (BOOL)wantsGoodSquareCropScore
{
  return self->_wantsGoodSquareCropScore;
}

- (void)setAllowGuestAsset:(BOOL)a3
{
  self->_allowGuestAsset = a3;
}

- (BOOL)allowGuestAsset
{
  return self->_allowGuestAsset;
}

- (void)setIsForMemories:(BOOL)a3
{
  self->_isForMemories = a3;
}

- (BOOL)isForMemories
{
  return self->_isForMemories;
}

- (void)setPromoteAutoplayableItems:(BOOL)a3
{
  self->_promoteAutoplayableItems = a3;
}

- (BOOL)promoteAutoplayableItems
{
  return self->_promoteAutoplayableItems;
}

- (void)setPrefilterAssetsWithFacesThreshold:(double)a3
{
  self->_prefilterAssetsWithFacesThreshold = a3;
}

- (double)prefilterAssetsWithFacesThreshold
{
  return self->_prefilterAssetsWithFacesThreshold;
}

- (void)setPrefilterAssetsWithFaces:(BOOL)a3
{
  self->_prefilterAssetsWithFaces = a3;
}

- (BOOL)prefilterAssetsWithFaces
{
  return self->_prefilterAssetsWithFaces;
}

- (void)setUseContextualCurationOnly:(BOOL)a3
{
  self->_useContextualCurationOnly = a3;
}

- (BOOL)useContextualCurationOnly
{
  return self->_useContextualCurationOnly;
}

- (void)setUseSummarizer:(BOOL)a3
{
  self->_useSummarizer = a3;
}

- (BOOL)useSummarizer
{
  return self->_useSummarizer;
}

- (void)setAllowContextualTrip:(BOOL)a3
{
  self->_allowContextualTrip = a3;
}

- (BOOL)allowContextualTrip
{
  return self->_allowContextualTrip;
}

- (void)setComplete:(BOOL)a3
{
  self->_complete = a3;
}

- (BOOL)complete
{
  return self->_complete;
}

- (void)setFocusOnPeople:(BOOL)a3
{
  self->_focusOnPeople = a3;
}

- (BOOL)focusOnPeople
{
  return self->_focusOnPeople;
}

- (void)setReferencePersonLocalIdentifiers:(id)a3
{
}

- (NSSet)referencePersonLocalIdentifiers
{
  return self->_referencePersonLocalIdentifiers;
}

- (void)setMinimumNumberOfReferencePersons:(unint64_t)a3
{
  self->_minimumNumberOfReferencePersons = a3;
}

- (unint64_t)minimumNumberOfReferencePersons
{
  return self->_minimumNumberOfReferencePersons;
}

- (void)setReferenceLocation:(id)a3
{
}

- (CLLocation)referenceLocation
{
  return self->_referenceLocation;
}

- (id)dictionaryRepresentation
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  referenceLocation = self->_referenceLocation;
  if (referenceLocation)
  {
    [(CLLocation *)referenceLocation coordinate];
    double v6 = v5;
    v26[0] = @"latitude";
    v7 = objc_msgSend(NSNumber, "numberWithDouble:");
    v26[1] = @"longitude";
    v27[0] = v7;
    v8 = [NSNumber numberWithDouble:v6];
    v27[1] = v8;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
    [v3 setObject:v9 forKeyedSubscript:@"referenceLocation"];
  }
  v10 = [NSNumber numberWithUnsignedInteger:self->_minimumNumberOfReferencePersons];
  [v3 setObject:v10 forKeyedSubscript:@"minimumNumberOfReferencePersons"];

  v11 = [(NSSet *)self->_referencePersonLocalIdentifiers allObjects];
  [v3 setObject:v11 forKeyedSubscript:@"referencePersonLocalIdentifiers"];

  v12 = [NSNumber numberWithBool:self->_focusOnPeople];
  [v3 setObject:v12 forKeyedSubscript:@"focusOnPeople"];

  v13 = [NSNumber numberWithBool:self->_complete];
  [v3 setObject:v13 forKeyedSubscript:@"complete"];

  v14 = [NSNumber numberWithBool:self->_allowContextualTrip];
  [v3 setObject:v14 forKeyedSubscript:@"allowContextualTrip"];

  v15 = [NSNumber numberWithBool:self->_useSummarizer];
  [v3 setObject:v15 forKeyedSubscript:@"useSummarizer"];

  v16 = [NSNumber numberWithBool:self->_useContextualCurationOnly];
  [v3 setObject:v16 forKeyedSubscript:@"useContextualCurationOnly"];

  v17 = [NSNumber numberWithBool:self->_prefilterAssetsWithFaces];
  [v3 setObject:v17 forKeyedSubscript:@"prefilterAssetsWithFaces"];

  v18 = [NSNumber numberWithDouble:self->_prefilterAssetsWithFacesThreshold];
  [v3 setObject:v18 forKeyedSubscript:@"prefilterAssetsWithFacesThreshold"];

  v19 = [NSNumber numberWithBool:self->_promoteAutoplayableItems];
  [v3 setObject:v19 forKeyedSubscript:@"promoteAutoplayableItems"];

  v20 = [NSNumber numberWithBool:self->_isForMemories];
  [v3 setObject:v20 forKeyedSubscript:@"isForMemories"];

  v21 = [NSNumber numberWithBool:self->_allowGuestAsset];
  [v3 setObject:v21 forKeyedSubscript:@"allowGuestAsset"];

  v22 = [NSNumber numberWithBool:self->_wantsGoodSquareCropScore];
  [v3 setObject:v22 forKeyedSubscript:@"wantsGoodSquareCropScore"];

  v23 = [NSNumber numberWithBool:self->_useIconicScore];
  [v3 setObject:v23 forKeyedSubscript:@"useIconicScore"];

  v24 = [NSNumber numberWithBool:self->_avoidPromotingAutoplayableItemsWhenUsingIconicScore];
  [v3 setObject:v24 forKeyedSubscript:@"avoidPromotingAutoplayableItemsWhenUsingIconicScore"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(PGKeyAssetCurationOptions);
  objc_storeStrong((id *)&v4->_referenceLocation, self->_referenceLocation);
  v4->_minimumNumberOfReferencePersons = self->_minimumNumberOfReferencePersons;
  objc_storeStrong((id *)&v4->_referencePersonLocalIdentifiers, self->_referencePersonLocalIdentifiers);
  v4->_focusOnPeople = self->_focusOnPeople;
  v4->_complete = self->_complete;
  v4->_allowContextualTrip = self->_allowContextualTrip;
  v4->_useSummarizer = self->_useSummarizer;
  v4->_useContextualCurationOnly = self->_useContextualCurationOnly;
  v4->_prefilterAssetsWithFaces = self->_prefilterAssetsWithFaces;
  v4->_prefilterAssetsWithFacesThreshold = self->_prefilterAssetsWithFacesThreshold;
  v4->_promoteAutoplayableItems = self->_promoteAutoplayableItems;
  v4->_isForMemories = self->_isForMemories;
  v4->_allowGuestAsset = self->_allowGuestAsset;
  v4->_wantsGoodSquareCropScore = self->_wantsGoodSquareCropScore;
  v4->_useIconicScore = self->_useIconicScore;
  v4->_avoidPromotingAutoplayableItemsWhenUsingIconicScore = self->_avoidPromotingAutoplayableItemsWhenUsingIconicScore;
  objc_storeStrong((id *)&v4->_referenceAsset, self->_referenceAsset);
  objc_storeStrong((id *)&v4->_curationCriteria, self->_curationCriteria);
  return v4;
}

- (PGKeyAssetCurationOptions)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PGKeyAssetCurationOptions;
  double v5 = [(PGKeyAssetCurationOptions *)&v34 init];
  if (v5)
  {
    double v6 = [v4 objectForKeyedSubscript:@"referenceLocation"];
    if (v6)
    {
      id v7 = objc_alloc(MEMORY[0x1E4F1E5F0]);
      v8 = [v6 objectForKeyedSubscript:@"latitude"];
      [v8 doubleValue];
      double v10 = v9;
      v11 = [v6 objectForKeyedSubscript:@"longitude"];
      [v11 doubleValue];
      uint64_t v13 = [v7 initWithLatitude:v10 longitude:v12];
      referenceLocation = v5->_referenceLocation;
      v5->_referenceLocation = (CLLocation *)v13;
    }
    v15 = [v4 objectForKeyedSubscript:@"minimumNumberOfReferencePersons"];
    v5->_minimumNumberOfReferencePersons = [v15 unsignedIntegerValue];

    v16 = [v4 objectForKeyedSubscript:@"referencePersonLocalIdentifiers"];
    if (v16
      || ([v4 objectForKeyedSubscript:@"referencePersonUUIDs"],
          (v16 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v17 = [MEMORY[0x1E4F1CAD0] setWithArray:v16];
      referencePersonLocalIdentifiers = v5->_referencePersonLocalIdentifiers;
      v5->_referencePersonLocalIdentifiers = (NSSet *)v17;
    }
    v19 = [v4 objectForKeyedSubscript:@"focusOnPeople"];
    v5->_focusOnPeople = [v19 BOOLValue];

    v20 = [v4 objectForKeyedSubscript:@"complete"];
    v5->_complete = [v20 BOOLValue];

    v21 = [v4 objectForKeyedSubscript:@"allowContextualTrip"];
    v5->_allowContextualTrip = [v21 BOOLValue];

    v22 = [v4 objectForKeyedSubscript:@"useSummarizer"];
    v5->_useSummarizer = [v22 BOOLValue];

    v23 = [v4 objectForKeyedSubscript:@"useContextualCurationOnly"];
    v5->_useContextualCurationOnly = [v23 BOOLValue];

    v24 = [v4 objectForKeyedSubscript:@"prefilterAssetsWithFaces"];
    v5->_prefilterAssetsWithFaces = [v24 BOOLValue];

    v25 = [v4 objectForKeyedSubscript:@"prefilterAssetsWithFacesThreshold"];
    [v25 doubleValue];
    v5->_prefilterAssetsWithFacesThreshold = v26;

    v27 = [v4 objectForKeyedSubscript:@"promoteAutoplayableItems"];
    v5->_promoteAutoplayableItems = [v27 BOOLValue];

    v28 = [v4 objectForKeyedSubscript:@"isForMemories"];
    v5->_isForMemories = [v28 BOOLValue];

    v29 = [v4 objectForKeyedSubscript:@"allowGuestAsset"];
    v5->_allowGuestAsset = [v29 BOOLValue];

    v30 = [v4 objectForKeyedSubscript:@"wantsGoodSquareCropScore"];
    v5->_wantsGoodSquareCropScore = [v30 BOOLValue];

    v31 = [v4 objectForKeyedSubscript:@"useIconicScore"];
    v5->_useIconicScore = [v31 BOOLValue];

    v32 = [v4 objectForKeyedSubscript:@"avoidPromotingAutoplayableItemsWhenUsingIconicScore"];
    v5->_avoidPromotingAutoplayableItemsWhenUsingIconicScore = [v32 BOOLValue];
  }
  return v5;
}

- (PGKeyAssetCurationOptions)initWithReferenceAsset:(id)a3
{
  id v5 = a3;
  double v6 = [(PGKeyAssetCurationOptions *)self init];
  if (v6)
  {
    id v7 = (void *)MEMORY[0x1E4F1CAD0];
    v8 = [v5 clsUnprefetchedPersonLocalIdentifiers];
    double v9 = [v7 setWithArray:v8];

    double v10 = [v5 clsLocation];
    referencePersonLocalIdentifiers = v6->_referencePersonLocalIdentifiers;
    v6->_referencePersonLocalIdentifiers = v9;
    double v12 = v9;

    referenceLocation = v6->_referenceLocation;
    v6->_referenceLocation = v10;
    v14 = v10;

    objc_storeStrong((id *)&v6->_referenceAsset, a3);
  }

  return v6;
}

- (PGKeyAssetCurationOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)PGKeyAssetCurationOptions;
  result = [(PGKeyAssetCurationOptions *)&v3 init];
  if (result)
  {
    *(_WORD *)&result->_allowContextualTrip = 257;
    result->_prefilterAssetsWithFaces = 1;
    result->_prefilterAssetsWithFacesThreshold = 0.2;
    result->_minimumNumberOfReferencePersons = 0;
  }
  return result;
}

@end