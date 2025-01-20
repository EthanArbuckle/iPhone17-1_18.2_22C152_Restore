@interface MCDGenresViewController
- (MCDGenresViewController)initWithIdentifier:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5;
- (id)contentManager:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)textForHeaderViewInContentManager:(id)a3;
- (void)viewDidLoad;
@end

@implementation MCDGenresViewController

- (MCDGenresViewController)initWithIdentifier:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v9 = [(_MCDLibraryDataSource *)[MCDGenresDataSource alloc] initWithLimitedUI:v6];
  v12.receiver = self;
  v12.super_class = (Class)MCDGenresViewController;
  v10 = [(MCDLibraryTableViewController *)&v12 initWithIdentifier:v8 limitedUI:v6 showLocalContent:v5 dataSource:v9];

  if (v10) {
    [(MCDGenresViewController *)v10 setPlayActivityFeatureName:@"genres"];
  }
  return v10;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)MCDGenresViewController;
  [(MCDLibraryTableViewController *)&v4 viewDidLoad];
  v3 = [(MCDLibraryTableViewController *)self contentManager];
  [v3 setTableCellConfigurationBlock:&stru_100FC3CF0];
}

- (id)textForHeaderViewInContentManager:(id)a3
{
  if ([(MCDTableViewController *)self limitedUI])
  {
    objc_super v4 = sub_1000A23AC();
    BOOL v5 = [v4 localizedStringForKey:@"RECENTLY_ADDED_GENRES" value:&stru_101023248 table:@"MusicCarDisplayUI"];
  }
  else if ([(MCDLibraryTableViewController *)self showLocalContent])
  {
    BOOL v5 = +[NSString downloadedOnlyMessage];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)contentManager:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  unsigned int v5 = [(MCDTableViewController *)self limitedUI];
  BOOL v6 = 0;
  if (!a4 && v5)
  {
    v7 = sub_1000A23AC();
    BOOL v6 = [v7 localizedStringForKey:@"RECENTLY_ADDED_GENRES" value:&stru_101023248 table:@"MusicCarDisplayUI"];
  }

  return v6;
}

@end