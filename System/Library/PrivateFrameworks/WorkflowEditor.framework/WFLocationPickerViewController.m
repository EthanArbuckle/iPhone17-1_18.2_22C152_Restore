@interface WFLocationPickerViewController
- ($9F77959AF31A96A2E31DA24E27C2F2C1)mapRadiusView:(id)a3 boundingMapRectForOverlay:(id)a4;
- (BOOL)allowsPickingCurrentLocation;
- (BOOL)allowsTextOnlyLocation;
- (BOOL)hasLocation;
- (BOOL)hasSufficientLocationAuthorization;
- (BOOL)resolvesCurrentLocationToPlacemark;
- (BOOL)shouldShowCurrentLocationItem;
- (BOOL)showsMapView;
- (CLLocation)currentLocation;
- (CLLocationManager)locationManager;
- (MKLocalSearch)localSearch;
- (MKMapView)mapView;
- (NSArray)constraints;
- (NSArray)localSearchResults;
- (NSArray)recents;
- (NSIndexPath)selectedIndexPath;
- (NSLayoutConstraint)mapHeightConstraint;
- (UISearchBar)searchBar;
- (UITableView)tableView;
- (UIView)dividerView;
- (WFLocationPickerViewController)initWithPickerType:(unint64_t)a3 value:(id)a4;
- (WFLocationPickerViewControllerDelegate)delegate;
- (WFLocationTriggerEditorMapDragRadiusView)dragView;
- (WFLocationValue)value;
- (double)mapHeight;
- (id)circularRegion;
- (id)locationFromRecentContact:(id)a3;
- (id)mapRadiusView:(id)a3 overlayForRadius:(double)a4;
- (id)mapView:(id)a3 rendererForOverlay:(id)a4;
- (id)mapView:(id)a3 viewForAnnotation:(id)a4;
- (id)overlayWithCenterCoordinate:(CLLocationCoordinate2D)a3 radius:(double)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int)currentAppLocationAuthorizationStatus;
- (int64_t)currentLocationRowIndex;
- (int64_t)firstLocalSearchResultRowIndex;
- (int64_t)firstRecentRowIndex;
- (int64_t)lastRecentRowIndex;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)pickerType;
- (unint64_t)proximityType;
- (unint64_t)regionCondition;
- (void)cancel:(id)a3;
- (void)checkLocationAuthorization;
- (void)displayLocationCoordinate:(CLLocationCoordinate2D)a3;
- (void)done:(id)a3;
- (void)getMapItemFromRecentContact:(id)a3 completionHandler:(id)a4;
- (void)getPlacemarkFromLocation:(id)a3 streetAddress:(id)a4 completionHandler:(id)a5;
- (void)loadView;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)mapRadiusView:(id)a3 radiusDidChange:(double)a4;
- (void)mapView:(id)a3 didDeselectAnnotationView:(id)a4;
- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4;
- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4;
- (void)mapView:(id)a3 regionWillChangeAnimated:(BOOL)a4;
- (void)mapViewDidChangeVisibleRegion:(id)a3;
- (void)reloadData;
- (void)resetSearchResults;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)setAllowsPickingCurrentLocation:(BOOL)a3;
- (void)setAllowsTextOnlyLocation:(BOOL)a3;
- (void)setConstraints:(id)a3;
- (void)setCurrentAppLocationAuthorizationStatus:(int)a3;
- (void)setCurrentLocation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDividerView:(id)a3;
- (void)setDragView:(id)a3;
- (void)setLocalSearch:(id)a3;
- (void)setLocalSearchResults:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setLocationValueWithPlacemark:(id)a3;
- (void)setMapHeightConstraint:(id)a3;
- (void)setMapView:(id)a3;
- (void)setRecents:(id)a3;
- (void)setRegionCondition:(unint64_t)a3;
- (void)setRegionValueWithPlacemark:(id)a3 radius:(double)a4;
- (void)setResolvesCurrentLocationToPlacemark:(BOOL)a3;
- (void)setSearchBar:(id)a3;
- (void)setSelectedIndexPath:(id)a3;
- (void)setTableView:(id)a3;
- (void)setValue:(id)a3;
- (void)setupMap;
- (void)showMapRegionForCoordinate:(CLLocationCoordinate2D)a3 radius:(double)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateMapHeight;
- (void)updateRecentsWithSearchText:(id)a3;
- (void)updateUI;
- (void)updateUIWithValue:(id)a3;
- (void)updateValueWithMapItem:(id)a3;
- (void)updateValueWithRadius:(double)a3;
- (void)updateViewConstraints;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation WFLocationPickerViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_localSearchResults, 0);
  objc_storeStrong((id *)&self->_localSearch, 0);
  objc_storeStrong((id *)&self->_recents, 0);
  objc_storeStrong((id *)&self->_mapHeightConstraint, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_dragView, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_dividerView, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setCurrentLocation:(id)a3
{
}

- (CLLocation)currentLocation
{
  return self->_currentLocation;
}

- (void)setCurrentAppLocationAuthorizationStatus:(int)a3
{
  self->_currentAppLocationAuthorizationStatus = a3;
}

- (int)currentAppLocationAuthorizationStatus
{
  return self->_currentAppLocationAuthorizationStatus;
}

- (void)setLocationManager:(id)a3
{
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocalSearchResults:(id)a3
{
}

- (NSArray)localSearchResults
{
  return self->_localSearchResults;
}

- (void)setLocalSearch:(id)a3
{
}

- (MKLocalSearch)localSearch
{
  return self->_localSearch;
}

- (void)setRecents:(id)a3
{
}

- (NSArray)recents
{
  return self->_recents;
}

- (void)setMapHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)mapHeightConstraint
{
  return self->_mapHeightConstraint;
}

- (void)setConstraints:(id)a3
{
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setSelectedIndexPath:(id)a3
{
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setDragView:(id)a3
{
}

- (void)setMapView:(id)a3
{
}

- (void)setTableView:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setDividerView:(id)a3
{
}

- (UIView)dividerView
{
  return self->_dividerView;
}

- (void)setSearchBar:(id)a3
{
}

- (UISearchBar)searchBar
{
  return self->_searchBar;
}

- (BOOL)resolvesCurrentLocationToPlacemark
{
  return self->_resolvesCurrentLocationToPlacemark;
}

- (unint64_t)regionCondition
{
  return self->_regionCondition;
}

- (BOOL)allowsPickingCurrentLocation
{
  return self->_allowsPickingCurrentLocation;
}

- (void)setAllowsTextOnlyLocation:(BOOL)a3
{
  self->_allowsTextOnlyLocation = a3;
}

- (BOOL)allowsTextOnlyLocation
{
  return self->_allowsTextOnlyLocation;
}

- (WFLocationValue)value
{
  return self->_value;
}

- (unint64_t)pickerType
{
  return self->_pickerType;
}

- (void)setDelegate:(id)a3
{
}

- (WFLocationPickerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFLocationPickerViewControllerDelegate *)WeakRetained;
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v5 = a4;
  [(WFLocationPickerViewController *)self resetSearchResults];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    v7 = [(WFLocationPickerViewController *)self searchBar];
    v8 = [v7 text];
    [(WFLocationPickerViewController *)self updateRecentsWithSearchText:v8];

    id v9 = objc_alloc_init(MEMORY[0x263F10928]);
    v10 = [(WFLocationPickerViewController *)self searchBar];
    v11 = [v10 text];
    [v9 setNaturalLanguageQuery:v11];

    v12 = (void *)[objc_alloc(MEMORY[0x263F10910]) initWithRequest:v9];
    [(WFLocationPickerViewController *)self setLocalSearch:v12];

    v13 = [(WFLocationPickerViewController *)self localSearch];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __58__WFLocationPickerViewController_searchBar_textDidChange___block_invoke;
    v14[3] = &unk_264BFDA20;
    v14[4] = self;
    [v13 startWithCompletionHandler:v14];
  }
  else
  {
    [(WFLocationPickerViewController *)self updateRecentsWithSearchText:0];
    [(WFLocationPickerViewController *)self updateUIWithValue:0];
    [(WFLocationPickerViewController *)self reloadData];
  }
}

uint64_t __58__WFLocationPickerViewController_searchBar_textDidChange___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 mapItems];
  [*(id *)(a1 + 32) setLocalSearchResults:v3];

  v4 = *(void **)(a1 + 32);
  return [v4 reloadData];
}

- (void)resetSearchResults
{
  v3 = [(WFLocationPickerViewController *)self localSearch];

  if (v3)
  {
    v4 = [(WFLocationPickerViewController *)self localSearch];
    [v4 cancel];

    [(WFLocationPickerViewController *)self setLocalSearch:0];
  }
  [(WFLocationPickerViewController *)self setLocalSearchResults:0];
}

- (id)mapRadiusView:(id)a3 overlayForRadius:(double)a4
{
  id v5 = [(WFLocationPickerViewController *)self mapView];
  uint64_t v6 = [v5 annotations];
  v7 = [v6 firstObject];

  [v7 coordinate];
  v8 = -[WFLocationPickerViewController overlayWithCenterCoordinate:radius:](self, "overlayWithCenterCoordinate:radius:");

  return v8;
}

- ($9F77959AF31A96A2E31DA24E27C2F2C1)mapRadiusView:(id)a3 boundingMapRectForOverlay:(id)a4
{
  id v4 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 innerCircleBoundingMapRect];
  }
  else {
    [v4 boundingMapRect];
  }
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;

  double v13 = v9;
  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  result.var1.var1 = v16;
  result.var1.var0 = v15;
  result.var0.var1 = v14;
  result.var0.var0 = v13;
  return result;
}

- (id)overlayWithCenterCoordinate:(CLLocationCoordinate2D)a3 radius:(double)a4
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  if ([(WFLocationPickerViewController *)self proximityType] == 1)
  {
    double v8 = objc_msgSend(MEMORY[0x263F10898], "circleWithCenterCoordinate:radius:", latitude, longitude, a4);
  }
  else if ([(WFLocationPickerViewController *)self proximityType] == 2)
  {
    double v9 = [(WFLocationPickerViewController *)self mapView];
    [v9 visibleMapRect];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;

    double v8 = +[WFReverseCircleOverlay circleWithCenterCoordinate:radius:boundingMapRect:](WFReverseCircleOverlay, "circleWithCenterCoordinate:radius:boundingMapRect:", latitude, longitude, a4, v11, v13, v15, v17);
  }
  else
  {
    double v8 = 0;
  }
  return v8;
}

- (void)mapRadiusView:(id)a3 radiusDidChange:(double)a4
{
  double v6 = [(WFLocationPickerViewController *)self circularRegion];

  if (v6)
  {
    [(WFLocationPickerViewController *)self updateValueWithRadius:a4];
    double v7 = [(WFLocationPickerViewController *)self circularRegion];
    [v7 center];
    double v9 = v8;
    double v11 = v10;

    -[WFLocationPickerViewController showMapRegionForCoordinate:radius:](self, "showMapRegionForCoordinate:radius:", v9, v11, a4);
  }
}

- (void)mapViewDidChangeVisibleRegion:(id)a3
{
  id v18 = a3;
  v3 = [v18 overlays];
  id v4 = [v3 firstObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 boundingMapRect];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    [v18 visibleMapRect];
    v22.origin.x = v13;
    v22.origin.y = v14;
    v22.size.width = v15;
    v22.size.height = v16;
    v20.origin.x = v6;
    v20.origin.y = v8;
    v20.size.width = v10;
    v20.size.height = v12;
    MKMapRect v21 = MKMapRectUnion(v20, v22);
    objc_msgSend(v4, "setBoundingRect:", v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
    double v17 = [v18 rendererForOverlay:v4];
    [v17 setNeedsDisplay];
  }
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v5 = a4;
  uint64_t v6 = objc_opt_class();
  double v7 = WFEnforceClass(v5, v6);

  unint64_t v8 = [(WFLocationPickerViewController *)self proximityType];
  if (v8 == 1)
  {
    double v9 = (Class *)0x263F108A0;
    goto LABEL_5;
  }
  if (v8 == 2)
  {
    double v9 = (Class *)&off_264BFC050;
LABEL_5:
    double v10 = (void *)[objc_alloc(*v9) initWithCircle:v7];
    goto LABEL_7;
  }
  double v10 = 0;
LABEL_7:
  double v11 = [MEMORY[0x263F825C8] systemBlueColor];
  [v10 setStrokeColor:v11];

  double v12 = [MEMORY[0x263F825C8] systemBlueColor];
  double v13 = [v12 colorWithAlphaComponent:0.15];
  [v10 setFillColor:v13];

  double v14 = [MEMORY[0x263F82B60] mainScreen];
  [v14 scale];
  BOOL v16 = v15 <= 1.0;
  double v17 = 2.0;
  if (!v16) {
    double v17 = 4.0;
  }
  [v10 setLineWidth:v17];

  return v10;
}

- (void)mapView:(id)a3 didDeselectAnnotationView:(id)a4
{
  id v4 = [(WFLocationPickerViewController *)self dragView];
  [v4 removeHandle:1];
}

- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if ([(WFLocationPickerViewController *)self proximityType])
  {
    double v7 = [(WFLocationPickerViewController *)self dragView];
    unint64_t v8 = [v6 annotation];
    double v9 = [v11 overlays];
    double v10 = [v9 firstObject];
    [v7 addHandleForAnnotation:v8 withOverlay:v10];
  }
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  id v10 = a3;
  if ([(WFLocationPickerViewController *)self proximityType])
  {
    id v5 = [(WFLocationPickerViewController *)self dragView];
    id v6 = [v10 annotations];
    double v7 = [v6 lastObject];
    unint64_t v8 = [v10 overlays];
    double v9 = [v8 lastObject];
    [v5 addHandleForAnnotation:v7 withOverlay:v9];
  }
}

- (void)mapView:(id)a3 regionWillChangeAnimated:(BOOL)a4
{
  id v4 = [(WFLocationPickerViewController *)self dragView];
  [v4 removeHandle:1];
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v4 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x263F109B0]) initWithAnnotation:v4 reuseIdentifier:@"marker"];
    [v5 setTitleVisibility:1];
    [v5 setSubtitleVisibility:1];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)setRegionValueWithPlacemark:(id)a3 radius:(double)a4
{
  id v20 = a3;
  id v6 = [v20 location];
  if (a4 < 100.0) {
    a4 = 100.0;
  }
  double v7 = [v20 name];

  id v8 = objc_alloc(MEMORY[0x263F00A28]);
  [v6 coordinate];
  double v10 = v9;
  double v12 = v11;
  if (v7)
  {
    double v13 = [v20 name];
    double v14 = objc_msgSend(v8, "initWithCenter:radius:identifier:", v13, v10, v12, a4);
  }
  else
  {
    double v13 = [(WFLocationPickerViewController *)self value];
    double v15 = [v13 locationName];
    double v14 = objc_msgSend(v8, "initWithCenter:radius:identifier:", v15, v10, v12, a4);
  }
  id v16 = objc_alloc(MEMORY[0x263F00AA8]);
  double v17 = [v20 addressDictionary];
  id v18 = (void *)[v16 initWithLocation:v6 addressDictionary:v17 region:v14 areasOfInterest:0];

  v19 = (void *)[objc_alloc(MEMORY[0x263F86CC0]) initWithPlacemark:v18];
  [(WFLocationPickerViewController *)self setValue:v19];
}

- (void)setLocationValueWithPlacemark:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F86CC0];
  id v5 = a3;
  id v6 = (id)[[v4 alloc] initWithPlacemark:v5];

  [(WFLocationPickerViewController *)self setValue:v6];
}

- (void)updateValueWithRadius:(double)a3
{
  id v5 = [(WFLocationPickerViewController *)self value];
  id v6 = [v5 placemark];

  [(WFLocationPickerViewController *)self setRegionValueWithPlacemark:v6 radius:a3];
}

- (void)updateValueWithMapItem:(id)a3
{
  id v7 = a3;
  unint64_t v4 = [(WFLocationPickerViewController *)self pickerType];
  if (v4 == 1)
  {
    id v5 = CLPlacemarkFromMapItem(v7);
    id v6 = [(WFLocationPickerViewController *)self circularRegion];
    [v6 radius];
    -[WFLocationPickerViewController setRegionValueWithPlacemark:radius:](self, "setRegionValueWithPlacemark:radius:", v5);
  }
  else
  {
    if (v4) {
      goto LABEL_6;
    }
    id v5 = CLPlacemarkFromMapItem(v7);
    [(WFLocationPickerViewController *)self setLocationValueWithPlacemark:v5];
  }

LABEL_6:
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 deselectRowAtIndexPath:v6 animated:1];
  id v8 = [(WFLocationPickerViewController *)self selectedIndexPath];
  double v9 = [v7 cellForRowAtIndexPath:v8];
  [v9 setAccessoryType:0];

  double v10 = [v7 cellForRowAtIndexPath:v6];

  [v10 setAccessoryType:3];
  [(WFLocationPickerViewController *)self setSelectedIndexPath:v6];
  int64_t v11 = [(WFLocationPickerViewController *)self firstRecentRowIndex];
  int64_t v12 = [(WFLocationPickerViewController *)self firstLocalSearchResultRowIndex];
  uint64_t v13 = [v6 row];

  int64_t v14 = [(WFLocationPickerViewController *)self currentLocationRowIndex];
  int64_t v15 = v14;
  if (v11 == 0x7FFFFFFFFFFFFFFFLL || v13 < v11)
  {
    if (v13 != v14)
    {
      if (v12 == 0x7FFFFFFFFFFFFFFFLL || v13 < v12) {
        return;
      }
      goto LABEL_18;
    }
    goto LABEL_14;
  }
  int64_t v16 = [(WFLocationPickerViewController *)self lastRecentRowIndex];
  BOOL v18 = v12 != 0x7FFFFFFFFFFFFFFFLL && v13 >= v12;
  if (v13 == v15)
  {
LABEL_14:
    if (![(WFLocationPickerViewController *)self resolvesCurrentLocationToPlacemark])
    {
      id v24 = (id)[objc_alloc(MEMORY[0x263F86CC0]) initWithCurrentLocation];
      [(WFLocationPickerViewController *)self setValue:v24];
      goto LABEL_20;
    }
    id v19 = objc_alloc_init(MEMORY[0x263F00A40]);
    id v20 = [(WFLocationPickerViewController *)self currentLocation];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __68__WFLocationPickerViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    v26[3] = &unk_264BFD930;
    v26[4] = self;
    [v19 reverseGeocodeLocation:v20 completionHandler:v26];

LABEL_24:
    return;
  }
  if (v13 <= v16)
  {
    v23 = [(WFLocationPickerViewController *)self recents];
    id v19 = [v23 objectAtIndex:v13 - v11];

    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __68__WFLocationPickerViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
    v25[3] = &unk_264BFD9F8;
    v25[4] = self;
    [(WFLocationPickerViewController *)self getMapItemFromRecentContact:v19 completionHandler:v25];
    goto LABEL_24;
  }
  if (!v18) {
    return;
  }
LABEL_18:
  uint64_t v21 = v13 - v12;
  MKMapRect v22 = [(WFLocationPickerViewController *)self localSearchResults];
  id v24 = [v22 objectAtIndex:v21];

  [(WFLocationPickerViewController *)self updateValueWithMapItem:v24];
LABEL_20:
}

void __68__WFLocationPickerViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  if ([v10 count])
  {
    v3 = [v10 firstObject];
    unint64_t v4 = [v10 firstObject];
    id v5 = [v4 name];
  }
  else
  {
    id v5 = WFLocalizedString(@"Unknown Location");
    id v6 = (void *)MEMORY[0x263F00AA8];
    unint64_t v4 = [*(id *)(a1 + 32) currentLocation];
    v3 = [v6 placemarkWithLocation:v4 name:v5 postalAddress:0];
  }

  id v7 = (void *)[objc_alloc(MEMORY[0x263F86CC0]) initWithLocationName:v5 placemark:v3];
  [*(id *)(a1 + 32) setValue:v7];

  id v8 = *(void **)(a1 + 32);
  double v9 = MKMapItemWithPlacemark(v3);
  [v8 updateValueWithMapItem:v9];
}

void __68__WFLocationPickerViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a2;
  id v7 = getWFGeneralLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v8 = 136315394;
    double v9 = "-[WFLocationPickerViewController tableView:didSelectRowAtIndexPath:]_block_invoke_2";
    __int16 v10 = 2114;
    id v11 = v5;
    _os_log_impl(&dword_23490C000, v7, OS_LOG_TYPE_ERROR, "%s Failed to get map item: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  [*(id *)(a1 + 32) updateValueWithMapItem:v6];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"locationCell"];
  if (!v7) {
    id v7 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:3 reuseIdentifier:@"locationCell"];
  }
  int v8 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  double v9 = [v7 textLabel];
  [v9 setFont:v8];

  __int16 v10 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83590]];
  id v11 = [v7 detailTextLabel];
  [v11 setFont:v10];

  int64_t v12 = [(WFLocationPickerViewController *)self firstRecentRowIndex];
  uint64_t v13 = [(WFLocationPickerViewController *)self firstLocalSearchResultRowIndex];
  uint64_t v14 = [v6 row];
  if (v14 == [(WFLocationPickerViewController *)self currentLocationRowIndex])
  {
    int64_t v15 = WFLocalizedString(@"Current Location");
    int64_t v16 = [MEMORY[0x263F827E8] systemImageNamed:@"location.fill"];
    double v17 = [MEMORY[0x263F825C8] labelColor];
    BOOL v18 = 0;
    goto LABEL_14;
  }
  if (v12 == 0x7FFFFFFFFFFFFFFFLL
    || [v6 row] < v12
    || (uint64_t v19 = [v6 row],
        v19 > [(WFLocationPickerViewController *)self lastRecentRowIndex]))
  {
    if (v13 == 0x7FFFFFFFFFFFFFFFLL || [v6 row] < v13)
    {
      BOOL v18 = 0;
      int64_t v16 = 0;
      double v17 = 0;
      int64_t v15 = 0;
      goto LABEL_14;
    }
    uint64_t v20 = [v6 row] - v13;
    uint64_t v21 = [(WFLocationPickerViewController *)self localSearchResults];
    MKMapRect v22 = [v21 objectAtIndexedSubscript:v20];

    int64_t v15 = [v22 name];
    uint64_t v23 = [v22 _shortAddress];
  }
  else
  {
    uint64_t v24 = [v6 row] - v12;
    v25 = [(WFLocationPickerViewController *)self recents];
    MKMapRect v22 = [v25 objectAtIndexedSubscript:v24];

    int64_t v15 = [v22 displayName];
    uint64_t v23 = [v22 address];
  }
  BOOL v18 = (void *)v23;
  int64_t v16 = [MEMORY[0x263F827E8] systemImageNamed:@"mappin.and.ellipse"];
  double v17 = [MEMORY[0x263F825C8] systemRedColor];

LABEL_14:
  v26 = [v7 textLabel];
  [v26 setText:v15];

  v27 = [v7 detailTextLabel];
  [v27 setText:v18];

  v28 = [v7 imageView];
  [v28 setImage:v16];

  v29 = [v7 imageView];
  [v29 setTintColor:v17];

  v30 = [(WFLocationPickerViewController *)self selectedIndexPath];
  if ([v6 isEqual:v30])
  {
    if ([(WFLocationPickerViewController *)self hasLocation]) {
      uint64_t v31 = 3;
    }
    else {
      uint64_t v31 = 0;
    }
  }
  else
  {
    uint64_t v31 = 0;
  }

  [v7 setAccessoryType:v31];
  return v7;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5 = a4;
  [v5 setOpaque:0];
  id v6 = [MEMORY[0x263F825C8] clearColor];
  [v5 setBackgroundColor:v6];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t v5 = [(WFLocationPickerViewController *)self currentLocationRowIndex];
  id v6 = [(WFLocationPickerViewController *)self recents];
  uint64_t v7 = [v6 count];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = v7 + 1;
  }
  double v9 = [(WFLocationPickerViewController *)self localSearchResults];
  int64_t v10 = v8 + [v9 count];

  return v10;
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v9 = a4;
  int64_t v5 = [(WFLocationPickerViewController *)self currentLocation];
  id v6 = [v9 firstObject];
  char v7 = [v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
    uint64_t v8 = [v9 firstObject];
    [(WFLocationPickerViewController *)self setCurrentLocation:v8];
  }
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int64_t v5 = getWFTriggersLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315394;
    char v7 = "-[WFLocationPickerViewController locationManagerDidChangeAuthorization:]";
    __int16 v8 = 1024;
    int v9 = [v4 authorizationStatus];
    _os_log_impl(&dword_23490C000, v5, OS_LOG_TYPE_DEBUG, "%s locationManager:didChangeAuthorizationStatus: got status: %d", (uint8_t *)&v6, 0x12u);
  }

  -[WFLocationPickerViewController setCurrentAppLocationAuthorizationStatus:](self, "setCurrentAppLocationAuthorizationStatus:", [v4 authorizationStatus]);
  [(WFLocationPickerViewController *)self reloadData];
}

- (BOOL)hasSufficientLocationAuthorization
{
  return [(WFLocationPickerViewController *)self currentAppLocationAuthorizationStatus]- 3 < 2;
}

- (void)checkLocationAuthorization
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  [(WFLocationPickerViewController *)self setCurrentAppLocationAuthorizationStatus:WFCLLocationManagerAuthorizationStatusForWorkflowEnvironment()];
  v3 = getWFTriggersLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315394;
    char v7 = "-[WFLocationPickerViewController checkLocationAuthorization]";
    __int16 v8 = 1024;
    int v9 = [(WFLocationPickerViewController *)self currentAppLocationAuthorizationStatus];
    _os_log_impl(&dword_23490C000, v3, OS_LOG_TYPE_DEBUG, "%s Current CLAuthorizationStatus: %d", (uint8_t *)&v6, 0x12u);
  }

  if (![(WFLocationPickerViewController *)self currentAppLocationAuthorizationStatus])
  {
    id v4 = getWFTriggersLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 136315138;
      char v7 = "-[WFLocationPickerViewController checkLocationAuthorization]";
      _os_log_impl(&dword_23490C000, v4, OS_LOG_TYPE_DEBUG, "%s Rrequesting WhenInUse…", (uint8_t *)&v6, 0xCu);
    }

    int64_t v5 = [(WFLocationPickerViewController *)self locationManager];
    [v5 requestWhenInUseAuthorization];
  }
}

- (void)done:(id)a3
{
  id v5 = [(WFLocationPickerViewController *)self delegate];
  id v4 = [(WFLocationPickerViewController *)self value];
  [v5 locationPicker:self didFinishWithValue:v4];
}

- (void)cancel:(id)a3
{
  id v4 = [(WFLocationPickerViewController *)self delegate];
  [v4 locationPickerDidCancel:self];
}

- (id)circularRegion
{
  v2 = [(WFLocationPickerViewController *)self value];
  v3 = [v2 placemark];
  id v4 = [v3 region];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
  [(WFLocationPickerViewController *)self updateUI];
}

- (void)setRegionCondition:(unint64_t)a3
{
  if (self->_regionCondition != a3)
  {
    self->_regionCondition = a3;
    unint64_t v4 = [(WFLocationPickerViewController *)self proximityType];
    id v5 = [(WFLocationPickerViewController *)self dragView];
    [v5 setProximity:v4];
  }
}

- (void)showMapRegionForCoordinate:(CLLocationCoordinate2D)a3 radius:(double)a4
{
  double v5 = MEMORY[0x237DCD2F0](self, a2, (__n128)a3, *(__n128 *)&a3.longitude, a4 * 3.5, a4 * 3.5);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  int64_t v12 = [(WFLocationPickerViewController *)self mapView];
  objc_msgSend(v12, "regionThatFits:", v5, v7, v9, v11);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  if (v16 >= -180.0
    && v16 <= 180.0
    && v14 >= -90.0
    && v14 <= 90.0
    && v18 >= 0.0
    && v18 <= 180.0
    && v20 >= 0.0
    && v20 <= 360.0)
  {
    id v21 = [(WFLocationPickerViewController *)self mapView];
    objc_msgSend(v21, "setRegion:animated:", 0, v14, v16, v18, v20);
  }
}

- (id)locationFromRecentContact:(id)a3
{
  v3 = [a3 metadata];
  unint64_t v4 = [v3 objectForKey:@"latitude"];
  [v4 doubleValue];
  CLLocationDegrees v6 = v5;

  double v7 = [v3 objectForKey:@"longitude"];
  [v7 doubleValue];
  CLLocationDegrees v9 = v8;

  CLLocationCoordinate2D v10 = CLLocationCoordinate2DMake(v6, v9);
  double v11 = [v3 objectForKey:@"hAccuracy"];
  [v11 doubleValue];
  double v13 = v12;

  double v14 = [v3 objectForKey:@"vAccuracy"];
  [v14 doubleValue];
  double v16 = v15;

  double v17 = [v3 objectForKey:@"referenceFrame"];
  uint64_t v18 = [v17 integerValue];

  id v19 = objc_alloc(MEMORY[0x263F00A50]);
  double v20 = [MEMORY[0x263EFF910] date];
  id v21 = objc_msgSend(v19, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:referenceFrame:", v20, v18, v10.latitude, v10.longitude, 0.0, v13, v16);

  return v21;
}

- (void)getPlacemarkFromLocation:(id)a3 streetAddress:(id)a4 completionHandler:(id)a5
{
  unint64_t v7 = (unint64_t)a3;
  unint64_t v8 = (unint64_t)a4;
  id v9 = a5;
  CLLocationCoordinate2D v10 = (void (**)(void, void, void))v9;
  if (v7 && v8)
  {
    double v11 = [(id)v8 postalAddress];
    id v12 = objc_alloc(MEMORY[0x263F109E0]);
    [(id)v7 coordinate];
    double v13 = objc_msgSend(v12, "initWithCoordinate:postalAddress:", v11);
    ((void (**)(void, void *, void))v10)[2](v10, v13, 0);
  }
  else
  {
    if (!(v7 | v8))
    {
      (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
      goto LABEL_11;
    }
    if (v7) {
      unint64_t v14 = v7;
    }
    else {
      unint64_t v14 = v8;
    }
    double v11 = [MEMORY[0x263F337C8] itemWithObject:v14];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __91__WFLocationPickerViewController_getPlacemarkFromLocation_streetAddress_completionHandler___block_invoke;
    v15[3] = &unk_264BFD9D0;
    double v16 = v10;
    [v11 getObjectRepresentation:v15 forClass:objc_opt_class()];
  }
LABEL_11:
}

uint64_t __91__WFLocationPickerViewController_getPlacemarkFromLocation_streetAddress_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getMapItemFromRecentContact:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v6 metadata];
  id v9 = [v8 objectForKey:@"mapKitHandle"];
  uint64_t v10 = objc_opt_class();
  double v11 = WFEnforceClass(v9, v10);

  if (v11)
  {
    id v12 = (void *)MEMORY[0x263F10960];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __80__WFLocationPickerViewController_getMapItemFromRecentContact_completionHandler___block_invoke;
    v31[3] = &unk_264BFD980;
    id v32 = v7;
    id v13 = v7;
    [v12 _mapItemFromHandle:v11 completionHandler:v31];
    unint64_t v14 = v32;
  }
  else
  {
    id v13 = [v6 address];
    double v15 = [MEMORY[0x263F33990] streetAddressesInString:v13 error:0];
    unint64_t v14 = [v15 firstObject];

    double v16 = [v8 objectForKey:@"latitude"];
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = WFEnforceClass(v16, v17);

    id v19 = [v8 objectForKey:@"longitude"];
    uint64_t v20 = objc_opt_class();
    id v21 = WFEnforceClass(v19, v20);

    MKMapRect v22 = 0;
    if (v18 && v21)
    {
      id v23 = objc_alloc(MEMORY[0x263F00A50]);
      [v18 doubleValue];
      double v25 = v24;
      [v21 doubleValue];
      MKMapRect v22 = (void *)[v23 initWithLatitude:v25 longitude:v26];
    }
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __80__WFLocationPickerViewController_getMapItemFromRecentContact_completionHandler___block_invoke_3;
    v28[3] = &unk_264BFD9A8;
    id v29 = v6;
    id v30 = v7;
    id v27 = v7;
    [(WFLocationPickerViewController *)self getPlacemarkFromLocation:v22 streetAddress:v14 completionHandler:v28];
  }
}

void __80__WFLocationPickerViewController_getMapItemFromRecentContact_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__WFLocationPickerViewController_getMapItemFromRecentContact_completionHandler___block_invoke_2;
  block[3] = &unk_264BFD958;
  id v7 = *(id *)(a1 + 32);
  id v12 = v6;
  id v13 = v7;
  id v11 = v5;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __80__WFLocationPickerViewController_getMapItemFromRecentContact_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    id v6 = MKMapItemWithPlacemark(a2);
    id v7 = [*(id *)(a1 + 32) displayName];
    [v6 setName:v7];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v8 = getWFGeneralLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 136315650;
      id v11 = "-[WFLocationPickerViewController getMapItemFromRecentContact:completionHandler:]_block_invoke_3";
      __int16 v12 = 2114;
      id v13 = v5;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      _os_log_impl(&dword_23490C000, v8, OS_LOG_TYPE_ERROR, "%s Failed to get map item for recent contact: %{public}@ %@", (uint8_t *)&v10, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __80__WFLocationPickerViewController_getMapItemFromRecentContact_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)displayLocationCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v13 = [(WFLocationPickerViewController *)self mapView];
  id v6 = [v13 annotations];
  [v13 removeAnnotations:v6];

  id v7 = [v13 overlays];
  [v13 removeOverlays:v7];

  id v8 = [(WFLocationPickerViewController *)self circularRegion];
  [v8 radius];
  double v10 = v9;

  if (v10 < 100.0) {
    double v10 = 100.0;
  }
  -[WFLocationPickerViewController showMapRegionForCoordinate:radius:](self, "showMapRegionForCoordinate:radius:", latitude, longitude, v10);
  id v11 = objc_alloc_init(MEMORY[0x263F109E8]);
  objc_msgSend(v11, "setCoordinate:", latitude, longitude);
  [v13 addAnnotation:v11];
  __int16 v12 = -[WFLocationPickerViewController overlayWithCenterCoordinate:radius:](self, "overlayWithCenterCoordinate:radius:", latitude, longitude, v10);
  if (v12) {
    [v13 addOverlay:v12];
  }
  [v13 selectAnnotation:v11 animated:0];
}

- (unint64_t)proximityType
{
  if ([(WFLocationPickerViewController *)self regionCondition]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (BOOL)hasLocation
{
  v2 = [(WFLocationPickerViewController *)self value];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)updateMapHeight
{
  BOOL v3 = [(WFLocationPickerViewController *)self mapHeightConstraint];

  if (v3)
  {
    [(WFLocationPickerViewController *)self mapHeight];
    double v5 = v4;
    id v6 = [(WFLocationPickerViewController *)self mapHeightConstraint];
    [v6 setConstant:v5];
  }
}

- (double)mapHeight
{
  return 300.0;
}

- (void)setupMap
{
  uint64_t v3 = [(WFLocationPickerViewController *)self circularRegion];
  if (v3)
  {
    double v4 = (void *)v3;
    double v5 = [(WFLocationPickerViewController *)self mapView];
    id v6 = [v5 superview];

    if (v6)
    {
      id v7 = [(WFLocationPickerViewController *)self circularRegion];
      [v7 center];
      -[WFLocationPickerViewController displayLocationCoordinate:](self, "displayLocationCoordinate:");
    }
  }
}

- (void)reloadData
{
  id v2 = [(WFLocationPickerViewController *)self tableView];
  [v2 reloadData];
}

- (int64_t)firstLocalSearchResultRowIndex
{
  uint64_t v3 = [(WFLocationPickerViewController *)self localSearchResults];
  uint64_t v4 = [v3 count];

  int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4)
  {
    int64_t v6 = [(WFLocationPickerViewController *)self lastRecentRowIndex];
    if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
      int64_t v6 = [(WFLocationPickerViewController *)self currentLocationRowIndex];
    }
    if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
      return 0;
    }
    else {
      return v6 + 1;
    }
  }
  return v5;
}

- (int64_t)lastRecentRowIndex
{
  int64_t v3 = [(WFLocationPickerViewController *)self firstRecentRowIndex];
  int64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v5 = v3;
    int64_t v6 = [(WFLocationPickerViewController *)self recents];
    int64_t v4 = v5 + [v6 count] - 1;
  }
  return v4;
}

- (int64_t)firstRecentRowIndex
{
  int64_t v3 = [(WFLocationPickerViewController *)self recents];
  uint64_t v4 = [v3 count];

  int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4)
  {
    int64_t v6 = [(WFLocationPickerViewController *)self currentLocationRowIndex];
    if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
      return 0;
    }
    else {
      return v6 + 1;
    }
  }
  return v5;
}

- (int64_t)currentLocationRowIndex
{
  if ([(WFLocationPickerViewController *)self shouldShowCurrentLocationItem]) {
    return 0;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (void)setResolvesCurrentLocationToPlacemark:(BOOL)a3
{
  if (self->_resolvesCurrentLocationToPlacemark != a3)
  {
    self->_resolvesCurrentLocationToPlacemark = a3;
    if (a3)
    {
      WFCLLocationManagerWithOptions();
      uint64_t v4 = (CLLocationManager *)objc_claimAutoreleasedReturnValue();
      locationManager = self->_locationManager;
      self->_locationManager = v4;

      [(CLLocationManager *)self->_locationManager startUpdatingLocation];
    }
    else
    {
      [(CLLocationManager *)self->_locationManager stopUpdatingLocation];
      int64_t v6 = self->_locationManager;
      self->_locationManager = 0;
    }
    [(WFLocationPickerViewController *)self reloadData];
  }
}

- (void)setAllowsPickingCurrentLocation:(BOOL)a3
{
  if (self->_allowsPickingCurrentLocation != a3)
  {
    self->_allowsPickingCurrentLocation = a3;
    if (!self->_locationManager)
    {
      WFCLLocationManagerWithOptions();
      uint64_t v4 = (CLLocationManager *)objc_claimAutoreleasedReturnValue();
      locationManager = self->_locationManager;
      self->_locationManager = v4;

      [(WFLocationPickerViewController *)self checkLocationAuthorization];
    }
    [(WFLocationPickerViewController *)self reloadData];
  }
}

- (BOOL)shouldShowCurrentLocationItem
{
  BOOL v3 = [(WFLocationPickerViewController *)self allowsPickingCurrentLocation];
  if (v3)
  {
    LOBYTE(v3) = [(WFLocationPickerViewController *)self hasSufficientLocationAuthorization];
  }
  return v3;
}

- (void)updateRecentsWithSearchText:(id)a3
{
  v23[2] = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v4 = (void *)MEMORY[0x263F37DB8];
    uint64_t v5 = *MEMORY[0x263F37D78];
    uint64_t v22 = *MEMORY[0x263F37D50];
    int64_t v6 = (void *)MEMORY[0x263EFF8C0];
    id v7 = a3;
    id v8 = [v6 arrayWithObjects:&v22 count:1];
    double v9 = [v4 predicateForKey:v5 inCollection:v8];
    v23[0] = v9;
    double v10 = (void *)MEMORY[0x263F37DB8];
    id v11 = [MEMORY[0x263F37DB8] predicateForKey:*MEMORY[0x263F37D70] matchingText:v7 comparison:1];
    v21[0] = v11;
    __int16 v12 = [MEMORY[0x263F37DB8] predicateForKey:*MEMORY[0x263F37D68] matchingText:v7 comparison:1];

    v21[1] = v12;
    id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
    __int16 v14 = [v10 predicateSatisfyingAnySubpredicate:v13];
    v23[1] = v14;
    uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
    uint64_t v16 = [v4 predicateSatisfyingAllSubpredicates:v15];
  }
  else
  {
    uint64_t v16 = 0;
  }
  id v17 = objc_alloc_init(MEMORY[0x263F37DC0]);
  [v17 setSearchPredicate:v16];
  [v17 setDomains:&unk_26E7C17F8];
  uint64_t v18 = [MEMORY[0x263F37DC0] frecencyComparator];
  [v17 setComparator:v18];

  id v19 = [MEMORY[0x263F37DB0] defaultInstance];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __62__WFLocationPickerViewController_updateRecentsWithSearchText___block_invoke;
  v20[3] = &unk_264BFD930;
  v20[4] = self;
  [v19 performRecentsSearch:v17 queue:MEMORY[0x263EF83A0] completion:v20];
}

void __62__WFLocationPickerViewController_updateRecentsWithSearchText___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setRecents:a2];
  uint64_t v3 = [*(id *)(a1 + 32) tableView];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    uint64_t v5 = [*(id *)(a1 + 32) tableView];
    int64_t v6 = [v5 superview];

    if (v6)
    {
      id v7 = *(void **)(a1 + 32);
      [v7 reloadData];
    }
  }
}

- (void)updateUIWithValue:(id)a3
{
  id v15 = a3;
  [(WFLocationPickerViewController *)self loadViewIfNeeded];
  BOOL v4 = [(WFLocationPickerViewController *)self hasLocation];
  uint64_t v5 = [v15 defaultSearchText];
  int64_t v6 = [(WFLocationPickerViewController *)self searchBar];
  [v6 setText:v5];

  if (v4 && [(WFLocationPickerViewController *)self showsMapView])
  {
    id v7 = [(WFLocationPickerViewController *)self searchBar];
    [v7 resignFirstResponder];

    id v8 = [(WFLocationPickerViewController *)self view];
    double v9 = [(WFLocationPickerViewController *)self mapView];
    [v8 addSubview:v9];

    double v10 = [(WFLocationPickerViewController *)self view];
    id v11 = [(WFLocationPickerViewController *)self dividerView];
    [v10 addSubview:v11];
  }
  else
  {
    __int16 v12 = [(WFLocationPickerViewController *)self mapView];
    [v12 removeFromSuperview];

    double v10 = [(WFLocationPickerViewController *)self dividerView];
    [v10 removeFromSuperview];
  }

  if ([(WFLocationPickerViewController *)self allowsPickingCurrentLocation]
    && [v15 isCurrentLocation])
  {
    id v13 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", -[WFLocationPickerViewController currentLocationRowIndex](self, "currentLocationRowIndex"), 0);
    [(WFLocationPickerViewController *)self setSelectedIndexPath:v13];
  }
  __int16 v14 = [(WFLocationPickerViewController *)self view];
  [v14 setNeedsUpdateConstraints];
}

- (void)updateUI
{
  id v3 = [(WFLocationPickerViewController *)self value];
  [(WFLocationPickerViewController *)self updateUIWithValue:v3];
}

- (MKMapView)mapView
{
  if ([(WFLocationPickerViewController *)self showsMapView] && !self->_mapView)
  {
    id v3 = (MKMapView *)objc_alloc_init(MEMORY[0x263F109A8]);
    mapView = self->_mapView;
    self->_mapView = v3;

    [(MKMapView *)self->_mapView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MKMapView *)self->_mapView setDelegate:self];
    [(MKMapView *)self->_mapView setPitchEnabled:0];
    [(MKMapView *)self->_mapView setRotateEnabled:0];
    [(MKMapView *)self->_mapView setShowsUserLocation:1];
    uint64_t v5 = [(WFLocationPickerViewController *)self dragView];
    [v5 setMapView:self->_mapView];
    [(MKMapView *)self->_mapView addSubview:v5];
  }
  int64_t v6 = self->_mapView;
  return v6;
}

- (WFLocationTriggerEditorMapDragRadiusView)dragView
{
  if ([(WFLocationPickerViewController *)self showsMapView] && !self->_dragView)
  {
    id v3 = [WFLocationTriggerEditorMapDragRadiusView alloc];
    BOOL v4 = -[WFLocationTriggerEditorMapDragRadiusView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    dragView = self->_dragView;
    self->_dragView = v4;

    [(WFLocationTriggerEditorMapDragRadiusView *)self->_dragView setAutoresizingMask:18];
    int64_t v6 = [MEMORY[0x263F825C8] clearColor];
    [(WFLocationTriggerEditorMapDragRadiusView *)self->_dragView setBackgroundColor:v6];

    [(WFLocationTriggerEditorMapDragRadiusView *)self->_dragView setMapView:self->_mapView];
    [(WFLocationTriggerEditorMapDragRadiusView *)self->_dragView setDelegate:self];
    [(WFLocationTriggerEditorMapDragRadiusView *)self->_dragView setProximity:[(WFLocationPickerViewController *)self proximityType]];
  }
  id v7 = self->_dragView;
  return v7;
}

- (BOOL)showsMapView
{
  return [(WFLocationPickerViewController *)self pickerType] == 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)WFLocationPickerViewController;
  id v4 = a3;
  [(WFLocationPickerViewController *)&v12 traitCollectionDidChange:v4];
  uint64_t v5 = [(WFLocationPickerViewController *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7)
  {
    id v8 = [(WFLocationPickerViewController *)self traitCollection];
    uint64_t v9 = [v8 userInterfaceStyle];
    if (v9 == 1) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = v9 == 2;
    }
    id v11 = [(WFLocationPickerViewController *)self searchBar];
    [v11 setKeyboardAppearance:v10];
  }
}

- (void)updateViewConstraints
{
  v82.receiver = self;
  v82.super_class = (Class)WFLocationPickerViewController;
  [(WFLocationPickerViewController *)&v82 updateViewConstraints];
  id v3 = objc_opt_new();
  id v4 = [(WFLocationPickerViewController *)self tableView];
  uint64_t v5 = [v4 leadingAnchor];
  uint64_t v6 = [(WFLocationPickerViewController *)self view];
  uint64_t v7 = [v6 safeAreaLayoutGuide];
  id v8 = [v7 leadingAnchor];
  uint64_t v9 = [v5 constraintEqualToAnchor:v8];
  [v3 addObject:v9];

  uint64_t v10 = [(WFLocationPickerViewController *)self tableView];
  id v11 = [v10 trailingAnchor];
  objc_super v12 = [(WFLocationPickerViewController *)self view];
  id v13 = [v12 safeAreaLayoutGuide];
  __int16 v14 = [v13 trailingAnchor];
  id v15 = [v11 constraintEqualToAnchor:v14];
  [v3 addObject:v15];

  uint64_t v16 = [(WFLocationPickerViewController *)self tableView];
  id v17 = [v16 topAnchor];
  uint64_t v18 = [(WFLocationPickerViewController *)self view];
  id v19 = [v18 safeAreaLayoutGuide];
  uint64_t v20 = [v19 topAnchor];
  id v21 = [v17 constraintEqualToAnchor:v20];
  [v3 addObject:v21];

  uint64_t v22 = [(WFLocationPickerViewController *)self dividerView];
  id v23 = [v22 superview];

  double v24 = [(WFLocationPickerViewController *)self tableView];
  double v25 = [v24 bottomAnchor];
  if (v23)
  {
    double v26 = [(WFLocationPickerViewController *)self dividerView];
    [v26 topAnchor];
  }
  else
  {
    double v26 = [(WFLocationPickerViewController *)self view];
    [v26 bottomAnchor];
  id v27 = };
  v28 = [v25 constraintEqualToAnchor:v27];
  [v3 addObject:v28];

  id v29 = [(WFLocationPickerViewController *)self dividerView];
  id v30 = [v29 superview];

  if (v30)
  {
    uint64_t v31 = [(WFLocationPickerViewController *)self dividerView];
    id v32 = [v31 leadingAnchor];
    v33 = [(WFLocationPickerViewController *)self view];
    v34 = [v33 safeAreaLayoutGuide];
    v35 = [v34 leadingAnchor];
    v36 = [v32 constraintEqualToAnchor:v35];
    [v3 addObject:v36];

    v37 = [(WFLocationPickerViewController *)self dividerView];
    v38 = [v37 trailingAnchor];
    v39 = [(WFLocationPickerViewController *)self view];
    v40 = [v39 safeAreaLayoutGuide];
    v41 = [v40 trailingAnchor];
    v42 = [v38 constraintEqualToAnchor:v41];
    [v3 addObject:v42];

    v43 = [(WFLocationPickerViewController *)self dividerView];
    v44 = [v43 heightAnchor];
    v45 = [MEMORY[0x263F82B60] mainScreen];
    [v45 scale];
    v47 = [v44 constraintEqualToConstant:1.0 / v46];
    [v3 addObject:v47];
  }
  v48 = [(WFLocationPickerViewController *)self mapView];
  v49 = [v48 superview];

  if (v49)
  {
    v50 = [(WFLocationPickerViewController *)self mapView];
    v51 = [v50 topAnchor];
    v52 = [(WFLocationPickerViewController *)self dividerView];
    v53 = [v52 bottomAnchor];
    v54 = [v51 constraintEqualToAnchor:v53];
    [v3 addObject:v54];

    v55 = [(WFLocationPickerViewController *)self mapView];
    v56 = [v55 leadingAnchor];
    v57 = [(WFLocationPickerViewController *)self view];
    v58 = [v57 safeAreaLayoutGuide];
    v59 = [v58 leadingAnchor];
    v60 = [v56 constraintEqualToAnchor:v59];
    [v3 addObject:v60];

    v61 = [(WFLocationPickerViewController *)self mapView];
    v62 = [v61 trailingAnchor];
    v63 = [(WFLocationPickerViewController *)self view];
    v64 = [v63 safeAreaLayoutGuide];
    v65 = [v64 trailingAnchor];
    v66 = [v62 constraintEqualToAnchor:v65];
    [v3 addObject:v66];

    v67 = [(WFLocationPickerViewController *)self mapView];
    v68 = [v67 bottomAnchor];
    v69 = [(WFLocationPickerViewController *)self view];
    v70 = [v69 bottomAnchor];
    v71 = [v68 constraintEqualToAnchor:v70];
    [v3 addObject:v71];

    v72 = [(WFLocationPickerViewController *)self mapView];
    v73 = [v72 heightAnchor];
    [(WFLocationPickerViewController *)self mapHeight];
    v74 = objc_msgSend(v73, "constraintEqualToConstant:");
    [(WFLocationPickerViewController *)self setMapHeightConstraint:v74];

    v75 = [(WFLocationPickerViewController *)self mapHeightConstraint];
    [v3 addObject:v75];
  }
  v76 = [(WFLocationPickerViewController *)self constraints];
  char v77 = [v3 isEqual:v76];

  if ((v77 & 1) == 0)
  {
    v78 = (void *)MEMORY[0x263F08938];
    v79 = [(WFLocationPickerViewController *)self constraints];
    [v78 deactivateConstraints:v79];

    [(WFLocationPickerViewController *)self setConstraints:v3];
    v80 = (void *)MEMORY[0x263F08938];
    v81 = [(WFLocationPickerViewController *)self constraints];
    [v80 activateConstraints:v81];
  }
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)WFLocationPickerViewController;
  [(WFLocationPickerViewController *)&v4 viewDidLayoutSubviews];
  [(WFLocationPickerViewController *)self setupMap];
  [(WFLocationPickerViewController *)self updateMapHeight];
  id v3 = [(WFLocationPickerViewController *)self tableView];
  [v3 scrollToNearestSelectedRowAtScrollPosition:0 animated:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFLocationPickerViewController;
  [(WFLocationPickerViewController *)&v6 viewDidDisappear:a3];
  objc_super v4 = [(WFLocationPickerViewController *)self locationManager];

  if (v4)
  {
    uint64_t v5 = [(WFLocationPickerViewController *)self locationManager];
    [v5 stopUpdatingLocation];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v15.receiver = self;
  v15.super_class = (Class)WFLocationPickerViewController;
  [(WFLocationPickerViewController *)&v15 viewWillDisappear:a3];
  objc_super v4 = [(WFLocationPickerViewController *)self mapView];
  uint64_t v5 = [(WFLocationPickerViewController *)self mapView];
  objc_super v6 = [v5 annotations];
  [v4 removeAnnotations:v6];

  uint64_t v7 = [(WFLocationPickerViewController *)self mapView];
  id v8 = [(WFLocationPickerViewController *)self mapView];
  uint64_t v9 = [v8 overlays];
  [v7 removeOverlays:v9];

  uint64_t v10 = [(WFLocationPickerViewController *)self mapView];
  [v10 setDelegate:0];

  id v11 = [(WFLocationPickerViewController *)self mapView];
  [v11 setShowsUserLocation:0];

  objc_super v12 = [(WFLocationPickerViewController *)self searchBar];
  [v12 resignFirstResponder];

  id v13 = [(WFLocationPickerViewController *)self navigationItem];
  __int16 v14 = [v13 searchController];
  [v14 setActive:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFLocationPickerViewController;
  [(WFLocationPickerViewController *)&v6 viewDidAppear:a3];
  objc_super v4 = [(WFLocationPickerViewController *)self locationManager];

  if (v4)
  {
    uint64_t v5 = [(WFLocationPickerViewController *)self locationManager];
    [v5 startUpdatingLocation];
  }
  [(WFLocationPickerViewController *)self setupMap];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WFLocationPickerViewController;
  [(WFLocationPickerViewController *)&v4 viewWillAppear:a3];
  [(WFLocationPickerViewController *)self checkLocationAuthorization];
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x263F82E00]);
  double v4 = *MEMORY[0x263F001A8];
  double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 24);
  id v23 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], v5, v6, v7);
  id v8 = [MEMORY[0x263F825C8] systemBackgroundColor];
  [v23 setBackgroundColor:v8];

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F82BA0]) initWithSearchResultsController:0];
  [v9 setObscuresBackgroundDuringPresentation:0];
  [v9 setHidesNavigationBarDuringPresentation:0];
  [v9 setAutomaticallyShowsCancelButton:0];
  uint64_t v10 = [(WFLocationPickerViewController *)self navigationItem];
  [v10 setSearchController:v9];

  id v11 = [(WFLocationPickerViewController *)self navigationItem];
  [v11 setHidesSearchBarWhenScrolling:0];

  objc_super v12 = [v9 searchBar];
  searchBar = self->_searchBar;
  self->_searchBar = v12;

  [(UISearchBar *)self->_searchBar setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UISearchBar *)self->_searchBar setAutocorrectionType:1];
  __int16 v14 = WFLocalizedString(@"Search or Enter Address");
  [(UISearchBar *)self->_searchBar setPlaceholder:v14];

  [(UISearchBar *)self->_searchBar setTextContentType:*MEMORY[0x263F83A08]];
  [(UISearchBar *)self->_searchBar setDelegate:self];
  objc_super v15 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v4, v5, v6, v7);
  dividerView = self->_dividerView;
  self->_dividerView = v15;

  id v17 = [MEMORY[0x263F825C8] colorWithWhite:0.8 alpha:1.0];
  [(UIView *)self->_dividerView setBackgroundColor:v17];

  [(UIView *)self->_dividerView setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v18 = (UITableView *)objc_msgSend(objc_alloc(MEMORY[0x263F82C78]), "initWithFrame:style:", 0, v4, v5, v6, v7);
  tableView = self->_tableView;
  self->_tableView = v18;

  [(UITableView *)self->_tableView setDataSource:self];
  [(UITableView *)self->_tableView setDelegate:self];
  [(UITableView *)self->_tableView setKeyboardDismissMode:1];
  [(UITableView *)self->_tableView setRowHeight:*MEMORY[0x263F839B8]];
  uint64_t v20 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  [v20 _scaledValueForValue:44.0];
  -[UITableView setEstimatedRowHeight:](self->_tableView, "setEstimatedRowHeight:");

  [(UITableView *)self->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
  id v21 = self->_tableView;
  uint64_t v22 = [(UITableView *)v21 indexPathForSelectedRow];
  [(UITableView *)v21 deselectRowAtIndexPath:v22 animated:0];

  [(WFLocationPickerViewController *)self reloadData];
  [v23 addSubview:self->_tableView];
  [(WFLocationPickerViewController *)self setView:v23];
  [(WFLocationPickerViewController *)self updateUI];
}

- (WFLocationPickerViewController)initWithPickerType:(unint64_t)a3 value:(id)a4
{
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)WFLocationPickerViewController;
  id v8 = [(WFLocationPickerViewController *)&v19 init];
  uint64_t v9 = v8;
  if (v8)
  {
    v8->_pickerType = a3;
    objc_storeStrong((id *)&v8->_value, a4);
    uint64_t v10 = [v7 placemark];

    if (v10)
    {
      id v11 = [v7 placemark];
      objc_super v12 = MKMapItemWithPlacemark(v11);
      [(WFLocationPickerViewController *)v9 updateValueWithMapItem:v12];
    }
    [(WFLocationPickerViewController *)v9 updateRecentsWithSearchText:0];
    id v13 = WFLocalizedString(@"Choose Location");
    [(WFLocationPickerViewController *)v9 setTitle:v13];

    __int16 v14 = [(WFLocationPickerViewController *)v9 navigationItem];
    objc_super v15 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:v9 action:sel_cancel_];
    [v14 setLeftBarButtonItem:v15];

    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:v9 action:sel_done_];
    [v14 setRightBarButtonItem:v16];

    id v17 = v9;
  }

  return v9;
}

@end