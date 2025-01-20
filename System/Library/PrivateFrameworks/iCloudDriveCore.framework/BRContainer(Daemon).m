@interface BRContainer(Daemon)
- (uint64_t)currentStatus;
- (uint64_t)lastServerUpdate;
- (void)currentStatus;
- (void)lastServerUpdate;
@end

@implementation BRContainer(Daemon)

- (uint64_t)currentStatus
{
  v0 = brc_bread_crumbs();
  v1 = brc_default_log();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT)) {
    [(BRContainer(Daemon) *)(uint64_t)v0 currentStatus];
  }

  return 1;
}

- (uint64_t)lastServerUpdate
{
  v0 = brc_bread_crumbs();
  v1 = brc_default_log();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT)) {
    [(BRContainer(Daemon) *)(uint64_t)v0 lastServerUpdate];
  }

  return 0;
}

- (void)currentStatus
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_23FA42000, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: -[BRContainer currentStatus] shouldn't be called by the daemon.%@", (uint8_t *)&v2, 0xCu);
}

- (void)lastServerUpdate
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_23FA42000, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: -[BRContainer lastServerUpdate] shouldn't be called by the daemon.%@", (uint8_t *)&v2, 0xCu);
}

@end