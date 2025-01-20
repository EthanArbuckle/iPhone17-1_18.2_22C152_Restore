@interface PLLocationOfInterestLocation
- (CLLocation)location;
- (PLLocationOfInterestLocation)initWithLocation:(id)a3 uncertainty:(double)a4;
- (double)distanceFromLocation:(id)a3 withTypeRadius:(double)a4;
- (double)uncertainty;
- (id)description;
@end

@implementation PLLocationOfInterestLocation

- (void).cxx_destruct
{
}

- (double)uncertainty
{
  return self->_uncertainty;
}

- (CLLocation)location
{
  return self->_location;
}

- (double)distanceFromLocation:(id)a3 withTypeRadius:(double)a4
{
  [(CLLocation *)self->_location distanceFromLocation:a3];
  double uncertainty = self->_uncertainty;
  double v8 = v6 - fmin(uncertainty, 1500.0);
  if (uncertainty == 1.79769313e308) {
    double v9 = 1.79769313e308;
  }
  else {
    double v9 = v8;
  }
  double result = v6 - a4;
  if (v9 < result) {
    return v9;
  }
  return result;
}

- (id)description
{
  location = self->_location;
  v4 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)PLLocationOfInterestLocation;
  v5 = location;
  double v6 = [(PLLocationOfInterestLocation *)&v13 description];
  [(CLLocation *)v5 coordinate];
  double v9 = [NSString stringWithFormat:@"{%.8f, %.8f}", v7, v8];
  double uncertainty = self->_uncertainty;

  v11 = [v4 stringWithFormat:@"%@ - %@ – %.2f", v6, v9, *(void *)&uncertainty];

  return v11;
}

- (PLLocationOfInterestLocation)initWithLocation:(id)a3 uncertainty:(double)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLLocationOfInterestLocation;
  uint64_t v8 = [(PLLocationOfInterestLocation *)&v13 init];
  if (v8)
  {
    if (!v7) {
      goto LABEL_9;
    }
    [v7 coordinate];
    double latitude = v14.latitude;
    double longitude = v14.longitude;
    if (!CLLocationCoordinate2DIsValid(v14)) {
      goto LABEL_9;
    }
    BOOL v11 = latitude != 0.0;
    if (longitude != 0.0) {
      BOOL v11 = 1;
    }
    if (v11 && (latitude != 40.0 || longitude != -100.0))
    {
      objc_storeStrong((id *)&v8->_location, a3);
      v8->_double uncertainty = a4;
    }
    else
    {
LABEL_9:

      uint64_t v8 = 0;
    }
  }

  return v8;
}

@end