@interface MCDRecentlyAddedTableViewController
+ (BOOL)wantsTallCells;
- (BOOL)contentManager:(id)a3 canDrillIntoItem:(id)a4;
- (MCDRecentlyAddedTableViewController)initWithIdentifier:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5;
- (id)contentManager:(id)a3 viewControllerForItem:(id)a4;
- (id)textForHeaderViewInContentManager:(id)a3;
- (void)viewDidLoad;
@end

@implementation MCDRecentlyAddedTableViewController

- (MCDRecentlyAddedTableViewController)initWithIdentifier:(id)a3 limitedUI:(BOOL)a4 showLocalContent:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v9 = [(_MCDLibraryDataSource *)[MCDRecentlyAddedDataSource alloc] initWithLimitedUI:v6];
  v12.receiver = self;
  v12.super_class = (Class)MCDRecentlyAddedTableViewController;
  v10 = [(MCDLibraryTableViewController *)&v12 initWithIdentifier:v8 limitedUI:v6 showLocalContent:v5 dataSource:v9];

  if (v10) {
    [(MCDRecentlyAddedTableViewController *)v10 setPlayActivityFeatureName:@"recently_added"];
  }
  return v10;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)MCDRecentlyAddedTableViewController;
  [(MCDLibraryTableViewController *)&v4 viewDidLoad];
  v3 = [(MCDLibraryTableViewController *)self contentManager];
  [v3 setTableCellConfigurationBlock:&stru_100FC4510];
}

- (id)contentManager:(id)a3 viewControllerForItem:(id)a4
{
  id v5 = a4;
  BOOL v6 = [v5 album];

  if (v6)
  {
    v7 = [v5 album];
    id v8 = +[MCDAlbumTracksTableViewController albumTracksViewControllerForContentItem:v7 limitedUI:[(MCDTableViewController *)self limitedUI] showLocalContent:[(MCDLibraryTableViewController *)self showLocalContent]];
LABEL_5:
    v11 = v8;

    goto LABEL_6;
  }
  v9 = [v5 playlist];

  if (v9)
  {
    v10 = [MCDPlaylistTracksTableViewController alloc];
    v7 = [v5 playlist];
    id v8 = [(MCDPlaylistTracksTableViewController *)v10 initWithPlaylist:v7 limitedUI:[(MCDTableViewController *)self limitedUI] showLocalContent:[(MCDLibraryTableViewController *)self showLocalContent]];
    goto LABEL_5;
  }
  v11 = 0;
LABEL_6:

  return v11;
}

- (BOOL)contentManager:(id)a3 canDrillIntoItem:(id)a4
{
  id v4 = a4;
  id v5 = [v4 album];
  if (v5)
  {
    BOOL v6 = 1;
  }
  else
  {
    v7 = [v4 playlist];
    BOOL v6 = v7 != 0;
  }
  return v6;
}

- (id)textForHeaderViewInContentManager:(id)a3
{
  if ([(MCDLibraryTableViewController *)self showLocalContent])
  {
    v3 = +[NSString downloadedOnlyMessage];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (BOOL)wantsTallCells
{
  return 1;
}

@end