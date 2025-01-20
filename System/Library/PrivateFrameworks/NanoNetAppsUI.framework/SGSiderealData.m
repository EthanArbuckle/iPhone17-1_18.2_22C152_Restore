@interface SGSiderealData
+ ($F24F406B2B787EFB06265DBA3D28CBD5)_geoLocationForLocation:(id)a3;
+ (double)_absoluteTimeToJulianDay:(double)a3;
- (BOOL)sunsetFilterEnabled;
- (BOOL)sunsetFollowsSunrise;
- (BOOL)useXR;
- (CLLocation)location;
- (SGSiderealData)initWithStartOfDay:(double)a3 location:(id)a4 useXR:(BOOL)a5;
- (double)pseudoAltitudeForProgress:(double)a3;
- (double)solarNoonTime;
- (double)startOfDay;
- (double)sunriseTime;
- (double)sunsetFilter:(double)a3;
- (double)sunsetFilterRampDownStartProgress;
- (double)sunsetFilterRampUpStartProgress;
- (double)sunsetTime;
- (double)timeToProgress:(double)a3;
- (id)_applySunsetFilter:(double)a3 toColor:;
- (id)gradientWithSunsetFilterForDayProgress:(double)a3;
@end

@implementation SGSiderealData

+ ($F24F406B2B787EFB06265DBA3D28CBD5)_geoLocationForLocation:(id)a3
{
  id v3 = a3;
  [v3 coordinate];
  double v5 = v4;
  [v3 coordinate];
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

+ (double)_absoluteTimeToJulianDay:(double)a3
{
  return a3 / 86400.0 + 2440587.5;
}

- (SGSiderealData)initWithStartOfDay:(double)a3 location:(id)a4 useXR:(BOOL)a5
{
  id v9 = a4;
  v32.receiver = self;
  v32.super_class = (Class)SGSiderealData;
  v10 = [(SGSiderealData *)&v32 init];
  if (v10)
  {
    +[SGSiderealData _geoLocationForLocation:v9];
    double v12 = v11;
    double v14 = v13;
    id v15 = objc_alloc(MEMORY[0x263F41C10]);
    v16 = objc_msgSend(v15, "initWithLocation:time:altitudeInDegrees:accuracy:", v12, v14, a3, *MEMORY[0x263F41638], 60.0);
    [v16 nextEventOfType:8];
    double v18 = v17;
    [v16 nextEventOfType:32];
    double v20 = v19;
    [v16 nextEventOfType:16];
    double v22 = v21;
    v10->_useXR = a5;
    objc_storeStrong((id *)&v10->_location, a4);
    v10->_startOfDay = a3;
    v10->_solarNoonTime = v22;
    v10->_sunriseTime = v18;
    v10->_sunsetTime = v20;
    double v23 = v20 - v18;
    v10->_sunsetFollowsSunrise = v23 > 0.0;
    BOOL v24 = [(SGSiderealData *)v10 sunsetFollowsSunrise];
    double v25 = 0.0;
    if (v24 && v23 >= 14400.0)
    {
      double v26 = a3 + 86400.0 - v20;
      if (v23 < 28800.0)
      {
        if (v26 >= 7200.0) {
          double v27 = v20;
        }
        else {
          double v27 = a3 + 79200.0;
        }
        char v28 = 1;
        double v25 = v22;
        goto LABEL_15;
      }
      if (v23 < 72000.0)
      {
        double v25 = v20 + -14400.0;
        if (v26 >= 7200.0) {
          double v27 = v20;
        }
        else {
          double v27 = a3 + 79200.0;
        }
        char v28 = 1;
        goto LABEL_15;
      }
    }
    char v28 = 0;
    double v27 = 0.0;
LABEL_15:
    v10->_sunsetFilterEnabled = v28;
    [(SGSiderealData *)v10 timeToProgress:v25];
    v10->_sunsetFilterRampUpStartProgress = v29;
    [(SGSiderealData *)v10 timeToProgress:v27];
    v10->_sunsetFilterRampDownStartProgress = v30;
  }
  return v10;
}

- (double)timeToProgress:(double)a3
{
  CLKMapFractionIntoRange();
  return result;
}

- (double)pseudoAltitudeForProgress:(double)a3
{
  CLKMapFractionIntoRange();
  double v5 = v4;
  +[SGSiderealData _geoLocationForLocation:self->_location];
  double v7 = v6;
  double v9 = v8;
  +[SGSiderealData _absoluteTimeToJulianDay:v5];
  double v11 = objc_msgSend(objc_alloc(MEMORY[0x263F417A8]), "initWithLocation:julianDay:body:useHighPrecision:", 0, 0, v7, v9, v10);
  [v11 altitude];
  CLKMapFractionIntoRange();
  double v13 = v12;

  return v13;
}

- (double)sunsetFilter:(double)a3
{
  double result = 0.0;
  if (self->_sunsetFilterEnabled && self->_useXR)
  {
    float v5 = a3;
    float sunsetFilterRampUpStartProgress = self->_sunsetFilterRampUpStartProgress;
    float v7 = self->_sunsetFilterRampDownStartProgress - sunsetFilterRampUpStartProgress;
    float v8 = (float)((float)((float)((float)(v7 + -0.083333) * 0.5) + 0.083333) / 0.083333)
       - fabsf((float)((float)((float)(v5 + -0.083333) - sunsetFilterRampUpStartProgress)- (float)((float)(v7 + -0.083333) * 0.5))/ 0.083333);
    if (v8 < 0.0) {
      float v8 = 0.0;
    }
    return fminf(v8, 1.0);
  }
  return result;
}

- (id)_applySunsetFilter:(double)a3 toColor:
{
  return (id)[MEMORY[0x263F825C8] colorWithRed:*(float *)&v3 green:*((float *)&v3 + 1) + a3 * -0.08 * 0.745 blue:*((float *)&v3 + 2) alpha:*((float *)&v3 + 3)];
}

- (id)gradientWithSunsetFilterForDayProgress:(double)a3
{
  v25[3] = *MEMORY[0x263EF8340];
  -[SGSiderealData pseudoAltitudeForProgress:](self, "pseudoAltitudeForProgress:");
  double v6 = v5;
  BOOL useXR = self->_useXR;
  float v8 = +[SGSiderealColorManager sharedInstance];
  double v9 = v8;
  if (useXR) {
    [v8 dayGradientCurveP3];
  }
  else {
  double v10 = [v8 dayGradientColorCurves];
  }

  double v11 = [v10 objectAtIndexedSubscript:0];
  [v11 rgbfColorForFraction:v6];
  CLKUIConvertToXRSRGBfFromRGBf();

  double v12 = [v10 objectAtIndexedSubscript:1];
  [v12 rgbfColorForFraction:v6];
  CLKUIConvertToXRSRGBfFromRGBf();
  double v24 = v13;

  double v14 = [v10 objectAtIndexedSubscript:2];
  [v14 rgbfColorForFraction:v6];
  CLKUIConvertToXRSRGBfFromRGBf();
  double v23 = v15;

  [(SGSiderealData *)self sunsetFilter:a3];
  double v17 = v16;
  double v18 = -[SGSiderealData _applySunsetFilter:toColor:](self, "_applySunsetFilter:toColor:");
  double v19 = [(SGSiderealData *)self _applySunsetFilter:v17 toColor:v24];
  double v20 = [(SGSiderealData *)self _applySunsetFilter:v17 toColor:v23];
  v25[0] = v18;
  v25[1] = v19;
  v25[2] = v20;
  double v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:3];

  return v21;
}

- (BOOL)useXR
{
  return self->_useXR;
}

- (BOOL)sunsetFollowsSunrise
{
  return self->_sunsetFollowsSunrise;
}

- (BOOL)sunsetFilterEnabled
{
  return self->_sunsetFilterEnabled;
}

- (CLLocation)location
{
  return self->_location;
}

- (double)startOfDay
{
  return self->_startOfDay;
}

- (double)solarNoonTime
{
  return self->_solarNoonTime;
}

- (double)sunsetTime
{
  return self->_sunsetTime;
}

- (double)sunriseTime
{
  return self->_sunriseTime;
}

- (double)sunsetFilterRampUpStartProgress
{
  return self->_sunsetFilterRampUpStartProgress;
}

- (double)sunsetFilterRampDownStartProgress
{
  return self->_sunsetFilterRampDownStartProgress;
}

- (void).cxx_destruct
{
}

@end