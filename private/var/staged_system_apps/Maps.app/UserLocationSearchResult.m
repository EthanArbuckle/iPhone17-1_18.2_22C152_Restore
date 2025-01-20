@interface UserLocationSearchResult
- (BOOL)isSelected;
- (BOOL)needsReverseGeocodeCheck;
- (CLLocation)location;
- (UserLocationSearchResult)init;
- (double)accuracy;
- (void)_updateFloorOrdinal:(int)a3;
- (void)locationManagerApprovalDidChange:(id)a3;
- (void)setCoordinate:(CLLocationCoordinate2D)a3;
- (void)setLocation:(id)a3;
- (void)setReverseGeocoded:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation UserLocationSearchResult

- (UserLocationSearchResult)init
{
  v7.receiver = self;
  v7.super_class = (Class)UserLocationSearchResult;
  v2 = [(SearchResult *)&v7 initWithType:4];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"locationManagerApprovalDidChange:" name:MKLocationManagerApprovalDidChangeNotification object:0];

    v4 = [(SearchResult *)v2 defaultName];
    v5 = [(SearchResultRepr *)v2 place];
    [v5 setName:v4];
  }
  return v2;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  CLLocationDegrees longitude = a3.longitude;
  CLLocationDegrees latitude = a3.latitude;
  CFAbsoluteTime v6 = CFAbsoluteTimeGetCurrent() - self->_reverseGeocodeUpdateTime;
  GEOCalculateDistance();
  double v8 = v7;
  if (v6 > 60.0 || v7 > 500.0)
  {
    [(SearchResult *)self clearLocationInformation];
    if (self->_selected && v8 > 500.0)
    {
      v9 = +[CustomLocationManager sharedManager];
      [v9 processSearchResult:self traits:0];
    }
  }
  self->super._coordinate.CLLocationDegrees latitude = latitude;
  self->super._coordinate.CLLocationDegrees longitude = longitude;

  [(SearchResult *)self _syncGEOPlaceWithCoordinate];
}

- (void)setLocation:(id)a3
{
  location = (CLLocation *)a3;
  double v8 = location;
  if (self->_location != location)
  {
    objc_storeStrong((id *)&self->_location, a3);
    location = self->_location;
  }
  [(UserLocationSearchResult *)self _updateFloorOrdinal:GEOLocationFloorOrdinalFromCLLocation(location)];
  [(CLLocation *)v8 horizontalAccuracy];
  if (vabdd_f64(v6, self->_reverseGeocodeAccuracy) > 50.0)
  {
    [(SearchResult *)self clearLocationInformation];
    if (self->_selected)
    {
      double v7 = +[CustomLocationManager sharedManager];
      [v7 processSearchResult:self traits:0];
    }
  }
}

- (void)setReverseGeocoded:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    self->_reverseGeocodeUpdateTime = CFAbsoluteTimeGetCurrent();
    [(SearchResult *)self coordinate];
    self->_reverseGeocodeCoordinate.CLLocationDegrees latitude = v5;
    self->_reverseGeocodeCoordinate.CLLocationDegrees longitude = v6;
    [(UserLocationSearchResult *)self accuracy];
    self->_reverseGeocodeAccuracy = v7;
  }
  v8.receiver = self;
  v8.super_class = (Class)UserLocationSearchResult;
  [(SearchResult *)&v8 setReverseGeocoded:v3];
}

- (CLLocation)location
{
  return self->_location;
}

- (void)_updateFloorOrdinal:(int)a3
{
  if (a3 == 0x7FFFFFFF) {
    [(SearchResultRepr *)self setHasFloorOrdinal:0];
  }
  else {
    -[SearchResultRepr setFloorOrdinal:](self, "setFloorOrdinal:");
  }
}

- (double)accuracy
{
  v2 = [(UserLocationSearchResult *)self location];
  [v2 horizontalAccuracy];
  double v4 = v3;

  return v4;
}

- (BOOL)needsReverseGeocodeCheck
{
  return ![(SearchResult *)self isReverseGeocoded];
}

- (void)locationManagerApprovalDidChange:(id)a3
{
  id v8 = [(SearchResult *)self defaultName];
  double v4 = [(SearchResultRepr *)self place];
  CLLocationDegrees v5 = [v4 name];
  unsigned __int8 v6 = [v5 isEqualToString:v8];

  if ((v6 & 1) == 0)
  {
    double v7 = [(SearchResultRepr *)self place];
    [v7 setName:v8];
  }
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (void).cxx_destruct
{
}

@end