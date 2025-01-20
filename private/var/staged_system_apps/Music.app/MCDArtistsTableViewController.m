@interface MCDArtistsTableViewController
- (MCDArtistsTableViewController)initWithIdentifier:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5;
- (id)filteringPreferenceKey;
- (id)legacyFilteringPreferenceKey;
- (id)sectionIndexTitlesForContentManager:(id)a3;
- (id)textForHeaderViewInContentManager:(id)a3;
- (void)viewDidLoad;
@end

@implementation MCDArtistsTableViewController

- (MCDArtistsTableViewController)initWithIdentifier:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v9 = [(_MCDLibraryDataSource *)[MCDArtistsDataSource alloc] initWithLimitedUI:v6];
  v12.receiver = self;
  v12.super_class = (Class)MCDArtistsTableViewController;
  v10 = [(MCDLibraryTableViewController *)&v12 initWithIdentifier:v8 limitedUI:v6 showLocalContent:v5 dataSource:v9];

  if (v10) {
    [(MCDArtistsTableViewController *)v10 setPlayActivityFeatureName:@"artists"];
  }
  return v10;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)MCDArtistsTableViewController;
  [(MCDLibraryTableViewController *)&v7 viewDidLoad];
  objc_initWeak(&location, self);
  objc_copyWeak(&v5, &location);
  v3 = [(MCDLibraryTableViewController *)self contentManager];
  [v3 setTableCellConfigurationBlock:&v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (id)filteringPreferenceKey
{
  return @"ArtistsFilterOption";
}

- (id)legacyFilteringPreferenceKey
{
  return @"artists";
}

- (id)textForHeaderViewInContentManager:(id)a3
{
  id v4 = a3;
  if ([(MCDTableViewController *)self limitedUI])
  {
    uint64_t v11 = 0;
    objc_super v12 = &v11;
    uint64_t v13 = 0x2020000000;
    id v5 = (void (*)(void))off_1010D6BF8;
    v14 = off_1010D6BF8;
    if (!off_1010D6BF8)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100085BEC;
      v10[3] = &unk_100FC34A0;
      v10[4] = &v11;
      sub_100085BEC((uint64_t)v10);
      id v5 = (void (*)(void))v12[3];
    }
    _Block_object_dispose(&v11, 8);
    if (!v5)
    {
      v9 = (_Unwind_Exception *)sub_100D691B8();
      _Block_object_dispose(&v11, 8);
      _Unwind_Resume(v9);
    }
    BOOL v6 = v5();
    objc_super v7 = [v6 localizedStringForKey:@"RECENTLY_ADDED_ARTISTS" value:&stru_101023248 table:@"MusicCarDisplayUI"];
  }
  else if ([(MCDLibraryTableViewController *)self showLocalContent])
  {
    objc_super v7 = +[NSString downloadedOnlyMessage];
  }
  else
  {
    objc_super v7 = 0;
  }

  return v7;
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
    BOOL v6 = +[NSMutableArray array];
    objc_super v7 = [v4 lastReceivedResponse];
    id v8 = [v7 results];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100085B94;
    v11[3] = &unk_100FC3568;
    id v12 = v6;
    id v9 = v6;
    [v8 enumerateSectionsUsingBlock:v11];

    id v5 = +[NSArray arrayWithArray:v9];
  }

  return v5;
}

@end