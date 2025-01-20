@interface UIScreen
- (BOOL)_car_hasDebugPhysicalSizeOverride;
- (BOOL)_car_hasScreenInfo;
- (CARScreenInfo)_car_screenInfo;
- (CGSize)_car_physicalSize;
- (CGSize)_car_pixelSize;
- (double)_car_baselineETATrayPixelHeight;
- (double)_car_baselineETATrayPointHeight;
- (double)_car_baselineManeuverPixelHeight;
- (double)_car_baselineManeuverPixelWidth;
- (double)_car_baselineManeuverPointHeight;
- (double)_car_baselineManeuverPointWidth;
- (double)_car_baselinePixelSize;
- (double)_car_baselineScaledETATrayPixelHeight;
- (double)_car_baselineScaledManeuverPixelHeight;
- (double)_car_baselineScaledManeuverPixelWidth;
- (double)_car_dynamicPixelScaleValue;
- (double)_car_dynamicPointScaleValue;
- (double)_car_physicalPixelSize;
- (double)_car_physicalPointSize;
- (id)_car_debugDescription;
@end

@implementation UIScreen

- (double)_car_physicalPixelSize
{
  v4 = objc_getAssociatedObject(self, a2);
  v5 = v4;
  if (v4)
  {
    [v4 cgFloatValue];
    double v7 = v6;
  }
  else
  {
    double v7 = 0.0;
    if ([(UIScreen *)self _car_hasScreenInfo])
    {
      [(UIScreen *)self _car_physicalSize];
      double v9 = v8;
      [(UIScreen *)self _car_pixelSize];
      double v7 = v9 / v10;
      v11 = +[NSNumber numberWithDouble:v7];
      objc_setAssociatedObject(self, a2, v11, (void *)1);
    }
  }

  return v7;
}

- (double)_car_physicalPointSize
{
  [(UIScreen *)self nativeScale];
  double v4 = v3;
  [(UIScreen *)self _car_physicalPixelSize];
  return v4 * v5;
}

- (double)_car_dynamicPixelScaleValue
{
  double v4 = objc_getAssociatedObject(self, a2);
  double v5 = v4;
  if (v4)
  {
    [v4 cgFloatValue];
    double v7 = v6;
  }
  else
  {
    double v7 = 1.0;
    if ([(UIScreen *)self _car_hasScreenInfo] && GEOConfigGetBOOL())
    {
      if (_GEOConfigHasValue())
      {
        GEOConfigGetDouble();
        double v7 = v8;
      }
      else
      {
        [(UIScreen *)self _car_physicalPixelSize];
        double v10 = v9;
        if (fabs(v9) <= 2.22044605e-16) {
          goto LABEL_10;
        }
        [(UIScreen *)self _car_baselinePixelSize];
        double v7 = v11 / v10;
      }
      v12 = +[NSNumber numberWithDouble:v7];
      objc_setAssociatedObject(self, a2, v12, (void *)1);
    }
  }
LABEL_10:

  return v7;
}

- (double)_car_dynamicPointScaleValue
{
  double v4 = objc_getAssociatedObject(self, a2);
  double v5 = v4;
  if (v4)
  {
    [v4 cgFloatValue];
    double v7 = v6;
  }
  else
  {
    double v7 = 1.0;
    if ([(UIScreen *)self _car_hasScreenInfo] && GEOConfigGetBOOL())
    {
      if (_GEOConfigHasValue())
      {
        GEOConfigGetDouble();
        double v7 = v8;
      }
      else
      {
        [(UIScreen *)self _car_physicalPixelSize];
        double v10 = v9;
        if (fabs(v9) <= 2.22044605e-16) {
          goto LABEL_10;
        }
        [(UIScreen *)self _car_baselinePixelSize];
        double v12 = v11;
        [(UIScreen *)self _car_baselineManeuverPixelHeight];
        double v14 = v12 * v13;
        [(UIScreen *)self _car_baselineManeuverPointHeight];
        double v16 = v15;
        [(UIScreen *)self nativeScale];
        double v7 = v14 / (v10 * (v16 * v17));
      }
      v18 = +[NSNumber numberWithDouble:v7];
      objc_setAssociatedObject(self, a2, v18, (void *)1);
    }
  }
LABEL_10:

  return v7;
}

- (CARScreenInfo)_car_screenInfo
{
  double v3 = +[CarDisplayController sharedInstance];
  double v4 = [v3 connectedCarScreenInfos];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100747288;
  v14[3] = &unk_1012F7420;
  v14[4] = self;
  double v5 = sub_1000990A8(v4, v14);

  if (v5
    && [(UIScreen *)self _isCarInstrumentsScreen]
    && [(UIScreen *)self _car_hasDebugPhysicalSizeOverride])
  {
    [v5 physicalSize];
    double v7 = v6;
    double v9 = v8;
    if (_GEOConfigHasValue())
    {
      GEOConfigGetDouble();
      double v7 = v10;
    }
    if (_GEOConfigHasValue())
    {
      GEOConfigGetDouble();
      double v9 = v11;
    }
    double v12 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v7, v9);
    [v5 setValue:v12 forKey:@"_physicalSize"];
  }

  return (CARScreenInfo *)v5;
}

- (CGSize)_car_pixelSize
{
  v2 = [(UIScreen *)self _car_screenInfo];
  [v2 pixelSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)_car_physicalSize
{
  v2 = [(UIScreen *)self _car_screenInfo];
  [v2 physicalSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)_car_hasScreenInfo
{
  v2 = [(UIScreen *)self _car_screenInfo];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)_car_hasDebugPhysicalSizeOverride
{
  if (_GEOConfigHasValue()) {
    return 1;
  }

  return _GEOConfigHasValue();
}

- (double)_car_baselinePixelSize
{
  GEOConfigGetDouble();
  double v3 = v2;
  GEOConfigGetDouble();
  return v3 / v4;
}

- (double)_car_baselineManeuverPixelWidth
{
  GEOConfigGetDouble();
  return result;
}

- (double)_car_baselineManeuverPixelHeight
{
  GEOConfigGetDouble();
  return result;
}

- (double)_car_baselineETATrayPixelHeight
{
  GEOConfigGetDouble();
  return result;
}

- (double)_car_baselineManeuverPointWidth
{
  GEOConfigGetDouble();
  double v3 = v2;
  GEOConfigGetDouble();
  return v3 / v4;
}

- (double)_car_baselineManeuverPointHeight
{
  GEOConfigGetDouble();
  double v3 = v2;
  GEOConfigGetDouble();
  return v3 / v4;
}

- (double)_car_baselineETATrayPointHeight
{
  GEOConfigGetDouble();
  double v3 = v2;
  GEOConfigGetDouble();
  return v3 / v4;
}

- (double)_car_baselineScaledManeuverPixelWidth
{
  [(UIScreen *)self _car_baselineManeuverPixelWidth];
  double v4 = v3;
  [(UIScreen *)self _car_dynamicPixelScaleValue];
  return v4 * v5;
}

- (double)_car_baselineScaledManeuverPixelHeight
{
  [(UIScreen *)self _car_baselineManeuverPixelHeight];
  double v4 = v3;
  [(UIScreen *)self _car_dynamicPixelScaleValue];
  return v4 * v5;
}

- (double)_car_baselineScaledETATrayPixelHeight
{
  [(UIScreen *)self _car_baselineETATrayPixelHeight];
  double v4 = v3;
  [(UIScreen *)self _car_dynamicPixelScaleValue];
  return v4 * v5;
}

- (id)_car_debugDescription
{
  double v3 = +[NSMutableString string];
  [v3 appendFormat:@"%@:%p\n", objc_opt_class(), self];
  [(UIScreen *)self _car_physicalPixelSize];
  [v3 appendFormat:@"physicalPixelSize:%f\n", v4];
  [(UIScreen *)self _car_physicalPointSize];
  [v3 appendFormat:@"physicalPointSize:%f\n" v5];
  [(UIScreen *)self _car_dynamicPixelScaleValue];
  [v3 appendFormat:@"dynamicPixelScaleValue:%f\n", v6];
  [(UIScreen *)self _car_dynamicPointScaleValue];
  [v3 appendFormat:@"dynamicPointScaleValue:%f\n" v7];
  double v8 = [(UIScreen *)self _car_screenInfo];
  [v3 appendFormat:@"screenInfo:%@\n", v8];

  [(UIScreen *)self _car_physicalSize];
  double v9 = NSStringFromCGSize(v23);
  [v3 appendFormat:@"physicalSize:%@\n", v9];

  [(UIScreen *)self _car_pixelSize];
  double v10 = NSStringFromCGSize(v24);
  [v3 appendFormat:@"pixelSize:%@\n", v10];

  [(UIScreen *)self _car_baselinePixelSize];
  [v3 appendFormat:@"baselinePixelSize:%f\n", v11];
  [(UIScreen *)self _car_baselineManeuverPixelWidth];
  [v3 appendFormat:@"baselineManeuverPixelWidth:%f\n", v12];
  [(UIScreen *)self _car_baselineManeuverPixelHeight];
  [v3 appendFormat:@"baselineManeuverPixelHeight:%f\n", v13];
  [(UIScreen *)self _car_baselineETATrayPixelHeight];
  [v3 appendFormat:@"baselineETATrayPixelHeight:%f\n", v14];
  [(UIScreen *)self _car_baselineManeuverPointWidth];
  [v3 appendFormat:@"baselineManeuverPointWidth:%f\n", v15];
  [(UIScreen *)self _car_baselineManeuverPointHeight];
  [v3 appendFormat:@"baselineManeuverPointHeight:%f\n", v16];
  [(UIScreen *)self _car_baselineETATrayPointHeight];
  [v3 appendFormat:@"baselineETATrayPointHeight:%f\n", v17];
  [(UIScreen *)self _car_baselineScaledManeuverPixelWidth];
  [v3 appendFormat:@"baselineScaledManeuverPixelWidth:%f\n", v18];
  [(UIScreen *)self _car_baselineScaledManeuverPixelHeight];
  [v3 appendFormat:@"baselineScaledManeuverPixelHeight:%f\n", v19];
  [(UIScreen *)self _car_baselineScaledETATrayPixelHeight];
  [v3 appendFormat:@"baselineScaledETATrayPixelHeight:%f\n", v20];

  return v3;
}

@end