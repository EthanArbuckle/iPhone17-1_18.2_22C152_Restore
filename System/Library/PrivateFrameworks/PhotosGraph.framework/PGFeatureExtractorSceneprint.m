@interface PGFeatureExtractorSceneprint
- (BOOL)_generateError:(id *)a3 code:(int64_t)a4 message:(id)a5 underlyingError:(id)a6;
- (id)featureNames;
- (id)featureValuesForAssets:(id)a3 error:(id *)a4;
- (id)floatVectorWithEntity:(id)a3 error:(id *)a4;
- (id)name;
- (int64_t)featureLength;
@end

@implementation PGFeatureExtractorSceneprint

- (BOOL)_generateError:(id *)a3 code:(int64_t)a4 message:(id)a5 underlyingError:(id)a6
{
  id v9 = a6;
  if (a3)
  {
    v10 = (objc_class *)MEMORY[0x1E4F1CA60];
    id v11 = a5;
    id v12 = objc_alloc_init(v10);
    [v12 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F28568]];

    if (v9) {
      [v12 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    }
    *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.PhotosGraph.PGFeatureExtractorScenePrint" code:a4 userInfo:v12];
  }
  return 0;
}

- (id)featureValuesForAssets:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [MEMORY[0x1E4F1CA60] dictionary];
  [(PGFeatureExtractorSceneprint *)self _generateError:a4 code:1 message:@"PGFingerprintVersionAssetPrintTypeScene2048 print is deprecated. Use PGFingerprintVersionAssetPrintTypeSceneCLIP768 instead." underlyingError:0];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v14 = objc_msgSend(MEMORY[0x1E4F71EF8], "vectorRepeatingFloat:count:", -[PGFeatureExtractorSceneprint featureLength](self, "featureLength", (void)v17), 0.0);
        v15 = [v13 localIdentifier];
        [v7 setObject:v14 forKeyedSubscript:v15];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a3;
  id v8 = [v6 arrayWithObjects:&v13 count:1];
  uint64_t v9 = -[PGFeatureExtractorSceneprint featureValuesForAssets:error:](self, "featureValuesForAssets:error:", v8, a4, v13, v14);
  uint64_t v10 = [v7 localIdentifier];

  uint64_t v11 = [v9 objectForKeyedSubscript:v10];

  return v11;
}

- (id)featureNames
{
  v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[PGFeatureExtractorSceneprint featureLength](self, "featureLength"));
  if ([(PGFeatureExtractorSceneprint *)self featureLength] >= 1)
  {
    uint64_t v4 = 0;
    unsigned int v5 = 1;
    do
    {
      id v6 = [NSString stringWithFormat:@"%@_%u", @"SP", v5 - 1];
      [v3 setObject:v6 atIndexedSubscript:v4];

      uint64_t v4 = v5;
    }
    while ([(PGFeatureExtractorSceneprint *)self featureLength] > v5++);
  }
  return v3;
}

- (int64_t)featureLength
{
  return 2048;
}

- (id)name
{
  v2 = @"Sceneprint";
  return @"Sceneprint";
}

@end