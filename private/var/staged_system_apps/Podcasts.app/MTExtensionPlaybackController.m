@interface MTExtensionPlaybackController
+ (_MRSystemAppPlaybackQueue)playbackQueueForIdentifier:(id)a3 startPlayback:(BOOL)a4 assetInfo:(id)a5;
+ (void)_setPlaybackQueueWithIdentifier:(id)a3 startPlayback:(BOOL)a4 assetInfo:(id)a5 requesterSharedUserId:(id)a6 sharedUserIdFromPlayableITunesAccount:(id)a7 playerID:(id)a8 mrCompletion:(id)a9;
+ (void)getNowPlayingInfoForMagicMomentInfoCenterWithCompletion:(id)a3;
+ (void)setQueueWithPlaybackRequestIdentifier:(id)a3 assetInfo:(id)a4 requesterSharedUserId:(id)a5 sharedUserIdFromPlayableITunesAccount:(id)a6 mrCompletion:(id)a7;
+ (void)setQueueWithPlaybackRequestIdentifier:(id)a3 completion:(id)a4;
+ (void)setQueueWithPlaybackRequestIdentifier:(id)a3 mrCompletion:(id)a4;
+ (void)setQueueWithPlaybackRequestIdentifier:(id)a3 startPlayback:(BOOL)a4 assetInfo:(id)a5 requesterSharedUserId:(id)a6 sharedUserIdFromPlayableITunesAccount:(id)a7 completion:(id)a8;
+ (void)setQueueWithPlaybackRequestIdentifier:(id)a3 startPlayback:(BOOL)a4 assetInfo:(id)a5 requesterSharedUserId:(id)a6 sharedUserIdFromPlayableITunesAccount:(id)a7 mrCompletion:(id)a8;
- (MTExtensionPlaybackController)init;
- (NSMutableArray)magicMomentCompletionHandlers;
- (void)_getNowPlayingInfoAndCallPendingCompletions;
- (void)_playbackQueueChangedNotification:(id)a3;
- (void)populateMagicMomentInfoCenterWithPlaybackRequestIdentifier:(id)a3 mrCompletion:(id)a4;
- (void)setMagicMomentCompletionHandlers:(id)a3;
@end

@implementation MTExtensionPlaybackController

- (MTExtensionPlaybackController)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTExtensionPlaybackController;
  v2 = [(MTExtensionPlaybackController *)&v7 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"_playbackQueueChangedNotification:" name:kMRPlayerPlaybackQueueChangedNotification object:0];

    uint64_t v4 = objc_opt_new();
    magicMomentCompletionHandlers = v2->_magicMomentCompletionHandlers;
    v2->_magicMomentCompletionHandlers = (NSMutableArray *)v4;
  }
  return v2;
}

+ (void)setQueueWithPlaybackRequestIdentifier:(id)a3 completion:(id)a4
{
}

+ (void)setQueueWithPlaybackRequestIdentifier:(id)a3 startPlayback:(BOOL)a4 assetInfo:(id)a5 requesterSharedUserId:(id)a6 sharedUserIdFromPlayableITunesAccount:(id)a7 completion:(id)a8
{
  BOOL v11 = a4;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100148ED4;
  v15[3] = &unk_100552F80;
  id v16 = a8;
  id v14 = v16;
  [a1 setQueueWithPlaybackRequestIdentifier:a3 startPlayback:v11 assetInfo:a5 requesterSharedUserId:a6 sharedUserIdFromPlayableITunesAccount:a7 mrCompletion:v15];
}

+ (void)setQueueWithPlaybackRequestIdentifier:(id)a3 mrCompletion:(id)a4
{
}

+ (void)setQueueWithPlaybackRequestIdentifier:(id)a3 assetInfo:(id)a4 requesterSharedUserId:(id)a5 sharedUserIdFromPlayableITunesAccount:(id)a6 mrCompletion:(id)a7
{
}

+ (void)setQueueWithPlaybackRequestIdentifier:(id)a3 startPlayback:(BOOL)a4 assetInfo:(id)a5 requesterSharedUserId:(id)a6 sharedUserIdFromPlayableITunesAccount:(id)a7 mrCompletion:(id)a8
{
}

- (void)populateMagicMomentInfoCenterWithPlaybackRequestIdentifier:(id)a3 mrCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = sub_10005715C;
  v22 = sub_100057378;
  id v23 = objc_retainBlock(v7);
  id v8 = [(MTExtensionPlaybackController *)self magicMomentCompletionHandlers];
  objc_sync_enter(v8);
  v9 = (void *)v19[5];
  if (v9)
  {
    id v10 = objc_retainBlock(v9);
    [v8 addObject:v10];
  }
  MRMediaRemoteSetWantsNowPlayingNotifications();
  objc_sync_exit(v8);

  BOOL v11 = objc_opt_class();
  uint64_t v12 = kMTPodcastsMagicMomentsPlayerID;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100149120;
  v14[3] = &unk_100552FA8;
  id v13 = v8;
  id v16 = self;
  v17 = &v18;
  id v15 = v13;
  [v11 _setPlaybackQueueWithIdentifier:v6 startPlayback:1 assetInfo:0 requesterSharedUserId:0 sharedUserIdFromPlayableITunesAccount:0 playerID:v12 mrCompletion:v14];

  _Block_object_dispose(&v18, 8);
}

- (void)_playbackQueueChangedNotification:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  [v4 objectForKeyedSubscript:kMRNowPlayingPlayerPathUserInfoKey];

  MRNowPlayingPlayerPathGetPlayer();
  MRNowPlayingPlayerGetIdentifier();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if ([v5 isEqualToString:kMTPodcastsMagicMomentsPlayerID]) {
    [(MTExtensionPlaybackController *)self _getNowPlayingInfoAndCallPendingCompletions];
  }
}

- (void)_getNowPlayingInfoAndCallPendingCompletions
{
  objc_initWeak(&location, self);
  v2 = objc_opt_class();
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100149464;
  v3[3] = &unk_100552FD0;
  objc_copyWeak(&v4, &location);
  [v2 getNowPlayingInfoForMagicMomentInfoCenterWithCompletion:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

+ (void)getNowPlayingInfoForMagicMomentInfoCenterWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = dispatch_get_global_queue(0, 0);
  MRMediaRemoteGetLocalOrigin();
  id v5 = (const void *)MRNowPlayingClientCreate();
  id v6 = (const void *)MRNowPlayingPlayerCreate();
  MRNowPlayingPlayerPathCreate();
  if (v5) {
    CFRelease(v5);
  }
  if (v6) {
    CFRelease(v6);
  }
  MRPlaybackQueueRequestCreate();
  MRPlaybackQueueRequestSetIncludeMetadata();
  id v8 = v3;
  id v7 = v3;
  MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync();
}

+ (void)_setPlaybackQueueWithIdentifier:(id)a3 startPlayback:(BOOL)a4 assetInfo:(id)a5 requesterSharedUserId:(id)a6 sharedUserIdFromPlayableITunesAccount:(id)a7 playerID:(id)a8 mrCompletion:(id)a9
{
  BOOL v13 = a4;
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  if ([v15 length])
  {
    [a1 playbackQueueForIdentifier:v15 startPlayback:v13 assetInfo:v16];
    v21 = +[NSMutableDictionary dictionaryWithCapacity:2];
    v22 = v21;
    if (v17) {
      [v21 setObject:v17 forKey:@"requesterUserId"];
    }
    id v30 = v17;
    id v23 = v16;
    if (v18) {
      [v22 setObject:v18 forKey:@"sharedUserId"];
    }
    MRSystemAppPlaybackQueueSetUserInfo();
    v24 = dispatch_get_global_queue(0, 0);
    MRMediaRemoteGetLocalOrigin();
    v25 = (const void *)MRNowPlayingClientCreate();
    id v29 = v19;
    v26 = (const void *)MRNowPlayingPlayerCreate();
    MRNowPlayingPlayerPathCreate();
    if (v25) {
      CFRelease(v25);
    }
    id v16 = v23;
    if (v26) {
      CFRelease(v26);
    }
    uint64_t v33 = kMRMediaRemoteOptionAssistantSetQueueTrueCompletion;
    v34 = &off_100579FE0;
    v27 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    id v31 = v20;
    MRMediaRemoteSetAppPlaybackQueueForPlayer();

    id v19 = v29;
    id v17 = v30;
  }
  else
  {
    v28 = _MTLogCategoryPlayback();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Failed to set playback queue: empty playback request identifier provided", buf, 2u);
    }

    if (v20) {
      (*((void (**)(id, uint64_t, uint64_t))v20 + 2))(v20, 2, 7);
    }
  }
}

+ (_MRSystemAppPlaybackQueue)playbackQueueForIdentifier:(id)a3 startPlayback:(BOOL)a4 assetInfo:(id)a5
{
  id v6 = a5;
  id v10 = a3;
  id v7 = a3;
  +[NSArray arrayWithObjects:&v10 count:1];

  id v8 = (_MRSystemAppPlaybackQueue *)MRSystemAppPlaybackQueueCreate();
  MRSystemAppPlaybackQueueSetGenericTrackIdentifiers();
  MRSystemAppPlaybackQueueSetTracklistShuffleMode();
  MRSystemAppPlaybackQueueSetReplaceIntent();
  MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback();
  if (objc_msgSend(v6, "length", v10)) {
    MRSystemAppPlaybackQueueSetSiriAssetInfo();
  }

  return v8;
}

- (NSMutableArray)magicMomentCompletionHandlers
{
  return self->_magicMomentCompletionHandlers;
}

- (void)setMagicMomentCompletionHandlers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end