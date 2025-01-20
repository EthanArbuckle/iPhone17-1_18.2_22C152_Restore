@interface MCDPlaylistsViewController
+ (BOOL)wantsTallCells;
+ (id)madeForYouViewControllerWithIdentifier:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5;
+ (id)playlistsViewControllerForFolder:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5;
- (MCDPlaylistsViewController)initWithIdentifier:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5;
- (id)filteringPreferenceKey;
- (id)legacyFilteringPreferenceKey;
- (id)sortingPreferenceKey;
- (id)textForHeaderViewInContentManager:(id)a3;
- (void)viewDidLoad;
@end

@implementation MCDPlaylistsViewController

- (MCDPlaylistsViewController)initWithIdentifier:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v9 = [(_MCDLibraryDataSource *)[MCDPlaylistDataSource alloc] initWithLimitedUI:v6];
  v10 = [(MCDLibraryTableViewController *)self initWithIdentifier:v8 limitedUI:v6 showLocalContent:v5 dataSource:v9];

  if (v10) {
    [(MCDPlaylistsViewController *)v10 setPlayActivityFeatureName:@"playlists"];
  }
  return v10;
}

+ (id)madeForYouViewControllerWithIdentifier:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = [[MCDMadeForYouDataSource alloc] initWithLimitedUI:v6];
  v9 = [(MCDLibraryTableViewController *)[MCDPlaylistsViewController alloc] initWithIdentifier:v7 limitedUI:v6 showLocalContent:v5 dataSource:v8];

  [(MCDPlaylistsViewController *)v9 setPlayActivityFeatureName:@"made_for_you"];

  return v9;
}

+ (id)playlistsViewControllerForFolder:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = [[MCDPlaylistDataSource alloc] initWithLimitedUI:v6 playlist:v7];
  v9 = [MCDPlaylistsViewController alloc];
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  v10 = (void *)qword_1010D6D70;
  uint64_t v19 = qword_1010D6D70;
  if (!qword_1010D6D70)
  {
    v11 = (void *)sub_100029370();
    v17[3] = (uint64_t)dlsym(v11, "MCDPlaylistsViewControllerIdentifier");
    qword_1010D6D70 = v17[3];
    v10 = (void *)v17[3];
  }
  _Block_object_dispose(&v16, 8);
  if (!v10)
  {
    v15 = (_Unwind_Exception *)sub_100D691B8();
    _Block_object_dispose(&v16, 8);
    _Unwind_Resume(v15);
  }
  v12 = [(MCDLibraryTableViewController *)v9 initWithIdentifier:*v10 limitedUI:v6 showLocalContent:v5 dataSource:v8];
  [(MCDPlaylistsViewController *)v12 setPlayActivityFeatureName:@"playlists"];
  v13 = [v7 name];
  [(MCDPlaylistsViewController *)v12 setTitle:v13];

  return v12;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)MCDPlaylistsViewController;
  [(MCDLibraryTableViewController *)&v7 viewDidLoad];
  objc_initWeak(&location, self);
  objc_copyWeak(&v5, &location);
  v3 = [(MCDLibraryTableViewController *)self contentManager];
  [v3 setTableCellConfigurationBlock:&v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (id)textForHeaderViewInContentManager:(id)a3
{
  id v4 = a3;
  if ([(MCDTableViewController *)self limitedUI])
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x2020000000;
    id v5 = (void (*)(void))off_1010D6D80;
    v14 = off_1010D6D80;
    if (!off_1010D6D80)
    {
      BOOL v6 = (void *)sub_100029370();
      v12[3] = (uint64_t)dlsym(v6, "MCDCarDisplayBundle");
      off_1010D6D80 = (_UNKNOWN *)v12[3];
      id v5 = (void (*)(void))v12[3];
    }
    _Block_object_dispose(&v11, 8);
    if (!v5)
    {
      v10 = (_Unwind_Exception *)sub_100D691B8();
      _Block_object_dispose(&v11, 8);
      _Unwind_Resume(v10);
    }
    objc_super v7 = v5();
    id v8 = [v7 localizedStringForKey:@"RECENTLY_PLAYED_PLAYLISTS" value:&stru_101023248 table:@"MusicCarDisplayUI"];
  }
  else if ([(MCDLibraryTableViewController *)self showLocalContent])
  {
    id v8 = +[NSString downloadedOnlyMessage];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)sortingPreferenceKey
{
  v2 = [(MCDLibraryTableViewController *)self dataSource];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    return @"personalizedMixPlaylistsSortType";
  }
  else {
    return @"playlistsSortType";
  }
}

- (id)filteringPreferenceKey
{
  v2 = [(MCDLibraryTableViewController *)self dataSource];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    return @"LibraryMadeForYouFilterOption";
  }
  else {
    return @"LibraryPlaylistsFilterOption";
  }
}

- (id)legacyFilteringPreferenceKey
{
  v2 = [(MCDLibraryTableViewController *)self dataSource];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    return @"madeForYou";
  }
  else {
    return @"playlists";
  }
}

+ (BOOL)wantsTallCells
{
  return 1;
}

@end