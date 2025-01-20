@interface PGMemoryPhotosGraphProperties
+ (id)_storyRecipeSongCatalogForAppleMusicSubscriber:(BOOL)a3;
- (BOOL)isTriggered;
- (PGMemoryPhotosGraphProperties)initWithEnrichedMemory:(id)a3 neighborScoreComputer:(id)a4 isAppleMusicSubscriber:(BOOL)a5 photoLibrary:(id)a6 loggingConnection:(id)a7;
- (id)_recipeFromEnrichedMemory:(id)a3 subscriberCatalog:(id)a4 applyColorGrading:(BOOL)a5 loggingConnection:(id)a6;
- (id)dictionary;
- (id)encodedBlockableFeatures;
- (id)encodedFeatures;
- (id)featureVectorV1;
- (id)featureVectorV2;
- (id)infoDictionary;
- (id)infoForBackingMoments;
- (id)infoForChapterTitles;
- (id)infoForGraphCollection;
- (id)musicGenreDistribution;
- (id)personLocalIdentifiers;
- (id)storyTitleCategory;
- (id)triggerTypesArray;
- (int64_t)phTitleCategory;
- (int64_t)sourceType;
- (unint64_t)numberOfMoments;
@end

@implementation PGMemoryPhotosGraphProperties

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_neighborScoreComputer, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_enrichedMemory, 0);
}

- (id)storyTitleCategory
{
  uint64_t v2 = [MEMORY[0x1E4F8E870] generateNextStoryTitleStyleIndex];
  return (id)MEMORY[0x1F41408A8](v2);
}

- (id)infoForChapterTitles
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [(PGEnrichedMemoryProtocol *)self->_enrichedMemory chapterTitles];

  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v5 = [(PGEnrichedMemoryProtocol *)self->_enrichedMemory chapterTitles];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = (id)MEMORY[0x1E4F1CBF0];
  }
  return v4;
}

- (id)infoForGraphCollection
{
  v16[1] = *MEMORY[0x1E4F143B8];
  if ([(PGEnrichedMemoryProtocol *)self->_enrichedMemory memoryCategory] == 16)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v4 = [(PGEnrichedMemoryProtocol *)self->_enrichedMemory memoryMomentNodes];
    v5 = [v4 anyNode];

    uint64_t v6 = NSNumber;
    [v5 contentScore];
    uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
    [v3 setObject:v7 forKeyedSubscript:@"averageContentScore"];

    uint64_t v8 = NSNumber;
    [v5 meaningScore];
    v9 = objc_msgSend(v8, "numberWithDouble:");
    [v3 setObject:v9 forKeyedSubscript:@"meaningScore"];

    v10 = [(PGEnrichedMemoryProtocol *)self->_enrichedMemory memoryFeatureNodes];
    v11 = +[PGGraphNodeCollection subsetInCollection:v10];
    long long v12 = [v11 meaningLabels];
    long long v13 = [v12 allObjects];
    [v3 setObject:v13 forKeyedSubscript:@"meaningLabels"];

    v16[0] = v3;
    long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  }
  else
  {
    long long v14 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v14;
}

- (id)infoForBackingMoments
{
  v18[1] = *MEMORY[0x1E4F143B8];
  if ([(PGMemoryPhotosGraphProperties *)self sourceType] == 1)
  {
    id v3 = [(PGEnrichedMemoryProtocol *)self->_enrichedMemory memoryMomentNodes];
    id v4 = [v3 anyNode];

    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v6 = NSNumber;
    [v4 graphScore];
    uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
    [v5 setObject:v7 forKeyedSubscript:@"graphScore"];

    uint64_t v8 = NSNumber;
    [(PGNeighborScoreComputer *)self->_neighborScoreComputer neighborScoreWithMomentNode:v4];
    v9 = objc_msgSend(v8, "numberWithDouble:");
    [v5 setObject:v9 forKeyedSubscript:@"neighborScore"];

    v10 = NSNumber;
    [v4 contentScore];
    v11 = objc_msgSend(v10, "numberWithDouble:");
    [v5 setObject:v11 forKeyedSubscript:@"curationScore"];

    long long v12 = [v4 keywordsForRelatedType:63 focusOnNodes:0];
    uint64_t v13 = +[PGManager exportableDictionaryFromKeywords:v12];
    long long v14 = (void *)v13;
    if (v13) {
      uint64_t v15 = v13;
    }
    else {
      uint64_t v15 = MEMORY[0x1E4F1CC08];
    }
    [v5 setObject:v15 forKeyedSubscript:@"keywords"];

    v18[0] = v5;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  }
  else
  {
    v16 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v16;
}

- (id)encodedFeatures
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(PGEnrichedMemoryProtocol *)self->_enrichedMemory memoryFeatureNodes];
  id v5 = [v4 allFeatures];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) encodedFeature];
        [v3 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v3;
}

- (id)encodedBlockableFeatures
{
  id v3 = (void *)MEMORY[0x1E4F39178];
  id v4 = [(PGEnrichedMemoryProtocol *)self->_enrichedMemory blockableFeatures];
  id v5 = [v3 encodedBlockableFeatures:v4 photoLibrary:self->_photoLibrary];

  return v5;
}

- (BOOL)isTriggered
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  uint64_t v2 = [(PGEnrichedMemoryProtocol *)self->_enrichedMemory triggerTypes];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__PGMemoryPhotosGraphProperties_isTriggered__block_invoke;
  v4[3] = &unk_1E68E85E8;
  v4[4] = &v5;
  [v2 enumerateIndexesUsingBlock:v4];

  LOBYTE(v2) = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

uint64_t __44__PGMemoryPhotosGraphProperties_isTriggered__block_invoke(uint64_t result, uint64_t a2, unsigned char *a3)
{
  if (a2) {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  }
  *a3 = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24);
  return result;
}

- (id)musicGenreDistribution
{
  uint64_t v2 = [(PGEnrichedMemoryProtocol *)self->_enrichedMemory memoryMomentNodes];
  id v3 = [v2 graph];

  id v4 = [v3 musicGenreDistributionUsingTaggedGenres:1];

  return v4;
}

- (unint64_t)numberOfMoments
{
  uint64_t v2 = [(PGEnrichedMemoryProtocol *)self->_enrichedMemory memoryMomentNodes];
  unint64_t v3 = [v2 count];

  return v3;
}

- (int64_t)phTitleCategory
{
  uint64_t v2 = [(PGEnrichedMemoryProtocol *)self->_enrichedMemory titleCategory];
  if ((unint64_t)(v2 - 1) > 5) {
    return 0;
  }
  else {
    return qword_1D1F4F620[v2 - 1];
  }
}

- (id)featureVectorV2
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(PGMemoryPhotosGraphProperties *)self personLocalIdentifiers];
  if ([v3 count])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v16 = v3;
    id obj = v3;
    uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v19 != v7) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v10 = objc_msgSend(MEMORY[0x1E4F39178], "personUniversalIdentifierForPersonLocalIdentifier:photoLibrary:", v9, self->_photoLibrary, v16);
          v11 = (void *)v10;
          if (v10) {
            long long v12 = (void *)v10;
          }
          else {
            long long v12 = v9;
          }
          id v13 = v12;

          v22[0] = @"People";
          v22[1] = v13;
          long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];

          [v4 addObject:v14];
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v6);
    }

    unint64_t v3 = v16;
  }
  else
  {
    id v4 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

- (id)featureVectorV1
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(PGMemoryPhotosGraphProperties *)self personLocalIdentifiers];
  if ([v2 count])
  {
    uint64_t v7 = @"people";
    unint64_t v3 = [v2 allObjects];
    id v4 = [v3 sortedArrayUsingSelector:sel_compare_];
    v8[0] = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v5;
}

- (id)personLocalIdentifiers
{
  uint64_t v2 = [(PGEnrichedMemoryProtocol *)self->_enrichedMemory memoryFeatureNodes];
  unint64_t v3 = +[PGGraphNodeCollection subsetInCollection:v2];

  id v4 = [v3 localIdentifiers];

  return v4;
}

- (int64_t)sourceType
{
  uint64_t v2 = [(PGEnrichedMemoryProtocol *)self->_enrichedMemory memoryCategory];
  return PGMemorySourceTypeFromCategory(v2);
}

- (id)triggerTypesArray
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(PGEnrichedMemoryProtocol *)self->_enrichedMemory triggerTypes];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__PGMemoryPhotosGraphProperties_triggerTypesArray__block_invoke;
  v7[3] = &unk_1E68F0470;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateIndexesUsingBlock:v7];

  return v5;
}

void __50__PGMemoryPhotosGraphProperties_triggerTypesArray__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithUnsignedInteger:a2];
  [v2 addObject:v3];
}

- (id)infoDictionary
{
  v47[21] = *MEMORY[0x1E4F143B8];
  v46[0] = @"sourceType";
  unint64_t v3 = [(PGMemoryPhotosGraphProperties *)self sourceType];
  if (v3 > 4) {
    id v4 = @"Unsupported Source Type";
  }
  else {
    id v4 = off_1E68ED170[v3];
  }
  v45 = v4;
  v47[0] = v45;
  v46[1] = @"sourceTypeEnum";
  v44 = objc_msgSend(NSNumber, "numberWithInteger:", -[PGMemoryPhotosGraphProperties sourceType](self, "sourceType"));
  v47[1] = v44;
  v46[2] = @"creationDate";
  v43 = [(PGEnrichedMemoryProtocol *)self->_enrichedMemory creationDate];
  v47[2] = v43;
  v46[3] = @"assetCount";
  v42 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PGEnrichedMemoryProtocol numberOfRelevantAssets](self->_enrichedMemory, "numberOfRelevantAssets"));
  v47[3] = v42;
  v46[4] = @"repCount";
  id v5 = NSNumber;
  v41 = [(PGEnrichedMemoryProtocol *)self->_enrichedMemory representativeAssetUUIDs];
  v40 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v41, "count"));
  v47[4] = v40;
  v46[5] = @"relevantAssetCount";
  v39 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PGEnrichedMemoryProtocol numberOfRelevantAssets](self->_enrichedMemory, "numberOfRelevantAssets"));
  v47[5] = v39;
  v46[6] = @"curatedCount";
  uint64_t v6 = NSNumber;
  v38 = [(PGEnrichedMemoryProtocol *)self->_enrichedMemory curatedAssetUUIDs];
  v37 = objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v38, "count"));
  v47[6] = v37;
  v46[7] = @"extendedCuratedCount";
  uint64_t v7 = NSNumber;
  v36 = [(PGEnrichedMemoryProtocol *)self->_enrichedMemory extendedCuratedAssetUUIDs];
  v35 = objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v36, "count"));
  v47[7] = v35;
  v46[8] = @"keyAssetUUID";
  v34 = [(PGEnrichedMemoryProtocol *)self->_enrichedMemory keyAssetUUID];
  v47[8] = v34;
  v46[9] = @"notificationQuality";
  uint64_t v8 = [(PGEnrichedMemoryProtocol *)self->_enrichedMemory notificationLevel];
  if ((unint64_t)(v8 - 1) > 3) {
    v9 = @"PGMemoryNotificationLevelUndefined";
  }
  else {
    v9 = off_1E68ED150[v8 - 1];
  }
  v33 = v9;
  v47[9] = v33;
  v46[10] = @"isTriggered";
  BOOL v10 = [(PGMemoryPhotosGraphProperties *)self isTriggered];
  v11 = @"NO";
  if (v10) {
    v11 = @"YES";
  }
  v47[10] = v11;
  v46[11] = @"numberOfMoments";
  v32 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PGMemoryPhotosGraphProperties numberOfMoments](self, "numberOfMoments"));
  v47[11] = v32;
  v46[12] = @"numberOfCollections";
  v31 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PGMemoryPhotosGraphProperties numberOfMoments](self, "numberOfMoments"));
  v47[12] = v31;
  v46[13] = @"suggestedMood";
  [(PGEnrichedMemoryProtocol *)self->_enrichedMemory suggestedMood];
  v30 = PHStringForMemoryMood();
  v47[13] = v30;
  v46[14] = @"forbiddenMoods";
  [(PGEnrichedMemoryProtocol *)self->_enrichedMemory forbiddenMoods];
  v29 = PHStringForMemoryMood();
  v47[14] = v29;
  v46[15] = @"recommendedMoods";
  [(PGEnrichedMemoryProtocol *)self->_enrichedMemory recommendedMoods];
  v28 = PHStringForMemoryMood();
  v47[15] = v28;
  v46[16] = @"moodWeights";
  long long v12 = [(PGEnrichedMemoryProtocol *)self->_enrichedMemory positiveMoodVector];
  uint64_t v13 = [v12 description];
  long long v14 = (void *)v13;
  long long v15 = &stru_1F283BC78;
  if (v13) {
    long long v15 = (__CFString *)v13;
  }
  v47[16] = v15;
  v46[17] = @"moodKeywords";
  uint64_t v16 = [(PGEnrichedMemoryProtocol *)self->_enrichedMemory legacyMoodKeywords];
  uint64_t v17 = (void *)v16;
  uint64_t v18 = MEMORY[0x1E4F1CBF0];
  if (v16) {
    uint64_t v18 = v16;
  }
  v47[17] = v18;
  v46[18] = @"osInfo";
  long long v19 = [MEMORY[0x1E4F28F80] processInfo];
  long long v20 = [v19 operatingSystemVersionString];
  v47[18] = v20;
  v46[19] = @"meaningLabels";
  long long v21 = [(PGEnrichedMemoryProtocol *)self->_enrichedMemory memoryMomentNodes];
  v22 = [v21 meaningNodes];
  v23 = [v22 meaningLabels];
  uint64_t v24 = [v23 allObjects];
  v47[19] = v24;
  v46[20] = @"musicGenreDistribution";
  v25 = [(PGMemoryPhotosGraphProperties *)self musicGenreDistribution];
  v47[20] = v25;
  id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:21];

  return v27;
}

- (id)dictionary
{
  v43[15] = *MEMORY[0x1E4F143B8];
  v42[0] = @"graphMemoryIdentifier";
  uint64_t v3 = [(PGEnrichedMemoryProtocol *)self->_enrichedMemory uniqueMemoryIdentifier];
  v40 = (void *)v3;
  id v4 = &stru_1F283BC78;
  if (v3) {
    id v4 = (__CFString *)v3;
  }
  v43[0] = v4;
  v42[1] = @"memoryCategorySubcategory";
  v39 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PGEnrichedMemoryProtocol memoryCategorySubcategory](self->_enrichedMemory, "memoryCategorySubcategory"));
  v43[1] = v39;
  v42[2] = @"triggerTypes";
  v38 = [(PGMemoryPhotosGraphProperties *)self triggerTypesArray];
  v43[2] = v38;
  v42[3] = @"encodedFeatures";
  v37 = [(PGMemoryPhotosGraphProperties *)self encodedFeatures];
  v43[3] = v37;
  v42[4] = @"featureVector_v2";
  v36 = [(PGMemoryPhotosGraphProperties *)self featureVectorV2];
  v43[4] = v36;
  v42[5] = @"featureVector";
  v35 = [(PGMemoryPhotosGraphProperties *)self featureVectorV1];
  v43[5] = v35;
  v42[6] = @"titleCategory";
  v34 = objc_msgSend(NSNumber, "numberWithInteger:", -[PGMemoryPhotosGraphProperties phTitleCategory](self, "phTitleCategory"));
  v43[6] = v34;
  v42[7] = @"notificationQuality";
  id v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[PGEnrichedMemoryProtocol notificationLevel](self->_enrichedMemory, "notificationLevel"));
  v43[7] = v5;
  v42[8] = @"blacklistableFeatures";
  uint64_t v6 = [(PGMemoryPhotosGraphProperties *)self encodedBlockableFeatures];
  v43[8] = v6;
  v42[9] = @"backingMoments";
  uint64_t v7 = [(PGMemoryPhotosGraphProperties *)self infoForBackingMoments];
  v43[9] = v7;
  v42[10] = @"collectionsInfo";
  uint64_t v8 = [(PGMemoryPhotosGraphProperties *)self infoForGraphCollection];
  v43[10] = v8;
  v42[11] = @"info";
  v9 = [(PGMemoryPhotosGraphProperties *)self infoDictionary];
  v43[11] = v9;
  v42[12] = @"chapterTitles";
  BOOL v10 = [(PGMemoryPhotosGraphProperties *)self infoForChapterTitles];
  v43[12] = v10;
  v42[13] = @"generatedWithFallbackRequirements";
  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[PGEnrichedMemoryProtocol generatedWithFallbackRequirements](self->_enrichedMemory, "generatedWithFallbackRequirements"));
  v43[13] = v11;
  v42[14] = @"storyTitleCategory";
  long long v12 = [(PGMemoryPhotosGraphProperties *)self storyTitleCategory];
  v43[14] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:15];
  v41 = (void *)[v13 mutableCopy];

  if ([(PGEnrichedMemoryProtocol *)self->_enrichedMemory memoryCategory] == 27)
  {
    long long v14 = [(PGEnrichedMemoryProtocol *)self->_enrichedMemory memoryFeatureNodes];
    long long v15 = +[PGGraphNodeCollection subsetInCollection:v14];

    uint64_t v16 = [v15 labels];
    int v17 = [v16 containsObject:@"SunriseSunset"];
    int v18 = [v16 containsObject:@"Rainbow"];
    int v19 = [v16 containsObject:@"Snow"] | v18 | v17;

LABEL_10:
    uint64_t v20 = v19 ^ 1u;

    goto LABEL_11;
  }
  if ([(PGEnrichedMemoryProtocol *)self->_enrichedMemory memoryCategory] == 9)
  {
    uint64_t v20 = 0;
    goto LABEL_11;
  }
  if ([(PGEnrichedMemoryProtocol *)self->_enrichedMemory memoryCategory] == 16
    || [(PGEnrichedMemoryProtocol *)self->_enrichedMemory memoryCategory] == 17)
  {
    long long v21 = [(PGEnrichedMemoryProtocol *)self->_enrichedMemory memoryFeatureNodes];
    long long v15 = +[PGGraphNodeCollection subsetInCollection:v21];

    v22 = [v15 meaningLabels];
    int v23 = [v22 containsObject:@"Diving"];

    uint64_t v24 = [v15 meaningLabels];
    int v25 = [v24 containsObject:@"WinterSport"];

    int v19 = v25 | v23;
    goto LABEL_10;
  }
  uint64_t v20 = 1;
LABEL_11:
  v26 = +[PGMemoryPhotosGraphProperties _storyRecipeSongCatalogForAppleMusicSubscriber:self->_isAppleMusicSubscriber];
  id v27 = [(PGMemoryPhotosGraphProperties *)self _recipeFromEnrichedMemory:self->_enrichedMemory subscriberCatalog:v26 applyColorGrading:v20 loggingConnection:self->_loggingConnection];
  v28 = v27;
  if (v27)
  {
    if (v20)
    {
      v29 = [v27 currentStyle];
      v30 = [v29 originalColorGradeCategory];

      if (v30) {
        [v41 setObject:v30 forKeyedSubscript:@"storyColorGradeCategory"];
      }
    }
    id v31 = objc_alloc_init(MEMORY[0x1E4F8CDB8]);
    v32 = [v31 archivedDataWithRecipe:v28];

    if (v32) {
      [v41 setObject:v32 forKeyedSubscript:@"storyRecipeData"];
    }
  }
  return v41;
}

- (PGMemoryPhotosGraphProperties)initWithEnrichedMemory:(id)a3 neighborScoreComputer:(id)a4 isAppleMusicSubscriber:(BOOL)a5 photoLibrary:(id)a6 loggingConnection:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)PGMemoryPhotosGraphProperties;
  int v17 = [(PGMemoryPhotosGraphProperties *)&v20 init];
  int v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_enrichedMemory, a3);
    objc_storeStrong((id *)&v18->_photoLibrary, a6);
    v18->_isAppleMusicSubscriber = a5;
    objc_storeStrong((id *)&v18->_neighborScoreComputer, a4);
    objc_storeStrong((id *)&v18->_loggingConnection, a7);
  }

  return v18;
}

- (id)_recipeFromEnrichedMemory:(id)a3 subscriberCatalog:(id)a4 applyColorGrading:(BOOL)a5 loggingConnection:(id)a6
{
  BOOL v67 = a5;
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = a6;
  v74 = v8;
  v71 = [v8 flexMusicCuration];
  v11 = [v71 bestSongSuggestions];
  long long v12 = [v11 firstObject];

  v73 = [v12 uid];
  unint64_t v13 = 0x1E4F1C000uLL;
  log = v10;
  v70 = v12;
  if ([v73 length])
  {
    id v65 = v9;
    id v14 = v12;
    v68 = v10;
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id v16 = [v14 tagIDs];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v75 objects:buf count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v76;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v76 != v19) {
            objc_enumerationMutation(v16);
          }
          long long v21 = [*(id *)(*((void *)&v75 + 1) + 8 * i) componentsSeparatedByString:@"_"];
          if ([v21 count] == 2)
          {
            v22 = [v21 objectAtIndexedSubscript:0];
            int v23 = [v21 objectAtIndexedSubscript:1];
            [v15 setObject:v23 forKeyedSubscript:v22];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v75 objects:buf count:16];
      }
      while (v18);
    }

    uint64_t v24 = [v15 objectForKeyedSubscript:@"Arousal"];
    int v25 = [v15 objectForKeyedSubscript:@"Valence"];
    v26 = v25;
    if (v24 && v25)
    {
      [v25 doubleValue];
      [v24 doubleValue];
      id v27 = PFStoryColorGradeCategoryFromValenceArousal();
      id v9 = v65;
      unint64_t v28 = 0x1E4F8C000;
    }
    else
    {
      v30 = v68;
      id v31 = [v15 objectForKeyedSubscript:@"Mood"];
      unint64_t v28 = 0x1E4F8C000uLL;
      if (!PHMemoryMoodForString() && os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v80 = v31;
        _os_log_error_impl(&dword_1D1805000, v30, OS_LOG_TYPE_ERROR, "[PGMemoryPhotosGraphProperties] unsupported Flex Mood tag '%@'", buf, 0xCu);
      }

      id v9 = v65;
      id v27 = PFStoryColorGradeCategoryNamed();
    }

    v32 = [v14 arousal];
    uint64_t v33 = [v14 valence];
    v34 = (void *)v33;
    if ((!v32 || !v33) && os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v80 = v73;
      _os_log_error_impl(&dword_1D1805000, v68, OS_LOG_TYPE_ERROR, "[PGMemoryPhotosGraphProperties] Failed to assign proper color grade category for key flex song (%@) because arousal OR valence information was not available.", buf, 0xCu);
    }
    v35 = *(void **)(v28 + 3544);
    uint64_t v36 = *MEMORY[0x1E4F8D2A0];
    v37 = [v14 songName];
    v38 = [v14 artistName];
    uint64_t v29 = [v35 createAssetWithCategory:1 subcategory:1 catalog:v36 songID:v73 title:v37 subtitle:v38 colorGradeCategory:v27];

    BOOL v10 = log;
    unint64_t v13 = 0x1E4F1C000;
  }
  else
  {
    uint64_t v29 = 0;
    unint64_t v28 = 0x1E4F8C000;
  }
  v39 = [v74 musicCuration];
  v40 = [v39 keySongAdamID];
  if ([v40 length])
  {
    v41 = [v39 keySongArousal];
    v42 = [v39 keySongValence];
    v43 = v42;
    uint64_t v69 = v29;
    if (v41 && v42)
    {
      v44 = v40;
      id v45 = v9;
      [v42 doubleValue];
      [v41 doubleValue];
      v46 = PFStoryColorGradeCategoryFromValenceArousal();
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v45 = v9;
        *(_DWORD *)buf = 138412290;
        v44 = v40;
        v80 = v40;
        _os_log_error_impl(&dword_1D1805000, log, OS_LOG_TYPE_ERROR, "[PGMemoryPhotosGraphProperties] Failed to assign color grade category for key apple music song (%@) because arousal and valence information was not available.", buf, 0xCu);
      }
      else
      {
        v44 = v40;
        id v45 = v9;
      }
      v46 = 0;
    }
    v48 = *(void **)(v28 + 3544);
    uint64_t v49 = *MEMORY[0x1E4F8D298];
    v50 = [v39 keySongTitle];
    v51 = [v39 keySongArtist];
    v52 = v48;
    v40 = v44;
    uint64_t v47 = [v52 createAssetWithCategory:1 subcategory:1 catalog:v49 songID:v44 title:v50 subtitle:v51 colorGradeCategory:v46];

    id v9 = v45;
    BOOL v10 = log;
    unint64_t v13 = 0x1E4F1C000uLL;
    uint64_t v29 = v69;
  }
  else
  {
    uint64_t v47 = 0;
  }
  if (v29 | v47)
  {
    v54 = [MEMORY[0x1E4F8CDD0] createRecipe];
    v53 = (void *)[v54 mutableCopyWithZone:0];

    id v55 = objc_alloc_init(*(Class *)(v13 + 2656));
    if (v47
      && ([v53 addAsset:v47],
          [(id)v47 identifier],
          v56 = objc_claimAutoreleasedReturnValue(),
          id v57 = (id)*MEMORY[0x1E4F8D298],
          [v55 setObject:v56 forKeyedSubscript:*MEMORY[0x1E4F8D298]],
          v56,
          v57 == v9))
    {
      v58 = [(id)v47 colorGradeCategory];
      if (!v29)
      {
LABEL_46:
        v62 = (void *)[v55 copy];
        [v53 setSeedSongIdentifiersByCatalog:v62];

        v63 = [MEMORY[0x1E4F8CDE0] createStyleWithOriginalColorGradeCategory:v58 customColorGradeKind:!v67 songAssetIdentifier:0 isCustomized:0];
        [v53 setCurrentStyle:v63];

        goto LABEL_47;
      }
    }
    else
    {
      v58 = 0;
      if (!v29) {
        goto LABEL_46;
      }
    }
    v66 = v40;
    [v53 addAsset:v29];
    v59 = [(id)v29 identifier];
    id v60 = (id)*MEMORY[0x1E4F8D2A0];
    [v55 setObject:v59 forKeyedSubscript:*MEMORY[0x1E4F8D2A0]];

    if (v60 == v9 || !v58)
    {
      uint64_t v61 = [(id)v29 colorGradeCategory];

      v58 = (void *)v61;
    }
    v40 = v66;
    goto LABEL_46;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1805000, v10, OS_LOG_TYPE_ERROR, "[PGMemoryPhotosGraphProperties] Failed to assign color grade category because music curation was not available.", buf, 2u);
  }
  v53 = 0;
LABEL_47:

  return v53;
}

+ (id)_storyRecipeSongCatalogForAppleMusicSubscriber:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)*MEMORY[0x1E4F8D2A0];
  if (v3)
  {
    id v5 = (id)*MEMORY[0x1E4F8D298];

    id v4 = v5;
  }
  return v4;
}

@end