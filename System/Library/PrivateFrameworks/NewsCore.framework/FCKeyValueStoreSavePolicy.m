@interface FCKeyValueStoreSavePolicy
+ (id)appBackgroundPolicyWithActivityMonitor:(id)a3 backgroundTaskable:(id)a4;
+ (id)defaultPolicy;
+ (id)throttlePolicyWithDelay:(double)a3;
+ (id)unthrottledPolicy;
- (void)scheduleSaveOnQueue:(id)a3 handler:(id)a4;
@end

@implementation FCKeyValueStoreSavePolicy

+ (id)appBackgroundPolicyWithActivityMonitor:(id)a3 backgroundTaskable:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[FCKeyValueStoreSavePolicyAppBackground alloc] initWithActivityMonitor:v6 backgroundTaskable:v5];

  return v7;
}

+ (id)throttlePolicyWithDelay:(double)a3
{
  v3 = [[FCKeyValueStoreSavePolicyThrottle alloc] initWithDelay:a3];
  return v3;
}

+ (id)defaultPolicy
{
  return (id)[a1 throttlePolicyWithDelay:5.0];
}

+ (id)unthrottledPolicy
{
  return (id)[a1 throttlePolicyWithDelay:0.0];
}

- (void)scheduleSaveOnQueue:(id)a3 handler:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    v13 = "-[FCKeyValueStoreSavePolicy scheduleSaveOnQueue:handler:]";
    __int16 v14 = 2080;
    v15 = "FCKeyValueStoreSavePolicy.m";
    __int16 v16 = 1024;
    int v17 = 47;
    __int16 v18 = 2114;
    v19 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v8 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v9 = *MEMORY[0x1E4F1C3B8];
  v10 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[FCKeyValueStoreSavePolicy scheduleSaveOnQueue:handler:]"];
  id v11 = [v8 exceptionWithName:v9 reason:v10 userInfo:0];

  objc_exception_throw(v11);
}

@end