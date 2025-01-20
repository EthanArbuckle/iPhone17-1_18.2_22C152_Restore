@interface _PKProvisioningSEStorageSnapshot
+ (BOOL)supportsSecureCoding;
+ (id)purpleTrustAirAccessAppletType;
+ (id)purpleTrustAirAliroAppletType;
+ (id)purpleTrustAirHomeAppletType;
- (BOOL)addToSnapshotWithAppletTypes:(id)a3;
- (BOOL)canFitWithAppletTypes:(id)a3;
- (_PKProvisioningSEStorageSnapshot)init;
- (_PKProvisioningSEStorageSnapshot)initWithCoder:(id)a3;
- (id)appletTypesForAppletIDs:(id)a3;
- (int64_t)requiredStorageForAppletTypes:(id)a3;
- (int64_t)totalStorage;
- (int64_t)totalUsage;
- (int64_t)totalUsageOfAppletType:(id)a3;
- (int64_t)usageOfAppletType:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removeFromSnapshotWithAppletTypes:(id)a3;
- (void)reset;
@end

@implementation _PKProvisioningSEStorageSnapshot

- (BOOL)canFitWithAppletTypes:(id)a3
{
  return sub_190FC584C(self, (uint64_t)a2, (uint64_t)a3, MEMORY[0x1E4F97910]);
}

- (BOOL)addToSnapshotWithAppletTypes:(id)a3
{
  return sub_190FC584C(self, (uint64_t)a2, (uint64_t)a3, MEMORY[0x1E4F978D8]);
}

- (void)removeFromSnapshotWithAppletTypes:(id)a3
{
  uint64_t v4 = sub_1915EF280();
  v5 = self;
  sub_190FC58F8(v4);

  swift_bridgeObjectRelease();
}

- (void)reset
{
  v2 = self;
  sub_1915EEE10();
}

- (id)appletTypesForAppletIDs:(id)a3
{
  uint64_t v4 = sub_1915EF280();
  v5 = self;
  v6 = sub_190FC7574(v4);
  uint64_t v7 = *(void *)(v4 + 16);
  if (v7 != v6[2])
  {
    swift_bridgeObjectRelease();
    sub_190FDFB48(0xD000000000000011, 0x8000000191676AF0, v7);
  }

  swift_bridgeObjectRelease();
  v8 = (void *)sub_1915EF270();
  swift_bridgeObjectRelease();
  return v8;
}

- (int64_t)totalUsageOfAppletType:(id)a3
{
  return sub_190FC6304(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_190FC60F4);
}

- (int64_t)usageOfAppletType:(id)a3
{
  return sub_190FC6304(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_190FC6124);
}

- (int64_t)totalStorage
{
  v2 = self;
  sub_1915EEDD0();
  int64_t v4 = v3;

  return v4;
}

- (int64_t)totalUsage
{
  v2 = self;
  int64_t v3 = sub_1915EEDD0();

  return v3;
}

- (int64_t)requiredStorageForAppletTypes:(id)a3
{
  uint64_t v4 = sub_1915EF280();
  v5 = self;
  int64_t v6 = sub_190FC64EC(v4);

  swift_bridgeObjectRelease();
  return v6;
}

+ (id)purpleTrustAirHomeAppletType
{
  v2 = (void *)sub_1915EF000();
  return v2;
}

+ (id)purpleTrustAirAccessAppletType
{
  v2 = (void *)sub_1915EF000();
  return v2;
}

+ (id)purpleTrustAirAliroAppletType
{
  v2 = (void *)sub_1915EF000();
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____PKProvisioningSEStorageSnapshot_snapshot);
  id v5 = a3;
  int64_t v6 = self;
  id v7 = (id)sub_1915EF000();
  objc_msgSend(v5, sel_encodeObject_forKey_, v4, v7);
}

- (_PKProvisioningSEStorageSnapshot)initWithCoder:(id)a3
{
  return (_PKProvisioningSEStorageSnapshot *)ProvisioningSEStorageSnapshot.init(coder:)(a3);
}

- (_PKProvisioningSEStorageSnapshot)init
{
  result = (_PKProvisioningSEStorageSnapshot *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end