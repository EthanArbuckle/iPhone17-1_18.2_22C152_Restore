@interface FCAccessCheckResult
- (BOOL)canAccess;
- (FCAccessCheckResult)init;
- (FCAccessCheckResult)initWithCanAccess:(BOOL)a3 blockedReason:(unint64_t)a4;
- (unint64_t)blockedReason;
@end

@implementation FCAccessCheckResult

- (FCAccessCheckResult)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCAccessCheckResult init]";
    __int16 v9 = 2080;
    v10 = "FCAccessChecker.m";
    __int16 v11 = 1024;
    int v12 = 17;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCAccessCheckResult init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCAccessCheckResult)initWithCanAccess:(BOOL)a3 blockedReason:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)FCAccessCheckResult;
  result = [(FCAccessCheckResult *)&v7 init];
  if (result)
  {
    result->_canAccess = a3;
    result->_blockedReason = a4;
  }
  return result;
}

- (BOOL)canAccess
{
  return self->_canAccess;
}

- (unint64_t)blockedReason
{
  return self->_blockedReason;
}

@end