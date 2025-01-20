@interface PGInvariantPetFeatureExtractor
+ (id)_labelProcessingForPetNodeSpecies:(unint64_t)a3;
+ (id)_labelsForVersion:(int64_t)a3;
+ (id)_nodeProcessingForVersion:(int64_t)a3 node:(id)a4;
- (PGInvariantPetFeatureExtractor)initWithError:(id *)a3;
- (PGInvariantPetFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4;
@end

@implementation PGInvariantPetFeatureExtractor

- (PGInvariantPetFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4
{
  v6 = [(id)objc_opt_class() _labelsForVersion:a3];
  v7 = +[PGGraphMomentNode petPresentInMoment];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__PGInvariantPetFeatureExtractor_initWithVersion_error___block_invoke;
  v11[3] = &__block_descriptor_40_e38___NSString_24__0__PGGraphPetNode_8__16l;
  v11[4] = a3;
  v10.receiver = self;
  v10.super_class = (Class)PGInvariantPetFeatureExtractor;
  v8 = [(PGGraphFeatureExtractor *)&v10 initWithName:@"InvariantPet" featureNames:v6 relation:v7 labelForTargetBlock:v11];

  return v8;
}

id __56__PGInvariantPetFeatureExtractor_initWithVersion_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[PGInvariantPetFeatureExtractor _nodeProcessingForVersion:*(void *)(a1 + 32) node:a2];
}

- (PGInvariantPetFeatureExtractor)initWithError:(id *)a3
{
  return [(PGInvariantPetFeatureExtractor *)self initWithVersion:1 error:a3];
}

+ (id)_labelProcessingForPetNodeSpecies:(unint64_t)a3
{
  v5 = @"Pet";
  switch(a3)
  {
    case 2uLL:
      v7 = @"_Dog";
LABEL_7:
      v3 = [@"Pet" stringByAppendingString:v7];
      break;
    case 1uLL:
      v7 = @"_Cat";
      goto LABEL_7;
    case 0uLL:
      v3 = @"Pet";
      v6 = @"Pet";
      break;
  }

  return v3;
}

+ (id)_nodeProcessingForVersion:(int64_t)a3 node:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [v6 petSpecies];
  if (a3 == 2)
  {
    v8 = [a1 _labelProcessingForPetNodeSpecies:v7];
  }
  else
  {
    if (a3 != 1) {
      goto LABEL_6;
    }
    v8 = [v6 label];
  }
  a1 = v8;
LABEL_6:

  return a1;
}

+ (id)_labelsForVersion:(int64_t)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (a3 == 2)
  {
    v5 = [a1 _labelProcessingForPetNodeSpecies:0];
    v9[0] = v5;
    id v6 = [a1 _labelProcessingForPetNodeSpecies:1];
    v9[1] = v6;
    uint64_t v7 = [a1 _labelProcessingForPetNodeSpecies:2];
    v9[2] = v7;
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:3];
  }
  else if (a3 == 1)
  {
    v10[0] = @"Pet";
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  }
  else
  {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v3;
}

@end