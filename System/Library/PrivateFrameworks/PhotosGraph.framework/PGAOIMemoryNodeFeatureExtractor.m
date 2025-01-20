@interface PGAOIMemoryNodeFeatureExtractor
- (PGAOIMemoryNodeFeatureExtractor)initWithError:(id *)a3;
- (PGAOIMemoryNodeFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4;
@end

@implementation PGAOIMemoryNodeFeatureExtractor

- (PGAOIMemoryNodeFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4
{
  return [(PGAOIMemoryNodeFeatureExtractor *)self initWithError:a4];
}

- (PGAOIMemoryNodeFeatureExtractor)initWithError:(id *)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v14[0] = @"Disney";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  v5 = (void *)MEMORY[0x1E4F71F18];
  v6 = +[PGGraphAreaNode filter];
  v7 = [v6 relation];
  v13 = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  v9 = [v5 chain:v8];

  v12.receiver = self;
  v12.super_class = (Class)PGAOIMemoryNodeFeatureExtractor;
  v10 = [(PGGraphMemoryNodeFeatureExtractor *)&v12 initWithName:@"AOI" featureNames:v4 relation:v9 labelForTargetBlock:&__block_literal_global_63013];

  return v10;
}

uint64_t __49__PGAOIMemoryNodeFeatureExtractor_initWithError___block_invoke(uint64_t a1, void *a2)
{
  return [a2 name];
}

@end