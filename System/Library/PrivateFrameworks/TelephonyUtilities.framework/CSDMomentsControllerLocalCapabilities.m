@interface CSDMomentsControllerLocalCapabilities
- (BOOL)isEnabled;
- (BOOL)isRegionBlocked;
- (CSDMomentsControllerLocalCapabilities)init;
@end

@implementation CSDMomentsControllerLocalCapabilities

- (BOOL)isEnabled
{
  v2 = self;
  unsigned __int8 v3 = sub_1002CBF2C();

  return v3 & 1;
}

- (BOOL)isRegionBlocked
{
  v2 = self;
  unsigned __int8 v3 = sub_1002CBF8C();

  return v3 & 1;
}

- (CSDMomentsControllerLocalCapabilities)init
{
  return (CSDMomentsControllerLocalCapabilities *)sub_1002CBFB8();
}

@end