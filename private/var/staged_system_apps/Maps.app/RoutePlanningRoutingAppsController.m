@interface RoutePlanningRoutingAppsController
- (RoutePlanningRoutingAppsController)initWithDataCoordination:(id)a3;
- (int64_t)observedRoutePlanningData;
- (void)_updateWaypointSet:(id)a3;
- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4;
- (void)routePlanningDataCoordinator:(id)a3 didUpdateResolvedWaypointSet:(id)a4;
- (void)routingAppSelectionControllerDidCancel:(id)a3;
@end

@implementation RoutePlanningRoutingAppsController

- (RoutePlanningRoutingAppsController)initWithDataCoordination:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RoutePlanningRoutingAppsController;
  v5 = [(RoutePlanningWrapperViewController *)&v12 initWithDataCoordination:v4];
  v6 = v5;
  if (v5)
  {
    v7 = [(RoutePlanningWrapperViewController *)v5 dataCoordinator];
    [v7 addObserver:v6];

    v8 = -[RoutingAppSelectionController initWithTransportType:]([RoutingAppSelectionController alloc], "initWithTransportType:", [v4 transportType]);
    [(RoutePlanningWrapperViewController *)v6 setWrappedViewController:v8];

    v9 = [v4 resolvedWaypointSet];
    [(RoutePlanningRoutingAppsController *)v6 _updateWaypointSet:v9];

    v10 = [(RoutePlanningWrapperViewController *)v6 wrappedViewController];
    [v10 setDelegate:v6];
  }
  return v6;
}

- (void)_updateWaypointSet:(id)a3
{
  id v9 = a3;
  if (v9)
  {
    id v4 = [(RoutePlanningWrapperViewController *)self wrappedViewController];
    [v4 updateForWaypointSet:v9];
  }
  if ([(RoutePlanningRoutingAppsController *)self isViewLoaded])
  {
    v5 = [(RoutePlanningWrapperViewController *)self wrappedViewController];
    v6 = [v5 navigationItem];
    v7 = [v6 title];
    v8 = [(RoutePlanningWrapperViewController *)self titleHeaderView];
    [v8 setTitle:v7];
  }
}

- (int64_t)observedRoutePlanningData
{
  return 4;
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateResolvedWaypointSet:(id)a4
{
}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(RoutePlanningWrapperViewController *)self wrappedViewController];
  [v7 reset];

  v8.receiver = self;
  v8.super_class = (Class)RoutePlanningRoutingAppsController;
  [(RoutePlanningWrapperViewController *)&v8 headerViewButtonTapped:v6 buttonType:a4];
}

- (void)routingAppSelectionControllerDidCancel:(id)a3
{
  id v4 = sub_1005762E4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v9 = 136315650;
    v10 = "-[RoutePlanningRoutingAppsController routingAppSelectionControllerDidCancel:]";
    __int16 v11 = 2080;
    objc_super v12 = "RoutePlanningRoutingAppsController.m";
    __int16 v13 = 1024;
    int v14 = 71;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v9, 0x1Cu);
  }

  if (sub_100BB36BC())
  {
    v5 = sub_1005762E4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = +[NSThread callStackSymbols];
      int v9 = 138412290;
      v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v9, 0xCu);
    }
  }
  v7 = [(RoutePlanningWrapperViewController *)self wrappedViewController];
  [v7 reset];

  objc_super v8 = [(ContaineeViewController *)self containeeDelegate];
  [v8 containeeViewControllerGoToPreviousState:self withSender:0];
}

@end