@interface MSDMacAppPkg
+ (BOOL)isMacApp:(id)a3;
+ (id)codeSignaturePath:(id)a3;
@end

@implementation MSDMacAppPkg

+ (BOOL)isMacApp:(id)a3
{
  id v3 = a3;
  char v23 = 0;
  v4 = +[NSBundle bundleWithPath:v3];
  v5 = v4;
  if (!v4)
  {
    v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000CB800();
    }
    goto LABEL_22;
  }
  v6 = [v4 infoDictionary];

  if (!v6)
  {
    v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000CB880();
    }
LABEL_22:
    BOOL v17 = 0;
    goto LABEL_23;
  }
  v7 = [v5 infoDictionary];
  v8 = [v7 objectForKey:@"CFBundleSupportedPlatforms"];

  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      v9 = v8;
      id v10 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v20;
        while (2)
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(v9);
            }
            if (objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "isEqualToString:", @"MacOSX", (void)v19))
            {

              BOOL v17 = 1;
              v8 = v9;
              goto LABEL_23;
            }
          }
          id v11 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
    }
  }
  v14 = +[NSFileManager defaultManager];
  v15 = [v3 stringByAppendingPathComponent:@"Contents/MacOS"];
  unsigned __int8 v16 = [v14 fileExistsAtPath:v15 isDirectory:&v23];
  if (v23) {
    BOOL v17 = v16;
  }
  else {
    BOOL v17 = 0;
  }

LABEL_23:
  return v17;
}

+ (id)codeSignaturePath:(id)a3
{
  id v3 = [a3 stringByAppendingPathComponent:@"Contents"];
  v4 = [v3 stringByAppendingPathComponent:@"_CodeSignature"];

  return v4;
}

@end