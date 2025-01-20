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
  return _MTPlaybackContinuousPlaybackEnabled(a1, a2);
}

+ (id)_episodeToPlayForPodcastUuid:(id)a3 playbackOrder:(int64_t)a4 excludeExplicit:(int64_t)a5 ctx:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = sub_100010B7C;
  v27 = sub_100010B8C;
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
      v12 = +[MTRecencyUtil upNextForPodcastUuid:v10 excludeExplicit:a5 ctx:v11];
      [v12 episodeUuid];
    uint64_t v13 = };
  }
  v14 = (void *)v24[5];
  v24[5] = v13;

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100010B94;
  v19[3] = &unk_10002CC88;
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

+ (id)_latestEpisodeForPodcastUuid:(id)a3 restrictToUserEpisodes:(BOOL)a4 excludeExplicit:(int64_t)a5 ctx:(id)a6
{
  return [a1 _latestOrOldestEpisodeForPodcastUuid:a3 restrictToUserEpisodes:a4 excludeExplicit:a5 latest:1 ctx:a6];
}

+ (id)_oldestEpisodeForPodcastUuid:(id)a3 restrictToUserEpisodes:(BOOL)a4 excludeExplicit:(int64_t)a5 ctx:(id)a6
{
  return [a1 _latestOrOldestEpisodeForPodcastUuid:a3 restrictToUserEpisodes:a4 excludeExplicit:a5 latest:0 ctx:a6];
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
    uint64_t v25 = sub_100010B7C;
    v26 = sub_100010B8C;
    id v27 = 0;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100010D9C;
    v15[3] = &unk_10002CF38;
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

+ (id)_uuidForEpisode:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = sub_100010B7C;
  id v15 = sub_100010B8C;
  id v16 = 0;
  v4 = [v3 managedObjectContext];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100010F98;
  v8[3] = &unk_10002CF60;
  id v10 = &v11;
  id v5 = v3;
  id v9 = v5;
  [v4 performBlockAndWait:v8];

  id v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

@end