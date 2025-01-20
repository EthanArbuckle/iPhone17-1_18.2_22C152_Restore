@interface PGMobilityFeatureExtractor
+ (id)_labelsForVersion:(int64_t)a3;
- (PGMobilityFeatureExtractor)initWithError:(id *)a3;
- (PGMobilityFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4;
@end

@implementation PGMobilityFeatureExtractor

- (PGMobilityFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4
{
  v5 = [(id)objc_opt_class() _labelsForVersion:a3];
  v6 = +[PGGraphMomentNode mobilityOfMoment];
  v9.receiver = self;
  v9.super_class = (Class)PGMobilityFeatureExtractor;
  v7 = [(MARelationCollectionFeatureExtractor *)&v9 initWithName:@"Mobility" featureNames:v5 relation:v6 labelForEmptyRelation:@"None" labelForTargetBlock:&__block_literal_global_59581];

  return v7;
}

uint64_t __52__PGMobilityFeatureExtractor_initWithVersion_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 label];
}

- (PGMobilityFeatureExtractor)initWithError:(id *)a3
{
  return [(PGMobilityFeatureExtractor *)self initWithVersion:1 error:a3];
}

+ (id)_labelsForVersion:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3 == 2)
  {
    uint64_t v8 = *MEMORY[0x1E4F76AA8];
    uint64_t v12 = *MEMORY[0x1E4F76AB8];
    uint64_t v13 = v8;
    uint64_t v9 = *MEMORY[0x1E4F76AC0];
    uint64_t v14 = *MEMORY[0x1E4F76AB0];
    uint64_t v15 = v9;
    v16 = @"None";
    v5 = (void *)MEMORY[0x1E4F1C978];
    v6 = &v12;
    uint64_t v7 = 5;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    uint64_t v3 = *MEMORY[0x1E4F76AA8];
    uint64_t v17 = *MEMORY[0x1E4F76AB8];
    uint64_t v18 = v3;
    uint64_t v4 = *MEMORY[0x1E4F76AC0];
    uint64_t v19 = *MEMORY[0x1E4F76AB0];
    uint64_t v20 = v4;
    v5 = (void *)MEMORY[0x1E4F1C978];
    v6 = &v17;
    uint64_t v7 = 4;
LABEL_5:
    v10 = objc_msgSend(v5, "arrayWithObjects:count:", v6, v7, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21);
    goto LABEL_7;
  }
  v10 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_7:
  return v10;
}

@end