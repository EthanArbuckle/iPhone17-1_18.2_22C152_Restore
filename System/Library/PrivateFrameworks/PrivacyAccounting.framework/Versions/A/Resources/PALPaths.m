@interface PALPaths
+ (NSString)defaultRootDirectory;
- (BOOL)createDirectories:(id *)a3;
- (NSString)biomeDirectory;
- (NSString)rootDirectory;
- (NSString)settingsFile;
- (PALPaths)initWithRootDirectory:(id)a3;
- (void)removeBiomeDirectory;
@end

@implementation PALPaths

+ (NSString)defaultRootDirectory
{
  return (NSString *)[@"/var/mobile/Library" stringByAppendingPathComponent:@"PrivacyAccounting"];
}

- (PALPaths)initWithRootDirectory:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PALPaths;
  v5 = [(PALPaths *)&v9 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    rootDirectory = v5->_rootDirectory;
    v5->_rootDirectory = v6;
  }
  return v5;
}

- (NSString)biomeDirectory
{
  v2 = [(PALPaths *)self rootDirectory];
  v3 = [v2 stringByAppendingPathComponent:@"Biome"];

  return (NSString *)v3;
}

- (NSString)settingsFile
{
  v2 = [(PALPaths *)self rootDirectory];
  v3 = [v2 stringByAppendingPathComponent:@"privacyaccountingd.plist"];

  return (NSString *)v3;
}

- (BOOL)createDirectories:(id *)a3
{
  v5 = +[NSFileManager defaultManager];
  v6 = [(PALPaths *)self rootDirectory];
  v30[0] = v6;
  v7 = [(PALPaths *)self biomeDirectory];
  v30[1] = v7;
  v8 = +[NSArray arrayWithObjects:v30 count:2];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v10)
  {
    id v12 = v10;
    uint64_t v13 = *(void *)v24;
    *(void *)&long long v11 = 138543362;
    long long v22 = v11;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        if ((objc_msgSend(v5, "fileExistsAtPath:", v15, v22, (void)v23) & 1) == 0)
        {
          unsigned int v16 = [v5 createDirectoryAtPath:v15 withIntermediateDirectories:1 attributes:0 error:a3];
          v17 = sub_1000055C0();
          v18 = v17;
          if (!v16)
          {
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              sub_100005770(v15, (uint64_t *)a3, v18);
            }

            v20 = sub_1000055C0();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
              sub_10000572C(v20);
            }

            BOOL v19 = 0;
            goto LABEL_19;
          }
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v22;
            uint64_t v28 = v15;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Created directory: %{public}@", buf, 0xCu);
          }
        }
      }
      id v12 = [v9 countByEnumeratingWithState:&v23 objects:v29 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  BOOL v19 = 1;
LABEL_19:

  return v19;
}

- (void)removeBiomeDirectory
{
  v3 = +[NSFileManager defaultManager];
  id v4 = [(PALPaths *)self biomeDirectory];
  id v8 = 0;
  unsigned __int8 v5 = [v3 removeItemAtPath:v4 error:&v8];
  id v6 = v8;

  if ((v5 & 1) == 0)
  {
    v7 = sub_1000055C0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000057FC(self, (uint64_t)v6, v7);
    }
  }
}

- (NSString)rootDirectory
{
  return self->_rootDirectory;
}

- (void).cxx_destruct
{
}

@end