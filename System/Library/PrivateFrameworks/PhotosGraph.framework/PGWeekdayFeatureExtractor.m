@interface PGWeekdayFeatureExtractor
- (PGWeekdayFeatureExtractor)initWithError:(id *)a3;
@end

@implementation PGWeekdayFeatureExtractor

- (PGWeekdayFeatureExtractor)initWithError:(id *)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v9[0] = @"Weekday";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  v5 = +[PGGraphMomentNode weekdayOfMoment];
  v8.receiver = self;
  v8.super_class = (Class)PGWeekdayFeatureExtractor;
  v6 = [(PGGraphFeatureExtractor *)&v8 initWithName:@"Weekday" featureNames:v4 relation:v5 labelForTargetBlock:&__block_literal_global_19426];

  return v6;
}

uint64_t __43__PGWeekdayFeatureExtractor_initWithError___block_invoke(uint64_t a1, void *a2)
{
  return [a2 label];
}

@end