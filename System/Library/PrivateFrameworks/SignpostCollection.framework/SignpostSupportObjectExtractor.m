@interface SignpostSupportObjectExtractor
@end

@implementation SignpostSupportObjectExtractor

void __82__SignpostSupportObjectExtractor_LogArchiveReading___eventSourceForPath_errorOut___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    if (*(void *)(a1 + 40)) {
      **(void **)(a1 + 40) = (id)[v6 copy];
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

void __112__SignpostSupportObjectExtractor_OSLogEventStreamProcessing___processLogEventStream_startDate_endDate_errorOut___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setProcessedEventCount:", objc_msgSend(*(id *)(a1 + 32), "processedEventCount") + 1);
  if (([v5 type] & 0xFFFFFFFFFFFFFDFFLL) == 0x400)
  {
    if (*(void *)(a1 + 40)
      && (uint64_t v4 = [v5 unixDate],
          (double)*(int *)(v4 + 8) / 1000000.0 + (double)*(uint64_t *)v4 > *(double *)(a1 + 56))
      || ([*(id *)(a1 + 32) _processOSLogEventProxy:v5],
          [*(id *)(a1 + 32) _shouldStopProcessing]))
    {
      [WeakRetained invalidate];
    }
  }
}

void __112__SignpostSupportObjectExtractor_OSLogEventStreamProcessing___processLogEventStream_startDate_endDate_errorOut___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

void __112__SignpostSupportObjectExtractor_OSLogEventStreamProcessing___processLogEventStream_startDate_endDate_errorOut___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v12 = a3;
  switch(a2)
  {
    case 3:
      id v5 = (void *)MEMORY[0x263F087E8];
      id v6 = NSString;
      v7 = @"OSLogEventStream failed due to invalid position";
      goto LABEL_7;
    case 2:
      id v5 = (void *)MEMORY[0x263F087E8];
      id v6 = NSString;
      v7 = @"OSLogEventStream failed due to backlog";
      goto LABEL_7;
    case 1:
      id v5 = (void *)MEMORY[0x263F087E8];
      id v6 = NSString;
      v7 = @"OSLogEventStream failed due to disconnected unrecoverably";
LABEL_7:
      id v8 = [v6 stringWithFormat:v7];
      uint64_t v9 = [v5 errorWithCode:5 description:v8];
      uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
      v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      goto LABEL_9;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
LABEL_9:
  [*(id *)(a1 + 32) _processingCompleted:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

void __106__SignpostSupportObjectExtractor_Notifications___processStreamedOSLogEventProxy_shouldCalculateFramerate___block_invoke(uint64_t a1, void *a2)
{
  objc_initWeak(&location, a2);
  if (*(unsigned char *)(a1 + 48))
  {
    id v3 = objc_loadWeakRetained(&location);

    if (v3)
    {
      id v4 = objc_loadWeakRetained(&location);
      id v5 = [*(id *)(a1 + 32) intervalBuilder];
      id v6 = [v5 matchingEventForEvent:v4 removeIfFound:0];

      if (v6)
      {
        if ([v6 serialNumber] == *(void *)(a1 + 40))
        {
          v7 = [*(id *)(a1 + 32) intervalBuilder];
          id v8 = (id)[v7 matchingEventForEvent:v4 removeIfFound:1];

          uint64_t v9 = [*(id *)(a1 + 32) timedOutBeginEventProcessingBlock];

          if (v9)
          {
            uint64_t v10 = [*(id *)(a1 + 32) timedOutBeginEventProcessingBlock];
            char v11 = ((uint64_t (**)(void, void *))v10)[2](v10, v6);

            if ((v11 & 1) == 0) {
              [*(id *)(a1 + 32) _processingCompleted:0];
            }
          }
        }
      }
    }
  }
  objc_destroyWeak(&location);
}

void __153__SignpostSupportObjectExtractor_Notifications__processNotificationsWithIntervalTimeoutInSeconds_shouldCalculateAnimationFramerate_targetQueue_errorOut___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (a3)
  {
    if (*(void *)(a1 + 48)) {
      **(void **)(a1 + 48) = a3;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __153__SignpostSupportObjectExtractor_Notifications__processNotificationsWithIntervalTimeoutInSeconds_shouldCalculateAnimationFramerate_targetQueue_errorOut___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _processStreamedOSLogEventProxy:v4 shouldCalculateFramerate:*(unsigned __int8 *)(a1 + 40)];
}

void __153__SignpostSupportObjectExtractor_Notifications__processNotificationsWithIntervalTimeoutInSeconds_shouldCalculateAnimationFramerate_targetQueue_errorOut___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  id v4 = @"Disconnected from log stream";
  switch(a2)
  {
    case 1:
      goto LABEL_9;
    case 2:
      id v4 = @"Source too backlogged to continue";
      goto LABEL_9;
    case 3:
      id v4 = @"Bad position in stream";
      goto LABEL_9;
    case 4:
      objc_msgSend(WeakRetained, "_processingCompleted:", 0, @"Disconnected from log stream");
      goto LABEL_10;
    case 5:
      id v4 = @"Reached end of stream";
      goto LABEL_9;
    case 6:
      id v4 = @"Unsupported request";
      goto LABEL_9;
    case 7:
      id v4 = @"Insufficient permissions";
      goto LABEL_9;
    default:
      id v4 = @"Unknown error";
LABEL_9:
      id v5 = [MEMORY[0x263F087E8] errorWithCode:6 description:v4];
      [v6 _processingCompleted:v5];

LABEL_10:

      return;
  }
}

void __153__SignpostSupportObjectExtractor_Notifications__processNotificationsWithIntervalTimeoutInSeconds_shouldCalculateAnimationFramerate_targetQueue_errorOut___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained _liveStream];
  [v1 invalidate];

  objc_msgSend(WeakRetained, "set_liveStream:", 0);
}

uint64_t __82__SignpostSupportObjectExtractor_LogArchiveReading___eventSourceForPath_errorOut___block_invoke()
{
  v0 = _signpostcollection_debug_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __82__SignpostSupportObjectExtractor_LogArchiveReading___eventSourceForPath_errorOut___block_invoke_cold_1(v0);
  }

  return 1;
}

uint64_t __101__SignpostSupportObjectExtractor_TraceReading___processTraceFileWithPath_startDate_endDate_errorOut___block_invoke(uint64_t a1)
{
  int v2 = ktrace_chunk_tag();
  if (!*(unsigned char *)(a1 + 40))
  {
    if (!*(unsigned char *)(a1 + 41)) {
      return 1;
    }
    if (v2 == 20987) {
      goto LABEL_12;
    }
    int v3 = 36873;
LABEL_11:
    if (v2 == v3) {
      goto LABEL_12;
    }
    return 1;
  }
  if (!*(unsigned char *)(a1 + 41))
  {
    if (v2 == 36872) {
      goto LABEL_12;
    }
    int v3 = 20985;
    goto LABEL_11;
  }
  if ((v2 - 36872) >= 2 && v2 != 20985)
  {
    int v3 = 20987;
    goto LABEL_11;
  }
LABEL_12:
  uint64_t v4 = ktrace_chunk_size();
  uint64_t v5 = ktrace_chunk_map_data();
  if (!v5) {
    return 1;
  }
  id v6 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:v5 length:v4 freeWhenDone:0];
  if (v6
    && ((v7 = *(void **)(a1 + 32),
         id v15 = 0,
         int v8 = [v7 processSerializedObjectsFromData:v6 errorOut:&v15],
         id v9 = v15,
         uint64_t v10 = v9,
         !v8)
     || v9))
  {
    id v12 = (FILE *)*MEMORY[0x263EF8348];
    if (v9)
    {
      id v13 = [v9 localizedDescription];
      fprintf(v12, "ERROR: %s\n", (const char *)[v13 UTF8String]);
    }
    else
    {
      fprintf(v12, "ERROR: %s\n", "Unknown");
    }

    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = 1;
    uint64_t v10 = v6;
  }
  ktrace_chunk_unmap_data();

  return v11;
}

void __82__SignpostSupportObjectExtractor_LogArchiveReading___eventSourceForPath_errorOut___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21DE73000, log, OS_LOG_TYPE_DEBUG, "Upgrade confirmation requested.", v1, 2u);
}

@end