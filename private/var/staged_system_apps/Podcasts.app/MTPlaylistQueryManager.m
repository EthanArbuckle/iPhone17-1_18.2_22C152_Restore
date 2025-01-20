@interface MTPlaylistQueryManager
+ (BOOL)updatePlaylist:(id)a3 inContext:(id)a4;
+ (id)_allEligiblePodcastsForPlaylistInCtx:(id)a3;
+ (void)_fixSortOrder:(id)a3 generated_p:(BOOL *)a4;
+ (void)_sortUngroupedList:(id)a3 inPlaylist:(id)a4;
+ (void)updateEpisodesForSettings:(id)a3 ctx:(id)a4;
- (BOOL)updatePlaylistWithUuid:(id)a3 inContext:(id)a4;
- (BOOL)updatePlaylistWithUuid:(id)a3 inContext:(id)a4 applyAdditionalChangesBlock:(id)a5;
- (BOOL)updatePlaylistsWithUuids:(id)a3;
- (BOOL)updatePlaylistsWithUuids:(id)a3 context:(id)a4 applyAdditionalChangesBlock:(id)a5;
- (MTPlaylistQueryManager)init;
- (id)entityName;
- (id)predicate;
- (void)createDefaultPlaylists;
- (void)feedUpdateDidComplete:(id)a3;
- (void)resultsChangedWithDeletedIds:(id)a3 insertIds:(id)a4 updatedIds:(id)a5;
- (void)updateAllPlaylistsWithCompletion:(id)a3;
@end

@implementation MTPlaylistQueryManager

- (MTPlaylistQueryManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)MTPlaylistQueryManager;
  v2 = [(MTBaseProcessor *)&v5 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"feedUpdateDidComplete:" name:@"MTFeedUpdateDidEndUpdatingAllFeeds" object:0];
  }
  return v2;
}

+ (void)_fixSortOrder:(id)a3 generated_p:(BOOL *)a4
{
  id v5 = a3;
  v6 = [v5 mutableOrderedSetValueForKey:kPlaylistSettings];
  switch([v5 containerOrder])
  {
    case 0u:
      v7 = &stru_1005518B0;
      goto LABEL_15;
    case 1u:
      v7 = &stru_1005518D0;
      goto LABEL_15;
    case 3u:
      v7 = &stru_1005518F0;
      goto LABEL_15;
    case 4u:
      v7 = &stru_100551910;
      goto LABEL_15;
    case 5u:
      v7 = &stru_100551930;
LABEL_15:
      [v6 sortUsingComparator:v7];
      break;
    default:
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v8 = v6;
      id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = 0;
        uint64_t v12 = *(void *)v15;
        do
        {
          v13 = 0;
          do
          {
            if (*(void *)v15 != v12) {
              objc_enumerationMutation(v8);
            }
            [*(id *)(*((void *)&v14 + 1) + 8 * (void)v13) setSortOrder:(char *)v13 + v11, (void)v14];
            v13 = (char *)v13 + 1;
          }
          while (v10 != v13);
          id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
          v11 += (uint64_t)v13;
        }
        while (v10);
      }

      *a4 = 1;
      break;
  }
}

+ (id)_allEligiblePodcastsForPlaylistInCtx:(id)a3
{
  uint64_t v3 = kMTPodcastEntityName;
  id v4 = a3;
  id v5 = +[MTPodcast predicateForNotHiddenNotImplicitlyFollowedPodcasts];
  v6 = +[MTPodcast sortDescriptorsForAllPodcasts];
  v7 = [v4 objectsInEntity:v3 predicate:v5 sortDescriptors:v6];

  return v7;
}

- (void)updateAllPlaylistsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (!v5->_updateAllPlaylistBackgroundWorkController)
  {
    uint64_t v6 = +[MTCoalescableWorkController controllerWithQosClass:21 identifier:@"MTPlaylistQueryManager.updateAllPlaylists"];
    updateAllPlaylistBackgroundWorkController = v5->_updateAllPlaylistBackgroundWorkController;
    v5->_updateAllPlaylistBackgroundWorkController = (MTCoalescableWorkController *)v6;
  }
  objc_sync_exit(v5);

  id v8 = v5->_updateAllPlaylistBackgroundWorkController;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000A9F8;
  v9[3] = &unk_10054D570;
  v9[4] = v5;
  [(MTCoalescableWorkController *)v8 schedule:v9 completion:v4];
}

+ (BOOL)updatePlaylist:(id)a3 inContext:(id)a4
{
  id v5 = a3;
  id v53 = a4;
  v49 = v5;
  v54 = [v53 playlistForUuid:v5];
  if (!v54)
  {
    LOBYTE(v50) = 0;
    goto LABEL_60;
  }
  uint64_t v6 = _MTLogCategoryDatabase();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Calling refreshObject:mergeChanges: for playlist.", buf, 2u);
  }

  [v53 refreshObject:v54 mergeChanges:1];
  unsigned int v50 = [v54 needsUpdate];
  if (v50) {
    [v54 setNeedsUpdate:0];
  }
  if (([v54 hidden] & 1) == 0)
  {
    if ([v54 isItunesPlaylist])
    {
      if (v50) {
        LOBYTE(v50) = 1;
      }
      else {
        LOBYTE(v50) = [v54 updateUnplayedCount];
      }
      goto LABEL_60;
    }
    if ([v54 includesAllPodcasts])
    {
      v48 = [a1 _allEligiblePodcastsForPlaylistInCtx:v53];
    }
    else
    {
      v7 = [v54 podcasts];
      v48 = [v7 array];
    }
    if ([v48 count])
    {
      buf[0] = 0;
      if (!v50)
      {
LABEL_56:
        [0 report];
        char v43 = v50;
        if (buf[0]) {
          char v43 = 1;
        }
        goto LABEL_58;
      }
      [0 reportWithMarker:@"*** Update start ***"];
      id v8 = [v54 settings];
      id v9 = [v8 copy];

      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id v10 = v9;
      id v11 = [v10 countByEnumeratingWithState:&v59 objects:v65 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v60;
        uint64_t v51 = kEpisodeTitle;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v60 != v12) {
              objc_enumerationMutation(v10);
            }
            long long v14 = *(void **)(*((void *)&v59 + 1) + 8 * i);
            long long v15 = [v14 podcast];
            if (v15)
            {
              if ([v14 needsUpdate])
              {
                long long v16 = [v14 podcast];
                long long v17 = [v16 title];
                v18 = +[NSString stringWithFormat:@"Settings needs update: %@", v17];
                [0 reportWithMarker:v18];

                [a1 updateEpisodesForSettings:v14 ctx:v53];
                [v14 setNeedsUpdate:0];
                v19 = [v14 episodes];
                v20 = [v19 valueForKey:v51];
                v21 = +[NSString stringWithFormat:@"\n%@", v20];
                [0 reportWithMarker:v21];
              }
            }
            else
            {
              v22 = +[IMLogger sharedLogger];
              [v22 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/Playlists/MTPlaylistQueryManager.m" lineNumber:225 format:@"Settings object with no podcast set"];

              [v53 deleteObject:v14];
              long long v15 = 0;
            }
          }
          id v11 = [v10 countByEnumeratingWithState:&v59 objects:v65 count:16];
        }
        while (v11);
      }

      [a1 _fixSortOrder:v54 generated_p:buf];
      v23 = [v54 settings];
      id v24 = [v23 copy];

      v25 = objc_opt_new();
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v26 = v24;
      id v27 = [v26 countByEnumeratingWithState:&v55 objects:v64 count:16];
      if (v27)
      {
        uint64_t v28 = *(void *)v56;
        do
        {
          for (j = 0; j != v27; j = (char *)j + 1)
          {
            if (*(void *)v56 != v28) {
              objc_enumerationMutation(v26);
            }
            v30 = *(void **)(*((void *)&v55 + 1) + 8 * (void)j);
            v31 = [v30 episodes];
            id v32 = [v31 mutableCopy];

            v33 = [v54 deletedEpisodes];
            [v32 minusSet:v33];

            v34 = [v30 episodes];
            unsigned __int8 v35 = [v32 isEqualToOrderedSet:v34];

            if ((v35 & 1) == 0)
            {
              [v30 setEpisodes:v32];
              buf[0] = 1;
            }
            v36 = [v30 episodes];
            [v25 unionOrderedSet:v36];

            [v30 setEpisodeCount:[v32 count]];
          }
          id v27 = [v26 countByEnumeratingWithState:&v55 objects:v64 count:16];
        }
        while (v27);
      }

      v37 = [v54 deletedEpisodes];
      [v25 minusSet:v37];

      v38 = [v54 episodes];
      if ([v25 isEqualToOrderedSet:v38])
      {
        unsigned __int8 v39 = [v54 isUngroupedList];

        if ((v39 & 1) == 0)
        {
LABEL_51:
          v44 = [v54 episodes];
          if ([v44 count])
          {
          }
          else
          {
            BOOL v45 = [v25 count] == 0;

            if (v45) {
              buf[0] = 1;
            }
          }
          +[NSDate timeIntervalSinceReferenceDate];
          [v54 setUpdatedDate:];

          goto LABEL_56;
        }
      }
      else
      {
      }
      if ([v54 isUngroupedList]) {
        [a1 _sortUngroupedList:v25 inPlaylist:v54];
      }
      [v54 setEpisodes:v25];
      [v54 updateUnplayedCount];
      buf[0] = 1;
      [0 reportWithMarker:@"Playlist generated"];
      goto LABEL_51;
    }
    v40 = [v54 podcasts];
    if (![v40 count])
    {
      v41 = [v54 deletedEpisodes];
      if (![v41 count])
      {
        v42 = [v54 episodes];
        if (![v42 count])
        {
          BOOL v47 = [v54 unplayedCount] == 0;

          if (v47) {
            goto LABEL_59;
          }
          goto LABEL_46;
        }
      }
    }

LABEL_46:
    [v54 setPodcasts:0];
    [v54 setDeletedEpisodes:0];
    [v54 setEpisodes:0];
    [v54 setUnplayedCount:0];
    char v43 = 1;
LABEL_58:
    LOBYTE(v50) = v43;
LABEL_59:
  }
LABEL_60:

  return v50;
}

+ (void)updateEpisodesForSettings:(id)a3 ctx:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 predicateForSettings];
  id v8 = [v5 podcast];
  id v9 = [v8 sortDescriptorsForPlayOrderByPubDate];

  id v10 = [v5 integerForEpisodesToShow];
  v30 = v6;
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = kEpisodeLevel;
    v13 = +[NSPredicate predicateWithFormat:@"%K < %ld", kEpisodeLevel, v10];
    uint64_t v29 = [v7 AND:v13];

    uint64_t v14 = kMTEpisodeEntityName;
    long long v15 = v9;
    id v16 = v6;
    long long v17 = +[NSSortDescriptor sortDescriptorWithKey:kEpisodePubDate ascending:0];
    v31[0] = v17;
    v18 = +[NSSortDescriptor sortDescriptorWithKey:kEpisodeEpisodeNumber ascending:0];
    v31[1] = v18;
    v19 = +[NSSortDescriptor sortDescriptorWithKey:v12 ascending:1];
    v31[2] = v19;
    v20 = +[NSSortDescriptor sortDescriptorWithKey:kEpisodeTitle ascending:1 selector:"localizedStandardCompare:"];
    v31[3] = v20;
    v21 = +[NSArray arrayWithObjects:v31 count:4];
    v22 = v16;
    id v9 = v15;
    v23 = [v22 objectsInEntity:v14 predicate:v29 sortDescriptors:v21 returnsObjectsAsFaults:1 limit:v11];

    id v24 = [v23 sortedArrayUsingDescriptors:v15];

    v7 = (void *)v29;
  }
  else
  {
    id v24 = [v6 objectsInEntity:kMTEpisodeEntityName predicate:v7 sortDescriptors:v9 returnsObjectsAsFaults:1 limit:0];
  }
  v25 = +[NSOrderedSet orderedSetWithArray:v24];
  id v26 = [v5 episodes];
  unsigned __int8 v27 = [v25 isEqualToOrderedSet:v26];

  if ((v27 & 1) == 0)
  {
    uint64_t v28 = +[NSOrderedSet orderedSetWithArray:v24];
    [v5 setEpisodes:v28];
  }
  [v5 setVisible:[v24 count] != 0];
  [v5 latestEpisodeDate];
  [v5 setLatestEpisodeAvailabilityDate:];
  [v5 oldestEpisodeDate];
  [v5 setEarliestEpisodeAvailabilityDate:];
}

- (id)predicate
{
  return +[MTPlaylist predicateForFlag:5 isTrue:1];
}

- (id)entityName
{
  return kMTPlaylistEntityName;
}

- (void)feedUpdateDidComplete:(id)a3
{
}

- (void)resultsChangedWithDeletedIds:(id)a3 insertIds:(id)a4 updatedIds:(id)a5
{
  id v6 = a4;
  if ([v6 count])
  {
    v7 = dispatch_get_global_queue(-2, 0);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100109228;
    v8[3] = &unk_10054D9B0;
    v8[4] = self;
    id v9 = v6;
    dispatch_async(v7, v8);
  }
}

+ (void)_sortUngroupedList:(id)a3 inPlaylist:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  switch([v5 containerOrder])
  {
    case 0u:
      id v6 = &stru_100551970;
      goto LABEL_7;
    case 1u:
      id v6 = &stru_100551990;
      goto LABEL_7;
    case 2u:
      v7 = [v5 episodes];
      id v8 = [v7 mutableCopy];

      id v9 = [v10 mutableCopy];
      [v9 minusOrderedSet:v8];
      [v8 intersectOrderedSet:v10];
      [v10 removeAllObjects];
      [v10 unionOrderedSet:v9];
      [v10 unionOrderedSet:v8];

      break;
    case 3u:
      id v6 = &stru_1005519B0;
      goto LABEL_7;
    case 4u:
      id v6 = &stru_1005519D0;
LABEL_7:
      [v10 sortUsingComparator:v6];
      break;
    default:
      break;
  }
}

- (BOOL)updatePlaylistWithUuid:(id)a3 inContext:(id)a4
{
  return [(MTPlaylistQueryManager *)self updatePlaylistWithUuid:a3 inContext:a4 applyAdditionalChangesBlock:0];
}

- (BOOL)updatePlaylistWithUuid:(id)a3 inContext:(id)a4 applyAdditionalChangesBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = +[NSSet setWithObject:a3];
  LOBYTE(self) = [(MTPlaylistQueryManager *)self updatePlaylistsWithUuids:v10 context:v9 applyAdditionalChangesBlock:v8];

  return (char)self;
}

- (BOOL)updatePlaylistsWithUuids:(id)a3
{
  id v4 = a3;
  id v5 = +[MTDB sharedInstance];
  id v6 = [v5 mainOrPrivateContext];

  LOBYTE(self) = [(MTPlaylistQueryManager *)self updatePlaylistsWithUuids:v4 context:v6 applyAdditionalChangesBlock:0];
  return (char)self;
}

- (BOOL)updatePlaylistsWithUuids:(id)a3 context:(id)a4 applyAdditionalChangesBlock:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100058940;
  v14[3] = &unk_100551A18;
  id v10 = v7;
  id v15 = v10;
  v18 = &v19;
  id v11 = v8;
  id v16 = v11;
  id v12 = v9;
  id v17 = v12;
  [v11 performBlockAndWait:v14];
  LOBYTE(v9) = *((unsigned char *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)v9;
}

- (void)createDefaultPlaylists
{
  v2 = +[MTDB sharedInstance];
  uint64_t v3 = [v2 mainOrPrivateContext];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100109B90;
  v5[3] = &unk_10054D570;
  id v6 = v3;
  id v4 = v3;
  [v4 performBlockAndWait:v5];
}

- (void).cxx_destruct
{
}

@end