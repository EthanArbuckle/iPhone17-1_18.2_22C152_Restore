@interface FCAccessChecker
- (BOOL)canSynchronouslyCheckAccessToItem:(id)a3;
- (BOOL)hasAccessToItem:(id)a3 blockedReason:(unint64_t *)a4 error:(id *)a5;
- (FCAccessChecker)init;
- (void)checkAccessToItem:(id)a3 withQualityOfService:(int64_t)a4 completion:(id)a5;
@end

@implementation FCAccessChecker

- (FCAccessChecker)init
{
  v3.receiver = self;
  v3.super_class = (Class)FCAccessChecker;
  return [(FCAccessChecker *)&v3 init];
}

- (BOOL)canSynchronouslyCheckAccessToItem:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCAccessChecker canSynchronouslyCheckAccessToItem:]";
    __int16 v11 = 2080;
    v12 = "FCAccessChecker.m";
    __int16 v13 = 1024;
    int v14 = 49;
    __int16 v15 = 2114;
    v16 = v4;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  v7 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[FCAccessChecker canSynchronouslyCheckAccessToItem:]"];
  id v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (BOOL)hasAccessToItem:(id)a3 blockedReason:(unint64_t *)a4 error:(id *)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    v12 = "-[FCAccessChecker hasAccessToItem:blockedReason:error:]";
    __int16 v13 = 2080;
    int v14 = "FCAccessChecker.m";
    __int16 v15 = 1024;
    int v16 = 56;
    __int16 v17 = 2114;
    v18 = v6;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v7 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v8 = *MEMORY[0x1E4F1C3B8];
  v9 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[FCAccessChecker hasAccessToItem:blockedReason:error:]"];
  id v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)checkAccessToItem:(id)a3 withQualityOfService:(int64_t)a4 completion:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = (void (**)(id, BOOL, uint64_t, void))a5;
  if (!v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "item != nil");
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[FCAccessChecker checkAccessToItem:withQualityOfService:completion:]";
    __int16 v14 = 2080;
    __int16 v15 = "FCAccessChecker.m";
    __int16 v16 = 1024;
    int v17 = 63;
    __int16 v18 = 2114;
    uint64_t v19 = v10;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v8) {
      goto LABEL_6;
    }
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "completion != nil");
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[FCAccessChecker checkAccessToItem:withQualityOfService:completion:]";
    __int16 v14 = 2080;
    __int16 v15 = "FCAccessChecker.m";
    __int16 v16 = 1024;
    int v17 = 64;
    __int16 v18 = 2114;
    uint64_t v19 = v11;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  uint64_t v12 = 0;
  *(void *)buf = 0;
  BOOL v9 = [(FCAccessChecker *)self hasAccessToItem:v7 blockedReason:&v12 error:buf];
  v8[2](v8, v9, v12, *(void *)buf);
}

@end