@interface RENowPlayingRelevanceProviderManager
+ (Class)_relevanceProviderClass;
+ (id)_features;
- (MPRequestResponseController)requestResponseController;
- (RENowPlayingRelevanceProviderManager)initWithQueue:(id)a3;
- (id)_valueForProvider:(id)a3 feature:(id)a4;
- (int64_t)playbackState;
- (unint64_t)state;
- (void)_updateActiveRoute;
- (void)_updatePlaybackState;
- (void)controller:(id)a3 defersResponseReplacement:(id)a4;
- (void)pause;
- (void)resume;
@end

@implementation RENowPlayingRelevanceProviderManager

+ (id)_features
{
  v7[3] = *MEMORY[0x263EF8340];
  v2 = +[REFeature nowPlayingStateFeature];
  v3 = +[REFeature currentlyPlayingMediaDonationFeature];
  v7[1] = v3;
  v4 = +[REFeature currentlyPlayingFromAppFeature];
  v7[2] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:3];

  return v5;
}

- (RENowPlayingRelevanceProviderManager)initWithQueue:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RENowPlayingRelevanceProviderManager;
  v5 = [(RERelevanceProviderManager *)&v11 initWithQueue:v4];
  if (v5)
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2050000000;
    v6 = (void *)getMPRequestResponseControllerClass_softClass;
    uint64_t v16 = getMPRequestResponseControllerClass_softClass;
    if (!getMPRequestResponseControllerClass_softClass)
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __getMPRequestResponseControllerClass_block_invoke;
      v12[3] = &unk_2644BC768;
      v12[4] = &v13;
      __getMPRequestResponseControllerClass_block_invoke((uint64_t)v12);
      v6 = (void *)v14[3];
    }
    v7 = v6;
    _Block_object_dispose(&v13, 8);
    v8 = (MPRequestResponseController *)objc_alloc_init(v7);
    requestResponseController = v5->_requestResponseController;
    v5->_requestResponseController = v8;

    [(MPRequestResponseController *)v5->_requestResponseController setDelegate:v5];
  }

  return v5;
}

+ (Class)_relevanceProviderClass
{
  return (Class)objc_opt_class();
}

- (id)_valueForProvider:(id)a3 feature:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  v9 = +[REFeature nowPlayingStateFeature];
  int v10 = [v7 isEqual:v9];

  if (v10)
  {
    BOOL v11 = [v8 state] == self->_state;
LABEL_37:
    v33 = +[REFeatureValue featureValueWithBool:v11];
    goto LABEL_38;
  }
  v12 = +[REFeature currentlyPlayingFromAppFeature];
  int v13 = [v7 isEqual:v12];

  if (!v13)
  {
    if (self->_state != 1
      || ([v8 bundleIdentifier],
          v20 = objc_claimAutoreleasedReturnValue(),
          v20,
          !v20))
    {
      uint64_t v31 = 0;
LABEL_36:
      BOOL v11 = v31;
      goto LABEL_37;
    }
    v21 = [(MPRequestResponseController *)self->_requestResponseController response];
    v22 = [v21 playerPath];
    v23 = [v22 representedBundleID];

    v24 = [v8 bundleIdentifier];
    LODWORD(v22) = [v23 isEqualToString:v24];

    if (!v22)
    {
      uint64_t v31 = 0;
LABEL_35:

      goto LABEL_36;
    }
    id v25 = [v8 itemIdentifer];
    if (!v25)
    {
      uint64_t v31 = 1;
LABEL_34:

      goto LABEL_35;
    }
    v26 = [(MPRequestResponseController *)self->_requestResponseController response];
    v63 = [v26 tracklist];
    v64 = [v63 playingItem];
    v27 = [v64 metadataObject];
    v28 = [v27 song];
    id v29 = [v28 title];
    if (v25 == v29)
    {
      uint64_t v31 = 1;
      v34 = v25;
      v32 = v63;
LABEL_32:

      goto LABEL_33;
    }
    v62 = v26;
    char v30 = [v25 isEqual:v29];

    if (v30)
    {
      uint64_t v31 = 1;
      v26 = v62;
      v32 = v63;
LABEL_33:

      goto LABEL_34;
    }
    v61 = [(MPRequestResponseController *)self->_requestResponseController response];
    v35 = [v61 tracklist];
    v59 = [v35 playingItem];
    v58 = [v59 metadataObject];
    v57 = [v58 song];
    id v36 = [v57 album];
    v60 = v35;
    id v56 = v36;
    if (v25 == v36)
    {
      uint64_t v31 = 1;
      v40 = v25;
      v26 = v62;
      v32 = v63;
    }
    else
    {
      v55 = v27;
      v37 = v36;
      char v38 = [v25 isEqual:v36];

      if (v38)
      {
        uint64_t v31 = 1;
        v26 = v62;
        v32 = v63;
        v27 = v55;
        v39 = v56;
LABEL_31:

        v34 = v61;
        goto LABEL_32;
      }
      v54 = [(MPRequestResponseController *)self->_requestResponseController response];
      v41 = [v54 tracklist];
      v42 = [v41 playingItem];
      v43 = [v42 metadataObject];
      v44 = [v43 song];
      v49 = [v44 artist];
      id v45 = [v49 name];
      v52 = v42;
      v53 = v41;
      v50 = v44;
      v51 = v43;
      if (v25 == v45)
      {
        uint64_t v31 = 1;
      }
      else
      {
        v46 = v45;
        uint64_t v47 = [v25 isEqual:v45];
        id v45 = v46;
        uint64_t v31 = v47;
      }
      v26 = v62;
      v32 = v63;
      v27 = v55;

      v40 = v54;
    }

    v39 = v56;
    goto LABEL_31;
  }
  v14 = [(MPRequestResponseController *)self->_requestResponseController response];
  uint64_t v15 = [v14 playerPath];
  uint64_t v16 = [v15 representedBundleID];

  if (self->_state == 1)
  {
    v17 = [v8 bundleIdentifier];
    if (v17)
    {
      v18 = [v8 bundleIdentifier];
      uint64_t v19 = [v16 isEqualToString:v18];
    }
    else
    {
      uint64_t v19 = 0;
    }
  }
  else
  {
    uint64_t v19 = 0;
  }
  v33 = +[REFeatureValue featureValueWithBool:v19];

LABEL_38:
  return v33;
}

- (void)resume
{
  [(MPRequestResponseController *)self->_requestResponseController beginAutomaticResponseLoading];
  if (MediaPlayerLibraryCore())
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    id v4 = getMPAVRoutingControllerActiveSystemRouteDidChangeNotification();
    [v3 addObserver:self selector:sel__handleRoutingControllerActiveSystemRouteDidChange_ name:v4 object:0];
  }
  [(RENowPlayingRelevanceProviderManager *)self _updateActiveRoute];
}

- (void)pause
{
  [(MPRequestResponseController *)self->_requestResponseController endAutomaticResponseLoading];
  if (MediaPlayerLibraryCore())
  {
    id v4 = [MEMORY[0x263F08A00] defaultCenter];
    v3 = getMPAVRoutingControllerActiveSystemRouteDidChangeNotification();
    [v4 removeObserver:self name:v3 object:0];
  }
}

- (void)_updatePlaybackState
{
  [(RERelevanceProviderManager *)self beginFetchingData];
  v3 = [(MPRequestResponseController *)self->_requestResponseController response];
  self->_playbackState = [v3 state];

  unint64_t v4 = self->_playbackState - 1;
  if (v4 <= 5 && ((0x2Bu >> v4) & 1) != 0) {
    self->_state = qword_21E7E9FD0[v4];
  }
  [(RERelevanceProviderManager *)self finishFetchingData];
  id v5 = +[RERelevanceProviderManagerUpdate immediateUpdateForAllProviders];
  [(RERelevanceProviderManager *)self _scheduleUpdate:v5];
}

- (void)_updateActiveRoute
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2050000000;
  v3 = (void *)getMPAVRoutingControllerClass_softClass;
  uint64_t v10 = getMPAVRoutingControllerClass_softClass;
  if (!getMPAVRoutingControllerClass_softClass)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __getMPAVRoutingControllerClass_block_invoke;
    v6[3] = &unk_2644BC768;
    v6[4] = &v7;
    __getMPAVRoutingControllerClass_block_invoke((uint64_t)v6);
    v3 = (void *)v8[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v7, 8);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__RENowPlayingRelevanceProviderManager__updateActiveRoute__block_invoke;
  v5[3] = &unk_2644BEF60;
  v5[4] = self;
  [v4 getProactiveRouteWithCompletion:v5];
}

void __58__RENowPlayingRelevanceProviderManager__updateActiveRoute__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__RENowPlayingRelevanceProviderManager__updateActiveRoute__block_invoke_2;
  v6[3] = &unk_2644BC688;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __58__RENowPlayingRelevanceProviderManager__updateActiveRoute__block_invoke_2(uint64_t a1)
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2050000000;
  v2 = (void *)getMPCPlayerRequestClass_softClass;
  uint64_t v16 = getMPCPlayerRequestClass_softClass;
  if (!getMPCPlayerRequestClass_softClass)
  {
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    uint64_t v10 = __getMPCPlayerRequestClass_block_invoke;
    BOOL v11 = &unk_2644BC768;
    v12 = &v13;
    __getMPCPlayerRequestClass_block_invoke((uint64_t)&v8);
    v2 = (void *)v14[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v13, 8);
  id v4 = objc_alloc_init(v3);
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2050000000;
  id v5 = (void *)getMPCPlayerPathClass_softClass;
  uint64_t v16 = getMPCPlayerPathClass_softClass;
  if (!getMPCPlayerPathClass_softClass)
  {
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    uint64_t v10 = __getMPCPlayerPathClass_block_invoke;
    BOOL v11 = &unk_2644BC768;
    v12 = &v13;
    __getMPCPlayerPathClass_block_invoke((uint64_t)&v8);
    id v5 = (void *)v14[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v13, 8);
  id v7 = [v6 pathWithRoute:*(void *)(a1 + 32) bundleID:0 playerID:0];
  [v4 setPlayerPath:v7];

  [*(id *)(*(void *)(a1 + 40) + 112) setRequest:v4];
}

- (void)controller:(id)a3 defersResponseReplacement:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __77__RENowPlayingRelevanceProviderManager_controller_defersResponseReplacement___block_invoke;
  v7[3] = &unk_2644BCCD0;
  void v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __77__RENowPlayingRelevanceProviderManager_controller_defersResponseReplacement___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);
  return [v2 _updatePlaybackState];
}

- (unint64_t)state
{
  return self->_state;
}

- (int64_t)playbackState
{
  return self->_playbackState;
}

- (MPRequestResponseController)requestResponseController
{
  return self->_requestResponseController;
}

- (void).cxx_destruct
{
}

@end