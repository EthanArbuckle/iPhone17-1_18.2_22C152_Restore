@interface PGCelebratedHolidayFeatureExtractor
- (PGCelebratedHolidayFeatureExtractor)initWithError:(id *)a3;
- (PGCelebratedHolidayFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4;
- (id)labelsForVersion:(int64_t)a3;
@end

@implementation PGCelebratedHolidayFeatureExtractor

- (id)labelsForVersion:(int64_t)a3
{
  if (a3 == 1) {
    return &unk_1F28D4788;
  }
  else {
    return (id)MEMORY[0x1E4F1CBF0];
  }
}

- (PGCelebratedHolidayFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4
{
  v5 = -[PGCelebratedHolidayFeatureExtractor labelsForVersion:](self, "labelsForVersion:", a3, a4);
  v6 = +[PGGraphMomentNode celebratedHolidayOfMoment];
  v9.receiver = self;
  v9.super_class = (Class)PGCelebratedHolidayFeatureExtractor;
  v7 = [(PGGraphFeatureExtractor *)&v9 initWithName:@"CelebratedHoliday" featureNames:v5 relation:v6 labelForTargetBlock:&__block_literal_global_54212];

  return v7;
}

uint64_t __61__PGCelebratedHolidayFeatureExtractor_initWithVersion_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 name];
}

- (PGCelebratedHolidayFeatureExtractor)initWithError:(id *)a3
{
  return [(PGCelebratedHolidayFeatureExtractor *)self initWithVersion:1 error:a3];
}

@end