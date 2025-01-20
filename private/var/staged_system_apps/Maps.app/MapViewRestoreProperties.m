@interface MapViewRestoreProperties
- (BOOL)isPitchEnabled;
- (BOOL)isRotateEnabled;
- (BOOL)isScrollEnabled;
- (BOOL)isZoomEnabled;
- (BOOL)showsCompass;
- (BOOL)showsScale;
- (MKMapCamera)camera;
- (MKMapCameraZoomRange)cameraZoomRange;
- (MKMapConfiguration)preferredConfiguration;
- (id)initFromMapView:(id)a3;
- (int)applicationState;
- (int64_t)offlineRegionVisibility;
- (int64_t)userTrackingMode;
- (void)applyToMapView:(id)a3 animated:(BOOL)a4;
@end

@implementation MapViewRestoreProperties

- (id)initFromMapView:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MapViewRestoreProperties;
  v5 = [(MapViewRestoreProperties *)&v16 init];
  if (v5)
  {
    v6 = [v4 preferredConfiguration];
    v7 = (MKMapConfiguration *)[v6 copy];
    preferredConfiguration = v5->_preferredConfiguration;
    v5->_preferredConfiguration = v7;

    v9 = [v4 camera];
    v10 = (MKMapCamera *)[v9 copy];
    camera = v5->_camera;
    v5->_camera = v10;

    v12 = [v4 cameraZoomRange];
    v13 = (MKMapCameraZoomRange *)[v12 copy];
    cameraZoomRange = v5->_cameraZoomRange;
    v5->_cameraZoomRange = v13;

    v5->_zoomEnabled = [v4 isZoomEnabled];
    v5->_scrollEnabled = [v4 isScrollEnabled];
    v5->_rotateEnabled = [v4 isRotateEnabled];
    v5->_pitchEnabled = [v4 isPitchEnabled];
    v5->_showsCompass = [v4 showsCompass];
    v5->_showsScale = [v4 showsScale];
    v5->_userTrackingMode = (int64_t)[v4 userTrackingMode];
    v5->_offlineRegionVisibility = (int64_t)[v4 _offlineRegionVisibility];
    v5->_applicationState = [v4 _applicationState];
  }

  return v5;
}

- (void)applyToMapView:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  v6 = [(MapViewRestoreProperties *)self preferredConfiguration];
  [v9 setPreferredConfiguration:v6];

  v7 = [(MapViewRestoreProperties *)self cameraZoomRange];
  [v9 setCameraZoomRange:v7 animated:v4];

  [v9 setZoomEnabled:[self isZoomEnabled]];
  [v9 setScrollEnabled:[self isScrollEnabled]];
  [v9 setRotateEnabled:[self isRotateEnabled]];
  [v9 setPitchEnabled:[self isPitchEnabled]];
  [v9 setShowsCompass:[self showsCompass]];
  [v9 setShowsScale:[self showsScale]];
  v8 = [(MapViewRestoreProperties *)self camera];
  [v9 setCamera:v8 animated:v4];

  [v9 setUserTrackingMode:[self userTrackingMode] animated:v4];
  [v9 _setOfflineRegionVisibility:[self offlineRegionVisibility]];
  [v9 _setApplicationState:self->_applicationState];
}

- (MKMapConfiguration)preferredConfiguration
{
  return self->_preferredConfiguration;
}

- (MKMapCamera)camera
{
  return self->_camera;
}

- (MKMapCameraZoomRange)cameraZoomRange
{
  return self->_cameraZoomRange;
}

- (BOOL)isZoomEnabled
{
  return self->_zoomEnabled;
}

- (BOOL)isScrollEnabled
{
  return self->_scrollEnabled;
}

- (BOOL)isRotateEnabled
{
  return self->_rotateEnabled;
}

- (BOOL)isPitchEnabled
{
  return self->_pitchEnabled;
}

- (BOOL)showsCompass
{
  return self->_showsCompass;
}

- (BOOL)showsScale
{
  return self->_showsScale;
}

- (int64_t)userTrackingMode
{
  return self->_userTrackingMode;
}

- (int64_t)offlineRegionVisibility
{
  return self->_offlineRegionVisibility;
}

- (int)applicationState
{
  return self->_applicationState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraZoomRange, 0);
  objc_storeStrong((id *)&self->_camera, 0);

  objc_storeStrong((id *)&self->_preferredConfiguration, 0);
}

@end