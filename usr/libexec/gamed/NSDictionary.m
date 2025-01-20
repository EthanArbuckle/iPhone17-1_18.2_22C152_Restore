@interface NSDictionary
+ (id)_gkDictionaryWithServerData:(id)a3 error:(id *)a4;
+ (id)_gkDictionaryWithServerData:(id)a3 serverStatus:(int64_t *)a4 error:(id *)a5;
+ (id)_gkDictionaryWithServerDataJson:(id)a3 error:(id *)a4;
+ (id)_gkDictionaryWithServerDataJson:(id)a3 serverStatus:(int64_t *)a4 error:(id *)a5;
- (id)_gkPlistXMLDataForClient:(id)a3 player:(id)a4;
@end

@implementation NSDictionary

- (id)_gkPlistXMLDataForClient:(id)a3 player:(id)a4
{
  if (a4)
  {
    v5 = [a3 appSessionForPlayer:a4];
    if (v5)
    {
      id v6 = [(NSDictionary *)self mutableCopy];
      [v6 setObject:v5 forKey:@"app-session"];
      v7 = +[NSPropertyListSerialization dataWithPropertyList:v6 format:100 options:0 error:0];
    }
    else
    {
      v7 = +[NSPropertyListSerialization dataWithPropertyList:self format:100 options:0 error:0];
    }
  }
  else
  {
    v7 = +[NSPropertyListSerialization dataWithPropertyList:self format:100 options:0 error:0];
  }

  return v7;
}

+ (id)_gkDictionaryWithServerData:(id)a3 serverStatus:(int64_t *)a4 error:(id *)a5
{
  id v7 = a3;
  if (!a4)
  {
    v8 = +[NSString stringWithFormat:@"Assertion failed"];
    v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/NSDictionary+GKDaemonAdditions.m"];
    id v10 = [v9 lastPathComponent];
    v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (serverStatus != ((void *)0))\n[%s (%s:%d)]", v8, "+[NSDictionary(GKDaemonAdditions) _gkDictionaryWithServerData:serverStatus:error:]", [v10 UTF8String], 41);

    +[NSException raise:@"GameKit Exception", @"%@", v11 format];
  }
  *a4 = 0;
  if (v7)
  {
    id v26 = 0;
    uint64_t v27 = 100;
    v12 = +[NSPropertyListSerialization propertyListWithData:v7 options:0 format:&v27 error:&v26];
    id v13 = v26;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v12)
      {
        v14 = [v12 objectForKey:GKRequestStatusKey];
        id v15 = [v14 integerValue];

        *a4 = (int64_t)v15;
        if (a5 && v15)
        {
          v16 = [v12 objectForKey:GKErrorMessageKey];
          uint64_t v17 = GKAuthenticateAlertKey;
          v18 = [v12 objectForKeyedSubscript:GKAuthenticateAlertKey];

          if (v18)
          {
            uint64_t v30 = v17;
            v19 = [v12 objectForKeyedSubscript:v17];
            v31 = v19;
            v20 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
            *a5 = +[NSError userErrorForServerCode:v15 reason:v16 userInfo:v20];
          }
          else
          {
            *a5 = +[NSError userErrorForServerCode:v15 reason:v16];
          }
        }
      }
      else if (a5)
      {
        *a5 = v13;
      }
    }
    else if (a5)
    {
      NSErrorUserInfoKey v32 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v33 = @"Received unexpected data format in server response.";
      v24 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      *a5 = +[NSError userErrorForCode:3 userInfo:v24];
    }
  }
  else
  {
    if (a5)
    {
      if (!os_log_GKGeneral) {
        id v21 = (id)GKOSLoggers();
      }
      v22 = os_log_GKError;
      if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
        sub_1000BD128(v22);
      }
      NSErrorUserInfoKey v28 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v29 = @"No data received from the server.";
      v23 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      *a5 = +[NSError userErrorForCode:3 userInfo:v23];
    }
    id v13 = 0;
    v12 = 0;
  }

  return v12;
}

+ (id)_gkDictionaryWithServerDataJson:(id)a3 serverStatus:(int64_t *)a4 error:(id *)a5
{
  id v7 = a3;
  if (!a4)
  {
    v8 = +[NSString stringWithFormat:@"Assertion failed"];
    v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/NSDictionary+GKDaemonAdditions.m"];
    id v10 = [v9 lastPathComponent];
    v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (serverStatus != ((void *)0))\n[%s (%s:%d)]", v8, "+[NSDictionary(GKDaemonAdditions) _gkDictionaryWithServerDataJson:serverStatus:error:]", [v10 UTF8String], 94);

    +[NSException raise:@"GameKit Exception", @"%@", v11 format];
  }
  *a4 = 0;
  if (!v7)
  {
    if (a5)
    {
      if (!os_log_GKGeneral) {
        id v21 = (id)GKOSLoggers();
      }
      v22 = os_log_GKError;
      if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
        sub_1000BD128(v22);
      }
      NSErrorUserInfoKey v27 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v28 = @"No data received from the server.";
      v23 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      *a5 = +[NSError userErrorForCode:3 userInfo:v23];
    }
    id v13 = 0;
    goto LABEL_17;
  }
  id v26 = 0;
  v12 = +[NSJSONSerialization JSONObjectWithData:v7 options:0 error:&v26];
  id v13 = v26;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v12)
    {
      v14 = [v12 objectForKey:GKRequestStatusKey];
      id v15 = [v14 integerValue];

      *a4 = (int64_t)v15;
      if (a5 && v15)
      {
        v16 = [v12 objectForKey:GKErrorMessageKey];
        uint64_t v17 = GKAuthenticateAlertKey;
        v18 = [v12 objectForKeyedSubscript:GKAuthenticateAlertKey];

        if (v18)
        {
          uint64_t v29 = v17;
          v19 = [v12 objectForKeyedSubscript:v17];
          uint64_t v30 = v19;
          v20 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
          *a5 = +[NSError userErrorForServerCode:v15 reason:v16 userInfo:v20];
        }
        else
        {
          *a5 = +[NSError userErrorForServerCode:v15 reason:v16];
        }
      }
      goto LABEL_24;
    }
    if (a5)
    {
      id v13 = v13;
      v12 = 0;
      *a5 = v13;
      goto LABEL_24;
    }
LABEL_17:
    v12 = 0;
    goto LABEL_24;
  }
  if (a5)
  {
    NSErrorUserInfoKey v31 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v32 = @"Received unexpected data format in server response.";
    v24 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    *a5 = +[NSError userErrorForCode:3 userInfo:v24];
  }
LABEL_24:

  return v12;
}

+ (id)_gkDictionaryWithServerData:(id)a3 error:(id *)a4
{
  uint64_t v6 = 0;
  v4 = [a1 _gkDictionaryWithServerData:a3 serverStatus:&v6 error:a4];

  return v4;
}

+ (id)_gkDictionaryWithServerDataJson:(id)a3 error:(id *)a4
{
  uint64_t v6 = 0;
  v4 = [a1 _gkDictionaryWithServerDataJson:a3 serverStatus:&v6 error:a4];

  return v4;
}

@end