@interface PGFeatureExtractorAssetMediaType
- (id)featureNames;
- (id)floatVectorWithEntity:(id)a3 error:(id *)a4;
- (id)name;
- (int64_t)featureLength;
@end

@implementation PGFeatureExtractorAssetMediaType

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  v5 = (void *)MEMORY[0x1E4F71EF8];
  id v6 = a3;
  v7 = objc_msgSend(v5, "zerosOfCount:", -[PGFeatureExtractorAssetMediaType featureLength](self, "featureLength"));
  unint64_t v8 = [v6 mediaType];

  if (v8 <= 3)
  {
    LODWORD(v9) = 1.0;
    [v7 setFloat:v8 atIndex:v9];
  }
  return v7;
}

- (int64_t)featureLength
{
  return 4;
}

- (id)featureNames
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v4[0] = @"MediaTypeUnknown";
  v4[1] = @"Image";
  v4[2] = @"Video";
  v4[3] = @"Audio";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];
  return v2;
}

- (id)name
{
  v2 = @"AssetMediaType";
  return @"AssetMediaType";
}

@end