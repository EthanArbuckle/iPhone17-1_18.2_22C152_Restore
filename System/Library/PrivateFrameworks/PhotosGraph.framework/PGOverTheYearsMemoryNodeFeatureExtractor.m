@interface PGOverTheYearsMemoryNodeFeatureExtractor
- (PGOverTheYearsMemoryNodeFeatureExtractor)initWithError:(id *)a3;
- (PGOverTheYearsMemoryNodeFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4;
@end

@implementation PGOverTheYearsMemoryNodeFeatureExtractor

- (PGOverTheYearsMemoryNodeFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v15[0] = @"OverTheYears";
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  v6 = (void *)MEMORY[0x1E4F71F18];
  v7 = +[PGGraphOverTheYearsNode filter];
  v8 = [v7 relation];
  v14 = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  v10 = [v6 chain:v9];

  v13.receiver = self;
  v13.super_class = (Class)PGOverTheYearsMemoryNodeFeatureExtractor;
  v11 = [(PGGraphMemoryNodeFeatureExtractor *)&v13 initWithName:@"OverTheYears" featureNames:v5 relation:v10 labelForTargetBlock:&__block_literal_global_34509];

  return v11;
}

uint64_t __66__PGOverTheYearsMemoryNodeFeatureExtractor_initWithVersion_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 label];
}

- (PGOverTheYearsMemoryNodeFeatureExtractor)initWithError:(id *)a3
{
  return [(PGOverTheYearsMemoryNodeFeatureExtractor *)self initWithVersion:1 error:a3];
}

@end