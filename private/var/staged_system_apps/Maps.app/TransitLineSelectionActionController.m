@interface TransitLineSelectionActionController
- (ActionCoordination)coordinator;
- (BOOL)_shouldRestoreDisplayedViewModeForContext:(id)a3;
- (BOOL)isActive;
- (BOOL)isShowingLineForLabelMarker:(id)a3;
- (BOOL)isShowingLineForLineItem:(id)a3;
- (BOOL)isShowingLineWithIdentifier:(id)a3;
- (ControlContainerViewController)containerViewController;
- (TransitLineDisambiguationViewController)disambiguationVC;
- (TransitLineSelectionActionController)init;
- (TransitLineSelectionActionController)initWithContainerViewController:(id)a3 actionCoordinator:(id)a4;
- (id)_traits;
- (id)mapView;
- (void)_clearTransitLineSelectionDeactivate:(BOOL)a3 context:(id)a4;
- (void)_disambiguateSelectedLineForLabelMarker:(id)a3 onActivation:(id)a4;
- (void)_showTransitLineWithName:(id)a3 identifier:(id)a4 mapRegion:(id)a5;
- (void)_zoomToRegionForLineIfNecessary:(id)a3 region:(id)a4 withStartingRegion:(id)a5 startedShowingLineDate:(id)a6;
- (void)containeeViewControllerGoToPreviousState:(id)a3 withSender:(id)a4;
- (void)deactivateWithContext:(id)a3;
- (void)selectLine:(id)a3 zoomToMapRegion:(BOOL)a4 onActivation:(id)a5;
- (void)selectLineForLabelMarker:(id)a3 zoomToMapRegion:(BOOL)a4 onActivation:(id)a5;
- (void)setContainerViewController:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setDisambiguationVC:(id)a3;
@end

@implementation TransitLineSelectionActionController

- (TransitLineSelectionActionController)initWithContainerViewController:(id)a3 actionCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TransitLineSelectionActionController;
  v8 = [(TransitLineSelectionActionController *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(TransitLineSelectionActionController *)v8 setContainerViewController:v6];
    [(TransitLineSelectionActionController *)v9 setCoordinator:v7];
  }

  return v9;
}

- (TransitLineSelectionActionController)init
{
  return [(TransitLineSelectionActionController *)self initWithContainerViewController:0 actionCoordinator:0];
}

- (id)_traits
{
  v3 = +[MKMapService sharedService];
  v4 = [(TransitLineSelectionActionController *)self mapView];
  v5 = [v4 mapRegion];
  id v6 = [v3 mapsDefaultTraitsForMapRegion:v5 source:20];

  return v6;
}

- (void)selectLineForLabelMarker:(id)a3 zoomToMapRegion:(BOOL)a4 onActivation:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [v8 countFeatureIDs];
  objc_super v11 = [(TransitLineSelectionActionController *)self mapView];
  v12 = [v11 mapRegion];
  v13 = +[NSDate date];
  if ((unint64_t)objc_msgSend(v8, "_maps_numLines") < 2)
  {
    if (v10 == (id)1)
    {
      v14 = [v8 _maps_lineIdentifiers];
      v15 = [v14 firstObject];

      [v11 _deselectLabelMarkerAnimated:1];
      v16 = [v8 title];
      [(TransitLineSelectionActionController *)self _showTransitLineWithName:v16 identifier:v15 mapRegion:0];

      v17 = [(TransitLineSelectionActionController *)self _traits];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100BCCB64;
      v19[3] = &unk_10131AAA0;
      BOOL v25 = a4;
      id v20 = v15;
      v21 = self;
      id v22 = v12;
      id v23 = v13;
      id v24 = v9;
      id v18 = v15;
      [v8 _maps_loadLineInfoUsingTraits:v17 withCompletion:v19];
    }
    else
    {
      [v11 _deselectLabelMarkerAnimated:1];
    }
  }
  else
  {
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100BCCA7C;
    v26[3] = &unk_10131AA78;
    BOOL v29 = a4;
    id v28 = v9;
    v26[4] = self;
    id v27 = v13;
    [(TransitLineSelectionActionController *)self _disambiguateSelectedLineForLabelMarker:v8 onActivation:v26];
  }
}

- (void)selectLine:(id)a3 zoomToMapRegion:(BOOL)a4 onActivation:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(TransitLineSelectionActionController *)self mapView];
  objc_super v11 = +[NSDate date];
  v12 = [v10 mapRegion];
  v13 = MKMapItemIdentifierFromGEOTransitLine();
  v14 = [v8 name];
  if (a4)
  {
    v15 = [v8 mapRegion];
    [(TransitLineSelectionActionController *)self _showTransitLineWithName:v14 identifier:v13 mapRegion:v15];
  }
  else
  {
    [(TransitLineSelectionActionController *)self _showTransitLineWithName:v14 identifier:v13 mapRegion:0];
  }

  if (sub_1003A1138(v8))
  {
    v16 = +[MKMapService sharedService];
    v30 = v13;
    +[NSArray arrayWithObjects:&v30 count:1];
    BOOL v23 = a4;
    v17 = v10;
    v19 = id v18 = v11;
    [(TransitLineSelectionActionController *)self _traits];
    id v20 = v9;
    id v22 = v21 = v12;
    id v24 = [v16 ticketForTransitLines:v19 traits:v22];

    v12 = v21;
    id v9 = v20;

    objc_super v11 = v18;
    id v10 = v17;

    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100BCCFE4;
    v25[3] = &unk_10131AAC8;
    BOOL v29 = v23;
    id v28 = v20;
    v25[4] = self;
    id v26 = v12;
    id v27 = v11;
    [v24 submitWithHandler:v25 networkActivity:0];
  }
  else if (v9)
  {
    (*((void (**)(id, id, void))v9 + 2))(v9, v8, 0);
  }
}

- (BOOL)isActive
{
  v2 = [(TransitLineSelectionActionController *)self mapView];
  BOOL v3 = [v2 _applicationState] == 4;

  return v3;
}

- (BOOL)isShowingLineForLabelMarker:(id)a3
{
  id v4 = a3;
  if (-[TransitLineSelectionActionController isActive](self, "isActive") && objc_msgSend(v4, "_maps_numLines") == (id)1)
  {
    v5 = [(TransitLineSelectionActionController *)self mapView];
    id v6 = [v5 _selectedTransitLineIDs];
    id v7 = [v4 _maps_lineIdentifiers];
    unsigned __int8 v8 = [v6 isEqualToArray:v7];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)isShowingLineForLineItem:(id)a3
{
  id v4 = MKMapItemIdentifierFromGEOTransitLine();
  LOBYTE(self) = [(TransitLineSelectionActionController *)self isShowingLineWithIdentifier:v4];

  return (char)self;
}

- (BOOL)isShowingLineWithIdentifier:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(TransitLineSelectionActionController *)self isActive];
  unsigned __int8 v6 = 0;
  if (v4 && v5)
  {
    id v7 = [(TransitLineSelectionActionController *)self mapView];
    unsigned __int8 v8 = [v7 _selectedTransitLineIDs];
    id v11 = v4;
    id v9 = +[NSArray arrayWithObjects:&v11 count:1];
    unsigned __int8 v6 = [v8 isEqualToArray:v9];
  }
  return v6;
}

- (void)deactivateWithContext:(id)a3
{
}

- (id)mapView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  BOOL v3 = [WeakRetained chromeViewController];
  id v4 = [v3 mapView];

  return v4;
}

- (void)containeeViewControllerGoToPreviousState:(id)a3 withSender:(id)a4
{
  id v5 = a3;
  unsigned __int8 v6 = [(TransitLineSelectionActionController *)self coordinator];
  [v6 viewControllerClosed:v5 animated:1];

  id v7 = [(TransitLineSelectionActionController *)self disambiguationVC];
  [v7 setLines:0];
}

- (TransitLineDisambiguationViewController)disambiguationVC
{
  disambiguationVC = self->_disambiguationVC;
  if (!disambiguationVC)
  {
    id v4 = objc_alloc_init(TransitLineDisambiguationViewController);
    id v5 = self->_disambiguationVC;
    self->_disambiguationVC = v4;

    [(ContaineeViewController *)self->_disambiguationVC setPreferredPresentationStyle:3];
    [(ContaineeViewController *)self->_disambiguationVC setContaineeDelegate:self];
    disambiguationVC = self->_disambiguationVC;
  }

  return disambiguationVC;
}

- (void)_disambiguateSelectedLineForLabelMarker:(id)a3 onActivation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 _maps_numLines];
  [(TransitLineSelectionActionController *)self _clearTransitLineSelectionDeactivate:0 context:0];
  id v9 = [(TransitLineSelectionActionController *)self disambiguationVC];
  uint64_t v10 = sub_1000BBB44(v9);

  if (v10 == 5)
  {
    id v11 = [(TransitLineSelectionActionController *)self disambiguationVC];
    [v11 setModalPresentationStyle:7];

    v12 = [(TransitLineSelectionActionController *)self disambiguationVC];
    v13 = [v12 macPopoverPresentationController];

    [v6 coordinate];
    CLLocationDegrees v15 = v14;
    [v6 coordinate];
    CLLocationCoordinate2D v17 = CLLocationCoordinate2DMake(v15, v16);
    [v13 setCoordinate:v17.latitude, v17.longitude];
  }
  id v18 = [(TransitLineSelectionActionController *)self containerViewController];
  v19 = [v18 currentViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v20 = 0;
  }
  else
  {
    v21 = [(TransitLineSelectionActionController *)self containerViewController];
    id v22 = [v21 currentViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    char v20 = isKindOfClass ^ 1;
  }

  id v24 = [(TransitLineSelectionActionController *)self containerViewController];
  BOOL v25 = [(TransitLineSelectionActionController *)self disambiguationVC];
  if (v10 == 5 || (v20 & 1) != 0) {
    [v24 presentController:v25];
  }
  else {
    [v24 replaceCurrentWithController:v25];
  }

  id v26 = +[NSBundle mainBundle];
  id v27 = [v26 localizedStringForKey:@"number_of_disambiguation_lines" value:@"localized string not found" table:0];

  id v28 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v27, v8);
  BOOL v29 = [(TransitLineSelectionActionController *)self disambiguationVC];
  [v29 setTitleMessage:v28];

  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  char v38 = 0;
  objc_initWeak(&location, self);
  v30 = [(TransitLineSelectionActionController *)self _traits];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100BCD7C8;
  v32[3] = &unk_10131AB40;
  v34 = v37;
  objc_copyWeak(&v35, &location);
  id v31 = v7;
  id v33 = v31;
  [v6 _maps_loadLineInfoUsingTraits:v30 withCompletion:v32];

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);
  _Block_object_dispose(v37, 8);
}

- (void)_zoomToRegionForLineIfNecessary:(id)a3 region:(id)a4 withStartingRegion:(id)a5 startedShowingLineDate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  [v13 timeIntervalSinceNow];
  double v15 = v14;
  [v13 timeIntervalSinceNow];
  double v17 = v16;

  double v18 = -v17;
  if (v15 >= 0.0) {
    double v18 = v17;
  }
  if (v18 < 30.0)
  {
    v19 = [(TransitLineSelectionActionController *)self mapView];
    if ([(TransitLineSelectionActionController *)self isActive])
    {
      char v20 = [v19 _selectedTransitLineIDs];
      v21 = MKMapItemIdentifierFromGEOTransitLine();
      id v26 = v21;
      id v22 = +[NSArray arrayWithObjects:&v26 count:1];
      unsigned int v23 = [v20 isEqualToArray:v22];

      if (v23)
      {
        if (!v12
          || ([v19 mapRegion],
              id v24 = objc_claimAutoreleasedReturnValue(),
              unsigned int v25 = [v12 isEqual:v24],
              v24,
              v25))
        {
          GEOMapRectForMapRegion();
          [v19 setVisibleMapRect:1];
        }
      }
    }
  }
}

- (void)_showTransitLineWithName:(id)a3 identifier:(id)a4 mapRegion:(id)a5
{
  id v14 = a4;
  id v7 = a5;
  id v8 = [(TransitLineSelectionActionController *)self mapView];
  id v9 = [(TransitLineSelectionActionController *)self coordinator];
  self->_viewModeToRestore = (int64_t)[v9 displayedViewMode];

  if (self->_viewModeToRestore != 3)
  {
    id v10 = [(TransitLineSelectionActionController *)self coordinator];
    [v10 updateViewMode:3 animated:1];
  }
  [v8 _selectTransitLineMarkerWithIdentifier:v14];
  id v11 = [(TransitLineSelectionActionController *)self coordinator];
  [v11 updateMapApplicationState:4];

  if (v7)
  {
    GEOMapRectForMapRegion();
    [v8 setVisibleMapRect:1];
  }
  id v12 = [(TransitLineSelectionActionController *)self coordinator];
  id v13 = [v12 appCoordinator];
  [v13 setNeedsUserActivityUpdate];
}

- (void)_clearTransitLineSelectionDeactivate:(BOOL)a3 context:(id)a4
{
  BOOL v4 = a3;
  id v14 = a4;
  id v6 = [(TransitLineSelectionActionController *)self mapView];
  [v6 _deselectTransitLineMarker];
  id v7 = [(TransitLineSelectionActionController *)self coordinator];
  [v7 updateMapApplicationState:0];

  if (v4)
  {
    id v8 = [(TransitLineSelectionActionController *)self coordinator];
    id v9 = [v8 displayedViewMode];

    if ([(TransitLineSelectionActionController *)self _shouldRestoreDisplayedViewModeForContext:v14]&& v9 == (id)3&& self->_viewModeToRestore != 3)
    {
      id v10 = [(TransitLineSelectionActionController *)self coordinator];
      [v10 updateViewMode:self->_viewModeToRestore animated:1];
    }
    id v11 = [(TransitLineSelectionActionController *)self coordinator];
    [v11 actionControlDidDeactivate:self];
  }
  id v12 = [(TransitLineSelectionActionController *)self coordinator];
  id v13 = [v12 appCoordinator];
  [v13 setNeedsUserActivityUpdate];
}

- (BOOL)_shouldRestoreDisplayedViewModeForContext:(id)a3
{
  BOOL v3 = [a3 objectForKeyedSubscript:@"ActionControllerDeactivationItemKey"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (ActionCoordination)coordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);

  return (ActionCoordination *)WeakRetained;
}

- (void)setCoordinator:(id)a3
{
}

- (void)setDisambiguationVC:(id)a3
{
}

- (ControlContainerViewController)containerViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);

  return (ControlContainerViewController *)WeakRetained;
}

- (void)setContainerViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_containerViewController);
  objc_storeStrong((id *)&self->_disambiguationVC, 0);

  objc_destroyWeak((id *)&self->_coordinator);
}

@end