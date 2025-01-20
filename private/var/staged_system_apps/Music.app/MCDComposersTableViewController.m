@interface MCDComposersTableViewController
- (MCDComposersTableViewController)initWithIdentifier:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5;
- (id)sectionIndexTitlesForContentManager:(id)a3;
- (id)textForHeaderViewInContentManager:(id)a3;
- (void)viewDidLoad;
@end

@implementation MCDComposersTableViewController

- (MCDComposersTableViewController)initWithIdentifier:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v9 = [(_MCDLibraryDataSource *)[MCDComposersDataSource alloc] initWithLimitedUI:v6];
  v12.receiver = self;
  v12.super_class = (Class)MCDComposersTableViewController;
  v10 = [(MCDLibraryTableViewController *)&v12 initWithIdentifier:v8 limitedUI:v6 showLocalContent:v5 dataSource:v9];

  if (v10) {
    [(MCDComposersTableViewController *)v10 setPlayActivityFeatureName:@"composers"];
  }
  return v10;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)MCDComposersTableViewController;
  [(MCDLibraryTableViewController *)&v4 viewDidLoad];
  v3 = [(MCDLibraryTableViewController *)self contentManager];
  [v3 setTableCellConfigurationBlock:&stru_100FC39A0];
}

- (id)textForHeaderViewInContentManager:(id)a3
{
  id v4 = a3;
  if ([(MCDTableViewController *)self limitedUI])
  {
    uint64_t v11 = 0;
    objc_super v12 = &v11;
    uint64_t v13 = 0x2020000000;
    BOOL v5 = (void (*)(void))off_1010D6D60;
    v14 = off_1010D6D60;
    if (!off_1010D6D60)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100091280;
      v10[3] = &unk_100FC34A0;
      v10[4] = &v11;
      sub_100091280((uint64_t)v10);
      BOOL v5 = (void (*)(void))v12[3];
    }
    _Block_object_dispose(&v11, 8);
    if (!v5)
    {
      v9 = (_Unwind_Exception *)sub_100D691B8();
      _Block_object_dispose(&v11, 8);
      _Unwind_Resume(v9);
    }
    BOOL v6 = v5();
    v7 = [v6 localizedStringForKey:@"RECENTLY_ADDED_COMPOSERS" value:&stru_101023248 table:@"MusicCarDisplayUI"];
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

- (id)sectionIndexTitlesForContentManager:(id)a3
{
  id v4 = a3;
  if ([(MCDTableViewController *)self limitedUI])
  {
    BOOL v5 = 0;
  }
  else
  {
    BOOL v6 = +[NSMutableArray array];
    v7 = [v4 lastReceivedResponse];
    id v8 = [v7 results];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100091228;
    v11[3] = &unk_100FC3568;
    id v12 = v6;
    id v9 = v6;
    [v8 enumerateSectionsUsingBlock:v11];

    BOOL v5 = +[NSArray arrayWithArray:v9];
  }

  return v5;
}

@end