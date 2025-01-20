@interface SDLogArchiveUnit
+ (id)logArchiveUnitWithDictionary:(id)a3;
- (NSMutableDictionary)archive_arguments;
- (void)logArchiveOverride:(id)a3;
- (void)setArchive_arguments:(id)a3;
@end

@implementation SDLogArchiveUnit

+ (id)logArchiveUnitWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___SDLogArchiveUnit;
  id v5 = [[objc_msgSendSuper2(&v9, "alloc") init];
  v6 = v5;
  if (v4 && v5)
  {
    id v7 = [v4 mutableCopy];
    [v6 setArchive_arguments:v7];
  }

  return v6;
}

- (void)logArchiveOverride:(id)a3
{
  id v4 = a3;
  id v5 = [(SDLogArchiveUnit *)self archive_arguments];

  if (v5)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v18 = v4;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v20;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          v12 = [(SDLogArchiveUnit *)self archive_arguments];
          v13 = [v6 objectForKeyedSubscript:v11];
          [v12 setValue:v13 forKey:v11];

          v14 = sub_10002820C();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            v15 = [v6 objectForKeyedSubscript:v11];
            *(_DWORD *)buf = 138412546;
            uint64_t v24 = v11;
            __int16 v25 = 2112;
            v26 = v15;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Updated %@ to %@", buf, 0x16u);
          }
          v16 = +[SDResourceManager sharedResourceManager];
          v17 = [v6 objectForKeyedSubscript:v11];
          [v16 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Updated %@ to %@", v11, v17 category msg];
        }
        id v8 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v8);
    }

    id v4 = v18;
  }
}

- (NSMutableDictionary)archive_arguments
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setArchive_arguments:(id)a3
{
}

- (void).cxx_destruct
{
}

@end