@interface RAPNotification
+ (BOOL)deleteNotificationWithID:(id)a3;
+ (BOOL)deleteNotificationWithID:(id)a3 error:(id *)a4;
+ (BOOL)isValidNotificationID:(id)a3;
+ (BOOL)shouldDeleteNotificationWithID:(id)a3;
+ (id)errorDomain;
+ (id)filenameForNotificationID:(id)a3;
+ (id)generateNotificationID;
+ (id)notificationCachePath;
@end

@implementation RAPNotification

+ (id)generateNotificationID
{
  v2 = +[NSUUID UUID];
  v3 = [v2 UUIDString];

  return v3;
}

+ (BOOL)isValidNotificationID:(id)a3
{
  return +[NSUUID isValidUUIDString:a3];
}

+ (id)filenameForNotificationID:(id)a3
{
  return +[NSString stringWithFormat:@"%@.pb", a3];
}

+ (id)notificationCachePath
{
  id v2 = objc_alloc((Class)NSFileManager);
  v3 = [v2 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.Maps"];

  if (v3)
  {
    v4 = [v3 URLByAppendingPathComponent:@"Library/Caches/"];
    v5 = +[NSFileManager defaultManager];
    unsigned int v6 = [v5 createDirectoryAtURL:v4 withIntermediateDirectories:1 attributes:0 error:0];

    v7 = 0;
    if (v6)
    {
      v7 = [v4 path];
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)shouldDeleteNotificationWithID:(id)a3
{
  id v4 = a3;
  if ([a1 isValidNotificationID:v4])
  {
    v5 = +[RAPNotification filenameForNotificationID:v4];
    unsigned int v6 = +[RAPNotification notificationCachePath];
    v7 = [v6 stringByAppendingPathComponent:v5];

    if (v7)
    {
      v8 = +[NSFileManager defaultManager];
      v9 = [v8 attributesOfItemAtPath:v7 error:0];

      if (v9)
      {
        v10 = [v9 objectForKeyedSubscript:NSFileCreationDate];
        if (v10)
        {
          v11 = +[NSDate date];
          [v11 timeIntervalSinceDate:v10];
          BOOL v13 = v12 > 63072000.0;
        }
        else
        {
          BOOL v13 = 1;
        }
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

+ (BOOL)deleteNotificationWithID:(id)a3
{
  return _[a1 deleteNotificationWithID:a3 error:0];
}

+ (BOOL)deleteNotificationWithID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([a1 isValidNotificationID:v6])
  {
    v7 = [a1 filenameForNotificationID:v6];
    v8 = +[RAPNotification notificationCachePath];
    v9 = [v8 stringByAppendingPathComponent:v7];

    if (v9)
    {
      v10 = +[NSFileManager defaultManager];
      unsigned __int8 v11 = [v10 removeItemAtPath:v9 error:a4];
    }
    else
    {
      if (!a4)
      {
        unsigned __int8 v11 = 0;
        goto LABEL_9;
      }
      v10 = [a1 errorDomain];
      +[NSError errorWithDomain:v10 code:-1 userInfo:0];
      unsigned __int8 v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_9:
    goto LABEL_10;
  }
  if (!a4)
  {
    unsigned __int8 v11 = 0;
    goto LABEL_11;
  }
  v7 = [a1 errorDomain];
  +[NSError errorWithDomain:v7 code:-2 userInfo:0];
  unsigned __int8 v11 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:

LABEL_11:
  return v11;
}

+ (id)errorDomain
{
  return @"com.apple.Maps.ReportAProblem";
}

@end