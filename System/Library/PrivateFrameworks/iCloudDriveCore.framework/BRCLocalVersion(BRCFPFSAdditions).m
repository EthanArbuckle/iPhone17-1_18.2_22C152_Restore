@interface BRCLocalVersion(BRCFPFSAdditions)
@end

@implementation BRCLocalVersion(BRCFPFSAdditions)

- (void)initFromResultSet:()BRCFPFSAdditions pos:.cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_23FA42000, log, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: can't unarchive CKRecord: %@%@", buf, 0x16u);
}

@end