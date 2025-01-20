@interface TVRUINowPlayingController
+ (TVRUINowPlayingController)controllerWithHostingViewController:(id)a3;
- (BOOL)_nowPlayingViewControllerIsPresented;
- (BOOL)_shouldResetNowPlayingInfoTabSelection;
- (BOOL)_upNextViewControllerIsPresented;
- (BOOL)capellaInfoAvailable;
- (BOOL)isPad;
- (BOOL)isReadyForPresentationWithNowPlayingInfo:(id)a3;
- (BOOL)showsCastTab;
- (NSDate)lastPresentedNowPlaying;
- (NSString)canonicalIDOfCurrentUTSRequest;
- (TVRCMediaInfo)cachedMediaInfo;
- (TVRCNowPlayingInfo)nowPlayingInfo;
- (TVRUIDevice)device;
- (TVRUINowPlayingController)initWithHostingViewController:(id)a3;
- (TVRUINowPlayingViewController)nowPlayingViewController;
- (TVRUIUpNextController)upNextController;
- (UINavigationController)nowPlayingNavController;
- (UINavigationController)upNextNavController;
- (UIViewController)hostingViewController;
- (double)bottomSpacingRequired;
- (id)_activeNavController;
- (id)actionButtonMenu;
- (id)capellaInfoDidChangeHandler;
- (id)commandHandler;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (int64_t)viewServiceLaunchContext;
- (unint64_t)_layoutStyleForViewServiceLaunchContext:(int64_t)a3;
- (unint64_t)currentModalContext;
- (void)_dismissNowPlayingViewController;
- (void)_dismissNowPlayingViewControllerAnimated:(BOOL)a3;
- (void)_dismissUpNextViewControllerAnimated:(BOOL)a3;
- (void)_invokeCommandHandlerWithCommand:(unint64_t)a3;
- (void)_invokeCommandHandlerWithCommand:(unint64_t)a3 paramDict:(id)a4;
- (void)_openURL:(id)a3 usingSafariViewController:(BOOL)a4;
- (void)_presentNowPlayingAnimated:(BOOL)a3;
- (void)_presentUpNext;
- (void)_presentUpNextAnimated:(BOOL)a3;
- (void)_presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_refreshUpNextInfosIfNeeded;
- (void)_updateNowPlayingUIWithNowPlayingInfo:(id)a3;
- (void)dismissModalUI;
- (void)displayUpNext;
- (void)infoButtonWasTapped;
- (void)openURL:(id)a3;
- (void)presentMediaWithID:(id)a3 title:(id)a4 presentingViewController:(id)a5;
- (void)presentModalContext:(unint64_t)a3 animated:(BOOL)a4;
- (void)presentPersonWithID:(id)a3 name:(id)a4 presentingViewController:(id)a5;
- (void)setCachedMediaInfo:(id)a3;
- (void)setCanonicalIDOfCurrentUTSRequest:(id)a3;
- (void)setCapellaInfoDidChangeHandler:(id)a3;
- (void)setCommandHandler:(id)a3;
- (void)setDevice:(id)a3;
- (void)setLastPresentedNowPlaying:(id)a3;
- (void)setNowPlayingInfo:(id)a3;
- (void)setNowPlayingNavController:(id)a3;
- (void)setNowPlayingViewController:(id)a3;
- (void)setShowsCastTab:(BOOL)a3;
- (void)setUpNextController:(id)a3;
- (void)setUpNextNavController:(id)a3;
- (void)setViewServiceLaunchContext:(int64_t)a3;
- (void)shareItem:(id)a3 presentingViewController:(id)a4 sourceView:(id)a5;
- (void)webSearch:(id)a3;
@end

@implementation TVRUINowPlayingController

+ (TVRUINowPlayingController)controllerWithHostingViewController:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithHostingViewController:v4];

  return (TVRUINowPlayingController *)v5;
}

- (TVRUINowPlayingController)initWithHostingViewController:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TVRUINowPlayingController;
  v6 = [(TVRUINowPlayingController *)&v15 init];
  if (v6)
  {
    v7 = [v5 traitCollection];
    v6->_isPad = [v7 userInterfaceIdiom] == 1;

    v8 = objc_alloc_init(TVRUIUpNextController);
    upNextController = v6->_upNextController;
    v6->_upNextController = v8;

    objc_storeStrong((id *)&v6->_hostingViewController, a3);
    v10 = objc_alloc_init(TVRUINowPlayingViewController);
    [(TVRUINowPlayingController *)v6 setNowPlayingViewController:v10];

    v11 = v6->_upNextController;
    v12 = [(TVRUINowPlayingController *)v6 nowPlayingViewController];
    [v12 setUpNextProvider:v11];

    v13 = [(TVRUINowPlayingController *)v6 nowPlayingViewController];
    [v13 setActionProvider:v6];
  }
  return v6;
}

- (double)bottomSpacingRequired
{
  return 0.0;
}

- (BOOL)capellaInfoAvailable
{
  v2 = self;
  v3 = [(TVRUINowPlayingController *)self nowPlayingInfo];
  LOBYTE(v2) = [(TVRUINowPlayingController *)v2 isReadyForPresentationWithNowPlayingInfo:v3];

  return (char)v2;
}

- (void)setNowPlayingInfo:(id)a3
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "tvrui_isSimplePlaybackRateUpdate"))
    {
      v7 = _TVRUINowPlayingLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = [v6 playbackRate];
        *(_DWORD *)buf = 138412290;
        v59 = v8;
        _os_log_impl(&dword_227326000, v7, OS_LOG_TYPE_INFO, "Updating playbackRate to %@", buf, 0xCu);
      }
      v9 = [v6 playbackRate];
      [(TVRCNowPlayingInfo *)self->_nowPlayingInfo setPlaybackRate:v9];
    }
    else if (objc_msgSend(v6, "tvrui_isSimplePlaybackStateUpdate"))
    {
      v11 = _TVRUINowPlayingLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = [v6 playbackState];
        *(_DWORD *)buf = 138412290;
        v59 = v12;
        _os_log_impl(&dword_227326000, v11, OS_LOG_TYPE_INFO, "Updating playbackState to %@", buf, 0xCu);
      }
      v13 = [v6 playbackState];
      [(TVRCNowPlayingInfo *)self->_nowPlayingInfo setPlaybackState:v13];
    }
    else if (objc_msgSend(v6, "tvrui_isSimpleCaptionStateUpdate"))
    {
      v14 = _TVRUINowPlayingLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        objc_super v15 = [v6 captionsEnabled];
        v16 = [v6 hasValidCaptionOptions];
        *(_DWORD *)buf = 138412546;
        v59 = v15;
        __int16 v60 = 2112;
        v61 = v16;
        _os_log_impl(&dword_227326000, v14, OS_LOG_TYPE_INFO, "Updating captionsEnabled to %@; hasValidCaptionsOptoins to %@",
          buf,
          0x16u);
      }
      v17 = [v6 captionsEnabled];
      [(TVRCNowPlayingInfo *)self->_nowPlayingInfo setCaptionsEnabled:v17];

      v18 = [v6 hasValidCaptionOptions];
      [(TVRCNowPlayingInfo *)self->_nowPlayingInfo setHasValidCaptionOptions:v18];
    }
    else
    {
      v19 = [v6 identifier];
      p_nowPlayingInfo = &self->_nowPlayingInfo;
      v21 = [(TVRCNowPlayingInfo *)self->_nowPlayingInfo identifier];
      char v22 = [v19 isEqualToString:v21];

      if (v22)
      {
        uint64_t v23 = [(TVRCNowPlayingInfo *)*p_nowPlayingInfo nowPlayingInfoMergedWithNowPlayingInfo:v6];
        v24 = *p_nowPlayingInfo;
        *p_nowPlayingInfo = (TVRCNowPlayingInfo *)v23;

        v25 = _TVRUINowPlayingLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          v26 = [(TVRCNowPlayingInfo *)*p_nowPlayingInfo metadata];
          v27 = [v26 canonicalID];
          *(_DWORD *)buf = 138412290;
          v59 = v27;
          _os_log_impl(&dword_227326000, v25, OS_LOG_TYPE_INFO, "Updating nowPlayingInfo (identifiers remained the same; merging info) for canonicalID=%@",
            buf,
            0xCu);
        }
      }
      else
      {
        v28 = _TVRUINowPlayingLog();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          v29 = [v6 identifier];
          v30 = [(TVRCNowPlayingInfo *)*p_nowPlayingInfo identifier];
          *(_DWORD *)buf = 138412546;
          v59 = v29;
          __int16 v60 = 2112;
          v61 = v30;
          _os_log_impl(&dword_227326000, v28, OS_LOG_TYPE_INFO, "Updating nowPlayingInfo via identified change %@ -> %@", buf, 0x16u);
        }
        v31 = [v6 identifier];
        if ([v31 length])
        {
          v32 = [(TVRCNowPlayingInfo *)*p_nowPlayingInfo identifier];
          BOOL v33 = [v32 length] == 0;

          objc_storeStrong((id *)&self->_nowPlayingInfo, a3);
          if (!v33)
          {
            +[TVRUIUpNextController refreshDelayOnMediaDidChangeTimeInterval];
            dispatch_time_t v35 = dispatch_time(0, (uint64_t)(v34 * 1000000000.0));
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __47__TVRUINowPlayingController_setNowPlayingInfo___block_invoke;
            block[3] = &unk_2647FFF70;
            block[4] = self;
            dispatch_after(v35, MEMORY[0x263EF83A0], block);
          }
        }
        else
        {

          objc_storeStrong((id *)&self->_nowPlayingInfo, a3);
        }
      }
    }
    v36 = objc_msgSend(v6, "tvrui_effectiveCanonicalID");
    v37 = [v6 metadata];
    if (v37)
    {
      v38 = [v6 metadata];
      char v39 = [v38 isMissingCriticalMetadata];

      char v40 = v39 ^ 1;
    }
    else
    {
      char v40 = 1;
    }

    if ([v36 length]) {
      char v41 = v40;
    }
    else {
      char v41 = 1;
    }
    if (v41)
    {
      v42 = [(TVRUINowPlayingController *)self nowPlayingInfo];
      [(TVRUINowPlayingController *)self _updateNowPlayingUIWithNowPlayingInfo:v42];
    }
    else
    {
      v43 = [(TVRUINowPlayingController *)self cachedMediaInfo];
      v44 = [v43 identifier];
      int v45 = [v36 isEqualToString:v44];

      if (v45)
      {
        v46 = [(TVRCNowPlayingInfo *)self->_nowPlayingInfo metadata];
        v47 = [(TVRUINowPlayingController *)self cachedMediaInfo];
        v48 = [v46 metadataMergedFromTVRCMediaInfo:v47];
        [(TVRCNowPlayingInfo *)self->_nowPlayingInfo setMetadata:v48];

        [(TVRUINowPlayingController *)self _updateNowPlayingUIWithNowPlayingInfo:self->_nowPlayingInfo];
      }
      else
      {
        v49 = [(TVRUINowPlayingController *)self canonicalIDOfCurrentUTSRequest];
        int v50 = [v36 isEqualToString:v49];

        v51 = _TVRUINowPlayingLog();
        BOOL v52 = os_log_type_enabled(v51, OS_LOG_TYPE_INFO);
        if (v50)
        {
          if (v52)
          {
            *(_DWORD *)buf = 138412290;
            v59 = v36;
            _os_log_impl(&dword_227326000, v51, OS_LOG_TYPE_INFO, "Already requesting metadata from UTS for canonicalID=%@ ... will not request again.", buf, 0xCu);
          }
        }
        else
        {
          if (v52)
          {
            *(_DWORD *)buf = 138412290;
            v59 = v36;
            _os_log_impl(&dword_227326000, v51, OS_LOG_TYPE_INFO, "Requesting metadata from UTS for canonicalID=%@", buf, 0xCu);
          }

          [(TVRUINowPlayingController *)self setCanonicalIDOfCurrentUTSRequest:v36];
          id v53 = objc_alloc_init(MEMORY[0x263F7CA00]);
          objc_initWeak((id *)buf, self);
          v54[0] = MEMORY[0x263EF8330];
          v54[1] = 3221225472;
          v54[2] = __47__TVRUINowPlayingController_setNowPlayingInfo___block_invoke_4;
          v54[3] = &unk_264801218;
          objc_copyWeak(&v56, (id *)buf);
          v54[4] = self;
          id v55 = v36;
          [v53 requestForCanonicalID:v55 completion:v54];

          objc_destroyWeak(&v56);
          objc_destroyWeak((id *)buf);
        }
      }
    }
  }
  else
  {
    nowPlayingInfo = self->_nowPlayingInfo;
    self->_nowPlayingInfo = 0;
  }
}

void __47__TVRUINowPlayingController_setNowPlayingInfo___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) upNextController];
  [v1 refresh];
}

void __47__TVRUINowPlayingController_setNowPlayingInfo___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setCanonicalIDOfCurrentUTSRequest:0];
    if (v6)
    {
      v9 = _TVRUINowPlayingLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __47__TVRUINowPlayingController_setNowPlayingInfo___block_invoke_4_cold_1((uint64_t)v6, v9);
      }
    }
    else
    {
      v10 = [*(id *)(a1 + 32) nowPlayingInfo];
      v11 = [v10 metadata];
      v12 = [v11 canonicalID];
      v13 = [v5 identifier];
      int v14 = [v12 isEqualToString:v13];

      if (v14)
      {
        [*(id *)(a1 + 32) setCachedMediaInfo:v5];
        objc_super v15 = [*(id *)(a1 + 32) nowPlayingInfo];
        v9 = [v15 metadata];

        v16 = [v9 metadataMergedFromTVRCMediaInfo:v5];
        v17 = [*(id *)(a1 + 32) nowPlayingInfo];
        [v17 setMetadata:v16];

        v18 = *(void **)(a1 + 32);
        v19 = [v18 nowPlayingInfo];
        [v18 _updateNowPlayingUIWithNowPlayingInfo:v19];

        v20 = _TVRUINowPlayingLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          uint64_t v21 = *(void *)(a1 + 40);
          int v23 = 138412290;
          uint64_t v24 = v21;
          _os_log_impl(&dword_227326000, v20, OS_LOG_TYPE_INFO, "Received metadata from UTS for canonicalID=%@", (uint8_t *)&v23, 0xCu);
        }
      }
      else
      {
        v9 = _TVRUINowPlayingLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          uint64_t v22 = *(void *)(a1 + 40);
          int v23 = 138412290;
          uint64_t v24 = v22;
          _os_log_impl(&dword_227326000, v9, OS_LOG_TYPE_INFO, "Received metadata from UTS but request canonicalID=%@ has changed so discarding info", (uint8_t *)&v23, 0xCu);
        }
      }
    }
  }
}

- (unint64_t)currentModalContext
{
  if ([(TVRUINowPlayingController *)self _upNextViewControllerIsPresented]) {
    return 2;
  }
  else {
    return [(TVRUINowPlayingController *)self _nowPlayingViewControllerIsPresented];
  }
}

- (void)shareItem:(id)a3 presentingViewController:(id)a4 sourceView:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v18 = a3;
  v10 = (void *)MEMORY[0x263EFF8C0];
  id v11 = a3;
  v12 = [v10 arrayWithObjects:&v18 count:1];
  id v13 = objc_alloc(MEMORY[0x263F6BC98]);

  int v14 = objc_msgSend(v12, "copy", v18, v19);
  objc_super v15 = (void *)[v13 initWithActivityItems:v14 applicationActivities:0];

  if ([(TVRUINowPlayingController *)self isPad])
  {
    v16 = [v15 popoverPresentationController];
    [v16 setSourceView:v9];
    [v15 setOverrideUserInterfaceStyle:2];
    v17 = [(TVRUINowPlayingController *)self nowPlayingViewController];
    [v17 presentViewController:v15 animated:1 completion:0];
  }
  else
  {
    [v8 presentViewController:v15 animated:1 completion:0];
  }
}

- (void)openURL:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    if ([(TVRUINowPlayingController *)self isPad]) {
      [(TVRUINowPlayingController *)self dismissModalUI];
    }
    [(TVRUINowPlayingController *)self _openURL:v5 usingSafariViewController:0];
    id v4 = v5;
  }
}

- (void)presentPersonWithID:(id)a3 name:(id)a4 presentingViewController:(id)a5
{
  id v11 = a3;
  id v7 = a4;
  id v8 = [(TVRUINowPlayingController *)self _activeNavController];
  if (v8)
  {
    id v9 = objc_alloc_init(TVRUIPersonViewController);
    [(TVRUIPersonViewController *)v9 setActionProvider:self];
    v10 = [(TVRUINowPlayingController *)self upNextController];
    [(TVRUIPersonViewController *)v9 setUpNextProvider:v10];

    [(TVRUIPersonViewController *)v9 setPersonName:v7];
    [(TVRUIPersonViewController *)v9 setPersonID:v11];
    [v8 pushViewController:v9 animated:1];
  }
}

- (void)presentMediaWithID:(id)a3 title:(id)a4 presentingViewController:(id)a5
{
  id v11 = a3;
  id v7 = a4;
  id v8 = [(TVRUINowPlayingController *)self _activeNavController];
  if (v8)
  {
    id v9 = objc_alloc_init(TVRUIMediaViewController);
    [(TVRUIMediaViewController *)v9 setActionProvider:self];
    v10 = [(TVRUINowPlayingController *)self upNextController];
    [(TVRUIMediaViewController *)v9 setUpNextProvider:v10];

    [(TVRUIMediaViewController *)v9 setMediaTitle:v7];
    [(TVRUIMediaViewController *)v9 setMediaIdentifier:v11];
    [v8 pushViewController:v9 animated:1];
  }
}

- (void)webSearch:(id)a3
{
  id v4 = [NSString stringWithFormat:@"https://www.google.com/search?q=%@", a3];
  id v5 = [MEMORY[0x263F08708] URLQueryAllowedCharacterSet];
  id v7 = [v4 stringByAddingPercentEncodingWithAllowedCharacters:v5];

  id v6 = [NSURL URLWithString:v7];
  [(TVRUINowPlayingController *)self _openURL:v6 usingSafariViewController:1];
}

- (void)setDevice:(id)a3
{
  id v7 = (TVRUIDevice *)a3;
  if (self->_device != v7)
  {
    objc_storeStrong((id *)&self->_device, a3);
    id v5 = [(TVRUINowPlayingController *)self nowPlayingViewController];
    [v5 setActiveDevice:v7];

    id v6 = [(TVRUINowPlayingController *)self upNextController];
    [v6 setActiveDevice:v7];
  }
}

- (void)infoButtonWasTapped
{
  if (![(TVRUINowPlayingController *)self _nowPlayingViewControllerIsPresented])
  {
    [(TVRUINowPlayingController *)self _refreshUpNextInfosIfNeeded];
    [(TVRUINowPlayingController *)self _presentNowPlayingAnimated:1];
  }
}

- (void)displayUpNext
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_227326000, log, OS_LOG_TYPE_ERROR, "Could not display Up Next as there was no active device.", v1, 2u);
}

- (void)dismissModalUI
{
  if ([(TVRUINowPlayingController *)self _nowPlayingViewControllerIsPresented])
  {
    [(TVRUINowPlayingController *)self _dismissNowPlayingViewControllerAnimated:0];
  }
  else if ([(TVRUINowPlayingController *)self _upNextViewControllerIsPresented])
  {
    [(TVRUINowPlayingController *)self _dismissUpNextViewControllerAnimated:0];
  }
}

- (BOOL)_nowPlayingViewControllerIsPresented
{
  v2 = [(TVRUINowPlayingController *)self nowPlayingNavController];
  v3 = [v2 view];
  id v4 = [v3 superview];
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)_upNextViewControllerIsPresented
{
  v2 = [(TVRUINowPlayingController *)self upNextNavController];
  v3 = [v2 view];
  id v4 = [v3 superview];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)_updateNowPlayingUIWithNowPlayingInfo:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TVRUINowPlayingController *)self nowPlayingViewController];
  [v5 setNowPlayingInfo:v4];

  id v6 = [(TVRUINowPlayingController *)self capellaInfoDidChangeHandler];

  if (v6)
  {
    id v7 = [(TVRUINowPlayingController *)self capellaInfoDidChangeHandler];
    v7[2](v7, [(TVRUINowPlayingController *)self capellaInfoAvailable]);
  }
}

- (void)setCommandHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)[v4 copy];
  id commandHandler = self->_commandHandler;
  self->_id commandHandler = v5;

  id v7 = [(TVRUINowPlayingController *)self nowPlayingViewController];
  [v7 setCommandHandler:v4];
}

- (id)actionButtonMenu
{
  v45[3] = *MEMORY[0x263EF8340];
  if (+[TVRUIFeatures replaceMuteButtonWithContextMenu])
  {
    objc_initWeak(&location, self);
    v3 = (void *)MEMORY[0x263F823D0];
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v5 = [v4 localizedStringForKey:@"TVRemoteUIMute" value:&stru_26DB4CAE0 table:@"Localizable"];
    id v6 = [MEMORY[0x263F827E8] systemImageNamed:@"speaker.slash"];
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __45__TVRUINowPlayingController_actionButtonMenu__block_invoke;
    v40[3] = &unk_264800190;
    objc_copyWeak(&v41, &location);
    BOOL v33 = [v3 actionWithTitle:v5 image:v6 identifier:0 handler:v40];

    id v7 = [(TVRUINowPlayingController *)self device];
    LOBYTE(v3) = [v7 supportsMute];

    if ((v3 & 1) == 0) {
      [v33 setAttributes:1];
    }
    id v8 = (void *)MEMORY[0x263F823D0];
    id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v10 = [v9 localizedStringForKey:@"TVRemoteUIControlCenter" value:&stru_26DB4CAE0 table:@"Localizable"];
    id v11 = [MEMORY[0x263F827E8] systemImageNamed:@"switch.2"];
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __45__TVRUINowPlayingController_actionButtonMenu__block_invoke_2;
    v38[3] = &unk_264800190;
    objc_copyWeak(&v39, &location);
    v32 = [v8 actionWithTitle:v10 image:v11 identifier:0 handler:v38];

    v12 = (void *)MEMORY[0x263F823D0];
    id v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    int v14 = [v13 localizedStringForKey:@"TVRemoteUISearch" value:&stru_26DB4CAE0 table:@"Localizable"];
    objc_super v15 = [MEMORY[0x263F827E8] systemImageNamed:@"magnifyingglass"];
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __45__TVRUINowPlayingController_actionButtonMenu__block_invoke_3;
    v36[3] = &unk_264800190;
    objc_copyWeak(&v37, &location);
    v16 = [v12 actionWithTitle:v14 image:v15 identifier:0 handler:v36];

    if ([MEMORY[0x263F7C9A8] testarossaEnabled])
    {
      v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      [v17 localizedStringForKey:@"TVRemoteUIOpenUpNext" value:&stru_26DB4CAE0 table:@"Localizable"];
    }
    else
    {
      v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      [v17 localizedStringForKey:@"TVRemoteUIOpenUpNextDeprecated" value:&stru_26DB4CAE0 table:@"Localizable"];
    uint64_t v19 = };

    v20 = (void *)MEMORY[0x263F823D0];
    uint64_t v21 = [MEMORY[0x263F827E8] systemImageNamed:@"list.bullet"];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __45__TVRUINowPlayingController_actionButtonMenu__block_invoke_4;
    v34[3] = &unk_264800190;
    objc_copyWeak(&v35, &location);
    uint64_t v22 = [v20 actionWithTitle:v19 image:v21 identifier:0 handler:v34];

    int v23 = (void *)MEMORY[0x263F82940];
    v45[0] = v33;
    v45[1] = v32;
    v45[2] = v16;
    uint64_t v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:3];
    uint64_t v25 = [v23 menuWithTitle:&stru_26DB4CAE0 image:0 identifier:0 options:1 children:v24];

    [v25 setPreferredElementSize:1];
    v26 = (void *)MEMORY[0x263F82940];
    v44 = v22;
    v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v44 count:1];
    v28 = [v26 menuWithTitle:&stru_26DB4CAE0 image:0 identifier:0 options:1 children:v27];

    v29 = (void *)MEMORY[0x263F82940];
    v43[0] = v25;
    v43[1] = v28;
    v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:2];
    id v18 = [v29 menuWithChildren:v30];

    objc_destroyWeak(&v35);
    objc_destroyWeak(&v37);

    objc_destroyWeak(&v39);
    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }
  else
  {
    id v18 = 0;
  }
  return v18;
}

void __45__TVRUINowPlayingController_actionButtonMenu__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invokeCommandHandlerWithCommand:10];
}

void __45__TVRUINowPlayingController_actionButtonMenu__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invokeCommandHandlerWithCommand:11];
}

void __45__TVRUINowPlayingController_actionButtonMenu__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invokeCommandHandlerWithCommand:14];
}

void __45__TVRUINowPlayingController_actionButtonMenu__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _presentUpNext];
}

- (UINavigationController)nowPlayingNavController
{
  nowPlayingNavController = self->_nowPlayingNavController;
  if (!nowPlayingNavController)
  {
    id v4 = objc_alloc(MEMORY[0x263F829B8]);
    BOOL v5 = [(TVRUINowPlayingController *)self nowPlayingViewController];
    id v6 = (UINavigationController *)[v4 initWithRootViewController:v5];
    id v7 = self->_nowPlayingNavController;
    self->_nowPlayingNavController = v6;

    if ([(TVRUINowPlayingController *)self isPad])
    {
      objc_initWeak(&location, self);
      id v8 = objc_alloc(MEMORY[0x263F824A8]);
      id v9 = (void *)MEMORY[0x263F823D0];
      uint64_t v14 = MEMORY[0x263EF8330];
      uint64_t v15 = 3221225472;
      v16 = __52__TVRUINowPlayingController_nowPlayingNavController__block_invoke;
      v17 = &unk_264800190;
      objc_copyWeak(&v18, &location);
      v10 = [v9 actionWithHandler:&v14];
      id v11 = objc_msgSend(v8, "initWithBarButtonSystemItem:primaryAction:", 0, v10, v14, v15, v16, v17);

      v12 = [(TVRUINowPlayingViewController *)self->_nowPlayingViewController navigationItem];
      [v12 setRightBarButtonItem:v11];

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    [(UINavigationController *)self->_nowPlayingNavController setOverrideUserInterfaceStyle:2];
    nowPlayingNavController = self->_nowPlayingNavController;
  }
  return nowPlayingNavController;
}

void __52__TVRUINowPlayingController_nowPlayingNavController__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained nowPlayingNavController];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

- (UINavigationController)upNextNavController
{
  upNextNavController = self->_upNextNavController;
  if (!upNextNavController)
  {
    id v4 = objc_alloc_init(TVRUIUpNextViewController);
    [(TVRUIUpNextViewController *)v4 setMode:1];
    BOOL v5 = [(TVRUINowPlayingController *)self upNextController];
    [(TVRUIUpNextViewController *)v4 setUpNextProvider:v5];

    [(TVRUIUpNextViewController *)v4 setActionProvider:self];
    id v6 = (UINavigationController *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v4];
    id v7 = self->_upNextNavController;
    self->_upNextNavController = v6;

    [(UINavigationController *)self->_upNextNavController setOverrideUserInterfaceStyle:2];
    upNextNavController = self->_upNextNavController;
  }
  return upNextNavController;
}

- (void)_openURL:(id)a3 usingSafariViewController:(BOOL)a4
{
  BOOL v4 = a4;
  v11[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (!v4)
  {
    id v7 = objc_alloc_init(MEMORY[0x263F018D8]);
    uint64_t v10 = *MEMORY[0x263F3F5E8];
    v11[0] = MEMORY[0x263EFFA88];
    id v9 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    [v7 setFrontBoardOptions:v9];

    id v8 = [MEMORY[0x263F01880] defaultWorkspace];
    [v8 openURL:v6 configuration:v7 completionHandler:&__block_literal_global_19];
    goto LABEL_5;
  }
  id v7 = [(TVRUINowPlayingController *)self _activeNavController];
  if (v7)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x263F16980]) initWithURL:v6];
    [v7 presentViewController:v8 animated:1 completion:0];
LABEL_5:
  }
}

void __64__TVRUINowPlayingController__openURL_usingSafariViewController___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3)
  {
    BOOL v4 = _TVRUINowPlayingLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __64__TVRUINowPlayingController__openURL_usingSafariViewController___block_invoke_cold_1((uint64_t)v3, v4);
    }
  }
}

- (void)_refreshUpNextInfosIfNeeded
{
  id v3 = [(TVRUINowPlayingController *)self upNextController];
  BOOL v4 = [v3 infos];
  uint64_t v5 = [v4 count];

  if (!v5)
  {
    id v6 = [(TVRUINowPlayingController *)self upNextController];
    [v6 refresh];
  }
}

- (void)_invokeCommandHandlerWithCommand:(unint64_t)a3
{
}

- (void)_invokeCommandHandlerWithCommand:(unint64_t)a3 paramDict:(id)a4
{
  id v9 = a4;
  id v6 = [(TVRUINowPlayingController *)self commandHandler];

  if (v6)
  {
    id v7 = [(TVRUINowPlayingController *)self commandHandler];
    if (v9) {
      id v8 = v9;
    }
    else {
      id v8 = (id)MEMORY[0x263EFFA78];
    }
    ((void (**)(void, unint64_t, id))v7)[2](v7, a3, v8);
  }
}

- (BOOL)isReadyForPresentationWithNowPlayingInfo:(id)a3
{
  id v3 = a3;
  int v4 = objc_msgSend(v3, "tvrui_hasMetadata");
  if (objc_msgSend(v3, "tvrui_hasArtworkImage"))
  {
    BOOL v5 = 0;
  }
  else
  {
    id v6 = [v3 metadata];
    id v7 = [v6 imageURLTemplate];
    BOOL v5 = [v7 length] == 0;
  }
  char v8 = objc_msgSend(v3, "tvrui_mediaIsStopped");
  id v9 = objc_msgSend(v3, "tvrui_effectiveCanonicalID");
  uint64_t v10 = [v9 length];

  BOOL v11 = (v10 != 0) & ~v8;
  if (v5) {
    BOOL v11 = 0;
  }
  if (v4) {
    BOOL v12 = v11;
  }
  else {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)presentModalContext:(unint64_t)a3 animated:(BOOL)a4
{
  if (a3 == 1)
  {
    [(TVRUINowPlayingController *)self _presentNowPlayingAnimated:a4];
  }
  else if (a3 == 2)
  {
    [(TVRUINowPlayingController *)self _presentUpNextAnimated:a4];
  }
}

- (void)_presentNowPlayingAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(TVRUINowPlayingController *)self _shouldResetNowPlayingInfoTabSelection])
  {
    BOOL v5 = [(TVRUINowPlayingController *)self nowPlayingViewController];
    [v5 resetTabSelection];
  }
  id v6 = [MEMORY[0x263EFF910] now];
  [(TVRUINowPlayingController *)self setLastPresentedNowPlaying:v6];

  id v7 = [(TVRUINowPlayingController *)self nowPlayingNavController];
  [(TVRUINowPlayingController *)self _presentViewController:v7 animated:v3 completion:0];
}

- (void)_presentUpNext
{
}

- (void)_presentUpNextAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(TVRUINowPlayingController *)self setUpNextNavController:0];
  BOOL v5 = [(TVRUINowPlayingController *)self upNextNavController];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__TVRUINowPlayingController__presentUpNextAnimated___block_invoke;
  v6[3] = &unk_2647FFF70;
  v6[4] = self;
  [(TVRUINowPlayingController *)self _presentViewController:v5 animated:v3 completion:v6];
}

void __52__TVRUINowPlayingController__presentUpNextAnimated___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) upNextController];
  [v1 refreshIfNeeded];
}

- (void)_dismissNowPlayingViewController
{
}

- (void)_dismissNowPlayingViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TVRUINowPlayingController *)self nowPlayingNavController];
  [v4 dismissViewControllerAnimated:v3 completion:0];
}

- (void)_dismissUpNextViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TVRUINowPlayingController *)self upNextNavController];
  [v4 dismissViewControllerAnimated:v3 completion:0];
}

- (unint64_t)_layoutStyleForViewServiceLaunchContext:(int64_t)a3
{
  if ((unint64_t)a3 > 0xB) {
    return 1;
  }
  if (((1 << a3) & 0x864) != 0) {
    return 2;
  }
  if (a3 != 3) {
    return 1;
  }
  if ([(TVRUINowPlayingController *)self isPad]) {
    return 2;
  }
  return 1;
}

- (void)_presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  if ([(TVRUINowPlayingController *)self isPad])
  {
    [v9 setTransitioningDelegate:self];
    [v9 setModalPresentationStyle:4];
    id v11 = [(TVRUINowPlayingController *)self hostingViewController];
    [v11 presentViewController:v9 animated:v5 completion:v8];
  }
  else
  {
    id v11 = [v9 sheetPresentationController];
    [v11 setPrefersGrabberVisible:1];
    [v9 setModalPresentationStyle:1];
    uint64_t v10 = [(TVRUINowPlayingController *)self hostingViewController];
    [v10 presentViewController:v9 animated:v5 completion:v8];

    id v8 = v9;
    id v9 = v10;
  }
}

- (id)_activeNavController
{
  if ([(TVRUINowPlayingController *)self _upNextViewControllerIsPresented])
  {
    uint64_t v3 = [(TVRUINowPlayingController *)self upNextNavController];
  }
  else if ([(TVRUINowPlayingController *)self _nowPlayingViewControllerIsPresented])
  {
    uint64_t v3 = [(TVRUINowPlayingController *)self nowPlayingNavController];
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

- (BOOL)_shouldResetNowPlayingInfoTabSelection
{
  uint64_t v3 = [(TVRUINowPlayingController *)self lastPresentedNowPlaying];

  if (!v3) {
    return 0;
  }
  uint64_t v4 = [(TVRUINowPlayingController *)self lastPresentedNowPlaying];
  [v4 timeIntervalSinceNow];
  double v6 = fabs(v5);

  return v6 >= 480.0;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[_TVRUIControlCenterSheetPresentationController alloc] initWithPresentedViewController:v10 presentingViewController:v9];

  [(_TVRUIControlCenterSheetPresentationController *)v11 setSourceViewController:v8];
  [(_TVRUIControlCenterSheetPresentationController *)v11 setLayoutStyle:[(TVRUINowPlayingController *)self _layoutStyleForViewServiceLaunchContext:[(TVRUINowPlayingController *)self viewServiceLaunchContext]]];
  return v11;
}

- (UIViewController)hostingViewController
{
  return self->_hostingViewController;
}

- (int64_t)viewServiceLaunchContext
{
  return self->_viewServiceLaunchContext;
}

- (void)setViewServiceLaunchContext:(int64_t)a3
{
  self->_viewServiceLaunchContext = a3;
}

- (BOOL)showsCastTab
{
  return self->_showsCastTab;
}

- (void)setShowsCastTab:(BOOL)a3
{
  self->_showsCastTab = a3;
}

- (TVRCNowPlayingInfo)nowPlayingInfo
{
  return self->_nowPlayingInfo;
}

- (id)commandHandler
{
  return self->_commandHandler;
}

- (id)capellaInfoDidChangeHandler
{
  return self->_capellaInfoDidChangeHandler;
}

- (void)setCapellaInfoDidChangeHandler:(id)a3
{
}

- (TVRUIUpNextController)upNextController
{
  return self->_upNextController;
}

- (void)setUpNextController:(id)a3
{
}

- (TVRUINowPlayingViewController)nowPlayingViewController
{
  return self->_nowPlayingViewController;
}

- (void)setNowPlayingViewController:(id)a3
{
}

- (void)setNowPlayingNavController:(id)a3
{
}

- (void)setUpNextNavController:(id)a3
{
}

- (BOOL)isPad
{
  return self->_isPad;
}

- (TVRCMediaInfo)cachedMediaInfo
{
  return self->_cachedMediaInfo;
}

- (void)setCachedMediaInfo:(id)a3
{
}

- (TVRUIDevice)device
{
  return self->_device;
}

- (NSString)canonicalIDOfCurrentUTSRequest
{
  return self->_canonicalIDOfCurrentUTSRequest;
}

- (void)setCanonicalIDOfCurrentUTSRequest:(id)a3
{
}

- (NSDate)lastPresentedNowPlaying
{
  return self->_lastPresentedNowPlaying;
}

- (void)setLastPresentedNowPlaying:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPresentedNowPlaying, 0);
  objc_storeStrong((id *)&self->_canonicalIDOfCurrentUTSRequest, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_cachedMediaInfo, 0);
  objc_storeStrong((id *)&self->_upNextNavController, 0);
  objc_storeStrong((id *)&self->_nowPlayingNavController, 0);
  objc_storeStrong((id *)&self->_nowPlayingViewController, 0);
  objc_storeStrong((id *)&self->_upNextController, 0);
  objc_storeStrong(&self->_capellaInfoDidChangeHandler, 0);
  objc_storeStrong(&self->_commandHandler, 0);
  objc_storeStrong((id *)&self->_nowPlayingInfo, 0);
  objc_storeStrong((id *)&self->_hostingViewController, 0);
}

void __47__TVRUINowPlayingController_setNowPlayingInfo___block_invoke_4_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_227326000, a2, OS_LOG_TYPE_ERROR, "Error when requested media info from UTS: %@", (uint8_t *)&v2, 0xCu);
}

void __64__TVRUINowPlayingController__openURL_usingSafariViewController___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_227326000, a2, OS_LOG_TYPE_ERROR, "Failed to openURL: %@", (uint8_t *)&v2, 0xCu);
}

@end