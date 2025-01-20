@interface RMConfigurationStatusArchiver
+ (BOOL)_removeStatusFileAndParentIfEmptyAtURL:(id)a3 madeChanges:(BOOL *)a4 error:(id *)a5;
+ (BOOL)_removeStatusFileDirectoryAtURL:(id)a3 madeChanges:(BOOL *)a4 error:(id *)a5;
+ (BOOL)persistStatusForStoreIdentifier:(id)a3 declarationIdentifier:(id)a4 declarationServerToken:(id)a5 sourceIdentifier:(id)a6 validity:(BOOL)a7 reasons:(id)a8 error:(id *)a9;
+ (BOOL)removeAllStatusForStoreIdentifier:(id)a3 error:(id *)a4;
+ (BOOL)removeStatusForStoreIdentifier:(id)a3 declarationIdentifier:(id)a4 declarationServerToken:(id)a5 error:(id *)a6;
+ (BOOL)removeStatusForStoreIdentifier:(id)a3 declarationIdentifier:(id)a4 declarationServerToken:(id)a5 sourceIdentifier:(id)a6 error:(id *)a7;
+ (BOOL)validStatusForStoreIdentifier:(id)a3 declarationIdentifier:(id)a4 serverToken:(id)a5;
+ (id)_getStatusDirectoryURLWithStoreIdentifier:(id)a3 declarationIdentifier:(id)a4 declarationServerToken:(id)a5 createIfNeeded:(BOOL)a6;
+ (id)_getStatusFileURLForStoreIdentifier:(id)a3 declarationIdentifier:(id)a4 declarationServerToken:(id)a5 sourceIdentifier:(id)a6;
+ (id)fileSystemSafeCharacterSet;
+ (id)statusForStoreIdentifier:(id)a3 declarationIdentifier:(id)a4 serverToken:(id)a5;
@end

@implementation RMConfigurationStatusArchiver

+ (id)statusForStoreIdentifier:(id)a3 declarationIdentifier:(id)a4 serverToken:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = +[RMConfigurationStatusArchiver _getStatusDirectoryURLWithStoreIdentifier:a3 declarationIdentifier:v7 declarationServerToken:v8 createIfNeeded:0];
  v10 = +[NSFileManager defaultManager];
  v11 = [v10 contentsOfDirectoryAtURL:v9 includingPropertiesForKeys:0 options:1 error:0];

  if ([v11 count])
  {
    id v31 = v8;
    id v32 = v7;
    v33 = objc_opt_new();
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v29 = v11;
    id v12 = v11;
    id v13 = [v12 countByEnumeratingWithState:&v37 objects:v45 count:16];
    v30 = v9;
    if (v13)
    {
      id v14 = v13;
      id v15 = 0;
      uint64_t v16 = *(void *)v38;
      char v17 = 1;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          v19 = v15;
          if (*(void *)v38 != v16) {
            objc_enumerationMutation(v12);
          }
          uint64_t v20 = *(void *)(*((void *)&v37 + 1) + 8 * i);
          id v36 = v15;
          v21 = +[RMJSONUtilities deserializeJSONDictionaryAtFileURL:error:](RMJSONUtilities, "deserializeJSONDictionaryAtFileURL:error:", v20, &v36, v29);
          id v15 = v36;

          if (v21)
          {
            v22 = [v21 objectForKeyedSubscript:@"valid"];
            unsigned __int8 v23 = [v22 BOOLValue];

            v17 &= v23;
            v24 = [v21 objectForKeyedSubscript:@"reasons"];
            if (v24)
            {
              v34[0] = _NSConcreteStackBlock;
              v34[1] = 3221225472;
              v34[2] = sub_1000272B8;
              v34[3] = &unk_1000C57E0;
              id v35 = v33;
              [v24 enumerateObjectsUsingBlock:v34];
            }
          }
          else
          {
            v24 = +[RMLog configurationStatusArchiver];
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              id v44 = v15;
              _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Could not deserialize status: %{public}@", buf, 0xCu);
            }
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v37 objects:v45 count:16];
      }
      while (v14);
    }
    else
    {
      id v15 = 0;
      char v17 = 1;
    }

    v41[0] = @"identifier";
    v41[1] = @"server-token";
    id v8 = v31;
    id v7 = v32;
    v42[0] = v32;
    v42[1] = v31;
    v41[2] = @"valid";
    v26 = +[NSNumber numberWithBool:v17 & 1];
    v42[2] = v26;
    v27 = +[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:3];
    id v25 = [v27 mutableCopy];

    if ([v33 count]) {
      [v25 setObject:v33 forKeyedSubscript:@"reasons"];
    }

    v11 = v29;
    v9 = v30;
  }
  else
  {
    id v25 = 0;
  }

  return v25;
}

+ (BOOL)validStatusForStoreIdentifier:(id)a3 declarationIdentifier:(id)a4 serverToken:(id)a5
{
  v5 = +[RMConfigurationStatusArchiver statusForStoreIdentifier:a3 declarationIdentifier:a4 serverToken:a5];
  v6 = v5;
  if (v5)
  {
    id v7 = [v5 objectForKeyedSubscript:@"valid"];
    unsigned __int8 v8 = [v7 BOOLValue];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

+ (BOOL)persistStatusForStoreIdentifier:(id)a3 declarationIdentifier:(id)a4 declarationServerToken:(id)a5 sourceIdentifier:(id)a6 validity:(BOOL)a7 reasons:(id)a8 error:(id *)a9
{
  BOOL v10 = a7;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  v36[0] = @"identifier";
  v36[1] = @"server-token";
  v37[0] = v16;
  v37[1] = v17;
  v36[2] = @"valid";
  uint64_t v20 = +[NSNumber numberWithBool:v10];
  v37[2] = v20;
  v21 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:3];
  id v22 = [v21 mutableCopy];

  if (v19 && [v19 count])
  {
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1000276DC;
    v34[3] = &unk_1000C5808;
    id v35 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v19, "count"));
    id v23 = v35;
    [v19 enumerateObjectsUsingBlock:v34];
    [v22 setObject:v23 forKeyedSubscript:@"reasons"];
  }
  v24 = objc_msgSend(a1, "_getStatusFileURLForStoreIdentifier:declarationIdentifier:declarationServerToken:sourceIdentifier:", v15, v16, v17, v18, v18);
  id v33 = 0;
  unsigned __int8 v25 = +[RMJSONUtilities serializeJSONDictionary:v22 fileURL:v24 error:&v33];
  id v26 = v33;
  v27 = +[RMLog configurationStatusArchiver];
  v28 = v27;
  if (v25)
  {
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      sub_1000281E8();
    }

    v29 = +[RMSubscribedStatusKeyPathUpdater sharedUpdater];
    [v29 notifyStatusDidChangeForDeclarations];

    v30 = +[RMStoreController sharedController];
    [v30 observerStoresDidChange];
  }
  else
  {
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_100028250();
    }

    if (a9 && v26) {
      *a9 = v26;
    }
  }

  return v25;
}

+ (BOOL)removeStatusForStoreIdentifier:(id)a3 declarationIdentifier:(id)a4 declarationServerToken:(id)a5 error:(id *)a6
{
  unsigned __int8 v8 = +[RMConfigurationStatusArchiver _getStatusDirectoryURLWithStoreIdentifier:a3 declarationIdentifier:a4 declarationServerToken:a5 createIfNeeded:0];
  char v14 = 0;
  unsigned int v9 = [a1 _removeStatusFileDirectoryAtURL:v8 madeChanges:&v14 error:a6];
  if (v9) {
    BOOL v10 = v14 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    v11 = +[RMSubscribedStatusKeyPathUpdater sharedUpdater];
    [v11 notifyStatusDidChangeForDeclarations];

    id v12 = +[RMStoreController sharedController];
    [v12 observerStoresDidChange];
  }
  return v9;
}

+ (BOOL)removeStatusForStoreIdentifier:(id)a3 declarationIdentifier:(id)a4 declarationServerToken:(id)a5 sourceIdentifier:(id)a6 error:(id *)a7
{
  unsigned int v9 = [a1 _getStatusFileURLForStoreIdentifier:a3 declarationIdentifier:a4 declarationServerToken:a5 sourceIdentifier:a6];
  char v14 = 0;
  unsigned int v10 = [a1 _removeStatusFileAndParentIfEmptyAtURL:v9 madeChanges:&v14 error:a7];
  if (v10 && v14)
  {
    v11 = +[RMSubscribedStatusKeyPathUpdater sharedUpdater];
    [v11 notifyStatusDidChangeForDeclarations];

    id v12 = +[RMStoreController sharedController];
    [v12 observerStoresDidChange];
  }
  return v10;
}

+ (BOOL)removeAllStatusForStoreIdentifier:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = +[RMLocations statusDirectoryURLCreateIfNeeded:0];
  id v7 = [v6 URLByAppendingPathComponent:v5 isDirectory:1];

  char v18 = 0;
  unsigned __int8 v8 = +[NSFileManager defaultManager];
  unsigned int v9 = [v7 path];
  unsigned int v10 = [v8 fileExistsAtPath:v9 isDirectory:&v18];

  if (v10)
  {
    id v17 = 0;
    unsigned int v11 = [v8 removeItemAtURL:v7 error:&v17];
    id v12 = v17;
    id v13 = +[RMLog configurationStatusArchiver];
    char v14 = v13;
    if (v11)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        sub_1000282B8();
      }

      id v15 = +[RMStoreController sharedController];
      [v15 observerStoresDidChange];
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100028320();
      }

      if (a4 && v12)
      {
        id v12 = v12;
        *a4 = v12;
      }
    }
  }
  else
  {
    id v12 = +[RMLog configurationStatusArchiver];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_100028388();
    }
    LOBYTE(v11) = 1;
  }

  return v11;
}

+ (id)fileSystemSafeCharacterSet
{
  if (qword_1000DB0C8 != -1) {
    dispatch_once(&qword_1000DB0C8, &stru_1000C5828);
  }
  v2 = (void *)qword_1000DB0C0;

  return v2;
}

+ (id)_getStatusDirectoryURLWithStoreIdentifier:(id)a3 declarationIdentifier:(id)a4 declarationServerToken:(id)a5 createIfNeeded:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = +[RMLocations statusDirectoryURLCreateIfNeeded:v6];
  id v13 = [v12 URLByAppendingPathComponent:v11 isDirectory:1];

  char v14 = +[NSString stringWithFormat:@"%@-%@", v10, v9];

  id v15 = +[RMConfigurationStatusArchiver fileSystemSafeCharacterSet];
  id v16 = [v14 stringByAddingPercentEncodingWithAllowedCharacters:v15];

  id v17 = [v13 URLByAppendingPathComponent:v16 isDirectory:1];
  if (v6)
  {
    char v18 = +[NSFileManager defaultManager];
    id v23 = 0;
    unsigned __int8 v19 = [v18 createDirectoryAtURL:v17 withIntermediateDirectories:1 attributes:0 error:&v23];
    id v20 = v23;

    if ((v19 & 1) == 0)
    {
      v21 = +[RMLog configurationStatusArchiver];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_1000283F0();
      }
    }
  }

  return v17;
}

+ (id)_getStatusFileURLForStoreIdentifier:(id)a3 declarationIdentifier:(id)a4 declarationServerToken:(id)a5 sourceIdentifier:(id)a6
{
  id v9 = a6;
  id v10 = +[RMConfigurationStatusArchiver _getStatusDirectoryURLWithStoreIdentifier:a3 declarationIdentifier:a4 declarationServerToken:a5 createIfNeeded:1];
  id v11 = +[NSString stringWithFormat:@"%@.json", v9];

  id v12 = [v10 URLByAppendingPathComponent:v11 isDirectory:0];

  return v12;
}

+ (BOOL)_removeStatusFileDirectoryAtURL:(id)a3 madeChanges:(BOOL *)a4 error:(id *)a5
{
  id v7 = a3;
  char v17 = 0;
  unsigned __int8 v8 = +[NSFileManager defaultManager];
  id v9 = [v7 path];
  unsigned int v10 = [v8 fileExistsAtPath:v9 isDirectory:&v17];

  if (v10)
  {
    id v16 = 0;
    unsigned int v11 = [v8 removeItemAtURL:v7 error:&v16];
    id v12 = v16;
    id v13 = +[RMLog configurationStatusArchiver];
    char v14 = v13;
    if (v11)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        sub_100028458();
      }

      *a4 = 1;
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1000284C0();
      }

      if (a5 && v12)
      {
        id v12 = v12;
        *a5 = v12;
      }
    }
  }
  else
  {
    id v12 = +[RMLog configurationStatusArchiver];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_100028528();
    }
    LOBYTE(v11) = 1;
  }

  return v11;
}

+ (BOOL)_removeStatusFileAndParentIfEmptyAtURL:(id)a3 madeChanges:(BOOL *)a4 error:(id *)a5
{
  id v7 = a3;
  char v26 = 0;
  unsigned __int8 v8 = +[NSFileManager defaultManager];
  id v9 = [v7 path];
  unsigned int v10 = [v8 fileExistsAtPath:v9 isDirectory:&v26];

  if (v10)
  {
    id v25 = 0;
    unsigned int v11 = [v8 removeItemAtURL:v7 error:&v25];
    id v12 = v25;
    id v13 = +[RMLog configurationStatusArchiver];
    char v14 = v13;
    if (v11)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        sub_100028660();
      }

      id v15 = [v7 path];
      id v16 = [v15 stringByDeletingLastPathComponent];

      char v17 = [v8 contentsOfDirectoryAtPath:v16 error:0];
      char v18 = v17;
      if (v17 && ![v17 count])
      {
        v24 = v12;
        unsigned int v20 = [v8 removeItemAtPath:v16 error:&v24];
        unsigned __int8 v19 = v24;

        v21 = +[RMLog configurationStatusArchiver];
        id v22 = v21;
        if (v20)
        {
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
            sub_100028590();
          }
        }
        else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          sub_1000285F8();
        }
      }
      else
      {
        unsigned __int8 v19 = v12;
      }
      *a4 = 1;

      id v12 = v19;
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1000286C8();
      }

      if (a5 && v12)
      {
        id v12 = v12;
        *a5 = v12;
      }
    }
  }
  else
  {
    id v12 = +[RMLog configurationStatusArchiver];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_100028730();
    }
    LOBYTE(v11) = 1;
  }

  return v11;
}

@end