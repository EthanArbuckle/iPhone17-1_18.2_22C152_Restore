@interface PHAMetricsHelper
+ (BOOL)shouldAggregateDataForReporting:(unint64_t)a3;
+ (id)aggregatedStatsForMiroMoodCountVector:(id)a3;
+ (id)aggregatedStatsForMoodKeywordCountedSet:(id)a3;
+ (id)aggregatedStatsForPossibleMoodCountVector:(id)a3;
+ (id)aggregatedStatsForSuggestedMoodCountVector:(id)a3;
+ (id)dataAggregationKeyForCategory:(unint64_t)a3 subCategory:(unint64_t)a4 lookupTable:(id)a5;
+ (id)fullMemoryTypeStringForMemory:(id)a3 withWorkingContext:(id)a4;
+ (id)legacyMemoryCategoryValueToDataAggregationKeyLookup;
+ (id)memoryBlockableFeatureTypeValueToDataAggregationKeyLookup;
+ (id)memoryBlockedFeatureTypeValueToDataAggregationKeyLookup;
+ (id)memoryCategoryValueToDataAggregationKeyLookup;
@end

@implementation PHAMetricsHelper

+ (id)fullMemoryTypeStringForMemory:(id)a3 withWorkingContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__1053;
  v24 = __Block_byref_object_dispose__1054;
  v25 = @"Unknown";
  v7 = [v5 photosGraphProperties];
  v8 = [v7 objectForKeyedSubscript:@"memoryCategorySubcategory"];
  uint64_t v9 = [v8 unsignedIntegerValue];

  v10 = [v5 photosGraphProperties];
  v11 = [v10 objectForKeyedSubscript:@"encodedFeatures"];

  v12 = [MEMORY[0x1E4F8D3F8] featuresForEncodedFeatures:v11];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __69__PHAMetricsHelper_fullMemoryTypeStringForMemory_withWorkingContext___block_invoke;
  v16[3] = &unk_1E6917678;
  id v13 = v12;
  id v17 = v13;
  v18 = &v20;
  uint64_t v19 = v9;
  [v6 performSynchronousConcurrentGraphReadUsingBlock:v16];
  id v14 = (id)v21[5];

  _Block_object_dispose(&v20, 8);

  return v14;
}

void __69__PHAMetricsHelper_fullMemoryTypeStringForMemory_withWorkingContext___block_invoke(void *a1, void *a2)
{
  id v7 = [a2 graph];
  v3 = [MEMORY[0x1E4F8D660] featureNodeCollectionWithFeatures:a1[4] inGraph:v7];
  uint64_t v4 = [MEMORY[0x1E4F8D688] fullMemoryTypeStringWithMemoryCategorySubcategory:a1[6] featureNodes:v3];
  uint64_t v5 = *(void *)(a1[5] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

+ (BOOL)shouldAggregateDataForReporting:(unint64_t)a3
{
  return a3 == 2;
}

+ (id)dataAggregationKeyForCategory:(unint64_t)a3 subCategory:(unint64_t)a4 lookupTable:(id)a5
{
  id v7 = NSNumber;
  id v8 = a5;
  uint64_t v9 = [v7 numberWithUnsignedInteger:a3];
  v10 = [v8 objectForKey:v9];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = [NSNumber numberWithUnsignedInteger:a4];
    id v12 = [v10 objectForKey:v11];
  }
  else
  {
    id v12 = v10;
  }

  return v12;
}

+ (id)aggregatedStatsForMoodKeywordCountedSet:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  uint64_t v5 = [v3 dictionaryWithCapacity:18];
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "countForObject:", *MEMORY[0x1E4F8DBE8]));
  [v5 setValue:v6 forKey:@"disneyKeywordCount"];

  id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "countForObject:", *MEMORY[0x1E4F8DC40]));
  [v5 setValue:v7 forKey:@"universalKeywordCount"];

  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "countForObject:", *MEMORY[0x1E4F8DC18]));
  [v5 setValue:v8 forKey:@"newYorkCityKeywordCount"];

  uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "countForObject:", *MEMORY[0x1E4F8DC08]));
  [v5 setValue:v9 forKey:@"londonKeywordCount"];

  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "countForObject:", *MEMORY[0x1E4F8DC20]));
  [v5 setValue:v10 forKey:@"parisKeywordCount"];

  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "countForObject:", *MEMORY[0x1E4F8DC00]));
  [v5 setValue:v11 forKey:@"hawaiiKeywordCount"];

  id v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "countForObject:", *MEMORY[0x1E4F8DC38]));
  [v5 setValue:v12 forKey:@"sportsKeywordCount"];

  id v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "countForObject:", *MEMORY[0x1E4F8DBC0]));
  [v5 setValue:v13 forKey:@"anniversaryKeywordCount"];

  id v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "countForObject:", *MEMORY[0x1E4F8DBD8]));
  [v5 setValue:v14 forKey:@"birthdayKeywordCount"];

  v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "countForObject:", *MEMORY[0x1E4F8DC48]));
  [v5 setValue:v15 forKey:@"weddingKeywordCount"];

  v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "countForObject:", *MEMORY[0x1E4F8DBF0]));
  [v5 setValue:v16 forKey:@"familyKeywordCount"];

  id v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "countForObject:", *MEMORY[0x1E4F8DC28]));
  [v5 setValue:v17 forKey:@"partyKeywordCount"];

  v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "countForObject:", *MEMORY[0x1E4F8DBF8]));
  [v5 setValue:v18 forKey:@"gatheringKeywordCount"];

  uint64_t v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "countForObject:", *MEMORY[0x1E4F8DC30]));
  [v5 setValue:v19 forKey:@"petsKeywordCount"];

  uint64_t v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "countForObject:", *MEMORY[0x1E4F8DBC8]));
  [v5 setValue:v20 forKey:@"babiesKeywordCount"];

  v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "countForObject:", *MEMORY[0x1E4F8DC50]));
  [v5 setValue:v21 forKey:@"winterHolidayKeywordCount"];

  uint64_t v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "countForObject:", *MEMORY[0x1E4F8DBD0]));
  [v5 setValue:v22 forKey:@"beachKeywordCount"];

  v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "countForObject:", *MEMORY[0x1E4F8DC10]));
  [v5 setValue:v23 forKey:@"natureKeywordCount"];

  v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "countForObject:", *MEMORY[0x1E4F8DBE0]));
  [v5 setValue:v24 forKey:@"chineseLunarNewYearKeywordCount"];

  v25 = NSNumber;
  uint64_t v26 = [v4 countForObject:@"None"];

  v27 = [v25 numberWithUnsignedInteger:v26];
  [v5 setValue:v27 forKey:@"noneKeywordCount"];

  return v5;
}

+ (id)aggregatedStatsForMiroMoodCountVector:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  uint64_t v5 = [v3 dictionaryWithCapacity:9];
  id v6 = [v4 objectAtIndexedSubscript:1];
  [v5 setValue:v6 forKey:@"dreamyMiroMoodCount"];

  id v7 = [v4 objectAtIndexedSubscript:2];
  [v5 setValue:v7 forKey:@"sentimentalMiroMoodCount"];

  id v8 = [v4 objectAtIndexedSubscript:4];
  [v5 setValue:v8 forKey:@"gentleMiroMoodCount"];

  uint64_t v9 = [v4 objectAtIndexedSubscript:8];
  [v5 setValue:v9 forKey:@"chillMiroMoodCount"];

  v10 = [v4 objectAtIndexedSubscript:32];
  [v5 setValue:v10 forKey:@"happyMiroMoodCount"];

  v11 = [v4 objectAtIndexedSubscript:64];
  [v5 setValue:v11 forKey:@"upliftingMiroMoodCount"];

  id v12 = [v4 objectAtIndexedSubscript:128];
  [v5 setValue:v12 forKey:@"epicMiroMoodCount"];

  id v13 = [v4 objectAtIndexedSubscript:256];
  [v5 setValue:v13 forKey:@"clubMiroMoodCount"];

  id v14 = [v4 objectAtIndexedSubscript:512];

  [v5 setValue:v14 forKey:@"extremeMiroMoodCount"];

  return v5;
}

+ (id)aggregatedStatsForPossibleMoodCountVector:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  uint64_t v5 = [v3 dictionaryWithCapacity:9];
  id v6 = [v4 objectAtIndexedSubscript:1];
  [v5 setValue:v6 forKey:@"dreamyPossibleMoodCount"];

  id v7 = [v4 objectAtIndexedSubscript:2];
  [v5 setValue:v7 forKey:@"sentimentalPossibleMoodCount"];

  id v8 = [v4 objectAtIndexedSubscript:4];
  [v5 setValue:v8 forKey:@"gentlePossibleMoodCount"];

  uint64_t v9 = [v4 objectAtIndexedSubscript:8];
  [v5 setValue:v9 forKey:@"chillPossibleMoodCount"];

  v10 = [v4 objectAtIndexedSubscript:32];
  [v5 setValue:v10 forKey:@"happyPossibleMoodCount"];

  v11 = [v4 objectAtIndexedSubscript:64];
  [v5 setValue:v11 forKey:@"upliftingPossibleMoodCount"];

  id v12 = [v4 objectAtIndexedSubscript:128];
  [v5 setValue:v12 forKey:@"epicPossibleMoodCount"];

  id v13 = [v4 objectAtIndexedSubscript:256];
  [v5 setValue:v13 forKey:@"clubPossibleMoodCount"];

  id v14 = [v4 objectAtIndexedSubscript:512];

  [v5 setValue:v14 forKey:@"extremePossibleMoodCount"];

  return v5;
}

+ (id)aggregatedStatsForSuggestedMoodCountVector:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  uint64_t v5 = [v3 dictionaryWithCapacity:9];
  id v6 = [v4 objectAtIndexedSubscript:1];
  [v5 setValue:v6 forKey:@"dreamySuggestedMoodCount"];

  id v7 = [v4 objectAtIndexedSubscript:2];
  [v5 setValue:v7 forKey:@"sentimentalSuggestedMoodCount"];

  id v8 = [v4 objectAtIndexedSubscript:4];
  [v5 setValue:v8 forKey:@"gentleSuggestedMoodCount"];

  uint64_t v9 = [v4 objectAtIndexedSubscript:8];
  [v5 setValue:v9 forKey:@"chillSuggestedMoodCount"];

  v10 = [v4 objectAtIndexedSubscript:32];
  [v5 setValue:v10 forKey:@"happySuggestedMoodCount"];

  v11 = [v4 objectAtIndexedSubscript:64];
  [v5 setValue:v11 forKey:@"upliftingSuggestedMoodCount"];

  id v12 = [v4 objectAtIndexedSubscript:128];
  [v5 setValue:v12 forKey:@"epicSuggestedMoodCount"];

  id v13 = [v4 objectAtIndexedSubscript:256];
  [v5 setValue:v13 forKey:@"clubSuggestedMoodCount"];

  id v14 = [v4 objectAtIndexedSubscript:512];
  [v5 setValue:v14 forKey:@"extremeSuggestedMoodCount"];

  [v4 valueForMood:16];
  double v16 = v15;
  unint64_t v17 = (unint64_t)v15;
  [v4 sum];
  double v19 = v18;

  uint64_t v20 = [NSNumber numberWithUnsignedInteger:(unint64_t)(v19 - (double)(unint64_t)v16)];
  [v5 setValue:v20 forKey:@"suggestedMoodCount"];

  v21 = [NSNumber numberWithUnsignedInteger:v17];
  [v5 setValue:v21 forKey:@"nonSuggestedMoodCount"];

  return v5;
}

+ (id)memoryBlockedFeatureTypeValueToDataAggregationKeyLookup
{
  if (memoryBlockedFeatureTypeValueToDataAggregationKeyLookup_onceToken[0] != -1) {
    dispatch_once(memoryBlockedFeatureTypeValueToDataAggregationKeyLookup_onceToken, &__block_literal_global_346);
  }
  v2 = (void *)memoryBlockedFeatureTypeValueToDataAggregationKeyLookup_featureTypeLookupTable;

  return v2;
}

void __75__PHAMetricsHelper_memoryBlockedFeatureTypeValueToDataAggregationKeyLookup__block_invoke()
{
  v3[6] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F291AAB0;
  v2[1] = &unk_1F291AAC8;
  v3[0] = @"numberOfLocationBlacklistedFeatures";
  v3[1] = @"numberOfAreaBlacklistedFeatures";
  v2[2] = &unk_1F291AAE0;
  v2[3] = &unk_1F291A720;
  v3[2] = @"numberOfPersonBlacklistedFeatures";
  v3[3] = @"numberOfDateBlacklistedFeatures";
  v2[4] = &unk_1F291AAF8;
  v2[5] = &unk_1F291AB10;
  v3[4] = @"numberOfDateBlacklistedFeatures";
  v3[5] = @"numberOfHolidayBlacklistedFeatures";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:6];
  v1 = (void *)memoryBlockedFeatureTypeValueToDataAggregationKeyLookup_featureTypeLookupTable;
  memoryBlockedFeatureTypeValueToDataAggregationKeyLookup_featureTypeLookupTable = v0;
}

+ (id)memoryBlockableFeatureTypeValueToDataAggregationKeyLookup
{
  if (memoryBlockableFeatureTypeValueToDataAggregationKeyLookup_onceToken != -1) {
    dispatch_once(&memoryBlockableFeatureTypeValueToDataAggregationKeyLookup_onceToken, &__block_literal_global_334);
  }
  v2 = (void *)memoryBlockableFeatureTypeValueToDataAggregationKeyLookup_featureTypeLookupTable;

  return v2;
}

void __77__PHAMetricsHelper_memoryBlockableFeatureTypeValueToDataAggregationKeyLookup__block_invoke()
{
  v3[6] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F291AAB0;
  v2[1] = &unk_1F291AAC8;
  v3[0] = @"numberOfLocationBlacklistableFeatures";
  v3[1] = @"numberOfAreaBlacklistableFeatures";
  v2[2] = &unk_1F291AAE0;
  v2[3] = &unk_1F291A720;
  v3[2] = @"numberOfPersonBlacklistableFeatures";
  v3[3] = @"numberOfDateBlacklistableFeatures";
  v2[4] = &unk_1F291AAF8;
  v2[5] = &unk_1F291AB10;
  v3[4] = @"numberOfDateBlacklistableFeatures";
  v3[5] = @"numberOfHolidayBlacklistableFeatures";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:6];
  v1 = (void *)memoryBlockableFeatureTypeValueToDataAggregationKeyLookup_featureTypeLookupTable;
  memoryBlockableFeatureTypeValueToDataAggregationKeyLookup_featureTypeLookupTable = v0;
}

+ (id)legacyMemoryCategoryValueToDataAggregationKeyLookup
{
  if (legacyMemoryCategoryValueToDataAggregationKeyLookup_onceToken != -1) {
    dispatch_once(&legacyMemoryCategoryValueToDataAggregationKeyLookup_onceToken, &__block_literal_global_272);
  }
  v2 = (void *)legacyMemoryCategoryValueToDataAggregationKeyLookup_categoryLookupTable;

  return v2;
}

void __71__PHAMetricsHelper_legacyMemoryCategoryValueToDataAggregationKeyLookup__block_invoke()
{
  v15[22] = *MEMORY[0x1E4F143B8];
  v14[0] = &unk_1F291A7E0;
  v14[1] = &unk_1F291A7F8;
  v15[0] = @"dayInHistoryMemoriesCount";
  v15[1] = @"holidayInHistoryMemoriesCount";
  v14[2] = &unk_1F291A810;
  v14[3] = &unk_1F291A828;
  v15[2] = @"celebrationInHistoryMemoriesCount";
  v15[3] = @"lastWeekendMemoriesCount";
  v14[4] = &unk_1F291A840;
  v14[5] = &unk_1F291A858;
  v15[4] = @"lastWeekMemoriesCount";
  v15[5] = @"weekInHistoryMemoriesCount";
  v14[6] = &unk_1F291A870;
  v14[7] = &unk_1F291A888;
  v15[6] = @"throwbackThursdayMemoriesCount";
  v15[7] = @"peopleOverTimeMemoriesCount";
  v14[8] = &unk_1F291A8A0;
  v14[9] = &unk_1F291A8B8;
  v15[8] = @"earlyMomentWithPeopleMemoriesCount";
  v15[9] = @"lastSeasonMemoriesCount";
  v14[10] = &unk_1F291A8D0;
  v14[11] = &unk_1F291A8E8;
  v15[10] = @"seasonInHistoryMemoriesCount";
  v15[11] = @"contextualMemoriesCount";
  v14[12] = &unk_1F291A900;
  v14[13] = &unk_1F291A918;
  v15[12] = @"nearbyMemoriesCount";
  v15[13] = @"yearSummaryMemoriesCount";
  v14[14] = &unk_1F291A930;
  v14[15] = &unk_1F291A948;
  v15[14] = @"bestOfPastMemoriesCount";
  v15[15] = @"celebrationOverTimeMemoriesCount";
  v14[16] = &unk_1F291A960;
  v14[17] = &unk_1F291A978;
  v15[16] = @"keyPeopleForUpcomingHolidayEventMemoriesCount";
  v15[17] = @"homeAggregationMemoriesCount";
  v14[18] = &unk_1F291A990;
  v12[0] = &unk_1F291A918;
  v12[1] = &unk_1F291A7E0;
  v13[0] = @"breakOutOfRoutineMemoriesCount";
  v13[1] = @"crowdMemoriesCount";
  v12[2] = &unk_1F291A9A8;
  v12[3] = &unk_1F291A9C0;
  v13[2] = @"tripMemoriesCount";
  v13[3] = @"weekendMemoriesCount";
  v12[4] = &unk_1F291A930;
  v12[5] = &unk_1F291A9D8;
  v13[4] = @"pastSupersetMemoriesCount";
  v13[5] = @"sometimeMemoriesCount";
  v12[6] = &unk_1F291A828;
  v12[7] = &unk_1F291A840;
  v13[6] = @"socialGroupMemoriesCount";
  v13[7] = @"personMemoriesCount";
  v12[8] = &unk_1F291A9F0;
  v12[9] = &unk_1F291A8B8;
  v13[8] = @"personBirthdayMemoriesCount";
  v13[9] = @"peopleVisitingMemoriesCount";
  v12[10] = &unk_1F291A7F8;
  v12[11] = &unk_1F291A870;
  v13[10] = @"meaningfulEventMemoriesCount";
  v13[11] = @"meaningfulEventAggregationMemoriesCount";
  v12[12] = &unk_1F291A810;
  v12[13] = &unk_1F291A8D0;
  v13[12] = @"petMemoriesCount";
  v13[13] = @"babyMemoriesCount";
  v12[14] = &unk_1F291A948;
  v12[15] = &unk_1F291A960;
  v13[14] = @"recurrentTripMemoriesCount";
  v13[15] = @"foodieMemoriesCount";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:16];
  v14[19] = &unk_1F291AA08;
  v10[0] = &unk_1F291AA20;
  v10[1] = &unk_1F291AA38;
  v11[0] = @"locationOfInterestMemoriesCount";
  v11[1] = @"regionOfInterestMemoriesCount";
  v15[18] = v0;
  v10[2] = &unk_1F291AA50;
  v11[2] = @"areaOfInterestMemoriesCount";
  v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];
  v15[19] = v1;
  v14[20] = &unk_1F291AA68;
  v9[0] = @"recentEventMemoriesCount";
  v9[1] = @"recentEventPeopleMemoriesCount";
  v8[0] = &unk_1F291AA80;
  v8[1] = &unk_1F291A8E8;
  v9[2] = @"recentEventHolidayMemoriesCount";
  v9[3] = @"recentEventCalendarMemoriesCount";
  v8[2] = &unk_1F291A900;
  v8[3] = &unk_1F291AA98;
  v8[4] = &unk_1F291A918;
  v8[5] = &unk_1F291A7E0;
  v9[4] = @"recentEventBreakOutOfRoutineMemoriesCount";
  v9[5] = @"recentEventCrowdMemoriesCount";
  v8[6] = &unk_1F291A9A8;
  v8[7] = &unk_1F291A9C0;
  v9[6] = @"recentEventTripMemoriesCount";
  v9[7] = @"recentEventWeekendMemoriesCount";
  v8[8] = &unk_1F291A828;
  v8[9] = &unk_1F291A840;
  v9[8] = @"recentEventSocialEventMemoriesCount";
  v9[9] = @"recentEventPersonMemoriesCount";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:10];
  v15[20] = v2;
  v14[21] = &unk_1F291A9F0;
  v6[0] = &unk_1F291A8E8;
  v6[1] = &unk_1F291A900;
  v7[0] = @"upcomingEventPeopleMemoriesCount";
  v7[1] = @"upcomingEventHolidayMemoriesCount";
  v6[2] = &unk_1F291AA98;
  v7[2] = @"upcomingEventCalendarMemoriesCount";
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];
  v15[21] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:22];
  uint64_t v5 = (void *)legacyMemoryCategoryValueToDataAggregationKeyLookup_categoryLookupTable;
  legacyMemoryCategoryValueToDataAggregationKeyLookup_categoryLookupTable = v4;
}

+ (id)memoryCategoryValueToDataAggregationKeyLookup
{
  if (memoryCategoryValueToDataAggregationKeyLookup_onceToken != -1) {
    dispatch_once(&memoryCategoryValueToDataAggregationKeyLookup_onceToken, &__block_literal_global_1068);
  }
  v2 = (void *)memoryCategoryValueToDataAggregationKeyLookup_categoryLookupTable;

  return v2;
}

void __65__PHAMetricsHelper_memoryCategoryValueToDataAggregationKeyLookup__block_invoke()
{
  v3[21] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F291A5E8;
  v2[1] = &unk_1F291A600;
  v3[0] = @"personMemoriesCount";
  v3[1] = @"personMemoriesCount";
  v2[2] = &unk_1F291A618;
  v2[3] = &unk_1F291A630;
  v3[2] = @"personMemoriesCount";
  v3[3] = @"socialGroupMemoriesCount";
  v2[4] = &unk_1F291A648;
  v2[5] = &unk_1F291A660;
  v3[4] = @"socialGroupMemoriesCount";
  v3[5] = @"homeAggregationMemoriesCount";
  void v2[6] = &unk_1F291A678;
  v2[7] = &unk_1F291A690;
  v3[6] = @"yearSummaryMemoriesCount";
  void v3[7] = @"foodieMemoriesCount";
  v2[8] = &unk_1F291A6A8;
  v2[9] = &unk_1F291A6C0;
  v3[8] = @"petMemoriesCount";
  v3[9] = @"babyMemoriesCount";
  v2[10] = &unk_1F291A6D8;
  v2[11] = &unk_1F291A6F0;
  v3[10] = @"locationOfInterestMemoriesCount";
  v3[11] = @"regionOfInterestMemoriesCount";
  v2[12] = &unk_1F291A708;
  v2[13] = &unk_1F291A720;
  v3[12] = @"areaOfInterestMemoriesCount";
  v3[13] = @"meaningfulEventMemoriesCount";
  v2[14] = &unk_1F291A738;
  v2[15] = &unk_1F291A750;
  v3[14] = @"meaningfulEventAggregationMemoriesCount";
  v3[15] = @"recurrentTripMemoriesCount";
  v2[16] = &unk_1F291A768;
  v2[17] = &unk_1F291A780;
  v3[16] = @"tripMemoriesCount";
  v3[17] = @"pastSupersetMemoriesCount";
  v2[18] = &unk_1F291A798;
  v2[19] = &unk_1F291A7B0;
  v3[18] = @"seasonInHistoryMemoriesCount";
  v3[19] = @"dayInHistoryMemoriesCount";
  v2[20] = &unk_1F291A7C8;
  v3[20] = @"bestOfPastMemoriesCount";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:21];
  v1 = (void *)memoryCategoryValueToDataAggregationKeyLookup_categoryLookupTable;
  memoryCategoryValueToDataAggregationKeyLookup_categoryLookupTable = v0;
}

@end