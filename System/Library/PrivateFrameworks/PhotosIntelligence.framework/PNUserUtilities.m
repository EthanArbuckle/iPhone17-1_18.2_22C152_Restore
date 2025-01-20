@interface PNUserUtilities
+ (BOOL)isUserFCS;
+ (BOOL)isUserSeed;
@end

@implementation PNUserUtilities

+ (BOOL)isUserFCS
{
  if (+[PNUserUtilities isUserSeed]) {
    return 0;
  }
  else {
    return PFOSVariantHasInternalDiagnostics() ^ 1;
  }
}

+ (BOOL)isUserSeed
{
  return 0;
}

@end