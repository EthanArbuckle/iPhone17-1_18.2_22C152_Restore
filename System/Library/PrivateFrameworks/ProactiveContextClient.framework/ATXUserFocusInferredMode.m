@interface ATXUserFocusInferredMode
+ (id)currentMode;
+ (id)currentModeEvent;
+ (id)currentModeEventAtGivenTime:(id)a3;
- (ATXUserFocusInferredMode)init;
- (ATXUserFocusInferredMode)initWithStream:(id)a3;
- (id)currentMode;
- (id)currentModeEvent;
- (id)currentModeEventAtGivenTime:(id)a3;
- (id)inferredModeEventWithSuggestionUUID:(id)a3;
- (id)lastTwoInferredModeEvents;
- (id)previousModeEvent;
@end

@implementation ATXUserFocusInferredMode

- (ATXUserFocusInferredMode)init
{
  v3 = BiomeLibrary();
  v4 = [v3 UserFocus];
  v5 = [v4 InferredMode];
  v6 = [(ATXUserFocusInferredMode *)self initWithStream:v5];

  return v6;
}

- (ATXUserFocusInferredMode)initWithStream:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXUserFocusInferredMode;
  v6 = [(ATXUserFocusInferredMode *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_stream, a3);
  }

  return v7;
}

- (id)currentMode
{
  v3 = (void *)MEMORY[0x1E0187360](self, a2);
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__16;
  v13 = __Block_byref_object_dispose__16;
  id v14 = 0;
  v4 = [(BMStream *)self->_stream atx_publisherWithStartDate:0 endDate:0 maxEvents:&unk_1F35395B0 lastN:&unk_1F35395B0 reversed:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__ATXUserFocusInferredMode_currentMode__block_invoke_6;
  v8[3] = &unk_1E6BE6988;
  v8[4] = &v9;
  id v5 = (id)[v4 sinkWithCompletion:&__block_literal_global_17 receiveInput:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __39__ATXUserFocusInferredMode_currentMode__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 error];

  if (v3)
  {
    v4 = __atxlog_handle_modes();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __39__ATXUserFocusInferredMode_currentMode__block_invoke_cold_1(v2);
    }
  }
}

void __39__ATXUserFocusInferredMode_currentMode__block_invoke_6(uint64_t a1, void *a2)
{
  id v8 = a2;
  v3 = [v8 eventBody];
  int v4 = [v3 isStart];

  if (v4)
  {
    uint64_t v5 = [v8 eventBody];
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

- (id)currentModeEvent
{
  v3 = (void *)MEMORY[0x1E0187360](self, a2);
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__16;
  v13 = __Block_byref_object_dispose__16;
  id v14 = 0;
  int v4 = [(BMStream *)self->_stream atx_publisherWithStartDate:0 endDate:0 maxEvents:&unk_1F35395B0 lastN:&unk_1F35395B0 reversed:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__ATXUserFocusInferredMode_currentModeEvent__block_invoke_10;
  v8[3] = &unk_1E6BE6988;
  v8[4] = &v9;
  id v5 = (id)[v4 sinkWithCompletion:&__block_literal_global_9_0 receiveInput:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __44__ATXUserFocusInferredMode_currentModeEvent__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 error];

  if (v3)
  {
    int v4 = __atxlog_handle_modes();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __39__ATXUserFocusInferredMode_currentMode__block_invoke_cold_1(v2);
    }
  }
}

void __44__ATXUserFocusInferredMode_currentModeEvent__block_invoke_10(uint64_t a1, void *a2)
{
  id v6 = a2;
  int v4 = [v6 eventBody];
  int v5 = [v4 isStart];

  if (v5) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

- (id)previousModeEvent
{
  v3 = (void *)MEMORY[0x1E0187360](self, a2);
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__16;
  id v14 = __Block_byref_object_dispose__16;
  id v15 = 0;
  int v4 = [(BMStream *)self->_stream atx_publisherFromStartDate:0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__ATXUserFocusInferredMode_previousModeEvent__block_invoke;
  v9[3] = &unk_1E6BE7648;
  v9[4] = &v10;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__ATXUserFocusInferredMode_previousModeEvent__block_invoke_11;
  v8[3] = &unk_1E6BE6988;
  v8[4] = &v10;
  id v5 = (id)[v4 sinkWithCompletion:v9 receiveInput:v8];

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __45__ATXUserFocusInferredMode_previousModeEvent__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 state];
  id v5 = __atxlog_handle_modes();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __45__ATXUserFocusInferredMode_previousModeEvent__block_invoke_cold_1(v3);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) eventBody];
    id v8 = [v7 modeIdentifier];
    uint64_t v9 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) eventBody];
    int v10 = 138412546;
    uint64_t v11 = v8;
    __int16 v12 = 2048;
    uint64_t v13 = (int)[v9 modeType];
    _os_log_impl(&dword_1DAFF9000, v6, OS_LOG_TYPE_DEFAULT, "BMInferredModeStream: done fetching last mode event. previousBMInferredModeEvent modeUUID:%@, modeType: %lu", (uint8_t *)&v10, 0x16u);
  }
}

void __45__ATXUserFocusInferredMode_previousModeEvent__block_invoke_11(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v4 = [v6 eventBody];
  char v5 = [v4 isStart];

  if ((v5 & 1) == 0) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

- (id)lastTwoInferredModeEvents
{
  id v3 = (void *)MEMORY[0x1E0187360](self, a2);
  uint64_t v4 = objc_opt_new();
  char v5 = [(BMStream *)self->_stream atx_publisherWithStartDate:0 endDate:0 maxEvents:0 lastN:&unk_1F35395C8 reversed:0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__ATXUserFocusInferredMode_lastTwoInferredModeEvents__block_invoke_16;
  v9[3] = &unk_1E6BE78F8;
  id v6 = v4;
  id v10 = v6;
  id v7 = (id)[v5 sinkWithCompletion:&__block_literal_global_15_0 receiveInput:v9];

  return v6;
}

void __53__ATXUserFocusInferredMode_lastTwoInferredModeEvents__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 state];
  uint64_t v4 = __atxlog_handle_modes();
  char v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __53__ATXUserFocusInferredMode_lastTwoInferredModeEvents__block_invoke_cold_1(v2);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1DAFF9000, v5, OS_LOG_TYPE_DEFAULT, "BMInferredModeStream: done fetching the last two mode events", v6, 2u);
  }
}

uint64_t __53__ATXUserFocusInferredMode_lastTwoInferredModeEvents__block_invoke_16(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)inferredModeEventWithSuggestionUUID:(id)a3
{
  id v4 = a3;
  char v5 = (void *)MEMORY[0x1E0187360]();
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__16;
  v21 = __Block_byref_object_dispose__16;
  id v22 = 0;
  id v6 = [(BMStream *)self->_stream atx_publisherFromStartDate:0];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__ATXUserFocusInferredMode_inferredModeEventWithSuggestionUUID___block_invoke;
  v14[3] = &unk_1E6BE7920;
  id v15 = v4;
  v16 = &v17;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__ATXUserFocusInferredMode_inferredModeEventWithSuggestionUUID___block_invoke_17;
  v11[3] = &unk_1E6BE7948;
  id v7 = v15;
  id v12 = v7;
  uint64_t v13 = &v17;
  id v8 = (id)[v6 sinkWithCompletion:v14 receiveInput:v11];

  id v9 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v9;
}

void __64__ATXUserFocusInferredMode_inferredModeEventWithSuggestionUUID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 state];
  char v5 = __atxlog_handle_modes();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __64__ATXUserFocusInferredMode_inferredModeEventWithSuggestionUUID___block_invoke_cold_1(a1, v3, v6);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) modeIdentifier];
    int v9 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) modeType];
    int v10 = 138543874;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    uint64_t v13 = v8;
    __int16 v14 = 2048;
    uint64_t v15 = v9;
    _os_log_impl(&dword_1DAFF9000, v6, OS_LOG_TYPE_DEFAULT, "BMInferredModeStream: done fetching mode event with suggestion UUID %{public}@, modeUUID:%{public}@, modeType:%lu", (uint8_t *)&v10, 0x20u);
  }
}

void __64__ATXUserFocusInferredMode_inferredModeEventWithSuggestionUUID___block_invoke_17(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = [v10 eventBody];
  if ([v3 isStart])
  {
    uint64_t v4 = [v10 eventBody];
    char v5 = [v4 uuid];
    int v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

    uint64_t v7 = v10;
    if (!v6) {
      goto LABEL_5;
    }
    uint64_t v8 = [v10 eventBody];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v3 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }

  uint64_t v7 = v10;
LABEL_5:
}

- (id)currentModeEventAtGivenTime:(id)a3
{
  id v4 = a3;
  char v5 = (void *)MEMORY[0x1E0187360]();
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__16;
  v18 = __Block_byref_object_dispose__16;
  id v19 = 0;
  int v6 = [(BMStream *)self->_stream atx_publisherWithStartDate:v4 endDate:0 maxEvents:&unk_1F35395B0 lastN:0 reversed:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__ATXUserFocusInferredMode_currentModeEventAtGivenTime___block_invoke_20;
  v11[3] = &unk_1E6BE7670;
  id v7 = v4;
  id v12 = v7;
  uint64_t v13 = &v14;
  id v8 = (id)[v6 sinkWithCompletion:&__block_literal_global_19 shouldContinue:v11];

  id v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

void __56__ATXUserFocusInferredMode_currentModeEventAtGivenTime___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 error];

  if (v3)
  {
    id v4 = __atxlog_handle_modes();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __39__ATXUserFocusInferredMode_currentMode__block_invoke_cold_1(v2);
    }
  }
}

uint64_t __56__ATXUserFocusInferredMode_currentModeEventAtGivenTime___block_invoke_20(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  char v5 = [v4 eventBody];
  int v6 = [v5 isStart];

  if (v6)
  {
    id v7 = __atxlog_handle_modes();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      id v9 = [v4 eventBody];
      int v11 = 136315650;
      id v12 = "-[ATXUserFocusInferredMode currentModeEventAtGivenTime:]_block_invoke";
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      __int16 v15 = 1024;
      int v16 = [v9 modeType];
      _os_log_impl(&dword_1DAFF9000, v7, OS_LOG_TYPE_DEFAULT, "%s: Active inferred mode at time %@ is %d", (uint8_t *)&v11, 0x1Cu);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }

  return 0;
}

+ (id)currentMode
{
  id v2 = (void *)MEMORY[0x1E0187360](a1, a2);
  id v3 = objc_opt_new();
  id v4 = [v3 currentMode];

  return v4;
}

+ (id)currentModeEvent
{
  id v2 = (void *)MEMORY[0x1E0187360](a1, a2);
  id v3 = objc_opt_new();
  id v4 = [v3 currentModeEvent];

  return v4;
}

+ (id)currentModeEventAtGivenTime:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E0187360]();
  char v5 = objc_opt_new();
  int v6 = [v5 currentModeEventAtGivenTime:v3];

  return v6;
}

- (void).cxx_destruct
{
}

void __39__ATXUserFocusInferredMode_currentMode__block_invoke_cold_1(void *a1)
{
  v1 = [a1 error];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DAFF9000, v2, v3, "Unable to get inferred mode event: %@", v4, v5, v6, v7, v8);
}

void __45__ATXUserFocusInferredMode_previousModeEvent__block_invoke_cold_1(void *a1)
{
  v1 = [a1 error];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DAFF9000, v2, v3, "BMInferredModeStream: error fetching last mode event: %{public}@", v4, v5, v6, v7, v8);
}

void __53__ATXUserFocusInferredMode_lastTwoInferredModeEvents__block_invoke_cold_1(void *a1)
{
  v1 = [a1 error];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DAFF9000, v2, v3, "BMInferredModeStream: error fetching last two mode events: %@", v4, v5, v6, v7, v8);
}

void __64__ATXUserFocusInferredMode_inferredModeEventWithSuggestionUUID___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = [a2 error];
  int v6 = 138543618;
  uint64_t v7 = v4;
  __int16 v8 = 2114;
  id v9 = v5;
  _os_log_error_impl(&dword_1DAFF9000, a3, OS_LOG_TYPE_ERROR, "BMInferredModeStream: error fetching mode event with UUID %{public}@: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end