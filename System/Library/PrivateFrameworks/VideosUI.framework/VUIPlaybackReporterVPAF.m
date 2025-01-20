@interface VUIPlaybackReporterVPAF
+ (id)sharedInstance;
- (BOOL)_isDelegatedForPlayer:(id)a3;
- (BOOL)enforceSinglePlaybackSession;
- (VUIPlaybackReporterVPAF)init;
- (id)_audioFormatForPlayer:(id)a3 session:(id)a4;
- (id)_audioInfoForPlayer:(id)a3;
- (id)_colorRangeForPlayer:(id)a3;
- (id)_connectionInfo;
- (id)_createSessionForPlayer:(id)a3;
- (id)_delegatedInfoForPlayer:(id)a3;
- (id)_downloadInfoForPlayer:(id)a3;
- (id)_focusInfoForSession:(id)a3;
- (id)_metricsForPlayer:(id)a3 session:(id)a4;
- (id)_metricsForSession:(id)a3;
- (id)_playHeadDescriptionForTimeInMS:(unint64_t)a3 playbackDate:(id)a4;
- (id)_screenInfo;
- (id)_sensitiveContentInfoForPlayer:(id)a3;
- (id)_skipIntroActionForSession:(id)a3 consume:(BOOL)a4;
- (id)_subtitleInfoForPlayer:(id)a3;
- (id)_trackerWithBaseEventDataForSession:(id)a3;
- (id)_videoDisplayInfoForSession:(id)a3;
- (unint64_t)_capPlayHeadIfNeeded:(unint64_t)a3 forSession:(id)a4;
- (void)_applicationDidEnterBackground:(id)a3;
- (void)_applicationWillResignActive:(id)a3;
- (void)_catchUpToLiveDidBegin:(id)a3;
- (void)_catchUpToLiveDidEnd:(id)a3;
- (void)_catchUpToLiveItemDidChange:(id)a3;
- (void)_catchUpToLiveItemWillChange:(id)a3;
- (void)_createPlaybackDatePollingTimerForLiveStream:(id)a3;
- (void)_endSession:(id)a3;
- (void)_flushUnreportedEventsAfterDelay:(double)a3;
- (void)_handleBackgroundEnterPIPChange:(id)a3;
- (void)_handleBackgroundExitPIPChange:(id)a3;
- (void)_handleBgMCEmbeddedPlayerVCTransferredToFullScreenControllerNotification:(id)a3;
- (void)_handleDisplaySizeChange:(id)a3;
- (void)_handleIsPlaybackUIBeingShownDidChange:(id)a3;
- (void)_handleMediaControllerNotification:(id)a3;
- (void)_handlePIPChange:(id)a3;
- (void)_handleSkipIntro_iOS:(id)a3;
- (void)_invalidatePlaybackDatePollingTimerForLiveStream:(id)a3;
- (void)_liveSportsPostPlayAutoPlayWillStart:(id)a3;
- (void)_playerCurrentMediaItemWillSeek:(id)a3;
- (void)_reportForSession:(id)a3 state:(id)a4 reason:(id)a5;
- (void)_reportSeekStopAtTimeInMS:(unint64_t)a3 playbackDate:(id)a4 session:(id)a5 tracker:(id)a6 player:(id)a7;
- (void)_setSessionMetadataValue:(id)a3 forKey:(id)a4 player:(id)a5;
- (void)dealloc;
- (void)flushUnreportedEvents;
@end

@implementation VUIPlaybackReporterVPAF

- (VUIPlaybackReporterVPAF)init
{
  v26.receiver = self;
  v26.super_class = (Class)VUIPlaybackReporterVPAF;
  v2 = [(VUIPlaybackReporter *)&v26 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:5 valueOptions:0 capacity:0];
    pendingPlayerProperties = v2->_pendingPlayerProperties;
    v2->_pendingPlayerProperties = (NSMapTable *)v3;

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel__playerCurrentMediaItemWillSeek_ name:*MEMORY[0x1E4FAA3F0] object:0];

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v2 selector:sel__handleMediaControllerNotification_ name:@"VUIBackgroundMediaControllerWillStartPlaybackNotification" object:0];

    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v2 selector:sel__handleMediaControllerNotification_ name:@"VUIBackgroundMediaControllerWillStopPlaybackNotification" object:0];

    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v2 selector:sel__handleDisplaySizeChange_ name:@"VUIBackgroundMediaControllerVideoDisplaySizeDidChangeNotification" object:0];

    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v2 selector:sel__handleMediaControllerNotification_ name:@"VUIBackgroundMediaControllerForegroundStateDidChangeNotification" object:0];

    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v2 selector:sel__handleBgMCEmbeddedPlayerVCTransferredToFullScreenControllerNotification_ name:@"VUIBackgroundMediaControllerEmbeddedPlayerViewControllerTransferredToFullScreenControllerNotification" object:0];

    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v2 selector:sel__catchUpToLiveItemWillChange_ name:@"VUICatchUpToLiveIndexWillChangeNotification" object:0];

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v2 selector:sel__catchUpToLiveItemDidChange_ name:@"VUICatchUpToLiveIndexDidChangeNotification" object:0];

    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v2 selector:sel__catchUpToLiveDidBegin_ name:@"VUICatchUpToLiveDidTransitionFromFullscreenNotification" object:0];

    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:v2 selector:sel__catchUpToLiveDidEnd_ name:@"VUICatchUpToLiveDidTransitionToFullscreenNotification" object:0];

    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v2 selector:sel__liveSportsPostPlayAutoPlayWillStart_ name:@"VUILiveSportsPostPlayAutoPlayWillStartNotification" object:0];

    v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:v2 selector:sel__handleSkipIntro_iOS_ name:VUIPlaybackManagerWillSkipIntroNotification[0] object:0];

    v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v2 selector:sel__handlePIPChange_ name:VUIPlaybackManagerIsPIPingDidChangeNotification[0] object:0];

    v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:v2 selector:sel__handleBackgroundEnterPIPChange_ name:@"VUIBackgroundMediaControllerDidEnterPIPNotification" object:0];

    v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v19 addObserver:v2 selector:sel__handleBackgroundExitPIPChange_ name:@"VUIBackgroundMediaControllerDidStopPIPNotification" object:0];

    v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v20 addObserver:v2 selector:sel__handleDisplaySizeChange_ name:VUIPlaybackManagerVideoDisplaySizeDidChange[0] object:0];

    v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v21 addObserver:v2 selector:sel__handleIsPlaybackUIBeingShownDidChange_ name:VUIPlaybackManagerIsPlaybackUIBeingShownDidChange[0] object:0];

    v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v22 addObserver:v2 selector:sel__applicationDidEnterBackground_ name:*MEMORY[0x1E4FB2640] object:0];

    v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v23 addObserver:v2 selector:sel__applicationWillResignActive_ name:*MEMORY[0x1E4FB2738] object:0];

    v24 = VUIVPAFLogObject();
    [(VUIPlaybackReporter *)v2 setLogObject:v24];
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_18 != -1) {
    dispatch_once(&sharedInstance_onceToken_18, &__block_literal_global_86);
  }
  v2 = (void *)sharedInstance___instance_4;
  return v2;
}

void __41__VUIPlaybackReporterVPAF_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(VUIPlaybackReporterVPAF);
  v1 = (void *)sharedInstance___instance_4;
  sharedInstance___instance_4 = (uint64_t)v0;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VUIPlaybackReporterVPAF;
  [(VUIPlaybackReporter *)&v4 dealloc];
}

- (void)flushUnreportedEvents
{
}

- (void)_flushUnreportedEventsAfterDelay:(double)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__15;
  v11[4] = __Block_byref_object_dispose__15;
  v12 = [[VUIScopedBackgroundTask alloc] initWithIdentifier:@"VUIMetricsBackgroundTaskFlush" expirationHandler:0];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__VUIPlaybackReporterVPAF__flushUnreportedEventsAfterDelay___block_invoke;
  aBlock[3] = &unk_1E6DF8EC0;
  aBlock[4] = v11;
  objc_super v4 = _Block_copy(aBlock);
  v5 = v4;
  if (a3 == 0.0)
  {
    (*((void (**)(void *))v4 + 2))(v4);
  }
  else
  {
    v6 = VUIVPAFLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v14 = a3;
      _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - Will flush events after delay of %f", buf, 0xCu);
    }

    dispatch_time_t v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __60__VUIPlaybackReporterVPAF__flushUnreportedEventsAfterDelay___block_invoke_62;
    v8[3] = &unk_1E6DF3DD0;
    id v9 = v5;
    dispatch_after(v7, MEMORY[0x1E4F14428], v8);
  }
  _Block_object_dispose(v11, 8);
}

void __60__VUIPlaybackReporterVPAF__flushUnreportedEventsAfterDelay___block_invoke(uint64_t a1)
{
  v2 = VUIVPAFLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v2, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - Begin flushing events", buf, 2u);
  }

  uint64_t v3 = +[VUIMetricsJetEngine sharedInstance];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__VUIPlaybackReporterVPAF__flushUnreportedEventsAfterDelay___block_invoke_61;
  v4[3] = &unk_1E6DF8EC0;
  v4[4] = *(void *)(a1 + 32);
  [v3 flushMetricsWithCompletion:v4];
}

void __60__VUIPlaybackReporterVPAF__flushUnreportedEventsAfterDelay___block_invoke_61(uint64_t a1)
{
  v2 = VUIVPAFLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1E2BD7000, v2, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - Done flushing events", v5, 2u);
  }

  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  objc_super v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

uint64_t __60__VUIPlaybackReporterVPAF__flushUnreportedEventsAfterDelay___block_invoke_62(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)enforceSinglePlaybackSession
{
  return 0;
}

- (id)_createSessionForPlayer:(id)a3
{
  id v4 = a3;
  v5 = VUIVPAFLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - Using Jet VPAF tracking", buf, 2u);
  }

  v6 = [[VUIPlaybackReporterVPAFPlaylist alloc] initWithPlayer:v4];
  if (v6)
  {
    dispatch_time_t v7 = +[VUIMetricsJetEngine sharedInstance];
    v8 = [v7 wrappedPipeline];

    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F71958]) initWithPipeline:v8 playlist:v6 eventData:0 topic:@"xp_amp_tv_vpaf"];
  }
  else
  {
    id v9 = 0;
  }
  v10 = [[VUIPlaybackReporterSession alloc] initWithPlayer:v4 context:v9];
  [(VUIPlaybackReporterSession *)v10 setReportingEnabled:v9 != 0];
  v11 = [(NSMapTable *)self->_pendingPlayerProperties objectForKey:v4];
  if (v11)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __51__VUIPlaybackReporterVPAF__createSessionForPlayer___block_invoke;
    v17[3] = &unk_1E6DF8EE8;
    v18 = v10;
    [v11 enumerateKeysAndObjectsUsingBlock:v17];
    [(NSMapTable *)self->_pendingPlayerProperties removeObjectForKey:v4];
  }
  v12 = [(VUIPlaybackReporterSession *)v10 metadataForKey:@"VUIPlaybackReporterSessionMetadataKeyForegroundPlayback"];
  v13 = [v4 currentMediaItem];
  double v14 = [v13 mediaItemMetadataForProperty:@"reportVPAFWhenPlayingInBackground"];
  if (v12 && ([v12 BOOLValue] & 1) == 0 && (objc_msgSend(v14, "BOOLValue") & 1) == 0) {
    [(VUIPlaybackReporterSession *)v10 setReportingEnabled:0];
  }
  if (+[VUIPlaybackUtilities playerIsLive:v4])
  {
    [(VUIPlaybackReporterVPAF *)self _createPlaybackDatePollingTimerForLiveStream:v10];
    uint64_t v15 = MEMORY[0x1E4F1CC38];
  }
  else
  {
    uint64_t v15 = MEMORY[0x1E4F1CC28];
  }
  [(VUIPlaybackReporterSession *)v10 setMetadata:v15 forKey:@"VUIPlaybackReporterSessionMetadataKeyIsPlayerLive"];

  return v10;
}

uint64_t __51__VUIPlaybackReporterVPAF__createSessionForPlayer___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setMetadata:a3 forKey:a2];
}

- (void)_reportForSession:(id)a3 state:(id)a4 reason:(id)a5
{
  v137[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(VUIPlaybackReporterVPAF *)self _trackerWithBaseEventDataForSession:v8];
  v12 = (void *)v11;
  if (v11)
  {
    v111 = self;
    id v105 = v10;
    v106 = (void *)v11;
    v13 = [v8 player];
    v108 = [v13 currentMediaItem];
    double v14 = [v8 metadataForKey:@"VUIPlaybackReporterSessionMetadataKeyIsSeekJumpToLive"];
    int v104 = [v14 BOOLValue];

    uint64_t v15 = [v8 metadataForKey:@"VUIPlaybackReporterSessionMetadataKeyIsJumpToLiveAutomatic"];
    int v102 = [v15 BOOLValue];

    v16 = [v8 metadataForKey:@"VUIPlaybackReporterSessionMetadataKeyIsCatchUpToLive"];
    int v17 = [v16 BOOLValue];

    id v18 = [MEMORY[0x1E4FA9D88] playing];

    id v107 = v9;
    if (v18 != v9)
    {
      v19 = [v8 consumeMetadataForKey:@"VUIPlaybackReporterSessionMetadataKeySeekInfo"];
      id v109 = v19;
      if (!+[VUIPlaybackUtilities playerIsLive:v13])
      {
        v20 = [v8 metadataForKey:@"VUIPlaybackReporterSessionMetadataKeyIsPlayerLive"];
        int v21 = [v20 BOOLValue];

        if (!v21)
        {
          v34 = [v19 objectForKey:*MEMORY[0x1E4FAA3E0]];
          v23 = v34;
          id v10 = v105;
          v12 = v106;
          if (v34) {
            [v34 doubleValue];
          }
          else {
            [v13 elapsedTime];
          }
          unint64_t v101 = [(VUIPlaybackReporterVPAF *)self _capPlayHeadIfNeeded:vcvtad_u64_f64(v35 * 1000.0) forSession:v8];
          v25 = 0;
LABEL_27:

          v39 = [v8 consumeStopType];
          v40 = [v8 consumeStopReason];
          v110 = v25;
          if ([v40 isEqualToString:*MEMORY[0x1E4F71910]])
          {
            v41 = [v8 metadataForKey:@"VUIPlaybackReporterSessionMetadataKeySkipIntroInfo"];

            if (v41)
            {
              uint64_t v117 = *MEMORY[0x1E4F71890];
              uint64_t v118 = *MEMORY[0x1E4F71920];
              v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v118 forKeys:&v117 count:1];
              uint64_t v43 = [(VUIPlaybackReporterVPAF *)self _skipIntroActionForSession:v8 consume:0];
              v44 = (void *)v43;
              if (v43)
              {
                v116[0] = v42;
                v116[1] = v43;
                v45 = (void *)MEMORY[0x1E4F1C978];
                v46 = (void **)v116;
                uint64_t v47 = 2;
              }
              else
              {
                v115 = v42;
                v45 = (void *)MEMORY[0x1E4F1C978];
                v46 = &v115;
                uint64_t v47 = 1;
              }
              v56 = [v45 arrayWithObjects:v46 count:v47];

              goto LABEL_85;
            }
            if (v104)
            {
              uint64_t v54 = *MEMORY[0x1E4F71918];
              v113[0] = *MEMORY[0x1E4F71890];
              v113[1] = @"extraType";
              v114[0] = v54;
              v114[1] = @"CatchUpToLive";
              v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v114 forKeys:v113 count:2];
              v112 = v55;
              v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v112 count:1];
              v57 = (id *)MEMORY[0x1E4F71940];
              if (!v102) {
                v57 = (id *)MEMORY[0x1E4F71948];
              }
              id v58 = *v57;

              v39 = v58;
              goto LABEL_85;
            }
LABEL_84:
            v56 = 0;
            goto LABEL_85;
          }
          if (![v40 isEqualToString:*MEMORY[0x1E4F71928]]) {
            goto LABEL_84;
          }
          id v48 = [MEMORY[0x1E4FA9D88] paused];

          if (v48 == v107)
          {
            id v49 = (id)*MEMORY[0x1E4F71900];

            v40 = v49;
          }
          if ([v10 isEqualToString:*MEMORY[0x1E4FAA230]])
          {
            id v50 = (id)*MEMORY[0x1E4F71940];

            v51 = [v13 playlist];
            v52 = [v51 nextMediaItem];

            if (v52) {
              v53 = (id *)MEMORY[0x1E4F718F8];
            }
            else {
              v53 = (id *)MEMORY[0x1E4F718E0];
            }
            id v80 = *v53;

            v56 = 0;
            v39 = v50;
            v40 = v80;
LABEL_85:
            v85 = [v8 metadataForKey:@"VUIPlaybackReporterSessionMetadataKeyHaveSentInitialStartEvent"];
            char v86 = [v85 BOOLValue];

            v87 = VUIVPAFLogObject();
            v88 = v87;
            if (v86)
            {
              if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
              {
                v89 = [(VUIPlaybackReporterVPAF *)v111 _playHeadDescriptionForTimeInMS:v101 playbackDate:v110];
                v90 = [v108 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9ED8]];
                *(_DWORD *)buf = 138413314;
                v120 = v89;
                __int16 v121 = 2112;
                id v122 = v39;
                __int16 v123 = 2112;
                v124 = v40;
                __int16 v125 = 2112;
                v126 = v90;
                __int16 v127 = 2112;
                v128 = v56;
                _os_log_impl(&dword_1E2BD7000, v88, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - Reporting play event stop: position:%@ type:%@ reason:%@ id:%@ data:%@", buf, 0x34u);
              }
              [v12 playStoppedAtOverallPosition:v101 type:v39 reason:v40 eventData:v56];
            }
            else
            {
              if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR)) {
                -[VUIPlaybackReporterVPAF _reportForSession:state:reason:](v88, v91, v92, v93, v94, v95, v96, v97);
              }
            }
LABEL_92:

            v98 = [MEMORY[0x1E4FB1438] sharedApplication];
            uint64_t v99 = [v98 applicationState];

            if (v99 == 2) {
              [(VUIPlaybackReporterVPAF *)v111 _flushUnreportedEventsAfterDelay:1.0];
            }

            id v9 = v107;
            goto LABEL_95;
          }
          if ([v10 isEqualToString:*MEMORY[0x1E4FAA210]])
          {
            v59 = (id *)MEMORY[0x1E4F718E8];
          }
          else if ([v10 isEqualToString:*MEMORY[0x1E4FAA228]])
          {
            v59 = (id *)MEMORY[0x1E4F718D8];
          }
          else if ([v10 isEqualToString:@"VUIPostPlayReasonAutomaticUpNext"])
          {
            v59 = (id *)MEMORY[0x1E4F718F8];
          }
          else
          {
            if (![v10 isEqualToString:@"VUIPostPlayReasonAutomaticPlayOther"])
            {
              if ([v10 isEqualToString:@"VUIPostPlayReasonManualUpNext"])
              {
                v84 = (id *)MEMORY[0x1E4F718F8];
              }
              else
              {
                if (![v10 isEqualToString:@"VUIPostPlayReasonManualPlayOther"]) {
                  goto LABEL_84;
                }
                v84 = (id *)MEMORY[0x1E4F71908];
              }
              id v81 = *v84;

              v82 = (id *)MEMORY[0x1E4F71948];
LABEL_78:
              id v83 = *v82;

              v56 = 0;
              v39 = v83;
              v40 = v81;
              goto LABEL_85;
            }
            v59 = (id *)MEMORY[0x1E4F71908];
          }
          id v81 = *v59;

          v82 = (id *)MEMORY[0x1E4F71940];
          goto LABEL_78;
        }
      }
      v22 = [v19 objectForKey:*MEMORY[0x1E4FAA250]];
      v23 = v22;
      id v10 = v105;
      v12 = v106;
      if (v22)
      {
        id v24 = v22;
      }
      else
      {
        v25 = [v13 playbackDate];
        if (v25) {
          goto LABEL_18;
        }
        id v24 = [v8 metadataForKey:@"VUIPlaybackReporterSessionMetadataKeyPlaybackDateForLiveStream"];
      }
      v25 = v24;
LABEL_18:
      [v25 timeIntervalSince1970];
      unint64_t v101 = vcvtad_u64_f64(v33 * 1000.0);
      goto LABEL_27;
    }
    if (+[VUIPlaybackUtilities playerIsLive:v13])
    {
      objc_super v26 = [v13 playbackDate];
      [v26 timeIntervalSince1970];
      unint64_t v100 = vcvtad_u64_f64(v27 * 1000.0);
      if (v26)
      {
        v110 = v26;
        v28 = [v8 metadataForKey:@"VUIPlaybackReporterSessionMetadataKeyWaitingForPlaybackDateToSendStartEvent"];
        int v29 = [v28 BOOLValue];

        if (v29)
        {
          [v8 setMetadata:MEMORY[0x1E4F1CC28] forKey:@"VUIPlaybackReporterSessionMetadataKeyWaitingForPlaybackDateToSendStartEvent"];
          v30 = VUIVPAFLogObject();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1E2BD7000, v30, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - In _reportForSession, playback has started and playback date has become non-nil while waiting for it.  Will report play start", buf, 2u);
          }
        }
      }
      else
      {
        v36 = [v8 metadataForKey:@"VUIPlaybackReporterSessionMetadataKeyTimedOutWaitingForPlaybackDate"];
        int v37 = [v36 BOOLValue];

        if (v37)
        {
          v38 = VUIVPAFLogObject();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1E2BD7000, v38, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - In _reportForSession, will report nil playback date since we've timed out waiting for the playback date", buf, 2u);
          }
        }
        else
        {
          [v8 setMetadata:MEMORY[0x1E4F1CC38] forKey:@"VUIPlaybackReporterSessionMetadataKeyWaitingForPlaybackDateToSendStartEvent"];
          v38 = VUIVPAFLogObject();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
            -[VUIPlaybackReporterVPAF _reportForSession:state:reason:](v38, v60, v61, v62, v63, v64, v65, v66);
          }
        }

        v110 = 0;
      }
      v32 = v111;
    }
    else
    {
      [v13 elapsedTime];
      v32 = self;
      unint64_t v100 = [(VUIPlaybackReporterVPAF *)self _capPlayHeadIfNeeded:vcvtad_u64_f64(v31 * 1000.0) forSession:v8];
      v110 = 0;
    }
    v67 = [v8 consumeStartType];
    v68 = [v8 consumeStartReason];
    v40 = [v8 consumeMetadataForKey:@"VUIPlaybackReporterSessionMetadataKeyHandlingSeek"];
    v56 = [(VUIPlaybackReporterVPAF *)v32 _skipIntroActionForSession:v8 consume:0];
    if (![v40 BOOLValue])
    {
      if (v17)
      {
        v130 = @"extraType";
        v131 = @"CatchUpToLive";
        v73 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v131 forKeys:&v130 count:1];
        v129 = v73;
        v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v129 count:1];
      }
      else
      {
        v72 = 0;
      }
      id v103 = v68;
      id v109 = v67;
      v12 = v106;
      goto LABEL_66;
    }
    if (v104 ^ 1 | v102) {
      v69 = (id *)MEMORY[0x1E4F71940];
    }
    else {
      v69 = (id *)MEMORY[0x1E4F71948];
    }
    id v109 = *v69;

    id v70 = (id)*MEMORY[0x1E4F718B8];
    id v103 = v70;
    if (v56)
    {
      uint64_t v135 = *MEMORY[0x1E4F71888];
      uint64_t v136 = *MEMORY[0x1E4F718C8];
      v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v136 forKeys:&v135 count:1];
      v137[0] = v71;
      v137[1] = v56;
      v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:v137 count:2];

      v12 = v106;
      [(VUIPlaybackReporterVPAF *)v111 _reportSeekStopAtTimeInMS:v100 playbackDate:v110 session:v8 tracker:v106 player:v13];
      if (!v104) {
        goto LABEL_66;
      }
    }
    else
    {
      v12 = v106;
      if ((v104 & 1) == 0)
      {
        [(VUIPlaybackReporterVPAF *)v111 _reportSeekStopAtTimeInMS:v100 playbackDate:v110 session:v8 tracker:v106 player:v13];
        v72 = 0;
        goto LABEL_66;
      }
      uint64_t v133 = *MEMORY[0x1E4F71888];
      uint64_t v134 = *MEMORY[0x1E4F718C0];
      v74 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v134 forKeys:&v133 count:1];
      v132 = v74;
      v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v132 count:1];

      [(VUIPlaybackReporterVPAF *)v111 _reportSeekStopAtTimeInMS:v100 playbackDate:v110 session:v8 tracker:v106 player:v13];
    }
    [v8 setMetadata:0 forKey:@"VUIPlaybackReporterSessionMetadataKeyIsSeekJumpToLive"];
    [v8 setMetadata:0 forKey:@"VUIPlaybackReporterSessionMetadataKeyIsJumpToLiveAutomatic"];
    [v8 setMetadata:0 forKey:@"VUIPlaybackReporterSessionMetadataKeyIsCatchUpToLive"];
LABEL_66:
    [v8 setMetadata:0 forKey:@"VUIPlaybackReporterSessionMetadataKeySkipIntroInfo"];
    v75 = [v8 metadataForKey:@"VUIPlaybackReporterSessionMetadataKeyWaitingForPlaybackDateToSendStartEvent"];
    char v76 = [v75 BOOLValue];

    if ((v76 & 1) == 0)
    {
      [v8 setMetadata:MEMORY[0x1E4F1CC38] forKey:@"VUIPlaybackReporterSessionMetadataKeyHaveSentInitialStartEvent"];
      v77 = VUIVPAFLogObject();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
      {
        v78 = [(VUIPlaybackReporterVPAF *)v111 _playHeadDescriptionForTimeInMS:v100 playbackDate:v110];
        v79 = [v108 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9ED8]];
        *(_DWORD *)buf = 138413314;
        v120 = v78;
        __int16 v121 = 2112;
        id v122 = v109;
        __int16 v123 = 2112;
        v124 = v103;
        __int16 v125 = 2112;
        v126 = v79;
        __int16 v127 = 2112;
        v128 = v72;
        _os_log_impl(&dword_1E2BD7000, v77, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - Reporting play event start: position:%@ type:%@ reason:%@ id:%@ data:%@", buf, 0x34u);

        v12 = v106;
      }

      [v12 playStartedAtOverallPosition:v100 type:v109 reason:v103 eventData:v72];
    }

    v39 = v103;
    goto LABEL_92;
  }
  v13 = VUIVPAFLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - Unable to report because tracker is nil", buf, 2u);
  }
LABEL_95:
}

- (void)_endSession:(id)a3
{
  id v4 = a3;
  [(VUIPlaybackReporterVPAF *)self flushUnreportedEvents];
  [(VUIPlaybackReporterVPAF *)self _invalidatePlaybackDatePollingTimerForLiveStream:v4];
  v5.receiver = self;
  v5.super_class = (Class)VUIPlaybackReporterVPAF;
  [(VUIPlaybackReporter *)&v5 _endSession:v4];
}

- (id)_metricsForSession:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  dispatch_time_t v7 = [(VUIPlaybackReporterVPAF *)self _videoDisplayInfoForSession:v5];
  [v6 addEntriesFromDictionary:v7];

  id v8 = [(VUIPlaybackReporterVPAF *)self _screenInfo];
  [v6 addEntriesFromDictionary:v8];

  id v9 = [(VUIPlaybackReporterVPAF *)self _connectionInfo];
  [v6 addEntriesFromDictionary:v9];

  id v10 = [(VUIPlaybackReporterVPAF *)self _focusInfoForSession:v5];
  objc_msgSend(v6, "vui_setObjectIfNotNil:forKey:", v10, @"playbackFocus");

  uint64_t v11 = [v5 player];
  v12 = [(VUIPlaybackReporterVPAF *)self _metricsForPlayer:v11 session:v5];

  [v6 addEntriesFromDictionary:v12];
  v13 = VUIVPAFLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v6;
    _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - Session metrics:%@", (uint8_t *)&v15, 0xCu);
  }

  return v6;
}

- (id)_screenInfo
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  dispatch_time_t v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v7 scale];
  double v9 = v8;

  v14[0] = @"screenHeight";
  id v10 = [MEMORY[0x1E4F28ED0] numberWithDouble:v6 * v9];
  v15[0] = v10;
  v14[1] = @"screenWidth";
  uint64_t v11 = [MEMORY[0x1E4F28ED0] numberWithDouble:v4 * v9];
  v15[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v12;
}

- (id)_connectionInfo
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4FB3CF8] sharedInstance];
  int v3 = [v2 isNetworkReachable];

  if (v3) {
    double v4 = @"false";
  }
  else {
    double v4 = @"true";
  }
  dispatch_time_t v7 = @"isOffline";
  v8[0] = v4;
  double v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  return v5;
}

- (id)_videoDisplayInfoForSession:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [v4 player];
  double v6 = [(VUIPlaybackReporterVPAF *)self _delegatedInfoForPlayer:v5];

  if ([v6 isEqualToString:@"TVOut"]) {
    int v7 = MGGetBoolAnswer();
  }
  else {
    int v7 = 0;
  }
  if (([v6 isEqualToString:@"None"] & 1) != 0 || v7)
  {
    CFDictionaryRef v9 = [v4 metadataForKey:@"VUIPlaybackReporterSessionMetadataKeyVideoDisplaySize"];
    CGSize v13 = (CGSize)*MEMORY[0x1E4F1DB30];
    if (CGSizeMakeWithDictionaryRepresentation(v9, &v13))
    {
      v14[0] = @"videoViewportHeight";
      id v10 = [MEMORY[0x1E4F28ED0] numberWithDouble:floor(v13.height)];
      v14[1] = @"videoViewportWidth";
      v15[0] = v10;
      uint64_t v11 = [MEMORY[0x1E4F28ED0] numberWithDouble:floor(v13.width)];
      v15[1] = v11;
      double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
    }
    else
    {
      double v8 = 0;
    }
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

- (id)_skipIntroActionForSession:(id)a3 consume:(BOOL)a4
{
  BOOL v4 = a4;
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double v6 = [v5 metadataForKey:@"VUIPlaybackReporterSessionMetadataKeySkipIntroInfo"];
  if (v4) {
    [v5 setMetadata:0 forKey:@"VUIPlaybackReporterSessionMetadataKeySkipIntroInfo"];
  }
  if (!v6)
  {
    double v8 = 0;
    goto LABEL_11;
  }
  int v7 = [v6 localizedTitle];
  if (![v7 length])
  {
    CFDictionaryRef v9 = +[VUILocalizationManager sharedInstance];
    uint64_t v10 = [v9 localizedStringForKey:@"SKIP_INTRO"];

    int v7 = (void *)v10;
    if (v10) {
      goto LABEL_6;
    }
LABEL_9:
    double v8 = 0;
    goto LABEL_10;
  }
  if (!v7) {
    goto LABEL_9;
  }
LABEL_6:
  v12 = @"actionName";
  v13[0] = v7;
  double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
LABEL_10:

LABEL_11:
  return v8;
}

- (id)_focusInfoForSession:(id)a3
{
  BOOL v4 = @"foreground";
  id v5 = [a3 metadataForKey:@"VUIPlaybackReporterSessionMetadataKeyPIP"];
  if ([v5 BOOLValue])
  {
    double v6 = @"pictureInPicture";

    BOOL v4 = v6;
  }

  return v4;
}

- (id)_metricsForPlayer:(id)a3 session:(id)a4
{
  id v6 = a3;
  int v7 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v8 = a4;
  id v9 = objc_alloc_init(v7);
  uint64_t v10 = [v6 currentMediaItem];
  uint64_t v11 = [v10 mediaItemURL];

  if (([v11 isFileURL] & 1) == 0)
  {
    v12 = [v11 absoluteString];
    objc_msgSend(v9, "vui_setObjectIfNotNil:forKey:", v12, @"url");
  }
  CGSize v13 = [(VUIPlaybackReporterVPAF *)self _colorRangeForPlayer:v6];
  objc_msgSend(v9, "vui_setObjectIfNotNil:forKey:", v13, @"videoColorRange");

  double v14 = [(VUIPlaybackReporterVPAF *)self _audioFormatForPlayer:v6 session:v8];

  objc_msgSend(v9, "vui_setObjectIfNotNil:forKey:", v14, @"audioFormat");
  int v15 = [(VUIPlaybackReporterVPAF *)self _sensitiveContentInfoForPlayer:v6];
  objc_msgSend(v9, "vui_setObjectIfNotNil:forKey:", v15, @"sensitiveContentType");

  id v16 = [(VUIPlaybackReporterVPAF *)self _delegatedInfoForPlayer:v6];
  objc_msgSend(v9, "vui_setObjectIfNotNil:forKey:", v16, @"delegatedPlayback");

  uint64_t v17 = [(VUIPlaybackReporterVPAF *)self _downloadInfoForPlayer:v6];
  objc_msgSend(v9, "vui_setObjectIfNotNil:forKey:", v17, @"downloadState");

  id v18 = [(VUIPlaybackReporterVPAF *)self _subtitleInfoForPlayer:v6];
  [v9 setValuesForKeysWithDictionary:v18];

  v19 = [(VUIPlaybackReporterVPAF *)self _audioInfoForPlayer:v6];
  [v9 setValuesForKeysWithDictionary:v19];

  return v9;
}

- (id)_subtitleInfoForPlayer:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v3 selectedSubtitleOptionWithNoOffOrAutoOption];
    if (v5)
    {
      id v6 = v5;
      int v7 = [v5 languageCodeBCP47];
      if ([v6 containsOnlyForcedSubtitles])
      {
        id v8 = VUIPlaybackReporterVPAFKeyForcedSubtitleLocale;
      }
      else if ([v6 subtitleType] == 2)
      {
        id v8 = VUIPlaybackReporterVPAFKeyClosedCaptionLocale;
      }
      else
      {
        uint64_t v9 = [v6 subtitleType];
        id v8 = VUIPlaybackReporterVPAFKeySubtitleLocale;
        if (v9 == 1) {
          id v8 = VUIPlaybackReporterVPAFKeySDHLocale;
        }
      }
      objc_msgSend(v4, "vui_setObjectIfNotNil:forKey:", v7, *v8);
    }
  }
  uint64_t v10 = (void *)[v4 copy];

  return v10;
}

- (id)_audioInfoForPlayer:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = [v3 selectedAudioOption];
  id v6 = v5;
  if (v5)
  {
    int v7 = [v5 hasAudioDescriptions];
    id v8 = [v6 languageCodeBCP47];
    uint64_t v9 = VUIPlaybackReporterVPAFKeyAudioDescriptionLocale;
    if (!v7) {
      uint64_t v9 = VUIPlaybackReporterVPAFKeyAudioLocale;
    }
    objc_msgSend(v4, "vui_setObjectIfNotNil:forKey:", v8, *v9);

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v10 = objc_msgSend(v6, "mediaCharacteristics", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          if (+[VUIVideosPlayable isMediaCharacteristicAnAudioVariantID:v15])
          {
            objc_msgSend(v4, "vui_setObjectIfNotNil:forKey:", v15, @"audioVariantId");
            goto LABEL_14;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  id v16 = (void *)[v4 copy];

  return v16;
}

- (id)_colorRangeForPlayer:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (uint64_t v4 = [v3 currentMediaItemVideoRange], (unint64_t)(v4 - 1) <= 3))
  {
    id v5 = *off_1E6DF8F30[v4 - 1];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_audioFormatForPlayer:(id)a3 session:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  uint64_t v7 = [v5 currentMediaItemAudioFormat];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithInteger:v7];
    [v6 setMetadata:v9 forKey:@"VUIPlaybackReporterSessionMetadataKeyAudioFormat"];
  }
  else
  {
    uint64_t v10 = [v6 metadataForKey:@"VUIPlaybackReporterSessionMetadataKeyAudioFormat"];
    uint64_t v9 = v10;
    uint64_t v8 = v10 ? [v10 integerValue] : 0;
  }

  if ((unint64_t)(v8 - 1) <= 3) {
    uint64_t v11 = *off_1E6DF8F50[v8 - 1];
  }
  else {
LABEL_9:
  }
    uint64_t v11 = 0;

  return v11;
}

- (id)_delegatedInfoForPlayer:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t v4 = [v3 externalPlaybackType], v4 <= 2)) {
    id v5 = *off_1E6DF8F70[v4];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)_isDelegatedForPlayer:(id)a3
{
  id v3 = [(VUIPlaybackReporterVPAF *)self _delegatedInfoForPlayer:a3];
  if ([v3 isEqualToString:@"Airplay"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:@"TVOut"];
  }

  return v4;
}

- (id)_sensitiveContentInfoForPlayer:(id)a3
{
  id v3 = [a3 currentMediaItem];
  char v4 = [v3 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9F70]];

  if ([v4 BOOLValue]) {
    id v5 = @"adult";
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)_downloadInfoForPlayer:(id)a3
{
  id v3 = a3;
  if (+[VUIPlaybackUtilities playerIsLive:v3])
  {
    char v4 = @"streaming";
  }
  else
  {
    id v5 = [v3 currentMediaItem];
    id v6 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FA0]];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (uint64_t v7 = [v6 integerValue], (unint64_t)(v7 - 1) <= 2)) {
      char v4 = *off_1E6DF8F88[v7 - 1];
    }
    else {
      char v4 = 0;
    }
  }
  return v4;
}

- (void)_setSessionMetadataValue:(id)a3 forKey:(id)a4 player:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(VUIPlaybackReporter *)self _sessionForPlayer:v9];
  uint64_t v11 = v10;
  if (v10)
  {
    [v10 setMetadata:v13 forKey:v8];
  }
  else
  {
    id v12 = [(NSMapTable *)self->_pendingPlayerProperties objectForKey:v9];
    if (!v12) {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    [v12 setObject:v13 forKey:v8];
    [(NSMapTable *)self->_pendingPlayerProperties setObject:v12 forKey:v9];
  }
}

- (id)_trackerWithBaseEventDataForSession:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 player];
  id v6 = [v5 currentMediaItem];
  uint64_t v7 = [v4 context];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v9 = +[VUIMetricsController sharedInstance];
    uint64_t v10 = [v9 baseFieldsForVPAF];

    if (v10)
    {
      long long v20 = self;
      int v11 = objc_msgSend(v10, "vui_BOOLForKey:defaultValue:", @"sharedActivity", 0);
      uint64_t v12 = objc_msgSend(v4, "metadataForKey:");
      id v13 = (id)v12;
      if (v11)
      {
        if (!v12) {
          id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        }
        [v13 setObject:MEMORY[0x1E4F1CC38] forKey:@"sharedActivity"];
        double v14 = [v10 objectForKey:@"sharedActivityDevicesCurrent"];
        uint64_t v15 = [v10 objectForKey:@"sharedActivityDevicesMax"];
        if (v14) {
          [v13 setObject:v14 forKey:@"sharedActivityDevicesCurrent"];
        }
        if (v15) {
          [v13 setObject:v15 forKey:@"sharedActivityDevicesMax"];
        }
        [v4 setMetadata:v13 forKey:@"VUIPlaybackReporterSessionKeySavedSharePlayBaseFields"];
      }
      [v8 addEntriesFromDictionary:v10];
      if (v13) {
        [v8 addEntriesFromDictionary:v13];
      }

      self = v20;
    }
    id v16 = [(VUIPlaybackReporterVPAF *)self _metricsForSession:v4];
    [v8 addEntriesFromDictionary:v16];

    v21[0] = v8;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    [v7 resetEventData:v17];

    id v18 = v7;
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (void)_reportSeekStopAtTimeInMS:(unint64_t)a3 playbackDate:(id)a4 session:(id)a5 tracker:(id)a6 player:(id)a7
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v26 = a4;
  id v12 = a5;
  id v13 = a7;
  id v14 = a6;
  v25 = [v13 currentMediaItem];
  id v15 = (id)*MEMORY[0x1E4F71940];
  id v16 = (id)*MEMORY[0x1E4F71938];
  uint64_t v17 = [(VUIPlaybackReporterVPAF *)self _skipIntroActionForSession:v12 consume:0];
  uint64_t v18 = [v12 metadataForKey:@"VUIPlaybackReporterSessionMetadataKeyIsSeekJumpToLive"];
  int v19 = [(id)v18 BOOLValue];

  LOBYTE(v18) = +[VUIPlaybackUtilities playerIsLive:v13];
  if ((v18 & 1) == 0) {
    a3 = [(VUIPlaybackReporterVPAF *)self _capPlayHeadIfNeeded:a3 forSession:v12];
  }
  if (v17)
  {
    id v20 = (id)*MEMORY[0x1E4F71920];

    v37[0] = v17;
    long long v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
LABEL_7:
    id v16 = v20;
    goto LABEL_8;
  }
  if (v19)
  {
    id v20 = (id)*MEMORY[0x1E4F71918];

    long long v21 = 0;
    goto LABEL_7;
  }
  long long v21 = 0;
LABEL_8:
  v22 = VUIVPAFLogObject();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = [(VUIPlaybackReporterVPAF *)self _playHeadDescriptionForTimeInMS:a3 playbackDate:v26];
    id v24 = [v25 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9ED8]];
    *(_DWORD *)buf = 138413314;
    v28 = v23;
    __int16 v29 = 2112;
    id v30 = v15;
    __int16 v31 = 2112;
    id v32 = v16;
    __int16 v33 = 2112;
    v34 = v24;
    __int16 v35 = 2112;
    v36 = v21;
    _os_log_impl(&dword_1E2BD7000, v22, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - Reporting seek event stop: position:%@ type:%@ reason:%@ id:%@ data:%@", buf, 0x34u);
  }
  [v14 seekStoppedAtOverallPosition:a3 type:v15 reason:v16 eventData:v21];
}

- (id)_playHeadDescriptionForTimeInMS:(unint64_t)a3 playbackDate:(id)a4
{
  return (id)[NSString stringWithFormat:@"%lu ms (%.3f s) playback date: %@", a3, (double)a3 / 1000.0, a4];
}

- (void)_playerCurrentMediaItemWillSeek:(id)a3
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = VUIVPAFLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - Current media item will seek", buf, 2u);
  }

  id v6 = [v4 object];
  uint64_t v7 = [(VUIPlaybackReporter *)self _sessionForPlayer:v6];
  if (v7)
  {
    id v8 = [(VUIPlaybackReporterVPAF *)self _trackerWithBaseEventDataForSession:v7];
    if (!v8)
    {
      id v14 = VUIVPAFLogObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v14, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - Unable to report seek because tracker is nil", buf, 2u);
      }
      goto LABEL_28;
    }
    BOOL v9 = +[VUIPlaybackUtilities playerIsLive:v6];
    uint64_t v10 = [v4 userInfo];
    int v11 = v10;
    if (v9)
    {
      id v12 = [v10 objectForKey:*MEMORY[0x1E4FAA250]];

      [v12 timeIntervalSince1970];
      unint64_t v36 = vcvtad_u64_f64(v13 * 1000.0);
    }
    else
    {
      id v15 = [v10 objectForKey:*MEMORY[0x1E4FAA3E0]];

      [v15 doubleValue];
      unint64_t v36 = [(VUIPlaybackReporterVPAF *)self _capPlayHeadIfNeeded:vcvtad_u64_f64(v16 * 1000.0) forSession:v7];

      id v12 = 0;
    }
    __int16 v33 = [v7 consumeMetadataForKey:@"VUIPlaybackReporterSessionMetadataKeyHandlingSeek"];
    if ([v33 BOOLValue]) {
      [(VUIPlaybackReporterVPAF *)self _reportSeekStopAtTimeInMS:v36 playbackDate:v12 session:v7 tracker:v8 player:v6];
    }
    uint64_t v17 = [v6 state];
    uint64_t v18 = [MEMORY[0x1E4FA9D88] playing];

    __int16 v35 = v12;
    if (v17 == v18)
    {
      [v7 setMetadata:*MEMORY[0x1E4F71910] forKey:@"VUIPlaybackReporterSessionMetadataKeyStopReason"];
      int v19 = (void *)*MEMORY[0x1E4F71948];
      [v7 setMetadata:*MEMORY[0x1E4F71948] forKey:@"VUIPlaybackReporterSessionMetadataKeyStopType"];
      id v20 = [v4 userInfo];

      if (v20)
      {
        long long v21 = [v4 userInfo];
        [v7 setMetadata:v21 forKey:@"VUIPlaybackReporterSessionMetadataKeySeekInfo"];
      }
    }
    else
    {
      int v19 = (void *)*MEMORY[0x1E4F71948];
    }
    [v7 setMetadata:MEMORY[0x1E4F1CC38] forKey:@"VUIPlaybackReporterSessionMetadataKeyHandlingSeek"];
    v34 = [v6 currentMediaItem];
    v22 = [v7 metadataForKey:@"VUIPlaybackReporterSessionMetadataKeySkipIntroInfo"];

    uint64_t v23 = [v7 metadataForKey:@"VUIPlaybackReporterSessionMetadataKeyIsSeekJumpToLive"];
    int v24 = [v23 BOOLValue];

    id v25 = v19;
    id v26 = (id)*MEMORY[0x1E4F71930];
    if (v22)
    {
      id v27 = (id)*MEMORY[0x1E4F718C8];

      uint64_t v28 = [(VUIPlaybackReporterVPAF *)self _skipIntroActionForSession:v7 consume:0];
      id v26 = (id)v28;
      if (v28)
      {
        v47[0] = v28;
        __int16 v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:1];
LABEL_24:
        id v14 = v35;

        id v26 = v27;
LABEL_25:
        id v30 = VUIVPAFLogObject();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v31 = [(VUIPlaybackReporterVPAF *)self _playHeadDescriptionForTimeInMS:v36 playbackDate:v14];
          id v32 = [v34 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9ED8]];
          *(_DWORD *)buf = 138413314;
          v38 = v31;
          __int16 v39 = 2112;
          id v40 = v25;
          __int16 v41 = 2112;
          id v42 = v26;
          __int16 v43 = 2112;
          v44 = v32;
          __int16 v45 = 2112;
          v46 = v29;
          _os_log_impl(&dword_1E2BD7000, v30, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - Reporting seek event start: position:%@ type:%@ reason:%@ id:%@ data:%@", buf, 0x34u);

          id v14 = v35;
        }

        [v8 seekStartedAtOverallPosition:v36 type:v25 reason:v26 eventData:v29];
LABEL_28:

        goto LABEL_29;
      }
    }
    else
    {
      if (!v24)
      {
        __int16 v29 = 0;
        id v14 = v35;
        goto LABEL_25;
      }
      id v27 = (id)*MEMORY[0x1E4F718C0];
    }
    __int16 v29 = 0;
    goto LABEL_24;
  }
  id v8 = VUIVPAFLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - Unable to report seek because session is nil", buf, 2u);
  }
LABEL_29:
}

- (void)_handlePIPChange:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:VUIPlaybackManagerNotificationKeyPlayer[0]];
  uint64_t v7 = [v4 userInfo];

  id v8 = [v7 objectForKeyedSubscript:VUIPlaybackManagerNotificationKeyIsPIPing[0]];

  if (v8) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    uint64_t v10 = VUIVPAFLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v8;
      _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - Handling player PIP change:%@", (uint8_t *)&v11, 0xCu);
    }

    [(VUIPlaybackReporterVPAF *)self _setSessionMetadataValue:v8 forKey:@"VUIPlaybackReporterSessionMetadataKeyPIP" player:v6];
  }
}

- (void)_handleBackgroundEnterPIPChange:(id)a3
{
  id v5 = [a3 userInfo];
  id v4 = [v5 objectForKeyedSubscript:@"VUIBackgroundMediaControllerPlayerKey"];
  if (v4) {
    [(VUIPlaybackReporterVPAF *)self _setSessionMetadataValue:MEMORY[0x1E4F1CC38] forKey:@"VUIPlaybackReporterSessionMetadataKeyPIP" player:v4];
  }
}

- (void)_handleBackgroundExitPIPChange:(id)a3
{
  id v5 = [a3 userInfo];
  id v4 = [v5 objectForKeyedSubscript:@"VUIBackgroundMediaControllerPlayerKey"];
  if (v4) {
    [(VUIPlaybackReporterVPAF *)self _setSessionMetadataValue:MEMORY[0x1E4F1CC28] forKey:@"VUIPlaybackReporterSessionMetadataKeyPIP" player:v4];
  }
}

- (void)_handleDisplaySizeChange:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:VUIPlaybackManagerNotificationKeyPlayer[0]];
  uint64_t v7 = [v4 userInfo];
  id v8 = [v7 objectForKeyedSubscript:VUIPlaybackManagerNotificationKeyDisplaySize[0]];

  BOOL v9 = [v4 name];
  int v10 = [v9 isEqualToString:@"VUIBackgroundMediaControllerVideoDisplaySizeDidChangeNotification"];

  if (v10)
  {
    uint64_t v11 = [v5 objectForKeyedSubscript:@"VUIBackgroundMediaControllerPlayerKey"];

    id v12 = [v4 userInfo];
    uint64_t v13 = [v12 objectForKeyedSubscript:@"VUIBackgroundMediaControllerDisplaySizeKey"];

    id v8 = (void *)v13;
    id v6 = (void *)v11;
  }
  if (v8) {
    BOOL v14 = v6 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14)
  {
    id v15 = VUIVPAFLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      uint64_t v17 = v8;
      _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - Handling player display change:%@", (uint8_t *)&v16, 0xCu);
    }

    [(VUIPlaybackReporterVPAF *)self _setSessionMetadataValue:v8 forKey:@"VUIPlaybackReporterSessionMetadataKeyVideoDisplaySize" player:v6];
  }
}

- (void)_handleIsPlaybackUIBeingShownDidChange:(id)a3
{
  id v3 = +[VUIPlaybackManager sharedInstance];
  int v4 = [v3 isPlaybackUIBeingShown];

  id v5 = +[VUIMetricsJetEngine sharedInstance];
  [v5 setMonitorsLifecycleEvents:v4 ^ 1u];
}

- (void)_applicationWillResignActive:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v4 = +[VUIPlaybackManager sharedInstance];
  int v5 = [v4 isPlaybackUIBeingShown];

  if (v5)
  {
    id v6 = VUIVPAFLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      uint64_t v8 = 0x3FC999999999999ALL;
      _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - Application will resign active while playback UI is being shown.  Will flush unreported events after %.1f seconds", (uint8_t *)&v7, 0xCu);
    }

    [(VUIPlaybackReporterVPAF *)self _flushUnreportedEventsAfterDelay:0.2];
  }
}

- (void)_applicationDidEnterBackground:(id)a3
{
  int v4 = +[VUIPlaybackManager sharedInstance];
  int v5 = [v4 isPlaybackUIBeingShown];

  if (v5)
  {
    id v6 = VUIVPAFLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v7 = 0;
      _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - Application did enter background while playback UI is being shown.  Flushing unreported events", v7, 2u);
    }

    [(VUIPlaybackReporterVPAF *)self flushUnreportedEvents];
  }
}

- (void)_handleSkipIntro_iOS:(id)a3
{
  id v4 = a3;
  int v5 = VUIVPAFLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - Handling skip intro", v13, 2u);
  }

  id v6 = [v4 userInfo];
  int v7 = [v6 objectForKeyedSubscript:VUIPlaybackManagerNotificationKeyPlayer[0]];

  uint64_t v8 = [v4 userInfo];
  uint64_t v9 = [v8 objectForKeyedSubscript:VUIPlaybackManagerSeekReasonKey[0]];

  if (v7) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10 && [v9 integerValue] == 1)
  {
    uint64_t v11 = [v4 userInfo];
    id v12 = [v11 objectForKeyedSubscript:VUIPlaybackManagerSeekInfoKey];

    [(VUIPlaybackReporterVPAF *)self _setSessionMetadataValue:v12 forKey:@"VUIPlaybackReporterSessionMetadataKeySkipIntroInfo" player:v7];
  }
}

- (void)_handleMediaControllerNotification:(id)a3
{
  id v4 = a3;
  id v20 = [v4 object];
  int v5 = [v20 player];
  id v6 = [v4 userInfo];

  int v7 = [v6 objectForKeyedSubscript:@"VUIBackgroundMediaControllerIsForegroundedKey"];
  uint64_t v8 = [v6 objectForKeyedSubscript:@"VUIBackgroundMediaControllerPlaybackStartReasonKey"];
  uint64_t v9 = [v6 objectForKeyedSubscript:@"VUIBackgroundMediaControllerPlaybackStopReasonKey"];
  BOOL v10 = [v6 objectForKeyedSubscript:@"VUIBackgroundMediaControllerIsAutomaticPlaybackStartKey"];
  uint64_t v11 = [v6 objectForKeyedSubscript:@"VUIBackgroundMediaControllerIsAutomaticPlaybackStopKey"];
  uint64_t v12 = [v6 objectForKeyedSubscript:@"VUIBackgroundMediaControllerPlaybackStartReasonKey"];
  if (!v12) {
    goto LABEL_6;
  }
  uint64_t v13 = (void *)v12;
  if ([v8 unsignedLongValue] != 3)
  {
    uint64_t v14 = [v8 unsignedLongValue];

    if (v14 == 9) {
      goto LABEL_5;
    }
LABEL_6:
    if (!v7) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

LABEL_5:
  int v7 = (void *)MEMORY[0x1E4F1CC38];
LABEL_7:
  [(VUIPlaybackReporterVPAF *)self _setSessionMetadataValue:v7 forKey:@"VUIPlaybackReporterSessionMetadataKeyForegroundPlayback" player:v5];

LABEL_8:
  id v15 = [v5 currentMediaItem];
  int v16 = [v15 mediaItemMetadataForProperty:@"VUIMediaItemMetadataClipId"];

  if ([v16 length]) {
    [(VUIPlaybackReporterVPAF *)self _setSessionMetadataValue:MEMORY[0x1E4F1CC38] forKey:@"VUIPlaybackReporterSessionMetadataKeyIsCatchUpToLive" player:v5];
  }
  if (v8)
  {
    uint64_t v17 = +[VUIPlaybackReporterSession transitionTypeForMediaControllerAutoTransition:v10];
    [(VUIPlaybackReporterVPAF *)self _setSessionMetadataValue:v17 forKey:@"VUIPlaybackReporterSessionMetadataKeyStartType" player:v5];
    uint64_t v18 = +[VUIPlaybackReporterSession transitionReasonForMediaControllerStartReason:v8 autoStart:v10];
    int v19 = VUIPlaybackReporterSessionMetadataKeyStartReason;
  }
  else
  {
    if (!v9) {
      goto LABEL_15;
    }
    uint64_t v17 = +[VUIPlaybackReporterSession transitionTypeForMediaControllerAutoTransition:v11];
    [(VUIPlaybackReporterVPAF *)self _setSessionMetadataValue:v17 forKey:@"VUIPlaybackReporterSessionMetadataKeyStopType" player:v5];
    uint64_t v18 = +[VUIPlaybackReporterSession transitionReasonForMediaControllerStopReason:v9 autoStop:v11];
    int v19 = VUIPlaybackReporterSessionMetadataKeyStopReason;
  }
  [(VUIPlaybackReporterVPAF *)self _setSessionMetadataValue:v18 forKey:*v19 player:v5];

LABEL_15:
}

- (void)_handleBgMCEmbeddedPlayerVCTransferredToFullScreenControllerNotification:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    int v7 = [v4 object];
    uint64_t v8 = [(VUIPlaybackReporter *)self _sessionForPlayer:v7];
    uint64_t v9 = v8;
    if (v8)
    {
      [v8 setMetadata:MEMORY[0x1E4F1CC38] forKey:@"VUIPlaybackReporterSessionMetadataKeyForegroundPlayback"];
      [v9 setReportingEnabled:1];
      BOOL v10 = VUIVPAFLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        uint64_t v13 = v7;
        _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - Initiating report for player - %@ after being transferred to full screen controller", (uint8_t *)&v12, 0xCu);
      }

      uint64_t v11 = [v7 state];
      [(VUIPlaybackReporterVPAF *)self _reportForSession:v9 state:v11 reason:0];
    }
  }
}

- (void)_catchUpToLiveItemWillChange:(id)a3
{
  id v4 = a3;
  int v5 = [v4 object];
  id v6 = [v4 userInfo];

  int v7 = objc_msgSend(v6, "vui_BOOLForKey:defaultValue:", @"VUICatchUpToLiveIsAutomaticKey", 0);
  if (v5)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F71940];
    if (!v7) {
      uint64_t v8 = (void *)MEMORY[0x1E4F71948];
    }
    [(VUIPlaybackReporterVPAF *)self _setSessionMetadataValue:*v8 forKey:@"VUIPlaybackReporterSessionMetadataKeyStopType" player:v5];
    [(VUIPlaybackReporterVPAF *)self _setSessionMetadataValue:*MEMORY[0x1E4F718F8] forKey:@"VUIPlaybackReporterSessionMetadataKeyStopReason" player:v5];
  }
  else
  {
    uint64_t v9 = VUIVPAFLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v10 = 0;
      _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - Not setting catch up to live metadata because player is missing", v10, 2u);
    }
  }
}

- (void)_catchUpToLiveItemDidChange:(id)a3
{
  id v4 = a3;
  int v5 = [v4 object];
  id v6 = [v4 userInfo];

  int v7 = objc_msgSend(v6, "vui_BOOLForKey:defaultValue:", @"VUICatchUpToLiveIsAutomaticKey", 0);
  if (v5)
  {
    [(VUIPlaybackReporterVPAF *)self _setSessionMetadataValue:MEMORY[0x1E4F1CC38] forKey:@"VUIPlaybackReporterSessionMetadataKeyIsCatchUpToLive" player:v5];
    uint64_t v8 = (void *)MEMORY[0x1E4F71940];
    if (!v7) {
      uint64_t v8 = (void *)MEMORY[0x1E4F71948];
    }
    [(VUIPlaybackReporterVPAF *)self _setSessionMetadataValue:*v8 forKey:@"VUIPlaybackReporterSessionMetadataKeyStartType" player:v5];
    [(VUIPlaybackReporterVPAF *)self _setSessionMetadataValue:*MEMORY[0x1E4F718A0] forKey:@"VUIPlaybackReporterSessionMetadataKeyStartReason" player:v5];
  }
  else
  {
    uint64_t v9 = VUIVPAFLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v10 = 0;
      _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - Not setting catch up to live metadata because player is missing", v10, 2u);
    }
  }
}

- (void)_catchUpToLiveDidBegin:(id)a3
{
  id v5 = [a3 object];
  id v4 = [(VUIPlaybackReporter *)self _sessionForPlayer:v5];
  [v4 setMetadata:MEMORY[0x1E4F1CC38] forKey:@"VUIPlaybackReporterSessionMetadataKeyIsCatchUpToLive"];
}

- (void)_catchUpToLiveDidEnd:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  id v6 = [v4 userInfo];
  int v7 = [v6 objectForKey:@"VUICatchUpToLiveDidJumpToLiveKey"];
  uint64_t v8 = [v7 BOOLValue];

  uint64_t v9 = [v4 userInfo];

  BOOL v10 = [v9 objectForKey:@"VUICatchUpToLiveIsAutomaticKey"];

  uint64_t v11 = [(VUIPlaybackReporter *)self _sessionForPlayer:v5];
  int v12 = [MEMORY[0x1E4F28ED0] numberWithBool:v8];
  [v11 setMetadata:v12 forKey:@"VUIPlaybackReporterSessionMetadataKeyIsSeekJumpToLive"];

  [v11 setMetadata:v10 forKey:@"VUIPlaybackReporterSessionMetadataKeyIsJumpToLiveAutomatic"];
  if (v8)
  {
    uint64_t v13 = +[VUIPlaybackReporterSession transitionTypeForMediaControllerAutoTransition:v10];
    [(VUIPlaybackReporterVPAF *)self _setSessionMetadataValue:v13 forKey:@"VUIPlaybackReporterSessionMetadataKeyStopType" player:v5];
    [(VUIPlaybackReporterVPAF *)self _setSessionMetadataValue:*MEMORY[0x1E4F71910] forKey:@"VUIPlaybackReporterSessionMetadataKeyStopReason" player:v5];
    [v11 setMetadata:MEMORY[0x1E4F1CC28] forKey:@"VUIPlaybackReporterSessionMetadataKeyIsCatchUpToLive"];
  }
  else
  {
    uint64_t v14 = *MEMORY[0x1E4F71948];
    [(VUIPlaybackReporterVPAF *)self _setSessionMetadataValue:*MEMORY[0x1E4F71948] forKey:@"VUIPlaybackReporterSessionMetadataKeyStopType" player:v5];
    uint64_t v15 = *MEMORY[0x1E4F71908];
    [(VUIPlaybackReporterVPAF *)self _setSessionMetadataValue:*MEMORY[0x1E4F71908] forKey:@"VUIPlaybackReporterSessionMetadataKeyStopReason" player:v5];
    int v16 = [MEMORY[0x1E4FA9D88] stopped];
    [(VUIPlaybackReporterVPAF *)self _reportForSession:v11 state:v16 reason:0];

    [(VUIPlaybackReporterVPAF *)self _setSessionMetadataValue:v14 forKey:@"VUIPlaybackReporterSessionMetadataKeyStartType" player:v5];
    [(VUIPlaybackReporterVPAF *)self _setSessionMetadataValue:v15 forKey:@"VUIPlaybackReporterSessionMetadataKeyStartReason" player:v5];
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__VUIPlaybackReporterVPAF__catchUpToLiveDidEnd___block_invoke;
    block[3] = &unk_1E6DF6510;
    id v18 = v11;
    objc_copyWeak(&v19, &location);
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v19);

    objc_destroyWeak(&location);
  }
}

void __48__VUIPlaybackReporterVPAF__catchUpToLiveDidEnd___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setMetadata:MEMORY[0x1E4F1CC28] forKey:@"VUIPlaybackReporterSessionMetadataKeyIsCatchUpToLive"];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [MEMORY[0x1E4FA9D88] playing];
  [WeakRetained _reportForSession:v2 state:v3 reason:0];
}

- (void)_liveSportsPostPlayAutoPlayWillStart:(id)a3
{
  id v4 = [a3 object];
  [(VUIPlaybackReporterVPAF *)self _setSessionMetadataValue:*MEMORY[0x1E4F71940] forKey:@"VUIPlaybackReporterSessionMetadataKeyStopType" player:v4];
  [(VUIPlaybackReporterVPAF *)self _setSessionMetadataValue:*MEMORY[0x1E4F718A0] forKey:@"VUIPlaybackReporterSessionMetadataKeyStopReason" player:v4];
}

- (unint64_t)_capPlayHeadIfNeeded:(unint64_t)a3 forSession:(id)a4
{
  id v5 = a4;
  id v6 = [v5 metadataForKey:@"VUIPlaybackReporterSessionMetadataKeyInitialDurationInMillis"];
  int v7 = v6;
  if (v6)
  {
    unint64_t v8 = [v6 unsignedLongValue];
  }
  else
  {
    uint64_t v9 = [v5 player];
    [v9 duration];
    double v11 = v10;

    if (v11 == *MEMORY[0x1E4FA9DC8] || v11 == *MEMORY[0x1E4FA9DC0])
    {
      unint64_t v8 = 0;
    }
    else
    {
      unint64_t v8 = vcvtad_u64_f64(v11 * 1000.0);
      uint64_t v13 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v8];
      [v5 setMetadata:v13 forKey:@"VUIPlaybackReporterSessionMetadataKeyInitialDurationInMillis"];
    }
  }
  if (v8 < a3 && v8 != 0) {
    a3 = v8;
  }

  return a3;
}

- (void)_createPlaybackDatePollingTimerForLiveStream:(id)a3
{
  id v4 = a3;
  id v5 = [v4 metadataForKey:@"VUIPlaybackReporterSessionMetadataKeyPlaybackDatePollingTimerForLiveStream"];
  if (!v5)
  {
    objc_initWeak(&location, v4);
    objc_initWeak(&from, self);
    id v6 = [MEMORY[0x1E4F1C9C8] date];
    int v7 = (void *)MEMORY[0x1E4F1CB00];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __72__VUIPlaybackReporterVPAF__createPlaybackDatePollingTimerForLiveStream___block_invoke;
    uint64_t v15 = &unk_1E6DF8F10;
    objc_copyWeak(&v18, &location);
    objc_copyWeak(&v19, &from);
    id v8 = v4;
    id v16 = v8;
    id v9 = v6;
    id v17 = v9;
    id v5 = [v7 scheduledTimerWithTimeInterval:1 repeats:&v12 block:5.0];
    double v10 = objc_msgSend(v8, "player", v12, v13, v14, v15);
    double v11 = [v10 playbackDate];

    [v8 setMetadata:v11 forKey:@"VUIPlaybackReporterSessionMetadataKeyPlaybackDateForLiveStream"];
    [v8 setMetadata:v5 forKey:@"VUIPlaybackReporterSessionMetadataKeyPlaybackDatePollingTimerForLiveStream"];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v18);

    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

void __72__VUIPlaybackReporterVPAF__createPlaybackDatePollingTimerForLiveStream___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v3 = [WeakRetained player];
  id v4 = [v3 playbackDate];

  id v5 = objc_loadWeakRetained(a1 + 7);
  id v6 = [a1[4] player];
  if (!v4)
  {
    double v11 = [a1[5] dateByAddingTimeInterval:20.0];
    uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v14 = [v13 earlierDate:v11];
    if (v14 == v11)
    {
      uint64_t v15 = [a1[4] metadataForKey:@"VUIPlaybackReporterSessionMetadataKeyWaitingForPlaybackDateToSendStartEvent"];
      if ([v15 BOOLValue])
      {
        id v16 = objc_msgSend(a1[4], "metadataForKey:");
        char v17 = [v16 BOOLValue];

        if ((v17 & 1) == 0)
        {
          id v18 = VUIVPAFLogObject();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            __72__VUIPlaybackReporterVPAF__createPlaybackDatePollingTimerForLiveStream___block_invoke_cold_1(v18, v19, v20, v21, v22, v23, v24, v25);
          }

          [a1[4] setMetadata:MEMORY[0x1E4F1CC28] forKey:@"VUIPlaybackReporterSessionMetadataKeyWaitingForPlaybackDateToSendStartEvent"];
          [a1[4] setMetadata:MEMORY[0x1E4F1CC38] forKey:@"VUIPlaybackReporterSessionMetadataKeyTimedOutWaitingForPlaybackDate"];
          id v26 = [v6 state];
          id v27 = [MEMORY[0x1E4FA9D88] playing];

          if (v26 == v27)
          {
            uint64_t v28 = VUIVPAFLogObject();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)id v30 = 0;
              _os_log_impl(&dword_1E2BD7000, v28, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - After playback date timeout, playback state is playing.  Reporting start event even though it will have no playback date", v30, 2u);
            }

            __int16 v29 = [MEMORY[0x1E4FA9D88] playing];
            [v5 _reportForSession:WeakRetained state:v29 reason:0];
          }
        }
        goto LABEL_21;
      }
    }
    else
    {
    }
LABEL_21:

    goto LABEL_22;
  }
  [WeakRetained setMetadata:v4 forKey:@"VUIPlaybackReporterSessionMetadataKeyPlaybackDateForLiveStream"];
  int v7 = [a1[4] metadataForKey:@"VUIPlaybackReporterSessionMetadataKeyWaitingForPlaybackDateToSendStartEvent"];
  int v8 = [v7 BOOLValue];

  if (v8)
  {
    [a1[4] setMetadata:MEMORY[0x1E4F1CC28] forKey:@"VUIPlaybackReporterSessionMetadataKeyWaitingForPlaybackDateToSendStartEvent"];
    id v9 = [v6 state];
    double v10 = [MEMORY[0x1E4FA9D88] playing];

    double v11 = VUIVPAFLogObject();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v9 == v10)
    {
      if (v12)
      {
        *(_WORD *)id v32 = 0;
        _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - After polling, playback date has become available while waiting for it and playback is playing.  Reporting start event", v32, 2u);
      }

      double v11 = [MEMORY[0x1E4FA9D88] playing];
      [v5 _reportForSession:WeakRetained state:v11 reason:0];
    }
    else if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "VUIPlaybackReporterVPAF - After polling, playback date has become available while waiting for it, but playback state is not playing.", buf, 2u);
    }
    goto LABEL_21;
  }
LABEL_22:
}

- (void)_invalidatePlaybackDatePollingTimerForLiveStream:(id)a3
{
  id v5 = a3;
  id v3 = [v5 metadataForKey:@"VUIPlaybackReporterSessionMetadataKeyPlaybackDatePollingTimerForLiveStream"];
  id v4 = v3;
  if (v3)
  {
    [v3 invalidate];
    [v5 setMetadata:0 forKey:@"VUIPlaybackReporterSessionMetadataKeyPlaybackDatePollingTimerForLiveStream"];
  }
}

- (void).cxx_destruct
{
}

- (void)_reportForSession:(uint64_t)a3 state:(uint64_t)a4 reason:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_reportForSession:(uint64_t)a3 state:(uint64_t)a4 reason:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __72__VUIPlaybackReporterVPAF__createPlaybackDatePollingTimerForLiveStream___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end