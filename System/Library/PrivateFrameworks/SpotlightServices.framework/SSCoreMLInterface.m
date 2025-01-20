@interface SSCoreMLInterface
- (SSCoreMLInterface)initWithURL:(id)a3 error:(id *)a4;
- (float)predict:(id)a3 error:(id *)a4;
- (float)predictFromDictionaryFeatures:(id)a3 error:(id *)a4;
- (float)predictFromValues:(id)a3 error:(id *)a4;
- (id)getDescription;
- (id)getInputDescriptionsByName;
- (id)getVersionString;
- (id)initSpecificModel:(id)a3 error:(id *)a4;
@end

@implementation SSCoreMLInterface

- (SSCoreMLInterface)initWithURL:(id)a3 error:(id *)a4
{
  objc_msgSend(MEMORY[0x1E4F1E978], "modelAssetWithURL:error:", a3);
  v6 = (MLModelAsset *)objc_claimAutoreleasedReturnValue();
  asset = self->asset;
  self->asset = v6;

  if (a4 && *a4
    || (v8 = self->asset) == 0
    || ([(MLModelAsset *)v8 model],
        v9 = (MLModel *)objc_claimAutoreleasedReturnValue(),
        model = self->model,
        self->model = v9,
        model,
        !self->model))
  {
    v11 = 0;
  }
  else
  {
    v11 = self;
  }

  return v11;
}

- (id)initSpecificModel:(id)a3 error:(id *)a4
{
  v6 = [NSString stringWithFormat:@"%@.mlmodelc", a3];
  v7 = SSDefaultsGetAssetPath(v6);

  v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7];
  v9 = [(SSCoreMLInterface *)self initWithURL:v8 error:a4];

  return v9;
}

- (float)predictFromValues:(id)a3 error:(id *)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 allKeys];
  v8 = [v7 sortedArrayUsingSelector:sel_compare_];

  v9 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v29;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = objc_msgSend(v6, "objectForKeyedSubscript:", *(void *)(*((void *)&v28 + 1) + 8 * v14), (void)v28);
        [v9 addObject:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v12);
  }

  uint64_t v16 = [v9 count];
  id v17 = objc_alloc(MEMORY[0x1E4F1E9A8]);
  v18 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v16];
  v32[0] = v18;
  v32[1] = &unk_1F1861A90;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  v20 = (void *)[v17 initForFloat32TypeWithShape:v19];

  if (v16)
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      v22 = objc_msgSend(v9, "objectAtIndex:", i, (void)v28);
      [v22 doubleValue];
      double v24 = v23;

      *(float *)&double v24 = v24;
      *(_DWORD *)([v20 floatPointer] + 4 * i) = LODWORD(v24);
    }
  }
  -[SSCoreMLInterface predict:error:](self, "predict:error:", v20, a4, (void)v28);
  float v26 = v25;

  return v26;
}

- (float)predict:(id)a3 error:(id *)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  [v8 setObject:v7 forKeyedSubscript:@"x_in"];

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F1E930]) initWithDictionary:v8 error:a4];
  id v10 = [(MLModel *)self->model predictionFromFeatures:v9 error:a4];
  uint64_t v11 = [v10 featureValueForName:@"out"];
  uint64_t v12 = v11;
  if (v11)
  {
    [v11 doubleValue];
    float v14 = v13;
  }
  else
  {
    float v14 = 0.0;
  }

  return v14;
}

- (float)predictFromDictionaryFeatures:(id)a3 error:(id *)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F1E930];
  id v7 = a3;
  id v8 = (void *)[[v6 alloc] initWithDictionary:v7 error:a4];

  v9 = [(MLModel *)self->model predictionFromFeatures:v8 error:a4];
  id v10 = [v9 featureValueForName:@"out"];
  uint64_t v11 = v10;
  if (v10)
  {
    [v10 doubleValue];
    float v13 = v12;
  }
  else
  {
    float v13 = 0.0;
  }

  return v13;
}

- (id)getVersionString
{
  v2 = [(MLModelAsset *)self->asset regressor];
  v3 = [v2 modelDescription];
  v4 = [v3 metadata];

  if (v4)
  {
    v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F1E898]];
    id v6 = v5;
    if (v5)
    {
      id v7 = [v5 objectForKeyedSubscript:@"version"];
    }
    else
    {
      id v7 = 0;
    }
    if (![v7 length])
    {
      uint64_t v8 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F1E8B8]];

      id v7 = (void *)v8;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)getDescription
{
  v2 = [(MLModelAsset *)self->asset regressor];
  v3 = [v2 modelDescription];
  v4 = [v3 metadata];

  if (v4)
  {
    v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F1E8A0]];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)getInputDescriptionsByName
{
  v2 = [(MLModel *)self->model modelDescription];
  v3 = [v2 inputDescriptionsByName];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->model, 0);
  objc_storeStrong((id *)&self->asset, 0);
}

@end