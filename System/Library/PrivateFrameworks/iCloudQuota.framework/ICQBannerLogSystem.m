@interface ICQBannerLogSystem
@end

@implementation ICQBannerLogSystem

uint64_t ___ICQBannerLogSystem_block_invoke()
{
  _ICQBannerLogSystem_log = (uint64_t)os_log_create("com.apple.iCloudQuota", "banner");
  return MEMORY[0x1F41817F8]();
}

@end