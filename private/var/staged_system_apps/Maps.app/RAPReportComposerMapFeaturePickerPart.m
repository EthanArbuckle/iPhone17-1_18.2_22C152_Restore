@interface RAPReportComposerMapFeaturePickerPart
- (RAPReportComposerMapFeaturePickerPart)initWithFeatureKind:(int64_t)a3 camera:(id)a4 delegate:(id)a5 markerViewAttributes:(id)a6;
- (RAPReportComposerMapFeaturePickerPart)initWithFeatureKind:(int64_t)a3 centerCoordinate:(CLLocationCoordinate2D)a4 delegate:(id)a5 markerViewAttributes:(id)a6;
- (RAPReportComposerMapFeaturePickerPart)initWithMapPickerSection:(id)a3;
- (void)updateCoordinate:(CLLocationCoordinate2D)a3;
@end

@implementation RAPReportComposerMapFeaturePickerPart

- (RAPReportComposerMapFeaturePickerPart)initWithFeatureKind:(int64_t)a3 camera:(id)a4 delegate:(id)a5 markerViewAttributes:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = [[RAPReportComposerMapPickerSection alloc] initWithFeatureKind:a3 camera:v12 delegate:v11 markerViewAttributes:v10];

  v14 = [(RAPReportComposerMapFeaturePickerPart *)self initWithMapPickerSection:v13];
  return v14;
}

- (RAPReportComposerMapFeaturePickerPart)initWithFeatureKind:(int64_t)a3 centerCoordinate:(CLLocationCoordinate2D)a4 delegate:(id)a5 markerViewAttributes:(id)a6
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  id v11 = a6;
  id v12 = a5;
  v13 = -[RAPReportComposerMapPickerSection initWithFeatureKind:centerCoordinate:delegate:markerViewAttributes:]([RAPReportComposerMapPickerSection alloc], "initWithFeatureKind:centerCoordinate:delegate:markerViewAttributes:", a3, v12, v11, latitude, longitude);

  v14 = [(RAPReportComposerMapFeaturePickerPart *)self initWithMapPickerSection:v13];
  return v14;
}

- (RAPReportComposerMapFeaturePickerPart)initWithMapPickerSection:(id)a3
{
  id v5 = a3;
  id v10 = v5;
  v6 = +[NSArray arrayWithObjects:&v10 count:1];
  v9.receiver = self;
  v9.super_class = (Class)RAPReportComposerMapFeaturePickerPart;
  v7 = [(RAPTablePart *)&v9 initWithSections:v6];

  if (v7)
  {
    objc_storeStrong((id *)&v7->_mapCoordinatePickerSection, a3);
    [(RAPTablePartSection *)v7->_mapCoordinatePickerSection setHeaderTitle:@"Test"];
  }

  return v7;
}

- (void)updateCoordinate:(CLLocationCoordinate2D)a3
{
}

- (void).cxx_destruct
{
}

@end