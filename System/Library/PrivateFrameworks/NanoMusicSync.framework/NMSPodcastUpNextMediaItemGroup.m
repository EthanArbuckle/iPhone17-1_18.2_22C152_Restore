@interface NMSPodcastUpNextMediaItemGroup
- (id)_upNextEpisodes;
- (id)_upNextFeedURLs;
- (id)identifiersForContainerType:(unint64_t)a3;
- (id)itemList;
- (void)_upNextEpisodes;
@end

@implementation NMSPodcastUpNextMediaItemGroup

- (id)identifiersForContainerType:(unint64_t)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v5 = [MEMORY[0x263EFF980] array];
  if ([(NMSMediaItemGroup *)self type] == a3)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v6 = [(NMSPodcastUpNextMediaItemGroup *)self _upNextFeedURLs];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          id v12 = objc_alloc(MEMORY[0x263F11DB0]);
          v16[0] = MEMORY[0x263EF8330];
          v16[1] = 3221225472;
          v16[2] = __62__NMSPodcastUpNextMediaItemGroup_identifiersForContainerType___block_invoke;
          v16[3] = &unk_264633DA0;
          v16[4] = v11;
          v13 = (void *)[v12 initWithBlock:v16];
          [v5 addObject:v13];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }
  }
  v14 = (void *)[v5 copy];

  return v14;
}

uint64_t __62__NMSPodcastUpNextMediaItemGroup_identifiersForContainerType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setContentItemID:*(void *)(a1 + 32)];
}

- (id)itemList
{
  v3 = [MEMORY[0x263EFF980] array];
  v4 = objc_alloc_init(NMSPodcastSizeEstimation);
  v5 = [MEMORY[0x263F5E9D0] sharedInstance];
  v6 = [v5 mainOrPrivateContext];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __42__NMSPodcastUpNextMediaItemGroup_itemList__block_invoke;
  v11[3] = &unk_2646343D8;
  v11[4] = self;
  id v12 = v4;
  id v13 = v3;
  id v7 = v3;
  uint64_t v8 = v4;
  [v6 performBlockAndWait:v11];
  uint64_t v9 = (void *)[v7 copy];

  return v9;
}

void __42__NMSPodcastUpNextMediaItemGroup_itemList__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "_upNextEpisodes", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v8 = *(void **)(a1 + 40);
        uint64_t v9 = [v7 podcast];
        v10 = [v9 feedURL];
        [v7 duration];
        uint64_t v12 = objc_msgSend(v8, "sizeForFeedURL:duration:feedProvidedSize:", v10, objc_msgSend(v7, "byteSize"), v11);

        id v13 = *(void **)(a1 + 48);
        v14 = [NMSDownloadableItem alloc];
        v15 = [v7 uuid];
        v16 = [(NMSDownloadableItem *)v14 initWithMediaLibraryIdentifier:0 externalLibraryIdentifier:v15 size:v12 itemType:1 manuallyAdded:0];
        [v13 addObject:v16];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }
}

- (id)_upNextEpisodes
{
  upNextEpisodes = self->_upNextEpisodes;
  if (!upNextEpisodes)
  {
    uint64_t v4 = +[NMSPodcastsFetchRequests legacy_fetchRequestForUpNextEpisodesDownloadedOnly:[(NMSMediaItemGroup *)self downloadedItemsOnly]];
    [v4 setFetchBatchSize:20];
    uint64_t v21 = 0;
    v22[0] = &v21;
    v22[1] = 0x3032000000;
    v22[2] = __Block_byref_object_copy__7;
    v22[3] = __Block_byref_object_dispose__7;
    id v23 = 0;
    uint64_t v5 = [MEMORY[0x263F5E9D0] sharedInstance];
    v6 = [v5 mainOrPrivateContext];

    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __49__NMSPodcastUpNextMediaItemGroup__upNextEpisodes__block_invoke;
    v17[3] = &unk_264634978;
    v17[4] = self;
    id v7 = v6;
    id v18 = v7;
    id v8 = v4;
    id v19 = v8;
    long long v20 = &v21;
    [v7 performBlockAndWait:v17];
    if (*(void *)(v22[0] + 40))
    {
      uint64_t v9 = NMLogForCategory(5);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        [(NMSPodcastUpNextMediaItemGroup *)(uint64_t)v22 _upNextEpisodes];
      }
    }
    _Block_object_dispose(&v21, 8);

    upNextEpisodes = self->_upNextEpisodes;
  }

  return upNextEpisodes;
}

void __49__NMSPodcastUpNextMediaItemGroup__upNextEpisodes__block_invoke(void *a1)
{
  v2 = (void *)a1[5];
  uint64_t v3 = a1[6];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 executeFetchRequest:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = a1[4];
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)_upNextFeedURLs
{
  upNextFeedURLs = self->_upNextFeedURLs;
  if (!upNextFeedURLs)
  {
    uint64_t v4 = [MEMORY[0x263F5E9D0] sharedInstance];
    uint64_t v5 = [v4 mainOrPrivateContext];

    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __49__NMSPodcastUpNextMediaItemGroup__upNextFeedURLs__block_invoke;
    v7[3] = &unk_264633B20;
    v7[4] = self;
    [v5 performBlockAndWait:v7];

    upNextFeedURLs = self->_upNextFeedURLs;
  }

  return upNextFeedURLs;
}

void __49__NMSPodcastUpNextMediaItemGroup__upNextFeedURLs__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) _upNextEpisodes];
  v2 = [NSString stringWithFormat:@"%@.%@", *MEMORY[0x263F5EB38], *MEMORY[0x263F5EC98]];
  uint64_t v3 = [v6 valueForKeyPath:v2];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upNextFeedURLs, 0);

  objc_storeStrong((id *)&self->_upNextEpisodes, 0);
}

- (void)_upNextEpisodes
{
}

@end