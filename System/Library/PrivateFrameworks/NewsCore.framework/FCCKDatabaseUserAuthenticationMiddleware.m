@interface FCCKDatabaseUserAuthenticationMiddleware
- (FCCKDatabaseUserAuthenticationMiddleware)init;
- (_BYTE)initWithPrivateDataSyncingEnabled:(unsigned char *)result;
- (int64_t)database:(id)a3 willEnqueueOperation:(id)a4 error:(id *)a5;
@end

@implementation FCCKDatabaseUserAuthenticationMiddleware

- (_BYTE)initWithPrivateDataSyncingEnabled:(unsigned char *)result
{
  if (result)
  {
    v3.receiver = result;
    v3.super_class = (Class)FCCKDatabaseUserAuthenticationMiddleware;
    result = objc_msgSendSuper2(&v3, sel_init);
    if (result) {
      result[8] = a2;
    }
  }
  return result;
}

- (FCCKDatabaseUserAuthenticationMiddleware)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCCKDatabaseUserAuthenticationMiddleware init]";
    __int16 v9 = 2080;
    v10 = "FCCKDatabaseUserAuthenticationMiddleware.m";
    __int16 v11 = 1024;
    int v12 = 21;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  objc_super v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCCKDatabaseUserAuthenticationMiddleware init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (int64_t)database:(id)a3 willEnqueueOperation:(id)a4 error:(id *)a5
{
  if (NSClassFromString(&cfstr_Xctest.isa)) {
    return 0;
  }
  if (self) {
    return !self->_privateDataSyncingEnabled;
  }
  return 1;
}

@end