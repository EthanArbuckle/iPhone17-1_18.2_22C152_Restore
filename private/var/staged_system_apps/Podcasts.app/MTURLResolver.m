@interface MTURLResolver
+ (BOOL)_handleBrowseURL:(id)a3;
+ (BOOL)_handleLegacyCoreSpotlightURL:(id)a3;
+ (BOOL)_handleNowPlayingURL:(id)a3;
+ (BOOL)_isLegacyCoreSpotlightURL:(id)a3;
+ (id)appController;
+ (id)episodeUrlForPodcastStoreId:(int64_t)a3 episodeStoreId:(int64_t)a4;
+ (id)podcastUrlForStoreId:(int64_t)a3;
+ (id)searchUrlForSearchText:(id)a3;
+ (void)handlePodcastsUrlScheme:(id)a3;
+ (void)handleiTMSUrlScheme:(id)a3;
+ (void)showSearchControllerWithSearchText:(id)a3;
@end

@implementation MTURLResolver

+ (id)appController
{
  return +[MTApplication appController];
}

+ (void)handleiTMSUrlScheme:(id)a3
{
  id v4 = a3;
  id v5 = [v4 pf_cleanUrlToStoreId];
  id v6 = [v4 pf_cleanUrlToStoreTrackId];
  v7 = [v4 pf_cleanUrlToEpisodeGuid];
  v8 = +[MTDB sharedInstance];
  v9 = [v8 mainQueueContext];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100168A98;
  v13[3] = &unk_1005534C0;
  id v14 = v9;
  id v15 = v7;
  id v18 = v6;
  id v19 = a1;
  id v16 = v4;
  id v17 = v5;
  id v10 = v4;
  id v11 = v7;
  id v12 = v9;
  [v12 performBlock:v13];
}

+ (void)handlePodcastsUrlScheme:(id)a3
{
  id v4 = a3;
  if (([a1 _handleLegacyCoreSpotlightURL:v4] & 1) == 0
    && ([a1 _handleNowPlayingURL:v4] & 1) == 0
    && ([a1 _handleBrowseURL:v4] & 1) == 0)
  {
    uint64_t v5 = [v4 host];
    id v6 = [v4 pf_queryAsDictionary];
    v7 = [v6 objectForKeyedSubscript:@"podcastUuid"];
    v30 = v6;
    v8 = [v6 objectForKeyedSubscript:@"episodeUuid"];
    v32[0] = @"play";
    v32[1] = @"show";
    v9 = +[NSArray arrayWithObjects:v32 count:2];
    v31 = (void *)v5;
    if (([v9 containsObject:v5] & 1) == 0)
    {
      id v10 = +[IMLogger sharedLogger];
      [v10 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Utility/MTURLResolver.m", 107, @"unsupported url: %@", v4 lineNumber format];
    }
    id v11 = +[MTDB sharedInstance];
    id v12 = [v11 mainQueueContext];

    v13 = [v12 episodeForUuid:v8];
    id v14 = [v13 podcast];
    if (v14)
    {
      id v15 = v14;
      id v16 = v12;
      id v17 = v9;
      id v18 = [v14 uuid];
      id v19 = v7;
      unsigned __int8 v20 = [v7 isEqualToString:v18];

      if (v20)
      {
        v7 = v19;
      }
      else
      {
        v7 = [v15 uuid];
      }
      v9 = v17;
      id v12 = v16;
    }
    else
    {
      id v15 = [v12 podcastForUuid:v7];
    }
    id v21 = [v8 length];
    if (v13) {
      BOOL v22 = 1;
    }
    else {
      BOOL v22 = v21 == 0;
    }
    uint64_t v23 = !v22;
    id v24 = [v8 length];
    v29 = v7;
    if ((!v13 || !v24) && [v7 length])
    {
      v25 = +[MTRecencyUtil upNextForPodcastUuid:v7 ctx:v12];
      uint64_t v26 = [v25 episodeUuid];

      v8 = (void *)v26;
    }
    if (v15)
    {
      id v27 = [v31 isEqualToString:@"play"];
      v28 = [a1 appController];
      [v28 presentPodcast:v15 episodeUuid:v8 episodeNotAvailable:v23 podcastTab:0 startPlayback:v27 animated:0];
    }
  }
}

+ (void)showSearchControllerWithSearchText:(id)a3
{
  id v6 = a3;
  if ([v6 length])
  {
    id v4 = +[MTURLResolver searchUrlForSearchText:v6];
    uint64_t v5 = [a1 appController];
    [v5 openStoreURL:v4];
  }
  else
  {
    id v4 = [a1 appController];
    [v4 selectSearchTabAndFocusSearchField];
  }
}

+ (id)searchUrlForSearchText:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = +[NSCharacterSet URLQueryAllowedCharacterSet];
    uint64_t v5 = [v3 stringByAddingPercentEncodingWithAllowedCharacters:v4];

    id v6 = +[NSString stringWithFormat:@"&term=%@", v5];
    [@"itms-podcasts://?action=search&activate=true" stringByAppendingString:v6];
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = @"itms-podcasts://?action=search&activate=true";
  }
  v8 = +[NSURL URLWithString:v7];

  return v8;
}

+ (id)podcastUrlForStoreId:(int64_t)a3
{
  if (+[MTStoreIdentifier isNotEmpty:](MTStoreIdentifier, "isNotEmpty:"))
  {
    id v4 = +[MTPodcast storeCleanURLForAdamID:a3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)episodeUrlForPodcastStoreId:(int64_t)a3 episodeStoreId:(int64_t)a4
{
  id v6 = +[NSString stringWithFormat:@"%llu", a4];
  v7 = [a1 podcastUrlForStoreId:a3];
  v8 = [v7 pf_URLByAppendingQueryParameterKey:@"i" value:v6];

  return v8;
}

+ (BOOL)_handleNowPlayingURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 host];
  id v6 = [v5 caseInsensitiveCompare:@"nowplaying"];
  BOOL v7 = v6 == 0;
  if (!v6)
  {
    v9 = [v4 host];

    if (!v9)
    {
      BOOL v7 = 0;
      goto LABEL_3;
    }
    id v10 = [a1 appController];
    [v10 presentNowPlayingAnimated:0];

    id v11 = [v4 pf_queryAsDictionary];
    id v12 = [v11 objectForKeyedSubscript:@"start"];
    unsigned int v13 = [v12 BOOLValue];

    id v14 = +[MTPlayerController defaultInstance];
    uint64_t v5 = v14;
    if (v13)
    {
      uint64_t v15 = [v14 currentItem];
      if (v15)
      {
        id v16 = (void *)v15;
        unsigned __int8 v17 = [v5 isPlayingLocally];

        if ((v17 & 1) == 0) {
          [v5 playWithReason:11];
        }
      }
    }
  }

LABEL_3:
  return v7;
}

+ (BOOL)_handleBrowseURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 host];
  id v6 = [v5 caseInsensitiveCompare:@"browse"];
  BOOL v7 = v6 == 0;
  if (!v6)
  {
    v8 = [v4 host];

    if (!v8)
    {
      BOOL v7 = 0;
      goto LABEL_5;
    }
    uint64_t v5 = [a1 appController];
    [v5 selectFeaturedTab];
  }

LABEL_5:
  return v7;
}

+ (BOOL)_isLegacyCoreSpotlightURL:(id)a3
{
  id v3 = a3;
  id v4 = [v3 scheme];
  unsigned int v5 = [v4 isEqualToString:@"podcasts"];

  if (v5
    && ([v3 host],
        id v6 = objc_claimAutoreleasedReturnValue(),
        unsigned int v7 = [v6 hasSuffix:@"play"],
        v6,
        v7))
  {
    v8 = [v3 absoluteString];
    unsigned __int8 v9 = [v8 containsString:@"pid="];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

+ (BOOL)_handleLegacyCoreSpotlightURL:(id)a3
{
  id v3 = a3;
  id v4 = [v3 host];
  unsigned int v5 = [v4 hasSuffix:@"play"];

  if (v5)
  {
    BOOL v22 = [v3 query];
    id v6 = [v22 componentsSeparatedByString:@"&"];
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x3032000000;
    id v27 = sub_1000571B8;
    v28 = sub_100057398;
    id v29 = 0;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1001697A4;
    v23[3] = &unk_1005534E8;
    v23[4] = &v24;
    [v6 enumerateObjectsUsingBlock:v23];
    if (v25[5])
    {
      id v7 = objc_alloc_init((Class)NSNumberFormatter);
      [v7 setNumberStyle:1];
      v8 = +[MTDB sharedInstance];
      unsigned __int8 v9 = [v8 mainOrPrivateContext];
      id v10 = [v7 numberFromString:v25[5]];
      id v11 = +[MTEpisode predicateForPersistentId:v10];
      uint64_t v12 = kEpisodeUuid;
      v30[0] = kEpisodeUuid;
      v30[1] = kEpisodePodcastUuid;
      unsigned int v13 = +[NSArray arrayWithObjects:v30 count:2];
      id v14 = [v9 objectDictionariesInEntity:kMTEpisodeEntityName predicate:v11 sortDescriptors:0 propertiesToFetch:v13 includeObjectId:0];

      id v15 = [v14 count];
      BOOL v16 = v15 != 0;
      if (v15)
      {
        unsigned __int8 v17 = [v14 lastObject];
        id v18 = [v17 objectForKeyedSubscript:v12];
        id v19 = +[MTPlaybackQueueFactory playEpisodeUuid:v18];
        unsigned __int8 v20 = +[MTPlayerController defaultInstance];
        [v20 playManifest:v19 reason:3];
      }
    }
    else
    {
      BOOL v16 = 0;
    }
    _Block_object_dispose(&v24, 8);
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

@end