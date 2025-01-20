@interface ATXPOICategoryEventAggregator
- (id)groupVisitsFromPublisher:(id)a3 startTimestamp:(double)a4 endTimestamp:(double)a5;
@end

@implementation ATXPOICategoryEventAggregator

- (id)groupVisitsFromPublisher:(id)a3 startTimestamp:(double)a4 endTimestamp:(double)a5
{
  id v7 = a3;
  v8 = objc_opt_new();
  v9 = [[ATXPOICategoryEnterAndExitEvents alloc] initWithCategoryEvents:0 exitEvent:0];
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__18;
  v31 = __Block_byref_object_dispose__18;
  id v32 = 0;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __86__ATXPOICategoryEventAggregator_groupVisitsFromPublisher_startTimestamp_endTimestamp___block_invoke;
  v26[3] = &__block_descriptor_48_e22_B16__0__BMStoreEvent_8l;
  *(double *)&v26[4] = a4;
  *(double *)&v26[5] = a5;
  v10 = [v7 filterWithIsIncluded:v26];
  v11 = [v10 scanWithInitial:v9 nextPartialResult:&__block_literal_global_19];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __86__ATXPOICategoryEventAggregator_groupVisitsFromPublisher_startTimestamp_endTimestamp___block_invoke_5;
  v25[3] = &unk_1E6BE7B70;
  v25[4] = &v27;
  v12 = [v11 filterWithIsIncluded:v25];
  v13 = [v12 mapWithTransform:&__block_literal_global_10_0];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __86__ATXPOICategoryEventAggregator_groupVisitsFromPublisher_startTimestamp_endTimestamp___block_invoke_3;
  v21[3] = &unk_1E6BE7BB8;
  id v22 = v8;
  double v23 = a4;
  double v24 = a5;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __86__ATXPOICategoryEventAggregator_groupVisitsFromPublisher_startTimestamp_endTimestamp___block_invoke_13;
  v19[3] = &unk_1E6BE7BE0;
  id v14 = v22;
  id v20 = v14;
  id v15 = (id)[v13 sinkWithCompletion:v21 receiveInput:v19];

  v16 = [(id)v28[5] visitEventAllowingMissingExit:1];
  v17 = [[ATXPOICategoryGroupingResult alloc] initWithEvents:v14 finalPOIWithoutExit:v16];

  _Block_object_dispose(&v27, 8);

  return v17;
}

BOOL __86__ATXPOICategoryEventAggregator_groupVisitsFromPublisher_startTimestamp_endTimestamp___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 timestamp];
  if (v4 >= *(double *)(a1 + 32))
  {
    [v3 timestamp];
    BOOL v5 = v6 <= *(double *)(a1 + 40);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

ATXPOICategoryEnterAndExitEvents *__86__ATXPOICategoryEventAggregator_groupVisitsFromPublisher_startTimestamp_endTimestamp___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v57[1] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 exitEvent];
  if (v6)
  {
    id v7 = (void *)v6;
    v8 = [v4 exitEvent];
    v9 = [v8 eventBody];
    v10 = [v9 poiCategory];
    char v11 = [v10 isEqualToString:@"ATXDefaultHeroPOICategory"];

    if ((v11 & 1) == 0)
    {
      v12 = [ATXPOICategoryEnterAndExitEvents alloc];
      v13 = [v4 exitEvent];
      v57[0] = v13;
      id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:1];
      uint64_t v15 = [(ATXPOICategoryEnterAndExitEvents *)v12 initWithCategoryEvents:v14 exitEvent:0];

      id v4 = (id)v15;
    }
  }
  v16 = [v4 exitEvent];
  if (v16)
  {

LABEL_6:
    v17 = [v5 eventBody];
    v18 = [v17 poiCategory];
    int v19 = [v18 isEqualToString:@"ATXDefaultHeroPOICategory"];

    id v20 = [ATXPOICategoryEnterAndExitEvents alloc];
    v21 = v20;
    if (v19)
    {
LABEL_7:
      id v22 = [(ATXPOICategoryEnterAndExitEvents *)v20 initWithCategoryEvents:0 exitEvent:0];
LABEL_8:
      double v23 = v22;
      goto LABEL_15;
    }
    id v56 = v5;
    double v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
    v25 = v21;
    goto LABEL_10;
  }
  v28 = [v4 categoryEnterEvents];

  if (!v28) {
    goto LABEL_6;
  }
  uint64_t v29 = [v5 eventBody];
  v30 = [v29 poiCategory];
  int v31 = [v30 isEqualToString:@"ATXDefaultHeroPOICategory"];

  if (v31) {
    goto LABEL_13;
  }
  v34 = [v4 categoryEnterEvents];
  uint64_t v35 = [v34 count];

  if (!v35)
  {
    v43 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT)) {
      __86__ATXPOICategoryEventAggregator_groupVisitsFromPublisher_startTimestamp_endTimestamp___block_invoke_2_cold_1(v43);
    }

    id v20 = [ATXPOICategoryEnterAndExitEvents alloc];
    goto LABEL_7;
  }
  v36 = [v4 categoryEnterEvents];
  v37 = [v36 objectAtIndexedSubscript:0];
  v38 = [v37 eventBody];
  v39 = [v38 poiCategory];
  v40 = [v5 eventBody];
  v41 = [v40 poiCategory];
  int v42 = [v39 isEqualToString:v41];

  if (v42)
  {
    id v22 = (ATXPOICategoryEnterAndExitEvents *)v4;
    goto LABEL_8;
  }
  v44 = [v4 categoryEnterEvents];
  v45 = [v44 objectAtIndexedSubscript:0];
  v46 = [v45 eventBody];
  v47 = [v46 timestamp];
  [v47 timeIntervalSinceReferenceDate];
  double v49 = v48;
  v50 = [v5 eventBody];
  v51 = [v50 timestamp];
  [v51 timeIntervalSinceReferenceDate];
  double v53 = v49 - v52;

  double v54 = -v53;
  if (v53 >= 0.0) {
    double v54 = v53;
  }
  if (v54 >= 2.22044605e-16)
  {
LABEL_13:
    id v32 = [ATXPOICategoryEnterAndExitEvents alloc];
    double v24 = [v4 categoryEnterEvents];
    v25 = v32;
    v26 = v24;
    id v27 = v5;
    goto LABEL_14;
  }
  v55 = [v4 categoryEnterEvents];
  double v24 = (void *)[v55 mutableCopy];

  [v24 addObject:v5];
  v25 = [ATXPOICategoryEnterAndExitEvents alloc];
LABEL_10:
  v26 = v24;
  id v27 = 0;
LABEL_14:
  double v23 = [(ATXPOICategoryEnterAndExitEvents *)v25 initWithCategoryEvents:v26 exitEvent:v27];

LABEL_15:

  return v23;
}

BOOL __86__ATXPOICategoryEventAggregator_groupVisitsFromPublisher_startTimestamp_endTimestamp___block_invoke_5(uint64_t a1, void *a2)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = [v4 visitEvent];
  uint64_t v6 = [v4 exitEvent];
  id v7 = [v6 eventBody];
  v8 = [v7 poiCategory];
  int v9 = [v8 isEqualToString:@"ATXDefaultHeroPOICategory"];

  if (v9)
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    char v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = 0;
  }
  else if (v5)
  {
    v12 = [ATXPOICategoryEnterAndExitEvents alloc];
    v13 = [v4 exitEvent];
    v19[0] = v13;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    uint64_t v15 = [(ATXPOICategoryEnterAndExitEvents *)v12 initWithCategoryEvents:v14 exitEvent:0];
    uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 8);
    v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }

  return v5 != 0;
}

uint64_t __86__ATXPOICategoryEventAggregator_groupVisitsFromPublisher_startTimestamp_endTimestamp___block_invoke_2_7(uint64_t a1, void *a2)
{
  return [a2 visitEvent];
}

void __86__ATXPOICategoryEventAggregator_groupVisitsFromPublisher_startTimestamp_endTimestamp___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 state];
  id v5 = __atxlog_handle_anchor();
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __86__ATXPOICategoryEventAggregator_groupVisitsFromPublisher_startTimestamp_endTimestamp___block_invoke_3_cold_1(a1, v3, v6);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    int v10 = 138412802;
    char v11 = v7;
    __int16 v12 = 2048;
    uint64_t v13 = v8;
    __int16 v14 = 2048;
    uint64_t v15 = v9;
    _os_log_impl(&dword_1DAFF9000, v6, OS_LOG_TYPE_INFO, "Successfully fetched %@ Biome events for POI Category between %f and %f", (uint8_t *)&v10, 0x20u);
  }
}

uint64_t __86__ATXPOICategoryEventAggregator_groupVisitsFromPublisher_startTimestamp_endTimestamp___block_invoke_13(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) addObject:a2];
  }
  return result;
}

void __86__ATXPOICategoryEventAggregator_groupVisitsFromPublisher_startTimestamp_endTimestamp___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1DAFF9000, log, OS_LOG_TYPE_FAULT, "Scanning POI Category stream produced empty array", v1, 2u);
}

void __86__ATXPOICategoryEventAggregator_groupVisitsFromPublisher_startTimestamp_endTimestamp___block_invoke_3_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = [a2 error];
  int v7 = 134218498;
  uint64_t v8 = v4;
  __int16 v9 = 2048;
  uint64_t v10 = v5;
  __int16 v11 = 2112;
  __int16 v12 = v6;
  _os_log_error_impl(&dword_1DAFF9000, a3, OS_LOG_TYPE_ERROR, "Error encountered while fetching events from Biome for POI Category between %f and %f: %@", (uint8_t *)&v7, 0x20u);
}

@end