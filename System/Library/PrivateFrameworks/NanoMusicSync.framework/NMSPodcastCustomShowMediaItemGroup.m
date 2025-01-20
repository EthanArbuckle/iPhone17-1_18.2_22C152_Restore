@interface NMSPodcastCustomShowMediaItemGroup
- (id)identifiersForContainerType:(unint64_t)a3;
- (id)itemList;
@end

@implementation NMSPodcastCustomShowMediaItemGroup

- (id)identifiersForContainerType:(unint64_t)a3
{
  v5 = [MEMORY[0x263EFF980] array];
  if ([(NMSMediaItemGroup *)self type] == a3)
  {
    id v6 = objc_alloc(MEMORY[0x263F11DB0]);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __66__NMSPodcastCustomShowMediaItemGroup_identifiersForContainerType___block_invoke;
    v10[3] = &unk_264633DA0;
    v10[4] = self;
    v7 = (void *)[v6 initWithBlock:v10];
    [v5 addObject:v7];
  }
  v8 = (void *)[v5 copy];

  return v8;
}

void __66__NMSPodcastCustomShowMediaItemGroup_identifiersForContainerType___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 referenceObj];
  [v3 setContentItemID:v4];
}

- (id)itemList
{
  id v3 = [MEMORY[0x263EFF980] array];
  id v4 = objc_alloc_init(NMSPodcastSizeEstimation);
  v5 = [MEMORY[0x263F5E9D0] sharedInstance];
  id v6 = [v5 mainOrPrivateContext];

  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  v14 = __46__NMSPodcastCustomShowMediaItemGroup_itemList__block_invoke;
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

void __46__NMSPodcastCustomShowMediaItemGroup_itemList__block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1 + 32;
  id v3 = [*(id *)(a1 + 32) referenceObj];
  id v4 = +[NMSPodcastsFetchRequests legacy_fetchRequestForEpisodesWithFeedURL:downloadedOnly:ctx:](NMSPodcastsFetchRequests, "legacy_fetchRequestForEpisodesWithFeedURL:downloadedOnly:ctx:", v3, [*(id *)v2 downloadedItemsOnly], *(void *)(v2 + 8));

  [v4 setFetchBatchSize:20];
  v5 = *(void **)(v2 + 8);
  id v29 = 0;
  v24 = v4;
  id v6 = [v5 executeFetchRequest:v4 error:&v29];
  id v7 = v29;
  if (v7)
  {
    v8 = NMLogForCategory(5);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __46__NMSPodcastCustomShowMediaItemGroup_itemList__block_invoke_cold_1((id *)v2);
    }
  }
  v23 = v7;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v25 + 1) + 8 * v13);
        v15 = *(void **)(a1 + 48);
        v16 = objc_msgSend(*(id *)(a1 + 32), "referenceObj", v23);
        [v14 duration];
        uint64_t v18 = objc_msgSend(v15, "sizeForFeedURL:duration:feedProvidedSize:", v16, objc_msgSend(v14, "byteSize"), v17);

        id v19 = *(void **)(a1 + 56);
        v20 = [NMSDownloadableItem alloc];
        v21 = [v14 uuid];
        v22 = [(NMSDownloadableItem *)v20 initWithMediaLibraryIdentifier:0 externalLibraryIdentifier:v21 size:v18 itemType:1 manuallyAdded:0];
        [v19 addObject:v22];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v11);
  }
}

void __46__NMSPodcastCustomShowMediaItemGroup_itemList__block_invoke_cold_1(id *a1)
{
  v1 = [*a1 referenceObj];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0(&dword_2228FD000, v2, v3, "Failed to fetch show episodes itemList for show %@ - %@", v4, v5, v6, v7, v8);
}

@end