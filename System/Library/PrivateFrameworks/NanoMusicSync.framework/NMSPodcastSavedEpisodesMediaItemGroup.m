@interface NMSPodcastSavedEpisodesMediaItemGroup
- (id)identifiersForContainerType:(unint64_t)a3;
- (id)itemList;
@end

@implementation NMSPodcastSavedEpisodesMediaItemGroup

- (id)identifiersForContainerType:(unint64_t)a3
{
  v5 = [MEMORY[0x263EFF980] array];
  if ([(NMSMediaItemGroup *)self type] == a3)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x263F11DB0]) initWithBlock:&__block_literal_global_10];
    [v5 addObject:v6];
  }
  v7 = (void *)[v5 copy];

  return v7;
}

uint64_t __69__NMSPodcastSavedEpisodesMediaItemGroup_identifiersForContainerType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setContentItemID:@"SavedEpisodes"];
}

- (id)itemList
{
  v3 = [MEMORY[0x263EFF980] array];
  v4 = objc_alloc_init(NMSPodcastSizeEstimation);
  v5 = [MEMORY[0x263F5E9D0] sharedInstance];
  v6 = [v5 mainOrPrivateContext];

  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  v14 = __49__NMSPodcastSavedEpisodesMediaItemGroup_itemList__block_invoke;
  v15 = &unk_2646349C0;
  v16 = self;
  id v17 = v6;
  v18 = v4;
  id v19 = v3;
  id v7 = v3;
  v8 = v4;
  id v9 = v6;
  [v9 performBlockAndWait:&v12];
  v10 = objc_msgSend(v7, "copy", v12, v13, v14, v15, v16);

  return v10;
}

void __49__NMSPodcastSavedEpisodesMediaItemGroup_itemList__block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v2 = +[NMSPodcastsFetchRequests legacy_fetchRequestForSavedEpisodesDownloadedOnly:](NMSPodcastsFetchRequests, "legacy_fetchRequestForSavedEpisodesDownloadedOnly:", [*(id *)(a1 + 32) downloadedItemsOnly]);
  [v2 setFetchBatchSize:20];
  v3 = *(void **)(a1 + 40);
  id v33 = 0;
  v28 = v2;
  v4 = [v3 executeFetchRequest:v2 error:&v33];
  id v5 = v33;
  if (v5)
  {
    v6 = NMLogForCategory(5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __49__NMSPodcastSavedEpisodesMediaItemGroup_itemList__block_invoke_cold_1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v27 = v5;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v13 = v4;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v30;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v29 + 1) + 8 * v17);
        id v19 = *(void **)(a1 + 48);
        v20 = objc_msgSend(*(id *)(a1 + 32), "referenceObj", v27);
        [v18 duration];
        uint64_t v22 = objc_msgSend(v19, "sizeForFeedURL:duration:feedProvidedSize:", v20, objc_msgSend(v18, "byteSize"), v21);

        v23 = *(void **)(a1 + 56);
        v24 = [NMSDownloadableItem alloc];
        v25 = [v18 uuid];
        v26 = [(NMSDownloadableItem *)v24 initWithMediaLibraryIdentifier:0 externalLibraryIdentifier:v25 size:v22 itemType:1 manuallyAdded:0];
        [v23 addObject:v26];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v15);
  }
}

void __49__NMSPodcastSavedEpisodesMediaItemGroup_itemList__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end