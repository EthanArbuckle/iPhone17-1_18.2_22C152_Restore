@interface ClientTypeResolverCurrentLocationSource
- (BOOL)hasObjectWithType:(int)a3;
- (ClientTypeResolverCurrentLocationSource)initWithLocationManager:(id)a3;
- (MKLocationManager)locationManager;
- (id)cachedObject;
- (id)knownTypes;
- (void)objectWithCompletion:(id)a3;
- (void)setLocationManager:(id)a3;
@end

@implementation ClientTypeResolverCurrentLocationSource

- (id)knownTypes
{
  return &off_1013AE880;
}

- (ClientTypeResolverCurrentLocationSource)initWithLocationManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ClientTypeResolverCurrentLocationSource;
  v6 = [(ClientTypeResolverCurrentLocationSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_locationManager, a3);
  }

  return v7;
}

- (BOOL)hasObjectWithType:(int)a3
{
  if (![(ClientTypeResolverSource *)self typeIsValid:*(void *)&a3]) {
    return 0;
  }
  v4 = [(ClientTypeResolverCurrentLocationSource *)self cachedObject];
  BOOL v5 = v4 != 0;

  return v5;
}

- (id)cachedObject
{
  v2 = [(ClientTypeResolverCurrentLocationSource *)self locationManager];
  v3 = [v2 lastLocation];

  [v3 coordinate];
  if (CLLocationCoordinate2DIsValid(v7)) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (MKLocationManager)locationManager
{
  return self->_locationManager;
}

- (void).cxx_destruct
{
}

- (void)objectWithCompletion:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    id v6 = [(ClientTypeResolverCurrentLocationSource *)self cachedObject];
    (*((void (**)(id, id))a3 + 2))(v5, v6);
  }
}

- (void)setLocationManager:(id)a3
{
}

@end