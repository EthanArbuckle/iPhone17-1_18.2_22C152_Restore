@interface MCDForYouTableViewController
- (MCDForYouTableViewController)initWithLimitedUI:(BOOL)a3;
- (_TtC5Music22RecentlyPlayedObserver)recentlyPlayedObserver;
- (id)_contentManager;
- (id)contentManager:(id)a3 viewControllerForItem:(id)a4 indexPath:(id)a5;
- (void)setRecentlyPlayedObserver:(id)a3;
- (void)viewDidLoad;
@end

@implementation MCDForYouTableViewController

- (MCDForYouTableViewController)initWithLimitedUI:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MCDForYouTableViewController;
  v3 = [(MCDFuseTableViewController *)&v7 initWithLimitedUI:a3];
  v4 = v3;
  if (v3)
  {
    [(MCDForYouTableViewController *)v3 setPlayActivityFeatureName:@"home"];
    v5 = objc_opt_new();
    [(MCDForYouTableViewController *)v4 setRecentlyPlayedObserver:v5];
  }
  return v4;
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)MCDForYouTableViewController;
  [(MCDFuseTableViewController *)&v11 viewDidLoad];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  v3 = (void (*)(void))off_1010D6C90;
  v20 = off_1010D6C90;
  if (!off_1010D6C90)
  {
    *(void *)buf = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    v14 = sub_10008AA38;
    v15 = &unk_100FC34A0;
    v16 = &v17;
    sub_10008AA38((uint64_t)buf);
    v3 = (void (*)(void))v18[3];
  }
  _Block_object_dispose(&v17, 8);
  if (!v3)
  {
    v8 = (_Unwind_Exception *)sub_100D691B8();
    _Block_object_dispose(&v17, 8);
    _Unwind_Resume(v8);
  }
  v4 = v3();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Loading view for For You", buf, 2u);
  }

  v5 = [(MCDForYouTableViewController *)self tableView];
  [v5 _setHeaderAndFooterViewsFloat:0];

  objc_initWeak((id *)buf, self);
  v6 = [(MCDForYouTableViewController *)self recentlyPlayedObserver];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10008A460;
  v9[3] = &unk_100FC3720;
  objc_copyWeak(&v10, (id *)buf);
  [v6 registerHandler:v9];

  objc_super v7 = [(MCDFuseTableViewController *)self contentManager];
  [v7 setTableCellConfigurationBlock:&stru_100FC3760];

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

- (id)contentManager:(id)a3 viewControllerForItem:(id)a4 indexPath:(id)a5
{
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    v8 = [[MCDForYouGroupTableViewController alloc] initWithLimitedUI:[(MCDTableViewController *)self limitedUI] recommendationGroup:v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_contentManager
{
  v3 = [MCDForYouContentManager alloc];
  v4 = [[MCDForYouDataSource alloc] initWithRecommendationGroup:0];
  v5 = [(MCDFuseTableViewController *)self playbackManager];
  id v6 = [(MCDFuseContentManager *)v3 initWithDataSource:v4 delegate:self viewController:self playbackManager:v5 limitedUI:[(MCDTableViewController *)self limitedUI]];

  return v6;
}

- (_TtC5Music22RecentlyPlayedObserver)recentlyPlayedObserver
{
  return self->_recentlyPlayedObserver;
}

- (void)setRecentlyPlayedObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end