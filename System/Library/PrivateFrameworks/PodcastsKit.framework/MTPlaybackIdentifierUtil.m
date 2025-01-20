@interface MTPlaybackIdentifierUtil
+ (id)__queryStringToQueryDictionary:(id)a3;
+ (id)__stringByRemovingPercentEscapes:(id)a3;
+ (id)__stringWithPercentEscape:(id)a3;
- (BOOL)isLocalSetPlaybackQueueURLString:(id)a3;
- (BOOL)isSubscribeCommandURLString:(id)a3;
- (BOOL)isUniversalPlaybackIdentifierURLString:(id)a3;
- (_MRSystemAppPlaybackQueue)playbackQueueWithAccountInfoForIdentifiers:(id)a3;
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
@end

@implementation MTPlaybackIdentifierUtil

- (id)playbackRequestURLWithPlayReason:(unint64_t)a3 baseRequestURLString:(id)a4
{
  v4 = [NSURL URLWithString:a4];
  v5 = objc_opt_class();
  v6 = [v4 query];
  v7 = objc_msgSend(v5, "__queryStringToQueryDictionary:", v6);

  v8 = NSPersistentStringForMTPlayReason();
  [v7 setObject:v8 forKey:@"playReason"];

  id v9 = objc_alloc_init(MEMORY[0x263F08BA0]);
  v10 = [v4 scheme];
  [v9 setScheme:v10];

  v11 = [v4 host];
  [v9 setHost:v11];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __82__MTPlaybackIdentifierUtil_playbackRequestURLWithPlayReason_baseRequestURLString___block_invoke;
  v16[3] = &unk_2650559F0;
  id v17 = v7;
  id v12 = v7;
  v13 = objc_msgSend(v12, "mt_compactMap:", v16);
  [v9 setQueryItems:v13];

  v14 = [v9 string];

  return v14;
}

id __82__MTPlaybackIdentifierUtil_playbackRequestURLWithPlayReason_baseRequestURLString___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x263F08BD0];
  id v4 = a2;
  id v5 = [v3 alloc];
  v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
  v7 = (void *)[v5 initWithName:v4 value:v6];

  return v7;
}

- (id)playbackRequestURLWithDSID:(id)a3 baseRequestURLString:(id)a4
{
  id v5 = a3;
  v6 = [NSURL URLWithString:a4];
  v7 = objc_opt_class();
  v8 = [v6 query];
  id v9 = objc_msgSend(v7, "__queryStringToQueryDictionary:", v8);

  v10 = [v5 stringValue];

  if (v10)
  {
    v11 = [v5 stringValue];
    [v9 setObject:v11 forKey:@"enqueuerDSID"];
  }
  id v12 = objc_alloc_init(MEMORY[0x263F08BA0]);
  v13 = [v6 scheme];
  [v12 setScheme:v13];

  v14 = [v6 host];
  [v12 setHost:v14];

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __76__MTPlaybackIdentifierUtil_playbackRequestURLWithDSID_baseRequestURLString___block_invoke;
  v19[3] = &unk_2650559F0;
  id v20 = v9;
  id v15 = v9;
  v16 = objc_msgSend(v15, "mt_compactMap:", v19);
  [v12 setQueryItems:v16];

  id v17 = [v12 string];

  return v17;
}

id __76__MTPlaybackIdentifierUtil_playbackRequestURLWithDSID_baseRequestURLString___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x263F08BD0];
  id v4 = a2;
  id v5 = [v3 alloc];
  v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
  v7 = (void *)[v5 initWithName:v4 value:v6];

  return v7;
}

- (BOOL)isLocalSetPlaybackQueueURLString:(id)a3
{
  v3 = [NSURL URLWithString:a3];
  id v4 = [v3 host];
  if ([v4 length])
  {
    if (isLocalSetPlaybackQueueURLString__onceToken != -1) {
      dispatch_once(&isLocalSetPlaybackQueueURLString__onceToken, &__block_literal_global_2);
    }
    char v5 = [(id)isLocalSetPlaybackQueueURLString__commandsSupported containsObject:v4];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

void __61__MTPlaybackIdentifierUtil_isLocalSetPlaybackQueueURLString___block_invoke()
{
  v2[3] = *MEMORY[0x263EF8340];
  v2[0] = @"playPodcast";
  v2[1] = @"playPodcasts";
  v2[2] = @"playStation";
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:3];
  v1 = (void *)isLocalSetPlaybackQueueURLString__commandsSupported;
  isLocalSetPlaybackQueueURLString__commandsSupported = v0;
}

- (BOOL)isSubscribeCommandURLString:(id)a3
{
  v3 = [NSURL URLWithString:a3];
  id v4 = [v3 host];
  char v5 = [v4 isEqualToString:@"subscribe"];

  return v5;
}

- (BOOL)isUniversalPlaybackIdentifierURLString:(id)a3
{
  v3 = [NSURL URLWithString:a3];
  id v4 = [v3 host];
  char v5 = [v4 isEqualToString:@"playItem"];

  return v5;
}

- (id)playbackQueueIdentifierForPlayMyPodcastsWithPlaybackOrder:(id)a3
{
  id v4 = a3;
  if (!v4) {
    id v4 = (id)*MEMORY[0x263F659F8];
  }
  char v5 = [(MTPlaybackIdentifierUtil *)self _playbackRequestIdentifierWithHost:@"playPodcasts" queryKey:@"playbackOrder" value:v4];

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
  return [(MTPlaybackIdentifierUtil *)self universalPlaybackQueueIdentifierForPodcastUuid:a3 podcastFeedUrl:a4 podcastStoreId:a5 episodeUuid:0 episodeGuid:0 episodeStoreId:0 sampPlaybackOrder:*MEMORY[0x263F659F8]];
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
  return [(MTPlaybackIdentifierUtil *)self _universalPlaybackQueueIdentifierForPodcastUuid:a3 podcastFeedUrl:a4 podcastStoreId:a5 episodeUuid:a6 episodeGuid:a7 episodeStoreId:a8 context:a9 contextSortType:a10 sampPlaybackOrder:*MEMORY[0x263F659F8]];
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
    id v21 = (id)*MEMORY[0x263F659F8];

    id v20 = v21;
  }
  uint64_t v22 = [v18 length];
  uint64_t v23 = [v16 length];
  v24 = [MEMORY[0x263EFF9A0] dictionary];
  [v24 setObject:v20 forKey:@"playbackOrder"];
  if (!v23)
  {
    if (!v22) {
      goto LABEL_11;
    }
    v25 = [MEMORY[0x263F5E9D0] sharedInstance];
    v26 = [v25 mainOrPrivateContext];

    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__2;
    v45 = __Block_byref_object_dispose__2;
    id v46 = 0;
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __187__MTPlaybackIdentifierUtil__universalPlaybackQueueIdentifierForPodcastUuid_podcastFeedUrl_podcastStoreId_episodeUuid_episodeGuid_episodeStoreId_context_contextSortType_sampPlaybackOrder___block_invoke;
    v37[3] = &unk_265055788;
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
    v28 = objc_msgSend((id)objc_opt_class(), "__stringWithPercentEscape:", v17);
    [v24 setObject:v28 forKey:@"podcastFeedUrl"];
  }
  if ([v19 length]) {
    [v24 setObject:v19 forKey:@"episodeGuid"];
  }
  uint64_t v29 = *MEMORY[0x263F5EBD0];
  if (a5 && v29 != a5)
  {
    v30 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", a5);
    [v24 setObject:v30 forKey:@"storeCollectionId"];
  }
  if (a8 && v29 != a8)
  {
    v31 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", a8);
    [v24 setObject:v31 forKey:@"storeTrackId"];
  }
  v32 = NSPersistentStringForMTEpisodeContext();
  [v24 setObject:v32 forKey:@"context"];

  v33 = NSPersistentStringForMTEpisodeContextSortType();
  [v24 setObject:v33 forKey:@"contextSortType"];

  v34 = [(MTPlaybackIdentifierUtil *)self _playbackRequestIdentifierWithHost:@"playPodcast" queryComponents:v24];

  return v34;
}

void __187__MTPlaybackIdentifierUtil__universalPlaybackQueueIdentifierForPodcastUuid_podcastFeedUrl_podcastStoreId_episodeUuid_episodeGuid_episodeStoreId_context_contextSortType_sampPlaybackOrder___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) episodeForUuid:*(void *)(a1 + 40)];
  v2 = [v6 podcast];
  uint64_t v3 = [v2 uuid];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  char v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)playbackQueueIdentifierForPodcastAdamId:(id)a3 sampPlaybackOrder:(id)a4
{
  v13[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (!v6) {
    id v6 = (id)*MEMORY[0x263F659F8];
  }
  v12[0] = @"storeCollectionId";
  v12[1] = @"playbackOrder";
  v13[0] = a3;
  v13[1] = v6;
  v7 = NSDictionary;
  id v8 = a3;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:v12 count:2];
  id v10 = [(MTPlaybackIdentifierUtil *)self _playbackRequestIdentifierWithHost:@"playPodcast" queryComponents:v9];

  return v10;
}

- (id)playbackQueueIdentifierForSubscribeToPodcast:(id)a3
{
  return [(MTPlaybackIdentifierUtil *)self _playbackRequestIdentifierWithHost:@"subscribe" queryKey:@"storeCollectionId" value:a3];
}

- (id)playbackQueueIdentifierForSubscribeToPodcastFeedUrl:(id)a3
{
  id v4 = a3;
  char v5 = objc_msgSend((id)objc_opt_class(), "__stringWithPercentEscape:", v4);

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
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  v14 = (void *)MEMORY[0x263EFF9A0];
  id v15 = a3;
  id v16 = [v14 dictionaryWithCapacity:5];
  [v16 setObject:v15 forKey:@"uuid"];

  if ([v11 length]) {
    [v16 setObject:v11 forKey:@"episodeUuid"];
  }
  if ([v12 length]) {
    [v16 setObject:v12 forKey:@"episodeGuid"];
  }
  if ([v13 length])
  {
    id v17 = objc_msgSend((id)objc_opt_class(), "__stringWithPercentEscape:", v13);
    [v16 setObject:v17 forKey:@"podcastFeedUrl"];
  }
  id v18 = [(MTPlaybackIdentifierUtil *)self _playbackRequestIdentifierWithHost:@"playStation" queryComponents:v16];

  return v18;
}

- (id)episodeUuidForSetPlaybackQueueRequestIdentifier:(id)a3
{
  uint64_t v3 = [NSURL URLWithString:a3];
  id v4 = objc_msgSend(v3, "pf_queryAsDictionary");
  id v5 = objc_alloc(MEMORY[0x263F5E9E8]);
  id v6 = [v4 objectForKeyedSubscript:@"storeTrackId"];
  objc_msgSend(v5, "setStoreTrackId:", objc_msgSend(v6, "longLongValue"));

  v7 = [v4 objectForKeyedSubscript:@"episodeUuid"];
  [v5 setUuid:v7];

  id v8 = [v4 objectForKeyedSubscript:@"episodeGuid"];
  [v5 setEpisodeGuid:v8];

  id v9 = [v4 objectForKeyedSubscript:@"episodeTitle"];
  id v10 = [v9 stringByRemovingPercentEscapes];
  [v5 setEpisodeTitle:v10];

  id v11 = [v4 objectForKeyedSubscript:@"podcastTitle"];
  id v12 = [v11 stringByRemovingPercentEscapes];
  [v5 setPodcastTitle:v12];

  id v13 = [v4 objectForKeyedSubscript:@"podcastFeedUrl"];
  v14 = [v13 stringByRemovingPercentEscapes];
  id v15 = [v14 stringByRemovingPercentEscapes];
  [v5 setPodcastFeedUrl:v15];

  id v16 = [v4 objectForKeyedSubscript:@"streamUrl"];
  id v17 = [v16 stringByRemovingPercentEscapes];
  id v18 = [v17 stringByRemovingPercentEscapes];
  [v5 setStreamUrl:v18];

  id v19 = [MEMORY[0x263F5E9F0] sharedInstance];
  id v20 = [v19 findEpisodeWithRequest:v5];

  id v21 = [v20 uuid];

  return v21;
}

- (id)podcastUuidForSetPlaybackQueueRequestIdentifier:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [NSURL URLWithString:v3];
  id v5 = objc_msgSend(v4, "pf_queryAsDictionary");
  id v6 = [v5 objectForKeyedSubscript:@"podcastFeedUrl"];
  v7 = [v6 stringByRemovingPercentEscapes];
  id v8 = [v7 stringByRemovingPercentEscapes];

  id v9 = [v5 objectForKeyedSubscript:@"storeCollectionId"];
  uint64_t v10 = [v9 longLongValue];

  id v11 = [NSNumber numberWithLongLong:v10];
  id v12 = [MEMORY[0x263F5E9D0] sharedInstance];
  id v13 = [v12 mainOrPrivateContext];

  v14 = (void *)[objc_alloc(MEMORY[0x263F5EA20]) initWithFeedUrl:v8 storeIdentifier:v11];
  id v15 = objc_alloc(MEMORY[0x263EFF260]);
  id v16 = (void *)[v15 initWithEntityName:*MEMORY[0x263F5EBB0]];
  id v17 = [MEMORY[0x263F5EA08] predicateForIdentifer:v14];
  [v16 setPredicate:v17];

  [v16 setFetchLimit:1];
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  id v38 = __Block_byref_object_copy__2;
  id v39 = __Block_byref_object_dispose__2;
  id v40 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__2;
  v33 = __Block_byref_object_dispose__2;
  id v34 = 0;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __76__MTPlaybackIdentifierUtil_podcastUuidForSetPlaybackQueueRequestIdentifier___block_invoke;
  v24[3] = &unk_265055A18;
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
      _os_log_impl(&dword_23F08F000, v20, OS_LOG_TYPE_ERROR, "Error fetching podcast for playback identifier: %@", buf, 0xCu);
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

void __76__MTPlaybackIdentifierUtil_podcastUuidForSetPlaybackQueueRequestIdentifier___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v4 + 40);
  id v5 = [v2 executeFetchRequest:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  id v6 = [v5 firstObject];
  uint64_t v7 = [v6 uuid];
  uint64_t v8 = *(void *)(a1[7] + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (_MRSystemAppPlaybackQueue)playbackQueueWithAccountInfoForIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = +[MTSingleton sharedInstance];
  id v6 = [v5 activeDsid];
  uint64_t v7 = [(MTPlaybackIdentifierUtil *)self playbackQueueWithDsid:v6 forIdentifiers:v4];

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
    CFDictionaryRef v7 = CFDictionaryCreate(0, (const void **)&keys, (const void **)&v9, 1, 0, MEMORY[0x263EFFF90]);
    MRSystemAppPlaybackQueueSetUserInfo();
    CFRelease(v7);
  }
  return v6;
}

- (unint64_t)_playQueueTypeForRequestURL:(id)a3
{
  uint64_t v3 = _playQueueTypeForRequestURL__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_playQueueTypeForRequestURL__onceToken, &__block_literal_global_99);
  }
  id v5 = (void *)_playQueueTypeForRequestURL__map;
  id v6 = [v4 host];

  uint64_t v7 = [v5 objectForKeyedSubscript:v6];
  uint64_t v8 = (void *)v7;
  id v9 = &unk_26F2D2980;
  if (v7) {
    id v9 = (void *)v7;
  }
  id v10 = v9;

  unint64_t v11 = [v10 unsignedIntegerValue];
  return v11;
}

void __56__MTPlaybackIdentifierUtil__playQueueTypeForRequestURL___block_invoke()
{
  v3[3] = *MEMORY[0x263EF8340];
  v2[0] = @"playPodcasts";
  v2[1] = @"playPodcast";
  v3[0] = &unk_26F2D2938;
  v3[1] = &unk_26F2D2950;
  v2[2] = @"playStation";
  v3[2] = &unk_26F2D2968;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:3];
  v1 = (void *)_playQueueTypeForRequestURL__map;
  _playQueueTypeForRequestURL__map = v0;
}

- (id)_playbackRequestIdentifierWithHost:(id)a3 queryKey:(id)a4 value:(id)a5
{
  v16[1] = *MEMORY[0x263EF8340];
  id v15 = a4;
  v16[0] = a5;
  uint64_t v8 = NSDictionary;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 dictionaryWithObjects:v16 forKeys:&v15 count:1];

  id v13 = [(MTPlaybackIdentifierUtil *)self _playbackRequestIdentifierWithHost:v11 queryComponents:v12];

  return v13;
}

- (id)_playbackRequestIdentifierWithHost:(id)a3 queryComponents:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263F08BA0]);
  [v7 setScheme:@"podcasts"];
  id v20 = v5;
  [v7 setHost:v5];
  uint64_t v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        id v15 = objc_alloc(MEMORY[0x263F08BD0]);
        id v16 = [v9 objectForKeyedSubscript:v14];
        id v17 = (void *)[v15 initWithName:v14 value:v16];

        [v8 addObject:v17];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
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
  if ([v3 isEqualToString:*MEMORY[0x263F65A00]])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F65A08]])
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
  id v3 = (__CFString *)CFURLCreateStringByReplacingPercentEscapes((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFStringRef)a3, &stru_26F2CCBC8);
  return v3;
}

+ (id)__queryStringToQueryDictionary:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = [a3 componentsSeparatedByString:@"&"];
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = [*(id *)(*((void *)&v15 + 1) + 8 * i) componentsSeparatedByString:@"="];
        uint64_t v10 = [v9 objectAtIndex:0];
        uint64_t v11 = [MEMORY[0x263EFF9D0] null];
        if ((unint64_t)[v9 count] >= 2)
        {
          uint64_t v12 = [v9 objectAtIndex:1];

          uint64_t v11 = (void *)v12;
        }
        [v4 setObject:v11 forKey:v10];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return v4;
}

@end