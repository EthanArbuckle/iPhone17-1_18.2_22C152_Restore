@interface NMSPodcastStationMediaItemGroup
- (id)identifiersForContainerType:(unint64_t)a3;
- (id)itemList;
@end

@implementation NMSPodcastStationMediaItemGroup

- (id)identifiersForContainerType:(unint64_t)a3
{
  v5 = [MEMORY[0x263EFF980] array];
  if ([(NMSMediaItemGroup *)self type] == a3)
  {
    id v6 = objc_alloc(MEMORY[0x263F11DB0]);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __63__NMSPodcastStationMediaItemGroup_identifiersForContainerType___block_invoke;
    v10[3] = &unk_264633DA0;
    v10[4] = self;
    v7 = (void *)[v6 initWithBlock:v10];
    [v5 addObject:v7];
  }
  v8 = (void *)[v5 copy];

  return v8;
}

void __63__NMSPodcastStationMediaItemGroup_identifiersForContainerType___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 referenceObj];
  [v3 setContentItemID:v4];
}

- (id)itemList
{
  v29[2] = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF980] array];
  id v4 = objc_alloc_init(NMSPodcastSizeEstimation);
  v5 = [(NMSMediaItemGroup *)self referenceObj];
  id v6 = +[NMSPodcastsFetchRequests legacy_fetchRequestForStationWithUUID:v5];

  uint64_t v7 = *MEMORY[0x263F5EB38];
  v28[0] = *MEMORY[0x263F5EC10];
  v28[1] = v7;
  v29[0] = v28[0];
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:2];
  v9 = [v8 componentsJoinedByString:@"."];
  v29[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:2];
  [v6 setRelationshipKeyPathsForPrefetching:v10];

  [v6 setFetchBatchSize:20];
  v11 = [MEMORY[0x263F5E9D0] sharedInstance];
  v12 = [v11 mainOrPrivateContext];

  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  v21 = __43__NMSPodcastStationMediaItemGroup_itemList__block_invoke;
  v22 = &unk_2646349E8;
  id v23 = v12;
  id v24 = v6;
  v25 = self;
  v26 = v4;
  id v27 = v3;
  id v13 = v3;
  v14 = v4;
  id v15 = v6;
  id v16 = v12;
  [v16 performBlockAndWait:&v19];
  v17 = objc_msgSend(v13, "copy", v19, v20, v21, v22);

  return v17;
}

void __43__NMSPodcastStationMediaItemGroup_itemList__block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v28 = 0;
  id v4 = [v2 executeFetchRequest:v3 error:&v28];
  id v5 = v28;
  id v6 = [v4 firstObject];

  if (v5)
  {
    uint64_t v7 = NMLogForCategory(5);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __43__NMSPodcastStationMediaItemGroup_itemList__block_invoke_cold_1(a1);
    }
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v8 = objc_msgSend(v6, "episodes", v6);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ((![*(id *)(a1 + 48) downloadedItemsOnly]
           || [v13 isDownloaded])
          && ([v13 isHidden] & 1) == 0
          && [v13 isEntitled])
        {
          v14 = *(void **)(a1 + 56);
          id v15 = [v13 podcast];
          id v16 = [v15 feedURL];
          [v13 duration];
          uint64_t v18 = objc_msgSend(v14, "sizeForFeedURL:duration:feedProvidedSize:", v16, objc_msgSend(v13, "byteSize"), v17);

          uint64_t v19 = *(void **)(a1 + 64);
          uint64_t v20 = [NMSDownloadableItem alloc];
          v21 = [v13 uuid];
          v22 = [(NMSDownloadableItem *)v20 initWithMediaLibraryIdentifier:0 externalLibraryIdentifier:v21 size:v18 itemType:1 manuallyAdded:0];
          [v19 addObject:v22];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v10);
  }
}

void __43__NMSPodcastStationMediaItemGroup_itemList__block_invoke_cold_1(uint64_t a1)
{
  v1 = [*(id *)(a1 + 48) referenceObj];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0(&dword_2228FD000, v2, v3, "Failed to fetch station itemList for station %@ - %@", v4, v5, v6, v7, v8);
}

@end