@interface TPSTipsViewController
- (BOOL)allowBookmarks;
- (BOOL)allowPaging;
- (BOOL)canSearch;
- (BOOL)eligibleToPlayVideo;
- (BOOL)isSearchViewControllerPresented;
- (BOOL)isSharedVariant;
- (BOOL)presentingShareSheet;
- (BOOL)scrollingTipContent;
- (BOOL)shouldDisplayNavigationTitle;
- (BOOL)shouldHoldOffVideo;
- (BOOL)tipCollectionViewCellCanDisplayAssets:(id)a3;
- (BOOL)updateBarButtonsForTip;
- (BOOL)updatingSize;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSArray)tips;
- (NSLayoutConstraint)pageControlBottomConstraint;
- (NSString)collectionID;
- (NSString)titleText;
- (TPSAnalyticsEventContentViewed)currentSwipeEvent;
- (TPSDeferredAction)scrolledDeferredAction;
- (TPSKVOManager)KVOManager;
- (TPSPageControl)pageControl;
- (TPSSavedTipsManager)savedTipsManager;
- (TPSSearchResultViewModel)searchResultViewModel;
- (TPSSizes)tipSizes;
- (TPSTip)currentTip;
- (TPSTipCellAppearance)cellAppearance;
- (TPSTipsAssetPrefetchingManager)assetPrefetchingManager;
- (TPSTipsViewControllerDelegate)delegate;
- (TryItViewController)tryItViewController;
- (UIBarButtonItem)saveBarButton;
- (UIBarButtonItem)searchBarButton;
- (UIBarButtonItem)shareBarButton;
- (UICollectionView)collectionView;
- (UIColor)contentBackgroundColor;
- (UINavigationController)searchResultsNavigationController;
- (UISearchController)searchController;
- (id)_currentViewMethod;
- (id)activityViewControllerForTip:(id)a3;
- (id)cellForCurrentTip;
- (id)centerCell;
- (id)centerCellIndexPath;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)createSearchController;
- (id)searchBarNavButton;
- (id)tipForTipID:(id)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)_adjustScrollViewPagingDecelerationForSize:(CGSize)a3;
- (void)_delayedIncreaseCountViewForCurrentTip:(id)a3;
- (void)_logTimeSpentBeforeCurrentTip:(id)a3;
- (void)analyticsIncreaseCountViewForCurrentTipDelay:(id)a3;
- (void)applicationDidBecomeActive;
- (void)applicationDidEnterBackground;
- (void)applicationWillTerminate;
- (void)cancelAssetsPrefetch;
- (void)cellContentLoaded:(id)a3;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)commonInit;
- (void)contentLayoutChanged:(id)a3 userInfo:(id)a4;
- (void)continueVideoForCurrentTip;
- (void)createViews;
- (void)dealloc;
- (void)deferredActionPerform:(id)a3;
- (void)dismissPresentedSearchResultsViewController:(BOOL)a3;
- (void)dismissSearch;
- (void)ensureCurrentTipPositionWithViewSize:(CGSize)a3;
- (void)ensureCurrentTipVisible;
- (void)initCellAppearanceWithTrait:(id)a3 size:(CGSize)a4;
- (void)logAppIntent:(id)a3 actionDirection:(id)a4;
- (void)networkStateDidChange:(BOOL)a3;
- (void)pageControlCancelLongPressedForHUD:(id)a3;
- (void)pageControlLongPressedForHUD:(id)a3 withText:(id)a4;
- (void)pageControlPageChanged:(id)a3;
- (void)playVideoIfNeeded;
- (void)prefetchMediaPrefetchDelay;
- (void)presentSearchResultsViewController:(BOOL)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)reconfigureAllCollectionViewItems;
- (void)registerTraitChanges;
- (void)removeInlineMessageLabel;
- (void)resetSearchController;
- (void)safariViewControllerDidFinish:(id)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDecelerating:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)searchBarTextDidBeginEditing:(id)a3;
- (void)searchWithSearchQuery:(id)a3;
- (void)setAllowBookmarks:(BOOL)a3;
- (void)setAllowPaging:(BOOL)a3;
- (void)setCellAppearance:(id)a3;
- (void)setCollectionID:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setContentBackgroundColor:(id)a3;
- (void)setCurrentSwipeEvent:(id)a3;
- (void)setCurrentTip:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsSharedVariant:(BOOL)a3;
- (void)setKVOManager:(id)a3;
- (void)setPageControl:(id)a3;
- (void)setPageControlBottomConstraint:(id)a3;
- (void)setPresentingShareSheet:(BOOL)a3;
- (void)setSaveBarButton:(id)a3;
- (void)setSavedTipsManager:(id)a3;
- (void)setScrolledDeferredAction:(id)a3;
- (void)setScrollingTipContent:(BOOL)a3;
- (void)setSearchBarButton:(id)a3;
- (void)setSearchController:(id)a3;
- (void)setSearchResultViewModel:(id)a3;
- (void)setSearchResultsNavigationController:(id)a3;
- (void)setShareBarButton:(id)a3;
- (void)setShouldDisplayNavigationTitle:(BOOL)a3;
- (void)setShouldHoldOffVideo:(BOOL)a3;
- (void)setTipSizes:(id)a3;
- (void)setTips:(id)a3;
- (void)setTitleText:(id)a3;
- (void)setTryItViewController:(id)a3;
- (void)setUpdatingSize:(BOOL)a3;
- (void)setupSearch;
- (void)setupSearchViewModel;
- (void)shareCurrentTip:(id)a3;
- (void)showInlineLabelWithTitle:(id)a3 message:(id)a4;
- (void)stopVideoForCurrentTip;
- (void)tipCollectionViewCell:(id)a3 linkTappedForURL:(id)a4;
- (void)tipCollectionViewCell:(id)a3 showSafariViewForURL:(id)a4;
- (void)tipCollectionViewCell:(id)a3 showTryItModeForURL:(id)a4;
- (void)tipCollectionViewCell:(id)a3 showUserGuideWithIdentifier:(id)a4 topicId:(id)a5;
- (void)tipCollectionViewCell:(id)a3 showVideoForURL:(id)a4;
- (void)tipCollectionViewCellContentLayoutChanged:(id)a3;
- (void)tipCollectionViewCellHandleTripleTapInternalGesture:(id)a3;
- (void)tipCollectionViewCellSharedTipTapped:(id)a3;
- (void)toggleSavedTip:(id)a3;
- (void)tryItViewControllerDidDismissWithTryItViewController:(id)a3;
- (void)updateBarAppearance;
- (void)updateBarMaterial;
- (void)updateContentBackgroundWithTraitCollection:(id)a3;
- (void)updateNavigationBarButtons;
- (void)updateNavigationTitle:(id)a3;
- (void)updatePageControlToTip:(id)a3;
- (void)updatePagingScrollState;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)updateSearchResultsPresentationIfNeeded;
- (void)updateTipForCell:(id)a3 startVideo:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation TPSTipsViewController

- (void)updateNavigationTitle:(id)a3
{
  v8 = (__CFString *)a3;
  if ([(TPSTipsViewController *)self shouldDisplayNavigationTitle])
  {
    v4 = v8;
    if (v8) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  id v5 = [(__CFString *)v8 length];
  v4 = v8;
  if (!v8 || v5)
  {
LABEL_6:

    v8 = &stru_1000B98B0;
  }
LABEL_7:
  v6 = [(TPSTipsViewController *)self title];
  unsigned __int8 v7 = [v6 isEqualToString:v8];

  if ((v7 & 1) == 0) {
    [(TPSTipsViewController *)self setTitle:v8];
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateCurrentTipUpdated = objc_opt_respondsToSelector() & 1;
    self->_delegateShouldShowSearch = objc_opt_respondsToSelector() & 1;
  }
}

- (void)setShouldDisplayNavigationTitle:(BOOL)a3
{
  if (self->_shouldDisplayNavigationTitle != a3)
  {
    self->_shouldDisplayNavigationTitle = a3;
    if (a3 && (titleText = self->_titleText) != 0) {
      CFStringRef v5 = titleText;
    }
    else {
      CFStringRef v5 = &stru_1000B98B0;
    }
    v6 = (__CFString *)v5;
    [(TPSTipsViewController *)self updateNavigationTitle:v5];
  }
}

- (void)setAllowPaging:(BOOL)a3
{
  if (self->_allowPaging != a3)
  {
    self->_allowPaging = a3;
    [(TPSTipsViewController *)self updatePagingScrollState];
  }
}

- (BOOL)allowPaging
{
  return self->_allowPaging;
}

- (BOOL)shouldDisplayNavigationTitle
{
  return self->_shouldDisplayNavigationTitle;
}

- (void)setShouldHoldOffVideo:(BOOL)a3
{
  if (self->_shouldHoldOffVideo != a3)
  {
    self->_shouldHoldOffVideo = a3;
    if (!a3) {
      [(TPSTipsViewController *)self playVideoIfNeeded];
    }
  }
}

- (TPSTip)currentTip
{
  return self->_currentTip;
}

- (void)commonInit
{
  v3.receiver = self;
  v3.super_class = (Class)TPSTipsViewController;
  [(TPSViewController *)&v3 commonInit];
  self->_allowPaging = 1;
  self->_allowBookmarks = 1;
}

- (void)dealloc
{
  [(TPSTipsViewController *)self cancelAssetsPrefetch];
  objc_super v3 = objc_opt_new();
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_delayedIncreaseCountViewForCurrentTip:" object:v3];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:UIApplicationWillEnterForegroundNotification object:0];

  CFStringRef v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:0];

  v6.receiver = self;
  v6.super_class = (Class)TPSTipsViewController;
  [(TPSViewController *)&v6 dealloc];
}

- (void)viewDidLoad
{
  v21.receiver = self;
  v21.super_class = (Class)TPSTipsViewController;
  [(TPSViewController *)&v21 viewDidLoad];
  [(TPSTipsViewController *)self updateBarAppearance];
  objc_super v3 = (TPSKVOManager *)[objc_alloc((Class)TPSKVOManager) initWithObserver:self];
  KVOManager = self->_KVOManager;
  self->_KVOManager = v3;

  CFStringRef v5 = +[TPSSavedTipsManager sharedInstance];
  savedTipsManager = self->_savedTipsManager;
  self->_savedTipsManager = v5;

  unsigned __int8 v7 = (TPSDeferredAction *)objc_alloc_init((Class)TPSDeferredAction);
  scrolledDeferredAction = self->_scrolledDeferredAction;
  self->_scrolledDeferredAction = v7;

  [(TPSDeferredAction *)self->_scrolledDeferredAction setDelegate:self];
  v9 = (TPSTipsAssetPrefetchingManager *)objc_alloc_init((Class)TPSTipsAssetPrefetchingManager);
  assetPrefetchingManager = self->_assetPrefetchingManager;
  self->_assetPrefetchingManager = v9;

  v11 = +[TPSAppearance defaultLabelColor];
  navigationTitleTextColor = self->_navigationTitleTextColor;
  self->_navigationTitleTextColor = v11;

  v13 = [(TPSTipsViewController *)self navigationItem];
  [v13 setLargeTitleDisplayMode:2];

  self->_currentPagingIndex = 0x7FFFFFFFFFFFFFFFLL;
  v14 = +[NSNotificationCenter defaultCenter];
  [v14 addObserver:self selector:"applicationDidBecomeActive" name:UIApplicationDidBecomeActiveNotification object:0];

  v15 = +[NSNotificationCenter defaultCenter];
  [v15 addObserver:self selector:"applicationDidEnterBackground" name:UIApplicationDidEnterBackgroundNotification object:0];

  v16 = [(TPSTipsViewController *)self view];
  [v16 bounds];
  self->_viewSize.width = v17;
  self->_viewSize.height = v18;

  [(TPSTipsViewController *)self createViews];
  [(TPSTipsViewController *)self setupSearch];
  v19 = [(TPSTipsViewController *)self view];
  v20 = [v19 traitCollection];
  [(TPSTipsViewController *)self updateContentBackgroundWithTraitCollection:v20];

  [(TPSTipsViewController *)self registerTraitChanges];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSTipsViewController;
  [(TPSAppViewController *)&v5 viewWillAppear:a3];
  self->_canIncreaseViewCount = 1;
  v4 = [(TPSTipsViewController *)self currentTip];

  if (v4) {
    [(TPSTipsViewController *)self analyticsIncreaseCountViewForCurrentTipDelay:TPSAnalyticsViewMethodViewAppear];
  }
  [(TPSTipsViewController *)self updateNavigationTitle:self->_titleText];
  [(TPSTipsViewController *)self updateTipForCell:0 startVideo:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TPSTipsViewController;
  [(TPSAppViewController *)&v4 viewDidAppear:a3];
  +[TPSAnalyticsSessionController incrementCollectionsViewedCount];
  [(TPSTipsViewController *)self updateTipForCell:0 startVideo:1];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSTipsViewController;
  [(TPSAppViewController *)&v5 viewWillDisappear:a3];
  self->_canIncreaseViewCount = 0;
  objc_super v4 = objc_opt_new();
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_delayedIncreaseCountViewForCurrentTip:" object:v4];

  [(TPSTipsViewController *)self _logTimeSpentBeforeCurrentTip:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)TPSTipsViewController;
  [(TPSAppViewController *)&v14 viewDidDisappear:a3];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_super v4 = [(UICollectionView *)self->_collectionView visibleCells];
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        [v9 scrubVideoToFirstFrame];
        [v9 stopVideoPlayer];
      }
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)setAllowBookmarks:(BOOL)a3
{
  if (self->_allowBookmarks != a3)
  {
    self->_allowBookmarks = a3;
    [(TPSTipsViewController *)self updateNavigationBarButtons];
  }
}

- (void)setTips:(id)a3
{
  id v5 = (NSArray *)a3;
  if (self->_tips != v5)
  {
    objc_storeStrong((id *)&self->_tips, a3);
    NSUInteger v6 = [(NSArray *)self->_tips count];
    uint64_t v7 = [(TPSTipsViewController *)self pageControl];
    [v7 setNumberOfPages:v6];

    v8 = [(TPSAppViewController *)self appController];
    uint64_t v9 = [v8 assetSizes];
    uint64_t v10 = [(id)v9 tip];

    long long v11 = [(TPSTipsViewController *)self tipSizes];
    LOBYTE(v9) = [v11 isEqual:v10];

    if ((v9 & 1) == 0)
    {
      [(TPSTipsViewController *)self setTipSizes:v10];
      -[TPSTipCellAppearance updateAppearanceWithSize:](self->_cellAppearance, "updateAppearanceWithSize:", self->_viewSize.width, self->_viewSize.height);
    }
    tipsMap = self->_tipsMap;
    v38 = (void *)v10;
    if (tipsMap)
    {
      [(NSMutableDictionary *)tipsMap removeAllObjects];
    }
    else
    {
      long long v13 = (NSMutableDictionary *)[&__NSDictionary0__struct mutableCopy];
      objc_super v14 = self->_tipsMap;
      self->_tipsMap = v13;
    }
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v15 = v5;
    id v16 = [(NSArray *)v15 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v40;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v40 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          objc_super v21 = self->_tipsMap;
          v22 = [v20 identifier];
          [(NSMutableDictionary *)v21 setObject:v20 forKeyedSubscript:v22];
        }
        id v17 = [(NSArray *)v15 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v17);
    }

    [(UICollectionView *)self->_collectionView reloadData];
    v23 = [(TPSTipsViewController *)self currentTip];
    v24 = [v23 identifier];
    v25 = [(TPSTipsViewController *)self tipForTipID:v24];

    if (v25)
    {
      v26 = [(TPSTipsViewController *)self view];
      [v26 bounds];
      -[TPSTipsViewController ensureCurrentTipPositionWithViewSize:](self, "ensureCurrentTipPositionWithViewSize:", v27, v28);

      v29 = v38;
    }
    else
    {
      v30 = [(TPSTipsViewController *)self currentTip];
      uint64_t v31 = [v30 identifier];
      v29 = v38;
      if (v31)
      {
        v32 = (void *)v31;
        v33 = [(TPSTipsViewController *)self presentedViewController];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass) {
          [(TPSTipsViewController *)self dismissViewControllerAnimated:1 completion:0];
        }
      }
      else
      {
      }
      [(TPSTipsViewController *)self setCurrentTip:0];
    }
    [(TPSTipsViewController *)self updatePageControlToTip:0];
    [(TPSTipsViewController *)self updatePagingScrollState];
    [(TPSTipsViewController *)self cancelAssetsPrefetch];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v36 = objc_opt_respondsToSelector();

    if (v36)
    {
      id v37 = objc_loadWeakRetained((id *)&self->_delegate);
      [v37 tipsViewControllerContentUpdated:self];
    }
  }
}

- (void)updatePagingScrollState
{
  unsigned int v4 = [(TPSTipsViewController *)self allowPaging];
  if (v4)
  {
    v2 = [(TPSTipsViewController *)self pageControl];
    BOOL v5 = (uint64_t)[v2 numberOfPages] < 2;
  }
  else
  {
    BOOL v5 = 1;
  }
  NSUInteger v6 = [(TPSTipsViewController *)self pageControl];
  [v6 setHidden:v5];

  if (v4) {
  BOOL v7 = [(TPSTipsViewController *)self allowPaging];
  }
  id v8 = [(TPSTipsViewController *)self collectionView];
  [v8 setScrollEnabled:v7];
}

- (void)updateBarAppearance
{
  id v6 = objc_alloc_init((Class)UINavigationBarAppearance);
  [v6 configureWithDefaultBackground];
  [v6 setShadowImage:0];
  [v6 setShadowColor:0];
  objc_super v3 = [(TPSTipsViewController *)self navigationItem];
  [v3 setStandardAppearance:v6];

  unsigned int v4 = [(TPSTipsViewController *)self navigationItem];
  [v4 _setManualScrollEdgeAppearanceProgress:0.0];

  BOOL v5 = [(TPSTipsViewController *)self navigationItem];
  [v5 _setManualScrollEdgeAppearanceEnabled:1];
}

- (BOOL)updateBarButtonsForTip
{
  objc_super v3 = [(TPSTipsViewController *)self currentTip];
  unsigned int v4 = [v3 identifier];

  if (!v4) {
    return 0;
  }
  BOOL v5 = [(TPSTipsViewController *)self savedTipsManager];
  id v6 = [(TPSTipsViewController *)self currentTip];
  BOOL v7 = [v6 identifier];
  unsigned int v8 = [v5 isSavedWithTipIdentifier:v7];

  if (v8)
  {
    uint64_t v9 = [@"bookmark" stringByAppendingString:@".fill"];
  }
  else
  {
    uint64_t v9 = @"bookmark";
  }
  long long v11 = +[UIImage _systemImageNamed:v9];
  long long v12 = [(TPSTipsViewController *)self saveBarButton];
  long long v13 = [v12 image];
  unsigned __int8 v14 = [v13 isEqual:v11];
  char v10 = v14 ^ 1;

  if ((v14 & 1) == 0)
  {
    v15 = [(TPSTipsViewController *)self saveBarButton];

    if (!v15)
    {
      id v16 = [objc_alloc((Class)UIBarButtonItem) initWithImage:v11 style:0 target:self action:"toggleSavedTip:"];
      [(TPSTipsViewController *)self setSaveBarButton:v16];
    }
    id v17 = [(TPSTipsViewController *)self saveBarButton];
    [v17 setImage:v11];

    uint64_t v18 = +[UIColor systemBlueColor];
    v19 = [(TPSTipsViewController *)self saveBarButton];
    [v19 setTintColor:v18];
  }
  if (+[TPSFeatureFlags allowsTipsSharing])
  {
    v20 = [(TPSTipsViewController *)self shareBarButton];

    if (!v20)
    {
      objc_super v21 = +[UIImage _systemImageNamed:@"square.and.arrow.up"];
      id v22 = [objc_alloc((Class)UIBarButtonItem) initWithImage:v21 style:0 target:self action:"shareCurrentTip:"];
      [(TPSTipsViewController *)self setShareBarButton:v22];

      v23 = +[UIColor systemBlueColor];
      v24 = [(TPSTipsViewController *)self shareBarButton];
      [v24 setTintColor:v23];

      char v10 = 1;
    }
  }

  return v10;
}

- (void)toggleSavedTip:(id)a3
{
  unsigned int v4 = [(TPSTipsViewController *)self savedTipsManager];
  BOOL v5 = [(TPSTipsViewController *)self currentTip];
  id v6 = [v5 correlationID];
  BOOL v7 = [(TPSTipsViewController *)self currentTip];
  unsigned int v8 = [v7 identifier];
  [v4 toggleSavedTipWithCorrelationId:v6 tipIdentifier:v8];

  [(TPSTipsViewController *)self updateBarButtonsForTip];
  uint64_t v9 = [(TPSAppViewController *)self appController];
  [v9 updateSavedTipsContent];

  id v19 = [(TPSTipsViewController *)self currentTip];
  char v10 = [v19 identifier];
  long long v11 = [(TPSTipsViewController *)self savedTipsManager];
  long long v12 = [(TPSTipsViewController *)self currentTip];
  long long v13 = [v12 identifier];
  id v14 = [v11 isSavedWithTipIdentifier:v13];
  v15 = [(TPSTipsViewController *)self currentTip];
  id v16 = [v15 correlationID];
  id v17 = [(TPSTipsViewController *)self collectionID];
  uint64_t v18 = +[TPSAnalyticsEventTipSaved eventWithTipID:v10 saved:v14 correlationID:v16 collectionID:v17];
  [v18 log];
}

- (BOOL)canSearch
{
  v2 = [(TPSTipsViewController *)self searchController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setupSearch
{
  [(TPSTipsViewController *)self setupSearchViewModel];
  [(TPSTipsViewController *)self setDefinesPresentationContext:1];

  [(TPSTipsViewController *)self resetSearchController];
}

- (void)resetSearchController
{
  if (self->_delegateShouldShowSearch
    && ([(TPSTipsViewController *)self delegate],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        unsigned int v4 = [v3 tipsViewControllerShouldShowSearch:self],
        v3,
        v4))
  {
    BOOL v5 = [(TPSTipsViewController *)self searchController];

    if (!v5)
    {
      id v6 = [(TPSTipsViewController *)self createSearchController];
      [(TPSTipsViewController *)self setSearchController:v6];
    }
  }
  else
  {
    [(TPSTipsViewController *)self dismissPresentedSearchResultsViewController:0];
    [(TPSTipsViewController *)self setSearchResultsNavigationController:0];
    BOOL v7 = [(TPSTipsViewController *)self searchController];
    [v7 setActive:0];

    [(TPSTipsViewController *)self setSearchController:0];
  }
  unsigned int v8 = [(TPSTipsViewController *)self searchController];
  uint64_t v9 = [(TPSTipsViewController *)self navigationItem];
  [v9 setSearchController:v8];

  [(TPSTipsViewController *)self updateNavigationBarButtons];
}

- (id)createSearchController
{
  id v3 = [objc_alloc((Class)UISearchController) initWithSearchResultsController:0];
  [v3 setSearchResultsUpdater:self];
  [v3 setObscuresBackgroundDuringPresentation:0];
  [v3 setHidesNavigationBarDuringPresentation:0];
  [v3 setModalPresentationStyle:4];
  unsigned int v4 = [v3 searchBar];
  [v4 setDelegate:self];
  [v4 setAutocorrectionType:1];
  [v4 setAutocapitalizationType:0];

  return v3;
}

- (void)updateSearchResultsPresentationIfNeeded
{
  id v3 = [(TPSTipsViewController *)self searchResultViewModel];
  unsigned int v4 = [v3 hasStartedSearch];

  if (v4)
  {
    [(TPSTipsViewController *)self presentSearchResultsViewController:1];
  }
  else
  {
    [(TPSTipsViewController *)self dismissPresentedSearchResultsViewController:1];
  }
}

- (void)presentSearchResultsViewController:(BOOL)a3
{
  uint64_t v4 = [(TPSTipsViewController *)self searchController];
  if (v4)
  {
    BOOL v5 = (void *)v4;
    unsigned __int8 v6 = [(TPSTipsViewController *)self isSearchViewControllerPresented];

    if ((v6 & 1) == 0)
    {
      BOOL v7 = [(TPSTipsViewController *)self navigationController];
      [v7 dismissViewControllerAnimated:0 completion:0];

      unsigned int v8 = [(TPSTipsViewController *)self searchResultsNavigationController];

      if (!v8)
      {
        uint64_t v9 = [(TPSTipsViewController *)self searchResultViewModel];
        char v10 = +[UIViewController _makeSearchResultsViewControllerWithViewModel:v9];
        [(TPSTipsViewController *)self setSearchResultsNavigationController:v10];

        long long v11 = [(TPSTipsViewController *)self searchResultsNavigationController];
        [v11 setModalPresentationStyle:7];
      }
      long long v12 = [(TPSTipsViewController *)self searchController];
      long long v13 = [v12 searchBar];

      id v14 = [(TPSTipsViewController *)self searchResultsNavigationController];
      v15 = [v14 popoverPresentationController];

      [v15 setPermittedArrowDirections:0];
      [v15 setPopoverLayoutMargins:50.0, 10.0, 10.0, 10.0];
      [v15 setSourceView:v13];
      id v19 = v13;
      id v16 = +[NSArray arrayWithObjects:&v19 count:1];
      [v15 setPassthroughViews:v16];

      [v15 setDelegate:self];
      id v17 = [(TPSTipsViewController *)self navigationController];
      uint64_t v18 = [(TPSTipsViewController *)self searchResultsNavigationController];
      [v17 presentViewController:v18 animated:1 completion:0];
    }
  }
}

- (BOOL)isSearchViewControllerPresented
{
  id v3 = [(TPSTipsViewController *)self navigationController];
  uint64_t v4 = [v3 presentedViewController];

  BOOL v5 = [(TPSTipsViewController *)self searchResultsNavigationController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v7 = [v4 topViewController];

    unsigned int v8 = [(TPSTipsViewController *)self searchResultsNavigationController];
    uint64_t v9 = [v8 topViewController];

    objc_opt_class();
    char v10 = objc_opt_isKindOfClass();

    uint64_t v4 = (void *)v7;
  }
  else
  {
    char v10 = 0;
  }

  return v10 & 1;
}

- (void)dismissPresentedSearchResultsViewController:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(TPSTipsViewController *)self isSearchViewControllerPresented])
  {
    objc_initWeak(&location, self);
    BOOL v5 = [(TPSTipsViewController *)self navigationController];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100028648;
    v6[3] = &unk_1000B7620;
    objc_copyWeak(&v7, &location);
    v6[4] = self;
    [v5 dismissViewControllerAnimated:v3 completion:v6];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)searchWithSearchQuery:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 searchTerm];
  unsigned __int8 v6 = [(TPSTipsViewController *)self searchController];
  id v7 = [v6 searchBar];
  [v7 setText:v5];

  unsigned int v8 = [(TPSTipsViewController *)self searchController];
  uint64_t v9 = [v8 searchBar];
  [v9 becomeFirstResponder];

  id v10 = [(TPSTipsViewController *)self searchResultViewModel];
  [v10 setSearchQuery:v4];
}

- (id)tipForTipID:(id)a3
{
  return [(NSMutableDictionary *)self->_tipsMap objectForKeyedSubscript:a3];
}

- (void)createViews
{
  if (!self->_collectionView)
  {
    BOOL v3 = objc_alloc_init(TPSCollectionViewFlowLayout);
    collectionViewLayout = self->_collectionViewLayout;
    self->_collectionViewLayout = v3;

    [(TPSCollectionViewFlowLayout *)self->_collectionViewLayout setScrollDirection:1];
    [(TPSCollectionViewFlowLayout *)self->_collectionViewLayout setMinimumLineSpacing:0.0];
    BOOL v5 = [objc_alloc((Class)UICollectionView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height, self->_collectionViewLayout];
    collectionView = self->_collectionView;
    self->_collectionView = v5;

    [(UICollectionView *)self->_collectionView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UICollectionView *)self->_collectionView setShowsHorizontalScrollIndicator:0];
    [(UICollectionView *)self->_collectionView setShowsVerticalScrollIndicator:0];
    [(UICollectionView *)self->_collectionView setAlwaysBounceHorizontal:1];
    -[UICollectionView _setInterpageSpacing:](self->_collectionView, "_setInterpageSpacing:", 40.0, 0.0);
    [(UICollectionView *)self->_collectionView setContentInsetAdjustmentBehavior:2];
    [(UICollectionView *)self->_collectionView setPagingEnabled:1];
    -[TPSTipsViewController _adjustScrollViewPagingDecelerationForSize:](self, "_adjustScrollViewPagingDecelerationForSize:", self->_viewSize.width, self->_viewSize.height);
    id v7 = [(TPSTipsViewController *)self view];
    [v7 addSubview:self->_collectionView];

    [(UICollectionView *)self->_collectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:kTPSTipCellIdentifierKey];
    [(UICollectionView *)self->_collectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:kTPSIntroTipCellIdentifierKey];
    [(UICollectionView *)self->_collectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:kTPSOutroTipCellIdentifierKey];
    [(UICollectionView *)self->_collectionView setDelegate:self];
    [(UICollectionView *)self->_collectionView setDataSource:self];
    unsigned int v8 = [(UICollectionView *)self->_collectionView leadingAnchor];
    uint64_t v9 = [(TPSTipsViewController *)self view];
    id v10 = [v9 leadingAnchor];
    long long v11 = [v8 constraintEqualToAnchor:v10];
    [v11 setActive:1];

    long long v12 = [(UICollectionView *)self->_collectionView trailingAnchor];
    long long v13 = [(TPSTipsViewController *)self view];
    id v14 = [v13 trailingAnchor];
    v15 = [v12 constraintEqualToAnchor:v14];
    [v15 setActive:1];

    id v16 = [(UICollectionView *)self->_collectionView topAnchor];
    id v17 = [(TPSTipsViewController *)self view];
    uint64_t v18 = [v17 topAnchor];
    id v19 = [v16 constraintEqualToAnchor:v18];
    [v19 setActive:1];

    v20 = [(UICollectionView *)self->_collectionView bottomAnchor];
    objc_super v21 = [(TPSTipsViewController *)self view];
    id v22 = [v21 bottomAnchor];
    v23 = [v20 constraintEqualToAnchor:v22];
    [v23 setActive:1];

    [(TPSKVOManager *)self->_KVOManager addKVOObject:self->_collectionView forKeyPath:@"contentSize" options:3 context:"contentLayoutChanged:userInfo:"];
    [(TPSKVOManager *)self->_KVOManager addKVOObject:self->_collectionView forKeyPath:@"contentOffset" options:3 context:"contentLayoutChanged:userInfo:"];
  }
  if (!self->_pageControl)
  {
    v24 = objc_alloc_init(TPSPageControl);
    pageControl = self->_pageControl;
    self->_pageControl = v24;

    [(TPSPageControl *)self->_pageControl setHudDelegate:self];
    [(TPSPageControl *)self->_pageControl setTranslatesAutoresizingMaskIntoConstraints:0];
    [(TPSPageControl *)self->_pageControl setBackgroundStyle:0];
    v26 = +[UIColor labelColor];
    [(TPSPageControl *)self->_pageControl setCurrentPageIndicatorTintColor:v26];

    double v27 = +[UIColor systemGray2Color];
    [(TPSPageControl *)self->_pageControl setPageIndicatorTintColor:v27];

    [(TPSPageControl *)self->_pageControl addTarget:self action:"pageControlPageChanged:" forControlEvents:4096];
    double v28 = [(TPSTipsViewController *)self view];
    [v28 addSubview:self->_pageControl];

    v29 = [(TPSPageControl *)self->_pageControl widthAnchor];
    v30 = [(TPSTipsViewController *)self view];
    uint64_t v31 = [v30 widthAnchor];
    v32 = [v29 constraintEqualToAnchor:v31 constant:-20.0];

    LODWORD(v33) = 1144750080;
    [v32 setPriority:v33];
    [v32 setActive:1];
    [(TPSPageControl *)self->_pageControl sizeForNumberOfPages:8];
    double v35 = v34;
    char v36 = [(TPSPageControl *)self->_pageControl widthAnchor];
    id v37 = [v36 constraintLessThanOrEqualToConstant:v35];
    [v37 setActive:1];

    v38 = [(TPSPageControl *)self->_pageControl centerXAnchor];
    long long v39 = [(TPSTipsViewController *)self view];
    long long v40 = [v39 centerXAnchor];
    long long v41 = [v38 constraintEqualToAnchor:v40];
    [v41 setActive:1];

    long long v42 = [(TPSPageControl *)self->_pageControl bottomAnchor];
    v43 = [(TPSTipsViewController *)self view];
    v44 = [v43 bottomAnchor];
    v45 = [v42 constraintEqualToAnchor:v44 constant:0.0];
    pageControlBottomConstraint = self->_pageControlBottomConstraint;
    self->_pageControlBottomConstraint = v45;

    [(NSLayoutConstraint *)self->_pageControlBottomConstraint setActive:1];
  }

  [(TPSTipsViewController *)self updatePagingScrollState];
}

- (void)updateContentBackgroundWithTraitCollection:(id)a3
{
  if ([a3 userInterfaceStyle] == (id)1) {
    +[UIColor whiteColor];
  }
  else {
  id v6 = +[UIColor blackColor];
  }
  id v4 = [(TPSTipsViewController *)self traitCollection];
  [(TPSTipCellAppearance *)self->_cellAppearance setTraitCollection:v4];

  [(UICollectionView *)self->_collectionView setBackgroundColor:v6];
  BOOL v5 = [(TPSTipsViewController *)self view];
  [v5 setBackgroundColor:v6];
}

- (id)cellForCurrentTip
{
  NSUInteger v3 = [(NSArray *)self->_tips indexOfObject:self->_currentTip];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (self->_isSharedVariant)
    {
      id v4 = [(TPSTipsViewController *)self centerCell];
    }
    else
    {
      id v4 = 0;
    }
  }
  else
  {
    BOOL v5 = +[NSIndexPath indexPathForRow:v3 inSection:0];
    id v4 = [(UICollectionView *)self->_collectionView cellForItemAtIndexPath:v5];
  }

  return v4;
}

- (void)updateTipForCell:(id)a3 startVideo:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if ([(UICollectionView *)self->_collectionView isHidden])
  {
LABEL_8:
    id v6 = v7;
    goto LABEL_9;
  }
  id v6 = v7;
  if (v7
    || ([(TPSTipsViewController *)self cellForCurrentTip],
        (id v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v7 = v6;
    [v6 updateImageView];
    [v7 updateContentLabel];
    if (v4
      && [(TPSAppViewController *)self viewWillAppear]
      && ![(TPSTipsViewController *)self shouldHoldOffVideo])
    {
      [v7 playVideo];
    }
    goto LABEL_8;
  }
LABEL_9:
}

- (id)_currentViewMethod
{
  uint64_t v2 = +[TPSAnalyticsEventAppLaunched lastRecordedLaunchType];
  NSUInteger v3 = (void *)v2;
  BOOL v4 = (void *)TPSAnalyticsViewMethodCollectionsList;
  if (v2) {
    BOOL v4 = (void *)v2;
  }
  id v5 = v4;

  return v5;
}

- (void)setCurrentTip:(id)a3
{
  id v5 = (TPSTip *)a3;
  p_currentTip = &self->_currentTip;
  if (self->_currentTip != v5)
  {
    id v7 = +[TPSLogger default];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10007FC14(v5, v7);
    }

    objc_storeStrong((id *)&self->_currentTip, a3);
    if (*p_currentTip)
    {
      [(TPSTipsViewController *)self updateTipForCell:0 startVideo:1];
      unsigned int v8 = [(TPSTip *)*p_currentTip identifier];

      if (v8)
      {
        self->_canIncreaseViewCount = 1;
        uint64_t v9 = [(TPSTipsViewController *)self _currentViewMethod];
        [(TPSTipsViewController *)self analyticsIncreaseCountViewForCurrentTipDelay:v9];
      }
      id v10 = [(TPSTipsViewController *)self centerCell];
      long long v11 = [v10 tip];
      long long v12 = v11;
      if (v11 == *p_currentTip)
      {
        unsigned int v13 = [v10 contentFinishedLoading];

        if (v13) {
          [(TPSTipsViewController *)self cellContentLoaded:v10];
        }
      }
      else
      {
      }
      [(TPSTipsViewController *)self _logTimeSpentBeforeCurrentTip:*p_currentTip];
    }
    [(TPSTipsViewController *)self updatePageControlToTip:v5];
    if (self->_delegateCurrentTipUpdated)
    {
      id v14 = [(TPSTipsViewController *)self delegate];
      [v14 tipsViewControllerCurrentTipUpdated:self];
    }
  }
}

- (void)_adjustScrollViewPagingDecelerationForSize:(CGSize)a3
{
  double width = a3.width;
  id v5 = +[UIScreen mainScreen];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;

  if (v7 >= v9) {
    double v10 = v7;
  }
  else {
    double v10 = v9;
  }
  if (v10 >= width) {
    double v11 = width;
  }
  else {
    double v11 = v10;
  }
  double v12 = (1.0 - (v11 * 0.00000994318182 + 0.966818182)) * -1.22140276 + 1.0;
  collectionView = self->_collectionView;
  id v14 = +[NSNumber numberWithDouble:v11 * -0.000000184659091 + 0.000359090909];
  [(UICollectionView *)collectionView setValue:v14 forKey:@"_pagingSpringPull"];

  v15 = self->_collectionView;
  id v16 = +[NSNumber numberWithDouble:v12];
  [(UICollectionView *)v15 setValue:v16 forKey:@"_pagingFriction"];
}

- (void)analyticsIncreaseCountViewForCurrentTipDelay:(id)a3
{
  id v4 = +[TPSViewSourceProxy proxyWithViewMethod:a3];
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_delayedIncreaseCountViewForCurrentTip:");
  if (self->_canIncreaseViewCount) {
    [(TPSTipsViewController *)self performSelector:"_delayedIncreaseCountViewForCurrentTip:" withObject:v4 afterDelay:kTipsAnalyticsDelayedEventInterval];
  }
}

- (void)_delayedIncreaseCountViewForCurrentTip:(id)a3
{
  id v4 = a3;
  if (self->_currentTip && self->_canIncreaseViewCount)
  {
    id v25 = v4;
    id v5 = [(TPSTipsViewController *)self currentSwipeEvent];

    [(TPSTip *)self->_currentTip identifier];
    if (v5) {
      double v6 = {;
    }
      double v7 = [(TPSTipsViewController *)self currentSwipeEvent];
      [v7 setContentID:v6];

      double v8 = [(TPSTipsViewController *)self collectionID];
      double v9 = [(TPSTipsViewController *)self currentSwipeEvent];
      [v9 setCollectionID:v8];

      double v10 = [(TPSTip *)self->_currentTip correlationID];
      double v11 = [(TPSTipsViewController *)self currentSwipeEvent];
      [v11 setCorrelationID:v10];

      double v12 = [(TPSTip *)self->_currentTip clientConditionID];
      unsigned int v13 = [(TPSTipsViewController *)self currentSwipeEvent];
      [v13 setClientConditionID:v12];

      id v14 = [(TPSTipsViewController *)self currentSwipeEvent];
      [v14 log];

      [(TPSTipsViewController *)self setCurrentSwipeEvent:0];
    }
    else {
      v24 = {;
    }
      v15 = [(TPSTipsViewController *)self collectionID];
      id v16 = [(TPSTip *)self->_currentTip correlationID];
      id v17 = [(TPSTip *)self->_currentTip clientConditionID];
      uint64_t v18 = [v25 viewMethod];
      id v19 = [(TPSTipsViewController *)self traitCollection];
      v20 = +[TPSAnalyticsEventContentViewed analyticsViewModeForTraitCollection:v19];
      objc_super v21 = +[TPSAnalyticsEventContentViewed eventWithContentID:v24 collectionID:v15 correlationID:v16 clientConditionID:v17 viewMethod:v18 viewMode:v20];
      [v21 log];
    }
    id v22 = [(TPSAppViewController *)self appController];
    v23 = [(TPSTip *)self->_currentTip identifier];
    [v22 tipViewed:v23 collectionIdentifier:self->_collectionID];

    +[TPSAnalyticsSessionController incrementTipsViewedCount];
    self->_canIncreaseViewCount = 0;
    id v4 = v25;
  }
}

- (void)networkStateDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TPSTipsViewController;
  -[TPSViewController networkStateDidChange:](&v14, "networkStateDidChange:");
  if (v3)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = [(UICollectionView *)self->_collectionView visibleCells];
    id v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        double v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) loadContentIfNeeded];
          double v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (void)updatePageControlToTip:(id)a3
{
  id v4 = (TPSTip *)a3;
  if (!v4) {
    id v4 = self->_currentTip;
  }
  long long v10 = v4;
  [(TPSTipsViewController *)self updateNavigationTitle:self->_titleText];
  if ([(NSArray *)self->_tips count]) {
    BOOL v5 = v10 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5 || (NSUInteger v6 = [(NSArray *)self->_tips indexOfObject:v10], v6 == 0x7FFFFFFFFFFFFFFFLL))
  {
    if (![(NSString *)self->_titleText length]) {
      goto LABEL_12;
    }
    int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    int64_t v7 = v6;
    if (v6 == self->_currentPagingIndex) {
      goto LABEL_12;
    }
  }
  self->_currentPagingIndex = v7;
  uint64_t v8 = [(TPSTipsViewController *)self pageControl];
  [v8 setCurrentPage:v7];

  double v9 = [(TPSTipsViewController *)self pageControl];
  [v9 setNeedsLayout];

  [(TPSTipsViewController *)self updateNavigationBarButtons];
LABEL_12:
}

- (void)contentLayoutChanged:(id)a3 userInfo:(id)a4
{
  id v5 = a4;
  NSUInteger v6 = [v5 objectForKeyedSubscript:NSKeyValueChangeOldKey];
  int64_t v7 = [v5 objectForKeyedSubscript:NSKeyValueChangeNewKey];

  if (v6 != v7)
  {
    id v8 = [(TPSTipsViewController *)self scrolledDeferredAction];
    [v8 scheduleNextRunLoop];
  }
}

- (BOOL)eligibleToPlayVideo
{
  if ([(UICollectionView *)self->_collectionView isHidden]) {
    return 0;
  }
  else {
    return ![(TPSTipsViewController *)self shouldHoldOffVideo];
  }
}

- (void)playVideoIfNeeded
{
  if ([(TPSTipsViewController *)self eligibleToPlayVideo])
  {
    id v3 = [(TPSTipsViewController *)self cellForCurrentTip];
    if (([v3 videoHasFinished] & 1) == 0) {
      [v3 continuePlayVideo];
    }
  }
}

- (void)continueVideoForCurrentTip
{
  if ([(TPSTipsViewController *)self eligibleToPlayVideo])
  {
    id v3 = [(TPSTipsViewController *)self cellForCurrentTip];
    [v3 continuePlayVideo];
  }
}

- (void)stopVideoForCurrentTip
{
  id v2 = [(TPSTipsViewController *)self cellForCurrentTip];
  [v2 stopVideoPlayer];
}

- (void)reconfigureAllCollectionViewItems
{
  id v3 = [(TPSTipsViewController *)self tips];
  id v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);

  id v5 = [(TPSTipsViewController *)self tips];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100029BE8;
  v10[3] = &unk_1000B7648;
  v10[4] = self;
  id v6 = v4;
  id v11 = v6;
  [v5 enumerateObjectsUsingBlock:v10];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100029C7C;
  v8[3] = &unk_1000B7670;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  +[UIView performWithoutAnimation:v8];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)TPSTipsViewController;
  -[TPSTipsViewController viewWillTransitionToSize:withTransitionCoordinator:](&v16, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  if ((id)[(TPSAppViewController *)self supportedInterfaceOrientations] != (id)2)
  {
    self->_viewSize.double width = width;
    self->_viewSize.double height = height;
    -[TPSTipCellAppearance updateAppearanceWithSize:](self->_cellAppearance, "updateAppearanceWithSize:", width, height);
    unsigned __int8 v8 = +[TPSAppearance isPhoneUI];
    id v9 = [(TPSTipsViewController *)self cellForCurrentTip];
    [v9 setContentFinishedLoading:0];
    [v9 setHasNotifiedDelegateContentLoaded:0];
    self->_updatingSize = 1;
    [(TPSCollectionViewFlowLayout *)self->_collectionViewLayout invalidateLayout];
    objc_initWeak(&location, self);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100029EF4;
    v13[3] = &unk_1000B7698;
    objc_copyWeak(v14, &location);
    v14[1] = *(id *)&width;
    v14[2] = *(id *)&height;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100029F4C;
    v10[3] = &unk_1000B76C0;
    objc_copyWeak(v11, &location);
    unsigned __int8 v12 = v8;
    v10[4] = self;
    v11[1] = *(id *)&width;
    v11[2] = *(id *)&height;
    [v7 animateAlongsideTransition:v13 completion:v10];
    objc_destroyWeak(v11);
    objc_destroyWeak(v14);
    objc_destroyWeak(&location);
  }
}

- (void)ensureCurrentTipVisible
{
}

- (void)ensureCurrentTipPositionWithViewSize:(CGSize)a3
{
  if (!self->_scrollingTipContent)
  {
    double width = a3.width;
    if ([(NSArray *)self->_tips count])
    {
      uint64_t v13 = 0;
      objc_super v14 = &v13;
      uint64_t v15 = 0x2020000000;
      uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
      tips = self->_tips;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10002A210;
      v12[3] = &unk_1000B76E8;
      v12[4] = self;
      v12[5] = &v13;
      [(NSArray *)tips enumerateObjectsUsingBlock:v12];
      if ((unint64_t)v14[3] <= 0x7FFFFFFFFFFFFFFELL)
      {
        [(UICollectionView *)self->_collectionView _interpageSpacing];
        double v7 = v6;
        uint64_t v8 = v14[3];
        [(UICollectionView *)self->_collectionView contentOffset];
        if (v9 != (width + v7) * (double)v8)
        {
          long long v10 = +[NSIndexPath indexPathForRow:v14[3] inSection:0];
          [(UICollectionView *)self->_collectionView scrollToItemAtIndexPath:v10 atScrollPosition:16 animated:0];
          self->_scrollingTipContent = 0;
          self->_animatingTipsScroll = 0;
          id v11 = [(TPSTipsViewController *)self delegate];
          -[TPSTipsViewController updateTipForCell:startVideo:](self, "updateTipForCell:startVideo:", 0, [v11 tipsViewControllerShouldStartVideo:self]);

          [(TPSTipsViewController *)self updatePageControlToTip:0];
        }
      }
      _Block_object_dispose(&v13, 8);
    }
  }
}

- (void)showInlineLabelWithTitle:(id)a3 message:(id)a4
{
  id v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)TPSTipsViewController;
  id v7 = a3;
  [(TPSViewController *)&v9 showInlineLabelWithTitle:v7 message:v6];
  id v8 = [v7 length];

  if (v8 && [v6 length])
  {
    [(UICollectionView *)self->_collectionView setHidden:1];
    [(TPSTipsViewController *)self updateNavigationTitle:&stru_1000B98B0];
  }
}

- (void)removeInlineMessageLabel
{
  v3.receiver = self;
  v3.super_class = (Class)TPSTipsViewController;
  [(TPSViewController *)&v3 removeInlineMessageLabel];
  [(TPSTipsViewController *)self updatePageControlToTip:0];
  [(UICollectionView *)self->_collectionView setHidden:0];
}

- (void)applicationDidBecomeActive
{
  self->_canIncreaseViewCount = [(TPSAppViewController *)self viewWillAppear];
  objc_super v3 = [(TPSTipsViewController *)self _currentViewMethod];
  [(TPSTipsViewController *)self analyticsIncreaseCountViewForCurrentTipDelay:v3];

  [(TPSTipsViewController *)self _logTimeSpentBeforeCurrentTip:self->_currentTip];
  [(TPSTipsViewController *)self updateTipForCell:0 startVideo:1];
  id v4 = [(TPSTipsViewController *)self cellForCurrentTip];
  [v4 loadBodyContentIfNeeded];
}

- (void)applicationDidEnterBackground
{
  self->_canIncreaseViewCount = 0;
  objc_super v3 = objc_opt_new();
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_delayedIncreaseCountViewForCurrentTip:" object:v3];

  if (([(UICollectionView *)self->_collectionView isHidden] & 1) == 0)
  {
    id v4 = [(TPSTipsViewController *)self cellForCurrentTip];
    [v4 scrubVideoToFirstFrame];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v4 cancelReplayButtonTimer];
    }
  }

  [(TPSTipsViewController *)self _logTimeSpentBeforeCurrentTip:0];
}

- (void)applicationWillTerminate
{
  id v2 = [(TPSTipsViewController *)self tryItViewController];
  [v2 logEndSession];
}

- (void)pageControlPageChanged:(id)a3
{
  self->_canIncreaseViewCount = 1;
  id v4 = [a3 currentPage];
  id v5 = [(TPSTip *)self->_currentTip identifier];
  id v6 = [(TPSTipsViewController *)self collectionID];
  id v7 = [(TPSTip *)self->_currentTip correlationID];
  id v8 = [(TPSTip *)self->_currentTip clientConditionID];
  uint64_t v9 = TPSAnalyticsViewMethodSwipe;
  long long v10 = [(TPSTipsViewController *)self traitCollection];
  id v11 = +[TPSAnalyticsEventContentViewed analyticsViewModeForTraitCollection:v10];
  unsigned __int8 v12 = +[TPSAnalyticsEventContentViewed eventWithContentID:v5 collectionID:v6 correlationID:v7 clientConditionID:v8 viewMethod:v9 viewMode:v11];
  [(TPSTipsViewController *)self setCurrentSwipeEvent:v12];

  uint64_t v13 = [(TPSTipsViewController *)self tips];
  objc_super v14 = [v13 objectAtIndexedSubscript:v4];
  [(TPSTipsViewController *)self setCurrentTip:v14];

  id v16 = [(TPSTipsViewController *)self collectionView];
  uint64_t v15 = +[NSIndexPath indexPathForRow:v4 inSection:0];
  [v16 scrollToItemAtIndexPath:v15 atScrollPosition:16 animated:0];
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  self->_scrollingTipContent = 0;
  self->_animatingTipsScroll = 0;
  id v4 = [(TPSTipsViewController *)self tips];
  id v5 = [(TPSTipsViewController *)self currentTip];
  id v6 = [v4 indexOfObject:v5];

  if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    collectionView = self->_collectionView;
    id v8 = +[NSIndexPath indexPathForRow:v6 inSection:0];
    uint64_t v9 = [(UICollectionView *)collectionView cellForItemAtIndexPath:v8];

    long long v10 = [(TPSTipsViewController *)self currentTip];
    [v9 setTip:v10 withCellAppearance:self->_cellAppearance];

    if (![(TPSTipsViewController *)self shouldHoldOffVideo]) {
      [v9 playVideo];
    }
  }
  id v11 = [(TPSTipsViewController *)self currentTip];
  [(TPSTipsViewController *)self updatePageControlToTip:v11];
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  self->_scrollingTipContent = 1;
  self->_animatingTipsScroll = 0;
  id v11 = [(TPSTip *)self->_currentTip identifier];
  id v4 = [(TPSTipsViewController *)self collectionID];
  id v5 = [(TPSTip *)self->_currentTip correlationID];
  id v6 = [(TPSTip *)self->_currentTip clientConditionID];
  uint64_t v7 = TPSAnalyticsViewMethodSwipe;
  id v8 = [(TPSTipsViewController *)self traitCollection];
  uint64_t v9 = +[TPSAnalyticsEventContentViewed analyticsViewModeForTraitCollection:v8];
  long long v10 = +[TPSAnalyticsEventContentViewed eventWithContentID:v11 collectionID:v4 correlationID:v5 clientConditionID:v6 viewMethod:v7 viewMode:v9];
  [(TPSTipsViewController *)self setCurrentSwipeEvent:v10];
}

- (void)scrollViewWillBeginDecelerating:(id)a3
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(UICollectionView *)self->_collectionView visibleCells];
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        long long v10 = [v9 tip];
        id v11 = [(TPSTipsViewController *)self currentTip];

        if (v10 != v11) {
          [(TPSTipsViewController *)self updateTipForCell:v9 startVideo:0];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  unsigned __int8 v12 = [(TPSTipsViewController *)self centerCell];
  uint64_t v13 = [v12 tip];
  [(TPSTipsViewController *)self updatePageControlToTip:v13];
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v8 = [(TPSTipsViewController *)self centerCell];
  id v4 = [(TPSTipsViewController *)self currentTip];
  id v5 = [v8 tip];

  if (v4 != v5)
  {
    id v6 = [v8 tip];
    [(TPSTipsViewController *)self setCurrentTip:v6];
  }
  uint64_t v7 = [(TPSTipsViewController *)self currentTip];
  [(TPSTipsViewController *)self updatePageControlToTip:v7];

  self->_scrollingTipContent = 0;
}

- (void)updateBarMaterial
{
  objc_super v3 = [(TPSTipsViewController *)self collectionView];
  id v4 = [v3 visibleCells];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v6)
  {
    id v7 = v6;
    LOBYTE(v8) = 0;
    uint64_t v9 = *(void *)v39;
    double y = CGRectZero.origin.y;
    double v11 = 0.0;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v39 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v13 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        long long v14 = [v13 contentScrollView];
        [v14 adjustedContentInset];
        double v16 = v15;
        [v14 contentOffset];
        double v18 = v16 + v17;
        if (v16 + v17 < 0.0) {
          double v18 = 0.0;
        }
        double v19 = fmin(v18, 1.0);
        if (v19 > v11) {
          double v11 = v19;
        }
        if (v8
          || ([v13 tip],
              v20 = objc_claimAutoreleasedReturnValue(),
              unsigned __int8 v21 = [v20 isIntro],
              v20,
              (v21 & 1) != 0))
        {
          BOOL v8 = 1;
        }
        else
        {
          [v14 contentSize];
          double v23 = v22;
          double v25 = v24;
          [v13 bottomPadding];
          -[TPSPageControl convertRect:fromView:](self->_pageControl, "convertRect:fromView:", v14, CGRectZero.origin.x, y, v23, v25 + v26);
          CGFloat v28 = v27;
          CGFloat v30 = v29;
          CGFloat v32 = v31;
          [(TPSPageControl *)self->_pageControl bounds];
          v44.origin.x = 0.0;
          v44.origin.double y = v28;
          v44.size.double width = v30;
          v44.size.double height = v32;
          BOOL v8 = CGRectIntersectsRect(v43, v44);
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v7);
  }
  else
  {
    BOOL v8 = 0;
    double v11 = 0.0;
  }

  double v33 = [(TPSTipsViewController *)self navigationItem];
  [v33 _manualScrollEdgeAppearanceProgress];
  double v35 = v34;

  if (v35 != v11)
  {
    char v36 = [(TPSTipsViewController *)self navigationItem];
    [v36 _setManualScrollEdgeAppearanceProgress:v11];

    id v37 = [(TPSTipsViewController *)self navigationItem];
    [v37 _setManualScrollEdgeAppearanceEnabled:1];
  }
  -[TPSPageControl setBackgroundStyle:](self->_pageControl, "setBackgroundStyle:", v8, (void)v38);
}

- (void)updateNavigationBarButtons
{
  if (![(TPSTipsViewController *)self isSharedVariant])
  {
    if ([(TPSTipsViewController *)self allowBookmarks])
    {
      if (![(TPSTipsViewController *)self updateBarButtonsForTip]) {
        return;
      }
      id v11 = +[NSMutableArray array];
      objc_super v3 = [(TPSTipsViewController *)self saveBarButton];

      if (v3)
      {
        id v4 = [(TPSTipsViewController *)self saveBarButton];
        [v11 addObject:v4];
      }
      if (+[TPSFeatureFlags allowsTipsSharing])
      {
        id v5 = [(TPSTipsViewController *)self shareBarButton];

        if (v5)
        {
          id v6 = [(TPSTipsViewController *)self shareBarButton];
          [v11 addObject:v6];
        }
      }
      id v7 = [(TPSTipsViewController *)self navigationItem];
      [v7 setRightBarButtonItems:v11];

      BOOL v8 = [(TPSTipsViewController *)self navigationItem];
      [v8 setHidesSearchBarWhenScrolling:0];
    }
    else
    {
      uint64_t v9 = [(TPSTipsViewController *)self navigationItem];
      long long v10 = [v9 rightBarButtonItem];

      if (!v10) {
        return;
      }
      id v11 = [(TPSTipsViewController *)self navigationItem];
      [v11 setRightBarButtonItem:0];
    }
  }
}

- (id)searchBarNavButton
{
  objc_super v3 = [(TPSTipsViewController *)self searchController];

  if (v3)
  {
    id v4 = [(TPSTipsViewController *)self searchBarButton];

    if (!v4)
    {
      id v5 = objc_alloc((Class)UIBarButtonItem);
      id v6 = [(TPSTipsViewController *)self searchController];
      id v7 = [v6 searchBar];
      id v8 = [v5 initWithCustomView:v7];
      [(TPSTipsViewController *)self setSearchBarButton:v8];
    }
    uint64_t v9 = [(TPSTipsViewController *)self searchBarButton];
  }
  else
  {
    [(TPSTipsViewController *)self setSearchBarButton:0];
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)scrollViewDidScroll:(id)a3
{
  self->_canIncreaseViewCount = 1;
  [(TPSTipsViewController *)self cancelAssetsPrefetch];
}

- (id)centerCellIndexPath
{
  [(UICollectionView *)self->_collectionView center];
  double v4 = v3;
  [(UICollectionView *)self->_collectionView contentOffset];
  double v6 = v4 + v5;
  [(UICollectionView *)self->_collectionView center];
  double v8 = v7;
  [(UICollectionView *)self->_collectionView contentOffset];
  double v10 = v8 + v9;
  collectionView = self->_collectionView;

  return -[UICollectionView indexPathForItemAtPoint:](collectionView, "indexPathForItemAtPoint:", v6, v10);
}

- (id)centerCell
{
  double v3 = [(TPSTipsViewController *)self centerCellIndexPath];
  collectionView = self->_collectionView;
  if (v3)
  {
    double v5 = [(UICollectionView *)collectionView cellForItemAtIndexPath:v3];
  }
  else
  {
    double v6 = [(UICollectionView *)collectionView visibleCells];
    double v5 = [v6 lastObject];
  }

  return v5;
}

- (id)activityViewControllerForTip:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [&__NSArray0__struct mutableCopy];
    double v6 = [[TPSTextActivityItemSource alloc] initWithTip:v4];
    [v5 addObject:v6];
    double v7 = [v4 webURLPath];

    if (v7)
    {
      double v8 = [TPSURLActivityItemSource alloc];
      double v9 = [(TPSAppViewController *)self appController];
      double v10 = [(TPSURLActivityItemSource *)v8 initWithTip:v4 appController:v9];

      id v11 = [(TPSTipsViewController *)self traitCollection];
      -[TPSURLActivityItemSource setUserInterfaceStyle:](v10, "setUserInterfaceStyle:", [v11 userInterfaceStyle]);

      [v5 addObject:v10];
    }
    unsigned __int8 v12 = [[TPSActivityViewController alloc] initWithActivityItems:v5 applicationActivities:0];
    v15[0] = UIActivityTypePrint;
    v15[1] = UIActivityTypeAddToReadingList;
    v15[2] = UIActivityTypeAssignToContact;
    v15[3] = UIActivityTypePostToFlickr;
    v15[4] = UIActivityTypeSaveToCameraRoll;
    v15[5] = UIActivityTypePostToVimeo;
    v15[6] = UIActivityTypeOpenInIBooks;
    uint64_t v13 = +[NSArray arrayWithObjects:v15 count:7];
    [(TPSActivityViewController *)v12 setExcludedActivityTypes:v13];
  }
  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return [(NSArray *)self->_tips count];
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = -[NSArray objectAtIndexedSubscript:](self->_tips, "objectAtIndexedSubscript:", [v7 row]);
  double v9 = [(TPSTipsViewController *)self currentTip];
  double v10 = [v9 identifier];
  id v11 = [v8 identifier];
  unsigned int v12 = [v10 isEqualToString:v11];

  if ([v8 isIntro])
  {
    uint64_t v13 = &kTPSIntroTipCellIdentifierKey;
  }
  else
  {
    unsigned int v14 = [v8 isOutro];
    uint64_t v13 = &kTPSTipCellIdentifierKey;
    if (v14) {
      uint64_t v13 = &kTPSOutroTipCellIdentifierKey;
    }
  }
  double v15 = [v6 dequeueReusableCellWithReuseIdentifier:*v13 forIndexPath:v7];
  double v16 = [(TPSTipsViewController *)self view];
  double v17 = [v16 backgroundColor];
  double v18 = [v15 contentScrollView];
  [v18 setBackgroundColor:v17];

  [v15 setDelegate:self];
  double v19 = [(TPSAppViewController *)self appController];
  [v15 setAppController:v19];

  v20 = [(TPSTipsViewController *)self view];
  [v20 safeAreaInsets];
  [v15 setContentSafeAreaInsets:];

  [v15 setAdditionalBottomOffset:self->_toolbarHeight];
  [v15 setIsSharedVariant:self->_isSharedVariant];
  [v15 setTip:v8 withCellAppearance:self->_cellAppearance];
  if (v12
    && ([(UICollectionView *)self->_collectionView isHidden] & 1) == 0
    && !self->_animatingTipsScroll)
  {
    unsigned __int8 v21 = [(TPSAppViewController *)self appController];
    if ([v21 appInBackground])
    {
    }
    else
    {
      unsigned int v22 = [(TPSAppViewController *)self viewWillAppear];

      if (v22) {
        [(TPSTipsViewController *)self updateTipForCell:v15 startVideo:[(TPSAppViewController *)self viewWillAppear]];
      }
    }
  }

  return v15;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  [(UICollectionView *)self->_collectionView bounds];
  double v6 = v5;
  double v8 = v7;
  result.double height = v8;
  result.double width = v6;
  return result;
}

- (void)initCellAppearanceWithTrait:(id)a3 size:(CGSize)a4
{
  if (!self->_cellAppearance)
  {
    double height = a4.height;
    double width = a4.width;
    id v7 = a3;
    double v8 = (TPSTipCellAppearance *)-[TPSTipCellAppearance initAppearanceWithTraits:size:]([TPSTipCellAppearance alloc], "initAppearanceWithTraits:size:", v7, width, height);
    cellAppearance = self->_cellAppearance;
    self->_cellAppearance = v8;

    double v10 = [(TPSTipsViewController *)self view];
    [v10 safeAreaInsets];
    -[TPSTipCellAppearance setTopSafeAreaHeight:](self->_cellAppearance, "setTopSafeAreaHeight:");

    id v11 = [v7 userInterfaceStyle];
    unsigned int v12 = self->_cellAppearance;
    [(TPSTipCellAppearance *)v12 setUserInterfaceStyle:v11];
  }
}

- (void)viewWillLayoutSubviews
{
  double v3 = [(UICollectionView *)self->_collectionView traitCollection];
  id v4 = [(TPSTipsViewController *)self view];
  [v4 bounds];
  -[TPSTipsViewController initCellAppearanceWithTrait:size:](self, "initCellAppearanceWithTrait:size:", v3, v5, v6);

  v7.receiver = self;
  v7.super_class = (Class)TPSTipsViewController;
  [(TPSTipsViewController *)&v7 viewWillLayoutSubviews];
}

- (void)viewDidLayoutSubviews
{
  v34.receiver = self;
  v34.super_class = (Class)TPSTipsViewController;
  [(TPSTipsViewController *)&v34 viewDidLayoutSubviews];
  if (!self->_updatingSize && [(TPSAppViewController *)self viewWillAppear])
  {
    double v3 = [(TPSTipsViewController *)self view];
    [v3 bounds];
    double v5 = v4;
    double v7 = v6;

    p_viewSize = &self->_viewSize;
    double width = self->_viewSize.width;
    double height = self->_viewSize.height;
    if (width != v5 || height != v7)
    {
      p_viewSize->double width = v5;
      self->_viewSize.double height = v7;
      -[TPSTipCellAppearance updateAppearanceWithSize:](self->_cellAppearance, "updateAppearanceWithSize:", v5, v7);
      [(UICollectionView *)self->_collectionView reloadData];
      -[TPSTipsViewController _adjustScrollViewPagingDecelerationForSize:](self, "_adjustScrollViewPagingDecelerationForSize:", p_viewSize->width, self->_viewSize.height);
      double width = p_viewSize->width;
      double height = self->_viewSize.height;
    }
    -[TPSTipsViewController ensureCurrentTipPositionWithViewSize:](self, "ensureCurrentTipPositionWithViewSize:", width, height);
    unsigned int v12 = [(TPSTipsViewController *)self view];
    [v12 safeAreaInsets];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;

    if (v18 <= 0.0) {
      double v21 = -16.0;
    }
    else {
      double v21 = -v18;
    }
    unsigned int v22 = [(TPSTipsViewController *)self pageControlBottomConstraint];
    [v22 setConstant:v21];

    double v23 = [(TPSTipsViewController *)self pageControl];
    [v23 bounds];
    self->_toolbarHeight = CGRectGetHeight(v36);

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    double v24 = [(UICollectionView *)self->_collectionView visibleCells];
    id v25 = [v24 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v31;
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v31 != v27) {
            objc_enumerationMutation(v24);
          }
          double v29 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          [v29 setAdditionalBottomOffset:self->_toolbarHeight];
          [v29 setContentSafeAreaInsets:v14, v16, v18, v20];
        }
        id v26 = [v24 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v26);
    }
  }
}

- (void)registerTraitChanges
{
  uint64_t v6 = objc_opt_class();
  double v3 = +[NSArray arrayWithObjects:&v6 count:1];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002BB84;
  v5[3] = &unk_1000B7710;
  v5[4] = self;
  id v4 = [(TPSTipsViewController *)self registerForTraitChanges:v3 withHandler:v5];
}

- (void)_logTimeSpentBeforeCurrentTip:(id)a3
{
  id v13 = a3;
  previousTipTimeSpentEvent = self->_previousTipTimeSpentEvent;
  if (previousTipTimeSpentEvent)
  {
    double v5 = [(TPSAnalyticsEventTipTimeSpent *)previousTipTimeSpentEvent date];

    if (v5)
    {
      uint64_t v6 = +[NSDate date];
      double v7 = [(TPSAnalyticsEventTipTimeSpent *)self->_previousTipTimeSpentEvent date];
      [v6 timeIntervalSinceDate:v7];
      -[TPSAnalyticsEventTipTimeSpent setTimeSpent:](self->_previousTipTimeSpentEvent, "setTimeSpent:");

      [(TPSAnalyticsEventTipTimeSpent *)self->_previousTipTimeSpentEvent log];
    }
  }
  if (v13)
  {
    double v8 = [v13 identifier];
    collectionID = self->_collectionID;
    double v10 = [v13 correlationID];
    id v11 = +[TPSAnalyticsEventTipTimeSpent eventWithTipID:v8 collectionID:collectionID correlationID:v10];
    unsigned int v12 = self->_previousTipTimeSpentEvent;
    self->_previousTipTimeSpentEvent = v11;
  }
  else
  {
    double v8 = self->_previousTipTimeSpentEvent;
    self->_previousTipTimeSpentEvent = 0;
  }
}

- (void)logAppIntent:(id)a3 actionDirection:(id)a4
{
  currentTip = self->_currentTip;
  id v6 = a4;
  id v7 = a3;
  id v9 = [(TPSTip *)currentTip identifier];
  double v8 = +[TPSAnalyticsEventLinkAction eventWithTipID:v9 actionName:v7 actionDirection:v6];

  [v8 log];
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4 = [a3 searchBar];
  id v8 = [v4 text];

  double v5 = v8;
  if (v8)
  {
    id v6 = +[TPSAppSearchQuery queryWithSearchTerm:v8 origin:0];
    id v7 = [(TPSTipsViewController *)self searchResultViewModel];
    [v7 setSearchQuery:v6];

    double v5 = v8;
  }
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = [a3 presentedViewController];
  double v5 = [(TPSTipsViewController *)self searchResultsNavigationController];

  if (v4 == v5)
  {
    [(TPSTipsViewController *)self dismissSearch];
  }
}

- (void)tipCollectionViewCellContentLayoutChanged:(id)a3
{
  id v3 = [(TPSTipsViewController *)self scrolledDeferredAction];
  [v3 scheduleNextRunLoop];
}

- (void)cellContentLoaded:(id)a3
{
  id v4 = [a3 tip];
  double v5 = [(TPSTipsViewController *)self currentTip];

  if (v4 == v5)
  {
    [(TPSTipsViewController *)self cancelAssetsPrefetch];
    [(TPSTipsViewController *)self performSelector:"prefetchMediaPrefetchDelay" withObject:0 afterDelay:0.75];
  }
}

- (void)cancelAssetsPrefetch
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"prefetchMediaPrefetchDelay" object:0];
  id v3 = [(TPSTipsViewController *)self assetPrefetchingManager];
  [v3 cancel];
}

- (void)prefetchMediaPrefetchDelay
{
  id v3 = [(TPSTipsViewController *)self traitCollection];
  BOOL v4 = [v3 userInterfaceStyle] == (id)2;

  id v7 = [(TPSTipsViewController *)self assetPrefetchingManager];
  currentTip = self->_currentTip;
  id v6 = [(TPSTipsViewController *)self tips];
  [v7 prefetchAssetsFromTip:currentTip tips:v6 assetUserInterfaceStyle:v4];
}

- (void)tipCollectionViewCell:(id)a3 showSafariViewForURL:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    id v6 = [objc_alloc((Class)SFSafariViewController) initWithURL:v5];

    [v6 setDelegate:self];
    [(TPSTipsViewController *)self presentViewController:v6 animated:1 completion:0];
  }
}

- (void)tipCollectionViewCell:(id)a3 showTryItModeForURL:(id)a4
{
  if (a4 && self->_currentTip)
  {
    id v5 = a4;
    id v6 = objc_alloc((Class)TryItViewController);
    id v7 = [(TPSTipsViewController *)self currentTip];
    id v8 = [v7 identifier];
    id v9 = [(TPSTipsViewController *)self collectionID];
    double v10 = [(TPSTipsViewController *)self currentTip];
    id v11 = [v10 correlationID];
    id v12 = [v6 initWithLessonURL:v5 tipID:v8 collectionID:v9 correlationID:v11];

    [(TPSTipsViewController *)self setTryItViewController:v12];
    if (+[TPSCommonDefines isPhoneUI]) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = 2;
    }
    double v14 = [(TPSTipsViewController *)self tryItViewController];
    [v14 setModalPresentationStyle:v13];

    double v15 = [(TPSTipsViewController *)self tryItViewController];
    [v15 setModalInPresentation:1];

    double v16 = [(TPSTipsViewController *)self tryItViewController];
    [(TPSTipsViewController *)self presentViewController:v16 animated:1 completion:0];

    double v17 = [(TPSTipsViewController *)self tryItViewController];
    [v17 setDelegate:self];

    [(TPSTipsViewController *)self stopVideoForCurrentTip];
  }
}

- (void)tipCollectionViewCell:(id)a3 showVideoForURL:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    id v6 = objc_alloc_init((Class)AVPlayerViewController);
    id v7 = +[AVPlayer playerWithURL:v5];

    [v6 setPlayer:v7];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10002C494;
    v9[3] = &unk_1000B7738;
    id v10 = v6;
    id v8 = v6;
    [(TPSTipsViewController *)self presentViewController:v8 animated:1 completion:v9];
  }
}

- (void)tipCollectionViewCell:(id)a3 showUserGuideWithIdentifier:(id)a4 topicId:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  id v8 = [(TPSTipsViewController *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(TPSTipsViewController *)self delegate];
    [v10 tipsViewController:self loadMainUserGuideWithIdentifier:v11 topicId:v7];
  }
}

- (void)tipCollectionViewCell:(id)a3 linkTappedForURL:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if (self->_isSharedVariant) {
    [(TPSTipsViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
  if (v6)
  {
    currentTip = self->_currentTip;
    if (currentTip)
    {
      id v8 = [(TPSTip *)currentTip identifier];
      collectionID = self->_collectionID;
      id v10 = [(TPSTip *)self->_currentTip correlationID];
      id v11 = [(TPSTip *)self->_currentTip clientConditionID];
      id v12 = +[TPSAnalyticsEventContentLinkTapped eventWithContentID:v8 collectionID:collectionID correlationID:v10 clientConditionID:v11 url:v6];
      [v12 log];
    }
  }
}

- (BOOL)tipCollectionViewCellCanDisplayAssets:(id)a3
{
  return !self->_scrollingTipContent;
}

- (void)tipCollectionViewCellHandleTripleTapInternalGesture:(id)a3
{
  id v5 = [(TPSAppViewController *)self appController];
  BOOL v4 = [(TPSTipsViewController *)self currentTip];
  [v5 overrideWidgetWithTip:v4];
}

- (void)tipCollectionViewCellSharedTipTapped:(id)a3
{
  BOOL v4 = [(TPSAppViewController *)self appController];
  id v5 = [(TPSTip *)self->_currentTip correlationID];
  id v13 = [v4 tipForCorrelationIdentifier:v5];

  id v6 = v13;
  if (v13)
  {
    id v7 = [(TPSAppViewController *)self appController];
    id v8 = [v13 identifier];
    uint64_t v9 = [v7 collectionIdentifierForTipIdentifier:v8];
    if (v9)
    {
      id v10 = (void *)v9;
      id v11 = [(TPSTipsViewController *)self delegate];
      char v12 = objc_opt_respondsToSelector();

      id v6 = v13;
      if ((v12 & 1) == 0) {
        goto LABEL_6;
      }
      id v7 = [(TPSTipsViewController *)self delegate];
      id v8 = [v13 identifier];
      [v7 tipsViewController:self showSharedTipWithTipIdentifier:v8];
    }

    id v6 = v13;
  }
LABEL_6:
}

- (void)safariViewControllerDidFinish:(id)a3
{
}

- (void)pageControlLongPressedForHUD:(id)a3 withText:(id)a4
{
  id v6 = a4;
  if ([v6 length])
  {
    id v5 = [objc_alloc((Class)UIAccessibilityHUDItem) initWithTitle:v6 image:0 imageInsets:UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right];
    [(TPSTipsViewController *)self _showAccessibilityHUDItem:v5];
  }
}

- (void)pageControlCancelLongPressedForHUD:(id)a3
{
}

- (void)deferredActionPerform:(id)a3
{
}

- (void)tryItViewControllerDidDismissWithTryItViewController:(id)a3
{
  [(TPSTipsViewController *)self setTryItViewController:0];

  [(TPSTipsViewController *)self continueVideoForCurrentTip];
}

- (BOOL)allowBookmarks
{
  return self->_allowBookmarks;
}

- (BOOL)shouldHoldOffVideo
{
  return self->_shouldHoldOffVideo;
}

- (TPSTipsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TPSTipsViewControllerDelegate *)WeakRetained;
}

- (NSArray)tips
{
  return self->_tips;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (NSString)collectionID
{
  return self->_collectionID;
}

- (void)setCollectionID:(id)a3
{
}

- (UIColor)contentBackgroundColor
{
  return self->_contentBackgroundColor;
}

- (void)setContentBackgroundColor:(id)a3
{
}

- (BOOL)scrollingTipContent
{
  return self->_scrollingTipContent;
}

- (void)setScrollingTipContent:(BOOL)a3
{
  self->_scrollingTipContent = a3;
}

- (BOOL)updatingSize
{
  return self->_updatingSize;
}

- (void)setUpdatingSize:(BOOL)a3
{
  self->_updatingSize = a3;
}

- (BOOL)presentingShareSheet
{
  return self->_presentingShareSheet;
}

- (void)setPresentingShareSheet:(BOOL)a3
{
  self->_presentingShareSheet = a3;
}

- (TPSSizes)tipSizes
{
  return self->_tipSizes;
}

- (void)setTipSizes:(id)a3
{
}

- (TPSDeferredAction)scrolledDeferredAction
{
  return self->_scrolledDeferredAction;
}

- (void)setScrolledDeferredAction:(id)a3
{
}

- (TPSTipCellAppearance)cellAppearance
{
  return self->_cellAppearance;
}

- (void)setCellAppearance:(id)a3
{
}

- (TPSAnalyticsEventContentViewed)currentSwipeEvent
{
  return self->_currentSwipeEvent;
}

- (void)setCurrentSwipeEvent:(id)a3
{
}

- (TPSKVOManager)KVOManager
{
  return self->_KVOManager;
}

- (void)setKVOManager:(id)a3
{
}

- (TPSPageControl)pageControl
{
  return self->_pageControl;
}

- (void)setPageControl:(id)a3
{
}

- (TPSSavedTipsManager)savedTipsManager
{
  return self->_savedTipsManager;
}

- (void)setSavedTipsManager:(id)a3
{
}

- (TPSTipsAssetPrefetchingManager)assetPrefetchingManager
{
  return self->_assetPrefetchingManager;
}

- (NSLayoutConstraint)pageControlBottomConstraint
{
  return self->_pageControlBottomConstraint;
}

- (void)setPageControlBottomConstraint:(id)a3
{
}

- (TPSSearchResultViewModel)searchResultViewModel
{
  return self->_searchResultViewModel;
}

- (void)setSearchResultViewModel:(id)a3
{
}

- (UINavigationController)searchResultsNavigationController
{
  return self->_searchResultsNavigationController;
}

- (void)setSearchResultsNavigationController:(id)a3
{
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)setSearchController:(id)a3
{
}

- (UIBarButtonItem)saveBarButton
{
  return self->_saveBarButton;
}

- (void)setSaveBarButton:(id)a3
{
}

- (UIBarButtonItem)searchBarButton
{
  return self->_searchBarButton;
}

- (void)setSearchBarButton:(id)a3
{
}

- (UIBarButtonItem)shareBarButton
{
  return self->_shareBarButton;
}

- (void)setShareBarButton:(id)a3
{
}

- (BOOL)isSharedVariant
{
  return self->_isSharedVariant;
}

- (void)setIsSharedVariant:(BOOL)a3
{
  self->_isSharedVariant = a3;
}

- (TryItViewController)tryItViewController
{
  return self->_tryItViewController;
}

- (void)setTryItViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tryItViewController, 0);
  objc_storeStrong((id *)&self->_shareBarButton, 0);
  objc_storeStrong((id *)&self->_searchBarButton, 0);
  objc_storeStrong((id *)&self->_saveBarButton, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_searchResultsNavigationController, 0);
  objc_storeStrong((id *)&self->_searchResultViewModel, 0);
  objc_storeStrong((id *)&self->_pageControlBottomConstraint, 0);
  objc_storeStrong((id *)&self->_assetPrefetchingManager, 0);
  objc_storeStrong((id *)&self->_savedTipsManager, 0);
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_KVOManager, 0);
  objc_storeStrong((id *)&self->_currentSwipeEvent, 0);
  objc_storeStrong((id *)&self->_cellAppearance, 0);
  objc_storeStrong((id *)&self->_scrolledDeferredAction, 0);
  objc_storeStrong((id *)&self->_tipSizes, 0);
  objc_storeStrong((id *)&self->_contentBackgroundColor, 0);
  objc_storeStrong((id *)&self->_collectionID, 0);
  objc_storeStrong((id *)&self->_currentTip, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_tips, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_previousTipTimeSpentEvent, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_tipsMap, 0);

  objc_storeStrong((id *)&self->_navigationTitleTextColor, 0);
}

- (void)setupSearchViewModel
{
  id v2 = self;
  sub_100039D38();
}

- (void)dismissSearch
{
  id v6 = self;
  id v2 = [(TPSTipsViewController *)v6 searchController];
  if (v2)
  {
    id v3 = v2;
    BOOL v4 = [(UISearchController *)v2 searchBar];

    [(UISearchBar *)v4 resignFirstResponder];
    id v5 = (TPSTipsViewController *)v4;
  }
  else
  {
    id v5 = v6;
  }
}

- (void)shareCurrentTip:(id)a3
{
  if (a3)
  {
    BOOL v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    id v5 = self;
  }
  sub_10004BBE0();

  sub_1000143B4((uint64_t)v6, &qword_1000C8A40);
}

@end