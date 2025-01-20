@interface VUIActionPlay
+ (void)_playMediaInfo:(id)a3 multiviewMediaInfos:(id)a4 watchType:(int64_t)a5 extrasInfo:(id)a6 playType:(id)a7 isRentAndWatchNow:(BOOL)a8 targetResponder:(id)a9 completion:(id)a10;
+ (void)_playPlayables:(id)a3 multiviewPlayables:(id)a4 appContext:(id)a5 watchType:(int64_t)a6 isUpNextPlayback:(BOOL)a7 userPlaybackInitiationDate:(id)a8 openURLCompletionDate:(id)a9 playType:(id)a10 playbackContext:(unint64_t)a11 targetResponder:(id)a12;
+ (void)playMediaInfo:(id)a3 multiviewMediaInfos:(id)a4 watchType:(int64_t)a5 isRentAndWatchNow:(BOOL)a6;
+ (void)playMediaInfo:(id)a3 multiviewMediaInfos:(id)a4 watchType:(int64_t)a5 isRentAndWatchNow:(BOOL)a6 completion:(id)a7;
+ (void)playMediaInfo:(id)a3 watchType:(int64_t)a4 isRentAndWatchNow:(BOOL)a5;
+ (void)playMediaInfo:(id)a3 watchType:(int64_t)a4 isRentAndWatchNow:(BOOL)a5 completion:(id)a6;
+ (void)presentPlaybackWithMediaInfo:(id)a3 multiviewMediaInfos:(id)a4 extrasInfo:(id)a5 isCoWatching:(BOOL)a6 watchType:(int64_t)a7 playType:(id)a8 allowsCellular:(BOOL)a9 previewMetadata:(id)a10 targetResponder:(id)a11 completion:(id)a12;
- (BOOL)isAccountRequired;
- (BOOL)isRentAndWatchNow;
- (BOOL)isUpNextPlayback;
- (BOOL)playRequiresAccount;
- (MPMediaItem)mpMediaItem;
- (NSArray)multiviewPlayables;
- (NSArray)videosPlayables;
- (NSDate)openURLCompletionDate;
- (NSDate)userPlaybackInitiationDate;
- (NSDictionary)contextData;
- (NSString)playType;
- (NSString)sidebandLibraryAdamID;
- (VUIActionPlay)initWithContextData:(id)a3 appContext:(id)a4;
- (VUIActionPlay)initWithMPMediaItem:(id)a3 watchType:(int64_t)a4 playbackContext:(unint64_t)a5 isRentAndWatchNow:(BOOL)a6;
- (VUIActionPlay)initWithSidebandAdamID:(id)a3 watchType:(int64_t)a4 playbackContext:(unint64_t)a5 isRentAndWatchNow:(BOOL)a6;
- (VUIActionPlay)initWithVideosPlayables:(id)a3 watchType:(int64_t)a4 playbackContext:(unint64_t)a5 isRentAndWatchNow:(BOOL)a6;
- (VUIAppContext)appContext;
- (int64_t)watchType;
- (unint64_t)playbackContext;
- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4;
- (void)setAppContext:(id)a3;
- (void)setContextData:(id)a3;
- (void)setIsRentAndWatchNow:(BOOL)a3;
- (void)setMpMediaItem:(id)a3;
- (void)setOpenURLCompletionDate:(id)a3;
- (void)setPlayRequiresAccount:(BOOL)a3;
- (void)setPlaybackContext:(unint64_t)a3;
- (void)setSidebandLibraryAdamID:(id)a3;
- (void)setUpNextPlayback:(BOOL)a3;
- (void)setUserPlaybackInitiationDate:(id)a3;
- (void)setVideosPlayables:(id)a3;
- (void)setWatchType:(int64_t)a3;
@end

@implementation VUIActionPlay

- (VUIActionPlay)initWithContextData:(id)a3 appContext:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v49.receiver = self;
  v49.super_class = (Class)VUIActionPlay;
  v9 = [(VUIActionPlay *)&v49 init];
  v10 = v9;
  if (v9)
  {
    id v39 = a3;
    v41 = v9;
    uint64_t v11 = objc_msgSend(v7, "vui_arrayForKey:", @"videosPlayables");
    objc_msgSend(v7, "vui_dictionaryForKey:", @"contentMetadata");
    v40 = v37 = (void *)v11;
    +[VUIVideosPlayable videosPlayablesFromDictionaries:andMetadataDictionary:](VUIVideosPlayable, "videosPlayablesFromDictionaries:andMetadataDictionary:", v11);
    v38 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v7, "vui_arrayForKey:", @"multiviewPlaybackInformation");
    v42 = v7;
    v36 = objc_msgSend(v7, "vui_stringForKey:", @"postPlayPlaybackType");
    v44 = [MEMORY[0x1E4F1CA48] array];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id obj = v12;
    uint64_t v13 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v46 != v15) {
            objc_enumerationMutation(obj);
          }
          v17 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          v18 = [v17 objectForKeyedSubscript:@"videosPlayables"];
          v19 = [v17 objectForKeyedSubscript:@"contentMetadata"];
          v20 = +[VUIVideosPlayable videosPlayablesFromDictionaries:v18 andMetadataDictionary:v19];

          if ([v20 count])
          {
            v21 = [v20 firstObject];
            [v44 addObject:v21];
          }
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
      }
      while (v14);
    }

    v10 = v41;
    videosPlayables = v41->_videosPlayables;
    v41->_videosPlayables = v38;
    v23 = v38;

    objc_storeStrong((id *)&v41->_contextData, v39);
    objc_storeWeak((id *)&v41->_appContext, v8);
    v41->_upNextPlayback = objc_msgSend(v40, "vui_BOOLForKey:defaultValue:", @"isUpNextPlayback", 0);
    v41->_playRequiresAccount = objc_msgSend(v40, "vui_BOOLForKey:defaultValue:", @"playRequiresAccount", 0);
    uint64_t v24 = [v44 copy];
    multiviewPlayables = v41->_multiviewPlayables;
    v41->_multiviewPlayables = (NSArray *)v24;

    v26 = [(NSArray *)v23 firstObject];

    uint64_t v27 = [v26 sourceRef];
    if ((unint64_t)(v27 - 1) >= 3)
    {
      id v7 = v42;
      v29 = objc_msgSend(v42, "vui_stringForKey:", @"type");
      int v30 = [v29 isEqualToString:@"replace"];

      uint64_t v28 = 4;
      if (!v30) {
        uint64_t v28 = 0;
      }
    }
    else
    {
      uint64_t v28 = qword_1E38FE088[v27 - 1];
      id v7 = v42;
    }
    v41->_watchType = v28;
    if (v41->_upNextPlayback)
    {
      uint64_t v31 = 2;
    }
    else
    {
      switch(v27)
      {
        case 2:
          uint64_t v31 = 9;
          break;
        case 7:
          uint64_t v31 = 7;
          break;
        case 3:
          uint64_t v31 = 11;
          break;
        default:
          v33 = v36;
          v32 = v37;
          if ([v36 isEqualToString:@"nextEpisodeSameSeason"])
          {
            uint64_t v31 = 9;
          }
          else if ([v36 isEqualToString:@"nextEpisodeDifferentSeason"])
          {
            uint64_t v31 = 10;
          }
          else
          {
            int v35 = [v36 isEqualToString:@"other"];
            uint64_t v31 = 11;
            if (!v35) {
              uint64_t v31 = 0;
            }
          }
          goto LABEL_18;
      }
    }
    v33 = v36;
    v32 = v37;
LABEL_18:
    v41->_playbackContext = v31;
  }
  return v10;
}

- (VUIActionPlay)initWithVideosPlayables:(id)a3 watchType:(int64_t)a4 playbackContext:(unint64_t)a5 isRentAndWatchNow:(BOOL)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VUIActionPlay;
  v12 = [(VUIActionPlay *)&v15 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_videosPlayables, a3);
    v13->_watchType = a4;
    v13->_playbackContext = a5;
    v13->_isRentAndWatchNow = a6;
  }

  return v13;
}

- (VUIActionPlay)initWithMPMediaItem:(id)a3 watchType:(int64_t)a4 playbackContext:(unint64_t)a5 isRentAndWatchNow:(BOOL)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VUIActionPlay;
  v12 = [(VUIActionPlay *)&v15 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_mpMediaItem, a3);
    v13->_watchType = a4;
    v13->_playbackContext = a5;
    v13->_isRentAndWatchNow = a6;
  }

  return v13;
}

- (VUIActionPlay)initWithSidebandAdamID:(id)a3 watchType:(int64_t)a4 playbackContext:(unint64_t)a5 isRentAndWatchNow:(BOOL)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VUIActionPlay;
  v12 = [(VUIActionPlay *)&v15 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sidebandLibraryAdamID, a3);
    v13->_watchType = a4;
    v13->_playbackContext = a5;
    v13->_isRentAndWatchNow = a6;
  }

  return v13;
}

- (NSString)playType
{
  v2 = [(VUIActionPlay *)self contextData];
  objc_msgSend(v2, "vui_stringForKey:", @"type");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3) {
    v3 = @"play";
  }
  v5 = v3;

  return v5;
}

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  v6 = (void (**)(id, uint64_t))a4;
  id v7 = [(VUIActionPlay *)self videosPlayables];

  if (v7)
  {
    id v39 = v6;
    id v8 = [(VUIActionPlay *)self appContext];
    unint64_t v9 = [(VUIActionPlay *)self playbackContext];
    if (!v9)
    {
      v10 = [(VUIActionPlay *)self openURLCompletionDate];
      if (v10) {
        unint64_t v9 = 5;
      }
      else {
        unint64_t v9 = 1;
      }
    }
    id v11 = objc_opt_class();
    v12 = [(VUIActionPlay *)self videosPlayables];
    uint64_t v13 = [(VUIActionPlay *)self multiviewPlayables];
    int64_t v14 = [(VUIActionPlay *)self watchType];
    BOOL v15 = [(VUIActionPlay *)self isUpNextPlayback];
    v16 = [(VUIActionPlay *)self userPlaybackInitiationDate];
    v17 = [(VUIActionPlay *)self openURLCompletionDate];
    v18 = [(VUIActionPlay *)self playType];
    [v11 _playPlayables:v12 multiviewPlayables:v13 appContext:v8 watchType:v14 isUpNextPlayback:v15 userPlaybackInitiationDate:v16 openURLCompletionDate:v17 playType:v18 playbackContext:v9 targetResponder:v40];

    v6 = v39;
  }
  else
  {
    v19 = [(VUIActionPlay *)self mpMediaItem];

    if (v19)
    {
      v20 = [VUIMediaInfo alloc];
      unint64_t v21 = [(VUIActionPlay *)self playbackContext];
      v22 = [(VUIActionPlay *)self mpMediaItem];
      v46[0] = v22;
      v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];
      uint64_t v24 = [(VUIMediaInfo *)v20 initWithPlaybackContext:v21 mpMediaItems:v23];

      [(VUIMediaInfo *)v24 setIntent:1];
      v25 = objc_opt_class();
      int64_t v26 = [(VUIActionPlay *)self watchType];
      BOOL v27 = [(VUIActionPlay *)self isRentAndWatchNow];
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __62__VUIActionPlay_performWithTargetResponder_completionHandler___block_invoke;
      v43[3] = &unk_1E6DF9B60;
      v44 = v24;
      uint64_t v28 = v24;
      [v25 _playMediaInfo:v28 multiviewMediaInfos:MEMORY[0x1E4F1CBF0] watchType:v26 extrasInfo:0 playType:@"play" isRentAndWatchNow:v27 targetResponder:v40 completion:v43];
      v29 = v44;
    }
    else
    {
      int v30 = [(VUIActionPlay *)self sidebandLibraryAdamID];

      if (!v30) {
        goto LABEL_13;
      }
      uint64_t v31 = [VUIMediaInfo alloc];
      unint64_t v32 = [(VUIActionPlay *)self playbackContext];
      v33 = [(VUIActionPlay *)self sidebandLibraryAdamID];
      long long v45 = v33;
      v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
      int v35 = [(VUIMediaInfo *)v31 initWithPlaybackContext:v32 sidebandLibraryAdamIDs:v34];

      [(VUIMediaInfo *)v35 setIntent:1];
      v36 = objc_opt_class();
      int64_t v37 = [(VUIActionPlay *)self watchType];
      BOOL v38 = [(VUIActionPlay *)self isRentAndWatchNow];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __62__VUIActionPlay_performWithTargetResponder_completionHandler___block_invoke_2;
      v41[3] = &unk_1E6DF9B60;
      v42 = v35;
      uint64_t v28 = v35;
      [v36 _playMediaInfo:v28 multiviewMediaInfos:MEMORY[0x1E4F1CBF0] watchType:v37 extrasInfo:0 playType:@"play" isRentAndWatchNow:v38 targetResponder:v40 completion:v41];
      v29 = v42;
    }
  }
LABEL_13:
  if (v6) {
    v6[2](v6, 1);
  }
}

void __62__VUIActionPlay_performWithTargetResponder_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tvpPlaylist];
  v1 = [v2 currentMediaItem];
  +[VUILibraryMetrics recordPlayOfTVPMediaItem:v1];
}

void __62__VUIActionPlay_performWithTargetResponder_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tvpPlaylist];
  v1 = [v2 currentMediaItem];
  +[VUILibraryMetrics recordPlayOfTVPMediaItem:v1];
}

+ (void)_playPlayables:(id)a3 multiviewPlayables:(id)a4 appContext:(id)a5 watchType:(int64_t)a6 isUpNextPlayback:(BOOL)a7 userPlaybackInitiationDate:(id)a8 openURLCompletionDate:(id)a9 playType:(id)a10 playbackContext:(unint64_t)a11 targetResponder:(id)a12
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a8;
  id v19 = a9;
  id v38 = a10;
  id v37 = a12;
  int v35 = [v15 firstObject];
  id v40 = v15;
  v20 = [[VUIMediaInfo alloc] initWithPlaybackContext:a11 videosPlayables:v15 imageProxies:0 storeDictionary:0];
  v42 = v17;
  [(VUIMediaInfo *)v20 setAppContext:v17];
  [(VUIMediaInfo *)v20 setIntent:1];
  v36 = v20;
  unint64_t v21 = v19;
  [(VUIMediaInfo *)v20 setUserPlaybackInitiationDate:v18 openURLCompletionDate:v19];
  v22 = [MEMORY[0x1E4F1CA48] array];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = v16;
  uint64_t v23 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v46 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = *(void *)(*((void *)&v45 + 1) + 8 * i);
        uint64_t v28 = [VUIMediaInfo alloc];
        uint64_t v49 = v27;
        v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
        int v30 = [(VUIMediaInfo *)v28 initWithPlaybackContext:a11 videosPlayables:v29 imageProxies:0 storeDictionary:0];

        [(VUIMediaInfo *)v30 setAppContext:v42];
        [(VUIMediaInfo *)v30 setIntent:1];
        [(VUIMediaInfo *)v30 setUserPlaybackInitiationDate:v18 openURLCompletionDate:v21];
        [v22 addObject:v30];
      }
      uint64_t v24 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v24);
  }

  uint64_t v31 = objc_opt_class();
  unint64_t v32 = (void *)[v22 copy];
  v33 = [v35 extrasInfo];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __179__VUIActionPlay__playPlayables_multiviewPlayables_appContext_watchType_isUpNextPlayback_userPlaybackInitiationDate_openURLCompletionDate_playType_playbackContext_targetResponder___block_invoke;
  v43[3] = &unk_1E6DF9B60;
  id v44 = v35;
  id v34 = v35;
  [v31 _playMediaInfo:v36 multiviewMediaInfos:v32 watchType:a6 extrasInfo:v33 playType:v38 isRentAndWatchNow:0 targetResponder:v37 completion:v43];
}

uint64_t __179__VUIActionPlay__playPlayables_multiviewPlayables_appContext_watchType_isUpNextPlayback_userPlaybackInitiationDate_openURLCompletionDate_playType_playbackContext_targetResponder___block_invoke(uint64_t result, int a2, int a3)
{
  if (a2) {
    return +[VUIMetricsMediaEvent recordPlay:*(void *)(result + 32) isLaunchingExtras:a3 ^ 1u];
  }
  return result;
}

+ (void)playMediaInfo:(id)a3 watchType:(int64_t)a4 isRentAndWatchNow:(BOOL)a5
{
}

+ (void)playMediaInfo:(id)a3 watchType:(int64_t)a4 isRentAndWatchNow:(BOOL)a5 completion:(id)a6
{
}

+ (void)playMediaInfo:(id)a3 multiviewMediaInfos:(id)a4 watchType:(int64_t)a5 isRentAndWatchNow:(BOOL)a6
{
}

+ (void)playMediaInfo:(id)a3 multiviewMediaInfos:(id)a4 watchType:(int64_t)a5 isRentAndWatchNow:(BOOL)a6 completion:(id)a7
{
  BOOL v7 = a6;
  id v11 = a7;
  id v12 = a4;
  id v13 = a3;
  int64_t v14 = objc_opt_class();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __90__VUIActionPlay_playMediaInfo_multiviewMediaInfos_watchType_isRentAndWatchNow_completion___block_invoke;
  v16[3] = &unk_1E6DF4F40;
  id v17 = v11;
  id v15 = v11;
  [v14 _playMediaInfo:v13 multiviewMediaInfos:v12 watchType:a5 extrasInfo:0 playType:@"play" isRentAndWatchNow:v7 targetResponder:0 completion:v16];
}

uint64_t __90__VUIActionPlay_playMediaInfo_multiviewMediaInfos_watchType_isRentAndWatchNow_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (void)_playMediaInfo:(id)a3 multiviewMediaInfos:(id)a4 watchType:(int64_t)a5 extrasInfo:(id)a6 playType:(id)a7 isRentAndWatchNow:(BOOL)a8 targetResponder:(id)a9 completion:(id)a10
{
  BOOL v31 = a8;
  id v14 = a3;
  id v33 = a4;
  id v32 = a6;
  id v15 = a7;
  id v16 = a9;
  id v17 = a10;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __127__VUIActionPlay__playMediaInfo_multiviewMediaInfos_watchType_extrasInfo_playType_isRentAndWatchNow_targetResponder_completion___block_invoke;
  aBlock[3] = &unk_1E6DF4F40;
  id v18 = v17;
  id v45 = v18;
  id v19 = _Block_copy(aBlock);
  v20 = [v14 videosPlayables];
  unint64_t v21 = [v20 firstObject];
  v22 = [v21 sharedWatchId];

  uint64_t v23 = +[VUIInterfaceFactory sharedInstance];
  uint64_t v24 = [v23 groupActivitiesManager];
  char v25 = [v24 isSharedWatchIdValidForCurrentSession:v22];

  if (a5 == 1 && v22 && (v25 & 1) == 0)
  {
    int64_t v26 = VUIDefaultLogObject();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v26, OS_LOG_TYPE_DEFAULT, "VUIActionPlay - Ignoring playback request because the session does not match the shared watch id", buf, 2u);
    }

    (*((void (**)(void *, void, void))v19 + 2))(v19, 0, 0);
    uint64_t v28 = v32;
    uint64_t v27 = v33;
  }
  else
  {
    v29 = +[VUIPlaybackStartupCoordinator startupCoordinatorWithMediaInfo:v14 watchType:a5 isRentAndWatchNow:v31];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __127__VUIActionPlay__playMediaInfo_multiviewMediaInfos_watchType_extrasInfo_playType_isRentAndWatchNow_targetResponder_completion___block_invoke_51;
    v34[3] = &unk_1E6DF9B88;
    id v35 = v29;
    int64_t v42 = a5;
    id v36 = v14;
    uint64_t v27 = v33;
    id v37 = v33;
    uint64_t v28 = v32;
    id v38 = v32;
    id v39 = v15;
    id v40 = v16;
    id v41 = v19;
    id v30 = v29;
    [v30 performPlaybackStartupFlowWithCompletion:v34];
  }
}

uint64_t __127__VUIActionPlay__playMediaInfo_multiviewMediaInfos_watchType_extrasInfo_playType_isRentAndWatchNow_targetResponder_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __127__VUIActionPlay__playMediaInfo_multiviewMediaInfos_watchType_extrasInfo_playType_isRentAndWatchNow_targetResponder_completion___block_invoke_51(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, unsigned int a5, uint64_t a6, uint64_t a7, void *a8)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v13 = a8;
  id v14 = VUIDefaultLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218752;
    uint64_t v23 = a2;
    __int16 v24 = 2048;
    uint64_t v25 = a3;
    __int16 v26 = 2048;
    uint64_t v27 = a4;
    __int16 v28 = 2048;
    uint64_t v29 = a5;
    _os_log_impl(&dword_1E2BD7000, v14, OS_LOG_TYPE_DEFAULT, "VUIActionPlay - Startup coordinator finished startup flow.  startPlayback == %ld, isCoWatching == %ld, forceDownloadToStream == %ld, allowCellular == %ld", buf, 0x2Au);
  }

  id v15 = VUIDefaultLogObject();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_DEFAULT, "VUIActionPlay - Starting playback since startup flow allowed it", buf, 2u);
    }

    if (a3 && *(void *)(a1 + 88) == 1)
    {
      id v17 = VUIDefaultLogObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v17, OS_LOG_TYPE_DEFAULT, "VUIActionPlay - Playback will be co-watched, will use existing resume time for join", buf, 2u);
      }
    }
    if (a4)
    {
      id v18 = VUIDefaultLogObject();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v18, OS_LOG_TYPE_DEFAULT, "VUIActionPlay - Forcing downloaded video to be streamed", buf, 2u);
      }

      id v19 = [*(id *)(a1 + 40) tvpPlaylist];
      v20 = [v19 currentMediaItem];

      [v20 setMediaItemMetadata:MEMORY[0x1E4F1CC38] forProperty:*MEMORY[0x1E4FA9F10]];
    }
    LOBYTE(v21) = a5;
    +[VUIActionPlay presentPlaybackWithMediaInfo:*(void *)(a1 + 40) multiviewMediaInfos:*(void *)(a1 + 48) extrasInfo:*(void *)(a1 + 56) isCoWatching:a3 watchType:*(void *)(a1 + 88) playType:*(void *)(a1 + 64) allowsCellular:v21 previewMetadata:v13 targetResponder:*(void *)(a1 + 72) completion:*(void *)(a1 + 80)];
  }
  else
  {
    if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_DEFAULT, "VUIActionPlay - Not starting playback since startup flow disallowed it", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
}

+ (void)presentPlaybackWithMediaInfo:(id)a3 multiviewMediaInfos:(id)a4 extrasInfo:(id)a5 isCoWatching:(BOOL)a6 watchType:(int64_t)a7 playType:(id)a8 allowsCellular:(BOOL)a9 previewMetadata:(id)a10 targetResponder:(id)a11 completion:(id)a12
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v69 = a4;
  id v15 = a8;
  id v16 = a10;
  id v17 = a11;
  id v18 = a12;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __167__VUIActionPlay_presentPlaybackWithMediaInfo_multiviewMediaInfos_extrasInfo_isCoWatching_watchType_playType_allowsCellular_previewMetadata_targetResponder_completion___block_invoke;
  aBlock[3] = &unk_1E6DF3D80;
  id v67 = v18;
  id v75 = v67;
  v66 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  uint64_t v19 = [v14 tvpPlaylist];
  v65 = +[VUIApplicationRouter currentNavigationController];
  v64 = [v65 topViewController];
  v20 = [v64 presentedViewController];
  v68 = (void *)v19;
  v63 = v20;
  if (!v20
    || (uint64_t v21 = v20, ([v20 isBeingDismissed] & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v22 = +[VUITVAppLauncher sharedInstance];
    uint64_t v23 = [v22 appWindow];

    id v24 = [v23 rootViewController];

    if (!v24)
    {
      uint64_t v25 = +[VUIInterfaceFactory sharedInstance];
      id v24 = [v25 controllerPresenter];
    }
  }
  else
  {
    id v24 = v21;
  }
  id v62 = v24;
  __int16 v26 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v27 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v14, "playbackContext"));
  [v26 setObject:v27 forKey:VUIPlaybackManagerPresentPlaylistUserInfoPlaybackContext[0]];

  __int16 v28 = [v14 videosPlayables];
  uint64_t v29 = [v28 firstObject];
  uint64_t v30 = [v29 metadata];

  if (v30)
  {
    BOOL v31 = [v14 videosPlayables];
    id v32 = [v31 firstObject];
    id v33 = [v32 metadata];
    id v34 = v17;
    id v35 = v16;
    id v36 = v15;
    uint64_t v37 = [v33 isEligibleForPlayerTabs];

    uint64_t v38 = v37;
    id v15 = v36;
    id v16 = v35;
    id v17 = v34;
    id v39 = [MEMORY[0x1E4F28ED0] numberWithBool:v38];
    [v26 setObject:v39 forKey:VUIPlaybackManagerPresentPlaylistUserInfoIsEligibleForPlayerTabs[0]];
  }
  objc_msgSend(v26, "vui_setObjectIfNotNil:forKey:", v16, VUIPlaybackManagerPresentPlaylistUserInfoSharedWatchMetadata[0]);
  id v40 = [v14 videosPlayables];
  id v41 = [v40 firstObject];
  int64_t v42 = [v41 sharedWatchId];
  objc_msgSend(v26, "vui_setObjectIfNotNil:forKey:", v42, VUIPlaybackManagerPresentPlaylistUserInfoSharedWatchId[0]);

  v43 = [v14 videosPlayables];
  id v44 = [v43 firstObject];
  id v45 = [v44 sharedWatchUrl];
  objc_msgSend(v26, "vui_setObjectIfNotNil:forKey:", v45, VUIPlaybackManagerPresentPlaylistUserInfoSharedWatchURL[0]);

  objc_msgSend(v26, "vui_setObjectIfNotNil:forKey:", v17, VUIPlaybackManagerPresentPlaylistUserInfoTargetResponder[0]);
  if ([v15 isEqualToString:@"multiview"])
  {
    long long v46 = +[VUIPlaybackManager sharedInstance];
    long long v47 = v68;
    [v46 addPlaylistToMultiview:v68 animated:1 completion:0];
    long long v48 = v69;
    uint64_t v49 = v62;
  }
  else
  {
    id v60 = v16;
    id v61 = v15;
    long long v46 = [MEMORY[0x1E4F1CA48] arrayWithObject:v68];
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v50 = v69;
    uint64_t v51 = [v50 countByEnumeratingWithState:&v70 objects:v76 count:16];
    if (v51)
    {
      uint64_t v52 = v51;
      uint64_t v53 = *(void *)v71;
      do
      {
        uint64_t v54 = 0;
        do
        {
          if (*(void *)v71 != v53) {
            objc_enumerationMutation(v50);
          }
          v55 = [*(id *)(*((void *)&v70 + 1) + 8 * v54) tvpPlaylist];
          [v46 addObject:v55];

          ++v54;
        }
        while (v52 != v54);
        uint64_t v52 = [v50 countByEnumeratingWithState:&v70 objects:v76 count:16];
      }
      while (v52);
    }

    unint64_t v56 = [v46 count];
    v57 = +[VUIPlaybackManager sharedInstance];
    v58 = v57;
    if (v56 < 2)
    {
      v59 = (void *)[v26 copy];
      long long v47 = v68;
      uint64_t v49 = v62;
      objc_msgSend(v58, "presentPlaylist:fromViewController:dismissalOperation:allowsCellular:animated:userInfo:completion:", v68, 0);

      id v16 = v60;
    }
    else
    {
      uint64_t v49 = v62;
      [v57 presentMultiviewWithPlaylists:v46 fromViewController:v62 animated:1];
      id v16 = v60;
      long long v47 = v68;
    }

    long long v48 = v69;
    id v15 = v61;
  }

  v66[2](v66, 1);
}

uint64_t __167__VUIActionPlay_presentPlaybackWithMediaInfo_multiviewMediaInfos_extrasInfo_isCoWatching_watchType_playType_allowsCellular_previewMetadata_targetResponder_completion___block_invoke(uint64_t result)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    id v2 = VUIDefaultLogObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = [MEMORY[0x1E4F1C9C8] date];
      int v6 = 138412290;
      BOOL v7 = v3;
      _os_log_impl(&dword_1E2BD7000, v2, OS_LOG_TYPE_DEFAULT, "VUIActionPlay - DropOnTab: resetting last playback date %@", (uint8_t *)&v6, 0xCu);
    }
    v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v5 = [MEMORY[0x1E4F1C9C8] date];
    [v4 setObject:v5 forKey:@"lastPlaybackDate"];

    return (*(uint64_t (**)(void))(*(void *)(v1 + 32) + 16))();
  }
  return result;
}

- (BOOL)isAccountRequired
{
  unint64_t v3 = [(VUIActionPlay *)self playbackContext];
  v4 = [(VUIActionPlay *)self videosPlayables];
  v5 = [v4 firstObject];
  int v6 = [v5 mediaType];

  int v7 = [v6 isEqualToString:@"Trailer"];
  BOOL v8 = v3 == 3;
  BOOL v9 = v3 != 3;
  if (!v8 && v7) {
    BOOL v9 = [(VUIActionPlay *)self playRequiresAccount];
  }

  return v9;
}

- (NSDictionary)contextData
{
  return self->_contextData;
}

- (void)setContextData:(id)a3
{
}

- (NSArray)videosPlayables
{
  return self->_videosPlayables;
}

- (void)setVideosPlayables:(id)a3
{
}

- (VUIAppContext)appContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);
  return (VUIAppContext *)WeakRetained;
}

- (void)setAppContext:(id)a3
{
}

- (NSDate)userPlaybackInitiationDate
{
  return self->_userPlaybackInitiationDate;
}

- (void)setUserPlaybackInitiationDate:(id)a3
{
}

- (NSDate)openURLCompletionDate
{
  return self->_openURLCompletionDate;
}

- (void)setOpenURLCompletionDate:(id)a3
{
}

- (BOOL)isUpNextPlayback
{
  return self->_upNextPlayback;
}

- (void)setUpNextPlayback:(BOOL)a3
{
  self->_upNextPlayback = a3;
}

- (MPMediaItem)mpMediaItem
{
  return self->_mpMediaItem;
}

- (void)setMpMediaItem:(id)a3
{
}

- (NSString)sidebandLibraryAdamID
{
  return self->_sidebandLibraryAdamID;
}

- (void)setSidebandLibraryAdamID:(id)a3
{
}

- (int64_t)watchType
{
  return self->_watchType;
}

- (void)setWatchType:(int64_t)a3
{
  self->_watchType = a3;
}

- (unint64_t)playbackContext
{
  return self->_playbackContext;
}

- (void)setPlaybackContext:(unint64_t)a3
{
  self->_playbackContext = a3;
}

- (BOOL)isRentAndWatchNow
{
  return self->_isRentAndWatchNow;
}

- (void)setIsRentAndWatchNow:(BOOL)a3
{
  self->_isRentAndWatchNow = a3;
}

- (BOOL)playRequiresAccount
{
  return self->_playRequiresAccount;
}

- (void)setPlayRequiresAccount:(BOOL)a3
{
  self->_playRequiresAccount = a3;
}

- (NSArray)multiviewPlayables
{
  return self->_multiviewPlayables;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiviewPlayables, 0);
  objc_storeStrong((id *)&self->_sidebandLibraryAdamID, 0);
  objc_storeStrong((id *)&self->_mpMediaItem, 0);
  objc_storeStrong((id *)&self->_openURLCompletionDate, 0);
  objc_storeStrong((id *)&self->_userPlaybackInitiationDate, 0);
  objc_destroyWeak((id *)&self->_appContext);
  objc_storeStrong((id *)&self->_videosPlayables, 0);
  objc_storeStrong((id *)&self->_contextData, 0);
}

@end