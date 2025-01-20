@interface SADeviceInfo
- (SADeviceInfo)init;
- (id)build;
- (id)currentCountry;
- (id)osType;
- (id)prefixStoreVersion;
- (id)productType;
- (id)systemLocale;
- (id)trialExperiment;
- (int)buildType;
@end

@implementation SADeviceInfo

- (id)systemLocale
{
  return sub_25BC8F818(self, (uint64_t)a2, (void (*)(void))sub_25BC8F6A0);
}

- (id)currentCountry
{
  return sub_25BC8F818(self, (uint64_t)a2, (void (*)(void))sub_25BC8F7BC);
}

- (id)build
{
  return sub_25BC8F8B4(self);
}

- (id)osType
{
  return sub_25BC8F8B4(self);
}

- (id)productType
{
  return sub_25BC8F8B4(self);
}

- (int)buildType
{
  v2 = self;
  int v3 = sub_25BC8F9FC();

  return v3;
}

- (id)prefixStoreVersion
{
  v2 = self;
  sub_25BC8FA8C();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_25BCA1590();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)trialExperiment
{
  type metadata accessor for SATrialExperiment((uint64_t)self);
  v2 = (void *)sub_25BCA1700();
  swift_bridgeObjectRelease();
  return v2;
}

- (SADeviceInfo)init
{
  return (SADeviceInfo *)SADeviceInfo.init()();
}

@end