@interface PSFamilyMLPredictionTask
@end

@implementation PSFamilyMLPredictionTask

BOOL __37___PSFamilyMLPredictionTask_execute___block_invoke(uint64_t a1)
{
  BOOL should_defer = xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32));
  if (should_defer)
  {
    xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 3);
    v3 = +[_PSLogging familyRecommenderChannel];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1A314B000, v3, OS_LOG_TYPE_INFO, "_CDDataCollection XPC Activity: Deferred", v5, 2u);
    }
  }
  return !should_defer;
}

void __37___PSFamilyMLPredictionTask_execute___block_invoke_4(uint64_t a1, void *a2, unsigned char *a3)
{
  id v18 = a2;
  v5 = (void *)MEMORY[0x1A6243860]();
  if ((*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))())
  {
    v6 = [*(id *)(a1 + 32) getFeatureDictForContact:v18];
    if ([v6 count])
    {
      if (+[_PSFamilyUtilities contactMarkedAsFamilyInFeatureDict:v6])
      {
        v7 = *(void **)(a1 + 40);
        v8 = [v18 identifier];
        [v7 addObject:v8];
      }
      v9 = [*(id *)(a1 + 32) predictionForContact:v18 featureDict:v6];
      v10 = v9;
      if (v9)
      {
        v11 = [v9 featureValueForName:@"labelFinal"];
        uint64_t v12 = [v11 int64Value];

        if (v12 == 1)
        {
          v13 = [v10 featureValueForName:@"classProbability"];
          v14 = [v13 dictionaryValue];

          v15 = [v14 objectForKeyedSubscript:&unk_1EF675210];
          v16 = *(void **)(a1 + 48);
          v17 = [v18 identifier];
          [v16 setObject:v15 forKeyedSubscript:v17];
        }
      }
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    *a3 = 1;
  }
}

uint64_t __37___PSFamilyMLPredictionTask_execute___block_invoke_14(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __37___PSFamilyMLPredictionTask_execute___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3)
  {
    v4 = +[_PSLogging familyRecommenderChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __37___PSFamilyMLPredictionTask_execute___block_invoke_2_cold_1((uint64_t)v3, v4);
    }
  }
}

void __37___PSFamilyMLPredictionTask_execute___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A314B000, a2, OS_LOG_TYPE_ERROR, "Error saving feedback event to knowledge store: %@", (uint8_t *)&v2, 0xCu);
}

@end