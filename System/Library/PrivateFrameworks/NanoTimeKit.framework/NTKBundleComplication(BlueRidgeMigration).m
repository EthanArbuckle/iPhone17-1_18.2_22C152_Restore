@interface NTKBundleComplication(BlueRidgeMigration)
@end

@implementation NTKBundleComplication(BlueRidgeMigration)

- (void)_migrateToFamily:()BlueRidgeMigration withAllowedComplications:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "***** blue_ridge migration - bundle complication with bundle identifier %@ is missing", (uint8_t *)&v2, 0xCu);
}

@end