@interface PDRMigrator
+ (id)sharedMigrator;
- (BOOL)migrationIsAvailable;
- (NSArray)devicesExpectedToBeMigratableAfterRestore;
- (NSArray)migratableDevices;
- (NSArray)migratableDevicesRequiringConsent;
- (NSString)lastMigrationRequestPhoneName;
- (id)beginMigrationWithDevice:(id)a3;
- (id)beginMigrationWithDevice:(id)a3 passcode:(id)a4;
- (id)devicesFromMigrationConsentRequestData:(id)a3;
- (id)migrationConsentRequestData;
- (id)migrationDataPreRestoreForConsentedDevices:(id)a3;
- (id)setMigrationConsented:(BOOL)a3 forDevice:(id)a4;
- (void)ingestPostRestoreMigrationDataForConsentedDevices:(id)a3;
- (void)isPhoneReadyToMigrateDevice:(id)a3 withCompletion:(id)a4;
@end

@implementation PDRMigrator

+ (id)sharedMigrator
{
  return +[PDRMigrator sharedMigrator];
}

- (NSString)lastMigrationRequestPhoneName
{
  return self->_lastMigrationRequestPhoneName;
}

- (void).cxx_destruct
{
}

- (id)setMigrationConsented:(BOOL)a3 forDevice:(id)a4
{
  OUTLINED_FUNCTION_1();
  uint64_t v4 = objc_opt_class();
  OUTLINED_FUNCTION_0(v4);
  return 0;
}

- (id)beginMigrationWithDevice:(id)a3 passcode:(id)a4
{
  OUTLINED_FUNCTION_1();
  uint64_t v4 = objc_opt_class();
  OUTLINED_FUNCTION_0(v4);
  return 0;
}

- (id)migrationConsentRequestData
{
  OUTLINED_FUNCTION_1();
  uint64_t v2 = objc_opt_class();
  OUTLINED_FUNCTION_0(v2);
  return 0;
}

- (id)devicesFromMigrationConsentRequestData:(id)a3
{
  OUTLINED_FUNCTION_1();
  uint64_t v3 = objc_opt_class();
  OUTLINED_FUNCTION_0(v3);
  return 0;
}

- (BOOL)migrationIsAvailable
{
  OUTLINED_FUNCTION_1();
  uint64_t v2 = objc_opt_class();
  OUTLINED_FUNCTION_0(v2);
  return 0;
}

- (NSArray)devicesExpectedToBeMigratableAfterRestore
{
  OUTLINED_FUNCTION_1();
  uint64_t v2 = objc_opt_class();
  OUTLINED_FUNCTION_0(v2);
  return 0;
}

- (NSArray)migratableDevicesRequiringConsent
{
  OUTLINED_FUNCTION_1();
  uint64_t v2 = objc_opt_class();
  OUTLINED_FUNCTION_0(v2);
  return 0;
}

- (NSArray)migratableDevices
{
  OUTLINED_FUNCTION_1();
  uint64_t v2 = objc_opt_class();
  OUTLINED_FUNCTION_0(v2);
  return 0;
}

- (id)migrationDataPreRestoreForConsentedDevices:(id)a3
{
  OUTLINED_FUNCTION_1();
  uint64_t v3 = objc_opt_class();
  OUTLINED_FUNCTION_0(v3);
  return 0;
}

- (void)ingestPostRestoreMigrationDataForConsentedDevices:(id)a3
{
  OUTLINED_FUNCTION_1();
  uint64_t v5 = objc_opt_class();
  MEMORY[0x270EF2BB8](v4, v3, v5);
}

- (void)isPhoneReadyToMigrateDevice:(id)a3 withCompletion:(id)a4
{
  OUTLINED_FUNCTION_1();
  uint64_t v6 = objc_opt_class();
  MEMORY[0x270EF2BB8](v5, v4, v6);
}

- (id)beginMigrationWithDevice:(id)a3
{
  OUTLINED_FUNCTION_1();
  uint64_t v3 = objc_opt_class();
  OUTLINED_FUNCTION_0(v3);
  return 0;
}

@end