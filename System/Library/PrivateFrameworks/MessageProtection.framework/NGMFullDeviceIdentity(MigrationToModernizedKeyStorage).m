@interface NGMFullDeviceIdentity(MigrationToModernizedKeyStorage)
- (void)postMigrationKeychainCleanup;
@end

@implementation NGMFullDeviceIdentity(MigrationToModernizedKeyStorage)

- (void)deleteKeyWithTag:()MigrationToModernizedKeyStorage .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_2163F2000, a2, OS_LOG_TYPE_FAULT, "Deletion of a keychain item failed for after migration with error: %i", (uint8_t *)v2, 8u);
}

- (void)postMigrationKeychainCleanup
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2163F2000, log, OS_LOG_TYPE_ERROR, "Migration to CTKOID failed.", v1, 2u);
}

@end