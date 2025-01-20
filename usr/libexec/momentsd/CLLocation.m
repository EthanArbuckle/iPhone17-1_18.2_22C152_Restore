@interface CLLocation
- (CLLocation)initWithRTLocation:(id)a3;
@end

@implementation CLLocation

- (CLLocation)initWithRTLocation:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    [v5 latitude];
    CLLocationDegrees v8 = v7;
    [v6 longitude];
    CLLocationCoordinate2D v10 = CLLocationCoordinate2DMake(v8, v9);
    [v6 horizontalUncertainty];
    double v12 = v11;
    v13 = [v6 date];
    self = -[CLLocation initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:](self, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v13, v10.latitude, v10.longitude, 0.0, v12, -1.0);

    v14 = self;
  }
  else
  {
    v15 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CLLocation(RTExtensions) initWithRTLocation:](v15);
    }

    v16 = +[NSAssertionHandler currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"CLLocation+MOExtensions.m" lineNumber:20 description:@"Invalid parameter not satisfying: location"];

    v14 = 0;
  }

  return v14;
}

@end