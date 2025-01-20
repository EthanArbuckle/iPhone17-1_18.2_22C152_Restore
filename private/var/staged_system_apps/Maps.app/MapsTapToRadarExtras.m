@interface MapsTapToRadarExtras
+ (BOOL)shouldEnableTTRButton;
@end

@implementation MapsTapToRadarExtras

+ (BOOL)shouldEnableTTRButton
{
  char BOOL = GEOConfigGetBOOL();
  v3 = +[GEOPlatform sharedPlatform];
  unsigned int v4 = [v3 isInternalInstall];
  char v5 = BOOL ^ 1;
  unsigned __int8 v6 = (BOOL ^ 1) & v4;
  if ((v5 & 1) == 0 && v4)
  {
    if (+[MapsRadarDraft isTapToRadarKitSupported]) {
      unsigned __int8 v6 = +[MapsRadarDraft isTapToRadarAuthorized];
    }
    else {
      unsigned __int8 v6 = 0;
    }
  }

  return v6;
}

@end