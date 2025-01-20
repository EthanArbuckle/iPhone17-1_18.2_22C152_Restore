@interface FTMomentsControllerLocalCapabilities
- (BOOL)isEnabled;
- (BOOL)isRegionBlocked;
- (FTMomentsControllerLocalCapabilities)init;
@end

@implementation FTMomentsControllerLocalCapabilities

- (BOOL)isEnabled
{
  v2 = self;
  unsigned __int8 v3 = sub_10003AC88();

  return v3 & 1;
}

- (BOOL)isRegionBlocked
{
  v2 = self;
  unsigned __int8 v3 = sub_10003ACE8();

  return v3 & 1;
}

- (FTMomentsControllerLocalCapabilities)init
{
  return (FTMomentsControllerLocalCapabilities *)sub_10003AD14();
}

@end