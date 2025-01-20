@interface MFAddLastModifiedColumnUpgradeStep
+ (id)log;
+ (int)runWithConnection:(id)a3;
@end

@implementation MFAddLastModifiedColumnUpgradeStep

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__MFAddLastModifiedColumnUpgradeStep_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_9 != -1) {
    dispatch_once(&log_onceToken_9, block);
  }
  v2 = (void *)log_log_9;
  return v2;
}

void __41__MFAddLastModifiedColumnUpgradeStep_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_9;
  log_log_9 = (uint64_t)v1;
}

+ (int)runWithConnection:(id)a3
{
  id v3 = a3;
  if ([v3 columnExists:@"last_modified" inTable:@"business_addresses" type:0])
  {
    int v4 = 0;
  }
  else
  {
    int v4 = sqlite3_exec((sqlite3 *)[v3 sqlDB], (const char *)objc_msgSend(@"ALTER TABLE business_addresses ADD COLUMN last_modified INTEGER;",
                           "UTF8String"),
           0,
           0,
           0);
    if (v4)
    {
      v5 = +[MFAddLastModifiedColumnUpgradeStep log];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        +[MFAddLastModifiedColumnUpgradeStep runWithConnection:](v5);
      }
    }
  }

  return v4;
}

+ (void)runWithConnection:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "Failed to add last_modified column in business_addresses table", v1, 2u);
}

@end