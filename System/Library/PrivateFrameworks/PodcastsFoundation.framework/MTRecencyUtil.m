@interface MTRecencyUtil
+ (double)_lastDatePlayedIfNotFutureDate:(double)a3 podcast:(id)a4;
+ (double)scoreFromModifiedDate:(double)a3;
+ (id)_nextEpisodeForUnplayedPodcast:(id)a3 serial:(BOOL)a4 filter:(id)a5 ctx:(id)a6;
+ (id)_upNextForPodcast:(id)a3 serial:(BOOL)a4 excludeExplicit:(int64_t)a5 ctx:(id)a6;
+ (id)_upNextResultForUnfollowedPodcast:(id)a3 filter:(id)a4 ctx:(id)a5;
+ (id)_upNextResultForUnplayedFollowedPodcast:(id)a3 nextEpisodeForUnplayedShow:(id)a4 newestEpisodeWithShowBump:(id)a5 mostRecentlyPlayed:(id)a6 filter:(id)a7 serial:(BOOL)a8 ctx:(id)a9;
+ (id)_upNextScoreWithLastModifiedDate:(double)a3 lastDatePlayed:(double)a4 filter:(id)a5 podcast:(id)a6 ctx:(id)a7;
+ (id)caughtUpNextEpisodeForPodcast:(id)a3 nextEpisodeForUnplayedShow:(id)a4 mostRecentlyPlayedLastDatePlayed:(double)a5 serial:(BOOL)a6 filter:(id)a7;
+ (id)episodesForListenNowWithContext:(id)a3 limit:(int64_t)a4;
+ (id)mostRecentlySavedUnplayedEpisodeForPodcast:(id)a3 filter:(id)a4 ctx:(id)a5;
+ (id)nextEpisodeForPodcast:(id)a3 mostRecentlyPlayed:(id)a4 caughtUpNextEpisode:(id)a5 serial:(BOOL)a6 filter:(id)a7;
+ (id)upNextForPodcastUuid:(id)a3 ctx:(id)a4;
+ (id)upNextForPodcastUuid:(id)a3 excludeExplicit:(int64_t)a4 ctx:(id)a5;
+ (void)setCombinedScoreOnScore:(id)a3 total:(double)a4;
+ (void)setModifiedDateValuesOnScore:(id)a3 modifiedDate:(double)a4 modifiedDateWeight:(double)a5 total:(double)a6;
+ (void)setPercentOfEpsFromShowPlayedValuesOnScore:(id)a3 podcast:(id)a4 ctx:(id)a5 percentEpsFromShowPlayedWeight:(double)a6 total:(double)a7;
+ (void)setPercentOfTotalListeningValuesOnScore:(id)a3 podcast:(id)a4 ctx:(id)a5 percentEpsTotalPlayedWeight:(double)a6 total:(double)a7;
+ (void)unsafeUpdateRelatedFieldsIfUpNextChangedForPodcast:(id)a3 upNextResult:(id)a4 ctx:(id)a5;
@end

@implementation MTRecencyUtil

+ (id)upNextForPodcastUuid:(id)a3 ctx:(id)a4
{
  return (id)[a1 upNextForPodcastUuid:a3 excludeExplicit:0 ctx:a4];
}

+ (id)upNextForPodcastUuid:(id)a3 excludeExplicit:(int64_t)a4 ctx:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 length])
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__7;
    v22 = __Block_byref_object_dispose__7;
    id v23 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __58__MTRecencyUtil_upNextForPodcastUuid_excludeExplicit_ctx___block_invoke;
    v12[3] = &unk_1E5E61CA8;
    id v13 = v9;
    id v14 = v8;
    v15 = &v18;
    id v16 = a1;
    int64_t v17 = a4;
    [v13 performBlockAndWait:v12];
    id v10 = (id)v19[5];

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

void __58__MTRecencyUtil_upNextForPodcastUuid_excludeExplicit_ctx___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) podcastForUuid:*(void *)(a1 + 40)];
  if (([v5 hidden] & 1) == 0)
  {
    uint64_t v2 = objc_msgSend(*(id *)(a1 + 56), "_upNextForPodcast:serial:excludeExplicit:ctx:", v5, objc_msgSend(v5, "playbackNewestToOldest") ^ 1, *(void *)(a1 + 64), *(void *)(a1 + 32));
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
}

+ (id)_upNextForPodcast:(id)a3 serial:(BOOL)a4 excludeExplicit:(int64_t)a5 ctx:(id)a6
{
  uint64_t v8 = a4;
  id v10 = a3;
  id v11 = a6;
  if ([v10 shouldBeHiddenFromUpNext])
  {
    v12 = 0;
    goto LABEL_52;
  }
  id v13 = objc_alloc_init(MTUpNextResult);
  id v14 = objc_opt_new();
  [v14 setExcludeExplicit:a5];
  [v14 setExcludeUnentitled:1];
  [v14 setExcludeGhostEpisodes:1];
  if ([v10 subscribed]) {
    goto LABEL_4;
  }
  if (os_feature_enabled_unfollowed_shows_in_up_next())
  {
    int64_t v17 = [a1 _upNextResultForUnfollowedPodcast:v10 filter:v14 ctx:v11];
    v15 = v17;
    if (v17)
    {
      v15 = v17;
      v12 = v15;
    }
    else
    {
      [v10 lastDatePlayed];
      double v39 = v38;
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      if (v39 >= v40 + -7776000.0)
      {
        v50 = [v10 showTypeInFeed];

        v12 = 0;
        if (!v50) {
          goto LABEL_50;
        }
        uint64_t v8 = [v10 isSerialShowTypeInFeed];
LABEL_4:
        v15 = [v10 mostRecentlyPlayedEpisodeWithFilter:v14];
        if ([(MTUpNextResult *)v15 isUnplayed]) {
          int v16 = 1;
        }
        else {
          int v16 = [(MTUpNextResult *)v15 isPlayheadPartiallyPlayed];
        }
        [(MTUpNextResult *)v15 lastDatePlayed];
        if (v18 <= 0.0) {
          [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        }
        else {
          [(MTUpNextResult *)v15 lastDatePlayed];
        }
        double v20 = v19;
        uint64_t v21 = +[MTRecencyUtil _nextEpisodeForUnplayedPodcast:v10 serial:v8 filter:v14 ctx:v11];
        v22 = (void *)v21;
        if (v8)
        {
          if (v15)
          {
            int v51 = v16;
            v53 = (void *)v21;
            id v23 = [v10 highestNumberedEpisodePublishedBefore:v14 filter:v20];
            v24 = 0;
LABEL_25:
            v31 = [a1 caughtUpNextEpisodeForPodcast:v10 nextEpisodeForUnplayedShow:v53 mostRecentlyPlayedLastDatePlayed:v8 serial:v14 filter:v20];
            v52 = v23;
            if ([v23 isVisuallyPlayed] && v31)
            {
              [(MTUpNextResult *)v13 updateFor:v31];
              v30 = v24;
              if (v8) {
                v32 = v31;
              }
              else {
                v32 = v24;
              }
              [v32 pubDate];
              if (v20 >= v41) {
                double v41 = v20;
              }
              v42 = v13;
            }
            else
            {
              v30 = v24;
              if (!v51 || (v8 & 1) == 0 && ([v31 firstTimeAvailable], v20 < v33))
              {
                uint64_t v34 = [a1 nextEpisodeForPodcast:v10 mostRecentlyPlayed:v15 caughtUpNextEpisode:v31 serial:v8 filter:v14];
                if (!v34)
                {
                  v12 = 0;
                  v48 = v52;
                  v22 = v53;
                  goto LABEL_48;
                }
                v35 = (void *)v34;
                [(MTUpNextResult *)v13 updateFor:v34];
                if ((v8 & 1) == 0)
                {
                  [v24 pubDate];
                  if (v36 >= v20) {
                    double v20 = v36;
                  }
                }
                v22 = v53;
                [(MTUpNextResult *)v13 setModifiedDate:v20];
                [(MTUpNextResult *)v13 modifiedDate];
                v37 = &off_1E5E60000;
                +[MTRecencyUtil scoreFromModifiedDate:](MTRecencyUtil, "scoreFromModifiedDate:");
                -[MTUpNextResult setModifiedDateScore:](v13, "setModifiedDateScore:");

LABEL_47:
                v43 = v37[373];
                [(MTUpNextResult *)v13 modifiedDate];
                double v45 = v44;
                [(MTUpNextResult *)v15 lastDatePlayed];
                v47 = [v43 _upNextScoreWithLastModifiedDate:v14 lastDatePlayed:v10 filter:v11 podcast:v45 ctx:v46];
                [(MTUpNextResult *)v13 setUpNextScore:v47];
                v12 = v13;

                v48 = v52;
LABEL_48:

                goto LABEL_49;
              }
              [(MTUpNextResult *)v13 updateFor:v15];
              v42 = v13;
              double v41 = v20;
            }
            [(MTUpNextResult *)v42 setModifiedDate:v41];
            v37 = &off_1E5E60000;
            [(MTUpNextResult *)v13 modifiedDate];
            +[MTRecencyUtil scoreFromModifiedDate:](MTRecencyUtil, "scoreFromModifiedDate:");
            -[MTUpNextResult setModifiedDateScore:](v13, "setModifiedDateScore:");
            v22 = v53;
            goto LABEL_47;
          }
          v30 = 0;
        }
        else
        {
          [(MTUpNextResult *)v15 lastDatePlayed];
          BOOL v26 = v25 <= 0.0;
          double v27 = v20;
          if (v26) {
            objc_msgSend(v10, "addedDate", v20);
          }
          int v51 = v16;
          v28 = [v10 episodesPublishedAfter:v14 filter:4 limit:0 sortAsc:v27];
          if ((unint64_t)[v28 count] < 4)
          {
            id v29 = v22;
          }
          else
          {
            id v29 = [v28 objectAtIndexedSubscript:2];
          }
          v30 = v29;

          if (v15)
          {
            v53 = v22;
            v24 = v30;
            id v23 = [v10 episodePublishedBefore:v14 filter:v20];
            goto LABEL_25;
          }
        }
        v12 = [a1 _upNextResultForUnplayedFollowedPodcast:v10 nextEpisodeForUnplayedShow:v22 newestEpisodeWithShowBump:v30 mostRecentlyPlayed:0 filter:v14 serial:v8 ctx:v11];
LABEL_49:

        goto LABEL_50;
      }
      v12 = 0;
    }
LABEL_50:

    goto LABEL_51;
  }
  v12 = 0;
LABEL_51:

LABEL_52:
  return v12;
}

+ (id)_upNextResultForUnfollowedPodcast:(id)a3 filter:(id)a4 ctx:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!os_feature_enabled_unfollowed_shows_in_up_next())
  {
    v15 = 0;
    goto LABEL_13;
  }
  id v10 = [v7 mostRecentlyPlayedEpisodeWithFilter:v8];
  [v10 lastDatePlayed];
  double v12 = v11;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v14 = v13;
  if (![v10 isPlayheadPartiallyPlayed] || v12 <= v14 + -7776000.0)
  {
    if ([v7 savedEpisodesCount] >= 1)
    {
      int v16 = +[MTRecencyUtil mostRecentlySavedUnplayedEpisodeForPodcast:v7 filter:v8 ctx:v9];
      int64_t v17 = v16;
      if (v16)
      {
        [v16 lastBookmarkedDate];
        double v19 = v18;
        [v7 lastDatePlayed];
        if (v19 > v20)
        {
          v15 = objc_alloc_init(MTUpNextResult);
          [(MTUpNextResult *)v15 updateFor:v17];
          [v17 lastBookmarkedDate];
          -[MTUpNextResult setModifiedDate:](v15, "setModifiedDate:");
          [(MTUpNextResult *)v15 modifiedDate];
          +[MTRecencyUtil scoreFromModifiedDate:](MTRecencyUtil, "scoreFromModifiedDate:");
          -[MTUpNextResult setModifiedDateScore:](v15, "setModifiedDateScore:");

          goto LABEL_12;
        }
      }
    }
    v15 = 0;
    goto LABEL_12;
  }
  v15 = objc_alloc_init(MTUpNextResult);
  [(MTUpNextResult *)v15 updateFor:v10];
  [v10 lastDatePlayed];
  -[MTUpNextResult setModifiedDate:](v15, "setModifiedDate:");
  [(MTUpNextResult *)v15 modifiedDate];
  +[MTRecencyUtil scoreFromModifiedDate:](MTRecencyUtil, "scoreFromModifiedDate:");
  -[MTUpNextResult setModifiedDateScore:](v15, "setModifiedDateScore:");
LABEL_12:

LABEL_13:
  return v15;
}

+ (id)_upNextResultForUnplayedFollowedPodcast:(id)a3 nextEpisodeForUnplayedShow:(id)a4 newestEpisodeWithShowBump:(id)a5 mostRecentlyPlayed:(id)a6 filter:(id)a7 serial:(BOOL)a8 ctx:(id)a9
{
  BOOL v9 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  if (v15)
  {
    id v17 = a9;
    id v18 = a7;
    id v19 = a6;
    double v20 = objc_alloc_init(MTUpNextResult);
    [(MTUpNextResult *)v20 updateFor:v15];
    [v14 lastDatePlayed];
    if (v21 == 0.0)
    {
      if (v9)
      {
        [v14 addedDate];
        double v23 = v22;
      }
      else
      {
        [v16 pubDate];
        double v23 = v26;
        [v14 addedDate];
        if (v23 < v27) {
          double v23 = v27;
        }
      }
    }
    else if (v9)
    {
      [v15 pubDate];
      double v23 = v24;
      [v14 lastDatePlayed];
      if (v23 >= v25) {
        double v23 = v25;
      }
    }
    else
    {
      [v14 lastDatePlayed];
      +[MTRecencyUtil _lastDatePlayedIfNotFutureDate:podcast:](MTRecencyUtil, "_lastDatePlayedIfNotFutureDate:podcast:", v14);
      double v29 = v28;
      double v23 = v28 + 259200.0;
      [v15 pubDate];
      if (v30 <= v23)
      {
        [v15 pubDate];
        if (v31 >= v29) {
          double v23 = v31;
        }
        else {
          double v23 = v29;
        }
      }
    }
    [(MTUpNextResult *)v20 setModifiedDate:v23];
    [(MTUpNextResult *)v20 modifiedDate];
    double v33 = v32;
    [v19 lastDatePlayed];
    double v35 = v34;

    double v36 = +[MTRecencyUtil _upNextScoreWithLastModifiedDate:v18 lastDatePlayed:v14 filter:v17 podcast:v33 ctx:v35];

    [(MTUpNextResult *)v20 setUpNextScore:v36];
    [(MTUpNextResult *)v20 modifiedDate];
    +[MTRecencyUtil scoreFromModifiedDate:](MTRecencyUtil, "scoreFromModifiedDate:");
    -[MTUpNextResult setModifiedDateScore:](v20, "setModifiedDateScore:");
  }
  else
  {
    double v20 = 0;
  }

  return v20;
}

+ (double)scoreFromModifiedDate:(double)a3
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v5 = v4 + -7776000.0;
  double v6 = a3 - (v4 + -7776000.0);
  if (v6 >= 0.0) {
    double v7 = v6;
  }
  else {
    double v7 = 0.0;
  }
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  return v7 / (v8 - v5);
}

+ (id)caughtUpNextEpisodeForPodcast:(id)a3 nextEpisodeForUnplayedShow:(id)a4 mostRecentlyPlayedLastDatePlayed:(double)a5 serial:(BOOL)a6 filter:(id)a7
{
  BOOL v8 = a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  id v14 = v13;
  if (v8)
  {
    id v15 = [v13 filterExcludingPlayed];
    id v16 = [v11 lowestNumberedEpisodePublishedAfter:v15 filter:a5];
  }
  else if (v12 && ([v12 isVisuallyPlayed] & 1) == 0)
  {
    id v16 = v12;
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

+ (id)nextEpisodeForPodcast:(id)a3 mostRecentlyPlayed:(id)a4 caughtUpNextEpisode:(id)a5 serial:(BOOL)a6 filter:(id)a7
{
  BOOL v8 = a6;
  id v11 = a5;
  id v12 = v11;
  if (v8)
  {
    id v13 = [a3 nextNumberedUnplayedEpisodeAfter:a4 filter:a7];
  }
  else
  {
    id v13 = v11;
  }
  id v14 = v13;

  return v14;
}

+ (void)unsafeUpdateRelatedFieldsIfUpNextChangedForPodcast:(id)a3 upNextResult:(id)a4 ctx:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v9 podcastForUuid:v7];
  [v8 modifiedDate];
  objc_msgSend(v10, "setModifiedDate:");
  id v11 = _MTLogCategoryDefault();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v10 nextEpisodeUuid];
    id v13 = [v8 episodeUuid];
    *(_DWORD *)buf = 138543618;
    double v39 = v12;
    __int16 v40 = 2114;
    double v41 = v13;
    _os_log_impl(&dword_1AC9D5000, v11, OS_LOG_TYPE_DEFAULT, "UpNext result updating podcast nextEpisodeUuid from %{public}@ to %{public}@", buf, 0x16u);
  }
  id v14 = [v10 nextEpisodeUuid];
  uint64_t v15 = [v8 episodeUuid];
  if (v14 == (void *)v15)
  {

    goto LABEL_8;
  }
  id v16 = (void *)v15;
  id v17 = [v10 nextEpisodeUuid];
  id v18 = [v8 episodeUuid];
  char v19 = [v17 isEqualToString:v18];

  if ((v19 & 1) == 0)
  {
    double v20 = [v8 episodeUuid];

    if (v20)
    {
      double v21 = [v8 episodeUuid];
      id v14 = [v9 episodeForUuid:v21];

      [v14 setListenNowEpisode:1];
      [v8 modifiedDateScore];
      objc_msgSend(v14, "setModifiedDateScore:");
LABEL_8:
    }
  }
  double v22 = +[MTEpisode predicateForListenNowForPodcastUuid:v7];
  double v23 = [v8 episodeUuid];
  double v24 = +[MTEpisode predicateForEpisodeUuid:v23];
  double v25 = [v24 NOT];
  double v26 = [v22 AND:v25];

  double v27 = [v9 objectsInEntity:@"MTEpisode" predicate:v26 sortDescriptors:0 returnsObjectsAsFaults:0 limit:0];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v34 != v30) {
          objc_enumerationMutation(v27);
        }
        double v32 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        [v32 setListenNowEpisode:0];
        [v32 setModifiedDateScore:0.0];
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v29);
  }
}

+ (id)mostRecentlySavedUnplayedEpisodeForPodcast:(id)a3 filter:(id)a4 ctx:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = [a4 predicateForPodcast:v8];
  id v10 = +[MTEpisode predicateForVisuallyPlayed:0];
  id v11 = [v9 AND:v10];
  id v12 = [v8 uuid];

  id v13 = +[MTEpisode predicateForBookmarkedEpisodesOnPodcastUuid:v12];
  id v14 = [v11 AND:v13];

  uint64_t v15 = +[MTEpisode sortDescriptorsForLastBookmarkedDateAscending:0];
  id v16 = [v7 objectsInEntity:@"MTEpisode" predicate:v14 sortDescriptors:v15 returnsObjectsAsFaults:0 limit:1];

  id v17 = [v16 firstObject];

  return v17;
}

+ (id)_nextEpisodeForUnplayedPodcast:(id)a3 serial:(BOOL)a4 filter:(id)a5 ctx:(id)a6
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [v8 episodeTypeFilter];
  if (a4)
  {
    [v8 setEpisodeTypeFilter:1];
    [v9 oldestEpisodeInLatestSeasonOrShowWithFilter:v8];
  }
  else
  {
    [v8 setEpisodeTypeFilter:5];
    [v9 newestEpisodeWithFilter:v8];
  id v11 = };

  [v8 setEpisodeTypeFilter:v10];
  return v11;
}

+ (double)_lastDatePlayedIfNotFutureDate:(double)a3 podcast:(id)a4
{
  id v5 = a4;
  double v6 = +[FutureDateChecker sharedInstance];
  int v7 = [v6 isFutureWithTimestamp:a3];

  if (v7)
  {
    [v5 lastDatePlayed];
    if (v8 <= 0.0) {
      [v5 addedDate];
    }
    else {
      [v5 modifiedDate];
    }
    a3 = v9;
  }

  return a3;
}

+ (void)setModifiedDateValuesOnScore:(id)a3 modifiedDate:(double)a4 modifiedDateWeight:(double)a5 total:(double)a6
{
  id v9 = a3;
  +[MTRecencyUtil scoreFromModifiedDate:a4];
  objc_msgSend(v9, "setModifiedDateScore:");
  [v9 setModifiedWeight:a5 / a6];
}

+ (void)setPercentOfEpsFromShowPlayedValuesOnScore:(id)a3 podcast:(id)a4 ctx:(id)a5 percentEpsFromShowPlayedWeight:(double)a6 total:(double)a7
{
  id v33 = a4;
  id v11 = a5;
  id v12 = a3;
  id v13 = [v33 uuid];
  id v14 = +[MTEpisode predicateForAllEpisodesOnPodcastUuid:v13];
  uint64_t v15 = +[MTEpisode predicateForHasAnyVisualPlayState];
  id v16 = [v14 AND:v15];

  id v17 = [v33 uuid];
  id v18 = +[MTEpisode predicateForAllEpisodesOnPodcastUuid:v17];

  if ([v33 isSerialShowTypeInFeed])
  {
    uint64_t v19 = [v11 countOfObjectsInEntity:@"MTEpisode" predicate:v16];
    uint64_t v20 = [v11 countOfObjectsInEntity:@"MTEpisode" predicate:v18];
  }
  else
  {
    double v21 = (void *)MEMORY[0x1E4F1C9C8];
    [v33 addedDate];
    double v22 = objc_msgSend(v21, "dateWithTimeIntervalSinceReferenceDate:");
    double v23 = +[MTEpisode predicateForEpisodesPublishedAfterDate:v22];
    uint64_t v24 = [v16 AND:v23];

    double v25 = (void *)MEMORY[0x1E4F1C9C8];
    [v33 addedDate];
    double v26 = objc_msgSend(v25, "dateWithTimeIntervalSinceReferenceDate:");
    double v27 = +[MTEpisode predicateForEpisodesPublishedAfterDate:v26];
    uint64_t v28 = [v18 AND:v27];

    uint64_t v29 = +[MTEpisode sortDescriptorsForPubDateAscending:0];
    uint64_t v30 = [v11 objectsInEntity:@"MTEpisode" predicate:v28 sortDescriptors:v29 returnsObjectsAsFaults:0 limit:50];

    uint64_t v20 = [v30 count];
    double v31 = [v30 filteredArrayUsingPredicate:v24];
    uint64_t v19 = [v31 count];

    id v11 = (id)v29;
    id v18 = (void *)v28;
    id v16 = (void *)v24;
  }

  if (v20) {
    double v32 = (double)v19 / (double)v20 * 100.0;
  }
  else {
    double v32 = 0.0;
  }
  objc_msgSend(v12, "setEpisodesFromShowTotalCount:");
  [v12 setEpisodesFromShowPlayedCount:(double)v19];
  [v12 setEpisodesFromShowPlayedPercent:v32];
  [v12 setEpisodesFromShowWeight:a6 / a7];
}

+ (void)setPercentOfTotalListeningValuesOnScore:(id)a3 podcast:(id)a4 ctx:(id)a5 percentEpsTotalPlayedWeight:(double)a6 total:(double)a7
{
  id v24 = a3;
  id v11 = a5;
  id v12 = a4;
  id v13 = +[MTEpisode predicateForVisuallyPlayed:1];
  id v14 = +[MTEpisode sortDescriptorsForRecentlyPlayed];
  uint64_t v15 = [v11 objectsInEntity:@"MTEpisode" predicate:v13 sortDescriptors:v14 returnsObjectsAsFaults:0 limit:100];

  objc_msgSend(v24, "setAllPlayedEpisodesCount:", (double)(unint64_t)objc_msgSend(v15, "count"));
  id v16 = [v12 uuid];

  id v17 = +[MTEpisode predicateForAllEpisodesOnPodcastUuid:v16];
  id v18 = [v15 filteredArrayUsingPredicate:v17];

  objc_msgSend(v24, "setAllPlayedEpisodesFromThisShowCount:", (double)(unint64_t)objc_msgSend(v18, "count"));
  [v24 allPlayedEpisodesCount];
  double v19 = 0.0;
  if (v20 != 0.0)
  {
    [v24 allPlayedEpisodesFromThisShowCount];
    double v22 = v21;
    [v24 allPlayedEpisodesCount];
    double v19 = v22 / v23 * 100.0;
  }
  [v24 setAllPlayedEpsWeight:a6 / a7];
  [v24 setAllPlayedEpsPercent:v19];
}

+ (void)setCombinedScoreOnScore:(id)a3 total:(double)a4
{
  id v16 = a3;
  [v16 modifiedDateScore];
  double v6 = v5;
  if (a4 > 0.0)
  {
    [v16 modifiedWeight];
    double v8 = v6 * v7;
    [v16 episodesFromShowPlayedPercent];
    double v10 = v9;
    [v16 episodesFromShowWeight];
    double v12 = v8 + v10 * v11;
    [v16 allPlayedEpsPercent];
    double v14 = v13;
    [v16 allPlayedEpsWeight];
    double v6 = v12 + v14 * v15;
  }
  [v16 setCombinedScore:v6];
}

+ (id)_upNextScoreWithLastModifiedDate:(double)a3 lastDatePlayed:(double)a4 filter:(id)a5 podcast:(id)a6 ctx:(id)a7
{
  id v10 = a6;
  id v11 = a7;
  if (os_feature_enabled_prototype_up_next())
  {
    double v12 = objc_alloc_init(MTUpNextScorePrototype);
    double v13 = [MEMORY[0x1E4F1CB18] _applePodcastsFoundationSettingsUserDefaults];
    [v13 doubleForKey:@"MTUpNextScoreModifiedDateWeight"];
    double v15 = v14;

    id v16 = [MEMORY[0x1E4F1CB18] _applePodcastsFoundationSettingsUserDefaults];
    [v16 doubleForKey:@"MTUpNextScorePercentEpsFromShowPlayedWeight"];
    double v18 = v17;

    double v19 = [MEMORY[0x1E4F1CB18] _applePodcastsFoundationSettingsUserDefaults];
    [v19 doubleForKey:@"MTUpNextScorePercentEpsTotalPlayedWeight"];
    double v21 = v20;

    [a1 setModifiedDateValuesOnScore:v12 modifiedDate:a3 modifiedDateWeight:v15 total:v15 + v18 + v21];
    [a1 setPercentOfEpsFromShowPlayedValuesOnScore:v12 podcast:v10 ctx:v11 percentEpsFromShowPlayedWeight:v18 total:v15 + v18 + v21];
    [a1 setPercentOfTotalListeningValuesOnScore:v12 podcast:v10 ctx:v11 percentEpsTotalPlayedWeight:v21 total:v15 + v18 + v21];
    [a1 setCombinedScoreOnScore:v12 total:v15 + v18 + v21];
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

+ (id)episodesForListenNowWithContext:(id)a3 limit:(int64_t)a4
{
  id v5 = a3;
  uint64_t v13 = 0;
  double v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__7;
  double v17 = __Block_byref_object_dispose__7;
  id v18 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__MTRecencyUtil_episodesForListenNowWithContext_limit___block_invoke;
  v9[3] = &unk_1E5E61CD0;
  id v11 = &v13;
  id v6 = v5;
  id v10 = v6;
  int64_t v12 = a4;
  [v6 performBlockAndWait:v9];
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __55__MTRecencyUtil_episodesForListenNowWithContext_limit___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  id v7 = +[MTEpisode predicateForListenNow];
  uint64_t v3 = +[MTEpisode sortDescriptorsForListenNow];
  uint64_t v4 = [v2 objectsInEntity:@"MTEpisode" predicate:v7 sortDescriptors:v3 returnsObjectsAsFaults:0 limit:a1[6]];
  uint64_t v5 = *(void *)(a1[5] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

@end