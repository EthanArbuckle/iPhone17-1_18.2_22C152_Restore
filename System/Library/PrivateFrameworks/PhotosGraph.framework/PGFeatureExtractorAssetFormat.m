@interface PGFeatureExtractorAssetFormat
- (id)featureNames;
- (id)floatVectorWithEntity:(id)a3 error:(id *)a4;
- (id)name;
- (int64_t)featureLength;
@end

@implementation PGFeatureExtractorAssetFormat

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unint64_t v6 = [v5 pixelWidth];
  unint64_t v7 = [v5 pixelHeight];

  v8 = objc_msgSend(MEMORY[0x1E4F71EF8], "zerosOfCount:", -[PGFeatureExtractorAssetFormat featureLength](self, "featureLength"));
  v10 = v8;
  if (v6 == v7)
  {
    uint64_t v11 = 0;
  }
  else if (v7 <= v6)
  {
    if (v6 <= v7) {
      goto LABEL_8;
    }
    uint64_t v11 = 2;
  }
  else
  {
    uint64_t v11 = 1;
  }
  LODWORD(v9) = 1.0;
  [v8 setFloat:v11 atIndex:v9];
LABEL_8:
  return v10;
}

- (int64_t)featureLength
{
  return 3;
}

- (id)featureNames
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"Square";
  v4[1] = @"Portrait";
  v4[2] = @"Landscape";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];
  return v2;
}

- (id)name
{
  v2 = @"AssetFormat";
  return @"AssetFormat";
}

@end