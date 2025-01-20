@interface MTPlaybackQueueFactory
+ (BOOL)_isContinuousPlaybackEnabledForLimit:(int64_t)a3;
+ (id)_episodeToPlayForPodcastUuid:(id)a3 playbackOrder:(int64_t)a4 excludeExplicit:(int64_t)a5 ctx:(id)a6;
+ (id)_latestEpisodeForPodcastUuid:(id)a3 restrictToUserEpisodes:(BOOL)a4 excludeExplicit:(int64_t)a5 ctx:(id)a6;
+ (id)_latestOrOldestEpisodeForPodcastUuid:(id)a3 restrictToUserEpisodes:(BOOL)a4 excludeExplicit:(int64_t)a5 latest:(BOOL)a6 ctx:(id)a7;
+ (id)_oldestEpisodeForPodcastUuid:(id)a3 restrictToUserEpisodes:(BOOL)a4 excludeExplicit:(int64_t)a5 ctx:(id)a6;
+ (id)_uuidForEpisode:(id)a3;
@end

@implementation MTPlaybackQueueFactory

+ (BOOL)_isContinuousPlaybackEnabledForLimit:(int64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    return 1;
  }
  if (a3 == 1) {
    return 0;
  }
  return MEMORY[0x270F54750](a1, a2);
}

+ (id)_episodeToPlayForPodcastUuid:(id)a3 playbackOrder:(int64_t)a4 excludeExplicit:(int64_t)a5 ctx:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__0;
  v27 = __Block_byref_object_dispose__0;
  id v28 = 0;
  if (a4 == 2)
  {
    v12 = [a1 _oldestEpisodeForPodcastUuid:v10 restrictToUserEpisodes:1 excludeExplicit:a5 ctx:v11];
    uint64_t v13 = [v12 uuid];
  }
  else
  {
    if (a4 == 1)
    {
      v12 = [a1 _latestEpisodeForPodcastUuid:v10 restrictToUserEpisodes:0 excludeExplicit:a5 ctx:v11];
      [v12 uuid];
    }
    else
    {
      v12 = [MEMORY[0x263F5EA18] upNextForPodcastUuid:v10 excludeExplicit:a5 ctx:v11];
      [v12 episodeUuid];
    uint64_t v13 = };
  }
  v14 = (void *)v24[5];
  v24[5] = v13;

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __89__MTPlaybackQueueFactory__episodeToPlayForPodcastUuid_playbackOrder_excludeExplicit_ctx___block_invoke;
  v19[3] = &unk_265055788;
  id v15 = v11;
  id v20 = v15;
  id v16 = v10;
  id v21 = v16;
  v22 = &v23;
  [v15 performBlockAndWait:v19];
  id v17 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  return v17;
}

void __89__MTPlaybackQueueFactory__episodeToPlayForPodcastUuid_playbackOrder_excludeExplicit_ctx___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) podcastForUuid:*(void *)(a1 + 40)];
  if ([v4 hidden])
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
    v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;
  }
}

+ (id)_latestEpisodeForPodcastUuid:(id)a3 restrictToUserEpisodes:(BOOL)a4 excludeExplicit:(int64_t)a5 ctx:(id)a6
{
  return (id)[a1 _latestOrOldestEpisodeForPodcastUuid:a3 restrictToUserEpisodes:a4 excludeExplicit:a5 latest:1 ctx:a6];
}

+ (id)_oldestEpisodeForPodcastUuid:(id)a3 restrictToUserEpisodes:(BOOL)a4 excludeExplicit:(int64_t)a5 ctx:(id)a6
{
  return (id)[a1 _latestOrOldestEpisodeForPodcastUuid:a3 restrictToUserEpisodes:a4 excludeExplicit:a5 latest:0 ctx:a6];
}

+ (id)_latestOrOldestEpisodeForPodcastUuid:(id)a3 restrictToUserEpisodes:(BOOL)a4 excludeExplicit:(int64_t)a5 latest:(BOOL)a6 ctx:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  if ([v11 length])
  {
    uint64_t v22 = 0;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x3032000000;
    uint64_t v25 = __Block_byref_object_copy__0;
    v26 = __Block_byref_object_dispose__0;
    id v27 = 0;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __113__MTPlaybackQueueFactory__latestOrOldestEpisodeForPodcastUuid_restrictToUserEpisodes_excludeExplicit_latest_ctx___block_invoke;
    v15[3] = &unk_2650557B0;
    id v16 = v12;
    BOOL v20 = a4;
    id v17 = v11;
    v18 = &v22;
    BOOL v21 = a6;
    int64_t v19 = a5;
    [v16 performBlockAndWait:v15];
    id v13 = (id)v23[5];

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

void __113__MTPlaybackQueueFactory__latestOrOldestEpisodeForPodcastUuid_restrictToUserEpisodes_excludeExplicit_latest_ctx___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) podcastForUuid:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 56);
  id v8 = v2;
  if (*(unsigned char *)(a1 + 64))
  {
    if (*(unsigned char *)(a1 + 65)) {
      [v2 newestUserEpisodeExcludingExplicit:v3];
    }
    else {
      [v2 oldestUserEpisodeExcludingExplicit:v3];
    }
  }
  else if (*(unsigned char *)(a1 + 65))
  {
    [v2 newestEpisodeExcludingUuid:0 excludeExplicit:v3];
  }
  else
  {
    [v2 oldestEpisodeExcludingExplicit:v3];
  id v4 = };
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = v4;
  v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;
}

+ (id)_uuidForEpisode:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  id v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  id v4 = [v3 managedObjectContext];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__MTPlaybackQueueFactory__uuidForEpisode___block_invoke;
  v8[3] = &unk_2650557D8;
  id v10 = &v11;
  id v5 = v3;
  id v9 = v5;
  [v4 performBlockAndWait:v8];

  id v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

uint64_t __42__MTPlaybackQueueFactory__uuidForEpisode___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) uuid];
  return MEMORY[0x270F9A758]();
}

@end