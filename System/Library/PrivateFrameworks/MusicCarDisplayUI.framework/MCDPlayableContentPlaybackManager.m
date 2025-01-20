@interface MCDPlayableContentPlaybackManager
- (BOOL)isSeeking;
- (BOOL)nowPlayingViewController:(id)a3 buttonShouldBeActive:(int64_t)a4;
- (BOOL)nowPlayingViewController:(id)a3 shouldDisplayButton:(int64_t)a4 withImage:(id *)a5 existingIdentifier:(id)a6 tinted:(BOOL *)a7;
- (BOOL)nowPlayingViewControllerCanShowAddToLibrary:(id)a3;
- (BOOL)nowPlayingViewControllerCanShowMore:(id)a3;
- (BOOL)nowPlayingViewControllerIsRightHandDrive:(id)a3;
- (MCDPCModel)model;
- (double)_jumpBackwardInterval;
- (double)_jumpForwardInterval;
- (id)_adjustedIndexPathForPlaybackQueue:(id)a3;
- (id)_alertActionForFeedbackCommand:(id)a3 fallbackTitle:(id)a4;
- (id)_itemAtIndexPath:(id)a3;
- (id)_skipIntervalButtonImageForInterval:(double)a3 size:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)_numberOfItemsInPlaybackQueue;
- (int64_t)playingItemIndex;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)totalItemCount;
- (void)_handleHamburgerActionSheet;
- (void)_processResponse:(id)a3 error:(id)a4;
- (void)_updateTrackQueueIndex;
- (void)nowPlayingViewController:(id)a3 didSendAction:(int64_t)a4 state:(int64_t)a5;
- (void)nowPlayingViewControllerAddToLibrary:(id)a3;
- (void)nowPlayingViewControllerMore:(id)a3;
- (void)setModel:(id)a3;
- (void)setPlayingItemIndex:(int64_t)a3;
- (void)setSeeking:(BOOL)a3;
- (void)setTotalItemCount:(int64_t)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation MCDPlayableContentPlaybackManager

- (void)_processResponse:(id)a3 error:(id)a4
{
  id v23 = a3;
  v5 = [(_MCDNowPlayingContentManager *)self nowPlayingItem];
  if (v5) {
    goto LABEL_2;
  }
  if ([v23 state])
  {
    [(_MCDNowPlayingContentManager *)self setCurrentPlayingSong:0];
    v14 = [(_MCDNowPlayingContentManager *)self delegate];
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      v5 = [(_MCDNowPlayingContentManager *)self delegate];
      [v5 contentManagerCompletedAllPlayback:self];
LABEL_2:
    }
  }
  v6 = [v23 tracklist];
  v7 = [v6 items];
  uint64_t v8 = [v7 numberOfSections];

  if (v8 >= 1)
  {
    v9 = [v23 tracklist];
    v10 = [v9 playingItemIndexPath];

    if (v10)
    {
      v11 = [(MCDPlayableContentPlaybackManager *)self _itemAtIndexPath:v10];
      v12 = [v11 metadataObject];
      v13 = [v12 anyObject];
      [(_MCDNowPlayingContentManager *)self setCurrentPlayingSong:v13];
    }
    else
    {
      [(_MCDNowPlayingContentManager *)self setCurrentPlayingSong:0];
    }
    [(_MCDNowPlayingContentManager *)self processArtworkForCurrentlyPlayingSong];
    v16 = [(_MCDNowPlayingContentManager *)self delegate];
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      BOOL v18 = [(_MCDNowPlayingContentManager *)self _shouldShowPlaybackQueueForItemCount:[(MCDPlayableContentPlaybackManager *)self _numberOfItemsInPlaybackQueue]];
      v19 = [(_MCDNowPlayingContentManager *)self delegate];
      [v19 contentManager:self shouldShowPlaybackQueue:v18];
    }
    [(MCDPlayableContentPlaybackManager *)self _updateTrackQueueIndex];
  }
  v20 = [(_MCDNowPlayingContentManager *)self tableView];

  if (v20)
  {
    v21 = [(_MCDNowPlayingContentManager *)self tableView];
    [v21 reloadData];
  }
  v22 = [MEMORY[0x263F08A00] defaultCenter];
  [v22 addObserver:self selector:sel_modelResponseDidInvalidate_ name:*MEMORY[0x263F11B18] object:v23];
}

- (int64_t)_numberOfItemsInPlaybackQueue
{
  v2 = [(_MCDNowPlayingContentManager *)self requestController];
  v3 = [v2 response];
  v4 = [v3 tracklist];
  v5 = [v4 items];
  uint64_t v6 = [v5 totalItemCount];

  if (v6 <= 1) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = v6;
  }
  return v7 - 1;
}

- (id)_adjustedIndexPathForPlaybackQueue:(id)a3
{
  id v4 = a3;
  v5 = [(_MCDNowPlayingContentManager *)self requestController];
  uint64_t v6 = [v5 response];
  uint64_t v7 = [v6 tracklist];
  uint64_t v8 = [v7 items];
  uint64_t v9 = [v4 row];

  v10 = [v8 indexPathForGlobalIndex:v9 + 1];

  return v10;
}

- (id)_itemAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(_MCDNowPlayingContentManager *)self requestController];
  uint64_t v6 = [v5 response];
  uint64_t v7 = [v6 tracklist];
  uint64_t v8 = [v7 items];
  uint64_t v9 = [v8 itemAtIndexPath:v4];

  return v9;
}

- (void)_updateTrackQueueIndex
{
  v3 = [(_MCDNowPlayingContentManager *)self requestController];
  id v4 = [v3 response];
  v5 = [v4 tracklist];
  uint64_t v6 = [v5 playingItemGlobalIndex];

  uint64_t v7 = [(_MCDNowPlayingContentManager *)self requestController];
  uint64_t v8 = [v7 response];
  uint64_t v9 = [v8 tracklist];
  uint64_t v10 = [v9 globalItemCount];

  if (v6 != [(MCDPlayableContentPlaybackManager *)self playingItemIndex]
    || v10 != [(MCDPlayableContentPlaybackManager *)self totalItemCount])
  {
    v11 = [(_MCDNowPlayingContentManager *)self delegate];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      id v13 = [(_MCDNowPlayingContentManager *)self delegate];
      [v13 contentManager:self displayItemIndex:v6 totalItemCount:v10];
    }
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t v5 = [(MCDPlayableContentPlaybackManager *)self _numberOfItemsInPlaybackQueue];
  BOOL v6 = [(_MCDNowPlayingContentManager *)self limitedUI];
  int64_t v7 = 12;
  if (v5 < 12) {
    int64_t v7 = v5;
  }
  if (v6) {
    return v7;
  }
  else {
    return v5;
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v43 = a3;
  id v41 = a4;
  v42 = [MEMORY[0x263F313D0] cellForTableView:v43];
  uint64_t v6 = [(MCDPlayableContentPlaybackManager *)self _adjustedIndexPathForPlaybackQueue:v41];
  int64_t v7 = [(_MCDNowPlayingContentManager *)self requestController];
  uint64_t v8 = [v7 response];
  uint64_t v9 = [v8 tracklist];
  uint64_t v10 = [v9 items];
  v39 = (void *)v6;
  v11 = [v10 itemAtIndexPath:v6];
  char v12 = [v11 metadataObject];
  id v13 = [v12 anyObject];

  v14 = (void *)MEMORY[0x263F313E0];
  uint64_t v15 = [v13 title];
  v40 = [v13 artist];
  v16 = [v40 name];
  char v17 = [v13 album];
  BOOL v18 = [v17 title];
  v19 = MCDFormatArtistAlbumString(v16, v18);
  v38 = self;
  v20 = [(_MCDNowPlayingContentManager *)self artworkCache];
  v21 = [v20 objectForKey:v41];
  uint64_t v22 = [v13 isExplicitSong];
  LOWORD(v37) = 0;
  id v23 = v14;
  v24 = (void *)v15;
  v25 = objc_msgSend(v23, "configurationWithText:detailText:image:showExplicit:accessory:showActivityIndicator:showPlaybackProgress:playbackProgress:currentlyPlaying:", v15, v19, v21, v22, 0, 0, 0.0, v37);

  [v42 applyConfiguration:v25];
  v26 = [v13 artworkCatalog];

  if (v26)
  {
    v27 = [v43 window];
    v28 = [v27 screen];
    [v28 scale];
    double v30 = v29;
    v31 = [v13 artworkCatalog];
    [v31 setDestinationScale:v30];

    v32 = [v13 artworkCatalog];
    v33 = (objc_class *)objc_opt_class();
    v34 = NSStringFromClass(v33);
    [v32 setCacheIdentifier:v34 forRequestingContext:v38];

    objc_initWeak(&location, v38);
    v35 = [v13 artworkCatalog];
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __69__MCDPlayableContentPlaybackManager_tableView_cellForRowAtIndexPath___block_invoke;
    v44[3] = &unk_26505C578;
    objc_copyWeak(&v46, &location);
    id v45 = v41;
    [v35 setDestination:v38 configurationBlock:v44];

    objc_destroyWeak(&v46);
    objc_destroyWeak(&location);
  }

  return v42;
}

void __69__MCDPlayableContentPlaybackManager_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__MCDPlayableContentPlaybackManager_tableView_cellForRowAtIndexPath___block_invoke_2;
  block[3] = &unk_26505C5A0;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  id v7 = v4;
  id v8 = *(id *)(a1 + 32);
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v9);
}

void __69__MCDPlayableContentPlaybackManager_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = [WeakRetained artworkCache];
  [v2 setObject:*(void *)(a1 + 32) forKey:*(void *)(a1 + 40)];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  id v7 = [(_MCDNowPlayingContentManager *)self requestController];
  id v8 = [v7 response];
  id v9 = [v8 tracklist];

  v19 = v9;
  uint64_t v10 = [v9 changeItemCommand];
  v11 = [(_MCDNowPlayingContentManager *)self requestController];
  char v12 = [v11 response];
  id v13 = [v12 tracklist];
  v14 = [v13 items];
  uint64_t v15 = [(MCDPlayableContentPlaybackManager *)self _adjustedIndexPathForPlaybackQueue:v6];
  v16 = [v14 itemAtIndexPath:v15];
  char v17 = [v10 changeToItem:v16];

  objc_initWeak(&location, self);
  BOOL v18 = (void *)MEMORY[0x263F54808];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __71__MCDPlayableContentPlaybackManager_tableView_didSelectRowAtIndexPath___block_invoke;
  v21[3] = &unk_26505C5C8;
  objc_copyWeak(&v22, &location);
  [v18 performRequest:v17 completion:v21];
  [v20 deselectRowAtIndexPath:v6 animated:1];
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __71__MCDPlayableContentPlaybackManager_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__MCDPlayableContentPlaybackManager_tableView_didSelectRowAtIndexPath___block_invoke_2;
  block[3] = &unk_26505BDF0;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v2);
}

void __71__MCDPlayableContentPlaybackManager_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  char v2 = objc_opt_respondsToSelector();

  if (v2)
  {
    v3 = [WeakRetained delegate];
    [v3 contentManagerInitiatedPlaybackFromPlaybackQueue:WeakRetained];
  }
}

- (double)_jumpForwardInterval
{
  char v2 = [(_MCDNowPlayingContentManager *)self nowPlayingItem];
  v3 = [v2 seekCommand];
  id v4 = [v3 preferredForwardJumpIntervals];
  id v5 = [v4 firstObject];
  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (double)_jumpBackwardInterval
{
  char v2 = [(_MCDNowPlayingContentManager *)self nowPlayingItem];
  v3 = [v2 seekCommand];
  id v4 = [v3 preferredBackwardJumpIntervals];
  id v5 = [v4 firstObject];
  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (BOOL)nowPlayingViewController:(id)a3 shouldDisplayButton:(int64_t)a4 withImage:(id *)a5 existingIdentifier:(id)a6 tinted:(BOOL *)a7
{
  id v12 = a3;
  id v13 = a6;
  if (a4 == 2)
  {
    id v22 = [(_MCDNowPlayingContentManager *)self requestController];
    id v23 = [v22 response];
    uint64_t v24 = [v23 stop];
    if (v24)
    {
      v25 = (void *)v24;
      v26 = [(_MCDNowPlayingContentManager *)self requestController];
      v27 = [v26 response];
      v28 = [v27 pause];

      if (!v28)
      {
        double v29 = [v12 transportControlView];
        double v30 = v29;
        v31 = @"square.fill";
        goto LABEL_16;
      }
    }
    else
    {
    }
    BOOL v33 = [(_MCDNowPlayingContentManager *)self nowPlayingViewControllerIsPlaying:v12];
    double v29 = [v12 transportControlView];
    double v30 = v29;
    if (!v33)
    {
      [v29 setPlayButtonImageName:@"play.fill"];
      goto LABEL_20;
    }
    v31 = @"pause.fill";
LABEL_16:
    [v29 setPauseButtonImageName:v31];
LABEL_20:

    goto LABEL_21;
  }
  if (a4 == 1)
  {
    [(MCDPlayableContentPlaybackManager *)self _jumpForwardInterval];
    if (v32 == 0.0) {
      goto LABEL_21;
    }
    goto LABEL_12;
  }
  if (a4) {
    goto LABEL_21;
  }
  [(MCDPlayableContentPlaybackManager *)self _jumpBackwardInterval];
  if (v14 != 0.0)
  {
LABEL_12:
    -[MCDPlayableContentPlaybackManager _skipIntervalButtonImageForInterval:size:](self, "_skipIntervalButtonImageForInterval:size:", 22);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  uint64_t v15 = [(_MCDNowPlayingContentManager *)self requestController];
  v16 = [v15 response];
  char v17 = [v16 tracklist];
  BOOL v18 = [v17 changeItemCommand];
  v19 = [v18 previousItem];

  if (!v19)
  {
    id v20 = [(_MCDNowPlayingContentManager *)self nowPlayingItem];
    v21 = [v20 likeCommand];
    if (v21)
    {

LABEL_19:
      *a5 = +[MCDGlyph imageNamed:@"line.horizontal.3.decrease.circle" ofSize:22.0];
      double v30 = [(_MCDNowPlayingContentManager *)self nowPlayingItem];
      v36 = [v30 likeCommand];
      *a7 = [v36 value];

      goto LABEL_20;
    }
    v34 = [(_MCDNowPlayingContentManager *)self nowPlayingItem];
    v35 = [v34 dislikeCommand];

    if (v35) {
      goto LABEL_19;
    }
  }
LABEL_21:

  return 1;
}

- (id)_skipIntervalButtonImageForInterval:(double)a3 size:(int64_t)a4
{
  if (_skipIntervalButtonImageForInterval_size__onceToken != -1) {
    dispatch_once(&_skipIntervalButtonImageForInterval_size__onceToken, &__block_literal_global_3);
  }
  double v6 = @"gobackward";
  if (a3 > 0.0) {
    double v6 = @"goforward";
  }
  double v7 = v6;
  id v8 = (void *)_skipIntervalButtonImageForInterval_size____knownIntervals;
  double v9 = fabs(a3);
  uint64_t v10 = [NSNumber numberWithDouble:v9];
  LODWORD(v8) = [v8 containsObject:v10];

  if (v8)
  {
    v11 = NSString;
    id v12 = [NSNumber numberWithDouble:v9];
    uint64_t v13 = [v11 stringWithFormat:@"%@.%@", v7, v12];

    double v7 = (__CFString *)v13;
  }
  double v14 = +[MCDGlyph imageNamed:v7 ofSize:(double)a4];

  return v14;
}

void __78__MCDPlayableContentPlaybackManager__skipIntervalButtonImageForInterval_size___block_invoke()
{
  v0 = (void *)_skipIntervalButtonImageForInterval_size____knownIntervals;
  _skipIntervalButtonImageForInterval_size____knownIntervals = (uint64_t)&unk_26F2E2F20;
}

- (BOOL)nowPlayingViewController:(id)a3 buttonShouldBeActive:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    [(MCDPlayableContentPlaybackManager *)self _jumpForwardInterval];
    if (v16 == 0.0)
    {
      uint64_t v13 = [(_MCDNowPlayingContentManager *)self requestController];
      double v14 = [v13 response];
      char v17 = [v14 tracklist];
      BOOL v18 = [v17 changeItemCommand];
      v19 = [v18 nextItem];

LABEL_9:
      BOOL v15 = v19 != 0;

      goto LABEL_10;
    }
LABEL_11:
    BOOL v15 = 1;
    goto LABEL_12;
  }
  if (a4) {
    goto LABEL_11;
  }
  [(MCDPlayableContentPlaybackManager *)self _jumpBackwardInterval];
  if (v7 != 0.0) {
    goto LABEL_11;
  }
  id v8 = [(_MCDNowPlayingContentManager *)self requestController];
  double v9 = [v8 response];
  uint64_t v10 = [v9 tracklist];
  v11 = [v10 changeItemCommand];
  id v12 = [v11 previousItem];

  if (v12) {
    goto LABEL_11;
  }
  uint64_t v13 = [(_MCDNowPlayingContentManager *)self nowPlayingItem];
  double v14 = [v13 likeCommand];
  if (!v14)
  {
    char v17 = [(_MCDNowPlayingContentManager *)self nowPlayingItem];
    BOOL v18 = [v17 dislikeCommand];
    v19 = v18;
    goto LABEL_9;
  }
  BOOL v15 = 1;
LABEL_10:

LABEL_12:
  return v15;
}

- (void)nowPlayingViewController:(id)a3 didSendAction:(int64_t)a4 state:(int64_t)a5
{
  id v8 = [(_MCDNowPlayingContentManager *)self nowPlayingItem];
  double v9 = [v8 seekCommand];

  if (a4 == 2)
  {
    BOOL v15 = [(_MCDNowPlayingContentManager *)self requestController];
    double v16 = [v15 response];
    char v17 = [v16 stop];

    BOOL v18 = [(_MCDNowPlayingContentManager *)self requestController];
    v19 = [v18 response];
    id v20 = [v19 pause];

    v21 = MCDGeneralLogging();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (v17 && !v20)
    {
      if (v22)
      {
        *(_WORD *)v52 = 0;
        _os_log_impl(&dword_23F140000, v21, OS_LOG_TYPE_DEFAULT, "Sending stop command", v52, 2u);
      }

      id v23 = v17;
      goto LABEL_49;
    }
    if (v20)
    {
      if (v22)
      {
        *(_WORD *)v52 = 0;
        _os_log_impl(&dword_23F140000, v21, OS_LOG_TYPE_DEFAULT, "Sending pause command", v52, 2u);
      }

      id v23 = v20;
      goto LABEL_49;
    }
    if (v22)
    {
      *(_WORD *)v52 = 0;
      _os_log_impl(&dword_23F140000, v21, OS_LOG_TYPE_DEFAULT, "Sending play command", v52, 2u);
    }

    v39 = [(_MCDNowPlayingContentManager *)self requestController];
    v44 = [v39 response];
    uint64_t v45 = [v44 play];
LABEL_60:
    id v26 = (id)v45;

LABEL_61:
    goto LABEL_62;
  }
  if (a4 != 1)
  {
    if (a4) {
      goto LABEL_22;
    }
    BOOL v10 = [(MCDPlayableContentPlaybackManager *)self isSeeking];
    if (a5 == 1)
    {
      if (v9) {
        char v11 = v10;
      }
      else {
        char v11 = 1;
      }
      if ((v11 & 1) == 0)
      {
        id v12 = MCDGeneralLogging();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v52 = 0;
          _os_log_impl(&dword_23F140000, v12, OS_LOG_TYPE_DEFAULT, "Sending reverse seek command", v52, 2u);
        }

        uint64_t v13 = v9;
        uint64_t v14 = -1;
LABEL_39:
        id v26 = [v13 beginSeekWithDirection:v14];
        double v29 = self;
        uint64_t v30 = 1;
        goto LABEL_40;
      }
      goto LABEL_22;
    }
    if (v10)
    {
      id v26 = [v9 endSeek];
      v27 = MCDGeneralLogging();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v52 = 0;
        _os_log_impl(&dword_23F140000, v27, OS_LOG_TYPE_DEFAULT, "Sending end reverse seek command", v52, 2u);
      }

LABEL_35:
      double v29 = self;
      uint64_t v30 = 0;
LABEL_40:
      [(MCDPlayableContentPlaybackManager *)v29 setSeeking:v30];
      goto LABEL_64;
    }
    [(MCDPlayableContentPlaybackManager *)self _jumpBackwardInterval];
    double v33 = v32;
    v34 = [(_MCDNowPlayingContentManager *)self requestController];
    v35 = [v34 response];
    v36 = [v35 tracklist];
    uint64_t v37 = [v36 changeItemCommand];
    char v17 = [v37 previousItem];

    if (v33 != 0.0)
    {
      v38 = MCDGeneralLogging();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v52 = 0;
        _os_log_impl(&dword_23F140000, v38, OS_LOG_TYPE_DEFAULT, "Sending skip backwards command", v52, 2u);
      }

      id v20 = [(_MCDNowPlayingContentManager *)self nowPlayingItem];
      v39 = [v20 seekCommand];
      id v26 = [v39 jumpByInterval:v33];
      goto LABEL_61;
    }
    if (v17)
    {
      id v46 = MCDGeneralLogging();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v52 = 0;
        _os_log_impl(&dword_23F140000, v46, OS_LOG_TYPE_DEFAULT, "Sending previous item command", v52, 2u);
      }

      id v26 = v17;
      goto LABEL_63;
    }
    v47 = [(_MCDNowPlayingContentManager *)self nowPlayingItem];
    v48 = [v47 likeCommand];
    if (v48)
    {
    }
    else
    {
      v49 = [(_MCDNowPlayingContentManager *)self nowPlayingItem];
      v50 = [v49 dislikeCommand];

      if (!v50)
      {
LABEL_71:
        id v26 = 0;
        goto LABEL_63;
      }
    }
    v51 = MCDGeneralLogging();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v52 = 0;
      _os_log_impl(&dword_23F140000, v51, OS_LOG_TYPE_DEFAULT, "Opening action sheet for like/dislike command", v52, 2u);
    }

    [(MCDPlayableContentPlaybackManager *)self _handleHamburgerActionSheet];
    goto LABEL_71;
  }
  BOOL v24 = [(MCDPlayableContentPlaybackManager *)self isSeeking];
  if (a5 != 1)
  {
    if (v24)
    {
      v28 = MCDGeneralLogging();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v52 = 0;
        _os_log_impl(&dword_23F140000, v28, OS_LOG_TYPE_DEFAULT, "Sending end forward seek command", v52, 2u);
      }

      id v26 = [v9 endSeek];
      goto LABEL_35;
    }
    [(MCDPlayableContentPlaybackManager *)self _jumpForwardInterval];
    double v41 = v40;
    v42 = MCDGeneralLogging();
    BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
    if (v41 != 0.0)
    {
      if (v43)
      {
        *(_WORD *)v52 = 0;
        _os_log_impl(&dword_23F140000, v42, OS_LOG_TYPE_DEFAULT, "Sending skip forward command", v52, 2u);
      }

      char v17 = [(_MCDNowPlayingContentManager *)self nowPlayingItem];
      id v20 = [v17 seekCommand];
      id v23 = [v20 jumpByInterval:v41];
LABEL_49:
      id v26 = v23;
LABEL_62:

LABEL_63:
      goto LABEL_64;
    }
    if (v43)
    {
      *(_WORD *)v52 = 0;
      _os_log_impl(&dword_23F140000, v42, OS_LOG_TYPE_DEFAULT, "Sending forward item command", v52, 2u);
    }

    char v17 = [(_MCDNowPlayingContentManager *)self requestController];
    id v20 = [v17 response];
    v39 = [v20 tracklist];
    v44 = [v39 changeItemCommand];
    uint64_t v45 = [v44 nextItem];
    goto LABEL_60;
  }
  if (v9) {
    char v25 = v24;
  }
  else {
    char v25 = 1;
  }
  if ((v25 & 1) == 0)
  {
    v31 = MCDGeneralLogging();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v52 = 0;
      _os_log_impl(&dword_23F140000, v31, OS_LOG_TYPE_DEFAULT, "Sending forward seek command", v52, 2u);
    }

    uint64_t v13 = v9;
    uint64_t v14 = 1;
    goto LABEL_39;
  }
LABEL_22:
  id v26 = 0;
LABEL_64:
  [(_MCDNowPlayingContentManager *)self _performChangeRequest:v26];
}

- (void)_handleHamburgerActionSheet
{
  id v20 = [MEMORY[0x263F82418] alertControllerWithTitle:0 message:0 preferredStyle:0];
  [v20 setOverrideUserInterfaceStyle:2];
  v3 = [(_MCDNowPlayingContentManager *)self nowPlayingItem];
  id v4 = [v3 likeCommand];

  if (v4)
  {
    id v5 = MCDCarDisplayBundle();
    id v6 = [v5 localizedStringForKey:@"LIKE_TRACK_DEFAULT_TITLE" value:&stru_26F2DBB20 table:@"MusicCarDisplayUI"];
    double v7 = [(MCDPlayableContentPlaybackManager *)self _alertActionForFeedbackCommand:v4 fallbackTitle:v6];
    [v20 addAction:v7];
  }
  id v8 = [(_MCDNowPlayingContentManager *)self nowPlayingItem];
  double v9 = [v8 dislikeCommand];

  if (v9)
  {
    BOOL v10 = MCDCarDisplayBundle();
    char v11 = [v10 localizedStringForKey:@"DISLIKE_TRACK_DEFAULT_TITLE" value:&stru_26F2DBB20 table:@"MusicCarDisplayUI"];
    id v12 = [(MCDPlayableContentPlaybackManager *)self _alertActionForFeedbackCommand:v9 fallbackTitle:v11];
    [v20 addAction:v12];
  }
  uint64_t v13 = (void *)MEMORY[0x263F82400];
  uint64_t v14 = MCDCarDisplayBundle();
  BOOL v15 = [(id)v14 localizedStringForKey:@"CANCEL" value:&stru_26F2DBB20 table:@"MusicCarDisplayUI"];
  double v16 = [v13 actionWithTitle:v15 style:1 handler:0];
  [v20 addAction:v16];

  char v17 = [(_MCDNowPlayingContentManager *)self delegate];
  LOBYTE(v14) = objc_opt_respondsToSelector();

  if (v14)
  {
    [(_MCDNowPlayingContentManager *)self setAlertController:v20];
    BOOL v18 = [(_MCDNowPlayingContentManager *)self delegate];
    v19 = [(_MCDNowPlayingContentManager *)self alertController];
    [v18 contentManager:self presentViewController:v19];
  }
}

- (id)_alertActionForFeedbackCommand:(id)a3 fallbackTitle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 localizedShortTitle];
  if (!v8)
  {
    id v8 = [v6 localizedTitle];
    if (!v8) {
      id v8 = v7;
    }
  }
  double v9 = (void *)MEMORY[0x263F82400];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  BOOL v15 = __82__MCDPlayableContentPlaybackManager__alertActionForFeedbackCommand_fallbackTitle___block_invoke;
  double v16 = &unk_26505C5F0;
  char v17 = self;
  id v18 = v6;
  id v10 = v6;
  char v11 = [v9 actionWithTitle:v8 style:0 handler:&v13];
  objc_msgSend(v11, "_setChecked:", objc_msgSend(v10, "value", v13, v14, v15, v16, v17));

  return v11;
}

void __82__MCDPlayableContentPlaybackManager__alertActionForFeedbackCommand_fallbackTitle___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "changeValue:", objc_msgSend(*(id *)(a1 + 40), "value") ^ 1);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 _performChangeRequest:v2];
}

- (BOOL)nowPlayingViewControllerCanShowAddToLibrary:(id)a3
{
  v3 = [(_MCDNowPlayingContentManager *)self nowPlayingItem];
  id v4 = [v3 wishlistCommand];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)nowPlayingViewControllerAddToLibrary:(id)a3
{
  id v4 = [(_MCDNowPlayingContentManager *)self nowPlayingItem];
  id v6 = [v4 wishlistCommand];

  if (v6)
  {
    BOOL v5 = objc_msgSend(v6, "changeValue:", objc_msgSend(v6, "value") ^ 1);
    [(_MCDNowPlayingContentManager *)self _performChangeRequest:v5];
  }
}

- (BOOL)nowPlayingViewControllerCanShowMore:(id)a3
{
  id v4 = [(_MCDNowPlayingContentManager *)self requestController];
  BOOL v5 = [v4 response];
  id v6 = [v5 tracklist];
  id v7 = [v6 changeItemCommand];
  id v8 = [v7 previousItem];

  if (!v8) {
    return 0;
  }
  double v9 = [(_MCDNowPlayingContentManager *)self nowPlayingItem];
  id v10 = [v9 likeCommand];
  if (v10)
  {
    BOOL v11 = 1;
  }
  else
  {
    id v12 = [(_MCDNowPlayingContentManager *)self nowPlayingItem];
    uint64_t v13 = [v12 dislikeCommand];
    BOOL v11 = v13 != 0;
  }
  return v11;
}

- (void)nowPlayingViewControllerMore:(id)a3
{
  id v4 = [(_MCDNowPlayingContentManager *)self requestController];
  BOOL v5 = [v4 response];
  id v6 = [v5 tracklist];
  id v7 = [v6 changeItemCommand];
  id v8 = [v7 previousItem];

  if (v8)
  {
    [(MCDPlayableContentPlaybackManager *)self _handleHamburgerActionSheet];
  }
}

- (BOOL)nowPlayingViewControllerIsRightHandDrive:(id)a3
{
  v3 = [(_MCDNowPlayingContentManager *)self carSessionStatus];
  id v4 = [v3 currentSession];
  BOOL v5 = [v4 configuration];
  char v6 = [v5 rightHandDrive];

  return v6;
}

- (BOOL)isSeeking
{
  return self->_seeking;
}

- (void)setSeeking:(BOOL)a3
{
  self->_seeking = a3;
}

- (MCDPCModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (int64_t)playingItemIndex
{
  return self->_playingItemIndex;
}

- (void)setPlayingItemIndex:(int64_t)a3
{
  self->_playingItemIndex = a3;
}

- (int64_t)totalItemCount
{
  return self->_totalItemCount;
}

- (void)setTotalItemCount:(int64_t)a3
{
  self->_totalItemCount = a3;
}

- (void).cxx_destruct
{
}

@end