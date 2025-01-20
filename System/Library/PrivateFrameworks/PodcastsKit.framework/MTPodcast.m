@interface MTPodcast
@end

@implementation MTPodcast

uint64_t __62__MTPodcast_DB_App__allPossibleEpisodeListSortOrderProperties__block_invoke(uint64_t a1, void *a2)
{
  return [a2 key];
}

void __42__MTPodcast_DB_App__updateCursorPosition___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F5EA18];
  v3 = [*(id *)(a1 + 32) uuid];
  v4 = [v2 upNextForPodcastUuid:v3 excludeExplicit:0 ctx:*(void *)(a1 + 40)];

  v5 = [v4 episodeUuid];
  v6 = [*(id *)(a1 + 32) nextEpisodeUuid];
  v7 = _MTLogCategoryDefault();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [*(id *)(a1 + 32) uuid];
    v9 = [v4 episodeUuid];
    [v4 modifiedDate];
    int v15 = 138543874;
    v16 = v8;
    __int16 v17 = 2114;
    v18 = v9;
    __int16 v19 = 2050;
    uint64_t v20 = v10;
    _os_log_impl(&dword_23F08F000, v7, OS_LOG_TYPE_DEFAULT, "UpNext result from update cursor position for podcast %{public}@: episodeUuid: %{public}@ at %{public}f", (uint8_t *)&v15, 0x20u);
  }
  v11 = _MTLogCategoryDefault();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [v4 episodeUuid];
    int v15 = 138543618;
    v16 = v6;
    __int16 v17 = 2114;
    v18 = v12;
    _os_log_impl(&dword_23F08F000, v11, OS_LOG_TYPE_DEFAULT, "UpNext result updating podcast nextEpisodeUuid from %{public}@ to %{public}@", (uint8_t *)&v15, 0x16u);
  }
  if (v6 != v5 && ([v6 isEqualToString:v5] & 1) == 0)
  {
    v13 = [*(id *)(a1 + 40) episodeForUuid:v5];
    v14 = [*(id *)(a1 + 40) episodeForUuid:v6];
    if ([v14 listenNowEpisode])
    {
      [v14 setListenNowEpisode:0];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    if (v13 && ([v13 listenNowEpisode] & 1) == 0)
    {
      [v13 setListenNowEpisode:1];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      [v4 modifiedDate];
      objc_msgSend(*(id *)(a1 + 32), "setModifiedDate:");
    }
  }
  if (*(unsigned char *)(a1 + 56) && *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 40) saveInCurrentBlock];
  }
}

void __53__MTPodcast_DB_App__podcastUuidForFeedUrlString_ctx___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) podcastForFeedUrl:*(void *)(a1 + 40)];
  uint64_t v2 = [v5 uuid];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __40__MTPodcast_DB_App__hasAtLeastOneSeason__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263EFF260] fetchRequestWithEntityName:*MEMORY[0x263F5EBA0]];
  uint64_t v3 = (void *)MEMORY[0x263F5E9E0];
  v4 = [*(id *)(a1 + 32) uuid];
  id v5 = [v3 predicateForEpisodesWithSeasonNumbersOnPodcastUuid:v4];
  [v2 setPredicate:v5];

  [v2 setFetchLimit:1];
  v6 = *(void **)(a1 + 40);
  id v9 = 0;
  v7 = [v6 executeFetchRequest:v2 error:&v9];
  id v8 = v9;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v7 count] != 0;

  [v8 logAndThrow:0];
}

void __34__MTPodcast_DB_App__seasonNumbers__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _fetchRequestForDistinctSeasons];
  uint64_t v3 = *(void **)(a1 + 40);
  id v9 = 0;
  v4 = [v3 executeFetchRequest:v2 error:&v9];
  id v5 = v9;
  [v5 logAndThrow:0];
  uint64_t v6 = [v4 valueForKey:*MEMORY[0x263F5EB50]];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void __43__MTPodcast_DB_App__seasonTrailerInSeason___block_invoke(uint64_t a1)
{
  id v10 = [*(id *)(a1 + 32) predicateForPodcast:*(void *)(a1 + 40)];
  uint64_t v2 = [MEMORY[0x263F5E9E0] predicateForEpisodeType:1];
  uint64_t v3 = [MEMORY[0x263F5E9E0] predicateForSeasonNumberWithNoEpisodeNumber:*(void *)(a1 + 64)];
  v4 = [v10 AND:v2];
  id v5 = [v4 AND:v3];

  uint64_t v6 = [MEMORY[0x263F5E9E0] sortDescriptorsForPubDateAscending:0];
  uint64_t v7 = [*(id *)(a1 + 48) objectsInEntity:*MEMORY[0x263F5EBA0] predicate:v5 sortDescriptors:v6 returnsObjectsAsFaults:0 limit:1];
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

void __73__MTPodcast_Library_App__setRemovePlayedDownloadsSetting_forPodcastUuid___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) podcastForUuid:*(void *)(a1 + 40)];
  char v2 = [v3 deletePlayedEpisodesResolvedValue];
  [v3 setDeletePlayedEpisodes:*(void *)(a1 + 48)];
  if ([v3 deletePlayedEpisodesResolvedValue] && (v2 & 1) == 0) {
    [v3 setShowPlacardForRemovePlayedEpisodes:0];
  }
}

void __52__MTPodcast_Library_App__countOfUnplayedRssEpisodes__block_invoke(uint64_t a1)
{
  char v2 = [MEMORY[0x263F08B88] currentThread];
  id v3 = [v2 threadDictionary];

  v4 = [v3 objectForKeyedSubscript:@"kMTUnplayedRssEpisodesRecursionCount"];
  uint64_t v5 = [v4 integerValue];

  if (v5 <= 0)
  {
    uint64_t v7 = [NSNumber numberWithInteger:v5 + 1];
    [v3 setObject:v7 forKeyedSubscript:@"kMTUnplayedRssEpisodesRecursionCount"];

    uint64_t v8 = [MEMORY[0x263F5E9E0] predicateForRSSEpisodes];
    id v9 = (void *)MEMORY[0x263F5E9E0];
    id v10 = [*(id *)(a1 + 32) uuid];
    v11 = [v9 predicateForEpisodesOnPodcastUuid:v10 deletePlayedEpisodes:1];
    v12 = [v8 AND:v11];

    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 40) countOfObjectsInEntity:*MEMORY[0x263F5EBA0] predicate:v12];
  }
  else
  {
    uint64_t v6 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_23F08F000, v6, OS_LOG_TYPE_FAULT, "Hit recursion guard for -[MTPodcast countOfUnplayedRssEpisodes]. Short circuiting.", v13, 2u);
    }
  }
  [v3 setObject:&unk_26F2D29C8 forKeyedSubscript:@"kMTUnplayedRssEpisodesRecursionCount"];
}

@end