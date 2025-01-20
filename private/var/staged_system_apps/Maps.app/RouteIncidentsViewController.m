@interface RouteIncidentsViewController
- (CGSize)_calculatePreferredContentSize;
- (GEOAdvisoriesInfo)advisoriesInfo;
- (GEOComposedRouteAdvisory)advisory;
- (NSArray)transitIncidents;
- (RouteIncidentsViewController)initWithDataCoordination:(id)a3;
- (void)_doneTapped:(id)a3;
- (void)_updatePreferredContentSize;
- (void)dealloc;
- (void)didTapDownloadForLocation:(id)a3;
- (void)didUpdateDataSource;
- (void)handleDismissAction:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)resetForDismiss;
- (void)setAdvisoriesInfo:(id)a3;
- (void)setAdvisory:(id)a3;
- (void)setTransitIncidents:(id)a3;
- (void)updateHeaderTitle;
- (void)viewDidLoad;
@end

@implementation RouteIncidentsViewController

- (RouteIncidentsViewController)initWithDataCoordination:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)RouteIncidentsViewController;
  v3 = [(RoutePlanningWrapperViewController *)&v10 initWithDataCoordination:a3];
  if (v3)
  {
    v4 = objc_alloc_init(MapsIncidentsViewController);
    [(RoutePlanningWrapperViewController *)v3 setWrappedViewController:v4];

    v5 = [(RoutePlanningWrapperViewController *)v3 wrappedViewController];
    [v5 setDelegate:v3];

    BOOL v6 = sub_1000BBB44(v3) == 5;
    v7 = [(ContaineeViewController *)v3 cardPresentationController];
    [v7 setPresentedModally:v6];

    v8 = [(ContaineeViewController *)v3 cardPresentationController];
    [v8 setTakesAvailableHeight:0];
  }
  return v3;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)RouteIncidentsViewController;
  [(RoutePlanningWrapperViewController *)&v6 viewDidLoad];
  v3 = [(RouteIncidentsViewController *)self view];
  [v3 setAccessibilityIdentifier:@"RouteIncidentsView"];

  if (sub_1000BBB44(self) == 5)
  {
    -[RouteIncidentsViewController setPreferredContentSize:](self, "setPreferredContentSize:", 282.0, 282.0);
    self->_didStartObservingTableViewContentSize = 1;
    [(RouteIncidentsViewController *)self _updatePreferredContentSize];
    v4 = [(RoutePlanningWrapperViewController *)self wrappedViewController];
    v5 = [v4 tableView];
    [v5 addObserver:self forKeyPath:@"contentSize" options:1 context:&unk_1016104D0];
  }
}

- (void)updateHeaderTitle
{
  v2.receiver = self;
  v2.super_class = (Class)RouteIncidentsViewController;
  [(RoutePlanningWrapperViewController *)&v2 updateHeaderTitle];
}

- (void)dealloc
{
  if (self->_didStartObservingTableViewContentSize)
  {
    self->_didStartObservingTableViewContentSize = 0;
    v3 = [(RoutePlanningWrapperViewController *)self wrappedViewController];
    v4 = [v3 tableView];
    [v4 removeObserver:self forKeyPath:@"contentSize" context:&unk_1016104D0];
  }
  v5.receiver = self;
  v5.super_class = (Class)RouteIncidentsViewController;
  [(RouteIncidentsViewController *)&v5 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &unk_1016104D0)
  {
    [(RouteIncidentsViewController *)self _updatePreferredContentSize];
  }
  else
  {
    uint64_t v9 = v6;
    uint64_t v10 = v7;
    v8.receiver = self;
    v8.super_class = (Class)RouteIncidentsViewController;
    -[RouteIncidentsViewController observeValueForKeyPath:ofObject:change:context:](&v8, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)_updatePreferredContentSize
{
  if (![(RouteIncidentsViewController *)self isViewLoaded] || sub_1000BBB44(self) != 5) {
    return;
  }
  v3 = [(RouteIncidentsViewController *)self advisory];
  if (v3
    || ([(RouteIncidentsViewController *)self transitIncidents],
        v3 = objc_claimAutoreleasedReturnValue(),
        [v3 count]))
  {

    goto LABEL_6;
  }
  v11 = [(RouteIncidentsViewController *)self advisoriesInfo];

  if (v11)
  {
LABEL_6:
    [(RouteIncidentsViewController *)self _calculatePreferredContentSize];
    double v5 = v4;
    double v7 = v6;
    [(RouteIncidentsViewController *)self preferredContentSize];
    if (v5 == v9 && v7 == v8) {
      return;
    }
    -[RouteIncidentsViewController setPreferredContentSize:](self, "setPreferredContentSize:", v5, v7);
    id v12 = [(RoutePlanningWrapperViewController *)self wrappedViewController];
    uint64_t v10 = [v12 tableView];
    [v10 setContentOffset:CGPointZero animated:0];

    goto LABEL_10;
  }
  id v12 = [(RouteIncidentsViewController *)self presentingViewController];
  [v12 dismissViewControllerAnimated:0 completion:0];
LABEL_10:
}

- (CGSize)_calculatePreferredContentSize
{
  unsigned int v3 = [(RouteIncidentsViewController *)self isViewLoaded];
  double v4 = 282.0;
  if (v3)
  {
    uint64_t v5 = sub_1000BBB44(self);
    double v4 = 282.0;
    if (v5 == 5)
    {
      double v6 = [(RouteIncidentsViewController *)self view];
      [v6 layoutIfNeeded];

      double v7 = [(RoutePlanningWrapperViewController *)self wrappedViewController];
      double v8 = [v7 tableView];
      [v8 contentSize];
      double v10 = v9;

      v11 = +[UIScreen mainScreen];
      [v11 bounds];
      double v13 = v12;

      if (v10 >= v13) {
        double v14 = v13;
      }
      else {
        double v14 = v10;
      }
      double v4 = fmax(v14, 100.0);
    }
  }
  double v15 = 282.0;
  result.height = v4;
  result.width = v15;
  return result;
}

- (void)didUpdateDataSource
{
  if ([(RouteIncidentsViewController *)self isViewLoaded])
  {
    [(RouteIncidentsViewController *)self updateHeaderTitle];
    unsigned int v3 = [(RoutePlanningWrapperViewController *)self wrappedViewController];
    double v4 = [v3 navigationItem];
    uint64_t v5 = [v4 title];
    double v6 = [(RoutePlanningWrapperViewController *)self titleHeaderView];
    [v6 setTitle:v5];

    [(RouteIncidentsViewController *)self _updatePreferredContentSize];
  }
}

- (void)setTransitIncidents:(id)a3
{
  id v10 = a3;
  double v4 = [(RoutePlanningWrapperViewController *)self wrappedViewController];
  id v5 = [v4 transitIncidents];
  if (v5 == v10)
  {
  }
  else
  {
    double v6 = [(RoutePlanningWrapperViewController *)self wrappedViewController];
    double v7 = [v6 transitIncidents];
    unsigned __int8 v8 = [v10 isEqualToArray:v7];

    if ((v8 & 1) == 0)
    {
      double v9 = [(RoutePlanningWrapperViewController *)self wrappedViewController];
      [v9 setTransitIncidents:v10];

      [(RouteIncidentsViewController *)self didUpdateDataSource];
    }
  }
}

- (NSArray)transitIncidents
{
  objc_super v2 = [(RoutePlanningWrapperViewController *)self wrappedViewController];
  unsigned int v3 = [v2 transitIncidents];

  return (NSArray *)v3;
}

- (void)setAdvisoriesInfo:(id)a3
{
  id v11 = a3;
  if (MapsFeature_IsEnabled_FrenchClimateLaw())
  {
    double v4 = [(RoutePlanningWrapperViewController *)self wrappedViewController];
    id v5 = [v4 advisoriesInfo];
    unint64_t v6 = (unint64_t)v11;
    unint64_t v7 = v5;
    if (v6 | v7)
    {
      unsigned __int8 v8 = (void *)v7;
      unsigned __int8 v9 = [(id)v6 isEqual:v7];

      if ((v9 & 1) == 0)
      {
        id v10 = [(RoutePlanningWrapperViewController *)self wrappedViewController];
        [v10 setAdvisoriesInfo:v6];

        [(RouteIncidentsViewController *)self didUpdateDataSource];
      }
    }
    else
    {
    }
  }
}

- (GEOAdvisoriesInfo)advisoriesInfo
{
  if (MapsFeature_IsEnabled_FrenchClimateLaw())
  {
    unsigned int v3 = [(RoutePlanningWrapperViewController *)self wrappedViewController];
    double v4 = [v3 advisoriesInfo];
  }
  else
  {
    double v4 = 0;
  }

  return (GEOAdvisoriesInfo *)v4;
}

- (void)setAdvisory:(id)a3
{
  id v4 = a3;
  id v5 = [(RoutePlanningWrapperViewController *)self wrappedViewController];
  unint64_t v6 = [v5 advisory];
  unint64_t v10 = (unint64_t)v4;
  unint64_t v7 = v6;
  if (v10 | v7)
  {
    unsigned __int8 v8 = [(id)v10 isEqual:v7];

    if ((v8 & 1) == 0)
    {
      unsigned __int8 v9 = [(RoutePlanningWrapperViewController *)self wrappedViewController];
      [v9 setAdvisory:v10];

      [(RouteIncidentsViewController *)self didUpdateDataSource];
    }
  }
  else
  {
  }
}

- (GEOComposedRouteAdvisory)advisory
{
  objc_super v2 = [(RoutePlanningWrapperViewController *)self wrappedViewController];
  unsigned int v3 = [v2 advisory];

  return (GEOComposedRouteAdvisory *)v3;
}

- (void)resetForDismiss
{
  unsigned int v3 = [(RoutePlanningWrapperViewController *)self wrappedViewController];
  [v3 setTransitIncidents:0];

  id v4 = [(RoutePlanningWrapperViewController *)self wrappedViewController];
  [v4 setAdvisory:0];

  id v5 = [(RoutePlanningWrapperViewController *)self wrappedViewController];
  [v5 setAdvisoriesInfo:0];
}

- (void)handleDismissAction:(id)a3
{
}

- (void)_doneTapped:(id)a3
{
  id v4 = a3;
  id v5 = +[MKMapService sharedService];
  unint64_t v6 = [(RouteIncidentsViewController *)self advisory];
  unint64_t v7 = [v6 advisoryItems];
  [v5 captureUserAction:41 onTarget:46 forAdvisoryItems:v7];

  id v8 = [(ContaineeViewController *)self containeeDelegate];
  [v8 containeeViewControllerGoToPreviousState:self withSender:v4];
}

- (void)didTapDownloadForLocation:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)GEOMapRegion);
  [v4 lat];
  double v7 = v6;
  [v4 lng];
  id v9 = [v5 initWithLatitude:v7 longitude:v8];
  unint64_t v10 = [(RouteIncidentsViewController *)self _maps_mapsSceneDelegate];
  id v11 = [v10 appCoordinator];
  double v12 = [v11 baseActionCoordinator];

  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100A2668C;
  v14[3] = &unk_101314AC8;
  objc_copyWeak(&v16, &location);
  id v13 = v12;
  id v15 = v13;
  [v13 viewController:self showOfflineMapRegionSelectorForRegion:v9 name:0 dismissalBlock:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

@end