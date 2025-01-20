@interface MFAccountAutoFetchController
- (void)fetchNow:(int)a3 withMailboxes:(id)a4 fromAccount:(id)a5 completion:(id)a6;
@end

@implementation MFAccountAutoFetchController

- (void)fetchNow:(int)a3 withMailboxes:(id)a4 fromAccount:(id)a5 completion:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v12 = [v10 taskManager];
  v13 = v12;
  if (v12)
  {
    [v12 fetchNow:v8 withMailboxes:v9 completion:v11];
  }
  else
  {
    _ef_log_MFAccountAutoFetchController();
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v15);
      -[MFAccountAutoFetchController fetchNow:withMailboxes:fromAccount:completion:](v16, v17, v14);
    }
  }
}

void ___ef_log_MFAccountAutoFetchController_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "MFAccountAutoFetchController");
  v1 = (void *)_ef_log_MFAccountAutoFetchController_log;
  _ef_log_MFAccountAutoFetchController_log = (uint64_t)v0;
}

- (void)fetchNow:(os_log_t)log withMailboxes:fromAccount:completion:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "Trying to fetch with %@ account that doesn't have a task manager", buf, 0xCu);
}

@end