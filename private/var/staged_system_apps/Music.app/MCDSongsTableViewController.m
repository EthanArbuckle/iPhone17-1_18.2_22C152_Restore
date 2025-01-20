@interface MCDSongsTableViewController
- (MCDSongsTableViewController)initWithIdentifier:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5;
- (id)filteringPreferenceKey;
- (id)legacyFilteringPreferenceKey;
- (id)sectionIndexTitlesForContentManager:(id)a3;
- (id)sortingPreferenceKey;
- (id)textForHeaderViewInContentManager:(id)a3;
- (void)viewDidLoad;
@end

@implementation MCDSongsTableViewController

- (MCDSongsTableViewController)initWithIdentifier:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v9 = [(_MCDLibraryDataSource *)[MCDSongsDataSource alloc] initWithLimitedUI:v6];
  v12.receiver = self;
  v12.super_class = (Class)MCDSongsTableViewController;
  v10 = [(MCDLibraryTableViewController *)&v12 initWithIdentifier:v8 limitedUI:v6 showLocalContent:v5 dataSource:v9];

  if (v10) {
    [(MCDSongsTableViewController *)v10 setPlayActivityFeatureName:@"songs"];
  }
  return v10;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)MCDSongsTableViewController;
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
  return @"sortSongs";
}

- (id)filteringPreferenceKey
{
  return @"SongsFilterOption";
}

- (id)legacyFilteringPreferenceKey
{
  return @"songs";
}

- (id)sectionIndexTitlesForContentManager:(id)a3
{
  id v4 = a3;
  if ([(MCDTableViewController *)self limitedUI])
  {
    uint64_t v5 = 0;
  }
  else
  {
    id v6 = +[NSMutableArray array];
    v7 = [v4 lastReceivedResponse];
    objc_super v8 = [v7 results];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10008BA70;
    v11[3] = &unk_100FC3568;
    id v12 = v6;
    id v9 = v6;
    [v8 enumerateSectionsUsingBlock:v11];

    uint64_t v5 = +[NSArray arrayWithArray:v9];
  }

  return v5;
}

- (id)textForHeaderViewInContentManager:(id)a3
{
  id v4 = a3;
  if ([(MCDTableViewController *)self limitedUI])
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x2020000000;
    uint64_t v5 = (void (*)(void))off_1010D6CA0;
    v14 = off_1010D6CA0;
    if (!off_1010D6CA0)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10008BC30;
      v10[3] = &unk_100FC34A0;
      v10[4] = &v11;
      sub_10008BC30((uint64_t)v10);
      uint64_t v5 = (void (*)(void))v12[3];
    }
    _Block_object_dispose(&v11, 8);
    if (!v5)
    {
      id v9 = (_Unwind_Exception *)sub_100D691B8();
      _Block_object_dispose(&v11, 8);
      _Unwind_Resume(v9);
    }
    id v6 = v5();
    v7 = [v6 localizedStringForKey:@"RECENTLY_PLAYED_SONGS" value:&stru_101023248 table:@"MusicCarDisplayUI"];
  }
  else if ([(MCDLibraryTableViewController *)self showLocalContent])
  {
    v7 = +[NSString downloadedOnlyMessage];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end