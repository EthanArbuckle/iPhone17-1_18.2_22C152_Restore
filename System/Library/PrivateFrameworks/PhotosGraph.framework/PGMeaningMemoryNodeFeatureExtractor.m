@interface PGMeaningMemoryNodeFeatureExtractor
+ (id)_labelProcessingForVersion:(int64_t)a3 label:(id)a4;
+ (id)_labelsForVersion:(int64_t)a3;
+ (id)name;
+ (id)prefix;
- (PGMeaningMemoryNodeFeatureExtractor)initWithError:(id *)a3;
- (PGMeaningMemoryNodeFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4;
@end

@implementation PGMeaningMemoryNodeFeatureExtractor

- (PGMeaningMemoryNodeFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v6 = [(id)objc_opt_class() _labelsForVersion:a3];
  v7 = (void *)MEMORY[0x1E4F71F18];
  v8 = +[PGGraphMeaningNode filter];
  v9 = [v8 relation];
  v17[0] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  v11 = [v7 chain:v10];

  v12 = +[PGMeaningMemoryNodeFeatureExtractor name];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __61__PGMeaningMemoryNodeFeatureExtractor_initWithVersion_error___block_invoke;
  v16[3] = &__block_descriptor_40_e42___NSString_24__0__PGGraphMeaningNode_8__16l;
  v16[4] = a3;
  v15.receiver = self;
  v15.super_class = (Class)PGMeaningMemoryNodeFeatureExtractor;
  v13 = [(PGGraphMemoryNodeFeatureExtractor *)&v15 initWithName:v12 featureNames:v6 relation:v11 labelForTargetBlock:v16];

  return v13;
}

id __61__PGMeaningMemoryNodeFeatureExtractor_initWithVersion_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = [a2 label];
  v4 = +[PGMeaningMemoryNodeFeatureExtractor _labelProcessingForVersion:v2 label:v3];

  return v4;
}

- (PGMeaningMemoryNodeFeatureExtractor)initWithError:(id *)a3
{
  return [(PGMeaningMemoryNodeFeatureExtractor *)self initWithVersion:1 error:a3];
}

+ (id)_labelProcessingForVersion:(int64_t)a3 label:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (a3 == 2)
  {
    v9 = NSString;
    v10 = [a1 prefix];
    v8 = [v9 stringWithFormat:@"%@_%@", v10, v7];
  }
  else if (a3 == 1)
  {
    v8 = (__CFString *)v6;
  }
  else
  {
    v8 = @"unknown";
  }

  return v8;
}

+ (id)_labelsForVersion:(int64_t)a3
{
  v23[19] = *MEMORY[0x1E4F143B8];
  if (a3 == 2)
  {
    v22[0] = @"Activity";
    v22[1] = @"Hiking";
    v22[2] = @"Climbing";
    v22[3] = @"Beaching";
    v22[4] = @"Diving";
    v22[5] = @"WinterSport";
    v22[6] = @"Entertainment";
    v22[7] = @"AmusementPark";
    v22[8] = @"Performance";
    v22[9] = @"Concert";
    v22[10] = @"Festival";
    v22[11] = @"Theater";
    v22[12] = @"Dance";
    v22[13] = @"SportEvent";
    v22[14] = @"NightOut";
    v22[15] = @"Museum";
    v22[16] = @"Celebration";
    v22[17] = @"Birthday";
    v22[18] = @"Anniversary";
    v22[19] = @"Wedding";
    v22[20] = @"HolidayEvent";
    v22[21] = @"Gathering";
    v22[22] = @"Restaurant";
    v22[23] = @"Breakfast";
    v22[24] = @"Lunch";
    v22[25] = @"Dinner";
    v5 = (void *)MEMORY[0x1E4F1C978];
    id v6 = v22;
    uint64_t v7 = 26;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v23[0] = @"Activity";
    v23[1] = @"Beaching";
    v23[2] = @"Birthday";
    v23[3] = @"Breakfast";
    v23[4] = @"Celebration";
    v23[5] = @"Concert";
    v23[6] = @"Dinner";
    v23[7] = @"Entertainment";
    v23[8] = @"Gathering";
    v23[9] = @"Hiking";
    v23[10] = @"HolidayEvent";
    v23[11] = @"Lunch";
    v23[12] = @"Museum";
    v23[13] = @"NightOut";
    v23[14] = @"Performance";
    v23[15] = @"Restaurant";
    v23[16] = @"SportEvent";
    v23[17] = @"Theater";
    v23[18] = @"WinterSport";
    v5 = (void *)MEMORY[0x1E4F1C978];
    id v6 = v23;
    uint64_t v7 = 19;
LABEL_5:
    v8 = [v5 arrayWithObjects:v6 count:v7];
    goto LABEL_7;
  }
  v8 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_7:
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_super v15 = objc_msgSend(a1, "_labelProcessingForVersion:label:", a3, *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
        [v9 addObject:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return v9;
}

+ (id)prefix
{
  return +[PGMeaningMemoryNodeFeatureExtractor name];
}

+ (id)name
{
  return @"Meaning";
}

@end