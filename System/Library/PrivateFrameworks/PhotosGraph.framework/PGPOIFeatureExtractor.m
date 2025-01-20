@interface PGPOIFeatureExtractor
+ (id)_labelForEmptyRelationForVersion:(int64_t)a3;
+ (id)_labelProcessingForVersion:(int64_t)a3 label:(id)a4;
+ (id)_labelsForVersion:(int64_t)a3;
+ (id)_rawLabelsForVersion:(int64_t)a3;
+ (id)prefix;
- (PGPOIFeatureExtractor)initWithError:(id *)a3;
- (PGPOIFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4;
@end

@implementation PGPOIFeatureExtractor

- (PGPOIFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4
{
  v6 = [(id)objc_opt_class() _labelsForVersion:a3];
  v7 = [(id)objc_opt_class() _labelForEmptyRelationForVersion:a3];
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  v9 = [(id)objc_opt_class() _rawLabelsForVersion:a3];
  v10 = [v8 setWithArray:v9];

  v11 = +[PGGraphMomentNode poiOfMoment];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __47__PGPOIFeatureExtractor_initWithVersion_error___block_invoke;
  v16[3] = &unk_1E68E5198;
  id v17 = v10;
  int64_t v18 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PGPOIFeatureExtractor;
  id v12 = v10;
  v13 = [(MARelationCollectionFeatureExtractor *)&v15 initWithName:@"POI" featureNames:v6 relation:v11 labelForEmptyRelation:v7 labelForTargetBlock:v16];

  return v13;
}

id __47__PGPOIFeatureExtractor_initWithVersion_error___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 label];
  if (([*(id *)(a1 + 32) containsObject:v3] & 1) == 0)
  {
    v4 = @"None";

    v3 = @"None";
  }
  v5 = +[PGPOIFeatureExtractor _labelProcessingForVersion:*(void *)(a1 + 40) label:v3];

  return v5;
}

- (PGPOIFeatureExtractor)initWithError:(id *)a3
{
  return [(PGPOIFeatureExtractor *)self initWithVersion:1 error:a3];
}

+ (id)_labelForEmptyRelationForVersion:(int64_t)a3
{
  if (a3 == 3)
  {
    v4 = @"None";
    v5 = @"None";
    v6 = [a1 _labelProcessingForVersion:3 label:@"None"];
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }

  return v6;
}

+ (id)_labelProcessingForVersion:(int64_t)a3 label:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if ((unint64_t)(a3 - 2) >= 2)
  {
    if (a3 == 1) {
      v10 = (__CFString *)v6;
    }
    else {
      v10 = @"unknown";
    }
  }
  else
  {
    v8 = NSString;
    v9 = [a1 prefix];
    v10 = [v8 stringWithFormat:@"%@_%@", v9, v7];
  }
  return v10;
}

+ (id)_labelsForVersion:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend(a1, "_rawLabelsForVersion:");
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
        id v12 = objc_msgSend(a1, "_labelProcessingForVersion:label:", a3, *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        [v6 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v6;
}

+ (id)_rawLabelsForVersion:(int64_t)a3
{
  v22[16] = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(a3 - 1) < 2)
  {
    uint64_t v3 = *MEMORY[0x1E4F76B18];
    v22[0] = *MEMORY[0x1E4F76B30];
    v22[1] = v3;
    uint64_t v4 = *MEMORY[0x1E4F76B48];
    v22[2] = *MEMORY[0x1E4F76B38];
    v22[3] = v4;
    uint64_t v5 = *MEMORY[0x1E4F76B10];
    v22[4] = *MEMORY[0x1E4F76AE0];
    v22[5] = v5;
    uint64_t v6 = *MEMORY[0x1E4F76AD8];
    v22[6] = *MEMORY[0x1E4F76AF0];
    v22[7] = v6;
    uint64_t v7 = *MEMORY[0x1E4F76B28];
    v22[8] = *MEMORY[0x1E4F76B20];
    v22[9] = v7;
    uint64_t v8 = *MEMORY[0x1E4F76AD0];
    v22[10] = *MEMORY[0x1E4F76B40];
    v22[11] = v8;
    uint64_t v9 = *MEMORY[0x1E4F76B00];
    v22[12] = *MEMORY[0x1E4F76AE8];
    v22[13] = v9;
    uint64_t v10 = *MEMORY[0x1E4F76B08];
    v22[14] = *MEMORY[0x1E4F76AF8];
    v22[15] = v10;
    v11 = (void *)MEMORY[0x1E4F1C978];
    id v12 = v22;
    uint64_t v13 = 16;
LABEL_5:
    uint64_t v19 = [v11 arrayWithObjects:v12 count:v13];
    goto LABEL_7;
  }
  if (a3 == 3)
  {
    uint64_t v14 = *MEMORY[0x1E4F76B18];
    v21[0] = *MEMORY[0x1E4F76B30];
    v21[1] = v14;
    uint64_t v15 = *MEMORY[0x1E4F76AE0];
    v21[2] = *MEMORY[0x1E4F76B48];
    v21[3] = v15;
    uint64_t v16 = *MEMORY[0x1E4F76AF0];
    v21[4] = *MEMORY[0x1E4F76B10];
    v21[5] = v16;
    uint64_t v17 = *MEMORY[0x1E4F76B20];
    v21[6] = *MEMORY[0x1E4F76AD8];
    v21[7] = v17;
    uint64_t v18 = *MEMORY[0x1E4F76AD0];
    v21[8] = *MEMORY[0x1E4F76B40];
    v21[9] = v18;
    v21[10] = *MEMORY[0x1E4F76B00];
    v21[11] = @"None";
    v11 = (void *)MEMORY[0x1E4F1C978];
    id v12 = v21;
    uint64_t v13 = 12;
    goto LABEL_5;
  }
  uint64_t v19 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_7:
  return v19;
}

+ (id)prefix
{
  return @"POI";
}

@end