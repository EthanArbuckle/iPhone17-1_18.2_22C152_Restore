@interface MCDFuseTableViewController
- (BOOL)_contentItemIsPlaying:(id)a3;
- (BOOL)hasLoadedStoreContent;
- (BOOL)networkOffline;
- (MCDFuseContentManager)contentManager;
- (MCDFuseTableViewController)initWithLimitedUI:(BOOL)a3;
- (MCDStorePlaybackManager)playbackManager;
- (MPModelResponse)recommendationsResponse;
- (MPWeakTimer)loadingTimer;
- (UIView)MCD_tableView;
- (UIView)placeholderView;
- (id)_contentManager;
- (id)completionHandler;
- (void)_limitedUIDidChange;
- (void)contentManager:(id)a3 shouldDisplayViewController:(id)a4;
- (void)loadContentManager:(id)a3;
- (void)playbackManager:(id)a3 shouldShowError:(id)a4;
- (void)playbackManagerShouldShowNowPlaying:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setHasLoadedStoreContent:(BOOL)a3;
- (void)setLoadingTimer:(id)a3;
- (void)setMCD_tableView:(id)a3;
- (void)setNetworkOffline:(BOOL)a3;
- (void)setPlaceholderView:(id)a3;
- (void)setRecommendationsResponse:(id)a3;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MCDFuseTableViewController

- (MCDFuseTableViewController)initWithLimitedUI:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MCDFuseTableViewController;
  v3 = [(MCDTableViewController *)&v7 initWithLimitedUI:a3];
  if (v3)
  {
    v4 = [(MCDPlaybackManager *)[MCDStorePlaybackManager alloc] initWithDelegate:v3];
    playbackManager = v3->_playbackManager;
    v3->_playbackManager = v4;
  }
  return v3;
}

- (void)loadContentManager:(id)a3
{
  id v6 = a3;
  v4 = [(MCDFuseTableViewController *)self _contentManager];
  contentManager = self->_contentManager;
  self->_contentManager = v4;

  [(MCDFuseTableViewController *)self setCompletionHandler:v6];
}

- (void)_limitedUIDidChange
{
  BOOL v3 = [(MCDTableViewController *)self limitedUI];
  id v4 = [(MCDFuseTableViewController *)self contentManager];
  [v4 setLimitedUI:v3];
}

- (id)_contentManager
{
  return 0;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)MCDFuseTableViewController;
  [(MCDTableViewController *)&v7 viewDidLoad];
  if (!self->_contentManager)
  {
    BOOL v3 = [(MCDFuseTableViewController *)self _contentManager];
    contentManager = self->_contentManager;
    self->_contentManager = v3;
  }
  v5 = [(MCDFuseTableViewController *)self tableView];
  id v6 = [(MCDFuseTableViewController *)self contentManager];
  [v6 setTableView:v5];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MCDFuseTableViewController;
  [(MCDTableViewController *)&v5 viewWillAppear:a3];
  id v4 = [(MCDFuseTableViewController *)self contentManager];
  [v4 displayPlaceholderViewIfNeeded];
}

- (void)viewSafeAreaInsetsDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)MCDFuseTableViewController;
  [(MCDFuseTableViewController *)&v4 viewSafeAreaInsetsDidChange];
  BOOL v3 = [(MCDFuseTableViewController *)self contentManager];
  [v3 updatePlaceholderViewFrameIfNeeded];
}

- (void)setHasLoadedStoreContent:(BOOL)a3
{
  if (self->_hasLoadedStoreContent != a3)
  {
    self->_hasLoadedStoreContent = a3;
    if (a3)
    {
      objc_super v4 = [(MCDFuseTableViewController *)self completionHandler];

      if (v4)
      {
        objc_super v5 = [(MCDFuseTableViewController *)self completionHandler];
        v5[2](v5, 0);

        [(MCDFuseTableViewController *)self setCompletionHandler:0];
      }
    }
  }
}

- (void)playbackManagerShouldShowNowPlaying:(id)a3
{
  objc_super v4 = [(MCDFuseTableViewController *)self navigationController];
  [v4 MCD_pushNowPlayingViewControllerAnimated:1 fromViewController:self];

  objc_super v5 = [(MCDFuseTableViewController *)self contentManager];
  [v5 clearActivityIndicatorForSelectedIndexPath];

  id v7 = [(MCDFuseTableViewController *)self contentManager];
  id v6 = [v7 tableView];
  [v6 reloadData];
}

- (void)playbackManager:(id)a3 shouldShowError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  v8 = (void (*)(void))off_1010D6BE8;
  v23 = off_1010D6BE8;
  if (!off_1010D6BE8)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000853DC;
    v19[3] = &unk_100FC34A0;
    v19[4] = &v20;
    sub_1000853DC((uint64_t)v19);
    v8 = (void (*)(void))v21[3];
  }
  _Block_object_dispose(&v20, 8);
  if (!v8)
  {
    v18 = (_Unwind_Exception *)sub_100D691B8();
    _Block_object_dispose(&v20, 8);
    _Unwind_Resume(v18);
  }
  v9 = v8();
  v10 = [v9 localizedStringForKey:@"An Error Occurred" value:&stru_101023248 table:@"MusicCarDisplayUI"];
  v11 = +[UIAlertController alertControllerWithTitle:0 message:v10 preferredStyle:1];

  v12 = +[NSBundle mainBundle];
  v13 = [v12 localizedStringForKey:@"OK" value:&stru_101023248 table:0];
  v14 = +[UIAlertAction actionWithTitle:v13 style:1 handler:0];

  [v11 addAction:v14];
  [(MCDFuseTableViewController *)self presentViewController:v11 animated:1 completion:0];
  v15 = [(MCDFuseTableViewController *)self contentManager];
  [v15 clearActivityIndicatorForSelectedIndexPath];

  v16 = [(MCDFuseTableViewController *)self contentManager];
  v17 = [v16 tableView];
  [v17 reloadData];
}

- (void)contentManager:(id)a3 shouldDisplayViewController:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100084E34;
  v6[3] = &unk_100FC3500;
  id v7 = a4;
  v8 = self;
  id v5 = v7;
  [v5 loadContentManager:v6];
}

- (BOOL)_contentItemIsPlaying:(id)a3
{
  id v4 = a3;
  id v5 = +[MusicCarPlayManager sharedManager];
  id v6 = [v5 nowPlayingContentManager];
  id v7 = [v6 currentPlayingSong];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (![(MCDTableViewController *)self currentAppIsPlaying])
    {
      unsigned __int8 v18 = 0;
      v8 = 0;
      v9 = 0;
      goto LABEL_39;
    }
    v8 = [v7 identifiers];
    v9 = [v4 identifiers];
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (![(MCDTableViewController *)self currentAppIsPlaying])
    {
LABEL_15:
      unsigned __int8 v18 = 0;
      goto LABEL_39;
    }
    v10 = [v7 album];
    uint64_t v11 = [v10 identifiers];

    uint64_t v12 = [v4 identifiers];

    v8 = (void *)v11;
    v9 = (void *)v12;
  }
  if (!v8 || !v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = +[MusicCarPlayManager sharedManager];
      uint64_t v20 = [v19 nowPlayingContentManager];
      v21 = [v20 currentPlayingPlaylist];
      uint64_t v22 = [v21 identifiers];
      v23 = [v4 identifiers];
      unsigned __int8 v18 = [v22 intersectsSet:v23];

LABEL_37:
      goto LABEL_38;
    }
    goto LABEL_15;
  }
  v13 = [v8 universalStore];
  if (![v13 purchasedAdamID])
  {
    unsigned __int8 v18 = 0;
    goto LABEL_18;
  }
  v14 = [v9 universalStore];
  id v15 = [v14 purchasedAdamID];

  if (v15)
  {
    v13 = [v8 universalStore];
    id v16 = [v13 purchasedAdamID];
    v17 = [v9 universalStore];
    unsigned __int8 v18 = v16 == [v17 purchasedAdamID];

LABEL_18:
    goto LABEL_20;
  }
  unsigned __int8 v18 = 0;
LABEL_20:
  v24 = [v8 universalStore];
  if (![v24 subscriptionAdamID])
  {
LABEL_28:

    goto LABEL_29;
  }
  v25 = [v9 universalStore];
  id v26 = [v25 purchasedAdamID];

  if (v26) {
    char v27 = v18;
  }
  else {
    char v27 = 1;
  }
  if (v26) {
    unsigned __int8 v18 = 1;
  }
  if ((v27 & 1) == 0)
  {
    v24 = [v8 universalStore];
    id v28 = [v24 subscriptionAdamID];
    v29 = [v9 universalStore];
    unsigned __int8 v18 = v28 == [v29 subscriptionAdamID];

    goto LABEL_28;
  }
LABEL_29:
  v19 = [v8 universalStore];
  if (![v19 adamID])
  {
LABEL_38:

    goto LABEL_39;
  }
  v30 = [v9 universalStore];
  id v31 = [v30 adamID];

  if (v31) {
    char v32 = v18;
  }
  else {
    char v32 = 1;
  }
  if (v31) {
    unsigned __int8 v18 = 1;
  }
  if ((v32 & 1) == 0)
  {
    v19 = [v8 universalStore];
    id v33 = [v19 adamID];
    uint64_t v20 = [v9 universalStore];
    unsigned __int8 v18 = v33 == [v20 adamID];
    goto LABEL_37;
  }
LABEL_39:

  return v18;
}

- (BOOL)hasLoadedStoreContent
{
  return self->_hasLoadedStoreContent;
}

- (UIView)MCD_tableView
{
  return self->_MCD_tableView;
}

- (void)setMCD_tableView:(id)a3
{
}

- (UIView)placeholderView
{
  return self->_placeholderView;
}

- (void)setPlaceholderView:(id)a3
{
}

- (MPWeakTimer)loadingTimer
{
  return self->_loadingTimer;
}

- (void)setLoadingTimer:(id)a3
{
}

- (MPModelResponse)recommendationsResponse
{
  return self->_recommendationsResponse;
}

- (void)setRecommendationsResponse:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (BOOL)networkOffline
{
  return self->_networkOffline;
}

- (void)setNetworkOffline:(BOOL)a3
{
  self->_networkOffline = a3;
}

- (MCDFuseContentManager)contentManager
{
  return self->_contentManager;
}

- (MCDStorePlaybackManager)playbackManager
{
  return self->_playbackManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackManager, 0);
  objc_storeStrong((id *)&self->_contentManager, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_recommendationsResponse, 0);
  objc_storeStrong((id *)&self->_loadingTimer, 0);
  objc_storeStrong((id *)&self->_placeholderView, 0);

  objc_storeStrong((id *)&self->_MCD_tableView, 0);
}

@end