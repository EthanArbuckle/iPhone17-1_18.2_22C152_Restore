@interface FCNewsVersionAccessChecker
- (BOOL)canSynchronouslyCheckAccessToItem:(id)a3;
- (BOOL)hasAccessToItem:(id)a3 blockedReason:(unint64_t *)a4 error:(id *)a5;
- (FCNewsVersionAccessChecker)init;
@end

@implementation FCNewsVersionAccessChecker

- (FCNewsVersionAccessChecker)init
{
  v3.receiver = self;
  v3.super_class = (Class)FCNewsVersionAccessChecker;
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
    v7 = "-[FCNewsVersionAccessChecker canSynchronouslyCheckAccessToItem:]";
    __int16 v8 = 2080;
    v9 = "FCNewsVersionAccessChecker.m";
    __int16 v10 = 1024;
    int v11 = 23;
    __int16 v12 = 2114;
    v13 = v5;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  return 1;
}

- (BOOL)hasAccessToItem:(id)a3 blockedReason:(unint64_t *)a4 error:(id *)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "item != nil");
    *(_DWORD *)buf = 136315906;
    v16 = "-[FCNewsVersionAccessChecker hasAccessToItem:blockedReason:error:]";
    __int16 v17 = 2080;
    v18 = "FCNewsVersionAccessChecker.m";
    __int16 v19 = 1024;
    int v20 = 31;
    __int16 v21 = 2114;
    v22 = v14;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v7 = +[FCRestrictions sharedInstance];
  char v8 = objc_msgSend(v7, "isNewsVersionAllowed:", objc_msgSend(v6, "minimumNewsVersion"));

  if (a4)
  {
    if ((v8 & 1) == 0)
    {
      *a4 = 1;
      v9 = (void *)FCDefaultLog;
      if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v10 = v9;
        int v11 = [v6 identifier];
        uint64_t v12 = [v6 minimumNewsVersion];
        *(_DWORD *)buf = 138543618;
        v16 = v11;
        __int16 v17 = 2048;
        v18 = (char *)v12;
        _os_log_impl(&dword_1A460D000, v10, OS_LOG_TYPE_DEFAULT, "item %{public}@ is not accessible because it requires minimum News version %llu", buf, 0x16u);
      }
    }
  }

  return v8;
}

@end