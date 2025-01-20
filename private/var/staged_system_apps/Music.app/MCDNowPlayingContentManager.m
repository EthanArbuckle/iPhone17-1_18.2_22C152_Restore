@interface MCDNowPlayingContentManager
- ($04B05C73ED6AEEF31C5815932084562D)durationSnapshotForNowPlayingViewController:(SEL)a3;
- (BOOL)_allowsTasteActionsForGenericObject:(id)a3;
- (BOOL)_itemCanCreateRadioStation;
- (BOOL)_nowPlayingViewControllerIsFuseSubscriber;
- (BOOL)_showAddToLibraryOptions;
- (BOOL)_showStopForCenterTransportCommand;
- (BOOL)currentPlayingSongFoundIn:(id)a3;
- (BOOL)isAutoplaySectionAtIndex:(int64_t)a3;
- (BOOL)limitedUI;
- (BOOL)nowPlayingViewController:(id)a3 buttonShouldBeActive:(int64_t)a4;
- (BOOL)nowPlayingViewController:(id)a3 shouldDisplayButton:(int64_t)a4 withImage:(id *)a5 existingIdentifier:(id)a6 tinted:(BOOL *)a7;
- (BOOL)nowPlayingViewControllerCanRepeat:(id)a3;
- (BOOL)nowPlayingViewControllerCanShowAddToLibrary:(id)a3;
- (BOOL)nowPlayingViewControllerCanShowAlbumArt:(id)a3;
- (BOOL)nowPlayingViewControllerCanShowAlbumLink:(id)a3;
- (BOOL)nowPlayingViewControllerCanShowMore:(id)a3;
- (BOOL)nowPlayingViewControllerCanShowUpNext:(id)a3;
- (BOOL)nowPlayingViewControllerCanShuffle:(id)a3;
- (BOOL)nowPlayingViewControllerIsPlaying:(id)a3;
- (BOOL)nowPlayingViewControllerIsRightHandDrive:(id)a3;
- (BOOL)nowPlayingViewControllerIsShowingExplicitTrack:(id)a3;
- (BOOL)nowPlayingViewControllerShouldHideBackButton:(id)a3;
- (BOOL)nowPlayingViewControllerShouldOverrideRightBarButtons:(id)a3;
- (BOOL)nowPlayingViewControllerShouldUseMusicExplicitGlyph:(id)a3;
- (BOOL)seeking;
- (BOOL)shouldHideBackButton;
- (CARSessionStatus)carSessionStatus;
- (CPUIModernButton)autoplayButton;
- (CPUIModernButton)favoriteButton;
- (CPUIModernButton)sharePlayTogetherButton;
- (Class)tableCellClass;
- (MCDLibraryAddObserver)libraryAddObserver;
- (MCDNowPlayingContentManager)initWithDelegate:(id)a3 dataSource:(id)a4 bundleID:(id)a5;
- (MCDNowPlayingContentManagerDelegate)contentManagerDelegate;
- (MCDPlaybackManager)playbackManager;
- (MPArtworkCatalog)currentAttributionCatalog;
- (MPCPlayerResponseTracklist)tracklist;
- (MPModelAlbum)currentPlayingAlbum;
- (MPModelPlaylist)currentPlayingPlaylist;
- (MPModelPlaylistEntry)currentPlayingPlaylistEntry;
- (MPModelRadioStation)currentPlayingRadioStation;
- (MPModelSong)currentPlayingSong;
- (MPSectionedCollection)filteredItems;
- (MSVTimer)artworkTimer;
- (MusicAttributionMetadata)currentAttributionMetadata;
- (NSString)nowPlayingBundleID;
- (SiriDirectActionSource)siriDirectActionSource;
- (UIImage)currentAttributionImage;
- (UILabel)sharePlayTogetherPendingParticipantsLabel;
- (UITableView)tableView;
- (UIView)sharePlayTogetherPendingParticipantsView;
- (_MCDNowPlayingContentManager)impl;
- (_TtC5Music22CarPlayInformationView)noContentView;
- (double)preferredJumpIntervalForDirection:(int64_t)a3;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_radioCommandRequestWithCurrentPlayingSongWithViewController:(id)a3;
- (id)albumTextForNowPlayingController:(id)a3;
- (id)artistTextForNowPlayingController:(id)a3;
- (id)attributionArtworkForNowPlayingViewController:(id)a3;
- (id)attributionTitleForNowPlayingViewController:(id)a3;
- (id)backgroundArtForNowPlayingController:(id)a3;
- (id)customPlaybackControlButtonsForNowPlayingViewController:(id)a3;
- (id)delegate;
- (id)lastReceivedResponse;
- (id)nowPlayingItem;
- (id)progressBarLocalizedDurationStringForNowPlayingViewController:(id)a3;
- (id)sectionTypeAtIndex:(int64_t)a3;
- (id)skipIntervalButtonImageForInterval:(double)a3;
- (id)tableCellConfigurationBlock;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)titleForNowPlayingController:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)placeholderTypeForNowPlayingViewController:(id)a3;
- (int64_t)playerState;
- (int64_t)previousActionAtQueueEnd;
- (int64_t)repeatTypeForNowPlayingViewController:(id)a3;
- (int64_t)shuffleTypeForNowPlayingViewController:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_addItemsToLibrary;
- (void)_performChangeRequest:(id)a3;
- (void)_processResponse:(id)a3 error:(id)a4;
- (void)_subscriptionCapabilitiesChanged:(id)a3;
- (void)beginRequestObservation;
- (void)contentManager:(id)a3 bufferingItem:(BOOL)a4;
- (void)contentManager:(id)a3 displayItemIndex:(int64_t)a4 totalItemCount:(int64_t)a5;
- (void)contentManager:(id)a3 itemDidChange:(id)a4 response:(id)a5;
- (void)contentManager:(id)a3 presentViewController:(id)a4;
- (void)contentManager:(id)a3 processResponse:(id)a4 error:(id)a5;
- (void)contentManager:(id)a3 sectionName:(id)a4;
- (void)contentManager:(id)a3 shouldShowPlaybackQueue:(BOOL)a4;
- (void)contentManagerCompletedAllPlayback:(id)a3;
- (void)contentManagerInitiatedPlaybackFromPlaybackQueue:(id)a3;
- (void)contentManagerReloadData:(id)a3;
- (void)dealloc;
- (void)endRequestObservation;
- (void)nowPlayingViewController:(id)a3 didSelectButton:(id)a4;
- (void)nowPlayingViewController:(id)a3 didSendAction:(int64_t)a4 state:(int64_t)a5;
- (void)nowPlayingViewControllerAddToLibrary:(id)a3;
- (void)nowPlayingViewControllerAlbumArtistButtonTapped:(id)a3;
- (void)nowPlayingViewControllerAttributionButtonTapped:(id)a3;
- (void)nowPlayingViewControllerMore:(id)a3;
- (void)nowPlayingViewControllerToggleRepeat:(id)a3;
- (void)nowPlayingViewControllerToggleShuffle:(id)a3;
- (void)nowPlayingViewControllerUpNextButtonTapped:(id)a3;
- (void)performFavoriteChangeRequestFor:(id)a3 action:(int64_t)a4;
- (void)playbackManager:(id)a3 shouldShowError:(id)a4;
- (void)processArtworkForCurrentlyPlayingSong;
- (void)requestAndUpdateLibraryResponseForCurrentPlayingSongAlbum;
- (void)setArtworkTimer:(id)a3;
- (void)setAutoplayButton:(id)a3;
- (void)setCarSessionStatus:(id)a3;
- (void)setContentManagerDelegate:(id)a3;
- (void)setCurrentAttributionCatalog:(id)a3;
- (void)setCurrentAttributionImage:(id)a3;
- (void)setCurrentAttributionMetadata:(id)a3;
- (void)setCurrentPlayingAlbum:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFavoriteButton:(id)a3;
- (void)setFilteredItems:(id)a3;
- (void)setImpl:(id)a3;
- (void)setLastReceivedResponse:(id)a3;
- (void)setLibraryAddObserver:(id)a3;
- (void)setLimitedUI:(BOOL)a3;
- (void)setNoContentView:(id)a3;
- (void)setNowPlayingItem:(id)a3;
- (void)setPlaybackManager:(id)a3;
- (void)setPreviousActionAtQueueEnd:(int64_t)a3;
- (void)setSeeking:(BOOL)a3;
- (void)setSharePlayTogetherButton:(id)a3;
- (void)setSharePlayTogetherPendingParticipantsLabel:(id)a3;
- (void)setSharePlayTogetherPendingParticipantsView:(id)a3;
- (void)setShouldHideBackButton:(BOOL)a3;
- (void)setSiriDirectActionSource:(id)a3;
- (void)setTableCellClass:(Class)a3;
- (void)setTableCellConfigurationBlock:(id)a3;
- (void)setTableView:(id)a3;
- (void)setTracklist:(id)a3;
- (void)sharePlayTogetherButtonTapped;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateNoContentView;
- (void)updateNoContentViewFrameIfNeeded;
- (void)updateSharePlayTogetherState;
- (void)viewWillDisappear;
@end

@implementation MCDNowPlayingContentManager

- (MCDNowPlayingContentManager)initWithDelegate:(id)a3 dataSource:(id)a4 bundleID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)MCDNowPlayingContentManager;
  v11 = [(MCDNowPlayingContentManager *)&v29 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_contentManagerDelegate, v8);
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2050000000;
    v13 = (void *)qword_1010D6F80;
    uint64_t v34 = qword_1010D6F80;
    if (!qword_1010D6F80)
    {
      location[0] = _NSConcreteStackBlock;
      location[1] = (id)3221225472;
      location[2] = sub_100028F18;
      location[3] = &unk_100FC34A0;
      location[4] = &v31;
      sub_100028F18((uint64_t)location);
      v13 = (void *)v32[3];
    }
    v14 = v13;
    _Block_object_dispose(&v31, 8);
    v15 = (_MCDNowPlayingContentManager *)[[v14 alloc] initWithDelegate:v12 dataSource:v9 bundleID:v10];
    impl = v12->_impl;
    v12->_impl = v15;

    v17 = objc_alloc_init(MCDLibraryAddObserver);
    libraryAddObserver = v12->_libraryAddObserver;
    v12->_libraryAddObserver = v17;

    v19 = (CARSessionStatus *)[objc_alloc((Class)CARSessionStatus) initAndWaitUntilSessionUpdated];
    carSessionStatus = v12->_carSessionStatus;
    v12->_carSessionStatus = v19;

    [(MCDNowPlayingContentManager *)v12 setTableCellClass:objc_opt_class()];
    v21 = (SiriDirectActionSource *)[objc_alloc((Class)SiriDirectActionSource) initWithDelegate:0];
    siriDirectActionSource = v12->_siriDirectActionSource;
    v12->_siriDirectActionSource = v21;

    v23 = +[NSNotificationCenter defaultCenter];
    [v23 addObserver:v12 selector:"_subscriptionCapabilitiesChanged:" name:@"MusicCarPlayApplicationCapabilitiesControllerSubscriptionCapabilitiesDidChangeNotification" object:0];

    if (_os_feature_enabled_impl())
    {
      v24 = +[NSNotificationCenter defaultCenter];
      v25 = +[MCDSharePlayTogetherViewModel notificationName];
      [v24 addObserver:v12 selector:"updateSharePlayTogetherState" name:v25 object:0];

      [(MCDNowPlayingContentManager *)v12 updateSharePlayTogetherState];
    }
    objc_initWeak(location, v12);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000A7904;
    v27[3] = &unk_100FC3628;
    objc_copyWeak(&v28, location);
    [(MCDLibraryAddObserver *)v12->_libraryAddObserver setUpdateBlock:v27];
    objc_destroyWeak(&v28);
    objc_destroyWeak(location);
  }

  return v12;
}

- (void)updateSharePlayTogetherState
{
  id v65 = +[UIApplication sharePlayTogetherObjCViewModel];
  if (v65)
  {
    v3 = [(MCDNowPlayingContentManager *)self sharePlayTogetherButton];

    if (v3)
    {
      v4 = [(MCDNowPlayingContentManager *)self sharePlayTogetherButton];
      v5 = [v4 configuration];
    }
    else
    {
      v4 = objc_opt_new();
      [v4 setFrame:CGRectMake(0.0, 0.0, 48.0, 26.0)];
      v5 = +[UIButtonConfiguration plainButtonConfiguration];
      v7 = +[UIColor clearColor];
      id v8 = [v5 background];
      [v8 setBackgroundColor:v7];

      [v5 setImagePadding:3.0];
      id v9 = +[UIColor labelColor];
      [v5 setBaseForegroundColor:v9];

      id v10 = +[UIImage systemImageNamed:@"shareplay"];
      [v5 setImage:v10];

      v11 = +[UIImageSymbolConfiguration configurationWithScale:2];
      [v5 setPreferredSymbolConfigurationForImage:v11];

      [v5 setTitleTextAttributesTransformer:&stru_100FC3FD8];
      [v4 addTarget:self action:"sharePlayTogetherButtonTapped" forControlEvents:64];
      [(MCDNowPlayingContentManager *)self setSharePlayTogetherButton:v4];
    }

    if ((uint64_t)[v65 connectedParticipantsCount] < 1)
    {
      [v5 setContentInsets:3.0, 4.0, 3.0, 4.0];
      [v5 setTitle:0];
    }
    else
    {
      [v5 setContentInsets:3.0, 4.0, 3.0, 6.0];
      v12 = +[UIApplication sharePlayTogetherObjCViewModel];
      v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%ld", [v12 connectedParticipantsCount]);
      [v5 setTitle:v13];
    }
    v14 = [v5 title];
    v15 = [(MCDNowPlayingContentManager *)self sharePlayTogetherButton];
    v16 = [v15 titleLabel];
    [v16 setHidden:v14 == 0];

    v17 = [(MCDNowPlayingContentManager *)self sharePlayTogetherButton];
    [v17 setConfiguration:v5];

    v18 = [(MCDNowPlayingContentManager *)self sharePlayTogetherButton];
    [v18 sizeToFit];

    v19 = [(MCDNowPlayingContentManager *)self sharePlayTogetherButton];
    [v19 sizeThatFits:INFINITY, 26.0];
    double v21 = v20;
    double v23 = v22;

    if (v21 < 48.0) {
      double v21 = 48.0;
    }
    v24 = [(MCDNowPlayingContentManager *)self sharePlayTogetherButton];
    [v24 setFrame:0.0, 0.0, v21, v23];

    id v25 = objc_alloc((Class)UIBarButtonItem);
    v26 = [(MCDNowPlayingContentManager *)self sharePlayTogetherButton];
    id v27 = [v25 initWithCustomView:v26];
    id v28 = +[NSMutableArray arrayWithObject:v27];

    if ((uint64_t)[v65 pendingParticipantsCount] >= 1)
    {
      objc_super v29 = [(MCDNowPlayingContentManager *)self sharePlayTogetherPendingParticipantsView];

      if (!v29)
      {
        v30 = objc_opt_new();
        id v31 = [objc_alloc((Class)UIView) initWithFrame:0.0, 10.5, 5.0, 5.0];
        v32 = [v31 layer];
        [v32 setCornerRadius:2.5];

        uint64_t v33 = +[UIColor systemCyanColor];
        [v31 setBackgroundColor:v33];

        [v30 addSubview:v31];
        id v34 = [objc_alloc((Class)UILabel) initWithFrame:8.0, 0.0, 0.0, 26.0];
        v35 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleCaption2 weight:UIFontWeightMedium];
        [v34 setFont:v35];

        [v30 addSubview:v34];
        [(MCDNowPlayingContentManager *)self setSharePlayTogetherPendingParticipantsView:v30];
        [(MCDNowPlayingContentManager *)self setSharePlayTogetherPendingParticipantsLabel:v34];
      }
      v36 = sub_1000A8E64();
      v37 = [v36 localizedStringForKey:@"%ld Pending" value:&stru_101023248 table:@"MusicCarDisplayUI"];
      v38 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v37, [v65 pendingParticipantsCount]);
      v39 = [(MCDNowPlayingContentManager *)self sharePlayTogetherPendingParticipantsLabel];
      [v39 setText:v38];

      v40 = [(MCDNowPlayingContentManager *)self sharePlayTogetherPendingParticipantsLabel];
      [v40 sizeToFit];

      v41 = [(MCDNowPlayingContentManager *)self sharePlayTogetherPendingParticipantsLabel];
      [v41 frame];
      double MinX = CGRectGetMinX(v67);
      v43 = [(MCDNowPlayingContentManager *)self sharePlayTogetherPendingParticipantsLabel];
      [v43 frame];
      double v44 = (26.0 - CGRectGetHeight(v68)) * 0.5;
      v45 = [(MCDNowPlayingContentManager *)self sharePlayTogetherPendingParticipantsLabel];
      [v45 frame];
      double Width = CGRectGetWidth(v69);
      v47 = [(MCDNowPlayingContentManager *)self sharePlayTogetherPendingParticipantsLabel];
      [v47 frame];
      double Height = CGRectGetHeight(v70);
      v49 = [(MCDNowPlayingContentManager *)self sharePlayTogetherPendingParticipantsLabel];
      [v49 setFrame:MinX, v44, Width, Height];

      v50 = [(MCDNowPlayingContentManager *)self sharePlayTogetherPendingParticipantsLabel];
      [v50 frame];
      double MaxX = CGRectGetMaxX(v71);
      v52 = [(MCDNowPlayingContentManager *)self sharePlayTogetherPendingParticipantsView];
      [v52 setFrame:0.0, 0.0, MaxX, 26.0];

      id v53 = objc_alloc((Class)UIBarButtonItem);
      v54 = [(MCDNowPlayingContentManager *)self sharePlayTogetherPendingParticipantsView];
      id v55 = [v53 initWithCustomView:v54];

      [v28 addObject:v55];
    }
    v56 = [(MCDNowPlayingContentManager *)self contentManagerDelegate];
    [v56 contentManager:self->_impl setAdditionalBarButtonItems:v28];

    v57 = [(MCDNowPlayingContentManager *)self tableView];
    [v57 reloadData];
  }
  else
  {
    [(MCDNowPlayingContentManager *)self setSharePlayTogetherButton:0];
    v6 = [(MCDNowPlayingContentManager *)self contentManagerDelegate];
    [v6 contentManager:self->_impl setAdditionalBarButtonItems:&__NSArray0__struct];

    v5 = [(MCDNowPlayingContentManager *)self contentManagerDelegate];
    [v5 contentManagerReloadData:self->_impl];
  }

  v58 = [(MCDNowPlayingContentManager *)self tracklist];
  v59 = [v58 playingItemIndexPath];

  if (v59)
  {
    v60 = [(MCDNowPlayingContentManager *)self lastReceivedResponse];
    v61 = [(MCDNowPlayingContentManager *)self tracklist];
    v62 = [v61 items];
    v63 = [v62 itemAtIndexPath:v59];
    v64 = [v60 attributionMetadataFor:v63];
    [(MCDNowPlayingContentManager *)self setCurrentAttributionMetadata:v64];
  }
  else
  {
    [(MCDNowPlayingContentManager *)self setCurrentAttributionMetadata:0];
  }
}

- (MCDNowPlayingContentManagerDelegate)contentManagerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentManagerDelegate);

  return (MCDNowPlayingContentManagerDelegate *)WeakRetained;
}

- (MPCPlayerResponseTracklist)tracklist
{
  return self->_tracklist;
}

- (void)setSharePlayTogetherButton:(id)a3
{
}

- (void)setCurrentAttributionMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_currentAttributionMetadata, a3);
  id v5 = a3;
  v6 = [v5 artworkCatalog];

  [(MCDNowPlayingContentManager *)self setCurrentAttributionCatalog:v6];
  id v8 = [(MCDNowPlayingContentManager *)self delegate];
  v7 = [(MCDNowPlayingContentManager *)self impl];
  [v8 contentManagerReloadData:v7];
}

- (void)setCurrentAttributionCatalog:(id)a3
{
  id v5 = a3;
  if (([v5 isArtworkVisuallyIdenticalToCatalog:self->_currentAttributionCatalog] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_currentAttributionCatalog, a3);
    [(MCDNowPlayingContentManager *)self setCurrentAttributionImage:0];
    v6 = +[UITraitCollection currentTraitCollection];
    [v6 displayScale];
    [v5 setDestinationScale:];

    [v5 setFittingSize:30.0, 30.0];
    v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    [v5 setCacheIdentifier:v8 forCacheReference:self];

    objc_initWeak(&location, self);
    objc_initWeak(&from, v5);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000A84B4;
    v13[3] = &unk_100FC3E60;
    objc_copyWeak(&v14, &location);
    objc_copyWeak(&v15, &from);
    id v9 = +[MSVTimer timerWithInterval:0 repeats:v13 block:2.0];
    [(MCDNowPlayingContentManager *)self setArtworkTimer:v9];

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000A854C;
    v10[3] = &unk_100FC3EB0;
    objc_copyWeak(&v11, &location);
    objc_copyWeak(&v12, &from);
    [v5 setDestination:self configurationBlock:v10];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

- (void)setCurrentAttributionImage:(id)a3
{
}

- (void)setArtworkTimer:(id)a3
{
}

- (_MCDNowPlayingContentManager)impl
{
  return self->_impl;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentManagerDelegate);

  return WeakRetained;
}

- (void)setTableCellClass:(Class)a3
{
}

- (void)dealloc
{
  v3 = [(MCDNowPlayingContentManager *)self siriDirectActionSource];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)MCDNowPlayingContentManager;
  [(MCDNowPlayingContentManager *)&v4 dealloc];
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  id v5 = (UITableView *)a3;
  if (self->_tableView != v5)
  {
    id v8 = v5;
    [(_MCDNowPlayingContentManager *)self->_impl setTableView:v5];
    objc_storeStrong((id *)&self->_tableView, a3);
    v6 = [(MCDNowPlayingContentManager *)self tableCellClass];
    v7 = NSStringFromClass([(MCDNowPlayingContentManager *)self tableCellClass]);
    [(UITableView *)v8 registerClass:v6 forCellReuseIdentifier:v7];

    [(UITableView *)v8 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"autoplay"];
    [(UITableView *)v8 setDelegate:self];
    [(UITableView *)v8 setDataSource:self];
    [(UITableView *)v8 setRowHeight:UITableViewAutomaticDimension];
    [(UITableView *)v8 setEstimatedRowHeight:UITableViewAutomaticDimension];
    [(UITableView *)v8 _setHeaderAndFooterViewsFloat:0];
    [(UITableView *)v8 reloadData];
    [(MCDNowPlayingContentManager *)self updateNoContentView];
    id v5 = v8;
  }
}

- (void)beginRequestObservation
{
}

- (void)endRequestObservation
{
}

- (void)viewWillDisappear
{
}

- (void)_processResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v45 = a4;
  v7 = [v6 tracklist];
  [(MCDNowPlayingContentManager *)self setTracklist:v7];

  id v8 = [(MCDNowPlayingContentManager *)self tracklist];
  id v9 = [v8 displayItems];
  v50[0] = MPCPlayerResponseTracklistDisplaySectionUpNextItems;
  v50[1] = MPCPlayerResponseTracklistDisplaySectionNextItems;
  v50[2] = MPCPlayerResponseTracklistDisplaySectionAutoPlayItems;
  id v10 = +[NSArray arrayWithObjects:v50 count:3];
  id v11 = [v9 filteredWithSections:v10];
  [(MCDNowPlayingContentManager *)self setFilteredItems:v11];

  [(MCDNowPlayingContentManager *)self requestAndUpdateLibraryResponseForCurrentPlayingSongAlbum];
  id v12 = [(MCDNowPlayingContentManager *)self libraryAddObserver];
  v13 = [(MCDNowPlayingContentManager *)self tracklist];
  [v12 updateRequestForTracklist:v13];

  id v14 = [(MCDNowPlayingContentManager *)self tracklist];
  id v15 = [v14 playingItemIndexPath];

  if (v15)
  {
    v16 = [(MCDNowPlayingContentManager *)self tracklist];
    v17 = [v16 items];
    v18 = [v17 itemAtIndexPath:v15];
    v19 = [v6 attributionMetadataFor:v18];
    [(MCDNowPlayingContentManager *)self setCurrentAttributionMetadata:v19];

    double v20 = [(MCDNowPlayingContentManager *)self tracklist];
    double v21 = [v20 items];
    double v22 = [v21 sectionAtIndex:[v15 section]];

    double v23 = [v22 metadataObject];
    if ([v23 type] == (id)13)
    {
      v24 = [v23 radioStation];
      id v25 = [v24 name];
      v26 = [(MCDNowPlayingContentManager *)self currentPlayingSong];
      id v27 = [v26 title];
      unsigned __int8 v28 = [v25 isEqualToString:v27];

      if ((v28 & 1) == 0)
      {
        objc_super v29 = [(MCDNowPlayingContentManager *)self delegate];
        char v30 = objc_opt_respondsToSelector();

        if (v30)
        {
          id v31 = sub_1000A802C();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            v32 = [v23 radioStation];
            uint64_t v33 = [v32 name];
            LODWORD(buf) = 138543362;
            *(void *)((char *)&buf + 4) = v33;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Setting radio station: %{public}@", (uint8_t *)&buf, 0xCu);
          }
          id v34 = [(MCDNowPlayingContentManager *)self delegate];
          impl = self->_impl;
          v36 = [v23 radioStation];
          v37 = [v36 name];
          [v34 contentManager:impl sectionName:v37];
        }
      }
    }
  }
  else
  {
    [(MCDNowPlayingContentManager *)self setCurrentAttributionMetadata:0];
  }
  id v38 = [v6 state];
  if (v38 != (id)[(MCDNowPlayingContentManager *)self playerState])
  {
    self->_playerState = (int64_t)v38;
    v39 = +[NSNotificationCenter defaultCenter];
    uint64_t v46 = 0;
    v47 = &v46;
    uint64_t v48 = 0x2020000000;
    v40 = (void *)qword_1010D6F98;
    uint64_t v49 = qword_1010D6F98;
    if (!qword_1010D6F98)
    {
      *(void *)&long long buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472;
      v52 = sub_1000AD608;
      id v53 = &unk_100FC34A0;
      v54 = &v46;
      v41 = (void *)sub_100029F70();
      v42 = dlsym(v41, "MCDPlaybackStateChangedNotification");
      *(void *)(v54[1] + 24) = v42;
      qword_1010D6F98 = *(void *)(v54[1] + 24);
      v40 = (void *)v47[3];
    }
    _Block_object_dispose(&v46, 8);
    if (!v40)
    {
      sub_100D691B8();
      __break(1u);
    }
    [v39 postNotificationName:*v40 object:0];
  }
  v43 = [(MCDNowPlayingContentManager *)self tableView];

  if (v43)
  {
    double v44 = [(MCDNowPlayingContentManager *)self tableView];
    [v44 reloadData];

    [(MCDNowPlayingContentManager *)self updateNoContentView];
  }
}

- (void)updateNoContentView
{
  if (!_os_feature_enabled_impl()) {
    return;
  }
  v3 = [(MCDNowPlayingContentManager *)self filteredItems];
  if ([v3 totalItemCount])
  {

LABEL_5:
    id v5 = [(MCDNowPlayingContentManager *)self tableView];
    [v5 setBackgroundView:0];

    [(MCDNowPlayingContentManager *)self setNoContentView:0];
    return;
  }
  objc_super v4 = [(MCDNowPlayingContentManager *)self currentPlayingRadioStation];

  if (v4) {
    goto LABEL_5;
  }
  id v6 = [(MCDNowPlayingContentManager *)self noContentView];

  if (!v6)
  {
    id v32 = (id)objc_opt_new();
    [v32 setAutoresizingMask:18];
    v7 = [(MCDNowPlayingContentManager *)self tableView];
    [v7 frame];
    [v32 setFrame:];

    id v8 = [(MCDNowPlayingContentManager *)self tableView];
    [v8 setBackgroundView:v32];

    id v9 = +[NSBundle mainBundle];
    id v10 = [v9 localizedStringForKey:@"There’s no music in the queue." value:&stru_101023248 table:0];
    id v11 = +[CarPlayInformationView noContentWithTitle:v10 subtitle:0 buttonText:0 buttonAction:0];
    [(MCDNowPlayingContentManager *)self setNoContentView:v11];

    id v12 = [(MCDNowPlayingContentManager *)self noContentView];
    [v12 setAutoresizingMask:18];

    [v32 bounds];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v21 = [(MCDNowPlayingContentManager *)self tableView];
    [v21 safeAreaInsets];
    double v23 = v14 + v22;
    double v25 = v16 + v24;
    double v27 = v18 - (v22 + v26);
    double v29 = v20 - (v24 + v28);
    char v30 = [(MCDNowPlayingContentManager *)self noContentView];
    [v30 setFrame:v23, v25, v27, v29];

    id v31 = [(MCDNowPlayingContentManager *)self noContentView];
    [v32 addSubview:v31];
  }
}

- (void)updateNoContentViewFrameIfNeeded
{
  id v22 = [(MCDNowPlayingContentManager *)self tableView];
  v3 = [v22 backgroundView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = [(MCDNowPlayingContentManager *)self tableView];
  [v12 safeAreaInsets];
  double v14 = v5 + v13;
  double v16 = v7 + v15;
  double v18 = v9 - (v13 + v17);
  double v20 = v11 - (v15 + v19);
  double v21 = [(MCDNowPlayingContentManager *)self noContentView];
  [v21 setFrame:v14, v16, v18, v20];
}

- (void)_subscriptionCapabilitiesChanged:(id)a3
{
  id v4 = [(MCDNowPlayingContentManager *)self delegate];
  [v4 contentManagerReloadData:self->_impl];
}

- (BOOL)isAutoplaySectionAtIndex:(int64_t)a3
{
  double v5 = [(MCDNowPlayingContentManager *)self filteredItems];
  id v6 = [v5 numberOfSections];

  if ((uint64_t)v6 <= a3) {
    return 0;
  }
  double v7 = [(MCDNowPlayingContentManager *)self filteredItems];
  double v8 = [v7 sectionAtIndex:a3];
  unsigned __int8 v9 = [v8 isEqualToString:MPCPlayerResponseTracklistDisplaySectionAutoPlayItems];

  return v9;
}

- (id)sectionTypeAtIndex:(int64_t)a3
{
  double v5 = [(MCDNowPlayingContentManager *)self filteredItems];
  id v6 = [v5 numberOfSections];

  if ((uint64_t)v6 <= a3)
  {
    id v8 = MPCPlayerResponseTracklistDisplaySectionNextItems;
  }
  else
  {
    double v7 = [(MCDNowPlayingContentManager *)self filteredItems];
    id v8 = [v7 sectionAtIndex:a3];
  }

  return v8;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if ([(MCDNowPlayingContentManager *)self limitedUI]) {
    return 1;
  }
  double v5 = [(MCDNowPlayingContentManager *)self filteredItems];
  id v6 = [v5 numberOfSections];

  return (int64_t)v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = [(MCDNowPlayingContentManager *)self filteredItems];
  id v7 = [v6 numberOfSections];

  if ((uint64_t)v7 <= a4) {
    return 0;
  }
  id v8 = [(MCDNowPlayingContentManager *)self filteredItems];
  int64_t v9 = (int64_t)[v8 numberOfItemsInSection:a4];

  unsigned int v10 = [(MCDNowPlayingContentManager *)self limitedUI];
  int64_t v11 = 12;
  if (v9 < 12) {
    int64_t v11 = v9;
  }
  if (v10) {
    return v11;
  }
  else {
    return v9;
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(objc_class *)[(MCDNowPlayingContentManager *)self tableCellClass] cellForTableView:v6 indexPath:v7];
  int64_t v9 = [(MCDNowPlayingContentManager *)self filteredItems];
  unsigned int v10 = [v9 itemAtIndexPath:v7];

  int64_t v11 = [(MCDNowPlayingContentManager *)self tableCellConfigurationBlock];

  if (v11)
  {
    id v12 = [(MCDNowPlayingContentManager *)self tableCellConfigurationBlock];
    double v13 = [v10 metadataObject];
    double v14 = [(MCDNowPlayingContentManager *)self lastReceivedResponse];
    double v15 = [v14 attributionMetadataFor:v10];
    ((void (**)(void, void *, void *, id, void *))v12)[2](v12, v8, v13, v6, v15);
  }

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  if (_os_feature_enabled_impl()) {
    return UITableViewAutomaticDimension;
  }
  unsigned int v7 = [(MCDNowPlayingContentManager *)self isAutoplaySectionAtIndex:a4];
  double result = UITableViewAutomaticDimension;
  if (!v7) {
    return 0.0;
  }
  return result;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  unsigned int v7 = [(MCDNowPlayingContentManager *)self tableView:v6 titleForHeaderInSection:a4];
  if (v7)
  {
    id v8 = objc_alloc((Class)NSAttributedString);
    v16[0] = NSFontAttributeName;
    int64_t v9 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleCaption1 variant:1024];
    v17[0] = v9;
    v16[1] = NSForegroundColorAttributeName;
    unsigned int v10 = +[UIColor _carSystemSecondaryColor];
    v17[1] = v10;
    int64_t v11 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
    id v12 = [v8 initWithString:v7 attributes:v11];

    double v13 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:@"autoplay"];
    double v14 = +[UIListContentConfiguration plainHeaderConfiguration];
    [v14 setAttributedText:v12];
    [v13 setContentConfiguration:v14];
  }
  else
  {
    double v13 = 0;
  }

  return v13;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (_os_feature_enabled_impl())
  {
    id v6 = [(MCDNowPlayingContentManager *)self sectionTypeAtIndex:a4];
    if ([v6 isEqualToString:MPCPlayerResponseTracklistDisplaySectionNextItems])
    {
      unsigned int v7 = +[NSBundle mainBundle];
      id v8 = v7;
      CFStringRef v9 = @"Continue Playing";
    }
    else if ([v6 isEqualToString:MPCPlayerResponseTracklistDisplaySectionUpNextItems])
    {
      unsigned int v7 = +[NSBundle mainBundle];
      id v8 = v7;
      CFStringRef v9 = @"Queue";
    }
    else
    {
      if (![v6 isEqualToString:MPCPlayerResponseTracklistDisplaySectionAutoPlayItems])
      {
        unsigned int v10 = 0;
        goto LABEL_9;
      }
      unsigned int v7 = +[NSBundle mainBundle];
      id v8 = v7;
      if (a4) {
        CFStringRef v9 = @"Autoplaying";
      }
      else {
        CFStringRef v9 = @"Autoplaying similar music";
      }
    }
    unsigned int v10 = [v7 localizedStringForKey:v9 value:&stru_101023248 table:0];

LABEL_9:
    goto LABEL_11;
  }
  if ([(MCDNowPlayingContentManager *)self isAutoplaySectionAtIndex:a4])
  {
    id v6 = sub_1000A8E64();
    unsigned int v10 = [v6 localizedStringForKey:@"AUTOPLAY_SECTION_TITLE" value:&stru_101023248 table:@"MusicCarDisplayUI"];
    goto LABEL_9;
  }
  unsigned int v10 = 0;
LABEL_11:

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v14 = a4;
  double v5 = [(MCDNowPlayingContentManager *)self tableView];
  id v6 = [v5 cellForRowAtIndexPath:v14];

  if (([v6 isContentUnavailable] & 1) == 0)
  {
    unsigned int v7 = [(MCDNowPlayingContentManager *)self playbackManager];
    id v8 = [(MCDNowPlayingContentManager *)self tracklist];
    CFStringRef v9 = [v8 changeItemCommand];
    unsigned int v10 = [(MCDNowPlayingContentManager *)self filteredItems];
    int64_t v11 = [v10 itemAtIndexPath:v14];
    id v12 = [v9 changeToItem:v11];
    [v7 performPlaybackRequestWithCommand:v12];
  }
  double v13 = [(MCDNowPlayingContentManager *)self tableView];
  [v13 deselectRowAtIndexPath:v14 animated:1];
}

- (void)playbackManager:(id)a3 shouldShowError:(id)a4
{
  double v5 = sub_1000A8E64();
  id v6 = [v5 localizedStringForKey:@"ADD_STATION_FAILED_ALERT_TITLE" value:&stru_101023248 table:@"MusicCarDisplayUI"];
  unsigned int v7 = sub_1000A8E64();
  id v8 = [v7 localizedStringForKey:@"ADD_STATION_FAILED_ALERT_MESSAGE" value:&stru_101023248 table:@"MusicCarDisplayUI"];
  id v14 = +[UIAlertController alertControllerWithTitle:v6 message:v8 preferredStyle:1];

  uint64_t v9 = +[NSBundle mainBundle];
  unsigned int v10 = [(id)v9 localizedStringForKey:@"OK" value:&stru_101023248 table:0];
  int64_t v11 = +[UIAlertAction actionWithTitle:v10 style:1 handler:0];

  [v14 addAction:v11];
  id v12 = [(MCDNowPlayingContentManager *)self delegate];
  LOBYTE(v9) = objc_opt_respondsToSelector();

  if (v9)
  {
    double v13 = [(MCDNowPlayingContentManager *)self delegate];
    [v13 contentManager:self->_impl presentViewController:v14];
  }
}

- (double)preferredJumpIntervalForDirection:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 2)
  {
    v3 = [(MCDNowPlayingContentManager *)self nowPlayingItem];
    id v4 = [v3 seekCommand];
    double v5 = [v4 preferredForwardJumpIntervals];
    goto LABEL_5;
  }
  if ((unint64_t)(a3 + 2) <= 1)
  {
    v3 = [(MCDNowPlayingContentManager *)self nowPlayingItem];
    id v4 = [v3 seekCommand];
    double v5 = [v4 preferredBackwardJumpIntervals];
LABEL_5:
    id v6 = v5;
    unsigned int v7 = [v5 firstObject];
    [v7 doubleValue];
    double v9 = v8;

    return v9;
  }
  return 0.0;
}

- (id)skipIntervalButtonImageForInterval:(double)a3
{
  id v4 = @"gobackward";
  if (a3 > 0.0) {
    id v4 = @"goforward";
  }
  double v5 = v4;
  id v6 = +[NSNumber numberWithDouble:fabs(a3)];
  unsigned int v7 = +[NSString stringWithFormat:@"%@.%@", v5, v6];

  double v8 = +[UIImage systemImageNamed:v7];
  double v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = +[UIImage systemImageNamed:v5];
  }
  int64_t v11 = v10;

  return v11;
}

- (id)customPlaybackControlButtonsForNowPlayingViewController:(id)a3
{
  id v4 = a3;
  double v5 = [(MCDNowPlayingContentManager *)self autoplayButton];

  if (!v5)
  {
    id v6 = objc_opt_new();
    [(MCDNowPlayingContentManager *)self setAutoplayButton:v6];

    unsigned int v7 = +[UIImage _systemImageNamed:@"infinity"];
    double v8 = +[UIImageSymbolConfiguration configurationWithPointSize:6 weight:12.0];
    double v9 = [v7 imageWithSymbolConfiguration:v8];

    id v10 = [(MCDNowPlayingContentManager *)self autoplayButton];
    [v10 setImage:v9 forState:0];

    int64_t v11 = [(MCDNowPlayingContentManager *)self autoplayButton];
    id v12 = +[UIColor labelColor];
    double v13 = [v12 colorWithAlphaComponent:0.2];
    id v14 = [v9 imageWithTintColor:v13];
    [v11 setImage:v14 forState:1];

    double v15 = [(MCDNowPlayingContentManager *)self autoplayButton];
    double v16 = [v15 imageView];
    [v16 setContentMode:1];

    double v17 = [(MCDNowPlayingContentManager *)self autoplayButton];
    [v17 setShouldStaySelected:1];

    double v18 = sub_1000A8E64();
    double v19 = [v18 localizedStringForKey:@"ACCESSIBILITY_AUTOPLAY" value:&stru_101023248 table:@"MusicCarDisplayUI"];
    v85[0] = v19;
    double v20 = sub_1000A8E64();
    double v21 = [v20 localizedStringForKey:@"ACCESSIBILITY_INFINITY" value:&stru_101023248 table:@"MusicCarDisplayUI"];
    v85[1] = v21;
    id v22 = +[NSArray arrayWithObjects:v85 count:2];
    double v23 = [(MCDNowPlayingContentManager *)self autoplayButton];
    [v23 setAccessibilityUserInputLabels:v22];
  }
  double v24 = [(MCDNowPlayingContentManager *)self tracklist];
  double v25 = [v24 actionAtQueueEndCommand];
  double v26 = [v25 supportedActions];
  double v27 = +[NSNumber numberWithInteger:3];
  unsigned int v28 = [v26 containsObject:v27];

  double v29 = [(MCDNowPlayingContentManager *)self autoplayButton];
  char v30 = v29;
  if (v28)
  {
    [v29 setHidden:0];

    id v31 = [(MCDNowPlayingContentManager *)self tracklist];
    id v32 = [v31 actionAtQueueEnd];

    if ((id)[(MCDNowPlayingContentManager *)self previousActionAtQueueEnd] != v32)
    {
      uint64_t v33 = [(MCDNowPlayingContentManager *)self autoplayButton];
      [v33 setSelected:v32 == (id)3];

      [(MCDNowPlayingContentManager *)self setPreviousActionAtQueueEnd:v32];
    }
  }
  else
  {
    [v29 setHidden:1];
  }
  id v34 = [(MCDNowPlayingContentManager *)self favoriteButton];

  if (!v34)
  {
    v35 = objc_opt_new();
    [(MCDNowPlayingContentManager *)self setFavoriteButton:v35];

    v36 = +[UIImage _systemImageNamed:@"star"];
    v37 = +[UIImageSymbolConfiguration configurationWithPointSize:6 weight:16.0];
    id v38 = [v36 imageWithSymbolConfiguration:v37];

    v39 = [(MCDNowPlayingContentManager *)self favoriteButton];
    [v39 setImage:v38 forState:0];

    v40 = [(MCDNowPlayingContentManager *)self favoriteButton];
    v41 = +[UIColor labelColor];
    v42 = [v41 colorWithAlphaComponent:0.2];
    v43 = [v38 imageWithTintColor:v42];
    [v40 setImage:v43 forState:1];

    double v44 = [(MCDNowPlayingContentManager *)self favoriteButton];
    id v45 = +[UIColor labelColor];
    uint64_t v46 = [v45 colorWithAlphaComponent:0.2];
    v47 = [v38 imageWithTintColor:v46];
    [v44 setImage:v47 forState:8];

    uint64_t v48 = +[UIImage _systemImageNamed:@"star.fill"];
    uint64_t v49 = +[UIImageSymbolConfiguration configurationWithPointSize:6 weight:16.0];
    v50 = [v48 imageWithSymbolConfiguration:v49];

    v51 = [(MCDNowPlayingContentManager *)self favoriteButton];
    [v51 setImage:v50 forState:4];

    v52 = [(MCDNowPlayingContentManager *)self favoriteButton];
    id v53 = +[UIColor labelColor];
    v54 = [v53 colorWithAlphaComponent:0.2];
    id v55 = [v50 imageWithTintColor:v54];
    [v52 setImage:v55 forState:5];

    v56 = [(MCDNowPlayingContentManager *)self favoriteButton];
    v57 = +[UIColor labelColor];
    v58 = [v57 colorWithAlphaComponent:0.2];
    v59 = [v50 imageWithTintColor:v58];
    [v56 setImage:v59 forState:12];

    v60 = [(MCDNowPlayingContentManager *)self favoriteButton];
    v61 = [v60 imageView];
    [v61 setContentMode:1];

    v62 = sub_1000A8E64();
    v63 = [v62 localizedStringForKey:@"ACCESSIBILITY_FAVORITE" value:&stru_101023248 table:@"MusicCarDisplayUI"];
    v84[0] = v63;
    v64 = sub_1000A8E64();
    id v65 = [v64 localizedStringForKey:@"ACCESSIBILITY_STAR" value:&stru_101023248 table:@"MusicCarDisplayUI"];
    v84[1] = v65;
    v66 = +[NSArray arrayWithObjects:v84 count:2];
    CGRect v67 = [(MCDNowPlayingContentManager *)self favoriteButton];
    [v67 setAccessibilityUserInputLabels:v66];
  }
  CGRect v68 = [(MCDNowPlayingContentManager *)self tracklist];
  CGRect v69 = [v68 playingItem];
  CGRect v70 = [v69 likeCommand];

  LODWORD(v69) = [(MCDLibraryAddObserver *)self->_libraryAddObserver shouldShowFavoriteSong];
  CGRect v71 = [(MCDNowPlayingContentManager *)self favoriteButton];
  v72 = v71;
  if (v69 && v70)
  {
    [v71 setHidden:0];

    v72 = [(MCDNowPlayingContentManager *)self favoriteButton];
    [v72 setSelected:[v70 value]];
  }
  else
  {
    [v71 setHidden:1];
  }

  v73 = [v4 playModeControlView];
  v74 = [v73 shuffleButton];
  v75 = [v4 playModeControlView];
  v76 = [v75 repeatButton];
  v83[1] = v76;
  v77 = [(MCDNowPlayingContentManager *)self autoplayButton];
  v83[2] = v77;
  v78 = [(MCDNowPlayingContentManager *)self favoriteButton];
  v83[3] = v78;
  v79 = [v4 playModeControlView];

  v80 = [v79 moreButton];
  v83[4] = v80;
  v81 = +[NSArray arrayWithObjects:v83 count:5];

  return v81;
}

- (void)nowPlayingViewController:(id)a3 didSelectButton:(id)a4
{
  id v18 = a4;
  id v5 = [(MCDNowPlayingContentManager *)self autoplayButton];

  if (v5 == v18)
  {
    id v6 = [(MCDNowPlayingContentManager *)self tracklist];
    if ([v6 actionAtQueueEnd] == (id)3) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 3;
    }

    double v8 = [(MCDNowPlayingContentManager *)self tracklist];
    double v9 = [v8 actionAtQueueEndCommand];
    id v10 = [v9 setQueueEndAction:v7];

    +[MPCPlayerChangeRequest performRequest:v10 options:0x10000 completion:0];
  }
  id v11 = [(MCDNowPlayingContentManager *)self favoriteButton];

  id v12 = v18;
  if (v11 == v18)
  {
    double v13 = [(MCDNowPlayingContentManager *)self tracklist];
    id v14 = [v13 playingItem];
    double v15 = [v14 likeCommand];

    double v16 = [v15 changeValue:[v15 value] ^ 1];
    +[MPCPlayerChangeRequest performRequest:v16 options:0x10000 completion:0];
    double v17 = [(MCDNowPlayingContentManager *)self favoriteButton];
    objc_msgSend(v17, "setSelected:", objc_msgSend(v15, "value") ^ 1);

    id v12 = v18;
  }
}

- (BOOL)_showStopForCenterTransportCommand
{
  v3 = [(MCDNowPlayingContentManager *)self lastReceivedResponse];
  id v4 = [v3 stop];
  if (v4)
  {
    id v5 = [(MCDNowPlayingContentManager *)self nowPlayingItem];
    id v6 = v5;
    if (v5)
    {
      [v5 duration];
      BOOL v7 = v9 != 0;
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)nowPlayingViewController:(id)a3 buttonShouldBeActive:(int64_t)a4
{
  id v6 = [(MCDNowPlayingContentManager *)self tracklist];
  BOOL v7 = [v6 changeItemCommand];

  double v8 = [(MCDNowPlayingContentManager *)self tracklist];
  char v9 = [v8 playingItem];
  id v10 = [v9 seekCommand];

  if (a4 == 1)
  {
    id v11 = [v7 nextItem];
    if (!v11)
    {
      id v12 = [v7 nextChapter];
      if (!v12)
      {
        double v13 = [v7 nextSection];
        if (!v13)
        {
          id v14 = [v10 preferredForwardJumpIntervals];
          goto LABEL_15;
        }
LABEL_13:
        BOOL v15 = 1;
LABEL_16:

        goto LABEL_17;
      }
LABEL_11:
      BOOL v15 = 1;
LABEL_17:

      goto LABEL_18;
    }
LABEL_8:
    BOOL v15 = 1;
LABEL_18:

    goto LABEL_19;
  }
  if (!a4)
  {
    id v11 = [v7 previousItem];
    if (!v11)
    {
      id v12 = [v7 previousChapter];
      if (!v12)
      {
        double v13 = [v7 previousSection];
        if (!v13)
        {
          id v14 = [v10 preferredBackwardJumpIntervals];
LABEL_15:
          double v16 = v14;
          BOOL v15 = [v14 count] != 0;

          goto LABEL_16;
        }
        goto LABEL_13;
      }
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  BOOL v15 = 1;
LABEL_19:

  return v15;
}

- (BOOL)nowPlayingViewController:(id)a3 shouldDisplayButton:(int64_t)a4 withImage:(id *)a5 existingIdentifier:(id)a6 tinted:(BOOL *)a7
{
  id v11 = a3;
  id v12 = a6;
  if (a4)
  {
    if (a4 != 1)
    {
      if (a4 == 2)
      {
        if ([(_MCDNowPlayingContentManager *)self->_impl nowPlayingViewControllerIsPlaying:v11])
        {
          unsigned int v13 = [(MCDNowPlayingContentManager *)self _showStopForCenterTransportCommand];
          id v14 = sub_1000A802C();
          BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
          if (v13)
          {
            if (v15)
            {
              *(_WORD *)char v30 = 0;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Showing stop button", v30, 2u);
            }

            double v16 = [v11 transportControlView];
            [v16 setPauseButtonImageName:@"square.fill"];

            double v17 = sub_1000A8E64();
            id v18 = [v17 localizedStringForKey:@"ACCESSIBILITY_STOP" value:&stru_101023248 table:@"MusicCarDisplayUI"];
            uint64_t v33 = v18;
            double v19 = &v33;
          }
          else
          {
            if (v15)
            {
              *(_WORD *)char v30 = 0;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Showing pause button", v30, 2u);
            }

            double v25 = [v11 transportControlView];
            [v25 setPauseButtonImageName:@"pause.fill"];

            double v17 = sub_1000A8E64();
            id v18 = [v17 localizedStringForKey:@"ACCESSIBILITY_PAUSE" value:&stru_101023248 table:@"MusicCarDisplayUI"];
            id v32 = v18;
            double v19 = &v32;
          }
        }
        else
        {
          double v23 = sub_1000A802C();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)char v30 = 0;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Showing play button", v30, 2u);
          }

          double v24 = [v11 transportControlView];
          [v24 setPlayButtonImageName:@"play.fill"];

          double v17 = sub_1000A8E64();
          id v18 = [v17 localizedStringForKey:@"ACCESSIBILITY_PLAY" value:&stru_101023248 table:@"MusicCarDisplayUI"];
          id v31 = v18;
          double v19 = &v31;
        }
        double v26 = +[NSArray arrayWithObjects:v19 count:1];
        double v27 = [v11 transportControlView];
        unsigned int v28 = [v27 playPauseButton];
        [v28 setAccessibilityUserInputLabels:v26];
      }
      goto LABEL_20;
    }
    double v20 = self;
    uint64_t v21 = 2;
  }
  else
  {
    double v20 = self;
    uint64_t v21 = -2;
  }
  [(MCDNowPlayingContentManager *)v20 preferredJumpIntervalForDirection:v21];
  if (v22 != 0.0)
  {
    -[MCDNowPlayingContentManager skipIntervalButtonImageForInterval:](self, "skipIntervalButtonImageForInterval:");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_20:

  return 1;
}

- (BOOL)nowPlayingViewControllerCanShowAddToLibrary:(id)a3
{
  id v4 = +[MusicCarPlayApplicationCapabilitiesController sharedController];
  unsigned __int16 v5 = (unsigned __int16)[v4 subscriptionCapabilities];

  if ((v5 & 0x200) != 0)
  {
    double v8 = [(MCDNowPlayingContentManager *)self libraryAddObserver];
    unsigned __int8 v9 = [v8 isSongAddable];

    return v9;
  }
  else
  {
    id v6 = sub_1000A802C();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Subscriber cannot add catalog content to their Cloud Library, hiding Add Library button from Now Playing", v10, 2u);
    }

    return 0;
  }
}

- (void)nowPlayingViewControllerAddToLibrary:(id)a3
{
  id v3 = [(MCDNowPlayingContentManager *)self libraryAddObserver];
  [v3 addSongToLibrary];
}

- (BOOL)nowPlayingViewControllerCanShowMore:(id)a3
{
  unsigned int v4 = [(MCDNowPlayingContentManager *)self _itemCanCreateRadioStation];
  unsigned int v5 = [(MCDNowPlayingContentManager *)self _showAddToLibraryOptions];
  if ([(MCDLibraryAddObserver *)self->_libraryAddObserver shouldShowFavoriteSong])
  {
    id v6 = [(MCDNowPlayingContentManager *)self tracklist];
    BOOL v7 = [v6 playingItem];
    double v8 = [v7 dislikeCommand];
    if (v8)
    {
      unsigned __int8 v9 = [(MCDNowPlayingContentManager *)self nowPlayingItem];
      id v10 = [v9 metadataObject];
      id v11 = [v10 flattenedGenericObject];
      id v12 = [v11 song];
      unsigned int v13 = [v12 isFavorite] ^ 1;
    }
    else
    {
      unsigned int v13 = 0;
    }
  }
  else
  {
    unsigned int v13 = 0;
  }
  id v14 = sub_1000A802C();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v16[0] = 67109632;
    v16[1] = v4;
    __int16 v17 = 1024;
    unsigned int v18 = v5;
    __int16 v19 = 1024;
    unsigned int v20 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Show CTA: Create Station: %d, Add to Library: %d, allowsTasteActions: %d", (uint8_t *)v16, 0x14u);
  }

  return v4 | v5 | v13;
}

- (BOOL)nowPlayingViewControllerIsRightHandDrive:(id)a3
{
  id v3 = [(MCDNowPlayingContentManager *)self carSessionStatus];
  unsigned int v4 = [v3 currentSession];
  unsigned int v5 = [v4 configuration];
  unsigned __int8 v6 = [v5 rightHandDrive];

  return v6;
}

- (BOOL)nowPlayingViewControllerShouldHideBackButton:(id)a3
{
  return [(_MCDNowPlayingContentManager *)self->_impl nowPlayingViewControllerShouldHideBackButton:a3];
}

- (BOOL)nowPlayingViewControllerCanShowAlbumArt:(id)a3
{
  return [(_MCDNowPlayingContentManager *)self->_impl nowPlayingViewControllerCanShowAlbumArt:a3];
}

- (BOOL)nowPlayingViewControllerCanShowUpNext:(id)a3
{
  return [(_MCDNowPlayingContentManager *)self->_impl nowPlayingViewControllerCanShowUpNext:a3];
}

- (void)nowPlayingViewControllerUpNextButtonTapped:(id)a3
{
}

- (BOOL)nowPlayingViewControllerCanShowAlbumLink:(id)a3
{
  unsigned int v4 = [(MCDNowPlayingContentManager *)self currentPlayingSong];
  unsigned int v5 = [v4 album];
  if (v5)
  {
    if ([(MCDLibraryAddObserver *)self->_libraryAddObserver isAlbumAdded])
    {
      BOOL v6 = 1;
    }
    else
    {
      BOOL v7 = [v5 identifiers];
      double v8 = [v7 universalStore];
      id v9 = [v8 adamID];

      if (!v9)
      {
        id v10 = [v7 universalStore];
        id v9 = [v10 subscriptionAdamID];

        if (!v9)
        {
          id v11 = [v7 universalStore];
          id v9 = [v11 purchasedAdamID];
        }
      }
      BOOL v6 = v9 != 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)nowPlayingViewControllerAlbumArtistButtonTapped:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(MCDNowPlayingContentManager *)self currentPlayingSong];
  BOOL v6 = [v5 album];

  BOOL v7 = [(MCDNowPlayingContentManager *)self limitedUI];
  if (v6 && ![(MCDLibraryAddObserver *)self->_libraryAddObserver isAlbumAdded])
  {
    double v8 = +[MCDAlbumTracksTableViewController albumTracksViewControllerForStoreItem:v6 limitedUI:v7 showLocalContent:0];
    id v9 = sub_1000A802C();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      id v10 = "Album/Artist button tapped for remote album, pushing to album view from Now Playing";
      id v11 = buf;
      goto LABEL_7;
    }
  }
  else
  {
    double v8 = +[MCDAlbumTracksTableViewController albumTracksViewControllerForContentItem:v6 limitedUI:v7 showLocalContent:0];
    id v9 = sub_1000A802C();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = 0;
      id v10 = "Album/Artist button tapped for local album, pushing to album view from Now Playing";
      id v11 = (uint8_t *)&v13;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
    }
  }

  [v8 setAlwaysHideNowPlayingButton:1];
  [v8 setPlayActivityFeatureNameSourceViewController:v4];
  id v12 = [v4 navigationController];

  [v12 pushViewController:v8 animated:1];
}

- (BOOL)nowPlayingViewControllerShouldOverrideRightBarButtons:(id)a3
{
  return 1;
}

- (BOOL)_itemCanCreateRadioStation
{
  id v3 = +[MusicCarPlayApplicationCapabilitiesController sharedController];
  if (([v3 subscriptionCapabilities] & 1) != 0
    && [(MCDNowPlayingContentManager *)self _nowPlayingViewControllerIsFuseSubscriber])
  {
    id v4 = +[MusicCarPlayApplicationCapabilitiesController sharedController];
    if ([v4 allowsRadioContent])
    {
      unsigned int v5 = +[ICUserIdentityStore defaultIdentityStore];
      BOOL v6 = +[ICUserIdentity activeAccount];
      BOOL v7 = [v5 DSIDForUserIdentity:v6 outError:0];
      if ([v7 unsignedLongLongValue])
      {
        double v8 = [(MCDNowPlayingContentManager *)self currentPlayingSong];
        if ([v8 hasVideo])
        {
          BOOL v9 = 0;
        }
        else
        {
          id v10 = [(MCDNowPlayingContentManager *)self currentPlayingSong];
          id v11 = [v10 identifiers];
          id v12 = [v11 universalStore];
          if ([v12 adamID])
          {
            __int16 v13 = [(MCDNowPlayingContentManager *)self _radioCommandRequestWithCurrentPlayingSongWithViewController:0];
            BOOL v9 = v13 != 0;
          }
          else
          {
            BOOL v9 = 0;
          }
        }
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)_radioCommandRequestWithCurrentPlayingSongWithViewController:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(MCDNowPlayingContentManager *)self currentPlayingSong];
  BOOL v6 = +[MPCPlaybackIntent radioPlaybackIntentFromSong:v5];

  BOOL v7 = [v4 combinedPlayActivityFeatureName];

  [v6 setPlayActivityFeatureName:v7];
  double v8 = [(MCDNowPlayingContentManager *)self currentPlayingRadioStation];
  id v9 = [v8 type];

  if (v9 != (id)4)
  {
    id v12 = [(MCDNowPlayingContentManager *)self tracklist];
    __int16 v13 = [v12 insertCommand];
    uint64_t v14 = [v13 insertAfterPlayingItemWithPlaybackIntent:v6];
    goto LABEL_5;
  }
  id v10 = [(MCDNowPlayingContentManager *)self currentPlayingSong];
  unsigned int v11 = [v10 isLibraryAddEligible];

  if (v11)
  {
    id v12 = [(MCDNowPlayingContentManager *)self tracklist];
    __int16 v13 = [v12 resetCommand];
    uint64_t v14 = [v13 replaceWithPlaybackIntent:v6];
LABEL_5:
    BOOL v15 = (void *)v14;

    goto LABEL_7;
  }
  BOOL v15 = 0;
LABEL_7:

  return v15;
}

- (void)_addItemsToLibrary
{
  id v3 = [sub_1000AB030() alertControllerWithTitle:0 message:0 preferredStyle:0];
  [v3 setOverrideUserInterfaceStyle:2];
  objc_initWeak(&location, self);
  if ([(MCDLibraryAddObserver *)self->_libraryAddObserver isSongAddable]
    || [(MCDLibraryAddObserver *)self->_libraryAddObserver isSongAdded])
  {
    id v4 = sub_1000A8E64();
    if ([(MCDLibraryAddObserver *)self->_libraryAddObserver isSongAdded]) {
      CFStringRef v5 = @"LIBRARY_SONG_ADDED";
    }
    else {
      CFStringRef v5 = @"LIBRARY_ADD_SONG";
    }
    BOOL v6 = [v4 localizedStringForKey:v5 value:&stru_101023248 table:@"MusicCarDisplayUI"];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000AB114;
    v28[3] = &unk_100FC3ED8;
    objc_copyWeak(&v29, &location);
    BOOL v7 = +[UIAlertAction actionWithTitle:v6 style:0 handler:v28];

    [v7 setEnabled:[self->_libraryAddObserver isSongAdded] ^ 1];
    [v3 addAction:v7];

    objc_destroyWeak(&v29);
  }
  if ([(MCDLibraryAddObserver *)self->_libraryAddObserver isAlbumAddable]
    || [(MCDLibraryAddObserver *)self->_libraryAddObserver isAlbumAdded])
  {
    double v8 = sub_1000A8E64();
    if ([(MCDLibraryAddObserver *)self->_libraryAddObserver isAlbumAdded]) {
      CFStringRef v9 = @"LIBRARY_ALBUM_ADDED";
    }
    else {
      CFStringRef v9 = @"LIBRARY_ADD_ALBUM";
    }
    id v10 = [v8 localizedStringForKey:v9 value:&stru_101023248 table:@"MusicCarDisplayUI"];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000AB16C;
    v26[3] = &unk_100FC3ED8;
    objc_copyWeak(&v27, &location);
    unsigned int v11 = +[UIAlertAction actionWithTitle:v10 style:0 handler:v26];

    [v11 setEnabled:[self->_libraryAddObserver isAlbumAdded] ^ 1];
    [v3 addAction:v11];

    objc_destroyWeak(&v27);
  }
  if ([(MCDLibraryAddObserver *)self->_libraryAddObserver isPlaylistAddable]
    || [(MCDLibraryAddObserver *)self->_libraryAddObserver isPlaylistAdded])
  {
    id v12 = sub_1000A8E64();
    if ([(MCDLibraryAddObserver *)self->_libraryAddObserver isPlaylistAdded]) {
      CFStringRef v13 = @"LIBRARY_PLAYLIST_ADDED";
    }
    else {
      CFStringRef v13 = @"LIBRARY_ADD_PLAYLIST";
    }
    uint64_t v14 = [v12 localizedStringForKey:v13 value:&stru_101023248 table:@"MusicCarDisplayUI"];
    uint64_t v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472;
    double v23 = sub_1000AB1C4;
    double v24 = &unk_100FC3ED8;
    objc_copyWeak(&v25, &location);
    BOOL v15 = +[UIAlertAction actionWithTitle:v14 style:0 handler:&v21];

    [v15 setEnabled:[self->_libraryAddObserver isPlaylistAdded] ^ 1];
    [v3 addAction:v15];

    objc_destroyWeak(&v25);
  }
  double v16 = +[NSBundle mainBundle];
  uint64_t v17 = [v16 localizedStringForKey:@"Cancel" value:&stru_101023248 table:0];
  unsigned int v18 = +[UIAlertAction actionWithTitle:v17 style:1 handler:0];
  [v3 addAction:v18];

  __int16 v19 = [(MCDNowPlayingContentManager *)self delegate];
  LOBYTE(v17) = objc_opt_respondsToSelector();

  if (v17)
  {
    unsigned int v20 = [(MCDNowPlayingContentManager *)self delegate];
    [v20 contentManager:self->_impl presentViewController:v3];
  }
  objc_destroyWeak(&location);
}

- (BOOL)_showAddToLibraryOptions
{
  id v3 = +[MusicCarPlayApplicationCapabilitiesController sharedController];
  unsigned __int16 v4 = (unsigned __int16)[v3 subscriptionCapabilities];

  if ((v4 & 0x200) != 0)
  {
    unsigned int v7 = [(MCDLibraryAddObserver *)self->_libraryAddObserver isSongAddable];
    unsigned int v8 = [(MCDLibraryAddObserver *)self->_libraryAddObserver isAlbumAddable];
    unsigned int v9 = [(MCDLibraryAddObserver *)self->_libraryAddObserver isPlaylistAddable];
    char v6 = v7 | v8 | v9;
    CFStringRef v5 = sub_1000A802C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109888;
      v11[1] = v7 | v8 | v9;
      __int16 v12 = 1024;
      unsigned int v13 = v7;
      __int16 v14 = 1024;
      unsigned int v15 = v8;
      __int16 v16 = 1024;
      unsigned int v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "_showAddToLibraryOptions returning %d (derived from isSongAddable=%d || isAlbumAddable=%d || isPlaylistAddable=%d)", (uint8_t *)v11, 0x1Au);
    }
  }
  else
  {
    CFStringRef v5 = sub_1000A802C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11[0]) = 0;
    }
    char v6 = 0;
  }

  return v6;
}

- (BOOL)_allowsTasteActionsForGenericObject:(id)a3
{
  id v4 = a3;
  if ([v4 type] == (id)1)
  {
    CFStringRef v5 = [v4 anyObject];
    char v6 = [(MCDNowPlayingContentManager *)self currentPlayingRadioStation];
    id v7 = [v6 type];

    if (v7 == (id)4 && ![v5 isLibraryAddEligible])
    {
      BOOL v8 = 0;
    }
    else if ([(MCDNowPlayingContentManager *)self _showAddToLibraryOptions] {
           || [(MCDNowPlayingContentManager *)self _itemCanCreateRadioStation])
    }
    {
      BOOL v8 = 1;
    }
    else
    {
      BOOL v8 = [(MCDLibraryAddObserver *)self->_libraryAddObserver shouldShowFavoriteSong];
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)nowPlayingViewControllerMore:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [sub_1000AB030() alertControllerWithTitle:0 message:0 preferredStyle:0];
  [v5 setOverrideUserInterfaceStyle:2];
  objc_initWeak(location, self);
  char v6 = [(MCDNowPlayingContentManager *)self currentAttributionMetadata];
  if (v6)
  {
    unsigned int v7 = [(MCDNowPlayingContentManager *)self nowPlayingViewControllerCanShowAlbumLink:v4];

    if (v7)
    {
      BOOL v8 = +[UIImage _systemImageNamed:@"music.square"];
      unsigned int v9 = +[NSBundle mainBundle];
      id v10 = [v9 localizedStringForKey:@"Go to Album" value:&stru_101023248 table:0];
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_1000ABBE0;
      v53[3] = &unk_100FC3F00;
      objc_copyWeak(&v55, location);
      id v54 = v4;
      unsigned int v11 = +[MCDAlertAction actionWithTitle:v10 image:v8 handler:v53];

      [v5 addAction:v11];
      objc_destroyWeak(&v55);
    }
  }
  if ([(MCDNowPlayingContentManager *)self _showAddToLibraryOptions])
  {
    __int16 v12 = +[UIImage systemImageNamed:@"plus"];
    unsigned int v13 = +[NSBundle mainBundle];
    __int16 v14 = [v13 localizedStringForKey:@"Add to Library" value:&stru_101023248 table:0];
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_1000ABC30;
    v51[3] = &unk_100FC3ED8;
    objc_copyWeak(&v52, location);
    unsigned int v15 = +[MCDAlertAction actionWithTitle:v14 image:v12 handler:v51];

    [v5 addAction:v15];
    objc_destroyWeak(&v52);
  }
  if ([(MCDNowPlayingContentManager *)self _itemCanCreateRadioStation])
  {
    __int16 v16 = [(MCDNowPlayingContentManager *)self _radioCommandRequestWithCurrentPlayingSongWithViewController:v4];
    unsigned int v17 = [[MCDPlaybackManager alloc] initWithDelegate:self];
    unsigned int v18 = +[UIImage systemImageNamed:@"badge.plus.radiowaves.right"];
    __int16 v19 = +[NSBundle mainBundle];
    unsigned int v20 = [v19 localizedStringForKey:@"Create Station" value:&stru_101023248 table:0];
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_1000ABC70;
    v48[3] = &unk_100FC3F28;
    uint64_t v21 = v17;
    uint64_t v49 = v21;
    id v22 = v16;
    id v50 = v22;
    double v23 = +[MCDAlertAction actionWithTitle:v20 image:v18 handler:v48];

    [v5 addAction:v23];
  }
  double v24 = [(MCDNowPlayingContentManager *)self nowPlayingItem];
  id v25 = [v24 metadataObject];
  double v26 = [v25 flattenedGenericObject];

  id v27 = [v26 song];
  unsigned int v28 = [(MCDNowPlayingContentManager *)self tracklist];
  id v29 = [v28 playingItem];
  char v30 = [v29 dislikeCommand];

  unsigned int v31 = [(MCDLibraryAddObserver *)self->_libraryAddObserver shouldShowFavoriteSong];
  if (v30) {
    unsigned int v32 = v31;
  }
  else {
    unsigned int v32 = 0;
  }
  if (v32 == 1 && ([v27 isFavorite] & 1) == 0)
  {
    if ([v27 isDisliked])
    {
      uint64_t v33 = +[UIImage systemImageNamed:@"hand.thumbsdown.slash"];
      id v34 = +[NSBundle mainBundle];
      v35 = [v34 localizedStringForKey:@"Undo Suggest Less" value:&stru_101023248 table:0];
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_1000ABC7C;
      v47[3] = &unk_100FC3F28;
      v47[4] = self;
      v47[5] = v27;
      v36 = +[MCDAlertAction actionWithTitle:v35 image:v33 handler:v47];

      [v5 addAction:v36];
      v37 = v47;
    }
    else
    {
      uint64_t v33 = +[UIImage systemImageNamed:@"hand.thumbsdown"];
      id v38 = +[NSBundle mainBundle];
      v39 = [v38 localizedStringForKey:@"Suggest Less" value:&stru_101023248 table:0];
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_1000ABC8C;
      v46[3] = &unk_100FC3F28;
      v46[4] = self;
      v46[5] = v27;
      v36 = +[MCDAlertAction actionWithTitle:v39 image:v33 handler:v46];

      [v5 addAction:v36];
      v37 = v46;
    }
    v40 = (id *)(v37 + 5);
  }
  v41 = +[NSBundle mainBundle];
  uint64_t v42 = [v41 localizedStringForKey:@"Cancel" value:&stru_101023248 table:0];
  v43 = +[UIAlertAction actionWithTitle:v42 style:1 handler:0];
  [v5 addAction:v43];

  double v44 = [(MCDNowPlayingContentManager *)self delegate];
  LOBYTE(v42) = objc_opt_respondsToSelector();

  if (v42)
  {
    id v45 = [(MCDNowPlayingContentManager *)self delegate];
    [v45 contentManager:self->_impl presentViewController:v5];
  }
  objc_destroyWeak(location);
}

- (BOOL)nowPlayingViewControllerCanRepeat:(id)a3
{
  id v3 = [(MCDNowPlayingContentManager *)self tracklist];
  id v4 = [v3 repeatCommand];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)nowPlayingViewControllerToggleRepeat:(id)a3
{
  id v6 = [(MCDNowPlayingContentManager *)self tracklist];
  id v4 = [v6 repeatCommand];
  BOOL v5 = [v4 advance];
  [(MCDNowPlayingContentManager *)self _performChangeRequest:v5];
}

- (BOOL)nowPlayingViewControllerCanShuffle:(id)a3
{
  id v3 = [(MCDNowPlayingContentManager *)self tracklist];
  id v4 = [v3 shuffleCommand];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)nowPlayingViewControllerToggleShuffle:(id)a3
{
  id v6 = [(MCDNowPlayingContentManager *)self tracklist];
  id v4 = [v6 shuffleCommand];
  BOOL v5 = [v4 advance];
  [(MCDNowPlayingContentManager *)self _performChangeRequest:v5];
}

- (BOOL)_nowPlayingViewControllerIsFuseSubscriber
{
  v2 = +[MusicCarPlayApplicationCapabilitiesController sharedController];
  BOOL v3 = [v2 userSubscriptionState] == (id)2;

  return v3;
}

- (void)nowPlayingViewController:(id)a3 didSendAction:(int64_t)a4 state:(int64_t)a5
{
  id v8 = a3;
  id v32 = v8;
  if (a4)
  {
    if (a4 != 1)
    {
      if (a4 == 2)
      {
        if ([(_MCDNowPlayingContentManager *)self->_impl nowPlayingViewControllerIsPlaying:v8])
        {
          unsigned __int8 v9 = [(MCDNowPlayingContentManager *)self _showStopForCenterTransportCommand];
          id v10 = [(MCDNowPlayingContentManager *)self lastReceivedResponse];
          unsigned int v11 = v10;
          if (v9) {
            [v10 stop];
          }
          else {
          uint64_t v12 = [v10 pause];
          }
        }
        else
        {
          unsigned int v11 = [(MCDNowPlayingContentManager *)self lastReceivedResponse];
          uint64_t v12 = [v11 play];
        }
        double v26 = (void *)v12;
        goto LABEL_31;
      }
LABEL_22:
      double v26 = 0;
      goto LABEL_32;
    }
    if (a5 != 2)
    {
      if (a5 == 1)
      {
        unsigned int v13 = [(MCDNowPlayingContentManager *)self nowPlayingItem];
        __int16 v14 = [v13 seekCommand];
        unsigned int v15 = v14;
        uint64_t v16 = 1;
        goto LABEL_14;
      }
      goto LABEL_23;
    }
    if (![(MCDNowPlayingContentManager *)self seeking])
    {
LABEL_23:
      [(MCDNowPlayingContentManager *)self preferredJumpIntervalForDirection:2];
      unsigned int v20 = self;
      if (v27 == 0.0)
      {
        unsigned int v11 = [(MCDNowPlayingContentManager *)self tracklist];
        char v30 = [v11 changeItemCommand];
        uint64_t v31 = [v30 nextItem];
        goto LABEL_30;
      }
      uint64_t v22 = 2;
      goto LABEL_25;
    }
LABEL_20:
    double v23 = [(MCDNowPlayingContentManager *)self nowPlayingItem];
    double v24 = [v23 seekCommand];
    id v25 = [v24 endSeek];
    [(MCDNowPlayingContentManager *)self _performChangeRequest:v25];

    unsigned int v18 = self;
    uint64_t v19 = 0;
    goto LABEL_21;
  }
  if (a5 == 2)
  {
    if ([(MCDNowPlayingContentManager *)self seeking]) {
      goto LABEL_20;
    }
  }
  else if (a5 == 1)
  {
    unsigned int v13 = [(MCDNowPlayingContentManager *)self nowPlayingItem];
    __int16 v14 = [v13 seekCommand];
    unsigned int v15 = v14;
    uint64_t v16 = -1;
LABEL_14:
    unsigned int v17 = [v14 beginSeekWithDirection:v16];
    [(MCDNowPlayingContentManager *)self _performChangeRequest:v17];

    unsigned int v18 = self;
    uint64_t v19 = 1;
LABEL_21:
    [(MCDNowPlayingContentManager *)v18 setSeeking:v19];
    goto LABEL_22;
  }
  [(MCDNowPlayingContentManager *)self preferredJumpIntervalForDirection:-2];
  unsigned int v20 = self;
  if (v21 == 0.0)
  {
    unsigned int v11 = [(MCDNowPlayingContentManager *)self tracklist];
    char v30 = [v11 changeItemCommand];
    uint64_t v31 = [v30 previousItem];
    goto LABEL_30;
  }
  uint64_t v22 = -2;
LABEL_25:
  [(MCDNowPlayingContentManager *)v20 preferredJumpIntervalForDirection:v22];
  double v29 = v28;
  unsigned int v11 = [(MCDNowPlayingContentManager *)self nowPlayingItem];
  char v30 = [v11 seekCommand];
  uint64_t v31 = [v30 jumpByInterval:v29];
LABEL_30:
  double v26 = (void *)v31;

LABEL_31:
LABEL_32:
  [(MCDNowPlayingContentManager *)self _performChangeRequest:v26];
}

- (void)nowPlayingViewControllerAttributionButtonTapped:(id)a3
{
  id v4 = +[UIApplication sharePlayTogetherObjCViewModel];
  unsigned int v5 = [v4 isActive];

  if (v5)
  {
    id v6 = [_TtC5Music41MCDSharePlayTogetherSessionViewController alloc];
    unsigned int v7 = +[UIApplication sharePlayTogetherObjCViewModel];
    id v8 = [(MCDSharePlayTogetherSessionViewController *)v6 initWithViewModel:v7];
  }
  else
  {
    unsigned __int8 v9 = [MCDPlaylistTracksTableViewController alloc];
    unsigned int v7 = [(MCDNowPlayingContentManager *)self currentPlayingPlaylist];
    id v8 = [(MCDPlaylistTracksTableViewController *)v9 initWithPlaylist:v7 limitedUI:[(MCDNowPlayingContentManager *)self limitedUI] showLocalContent:0];
  }
  unsigned int v11 = v8;

  id v10 = [(MCDNowPlayingContentManager *)self contentManagerDelegate];
  [v10 contentManager:self->_impl pushViewController:v11];
}

- (void)setDelegate:(id)a3
{
}

- (id)lastReceivedResponse
{
  return [(_MCDNowPlayingContentManager *)self->_impl lastReceivedResponse];
}

- (void)setLastReceivedResponse:(id)a3
{
}

- (id)nowPlayingItem
{
  return [(_MCDNowPlayingContentManager *)self->_impl nowPlayingItem];
}

- (void)setNowPlayingItem:(id)a3
{
}

- (void)processArtworkForCurrentlyPlayingSong
{
}

- (void)_performChangeRequest:(id)a3
{
}

- (MPModelPlaylist)currentPlayingPlaylist
{
  return (MPModelPlaylist *)[(_MCDNowPlayingContentManager *)self->_impl currentPlayingPlaylist];
}

- (MPModelPlaylistEntry)currentPlayingPlaylistEntry
{
  return (MPModelPlaylistEntry *)[(_MCDNowPlayingContentManager *)self->_impl currentPlayingPlaylistEntry];
}

- (MPModelRadioStation)currentPlayingRadioStation
{
  return (MPModelRadioStation *)[(_MCDNowPlayingContentManager *)self->_impl currentPlayingRadioStation];
}

- (MPModelSong)currentPlayingSong
{
  return (MPModelSong *)[(_MCDNowPlayingContentManager *)self->_impl currentPlayingSong];
}

- (BOOL)limitedUI
{
  return [(_MCDNowPlayingContentManager *)self->_impl limitedUI];
}

- (void)setLimitedUI:(BOOL)a3
{
}

- (Class)tableCellClass
{
  return (Class)[(_MCDNowPlayingContentManager *)self->_impl tableCellClass];
}

- (NSString)nowPlayingBundleID
{
  v2 = [(_MCDNowPlayingContentManager *)self->_impl nowPlayingBundleID];
  id v3 = [v2 copy];

  return (NSString *)v3;
}

- (BOOL)shouldHideBackButton
{
  return [(_MCDNowPlayingContentManager *)self->_impl shouldHideBackButton];
}

- (void)setShouldHideBackButton:(BOOL)a3
{
}

- (id)artistTextForNowPlayingController:(id)a3
{
  return [(_MCDNowPlayingContentManager *)self->_impl artistTextForNowPlayingController:a3];
}

- (id)albumTextForNowPlayingController:(id)a3
{
  return [(_MCDNowPlayingContentManager *)self->_impl albumTextForNowPlayingController:a3];
}

- (id)titleForNowPlayingController:(id)a3
{
  return [(_MCDNowPlayingContentManager *)self->_impl titleForNowPlayingController:a3];
}

- (id)backgroundArtForNowPlayingController:(id)a3
{
  return [(_MCDNowPlayingContentManager *)self->_impl backgroundArtForNowPlayingController:a3];
}

- (BOOL)nowPlayingViewControllerIsShowingExplicitTrack:(id)a3
{
  return [(_MCDNowPlayingContentManager *)self->_impl nowPlayingViewControllerIsShowingExplicitTrack:a3];
}

- (id)progressBarLocalizedDurationStringForNowPlayingViewController:(id)a3
{
  return [(_MCDNowPlayingContentManager *)self->_impl progressBarLocalizedDurationStringForNowPlayingViewController:a3];
}

- ($04B05C73ED6AEEF31C5815932084562D)durationSnapshotForNowPlayingViewController:(SEL)a3
{
  double result = ($04B05C73ED6AEEF31C5815932084562D *)self->_impl;
  if (result) {
    return ($04B05C73ED6AEEF31C5815932084562D *)[($04B05C73ED6AEEF31C5815932084562D *)result durationSnapshotForNowPlayingViewController:a4];
  }
  *(void *)&retstr->var7 = 0;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  return result;
}

- (BOOL)nowPlayingViewControllerIsPlaying:(id)a3
{
  return [(_MCDNowPlayingContentManager *)self->_impl nowPlayingViewControllerIsPlaying:a3];
}

- (BOOL)nowPlayingViewControllerShouldUseMusicExplicitGlyph:(id)a3
{
  return [(_MCDNowPlayingContentManager *)self->_impl nowPlayingViewControllerShouldUseMusicExplicitGlyph:a3];
}

- (int64_t)shuffleTypeForNowPlayingViewController:(id)a3
{
  id v3 = [(MCDNowPlayingContentManager *)self tracklist];
  id v4 = [v3 shuffleType];

  return (int64_t)v4;
}

- (int64_t)repeatTypeForNowPlayingViewController:(id)a3
{
  id v3 = [(MCDNowPlayingContentManager *)self tracklist];
  id v4 = [v3 repeatType];

  return (int64_t)v4;
}

- (int64_t)placeholderTypeForNowPlayingViewController:(id)a3
{
  id v3 = [(MCDNowPlayingContentManager *)self nowPlayingItem];
  id v4 = v3;
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

- (id)attributionTitleForNowPlayingViewController:(id)a3
{
  id v3 = [(MCDNowPlayingContentManager *)self currentAttributionMetadata];
  id v4 = [v3 title];

  return v4;
}

- (id)attributionArtworkForNowPlayingViewController:(id)a3
{
  return [(MCDNowPlayingContentManager *)self currentAttributionImage];
}

- (void)contentManager:(id)a3 processResponse:(id)a4 error:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentManagerDelegate);
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = objc_loadWeakRetained((id *)&self->_contentManagerDelegate);
    [v12 contentManager:v13 processResponse:v8 error:v9];
  }
  [(MCDNowPlayingContentManager *)self _processResponse:v8 error:v9];
}

- (void)contentManager:(id)a3 shouldShowPlaybackQueue:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  p_contentManagerDelegate = &self->_contentManagerDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_contentManagerDelegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)p_contentManagerDelegate);
    [v9 contentManager:v10 shouldShowPlaybackQueue:v4];
  }
}

- (void)contentManagerReloadData:(id)a3
{
  id v8 = a3;
  p_contentManagerDelegate = &self->_contentManagerDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_contentManagerDelegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_contentManagerDelegate);
    [v7 contentManagerReloadData:v8];
  }
}

- (void)contentManager:(id)a3 presentViewController:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  p_contentManagerDelegate = &self->_contentManagerDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_contentManagerDelegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)p_contentManagerDelegate);
    [v10 contentManager:v11 presentViewController:v6];
  }
}

- (void)contentManager:(id)a3 bufferingItem:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  p_contentManagerDelegate = &self->_contentManagerDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_contentManagerDelegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)p_contentManagerDelegate);
    [v9 contentManager:v10 bufferingItem:v4];
  }
}

- (void)contentManagerInitiatedPlaybackFromPlaybackQueue:(id)a3
{
  id v8 = a3;
  p_contentManagerDelegate = &self->_contentManagerDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_contentManagerDelegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_contentManagerDelegate);
    [v7 contentManagerInitiatedPlaybackFromPlaybackQueue:v8];
  }
}

- (void)contentManager:(id)a3 displayItemIndex:(int64_t)a4 totalItemCount:(int64_t)a5
{
  id v12 = a3;
  p_contentManagerDelegate = &self->_contentManagerDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_contentManagerDelegate);
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = objc_loadWeakRetained((id *)p_contentManagerDelegate);
    [v11 contentManager:v12 displayItemIndex:a4 totalItemCount:a5];
  }
}

- (void)contentManagerCompletedAllPlayback:(id)a3
{
  id v8 = a3;
  p_contentManagerDelegate = &self->_contentManagerDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_contentManagerDelegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_contentManagerDelegate);
    [v7 contentManagerCompletedAllPlayback:v8];
  }
}

- (void)contentManager:(id)a3 sectionName:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  p_contentManagerDelegate = &self->_contentManagerDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_contentManagerDelegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)p_contentManagerDelegate);
    [v10 contentManager:v11 sectionName:v6];
  }
}

- (void)contentManager:(id)a3 itemDidChange:(id)a4 response:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  p_contentManagerDelegate = &self->_contentManagerDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_contentManagerDelegate);
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = objc_loadWeakRetained((id *)p_contentManagerDelegate);
    [v13 contentManager:v14 itemDidChange:v8 response:v9];
  }
}

- (BOOL)currentPlayingSongFoundIn:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000ACB6C;
  v6[3] = &unk_100FC3F50;
  v6[4] = self;
  v6[5] = &v7;
  [v4 enumerateItemIdentifiersUsingBlock:v6];
  LOBYTE(self) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)self;
}

- (void)requestAndUpdateLibraryResponseForCurrentPlayingSongAlbum
{
  id v3 = [(MCDNowPlayingContentManager *)self currentPlayingSong];
  id v4 = [v3 album];
  int64_t v5 = [(MCDNowPlayingContentManager *)self currentPlayingAlbum];
  id v6 = [v5 identifiers];
  uint64_t v7 = [v4 identifiers];
  unsigned __int8 v8 = [v6 intersectsSet:v7];

  if ((v8 & 1) == 0)
  {
    [(MCDNowPlayingContentManager *)self setCurrentPlayingAlbum:v4];
    if (v3)
    {
      if (v4)
      {
        uint64_t v9 = [[MCDAlbumTracksDataSource alloc] initWithLimitedUI:0 album:v4 storeContent:0];
        char v10 = [(_MCDContentManager *)[MCDLibraryContentManager alloc] initWithDataSource:v9 delegate:0];
        objc_initWeak(&location, self);
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        _DWORD v11[2] = sub_1000ACDA8;
        v11[3] = &unk_100FC3F78;
        objc_copyWeak(&v13, &location);
        v11[4] = self;
        id v12 = v4;
        [(_MCDContentManager *)v10 performRequest:v11];

        objc_destroyWeak(&v13);
        objc_destroyWeak(&location);
      }
    }
  }
}

- (void)performFavoriteChangeRequestFor:(id)a3 action:(int64_t)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)MPModelLibraryFavoriteEntityChangeRequest);
  [v6 setModelObject:v5];

  id v7 = [objc_alloc((Class)MPModelLibraryFavoriteEntityRequestAction) initWithChangeAction:a4];
  [v6 setRequestAction:v7];

  unsigned __int8 v8 = +[MPModelLibraryTransientStateController sharedDeviceLibraryController];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000ACF5C;
  v9[3] = &unk_100FC3F98;
  v9[4] = a4;
  [v8 performFavoriteStateChangeRequest:v6 withRelatedModelObjects:0 completion:v9];
}

- (void)sharePlayTogetherButtonTapped
{
  id v3 = [_TtC5Music41MCDSharePlayTogetherSessionViewController alloc];
  id v4 = +[UIApplication sharePlayTogetherObjCViewModel];
  id v6 = [(MCDSharePlayTogetherSessionViewController *)v3 initWithViewModel:v4];

  id v5 = [(MCDNowPlayingContentManager *)self contentManagerDelegate];
  [v5 contentManager:self->_impl pushViewController:v6];
}

- (id)tableCellConfigurationBlock
{
  return self->_tableCellConfigurationBlock;
}

- (void)setTableCellConfigurationBlock:(id)a3
{
}

- (MCDPlaybackManager)playbackManager
{
  return self->_playbackManager;
}

- (void)setPlaybackManager:(id)a3
{
}

- (int64_t)playerState
{
  return self->_playerState;
}

- (void)setImpl:(id)a3
{
}

- (MCDLibraryAddObserver)libraryAddObserver
{
  return self->_libraryAddObserver;
}

- (void)setLibraryAddObserver:(id)a3
{
}

- (void)setContentManagerDelegate:(id)a3
{
}

- (MPModelAlbum)currentPlayingAlbum
{
  return self->_currentPlayingAlbum;
}

- (void)setCurrentPlayingAlbum:(id)a3
{
}

- (CARSessionStatus)carSessionStatus
{
  return self->_carSessionStatus;
}

- (void)setCarSessionStatus:(id)a3
{
}

- (SiriDirectActionSource)siriDirectActionSource
{
  return self->_siriDirectActionSource;
}

- (void)setSiriDirectActionSource:(id)a3
{
}

- (void)setTracklist:(id)a3
{
}

- (MPSectionedCollection)filteredItems
{
  return self->_filteredItems;
}

- (void)setFilteredItems:(id)a3
{
}

- (MusicAttributionMetadata)currentAttributionMetadata
{
  return self->_currentAttributionMetadata;
}

- (MPArtworkCatalog)currentAttributionCatalog
{
  return self->_currentAttributionCatalog;
}

- (UIImage)currentAttributionImage
{
  return self->_currentAttributionImage;
}

- (MSVTimer)artworkTimer
{
  return self->_artworkTimer;
}

- (BOOL)seeking
{
  return self->_seeking;
}

- (void)setSeeking:(BOOL)a3
{
  self->_seeking = a3;
}

- (CPUIModernButton)autoplayButton
{
  return self->_autoplayButton;
}

- (void)setAutoplayButton:(id)a3
{
}

- (CPUIModernButton)favoriteButton
{
  return self->_favoriteButton;
}

- (void)setFavoriteButton:(id)a3
{
}

- (CPUIModernButton)sharePlayTogetherButton
{
  return self->_sharePlayTogetherButton;
}

- (UIView)sharePlayTogetherPendingParticipantsView
{
  return self->_sharePlayTogetherPendingParticipantsView;
}

- (void)setSharePlayTogetherPendingParticipantsView:(id)a3
{
}

- (UILabel)sharePlayTogetherPendingParticipantsLabel
{
  return self->_sharePlayTogetherPendingParticipantsLabel;
}

- (void)setSharePlayTogetherPendingParticipantsLabel:(id)a3
{
}

- (int64_t)previousActionAtQueueEnd
{
  return self->_previousActionAtQueueEnd;
}

- (void)setPreviousActionAtQueueEnd:(int64_t)a3
{
  self->_previousActionAtQueueEnd = a3;
}

- (_TtC5Music22CarPlayInformationView)noContentView
{
  return self->_noContentView;
}

- (void)setNoContentView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noContentView, 0);
  objc_storeStrong((id *)&self->_sharePlayTogetherPendingParticipantsLabel, 0);
  objc_storeStrong((id *)&self->_sharePlayTogetherPendingParticipantsView, 0);
  objc_storeStrong((id *)&self->_sharePlayTogetherButton, 0);
  objc_storeStrong((id *)&self->_favoriteButton, 0);
  objc_storeStrong((id *)&self->_autoplayButton, 0);
  objc_storeStrong((id *)&self->_artworkTimer, 0);
  objc_storeStrong((id *)&self->_currentAttributionImage, 0);
  objc_storeStrong((id *)&self->_currentAttributionCatalog, 0);
  objc_storeStrong((id *)&self->_currentAttributionMetadata, 0);
  objc_storeStrong((id *)&self->_filteredItems, 0);
  objc_storeStrong((id *)&self->_tracklist, 0);
  objc_storeStrong((id *)&self->_siriDirectActionSource, 0);
  objc_storeStrong((id *)&self->_carSessionStatus, 0);
  objc_storeStrong((id *)&self->_currentPlayingAlbum, 0);
  objc_destroyWeak((id *)&self->_contentManagerDelegate);
  objc_storeStrong((id *)&self->_libraryAddObserver, 0);
  objc_storeStrong((id *)&self->_impl, 0);
  objc_storeStrong((id *)&self->_playbackManager, 0);
  objc_storeStrong(&self->_tableCellConfigurationBlock, 0);

  objc_storeStrong((id *)&self->_tableView, 0);
}

@end