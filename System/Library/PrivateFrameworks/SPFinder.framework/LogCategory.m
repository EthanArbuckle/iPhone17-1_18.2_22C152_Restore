@interface LogCategory
@end

@implementation LogCategory

uint64_t __LogCategory_Unspecified_block_invoke()
{
  LogCategory_Unspecified_log = (uint64_t)os_log_create("com.apple.icloud.SPFinder", "_");
  return MEMORY[0x270F9A758]();
}

uint64_t __LogCategory_AdvertisementCache_block_invoke()
{
  LogCategory_AdvertisementCache_log = (uint64_t)os_log_create("com.apple.icloud.SPFinder", "advertisementCache");
  return MEMORY[0x270F9A758]();
}

@end