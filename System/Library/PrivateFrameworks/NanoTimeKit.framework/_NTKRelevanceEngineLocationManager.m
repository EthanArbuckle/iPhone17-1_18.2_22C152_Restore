@interface _NTKRelevanceEngineLocationManager
- (_NTKRelevanceEngineLocationManager)initWithLocationManager:(id)a3;
- (id)currentLocation;
- (void)startLocationUpdatesWithHandler:(id)a3;
- (void)stopLocationUpdates;
@end

@implementation _NTKRelevanceEngineLocationManager

- (_NTKRelevanceEngineLocationManager)initWithLocationManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_NTKRelevanceEngineLocationManager;
  v6 = [(_NTKRelevanceEngineLocationManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_locationManager, a3);
  }

  return v7;
}

- (id)currentLocation
{
  return [(NTKLocationManager *)self->_locationManager currentLocation];
}

- (void)startLocationUpdatesWithHandler:(id)a3
{
  id v4 = a3;
  if (self->_token) {
    [(_NTKRelevanceEngineLocationManager *)self stopLocationUpdates];
  }
  locationManager = self->_locationManager;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70___NTKRelevanceEngineLocationManager_startLocationUpdatesWithHandler___block_invoke;
  v9[3] = &unk_1E62C0018;
  id v10 = v4;
  id v6 = v4;
  v7 = [(NTKLocationManager *)locationManager startLocationUpdatesWithIdentifier:@"NTKRelevanceEngineLocationManagerIdentifier" handler:v9];
  token = self->_token;
  self->_token = v7;
}

- (void)stopLocationUpdates
{
  if (self->_token)
  {
    -[NTKLocationManager stopLocationUpdatesForToken:](self->_locationManager, "stopLocationUpdatesForToken:");
    token = self->_token;
    self->_token = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);

  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end