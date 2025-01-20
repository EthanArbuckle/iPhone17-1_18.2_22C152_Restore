@interface PGSceneMemoryNodeFeatureExtractor
- (PGSceneMemoryNodeFeatureExtractor)initWithError:(id *)a3;
- (PGSceneMemoryNodeFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4;
- (id)labelsForVersion:(int64_t)a3;
@end

@implementation PGSceneMemoryNodeFeatureExtractor

- (id)labelsForVersion:(int64_t)a3
{
  v5[17] = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 1:
      v3 = &unk_1F28D4878;
      break;
    case 2:
      v3 = &unk_1F28D4890;
      break;
    case 3:
      v3 = &unk_1F28D48A8;
      break;
    case 4:
      v5[0] = @"Snow";
      v5[1] = @"SunriseSunset";
      v5[2] = @"Cityscape";
      v5[3] = @"Waterfall";
      v5[4] = @"Rainbow";
      v5[5] = @"Skateboarding";
      v5[6] = @"Forest";
      v5[7] = @"Airplane";
      v5[8] = @"Bird";
      v5[9] = @"Surfing";
      v5[10] = @"Coffee";
      v5[11] = @"Biking";
      v5[12] = @"Table";
      v5[13] = @"Cooking";
      v5[14] = @"SpringBloom";
      v5[15] = @"AutumnFoliage";
      v5[16] = @"PlayTime";
      v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:17];
      break;
    default:
      v3 = (void *)MEMORY[0x1E4F1CBF0];
      break;
  }
  return v3;
}

- (PGSceneMemoryNodeFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v5 = -[PGSceneMemoryNodeFeatureExtractor labelsForVersion:](self, "labelsForVersion:", a3, a4);
  v6 = (void *)MEMORY[0x1E4F71F18];
  v7 = +[PGGraphSceneFeatureNode filter];
  v8 = [v7 relation];
  v14[0] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  v10 = [v6 chain:v9];

  v13.receiver = self;
  v13.super_class = (Class)PGSceneMemoryNodeFeatureExtractor;
  v11 = [(PGGraphMemoryNodeFeatureExtractor *)&v13 initWithName:@"Scene" featureNames:v5 relation:v10 labelForTargetBlock:&__block_literal_global_156];

  return v11;
}

uint64_t __59__PGSceneMemoryNodeFeatureExtractor_initWithVersion_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 label];
}

- (PGSceneMemoryNodeFeatureExtractor)initWithError:(id *)a3
{
  return [(PGSceneMemoryNodeFeatureExtractor *)self initWithVersion:1 error:a3];
}

@end