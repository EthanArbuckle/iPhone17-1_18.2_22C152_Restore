@interface ATXModeDuetHelper
- (id)_duetStreamShim;
- (id)_updateModeStreamEndDates:(id)a3 to:(id)a4;
- (id)modeStreamFrom:(id)a3 to:(id)a4 ascending:(BOOL)a5 limit:(unint64_t)a6;
- (id)modeStreamFrom:(id)a3 to:(id)a4 limit:(unint64_t)a5;
@end

@implementation ATXModeDuetHelper

- (id)modeStreamFrom:(id)a3 to:(id)a4 limit:(unint64_t)a5
{
  return [(ATXModeDuetHelper *)self modeStreamFrom:a3 to:a4 ascending:1 limit:a5];
}

- (id)modeStreamFrom:(id)a3 to:(id)a4 ascending:(BOOL)a5 limit:(unint64_t)a6
{
  BOOL v6 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_opt_new();
  v12 = [(ATXModeDuetHelper *)self _duetStreamShim];
  v13 = BiomeLibrary();
  v14 = [v13 UserFocus];
  v15 = [v14 InferredMode];
  v16 = objc_msgSend(v15, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", v10, v9, 0, 0, 0);

  v17 = [v16 filterWithIsIncluded:&__block_literal_global_15];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __55__ATXModeDuetHelper_modeStreamFrom_to_ascending_limit___block_invoke_3;
  v26[3] = &unk_1E6BE7780;
  id v27 = v12;
  id v18 = v11;
  id v28 = v18;
  id v19 = v12;
  id v20 = (id)[v17 sinkWithCompletion:&__block_literal_global_7_0 receiveInput:v26];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __55__ATXModeDuetHelper_modeStreamFrom_to_ascending_limit___block_invoke_4;
  v24[3] = &__block_descriptor_33_e31_q24__0___DKEvent_8___DKEvent_16l;
  BOOL v25 = v6;
  [v18 sortUsingComparator:v24];
  if (v6)
  {
    id v21 = [(ATXModeDuetHelper *)self _updateModeStreamEndDates:v18 to:v9];
  }
  else
  {
    id v21 = v18;
  }
  v22 = v21;

  return v22;
}

uint64_t __55__ATXModeDuetHelper_modeStreamFrom_to_ascending_limit___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBody];
  uint64_t v3 = [v2 isStart];

  return v3;
}

void __55__ATXModeDuetHelper_modeStreamFrom_to_ascending_limit___block_invoke_3(uint64_t a1, void *a2)
{
  v22[5] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 eventBody];
  int v5 = [v4 modeType];

  BOOL v6 = [v3 eventBody];
  v7 = [v6 absoluteTimestamp];

  v8 = [v3 eventBody];

  unsigned int v9 = [v8 origin];
  int v10 = v9;
  if (v9 >= 0x12)
  {
    v12 = __atxlog_handle_modes();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      __55__ATXModeDuetHelper_modeStreamFrom_to_ascending_limit___block_invoke_3_cold_1(v10, v12);
    }

    v11 = @"Unknown";
  }
  else
  {
    v11 = off_1E6BE77C0[v9];
  }

  if (v7)
  {
    v13 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v5);
    v14 = (void *)MEMORY[0x1E4F5B510];
    uint64_t v15 = *(void *)(a1 + 32);
    v22[0] = v13;
    v21[0] = @"mode";
    v21[1] = @"start";
    v16 = NSString;
    [v7 timeIntervalSince1970];
    id v18 = objc_msgSend(v16, "stringWithFormat:", @"%lld", (uint64_t)v17);
    v22[1] = v18;
    v22[2] = v11;
    v21[2] = @"modeOrigin";
    v21[3] = @"contextVector";
    v21[4] = @"process";
    v22[3] = &stru_1F352D818;
    v22[4] = @"contextstored";
    id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:5];
    id v20 = [v14 eventWithStream:v15 startDate:v7 endDate:v7 identifierStringValue:v13 metadata:v19];

    [*(id *)(a1 + 40) addObject:v20];
  }
}

uint64_t __55__ATXModeDuetHelper_modeStreamFrom_to_ascending_limit___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  v7 = [v6 startDate];
  v8 = [v5 startDate];

  unsigned int v9 = [v7 earlierDate:v8];
  int v10 = [v6 startDate];

  uint64_t v11 = 1;
  if (*(unsigned char *)(a1 + 32)) {
    uint64_t v11 = -1;
  }
  uint64_t v12 = -1;
  if (*(unsigned char *)(a1 + 32)) {
    uint64_t v12 = 1;
  }
  if (v9 == v10) {
    return v11;
  }
  else {
    return v12;
  }
}

- (id)_updateModeStreamEndDates:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v27 = a4;
  v7 = objc_opt_new();
  v30 = [(ATXModeDuetHelper *)self _duetStreamShim];
  if ([v6 count])
  {
    unint64_t v8 = 0;
    unint64_t v9 = 0x1E4F5B000uLL;
    do
    {
      int v10 = (void *)MEMORY[0x1E0187360]();
      uint64_t v11 = [v6 objectAtIndexedSubscript:v8];
      if (v8 == [v6 count] - 1)
      {
        uint64_t v12 = *(void **)(v9 + 1296);
        v13 = [v11 startDate];
        v14 = [v11 value];
        uint64_t v15 = [v11 metadata];
        v16 = [v12 eventWithStream:v30 startDate:v13 endDate:v27 value:v14 metadata:v15];

        [v7 addObject:v16];
        ++v8;
      }
      else
      {
        id v28 = [v6 objectAtIndexedSubscript:++v8];
        double v17 = *(void **)(v9 + 1296);
        id v18 = [v11 startDate];
        id v19 = [v28 startDate];
        [v11 value];
        v29 = v10;
        v21 = id v20 = v7;
        [v11 metadata];
        id v22 = v6;
        v24 = unint64_t v23 = v9;
        BOOL v25 = [v17 eventWithStream:v30 startDate:v18 endDate:v19 value:v21 metadata:v24];

        unint64_t v9 = v23;
        id v6 = v22;

        v7 = v20;
        int v10 = v29;

        [v7 addObject:v25];
      }
    }
    while (v8 < [v6 count]);
  }

  return v7;
}

- (id)_duetStreamShim
{
  v2 = (void *)MEMORY[0x1E4F5B520];
  id v3 = [MEMORY[0x1E4F5B498] type];
  v4 = [v2 eventStreamWithName:@"pap/internal" valueType:v3];

  return v4;
}

void __55__ATXModeDuetHelper_modeStreamFrom_to_ascending_limit___block_invoke_3_cold_1(int a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1DAFF9000, a2, OS_LOG_TYPE_FAULT, "BMUserFocusInferredModeOrigin: %lu not handled in switch statement", (uint8_t *)&v2, 0xCu);
}

@end