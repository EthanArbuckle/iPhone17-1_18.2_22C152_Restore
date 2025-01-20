@interface MCDLibraryTableViewController
- (BOOL)artistHasCatalogID:(id)a3;
- (BOOL)canShowFavoriteContent;
- (BOOL)contentManager:(id)a3 canDrillIntoItem:(id)a4;
- (BOOL)hasRowsToDisplay;
- (BOOL)isShowingButton;
- (BOOL)showLocalContent;
- (MCDContentManagerDataSource)dataSource;
- (MCDLibraryTableViewController)initWithIdentifier:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5;
- (MCDLibraryTableViewController)initWithIdentifier:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5 dataSource:(id)a6;
- (MCDTableView)contentTableView;
- (NSString)filteringPreferenceKey;
- (NSString)identifier;
- (NSString)sortingPreferenceKey;
- (UIView)placeholderView;
- (_MCDContentManager)contentManager;
- (_TtC5Music31LibraryTableNavigationTitleView)navigationTitleView;
- (id)contentManager:(id)a3 viewControllerForItem:(id)a4;
- (id)favoriteNoContentMessage:(id)a3;
- (id)legacyFilteringPreferenceKey;
- (id)showAllActionTitle:(id)a3;
- (id)sortingPreference;
- (void)_limitedUIDidChange;
- (void)checkContentAndSetView;
- (void)contentManager:(id)a3 didReceiveResponse:(id)a4;
- (void)contentManager:(id)a3 shouldDisplayViewController:(id)a4;
- (void)dealloc;
- (void)filterButtonTapped;
- (void)playbackManagerShouldShowNowPlaying:(id)a3;
- (void)replacePlaceholderViewWithView:(id)a3;
- (void)setContentManager:(id)a3;
- (void)setContentTableView:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setIsShowingButton:(BOOL)a3;
- (void)setNavigationTitleView:(id)a3;
- (void)setPlaceholderView:(id)a3;
- (void)setShowLocalContent:(BOOL)a3;
- (void)userDefaultsChanged:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MCDLibraryTableViewController

- (MCDLibraryTableViewController)initWithIdentifier:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v9 = objc_alloc_init(_MCDLibraryDataSource);
  v10 = [(MCDLibraryTableViewController *)self initWithIdentifier:v8 limitedUI:v6 showLocalContent:v5 dataSource:v9];

  return v10;
}

- (MCDLibraryTableViewController)initWithIdentifier:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5 dataSource:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v11 = a3;
  id v12 = a6;
  v26.receiver = self;
  v26.super_class = (Class)MCDLibraryTableViewController;
  v13 = [(MCDLibraryTableViewController *)&v26 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_identifier, a3);
    objc_storeStrong((id *)&v14->_dataSource, a6);
    v14->_showLocalContent = v7;
    v15 = [MCDLibraryContentManager alloc];
    dataSource = v14->_dataSource;
    v17 = [(MCDPlaybackManager *)[MCDLibraryPlaybackManager alloc] initWithDelegate:v14];
    LOBYTE(v25) = 0;
    v18 = [(_MCDContentManager *)v15 initWithDataSource:dataSource limitedUI:v8 showLocalContent:v7 delegate:v14 viewController:v14 playbackManager:v17 shouldPerformRequestImmediately:v25];
    contentManager = v14->_contentManager;
    v14->_contentManager = &v18->super;

    v20 = [(MCDLibraryTableViewController *)v14 sortingPreferenceKey];
    if (v20)
    {
    }
    else
    {
      v21 = [(MCDLibraryTableViewController *)v14 filteringPreferenceKey];

      if (!v21)
      {
        [(_MCDContentManager *)v14->_contentManager performRequest];
        goto LABEL_6;
      }
    }
    v22 = +[NSNotificationCenter defaultCenter];
    [v22 addObserver:v14 selector:"userDefaultsChanged:" name:NSUserDefaultsDidChangeNotification object:0];

    [(MCDLibraryTableViewController *)v14 userDefaultsChanged:0];
LABEL_6:
    [(MCDTableViewController *)v14 setLimitedUI:v8];
    v23 = +[NSNotificationCenter defaultCenter];
    [v23 addObserver:v14 selector:"mediaLibraryChanged:" name:MPMediaLibraryDidChangeNotification object:0];

    v14->_canModifyView = 1;
  }

  return v14;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:NSUserDefaultsDidChangeNotification object:0];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:MPMediaLibraryDidChangeNotification object:0];

  v5.receiver = self;
  v5.super_class = (Class)MCDLibraryTableViewController;
  [(MCDLibraryTableViewController *)&v5 dealloc];
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)MCDLibraryTableViewController;
  [(MCDTableViewController *)&v9 viewDidLoad];
  v3 = [(MCDLibraryTableViewController *)self tableView];
  [(MCDLibraryTableViewController *)self setContentTableView:v3];

  v4 = [(MCDLibraryTableViewController *)self tableView];
  objc_super v5 = [(MCDLibraryTableViewController *)self contentManager];
  [v5 setTableView:v4];

  if ([(id)objc_opt_class() wantsTallCells])
  {
    uint64_t v6 = objc_opt_class();
    BOOL v7 = [(MCDLibraryTableViewController *)self contentManager];
    [v7 setTableCellClass:v6];
  }
  BOOL v8 = [(MCDLibraryTableViewController *)self tableView];
  [v8 _setHeaderAndFooterViewsFloat:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v24.receiver = self;
  v24.super_class = (Class)MCDLibraryTableViewController;
  [(MCDTableViewController *)&v24 viewWillAppear:a3];
  if ([(MCDLibraryTableViewController *)self canShowFavoriteContent])
  {
    v4 = [(MCDLibraryTableViewController *)self navigationTitleView];

    if (!v4)
    {
      objc_super v5 = [_TtC5Music31LibraryTableNavigationTitleView alloc];
      uint64_t v6 = [(MCDLibraryTableViewController *)self title];
      BOOL v7 = [(LibraryTableNavigationTitleView *)v5 initWithTitle:v6];
      [(MCDLibraryTableViewController *)self setNavigationTitleView:v7];

      BOOL v8 = [(MCDLibraryTableViewController *)self contentManager];
      id v9 = [v8 showFavoriteContent];
      v10 = [(MCDLibraryTableViewController *)self navigationTitleView];
      id v11 = [v10 filterButton];
      [v11 setSelected:v9];

      objc_initWeak(&location, self);
      v18 = _NSConcreteStackBlock;
      uint64_t v19 = 3221225472;
      v20 = sub_1000934A8;
      v21 = &unk_100FC3A10;
      objc_copyWeak(&v22, &location);
      id v12 = +[UIAction actionWithHandler:&v18];
      v13 = [(MCDLibraryTableViewController *)self navigationTitleView];
      v14 = [v13 filterButton];
      [v14 addAction:v12 forControlEvents:64];

      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
    v15 = [(MCDLibraryTableViewController *)self navigationTitleView];
    v16 = [(MCDLibraryTableViewController *)self navigationItem];
    [v16 setTitleView:v15];
  }
  else
  {
    v15 = [(MCDLibraryTableViewController *)self navigationItem];
    [v15 setTitleView:0];
  }

  v17 = [(MCDLibraryTableViewController *)self tableView];
  [v17 reloadData];

  [(MCDLibraryTableViewController *)self checkContentAndSetView];
  self->_canModifyView = 0;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MCDLibraryTableViewController;
  [(MCDTableViewController *)&v4 viewDidAppear:a3];
  self->_canModifyView = 1;
  [(MCDLibraryTableViewController *)self checkContentAndSetView];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MCDLibraryTableViewController;
  [(MCDTableViewController *)&v5 viewWillDisappear:a3];
  objc_super v4 = [(MCDLibraryTableViewController *)self navigationItem];
  [v4 setTitleView:0];
}

- (void)userDefaultsChanged:(id)a3
{
  objc_super v4 = [(MCDLibraryTableViewController *)self contentManager];
  objc_super v5 = [v4 lastReceivedResponse];
  BOOL v6 = v5 == 0;

  BOOL v7 = [(MCDLibraryTableViewController *)self contentManager];
  id v25 = [v7 sortingPreference];

  id v8 = [(MCDLibraryTableViewController *)self sortingPreference];
  if (v25 == v8)
  {
    id v11 = v25;
  }
  else
  {
    id v9 = [(MCDLibraryTableViewController *)self sortingPreference];
    unsigned __int8 v10 = [v25 isEqualToString:v9];

    if (v10) {
      goto LABEL_6;
    }
    id v11 = [(MCDLibraryTableViewController *)self sortingPreference];
    id v12 = [(MCDLibraryTableViewController *)self contentManager];
    [v12 setSortingPreference:v11];

    BOOL v6 = 1;
  }

LABEL_6:
  v13 = [(MCDLibraryTableViewController *)self filteringPreferenceKey];
  v14 = [(MCDLibraryTableViewController *)self legacyFilteringPreferenceKey];
  v15 = +[NSString stringWithFormat:@"LibraryFilterOptionsController-%@", v14];
  BOOL v16 = +[LibraryFilterOptionsController isFilteringToFavoritesWithStorageKey:v13 legacyStorageKey:v15];

  v17 = [(MCDLibraryTableViewController *)self contentManager];
  LODWORD(v15) = [v17 showFavoriteContent];

  if (v16 == v15)
  {
    if (!v6) {
      goto LABEL_10;
    }
  }
  else
  {
    v18 = [(MCDLibraryTableViewController *)self navigationTitleView];
    uint64_t v19 = [v18 filterButton];
    [v19 setSelected:v16];

    v20 = [(MCDLibraryTableViewController *)self contentManager];
    [v20 setShowFavoriteContent:v16];

    v21 = [(MCDLibraryTableViewController *)self contentManager];
    id v22 = [v21 playbackManager];
    [v22 setFavoriteContentOnly:v16];

    v23 = [(MCDLibraryTableViewController *)self contentManager];
    [v23 setLastReceivedResponse:0];

    [(MCDLibraryTableViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
  objc_super v24 = [(MCDLibraryTableViewController *)self contentManager];
  [v24 performRequest];

LABEL_10:
}

- (id)sortingPreference
{
  v3 = +[NSUserDefaults standardUserDefaults];
  objc_super v4 = [(MCDLibraryTableViewController *)self sortingPreferenceKey];
  objc_super v5 = [v3 stringForKey:v4];

  return v5;
}

- (NSString)sortingPreferenceKey
{
  return 0;
}

- (NSString)filteringPreferenceKey
{
  return 0;
}

- (id)legacyFilteringPreferenceKey
{
  return 0;
}

- (void)_limitedUIDidChange
{
  BOOL v3 = [(MCDTableViewController *)self limitedUI];
  id v4 = [(MCDLibraryTableViewController *)self contentManager];
  [v4 setLimitedUI:v3];
}

- (BOOL)canShowFavoriteContent
{
  identifier = self->_identifier;
  id v4 = sub_100093A64();
  LODWORD(identifier) = [(NSString *)identifier isEqualToString:v4];

  if (identifier)
  {
    objc_super v5 = [(MCDLibraryTableViewController *)self dataSource];
    BOOL v6 = [v5 person];
    unsigned __int8 v7 = v6 == 0;
LABEL_14:

    goto LABEL_15;
  }
  id v8 = self->_identifier;
  objc_super v5 = sub_100093B6C();
  if (![(NSString *)v8 isEqualToString:v5])
  {
    id v9 = self->_identifier;
    BOOL v6 = sub_100093C74();
    if ([(NSString *)v9 isEqualToString:v6])
    {
      unsigned __int8 v7 = 1;
    }
    else
    {
      unsigned __int8 v10 = self->_identifier;
      id v11 = sub_100093D7C();
      if ([(NSString *)v10 isEqualToString:v11])
      {
        unsigned __int8 v7 = 1;
      }
      else
      {
        id v12 = self->_identifier;
        v13 = sub_100093E84();
        if ([(NSString *)v12 isEqualToString:v13])
        {
          unsigned __int8 v7 = 1;
        }
        else
        {
          v14 = self->_identifier;
          v15 = sub_100093F8C();
          unsigned __int8 v7 = [(NSString *)v14 isEqualToString:v15];
        }
      }
    }
    goto LABEL_14;
  }
  unsigned __int8 v7 = 1;
LABEL_15:

  return v7;
}

- (void)filterButtonTapped
{
  BOOL v3 = [(MCDLibraryTableViewController *)self contentManager];
  unsigned int v4 = [v3 showFavoriteContent];

  uint64_t v25 = 0;
  objc_super v26 = &v25;
  uint64_t v27 = 0x2050000000;
  objc_super v5 = (void *)qword_1010D6DD0;
  uint64_t v28 = qword_1010D6DD0;
  if (!qword_1010D6DD0)
  {
    location[0] = _NSConcreteStackBlock;
    location[1] = (id)3221225472;
    location[2] = sub_100095AF8;
    location[3] = &unk_100FC34A0;
    location[4] = &v25;
    sub_100095AF8((uint64_t)location);
    objc_super v5 = (void *)v26[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v25, 8);
  unsigned __int8 v7 = [v6 alertControllerWithTitle:0 message:0 preferredStyle:0];
  id v8 = +[UIImage systemImageNamed:@"checkmark"];
  uint64_t v9 = [(MCDLibraryTableViewController *)self showAllActionTitle:self->_identifier];
  objc_initWeak(location, self);
  if (v4) {
    unsigned __int8 v10 = 0;
  }
  else {
    unsigned __int8 v10 = v8;
  }
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100094438;
  v22[3] = &unk_100FC3A38;
  v22[4] = self;
  objc_copyWeak(&v23, location);
  uint64_t v19 = (void *)v9;
  id v11 = +[MCDAlertAction actionWithTitle:v9 image:v10 handler:v22];
  [v7 addAction:v11];
  id v12 = +[NSBundle mainBundle];
  v13 = [v12 localizedStringForKey:@"Favorites" value:&stru_101023248 table:0];
  if (v4) {
    v14 = v8;
  }
  else {
    v14 = 0;
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000944E4;
  v20[3] = &unk_100FC3A38;
  v20[4] = self;
  objc_copyWeak(&v21, location);
  v15 = +[MCDAlertAction actionWithTitle:v13 image:v14 handler:v20];

  [v7 addAction:v15];
  BOOL v16 = +[NSBundle mainBundle];
  v17 = [v16 localizedStringForKey:@"Cancel" value:&stru_101023248 table:0];
  v18 = +[UIAlertAction actionWithTitle:v17 style:1 handler:0];
  [v7 addAction:v18];

  [(MCDLibraryTableViewController *)self presentViewController:v7 animated:1 completion:0];
  objc_destroyWeak(&v21);

  objc_destroyWeak(&v23);
  objc_destroyWeak(location);
}

- (id)showAllActionTitle:(id)a3
{
  id v3 = a3;
  unsigned int v4 = sub_100093B6C();
  unsigned int v5 = [v3 isEqualToString:v4];

  if (v5)
  {
    id v6 = +[NSBundle mainBundle];
    unsigned __int8 v7 = v6;
    CFStringRef v8 = @"All Playlists";
LABEL_13:
    uint64_t v19 = [v6 localizedStringForKey:v8 value:&stru_101023248 table:0];

    goto LABEL_14;
  }
  uint64_t v9 = sub_100093C74();
  unsigned int v10 = [v3 isEqualToString:v9];

  if (v10)
  {
    id v6 = +[NSBundle mainBundle];
    unsigned __int8 v7 = v6;
    CFStringRef v8 = @"All Artists";
    goto LABEL_13;
  }
  id v11 = sub_100093A64();
  unsigned int v12 = [v3 isEqualToString:v11];

  if (v12)
  {
    id v6 = +[NSBundle mainBundle];
    unsigned __int8 v7 = v6;
    CFStringRef v8 = @"All Albums";
    goto LABEL_13;
  }
  v13 = sub_100093D7C();
  unsigned int v14 = [v3 isEqualToString:v13];

  if (v14)
  {
    id v6 = +[NSBundle mainBundle];
    unsigned __int8 v7 = v6;
    CFStringRef v8 = @"All Compilations";
    goto LABEL_13;
  }
  v15 = sub_100093E84();
  unsigned int v16 = [v3 isEqualToString:v15];

  if (v16)
  {
    id v6 = +[NSBundle mainBundle];
    unsigned __int8 v7 = v6;
    CFStringRef v8 = @"All Songs";
    goto LABEL_13;
  }
  v17 = sub_100093F8C();
  unsigned int v18 = [v3 isEqualToString:v17];

  if (v18)
  {
    id v6 = +[NSBundle mainBundle];
    unsigned __int8 v7 = v6;
    CFStringRef v8 = @"All";
    goto LABEL_13;
  }
  uint64_t v19 = &stru_101023248;
LABEL_14:

  return v19;
}

- (id)favoriteNoContentMessage:(id)a3
{
  id v3 = a3;
  unsigned int v4 = sub_100093B6C();
  if ([v3 isEqualToString:v4])
  {

LABEL_4:
    unsigned __int8 v7 = +[NSBundle mainBundle];
    CFStringRef v8 = v7;
    CFStringRef v9 = @"Playlists you favorite will appear here.";
LABEL_5:
    unsigned int v10 = [v7 localizedStringForKey:v9 value:&stru_101023248 table:0];

    goto LABEL_6;
  }
  unsigned int v5 = sub_100093F8C();
  unsigned int v6 = [v3 isEqualToString:v5];

  if (v6) {
    goto LABEL_4;
  }
  unsigned int v12 = sub_100093C74();
  unsigned int v13 = [v3 isEqualToString:v12];

  if (v13)
  {
    unsigned __int8 v7 = +[NSBundle mainBundle];
    CFStringRef v8 = v7;
    CFStringRef v9 = @"Artists you favorite will appear here.";
    goto LABEL_5;
  }
  unsigned int v14 = sub_100093A64();
  if ([v3 isEqualToString:v14])
  {

LABEL_14:
    unsigned __int8 v7 = +[NSBundle mainBundle];
    CFStringRef v8 = v7;
    CFStringRef v9 = @"Albums you favorite will appear here.";
    goto LABEL_5;
  }
  v15 = sub_100093D7C();
  unsigned int v16 = [v3 isEqualToString:v15];

  if (v16) {
    goto LABEL_14;
  }
  v17 = sub_100093E84();
  unsigned int v18 = [v3 isEqualToString:v17];

  if (v18)
  {
    unsigned __int8 v7 = +[NSBundle mainBundle];
    CFStringRef v8 = v7;
    CFStringRef v9 = @"Songs you favorite will appear here.";
    goto LABEL_5;
  }
  unsigned int v10 = &stru_101023248;
LABEL_6:

  return v10;
}

- (BOOL)hasRowsToDisplay
{
  if (self->_isShowingButton) {
    return 1;
  }
  v3.receiver = self;
  v3.super_class = (Class)MCDLibraryTableViewController;
  return [(MCDTableViewController *)&v3 hasRowsToDisplay];
}

- (void)contentManager:(id)a3 didReceiveResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  CFStringRef v8 = (void (*)(uint64_t))off_1010D6DD8;
  id v22 = off_1010D6DD8;
  if (!off_1010D6DD8)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_100095B50;
    objc_super v24 = &unk_100FC34A0;
    *(void *)uint64_t v25 = &v19;
    CFStringRef v9 = (void *)sub_100029470();
    unsigned int v10 = dlsym(v9, "MCDMusicGeneralLogging");
    *(void *)(*(void *)(*(void *)v25 + 8) + 24) = v10;
    off_1010D6DD8 = *(_UNKNOWN **)(*(void *)(*(void *)v25 + 8) + 24);
    CFStringRef v8 = (void (*)(uint64_t))v20[3];
  }
  _Block_object_dispose(&v19, 8);
  if (!v8)
  {
    sub_100D691B8();
    __break(1u);
  }
  unsigned int v12 = v8(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v13 = [v7 results];
    id v14 = [v13 totalItemCount];
    v15 = [(MCDLibraryTableViewController *)self contentManager];
    unsigned int v16 = [v15 showFavoriteContent];
    v17 = [v7 request];
    *(_DWORD *)buf = 138413570;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    *(_WORD *)&buf[22] = 2112;
    objc_super v24 = v6;
    *(_WORD *)uint64_t v25 = 2048;
    *(void *)&v25[2] = v14;
    __int16 v26 = 1024;
    unsigned int v27 = v16;
    __int16 v28 = 2112;
    v29 = v17;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ Received response %@ from %@: itemCount=%ld, showFavoriteContent=%d, request=%@", buf, 0x3Au);
  }
  unsigned int v18 = [(MCDLibraryTableViewController *)self tableView];
  [v18 reloadData];

  [(MCDLibraryTableViewController *)self checkContentAndSetView];
}

- (id)contentManager:(id)a3 viewControllerForItem:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = +[MCDAlbumsTableViewController albumsForGenre:v5 limitedUI:[(MCDTableViewController *)self limitedUI] showLocalContent:[(MCDLibraryTableViewController *)self showLocalContent]];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = +[MCDAlbumTracksTableViewController albumTracksViewControllerForContentItem:v5 limitedUI:[(MCDTableViewController *)self limitedUI] showLocalContent:[(MCDLibraryTableViewController *)self showLocalContent]];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = v5;
          if ([v9 type] == (id)3)
          {
            unsigned int v10 = +[MCDPlaylistsViewController playlistsViewControllerForFolder:v9 limitedUI:[(MCDTableViewController *)self limitedUI] showLocalContent:[(MCDLibraryTableViewController *)self showLocalContent]];
          }
          else
          {
            unsigned int v10 = [[MCDPlaylistTracksTableViewController alloc] initWithPlaylist:v9 limitedUI:[(MCDTableViewController *)self limitedUI] showLocalContent:[(MCDLibraryTableViewController *)self showLocalContent]];
          }
          id v7 = v10;
        }
        else
        {
          id v7 = 0;
        }
        goto LABEL_8;
      }
      uint64_t v6 = +[MCDAlbumsTableViewController albumsForPerson:v5 limitedUI:[(MCDTableViewController *)self limitedUI] showLocalContent:[(MCDLibraryTableViewController *)self showLocalContent]];
    }
  }
  id v7 = (void *)v6;
LABEL_8:

  return v7;
}

- (BOOL)contentManager:(id)a3 canDrillIntoItem:(id)a4
{
  id v4 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (void)contentManager:(id)a3 shouldDisplayViewController:(id)a4
{
  id v5 = a4;
  [v5 setPlayActivityFeatureNameSourceViewController:self];
  id v6 = [(MCDLibraryTableViewController *)self navigationController];
  [v6 pushViewController:v5 animated:1];
}

- (void)playbackManagerShouldShowNowPlaying:(id)a3
{
  id v4 = [(MCDLibraryTableViewController *)self navigationController];
  [v4 MCD_pushNowPlayingViewControllerAnimated:1 fromViewController:self];
}

- (void)checkContentAndSetView
{
  self->_isShowingButton = 0;
  objc_super v3 = [(MCDLibraryTableViewController *)self contentManager];
  id v4 = [v3 lastReceivedResponse];
  if ([v4 isEmpty])
  {
    id v5 = [(MCDLibraryTableViewController *)self contentManager];
    unsigned int v6 = [v5 showFavoriteContent];

    if (v6)
    {
      id v29 = [(MCDLibraryTableViewController *)self favoriteNoContentMessage:self->_identifier];
      id v7 = +[CarPlayInformationView noContentWithTitle:0 subtitle:v29 buttonText:0 buttonAction:0];
      [(MCDLibraryTableViewController *)self replacePlaceholderViewWithView:v7];

      return;
    }
  }
  else
  {
  }
  CFStringRef v8 = [(MCDLibraryTableViewController *)self contentManager];
  id v9 = [v8 lastReceivedResponse];
  unsigned int v10 = [v9 isEmpty];

  if (v10)
  {
    if ([(MCDLibraryTableViewController *)self showLocalContent])
    {
      uint64_t v11 = +[NSString downloadedOnlyMessage];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unsigned int v12 = [(MCDContentManagerDataSource *)self->_dataSource person];

        if (v12)
        {
          unsigned int v13 = [(MCDContentManagerDataSource *)self->_dataSource person];
          unsigned int v14 = [(MCDLibraryTableViewController *)self artistHasCatalogID:v13];
          v15 = +[NSBundle mainBundle];
          unsigned int v16 = v15;
          if (v14)
          {
            v17 = [v15 localizedStringForKey:@"Add music by %@ to save it here, or start a station to hear similar music.", &stru_101023248, 0 value table];
            unsigned int v18 = [(MCDLibraryTableViewController *)self title];
            uint64_t v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v18);

            uint64_t v19 = +[NSBundle mainBundle];
            v20 = [v19 localizedStringForKey:@"Start Station" value:&stru_101023248 table:0];

            self->_isShowingButton = 1;
          }
          else
          {
            unsigned int v27 = [v15 localizedStringForKey:@"Add music by %@ to save it here." value:&stru_101023248 table:0];
            __int16 v28 = [(MCDLibraryTableViewController *)self title];
            uint64_t v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v27, v28);

            v20 = 0;
          }

          goto LABEL_22;
        }
      }
      uint64_t v21 = +[MusicCarPlayApplicationCapabilitiesController sharedController];
      unsigned __int8 v22 = [v21 subscriptionCapabilities];

      id v23 = +[NSBundle mainBundle];
      objc_super v24 = v23;
      if (v22) {
        CFStringRef v25 = @"Music added from Apple Music, from your computer, or purchased in iTunes will appear here.";
      }
      else {
        CFStringRef v25 = @"Music purchased in iTunes or added from your computer will appear here.";
      }
      uint64_t v11 = [v23 localizedStringForKey:v25 value:&stru_101023248 table:0];
    }
    v20 = 0;
LABEL_22:
    objc_initWeak(&location, self);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1000953E4;
    v30[3] = &unk_100FC3950;
    objc_copyWeak(&v31, &location);
    v30[4] = self;
    __int16 v26 = +[CarPlayInformationView noContentWithTitle:0 subtitle:v11 buttonText:v20 buttonAction:v30];
    [(MCDLibraryTableViewController *)self replacePlaceholderViewWithView:v26];

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);

    return;
  }

  [(MCDLibraryTableViewController *)self replacePlaceholderViewWithView:0];
}

- (void)replacePlaceholderViewWithView:(id)a3
{
  id v4 = a3;
  if (self->_canModifyView)
  {
    id v27 = v4;
    [(MCDLibraryTableViewController *)self setPlaceholderView:v4];
    id v5 = [(MCDLibraryTableViewController *)self placeholderView];

    if (v5)
    {
      unsigned int v6 = [(MCDLibraryTableViewController *)self tableView];
      [v6 frame];
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;

      v15 = [(MCDLibraryTableViewController *)self tableView];
      [v15 safeAreaInsets];
      double v17 = v8 + v16;
      double v19 = v10 + v18;
      double v21 = v12 - (v16 + v20);
      double v23 = v14 - (v18 + v22);

      objc_super v24 = [(MCDLibraryTableViewController *)self placeholderView];
      [v24 setFrame:v17, v19, v21, v23];

      CFStringRef v25 = [(MCDLibraryTableViewController *)self placeholderView];
      [(MCDLibraryTableViewController *)self setView:v25];
    }
    else
    {
      __int16 v26 = [(MCDLibraryTableViewController *)self contentTableView];
      [(MCDLibraryTableViewController *)self setView:v26];

      CFStringRef v25 = [(MCDLibraryTableViewController *)self contentTableView];
      [v25 reloadData];
    }

    id v4 = v27;
  }
}

- (BOOL)artistHasCatalogID:(id)a3
{
  objc_super v3 = [a3 identifiers];
  id v4 = [v3 universalStore];

  if (v4)
  {
    v9[1] = [v4 purchasedAdamID:[v4 subscriptionAdamID]];
    id v5 = [v4 adamID];
    uint64_t v6 = 0;
    v9[2] = v5;
    while (!v9[v6])
    {
      if (++v6 == 3) {
        goto LABEL_5;
      }
    }
    BOOL v7 = 1;
  }
  else
  {
LABEL_5:
    BOOL v7 = 0;
  }

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isShowingButton
{
  return self->_isShowingButton;
}

- (void)setIsShowingButton:(BOOL)a3
{
  self->_isShowingButton = a3;
}

- (_MCDContentManager)contentManager
{
  return self->_contentManager;
}

- (void)setContentManager:(id)a3
{
}

- (MCDContentManagerDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (BOOL)showLocalContent
{
  return self->_showLocalContent;
}

- (void)setShowLocalContent:(BOOL)a3
{
  self->_showLocalContent = a3;
}

- (MCDTableView)contentTableView
{
  return self->_contentTableView;
}

- (void)setContentTableView:(id)a3
{
}

- (UIView)placeholderView
{
  return self->_placeholderView;
}

- (void)setPlaceholderView:(id)a3
{
}

- (_TtC5Music31LibraryTableNavigationTitleView)navigationTitleView
{
  return self->_navigationTitleView;
}

- (void)setNavigationTitleView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationTitleView, 0);
  objc_storeStrong((id *)&self->_placeholderView, 0);
  objc_storeStrong((id *)&self->_contentTableView, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_contentManager, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end