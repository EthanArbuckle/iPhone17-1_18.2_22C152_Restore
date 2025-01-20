@interface PPMetricsDispatcher
+ (void)logPayloadForEvent:(id)a3 payload:(id)a4 inBackground:(BOOL)a5;
@end

@implementation PPMetricsDispatcher

void __63__PPMetricsDispatcher_logPayloadForEvent_payload_inBackground___block_invoke_2(uint64_t a1)
{
  id v6 = (id)[*(id *)(a1 + 32) mutableCopy];
  v2 = +[PPTrialWrapper sharedInstance];
  v3 = [v2 concatenatedTreatmentNames];
  v4 = objc_msgSend(v3, "_pas_stringBackedByUTF8CString");
  [v6 setObject:v4 forKeyedSubscript:@"activeTreatments"];

  v5 = objc_msgSend(*(id *)(a1 + 40), "_pas_stringBackedByUTF8CString");
  AnalyticsSendEvent();
}

+ (void)logPayloadForEvent:(id)a3 payload:(id)a4 inBackground:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-172800.0];
  v10 = +[PPTrialWrapper sharedInstance];
  v11 = [v10 lastTreatmentUpdate];

  if (!v11 || [v11 compare:v9] != 1)
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__16787;
    v22 = __Block_byref_object_dispose__16788;
    id v23 = 0;
    v12 = +[PPMetricsUtils loggingQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __63__PPMetricsDispatcher_logPayloadForEvent_payload_inBackground___block_invoke;
    v13[3] = &unk_1E65D89D8;
    BOOL v17 = v5;
    v16 = &v18;
    id v14 = v8;
    id v15 = v7;
    dispatch_sync(v12, v13);

    if (v5) {
      dispatch_block_wait((dispatch_block_t)v19[5], 0xFFFFFFFFFFFFFFFFLL);
    }

    _Block_object_dispose(&v18, 8);
  }
}

void __63__PPMetricsDispatcher_logPayloadForEvent_payload_inBackground___block_invoke(uint64_t a1)
{
  if (!kPPActiveTreatmentsKey_block_invoke_previousLogging)
  {
    v2 = (void *)MEMORY[0x1E4F1C978];
    v3 = [MEMORY[0x1E4F1C9C8] distantPast];
    v4 = objc_msgSend(v2, "_pas_proxyArrayWithObject:repetitions:", v3, 20);
    uint64_t v5 = [v4 mutableCopy];
    id v6 = (void *)kPPActiveTreatmentsKey_block_invoke_previousLogging;
    kPPActiveTreatmentsKey_block_invoke_previousLogging = v5;
  }
  if (*(unsigned char *)(a1 + 56))
  {
    id v7 = [(id)kPPActiveTreatmentsKey_block_invoke_previousLogging firstObject];
    [v7 timeIntervalSinceNow];
    double v9 = v8;
    double v10 = -v8;

    if (v9 >= -0.5) {
      double v11 = v10;
    }
    else {
      double v11 = 0.5;
    }
    BOOL v12 = v11 <= 0.0;
    double v13 = 0.5 - v11;
    if (v12) {
      double v14 = 0.5;
    }
    else {
      double v14 = v13;
    }
  }
  else
  {
    double v14 = 0.0;
  }
  [(id)kPPActiveTreatmentsKey_block_invoke_previousLogging removeObjectAtIndex:0];
  id v15 = (void *)kPPActiveTreatmentsKey_block_invoke_previousLogging;
  v16 = [MEMORY[0x1E4F1C9C8] now];
  [v15 addObject:v16];

  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  v24 = __63__PPMetricsDispatcher_logPayloadForEvent_payload_inBackground___block_invoke_2;
  v25 = &unk_1E65DC568;
  id v26 = *(id *)(a1 + 32);
  id v27 = *(id *)(a1 + 40);
  dispatch_block_t v17 = dispatch_block_create((dispatch_block_flags_t)0, &v22);
  uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
  v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v17;

  if (v14 <= 0.0)
  {
    v21 = +[PPMetricsUtils loggingQueue];
    dispatch_async(v21, *(dispatch_block_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  }
  else
  {
    if (v14 <= 9223372040.0) {
      dispatch_time_t v20 = dispatch_time(0, (uint64_t)(v14 * 1000000000.0));
    }
    else {
      dispatch_time_t v20 = -1;
    }
    v21 = +[PPMetricsUtils loggingQueue];
    dispatch_after(v20, v21, *(dispatch_block_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  }
}

@end