@interface TPSBiomeEventsProvider
+ (id)_eventSinceDateForContextualEvent:(id)a3;
+ (unint64_t)_limitForContextualBiomeEvent:(id)a3;
- (TPSBiomeEventsProvider)init;
- (TPSBiomeEventsProvider)initWithBiomeDataProvider:(id)a3;
- (id)_registrationIDForEvent:(id)a3;
- (id)_wakingRegistrationIDForEvent:(id)a3;
- (void)_processProviderResults:(id)a3 bookmark:(id)a4 forEvent:(id)a5;
- (void)_registerToGetNotifiedWithEvents:(id)a3 clientIdentifier:(id)a4;
- (void)deregisterAllEventsForCallback;
- (void)deregisterEventsForCallback:(id)a3;
- (void)queryEvents:(id)a3;
- (void)registerEventsForCallback:(id)a3;
@end

@implementation TPSBiomeEventsProvider

- (TPSBiomeEventsProvider)init
{
  v3 = objc_alloc_init(TPSBiomeDataProvider);
  v4 = [(TPSBiomeEventsProvider *)self initWithBiomeDataProvider:v3];

  return v4;
}

- (TPSBiomeEventsProvider)initWithBiomeDataProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSBiomeEventsProvider;
  v6 = [(TPSBiomeEventsProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_biomeDataProvider, a3);
  }

  return v7;
}

- (void)queryEvents:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = a3;
  uint64_t v21 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v6 = [(id)objc_opt_class() _limitForContextualBiomeEvent:v5];
        if (v6 == -1)
        {
          [(TPSBiomeEventsProvider *)self _processProviderResults:0 bookmark:0 forEvent:v5];
          goto LABEL_11;
        }
        v7 = (void *)v6;
        v8 = [MEMORY[0x1E4F1CA60] dictionary];
        objc_super v9 = [(id)objc_opt_class() _eventSinceDateForContextualEvent:v5];
        [v9 timeIntervalSinceReferenceDate];
        double v11 = v10;

        v12 = [v5 publisherFromStartTime:v11];
        v13 = [v5 bookmark];
        v14 = [v13 sinkBookmark];
        objc_initWeak(&location, self);
        v15 = dispatch_get_global_queue(21, 0);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __38__TPSBiomeEventsProvider_queryEvents___block_invoke;
        block[3] = &unk_1E5907D88;
        objc_copyWeak(v26, &location);
        block[4] = v5;
        id v23 = v12;
        id v24 = v14;
        id v25 = v8;
        v26[1] = v7;
        id v16 = v8;
        id v17 = v14;
        id v18 = v12;
        dispatch_async(v15, block);

        objc_destroyWeak(v26);
        objc_destroyWeak(&location);
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v21) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

void __38__TPSBiomeEventsProvider_queryEvents___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v26[0] = 0;
  v26[1] = v26;
  id v26[2] = 0x2020000000;
  v26[3] = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__5;
  id v24 = __Block_byref_object_dispose__5;
  id v25 = 0;
  v3 = [*(id *)(a1 + 32) filterHandler];
  v4 = *(void **)(a1 + 40);
  if (v3)
  {
    id v5 = [*(id *)(a1 + 32) filterHandler];
    id v6 = [v4 filterWithIsIncluded:v5];
  }
  else
  {
    id v6 = v4;
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __38__TPSBiomeEventsProvider_queryEvents___block_invoke_2;
  v17[3] = &unk_1E5907D38;
  uint64_t v7 = *(void *)(a1 + 32);
  v19 = &v20;
  v17[4] = v7;
  uint64_t v8 = *(void *)(a1 + 48);
  id v18 = *(id *)(a1 + 56);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __38__TPSBiomeEventsProvider_queryEvents___block_invoke_6;
  v13[3] = &unk_1E5907D60;
  uint64_t v9 = *(void *)(a1 + 32);
  v15 = v26;
  v13[4] = v9;
  id v10 = *(id *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 72);
  id v14 = v10;
  uint64_t v16 = v11;
  id v12 = (id)[v6 drivableSinkWithBookmark:v8 completion:v17 shouldContinue:v13];
  [WeakRetained _processProviderResults:*(void *)(a1 + 56) bookmark:v21[5] forEvent:*(void *)(a1 + 32)];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(v26, 8);
}

void __38__TPSBiomeEventsProvider_queryEvents___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = +[TPSContextualBiomeEventBookmark bookmarkWithSinkBookmark:a3];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = [v5 state];
  if (v9 == 1)
  {
    id v10 = +[TPSLogger data];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = [v5 error];
      v13 = [*(id *)(a1 + 32) identifier];
      int v14 = 138412546;
      v15 = v11;
      __int16 v16 = 2112;
      uint64_t v17 = (uint64_t)v13;
      _os_log_impl(&dword_19C8DC000, v10, OS_LOG_TYPE_INFO, "Sink completed with error: %@ for event: %@", (uint8_t *)&v14, 0x16u);

      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  if (!v9)
  {
    id v10 = +[TPSLogger data];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = [*(id *)(a1 + 32) identifier];
      uint64_t v12 = [*(id *)(a1 + 40) count];
      int v14 = 138412546;
      v15 = v11;
      __int16 v16 = 2048;
      uint64_t v17 = v12;
      _os_log_impl(&dword_19C8DC000, v10, OS_LOG_TYPE_INFO, "Sink completed for event: %@ (%lu events found)", (uint8_t *)&v14, 0x16u);
LABEL_7:

      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:
}

BOOL __38__TPSBiomeEventsProvider_queryEvents___block_invoke_6(uint64_t a1, void *a2)
{
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  v3 = (void *)MEMORY[0x1E4F29128];
  id v4 = a2;
  id v5 = [v3 UUID];
  uint64_t v6 = [v5 UUIDString];

  uint64_t v7 = [(id)objc_opt_class() observationDateFromEvent:v4];

  [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v6];
  BOOL v8 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) < *(void *)(a1 + 56);

  return v8;
}

- (void)_processProviderResults:(id)a3 bookmark:(id)a4 forEvent:(id)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = objc_alloc_init(TPSEventProviderResult);
  uint64_t v12 = [v9 identifier];

  [(TPSEventProviderResult *)v11 setIdentifier:v12];
  if (v8)
  {
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v8];
    [(TPSEventProviderResult *)v11 setObservationMap:v13];
  }
  else
  {
    [(TPSEventProviderResult *)v11 setObservationMap:MEMORY[0x1E4F1CC08]];
  }
  [(TPSEventProviderResult *)v11 setBookmark:v10];

  int v14 = [MEMORY[0x1E4F1C9C8] date];
  [(TPSEventProviderResult *)v11 setResultDate:v14];

  v15 = [(TPSEventsProvider *)self delegate];
  v17[0] = v11;
  __int16 v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  [v15 dataProvider:self didFinishQueryWithResults:v16];
}

- (void)registerEventsForCallback:(id)a3
{
}

- (void)deregisterEventsForCallback:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [(TPSBiomeEventsProvider *)self _registrationIDForEvent:*(void *)(*((void *)&v10 + 1) + 8 * v8)];
        [(TPSBiomeDataProvider *)self->_biomeDataProvider deregisterWakingForRegistrationID:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)deregisterAllEventsForCallback
{
}

- (void)_registerToGetNotifiedWithEvents:(id)a3 clientIdentifier:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        objc_initWeak(&location, self);
        if (v7) {
          [(TPSBiomeEventsProvider *)self _wakingRegistrationIDForEvent:v11];
        }
        else {
        long long v12 = [(TPSBiomeEventsProvider *)self _registrationIDForEvent:v11];
        }
        biomeDataProvider = self->_biomeDataProvider;
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __76__TPSBiomeEventsProvider__registerToGetNotifiedWithEvents_clientIdentifier___block_invoke;
        v15[3] = &unk_1E5907DB0;
        objc_copyWeak(&v16, &location);
        v15[4] = v11;
        [(TPSBiomeDataProvider *)biomeDataProvider registerWakingForEventWithEvent:v11 registrationID:v12 clientIdentifier:v7 completion:v15];
        objc_destroyWeak(&v16);

        objc_destroyWeak(&location);
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }
}

void __76__TPSBiomeEventsProvider__registerToGetNotifiedWithEvents_clientIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = +[TPSLogger default];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v3;
    _os_log_impl(&dword_19C8DC000, v5, OS_LOG_TYPE_INFO, "Got waking callback for identifier: %@", buf, 0xCu);
  }

  id v6 = objc_alloc_init(TPSEventProviderResult);
  id v7 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v8 = [*(id *)(a1 + 32) identifier];
  [(TPSEventProviderResult *)v6 setIdentifier:v8];
  uint64_t v11 = v8;
  long long v12 = v7;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  [(TPSEventProviderResult *)v6 setObservationMap:v9];

  [(TPSEventProviderResult *)v6 setResultDate:v7];
  long long v10 = [WeakRetained delegate];
  [v10 dataProvider:WeakRetained didReceiveCallbackWithResult:v6];
}

- (id)_registrationIDForEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[TPSCommonDefines mainBundleIdentifier];
  id v6 = NSString;
  id v7 = [v4 identifier];

  uint64_t v8 = [v6 stringWithFormat:@"%@-%p%@%@", v5, self, @"-event-", v7];

  return v8;
}

- (id)_wakingRegistrationIDForEvent:(id)a3
{
  id v3 = a3;
  id v4 = +[TPSCommonDefines mainBundleIdentifier];
  uint64_t v5 = NSString;
  id v6 = [v3 identifier];

  id v7 = [v5 stringWithFormat:@"%@%@%@", v4, @"-event-", v6];

  return v7;
}

+ (unint64_t)_limitForContextualBiomeEvent:(id)a3
{
  id v3 = a3;
  if ([v3 status])
  {
    unsigned int v4 = [v3 currentObservationCount];
    if (v4 >= [v3 minObservationCount])
    {
      unint64_t v5 = -1;
    }
    else
    {
      unint64_t v5 = [v3 minObservationCount];
      if (([v3 hasLookBackDays] & 1) == 0) {
        v5 -= [v3 currentObservationCount];
      }
    }
  }
  else
  {
    unint64_t v5 = 1;
  }

  return v5;
}

+ (id)_eventSinceDateForContextualEvent:(id)a3
{
  id v3 = [a3 eventSinceDate];
  if (!v3)
  {
    unsigned int v4 = [MEMORY[0x1E4F1C9C8] date];
    id v3 = [v4 dateByAddingTimeInterval:-63072000.0];
  }
  return v3;
}

- (void).cxx_destruct
{
}

@end