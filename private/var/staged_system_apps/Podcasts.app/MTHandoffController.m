@interface MTHandoffController
- (BOOL)continueCoreSpotlightItemActivity:(id)a3;
- (BOOL)continueCoreSpotlightSearchActivity:(id)a3;
- (MTHandoffController)init;
- (NSUserActivity)activity;
- (id)supportedActivityTypes;
- (void)continueActivity:(id)a3;
- (void)continuePlaybackActivity:(id)a3;
- (void)setActivity:(id)a3;
@end

@implementation MTHandoffController

- (MTHandoffController)init
{
  v3.receiver = self;
  v3.super_class = (Class)MTHandoffController;
  return [(MTHandoffController *)&v3 init];
}

- (void)continueActivity:(id)a3
{
  id v6 = a3;
  v4 = [v6 activityType];
  v5 = +[IMPlayerManifest supportedActivityTypes];
  if ([v5 containsObject:v4])
  {
    [(MTHandoffController *)self continuePlaybackActivity:v6];
  }
  else if ([v4 isEqualToString:CSSearchableItemActionType])
  {
    [(MTHandoffController *)self continueCoreSpotlightItemActivity:v6];
  }
  else if ([v4 isEqualToString:CSQueryContinuationActionType])
  {
    [(MTHandoffController *)self continueCoreSpotlightSearchActivity:v6];
  }
}

- (id)supportedActivityTypes
{
  v2 = +[IMPlayerManifest supportedActivityTypes];
  id v3 = [v2 mutableCopy];

  [v3 addObject:CSSearchableItemActionType];
  [v3 addObject:CSQueryContinuationActionType];

  return v3;
}

- (void)continuePlaybackActivity:(id)a3
{
  id v3 = a3;
  v4 = +[MTPlayerController defaultInstance];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000A2F74;
  v6[3] = &unk_10054D710;
  id v7 = v3;
  id v5 = v3;
  [v4 restoreFromUserActivity:v5 startPlayback:1 reason:2 interactive:0 completion:v6];
}

- (BOOL)continueCoreSpotlightItemActivity:(id)a3
{
  id v3 = a3;
  v4 = [v3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:MDItemUniqueIdentifier];

  if (![v5 length])
  {
    id v6 = [v3 userInfo];
    uint64_t v7 = [v6 objectForKeyedSubscript:CSSearchableItemActivityIdentifier];

    id v5 = (void *)v7;
  }
  if ((unint64_t)[v5 length] >= 2)
  {
    v9 = [v5 substringFromIndex:1];
    v10 = +[MTDB sharedInstance];
    v11 = [v10 mainOrPrivateContext];

    v12 = +[MTApplication appController];
    [v12 dismissSearchOverlayController];

    if ([v5 hasPrefix:@"p"])
    {
      v13 = [v11 podcastForFeedUrl:v9];
      BOOL v8 = v13 != 0;
      if (v13)
      {
        v14 = +[MTApplication appController];
        [v14 presentPodcast:v13 episode:0 podcastTab:0 startPlayback:0 animated:0];

        +[IMMetrics recordUserAction:@"spotlight" dataSource:v13 withData:&off_10057AEB0];
        BOOL v8 = 1;
      }
      goto LABEL_21;
    }
    if ([v5 hasPrefix:@"e"])
    {
      v13 = [v3 containerIdentifier];
      if ([v13 length]) {
        +[MTEpisode predicateForEpisodeGuid:v9 onFeedURL:v13];
      }
      else {
      v15 = +[MTEpisode predicateForEpisodeGuid:v9];
      }
      v17 = [v11 objectsInEntity:kMTEpisodeEntityName predicate:v15 sortDescriptors:0];
      v19 = [v17 firstObject];
      v20 = v19;
      BOOL v8 = v19 != 0;
      if (v19)
      {
        uint64_t v24 = [v19 isInPodcastDetailsUnplayedTab] ^ 1;
        +[MTApplication appController];
        v21 = v25 = v15;
        v22 = [v20 podcast];
        [v21 presentPodcast:v22 episode:v20 podcastTab:v24 startPlayback:0 animated:0];

        v15 = v25;
        +[IMMetrics recordUserAction:@"spotlight" dataSource:v20 withData:&off_10057AED8];
      }
    }
    else
    {
      if (![v5 hasPrefix:@"s"])
      {
        BOOL v8 = 0;
LABEL_22:

        goto LABEL_23;
      }
      v13 = +[MTPlaylist predicateForVisiblePlaylistWithUUID:v9];
      v15 = [v11 objectsInEntity:kMTPlaylistEntityName predicate:v13 sortDescriptors:0];
      id v16 = [v15 count];
      BOOL v8 = v16 != 0;
      if (!v16) {
        goto LABEL_20;
      }
      v17 = [v15 objectAtIndexedSubscript:0];
      v18 = +[MTApplication appController];
      [v18 presentStation:v17 new:0];

      +[IMMetrics recordUserAction:@"spotlight" dataSource:v17 withData:&off_10057AF00];
    }

LABEL_20:
LABEL_21:

    goto LABEL_22;
  }
  BOOL v8 = 0;
LABEL_23:

  return v8;
}

- (BOOL)continueCoreSpotlightSearchActivity:(id)a3
{
  id v3 = [a3 userInfo];
  v4 = [v3 objectForKeyedSubscript:CSSearchQueryString];

  id v5 = [v4 length];
  if (v5)
  {
    id v6 = +[MTApplication appController];
    [v6 showSearchControllerWithSearchText:v4];
  }
  return v5 != 0;
}

- (NSUserActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (void).cxx_destruct
{
}

@end