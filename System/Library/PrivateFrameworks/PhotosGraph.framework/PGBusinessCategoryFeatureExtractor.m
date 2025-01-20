@interface PGBusinessCategoryFeatureExtractor
+ (id)_labelProcessingForVersion:(int64_t)a3 label:(id)a4;
+ (id)_labelsForVersion:(int64_t)a3;
+ (id)prefix;
- (PGBusinessCategoryFeatureExtractor)initWithError:(id *)a3;
- (PGBusinessCategoryFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4;
@end

@implementation PGBusinessCategoryFeatureExtractor

- (PGBusinessCategoryFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v6 = [(id)objc_opt_class() _labelsForVersion:a3];
  v7 = (void *)MEMORY[0x1E4F71F18];
  v8 = +[PGGraphMomentNode businessOfMoment];
  v16[0] = v8;
  v9 = +[PGGraphBusinessNode categoryOfBusiness];
  v16[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  v11 = [v7 chain:v10];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60__PGBusinessCategoryFeatureExtractor_initWithVersion_error___block_invoke;
  v15[3] = &__block_descriptor_40_e51___NSString_24__0__PGGraphBusinessCategoryNode_8__16l;
  v15[4] = a3;
  v14.receiver = self;
  v14.super_class = (Class)PGBusinessCategoryFeatureExtractor;
  v12 = [(PGGraphFeatureExtractor *)&v14 initWithName:@"Business Category" featureNames:v6 relation:v11 labelForTargetBlock:v15];

  return v12;
}

id __60__PGBusinessCategoryFeatureExtractor_initWithVersion_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = [a2 label];
  v4 = +[PGBusinessCategoryFeatureExtractor _labelProcessingForVersion:v2 label:v3];

  return v4;
}

- (PGBusinessCategoryFeatureExtractor)initWithError:(id *)a3
{
  return [(PGBusinessCategoryFeatureExtractor *)self initWithVersion:1 error:a3];
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
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(a3 - 1) >= 2) {
    v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else {
    v5 = &unk_1F28D4BF0;
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = [a1 _labelProcessingForVersion:a3 label:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        [v6 addObject:v11];
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  return v6;
}

+ (id)prefix
{
  return @"Business";
}

@end