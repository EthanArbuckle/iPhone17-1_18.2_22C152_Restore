@interface RAPEntryPoint
+ (id)entryPointStyleAttributes;
- (BOOL)isDestinationEntryPoint;
- (CLLocationCoordinate2D)coordinate;
- (GEORoadAccessPoint)accessPoint;
- (NSString)subtitle;
- (NSString)title;
- (RAPEntryPoint)initWithAccessPoint:(id)a3;
- (RAPEntryPoint)initWithAccessPoint:(id)a3 type:(int64_t)a4;
- (id)markerText;
- (int64_t)entryPointType;
- (void)_setType:(int64_t)a3;
- (void)setAccessPoint:(id)a3;
- (void)setCoordinate:(CLLocationCoordinate2D)a3;
@end

@implementation RAPEntryPoint

- (RAPEntryPoint)initWithAccessPoint:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RAPEntryPoint;
  v6 = [(RAPEntryPoint *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_accessPoint, a3);
  }

  return v7;
}

- (RAPEntryPoint)initWithAccessPoint:(id)a3 type:(int64_t)a4
{
  id v5 = [(RAPEntryPoint *)self initWithAccessPoint:a3];
  v6 = v5;
  if (v5) {
    [(RAPEntryPoint *)v5 _setType:a4];
  }
  return v6;
}

- (NSString)subtitle
{
  return (NSString *)[(RAPEntryPoint *)self markerText];
}

- (NSString)title
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Entrance [Report a Problem]" value:@"localized string not found" table:0];

  return (NSString *)v3;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v7 = objc_alloc_init((Class)GEOLatLng);
  [v7 setLat:latitude];
  [v7 setLng:longitude];
  v6 = [(RAPEntryPoint *)self accessPoint];
  [v6 setLocation:v7];
}

- (CLLocationCoordinate2D)coordinate
{
  v3 = [(RAPEntryPoint *)self accessPoint];
  v4 = [v3 location];
  [v4 lat];
  CLLocationDegrees v6 = v5;
  id v7 = [(RAPEntryPoint *)self accessPoint];
  v8 = [v7 location];
  [v8 lng];
  CLLocationCoordinate2D v10 = CLLocationCoordinate2DMake(v6, v9);

  double latitude = v10.latitude;
  double longitude = v10.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (id)markerText
{
  v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"Drive [RAP][Entry Points]" value:@"localized string not found" table:0];

  double v5 = +[NSBundle mainBundle];
  CLLocationDegrees v6 = [v5 localizedStringForKey:@"Walk [RAP][Entry Points]" value:@"localized string not found" table:0];

  id v7 = +[NSBundle mainBundle];
  v8 = [v7 localizedStringForKey:@"Drive / Walk [RAP][Entry Points]" value:@"localized string not found" table:0];

  int64_t v9 = [(RAPEntryPoint *)self entryPointType];
  CLLocationCoordinate2D v10 = v6;
  if (v9 != 1)
  {
    if (v9 == 3)
    {
      CLLocationCoordinate2D v10 = v8;
    }
    else
    {
      id v11 = 0;
      CLLocationCoordinate2D v10 = v4;
      if (v9 != 2) {
        goto LABEL_7;
      }
    }
  }
  id v11 = v10;
LABEL_7:
  id v12 = v11;

  return v12;
}

- (int64_t)entryPointType
{
  v3 = [(RAPEntryPoint *)self accessPoint];
  if ([v3 hasWalkingDirection])
  {
    v4 = [(RAPEntryPoint *)self accessPoint];
    unsigned __int8 v5 = [v4 hasDrivingDirection];

    if (v5) {
      return 3;
    }
  }
  else
  {
  }
  id v7 = [(RAPEntryPoint *)self accessPoint];
  LODWORD(v8) = [v7 hasWalkingDirection];

  uint64_t v9 = v8;
  CLLocationCoordinate2D v10 = [(RAPEntryPoint *)self accessPoint];
  unsigned int v11 = [v10 hasDrivingDirection];

  uint64_t v12 = 1;
  if (v8) {
    uint64_t v12 = 2;
  }
  if (v11) {
    uint64_t v8 = v12;
  }
  else {
    uint64_t v8 = v8;
  }
  if (v11) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = v9;
  }
  v14 = [(RAPEntryPoint *)self accessPoint];
  unsigned int v15 = [v14 hasTransitDirection];

  int64_t v16 = 4;
  if (!v15) {
    int64_t v16 = v13;
  }
  if (v8 + (unint64_t)v15 <= 1) {
    return v16;
  }
  else {
    return 5;
  }
}

- (void)_setType:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      unsigned __int8 v5 = [(RAPEntryPoint *)self accessPoint];
      [v5 setDrivingDirection:0];

      CLLocationDegrees v6 = [(RAPEntryPoint *)self accessPoint];
      [v6 setWalkingDirection:3];

      id v7 = [(RAPEntryPoint *)self accessPoint];
      [v7 setTransitDirection:0];

      uint64_t v8 = [(RAPEntryPoint *)self accessPoint];
      [v8 setHasDrivingDirection:0];
      goto LABEL_5;
    case 2:
      uint64_t v9 = [(RAPEntryPoint *)self accessPoint];
      [v9 setDrivingDirection:3];

      CLLocationCoordinate2D v10 = [(RAPEntryPoint *)self accessPoint];
      [v10 setWalkingDirection:0];

      unsigned int v11 = [(RAPEntryPoint *)self accessPoint];
      [v11 setTransitDirection:0];

      uint64_t v8 = [(RAPEntryPoint *)self accessPoint];
      [v8 setHasWalkingDirection:0];
      goto LABEL_5;
    case 3:
      uint64_t v12 = [(RAPEntryPoint *)self accessPoint];
      [v12 setDrivingDirection:3];

      uint64_t v13 = [(RAPEntryPoint *)self accessPoint];
      [v13 setWalkingDirection:3];

      uint64_t v8 = [(RAPEntryPoint *)self accessPoint];
      [v8 setTransitDirection:0];
LABEL_5:

      id v20 = [(RAPEntryPoint *)self accessPoint];
      [v20 setHasTransitDirection:0];
      goto LABEL_8;
    case 4:
      v14 = [(RAPEntryPoint *)self accessPoint];
      [v14 setDrivingDirection:0];

      unsigned int v15 = [(RAPEntryPoint *)self accessPoint];
      [v15 setWalkingDirection:0];

      int64_t v16 = [(RAPEntryPoint *)self accessPoint];
      [v16 setTransitDirection:3];

      v17 = [(RAPEntryPoint *)self accessPoint];
      [v17 setHasWalkingDirection:0];

      id v20 = [(RAPEntryPoint *)self accessPoint];
      [v20 setHasDrivingDirection:0];
      goto LABEL_8;
    case 5:
      v18 = [(RAPEntryPoint *)self accessPoint];
      [v18 setDrivingDirection:3];

      v19 = [(RAPEntryPoint *)self accessPoint];
      [v19 setWalkingDirection:3];

      id v20 = [(RAPEntryPoint *)self accessPoint];
      [v20 setTransitDirection:3];
LABEL_8:

      break;
    default:
      return;
  }
}

- (BOOL)isDestinationEntryPoint
{
  uint64_t v3 = [(RAPEntryPoint *)self accessPoint];
  unsigned int v4 = [v3 hasWalkingDirection];

  if (v4)
  {
    unsigned __int8 v5 = [(RAPEntryPoint *)self accessPoint];
    BOOL v6 = [v5 walkingDirection] == 4;
  }
  else
  {
    BOOL v6 = 0;
  }
  id v7 = [(RAPEntryPoint *)self accessPoint];
  unsigned int v8 = [v7 hasDrivingDirection];

  if (v8)
  {
    uint64_t v9 = [(RAPEntryPoint *)self accessPoint];
    BOOL v10 = [v9 drivingDirection] == 4;
  }
  else
  {
    BOOL v10 = 0;
  }
  unsigned int v11 = [(RAPEntryPoint *)self accessPoint];
  unsigned int v12 = [v11 hasTransitDirection];

  if (v12)
  {
    uint64_t v13 = [(RAPEntryPoint *)self accessPoint];
    BOOL v14 = [v13 transitDirection] == 4;
  }
  else
  {
    BOOL v14 = 0;
  }
  return v6 || v10 || v14;
}

+ (id)entryPointStyleAttributes
{
  id v2 = [objc_alloc((Class)GEOFeatureStyleAttributes) initWithAttributes:5, 3, 6, 197, 10, 5, 0];

  return v2;
}

- (GEORoadAccessPoint)accessPoint
{
  return self->_accessPoint;
}

- (void)setAccessPoint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end