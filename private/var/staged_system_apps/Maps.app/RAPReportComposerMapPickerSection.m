@interface RAPReportComposerMapPickerSection
- (RAPReportComposerMapPickerSection)initWithFeatureKind:(int64_t)a3 camera:(id)a4 delegate:(id)a5 markerViewAttributes:(id)a6;
- (RAPReportComposerMapPickerSection)initWithFeatureKind:(int64_t)a3 centerCoordinate:(CLLocationCoordinate2D)a4 delegate:(id)a5 markerViewAttributes:(id)a6;
- (id)cellForRowAtIndex:(int64_t)a3;
- (id)headerTitle;
- (int64_t)rowsCount;
- (void)didSelectCellForRowAtIndex:(int64_t)a3 tableIndexPath:(id)a4;
- (void)registerReuseIdentifiersForCells;
- (void)updateCoordinate:(CLLocationCoordinate2D)a3;
@end

@implementation RAPReportComposerMapPickerSection

- (RAPReportComposerMapPickerSection)initWithFeatureKind:(int64_t)a3 camera:(id)a4 delegate:(id)a5 markerViewAttributes:(id)a6
{
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  [v11 centerCoordinate];
  v14 = -[RAPReportComposerMapPickerSection initWithFeatureKind:centerCoordinate:delegate:markerViewAttributes:](self, "initWithFeatureKind:centerCoordinate:delegate:markerViewAttributes:", a3, v13, v12);

  if (v14) {
    objc_storeStrong((id *)&v14->_camera, a4);
  }

  return v14;
}

- (RAPReportComposerMapPickerSection)initWithFeatureKind:(int64_t)a3 centerCoordinate:(CLLocationCoordinate2D)a4 delegate:(id)a5 markerViewAttributes:(id)a6
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  id v11 = a5;
  id v12 = (RAPMarkerViewAttributes *)a6;
  v19.receiver = self;
  v19.super_class = (Class)RAPReportComposerMapPickerSection;
  id v13 = [(RAPTablePartSection *)&v19 init];
  if (v13)
  {
    if (!v12)
    {
      v14 = [RAPMarkerViewAttributes alloc];
      v15 = +[GEOFeatureStyleAttributes addressMarkerStyleAttributes];
      id v12 = [(RAPMarkerViewAttributes *)v14 initWithTitle:0 styleAttributes:v15];
    }
    v16 = -[RAPInlineMapViewModel initForPickingFeatureOfKind:centerCoordinate:markerViewAttributes:accessPointsEnabled:delegate:]([RAPInlineMapViewModel alloc], "initForPickingFeatureOfKind:centerCoordinate:markerViewAttributes:accessPointsEnabled:delegate:", a3, v12, 0, v11, latitude, longitude);
    mapViewModel = v13->_mapViewModel;
    v13->_mapViewModel = v16;

    v13->_kind = a3;
  }

  return v13;
}

- (void)updateCoordinate:(CLLocationCoordinate2D)a3
{
}

- (int64_t)rowsCount
{
  return 1;
}

- (id)cellForRowAtIndex:(int64_t)a3
{
  mapViewCell = self->_mapViewCell;
  if (!mapViewCell)
  {
    v5 = [[RAPMapViewTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"MapViewTableViewCell" viewModel:self->_mapViewModel];
    v6 = self->_mapViewCell;
    self->_mapViewCell = v5;

    mapViewCell = self->_mapViewCell;
  }

  return mapViewCell;
}

- (id)headerTitle
{
  int64_t kind = self->_kind;
  if (kind == 3)
  {
    v3 = +[NSBundle mainBundle];
    v4 = v3;
    CFStringRef v5 = @"Entrance [Report a Problem]";
  }
  else if (kind)
  {
    v3 = +[NSBundle mainBundle];
    v4 = v3;
    CFStringRef v5 = @"Location [Add Location Section]";
  }
  else
  {
    v3 = +[NSBundle mainBundle];
    v4 = v3;
    CFStringRef v5 = @"Label [Report a Problem]";
  }
  v6 = [v3 localizedStringForKey:v5 value:@"localized string not found" table:0];

  return v6;
}

- (void)didSelectCellForRowAtIndex:(int64_t)a3 tableIndexPath:(id)a4
{
  id v5 = [(RAPInlineMapViewModel *)self->_mapViewModel delegate];
  [v5 inlineMapViewModelRequestsDisplayPowerActions:self->_mapViewModel];
}

- (void)registerReuseIdentifiersForCells
{
  uint64_t v3 = objc_opt_class();

  [(RAPTablePartSection *)self registerClass:v3 forNamespacedReuseIdentifier:@"MapViewTableViewCell"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_camera, 0);
  objc_storeStrong((id *)&self->_mapViewCell, 0);

  objc_storeStrong((id *)&self->_mapViewModel, 0);
}

@end