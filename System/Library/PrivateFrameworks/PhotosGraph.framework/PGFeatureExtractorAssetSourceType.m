@interface PGFeatureExtractorAssetSourceType
- (id)featureNames;
- (id)floatVectorWithEntity:(id)a3 error:(id *)a4;
- (id)name;
- (int64_t)featureLength;
@end

@implementation PGFeatureExtractorAssetSourceType

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  v5 = (void *)MEMORY[0x1E4F71EF8];
  id v6 = a3;
  v7 = objc_msgSend(v5, "zerosOfCount:", -[PGFeatureExtractorAssetSourceType featureLength](self, "featureLength"));
  uint64_t v8 = [v6 sourceType];

  if (!v8)
  {
    uint64_t v10 = 0;
LABEL_10:
    LODWORD(v9) = 1.0;
    [v7 setFloat:v10 atIndex:v9];
    goto LABEL_11;
  }
  if ((v8 & 1) == 0)
  {
    if ((v8 & 2) == 0) {
      goto LABEL_4;
    }
LABEL_8:
    LODWORD(v9) = 1.0;
    [v7 setFloat:2 atIndex:v9];
    if ((v8 & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  LODWORD(v9) = 1.0;
  [v7 setFloat:1 atIndex:v9];
  if ((v8 & 2) != 0) {
    goto LABEL_8;
  }
LABEL_4:
  if ((v8 & 4) != 0)
  {
LABEL_9:
    uint64_t v10 = 3;
    goto LABEL_10;
  }
LABEL_11:
  return v7;
}

- (int64_t)featureLength
{
  return 4;
}

- (id)featureNames
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v4[0] = @"SourceTypeNone";
  v4[1] = @"UserLibrary";
  v4[2] = @"CloudShared";
  v4[3] = @"iTunesSynced";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];
  return v2;
}

- (id)name
{
  v2 = @"AssetSourceType";
  return @"AssetSourceType";
}

@end