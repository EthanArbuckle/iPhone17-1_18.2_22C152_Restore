@interface PGFeatureExtractorShareCount
- (id)featureNames;
- (id)floatVectorWithEntity:(id)a3 error:(id *)a4;
- (id)name;
- (int64_t)featureLength;
@end

@implementation PGFeatureExtractorShareCount

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  v5 = [a3 assetUserActivityProperties];
  float v6 = (float)[v5 shareCount];

  v7 = (void *)MEMORY[0x1E4F71ED0];
  int64_t v8 = [(PGFeatureExtractorShareCount *)self featureLength];
  *(float *)&double v9 = v6;
  return (id)[v7 vectorRepeatingFloat:v8 count:v9];
}

- (int64_t)featureLength
{
  return 1;
}

- (id)featureNames
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"ShareCount";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)name
{
  v2 = @"ShareCount";
  return @"ShareCount";
}

@end