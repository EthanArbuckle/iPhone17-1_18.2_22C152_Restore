@interface PGPartOfDayFeatureExtractor
- (PGPartOfDayFeatureExtractor)initWithError:(id *)a3;
@end

@implementation PGPartOfDayFeatureExtractor

- (PGPartOfDayFeatureExtractor)initWithError:(id *)a3
{
  v11[5] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F76BB8];
  v11[0] = *MEMORY[0x1E4F76BA8];
  v11[1] = v4;
  uint64_t v5 = *MEMORY[0x1E4F76BA0];
  v11[2] = *MEMORY[0x1E4F76B98];
  v11[3] = v5;
  v11[4] = *MEMORY[0x1E4F76BB0];
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:5];
  v7 = +[PGGraphMomentNode partOfDayOfMoment];
  v10.receiver = self;
  v10.super_class = (Class)PGPartOfDayFeatureExtractor;
  v8 = [(PGGraphFeatureExtractor *)&v10 initWithName:@"PartOfDay" featureNames:v6 relation:v7 labelForTargetBlock:&__block_literal_global_56608];

  return v8;
}

uint64_t __45__PGPartOfDayFeatureExtractor_initWithError___block_invoke(uint64_t a1, void *a2)
{
  return [a2 name];
}

@end