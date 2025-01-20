@interface MCDAlbumTracksTableViewController
+ (id)albumTracksViewControllerForContentItem:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5;
+ (id)albumTracksViewControllerForStoreItem:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5;
- (BOOL)hasLoadedContent;
- (BOOL)hasPlayableContent;
- (BOOL)storeContent;
- (MCDAlbumTracksTableViewController)initWithIdentifier:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5;
- (MPModelAlbum)album;
- (MPWeakTimer)loadingTimer;
- (UIActivityIndicatorView)activityIndicator;
- (UILabel)titleViewLabel;
- (double)albumDuration;
- (double)heightForHeaderViewInContentManager:(id)a3;
- (id)shuffleContainerForContentManager:(id)a3;
- (id)viewForHeaderViewInContentManager:(id)a3;
- (void)_replacePlaceholderViewWithView:(id)a3;
- (void)_setCurrentTableView;
- (void)_showLoadingScreen;
- (void)contentManager:(id)a3 didFailWithError:(id)a4;
- (void)contentManager:(id)a3 didReceiveResponse:(id)a4;
- (void)playbackManagerShouldShowNowPlaying:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setActivityIndicator:(id)a3;
- (void)setAlbum:(id)a3;
- (void)setAlbumDuration:(double)a3;
- (void)setHasLoadedContent:(BOOL)a3;
- (void)setHasPlayableContent:(BOOL)a3;
- (void)setLoadingTimer:(id)a3;
- (void)setStoreContent:(BOOL)a3;
- (void)setTitleViewLabel:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MCDAlbumTracksTableViewController

- (MCDAlbumTracksTableViewController)initWithIdentifier:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v9 = [(_MCDLibraryDataSource *)[MCDAlbumTracksDataSource alloc] initWithLimitedUI:v6];
  v12.receiver = self;
  v12.super_class = (Class)MCDAlbumTracksTableViewController;
  v10 = [(MCDLibraryTableViewController *)&v12 initWithIdentifier:v8 limitedUI:v6 showLocalContent:v5 dataSource:v9];

  if (v10) {
    [(MCDAlbumTracksTableViewController *)v10 setPlayActivityFeatureName:@"album_detail"];
  }
  return v10;
}

+ (id)albumTracksViewControllerForContentItem:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = [[MCDAlbumTracksDataSource alloc] initWithLimitedUI:v6 album:v7 storeContent:0];
  v9 = [MCDAlbumTracksTableViewController alloc];
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  v10 = (void *)qword_1010D70C8;
  uint64_t v22 = qword_1010D70C8;
  if (!qword_1010D70C8)
  {
    v11 = (void *)sub_10002A570();
    v20[3] = (uint64_t)dlsym(v11, "MCDAlbumsDetailViewControllerIdentifier");
    qword_1010D70C8 = v20[3];
    v10 = (void *)v20[3];
  }
  _Block_object_dispose(&v19, 8);
  if (!v10)
  {
    v18 = (_Unwind_Exception *)sub_100D691B8();
    _Block_object_dispose(&v19, 8);
    _Unwind_Resume(v18);
  }
  objc_super v12 = [(MCDLibraryTableViewController *)v9 initWithIdentifier:*v10 limitedUI:v6 showLocalContent:v5 dataSource:v8];
  [(MCDAlbumTracksTableViewController *)v12 setAlbum:v7];
  [(MCDAlbumTracksTableViewController *)v12 setPlayActivityFeatureName:@"album_detail"];
  v13 = [v7 title];
  v14 = [(MCDAlbumTracksTableViewController *)v12 titleViewLabel];
  [v14 setText:v13];

  uint64_t v15 = objc_opt_class();
  v16 = [(MCDLibraryTableViewController *)v12 contentManager];
  [v16 setTableCellClass:v15];

  return v12;
}

+ (id)albumTracksViewControllerForStoreItem:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = [(MCDTableViewController *)[MCDAlbumTracksTableViewController alloc] initWithLimitedUI:v6];
  v9 = v8;
  if (v8)
  {
    [(MCDLibraryTableViewController *)v8 setShowLocalContent:v5];
    v10 = [[MCDAlbumTracksDataSource alloc] initWithLimitedUI:v6 album:v7 storeContent:1];
    [(MCDLibraryTableViewController *)v9 setDataSource:v10];

    [(MCDAlbumTracksTableViewController *)v9 setAlbum:v7];
    [(MCDAlbumTracksTableViewController *)v9 setPlayActivityFeatureName:@"album_detail"];
    v11 = [v7 title];
    objc_super v12 = [(MCDAlbumTracksTableViewController *)v9 titleViewLabel];
    [v12 setText:v11];

    [(MCDAlbumTracksTableViewController *)v9 setStoreContent:1];
    v13 = [MCDStoreContentManager alloc];
    v14 = [(MCDLibraryTableViewController *)v9 dataSource];
    uint64_t v15 = [(MCDPlaybackManager *)[MCDStorePlaybackManager alloc] initWithDelegate:v9];
    LOBYTE(v20) = 1;
    v16 = [(_MCDContentManager *)v13 initWithDataSource:v14 limitedUI:v6 showLocalContent:v5 delegate:v9 viewController:v9 playbackManager:v15 shouldPerformRequestImmediately:v20];
    [(MCDLibraryTableViewController *)v9 setContentManager:v16];

    uint64_t v17 = objc_opt_class();
    v18 = [(MCDLibraryTableViewController *)v9 contentManager];
    [v18 setTableCellClass:v17];
  }

  return v9;
}

- (void)viewDidLoad
{
  v24.receiver = self;
  v24.super_class = (Class)MCDAlbumTracksTableViewController;
  [(MCDLibraryTableViewController *)&v24 viewDidLoad];
  v3 = [(MCDLibraryTableViewController *)self contentManager];
  [v3 setShowSiriCellInLimitedUI:1];

  v4 = [(MCDAlbumTracksTableViewController *)self tableView];
  [v4 _setHeaderAndFooterViewsFloat:0];

  BOOL v5 = objc_opt_new();
  [(MCDAlbumTracksTableViewController *)self setTitleViewLabel:v5];

  BOOL v6 = [(MCDAlbumTracksTableViewController *)self album];
  id v7 = [v6 title];
  id v8 = [(MCDAlbumTracksTableViewController *)self titleViewLabel];
  [v8 setText:v7];

  v9 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleCallout variant:1024];
  v10 = [(MCDAlbumTracksTableViewController *)self titleViewLabel];
  [v10 setFont:v9];

  v11 = [(MCDAlbumTracksTableViewController *)self titleViewLabel];
  [v11 setAlpha:0.0];

  objc_super v12 = [(MCDAlbumTracksTableViewController *)self titleViewLabel];
  v13 = [(MCDAlbumTracksTableViewController *)self navigationItem];
  [v13 setTitleView:v12];

  v14 = [(MCDAlbumTracksTableViewController *)self tableView];
  uint64_t v15 = objc_opt_class();
  v16 = +[MCDAlbumsDetailTableHeaderView reuseIdentifier];
  [v14 registerClass:v15 forHeaderFooterViewReuseIdentifier:v16];

  uint64_t v17 = [(MCDAlbumTracksTableViewController *)self tableView];
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = +[_MCDReusableCell reuseIdentifier];
  [v17 registerClass:v18 forCellReuseIdentifier:v19];

  objc_initWeak(&location, self);
  objc_copyWeak(&v22, &location);
  uint64_t v20 = [(MCDLibraryTableViewController *)self contentManager];
  [v20 setTableCellConfigurationBlock:&v21];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (void)viewWillAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)MCDAlbumTracksTableViewController;
  [(MCDLibraryTableViewController *)&v12 viewWillAppear:a3];
  if ([(MCDTableViewController *)self alwaysHideNowPlayingButton])
  {
    v4 = [(MCDLibraryTableViewController *)self placeholderView];
    if (v4)
    {
    }
    else if (![(MCDAlbumTracksTableViewController *)self hasLoadedContent])
    {
      objc_initWeak(&location, self);
      BOOL v6 = _NSConcreteStackBlock;
      uint64_t v7 = 3221225472;
      id v8 = sub_1000B9554;
      v9 = &unk_100FC3628;
      objc_copyWeak(&v10, &location);
      BOOL v5 = +[MPWeakTimer timerWithInterval:0 repeats:&v6 block:2.0];
      -[MCDAlbumTracksTableViewController setLoadingTimer:](self, "setLoadingTimer:", v5, v6, v7, v8, v9);

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MCDAlbumTracksTableViewController;
  [(MCDLibraryTableViewController *)&v5 viewWillDisappear:a3];
  if ([(MCDTableViewController *)self alwaysHideNowPlayingButton])
  {
    [(MPWeakTimer *)self->_loadingTimer invalidate];
    loadingTimer = self->_loadingTimer;
    self->_loadingTimer = 0;
  }
}

- (void)_showLoadingScreen
{
  [(MPWeakTimer *)self->_loadingTimer invalidate];
  loadingTimer = self->_loadingTimer;
  self->_loadingTimer = 0;

  id v4 = +[CarPlayInformationView loading];
  [(MCDAlbumTracksTableViewController *)self _replacePlaceholderViewWithView:v4];
}

- (void)_setCurrentTableView
{
  [(MPWeakTimer *)self->_loadingTimer invalidate];
  loadingTimer = self->_loadingTimer;
  self->_loadingTimer = 0;

  [(MCDAlbumTracksTableViewController *)self _replacePlaceholderViewWithView:0];
  id v4 = [(MCDAlbumTracksTableViewController *)self tableView];
  [v4 reloadData];
}

- (void)contentManager:(id)a3 didReceiveResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 results];
  if ((uint64_t)[v8 numberOfSections] >= 1
    && (uint64_t)[v8 numberOfItemsInSection:0] >= 1
    && [(MCDTableViewController *)self alwaysHideNowPlayingButton])
  {
    unsigned int v9 = [(MCDAlbumTracksTableViewController *)self storeContent];
    id v10 = [v8 firstSection];
    v11 = v10;
    if (v9)
    {
      if ([v10 itemType] == (id)1)
      {
        objc_super v12 = [v11 album];
        [(MCDAlbumTracksTableViewController *)self setAlbum:v12];
      }
    }
    else
    {
      [(MCDAlbumTracksTableViewController *)self setAlbum:v10];
    }

    [(MCDAlbumTracksTableViewController *)self _setCurrentTableView];
    [(MCDAlbumTracksTableViewController *)self setHasLoadedContent:1];
  }
  objc_initWeak(&location, self);
  v13 = [v7 request];
  id v14 = [v13 copy];

  uint64_t v15 = self->_album;
  uint64_t v24 = MPModelPropertySongDuration;
  v16 = +[NSArray arrayWithObjects:&v24 count:1];
  uint64_t v17 = +[MPPropertySet propertySetWithProperties:v16];
  [v14 setItemProperties:v17];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000B99C4;
  v20[3] = &unk_100FC42D8;
  objc_copyWeak(&v22, &location);
  uint64_t v18 = v15;
  uint64_t v21 = v18;
  [v14 performWithResponseHandler:v20];
  [(MCDAlbumTracksTableViewController *)self setHasPlayableContent:1];
  v19.receiver = self;
  v19.super_class = (Class)MCDAlbumTracksTableViewController;
  [(MCDLibraryTableViewController *)&v19 contentManager:v6 didReceiveResponse:v7];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (void)contentManager:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  objc_super v19 = &v18;
  uint64_t v20 = 0x2020000000;
  id v8 = (void (*)(void))off_1010D70D8;
  uint64_t v21 = off_1010D70D8;
  if (!off_1010D70D8)
  {
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    v23 = sub_1000BAAA0;
    uint64_t v24 = &unk_100FC34A0;
    v25 = &v18;
    unsigned int v9 = (void *)sub_10002A570();
    id v10 = dlsym(v9, "MCDMusicGeneralLogging");
    *(void *)(v25[1] + 24) = v10;
    off_1010D70D8 = *(_UNKNOWN **)(v25[1] + 24);
    id v8 = (void (*)(void))v19[3];
  }
  _Block_object_dispose(&v18, 8);
  if (!v8)
  {
    sub_100D691B8();
    __break(1u);
  }
  v11 = v8();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Album tracks content manager failed to load data with error: %{public}@\nShowing error view", (uint8_t *)&buf, 0xCu);
  }

  objc_super v12 = sub_1000B9EBC();
  v13 = [v12 localizedStringForKey:@"FUSE_TIMEOUT_TITLE" value:&stru_101023248 table:@"MusicCarDisplayUI"];
  id v14 = sub_1000B9EBC();
  uint64_t v15 = [v14 localizedStringForKey:@"Try Again" value:&stru_101023248 table:@"MusicCarDisplayUI"];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000B9FC8;
  v17[3] = &unk_100FC3900;
  v17[4] = self;
  v16 = +[CarPlayInformationView errorWithTitle:v13 buttonText:v15 buttonAction:v17];

  [(MCDAlbumTracksTableViewController *)self _replacePlaceholderViewWithView:v16];
}

- (double)heightForHeaderViewInContentManager:(id)a3
{
  return 44.0;
}

- (id)viewForHeaderViewInContentManager:(id)a3
{
  id v4 = [(MCDAlbumTracksTableViewController *)self tableView];
  objc_super v5 = +[MCDAlbumsDetailTableHeaderView reuseIdentifier];
  id v6 = [v4 dequeueReusableHeaderFooterViewWithIdentifier:v5];

  id v7 = [(MCDLibraryTableViewController *)self dataSource];
  id v8 = [v7 album];

  unsigned int v9 = [v8 title];
  if ([v9 length])
  {
    [v6 setTitle:v9];
  }
  else
  {
    id v10 = sub_1000B9EBC();
    v11 = [v10 localizedStringForKey:@"Unknown Album" value:&stru_101023248 table:@"MusicCarDisplayUI"];
    [v6 setTitle:v11];
  }
  [(MCDAlbumTracksTableViewController *)self albumDuration];
  [v6 setDuration:[v8 trackCount] count:v12];
  v13 = [v8 artworkCatalog];
  id v14 = v13;
  if (v13)
  {
    [v13 setFittingSize:36.0, 36.0];
    uint64_t v15 = [(MCDAlbumTracksTableViewController *)self view];
    v16 = [v15 window];
    uint64_t v17 = [v16 screen];
    [v17 scale];
    [v14 setDestinationScale:];

    uint64_t v18 = (objc_class *)objc_opt_class();
    objc_super v19 = NSStringFromClass(v18);
    [v14 setCacheIdentifier:v19 forRequestingContext:self];

    [v14 setDestination:v6 configurationBlock:&stru_100FC4318];
  }
  else
  {
    [v6 setTemplateArtworkImage:0];
  }
  [v6 setContentPlayable:[self hasPlayableContent]];
  [v6 setFavorite:[v8 isFavorite]];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000BA2D0;
  v22[3] = &unk_100FC4340;
  v22[4] = self;
  id v23 = v8;
  id v20 = v8;
  [v6 setShuffleActionBlock:v22];

  return v6;
}

- (id)shuffleContainerForContentManager:(id)a3
{
  v3 = [(MCDLibraryTableViewController *)self dataSource];
  id v4 = [v3 scopedContainers];
  objc_super v5 = [v4 firstObject];

  return v5;
}

- (void)setAlbum:(id)a3
{
  id v6 = (MPModelAlbum *)a3;
  if (self->_album != v6)
  {
    objc_storeStrong((id *)&self->_album, a3);
    objc_super v5 = [(MCDLibraryTableViewController *)self dataSource];
    [v5 setAlbum:v6];
  }
}

- (void)playbackManagerShouldShowNowPlaying:(id)a3
{
  id v4 = a3;
  if ([(MCDTableViewController *)self alwaysHideNowPlayingButton])
  {
    objc_super v5 = [(MCDAlbumTracksTableViewController *)self navigationController];
    id v6 = [v5 popViewControllerAnimated:1];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MCDAlbumTracksTableViewController;
    [(MCDLibraryTableViewController *)&v7 playbackManagerShouldShowNowPlaying:v4];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = [(MCDAlbumTracksTableViewController *)self tableView];
  uint64_t v5 = (uint64_t)[v4 numberOfSections];

  if (v5 >= 1)
  {
    id v6 = [(MCDAlbumTracksTableViewController *)self tableView];
    [v6 bounds];
    CGFloat v8 = v7;
    double v10 = v9;
    CGFloat v12 = v11;
    double v14 = v13;

    uint64_t v15 = [(MCDAlbumTracksTableViewController *)self tableView];
    [v15 safeAreaInsets];
    CGFloat v17 = v10 + v16;

    uint64_t v18 = [(MCDAlbumTracksTableViewController *)self tableView];
    [v18 safeAreaInsets];
    CGFloat v20 = v14 - v19;

    uint64_t v21 = [(MCDAlbumTracksTableViewController *)self tableView];
    [v21 rectForHeaderInSection:0];
    v30.origin.x = v8;
    v30.origin.y = v17;
    v30.size.width = v12;
    v30.size.double height = v20;
    CGRect v29 = CGRectIntersection(v28, v30);
    double height = v29.size.height;

    if (height > 0.0) {
      double v23 = 0.0;
    }
    else {
      double v23 = 1.0;
    }
    uint64_t v24 = [(MCDAlbumTracksTableViewController *)self titleViewLabel];
    [v24 alpha];
    double v26 = v25;

    if (v26 != v23)
    {
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_1000BA68C;
      v27[3] = &unk_100FC4368;
      v27[4] = self;
      *(double *)&v27[5] = v23;
      +[UIView animateWithDuration:v27 animations:0.4];
    }
  }
}

- (void)_replacePlaceholderViewWithView:(id)a3
{
  id v30 = a3;
  id v4 = [(MCDLibraryTableViewController *)self placeholderView];
  uint64_t v5 = [v4 superview];

  if (v5)
  {
    id v6 = [(MCDLibraryTableViewController *)self placeholderView];
    [v6 removeFromSuperview];
  }
  [(MCDLibraryTableViewController *)self setPlaceholderView:v30];
  double v7 = [(MCDLibraryTableViewController *)self placeholderView];

  if (v7)
  {
    CGFloat v8 = [(MCDAlbumTracksTableViewController *)self tableView];
    [v8 frame];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;

    CGFloat v17 = [(MCDAlbumTracksTableViewController *)self tableView];
    [v17 safeAreaInsets];
    double v19 = v10 + v18;
    double v21 = v12 + v20;
    double v23 = v14 - (v18 + v22);
    double v25 = v16 - (v20 + v24);

    double v26 = [(MCDLibraryTableViewController *)self placeholderView];
    [v26 setFrame:v19, v21, v23, v25];

    v27 = [(MCDAlbumTracksTableViewController *)self tableView];
    CGRect v28 = [v27 superview];
    CGRect v29 = [(MCDLibraryTableViewController *)self placeholderView];
    [v28 addSubview:v29];
  }
}

- (double)albumDuration
{
  return self->_albumDuration;
}

- (void)setAlbumDuration:(double)a3
{
  self->_albumDuration = a3;
}

- (MPModelAlbum)album
{
  return self->_album;
}

- (BOOL)hasPlayableContent
{
  return self->_hasPlayableContent;
}

- (void)setHasPlayableContent:(BOOL)a3
{
  self->_hasPlayableContent = a3;
}

- (BOOL)storeContent
{
  return self->_storeContent;
}

- (void)setStoreContent:(BOOL)a3
{
  self->_storeContent = a3;
}

- (BOOL)hasLoadedContent
{
  return self->_hasLoadedContent;
}

- (void)setHasLoadedContent:(BOOL)a3
{
  self->_hasLoadedContent = a3;
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
}

- (MPWeakTimer)loadingTimer
{
  return self->_loadingTimer;
}

- (void)setLoadingTimer:(id)a3
{
}

- (UILabel)titleViewLabel
{
  return self->_titleViewLabel;
}

- (void)setTitleViewLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleViewLabel, 0);
  objc_storeStrong((id *)&self->_loadingTimer, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);

  objc_storeStrong((id *)&self->_album, 0);
}

@end