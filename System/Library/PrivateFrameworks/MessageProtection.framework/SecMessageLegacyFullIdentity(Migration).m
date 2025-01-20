@interface SecMessageLegacyFullIdentity(Migration)
@end

@implementation SecMessageLegacyFullIdentity(Migration)

- (void)deleteItemWithPersistentRef:()Migration .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_2163F2000, a2, OS_LOG_TYPE_ERROR, "Error occured while deleting the migrated persistent reference: %i", (uint8_t *)v2, 8u);
}

@end