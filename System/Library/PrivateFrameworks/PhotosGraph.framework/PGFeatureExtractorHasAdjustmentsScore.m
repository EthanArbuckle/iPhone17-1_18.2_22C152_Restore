@interface PGFeatureExtractorHasAdjustmentsScore
- (id)featureNames;
- (id)floatVectorWithEntity:(id)a3 error:(id *)a4;
- (id)name;
- (int64_t)featureLength;
@end

@implementation PGFeatureExtractorHasAdjustmentsScore

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  float v5 = (float)[a3 hasAdjustments];
  v6 = (void *)MEMORY[0x1E4F71ED0];
  int64_t v7 = [(PGFeatureExtractorHasAdjustmentsScore *)self featureLength];
  *(float *)&double v8 = v5;
  return (id)[v6 vectorRepeatingFloat:v7 count:v8];
}

- (int64_t)featureLength
{
  return 1;
}

- (id)featureNames
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"HasAdjustments";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)name
{
  v2 = @"HasAdjustments";
  return @"HasAdjustments";
}

@end