@interface ICQGetLogSystem
@end

@implementation ICQGetLogSystem

uint64_t ___ICQGetLogSystem_block_invoke()
{
  _ICQGetLogSystem_log = (uint64_t)os_log_create("com.apple.iCloudQuota", "core");
  return MEMORY[0x1F41817F8]();
}

@end