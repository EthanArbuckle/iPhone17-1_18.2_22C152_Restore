@interface _MCDNowPlayingContentManager
- ($04B05C73ED6AEEF31C5815932084562D)durationSnapshotForNowPlayingViewController:(SEL)a3;
- (BOOL)_sessionAllowsAlbumArt:(id)a3;
- (BOOL)_shouldShowPlaybackQueueForItemCount:(int64_t)a3;
- (BOOL)allowsAlbumArt;
- (BOOL)limitedUI;
- (BOOL)nowPlayingViewControllerCanRepeat:(id)a3;
- (BOOL)nowPlayingViewControllerCanShowAlbumArt:(id)a3;
- (BOOL)nowPlayingViewControllerCanShowAlbumLink:(id)a3;
- (BOOL)nowPlayingViewControllerCanShowChangePlaybackRate:(id)a3;
- (BOOL)nowPlayingViewControllerCanShowUpNext:(id)a3;
- (BOOL)nowPlayingViewControllerCanShuffle:(id)a3;
- (BOOL)nowPlayingViewControllerIsPlaying:(id)a3;
- (BOOL)nowPlayingViewControllerIsRightHandDrive:(id)a3;
- (BOOL)nowPlayingViewControllerIsShowingExplicitTrack:(id)a3;
- (BOOL)nowPlayingViewControllerShouldHideBackButton:(id)a3;
- (BOOL)nowPlayingViewControllerShouldOverrideRightBarButtons:(id)a3;
- (BOOL)nowPlayingViewControllerShouldUseMusicExplicitGlyph:(id)a3;
- (BOOL)shouldHideBackButton;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (CARSessionStatus)carSessionStatus;
- (Class)tableCellClass;
- (MCDNowPlayingContentManagerDelegate)delegate;
- (MCDNowPlayingDataSource)dataSource;
- (MPArtworkCatalog)artworkCatalog;
- (MPCPlayerResponse)lastReceivedResponse;
- (MPCPlayerResponseItem)nowPlayingItem;
- (MPModelPlaylist)currentPlayingPlaylist;
- (MPModelPlaylistEntry)currentPlayingPlaylistEntry;
- (MPModelRadioStation)currentPlayingRadioStation;
- (MPModelSong)currentPlayingSong;
- (MPRequestResponseController)requestController;
- (MSVTimer)artworkTimer;
- (NSMutableDictionary)artworkCache;
- (NSString)bundleID;
- (NSString)nowPlayingBundleID;
- (UIAlertController)alertController;
- (UIImage)albumArtwork;
- (UITableView)tableView;
- (_MCDNowPlayingContentManager)initWithDelegate:(id)a3 dataSource:(id)a4 bundleID:(id)a5;
- (id)_requestResponseItem;
- (id)_setupRequest;
- (id)albumTextForNowPlayingController:(id)a3;
- (id)artistTextForNowPlayingController:(id)a3;
- (id)nowPlayingViewControllerGetPlaybackRate:(id)a3;
- (id)progressBarLocalizedDurationStringForNowPlayingViewController:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)titleForNowPlayingController:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)placeholderTypeForNowPlayingViewController:(id)a3;
- (int64_t)playerState;
- (int64_t)repeatTypeForNowPlayingViewController:(id)a3;
- (int64_t)shuffleTypeForNowPlayingViewController:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_limitedUIChanged:(id)a3;
- (void)_performChangeRequest:(id)a3;
- (void)_performRequest;
- (void)_showPlaceholderArtwork;
- (void)beginRequestObservation;
- (void)controller:(id)a3 defersResponseReplacement:(id)a4;
- (void)dealloc;
- (void)endRequestObservation;
- (void)modelResponseDidInvalidate:(id)a3;
- (void)nowPlayingViewControllerChangePlaybackRate:(id)a3;
- (void)nowPlayingViewControllerToggleRepeat:(id)a3;
- (void)nowPlayingViewControllerToggleShuffle:(id)a3;
- (void)processArtworkForCurrentlyPlayingSong;
- (void)session:(id)a3 didUpdateConfiguration:(id)a4;
- (void)sessionDidConnect:(id)a3;
- (void)setAlbumArtwork:(id)a3;
- (void)setAlertController:(id)a3;
- (void)setAllowsAlbumArt:(BOOL)a3;
- (void)setArtworkCache:(id)a3;
- (void)setArtworkCatalog:(id)a3;
- (void)setArtworkTimer:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setCarSessionStatus:(id)a3;
- (void)setCurrentPlayingPlaylist:(id)a3;
- (void)setCurrentPlayingPlaylistEntry:(id)a3;
- (void)setCurrentPlayingRadioStation:(id)a3;
- (void)setCurrentPlayingSong:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLastReceivedResponse:(id)a3;
- (void)setLimitedUI:(BOOL)a3;
- (void)setNowPlayingItem:(id)a3;
- (void)setPlayerState:(int64_t)a3;
- (void)setRequestController:(id)a3;
- (void)setShouldHideBackButton:(BOOL)a3;
- (void)setTableCellClass:(Class)a3;
- (void)setTableView:(id)a3;
- (void)viewWillDisappear;
@end

@implementation _MCDNowPlayingContentManager

- (void)setTableCellClass:(Class)a3
{
}

- (_MCDNowPlayingContentManager)initWithDelegate:(id)a3 dataSource:(id)a4 bundleID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)_MCDNowPlayingContentManager;
  v11 = [(_MCDNowPlayingContentManager *)&v21 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v8);
    objc_storeWeak((id *)&v12->_dataSource, v9);
    v13 = (MPRequestResponseController *)objc_alloc_init(MEMORY[0x263F121E0]);
    requestController = v12->_requestController;
    v12->_requestController = v13;

    [(MPRequestResponseController *)v12->_requestController setDelegate:v12];
    objc_storeStrong((id *)&v12->_bundleID, a5);
    uint64_t v15 = [MEMORY[0x263EFF9A0] dictionary];
    artworkCache = v12->_artworkCache;
    v12->_artworkCache = (NSMutableDictionary *)v15;

    v17 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v18 = [objc_alloc(MEMORY[0x263F30E50]) initWithOptions:4];
    carSessionStatus = v12->_carSessionStatus;
    v12->_carSessionStatus = (CARSessionStatus *)v18;

    [(CARSessionStatus *)v12->_carSessionStatus addSessionObserver:v12];
    v12->_shouldHideBackButton = 0;
    [v17 addObserver:v12 selector:sel__limitedUIChanged_ name:*MEMORY[0x263F30DA0] object:0];
    [(_MCDNowPlayingContentManager *)v12 _performRequest];
  }
  return v12;
}

- (void)_performRequest
{
  id v4 = [(_MCDNowPlayingContentManager *)self _setupRequest];
  v3 = [(_MCDNowPlayingContentManager *)self requestController];
  [v3 setRequest:v4];
}

- (MPRequestResponseController)requestController
{
  return self->_requestController;
}

- (id)_setupRequest
{
  id v3 = objc_alloc_init(MEMORY[0x263F54820]);
  objc_msgSend(v3, "setTracklistRange:", 0, 50);
  id v4 = [(_MCDNowPlayingContentManager *)self bundleID];
  char v5 = [v4 isEqualToString:@"com.apple.Music"];

  if (v5)
  {
    v6 = (void *)MEMORY[0x263F54818];
    v7 = [(_MCDNowPlayingContentManager *)self bundleID];
    id v8 = [v6 pathWithRoute:0 bundleID:v7 playerID:0];
    [v3 setPlayerPath:v8];
  }
  else
  {
    [v3 setPlayerPath:0];
  }
  id v9 = [(_MCDNowPlayingContentManager *)self dataSource];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    v11 = [(_MCDNowPlayingContentManager *)self dataSource];
    v12 = [v11 playingItemProperties];
    [v3 setPlayingItemProperties:v12];
  }
  v13 = [(_MCDNowPlayingContentManager *)self dataSource];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    uint64_t v15 = [(_MCDNowPlayingContentManager *)self dataSource];
    v16 = [v15 queueItemProperties];
    [v3 setQueueItemProperties:v16];
  }
  v17 = [(_MCDNowPlayingContentManager *)self dataSource];
  char v18 = objc_opt_respondsToSelector();

  if (v18)
  {
    v19 = [(_MCDNowPlayingContentManager *)self dataSource];
    v20 = [v19 queueSectionProperties];
    [v3 setQueueSectionProperties:v20];
  }
  objc_super v21 = [(_MCDNowPlayingContentManager *)self dataSource];
  char v22 = objc_opt_respondsToSelector();

  if (v22)
  {
    v23 = [(_MCDNowPlayingContentManager *)self dataSource];
    v24 = [v23 requestLabel];
    [v3 setLabel:v24];
  }
  return v3;
}

- (MCDNowPlayingDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (MCDNowPlayingDataSource *)WeakRetained;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F30DA0] object:0];

  v4.receiver = self;
  v4.super_class = (Class)_MCDNowPlayingContentManager;
  [(_MCDNowPlayingContentManager *)&v4 dealloc];
}

- (void)beginRequestObservation
{
  id v2 = [(_MCDNowPlayingContentManager *)self requestController];
  [v2 beginAutomaticResponseLoading];
}

- (void)endRequestObservation
{
  id v2 = [(_MCDNowPlayingContentManager *)self requestController];
  [v2 endAutomaticResponseLoading];
}

- (void)viewWillDisappear
{
  id v2 = [(_MCDNowPlayingContentManager *)self alertController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void)setTableView:(id)a3
{
  p_tableView = &self->_tableView;
  objc_storeWeak((id *)&self->_tableView, a3);
  if ([(_MCDNowPlayingContentManager *)self tableCellClass])
  {
    id WeakRetained = objc_loadWeakRetained((id *)p_tableView);
    v6 = [(_MCDNowPlayingContentManager *)self tableCellClass];
    v7 = NSStringFromClass([(_MCDNowPlayingContentManager *)self tableCellClass]);
    [WeakRetained registerClass:v6 forCellReuseIdentifier:v7];
  }
  id v8 = objc_loadWeakRetained((id *)p_tableView);
  [v8 setDelegate:self];

  id v9 = objc_loadWeakRetained((id *)p_tableView);
  [v9 setDataSource:self];

  id v10 = objc_loadWeakRetained((id *)p_tableView);
  [v10 reloadData];
}

- (void)setAllowsAlbumArt:(BOOL)a3
{
  if (self->_allowsAlbumArt != a3)
  {
    self->_allowsAlbumArt = a3;
    objc_super v4 = [(_MCDNowPlayingContentManager *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = [(_MCDNowPlayingContentManager *)self delegate];
      [v6 contentManagerReloadData:self];
    }
  }
}

- (BOOL)_sessionAllowsAlbumArt:(id)a3
{
  id v3 = [a3 configuration];
  BOOL v4 = [v3 nowPlayingAlbumArtMode] == 2;

  return v4;
}

- (void)sessionDidConnect:(id)a3
{
  [(_MCDNowPlayingContentManager *)self setAllowsAlbumArt:[(_MCDNowPlayingContentManager *)self _sessionAllowsAlbumArt:a3]];
  [(_MCDNowPlayingContentManager *)self _limitedUIChanged:0];
}

- (void)session:(id)a3 didUpdateConfiguration:(id)a4
{
  BOOL v5 = -[_MCDNowPlayingContentManager _sessionAllowsAlbumArt:](self, "_sessionAllowsAlbumArt:", a3, a4);
  [(_MCDNowPlayingContentManager *)self setAllowsAlbumArt:v5];
}

- (void)_limitedUIChanged:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50___MCDNowPlayingContentManager__limitedUIChanged___block_invoke;
  block[3] = &unk_26505BE68;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (void)modelResponseDidInvalidate:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_async_on_queue();
}

- (BOOL)_shouldShowPlaybackQueueForItemCount:(int64_t)a3
{
  if (a3 > 0)
  {
    id v4 = [(_MCDNowPlayingContentManager *)self nowPlayingItem];
    BOOL v5 = v4;
    if (v4)
    {
      [v4 duration];

      if ((_BYTE)v14)
      {
        id v6 = MCDGeneralLogging();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v7 = "Disabling up next queue; livestreaming content.";
LABEL_12:
          _os_log_impl(&dword_23F140000, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
          goto LABEL_13;
        }
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v14 = 0;
      long long v12 = 0u;
      long long v13 = 0u;
      long long v11 = 0u;
    }
    id v8 = [(_MCDNowPlayingContentManager *)self bundleID];
    int v9 = [v8 isEqualToString:@"com.apple.iBooks"];

    if (!v9) {
      return 1;
    }
    id v6 = MCDGeneralLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "Disabling up next queue for AudioBooks.";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  id v6 = MCDGeneralLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v7 = "Disabling up next queue; no items in queue.";
    goto LABEL_12;
  }
LABEL_13:

  return 0;
}

- (void)controller:(id)a3 defersResponseReplacement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69___MCDNowPlayingContentManager_controller_defersResponseReplacement___block_invoke;
  block[3] = &unk_26505C550;
  long long v12 = self;
  id v13 = v7;
  id v11 = v6;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (void)processArtworkForCurrentlyPlayingSong
{
  id v3 = [MEMORY[0x263F82B60] _carScreen];
  [v3 scale];
  double v5 = v4;
  id v6 = [(_MCDNowPlayingContentManager *)self currentPlayingSong];
  id v7 = [v6 artworkCatalog];

  id v8 = [(_MCDNowPlayingContentManager *)self artworkCatalog];
  char v9 = [v8 isArtworkVisuallyIdenticalToCatalog:v7];

  if ((v9 & 1) == 0)
  {
    [(_MCDNowPlayingContentManager *)self setArtworkCatalog:v7];
    id v10 = [(_MCDNowPlayingContentManager *)self artworkCatalog];

    if (v10)
    {
      [v7 setDestinationScale:v5];
      id v11 = [MEMORY[0x263F82B60] _carScreen];
      [v11 bounds];
      double v13 = v12;
      double v15 = v14;

      if (v13 < v15) {
        double v13 = v15;
      }
      v16 = [(_MCDNowPlayingContentManager *)self artworkCatalog];
      objc_msgSend(v16, "setFittingSize:", v13, v15);

      objc_initWeak(&location, self);
      v17 = (void *)MEMORY[0x263F54F58];
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __69___MCDNowPlayingContentManager_processArtworkForCurrentlyPlayingSong__block_invoke;
      v27[3] = &unk_26505BDF0;
      objc_copyWeak(&v28, &location);
      char v18 = [v17 timerWithInterval:0 repeats:v27 block:1.0];
      artworkTimer = self->_artworkTimer;
      self->_artworkTimer = v18;

      v20 = [(_MCDNowPlayingContentManager *)self artworkCatalog];
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __69___MCDNowPlayingContentManager_processArtworkForCurrentlyPlayingSong__block_invoke_52;
      v24[3] = &unk_26505C578;
      objc_copyWeak(&v26, &location);
      id v25 = v7;
      [v20 setDestination:self configurationBlock:v24];

      objc_destroyWeak(&v26);
      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);
    }
    else
    {
      [(_MCDNowPlayingContentManager *)self setAlbumArtwork:0];
      objc_super v21 = [(_MCDNowPlayingContentManager *)self delegate];
      char v22 = objc_opt_respondsToSelector();

      if (v22)
      {
        v23 = [(_MCDNowPlayingContentManager *)self delegate];
        [v23 contentManagerReloadData:self];
      }
    }
  }
}

- (void)_showPlaceholderArtwork
{
  albumArtwork = self->_albumArtwork;
  self->_albumArtwork = 0;

  double v4 = [(_MCDNowPlayingContentManager *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(_MCDNowPlayingContentManager *)self delegate];
    [v6 contentManagerReloadData:self];
  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  return 0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  return 0;
}

- (id)_requestResponseItem
{
  id v3 = [(_MCDNowPlayingContentManager *)self requestController];
  double v4 = [v3 response];
  char v5 = [v4 tracklist];
  id v6 = [v5 playingItemIndexPath];

  if (v6)
  {
    id v7 = [(_MCDNowPlayingContentManager *)self requestController];
    id v8 = [v7 response];
    char v9 = [v8 tracklist];
    id v10 = [v9 items];
    id v11 = [v10 itemAtIndexPath:v6];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)artistTextForNowPlayingController:(id)a3
{
  double v4 = [(_MCDNowPlayingContentManager *)self currentPlayingRadioStation];
  char v5 = [v4 attributionLabel];

  if (!v5)
  {
    id v7 = objc_opt_new();
    id v8 = [(_MCDNowPlayingContentManager *)self currentPlayingSong];
    char v9 = [v8 artist];
    id v10 = [v9 name];

    if ([v10 length]) {
      [v7 addObject:v10];
    }
    id v11 = [(_MCDNowPlayingContentManager *)self currentPlayingSong];
    double v12 = [v11 composer];
    double v13 = [v12 name];

    double v14 = [(_MCDNowPlayingContentManager *)self currentPlayingSong];
    if ([v14 shouldShowComposer])
    {
      uint64_t v15 = [v13 length];

      if (!v15)
      {
LABEL_9:
        if ([v7 count])
        {
          id v6 = [v7 componentsJoinedByString:@" — "];
        }
        else
        {
          id v6 = 0;
        }

        goto LABEL_13;
      }
      v16 = NSString;
      v17 = MCDCarDisplayBundle();
      char v18 = [v17 localizedStringForKey:@"COMPOSED_BY_TITLE" value:&stru_26F2DBB20 table:@"MusicCarDisplayUI"];
      double v14 = objc_msgSend(v16, "localizedStringWithFormat:", v18, v13);

      [v7 addObject:v14];
    }

    goto LABEL_9;
  }
  id v6 = v5;
LABEL_13:

  return v6;
}

- (id)albumTextForNowPlayingController:(id)a3
{
  id v3 = [(_MCDNowPlayingContentManager *)self currentPlayingSong];
  double v4 = [v3 album];
  char v5 = [v4 title];

  return v5;
}

- (id)titleForNowPlayingController:(id)a3
{
  id v3 = [(_MCDNowPlayingContentManager *)self currentPlayingSong];
  double v4 = [v3 title];
  char v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = MCDCarDisplayBundle();
    id v6 = [v7 localizedStringForKey:@"NOT_PLAYING_TITLE" value:&stru_26F2DBB20 table:@"MusicCarDisplayUI"];
  }
  return v6;
}

- (BOOL)nowPlayingViewControllerIsShowingExplicitTrack:(id)a3
{
  id v3 = [(_MCDNowPlayingContentManager *)self currentPlayingSong];
  char v4 = [v3 isExplicitSong];

  return v4;
}

- (id)progressBarLocalizedDurationStringForNowPlayingViewController:(id)a3
{
  id v3 = [(_MCDNowPlayingContentManager *)self _requestResponseItem];
  char v4 = v3;
  if (v3)
  {
    char v5 = [v3 localizedDurationString];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- ($04B05C73ED6AEEF31C5815932084562D)durationSnapshotForNowPlayingViewController:(SEL)a3
{
  char v5 = [(_MCDNowPlayingContentManager *)self _requestResponseItem];
  if (v5)
  {
    id v7 = v5;
    [v5 duration];
    char v5 = v7;
  }
  else
  {
    *(void *)&retstr->var7 = 0;
    *(_OWORD *)&retstr->var2 = 0u;
    *(_OWORD *)&retstr->var4 = 0u;
    *(_OWORD *)&retstr->var0 = 0u;
  }

  return result;
}

- (BOOL)nowPlayingViewControllerIsPlaying:(id)a3
{
  id v3 = [(_MCDNowPlayingContentManager *)self requestController];
  char v4 = [v3 response];
  BOOL v5 = [v4 state] == 2;

  return v5;
}

- (int64_t)shuffleTypeForNowPlayingViewController:(id)a3
{
  id v3 = [(_MCDNowPlayingContentManager *)self requestController];
  char v4 = [v3 response];
  BOOL v5 = [v4 tracklist];
  int64_t v6 = [v5 shuffleType];

  return v6;
}

- (int64_t)repeatTypeForNowPlayingViewController:(id)a3
{
  id v3 = [(_MCDNowPlayingContentManager *)self requestController];
  char v4 = [v3 response];
  BOOL v5 = [v4 tracklist];
  int64_t v6 = [v5 repeatType];

  return v6;
}

- (int64_t)placeholderTypeForNowPlayingViewController:(id)a3
{
  id v3 = [(_MCDNowPlayingContentManager *)self nowPlayingItem];
  char v4 = v3;
  if (v3)
  {
    [v3 duration];
    int64_t v5 = 4 * (v7 != 0);
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (BOOL)nowPlayingViewControllerCanShuffle:(id)a3
{
  id v3 = [(_MCDNowPlayingContentManager *)self requestController];
  char v4 = [v3 response];
  int64_t v5 = [v4 tracklist];
  int64_t v6 = [v5 shuffleCommand];
  BOOL v7 = v6 != 0;

  return v7;
}

- (void)nowPlayingViewControllerToggleShuffle:(id)a3
{
  id v8 = [(_MCDNowPlayingContentManager *)self requestController];
  char v4 = [v8 response];
  int64_t v5 = [v4 tracklist];
  int64_t v6 = [v5 shuffleCommand];
  BOOL v7 = [v6 advance];
  [(_MCDNowPlayingContentManager *)self _performChangeRequest:v7];
}

- (BOOL)nowPlayingViewControllerCanShowUpNext:(id)a3
{
  char v4 = [(_MCDNowPlayingContentManager *)self requestController];
  int64_t v5 = [v4 response];

  int64_t v6 = [v5 tracklist];
  BOOL v7 = [v6 items];
  unint64_t v8 = [v7 totalItemCount];

  if (v8 <= 1)
  {
    char v9 = MCDGeneralLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v10 = "Disabling up next queue; no items in queue.";
LABEL_12:
      _os_log_impl(&dword_23F140000, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 2u);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  id v11 = [(_MCDNowPlayingContentManager *)self nowPlayingItem];
  double v12 = v11;
  if (!v11)
  {
    uint64_t v20 = 0;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v17 = 0u;

LABEL_9:
    double v13 = [(_MCDNowPlayingContentManager *)self bundleID];
    int v14 = [v13 isEqualToString:@"com.apple.iBooks"];

    if (!v14)
    {
      BOOL v15 = 1;
      goto LABEL_14;
    }
    char v9 = MCDGeneralLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v10 = "Disabling up next queue for AudioBooks.";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  [v11 duration];

  if (!(_BYTE)v20) {
    goto LABEL_9;
  }
  char v9 = MCDGeneralLogging();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    id v10 = "Disabling up next queue; livestreaming content.";
    goto LABEL_12;
  }
LABEL_13:

  BOOL v15 = 0;
LABEL_14:

  return v15;
}

- (BOOL)nowPlayingViewControllerCanShowAlbumArt:(id)a3
{
  return self->_allowsAlbumArt;
}

- (BOOL)nowPlayingViewControllerCanShowAlbumLink:(id)a3
{
  return 0;
}

- (BOOL)nowPlayingViewControllerCanRepeat:(id)a3
{
  id v3 = [(_MCDNowPlayingContentManager *)self requestController];
  char v4 = [v3 response];
  int64_t v5 = [v4 tracklist];
  int64_t v6 = [v5 repeatCommand];
  BOOL v7 = v6 != 0;

  return v7;
}

- (void)nowPlayingViewControllerToggleRepeat:(id)a3
{
  id v8 = [(_MCDNowPlayingContentManager *)self requestController];
  char v4 = [v8 response];
  int64_t v5 = [v4 tracklist];
  int64_t v6 = [v5 repeatCommand];
  BOOL v7 = [v6 advance];
  [(_MCDNowPlayingContentManager *)self _performChangeRequest:v7];
}

- (BOOL)nowPlayingViewControllerCanShowChangePlaybackRate:(id)a3
{
  id v3 = [(_MCDNowPlayingContentManager *)self nowPlayingItem];
  char v4 = [v3 playbackRateCommand];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)nowPlayingViewControllerChangePlaybackRate:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_MCDNowPlayingContentManager *)self nowPlayingItem];
  int64_t v6 = [v5 playbackRateCommand];
  id v14 = [v6 supportedPlaybackRates];

  BOOL v7 = [(_MCDNowPlayingContentManager *)self nowPlayingViewControllerGetPlaybackRate:v4];

  uint64_t v8 = [v14 indexOfObject:v7];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v9 = (v8 + 1) % (unint64_t)[v14 count];
    id v10 = [(_MCDNowPlayingContentManager *)self nowPlayingItem];
    id v11 = [v10 playbackRateCommand];
    double v12 = [v14 objectAtIndexedSubscript:v9];
    [v12 floatValue];
    double v13 = objc_msgSend(v11, "setPlaybackRate:");
    [(_MCDNowPlayingContentManager *)self _performChangeRequest:v13];
  }
}

- (id)nowPlayingViewControllerGetPlaybackRate:(id)a3
{
  id v3 = NSNumber;
  id v4 = [(_MCDNowPlayingContentManager *)self nowPlayingItem];
  BOOL v5 = [v4 playbackRateCommand];
  [v5 preferredPlaybackRate];
  int64_t v6 = objc_msgSend(v3, "numberWithFloat:");

  return v6;
}

- (BOOL)nowPlayingViewControllerShouldUseMusicExplicitGlyph:(id)a3
{
  id v3 = [(_MCDNowPlayingContentManager *)self bundleID];
  char v4 = [v3 isEqualToString:@"com.apple.Music"];

  return v4;
}

- (void)_performChangeRequest:(id)a3
{
  if (a3) {
    [MEMORY[0x263F54808] performRequest:a3 options:0x10000 completion:0];
  }
}

- (BOOL)nowPlayingViewControllerIsRightHandDrive:(id)a3
{
  id v3 = [(_MCDNowPlayingContentManager *)self carSessionStatus];
  char v4 = [v3 currentSession];
  BOOL v5 = [v4 configuration];
  char v6 = [v5 rightHandDrive];

  return v6;
}

- (BOOL)nowPlayingViewControllerShouldHideBackButton:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  char v4 = [(_MCDNowPlayingContentManager *)self bundleID];
  char v5 = [v4 isEqualToString:@"com.apple.Music"];

  if (v5) {
    return 0;
  }
  BOOL v7 = MCDGeneralLogging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = [(_MCDNowPlayingContentManager *)self shouldHideBackButton];
    _os_log_impl(&dword_23F140000, v7, OS_LOG_TYPE_DEFAULT, "Hiding back button: %d", (uint8_t *)v8, 8u);
  }

  return [(_MCDNowPlayingContentManager *)self shouldHideBackButton];
}

- (BOOL)nowPlayingViewControllerShouldOverrideRightBarButtons:(id)a3
{
  return 1;
}

- (NSString)nowPlayingBundleID
{
  id v2 = [(_MCDNowPlayingContentManager *)self bundleID];
  id v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (Class)tableCellClass
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->tableCellClass);
  return (Class)WeakRetained;
}

- (BOOL)limitedUI
{
  return self->limitedUI;
}

- (void)setLimitedUI:(BOOL)a3
{
  self->limitedUI = a3;
}

- (MPModelSong)currentPlayingSong
{
  return self->currentPlayingSong;
}

- (void)setCurrentPlayingSong:(id)a3
{
}

- (MPModelPlaylistEntry)currentPlayingPlaylistEntry
{
  return self->currentPlayingPlaylistEntry;
}

- (void)setCurrentPlayingPlaylistEntry:(id)a3
{
}

- (MPModelPlaylist)currentPlayingPlaylist
{
  return self->currentPlayingPlaylist;
}

- (void)setCurrentPlayingPlaylist:(id)a3
{
}

- (MPModelRadioStation)currentPlayingRadioStation
{
  return self->currentPlayingRadioStation;
}

- (void)setCurrentPlayingRadioStation:(id)a3
{
}

- (BOOL)shouldHideBackButton
{
  return self->_shouldHideBackButton;
}

- (void)setShouldHideBackButton:(BOOL)a3
{
  self->_shouldHideBackButton = a3;
}

- (MCDNowPlayingContentManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MCDNowPlayingContentManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MPCPlayerResponse)lastReceivedResponse
{
  return self->_lastReceivedResponse;
}

- (void)setLastReceivedResponse:(id)a3
{
}

- (UITableView)tableView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  return (UITableView *)WeakRetained;
}

- (MPCPlayerResponseItem)nowPlayingItem
{
  return self->_nowPlayingItem;
}

- (void)setNowPlayingItem:(id)a3
{
}

- (void)setRequestController:(id)a3
{
}

- (UIImage)albumArtwork
{
  return self->_albumArtwork;
}

- (void)setAlbumArtwork:(id)a3
{
}

- (MPArtworkCatalog)artworkCatalog
{
  return self->_artworkCatalog;
}

- (void)setArtworkCatalog:(id)a3
{
}

- (void)setDataSource:(id)a3
{
}

- (void)setBundleID:(id)a3
{
}

- (CARSessionStatus)carSessionStatus
{
  return self->_carSessionStatus;
}

- (void)setCarSessionStatus:(id)a3
{
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
}

- (int64_t)playerState
{
  return self->_playerState;
}

- (void)setPlayerState:(int64_t)a3
{
  self->_playerState = a3;
}

- (NSMutableDictionary)artworkCache
{
  return self->_artworkCache;
}

- (void)setArtworkCache:(id)a3
{
}

- (MSVTimer)artworkTimer
{
  return self->_artworkTimer;
}

- (void)setArtworkTimer:(id)a3
{
}

- (BOOL)allowsAlbumArt
{
  return self->_allowsAlbumArt;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkTimer, 0);
  objc_storeStrong((id *)&self->_artworkCache, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_carSessionStatus, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_artworkCatalog, 0);
  objc_storeStrong((id *)&self->_albumArtwork, 0);
  objc_storeStrong((id *)&self->_requestController, 0);
  objc_storeStrong((id *)&self->_nowPlayingItem, 0);
  objc_destroyWeak((id *)&self->_tableView);
  objc_storeStrong((id *)&self->_lastReceivedResponse, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->currentPlayingRadioStation, 0);
  objc_storeStrong((id *)&self->currentPlayingPlaylist, 0);
  objc_storeStrong((id *)&self->currentPlayingPlaylistEntry, 0);
  objc_storeStrong((id *)&self->currentPlayingSong, 0);
  objc_destroyWeak((id *)&self->tableCellClass);
}

@end