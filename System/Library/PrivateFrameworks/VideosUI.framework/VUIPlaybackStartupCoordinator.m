@interface VUIPlaybackStartupCoordinator
+ (id)identifierForMediaInfo:(id)a3;
+ (id)startupCoordinatorWithMediaInfo:(id)a3 watchType:(int64_t)a4 isRentAndWatchNow:(BOOL)a5;
+ (id)startupCoordinators;
+ (void)initialize;
- (BOOL)_existingPlaybackSessionAllowsCellular;
- (BOOL)_mediaItemIsBeingDownloadedAndDownloadAllowsCellular:(id)a3;
- (BOOL)_shouldPromptForExpiredDownload:(id)a3;
- (BOOL)_shouldWarnAboutRentalPlaybackQualityForRentalMediaItem:(id)a3;
- (BOOL)_shouldWarnStartingRentalPlaybackWindowWithMediaItem:(id)a3;
- (BOOL)forceDownloadToStream;
- (BOOL)isCellularAllowed;
- (BOOL)isRentAndWatchNow;
- (NSDictionary)contentMetadata;
- (NSString)adamID;
- (NSString)mediaType;
- (NSString)showCanonicalID;
- (NSString)videoCanonicalID;
- (TVPStateMachine)stateMachine;
- (VUIControllerPresenter)presentingViewController;
- (VUIMediaInfo)mediaInfo;
- (VUIPlaybackStartupCoordinator)initWithAdamID:(id)a3 watchType:(int64_t)a4 isRentAndWatchNow:(BOOL)a5;
- (VUIPlaybackStartupCoordinator)initWithAdamID:(id)a3 watchType:(int64_t)a4 isRentAndWatchNow:(BOOL)a5 contentMetadata:(id)a6;
- (VUIPlaybackStartupCoordinator)initWithCanonicalID:(id)a3 showCanonicalID:(id)a4 mediaType:(id)a5 watchType:(int64_t)a6 isRentAndWatchNow:(BOOL)a7;
- (VUIPlaybackStartupCoordinator)initWithCanonicalID:(id)a3 showCanonicalID:(id)a4 mediaType:(id)a5 watchType:(int64_t)a6 isRentAndWatchNow:(BOOL)a7 contentMetadata:(id)a8;
- (VUIPlaybackStartupCoordinator)initWithMediaInfo:(id)a3 watchType:(int64_t)a4 isRentAndWatchNow:(BOOL)a5;
- (VUIVideosPlayable)resolvedPlayable;
- (id)_addQueryParamsToSharedWatchURL:(id)a3 watchType:(int64_t)a4 groupActivityDay:(id)a5;
- (id)_descriptionForStartupAction:(int64_t)a3;
- (id)_descriptionForWatchType:(int64_t)a3;
- (id)completion;
- (int64_t)watchType;
- (void)_addGroupActivityDayParamToPlayableAndMediaItem:(id)a3;
- (void)_checkIfAllowedToPlayOnCellularNetworkWithMediaItem:(id)a3 presentingController:(id)a4 completion:(id)a5;
- (void)_configureFor2Dor3DWithPresentingController:(id)a3 completion:(id)a4;
- (void)_performRatingAndAgeVerificationWithMediaItem:(id)a3 presentingController:(id)a4 completion:(id)a5;
- (void)_preflightPlaybackWithPlaylist:(id)a3 presentingViewController:(id)a4 completionHandler:(id)a5;
- (void)_presentCantPlaybackOverCellularAlertControllerWithMediaItem:(id)a3 presentingViewController:(id)a4 completionHandler:(id)a5;
- (void)_presentStartingPlaybackWindowWarningWithRentalMediaItem:(id)a3 presentingViewController:(id)a4 completionHandler:(id)a5;
- (void)_registerStateMachineHandlers;
- (void)_showAlertControllerForExpirationPromptForDownload:(id)a3 presentingViewController:(id)a4;
- (void)_showCellularPlaybackQualityOptionsForRentalMediaItem:(id)a3 presentingViewController:(id)a4 completionHandler:(id)a5;
- (void)dealloc;
- (void)performPlaybackStartupFlowWithCompletion:(id)a3;
- (void)setAdamID:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setContentMetadata:(id)a3;
- (void)setForceDownloadToStream:(BOOL)a3;
- (void)setIsCellularAllowed:(BOOL)a3;
- (void)setIsRentAndWatchNow:(BOOL)a3;
- (void)setMediaInfo:(id)a3;
- (void)setMediaType:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setResolvedPlayable:(id)a3;
- (void)setShowCanonicalID:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)setVideoCanonicalID:(id)a3;
- (void)setWatchType:(int64_t)a3;
@end

@implementation VUIPlaybackStartupCoordinator

+ (void)initialize
{
  if (initialize_onceToken_10 != -1) {
    dispatch_once(&initialize_onceToken_10, &__block_literal_global_110);
  }
}

void __43__VUIPlaybackStartupCoordinator_initialize__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.AppleTV.playback", "VUIPlaybackStartupCoordinator");
  v1 = (void *)sLogObject_18;
  sLogObject_18 = (uint64_t)v0;
}

+ (id)startupCoordinators
{
  if (startupCoordinators_onceToken != -1) {
    dispatch_once(&startupCoordinators_onceToken, &__block_literal_global_125);
  }
  v2 = (void *)startupCoordinators___coordinators;
  return v2;
}

void __52__VUIPlaybackStartupCoordinator_startupCoordinators__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)startupCoordinators___coordinators;
  startupCoordinators___coordinators = (uint64_t)v0;
}

+ (id)identifierForMediaInfo:(id)a3
{
  v3 = [a3 tvpPlaylist];
  v4 = [v3 currentMediaItem];

  v5 = [v4 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0D8]];
  if (!v5)
  {
    v5 = [v4 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E28]];
    if (!v5)
    {
      v6 = [v4 mediaItemURL];
      v5 = [v6 absoluteString];
    }
  }

  return v5;
}

+ (id)startupCoordinatorWithMediaInfo:(id)a3 watchType:(int64_t)a4 isRentAndWatchNow:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v9 = [a1 identifierForMediaInfo:v8];
  if ([v9 length]
    && ([a1 startupCoordinators],
        v10 = objc_claimAutoreleasedReturnValue(),
        [v10 objectForKey:v9],
        v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11))
  {
    v12 = [a1 startupCoordinators];
    v13 = [v12 objectForKey:v9];
  }
  else
  {
    v13 = [[VUIPlaybackStartupCoordinator alloc] initWithMediaInfo:v8 watchType:a4 isRentAndWatchNow:v5];
    if (![v9 length]) {
      goto LABEL_7;
    }
    v12 = [a1 startupCoordinators];
    [v12 setObject:v13 forKey:v9];
  }

LABEL_7:
  return v13;
}

- (VUIPlaybackStartupCoordinator)initWithMediaInfo:(id)a3 watchType:(int64_t)a4 isRentAndWatchNow:(BOOL)a5
{
  id v9 = a3;
  v19.receiver = self;
  v19.super_class = (Class)VUIPlaybackStartupCoordinator;
  v10 = [(VUIPlaybackStartupCoordinator *)&v19 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_mediaInfo, a3);
    v11->_watchType = a4;
    v11->_isRentAndWatchNow = a5;
    id v12 = objc_alloc(MEMORY[0x1E4F28E78]);
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = initWithMediaInfo_watchType_isRentAndWatchNow__instanceNumber++;
    v15 = (void *)[v12 initWithFormat:@"%@ %ld", v13, v14];
    uint64_t v16 = [objc_alloc(MEMORY[0x1E4FA9DA8]) initWithName:v15 initialState:@"Waiting to start" mode:0];
    stateMachine = v11->_stateMachine;
    v11->_stateMachine = (TVPStateMachine *)v16;

    [(TVPStateMachine *)v11->_stateMachine setLogObject:sLogObject_18];
    [(VUIPlaybackStartupCoordinator *)v11 _registerStateMachineHandlers];
    [(TVPStateMachine *)v11->_stateMachine setShouldAcceptEvents:1];
    [(VUIPlaybackStartupCoordinator *)v11 _registerGroupActivitiesNotification];
  }
  return v11;
}

- (VUIPlaybackStartupCoordinator)initWithAdamID:(id)a3 watchType:(int64_t)a4 isRentAndWatchNow:(BOOL)a5
{
  return [(VUIPlaybackStartupCoordinator *)self initWithAdamID:a3 watchType:a4 isRentAndWatchNow:a5 contentMetadata:0];
}

- (VUIPlaybackStartupCoordinator)initWithAdamID:(id)a3 watchType:(int64_t)a4 isRentAndWatchNow:(BOOL)a5 contentMetadata:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)VUIPlaybackStartupCoordinator;
  uint64_t v13 = [(VUIPlaybackStartupCoordinator *)&v22 init];
  uint64_t v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_adamID, a3);
    v14->_watchType = a4;
    v14->_isRentAndWatchNow = a5;
    objc_storeStrong((id *)&v14->_contentMetadata, a6);
    id v15 = objc_alloc(MEMORY[0x1E4F28E78]);
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = initWithAdamID_watchType_isRentAndWatchNow_contentMetadata__instanceNumber++;
    v18 = (void *)[v15 initWithFormat:@"%@ %ld", v16, v17];
    uint64_t v19 = [objc_alloc(MEMORY[0x1E4FA9DA8]) initWithName:v18 initialState:@"Waiting to start" mode:0];
    stateMachine = v14->_stateMachine;
    v14->_stateMachine = (TVPStateMachine *)v19;

    [(VUIPlaybackStartupCoordinator *)v14 _registerStateMachineHandlers];
    [(TVPStateMachine *)v14->_stateMachine setShouldAcceptEvents:1];
    [(VUIPlaybackStartupCoordinator *)v14 _registerGroupActivitiesNotification];
  }
  return v14;
}

- (VUIPlaybackStartupCoordinator)initWithCanonicalID:(id)a3 showCanonicalID:(id)a4 mediaType:(id)a5 watchType:(int64_t)a6 isRentAndWatchNow:(BOOL)a7
{
  return [(VUIPlaybackStartupCoordinator *)self initWithCanonicalID:a3 showCanonicalID:a4 mediaType:a5 watchType:a6 isRentAndWatchNow:a7 contentMetadata:0];
}

- (VUIPlaybackStartupCoordinator)initWithCanonicalID:(id)a3 showCanonicalID:(id)a4 mediaType:(id)a5 watchType:(int64_t)a6 isRentAndWatchNow:(BOOL)a7 contentMetadata:(id)a8
{
  id v27 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  v28.receiver = self;
  v28.super_class = (Class)VUIPlaybackStartupCoordinator;
  v18 = [(VUIPlaybackStartupCoordinator *)&v28 init];
  uint64_t v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_videoCanonicalID, a3);
    objc_storeStrong((id *)&v19->_showCanonicalID, a4);
    objc_storeStrong((id *)&v19->_mediaType, a5);
    v19->_watchType = a6;
    v19->_isRentAndWatchNow = a7;
    objc_storeStrong((id *)&v19->_contentMetadata, a8);
    id v20 = objc_alloc(MEMORY[0x1E4F28E78]);
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = initWithCanonicalID_showCanonicalID_mediaType_watchType_isRentAndWatchNow_contentMetadata__instanceNumber++;
    v23 = (void *)[v20 initWithFormat:@"%@ %ld", v21, v22];
    uint64_t v24 = [objc_alloc(MEMORY[0x1E4FA9DA8]) initWithName:v23 initialState:@"Waiting to start" mode:0];
    stateMachine = v19->_stateMachine;
    v19->_stateMachine = (TVPStateMachine *)v24;

    [(VUIPlaybackStartupCoordinator *)v19 _registerStateMachineHandlers];
    [(TVPStateMachine *)v19->_stateMachine setShouldAcceptEvents:1];
    [(VUIPlaybackStartupCoordinator *)v19 _registerGroupActivitiesNotification];
  }
  return v19;
}

- (void)dealloc
{
  v3 = sLogObject_18;
  if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "VUIPlaybackStartupCoordinator deallocated", buf, 2u);
  }
  v4.receiver = self;
  v4.super_class = (Class)VUIPlaybackStartupCoordinator;
  [(VUIPlaybackStartupCoordinator *)&v4 dealloc];
}

- (void)performPlaybackStartupFlowWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(VUIPlaybackStartupCoordinator *)self stateMachine];
  BOOL v5 = _Block_copy(v4);

  [v6 postEvent:@"Start" withContext:v5 userInfo:0];
}

- (id)_descriptionForWatchType:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return 0;
  }
  else {
    return off_1E6DFA600[a3];
  }
}

- (id)_descriptionForStartupAction:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return 0;
  }
  else {
    return off_1E6DFA628[a3];
  }
}

- (id)_addQueryParamsToSharedWatchURL:(id)a3 watchType:(int64_t)a4 groupActivityDay:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v9 = v7;
  v10 = v9;
  id v11 = v9;
  if ((unint64_t)a4 <= 4)
  {
    id v11 = v9;
    if (((1 << a4) & 0x19) != 0)
    {
      id v11 = v9;
      if ([v8 length])
      {
        id v11 = objc_msgSend(v10, "vui_URLByAddingQueryParamWithName:value:", @"groupActivityDay", v8);
      }
    }
  }
  if (a4 == 4)
  {
    id v12 = objc_msgSend(v11, "vui_URLByAddingQueryParamWithName:value:", @"postPlay", @"true");

    uint64_t v14 = @"false";
    uint64_t v13 = v12;
  }
  else
  {
    if (a4 != 3) {
      goto LABEL_10;
    }
    id v12 = objc_msgSend(v11, "vui_URLByAddingQueryParamWithName:value:", @"postPlay", @"true");

    uint64_t v13 = v12;
    uint64_t v14 = @"true";
  }
  id v11 = objc_msgSend(v13, "vui_URLByAddingQueryParamWithName:value:", @"binge", v14);

LABEL_10:
  id v15 = sLogObject_18;
  if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    v18 = v11;
    _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_DEFAULT, "Shared watch URL after adding query params: %@", (uint8_t *)&v17, 0xCu);
  }

  return v11;
}

- (void)_addGroupActivityDayParamToPlayableAndMediaItem:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(VUIPlaybackStartupCoordinator *)self resolvedPlayable];
    if (v5) {
      goto LABEL_4;
    }
    id v6 = [(VUIPlaybackStartupCoordinator *)self mediaInfo];
    id v7 = [v6 videosPlayables];
    BOOL v5 = [v7 firstObject];

    if (v5)
    {
LABEL_4:
      id v8 = [v5 hlsURL];
      id v9 = objc_msgSend(v8, "vui_URLByAddingQueryParamWithName:value:", @"groupActivityDay", v4);

      [v5 setHlsURL:v9];
    }
    v10 = [(VUIPlaybackStartupCoordinator *)self mediaInfo];
    id v11 = [v10 tvpPlaylist];
    id v12 = [v11 currentMediaItem];

    [v12 setMediaItemMetadata:v4 forProperty:@"VUIContentMetadataGroupActivityDay"];
  }
  else if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_ERROR))
  {
    -[VUIPlaybackStartupCoordinator _addGroupActivityDayParamToPlayableAndMediaItem:]();
  }
}

- (void)_registerStateMachineHandlers
{
  objc_initWeak(location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_2;
  aBlock[3] = &unk_1E6DFA138;
  objc_copyWeak(&v147, location);
  v3 = _Block_copy(aBlock);
  v143[0] = MEMORY[0x1E4F143A8];
  v143[1] = 3221225472;
  v143[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_3;
  v143[3] = &unk_1E6DFA1B0;
  objc_copyWeak(&v145, location);
  id v4 = v3;
  id v144 = v4;
  BOOL v5 = _Block_copy(v143);
  v140[0] = MEMORY[0x1E4F143A8];
  v140[1] = 3221225472;
  v140[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_2_181;
  v140[3] = &unk_1E6DFA228;
  objc_copyWeak(&v142, location);
  id v141 = &__block_literal_global_169;
  id v6 = _Block_copy(v140);
  v138[0] = MEMORY[0x1E4F143A8];
  v138[1] = 3221225472;
  v138[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_5;
  v138[3] = &unk_1E6DFA278;
  objc_copyWeak(&v139, location);
  v64 = _Block_copy(v138);
  v136[0] = MEMORY[0x1E4F143A8];
  v136[1] = 3221225472;
  v136[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_7;
  v136[3] = &unk_1E6DFA2E8;
  objc_copyWeak(&v137, location);
  id v7 = _Block_copy(v136);
  v134[0] = MEMORY[0x1E4F143A8];
  v134[1] = 3221225472;
  v134[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_10;
  v134[3] = &unk_1E6DF8228;
  id v62 = v7;
  id v135 = v62;
  v65 = _Block_copy(v134);
  v132[0] = MEMORY[0x1E4F143A8];
  v132[1] = 3221225472;
  v132[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_12;
  v132[3] = &unk_1E6DFA310;
  objc_copyWeak(&v133, location);
  id v8 = _Block_copy(v132);
  v130[0] = MEMORY[0x1E4F143A8];
  v130[1] = 3221225472;
  v130[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_13;
  v130[3] = &unk_1E6DFA360;
  objc_copyWeak(&v131, location);
  id v9 = _Block_copy(v130);
  v124[0] = MEMORY[0x1E4F143A8];
  v124[1] = 3221225472;
  v124[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_17;
  v124[3] = &unk_1E6DFA3B0;
  objc_copyWeak(&v129, location);
  id v10 = v6;
  id v125 = v10;
  id v11 = v5;
  id v126 = v11;
  id v12 = v8;
  id v127 = v12;
  id v13 = v9;
  id v128 = v13;
  uint64_t v14 = _Block_copy(v124);
  v121[0] = MEMORY[0x1E4F143A8];
  v121[1] = 3221225472;
  v121[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_254;
  v121[3] = &unk_1E6DFA228;
  objc_copyWeak(&v123, location);
  id v61 = v4;
  id v122 = v61;
  v63 = _Block_copy(v121);
  v117[0] = MEMORY[0x1E4F143A8];
  v117[1] = 3221225472;
  v117[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_280;
  v117[3] = &unk_1E6DFA400;
  objc_copyWeak(&v120, location);
  id v118 = &__block_literal_global_266;
  id v15 = v10;
  id v119 = v15;
  id v16 = _Block_copy(v117);
  v111[0] = MEMORY[0x1E4F143A8];
  v111[1] = 3221225472;
  v111[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_285;
  v111[3] = &unk_1E6DFA3B0;
  objc_copyWeak(&v116, location);
  id v17 = v15;
  id v112 = v17;
  id v18 = v11;
  id v113 = v18;
  id v19 = v12;
  id v114 = v19;
  id v20 = v16;
  id v115 = v20;
  uint64_t v21 = _Block_copy(v111);
  v109[0] = MEMORY[0x1E4F143A8];
  v109[1] = 3221225472;
  v109[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_286;
  v109[3] = &unk_1E6DFA360;
  objc_copyWeak(&v110, location);
  v66 = (id *)_Block_copy(v109);
  uint64_t v22 = [(VUIPlaybackStartupCoordinator *)self stateMachine];
  v101[0] = MEMORY[0x1E4F143A8];
  v101[1] = 3221225472;
  v101[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_3_290;
  v101[3] = &unk_1E6DFA450;
  objc_copyWeak(&v108, location);
  id v60 = v14;
  id v102 = v60;
  id v23 = v19;
  id v103 = v23;
  id v24 = v20;
  id v104 = v24;
  id v25 = v13;
  id v105 = v25;
  id v59 = v21;
  id v106 = v59;
  id v26 = v17;
  id v107 = v26;
  [v22 registerHandlerForEvent:@"Start" onState:@"Waiting to start" withBlock:v101];

  id v27 = [(VUIPlaybackStartupCoordinator *)self stateMachine];
  [v27 registerDefaultHandlerForEvent:@"Start" withBlock:&__block_literal_global_294];

  objc_super v28 = [(VUIPlaybackStartupCoordinator *)self stateMachine];
  v93[0] = MEMORY[0x1E4F143A8];
  v93[1] = 3221225472;
  v93[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_2_296;
  v93[3] = &unk_1E6DFA450;
  objc_copyWeak(&v100, location);
  id v29 = v23;
  id v94 = v29;
  id v30 = v24;
  id v95 = v30;
  v31 = v66;
  v96 = v31;
  id v32 = v25;
  id v97 = v32;
  id v33 = v26;
  id v98 = v33;
  id v34 = v18;
  id v99 = v34;
  [v28 registerHandlerForEvent:@"Attempt to start co-watching complete" onState:@"Attempting to start co-watching" withBlock:v93];
  v58 = v31;

  v35 = [(VUIPlaybackStartupCoordinator *)self stateMachine];
  v90[0] = MEMORY[0x1E4F143A8];
  v90[1] = 3221225472;
  v90[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_297;
  v90[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v92, location);
  id v36 = v34;
  id v91 = v36;
  [v35 registerHandlerForEvent:@"Co-watch session handling complete" onState:@"Waiting for co-watch session to be handled" withBlock:v90];

  v37 = [(VUIPlaybackStartupCoordinator *)self stateMachine];
  v84[0] = MEMORY[0x1E4F143A8];
  v84[1] = 3221225472;
  v84[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_304;
  v84[3] = &unk_1E6DF7890;
  objc_copyWeak(&v89, location);
  id v38 = v29;
  id v85 = v38;
  id v57 = v30;
  id v86 = v57;
  id v39 = v65;
  id v87 = v39;
  id v40 = v36;
  id v88 = v40;
  [v37 registerHandlerForEvent:@"Share URL resolution complete" onState:@"Waiting for share URL for be resolved" withBlock:v84];

  v41 = [(VUIPlaybackStartupCoordinator *)self stateMachine];
  v81[0] = MEMORY[0x1E4F143A8];
  v81[1] = 3221225472;
  v81[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_306;
  v81[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v83, location);
  id v42 = v33;
  id v82 = v42;
  [v41 registerHandlerForEvent:@"Watch alone button pressed" onState:@"Asking whether to watch alone or cancel due to content being unavailable" withBlock:v81];
  v56 = v42;

  v43 = [(VUIPlaybackStartupCoordinator *)self stateMachine];
  v78[0] = MEMORY[0x1E4F143A8];
  v78[1] = 3221225472;
  v78[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_307;
  v78[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v80, location);
  id v44 = v40;
  id v79 = v44;
  [v43 registerHandlerForEvent:@"Watch cancel button pressed" onState:@"Asking whether to watch alone or cancel due to content being unavailable" withBlock:v78];
  v55 = v32;

  v45 = [(VUIPlaybackStartupCoordinator *)self stateMachine];
  v54 = v39;
  v73[0] = MEMORY[0x1E4F143A8];
  v73[1] = 3221225472;
  v73[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_308;
  v73[3] = &unk_1E6DF7978;
  objc_copyWeak(&v77, location);
  id v46 = v64;
  id v74 = v46;
  id v47 = v44;
  id v75 = v47;
  id v48 = v63;
  id v76 = v48;
  [v45 registerHandlerForEvent:@"Preflight complete" onState:@"Performing preflight" withBlock:v73];

  v49 = [(VUIPlaybackStartupCoordinator *)self stateMachine];
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_2_310;
  v69[3] = &unk_1E6DF6560;
  objc_copyWeak(&v72, location);
  id v50 = v47;
  id v70 = v50;
  id v51 = v48;
  id v71 = v51;
  [v49 registerHandlerForEvent:@"Route selection complete" onState:@"Performing route selection" withBlock:v69];

  v52 = [(VUIPlaybackStartupCoordinator *)self stateMachine];
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_3_311;
  v67[3] = &unk_1E6DF6470;
  id v53 = v50;
  id v68 = v53;
  [v52 registerDefaultHandlerForEvent:@"Preflight cancelled" withBlock:v67];

  objc_destroyWeak(&v72);
  objc_destroyWeak(&v77);

  objc_destroyWeak(&v80);
  objc_destroyWeak(&v83);

  objc_destroyWeak(&v89);
  objc_destroyWeak(&v92);

  objc_destroyWeak(&v100);
  objc_destroyWeak(&v108);

  objc_destroyWeak(&v110);
  objc_destroyWeak(&v116);

  objc_destroyWeak(&v120);
  objc_destroyWeak(&v123);

  objc_destroyWeak(&v129);
  objc_destroyWeak(&v131);

  objc_destroyWeak(&v133);
  objc_destroyWeak(&v137);

  objc_destroyWeak(&v139);
  objc_destroyWeak(&v142);

  objc_destroyWeak(&v145);
  objc_destroyWeak(&v147);
  objc_destroyWeak(location);
}

id __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke()
{
  id v0 = +[VUIPlaybackManager sharedInstance];
  v1 = [v0 fullScreenViewControllerForPresentation];

  if (!v1)
  {
    v1 = +[VUIApplicationRouter currentNavigationController];
    if (!v1)
    {
      v2 = +[VUIInterfaceFactory sharedInstance];
      v1 = [v2 controllerPresenter];

      if (!v1)
      {
        v3 = +[VUITVAppLauncher sharedInstance];
        id v4 = [v3 appWindow];

        v1 = [v4 rootViewController];
      }
    }
  }
  return v1;
}

VUIGroupWatchActivityPreviewMetadata *__62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained resolvedPlayable];
  if (!v2)
  {
    uint64_t v14 = [WeakRetained mediaInfo];
    id v15 = [v14 videosPlayables];
    id v16 = [v15 firstObject];

    if (v16)
    {
      id v17 = [WeakRetained mediaInfo];
      id v18 = [v17 videosPlayables];
      v2 = [v18 firstObject];

      id v19 = [VUIGroupWatchActivityPreviewMetadata alloc];
      id v10 = [v2 sharedWatchUrl];
      id v13 = [(VUIGroupWatchActivityPreviewMetadata *)v19 initWithPlayable:v2 fallbackUrl:v10];
LABEL_9:

      goto LABEL_10;
    }
  }
  v3 = [WeakRetained mediaInfo];
  id v4 = [v3 videosPlayables];
  BOOL v5 = [v4 firstObject];
  id v6 = [v5 metadata];

  id v7 = [WeakRetained mediaInfo];
  id v8 = v7;
  if (v6)
  {
    id v9 = [v7 videosPlayables];
    id v10 = [v9 firstObject];

    id v11 = [VUIGroupWatchActivityPreviewMetadata alloc];
    id v12 = [v2 sharedWatchUrl];
    id v13 = [(VUIGroupWatchActivityPreviewMetadata *)v11 initWithPlayable:v10 fallbackUrl:v12];
LABEL_8:

    goto LABEL_9;
  }
  id v20 = [v7 tvpPlaylist];
  uint64_t v21 = [v20 currentMediaItem];

  if (v21)
  {
    uint64_t v22 = [VUIGroupWatchActivityPreviewMetadata alloc];
    id v10 = [WeakRetained mediaInfo];
    id v12 = [v10 tvpPlaylist];
    id v23 = [v12 currentMediaItem];
    id v24 = [v2 sharedWatchUrl];
    id v13 = [(VUIGroupWatchActivityPreviewMetadata *)v22 initWithMediaItem:v23 fallbackUrl:v24];

    goto LABEL_8;
  }
  id v26 = [WeakRetained contentMetadata];

  if (v26)
  {
    id v27 = [WeakRetained contentMetadata];
    id v10 = objc_msgSend(v27, "vui_stringForKey:", @"title");

    objc_super v28 = [WeakRetained contentMetadata];
    id v42 = objc_msgSend(v28, "vui_stringForKey:", @"showTitle");

    id v29 = [WeakRetained contentMetadata];
    id v30 = objc_msgSend(v29, "vui_numberForKey:", @"seasonNumber");

    v31 = [WeakRetained contentMetadata];
    id v32 = objc_msgSend(v31, "vui_numberForKey:", @"episodeNumber");

    id v33 = [WeakRetained contentMetadata];
    id v34 = objc_msgSend(v33, "vui_stringForKey:", @"artworkURL");

    v35 = [WeakRetained contentMetadata];
    id v36 = [v35 objectForKey:@"artworkImage"];

    v37 = [WeakRetained contentMetadata];
    id v38 = objc_msgSend(v37, "vui_stringForKey:", @"mediaType");
    LOBYTE(v27) = [v38 isEqualToString:@"Episode"];

    id v39 = [VUIGroupWatchActivityPreviewMetadata alloc];
    id v40 = [v2 sharedWatchUrl];
    BYTE1(v41) = 1;
    LOBYTE(v41) = (_BYTE)v27;
    id v13 = -[VUIGroupWatchActivityPreviewMetadata initWithTitle:showTitle:seasonTitle:seasonNumber:episodeNumber:imageUrlFormat:artworkImage:fallbackUrl:isTVShow:allowsSceneAssociation:](v39, "initWithTitle:showTitle:seasonTitle:seasonNumber:episodeNumber:imageUrlFormat:artworkImage:fallbackUrl:isTVShow:allowsSceneAssociation:", v10, v42, 0, v30, v32, v34, v36, v40, v41);

    goto LABEL_9;
  }
  id v13 = 0;
LABEL_10:

  return v13;
}

__CFString *__62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_3(uint64_t a1, char a2, char a3, char a4, char a5, char a6)
{
  id v12 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v14 = [WeakRetained stateMachine];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_4;
  v17[3] = &unk_1E6DFA188;
  objc_copyWeak(&v19, v12);
  id v18 = *(id *)(a1 + 32);
  char v20 = a2;
  char v21 = a3;
  char v22 = a6;
  char v23 = a5;
  char v24 = a4;
  [v14 executeBlockAfterCurrentStateTransition:v17];

  id v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v15 removeObserver:WeakRetained];

  objc_destroyWeak(&v19);
  return @"Startup flow complete";
}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_4(uint64_t a1)
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if ((!*(unsigned char *)(a1 + 48) || !*(unsigned char *)(a1 + 49)) && !*(unsigned char *)(a1 + 50))
  {
    id v4 = [WeakRetained resolvedPlayable];
    if (!v4)
    {
      BOOL v5 = [WeakRetained mediaInfo];
      id v6 = [v5 videosPlayables];
      id v4 = [v6 firstObject];
    }
    id v7 = +[VUIInterfaceFactory sharedInstance];
    id v8 = [v7 groupActivitiesManager];
    id v9 = [v4 sharedWatchId];
    int v10 = [v8 isSharedWatchIdValidForCurrentSession:v9];

    if (v10)
    {
      id v11 = +[VUIInterfaceFactory sharedInstance];
      id v12 = [v11 groupActivitiesManager];
      [v12 startPlaybackFailed];
    }
    else
    {
      id v13 = sLogObject_18;
      if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, "Not calling startPlaybackFailed since session ID no longer matches sharedWatchId being played", buf, 2u);
      }
    }
  }
  uint64_t v14 = [WeakRetained completion];
  id v15 = [WeakRetained mediaInfo];

  if (v15)
  {
    if (*(unsigned char *)(a1 + 48))
    {
      id v16 = [WeakRetained mediaInfo];
      id v17 = [v16 tvpPlaylist];
      id v18 = [v17 currentMediaItem];

      id v19 = [v18 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA148]];
      [v19 setIsGroupActivity:*(unsigned __int8 *)(a1 + 49)];
      if (*(unsigned char *)(a1 + 49)) {
        BOOL v20 = [WeakRetained watchType] == 0;
      }
      else {
        BOOL v20 = 0;
      }
      [v19 setIsGroupActivityOriginator:v20];
    }
    id v33 = [WeakRetained mediaInfo];
    id v34 = [v33 videosPlayables];
    v35 = [v34 firstObject];

    id v36 = (void *)sLogObject_18;
    if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v37 = *(unsigned __int8 *)(a1 + 48);
      uint64_t v38 = *(unsigned __int8 *)(a1 + 49);
      id v39 = v3;
      uint64_t v40 = *(unsigned __int8 *)(a1 + 51);
      uint64_t v41 = v36;
      id v42 = [v35 canonicalID];
      *(_DWORD *)buf = 134219010;
      uint64_t v76 = v37;
      __int16 v77 = 2048;
      uint64_t v78 = v38;
      __int16 v79 = 2048;
      uint64_t v80 = v40;
      v3 = v39;
      __int16 v81 = 2112;
      id v82 = v42;
      __int16 v83 = 2112;
      v84 = v35;
      _os_log_impl(&dword_1E2BD7000, v41, OS_LOG_TYPE_DEFAULT, "Calling mediaInfo performPlaybackStartupFlowWithCompletion callback: startPlayback == %ld, isCoWatching == %ld, allowCellular = %ld, canonicalID = %@, playable = %@", buf, 0x34u);
    }
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_176;
    v68[3] = &unk_1E6DFA160;
    id v43 = v14;
    __int16 v72 = *(_WORD *)(a1 + 48);
    char v73 = *(unsigned char *)(a1 + 52);
    char v74 = *(unsigned char *)(a1 + 51);
    id v71 = v43;
    id v69 = v35;
    id v70 = v3;
    id v32 = v35;
    dispatch_async(MEMORY[0x1E4F14428], v68);
  }
  else
  {
    char v21 = [WeakRetained videoCanonicalID];

    char v22 = (void *)sLogObject_18;
    BOOL v23 = os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT);
    if (v21)
    {
      if (v23)
      {
        char v24 = v3;
        uint64_t v25 = *(unsigned __int8 *)(a1 + 48);
        uint64_t v26 = *(unsigned __int8 *)(a1 + 49);
        uint64_t v27 = *(unsigned __int8 *)(a1 + 51);
        objc_super v28 = v22;
        id v29 = [WeakRetained videoCanonicalID];
        id v30 = [WeakRetained resolvedPlayable];
        *(_DWORD *)buf = 134219010;
        uint64_t v76 = v25;
        v3 = v24;
        __int16 v77 = 2048;
        uint64_t v78 = v26;
        __int16 v79 = 2048;
        uint64_t v80 = v27;
        __int16 v81 = 2112;
        id v82 = v29;
        __int16 v83 = 2112;
        v84 = v30;
        _os_log_impl(&dword_1E2BD7000, v28, OS_LOG_TYPE_DEFAULT, "Calling canonicalID performPlaybackStartupFlowWithCompletion callback: startPlayback == %ld, isCoWatching == %ld, allowCellular = %ld, canonicalID = %@, playable = %@", buf, 0x34u);
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_177;
      block[3] = &unk_1E6DFA160;
      id v31 = v14;
      __int16 v65 = *(_WORD *)(a1 + 48);
      char v66 = *(unsigned char *)(a1 + 52);
      char v67 = *(unsigned char *)(a1 + 51);
      id v64 = v31;
      block[4] = WeakRetained;
      id v63 = v3;
      dispatch_async(MEMORY[0x1E4F14428], block);

      id v32 = v64;
    }
    else
    {
      if (v23)
      {
        id v48 = v3;
        uint64_t v49 = *(unsigned __int8 *)(a1 + 48);
        uint64_t v50 = *(unsigned __int8 *)(a1 + 49);
        uint64_t v51 = *(unsigned __int8 *)(a1 + 51);
        v52 = v22;
        id v53 = [WeakRetained adamID];
        v54 = [WeakRetained resolvedPlayable];
        *(_DWORD *)buf = 134219010;
        uint64_t v76 = v49;
        v3 = v48;
        __int16 v77 = 2048;
        uint64_t v78 = v50;
        __int16 v79 = 2048;
        uint64_t v80 = v51;
        __int16 v81 = 2112;
        id v82 = v53;
        __int16 v83 = 2112;
        v84 = v54;
        _os_log_impl(&dword_1E2BD7000, v52, OS_LOG_TYPE_DEFAULT, "Calling adamID performPlaybackStartupFlowWithCompletion callback: startPlayback == %ld, isCoWatching == %ld, allowCellular = %ld, adamID = %@, playable = %@", buf, 0x34u);
      }
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_178;
      v56[3] = &unk_1E6DFA160;
      id v55 = v14;
      __int16 v59 = *(_WORD *)(a1 + 48);
      char v60 = *(unsigned char *)(a1 + 52);
      char v61 = *(unsigned char *)(a1 + 51);
      id v58 = v55;
      v56[4] = WeakRetained;
      id v57 = v3;
      dispatch_async(MEMORY[0x1E4F14428], v56);

      id v32 = v58;
    }
  }

  id v44 = objc_opt_class();
  v45 = [WeakRetained mediaInfo];
  id v46 = [v44 identifierForMediaInfo:v45];

  if ([v46 length])
  {
    id v47 = [(id)objc_opt_class() startupCoordinators];
    [v47 removeObjectForKey:v46];
  }
  [WeakRetained setCompletion:0];
}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_176(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 57);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 58);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 59);
  id v7 = [*(id *)(a1 + 32) canonicalID];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, id, void, void))(v2 + 16))(v2, v3, v4, v5, v6, v7, *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_177(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 57);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 58);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 59);
  id v8 = [*(id *)(a1 + 32) videoCanonicalID];
  id v7 = [*(id *)(a1 + 32) resolvedPlayable];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, id, void *, void))(v2 + 16))(v2, v3, v4, v5, v6, v8, v7, *(void *)(a1 + 40));
}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_178(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 57);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 58);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 59);
  id v8 = [*(id *)(a1 + 32) adamID];
  id v7 = [*(id *)(a1 + 32) resolvedPlayable];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, id, void *, void))(v2 + 16))(v2, v3, v4, v5, v6, v8, v7, *(void *)(a1 + 40));
}

__CFString *__62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_2_181(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = [WeakRetained mediaInfo];
  uint64_t v6 = [v5 tvpPlaylist];

  id v7 = [v6 currentMediaItem];
  id v8 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  [WeakRetained setPresentingViewController:v8];
  id v9 = [WeakRetained stateMachine];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_3_182;
  v14[3] = &unk_1E6DFA200;
  id v15 = v7;
  id v16 = WeakRetained;
  id v17 = v6;
  id v18 = v8;
  uint64_t v19 = a2;
  id v10 = v8;
  id v11 = v6;
  id v12 = v7;
  [v9 executeBlockAfterCurrentStateTransition:v14];

  return @"Performing preflight";
}

uint64_t __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_3_182(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) mediaItemMetadataForProperty:*MEMORY[0x1E4FAA148]];
  [v2 addStartEventWithName:@"showingPreflightUI" isUIInteraction:1];

  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_4_183;
  v8[3] = &unk_1E6DFA1D8;
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  v8[4] = v3;
  v8[5] = v6;
  return [v3 _preflightPlaybackWithPlaylist:v4 presentingViewController:v5 completionHandler:v8];
}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_4_183(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v12[3] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [*(id *)(a1 + 32) stateMachine];
  v11[0] = @"CoWatchActionKey";
  id v7 = [MEMORY[0x1E4F28ED0] numberWithInteger:*(void *)(a1 + 40)];
  v12[0] = v7;
  v11[1] = @"AllowedToPlayKey";
  id v8 = [MEMORY[0x1E4F28ED0] numberWithBool:a2];
  v12[1] = v8;
  v11[2] = @"AllowCellularUsageKey";
  id v9 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  v12[2] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  [v6 postEvent:@"Preflight complete" withContext:0 userInfo:v10];
}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_5(uint64_t a1, uint64_t a2, char a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = [WeakRetained mediaInfo];
  id v7 = [v6 tvpPlaylist];
  id v8 = [v7 currentMediaItem];

  id v9 = [v8 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA148]];
  [v9 addStartEventWithName:@"showingAirplayPickerUI" isUIInteraction:1];

  id v10 = [MEMORY[0x1E4F153E0] sharedInstance];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_6;
  v12[3] = &unk_1E6DFA250;
  id v14 = WeakRetained;
  uint64_t v15 = a2;
  char v16 = a3;
  id v13 = v8;
  id v11 = v8;
  [v10 prepareRouteSelectionForPlaybackWithCompletionHandler:v12];
}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_6(uint64_t a1, uint64_t a2)
{
  void v11[3] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*(id *)(a1 + 32) mediaItemMetadataForProperty:*MEMORY[0x1E4FAA148]];
  [v4 addEndEventWithName:@"showingAirplayPickerUI"];

  v10[0] = @"CoWatchActionKey";
  uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:*(void *)(a1 + 48)];
  v11[0] = v5;
  v10[1] = @"AllowedToPlayKey";
  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithBool:a2];
  v11[1] = v6;
  v10[2] = @"AllowCellularUsageKey";
  id v7 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  v11[2] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  id v9 = [*(id *)(a1 + 40) stateMachine];
  [v9 postEvent:@"Route selection complete" withContext:0 userInfo:v8];
}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_7(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  char v16 = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_8;
  id v17 = &unk_1E6DFA2C0;
  id v10 = v7;
  id v18 = v10;
  id v11 = v8;
  id v19 = v11;
  id v12 = v9;
  id v20 = v12;
  objc_copyWeak(&v21, (id *)(a1 + 32));
  id v13 = &v14;
  if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", v14, v15)) {
    v16((uint64_t)v13);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v13);
  }

  objc_destroyWeak(&v21);
}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_8(uint64_t a1)
{
  id v8 = +[VUIAlertController vui_alertControllerWithTitle:*(void *)(a1 + 32) message:*(void *)(a1 + 40) preferredStyle:1];
  uint64_t v2 = +[VUIAlertAction vui_actionWithTitle:*(void *)(a1 + 48) style:0 handler:&__block_literal_global_195];
  objc_msgSend(v8, "vui_addAction:", v2);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v4 = [WeakRetained presentingViewController];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = +[VUIApplicationRouter topPresentedViewController];
  }
  id v7 = v6;

  objc_msgSend(v8, "vui_presentAlertFromPresentingController:animated:completion:", v7, 1, 0);
}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  id v7 = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_11;
  id v8 = &unk_1E6DF4AD0;
  id v9 = v3;
  id v10 = *(id *)(a1 + 32);
  uint64_t v4 = (void *)MEMORY[0x1E4F29060];
  id v5 = v3;
  if (objc_msgSend(v4, "isMainThread", v6[0], 3221225472)) {
    v7((uint64_t)v6);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_11(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = objc_msgSend(v2, "vui_stringForKey:", @"title");
  uint64_t v4 = v3;
  if (v3)
  {
    id v16 = v3;
  }
  else
  {
    id v5 = +[VUILocalizationManager sharedInstance];
    id v16 = [v5 localizedStringForKey:@"TV.GroupActivities.UnknownErrorTitle"];
  }
  id v6 = [*(id *)(a1 + 32) userInfo];
  id v7 = objc_msgSend(v6, "vui_stringForKey:", @"message");
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v10 = +[VUILocalizationManager sharedInstance];
    id v9 = [v10 localizedStringForKey:@"TV.GroupActivities.UnknownErrorMessage"];
  }
  id v11 = [*(id *)(a1 + 32) userInfo];
  id v12 = objc_msgSend(v11, "vui_stringForKey:", @"primaryActionTitle");
  id v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    uint64_t v15 = +[VUILocalizationManager sharedInstance];
    id v14 = [v15 localizedStringForKey:@"TV.GroupActivities.UnknownErrorAction"];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_12(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = +[VUIInterfaceFactory sharedInstance];
  id v3 = [v2 groupActivitiesManager];

  if (v3)
  {
    uint64_t v4 = [WeakRetained resolvedPlayable];
    if (!v4)
    {
      id v5 = [WeakRetained mediaInfo];
      id v6 = [v5 videosPlayables];
      uint64_t v4 = [v6 firstObject];

      if (!v4)
      {
        id v9 = [WeakRetained mediaInfo];
        id v10 = [v9 tvpPlaylist];
        id v11 = [v10 currentMediaItem];

        if ([v11 isMemberOfClass:objc_opt_class()])
        {
          uint64_t v7 = 2;
        }
        else if ([v11 isMemberOfClass:objc_opt_class()])
        {
          uint64_t v7 = 2;
        }
        else
        {
          uint64_t v7 = 1;
        }

        uint64_t v4 = 0;
        goto LABEL_23;
      }
    }
    if (([v4 isCowatchingProhibited] & 1) == 0
      && (![v4 useSharedPlayableForCowatching]
       || [v4 containsEligiblePlaybackMode]))
    {
      id v8 = [v4 sharedWatchUrl];
      if (v8)
      {

LABEL_14:
        uint64_t v7 = 0;
        goto LABEL_23;
      }
      if ([v4 useSharedPlayableForCowatching]) {
        goto LABEL_14;
      }
      uint64_t v12 = [v4 adamID];
      if (v12)
      {
        id v13 = (void *)v12;
        int v14 = [v4 isFamilySharingContent];

        if (v14) {
          uint64_t v7 = 1;
        }
        else {
          uint64_t v7 = 2;
        }
        goto LABEL_23;
      }
    }
    uint64_t v7 = 2;
LABEL_23:

    goto LABEL_24;
  }
  uint64_t v7 = 2;
LABEL_24:

  return v7;
}

__CFString *__62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_13(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained mediaInfo];
  uint64_t v4 = [v3 tvpPlaylist];
  id v5 = [v4 currentMediaItem];
  id v6 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA148]];
  [v6 addStartEventWithName:@"askingUserToWatchAloneOrCancel" isUIInteraction:1];

  uint64_t v7 = +[VUILocalizationManager sharedInstance];
  id v8 = [v7 localizedStringForKey:@"TV.GroupActivities.SharePlayNotAvailableErrorTitle"];

  id v9 = [WeakRetained mediaInfo];
  id v10 = [v9 videosPlayables];
  id v11 = [v10 firstObject];
  uint64_t v12 = [v11 cowatchingProhibitedReason];

  id v13 = [WeakRetained mediaInfo];
  int v14 = [v13 tvpPlaylist];
  uint64_t v15 = [v14 currentMediaItem];

  id v32 = v15;
  id v33 = v12;
  if ([v12 isEqualToString:@"extras"])
  {
    id v16 = +[VUILocalizationManager sharedInstance];
    id v17 = v16;
    id v18 = @"TV.GroupActivities.ExtrasErrorMessage";
  }
  else if ([v12 isEqualToString:@"live"])
  {
    id v16 = +[VUILocalizationManager sharedInstance];
    id v17 = v16;
    id v18 = @"TV.GroupActivities.LiveTVErrorMessage";
  }
  else if ([v15 isMemberOfClass:objc_opt_class()])
  {
    id v16 = +[VUILocalizationManager sharedInstance];
    id v17 = v16;
    id v18 = @"TV.GroupActivities.HomeSharingErrorMessage";
  }
  else
  {
    int v19 = [v15 isMemberOfClass:objc_opt_class()];
    id v16 = +[VUILocalizationManager sharedInstance];
    id v17 = v16;
    if (v19) {
      id v18 = @"TV.GroupActivities.SyncedVideosErrorMessage";
    }
    else {
      id v18 = @"TV.GroupActivities.SharePlayNotAvailableErrorMessage";
    }
  }
  uint64_t v20 = [v16 localizedStringForKey:v18];

  id v21 = +[VUILocalizationManager sharedInstance];
  char v22 = [v21 localizedStringForKey:@"TV.GroupActivities.WatchAloneTitle"];

  BOOL v23 = +[VUILocalizationManager sharedInstance];
  char v24 = [v23 localizedStringForKey:@"TV.GroupActivities.WatchAloneCancel"];

  id v31 = (void *)v20;
  uint64_t v25 = +[VUIAlertController vui_alertControllerWithTitle:v8 message:v20 preferredStyle:1];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_14;
  v39[3] = &unk_1E6DFA338;
  objc_copyWeak(v40, v1);
  uint64_t v26 = +[VUIAlertAction vui_actionWithTitle:v22 style:0 handler:v39];
  objc_msgSend(v25, "vui_addAction:isPreferred:", v26, 1);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_15;
  v37[3] = &unk_1E6DFA338;
  objc_copyWeak(&v38, v1);
  uint64_t v27 = +[VUIAlertAction vui_actionWithTitle:v24 style:0 handler:v37];
  objc_msgSend(v25, "vui_addAction:", v27);
  objc_super v28 = +[VUIApplicationRouter currentNavigationController];
  id v29 = [v28 presentedViewController];

  if (v29)
  {
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_16;
    v34[3] = &unk_1E6DF3F68;
    id v35 = v25;
    id v36 = v28;
    +[VUIApplicationRouter dismissOrPopLastViewControllerWithCompletion:v34];
  }
  else
  {
    objc_msgSend(v25, "vui_presentAlertFromPresentingController:animated:completion:", v28, 1, 0);
  }

  objc_destroyWeak(&v38);
  objc_destroyWeak(v40);

  return @"Asking whether to watch alone or cancel due to content being unavailable";
}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_14(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained stateMachine];
  [v1 postEvent:@"Watch alone button pressed"];
}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_15(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained stateMachine];
  [v1 postEvent:@"Watch cancel button pressed"];
}

uint64_t __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_16(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "vui_presentAlertFromPresentingController:animated:completion:", *(void *)(a1 + 40), 1, 0);
}

__CFString *__62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_17(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v3 = +[VUIInterfaceFactory sharedInstance];
  uint64_t v4 = [v3 groupActivitiesManager];
  char v5 = [v4 isEligibleForSession];

  id v6 = +[VUIInterfaceFactory sharedInstance];
  uint64_t v7 = [v6 groupActivitiesManager];

  if (v7 && (v5 & 1) != 0)
  {
    id v8 = sLogObject_18;
    if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "groupActivitiesManager is available.  Attempting to start co-watching", buf, 2u);
    }
    if ((*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))() != 2)
    {
      id v18 = [WeakRetained mediaInfo];
      int v19 = [v18 tvpPlaylist];
      uint64_t v20 = [v19 currentMediaItem];
      id v21 = [v20 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA148]];
      [v21 addStartEventWithName:@"askingUserToCoWatch" isUIInteraction:1];

      char v22 = [WeakRetained stateMachine];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_242;
      v25[3] = &unk_1E6DF3D58;
      v25[4] = WeakRetained;
      [v22 executeBlockAfterCurrentStateTransition:v25];

      BOOL v23 = @"Attempting to start co-watching";
      goto LABEL_20;
    }
    id v9 = sLogObject_18;
    if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "Co-watching is desired but not possible.  Showing error", buf, 2u);
    }
    uint64_t v10 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v11 = [WeakRetained mediaInfo];

    uint64_t v12 = sLogObject_18;
    BOOL v13 = os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        int v14 = v12;
        uint64_t v15 = +[VUIInterfaceFactory sharedInstance];
        id v16 = [v15 groupActivitiesManager];
        id v17 = @"isEligibleForSession is false";
        if (!v16) {
          id v17 = @"groupActivitiesManager is nil";
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v27 = v17;
        _os_log_impl(&dword_1E2BD7000, v14, OS_LOG_TYPE_DEFAULT, "%@.  Performing preflight", buf, 0xCu);
      }
      uint64_t v10 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      if (v13)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_DEFAULT, "Missing mediaInfo, allow local playback", buf, 2u);
      }
      uint64_t v10 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  BOOL v23 = (__CFString *)v10;
LABEL_20:

  return v23;
}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_242(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) mediaInfo];
  id v3 = [v2 videosPlayables];
  uint64_t v4 = [v3 firstObject];
  char v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) resolvedPlayable];
  }
  uint64_t v7 = v6;

  id v8 = +[VUIInterfaceFactory sharedInstance];
  id v9 = [v8 groupActivitiesManager];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_2_243;
  void v10[3] = &unk_1E6DFA388;
  v10[4] = *(void *)(a1 + 32);
  [v9 requestPermissionToStartCowatchingForPlayable:v7 completion:v10];
}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_2_243(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = sLogObject_18;
  if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
  {
    char v5 = @"VUIGroupActivityPlaybackStateDoNotPlay";
    if (a2 == 1) {
      char v5 = @"VUIGroupActivityPlaybackStatePlayWithoutSession";
    }
    if (!a2) {
      char v5 = @"VUIGroupActivityPlaybackStatePlayWithSession";
    }
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "Ask to co-watch complete.  VUIGroupActivityPlaybackState is %@", (uint8_t *)&v8, 0xCu);
  }
  id v6 = [*(id *)(a1 + 32) stateMachine];
  uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a2];
  [v6 postEvent:@"Attempt to start co-watching complete" withContext:v7 userInfo:0];
}

__CFString *__62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_254(uint64_t a1, uint64_t a2)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v3 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v5 = [WeakRetained resolvedPlayable];
  if (!v5)
  {
    id v6 = [WeakRetained mediaInfo];
    uint64_t v7 = [v6 videosPlayables];
    char v5 = [v7 firstObject];
  }
  int v8 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v9 = [MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v9, "vui_setObjectIfNotNil:forKey:", v8, @"PreviewMetadataKey");
  uint64_t v10 = [WeakRetained mediaInfo];
  id v11 = [v10 tvpPlaylist];
  uint64_t v12 = [v11 currentMediaItem];
  BOOL v13 = [v12 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA148]];
  [v13 addStartEventWithName:@"waitingToActivateOrJoinSession" isUIInteraction:1];

  int v14 = (void *)sLogObject_18;
  if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = v14;
    id v16 = [WeakRetained _descriptionForStartupAction:a2];
    *(_DWORD *)buf = 138412290;
    uint64_t v49 = v16;
    _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_DEFAULT, "Performing co-watch action: %@", buf, 0xCu);
  }
  id v17 = [v5 sharedWatchUrl];
  BOOL v18 = v17 == 0;

  if (v18)
  {
    int v19 = [v5 useSharedPlayableForCowatching];
    uint64_t v20 = sLogObject_18;
    if (v19)
    {
      if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v20, OS_LOG_TYPE_DEFAULT, "Passing shared playable to GroupActivitiesManager", buf, 2u);
      }
      id v21 = +[VUIInterfaceFactory sharedInstance];
      char v22 = [v21 groupActivitiesManager];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_261;
      v41[3] = &unk_1E6DF71E0;
      objc_copyWeak(&v43, v3);
      id v42 = v9;
      [v22 handleSharedPlayable:v5 watchTogetherUrl:0 startupAction:a2 previewMetadata:v8 completion:v41];

      objc_destroyWeak(&v43);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_ERROR)) {
        __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_254_cold_1();
      }
      id v36 = [WeakRetained stateMachine];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_262;
      v39[3] = &unk_1E6DF3F68;
      void v39[4] = WeakRetained;
      id v40 = v9;
      [v36 executeBlockAfterCurrentStateTransition:v39];
    }
  }
  else
  {
    if ([WeakRetained watchType] == 1)
    {
      [v5 groupActivityDay];
    }
    else
    {
      BOOL v23 = (void *)MEMORY[0x1E4F1C9C8];
      char v24 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v25 = objc_msgSend(v23, "vui_startOfDateInGMT:", v24);
      [v25 timeIntervalSince1970];
      double v27 = v26;

      objc_msgSend(NSString, "stringWithFormat:", @"%ld", (uint64_t)(v27 * 1000.0));
    uint64_t v28 = };
    id v29 = sLogObject_18;
    if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v49 = v28;
      _os_log_impl(&dword_1E2BD7000, v29, OS_LOG_TYPE_DEFAULT, "groupActivityDay: %@", buf, 0xCu);
    }
    id v30 = [v5 sharedWatchUrl];
    id v31 = objc_msgSend(WeakRetained, "_addQueryParamsToSharedWatchURL:watchType:groupActivityDay:", v30, objc_msgSend(WeakRetained, "watchType"), v28);

    id v32 = sLogObject_18;
    if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v32, OS_LOG_TYPE_DEFAULT, "Passing shared watch URL to GroupActivitiesManager", buf, 2u);
    }
    id v33 = +[VUIInterfaceFactory sharedInstance];
    id v34 = [v33 groupActivitiesManager];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_260;
    v44[3] = &unk_1E6DFA3D8;
    objc_copyWeak(&v47, v3);
    id v35 = v28;
    id v45 = v35;
    id v46 = v9;
    [v34 handleSharedPlayable:v5 watchTogetherUrl:v31 startupAction:a2 previewMetadata:v8 completion:v44];

    objc_destroyWeak(&v47);
  }

  return @"Waiting for co-watch session to be handled";
}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_260(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = WeakRetained;
  if (!a2)
  {
    [WeakRetained _addGroupActivityDayParamToPlayableAndMediaItem:*(void *)(a1 + 32)];
    id WeakRetained = v8;
  }
  char v5 = [WeakRetained stateMachine];
  id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a2];
  uint64_t v7 = (void *)[*(id *)(a1 + 40) copy];
  [v5 postEvent:@"Co-watch session handling complete" withContext:v6 userInfo:v7];
}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_261(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = [WeakRetained stateMachine];
  char v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a2];
  id v6 = (void *)[*(id *)(a1 + 32) copy];
  [v4 postEvent:@"Co-watch session handling complete" withContext:v5 userInfo:v6];
}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_262(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) stateMachine];
  uint64_t v2 = (void *)[*(id *)(a1 + 40) copy];
  [v3 postEvent:@"Co-watch session handling complete" withContext:&unk_1F3F3D220 userInfo:v2];
}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_264()
{
  v9[3] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4FB5270];
  v8[0] = *MEMORY[0x1E4FB5268];
  v8[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4FB5280];
  v9[0] = &unk_1F3F3D238;
  v9[1] = v1;
  v8[2] = *MEMORY[0x1E4FB5260];
  v9[2] = MEMORY[0x1E4F1CC38];
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];
  id v3 = [MEMORY[0x1E4FB50E8] defaultCenter];
  uint64_t v4 = +[VUILocalizationManager sharedInstance];
  char v5 = [v4 localizedStringForKey:@"TV.GroupActivities.CannotShareDownloadTitle"];
  id v6 = +[VUILocalizationManager sharedInstance];
  uint64_t v7 = [v6 localizedStringForKey:@"TV.GroupActivities.CannotShareDownloadMessage"];
  [v3 post:@"DownloadWillBeStreamedNotificationIdentifier" title:v5 body:v7 options:v2];
}

id __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_280(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained mediaInfo];
  uint64_t v4 = [v3 tvpPlaylist];
  char v5 = [v4 currentMediaItem];

  if (![v5 hasTrait:*MEMORY[0x1E4FAA188]])
  {
    id v8 = sLogObject_18;
    if (!os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    __int16 v14 = 0;
    uint64_t v10 = "Content is not local, performing preflight";
    id v11 = (uint8_t *)&v14;
    goto LABEL_7;
  }
  id v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v7 = [v6 BOOLForKey:@"AllowCoWatchingOfDownload"];

  id v8 = sLogObject_18;
  BOOL v9 = os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (!v9) {
      goto LABEL_11;
    }
    __int16 v16 = 0;
    uint64_t v10 = "Content is downloaded, but user defaults allows for co-watching download. Performing preflight";
    id v11 = (uint8_t *)&v16;
LABEL_7:
    _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
    goto LABEL_11;
  }
  if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "Content is downloaded.  Showing download will be streamed dialog", buf, 2u);
  }
  [WeakRetained setForceDownloadToStream:1];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_11:
  uint64_t v12 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));

  return v12;
}

id __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_285(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v3 = +[VUIInterfaceFactory sharedInstance];
  uint64_t v4 = [v3 groupActivitiesManager];

  if (v4)
  {
    char v5 = +[VUIInterfaceFactory sharedInstance];
    id v6 = [v5 groupActivitiesManager];
    int v7 = [v6 isSessionActive];

    if (v7)
    {
      uint64_t v8 = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
      BOOL v9 = sLogObject_18;
      if (!v8)
      {
        if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)int v19 = 0;
          _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "Replacing item being watched, co-watching of next item is possible", v19, 2u);
        }
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56));
        goto LABEL_13;
      }
      if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_ERROR)) {
        __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_285_cold_1();
      }
LABEL_12:
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
      uint64_t v15 = LABEL_13:;
      goto LABEL_14;
    }
    id v11 = sLogObject_18;
    if (!os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    __int16 v18 = 0;
    BOOL v13 = "Replacing item being watched, but no co-watching session is active.  Performing preflight of next media item to watch solo";
    __int16 v14 = (uint8_t *)&v18;
LABEL_11:
    _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, v13, v14, 2u);
    goto LABEL_12;
  }
  uint64_t v10 = [WeakRetained mediaInfo];

  id v11 = sLogObject_18;
  BOOL v12 = os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (!v12) {
      goto LABEL_12;
    }
    __int16 v21 = 0;
    BOOL v13 = "Replacing item being watched, groupActivitiesManager is nil.  Performing preflight of next media item";
    __int16 v14 = (uint8_t *)&v21;
    goto LABEL_11;
  }
  if (v12)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "Replacing item being watched, missing mediaInfo, allow local playback", buf, 2u);
  }
  uint64_t v15 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_14:
  __int16 v16 = (void *)v15;

  return v16;
}

__CFString *__62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_286(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained mediaInfo];
  uint64_t v4 = [v3 tvpPlaylist];
  char v5 = [v4 currentMediaItem];
  id v6 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA148]];
  [v6 addStartEventWithName:@"waitingForShareURLToBeResolved" isUIInteraction:1];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_2_287;
  aBlock[3] = &unk_1E6DFA428;
  objc_copyWeak(&v31, v1);
  int v7 = _Block_copy(aBlock);
  uint64_t v8 = @"Invalid";
  BOOL v9 = [WeakRetained mediaInfo];

  if (v9)
  {
    id v29 = v8;
    uint64_t v28 = v7;
    uint64_t v10 = [WeakRetained mediaInfo];
    id v11 = [v10 tvpPlaylist];
    BOOL v12 = [v11 currentMediaItem];

    BOOL v13 = [v12 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FB0]];
    if (([v13 isEqualToString:*MEMORY[0x1E4FAA1E8]] & 1) != 0
      || ([v13 isEqualToString:*MEMORY[0x1E4FAA1F8]] & 1) != 0)
    {
      __int16 v14 = VUIPlayableMediaTypeMovie;
    }
    else
    {
      uint64_t v25 = *MEMORY[0x1E4FAA200];
      if (([v13 isEqualToString:*MEMORY[0x1E4FAA200]] & 1) != 0
        || ([v13 isEqualToString:v25] & 1) != 0)
      {
        __int16 v14 = VUIPlayableMediaTypeShow;
      }
      else
      {
        if (([v13 isEqualToString:*MEMORY[0x1E4FAA208]] & 1) == 0
          && ![v13 isEqualToString:*MEMORY[0x1E4FAA1F0]])
        {
LABEL_6:
          __int16 v16 = [v12 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E28]];
          id v17 = [v12 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA080]];
          __int16 v18 = [v12 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0D8]];
          int v19 = v18;
          if (v18)
          {
            id v20 = v18;
          }
          else
          {
            char v22 = [WeakRetained mediaInfo];
            BOOL v23 = [v22 videosPlayables];
            char v24 = [v23 firstObject];
            id v20 = [v24 adamID];
          }
          int v7 = v28;
          uint64_t v8 = v29;
          goto LABEL_12;
        }
        __int16 v14 = VUIPlayableMediaTypeTrailer;
      }
    }
    uint64_t v15 = *v14;

    id v29 = v15;
    goto LABEL_6;
  }
  __int16 v21 = [WeakRetained videoCanonicalID];

  if (!v21)
  {
    double v26 = [WeakRetained adamID];

    if (!v26)
    {
      __int16 v16 = 0;
      id v20 = 0;
      id v17 = 0;
      goto LABEL_22;
    }
    id v20 = [WeakRetained adamID];
    id v17 = 0;
    goto LABEL_19;
  }
  __int16 v16 = [WeakRetained videoCanonicalID];
  id v17 = [WeakRetained showCanonicalID];
  [WeakRetained mediaType];
  id v20 = 0;
  BOOL v12 = v8;
  uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  if (v16)
  {
    +[VUIPlayableResolver playableForCanonicalID:v16 showID:v17 mediaType:v8 completion:v7];
    goto LABEL_22;
  }
LABEL_19:
  if (v20) {
    +[VUIPlayableResolver playableForAdamID:v20 completion:v7];
  }
  __int16 v16 = 0;
LABEL_22:

  objc_destroyWeak(&v31);
  return @"Waiting for share URL for be resolved";
}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_2_287(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v16)
  {
    uint64_t v8 = [WeakRetained mediaInfo];
    BOOL v9 = [v8 tvpPlaylist];
    uint64_t v10 = [v9 currentMediaItem];

    id v11 = v16;
    if (v10)
    {
      BOOL v12 = [v16 sharedWatchId];
      [v10 setMediaItemMetadata:v12 forProperty:*MEMORY[0x1E4FA9FD8]];

      BOOL v13 = [v16 showCanonicalID];
      [v10 setMediaItemMetadata:v13 forProperty:*MEMORY[0x1E4FAA080]];

      __int16 v14 = [v16 canonicalID];
      [v10 setMediaItemMetadata:v14 forProperty:*MEMORY[0x1E4FA9E28]];

      id v11 = v16;
    }
    [v7 setObject:v11 forKey:@"ResolvedPlayableKey"];
  }
  if (v5) {
    [v7 setObject:v5 forKey:@"ErrorKey"];
  }
  uint64_t v15 = [WeakRetained stateMachine];
  [v15 postEvent:@"Share URL resolution complete" withContext:0 userInfo:v7];
}

id __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_3_290(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = (id *)(a1 + 10);
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained(v5);
  uint64_t v8 = _Block_copy(v6);

  BOOL v9 = (void *)[v8 copy];
  [WeakRetained setCompletion:v9];

  uint64_t v10 = (void *)sLogObject_18;
  if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v10;
    BOOL v12 = objc_msgSend(WeakRetained, "_descriptionForWatchType:", objc_msgSend(WeakRetained, "watchType"));
    int v22 = 138412546;
    BOOL v23 = v12;
    __int16 v24 = 2048;
    uint64_t v25 = [WeakRetained isRentAndWatchNow];
    _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "Performing playback startup flow with watch type %@, isRentAndWatchNow %ld", (uint8_t *)&v22, 0x16u);
  }
  uint64_t v13 = [WeakRetained watchType];
  if ((unint64_t)(v13 - 3) < 2)
  {
    uint64_t v14 = a1[8];
    goto LABEL_12;
  }
  if (v13 == 1)
  {
    uint64_t v15 = (*(uint64_t (**)(void))(a1[5] + 16))();
    id v16 = sLogObject_18;
    if (v15)
    {
      if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_ERROR)) {
        __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_3_290_cold_1();
      }
      uint64_t v14 = a1[7];
      goto LABEL_12;
    }
    if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_1E2BD7000, v16, OS_LOG_TYPE_DEFAULT, "Watch type is Join, and co-watching is possible.", (uint8_t *)&v22, 2u);
    }
    int v19 = *(void (**)(void))(a1[6] + 16);
  }
  else
  {
    if (!v13)
    {
      uint64_t v14 = a1[4];
LABEL_12:
      uint64_t v17 = (*(void (**)(void))(v14 + 16))();
      goto LABEL_20;
    }
    __int16 v18 = sLogObject_18;
    if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_1E2BD7000, v18, OS_LOG_TYPE_DEFAULT, "Watch type is Solo.  Performing preflight", (uint8_t *)&v22, 2u);
    }
    int v19 = *(void (**)(void))(a1[9] + 16);
  }
  uint64_t v17 = v19();
LABEL_20:
  id v20 = (void *)v17;

  return v20;
}

id __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_292(uint64_t a1, void *a2, uint64_t a3, const void *a4)
{
  id v5 = a2;
  id v6 = _Block_copy(a4);
  if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_ERROR)) {
    __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_292_cold_1();
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_295;
  void v10[3] = &unk_1E6DF3DD0;
  id v11 = v6;
  id v7 = v6;
  [v5 executeBlockAfterCurrentStateTransition:v10];
  uint64_t v8 = [v5 currentState];

  return v8;
}

uint64_t __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_295(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void, void, void, void, void))(result + 16))(result, 0, 0, 0, 0, 0, 0, 0);
  }
  return result;
}

id __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_2_296(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = (id *)(a1 + 10);
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained(v5);
  uint64_t v8 = [v6 unsignedIntegerValue];

  BOOL v9 = sLogObject_18;
  if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = @"VUIGroupActivityPlaybackStateDoNotPlay";
    if (v8 == 1) {
      uint64_t v10 = @"VUIGroupActivityPlaybackStatePlayWithoutSession";
    }
    if (!v8) {
      uint64_t v10 = @"VUIGroupActivityPlaybackStatePlayWithSession";
    }
    int v26 = 138412290;
    double v27 = v10;
    _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "After asking to co-watch, VUIGroupActivityPlaybackState is %@", (uint8_t *)&v26, 0xCu);
  }
  id v11 = [WeakRetained mediaInfo];
  BOOL v12 = [v11 tvpPlaylist];
  uint64_t v13 = [v12 currentMediaItem];
  uint64_t v14 = [v13 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA148]];
  [v14 addEndEventWithName:@"askingUserToCoWatch"];

  if (v8 == 1)
  {
    __int16 v18 = sLogObject_18;
    if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_1E2BD7000, v18, OS_LOG_TYPE_DEFAULT, "Co-watching is either not desired or no session is in progress.  Performing preflight", (uint8_t *)&v26, 2u);
    }
    uint64_t v17 = *(void (**)(void))(a1[8] + 16);
    goto LABEL_17;
  }
  if (v8)
  {
    id v20 = sLogObject_18;
    if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_1E2BD7000, v20, OS_LOG_TYPE_DEFAULT, "No playback of any kind is desired.  Disallowing playback", (uint8_t *)&v26, 2u);
    }
    uint64_t v19 = (*(void (**)(void))(a1[9] + 16))();
  }
  else
  {
    uint64_t v15 = (*(uint64_t (**)(void))(a1[4] + 16))();
    if (v15 == 1)
    {
      __int16 v21 = sLogObject_18;
      if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_1E2BD7000, v21, OS_LOG_TYPE_DEFAULT, "Co-watching is desired but requires share URL to be resolved.  Performing resolution", (uint8_t *)&v26, 2u);
      }
      uint64_t v22 = a1[6];
    }
    else
    {
      if (!v15)
      {
        id v16 = sLogObject_18;
        if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v26) = 0;
          _os_log_impl(&dword_1E2BD7000, v16, OS_LOG_TYPE_DEFAULT, "Co-watching is possible and desired.  Will activate session after preflight", (uint8_t *)&v26, 2u);
        }
        uint64_t v17 = *(void (**)(void))(a1[5] + 16);
LABEL_17:
        uint64_t v19 = v17();
        goto LABEL_28;
      }
      BOOL v23 = sLogObject_18;
      if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_1E2BD7000, v23, OS_LOG_TYPE_DEFAULT, "Co-watching is desired but not possible.  Showing error", (uint8_t *)&v26, 2u);
      }
      uint64_t v22 = a1[7];
    }
    uint64_t v19 = (*(void (**)(void))(v22 + 16))();
  }
LABEL_28:
  __int16 v24 = (void *)v19;

  return v24;
}

id __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_297(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = (id *)(a1 + 40);
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained(v5);
  uint64_t v8 = [v6 unsignedIntegerValue];

  BOOL v9 = sLogObject_18;
  if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = @"VUIGroupActivityPlaybackStateDoNotPlay";
    if (v8 == 1) {
      uint64_t v10 = @"VUIGroupActivityPlaybackStatePlayWithoutSession";
    }
    if (!v8) {
      uint64_t v10 = @"VUIGroupActivityPlaybackStatePlayWithSession";
    }
    int v21 = 138412290;
    uint64_t v22 = v10;
    _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "Co-watch handling complete.  VUIGroupActivityPlaybackState is %@", (uint8_t *)&v21, 0xCu);
  }
  id v11 = [WeakRetained mediaInfo];
  BOOL v12 = [v11 tvpPlaylist];
  uint64_t v13 = [v12 currentMediaItem];
  uint64_t v14 = [v13 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA148]];
  [v14 addEndEventWithName:@"waitingToActivateOrJoinSession"];

  uint64_t v15 = sLogObject_18;
  if (v8 == 2)
  {
    if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_ERROR)) {
      __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_297_cold_1();
    }
    id v16 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = @"without";
      if (!v8) {
        uint64_t v17 = @"with";
      }
      int v21 = 138412290;
      uint64_t v22 = v17;
      _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_DEFAULT, "GroupActivitiesManager indicates it will play %@ co-watching.  Finishing startup flow", (uint8_t *)&v21, 0xCu);
    }
    uint64_t v18 = *(void *)(a1 + 32);
    [WeakRetained forceDownloadToStream];
    [WeakRetained isCellularAllowed];
    id v16 = *(void (**)(void))(v18 + 16);
  }
  uint64_t v19 = v16();

  return v19;
}

__CFString *__62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_304(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v5 = (void *)a1;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = (id *)(a1 + 64);
  id v7 = a5;
  id WeakRetained = objc_loadWeakRetained(v6);
  BOOL v9 = [v7 objectForKey:@"ResolvedPlayableKey"];
  uint64_t v10 = [v7 objectForKey:@"ErrorKey"];

  id v11 = sLogObject_18;
  if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v46 = v9;
    __int16 v47 = 2112;
    id v48 = v10;
    _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "Share URL resolution complete.  Resolved playable is %@, error is %@", buf, 0x16u);
  }
  BOOL v12 = [WeakRetained mediaInfo];
  uint64_t v13 = [v12 tvpPlaylist];
  uint64_t v14 = [v13 currentMediaItem];
  uint64_t v15 = *MEMORY[0x1E4FAA148];
  id v16 = [v14 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA148]];
  [v16 addEndEventWithName:@"waitingForShareURLToBeResolved"];

  if (v9)
  {
    [WeakRetained setResolvedPlayable:v9];
    uint64_t v17 = [WeakRetained contentMetadata];

    if (v17)
    {
      uint64_t v18 = [WeakRetained contentMetadata];
      id v43 = [VUIContentMetadata alloc];
      id v42 = objc_msgSend(v18, "vui_stringForKey:", @"title");
      uint64_t v19 = objc_msgSend(v18, "vui_stringForKey:", @"showTitle");
      id v20 = objc_msgSend(v18, "vui_stringForKey:", @"seasonTitle");
      objc_msgSend(v18, "vui_numberForKey:", @"seasonNumber");
      id v44 = v5;
      uint64_t v22 = v21 = v9;
      objc_msgSend(v18, "vui_numberForKey:", @"episodeNumber");
      uint64_t v23 = WeakRetained;
      v25 = __int16 v24 = v10;
      int v26 = objc_msgSend(v18, "vui_URLForKey:", @"artworkURL");
      double v27 = [(VUIContentMetadata *)v43 initWithTitle:v42 showTitle:v19 seasonTitle:v20 seasonNumber:v22 episodeNumber:v25 artworkURL:v26];

      uint64_t v10 = v24;
      id WeakRetained = v23;

      BOOL v9 = v21;
      id v5 = v44;

      uint64_t v28 = [v23 resolvedPlayable];
      [v28 setMetadata:v27];
    }
    uint64_t v29 = (*(uint64_t (**)(void))(v5[4] + 16))();
    id v30 = sLogObject_18;
    BOOL v31 = os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT);
    if (v29)
    {
      if (v31)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v30, OS_LOG_TYPE_DEFAULT, "Co-watching is not possible after resolving share URL.   Ask whether content should be watched alone or not at all", buf, 2u);
      }
      (*(void (**)(void))(v5[6] + 16))();
      uint64_t v32 = (*(void (**)(void))(v5[7] + 16))();
    }
    else
    {
      if (v31)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v30, OS_LOG_TYPE_DEFAULT, "Co-watching is possible based on metadata after resolving share URL.  Will activate session after preflight", buf, 2u);
      }
      uint64_t v32 = (*(void (**)(void))(v5[5] + 16))();
    }
    id v40 = (__CFString *)v32;
  }
  else
  {
    id v33 = v5;
    id v34 = v10;
    id v35 = sLogObject_18;
    if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v35, OS_LOG_TYPE_DEFAULT, "Unable to resolve share URL.  Ask whether content should be watched alone or not at all", buf, 2u);
    }
    id v36 = [WeakRetained mediaInfo];
    uint64_t v37 = [v36 tvpPlaylist];
    id v38 = [v37 currentMediaItem];
    id v39 = [v38 mediaItemMetadataForProperty:v15];
    [v39 addStartEventWithName:@"askingUserToWatchAloneOrCancel" isUIInteraction:1];

    uint64_t v10 = v34;
    (*(void (**)(void))(v33[6] + 16))();
    id v40 = @"Asking whether to watch alone or cancel due to content being unavailable";
  }

  return v40;
}

id __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_306(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = sLogObject_18;
  if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "Watch alone selected, performing preflight", v10, 2u);
  }
  uint64_t v4 = [WeakRetained mediaInfo];
  id v5 = [v4 tvpPlaylist];
  id v6 = [v5 currentMediaItem];
  id v7 = [v6 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA148]];
  [v7 addEndEventWithName:@"askingUserToWatchAloneOrCancel"];

  uint64_t v8 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return v8;
}

id __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_307(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = sLogObject_18;
  if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "Cancel watching selected, not allowing playback", v10, 2u);
  }
  uint64_t v4 = [WeakRetained mediaInfo];
  id v5 = [v4 tvpPlaylist];
  id v6 = [v5 currentMediaItem];
  id v7 = [v6 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA148]];
  [v7 addEndEventWithName:@"askingUserToWatchAloneOrCancel"];

  uint64_t v8 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return v8;
}

__CFString *__62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_308(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = (id *)(a1 + 56);
  id v7 = a5;
  id WeakRetained = objc_loadWeakRetained(v6);
  BOOL v9 = [v7 objectForKey:@"CoWatchActionKey"];
  uint64_t v10 = [v9 integerValue];

  id v11 = [v7 objectForKey:@"AllowedToPlayKey"];
  unsigned int v12 = [v11 BOOLValue];

  uint64_t v13 = [v7 objectForKey:@"AllowCellularUsageKey"];

  uint64_t v14 = [v13 BOOLValue];
  [WeakRetained setIsCellularAllowed:v14];
  uint64_t v15 = sLogObject_18;
  if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v29 = v12;
    __int16 v30 = 2048;
    uint64_t v31 = v14;
    _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_DEFAULT, "Preflight complete.  allowedToPlay == %ld, allowCellularUsage == %ld", buf, 0x16u);
  }
  id v16 = [WeakRetained mediaInfo];
  uint64_t v17 = [v16 tvpPlaylist];
  uint64_t v18 = [v17 currentMediaItem];
  uint64_t v19 = [v18 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA148]];
  [v19 addEndEventWithName:@"showingPreflightUI"];

  if (!v12)
  {
    (*(void (**)(void, void, void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, 0, 0, 0);
    goto LABEL_9;
  }
  if ([WeakRetained watchType] == 3 || objc_msgSend(WeakRetained, "watchType") == 4)
  {
    if (v10 != 3)
    {
      uint64_t v20 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      goto LABEL_11;
    }
    (*(void (**)(void, uint64_t, void, uint64_t, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 1, 0, [WeakRetained forceDownloadToStream], v14, 0);
    uint64_t v20 = LABEL_9:;
LABEL_11:
    int v21 = (__CFString *)v20;
    goto LABEL_12;
  }
  uint64_t v23 = [WeakRetained stateMachine];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_309;
  v24[3] = &unk_1E6DFA478;
  id v25 = *(id *)(a1 + 32);
  uint64_t v26 = v10;
  char v27 = v14;
  [v23 executeBlockAfterCurrentStateTransition:v24];

  int v21 = @"Performing route selection";
LABEL_12:

  return v21;
}

uint64_t __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_309(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

id __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_2_310(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = (id *)(a1 + 48);
  id v7 = a5;
  id WeakRetained = objc_loadWeakRetained(v6);
  BOOL v9 = [v7 objectForKey:@"CoWatchActionKey"];
  uint64_t v10 = [v9 integerValue];

  id v11 = [v7 objectForKey:@"AllowedToPlayKey"];
  int v12 = [v11 BOOLValue];

  uint64_t v13 = [v7 objectForKey:@"AllowCellularUsageKey"];

  uint64_t v14 = [v13 BOOLValue];
  if (!v12)
  {
    (*(void (**)(void, void, void, void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, 0, 0, 0, 0);
    goto LABEL_5;
  }
  if (v10 == 3)
  {
    (*(void (**)(void, uint64_t, void, uint64_t, uint64_t, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 1, 0, [WeakRetained forceDownloadToStream], v14, 0);
    uint64_t v15 = LABEL_5:;
    goto LABEL_7;
  }
  uint64_t v15 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_7:
  id v16 = (void *)v15;

  return v16;
}

uint64_t __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_3_311(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_preflightPlaybackWithPlaylist:(id)a3 presentingViewController:(id)a4 completionHandler:(id)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v39 = a4;
  id v9 = a5;
  uint64_t v10 = +[VUIPlaybackManager sharedInstance];
  int v11 = [v10 isPlaylistBeingPresented:v8];

  if (!v11)
  {
    uint64_t v14 = [v8 currentMediaItem];
    uint64_t v15 = sLogObject_18;
    if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v54 = v14;
      _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_DEFAULT, "Performing preflight for media item %@", buf, 0xCu);
    }
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __107__VUIPlaybackStartupCoordinator__preflightPlaybackWithPlaylist_presentingViewController_completionHandler___block_invoke;
    aBlock[3] = &unk_1E6DFA540;
    objc_copyWeak(&v51, &location);
    uint64_t v13 = v14;
    id v48 = v13;
    id v37 = v39;
    id v49 = v37;
    id v50 = v9;
    id v16 = _Block_copy(aBlock);
    uint64_t v17 = +[VUIPlaybackManager sharedInstance];
    uint64_t v18 = [v17 currentMediaItem];

    BOOL v19 = [(VUIPlaybackStartupCoordinator *)self _existingPlaybackSessionAllowsCellular];
    if (v19)
    {
      unsigned int v38 = 1;
    }
    else
    {
      uint64_t v20 = +[VUIPlaybackSettings sharedSettings];
      unsigned int v38 = [v20 cellularDataPlaybackEnabled];
    }
    int v21 = (id)sLogObject_18;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      if (v19) {
        uint64_t v22 = @"YES";
      }
      else {
        uint64_t v22 = @"NO";
      }
      uint64_t v23 = +[VUIPlaybackSettings sharedSettings];
      if ([v23 cellularDataPlaybackEnabled]) {
        __int16 v24 = @"YES";
      }
      else {
        __int16 v24 = @"NO";
      }
      *(_DWORD *)buf = 138412546;
      v54 = v22;
      __int16 v55 = 2112;
      v56 = v24;
      _os_log_impl(&dword_1E2BD7000, v21, OS_LOG_TYPE_DEFAULT, "existingPlaybackSessionAllowsCellular: %@, cellularDataPlaybackEnabled: %@", buf, 0x16u);
    }
    if (v18 && [v18 isEqualToMediaItem:v13]) {
      goto LABEL_36;
    }
    int v25 = [(__CFString *)v13 hasTrait:*MEMORY[0x1E4FAA188]];
    if ([(VUIPlaybackStartupCoordinator *)self forceDownloadToStream])
    {
      uint64_t v26 = sLogObject_18;
      int v25 = 0;
      if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v26, OS_LOG_TYPE_DEFAULT, "Treating downloaded video as streaming during preflight", buf, 2u);
        int v25 = 0;
      }
    }
    if ([(VUIPlaybackStartupCoordinator *)self _shouldPromptForExpiredDownload:v13])
    {
      char v27 = [(__CFString *)v13 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FA0]];
      int v28 = [v27 intValue];

      if (v28 != 2) {
        [(VUIPlaybackStartupCoordinator *)self _showAlertControllerForExpirationPromptForDownload:v13 presentingViewController:v37];
      }
      uint64_t v29 = sLogObject_18;
      if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v29, OS_LOG_TYPE_DEFAULT, "Preflight disallowed playback because download is expired", buf, 2u);
      }
      (*((void (**)(void *, void, void))v16 + 2))(v16, 0, 0);
      goto LABEL_37;
    }
    if (v25)
    {
      __int16 v30 = sLogObject_18;
      if (!os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
      {
LABEL_36:
        (*((void (**)(void *, uint64_t, void))v16 + 2))(v16, 1, v38);
LABEL_37:

        objc_destroyWeak(&v51);
        objc_destroyWeak(&location);
        goto LABEL_38;
      }
      *(_WORD *)buf = 0;
      uint64_t v31 = "Preflight allowing playback because content is downloaded";
    }
    else
    {
      uint64_t v32 = +[VUIPlaybackSettings sharedSettings];
      BOOL v33 = [v32 networkStatus] == 1;

      if (!v33)
      {
        id v34 = +[VUIPlaybackSettings sharedSettings];
        BOOL v35 = [v34 networkStatus] == 0;

        if (v35)
        {
          id v36 = sLogObject_18;
          if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1E2BD7000, v36, OS_LOG_TYPE_DEFAULT, "Preflight disallowing streaming playback because no network is available", buf, 2u);
          }
          [(VUIPlaybackStartupCoordinator *)self _presentCantPlaybackOverCellularAlertControllerWithMediaItem:v13 presentingViewController:v37 completionHandler:0];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __107__VUIPlaybackStartupCoordinator__preflightPlaybackWithPlaylist_presentingViewController_completionHandler___block_invoke_324;
          block[3] = &unk_1E6DF3DD0;
          id v46 = v16;
          dispatch_async(MEMORY[0x1E4F14428], block);
        }
        else
        {
          v40[0] = MEMORY[0x1E4F143A8];
          v40[1] = 3221225472;
          id v40[2] = __107__VUIPlaybackStartupCoordinator__preflightPlaybackWithPlaylist_presentingViewController_completionHandler___block_invoke_2_325;
          v40[3] = &unk_1E6DFA590;
          objc_copyWeak(&v44, &location);
          id v43 = v16;
          uint64_t v41 = v13;
          id v42 = v37;
          [(VUIPlaybackStartupCoordinator *)self _checkIfAllowedToPlayOnCellularNetworkWithMediaItem:v41 presentingController:v42 completion:v40];

          objc_destroyWeak(&v44);
        }
        goto LABEL_37;
      }
      __int16 v30 = sLogObject_18;
      if (!os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_36;
      }
      *(_WORD *)buf = 0;
      uint64_t v31 = "Preflight allowing streaming playback because network is WiFi";
    }
    _os_log_impl(&dword_1E2BD7000, v30, OS_LOG_TYPE_DEFAULT, v31, buf, 2u);
    goto LABEL_36;
  }
  int v12 = sLogObject_18;
  if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_DEFAULT, "Skipping preflight since this playlist is already being presented.  Using existing value for allowing cellular", buf, 2u);
  }
  uint64_t v13 = +[VUIPlaybackManager sharedInstance];
  (*((void (**)(id, uint64_t, uint64_t))v9 + 2))(v9, 1, [(__CFString *)v13 currentPlaylistAllowsCellular]);
LABEL_38:
}

void __107__VUIPlaybackStartupCoordinator__preflightPlaybackWithPlaylist_presentingViewController_completionHandler___block_invoke(id *a1, int a2, char a3)
{
  id v6 = a1 + 7;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (a2)
  {
    id v8 = a1[4];
    id v9 = a1[5];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __107__VUIPlaybackStartupCoordinator__preflightPlaybackWithPlaylist_presentingViewController_completionHandler___block_invoke_2;
    void v10[3] = &unk_1E6DFA518;
    objc_copyWeak(&v14, v6);
    id v11 = a1[4];
    id v12 = a1[5];
    id v13 = a1[6];
    char v15 = a3;
    [WeakRetained _performRatingAndAgeVerificationWithMediaItem:v8 presentingController:v9 completion:v10];

    objc_destroyWeak(&v14);
  }
  else
  {
    (*((void (**)(void))a1[6] + 2))();
  }
}

void __107__VUIPlaybackStartupCoordinator__preflightPlaybackWithPlaylist_presentingViewController_completionHandler___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v4 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v6 = sLogObject_18;
  BOOL v7 = os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "Preflight allowing playback after performing rating and age verification", buf, 2u);
    }
    if ([WeakRetained _shouldWarnStartingRentalPlaybackWindowWithMediaItem:*(void *)(a1 + 32)])
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __107__VUIPlaybackStartupCoordinator__preflightPlaybackWithPlaylist_presentingViewController_completionHandler___block_invoke_312;
      v14[3] = &unk_1E6DFA4F0;
      objc_copyWeak(&v17, v4);
      id v15 = *(id *)(a1 + 40);
      id v16 = *(id *)(a1 + 48);
      char v18 = *(unsigned char *)(a1 + 64);
      [WeakRetained _presentStartingPlaybackWindowWarningWithRentalMediaItem:v8 presentingViewController:v9 completionHandler:v14];

      objc_destroyWeak(&v17);
    }
    else
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __107__VUIPlaybackStartupCoordinator__preflightPlaybackWithPlaylist_presentingViewController_completionHandler___block_invoke_316;
      void v11[3] = &unk_1E6DFA4A0;
      uint64_t v10 = *(void *)(a1 + 40);
      id v12 = *(id *)(a1 + 48);
      char v13 = *(unsigned char *)(a1 + 64);
      [WeakRetained _configureFor2Dor3DWithPresentingController:v10 completion:v11];
    }
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "Preflight disallowing playback after performing rating and age verification", buf, 2u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __107__VUIPlaybackStartupCoordinator__preflightPlaybackWithPlaylist_presentingViewController_completionHandler___block_invoke_312(uint64_t a1, int a2)
{
  uint64_t v4 = sLogObject_18;
  BOOL v5 = os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "Preflight allowing playback after showing rental window warning", buf, 2u);
    }
    dispatch_time_t v6 = dispatch_time(0, 1000000000);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __107__VUIPlaybackStartupCoordinator__preflightPlaybackWithPlaylist_presentingViewController_completionHandler___block_invoke_313;
    v7[3] = &unk_1E6DFA4C8;
    objc_copyWeak(&v10, (id *)(a1 + 48));
    id v8 = *(id *)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    char v11 = *(unsigned char *)(a1 + 56);
    dispatch_after(v6, MEMORY[0x1E4F14428], v7);

    objc_destroyWeak(&v10);
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "Preflight disallowing playback after showing rental window warning", buf, 2u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __107__VUIPlaybackStartupCoordinator__preflightPlaybackWithPlaylist_presentingViewController_completionHandler___block_invoke_313(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __107__VUIPlaybackStartupCoordinator__preflightPlaybackWithPlaylist_presentingViewController_completionHandler___block_invoke_2_314;
  v4[3] = &unk_1E6DFA4A0;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  char v6 = *(unsigned char *)(a1 + 56);
  [WeakRetained _configureFor2Dor3DWithPresentingController:v3 completion:v4];
}

uint64_t __107__VUIPlaybackStartupCoordinator__preflightPlaybackWithPlaylist_presentingViewController_completionHandler___block_invoke_2_314(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, *(unsigned __int8 *)(a1 + 40));
}

uint64_t __107__VUIPlaybackStartupCoordinator__preflightPlaybackWithPlaylist_presentingViewController_completionHandler___block_invoke_316(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, *(unsigned __int8 *)(a1 + 40));
}

uint64_t __107__VUIPlaybackStartupCoordinator__preflightPlaybackWithPlaylist_presentingViewController_completionHandler___block_invoke_324(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __107__VUIPlaybackStartupCoordinator__preflightPlaybackWithPlaylist_presentingViewController_completionHandler___block_invoke_2_325(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = WeakRetained;
  if ((a2 & 1) == 0)
  {
    id v8 = sLogObject_18;
    if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "Preflight disallowing streaming playback because network is cellular and cellular playback is not allowed", buf, 2u);
    }
    id v9 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_10;
  }
  if (![WeakRetained _shouldWarnAboutRentalPlaybackQualityForRentalMediaItem:*(void *)(a1 + 32)])
  {
    id v10 = sLogObject_18;
    if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "Preflight allowing streaming playback over cellular connection", buf, 2u);
    }
    id v9 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_10:
    v9();
    goto LABEL_11;
  }
  char v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __107__VUIPlaybackStartupCoordinator__preflightPlaybackWithPlaylist_presentingViewController_completionHandler___block_invoke_326;
  void v11[3] = &unk_1E6DFA568;
  id v12 = v6;
  id v13 = *(id *)(a1 + 48);
  [v5 _showCellularPlaybackQualityOptionsForRentalMediaItem:v12 presentingViewController:v7 completionHandler:v11];

LABEL_11:
}

uint64_t __107__VUIPlaybackStartupCoordinator__preflightPlaybackWithPlaylist_presentingViewController_completionHandler___block_invoke_326(uint64_t a1, int a2, uint64_t a3)
{
  char v6 = sLogObject_18;
  BOOL v7 = os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "Preflight allowing playback of rental over cellular after displaying rental playback quality dialog", buf, 2u);
    }
    id v8 = *(void **)(a1 + 32);
    id v9 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
    [v8 setMediaItemMetadata:v9 forProperty:*MEMORY[0x1E4FA9FB8]];

    id v10 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (v7)
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "Preflight disallowing playback of rental over cellular after displaying rental playback quality dialog", v12, 2u);
    }
    id v10 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  }
  return v10();
}

- (BOOL)_shouldWarnStartingRentalPlaybackWindowWithMediaItem:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 hasTrait:*MEMORY[0x1E4FAA190]])
  {
    uint64_t v4 = [v3 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA028]];
    if (v4)
    {
      id v5 = sLogObject_18;
      BOOL v6 = 0;
      if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "Rental has already been played.  Not showing rental playback warning.", (uint8_t *)&v22, 2u);
        BOOL v6 = 0;
      }
      goto LABEL_22;
    }
    BOOL v7 = [v3 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA010]];
    uint64_t v8 = [v3 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA020]];
    id v9 = (void *)v8;
    if (v7) {
      BOOL v10 = v8 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
      id v17 = sLogObject_18;
      if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        char v11 = "No rental metadata is available.  Showing rental playback warning";
LABEL_16:
        _os_log_impl(&dword_1E2BD7000, v17, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v22, 2u);
      }
    }
    else
    {
      id v12 = [MEMORY[0x1E4F1C9C8] date];
      [v7 timeIntervalSinceDate:v12];
      double v14 = v13;

      [v9 doubleValue];
      double v16 = v15;
      id v17 = sLogObject_18;
      BOOL v18 = os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT);
      if (v14 < v16)
      {
        if (v18)
        {
          BOOL v19 = v17;
          [v9 doubleValue];
          int v22 = 134218240;
          double v23 = v14;
          __int16 v24 = 2048;
          uint64_t v25 = v20;
          _os_log_impl(&dword_1E2BD7000, v19, OS_LOG_TYPE_DEFAULT, "Rental is being played for the first time, but seconds until rental expiration, %f, is less than rental playback duration, %f.  Not showing rental playback warning.", (uint8_t *)&v22, 0x16u);
        }
        BOOL v6 = 0;
        goto LABEL_21;
      }
      if (v18)
      {
        LOWORD(v22) = 0;
        char v11 = "Rental is being played for the first time.  Showing rental playback warning.";
        goto LABEL_16;
      }
    }
    BOOL v6 = 1;
LABEL_21:

LABEL_22:
    goto LABEL_23;
  }
  BOOL v6 = 0;
LABEL_23:

  return v6;
}

- (void)_presentStartingPlaybackWindowWarningWithRentalMediaItem:(id)a3 presentingViewController:(id)a4 completionHandler:(id)a5
{
  v36[2] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  uint64_t v8 = NSString;
  id v30 = a4;
  id v9 = a3;
  BOOL v10 = +[VUILocalizationManager sharedInstance];
  char v11 = [v10 localizedStringForKey:@"RENTAL_PLAYBACK_WINDOW_WARNING_TITLE_FORMAT"];
  id v12 = [v9 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0E8]];

  int v28 = [v8 stringWithValidatedFormat:v11, @"%@", 0, v12 validFormatSpecifiers error];

  double v13 = +[VUILocalizationManager sharedInstance];
  uint64_t v29 = [v13 localizedStringForKey:@"RENTAL_PLAYBACK_WINDOW_WARNING_MESSAGE"];

  double v14 = [MEMORY[0x1E4FB08E0] systemFontOfSize:11.0 weight:*MEMORY[0x1E4FB09D8]];
  uint64_t v15 = *MEMORY[0x1E4FB0700];
  v35[0] = *MEMORY[0x1E4FB06F8];
  v35[1] = v15;
  v36[0] = v14;
  double v16 = [MEMORY[0x1E4FB1618] systemGrayColor];
  v36[1] = v16;
  id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];

  BOOL v18 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v29 attributes:v17];
  BOOL v19 = +[VUIAlertController vui_alertControllerWithTitle:v28 message:0 preferredStyle:1];
  [v19 _setAttributedMessage:v18];
  uint64_t v20 = +[VUILocalizationManager sharedInstance];
  int v21 = [v20 localizedStringForKey:@"PLAY"];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __133__VUIPlaybackStartupCoordinator__presentStartingPlaybackWindowWarningWithRentalMediaItem_presentingViewController_completionHandler___block_invoke;
  v33[3] = &unk_1E6DF9150;
  id v22 = v7;
  id v34 = v22;
  double v23 = +[VUIAlertAction vui_actionWithTitle:v21 style:0 handler:v33];
  objc_msgSend(v19, "vui_addAction:", v23);

  __int16 v24 = +[VUILocalizationManager sharedInstance];
  uint64_t v25 = [v24 localizedStringForKey:@"CANCEL"];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __133__VUIPlaybackStartupCoordinator__presentStartingPlaybackWindowWarningWithRentalMediaItem_presentingViewController_completionHandler___block_invoke_2;
  v31[3] = &unk_1E6DF9150;
  id v32 = v22;
  id v26 = v22;
  char v27 = +[VUIAlertAction vui_actionWithTitle:v25 style:1 handler:v31];
  objc_msgSend(v19, "vui_addAction:", v27);

  objc_msgSend(v19, "vui_presentAlertFromPresentingController:animated:completion:", v30, 1, 0);
}

uint64_t __133__VUIPlaybackStartupCoordinator__presentStartingPlaybackWindowWarningWithRentalMediaItem_presentingViewController_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __133__VUIPlaybackStartupCoordinator__presentStartingPlaybackWindowWarningWithRentalMediaItem_presentingViewController_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_presentCantPlaybackOverCellularAlertControllerWithMediaItem:(id)a3 presentingViewController:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  int v10 = MGGetBoolAnswer();
  char v11 = +[VUILocalizationManager sharedInstance];
  id v12 = v11;
  if (v10) {
    double v13 = @"CONNECT_TO_WLAN_TO_PLAYBACK_ERROR_MESSAGE_MOVIE";
  }
  else {
    double v13 = @"CONNECT_TO_WIFI_TO_PLAYBACK_ERROR_MESSAGE_MOVIE";
  }
  double v14 = [v11 localizedStringForKey:v13];

  uint64_t v15 = [v9 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FB0]];

  if (![v15 isEqualToString:*MEMORY[0x1E4FAA200]])
  {
    if (v10) {
      goto LABEL_8;
    }
LABEL_10:
    BOOL v19 = objc_msgSend(MEMORY[0x1E4F28B50], "vui_videosUIBundle");
    uint64_t v20 = [v19 localizedStringForKey:@"CANT_PLAYBACK_OVER_CELLULAR_NETWORK_ERROR_TITLE" value:0 table:@"VideosUIEmbedded"];
    goto LABEL_11;
  }
  double v16 = +[VUILocalizationManager sharedInstance];
  id v17 = v16;
  if ((v10 & 1) == 0)
  {
    uint64_t v21 = [v16 localizedStringForKey:@"CONNECT_TO_WIFI_TO_PLAYBACK_ERROR_MESSAGE_EPISODE"];

    double v14 = (void *)v21;
    goto LABEL_10;
  }
  uint64_t v18 = [v16 localizedStringForKey:@"CONNECT_TO_WLAN_TO_PLAYBACK_ERROR_MESSAGE_EPISODE"];

  double v14 = (void *)v18;
LABEL_8:
  BOOL v19 = +[VUILocalizationManager sharedInstance];
  uint64_t v20 = [v19 localizedStringForKey:@"CANT_PLAYBACK_OVER_WLAN_ERROR_TITLE"];
LABEL_11:
  id v22 = (void *)v20;

  double v23 = +[VUIAlertController vui_alertControllerWithTitle:v22 message:v14 preferredStyle:1];
  __int16 v24 = +[VUILocalizationManager sharedInstance];
  uint64_t v25 = [v24 localizedStringForKey:@"OK"];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __137__VUIPlaybackStartupCoordinator__presentCantPlaybackOverCellularAlertControllerWithMediaItem_presentingViewController_completionHandler___block_invoke;
  v28[3] = &unk_1E6DF9150;
  id v29 = v7;
  id v26 = v7;
  char v27 = +[VUIAlertAction vui_actionWithTitle:v25 style:0 handler:v28];
  objc_msgSend(v23, "vui_addAction:", v27);

  objc_msgSend(v23, "vui_presentAlertFromPresentingController:animated:completion:", v8, 1, 0);
}

uint64_t __137__VUIPlaybackStartupCoordinator__presentCantPlaybackOverCellularAlertControllerWithMediaItem_presentingViewController_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_showCellularPlaybackQualityOptionsForRentalMediaItem:(id)a3 presentingViewController:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v28 = a4;
  id v8 = a3;
  id v9 = +[VUILocalizationManager sharedInstance];
  id v29 = [v9 localizedStringForKey:@"WATCH_RENTAL_IN_HD_TITLE_FORMAT"];

  int v10 = NSString;
  char v11 = [v8 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0E8]];

  id v12 = [v10 stringWithValidatedFormat:v29, @"%@", 0, v11 validFormatSpecifiers error];

  double v13 = objc_msgSend(MEMORY[0x1E4F28B50], "vui_videosUIBundle");
  double v14 = [v13 localizedStringForKey:@"WATCH_RENTAL_IN_HD_DESCRIPTION" value:0 table:@"VideosUIEmbedded"];

  uint64_t v15 = +[VUIAlertController vui_alertControllerWithTitle:v12 message:v14 preferredStyle:1];
  double v16 = +[VUILocalizationManager sharedInstance];
  id v17 = [v16 localizedStringForKey:@"WATCH"];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __130__VUIPlaybackStartupCoordinator__showCellularPlaybackQualityOptionsForRentalMediaItem_presentingViewController_completionHandler___block_invoke;
  v34[3] = &unk_1E6DF9150;
  id v18 = v7;
  id v35 = v18;
  BOOL v19 = +[VUIAlertAction vui_actionWithTitle:v17 style:0 handler:v34];
  objc_msgSend(v15, "vui_addAction:", v19);

  uint64_t v20 = +[VUILocalizationManager sharedInstance];
  uint64_t v21 = [v20 localizedStringForKey:@"WATCH_IN_SD"];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __130__VUIPlaybackStartupCoordinator__showCellularPlaybackQualityOptionsForRentalMediaItem_presentingViewController_completionHandler___block_invoke_2;
  v32[3] = &unk_1E6DF9150;
  id v22 = v18;
  id v33 = v22;
  double v23 = +[VUIAlertAction vui_actionWithTitle:v21 style:0 handler:v32];
  objc_msgSend(v15, "vui_addAction:", v23);

  __int16 v24 = +[VUILocalizationManager sharedInstance];
  uint64_t v25 = [v24 localizedStringForKey:@"CANCEL"];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __130__VUIPlaybackStartupCoordinator__showCellularPlaybackQualityOptionsForRentalMediaItem_presentingViewController_completionHandler___block_invoke_3;
  v30[3] = &unk_1E6DF9150;
  id v31 = v22;
  id v26 = v22;
  char v27 = +[VUIAlertAction vui_actionWithTitle:v25 style:1 handler:v30];
  objc_msgSend(v15, "vui_addAction:", v27);

  objc_msgSend(v15, "vui_presentAlertFromPresentingController:animated:completion:", v28, 1, 0);
}

uint64_t __130__VUIPlaybackStartupCoordinator__showCellularPlaybackQualityOptionsForRentalMediaItem_presentingViewController_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __130__VUIPlaybackStartupCoordinator__showCellularPlaybackQualityOptionsForRentalMediaItem_presentingViewController_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __130__VUIPlaybackStartupCoordinator__showCellularPlaybackQualityOptionsForRentalMediaItem_presentingViewController_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_performRatingAndAgeVerificationWithMediaItem:(id)a3 presentingController:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  int v10 = +[VUIPreflightManager defaultPreflightManager];
  [v10 setPresentingController:v8];

  [v10 setMediaItem:v9];
  [v10 setRestrictionsCheckType:0];
  int v11 = [v9 hasTrait:*MEMORY[0x1E4FAA188]];

  if (v11
    && (+[VUIAgeVerification sharedInstance],
        id v12 = objc_claimAutoreleasedReturnValue(),
        char v13 = [v12 isAgeVerificationEnabled],
        v12,
        (v13 & 1) != 0))
  {
    uint64_t v14 = 1;
  }
  else
  {
    uint64_t v14 = 3;
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __111__VUIPlaybackStartupCoordinator__performRatingAndAgeVerificationWithMediaItem_presentingController_completion___block_invoke;
  v16[3] = &unk_1E6DFA5B8;
  id v17 = v7;
  id v15 = v7;
  [v10 preflightWithOptions:v14 completion:v16];
}

uint64_t __111__VUIPlaybackStartupCoordinator__performRatingAndAgeVerificationWithMediaItem_presentingController_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)_shouldWarnAboutRentalPlaybackQualityForRentalMediaItem:(id)a3
{
  uint64_t v3 = *MEMORY[0x1E4FAA190];
  id v4 = a3;
  LODWORD(v3) = [v4 hasTrait:v3];
  id v5 = +[VUIPlaybackSettings sharedSettings];
  uint64_t v6 = [v5 networkStatus];

  int v7 = [v4 hasTrait:*MEMORY[0x1E4FAA178]];
  id v8 = +[VUIPlaybackSettings sharedSettings];
  uint64_t v9 = [v8 preferredCellularPlaybackQuality];

  if (v3) {
    BOOL v10 = v6 == 2;
  }
  else {
    BOOL v10 = 0;
  }
  BOOL v12 = v10 && v7 != 0 && v9 == 1;
  BOOL result = 0;
  if (v12)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F38C20]);
    uint64_t v14 = [v13 path];
    char v15 = [v14 isExpensive];

    if (v15) {
      return 1;
    }
  }
  return result;
}

- (void)_checkIfAllowedToPlayOnCellularNetworkWithMediaItem:(id)a3 presentingController:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![v8 hasTrait:*MEMORY[0x1E4FAA150]])
  {
    BOOL v12 = +[VUIPlaybackSettings sharedSettings];
    int v13 = [v12 cellularDataPlaybackEnabled];

    if (v13)
    {
      uint64_t v14 = sLogObject_18;
      if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        char v15 = "Cellular playback setting allowing playback";
LABEL_14:
        _os_log_impl(&dword_1E2BD7000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 2u);
      }
    }
    else if ([(VUIPlaybackStartupCoordinator *)self _existingPlaybackSessionAllowsCellular])
    {
      uint64_t v14 = sLogObject_18;
      if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        char v15 = "Existing playback session allows cellular; allowing playback";
        goto LABEL_14;
      }
    }
    else
    {
      if (![(VUIPlaybackStartupCoordinator *)self _mediaItemIsBeingDownloadedAndDownloadAllowsCellular:v8])
      {
        int v16 = MGGetBoolAnswer();
        id v17 = objc_msgSend(MEMORY[0x1E4F28B50], "vui_videosUIBundle");
        id v34 = [v17 localizedStringForKey:@"ASK_TO_ENABLE_CELLULAR_DATA_TO_STREAM_TITLE" value:0 table:@"VideosUIEmbedded"];

        id v18 = objc_msgSend(MEMORY[0x1E4F28B50], "vui_videosUIBundle");
        BOOL v19 = v18;
        if (v16) {
          uint64_t v20 = @"ASK_TO_ENABLE_CELLULAR_DATA_TO_STREAM_MESSAGE_WLAN";
        }
        else {
          uint64_t v20 = @"ASK_TO_ENABLE_CELLULAR_DATA_TO_STREAM_MESSAGE_WIFI";
        }
        id v33 = [v18 localizedStringForKey:v20 value:0 table:@"VideosUIEmbedded"];

        uint64_t v21 = objc_msgSend(MEMORY[0x1E4F28B50], "vui_videosUIBundle");
        id v32 = [v21 localizedStringForKey:@"ENABLE_CELLULAR_DATA_TO_STREAM_BUTTON_TITLE" value:0 table:@"VideosUIEmbedded"];

        id v22 = objc_msgSend(MEMORY[0x1E4F28B50], "vui_videosUIBundle");
        id v31 = [v22 localizedStringForKey:@"USE_CELLULAR_DATA_TO_STREAM_ONCE_BUTTON_TITLE" value:0 table:@"VideosUIEmbedded"];

        double v23 = objc_msgSend(MEMORY[0x1E4F28B50], "vui_videosUIBundle");
        id v30 = [v23 localizedStringForKey:@"DONT_ENABLE_CELLULAR_DATA_TO_STREAM_BUTTON_TITLE" value:0 table:@"VideosUIEmbedded"];

        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __117__VUIPlaybackStartupCoordinator__checkIfAllowedToPlayOnCellularNetworkWithMediaItem_presentingController_completion___block_invoke_407;
        v39[3] = &unk_1E6DF9150;
        id v24 = v10;
        id v40 = v24;
        uint64_t v25 = +[VUIAlertAction vui_actionWithTitle:v32 style:0 handler:v39];
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __117__VUIPlaybackStartupCoordinator__checkIfAllowedToPlayOnCellularNetworkWithMediaItem_presentingController_completion___block_invoke_408;
        v37[3] = &unk_1E6DF9150;
        id v26 = v24;
        id v38 = v26;
        char v27 = +[VUIAlertAction vui_actionWithTitle:v31 style:0 handler:v37];
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        void v35[2] = __117__VUIPlaybackStartupCoordinator__checkIfAllowedToPlayOnCellularNetworkWithMediaItem_presentingController_completion___block_invoke_409;
        v35[3] = &unk_1E6DF9150;
        id v36 = v26;
        id v28 = +[VUIAlertAction vui_actionWithTitle:v30 style:0 handler:v35];
        id v29 = +[VUIAlertController vui_alertControllerWithTitle:v34 message:v33 preferredStyle:1];
        objc_msgSend(v29, "vui_addAction:isPreferred:", v25, 1);
        objc_msgSend(v29, "vui_addAction:", v27);
        objc_msgSend(v29, "vui_addAction:", v28);
        objc_msgSend(v29, "vui_presentAlertFromPresentingController:animated:completion:", v9, 1, 0);

        goto LABEL_16;
      }
      uint64_t v14 = sLogObject_18;
      if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        char v15 = "Cellular playback allowed because content is already being downloaded using cellular";
        goto LABEL_14;
      }
    }
    (*((void (**)(id, uint64_t))v10 + 2))(v10, 1);
    goto LABEL_16;
  }
  int v11 = sLogObject_18;
  if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "Cellular playback of this media item is prohibited, regardless of cellular settings", buf, 2u);
  }
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __117__VUIPlaybackStartupCoordinator__checkIfAllowedToPlayOnCellularNetworkWithMediaItem_presentingController_completion___block_invoke;
  v41[3] = &unk_1E6DF3DD0;
  id v42 = v10;
  [(VUIPlaybackStartupCoordinator *)self _presentCantPlaybackOverCellularAlertControllerWithMediaItem:v8 presentingViewController:v9 completionHandler:v41];

LABEL_16:
}

uint64_t __117__VUIPlaybackStartupCoordinator__checkIfAllowedToPlayOnCellularNetworkWithMediaItem_presentingController_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __117__VUIPlaybackStartupCoordinator__checkIfAllowedToPlayOnCellularNetworkWithMediaItem_presentingController_completion___block_invoke_407(uint64_t a1)
{
  uint64_t v2 = sLogObject_18;
  if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1E2BD7000, v2, OS_LOG_TYPE_DEFAULT, "Cellular playback allowed because cellular playback setting was toggled on by user selection", v5, 2u);
  }
  uint64_t v3 = +[VUIPlaybackSettings sharedSettings];
  [v3 setCellularDataPlaybackEnabled:1];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __117__VUIPlaybackStartupCoordinator__checkIfAllowedToPlayOnCellularNetworkWithMediaItem_presentingController_completion___block_invoke_408(uint64_t a1)
{
  uint64_t v2 = sLogObject_18;
  if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1E2BD7000, v2, OS_LOG_TYPE_DEFAULT, "Cellular playback allowed via one-time option by user selection", v4, 2u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __117__VUIPlaybackStartupCoordinator__checkIfAllowedToPlayOnCellularNetworkWithMediaItem_presentingController_completion___block_invoke_409(uint64_t a1)
{
  uint64_t v2 = sLogObject_18;
  if (os_log_type_enabled((os_log_t)sLogObject_18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1E2BD7000, v2, OS_LOG_TYPE_DEFAULT, "Cellular playback disallowed by user selection", v4, 2u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_shouldPromptForExpiredDownload:(id)a3
{
  uint64_t v3 = [a3 mediaItemMetadataForProperty:@"VUIContentMetadataDownloadExpirationDate"];
  id v4 = v3;
  if (v3) {
    char v5 = objc_msgSend(v3, "vui_isInThePast");
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (void)_showAlertControllerForExpirationPromptForDownload:(id)a3 presentingViewController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = [v5 mediaItemMetadataForProperty:@"VUIContentMetadataAvailabilityEndDate"];
  id v8 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E18]];
  if (v7 && !objc_msgSend(v7, "vui_isInTheFuture"))
  {
    id v28 = NSString;
    id v29 = +[VUILocalizationManager sharedInstance];
    id v30 = [v29 localizedStringForKey:@"DOWNLOAD_MESSAGE_NO_LONGER_AVAILABLE"];
    char v27 = [v28 stringWithValidatedFormat:v30, @"%@", 0, v8 validFormatSpecifiers error];

    id v31 = +[VUILocalizationManager sharedInstance];
    id v32 = [v31 localizedStringForKey:@"DOWNLOAD_NO_LONGER_AVAILABLE"];
    BOOL v19 = +[VUIAlertController vui_alertControllerWithTitle:v32 message:v27 preferredStyle:1];

    id v33 = +[VUILocalizationManager sharedInstance];
    id v34 = [v33 localizedStringForKey:@"DELETE"];
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __109__VUIPlaybackStartupCoordinator__showAlertControllerForExpirationPromptForDownload_presentingViewController___block_invoke_3;
    v53[3] = &unk_1E6DF8C08;
    id v54 = v5;
    id v35 = +[VUIAlertAction vui_actionWithTitle:v34 style:0 handler:v53];

    [(__CFString *)v19 vui_addAction:v35];
    [(__CFString *)v19 vui_presentAlertFromPresentingController:v6 animated:1 completion:0];

    id v26 = v54;
  }
  else
  {
    id v9 = [v5 mediaItemMetadataForProperty:@"VUIContentMetadataDownloadAllowsManualRenewal"];
    int v10 = [v9 BOOLValue];

    char v11 = [v5 hasTrait:*MEMORY[0x1E4FAA150]];
    BOOL v12 = [MEMORY[0x1E4FB3CF8] sharedInstance];
    int v13 = [v12 isNetworkReachable];

    uint64_t v14 = &off_1E6DF2000;
    char v15 = +[VUILocalizationManager sharedInstance];
    int v16 = v15;
    v52 = v8;
    if (v13)
    {
      if (v10)
      {
        uint64_t v50 = [v15 localizedStringForKey:@"RENEW_DOWNLOAD"];

        +[VUILocalizationManager sharedInstance];
        v18 = id v17 = v8;
        BOOL v19 = [v18 localizedStringForKey:@"RENEW_DOWNLOAD"];

        uint64_t v20 = NSString;
        uint64_t v21 = +[VUILocalizationManager sharedInstance];
        [v21 localizedStringForKey:@"DOWNLOAD_MESSAGE_RENEW"];
        id v22 = v7;
        id v23 = v6;
        v25 = char v24 = v11;
        id v49 = v17;
        uint64_t v14 = &off_1E6DF2000;
        id v26 = [v20 stringWithValidatedFormat:v25, @"%@", 0, v49 validFormatSpecifiers error];

        char v11 = v24;
        id v6 = v23;
        int v7 = v22;
        char v27 = (void *)v50;
      }
      else
      {
        char v27 = [v15 localizedStringForKey:@"DOWNLOAD_AGAIN"];

        +[VUILocalizationManager sharedInstance];
        id v36 = v51 = v11;
        BOOL v19 = [v36 localizedStringForKey:@"DOWNLOAD_AGAIN_BUTTON_TITLE"];

        id v37 = NSString;
        +[VUILocalizationManager sharedInstance];
        uint64_t v21 = v38 = v8;
        id v39 = [v21 localizedStringForKey:@"DOWNLOAD_MESSAGE_REDOWNLOAD"];
        id v40 = v37;
        char v11 = v51;
        id v26 = [v40 stringWithValidatedFormat:v39, @"%@", 0, v38 validFormatSpecifiers error];

        uint64_t v14 = &off_1E6DF2000;
      }
    }
    else
    {
      char v27 = [v15 localizedStringForKey:@"DOWNLOAD_OFFLINE_RENEW"];

      uint64_t v21 = +[VUILocalizationManager sharedInstance];
      id v26 = [v21 localizedStringForKey:@"DOWNLOAD_OFFLINE_RENEW_MESSAGE"];
      BOOL v19 = &stru_1F3E921E0;
    }

    uint64_t v41 = +[VUIAlertController vui_alertControllerWithTitle:v27 message:v26 preferredStyle:1];
    if (v13)
    {
      id v42 = v14;
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __109__VUIPlaybackStartupCoordinator__showAlertControllerForExpirationPromptForDownload_presentingViewController___block_invoke;
      v55[3] = &unk_1E6DFA5E0;
      id v56 = v5;
      id v57 = v6;
      char v58 = v11 ^ 1;
      id v43 = +[VUIAlertAction vui_actionWithTitle:v19 style:0 handler:v55];
      objc_msgSend(v41, "vui_addAction:", v43);

      id v44 = [v42[249] sharedInstance];
      id v45 = v44;
      id v46 = @"CANCEL";
    }
    else
    {
      id v44 = [v14[249] sharedInstance];
      id v45 = v44;
      id v46 = @"OK";
    }
    __int16 v47 = [v44 localizedStringForKey:v46];

    id v48 = +[VUIAlertAction vui_actionWithTitle:v47 style:1 handler:0];
    objc_msgSend(v41, "vui_addAction:", v48);
    objc_msgSend(v41, "vui_presentAlertFromPresentingController:animated:completion:", v6, 1, 0);

    id v8 = v52;
  }
}

void __109__VUIPlaybackStartupCoordinator__showAlertControllerForExpirationPromptForDownload_presentingViewController___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[VUIDownloadManager sharedInstance];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __109__VUIPlaybackStartupCoordinator__showAlertControllerForExpirationPromptForDownload_presentingViewController___block_invoke_2;
  v6[3] = &unk_1E6DF4DC8;
  id v7 = v3;
  [v2 preflightDownloadForTVPMediaItem:v7 presentingViewController:v4 contentAllowsCellularDownload:v5 completion:v6];
}

void __109__VUIPlaybackStartupCoordinator__showAlertControllerForExpirationPromptForDownload_presentingViewController___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = +[VUIDownloadManager sharedInstance];
  [v7 addDownloadOrRenewKeysForMediaItem:*(void *)(a1 + 32) allowCellular:a3 quality:a4 shouldMarkAsDeletedOnCancellationOrFailure:0];
}

void __109__VUIPlaybackStartupCoordinator__showAlertControllerForExpirationPromptForDownload_presentingViewController___block_invoke_3(uint64_t a1)
{
  id v2 = +[VUIDownloadManager sharedInstance];
  [v2 cancelAndRemoveDownloadForMediaItem:*(void *)(a1 + 32)];
}

- (BOOL)_mediaItemIsBeingDownloadedAndDownloadAllowsCellular:(id)a3
{
  uint64_t v3 = [a3 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0D8]];
  if ([v3 length])
  {
    uint64_t v4 = +[VUIDownloadManager sharedInstance];
    uint64_t v5 = [v4 existingDownloadForAdamID:v3];

    if (v5) {
      char v6 = [v5 allowCellularUsage];
    }
    else {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)_existingPlaybackSessionAllowsCellular
{
  uint64_t v3 = [(VUIPlaybackStartupCoordinator *)self mediaInfo];

  if (!v3) {
    return 0;
  }
  uint64_t v4 = [(VUIPlaybackStartupCoordinator *)self mediaInfo];
  uint64_t v5 = [v4 playbackContext];

  if ((unint64_t)(v5 - 9) > 2) {
    return 0;
  }
  char v6 = +[VUIPlaybackManager sharedInstance];
  char v7 = [v6 currentPlaylistAllowsCellular];

  return v7;
}

- (void)_configureFor2Dor3DWithPresentingController:(id)a3 completion:(id)a4
{
}

- (VUIMediaInfo)mediaInfo
{
  return self->_mediaInfo;
}

- (void)setMediaInfo:(id)a3
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

- (BOOL)isRentAndWatchNow
{
  return self->_isRentAndWatchNow;
}

- (void)setIsRentAndWatchNow:(BOOL)a3
{
  self->_isRentAndWatchNow = a3;
}

- (BOOL)isCellularAllowed
{
  return self->_isCellularAllowed;
}

- (void)setIsCellularAllowed:(BOOL)a3
{
  self->_isCellularAllowed = a3;
}

- (BOOL)forceDownloadToStream
{
  return self->_forceDownloadToStream;
}

- (void)setForceDownloadToStream:(BOOL)a3
{
  self->_forceDownloadToStream = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (NSString)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(id)a3
{
}

- (NSString)videoCanonicalID
{
  return self->_videoCanonicalID;
}

- (void)setVideoCanonicalID:(id)a3
{
}

- (NSString)showCanonicalID
{
  return self->_showCanonicalID;
}

- (void)setShowCanonicalID:(id)a3
{
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(id)a3
{
}

- (NSDictionary)contentMetadata
{
  return self->_contentMetadata;
}

- (void)setContentMetadata:(id)a3
{
}

- (TVPStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
}

- (VUIVideosPlayable)resolvedPlayable
{
  return self->_resolvedPlayable;
}

- (void)setResolvedPlayable:(id)a3
{
}

- (VUIControllerPresenter)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_resolvedPlayable, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_contentMetadata, 0);
  objc_storeStrong((id *)&self->_mediaType, 0);
  objc_storeStrong((id *)&self->_showCanonicalID, 0);
  objc_storeStrong((id *)&self->_videoCanonicalID, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_mediaInfo, 0);
}

- (void)_addGroupActivityDayParamToPlayableAndMediaItem:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Unable to add groupActivityDay param to HLS URL because groupActivityDay is nil", v2, v3, v4, v5, v6);
}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_254_cold_1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Unable to start co-watching since sharedWatchUrl is nil and useSharedPlayableForCowatching is NO", v2, v3, v4, v5, v6);
}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_285_cold_1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Replacing item being watched, but co-watching of next item is not possible.  Performing preflight of next media item but not telling groupActivitiesManager about next item", v2, v3, v4, v5, v6);
}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_3_290_cold_1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Watch type is Join, but co-watching is not possible.  Not allowing playback", v2, v3, v4, v5, v6);
}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_292_cold_1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Playback startup flow is already in progress.  Calling completion immediately with NO for all values", v2, v3, v4, v5, v6);
}

void __62__VUIPlaybackStartupCoordinator__registerStateMachineHandlers__block_invoke_297_cold_1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "GroupActivitiesManager responded with Do Not Play", v2, v3, v4, v5, v6);
}

@end