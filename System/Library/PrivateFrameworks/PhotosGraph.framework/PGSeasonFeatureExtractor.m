@interface PGSeasonFeatureExtractor
- (PGSeasonFeatureExtractor)initWithError:(id *)a3;
@end

@implementation PGSeasonFeatureExtractor

- (PGSeasonFeatureExtractor)initWithError:(id *)a3
{
  v16[4] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F76BD0];
  v16[0] = *MEMORY[0x1E4F76BC8];
  v16[1] = v4;
  uint64_t v5 = *MEMORY[0x1E4F76BD8];
  v16[2] = *MEMORY[0x1E4F76BC0];
  v16[3] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:4];
  v7 = (void *)MEMORY[0x1E4F71F18];
  v8 = +[PGGraphMomentNode dateOfMoment];
  v15[0] = v8;
  v9 = +[PGGraphDateNode seasonOfDate];
  v15[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  v11 = [v7 chain:v10];

  v14.receiver = self;
  v14.super_class = (Class)PGSeasonFeatureExtractor;
  v12 = [(PGGraphFeatureExtractor *)&v14 initWithName:@"Season" featureNames:v6 relation:v11 labelForTargetBlock:&__block_literal_global_33630];

  return v12;
}

uint64_t __42__PGSeasonFeatureExtractor_initWithError___block_invoke(uint64_t a1, void *a2)
{
  return [a2 name];
}

@end