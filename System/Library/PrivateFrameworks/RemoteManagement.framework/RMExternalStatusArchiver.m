@interface RMExternalStatusArchiver
+ (BOOL)persistStatusWithStoreIdentifier:(id)a3 status:(id)a4 error:(id *)a5;
+ (id)_getPublishedStatusFileURLWithStoreIdentifier:(id)a3;
+ (id)statusWithStoreIdentifier:(id)a3 error:(id *)a4;
@end

@implementation RMExternalStatusArchiver

+ (id)statusWithStoreIdentifier:(id)a3 error:(id *)a4
{
  v5 = +[RMExternalStatusArchiver _getPublishedStatusFileURLWithStoreIdentifier:a3];
  id v17 = 0;
  v6 = +[RMJSONUtilities deserializeJSONDictionaryAtFileURL:v5 error:&v17];
  id v7 = v17;
  if (v6)
  {
    if (![v6 count])
    {
      id v10 = v6;
      goto LABEL_21;
    }
    v8 = [v6 objectForKeyedSubscript:@"ValidStatus"];
    v9 = [v6 objectForKeyedSubscript:@"ErrorStatus"];
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      +[NSMutableDictionary dictionaryWithDictionary:v8];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10002C6C0;
      v15[3] = &unk_1000C4ED8;
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      id v16 = v10;
      [v9 enumerateKeysAndObjectsUsingBlock:v15];
      id v11 = v16;
    }
    else
    {
      v13 = +[RMLog externalStatusArchiver];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10002CDD0(v13);
      }

      if (!a4)
      {
        id v10 = 0;
LABEL_20:

        goto LABEL_21;
      }
      id v11 = +[RMErrorUtilities createInternalError];
      if (v11)
      {
        id v11 = v11;
        id v10 = 0;
        *a4 = v11;
      }
      else
      {
        id v10 = 0;
      }
    }

    goto LABEL_20;
  }
  v12 = +[RMLog externalStatusArchiver];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_10002CD5C();
  }

  id v10 = 0;
  if (a4 && v7)
  {
    id v10 = 0;
    *a4 = v7;
  }
LABEL_21:

  return v10;
}

+ (BOOL)persistStatusWithStoreIdentifier:(id)a3 status:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v7 count]);
  +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v7 count]);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10002CA04;
  v20[3] = &unk_1000C59A8;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v21 = v10;
  id v11 = v9;
  id v22 = v11;
  [v7 enumerateKeysAndObjectsUsingBlock:v20];

  v12 = +[RMExternalStatusArchiver _getPublishedStatusFileURLWithStoreIdentifier:v8];

  v23[0] = @"ValidStatus";
  v23[1] = @"ErrorStatus";
  v24[0] = v11;
  v24[1] = v10;
  v13 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
  id v19 = 0;
  unsigned __int8 v14 = +[RMJSONUtilities serializeJSONDictionary:v13 fileURL:v12 error:&v19];
  id v15 = v19;
  id v16 = +[RMLog externalStatusArchiver];
  id v17 = v16;
  if (v14)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_10002CE14();
    }
  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10002CE88();
    }

    if (a5 && v15) {
      *a5 = v15;
    }
  }

  return v14;
}

+ (id)_getPublishedStatusFileURLWithStoreIdentifier:(id)a3
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
      id v11 = +[RMLog externalStatusArchiver];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10002CEFC();
      }
    }
  }
  v12 = [v5 URLByAppendingPathComponent:@"PublishedStatus.json" isDirectory:0];

  return v12;
}

@end