@interface FMDLocationManagerProxy
- (CLLocationManagerDelegate)delegate;
- (FMDLocationManagerProxy)initWithLocationManager:(id)a3;
- (FMDLocationManaging)locationManager;
- (FMWeakWrapper)locationManagerWeakWrapper;
- (double)desiredAccuracy;
- (double)distanceFilter;
- (id)proxyDeallocationBlock;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setDesiredAccuracy:(double)a3;
- (void)setDistanceFilter:(double)a3;
- (void)setLocationManager:(id)a3;
- (void)setLocationManagerWeakWrapper:(id)a3;
- (void)setProxyDeallocationBlock:(id)a3;
- (void)startMonitoringSignificantLocationChanges;
- (void)startUpdatingLocation;
- (void)stopMonitoringSignificantLocationChanges;
- (void)stopUpdatingLocation;
@end

@implementation FMDLocationManagerProxy

- (FMDLocationManagerProxy)initWithLocationManager:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FMDLocationManagerProxy;
  v5 = [(FMDLocationManagerProxy *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(FMDLocationManagerProxy *)v5 setLocationManager:v4];
    id v7 = [objc_alloc((Class)FMWeakWrapper) initWithObject:v4];
    [(FMDLocationManagerProxy *)v6 setLocationManagerWeakWrapper:v7];
  }
  return v6;
}

- (void)dealloc
{
  v3 = [(FMDLocationManagerProxy *)self proxyDeallocationBlock];

  if (v3)
  {
    id v4 = [(FMDLocationManagerProxy *)self proxyDeallocationBlock];
    v5 = [(FMDLocationManagerProxy *)self locationManagerWeakWrapper];
    ((void (**)(void, void *))v4)[2](v4, v5);
  }
  v6.receiver = self;
  v6.super_class = (Class)FMDLocationManagerProxy;
  [(FMDLocationManagerProxy *)&v6 dealloc];
}

- (void)startUpdatingLocation
{
  id v2 = [(FMDLocationManagerProxy *)self locationManager];
  [v2 startUpdatingLocation];
}

- (void)stopUpdatingLocation
{
  id v2 = [(FMDLocationManagerProxy *)self locationManager];
  [v2 stopUpdatingLocation];
}

- (void)startMonitoringSignificantLocationChanges
{
  id v2 = [(FMDLocationManagerProxy *)self locationManager];
  [v2 startMonitoringSignificantLocationChanges];
}

- (void)stopMonitoringSignificantLocationChanges
{
  id v2 = [(FMDLocationManagerProxy *)self locationManager];
  [v2 stopMonitoringSignificantLocationChanges];
}

- (double)desiredAccuracy
{
  id v2 = [(FMDLocationManagerProxy *)self locationManager];
  [v2 desiredAccuracy];
  double v4 = v3;

  return v4;
}

- (double)distanceFilter
{
  id v2 = [(FMDLocationManagerProxy *)self locationManager];
  [v2 distanceFilter];
  double v4 = v3;

  return v4;
}

- (void)setDistanceFilter:(double)a3
{
  id v4 = [(FMDLocationManagerProxy *)self locationManager];
  [v4 setDistanceFilter:a3];
}

- (void)setDesiredAccuracy:(double)a3
{
  id v4 = [(FMDLocationManagerProxy *)self locationManager];
  [v4 setDesiredAccuracy:a3];
}

- (CLLocationManagerDelegate)delegate
{
  id v2 = [(FMDLocationManagerProxy *)self locationManager];
  double v3 = [v2 delegate];

  return (CLLocationManagerDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(FMDLocationManagerProxy *)self locationManager];
  [v5 setDelegate:v4];
}

- (id)proxyDeallocationBlock
{
  return self->_proxyDeallocationBlock;
}

- (void)setProxyDeallocationBlock:(id)a3
{
}

- (FMDLocationManaging)locationManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_locationManager);

  return (FMDLocationManaging *)WeakRetained;
}

- (void)setLocationManager:(id)a3
{
}

- (FMWeakWrapper)locationManagerWeakWrapper
{
  return self->_locationManagerWeakWrapper;
}

- (void)setLocationManagerWeakWrapper:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationManagerWeakWrapper, 0);
  objc_destroyWeak((id *)&self->_locationManager);

  objc_storeStrong(&self->_proxyDeallocationBlock, 0);
}

@end