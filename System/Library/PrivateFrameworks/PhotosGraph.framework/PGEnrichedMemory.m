@interface PGEnrichedMemory
- (BOOL)failedEnrichment;
- (BOOL)featuresGuestAssets;
- (BOOL)generatedWithFallbackRequirements;
- (NSArray)blockableFeatures;
- (NSArray)chapterTitles;
- (NSArray)curatedAssetUUIDs;
- (NSArray)extendedCuratedAssetUUIDs;
- (NSArray)legacyMoodKeywords;
- (NSArray)representativeAssetUUIDs;
- (NSDate)creationDate;
- (NSDictionary)validityIntervalByTriggerType;
- (NSIndexSet)triggerTypes;
- (NSString)description;
- (NSString)keyAssetUUID;
- (NSString)subtitle;
- (NSString)title;
- (NSString)uniqueMemoryIdentifier;
- (PGEnrichedMemory)initWithTriggeredMemory:(id)a3;
- (PGFlexMusicCuration)flexMusicCuration;
- (PGGraphFeatureNodeCollection)memoryFeatureNodes;
- (PGGraphMomentNodeCollection)memoryMomentNodes;
- (PGMoodVector)positiveMoodVector;
- (PGMusicCuration)musicCuration;
- (double)electionScore;
- (double)score;
- (id)enrichedDescription;
- (id)memoryFeatureNodesInGraph:(id)a3;
- (int64_t)notificationLevel;
- (int64_t)photosGraphVersion;
- (int64_t)titleCategory;
- (unint64_t)failureReason;
- (unint64_t)forbiddenMoods;
- (unint64_t)memoryCategory;
- (unint64_t)memoryCategorySubcategory;
- (unint64_t)numberOfRelevantAssets;
- (unint64_t)recommendedMoods;
- (unint64_t)suggestedMood;
- (void)setBlockableFeatures:(id)a3;
- (void)setChapterTitles:(id)a3;
- (void)setCuratedAssetUUIDs:(id)a3;
- (void)setElectionScore:(double)a3;
- (void)setExtendedCuratedAssetUUIDs:(id)a3;
- (void)setFailureReason:(unint64_t)a3;
- (void)setFeaturesGuestAssets:(BOOL)a3;
- (void)setFlexMusicCuration:(id)a3;
- (void)setForbiddenMoods:(unint64_t)a3;
- (void)setKeyAssetUUID:(id)a3;
- (void)setLegacyMoodKeywords:(id)a3;
- (void)setMusicCuration:(id)a3;
- (void)setNotificationLevel:(int64_t)a3;
- (void)setNumberOfRelevantAssets:(unint64_t)a3;
- (void)setPositiveMoodVector:(id)a3;
- (void)setRecommendedMoods:(unint64_t)a3;
- (void)setRepresentativeAssetUUIDs:(id)a3;
- (void)setScore:(double)a3;
- (void)setSubtitle:(id)a3;
- (void)setSuggestedMood:(unint64_t)a3;
- (void)setTitle:(id)a3;
- (void)setTitleCategory:(int64_t)a3;
@end

@implementation PGEnrichedMemory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_musicCuration, 0);
  objc_storeStrong((id *)&self->_flexMusicCuration, 0);
  objc_storeStrong((id *)&self->_positiveMoodVector, 0);
  objc_storeStrong((id *)&self->_legacyMoodKeywords, 0);
  objc_storeStrong((id *)&self->_extendedCuratedAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_representativeAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_curatedAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_keyAssetUUID, 0);
  objc_storeStrong((id *)&self->_chapterTitles, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_triggeredMemory, 0);
}

- (void)setFailureReason:(unint64_t)a3
{
  self->_failureReason = a3;
}

- (unint64_t)failureReason
{
  return self->_failureReason;
}

- (void)setMusicCuration:(id)a3
{
}

- (PGMusicCuration)musicCuration
{
  return self->_musicCuration;
}

- (void)setFlexMusicCuration:(id)a3
{
}

- (PGFlexMusicCuration)flexMusicCuration
{
  return self->_flexMusicCuration;
}

- (void)setTitleCategory:(int64_t)a3
{
  self->_titleCategory = a3;
}

- (int64_t)titleCategory
{
  return self->_titleCategory;
}

- (void)setNumberOfRelevantAssets:(unint64_t)a3
{
  self->_numberOfRelevantAssets = a3;
}

- (unint64_t)numberOfRelevantAssets
{
  return self->_numberOfRelevantAssets;
}

- (void)setFeaturesGuestAssets:(BOOL)a3
{
  self->_featuresGuestAssets = a3;
}

- (BOOL)featuresGuestAssets
{
  return self->_featuresGuestAssets;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (double)score
{
  return self->_score;
}

- (void)setNotificationLevel:(int64_t)a3
{
  self->_notificationLevel = a3;
}

- (int64_t)notificationLevel
{
  return self->_notificationLevel;
}

- (void)setPositiveMoodVector:(id)a3
{
}

- (PGMoodVector)positiveMoodVector
{
  return self->_positiveMoodVector;
}

- (void)setForbiddenMoods:(unint64_t)a3
{
  self->_forbiddenMoods = a3;
}

- (unint64_t)forbiddenMoods
{
  return self->_forbiddenMoods;
}

- (void)setRecommendedMoods:(unint64_t)a3
{
  self->_recommendedMoods = a3;
}

- (unint64_t)recommendedMoods
{
  return self->_recommendedMoods;
}

- (void)setSuggestedMood:(unint64_t)a3
{
  self->_suggestedMood = a3;
}

- (unint64_t)suggestedMood
{
  return self->_suggestedMood;
}

- (void)setLegacyMoodKeywords:(id)a3
{
}

- (NSArray)legacyMoodKeywords
{
  return self->_legacyMoodKeywords;
}

- (void)setExtendedCuratedAssetUUIDs:(id)a3
{
}

- (NSArray)extendedCuratedAssetUUIDs
{
  return self->_extendedCuratedAssetUUIDs;
}

- (void)setRepresentativeAssetUUIDs:(id)a3
{
}

- (NSArray)representativeAssetUUIDs
{
  return self->_representativeAssetUUIDs;
}

- (void)setCuratedAssetUUIDs:(id)a3
{
}

- (NSArray)curatedAssetUUIDs
{
  return self->_curatedAssetUUIDs;
}

- (void)setKeyAssetUUID:(id)a3
{
}

- (NSString)keyAssetUUID
{
  return self->_keyAssetUUID;
}

- (void)setChapterTitles:(id)a3
{
}

- (NSArray)chapterTitles
{
  return self->_chapterTitles;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)failedEnrichment
{
  return self->_failureReason != 0;
}

- (id)enrichedDescription
{
  v3 = [MEMORY[0x1E4F28E78] string];
  v4 = [(PGEnrichedMemory *)self triggerTypes];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __39__PGEnrichedMemory_enrichedDescription__block_invoke;
  v22 = &unk_1E68F0470;
  id v23 = v3;
  v5 = v3;
  [v4 enumerateIndexesUsingBlock:&v19];

  v6 = (void *)MEMORY[0x1E4F28E78];
  v7 = [(PGEnrichedMemory *)self title];
  v8 = [(PGEnrichedMemory *)self subtitle];
  v9 = +[PGGraphBuilder memoryLabelForCategory:[(PGEnrichedMemory *)self memoryCategory]];
  v10 = [(PGEnrichedMemory *)self curatedAssetUUIDs];
  uint64_t v11 = [v10 count];
  v12 = [(PGEnrichedMemory *)self extendedCuratedAssetUUIDs];
  uint64_t v13 = [v12 count];
  v14 = [(PGEnrichedMemory *)self keyAssetUUID];
  uint64_t v15 = [(__CFString *)v5 length];
  v16 = @"none";
  if (v15) {
    v16 = v5;
  }
  v17 = [v6 stringWithFormat:@"%@, %@ (%@), %tu curated assets, %tu extended assets, key asset: %@, trigger: %@\n", v7, v8, v9, v11, v13, v14, v16, v19, v20, v21, v22];

  objc_msgSend(v17, "replaceOccurrencesOfString:withString:options:range:", @"\n", &stru_1F283BC78, 2, 0, objc_msgSend(v17, "length"));
  return v17;
}

void __39__PGEnrichedMemory_enrichedDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = +[PGMemoryTrigger stringFromTriggerType:a2];
  [v2 appendFormat:@"%@ ", v3];
}

- (NSDictionary)validityIntervalByTriggerType
{
  return (NSDictionary *)[(PGTriggeredMemoryProtocol *)self->_triggeredMemory validityIntervalByTriggerType];
}

- (void)setElectionScore:(double)a3
{
}

- (double)electionScore
{
  [(PGTriggeredMemoryProtocol *)self->_triggeredMemory electionScore];
  return result;
}

- (void)setBlockableFeatures:(id)a3
{
}

- (NSArray)blockableFeatures
{
  id v3 = [(PGTriggeredMemoryProtocol *)self->_triggeredMemory blockableFeatures];
  if (!v3)
  {
    v4 = +[PGLogging sharedLogging];
    v5 = [v4 loggingConnection];

    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1D1805000, v5, OS_LOG_TYPE_INFO, "-[PGEnrichedMemory blockableFeatures] Blockable features was not already computed on triggered memory, this should only happen from CLI/testing, not during overnight election", v9, 2u);
    }

    v6 = [(PGEnrichedMemory *)self memoryFeatureNodes];
    v7 = [(PGEnrichedMemory *)self memoryMomentNodes];
    id v3 = +[PGMemoryFeatureBlocking blockableFeaturesForFeatureNodes:v6 momentNodes:v7 memoryCategory:[(PGEnrichedMemory *)self memoryCategory]];
  }
  return (NSArray *)v3;
}

- (int64_t)photosGraphVersion
{
  return [(PGTriggeredMemoryProtocol *)self->_triggeredMemory photosGraphVersion];
}

- (NSString)uniqueMemoryIdentifier
{
  return (NSString *)[(PGTriggeredMemoryProtocol *)self->_triggeredMemory uniqueMemoryIdentifier];
}

- (PGGraphFeatureNodeCollection)memoryFeatureNodes
{
  return (PGGraphFeatureNodeCollection *)[(PGTriggeredMemoryProtocol *)self->_triggeredMemory memoryFeatureNodes];
}

- (id)memoryFeatureNodesInGraph:(id)a3
{
  return (id)[(PGTriggeredMemoryProtocol *)self->_triggeredMemory memoryFeatureNodesInGraph:a3];
}

- (NSIndexSet)triggerTypes
{
  return (NSIndexSet *)[(PGTriggeredMemoryProtocol *)self->_triggeredMemory triggerTypes];
}

- (NSDate)creationDate
{
  return (NSDate *)[(PGTriggeredMemoryProtocol *)self->_triggeredMemory creationDate];
}

- (BOOL)generatedWithFallbackRequirements
{
  return [(PGTriggeredMemoryProtocol *)self->_triggeredMemory generatedWithFallbackRequirements];
}

- (PGGraphMomentNodeCollection)memoryMomentNodes
{
  return (PGGraphMomentNodeCollection *)[(PGTriggeredMemoryProtocol *)self->_triggeredMemory memoryMomentNodes];
}

- (unint64_t)memoryCategorySubcategory
{
  return [(PGTriggeredMemoryProtocol *)self->_triggeredMemory memoryCategorySubcategory];
}

- (unint64_t)memoryCategory
{
  return [(PGTriggeredMemoryProtocol *)self->_triggeredMemory memoryCategory];
}

- (NSString)description
{
  id v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PGEnrichedMemory;
  v4 = [(PGEnrichedMemory *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@: %@, Key asset: %@, %lu curated assets, %lu extended curated assets, %lu representative assets, ", v4, self->_triggeredMemory, self->_keyAssetUUID, -[NSArray count](self->_curatedAssetUUIDs, "count"), -[NSArray count](self->_extendedCuratedAssetUUIDs, "count"), -[NSArray count](self->_representativeAssetUUIDs, "count")];

  return (NSString *)v5;
}

- (PGEnrichedMemory)initWithTriggeredMemory:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGEnrichedMemory;
  v6 = [(PGEnrichedMemory *)&v9 init];
  objc_super v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_triggeredMemory, a3);
  }

  return v7;
}

@end