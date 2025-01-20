@interface PGFeatureExtractorFaceAgeType
- (id)_floatVectorForFaceAgeType:(unsigned __int16)a3;
- (id)defaultFloatVectorWithError:(id *)a3;
- (id)featureNames;
- (id)floatMatrixWithEntities:(id)a3 progressReporter:(id)a4 error:(id *)a5;
- (id)name;
- (int64_t)featureLength;
@end

@implementation PGFeatureExtractorFaceAgeType

- (id)_floatVectorForFaceAgeType:(unsigned __int16)a3
{
  unsigned int v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E4F71EF8], "zerosOfCount:", -[PGFeatureExtractorFaceAgeType featureLength](self, "featureLength"));
  v6 = v4;
  if (v3 <= 5)
  {
    LODWORD(v5) = 1.0;
    [v4 setFloat:v3 atIndex:v5];
  }
  return v6;
}

- (id)floatMatrixWithEntities:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F71EF0]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = -[PGFeatureExtractorFaceAgeType _floatVectorForFaceAgeType:](self, "_floatVectorForFaceAgeType:", objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "ageType", (void)v15));
        [v7 appendRow:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)defaultFloatVectorWithError:(id *)a3
{
  unsigned int v3 = (void *)[objc_alloc(MEMORY[0x1E4F71ED0]) initWithArray:&unk_1F28D3AF8];
  return v3;
}

- (int64_t)featureLength
{
  return 6;
}

- (id)featureNames
{
  v4[6] = *MEMORY[0x1E4F143B8];
  v4[0] = @"FaceAgeTypeNotSet";
  v4[1] = @"FaceAgeTypeBaby";
  v4[2] = @"FaceAgeTypeChild";
  v4[3] = @"FaceAgeTypeYoungAdult";
  v4[4] = @"FaceAgeTypeSenior";
  v4[5] = @"FaceAgeTypeAdult";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:6];
  return v2;
}

- (id)name
{
  v2 = @"FaceAgeType";
  return @"FaceAgeType";
}

@end