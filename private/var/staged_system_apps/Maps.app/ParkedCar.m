@interface ParkedCar
+ (id)personalizedItemKey;
+ (id)title;
- (CLLocationCoordinate2D)coordinate;
- (MKMapItem)mapItem;
- (NSDate)date;
- (NSString)locationDisplayString;
- (NSString)locationName;
- (NSString)notes;
- (NSString)title;
- (ParkedCar)init;
- (ParkedCar)initWithVehicleEvent:(id)a3 geoMapItem:(id)a4;
- (RTVehicleEvent)vehicleEvent;
- (UIImage)image;
- (double)horizontalAccuracy;
- (int)referenceFrame;
- (unint64_t)locationQuality;
- (void)setCoordinate:(CLLocationCoordinate2D)a3;
- (void)setImage:(id)a3;
- (void)setMapItem:(id)a3;
- (void)setNotes:(id)a3;
- (void)setReferenceFrame:(int)a3;
- (void)updateFromVehicleEvent:(id)a3 geoMapItem:(id)a4;
@end

@implementation ParkedCar

+ (id)personalizedItemKey
{
  return @"parkedcar";
}

- (ParkedCar)init
{
  return 0;
}

- (ParkedCar)initWithVehicleEvent:(id)a3 geoMapItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6
    && (v11.receiver = self,
        v11.super_class = (Class)ParkedCar,
        v8 = [(ParkedCar *)&v11 init],
        (self = v8) != 0))
  {
    [(ParkedCar *)v8 updateFromVehicleEvent:v6 geoMapItem:v7];
    self = self;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)updateFromVehicleEvent:(id)a3 geoMapItem:(id)a4
{
  id v38 = a3;
  id v7 = a4;
  objc_storeStrong((id *)&self->_vehicleEvent, a3);
  uint64_t v8 = [v38 notes];
  v9 = (void *)v8;
  if (v8) {
    v10 = (__CFString *)v8;
  }
  else {
    v10 = &stru_101324E70;
  }
  objc_storeStrong((id *)&self->_notes, v10);

  objc_super v11 = [(RTVehicleEvent *)self->_vehicleEvent location];
  [v11 latitude];
  CLLocationDegrees v13 = v12;
  v14 = [(RTVehicleEvent *)self->_vehicleEvent location];
  [v14 longitude];
  self->_coordinate = CLLocationCoordinate2DMake(v13, v15);

  v16 = [v38 location];
  self->_referenceFrame = [v16 referenceFrame];

  v17 = [(RTVehicleEvent *)self->_vehicleEvent location];
  [v17 horizontalUncertainty];
  self->_horizontalAccuracy = v18;

  double v19 = fabs(self->_horizontalAccuracy);
  if (v19 >= INFINITY && v19 <= INFINITY) {
    self->_horizontalAccuracy = -1.0;
  }
  v20 = [(RTVehicleEvent *)self->_vehicleEvent date];
  date = self->_date;
  self->_date = v20;

  v22 = [v38 photo];

  if (v22)
  {
    id v23 = objc_alloc((Class)UIImage);
    v24 = [v38 photo];
    v25 = (UIImage *)[v23 initWithData:v24];
    image = self->_image;
    self->_image = v25;
  }
  else
  {
    v24 = self->_image;
    self->_image = 0;
  }

  if (v7)
  {
    v27 = (MKMapItem *)[objc_alloc((Class)MKMapItem) initWithGeoMapItem:v7 isPlaceHolderPlace:0];
    mapItem = self->_mapItem;
    self->_mapItem = v27;
  }
  else
  {
    id v29 = objc_alloc((Class)CLLocation);
    v30 = [(RTVehicleEvent *)self->_vehicleEvent location];
    [v30 latitude];
    double v32 = v31;
    v33 = [(RTVehicleEvent *)self->_vehicleEvent location];
    [v33 longitude];
    mapItem = (MKMapItem *)[v29 initWithLatitude:v32 longitude:v34];

    v35 = (MKMapItem *)[objc_alloc((Class)MKMapItem) initWithCLLocation:mapItem];
    v36 = self->_mapItem;
    self->_mapItem = v35;
  }
  v37 = [(ParkedCar *)self title];
  [(MKMapItem *)self->_mapItem setName:v37];
}

- (void)setMapItem:(id)a3
{
  v4 = (MKMapItem *)a3;
  if (!v4)
  {
    id v5 = [objc_alloc((Class)CLLocation) initWithLatitude:self->_coordinate.latitude longitude:self->_coordinate.longitude];
    v4 = (MKMapItem *)[objc_alloc((Class)MKMapItem) initWithCLLocation:v5];
  }
  id v6 = [(ParkedCar *)self title];
  [(MKMapItem *)v4 setName:v6];

  mapItem = self->_mapItem;
  self->_mapItem = v4;
}

- (NSString)title
{
  v2 = objc_opt_class();

  return (NSString *)[v2 title];
}

+ (id)title
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Parked Car [FindMyCar]" value:@"localized string not found" table:0];

  return v3;
}

- (NSString)locationDisplayString
{
  v2 = [(ParkedCar *)self locationName];
  if ([v2 length])
  {
    v3 = +[NSBundle mainBundle];
    v4 = [v3 localizedStringForKey:@"Near %@ [Widget/Proactive Tray FmC row subtitle, with address]", @"localized string not found", 0 value table];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v2);
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = &stru_101324E70;
  }

  return (NSString *)v5;
}

- (NSString)locationName
{
  v3 = [(RTVehicleEvent *)self->_vehicleEvent nearbyLocationOfInterest];

  if (v3)
  {
    v4 = [(RTVehicleEvent *)self->_vehicleEvent nearbyLocationOfInterest];
    [v4 type];
    id v5 = [(RTVehicleEvent *)self->_vehicleEvent nearbyLocationOfInterest];
    id v6 = [v5 customLabel];
    v3 = MapsSuggestionsRoutineLocalizedLabelLOIType();
  }
  id v7 = [(MKMapItem *)self->_mapItem _geoMapItem];
  uint64_t v8 = sub_100A7C820(v7, v3);

  return (NSString *)v8;
}

- (NSDate)date
{
  return self->_date;
}

- (unint64_t)locationQuality
{
  return (unint64_t)[(RTVehicleEvent *)self->_vehicleEvent locationQuality];
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (RTVehicleEvent)vehicleEvent
{
  return self->_vehicleEvent;
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  self->_coordinate = a3;
}

- (int)referenceFrame
{
  return self->_referenceFrame;
}

- (void)setReferenceFrame:(int)a3
{
  self->_referenceFrame = a3;
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (NSString)notes
{
  return self->_notes;
}

- (void)setNotes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);

  objc_storeStrong((id *)&self->_vehicleEvent, 0);
}

@end