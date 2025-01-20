@interface VUIPlaybackReporterUTS
+ (BOOL)_shouldCacheResumeTimeForMediaType:(id)a3;
+ (id)sharedInstance;
+ (void)_cachePlaybackResumeTimeForReferenceID:(id)a3 canonicalID:(id)a4 absoluteResumeTime:(id)a5 featureRelativeResumeTime:(id)a6;
- (BOOL)_isTransitionValidForPlayer:(id)a3 fromState:(id)a4 toState:(id)a5;
- (BOOL)enforceSinglePlaybackSession;
- (VUIPlaybackReporterUTS)init;
- (VUIPlaybackUpNextConfig)playbackUpNextConfig;
- (WLKPlaybackReporter)reporter;
- (double)_completionFudgeFactor;
- (id)_createSessionForPlayer:(id)a3;
- (id)_wlkPlaybackRateForState:(id)a3 player:(id)a4;
- (int64_t)_wlkPlaybackStateForState:(id)a3;
- (void)_endSession:(id)a3;
- (void)_handleBgMCEmbeddedPlayerVCTransferredToFullScreenControllerNotification:(id)a3;
- (void)_handleBgMCWillStartPlaybackNotification:(id)a3;
- (void)_reportForPlayer:(id)a3 playerState:(id)a4 completionState:(unint64_t)a5 completionBlock:(id)a6;
- (void)_reportForSession:(id)a3 state:(id)a4 reason:(id)a5;
- (void)_reportLinearOrEBSForPlayer:(id)a3 isLinear:(BOOL)a4 playerState:(id)a5 completionState:(unint64_t)a6 completionBlock:(id)a7;
- (void)_reportSummary:(id)a3 sessionID:(id)a4 completion:(id)a5;
- (void)_reportVODForPlayer:(id)a3 playerState:(id)a4 completionState:(unint64_t)a5 completionBlock:(id)a6;
- (void)_setSessionMetadataValue:(id)a3 forKey:(id)a4 player:(id)a5;
- (void)dealloc;
- (void)reportForPlayer:(id)a3 completionState:(unint64_t)a4 completionBlock:(id)a5;
- (void)setPlaybackUpNextConfig:(id)a3;
- (void)setReporter:(id)a3;
@end

@implementation VUIPlaybackReporterUTS

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_19 != -1) {
    dispatch_once(&sharedInstance_onceToken_19, &__block_literal_global_92);
  }
  v2 = (void *)sharedInstance___instance_5;
  return v2;
}

void __40__VUIPlaybackReporterUTS_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(VUIPlaybackReporterUTS);
  v1 = (void *)sharedInstance___instance_5;
  sharedInstance___instance_5 = (uint64_t)v0;
}

- (VUIPlaybackReporterUTS)init
{
  v8.receiver = self;
  v8.super_class = (Class)VUIPlaybackReporterUTS;
  v2 = [(VUIPlaybackReporter *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:5 valueOptions:0 capacity:0];
    pendingPlayerProperties = v2->_pendingPlayerProperties;
    v2->_pendingPlayerProperties = (NSMapTable *)v3;

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel__handleBgMCWillStartPlaybackNotification_ name:@"VUIBackgroundMediaControllerWillStartPlaybackNotification" object:0];

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v2 selector:sel__handleBgMCEmbeddedPlayerVCTransferredToFullScreenControllerNotification_ name:@"VUIBackgroundMediaControllerEmbeddedPlayerViewControllerTransferredToFullScreenControllerNotification" object:0];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VUIPlaybackReporterUTS;
  [(VUIPlaybackReporter *)&v4 dealloc];
}

- (void)reportForPlayer:(id)a3 completionState:(unint64_t)a4 completionBlock:(id)a5
{
}

- (BOOL)enforceSinglePlaybackSession
{
  return 0;
}

- (id)_createSessionForPlayer:(id)a3
{
  id v4 = a3;
  v5 = [[VUIPlaybackReporterSession alloc] initWithPlayer:v4 context:0];
  v6 = [(NSMapTable *)self->_pendingPlayerProperties objectForKey:v4];
  if (v6)
  {
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    v22 = __50__VUIPlaybackReporterUTS__createSessionForPlayer___block_invoke;
    v23 = &unk_1E6DF8EE8;
    v24 = v5;
    [v6 enumerateKeysAndObjectsUsingBlock:&v20];
    [(NSMapTable *)self->_pendingPlayerProperties removeObjectForKey:v4];
  }
  v7 = [v4 currentMediaItem];
  objc_super v8 = [v7 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FB0]];
  v9 = [v7 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9F70]];
  int v10 = [v9 BOOLValue];

  if (v10)
  {
    v11 = VUIDefaultLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      v12 = "VUIPlaybackReporterUTS - UTS reporting disabled for adult content";
LABEL_10:
      _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v19, 2u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (([v8 isEqualToString:*MEMORY[0x1E4FAA1F0]] & 1) != 0
    || [v8 isEqualToString:*MEMORY[0x1E4FAA208]])
  {
    v11 = VUIDefaultLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      v12 = "VUIPlaybackReporterUTS - UTS reporting disabled for trailers/previews";
      goto LABEL_10;
    }
LABEL_11:

    uint64_t v13 = 0;
    goto LABEL_12;
  }
  if (v5)
  {
    uint64_t v15 = [(VUIPlaybackReporterSession *)v5 metadataForKey:@"VUIPlaybackReporterSessionMetadataKeyForegroundPlayback"];
    if (v15)
    {
      v16 = (void *)v15;
      v17 = [(VUIPlaybackReporterSession *)v5 metadataForKey:@"VUIPlaybackReporterSessionMetadataKeyForegroundPlayback"];
      char v18 = [v17 BOOLValue];

      if ((v18 & 1) == 0)
      {
        v11 = VUIDefaultLogObject();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_11;
        }
        LOWORD(v19) = 0;
        v12 = "VUIPlaybackReporterUTS - UTS reporting disabled for background playback";
        goto LABEL_10;
      }
    }
  }
  uint64_t v13 = 1;
LABEL_12:
  -[VUIPlaybackReporterSession setReportingEnabled:](v5, "setReportingEnabled:", v13, v19, v20, v21, v22, v23);

  return v5;
}

uint64_t __50__VUIPlaybackReporterUTS__createSessionForPlayer___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setMetadata:a3 forKey:a2];
}

- (void)_reportForSession:(id)a3 state:(id)a4 reason:(id)a5
{
  id v7 = a4;
  id v8 = [a3 player];
  [(VUIPlaybackReporterUTS *)self _reportForPlayer:v8 playerState:v7 completionState:0 completionBlock:0];
}

- (BOOL)_isTransitionValidForPlayer:(id)a3 fromState:(id)a4 toState:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (+[VUIPlaybackUtilities playerIsLive:v8])
  {
    id v11 = [MEMORY[0x1E4FA9D88] playing];
    if (v11 == v10)
    {
      id v14 = [MEMORY[0x1E4FA9D88] paused];

      if (v14 != v9)
      {
        unsigned __int8 v13 = 1;
        goto LABEL_8;
      }
    }
    else
    {
    }
    id v12 = [MEMORY[0x1E4FA9D88] stopped];
    unsigned __int8 v13 = v12 == v10;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)VUIPlaybackReporterUTS;
    unsigned __int8 v13 = [(VUIPlaybackReporter *)&v16 _isTransitionValidForPlayer:v8 fromState:v9 toState:v10];
  }
LABEL_8:

  return v13;
}

- (void)_endSession:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VUIPlaybackReporterUTS;
  id v4 = a3;
  [(VUIPlaybackReporter *)&v7 _endSession:v4];
  v5 = [(VUIPlaybackReporterUTS *)self reporter];
  v6 = [v4 UUID];

  [v5 endPlaybackSession:v6];
}

- (WLKPlaybackReporter)reporter
{
  reporter = self->_reporter;
  if (!reporter)
  {
    id v4 = (WLKPlaybackReporter *)objc_alloc_init(MEMORY[0x1E4FB5118]);
    v5 = self->_reporter;
    self->_reporter = v4;

    reporter = self->_reporter;
  }
  return reporter;
}

- (double)_completionFudgeFactor
{
  return 0.0;
}

- (VUIPlaybackUpNextConfig)playbackUpNextConfig
{
  playbackUpNextConfig = self->_playbackUpNextConfig;
  if (!playbackUpNextConfig)
  {
    id v4 = +[VUIFeaturesConfiguration sharedInstance];
    v5 = [v4 playbackUpNextConfig];

    v6 = self->_playbackUpNextConfig;
    self->_playbackUpNextConfig = v5;

    playbackUpNextConfig = self->_playbackUpNextConfig;
  }
  return playbackUpNextConfig;
}

- (void)_reportForPlayer:(id)a3 playerState:(id)a4 completionState:(unint64_t)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  unsigned __int8 v13 = [v10 currentMediaItem];
  if (+[VUIPlaybackUtilities playerIsLive:v10])
  {
    id v14 = [v13 mediaItemMetadataForProperty:@"VUIContentMetadataPlayableType"];
    int v15 = [v14 unsignedIntValue];

    if (v15 != 1)
    {
      objc_super v16 = [v13 mediaItemMetadataForProperty:@"VUIContentMetadataPlayableType"];
      int v17 = [v16 unsignedIntValue];

      if (v17 == 2)
      {
        char v18 = self;
        id v19 = v10;
        uint64_t v20 = 0;
LABEL_10:
        [(VUIPlaybackReporterUTS *)v18 _reportLinearOrEBSForPlayer:v19 isLinear:v20 playerState:v11 completionState:a5 completionBlock:v12];
        goto LABEL_11;
      }
      uint64_t v21 = VUIDefaultLogObject();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v22 = 0;
      }
    }
    char v18 = self;
    id v19 = v10;
    uint64_t v20 = 1;
    goto LABEL_10;
  }
  [(VUIPlaybackReporterUTS *)self _reportVODForPlayer:v10 playerState:v11 completionState:a5 completionBlock:v12];
LABEL_11:
}

- (void)_reportVODForPlayer:(id)a3 playerState:(id)a4 completionState:(unint64_t)a5 completionBlock:(id)a6
{
  v102[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, void))a6;
  unsigned __int8 v13 = VUIDefaultLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterUTS - VOD report", buf, 2u);
  }

  id v14 = [v10 currentMediaItem];
  int v15 = [v14 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E70]];
  if (v15) {
    goto LABEL_7;
  }
  objc_super v16 = VUIDefaultLogObject();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v16, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterUTS - No DSID specified in mediaItem. Falling back to active account", buf, 2u);
  }

  int v17 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  char v18 = objc_msgSend(v17, "ams_activeiTunesAccount");
  int v15 = objc_msgSend(v18, "ams_DSID");

  if (v15)
  {
LABEL_7:
    if (!v11)
    {
      id v11 = [v10 state];
    }
    int64_t v83 = [(VUIPlaybackReporterUTS *)self _wlkPlaybackStateForState:v11];
    v92 = [(VUIPlaybackReporterUTS *)self _wlkPlaybackRateForState:v11 player:v10];
    v85 = self;
    v89 = v15;
    if (a5)
    {
      if (a5 == 1)
      {
        uint64_t v19 = VUIDefaultLogObject();
        if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1E2BD7000, (os_log_t)v19, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterUTS - [CompletionState] State was specified: InProgress", buf, 2u);
        }
        uint64_t v20 = 1;
      }
      else
      {
        if (a5 != 2)
        {
          uint64_t v20 = 0;
LABEL_50:
          [v10 elapsedTime];
          double v43 = v42;
          v44 = [v14 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9F00]];
          uint64_t v45 = [v14 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9EF8]];
          v46 = (void *)v45;
          v93 = 0;
          if (v44 && v45)
          {
            [v44 doubleValue];
            double v48 = v43 - v47;
            if (v48 >= 0.0) {
              double v49 = v48;
            }
            else {
              double v49 = 0.0;
            }
            [v46 doubleValue];
            if (v49 < v50) {
              double v50 = v49;
            }
            v93 = [MEMORY[0x1E4F28ED0] numberWithDouble:v50];
          }
          v91 = v46;
          v82 = v44;
          v86 = v12;
          id v87 = v11;
          v51 = +[VUIAppReviewManager sharedInstance];
          v94[0] = MEMORY[0x1E4F143A8];
          v94[1] = 3221225472;
          v94[2] = __90__VUIPlaybackReporterUTS__reportVODForPlayer_playerState_completionState_completionBlock___block_invoke;
          v94[3] = &unk_1E6DF9390;
          uint64_t v90 = v20;
          uint64_t v96 = v20;
          id v88 = v10;
          id v52 = v10;
          id v95 = v52;
          [v51 isFeatureEnabled:v94];

          +[VideosUI getPlaybackElapsedTime];
          double v54 = v53;
          [v52 elapsedTime];
          if (v54 < v55)
          {
            [v52 elapsedTime];
            +[VideosUI markPlaybackElapsedTime:](_TtC8VideosUI8VideosUI, "markPlaybackElapsedTime:");
          }
          v56 = (void *)MEMORY[0x1E4FB5120];
          v81 = [MEMORY[0x1E4F28B50] mainBundle];
          v80 = [v81 bundleIdentifier];
          v57 = [v14 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E10]];
          v58 = [v14 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9ED8]];
          v59 = [v15 stringValue];
          v60 = [v14 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9EE0]];
          v61 = [MEMORY[0x1E4F1C9C8] date];
          v62 = v14;
          v63 = (void *)MEMORY[0x1E4F28ED0];
          [v52 duration];
          v64 = objc_msgSend(v63, "numberWithDouble:");
          v65 = (void *)MEMORY[0x1E4F28ED0];
          [v52 elapsedTime];
          v66 = objc_msgSend(v65, "numberWithDouble:");
          v84 = [v56 VODSummaryWithBundleID:v80 channelID:v57 contentID:v58 accountID:v59 externalProfileID:v60 timestamp:v61 duration:v64 elapsedTime:v66 featureDuration:v91 featureElapsedTime:v93 playbackState:v83 playbackRate:v92 completionState:v90];

          id v14 = v62;
          v67 = v52;

          if (![(id)objc_opt_class() _shouldCacheResumeTimeForMediaType:v62]) {
            goto LABEL_69;
          }
          v68 = (void *)MEMORY[0x1E4F28ED0];
          [v52 elapsedTime];
          v69 = objc_msgSend(v68, "numberWithDouble:");
          v70 = [v62 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA008]];
          v71 = [v62 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E28]];
          if (v90)
          {
            if (v90 != 2) {
              goto LABEL_66;
            }
          }
          else
          {
            v72 = (void *)MEMORY[0x1E4FB5120];
            [v67 duration];
            double v74 = v73;
            [v67 elapsedTime];
            uint64_t v76 = [v72 completionStateForDuration:v74 elapsedTime:v75];
            if (v76 != 2)
            {
              if (v76 != 1)
              {
LABEL_68:

LABEL_69:
                v78 = [(VUIPlaybackReporter *)v85 _sessionForPlayer:v67];
                v79 = [v78 UUID];

                id v12 = v86;
                [(VUIPlaybackReporterUTS *)v85 _reportSummary:v84 sessionID:v79 completion:v86];

                id v11 = v87;
                id v10 = v88;
                v28 = v89;
                goto LABEL_70;
              }
LABEL_66:
              [(id)objc_opt_class() _cachePlaybackResumeTimeForReferenceID:v70 canonicalID:v71 absoluteResumeTime:v69 featureRelativeResumeTime:v93];
              goto LABEL_68;
            }
          }
          v77 = +[VUIStreamingBookmarkCache sharedInstance];
          [v77 removeBookmarkForReferenceID:v70];

          goto LABEL_68;
        }
        uint64_t v19 = VUIDefaultLogObject();
        if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          uint64_t v20 = 2;
          _os_log_impl(&dword_1E2BD7000, (os_log_t)v19, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterUTS - [CompletionState] State was specified: Done", buf, 2u);
        }
        else
        {
          uint64_t v20 = 2;
        }
      }
    }
    else
    {
      uint64_t v21 = [v10 currentMediaItem];
      uint64_t v19 = [v21 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FE0]];

      v22 = [v10 currentMediaItem];
      uint64_t v23 = [v22 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA120]];

      if (v19 | v23)
      {
        objc_opt_class();
        double v24 = 0.0;
        if ((objc_opt_isKindOfClass() & 1) != 0 && ([(id)v19 isEqualToNumber:&unk_1F3F3D178] & 1) == 0)
        {
          [(id)v19 doubleValue];
          double v32 = v31;
          [(VUIPlaybackReporterUTS *)self _completionFudgeFactor];
          double v24 = v32 - v33;
          objc_msgSend(NSString, "stringWithFormat:", @"[PostPlay:%.3f]", v32 - v33);
          v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v25 = &stru_1F3E921E0;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && ([(id)v23 isEqualToNumber:&unk_1F3F3D178] & 1) == 0)
        {
          [(id)v23 doubleValue];
          double v35 = v34;
          if (v24 == 0.0 || v34 < v24)
          {
            uint64_t v36 = objc_msgSend(NSString, "stringWithFormat:", @"[WatchedTime:%.3f]", *(void *)&v34);

            v25 = (__CFString *)v36;
            double v24 = v35;
          }
        }
        [v10 duration];
        double v38 = fmin(v37, v24);
        if (v38 == 0.0)
        {
          v30 = v25;
          v29 = VUIDefaultLogObject();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v98 = v19;
            __int16 v99 = 2112;
            uint64_t v100 = v23;
            _os_log_impl(&dword_1E2BD7000, v29, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterUTS - [CompletionState] HLS metadata is invalid. PostPlay:[%@] Watched:[%@]", buf, 0x16u);
          }
          uint64_t v20 = 0;
        }
        else
        {
          double v39 = v37;
          [v10 elapsedTime];
          if (v40 >= v38) {
            v41 = @" [Elapsed:%.3f] [Duration:%.3f] [Done]";
          }
          else {
            v41 = @" [Elapsed:%.3f] [Duration:%.3f] [InProgress]";
          }
          if (v40 < v38) {
            uint64_t v20 = 1;
          }
          else {
            uint64_t v20 = 2;
          }
          -[__CFString stringByAppendingFormat:](v25, "stringByAppendingFormat:", v41, *(void *)&v40, *(void *)&v39);
          v30 = (__CFString *)objc_claimAutoreleasedReturnValue();

          v29 = VUIDefaultLogObject();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v98 = (uint64_t)v30;
            _os_log_impl(&dword_1E2BD7000, v29, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterUTS - [CompletionState] State was derived from HLS metadata: %@", buf, 0xCu);
          }
        }
      }
      else
      {
        v29 = VUIDefaultLogObject();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1E2BD7000, v29, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterUTS - [CompletionState] State unknown", buf, 2u);
        }
        uint64_t v20 = 0;
        v30 = &stru_1F3E921E0;
      }

      int v15 = v89;
    }

    goto LABEL_50;
  }
  v26 = VUIDefaultLogObject();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v26, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterUTS - No DSID found. Will not report", buf, 2u);
  }

  if (v12)
  {
    v27 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v101 = *MEMORY[0x1E4F28568];
    v102[0] = @"DSID is missing";
    v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v102 forKeys:&v101 count:1];
    v92 = [v27 errorWithDomain:@"VUIPlaybackReporterUTS" code:101 userInfo:v28];
    v12[2](v12, 0);
LABEL_70:
  }
}

void __90__VUIPlaybackReporterUTS__reportVODForPlayer_playerState_completionState_completionBlock___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    double v3 = 1.0;
    if (*(void *)(a1 + 40) != 2)
    {
      [*(id *)(a1 + 32) duration];
      double v3 = 0.0;
      if (v4 > 0.0)
      {
        [*(id *)(a1 + 32) elapsedTime];
        double v6 = v5;
        [*(id *)(a1 + 32) duration];
        double v3 = v6 / v7;
      }
    }
    id v8 = +[VUIAppReviewManager sharedInstance];
    [v8 setMostRecentPlaybackProgressForNonTrailerContent:v3];
  }
}

- (void)_reportLinearOrEBSForPlayer:(id)a3 isLinear:(BOOL)a4 playerState:(id)a5 completionState:(unint64_t)a6 completionBlock:(id)a7
{
  BOOL v9 = a4;
  v46[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = (void (**)(id, void, void *))a7;
  id v13 = a5;
  int64_t v14 = [(VUIPlaybackReporterUTS *)self _wlkPlaybackStateForState:v13];
  double v43 = [(VUIPlaybackReporterUTS *)self _wlkPlaybackRateForState:v13 player:v11];

  int v15 = [v11 currentMediaItem];
  objc_super v16 = [v15 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E70]];
  if (v16) {
    goto LABEL_5;
  }
  int v17 = VUIDefaultLogObject();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v17, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterUTS - No DSID specified in mediaItem. Falling back to active account", buf, 2u);
  }

  char v18 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  uint64_t v19 = objc_msgSend(v18, "ams_activeiTunesAccount");
  objc_super v16 = objc_msgSend(v19, "ams_DSID");

  if (v16)
  {
LABEL_5:
    uint64_t v20 = VUIDefaultLogObject();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    v41 = v15;
    double v42 = v12;
    int64_t v39 = v14;
    double v40 = self;
    if (v9)
    {
      if (v21)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v20, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterUTS - Linear report", buf, 2u);
      }

      v22 = (void *)MEMORY[0x1E4FB5120];
      double v38 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v23 = [v38 bundleIdentifier];
      double v24 = [v15 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E10]];
      v25 = [v15 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9EE8]];
      v26 = [v16 stringValue];
      v27 = [v15 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9EE0]];
      v28 = [MEMORY[0x1E4F1C9C8] date];
      [v11 playbackDate];
      v30 = id v29 = v11;
      uint64_t v31 = [v22 liveSummaryWithBundleID:v23 channelID:v24 serviceID:v25 accountID:v26 externalProfileID:v27 timestamp:v28 playbackState:v39 playbackRate:v43 currentPlaybackDate:v30];
    }
    else
    {
      if (v21)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v20, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterUTS - EBS report", buf, 2u);
      }

      double v32 = (void *)MEMORY[0x1E4FB5120];
      double v38 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v23 = [v38 bundleIdentifier];
      double v24 = [v15 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E10]];
      v25 = [v15 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9ED8]];
      v26 = [v16 stringValue];
      v27 = [v15 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9EE0]];
      v28 = [MEMORY[0x1E4F1C9C8] date];
      [v11 playbackDate];
      v30 = id v29 = v11;
      uint64_t v31 = [v32 EBSSummaryWithBundleID:v23 channelID:v24 externalId:v25 accountID:v26 externalProfileID:v27 timestamp:v28 playbackState:v39 playbackRate:v43 currentPlaybackDate:v30];
    }
    double v33 = (void *)v31;

    double v34 = [(VUIPlaybackReporter *)v40 _sessionForPlayer:v29];
    double v35 = [v34 UUID];

    id v12 = v42;
    [(VUIPlaybackReporterUTS *)v40 _reportSummary:v33 sessionID:v35 completion:v42];

    id v11 = v29;
    int v15 = v41;
    goto LABEL_13;
  }
  uint64_t v36 = VUIDefaultLogObject();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v36, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterUTS - No DSID found. Will not report", buf, 2u);
  }

  if (v12)
  {
    double v37 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v45 = *MEMORY[0x1E4F28568];
    v46[0] = @"DSID is missing";
    objc_super v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];
    double v33 = [v37 errorWithDomain:@"VUIPlaybackReporterUTS" code:101 userInfo:v16];
    v12[2](v12, 0, v33);
LABEL_13:
  }
}

- (void)_reportSummary:(id)a3 sessionID:(id)a4 completion:(id)a5
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    id v11 = [v8 contentID];
    if (v11) {
      [v8 contentID];
    }
    else {
    int64_t v14 = [v8 serviceID];
    }

    objc_super v16 = [(VUIPlaybackReporterUTS *)self reporter];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __62__VUIPlaybackReporterUTS__reportSummary_sessionID_completion___block_invoke;
    v18[3] = &unk_1E6DF49E8;
    id v19 = v10;
    [v16 reportPlayback:v8 sessionID:v9 completion:v18];

    int v17 = VUIDefaultLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      BOOL v21 = v14;
      __int16 v22 = 2112;
      id v23 = v9;
      __int16 v24 = 2112;
      id v25 = v8;
      _os_log_impl(&dword_1E2BD7000, v17, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterUTS - Report sent for [%@] [%@] %@", buf, 0x20u);
    }

    int v15 = v19;
    goto LABEL_12;
  }
  id v12 = VUIDefaultLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterUTS - Playback summary is nil", buf, 2u);
  }

  if (v10)
  {
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = *MEMORY[0x1E4F28568];
    v27[0] = @"Playback summary is nil";
    int64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    int v15 = [v13 errorWithDomain:@"VUIPlaybackReporterUTS" code:100 userInfo:v14];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v15);
LABEL_12:
  }
}

void __62__VUIPlaybackReporterUTS__reportSummary_sessionID_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  double v6 = +[VUIFeaturesConfiguration sharedInstance];
  double v7 = [v6 playbackUpNextConfig];
  [v7 documentUpdateOffsetInterval];
  dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__VUIPlaybackReporterUTS__reportSummary_sessionID_completion___block_invoke_2;
  block[3] = &unk_1E6DF7A98;
  id v10 = *(id *)(a1 + 32);
  char v15 = a2;
  id v13 = v5;
  id v14 = v10;
  id v11 = v5;
  dispatch_after(v9, MEMORY[0x1E4F14428], block);
}

uint64_t __62__VUIPlaybackReporterUTS__reportSummary_sessionID_completion___block_invoke_2(uint64_t result)
{
  if (*(void *)(result + 40))
  {
    uint64_t v1 = result;
    v2 = VUIDefaultLogObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v3 = 0;
      _os_log_impl(&dword_1E2BD7000, v2, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterUTS - Calling _reportSummary completion", v3, 2u);
    }

    return (*(uint64_t (**)(void))(*(void *)(v1 + 40) + 16))();
  }
  return result;
}

- (int64_t)_wlkPlaybackStateForState:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4FA9D88] playing];

  if (v4 == v3)
  {
    int64_t v11 = 1;
    goto LABEL_10;
  }
  uint64_t v5 = [MEMORY[0x1E4FA9D88] paused];
  double v6 = v3;
  if ((id)v5 == v3) {
    goto LABEL_8;
  }
  double v7 = (void *)v5;
  uint64_t v8 = [MEMORY[0x1E4FA9D88] loading];
  if ((id)v8 == v3)
  {

    double v6 = v7;
LABEL_8:

    goto LABEL_9;
  }
  dispatch_time_t v9 = (void *)v8;
  id v10 = [MEMORY[0x1E4FA9D88] scanning];

  if (v10 == v3)
  {
LABEL_9:
    int64_t v11 = 2;
    goto LABEL_10;
  }
  int64_t v11 = 0;
LABEL_10:

  return v11;
}

- (id)_wlkPlaybackRateForState:(id)a3 player:(id)a4
{
  id v5 = a4;
  double v6 = (void *)MEMORY[0x1E4FA9D88];
  id v7 = a3;
  id v8 = [v6 playing];

  if (v8 == v7)
  {
    id v10 = (void *)MEMORY[0x1E4F28ED0];
    [v5 rateUsedForPlayback];
    dispatch_time_t v9 = objc_msgSend(v10, "numberWithDouble:");
  }
  else
  {
    dispatch_time_t v9 = &unk_1F3F3D178;
  }

  return v9;
}

- (void)_handleBgMCWillStartPlaybackNotification:(id)a3
{
  id v11 = a3;
  id v4 = [v11 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  double v6 = v11;
  if (isKindOfClass)
  {
    id v7 = [v11 object];
    id v8 = [v7 player];
    dispatch_time_t v9 = [v11 userInfo];
    id v10 = [v9 objectForKeyedSubscript:@"VUIBackgroundMediaControllerIsForegroundedKey"];
    if (v10) {
      [(VUIPlaybackReporterUTS *)self _setSessionMetadataValue:v10 forKey:@"VUIPlaybackReporterSessionMetadataKeyForegroundPlayback" player:v8];
    }

    double v6 = v11;
  }
}

- (void)_handleBgMCEmbeddedPlayerVCTransferredToFullScreenControllerNotification:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [v4 object];
    id v8 = [(VUIPlaybackReporter *)self _sessionForPlayer:v7];
    dispatch_time_t v9 = v8;
    if (v8)
    {
      [v8 setMetadata:MEMORY[0x1E4F1CC38] forKey:@"VUIPlaybackReporterSessionMetadataKeyForegroundPlayback"];
      [v9 setReportingEnabled:1];
      id v10 = VUIDefaultLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        id v13 = v7;
        _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterUTS - Initiating report for player - %@ after being transferred to full screen controller", (uint8_t *)&v12, 0xCu);
      }

      id v11 = [v7 state];
      [(VUIPlaybackReporterUTS *)self _reportForPlayer:v7 playerState:v11 completionState:0 completionBlock:0];
    }
  }
}

- (void)_setSessionMetadataValue:(id)a3 forKey:(id)a4 player:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(VUIPlaybackReporter *)self _sessionForPlayer:v9];
  id v11 = v10;
  if (v10)
  {
    [v10 setMetadata:v13 forKey:v8];
  }
  else if (v8)
  {
    id v12 = [(NSMapTable *)self->_pendingPlayerProperties objectForKey:v9];
    if (!v12) {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    if (v13) {
      [v12 setObject:v13 forKey:v8];
    }
    else {
      [v12 removeObjectForKey:v8];
    }
    [(NSMapTable *)self->_pendingPlayerProperties setObject:v12 forKey:v9];
  }
}

+ (BOOL)_shouldCacheResumeTimeForMediaType:(id)a3
{
  id v3 = [a3 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FB0]];
  if (([v3 isEqualToString:*MEMORY[0x1E4FAA200]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4FAA1E8]] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:*MEMORY[0x1E4FAA1F8]];
  }

  return v4;
}

+ (void)_cachePlaybackResumeTimeForReferenceID:(id)a3 canonicalID:(id)a4 absoluteResumeTime:(id)a5 featureRelativeResumeTime:(id)a6
{
  if (a3 && a4 && a5)
  {
    id v9 = (void *)MEMORY[0x1E4F1C9C8];
    id v10 = a6;
    id v11 = a5;
    id v12 = a4;
    id v13 = a3;
    id v15 = [v9 date];
    uint64_t v14 = +[VUIStreamingBookmarkCache sharedInstance];
    [v14 addBookmarkForReferenceID:v13 canonicalID:v12 absoluteResumeTime:v11 absoluteBookmarkTimestamp:v15 relativeResumeTime:v10 relativeBookmarkTimestamp:v15];
  }
}

- (void)setReporter:(id)a3
{
}

- (void)setPlaybackUpNextConfig:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackUpNextConfig, 0);
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_storeStrong((id *)&self->_pendingPlayerProperties, 0);
}

@end