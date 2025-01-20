@interface IntentHandler
- (BOOL)_intentWantsPlaybackQueueIncludedInNowPlayingInfo:(id)a3;
- (MTExtensionPlaybackController)playbackController;
- (id)_playbackRequestURLForIntent:(id)a3;
- (id)_responseForCode:(int64_t)a3;
- (id)_responseForMediaRemoteStatus:(unsigned int)a3 error:(unsigned int)a4;
- (void)confirmPlayMedia:(id)a3 completion:(id)a4;
- (void)handlePlayMedia:(id)a3 completion:(id)a4;
- (void)setPlaybackController:(id)a3;
@end

@implementation IntentHandler

- (void)handlePlayMedia:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(IntentHandler *)self _playbackRequestURLForIntent:v6];
  if ([v8 length])
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10014DA0C;
    v12[3] = &unk_100553078;
    v12[4] = self;
    id v13 = v7;
    +[MTExtensionPlaybackController setQueueWithPlaybackRequestIdentifier:v8 mrCompletion:v12];
    v9 = v13;
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    v10 = _MTLogCategorySiri();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = [v6 mediaContainer];
      *(_DWORD *)buf = 134217984;
      id v15 = [v11 type];
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Siri Actions failed to play media.  Unhandled media container type: %lu", buf, 0xCu);
    }
    v9 = [(IntentHandler *)self _responseForCode:6];
    (*((void (**)(id, void *))v7 + 2))(v7, v9);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)confirmPlayMedia:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!os_feature_enabled_bluemoon())
  {
    if (!self->_playbackController)
    {
      v9 = objc_alloc_init(MTExtensionPlaybackController);
      playbackController = self->_playbackController;
      self->_playbackController = v9;
    }
    v11 = [v6 mediaContainer];
    id v8 = [v11 identifier];

    if ([v8 length])
    {
      v12 = [(IntentHandler *)self _playbackRequestURLForIntent:v6];
      id v13 = self->_playbackController;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10014DC3C;
      v15[3] = &unk_1005530A0;
      v15[4] = self;
      id v16 = v6;
      id v17 = v12;
      id v18 = v7;
      id v14 = v12;
      [(MTExtensionPlaybackController *)v13 populateMagicMomentInfoCenterWithPlaybackRequestIdentifier:v14 mrCompletion:v15];
    }
    else
    {
      if (!v7) {
        goto LABEL_10;
      }
      id v14 = [(IntentHandler *)self _responseForCode:6];
      (*((void (**)(id, id))v7 + 2))(v7, v14);
    }

    goto LABEL_10;
  }
  id v8 = [objc_alloc((Class)INPlayMediaIntentResponse) initWithCode:1 userActivity:0];
  (*((void (**)(id, id))v7 + 2))(v7, v8);
LABEL_10:
}

- (id)_playbackRequestURLForIntent:(id)a3
{
  id v3 = a3;
  v4 = [v3 mediaContainer];
  v5 = [v4 identifier];

  id v6 = [v3 mediaItems];
  id v7 = [v6 firstObject];
  id v8 = [v7 identifier];

  v9 = [[MTURLCommandRequest alloc] initWithURLString:v8];
  unint64_t v10 = [(MTURLCommandRequest *)v9 playQueueType];

  if (v10)
  {
    id v11 = v8;
LABEL_5:
    id v14 = v11;
    goto LABEL_6;
  }
  v12 = [[MTURLCommandRequest alloc] initWithURLString:v5];
  unint64_t v13 = [(MTURLCommandRequest *)v12 playQueueType];

  if (v13)
  {
    id v11 = v5;
    goto LABEL_5;
  }
  id v16 = [v3 mediaContainer];
  id v17 = [v16 type];

  if (v17 == (id)6)
  {
    id v18 = +[MTPlaybackIdentifierUtil sharedInstance];
    uint64_t v19 = [v18 localPlaybackQueueIdentifierForPodcastUuid:v5 episodeUuid:v8 sampPlaybackOrder:SAMPEpisodePlaybackOrderAPPLICATION_DEFAULTValue];
LABEL_13:
    id v14 = (void *)v19;

    goto LABEL_6;
  }
  v20 = [v3 mediaContainer];
  id v21 = [v20 type];

  if (v21 == (id)8)
  {
    id v18 = +[MTPlaybackIdentifierUtil sharedInstance];
    uint64_t v19 = [v18 localPlaybackQueueIdentifierForStationUuid:v5 episodeUuid:v8];
    goto LABEL_13;
  }
  id v14 = 0;
LABEL_6:

  return v14;
}

- (BOOL)_intentWantsPlaybackQueueIncludedInNowPlayingInfo:(id)a3
{
  id v3 = [a3 mediaContainer];
  v4 = [v3 identifier];
  unsigned __int8 v5 = [v4 containsString:@"&includePlaybackQueue=true"];

  return v5;
}

- (id)_responseForMediaRemoteStatus:(unsigned int)a3 error:(unsigned int)a4
{
  uint64_t v4 = 4;
  uint64_t v5 = 10;
  uint64_t v6 = 6;
  if (a3 == 1) {
    uint64_t v6 = 9;
  }
  if (a3 != 10) {
    uint64_t v5 = v6;
  }
  if (a3) {
    uint64_t v4 = v5;
  }
  if (a4) {
    uint64_t v7 = 6;
  }
  else {
    uint64_t v7 = v4;
  }
  id v8 = [(IntentHandler *)self _responseForCode:v7];

  return v8;
}

- (id)_responseForCode:(int64_t)a3
{
  id v3 = [objc_alloc((Class)INPlayMediaIntentResponse) initWithCode:a3 userActivity:0];

  return v3;
}

- (MTExtensionPlaybackController)playbackController
{
  return self->_playbackController;
}

- (void)setPlaybackController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end