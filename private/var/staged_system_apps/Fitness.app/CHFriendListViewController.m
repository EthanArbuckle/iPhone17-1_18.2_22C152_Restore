@interface CHFriendListViewController
- (BOOL)_isCompetitionSection:(unint64_t)a3;
- (CHFriendListViewController)init;
- (CHFriendListViewController)initWithCoder:(id)a3;
- (CHFriendListViewController)initWithFriendListManager:(id)a3 andWithFriendManager:(id)a4 achievementsDataProvider:(id)a5 workoutsDataProvider:(id)a6 workoutFormattingManager:(id)a7 formattingManager:(id)a8 badgeImageFactory:(id)a9 healthStore:(id)a10 fitnessAppContext:(id)a11;
- (CHFriendListViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CHFriendListViewController)initWithStyle:(int64_t)a3;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_makeFriendDetailViewControllerForSection:(id)a3 row:(id)a4;
- (id)_sortMenu;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)_animateOnscreenCellsToNewValues;
- (void)_contentSizeCategoryDidChangeNotification:(id)a3;
- (void)_executeBlockWaitingOnFriendsDataIfNeeded;
- (void)_friendDataWasUpdated:(id)a3;
- (void)_layoutPrivacyLinkIfNecessary;
- (void)_logFriendListDisplayMode:(int64_t)a3;
- (void)_performAfterFriendDataIsAvailable:(id)a3;
- (void)_pushDetailViewControllerForSection:(id)a3 row:(id)a4;
- (void)_refreshControlValueChanged;
- (void)_showDetailForFriend:(id)a3 date:(id)a4;
- (void)_updateSectionsForCurrentDisplayContext;
- (void)dealloc;
- (void)didTapInboxBarButtonView:(id)a3;
- (void)loadView;
- (void)scrollToTop;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)showDetailForFriendWithUUID:(id)a3 date:(id)a4;
- (void)showDetailForMeOnDate:(id)a3;
- (void)showInbox;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation CHFriendListViewController

- (CHFriendListViewController)init
{
  return 0;
}

- (CHFriendListViewController)initWithStyle:(int64_t)a3
{
  return 0;
}

- (CHFriendListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return 0;
}

- (CHFriendListViewController)initWithCoder:(id)a3
{
  return 0;
}

- (CHFriendListViewController)initWithFriendListManager:(id)a3 andWithFriendManager:(id)a4 achievementsDataProvider:(id)a5 workoutsDataProvider:(id)a6 workoutFormattingManager:(id)a7 formattingManager:(id)a8 badgeImageFactory:(id)a9 healthStore:(id)a10 fitnessAppContext:(id)a11
{
  id v17 = a3;
  id v40 = a4;
  id v39 = a5;
  id v38 = a6;
  id v37 = a7;
  id v36 = a8;
  id v35 = a9;
  id v18 = a10;
  id v19 = a11;
  v41.receiver = self;
  v41.super_class = (Class)CHFriendListViewController;
  v20 = [(CHFriendListViewController *)&v41 initWithStyle:0];
  v21 = v20;
  if (v20)
  {
    id v33 = v17;
    objc_storeStrong((id *)&v20->_friendListManager, a3);
    objc_storeStrong((id *)&v21->_friendManager, a4);
    objc_storeStrong((id *)&v21->_achievementsDataProvider, a5);
    objc_storeStrong((id *)&v21->_workoutsDataProvider, a6);
    objc_storeStrong((id *)&v21->_workoutFormattingManager, a7);
    objc_storeStrong((id *)&v21->_formattingManager, a8);
    objc_storeStrong((id *)&v21->_imageFactory, a9);
    v21->_hasAnyFriends = [(ASFriendListSectionManager *)v21->_friendListManager hasAnyFriendsSetup];
    uint64_t v22 = objc_opt_new();
    friendListDisplayContext = v21->_friendListDisplayContext;
    v21->_friendListDisplayContext = (ASFriendListDisplayContext *)v22;

    [(ASFriendListDisplayContext *)v21->_friendListDisplayContext setDisplayFilter:0];
    v24 = +[NSUserDefaults standardUserDefaults];
    v25 = [v24 objectForKey:@"CHFriendListDisplayMode"];

    if (v25 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      id v26 = [v25 integerValue];
    }
    else {
      id v26 = 0;
    }
    [(ASFriendListDisplayContext *)v21->_friendListDisplayContext setDisplayMode:v26];
    uint64_t v27 = +[NSMutableDictionary dictionary];
    cellHeightCache = v21->_cellHeightCache;
    v21->_cellHeightCache = (NSMutableDictionary *)v27;

    uint64_t v29 = +[ASCompetitionScoreViewConfiguration companionFriendListConfiguration];
    competitionScoreConfiguration = v21->_competitionScoreConfiguration;
    v21->_competitionScoreConfiguration = (ASCompetitionScoreViewConfiguration *)v29;

    objc_storeStrong((id *)&v21->_healthStore, a10);
    objc_storeStrong((id *)&v21->_fitnessAppContext, a11);
    v31 = +[NSNotificationCenter defaultCenter];
    [v31 addObserver:v21 selector:"_contentSizeCategoryDidChangeNotification:" name:UIContentSizeCategoryDidChangeNotification object:0];

    id v17 = v33;
  }

  return v21;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CHFriendListViewController;
  [(CHFriendListViewController *)&v4 dealloc];
}

- (void)loadView
{
  v11.receiver = self;
  v11.super_class = (Class)CHFriendListViewController;
  [(CHFriendListViewController *)&v11 loadView];
  v3 = [(CHFriendListViewController *)self tableView];
  uint64_t v4 = objc_opt_class();
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v3 registerClass:v4 forCellReuseIdentifier:v6];

  v7 = [(CHFriendListViewController *)self tableView];
  uint64_t v8 = objc_opt_class();
  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  [v7 registerClass:v8 forCellReuseIdentifier:v10];
}

- (void)viewDidLoad
{
  v30.receiver = self;
  v30.super_class = (Class)CHFriendListViewController;
  [(CHFriendListViewController *)&v30 viewDidLoad];
  v3 = +[NSBundle mainBundle];
  uint64_t v4 = [v3 localizedStringForKey:@"SHARING" value:&stru_1008D8AB8 table:@"Localizable"];
  v5 = [(CHFriendListViewController *)self navigationItem];
  [v5 setTitle:v4];

  v6 = +[UIColor systemBackgroundColor];
  v7 = [(CHFriendListViewController *)self tableView];
  [v7 setBackgroundColor:v6];

  uint64_t v8 = [(CHFriendListViewController *)self tableView];
  [v8 setSectionHeaderTopPadding:0.0];

  id v9 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  v10 = [(CHFriendListViewController *)self tableView];
  [v10 setTableFooterView:v9];

  objc_super v11 = [(CHFriendListViewController *)self navigationItem];
  [v11 setLargeTitleDisplayMode:1];

  v12 = [(CHFriendListViewController *)self _sortMenu];
  id v13 = objc_alloc((Class)UIBarButtonItem);
  v14 = +[NSBundle mainBundle];
  v15 = [v14 localizedStringForKey:@"SORT" value:&stru_1008D8AB8 table:@"Localizable"];
  v16 = (UIBarButtonItem *)[v13 initWithTitle:v15 menu:v12];
  sortBarButtonItem = self->_sortBarButtonItem;
  self->_sortBarButtonItem = v16;

  id v18 = (CHFriendInboxBarButtonView *)objc_opt_new();
  inboxButtonView = self->_inboxButtonView;
  self->_inboxButtonView = v18;

  [(CHFriendInboxBarButtonView *)self->_inboxButtonView setDelegate:self];
  v20 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithCustomView:self->_inboxButtonView];
  inboxBarButtonItem = self->_inboxBarButtonItem;
  self->_inboxBarButtonItem = v20;

  uint64_t v22 = [(CHFriendListViewController *)self tableView];
  [v22 setSeparatorStyle:0];

  v23 = [(CHFriendListViewController *)self tableView];
  [v23 setIndicatorStyle:2];

  v24 = [(CHFriendListViewController *)self navigationItem];
  [v24 setBackButtonDisplayMode:2];

  id v25 = objc_alloc_init((Class)UIRefreshControl);
  id v26 = [(CHFriendListViewController *)self tableView];
  [v26 setRefreshControl:v25];

  uint64_t v27 = [(CHFriendListViewController *)self tableView];
  v28 = [v27 refreshControl];
  [v28 addTarget:self action:"_refreshControlValueChanged" forEvents:4096];

  self->_cellsNeedUpdate = 0;
  uint64_t v29 = +[NSNotificationCenter defaultCenter];
  [v29 addObserver:self selector:"_friendDataWasUpdated:" name:kASFriendListChangedNotificationKey object:0];
  [(CHFriendListViewController *)self _updateSectionsForCurrentDisplayContext];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CHFriendListViewController;
  [(CHFriendListViewController *)&v5 viewDidAppear:a3];
  if (!self->_haveLoggedInitialDisplayContext)
  {
    [(CHFriendListViewController *)self _logFriendListDisplayMode:[(ASFriendListDisplayContext *)self->_friendListDisplayContext displayMode]];
    self->_haveLoggedInitialDisplayContext = 1;
  }
  uint64_t v4 = [(CHFriendListViewController *)self tableView];
  [v4 flashScrollIndicators];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CHFriendListViewController;
  [(CHFriendListViewController *)&v3 viewDidLayoutSubviews];
  [(CHFriendListViewController *)self _layoutPrivacyLinkIfNecessary];
}

- (void)_layoutPrivacyLinkIfNecessary
{
  if (self->_privacyLink)
  {
    objc_super v3 = [(CHFriendListViewController *)self view];
    [v3 bounds];
    double v5 = v4;
    double v7 = v6;

    uint64_t v8 = [(OBPrivacyLinkController *)self->_privacyLink view];
    LODWORD(v9) = 1148846080;
    LODWORD(v10) = 1112014848;
    [v8 systemLayoutSizeFittingSize:v5 withHorizontalFittingPriority:0.0 verticalFittingPriority:v9];
    double v12 = v11;

    id v13 = [(CHFriendListViewController *)self tabBarController];
    v14 = [v13 tabBar];
    [v14 frame];
    double Height = CGRectGetHeight(v27);

    v16 = [(CHFriendListViewController *)self navigationController];
    id v17 = [v16 navigationBar];
    [v17 frame];
    double v18 = CGRectGetHeight(v28);

    id v19 = +[UIApplication sharedApplication];
    v20 = [v19 windows];
    v21 = [v20 firstObject];
    uint64_t v22 = [v21 windowScene];
    v23 = [v22 statusBarManager];
    [v23 statusBarFrame];
    double v24 = CGRectGetHeight(v29);

    id v25 = [(OBPrivacyLinkController *)self->_privacyLink view];
    [v25 setFrame:CGRectMake(0.0, v7 - v12 + -10.0 - Height - v18 - v24, v5, v12)];
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)showDetailForMeOnDate:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001756A0;
  v4[3] = &unk_1008ABB38;
  double v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(CHFriendListViewController *)v5 _performAfterFriendDataIsAvailable:v4];
}

- (void)showDetailForFriendWithUUID:(id)a3 date:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001757C4;
  v7[3] = &unk_1008ACD88;
  uint64_t v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(CHFriendListViewController *)v8 _performAfterFriendDataIsAvailable:v7];
}

- (void)showInbox
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100175898;
  v2[3] = &unk_1008ABA78;
  v2[4] = self;
  [(CHFriendListViewController *)self _performAfterFriendDataIsAvailable:v2];
}

- (void)scrollToTop
{
  id v6 = [(CHFriendListViewController *)self tableView];
  if ((uint64_t)[v6 numberOfSections] >= 1)
  {
    id v3 = [(CHFriendListViewController *)self tableView];
    uint64_t v4 = (uint64_t)[v3 numberOfRowsInSection:0];

    if (v4 < 1) {
      return;
    }
    id v6 = +[NSIndexPath indexPathForRow:0 inSection:0];
    id v5 = [(CHFriendListViewController *)self tableView];
    [v5 scrollToRowAtIndexPath:v6 atScrollPosition:1 animated:1];
  }
}

- (id)_makeFriendDetailViewControllerForSection:(id)a3 row:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [CHFriendDetailCollectionViewController alloc];
  friendListManager = self->_friendListManager;
  friendManager = self->_friendManager;
  double v11 = [v6 friend];
  double v12 = [v6 snapshot];

  id v13 = [v7 endDate];

  v14 = [(CHFriendDetailCollectionViewController *)v8 initWithFriendListManager:friendListManager friendManager:friendManager friend:v11 snapshot:v12 snapshotDate:v13 achievementsDataProvider:self->_achievementsDataProvider workoutDataProvider:self->_workoutsDataProvider workoutFormattingManager:self->_workoutFormattingManager formattingManager:self->_formattingManager badgeImageFactory:self->_imageFactory healthStore:self->_healthStore fitnessAppContext:self->_fitnessAppContext];

  return v14;
}

- (void)_pushDetailViewControllerForSection:(id)a3 row:(id)a4
{
  id v6 = [(CHFriendListViewController *)self _makeFriendDetailViewControllerForSection:a3 row:a4];
  id v5 = [(CHFriendListViewController *)self navigationController];
  [v5 pushViewController:v6 animated:1];
}

- (void)_showDetailForFriend:(id)a3 date:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  uint64_t v8 = self->_friendListSections;
  id v9 = v7;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v10 = [(NSArray *)v8 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v43;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v43 != v12) {
          objc_enumerationMutation(v8);
        }
        v14 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        [v9 timeIntervalSinceReferenceDate];
        double v16 = v15;
        id v17 = [v14 startDate];
        [v17 timeIntervalSinceReferenceDate];
        double v19 = v18;

        v20 = [v14 endDate];
        [v20 timeIntervalSinceReferenceDate];
        double v22 = v21;

        if (v16 >= v19 && v16 < v22)
        {
          id v24 = v14;
          goto LABEL_14;
        }
      }
      id v11 = [(NSArray *)v8 countByEnumeratingWithState:&v42 objects:v46 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  id v24 = 0;
LABEL_14:

  if (v24)
  {
    id v25 = v6;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id obj = [v24 rows];
    id v26 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v26)
    {
      id v38 = v24;
      id v39 = self;
      id v40 = v6;
      uint64_t v27 = *(void *)v43;
      while (2)
      {
        for (j = 0; j != v26; j = (char *)j + 1)
        {
          if (*(void *)v43 != v27) {
            objc_enumerationMutation(obj);
          }
          CGRect v29 = *(void **)(*((void *)&v42 + 1) + 8 * (void)j);
          if (objc_msgSend(v25, "isMe", v38, v39, v40))
          {
            objc_super v30 = [v29 friend];
            unsigned __int8 v31 = [v30 isMe];

            if (v31) {
              goto LABEL_26;
            }
          }
          v32 = [v25 UUID];
          id v33 = [v29 friend];
          v34 = [v33 UUID];
          unsigned __int8 v35 = [v32 isEqual:v34];

          if (v35)
          {
LABEL_26:
            id v26 = v29;
            goto LABEL_27;
          }
        }
        id v26 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
        if (v26) {
          continue;
        }
        break;
      }
LABEL_27:
      self = v39;
      id v6 = v40;
      id v24 = v38;
    }

    if (v26)
    {
      [(CHFriendListViewController *)self _pushDetailViewControllerForSection:v24 row:v26];
    }
    else
    {
      ASLoggingInitialize();
      id v37 = (void *)ASLogDefault;
      if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_ERROR)) {
        sub_10071D534(v37, v25);
      }
    }
  }
  else
  {
    ASLoggingInitialize();
    id v36 = ASLogDefault;
    if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_ERROR)) {
      sub_10071D4BC((uint64_t)v9, v36);
    }
  }
}

- (void)_performAfterFriendDataIsAvailable:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (self->_friendListSections)
  {
    v4[2](v4);
  }
  else
  {
    ASLoggingInitialize();
    id v5 = ASLogDefault;
    if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Waiting for friend data", v8, 2u);
    }
    id v6 = [v4 copy];
    id blockWaitingOnFriendData = self->_blockWaitingOnFriendData;
    self->_id blockWaitingOnFriendData = v6;
  }
}

- (id)_sortMenu
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = [(ASFriendListDisplayContext *)self->_friendListDisplayContext displayMode];
  friendListManager = self->_friendListManager;
  id v6 = [(ASFriendListDisplayContext *)self->_friendListDisplayContext displayFilter];
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  uint64_t v12 = sub_1001760E4;
  id v13 = &unk_1008AE3C8;
  v15[1] = v4;
  objc_copyWeak(v15, &location);
  id v7 = v3;
  id v14 = v7;
  [(ASFriendListSectionManager *)friendListManager enumerateValidDisplayModesForFilter:v6 usingBlock:&v10];
  uint64_t v8 = +[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v7, v10, v11, v12, v13);

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  return v8;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (self->_hasAnyFriends) {
    return [(NSArray *)self->_friendListSections count];
  }
  else {
    return 0;
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(NSArray *)self->_friendListSections objectAtIndexedSubscript:a4];
  id v5 = [v4 rows];
  id v6 = [v5 count];

  return (int64_t)v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  friendListSections = self->_friendListSections;
  id v8 = a3;
  id v9 = -[NSArray objectAtIndexedSubscript:](friendListSections, "objectAtIndexedSubscript:", [v6 section]);
  id v10 = [v9 rows];
  uint64_t v11 = [v10 objectAtIndexedSubscript:[v6 row]];

  if (-[CHFriendListViewController _isCompetitionSection:](self, "_isCompetitionSection:", [v6 section]))
  {
    uint64_t v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    id v14 = [v8 dequeueReusableCellWithIdentifier:v13 forIndexPath:v6];

    double v15 = [v11 friend];
    [v14 setFriend:v15];
  }
  else
  {
    double v16 = (objc_class *)objc_opt_class();
    id v17 = NSStringFromClass(v16);
    id v14 = [v8 dequeueReusableCellWithIdentifier:v17 forIndexPath:v6];

    [v14 setDisplayMode:[self->_friendListDisplayContext displayMode]];
    double v15 = [v11 friend];
    double v18 = [v11 snapshot];
    [v14 setFriend:v15 snapshot:v18 formattingManager:self->_formattingManager animated:0];
  }
  [v14 setSelectionStyle:0];

  return v14;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  friendListSections = self->_friendListSections;
  id v7 = a4;
  id v8 = a3;
  -[NSArray objectAtIndexedSubscript:](friendListSections, "objectAtIndexedSubscript:", [v7 section]);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = [v11 rows];
  id v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));

  [(CHFriendListViewController *)self _pushDetailViewControllerForSection:v11 row:v10];
  [v8 deselectRowAtIndexPath:v7 animated:1];
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if (-[CHFriendListViewController _isCompetitionSection:](self, "_isCompetitionSection:", [v5 section]))
  {
    id v6 = -[NSArray objectAtIndexedSubscript:](self->_friendListSections, "objectAtIndexedSubscript:", [v5 section]);
    id v7 = [v6 rows];
    id v8 = [v7 objectAtIndexedSubscript:[v5 row]];

    competitionScoreConfiguration = self->_competitionScoreConfiguration;
    id v10 = [v8 friend];
    +[CHFriendListCompetitionTableViewCell preferredHeightForConfiguration:competitionScoreConfiguration friend:v10];
    double v12 = v11;
  }
  else
  {
    +[CHFriendListTableViewCell preferredHeight];
    double v12 = v13;
  }

  return v12;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(ASFriendListDisplayContext *)self->_friendListDisplayContext displayMode];
  if (-[CHFriendListViewController _isCompetitionSection:](self, "_isCompetitionSection:", [v5 section]))
  {
    id v7 = -[NSArray objectAtIndexedSubscript:](self->_friendListSections, "objectAtIndexedSubscript:", [v5 section]);
    id v8 = [v7 rows];
    id v9 = [v8 objectAtIndexedSubscript:[v5 row]];

    competitionScoreConfiguration = self->_competitionScoreConfiguration;
    double v11 = [v9 friend];
    +[CHFriendListCompetitionTableViewCell preferredHeightForConfiguration:competitionScoreConfiguration friend:v11];
    double v13 = v12;

LABEL_6:
    goto LABEL_7;
  }
  cellHeightCache = self->_cellHeightCache;
  double v15 = +[NSNumber numberWithInteger:v6];
  id v7 = [(NSMutableDictionary *)cellHeightCache objectForKeyedSubscript:v15];

  if (!v7)
  {
    +[CHFriendListTableViewCell measuredHeightWithDisplayMode:v6 formattingManager:self->_formattingManager];
    double v13 = v17;
    id v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    double v18 = self->_cellHeightCache;
    double v19 = +[NSNumber numberWithInteger:v6];
    [(NSMutableDictionary *)v18 setObject:v9 forKeyedSubscript:v19];

    goto LABEL_6;
  }
  [v7 floatValue];
  double v13 = v16;
LABEL_7:

  return v13;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 46.0;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  [v6 rectForHeaderInSection:a4];
  double Height = CGRectGetHeight(v26);
  id v8 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  id v9 = +[UIColor blackColor];
  [v8 setBackgroundColor:v9];

  id v10 = +[UIListContentConfiguration extraProminentInsetGroupedHeaderConfiguration];
  id v11 = objc_alloc((Class)UILabel);
  [v6 separatorInset];
  double v13 = v12;
  [v6 bounds];
  double Width = CGRectGetWidth(v27);
  [v6 separatorInset];
  double v16 = v15;

  id v17 = [v11 initWithFrame:v13, 1.0, Width + v16 * -2.0, Height];
  double v18 = +[UIColor labelColor];
  [v17 setTextColor:v18];

  [v10 directionalLayoutMargins];
  [v17 setDirectionalLayoutMargins:];
  double v19 = [v10 textProperties];
  v20 = [v19 font];
  [v17 setFont:v20];

  if ([(CHFriendListViewController *)self _isCompetitionSection:a4])
  {
    double v21 = ActivitySharingBundle();
    double v22 = [v21 localizedStringForKey:@"FRIEND_LIST_COMPETITION_SECTION_HEADER" value:&stru_1008D8AB8 table:@"Localizable"];
    [v17 setText:v22];
  }
  else
  {
    double v21 = [(NSArray *)self->_friendListSections objectAtIndexedSubscript:a4];
    double v22 = [v21 startDate];
    v23 = +[FIUIDateFormattingUtilities stringWithEitherTodayOrLongStyleDateFromDate:v22];
    [v17 setText:v23];
  }
  [v8 addSubview:v17];

  return v8;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v5 = (char *)[a3 numberOfSections];
  double result = 14.0;
  if (v5 - 1 == (char *)a4) {
    return 0.0;
  }
  return result;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v4 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];

  return v4;
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  friendListSections = self->_friendListSections;
  id v7 = a4;
  id v8 = -[NSArray objectAtIndexedSubscript:](friendListSections, "objectAtIndexedSubscript:", [v7 section]);
  id v9 = [v8 rows];
  id v10 = [v7 row];

  id v11 = [v9 objectAtIndexedSubscript:v10];

  [(CHFriendListViewController *)self _makeFriendDetailViewControllerForSection:v8 row:v11];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  id v15[2] = sub_100176D2C;
  v15[3] = &unk_1008ACD10;
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = v16;
  double v13 = +[UIContextMenuConfiguration configurationWithIdentifier:0 previewProvider:v15 actionProvider:0];

  return v13;
}

- (void)tableView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v6 = a5;
  [v6 previewViewController];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100176DD8;
  v8[3] = &unk_1008ABB38;
  v8[4] = self;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v9;
  [v6 addCompletion:v8];
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4 && self->_cellsNeedUpdate)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100176EC4;
    block[3] = &unk_1008ABA78;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  if (self->_cellsNeedUpdate)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100176F50;
    block[3] = &unk_1008ABA78;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_animateOnscreenCellsToNewValues
{
  id v3 = [(CHFriendListViewController *)self tableView];
  id v4 = [v3 indexPathsForVisibleRows];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v8);
        id v10 = [(CHFriendListViewController *)self tableView];
        id v11 = [v10 cellForRowAtIndexPath:v9];

        id v12 = -[NSArray objectAtIndexedSubscript:](self->_friendListSections, "objectAtIndexedSubscript:", [v9 section]);
        double v13 = [v12 rows];
        id v14 = [v13 objectAtIndexedSubscript:[v9 row]];

        double v15 = [v14 friend];
        id v16 = [v14 snapshot];
        [v11 setFriend:v15 snapshot:v16 formattingManager:self->_formattingManager animated:1];

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  self->_cellsNeedUpdate = 0;
}

- (void)_updateSectionsForCurrentDisplayContext
{
  friendListSections = self->_friendListSections;
  self->_friendListSections = (NSArray *)&__NSArray0__struct;

  id v4 = [(ASFriendListSectionManager *)self->_friendListManager sectionForFriendsCompetingWithMe];
  competitionSection = self->_competitionSection;
  self->_competitionSection = v4;

  id v6 = [(ASFriendListSection *)self->_competitionSection rows];
  id v7 = [v6 count];

  if (v7)
  {
    id v8 = [(NSArray *)self->_friendListSections arrayByAddingObject:self->_competitionSection];
    id v9 = self->_friendListSections;
    self->_friendListSections = v8;
  }
  id v10 = [(ASFriendListSectionManager *)self->_friendListManager sectionsForDisplayContext:self->_friendListDisplayContext];
  id v11 = [(NSArray *)self->_friendListSections arrayByAddingObjectsFromArray:v10];
  id v12 = self->_friendListSections;
  self->_friendListSections = v11;

  self->_pendingRequestCount = (unint64_t)[(ASFriendListSectionManager *)self->_friendListManager totalNumberOfPendingRequests];
  double v13 = [(ASFriendListSectionManager *)self->_friendListManager sectionForFriendsHidingDataFromMe];
  id v14 = [v13 rows];
  self->_hiddenFriends = (unint64_t)[v14 count];

  self->_hasAnyFriends = [(ASFriendListSectionManager *)self->_friendListManager hasAnyFriendsSetup];
  inboxBarButtonItem = self->_inboxBarButtonItem;
  double v15 = +[NSArray arrayWithObjects:&inboxBarButtonItem count:1];
  id v16 = [(CHFriendListViewController *)self navigationItem];
  [v16 setRightBarButtonItems:v15];

  if (self->_pendingRequestCount)
  {
    id v17 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
    long long v18 = +[FIUIFormattingManager stringWithNumber:v17 decimalPrecision:1];
    [(CHFriendInboxBarButtonView *)self->_inboxButtonView setBadgeText:v18];
  }
  else
  {
    -[CHFriendInboxBarButtonView setBadgeText:](self->_inboxButtonView, "setBadgeText:");
  }
  if (![(NSArray *)self->_friendListSections count])
  {
    CGRect v27 = [(CHFriendListViewController *)self navigationItem];
    [v27 setLeftBarButtonItem:0];

    CGRect v28 = [(ASFriendListSectionManager *)self->_friendListManager sectionForFriendsInvitedByMe];
    CGRect v29 = [v28 rows];
    id v30 = [v29 count];

    emptyListView = self->_emptyListView;
    if (emptyListView)
    {
      [(CHFriendEmptyListView *)emptyListView updateOutgoingInvites:v30];
    }
    else
    {
      v32 = [[CHFriendEmptyListView alloc] initWithOutgoingInvites:v30];
      id v33 = self->_emptyListView;
      self->_emptyListView = v32;

      v34 = self->_emptyListView;
      unsigned __int8 v35 = [(CHFriendListViewController *)self tableView];
      [v35 setBackgroundView:v34];
    }
    id v36 = [(CHFriendListViewController *)self tableView];
    [v36 setScrollEnabled:0];

    if (!self->_privacyLink)
    {
      id v37 = +[OBPrivacyLinkController linkWithBundleIdentifier:@"com.apple.onboarding.activity"];
      privacyLink = self->_privacyLink;
      self->_privacyLink = v37;

      [(OBPrivacyLinkController *)self->_privacyLink setPresentedViewControllerShouldUseDarkMode:1];
      [(OBPrivacyLinkController *)self->_privacyLink setDisplayIcon:0];
      [(CHFriendListViewController *)self addChildViewController:self->_privacyLink];
      id v39 = [(CHFriendListViewController *)self view];
      id v40 = [(OBPrivacyLinkController *)self->_privacyLink view];
      [v39 addSubview:v40];

      [(OBPrivacyLinkController *)self->_privacyLink didMoveToParentViewController:self];
    }
    CGRect v26 = [(CHFriendListViewController *)self view];
    [v26 setNeedsLayout];
    goto LABEL_17;
  }
  long long v19 = [(CHFriendListViewController *)self tableView];
  [v19 setBackgroundView:0];

  long long v20 = [(CHFriendListViewController *)self tableView];
  [v20 setScrollEnabled:1];

  sortBarButtonItem = self->_sortBarButtonItem;
  double v22 = [(CHFriendListViewController *)self navigationItem];
  [v22 setLeftBarButtonItem:sortBarButtonItem];

  v23 = self->_emptyListView;
  if (v23)
  {
    self->_emptyListView = 0;
  }
  id v24 = self->_privacyLink;
  if (v24)
  {
    id v25 = [(OBPrivacyLinkController *)v24 view];
    [v25 removeFromSuperview];

    [(OBPrivacyLinkController *)self->_privacyLink willMoveToParentViewController:0];
    [(OBPrivacyLinkController *)self->_privacyLink removeFromParentViewController];
    CGRect v26 = self->_privacyLink;
    self->_privacyLink = 0;
LABEL_17:
  }
  [(CHFriendListViewController *)self _executeBlockWaitingOnFriendsDataIfNeeded];
}

- (void)_friendDataWasUpdated:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100177640;
  block[3] = &unk_1008ABA78;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_executeBlockWaitingOnFriendsDataIfNeeded
{
  if (self->_blockWaitingOnFriendData && self->_friendListSections)
  {
    ASLoggingInitialize();
    id v3 = ASLogFriendList;
    if (os_log_type_enabled(ASLogFriendList, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Block waiting on friend data, invoking now", v5, 2u);
    }
    (*((void (**)(void))self->_blockWaitingOnFriendData + 2))();
    id blockWaitingOnFriendData = self->_blockWaitingOnFriendData;
    self->_id blockWaitingOnFriendData = 0;
  }
}

- (BOOL)_isCompetitionSection:(unint64_t)a3
{
  if (a3) {
    return 0;
  }
  id v4 = [(ASFriendListSection *)self->_competitionSection rows];
  BOOL v3 = [v4 count] != 0;

  return v3;
}

- (void)_refreshControlValueChanged
{
  friendListManager = self->_friendListManager;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100177820;
  v3[3] = &unk_1008ABE08;
  v3[4] = self;
  [(ASFriendListSectionManager *)friendListManager fetchActivitySharingDataIfTimeSinceLastFetchIsGreaterThan:180 completion:v3];
}

- (void)didTapInboxBarButtonView:(id)a3
{
  id v5 = [[CHFriendInboxTableViewController alloc] initWithFriendListManager:self->_friendListManager friendManager:self->_friendManager achievementsDataProvider:self->_achievementsDataProvider workoutsDataProvider:self->_workoutsDataProvider workoutFormattingManager:self->_workoutFormattingManager formattingManager:self->_formattingManager badgeImageFactory:self->_imageFactory healthStore:self->_healthStore fitnessAppContext:self->_fitnessAppContext makeFriendDetailViewControllerBlock:0];
  id v4 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v5];
  [(CHFriendListViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)_contentSizeCategoryDidChangeNotification:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100177A5C;
  block[3] = &unk_1008ABA78;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_logFriendListDisplayMode:(int64_t)a3
{
  if ((unint64_t)a3 <= 4) {
    FIActivityAnalyticsSubmission();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fitnessAppContext, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_competitionScoreConfiguration, 0);
  objc_storeStrong(&self->_blockWaitingOnFriendData, 0);
  objc_storeStrong((id *)&self->_emptyListView, 0);
  objc_storeStrong((id *)&self->_inboxButtonView, 0);
  objc_storeStrong((id *)&self->_privacyLink, 0);
  objc_storeStrong((id *)&self->_inboxBarButtonItem, 0);
  objc_storeStrong((id *)&self->_sortBarButtonItem, 0);
  objc_storeStrong((id *)&self->_cellHeightCache, 0);
  objc_storeStrong((id *)&self->_competitionSection, 0);
  objc_storeStrong((id *)&self->_friendListDisplayContext, 0);
  objc_storeStrong((id *)&self->_friendListSections, 0);
  objc_storeStrong((id *)&self->_imageFactory, 0);
  objc_storeStrong((id *)&self->_achievementsDataProvider, 0);
  objc_storeStrong((id *)&self->_workoutsDataProvider, 0);
  objc_storeStrong((id *)&self->_workoutFormattingManager, 0);
  objc_storeStrong((id *)&self->_formattingManager, 0);
  objc_storeStrong((id *)&self->_friendListManager, 0);

  objc_storeStrong((id *)&self->_friendManager, 0);
}

@end