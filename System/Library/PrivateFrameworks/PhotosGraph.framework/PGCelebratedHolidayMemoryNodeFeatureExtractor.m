@interface PGCelebratedHolidayMemoryNodeFeatureExtractor
- (PGCelebratedHolidayMemoryNodeFeatureExtractor)initWithError:(id *)a3;
- (PGCelebratedHolidayMemoryNodeFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4;
- (id)labelsForVersion:(int64_t)a3;
@end

@implementation PGCelebratedHolidayMemoryNodeFeatureExtractor

- (id)labelsForVersion:(int64_t)a3
{
  if (a3 == 1) {
    return &unk_1F28D47A0;
  }
  else {
    return (id)MEMORY[0x1E4F1CBF0];
  }
}

- (PGCelebratedHolidayMemoryNodeFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v5 = -[PGCelebratedHolidayMemoryNodeFeatureExtractor labelsForVersion:](self, "labelsForVersion:", a3, a4);
  v6 = (void *)MEMORY[0x1E4F71F18];
  v7 = +[PGGraphHolidayNode filter];
  v8 = [v7 relation];
  v14[0] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  v10 = [v6 chain:v9];

  v13.receiver = self;
  v13.super_class = (Class)PGCelebratedHolidayMemoryNodeFeatureExtractor;
  v11 = [(PGGraphMemoryNodeFeatureExtractor *)&v13 initWithName:@"CelebratedHoliday" featureNames:v5 relation:v10 labelForTargetBlock:&__block_literal_global_563];

  return v11;
}

uint64_t __71__PGCelebratedHolidayMemoryNodeFeatureExtractor_initWithVersion_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 name];
}

- (PGCelebratedHolidayMemoryNodeFeatureExtractor)initWithError:(id *)a3
{
  return [(PGCelebratedHolidayMemoryNodeFeatureExtractor *)self initWithVersion:1 error:a3];
}

@end