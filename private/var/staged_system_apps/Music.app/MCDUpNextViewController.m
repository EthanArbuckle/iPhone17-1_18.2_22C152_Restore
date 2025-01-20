@interface MCDUpNextViewController
- (BOOL)alwaysHideNowPlayingButton;
- (MCDNowPlayingContentManager)contentManager;
- (MCDUpNextViewController)initWithContentManager:(id)a3;
- (void)playbackManagerShouldShowNowPlaying:(id)a3;
- (void)setContentManager:(id)a3;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MCDUpNextViewController

- (MCDUpNextViewController)initWithContentManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCDUpNextViewController;
  v6 = -[MCDTableViewController initWithLimitedUI:](&v9, "initWithLimitedUI:", [v5 limitedUI]);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_contentManager, a3);
  }

  return v7;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MCDUpNextViewController;
  [(MCDTableViewController *)&v5 viewWillAppear:a3];
  v4 = [(MCDNowPlayingContentManager *)self->_contentManager tableView];
  [v4 _scrollToTopIfPossible:0];
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)MCDUpNextViewController;
  [(MCDTableViewController *)&v10 viewDidLoad];
  int v3 = _os_feature_enabled_impl();
  v4 = +[NSBundle mainBundle];
  objc_super v5 = v4;
  if (v3) {
    CFStringRef v6 = @"Queue";
  }
  else {
    CFStringRef v6 = @"Playing Next";
  }
  v7 = [v4 localizedStringForKey:v6 value:&stru_101023248 table:0];
  [(MCDUpNextViewController *)self setTitle:v7];

  [(MCDNowPlayingContentManager *)self->_contentManager setTableCellConfigurationBlock:&stru_100FC3E38];
  v8 = [(MCDUpNextViewController *)self tableView];
  [(MCDNowPlayingContentManager *)self->_contentManager setTableView:v8];

  objc_super v9 = [[MCDPlaybackManager alloc] initWithDelegate:self];
  [(MCDNowPlayingContentManager *)self->_contentManager setPlaybackManager:v9];
}

- (BOOL)alwaysHideNowPlayingButton
{
  return 1;
}

- (void)viewSafeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)MCDUpNextViewController;
  [(MCDUpNextViewController *)&v3 viewSafeAreaInsetsDidChange];
  if (objc_opt_respondsToSelector()) {
    [(MCDNowPlayingContentManager *)self->_contentManager updateNoContentViewFrameIfNeeded];
  }
}

- (void)playbackManagerShouldShowNowPlaying:(id)a3
{
  id v4 = [(MCDUpNextViewController *)self navigationController];
  id v3 = [v4 popViewControllerAnimated:1];
}

- (MCDNowPlayingContentManager)contentManager
{
  return self->_contentManager;
}

- (void)setContentManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end