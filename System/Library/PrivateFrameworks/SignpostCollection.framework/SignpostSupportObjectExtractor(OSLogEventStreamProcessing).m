@interface SignpostSupportObjectExtractor(OSLogEventStreamProcessing)
- (uint64_t)_processLogEventStream:()OSLogEventStreamProcessing startDate:endDate:errorOut:;
- (void)_processOSLogEventProxy:()OSLogEventStreamProcessing;
@end

@implementation SignpostSupportObjectExtractor(OSLogEventStreamProcessing)

- (uint64_t)_processLogEventStream:()OSLogEventStreamProcessing startDate:endDate:errorOut:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [a1 _processingStarting];
  [v8 setFlags:404];
  if ([a1 _hasSignpostProcessingBlock]) {
    objc_msgSend(v8, "setFlags:", objc_msgSend(v8, "flags") | 0x20);
  }
  v11 = [a1 logMessageProcessingBlock];

  uint64_t v12 = [v8 flags];
  if (v11)
  {
    [v8 setFlags:v12 | 1];
    uint64_t v13 = [v8 flags] | 2;
  }
  else
  {
    uint64_t v13 = v12 | 0x200;
  }
  [v8 setFlags:v13];
  if (v10)
  {
    [v10 timeIntervalSince1970];
    v15 = v14;
  }
  else
  {
    v15 = 0;
  }
  objc_initWeak(&location, v8);
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __112__SignpostSupportObjectExtractor_OSLogEventStreamProcessing___processLogEventStream_startDate_endDate_errorOut___block_invoke;
  v31[3] = &unk_2644880D0;
  objc_copyWeak(v33, &location);
  v31[4] = a1;
  id v16 = v10;
  id v32 = v16;
  v33[1] = v15;
  [v8 setEventHandler:v31];
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__3;
  v25[4] = __Block_byref_object_dispose__3;
  id v26 = 0;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __112__SignpostSupportObjectExtractor_OSLogEventStreamProcessing___processLogEventStream_startDate_endDate_errorOut___block_invoke_2;
  v24[3] = &unk_2644880F8;
  v24[5] = v25;
  v24[6] = &v27;
  v24[4] = a1;
  [v8 setInvalidationHandler:v24];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __112__SignpostSupportObjectExtractor_OSLogEventStreamProcessing___processLogEventStream_startDate_endDate_errorOut___block_invoke_2;
  v22[3] = &unk_264487F48;
  objc_copyWeak(&v23, &location);
  objc_msgSend(a1, "set_stopProcessingBlock:", v22);
  v17 = [a1 _loggingSupportStreamPredicateFromFiltersWithForLiveStreaming:0];
  [v8 setFilterPredicate:v17];

  v18 = v9;
  if (!v9)
  {
    v18 = [MEMORY[0x263EFF910] distantPast];
  }
  [v8 activateStreamFromDate:v18];
  if (!v9) {

  }
  v19 = [a1 completionSemaphore];
  dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);

  uint64_t v20 = *((unsigned __int8 *)v28 + 24);
  objc_destroyWeak(&v23);
  _Block_object_dispose(v25, 8);

  _Block_object_dispose(&v27, 8);
  objc_destroyWeak(v33);
  objc_destroyWeak(&location);

  return v20;
}

- (void)_processOSLogEventProxy:()OSLogEventStreamProcessing
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x223C1AE00]();
  [a1 cachedTimebaseRatio];
  if (v6 == 0.0) {
    objc_msgSend(a1, "setCachedTimebaseRatio:", (double)(unint64_t)objc_msgSend(v4, "continuousNanosecondsSinceBoot")/ (double)(unint64_t)objc_msgSend(v4, "machContinuousTimestamp"));
  }
  if (([v4 type] & 0xFFFFFFFFFFFFFDFFLL) == 0x400)
  {
    v7 = [v4 bootUUID];
    id v8 = [a1 currentBootUUID];

    if (!v8) {
      [a1 setCurrentBootUUID:v7];
    }
    uint64_t v9 = [a1 currentBootUUID];
    id v10 = (void *)v9;
    if (v7 && (void *)v9 != v7 && ([v7 isEqual:v9] & 1) == 0)
    {
      v11 = [a1 intervalBuilder];
      [v11 dropAccumulatedState];

      uint64_t v12 = _signpostcollection_debug_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[SignpostSupportObjectExtractor(OSLogEventStreamProcessing) _processOSLogEventProxy:](v12);
      }

      uint64_t v13 = [a1 deviceRebootProcessingBlock];

      if (v13)
      {
        v14 = [a1 deviceRebootProcessingBlock];
        char v15 = v14[2]();

        if ((v15 & 1) == 0)
        {
          [a1 stopProcessing];
          goto LABEL_27;
        }
      }
      [a1 setCurrentBootUUID:v7];
    }
    if ([v4 type] == 1024
      && ([a1 logMessageProcessingBlock],
          id v16 = objc_claimAutoreleasedReturnValue(),
          v16,
          v16))
    {
      char v32 = 0;
      uint64_t v17 = [v4 processIdentifier];
      uint64_t v18 = [v4 creatorProcessUniqueIdentifier];
      v19 = [v4 process];
      uint64_t v20 = [v4 subsystem];
      v21 = [v4 category];
      LODWORD(v17) = [a1 _shouldBuildEventWithPid:v17 uniquePid:v18 processName:v19 subsystem:v20 category:v21 shouldReport:&v32];

      if (!v17)
      {
LABEL_27:

        goto LABEL_28;
      }
      id v22 = objc_alloc(MEMORY[0x263F6C590]);
      [a1 cachedTimebaseRatio];
      id v23 = objc_msgSend(v22, "initWithOSLogEventProxy:timebaseRatio:", v4);
      if (!v23 || ([a1 _processSignpostSupportLogMessage:v23] & 1) != 0)
      {
LABEL_20:

        goto LABEL_27;
      }
    }
    else
    {
      if ([v4 type] != 1536) {
        goto LABEL_27;
      }
      if (![a1 _hasSignpostProcessingBlock]) {
        goto LABEL_27;
      }
      unsigned __int8 v31 = 0;
      uint64_t v24 = [v4 processIdentifier];
      uint64_t v25 = [v4 creatorProcessUniqueIdentifier];
      id v26 = [v4 process];
      uint64_t v27 = [v4 subsystem];
      v28 = [v4 category];
      LODWORD(v24) = [a1 _shouldBuildEventWithPid:v24 uniquePid:v25 processName:v26 subsystem:v27 category:v28 shouldReport:&v31];

      if (!v24) {
        goto LABEL_27;
      }
      id v29 = objc_alloc(MEMORY[0x263F6C570]);
      [a1 cachedTimebaseRatio];
      id v23 = objc_msgSend(v29, "initWithOSLogEventProxy:timebaseRatio:shouldCompose:", v4, objc_msgSend(a1, "shouldComposeMetadataString"), v30);
      if ([a1 _processSignpostEvent:v23 shouldReport:v31]) {
        goto LABEL_20;
      }
    }
    [a1 stopProcessing];
    goto LABEL_20;
  }
LABEL_28:
}

- (void)_processOSLogEventProxy:()OSLogEventStreamProcessing .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21DE73000, log, OS_LOG_TYPE_DEBUG, "Dropping state due to change in boot UUID", v1, 2u);
}

@end