@interface SFAirDropUserDefaults
+ (SFAirDropUserDefaults)shared;
- (BOOL)objcAskToAirDropEnabled;
- (BOOL)objcCellularUsageEnabled;
- (BOOL)objcMoveToAppEnabled;
- (BOOL)objcNearFieldSharingEnabled;
- (BOOL)objcPrivateContactDiscoveryEnabled;
- (BOOL)objcSystemLevelProgressEnabled;
- (NSString)description;
- (SFAirDropUserDefaults)init;
- (void)setObjcCellularUsageEnabled:(BOOL)a3;
- (void)setObjcNearFieldSharingEnabled:(BOOL)a3;
@end

@implementation SFAirDropUserDefaults

+ (SFAirDropUserDefaults)shared
{
  if (qword_1E966C4D8 != -1) {
    swift_once();
  }
  sub_1A56D6228();

  return (SFAirDropUserDefaults *)v3;
}

- (BOOL)objcPrivateContactDiscoveryEnabled
{
  v2 = self;
  char v3 = SFAirDropUserDefaults.privateContactDiscoveryEnabled.getter();

  return v3 & 1;
}

- (BOOL)objcSystemLevelProgressEnabled
{
  v2 = self;
  char v3 = SFAirDropUserDefaults.systemLevelProgressEnabled.getter();

  return v3 & 1;
}

- (BOOL)objcMoveToAppEnabled
{
  v2 = self;
  char v3 = SFAirDropUserDefaults.moveToAppEnabled.getter();

  return v3 & 1;
}

- (BOOL)objcAskToAirDropEnabled
{
  return sub_1A567D37C(self);
}

- (BOOL)objcNearFieldSharingEnabled
{
  return sub_1A567D37C(self);
}

- (void)setObjcNearFieldSharingEnabled:(BOOL)a3
{
  v4 = self;
  SFAirDropUserDefaults.objcNearFieldSharingEnabled.setter(a3);
}

- (BOOL)objcCellularUsageEnabled
{
  return sub_1A567D37C(self);
}

- (void)setObjcCellularUsageEnabled:(BOOL)a3
{
  v4 = self;
  SFAirDropUserDefaults.objcCellularUsageEnabled.setter(a3);
}

- (SFAirDropUserDefaults)init
{
  return (SFAirDropUserDefaults *)SFAirDropUserDefaults.init()();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

- (NSString)description
{
  _s7Sharing21SFAirDropUserDefaultsC11descriptionSSvg_0();
  v2 = (void *)sub_1A56D5098();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

@end