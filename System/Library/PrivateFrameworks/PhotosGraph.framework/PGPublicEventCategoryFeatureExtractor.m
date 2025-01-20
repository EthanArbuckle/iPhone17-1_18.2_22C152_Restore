@interface PGPublicEventCategoryFeatureExtractor
+ (id)_labelProcessingForVersion:(int64_t)a3 label:(id)a4;
+ (id)_processedLabelsForVersion:(int64_t)a3;
+ (id)_rawLabelsForVersion:(int64_t)a3;
+ (id)prefix;
- (PGPublicEventCategoryFeatureExtractor)initWithError:(id *)a3;
- (PGPublicEventCategoryFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4;
@end

@implementation PGPublicEventCategoryFeatureExtractor

- (PGPublicEventCategoryFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4
{
  v23[2] = *MEMORY[0x1E4F143B8];
  v6 = [(id)objc_opt_class() _processedLabelsForVersion:a3];
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  v8 = [(id)objc_opt_class() _rawLabelsForVersion:a3];
  v9 = [v7 setWithArray:v8];

  v10 = (void *)MEMORY[0x1E4F71F18];
  v11 = +[PGGraphMomentNode publicEventOfMoment];
  v23[0] = v11;
  v12 = +[PGGraphPublicEventNode categoryOfPublicEvent];
  v23[1] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  v14 = [v10 chain:v13];

  v15 = [(id)objc_opt_class() _labelProcessingForVersion:a3 label:@"None"];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __63__PGPublicEventCategoryFeatureExtractor_initWithVersion_error___block_invoke;
  v20[3] = &unk_1E68E5918;
  id v21 = v9;
  int64_t v22 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PGPublicEventCategoryFeatureExtractor;
  id v16 = v9;
  v17 = [(MARelationCollectionFeatureExtractor *)&v19 initWithName:@"PublicEventCategory" featureNames:v6 relation:v14 labelForEmptyRelation:v15 labelForTargetBlock:v20];

  return v17;
}

id __63__PGPublicEventCategoryFeatureExtractor_initWithVersion_error___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 label];
  if (([*(id *)(a1 + 32) containsObject:v3] & 1) == 0)
  {
    v4 = @"None";

    v3 = @"None";
  }
  v5 = +[PGPublicEventCategoryFeatureExtractor _labelProcessingForVersion:*(void *)(a1 + 40) label:v3];

  return v5;
}

- (PGPublicEventCategoryFeatureExtractor)initWithError:(id *)a3
{
  return [(PGPublicEventCategoryFeatureExtractor *)self initWithVersion:1 error:a3];
}

+ (id)_labelProcessingForVersion:(int64_t)a3 label:(id)a4
{
  id v5 = a4;
  v6 = @"None";
  v7 = @"None";
  if ((unint64_t)(a3 - 2) >= 2)
  {
    if (a3 != 1) {
      goto LABEL_6;
    }
    v6 = (__CFString *)v5;
    v8 = @"None";
  }
  else
  {
    v8 = [v5 stringByReplacingOccurrencesOfString:@"GEOSpatialEventLookupCategory" withString:&stru_1F283BC78];
    v9 = NSString;
    v10 = [(id)objc_opt_class() prefix];
    v6 = [v9 stringWithFormat:@"%@_%@", v10, v8];
  }
LABEL_6:

  return v6;
}

+ (id)_rawLabelsForVersion:(int64_t)a3
{
  v5[8] = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(a3 - 1) >= 2)
  {
    if (a3 == 3)
    {
      v5[0] = @"GEOSpatialEventLookupCategoryArtsAndMuseums";
      v5[1] = @"GEOSpatialEventLookupCategoryDance";
      v5[2] = @"GEOSpatialEventLookupCategoryFestivalsAndFairs";
      v5[3] = @"GEOSpatialEventLookupCategoryMusicConcerts";
      v5[4] = @"GEOSpatialEventLookupCategoryNightLife";
      v5[5] = @"GEOSpatialEventLookupCategorySports";
      v5[6] = @"GEOSpatialEventLookupCategoryTheater";
      v5[7] = @"None";
      v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:8];
    }
    else
    {
      v3 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    v3 = &unk_1F28D39F0;
  }
  return v3;
}

+ (id)_processedLabelsForVersion:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend(a1, "_rawLabelsForVersion:");
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = objc_msgSend(a1, "_labelProcessingForVersion:label:", a3, *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        [v6 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v6;
}

+ (id)prefix
{
  return @"PublicEvent";
}

@end