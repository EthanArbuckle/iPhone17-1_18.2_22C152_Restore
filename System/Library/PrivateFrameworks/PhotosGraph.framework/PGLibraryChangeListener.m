@interface PGLibraryChangeListener
- (BOOL)_distributeChangesInFetchResult:(id)a3;
- (BOOL)libraryBecameUnavailable;
- (NSCountedSet)outstandingChangeTokenCounts;
- (NSHashTable)changeConsumers;
- (NSMapTable)outstandingChangeTokensByConsumer;
- (NSMutableOrderedSet)outstandingChangeTokens;
- (NSString)clientIdentifier;
- (PGGraphUpdateHealthRecording)updateHealthRecorder;
- (PGLibraryChangeListener)initWithPhotoLibrary:(id)a3 clientIdentifier:(id)a4 analytics:(id)a5;
- (PGLibraryChangeListenerStateStore)stateStore;
- (PHPersistentChangeToken)currentToken;
- (PHPersistentChangeToken)lastReadToken;
- (PHPhotoLibrary)photoLibrary;
- (id)_consumer:(id)a3 withChangeTokens:(id)a4 processedChangeTokens:(id)a5 consumedTokens:(BOOL)a6;
- (unint64_t)maximumNumberOfMutationsToFetch;
- (unint64_t)mode;
- (unint64_t)outstandingTokensHighWaterMark;
- (unint64_t)outstandingTokensLowWaterMark;
- (void)_clearConsumerTokenState;
- (void)_notifyConsumersWithChangesFromFromChangeToken:(id)a3;
- (void)consumer:(id)a3 didConsumeChangeTokens:(id)a4;
- (void)consumer:(id)a3 didIgnoreChangeTokens:(id)a4;
- (void)persistToken:(id)a3;
- (void)photoLibraryDidBecomeUnavailable:(id)a3;
- (void)photoLibraryDidChange:(id)a3;
- (void)registerChangeConsumer:(id)a3;
- (void)registerForLibraryUnavailability:(id)a3;
- (void)setLastReadToken:(id)a3;
- (void)setLibraryBecameUnavailable:(BOOL)a3;
- (void)setMode:(unint64_t)a3;
- (void)startListening;
- (void)stopListening;
- (void)unregisterChangeConsumer:(id)a3;
@end

@implementation PGLibraryChangeListener

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateHealthRecorder, 0);
  objc_storeStrong((id *)&self->_lastReadToken, 0);
  objc_storeStrong((id *)&self->_outstandingChangeTokenCounts, 0);
  objc_storeStrong((id *)&self->_outstandingChangeTokensByConsumer, 0);
  objc_storeStrong((id *)&self->_outstandingChangeTokens, 0);
  objc_storeStrong((id *)&self->_changeConsumers, 0);
  objc_storeStrong((id *)&self->_stateStore, 0);
  objc_destroyWeak((id *)&self->_photoLibrary);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_changeObservationQueue, 0);
}

- (void)setLibraryBecameUnavailable:(BOOL)a3
{
  self->_libraryBecameUnavailable = a3;
}

- (BOOL)libraryBecameUnavailable
{
  return self->_libraryBecameUnavailable;
}

- (PGGraphUpdateHealthRecording)updateHealthRecorder
{
  return self->_updateHealthRecorder;
}

- (void)setLastReadToken:(id)a3
{
}

- (PHPersistentChangeToken)lastReadToken
{
  return self->_lastReadToken;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (unint64_t)maximumNumberOfMutationsToFetch
{
  return self->_maximumNumberOfMutationsToFetch;
}

- (unint64_t)outstandingTokensLowWaterMark
{
  return self->_outstandingTokensLowWaterMark;
}

- (unint64_t)outstandingTokensHighWaterMark
{
  return self->_outstandingTokensHighWaterMark;
}

- (NSCountedSet)outstandingChangeTokenCounts
{
  return self->_outstandingChangeTokenCounts;
}

- (NSMapTable)outstandingChangeTokensByConsumer
{
  return self->_outstandingChangeTokensByConsumer;
}

- (NSMutableOrderedSet)outstandingChangeTokens
{
  return self->_outstandingChangeTokens;
}

- (NSHashTable)changeConsumers
{
  return self->_changeConsumers;
}

- (PGLibraryChangeListenerStateStore)stateStore
{
  return self->_stateStore;
}

- (PHPhotoLibrary)photoLibrary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  return (PHPhotoLibrary *)WeakRetained;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (BOOL)_distributeChangesInFetchResult:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_changeObservationQueue);
  BOOL v5 = 1;
  if ([v4 changeCount])
  {
    id v27 = v4;
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x2020000000;
    char v44 = 1;
    context = (void *)MEMORY[0x1D25FED50]();
    v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "changeCount"));
    v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "changeCount"));
    uint64_t v37 = 0;
    v38 = &v37;
    uint64_t v39 = 0x2020000000;
    uint64_t v40 = 0;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __59__PGLibraryChangeListener__distributeChangesInFetchResult___block_invoke;
    v32[3] = &unk_1E68E54A0;
    v32[4] = self;
    v35 = &v41;
    v36 = &v37;
    id v8 = v6;
    id v33 = v8;
    id v9 = v7;
    id v34 = v9;
    [v4 enumeratePHChangesWithBlock:v32];
    if (*((unsigned char *)v42 + 24))
    {
      if ([v9 count])
      {
        v10 = [(PGLibraryChangeListener *)self outstandingChangeTokens];
        [v10 addObjectsFromArray:v9];

        v11 = [v9 lastObject];
        [(PGLibraryChangeListener *)self setLastReadToken:v11];
      }
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      v12 = [(PGLibraryChangeListener *)self changeConsumers];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v45 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v29 != v14) {
              objc_enumerationMutation(v12);
            }
            v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            if ([v9 count])
            {
              v17 = [(PGLibraryChangeListener *)self outstandingChangeTokenCounts];
              [v17 addObjectsFromArray:v9];

              v18 = [(PGLibraryChangeListener *)self outstandingChangeTokensByConsumer];
              id v19 = [v18 objectForKey:v16];

              if (!v19)
              {
                id v19 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
                v20 = [(PGLibraryChangeListener *)self outstandingChangeTokensByConsumer];
                [v20 setObject:v19 forKey:v16];
              }
              [v19 addObjectsFromArray:v9];
            }
            [v16 libraryChangesAvailable:v8];
          }
          uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v45 count:16];
        }
        while (v13);
      }

      unint64_t v21 = v38[3];
      if (v21 < [(PGLibraryChangeListener *)self maximumNumberOfMutationsToFetch]) {
        goto LABEL_23;
      }
      [(PGLibraryChangeListener *)self setMode:2];
      v22 = [(PGLibraryChangeListener *)self updateHealthRecorder];
      [v22 recordNumberOfTimesGraphUpdatePaused:1];
    }
    else
    {
      unint64_t v23 = v38[3];
      if (v23 < [(PGLibraryChangeListener *)self maximumNumberOfMutationsToFetch])
      {
LABEL_23:

        _Block_object_dispose(&v37, 8);
        BOOL v5 = *((unsigned char *)v42 + 24) != 0;
        _Block_object_dispose(&v41, 8);
        id v4 = v27;
        goto LABEL_24;
      }
      unint64_t v24 = v38[3];
      if (!v24) {
        unint64_t v24 = [(PGLibraryChangeListener *)self maximumNumberOfMutationsToFetch];
      }
      v22 = [(PGLibraryChangeListener *)self updateHealthRecorder];
      [v22 recordTransactionSize:v24];
    }

    goto LABEL_23;
  }
LABEL_24:

  return v5;
}

void __59__PGLibraryChangeListener__distributeChangesInFetchResult___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([*(id *)(a1 + 32) libraryBecameUnavailable])
  {
    *a3 = 1;
    v6 = +[PGLogging sharedLogging];
    v7 = [v6 loggingConnection];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1D1805000, v7, OS_LOG_TYPE_INFO, "Photo library became unavailable. Stopping change enumeration.", (uint8_t *)&v14, 2u);
    }
LABEL_12:

    goto LABEL_13;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v5 hasIncrementalChanges];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) += [v5 totalChangeCount];
    unint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    unint64_t v9 = [*(id *)(a1 + 32) maximumNumberOfMutationsToFetch];
    v10 = *(void **)(a1 + 40);
    if (v8 <= v9)
    {
      [v10 addObject:v5];
      v7 = [v5 changeToken];
      if (v7) {
        [*(id *)(a1 + 48) addObject:v7];
      }
      goto LABEL_12;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v10 count] != 0;
    *a3 = 1;
  }
  else
  {
    v11 = +[PGLogging sharedLogging];
    v12 = [v11 loggingConnection];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = [*(id *)(a1 + 32) maximumNumberOfMutationsToFetch];
      int v14 = 134217984;
      uint64_t v15 = v13;
      _os_log_impl(&dword_1D1805000, v12, OS_LOG_TYPE_INFO, "GraphLiveUpdate - detected transaction exceeding maximum allowed mutations per transaction (%lu), will signaling incremental changes not available", (uint8_t *)&v14, 0xCu);
    }

    *a3 = 1;
  }
LABEL_13:
}

- (void)_clearConsumerTokenState
{
  v3 = [(PGLibraryChangeListener *)self outstandingChangeTokens];
  [v3 removeAllObjects];

  id v4 = [(PGLibraryChangeListener *)self outstandingChangeTokensByConsumer];
  [v4 removeAllObjects];

  id v5 = [(PGLibraryChangeListener *)self outstandingChangeTokenCounts];
  [v5 removeAllObjects];
}

- (id)_consumer:(id)a3 withChangeTokens:(id)a4 processedChangeTokens:(id)a5 consumedTokens:(BOOL)a6
{
  BOOL v30 = a6;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_changeObservationQueue);
  id v10 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v32 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        [v8 removeObject:v16];
        v17 = [(PGLibraryChangeListener *)self outstandingChangeTokenCounts];
        uint64_t v18 = [v17 countForObject:v16];

        if (v18 == 1)
        {
          id v19 = [(PGLibraryChangeListener *)self outstandingChangeTokens];
          uint64_t v20 = [v19 indexOfObject:v16];

          [v10 addIndex:v20];
        }
        unint64_t v21 = [(PGLibraryChangeListener *)self outstandingChangeTokenCounts];
        [v21 removeObject:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v13);
  }

  if ([v10 count])
  {
    if (v30)
    {
      v22 = [(PGLibraryChangeListener *)self outstandingChangeTokens];
      unint64_t v23 = objc_msgSend(v22, "objectAtIndex:", objc_msgSend(v10, "lastIndex"));

      unint64_t v24 = [(PGLibraryChangeListener *)self stateStore];
      [v24 setChangeToken:v23];
    }
    else
    {
      unint64_t v23 = 0;
    }
    v25 = [(PGLibraryChangeListener *)self outstandingChangeTokens];
    [v25 removeObjectsAtIndexes:v10];
  }
  else
  {
    unint64_t v23 = 0;
  }
  if ([(PGLibraryChangeListener *)self mode] == 2)
  {
    v26 = [(PGLibraryChangeListener *)self outstandingChangeTokens];
    uint64_t v27 = [v26 count];

    if (!v27)
    {
      [(PGLibraryChangeListener *)self setMode:1];
      long long v28 = [(PGLibraryChangeListener *)self lastReadToken];
      [(PGLibraryChangeListener *)self _notifyConsumersWithChangesFromFromChangeToken:v28];
    }
  }

  return v23;
}

- (void)consumer:(id)a3 didIgnoreChangeTokens:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    objc_initWeak(&location, self);
    changeObservationQueue = self->_changeObservationQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__PGLibraryChangeListener_consumer_didIgnoreChangeTokens___block_invoke;
    v9[3] = &unk_1E68E7058;
    objc_copyWeak(&v12, &location);
    id v10 = v6;
    id v11 = v7;
    dispatch_async(changeObservationQueue, v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __58__PGLibraryChangeListener_consumer_didIgnoreChangeTokens___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    v3 = [WeakRetained outstandingChangeTokensByConsumer];
    id v4 = [v3 objectForKey:*(void *)(a1 + 32)];

    id v5 = (id)[v6 _consumer:*(void *)(a1 + 32) withChangeTokens:v4 processedChangeTokens:*(void *)(a1 + 40) consumedTokens:0];
    id WeakRetained = v6;
  }
}

- (void)consumer:(id)a3 didConsumeChangeTokens:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    objc_initWeak(&location, self);
    changeObservationQueue = self->_changeObservationQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __59__PGLibraryChangeListener_consumer_didConsumeChangeTokens___block_invoke;
    v9[3] = &unk_1E68E7058;
    objc_copyWeak(&v12, &location);
    id v10 = v6;
    id v11 = v7;
    dispatch_async(changeObservationQueue, v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __59__PGLibraryChangeListener_consumer_didConsumeChangeTokens___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    v3 = [WeakRetained outstandingChangeTokensByConsumer];
    id v4 = [v3 objectForKey:*(void *)(a1 + 32)];

    id v5 = (id)[v6 _consumer:*(void *)(a1 + 32) withChangeTokens:v4 processedChangeTokens:*(void *)(a1 + 40) consumedTokens:1];
    id WeakRetained = v6;
  }
}

- (void)_notifyConsumersWithChangesFromFromChangeToken:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  changeObservationQueue = self->_changeObservationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__PGLibraryChangeListener__notifyConsumersWithChangesFromFromChangeToken___block_invoke;
  v7[3] = &unk_1E68E7058;
  objc_copyWeak(&v10, &location);
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(changeObservationQueue, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __74__PGLibraryChangeListener__notifyConsumersWithChangesFromFromChangeToken___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = [WeakRetained mode];
  if (WeakRetained)
  {
    if (v3)
    {
      if (v3 != 2)
      {
        id v4 = [WeakRetained changeConsumers];
        uint64_t v5 = [v4 count];

        if (v5)
        {
          id v6 = objc_alloc_init(MEMORY[0x1E4F391E0]);
          id v7 = v6;
          if (*(void *)(a1 + 32))
          {
            objc_msgSend(v6, "setToken:");
          }
          else
          {
            id v8 = [WeakRetained lastReadToken];
            [v7 setToken:v8];
          }
          objc_msgSend(v7, "setMaximumChangeThreshold:", objc_msgSend(*(id *)(a1 + 40), "maximumNumberOfMutationsToFetch"));
          id v9 = [WeakRetained photoLibrary];
          id v26 = 0;
          id v10 = [v9 fetchPersistentChangesWithRequest:v7 error:&v26];
          id v11 = v26;

          if (v10)
          {
            if ([*(id *)(a1 + 40) _distributeChangesInFetchResult:v10])
            {
LABEL_26:

              goto LABEL_27;
            }
          }
          else
          {
            if (v11 && [v11 code] != 3105)
            {
              uint64_t v14 = +[PGLogging sharedLogging];
              uint64_t v13 = [v14 loggingConnection];

              if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
              {
                unint64_t v21 = [v7 token];
                *(_DWORD *)buf = 138412546;
                id v29 = v21;
                __int16 v30 = 2112;
                id v31 = v11;
                _os_log_error_impl(&dword_1D1805000, v13, OS_LOG_TYPE_ERROR, "GraphLiveUpdate - Failed to fetch persistent changes since token (%@) with error: %@", buf, 0x16u);
              }
            }
            else
            {
              id v12 = +[PGLogging sharedLogging];
              uint64_t v13 = [v12 loggingConnection];

              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                id v29 = v11;
                _os_log_impl(&dword_1D1805000, v13, OS_LOG_TYPE_INFO, "GraphLiveUpdate - detected that a token is inconsistent with error: %@", buf, 0xCu);
              }
            }
          }
          uint64_t v15 = [WeakRetained stateStore];
          [v15 setChangeToken:0];

          [WeakRetained setLastReadToken:0];
          long long v24 = 0u;
          long long v25 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          uint64_t v16 = objc_msgSend(WeakRetained, "changeConsumers", 0);
          uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v27 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v23;
            do
            {
              uint64_t v20 = 0;
              do
              {
                if (*(void *)v23 != v19) {
                  objc_enumerationMutation(v16);
                }
                [*(id *)(*((void *)&v22 + 1) + 8 * v20++) incrementalChangeNotAvailable];
              }
              while (v18 != v20);
              uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v27 count:16];
            }
            while (v18);
          }

          goto LABEL_26;
        }
      }
    }
  }
LABEL_27:
}

- (PHPersistentChangeToken)currentToken
{
  v2 = [(PGLibraryChangeListener *)self stateStore];
  uint64_t v3 = [v2 changeToken];

  return (PHPersistentChangeToken *)v3;
}

- (void)photoLibraryDidChange:(id)a3
{
  if ([(PGLibraryChangeListener *)self mode] == 1)
  {
    [(PGLibraryChangeListener *)self _notifyConsumersWithChangesFromFromChangeToken:0];
  }
}

- (void)persistToken:(id)a3
{
  id v4 = a3;
  id v5 = [(PGLibraryChangeListener *)self stateStore];
  [v5 setChangeToken:v4];
}

- (void)unregisterChangeConsumer:(id)a3
{
  id v4 = a3;
  changeObservationQueue = self->_changeObservationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__PGLibraryChangeListener_unregisterChangeConsumer___block_invoke;
  v7[3] = &unk_1E68EED30;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(changeObservationQueue, v7);
}

void __52__PGLibraryChangeListener_unregisterChangeConsumer___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) changeConsumers];
  [v2 removeObject:*(void *)(a1 + 40)];

  uint64_t v3 = [*(id *)(a1 + 32) outstandingChangeTokensByConsumer];
  id v9 = [v3 objectForKey:*(void *)(a1 + 40)];

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [v9 array];
  id v7 = (id)[v4 _consumer:v5 withChangeTokens:v9 processedChangeTokens:v6 consumedTokens:0];

  id v8 = [*(id *)(a1 + 32) outstandingChangeTokensByConsumer];
  [v8 removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)registerChangeConsumer:(id)a3
{
  id v4 = a3;
  changeObservationQueue = self->_changeObservationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__PGLibraryChangeListener_registerChangeConsumer___block_invoke;
  v7[3] = &unk_1E68EED30;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(changeObservationQueue, v7);
}

void __50__PGLibraryChangeListener_registerChangeConsumer___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) changeConsumers];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (void)stopListening
{
  changeObservationQueue = self->_changeObservationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__PGLibraryChangeListener_stopListening__block_invoke;
  block[3] = &unk_1E68F0B18;
  block[4] = self;
  dispatch_sync(changeObservationQueue, block);
}

uint64_t __40__PGLibraryChangeListener_stopListening__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) updateHealthRecorder];
  [v2 endRecordingInBackground:0];

  uint64_t v3 = [*(id *)(a1 + 32) changeConsumers];
  [v3 removeAllObjects];

  [*(id *)(a1 + 32) _clearConsumerTokenState];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *MEMORY[0x1E4F397E8];
  id v7 = [v5 photoLibrary];
  [v4 removeObserver:v5 name:v6 object:v7];

  id v8 = *(void **)(a1 + 32);
  return [v8 setMode:0];
}

- (void)startListening
{
  changeObservationQueue = self->_changeObservationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__PGLibraryChangeListener_startListening__block_invoke;
  block[3] = &unk_1E68F0B18;
  block[4] = self;
  dispatch_sync(changeObservationQueue, block);
}

void __41__PGLibraryChangeListener_startListening__block_invoke(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) photoLibrary];
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 addObserver:*(void *)(a1 + 32) selector:sel_photoLibraryDidChange_ name:*MEMORY[0x1E4F397E8] object:v8];

  [v8 setPostsPersistentHistoryChangedNotifications:1];
  [*(id *)(a1 + 32) setMode:1];
  uint64_t v3 = [*(id *)(a1 + 32) stateStore];
  id v4 = [v3 changeToken];
  [*(id *)(a1 + 32) setLastReadToken:v4];

  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = [v5 lastReadToken];
  [v5 _notifyConsumersWithChangesFromFromChangeToken:v6];

  id v7 = [*(id *)(a1 + 32) updateHealthRecorder];
  [v7 beginRecording];
}

- (void)registerForLibraryUnavailability:(id)a3
{
}

- (void)photoLibraryDidBecomeUnavailable:(id)a3
{
  [(PGLibraryChangeListener *)self setLibraryBecameUnavailable:1];
  [(PGLibraryChangeListener *)self stopListening];
}

- (PGLibraryChangeListener)initWithPhotoLibrary:(id)a3 clientIdentifier:(id)a4 analytics:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)PGLibraryChangeListener;
  id v11 = [(PGLibraryChangeListener *)&v29 init];
  if (v11)
  {
    id v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v13 = dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.photosgraph.changeobserver", v13);
    changeObservationQueue = v11->_changeObservationQueue;
    v11->_changeObservationQueue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v11->_clientIdentifier, a4);
    uint64_t v16 = [[PGLibraryChangeListenerStateStore alloc] initWithPhotoLibrary:v8];
    stateStore = v11->_stateStore;
    v11->_stateStore = v16;

    objc_storeWeak((id *)&v11->_photoLibrary, v8);
    [(PGLibraryChangeListener *)v11 registerForLibraryUnavailability:v8];
    uint64_t v18 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    changeConsumers = v11->_changeConsumers;
    v11->_changeConsumers = (NSHashTable *)v18;

    uint64_t v20 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    outstandingChangeTokens = v11->_outstandingChangeTokens;
    v11->_outstandingChangeTokens = v20;

    uint64_t v22 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    outstandingChangeTokensByConsumer = v11->_outstandingChangeTokensByConsumer;
    v11->_outstandingChangeTokensByConsumer = (NSMapTable *)v22;

    long long v24 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    outstandingChangeTokenCounts = v11->_outstandingChangeTokenCounts;
    v11->_outstandingChangeTokenCounts = v24;

    if (tokenCountHighWaterMark_onceToken != -1) {
      dispatch_once(&tokenCountHighWaterMark_onceToken, &__block_literal_global_5260);
    }
    v11->_outstandingTokensHighWaterMark = tokenCountHighWaterMark_sMaximumChangeTokensCount;
    v11->_outstandingTokensLowWaterMark = (unint64_t)((double)(unint64_t)tokenCountHighWaterMark_sMaximumChangeTokensCount
                                                           * 0.1);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __maximumNumberOfMutationsToFetch_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = tokenCountHighWaterMark_sMaximumChangeTokensCount;
    if (maximumNumberOfMutationsToFetch_onceToken != -1) {
      dispatch_once(&maximumNumberOfMutationsToFetch_onceToken, block);
    }
    v11->_maximumNumberOfMutationsToFetch = maximumNumberOfMutationsToFetch_sMaximumMutationsToFetch;
    uint64_t v26 = +[PGGraphHealthRecordingFactory graphUpdateHealthRecorderForChangeConsumer:0 analytics:v10];
    updateHealthRecorder = v11->_updateHealthRecorder;
    v11->_updateHealthRecorder = (PGGraphUpdateHealthRecording *)v26;
  }
  return v11;
}

@end