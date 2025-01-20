@interface PGROIFeatureExtractor
+ (id)_labelsForVersion:(int64_t)a3;
- (PGROIFeatureExtractor)initWithError:(id *)a3;
- (PGROIFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4;
@end

@implementation PGROIFeatureExtractor

- (PGROIFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4
{
  v5 = [(id)objc_opt_class() _labelsForVersion:a3];
  v6 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
  v7 = +[PGGraphMomentNode roiOfMoment];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __47__PGROIFeatureExtractor_initWithVersion_error___block_invoke;
  v12[3] = &unk_1E68EA7F0;
  id v13 = v6;
  v11.receiver = self;
  v11.super_class = (Class)PGROIFeatureExtractor;
  id v8 = v6;
  v9 = [(MARelationCollectionFeatureExtractor *)&v11 initWithName:@"ROI" featureNames:v5 relation:v7 labelForEmptyRelation:@"None" labelForTargetBlock:v12];

  return v9;
}

__CFString *__47__PGROIFeatureExtractor_initWithVersion_error___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 label];
  if (([*(id *)(a1 + 32) containsObject:v3] & 1) == 0)
  {
    v4 = @"None";

    v3 = @"None";
  }
  return v3;
}

- (PGROIFeatureExtractor)initWithError:(id *)a3
{
  return [(PGROIFeatureExtractor *)self initWithVersion:1 error:a3];
}

+ (id)_labelsForVersion:(int64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a3 == 2)
  {
    uint64_t v8 = *MEMORY[0x1E4F76B60];
    uint64_t v12 = *MEMORY[0x1E4F76B68];
    uint64_t v13 = v8;
    uint64_t v9 = *MEMORY[0x1E4F76B70];
    uint64_t v14 = *MEMORY[0x1E4F76B78];
    uint64_t v15 = v9;
    uint64_t v16 = *MEMORY[0x1E4F76B58];
    v17 = @"None";
    v5 = (void *)MEMORY[0x1E4F1C978];
    v6 = &v12;
    uint64_t v7 = 6;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    uint64_t v3 = *MEMORY[0x1E4F76B60];
    uint64_t v18 = *MEMORY[0x1E4F76B68];
    uint64_t v19 = v3;
    uint64_t v4 = *MEMORY[0x1E4F76B70];
    uint64_t v20 = *MEMORY[0x1E4F76B78];
    uint64_t v21 = v4;
    uint64_t v22 = *MEMORY[0x1E4F76B58];
    v5 = (void *)MEMORY[0x1E4F1C978];
    v6 = &v18;
    uint64_t v7 = 5;
LABEL_5:
    v10 = objc_msgSend(v5, "arrayWithObjects:count:", v6, v7, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23);
    goto LABEL_7;
  }
  v10 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_7:
  return v10;
}

@end