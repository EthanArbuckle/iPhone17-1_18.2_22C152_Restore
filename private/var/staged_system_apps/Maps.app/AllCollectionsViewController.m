@interface AllCollectionsViewController
- (AllCollectionsAPIController)apiController;
- (AllCollectionsDataSource)dataSource;
- (AllCollectionsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (ContainerHeaderView)titleHeaderView;
- (ErrorModeView)errorView;
- (GEOMapServiceTraits)traits;
- (LoadingModeView)loadingView;
- (NSArray)sections;
- (NSDiffableDataSourceSnapshot)snapshot;
- (UICollectionView)collectionView;
- (UICollectionViewCompositionalLayout)flowLayout;
- (double)heightForLayout:(unint64_t)a3;
- (id)createLayoutUsingWidth:(double)a3;
- (void)activateConstraintsForViewPinnedBelowHeader:(id)a3;
- (void)activateHeaderConstraints;
- (void)addAllCollectionsView;
- (void)addErrorView;
- (void)addHeaderView;
- (void)addLoadingView;
- (void)didChangeLayout:(unint64_t)a3;
- (void)handleDismissAction:(id)a3;
- (void)initializeDataSource;
- (void)initializeSections;
- (void)onTransitionFromState:(int64_t)a3 toState:(int64_t)a4;
- (void)pptPresentFirstCollection;
- (void)removeCollectionView;
- (void)removeErrorView;
- (void)removeLoadingView;
- (void)resetCollectionViewLayout;
- (void)routeToCuratedCollection:(id)a3;
- (void)setApiController:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setErrorView:(id)a3;
- (void)setFlowLayout:(id)a3;
- (void)setLoadingView:(id)a3;
- (void)setSections:(id)a3;
- (void)setSnapshot:(id)a3;
- (void)setTitleHeaderView:(id)a3;
- (void)setTraits:(id)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation AllCollectionsViewController

- (AllCollectionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)AllCollectionsViewController;
  v4 = [(AllCollectionsViewController *)&v11 initWithNibName:0 bundle:0];
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = sub_1000BBB44(v4);
    v7 = [(ContaineeViewController *)v5 cardPresentationController];
    v8 = v7;
    if (v6 == 5)
    {
      [v7 setAllowResizeInFloatingStyle:1];

      v9 = [(ContaineeViewController *)v5 cardPresentationController];
      [v9 setDefaultContaineeLayout:3];
    }
    else
    {
      [v7 setPresentedModally:1];

      v9 = [(ContaineeViewController *)v5 cardPresentationController];
      [v9 setTakesAvailableHeight:1];
    }
  }
  return v5;
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)AllCollectionsViewController;
  [(ContaineeViewController *)&v11 viewDidLoad];
  objc_initWeak(&location, self);
  v3 = [AllCollectionsAPIController alloc];
  objc_copyWeak(&v9, &location);
  v4 = [(AllCollectionsViewController *)self traits];
  v5 = [(AllCollectionsAPIController *)v3 initWithOnStateChangeHandler:&v8 usingTraits:v4];
  [(AllCollectionsViewController *)self setApiController:v5];

  uint64_t v6 = [(AllCollectionsViewController *)self view];
  [v6 setAccessibilityIdentifier:@"AllCollections"];

  v7 = [(AllCollectionsViewController *)self apiController];
  [v7 fetchAllCollectionsViewForKeywordFilter:0 addressFilter:0 onCompletion:&stru_101313348];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AllCollectionsViewController;
  [(ContaineeViewController *)&v5 viewWillDisappear:a3];
  v4 = [(AllCollectionsViewController *)self apiController];
  [v4 cancelFetchingAllCollections];
}

- (void)didChangeLayout:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AllCollectionsViewController;
  [(ContaineeViewController *)&v6 didChangeLayout:a3];
  v4 = [(AllCollectionsViewController *)self collectionView];

  if (v4)
  {
    [(AllCollectionsViewController *)self resetCollectionViewLayout];
    objc_super v5 = [(AllCollectionsViewController *)self collectionView];
    [v5 setContentOffset:CGPointZero.x, CGPointZero.y];
  }
}

- (void)handleDismissAction:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(AllCollectionsViewController *)self apiController];
  [v5 cancelFetchingAllCollections];

  objc_super v6 = [(AllCollectionsViewController *)self dataSource];
  [v6 dismissedCollections];

  v7.receiver = self;
  v7.super_class = (Class)AllCollectionsViewController;
  [(ContaineeViewController *)&v7 handleDismissAction:v4];
}

- (double)heightForLayout:(unint64_t)a3
{
  uint64_t v5 = sub_1000BBB44(self);
  if (a3 != 1 || (double result = -1.0, v5 != 5))
  {
    v7.receiver = self;
    v7.super_class = (Class)AllCollectionsViewController;
    [(ContaineeViewController *)&v7 heightForLayout:a3];
  }
  return result;
}

- (void)onTransitionFromState:(int64_t)a3 toState:(int64_t)a4
{
  objc_super v7 = sub_1009C78A0();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  id v9 = sub_1009C78A0();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "DisplayingAllCollectionsView", "", buf, 2u);
  }

  switch(a3)
  {
    case 0:
      if (a4 == 1)
      {
        [(AllCollectionsViewController *)self addHeaderView];
        [(AllCollectionsViewController *)self activateHeaderConstraints];
        goto LABEL_14;
      }
      break;
    case 1:
      if (a4 == 3)
      {
        [(AllCollectionsViewController *)self removeLoadingView];
        [(AllCollectionsViewController *)self removeCollectionView];
        [(AllCollectionsViewController *)self addErrorView];
      }
      else if (a4 == 2)
      {
        [(AllCollectionsViewController *)self removeLoadingView];
        [(AllCollectionsViewController *)self addAllCollectionsView];
        objc_super v11 = [(AllCollectionsViewController *)self collectionView];
        [(AllCollectionsViewController *)self activateConstraintsForViewPinnedBelowHeader:v11];
      }
      break;
    case 2:
      if (a4 == 1) {
        goto LABEL_14;
      }
      break;
    case 3:
      if (a4 == 1)
      {
        [(AllCollectionsViewController *)self removeErrorView];
LABEL_14:
        [(AllCollectionsViewController *)self addLoadingView];
      }
      break;
    default:
      break;
  }
  v12 = sub_1009C78A0();
  v13 = v12;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_END, v8, "DisplayingAllCollectionsView", "", v14, 2u);
  }
}

- (void)addHeaderView
{
  v3 = [(AllCollectionsViewController *)self titleHeaderView];

  if (!v3)
  {
    id v4 = -[ContainerHeaderView initWithFrame:]([ContainerHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    [(AllCollectionsViewController *)self setTitleHeaderView:v4];

    uint64_t v5 = [(AllCollectionsViewController *)self titleHeaderView];
    uint64_t v6 = sub_1000BBB44(v5);

    if (v6 == 5)
    {
      objc_super v7 = [(AllCollectionsViewController *)self titleHeaderView];
      os_signpost_id_t v8 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleTitle3 variant:1024];
      [v7 setCustomTitleFont:v8];
    }
    id v9 = [(AllCollectionsViewController *)self titleHeaderView];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

    v10 = [(AllCollectionsViewController *)self titleHeaderView];
    LODWORD(v11) = 1148846080;
    [v10 setContentCompressionResistancePriority:1 forAxis:v11];

    v12 = +[NSBundle mainBundle];
    v13 = [v12 localizedStringForKey:@"All Collections [All Collections View]" value:@"localized string not found" table:0];
    v14 = [(AllCollectionsViewController *)self titleHeaderView];
    [v14 setTitle:v13];

    v15 = [(AllCollectionsViewController *)self titleHeaderView];
    [v15 setDelegate:self];

    v16 = [(AllCollectionsViewController *)self titleHeaderView];
    [v16 setHairLineAlpha:0.0];

    if (sub_1000BBB44(self) == 5) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = 2;
    }
    v18 = [(AllCollectionsViewController *)self titleHeaderView];
    [v18 setHeaderSize:v17];

    v19 = [(AllCollectionsViewController *)self titleHeaderView];
    [v19 setAccessibilityIdentifier:@"AllCollectionsTitleHeaderView"];

    id v21 = [(ContaineeViewController *)self headerView];
    v20 = [(AllCollectionsViewController *)self titleHeaderView];
    [v21 addSubview:v20];
  }
}

- (void)initializeSections
{
  v3 = [(AllCollectionsViewController *)self sections];
  id v4 = [v3 count];

  if (!v4)
  {
    id v17 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
    uint64_t v5 = [AllCollectionsSection alloc];
    uint64_t v6 = [(AllCollectionsViewController *)self collectionView];
    [v6 frame];
    double v8 = v7;
    id v9 = [(AllCollectionsViewController *)self collectionView];
    v10 = [(AllCollectionsSection *)v5 initWithSectionIndex:0 usingMaxWidth:v9 usingTraitEnvironment:v8];
    [v17 addObject:v10];

    double v11 = [AllCollectionsSection alloc];
    v12 = [(AllCollectionsViewController *)self collectionView];
    [v12 frame];
    double v14 = v13;
    v15 = [(AllCollectionsViewController *)self collectionView];
    v16 = [(AllCollectionsSection *)v11 initWithSectionIndex:1 usingMaxWidth:v15 usingTraitEnvironment:v14];
    [v17 addObject:v16];

    [(AllCollectionsViewController *)self setSections:v17];
  }
}

- (void)initializeDataSource
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = [(AllCollectionsViewController *)self apiController];
  uint64_t v5 = [v4 collectionResults];
  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  v20 = sub_1009C7ED4;
  id v21 = &unk_1013030E8;
  id v6 = v3;
  id v22 = v6;
  [v5 enumerateObjectsUsingBlock:&v18];

  double v7 = [(AllCollectionsViewController *)self apiController];
  double v8 = [v7 allCollectionViewIdentifiers];

  id v9 = [(AllCollectionsViewController *)self dataSource];

  if (v9)
  {
    v10 = [(AllCollectionsViewController *)self dataSource];
    [v10 updateCollections:v6 usingBatchIdentifiers:v8];
  }
  else
  {
    double v11 = [(AllCollectionsViewController *)self apiController];
    v10 = [v11 allCollectionViewFilters];

    v12 = [AllCollectionsDataSource alloc];
    double v13 = [(AllCollectionsViewController *)self collectionView];
    double v14 = [(AllCollectionsViewController *)self sections];
    v15 = [(AllCollectionsViewController *)self apiController];
    v16 = -[AllCollectionsDataSource initWithCollectionView:usingCuratedCollections:usingPlaceCollectionIds:withResultFilters:sections:usingAPIController:withRoutingDelegate:](v12, "initWithCollectionView:usingCuratedCollections:usingPlaceCollectionIds:withResultFilters:sections:usingAPIController:withRoutingDelegate:", v13, v6, v8, v10, v14, v15, self, v18, v19, v20, v21);
    [(AllCollectionsViewController *)self setDataSource:v16];

    id v17 = [(AllCollectionsViewController *)self dataSource];
    [v17 setDelegate:self];
  }
}

- (void)addAllCollectionsView
{
  id v3 = [(AllCollectionsViewController *)self collectionView];

  if (!v3)
  {
    id v4 = objc_alloc((Class)UICollectionView);
    uint64_t v5 = [(ContaineeViewController *)self contentView];
    [v5 frame];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v14 = [(ContaineeViewController *)self contentView];
    [v14 frame];
    v16 = [(AllCollectionsViewController *)self createLayoutUsingWidth:v15];
    id v17 = [v4 initWithFrame:v16 collectionViewLayout:v7, v9, v11, v13];
    [(AllCollectionsViewController *)self setCollectionView:v17];

    v18 = [(AllCollectionsViewController *)self collectionView];
    [v18 setTranslatesAutoresizingMaskIntoConstraints:0];

    uint64_t v19 = +[UIColor clearColor];
    v20 = [(AllCollectionsViewController *)self collectionView];
    [v20 setBackgroundColor:v19];

    id v21 = [(AllCollectionsViewController *)self collectionView];
    [v21 setBounces:1];

    id v22 = [(AllCollectionsViewController *)self collectionView];
    [v22 setAlwaysBounceVertical:1];

    v23 = [(AllCollectionsViewController *)self collectionView];
    [v23 setAccessibilityIdentifier:@"AllCollectionsCollectionView"];

    v24 = [(ContaineeViewController *)self contentView];
    v25 = [(AllCollectionsViewController *)self collectionView];
    [v24 addSubview:v25];
  }
  [(AllCollectionsViewController *)self initializeSections];
  [(AllCollectionsViewController *)self initializeDataSource];
  id v26 = [(AllCollectionsViewController *)self dataSource];
  [v26 displayAllCollectionsData];
}

- (void)removeCollectionView
{
  id v3 = [(AllCollectionsViewController *)self collectionView];

  if (v3)
  {
    id v4 = [(AllCollectionsViewController *)self collectionView];
    [v4 removeFromSuperview];

    [(AllCollectionsViewController *)self setCollectionView:0];
    [(AllCollectionsViewController *)self setDataSource:0];
  }
}

- (id)createLayoutUsingWidth:(double)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1009C825C;
  v5[3] = &unk_1012F31E0;
  v5[4] = self;
  *(double *)&v5[5] = a3;
  id v3 = [objc_alloc((Class)UICollectionViewCompositionalLayout) initWithSectionProvider:v5];

  return v3;
}

- (void)activateHeaderConstraints
{
  v23 = [(AllCollectionsViewController *)self titleHeaderView];
  id v21 = [v23 topAnchor];
  id v22 = [(ContaineeViewController *)self headerView];
  v20 = [v22 topAnchor];
  uint64_t v19 = [v21 constraintEqualToAnchor:v20];
  v24[0] = v19;
  v18 = [(AllCollectionsViewController *)self titleHeaderView];
  v16 = [v18 leadingAnchor];
  id v17 = [(ContaineeViewController *)self headerView];
  double v15 = [v17 leadingAnchor];
  double v14 = [v16 constraintEqualToAnchor:v15];
  v24[1] = v14;
  double v13 = [(AllCollectionsViewController *)self titleHeaderView];
  id v3 = [v13 trailingAnchor];
  id v4 = [(ContaineeViewController *)self headerView];
  uint64_t v5 = [v4 trailingAnchor];
  double v6 = [v3 constraintEqualToAnchor:v5];
  v24[2] = v6;
  double v7 = [(AllCollectionsViewController *)self titleHeaderView];
  double v8 = [v7 bottomAnchor];
  double v9 = [(ContaineeViewController *)self headerView];
  double v10 = [v9 bottomAnchor];
  double v11 = [v8 constraintEqualToAnchor:v10];
  v24[3] = v11;
  double v12 = +[NSArray arrayWithObjects:v24 count:4];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (void)activateConstraintsForViewPinnedBelowHeader:(id)a3
{
  id v4 = a3;
  v20 = [v4 leadingAnchor];
  id v21 = [(ContaineeViewController *)self contentView];
  uint64_t v19 = [v21 leadingAnchor];
  v18 = [v20 constraintEqualToAnchor:v19];
  v22[0] = v18;
  v16 = [v4 trailingAnchor];
  id v17 = [(ContaineeViewController *)self contentView];
  double v15 = [v17 trailingAnchor];
  uint64_t v5 = [v16 constraintEqualToAnchor:v15];
  v22[1] = v5;
  double v6 = [v4 topAnchor];
  double v7 = [(ContaineeViewController *)self headerView];
  double v8 = [v7 bottomAnchor];
  double v9 = [v6 constraintEqualToAnchor:v8];
  v22[2] = v9;
  double v10 = [v4 bottomAnchor];

  double v11 = [(ContaineeViewController *)self contentView];
  double v12 = [v11 bottomAnchor];
  double v13 = [v10 constraintEqualToAnchor:v12];
  v22[3] = v13;
  double v14 = +[NSArray arrayWithObjects:v22 count:4];
  +[NSLayoutConstraint activateConstraints:v14];
}

- (void)addLoadingView
{
  objc_initWeak(&location, self);
  dispatch_time_t v3 = dispatch_time(0, 200000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1009C883C;
  block[3] = &unk_1012E6690;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)removeLoadingView
{
  dispatch_time_t v3 = [(AllCollectionsViewController *)self loadingView];

  if (v3)
  {
    id v4 = [(AllCollectionsViewController *)self loadingView];
    [v4 removeFromSuperview];

    [(AllCollectionsViewController *)self setLoadingView:0];
  }
}

- (void)addErrorView
{
  dispatch_time_t v3 = [(AllCollectionsViewController *)self errorView];

  if (!v3)
  {
    id v4 = [(AllCollectionsViewController *)self dataSource];
    [v4 clearAllCollectionsData];

    id v5 = objc_alloc_init(ErrorModeView);
    [(AllCollectionsViewController *)self setErrorView:v5];

    double v6 = +[NSBundle mainBundle];
    double v7 = [v6 localizedStringForKey:@"[Brooklyn] Error Mode title" value:@"localized string not found" table:0];

    double v8 = +[NSBundle mainBundle];
    double v9 = [v8 localizedStringForKey:@"[Brooklyn] Error Mode message" value:@"localized string not found" table:0];

    uint64_t v10 = MKCurrentNetworkConnectionFailureDiagnosis();
    double v11 = [(AllCollectionsViewController *)self errorView];
    double v12 = v11;
    if (v10)
    {
      [v11 setTitle:v7 andMessage:v9];

      objc_initWeak(&location, self);
      double v13 = [(AllCollectionsViewController *)self errorView];
      double v14 = +[UIColor systemGray5Color];
      id v22 = _NSConcreteStackBlock;
      uint64_t v23 = 3221225472;
      v24 = sub_1009C8D24;
      v25 = &unk_1012EE310;
      objc_copyWeak(&v26, &location);
      [v13 setButtonTitle:@"Try Again" glyphName:@"arrow.clockwise" backgroundColor:v14 handler:&v22];

      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
    }
    else
    {
      double v15 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubhead];
      [v12 setTitleLabelFont:v15];

      v16 = [(AllCollectionsViewController *)self errorView];
      [v16 setTitle:v7 andMessage:0];
    }
    id v17 = [(AllCollectionsViewController *)self errorView];
    [v17 setTranslatesAutoresizingMaskIntoConstraints:0];

    v18 = [(AllCollectionsViewController *)self errorView];
    [v18 setAccessibilityIdentifier:@"AllCollectionsErrorView"];

    uint64_t v19 = [(ContaineeViewController *)self contentView];
    v20 = [(AllCollectionsViewController *)self errorView];
    [v19 addSubview:v20];

    id v21 = [(AllCollectionsViewController *)self errorView];
    [(AllCollectionsViewController *)self activateConstraintsForViewPinnedBelowHeader:v21];
  }
}

- (void)removeErrorView
{
  dispatch_time_t v3 = [(AllCollectionsViewController *)self errorView];

  if (v3)
  {
    id v4 = [(AllCollectionsViewController *)self errorView];
    [v4 removeFromSuperview];

    [(AllCollectionsViewController *)self setErrorView:0];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)AllCollectionsViewController;
  id v7 = a4;
  -[ContaineeViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1009C8F08;
  v8[3] = &unk_1012E81F8;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:&stru_101313388];
}

- (void)resetCollectionViewLayout
{
  dispatch_time_t v3 = [(AllCollectionsViewController *)self collectionView];
  id v4 = [v3 collectionViewLayout];
  [v4 invalidateLayout];

  id v8 = [(AllCollectionsViewController *)self collectionView];
  id v5 = [(ContaineeViewController *)self contentView];
  [v5 frame];
  id v7 = [(AllCollectionsViewController *)self createLayoutUsingWidth:v6];
  [v8 setCollectionViewLayout:v7];
}

- (void)routeToCuratedCollection:(id)a3
{
  id v4 = a3;
  id v5 = [(ControlContaineeViewController *)self delegate];
  [v5 viewController:self showCuratedCollection:v4];
}

- (void)pptPresentFirstCollection
{
  id v2 = [(AllCollectionsViewController *)self dataSource];
  [v2 presentFirstCollection];
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (void)setTraits:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (ContainerHeaderView)titleHeaderView
{
  return self->_titleHeaderView;
}

- (void)setTitleHeaderView:(id)a3
{
}

- (UICollectionViewCompositionalLayout)flowLayout
{
  return self->_flowLayout;
}

- (void)setFlowLayout:(id)a3
{
}

- (AllCollectionsDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (NSDiffableDataSourceSnapshot)snapshot
{
  return self->_snapshot;
}

- (void)setSnapshot:(id)a3
{
}

- (LoadingModeView)loadingView
{
  return self->_loadingView;
}

- (void)setLoadingView:(id)a3
{
}

- (ErrorModeView)errorView
{
  return self->_errorView;
}

- (void)setErrorView:(id)a3
{
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (AllCollectionsAPIController)apiController
{
  return self->_apiController;
}

- (void)setApiController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apiController, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_errorView, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_flowLayout, 0);
  objc_storeStrong((id *)&self->_titleHeaderView, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_traits, 0);

  objc_storeStrong((id *)&self->_layout, 0);
}

@end