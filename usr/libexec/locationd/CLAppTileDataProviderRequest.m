@interface CLAppTileDataProviderRequest
- (BOOL)includeRegionalApps;
- (BOOL)marqueeAppsOnly;
- (double)lat;
- (double)lon;
- (double)timestamp;
- (float)radiusMeters;
- (id)handler;
- (void)dealloc;
- (void)setHandler:(id)a3;
- (void)setIncludeRegionalApps:(BOOL)a3;
- (void)setLat:(double)a3;
- (void)setLon:(double)a3;
- (void)setMarqueeAppsOnly:(BOOL)a3;
- (void)setRadiusMeters:(float)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation CLAppTileDataProviderRequest

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLAppTileDataProviderRequest;
  [(CLAppTileDataProviderRequest *)&v3 dealloc];
}

- (double)lat
{
  return self->_lat;
}

- (void)setLat:(double)a3
{
  self->_lat = a3;
}

- (double)lon
{
  return self->_lon;
}

- (void)setLon:(double)a3
{
  self->_lon = a3;
}

- (float)radiusMeters
{
  return self->_radiusMeters;
}

- (void)setRadiusMeters:(float)a3
{
  self->_radiusMeters = a3;
}

- (BOOL)includeRegionalApps
{
  return self->_includeRegionalApps;
}

- (void)setIncludeRegionalApps:(BOOL)a3
{
  self->_includeRegionalApps = a3;
}

- (BOOL)marqueeAppsOnly
{
  return self->_marqueeAppsOnly;
}

- (void)setMarqueeAppsOnly:(BOOL)a3
{
  self->_marqueeAppsOnly = a3;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

@end