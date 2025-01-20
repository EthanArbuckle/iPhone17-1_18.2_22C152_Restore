@interface TPSMainViewController
- (BOOL)_isAppContentLoaded;
- (BOOL)_splitViewController:(id)a3 allowInteractivePresentationGesture:(id)a4 inContentsOfColumn:(int64_t)a5;
- (BOOL)canDisplayColumn:(int64_t)a3;
- (BOOL)handleContinueCoreSpotlightSearchActivity:(id)a3;
- (BOOL)handleCoreSpotlightItemActivity:(id)a3;
- (BOOL)handleSearchWithSearchQuery:(id)a3;
- (BOOL)handleUniversalLinkWithUserActivity:(id)a3;
- (BOOL)handleUserActivity:(id)a3;
- (BOOL)hasLoaded;
- (BOOL)isCollectionsViewVisible;
- (BOOL)openURL:(id)a3 options:(id)a4;
- (BOOL)pendingColumnSwitching;
- (BOOL)tipsViewControllerShouldShowSearch:(id)a3;
- (BOOL)tipsViewControllerShouldStartVideo:(id)a3;
- (BOOL)userGuideDisplayed;
- (CollectionListViewController)collectionListViewController;
- (NSString)pendingSharedTipVariantID;
- (NSString)pendingShowTipIdentifier;
- (NSURL)pendingOpenUniversalURL;
- (TPSAnalyticsEventAppLaunched)pendingAppLaunchEvent;
- (TPSAppSearchQuery)pendingAppSearchQuery;
- (TPSLastDisplayedContent)lastDisplayedContent;
- (TPSMainViewController)init;
- (TPSTipsByCollectionViewController)tipsByCollectionViewController;
- (TPSUIAppController)appController;
- (TipListViewController)tipListViewController;
- (_TtC4Tips22TPSSplitViewController)splitViewController;
- (id)childViewControllerForStatusBarStyle;
- (id)tipsByCollectionViewController:(id)a3 tipsForCollectionID:(id)a4;
- (int64_t)currentCollapsedDisplayColumn;
- (int64_t)currentDisplayMode;
- (int64_t)splitViewController:(id)a3 topColumnForCollapsingToProposedTopColumn:(int64_t)a4;
- (void)appController:(id)a3 loadingContent:(BOOL)a4;
- (void)appControllerContentUpdated:(id)a3;
- (void)appControllerTipViewed:(id)a3 tipIdentifier:(id)a4 collectionIdentifier:(id)a5;
- (void)appControllerUserUpdatedSavedTips:(id)a3;
- (void)appViewControllerViewWillAppear:(id)a3;
- (void)applicationDidBecomeActive;
- (void)applicationDidEnterBackground;
- (void)applicationWillEnterForeground;
- (void)applicationWillTerminate;
- (void)displayCollectionID:(id)a3 tipID:(id)a4;
- (void)displayCollectionID:(id)a3 tipID:(id)a4 preferredColumn:(int64_t)a5;
- (void)displayUserGuideWithIdentifier:(id)a3 topicId:(id)a4 version:(id)a5 platformIndependent:(BOOL)a6 prefersLandingPage:(BOOL)a7;
- (void)handleTipsURL:(id)a3;
- (void)helpViewControllerContentViewed:(id)a3 topicID:(id)a4 topicTitle:(id)a5 source:(id)a6 interfaceStyle:(int64_t)a7 fromTopicID:(id)a8 externalURLString:(id)a9;
- (void)helpViewControllerDoneButtonTapped:(id)a3;
- (void)helpViewControllerSearchUsed:(id)a3;
- (void)helpViewControllerTOCUsed:(id)a3;
- (void)logAnalyticsEventForAppForeground;
- (void)logAnalyticsEventForChecklistSession;
- (void)resyncTipList;
- (void)setAppController:(id)a3;
- (void)setCollectionListViewController:(id)a3;
- (void)setCurrentCollapsedDisplayColumn:(int64_t)a3;
- (void)setCurrentDisplayMode:(int64_t)a3;
- (void)setHasLoaded:(BOOL)a3;
- (void)setLastDisplayedContent:(id)a3;
- (void)setPendingAppLaunchEvent:(id)a3;
- (void)setPendingAppSearchQuery:(id)a3;
- (void)setPendingColumnSwitching:(BOOL)a3;
- (void)setPendingOpenUniversalURL:(id)a3;
- (void)setPendingSharedTipVariantID:(id)a3;
- (void)setPendingShowTipIdentifier:(id)a3;
- (void)setSplitViewController:(id)a3;
- (void)setTipListViewController:(id)a3;
- (void)setTipsByCollectionViewController:(id)a3;
- (void)setUserGuideDisplayed:(BOOL)a3;
- (void)setupCollectionListView;
- (void)setupSearchResultSelectedHandler;
- (void)setupSplitView;
- (void)setupTipListView;
- (void)setupTipsByCollectionView;
- (void)showCollectionWithIdentifier:(id)a3 launchType:(id)a4;
- (void)showCollectionsView;
- (void)showModalTipWithVariantID:(id)a3;
- (void)showTOCView;
- (void)showTipWithID:(id)a3 launchType:(id)a4;
- (void)showTipsView;
- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4;
- (void)tipsViewController:(id)a3 didSelectSearchResult:(id)a4;
- (void)tipsViewController:(id)a3 loadMainUserGuideWithIdentifier:(id)a4 topicId:(id)a5;
- (void)tipsViewController:(id)a3 showSharedTipWithTipIdentifier:(id)a4;
- (void)tipsViewControllerContentUpdated:(id)a3;
- (void)tipsViewControllerCurrentTipUpdated:(id)a3;
- (void)updateAppInBackground:(BOOL)a3;
- (void)updateAppShortcutSuggestions;
- (void)updateCollectionListModelDynamicSections;
- (void)updateShortcutItems;
- (void)updateShouldHoldOffVideo;
- (void)updateSupplementaryColumnForCollectionID:(id)a3;
- (void)updateViewCollapsed:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation TPSMainViewController

- (void)applicationDidBecomeActive
{
  id v3 = [(TPSMainViewController *)self appController];
  v2 = [v3 fullTipContentManager];
  [v2 tipsAppActive];
}

- (int64_t)splitViewController:(id)a3 topColumnForCollapsingToProposedTopColumn:(int64_t)a4
{
  id v7 = a3;
  [(TPSMainViewController *)self updateViewCollapsed:1];
  [(TPSMainViewController *)self updateCollectionListModelDynamicSections];
  if (+[TPSCommonDefines isPhoneUI])
  {
    a4 = 0;
LABEL_3:
    [(TPSMainViewController *)self setCurrentCollapsedDisplayColumn:a4];
    int64_t v4 = a4;
    goto LABEL_9;
  }
  unint64_t v8 = (unint64_t)[v7 displayMode];
  unint64_t v9 = v8;
  if (v8 <= 6 && ((1 << v8) & 0x68) != 0) {
    int64_t v4 = [(TPSMainViewController *)self isCollectionsViewVisible] ^ 1;
  }
  if (v9 > 6 || ((1 << v9) & 0x68) == 0) {
    goto LABEL_3;
  }
LABEL_9:

  return v4;
}

- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4
{
  [(TPSMainViewController *)self setCurrentDisplayMode:a4];
  [(TPSMainViewController *)self updateShouldHoldOffVideo];
  id v5 = [(TPSMainViewController *)self view];
  [v5 setNeedsLayout];
}

- (void)showCollectionsView
{
  if ([(TPSMainViewController *)self canDisplayColumn:0])
  {
    id v3 = [(TPSMainViewController *)self splitViewController];
    [v3 showColumn:0];
  }
}

- (void)appViewControllerViewWillAppear:(id)a3
{
  id v7 = a3;
  int64_t v4 = [(TPSMainViewController *)self appController];
  unsigned int v5 = [v4 viewNavigationCollapsed];

  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = 0;
LABEL_7:
      [(TPSMainViewController *)self setCurrentCollapsedDisplayColumn:v6];
      goto LABEL_8;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      uint64_t v6 = 1;
      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = 2;
      goto LABEL_7;
    }
  }
LABEL_8:
}

- (TPSLastDisplayedContent)lastDisplayedContent
{
  lastDisplayedContent = self->_lastDisplayedContent;
  if (!lastDisplayedContent)
  {
    int64_t v4 = +[TPSSecureArchivingUtilities unarchivedObjectOfClass:objc_opt_class() forKey:@"TPSAppLastDisplayedContent"];
    unsigned int v5 = self->_lastDisplayedContent;
    self->_lastDisplayedContent = v4;

    lastDisplayedContent = self->_lastDisplayedContent;
    if (!lastDisplayedContent)
    {
      uint64_t v6 = objc_alloc_init(TPSLastDisplayedContent);
      id v7 = self->_lastDisplayedContent;
      self->_lastDisplayedContent = v6;

      lastDisplayedContent = self->_lastDisplayedContent;
    }
  }

  return lastDisplayedContent;
}

- (void)setupSearchResultSelectedHandler
{
  v2 = self;
  uint64_t v6 = [(TPSMainViewController *)v2 collectionListViewController];
  uint64_t v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  int64_t v4 = (void (**)(uint64_t))((char *)v6 + OBJC_IVAR___CollectionListViewController_searchResultSelectedHandler);
  uint64_t v5 = *(uint64_t *)((char *)&v6->super.super.super.super.super.isa
                  + OBJC_IVAR___CollectionListViewController_searchResultSelectedHandler);
  *int64_t v4 = sub_100041340;
  v4[1] = (void (*)(uint64_t))v3;
  sub_100005470(v5);
}

- (void)updateAppShortcutSuggestions
{
  uint64_t v3 = type metadata accessor for TipsLog();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = self;
  static TipsLog.default.getter();
  log(_:_:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_10001E308();
  static AppShortcutsProvider.updateAppShortcutParameters()();
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)TPSMainViewController;
  [(TPSViewController *)&v6 viewDidLoad];
  [(TPSMainViewController *)self setupCollectionListView];
  [(TPSMainViewController *)self setupTipListView];
  [(TPSMainViewController *)self setupTipsByCollectionView];
  [(TPSMainViewController *)self setupSplitView];
  uint64_t v3 = [(TPSMainViewController *)self lastDisplayedContent];
  unsigned __int8 v4 = [v3 hasContent];

  if ((v4 & 1) == 0) {
    [(TPSMainViewController *)self showCollectionsView];
  }
  uint64_t v5 = [(TPSMainViewController *)self appController];
  [v5 updateContent];
}

- (void)setupTipListView
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc_init((Class)objc_loadClassref());
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002FD88;
  v5[3] = &unk_1000B7830;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  [v3 setActionHandler:v5];
  unsigned __int8 v4 = [[TipListViewController alloc] initWithViewModel:v3];
  [(TPSAppViewController *)v4 setViewCycleDelegate:self];
  [(TPSMainViewController *)self setTipListViewController:v4];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)appControllerUserUpdatedSavedTips:(id)a3
{
  id v14 = a3;
  unsigned __int8 v4 = [(TPSMainViewController *)self collectionListViewController];
  uint64_t v5 = [v4 viewModel];

  id v6 = [v14 savedTipsCollection];
  [v5 setSavedTipsCollection:v6];

  id v7 = [v5 currentCollectionID];
  unsigned int v8 = [v7 isEqual:@"SavedTips"];

  if (v8)
  {
    unint64_t v9 = [v14 savedTipsCollection];

    if (v9)
    {
      v10 = [(TPSMainViewController *)self tipsByCollectionViewController];
      [v10 updateTipsForCurrentCollection];
LABEL_10:

      goto LABEL_11;
    }
    v11 = [(TPSMainViewController *)self appController];
    unsigned int v12 = [v11 viewNavigationCollapsed];

    if (v12) {
      [(TPSMainViewController *)self showCollectionsView];
    }
    if (+[TPSCommonDefines isPadUI])
    {
      v13 = [v14 featuredCollection];
      v10 = [v13 identifier];

      if (!v10)
      {
        v10 = +[TPSCommonDefines softwareWelcomeCollectionIdentifier];
      }
      [(TPSMainViewController *)self displayCollectionID:v10 tipID:0];
      goto LABEL_10;
    }
  }
LABEL_11:
}

- (void)updateShortcutItems
{
  +[NSMutableArray array];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100015864;
  v22[3] = &unk_1000B78F8;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v23 = v3;
  unsigned __int8 v4 = objc_retainBlock(v22);
  uint64_t v5 = [(TPSMainViewController *)self appController];
  id v6 = [v5 tips];

  id v7 = [v6 mutableCopy];
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  v17 = sub_100015784;
  v18 = &unk_1000B7920;
  unsigned int v8 = v4;
  id v21 = v8;
  id v9 = v7;
  id v19 = v9;
  id v10 = v3;
  id v20 = v10;
  [v6 enumerateObjectsUsingBlock:&v15];
  if ((unint64_t)objc_msgSend(v10, "count", v15, v16, v17, v18) <= 2)
  {
    do
    {
      if (![v9 count]) {
        break;
      }
      uint64_t v11 = (int)arc4random_uniform((uint32_t)[v9 count]);
      unsigned int v12 = [v9 objectAtIndexedSubscript:v11];
      [v9 removeObjectAtIndex:v11];
      ((void (*)(void *, void *))v8[2])(v8, v12);
    }
    while ((unint64_t)[v10 count] < 3);
  }
  if ([v10 count]) {
    id v13 = v10;
  }
  else {
    id v13 = 0;
  }
  id v14 = +[UIApplication sharedApplication];
  [v14 setShortcutItems:v13];
}

- (void)setupCollectionListView
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc_init(CollectionListViewModel);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002FB68;
  v10[3] = &unk_1000B77B8;
  objc_copyWeak(&v11, &location);
  v10[4] = self;
  [(CollectionListViewModel *)v3 setActionHandler:v10];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002FC20;
  v8[3] = &unk_1000B77E0;
  objc_copyWeak(&v9, &location);
  [(CollectionListViewModel *)v3 setChecklistHandler:v8];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002FCD8;
  v6[3] = &unk_1000B7808;
  objc_copyWeak(&v7, &location);
  [(CollectionListViewModel *)v3 setUserGuideHandler:v6];
  unsigned __int8 v4 = [[CollectionListViewController alloc] initWithViewModel:v3];
  [(TPSAppViewController *)v4 setViewCycleDelegate:self];
  uint64_t v5 = +[CollectionListViewController defaultNavigationTitle];
  [(CollectionListViewController *)v4 setTitle:v5];

  [(TPSMainViewController *)self setCollectionListViewController:v4];
  [(TPSMainViewController *)self setupSearchResultSelectedHandler];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

- (void)appControllerContentUpdated:(id)a3
{
  id v52 = a3;
  unsigned __int8 v4 = [(TPSMainViewController *)self collectionListViewController];
  uint64_t v5 = [v4 viewModel];

  id v6 = [(TPSMainViewController *)self splitViewController];
  unsigned int v7 = [v6 isCollapsed];

  unsigned int v8 = [v5 collections];
  if ([v8 count]) {
    int v9 = 0;
  }
  else {
    int v9 = v7 ^ 1;
  }

  id v10 = [v52 collections];
  id v11 = [v5 collections];

  if (v10 != v11)
  {
    unsigned int v12 = [(TPSMainViewController *)self collectionListViewController];
    [v12 analyticsIncreaseCountViewForCollectionsViewDelay:TPSAnalyticsViewMethodSpringboardLaunch];
  }
  if ([v10 count]) {
    id v13 = v10;
  }
  else {
    id v13 = &__NSArray0__struct;
  }
  [v5 setCollections:v13];
  id v14 = [v52 checklistCollection];
  [v5 setChecklistCollection:v14];

  v15 = [v52 savedTipsCollection];
  [v5 setSavedTipsCollection:v15];

  uint64_t v16 = [v52 userGuides];
  [v5 setUserGuides:v16];

  [(TPSMainViewController *)self updateCollectionListModelDynamicSections];
  v17 = [(TPSMainViewController *)self appController];
  if ([v17 updatingContent]) {
    goto LABEL_10;
  }
  v18 = [(TPSMainViewController *)self appController];
  unsigned int v19 = [v18 contentHasLoaded];

  if (v19)
  {
    if (self->_pendingAppLaunchEvent)
    {
      id v20 = [(TPSMainViewController *)self appController];
      id v21 = [(TPSAnalyticsEventAppLaunched *)self->_pendingAppLaunchEvent contentID];
      v22 = [v20 tipForIdentifier:v21];

      id v23 = [v22 correlationID];
      [(TPSAnalyticsEventAppLaunched *)self->_pendingAppLaunchEvent setCorrelationID:v23];

      v24 = [(TPSAnalyticsEventAppLaunched *)self->_pendingAppLaunchEvent collectionID];
      LODWORD(v21) = [v24 isEqual:TPSAnalyticsContentStyleLandingPage];

      if (v21)
      {
        v25 = [(TPSMainViewController *)self appController];
        v26 = [v22 identifier];
        v27 = [v25 collectionIdentifierForTipIdentifier:v26];
        [(TPSAnalyticsEventAppLaunched *)self->_pendingAppLaunchEvent setCollectionID:v27];
      }
      [(TPSAnalyticsEventAppLaunched *)self->_pendingAppLaunchEvent log];
      pendingAppLaunchEvent = self->_pendingAppLaunchEvent;
      self->_pendingAppLaunchEvent = 0;
    }
    if (!self->_pendingShowTipIdentifier
      && !self->_pendingOpenUniversalURL
      && ![(TPSMainViewController *)self hasLoaded])
    {
      v17 = [(TPSMainViewController *)self tipsByCollectionViewController];
      if (([v17 pendingContentUpdate] & 1) == 0)
      {
        v29 = [(TPSMainViewController *)self tipsByCollectionViewController];
        v30 = [v29 currentTip];
        if (v30)
        {
        }
        else
        {
          v31 = [(TPSMainViewController *)self appController];
          v32 = [v31 tips];
          id v33 = [v32 count];

          if (!v33) {
            goto LABEL_19;
          }
          v34 = [(TPSMainViewController *)self lastDisplayedContent];
          v17 = v34;
          if (v7)
          {
            [(TPSMainViewController *)self showCollectionsView];
          }
          else
          {
            if ([v34 hasContent])
            {
              v35 = [v52 featuredCollection];
              v36 = v35;
              if (v35) {
                int v37 = v9;
              }
              else {
                int v37 = 0;
              }
              if (v37 == 1)
              {
                v38 = [v35 identifier];
                v39 = [v52 tipsForCollectionIdentifier:v38];
                if (v39)
                {
                  [v17 setCollectionId:v38];
                  v40 = [v39 firstObject];
                  v41 = [v40 identifier];
                  [v17 setTipId:v41];
                }
              }
              uint64_t v42 = [v17 collectionId];
              uint64_t v43 = [v17 tipId];
              v44 = [v52 collectionForIdentifier:v42];

              if (!v44)
              {

                uint64_t v43 = 0;
                uint64_t v42 = 0;
              }
              v45 = [v52 tipForIdentifier:v43];

              if (!v45)
              {

                uint64_t v43 = 0;
              }
            }
            else
            {
              uint64_t v43 = 0;
              uint64_t v42 = 0;
            }
            if (!(v43 | v42))
            {
              v46 = +[TPSCommonDefines sharedInstance];
              uint64_t v42 = [v46 collectionIdentifierForCurrentUserType];
            }
            if (v43 | v42)
            {
              if ([(id)v43 length]) {
                uint64_t v47 = 2;
              }
              else {
                uint64_t v47 = 1;
              }
              v48 = [(TPSMainViewController *)self collectionListViewController];
              v49 = [v48 viewModel];
              unsigned int v50 = [v49 viewCollapsed];

              if (v50) {
                uint64_t v51 = 0;
              }
              else {
                uint64_t v51 = v47;
              }
              [(TPSMainViewController *)self displayCollectionID:v42 tipID:v43 preferredColumn:v51];
            }
          }
          [(TPSMainViewController *)self setHasLoaded:1];
        }
      }
LABEL_10:
    }
  }
LABEL_19:
  [(TPSMainViewController *)self updateShortcutItems];
  [(TPSMainViewController *)self updateAppShortcutSuggestions];
}

- (void)appController:(id)a3 loadingContent:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unsigned int v7 = [v6 collections];
  if ([v7 count])
  {
    BOOL v8 = 0;
  }
  else
  {
    int v9 = [v6 featuredCollection];
    BOOL v8 = v9 == 0;
  }
  if (v4)
  {
    [(TPSViewController *)self removeInlineMessageLabel];
    id v10 = [(TPSMainViewController *)self tipListViewController];
    [v10 removeInlineMessageLabel];

    if (v8)
    {
      [(TPSViewController *)self setLoading:1];
      id v11 = [(TPSMainViewController *)self tipListViewController];
      [v11 setLoading:1];
    }
    goto LABEL_32;
  }
  [(TPSViewController *)self setLoading:0];
  unsigned int v12 = [(TPSMainViewController *)self tipListViewController];
  [v12 setLoading:0];

  pendingShowTipIdentifier = self->_pendingShowTipIdentifier;
  if (pendingShowTipIdentifier)
  {
    id v14 = [(NSString *)pendingShowTipIdentifier componentsSeparatedByString:@"#"];
    if ([v14 count] == (id)1)
    {
      v15 = [v14 lastObject];
      uint64_t v16 = 0;
    }
    else if ([v14 count] == (id)2)
    {
      v15 = [v14 firstObject];
      uint64_t v16 = [v14 lastObject];
    }
    else
    {
      uint64_t v16 = 0;
      v15 = 0;
    }
    BOOL v18 = 1;
    if ([v15 length]) {
      uint64_t v19 = 2;
    }
    else {
      uint64_t v19 = 1;
    }
    [(TPSMainViewController *)self displayCollectionID:v16 tipID:v15 preferredColumn:v19];
  }
  else
  {
    pendingOpenUniversalURL = self->_pendingOpenUniversalURL;
    if (self->_pendingAppSearchQuery)
    {
      BOOL v18 = pendingOpenUniversalURL != 0;
      -[TPSMainViewController handleSearchWithSearchQuery:](self, "handleSearchWithSearchQuery:");
    }
    else if (pendingOpenUniversalURL)
    {
      objc_initWeak(&location, self);
      uint64_t v43 = +[UIApplication sharedApplication];
      v44 = self->_pendingOpenUniversalURL;
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_100030570;
      v48[3] = &unk_1000B75F8;
      objc_copyWeak(&v49, &location);
      [v43 openURL:v44 options:&__NSDictionary0__struct completionHandler:v48];

      objc_destroyWeak(&v49);
      objc_destroyWeak(&location);
      BOOL v18 = 1;
    }
    else
    {
      if (self->_pendingSharedTipVariantID)
      {
        v45 = [(TPSMainViewController *)self appController];
        v46 = [v45 tipForVariantIdentifier:self->_pendingSharedTipVariantID];

        if (v46)
        {
          uint64_t v47 = [v46 identifier];
          [(TPSMainViewController *)self showCollectionWithIdentifier:v47 launchType:TPSAnalyticsLaunchTypeSharedTipLocal];
        }
        else
        {
          [(TPSMainViewController *)self showModalTipWithVariantID:self->_pendingSharedTipVariantID];
        }
      }
      BOOL v18 = 0;
    }
  }
  id v20 = [(TPSMainViewController *)self collectionListViewController];
  id v21 = [v20 viewModel];

  v22 = [v21 currentCollectionID];
  id v23 = v22;
  if (!v22 && !v18)
  {
    v24 = [(TPSMainViewController *)self appController];
    unsigned __int8 v25 = [v24 viewNavigationCollapsed];

    if (v25) {
      goto LABEL_28;
    }
LABEL_24:
    v26 = [(TPSMainViewController *)self tipListViewController];
    v27 = [v26 viewModel];
    v28 = [v27 collection];
    v29 = v28;
    if (v28)
    {
      id v30 = v28;
    }
    else
    {
      v31 = [(TPSMainViewController *)self appController];
      v32 = [v31 collections];
      id v30 = [v32 firstObject];
    }
    id v33 = [v30 identifier];
    [v21 setCurrentCollectionID:v33];

    goto LABEL_28;
  }

  if (!v23) {
    goto LABEL_24;
  }
LABEL_28:
  if (v8)
  {
    v34 = [(TPSMainViewController *)self appController];
    v35 = [v34 lastFetchError];
    [(TPSViewController *)self showInlineMessageForError:v35];
  }
  else
  {
    v36 = [(TPSMainViewController *)self splitViewController];
    int v37 = [v36 view];
    [v37 setHidden:0];

    v34 = self->_pendingShowTipIdentifier;
    self->_pendingShowTipIdentifier = 0;
  }

  v38 = self->_pendingOpenUniversalURL;
  self->_pendingOpenUniversalURL = 0;

  pendingAppSearchQuery = self->_pendingAppSearchQuery;
  self->_pendingAppSearchQuery = 0;

  pendingSharedTipVariantID = self->_pendingSharedTipVariantID;
  self->_pendingSharedTipVariantID = 0;

  v41 = +[UIApplication sharedApplication];
  uint64_t v42 = [UIApp _launchTestName];
  [v41 finishedTest:v42];

LABEL_32:
}

- (void)updateCollectionListModelDynamicSections
{
  id v3 = [(TPSMainViewController *)self collectionListViewController];
  BOOL v4 = [v3 viewModel];

  uint64_t v5 = [(TPSMainViewController *)self appController];
  id v6 = [v5 featuredCollection];
  unsigned int v7 = [v5 collectionSections];
  BOOL v8 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);
  if ([v4 viewCollapsed])
  {
    v22 = v7;
    id v23 = v5;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v9 = v7;
    id v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (!v10) {
      goto LABEL_15;
    }
    id v11 = v10;
    uint64_t v12 = *(void *)v25;
    while (1)
    {
      id v13 = 0;
      do
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(id *)(*((void *)&v24 + 1) + 8 * (void)v13);
        v15 = [v14 collections];
        unsigned int v16 = [v15 containsObject:v6];

        if (v16)
        {
          v17 = [v14 collections];
          id v18 = [v17 count];

          if ((unint64_t)v18 < 2) {
            goto LABEL_12;
          }
          id v19 = [v14 copy];

          [v19 removeCollection:v6];
          id v14 = v19;
        }
        if (!v14) {
          goto LABEL_13;
        }
        [v8 addObject:v14];
LABEL_12:

LABEL_13:
        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (!v11)
      {
LABEL_15:

        id v20 = v6;
        unsigned int v7 = v22;
        uint64_t v5 = v23;
        goto LABEL_17;
      }
    }
  }
  [v8 addObjectsFromArray:v7];
  id v20 = 0;
LABEL_17:
  [v4 setFeaturedCollection:v20, v22, v23, v24];
  if ([v8 count])
  {
    id v21 = [v8 copy];
    [v4 setCollectionSections:v21];
  }
  else
  {
    [v4 setCollectionSections:&__NSArray0__struct];
  }
}

- (CollectionListViewController)collectionListViewController
{
  return self->_collectionListViewController;
}

- (void)updateViewCollapsed:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(TPSMainViewController *)self appController];
  [v5 setViewNavigationCollapsed:v3];

  id v6 = [(TPSMainViewController *)self collectionListViewController];
  unsigned int v7 = [v6 viewModel];
  [v7 setViewCollapsed:v3];

  BOOL v8 = [(TPSMainViewController *)self tipListViewController];
  id v9 = [v8 viewModel];
  [v9 setViewCollapsed:v3];

  id v10 = [(TPSMainViewController *)self tipListViewController];
  id v11 = [v10 viewModel];
  [v11 setDisplayChevron:v3];

  id v12 = [(TPSMainViewController *)self tipsByCollectionViewController];
  [v12 setShouldDisplayNavigationTitle:v3];
}

- (TipListViewController)tipListViewController
{
  return self->_tipListViewController;
}

- (void)setupTipsByCollectionView
{
  BOOL v3 = [TPSTipsByCollectionViewController alloc];
  BOOL v4 = [(TPSMainViewController *)self appController];
  uint64_t v5 = [(TPSAppViewController *)v3 initWithAppController:v4];
  [(TPSMainViewController *)self setTipsByCollectionViewController:v5];

  id v6 = [(TPSMainViewController *)self tipsByCollectionViewController];
  [v6 setDelegate:self];

  unsigned int v7 = [(TPSMainViewController *)self tipsByCollectionViewController];
  [v7 setContentDelegate:self];

  id v8 = [(TPSMainViewController *)self tipsByCollectionViewController];
  [v8 setViewCycleDelegate:self];
}

- (void)viewDidLayoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)TPSMainViewController;
  [(TPSMainViewController *)&v17 viewDidLayoutSubviews];
  unint64_t v3 = [(TPSMainViewController *)self currentDisplayMode];
  if (+[TPSCommonDefines isPhoneUI])
  {
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v5 = [(TPSMainViewController *)self splitViewController];
    uint64_t v4 = (uint64_t)[v5 isCollapsed];
  }
  id v6 = [(TPSMainViewController *)self appController];
  unsigned int v7 = [v6 viewNavigationCollapsed];

  if (v4 != v7)
  {
    [(TPSMainViewController *)self updateViewCollapsed:v4];
    [(TPSMainViewController *)self updateCollectionListModelDynamicSections];
  }
  id v8 = [(TPSMainViewController *)self tipsByCollectionViewController];
  unsigned int v9 = [v8 allowPaging];

  if (v3 > 6) {
    char v10 = 1;
  }
  else {
    char v10 = v4;
  }
  if (v10) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = (0x2Bu >> v3) & 1;
  }
  id v12 = [(TPSMainViewController *)self tipsByCollectionViewController];
  [v12 setAllowPaging:v11];

  if (v9 != v11)
  {
    id v13 = [(TPSMainViewController *)self collectionListViewController];
    id v14 = [v13 viewModel];

    v15 = [v14 checklistViewModel];
    [v15 setCurrentDisplayTips:0];
    unsigned int v16 = [(TPSMainViewController *)self tipsByCollectionViewController];
    [v16 setPendingReload:1];
  }
}

- (TPSTipsByCollectionViewController)tipsByCollectionViewController
{
  return self->_tipsByCollectionViewController;
}

- (id)childViewControllerForStatusBarStyle
{
  if (+[TPSCommonDefines isPhoneUI])
  {
    unint64_t v3 = [(TPSMainViewController *)self splitViewController];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

- (_TtC4Tips22TPSSplitViewController)splitViewController
{
  return self->_splitViewController;
}

- (int64_t)currentDisplayMode
{
  return self->_currentDisplayMode;
}

- (BOOL)canDisplayColumn:(int64_t)a3
{
  uint64_t v5 = [(TPSMainViewController *)self appController];
  unsigned int v6 = [v5 viewNavigationCollapsed];

  return !v6 || [(TPSMainViewController *)self currentCollapsedDisplayColumn] != a3;
}

- (TPSUIAppController)appController
{
  return self->_appController;
}

- (int64_t)currentCollapsedDisplayColumn
{
  return self->_currentCollapsedDisplayColumn;
}

- (void)setupSplitView
{
  [(TPSMainViewController *)self updateViewCollapsed:+[TPSCommonDefines isPhoneUI]];
  long long v24 = [[_TtC4Tips22TPSSplitViewController alloc] initWithStyle:2];
  [(TPSSplitViewController *)v24 setDelegate:self];
  [(TPSSplitViewController *)v24 setPreferredSplitBehavior:0];
  unint64_t v3 = [(TPSMainViewController *)self collectionListViewController];
  [(TPSSplitViewController *)v24 setViewController:v3 forColumn:0];

  uint64_t v4 = [(TPSMainViewController *)self tipsByCollectionViewController];
  [(TPSSplitViewController *)v24 setViewController:v4 forColumn:2];

  uint64_t v5 = [(TPSMainViewController *)self tipListViewController];
  [(TPSSplitViewController *)v24 setViewController:v5 forColumn:1];

  [(TPSMainViewController *)self setSplitViewController:v24];
  unsigned int v6 = [(TPSSplitViewController *)v24 view];
  [(TPSMainViewController *)self addChildViewController:v24];
  unsigned int v7 = [(TPSMainViewController *)self view];
  [v7 addSubview:v6];

  [v6 setHidden:1];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v8 = [v6 leadingAnchor];
  unsigned int v9 = [(TPSMainViewController *)self view];
  char v10 = [v9 leadingAnchor];
  uint64_t v11 = [v8 constraintEqualToAnchor:v10];
  [v11 setActive:1];

  id v12 = [v6 trailingAnchor];
  id v13 = [(TPSMainViewController *)self view];
  id v14 = [v13 trailingAnchor];
  v15 = [v12 constraintEqualToAnchor:v14];
  [v15 setActive:1];

  unsigned int v16 = [v6 topAnchor];
  objc_super v17 = [(TPSMainViewController *)self view];
  id v18 = [v17 topAnchor];
  id v19 = [v16 constraintEqualToAnchor:v18];
  [v19 setActive:1];

  id v20 = [v6 bottomAnchor];
  id v21 = [(TPSMainViewController *)self view];
  v22 = [v21 bottomAnchor];
  id v23 = [v20 constraintEqualToAnchor:v22];
  [v23 setActive:1];

  [(TPSSplitViewController *)v24 didMoveToParentViewController:self];
}

- (TPSMainViewController)init
{
  v16.receiver = self;
  v16.super_class = (Class)TPSMainViewController;
  v2 = [(TPSViewController *)&v16 init];
  unint64_t v3 = v2;
  if (v2)
  {
    v2->_currentCollapsedDisplayColumn = 0;
    uint64_t v4 = +[TPSURLSessionHandler sharedInstance];
    uint64_t v5 = +[TPSURLSessionManager defaultManager];
    [v5 setDelegate:v4];

    unsigned int v6 = +[TPSURLSessionManager defaultManager];
    [v6 setDefaultSessionDelegate:v4];

    if (+[TPSCommonDefines isInternalDevice])
    {
      unsigned int v7 = +[TPSURLSessionACAuthContext defaultContext];
      id v8 = [objc_alloc((Class)TPSURLSessionACAuthHandler) initWithAuthenticationContext:v7];
      unsigned int v9 = +[TPSURLSessionManager defaultManager];
      [v9 setAuthenticationHandler:v8];
    }
    uint64_t v10 = +[TPSUIAppController sharedInstance];
    appController = v3->_appController;
    v3->_appController = (TPSUIAppController *)v10;

    [(TPSUIAppController *)v3->_appController addDelegate:v3];
    id v12 = +[UIApplication sharedApplication];
    id v13 = [v12 applicationState];

    if (v13 != (id)2)
    {
      +[TPSAnalyticsSessionController trackSession];
      id v14 = +[TPSAnalyticsEventAppLaunched eventWithContentID:0 collectionID:0 correlationID:0 launchType:TPSAnalyticsLaunchTypeSpringboard];
      [v14 log];
    }
  }
  return v3;
}

- (void)updateShouldHoldOffVideo
{
  BOOL v3 = (+[TPSCommonDefines isPhoneUI] & 1) == 0
    && self->_currentDisplayMode == 3;
  id v4 = [(TPSMainViewController *)self tipsByCollectionViewController];
  [v4 setShouldHoldOffVideo:v3];
}

- (void)setTipsByCollectionViewController:(id)a3
{
}

- (void)setTipListViewController:(id)a3
{
}

- (void)setSplitViewController:(id)a3
{
}

- (void)setHasLoaded:(BOOL)a3
{
  self->_hasLoaded = a3;
}

- (void)setCurrentDisplayMode:(int64_t)a3
{
  self->_currentDisplayMode = a3;
}

- (void)setCurrentCollapsedDisplayColumn:(int64_t)a3
{
  self->_currentCollapsedDisplayColumn = a3;
}

- (void)setCollectionListViewController:(id)a3
{
}

- (BOOL)hasLoaded
{
  return self->_hasLoaded;
}

- (void)showCollectionWithIdentifier:(id)a3 launchType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[TPSLogger default];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v42 = v6;
    __int16 v43 = 2112;
    id v44 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "updateLaunchInfoWithIdentifier %@, launch type %@", buf, 0x16u);
  }

  [(TPSMainViewController *)self dismissViewControllerAnimated:1 completion:0];
  unsigned int v9 = [(TPSMainViewController *)self collectionListViewController];
  uint64_t v10 = [v9 navigationController];
  [v10 dismissViewControllerAnimated:0 completion:0];

  uint64_t v11 = [v6 stringByRemovingPercentEncoding];

  v36 = v11;
  id v12 = [v11 componentsSeparatedByString:@"#"];
  id v13 = [v12 firstObject];
  id v14 = 0;
  if ([v12 count] == (id)2)
  {
    id v14 = [v12 lastObject];
  }
  if ([v13 length])
  {
    v15 = [(TPSMainViewController *)self appController];
    [v15 removeNotificationForIdentifier:v13];
  }
  if ([v14 length])
  {
    objc_super v16 = [(TPSMainViewController *)self appController];
    [v16 removeNotificationForIdentifier:v14];
  }
  objc_super v17 = [(TPSMainViewController *)self appController];
  id v18 = [v17 tipForIdentifier:v13 includingCorrelation:1];

  if (v18)
  {
    uint64_t v19 = [v18 identifier];

    id v13 = (void *)v19;
  }
  uint64_t v20 = TPSAnalyticsLaunchTypeNotification;
  unsigned int v21 = [v7 isEqualToString:TPSAnalyticsLaunchTypeNotification];
  if (([v7 isEqualToString:TPSAnalyticsLaunchTypeWidget] & 1) != 0
    || [v7 isEqualToString:v20])
  {
    unsigned int v21 = v18 == 0;
  }
  v22 = [v18 correlationID];
  id v23 = +[TPSAnalyticsEventAppLaunched eventWithContentID:v13 collectionID:v14 correlationID:v22 launchType:v7];

  if (v18)
  {
    [v23 log];
    if (!v21) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  [(TPSMainViewController *)self setPendingAppLaunchEvent:v23];
  if (v21)
  {
LABEL_16:
    long long v24 = [(TPSMainViewController *)self appController];
    [v24 updateContent];
  }
LABEL_17:
  long long v25 = [(TPSMainViewController *)self appController];
  unsigned int v26 = [v25 contentHasLoaded];

  long long v27 = [(TPSMainViewController *)self appController];
  unsigned int v28 = [v27 updatingContent];

  if (v28)
  {
    if (!v26) {
      goto LABEL_25;
    }
    if ([v14 length])
    {
      v29 = [(TPSMainViewController *)self appController];
      id v30 = [v29 collectionForIdentifier:v14];

      if (!v30) {
        goto LABEL_25;
      }
    }
    if ([v13 length])
    {
      pendingShowTipIdentifier = [(TPSMainViewController *)self appController];
      v32 = [pendingShowTipIdentifier tipForIdentifier:v13];
      if (v32)
      {

LABEL_26:
        goto LABEL_27;
      }
      v34 = [(TPSMainViewController *)self appController];
      v35 = [v34 tipForCorrelationIdentifier:v13];

      if (v35) {
        goto LABEL_27;
      }
LABEL_25:
      id v33 = v36;
      pendingShowTipIdentifier = self->_pendingShowTipIdentifier;
      self->_pendingShowTipIdentifier = v33;
      goto LABEL_26;
    }
  }
  else if ((v26 & 1) == 0)
  {
    goto LABEL_25;
  }
LABEL_27:
  if ([v13 length] || objc_msgSend(v14, "length"))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100030310;
    block[3] = &unk_1000B7858;
    id v38 = v13;
    v39 = self;
    id v40 = v14;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  id v8 = [(TPSMainViewController *)self splitViewController];
  unsigned __int8 v9 = [v8 isCollapsed];

  if (v9) {
    goto LABEL_2;
  }
  id v12 = [(TPSMainViewController *)self splitViewController];
  id v13 = [v12 displayMode];

  if ([(TPSMainViewController *)self isCollectionsViewVisible])
  {
    char v10 = 0;
    uint64_t v11 = 0;
    goto LABEL_9;
  }
  if (v13 != (id)3)
  {
    id v14 = [(TPSMainViewController *)self tipListViewController];
    v15 = [v14 viewModel];
    if ([v15 viewCollapsed])
    {
      objc_super v16 = [(TPSMainViewController *)self tipListViewController];
      objc_super v17 = [v16 view];
      id v18 = [v17 window];

      if (v18) {
        goto LABEL_8;
      }
    }
    else
    {
    }
LABEL_2:
    char v10 = 1;
    uint64_t v11 = 2;
    goto LABEL_9;
  }
LABEL_8:
  char v10 = 0;
  uint64_t v11 = 1;
LABEL_9:
  v20.receiver = self;
  v20.super_class = (Class)TPSMainViewController;
  -[TPSMainViewController viewWillTransitionToSize:withTransitionCoordinator:](&v20, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  if ((v10 & 1) == 0)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10003051C;
    v19[3] = &unk_1000B7880;
    v19[4] = self;
    v19[5] = v11;
    [v7 animateAlongsideTransition:v19 completion:0];
  }
}

- (void)appControllerTipViewed:(id)a3 tipIdentifier:(id)a4 collectionIdentifier:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  [(TPSMainViewController *)self updateShortcutItems];
  id v9 = [(TPSMainViewController *)self lastDisplayedContent];
  [v9 setTipId:v8];

  [v9 setCollectionId:v7];
  +[TPSSecureArchivingUtilities archivedDataWithRootObject:v9 forKey:@"TPSAppLastDisplayedContent"];
}

- (void)updateSupplementaryColumnForCollectionID:(id)a3
{
  id v13 = a3;
  id v4 = [(TPSMainViewController *)self splitViewController];
  uint64_t v5 = [v4 viewControllerForColumn:1];

  id v6 = [(TPSMainViewController *)self collectionListViewController];
  id v7 = [v6 viewModel];

  if (+[TPSCommonDefines isChecklistCollectionWithIdentifier:v13])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_7;
    }
    id v8 = [v7 checklistViewModel];
    [v8 reset];
    id v9 = [[TPSChecklistViewController alloc] initWithViewModel:v8];
    [(TPSAppViewController *)v9 setViewCycleDelegate:self];
    char v10 = [(TPSMainViewController *)self splitViewController];
    [v10 setViewController:v9 forColumn:1];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_7;
    }
    id v8 = [(TPSMainViewController *)self splitViewController];
    id v9 = [(TPSMainViewController *)self tipListViewController];
    [v8 setViewController:v9 forColumn:1];
  }

LABEL_7:
  uint64_t v11 = [v7 currentCollectionID];
  unsigned __int8 v12 = [v11 isEqualToString:v13];

  if ((v12 & 1) == 0) {
    [v7 setCurrentCollectionID:v13];
  }
}

- (void)displayCollectionID:(id)a3 tipID:(id)a4
{
}

- (void)displayCollectionID:(id)a3 tipID:(id)a4 preferredColumn:(int64_t)a5
{
  id v26 = a3;
  id v8 = a4;
  [(TPSMainViewController *)self setPendingColumnSwitching:1];
  id v9 = [v26 length];
  id v10 = v9;
  if (a5 == 1 && v9)
  {
    a5 = 1;
  }
  else if (a5 == 2)
  {
    id v11 = [v8 length];
    int64_t v12 = 1;
    if (!v10) {
      int64_t v12 = 2;
    }
    if (v11) {
      a5 = 2;
    }
    else {
      a5 = v12;
    }
  }
  id v13 = [(TPSMainViewController *)self appController];
  id v14 = [v13 tipForIdentifier:v8 includingCorrelation:1];

  if (v14)
  {
    uint64_t v15 = [v14 identifier];

    id v8 = (id)v15;
  }
  objc_super v16 = [(TPSMainViewController *)self tipListViewController];
  objc_super v17 = [v16 viewModel];

  id v18 = [(TPSMainViewController *)self appController];
  uint64_t v19 = [v18 tipsForCollectionIdentifier:v26];

  if (v19) {
    [v17 setTips:v19];
  }
  if (!v26)
  {
    objc_super v20 = [(TPSMainViewController *)self appController];
    id v26 = [v20 collectionIdentifierForTipIdentifier:v8];
  }
  unsigned int v21 = [(TPSMainViewController *)self appController];
  v22 = [v21 collectionForIdentifier:v26];

  id v23 = [v17 collection];
  unsigned __int8 v24 = [v23 isEqual:v22];

  if (v22) {
    [v17 setCollection:v22];
  }
  long long v25 = [(TPSMainViewController *)self tipsByCollectionViewController];
  [v25 updateWithCollectionID:v26 tipID:v8];

  [(TPSMainViewController *)self updateSupplementaryColumnForCollectionID:v26];
  if (a5 == 2 && v22)
  {
    [(TPSMainViewController *)self showTipsView];
  }
  else if (a5 == 1)
  {
    [(TPSMainViewController *)self showTOCView];
  }
  [(TPSMainViewController *)self setPendingColumnSwitching:0];
  if (v10)
  {
    [v17 setUseStandardNavBarBehavior:[v22 isChecklist]];
    if ((v24 & 1) == 0) {
      [v17 setShouldUseDefaultNavBar:0];
    }
  }
}

- (void)displayUserGuideWithIdentifier:(id)a3 topicId:(id)a4 version:(id)a5 platformIndependent:(BOOL)a6 prefersLandingPage:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v15 = [(TPSMainViewController *)self collectionListViewController];
  [v15 dismissSearch];

  objc_super v16 = [(TPSMainViewController *)self tipsByCollectionViewController];
  [v16 dismissSearch];

  objc_super v17 = [(TPSMainViewController *)self appController];
  id v18 = v17;
  if (v12) {
    [v17 userGuideWithIdentifier:v12];
  }
  else {
  uint64_t v19 = [v17 mainUserGuide];
  }

  if (v19)
  {
    uint64_t v20 = [v19 identifier];

    uint64_t v21 = [v19 version];

    a6 = [v19 platformIndependent];
    id v14 = (id)v21;
    id v12 = (id)v20;
  }
  if (!v14) {
    id v14 = HLPHelpViewControllerVersionLatest;
  }
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_100030DCC;
  v45[3] = &unk_1000B78A8;
  id v22 = v13;
  id v46 = v22;
  BOOL v47 = a7;
  id v23 = objc_retainBlock(v45);
  unsigned __int8 v24 = [(TPSMainViewController *)self presentedViewController];
  objc_opt_class();
  int v37 = self;
  if (objc_opt_isKindOfClass())
  {
    long long v25 = [(TPSMainViewController *)self presentedViewController];
    [v25 viewControllers];
    id v26 = v19;
    long long v27 = v23;
    id v28 = v14;
    id v29 = v12;
    id v30 = v22;
    v32 = BOOL v31 = a6;
    id v33 = [v32 firstObject];

    a6 = v31;
    id v22 = v30;
    id v12 = v29;
    id v14 = v28;
    id v23 = v27;
    uint64_t v19 = v26;
  }
  else
  {
    id v33 = 0;
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v34 = (void (*)(void *, id))v23[2];
    id v35 = v33;
    v34(v23, v35);
    v36 = [v19 text];
    [v35 loadBookWithTitle:v36 identifier:v12 topicID:v22 version:v14];
  }
  else
  {
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_100030E40;
    v38[3] = &unk_1000B78D0;
    id v39 = v19;
    id v40 = v12;
    id v41 = v14;
    id v42 = v37;
    __int16 v43 = v23;
    BOOL v44 = a6;
    [(TPSMainViewController *)v37 dismissViewControllerAnimated:1 completion:v38];

    v36 = v39;
  }
}

- (void)handleTipsURL:(id)a3
{
  id v19 = +[NSURLComponents componentsWithString:a3];
  id v4 = [v19 scheme];
  unsigned int v5 = [v4 isEqualToString:@"tips"];

  if (v5)
  {
    id v6 = [v19 path];
    if ([v6 isEqualToString:@"open"])
    {
      id v7 = [v19 queryItems];
      id v8 = [v7 count];

      if ((unint64_t)v8 < 2) {
        goto LABEL_13;
      }
      id v9 = [v19 queryItems];
      id v6 = [v9 firstObject];

      id v10 = [v19 queryItems];
      id v11 = [v10 objectAtIndexedSubscript:1];

      id v12 = [v11 name];
      id v13 = [v11 value];
      id v14 = [v6 name];
      unsigned int v15 = [v14 isEqualToString:@"type"];

      if (v15)
      {
        objc_super v16 = [v6 value];
        if ([v16 isEqualToString:@"shortcut"]
          && [v12 isEqualToString:@"id"])
        {
          id v17 = v13;
          if (([v17 containsString:@"#"] & 1) == 0)
          {
            uint64_t v18 = +[NSString stringWithFormat:@"%@%@", v17, @"#"];

            id v17 = (id)v18;
          }
          [(TPSMainViewController *)self showCollectionWithIdentifier:v17 launchType:TPSAnalyticsLaunchTypeQuickAction];
        }
      }
    }
  }
LABEL_13:
}

- (void)applicationWillTerminate
{
  v2 = [(TPSMainViewController *)self tipsByCollectionViewController];
  [v2 applicationWillTerminate];

  +[TPSAnalyticsEventAppLaunched appSessionEndedWithType:TPSAnalyticsLaunchTypeTerminated];
  +[TPSAnalyticsSessionController endSession];
  id v3 = +[TPSAnalyticsChecklistSessionController sharedInstance];
  [v3 stopSession];
}

- (void)applicationWillEnterForeground
{
  id v3 = +[TPSJSONCacheController sharedInstance];
  [v3 reloadDataCache];

  id v4 = +[TPSAssetCacheController sharedInstance];
  [v4 reloadDataCache];

  [(TPSMainViewController *)self updateAppInBackground:0];
  [(TPSUIAppController *)self->_appController reloadAppGroupDefaults];
  [(TPSMainViewController *)self logAnalyticsEventForAppForeground];
  +[TPSAnalyticsSessionController trackSession];
  unsigned int v5 = +[TPSAnalyticsChecklistSessionController sharedInstance];
  [v5 continueSession];

  [(TPSMainViewController *)self resyncTipList];
}

- (void)applicationDidEnterBackground
{
  id v3 = +[TPSJSONCacheController sharedInstance];
  [v3 syncCacheImmediately];

  id v4 = +[TPSAssetCacheController sharedInstance];
  [v4 syncCacheImmediately];

  unsigned int v5 = +[TPSCommonDefines sharedInstance];
  id v6 = [v5 appBundleIDMap];
  [v6 removeAllObjects];

  +[TPSAnalyticsEventAppLaunched appSessionEndedWithType:TPSAnalyticsLaunchTypeBackground];
  [(TPSMainViewController *)self updateAppInBackground:1];
  [(TPSMainViewController *)self setPendingShowTipIdentifier:0];

  [(TPSMainViewController *)self setPendingOpenUniversalURL:0];
}

- (void)resyncTipList
{
  id v3 = [(TPSMainViewController *)self appController];
  if ([v3 viewNavigationCollapsed])
  {
    id v4 = [(TPSMainViewController *)self tipsByCollectionViewController];
    unsigned int v5 = [v4 view];
    id v6 = [v5 window];

    if (!v6) {
      goto LABEL_5;
    }
    id v3 = [(TPSMainViewController *)self tipsByCollectionViewController];
    [v3 continueVideoForCurrentTip];
  }

LABEL_5:
  appController = self->_appController;

  [(TPSUIAppController *)appController updateContent];
}

- (BOOL)isCollectionsViewVisible
{
  id v3 = [(TPSMainViewController *)self splitViewController];
  if ([v3 displayMode] == (id)4)
  {
    BOOL v4 = 1;
LABEL_11:

    return v4;
  }
  unsigned int v5 = [(TPSMainViewController *)self splitViewController];
  if ([v5 displayMode] == (id)5)
  {
    BOOL v4 = 1;
LABEL_10:

    goto LABEL_11;
  }
  id v6 = [(TPSMainViewController *)self splitViewController];
  id v7 = [v6 displayMode];

  if (v7 != (id)6)
  {
    id v3 = [(TPSMainViewController *)self collectionListViewController];
    unsigned int v5 = [v3 viewModel];
    if ([v5 viewCollapsed])
    {
      id v8 = [(TPSMainViewController *)self collectionListViewController];
      id v9 = [v8 view];
      id v10 = [v9 window];
      BOOL v4 = v10 != 0;
    }
    else
    {
      BOOL v4 = 0;
    }
    goto LABEL_10;
  }
  return 1;
}

- (void)showTOCView
{
  if ([(TPSMainViewController *)self canDisplayColumn:1])
  {
    id v3 = [(TPSMainViewController *)self splitViewController];
    [v3 hideColumn:0];

    id v4 = [(TPSMainViewController *)self splitViewController];
    [v4 showColumn:1];
  }
}

- (void)showTipsView
{
  if ([(TPSMainViewController *)self canDisplayColumn:2])
  {
    id v3 = [(TPSMainViewController *)self splitViewController];
    [v3 showColumn:2];
  }
}

- (void)showTipWithID:(id)a3 launchType:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ([v9 length])
  {
    [(TPSMainViewController *)self showCollectionWithIdentifier:v9 launchType:v6];
  }
  else
  {
    id v7 = +[TPSAnalyticsEventAppLaunched eventWithContentID:0 collectionID:0 correlationID:0 launchType:v6];
    [v7 log];

    id v8 = [(TPSMainViewController *)self collectionListViewController];
    [v8 analyticsIncreaseCountViewForNilTipIDWithLaunchType:v6];
  }
}

- (BOOL)openURL:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = +[TPSLogger default];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v37 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "open URL: %@", buf, 0xCu);
  }

  id v7 = [objc_alloc((Class)NSURLComponents) initWithURL:v5 resolvingAgainstBaseURL:0];
  id v8 = [v7 scheme];
  unsigned int v9 = [v8 isEqualToString:TPSCommonDefinesURLSchemeKey];

  BOOL v10 = 0;
  if (v9)
  {
    id v11 = [v7 host];
    unsigned int v12 = [v11 isEqualToString:TPSCommonDefinesURLSchemeParameterPathTypeOpen];

    if (v12)
    {
      id v13 = [v7 queryItems];
      id v34 = 0;
      id v35 = 0;
      id v33 = 0;
      +[TPSDocument getValuesFromOpenURLSchemeQueryItems:v13 tipIdentifier:&v35 collectionIdentifier:&v34 referrer:&v33];
      id v14 = (__CFString *)v35;
      id v15 = v34;
      id v16 = v33;

      if (v14 && [v15 isEqualToString:v14])
      {

        id v14 = &stru_1000B98B0;
      }
      if (v14) {
        id v17 = v14;
      }
      else {
        id v17 = &stru_1000B98B0;
      }
      uint64_t v18 = v17;
      id v19 = v18;
      if (v15)
      {
        uint64_t v20 = [(__CFString *)v18 stringByAppendingFormat:@"%@%@", @"#", v15];

        id v19 = (void *)v20;
      }
      [(TPSMainViewController *)self showTipWithID:v19 launchType:v16];
      if ([v16 isEqualToString:TPSAnalyticsLaunchTypeNotification]) {
        [(TipListViewController *)self->_tipListViewController setPreferredViewMethod:v16];
      }

      BOOL v10 = 1;
    }
    else
    {
      uint64_t v21 = [v7 host];
      unsigned int v22 = [v21 isEqualToString:TPSTipURLSchemeParameterPathTypeSearch];

      if (v22)
      {
        id v23 = [v7 queryItems];
        [v23 na_firstObjectPassingTest:&stru_1000B7960];
        id v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

        id v15 = [(__CFString *)v14 value];
        id v16 = +[TPSAppSearchQuery queryWithSearchTerm:v15 origin:2];
        BOOL v10 = [(TPSMainViewController *)self handleSearchWithSearchQuery:v16];
      }
      else
      {
        unsigned __int8 v24 = [v7 host];
        unsigned int v25 = [v24 isEqualToString:TPSCommonDefinesURLSchemeTypeUserGuide];

        if (!v25)
        {
          BOOL v10 = 0;
          goto LABEL_23;
        }
        id v14 = +[TPSUserGuide getUserGuideFromURL:v5];
        id v26 = [(__CFString *)v14 referrer];
        id v27 = [v26 length];

        if (v27)
        {
          id v28 = [(__CFString *)v14 topicIdentifier];
          id v29 = [(__CFString *)v14 referrer];
          id v30 = +[TPSAnalyticsEventAppLaunched eventWithContentID:v28 collectionID:0 correlationID:0 launchType:v29];
          [v30 log];
        }
        id v15 = [(__CFString *)v14 identifier];
        id v16 = [(__CFString *)v14 topicIdentifier];
        BOOL v31 = [(__CFString *)v14 version];
        [(TPSMainViewController *)self displayUserGuideWithIdentifier:v15 topicId:v16 version:v31 platformIndependent:1 prefersLandingPage:1];

        BOOL v10 = 0;
      }
    }
  }
LABEL_23:

  return v10;
}

- (BOOL)handleUserActivity:(id)a3
{
  id v4 = a3;
  id v5 = [v4 activityType];
  unsigned int v6 = [v5 isEqualToString:CSSearchableItemActionType];

  if (v6)
  {
    unsigned __int8 v7 = [(TPSMainViewController *)self handleCoreSpotlightItemActivity:v4];
  }
  else
  {
    id v8 = [v4 activityType];
    unsigned int v9 = [v8 isEqualToString:CSQueryContinuationActionType];

    if (v9)
    {
      unsigned __int8 v7 = [(TPSMainViewController *)self handleContinueCoreSpotlightSearchActivity:v4];
    }
    else
    {
      BOOL v10 = [v4 activityType];
      unsigned int v11 = [v10 isEqualToString:NSUserActivityTypeBrowsingWeb];

      if (!v11)
      {
        BOOL v12 = 0;
        goto LABEL_8;
      }
      unsigned __int8 v7 = [(TPSMainViewController *)self handleUniversalLinkWithUserActivity:v4];
    }
  }
  BOOL v12 = v7;
LABEL_8:

  return v12;
}

- (BOOL)handleContinueCoreSpotlightSearchActivity:(id)a3
{
  id v4 = a3;
  [(TPSMainViewController *)self dismissViewControllerAnimated:1 completion:0];
  id v5 = [v4 userInfo];

  unsigned int v6 = [v5 objectForKeyedSubscript:CSSearchQueryString];

  unsigned __int8 v7 = +[TPSLogger search];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10007FCAC((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
  }

  id v14 = +[TPSAppSearchQuery queryWithSearchTerm:v6 origin:1];
  BOOL v15 = [(TPSMainViewController *)self handleSearchWithSearchQuery:v14];

  return v15;
}

- (BOOL)handleCoreSpotlightItemActivity:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:CSSearchableItemActivityIdentifier];

  id v6 = [v5 length];
  if (v6)
  {
    unsigned __int8 v7 = +[TPSLogger search];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10007FD18((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);
    }

    id v14 = TPSAnalyticsLaunchTypeSearchResult;
    id v15 = [objc_alloc((Class)TPSUserGuideTopic) initWithSearchableItemUniqueIdentifier:v5];
    id v16 = v15;
    if (v15)
    {
      id v17 = [v15 productId];
      uint64_t v18 = [v16 topicId];
      id v19 = [v16 version];
      uint64_t v20 = +[TPSLogger search];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 138412802;
        unsigned int v25 = v17;
        __int16 v26 = 2112;
        id v27 = v18;
        __int16 v28 = 2112;
        id v29 = v19;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Opening user guide with productId: %@, topicId: %@, version: %@", (uint8_t *)&v24, 0x20u);
      }

      if (v17 && v18) {
        [(TPSMainViewController *)self displayUserGuideWithIdentifier:v17 topicId:v18 version:v19 platformIndependent:1 prefersLandingPage:1];
      }
      uint64_t v21 = +[TPSAnalyticsEventAppLaunched eventWithContentID:0 collectionID:0 correlationID:0 launchType:v14];
      [v21 log];

      unsigned int v22 = [(TPSMainViewController *)self collectionListViewController];
      [v22 analyticsIncreaseCountViewForNilTipIDWithLaunchType:v14];
    }
    else
    {
      [(TPSMainViewController *)self dismissViewControllerAnimated:1 completion:0];
      [(TPSMainViewController *)self showTipWithID:v5 launchType:v14];
    }
  }
  return v6 != 0;
}

- (BOOL)handleSearchWithSearchQuery:(id)a3
{
  id v5 = a3;
  id v6 = [v5 searchTerm];
  id v7 = [v6 length];
  if (v7)
  {
    p_pendingAppSearchQuery = &self->_pendingAppSearchQuery;
    pendingAppSearchQuery = self->_pendingAppSearchQuery;
    self->_pendingAppSearchQuery = 0;

    uint64_t v10 = +[TPSLogger search];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_10007FD84((uint64_t)v6, v10, v11, v12, v13, v14, v15, v16);
    }

    if ([(TPSMainViewController *)self _isAppContentLoaded])
    {
      id v17 = [(TPSMainViewController *)self collectionListViewController];
      unsigned int v18 = [v17 canSearch];

      if (v18)
      {
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_1000321A0;
        v26[3] = &unk_1000B7670;
        v26[4] = self;
        id v27 = v5;
        +[UIView performWithoutAnimation:v26];
        id v19 = v27;
LABEL_12:

        goto LABEL_13;
      }
      uint64_t v21 = [(TPSMainViewController *)self tipsByCollectionViewController];
      unsigned int v22 = [v21 canSearch];

      if (v22)
      {
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_100032238;
        v24[3] = &unk_1000B7670;
        v24[4] = self;
        id v25 = v5;
        +[UIView performWithoutAnimation:v24];
        id v19 = v25;
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v20 = +[TPSLogger search];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Content not yet fetched, save it for later", buf, 2u);
      }

      objc_storeStrong((id *)p_pendingAppSearchQuery, a3);
    }
  }
LABEL_13:

  return v7 != 0;
}

- (BOOL)_isAppContentLoaded
{
  id v3 = [(TPSMainViewController *)self appController];
  if ([v3 updatingContent])
  {
    unsigned __int8 v4 = 0;
  }
  else
  {
    id v5 = [(TPSMainViewController *)self appController];
    unsigned __int8 v4 = [v5 contentHasLoaded];
  }
  return v4;
}

- (BOOL)handleUniversalLinkWithUserActivity:(id)a3
{
  id v4 = a3;
  [(TPSMainViewController *)self dismissViewControllerAnimated:1 completion:0];
  id v5 = [v4 webpageURL];
  if (!v5)
  {
    LOBYTE(v9) = 0;
    goto LABEL_43;
  }
  id v6 = +[TPSLogger default];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v55 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "open URL: %@", buf, 0xCu);
  }

  id v7 = +[NSURLComponents componentsWithURL:v5 resolvingAgainstBaseURL:1];
  uint64_t v8 = [v7 host];
  unsigned int v9 = [v8 isEqualToString:@"tips.apple.com"];

  if (!v9) {
    goto LABEL_42;
  }
  id v10 = TPSAnalyticsLaunchTypeUniversalLink;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v11 = [v7 queryItems];
  id v12 = [v11 countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (!v12)
  {

    goto LABEL_35;
  }
  char v41 = v9;
  BOOL v47 = self;
  v48 = 0;
  id v42 = v7;
  __int16 v43 = v5;
  id v44 = v4;
  uint64_t v13 = 0;
  uint64_t v14 = *(void *)v50;
  uint64_t v15 = TPSDocumentURLSchemeParameterReferrerKey;
  v45 = (void *)TPSAnalyticsLaunchTypeSharedTipLocal;
  id v46 = v11;
  while (2)
  {
    uint64_t v16 = 0;
    do
    {
      if (*(void *)v50 != v14) {
        objc_enumerationMutation(v11);
      }
      id v17 = *(void **)(*((void *)&v49 + 1) + 8 * (void)v16);
      unsigned int v18 = [v17 name];
      unsigned int v19 = [v18 isEqualToString:v15];

      if (v19)
      {
        uint64_t v20 = [v17 value];
        if ([v20 length])
        {
          uint64_t v21 = [v17 value];

          +[TPSAnalyticsEventContentViewed setAppReferrer:v20];
          id v10 = (id)v21;
        }
        goto LABEL_16;
      }
      unsigned int v22 = [v17 name];
      unsigned int v23 = [v22 isEqualToString:@"category"];

      if (v23)
      {
        int v24 = [v17 value];

        if ([v24 length])
        {
          +[NSString stringWithFormat:@"%@%@", @"#", v24];
          uint64_t v20 = v48;
          v48 = uint64_t v13 = v24;
LABEL_16:

          goto LABEL_17;
        }
        uint64_t v13 = v24;
      }
      else
      {
        id v25 = [v17 name];
        unsigned int v26 = [v25 isEqualToString:@"share"];

        if (v26
          && +[TPSFeatureFlags allowsTipsSharing])
        {
          uint64_t v20 = [v17 value];
          if ([v20 length])
          {
            id v27 = v13;
            __int16 v28 = [(TPSMainViewController *)v47 appController];
            id v29 = [v28 tipForVariantIdentifier:v20];

            if (!v29)
            {
              if ([(TPSMainViewController *)v47 _isAppContentLoaded]) {
                [(TPSMainViewController *)v47 showModalTipWithVariantID:v20];
              }
              else {
                [(TPSMainViewController *)v47 setPendingSharedTipVariantID:v20];
              }
              id v5 = v43;
              id v4 = v44;
              id v7 = v42;

              LOBYTE(v9) = 1;
              id v34 = v46;
              id v35 = v48;
              goto LABEL_41;
            }
            id v30 = [(TPSMainViewController *)v47 appController];
            [v30 logSharedTipDisplayed:v29 isEligible:1];

            uint64_t v31 = [v29 identifier];

            id v32 = v45;
            id v10 = v32;
            v48 = (void *)v31;
            uint64_t v13 = v27;
            uint64_t v11 = v46;
          }
          goto LABEL_16;
        }
      }
LABEL_17:
      uint64_t v16 = (char *)v16 + 1;
    }
    while (v12 != v16);
    id v33 = [v11 countByEnumeratingWithState:&v49 objects:v53 count:16];
    id v12 = v33;
    if (v33) {
      continue;
    }
    break;
  }
  id v12 = v13;

  if (v48)
  {
    id v34 = v48;
    id v5 = v43;
    id v4 = v44;
    id v7 = v42;
    self = v47;
    LOBYTE(v9) = v41;
    goto LABEL_38;
  }
  id v5 = v43;
  id v4 = v44;
  id v7 = v42;
  self = v47;
  LOBYTE(v9) = v41;
LABEL_35:
  v36 = [v7 path];
  id v37 = [v36 componentsSeparatedByString:@"/"];

  if ([v37 count] != (id)6)
  {

    goto LABEL_40;
  }
  id v38 = [v37 lastObject];

  id v39 = v38;
  if (!v39)
  {
LABEL_40:
    id v27 = v12;
    id v34 = +[TPSAnalyticsEventAppLaunched eventWithContentID:0 collectionID:v12 correlationID:0 launchType:v10];
    [v34 log];
    id v35 = 0;
    goto LABEL_41;
  }
  id v34 = v39;
LABEL_38:
  [(TPSMainViewController *)self setPendingOpenUniversalURL:v5];
  [(TPSMainViewController *)self setPendingShowTipIdentifier:v34];
  [(TPSMainViewController *)self showCollectionWithIdentifier:v34 launchType:v10];
  id v35 = v34;
  id v27 = v12;
LABEL_41:

LABEL_42:
LABEL_43:

  return v9;
}

- (void)updateAppInBackground:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(TPSMainViewController *)self appController];
  [v5 setAppInBackground:v3];

  id v6 = [(TPSMainViewController *)self collectionListViewController];
  id v7 = [v6 viewModel];
  [v7 setAppInBackground:v3];

  id v9 = [(TPSMainViewController *)self tipListViewController];
  uint64_t v8 = [v9 viewModel];
  [v8 setAppInBackground:v3];
}

- (void)logAnalyticsEventForAppForeground
{
  BOOL v3 = [(TPSMainViewController *)self tipsByCollectionViewController];
  id v4 = [(TPSMainViewController *)self tipsByCollectionViewController];
  id v5 = [v4 view];
  id v6 = [v5 window];

  if (v6)
  {
    id v7 = [v3 currentTip];
    id v17 = [v7 identifier];

    uint64_t v8 = [v3 collectionID];
    id v9 = [v3 currentTip];
    id v10 = [v9 correlationID];
LABEL_5:

    +[TPSAnalyticsEventAppLaunched eventWithContentID:v17 collectionID:v8 correlationID:v10 launchType:TPSAnalyticsLaunchTypeForeground];
    goto LABEL_6;
  }
  uint64_t v11 = [(TPSMainViewController *)self tipListViewController];
  id v12 = [v11 view];
  uint64_t v13 = [v12 window];

  if (v13)
  {
    id v9 = [(TPSMainViewController *)self tipListViewController];
    uint64_t v14 = [v9 viewModel];
    uint64_t v15 = [v14 collection];
    uint64_t v8 = [v15 identifier];

    id v10 = 0;
    id v17 = 0;
    goto LABEL_5;
  }
  uint64_t v8 = 0;
  id v10 = 0;
  id v17 = 0;
  +[TPSAnalyticsEventAppLaunched eventWithContentID:0 collectionID:0 correlationID:0 launchType:TPSAnalyticsLaunchTypeForeground];
  uint64_t v16 = LABEL_6:;
  [v16 log];
}

- (void)logAnalyticsEventForChecklistSession
{
  id v2 = +[TPSAnalyticsChecklistSessionController sharedInstance];
  if ([v2 hasActiveSession]) {
    [v2 stopSession];
  }
}

- (BOOL)_splitViewController:(id)a3 allowInteractivePresentationGesture:(id)a4 inContentsOfColumn:(int64_t)a5
{
  return 1;
}

- (id)tipsByCollectionViewController:(id)a3 tipsForCollectionID:(id)a4
{
  if (+[TPSCommonDefines isChecklistCollectionWithIdentifier:a4])
  {
    id v5 = [(TPSMainViewController *)self collectionListViewController];
    id v6 = [v5 viewModel];

    id v7 = [v6 checklistViewModel];
    [v7 updateTips];
    uint64_t v8 = [v7 currentDisplayTips];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)tipsViewController:(id)a3 loadMainUserGuideWithIdentifier:(id)a4 topicId:(id)a5
{
}

- (void)tipsViewController:(id)a3 showSharedTipWithTipIdentifier:(id)a4
{
}

- (void)tipsViewControllerCurrentTipUpdated:(id)a3
{
  id v16 = a3;
  id v4 = [(TPSMainViewController *)self tipsByCollectionViewController];

  id v5 = v16;
  if (v4 == v16)
  {
    id v6 = [v16 currentTip];
    id v7 = [v16 collectionID];
    unsigned int v8 = +[TPSCommonDefines isChecklistCollectionWithIdentifier:v7];

    if (v8)
    {
      id v9 = [(TPSMainViewController *)self collectionListViewController];
      id v10 = [v9 viewModel];

      uint64_t v11 = [v10 checklistViewModel];
      id v12 = [v6 identifier];
      if (v12)
      {
        [v11 setSelectedTipIdentifier:v12];
      }
      else
      {
        uint64_t v14 = [v11 firstTip];
        uint64_t v15 = [v14 identifier];
        [v11 setSelectedTipIdentifier:v15];
      }
    }
    else
    {
      uint64_t v13 = [(TPSMainViewController *)self tipListViewController];
      id v10 = [v13 viewModel];

      [v10 setCurrentTip:v6];
    }

    id v5 = v16;
  }
}

- (void)tipsViewControllerContentUpdated:(id)a3
{
  id v21 = a3;
  id v4 = [(TPSMainViewController *)self tipsByCollectionViewController];

  id v5 = v21;
  if (v4 == v21)
  {
    id v6 = [v21 collectionID];
    id v7 = [(TPSMainViewController *)self tipListViewController];
    unsigned int v8 = [v7 viewModel];

    id v9 = [(TPSMainViewController *)self appController];
    id v10 = [v9 collectionForIdentifier:v6];

    uint64_t v11 = [v8 collection];
    unsigned __int8 v12 = [v10 isEqual:v11];

    if ((v12 & 1) == 0) {
      [v8 setCollection:v10];
    }
    uint64_t v13 = [v21 tips];
    if ([v13 count])
    {
      uint64_t v14 = [v21 tips];
    }
    else
    {
      uint64_t v14 = &__NSArray0__struct;
    }

    [v8 setTips:v14];
    uint64_t v15 = [v8 currentTip];
    unsigned __int8 v16 = [v14 containsObject:v15];

    if ((v16 & 1) == 0)
    {
      id v17 = [v14 firstObject];
      unsigned int v18 = [(TPSMainViewController *)self appController];
      unsigned __int8 v19 = [v18 viewNavigationCollapsed];

      if ((v19 & 1) == 0)
      {
        uint64_t v20 = [v17 identifier];
        [v8 setSelectedTipIdentifier:v20];
      }
      [v8 setCurrentTip:v17];
    }
    id v5 = v21;
  }
}

- (BOOL)tipsViewControllerShouldShowSearch:(id)a3
{
  id v4 = a3;
  if (+[TPSCommonDefines isPhoneUI])
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    id v6 = [(TPSMainViewController *)self appController];
    if ([v6 viewNavigationCollapsed]) {
      LOBYTE(v5) = 0;
    }
    else {
      unsigned int v5 = [v4 isSharedVariant] ^ 1;
    }
  }
  return v5;
}

- (BOOL)tipsViewControllerShouldStartVideo:(id)a3
{
  id v4 = a3;
  id v5 = [(TPSMainViewController *)self tipsByCollectionViewController];

  if (v5 == v4) {
    return ![(TPSMainViewController *)self userGuideDisplayed];
  }
  else {
    return 1;
  }
}

- (void)helpViewControllerDoneButtonTapped:(id)a3
{
  [(TPSMainViewController *)self dismissViewControllerAnimated:1 completion:0];
  [(TPSMainViewController *)self setUserGuideDisplayed:0];
  id v4 = [(TPSMainViewController *)self tipsByCollectionViewController];
  [v4 continueVideoForCurrentTip];
}

- (void)helpViewControllerSearchUsed:(id)a3
{
  id v3 = +[TPSAnalyticsEventHLPSearchUsed event];
  [v3 log];
}

- (void)helpViewControllerTOCUsed:(id)a3
{
  id v3 = +[TPSAnalyticsEventHLPTocUsed event];
  [v3 log];
}

- (void)helpViewControllerContentViewed:(id)a3 topicID:(id)a4 topicTitle:(id)a5 source:(id)a6 interfaceStyle:(int64_t)a7 fromTopicID:(id)a8 externalURLString:(id)a9
{
  id v9 = &TPSConstellationContentUtilitiesAttributeLight;
  if (a7 != 1) {
    id v9 = &TPSConstellationContentUtilitiesAttributeDark;
  }
  id v10 = +[TPSAnalyticsEventHLPContentViewed eventWithTopicID:a4 topicTitle:a5 source:a6 interfaceStyle:*v9 fromTopicID:a8 externalURLString:a9];
  [v10 log];
}

- (void)setAppController:(id)a3
{
}

- (BOOL)pendingColumnSwitching
{
  return self->_pendingColumnSwitching;
}

- (void)setPendingColumnSwitching:(BOOL)a3
{
  self->_pendingColumnSwitching = a3;
}

- (BOOL)userGuideDisplayed
{
  return self->_userGuideDisplayed;
}

- (void)setUserGuideDisplayed:(BOOL)a3
{
  self->_userGuideDisplayed = a3;
}

- (NSURL)pendingOpenUniversalURL
{
  return self->_pendingOpenUniversalURL;
}

- (void)setPendingOpenUniversalURL:(id)a3
{
}

- (NSString)pendingShowTipIdentifier
{
  return self->_pendingShowTipIdentifier;
}

- (void)setPendingShowTipIdentifier:(id)a3
{
}

- (TPSAppSearchQuery)pendingAppSearchQuery
{
  return self->_pendingAppSearchQuery;
}

- (void)setPendingAppSearchQuery:(id)a3
{
}

- (TPSAnalyticsEventAppLaunched)pendingAppLaunchEvent
{
  return self->_pendingAppLaunchEvent;
}

- (void)setPendingAppLaunchEvent:(id)a3
{
}

- (NSString)pendingSharedTipVariantID
{
  return self->_pendingSharedTipVariantID;
}

- (void)setPendingSharedTipVariantID:(id)a3
{
}

- (void)setLastDisplayedContent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDisplayedContent, 0);
  objc_storeStrong((id *)&self->_splitViewController, 0);
  objc_storeStrong((id *)&self->_pendingSharedTipVariantID, 0);
  objc_storeStrong((id *)&self->_pendingAppLaunchEvent, 0);
  objc_storeStrong((id *)&self->_pendingAppSearchQuery, 0);
  objc_storeStrong((id *)&self->_pendingShowTipIdentifier, 0);
  objc_storeStrong((id *)&self->_pendingOpenUniversalURL, 0);
  objc_storeStrong((id *)&self->_tipsByCollectionViewController, 0);
  objc_storeStrong((id *)&self->_collectionListViewController, 0);
  objc_storeStrong((id *)&self->_tipListViewController, 0);

  objc_storeStrong((id *)&self->_appController, 0);
}

- (void)tipsViewController:(id)a3 didSelectSearchResult:(id)a4
{
  if (a4)
  {
    id v6 = a3;
    id v7 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    id v8 = a3;
    id v9 = self;
  }
  sub_100040F10((uint64_t)v10);

  sub_1000143B4((uint64_t)v10, &qword_1000C8A40);
}

- (void)showModalTipWithVariantID:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  id v7 = self;
  id v8 = [(TPSMainViewController *)v7 appController];
  NSString v9 = String._bridgeToObjectiveC()();
  id v10 = (void *)swift_allocObject();
  _OWORD v10[2] = v4;
  v10[3] = v6;
  v10[4] = v7;
  v13[4] = sub_100056114;
  v13[5] = v10;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_100055F00;
  v13[3] = &unk_1000B88E0;
  uint64_t v11 = _Block_copy(v13);
  unsigned __int8 v12 = v7;
  swift_bridgeObjectRetain();
  swift_release();
  [(TPSUIAppController *)v8 contentForVariant:v9 completionHandler:v11];
  _Block_release(v11);

  swift_bridgeObjectRelease();
}

@end