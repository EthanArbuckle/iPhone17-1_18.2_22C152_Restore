@interface SAUtilities
+ (id)breakCommaSeparatedStringToComponents:(id)a3;
+ (id)createCommaSeparatedString:(id)a3;
+ (id)splitArray:(id)a3 into:(int)a4;
+ (int)killSADaemon;
+ (int)loadSADaemon;
+ (void)getFileSize:(id)a3 reply:(id)a4;
@end

@implementation SAUtilities

+ (id)splitArray:(id)a3 into:(int)a4
{
  id v5 = a3;
  if ((unint64_t)[v5 count] < a4)
  {
    v6 = SALog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10002D4E0(v5, a4, v6);
    }
LABEL_15:

    v7 = 0;
    goto LABEL_16;
  }
  if (a4 <= 0)
  {
    v6 = SALog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10002D58C(a4, v6);
    }
    goto LABEL_15;
  }
  v7 = objc_opt_new();
  int v8 = [v5 count];
  uint64_t v9 = 0;
  int v10 = 0;
  uint64_t v11 = v8 / a4;
  do
  {
    if ((int)v11 >= v8) {
      int v12 = v8;
    }
    else {
      int v12 = v11;
    }
    if (v10 >= a4 - 1) {
      int v12 = v8;
    }
    v13 = objc_msgSend(v5, "subarrayWithRange:", v9, v12);
    [v7 addObject:v13];

    v9 += v11;
    ++v10;
    v8 -= v11;
  }
  while (a4 != v10);
LABEL_16:

  return v7;
}

+ (void)getFileSize:(id)a3 reply:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, id, id))a4;
  v7 = +[NSURL fileURLWithPath:v5];
  id v15 = 0;
  id v14 = 0;
  [v7 getResourceValue:&v15 forKey:NSURLFileAllocatedSizeKey error:&v14];
  id v8 = v15;
  id v9 = v14;
  if (v9) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v8 == 0;
  }
  if (v10)
  {
    uint64_t v11 = SALog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      if (v9)
      {
        v13 = +[NSString stringWithFormat:@" with error %@", v9];
      }
      else
      {
        v13 = &stru_10004D5B8;
      }
      *(_DWORD *)buf = 138412546;
      id v17 = v5;
      __int16 v18 = 2112;
      v19 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to get physical size for file (%@)%@", buf, 0x16u);
      if (v9) {
    }
      }
    id v12 = 0;
  }
  else
  {
    id v12 = [v8 unsignedLongValue];
  }
  v6[2](v6, v12, v9);
}

+ (id)createCommaSeparatedString:(id)a3
{
  v3 = [a3 allObjects];
  v4 = [v3 sortedArrayUsingSelector:"localizedCaseInsensitiveCompare:"];

  id v5 = [v4 componentsJoinedByString:@","];

  return v5;
}

+ (id)breakCommaSeparatedStringToComponents:(id)a3
{
  v3 = [a3 componentsSeparatedByString:@","];
  v4 = +[NSSet setWithArray:v3];

  return v4;
}

+ (int)killSADaemon
{
  v2 = objc_opt_new();
  [v2 setLaunchPath:@"/usr/bin/pkill"];
  [v2 setArguments:&off_10004FBF8];
  [v2 launchAndReturnError:0];
  [v2 waitUntilExit];
  int v3 = [v2 terminationStatus];

  return v3;
}

+ (int)loadSADaemon
{
  v2 = objc_opt_new();
  [v2 setLaunchPath:@"/bin/launchctl"];
  [v2 setArguments:&off_10004FC10];
  [v2 launchAndReturnError:0];
  [v2 waitUntilExit];
  int v3 = [v2 terminationStatus];

  return v3;
}

@end