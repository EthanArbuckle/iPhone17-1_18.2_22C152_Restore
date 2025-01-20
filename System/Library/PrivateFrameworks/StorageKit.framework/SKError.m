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
  if (frameworkBundle_onceToken != -1) {
    dispatch_once(&frameworkBundle_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)frameworkBundle__bundle;

  return (NSBundle *)v2;
}

void __26__SKError_frameworkBundle__block_invoke()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263F086E0];
  v1 = [NSURL fileURLWithPath:@"/System/Library/PrivateFrameworks/StorageKit.framework"];
  uint64_t v2 = [v0 bundleWithURL:v1];
  v3 = (void *)frameworkBundle__bundle;
  frameworkBundle__bundle = v2;

  if (!frameworkBundle__bundle)
  {
    v4 = +[SKBaseManager sharedManager];
    [v4 logEvent:@"com.apple.StorageKit.log.fault" eventPayloadBuilder:&__block_literal_global_28];

    v5 = SKGetOSLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      int v6 = 136315138;
      v7 = "+[SKError frameworkBundle]_block_invoke";
      _os_log_impl(&dword_23F40C000, v5, OS_LOG_TYPE_FAULT, "%s: FATAL ERROR: Failed to get the NSBundle of StorageKit framework", (uint8_t *)&v6, 0xCu);
    }
  }
}

id __26__SKError_frameworkBundle__block_invoke_2()
{
  v4[1] = *MEMORY[0x263EF8340];
  v3 = @"faultCode";
  v0 = base64Encode((uint64_t)"SKError.m", 55);
  v4[0] = v0;
  v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];

  return v1;
}

+ (id)localizedDescriptionForCode:(int64_t)a3
{
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", a3);
  v5 = [MEMORY[0x263F086E0] bundleForClass:a1];
  int v6 = [v5 localizedStringForKey:v4 value:0 table:@"SKError"];

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
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v10 = *MEMORY[0x263F07F80];
  v11[0] = a4;
  v5 = NSDictionary;
  id v6 = a4;
  id v7 = [v5 dictionaryWithObjects:v11 forKeys:&v10 count:1];
  uint64_t v8 = +[SKError errorWithCode:a3 disks:0 userInfo:v7];

  return v8;
}

+ (id)errorWithCode:(int64_t)a3 debugDescription:(id)a4 error:(id *)a5
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v12 = *MEMORY[0x263F07F80];
  v13[0] = a4;
  id v7 = NSDictionary;
  id v8 = a4;
  v9 = [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  uint64_t v10 = +[SKError errorWithCode:a3 disks:0 userInfo:v9];

  if (a5) {
    *a5 = v10;
  }

  return v10;
}

+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v10 = *MEMORY[0x263F08608];
  v11[0] = a4;
  v5 = NSDictionary;
  id v6 = a4;
  id v7 = [v5 dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v8 = +[SKError errorWithCode:a3 userInfo:v7];

  return v8;
}

+ (id)errorWithCode:(int64_t)a3 disks:(id)a4 userInfo:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    uint64_t v10 = v9;
    v11 = (void *)[v9 mutableCopy];
  }
  else
  {
    v11 = [MEMORY[0x263EFF9A0] dictionary];
  }
  uint64_t v12 = *MEMORY[0x263F08320];
  v13 = [v11 objectForKey:*MEMORY[0x263F08320]];

  if (!v13)
  {
    if (v8)
    {
      v14 = SKGetOSLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = [a1 localizedDescriptionForCode:a3];
        *(_DWORD *)buf = 136315650;
        v27 = "+[SKError errorWithCode:disks:userInfo:]";
        __int16 v28 = 2112;
        v29 = v15;
        __int16 v30 = 2112;
        id v31 = v8;
        _os_log_impl(&dword_23F40C000, v14, OS_LOG_TYPE_ERROR, "%s: %@ : %@", buf, 0x20u);
      }
      v16 = NSString;
      v17 = [a1 localizedDescriptionForCode:a3];
      v18 = commaSeparatedDiskListFromArray(v8);
      v19 = [v16 stringWithFormat:@"%@ : %@", v17, v18];
    }
    else
    {
      v19 = [a1 localizedDescriptionForCode:a3];
      uint64_t v22 = *MEMORY[0x263F07F80];
      v23 = [v11 objectForKeyedSubscript:*MEMORY[0x263F07F80]];

      v17 = SKGetOSLog();
      BOOL v24 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
      if (v23)
      {
        if (v24)
        {
          v25 = [v11 objectForKeyedSubscript:v22];
          *(_DWORD *)buf = 136315650;
          v27 = "+[SKError errorWithCode:disks:userInfo:]";
          __int16 v28 = 2112;
          v29 = v19;
          __int16 v30 = 2112;
          id v31 = v25;
          _os_log_impl(&dword_23F40C000, v17, OS_LOG_TYPE_ERROR, "%s: %@ [%@]", buf, 0x20u);
        }
      }
      else if (v24)
      {
        *(_DWORD *)buf = 136315394;
        v27 = "+[SKError errorWithCode:disks:userInfo:]";
        __int16 v28 = 2112;
        v29 = v19;
        _os_log_impl(&dword_23F40C000, v17, OS_LOG_TYPE_ERROR, "%s: %@", buf, 0x16u);
      }
    }

    if (v19) {
      [v11 setObject:v19 forKey:v12];
    }
  }
  v20 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.StorageKit" code:a3 userInfo:v11];

  return v20;
}

+ (id)nilWithError:(id)a3 error:(id *)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = SKGetOSLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_23F40C000, v6, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v8, 0xCu);
  }

  if (a4) {
    *a4 = v5;
  }

  return 0;
}

+ (BOOL)failWithError:(id)a3 error:(id *)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = SKGetOSLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_23F40C000, v6, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v8, 0xCu);
  }

  if (a4) {
    *a4 = v5;
  }

  return 0;
}

+ (id)errorWithPOSIXCode:(int)a3 debugDescription:(id)a4 error:(id *)a5
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = (void *)MEMORY[0x263F087E8];
  uint64_t v7 = *MEMORY[0x263F08438];
  uint64_t v8 = a3;
  id v9 = userInfoWithDebugDescription(a4);
  uint64_t v10 = [v6 errorWithDomain:v7 code:v8 userInfo:v9];

  v11 = SKGetOSLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v13 = 138412290;
    v14 = v10;
    _os_log_impl(&dword_23F40C000, v11, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v13, 0xCu);
  }

  if (a5) {
    *a5 = v10;
  }

  return v10;
}

+ (id)errorWithPOSIXCode:(int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  id v6 = objc_opt_class();

  return (id)[v6 errorWithPOSIXCode:v5 debugDescription:0 error:a4];
}

+ (id)errorWithOSStatus:(int)a3 debugDescription:(id)a4 error:(id *)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a4;
  uint64_t v8 = v7;
  id v9 = (void *)MEMORY[0x263F087E8];
  if ((a3 - 49152) > 0x6A)
  {
    uint64_t v10 = *MEMORY[0x263F08410];
    uint64_t v11 = a3;
  }
  else
  {
    uint64_t v10 = *MEMORY[0x263F08438];
    uint64_t v11 = a3 & 0xFFFF3FFF;
  }
  uint64_t v12 = userInfoWithDebugDescription(v7);
  int v13 = [v9 errorWithDomain:v10 code:v11 userInfo:v12];

  v14 = SKGetOSLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    int v16 = 138412290;
    v17 = v13;
    _os_log_impl(&dword_23F40C000, v14, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v16, 0xCu);
  }

  if (a5) {
    *a5 = v13;
  }

  return v13;
}

+ (id)errorWithOSStatus:(int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  id v6 = objc_opt_class();

  return (id)[v6 errorWithOSStatus:v5 debugDescription:0 error:a4];
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
  id v7 = userInfoWithDebugDescription(a4);
  uint64_t v8 = +[SKError errorWithCode:a3 userInfo:v7];
  id v9 = +[SKError nilWithError:v8 error:a5];

  return v9;
}

+ (id)nilWithSKErrorCode:(int64_t)a3 error:(id *)a4
{
  id v5 = +[SKError errorWithCode:a3 userInfo:0];
  id v6 = +[SKError nilWithError:v5 error:a4];

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
  id v7 = userInfoWithDebugDescription(a4);
  uint64_t v8 = +[SKError errorWithCode:a3 userInfo:v7];
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