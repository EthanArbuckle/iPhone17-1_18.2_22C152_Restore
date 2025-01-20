@interface MCDAlbumsTableViewController
+ (BOOL)wantsTallCells;
+ (id)albumsForGenre:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5;
+ (id)albumsForPerson:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5;
- (MCDAlbumsTableViewController)initWithIdentifier:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5;
- (id)filteringPreferenceKey;
- (id)legacyFilteringPreferenceKey;
- (id)sectionIndexTitlesForContentManager:(id)a3;
- (id)shuffleContainerForContentManager:(id)a3;
- (id)sortingPreferenceKey;
- (id)textForHeaderViewInContentManager:(id)a3;
- (void)viewDidLoad;
@end

@implementation MCDAlbumsTableViewController

- (MCDAlbumsTableViewController)initWithIdentifier:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v9 = [(_MCDLibraryDataSource *)[MCDAlbumsDataSource alloc] initWithLimitedUI:v6];
  v12.receiver = self;
  v12.super_class = (Class)MCDAlbumsTableViewController;
  v10 = [(MCDLibraryTableViewController *)&v12 initWithIdentifier:v8 limitedUI:v6 showLocalContent:v5 dataSource:v9];

  if (v10) {
    [(MCDAlbumsTableViewController *)v10 setPlayActivityFeatureName:@"albums"];
  }
  return v10;
}

+ (id)albumsForPerson:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = [[MCDAlbumsDataSource alloc] initWithLimitedUI:v6 person:v7];
  v9 = [MCDAlbumsTableViewController alloc];
  v10 = sub_10009F390();
  v11 = [(MCDLibraryTableViewController *)v9 initWithIdentifier:v10 limitedUI:v6 showLocalContent:v5 dataSource:v8];

  objc_super v12 = [v7 name];

  [(MCDAlbumsTableViewController *)v11 setTitle:v12];
  [(MCDAlbumsTableViewController *)v11 setPlayActivityFeatureName:@"albums"];

  return v11;
}

+ (id)albumsForGenre:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = [[MCDAlbumsDataSource alloc] initWithLimitedUI:v6 genre:v7];
  v9 = [MCDAlbumsTableViewController alloc];
  v10 = sub_10009F390();
  v11 = [(MCDLibraryTableViewController *)v9 initWithIdentifier:v10 limitedUI:v6 showLocalContent:v5 dataSource:v8];

  objc_super v12 = [v7 name];

  [(MCDAlbumsTableViewController *)v11 setTitle:v12];
  [(MCDAlbumsTableViewController *)v11 setPlayActivityFeatureName:@"albums"];

  return v11;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)MCDAlbumsTableViewController;
  [(MCDLibraryTableViewController *)&v8 viewDidLoad];
  v3 = [(MCDLibraryTableViewController *)self contentManager];
  [v3 setShowShuffleAll:1];

  objc_initWeak(&location, self);
  objc_copyWeak(&v6, &location);
  v4 = [(MCDLibraryTableViewController *)self contentManager];
  [v4 setTableCellConfigurationBlock:&v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (id)sortingPreferenceKey
{
  v2 = [(MCDLibraryTableViewController *)self dataSource];
  v3 = [v2 genre];

  if (v3)
  {
    CFStringRef v4 = @"genreAlbumsSortType";
  }
  else
  {
    uint64_t v5 = [v2 person];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      CFStringRef v4 = @"composerAlbumsSortType";
    }
    else
    {
      id v7 = [v2 person];
      objc_opt_class();
      char v8 = objc_opt_isKindOfClass();

      if (v8) {
        CFStringRef v4 = @"artistAlbumsSortType";
      }
      else {
        CFStringRef v4 = @"SortAlbums";
      }
    }
  }

  return (id)v4;
}

- (id)filteringPreferenceKey
{
  v2 = [(MCDLibraryTableViewController *)self dataSource];
  v3 = [v2 genre];

  if (v3) {
    CFStringRef v4 = @"LibraryGenresFilterOption";
  }
  else {
    CFStringRef v4 = @"LibraryAlbumsFilterOption";
  }

  return (id)v4;
}

- (id)legacyFilteringPreferenceKey
{
  v2 = [(MCDLibraryTableViewController *)self dataSource];
  v3 = [v2 genre];

  if (v3)
  {
    CFStringRef v4 = @"genres";
  }
  else
  {
    uint64_t v5 = [v2 person];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      CFStringRef v4 = @"composers";
    }
    else
    {
      id v7 = [v2 person];
      objc_opt_class();
      char v8 = objc_opt_isKindOfClass();

      if (v8) {
        CFStringRef v4 = @"artistDetail";
      }
      else {
        CFStringRef v4 = @"albums";
      }
    }
  }

  return (id)v4;
}

- (id)textForHeaderViewInContentManager:(id)a3
{
  id v4 = a3;
  if ([(MCDTableViewController *)self limitedUI])
  {
    uint64_t v11 = 0;
    objc_super v12 = &v11;
    uint64_t v13 = 0x2020000000;
    uint64_t v5 = (void (*)(void))off_1010D6EE0;
    v14 = off_1010D6EE0;
    if (!off_1010D6EE0)
    {
      id v6 = (void *)sub_100029B70();
      v12[3] = (uint64_t)dlsym(v6, "MCDCarDisplayBundle");
      off_1010D6EE0 = (_UNKNOWN *)v12[3];
      uint64_t v5 = (void (*)(void))v12[3];
    }
    _Block_object_dispose(&v11, 8);
    if (!v5)
    {
      v10 = (_Unwind_Exception *)sub_100D691B8();
      _Block_object_dispose(&v11, 8);
      _Unwind_Resume(v10);
    }
    id v7 = v5();
    char v8 = [v7 localizedStringForKey:@"RECENTLY_PLAYED_ALBUMS" value:&stru_101023248 table:@"MusicCarDisplayUI"];
  }
  else if ([(MCDLibraryTableViewController *)self showLocalContent])
  {
    char v8 = +[NSString downloadedOnlyMessage];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)sectionIndexTitlesForContentManager:(id)a3
{
  id v4 = a3;
  if ([(MCDTableViewController *)self limitedUI])
  {
    id v5 = 0;
  }
  else
  {
    id v6 = +[NSMutableArray array];
    id v7 = [v4 lastReceivedResponse];
    char v8 = [v7 results];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10009FD10;
    v12[3] = &unk_100FC3568;
    id v13 = v6;
    id v9 = v6;
    [v8 enumerateSectionsUsingBlock:v12];

    if ([v9 count]) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
    id v5 = v10;
  }

  return v5;
}

- (id)shuffleContainerForContentManager:(id)a3
{
  v3 = [(MCDLibraryTableViewController *)self dataSource];
  id v4 = [v3 scopedContainers];
  id v5 = [v4 firstObject];

  return v5;
}

+ (BOOL)wantsTallCells
{
  return 1;
}

@end