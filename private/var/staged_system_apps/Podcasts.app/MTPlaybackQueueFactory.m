@interface MTPlaybackQueueFactory
+ (BOOL)_isContinuousPlaybackEnabledForLimit:(int64_t)a3;
+ (id)_episodeToPlayForPodcastUuid:(id)a3 playbackOrder:(int64_t)a4 excludeExplicit:(int64_t)a5 ctx:(id)a6;
+ (id)_latestEpisodeForPodcastUuid:(id)a3 restrictToUserEpisodes:(BOOL)a4 excludeExplicit:(int64_t)a5 ctx:(id)a6;
+ (id)_latestOrOldestEpisodeForPodcastUuid:(id)a3 restrictToUserEpisodes:(BOOL)a4 excludeExplicit:(int64_t)a5 latest:(BOOL)a6 ctx:(id)a7;
+ (id)_manifestForPlayMyLatestPodcasts;
+ (id)_manifestForPlayMyOldestPodcasts;
+ (id)_manifestForPlayMyPodcasts;
+ (id)_oldestEpisodeForPodcastUuid:(id)a3 restrictToUserEpisodes:(BOOL)a4 excludeExplicit:(int64_t)a5 ctx:(id)a6;
+ (id)_uuidForEpisode:(id)a3;
+ (id)playEpisodeUuid:(id)a3;
+ (id)playEpisodeUuid:(id)a3 context:(int64_t)a4;
+ (id)playEpisodeUuid:(id)a3 context:(int64_t)a4 limit:(int64_t)a5;
+ (id)playEpisodeUuid:(id)a3 context:(int64_t)a4 sortType:(int64_t)a5 limit:(int64_t)a6 pubDateLimit:(int64_t)a7;
+ (id)playEpisodeUuid:(id)a3 limit:(int64_t)a4;
+ (id)playListenNow;
+ (id)playMyPodcastsWithOrder:(int64_t)a3;
+ (id)playPodcastUuid:(id)a3;
+ (id)playPodcastUuid:(id)a3 limit:(int64_t)a4;
+ (id)playPodcastUuid:(id)a3 order:(int64_t)a4;
+ (id)playPodcastUuid:(id)a3 order:(int64_t)a4 limit:(int64_t)a5;
+ (id)playPodcastUuid:(id)a3 order:(int64_t)a4 limit:(int64_t)a5 error:(int64_t *)a6;
+ (id)playStationUuid:(id)a3;
+ (id)playStationUuid:(id)a3 episodeUuid:(id)a4;
+ (id)playStationUuid:(id)a3 episodeUuid:(id)a4 limit:(int64_t)a5;
+ (id)playStationUuid:(id)a3 limit:(int64_t)a4;
@end

@implementation MTPlaybackQueueFactory

+ (id)playListenNow
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = sub_100057188;
  v18 = sub_100057380;
  id v19 = 0;
  v3 = +[MTEpisode sortDescriptorsForListenNow];
  v4 = +[MTDB sharedInstance];
  v5 = [v4 mainOrPrivateContext];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10014EA20;
  v10[3] = &unk_10054DA00;
  id v6 = v5;
  id v11 = v6;
  id v7 = v3;
  id v12 = v7;
  v13 = &v14;
  [v6 performBlockAndWait:v10];
  v8 = [a1 playEpisodeUuid:v15[5]];

  _Block_object_dispose(&v14, 8);

  return v8;
}

+ (id)playMyPodcastsWithOrder:(int64_t)a3
{
  if (a3 == 2)
  {
    v3 = [a1 _manifestForPlayMyOldestPodcasts];
  }
  else
  {
    if (a3 == 1) {
      [a1 _manifestForPlayMyLatestPodcasts];
    }
    else {
    v3 = [a1 _manifestForPlayMyPodcasts];
    }
  }

  return v3;
}

+ (id)playPodcastUuid:(id)a3
{
  return _[a1 playPodcastUuid:a3 order:0];
}

+ (id)playPodcastUuid:(id)a3 order:(int64_t)a4
{
  return _[a1 playPodcastUuid:a3 order:a4 limit:0];
}

+ (id)playPodcastUuid:(id)a3 limit:(int64_t)a4
{
  return _[a1 playPodcastUuid:a3 order:0 limit:a4];
}

+ (id)playPodcastUuid:(id)a3 order:(int64_t)a4 limit:(int64_t)a5 error:(int64_t *)a6
{
  id v10 = a3;
  id v11 = +[MTDB sharedInstance];
  id v12 = [v11 mainOrPrivateContext];

  uint64_t v13 = [a1 _episodeToPlayForPodcastUuid:v10 playbackOrder:a4 excludeExplicit:0 ctx:v12];
  uint64_t v14 = (void *)v13;
  if (!a4 && !v13)
  {
    uint64_t v14 = [a1 _episodeToPlayForPodcastUuid:v10 playbackOrder:1 excludeExplicit:0 ctx:v12];
  }
  if (v14)
  {
    a6 = [a1 playEpisodeUuid:v14 limit:a5];
    goto LABEL_16;
  }
  if (a6)
  {
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2020000000;
    char v27 = 0;
    if ([v10 length])
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10014ED8C;
      v20[3] = &unk_10054DA00;
      id v15 = v12;
      id v21 = v15;
      id v16 = v10;
      id v22 = v16;
      v23 = &v24;
      [v15 performBlockAndWait:v20];

      if (!*((unsigned char *)v25 + 24))
      {
        if ((+[PFRestrictionsController isExplicitContentAllowed] & 1) == 0)
        {
          v17 = [a1 _episodeToPlayForPodcastUuid:v16 playbackOrder:a4 excludeExplicit:2 ctx:v15];
          if (v17)
          {
            *a6 = 3;

LABEL_15:
            _Block_object_dispose(&v24, 8);
            a6 = 0;
            goto LABEL_16;
          }
        }
        int64_t v18 = 2;
LABEL_14:
        *a6 = v18;
        goto LABEL_15;
      }
    }
    else
    {
      *((unsigned char *)v25 + 24) = 1;
    }
    int64_t v18 = 1;
    goto LABEL_14;
  }
LABEL_16:

  return a6;
}

+ (id)playPodcastUuid:(id)a3 order:(int64_t)a4 limit:(int64_t)a5
{
  return [a1 playPodcastUuid:a3 order:a4 limit:a5 error:0];
}

+ (id)playStationUuid:(id)a3
{
  return [a1 playStationUuid:a3 episodeUuid:0];
}

+ (id)playStationUuid:(id)a3 episodeUuid:(id)a4
{
  return [a1 playStationUuid:a3 episodeUuid:a4 limit:0];
}

+ (id)playStationUuid:(id)a3 limit:(int64_t)a4
{
  return [a1 playStationUuid:a3 episodeUuid:0 limit:a4];
}

+ (id)playStationUuid:(id)a3 episodeUuid:(id)a4 limit:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 length] && objc_msgSend(a1, "_isContinuousPlaybackEnabledForLimit:", a5))
  {
    id v10 = [[MTPlaylistManifest alloc] initWithPlaylistUuid:v8 initialEpisodeUuid:v9];
  }
  else
  {
    if (![v9 length])
    {
      if ([v8 length])
      {
        uint64_t v21 = 0;
        id v22 = &v21;
        uint64_t v23 = 0x3032000000;
        uint64_t v24 = sub_100057188;
        v25 = sub_100057380;
        id v26 = 0;
        uint64_t v13 = +[MTDB sharedInstance];
        uint64_t v14 = [v13 mainOrPrivateContext];

        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_10014F038;
        v17[3] = &unk_10054DA00;
        id v15 = v14;
        id v18 = v15;
        id v19 = v8;
        v20 = &v21;
        [v15 performBlockAndWait:v17];
        if ([(id)v22[5] length])
        {
          id v16 = [MTEpisodeManifest alloc];
          id v11 = [(MTEpisodeManifest *)v16 initWithEpisodeUuid:v22[5]];
        }
        else
        {
          id v11 = 0;
        }

        _Block_object_dispose(&v21, 8);
      }
      else
      {
        id v11 = 0;
      }
      goto LABEL_7;
    }
    id v10 = [[MTEpisodeManifest alloc] initWithEpisodeUuid:v9];
  }
  id v11 = (MTEpisodeManifest *)v10;
LABEL_7:

  return v11;
}

+ (id)playEpisodeUuid:(id)a3
{
  return [a1 playEpisodeUuid:a3 limit:0];
}

+ (id)playEpisodeUuid:(id)a3 context:(int64_t)a4
{
  return [a1 playEpisodeUuid:a3 context:a4 limit:0];
}

+ (id)playEpisodeUuid:(id)a3 limit:(int64_t)a4
{
  return [a1 playEpisodeUuid:a3 context:0 limit:a4];
}

+ (id)playEpisodeUuid:(id)a3 context:(int64_t)a4 limit:(int64_t)a5
{
  return _[a1 playEpisodeUuid:a3 context:a4 sortType:0 limit:a5 pubDateLimit:3];
}

+ (id)playEpisodeUuid:(id)a3 context:(int64_t)a4 sortType:(int64_t)a5 limit:(int64_t)a6 pubDateLimit:(int64_t)a7
{
  id v12 = a3;
  if ([v12 length])
  {
    if ([a1 _isContinuousPlaybackEnabledForLimit:a6])
    {
      uint64_t v13 = 0;
      switch(a5)
      {
        case 0:
        case 1:
          goto LABEL_17;
        case 2:
          uint64_t v14 = 1;
          goto LABEL_18;
        case 3:
          uint64_t v16 = +[MTEpisode sortDescriptorsForTitle];
          goto LABEL_19;
        case 4:
          uint64_t v17 = 0;
          goto LABEL_10;
        case 5:
          uint64_t v17 = 1;
LABEL_10:
          uint64_t v16 = +[MTEpisode sortDescriptorsForLastBookmarkedDateAscending:v17];
          goto LABEL_19;
        case 7:
          uint64_t v18 = 1;
          goto LABEL_13;
        case 8:
          uint64_t v18 = 0;
LABEL_13:
          uint64_t v16 = +[MTEpisode sortDescriptorsForDownloadedDateAscending:v18];
          goto LABEL_19;
        case 9:
          id v19 = _MTLogCategoryPlayback();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Invalid sort type enum MTEpisodeContextSortType_ENUM_COUNT, using default", buf, 2u);
          }

LABEL_17:
          uint64_t v14 = 0;
LABEL_18:
          uint64_t v16 = +[MTEpisode sortDescriptorsForPubDateAscending:v14];
LABEL_19:
          uint64_t v13 = (void *)v16;
          break;
        default:
          break;
      }
      switch(a4)
      {
        case 2:
        case 7:
          id v20 = +[MTEpisode predicateForPubDateLimit:a7];
          uint64_t v21 = +[MTEpisode predicateForListenNowLatestEpisodes];
          id v22 = +[MTEpisode predicateForVisuallyPlayed:0];
          uint64_t v23 = [v21 AND:v22];
          uint64_t v24 = [v23 AND:v20];

          id v25 = objc_alloc((Class)NSFetchRequest);
          id v26 = [v25 initWithEntityName:kMTEpisodeEntityName];
          [v26 setPredicate:v24];
          [v26 setSortDescriptors:v13];
          id v15 = [[MTPredicateManifest alloc] initWithInitialEpisodeUuid:v12 fetchRequest:v26];

          goto LABEL_31;
        case 3:
          uint64_t v27 = +[MTEpisode predicateForDownloaded:1 excludeHidden:1];
          goto LABEL_27;
        case 8:
          uint64_t v27 = +[MTEpisode predicateForBookmarkedEpisodes];
LABEL_27:
          id v20 = (id)v27;
          v34 = [[MTPredicateManifest alloc] initWithInitialEpisodeUuid:v12 predicateToTrack:v27 sortDescriptors:v13];
          goto LABEL_29;
        case 9:
          v38 = +[MTDB sharedInstance];
          v39 = [v38 mainOrPrivateContext];

          *(void *)buf = 0;
          v55 = buf;
          uint64_t v56 = 0x3032000000;
          uint64_t v57 = (uint64_t)sub_100057188;
          v58 = sub_100057380;
          id v59 = 0;
          v50[0] = _NSConcreteStackBlock;
          v50[1] = 3221225472;
          v50[2] = sub_10014F734;
          v50[3] = &unk_10054DA00;
          id v20 = v39;
          id v51 = v20;
          id v40 = v12;
          id v52 = v40;
          v53 = buf;
          [v20 performBlockAndWait:v50];
          v41 = +[MTEpisode predicateForAllEpisodesOnPodcastUuid:*((void *)v55 + 5) includeNonAudioEpisodes:1];
          v42 = +[MTEpisode predicateForDownloaded:1 excludeHidden:1];
          v43 = [v41 AND:v42];

          id v15 = [[MTPredicateManifest alloc] initWithInitialEpisodeUuid:v40 predicateToTrack:v43 sortDescriptors:v13];
          _Block_object_dispose(buf, 8);

          goto LABEL_31;
        case 10:
          id v35 = objc_alloc((Class)NSFetchRequest);
          id v20 = [v35 initWithEntityName:kMTEpisodeEntityName];
          v36 = +[MTEpisode predicateForPreviouslyPlayedHidingFutureTimestamps];
          [v20 setPredicate:v36];

          v37 = +[MTEpisode sortDescriptorsForRecentlyPlayed];
          [v20 setSortDescriptors:v37];

          v34 = [[MTPredicateManifest alloc] initWithInitialEpisodeUuid:v12 fetchRequest:v20];
LABEL_29:
          id v15 = (MTEpisodeManifest *)v34;
LABEL_31:

          break;
        default:
          *(void *)buf = 0;
          v55 = buf;
          uint64_t v56 = 0x2020000000;
          uint64_t v57 = 9;
          v28 = +[MTDB sharedInstance];
          v29 = [v28 mainOrPrivateContext];

          v45[0] = _NSConcreteStackBlock;
          v45[1] = 3221225472;
          v45[2] = sub_10014F7A0;
          v45[3] = &unk_100551B70;
          id v30 = v29;
          id v46 = v30;
          id v31 = v12;
          id v47 = v31;
          v48 = buf;
          int64_t v49 = a4;
          [v30 performBlockAndWait:v45];
          v32 = off_100548610;
          if (a4 != 6) {
            v32 = &off_100548690;
          }
          id v33 = objc_alloc(*v32);
          id v15 = (MTEpisodeManifest *)[v33 initWithInitialEpisodeUuid:v31 sectionType:*((void *)v55 + 3)];

          _Block_object_dispose(buf, 8);
          break;
      }
    }
    else
    {
      id v15 = [[MTEpisodeManifest alloc] initWithEpisodeUuid:v12];
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

+ (id)_manifestForPlayMyPodcasts
{
  v2 = [a1 playListenNow];
  v3 = v2;
  if (v2)
  {
    v4 = v2;
LABEL_5:
    v5 = v4;
    goto LABEL_6;
  }
  if (+[MTPodcast totalUnplayedCount])
  {
    v4 = [[MTUnplayedManifest alloc] initWithInitialEpisodeUuid:0];
    goto LABEL_5;
  }
  v5 = 0;
LABEL_6:

  return v5;
}

+ (id)_manifestForPlayMyLatestPodcasts
{
  v2 = (MTUnplayedManifest *)+[MTPodcast totalUnplayedCount];
  if (v2) {
    v2 = [[MTUnplayedManifest alloc] initWithInitialEpisodeUuid:0 newestToOldest:1];
  }

  return v2;
}

+ (id)_manifestForPlayMyOldestPodcasts
{
  v2 = (MTUnplayedManifest *)+[MTPodcast totalUnplayedCount];
  if (v2) {
    v2 = [[MTUnplayedManifest alloc] initWithInitialEpisodeUuid:0 newestToOldest:0];
  }

  return v2;
}

+ (BOOL)_isContinuousPlaybackEnabledForLimit:(int64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    return 1;
  }
  if (a3 == 1) {
    return 0;
  }
  return MTPlaybackContinuousPlaybackEnabled();
}

+ (id)_episodeToPlayForPodcastUuid:(id)a3 playbackOrder:(int64_t)a4 excludeExplicit:(int64_t)a5 ctx:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = sub_100057188;
  uint64_t v27 = sub_100057380;
  id v28 = 0;
  if (a4 == 2)
  {
    id v12 = [a1 _oldestEpisodeForPodcastUuid:v10 restrictToUserEpisodes:1 excludeExplicit:a5 ctx:v11];
    uint64_t v13 = [v12 uuid];
  }
  else
  {
    if (a4 == 1)
    {
      id v12 = [a1 _latestEpisodeForPodcastUuid:v10 restrictToUserEpisodes:0 excludeExplicit:a5 ctx:v11];
      [v12 uuid];
    }
    else
    {
      id v12 = +[MTRecencyUtil upNextForPodcastUuid:v10 excludeExplicit:a5 ctx:v11];
      [v12 episodeUuid];
    uint64_t v13 = };
  }
  uint64_t v14 = (void *)v24[5];
  v24[5] = v13;

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10014FC08;
  v19[3] = &unk_10054DA00;
  id v15 = v11;
  id v20 = v15;
  id v16 = v10;
  id v21 = v16;
  id v22 = &v23;
  [v15 performBlockAndWait:v19];
  id v17 = (id)v24[5];

  _Block_object_dispose(&v23, 8);

  return v17;
}

+ (id)_latestEpisodeForPodcastUuid:(id)a3 restrictToUserEpisodes:(BOOL)a4 excludeExplicit:(int64_t)a5 ctx:(id)a6
{
  return _[a1 _latestOrOldestEpisodeForPodcastUuid:a3 restrictToUserEpisodes:a4 excludeExplicit:a5 latest:1 ctx:a6];
}

+ (id)_oldestEpisodeForPodcastUuid:(id)a3 restrictToUserEpisodes:(BOOL)a4 excludeExplicit:(int64_t)a5 ctx:(id)a6
{
  return _[a1 _latestOrOldestEpisodeForPodcastUuid:a3 restrictToUserEpisodes:a4 excludeExplicit:a5 latest:0 ctx:a6];
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
    uint64_t v25 = sub_100057188;
    id v26 = sub_100057380;
    id v27 = 0;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10014FE10;
    v15[3] = &unk_1005530C8;
    id v16 = v12;
    BOOL v20 = a4;
    id v17 = v11;
    uint64_t v18 = &v22;
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
  uint64_t v14 = sub_100057188;
  id v15 = sub_100057380;
  id v16 = 0;
  v4 = [v3 managedObjectContext];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10015000C;
  v8[3] = &unk_10054E2A8;
  id v10 = &v11;
  id v5 = v3;
  id v9 = v5;
  [v4 performBlockAndWait:v8];

  id v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

@end