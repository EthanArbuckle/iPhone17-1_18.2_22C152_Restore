@interface PGChildMemoryNodeFeatureExtractor
- (PGChildMemoryNodeFeatureExtractor)initWithError:(id *)a3;
@end

@implementation PGChildMemoryNodeFeatureExtractor

- (PGChildMemoryNodeFeatureExtractor)initWithError:(id *)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v14[0] = @"Child";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  v5 = (void *)MEMORY[0x1E4F71F18];
  v6 = +[PGGraphPersonNode filterForAgeCategories:&unk_1F28D3CF0 includingMe:0];
  v7 = [v6 relation];
  v13 = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  v9 = [v5 chain:v8];

  v12.receiver = self;
  v12.super_class = (Class)PGChildMemoryNodeFeatureExtractor;
  v10 = [(PGGraphMemoryNodeFeatureExtractor *)&v12 initWithName:@"Child" featureNames:v4 relation:v9 labelForTargetBlock:&__block_literal_global_239_16810];

  return v10;
}

__CFString *__51__PGChildMemoryNodeFeatureExtractor_initWithError___block_invoke()
{
  return @"Child";
}

@end