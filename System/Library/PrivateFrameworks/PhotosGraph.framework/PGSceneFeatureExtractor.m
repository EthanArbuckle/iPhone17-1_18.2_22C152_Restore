@interface PGSceneFeatureExtractor
- (PGSceneFeatureExtractor)initWithError:(id *)a3;
- (PGSceneFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4;
- (id)labelsForVersion:(int64_t)a3;
@end

@implementation PGSceneFeatureExtractor

- (id)labelsForVersion:(int64_t)a3
{
  v5[13] = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 1:
      v3 = &unk_1F28D4830;
      break;
    case 2:
      v3 = &unk_1F28D4848;
      break;
    case 3:
      v3 = &unk_1F28D4860;
      break;
    case 4:
      v5[0] = @"Snow";
      v5[1] = @"Sunset_Sunrise";
      v5[2] = @"Flower";
      v5[3] = @"Cityscape";
      v5[4] = @"Waterfall";
      v5[5] = @"Rainbow";
      v5[6] = @"Skateboarding";
      v5[7] = @"Forest";
      v5[8] = @"Airplane";
      v5[9] = @"Bird";
      v5[10] = @"Surfing";
      v5[11] = @"Baby";
      v5[12] = @"Coffee";
      v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:13];
      break;
    default:
      v3 = (void *)MEMORY[0x1E4F1CBF0];
      break;
  }
  return v3;
}

- (PGSceneFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4
{
  v5 = -[PGSceneFeatureExtractor labelsForVersion:](self, "labelsForVersion:", a3, a4);
  v6 = +[PGGraphMomentNode sceneOfMoment];
  v9.receiver = self;
  v9.super_class = (Class)PGSceneFeatureExtractor;
  v7 = [(PGGraphFeatureExtractor *)&v9 initWithName:@"Scene" featureNames:v5 relation:v6 labelForTargetBlock:&__block_literal_global_58932];

  return v7;
}

uint64_t __49__PGSceneFeatureExtractor_initWithVersion_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 label];
}

- (PGSceneFeatureExtractor)initWithError:(id *)a3
{
  return [(PGSceneFeatureExtractor *)self initWithVersion:1 error:a3];
}

@end