@interface PSFeaturePreprocessor
@end

@implementation PSFeaturePreprocessor

void __56___PSFeaturePreprocessor_rawDataToCandidateFeatureDict___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  v7 = objc_opt_new();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56___PSFeaturePreprocessor_rawDataToCandidateFeatureDict___block_invoke_2;
  v9[3] = &unk_1E5AE06E0;
  id v10 = v7;
  id v8 = v7;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v6];
}

void __56___PSFeaturePreprocessor_rawDataToCandidateFeatureDict___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v13 = a3;
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = objc_alloc(MEMORY[0x1E4F4FEE8]);
    id v7 = v13;
LABEL_8:
    id v9 = 0;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F4FEE8]);
    id v7 = 0;
    goto LABEL_8;
  }
  uint64_t v8 = [@"true" compare:v13 options:3];
  if (v8 && [@"false" compare:v13 options:3])
  {
    id v6 = objc_alloc(MEMORY[0x1E4F4FEE8]);
    id v7 = 0;
    id v9 = v13;
LABEL_9:
    id v10 = (void *)[v6 initWithIntValue:0 doubleValue:v7 stringValue:v9 BOOLValue:0 timeBucketValue:0];
    goto LABEL_10;
  }
  id v11 = objc_alloc(MEMORY[0x1E4F4FEE8]);
  v12 = [NSNumber numberWithBool:v8 == 0];
  id v10 = (void *)[v11 initWithIntValue:0 doubleValue:0 stringValue:0 BOOLValue:v12 timeBucketValue:0];

LABEL_10:
  [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:v5];
}

void __47___PSFeaturePreprocessor_encodeFeatureVectors___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_opt_new();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47___PSFeaturePreprocessor_encodeFeatureVectors___block_invoke_2;
  v11[3] = &unk_1E5AE0730;
  uint64_t v8 = *(void *)(a1 + 40);
  id v13 = v5;
  uint64_t v14 = v8;
  id v12 = v7;
  id v9 = v5;
  id v10 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:v11];

  [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:v9];
}

void __47___PSFeaturePreprocessor_encodeFeatureVectors___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 48) oneHotEncodedFeatureNameForFeatureName:v5 featureValue:v6];
  if (v7)
  {
    [*(id *)(a1 + 32) setObject:&unk_1EF6754C8 forKeyedSubscript:v7];
  }
  else
  {
    uint64_t v8 = [*(id *)(a1 + 48) getNumberFromVirtualFeatureValue:v6];
    id v9 = +[_PSLogging generalChannel];
    id v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v11 = *(void *)(a1 + 40);
        int v12 = 138412803;
        id v13 = v6;
        __int16 v14 = 2112;
        v15 = v8;
        __int16 v16 = 2113;
        uint64_t v17 = v11;
        _os_log_debug_impl(&dword_1A314B000, v10, OS_LOG_TYPE_DEBUG, "Feature value %@ produced encoded value %@ for candidate %{private}@", (uint8_t *)&v12, 0x20u);
      }

      [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v5];
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __47___PSFeaturePreprocessor_encodeFeatureVectors___block_invoke_2_cold_1((uint64_t)v5, v10);
      }
    }
  }
}

void __47___PSFeaturePreprocessor_encodeFeatureVectors___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A314B000, a2, OS_LOG_TYPE_ERROR, "Feature %@ unexpectedly produced a nil value", (uint8_t *)&v2, 0xCu);
}

@end