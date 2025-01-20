@interface MCDBrowserTableViewController
- (BOOL)showOnlyLocalContent;
- (BOOL)wantsGridCellAtIndexPath:(id)a3;
- (MCDBrowserTableViewController)initWithLimitedUI:(BOOL)a3;
- (MCDLibraryContentManager)recentlyAddedContentManager;
- (MCDLibraryPlaybackManager)libraryPlaybackManager;
- (MCDRecentlyAddedDataSource)recentlyAddedDataSource;
- (NSArray)viewControllers;
- (UITableView)contentTableView;
- (UIView)placeholderView;
- (id)_textForHeaderView;
- (id)artworksWithTitlesAtIndex:(unint64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)titleForIdentifier:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)_contentGroups;
- (void)_initiatePlaybackForItem:(id)a3;
- (void)_limitedUIDidChange;
- (void)_loadCellIdentifiers;
- (void)_replacePlaceholderViewWithView:(id)a3;
- (void)_updateCellOrdering:(id)a3;
- (void)contentManager:(id)a3 didReceiveResponse:(id)a4;
- (void)dealloc;
- (void)playbackManagerShouldShowNowPlaying:(id)a3;
- (void)setContentTableView:(id)a3;
- (void)setLibraryPlaybackManager:(id)a3;
- (void)setPlaceholderView:(id)a3;
- (void)setRecentlyAddedContentManager:(id)a3;
- (void)setRecentlyAddedDataSource:(id)a3;
- (void)setShowOnlyLocalContent:(BOOL)a3;
- (void)setViewControllers:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation MCDBrowserTableViewController

- (MCDBrowserTableViewController)initWithLimitedUI:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MCDBrowserTableViewController;
  v3 = [(MCDTableViewController *)&v6 initWithLimitedUI:a3];
  v4 = v3;
  if (v3) {
    [(MCDBrowserTableViewController *)v3 setPlayActivityFeatureName:@"library"];
  }
  return v4;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:NSUserDefaultsDidChangeNotification object:0];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:MPMediaLibraryDidChangeNotification object:0];

  v5.receiver = self;
  v5.super_class = (Class)MCDBrowserTableViewController;
  [(MCDBrowserTableViewController *)&v5 dealloc];
}

- (void)viewDidLoad
{
  v20.receiver = self;
  v20.super_class = (Class)MCDBrowserTableViewController;
  [(MCDTableViewController *)&v20 viewDidLoad];
  v3 = [(MCDBrowserTableViewController *)self tableView];
  uint64_t v4 = objc_opt_class();
  objc_super v5 = +[_MCDReusableCell reuseIdentifier];
  [v3 registerClass:v4 forCellReuseIdentifier:v5];

  objc_super v6 = [(MCDPlaybackManager *)[MCDLibraryPlaybackManager alloc] initWithDelegate:self];
  [(MCDBrowserTableViewController *)self setLibraryPlaybackManager:v6];

  v7 = [(_MCDLibraryDataSource *)[MCDRecentlyAddedDataSource alloc] initWithLimitedUI:[(MCDTableViewController *)self limitedUI]];
  [(MCDBrowserTableViewController *)self setRecentlyAddedDataSource:v7];

  v8 = [MCDLibraryContentManager alloc];
  v9 = [(MCDBrowserTableViewController *)self recentlyAddedDataSource];
  BOOL v10 = [(MCDTableViewController *)self limitedUI];
  BOOL v11 = [(MCDBrowserTableViewController *)self showOnlyLocalContent];
  v12 = [(MCDBrowserTableViewController *)self libraryPlaybackManager];
  LOBYTE(v19) = 1;
  v13 = [(_MCDContentManager *)v8 initWithDataSource:v9 limitedUI:v10 showLocalContent:v11 delegate:self viewController:self playbackManager:v12 shouldPerformRequestImmediately:v19];
  [(MCDBrowserTableViewController *)self setRecentlyAddedContentManager:v13];

  v14 = [(MCDBrowserTableViewController *)self tableView];
  [(MCDBrowserTableViewController *)self setContentTableView:v14];

  v15 = +[MCDBrowserIdentifiers sharedInstance];
  [v15 _identifiersDidChange];

  v16 = +[MCDBrowserIdentifiers sharedInstance];
  [v16 _updateCellIdentifiersOrdering];

  [(MCDBrowserTableViewController *)self _loadCellIdentifiers];
  v17 = +[NSNotificationCenter defaultCenter];
  [v17 addObserver:self selector:"_updateCellOrdering:" name:NSUserDefaultsDidChangeNotification object:0];

  v18 = +[NSNotificationCenter defaultCenter];
  [v18 addObserver:self selector:"_showContentView:" name:MPMediaLibraryDidChangeNotification object:0];
}

- (void)_limitedUIDidChange
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(MCDBrowserTableViewController *)self viewControllers];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) setLimitedUI:[self limitedUI]];
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8 = [(MCDBrowserTableViewController *)self recentlyAddedContentManager];
  [v8 setLimitedUI:[self limitedUI]];
}

- (id)_textForHeaderView
{
  return 0;
}

- (void)_updateCellOrdering:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008E3B8;
  block[3] = &unk_100FC3900;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (unint64_t)_contentGroups
{
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v2 = +[MCDBrowserIdentifiers sharedInstance];
  v3 = [v2 cellIdentifiers];

  id v4 = [v3 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v32;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(v3);
        }
        long long v9 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        long long v10 = sub_10008D500();
        unsigned int v11 = [v9 isEqualToString:v10];

        if (v11)
        {
          v6 |= 1uLL;
        }
        else
        {
          long long v12 = sub_10008D608();
          unsigned int v13 = [v9 isEqualToString:v12];

          if (v13)
          {
            v6 |= 0x80uLL;
          }
          else
          {
            v14 = sub_10008D2F0();
            unsigned int v15 = [v9 isEqualToString:v14];

            if (v15)
            {
              v6 |= 0x40uLL;
            }
            else
            {
              v16 = sub_10008D3F8();
              unsigned int v17 = [v9 isEqualToString:v16];

              if (v17)
              {
                v6 |= 2uLL;
              }
              else
              {
                v18 = sub_10008D818();
                unsigned int v19 = [v9 isEqualToString:v18];

                if (v19)
                {
                  v6 |= 0x10uLL;
                }
                else
                {
                  objc_super v20 = sub_10008DA28();
                  unsigned int v21 = [v9 isEqualToString:v20];

                  if (v21)
                  {
                    v6 |= 4uLL;
                  }
                  else
                  {
                    v22 = sub_10008D920();
                    unsigned int v23 = [v9 isEqualToString:v22];

                    if (v23)
                    {
                      v6 |= 8uLL;
                    }
                    else
                    {
                      v24 = sub_10008D1E8();
                      unsigned int v25 = [v9 isEqualToString:v24];

                      if (v25)
                      {
                        v6 |= 0x41uLL;
                      }
                      else
                      {
                        v26 = sub_10008D710();
                        unsigned int v27 = [v9 isEqualToString:v26];

                        if (v27) {
                          v6 |= 0x400uLL;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  v28 = +[MPMediaLibrary defaultMediaLibrary];
  id v29 = [v28 filterAvailableContentGroups:v6 withOptions:0];

  return (unint64_t)v29;
}

- (void)_loadCellIdentifiers
{
  v56 = +[NSMutableArray array];
  unint64_t v3 = [(MCDBrowserTableViewController *)self _contentGroups];
  id v4 = +[MusicCarPlayManager sharedManager];
  LODWORD(v55) = [v4 libraryHasContent];

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v5 = +[MCDBrowserIdentifiers sharedInstance];
  uint64_t v6 = [v5 cellIdentifiers];

  id v7 = [v6 countByEnumeratingWithState:&v57 objects:v61 count:16];
  if (v7)
  {
    id v8 = v7;
    HIDWORD(v55) = v55 ^ 1;
    uint64_t v9 = *(void *)v58;
    do
    {
      long long v10 = 0;
      do
      {
        if (*(void *)v58 != v9) {
          objc_enumerationMutation(v6);
        }
        unsigned int v11 = *(void **)(*((void *)&v57 + 1) + 8 * (void)v10);
        long long v12 = sub_10008D500();
        unsigned int v13 = [v11 isEqualToString:v12];

        if (v13) {
          BOOL v14 = (v3 & 1) == 0;
        }
        else {
          BOOL v14 = 1;
        }
        if (!v14)
        {
          id v29 = MCDAlbumsTableViewController;
          goto LABEL_33;
        }
        unsigned int v15 = sub_10008D608();
        unsigned int v16 = [v11 isEqualToString:v15];

        if (v16) {
          BOOL v17 = (v3 & 0x80) == 0;
        }
        else {
          BOOL v17 = 1;
        }
        if (!v17)
        {
          id v29 = MCDSongsTableViewController;
          goto LABEL_33;
        }
        v18 = sub_10008D1E8();
        unsigned int v19 = [v11 isEqualToString:v18] ^ 1;
        if (v3) {
          int v20 = v19;
        }
        else {
          int v20 = 1;
        }

        if (((v20 | HIDWORD(v55)) & 1) == 0)
        {
          id v29 = MCDRecentlyAddedTableViewController;
          goto LABEL_33;
        }
        unsigned int v21 = sub_10008D2F0();
        unsigned int v22 = [v11 isEqualToString:v21] ^ 1;
        if ((v3 & 0x40) != 0) {
          int v23 = v22;
        }
        else {
          int v23 = 1;
        }

        if (((v23 | HIDWORD(v55)) & 1) == 0)
        {
          id v29 = MCDPlaylistsViewController;
          goto LABEL_33;
        }
        v24 = sub_10008D710();
        unsigned int v25 = [v11 isEqualToString:v24] ^ 1;
        if ((v3 & 0x400) != 0) {
          int v26 = v25;
        }
        else {
          int v26 = 1;
        }

        if (((v26 | HIDWORD(v55)) & 1) == 0)
        {
          v30 = +[MCDPlaylistsViewController madeForYouViewControllerWithIdentifier:v11 limitedUI:[(MCDTableViewController *)self limitedUI] showLocalContent:[(MCDBrowserTableViewController *)self showOnlyLocalContent]];
          goto LABEL_34;
        }
        unsigned int v27 = sub_10008D3F8();
        unsigned int v28 = [v11 isEqualToString:v27];

        if (v28 && (v3 & 2) != 0)
        {
          id v29 = MCDArtistsTableViewController;
          goto LABEL_33;
        }
        v35 = sub_10008D818();
        unsigned int v36 = [v11 isEqualToString:v35];

        if (v36 && (v3 & 0x10) != 0)
        {
          id v29 = MCDGenresViewController;
          goto LABEL_33;
        }
        v37 = sub_10008DA28();
        unsigned int v38 = [v11 isEqualToString:v37];

        if (v38 && (v3 & 4) != 0)
        {
          id v29 = MCDCompilationsTableViewController;
          goto LABEL_33;
        }
        v39 = sub_10008D920();
        unsigned int v40 = [v11 isEqualToString:v39];

        if (v40 && (v3 & 8) != 0)
        {
          id v29 = MCDComposersTableViewController;
LABEL_33:
          v30 = [v29 alloc] initWithIdentifier:v11 limitedUI:[self limitedUI] showOnlyLocalContent:[self showOnlyLocalContent]];
LABEL_34:
          long long v31 = v30;
          if (!v30) {
            goto LABEL_37;
          }
          long long v32 = [(MCDBrowserTableViewController *)self titleForIdentifier:v11];
          [v31 setTitle:v32];

          long long v33 = +[MCDBrowserIdentifiers symbolImageForIdentifier:v11];
          long long v34 = [v31 tabBarItem];
          [v34 setImage:v33];

          [v56 addObject:v31];
LABEL_36:

          goto LABEL_37;
        }
        long long v31 = sub_10008DB30();
        if (![v11 isEqualToString:v31]) {
          goto LABEL_36;
        }
        unsigned __int8 v41 = [(MCDBrowserTableViewController *)self showOnlyLocalContent];

        if ((v41 & 1) == 0)
        {
          v42 = +[MPMediaLibrary deviceMediaLibrary];
          int v43 = [v42 filterAvailableContentGroups:128 withOptions:2] ? v55 : 0;

          if (v43 == 1)
          {
            v30 = [[MCDLocalBrowserTableViewController alloc] initWithLimitedUI:[(MCDTableViewController *)self limitedUI]];
            goto LABEL_34;
          }
        }
LABEL_37:
        long long v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v44 = [v6 countByEnumeratingWithState:&v57 objects:v61 count:16];
      id v8 = v44;
    }
    while (v44);
  }

  v45 = +[NSArray arrayWithArray:v56];
  viewControllers = self->_viewControllers;
  self->_viewControllers = v45;

  v47 = [(MCDBrowserTableViewController *)self tableView];
  [v47 reloadData];

  if (v55)
  {
    [(MCDBrowserTableViewController *)self _replacePlaceholderViewWithView:0];
  }
  else
  {
    v48 = +[MusicCarPlayApplicationCapabilitiesController sharedController];
    unsigned __int8 v49 = [v48 subscriptionCapabilities];
    v50 = +[NSBundle mainBundle];
    v51 = v50;
    if (v49) {
      CFStringRef v52 = @"Music added from Apple Music, from your computer, or purchased in iTunes will appear here.";
    }
    else {
      CFStringRef v52 = @"Music purchased in iTunes or added from your computer will appear here.";
    }
    v53 = [v50 localizedStringForKey:v52 value:&stru_101023248 table:0 v55];

    v54 = +[CarPlayInformationView noContentWithTitle:0 subtitle:v53 buttonText:0 buttonAction:0];
    [(MCDBrowserTableViewController *)self _replacePlaceholderViewWithView:v54];
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_viewControllers count];
}

- (BOOL)wantsGridCellAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [v4 row];
  if (v5 >= (id)[(NSArray *)self->_viewControllers count])
  {
    char isKindOfClass = 0;
  }
  else
  {
    uint64_t v6 = -[NSArray objectAtIndexedSubscript:](self->_viewControllers, "objectAtIndexedSubscript:", [v4 row]);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v24 = a3;
  id v6 = a4;
  unsigned int v25 = -[self->_viewControllers objectAtIndexedSubscript:[v6 indexAtPosition:[v6 length] - 1]];
  int v23 = [v25 title];
  if ([(MCDBrowserTableViewController *)self wantsGridCellAtIndexPath:v6])
  {
    id v26 = +[CPUIImageRowCell cellForTableView:v24];
    id v7 = objc_opt_new();
    id v8 = objc_opt_new();
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v9 = [(MCDBrowserTableViewController *)self artworksWithTitlesAtIndex:0];
    id v10 = [v9 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v34;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v34 != v11) {
            objc_enumerationMutation(v9);
          }
          unsigned int v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          BOOL v14 = [v13 first];
          [v7 addObject:v14];

          unsigned int v15 = [v13 second];
          [v8 addObject:v15];
        }
        id v10 = [v9 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v10);
    }

    objc_initWeak(&location, self);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10008F18C;
    v30[3] = &unk_100FC3928;
    objc_copyWeak(&v31, &location);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10008F230;
    v27[3] = &unk_100FC3950;
    objc_copyWeak(&v29, &location);
    id v28 = v6;
    LOBYTE(v22) = 1;
    unsigned int v16 = +[CPUIImageRowCellConfiguration configurationWithText:v23 artworkCatalogs:v7 imageTitles:v8 selectGridItemBlock:v30 selectTitleBlock:v27 showActivityIndicator:0 enabled:v22];
    [v26 applyConfiguration:v16];

    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }
  else
  {
    id v26 = +[_MCDReusableCell cellForTableView:v24 indexPath:v6];
    BOOL v17 = [v26 textLabel];
    [v17 setText:v23];

    v18 = [v25 tabBarItem];
    unsigned int v19 = [v18 image];
    int v20 = [v26 imageView];
    [v20 setImage:v19];

    [v26 setAccessoryType:1];
  }

  return v26;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [v5 indexAtPosition:[v5 length] - 1];

  id v8 = [(NSArray *)self->_viewControllers objectAtIndex:v6];
  [v8 setPlayActivityFeatureNameSourceViewController:self];
  id v7 = [(MCDBrowserTableViewController *)self navigationController];
  [v7 pushViewController:v8 animated:1];
}

- (void)contentManager:(id)a3 didReceiveResponse:(id)a4
{
  id v4 = [(MCDBrowserTableViewController *)self tableView];
  [v4 reloadData];
}

- (void)playbackManagerShouldShowNowPlaying:(id)a3
{
  id v3 = [(MCDBrowserTableViewController *)self navigationController];
  [v3 MCD_pushNowPlayingViewControllerAnimated:1];
}

- (id)artworksWithTitlesAtIndex:(unint64_t)a3
{
  id v31 = objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v30 = self;
  id v4 = [(MCDBrowserTableViewController *)self recentlyAddedContentManager];
  id v5 = [v4 itemsInSectionAtIndex:a3];

  id v6 = [v5 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v6)
  {
    uint64_t v8 = *(void *)v33;
    *(void *)&long long v7 = 138543618;
    long long v28 = v7;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v11 = v10;
          long long v12 = [v11 artworkCatalog];
          if (!v12)
          {
            if ([v11 type] != (id)4
              || ([v11 playlist],
                  unsigned int v13 = objc_claimAutoreleasedReturnValue(),
                  [v13 tracksTiledArtworkCatalogWithRows:2 columns:2],
                  long long v12 = objc_claimAutoreleasedReturnValue(),
                  v13,
                  !v12))
            {
              BOOL v14 = [(MCDBrowserTableViewController *)v30 tableView];
              unsigned int v15 = [v14 traitCollection];
              unsigned int v16 = +[UIImage defaultPlaceholderForTraitCollection:v15];
              long long v12 = +[MPArtworkCatalog staticArtworkCatalogWithImage:v16];
            }
          }
          uint64_t v17 = (uint64_t)[v11 type];
          if (v17 > 3)
          {
            if (v17 == 4)
            {
              v18 = [v11 playlist];
              uint64_t v19 = [v18 name];
            }
            else
            {
              if (v17 != 13) {
                goto LABEL_28;
              }
              v18 = [v11 radioStation];
              uint64_t v19 = [v18 name];
            }
          }
          else
          {
            if (v17 != 1)
            {
              if (v17 == 2)
              {
                v18 = [v11 album];
                uint64_t v19 = [v18 title];
                goto LABEL_25;
              }
LABEL_28:
              id v24 = &stru_101023248;
              if (v12) {
                goto LABEL_29;
              }
              goto LABEL_30;
            }
            v18 = [v11 song];
            uint64_t v19 = [v18 title];
          }
LABEL_25:
          id v24 = (__CFString *)v19;

          if (!v24) {
            goto LABEL_28;
          }
          if (v12)
          {
LABEL_29:
            unsigned int v25 = +[MusicObjectPair pairWithFirst:v12 andSecond:v24];
            [v31 addObject:v25];
          }
LABEL_30:

          goto LABEL_31;
        }
        uint64_t v36 = 0;
        v37 = &v36;
        uint64_t v38 = 0x2020000000;
        int v20 = (void (*)(void))off_1010D6D40;
        v39 = off_1010D6D40;
        if (!off_1010D6D40)
        {
          *(void *)buf = _NSConcreteStackBlock;
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = sub_10009095C;
          v42 = &unk_100FC34A0;
          int v43 = &v36;
          unsigned int v21 = (void *)sub_100029270();
          uint64_t v22 = dlsym(v21, "MCDMusicGeneralLogging");
          *(void *)(v43[1] + 24) = v22;
          off_1010D6D40 = *(_UNKNOWN **)(v43[1] + 24);
          int v20 = (void (*)(void))v37[3];
        }
        _Block_object_dispose(&v36, 8);
        if (!v20)
        {
          sub_100D691B8();
          __break(1u);
        }
        uint64_t v11 = v20();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          uint64_t v23 = objc_opt_class();
          *(_DWORD *)buf = v28;
          *(void *)&buf[4] = v23;
          *(_WORD *)&buf[12] = 2050;
          *(void *)&buf[14] = a3;
          _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Wrong kind (%{public}@) of object found in itemsInSectionAtIndex at %{public}lu", buf, 0x16u);
        }
LABEL_31:
      }
      id v6 = [v5 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v6);
  }

  id v26 = [v31 copy];

  return v26;
}

- (void)_initiatePlaybackForItem:(id)a3
{
  id v10 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v10;
  }
  else
  {
    id v4 = +[MPModelGenericObject genericObjectWithModelObject:v10];
  }
  id v5 = v4;
  id v6 = [v4 type];
  switch((unint64_t)v6)
  {
    case 1uLL:
      long long v7 = [(MCDBrowserTableViewController *)self libraryPlaybackManager];
      uint64_t v8 = [v5 song];
      uint64_t v9 = [(MCDBrowserTableViewController *)self combinedPlayActivityFeatureName];
      [v7 initiatePlaybackForSong:v8 lastResponse:0 shuffled:0 forceScopingToResponseResults:0 playActivityFeatureName:v9];
      goto LABEL_11;
    case 2uLL:
      long long v7 = [(MCDBrowserTableViewController *)self libraryPlaybackManager];
      uint64_t v8 = [v5 album];
      uint64_t v9 = [(MCDBrowserTableViewController *)self combinedPlayActivityFeatureName];
      [v7 initiatePlaybackForAlbum:v8 lastResponse:0 shuffled:0 playActivityFeatureName:v9];
      goto LABEL_11;
    case 3uLL:
      goto LABEL_12;
    case 4uLL:
      long long v7 = [(MCDBrowserTableViewController *)self libraryPlaybackManager];
      uint64_t v8 = [v5 playlist];
      uint64_t v9 = [(MCDBrowserTableViewController *)self combinedPlayActivityFeatureName];
      [v7 initiatePlaybackForPlaylist:v8 lastResponse:0 shuffled:0 playActivityFeatureName:v9];
      goto LABEL_11;
    case 5uLL:
      long long v7 = [(MCDBrowserTableViewController *)self libraryPlaybackManager];
      uint64_t v8 = [v5 playlistEntry];
      uint64_t v9 = [(MCDBrowserTableViewController *)self combinedPlayActivityFeatureName];
      [v7 initiatePlaybackForPlaylistEntry:v8 lastResponse:0 shuffled:0 forceScopingToResponseResults:0 playActivityFeatureName:v9];
      goto LABEL_11;
    default:
      if (v6 != (id)13) {
        goto LABEL_12;
      }
      long long v7 = [(MCDBrowserTableViewController *)self libraryPlaybackManager];
      uint64_t v8 = [v5 radioStation];
      uint64_t v9 = [(MCDBrowserTableViewController *)self combinedPlayActivityFeatureName];
      [v7 initiatePlaybackForRadioStation:v8 lastResponse:0 shuffled:0 playActivityFeatureName:v9];
LABEL_11:

LABEL_12:

      return;
  }
}

- (id)titleForIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = sub_10008CAAC();
  id v5 = [v4 objectForKey:v3];

  return v5;
}

- (void)_replacePlaceholderViewWithView:(id)a3
{
  [(MCDBrowserTableViewController *)self setPlaceholderView:a3];
  id v4 = [(MCDBrowserTableViewController *)self placeholderView];

  id v5 = [(MCDBrowserTableViewController *)self contentTableView];
  uint64_t v6 = (uint64_t)v5;
  if (v4)
  {
    id v16 = v5;
    [v5 frame];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    unsigned int v15 = [(MCDBrowserTableViewController *)self placeholderView];
    [v15 setFrame:v8, v10, v12, v14];

    uint64_t v6 = [(MCDBrowserTableViewController *)self placeholderView];
  }
  id v17 = (id)v6;
  [(MCDBrowserTableViewController *)self setView:v6];
}

- (NSArray)viewControllers
{
  return self->_viewControllers;
}

- (void)setViewControllers:(id)a3
{
}

- (BOOL)showOnlyLocalContent
{
  return self->_showOnlyLocalContent;
}

- (void)setShowOnlyLocalContent:(BOOL)a3
{
  self->_showOnlyLocalContent = a3;
}

- (UIView)placeholderView
{
  return self->_placeholderView;
}

- (void)setPlaceholderView:(id)a3
{
}

- (UITableView)contentTableView
{
  return self->_contentTableView;
}

- (void)setContentTableView:(id)a3
{
}

- (MCDLibraryPlaybackManager)libraryPlaybackManager
{
  return self->_libraryPlaybackManager;
}

- (void)setLibraryPlaybackManager:(id)a3
{
}

- (MCDRecentlyAddedDataSource)recentlyAddedDataSource
{
  return self->_recentlyAddedDataSource;
}

- (void)setRecentlyAddedDataSource:(id)a3
{
}

- (MCDLibraryContentManager)recentlyAddedContentManager
{
  return self->_recentlyAddedContentManager;
}

- (void)setRecentlyAddedContentManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentlyAddedContentManager, 0);
  objc_storeStrong((id *)&self->_recentlyAddedDataSource, 0);
  objc_storeStrong((id *)&self->_libraryPlaybackManager, 0);
  objc_storeStrong((id *)&self->_contentTableView, 0);
  objc_storeStrong((id *)&self->_placeholderView, 0);

  objc_storeStrong((id *)&self->_viewControllers, 0);
}

@end