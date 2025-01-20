@interface CuratedCollectionViewController
- (BOOL)shouldClearSearchPins;
- (ContainerHeaderView)fakeHeaderView;
- (CuratedCollectionHeaderView)cardHeaderView;
- (CuratedCollectionProvider)collectionProvider;
- (CuratedCollectionViewAnalyticsController)analyticsController;
- (CuratedCollectionViewController)initWithCuratedCollectionIdentifier:(id)a3;
- (CuratedCollectionViewController)initWithFullyClientizedPlaceCollection:(id)a3;
- (ErrorModeView)errorView;
- (GEOPlaceCollection)curatedCollection;
- (LoadingModeView)loadingView;
- (NSArray)mapItems;
- (UIScrollView)pptTestScrollView;
- (double)heightForLayout:(unint64_t)a3;
- (id)_searchResults;
- (id)_websiteURL;
- (id)keyCommands;
- (id)menuForQuickActionButton;
- (id)targetForAction:(SEL)a3 withSender:(id)a4;
- (id)updateContentInjection;
- (void)_attachLoadingView;
- (void)_commonInitWithCuratedCollectionProvider:(id)a3 identifier:(id)a4;
- (void)_didFinishResolving;
- (void)_insertInHistory;
- (void)_refineMapItem:(id)a3 completionHandler:(id)a4;
- (void)_setWantsInsertInHistory;
- (void)_updateHeaderAndTableViewValues;
- (void)_updateHeaderTransition;
- (void)addContentToMapView;
- (void)applyAlphaToContent:(double)a3;
- (void)dataSource:(id)a3 addPlaceToLibraryUsingCoordinator:(id)a4;
- (void)dataSource:(id)a3 addToUserCollection:(id)a4 forMapItem:(id)a5 sourceView:(id)a6 onSaveCompletion:(id)a7;
- (void)dataSource:(id)a3 didExpandCellAnimated:(BOOL)a4;
- (void)dataSource:(id)a3 didFailWithErrorState:(unint64_t)a4;
- (void)dataSource:(id)a3 itemFocused:(id)a4;
- (void)dataSource:(id)a3 itemTapped:(id)a4;
- (void)dataSource:(id)a3 openAppClip:(id)a4;
- (void)dataSource:(id)a3 removePlaceFromLibraryUsingCoordinator:(id)a4;
- (void)dataSource:(id)a3 willPunchOuToPublisherWebpageForPlaceCollectionItem:(id)a4;
- (void)dataSourceUpdated:(id)a3;
- (void)didBecomeCurrent;
- (void)didChangeLayout:(unint64_t)a3;
- (void)didSelectOpenHomePage;
- (void)didSelectRemoveFromSavedCollection;
- (void)didSelectSaveCollection;
- (void)didSelectShareFromView:(id)a3;
- (void)handleDismissAction:(id)a3;
- (void)headerViewBrickTapped;
- (void)headerViewPublisherLogoTapped;
- (void)presentRAPWithSourceView:(id)a3;
- (void)removeContentFromMapView;
- (void)reportAnIssueMenuButtonTapped;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)seeAllGuidesMenuButtonTapped;
- (void)setAnalyticsController:(id)a3;
- (void)setCardHeaderView:(id)a3;
- (void)setCollectionProvider:(id)a3;
- (void)setCuratedCollection:(id)a3;
- (void)setErrorView:(id)a3;
- (void)setFakeHeaderView:(id)a3;
- (void)setLoadingView:(id)a3;
- (void)setUpdateContentInjection:(id)a3;
- (void)showPublisherView:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)websiteMenuButtonTapped;
- (void)willChangeLayout:(unint64_t)a3;
@end

@implementation CuratedCollectionViewController

- (CuratedCollectionViewController)initWithCuratedCollectionIdentifier:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CuratedCollectionViewController;
  v5 = [(CuratedCollectionViewController *)&v10 initWithNibName:0 bundle:0];
  if (v5)
  {
    v6 = -[MapsThemeTableView initWithFrame:]([MapsThemeTableView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    tableView = v5->_tableView;
    v5->_tableView = v6;

    [(MapsThemeTableView *)v5->_tableView setAccessibilityIdentifier:@"CuratedCollectionTableView"];
    v8 = [[CuratedCollectionProvider alloc] initWithTableView:v5->_tableView curatedCollectionIdentifier:v4];
    [(CuratedCollectionViewController *)v5 _commonInitWithCuratedCollectionProvider:v8 identifier:v4];
  }
  return v5;
}

- (CuratedCollectionViewController)initWithFullyClientizedPlaceCollection:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CuratedCollectionViewController;
  v5 = [(CuratedCollectionViewController *)&v13 initWithNibName:0 bundle:0];
  if (v5)
  {
    v6 = -[MapsThemeTableView initWithFrame:]([MapsThemeTableView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    tableView = v5->_tableView;
    v5->_tableView = v6;

    v8 = [[CuratedCollectionProvider alloc] initWithTableView:v5->_tableView fullyClientizedCuratedCollection:v4];
    id v9 = objc_alloc((Class)MKMapItemIdentifier);
    objc_super v10 = [v4 collectionIdentifier];
    id v11 = [v9 initWithGEOMapItemIdentifier:v10];

    [(CuratedCollectionViewController *)v5 _commonInitWithCuratedCollectionProvider:v8 identifier:v11];
    [(CuratedCollectionViewAnalyticsController *)v5->_analyticsController updateWithPlaceCollection:v4];
  }
  return v5;
}

- (void)_commonInitWithCuratedCollectionProvider:(id)a3 identifier:(id)a4
{
  id v22 = a3;
  objc_storeStrong((id *)&self->_collectionProvider, a3);
  id v7 = a4;
  [(DataSource *)self->_collectionProvider setDelegate:self];
  [(MapsThemeTableView *)self->_tableView setPreservesSuperviewLayoutMargins:1];
  v8 = -[ContainerHeaderView initWithFrame:]([ContainerHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  fakeHeaderView = self->_fakeHeaderView;
  self->_fakeHeaderView = v8;

  objc_super v10 = [[CuratedCollectionHeaderView alloc] initWithDelegate:self];
  cardHeaderView = self->_cardHeaderView;
  self->_cardHeaderView = v10;

  v12 = [[CuratedCollectionViewAnalyticsController alloc] initWithCollectionIdentifier:v7];
  analyticsController = self->_analyticsController;
  self->_analyticsController = v12;

  [(CuratedCollectionViewAnalyticsController *)self->_analyticsController logRevealCuratedCollectionView];
  [(CuratedCollectionProvider *)self->_collectionProvider setAnalyticsController:self->_analyticsController];
  if (sub_1000BBB44(self) == 5)
  {
    v14 = [(ContaineeViewController *)self cardPresentationController];
    [v14 setAllowResizeInFloatingStyle:1];

    v15 = [(ContaineeViewController *)self cardPresentationController];
    [v15 setDefaultContaineeLayout:3];
  }
  v16 = [(ContaineeViewController *)self cardPresentationController];
  [v16 setGrabberBlurEnabled:1];

  v17 = [LoadingModeView alloc];
  v18 = +[NSBundle mainBundle];
  v19 = [v18 localizedStringForKey:@"Loading ..." value:@"localized string not found" table:0];
  v20 = [(LoadingModeView *)v17 initWithTitle:v19];
  loadingView = self->_loadingView;
  self->_loadingView = v20;

  [(LoadingModeView *)self->_loadingView setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (id)keyCommands
{
  v10.receiver = self;
  v10.super_class = (Class)CuratedCollectionViewController;
  v3 = [(ContaineeViewController *)&v10 keyCommands];
  id v4 = [v3 mutableCopy];

  v5 = [(CuratedCollectionViewController *)self presentedViewController];

  if (!v5)
  {
    v6 = [(CuratedCollectionViewController *)self collectionProvider];
    id v7 = [v6 keyCommands];
    [v4 addObjectsFromArray:v7];
  }
  id v8 = [v4 copy];

  return v8;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  id v7 = [(CuratedCollectionViewController *)self collectionProvider];
  id v8 = [v7 keyCommands];
  unsigned int v9 = [v8 containsObject:v6];

  if (v9)
  {
    uint64_t v10 = [(CuratedCollectionViewController *)self collectionProvider];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CuratedCollectionViewController;
    uint64_t v10 = [(CuratedCollectionViewController *)&v13 targetForAction:a3 withSender:v6];
  }
  id v11 = (void *)v10;

  return v11;
}

- (void)viewDidLoad
{
  v42.receiver = self;
  v42.super_class = (Class)CuratedCollectionViewController;
  [(ContaineeViewController *)&v42 viewDidLoad];
  v3 = [(CuratedCollectionViewController *)self view];
  [v3 setAccessibilityIdentifier:@"CuratedCollectionView"];

  id v4 = sub_100622384();
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  id v6 = sub_100622384();
  id v7 = v6;
  unint64_t v40 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "DisplayingCuratedCollectionsView", "", buf, 2u);
  }
  os_signpost_id_t spid = v5;

  [(MapsThemeTableView *)self->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
  id v8 = +[UIColor clearColor];
  [(MapsThemeTableView *)self->_tableView setBackgroundColor:v8];

  unsigned int v9 = [(MapsThemeTableView *)self->_tableView layer];
  [v9 setAllowsGroupOpacity:0];

  uint64_t v10 = [(CuratedCollectionViewController *)self fakeHeaderView];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v11 = [(CuratedCollectionViewController *)self fakeHeaderView];
  [v11 setDelegate:self];

  v12 = [(CuratedCollectionViewController *)self fakeHeaderView];
  [v12 setHairLineAlpha:0.0];

  objc_super v13 = [(ContaineeViewController *)self headerView];
  v14 = [(CuratedCollectionViewController *)self fakeHeaderView];
  [v13 addSubview:v14];

  v15 = [(CuratedCollectionViewController *)self cardHeaderView];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

  v39 = [(CuratedCollectionViewController *)self fakeHeaderView];
  v37 = [v39 topAnchor];
  v38 = [(ContaineeViewController *)self headerView];
  v36 = [v38 topAnchor];
  v35 = [v37 constraintEqualToAnchor:v36];
  v43[0] = v35;
  v34 = [(CuratedCollectionViewController *)self fakeHeaderView];
  v32 = [v34 leadingAnchor];
  v33 = [(ContaineeViewController *)self headerView];
  v31 = [v33 leadingAnchor];
  v30 = [v32 constraintEqualToAnchor:v31];
  v43[1] = v30;
  v29 = [(CuratedCollectionViewController *)self fakeHeaderView];
  v28 = [v29 trailingAnchor];
  v16 = [(ContaineeViewController *)self headerView];
  v17 = [v16 trailingAnchor];
  v18 = [v28 constraintEqualToAnchor:v17];
  v43[2] = v18;
  v19 = [(CuratedCollectionViewController *)self fakeHeaderView];
  v20 = [v19 bottomAnchor];
  v21 = [(ContaineeViewController *)self headerView];
  id v22 = [v21 bottomAnchor];
  v23 = [v20 constraintEqualToAnchor:v22];
  v43[3] = v23;
  v24 = +[NSArray arrayWithObjects:v43 count:4];
  +[NSLayoutConstraint activateConstraints:v24];

  [(CuratedCollectionViewController *)self _attachLoadingView];
  [(CuratedCollectionProvider *)self->_collectionProvider startResolvingCollection];
  v25 = sub_100622384();
  v26 = v25;
  if (v40 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_END, spid, "DisplayingCuratedCollectionsView", "", buf, 2u);
  }
}

- (void)_attachLoadingView
{
  dispatch_time_t v3 = dispatch_time(0, 200000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100622468;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CuratedCollectionViewController;
  [(CuratedCollectionViewController *)&v4 viewDidDisappear:a3];
  if ((([(CuratedCollectionViewController *)self isMovingFromParentViewController] & 1) != 0|| sub_1000BBB44(self) == 5)&& self->_wantsInsertInHistoryOnDismiss)
  {
    [(CuratedCollectionViewController *)self _insertInHistory];
  }
}

- (void)didBecomeCurrent
{
  v5.receiver = self;
  v5.super_class = (Class)CuratedCollectionViewController;
  [(ContaineeViewController *)&v5 didBecomeCurrent];
  dispatch_time_t v3 = [(CuratedCollectionViewController *)self updateContentInjection];

  if (v3)
  {
    objc_super v4 = [(CuratedCollectionViewController *)self updateContentInjection];
    ((void (**)(void, CuratedCollectionViewController *))v4)[2](v4, self);
  }
}

- (void)willChangeLayout:(unint64_t)a3
{
  if (self->_layout != a3)
  {
    self->_layout = a3;
    self->_isChangingLayout = 1;
  }
  objc_super v5 = [(ContaineeViewController *)self cardPresentationController];
  id v6 = [v5 containeeLayout];

  v16.receiver = self;
  v16.super_class = (Class)CuratedCollectionViewController;
  [(ContaineeViewController *)&v16 willChangeLayout:a3];
  if (a3 >= 2)
  {
    id v7 = [(ContaineeViewController *)self cardPresentationController];
    id v8 = [v7 containeeLayout];

    if ((unint64_t)v8 < a3) {
      [(CuratedCollectionViewAnalyticsController *)self->_analyticsController logPullUpCuratedCollectionView];
    }
  }
  [(CuratedCollectionViewController *)self _updateHeaderTransition];
  unsigned int v9 = [(CuratedCollectionViewController *)self errorView];
  uint64_t v10 = [(CuratedCollectionViewController *)self fakeHeaderView];
  [v10 frame];
  [v9 setVerticalAdjustment:-v11];

  v12 = [(ContaineeViewController *)self cardPresentationController];
  unint64_t v13 = (unint64_t)[v12 containerStyle];

  BOOL v15 = v13 - 1 < 2 || (v13 & 0xFFFFFFFFFFFFFFFELL) == 4;
  if (a3 - 3 <= 1 && v15)
  {
    if (v6) {
      [(CuratedCollectionViewController *)self _setWantsInsertInHistory];
    }
  }
}

- (void)didChangeLayout:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CuratedCollectionViewController;
  [(ContaineeViewController *)&v4 didChangeLayout:a3];
  self->_isChangingLayout = 0;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)CuratedCollectionViewController;
  id v7 = a4;
  -[ContaineeViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100622AA0;
  v8[3] = &unk_1012E81F8;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:&stru_1012F2548];
}

- (double)heightForLayout:(unint64_t)a3
{
  if (a3 == 2)
  {
    if (sub_1000BBB44(self) == 5)
    {
      id v6 = [(CuratedCollectionViewController *)self cardHeaderView];
      [v6 unscrolledHeightForLayout:4 transitionFraction:0.0];
      double v5 = v8 + 6.0;
      goto LABEL_7;
    }
LABEL_8:
    v11.receiver = self;
    v11.super_class = (Class)CuratedCollectionViewController;
    [(ContaineeViewController *)&v11 heightForLayout:a3];
    return v9;
  }
  if (a3 != 1) {
    goto LABEL_8;
  }
  double v5 = -1.0;
  if (sub_1000BBB44(self) != 5)
  {
    id v6 = [(CuratedCollectionViewController *)self cardHeaderView];
    [v6 unscrolledHeightForLayout:0 transitionFraction:0.0];
    double v5 = v7;
LABEL_7:
  }
  return v5;
}

- (void)applyAlphaToContent:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CuratedCollectionViewController;
  -[ContaineeViewController applyAlphaToContent:](&v5, "applyAlphaToContent:");
  [(MapsThemeTableView *)self->_tableView setAlpha:a3];
}

- (void)setCuratedCollection:(id)a3
{
  objc_super v5 = (GEOPlaceCollection *)a3;
  p_curatedCollection = &self->_curatedCollection;
  if (self->_curatedCollection != v5)
  {
    uint64_t v10 = v5;
    objc_storeStrong((id *)&self->_curatedCollection, a3);
    [(CuratedCollectionViewAnalyticsController *)self->_analyticsController updateWithPlaceCollection:*p_curatedCollection];
    if (([(GEOPlaceCollection *)*p_curatedCollection isSuppressed] & 1) != 0
      || [(GEOPlaceCollection *)*p_curatedCollection isBlocked])
    {
      double v7 = [(CuratedCollectionViewController *)self cardHeaderView];
      [v7 removeFromSuperview];

      [(MapsThemeTableView *)self->_tableView removeFromSuperview];
      double v8 = [(ContaineeViewController *)self cardPresentationController];
      [v8 wantsLayout:2];
    }
    else
    {
      double v8 = [(GEOPlaceCollection *)*p_curatedCollection collectionTitle];
      double v9 = [(CuratedCollectionViewController *)self fakeHeaderView];
      [v9 setTitle:v8];
    }
    objc_super v5 = v10;
  }
}

- (void)_updateHeaderAndTableViewValues
{
  if (!self->_hasFinishedResolving) {
    return;
  }
  [(CuratedCollectionHeaderView *)self->_cardHeaderView unscrolledHeightForCurrentLayout];
  double v4 = v3;
  objc_super v5 = [(ContaineeViewController *)self cardPresentationController];
  [v5 availableHeight];
  if (v4 >= v6 + -10.0)
  {
    double v7 = [(ContaineeViewController *)self cardPresentationController];
    [v7 availableHeight];
    double v4 = v8 + -10.0;
  }
  unint64_t v9 = [(CuratedCollectionHeaderView *)self->_cardHeaderView layout];
  if (v9 < 3)
  {
    uint64_t v10 = 0;
LABEL_11:
    self->_BOOL hasBeenInFullLayout = 0;
    BOOL v12 = 1;
    goto LABEL_13;
  }
  if (v9 == 3)
  {
    uint64_t v10 = (uint64_t)[(MapsThemeTableView *)self->_tableView isScrollEnabled];
    goto LABEL_11;
  }
  if (v9 == 4)
  {
    BOOL hasBeenInFullLayout = self->_hasBeenInFullLayout;
    uint64_t v10 = 1;
    self->_BOOL hasBeenInFullLayout = 1;
    BOOL v12 = !hasBeenInFullLayout;
  }
  else
  {
    BOOL v12 = 0;
    uint64_t v10 = 1;
  }
LABEL_13:
  [(MapsThemeTableView *)self->_tableView setScrollEnabled:v10];
  [(CuratedCollectionProvider *)self->_collectionProvider subheaderFrame];
  [(CuratedCollectionHeaderView *)self->_cardHeaderView setTableViewSubheaderContentHeight:CGRectGetMaxY(v18)];
  [(MapsThemeTableView *)self->_tableView contentOffset];
  if (v12) {
    double v14 = -v4;
  }
  else {
    double v14 = v13;
  }
  BOOL v15 = [(CuratedCollectionViewController *)self view];
  [v15 safeAreaInsets];
  -[MapsThemeTableView setContentInset:](self->_tableView, "setContentInset:", v4, 0.0);

  if (v12) {
    -[MapsThemeTableView setContentOffset:](self->_tableView, "setContentOffset:", 0.0, v14);
  }
  cardHeaderView = self->_cardHeaderView;

  [(CuratedCollectionHeaderView *)cardHeaderView setTableViewContentOffset:v14];
}

- (void)viewSafeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)CuratedCollectionViewController;
  [(CuratedCollectionViewController *)&v3 viewSafeAreaInsetsDidChange];
  [(CuratedCollectionViewController *)self _updateHeaderAndTableViewValues];
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)CuratedCollectionViewController;
  [(ContaineeViewController *)&v6 viewDidLayoutSubviews];
  if (-[ContainerViewController delaysFirstCardPresentation]_0()) {
    [(CuratedCollectionViewController *)self _updateHeaderTransition];
  }
  objc_super v3 = [(CuratedCollectionViewController *)self cardHeaderView];
  [v3 bounds];
  double MaxY = CGRectGetMaxY(v7);
  objc_super v5 = [(CuratedCollectionViewController *)self view];
  [v5 safeAreaInsets];
  -[MapsThemeTableView setScrollIndicatorInsets:](self->_tableView, "setScrollIndicatorInsets:", MaxY, 0.0);
}

- (void)handleDismissAction:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(CuratedCollectionViewController *)self curatedCollection];
  if (![v5 isSuppressed]) {
    goto LABEL_4;
  }
  objc_super v6 = +[CuratedCollectionSyncManager sharedManager];
  CGRect v7 = [(CuratedCollectionViewController *)self curatedCollection];
  unsigned int v8 = [v6 collectionIsSaved:v7];

  if (v8)
  {
    objc_super v5 = +[CuratedCollectionSyncManager sharedManager];
    unint64_t v9 = [(CuratedCollectionViewController *)self curatedCollection];
    [v5 removeSavedCuratedCollection:v9 completion:0];

LABEL_4:
  }
  v11.receiver = self;
  v11.super_class = (Class)CuratedCollectionViewController;
  [(ContaineeViewController *)&v11 handleDismissAction:v4];
  uint64_t v10 = [(CuratedCollectionViewController *)self analyticsController];
  [v10 logClose];
}

- (void)_updateHeaderTransition
{
  double v3 = 1.0;
  double v4 = 0.0;
  if (sub_1000BBB44(self) == 5
    || ([(ContaineeViewController *)self cardPresentationController],
        objc_super v5 = objc_claimAutoreleasedReturnValue(),
        id v6 = [v5 containerStyle],
        v5,
        v6 == (id)6))
  {
    uint64_t v7 = 4;
  }
  else
  {
    uint64_t v10 = [(ContaineeViewController *)self cardPresentationController];
    [v10 transitionProgressFromLayout:2 toLayout:3];
    double v12 = v11;

    double v13 = [(ContaineeViewController *)self cardPresentationController];
    [v13 transitionProgressFromLayout:1 toLayout:2];
    double v4 = v14;

    BOOL v15 = [(ContaineeViewController *)self cardPresentationController];
    id v16 = [v15 containerStyle];

    if (v16 == (id)4)
    {
      v17 = [(ContaineeViewController *)self cardPresentationController];
      [v17 transitionProgressFromLayout:1 toLayout:3];
      double v19 = v18;

      if (v19 < 0.5) {
        double v12 = 0.0;
      }
      else {
        double v12 = v19 + -0.5 + v19 + -0.5;
      }
      if (v19 < 0.5) {
        double v4 = v19 + v19;
      }
      else {
        double v4 = 1.0;
      }
    }
    double v3 = 0.0;
    if (v12 == 0.0 && v4 == 0.0)
    {
      uint64_t v7 = 0;
      double v4 = 0.0;
    }
    else if (v12 == 0.0 && v4 < 1.0)
    {
      uint64_t v7 = 1;
    }
    else if (v12 > 0.0 && v12 < 1.0 && v4 == 1.0)
    {
      uint64_t v7 = 3;
      double v4 = v12;
      double v3 = v12;
    }
    else
    {
      double v4 = 0.0;
      if (v12 == 1.0) {
        double v3 = 1.0;
      }
      else {
        double v3 = 0.0;
      }
      if (v12 == 1.0) {
        uint64_t v7 = 4;
      }
      else {
        uint64_t v7 = 2;
      }
    }
  }
  unsigned int v8 = [(CuratedCollectionViewController *)self cardHeaderView];
  [v8 setLayout:v7 transitionFraction:v4];

  [(CuratedCollectionViewController *)self _updateHeaderAndTableViewValues];
  collectionProvider = self->_collectionProvider;

  [(CuratedCollectionProvider *)collectionProvider setSubheaderTransitionFraction:v3];
}

- (void)_setWantsInsertInHistory
{
  if (sub_1000BBB44(self) == 5)
  {
    self->_wantsInsertInHistoryOnDismiss = 1;
  }
  else
  {
    [(CuratedCollectionViewController *)self _insertInHistory];
  }
}

- (void)_insertInHistory
{
  if (!self->_didInsertInHistory && self->_hasFinishedResolving)
  {
    double v3 = [(CuratedCollectionViewController *)self curatedCollection];
    +[HistoryEntryRecentsItem saveCuratedCollection:v3 completion:&stru_1012F2568];

    self->_didInsertInHistory = 1;
  }
}

- (id)menuForQuickActionButton
{
  double v3 = +[NSMutableArray array];
  objc_initWeak(&location, self);
  if (+[LibraryUIUtilities isMyPlacesEnabled])
  {
    double v4 = +[NSBundle mainBundle];
    [v4 localizedStringForKey:@"Save_Curated_Collection_Library_Mac_Menu_Item" value:@"localized string not found" table:0];
  }
  else
  {
    double v4 = +[NSBundle mainBundle];
    [v4 localizedStringForKey:@"Save_Curated_Collection_Mac_Menu_Item" value:@"localized string not found" table:0];
  v30 = };

  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100623BD0;
  v39[3] = &unk_1012E8CD0;
  objc_copyWeak(&v40, &location);
  v28 = +[UIAction actionWithTitle:v30 image:0 identifier:0 handler:v39];
  v45 = v28;
  objc_super v5 = +[NSArray arrayWithObjects:&v45 count:1];
  v29 = +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:0 options:1 children:v5];

  [v3 addObject:v29];
  id v6 = +[NSBundle mainBundle];
  uint64_t v7 = [v6 localizedStringForKey:@"See_Publishers_Guides_Mac_Menu_Item" value:@"localized string not found" table:0];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100623C10;
  v37[3] = &unk_1012E8CD0;
  objc_copyWeak(&v38, &location);
  unsigned int v8 = +[UIAction actionWithTitle:v7 image:0 identifier:0 handler:v37];

  unint64_t v9 = +[NSBundle mainBundle];
  uint64_t v10 = [v9 localizedStringForKey:@"See_All_Guides_Mac_Menu_Item" value:@"localized string not found" table:0];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100623C50;
  v35[3] = &unk_1012E8CD0;
  objc_copyWeak(&v36, &location);
  double v11 = +[UIAction actionWithTitle:v10 image:0 identifier:0 handler:v35];

  v44[0] = v8;
  v44[1] = v11;
  uint64_t v12 = +[NSArray arrayWithObjects:v44 count:2];
  double v13 = +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:0 options:1 children:v12];

  [v3 addObject:v13];
  double v14 = [(CuratedCollectionViewController *)self _websiteURL];
  LOBYTE(v12) = v14 == 0;

  if ((v12 & 1) == 0)
  {
    BOOL v15 = +[NSBundle mainBundle];
    id v16 = [v15 localizedStringForKey:@"Collections_Website_Mac_Menu_Item" value:@"localized string not found" table:0];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100623C90;
    v33[3] = &unk_1012E8CD0;
    objc_copyWeak(&v34, &location);
    v17 = +[UIAction actionWithTitle:v16 image:0 identifier:0 handler:v33];

    v43 = v17;
    double v18 = +[NSArray arrayWithObjects:&v43 count:1];
    double v19 = +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:0 options:1 children:v18];

    [v3 addObject:v19];
    objc_destroyWeak(&v34);
  }
  v20 = +[MapsMenuBuilder sendToDeviceAndShareMenuWithSendToDeviceEnabled:1];
  [v3 addObject:v20];

  v21 = +[NSBundle mainBundle];
  id v22 = [v21 localizedStringForKey:@"Report_an_Issue_Mac_Menu_Item" value:@"localized string not found" table:0];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100623CD0;
  v31[3] = &unk_1012E8CD0;
  objc_copyWeak(&v32, &location);
  v23 = +[UIAction actionWithTitle:v22 image:0 identifier:0 handler:v31];

  objc_super v42 = v23;
  v24 = +[NSArray arrayWithObjects:&v42 count:1];
  v25 = +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:0 options:1 children:v24];

  [v3 addObject:v25];
  v26 = +[UIMenu menuWithChildren:v3];

  objc_destroyWeak(&v32);
  objc_destroyWeak(&v36);

  objc_destroyWeak(&v38);
  objc_destroyWeak(&v40);

  objc_destroyWeak(&location);

  return v26;
}

- (id)_websiteURL
{
  double v3 = [(CuratedCollectionViewController *)self curatedCollection];
  double v4 = [v3 publisherCollectionURL];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v6 = [(CuratedCollectionViewController *)self curatedCollection];
    uint64_t v7 = [v6 publisher];
    unsigned int v8 = [v7 publisherAttribution];
    id v5 = [v8 websiteURL];

    if (v5) {
      id v9 = v5;
    }
  }

  return v5;
}

- (void)headerViewBrickTapped
{
  id v2 = [(ContaineeViewController *)self cardPresentationController];
  [v2 wantsExpandLayout];
}

- (void)headerViewPublisherLogoTapped
{
  double v3 = [(CuratedCollectionViewController *)self analyticsController];
  [v3 logDiscoverMoreFromPublisher];

  id v6 = [(ControlContaineeViewController *)self delegate];
  double v4 = [(CuratedCollectionViewController *)self curatedCollection];
  id v5 = [v4 publisher];
  [v6 viewControllerShowPublisher:v5];
}

- (void)websiteMenuButtonTapped
{
  id v4 = [(CuratedCollectionViewController *)self _websiteURL];
  if (v4)
  {
    double v3 = [(ControlContaineeViewController *)self delegate];
    [v3 viewController:self openURL:v4];

    [(CuratedCollectionViewAnalyticsController *)self->_analyticsController logOpenWebsite];
  }
}

- (void)seeAllGuidesMenuButtonTapped
{
  id v2 = [(ControlContaineeViewController *)self delegate];
  [v2 viewControllerShowAllCollections];
}

- (void)reportAnIssueMenuButtonTapped
{
}

- (void)scrollViewDidScroll:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CuratedCollectionViewController;
  [(ContaineeViewController *)&v6 scrollViewDidScroll:a3];
  id v4 = [(CuratedCollectionViewController *)self collectionProvider];
  unsigned __int8 v5 = [v4 isApplyingSnapshot];

  if ((v5 & 1) == 0) {
    [(CuratedCollectionViewController *)self _updateHeaderAndTableViewValues];
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  [(CuratedCollectionHeaderView *)self->_cardHeaderView minimumScrolledHeight];
  if (a5->y < -v10)
  {
    if (y >= 0.0)
    {
      if (y <= 0.0) {
        goto LABEL_7;
      }
      double v12 = 1.0 - v10;
    }
    else
    {
      [v9 contentInset];
      double v12 = -v11;
    }
    a5->double y = v12;
  }
LABEL_7:
  v14.receiver = self;
  v14.super_class = (Class)CuratedCollectionViewController;
  -[ContaineeViewController scrollViewWillEndDragging:withVelocity:targetContentOffset:](&v14, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v9, a5, x, y);
  if (y > 0.0)
  {
    double v13 = [(CuratedCollectionViewController *)self analyticsController];
    [v13 logScrollDown];
LABEL_11:

    goto LABEL_12;
  }
  if (y < 0.0)
  {
    double v13 = [(CuratedCollectionViewController *)self analyticsController];
    [v13 logScrollUp];
    goto LABEL_11;
  }
LABEL_12:
  [(CuratedCollectionViewController *)self _setWantsInsertInHistory];
}

- (id)_searchResults
{
  double v3 = +[NSMutableArray array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = [(CuratedCollectionViewController *)self collectionProvider];
  unsigned __int8 v5 = [v4 collectionItems];

  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        double v11 = [SearchResult alloc];
        double v12 = [v10 mapItem];
        double v13 = [(SearchResult *)v11 initWithMapItem:v12];

        [(SearchResultRepr *)v13 setHasIncompleteMetadata:1];
        [v3 addObject:v13];
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  id v14 = [v3 copy];

  return v14;
}

- (void)addContentToMapView
{
  double v3 = sub_100622384();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  unsigned __int8 v5 = sub_100622384();
  id v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "AddingContentToMapView", "", buf, 2u);
  }

  id v7 = [(CuratedCollectionViewController *)self _searchResults];
  uint64_t v8 = +[SearchInfo searchInfoWithResults:v7];
  id v9 = [(ControlContaineeViewController *)self delegate];
  double v10 = [v9 searchPinsManager];
  [v10 setSearchPinsFromSearchInfo:v8 scrollToResults:1 displayPlaceCardForResult:0 animated:1 completion:0];

  double v11 = sub_100622384();
  double v12 = v11;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)double v13 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, v4, "AddingContentToMapView", "", v13, 2u);
  }
}

- (void)removeContentFromMapView
{
  if ([(CuratedCollectionViewController *)self shouldClearSearchPins])
  {
    id v4 = [(ControlContaineeViewController *)self delegate];
    double v3 = [v4 searchPinsManager];
    [v3 clearSearchPins];
  }
}

- (BOOL)shouldClearSearchPins
{
  double v3 = [(ControlContaineeViewController *)self delegate];
  id v4 = [v3 searchPinsManager];
  unsigned __int8 v5 = [v4 allSearchResults];

  id v6 = [(CuratedCollectionViewController *)self _searchResults];
  LOBYTE(v3) = [v5 isEqualToArray:v6];

  return (char)v3;
}

- (void)dataSourceUpdated:(id)a3
{
  if (!self->_hasFinishedResolving)
  {
    self->_hasFinishedResolving = 1;
    [(CuratedCollectionViewController *)self _didFinishResolving];
  }
}

- (void)_didFinishResolving
{
  double v3 = [(CuratedCollectionViewController *)self collectionProvider];
  id v4 = [v3 curatedCollection];
  [(CuratedCollectionViewController *)self setCuratedCollection:v4];

  unsigned __int8 v5 = [(CuratedCollectionViewController *)self updateContentInjection];

  if (v5)
  {
    id v6 = [(CuratedCollectionViewController *)self updateContentInjection];
    ((void (**)(void, CuratedCollectionViewController *))v6)[2](v6, self);
  }
  id v7 = [(CuratedCollectionViewController *)self loadingView];
  [v7 removeFromSuperview];

  uint64_t v8 = [(CuratedCollectionViewController *)self errorView];
  [v8 removeFromSuperview];

  id v9 = [(CuratedCollectionViewController *)self view];
  [v9 addSubview:self->_tableView];

  double v10 = [(CuratedCollectionViewController *)self view];
  double v11 = [(CuratedCollectionViewController *)self cardHeaderView];
  [v10 addSubview:v11];

  double v12 = [(CuratedCollectionViewController *)self fakeHeaderView];
  [v12 setAlpha:1.0];

  double v13 = [(CuratedCollectionViewController *)self cardHeaderView];
  [v13 setAlpha:0.0];

  [(MapsThemeTableView *)self->_tableView setAlpha:0.0];
  id v14 = [(CuratedCollectionViewController *)self cardHeaderView];
  BOOL v15 = [v14 tableViewBackgroundView];
  [(MapsThemeTableView *)self->_tableView setBackgroundView:v15];

  [(MapsThemeTableView *)self->_tableView setContentInsetAdjustmentBehavior:2];
  [(MapsThemeTableView *)self->_tableView setAutomaticallyAdjustsScrollIndicatorInsets:0];
  v51 = [(CuratedCollectionViewController *)self cardHeaderView];
  v49 = [v51 topAnchor];
  v50 = [(CuratedCollectionViewController *)self view];
  v48 = [v50 topAnchor];
  v47 = [v49 constraintEqualToAnchor:v48];
  v54[0] = v47;
  v46 = [(CuratedCollectionViewController *)self cardHeaderView];
  v44 = [v46 leadingAnchor];
  v45 = [(CuratedCollectionViewController *)self view];
  v43 = [v45 leadingAnchor];
  objc_super v42 = [v44 constraintEqualToAnchor:v43];
  v54[1] = v42;
  v41 = [(CuratedCollectionViewController *)self cardHeaderView];
  v39 = [v41 trailingAnchor];
  id v40 = [(CuratedCollectionViewController *)self view];
  id v38 = [v40 trailingAnchor];
  v37 = [v39 constraintEqualToAnchor:v38];
  v54[2] = v37;
  v35 = [(MapsThemeTableView *)self->_tableView topAnchor];
  id v36 = [(CuratedCollectionViewController *)self view];
  id v34 = [v36 topAnchor];
  v33 = [v35 constraintEqualToAnchor:v34];
  v54[3] = v33;
  v31 = [(MapsThemeTableView *)self->_tableView leadingAnchor];
  id v32 = [(CuratedCollectionViewController *)self view];
  v30 = [v32 leadingAnchor];
  v29 = [v31 constraintEqualToAnchor:v30];
  v54[4] = v29;
  long long v16 = [(MapsThemeTableView *)self->_tableView trailingAnchor];
  long long v17 = [(CuratedCollectionViewController *)self view];
  long long v18 = [v17 trailingAnchor];
  long long v19 = [v16 constraintEqualToAnchor:v18];
  v54[5] = v19;
  v20 = [(MapsThemeTableView *)self->_tableView bottomAnchor];
  v21 = [(CuratedCollectionViewController *)self view];
  id v22 = [v21 bottomAnchor];
  v23 = [v20 constraintEqualToAnchor:v22];
  v54[6] = v23;
  v24 = +[NSArray arrayWithObjects:v54 count:7];
  +[NSLayoutConstraint activateConstraints:v24];

  v25 = [(CuratedCollectionViewController *)self view];
  [v25 layoutIfNeeded];

  curatedCollection = self->_curatedCollection;
  v27 = [(CuratedCollectionViewController *)self cardHeaderView];
  [v27 setCuratedCollection:curatedCollection];

  [(CuratedCollectionViewController *)self _updateHeaderTransition];
  v28 = [(ContaineeViewController *)self cardPresentationController];
  [v28 updateHeightForCurrentLayout];

  [(CuratedCollectionViewController *)self _updateHeaderAndTableViewValues];
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_100624B54;
  v53[3] = &unk_1012E5D08;
  v53[4] = self;
  +[UIView performWithoutAnimation:v53];
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_100624BA8;
  v52[3] = &unk_1012E5D08;
  v52[4] = self;
  +[UIView animateWithDuration:2 delay:v52 options:0 animations:0.3 completion:0.0];
}

- (void)dataSource:(id)a3 itemFocused:(id)a4
{
  id v11 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v11;
    id v6 = [SearchResult alloc];
    id v7 = [v5 mapItem];

    uint64_t v8 = [(SearchResult *)v6 initWithMapItem:v7];
    id v9 = [(ControlContaineeViewController *)self delegate];
    [v9 viewController:self focusSearchResult:v8];

    id lastItemTapped = self->_lastItemTapped;
    self->_id lastItemTapped = 0;
  }
  else
  {
    if (self->_lastItemTapped) {
      goto LABEL_6;
    }
    uint64_t v8 = [(ControlContaineeViewController *)self delegate];
    [(SearchResult *)v8 viewControllerRemoveSearchResultFocus:self];
  }

LABEL_6:
}

- (void)dataSource:(id)a3 itemTapped:(id)a4
{
  id v15 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v15;
    id v6 = [(CuratedCollectionProvider *)self->_collectionProvider collectionItems];
    id v7 = [v6 indexOfObject:v5];

    uint64_t v8 = [(CuratedCollectionViewController *)self analyticsController];
    [v8 logTapCollectionItem:v5 atIndex:v7];

    id v9 = [SearchResult alloc];
    double v10 = [v5 mapItem];
    id v11 = [(SearchResult *)v9 initWithMapItem:v10];

    double v12 = [(ControlContaineeViewController *)self delegate];
    double v13 = [v12 mapSelectionManager];
    [v13 selectSearchResult:v11 animated:1];

    id lastItemTapped = self->_lastItemTapped;
    self->_id lastItemTapped = v5;
  }
}

- (void)dataSource:(id)a3 addPlaceToLibraryUsingCoordinator:(id)a4
{
  id v5 = a4;
  id v6 = [v5 initialMapItem];
  +[LibraryAnalytics captureAddOrRemoveFromLibraryWithPlaceMUID:captureAdd:target:](_TtC4Maps16LibraryAnalytics, "captureAddOrRemoveFromLibraryWithPlaceMUID:captureAdd:target:", [v6 _muid], 1, 259);

  id v7 = [v5 initialMapItem];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100624F60;
  v9[3] = &unk_1012E7610;
  id v10 = v5;
  id v8 = v5;
  [(CuratedCollectionViewController *)self _refineMapItem:v7 completionHandler:v9];
}

- (void)dataSource:(id)a3 removePlaceFromLibraryUsingCoordinator:(id)a4
{
  id v6 = a4;
  id v5 = [v6 initialMapItem];
  +[LibraryAnalytics captureAddOrRemoveFromLibraryWithPlaceMUID:captureAdd:target:](_TtC4Maps16LibraryAnalytics, "captureAddOrRemoveFromLibraryWithPlaceMUID:captureAdd:target:", [v5 _muid], 0, 259);

  [v6 deletePlaceFromLibraryWithViewControllerForPresentingAlert:self];
}

- (void)dataSource:(id)a3 addToUserCollection:(id)a4 forMapItem:(id)a5 sourceView:(id)a6 onSaveCompletion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  long long v17 = [(CuratedCollectionViewController *)self analyticsController];
  [v17 logSavePlaceItemToCuratedCollectionWithMUID:[v14 _muid]];

  objc_initWeak(&location, self);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100625260;
  v21[3] = &unk_1012F2590;
  id v18 = v13;
  id v22 = v18;
  id v19 = v16;
  id v25 = v19;
  v23 = self;
  objc_copyWeak(&v26, &location);
  id v20 = v15;
  id v24 = v20;
  [(CuratedCollectionViewController *)self _refineMapItem:v14 completionHandler:v21];

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

- (void)dataSource:(id)a3 didFailWithErrorState:(unint64_t)a4
{
  id v36 = a3;
  self->_hasFinishedResolving = 1;
  id v6 = [(CuratedCollectionViewController *)self errorView];

  if (!v6)
  {
    id v7 = objc_alloc_init(ErrorModeView);
    [(CuratedCollectionViewController *)self setErrorView:v7];

    id v8 = [(CuratedCollectionViewController *)self errorView];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  switch(a4)
  {
    case 0uLL:
      id v9 = [(CuratedCollectionViewController *)self errorView];
      id v10 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubhead];
      [v9 setTitleLabelFont:v10];

      id v11 = +[NSBundle mainBundle];
      id v38 = [v11 localizedStringForKey:@"[Brooklyn] Generic Guide Error Title" value:@"localized string not found" table:0];
      goto LABEL_9;
    case 1uLL:
      id v20 = [(CuratedCollectionViewController *)self errorView];
      v21 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubhead];
      [v20 setTitleLabelFont:v21];

      id v11 = +[NSBundle mainBundle];
      id v38 = [v11 localizedStringForKey:@"[Brooklyn] Blocked Guide Error Title" value:@"localized string not found" table:0];
      goto LABEL_9;
    case 2uLL:
      id v12 = [(CuratedCollectionViewController *)self errorView];
      id v13 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubhead];
      [v12 setTitleLabelFont:v13];

      id v11 = +[NSBundle mainBundle];
      id v38 = [v11 localizedStringForKey:@"[Brooklyn] Suppressed Guide Error" value:@"localized string not found" table:0];
LABEL_9:

      v37 = 0;
      break;
    case 3uLL:
      id v14 = +[NSBundle mainBundle];
      v37 = [v14 localizedStringForKey:@"[Brooklyn] Unable to Open Guide" value:@"localized string not found" table:0];

      id v15 = +[NSBundle mainBundle];
      id v38 = [v15 localizedStringForKey:@"[Brooklyn] Internet Guide Error Title" value:@"localized string not found" table:0];

      objc_initWeak(&location, self);
      id v16 = [(CuratedCollectionViewController *)self errorView];
      long long v17 = +[NSBundle mainBundle];
      id v18 = [v17 localizedStringForKey:@"Try Again [Brooklyn]" value:@"localized string not found" table:0];
      id v19 = +[UIColor systemGray5Color];
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472;
      v56[2] = sub_100625E6C;
      v56[3] = &unk_1012EE310;
      objc_copyWeak(&v57, &location);
      [v16 setButtonTitle:v18 glyphName:@"arrow.clockwise" backgroundColor:v19 handler:v56];

      objc_destroyWeak(&v57);
      objc_destroyWeak(&location);
      break;
    default:
      v37 = 0;
      id v38 = 0;
      break;
  }
  id v22 = [(CuratedCollectionViewController *)self loadingView];
  [v22 removeFromSuperview];

  v23 = [(CuratedCollectionViewController *)self cardHeaderView];
  [v23 removeFromSuperview];

  id v24 = [(ContaineeViewController *)self contentView];
  id v25 = [(CuratedCollectionViewController *)self errorView];
  [v24 addSubview:v25];

  v55 = [(CuratedCollectionViewController *)self errorView];
  v53 = [v55 leadingAnchor];
  v54 = [(ContaineeViewController *)self contentView];
  v52 = [v54 leadingAnchor];
  v51 = [v53 constraintEqualToAnchor:v52];
  v59[0] = v51;
  v50 = [(CuratedCollectionViewController *)self errorView];
  v48 = [v50 trailingAnchor];
  v49 = [(ContaineeViewController *)self contentView];
  v47 = [v49 trailingAnchor];
  v46 = [v48 constraintEqualToAnchor:v47];
  v59[1] = v46;
  v45 = [(CuratedCollectionViewController *)self errorView];
  v43 = [v45 topAnchor];
  v44 = [(ContaineeViewController *)self contentView];
  objc_super v42 = [v44 topAnchor];
  v41 = [v43 constraintEqualToAnchor:v42];
  v59[2] = v41;
  id v40 = [(CuratedCollectionViewController *)self errorView];
  v39 = [v40 bottomAnchor];
  id v26 = [(ContaineeViewController *)self contentView];
  v27 = [v26 bottomAnchor];
  v28 = [v39 constraintEqualToAnchor:v27];
  v59[3] = v28;
  v29 = [(CuratedCollectionViewController *)self errorView];
  v30 = [v29 heightAnchor];
  v31 = [(ContaineeViewController *)self contentView];
  id v32 = [v31 heightAnchor];
  v33 = [v30 constraintEqualToAnchor:v32];
  v59[4] = v33;
  id v34 = +[NSArray arrayWithObjects:v59 count:5];
  +[NSLayoutConstraint activateConstraints:v34];

  v35 = [(CuratedCollectionViewController *)self errorView];
  [v35 setTitle:v37 andMessage:v38];
}

- (void)dataSource:(id)a3 willPunchOuToPublisherWebpageForPlaceCollectionItem:(id)a4
{
  id v5 = a4;
  id v6 = [(CuratedCollectionViewController *)self collectionProvider];
  id v7 = [v6 collectionItems];
  id v8 = [v7 indexOfObject:v5];

  id v9 = [(CuratedCollectionViewController *)self analyticsController];
  [v9 logPunchOutToPublisherReviewWithIndex:v8];
}

- (void)dataSource:(id)a3 didExpandCellAnimated:(BOOL)a4
{
  double v4 = 0.3;
  if (!a4) {
    double v4 = 0.0;
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100626058;
  v5[3] = &unk_1012E5D08;
  v5[4] = self;
  +[UIView animateWithDuration:v5 animations:v4];
}

- (void)presentRAPWithSourceView:(id)a3
{
  id v4 = a3;
  id v5 = [RAPCuratedCollectionContext alloc];
  id v6 = [(CuratedCollectionViewController *)self curatedCollection];
  id v7 = [(CuratedCollectionViewController *)self collectionProvider];
  id v8 = [v7 collectionItems];
  id v12 = [(RAPCuratedCollectionContext *)v5 initWithCuratedCollection:v6 placeCollectionMapItems:v8];

  id v9 = [(CuratedCollectionViewController *)self _maps_mapsSceneDelegate];
  id v10 = [v9 rapPresenter];
  [v10 presentCuratedCollectionRAPWithContext:v12 sourceView:v4 completion:0];

  id v11 = [(CuratedCollectionViewController *)self analyticsController];
  [v11 logReportAProblem];
}

- (void)showPublisherView:(id)a3
{
  id v4 = a3;
  id v5 = [(CuratedCollectionViewController *)self analyticsController];
  [v5 logDiscoverMoreFromPublisher];

  id v6 = [(ControlContaineeViewController *)self delegate];
  [v6 viewControllerShowPublisher:v4];
}

- (void)dataSource:(id)a3 openAppClip:(id)a4
{
  id v5 = a4;
  id v6 = [v5 appClipURL];
  id v7 = [(CuratedCollectionViewController *)self analyticsController];
  [v7 logOpenAppClipWithURL:v6];

  id v8 = +[MKClipServices sharedInstance];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10062631C;
  v10[3] = &unk_1012E6438;
  id v11 = v6;
  id v9 = v6;
  [v8 requestAppClip:v5 completion:v10];
}

- (void)_refineMapItem:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ControlContaineeViewController *)self delegate];
  id v11 = [v8 newTraits];

  id v9 = +[MKMapService sharedService];
  id v10 = [v9 ticketForMapItemToRefine:v7 traits:v11];

  [v10 submitWithHandler:v6 networkActivity:0];
}

- (void)didSelectSaveCollection
{
  double v3 = [(CuratedCollectionViewController *)self analyticsController];
  [v3 logSaveCuratedCollection];

  id v5 = +[CuratedCollectionSyncManager sharedManager];
  id v4 = [(CuratedCollectionViewController *)self curatedCollection];
  [v5 addSavedCuratedCollection:v4 completion:0];
}

- (void)didSelectRemoveFromSavedCollection
{
  double v3 = [(CuratedCollectionViewController *)self analyticsController];
  [v3 logRemoveCuratedCollection];

  id v5 = +[CuratedCollectionSyncManager sharedManager];
  id v4 = [(CuratedCollectionViewController *)self curatedCollection];
  [v5 removeSavedCuratedCollection:v4 completion:0];
}

- (NSArray)mapItems
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(CuratedCollectionViewController *)self collectionProvider];
  id v5 = [v4 collectionItems];

  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) mapItem];
        [v3 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = [v3 copy];

  return (NSArray *)v11;
}

- (void)didSelectShareFromView:(id)a3
{
  id v4 = a3;
  id v5 = [(CuratedCollectionViewController *)self analyticsController];
  [v5 logShareCuratedCollection];

  id v10 = [(ControlContaineeViewController *)self delegate];
  id v6 = [v10 appCoordinator];
  id v7 = [(CuratedCollectionViewController *)self curatedCollection];
  uint64_t v8 = [(CuratedCollectionViewController *)self mapItems];
  id v9 = [v8 copy];
  [v6 shareCuratedCollection:v7 withRefinedMapItems:v9 sourceView:v4 completion:0];
}

- (void)didSelectOpenHomePage
{
  id v3 = [(CuratedCollectionViewController *)self curatedCollection];
  id v5 = [v3 publisherCollectionURL];

  id v4 = [(ControlContaineeViewController *)self delegate];
  [v4 viewController:self openURL:v5];

  [(CuratedCollectionViewAnalyticsController *)self->_analyticsController logOpenWebsite];
}

- (UIScrollView)pptTestScrollView
{
  return (UIScrollView *)self->_tableView;
}

- (id)updateContentInjection
{
  return self->_updateContentInjection;
}

- (void)setUpdateContentInjection:(id)a3
{
}

- (GEOPlaceCollection)curatedCollection
{
  return self->_curatedCollection;
}

- (CuratedCollectionProvider)collectionProvider
{
  return self->_collectionProvider;
}

- (void)setCollectionProvider:(id)a3
{
}

- (ContainerHeaderView)fakeHeaderView
{
  return self->_fakeHeaderView;
}

- (void)setFakeHeaderView:(id)a3
{
}

- (CuratedCollectionHeaderView)cardHeaderView
{
  return self->_cardHeaderView;
}

- (void)setCardHeaderView:(id)a3
{
}

- (CuratedCollectionViewAnalyticsController)analyticsController
{
  return self->_analyticsController;
}

- (void)setAnalyticsController:(id)a3
{
}

- (ErrorModeView)errorView
{
  return self->_errorView;
}

- (void)setErrorView:(id)a3
{
}

- (LoadingModeView)loadingView
{
  return self->_loadingView;
}

- (void)setLoadingView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_errorView, 0);
  objc_storeStrong((id *)&self->_analyticsController, 0);
  objc_storeStrong((id *)&self->_cardHeaderView, 0);
  objc_storeStrong((id *)&self->_fakeHeaderView, 0);
  objc_storeStrong((id *)&self->_collectionProvider, 0);
  objc_storeStrong((id *)&self->_curatedCollection, 0);
  objc_storeStrong(&self->_updateContentInjection, 0);
  objc_storeStrong(&self->_lastItemTapped, 0);
  objc_storeStrong((id *)&self->_collectionEditSession, 0);

  objc_storeStrong((id *)&self->_tableView, 0);
}

@end