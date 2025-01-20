@interface VUIActionPlaylist
- (BOOL)requiresAuthentication;
- (NSArray)clipItems;
- (NSArray)metadataViewModels;
- (NSArray)videosPlayable;
- (NSDictionary)collectionViewModel;
- (NSDictionary)contextData;
- (NSString)nextToken;
- (NSString)trailerEndpoint;
- (VUIActionPlaylist)initWithContextData:(id)a3 appContext:(id)a4;
- (VUIAppContext)appContext;
- (id)_maxContentRating;
- (id)_ratingDomain;
- (id)_ratingValue;
- (unint64_t)index;
- (void)_presentViewController:(id)a3;
- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4;
- (void)setAppContext:(id)a3;
- (void)setClipItems:(id)a3;
- (void)setCollectionViewModel:(id)a3;
- (void)setContextData:(id)a3;
- (void)setMetadataViewModels:(id)a3;
- (void)setVideosPlayable:(id)a3;
@end

@implementation VUIActionPlaylist

- (VUIActionPlaylist)initWithContextData:(id)a3 appContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)VUIActionPlaylist;
  v9 = [(VUIActionPlaylist *)&v26 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contextData, a3);
    objc_storeWeak((id *)&v10->_appContext, v8);
    v11 = objc_msgSend(v7, "vui_arrayForKey:", @"videosPlayables");
    v12 = objc_msgSend(v7, "vui_dictionaryForKey:", @"contentMetadata");
    v13 = +[VUIVideosPlayable videosPlayablesFromDictionaries:v11 andMetadataDictionary:v12];
    videosPlayable = v10->_videosPlayable;
    v10->_videosPlayable = v13;
    v15 = v13;

    v16 = objc_msgSend(v7, "vui_numberForKey:", @"index");
    v10->_index = [v16 integerValue];

    uint64_t v17 = objc_msgSend(v7, "vui_arrayForKey:", @"clipItems");
    clipItems = v10->_clipItems;
    v10->_clipItems = (NSArray *)v17;

    uint64_t v19 = objc_msgSend(v7, "vui_arrayForKey:", @"metadataViewModels");
    metadataViewModels = v10->_metadataViewModels;
    v10->_metadataViewModels = (NSArray *)v19;

    v10->_requiresAuthentication = objc_msgSend(v7, "vui_BOOLForKey:defaultValue:", @"requiresAuthentication", 0);
    uint64_t v21 = objc_msgSend(v7, "vui_stringForKey:", @"nextToken");
    nextToken = v10->_nextToken;
    v10->_nextToken = (NSString *)v21;

    uint64_t v23 = objc_msgSend(v7, "vui_stringForKey:", @"trailerEndpoint");
    trailerEndpoint = v10->_trailerEndpoint;
    v10->_trailerEndpoint = (NSString *)v23;
  }
  return v10;
}

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [VUIMediaInfo alloc];
  v9 = [(VUIActionPlaylist *)self videosPlayable];
  v10 = [(VUIMediaInfo *)v8 initWithPlaybackContext:8 videosPlayables:v9 imageProxies:0 storeDictionary:0];

  v11 = +[VUIPlaybackManager sharedInstance];
  int v12 = [v11 isFullscreenPlaybackUIBeingShown];

  if (v12) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = 0;
  }
  v14 = +[VUIPlaybackStartupCoordinator startupCoordinatorWithMediaInfo:v10 watchType:v13 isRentAndWatchNow:0];
  v15 = [(VUIActionPlaylist *)self videosPlayable];
  v16 = [v15 firstObject];

  uint64_t v17 = [v16 sharedWatchUrl];
  if (v17) {
    int v18 = 1;
  }
  else {
    int v18 = [v16 useSharedPlayableForCowatching];
  }

  uint64_t v19 = +[VUIInterfaceFactory sharedInstance];
  v20 = [v19 groupActivitiesManager];
  int v21 = [v20 isEligibleForSession];

  if (v21 && v18)
  {
    [(VUIMediaInfo *)v10 setIntent:1];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __66__VUIActionPlaylist_performWithTargetResponder_completionHandler___block_invoke;
    v29[3] = &unk_1E6DF3DD0;
    id v30 = v7;
    +[VUIActionPlay playMediaInfo:v10 watchType:0 isRentAndWatchNow:0 completion:v29];
  }
  else
  {
    objc_initWeak(&location, self);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __66__VUIActionPlaylist_performWithTargetResponder_completionHandler___block_invoke_2;
    v22[3] = &unk_1E6DF4F68;
    id v23 = v14;
    v24 = v10;
    id v25 = v6;
    id v26 = v7;
    objc_copyWeak(&v27, &location);
    [v23 performPlaybackStartupFlowWithCompletion:v22];
    objc_destroyWeak(&v27);

    objc_destroyWeak(&location);
  }
}

uint64_t __66__VUIActionPlaylist_performWithTargetResponder_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

void __66__VUIActionPlaylist_performWithTargetResponder_completionHandler___block_invoke_2(uint64_t a1, int a2, int a3, uint64_t a4, char a5, void *a6, void *a7, void *a8)
{
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  if (a2)
  {
    if (a3)
    {
      uint64_t v17 = VUIDefaultLogObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v17, OS_LOG_TYPE_DEFAULT, "VUIActionPlaylist:: cowatching, skipping playlist feature", buf, 2u);
      }

      [*(id *)(a1 + 40) setIntent:1];
      uint64_t v18 = *(void *)(a1 + 40);
      uint64_t v19 = *(void *)(a1 + 48);
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __66__VUIActionPlaylist_performWithTargetResponder_completionHandler___block_invoke_25;
      v24[3] = &unk_1E6DF4F40;
      id v25 = *(id *)(a1 + 56);
      LOBYTE(v23) = a5;
      +[VUIActionPlay presentPlaybackWithMediaInfo:v18 multiviewMediaInfos:MEMORY[0x1E4F1CBF0] extrasInfo:0 isCoWatching:1 watchType:0 playType:@"play" allowsCellular:v23 previewMetadata:v16 targetResponder:v19 completion:v24];
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
      [WeakRetained _presentViewController:*(void *)(a1 + 56)];
    }
  }
  else
  {
    v20 = VUIDefaultLogObject();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v20, OS_LOG_TYPE_DEFAULT, "VUIActionPlaylist:: start playback is false, failing playlist presentation", buf, 2u);
    }

    uint64_t v21 = *(void *)(a1 + 56);
    if (v21) {
      (*(void (**)(uint64_t, void))(v21 + 16))(v21, 0);
    }
  }
}

uint64_t __66__VUIActionPlaylist_performWithTargetResponder_completionHandler___block_invoke_25(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (id)_ratingDomain
{
  v2 = [(VUIActionPlaylist *)self videosPlayable];
  v3 = [v2 firstObject];
  v4 = [v3 metadata];
  v5 = [v4 ratingDomain];

  if ([v5 length])
  {
    if ([v5 isEqualToString:@"Show"])
    {
      id v6 = (id *)MEMORY[0x1E4FA9E58];
LABEL_6:
      id v7 = *v6;
      goto LABEL_8;
    }
    if ([v5 isEqualToString:@"Movie"])
    {
      id v6 = (id *)MEMORY[0x1E4FA9E50];
      goto LABEL_6;
    }
  }
  id v7 = 0;
LABEL_8:

  return v7;
}

- (id)_ratingValue
{
  v2 = [(VUIActionPlaylist *)self videosPlayable];
  v3 = [v2 firstObject];
  v4 = [v3 metadata];
  v5 = [v4 ratingValue];

  return v5;
}

- (id)_maxContentRating
{
  v3 = [(VUIActionPlaylist *)self _ratingDomain];
  v4 = [(VUIActionPlaylist *)self _ratingValue];
  if (![v3 length]) {
    goto LABEL_18;
  }
  if ([v3 isEqualToString:*MEMORY[0x1E4FA9E50]])
  {
    v5 = +[VUISettingsManager sharedInstance];
    uint64_t v6 = [v5 maxMovieRank];
    goto LABEL_6;
  }
  if ([v3 isEqualToString:*MEMORY[0x1E4FA9E58]])
  {
    v5 = +[VUISettingsManager sharedInstance];
    uint64_t v6 = [v5 maxTVShowRank];
LABEL_6:
    id v7 = (void *)v6;

    if (!v4)
    {
      if (!v7)
      {
        id v8 = 0;
        v9 = 0;
        goto LABEL_20;
      }
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  id v7 = 0;
  id v8 = 0;
  v9 = 0;
  if (!v4) {
    goto LABEL_20;
  }
LABEL_10:
  if (![v4 integerValue] && v7)
  {
LABEL_12:

    v4 = &unk_1F3F3C3C8;
LABEL_14:
    uint64_t v10 = [v4 integerValue];
    if (v10 <= [v7 integerValue]) {
      v11 = v7;
    }
    else {
      v11 = v4;
    }
    id v8 = v11;

    goto LABEL_19;
  }
  if (v7) {
    goto LABEL_14;
  }
LABEL_18:
  id v8 = 0;
LABEL_19:
  v9 = v4;
LABEL_20:

  return v8;
}

- (void)_presentViewController:(id)a3
{
  id v53 = a3;
  v4 = +[VUIPlaybackManager sharedInstance];
  int v5 = [v4 isFullscreenPlaybackUIBeingShown];

  uint64_t v6 = +[VUIApplicationRouter currentNavigationController];
  id v7 = [v6 topViewController];
  id v8 = [v7 presentedViewController];
  v9 = v8;
  if (v5)
  {
    uint64_t v10 = [v8 presentingViewController];
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  v11 = +[VUITVAppLauncher sharedInstance];
  int v12 = [v11 appWindow];

  v9 = [v12 rootViewController];

  if (!v9)
  {
    uint64_t v13 = +[VUIInterfaceFactory sharedInstance];
    v9 = [v13 controllerPresenter];
  }
LABEL_6:
  id v14 = [(VUIActionPlaylist *)self videosPlayable];
  id v15 = [v14 firstObject];

  if (([v15 isKeyPlayAvailable] & 1) != 0
    || ([(VUIActionPlaylist *)self clipItems],
        id v16 = objc_claimAutoreleasedReturnValue(),
        uint64_t v17 = [v16 count],
        v16,
        v17))
  {
    uint64_t v18 = +[VUIPlaybackManager sharedInstance];
    if ([v18 isFullscreenPlaybackUIBeingShown])
    {
      uint64_t v19 = [(VUIActionPlaylist *)self videosPlayable];

      if (!v19)
      {
        objc_initWeak(location, self);
        v20 = +[VUIPlaybackManager sharedInstance];
        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v58[2] = __44__VUIActionPlaylist__presentViewController___block_invoke_32;
        v58[3] = &unk_1E6DF4F90;
        objc_copyWeak(&v60, location);
        v58[4] = self;
        id v59 = v53;
        [v20 transferPlaybackToBackgroundMediaController:v58];

        uint64_t v21 = &v60;
LABEL_18:
        objc_destroyWeak(v21);
        objc_destroyWeak(location);
        goto LABEL_19;
      }
    }
    else
    {
    }
    v22 = VUIDefaultLogObject();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1E2BD7000, v22, OS_LOG_TYPE_DEFAULT, "VUIActionPlaylist:: Dismissing playback due to catch up to live", (uint8_t *)location, 2u);
    }

    objc_initWeak(location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __44__VUIActionPlaylist__presentViewController___block_invoke_34;
    aBlock[3] = &unk_1E6DF43D0;
    objc_copyWeak(&v57, location);
    id v55 = v9;
    id v56 = v53;
    uint64_t v23 = (void (**)(void))_Block_copy(aBlock);
    v24 = +[VUIPlaybackManager sharedInstance];
    int v25 = [v24 isFullscreenPlaybackUIBeingShown];

    if (v25)
    {
      id v26 = +[VUIPlaybackManager sharedInstance];
      [v26 dismissPlaybackAnimated:1 leaveGroupActivitySession:1 completion:v23];
    }
    else
    {
      v23[2](v23);
    }

    uint64_t v21 = &v57;
    goto LABEL_18;
  }
  id v27 = VUIDefaultLogObject();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(location[0]) = 0;
    _os_log_impl(&dword_1E2BD7000, v27, OS_LOG_TYPE_DEFAULT, "VUIActionPlaylist:: no clip items, so assuming standard playlist", (uint8_t *)location, 2u);
  }

  v28 = [(VUIActionPlaylist *)self _ratingDomain];
  int v29 = [v28 isEqualToString:*MEMORY[0x1E4FA9E58]];

  v51 = v6;
  if (v29)
  {
    id v30 = +[VUISettingsManager sharedInstance];
    uint64_t v48 = [v30 maxMovieRank];

    v52 = [(VUIActionPlaylist *)self _maxContentRating];
  }
  else
  {
    v31 = [(VUIActionPlaylist *)self _ratingDomain];
    int v32 = [v31 isEqualToString:*MEMORY[0x1E4FA9E50]];

    if (v32)
    {
      [(VUIActionPlaylist *)self _maxContentRating];
      +[VUISettingsManager sharedInstance];
    }
    else
    {
      v33 = +[VUISettingsManager sharedInstance];
      uint64_t v49 = [v33 maxMovieRank];

      +[VUISettingsManager sharedInstance];
    v34 = };
    v52 = [v34 maxTVShowRank];
  }
  v35 = [(VUIActionPlaylist *)self trailerEndpoint];
  uint64_t v36 = [v35 length];

  v37 = +[VUIInterfaceFactory sharedInstance];
  v38 = [v37 documentCreator];
  unint64_t v39 = [(VUIActionPlaylist *)self index];
  if (v36)
  {
    v40 = [(VUIActionPlaylist *)self trailerEndpoint];
    unint64_t v41 = v39;
    v42 = v50;
    [v38 clipsViewControllerWithIndex:v41 trailerEndpoint:v40 maxMovieContentRating:v50 maxTVContentRating:v52];
  }
  else
  {
    v40 = [(VUIActionPlaylist *)self collectionViewModel];
    unint64_t v43 = v39;
    v42 = v50;
    [v38 clipsViewControllerWithIndex:v43 collectionData:v40 maxMovieContentRating:v50 maxTVContentRating:v52];
  v44 = };

  if (v9 && v44)
  {
    v45 = +[VUIPlaybackManager sharedInstance];
    [v45 dismissPlaybackAnimated:1 leaveGroupActivitySession:1 completion:0];

    v46 = +[VUIPlaybackManager sharedInstance];
    [v46 setBackgroundMediaControllerForPIP:0];

    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __44__VUIActionPlaylist__presentViewController___block_invoke;
    v62[3] = &unk_1E6DF3DD0;
    id v63 = v53;
    [v9 presentViewController:v44 animated:1 completion:v62];

    uint64_t v6 = v51;
  }
  else
  {
    v47 = VUIDefaultLogObject();
    uint64_t v6 = v51;
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      -[VUIActionPlaylist _presentViewController:](v47);
    }

    if (v53) {
      (*((void (**)(id, void))v53 + 2))(v53, 0);
    }
  }

LABEL_19:
}

uint64_t __44__VUIActionPlaylist__presentViewController___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

void __44__VUIActionPlaylist__presentViewController___block_invoke_32(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v6 = (id *)(a1 + 48);
  id v7 = a4;
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  uint64_t v18 = [v7 currentMediaItem];
  v9 = [[VUIMediaInfo alloc] initWithPlaybackContext:8 storeAuxMediaItem:v18];
  uint64_t v10 = +[VUIInterfaceFactory sharedInstance];
  v11 = [v10 documentCreator];
  uint64_t v12 = [WeakRetained index];
  uint64_t v13 = [*(id *)(a1 + 32) clipItems];
  id v14 = [*(id *)(a1 + 32) metadataViewModels];
  id v15 = [*(id *)(a1 + 32) nextToken];
  id v16 = [v11 catchUpToLiveViewControllerWithIndex:v12 mediaInfo:v9 segments:v13 metadataViewModels:v14 nextToken:v15];

  [v8 embedCatchUpToLiveViewController:v16 reusingFullscreenPlaybackWithPlayer:v7];
  uint64_t v17 = *(void *)(a1 + 40);
  if (v17) {
    (*(void (**)(uint64_t, uint64_t))(v17 + 16))(v17, 1);
  }
}

void __44__VUIActionPlaylist__presentViewController___block_invoke_34(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = +[VUIPlaybackManager sharedInstance];
  [v3 setBackgroundMediaControllerForPIP:0];

  v4 = [WeakRetained videosPlayable];
  int v5 = [v4 firstObject];

  uint64_t v6 = +[VUIInterfaceFactory sharedInstance];
  id v7 = [v6 documentCreator];
  uint64_t v8 = [WeakRetained index];
  v9 = [WeakRetained clipItems];
  uint64_t v10 = [WeakRetained metadataViewModels];
  v11 = [WeakRetained nextToken];
  uint64_t v12 = [v7 catchUpToLiveViewControllerWithIndex:v8 playable:v5 segments:v9 metadataViewModels:v10 nextToken:v11];

  uint64_t v13 = +[VUIInterfaceFactory sharedInstance];
  id v14 = [v13 documentCreator];
  id v15 = [v14 playbackContainerViewController];

  id v16 = [v15 vuiView];
  uint64_t v17 = [MEMORY[0x1E4FB1618] blackColor];
  [v16 setBackgroundColor:v17];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __44__VUIActionPlaylist__presentViewController___block_invoke_2;
  v21[3] = &unk_1E6DF4510;
  id v22 = v15;
  id v23 = v12;
  uint64_t v18 = *(void **)(a1 + 32);
  id v24 = *(id *)(a1 + 40);
  id v19 = v12;
  id v20 = v15;
  [v18 presentViewController:v20 animated:1 completion:v21];
}

uint64_t __44__VUIActionPlaylist__presentViewController___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) embedCatchUpToLiveViewController:*(void *)(a1 + 40)];
  v2 = [*(id *)(a1 + 32) vuiView];
  v3 = [MEMORY[0x1E4FB1618] clearColor];
  [v2 setBackgroundColor:v3];

  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    int v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (NSDictionary)contextData
{
  return self->_contextData;
}

- (void)setContextData:(id)a3
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

- (NSArray)videosPlayable
{
  return self->_videosPlayable;
}

- (void)setVideosPlayable:(id)a3
{
}

- (unint64_t)index
{
  return self->_index;
}

- (NSDictionary)collectionViewModel
{
  return self->_collectionViewModel;
}

- (void)setCollectionViewModel:(id)a3
{
}

- (NSArray)clipItems
{
  return self->_clipItems;
}

- (void)setClipItems:(id)a3
{
}

- (NSArray)metadataViewModels
{
  return self->_metadataViewModels;
}

- (void)setMetadataViewModels:(id)a3
{
}

- (BOOL)requiresAuthentication
{
  return self->_requiresAuthentication;
}

- (NSString)nextToken
{
  return self->_nextToken;
}

- (NSString)trailerEndpoint
{
  return self->_trailerEndpoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailerEndpoint, 0);
  objc_storeStrong((id *)&self->_nextToken, 0);
  objc_storeStrong((id *)&self->_metadataViewModels, 0);
  objc_storeStrong((id *)&self->_clipItems, 0);
  objc_storeStrong((id *)&self->_collectionViewModel, 0);
  objc_storeStrong((id *)&self->_videosPlayable, 0);
  objc_destroyWeak((id *)&self->_appContext);
  objc_storeStrong((id *)&self->_contextData, 0);
}

- (void)_presentViewController:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_ERROR, "VUIActionPlaylist:: not presenting because presenting view controlller or docuemnt is missing", v1, 2u);
}

@end