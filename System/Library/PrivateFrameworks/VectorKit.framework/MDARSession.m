@interface MDARSession
+ (BOOL)isSupported;
+ (id)newGeoTrackingSession;
+ (id)newPositionalTrackingSession;
+ (id)stringWithARGeoTrackingAccuracy:(int64_t)a3;
+ (id)stringWithARGeoTrackingState:(int64_t)a3;
+ (id)stringWithARGeoTrackingStateReason:(int64_t)a3;
+ (id)stringWithARTrackingState:(int64_t)a3;
+ (id)stringWithARTrackingStateReason:(int64_t)a3;
@end

@implementation MDARSession

+ (id)stringWithARGeoTrackingAccuracy:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return @"Undetermined";
  }
  else {
    return (id)*((void *)&off_1E5A96790 + a3 - 1);
  }
}

+ (id)stringWithARGeoTrackingStateReason:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 7) {
    return @"None";
  }
  else {
    return (id)*((void *)&off_1E5A96750 + a3 - 1);
  }
}

+ (id)stringWithARGeoTrackingState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return @"NotAvailable";
  }
  else {
    return (id)*((void *)&off_1E5A96738 + a3 - 1);
  }
}

+ (id)stringWithARTrackingStateReason:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    return @"None";
  }
  else {
    return (id)*((void *)&off_1E5A96718 + a3 - 1);
  }
}

+ (id)stringWithARTrackingState:(int64_t)a3
{
  v3 = @"NotAvailable";
  if (a3 == 1) {
    v3 = @"Limited";
  }
  if (a3 == 2) {
    return @"Normal";
  }
  else {
    return v3;
  }
}

+ (BOOL)isSupported
{
  if (LoadARKit(void)::loadPredicate != -1) {
    dispatch_once(&LoadARKit(void)::loadPredicate, &__block_literal_global_40893);
  }
  ARGeoTrackingConfigurationClass = (void *)getARGeoTrackingConfigurationClass();
  return [ARGeoTrackingConfigurationClass isSupported];
}

+ (id)newPositionalTrackingSession
{
  if (+[MDARSession isSupported])
  {
    if ([(id)getARWorldTrackingConfigurationClass() isSupported])
    {
      getARWorldTrackingConfigurationClass();
      v2 = objc_opt_new();
      [v2 setPlaneDetection:0];
      [v2 setWorldAlignment:0];
      [v2 setLightEstimationEnabled:0];
      v3 = +[VKDebugSettings sharedSettings];
      int v4 = [v3 arEnableEnvironmentMap];

      if (v4) {
        [v2 setEnvironmentTexturing:1];
      }
      if (v2)
      {
        id v5 = objc_alloc_init(getARSessionClass());
        [v5 runWithConfiguration:v2 options:1];
LABEL_10:

        return v5;
      }
    }
    else
    {
      v2 = 0;
    }
    id v5 = 0;
    goto LABEL_10;
  }
  return 0;
}

+ (id)newGeoTrackingSession
{
  if (!+[MDARSession isSupported]
    || ![(objc_class *)getARGeoTrackingConfigurationClass() isSupported])
  {
    return 0;
  }
  getARGeoTrackingConfigurationClass();
  v2 = objc_opt_new();
  [v2 setSupportEnablementOptions:4];
  [v2 setVisualLocalizationCallInterval:0.0];
  [v2 setPlaneDetection:0];
  [v2 setLightEstimationEnabled:0];
  v3 = +[VKDebugSettings sharedSettings];
  int v4 = [v3 arEnableEnvironmentMap];

  if (v4) {
    [v2 setEnvironmentTexturing:1];
  }
  id v5 = objc_alloc_init(getARSessionClass());
  [v5 runWithConfiguration:v2 options:1];

  return v5;
}

@end