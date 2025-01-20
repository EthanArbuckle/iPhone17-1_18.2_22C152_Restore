@interface CarUnspecifiedWidgetController
- (CRSUIDashboardWidgetWindow)window;
- (CarChromeViewController)chromeViewController;
- (id)contextsForCurrentAppState;
- (void)_mapsCar_scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation CarUnspecifiedWidgetController

- (void)_mapsCar_scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v6 = a3;
  id v7 = [objc_alloc((Class)CRSUIDashboardWidgetWindow) initWithWindowScene:v6];

  [(CarUnspecifiedWidgetController *)self setWindow:v7];
  v8 = objc_alloc_init(CarUnspecifiedViewController);
  v9 = [(CarUnspecifiedWidgetController *)self window];
  [v9 setRootViewController:v8];

  id v10 = [(CarUnspecifiedWidgetController *)self window];
  [v10 setHidden:0];
}

- (void)sceneDidDisconnect:(id)a3
{
  v4 = [(CarUnspecifiedWidgetController *)self window];
  [v4 setHidden:1];

  [(CarUnspecifiedWidgetController *)self setWindow:0];
}

- (id)contextsForCurrentAppState
{
  return &__NSArray0__struct;
}

- (CarChromeViewController)chromeViewController
{
  return self->_chromeViewController;
}

- (CRSUIDashboardWidgetWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);

  objc_storeStrong((id *)&self->_chromeViewController, 0);
}

@end