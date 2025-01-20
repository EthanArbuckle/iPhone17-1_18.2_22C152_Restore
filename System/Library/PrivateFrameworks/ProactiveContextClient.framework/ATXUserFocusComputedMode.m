@interface ATXUserFocusComputedMode
+ (id)currentMode;
+ (id)currentModeEvent;
+ (id)currentModeSemanticType;
+ (id)currentModeUUID;
+ (id)currrentModeEventAtGivenTime:(id)a3;
- (ATXUserFocusComputedMode)init;
- (ATXUserFocusComputedMode)initWithStream:(id)a3;
- (id)currentMode;
- (id)currentModeEvent;
- (id)currentModeSemanticType;
- (id)currentModeUUID;
- (id)currrentModeEventAtGivenTime:(id)a3;
- (id)lastTwoUserFocusComputedStoreEvents;
@end

@implementation ATXUserFocusComputedMode

- (ATXUserFocusComputedMode)init
{
  v3 = BiomeLibrary();
  v4 = [v3 UserFocus];
  v5 = [v4 ComputedMode];
  v6 = [(ATXUserFocusComputedMode *)self initWithStream:v5];

  return v6;
}

- (ATXUserFocusComputedMode)initWithStream:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXUserFocusComputedMode;
  v6 = [(ATXUserFocusComputedMode *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_stream, a3);
  }

  return v7;
}

- (id)currentModeSemanticType
{
  v3 = (void *)MEMORY[0x1E0187360](self, a2);
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__13;
  v13 = __Block_byref_object_dispose__13;
  id v14 = 0;
  v4 = [(BMStream *)self->_stream atx_publisherWithStartDate:0 endDate:0 maxEvents:&unk_1F3539568 lastN:&unk_1F3539568 reversed:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__ATXUserFocusComputedMode_currentModeSemanticType__block_invoke_6;
  v8[3] = &unk_1E6BE6988;
  v8[4] = &v9;
  id v5 = (id)[v4 sinkWithCompletion:&__block_literal_global_14 receiveInput:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __51__ATXUserFocusComputedMode_currentModeSemanticType__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 error];

  if (v3)
  {
    v4 = __atxlog_handle_modes();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __51__ATXUserFocusComputedMode_currentModeSemanticType__block_invoke_cold_1(v2);
    }
  }
}

void __51__ATXUserFocusComputedMode_currentModeSemanticType__block_invoke_6(uint64_t a1, void *a2)
{
  id v10 = a2;
  v3 = [v10 eventBody];
  int v4 = [v3 starting];

  if (v4)
  {
    id v5 = [v10 eventBody];
    uint64_t v6 = objc_msgSend(v5, "atx_dndModeSemanticType");

    uint64_t v7 = [NSNumber numberWithInteger:v6];
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
}

- (id)currentMode
{
  v3 = (void *)MEMORY[0x1E0187360](self, a2);
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__13;
  v13 = __Block_byref_object_dispose__13;
  id v14 = 0;
  int v4 = [(BMStream *)self->_stream atx_publisherWithStartDate:0 endDate:0 maxEvents:&unk_1F3539568 lastN:&unk_1F3539568 reversed:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__ATXUserFocusComputedMode_currentMode__block_invoke_10;
  v8[3] = &unk_1E6BE6988;
  v8[4] = &v9;
  id v5 = (id)[v4 sinkWithCompletion:&__block_literal_global_9 receiveInput:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __39__ATXUserFocusComputedMode_currentMode__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 error];

  if (v3)
  {
    int v4 = __atxlog_handle_modes();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __51__ATXUserFocusComputedMode_currentModeSemanticType__block_invoke_cold_1(v2);
    }
  }
}

void __39__ATXUserFocusComputedMode_currentMode__block_invoke_10(uint64_t a1, void *a2)
{
  id v8 = a2;
  v3 = [v8 eventBody];
  int v4 = [v3 starting];

  if (v4)
  {
    uint64_t v5 = [v8 eventBody];
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

- (id)currentModeEvent
{
  v3 = (void *)MEMORY[0x1E0187360](self, a2);
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__13;
  v13 = __Block_byref_object_dispose__13;
  id v14 = 0;
  int v4 = [(BMStream *)self->_stream atx_publisherWithStartDate:0 endDate:0 maxEvents:&unk_1F3539568 lastN:&unk_1F3539568 reversed:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__ATXUserFocusComputedMode_currentModeEvent__block_invoke_13;
  v8[3] = &unk_1E6BE6988;
  v8[4] = &v9;
  id v5 = (id)[v4 sinkWithCompletion:&__block_literal_global_12 receiveInput:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __44__ATXUserFocusComputedMode_currentModeEvent__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 error];

  if (v3)
  {
    int v4 = __atxlog_handle_modes();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __51__ATXUserFocusComputedMode_currentModeSemanticType__block_invoke_cold_1(v2);
    }
  }
}

void __44__ATXUserFocusComputedMode_currentModeEvent__block_invoke_13(uint64_t a1, void *a2)
{
  id v6 = a2;
  int v4 = [v6 eventBody];
  int v5 = [v4 starting];

  if (v5) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

- (id)currentModeUUID
{
  v3 = (void *)MEMORY[0x1E0187360](self, a2);
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__13;
  v13 = __Block_byref_object_dispose__13;
  id v14 = 0;
  int v4 = [(BMStream *)self->_stream atx_publisherWithStartDate:0 endDate:0 maxEvents:&unk_1F3539568 lastN:&unk_1F3539568 reversed:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__ATXUserFocusComputedMode_currentModeUUID__block_invoke_16;
  v8[3] = &unk_1E6BE6988;
  v8[4] = &v9;
  id v5 = (id)[v4 sinkWithCompletion:&__block_literal_global_15 receiveInput:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __43__ATXUserFocusComputedMode_currentModeUUID__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 error];

  if (v3)
  {
    int v4 = __atxlog_handle_modes();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __51__ATXUserFocusComputedMode_currentModeSemanticType__block_invoke_cold_1(v2);
    }
  }
}

void __43__ATXUserFocusComputedMode_currentModeUUID__block_invoke_16(uint64_t a1, void *a2)
{
  id v11 = a2;
  v3 = [v11 eventBody];
  int v4 = [v3 starting];

  id v5 = v11;
  if (v4)
  {
    id v6 = [v11 eventBody];
    uint64_t v7 = [v6 mode];

    if (v7)
    {
      uint64_t v8 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v7];
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
      id v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;
    }
    id v5 = v11;
  }
}

- (id)lastTwoUserFocusComputedStoreEvents
{
  v3 = (void *)MEMORY[0x1E0187360](self, a2);
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__13;
  id v14 = __Block_byref_object_dispose__13;
  id v15 = (id)objc_opt_new();
  int v4 = [(BMStream *)self->_stream atx_publisherWithStartDate:0 endDate:0 maxEvents:0 lastN:&unk_1F3539580 reversed:0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__ATXUserFocusComputedMode_lastTwoUserFocusComputedStoreEvents__block_invoke;
  v9[3] = &unk_1E6BE7648;
  v9[4] = &v10;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__ATXUserFocusComputedMode_lastTwoUserFocusComputedStoreEvents__block_invoke_21;
  v8[3] = &unk_1E6BE6988;
  v8[4] = &v10;
  id v5 = (id)[v4 sinkWithCompletion:v9 receiveInput:v8];

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __63__ATXUserFocusComputedMode_lastTwoUserFocusComputedStoreEvents__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 state])
  {
    int v4 = __atxlog_handle_modes();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __63__ATXUserFocusComputedMode_lastTwoUserFocusComputedStoreEvents__block_invoke_cold_1(v3);
    }
  }
  else
  {
    uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) count];
    int v4 = __atxlog_handle_modes();
    BOOL v6 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v5 == 2)
    {
      if (v6)
      {
        uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) firstObject];
        uint64_t v8 = [v7 eventBody];
        uint64_t v9 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectAtIndexedSubscript:1];
        uint64_t v10 = [v9 eventBody];
        int v13 = 138412546;
        id v14 = v8;
        __int16 v15 = 2112;
        v16 = v10;
        _os_log_impl(&dword_1DAFF9000, v4, OS_LOG_TYPE_DEFAULT, "BMUserFocusComputedModeStream: done fetching the last two mode events \nFirst Event:%@\nSecond Event:%@", (uint8_t *)&v13, 0x16u);
      }
    }
    else if (v6)
    {
      id v11 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) firstObject];
      uint64_t v12 = [v11 eventBody];
      int v13 = 138543362;
      id v14 = v12;
      _os_log_impl(&dword_1DAFF9000, v4, OS_LOG_TYPE_DEFAULT, "BMUserFocusComputedModeStream: done fetching the last two mode events First Event:%{public}@", (uint8_t *)&v13, 0xCu);
    }
  }
}

uint64_t __63__ATXUserFocusComputedMode_lastTwoUserFocusComputedStoreEvents__block_invoke_21(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:a2];
}

- (id)currrentModeEventAtGivenTime:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E0187360]();
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__13;
  v19 = __Block_byref_object_dispose__13;
  id v20 = 0;
  BOOL v6 = __atxlog_handle_modes();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "-[ATXUserFocusComputedMode currrentModeEventAtGivenTime:]";
    __int16 v23 = 2112;
    id v24 = v4;
    _os_log_impl(&dword_1DAFF9000, v6, OS_LOG_TYPE_DEFAULT, "%s: Searching for active mode at time: %@", buf, 0x16u);
  }

  uint64_t v7 = [(BMStream *)self->_stream atx_publisherWithStartDate:v4 endDate:0 maxEvents:&unk_1F3539568 lastN:0 reversed:1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__ATXUserFocusComputedMode_currrentModeEventAtGivenTime___block_invoke_24;
  v12[3] = &unk_1E6BE7670;
  id v8 = v4;
  id v13 = v8;
  id v14 = &v15;
  id v9 = (id)[v7 sinkWithCompletion:&__block_literal_global_23_0 shouldContinue:v12];

  id v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

void __57__ATXUserFocusComputedMode_currrentModeEventAtGivenTime___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 error];

  if (v3)
  {
    id v4 = __atxlog_handle_modes();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __51__ATXUserFocusComputedMode_currentModeSemanticType__block_invoke_cold_1(v2);
    }
  }
}

uint64_t __57__ATXUserFocusComputedMode_currrentModeEventAtGivenTime___block_invoke_24(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  uint64_t v5 = __atxlog_handle_modes();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = [v4 eventBody];
    uint64_t v7 = [v6 modeSemanticTypeAsString];
    int v15 = 136315394;
    v16 = "-[ATXUserFocusComputedMode currrentModeEventAtGivenTime:]_block_invoke";
    __int16 v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_1DAFF9000, v5, OS_LOG_TYPE_DEFAULT, "%s: Got mode: %@", (uint8_t *)&v15, 0x16u);
  }
  id v8 = [v4 eventBody];
  int v9 = [v8 starting];

  if (v9)
  {
    id v10 = __atxlog_handle_modes();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = *(void **)(a1 + 32);
      uint64_t v12 = [v4 eventBody];
      id v13 = [v12 modeSemanticTypeAsString];
      int v15 = 136315650;
      v16 = "-[ATXUserFocusComputedMode currrentModeEventAtGivenTime:]_block_invoke";
      __int16 v17 = 2112;
      v18 = v11;
      __int16 v19 = 2112;
      id v20 = v13;
      _os_log_impl(&dword_1DAFF9000, v10, OS_LOG_TYPE_DEFAULT, "%s: Active mode at time %@ was %@", (uint8_t *)&v15, 0x20u);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }

  return 0;
}

+ (id)currentModeSemanticType
{
  id v2 = (void *)MEMORY[0x1E0187360](a1, a2);
  id v3 = objc_opt_new();
  id v4 = [v3 currentModeSemanticType];

  return v4;
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

+ (id)currentModeUUID
{
  id v2 = (void *)MEMORY[0x1E0187360](a1, a2);
  id v3 = objc_opt_new();
  id v4 = [v3 currentModeUUID];

  return v4;
}

+ (id)currrentModeEventAtGivenTime:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E0187360]();
  uint64_t v5 = objc_opt_new();
  BOOL v6 = [v5 currrentModeEventAtGivenTime:v3];

  return v6;
}

- (void).cxx_destruct
{
}

void __51__ATXUserFocusComputedMode_currentModeSemanticType__block_invoke_cold_1(void *a1)
{
  v1 = [a1 error];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DAFF9000, v2, v3, "Could not obtain current Focus from Biome: %@", v4, v5, v6, v7, v8);
}

void __63__ATXUserFocusComputedMode_lastTwoUserFocusComputedStoreEvents__block_invoke_cold_1(void *a1)
{
  v1 = [a1 error];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DAFF9000, v2, v3, "BMUserFocusComputedModeStream: error fetching last two mode events: %@", v4, v5, v6, v7, v8);
}

@end