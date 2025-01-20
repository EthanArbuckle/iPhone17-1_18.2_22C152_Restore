@interface PGHolidayMeaningAggregationMemoryGenerator
+ (id)requiredFeatureRelation;
+ (id)supportedMeaningLabels;
- (PGHolidayMeaningAggregationMemoryGenerator)initWithMemoryGenerationContext:(id)a3;
- (id)momentRequirements;
- (void)setMomentRequirements:(id)a3;
@end

@implementation PGHolidayMeaningAggregationMemoryGenerator

- (void).cxx_destruct
{
}

- (void)setMomentRequirements:(id)a3
{
}

- (id)momentRequirements
{
  return self->_momentRequirements;
}

- (PGHolidayMeaningAggregationMemoryGenerator)initWithMemoryGenerationContext:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PGHolidayMeaningAggregationMemoryGenerator;
  v3 = [(PGMeaningAggregationMemoryGenerator *)&v10 initWithMemoryGenerationContext:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PGHolidayMeaningAggregationMemoryGenerator *)v3 momentRequirements];
    [v5 setMinimumNumberOfAssetsInExtendedCuration:5];

    v6 = [(PGMeaningAggregationMemoryGenerator *)v4 overTheYearsConfiguration];
    [v6 setMinimumNumberOfYears:2];

    v7 = [(PGMeaningAggregationMemoryGenerator *)v4 overTheYearsConfiguration];
    [v7 setMinimumNumberOfMoments:2];

    v8 = [(PGMeaningAggregationMemoryGenerator *)v4 overTheYearsConfiguration];
    [v8 setMinimumNumberOfMomentsForTwoConsecutiveYears:2];

    [(PGMeaningAggregationMemoryGenerator *)v4 setFeaturedYearConfiguration:0];
  }
  return v4;
}

+ (id)requiredFeatureRelation
{
  return +[PGGraphMomentNode celebratedHolidayOfMoment];
}

+ (id)supportedMeaningLabels
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"HolidayEvent";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

@end