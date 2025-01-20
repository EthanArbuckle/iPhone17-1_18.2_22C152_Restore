@interface PGWeekendFeatureExtractor
- (PGWeekendFeatureExtractor)initWithError:(id *)a3;
@end

@implementation PGWeekendFeatureExtractor

- (PGWeekendFeatureExtractor)initWithError:(id *)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v9[0] = @"Weekend";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  v5 = +[PGGraphMomentNode weekendOfMoment];
  v8.receiver = self;
  v8.super_class = (Class)PGWeekendFeatureExtractor;
  v6 = [(PGGraphFeatureExtractor *)&v8 initWithName:@"Weekend" featureNames:v4 relation:v5 labelForTargetBlock:&__block_literal_global_57670];

  return v6;
}

uint64_t __43__PGWeekendFeatureExtractor_initWithError___block_invoke(uint64_t a1, void *a2)
{
  return [a2 label];
}

@end