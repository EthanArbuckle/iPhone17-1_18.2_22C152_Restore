@interface LookAroundModeController
- (BOOL)isDisplayingLookAroundPIP;
- (BOOL)permitsLookAroundShowing;
- (BOOL)permitsWeatherShowing;
- (BOOL)shouldResetStateAfterResigning;
- (BOOL)showsMapView;
- (BOOL)usesDefaultTransitions;
- (BOOL)wantsCompassLayoutControl;
- (BOOL)wantsLookAroundShowing;
- (BOOL)wantsMapSelectionControl;
- (BOOL)wantsWeatherShowing;
- (IOSBasedChromeViewController)chromeViewController;
- (LookAroundActionCoordination)actionCoordinator;
- (LookAroundModeController)initWithEntryPoint:(id)a3 lookAroundView:(id)a4 showsFullScreen:(BOOL)a5 originFrame:(CGRect)a6;
- (MKLookAroundView)lookAroundView;
- (ShareItemSource)currentShareItemSource;
- (id)fullscreenViewController;
- (id)fullscreenViewControllerDismissalTransition;
- (id)fullscreenViewControllerPresentationTransition;
- (id)mapViewDelegate;
- (id)personalizedItemSources;
- (id)viewsToRenderMapsScreenshotService:(id)a3;
- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)didCompleteModeTransition;
- (void)getCurrentSceneTitleWithCompletion:(id)a3;
- (void)lookAroundContainerViewControllerDidAnimateFromModeTransition:(id)a3;
- (void)mapInsetsDidChangeAnimated:(BOOL)a3;
- (void)pptTestEnterLookAroundWithEntryPoint:(id)a3 lookAroundView:(id)a4 showsFullScreen:(BOOL)a5;
- (void)prepareForExitWithCompletion:(id)a3;
- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)setChromeViewController:(id)a3;
@end

@implementation LookAroundModeController

- (LookAroundModeController)initWithEntryPoint:(id)a3 lookAroundView:(id)a4 showsFullScreen:(BOOL)a5 originFrame:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  BOOL v10 = a5;
  id v13 = a3;
  id v14 = a4;
  v19.receiver = self;
  v19.super_class = (Class)LookAroundModeController;
  v15 = [(LookAroundModeController *)&v19 init];
  if (v15)
  {
    v16 = [[LookAroundContainerViewController alloc] initWithEntryPoint:v13 lookAroundView:v14 showsFullScreen:v10];
    containerViewController = v15->_containerViewController;
    v15->_containerViewController = v16;

    [(ContainerViewController *)v15->_containerViewController setAllowOnlyStandardStyle:0];
    [(LookAroundContainerViewController *)v15->_containerViewController setAnimationDelegate:v15];
    -[LookAroundContainerViewController setOriginFrame:](v15->_containerViewController, "setOriginFrame:", x, y, width, height);
    [(ContainerViewController *)v15->_containerViewController setChromeContext:v15];
  }

  return v15;
}

- (BOOL)isDisplayingLookAroundPIP
{
  return [(LookAroundContainerViewController *)self->_containerViewController isDisplayingLookAroundPIP];
}

- (LookAroundActionCoordination)actionCoordinator
{
  return (LookAroundActionCoordination *)[(LookAroundContainerViewController *)self->_containerViewController actionCoordinator];
}

- (IOSBasedChromeViewController)chromeViewController
{
  return [(ContainerViewController *)self->_containerViewController chromeViewController];
}

- (void)setChromeViewController:(id)a3
{
}

- (MKLookAroundView)lookAroundView
{
  return [(LookAroundContainerViewController *)self->_containerViewController lookAroundView];
}

- (ShareItemSource)currentShareItemSource
{
  return [(LookAroundContainerViewController *)self->_containerViewController currentShareItemSource];
}

- (id)mapViewDelegate
{
  return self->_containerViewController;
}

- (BOOL)shouldResetStateAfterResigning
{
  return 0;
}

- (BOOL)showsMapView
{
  return 1;
}

- (BOOL)wantsCompassLayoutControl
{
  return sub_1000BBB44(self->_containerViewController) != 5;
}

- (BOOL)wantsMapSelectionControl
{
  return 1;
}

- (void)mapInsetsDidChangeAnimated:(BOOL)a3
{
  id v4 = [(LookAroundModeController *)self actionCoordinator];
  v3 = [v4 dataCoordinator];
  [v3 synchronizeMapViewIfNeeded];
}

- (id)personalizedItemSources
{
  v2 = [(LookAroundModeController *)self chromeViewController];
  v3 = [v2 searchPinsManager];

  if (v3)
  {
    id v4 = [v3 searchResultsItemSource];
    v8[0] = v4;
    v5 = [v3 singleSearchResultItemSource];
    v8[1] = v5;
    v6 = +[NSArray arrayWithObjects:v8 count:2];
  }
  else
  {
    v6 = &__NSArray0__struct;
  }

  return v6;
}

- (id)fullscreenViewControllerPresentationTransition
{
  v2 = objc_alloc_init(ToLookAroundModeTransitionController);

  return v2;
}

- (id)fullscreenViewControllerDismissalTransition
{
  v2 = objc_alloc_init(FromLookAroundModeTransitionController);

  return v2;
}

- (BOOL)usesDefaultTransitions
{
  return 0;
}

- (id)fullscreenViewController
{
  return self->_containerViewController;
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100A4028C;
  v4[3] = &unk_1012E7D28;
  v4[4] = self;
  [a4 addCompletion:v4];
}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100A40424;
  v4[3] = &unk_1012E5D08;
  v4[4] = self;
  [a4 addPreparation:v4];
}

- (void)getCurrentSceneTitleWithCompletion:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  unsigned int v5 = [(LookAroundModeController *)self isDisplayingLookAroundPIP];
  v6 = [(LookAroundModeController *)self lookAroundView];
  v7 = v6;
  if (v5) {
    [v6 sceneTitle];
  }
  else {
  id v8 = [v6 expandedSceneTitle];
  }

  v4[2](v4, v8);
}

- (void)prepareForExitWithCompletion:(id)a3
{
}

- (void)didCompleteModeTransition
{
}

- (void)lookAroundContainerViewControllerDidAnimateFromModeTransition:(id)a3
{
  lookAroundViewState = self->_lookAroundViewState;
  id v4 = [a3 lookAroundView];
  [(_LookAroundViewState *)lookAroundViewState restoreStateToLookAroundView:v4];
}

- (id)viewsToRenderMapsScreenshotService:(id)a3
{
  id v4 = [(ContainerViewController *)self->_containerViewController chromeViewController];
  unsigned int v5 = [v4 mapView];

  v6 = [(LookAroundContainerViewController *)self->_containerViewController lookAroundView];
  if ([(LookAroundModeController *)self isDisplayingLookAroundPIP])
  {
    id v13 = v5;
    v7 = &v13;
  }
  else
  {
    id v8 = +[NSUserDefaults standardUserDefaults];
    unsigned int v9 = [v8 BOOLForKey:@"__internal_kScreenshotMultipages"];

    if (v9)
    {
      v15[0] = v6;
      v15[1] = v5;
      v7 = (void **)v15;
      uint64_t v10 = 2;
      goto LABEL_7;
    }
    id v14 = v6;
    v7 = &v14;
  }
  uint64_t v10 = 1;
LABEL_7:
  v11 = +[NSArray arrayWithObjects:v7 count:v10];

  return v11;
}

- (BOOL)wantsWeatherShowing
{
  return 0;
}

- (BOOL)permitsWeatherShowing
{
  return 0;
}

- (BOOL)wantsLookAroundShowing
{
  return 0;
}

- (BOOL)permitsLookAroundShowing
{
  return 0;
}

- (void)pptTestEnterLookAroundWithEntryPoint:(id)a3 lookAroundView:(id)a4 showsFullScreen:(BOOL)a5
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookAroundViewState, 0);
  objc_storeStrong((id *)&self->_mapViewState, 0);

  objc_storeStrong((id *)&self->_containerViewController, 0);
}

@end