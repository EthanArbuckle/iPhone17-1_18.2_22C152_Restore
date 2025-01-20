@interface MTPlaybackIdentifierUtil
+ (id)__queryStringToQueryDictionary:(id)a3;
+ (id)__stringByRemovingPercentEscapes:(id)a3;
+ (id)__stringWithPercentEscape:(id)a3;
- (BOOL)isLocalSetPlaybackQueueURLString:(id)a3;
- (BOOL)isSubscribeCommandURLString:(id)a3;
- (BOOL)isUniversalPlaybackIdentifierURLString:(id)a3;
- (_MRSystemAppPlaybackQueue)playbackQueueWithAccountInfoForIdentifiers:(id)a3;
- (_MRSystemAppPlaybackQueue)playbackQueueWithAccountInfoForManifest:(id)a3 queueStatus:(unint64_t *)a4;
- (_MRSystemAppPlaybackQueue)playbackQueueWithAccountInfoForPlayerItems:(id)a3;
- (_MRSystemAppPlaybackQueue)playbackQueueWithDsid:(id)a3 forIdentifiers:(id)a4;
- (id)_playbackRequestIdentifierWithHost:(id)a3 queryComponents:(id)a4;
- (id)_playbackRequestIdentifierWithHost:(id)a3 queryKey:(id)a4 value:(id)a5;
- (id)_universalPlaybackQueueIdentifierForPodcastUuid:(id)a3 podcastFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 episodeUuid:(id)a6 episodeGuid:(id)a7 episodeStoreId:(int64_t)a8 context:(int64_t)a9 contextSortType:(int64_t)a10 sampPlaybackOrder:(id)a11;
- (id)episodeUuidForSetPlaybackQueueRequestIdentifier:(id)a3;
- (id)localPlaybackQueueIdentifierForPodcastUuid:(id)a3 episodeUuid:(id)a4 sampPlaybackOrder:(id)a5;
- (id)localPlaybackQueueIdentifierForPodcastUuid:(id)a3 sampPlaybackOrder:(id)a4;
- (id)localPlaybackQueueIdentifierForStationUuid:(id)a3;
- (id)localPlaybackQueueIdentifierForStationUuid:(id)a3 episodeUuid:(id)a4;
- (id)playbackQueueIdentifierForEpisodeAdamId:(id)a3;
- (id)playbackQueueIdentifierForPlayMyPodcastsWithPlaybackOrder:(id)a3;
- (id)playbackQueueIdentifierForPodcastAdamId:(id)a3 sampPlaybackOrder:(id)a4;
- (id)playbackQueueIdentifierForSubscribeToPodcast:(id)a3;
- (id)playbackQueueIdentifierForSubscribeToPodcastFeedUrl:(id)a3;
- (id)playbackRequestURLWithDSID:(id)a3 baseRequestURLString:(id)a4;
- (id)playbackRequestURLWithPlayReason:(unint64_t)a3 baseRequestURLString:(id)a4;
- (id)podcastUuidForSetPlaybackQueueRequestIdentifier:(id)a3;
- (id)requestIdentifierForPlayerItem:(id)a3;
- (id)requestIdentifiersForManifest:(id)a3 queueStatus:(unint64_t *)a4;
- (id)universalPlaybackQueueIdentifierForPodcastFeedUrl:(id)a3 podcastStoreId:(int64_t)a4 episodeGuid:(id)a5 episodeStoreId:(int64_t)a6 sampPlaybackOrder:(id)a7;
- (id)universalPlaybackQueueIdentifierForPodcastUuid:(id)a3 podcastFeedUrl:(id)a4 podcastStoreId:(int64_t)a5;
- (id)universalPlaybackQueueIdentifierForPodcastUuid:(id)a3 podcastFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 episodeUuid:(id)a6 episodeGuid:(id)a7 episodeStoreId:(int64_t)a8 context:(int64_t)a9 contextSortType:(int64_t)a10;
- (id)universalPlaybackQueueIdentifierForPodcastUuid:(id)a3 podcastFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 episodeUuid:(id)a6 episodeGuid:(id)a7 episodeStoreId:(int64_t)a8 sampPlaybackOrder:(id)a9;
- (id)universalPlaybackQueueIdentifierForPodcastUuid:(id)a3 podcastFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 sampPlaybackOrder:(id)a6;
- (id)universalPlaybackQueueIdentifierForStationUuid:(id)a3 episodeGuid:(id)a4 episodeStoreId:(int64_t)a5 podcastFeedUrl:(id)a6;
- (id)universalPlaybackQueueIdentifierForStationUuid:(id)a3 episodeUuid:(id)a4 episodeGuid:(id)a5 episodeStoreId:(int64_t)a6 podcastFeedUrl:(id)a7;
- (int64_t)_episodeContextFromString:(id)a3;
- (int64_t)_episodeContextSortFromString:(id)a3;
- (int64_t)_episodeOrderFromString:(id)a3;
- (unint64_t)_playQueueTypeForRequestURL:(id)a3;
- (unint64_t)_playReasonFromString:(id)a3;
- (void)fetchPlayerItemsForPlaybackQueueRequestIdentifiers:(id)a3 completion:(id)a4;
- (void)fetchPlayerItemsForPlaybackQueueRequestIdentifiers:(id)a3 initiatedByAnotherUser:(BOOL)a4 completion:(id)a5;
@end

@implementation MTPlaybackIdentifierUtil

- (id)playbackRequestURLWithPlayReason:(unint64_t)a3 baseRequestURLString:(id)a4
{
  v4 = +[NSURL URLWithString:a4];
  v5 = objc_opt_class();
  v6 = [v4 query];
  v7 = [v5 __queryStringToQueryDictionary:v6];

  v8 = NSPersistentStringForMTPlayReason();
  [v7 setObject:v8 forKey:@"playReason"];

  id v9 = objc_alloc_init((Class)NSURLComponents);
  v10 = [v4 scheme];
  [v9 setScheme:v10];

  v11 = [v4 host];
  [v9 setHost:v11];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100088C08;
  v16[3] = &unk_10054ED60;
  id v17 = v7;
  id v12 = v7;
  v13 = [v12 mt_compactMap:v16];
  [v9 setQueryItems:v13];

  v14 = [v9 string];

  return v14;
}

- (id)playbackRequestURLWithDSID:(id)a3 baseRequestURLString:(id)a4
{
  id v5 = a3;
  v6 = +[NSURL URLWithString:a4];
  v7 = objc_opt_class();
  v8 = [v6 query];
  id v9 = [v7 __queryStringToQueryDictionary:v8];

  v10 = [v5 stringValue];

  if (v10)
  {
    v11 = [v5 stringValue];
    [v9 setObject:v11 forKey:@"enqueuerDSID"];
  }
  id v12 = objc_alloc_init((Class)NSURLComponents);
  v13 = [v6 scheme];
  [v12 setScheme:v13];

  v14 = [v6 host];
  [v12 setHost:v14];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100088E5C;
  v19[3] = &unk_10054ED60;
  id v20 = v9;
  id v15 = v9;
  v16 = [v15 mt_compactMap:v19];
  [v12 setQueryItems:v16];

  id v17 = [v12 string];

  return v17;
}

- (BOOL)isLocalSetPlaybackQueueURLString:(id)a3
{
  v3 = +[NSURL URLWithString:a3];
  v4 = [v3 host];
  if ([v4 length])
  {
    if (qword_10060A6D0 != -1) {
      dispatch_once(&qword_10060A6D0, &stru_10054ED80);
    }
    unsigned __int8 v5 = [(id)qword_10060A6C8 containsObject:v4];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)isSubscribeCommandURLString:(id)a3
{
  v3 = +[NSURL URLWithString:a3];
  v4 = [v3 host];
  unsigned __int8 v5 = [v4 isEqualToString:@"subscribe"];

  return v5;
}

- (BOOL)isUniversalPlaybackIdentifierURLString:(id)a3
{
  v3 = +[NSURL URLWithString:a3];
  v4 = [v3 host];
  unsigned __int8 v5 = [v4 isEqualToString:@"playItem"];

  return v5;
}

- (id)playbackQueueIdentifierForPlayMyPodcastsWithPlaybackOrder:(id)a3
{
  id v4 = a3;
  if (!v4) {
    id v4 = SAMPEpisodePlaybackOrderAPPLICATION_DEFAULTValue;
  }
  unsigned __int8 v5 = [(MTPlaybackIdentifierUtil *)self _playbackRequestIdentifierWithHost:@"playPodcasts" queryKey:@"playbackOrder" value:v4];

  return v5;
}

- (id)playbackQueueIdentifierForEpisodeAdamId:(id)a3
{
  return [(MTPlaybackIdentifierUtil *)self _playbackRequestIdentifierWithHost:@"playPodcast" queryKey:@"storeTrackId" value:a3];
}

- (id)localPlaybackQueueIdentifierForPodcastUuid:(id)a3 sampPlaybackOrder:(id)a4
{
  return [(MTPlaybackIdentifierUtil *)self localPlaybackQueueIdentifierForPodcastUuid:a3 episodeUuid:0 sampPlaybackOrder:a4];
}

- (id)localPlaybackQueueIdentifierForPodcastUuid:(id)a3 episodeUuid:(id)a4 sampPlaybackOrder:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 length] || objc_msgSend(v9, "length"))
  {
    v11 = [(MTPlaybackIdentifierUtil *)self universalPlaybackQueueIdentifierForPodcastUuid:v8 podcastFeedUrl:0 podcastStoreId:0 episodeUuid:v9 episodeGuid:0 episodeStoreId:0 sampPlaybackOrder:v10];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)universalPlaybackQueueIdentifierForPodcastFeedUrl:(id)a3 podcastStoreId:(int64_t)a4 episodeGuid:(id)a5 episodeStoreId:(int64_t)a6 sampPlaybackOrder:(id)a7
{
  return [(MTPlaybackIdentifierUtil *)self universalPlaybackQueueIdentifierForPodcastUuid:0 podcastFeedUrl:a3 podcastStoreId:a4 episodeUuid:0 episodeGuid:a5 episodeStoreId:a6 sampPlaybackOrder:a7];
}

- (id)universalPlaybackQueueIdentifierForPodcastUuid:(id)a3 podcastFeedUrl:(id)a4 podcastStoreId:(int64_t)a5
{
  return [(MTPlaybackIdentifierUtil *)self universalPlaybackQueueIdentifierForPodcastUuid:a3 podcastFeedUrl:a4 podcastStoreId:a5 episodeUuid:0 episodeGuid:0 episodeStoreId:0 sampPlaybackOrder:SAMPEpisodePlaybackOrderAPPLICATION_DEFAULTValue];
}

- (id)universalPlaybackQueueIdentifierForPodcastUuid:(id)a3 podcastFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 sampPlaybackOrder:(id)a6
{
  return [(MTPlaybackIdentifierUtil *)self universalPlaybackQueueIdentifierForPodcastUuid:a3 podcastFeedUrl:a4 podcastStoreId:a5 episodeUuid:0 episodeGuid:0 episodeStoreId:0 sampPlaybackOrder:a6];
}

- (id)universalPlaybackQueueIdentifierForPodcastUuid:(id)a3 podcastFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 episodeUuid:(id)a6 episodeGuid:(id)a7 episodeStoreId:(int64_t)a8 sampPlaybackOrder:(id)a9
{
  return [(MTPlaybackIdentifierUtil *)self _universalPlaybackQueueIdentifierForPodcastUuid:a3 podcastFeedUrl:a4 podcastStoreId:a5 episodeUuid:a6 episodeGuid:a7 episodeStoreId:a8 context:0 contextSortType:0 sampPlaybackOrder:a9];
}

- (id)universalPlaybackQueueIdentifierForPodcastUuid:(id)a3 podcastFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 episodeUuid:(id)a6 episodeGuid:(id)a7 episodeStoreId:(int64_t)a8 context:(int64_t)a9 contextSortType:(int64_t)a10
{
  return [(MTPlaybackIdentifierUtil *)self _universalPlaybackQueueIdentifierForPodcastUuid:a3 podcastFeedUrl:a4 podcastStoreId:a5 episodeUuid:a6 episodeGuid:a7 episodeStoreId:a8 context:a9 contextSortType:a10 sampPlaybackOrder:SAMPEpisodePlaybackOrderAPPLICATION_DEFAULTValue];
}

- (id)_universalPlaybackQueueIdentifierForPodcastUuid:(id)a3 podcastFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 episodeUuid:(id)a6 episodeGuid:(id)a7 episodeStoreId:(int64_t)a8 context:(int64_t)a9 contextSortType:(int64_t)a10 sampPlaybackOrder:(id)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a7;
  id v20 = a11;
  if (![v20 length])
  {
    id v21 = SAMPEpisodePlaybackOrderAPPLICATION_DEFAULTValue;

    id v20 = v21;
  }
  id v22 = [v18 length];
  id v23 = [v16 length];
  v24 = +[NSMutableDictionary dictionary];
  [v24 setObject:v20 forKey:@"playbackOrder"];
  if (!v23)
  {
    if (!v22) {
      goto LABEL_11;
    }
    v25 = +[MTDB sharedInstance];
    v26 = [v25 mainOrPrivateContext];

    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x3032000000;
    v44 = sub_100056EE0;
    v45 = sub_100057248;
    id v46 = 0;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100089720;
    v37[3] = &unk_10054DA00;
    id v27 = v26;
    id v38 = v27;
    id v39 = v18;
    v40 = &v41;
    [v27 performBlockAndWait:v37];
    if ([(id)v42[5] length]) {
      [v24 setObject:v42[5] forKey:@"uuid"];
    }

    _Block_object_dispose(&v41, 8);
    goto LABEL_10;
  }
  [v24 setObject:v16 forKey:@"uuid"];
  if (v22) {
LABEL_10:
  }
    [v24 setObject:v18 forKey:@"episodeUuid"];
LABEL_11:
  if ([v17 length])
  {
    v28 = [objc_opt_class() __stringWithPercentEscape:v17];
    [v24 setObject:v28 forKey:@"podcastFeedUrl"];
  }
  if ([v19 length]) {
    [v24 setObject:v19 forKey:@"episodeGuid"];
  }
  uint64_t v29 = kMTSerpentAdamIdOffset;
  if (a5 && kMTSerpentAdamIdOffset != a5)
  {
    v30 = +[NSString stringWithFormat:@"%llu", a5];
    [v24 setObject:v30 forKey:@"storeCollectionId"];
  }
  if (a8 && v29 != a8)
  {
    v31 = +[NSString stringWithFormat:@"%llu", a8];
    [v24 setObject:v31 forKey:@"storeTrackId"];
  }
  v32 = NSPersistentStringForMTEpisodeContext();
  [v24 setObject:v32 forKey:@"context"];

  v33 = NSPersistentStringForMTEpisodeContextSortType();
  [v24 setObject:v33 forKey:@"contextSortType"];

  v34 = [(MTPlaybackIdentifierUtil *)self _playbackRequestIdentifierWithHost:@"playPodcast" queryComponents:v24];

  return v34;
}

- (id)playbackQueueIdentifierForPodcastAdamId:(id)a3 sampPlaybackOrder:(id)a4
{
  id v6 = a4;
  if (!v6) {
    id v6 = SAMPEpisodePlaybackOrderAPPLICATION_DEFAULTValue;
  }
  v11[0] = @"storeCollectionId";
  v11[1] = @"playbackOrder";
  v12[0] = a3;
  v12[1] = v6;
  id v7 = a3;
  id v8 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  id v9 = [(MTPlaybackIdentifierUtil *)self _playbackRequestIdentifierWithHost:@"playPodcast" queryComponents:v8];

  return v9;
}

- (id)playbackQueueIdentifierForSubscribeToPodcast:(id)a3
{
  return [(MTPlaybackIdentifierUtil *)self _playbackRequestIdentifierWithHost:@"subscribe" queryKey:@"storeCollectionId" value:a3];
}

- (id)playbackQueueIdentifierForSubscribeToPodcastFeedUrl:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [objc_opt_class() __stringWithPercentEscape:v4];

  id v6 = [(MTPlaybackIdentifierUtil *)self _playbackRequestIdentifierWithHost:@"subscribe" queryKey:@"podcastFeedUrl" value:v5];

  return v6;
}

- (id)localPlaybackQueueIdentifierForStationUuid:(id)a3
{
  return [(MTPlaybackIdentifierUtil *)self localPlaybackQueueIdentifierForStationUuid:a3 episodeUuid:0];
}

- (id)localPlaybackQueueIdentifierForStationUuid:(id)a3 episodeUuid:(id)a4
{
  return [(MTPlaybackIdentifierUtil *)self universalPlaybackQueueIdentifierForStationUuid:a3 episodeUuid:a4 episodeGuid:0 episodeStoreId:0 podcastFeedUrl:0];
}

- (id)universalPlaybackQueueIdentifierForStationUuid:(id)a3 episodeGuid:(id)a4 episodeStoreId:(int64_t)a5 podcastFeedUrl:(id)a6
{
  return [(MTPlaybackIdentifierUtil *)self universalPlaybackQueueIdentifierForStationUuid:a3 episodeUuid:0 episodeGuid:a4 episodeStoreId:a5 podcastFeedUrl:a6];
}

- (id)universalPlaybackQueueIdentifierForStationUuid:(id)a3 episodeUuid:(id)a4 episodeGuid:(id)a5 episodeStoreId:(int64_t)a6 podcastFeedUrl:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  id v15 = a3;
  id v16 = +[NSMutableDictionary dictionaryWithCapacity:5];
  [v16 setObject:v15 forKey:@"uuid"];

  if ([v12 length]) {
    [v16 setObject:v12 forKey:@"episodeUuid"];
  }
  if ([v13 length]) {
    [v16 setObject:v13 forKey:@"episodeGuid"];
  }
  if ([v14 length])
  {
    id v17 = [objc_opt_class() __stringWithPercentEscape:v14];
    [v16 setObject:v17 forKey:@"podcastFeedUrl"];
  }
  if ((+[MTStoreIdentifier isEmpty:a6] & 1) == 0)
  {
    id v18 = +[NSString stringWithFormat:@"%llu", a6];
    [v16 setObject:v18 forKey:@"storeTrackId"];
  }
  id v19 = [(MTPlaybackIdentifierUtil *)self _playbackRequestIdentifierWithHost:@"playStation" queryComponents:v16];

  return v19;
}

- (id)episodeUuidForSetPlaybackQueueRequestIdentifier:(id)a3
{
  v3 = +[NSURL URLWithString:a3];
  id v4 = [v3 pf_queryAsDictionary];
  id v5 = objc_alloc((Class)MTEpisodeLookupRequest);
  id v6 = [v4 objectForKeyedSubscript:@"storeTrackId"];
  [v5 setStoreTrackId:[v6 longLongValue]];

  id v7 = [v4 objectForKeyedSubscript:@"episodeUuid"];
  [v5 setUuid:v7];

  id v8 = [v4 objectForKeyedSubscript:@"episodeGuid"];
  [v5 setEpisodeGuid:v8];

  id v9 = [v4 objectForKeyedSubscript:@"episodeTitle"];
  id v10 = [v9 stringByRemovingPercentEscapes];
  [v5 setEpisodeTitle:v10];

  v11 = [v4 objectForKeyedSubscript:@"podcastTitle"];
  id v12 = [v11 stringByRemovingPercentEscapes];
  [v5 setPodcastTitle:v12];

  id v13 = [v4 objectForKeyedSubscript:@"podcastFeedUrl"];
  id v14 = [v13 stringByRemovingPercentEscapes];
  id v15 = [v14 stringByRemovingPercentEscapes];
  [v5 setPodcastFeedUrl:v15];

  id v16 = [v4 objectForKeyedSubscript:@"streamUrl"];
  id v17 = [v16 stringByRemovingPercentEscapes];
  id v18 = [v17 stringByRemovingPercentEscapes];
  [v5 setStreamUrl:v18];

  id v19 = +[MTEpisodeLookupUtil sharedInstance];
  id v20 = [v19 findEpisodeWithRequest:v5];

  id v21 = [v20 uuid];

  return v21;
}

- (id)podcastUuidForSetPlaybackQueueRequestIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[NSURL URLWithString:v3];
  id v5 = [v4 pf_queryAsDictionary];
  id v6 = [v5 objectForKeyedSubscript:@"podcastFeedUrl"];
  id v7 = [v6 stringByRemovingPercentEscapes];
  id v8 = [v7 stringByRemovingPercentEscapes];

  id v9 = [v5 objectForKeyedSubscript:@"storeCollectionId"];
  id v10 = [v9 longLongValue];

  v11 = +[NSNumber numberWithLongLong:v10];
  id v12 = +[MTDB sharedInstance];
  id v13 = [v12 mainOrPrivateContext];

  id v14 = [objc_alloc((Class)MTStoreIdentifier) initWithFeedUrl:v8 storeIdentifier:v11];
  id v15 = objc_alloc((Class)NSFetchRequest);
  id v16 = [v15 initWithEntityName:kMTPodcastEntityName];
  id v17 = +[MTPodcast predicateForIdentifer:v14];
  [v16 setPredicate:v17];

  [v16 setFetchLimit:1];
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  id v38 = sub_100056EE0;
  id v39 = sub_100057248;
  id v40 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = sub_100056EE0;
  v33 = sub_100057248;
  id v34 = 0;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10008A0D8;
  v24[3] = &unk_10054DA28;
  id v18 = v13;
  id v25 = v18;
  id v19 = v16;
  id v26 = v19;
  id v27 = &v35;
  v28 = &v29;
  [v18 performBlockAndWait:v24];
  if (v36[5])
  {
    id v20 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = v36[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v42 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Error fetching podcast for playback identifier: %@", buf, 0xCu);
    }

    id v22 = 0;
  }
  else
  {
    id v22 = (id)v30[5];
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  return v22;
}

- (_MRSystemAppPlaybackQueue)playbackQueueWithAccountInfoForIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = +[MTAccountController sharedInstance];
  id v6 = [v5 activeDsid];
  id v7 = [(MTPlaybackIdentifierUtil *)self playbackQueueWithDsid:v6 forIdentifiers:v4];

  return v7;
}

- (_MRSystemAppPlaybackQueue)playbackQueueWithDsid:(id)a3 forIdentifiers:(id)a4
{
  id v5 = a4;
  id v6 = (_MRSystemAppPlaybackQueue *)MRSystemAppPlaybackQueueCreate();
  MRSystemAppPlaybackQueueSetGenericTrackIdentifiers();

  if (a3)
  {
    id v9 = a3;
    keys = @"enqueuerDSID";
    CFDictionaryRef v7 = CFDictionaryCreate(0, (const void **)&keys, (const void **)&v9, 1, 0, &kCFTypeDictionaryValueCallBacks);
    MRSystemAppPlaybackQueueSetUserInfo();
    CFRelease(v7);
  }
  return v6;
}

- (_MRSystemAppPlaybackQueue)playbackQueueWithAccountInfoForManifest:(id)a3 queueStatus:(unint64_t *)a4
{
  id v5 = [(MTPlaybackIdentifierUtil *)self requestIdentifiersForManifest:a3 queueStatus:a4];
  id v6 = [(MTPlaybackIdentifierUtil *)self playbackQueueWithAccountInfoForIdentifiers:v5];

  return v6;
}

- (id)requestIdentifiersForManifest:(id)a3 queueStatus:(unint64_t *)a4
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if (![v7 loadStatus])
    {
      id v15 = &NSFileSize_ptr;
      id v16 = [v7 podcastAdamId];
      unsigned int v17 = +[MTStoreIdentifier isNotEmptyNumber:v16];

      if (v17)
      {
        if ([v7 playbackOrder] == (id)1)
        {
          id v18 = (id *)&SAMPEpisodePlaybackOrderNEWEST_FIRSTValue;
        }
        else
        {
          id v33 = [v7 playbackOrder];
          id v18 = (id *)&SAMPEpisodePlaybackOrderAPPLICATION_DEFAULTValue;
          if (v33 == (id)2) {
            id v18 = (id *)&SAMPEpisodePlaybackOrderOLDEST_FIRSTValue;
          }
        }
        id v34 = *v18;
        uint64_t v35 = [v7 podcastAdamId];
        v36 = [v35 stringValue];
        uint64_t v37 = [(MTPlaybackIdentifierUtil *)self playbackQueueIdentifierForPodcastAdamId:v36 sampPlaybackOrder:v34];
        v47 = v37;
        id v41 = +[NSArray arrayWithObjects:&v47 count:1];
      }
      else
      {
        id v19 = [v7 episodeAdamIds];
        id v20 = [v19 count];

        if (v20)
        {
          id v41 = objc_alloc_init((Class)NSMutableArray);
          long long v42 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          id v39 = v7;
          id obj = [v7 episodeAdamIds];
          id v21 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
          if (v21)
          {
            id v22 = v21;
            uint64_t v23 = *(void *)v43;
            do
            {
              for (i = 0; i != v22; i = (char *)i + 1)
              {
                if (*(void *)v43 != v23) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v25 = *(void *)(*((void *)&v42 + 1) + 8 * i);
                if ([(NSFileAttributeKey *)(id)v15[224] isNotEmptyNumber:v25])
                {
                  id v26 = +[NSString stringWithFormat:@"podcasts://%@", @"playItem"];
                  id v27 = +[NSURL URLWithString:v26];
                  v28 = objc_opt_new();
                  uint64_t v29 = +[NSString stringWithFormat:@"%@", v25];
                  [v28 setObject:v29 forKey:@"storeTrackId"];

                  v30 = [v27 pf_URLByAppendingQueryParameters:v28];
                  [v30 absoluteString];
                  v32 = uint64_t v31 = v15;

                  [v41 addObject:v32];
                  id v15 = v31;
                }
              }
              id v22 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
            }
            while (v22);
          }

          goto LABEL_40;
        }
        id v41 = &__NSArray0__struct;
      }

      goto LABEL_40;
    }
  }
  id v41 = objc_alloc_init((Class)NSMutableArray);
  id v8 = (char *)[v6 currentIndex];
  if (v8 >= [v6 count])
  {
    unint64_t v10 = 0;
LABEL_15:
    if (a4) {
      goto LABEL_23;
    }
    goto LABEL_40;
  }
  uint64_t v9 = 0;
  unint64_t v10 = 0;
  while (1)
  {
    v11 = [v6 objectAtIndex:v8];
    if (([v11 isStreamable] & 1) == 0) {
      break;
    }
LABEL_10:
    id v14 = [(MTPlaybackIdentifierUtil *)self requestIdentifierForPlayerItem:v11];
    if ([v14 length]) {
      [v41 addObject:v14];
    }

    if (++v8 >= [v6 count]) {
      goto LABEL_15;
    }
  }
  id v12 = [v6 currentItem];
  unsigned __int8 v13 = [v12 isEqual:v11];

  if (v13)
  {
    unint64_t v10 = 1;
    goto LABEL_22;
  }
  if ((unint64_t)++v9 <= 1)
  {
    unint64_t v10 = 2;
    goto LABEL_10;
  }
  unint64_t v10 = 3;
LABEL_22:

  if (a4) {
LABEL_23:
  }
    *a4 = v10;
LABEL_40:

  return v41;
}

- (_MRSystemAppPlaybackQueue)playbackQueueWithAccountInfoForPlayerItems:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      unint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = -[MTPlaybackIdentifierUtil requestIdentifierForPlayerItem:](self, "requestIdentifierForPlayerItem:", *(void *)(*((void *)&v14 + 1) + 8 * (void)v10), (void)v14);
        if ([v11 length]) {
          [v5 addObject:v11];
        }

        unint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  id v12 = [(MTPlaybackIdentifierUtil *)self playbackQueueWithAccountInfoForIdentifiers:v5];
  return v12;
}

- (void)fetchPlayerItemsForPlaybackQueueRequestIdentifiers:(id)a3 completion:(id)a4
{
}

- (void)fetchPlayerItemsForPlaybackQueueRequestIdentifiers:(id)a3 initiatedByAnotherUser:(BOOL)a4 completion:(id)a5
{
  BOOL v48 = a4;
  id v6 = a3;
  id v43 = a5;
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x2020000000;
  char v71 = 0;
  id v7 = +[NSMutableArray array];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v64 objects:v81 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v65;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v65 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = +[NSURL URLWithString:*(void *)(*((void *)&v64 + 1) + 8 * i)];
        unsigned __int8 v13 = +[NSString UUID];
        long long v14 = [v12 pf_URLByAppendingQueryParameterKey:@"deDupe" value:v13];
        long long v15 = [v14 absoluteString];

        [v7 addObject:v15];
      }
      id v9 = [v8 countByEnumeratingWithState:&v64 objects:v81 count:16];
    }
    while (v9);
  }

  id v16 = v7;
  long long v17 = _MTLogCategoryMediaRemote();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Fetch player items for playback queue identifiers: %@", buf, 0xCu);
  }

  id v44 = objc_alloc_init((Class)NSMutableDictionary);
  id v45 = objc_alloc_init((Class)NSMutableDictionary);
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obj = v16;
  id v18 = [obj countByEnumeratingWithState:&v60 objects:v80 count:16];
  if (v18)
  {
    uint64_t v47 = *(void *)v61;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v61 != v47) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void *)(*((void *)&v60 + 1) + 8 * (void)j);
        id v21 = [(MTPlaybackIdentifierUtil *)self episodeUuidForSetPlaybackQueueRequestIdentifier:v20];
        id v22 = +[NSURL URLWithString:v20];
        uint64_t v23 = [v22 pf_queryAsDictionary];
        v24 = [v23 objectForKeyedSubscript:@"storeTrackId"];
        id v25 = [v24 longLongValue];

        id v26 = [v23 objectForKeyedSubscript:@"contentItemId"];
        if (v48)
        {
          if (+[MTStoreIdentifier isNotEmpty:v25])
          {
            id v27 = +[NSString stringWithFormat:@"%lld", v25];
            [v45 setObject:v20 forKey:v27];
          }
        }
        else
        {
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          v77 = sub_100056EE0;
          v78 = sub_100057248;
          id v79 = 0;
          if (+[MTPlayerController hasDefaultInstance]
            && [v26 length])
          {
            v28 = +[MTPlayerController defaultInstance];
            uint64_t v29 = [v28 compositeManifest];
            v57[0] = _NSConcreteStackBlock;
            v57[1] = 3221225472;
            v57[2] = sub_10008B140;
            v57[3] = &unk_10054EDA8;
            id v58 = v26;
            v59 = buf;
            [v29 enumerateObjectsUsingBlock:v57];
          }
          if (!*(void *)(*(void *)&buf[8] + 40)
            && (+[PFClientUtil isRunningOnHomepod] & 1) == 0)
          {
            uint64_t v30 = +[MTBaseEpisodeListManifest mediaItemForEpisodeWithUUID:v21];
            uint64_t v31 = *(void **)(*(void *)&buf[8] + 40);
            *(void *)(*(void *)&buf[8] + 40) = v30;
          }
          if (*(void *)(*(void *)&buf[8] + 40))
          {
            if ([v26 length])
            {
              id v32 = [objc_alloc((Class)NSUUID) initWithUUIDString:v26];
              [*(id *)(*(void *)&buf[8] + 40) setInstanceIdentifier:v32];
            }
            [v44 setObject:*(void *)(*(void *)&buf[8] + 40) forKey:v20];
          }
          else
          {
            if (+[MTStoreIdentifier isNotEmpty:v25])
            {
              id v33 = +[NSString stringWithFormat:@"%lld", v25];
              [v45 setObject:v20 forKey:v33];
            }
            else
            {
              id v34 = [obj firstObject];
              unsigned int v35 = [v34 isEqualToString:v20];

              if (v35) {
                *((unsigned char *)v69 + 24) = 1;
              }
              id v33 = _MTLogCategoryMediaRemote();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v72 = 134218242;
                id v73 = v25;
                __int16 v74 = 2112;
                uint64_t v75 = v20;
                _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Requested to play an item with no database match and no storeId: %lld with identifier: %@.", v72, 0x16u);
              }
            }
          }
          _Block_object_dispose(buf, 8);
        }
      }
      id v18 = [obj countByEnumeratingWithState:&v60 objects:v80 count:16];
    }
    while (v18);
  }

  v36 = objc_alloc_init(MTPlayerItem);
  if ([v45 count])
  {
    uint64_t v37 = [v45 allKeys];
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_10008B1E8;
    v50[3] = &unk_10054EDD0;
    id v51 = v45;
    id v52 = v44;
    id v55 = v43;
    id v53 = obj;
    v54 = v36;
    v56 = &v68;
    +[MTNetworkMediaManifest fetchPlayerItemsFor:v37 completion:v50];

    id v38 = v51;
LABEL_44:

    goto LABEL_45;
  }
  if (v43)
  {
    id v39 = [v44 objectsForKeys:obj notFoundMarker:v36];
    id v38 = [v39 mutableCopy];

    [v38 removeObject:v36];
    id v40 = _MTLogCategoryMediaRemote();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      id v41 = [v38 count];
      id v42 = [obj count];
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = v41;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v42;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Fetched %lu player items for %lu identifiers", buf, 0x16u);
    }

    (*((void (**)(id, id, void, void))v43 + 2))(v43, v38, *((unsigned __int8 *)v69 + 24), 0);
    goto LABEL_44;
  }
LABEL_45:

  _Block_object_dispose(&v68, 8);
}

- (id)requestIdentifierForPlayerItem:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v26 = +[NSString stringWithFormat:@"podcasts://%@", @"playItem"];
    id v25 = +[NSURL URLWithString:](NSURL, "URLWithString:");
    id v4 = objc_opt_new();
    id v5 = [v3 contentItem];
    id v6 = [v5 identifier];

    uint64_t v7 = (uint64_t)[v3 episodeStoreId];
    uint64_t v8 = (uint64_t)[v3 podcastStoreId];
    id v9 = [v3 episodeUuid];
    uint64_t v10 = [v3 episodeGuid];
    v11 = [v3 podcastFeedUrl];
    v24 = [v11 pf_stringWithPercentEscape];

    id v12 = [v3 title];
    uint64_t v23 = [v3 author];
    unsigned __int8 v13 = [v3 streamUrl];
    long long v14 = [v13 absoluteString];
    id v27 = [v14 pf_stringWithPercentEscape];

    [v3 playhead];
    double v16 = v15;

    if ([v6 length]) {
      [v4 setObject:v6 forKey:@"contentItemId"];
    }
    if (v7 >= 1)
    {
      long long v17 = +[NSString stringWithFormat:@"%lld", v7];
      [v4 setObject:v17 forKey:@"storeTrackId"];
    }
    if (v8 >= 1)
    {
      id v18 = +[NSString stringWithFormat:@"%lld", v8];
      [v4 setObject:v18 forKey:@"storeCollectionId"];
    }
    if ([v9 length]) {
      [v4 setObject:v9 forKey:@"episodeUuid"];
    }
    if ([v10 length]) {
      [v4 setObject:v10 forKey:@"episodeGuid"];
    }
    if ([v24 length]) {
      [v4 setObject:v24 forKey:@"podcastFeedUrl"];
    }
    if ([v12 length]) {
      [v4 setObject:v12 forKey:@"episodeTitle"];
    }
    if ([v23 length]) {
      [v4 setObject:v23 forKey:@"podcastTitle"];
    }
    if ([v27 length]) {
      [v4 setObject:v27 forKey:@"streamUrl"];
    }
    if (v16 > 0.0)
    {
      id v19 = +[NSString stringWithFormat:@"%f", *(void *)&v16];
      [v4 setObject:v19 forKey:@"playhead"];
    }
    uint64_t v20 = [v25 pf_URLByAppendingQueryParameters:v4];

    id v21 = [v20 absoluteString];
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

- (unint64_t)_playQueueTypeForRequestURL:(id)a3
{
  uint64_t v3 = qword_10060A6D8;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_10060A6D8, &stru_10054EDF0);
  }
  id v5 = (void *)qword_10060A6E0;
  id v6 = [v4 host];

  uint64_t v7 = [v5 objectForKeyedSubscript:v6];
  uint64_t v8 = (void *)v7;
  id v9 = &off_100579530;
  if (v7) {
    id v9 = (_UNKNOWN **)v7;
  }
  uint64_t v10 = v9;

  id v11 = [v10 unsignedIntegerValue];
  return (unint64_t)v11;
}

- (id)_playbackRequestIdentifierWithHost:(id)a3 queryKey:(id)a4 value:(id)a5
{
  id v14 = a4;
  id v15 = a5;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];

  id v12 = [(MTPlaybackIdentifierUtil *)self _playbackRequestIdentifierWithHost:v10 queryComponents:v11];

  return v12;
}

- (id)_playbackRequestIdentifierWithHost:(id)a3 queryComponents:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSURLComponents);
  [v7 setScheme:@"podcasts"];
  uint64_t v20 = v5;
  [v7 setHost:v5];
  id v8 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        id v15 = objc_alloc((Class)NSURLQueryItem);
        double v16 = [v9 objectForKeyedSubscript:v14];
        id v17 = [v15 initWithName:v14 value:v16];

        [v8 addObject:v17];
      }
      id v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  [v7 setQueryItems:v8];
  id v18 = [v7 string];

  return v18;
}

- (int64_t)_episodeOrderFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:SAMPEpisodePlaybackOrderNEWEST_FIRSTValue])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:SAMPEpisodePlaybackOrderOLDEST_FIRSTValue])
  {
    int64_t v4 = 2;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (unint64_t)_playReasonFromString:(id)a3
{
  id v3 = a3;
  if ([v3 length]) {
    unint64_t v4 = MTPlayReasonFromPersistentString();
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (int64_t)_episodeContextFromString:(id)a3
{
  id v3 = a3;
  if ([v3 length]) {
    int64_t v4 = MTEpisodeContextFromPersistentString();
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (int64_t)_episodeContextSortFromString:(id)a3
{
  id v3 = a3;
  if ([v3 length]) {
    int64_t v4 = MTEpisodeContextSortTypeFromPersistentString();
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

+ (id)__stringWithPercentEscape:(id)a3
{
  id v3 = (__CFString *)CFURLCreateStringByAddingPercentEscapes(0, (CFStringRef)a3, 0, @"\uFFFC!$&'()+,/:;=?@",
                       0x8000100u);

  return v3;
}

+ (id)__stringByRemovingPercentEscapes:(id)a3
{
  id v3 = (__CFString *)CFURLCreateStringByReplacingPercentEscapes(kCFAllocatorDefault, (CFStringRef)a3, &stru_10056A8A0);

  return v3;
}

+ (id)__queryStringToQueryDictionary:(id)a3
{
  id v3 = [a3 componentsSeparatedByString:@"&"];
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = [*(id *)(*((void *)&v15 + 1) + 8 * i) componentsSeparatedByString:@"="];
        id v10 = [v9 objectAtIndex:0];
        id v11 = +[NSNull null];
        if ((unint64_t)[v9 count] >= 2)
        {
          uint64_t v12 = [v9 objectAtIndex:1];

          id v11 = (void *)v12;
        }
        [v4 setObject:v11 forKey:v10];
      }
      id v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return v4;
}

@end