@interface PGBirthdayMeaningAggregationMemoryGenerator
+ (id)requiredFeatureRelation;
+ (id)supportedMeaningLabels;
- (BOOL)requireFaceProcessingMeetsThresholdOverTime;
- (PGBirthdayMeaningAggregationMemoryGenerator)initWithMemoryGenerationContext:(id)a3;
- (void)setRequireFaceProcessingMeetsThresholdOverTime:(BOOL)a3;
@end

@implementation PGBirthdayMeaningAggregationMemoryGenerator

- (void)setRequireFaceProcessingMeetsThresholdOverTime:(BOOL)a3
{
  self->_requireFaceProcessingMeetsThresholdOverTime = a3;
}

- (BOOL)requireFaceProcessingMeetsThresholdOverTime
{
  return self->_requireFaceProcessingMeetsThresholdOverTime;
}

- (PGBirthdayMeaningAggregationMemoryGenerator)initWithMemoryGenerationContext:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PGBirthdayMeaningAggregationMemoryGenerator;
  v3 = [(PGMeaningAggregationMemoryGenerator *)&v7 initWithMemoryGenerationContext:a3];
  v4 = v3;
  if (v3)
  {
    v3->_requireFaceProcessingMeetsThresholdOverTime = 1;
    v5 = [(PGMeaningAggregationMemoryGenerator *)v3 overTheYearsConfiguration];
    [v5 setAllowTwoConsecutiveYears:0];

    [(PGMeaningAggregationMemoryGenerator *)v4 setFeaturedYearConfiguration:0];
  }
  return v4;
}

+ (id)requiredFeatureRelation
{
  return +[PGGraphMomentNode birthdayPersonInMoment];
}

+ (id)supportedMeaningLabels
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"Birthday";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

@end