@interface WeatherMapPanningCoordinator
- ($F24F406B2B787EFB06265DBA3D28CBD5)lastCenterCoordinate;
- (WeatherLocationDataProvider)weatherLocationDataProvider;
- (WeatherMapPanningCoordinator)initWithWeatherLocationDataProvider:(id)a3;
- (double)lastZoomLevel;
- (double)minZoomLevelThreshold;
- (void)_updateWeatherConditions;
- (void)handleMapViewRegionDidChange:(id)a3;
- (void)handleMapViewRegionDidChange:(id)a3 forceUpdate:(BOOL)a4;
- (void)setLastCenterCoordinate:(id)a3;
- (void)setLastZoomLevel:(double)a3;
- (void)setMinZoomLevelThreshold:(double)a3;
- (void)setWeatherLocationDataProvider:(id)a3;
@end

@implementation WeatherMapPanningCoordinator

- (WeatherMapPanningCoordinator)initWithWeatherLocationDataProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WeatherMapPanningCoordinator;
  v6 = [(WeatherMapPanningCoordinator *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_weatherLocationDataProvider, a3);
    v7->_lastCenterCoordinate = ($AB5116BA7E623E054F959CECB034F4E7)xmmword_100F729B8;
  }

  return v7;
}

- (void)handleMapViewRegionDidChange:(id)a3 forceUpdate:(BOOL)a4
{
  id v18 = a3;
  [(WeatherMapPanningCoordinator *)self minZoomLevelThreshold];
  if (v6 == 0.0
    || ([(WeatherMapPanningCoordinator *)self lastCenterCoordinate],
        CLLocationCoordinate2DFromGEOLocationCoordinate2D(),
        !CLLocationCoordinate2DIsValid(v20)))
  {
    [v18 centerCoordinate];
    GEOLocationCoordinate2DFromCLLocationCoordinate2D();
    -[WeatherMapPanningCoordinator setLastCenterCoordinate:](self, "setLastCenterCoordinate:");
    [v18 _zoomLevel];
    -[WeatherMapPanningCoordinator setLastZoomLevel:](self, "setLastZoomLevel:");
    [v18 _minimumZoomLevel];
    double v8 = v7;
    [v18 _maximumZoomLevel];
    [(WeatherMapPanningCoordinator *)self setMinZoomLevelThreshold:v8 + (v9 - v8) / 2.25];
    a4 = 1;
  }
  [v18 centerCoordinate];
  GEOLocationCoordinate2DFromCLLocationCoordinate2D();
  double v11 = v10;
  double v13 = v12;
  [v18 _zoomLevel];
  double v15 = v14;
  if (a4
    || ([(WeatherMapPanningCoordinator *)self lastZoomLevel], vabdd_f64(v15, v16) > 0.00000011920929)
    || ([(WeatherMapPanningCoordinator *)self lastCenterCoordinate],
        GEOCalculateDistance(),
        v17 >= 5000.0))
  {
    -[WeatherMapPanningCoordinator setLastCenterCoordinate:](self, "setLastCenterCoordinate:", v11, v13);
    [(WeatherMapPanningCoordinator *)self setLastZoomLevel:v15];
    [(WeatherMapPanningCoordinator *)self _updateWeatherConditions];
  }
}

- (void)setLastZoomLevel:(double)a3
{
  self->_lastZoomLevel = a3;
}

- (void)setLastCenterCoordinate:(id)a3
{
  self->_lastCenterCoordinate = ($AB5116BA7E623E054F959CECB034F4E7)a3;
}

- (WeatherLocationDataProvider)weatherLocationDataProvider
{
  return self->_weatherLocationDataProvider;
}

- (void)setMinZoomLevelThreshold:(double)a3
{
  self->_minZoomLevelThreshold = a3;
}

- (double)minZoomLevelThreshold
{
  return self->_minZoomLevelThreshold;
}

- (double)lastZoomLevel
{
  return self->_lastZoomLevel;
}

- (void)handleMapViewRegionDidChange:(id)a3
{
}

- (void)_updateWeatherConditions
{
  [(WeatherMapPanningCoordinator *)self lastZoomLevel];
  double v4 = v3;
  [(WeatherMapPanningCoordinator *)self minZoomLevelThreshold];
  if (v4 <= v5)
  {
    double latitude = kCLLocationCoordinate2DInvalid.latitude;
    double longitude = kCLLocationCoordinate2DInvalid.longitude;
  }
  else
  {
    [(WeatherMapPanningCoordinator *)self lastCenterCoordinate];
    CLLocationCoordinate2DFromGEOLocationCoordinate2D();
    double latitude = v6;
    double longitude = v8;
  }
  id v10 = [(WeatherMapPanningCoordinator *)self weatherLocationDataProvider];
  [v10 setCoordinate:latitude longitude:longitude];
}

- (void)setWeatherLocationDataProvider:(id)a3
{
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)lastCenterCoordinate
{
  double latitude = self->_lastCenterCoordinate.latitude;
  double longitude = self->_lastCenterCoordinate.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void).cxx_destruct
{
}

@end