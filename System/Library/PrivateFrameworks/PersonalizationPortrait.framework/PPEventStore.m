@interface PPEventStore
- (BOOL)interactionSummaryMetricsError:(id *)a3 block:(id)a4;
- (BOOL)iterDailyEventHighlightsError:(id *)a3 block:(id)a4;
- (BOOL)iterDailyEventHighlightsWithOptions:(int)a3 error:(id *)a4 block:(id)a5;
- (BOOL)iterEventHighlightsFrom:(id)a3 to:(id)a4 error:(id *)a5 block:(id)a6;
- (BOOL)iterEventHighlightsFrom:(id)a3 to:(id)a4 options:(int)a5 error:(id *)a6 block:(id)a7;
- (BOOL)iterEventNameRecordsForClient:(id)a3 error:(id *)a4 block:(id)a5;
- (BOOL)iterScoredEventsWithQuery:(id)a3 error:(id *)a4 block:(id)a5;
- (BOOL)iterWeeklyEventHighlightsError:(id *)a3 block:(id)a4;
- (BOOL)iterWeeklyEventHighlightsWithOptions:(int)a3 error:(id *)a4 block:(id)a5;
- (BOOL)loadEventNameRecordsAndMonitorChangesWithDelegate:(id)a3 error:(id *)a4;
- (BOOL)sendRTCLogsWithError:(id *)a3;
- (PPEventStore)init;
- (id)_recordGenerator;
- (id)forwardingTargetForSelector:(SEL)a3;
- (void)_loadEventNameRecordsWithDelegate:(id)a3;
- (void)_sendChangesToDelegates:(id)a3;
- (void)logEventInteractionForEventWithEventIdentifier:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5;
- (void)registerFeedback:(id)a3 completion:(id)a4;
@end

@implementation PPEventStore

- (PPEventStore)init
{
  v8.receiver = self;
  v8.super_class = (Class)PPEventStore;
  v2 = [(PPEventStore *)&v8 init];
  if (v2)
  {
    v3 = [[PPRecordMonitoringHelper alloc] initWithName:@"EventStore"];
    monitoringHelper = v2->_monitoringHelper;
    v2->_monitoringHelper = v3;

    v5 = [[PPClientFeedbackHelper alloc] initWithParentObject:v2];
    clientFeedbackHelper = v2->_clientFeedbackHelper;
    v2->_clientFeedbackHelper = v5;
  }
  return v2;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  if (objc_opt_respondsToSelector()) {
    v4 = self->_clientFeedbackHelper;
  }
  else {
    v4 = 0;
  }
  return v4;
}

- (BOOL)iterScoredEventsWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v9 = +[PPEventClient sharedInstance];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__PPEventStore_iterScoredEventsWithQuery_error_block___block_invoke;
  v12[3] = &unk_1E550F880;
  id v13 = v7;
  id v10 = v7;
  LOBYTE(a4) = [v9 scoredEventsWithQuery:v8 error:a4 handleBatch:v12];

  return (char)a4;
}

void __63__PPEventStore_iterEventHighlightsFrom_to_options_error_block___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = pp_events_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18CAA6000, v6, OS_LOG_TYPE_INFO, "Getting into callback on client", buf, 2u);
  }

  if (!*a3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
LABEL_6:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
        if (*a3) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
          if (v9) {
            goto LABEL_6;
          }
          break;
        }
      }
    }
  }
}

void __54__PPEventStore_iterScoredEventsWithQuery_error_block___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = pp_events_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18CAA6000, v6, OS_LOG_TYPE_INFO, "Getting into callback on client", buf, 2u);
  }

  if (!*a3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
LABEL_6:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
        if (*a3) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
          if (v9) {
            goto LABEL_6;
          }
          break;
        }
      }
    }
  }
}

- (BOOL)iterEventHighlightsFrom:(id)a3 to:(id)a4 options:(int)a5 error:(id *)a6 block:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  long long v14 = pp_events_log_handle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v22 = v11;
    __int16 v23 = 2112;
    id v24 = v12;
    _os_log_impl(&dword_18CAA6000, v14, OS_LOG_TYPE_DEFAULT, "loadEventHighlights from: %@ to: %@", buf, 0x16u);
  }

  long long v15 = +[PPEventClient sharedInstance];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __63__PPEventStore_iterEventHighlightsFrom_to_options_error_block___block_invoke;
  v19[3] = &unk_1E550F880;
  id v20 = v13;
  id v16 = v13;
  char v17 = [v15 eventHighlightsFrom:v11 to:v12 options:v9 error:a6 handleBatch:v19];

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientFeedbackHelper, 0);
  objc_storeStrong((id *)&self->_monitoringHelper, 0);
}

- (void)registerFeedback:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  if ([v8 isMapped])
  {
    long long v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"PPEventStore.m" lineNumber:282 description:@"You cannot send mapped feedback on events. Please use PPFeedback to create the feedback for events."];
  }
  uint64_t v9 = [(PPEventStore *)self clientIdentifier];
  uint64_t v10 = [v9 length];

  if (!v10)
  {
    long long v15 = [MEMORY[0x1E4F28B00] currentHandler];
    id v16 = (objc_class *)objc_opt_class();
    char v17 = NSStringFromClass(v16);
    [v15 handleFailureInMethod:a2, self, @"PPEventStore.m", 283, @"The clientIdentifier property must be set on the %@ in order to send feedback.", v17 object file lineNumber description];
  }
  id v11 = [(PPEventStore *)self clientIdentifier];
  [v8 setClientIdentifier:v11];

  id v12 = +[PPEventClient sharedInstance];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __44__PPEventStore_registerFeedback_completion___block_invoke;
  v18[3] = &unk_1E550F8A8;
  v18[4] = self;
  id v19 = v7;
  id v13 = v7;
  [v12 registerFeedback:v8 completion:v18];
}

void __44__PPEventStore_registerFeedback_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = *(id *)(a1 + 32);
  if (v5)
  {
    id v7 = pp_events_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_error_impl(&dword_18CAA6000, v7, OS_LOG_TYPE_ERROR, "Error from registerFeedback:completion: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  }
}

- (BOOL)sendRTCLogsWithError:(id *)a3
{
  v4 = +[PPEventClient sharedInstance];
  LOBYTE(a3) = [v4 sendRTCLogsWithError:a3];

  return (char)a3;
}

- (BOOL)interactionSummaryMetricsError:(id *)a3 block:(id)a4
{
  id v5 = a4;
  id v6 = +[PPEventClient sharedInstance];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__PPEventStore_interactionSummaryMetricsError_block___block_invoke;
  v9[3] = &unk_1E550F880;
  id v10 = v5;
  id v7 = v5;
  LOBYTE(a3) = [v6 interactionSummaryMetricsWithError:a3 handleBatch:v9];

  return (char)a3;
}

void __53__PPEventStore_interactionSummaryMetricsError_block___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = v5;
  if (!*a3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
        if (*a3) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v9) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

- (void)logEventInteractionForEventWithEventIdentifier:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a4;
  id v7 = a3;
  id v8 = +[PPEventClient sharedInstance];
  [v8 logEventInteractionForEventWithEventIdentifier:v7 interface:v6 actionType:v5];
}

- (BOOL)iterWeeklyEventHighlightsError:(id *)a3 block:(id)a4
{
  return [(PPEventStore *)self iterWeeklyEventHighlightsWithOptions:0 error:a3 block:a4];
}

- (BOOL)iterDailyEventHighlightsError:(id *)a3 block:(id)a4
{
  return [(PPEventStore *)self iterDailyEventHighlightsWithOptions:0 error:a3 block:a4];
}

- (BOOL)iterEventHighlightsFrom:(id)a3 to:(id)a4 error:(id *)a5 block:(id)a6
{
  return [(PPEventStore *)self iterEventHighlightsFrom:a3 to:a4 options:0 error:a5 block:a6];
}

- (BOOL)iterWeeklyEventHighlightsWithOptions:(int)a3 error:(id *)a4 block:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = (void *)MEMORY[0x1E4F1C9A8];
  id v9 = a5;
  uint64_t v10 = [v8 currentCalendar];
  uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
  id v15 = 0;
  double v16 = 0.0;
  [v10 rangeOfUnit:0x2000 startDate:&v15 interval:&v16 forDate:v11];
  id v12 = v15;
  long long v13 = [v12 dateByAddingTimeInterval:v16 + -1.0];
  LOBYTE(a4) = [(PPEventStore *)self iterEventHighlightsFrom:v11 to:v13 options:v6 error:a4 block:v9];

  return (char)a4;
}

- (BOOL)iterDailyEventHighlightsWithOptions:(int)a3 error:(id *)a4 block:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = objc_opt_new();
  uint64_t v10 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v11 = [v10 components:252 fromDate:v9];
  [v11 setHour:23];
  [v11 setMinute:59];
  [v11 setSecond:59];
  id v12 = [v10 dateFromComponents:v11];
  if (v12)
  {
    LOBYTE(a4) = [(PPEventStore *)self iterEventHighlightsFrom:v9 to:v12 options:v6 error:a4 block:v8];
  }
  else
  {
    long long v13 = pp_events_log_handle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v11;
      _os_log_error_impl(&dword_18CAA6000, v13, OS_LOG_TYPE_ERROR, "failed to get endOfDay from %@", buf, 0xCu);
    }

    if (a4)
    {
      long long v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = @"PPErrorInfoKey";
      id v15 = (void *)[[NSString alloc] initWithFormat:@"failed to get endOfDay from %@", v11];
      id v19 = v15;
      double v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      *a4 = [v14 errorWithDomain:@"PPErrorDomain" code:12 userInfo:v16];

      LOBYTE(a4) = 0;
    }
  }

  return (char)a4;
}

- (BOOL)loadEventNameRecordsAndMonitorChangesWithDelegate:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  monitoringHelper = self->_monitoringHelper;
  id v7 = [(PPEventStore *)self _recordGenerator];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__PPEventStore_loadEventNameRecordsAndMonitorChangesWithDelegate_error___block_invoke;
  v9[3] = &unk_1E550F488;
  objc_copyWeak(&v10, &location);
  LOBYTE(monitoringHelper) = [(PPRecordMonitoringHelper *)monitoringHelper loadRecordsAndMonitorChangesWithDelegate:v5 recordGenerator:v7 notificationRegistrationBlock:v9];
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
  return (char)monitoringHelper;
}

void __72__PPEventStore_loadEventNameRecordsAndMonitorChangesWithDelegate_error___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __72__PPEventStore_loadEventNameRecordsAndMonitorChangesWithDelegate_error___block_invoke_2;
  v3[3] = &unk_1E550E930;
  objc_copyWeak(&v4, v1);
  +[PPNotificationManager addEventKitObserverForLifetimeOfObject:WeakRetained block:v3];

  objc_destroyWeak(&v4);
}

void __72__PPEventStore_loadEventNameRecordsAndMonitorChangesWithDelegate_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = (void *)*((void *)WeakRetained + 1);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __72__PPEventStore_loadEventNameRecordsAndMonitorChangesWithDelegate_error___block_invoke_3;
    v7[3] = &unk_1E550E9C8;
    id v8 = v3;
    id v9 = v5;
    [v6 handleChangeNotificationWithName:@"Events" afterDelaySeconds:v7 handler:1.0];
  }
}

uint64_t __72__PPEventStore_loadEventNameRecordsAndMonitorChangesWithDelegate_error___block_invoke_3(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = pp_events_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) count];
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_18CAA6000, v2, OS_LOG_TYPE_DEFAULT, "_sendChangesToDelegates Events observation block being called with %tu changes", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) _sendChangesToDelegates:*(void *)(a1 + 32)];
}

- (void)_loadEventNameRecordsWithDelegate:(id)a3
{
  monitoringHelper = self->_monitoringHelper;
  id v5 = a3;
  id v6 = [(PPEventStore *)self _recordGenerator];
  [(PPRecordMonitoringHelper *)monitoringHelper loadRecordsWithDelegate:v5 recordGenerator:v6];
}

- (void)_sendChangesToDelegates:(id)a3
{
  id v4 = a3;
  monitoringHelper = self->_monitoringHelper;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__PPEventStore__sendChangesToDelegates___block_invoke;
  v8[3] = &unk_1E550E908;
  id v9 = v4;
  id v6 = v4;
  uint64_t v7 = [(PPEventStore *)self _recordGenerator];
  [(PPRecordMonitoringHelper *)monitoringHelper sendChangesToDelegatesWithChangeGenerator:v8 recordGenerator:v7];
}

id __40__PPEventStore__sendChangesToDelegates___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([*(id *)(a1 + 32) count])
  {
    id v6 = objc_opt_new();
    uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "_pas_mappedArrayWithTransform:", &__block_literal_global_12);
    id v8 = +[PPEventClient sharedInstance];
    id v9 = [v5 name];
    id v16 = 0;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __40__PPEventStore__sendChangesToDelegates___block_invoke_3;
    v14[3] = &unk_1E550E8E0;
    id v10 = v6;
    id v15 = v10;
    [v8 resolveEventNameRecordChanges:v7 client:v9 error:&v16 handleBatch:v14];
    id v11 = v16;

    if (v11)
    {
      id v12 = pp_events_log_handle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v11;
        _os_log_error_impl(&dword_18CAA6000, v12, OS_LOG_TYPE_ERROR, "resolveEventNameRecordChanges returned error: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    if (a3) {
      *a3 = 1;
    }
    id v10 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v10;
}

uint64_t __40__PPEventStore__sendChangesToDelegates___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObjectsFromArray:a2];
}

uint64_t __40__PPEventStore__sendChangesToDelegates___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 changedObjectID];
}

- (id)_recordGenerator
{
  return &__block_literal_global_4500;
}

id __32__PPEventStore__recordGenerator__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = __Block_byref_object_copy__4502;
  id v15 = __Block_byref_object_dispose__4503;
  id v16 = 0;
  id v16 = (id)objc_opt_new();
  uint64_t v3 = +[PPEventClient sharedInstance];
  id v4 = [v2 name];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __32__PPEventStore__recordGenerator__block_invoke_9;
  v9[3] = &unk_1E550E898;
  void v9[4] = &v11;
  id v10 = 0;
  [v3 eventNameRecordsForClient:v4 error:&v10 handleBatch:v9];
  id v5 = v10;

  if (v5)
  {
    id v6 = pp_events_log_handle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v2;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_error_impl(&dword_18CAA6000, v6, OS_LOG_TYPE_ERROR, "error during eventNameRecordsForClient for delegate %@: %@", buf, 0x16u);
    }
  }
  id v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v7;
}

uint64_t __32__PPEventStore__recordGenerator__block_invoke_9(uint64_t result, uint64_t a2, unsigned char *a3)
{
  if (!*a3) {
    return [*(id *)(*(void *)(*(void *)(result + 32) + 8) + 40) addObjectsFromArray:a2];
  }
  return result;
}

- (BOOL)iterEventNameRecordsForClient:(id)a3 error:(id *)a4 block:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = +[PPEventClient sharedInstance];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__PPEventStore_iterEventNameRecordsForClient_error_block___block_invoke;
  v12[3] = &unk_1E550F880;
  id v13 = v7;
  id v10 = v7;
  LOBYTE(a4) = [v9 eventNameRecordsForClient:v8 error:a4 handleBatch:v12];

  return (char)a4;
}

void __58__PPEventStore_iterEventNameRecordsForClient_error_block___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = v5;
  if (!*a3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
        if (*a3) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v9) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

@end