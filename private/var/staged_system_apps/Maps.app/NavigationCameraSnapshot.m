@interface NavigationCameraSnapshot
+ (BOOL)supportsSecureCoding;
- (MKMapCamera)camera;
- (MNLocation)puckLocation;
- (NavigationCameraSnapshot)init;
- (NavigationCameraSnapshot)initWithCamera:(id)a3 tracePlaybackTimeFraction:(double)a4 puckLocation:(id)a5;
- (NavigationCameraSnapshot)initWithCoder:(id)a3;
- (double)puckToCenterX;
- (double)puckToCenterY;
- (double)tracePlaybackTimeFraction;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NavigationCameraSnapshot

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NavigationCameraSnapshot)initWithCamera:(id)a3 tracePlaybackTimeFraction:(double)a4 puckLocation:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)NavigationCameraSnapshot;
  v10 = [(NavigationCameraSnapshot *)&v15 init];
  if (v10)
  {
    v11 = (MKMapCamera *)[v8 copy];
    camera = v10->_camera;
    v10->_camera = v11;

    v10->_tracePlaybackTimeFraction = a4;
    objc_storeStrong((id *)&v10->_puckLocation, a5);
    v13 = v10;
  }

  return v10;
}

- (NavigationCameraSnapshot)init
{
  v3 = +[MKMapCamera camera];
  v4 = [(NavigationCameraSnapshot *)self initWithCamera:v3 tracePlaybackTimeFraction:0 puckLocation:0.0];

  return v4;
}

- (NavigationCameraSnapshot)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NavigationCameraSnapshotCamera"];
  [v4 decodeDoubleForKey:@"NavigationCameraSnapshotTracePlaybackTimeFraction"];
  double v7 = v6;
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NavigationCameraSnapshotLocation"];

  id v9 = [(NavigationCameraSnapshot *)self initWithCamera:v5 tracePlaybackTimeFraction:v8 puckLocation:v7];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(NavigationCameraSnapshot *)self camera];
  [v4 encodeObject:v5 forKey:@"NavigationCameraSnapshotCamera"];

  [(NavigationCameraSnapshot *)self tracePlaybackTimeFraction];
  [v4 encodeDouble:@"NavigationCameraSnapshotTracePlaybackTimeFraction" forKey:@"NavigationCameraSnapshotTracePlaybackTimeFraction"];
  id v6 = [(NavigationCameraSnapshot *)self puckLocation];
  [v4 encodeObject:v6 forKey:@"NavigationCameraSnapshotLocation"];
}

- (double)puckToCenterX
{
  v3 = [(NavigationCameraSnapshot *)self puckLocation];
  [v3 coordinate];
  CLLocationDegrees v5 = v4;
  CLLocationDegrees v7 = v6;

  id v8 = [(NavigationCameraSnapshot *)self camera];
  [v8 centerCoordinate];
  CLLocationDegrees v10 = v9;
  CLLocationDegrees v12 = v11;

  v18.latitude = v5;
  v18.longitude = v7;
  double v13 = 0.0;
  if (CLLocationCoordinate2DIsValid(v18))
  {
    v19.latitude = v10;
    v19.longitude = v12;
    if (CLLocationCoordinate2DIsValid(v19))
    {
      v20.latitude = v5;
      v20.longitude = v7;
      MKMapPoint v14 = MKMapPointForCoordinate(v20);
      v21.latitude = v10;
      v21.longitude = v12;
      double x = MKMapPointForCoordinate(v21).x;
      v22.double x = x;
      v22.y = v14.y;
      double v16 = MKMetersBetweenMapPoints(v14, v22);
      if (x <= v14.x) {
        return -v16;
      }
      else {
        return v16;
      }
    }
  }
  return v13;
}

- (double)puckToCenterY
{
  v3 = [(NavigationCameraSnapshot *)self puckLocation];
  [v3 coordinate];
  CLLocationDegrees v5 = v4;
  CLLocationDegrees v7 = v6;

  id v8 = [(NavigationCameraSnapshot *)self camera];
  [v8 centerCoordinate];
  CLLocationDegrees v10 = v9;
  CLLocationDegrees v12 = v11;

  v18.latitude = v5;
  v18.longitude = v7;
  double v13 = 0.0;
  if (CLLocationCoordinate2DIsValid(v18))
  {
    v19.latitude = v10;
    v19.longitude = v12;
    if (CLLocationCoordinate2DIsValid(v19))
    {
      v20.latitude = v5;
      v20.longitude = v7;
      MKMapPoint v14 = MKMapPointForCoordinate(v20);
      v21.latitude = v10;
      v21.longitude = v12;
      double y = MKMapPointForCoordinate(v21).y;
      v22.double x = v14.x;
      v22.double y = y;
      double v16 = MKMetersBetweenMapPoints(v14, v22);
      if (y <= v14.y) {
        return -v16;
      }
      else {
        return v16;
      }
    }
  }
  return v13;
}

- (MNLocation)puckLocation
{
  return self->_puckLocation;
}

- (MKMapCamera)camera
{
  return self->_camera;
}

- (double)tracePlaybackTimeFraction
{
  return self->_tracePlaybackTimeFraction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_camera, 0);

  objc_storeStrong((id *)&self->_puckLocation, 0);
}

@end