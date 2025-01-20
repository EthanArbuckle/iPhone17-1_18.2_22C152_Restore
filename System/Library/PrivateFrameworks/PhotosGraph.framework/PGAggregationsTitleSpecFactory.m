@interface PGAggregationsTitleSpecFactory
+ (id)_buildSpecCollectionForMeaningLabel:(id)a3 withSpecDefinition:(id)a4 features:(id)a5;
+ (id)_featureTypesFromFeatureKey:(id)a3;
+ (id)_specCollectionForBirthday;
+ (id)_specCollectionForGathering;
+ (id)_specDefinitionForActivity;
+ (id)_specDefinitionForBeaching;
+ (id)_specDefinitionForBreakfast;
+ (id)_specDefinitionForClimbing;
+ (id)_specDefinitionForDinner;
+ (id)_specDefinitionForDiving;
+ (id)_specDefinitionForEntertainment;
+ (id)_specDefinitionForHiking;
+ (id)_specDefinitionForLunch;
+ (id)_specDefinitionForNightOut;
+ (id)_specDefinitionForPerformance;
+ (id)_specDefinitionForSportEvent;
+ (id)_specDefinitionForWinterSport;
+ (id)specCollectionForMeaningLabel:(id)a3;
+ (id)specCollectionForMeaningLabel:(id)a3 features:(id)a4;
@end

@implementation PGAggregationsTitleSpecFactory

+ (id)_buildSpecCollectionForMeaningLabel:(id)a3 withSpecDefinition:(id)a4 features:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    id v28 = a1;
    v10 = [MEMORY[0x1E4F1CA48] array];
    v11 = [MEMORY[0x1E4F1CA48] array];
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v29 = v9;
    id v13 = v9;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v39 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * i), "type"));
          [v12 addObject:v18];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v15);
    }

    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __98__PGAggregationsTitleSpecFactory__buildSpecCollectionForMeaningLabel_withSpecDefinition_features___block_invoke;
    v31[3] = &unk_1E68E56D8;
    id v32 = v12;
    id v37 = v28;
    id v33 = v8;
    v19 = v30;
    id v34 = v30;
    id v35 = v11;
    id v36 = v10;
    id v20 = v10;
    id v21 = v11;
    id v22 = v12;
    [v33 enumerateKeysAndObjectsUsingBlock:v31];
    v23 = +[PGTitleSpecPool poolWithSpecs:v20];
    v24 = +[PGTitleSpecPool poolWithSpecs:v21];
    v42[0] = v23;
    v42[1] = v24;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
    v26 = +[PGTitleSpecCollection collectionWithSpecPools:v25];

    id v9 = v29;
  }
  else
  {
    v26 = 0;
    v19 = v30;
  }

  return v26;
}

void __98__PGAggregationsTitleSpecFactory__buildSpecCollectionForMeaningLabel_withSpecDefinition_features___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  unint64_t v35 = [a3 unsignedIntegerValue];
  v6 = (__CFString *)v5;
  char v34 = [(__CFString *)v6 isEqualToString:@"none"];
  int v7 = [(__CFString *)v6 isEqualToString:@"LocationIncludingAOI"];
  int v8 = [(__CFString *)v6 isEqualToString:@"LocationIncludingLineBreak"];
  unsigned int v33 = v7 | v8;
  if ((v7 | v8) & 1) != 0 || ([(__CFString *)v6 isEqualToString:@"Location"])
  {
    int v9 = 1;
    int v31 = 1;
  }
  else
  {
    int v31 = [(__CFString *)v6 isEqualToString:@"Person"];
    int v9 = 0;
  }
  v10 = *(void **)(a1 + 32);
  v11 = [*(id *)(a1 + 72) _featureTypesFromFeatureKey:v6];
  int v12 = [v10 intersectsSet:v11];

  id v30 = v6;
  if (!v9)
  {
    if ([(__CFString *)v6 isEqualToString:@"Person"])
    {
      uint64_t v16 = 0;
    }
    else if ([(__CFString *)v6 isEqualToString:@"Family"])
    {
      uint64_t v16 = 3;
    }
    else
    {
      if (![(__CFString *)v6 isEqualToString:@"SocialGroup"])
      {
        id v21 = 0;
        goto LABEL_20;
      }
      uint64_t v16 = 1;
    }
    id v21 = +[PGTitleSpecPeopleArgument argumentWithPeopleType:v16];
LABEL_20:
    unint64_t v14 = 0;
    id v32 = v6;
    goto LABEL_21;
  }
  if (v7)
  {
    id v13 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"Location"];
    unint64_t v14 = [v13 unsignedIntegerValue];

    v35 += v14;
    uint64_t v15 = 21;
  }
  else
  {
    if (v8)
    {
      v17 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"Location"];
      uint64_t v18 = [v17 unsignedIntegerValue];

      v19 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"LocationIncludingAOI"];
      uint64_t v20 = [v19 unsignedIntegerValue];

      unint64_t v14 = v20 + v18;
      v35 += v14;
    }
    else
    {
      unint64_t v14 = 0;
    }
    uint64_t v15 = 17;
  }

  id v21 = +[PGTitleSpecLocationArgument argumentWithLocationType:v15 filterLocations:0];
  id v32 = @"Location";
LABEL_21:
  if (v14 < v35)
  {
    if (v12) {
      uint64_t v22 = 64;
    }
    else {
      uint64_t v22 = 56;
    }
    do
    {
      if (v34)
      {
        v23 = [NSString stringWithFormat:@"PGMeaningfulEventAggregationMemoryTitleType%@%lu", *(void *)(a1 + 48), v14];
      }
      else
      {
        v24 = [NSString stringWithFormat:@"PGMeaningfulEventAggregationMemoryTitleType%@%luWith%@", *(void *)(a1 + 48), v14, v32, v30];
        v23 = v24;
        if (v31)
        {
          uint64_t v25 = [v24 stringByAppendingString:@" %@"];

          v23 = (void *)v25;
        }
      }
      v26 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v27 = [v26 localizedStringForKey:v23 value:v23 table:@"Localizable"];

      id v28 = [[PGTitleSpec alloc] initWithFormat:v27 titleCategory:0];
      [(PGTitleSpec *)v28 setHasLineBreak:v33];
      if (v21)
      {
        v36[0] = v21;
        id v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
        [(PGTitleSpec *)v28 setArguments:v29];
      }
      [*(id *)(a1 + v22) addObject:v28];

      ++v14;
    }
    while (v35 != v14);
  }
}

+ (id)_featureTypesFromFeatureKey:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  int v5 = [v3 isEqualToString:@"LocationIncludingAOI"];
  if (([v3 isEqualToString:@"Location"] & 1) != 0
    || ([v3 isEqualToString:@"LocationIncludingLineBreak"] | v5) == 1)
  {
    [v4 addObject:&unk_1F28D0870];
    [v4 addObject:&unk_1F28D0888];
    if ((v5 & 1) == 0) {
      goto LABEL_11;
    }
    v6 = &unk_1F28D08A0;
    goto LABEL_10;
  }
  if ([v3 isEqualToString:@"Person"])
  {
    v6 = &unk_1F28D08B8;
LABEL_10:
    [v4 addObject:v6];
    goto LABEL_11;
  }
  if (([v3 isEqualToString:@"Family"] & 1) != 0
    || [v3 isEqualToString:@"SocialGroup"])
  {
    v6 = &unk_1F28D08D0;
    goto LABEL_10;
  }
LABEL_11:

  return v4;
}

+ (id)_specCollectionForGathering
{
  v23[1] = *MEMORY[0x1E4F143B8];
  v2 = [PGTitleSpec alloc];
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"PGMeaningfulEventAggregationMemoryTitleTypeGatheringWithLocation %@" value:@"PGMeaningfulEventAggregationMemoryTitleTypeGatheringWithLocation %@" table:@"Localizable"];
  int v5 = [(PGTitleSpec *)v2 initWithFormat:v4 titleCategory:4];

  v6 = +[PGTitleSpecLocationArgument argumentWithLocationType:1 filterLocations:0];
  v23[0] = v6;
  int v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  [(PGTitleSpec *)v5 setArguments:v7];

  int v8 = [PGTitleSpec alloc];
  int v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"PGMeaningfulEventAggregationMemoryTitleTypeFamilyGatheringWithLocation %@" value:@"PGMeaningfulEventAggregationMemoryTitleTypeFamilyGatheringWithLocation %@" table:@"Localizable"];
  v11 = [(PGTitleSpec *)v8 initWithFormat:v10 titleCategory:4];

  int v12 = +[PGTitleSpecLocationArgument argumentWithLocationType:1 filterLocations:0];
  v22[0] = v12;
  id v13 = +[PGTitleSpecPeopleArgument argumentWithPeopleType:3];
  v22[1] = v13;
  unint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  [(PGTitleSpec *)v11 setArguments:v14];

  v21[0] = v5;
  v21[1] = v11;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  uint64_t v16 = +[PGTitleSpecPool poolWithSpecs:v15];

  uint64_t v20 = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  uint64_t v18 = +[PGTitleSpecCollection collectionWithSpecPools:v17];

  return v18;
}

+ (id)_specDefinitionForDinner
{
  v5[4] = *MEMORY[0x1E4F143B8];
  v4[0] = @"Location";
  v4[1] = @"Person";
  v5[0] = &unk_1F28D0858;
  v5[1] = &unk_1F28D0858;
  v4[2] = @"SocialGroup";
  v4[3] = @"Family";
  v5[2] = &unk_1F28D0858;
  v5[3] = &unk_1F28D0858;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:4];
  return v2;
}

+ (id)_specDefinitionForLunch
{
  v5[4] = *MEMORY[0x1E4F143B8];
  v4[0] = @"Location";
  v4[1] = @"Person";
  v5[0] = &unk_1F28D0858;
  v5[1] = &unk_1F28D0858;
  v4[2] = @"SocialGroup";
  v4[3] = @"Family";
  v5[2] = &unk_1F28D0858;
  v5[3] = &unk_1F28D0858;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:4];
  return v2;
}

+ (id)_specDefinitionForBreakfast
{
  v5[4] = *MEMORY[0x1E4F143B8];
  v4[0] = @"Location";
  v4[1] = @"Person";
  v5[0] = &unk_1F28D0858;
  v5[1] = &unk_1F28D0858;
  v4[2] = @"SocialGroup";
  v4[3] = @"Family";
  v5[2] = &unk_1F28D0858;
  v5[3] = &unk_1F28D0858;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:4];
  return v2;
}

+ (id)_specDefinitionForClimbing
{
  v5[4] = *MEMORY[0x1E4F143B8];
  v4[0] = @"none";
  v4[1] = @"LocationIncludingAOI";
  v5[0] = &unk_1F28D0858;
  v5[1] = &unk_1F28D0858;
  v4[2] = @"Person";
  v4[3] = @"SocialGroup";
  v5[2] = &unk_1F28D0858;
  v5[3] = &unk_1F28D0858;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:4];
  return v2;
}

+ (id)_specDefinitionForWinterSport
{
  void v5[5] = *MEMORY[0x1E4F143B8];
  v4[0] = @"none";
  v4[1] = @"LocationIncludingAOI";
  v5[0] = &unk_1F28D0828;
  v5[1] = &unk_1F28D0828;
  v4[2] = @"Person";
  v4[3] = @"SocialGroup";
  v5[2] = &unk_1F28D0828;
  v5[3] = &unk_1F28D0828;
  void v4[4] = @"Family";
  v5[4] = &unk_1F28D0828;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:5];
  return v2;
}

+ (id)_specDefinitionForHiking
{
  void v5[5] = *MEMORY[0x1E4F143B8];
  v4[0] = @"none";
  v4[1] = @"LocationIncludingAOI";
  v5[0] = &unk_1F28D0858;
  v5[1] = &unk_1F28D0858;
  v4[2] = @"Person";
  v4[3] = @"SocialGroup";
  v5[2] = &unk_1F28D0858;
  v5[3] = &unk_1F28D0858;
  void v4[4] = @"Family";
  v5[4] = &unk_1F28D0858;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:5];
  return v2;
}

+ (id)_specDefinitionForDiving
{
  v5[4] = *MEMORY[0x1E4F143B8];
  v4[0] = @"none";
  v4[1] = @"LocationIncludingAOI";
  v5[0] = &unk_1F28D0828;
  v5[1] = &unk_1F28D0828;
  v4[2] = @"Person";
  v4[3] = @"SocialGroup";
  v5[2] = &unk_1F28D0828;
  v5[3] = &unk_1F28D0828;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:4];
  return v2;
}

+ (id)_specDefinitionForBeaching
{
  void v5[5] = *MEMORY[0x1E4F143B8];
  v4[0] = @"none";
  v4[1] = @"LocationIncludingLineBreak";
  v5[0] = &unk_1F28D0828;
  v5[1] = &unk_1F28D0828;
  v4[2] = @"Person";
  v4[3] = @"SocialGroup";
  v5[2] = &unk_1F28D0828;
  v5[3] = &unk_1F28D0828;
  void v4[4] = @"Family";
  v5[4] = &unk_1F28D0858;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:5];
  return v2;
}

+ (id)_specDefinitionForActivity
{
  void v5[5] = *MEMORY[0x1E4F143B8];
  v4[0] = @"none";
  v4[1] = @"LocationIncludingLineBreak";
  v5[0] = &unk_1F28D0828;
  v5[1] = &unk_1F28D0828;
  v4[2] = @"Person";
  v4[3] = @"SocialGroup";
  v5[2] = &unk_1F28D0828;
  v5[3] = &unk_1F28D0828;
  void v4[4] = @"Family";
  v5[4] = &unk_1F28D0828;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:5];
  return v2;
}

+ (id)_specDefinitionForPerformance
{
  v5[4] = *MEMORY[0x1E4F143B8];
  v4[0] = @"LocationIncludingLineBreak";
  v4[1] = @"Person";
  v5[0] = &unk_1F28D0858;
  v5[1] = &unk_1F28D0858;
  v4[2] = @"SocialGroup";
  v4[3] = @"Family";
  v5[2] = &unk_1F28D0858;
  v5[3] = &unk_1F28D0858;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:4];
  return v2;
}

+ (id)_specDefinitionForSportEvent
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"LocationIncludingAOI";
  v4[1] = @"Person";
  v5[0] = &unk_1F28D0858;
  v5[1] = &unk_1F28D0828;
  v4[2] = @"SocialGroup";
  v5[2] = &unk_1F28D0858;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
  return v2;
}

+ (id)_specDefinitionForNightOut
{
  void v5[4] = *MEMORY[0x1E4F143B8];
  v4[0] = @"Location";
  v4[1] = @"Person";
  v5[0] = &unk_1F28D0828;
  v5[1] = &unk_1F28D0858;
  v4[2] = @"SocialGroup";
  void v4[3] = @"Family";
  v5[2] = &unk_1F28D0858;
  v5[3] = &unk_1F28D0858;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:4];
  return v2;
}

+ (id)_specDefinitionForEntertainment
{
  void v5[4] = *MEMORY[0x1E4F143B8];
  v4[0] = @"LocationIncludingAOI";
  v4[1] = @"Person";
  v5[0] = &unk_1F28D0828;
  v5[1] = &unk_1F28D0840;
  v4[2] = @"SocialGroup";
  void v4[3] = @"Family";
  v5[2] = &unk_1F28D0828;
  v5[3] = &unk_1F28D0828;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:4];
  return v2;
}

+ (id)_specCollectionForBirthday
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v2 = [PGTitleSpec alloc];
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"PGMeaningfulEventAggregationMemoryTitleTypeBirthdayWithPerson %@" value:@"PGMeaningfulEventAggregationMemoryTitleTypeBirthdayWithPerson %@" table:@"Localizable"];
  int v5 = [(PGTitleSpec *)v2 initWithFormat:v4 titleCategory:3];

  v6 = +[PGTitleSpecPeopleArgument argumentWithPeopleType:4];
  v15[0] = v6;
  int v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  [(PGTitleSpec *)v5 setArguments:v7];

  unint64_t v14 = v5;
  int v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  int v9 = +[PGTitleSpecPool poolWithSpecs:v8];

  id v13 = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  v11 = +[PGTitleSpecCollection collectionWithSpecPools:v10];

  return v11;
}

+ (id)specCollectionForMeaningLabel:(id)a3 features:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"Birthday"])
  {
    uint64_t v8 = [a1 _specCollectionForBirthday];
    goto LABEL_3;
  }
  if ([v6 isEqualToString:@"Entertainment"])
  {
    uint64_t v11 = [a1 _specDefinitionForEntertainment];
LABEL_31:
    v10 = (void *)v11;
    goto LABEL_32;
  }
  if ([v6 isEqualToString:@"NightOut"])
  {
    uint64_t v11 = [a1 _specDefinitionForNightOut];
    goto LABEL_31;
  }
  if ([v6 isEqualToString:@"SportEvent"])
  {
    uint64_t v11 = [a1 _specDefinitionForSportEvent];
    goto LABEL_31;
  }
  if ([v6 isEqualToString:@"Performance"])
  {
    uint64_t v11 = [a1 _specDefinitionForPerformance];
    goto LABEL_31;
  }
  if ([v6 isEqualToString:@"Activity"])
  {
    uint64_t v11 = [a1 _specDefinitionForActivity];
    goto LABEL_31;
  }
  if ([v6 isEqualToString:@"WinterSport"])
  {
    uint64_t v11 = [a1 _specDefinitionForWinterSport];
    goto LABEL_31;
  }
  if ([v6 isEqualToString:@"Beaching"])
  {
    uint64_t v11 = [a1 _specDefinitionForBeaching];
    goto LABEL_31;
  }
  if ([v6 isEqualToString:@"Hiking"])
  {
    uint64_t v11 = [a1 _specDefinitionForHiking];
    goto LABEL_31;
  }
  if ([v6 isEqualToString:@"Diving"])
  {
    uint64_t v11 = [a1 _specDefinitionForDiving];
    goto LABEL_31;
  }
  if ([v6 isEqualToString:@"Climbing"])
  {
    uint64_t v11 = [a1 _specDefinitionForClimbing];
    goto LABEL_31;
  }
  if ([v6 isEqualToString:@"Breakfast"])
  {
    uint64_t v11 = [a1 _specDefinitionForBreakfast];
    goto LABEL_31;
  }
  if ([v6 isEqualToString:@"Lunch"])
  {
    uint64_t v11 = [a1 _specDefinitionForLunch];
    goto LABEL_31;
  }
  if ([v6 isEqualToString:@"Dinner"])
  {
    uint64_t v11 = [a1 _specDefinitionForDinner];
    goto LABEL_31;
  }
  if ([v6 isEqualToString:@"Gathering"])
  {
    uint64_t v8 = [a1 _specCollectionForGathering];
LABEL_3:
    int v9 = (void *)v8;
    if (v8) {
      goto LABEL_33;
    }
    goto LABEL_4;
  }
  id v13 = +[PGLogging sharedLogging];
  unint64_t v14 = [v13 loggingConnection];

  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    int v15 = 138412290;
    id v16 = v6;
    _os_log_impl(&dword_1D1805000, v14, OS_LOG_TYPE_INFO, "No spec definition for %@", (uint8_t *)&v15, 0xCu);
  }

LABEL_4:
  v10 = 0;
LABEL_32:
  int v9 = [a1 _buildSpecCollectionForMeaningLabel:v6 withSpecDefinition:v10 features:v7];

LABEL_33:
  return v9;
}

+ (id)specCollectionForMeaningLabel:(id)a3
{
  return (id)[a1 specCollectionForMeaningLabel:a3 features:0];
}

@end