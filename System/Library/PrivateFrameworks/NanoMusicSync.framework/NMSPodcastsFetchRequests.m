@interface NMSPodcastsFetchRequests
+ (id)_createFetchRequestForEpisodeDownloadableItem;
+ (id)_predicateForDownloadableWatchEpisodesWithDownloadedOnly:(BOOL)a3 unplayedOnly:(BOOL)a4;
+ (id)fetchRequestForFeedURL:(id)a3 downloadSettings:(id)a4 downloadedOnly:(BOOL)a5 ctx:(id)a6;
+ (id)fetchRequestForSavedEpisodesDownloadSettings:(id)a3 downloadedOnly:(BOOL)a4;
+ (id)fetchRequestForStationUUID:(id)a3 downloadSettings:(id)a4 downloadedOnly:(BOOL)a5;
+ (id)fetchRequestForUpNextDownloadSettings:(id)a3 downloadedOnly:(BOOL)a4;
+ (id)legacy_fetchRequestForEpisodesWithFeedURL:(id)a3 downloadedOnly:(BOOL)a4 ctx:(id)a5;
+ (id)legacy_fetchRequestForSavedEpisodesDownloadedOnly:(BOOL)a3;
+ (id)legacy_fetchRequestForStationWithUUID:(id)a3;
+ (id)legacy_fetchRequestForUpNextEpisodesDownloadedOnly:(BOOL)a3;
@end

@implementation NMSPodcastsFetchRequests

+ (id)fetchRequestForUpNextDownloadSettings:(id)a3 downloadedOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [a1 _createFetchRequestForEpisodeDownloadableItem];
  v8 = [MEMORY[0x263F5E9E0] predicateForListenNow];
  v9 = [a1 _predicateForDownloadableWatchEpisodesWithDownloadedOnly:v4 unplayedOnly:0];
  v10 = [v8 AND:v9];
  [v7 setPredicate:v10];

  v11 = [MEMORY[0x263F5E9E0] sortDescriptorsForListenNow];
  [v7 setSortDescriptors:v11];

  uint64_t v12 = [v6 numberOfEpisodes];
  [v7 setFetchLimit:v12];

  return v7;
}

+ (id)fetchRequestForStationUUID:(id)a3 downloadSettings:(id)a4 downloadedOnly:(BOOL)a5
{
  BOOL v5 = a5;
  v19[1] = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a3;
  v10 = [a1 _createFetchRequestForEpisodeDownloadableItem];
  uint64_t v11 = *MEMORY[0x263F5EB30];
  uint64_t v12 = [MEMORY[0x263F08A98] predicateWithFormat:@"%@ IN %K.%K", v9, *MEMORY[0x263F5EB30], *MEMORY[0x263F5EC40]];

  v13 = [a1 _predicateForDownloadableWatchEpisodesWithDownloadedOnly:v5 unplayedOnly:1];
  v14 = [v12 AND:v13];
  [v10 setPredicate:v14];

  v15 = [MEMORY[0x263F08B30] sortDescriptorWithKey:v11 ascending:1];
  v19[0] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
  [v10 setSortDescriptors:v16];

  uint64_t v17 = [v8 numberOfEpisodes];
  [v10 setFetchLimit:v17];
  [v10 setIncludesPendingChanges:0];

  return v10;
}

+ (id)fetchRequestForSavedEpisodesDownloadSettings:(id)a3 downloadedOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [a1 _createFetchRequestForEpisodeDownloadableItem];
  id v8 = [MEMORY[0x263F5E9E0] predicateForBookmarkedEpisodes];
  id v9 = [a1 _predicateForDownloadableWatchEpisodesWithDownloadedOnly:v4 unplayedOnly:0];
  v10 = [v8 AND:v9];
  [v7 setPredicate:v10];

  uint64_t v11 = [MEMORY[0x263F5E9E0] sortDescriptorsForLastBookmarkedDateAscending:0];
  [v7 setSortDescriptors:v11];

  uint64_t v12 = [v6 numberOfEpisodes];
  [v7 setFetchLimit:v12];

  return v7;
}

+ (id)fetchRequestForFeedURL:(id)a3 downloadSettings:(id)a4 downloadedOnly:(BOOL)a5 ctx:(id)a6
{
  uint64_t v8 = a5;
  v48[2] = *MEMORY[0x263EF8340];
  id v35 = a3;
  id v34 = a4;
  id v11 = a6;
  uint64_t v12 = [MEMORY[0x263EFF260] fetchRequestWithEntityName:*MEMORY[0x263F5EBB0]];
  v13 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K = %@", *MEMORY[0x263F5EC98], v35];
  [v12 setPredicate:v13];

  uint64_t v14 = *MEMORY[0x263F5ECA0];
  v48[0] = *MEMORY[0x263F5ED38];
  v48[1] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:2];
  [v12 setPropertiesToFetch:v15];

  [v12 setFetchLimit:1];
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__4;
  v44 = __Block_byref_object_dispose__4;
  id v45 = 0;
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __87__NMSPodcastsFetchRequests_fetchRequestForFeedURL_downloadSettings_downloadedOnly_ctx___block_invoke;
  v36[3] = &unk_264634360;
  v39 = &v40;
  id v16 = v11;
  id v37 = v16;
  id v17 = v12;
  id v38 = v17;
  [v16 performBlockAndWait:v36];
  v18 = [a1 _createFetchRequestForEpisodeDownloadableItem];
  v19 = [(id)v41[5] uuid];
  if (v19)
  {
    v20 = (void *)MEMORY[0x263F5E9E0];
    v21 = [(id)v41[5] uuid];
    id v6 = [v20 predicateForAllEpisodesOnPodcastUuid:v21];
    uint64_t v8 = [a1 _predicateForDownloadableWatchEpisodesWithDownloadedOnly:v8 unplayedOnly:1];
    a1 = [v6 AND:v8];
    v15 = [MEMORY[0x263F5E9E0] predicateForPodcastIsSubscribed:1];
    v22 = [a1 AND:v15];
  }
  else
  {
    v22 = [MEMORY[0x263F08A98] falsePredicate];
    v21 = v22;
  }
  [v18 setPredicate:v22];
  if (v19)
  {
  }
  v23 = (void *)MEMORY[0x263EFF980];
  v24 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F5EB08] ascending:0];
  v25 = [v23 arrayWithObject:v24];

  int v26 = [(id)v41[5] sortAscending];
  uint64_t v27 = *MEMORY[0x263F5EB48];
  if (v26)
  {
    v28 = [MEMORY[0x263F08B30] sortDescriptorWithKey:v27 ascending:1];
    v47[0] = v28;
    v29 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F5EAC0] ascending:1];
    v47[1] = v29;
    v30 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F5EB00] ascending:0];
    v47[2] = v30;
    v31 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F5EB60] ascending:1 selector:sel_localizedStandardCompare_];
    v47[3] = v31;
    [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:4];
  }
  else
  {
    v28 = [MEMORY[0x263F08B30] sortDescriptorWithKey:v27 ascending:0];
    v46[0] = v28;
    v29 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F5EAC0] ascending:0];
    v46[1] = v29;
    v30 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F5EB00] ascending:1];
    v46[2] = v30;
    v31 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F5EB60] ascending:1 selector:sel_localizedStandardCompare_];
    v46[3] = v31;
    [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:4];
  v32 = };
  [v25 addObjectsFromArray:v32];

  [v18 setSortDescriptors:v25];
  objc_msgSend(v18, "setFetchLimit:", objc_msgSend(v34, "numberOfEpisodes"));

  _Block_object_dispose(&v40, 8);

  return v18;
}

void __87__NMSPodcastsFetchRequests_fetchRequestForFeedURL_downloadSettings_downloadedOnly_ctx___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) executeFetchRequest:*(void *)(a1 + 40)];
  uint64_t v2 = [v5 firstObject];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

+ (id)_predicateForDownloadableWatchEpisodesWithDownloadedOnly:(BOOL)a3 unplayedOnly:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = [MEMORY[0x263F5E9E0] predicateForAudio:1];
  v7 = [MEMORY[0x263F5E9E0] predicateForEntitledEpisodes];
  uint64_t v8 = [v6 AND:v7];

  if (v5)
  {
    id v9 = [MEMORY[0x263F5E9E0] predicateForDownloaded:1 excludeHidden:1];
    uint64_t v10 = [v8 AND:v9];

    uint64_t v8 = (void *)v10;
  }
  if (v4)
  {
    id v11 = [MEMORY[0x263F5E9E0] predicateForPlayed:0];
    uint64_t v12 = [v8 AND:v11];

    uint64_t v8 = (void *)v12;
  }

  return v8;
}

+ (id)_createFetchRequestForEpisodeDownloadableItem
{
  uint64_t v2 = [MEMORY[0x263EFF260] fetchRequestWithEntityName:*MEMORY[0x263F5EBA0]];
  uint64_t v3 = [MEMORY[0x263F5E9E0] propertiesToFetchDownloadInfo];
  [v2 setPropertiesToFetch:v3];

  BOOL v4 = [MEMORY[0x263F5E9E0] relationshipKeyPathsForPrefetchingDownloadInfo];
  [v2 setRelationshipKeyPathsForPrefetching:v4];

  [v2 setFetchBatchSize:20];

  return v2;
}

+ (id)legacy_fetchRequestForUpNextEpisodesDownloadedOnly:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [a1 _createFetchRequestForEpisodeDownloadableItem];
  id v6 = [MEMORY[0x263F5E9E0] predicateForListenNow];
  v7 = [a1 _predicateForDownloadableWatchEpisodesWithDownloadedOnly:v3 unplayedOnly:1];
  uint64_t v8 = [v6 AND:v7];
  [v5 setPredicate:v8];

  id v9 = [MEMORY[0x263F5E9E0] sortDescriptorsForListenNow];
  [v5 setSortDescriptors:v9];

  [v5 setFetchLimit:10];

  return v5;
}

+ (id)legacy_fetchRequestForSavedEpisodesDownloadedOnly:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [a1 _createFetchRequestForEpisodeDownloadableItem];
  id v6 = [MEMORY[0x263F5E9E0] predicateForBookmarkedEpisodes];
  v7 = [a1 _predicateForDownloadableWatchEpisodesWithDownloadedOnly:v3 unplayedOnly:0];
  uint64_t v8 = [v6 AND:v7];
  [v5 setPredicate:v8];

  id v9 = [MEMORY[0x263F5E9E0] sortDescriptorsForPubDateAscending:0];
  [v5 setSortDescriptors:v9];

  return v5;
}

+ (id)legacy_fetchRequestForStationWithUUID:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x263EFF260];
  uint64_t v4 = *MEMORY[0x263F5EBA8];
  id v5 = a3;
  id v6 = [v3 fetchRequestWithEntityName:v4];
  v7 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K = %@", *MEMORY[0x263F5EC40], v5];

  [v6 setPredicate:v7];
  [v6 setFetchLimit:1];

  return v6;
}

+ (id)legacy_fetchRequestForEpisodesWithFeedURL:(id)a3 downloadedOnly:(BOOL)a4 ctx:(id)a5
{
  v29[2] = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = (void *)MEMORY[0x263EFF260];
  uint64_t v10 = *MEMORY[0x263F5EBB0];
  id v11 = a3;
  uint64_t v12 = [v9 fetchRequestWithEntityName:v10];
  v13 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K = %@", *MEMORY[0x263F5EC98], v11];

  [v12 setPredicate:v13];
  uint64_t v14 = *MEMORY[0x263F5ECA0];
  v29[0] = *MEMORY[0x263F5ED38];
  v29[1] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:2];
  [v12 setPropertiesToFetch:v15];

  [v12 setFetchLimit:1];
  id v16 = [a1 _createFetchRequestForEpisodeDownloadableItem];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __89__NMSPodcastsFetchRequests_legacy_fetchRequestForEpisodesWithFeedURL_downloadedOnly_ctx___block_invoke;
  v23[3] = &unk_264634540;
  id v24 = v8;
  id v25 = v12;
  id v17 = v16;
  id v26 = v17;
  id v27 = a1;
  BOOL v28 = a4;
  id v18 = v12;
  id v19 = v8;
  [v19 performBlockAndWait:v23];
  v20 = v26;
  id v21 = v17;

  return v21;
}

void __89__NMSPodcastsFetchRequests_legacy_fetchRequestForEpisodesWithFeedURL_downloadedOnly_ctx___block_invoke(uint64_t a1)
{
  v27[4] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v25 = 0;
  uint64_t v4 = [v2 executeFetchRequest:v3 error:&v25];
  id v5 = v25;
  id v6 = [v4 firstObject];

  if (!v5)
  {
    v7 = [MEMORY[0x263F5E9E0] predicateForUserSetTopLevelEpisodes];
    id v8 = (void *)MEMORY[0x263F5E9E0];
    id v9 = [v6 uuid];
    uint64_t v10 = [v8 predicateForAllEpisodesOnPodcastUuid:v9];
    id v11 = [v7 AND:v10];
    [*(id *)(a1 + 56) _predicateForDownloadableWatchEpisodesWithDownloadedOnly:*(unsigned __int8 *)(a1 + 64) unplayedOnly:1];
    v13 = uint64_t v12 = v6;
    uint64_t v14 = [v11 AND:v13];
    v15 = [MEMORY[0x263F5E9E0] predicateForPodcastIsSubscribed:1];
    id v16 = [v14 AND:v15];
    [*(id *)(a1 + 48) setPredicate:v16];

    id v6 = v12;
    char v17 = [v12 sortAscending];
    uint64_t v18 = *MEMORY[0x263F5EB48];
    if (v17)
    {
      id v19 = [MEMORY[0x263F08B30] sortDescriptorWithKey:v18 ascending:1];
      v27[0] = v19;
      v20 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F5EAC0] ascending:1];
      v27[1] = v20;
      id v21 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F5EB00] ascending:0];
      v27[2] = v21;
      v22 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F5EB60] ascending:1 selector:sel_localizedStandardCompare_];
      v27[3] = v22;
      v23 = v27;
    }
    else
    {
      id v19 = [MEMORY[0x263F08B30] sortDescriptorWithKey:v18 ascending:0];
      v26[0] = v19;
      v20 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F5EAC0] ascending:0];
      v26[1] = v20;
      id v21 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F5EB00] ascending:1];
      v26[2] = v21;
      v22 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F5EB60] ascending:1 selector:sel_localizedStandardCompare_];
      v26[3] = v22;
      v23 = v26;
    }
    id v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:4];
    [*(id *)(a1 + 48) setSortDescriptors:v24];

    id v5 = 0;
  }
}

@end