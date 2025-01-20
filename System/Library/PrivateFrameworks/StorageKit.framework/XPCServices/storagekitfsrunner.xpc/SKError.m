@interface SKError
+ (BOOL)failWithError:(id)a3 error:(id *)a4;
+ (BOOL)failWithOSStatus:(int)a3 debugDescription:(id)a4 error:(id *)a5;
+ (BOOL)failWithOSStatus:(int)a3 error:(id *)a4;
+ (BOOL)failWithPOSIXCode:(int)a3 debugDescription:(id)a4 error:(id *)a5;
+ (BOOL)failWithPOSIXCode:(int)a3 error:(id *)a4;
+ (BOOL)failWithSKErrorCode:(int64_t)a3 debugDescription:(id)a4 error:(id *)a5;
+ (BOOL)failWithSKErrorCode:(int64_t)a3 error:(id *)a4;
+ (NSBundle)frameworkBundle;
+ (id)errorWithCode:(int64_t)a3 debugDescription:(id)a4;
+ (id)errorWithCode:(int64_t)a3 debugDescription:(id)a4 error:(id *)a5;
+ (id)errorWithCode:(int64_t)a3 disks:(id)a4 userInfo:(id)a5;
+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4;
+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4;
+ (id)errorWithOSStatus:(int)a3 debugDescription:(id)a4 error:(id *)a5;
+ (id)errorWithOSStatus:(int)a3 error:(id *)a4;
+ (id)errorWithPOSIXCode:(int)a3 debugDescription:(id)a4 error:(id *)a5;
+ (id)errorWithPOSIXCode:(int)a3 error:(id *)a4;
+ (id)localizedDescriptionForCode:(int64_t)a3;
+ (id)nilWithError:(id)a3 error:(id *)a4;
+ (id)nilWithOSStatus:(int)a3 debugDescription:(id)a4 error:(id *)a5;
+ (id)nilWithOSStatus:(int)a3 error:(id *)a4;
+ (id)nilWithPOSIXCode:(int)a3 debugDescription:(id)a4 error:(id *)a5;
+ (id)nilWithPOSIXCode:(int)a3 error:(id *)a4;
+ (id)nilWithSKErrorCode:(int64_t)a3 debugDescription:(id)a4 error:(id *)a5;
+ (id)nilWithSKErrorCode:(int64_t)a3 error:(id *)a4;
@end

@implementation SKError

+ (NSBundle)frameworkBundle
{
  if (qword_10000DBE8 != -1) {
    dispatch_once(&qword_10000DBE8, &stru_100008320);
  }
  v2 = (void *)qword_10000DBE0;

  return (NSBundle *)v2;
}

+ (id)localizedDescriptionForCode:(int64_t)a3
{
  v4 = +[NSString stringWithFormat:@"%ld", a3];
  v5 = +[NSBundle bundleForClass:a1];
  v6 = [v5 localizedStringForKey:v4 value:0 table:@"SKError"];

  id v7 = 0;
  if (([v6 isEqualToString:v4] & 1) == 0) {
    id v7 = v6;
  }

  return v7;
}

+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  return +[SKError errorWithCode:a3 disks:0 userInfo:a4];
}

+ (id)errorWithCode:(int64_t)a3 debugDescription:(id)a4
{
  NSErrorUserInfoKey v9 = NSDebugDescriptionErrorKey;
  id v10 = a4;
  id v5 = a4;
  v6 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  id v7 = +[SKError errorWithCode:a3 disks:0 userInfo:v6];

  return v7;
}

+ (id)errorWithCode:(int64_t)a3 debugDescription:(id)a4 error:(id *)a5
{
  NSErrorUserInfoKey v11 = NSDebugDescriptionErrorKey;
  id v12 = a4;
  id v7 = a4;
  v8 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  NSErrorUserInfoKey v9 = +[SKError errorWithCode:a3 disks:0 userInfo:v8];

  if (a5) {
    *a5 = v9;
  }

  return v9;
}

+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4
{
  NSErrorUserInfoKey v9 = NSUnderlyingErrorKey;
  id v10 = a4;
  id v5 = a4;
  v6 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  id v7 = +[SKError errorWithCode:a3 userInfo:v6];

  return v7;
}

+ (id)errorWithCode:(int64_t)a3 disks:(id)a4 userInfo:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    id v10 = v9;
    id v11 = [v9 mutableCopy];
  }
  else
  {
    id v11 = +[NSMutableDictionary dictionary];
  }
  id v12 = [v11 objectForKey:NSLocalizedDescriptionKey];

  if (!v12)
  {
    if (v8)
    {
      v13 = SKGetOSLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = [a1 localizedDescriptionForCode:a3];
        *(_DWORD *)buf = 136315650;
        v24 = "+[SKError errorWithCode:disks:userInfo:]";
        __int16 v25 = 2112;
        v26 = v14;
        __int16 v27 = 2112;
        id v28 = v8;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s: %@ : %@", buf, 0x20u);
      }
      v15 = [a1 localizedDescriptionForCode:a3];
      v16 = commaSeparatedDiskListFromArray(v8);
      v17 = +[NSString stringWithFormat:@"%@ : %@", v15, v16];
    }
    else
    {
      v17 = [a1 localizedDescriptionForCode:a3];
      v20 = [v11 objectForKeyedSubscript:NSDebugDescriptionErrorKey];

      v15 = SKGetOSLog();
      BOOL v21 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
      if (v20)
      {
        if (v21)
        {
          v22 = [v11 objectForKeyedSubscript:NSDebugDescriptionErrorKey];
          *(_DWORD *)buf = 136315650;
          v24 = "+[SKError errorWithCode:disks:userInfo:]";
          __int16 v25 = 2112;
          v26 = v17;
          __int16 v27 = 2112;
          id v28 = v22;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s: %@ [%@]", buf, 0x20u);
        }
      }
      else if (v21)
      {
        *(_DWORD *)buf = 136315394;
        v24 = "+[SKError errorWithCode:disks:userInfo:]";
        __int16 v25 = 2112;
        v26 = v17;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s: %@", buf, 0x16u);
      }
    }

    if (v17) {
      [v11 setObject:v17 forKey:NSLocalizedDescriptionKey];
    }
  }
  v18 = +[NSError errorWithDomain:@"com.apple.StorageKit" code:a3 userInfo:v11];

  return v18;
}

+ (id)nilWithError:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = SKGetOSLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v8, 0xCu);
  }

  if (a4) {
    *a4 = v5;
  }

  return 0;
}

+ (BOOL)failWithError:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = SKGetOSLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v8, 0xCu);
  }

  if (a4) {
    *a4 = v5;
  }

  return 0;
}

+ (id)errorWithPOSIXCode:(int)a3 debugDescription:(id)a4 error:(id *)a5
{
  uint64_t v6 = a3;
  id v7 = sub_100003110(a4);
  int v8 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v6 userInfo:v7];

  id v9 = SKGetOSLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    int v11 = 138412290;
    id v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v11, 0xCu);
  }

  if (a5) {
    *a5 = v8;
  }

  return v8;
}

+ (id)errorWithPOSIXCode:(int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v6 = objc_opt_class();

  return [v6 errorWithPOSIXCode:v5 debugDescription:0 error:a4];
}

+ (id)errorWithOSStatus:(int)a3 debugDescription:(id)a4 error:(id *)a5
{
  id v7 = a4;
  int v8 = v7;
  if ((a3 - 49152) > 0x6A)
  {
    NSErrorDomain v9 = NSOSStatusErrorDomain;
    uint64_t v10 = a3;
  }
  else
  {
    NSErrorDomain v9 = NSPOSIXErrorDomain;
    uint64_t v10 = a3 & 0xFFFF3FFF;
  }
  int v11 = sub_100003110(v7);
  id v12 = +[NSError errorWithDomain:v9 code:v10 userInfo:v11];

  v13 = SKGetOSLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    int v15 = 138412290;
    v16 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v15, 0xCu);
  }

  if (a5) {
    *a5 = v12;
  }

  return v12;
}

+ (id)errorWithOSStatus:(int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v6 = objc_opt_class();

  return [v6 errorWithOSStatus:v5 debugDescription:0 error:a4];
}

+ (id)nilWithPOSIXCode:(int)a3 error:(id *)a4
{
  id v4 = +[SKError errorWithPOSIXCode:*(void *)&a3 error:a4];
  return 0;
}

+ (id)nilWithPOSIXCode:(int)a3 debugDescription:(id)a4 error:(id *)a5
{
  id v5 = +[SKError errorWithPOSIXCode:*(void *)&a3 debugDescription:a4 error:a5];
  return 0;
}

+ (id)nilWithOSStatus:(int)a3 debugDescription:(id)a4 error:(id *)a5
{
  id v5 = +[SKError errorWithOSStatus:*(void *)&a3 debugDescription:a4 error:a5];
  return 0;
}

+ (id)nilWithOSStatus:(int)a3 error:(id *)a4
{
  id v4 = +[SKError errorWithOSStatus:*(void *)&a3 error:a4];
  return 0;
}

+ (id)nilWithSKErrorCode:(int64_t)a3 debugDescription:(id)a4 error:(id *)a5
{
  id v7 = sub_100003110(a4);
  int v8 = +[SKError errorWithCode:a3 userInfo:v7];
  NSErrorDomain v9 = +[SKError nilWithError:v8 error:a5];

  return v9;
}

+ (id)nilWithSKErrorCode:(int64_t)a3 error:(id *)a4
{
  id v5 = +[SKError errorWithCode:a3 userInfo:0];
  uint64_t v6 = +[SKError nilWithError:v5 error:a4];

  return v6;
}

+ (BOOL)failWithPOSIXCode:(int)a3 debugDescription:(id)a4 error:(id *)a5
{
  id v5 = +[SKError errorWithPOSIXCode:*(void *)&a3 debugDescription:a4 error:a5];
  return 0;
}

+ (BOOL)failWithPOSIXCode:(int)a3 error:(id *)a4
{
  id v4 = +[SKError errorWithPOSIXCode:*(void *)&a3 error:a4];
  return 0;
}

+ (BOOL)failWithOSStatus:(int)a3 debugDescription:(id)a4 error:(id *)a5
{
  id v5 = +[SKError errorWithOSStatus:*(void *)&a3 debugDescription:a4 error:a5];
  return 0;
}

+ (BOOL)failWithOSStatus:(int)a3 error:(id *)a4
{
  id v4 = +[SKError errorWithOSStatus:*(void *)&a3 error:a4];
  return 0;
}

+ (BOOL)failWithSKErrorCode:(int64_t)a3 debugDescription:(id)a4 error:(id *)a5
{
  id v7 = sub_100003110(a4);
  int v8 = +[SKError errorWithCode:a3 userInfo:v7];
  LOBYTE(a5) = +[SKError failWithError:v8 error:a5];

  return (char)a5;
}

+ (BOOL)failWithSKErrorCode:(int64_t)a3 error:(id *)a4
{
  id v5 = +[SKError errorWithCode:a3 userInfo:0];
  LOBYTE(a4) = +[SKError failWithError:v5 error:a4];

  return (char)a4;
}

@end