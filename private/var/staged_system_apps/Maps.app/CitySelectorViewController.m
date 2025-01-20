@interface CitySelectorViewController
- (CitySelectorAPIController)apiController;
- (CitySelectorAnalyticsManager)analyticsManager;
- (CitySelectorDataSource)dataSource;
- (CitySelectorViewController)initWithSourceGuideLocation:(id)a3;
- (ContainerHeaderView)titleHeaderView;
- (ErrorModeView)errorView;
- (GEOGuideLocation)sourceGuideLocation;
- (GEOMapServiceTraits)traits;
- (LoadingModeView)loadingView;
- (NSArray)sections;
- (UICollectionView)collectionView;
- (UICollectionViewCompositionalLayout)layout;
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
- (void)removeCollectionView;
- (void)removeErrorView;
- (void)removeLoadingView;
- (void)resetCollectionViewLayout;
- (void)routeToGuideLocation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setAnalyticsManager:(id)a3;
- (void)setApiController:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setErrorView:(id)a3;
- (void)setLayout:(id)a3;
- (void)setLoadingView:(id)a3;
- (void)setSections:(id)a3;
- (void)setSourceGuideLocation:(id)a3;
- (void)setTitleHeaderView:(id)a3;
- (void)setTraits:(id)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CitySelectorViewController

- (CitySelectorViewController)initWithSourceGuideLocation:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CitySelectorViewController;
  v5 = [(CitySelectorViewController *)&v13 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = sub_1000BBB44(v5);
    v8 = [(ContaineeViewController *)v6 cardPresentationController];
    v9 = v8;
    if (v7 == 5)
    {
      [v8 setAllowResizeInFloatingStyle:1];

      v10 = [(ContaineeViewController *)v6 cardPresentationController];
      [v10 setDefaultContaineeLayout:3];
    }
    else
    {
      [v8 setPresentedModally:1];

      v10 = [(ContaineeViewController *)v6 cardPresentationController];
      [v10 setTakesAvailableHeight:1];
    }

    v11 = objc_alloc_init(CitySelectorAnalyticsManager);
    [(CitySelectorViewController *)v6 setAnalyticsManager:v11];

    [(CitySelectorViewController *)v6 setSourceGuideLocation:v4];
  }

  return v6;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)CitySelectorViewController;
  [(ContaineeViewController *)&v10 viewDidLoad];
  [(CitySelectorViewController *)self setAccessibilityIdentifier:@"CitySelectorView"];
  objc_initWeak(&location, self);
  v3 = [CitySelectorAPIController alloc];
  objc_copyWeak(&v8, &location);
  id v4 = [(CitySelectorViewController *)self traits];
  v5 = [(CitySelectorAPIController *)v3 initWithStateChangeHandler:&v7 usingTraits:v4];
  [(CitySelectorViewController *)self setApiController:v5];

  v6 = [(CitySelectorViewController *)self apiController];
  [v6 fetchCitySelectorView:&stru_1012F3198];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)CitySelectorViewController;
  id v7 = a4;
  -[ContaineeViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100651A68;
  v8[3] = &unk_1012E81F8;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:&stru_1012F31B8];
}

- (void)didChangeLayout:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CitySelectorViewController;
  [(ContaineeViewController *)&v6 didChangeLayout:a3];
  id v4 = [(CitySelectorViewController *)self collectionView];

  if (v4)
  {
    [(CitySelectorViewController *)self resetCollectionViewLayout];
    v5 = [(CitySelectorViewController *)self collectionView];
    [v5 setContentOffset:CGPointZero];
  }
}

- (void)handleDismissAction:(id)a3
{
  id v4 = a3;
  v5 = [(CitySelectorViewController *)self apiController];
  [v5 cancelFetchingCitySelectorView];

  objc_super v6 = [(CitySelectorViewController *)self dataSource];
  [v6 dismissedCitySelector];

  v7.receiver = self;
  v7.super_class = (Class)CitySelectorViewController;
  [(ContaineeViewController *)&v7 handleDismissAction:v4];
}

- (double)heightForLayout:(unint64_t)a3
{
  uint64_t v5 = sub_1000BBB44(self);
  if (a3 != 1 || (double result = -1.0, v5 != 5))
  {
    v7.receiver = self;
    v7.super_class = (Class)CitySelectorViewController;
    [(ContaineeViewController *)&v7 heightForLayout:a3];
  }
  return result;
}

- (void)routeToGuideLocation:(id)a3
{
  id v4 = a3;
  id v5 = [(ControlContaineeViewController *)self delegate];
  [v5 viewController:self showGuidesHome:v4];
}

- (void)onTransitionFromState:(int64_t)a3 toState:(int64_t)a4
{
  objc_super v7 = sub_100651DB0();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  objc_super v9 = sub_100651DB0();
  objc_super v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "DisplayingCitySelectorView", "", v12, 2u);
  }

  if (a3 == 3)
  {
    if (a4 != 1) {
      return;
    }
    [(CitySelectorViewController *)self removeErrorView];
    goto LABEL_11;
  }
  if (a3 == 1)
  {
    if (a4 == 3)
    {
      [(CitySelectorViewController *)self removeLoadingView];
      [(CitySelectorViewController *)self removeCollectionView];
      [(CitySelectorViewController *)self addErrorView];
    }
    else if (a4 == 2)
    {
      [(CitySelectorViewController *)self removeLoadingView];
      [(CitySelectorViewController *)self addAllCollectionsView];
      v11 = [(CitySelectorViewController *)self collectionView];
      [(CitySelectorViewController *)self activateConstraintsForViewPinnedBelowHeader:v11];
    }
  }
  else if (!a3 && a4 == 1)
  {
    [(CitySelectorViewController *)self addHeaderView];
    [(CitySelectorViewController *)self activateHeaderConstraints];
LABEL_11:
    [(CitySelectorViewController *)self addLoadingView];
  }
}

- (void)initializeSections
{
  v3 = [(CitySelectorViewController *)self sections];
  id v4 = [v3 count];

  if (!v4)
  {
    id v5 = objc_alloc((Class)NSMutableArray);
    objc_super v6 = [(CitySelectorViewController *)self apiController];
    objc_super v7 = [v6 citySelectorSections];
    id v8 = [v5 initWithCapacity:[v7 count]];

    objc_super v9 = [(CitySelectorViewController *)self apiController];
    objc_super v10 = [v9 citySelectorSections];
    v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    v14 = sub_100651F30;
    v15 = &unk_1012EB818;
    v16 = self;
    id v17 = v8;
    id v11 = v8;
    [v10 enumerateObjectsUsingBlock:&v12];

    -[CitySelectorViewController setSections:](self, "setSections:", v11, v12, v13, v14, v15, v16);
  }
}

- (void)initializeDataSource
{
  v3 = [(CitySelectorViewController *)self dataSource];

  if (!v3)
  {
    id v4 = [CitySelectorDataSource alloc];
    id v5 = [(CitySelectorViewController *)self collectionView];
    objc_super v6 = [(CitySelectorViewController *)self apiController];
    objc_super v7 = [v6 citySelectorResult];
    id v8 = [(CitySelectorViewController *)self sections];
    objc_super v9 = [(CitySelectorViewController *)self apiController];
    objc_super v10 = [(CitySelectorViewController *)self apiController];
    uint64_t v11 = [v10 batchSize];
    v12 = [(CitySelectorViewController *)self sourceGuideLocation];
    uint64_t v13 = [(CitySelectorDataSource *)v4 initWithCollectionView:v5 result:v7 sections:v8 routingDelegate:self usingCollectionFetcher:v9 usingBatchSize:v11 selectedGuideLocation:v12];
    [(CitySelectorViewController *)self setDataSource:v13];

    v14 = [(CitySelectorViewController *)self dataSource];
    [v14 setDelegate:self];

    id v15 = [(CitySelectorViewController *)self analyticsManager];
    [v15 citySelectorRevealed];
  }
}

- (void)addHeaderView
{
  v3 = [(CitySelectorViewController *)self titleHeaderView];

  if (!v3)
  {
    id v4 = -[ContainerHeaderView initWithFrame:]([ContainerHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    [(CitySelectorViewController *)self setTitleHeaderView:v4];

    id v5 = [(CitySelectorViewController *)self titleHeaderView];
    uint64_t v6 = sub_1000BBB44(v5);

    if (v6 == 5)
    {
      objc_super v7 = [(CitySelectorViewController *)self titleHeaderView];
      id v8 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleTitle3 variant:1024];
      [v7 setCustomTitleFont:v8];
    }
    objc_super v9 = [(CitySelectorViewController *)self titleHeaderView];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

    objc_super v10 = [(CitySelectorViewController *)self titleHeaderView];
    LODWORD(v11) = 1148846080;
    [v10 setContentCompressionResistancePriority:1 forAxis:v11];

    v12 = +[NSBundle mainBundle];
    uint64_t v13 = [v12 localizedStringForKey:@"Cities [City Selector View]" value:@"localized string not found" table:0];
    v14 = [(CitySelectorViewController *)self titleHeaderView];
    [v14 setTitle:v13];

    id v15 = [(CitySelectorViewController *)self titleHeaderView];
    [v15 setDelegate:self];

    v16 = [(CitySelectorViewController *)self titleHeaderView];
    [v16 setHairLineAlpha:0.0];

    if (sub_1000BBB44(self) == 5) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = 2;
    }
    v18 = [(CitySelectorViewController *)self titleHeaderView];
    [v18 setHeaderSize:v17];

    id v20 = [(ContaineeViewController *)self headerView];
    v19 = [(CitySelectorViewController *)self titleHeaderView];
    [v20 addSubview:v19];
  }
}

- (void)activateHeaderConstraints
{
  v23 = [(CitySelectorViewController *)self titleHeaderView];
  v21 = [v23 topAnchor];
  v22 = [(ContaineeViewController *)self headerView];
  id v20 = [v22 topAnchor];
  v19 = [v21 constraintEqualToAnchor:v20];
  v24[0] = v19;
  v18 = [(CitySelectorViewController *)self titleHeaderView];
  v16 = [v18 leadingAnchor];
  uint64_t v17 = [(ContaineeViewController *)self headerView];
  id v15 = [v17 leadingAnchor];
  v14 = [v16 constraintEqualToAnchor:v15];
  v24[1] = v14;
  uint64_t v13 = [(CitySelectorViewController *)self titleHeaderView];
  v3 = [v13 trailingAnchor];
  id v4 = [(ContaineeViewController *)self headerView];
  id v5 = [v4 trailingAnchor];
  uint64_t v6 = [v3 constraintEqualToAnchor:v5];
  v24[2] = v6;
  objc_super v7 = [(CitySelectorViewController *)self titleHeaderView];
  id v8 = [v7 bottomAnchor];
  objc_super v9 = [(ContaineeViewController *)self headerView];
  objc_super v10 = [v9 bottomAnchor];
  double v11 = [v8 constraintEqualToAnchor:v10];
  v24[3] = v11;
  v12 = +[NSArray arrayWithObjects:v24 count:4];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (void)addAllCollectionsView
{
  v3 = [(CitySelectorViewController *)self collectionView];

  if (!v3)
  {
    id v4 = objc_alloc((Class)UICollectionView);
    id v5 = [(ContaineeViewController *)self contentView];
    [v5 frame];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    id v14 = objc_alloc_init((Class)UICollectionViewLayout);
    id v15 = [v4 initWithFrame:v14 collectionViewLayout:v7, v9, v11, v13];
    [(CitySelectorViewController *)self setCollectionView:v15];

    v16 = [(CitySelectorViewController *)self collectionView];
    [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

    uint64_t v17 = +[UIColor clearColor];
    v18 = [(CitySelectorViewController *)self collectionView];
    [v18 setBackgroundColor:v17];

    v19 = [(CitySelectorViewController *)self collectionView];
    [v19 setBounces:1];

    id v20 = [(CitySelectorViewController *)self collectionView];
    [v20 setAlwaysBounceVertical:1];

    v21 = [(ContaineeViewController *)self contentView];
    v22 = [(CitySelectorViewController *)self collectionView];
    [v21 addSubview:v22];
  }
  [(CitySelectorViewController *)self initializeSections];
  [(CitySelectorViewController *)self initializeDataSource];
  v23 = [(CitySelectorViewController *)self collectionView];
  v24 = [(ContaineeViewController *)self contentView];
  [v24 frame];
  v26 = [(CitySelectorViewController *)self createLayoutUsingWidth:v25];
  [v23 setCollectionViewLayout:v26];

  id v27 = [(CitySelectorViewController *)self dataSource];
  [v27 displayCitySelectorData];
}

- (void)removeCollectionView
{
  v3 = [(CitySelectorViewController *)self collectionView];

  if (v3)
  {
    id v4 = [(CitySelectorViewController *)self collectionView];
    [v4 removeFromSuperview];

    [(CitySelectorViewController *)self setCollectionView:0];
    [(CitySelectorViewController *)self setDataSource:0];
  }
}

- (id)createLayoutUsingWidth:(double)a3
{
  id v5 = objc_alloc_init((Class)UICollectionViewCompositionalLayoutConfiguration);
  [v5 setInterSectionSpacing:6.0];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1006529F4;
  v8[3] = &unk_1012F31E0;
  v8[4] = self;
  *(double *)&void v8[5] = a3;
  id v6 = [objc_alloc((Class)UICollectionViewCompositionalLayout) initWithSectionProvider:v8 configuration:v5];

  return v6;
}

- (void)activateConstraintsForViewPinnedBelowHeader:(id)a3
{
  id v4 = a3;
  id v20 = [v4 leadingAnchor];
  v21 = [(ContaineeViewController *)self contentView];
  v19 = [v21 leadingAnchor];
  v18 = [v20 constraintEqualToAnchor:v19];
  v22[0] = v18;
  v16 = [v4 trailingAnchor];
  uint64_t v17 = [(ContaineeViewController *)self contentView];
  id v15 = [v17 trailingAnchor];
  id v5 = [v16 constraintEqualToAnchor:v15];
  v22[1] = v5;
  id v6 = [v4 topAnchor];
  double v7 = [(ContaineeViewController *)self headerView];
  double v8 = [v7 bottomAnchor];
  double v9 = [v6 constraintEqualToAnchor:v8];
  v22[2] = v9;
  double v10 = [v4 bottomAnchor];

  double v11 = [(ContaineeViewController *)self contentView];
  double v12 = [v11 bottomAnchor];
  double v13 = [v10 constraintEqualToAnchor:v12];
  v22[3] = v13;
  id v14 = +[NSArray arrayWithObjects:v22 count:4];
  +[NSLayoutConstraint activateConstraints:v14];
}

- (void)resetCollectionViewLayout
{
  v3 = [(CitySelectorViewController *)self collectionView];
  id v4 = [v3 collectionViewLayout];
  [v4 invalidateLayout];

  id v8 = [(CitySelectorViewController *)self collectionView];
  id v5 = [(ContaineeViewController *)self contentView];
  [v5 frame];
  double v7 = [(CitySelectorViewController *)self createLayoutUsingWidth:v6];
  [v8 setCollectionViewLayout:v7];
}

- (void)addLoadingView
{
  objc_initWeak(&location, self);
  dispatch_time_t v2 = dispatch_time(0, 200000000);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100652E0C;
  v3[3] = &unk_1012E6708;
  objc_copyWeak(&v4, &location);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)removeLoadingView
{
  v3 = [(CitySelectorViewController *)self loadingView];

  if (v3)
  {
    id v4 = [(CitySelectorViewController *)self loadingView];
    [v4 removeFromSuperview];

    [(CitySelectorViewController *)self setLoadingView:0];
  }
}

- (void)addErrorView
{
  v3 = [(CitySelectorViewController *)self errorView];

  if (!v3)
  {
    id v4 = objc_alloc_init(ErrorModeView);
    [(CitySelectorViewController *)self setErrorView:v4];

    id v5 = +[NSBundle mainBundle];
    double v6 = [v5 localizedStringForKey:@"[City Selector] Error Mode title" value:@"localized string not found" table:0];

    double v7 = +[NSBundle mainBundle];
    id v8 = [v7 localizedStringForKey:@"[City Selector] Error Mode message" value:@"localized string not found" table:0];

    uint64_t v9 = MKCurrentNetworkConnectionFailureDiagnosis();
    double v10 = [(CitySelectorViewController *)self errorView];
    double v11 = v10;
    if (v9)
    {
      [v10 setTitle:v6 andMessage:v8];

      objc_initWeak(&location, self);
      double v12 = [(CitySelectorViewController *)self errorView];
      double v13 = +[UIColor systemGray5Color];
      id v20 = _NSConcreteStackBlock;
      uint64_t v21 = 3221225472;
      v22 = sub_100653298;
      v23 = &unk_1012EE310;
      objc_copyWeak(&v24, &location);
      [v12 setButtonTitle:@"Try Again" glyphName:@"arrow.clockwise" backgroundColor:v13 handler:&v20];

      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
    }
    else
    {
      id v14 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubhead];
      [v11 setTitleLabelFont:v14];

      id v15 = [(CitySelectorViewController *)self errorView];
      [v15 setTitle:v6 andMessage:0];
    }
    v16 = [(CitySelectorViewController *)self errorView];
    [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

    uint64_t v17 = [(ContaineeViewController *)self contentView];
    v18 = [(CitySelectorViewController *)self errorView];
    [v17 addSubview:v18];

    v19 = [(CitySelectorViewController *)self errorView];
    [(CitySelectorViewController *)self activateConstraintsForViewPinnedBelowHeader:v19];
  }
}

- (void)removeErrorView
{
  v3 = [(CitySelectorViewController *)self errorView];

  if (v3)
  {
    id v4 = [(CitySelectorViewController *)self errorView];
    [v4 removeFromSuperview];

    [(CitySelectorViewController *)self setErrorView:0];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CitySelectorViewController;
  [(ContaineeViewController *)&v9 scrollViewDidScroll:a3];
  id v4 = [(CitySelectorViewController *)self collectionView];
  unsigned int v5 = [v4 _maps_shouldShowTopHairline];

  double v6 = 0.0;
  if (v5) {
    double v6 = 1.0;
  }
  v7[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1006534A0;
  v8[3] = &unk_1012EB708;
  v8[4] = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1006534B4;
  v7[3] = &unk_1012EB730;
  +[UIScrollView _maps_updateTopHairlineAlpha:1 animated:v8 getter:v7 setter:v6];
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

- (CitySelectorDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
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

- (ContainerHeaderView)titleHeaderView
{
  return self->_titleHeaderView;
}

- (void)setTitleHeaderView:(id)a3
{
}

- (UICollectionViewCompositionalLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (CitySelectorAPIController)apiController
{
  return self->_apiController;
}

- (void)setApiController:(id)a3
{
}

- (CitySelectorAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (GEOGuideLocation)sourceGuideLocation
{
  return self->_sourceGuideLocation;
}

- (void)setSourceGuideLocation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceGuideLocation, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_apiController, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_titleHeaderView, 0);
  objc_storeStrong((id *)&self->_errorView, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);

  objc_storeStrong((id *)&self->_traits, 0);
}

@end