@interface HAPNotification
+ (id)typeToString:(unint64_t)a3;
+ (void)postNotification:(id)a3 object:(id)a4 userInfo:(id)a5;
@end

@implementation HAPNotification

+ (void)postNotification:(id)a3 object:(id)a4 userInfo:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = sub_100083F74();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = sub_100083FD0(0);
    int v13 = 138544130;
    v14 = v11;
    __int16 v15 = 2112;
    id v16 = v7;
    __int16 v17 = 2112;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%{public}@CoreHAP - Sending notification %@ with object %@ and userInfo %@", (uint8_t *)&v13, 0x2Au);
  }
  v12 = +[NSNotificationCenter defaultCenter];
  [v12 postNotificationName:v7 object:v8 userInfo:v9];
}

+ (id)typeToString:(unint64_t)a3
{
  if (a3 - 1 >= 4)
  {
    v3 = +[NSString stringWithFormat:@"Unknown Reachability Notification type %ld", a3];
  }
  else
  {
    v3 = off_100273268[a3 - 1];
  }

  return v3;
}

@end