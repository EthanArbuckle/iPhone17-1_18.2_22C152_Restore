@interface MacContainerViewController
+ (Class)actionCoordinatorClass;
- (ContaineeContentInjection)sidebarContentInjector;
- (MacContainerViewController)initWithPlatformController:(id)a3;
- (id)_mapViewIfCurrent;
- (id)preferredFocusEnvironments;
- (id)topSidebarController_forTests;
- (void)macWillDismissPopoverContaineeController:(id)a3;
- (void)setChromeViewController:(id)a3;
- (void)setSidebarContentInjector:(id)a3;
@end

@implementation MacContainerViewController

+ (Class)actionCoordinatorClass
{
  return (Class)objc_opt_class();
}

- (MacContainerViewController)initWithPlatformController:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MacContainerViewController;
  v5 = [(ControlContainerViewController *)&v11 initWithPlatformController:v4];
  v6 = v5;
  if (v5)
  {
    [(ContainerViewController *)v5 setStackOnOppositeSide:1];
    [(ContainerViewController *)v6 macSetEnableExtendedPresentationStyles:1];
    objc_initWeak(&location, v6);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100834EF8;
    v8[3] = &unk_1012FA248;
    objc_copyWeak(&v9, &location);
    [(ContainerViewController *)v6 macSetPopoverDismissHandler:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (id)preferredFocusEnvironments
{
  v3 = [(ContainerViewController *)self currentViewController];

  if (v3)
  {
    id v4 = [(ContainerViewController *)self currentViewController];
    id v9 = v4;
    v5 = &v9;
  }
  else
  {
    id v4 = [(MacContainerViewController *)self view];
    v8 = v4;
    v5 = &v8;
  }
  v6 = +[NSArray arrayWithObjects:v5 count:1];

  return v6;
}

- (void)setChromeViewController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MacContainerViewController;
  id v4 = a3;
  [(ControlContainerViewController *)&v6 setChromeViewController:v4];
  v5 = [(MacContainerViewController *)self _mapViewIfCurrent];
  [v5 setCompassEnabled:1];

  [v4 registerAdditionalMapViewDelegate:self];
}

- (id)_mapViewIfCurrent
{
  v3 = [(ControlContainerViewController *)self chromeContext];
  id v4 = [(ContainerViewController *)self chromeViewController];
  v5 = [v4 topContext];

  if (v3 == v5)
  {
    v7 = [(ContainerViewController *)self chromeViewController];
    objc_super v6 = [v7 mapView];
  }
  else
  {
    objc_super v6 = 0;
  }

  return v6;
}

- (id)topSidebarController_forTests
{
  v3 = [(ContainerViewController *)self chromeViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(ContainerViewController *)self chromeViewController];
    objc_super v6 = [v5 topSidebarController_forTests];
  }
  else
  {
    objc_super v6 = 0;
  }

  return v6;
}

- (void)macWillDismissPopoverContaineeController:(id)a3
{
  id v4 = a3;
  v5 = [(MacContainerViewController *)self macBaseActionCoordinator];
  unsigned int v6 = [v5 shouldClearMapSelectionOnDismissOfViewController:v4];

  if (v6)
  {
    v7 = [(ControlContainerViewController *)self actionCoordinator];
    v8 = [v7 mapSelectionManager];
    [v8 clearSelectionAnimated:1];
  }
  v9.receiver = self;
  v9.super_class = (Class)MacContainerViewController;
  [(ContainerViewController *)&v9 macWillDismissPopoverContaineeController:v4];
}

- (void)setSidebarContentInjector:(id)a3
{
  v5 = (ContaineeContentInjection *)a3;
  p_sidebarContentInjector = &self->_sidebarContentInjector;
  sidebarContentInjector = self->_sidebarContentInjector;
  if (sidebarContentInjector != v5)
  {
    [(ContaineeContentInjection *)sidebarContentInjector removeContentFromMapView];
    [(ContaineeContentInjection *)*p_sidebarContentInjector setUpdateContentInjection:0];
    objc_storeStrong((id *)&self->_sidebarContentInjector, a3);
    objc_initWeak(&location, self);
    v8 = _NSConcreteStackBlock;
    uint64_t v9 = 3221225472;
    v10 = sub_1008353A4;
    objc_super v11 = &unk_1012F5260;
    objc_copyWeak(&v12, &location);
    [(ContaineeContentInjection *)*p_sidebarContentInjector setUpdateContentInjection:&v8];
    [(ContaineeContentInjection *)*p_sidebarContentInjector addContentToMapView];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (ContaineeContentInjection)sidebarContentInjector
{
  return self->_sidebarContentInjector;
}

- (void).cxx_destruct
{
}

@end