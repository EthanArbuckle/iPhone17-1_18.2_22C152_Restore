@interface FCBlockedExplicitContentAccessChecker
- (BOOL)canSynchronouslyCheckAccessToItem:(id)a3;
- (BOOL)hasAccessToItem:(id)a3 blockedReason:(unint64_t *)a4 error:(id *)a5;
- (FCBlockedExplicitContentAccessChecker)init;
@end

@implementation FCBlockedExplicitContentAccessChecker

- (FCBlockedExplicitContentAccessChecker)init
{
  v3.receiver = self;
  v3.super_class = (Class)FCBlockedExplicitContentAccessChecker;
  return [(FCAccessChecker *)&v3 init];
}

- (BOOL)canSynchronouslyCheckAccessToItem:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "item != nil");
    *(_DWORD *)buf = 136315906;
    v7 = "-[FCBlockedExplicitContentAccessChecker canSynchronouslyCheckAccessToItem:]";
    __int16 v8 = 2080;
    v9 = "FCBlockedExplicitContentAccessChecker.m";
    __int16 v10 = 1024;
    int v11 = 21;
    __int16 v12 = 2114;
    v13 = v5;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  return 1;
}

- (BOOL)hasAccessToItem:(id)a3 blockedReason:(unint64_t *)a4 error:(id *)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "item != nil");
    *(_DWORD *)buf = 136315906;
    v15 = "-[FCBlockedExplicitContentAccessChecker hasAccessToItem:blockedReason:error:]";
    __int16 v16 = 2080;
    v17 = "FCBlockedExplicitContentAccessChecker.m";
    __int16 v18 = 1024;
    int v19 = 29;
    __int16 v20 = 2114;
    v21 = v13;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  int v7 = [v6 isBlockedExplicitContent];
  char v8 = v7;
  if (a4)
  {
    if (v7)
    {
      *a4 = 3;
      v9 = (void *)FCDefaultLog;
      if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v10 = v9;
        int v11 = [v6 identifier];
        *(_DWORD *)buf = 138543362;
        v15 = v11;
        _os_log_impl(&dword_1A460D000, v10, OS_LOG_TYPE_DEFAULT, "item %{public}@ is not accessible because it contains explicit content", buf, 0xCu);
      }
    }
  }

  return v8 ^ 1;
}

@end