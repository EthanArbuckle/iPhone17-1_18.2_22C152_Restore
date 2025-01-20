@interface SFAirDropUserDefaults_objc
+ (BOOL)askToAirdropEnabled;
+ (BOOL)cellularUsageEnabled;
+ (BOOL)moveToAppEnabled;
+ (BOOL)nearFieldSharingEnabled;
+ (BOOL)privateContactDiscoveryEnabled;
+ (BOOL)systemLevelProgressEnabled;
+ (void)setCellularUsageEnabled:(BOOL)a3;
+ (void)setNearFieldSharingEnabled:(BOOL)a3;
@end

@implementation SFAirDropUserDefaults_objc

+ (BOOL)moveToAppEnabled
{
  v2 = +[SFAirDropUserDefaults shared];
  char v3 = [v2 objcMoveToAppEnabled];

  return v3;
}

+ (BOOL)systemLevelProgressEnabled
{
  v2 = +[SFAirDropUserDefaults shared];
  char v3 = [v2 objcSystemLevelProgressEnabled];

  return v3;
}

+ (BOOL)privateContactDiscoveryEnabled
{
  v2 = +[SFAirDropUserDefaults shared];
  char v3 = [v2 objcPrivateContactDiscoveryEnabled];

  return v3;
}

+ (BOOL)askToAirdropEnabled
{
  v2 = +[SFAirDropUserDefaults shared];
  char v3 = [v2 objcAskToAirDropEnabled];

  return v3;
}

+ (BOOL)nearFieldSharingEnabled
{
  v2 = +[SFAirDropUserDefaults shared];
  char v3 = [v2 objcNearFieldSharingEnabled];

  return v3;
}

+ (void)setNearFieldSharingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[SFAirDropUserDefaults shared];
  [v4 setObjcNearFieldSharingEnabled:v3];
}

+ (BOOL)cellularUsageEnabled
{
  v2 = +[SFAirDropUserDefaults shared];
  char v3 = [v2 objcCellularUsageEnabled];

  return v3;
}

+ (void)setCellularUsageEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[SFAirDropUserDefaults shared];
  [v4 setObjcCellularUsageEnabled:v3];
}

@end