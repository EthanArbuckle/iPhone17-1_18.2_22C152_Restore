@interface FCManagedResourceConfiguration
- (FCManagedResourceConfiguration)init;
- (FCManagedResourceConfiguration)initWithResourceID:(id)a3 refreshRate:(int64_t)a4;
- (NSString)resourceID;
- (int64_t)refreshRate;
@end

@implementation FCManagedResourceConfiguration

- (void).cxx_destruct
{
}

- (FCManagedResourceConfiguration)initWithResourceID:(id)a3 refreshRate:(int64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "resourceID");
    *(_DWORD *)buf = 136315906;
    v15 = "-[FCManagedResourceConfiguration initWithResourceID:refreshRate:]";
    __int16 v16 = 2080;
    v17 = "FCManagedResourceConfiguration.m";
    __int16 v18 = 1024;
    int v19 = 20;
    __int16 v20 = 2114;
    v21 = v11;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if ((a4 & 0x8000000000000000) == 0) {
      goto LABEL_6;
    }
  }
  else if ((a4 & 0x8000000000000000) == 0)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "refreshRate >= 0");
    *(_DWORD *)buf = 136315906;
    v15 = "-[FCManagedResourceConfiguration initWithResourceID:refreshRate:]";
    __int16 v16 = 2080;
    v17 = "FCManagedResourceConfiguration.m";
    __int16 v18 = 1024;
    int v19 = 21;
    __int16 v20 = 2114;
    v21 = v12;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  v13.receiver = self;
  v13.super_class = (Class)FCManagedResourceConfiguration;
  v7 = [(FCManagedResourceConfiguration *)&v13 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    resourceID = v7->_resourceID;
    v7->_resourceID = (NSString *)v8;

    v7->_refreshRate = a4;
  }

  return v7;
}

- (NSString)resourceID
{
  return self->_resourceID;
}

- (int64_t)refreshRate
{
  return self->_refreshRate;
}

- (FCManagedResourceConfiguration)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    uint64_t v8 = "-[FCManagedResourceConfiguration init]";
    __int16 v9 = 2080;
    v10 = "FCManagedResourceConfiguration.m";
    __int16 v11 = 1024;
    int v12 = 15;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCManagedResourceConfiguration init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

@end