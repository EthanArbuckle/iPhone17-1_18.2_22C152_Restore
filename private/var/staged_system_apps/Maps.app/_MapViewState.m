@interface _MapViewState
- (BOOL)showsTraffic;
- (BOOL)showsUserLocation;
- (_MapViewState)initWithMapView:(id)a3;
- (void)restoreStateToMapView:(id)a3;
@end

@implementation _MapViewState

- (_MapViewState)initWithMapView:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_MapViewState;
  v5 = [(_MapViewState *)&v7 init];
  if (v5)
  {
    v5->_showsTraffic = [v4 showsTraffic];
    v5->_showsUserLocation = [v4 showsUserLocation];
  }

  return v5;
}

- (void)restoreStateToMapView:(id)a3
{
  BOOL showsTraffic = self->_showsTraffic;
  id v7 = a3;
  [v7 setShowsTraffic:showsTraffic];
  [v7 setShowsUserLocation:self->_showsUserLocation];
  v5 = [v7 _mapLayer];
  [v5 setStaysCenteredDuringPinch:0];

  v6 = [v7 _mapLayer];
  [v6 setStaysCenteredDuringRotation:0];

  [v7 setUserTrackingMode:0];
}

- (BOOL)showsTraffic
{
  return self->_showsTraffic;
}

- (BOOL)showsUserLocation
{
  return self->_showsUserLocation;
}

@end