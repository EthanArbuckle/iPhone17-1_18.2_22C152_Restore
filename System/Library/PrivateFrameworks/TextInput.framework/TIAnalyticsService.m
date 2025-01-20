@interface TIAnalyticsService
+ (id)sharedInstance;
+ (void)setMockInstance:(id)a3;
- (BOOL)dispatchEventWithName:(id)a3 error:(id *)a4;
- (BOOL)dispatchEventWithName:(id)a3 inputMode:(id)a4 error:(id *)a5;
- (BOOL)dispatchEventWithName:(id)a3 payload:(id)a4 testingParameters:(id)a5 allowSparsePayload:(BOOL)a6 error:(id *)a7;
- (BOOL)dispatchEventWithName:(id)a3 values:(id)a4 error:(id *)a5;
- (BOOL)dispatchEventWithName:(id)a3 values:(id)a4 inputMode:(id)a5 error:(id *)a6;
- (BOOL)registerEventSpec:(id)a3 error:(id *)a4;
- (NSMutableDictionary)eventSpecs;
- (TIAnalyticsService)init;
- (TIAnalyticsService)initWithProvider:(id)a3;
- (TIAnalyticsServiceProvider)provider;
- (id)settingsFromInputMode:(id)a3 eventSpec:(id)a4 errors:(id)a5;
- (id)settingsFromPayload:(id)a3 andValues:(id)a4 eventSpec:(id)a5 allowSparsePayload:(BOOL)a6 errors:(id)a7;
- (void)_dispatchEventToDomain:(id)a3 withName:(id)a4 payload:(id)a5 values:(id)a6 inputMode:(id)a7 testingParameters:(id)a8 allowSparsePayload:(BOOL)a9 withCompletionHandler:(id)a10;
- (void)_registerEventSpec:(id)a3 withCompletionHandler:(id)a4;
- (void)addSettings:(id)a3 toPayload:(id)a4 errors:(id)a5;
- (void)appendToErrors:(id)a3 code:(int64_t)a4 message:(id)a5;
- (void)dispatchEventToInputAnalyticsDomainWithName:(id)a3 payload:(id)a4 testingParameters:(id)a5 allowSparsePayload:(BOOL)a6;
- (void)dispatchEventWithName:(id)a3;
- (void)dispatchEventWithName:(id)a3 inputMode:(id)a4;
- (void)dispatchEventWithName:(id)a3 inputMode:(id)a4 withCompletionHandler:(id)a5;
- (void)dispatchEventWithName:(id)a3 payload:(id)a4 testingParameters:(id)a5 allowSparsePayload:(BOOL)a6;
- (void)dispatchEventWithName:(id)a3 payload:(id)a4 testingParameters:(id)a5 allowSparsePayload:(BOOL)a6 withCompletionHandler:(id)a7;
- (void)dispatchEventWithName:(id)a3 values:(id)a4;
- (void)dispatchEventWithName:(id)a3 values:(id)a4 inputMode:(id)a5;
- (void)dispatchEventWithName:(id)a3 values:(id)a4 inputMode:(id)a5 withCompletionHandler:(id)a6;
- (void)dispatchEventWithName:(id)a3 values:(id)a4 withCompletionHandler:(id)a5;
- (void)dispatchEventWithName:(id)a3 withCompletionHandler:(id)a4;
- (void)queueCompletionHandler:(id)a3;
- (void)registerEventSpec:(id)a3;
- (void)sendCoreAnalyticsEventToDomain:(id)a3 withName:(id)a4 payload:(id)a5;
@end

@implementation TIAnalyticsService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_eventSpecs, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (TIAnalyticsServiceProvider)provider
{
  return self->_provider;
}

- (NSMutableDictionary)eventSpecs
{
  return self->_eventSpecs;
}

- (void)queueCompletionHandler:(id)a3
{
}

- (void)sendCoreAnalyticsEventToDomain:(id)a3 withName:(id)a4 payload:(id)a5
{
  id v8 = a5;
  id v10 = [a3 stringByAppendingFormat:@".%@", a4];
  v9 = [(TIAnalyticsService *)self provider];
  [v9 dispatchEventWithName:v10 payload:v8];
}

- (void)appendToErrors:(id)a3 code:(int64_t)a4 message:(id)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v7 = (objc_class *)NSString;
  id v8 = a5;
  id v9 = a3;
  id v10 = (void *)[[v7 alloc] initWithFormat:v8 arguments:&v16];

  v11 = (void *)MEMORY[0x1E4F28C58];
  v14 = @"message";
  v15[0] = v10;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  v13 = [v11 errorWithDomain:@"TIAnalyticsErrorDomain" code:a4 userInfo:v12];
  [v9 addObject:v13];
}

- (id)settingsFromPayload:(id)a3 andValues:(id)a4 eventSpec:(id)a5 allowSparsePayload:(BOOL)a6 errors:(id)a7
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  v14 = v13;
  if (v10 && v11)
  {
    v15 = @"Either the 'payload' or the 'values' argument must be nil.";
    uint64_t v16 = self;
    v17 = v14;
    uint64_t v18 = 6;
LABEL_11:
    [(TIAnalyticsService *)v16 appendToErrors:v17 code:v18 message:v15];
    id v24 = 0;
    goto LABEL_37;
  }
  if (!v11)
  {
    if (!v10)
    {
      v49 = v13;
      id v46 = 0;
      id v47 = 0;
      uint64_t v25 = objc_opt_new();
      goto LABEL_13;
    }
LABEL_9:
    v49 = v14;
    id v46 = v11;
    id v47 = v10;
    uint64_t v25 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v10];
LABEL_13:
    id v24 = (id)v25;
    goto LABEL_14;
  }
  uint64_t v19 = [v11 count];
  v20 = [v12 fieldSpecs];
  uint64_t v21 = [v20 count];

  if (v19 != v21)
  {
    v15 = @"The value count must match the field count.";
    uint64_t v16 = self;
    v17 = v14;
    uint64_t v18 = 7;
    goto LABEL_11;
  }
  if (v10) {
    goto LABEL_9;
  }
  v49 = v14;
  id v47 = 0;
  v22 = [MEMORY[0x1E4F1CA60] dictionary];
  v23 = [v12 fieldSpecs];
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __88__TIAnalyticsService_settingsFromPayload_andValues_eventSpec_allowSparsePayload_errors___block_invoke;
  v60[3] = &unk_1E5559990;
  id v24 = v22;
  id v61 = v24;
  id v46 = v11;
  id v62 = v11;
  [v23 enumerateObjectsUsingBlock:v60];

LABEL_14:
  v26 = objc_opt_new();
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v45 = v12;
  v27 = [v12 fieldSpecs];
  uint64_t v28 = [v27 countByEnumeratingWithState:&v56 objects:v64 count:16];
  if (!v28) {
    goto LABEL_27;
  }
  uint64_t v29 = v28;
  uint64_t v30 = *(void *)v57;
  do
  {
    for (uint64_t i = 0; i != v29; ++i)
    {
      if (*(void *)v57 != v30) {
        objc_enumerationMutation(v27);
      }
      v32 = *(void **)(*((void *)&v56 + 1) + 8 * i);
      v33 = [v32 name];
      v34 = [v24 objectForKey:v33];

      if (v34)
      {
        id v55 = 0;
        char v35 = [v32 validate:v34 error:&v55];
        id v36 = v55;
        if ((v35 & 1) == 0) {
          [v49 addObject:v36];
        }
      }
      else
      {
        if (a6) {
          goto LABEL_25;
        }
        id v36 = [v32 name];
        [(TIAnalyticsService *)self appendToErrors:v49, 8, @"The value for field '%@' is missing.", v36 code message];
      }

LABEL_25:
      v37 = [v32 name];
      [v26 addObject:v37];
    }
    uint64_t v29 = [v27 countByEnumeratingWithState:&v56 objects:v64 count:16];
  }
  while (v29);
LABEL_27:

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v38 = [v24 allKeys];
  uint64_t v39 = [v38 countByEnumeratingWithState:&v51 objects:v63 count:16];
  id v12 = v45;
  v14 = v49;
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v52;
    do
    {
      for (uint64_t j = 0; j != v40; ++j)
      {
        if (*(void *)v52 != v41) {
          objc_enumerationMutation(v38);
        }
        uint64_t v43 = *(void *)(*((void *)&v51 + 1) + 8 * j);
        if (([v26 containsObject:v43] & 1) == 0) {
          [(TIAnalyticsService *)self appendToErrors:v49, 9, @"The field '%@' is not defined in the event.", v43 code message];
        }
      }
      uint64_t v40 = [v38 countByEnumeratingWithState:&v51 objects:v63 count:16];
    }
    while (v40);
  }

  id v11 = v46;
  id v10 = v47;
LABEL_37:

  return v24;
}

void __88__TIAnalyticsService_settingsFromPayload_andValues_eventSpec_allowSparsePayload_errors___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  id v6 = a2;
  id v8 = [v5 objectAtIndex:a3];
  v7 = [v6 name];

  [v4 setObject:v8 forKey:v7];
}

- (id)settingsFromInputMode:(id)a3 eventSpec:(id)a4 errors:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([a4 isInputModeRequired])
  {
    if (v8 && [v8 length])
    {
      id v10 = +[TIInputModeParser sharedInstance];
      id v11 = [v10 parseInputMode:v8];

      goto LABEL_11;
    }
    id v12 = @"The input mode is required.";
    id v13 = self;
    id v14 = v9;
    uint64_t v15 = 4;
  }
  else
  {
    if (!v8 || ![v8 length]) {
      goto LABEL_10;
    }
    id v12 = @"The input mode is not required and should not be provided.";
    id v13 = self;
    id v14 = v9;
    uint64_t v15 = 5;
  }
  [(TIAnalyticsService *)v13 appendToErrors:v14 code:v15 message:v12];
LABEL_10:
  id v11 = 0;
LABEL_11:

  return v11;
}

- (void)addSettings:(id)a3 toPayload:(id)a4 errors:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v18 = v8;
    id v11 = [v8 allKeys];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          v17 = [v9 objectForKeyedSubscript:v16];

          if (v17) {
            [(TIAnalyticsService *)self appendToErrors:v10, 3, @"The event payload already includes the '%@' key.", v16 code message];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }

    id v8 = v18;
    [v9 addEntriesFromDictionary:v18];
  }
}

- (void)_dispatchEventToDomain:(id)a3 withName:(id)a4 payload:(id)a5 values:(id)a6 inputMode:(id)a7 testingParameters:(id)a8 allowSparsePayload:(BOOL)a9 withCompletionHandler:(id)a10
{
  id v16 = a3;
  id v17 = a10;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  long long v22 = (void *)[a4 copy];
  v23 = (void *)[v21 copy];

  uint64_t v24 = (void *)[v20 copy];
  uint64_t v25 = (void *)[v19 copy];

  v26 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v18 copyItems:1];
  queue = self->_queue;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __138__TIAnalyticsService__dispatchEventToDomain_withName_payload_values_inputMode_testingParameters_allowSparsePayload_withCompletionHandler___block_invoke;
  v35[3] = &unk_1E5559968;
  v35[4] = self;
  id v36 = v22;
  id v37 = v25;
  id v38 = v23;
  BOOL v43 = a9;
  id v39 = v24;
  id v40 = v26;
  id v41 = v16;
  id v42 = v17;
  id v28 = v17;
  id v29 = v16;
  id v30 = v26;
  id v31 = v24;
  id v32 = v23;
  id v33 = v25;
  id v34 = v22;
  TIDispatchAsync(queue, v35);
}

void __138__TIAnalyticsService__dispatchEventToDomain_withName_payload_values_inputMode_testingParameters_allowSparsePayload_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  v3 = [*(id *)(a1 + 32) eventSpecs];
  v4 = [v3 objectForKey:*(void *)(a1 + 40)];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F1CA60] dictionary];
    id v6 = *(void **)(a1 + 32);
    v7 = [v6 settingsFromInputMode:*(void *)(a1 + 48) eventSpec:v4 errors:v2];
    [v6 addSettings:v7 toPayload:v5 errors:v2];

    id v8 = *(void **)(a1 + 32);
    id v9 = [v8 settingsFromPayload:*(void *)(a1 + 56) andValues:*(void *)(a1 + 64) eventSpec:v4 allowSparsePayload:*(unsigned __int8 *)(a1 + 96) errors:v2];
    [v8 addSettings:v9 toPayload:v5 errors:v2];

    [*(id *)(a1 + 32) addSettings:*(void *)(a1 + 72) toPayload:v5 errors:v2];
    if ([v2 count])
    {
      id v10 = IXADefaultLogFacility();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v17 = [NSString stringWithFormat:@"%s Unable to dispatch event '%@' because of the following errors:", "-[TIAnalyticsService _dispatchEventToDomain:withName:payload:values:inputMode:testingParameters:allowSparsePayload:withCompletionHandler:]_block_invoke", *(void *)(a1 + 40)];
        *(_DWORD *)buf = 138412290;
        id v21 = v17;
        _os_log_error_impl(&dword_18D240000, v10, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
      [v2 enumerateObjectsUsingBlock:&__block_literal_global_271];
    }
    else
    {
      [*(id *)(a1 + 32) sendCoreAnalyticsEventToDomain:*(void *)(a1 + 80) withName:*(void *)(a1 + 40) payload:v5];
    }
  }
  else
  {
    v5 = [NSString stringWithFormat:@"Unable to dispatch event '%@' because it's not registered.", *(void *)(a1 + 40)];
    id v11 = IXADefaultLogFacility();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = [NSString stringWithFormat:@"%s %@", "-[TIAnalyticsService _dispatchEventToDomain:withName:payload:values:inputMode:testingParameters:allowSparsePayload:withCompletionHandler:]_block_invoke", v5];
      *(_DWORD *)buf = 138412290;
      id v21 = v12;
      _os_log_impl(&dword_18D240000, v11, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    id v18 = @"message";
    id v19 = v5;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    uint64_t v15 = [v13 errorWithDomain:@"TIAnalyticsErrorDomain" code:0 userInfo:v14];
    [v2 addObject:v15];
  }
  uint64_t v16 = *(void *)(a1 + 88);
  if (v16) {
    (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v2);
  }
}

void __138__TIAnalyticsService__dispatchEventToDomain_withName_payload_values_inputMode_testingParameters_allowSparsePayload_withCompletionHandler___block_invoke_268(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = IXADefaultLogFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = NSString;
    v5 = [v2 userInfo];
    id v6 = [v5 objectForKey:@"message"];
    v7 = [v4 stringWithFormat:@"%s   %@", "-[TIAnalyticsService _dispatchEventToDomain:withName:payload:values:inputMode:testingParameters:allowSparsePayload:withCompletionHandler:]_block_invoke", v6];
    *(_DWORD *)buf = 138412290;
    id v9 = v7;
    _os_log_error_impl(&dword_18D240000, v3, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }
}

- (void)dispatchEventToInputAnalyticsDomainWithName:(id)a3 payload:(id)a4 testingParameters:(id)a5 allowSparsePayload:(BOOL)a6
{
  LOBYTE(v6) = a6;
  [(TIAnalyticsService *)self _dispatchEventToDomain:@"com.apple.inputAnalytics" withName:a3 payload:a4 values:0 inputMode:0 testingParameters:a5 allowSparsePayload:v6 withCompletionHandler:0];
}

- (BOOL)dispatchEventWithName:(id)a3 payload:(id)a4 testingParameters:(id)a5 allowSparsePayload:(BOOL)a6 error:(id *)a7
{
  LOBYTE(v8) = a6;
  [(TIAnalyticsService *)self _dispatchEventToDomain:@"com.apple.keyboard" withName:a3 payload:a4 values:0 inputMode:0 testingParameters:a5 allowSparsePayload:v8 withCompletionHandler:0];
  return 1;
}

- (BOOL)dispatchEventWithName:(id)a3 values:(id)a4 inputMode:(id)a5 error:(id *)a6
{
  LOBYTE(v7) = 0;
  [(TIAnalyticsService *)self _dispatchEventToDomain:@"com.apple.keyboard" withName:a3 payload:0 values:a4 inputMode:a5 testingParameters:0 allowSparsePayload:v7 withCompletionHandler:0];
  return 1;
}

- (BOOL)dispatchEventWithName:(id)a3 values:(id)a4 error:(id *)a5
{
  LOBYTE(v6) = 0;
  [(TIAnalyticsService *)self _dispatchEventToDomain:@"com.apple.keyboard" withName:a3 payload:0 values:a4 inputMode:0 testingParameters:0 allowSparsePayload:v6 withCompletionHandler:0];
  return 1;
}

- (BOOL)dispatchEventWithName:(id)a3 inputMode:(id)a4 error:(id *)a5
{
  LOBYTE(v6) = 0;
  [(TIAnalyticsService *)self _dispatchEventToDomain:@"com.apple.keyboard" withName:a3 payload:0 values:0 inputMode:a4 testingParameters:0 allowSparsePayload:v6 withCompletionHandler:0];
  return 1;
}

- (BOOL)dispatchEventWithName:(id)a3 error:(id *)a4
{
  LOBYTE(v5) = 0;
  [(TIAnalyticsService *)self _dispatchEventToDomain:@"com.apple.keyboard" withName:a3 payload:0 values:0 inputMode:0 testingParameters:0 allowSparsePayload:v5 withCompletionHandler:0];
  return 1;
}

- (void)dispatchEventWithName:(id)a3 payload:(id)a4 testingParameters:(id)a5 allowSparsePayload:(BOOL)a6 withCompletionHandler:(id)a7
{
  LOBYTE(v7) = a6;
  [(TIAnalyticsService *)self _dispatchEventToDomain:@"com.apple.keyboard" withName:a3 payload:a4 values:0 inputMode:0 testingParameters:a5 allowSparsePayload:v7 withCompletionHandler:a7];
}

- (void)dispatchEventWithName:(id)a3 values:(id)a4 inputMode:(id)a5 withCompletionHandler:(id)a6
{
  LOBYTE(v6) = 0;
  [(TIAnalyticsService *)self _dispatchEventToDomain:@"com.apple.keyboard" withName:a3 payload:0 values:a4 inputMode:a5 testingParameters:0 allowSparsePayload:v6 withCompletionHandler:a6];
}

- (void)dispatchEventWithName:(id)a3 values:(id)a4 withCompletionHandler:(id)a5
{
  LOBYTE(v5) = 0;
  [(TIAnalyticsService *)self _dispatchEventToDomain:@"com.apple.keyboard" withName:a3 payload:0 values:a4 inputMode:0 testingParameters:0 allowSparsePayload:v5 withCompletionHandler:a5];
}

- (void)dispatchEventWithName:(id)a3 inputMode:(id)a4 withCompletionHandler:(id)a5
{
  LOBYTE(v5) = 0;
  [(TIAnalyticsService *)self _dispatchEventToDomain:@"com.apple.keyboard" withName:a3 payload:0 values:0 inputMode:a4 testingParameters:0 allowSparsePayload:v5 withCompletionHandler:a5];
}

- (void)dispatchEventWithName:(id)a3 withCompletionHandler:(id)a4
{
  LOBYTE(v4) = 0;
  [(TIAnalyticsService *)self _dispatchEventToDomain:@"com.apple.keyboard" withName:a3 payload:0 values:0 inputMode:0 testingParameters:0 allowSparsePayload:v4 withCompletionHandler:a4];
}

- (void)dispatchEventWithName:(id)a3 payload:(id)a4 testingParameters:(id)a5 allowSparsePayload:(BOOL)a6
{
  LOBYTE(v6) = a6;
  [(TIAnalyticsService *)self _dispatchEventToDomain:@"com.apple.keyboard" withName:a3 payload:a4 values:0 inputMode:0 testingParameters:a5 allowSparsePayload:v6 withCompletionHandler:0];
}

- (void)dispatchEventWithName:(id)a3 values:(id)a4 inputMode:(id)a5
{
  LOBYTE(v5) = 0;
  [(TIAnalyticsService *)self _dispatchEventToDomain:@"com.apple.keyboard" withName:a3 payload:0 values:a4 inputMode:a5 testingParameters:0 allowSparsePayload:v5 withCompletionHandler:0];
}

- (void)dispatchEventWithName:(id)a3 values:(id)a4
{
  LOBYTE(v4) = 0;
  [(TIAnalyticsService *)self _dispatchEventToDomain:@"com.apple.keyboard" withName:a3 payload:0 values:a4 inputMode:0 testingParameters:0 allowSparsePayload:v4 withCompletionHandler:0];
}

- (void)dispatchEventWithName:(id)a3 inputMode:(id)a4
{
  LOBYTE(v4) = 0;
  [(TIAnalyticsService *)self _dispatchEventToDomain:@"com.apple.keyboard" withName:a3 payload:0 values:0 inputMode:a4 testingParameters:0 allowSparsePayload:v4 withCompletionHandler:0];
}

- (void)dispatchEventWithName:(id)a3
{
  LOBYTE(v3) = 0;
  [(TIAnalyticsService *)self _dispatchEventToDomain:@"com.apple.keyboard" withName:a3 payload:0 values:0 inputMode:0 testingParameters:0 allowSparsePayload:v3 withCompletionHandler:0];
}

- (void)_registerEventSpec:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__TIAnalyticsService__registerEventSpec_withCompletionHandler___block_invoke;
  v11[3] = &unk_1E5559920;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  TIDispatchAsync(queue, v11);
}

void __63__TIAnalyticsService__registerEventSpec_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) eventSpecs];
  uint64_t v3 = [*(id *)(a1 + 40) name];
  uint64_t v4 = [v2 objectForKey:v3];

  if (v4)
  {
    uint64_t v5 = NSString;
    id v6 = [*(id *)(a1 + 40) name];
    id v7 = [v5 stringWithFormat:@"TIAnalyticsEventSpec with name '%@' is already registered.", v6];

    uint64_t v8 = IXADefaultLogFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = [NSString stringWithFormat:@"%s %@", "-[TIAnalyticsService _registerEventSpec:withCompletionHandler:]_block_invoke", v7];
      *(_DWORD *)buf = 138412290;
      id v20 = v16;
      _os_log_debug_impl(&dword_18D240000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
    id v9 = (void *)MEMORY[0x1E4F28C58];
    id v17 = @"message";
    id v18 = v7;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    id v11 = [v9 errorWithDomain:@"TIAnalyticsErrorDomain" code:1 userInfo:v10];
  }
  else
  {
    id v12 = [*(id *)(a1 + 32) eventSpecs];
    id v13 = *(void **)(a1 + 40);
    uint64_t v14 = [v13 name];
    [v12 setObject:v13 forKey:v14];

    id v11 = 0;
  }
  uint64_t v15 = *(void *)(a1 + 48);
  if (v15) {
    (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v11);
  }
}

- (BOOL)registerEventSpec:(id)a3 error:(id *)a4
{
  return 1;
}

- (void)registerEventSpec:(id)a3
{
}

- (TIAnalyticsService)initWithProvider:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TIAnalyticsService;
  id v6 = [(TIAnalyticsService *)&v13 init];
  if (v6)
  {
    id v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.keyboard.analytics.inputModeParserQueue", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_provider, a3);
    uint64_t v10 = objc_opt_new();
    eventSpecs = v6->_eventSpecs;
    v6->_eventSpecs = (NSMutableDictionary *)v10;
  }
  return v6;
}

- (TIAnalyticsService)init
{
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = [(TIAnalyticsService *)self initWithProvider:v3];

  return v4;
}

+ (void)setMockInstance:(id)a3
{
  id v4 = a3;
  if ((id)__mockInstance != v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)&__mockInstance, a3);
    id v4 = v5;
  }
}

+ (id)sharedInstance
{
  id v2 = (void *)__mockInstance;
  if (!__mockInstance)
  {
    if (sharedInstance_onceToken_251 != -1) {
      dispatch_once(&sharedInstance_onceToken_251, &__block_literal_global_253);
    }
    id v2 = (void *)sharedInstance_instance_250;
  }
  id v3 = v2;

  return v3;
}

uint64_t __36__TIAnalyticsService_sharedInstance__block_invoke()
{
  sharedInstance_instance_250 = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

@end