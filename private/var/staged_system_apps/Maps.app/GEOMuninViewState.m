@interface GEOMuninViewState
- (GEOMuninViewState)initWithGEOPDMuninViewState:(id)a3;
- (id)toGEOPDMuninViewState;
@end

@implementation GEOMuninViewState

- (GEOMuninViewState)initWithGEOPDMuninViewState:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)objc_opt_class());

  if (v5)
  {
    id v6 = objc_alloc_init((Class)GEOCameraFrame);
    v7 = [v4 cameraFrame];
    [v7 altitude];
    [v6 setAltitude:];

    v8 = [v4 cameraFrame];
    [v8 latitude];
    [v6 setLatitude:];

    v9 = [v4 cameraFrame];
    [v9 longitude];
    [v6 setLongitude:];

    v10 = [v4 cameraFrame];
    [v10 pitch];
    [v6 setPitch:];

    v11 = [v4 cameraFrame];
    [v11 roll];
    [v6 setRoll:];

    v12 = [v4 cameraFrame];
    [v12 yaw];
    [v6 setYaw:];

    [v5 setCameraFrame:v6];
    id v13 = objc_alloc_init((Class)GEOLocationInfo);
    v14 = [v4 locationInfo];
    v15 = [v14 localityName];
    [v13 setLocalityName:v15];

    v16 = [v4 locationInfo];
    v17 = [v16 locationName];
    [v13 setLocationName:v17];

    v18 = [v4 locationInfo];
    v19 = [v18 secondaryLocationName];
    [v13 setSecondaryLocationName:v19];

    [v5 setLocationInfo:v13];
  }

  return (GEOMuninViewState *)v5;
}

- (id)toGEOPDMuninViewState
{
  id v3 = objc_alloc_init((Class)GEOPDMuninViewState);
  id v4 = objc_alloc_init((Class)GEOPDCameraFrame);
  id v5 = [(GEOMuninViewState *)self cameraFrame];
  [v5 altitude];
  [v4 setAltitude:];

  id v6 = [(GEOMuninViewState *)self cameraFrame];
  [v6 latitude];
  [v4 setLatitude:];

  v7 = [(GEOMuninViewState *)self cameraFrame];
  [v7 longitude];
  [v4 setLongitude:];

  v8 = [(GEOMuninViewState *)self cameraFrame];
  [v8 pitch];
  [v4 setPitch:];

  v9 = [(GEOMuninViewState *)self cameraFrame];
  [v9 roll];
  [v4 setRoll:];

  v10 = [(GEOMuninViewState *)self cameraFrame];
  [v10 yaw];
  [v4 setYaw:];

  [v3 setCameraFrame:v4];
  id v11 = objc_alloc_init((Class)GEOPDLocationInfo);
  v12 = [(GEOMuninViewState *)self locationInfo];
  id v13 = [v12 localityName];
  [v11 setLocalityName:v13];

  v14 = [(GEOMuninViewState *)self locationInfo];
  v15 = [v14 locationName];
  [v11 setLocationName:v15];

  v16 = [(GEOMuninViewState *)self locationInfo];
  v17 = [v16 secondaryLocationName];
  [v11 setSecondaryLocationName:v17];

  [v3 setLocationInfo:v11];

  return v3;
}

@end