@interface TPSInstalledAppsValidation
- (TPSInstalledAppInfo)appInfo;
- (TPSInstalledAppsValidation)initWithInstalledAppInfo:(id)a3;
- (id)description;
- (void)setAppInfo:(id)a3;
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSInstalledAppsValidation

- (TPSInstalledAppsValidation)initWithInstalledAppInfo:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSInstalledAppsValidation;
  v6 = [(TPSInstalledAppsValidation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_appInfo, a3);
  }

  return v7;
}

- (void)validateWithCompletion:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, BOOL, void))a3;
  id v5 = [(TPSInstalledAppsValidation *)self appInfo];
  v6 = [v5 bundleID];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F223C8]);
    objc_super v9 = [(TPSInstalledAppsValidation *)self appInfo];
    v10 = [v9 bundleID];
    v11 = [v8 initWithBundleIdentifier:v10 allowPlaceholder:1 error:0];

    if ([MEMORY[0x1E4FAF3F8] isRecordValid:v11])
    {
      v12 = [v11 shortVersionString];
      v13 = [(TPSInstalledAppsValidation *)self appInfo];
      v14 = [v13 minVersion];
      v15 = [(TPSInstalledAppsValidation *)self appInfo];
      v16 = [v15 maxVersion];
      id v17 = v12;
      id v18 = v14;
      id v19 = v16;
      if (![v17 length]
        || [v18 length] && objc_msgSend(v17, "compare:options:", v18, 64) == -1)
      {
        BOOL v20 = 0;
      }
      else if ([v19 length])
      {
        BOOL v20 = [v17 compare:v19 options:64] != 1;
      }
      else
      {
        BOOL v20 = 1;
      }
    }
    else
    {
      BOOL v20 = 0;
    }
    v25 = [MEMORY[0x1E4FAF480] targeting];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      [(TPSInstalledAppsValidation *)self validateWithCompletion:v25];
    }
  }
  else
  {
    v11 = [MEMORY[0x1E4FAF480] targeting];
    BOOL v20 = 1;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v21 = objc_opt_class();
      id v22 = v21;
      v23 = [(TPSInstalledAppsValidation *)self appInfo];
      v24 = [v23 debugDescription];
      int v26 = 138412802;
      v27 = v21;
      __int16 v28 = 2112;
      v29 = v24;
      __int16 v30 = 1024;
      int v31 = 1;
      _os_log_impl(&dword_1E4492000, v11, OS_LOG_TYPE_INFO, "%@ - no bundleID specified in appInfo: %@, Valid: %d", (uint8_t *)&v26, 0x1Cu);
    }
  }

  v4[2](v4, v20, 0);
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(TPSInstalledAppsValidation *)self appInfo];
  uint64_t v7 = [v6 debugDescription];
  id v8 = [v3 stringWithFormat:@"<%@: %p appInfo = %@>", v5, self, v7];;

  return v8;
}

- (TPSInstalledAppInfo)appInfo
{
  return self->_appInfo;
}

- (void)setAppInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)validateWithCompletion:(NSObject *)a3 .cold.1(void *a1, char a2, NSObject *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v6 = objc_opt_class();
  id v7 = v6;
  id v8 = [a1 appInfo];
  objc_super v9 = [v8 debugDescription];
  int v10 = 138412802;
  v11 = v6;
  __int16 v12 = 2112;
  v13 = v9;
  __int16 v14 = 1024;
  int v15 = a2 & 1;
  _os_log_debug_impl(&dword_1E4492000, a3, OS_LOG_TYPE_DEBUG, "%@ - checking installed app: %@, Valid: %d", (uint8_t *)&v10, 0x1Cu);
}

@end