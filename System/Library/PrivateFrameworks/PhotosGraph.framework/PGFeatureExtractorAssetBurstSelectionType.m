@interface PGFeatureExtractorAssetBurstSelectionType
- (id)featureNames;
- (id)floatVectorWithEntity:(id)a3 error:(id *)a4;
- (id)name;
- (int64_t)featureLength;
@end

@implementation PGFeatureExtractorAssetBurstSelectionType

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  v5 = (void *)MEMORY[0x1E4F71EF8];
  id v6 = a3;
  v7 = objc_msgSend(v5, "zerosOfCount:", -[PGFeatureExtractorAssetBurstSelectionType featureLength](self, "featureLength"));
  uint64_t v8 = [v6 burstSelectionTypes];

  if (!v8)
  {
    uint64_t v10 = 0;
    goto LABEL_7;
  }
  if (v8)
  {
    LODWORD(v9) = 1.0;
    [v7 setFloat:1 atIndex:v9];
  }
  if ((v8 & 2) != 0)
  {
    uint64_t v10 = 2;
LABEL_7:
    LODWORD(v9) = 1.0;
    [v7 setFloat:v10 atIndex:v9];
  }
  return v7;
}

- (int64_t)featureLength
{
  return 3;
}

- (id)featureNames
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"BurstSelectionNone";
  v4[1] = @"AutoPick";
  v4[2] = @"UserPick";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];
  return v2;
}

- (id)name
{
  v2 = @"BurstSelectionType";
  return @"BurstSelectionType";
}

@end