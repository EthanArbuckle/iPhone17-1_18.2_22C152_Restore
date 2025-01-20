@interface TPSContextualBiomeDiscoverabilitySignalsEvent
- (id)_filteringPredicate;
- (id)filterHandler;
- (id)filterParametersForBiomeQuery;
- (id)publisherFromStartTime:(double)a3;
@end

@implementation TPSContextualBiomeDiscoverabilitySignalsEvent

- (id)publisherFromStartTime:(double)a3
{
  v4 = BiomeLibrary();
  v5 = [v4 Discoverability];
  v6 = [v5 Signals];

  v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a3];
  id v8 = objc_alloc(MEMORY[0x1E4F503E8]);
  v9 = [MEMORY[0x1E4F1C9C8] date];
  v10 = (void *)[v8 initWithStartDate:v7 endDate:v9 maxEvents:0 lastN:0 reversed:0];

  v11 = [v6 publisherWithUseCase:@"FeatureDiscoverability" options:v10];

  return v11;
}

- (id)filterHandler
{
  v2 = [(TPSContextualBiomeDiscoverabilitySignalsEvent *)self _filteringPredicate];
  v3 = v2;
  if (v2)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __62__TPSContextualBiomeDiscoverabilitySignalsEvent_filterHandler__block_invoke;
    aBlock[3] = &unk_1E5906CF8;
    id v7 = v2;
    v4 = _Block_copy(aBlock);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __62__TPSContextualBiomeDiscoverabilitySignalsEvent_filterHandler__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 eventBody];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = [*(id *)(a1 + 32) evaluateWithObject:v3];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)filterParametersForBiomeQuery
{
  v3 = [(TPSContextualBiomeEvent *)self filterInfo];

  if (v3)
  {
    v27.receiver = self;
    v27.super_class = (Class)TPSContextualBiomeDiscoverabilitySignalsEvent;
    uint64_t v4 = [(TPSContextualBiomeEvent *)&v27 filterParametersForBiomeQuery];
    v5 = (void *)[v4 mutableCopy];
    v6 = v5;
    if (v5) {
      id v7 = v5;
    }
    else {
      id v7 = (id)objc_opt_new();
    }
    v9 = v7;

    v10 = [(TPSContextualBiomeEvent *)self filterInfo];
    v11 = [v10 TPSSafeObjectForKey:@"contentIdentifier"];

    if (v11)
    {
      v12 = [(TPSContextualBiomeEvent *)self filterInfo];
      v13 = [v12 TPSSafeStringForKey:@"contentIdentifier"];
      [v9 setObject:v13 forKeyedSubscript:@"contentIdentifier"];
    }
    v14 = [(TPSContextualBiomeEvent *)self filterInfo];
    v15 = [v14 TPSSafeObjectForKey:@"context"];

    if (v15)
    {
      v16 = [(TPSContextualBiomeEvent *)self filterInfo];
      v17 = [v16 TPSSafeStringForKey:@"context"];
      [v9 setObject:v17 forKeyedSubscript:@"context"];
    }
    v18 = [(TPSContextualBiomeEvent *)self filterInfo];
    v19 = [v18 TPSSafeObjectForKey:@"osBuild"];

    if (v19)
    {
      v20 = [(TPSContextualBiomeEvent *)self filterInfo];
      v21 = [v20 TPSSafeStringForKey:@"osBuild"];
      [v9 setObject:v21 forKeyedSubscript:@"osBuild"];
    }
    v22 = [(TPSContextualBiomeEvent *)self filterInfo];
    v23 = [v22 TPSSafeDictionaryForKey:@"userInfo"];

    if (v23)
    {
      v24 = [(TPSContextualBiomeEvent *)self filterInfo];
      v25 = [v24 TPSSafeDictionaryForKey:@"userInfo"];

      if (v25) {
        [v9 setObject:v25 forKeyedSubscript:@"userInfo"];
      }
    }
    id v8 = (void *)[v9 copy];
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (id)_filteringPredicate
{
  v3 = [(TPSContextualBiomeEvent *)self filterInfo];

  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v5 = [(TPSContextualBiomeEvent *)self filterInfo];
    v6 = [v5 TPSSafeObjectForKey:@"contentIdentifier"];

    if (v6)
    {
      id v7 = [(TPSContextualBiomeEvent *)self filterInfo];
      id v8 = [v7 TPSSafeStringForKey:@"contentIdentifier"];

      v9 = (void *)MEMORY[0x1E4F28F60];
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __68__TPSContextualBiomeDiscoverabilitySignalsEvent__filteringPredicate__block_invoke;
      v44[3] = &unk_1E5907208;
      id v45 = v8;
      id v10 = v8;
      v11 = [v9 predicateWithBlock:v44];
      [v4 addObject:v11];
    }
    v12 = [(TPSContextualBiomeEvent *)self filterInfo];
    v13 = [v12 TPSSafeObjectForKey:@"context"];

    if (v13)
    {
      v14 = [(TPSContextualBiomeEvent *)self filterInfo];
      v15 = [v14 TPSSafeStringForKey:@"context"];

      v16 = (void *)MEMORY[0x1E4F28F60];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __68__TPSContextualBiomeDiscoverabilitySignalsEvent__filteringPredicate__block_invoke_2;
      v42[3] = &unk_1E5907208;
      id v43 = v15;
      id v17 = v15;
      v18 = [v16 predicateWithBlock:v42];
      [v4 addObject:v18];
    }
    v19 = [(TPSContextualBiomeEvent *)self filterInfo];
    v20 = [v19 TPSSafeObjectForKey:@"context"];

    if (v20)
    {
      v21 = [(TPSContextualBiomeEvent *)self filterInfo];
      v22 = [v21 TPSSafeStringForKey:@"osBuild"];

      v23 = (void *)MEMORY[0x1E4F28F60];
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __68__TPSContextualBiomeDiscoverabilitySignalsEvent__filteringPredicate__block_invoke_3;
      v40[3] = &unk_1E5907208;
      id v41 = v22;
      id v24 = v22;
      v25 = [v23 predicateWithBlock:v40];
      [v4 addObject:v25];
    }
    v26 = [(TPSContextualBiomeEvent *)self filterInfo];
    objc_super v27 = [v26 TPSSafeDictionaryForKey:@"userInfo"];

    if (v27)
    {
      v28 = [(TPSContextualBiomeEvent *)self filterInfo];
      v29 = [v28 TPSSafeDictionaryForKey:@"userInfo"];

      v30 = (void *)MEMORY[0x1E4F28F60];
      uint64_t v35 = MEMORY[0x1E4F143A8];
      uint64_t v36 = 3221225472;
      v37 = __68__TPSContextualBiomeDiscoverabilitySignalsEvent__filteringPredicate__block_invoke_4;
      v38 = &unk_1E5907208;
      id v39 = v29;
      id v31 = v29;
      v32 = [v30 predicateWithBlock:&v35];
      objc_msgSend(v4, "addObject:", v32, v35, v36, v37, v38);
    }
    if ([v4 count])
    {
      v33 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v4];
    }
    else
    {
      v33 = 0;
    }
  }
  else
  {
    v33 = 0;
  }
  return v33;
}

uint64_t __68__TPSContextualBiomeDiscoverabilitySignalsEvent__filteringPredicate__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 contentIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __68__TPSContextualBiomeDiscoverabilitySignalsEvent__filteringPredicate__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 context];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __68__TPSContextualBiomeDiscoverabilitySignalsEvent__filteringPredicate__block_invoke_3(uint64_t a1, void *a2)
{
  v3 = [a2 osBuild];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

BOOL __68__TPSContextualBiomeDiscoverabilitySignalsEvent__filteringPredicate__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 userInfo];
  if (v7)
  {
  }
  else if (!*(void *)(a1 + 32))
  {
    BOOL v14 = 1;
    goto LABEL_12;
  }
  id v8 = [v5 userInfo];
  if (v8)
  {
    id v23 = 0;
    v9 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v8 options:0 error:&v23];
    id v10 = v23;
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 1;
    v11 = *(void **)(a1 + 32);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __68__TPSContextualBiomeDiscoverabilitySignalsEvent__filteringPredicate__block_invoke_5;
    v16[3] = &unk_1E5907230;
    id v12 = v9;
    id v17 = v12;
    v18 = &v19;
    [v11 enumerateKeysAndObjectsUsingBlock:v16];
    if (v10)
    {
      v13 = +[TPSLogger default];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __68__TPSContextualBiomeDiscoverabilitySignalsEvent__filteringPredicate__block_invoke_4_cold_1((uint64_t)v10, v13);
      }
    }
    BOOL v14 = *((unsigned char *)v20 + 24) != 0;

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    BOOL v14 = 0;
  }

LABEL_12:
  return v14;
}

void __68__TPSContextualBiomeDiscoverabilitySignalsEvent__filteringPredicate__block_invoke_5(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v20 = a2;
  id v7 = a3;
  id v8 = self;
  if (objc_opt_isKindOfClass())
  {
    v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v20];
    id v10 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    id v12 = v20;
    if (isKindOfClass)
    {
      v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:v20];
      BOOL v14 = [v7 firstObjectCommonWithArray:v13];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v14 != 0;

      goto LABEL_9;
    }
  }
  else
  {

    id v12 = v20;
  }
  v15 = [*(id *)(a1 + 32) objectForKeyedSubscript:v12];
  v16 = self;
  char v17 = objc_opt_isKindOfClass();

  v18 = [*(id *)(a1 + 32) objectForKeyedSubscript:v20];
  v13 = v18;
  if (v17) {
    char v19 = [v18 containsObject:v7];
  }
  else {
    char v19 = [v7 isEqual:v18];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v19;
LABEL_9:

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a4 = 1;
  }
}

void __68__TPSContextualBiomeDiscoverabilitySignalsEvent__filteringPredicate__block_invoke_4_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C8DC000, a2, OS_LOG_TYPE_ERROR, "Failed to parse userInfoDictionary. Error: %@", (uint8_t *)&v2, 0xCu);
}

@end