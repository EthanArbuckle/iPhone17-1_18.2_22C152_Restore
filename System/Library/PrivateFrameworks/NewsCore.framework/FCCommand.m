@interface FCCommand
+ (BOOL)supportsSecureCoding;
- (BOOL)canCoalesceWithCommand:(id)a3;
- (FCCommand)initWithCoder:(id)a3;
- (unint64_t)statusForCloudKitError:(id)a3;
- (void)coalesceWithCommand:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3 delegate:(id)a4 qualityOfService:(int64_t)a5;
@end

@implementation FCCommand

- (void)executeWithContext:(id)a3 delegate:(id)a4 qualityOfService:(int64_t)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    v14 = "-[FCCommand executeWithContext:delegate:qualityOfService:]";
    __int16 v15 = 2080;
    v16 = "FCCommand.m";
    __int16 v17 = 1024;
    int v18 = 46;
    __int16 v19 = 2114;
    v20 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v9 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v10 = *MEMORY[0x1E4F1C3B8];
  v11 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[FCCommand executeWithContext:delegate:qualityOfService:]"];
  id v12 = [v9 exceptionWithName:v10 reason:v11 userInfo:0];

  objc_exception_throw(v12);
}

- (BOOL)canCoalesceWithCommand:(id)a3
{
  return 0;
}

- (void)coalesceWithCommand:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    uint64_t v10 = "-[FCCommand coalesceWithCommand:]";
    __int16 v11 = 2080;
    id v12 = "FCCommand.m";
    __int16 v13 = 1024;
    int v14 = 56;
    __int16 v15 = 2114;
    v16 = v4;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  id v7 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCCommand coalesceWithCommand:]"];
  id v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (unint64_t)statusForCloudKitError:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3) {
    goto LABEL_13;
  }
  v4 = (void *)FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = v4;
    *(_DWORD *)id v12 = 138543618;
    *(void *)&v12[4] = objc_opt_class();
    *(_WORD *)&v12[12] = 2114;
    *(void *)&v12[14] = v3;
    id v11 = *(id *)&v12[4];
    _os_log_error_impl(&dword_1A460D000, v10, OS_LOG_TYPE_ERROR, "command type: %{public}@ encountered error: %{public}@", v12, 0x16u);
  }
  if (objc_msgSend(v3, "fc_hasIdentityStillSyncingError", *(_OWORD *)v12, *(void *)&v12[16], v13)) {
    goto LABEL_5;
  }
  if (objc_msgSend(v3, "fc_hasErrorCode:", 40))
  {
LABEL_7:
    unint64_t v5 = 3;
    goto LABEL_14;
  }
  uint64_t v6 = [v3 domain];
  int v7 = [v6 isEqualToString:*MEMORY[0x1E4F19C40]];

  if (v7)
  {
    unint64_t v8 = [v3 code];
    if (v8 <= 0x1B)
    {
      if (((1 << v8) & 0xA009002) != 0) {
        goto LABEL_7;
      }
      if (((1 << v8) & 0x18) != 0)
      {
        unint64_t v5 = 1;
        goto LABEL_14;
      }
      if (((1 << v8) & 0x40004) == 0) {
        goto LABEL_5;
      }
LABEL_13:
      unint64_t v5 = 0;
      goto LABEL_14;
    }
  }
LABEL_5:
  unint64_t v5 = 2;
LABEL_14:

  return v5;
}

- (FCCommand)initWithCoder:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    uint64_t v10 = "-[FCCommand initWithCoder:]";
    __int16 v11 = 2080;
    id v12 = "FCCommand.m";
    __int16 v13 = 1024;
    int v14 = 119;
    __int16 v15 = 2114;
    v16 = v4;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  unint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  int v7 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[FCCommand initWithCoder:]"];
  id v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    uint64_t v10 = "-[FCCommand encodeWithCoder:]";
    __int16 v11 = 2080;
    id v12 = "FCCommand.m";
    __int16 v13 = 1024;
    int v14 = 124;
    __int16 v15 = 2114;
    v16 = v4;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  unint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  int v7 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[FCCommand encodeWithCoder:]"];
  id v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end