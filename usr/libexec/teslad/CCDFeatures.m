@interface CCDFeatures
+ (BOOL)isAppleInternal;
+ (BOOL)sentinelExistsAtPath:(id)a3;
+ (id)depConfigurationEnrollmentURLStringWithURLString:(id)a3;
+ (id)depDeviceSerialNumberWithValue:(id)a3;
+ (id)depProvisionalEnrollmentURLStringWithURLString:(id)a3;
+ (id)depRemoveEnrollmentURLStringWithURLString:(id)a3;
+ (id)depResponseContentTypeFromContentType:(id)a3;
+ (id)depResponseDataFromData:(id)a3;
+ (id)deviceRegisterURLStringWithURLString:(id)a3;
+ (id)stringForDefaultsKey:(id)a3;
@end

@implementation CCDFeatures

+ (BOOL)isAppleInternal
{
  return _os_variant_has_internal_ui("com.apple.DeviceManagementClient", a2);
}

+ (id)stringForDefaultsKey:(id)a3
{
  id v4 = a3;
  if ([a1 isAppleInternal])
  {
    v5 = +[NSUserDefaults standardUserDefaults];
    v6 = [v5 stringForKey:v4];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)sentinelExistsAtPath:(id)a3
{
  id v4 = a3;
  if ([a1 isAppleInternal])
  {
    v5 = +[NSFileManager defaultManager];
    unsigned __int8 v6 = [v5 fileExistsAtPath:v4];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

+ (id)depConfigurationEnrollmentURLStringWithURLString:(id)a3
{
  uint64_t v4 = kCCURLUserDefaultsKey;
  id v5 = a3;
  unsigned __int8 v6 = [a1 stringForDefaultsKey:v4];
  v7 = v6;
  if (!v6) {
    unsigned __int8 v6 = v5;
  }
  id v8 = v6;

  return v8;
}

+ (id)depDeviceSerialNumberWithValue:(id)a3
{
  id v4 = a3;
  id v5 = [a1 stringForDefaultsKey:@"MCTeslaDeviceSerialNumber"];
  unsigned __int8 v6 = v5;
  if (!v5) {
    id v5 = v4;
  }
  id v7 = v5;

  return v7;
}

+ (id)depProvisionalEnrollmentURLStringWithURLString:(id)a3
{
  id v4 = a3;
  id v5 = [a1 stringForDefaultsKey:@"MCTeslaProvisionalEnrollmentURL"];
  unsigned __int8 v6 = v5;
  if (!v5) {
    id v5 = v4;
  }
  id v7 = v5;

  return v7;
}

+ (id)depRemoveEnrollmentURLStringWithURLString:(id)a3
{
  id v4 = a3;
  id v5 = [a1 stringForDefaultsKey:@"MCTeslaUnenrollURL"];
  unsigned __int8 v6 = v5;
  if (!v5) {
    id v5 = v4;
  }
  id v7 = v5;

  return v7;
}

+ (id)deviceRegisterURLStringWithURLString:(id)a3
{
  id v4 = a3;
  id v5 = [a1 stringForDefaultsKey:@"MCTeslaDeviceRegisterURL"];
  unsigned __int8 v6 = v5;
  if (!v5) {
    id v5 = v4;
  }
  id v7 = v5;

  return v7;
}

+ (id)depResponseContentTypeFromContentType:(id)a3
{
  id v4 = a3;
  if ([a1 sentinelExistsAtPath:kCCFakeDEPJSONResponsePath]) {
    id v5 = @"application/json";
  }
  else {
    id v5 = (__CFString *)v4;
  }

  return v5;
}

+ (id)depResponseDataFromData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = kCCFakeDEPJSONResponsePath;
  if ([a1 sentinelExistsAtPath:kCCFakeDEPJSONResponsePath])
  {
    unsigned __int8 v6 = *(NSObject **)(DEPLogObjects() + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      uint64_t v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Overriding cloud config with file at path: %{public}@", (uint8_t *)&v9, 0xCu);
    }
    uint64_t v7 = +[NSData dataWithContentsOfFile:v5];

    id v4 = (id)v7;
  }

  return v4;
}

@end