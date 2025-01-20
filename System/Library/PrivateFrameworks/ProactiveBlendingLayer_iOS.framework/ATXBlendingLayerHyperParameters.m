@interface ATXBlendingLayerHyperParameters
+ (id)abHelperWithMobileAssets;
+ (id)abHelperWithTrialAssets;
+ (id)sharedInstance;
- (ATXBlendingLayerHyperParameters)init;
- (BOOL)isSuggestionEligibleForAppPredictionPanel:(id)a3;
- (BOOL)isSuggestionEligibleForSuggestionsWidget:(id)a3;
- (BOOL)uiConfidenceLevelMetBySuggestion:(id)a3;
- (BOOL)uiIsEnabledForSuggestion:(id)a3 consumerSubType:(unsigned __int8)a4;
- (BOOL)uiSupportsClientModelIdForSuggestion:(id)a3 consumerSubType:(unsigned __int8)a4;
- (BOOL)uiSupportsExecutableTypeForSuggestion:(id)a3 consumerSubType:(unsigned __int8)a4;
- (BOOL)uiSupportsLayoutType:(int64_t)a3 consumerSubType:(unsigned __int8)a4;
- (BOOL)uiSupportsSuggestion:(id)a3 consumerSubType:(unsigned __int8)a4;
- (double)maxAgeOfStackSuggestionToConsiderStaleInSeconds;
- (double)sessionLogSamplingRate;
- (id)abGroup;
- (id)clientModelPriorityOrder;
- (id)clientModelsToConsiderForConsumerSubType;
- (id)clientModelsToConsiderForConsumerSubType:(unsigned __int8)a3;
- (id)consumerSubTypesToConsiderForClientModelIds:(id)a3;
- (id)executableTypesToConsiderForConsumerSubType:(unsigned __int8)a3;
- (id)initForTestingWithMobileAssetAssetsOnly;
- (id)initForTestingWithTrialAssetsOnly;
- (id)layoutsToConsiderForConsumerSubType:(unsigned __int8)a3;
- (int64_t)minConfidenceCategoryToConsider;
- (unint64_t)lohStacksToConsiderAboveAndBelowForDeduplication;
@end

@implementation ATXBlendingLayerHyperParameters

- (id)clientModelsToConsiderForConsumerSubType:(unsigned __int8)a3
{
  v4 = objc_msgSend(MEMORY[0x263F25168], "stringForConsumerSubtype:");
  if (v4)
  {
    v5 = +[ATXBlendingLayerHyperParameters sharedInstance];
    v6 = [v5 clientModelsToConsiderForConsumerSubType];
    v7 = [v6 objectForKeyedSubscript:v4];

    if (v7) {
      id v8 = v7;
    }
    else {
      id v8 = (id)objc_opt_new();
    }
    v10 = v8;
  }
  else
  {
    v9 = __atxlog_handle_blending();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[ATXBlendingLayerHyperParameters clientModelsToConsiderForConsumerSubType:](a3, v9);
    }

    v10 = objc_opt_new();
  }

  return v10;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2, &__block_literal_global);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult;
  return v2;
}

- (id)clientModelsToConsiderForConsumerSubType
{
  clientModelsToConsiderForConsumerSubType = self->_clientModelsToConsiderForConsumerSubType;
  if (!clientModelsToConsiderForConsumerSubType)
  {
    v4 = [(NSDictionary *)self->_parameters objectForKey:@"ClientModelsToConsiderForConsumerSubType"];
    v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __75__ATXBlendingLayerHyperParameters_clientModelsToConsiderForConsumerSubType__block_invoke;
    v10[3] = &unk_2645BF3A8;
    v6 = v5;
    v11 = v6;
    [v4 enumerateKeysAndObjectsUsingBlock:v10];
    v7 = self->_clientModelsToConsiderForConsumerSubType;
    self->_clientModelsToConsiderForConsumerSubType = v6;
    id v8 = v6;

    clientModelsToConsiderForConsumerSubType = self->_clientModelsToConsiderForConsumerSubType;
  }
  return clientModelsToConsiderForConsumerSubType;
}

- (ATXBlendingLayerHyperParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXBlendingLayerHyperParameters;
  v2 = [(ATXBlendingLayerHyperParameters *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F25000] dictionaryWithLegacyPathForClass:objc_opt_class()];
    parameters = v2->_parameters;
    v2->_parameters = (NSDictionary *)v3;
  }
  return v2;
}

+ (id)abHelperWithTrialAssets
{
  v2 = [MEMORY[0x263F25000] dictionaryForClass:a1];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F25008]) initWithAssetContents:v2];

  return v3;
}

+ (id)abHelperWithMobileAssets
{
  v2 = (void *)MEMORY[0x263F25000];
  uint64_t v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [v2 rawDictionaryUsingMobileAssetsForResource:v4 ofType:@"plist"];

  objc_super v6 = (void *)[objc_alloc(MEMORY[0x263F25008]) initWithAssetContents:v5];
  return v6;
}

- (id)initForTestingWithTrialAssetsOnly
{
  v6.receiver = self;
  v6.super_class = (Class)ATXBlendingLayerHyperParameters;
  v2 = [(ATXBlendingLayerHyperParameters *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F25000] dictionaryWithLegacyPathForClass:objc_opt_class()];
    parameters = v2->_parameters;
    v2->_parameters = (NSDictionary *)v3;
  }
  return v2;
}

- (id)initForTestingWithMobileAssetAssetsOnly
{
  v6.receiver = self;
  v6.super_class = (Class)ATXBlendingLayerHyperParameters;
  v2 = [(ATXBlendingLayerHyperParameters *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F25000] dictionaryWithLegacyPathForClass:objc_opt_class()];
    parameters = v2->_parameters;
    v2->_parameters = (NSDictionary *)v3;
  }
  return v2;
}

void __49__ATXBlendingLayerHyperParameters_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x223C88070]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult;
  sharedInstance__pasExprOnceResult = v1;
}

- (id)abGroup
{
  return [(NSDictionary *)self->_parameters objectForKey:@"abGroup"];
}

- (double)sessionLogSamplingRate
{
  v2 = [(NSDictionary *)self->_parameters objectForKey:@"SessionLogSamplingRate"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (double)maxAgeOfStackSuggestionToConsiderStaleInSeconds
{
  v2 = [(NSDictionary *)self->_parameters objectForKey:@"MaxAgeOfStackSuggestionToConsiderStaleInSeconds"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (unint64_t)lohStacksToConsiderAboveAndBelowForDeduplication
{
  v2 = [(NSDictionary *)self->_parameters objectForKey:@"LOHStacksToConsiderAboveAndBelowForDeduplication"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (BOOL)isSuggestionEligibleForSuggestionsWidget:(id)a3
{
  return [(ATXBlendingLayerHyperParameters *)self uiSupportsSuggestion:a3 consumerSubType:36];
}

- (BOOL)isSuggestionEligibleForAppPredictionPanel:(id)a3
{
  return [(ATXBlendingLayerHyperParameters *)self uiSupportsSuggestion:a3 consumerSubType:37];
}

- (id)clientModelPriorityOrder
{
  return [(NSDictionary *)self->_parameters objectForKey:@"ClientModelPriorityOrder"];
}

void __75__ATXBlendingLayerHyperParameters_clientModelsToConsiderForConsumerSubType__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = (objc_class *)MEMORY[0x263EFFA08];
  id v6 = a3;
  id v7 = a2;
  id v8 = (id)[[v5 alloc] initWithArray:v6];

  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v7];
}

- (BOOL)uiSupportsSuggestion:(id)a3 consumerSubType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([(ATXBlendingLayerHyperParameters *)self uiConfidenceLevelMetBySuggestion:v6]&& [(ATXBlendingLayerHyperParameters *)self uiSupportsClientModelIdForSuggestion:v6 consumerSubType:v4]&& [(ATXBlendingLayerHyperParameters *)self uiSupportsExecutableTypeForSuggestion:v6 consumerSubType:v4]&& [(ATXBlendingLayerHyperParameters *)self uiIsEnabledForSuggestion:v6 consumerSubType:v4])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = objc_msgSend(v6, "uiSpecification", 0);
    id v8 = [v7 preferredLayoutConfigs];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          if (-[ATXBlendingLayerHyperParameters uiSupportsLayoutType:consumerSubType:](self, "uiSupportsLayoutType:consumerSubType:", [*(id *)(*((void *)&v15 + 1) + 8 * i) applicableLayoutType], v4))
          {
            BOOL v13 = 1;
            goto LABEL_17;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    BOOL v13 = 0;
LABEL_17:
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)uiConfidenceLevelMetBySuggestion:(id)a3
{
  uint64_t v4 = [a3 scoreSpecification];
  uint64_t v5 = [v4 suggestedConfidenceCategory];
  LOBYTE(self) = v5 >= [(ATXBlendingLayerHyperParameters *)self minConfidenceCategoryToConsider];

  return (char)self;
}

- (BOOL)uiSupportsClientModelIdForSuggestion:(id)a3 consumerSubType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v7 = [(ATXBlendingLayerHyperParameters *)self clientModelsToConsiderForConsumerSubType:v4];
  id v8 = [v6 clientModelSpecification];

  uint64_t v9 = [v8 clientModelId];
  char v10 = [v7 containsObject:v9];

  return v10;
}

- (BOOL)uiSupportsLayoutType:(int64_t)a3 consumerSubType:(unsigned __int8)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  [(ATXBlendingLayerHyperParameters *)self layoutsToConsiderForConsumerSubType:a4];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v20 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v20) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(MEMORY[0x263F619E0], "minSuggestionLayoutTypesForUILayoutType:", objc_msgSend(v8, "integerValue"));
        char v10 = [NSNumber numberWithInteger:a3];
        uint64_t v11 = [v9 objectForKeyedSubscript:v10];
        uint64_t v12 = [v11 integerValue];

        if (v12 > 0) {
          goto LABEL_11;
        }
        BOOL v13 = objc_msgSend(MEMORY[0x263F619E0], "maxSuggestionLayoutTypesForUILayoutType:", objc_msgSend(v8, "integerValue"));
        v14 = [NSNumber numberWithInteger:a3];
        long long v15 = [v13 objectForKeyedSubscript:v14];
        uint64_t v16 = [v15 integerValue];

        if (v16 > 0)
        {
LABEL_11:
          BOOL v17 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      BOOL v17 = 0;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v17 = 0;
  }
LABEL_13:

  return v17;
}

- (BOOL)uiSupportsExecutableTypeForSuggestion:(id)a3 consumerSubType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v7 = [(ATXBlendingLayerHyperParameters *)self executableTypesToConsiderForConsumerSubType:v4];
  id v8 = NSNumber;
  uint64_t v9 = [v6 executableSpecification];

  char v10 = objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "executableType"));
  LOBYTE(v6) = [v7 containsObject:v10];

  return (char)v6;
}

- (BOOL)uiIsEnabledForSuggestion:(id)a3 consumerSubType:(unsigned __int8)a4
{
  int v4 = a4;
  id v5 = a3;
  id v6 = v5;
  BOOL v7 = 1;
  if (v4 > 33)
  {
    if (v4 == 37 || v4 == 36 || v4 == 34)
    {
      id v8 = [v5 uiSpecification];
      char v9 = [v8 allowedOnHomeScreen];
      goto LABEL_11;
    }
  }
  else
  {
    if (v4 == 9 || v4 == 21)
    {
      id v8 = [v5 uiSpecification];
      char v9 = [v8 allowedOnSpotlight];
      goto LABEL_11;
    }
    if (v4 == 22)
    {
      id v8 = [v5 uiSpecification];
      char v9 = [v8 allowedOnLockscreen];
LABEL_11:
      BOOL v7 = v9;
    }
  }

  return v7;
}

- (id)executableTypesToConsiderForConsumerSubType:(unsigned __int8)a3
{
  switch(a3)
  {
    case 0x15u:
      unint64_t v3 = (void *)MEMORY[0x223C88070](self, a2);
      id v4 = objc_alloc(MEMORY[0x263EFFA08]);
      v14 = &unk_26D3B09A8;
      long long v15 = 0;
      uint64_t v12 = &unk_26D3B0960;
      BOOL v13 = &unk_26D3B0990;
      goto LABEL_7;
    case 0x16u:
    case 0x29u:
    case 0x2Cu:
    case 0x2Eu:
      unint64_t v3 = (void *)MEMORY[0x223C88070](self, a2);
      id v4 = objc_alloc(MEMORY[0x263EFFA08]);
      uint64_t v12 = 0;
LABEL_7:
      id v6 = &unk_26D3B0918;
      goto LABEL_16;
    case 0x17u:
    case 0x18u:
    case 0x19u:
    case 0x1Au:
    case 0x1Bu:
    case 0x1Cu:
    case 0x1Du:
    case 0x1Eu:
    case 0x20u:
    case 0x21u:
    case 0x26u:
    case 0x27u:
    case 0x28u:
      goto LABEL_5;
    case 0x1Fu:
    case 0x23u:
    case 0x25u:
      goto LABEL_4;
    case 0x22u:
      unint64_t v3 = (void *)MEMORY[0x223C88070](self, a2);
      id v4 = objc_alloc(MEMORY[0x263EFFA08]);
      uint64_t v16 = &unk_26D3B0978;
      uint64_t v17 = 0;
      BOOL v7 = &unk_26D3B0960;
      id v8 = &unk_26D3B0948;
      goto LABEL_13;
    case 0x24u:
      unint64_t v3 = (void *)MEMORY[0x223C88070](self, a2);
      id v4 = objc_alloc(MEMORY[0x263EFFA08]);
      v14 = &unk_26D3B0978;
      long long v15 = 0;
      char v9 = &unk_26D3B0960;
      goto LABEL_14;
    case 0x2Au:
      unint64_t v3 = (void *)MEMORY[0x223C88070](self, a2);
      uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", &unk_26D3B09C0, 0, v13, v14, v15, v16, v17);
      goto LABEL_17;
    case 0x2Bu:
      unint64_t v3 = (void *)MEMORY[0x223C88070](self, a2);
      uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", &unk_26D3B09D8, 0, v13, v14, v15, v16, v17);
      goto LABEL_17;
    case 0x2Du:
      unint64_t v3 = (void *)MEMORY[0x223C88070](self, a2);
      id v4 = objc_alloc(MEMORY[0x263EFFA08]);
      uint64_t v16 = 0;
      BOOL v7 = &unk_26D3B0978;
      id v8 = &unk_26D3B09C0;
LABEL_13:
      v14 = v8;
      long long v15 = v7;
      char v9 = &unk_26D3B0930;
LABEL_14:
      uint64_t v12 = &unk_26D3B0918;
      BOOL v13 = v9;
      goto LABEL_15;
    case 0x2Fu:
      unint64_t v3 = (void *)MEMORY[0x223C88070](self, a2);
      uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", &unk_26D3B0930, 0, v13, v14, v15, v16, v17);
      goto LABEL_17;
    default:
      if (a3 == 9)
      {
LABEL_4:
        unint64_t v3 = (void *)MEMORY[0x223C88070](self, a2);
        id v4 = objc_alloc(MEMORY[0x263EFFA08]);
        uint64_t v12 = 0;
LABEL_15:
        id v6 = &unk_26D3B0900;
LABEL_16:
        uint64_t v10 = objc_msgSend(v4, "initWithObjects:", v6, v12, v13, v14, v15, v16, v17);
LABEL_17:
        id v5 = (void *)v10;
      }
      else
      {
LABEL_5:
        id v5 = objc_opt_new();
      }
      return v5;
  }
}

- (id)consumerSubTypesToConsiderForClientModelIds:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = +[ATXBlendingLayerHyperParameters sharedInstance];
    id v5 = [v4 clientModelsToConsiderForConsumerSubType];

    id v6 = objc_opt_new();
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __79__ATXBlendingLayerHyperParameters_consumerSubTypesToConsiderForClientModelIds___block_invoke;
    v11[3] = &unk_2645BF3D0;
    id v12 = v3;
    id v7 = v6;
    id v13 = v7;
    [v5 enumerateKeysAndObjectsUsingBlock:v11];
    id v8 = v13;
    id v9 = v7;
  }
  else
  {
    id v9 = (id)objc_opt_new();
  }

  return v9;
}

void __79__ATXBlendingLayerHyperParameters_consumerSubTypesToConsiderForClientModelIds___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        if ([*(id *)(a1 + 32) containsObject:*(void *)(*((void *)&v15 + 1) + 8 * i)])
        {
          char v14 = 0;
          uint64_t v11 = [MEMORY[0x263F25168] consumerSubtypeForString:v5 found:&v14];
          if (v14)
          {
            id v12 = *(void **)(a1 + 40);
            id v13 = [NSNumber numberWithUnsignedChar:v11];
            [v12 addObject:v13];
          }
          goto LABEL_12;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

- (id)layoutsToConsiderForConsumerSubType:(unsigned __int8)a3
{
  id result = &unk_26D3B0A68;
  switch(a3)
  {
    case 0x15u:
    case 0x16u:
    case 0x29u:
    case 0x2Bu:
    case 0x2Cu:
      id result = &unk_26D3B0AC8;
      break;
    case 0x17u:
    case 0x18u:
    case 0x19u:
    case 0x1Au:
    case 0x1Bu:
    case 0x1Cu:
    case 0x1Du:
    case 0x1Eu:
    case 0x20u:
    case 0x21u:
    case 0x26u:
    case 0x27u:
    case 0x28u:
      goto LABEL_6;
    case 0x1Fu:
    case 0x23u:
      id result = &unk_26D3B0AF8;
      break;
    case 0x22u:
      return result;
    case 0x24u:
      id result = &unk_26D3B0A98;
      break;
    case 0x25u:
      id result = &unk_26D3B0A80;
      break;
    case 0x2Au:
      id result = &unk_26D3B0AE0;
      break;
    case 0x2Du:
      id result = &unk_26D3B0B10;
      break;
    case 0x2Eu:
      id result = &unk_26D3B0B28;
      break;
    case 0x2Fu:
      id result = &unk_26D3B0B40;
      break;
    default:
      if (a3 == 9) {
        id result = &unk_26D3B0AB0;
      }
      else {
LABEL_6:
      }
        id result = (id)MEMORY[0x263EFFA68];
      break;
  }
  return result;
}

- (int64_t)minConfidenceCategoryToConsider
{
  return 2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientModelsToConsiderForConsumerSubType, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
}

- (void)clientModelsToConsiderForConsumerSubType:(unsigned __int8)a1 .cold.1(unsigned __int8 a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_2216A5000, a2, OS_LOG_TYPE_FAULT, "Asked for allowed client model ids for unsupported consumer sub type %hhu", (uint8_t *)v2, 8u);
}

@end