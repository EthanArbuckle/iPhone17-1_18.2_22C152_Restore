@interface RMManagementPropertiesArchiver
+ (BOOL)persistPropertiesWithStoreIdentifier:(id)a3 properties:(id)a4 error:(id *)a5;
+ (id)_getManagementPropertiesFileURLWithStoreIdentifier:(id)a3;
+ (id)propertiesWithStoreIdentifier:(id)a3 error:(id *)a4;
@end

@implementation RMManagementPropertiesArchiver

+ (id)propertiesWithStoreIdentifier:(id)a3 error:(id *)a4
{
  v5 = +[RMManagementPropertiesArchiver _getManagementPropertiesFileURLWithStoreIdentifier:a3];
  id v11 = 0;
  v6 = +[RMJSONUtilities deserializeJSONDictionaryAtFileURL:v5 error:&v11];
  id v7 = v11;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    v9 = +[RMLog managementPropertiesArchiver];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000487C8();
    }

    if (a4 && v7) {
      *a4 = v7;
    }
  }

  return v6;
}

+ (BOOL)persistPropertiesWithStoreIdentifier:(id)a3 properties:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = +[RMManagementPropertiesArchiver _getManagementPropertiesFileURLWithStoreIdentifier:a3];
  id v20 = 0;
  unsigned __int8 v9 = +[RMJSONUtilities serializeJSONDictionary:v7 fileURL:v8 error:&v20];
  id v10 = v20;
  id v11 = v10;
  if (v9)
  {
    v12 = +[RMLog managementPropertiesArchiver];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_10004883C();
    }

    BOOL v13 = 1;
LABEL_5:
    id v14 = v11;
    goto LABEL_18;
  }
  if ([v10 code] != (id)513
    || !+[RMLocations fixFilePermissionsForURL:v8])
  {
LABEL_13:
    v17 = +[RMLog managementPropertiesArchiver];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100048924();
    }

    BOOL v13 = 0;
    if (a5 && v11)
    {
      id v14 = v11;
      BOOL v13 = 0;
      *a5 = v14;
      goto LABEL_18;
    }
    goto LABEL_5;
  }
  id v19 = v11;
  unsigned int v15 = +[RMJSONUtilities serializeJSONDictionary:v7 fileURL:v8 error:&v19];
  id v14 = v19;

  if (!v15)
  {
    id v11 = v14;
    goto LABEL_13;
  }
  v16 = +[RMLog managementPropertiesArchiver];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_1000488B0();
  }

  BOOL v13 = 1;
LABEL_18:

  return v13;
}

+ (id)_getManagementPropertiesFileURLWithStoreIdentifier:(id)a3
{
  id v3 = a3;
  v4 = +[RMLocations statusDirectoryURLCreateIfNeeded:1];
  v5 = [v4 URLByAppendingPathComponent:v3 isDirectory:1];

  char v15 = 0;
  v6 = +[NSFileManager defaultManager];
  id v7 = [v5 path];
  unsigned __int8 v8 = [v6 fileExistsAtPath:v7 isDirectory:&v15];

  if ((v8 & 1) == 0)
  {
    id v14 = 0;
    unsigned __int8 v9 = [v6 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:&v14];
    id v10 = v14;
    if ((v9 & 1) == 0)
    {
      id v11 = +[RMLog managementPropertiesArchiver];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100048998();
      }
    }
  }
  v12 = [v5 URLByAppendingPathComponent:@"ManagementProperties.json" isDirectory:0];

  return v12;
}

@end