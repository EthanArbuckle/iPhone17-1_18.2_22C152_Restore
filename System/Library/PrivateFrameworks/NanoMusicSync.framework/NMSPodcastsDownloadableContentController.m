@interface NMSPodcastsDownloadableContentController
@end

@implementation NMSPodcastsDownloadableContentController

void __55__NMSPodcastsDownloadableContentController_Legacy_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _processLatestPersistenHistoryChanges];
}

void __55__NMSPodcastsDownloadableContentController_Legacy_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained lastMergedToken];

    id WeakRetained = v3;
    if (!v2)
    {
      [v3 _resetPersistentHistoryTokenAndNotifyObservers];
      id WeakRetained = v3;
    }
  }
}

void __63__NMSPodcastsDownloadableContentController_Legacy_setDelegate___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    objc_storeWeak(WeakRetained + 5, *(id *)(a1 + 32));
    id WeakRetained = v3;
  }
}

uint64_t __59__NMSPodcastsDownloadableContentController_Legacy_delegate__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));

  return MEMORY[0x270F9A758]();
}

void __75__NMSPodcastsDownloadableContentController_Legacy_extensionAccessDidChange__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained lastMergedToken];

    if (v2) {
      [v3 _notifyDelegateContentDidChange];
    }
    else {
      [v3 _resetPersistentHistoryTokenAndNotifyObservers];
    }
    id WeakRetained = v3;
  }
}

void __82__NMSPodcastsDownloadableContentController_Legacy__notifyDelegateContentDidChange__block_invoke(uint64_t a1)
{
  v2 = _MTLogCategoryDatabase();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2228FD000, v2, OS_LOG_TYPE_DEFAULT, "NMSPodcastsDownloadableContentObserver scheduling delegate notification for 8s from now.", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _notifyDelegateContentDidChangeImmediately];
}

void __88__NMSPodcastsDownloadableContentController_Legacy__processLatestPersistenHistoryChanges__block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 executeRequest:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __88__NMSPodcastsDownloadableContentController_Legacy__processLatestPersistenHistoryChanges__block_invoke_21(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 executeRequest:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __88__NMSPodcastsDownloadableContentController_Legacy__processLatestPersistenHistoryChanges__block_invoke_22(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v2 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) result];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v17 + 1) + 8 * v6);
        v8 = (void *)MEMORY[0x223CA12B0]();
        if ([*(id *)(a1 + 32) _shouldMergeHistoryTransaction:v7])
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
          v9 = _MTLogCategoryDatabase();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v16 = 0;
            _os_log_impl(&dword_2228FD000, v9, OS_LOG_TYPE_INFO, "NMSPodcastsDownloadableContentObserver merging changes", v16, 2u);
          }

          v10 = [MEMORY[0x263F5E9D0] sharedInstance];
          v11 = [v10 coreDataContainer];
          v12 = [v7 objectIDNotification];
          [v11 mergeFromContextDidSaveNotification:v12];
        }
        uint64_t v13 = [v7 token];
        uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
        v15 = *(void **)(v14 + 40);
        *(void *)(v14 + 40) = v13;

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }
}

uint64_t __105__NMSPodcastsDownloadableContentController_Legacy__handlePodcastsPinningSelectionsDidChangeNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDelegateContentDidChangeImmediately];
}

void __97__NMSPodcastsDownloadableContentController_Legacy__resetPersistentHistoryTokenAndNotifyObservers__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) persistentStoreCoordinator];
  uint64_t v2 = [v5 currentPersistentHistoryTokenFromStores:0];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

@end