@interface PDRMigrator_Impl
- (BOOL)migrationIsAvailable;
- (NSArray)migratableDevices;
- (NSString)lastMigrationRequestPhoneName;
- (PDRMigrator_Impl)init;
- (id)beginMigrationWithDevice:(id)a3;
- (id)beginMigrationWithDevice:(id)a3 passcode:(id)a4;
- (id)devicesFromMigrationConsentRequestData:(id)a3;
- (id)migrationConsentRequestData;
- (id)migrationDataPreRestoreForConsentedDevices:(id)a3;
- (id)setMigrationConsented:(BOOL)a3 forDevice:(id)a4;
- (void)ingestPostRestoreMigrationDataForConsentedDevices:(id)a3;
- (void)isPhoneReadyToMigrateDevice:(id)a3 withCompletion:(id)a4;
@end

@implementation PDRMigrator_Impl

- (id)setMigrationConsented:(BOOL)a3 forDevice:(id)a4
{
  return 0;
}

- (id)beginMigrationWithDevice:(id)a3 passcode:(id)a4
{
  return 0;
}

- (id)migrationConsentRequestData
{
  v2.super.isa = Data._bridgeToObjectiveC()().super.isa;

  return v2.super.isa;
}

- (id)devicesFromMigrationConsentRequestData:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;

  outlined consume of Data._Representation(v6, v8);
  type metadata accessor for PDRDevice();
  v9.super.isa = Array._bridgeToObjectiveC()().super.isa;

  return v9.super.isa;
}

- (BOOL)migrationIsAvailable
{
  return 0;
}

- (NSArray)migratableDevices
{
  type metadata accessor for PDRDevice();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;

  return (NSArray *)v2.super.isa;
}

- (id)migrationDataPreRestoreForConsentedDevices:(id)a3
{
  v3.super.isa = Data._bridgeToObjectiveC()().super.isa;

  return v3.super.isa;
}

- (void)ingestPostRestoreMigrationDataForConsentedDevices:(id)a3
{
  id v4 = a3;
  unint64_t v8 = self;
  uint64_t v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v7 = v6;

  outlined consume of Data._Representation(v5, v7);
}

- (NSString)lastMigrationRequestPhoneName
{
  NSArray v2 = (void *)MEMORY[0x25A2CA820](0, 0xE000000000000000);

  return (NSString *)v2;
}

- (void)isPhoneReadyToMigrateDevice:(id)a3 withCompletion:(id)a4
{
  unint64_t v6 = _Block_copy(a4);
  unint64_t v7 = (void (*)(void *, void, void))v6[2];
  id v8 = a3;
  NSArray v9 = self;
  v7(v6, 0, 0);
  _Block_release(v6);
}

- (id)beginMigrationWithDevice:(id)a3
{
  return 0;
}

- (PDRMigrator_Impl)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Migrator_Impl();
  return [(PDRMigrator_Impl *)&v3 init];
}

@end