@interface PublisherViewController
- (ContainerHeaderView)defaultHeaderView;
- (ErrorModeView)errorView;
- (GEOMapServiceTraits)traits;
- (GEOPublisher)publisher;
- (LoadingModeView)loadingView;
- (MKMapItemIdentifier)publisherId;
- (NSLayoutConstraint)headerHeightConstraint;
- (PublisherAPIController)apiController;
- (PublisherAnalytics)analyticsManager;
- (PublisherHeaderView)publisherHeaderView;
- (PublisherViewController)initWithPublisherId:(id)a3 numberOfCollections:(unint64_t)a4 withTraits:(id)a5;
- (PublisherViewDataSource)dataSource;
- (UICollectionView)collectionView;
- (UICollectionViewFlowLayout)flowLayout;
- (double)actualCardHeight;
- (double)heightForLayout:(unint64_t)a3;
- (unint64_t)numberOfCollections;
- (void)activateConstraints;
- (void)activateConstraintsForViewPinnedBelowHeader:(id)a3;
- (void)activateDefaultHeaderConstraints;
- (void)addCollectionView;
- (void)addDefaultHeaderView;
- (void)addErrorView;
- (void)addLoadingView;
- (void)addPublisherHeaderView;
- (void)didChangeLayout:(unint64_t)a3;
- (void)didSelectAllGuidesMenuItem;
- (void)didSelectAppItem;
- (void)didSelectShareFromView:(id)a3;
- (void)didSelectWebsiteItem;
- (void)handleDismissAction:(id)a3;
- (void)onTransitionFromState:(int64_t)a3 toState:(int64_t)a4;
- (void)removeCollectionView;
- (void)removeDefaultHeaderView;
- (void)removeErrorView;
- (void)removeLoadingView;
- (void)resetCollectionViewLayout;
- (void)routeToCuratedCollection:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setActualCardHeight:(double)a3;
- (void)setAnalyticsManager:(id)a3;
- (void)setApiController:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDefaultHeaderView:(id)a3;
- (void)setErrorView:(id)a3;
- (void)setFlowLayout:(id)a3;
- (void)setHeaderHeightConstraint:(id)a3;
- (void)setLoadingView:(id)a3;
- (void)setNumberOfCollections:(unint64_t)a3;
- (void)setPublisherHeaderView:(id)a3;
- (void)setPublisherId:(id)a3;
- (void)setTraits:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willDismissByGesture;
@end

@implementation PublisherViewController

- (PublisherViewController)initWithPublisherId:(id)a3 numberOfCollections:(unint64_t)a4 withTraits:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PublisherViewController;
  v11 = [(PublisherViewController *)&v18 initWithNibName:0 bundle:0];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_publisherId, a3);
    v12->_numberOfCollections = a4;
    objc_storeStrong((id *)&v12->_traits, a5);
    uint64_t v13 = sub_1000BBB44(v12);
    v14 = [(ContaineeViewController *)v12 cardPresentationController];
    v15 = v14;
    if (v13 == 5)
    {
      [v14 setAllowResizeInFloatingStyle:1];

      v16 = [(ContaineeViewController *)v12 cardPresentationController];
      [v16 setDefaultContaineeLayout:3];
    }
    else
    {
      [v14 setPresentedModally:1];

      v16 = [(ContaineeViewController *)v12 cardPresentationController];
      [v16 setTakesAvailableHeight:1];
    }
  }
  return v12;
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)PublisherViewController;
  [(ContaineeViewController *)&v12 viewDidLoad];
  v3 = [(PublisherViewController *)self view];
  [v3 setAccessibilityIdentifier:@"PublisherView"];

  objc_initWeak(&location, self);
  v4 = [PublisherAPIController alloc];
  v5 = [(PublisherViewController *)self publisherId];
  objc_copyWeak(&v10, &location);
  v6 = [(PublisherViewController *)self traits];
  v7 = [(PublisherAPIController *)v4 initWithPublisherId:v5 usingOnStateChangeHandler:&v9 usingTraits:v6];
  [(PublisherViewController *)self setApiController:v7];

  v8 = [(PublisherViewController *)self apiController];
  [v8 fetchPublisherViewForKeywordFilter:0 addressFilter:0 onCompletion:&stru_101321240];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PublisherViewController;
  [(PublisherViewController *)&v5 viewDidAppear:a3];
  v4 = [(ContaineeViewController *)self cardPresentationController];
  [v4 cardHeight];
  -[PublisherViewController setActualCardHeight:](self, "setActualCardHeight:");
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PublisherViewController;
  [(ContaineeViewController *)&v5 viewWillDisappear:a3];
  v4 = [(PublisherViewController *)self apiController];
  [v4 cancelFetchingPublisher];
}

- (void)willDismissByGesture
{
  v4.receiver = self;
  v4.super_class = (Class)PublisherViewController;
  [(ContaineeViewController *)&v4 willDismissByGesture];
  v3 = [(ControlContaineeViewController *)self delegate];
  [v3 clearSearch];
}

- (void)didChangeLayout:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PublisherViewController;
  [(ContaineeViewController *)&v11 didChangeLayout:a3];
  objc_super v4 = [(PublisherViewController *)self collectionView];

  if (v4)
  {
    [(PublisherViewController *)self resetCollectionViewLayout];
    objc_super v5 = [(PublisherViewController *)self collectionView];
    [v5 setContentOffset:CGPointZero];

    v6 = [(PublisherViewController *)self publisherHeaderView];
    [v6 maximumRequiredHeight];
    double v8 = v7;
    uint64_t v9 = [(PublisherViewController *)self headerHeightConstraint];
    [v9 setConstant:v8];

    id v10 = [(PublisherViewController *)self publisherHeaderView];
    [v10 resetLogoHeight];
  }
}

- (GEOPublisher)publisher
{
  v2 = [(PublisherViewController *)self apiController];
  v3 = [v2 publisherResult];
  objc_super v4 = [v3 publisher];

  return (GEOPublisher *)v4;
}

- (double)heightForLayout:(unint64_t)a3
{
  uint64_t v5 = sub_1000BBB44(self);
  if (a3 != 1 || (double result = -1.0, v5 != 5))
  {
    v7.receiver = self;
    v7.super_class = (Class)PublisherViewController;
    [(ContaineeViewController *)&v7 heightForLayout:a3];
  }
  return result;
}

- (void)handleDismissAction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PublisherViewController *)self apiController];
  [v5 cancelFetchingPublisher];

  v6 = [(PublisherViewController *)self dataSource];
  [v6 dismissedCollections];

  v7.receiver = self;
  v7.super_class = (Class)PublisherViewController;
  [(ContaineeViewController *)&v7 handleDismissAction:v4];
}

- (void)onTransitionFromState:(int64_t)a3 toState:(int64_t)a4
{
  objc_super v7 = sub_100CDE0D0();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  uint64_t v9 = sub_100CDE0D0();
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "DisplayingPublisherView", "", buf, 2u);
  }

  switch(a3)
  {
    case 0:
      if (a4 == 1)
      {
        [(PublisherViewController *)self addLoadingView];
        [(PublisherViewController *)self addDefaultHeaderView];
        [(PublisherViewController *)self activateDefaultHeaderConstraints];
      }
      break;
    case 1:
      if (a4 == 3)
      {
        [(PublisherViewController *)self removeLoadingView];
        [(PublisherViewController *)self removeCollectionView];
        [(PublisherViewController *)self addErrorView];
      }
      else if (a4 == 2)
      {
        [(PublisherViewController *)self removeLoadingView];
        [(PublisherViewController *)self removeDefaultHeaderView];
        [(PublisherViewController *)self addPublisherHeaderView];
        [(PublisherViewController *)self addCollectionView];
        [(PublisherViewController *)self activateConstraints];
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
        [(PublisherViewController *)self removeErrorView];
LABEL_14:
        [(PublisherViewController *)self addLoadingView];
      }
      break;
    default:
      break;
  }
  objc_super v11 = sub_100CDE0D0();
  objc_super v12 = v11;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, v8, "DisplayingPublisherView", "", v13, 2u);
  }
}

- (void)addPublisherHeaderView
{
  v3 = [(PublisherViewController *)self publisherHeaderView];

  if (!v3)
  {
    id v4 = [(PublisherViewController *)self publisher];
    [v4 publisherAttribution];

    id v23 = [(PublisherViewController *)self publisher];
    uint64_t v5 = [PublisherAnalyticsManager alloc];
    v6 = [v23 identifier];
    objc_super v7 = [v23 publisherAttribution];
    os_signpost_id_t v8 = [(PublisherAnalyticsManager *)v5 initWithPublisherId:v6 usingAttribution:v7];
    [(PublisherViewController *)self setAnalyticsManager:v8];

    uint64_t v9 = [PublisherHeaderView alloc];
    id v10 = [v23 publisherAttribution];
    objc_super v11 = [(PublisherViewController *)self analyticsManager];
    objc_super v12 = [(PublisherHeaderView *)v9 initWithDelegate:self usingPublisherAttribution:v10 usingAnalyticsManager:v11];
    [(PublisherViewController *)self setPublisherHeaderView:v12];

    uint64_t v13 = +[UIColor clearColor];
    v14 = [(PublisherViewController *)self publisherHeaderView];
    [v14 setBackgroundColor:v13];

    v15 = [(PublisherViewController *)self publisherHeaderView];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

    v16 = [(PublisherViewController *)self publisherHeaderView];
    LODWORD(v17) = 1148846080;
    [v16 setContentCompressionResistancePriority:0 forAxis:v17];

    objc_super v18 = [(PublisherViewController *)self publisherHeaderView];
    LODWORD(v19) = 1148846080;
    [v18 setContentHuggingPriority:0 forAxis:v19];

    v20 = [(ContaineeViewController *)self contentView];
    v21 = [(PublisherViewController *)self publisherHeaderView];
    [v20 addSubview:v21];

    v22 = [(PublisherViewController *)self analyticsManager];
    [v22 publisherTrayRevealed];
  }
}

- (void)addCollectionView
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = [(PublisherViewController *)self apiController];
  uint64_t v5 = [v4 collectionResults];
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_100CDE7E4;
  v46[3] = &unk_1013030E8;
  id v6 = v3;
  id v47 = v6;
  [v5 enumerateObjectsUsingBlock:v46];

  objc_super v7 = [(PublisherViewController *)self apiController];
  os_signpost_id_t v8 = [v7 publisherViewIdentifiers];

  uint64_t v9 = [(PublisherViewController *)self collectionView];

  if (v9)
  {
    id v10 = [(PublisherViewController *)self dataSource];
    [v10 updateCollections:v6 usingBatchIdentifiers:v8];
  }
  else
  {
    id v11 = objc_alloc_init((Class)UICollectionViewFlowLayout);
    [(PublisherViewController *)self setFlowLayout:v11];

    objc_super v12 = [(PublisherViewController *)self flowLayout];
    [v12 setScrollDirection:0];

    id v13 = objc_alloc((Class)UICollectionView);
    v14 = [(ContaineeViewController *)self contentView];
    [v14 frame];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    id v23 = [(PublisherViewController *)self flowLayout];
    id v24 = [v13 initWithFrame:v23 collectionViewLayout:v16];
    [(PublisherViewController *)self setCollectionView:v24];

    v25 = [(PublisherViewController *)self apiController];
    id v10 = [v25 publisherViewResultFilters];

    v26 = [PublisherViewDataSource alloc];
    v27 = [(PublisherViewController *)self collectionView];
    v28 = [(PublisherViewController *)self apiController];
    v29 = [(PublisherViewController *)self analyticsManager];
    v30 = [(PublisherViewController *)self publisherHeaderView];
    v31 = [v30 actionManager];
    v32 = [(PublisherViewDataSource *)v26 initWithCollectionView:v27 usingCuratedCollections:v6 usingPlaceCollectionIds:v8 withResultFilters:v10 withAPIController:v28 withCollectionRoutingDelegate:self usingAnalyticsManager:v29 usingPublisherActionsManager:v31];
    [(PublisherViewController *)self setDataSource:v32];

    v33 = [(PublisherViewController *)self dataSource];
    [v33 setDelegate:self];

    v34 = [(PublisherViewController *)self collectionView];
    [v34 setBounces:1];

    v35 = [(PublisherViewController *)self collectionView];
    [v35 setAlwaysBounceVertical:1];

    v36 = [(PublisherViewController *)self collectionView];
    [v36 setTranslatesAutoresizingMaskIntoConstraints:0];

    v37 = +[UIColor clearColor];
    v38 = [(PublisherViewController *)self collectionView];
    [v38 setBackgroundColor:v37];

    v39 = [(ContaineeViewController *)self contentView];
    v40 = [(PublisherViewController *)self collectionView];
    v41 = [(PublisherViewController *)self publisherHeaderView];
    [v39 insertSubview:v40 belowSubview:v41];
  }
  objc_initWeak(&location, self);
  v42 = [(PublisherViewController *)self dataSource];
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_100CDE860;
  v43[3] = &unk_1012E6708;
  objc_copyWeak(&v44, &location);
  [v42 displayCollections:v43];

  objc_destroyWeak(&v44);
  objc_destroyWeak(&location);
}

- (void)activateConstraints
{
  id v3 = [(PublisherViewController *)self publisherHeaderView];
  id v4 = [v3 heightAnchor];
  uint64_t v5 = [(PublisherViewController *)self publisherHeaderView];
  [v5 maximumRequiredHeight];
  id v6 = [v4 constraintEqualToConstant:];
  [(PublisherViewController *)self setHeaderHeightConstraint:v6];

  id v45 = objc_alloc_init((Class)NSMutableArray);
  v43 = [(PublisherViewController *)self collectionView];
  v39 = [v43 leadingAnchor];
  v41 = [(ContaineeViewController *)self contentView];
  v37 = [v41 leadingAnchor];
  v35 = [v39 constraintEqualToAnchor:v37];
  v47[0] = v35;
  v33 = [(PublisherViewController *)self collectionView];
  v29 = [v33 trailingAnchor];
  v31 = [(ContaineeViewController *)self contentView];
  v28 = [v31 trailingAnchor];
  v27 = [v29 constraintEqualToAnchor:v28];
  v47[1] = v27;
  v26 = [(PublisherViewController *)self collectionView];
  v25 = [v26 topAnchor];
  objc_super v7 = [(PublisherViewController *)self publisherHeaderView];
  os_signpost_id_t v8 = [v7 bottomAnchor];
  uint64_t v9 = [v25 constraintEqualToAnchor:v8];
  v47[2] = v9;
  id v10 = [(PublisherViewController *)self collectionView];
  id v11 = [v10 bottomAnchor];
  objc_super v12 = [(ContaineeViewController *)self contentView];
  id v13 = [v12 bottomAnchor];
  v14 = [v11 constraintEqualToAnchor:v13];
  v47[3] = v14;
  double v15 = +[NSArray arrayWithObjects:v47 count:4];
  [v45 addObjectsFromArray:v15];

  id v44 = [(PublisherViewController *)self publisherHeaderView];
  v40 = [v44 topAnchor];
  v42 = [(ContaineeViewController *)self contentView];
  v38 = [v42 topAnchor];
  v36 = [v40 constraintEqualToAnchor:v38];
  v46[0] = v36;
  v34 = [(PublisherViewController *)self publisherHeaderView];
  v30 = [v34 leadingAnchor];
  v32 = [(ContaineeViewController *)self contentView];
  double v16 = [v32 leadingAnchor];
  double v17 = [v30 constraintEqualToAnchor:v16];
  v46[1] = v17;
  double v18 = [(PublisherViewController *)self publisherHeaderView];
  double v19 = [v18 trailingAnchor];
  double v20 = [(ContaineeViewController *)self contentView];
  double v21 = [v20 trailingAnchor];
  double v22 = [v19 constraintEqualToAnchor:v21];
  v46[2] = v22;
  id v23 = [(PublisherViewController *)self headerHeightConstraint];
  v46[3] = v23;
  id v24 = +[NSArray arrayWithObjects:v46 count:4];
  [v45 addObjectsFromArray:v24];

  +[NSLayoutConstraint activateConstraints:v45];
}

- (void)addDefaultHeaderView
{
  id v3 = [(PublisherViewController *)self defaultHeaderView];

  if (!v3)
  {
    id v4 = -[ContainerHeaderView initWithFrame:]([ContainerHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    [(PublisherViewController *)self setDefaultHeaderView:v4];

    uint64_t v5 = [(PublisherViewController *)self defaultHeaderView];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v6 = [(PublisherViewController *)self defaultHeaderView];
    LODWORD(v7) = 1148846080;
    [v6 setContentCompressionResistancePriority:1 forAxis:v7];

    os_signpost_id_t v8 = [(PublisherViewController *)self defaultHeaderView];
    [v8 setDelegate:self];

    uint64_t v9 = [(PublisherViewController *)self defaultHeaderView];
    [v9 setHairLineAlpha:0.0];

    id v10 = [(PublisherViewController *)self defaultHeaderView];
    [v10 setHeaderSize:2];

    id v12 = [(ContaineeViewController *)self headerView];
    id v11 = [(PublisherViewController *)self defaultHeaderView];
    [v12 addSubview:v11];
  }
}

- (void)activateDefaultHeaderConstraints
{
  id v23 = [(PublisherViewController *)self defaultHeaderView];
  double v21 = [v23 topAnchor];
  double v22 = [(ContaineeViewController *)self headerView];
  double v20 = [v22 topAnchor];
  double v19 = [v21 constraintEqualToAnchor:v20];
  v24[0] = v19;
  double v18 = [(PublisherViewController *)self defaultHeaderView];
  double v16 = [v18 leadingAnchor];
  double v17 = [(ContaineeViewController *)self headerView];
  double v15 = [v17 leadingAnchor];
  v14 = [v16 constraintEqualToAnchor:v15];
  v24[1] = v14;
  id v13 = [(PublisherViewController *)self defaultHeaderView];
  id v3 = [v13 trailingAnchor];
  id v4 = [(ContaineeViewController *)self headerView];
  uint64_t v5 = [v4 trailingAnchor];
  id v6 = [v3 constraintEqualToAnchor:v5];
  v24[2] = v6;
  double v7 = [(PublisherViewController *)self defaultHeaderView];
  os_signpost_id_t v8 = [v7 bottomAnchor];
  uint64_t v9 = [(ContaineeViewController *)self headerView];
  id v10 = [v9 bottomAnchor];
  id v11 = [v8 constraintEqualToAnchor:v10];
  v24[3] = v11;
  id v12 = +[NSArray arrayWithObjects:v24 count:4];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (void)removeDefaultHeaderView
{
  id v3 = [(ContaineeViewController *)self headerView];
  [v3 removeFromSuperview];

  id v24 = [(ContaineeViewController *)self contentView];
  double v22 = [v24 topAnchor];
  id v23 = [(PublisherViewController *)self view];
  double v21 = [v23 topAnchor];
  double v20 = [v22 constraintEqualToAnchor:v21];
  v25[0] = v20;
  double v19 = [(ContaineeViewController *)self contentView];
  double v17 = [v19 leadingAnchor];
  double v18 = [(PublisherViewController *)self view];
  double v16 = [v18 leadingAnchor];
  double v15 = [v17 constraintEqualToAnchor:v16];
  v25[1] = v15;
  v14 = [(ContaineeViewController *)self contentView];
  id v4 = [v14 trailingAnchor];
  uint64_t v5 = [(PublisherViewController *)self view];
  id v6 = [v5 trailingAnchor];
  double v7 = [v4 constraintEqualToAnchor:v6];
  v25[2] = v7;
  os_signpost_id_t v8 = [(ContaineeViewController *)self contentView];
  uint64_t v9 = [v8 bottomAnchor];
  id v10 = [(PublisherViewController *)self view];
  id v11 = [v10 bottomAnchor];
  id v12 = [v9 constraintEqualToAnchor:v11];
  v25[3] = v12;
  id v13 = +[NSArray arrayWithObjects:v25 count:4];
  +[NSLayoutConstraint activateConstraints:v13];
}

- (void)activateConstraintsForViewPinnedBelowHeader:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PublisherViewController *)self publisherHeaderView];
  if (v5) {
    [(PublisherViewController *)self publisherHeaderView];
  }
  else {
  double v18 = [(ContaineeViewController *)self headerView];
  }

  double v21 = [v4 leadingAnchor];
  double v22 = [(ContaineeViewController *)self contentView];
  double v20 = [v22 leadingAnchor];
  double v19 = [v21 constraintEqualToAnchor:v20];
  v23[0] = v19;
  double v16 = [v4 trailingAnchor];
  double v17 = [(ContaineeViewController *)self contentView];
  id v6 = [v17 trailingAnchor];
  double v7 = [v16 constraintEqualToAnchor:v6];
  v23[1] = v7;
  os_signpost_id_t v8 = [v4 topAnchor];
  uint64_t v9 = [v18 bottomAnchor];
  id v10 = [v8 constraintEqualToAnchor:v9];
  v23[2] = v10;
  id v11 = [v4 bottomAnchor];

  id v12 = [(ContaineeViewController *)self contentView];
  id v13 = [v12 bottomAnchor];
  v14 = [v11 constraintEqualToAnchor:v13];
  v23[3] = v14;
  double v15 = +[NSArray arrayWithObjects:v23 count:4];
  +[NSLayoutConstraint activateConstraints:v15];
}

- (void)addLoadingView
{
  objc_initWeak(&location, self);
  dispatch_time_t v2 = dispatch_time(0, 200000000);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100CDF738;
  v3[3] = &unk_1012E6708;
  objc_copyWeak(&v4, &location);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)removeLoadingView
{
  id v3 = [(PublisherViewController *)self loadingView];

  if (v3)
  {
    id v4 = [(PublisherViewController *)self loadingView];
    [v4 removeFromSuperview];

    [(PublisherViewController *)self setLoadingView:0];
  }
}

- (void)addErrorView
{
  id v3 = [(PublisherViewController *)self errorView];

  if (!v3)
  {
    id v4 = [(PublisherViewController *)self dataSource];
    [v4 clearPublisherData];

    uint64_t v5 = objc_alloc_init(ErrorModeView);
    [(PublisherViewController *)self setErrorView:v5];

    id v6 = [(PublisherViewController *)self apiController];
    double v7 = [v6 publisherResult];
    os_signpost_id_t v8 = [v7 publisher];
    LODWORD(v5) = [v8 isSuppressed];
    uint64_t v9 = +[NSBundle mainBundle];
    id v10 = v9;
    if (v5) {
      CFStringRef v11 = @"[Brooklyn] Error Mode featue unavailable";
    }
    else {
      CFStringRef v11 = @"[Brooklyn] Error Mode title";
    }
    id v12 = [v9 localizedStringForKey:v11 value:@"localized string not found" table:0];

    id v13 = +[NSBundle mainBundle];
    v14 = [v13 localizedStringForKey:@"[Brooklyn] Error Mode message" value:@"localized string not found" table:0];

    uint64_t v15 = MKCurrentNetworkConnectionFailureDiagnosis();
    double v16 = [(PublisherViewController *)self errorView];
    double v17 = v16;
    if (v15)
    {
      [v16 setTitle:v12 andMessage:v14];

      objc_initWeak(&location, self);
      double v18 = [(PublisherViewController *)self errorView];
      double v19 = +[NSBundle mainBundle];
      double v20 = [v19 localizedStringForKey:@"Try Again [Brooklyn]" value:@"localized string not found" table:0];
      double v21 = +[UIColor systemGray5Color];
      v28 = _NSConcreteStackBlock;
      uint64_t v29 = 3221225472;
      v30 = sub_100CDFC64;
      v31 = &unk_1012EE310;
      objc_copyWeak(&v32, &location);
      [v18 setButtonTitle:v20 glyphName:@"arrow.clockwise" backgroundColor:v21 handler:&v28];

      objc_destroyWeak(&v32);
      objc_destroyWeak(&location);
    }
    else
    {
      double v22 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubhead];
      [v17 setTitleLabelFont:v22];

      id v23 = [(PublisherViewController *)self errorView];
      [v23 setTitle:v12 andMessage:0];
    }
    id v24 = [(PublisherViewController *)self errorView];
    [v24 setTranslatesAutoresizingMaskIntoConstraints:0];

    v25 = [(ContaineeViewController *)self contentView];
    v26 = [(PublisherViewController *)self errorView];
    [v25 addSubview:v26];

    v27 = [(PublisherViewController *)self errorView];
    [(PublisherViewController *)self activateConstraintsForViewPinnedBelowHeader:v27];
  }
}

- (void)removeErrorView
{
  id v3 = [(PublisherViewController *)self errorView];

  if (v3)
  {
    id v4 = [(PublisherViewController *)self errorView];
    [v4 removeFromSuperview];

    [(PublisherViewController *)self setErrorView:0];
  }
}

- (void)removeCollectionView
{
  id v3 = [(PublisherViewController *)self collectionView];

  if (v3)
  {
    id v4 = [(PublisherViewController *)self collectionView];
    [v4 removeFromSuperview];

    [(PublisherViewController *)self setCollectionView:0];
    [(PublisherViewController *)self setDataSource:0];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)PublisherViewController;
  id v4 = a3;
  [(MapsThemeViewController *)&v16 traitCollectionDidChange:v4];
  uint64_t v5 = [(PublisherViewController *)self traitCollection];
  id v6 = [v5 preferredContentSizeCategory];
  double v7 = [v4 preferredContentSizeCategory];

  uint64_t v8 = sub_1000E93B0(v6, v7);
  if (v8)
  {
    uint64_t v9 = [(PublisherViewController *)self collectionView];
    id v10 = [v9 collectionViewLayout];
    [v10 invalidateLayout];

    id v11 = objc_alloc_init((Class)UICollectionViewFlowLayout);
    [(PublisherViewController *)self setFlowLayout:v11];

    id v12 = [(PublisherViewController *)self flowLayout];
    [v12 setScrollDirection:0];

    id v13 = [(PublisherViewController *)self flowLayout];
    v14 = [(PublisherViewController *)self collectionView];
    [v14 setCollectionViewLayout:v13];

    uint64_t v15 = [(PublisherViewController *)self collectionView];
    [v15 reloadData];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)PublisherViewController;
  id v7 = a4;
  -[ContaineeViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100CE006C;
  v9[3] = &unk_1012E81F8;
  v9[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100CE0074;
  v8[3] = &unk_1012E81F8;
  [v7 animateAlongsideTransition:v9 completion:v8];
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  v9.receiver = self;
  v9.super_class = (Class)PublisherViewController;
  [(ContaineeViewController *)&v9 scrollViewWillEndDragging:a3 withVelocity:a5 targetContentOffset:a4.x];
  id v7 = [(PublisherViewController *)self analyticsManager];
  uint64_t v8 = v7;
  if (y > 0.0) {
    [v7 publisherCollectionsScrolledDown];
  }
  else {
    [v7 publisherCollectionsScrolledUp];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ContaineeViewController *)self cardPresentationController];
  [v5 cardHeight];
  double v7 = v6;
  [(PublisherViewController *)self actualCardHeight];
  double v9 = v8;

  if (v7 >= v9)
  {
    [v4 contentOffset];
    double v11 = v10;
    id v12 = [(PublisherViewController *)self headerHeightConstraint];
    [v12 constant];
    double v14 = v13 - v11;

    uint64_t v15 = [(PublisherViewController *)self publisherHeaderView];
    [v15 maximumRequiredHeight];
    double v17 = v16;

    double v18 = [(PublisherViewController *)self publisherHeaderView];
    [v18 minimumRequiredHeight];
    double v20 = v19;

    if (v14 <= v17)
    {
      double v22 = [(PublisherViewController *)self publisherHeaderView];
      [v22 headerHeightChangedWithNewYOffset:v11];

      if (v14 >= v20)
      {
        [v4 contentOffset];
        [v4 setContentOffset:];
        double v20 = v14;
      }
    }
    else
    {
      double v21 = [(PublisherViewController *)self publisherHeaderView];
      [v21 headerHeightChangedWithNewYOffset:v11];

      v26.receiver = self;
      v26.super_class = (Class)PublisherViewController;
      [(ContaineeViewController *)&v26 scrollViewDidScroll:v4];
      double v20 = v17;
    }
    id v23 = [(PublisherViewController *)self headerHeightConstraint];
    [v23 setConstant:v20];

    id v24 = [(PublisherViewController *)self publisherHeaderView];
    v25 = [(PublisherViewController *)self headerHeightConstraint];
    [v25 constant];
    [v24 adjustLogoImageViewTopConstraint];
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)PublisherViewController;
    [(ContaineeViewController *)&v27 scrollViewDidScroll:v4];
  }
}

- (void)resetCollectionViewLayout
{
  id v3 = [(PublisherViewController *)self collectionView];
  id v4 = [v3 collectionViewLayout];
  [v4 invalidateLayout];

  id v5 = objc_alloc_init((Class)UICollectionViewFlowLayout);
  [(PublisherViewController *)self setFlowLayout:v5];

  double v6 = [(PublisherViewController *)self flowLayout];
  [v6 setScrollDirection:0];

  id v8 = [(PublisherViewController *)self flowLayout];
  double v7 = [(PublisherViewController *)self collectionView];
  [v7 setCollectionViewLayout:v8];
}

- (void)routeToCuratedCollection:(id)a3
{
  id v4 = a3;
  id v5 = [(ControlContaineeViewController *)self delegate];
  [v5 viewController:self showCuratedCollection:v4];
}

- (void)didSelectAllGuidesMenuItem
{
  if (sub_1000BBB44(self) == 5)
  {
    id v3 = [(ControlContaineeViewController *)self delegate];
    [v3 viewControllerShowAllCollections];
  }
}

- (void)didSelectShareFromView:(id)a3
{
  id v4 = a3;
  id v7 = [(ControlContaineeViewController *)self delegate];
  id v5 = [v7 appCoordinator];
  double v6 = [(PublisherViewController *)self publisher];
  [v5 sharePublisher:v6 sourceView:v4 completion:0];
}

- (void)didSelectWebsiteItem
{
  id v3 = [(PublisherViewController *)self publisher];
  id v4 = [v3 publisherAttribution];
  id v6 = [v4 websiteURL];

  id v5 = [(ControlContaineeViewController *)self delegate];
  [v5 viewController:self openURL:v6];
}

- (void)didSelectAppItem
{
  id v11 = objc_alloc_init((Class)NSNumberFormatter);
  [v11 setNumberStyle:1];
  id v3 = [(PublisherViewController *)self publisher];
  id v4 = [v3 publisherAttribution];
  id v5 = [v4 applicationAdamId];
  id v6 = [v11 numberFromString:v5];

  id v7 = [objc_alloc((Class)LSApplicationRecord) initWithStoreItemIdentifier:[v6 longLongValue] error:0];
  id v8 = [v7 applicationState];
  LODWORD(v5) = [v8 isInstalled];

  if (v5)
  {
    double v9 = +[LSApplicationWorkspace defaultWorkspace];
    double v10 = [v7 bundleIdentifier];
    [v9 openApplicationWithBundleID:v10];
  }
  else
  {
    double v9 = [(ControlContaineeViewController *)self delegate];
    [v9 viewController:self displayStoreViewControllerForAppWithiTunesIdentifier:v6 clientIdentifier:0];
  }
}

- (MKMapItemIdentifier)publisherId
{
  return self->_publisherId;
}

- (void)setPublisherId:(id)a3
{
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (void)setTraits:(id)a3
{
}

- (unint64_t)numberOfCollections
{
  return self->_numberOfCollections;
}

- (void)setNumberOfCollections:(unint64_t)a3
{
  self->_numberOfCollections = a3;
}

- (double)actualCardHeight
{
  return self->_actualCardHeight;
}

- (void)setActualCardHeight:(double)a3
{
  self->_actualCardHeight = a3;
}

- (PublisherHeaderView)publisherHeaderView
{
  return self->_publisherHeaderView;
}

- (void)setPublisherHeaderView:(id)a3
{
}

- (ContainerHeaderView)defaultHeaderView
{
  return self->_defaultHeaderView;
}

- (void)setDefaultHeaderView:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (UICollectionViewFlowLayout)flowLayout
{
  return self->_flowLayout;
}

- (void)setFlowLayout:(id)a3
{
}

- (NSLayoutConstraint)headerHeightConstraint
{
  return self->_headerHeightConstraint;
}

- (void)setHeaderHeightConstraint:(id)a3
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

- (PublisherAPIController)apiController
{
  return self->_apiController;
}

- (void)setApiController:(id)a3
{
}

- (PublisherViewDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (PublisherAnalytics)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_apiController, 0);
  objc_storeStrong((id *)&self->_errorView, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_headerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_flowLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_defaultHeaderView, 0);
  objc_storeStrong((id *)&self->_publisherHeaderView, 0);
  objc_storeStrong((id *)&self->_traits, 0);

  objc_storeStrong((id *)&self->_publisherId, 0);
}

@end