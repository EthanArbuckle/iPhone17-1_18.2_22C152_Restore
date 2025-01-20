@interface NPSPrefPlistSizeUtil
+ (id)_domainPlistPathFor:(id)a3 inContainer:(id)a4;
+ (unint64_t)prefSizeFor:(id)a3 inContainer:(id)a4;
+ (unint64_t)sizeForPlistAtPath:(id)a3;
@end

@implementation NPSPrefPlistSizeUtil

+ (unint64_t)sizeForPlistAtPath:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3
    || ([MEMORY[0x1E4F28CB8] defaultManager],
        v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 fileExistsAtPath:v3],
        v4,
        !v5))
  {
    v11 = nps_framework_log;
    if (os_log_type_enabled((os_log_t)nps_framework_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v3;
      _os_log_impl(&dword_1BA426000, v11, OS_LOG_TYPE_DEFAULT, "Unable to locate prefs for domain %@", buf, 0xCu);
    }
    goto LABEL_11;
  }
  v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v16 = 0;
  v7 = [v6 attributesOfItemAtPath:v3 error:&v16];
  id v8 = v16;

  if (!v7 || v8)
  {
    v12 = (void *)nps_framework_log;
    if (os_log_type_enabled((os_log_t)nps_framework_log, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      v14 = [v8 localizedDescription];
      *(_DWORD *)buf = 138412546;
      id v18 = v3;
      __int16 v19 = 2112;
      v20 = v14;
      _os_log_impl(&dword_1BA426000, v13, OS_LOG_TYPE_DEFAULT, "Unable to extract attributes for %@ : %@", buf, 0x16u);
    }
LABEL_11:
    unint64_t v10 = 0;
    goto LABEL_12;
  }
  v9 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F28390]];
  unint64_t v10 = [v9 unsignedLongLongValue];

LABEL_12:
  return v10;
}

+ (unint64_t)prefSizeFor:(id)a3 inContainer:(id)a4
{
  int v5 = [a1 _domainPlistPathFor:a3 inContainer:a4];
  unint64_t v6 = [a1 sizeForPlistAtPath:v5];

  return v6;
}

+ (id)_domainPlistPathFor:(id)a3 inContainer:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = (id)[@"/" stringByAppendingPathComponent:@"var/mobile"];
  if (v6)
  {
    uint64_t v8 = [v6 copy];

    id v7 = (id)v8;
  }
  v9 = [v7 stringByAppendingPathComponent:@"Library/Preferences"];

  unint64_t v10 = [v5 stringByAppendingString:@".plist"];
  v11 = [v9 stringByAppendingPathComponent:v10];

  v12 = nps_framework_log;
  if (os_log_type_enabled((os_log_t)nps_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412802;
    id v15 = v5;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    __int16 v19 = v11;
    _os_log_impl(&dword_1BA426000, v12, OS_LOG_TYPE_DEFAULT, "Domain: %@ Container: %@ Path: %@", (uint8_t *)&v14, 0x20u);
  }

  return v11;
}

@end