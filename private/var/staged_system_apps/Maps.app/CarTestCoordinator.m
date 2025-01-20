@interface CarTestCoordinator
- (BOOL)pptTestCanResizePlacecard;
- (BOOL)pptTestCanUpdateTrayLayout;
- (BOOL)pptTestHasNextStep;
- (BOOL)pptTestIsTrayType:(int64_t)a3;
- (BOOL)pptTestMoveToBoardStep;
- (BOOL)pptTestSupportStepping;
- (MKMapView)mapViewForPPTTest;
- (UIScrollView)pptTestScrollView;
- (UIScrollView)pptTestScrollViewForDirectionsDetails;
- (UIScrollView)pptTestScrollViewForProactive;
- (UIViewController)pptTestContaineeForDirectionsDetails;
- (id)_pptChromeTrayCoordinatorForCurrentMode;
- (id)forcedAutohideToken;
- (int64_t)pptTestCurrentStepIndex;
- (void)pptSelectKeyboardInteractionModel;
- (void)pptTestAutocompleteSearchForFieldItem:(id)a3;
- (void)pptTestEndNavigation;
- (void)pptTestEnterSearchMode;
- (void)pptTestOpenRecents;
- (void)pptTestSearchEndEditing;
- (void)pptTestSearchForFieldItem:(id)a3;
- (void)pptTestSearchNearbyCategoryWithIndex:(unint64_t)a3;
- (void)pptTestStartNavigation;
- (void)pptTestUpdateTrayLayout:(unint64_t)a3 animated:(BOOL)a4;
- (void)setChromeHidden:(BOOL)a3;
- (void)setForcedAutohideToken:(id)a3;
@end

@implementation CarTestCoordinator

- (MKMapView)mapViewForPPTTest
{
  v2 = +[CarDisplayController sharedInstance];
  v3 = [v2 chromeViewController];
  v4 = [v3 mapView];

  return (MKMapView *)v4;
}

- (void)setChromeHidden:(BOOL)a3
{
  if (a3)
  {
    v4 = [(CarTestCoordinator *)self forcedAutohideToken];

    if (!v4)
    {
      v5 = +[CarDisplayController sharedInstance];
      id v7 = [v5 chromeViewController];

      v6 = [v7 acquireForcedAutohideBehaviourTokenWithBehaviour:1];
      [(CarTestCoordinator *)self setForcedAutohideToken:v6];
    }
  }
  else
  {
    [(CarTestCoordinator *)self setForcedAutohideToken:0];
  }
}

- (BOOL)pptTestCanResizePlacecard
{
  return 0;
}

- (void)pptTestSearchNearbyCategoryWithIndex:(unint64_t)a3
{
  v3 = +[CarDisplayController sharedInstance];
  v4 = [v3 chromeViewController];
  id v5 = [v4 topContext];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 _ppt_selectFirstCarplayBrowseCategory];
  }
}

- (void)pptTestAutocompleteSearchForFieldItem:(id)a3
{
  id v8 = a3;
  v3 = +[CarDisplayController sharedInstance];
  v4 = [v3 chromeViewController];
  id v5 = [v4 topContext];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    id v7 = [v8 searchString];
    [v6 pptHandleTextChange:v7];
  }
}

- (void)pptTestSearchEndEditing
{
  v2 = +[CarDisplayController sharedInstance];
  v3 = [v2 chromeViewController];
  id v4 = [v3 topContext];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 pptEndEditing];
  }
}

- (void)pptTestSearchForFieldItem:(id)a3
{
  id v8 = a3;
  v3 = +[CarDisplayController sharedInstance];
  id v4 = [v3 chromeViewController];
  id v5 = [v4 topContext];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    id v7 = [v8 searchString];
    [v6 pptInvokeSearch:v7];
  }
}

- (void)pptSelectKeyboardInteractionModel
{
  v2 = +[CarDisplayController sharedInstance];
  v3 = [v2 chromeViewController];
  id v4 = [v3 topContext];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 _ppt_selectKeyboardMode];
  }
}

- (void)pptTestEnterSearchMode
{
  v2 = +[CarChromeModeCoordinator sharedInstance];
  [v2 displayMapBrowsing];

  id v3 = +[CarChromeModeCoordinator sharedInstance];
  [v3 displaySearchCategories];
}

- (UIViewController)pptTestContaineeForDirectionsDetails
{
  return 0;
}

- (UIScrollView)pptTestScrollViewForDirectionsDetails
{
  return 0;
}

- (void)pptTestStartNavigation
{
  v2 = +[CarDisplayController sharedInstance];
  id v3 = [v2 chromeViewController];
  id v4 = [v3 topContext];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 pptTestStartNavigation];
  }
}

- (void)pptTestEndNavigation
{
  v2 = +[CarDisplayController sharedInstance];
  id v3 = [v2 chromeViewController];
  id v4 = [v3 topContext];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 endNavigation];
  }
}

- (BOOL)pptTestSupportStepping
{
  return 0;
}

- (int64_t)pptTestCurrentStepIndex
{
  return 0;
}

- (BOOL)pptTestHasNextStep
{
  return 0;
}

- (BOOL)pptTestMoveToBoardStep
{
  return 0;
}

- (UIScrollView)pptTestScrollViewForProactive
{
  return 0;
}

- (void)pptTestOpenRecents
{
  id v2 = +[CarChromeModeCoordinator sharedInstance];
  [v2 displayDestinations];
}

- (BOOL)pptTestCanUpdateTrayLayout
{
  uint64_t v2 = +[CarDisplayController sharedInstance];
  id v3 = [(id)v2 chromeViewController];
  id v4 = [v3 topContext];

  objc_opt_class();
  LOBYTE(v2) = objc_opt_isKindOfClass();

  return v2 & 1;
}

- (void)pptTestUpdateTrayLayout:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = +[CarDisplayController sharedInstance];
  id v7 = [v6 chromeViewController];
  id v8 = [v7 topContext];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v8 setTrayExpanded:a3 != 0 animated:v4];
  }
}

- (BOOL)pptTestIsTrayType:(int64_t)a3
{
  return 1;
}

- (UIScrollView)pptTestScrollView
{
  uint64_t v2 = +[CarDisplayController sharedInstance];
  id v3 = [v2 chromeViewController];
  BOOL v4 = [v3 topContext];

  if (objc_opt_respondsToSelector())
  {
    id v5 = [v4 pptTestScrollView];
  }
  else
  {
    id v5 = 0;
  }

  return (UIScrollView *)v5;
}

- (id)_pptChromeTrayCoordinatorForCurrentMode
{
  return 0;
}

- (id)forcedAutohideToken
{
  return self->_forcedAutohideToken;
}

- (void)setForcedAutohideToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end