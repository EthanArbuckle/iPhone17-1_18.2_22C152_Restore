@interface ICQSignpostLogSystem
@end

@implementation ICQSignpostLogSystem

uint64_t ___ICQSignpostLogSystem_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.iCloudQuota", "core.signpost");
  uint64_t v1 = _ICQSignpostLogSystem_log;
  _ICQSignpostLogSystem_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end