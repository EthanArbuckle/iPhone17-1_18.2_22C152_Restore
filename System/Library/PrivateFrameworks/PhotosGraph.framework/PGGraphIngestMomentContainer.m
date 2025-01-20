@interface PGGraphIngestMomentContainer
- (BOOL)containsBetterScoringAsset;
- (BOOL)containsNonJunkAssets;
- (BOOL)happensAtSensitiveLocation;
- (BOOL)hasAssetsWithInterestingScenes;
- (BOOL)hasHigherThanImprovedAssets;
- (BOOL)isInteresting;
- (BOOL)isInterestingWithAlternateJunking;
- (BOOL)isSmartInteresting;
- (BOOL)location:(id)a3 isSensitiveDuringDateInterval:(id)a4;
- (CLSClueCollection)clueCollection;
- (CLSCurationContext)curationContext;
- (CLSInvestigationPhotoKitFeeder)feeder;
- (NSDate)localEndDate;
- (NSDate)localStartDate;
- (NSDate)universalEndDate;
- (NSDate)universalStartDate;
- (NSNumber)contentScoreNumber;
- (NSNumber)isInterestingNumber;
- (NSNumber)isInterestingWithAlternateJunkingNumber;
- (NSNumber)isSmartInterestingNumber;
- (NSString)encodedCLIPFeatureVector;
- (NSString)uuid;
- (double)behavioralScore;
- (double)contentScore;
- (double)facesProcessedRatio;
- (double)inhabitationScore;
- (double)scenesProcessedRatio;
- (id)assetsInExtendedCuration;
- (id)initMomentContainerWithFeeder:(id)a3 clueCollection:(id)a4 curationManager:(id)a5 topTierAestheticScore:(double)a6 curationContext:(id)a7;
- (unint64_t)numberOfAssetsInExtendedCuration;
- (unint64_t)numberOfItems;
- (unint64_t)numberOfItemsWithPersons;
- (unint64_t)numberOfRegularGemItems;
- (unint64_t)numberOfShinyGemItems;
- (unint64_t)totalNumberOfPersons;
- (unsigned)sharingComposition;
- (void)_computeScoresIfNeeded;
- (void)setClueCollection:(id)a3;
- (void)setContentScoreNumber:(id)a3;
- (void)setCurationContext:(id)a3;
- (void)setIsInterestingNumber:(id)a3;
- (void)setIsInterestingWithAlternateJunkingNumber:(id)a3;
- (void)setIsSmartInterestingNumber:(id)a3;
@end

@implementation PGGraphIngestMomentContainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curationContext, 0);
  objc_storeStrong((id *)&self->_contentScoreNumber, 0);
  objc_storeStrong((id *)&self->_isSmartInterestingNumber, 0);
  objc_storeStrong((id *)&self->_isInterestingWithAlternateJunkingNumber, 0);
  objc_storeStrong((id *)&self->_isInterestingNumber, 0);
  objc_storeStrong((id *)&self->_feeder, 0);
  objc_storeStrong((id *)&self->_clueCollection, 0);
  objc_storeStrong((id *)&self->_assetsInExtendedCuration, 0);
  objc_storeStrong((id *)&self->_scenesProcessedRatioAsNumber, 0);
  objc_storeStrong((id *)&self->_curationManager, 0);
}

- (void)setCurationContext:(id)a3
{
}

- (CLSCurationContext)curationContext
{
  return self->_curationContext;
}

- (void)setContentScoreNumber:(id)a3
{
}

- (NSNumber)contentScoreNumber
{
  return self->_contentScoreNumber;
}

- (void)setIsSmartInterestingNumber:(id)a3
{
}

- (NSNumber)isSmartInterestingNumber
{
  return self->_isSmartInterestingNumber;
}

- (void)setIsInterestingWithAlternateJunkingNumber:(id)a3
{
}

- (NSNumber)isInterestingWithAlternateJunkingNumber
{
  return self->_isInterestingWithAlternateJunkingNumber;
}

- (void)setIsInterestingNumber:(id)a3
{
}

- (NSNumber)isInterestingNumber
{
  return self->_isInterestingNumber;
}

- (CLSInvestigationPhotoKitFeeder)feeder
{
  return self->_feeder;
}

- (void)setClueCollection:(id)a3
{
}

- (CLSClueCollection)clueCollection
{
  return self->_clueCollection;
}

- (NSString)encodedCLIPFeatureVector
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (+[PGUserDefaults enableMomentCLIPFeatureGraphIngest])
  {
    v3 = [[PGMomentIngestCLIPFeatureVectorExtractor alloc] initWithIngestMomentContainer:self];
    id v10 = 0;
    v4 = [(PGMomentIngestCLIPFeatureVectorExtractor *)v3 extractCLIPFeatureVectorWithError:&v10];
    id v5 = v10;
    if (v4)
    {
      v6 = +[PGMomentIngestCLIPFeatureVectorExtractor encodeCLIPFeatureVector:v4];
    }
    else
    {
      v7 = [(PGCurationManager *)self->_curationManager curationLoggingConnection];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v9 = [(PGGraphIngestMomentContainer *)self uuid];
        *(_DWORD *)buf = 138412546;
        v12 = v9;
        __int16 v13 = 2112;
        id v14 = v5;
        _os_log_error_impl(&dword_1D1805000, v7, OS_LOG_TYPE_ERROR, "Failed to extract moment CLIP feature vector for moment with uuid: %@, error: %@", buf, 0x16u);
      }
      v6 = &stru_1F283BC78;
    }
  }
  else
  {
    v6 = &stru_1F283BC78;
  }
  return (NSString *)v6;
}

- (BOOL)location:(id)a3 isSensitiveDuringDateInterval:(id)a4
{
  return +[PGSensitiveLocationBlocklistConfiguration isSensitiveLocation:a3 duringDateInterval:a4];
}

- (BOOL)happensAtSensitiveLocation
{
  id v3 = objc_alloc(MEMORY[0x1E4F28C18]);
  v4 = [(PGGraphIngestMomentContainer *)self localStartDate];
  id v5 = [(PGGraphIngestMomentContainer *)self localEndDate];
  v6 = (void *)[v3 initWithStartDate:v4 endDate:v5];

  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  clueCollection = self->_clueCollection;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__PGGraphIngestMomentContainer_happensAtSensitiveLocation__block_invoke;
  v10[3] = &unk_1E68E5A38;
  v10[4] = self;
  id v8 = v6;
  id v11 = v8;
  v12 = &v13;
  [(CLSClueCollection *)clueCollection enumerateLocationClues:v10];
  LOBYTE(v6) = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)v6;
}

void __58__PGGraphIngestMomentContainer_happensAtSensitiveLocation__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v6 = [a2 location];
  if (v6)
  {
    id v8 = v6;
    int v7 = [*(id *)(a1 + 32) location:v6 isSensitiveDuringDateInterval:*(void *)(a1 + 40)];
    v6 = v8;
    if (v7)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
}

- (unsigned)sharingComposition
{
  id v3 = [(CLSInvestigationPhotoKitFeeder *)self->_feeder assetCollection];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    return 0;
  }
  id v5 = [(CLSInvestigationPhotoKitFeeder *)self->_feeder assetCollection];
  unsigned __int16 v6 = [v5 sharingComposition];

  return v6;
}

- (double)facesProcessedRatio
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(CLSInvestigationPhotoKitFeeder *)self->_feeder allItems];
  unint64_t v4 = [v3 count];

  if (!v4) {
    return 1.0;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(CLSInvestigationPhotoKitFeeder *)self->_feeder allItems];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        v8 += [*(id *)(*((void *)&v13 + 1) + 8 * i) clsIsFaceProcessed];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
    double v11 = (double)v8;
  }
  else
  {
    double v11 = 0.0;
  }

  return v11 / (double)v4;
}

- (double)scenesProcessedRatio
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  scenesProcessedRatioAsNumber = self->_scenesProcessedRatioAsNumber;
  if (!scenesProcessedRatioAsNumber)
  {
    unint64_t v4 = [(CLSInvestigationPhotoKitFeeder *)self->_feeder allItems];
    unint64_t v5 = [v4 count];

    if (!v5) {
      return 1.0;
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v6 = [(CLSInvestigationPhotoKitFeeder *)self->_feeder allItems];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      unint64_t v9 = 0;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v6);
          }
          v9 += [*(id *)(*((void *)&v16 + 1) + 8 * i) clsIsSceneProcessed];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
      double v12 = (double)v9;
    }
    else
    {
      double v12 = 0.0;
    }

    long long v14 = [NSNumber numberWithDouble:v12 / (double)v5];
    long long v15 = self->_scenesProcessedRatioAsNumber;
    self->_scenesProcessedRatioAsNumber = v14;

    scenesProcessedRatioAsNumber = self->_scenesProcessedRatioAsNumber;
  }
  [(NSNumber *)scenesProcessedRatioAsNumber doubleValue];
  return result;
}

- (double)behavioralScore
{
  [(CLSInvestigationPhotoKitFeeder *)self->_feeder behavioralScore];
  return result;
}

- (unint64_t)numberOfRegularGemItems
{
  return [(CLSInvestigationPhotoKitFeeder *)self->_feeder numberOfRegularGemItems];
}

- (unint64_t)numberOfShinyGemItems
{
  return [(CLSInvestigationPhotoKitFeeder *)self->_feeder numberOfShinyGemItems];
}

- (NSString)uuid
{
  v2 = [(CLSInvestigationPhotoKitFeeder *)self->_feeder assetCollection];
  id v3 = [v2 uuid];

  return (NSString *)v3;
}

- (BOOL)containsNonJunkAssets
{
  return [(CLSInvestigationPhotoKitFeeder *)self->_feeder hasNonJunkAssets];
}

- (BOOL)containsBetterScoringAsset
{
  return [(CLSInvestigationPhotoKitFeeder *)self->_feeder hasBestScoringAssets];
}

- (BOOL)hasAssetsWithInterestingScenes
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(CLSInvestigationPhotoKitFeeder *)self->_feeder allItems];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 clsIsUtility] & 1) == 0 && (objc_msgSend(v6, "clsHasInterestingScenes"))
        {
          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v3;
}

- (BOOL)hasHigherThanImprovedAssets
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(CLSInvestigationPhotoKitFeeder *)self->_feeder allItems];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    double v5 = *MEMORY[0x1E4F8E748];
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        [v7 clsContentScore];
        if (v8 > v5 && ![v7 clsIsUtility])
        {
          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v3;
}

- (double)inhabitationScore
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CLSInvestigationPhotoKitFeeder *)self->_feeder numberOfItems];
  if (!v3) {
    return 0.0;
  }
  unint64_t v4 = v3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v5 = [(CLSInvestigationPhotoKitFeeder *)self->_feeder allItems];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        v8 += [*(id *)(*((void *)&v13 + 1) + 8 * i) clsIsInhabited];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
    double v11 = (double)v8;
  }
  else
  {
    double v11 = 0.0;
  }

  return v11 / (double)v4;
}

- (unint64_t)totalNumberOfPersons
{
  feeder = self->_feeder;
  if (feeder) {
    return [(CLSInvestigationPhotoKitFeeder *)feeder numberOfAllPeople];
  }
  else {
    return [(CLSClueCollection *)self->_clueCollection numberOfPersons];
  }
}

- (unint64_t)numberOfItemsWithPersons
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(CLSInvestigationPhotoKitFeeder *)self->_feeder allItems];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v9 + 1) + 8 * i) clsPeopleCount]) {
          ++v5;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (unint64_t)numberOfAssetsInExtendedCuration
{
  v2 = [(PGGraphIngestMomentContainer *)self assetsInExtendedCuration];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)assetsInExtendedCuration
{
  v12[1] = *MEMORY[0x1E4F143B8];
  assetsInExtendedCuration = self->_assetsInExtendedCuration;
  if (!assetsInExtendedCuration)
  {
    uint64_t v4 = [(CLSInvestigationPhotoKitFeeder *)self->_feeder assetCollection];
    unint64_t v5 = [v4 photoLibrary];
    uint64_t v6 = [v5 librarySpecificFetchOptions];

    uint64_t v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"highlightBeingExtendedAssets != nil"];
    [v6 setInternalPredicate:v7];

    v12[0] = *MEMORY[0x1E4F394A8];
    unint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    [v6 setFetchPropertySets:v8];

    [v6 setShouldPrefetchCount:1];
    [v6 setIncludeGuestAssets:1];
    long long v9 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v4 options:v6];
    long long v10 = self->_assetsInExtendedCuration;
    self->_assetsInExtendedCuration = v9;

    assetsInExtendedCuration = self->_assetsInExtendedCuration;
  }
  return assetsInExtendedCuration;
}

- (unint64_t)numberOfItems
{
  return [(CLSInvestigationPhotoKitFeeder *)self->_feeder numberOfItems];
}

- (NSDate)universalEndDate
{
  unint64_t v3 = [(CLSInvestigationPhotoKitFeeder *)self->_feeder universalEndDate];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(CLSClueCollection *)self->_clueCollection universalEndDate];
  }
  uint64_t v6 = v5;

  return (NSDate *)v6;
}

- (NSDate)universalStartDate
{
  unint64_t v3 = [(CLSInvestigationPhotoKitFeeder *)self->_feeder universalStartDate];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(CLSClueCollection *)self->_clueCollection universalStartDate];
  }
  uint64_t v6 = v5;

  return (NSDate *)v6;
}

- (NSDate)localEndDate
{
  unint64_t v3 = [(CLSInvestigationPhotoKitFeeder *)self->_feeder localEndDate];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(CLSClueCollection *)self->_clueCollection localEndDate];
  }
  uint64_t v6 = v5;

  return (NSDate *)v6;
}

- (NSDate)localStartDate
{
  unint64_t v3 = [(CLSInvestigationPhotoKitFeeder *)self->_feeder localStartDate];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(CLSClueCollection *)self->_clueCollection localStartDate];
  }
  uint64_t v6 = v5;

  return (NSDate *)v6;
}

- (void)_computeScoresIfNeeded
{
  isInterestingNumber = self->_isInterestingNumber;
  if (!isInterestingNumber
    || !self->_isInterestingWithAlternateJunkingNumber
    || !self->_isSmartInterestingNumber
    || !self->_contentScoreNumber)
  {
    feeder = self->_feeder;
    if (feeder)
    {
      BOOL v5 = [(PGCurationManager *)self->_curationManager isAssetFeederInteresting:feeder withAlternateJunking:0 smart:0];
      uint64_t v6 = [NSNumber numberWithBool:v5];
      uint64_t v7 = self->_isInterestingNumber;
      self->_isInterestingNumber = v6;

      objc_msgSend(NSNumber, "numberWithBool:", -[PGCurationManager isAssetFeederInteresting:withAlternateJunking:smart:](self->_curationManager, "isAssetFeederInteresting:withAlternateJunking:smart:", self->_feeder, 0, 1));
      unint64_t v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      isSmartInterestingNumber = self->_isSmartInterestingNumber;
      self->_isSmartInterestingNumber = v8;

      long long v10 = NSNumber;
      [(PGCurationManager *)self->_curationManager contentScoreForAssetFeeder:self->_feeder];
      objc_msgSend(v10, "numberWithDouble:");
      long long v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      contentScoreNumber = self->_contentScoreNumber;
      self->_contentScoreNumber = v11;

      objc_storeStrong((id *)&self->_isInterestingWithAlternateJunkingNumber, self->_isInterestingNumber);
      if (v5)
      {
        char v21 = 0;
        long long v13 = +[PGMemoryGenerationHelper feederForMemoriesWithFeeder:self->_feeder topTierAestheticScore:&v21 didFeederChange:self->_curationContext curationContext:self->_topTierAestheticScore];
        if (v21)
        {
          BOOL v14 = [(PGCurationManager *)self->_curationManager isAssetFeederInteresting:v13 withAlternateJunking:1 smart:0];
          long long v15 = [NSNumber numberWithBool:v14];
          isInterestingWithAlternateJunkingNumber = self->_isInterestingWithAlternateJunkingNumber;
          self->_isInterestingWithAlternateJunkingNumber = v15;
        }
      }
    }
    else
    {
      long long v17 = (NSNumber *)MEMORY[0x1E4F1CC38];
      self->_isInterestingNumber = (NSNumber *)MEMORY[0x1E4F1CC38];

      uint64_t v18 = self->_isInterestingWithAlternateJunkingNumber;
      self->_isInterestingWithAlternateJunkingNumber = v17;

      long long v19 = self->_isSmartInterestingNumber;
      self->_isSmartInterestingNumber = v17;

      v20 = self->_contentScoreNumber;
      self->_contentScoreNumber = (NSNumber *)&unk_1F28D5618;
    }
  }
}

- (double)contentScore
{
  [(PGGraphIngestMomentContainer *)self _computeScoresIfNeeded];
  contentScoreNumber = self->_contentScoreNumber;
  [(NSNumber *)contentScoreNumber doubleValue];
  return result;
}

- (BOOL)isSmartInteresting
{
  [(PGGraphIngestMomentContainer *)self _computeScoresIfNeeded];
  isSmartInterestingNumber = self->_isSmartInterestingNumber;
  return [(NSNumber *)isSmartInterestingNumber BOOLValue];
}

- (BOOL)isInterestingWithAlternateJunking
{
  [(PGGraphIngestMomentContainer *)self _computeScoresIfNeeded];
  isInterestingWithAlternateJunkingNumber = self->_isInterestingWithAlternateJunkingNumber;
  return [(NSNumber *)isInterestingWithAlternateJunkingNumber BOOLValue];
}

- (BOOL)isInteresting
{
  [(PGGraphIngestMomentContainer *)self _computeScoresIfNeeded];
  isInterestingNumber = self->_isInterestingNumber;
  return [(NSNumber *)isInterestingNumber BOOLValue];
}

- (id)initMomentContainerWithFeeder:(id)a3 clueCollection:(id)a4 curationManager:(id)a5 topTierAestheticScore:(double)a6 curationContext:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)PGGraphIngestMomentContainer;
  long long v17 = [(PGGraphIngestMomentContainer *)&v20 init];
  uint64_t v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_feeder, a3);
    objc_storeStrong((id *)&v18->_clueCollection, a4);
    objc_storeStrong((id *)&v18->_curationManager, a5);
    v18->_topTierAestheticScore = a6;
    objc_storeStrong((id *)&v18->_curationContext, a7);
  }

  return v18;
}

@end