@interface PGBabyFeatureExtractor
- (PGBabyFeatureExtractor)initWithError:(id *)a3;
@end

@implementation PGBabyFeatureExtractor

- (PGBabyFeatureExtractor)initWithError:(id *)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v15[0] = @"Baby";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  v5 = (void *)MEMORY[0x1E4F71F18];
  v6 = +[PGGraphMomentNode personInMoment];
  v14[0] = v6;
  v7 = +[PGGraphPersonNode filterForAgeCategories:&unk_1F28D3978 includingMe:0];
  v8 = [v7 relation];
  v14[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  v10 = [v5 chain:v9];

  v13.receiver = self;
  v13.super_class = (Class)PGBabyFeatureExtractor;
  v11 = [(PGGraphFeatureExtractor *)&v13 initWithName:@"Baby" featureNames:v4 relation:v10 labelForTargetBlock:&__block_literal_global_2315];

  return v11;
}

__CFString *__40__PGBabyFeatureExtractor_initWithError___block_invoke()
{
  return @"Baby";
}

@end