@interface ICQDaemonAlertMemoryInitOnce
@end

@implementation ICQDaemonAlertMemoryInitOnce

uint64_t ___ICQDaemonAlertMemoryInitOnce_block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)_ICQDaemonAlertMemoryLock;
  _ICQDaemonAlertMemoryLock = v0;

  uint64_t v2 = objc_opt_new();
  uint64_t v3 = _ICQDaemonAlertMemoryDict;
  _ICQDaemonAlertMemoryDict = v2;
  return MEMORY[0x1F41817F8](v2, v3);
}

@end