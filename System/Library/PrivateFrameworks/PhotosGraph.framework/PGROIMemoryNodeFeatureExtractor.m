@interface PGROIMemoryNodeFeatureExtractor
- (PGROIMemoryNodeFeatureExtractor)initWithError:(id *)a3;
@end

@implementation PGROIMemoryNodeFeatureExtractor

- (PGROIMemoryNodeFeatureExtractor)initWithError:(id *)a3
{
  v16[5] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F76B60];
  v16[0] = *MEMORY[0x1E4F76B68];
  v16[1] = v4;
  uint64_t v5 = *MEMORY[0x1E4F76B70];
  v16[2] = *MEMORY[0x1E4F76B78];
  v16[3] = v5;
  v16[4] = *MEMORY[0x1E4F76B58];
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:5];
  v7 = (void *)MEMORY[0x1E4F71F18];
  v8 = +[PGGraphROINode filter];
  v9 = [v8 relation];
  v15 = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  v11 = [v7 chain:v10];

  v14.receiver = self;
  v14.super_class = (Class)PGROIMemoryNodeFeatureExtractor;
  v12 = [(PGGraphMemoryNodeFeatureExtractor *)&v14 initWithName:@"ROI" featureNames:v6 relation:v11 labelForTargetBlock:&__block_literal_global_44683];

  return v12;
}

uint64_t __49__PGROIMemoryNodeFeatureExtractor_initWithError___block_invoke(uint64_t a1, void *a2)
{
  return [a2 label];
}

@end