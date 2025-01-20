@interface RAPFileManager
+ (BOOL)haveContentsOfFilePathExpired:(id)a3 withSuggestedRetryDate:(id)a4;
+ (BOOL)haveContentsOfFilePathExpired:(id)a3 withSuggestedRetryDate:(id)a4 withTimeToLive:(double)a5;
+ (BOOL)removeAllItemsInDirectory:(id)a3;
+ (BOOL)removeItemAtFilePath:(id)a3;
+ (BOOL)saveData:(id)a3 toDirectory:(id)a4 filename:(id)a5;
+ (double)standardTimeToLive;
+ (id)baseFilePath:(id *)a3;
+ (id)baseLayoutFilePath;
+ (id)baseSubmissionFilePath;
+ (id)dataAtFileURL:(id)a3;
+ (unint64_t)numberOfItemsInDirectory:(id)a3;
@end

@implementation RAPFileManager

+ (id)baseFilePath:(id *)a3
{
  v4 = +[NSFileManager defaultManager];
  id v10 = 0;
  v5 = [v4 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:0 error:&v10];
  id v6 = v10;

  if (v5)
  {
    v7 = [v5 URLByAppendingPathComponent:@"com.apple.Maps" isDirectory:1];
    v8 = [v7 URLByAppendingPathComponent:@"ReportAProblem" isDirectory:1];
  }
  else
  {
    v8 = 0;
    if (a3) {
      *a3 = v6;
    }
  }

  return v8;
}

+ (id)baseLayoutFilePath
{
  uint64_t v6 = 0;
  v2 = [a1 baseFilePath:&v6];
  v3 = v2;
  v4 = 0;
  if (!v6)
  {
    v4 = [v2 URLByAppendingPathComponent:@"LayoutConfig" isDirectory:1];
  }

  return v4;
}

+ (id)baseSubmissionFilePath
{
  uint64_t v6 = 0;
  v2 = [a1 baseFilePath:&v6];
  v3 = v2;
  v4 = 0;
  if (!v6)
  {
    v4 = [v2 URLByAppendingPathComponent:@"ReportsOutbox" isDirectory:1];
  }

  return v4;
}

+ (BOOL)saveData:(id)a3 toDirectory:(id)a4 filename:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    id v10 = +[NSFileManager defaultManager];
    id v39 = 0;
    unsigned int v11 = [v10 createDirectoryAtURL:v8 withIntermediateDirectories:1 attributes:0 error:&v39];
    id v12 = v39;

    if (!v11)
    {
      BOOL v23 = 0;
LABEL_20:

      goto LABEL_21;
    }
    v13 = [v8 URLByAppendingPathComponent:v9];
    v14 = +[NSData data];
    id v38 = v12;
    unsigned __int8 v15 = [v14 writeToURL:v13 options:0 error:&v38];
    id v16 = v38;

    if (v15)
    {
      id v36 = v16;
      unsigned __int8 v17 = [v13 setResourceValue:&__kCFBooleanTrue forKey:NSURLIsExcludedFromBackupKey error:&v36];
      id v18 = v36;

      if ((v17 & 1) == 0)
      {
        v22 = +[NSFileManager defaultManager];
        id v35 = v18;
        [v22 removeItemAtURL:v13 error:&v35];
        v27 = v35;
LABEL_16:
        id v12 = v27;

        goto LABEL_17;
      }
      id v34 = v18;
      unsigned __int8 v19 = [v13 setResourceValue:NSURLFileProtectionCompleteUnlessOpen forKey:NSURLFileProtectionKey error:&v34];
      id v16 = v34;

      if (v19)
      {
        id v32 = v16;
        unsigned __int8 v20 = [v7 writeToURL:v13 options:0 error:&v32];
        id v18 = v32;

        v21 = +[NSFileManager defaultManager];
        v22 = v21;
        if (v20)
        {
          NSFileAttributeKey v42 = NSFileCreationDate;
          v29 = +[NSDate date];
          v43 = v29;
          BOOL v23 = 1;
          v24 = +[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
          v25 = [v13 path];
          id v30 = v18;
          [v22 setAttributes:v24 ofItemAtPath:v25 error:&v30];
          id v12 = v30;

          if (!v12)
          {
LABEL_19:

            goto LABEL_20;
          }
          v22 = sub_100109EF8();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v41 = v12;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Error %@ in writing creation date to file", buf, 0xCu);
          }
          BOOL v23 = 1;
LABEL_18:

          goto LABEL_19;
        }
        id v31 = v18;
        [v21 removeItemAtURL:v13 error:&v31];
        v27 = v31;
        goto LABEL_16;
      }
      v22 = +[NSFileManager defaultManager];
      id v33 = v16;
      [v22 removeItemAtURL:v13 error:&v33];
      v26 = v33;
    }
    else
    {
      v22 = +[NSFileManager defaultManager];
      id v37 = v16;
      [v22 removeItemAtURL:v13 error:&v37];
      v26 = v37;
    }
    id v12 = v26;

LABEL_17:
    BOOL v23 = 0;
    goto LABEL_18;
  }
  BOOL v23 = 0;
LABEL_21:

  return v23;
}

+ (unint64_t)numberOfItemsInDirectory:(id)a3
{
  id v3 = a3;
  v4 = +[NSFileManager defaultManager];
  id v11 = 0;
  v5 = [v4 contentsOfDirectoryAtURL:v3 includingPropertiesForKeys:0 options:0 error:&v11];
  id v6 = v11;

  id v7 = sub_100109EF8();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = [v5 count];
    *(_DWORD *)buf = 134218242;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Found %lu items at directory %@", buf, 0x16u);
  }

  id v9 = [v5 count];
  return (unint64_t)v9;
}

+ (BOOL)removeItemAtFilePath:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = a3;
  v4 = +[NSFileManager defaultManager];
  id v14 = 0;
  unsigned __int8 v5 = [v4 removeItemAtURL:v3 error:&v14];
  id v6 = v14;

  id v7 = [v3 URLByDeletingLastPathComponent];

  if (!+[RAPFileManager numberOfItemsInDirectory:v7])
  {
    id v8 = sub_100109EF8();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Deleting directory %@", buf, 0xCu);
    }

    id v9 = +[NSFileManager defaultManager];
    id v13 = v6;
    unsigned __int8 v10 = [v9 removeItemAtURL:v7 error:&v13];
    id v11 = v13;

    v5 &= v10;
    id v6 = v11;
  }

  return v5;
}

+ (BOOL)removeAllItemsInDirectory:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = +[NSFileManager defaultManager];
  id v6 = [v5 contentsOfDirectoryAtURL:v4 includingPropertiesForKeys:0 options:0 error:0];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    unsigned __int8 v11 = 1;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        if (v11) {
          unsigned __int8 v11 = [a1 removeItemAtFilePath:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        }
        else {
          unsigned __int8 v11 = 0;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
  else
  {
    unsigned __int8 v11 = 1;
  }

  return v11;
}

+ (BOOL)haveContentsOfFilePathExpired:(id)a3 withSuggestedRetryDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [a1 standardTimeToLive];
  LOBYTE(a1) = [a1 haveContentsOfFilePathExpired:v7 withSuggestedRetryDate:v6];

  return (char)a1;
}

+ (BOOL)haveContentsOfFilePathExpired:(id)a3 withSuggestedRetryDate:(id)a4 withTimeToLive:(double)a5
{
  id v7 = a4;
  id v16 = 0;
  id v15 = 0;
  [a3 getResourceValue:&v16 forKey:NSURLCreationDateKey error:&v15];
  id v8 = v16;
  id v9 = v15;
  if (v9)
  {
    uint64_t v10 = sub_100109EF8();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to get creation date with error %@", buf, 0xCu);
    }
    BOOL v11 = 1;
  }
  else
  {
    uint64_t v10 = [v8 dateByAddingTimeInterval:a5];
    id v12 = [v10 compare:v7];
    BOOL v11 = v12 == (id)-1;
    id v13 = sub_100109EF8();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      id v18 = v10;
      __int16 v19 = 2112;
      id v20 = v7;
      __int16 v21 = 1024;
      BOOL v22 = v12 == (id)-1;
      __int16 v23 = 2048;
      double v24 = a5;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "The latest date is %@, the retry date is %@, hasContentExpired = %d and the standard time to live is %f", buf, 0x26u);
    }
  }
  return v11;
}

+ (id)dataAtFileURL:(id)a3
{
  id v3 = a3;
  id v4 = +[NSFileManager defaultManager];
  unsigned __int8 v5 = [v3 path];

  id v6 = [v4 contentsAtPath:v5];

  return v6;
}

+ (double)standardTimeToLive
{
  return 604800.0;
}

@end