@interface PCStatusConditionStorage
+ (BOOL)isStatusConditionRegistered:(id)a3 error:(id *)a4;
+ (id)_makeApplicationSupportSubdirectory:(id)a3;
+ (id)baseURL;
+ (id)clearStatusCondition:(id)a3;
+ (id)fileURLForCondition:(id)a3;
+ (id)setStatusCondition:(id)a3;
+ (void)clearExpiredStatusConditions;
@end

@implementation PCStatusConditionStorage

+ (id)setStatusCondition:(id)a3
{
  id v3 = a3;
  v4 = +[PCStatusConditionStorage fileURLForCondition:v3];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 URLByDeletingLastPathComponent];
    v7 = +[NSFileManager defaultManager];
    v8 = [v6 path];
    id v20 = 0;
    [v7 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:&v20];
    id v9 = v20;

    if (!v9)
    {
      v10 = APLogForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = [v3 value];
        v12 = [v3 identifier];
        v13 = +[APIDAccountProvider privateUserAccount];
        v14 = [v13 iTunesDSID];
        *(_DWORD *)buf = 136643843;
        v22 = "+[PCStatusConditionStorage setStatusCondition:]";
        __int16 v23 = 2114;
        v24 = v11;
        __int16 v25 = 2114;
        v26 = v12;
        __int16 v27 = 2160;
        uint64_t v28 = 1752392040;
        __int16 v29 = 2112;
        v30 = v14;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{sensitive}s]: setting status condition %{public}@ for bundle %{public}@. DSID %{mask.hash}@", buf, 0x34u);
      }
      v15 = +[NSData data];
      id v19 = 0;
      [v15 writeToURL:v5 options:0 error:&v19];
      id v9 = v19;
    }
    id v16 = v9;

    v17 = v16;
  }
  else
  {
    NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
    CFStringRef v32 = @"Error creating URL.";
    id v16 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    v17 = +[NSError errorWithDomain:@"com.apple.ap.statusconditionserror" code:1001 userInfo:v16];
  }

  return v17;
}

+ (id)clearStatusCondition:(id)a3
{
  id v3 = a3;
  v4 = +[PCStatusConditionStorage fileURLForCondition:v3];
  if (v4)
  {
    v5 = +[NSFileManager defaultManager];
    v6 = [v4 path];
    unsigned int v7 = [v5 fileExistsAtPath:v6];

    v8 = APLogForCategory();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if (v7)
    {
      if (v9)
      {
        v10 = [v3 value];
        v11 = [v3 identifier];
        v12 = +[APIDAccountProvider privateUserAccount];
        v13 = [v12 iTunesDSID];
        *(_DWORD *)buf = 136643843;
        v24 = "+[PCStatusConditionStorage clearStatusCondition:]";
        __int16 v25 = 2114;
        v26 = v10;
        __int16 v27 = 2114;
        uint64_t v28 = v11;
        __int16 v29 = 2160;
        uint64_t v30 = 1752392040;
        __int16 v31 = 2112;
        CFStringRef v32 = v13;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{sensitive}s]: clearing status condition %{public}@ for bundle %{public}@. DSID %{mask.hash}@.", buf, 0x34u);
      }
      id v22 = 0;
      [v5 removeItemAtURL:v4 error:&v22];
      id v14 = v22;
    }
    else
    {
      if (v9)
      {
        v17 = [v3 value];
        v18 = [v3 identifier];
        id v19 = +[APIDAccountProvider privateUserAccount];
        id v20 = [v19 iTunesDSID];
        *(_DWORD *)buf = 136643843;
        v24 = "+[PCStatusConditionStorage clearStatusCondition:]";
        __int16 v25 = 2114;
        v26 = v17;
        __int16 v27 = 2114;
        uint64_t v28 = v18;
        __int16 v29 = 2160;
        uint64_t v30 = 1752392040;
        __int16 v31 = 2112;
        CFStringRef v32 = v20;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{sensitive}s]: status condition %{public}@ for bundle %{public}@ doesn't exist. DSID %{mask.hash}@", buf, 0x34u);
      }
      id v14 = 0;
    }
    id v15 = v14;

    id v16 = v15;
  }
  else
  {
    NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
    CFStringRef v34 = @"Error creating URL.";
    id v15 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    id v16 = +[NSError errorWithDomain:@"com.apple.ap.statusconditionserror" code:1001 userInfo:v15];
  }

  return v16;
}

+ (BOOL)isStatusConditionRegistered:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = +[PCStatusConditionStorage fileURLForCondition:v5];
  if (v6)
  {
    unsigned int v7 = +[NSFileManager defaultManager];
    v8 = [v6 path];
    unsigned __int8 v9 = [v7 fileExistsAtPath:v8];

    if (+[APSystemInternal isAppleInternalInstall]&& (v9 & 1) == 0)
    {
      id v10 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.AdPlatforms"];
      v11 = [v10 dictionaryForKey:@"ForcedStatusConditions"];
      if (v11)
      {
        v12 = [v5 value];
        v13 = [v11 objectForKeyedSubscript:v12];

        id v14 = [v5 identifier];
        unsigned __int8 v9 = [v13 isEqualToString:v14];
      }
      else
      {
        unsigned __int8 v9 = 0;
      }
    }
  }
  else
  {
    if (a4)
    {
      NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
      CFStringRef v18 = @"Error creating URL.";
      id v15 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      *a4 = +[NSError errorWithDomain:@"com.apple.ap.statusconditionserror" code:1001 userInfo:v15];
    }
    unsigned __int8 v9 = 0;
  }

  return v9;
}

+ (void)clearExpiredStatusConditions
{
  v2 = +[PCStatusConditionStorage baseURL];
  if (!v2)
  {
    id v3 = APLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "PCStatusConditionStorage returned a nil URL", buf, 2u);
    }
    goto LABEL_39;
  }
  id v3 = +[NSFileManager defaultManager];
  v4 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", NSURLIsDirectoryKey, NSURLContentModificationDateKey, 0);
  id v5 = [v3 enumeratorAtURL:v2 includingPropertiesForKeys:v4 options:4 errorHandler:&stru_100238ED8];
  CFStringRef v32 = +[NSDate date];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v39 objects:v49 count:16];
  if (!v7) {
    goto LABEL_38;
  }
  id v8 = v7;
  __int16 v29 = v4;
  uint64_t v30 = v2;
  __int16 v31 = v3;
  id v9 = 0;
  uint64_t v10 = *(void *)v40;
  id v33 = v6;
  while (2)
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v40 != v10) {
        objc_enumerationMutation(v6);
      }
      v12 = *(void **)(*((void *)&v39 + 1) + 8 * i);
      id v37 = 0;
      id v38 = 0;
      unsigned __int8 v13 = [v12 getResourceValue:&v38 forKey:NSURLIsDirectoryKey error:&v37];
      id v14 = v38;
      id v15 = v37;

      if ((v13 & 1) == 0)
      {
        if (!v15)
        {
          id v9 = 0;
          goto LABEL_23;
        }
        NSErrorUserInfoKey v17 = APLogForCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          __int16 v23 = [v12 path];
          v24 = [v15 localizedDescription];
          *(_DWORD *)buf = 141558530;
          uint64_t v44 = 1752392040;
          __int16 v45 = 2112;
          v46 = v23;
          __int16 v47 = 2114;
          v48 = v24;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "An error occurred getting isDirectory from url:%{mask.hash}@. %{public}@", buf, 0x20u);
        }
        id v18 = v15;
        goto LABEL_36;
      }
      if ([v14 BOOLValue])
      {
        id v9 = v15;
        goto LABEL_23;
      }
      id v35 = 0;
      id v36 = 0;
      unsigned __int8 v16 = [v12 getResourceValue:&v36 forKey:NSURLContentModificationDateKey error:&v35];
      NSErrorUserInfoKey v17 = v36;
      id v18 = v35;

      if (v16)
      {
        if (v17)
        {
          [v32 timeIntervalSinceDate:v17];
          if (v19 <= *(double *)&PCStatusConditionStorage_expectedLifeInterval)
          {
            id v9 = v18;
          }
          else
          {
            id v34 = v18;
            [v31 removeItemAtURL:v12 error:&v34];
            id v9 = v34;

            if (v9)
            {
              id v20 = APLogForCategory();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                v21 = [v12 path];
                id v22 = [v9 localizedDescription];
                *(_DWORD *)buf = 141558530;
                uint64_t v44 = 1752392040;
                __int16 v45 = 2112;
                v46 = v21;
                __int16 v47 = 2114;
                v48 = v22;
                _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "An error occurred attempting to removeItemAtUrl:%{mask.hash}@. %{public}@", buf, 0x20u);
              }
            }
          }
          goto LABEL_22;
        }
        NSErrorUserInfoKey v17 = APLogForCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          __int16 v25 = [v12 path];
          *(_DWORD *)buf = 138412290;
          uint64_t v44 = (uint64_t)v25;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "An error occured retrieving modified date from url %@", buf, 0xCu);
        }
LABEL_36:

        id v9 = v18;
        id v6 = v33;
        goto LABEL_37;
      }
      if (v18)
      {
        v26 = APLogForCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          __int16 v27 = [v12 path];
          uint64_t v28 = [v18 localizedDescription];
          *(_DWORD *)buf = 141558530;
          uint64_t v44 = 1752392040;
          __int16 v45 = 2112;
          v46 = v27;
          __int16 v47 = 2114;
          v48 = v28;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "An error occurred getting date from url:%{mask.hash}@. %{public}@", buf, 0x20u);
        }
        goto LABEL_36;
      }
      id v9 = 0;
LABEL_22:

      id v6 = v33;
LABEL_23:
    }
    id v8 = [v6 countByEnumeratingWithState:&v39 objects:v49 count:16];
    if (v8) {
      continue;
    }
    break;
  }
LABEL_37:

  v4 = v29;
  v2 = v30;
  id v3 = v31;
LABEL_38:

LABEL_39:
}

+ (id)baseURL
{
  if (PCStatusConditionStorage_baseURL)
  {
    id v2 = (id)PCStatusConditionStorage_baseURL;
  }
  else
  {
    id v2 = +[PCStatusConditionStorage _makeApplicationSupportSubdirectory:@"adsc"];
  }

  return v2;
}

+ (id)fileURLForCondition:(id)a3
{
  id v3 = [a3 storageRepresentation];
  v4 = [v3 sha1];
  id v5 = [v4 substringToIndex:2];
  id v6 = [v4 substringWithRange:2, 2];
  id v7 = [v4 substringFromIndex:4];
  id v8 = +[NSString stringWithFormat:@"%@/%@/%@", v5, v6, v7];
  id v9 = +[PCStatusConditionStorage baseURL];
  uint64_t v10 = [v9 URLByAppendingPathComponent:v8 isDirectory:0];

  if (!v10)
  {
    v11 = APLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "PCStatusConditionStorage returned a nil URL", buf, 2u);
    }
  }

  return v10;
}

+ (id)_makeApplicationSupportSubdirectory:(id)a3
{
  id v3 = a3;
  v4 = +[NSFileManager defaultManager];
  id v5 = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1);
  id v6 = [v5 lastObject];

  v24[0] = v6;
  v24[1] = @"com.apple.ap.promotedcontentd";
  id v7 = +[NSArray arrayWithObjects:v24 count:2];
  id v8 = +[NSURL fileURLWithPathComponents:v7];

  if (v3)
  {
    uint64_t v9 = [v8 URLByAppendingPathComponent:v3 isDirectory:1];

    id v8 = (void *)v9;
  }
  id v17 = 0;
  unsigned __int8 v10 = [v4 createDirectoryAtURL:v8 withIntermediateDirectories:1 attributes:0 error:&v17];
  id v11 = v17;
  if (v10)
  {
    id v12 = v8;
  }
  else
  {
    unsigned __int8 v13 = APLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = [v11 localizedFailureReason];
      id v15 = [v11 userInfo];
      *(_DWORD *)buf = 138478339;
      double v19 = v8;
      __int16 v20 = 2114;
      v21 = v14;
      __int16 v22 = 2114;
      __int16 v23 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to create Application Support subdirectory: %{private}@ %{public}@ %{public}@", buf, 0x20u);
    }
    id v12 = 0;
  }

  return v12;
}

@end