@interface PGFeatureExtractorFaceSize
- (id)defaultFloatVectorWithError:(id *)a3;
- (id)featureNames;
- (id)floatMatrixWithEntities:(id)a3 progressReporter:(id)a4 error:(id *)a5;
- (id)name;
- (int64_t)featureLength;
@end

@implementation PGFeatureExtractorFaceSize

- (id)floatMatrixWithEntities:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F71EF0]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        int v17 = 0;
        [v13 size];
        *(float *)&double v14 = v14;
        int v17 = LODWORD(v14);
        v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F71ED0]), "initWithFloats:count:", &v17, -[PGFeatureExtractorFaceSize featureLength](self, "featureLength"));
        [v7 appendRow:v15];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)defaultFloatVectorWithError:(id *)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F71ED0]) initWithArray:&unk_1F28D3A08];
  return v3;
}

- (int64_t)featureLength
{
  return 1;
}

- (id)featureNames
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"FaceSize";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)name
{
  v2 = @"FaceSize";
  return @"FaceSize";
}

@end