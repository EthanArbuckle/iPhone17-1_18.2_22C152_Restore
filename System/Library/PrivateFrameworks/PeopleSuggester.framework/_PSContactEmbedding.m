@interface _PSContactEmbedding
- (MLModel)model;
- (_PSContactEmbedding)init;
- (_PSContactEmbedding)initWithModel:(id)a3;
- (id)convertToNSArrayFromMLMultiArray:(id)a3;
- (id)getEmbeddingForContact:(id)a3;
- (id)getEmbeddingFromFeatureDict:(id)a3;
- (id)getEmbeddingsForContacts:(id)a3;
@end

@implementation _PSContactEmbedding

- (_PSContactEmbedding)init
{
  v3 = +[_PSContactEmbeddingUtilities loadModelFromUrlResource:@"cloud_mlp_with_embedding"];
  if (v3)
  {
    self = [(_PSContactEmbedding *)self initWithModel:v3];
    v4 = self;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (_PSContactEmbedding)initWithModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PSContactEmbedding;
  v6 = [(_PSContactEmbedding *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_model, a3);
  }

  return v7;
}

- (id)getEmbeddingForContact:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(_PSContactEmbeddingFeatureExtractor);
  v6 = [(_PSContactEmbeddingFeatureExtractor *)v5 featureInputForContact:v4];

  v7 = [(_PSContactEmbedding *)self getEmbeddingFromFeatureDict:v6];

  return v7;
}

- (id)getEmbeddingsForContacts:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17 = objc_alloc_init(_PSContactEmbeddingFeatureExtractor);
  id v5 = [(_PSContactEmbeddingFeatureExtractor *)v17 featureInputsForContacts:v4];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1A6243860]();
        v13 = [v11 identifier];
        v14 = [v5 objectForKey:v13];
        v15 = [(_PSContactEmbedding *)self getEmbeddingFromFeatureDict:v14];
        [v6 setObject:v15 forKey:v13];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  return v6;
}

- (id)getEmbeddingFromFeatureDict:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  v25 = +[_PSContactEmbeddingUtilities prepareFeatureInputFromFeatureDict:](_PSContactEmbeddingUtilities, "prepareFeatureInputFromFeatureDict:");
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v24 setObject:v25 forKey:@"input1"];
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2050000000;
  id v4 = (void *)getMLDictionaryFeatureProviderClass_softClass_2;
  uint64_t v36 = getMLDictionaryFeatureProviderClass_softClass_2;
  if (!getMLDictionaryFeatureProviderClass_softClass_2)
  {
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __getMLDictionaryFeatureProviderClass_block_invoke_2;
    v32[3] = &unk_1E5ADE858;
    v32[4] = &v33;
    __getMLDictionaryFeatureProviderClass_block_invoke_2((uint64_t)v32);
    id v4 = (void *)v34[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v33, 8);
  id v31 = 0;
  v23 = (void *)[[v5 alloc] initWithDictionary:v24 error:&v31];
  id v22 = v31;
  if (v22)
  {
    id v6 = +[_PSLogging contactEmbeddingChannel];
    uint64_t v7 = v6;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[_PSContactEmbedding getEmbeddingFromFeatureDict:]((uint64_t)v22, v6);
      id v8 = 0;
      uint64_t v7 = v6;
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    uint64_t v9 = [(_PSContactEmbedding *)self model];
    id v30 = 0;
    v10 = [v9 predictionFromFeatures:v23 error:&v30];
    long long v20 = v30;

    if (v20)
    {
      v11 = +[_PSLogging contactEmbeddingChannel];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[_PSContactEmbedding getEmbeddingFromFeatureDict:]((uint64_t)v20, v11);
      }
      id v8 = 0;
    }
    else
    {
      v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      uint64_t v12 = [&unk_1EF676350 countByEnumeratingWithState:&v26 objects:v37 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v27 != v13) {
              objc_enumerationMutation(&unk_1EF676350);
            }
            uint64_t v15 = *(void *)(*((void *)&v26 + 1) + 8 * i);
            v16 = objc_msgSend(v10, "featureValueForName:", v15, v20);
            v17 = [v16 objectValue];

            v18 = [(_PSContactEmbedding *)self convertToNSArrayFromMLMultiArray:v17];
            [v11 setObject:v18 forKey:v15];
          }
          uint64_t v12 = [&unk_1EF676350 countByEnumeratingWithState:&v26 objects:v37 count:16];
        }
        while (v12);
      }
      id v8 = [v11 copy];
    }

    uint64_t v7 = v20;
  }

  return v8;
}

- (id)convertToNSArrayFromMLMultiArray:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 count];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v4];
  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      uint64_t v7 = [v3 objectAtIndexedSubscript:i];
      [v5 setObject:v7 atIndexedSubscript:i];
    }
  }
  id v8 = (void *)[v5 copy];

  return v8;
}

- (MLModel)model
{
  return self->_model;
}

- (void).cxx_destruct
{
}

- (void)getEmbeddingFromFeatureDict:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A314B000, a2, OS_LOG_TYPE_ERROR, "Error while getting output from contact embedding model: %@", (uint8_t *)&v2, 0xCu);
}

- (void)getEmbeddingFromFeatureDict:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A314B000, a2, OS_LOG_TYPE_ERROR, "Error while preparing input for contact embedding model: %@", (uint8_t *)&v2, 0xCu);
}

@end