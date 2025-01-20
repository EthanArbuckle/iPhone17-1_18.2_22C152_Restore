@interface FMFUserNotificationManager
+ (id)sharedInstance;
- (FMFUserNotificationManager)init;
- (UNUserNotificationCenter)userNotificationCenter;
- (void)postConfirmationWithUUID:(id)a3 forFenceWithID:(id)a4 withText:(id)a5 forDate:(id)a6 completion:(id)a7;
- (void)postNotification:(id)a3 andCategory:(id)a4;
- (void)postReceiveTriggerWithUUID:(id)a3 forFenceWithID:(id)a4 friendID:(id)a5 withText:(id)a6 forDate:(id)a7 triggerLocation:(id)a8 fenceLocation:(id)a9 completion:(id)a10;
- (void)postTriggerWithUUID:(id)a3 forFenceWithID:(id)a4 followerID:(id)a5 withText:(id)a6 forDate:(id)a7 triggerLocation:(id)a8 fenceLocation:(id)a9 completion:(id)a10;
@end

@implementation FMFUserNotificationManager

+ (id)sharedInstance
{
  if (qword_1000BB698 != -1) {
    dispatch_once(&qword_1000BB698, &stru_1000A14C0);
  }
  v2 = (void *)qword_1000BB690;

  return v2;
}

- (FMFUserNotificationManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)FMFUserNotificationManager;
  v2 = [(FMFUserNotificationManager *)&v6 init];
  if (v2)
  {
    v3 = (UNUserNotificationCenter *)[objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:@"com.apple.findmy"];
    userNotificationCenter = v2->_userNotificationCenter;
    v2->_userNotificationCenter = v3;

    [(UNUserNotificationCenter *)v2->_userNotificationCenter setDelegate:v2];
  }
  return v2;
}

- (void)postReceiveTriggerWithUUID:(id)a3 forFenceWithID:(id)a4 friendID:(id)a5 withText:(id)a6 forDate:(id)a7 triggerLocation:(id)a8 fenceLocation:(id)a9 completion:(id)a10
{
  id v36 = a10;
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  v22 = [a3 UUIDString];
  v23 = +[NSString stringWithFormat:@"%@-%@", @"GEOFENCE_RECEIVE", v22];

  id v24 = objc_alloc_init((Class)UNMutableNotificationContent);
  [v24 setBody:v19];

  [v24 setTitle:&stru_1000A3938];
  [v24 setCategoryIdentifier:@"GEOFENCE_RECEIVE"];
  [v24 setDate:v18];

  [v24 setThreadIdentifier:v21];
  v25 = +[UNNotificationSound defaultSound];
  [v24 setSound:v25];

  [v24 setInterruptionLevel:2];
  id v39 = 0;
  v26 = +[NSKeyedArchiver archivedDataWithRootObject:v17 requiringSecureCoding:1 error:&v39];

  id v27 = v39;
  id v38 = v27;
  v28 = +[NSKeyedArchiver archivedDataWithRootObject:v16 requiringSecureCoding:1 error:&v38];

  id v29 = v38;
  v30 = +[FMFDataManager sharedInstance];
  v31 = [v30 followingHandleForServerId:v20];

  id v32 = objc_alloc_init((Class)NSMutableDictionary);
  [v32 fm_safeSetObject:v21 forKey:@"locationAlertId"];

  [v32 fm_safeSetObject:v20 forKey:@"friendServerId"];
  [v32 fm_safeSetObject:v26 forKey:@"fenceTriggerLocation"];
  [v32 fm_safeSetObject:v28 forKey:@"fenceLocation"];
  v33 = [v31 identifier];
  [v32 fm_safeSetObject:v33 forKey:@"friendHandle"];

  v34 = +[NSNumber numberWithBool:1];
  [v32 fm_safeSetObject:v34 forKey:@"ShouldForwardToCompanionUserInfoKey"];

  [v24 setUserInfo:v32];
  v35 = +[UNNotificationRequest requestWithIdentifier:v23 content:v24 trigger:0];
  [v35 setDestinations:7];
  [(UNUserNotificationCenter *)self->_userNotificationCenter addNotificationRequest:v35 withCompletionHandler:v36];
}

- (void)postTriggerWithUUID:(id)a3 forFenceWithID:(id)a4 followerID:(id)a5 withText:(id)a6 forDate:(id)a7 triggerLocation:(id)a8 fenceLocation:(id)a9 completion:(id)a10
{
  id v36 = a10;
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  v22 = [a3 UUIDString];
  v23 = +[NSString stringWithFormat:@"%@-%@", @"GEOFENCE_TRIGGER", v22];

  id v24 = objc_alloc_init((Class)UNMutableNotificationContent);
  [v24 setBody:v19];

  [v24 setTitle:&stru_1000A3938];
  [v24 setCategoryIdentifier:@"GEOFENCE_TRIGGER"];
  [v24 setDate:v18];

  [v24 setThreadIdentifier:v21];
  v25 = +[UNNotificationSound defaultSound];
  [v24 setSound:v25];

  [v24 setInterruptionLevel:2];
  id v39 = 0;
  v26 = +[NSKeyedArchiver archivedDataWithRootObject:v17 requiringSecureCoding:1 error:&v39];

  id v27 = v39;
  id v38 = v27;
  v28 = +[NSKeyedArchiver archivedDataWithRootObject:v16 requiringSecureCoding:1 error:&v38];

  id v29 = v38;
  v30 = +[FMFDataManager sharedInstance];
  v31 = [v30 followerHandleForServerId:v20];

  id v32 = objc_alloc_init((Class)NSMutableDictionary);
  [v32 fm_safeSetObject:v21 forKey:@"locationAlertId"];

  [v32 fm_safeSetObject:v20 forKey:@"friendServerId"];
  [v32 fm_safeSetObject:v26 forKey:@"fenceTriggerLocation"];
  [v32 fm_safeSetObject:v28 forKey:@"fenceLocation"];
  v33 = [v31 identifier];
  [v32 fm_safeSetObject:v33 forKey:@"friendHandle"];

  v34 = +[NSNumber numberWithBool:1];
  [v32 fm_safeSetObject:v34 forKey:@"ShouldForwardToCompanionUserInfoKey"];

  [v24 setUserInfo:v32];
  v35 = +[UNNotificationRequest requestWithIdentifier:v23 content:v24 trigger:0];
  [v35 setDestinations:7];
  [(UNUserNotificationCenter *)self->_userNotificationCenter addNotificationRequest:v35 withCompletionHandler:v36];
}

- (void)postConfirmationWithUUID:(id)a3 forFenceWithID:(id)a4 withText:(id)a5 forDate:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = [a3 UUIDString];
  id v17 = +[NSString stringWithFormat:@"%@-%@", @"GEOFENCE_CONFIRMATION", v16];

  id v18 = objc_alloc_init((Class)UNMutableNotificationContent);
  [v18 setBody:v14];

  [v18 setTitle:&stru_1000A3938];
  [v18 setCategoryIdentifier:@"GEOFENCE_CONFIRMATION"];
  [v18 setDate:v13];

  [v18 setThreadIdentifier:v15];
  id v19 = +[UNNotificationSound defaultSound];
  [v18 setSound:v19];

  v23[0] = @"locationAlertId";
  v23[1] = @"ShouldForwardToCompanionUserInfoKey";
  v24[0] = v15;
  id v20 = +[NSNumber numberWithBool:1];
  v24[1] = v20;
  id v21 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
  [v18 setUserInfo:v21];

  [v18 setInterruptionLevel:2];
  v22 = +[UNNotificationRequest requestWithIdentifier:v17 content:v18 trigger:0];
  [v22 setDestinations:7];
  [(UNUserNotificationCenter *)self->_userNotificationCenter addNotificationRequest:v22 withCompletionHandler:v12];
}

- (void)postNotification:(id)a3 andCategory:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[NSUUID UUID];
  v9 = [v8 UUIDString];
  v10 = +[NSString stringWithFormat:@"%@-%@", v6, v9];

  v11 = +[UNNotificationRequest requestWithIdentifier:v10 content:v7 trigger:0];

  id v12 = sub_100005560();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "FMFUserNotificationManager: handleAPSPushNotification message dictionary %@", buf, 0xCu);
  }

  [v11 setDestinations:7];
  [(UNUserNotificationCenter *)self->_userNotificationCenter addNotificationRequest:v11 withCompletionHandler:0];
}

- (UNUserNotificationCenter)userNotificationCenter
{
  return self->_userNotificationCenter;
}

- (void).cxx_destruct
{
}

@end