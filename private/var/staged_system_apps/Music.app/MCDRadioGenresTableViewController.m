@interface MCDRadioGenresTableViewController
- (MCDRadioGenresTableViewController)initWithLimitedUI:(BOOL)a3;
- (id)_contentManager;
- (id)contentManager:(id)a3 viewControllerForItem:(id)a4 indexPath:(id)a5;
- (void)viewDidLoad;
@end

@implementation MCDRadioGenresTableViewController

- (MCDRadioGenresTableViewController)initWithLimitedUI:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MCDRadioGenresTableViewController;
  v3 = [(MCDFuseTableViewController *)&v6 initWithLimitedUI:a3];
  v4 = v3;
  if (v3) {
    [(MCDRadioGenresTableViewController *)v3 setPlayActivityFeatureName:@"all_genres"];
  }
  return v4;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)MCDRadioGenresTableViewController;
  [(MCDContentItemTableViewController *)&v8 viewDidLoad];
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  v3 = (void (*)(void))off_1010D7118;
  v13 = off_1010D7118;
  if (!off_1010D7118)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000BFE10;
    v9[3] = &unk_100FC34A0;
    v9[4] = &v10;
    sub_1000BFE10((uint64_t)v9);
    v3 = (void (*)(void))v11[3];
  }
  _Block_object_dispose(&v10, 8);
  if (!v3)
  {
    v7 = (_Unwind_Exception *)sub_100D691B8();
    _Block_object_dispose(&v10, 8);
    _Unwind_Resume(v7);
  }
  v4 = v3();
  v5 = [v4 localizedStringForKey:@"All Genres" value:&stru_101023248 table:@"MusicCarDisplayUI"];
  [(MCDRadioGenresTableViewController *)self setTitle:v5];

  objc_super v6 = [(MCDFuseTableViewController *)self contentManager];
  [v6 setTableCellConfigurationBlock:&stru_100FC4588];
}

- (id)contentManager:(id)a3 viewControllerForItem:(id)a4 indexPath:(id)a5
{
  id v6 = a4;
  v7 = [[MCDContentItemTableViewController alloc] initWithSectionItem:v6 limitedUI:[(MCDTableViewController *)self limitedUI] showRankedList:0 queueListForPlayback:0 radioDomain:1];

  return v7;
}

- (id)_contentManager
{
  v3 = [MCDRadioGenresContentManager alloc];
  v4 = objc_opt_new();
  v5 = [(MCDFuseTableViewController *)self playbackManager];
  id v6 = [(MCDFuseContentManager *)v3 initWithDataSource:v4 delegate:self viewController:self playbackManager:v5 limitedUI:[(MCDTableViewController *)self limitedUI]];

  return v6;
}

@end