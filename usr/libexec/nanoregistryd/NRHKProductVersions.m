@interface NRHKProductVersions
+ (id)UDIDeviceIdentifierForProductWithName:(id)a3 error:(id *)a4;
+ (id)_productBuildVersion;
+ (id)_updateVersionForMajorVersion:(id)a3 productBuildVersion:(id)a4;
+ (id)majorVersionForProductWithName:(id)a3 error:(id *)a4;
+ (id)versionForProductWithName:(id)a3 error:(id *)a4;
@end

@implementation NRHKProductVersions

+ (id)versionForProductWithName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 isEqualToString:@"ElectrocardiogramRecording"])
  {
    id v15 = 0;
    v7 = [a1 majorVersionForProductWithName:v6 error:&v15];
    id v8 = v15;
    if (v8)
    {
      v9 = nr_daemon_log();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

      if (v10)
      {
        v11 = nr_daemon_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_1000FAE14();
        }
      }
      if (a4) {
        *a4 = v8;
      }
    }
    v12 = [a1 _productBuildVersion];
    v13 = [a1 _updateVersionForMajorVersion:v7 productBuildVersion:v12];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)_productBuildVersion
{
  v2 = +[NRHKProductUtilities systemRootDirectory];
  v3 = [v2 stringByAppendingString:@"/System/Library/CoreServices/SystemVersion.plist"];
  v4 = +[NSURL fileURLWithPath:v3];

  id v12 = 0;
  v5 = +[NSDictionary dictionaryWithContentsOfURL:v4 error:&v12];
  id v6 = v12;
  if (v6)
  {
    v7 = nr_daemon_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v8)
    {
      v9 = nr_daemon_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1000FAE7C();
      }
    }
    BOOL v10 = 0;
  }
  else
  {
    BOOL v10 = [v5 objectForKey:@"ProductBuildVersion"];
  }

  return v10;
}

+ (id)majorVersionForProductWithName:(id)a3 error:(id *)a4
{
  if ([a3 isEqualToString:@"ElectrocardiogramRecording"])
  {
    id v5 = objc_alloc_init((Class)HKHealthStore);
    id v13 = 0;
    id v6 = +[HKElectrocardiogramActiveAlgorithmVersion versionWithHealthStore:v5 error:&v13];
    id v7 = v13;
    if (v7)
    {
      BOOL v8 = nr_daemon_log();
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

      if (v9)
      {
        BOOL v10 = nr_daemon_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_1000FAEE4((uint64_t)v7, v10);
        }
      }
      if (a4) {
        *a4 = v7;
      }
    }
    if (v6)
    {
      v11 = [v6 stringValue];
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)_updateVersionForMajorVersion:(id)a3 productBuildVersion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v7 = +[NSString stringWithFormat:@"%@.%@", v5, v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)UDIDeviceIdentifierForProductWithName:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (![v7 isEqualToString:@"ElectrocardiogramRecording"]) {
    goto LABEL_14;
  }
  id v8 = HKElectrocardiogramRecordingV1iOSDeviceIdentifierPortion;
  id v17 = 0;
  BOOL v9 = [a1 majorVersionForProductWithName:v7 error:&v17];
  id v10 = v17;
  if (v10)
  {
    v4 = nr_daemon_log();
    BOOL v11 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

    if (v11)
    {
      v4 = nr_daemon_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_1000FAE14();
      }
    }
    if (a4) {
      *a4 = v10;
    }
  }
  id v12 = [a1 _productBuildVersion];
  id v13 = [a1 _updateVersionForMajorVersion:v9 productBuildVersion:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    v14 = +[NSString stringWithFormat:@"%@%@", @"(10)", v13];
    v4 = +[NSString stringWithFormat:@"%@%@", v8, v14];

    int v15 = 0;
  }
  else
  {
    int v15 = 1;
  }

  if (v15) {
LABEL_14:
  }
    v4 = 0;

  return v4;
}

@end