@interface VKMapView
- ($1AB5FA073B851C12C2339EC22442E995)_mapstest_jumpToBayArea;
- ($1AB5FA073B851C12C2339EC22442E995)_mapstest_jumpToCupertino;
- ($1AB5FA073B851C12C2339EC22442E995)_mapstest_jumpToTokyo;
- (void)_mapstest_jumpToCoords:(id)a3 pitch:(double)a4 yaw:(double)a5 altitudeIsRegionSize:(BOOL)a6;
@end

@implementation VKMapView

- (void)_mapstest_jumpToCoords:(id)a3 pitch:(double)a4 yaw:(double)a5 altitudeIsRegionSize:(BOOL)a6
{
  if (a6)
  {
    +[GEOMapRegion _mapstest_mapRegionAtCenterLocation:](GEOMapRegion, "_mapstest_mapRegionAtCenterLocation:", a3.var0, a3.var1, a3.var2);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    [(VKMapView *)self setMapRegion:v9 pitch:a4 yaw:a5];
  }
  else
  {
    VKLocationCoordinate2DMake();
    -[VKMapView setCenterCoordinate:altitude:yaw:pitch:duration:timingCurve:completion:](self, "setCenterCoordinate:altitude:yaw:pitch:duration:timingCurve:completion:", 0, 0);
  }
}

- ($1AB5FA073B851C12C2339EC22442E995)_mapstest_jumpToCupertino
{
  VKLocationCoordinate3DMake();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  -[VKMapView _mapstest_jumpToCoords:pitch:yaw:altitudeIsRegionSize:](self, "_mapstest_jumpToCoords:pitch:yaw:altitudeIsRegionSize:", 1);
  double v9 = v4;
  double v10 = v6;
  double v11 = v8;
  result.var2 = v11;
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)_mapstest_jumpToBayArea
{
  VKLocationCoordinate3DMake();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  -[VKMapView _mapstest_jumpToCoords:pitch:yaw:altitudeIsRegionSize:](self, "_mapstest_jumpToCoords:pitch:yaw:altitudeIsRegionSize:", 1);
  double v9 = v4;
  double v10 = v6;
  double v11 = v8;
  result.var2 = v11;
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)_mapstest_jumpToTokyo
{
  VKLocationCoordinate3DMake();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  -[VKMapView _mapstest_jumpToCoords:pitch:yaw:altitudeIsRegionSize:](self, "_mapstest_jumpToCoords:pitch:yaw:altitudeIsRegionSize:", 1);
  double v9 = v4;
  double v10 = v6;
  double v11 = v8;
  result.var2 = v11;
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

@end