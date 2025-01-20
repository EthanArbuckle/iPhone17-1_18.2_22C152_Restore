@interface MacBaseActionCoordinator
- (BOOL)chromeDidClearMapSelection;
- (BOOL)shouldClearMapSelectionOnDismissOfViewController:(id)a3;
- (BOOL)shouldReusePlaceCardViewController:(id)a3;
- (CollectionHandler)injectedCollection;
- (ContaineeContentInjection)sidebarContentInjector;
- (id)macChromeViewController;
- (void)deferPresentingMapPopoversInsideBlock:(id)a3;
- (void)handleMapViewTapToDeselect;
- (void)makeMapViewFirstResponder;
- (void)setSidebarContentInjector:(id)a3;
- (void)toggleRoutePlanning;
- (void)viewController:(id)a3 doSearchItem:(id)a4 withUserInfo:(id)a5;
- (void)viewController:(id)a3 removeDroppedPin:(id)a4;
- (void)viewController:(id)a3 selectPersonalizedItem:(id)a4 source:(unint64_t)a5 saveSelectionState:(BOOL)a6;
- (void)viewController:(id)a3 selectSearchResult:(id)a4 addToHistory:(BOOL)a5 source:(unint64_t)a6 saveSelectionState:(BOOL)a7 replaceCurrentCard:(BOOL)a8;
- (void)viewControllerGoPreviousState:(id)a3 withSender:(id)a4;
@end

@implementation MacBaseActionCoordinator

- (id)macChromeViewController
{
  v2 = [(MacBaseActionCoordinator *)self macContainerViewController];
  v3 = [v2 chromeViewController];

  return v3;
}

- (void)viewController:(id)a3 selectPersonalizedItem:(id)a4 source:(unint64_t)a5 saveSelectionState:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = [(MacBaseActionCoordinator *)self macContainerViewController];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100D84790;
  v15[3] = &unk_1012F97C8;
  id v16 = v10;
  id v17 = v11;
  BOOL v20 = a6;
  v18 = self;
  unint64_t v19 = a5;
  id v13 = v11;
  id v14 = v10;
  [v12 deferPresentingMapPopoversInsideBlock:v15];
}

- (void)viewController:(id)a3 doSearchItem:(id)a4 withUserInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(MacBaseActionCoordinator *)self macContainerViewController];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100D848D4;
  v15[3] = &unk_1012E85E0;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  unint64_t v19 = self;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 deferPresentingMapPopoversInsideBlock:v15];
}

- (void)viewController:(id)a3 selectSearchResult:(id)a4 addToHistory:(BOOL)a5 source:(unint64_t)a6 saveSelectionState:(BOOL)a7 replaceCurrentCard:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = [(MacBaseActionCoordinator *)self macContainerViewController];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100D84A18;
  v19[3] = &unk_1013239D8;
  id v20 = v15;
  id v21 = v14;
  BOOL v24 = a5;
  BOOL v25 = a7;
  BOOL v26 = a8;
  v22 = self;
  unint64_t v23 = a6;
  id v17 = v14;
  id v18 = v15;
  [v16 deferPresentingMapPopoversInsideBlock:v19];
}

- (BOOL)shouldReusePlaceCardViewController:(id)a3
{
  return 0;
}

- (void)viewControllerGoPreviousState:(id)a3 withSender:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MacBaseActionCoordinator;
  [(ActionCoordinator *)&v7 viewControllerGoPreviousState:a3 withSender:a4];
  v5 = [[HomeDeselectionReason alloc] initWithAction:1];
  v6 = [(ActionCoordinator *)self searchViewControllerIfLoaded];
  [v6 clearSelectionWithReason:v5];
}

- (void)toggleRoutePlanning
{
  unsigned int v3 = [(ActionCoordinator *)self isRoutePlanningPresented];
  v7.receiver = self;
  v7.super_class = (Class)MacBaseActionCoordinator;
  [(ActionCoordinator *)&v7 toggleRoutePlanning];
  unsigned __int8 v4 = [(ActionCoordinator *)self isRoutePlanningPresented];
  if (v3)
  {
    if ((v4 & 1) == 0)
    {
      v5 = [[HomeDeselectionReason alloc] initWithAction:2];
      v6 = [(ActionCoordinator *)self searchViewControllerIfLoaded];
      [v6 clearSelectionWithReason:v5];
    }
  }
}

- (void)handleMapViewTapToDeselect
{
  unsigned __int8 v4 = [[HomeDeselectionReason alloc] initWithAction:3];
  unsigned int v3 = [(ActionCoordinator *)self searchViewControllerIfLoaded];
  [v3 clearSelectionWithReason:v4];
}

- (BOOL)shouldClearMapSelectionOnDismissOfViewController:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&OBJC_PROTOCOL___MapItemProviding])
  {
    id v5 = v4;
    v6 = [(ActionCoordinator *)self mapSelectionManager];
    objc_super v7 = [v5 mapItem];

    unsigned __int8 v8 = [v6 isMapItemSelected:v7];
  }
  else
  {
    objc_opt_class();
    unsigned __int8 v8 = objc_opt_isKindOfClass() ^ 1;
  }

  return v8 & 1;
}

- (void)makeMapViewFirstResponder
{
  id v3 = [(MacBaseActionCoordinator *)self macChromeViewController];
  v2 = [v3 mapView];
  [v2 becomeFirstResponder];
}

- (void)viewController:(id)a3 removeDroppedPin:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MacBaseActionCoordinator;
  [(ActionCoordinator *)&v8 viewController:a3 removeDroppedPin:a4];
  id v5 = [(MacBaseActionCoordinator *)self macChromeViewController];
  v6 = [v5 mapView];
  objc_super v7 = [v6 _mapLayer];
  [v7 clearPreviouslySelectedLabelMarker];
}

- (BOOL)chromeDidClearMapSelection
{
  v7.receiver = self;
  v7.super_class = (Class)MacBaseActionCoordinator;
  BOOL v3 = [(ActionCoordinator *)&v7 chromeDidClearMapSelection];
  id v4 = [(ActionCoordinator *)self placeCardViewControllerIfLoaded];

  if (v4)
  {
    id v5 = [(ActionCoordinator *)self placeCardViewControllerIfLoaded];
    [(ActionCoordinator *)self dismissPlaceCardViewController:v5];
  }
  return v3;
}

- (void)deferPresentingMapPopoversInsideBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(MacBaseActionCoordinator *)self macContainerViewController];
  [v5 deferPresentingMapPopoversInsideBlock:v4];
}

- (ContaineeContentInjection)sidebarContentInjector
{
  v2 = [(MacBaseActionCoordinator *)self macContainerViewController];
  BOOL v3 = [v2 sidebarContentInjector];

  return (ContaineeContentInjection *)v3;
}

- (void)setSidebarContentInjector:(id)a3
{
  id v4 = a3;
  id v5 = [(MacBaseActionCoordinator *)self macContainerViewController];
  [v5 setSidebarContentInjector:v4];

  id v6 = +[UIMenuSystem mainSystem];
  [v6 setNeedsRebuild];
}

- (CollectionHandler)injectedCollection
{
  v2 = [(MacBaseActionCoordinator *)self sidebarContentInjector];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v3 = [v2 collection];
  }
  else
  {
    BOOL v3 = 0;
  }

  return (CollectionHandler *)v3;
}

@end