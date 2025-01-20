@interface PGFeatureExtractorAssetResolution
- (id)featureNames;
- (id)floatVectorWithEntity:(id)a3 error:(id *)a4;
- (id)name;
- (int64_t)featureLength;
@end

@implementation PGFeatureExtractorAssetResolution

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 pixelWidth];
  uint64_t v7 = [v5 pixelHeight];

  v8 = (void *)MEMORY[0x1E4F71ED0];
  int64_t v9 = [(PGFeatureExtractorAssetResolution *)self featureLength];
  *(float *)&double v10 = (float)(unint64_t)(v7 * v6);
  return (id)[v8 vectorRepeatingFloat:v9 count:v10];
}

- (int64_t)featureLength
{
  return 1;
}

- (id)featureNames
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"AssetResolution";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)name
{
  v2 = @"AssetResolution";
  return @"AssetResolution";
}

@end