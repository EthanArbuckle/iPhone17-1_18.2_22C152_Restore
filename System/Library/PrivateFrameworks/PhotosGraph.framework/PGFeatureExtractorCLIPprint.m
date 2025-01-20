@interface PGFeatureExtractorCLIPprint
- (id)_floatArrayFromSceneprint:(id)a3;
- (id)featureNames;
- (id)featureValuesForAssets:(id)a3 error:(id *)a4;
- (id)floatVectorWithEntity:(id)a3 error:(id *)a4;
- (id)name;
- (int64_t)featureLength;
@end

@implementation PGFeatureExtractorCLIPprint

- (id)featureValuesForAssets:(id)a3 error:(id *)a4
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__53671;
  v37 = __Block_byref_object_dispose__53672;
  id v38 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__53671;
  v31 = __Block_byref_object_dispose__53672;
  id v32 = 0;
  dispatch_group_t v7 = dispatch_group_create();
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __60__PGFeatureExtractorCLIPprint_featureValuesForAssets_error___block_invoke;
  v21 = &unk_1E68EBF08;
  v25 = &v27;
  v26 = &v33;
  id v8 = v6;
  id v22 = v8;
  v23 = self;
  v9 = v7;
  v24 = v9;
  v10 = _Block_copy(&v18);
  v11 = objc_msgSend(MEMORY[0x1E4F744E8], "analysisService", v18, v19, v20, v21);
  dispatch_group_enter(v9);
  uint64_t v39 = *MEMORY[0x1E4F74540];
  v40[0] = &unk_1F28D2760;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
  uint64_t v13 = [v11 requestSceneprintProcessingForAssets:v8 withOptions:v12 progressHandler:0 andCompletionHandler:v10];

  dispatch_time_t v14 = dispatch_time(0, 10000000000);
  dispatch_group_wait(v9, v14);
  if (!v34[5]) {
    [v11 cancelRequest:v13];
  }
  if (a4)
  {
    v15 = (void *)v28[5];
    if (v15) {
      *a4 = v15;
    }
  }
  id v16 = (id)v34[5];

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v16;
}

void __60__PGFeatureExtractorCLIPprint_featureValuesForAssets_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v11 = *(id *)(a1 + 32);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      id obj = v7;
      uint64_t v14 = *(void *)v31;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v31 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          v17 = [v16 localIdentifier];
          uint64_t v18 = [v5 objectForKeyedSubscript:v17];

          if (!v18)
          {
            uint64_t v22 = *(void *)(*(void *)(a1 + 64) + 8);
            v23 = *(void **)(v22 + 40);
            *(void *)(v22 + 40) = 0;

            id v7 = obj;
            if (!obj)
            {
              v24 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v34 = *MEMORY[0x1E4F28568];
              uint64_t v35 = @"Media Analysis returned nil for asset sceneprint with no error.";
              v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
              id v7 = [v24 errorWithDomain:@"com.apple.PhotosGraph.PGFeatureExtractorCLIPprint" code:3 userInfo:v25];
            }
            objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v7);
            goto LABEL_17;
          }
          uint64_t v19 = [*(id *)(a1 + 40) _floatArrayFromSceneprint:v18];
          v20 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
          v21 = [v16 localIdentifier];
          [v20 setObject:v19 forKeyedSubscript:v21];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v36 count:16];
        if (v13) {
          continue;
        }
        break;
      }
      id v7 = obj;
    }
  }
  else
  {
    if (!v6)
    {
      v26 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v37 = *MEMORY[0x1E4F28568];
      v38[0] = @"Media Analysis returned nil result with no error.";
      uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
      id v7 = [v26 errorWithDomain:@"com.apple.PhotosGraph.PGFeatureExtractorCLIPprint" code:2 userInfo:v27];
    }
    uint64_t v28 = *(void *)(*(void *)(a1 + 56) + 8);
    id v7 = v7;
    id v11 = *(id *)(v28 + 40);
    *(void *)(v28 + 40) = v7;
  }
LABEL_17:

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    v13[0] = v6;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    uint64_t v9 = [(PGFeatureExtractorCLIPprint *)self featureValuesForAssets:v8 error:a4];
    if (v9)
    {
      v10 = [v7 localIdentifier];
      id v11 = [v9 objectForKeyedSubscript:v10];
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)_floatArrayFromSceneprint:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 elementType];
  if (v4 == 2)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F71EF8]);
    id v8 = [v3 descriptorData];
    uint64_t v9 = [v8 bytes];

    objc_msgSend(v7, "appendDoubles:count:", v9, objc_msgSend(v3, "elementCount"));
  }
  else if (v4 == 1)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F71ED0]);
    id v6 = [v3 descriptorData];
    id v7 = (id)[v5 initWithData:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)featureNames
{
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[PGFeatureExtractorCLIPprint featureLength](self, "featureLength"));
  if ([(PGFeatureExtractorCLIPprint *)self featureLength] >= 1)
  {
    uint64_t v4 = 0;
    unsigned int v5 = 1;
    do
    {
      id v6 = [NSString stringWithFormat:@"%@_%u", @"CLIP", v5 - 1];
      [v3 setObject:v6 atIndexedSubscript:v4];

      uint64_t v4 = v5;
    }
    while ([(PGFeatureExtractorCLIPprint *)self featureLength] > v5++);
  }
  return v3;
}

- (int64_t)featureLength
{
  return 768;
}

- (id)name
{
  v2 = @"CLIPprint";
  return @"CLIPprint";
}

@end