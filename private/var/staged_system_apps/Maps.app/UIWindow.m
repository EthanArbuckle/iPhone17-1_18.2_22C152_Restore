@interface UIWindow
- (BOOL)_car_isHybridInstrumentCluster;
- (BOOL)_car_shouldHorizontallyCenterMapInsets;
- (id)_car_debugDescription;
- (int64_t)_car_hybridInstrumentClusterAlignment;
- (int64_t)_car_hybridInstrumentClusterAlignmentStyle;
- (int64_t)_car_hybridInstrumentClusterLayout;
- (void)_maps_registerEventTap:(id)a3;
@end

@implementation UIWindow

- (void)_maps_registerEventTap:(id)a3
{
  id v4 = a3;
  if ([(UIWindow *)self conformsToProtocol:&OBJC_PROTOCOL___EventSourceHandler]) {
    [(UIWindow *)self registerEventTap:v4];
  }
}

- (BOOL)_car_isHybridInstrumentCluster
{
  v2 = [(UIWindow *)self windowScene];
  v3 = [v2 delegate];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5) {
    BOOL v6 = [v5 sceneType] == (id)7;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (int64_t)_car_hybridInstrumentClusterAlignment
{
  if (_GEOConfigHasValue())
  {
    return GEOConfigGetInteger();
  }
  else
  {
    if (!GEOConfigGetBOOL()
      || ![(UIWindow *)self _car_hybridInstrumentClusterAlignmentStyle])
    {
      return 0;
    }
    id v4 = self;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    BOOL v6 = v5;

    if (v6
      && ([(UIWindow *)v6 currentSceneSettings],
          v7 = objc_claimAutoreleasedReturnValue(),
          id v8 = [v7 layoutJustification],
          v7,
          v8))
    {
      v9 = [(UIWindow *)v6 currentSceneSettings];
      id v10 = [v9 layoutJustification];
      if (v10 == (id)2) {
        int64_t v11 = 1;
      }
      else {
        int64_t v11 = 2 * (v10 == (id)3);
      }
    }
    else
    {
      v12 = [(UIWindow *)v4 screen];
      v9 = [v12 _car_screenInfo];

      v13 = +[MapsExternalDevice sharedInstance];
      id v14 = [v13 rightHandDrive];

      id v15 = [objc_alloc((Class)CPSInstrumentClusterCardLayout) initWithCarScreenInfo:v9 isRightHandDrive:v14];
      id v16 = [v15 layoutForCard];
      if (v16 == (id)3) {
        int64_t v11 = 2;
      }
      else {
        int64_t v11 = v16 == (id)2;
      }
    }
    return v11;
  }
}

- (int64_t)_car_hybridInstrumentClusterAlignmentStyle
{
  if (_GEOConfigHasValue())
  {
    return GEOConfigGetInteger();
  }
  else
  {
    id v4 = self;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    BOOL v6 = v5;

    if (v6
      && ([(UIWindow *)v6 currentSceneSettings],
          v7 = objc_claimAutoreleasedReturnValue(),
          id v8 = [v7 layoutJustification],
          v7,
          v8))
    {
      v9 = [(UIWindow *)v6 currentSceneSettings];
      BOOL v10 = [v9 layoutJustification] != (id)1;
    }
    else
    {
      int64_t v11 = [(UIWindow *)v4 safeAreaLayoutGuide];
      [v11 layoutFrame];
      double v13 = v12;

      id v14 = [(UIWindow *)v4 screen];
      [v14 scale];
      double v16 = v13 * v15;

      v9 = [(UIWindow *)v4 screen];
      [v9 _car_baselineScaledManeuverPixelWidth];
      double v18 = v17;
      GEOConfigGetDouble();
      BOOL v10 = v16 >= v18 * v19;
    }

    return v10;
  }
}

- (int64_t)_car_hybridInstrumentClusterLayout
{
  if (_GEOConfigHasValue())
  {
    return GEOConfigGetInteger();
  }
  else if ((id)[(UIWindow *)self _car_hybridInstrumentClusterAlignmentStyle] == (id)1|| !GEOConfigGetBOOL())
  {
    return 2;
  }
  else
  {
    id v4 = [(UIWindow *)self safeAreaLayoutGuide];
    [v4 layoutFrame];
    double v6 = v5;

    v7 = [(UIWindow *)self screen];
    [v7 scale];
    double v9 = v6 * v8;

    GEOConfigGetDouble();
    double v11 = v10;
    double v12 = [(UIWindow *)self screen];
    [v12 _car_baselineScaledManeuverPixelHeight];
    double v14 = v13;

    if (v14 <= v9 * v11)
    {
      double v15 = [(UIWindow *)self screen];
      [v15 _car_baselineScaledManeuverPixelHeight];
      double v17 = v9 - v16 / v11;
      double v18 = [(UIWindow *)self screen];
      [v18 _car_baselineScaledETATrayPixelHeight];
      double v20 = v19;

      if (v17 < v20) {
        return 1;
      }
      else {
        return 2;
      }
    }
    else
    {
      return 0;
    }
  }
}

- (BOOL)_car_shouldHorizontallyCenterMapInsets
{
  v3 = [(UIWindow *)self safeAreaLayoutGuide];
  [v3 layoutFrame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  double v9 = v8;
  CGFloat v11 = v10;

  v22.origin.x = v5;
  v22.origin.y = v7;
  v22.size.width = v9;
  v22.size.height = v11;
  double MidX = CGRectGetMidX(v22);
  [(UIWindow *)self frame];
  if (vabdd_f64(MidX, CGRectGetMidX(v23)) > 2.22044605e-16
    || ![(UIWindow *)self _car_hybridInstrumentClusterAlignment])
  {
    return 0;
  }
  double v13 = [(UIWindow *)self screen];
  [v13 scale];
  double v15 = v9 * v14;

  GEOConfigGetDouble();
  double v17 = v16;
  double v18 = [(UIWindow *)self screen];
  [v18 _car_baselineScaledManeuverPixelWidth];
  BOOL v20 = v15 >= v17 * v19;

  return v20;
}

- (id)_car_debugDescription
{
  v3 = +[NSMutableString string];
  [v3 appendFormat:@"%@:%p\n", objc_opt_class(), self];
  if ([(UIWindow *)self _car_isHybridInstrumentCluster]) {
    CFStringRef v4 = @"YES";
  }
  else {
    CFStringRef v4 = @"NO";
  }
  [v3 appendFormat:@"isHybridInstrumentCluster:%@\n", v4];
  if ([(UIWindow *)self _car_shouldHorizontallyCenterMapInsets]) {
    CFStringRef v5 = @"YES";
  }
  else {
    CFStringRef v5 = @"NO";
  }
  [v3 appendFormat:@"shouldHorizontallyCenterMapInsets:%@\n", v5];
  int64_t v6 = [(UIWindow *)self _car_hybridInstrumentClusterAlignment];
  CFStringRef v7 = @"Center";
  if (v6 == 1) {
    CFStringRef v7 = @"Left";
  }
  if (v6 == 2) {
    CFStringRef v7 = @"Right";
  }
  [v3 appendFormat:@"hybridInstrumentClusterAlignment:%@\n", v7];
  int64_t v8 = [(UIWindow *)self _car_hybridInstrumentClusterAlignmentStyle];
  CFStringRef v9 = @"Wide";
  if (!v8) {
    CFStringRef v9 = @"Narrow";
  }
  [v3 appendFormat:@"hybridInstrumentClusterAlignmentStyle:%@\n", v9];
  int64_t v10 = [(UIWindow *)self _car_hybridInstrumentClusterLayout];
  CFStringRef v11 = @"Maneuver";
  if (v10 == 1) {
    CFStringRef v11 = @"ManeuverMap";
  }
  if (v10 == 2) {
    CFStringRef v11 = @"ManeuverMapOther";
  }
  [v3 appendFormat:@"hybridInstrumentClusterLayout:%@\n", v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v12 = [(UIWindow *)self currentSceneSettings];
    [v3 appendFormat:@"currentSceneSettings:%@\n", v12];
  }

  return v3;
}

@end