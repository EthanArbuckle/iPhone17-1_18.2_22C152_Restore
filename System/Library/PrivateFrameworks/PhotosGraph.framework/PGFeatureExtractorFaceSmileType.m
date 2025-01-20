@interface PGFeatureExtractorFaceSmileType
- (id)_floatVectorForFaceSmileType:(unsigned __int16)a3;
- (id)defaultFloatVectorWithError:(id *)a3;
- (id)featureNames;
- (id)floatMatrixWithEntities:(id)a3 progressReporter:(id)a4 error:(id *)a5;
- (id)name;
- (int64_t)featureLength;
@end

@implementation PGFeatureExtractorFaceSmileType

- (id)_floatVectorForFaceSmileType:(unsigned __int16)a3
{
  if (a3 <= 2u) {
    self = (PGFeatureExtractorFaceSmileType *)[objc_alloc(MEMORY[0x1E4F71ED0]) initWithArray:qword_1E68E5960[a3]];
  }
  return self;
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
        v13 = -[PGFeatureExtractorFaceSmileType _floatVectorForFaceSmileType:](self, "_floatVectorForFaceSmileType:", objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "smileType", (void)v15));
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
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F71ED0]) initWithArray:&unk_1F28D3A38];
  return v3;
}

- (int64_t)featureLength
{
  return 3;
}

- (id)featureNames
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"FaceSmileTypeNotSet";
  v4[1] = @"FaceSmileTypeNoSmile";
  v4[2] = @"FaceSmileTypeSmile";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];
  return v2;
}

- (id)name
{
  v2 = @"FaceSmileType";
  return @"FaceSmileType";
}

@end