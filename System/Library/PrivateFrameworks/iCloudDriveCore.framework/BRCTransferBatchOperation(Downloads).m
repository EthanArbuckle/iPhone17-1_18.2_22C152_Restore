@interface BRCTransferBatchOperation(Downloads)
@end

@implementation BRCTransferBatchOperation(Downloads)

- (void)fetchOperationForTransfers:()Downloads traceCode:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_23FA42000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: ![[BRCAccountsManager sharedManager] isInSyncBubble]%@", (uint8_t *)&v2, 0xCu);
}

@end