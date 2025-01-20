@interface PGMemoryElectorConfiguration
+ (id)defaultConfigurationDictionarySource;
- (BOOL)allowGuestAsset;
- (BOOL)shouldPersist;
- (BOOL)skipEnrichment;
- (BOOL)useMaximumTargetNumberOfMemories;
- (NSArray)collidableSuggestions;
- (NSArray)moodHistory;
- (NSDate)localDate;
- (NSString)requestedUniqueMemoryIdentifier;
- (NSTimeZone)timeZone;
- (PGFeature)requestedFeature;
- (PGMemoryElectorConfiguration)init;
- (double)maximumRatioOfGuestAssets;
- (id)futureMemoryCollisionUniversalDateInterval;
- (id)pastMemoryCollisionUniversalDateInterval;
- (unint64_t)maximumNumberOfMemoriesWithGuestAssets;
- (unint64_t)maximumTargetNumberOfMemories;
- (unint64_t)minimumNumberOfCuratedAssets;
- (unint64_t)minimumNumberOfDaysBeforeTimeDecay;
- (unint64_t)minimumTargetNumberOfMemories;
- (unint64_t)numberOfDaysToFocusOnNewMemoryTypes;
- (unint64_t)numberOfDaysToLookInFuture;
- (unint64_t)numberOfDaysToLookInPast;
- (unint64_t)requestedMemoryCategory;
- (unint64_t)requestedTriggerType;
- (unint64_t)targetNumberOfMemoriesWithMemoryContext:(id)a3 totalNumberOfMemoryNodes:(unint64_t)a4 referenceNumberOfDays:(unint64_t)a5;
- (unsigned)pendingState;
- (void)setAllowGuestAsset:(BOOL)a3;
- (void)setCollidableSuggestions:(id)a3;
- (void)setLocalDate:(id)a3;
- (void)setMaximumNumberOfMemoriesWithGuestAssets:(unint64_t)a3;
- (void)setMaximumRatioOfGuestAssets:(double)a3;
- (void)setMaximumTargetNumberOfMemories:(unint64_t)a3;
- (void)setMinimumNumberOfCuratedAssets:(unint64_t)a3;
- (void)setMinimumNumberOfDaysBeforeTimeDecay:(unint64_t)a3;
- (void)setMinimumTargetNumberOfMemories:(unint64_t)a3;
- (void)setMoodHistory:(id)a3;
- (void)setNumberOfDaysToFocusOnNewMemoryTypes:(unint64_t)a3;
- (void)setNumberOfDaysToLookInFuture:(unint64_t)a3;
- (void)setNumberOfDaysToLookInPast:(unint64_t)a3;
- (void)setPendingState:(unsigned __int16)a3;
- (void)setRequestedFeature:(id)a3;
- (void)setRequestedMemoryCategory:(unint64_t)a3;
- (void)setRequestedTriggerType:(unint64_t)a3;
- (void)setRequestedUniqueMemoryIdentifier:(id)a3;
- (void)setShouldPersist:(BOOL)a3;
- (void)setSkipEnrichment:(BOOL)a3;
- (void)setTimeZone:(id)a3;
- (void)setUseMaximumTargetNumberOfMemories:(BOOL)a3;
@end

@implementation PGMemoryElectorConfiguration

+ (id)defaultConfigurationDictionarySource
{
  v11[21] = *MEMORY[0x1E4F143B8];
  v10[0] = @"localDate";
  v2 = [MEMORY[0x1E4F76C68] currentLocalDate];
  v11[0] = v2;
  v10[1] = @"timeZone";
  v3 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  v11[1] = v3;
  v11[2] = MEMORY[0x1E4F1CC38];
  v10[2] = @"shouldPersist";
  v10[3] = @"pendingState";
  v11[3] = &unk_1F28D2778;
  v11[4] = &unk_1F28D2790;
  v10[4] = @"maximumTargetNumberOfMemories";
  v10[5] = @"minimumTargetNumberOfMemories";
  uint64_t v4 = MEMORY[0x1E4F1CC28];
  v11[5] = &unk_1F28D27A8;
  v11[6] = MEMORY[0x1E4F1CC28];
  v10[6] = @"useMaximumTargetNumberOfMemories";
  v10[7] = @"maximumNumberOfMemoriesWithGuestAssets";
  v11[7] = &unk_1F28D27C0;
  v11[8] = &unk_1F28D5838;
  v10[8] = @"maximumRatioOfGuestAssets";
  v10[9] = @"numberOfDaysToLookInPast";
  v11[9] = &unk_1F28D27D8;
  v11[10] = &unk_1F28D27F0;
  v10[10] = @"numberOfDaysToLookInFuture";
  v10[11] = @"numberOfDaysToFocusOnNewMemoryTypes";
  v11[11] = &unk_1F28D2808;
  v11[12] = &unk_1F28D2820;
  v10[12] = @"minimumNumberOfDaysBeforeTimeDecay";
  v10[13] = @"minimumNumberOfCuratedAssets";
  v5 = [NSNumber numberWithUnsignedInteger:13];
  v11[13] = v5;
  v11[14] = MEMORY[0x1E4F1CBF0];
  v10[14] = @"collidableSuggestions";
  v10[15] = @"skipEnrichment";
  v10[16] = @"requestedMemoryCategory";
  v10[17] = @"requestedTriggerType";
  v11[15] = v4;
  v11[16] = &unk_1F28D2838;
  v11[17] = &unk_1F28D2838;
  v11[18] = &stru_1F283BC78;
  v10[18] = @"requestedUniqueMemoryIdentifier";
  v10[19] = @"moodHistory";
  v11[19] = MEMORY[0x1E4F1CBF0];
  v10[20] = @"allowGuestAsset";
  v6 = [NSNumber numberWithBool:1];
  v11[20] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:21];

  v8 = [[PGDictionaryConfigurationSource alloc] initWithDictionary:v7];
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moodHistory, 0);
  objc_storeStrong((id *)&self->_requestedUniqueMemoryIdentifier, 0);
  objc_storeStrong((id *)&self->_requestedFeature, 0);
  objc_storeStrong((id *)&self->_collidableSuggestions, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_localDate, 0);
}

- (void)setAllowGuestAsset:(BOOL)a3
{
  self->_allowGuestAsset = a3;
}

- (BOOL)allowGuestAsset
{
  return self->_allowGuestAsset;
}

- (void)setMoodHistory:(id)a3
{
}

- (NSArray)moodHistory
{
  return self->_moodHistory;
}

- (void)setRequestedUniqueMemoryIdentifier:(id)a3
{
}

- (NSString)requestedUniqueMemoryIdentifier
{
  return self->_requestedUniqueMemoryIdentifier;
}

- (void)setRequestedFeature:(id)a3
{
}

- (PGFeature)requestedFeature
{
  return self->_requestedFeature;
}

- (void)setRequestedTriggerType:(unint64_t)a3
{
  self->_requestedTriggerType = a3;
}

- (unint64_t)requestedTriggerType
{
  return self->_requestedTriggerType;
}

- (void)setRequestedMemoryCategory:(unint64_t)a3
{
  self->_requestedMemoryCategory = a3;
}

- (unint64_t)requestedMemoryCategory
{
  return self->_requestedMemoryCategory;
}

- (void)setSkipEnrichment:(BOOL)a3
{
  self->_skipEnrichment = a3;
}

- (BOOL)skipEnrichment
{
  return self->_skipEnrichment;
}

- (void)setCollidableSuggestions:(id)a3
{
}

- (NSArray)collidableSuggestions
{
  return self->_collidableSuggestions;
}

- (void)setMinimumNumberOfCuratedAssets:(unint64_t)a3
{
  self->_minimumNumberOfCuratedAssets = a3;
}

- (unint64_t)minimumNumberOfCuratedAssets
{
  return self->_minimumNumberOfCuratedAssets;
}

- (void)setMinimumNumberOfDaysBeforeTimeDecay:(unint64_t)a3
{
  self->_minimumNumberOfDaysBeforeTimeDecay = a3;
}

- (unint64_t)minimumNumberOfDaysBeforeTimeDecay
{
  return self->_minimumNumberOfDaysBeforeTimeDecay;
}

- (void)setNumberOfDaysToFocusOnNewMemoryTypes:(unint64_t)a3
{
  self->_numberOfDaysToFocusOnNewMemoryTypes = a3;
}

- (unint64_t)numberOfDaysToFocusOnNewMemoryTypes
{
  return self->_numberOfDaysToFocusOnNewMemoryTypes;
}

- (void)setNumberOfDaysToLookInFuture:(unint64_t)a3
{
  self->_numberOfDaysToLookInFuture = a3;
}

- (unint64_t)numberOfDaysToLookInFuture
{
  return self->_numberOfDaysToLookInFuture;
}

- (void)setNumberOfDaysToLookInPast:(unint64_t)a3
{
  self->_numberOfDaysToLookInPast = a3;
}

- (unint64_t)numberOfDaysToLookInPast
{
  return self->_numberOfDaysToLookInPast;
}

- (void)setMaximumRatioOfGuestAssets:(double)a3
{
  self->_maximumRatioOfGuestAssets = a3;
}

- (double)maximumRatioOfGuestAssets
{
  return self->_maximumRatioOfGuestAssets;
}

- (void)setMaximumNumberOfMemoriesWithGuestAssets:(unint64_t)a3
{
  self->_maximumNumberOfMemoriesWithGuestAssets = a3;
}

- (unint64_t)maximumNumberOfMemoriesWithGuestAssets
{
  return self->_maximumNumberOfMemoriesWithGuestAssets;
}

- (void)setUseMaximumTargetNumberOfMemories:(BOOL)a3
{
  self->_useMaximumTargetNumberOfMemories = a3;
}

- (BOOL)useMaximumTargetNumberOfMemories
{
  return self->_useMaximumTargetNumberOfMemories;
}

- (void)setMinimumTargetNumberOfMemories:(unint64_t)a3
{
  self->_minimumTargetNumberOfMemories = a3;
}

- (unint64_t)minimumTargetNumberOfMemories
{
  return self->_minimumTargetNumberOfMemories;
}

- (void)setMaximumTargetNumberOfMemories:(unint64_t)a3
{
  self->_maximumTargetNumberOfMemories = a3;
}

- (unint64_t)maximumTargetNumberOfMemories
{
  return self->_maximumTargetNumberOfMemories;
}

- (void)setPendingState:(unsigned __int16)a3
{
  self->_pendingState = a3;
}

- (unsigned)pendingState
{
  return self->_pendingState;
}

- (void)setShouldPersist:(BOOL)a3
{
  self->_shouldPersist = a3;
}

- (BOOL)shouldPersist
{
  return self->_shouldPersist;
}

- (void)setTimeZone:(id)a3
{
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setLocalDate:(id)a3
{
}

- (NSDate)localDate
{
  return self->_localDate;
}

- (unint64_t)targetNumberOfMemoriesWithMemoryContext:(id)a3 totalNumberOfMemoryNodes:(unint64_t)a4 referenceNumberOfDays:(unint64_t)a5
{
  id v8 = a3;
  v9 = v8;
  unint64_t maximumTargetNumberOfMemories = self->_maximumTargetNumberOfMemories;
  if (!self->_useMaximumTargetNumberOfMemories)
  {
    unint64_t v11 = vcvtpd_u64_f64((double)a4 / (double)a5);
    if (maximumTargetNumberOfMemories >= v11) {
      unint64_t v12 = v11;
    }
    else {
      unint64_t v12 = self->_maximumTargetNumberOfMemories;
    }
    if (maximumTargetNumberOfMemories > v11)
    {
      v13 = [v8 creationDateOfLastMemory];
      if (v13)
      {
        v14 = [PGMemoryDate alloc];
        v15 = [v9 localDate];
        v16 = [(PGMemoryDate *)v14 initWithLocalDate:v15];

        v17 = [v9 timeZone];
        v18 = [(PGMemoryDate *)v16 universalDateInTimeZone:v17];
        [v18 timeIntervalSinceDate:v13];
        double v20 = v19;

        uint64_t v21 = (uint64_t)(v20 / 86400.0);
        int64_t v22 = self->_maximumTargetNumberOfMemories;
        unint64_t v23 = v22;
        if (v21 < 2 * v22)
        {
          unint64_t v23 = v12;
          if (v22 <= v21) {
            unint64_t v23 = vcvtpd_u64_f64((double)(unint64_t)v22 * 0.5);
          }
        }
      }
      else
      {
        unint64_t v23 = self->_maximumTargetNumberOfMemories;
      }

      unint64_t v12 = v23;
    }
    if (v12 <= self->_minimumTargetNumberOfMemories) {
      unint64_t maximumTargetNumberOfMemories = self->_minimumTargetNumberOfMemories;
    }
    else {
      unint64_t maximumTargetNumberOfMemories = v12;
    }
  }

  return maximumTargetNumberOfMemories;
}

- (id)futureMemoryCollisionUniversalDateInterval
{
  v3 = [[PGMemoryDate alloc] initWithLocalDate:self->_localDate];
  uint64_t v4 = [(PGMemoryDate *)v3 universalDateInTimeZone:self->_timeZone];
  v5 = [MEMORY[0x1E4F76C68] dateByAddingDays:1 toDate:v4];

  v6 = [MEMORY[0x1E4F76C68] dateByAddingDays:self->_numberOfDaysToLookInFuture toDate:v5];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v5 endDate:v6];

  return v7;
}

- (id)pastMemoryCollisionUniversalDateInterval
{
  v3 = [[PGMemoryDate alloc] initWithLocalDate:self->_localDate];
  uint64_t v4 = [(PGMemoryDate *)v3 universalDateInTimeZone:self->_timeZone];
  v5 = [MEMORY[0x1E4F76C68] dateByAddingDays:-self->_numberOfDaysToLookInPast toDate:v4];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v5 endDate:v4];

  return v6;
}

- (PGMemoryElectorConfiguration)init
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v3 = [(id)objc_opt_class() defaultConfigurationDictionarySource];
  v7[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  v5 = [(PGConfiguration *)self initWithSources:v4 version:1.0];

  return v5;
}

@end