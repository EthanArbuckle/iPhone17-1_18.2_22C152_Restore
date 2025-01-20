@interface TBDefaults
+ (double)nearbyTileSearchRadius;
+ (double)tileSearchRadius;
+ (unsigned)zoomLevel;
+ (void)setOverrideZoomLevel:(unsigned __int8)a3;
@end

@implementation TBDefaults

+ (unsigned)zoomLevel
{
  if (zoomLevel_zoomToken != -1) {
    dispatch_once(&zoomLevel_zoomToken, &__block_literal_global_8);
  }
  if (_overrideZoomLevel)
  {
    NSLog(&cfstr_SReturningOver.isa, "+[TBDefaults zoomLevel]", _overrideZoomLevel, _zoomLevel);
    v2 = &_overrideZoomLevel;
  }
  else
  {
    v2 = &_zoomLevel;
  }
  return *v2;
}

+ (double)nearbyTileSearchRadius
{
  if (nearbyTileSearchRadius_nearbyRadiusToken != -1) {
    dispatch_once(&nearbyTileSearchRadius_nearbyRadiusToken, &__block_literal_global_6_0);
  }
  return *(double *)&_nearbyTileSearchRadius;
}

+ (double)tileSearchRadius
{
  if (tileSearchRadius_radiusToken != -1) {
    dispatch_once(&tileSearchRadius_radiusToken, &__block_literal_global_9);
  }
  return *(double *)&_tileSearchRadius;
}

void __30__TBDefaults_tileSearchRadius__block_invoke()
{
  id v1 = [MEMORY[0x1E4F64708] sharedService];
  [v1 wiFiQualitySearchRadiusMeters];
  _tileSearchRadius = v0;
}

void __36__TBDefaults_nearbyTileSearchRadius__block_invoke()
{
  id v1 = [MEMORY[0x1E4F64708] sharedService];
  [v1 wiFiQualitySmallSearchRadiusMeters];
  _nearbyTileSearchRadius = v0;
}

void __23__TBDefaults_zoomLevel__block_invoke()
{
  id v0 = [MEMORY[0x1E4F64708] sharedService];
  _zoomLevel = [v0 wiFiQualitySearchZoomLevel];
}

+ (void)setOverrideZoomLevel:(unsigned __int8)a3
{
  _overrideZoomLevel = a3;
}

@end