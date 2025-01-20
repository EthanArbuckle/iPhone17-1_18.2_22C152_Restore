@interface FMFFence
+ (BOOL)isString:(id)a3 equalToString:(id)a4;
+ (BOOL)shouldPostForStatus:(id)a3 givenPreviousStatus:(id)a4;
+ (id)cacheDirectory;
+ (id)ckRecordZoneNameForRecordName:(id)a3;
+ (id)invalidLocation;
+ (id)pathToTriggerDataForFenceWithID:(id)a3;
+ (id)statusByWindowStartDateByFenceID;
- (BOOL)isStatusValidAtDate:(id)a3 reason:(id *)a4;
- (BOOL)previouslyAtLocationForDate:(id)a3;
- (BOOL)shouldPostForStatus:(id)a3 atDate:(id)a4 reason:(id *)a5;
- (CKRecordID)ckRecordID;
- (CKRecordZoneID)ckRecordZoneID;
- (NSArray)_recipients;
- (NSString)ckRecordZoneName;
- (id)followedGivenName;
- (id)followedName;
- (id)followerGivenName;
- (id)followerName;
- (id)infoByWindowStartDate:(id)a3;
- (id)localizedNotificationTextForStatus:(id)a3 atDate:(id)a4;
- (id)statusForDate:(id)a3;
- (id)triggerForRepeatedFenceBeforeAcceptance;
- (void)clearStaleFenceTrigger;
- (void)postConfirmationNotificationWithUUID:(id)a3 atDate:(id)a4;
- (void)postReceiveTriggerNotificationWithUUID:(id)a3 forStatus:(id)a4 atDate:(id)a5 triggerLocation:(id)a6;
- (void)postTriggerNotificationWithUUID:(id)a3 forStatus:(id)a4 atDate:(id)a5 triggerLocation:(id)a6;
- (void)receiveTriggerWithUUID:(id)a3 status:(id)a4 atDate:(id)a5 triggerLocation:(id)a6 completion:(id)a7;
- (void)setStatus:(id)a3 forDate:(id)a4;
- (void)setTriggerForRepeatedFenceBeforeAccpetanceWithTriggerStatus:(id)a3 date:(id)a4 location:(id)a5;
- (void)triggerWithUUID:(id)a3 status:(id)a4 atDate:(id)a5 triggerLocation:(id)a6 completion:(id)a7;
- (void)updateFromRecord:(id)a3;
@end

@implementation FMFFence

+ (id)cacheDirectory
{
  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v3 = [v2 firstObject];

  v4 = +[NSBundle mainBundle];
  v5 = [v4 bundleIdentifier];
  v6 = [v3 stringByAppendingPathComponent:v5];

  v7 = [v6 stringByAppendingPathComponent:@"FMFFenceTriggerManagerCache"];

  return v7;
}

+ (id)pathToTriggerDataForFenceWithID:(id)a3
{
  id v4 = a3;
  v5 = [a1 cacheDirectory];
  v6 = [v5 stringByAppendingPathComponent:@"triggerData"];

  v7 = [v6 stringByAppendingPathComponent:v4];

  v8 = [v7 stringByAppendingPathComponent:@"data"];

  return v8;
}

- (void)receiveTriggerWithUUID:(id)a3 status:(id)a4 atDate:(id)a5 triggerLocation:(id)a6 completion:(id)a7
{
  id v15 = a4;
  id v12 = a5;
  v13 = (void (**)(id, void))a7;
  [(FMFFence *)self postReceiveTriggerNotificationWithUUID:a3 forStatus:v15 atDate:v12 triggerLocation:a6];
  v14 = [(FMFFence *)self trigger];
  LODWORD(a3) = [v14 isEqualToString:FMFFenceTriggerScheduled];

  if (a3) {
    [(FMFFence *)self setStatus:v15 forDate:v12];
  }
  if (v13) {
    v13[2](v13, 0);
  }
}

- (void)triggerWithUUID:(id)a3 status:(id)a4 atDate:(id)a5 triggerLocation:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = (void (**)(id, void))a7;
  v17 = sub_100005560();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v32 = "-[FMFFence(Status) triggerWithUUID:status:atDate:triggerLocation:completion:]";
    __int16 v33 = 2112;
    id v34 = v12;
    __int16 v35 = 2112;
    id v36 = v13;
    __int16 v37 = 2112;
    id v38 = v14;
    __int16 v39 = 2112;
    v40 = self;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s: uuid: %@ withStatus: %@ forDate: %@ fence: %@", buf, 0x34u);
  }

  if (![(FMFFence *)self isOnMe]) {
    goto LABEL_8;
  }
  +[FMFIDSMessageController sharedInstance];
  v18 = v29 = (void (**)(void, id))v16;
  [(FMFFence *)self identifier];
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  v23 = id v22 = v15;
  v24 = [(FMFFence *)self _recipients];
  v25 = +[NSSet setWithArray:v24];
  id v30 = 0;
  [v18 sendTriggerWithUUID:v21 forFenceWithID:v23 withStatus:v20 forDate:v19 triggerLocation:v22 toHandles:v25 error:&v30];
  id v26 = v30;

  id v15 = v22;
  id v12 = v21;
  id v13 = v20;
  id v14 = v19;

  v16 = (void (**)(id, void))v29;
  if (v26)
  {
    if (v29) {
      v29[2](v29, v26);
    }
  }
  else
  {
LABEL_8:
    [(FMFFence *)self postTriggerNotificationWithUUID:v12 forStatus:v13 atDate:v14 triggerLocation:v15];
    v27 = [(FMFFence *)self trigger];
    unsigned int v28 = [v27 isEqualToString:FMFFenceTriggerScheduled];

    if (v28) {
      [(FMFFence *)self setStatus:v13 forDate:v14];
    }
    if (v16) {
      v16[2](v16, 0);
    }
  }
}

+ (id)statusByWindowStartDateByFenceID
{
  if (qword_1000BB868 != -1) {
    dispatch_once(&qword_1000BB868, &stru_1000A2E70);
  }
  v2 = (void *)qword_1000BB860;

  return v2;
}

- (BOOL)isStatusValidAtDate:(id)a3 reason:(id *)a4
{
  id v6 = a3;
  v7 = [(FMFFence *)self trigger];
  unsigned __int8 v8 = [v7 isEqualToString:FMFFenceTriggerScheduled];

  if ((v8 & 1) == 0)
  {
    if (a4)
    {
      id v12 = @"non-scheduled fence";
LABEL_8:
      BOOL v11 = 0;
      *a4 = v12;
      goto LABEL_10;
    }
LABEL_9:
    BOOL v11 = 0;
    goto LABEL_10;
  }
  v9 = [(FMFFence *)self schedule];
  unsigned __int8 v10 = [v9 isCurrentAt:v6];

  if ((v10 & 1) == 0)
  {
    if (a4)
    {
      id v12 = +[NSString stringWithFormat:@"scheduled fence not current at date: %@", v6];
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  BOOL v11 = 1;
LABEL_10:

  return v11;
}

- (id)statusForDate:(id)a3
{
  v3 = [(FMFFence *)self infoByWindowStartDate:a3];
  id v4 = v3;
  if (v3)
  {
    v5 = [v3 objectForKeyedSubscript:@"FMFFenceTriggerStatusKey"];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)previouslyAtLocationForDate:(id)a3
{
  v3 = [(FMFFence *)self infoByWindowStartDate:a3];
  id v4 = v3;
  if (v3)
  {
    v5 = [v3 objectForKeyedSubscript:@"FMFPreviouslyInFenceStatusKey"];
    unsigned __int8 v6 = [v5 BOOLValue];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (id)infoByWindowStartDate:(id)a3
{
  id v4 = (FMFFence *)a3;
  id v16 = 0;
  unsigned __int8 v5 = [(FMFFence *)self isStatusValidAtDate:v4 reason:&v16];
  id v6 = v16;
  if (v5)
  {
    v7 = [(FMFFence *)self schedule];
    unsigned __int8 v8 = [v7 previousStartDateFrom:v4];

    v9 = [(id)objc_opt_class() statusByWindowStartDateByFenceID];
    unsigned __int8 v10 = [(FMFFence *)self identifier];
    BOOL v11 = [v9 objectForKeyedSubscript:v10];

    id v12 = sub_100005560();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v18 = "-[FMFFence(Status) infoByWindowStartDate:]";
      __int16 v19 = 2112;
      id v20 = v4;
      __int16 v21 = 2112;
      id v22 = v8;
      __int16 v23 = 2112;
      id v24 = v11;
      __int16 v25 = 2112;
      id v26 = self;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: date: %@ windowStartDate: %@ statusByWindowStartDate: %@ fence: %@", buf, 0x34u);
    }

    id v13 = [v8 description];
    id v14 = [v11 objectForKeyedSubscript:v13];
  }
  else
  {
    unsigned __int8 v8 = sub_100005560();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315906;
      v18 = "-[FMFFence(Status) infoByWindowStartDate:]";
      __int16 v19 = 2112;
      id v20 = self;
      __int16 v21 = 2112;
      id v22 = v4;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_fault_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "%s: fence: %@ invalid at date: %@ reason: %@", buf, 0x2Au);
    }
    id v14 = 0;
  }

  return v14;
}

- (void)setStatus:(id)a3 forDate:(id)a4
{
  id v6 = a3;
  v7 = (FMFFence *)a4;
  id v37 = 0;
  unsigned __int8 v8 = [(FMFFence *)self isStatusValidAtDate:v7 reason:&v37];
  id v9 = v37;
  unsigned __int8 v10 = v9;
  if (v8)
  {
    id v36 = v9;
    BOOL v11 = [(FMFFence *)self schedule];
    id v12 = [v11 previousStartDateFrom:v7];

    id v13 = [(id)objc_opt_class() statusByWindowStartDateByFenceID];
    id v14 = [(FMFFence *)self identifier];
    id v15 = [v13 objectForKeyedSubscript:v14];

    id v16 = [v12 description];
    __int16 v35 = v15;
    v17 = [v15 objectForKeyedSubscript:v16];

    v18 = [v17 objectForKeyedSubscript:@"FMFPreviouslyInFenceStatusKey"];
    unsigned int v19 = [v18 BOOLValue];

    unsigned int v20 = [v6 isEqualToString:FMFFenceTriggerStatusIn];
    v51[0] = v6;
    v50[0] = @"FMFFenceTriggerStatusKey";
    v50[1] = @"FMFPreviouslyInFenceStatusKey";
    __int16 v21 = +[NSNumber numberWithBool:v20 | v19];
    v51[1] = v21;
    id v22 = +[NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:2];

    __int16 v23 = [(id)objc_opt_class() statusByWindowStartDateByFenceID];
    id v24 = [(FMFFence *)self identifier];
    [v23 setObject:0 forKeyedSubscript:v24];

    __int16 v25 = [v12 description];
    v48 = v25;
    v49 = v22;
    id v26 = +[NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
    v27 = [(id)objc_opt_class() statusByWindowStartDateByFenceID];
    unsigned int v28 = [(FMFFence *)self identifier];
    [v27 setObject:v26 forKeyedSubscript:v28];

    v29 = sub_100005560();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      id v30 = [(id)objc_opt_class() statusByWindowStartDateByFenceID];
      v31 = [(FMFFence *)self identifier];
      v32 = [v30 objectForKeyedSubscript:v31];
      *(_DWORD *)buf = 136316162;
      __int16 v39 = "-[FMFFence(Status) setStatus:forDate:]";
      __int16 v40 = 2112;
      v41 = v7;
      __int16 v42 = 2112;
      v43 = v12;
      __int16 v44 = 2112;
      v45 = v32;
      __int16 v46 = 2112;
      v47 = self;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%s: date: %@ windowStartDate: %@ statusByWindowStartDate: %@ fence: %@", buf, 0x34u);
    }
    __int16 v33 = +[NSUserDefaults standardUserDefaults];
    id v34 = [(id)objc_opt_class() statusByWindowStartDateByFenceID];
    [v33 setObject:v34 forKey:@"FMFScheduledFenceStatus"];

    unsigned __int8 v10 = v36;
  }
  else
  {
    id v12 = sub_100005560();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315906;
      __int16 v39 = "-[FMFFence(Status) setStatus:forDate:]";
      __int16 v40 = 2112;
      v41 = self;
      __int16 v42 = 2112;
      v43 = v7;
      __int16 v44 = 2112;
      v45 = v10;
      _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "%s: fence: %@ invalid at date: %@ reason: %@", buf, 0x2Au);
    }
  }
}

- (void)setTriggerForRepeatedFenceBeforeAccpetanceWithTriggerStatus:(id)a3 date:(id)a4 location:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v38[0] = @"FMFPreAcceptanceFenceTriggerStatus";
  v38[1] = @"FMFPreAcceptanceFenceTriggerDate";
  v39[0] = v8;
  v39[1] = v9;
  v38[2] = @"FMFPreAcceptanceFenceTriggerLocation";
  v39[2] = v10;
  BOOL v11 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:3];
  id v12 = sub_100005560();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v33 = "-[FMFFence(Status) setTriggerForRepeatedFenceBeforeAccpetanceWithTriggerStatus:date:location:]";
    __int16 v34 = 2112;
    __int16 v35 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: firstTriggerForRepeatedFence infoForStartDate: %@", buf, 0x16u);
  }

  id v31 = 0;
  id v13 = +[NSKeyedArchiver archivedDataWithRootObject:v11 requiringSecureCoding:1 error:&v31];
  id v14 = v31;
  id v15 = sub_100005560();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v33 = "-[FMFFence(Status) setTriggerForRepeatedFenceBeforeAccpetanceWithTriggerStatus:date:location:]";
    __int16 v34 = 2112;
    __int16 v35 = v13;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s: firstTriggerForRepeatedFence triggerData: %@", buf, 0x16u);
  }

  if (v14)
  {
    id v16 = sub_100005560();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10006D120();
    }
  }
  else
  {
    v17 = objc_opt_class();
    v27 = self;
    v18 = [(FMFFence *)self identifier];
    id v16 = [v17 pathToTriggerDataForFenceWithID:v18];

    unsigned int v19 = sub_100005560();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v33 = "-[FMFFence(Status) setTriggerForRepeatedFenceBeforeAccpetanceWithTriggerStatus:date:location:]";
      __int16 v34 = 2112;
      __int16 v35 = v16;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s: path to trigger data: %@", buf, 0x16u);
    }

    uint64_t v20 = +[NSDictionary dictionaryWithObject:NSFileProtectionCompleteUntilFirstUserAuthentication forKey:NSFileProtectionKey];
    __int16 v21 = +[NSFileManager defaultManager];
    id v22 = [v16 stringByDeletingLastPathComponent];
    id v30 = 0;
    unsigned int v28 = (void *)v20;
    [v21 createDirectoryAtPath:v22 withIntermediateDirectories:1 attributes:v20 error:&v30];
    id v23 = v30;

    if (v23)
    {
      id v24 = sub_100005560();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_10006D0A8();
      }
    }
    else
    {
      id v29 = 0;
      [v13 writeToFile:v16 options:0 error:&v29];
      id v24 = v29;
      if (v24)
      {
        __int16 v25 = sub_100005560();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_10006D030();
        }
      }
      id v26 = sub_100005560();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v33 = "-[FMFFence(Status) setTriggerForRepeatedFenceBeforeAccpetanceWithTriggerStatus:date:location:]";
        __int16 v34 = 2112;
        __int16 v35 = v13;
        __int16 v36 = 2112;
        id v37 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s: firstTriggerForRepeatedFence: %@ fence: %@", buf, 0x20u);
      }
    }
  }
}

- (id)triggerForRepeatedFenceBeforeAcceptance
{
  v3 = objc_opt_class();
  uint64_t v4 = [(FMFFence *)self identifier];
  unsigned __int8 v5 = [v3 pathToTriggerDataForFenceWithID:v4];

  id v6 = +[NSFileManager defaultManager];
  LOBYTE(v4) = [v6 fileExistsAtPath:v5];

  if (v4)
  {
    id v18 = 0;
    v7 = +[NSData dataWithContentsOfFile:v5 options:0 error:&v18];
    id v8 = v18;
    if (v8)
    {
      id v9 = sub_100005560();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10006D208();
      }
    }
    else
    {
      if (v7)
      {
        v19[0] = objc_opt_class();
        v19[1] = objc_opt_class();
        v19[2] = objc_opt_class();
        v19[3] = objc_opt_class();
        BOOL v11 = +[NSArray arrayWithObjects:v19 count:4];
        id v12 = +[NSSet setWithArray:v11];
        id v17 = 0;
        id v13 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v12 fromData:v7 error:&v17];
        id v9 = v17;

        id v14 = sub_100005560();
        id v15 = v14;
        if (v9)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            sub_10006D194();
          }

          id v10 = 0;
        }
        else
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            __int16 v21 = "-[FMFFence(Status) triggerForRepeatedFenceBeforeAcceptance]";
            __int16 v22 = 2112;
            id v23 = v13;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s: trigger dictionary: %@", buf, 0x16u);
          }

          id v10 = v13;
        }

        goto LABEL_20;
      }
      id v9 = sub_100005560();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        __int16 v21 = "-[FMFFence(Status) triggerForRepeatedFenceBeforeAcceptance]";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Repeated fence first trigger: No trigger Data", buf, 0xCu);
      }
    }
    id v10 = 0;
LABEL_20:

    goto LABEL_21;
  }
  id v8 = sub_100005560();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v21 = "-[FMFFence(Status) triggerForRepeatedFenceBeforeAcceptance]";
    __int16 v22 = 2112;
    id v23 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: no file at %@", buf, 0x16u);
  }
  id v10 = 0;
LABEL_21:

  return v10;
}

- (void)clearStaleFenceTrigger
{
  v3 = objc_opt_class();
  uint64_t v4 = [(FMFFence *)self identifier];
  unsigned __int8 v5 = [v3 pathToTriggerDataForFenceWithID:v4];

  id v6 = +[NSFileManager defaultManager];
  LOBYTE(v4) = [v6 fileExistsAtPath:v5];

  if ((v4 & 1) == 0)
  {
    v7 = sub_100005560();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v15 = "-[FMFFence(Status) clearStaleFenceTrigger]";
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: no file at %@", buf, 0x16u);
    }
  }
  id v8 = +[NSFileManager defaultManager];
  id v9 = [v5 stringByDeletingLastPathComponent];
  id v13 = 0;
  unsigned __int8 v10 = [v8 removeItemAtPath:v9 error:&v13];
  id v11 = v13;

  if ((v10 & 1) == 0)
  {
    id v12 = sub_100005560();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10006D27C();
    }
  }
}

- (NSArray)_recipients
{
  v3 = [(FMFFence *)self recipients];
  id v4 = [v3 count];

  if (v4)
  {
    unsigned __int8 v5 = [(FMFFence *)self recipients];
  }
  else if ([(FMFFence *)self isFromMe])
  {
    unsigned __int8 v5 = &__NSArray0__struct;
  }
  else
  {
    id v6 = [(FMFFence *)self followerIds];
    unsigned __int8 v5 = [v6 fm_map:&stru_1000A2EB0];
  }

  return (NSArray *)v5;
}

- (void)postConfirmationNotificationWithUUID:(id)a3 atDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FMFFence *)self followerGivenName];
  id v9 = [(FMFFence *)self localizedRequestNotificationStringForFollower:v8 locationName:0];

  unsigned __int8 v10 = +[FMFUserNotificationManager sharedInstance];
  id v11 = [(FMFFence *)self identifier];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10004CFD0;
  v13[3] = &unk_1000A1708;
  id v14 = v6;
  id v12 = v6;
  [v10 postConfirmationWithUUID:v12 forFenceWithID:v11 withText:v9 forDate:v7 completion:v13];
}

- (void)postReceiveTriggerNotificationWithUUID:(id)a3 forStatus:(id)a4 atDate:(id)a5 triggerLocation:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v24 = 0;
  unsigned int v14 = [(FMFFence *)self shouldPostForStatus:v11 atDate:v12 reason:&v24];
  id v15 = v24;
  __int16 v16 = sub_100005560();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316674;
    id v26 = "-[FMFFence(Notifications) postReceiveTriggerNotificationWithUUID:forStatus:atDate:triggerLocation:]";
    __int16 v27 = 1024;
    unsigned int v28 = v14;
    __int16 v29 = 2112;
    id v30 = v15;
    __int16 v31 = 2112;
    id v32 = v10;
    __int16 v33 = 2112;
    id v34 = v11;
    __int16 v35 = 2112;
    id v36 = v12;
    __int16 v37 = 2112;
    id v38 = self;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s: shouldPost: %d reason: %@ uuid: %@ withStatus: %@ forDate: %@ fence: %@", buf, 0x44u);
  }

  if (v14)
  {
    __int16 v21 = [(FMFFence *)self localizedNotificationTextForStatus:v11 atDate:v12];
    id v17 = +[FMFUserNotificationManager sharedInstance];
    id v18 = [(FMFFence *)self identifier];
    unsigned int v19 = [(FMFFence *)self friendIdentifier];
    uint64_t v20 = [(FMFFence *)self location];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10004D330;
    v22[3] = &unk_1000A1708;
    id v23 = v10;
    [v17 postReceiveTriggerWithUUID:v23 forFenceWithID:v18 friendID:v19 withText:v21 forDate:v12 triggerLocation:v13 fenceLocation:v20 completion:v22];
  }
}

- (void)postTriggerNotificationWithUUID:(id)a3 forStatus:(id)a4 atDate:(id)a5 triggerLocation:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v27 = 0;
  unsigned int v14 = [(FMFFence *)self shouldPostForStatus:v11 atDate:v12 reason:&v27];
  id v15 = v27;
  __int16 v16 = sub_100005560();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316674;
    __int16 v29 = "-[FMFFence(Notifications) postTriggerNotificationWithUUID:forStatus:atDate:triggerLocation:]";
    __int16 v30 = 1024;
    unsigned int v31 = v14;
    __int16 v32 = 2112;
    id v33 = v15;
    __int16 v34 = 2112;
    id v35 = v10;
    __int16 v36 = 2112;
    id v37 = v11;
    __int16 v38 = 2112;
    id v39 = v12;
    __int16 v40 = 2112;
    v41 = self;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s: shouldPost: %d reason: %@ uuid: %@ withStatus: %@ forDate: %@ fence: %@", buf, 0x44u);
  }

  if (v14)
  {
    id v23 = [(FMFFence *)self localizedNotificationTextForStatus:v11 atDate:v12];
    id v17 = +[FMFUserNotificationManager sharedInstance];
    id v18 = [(FMFFence *)self identifier];
    unsigned int v19 = [(FMFFence *)self followerIds];
    [v19 firstObject];
    id v24 = v15;
    v21 = id v20 = v13;
    __int16 v22 = [(FMFFence *)self location];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10004D6A0;
    v25[3] = &unk_1000A1708;
    id v26 = v10;
    [v17 postTriggerWithUUID:v26 forFenceWithID:v18 followerID:v21 withText:v23 forDate:v12 triggerLocation:v20 fenceLocation:v22 completion:v25];

    id v13 = v20;
    id v15 = v24;
  }
}

- (BOOL)shouldPostForStatus:(id)a3 atDate:(id)a4 reason:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(FMFFence *)self trigger];
  unsigned __int8 v11 = [v10 isEqualToString:FMFFenceTriggerScheduled];

  if (v11)
  {
    id v17 = 0;
    unsigned __int8 v12 = [(FMFFence *)self isStatusValidAtDate:v9 reason:&v17];
    id v13 = v17;
    if (v12)
    {
      unsigned int v14 = [(FMFFence *)self statusForDate:v9];
      unsigned __int8 v15 = [(id)objc_opt_class() shouldPostForStatus:v8 givenPreviousStatus:v14];
      *a5 = +[NSString stringWithFormat:@"{status: %@ previousStatus}: %@", v8, v14];
    }
    else
    {
      unsigned int v14 = sub_100005560();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        unsigned int v19 = "-[FMFFence(Notifications) shouldPostForStatus:atDate:reason:]";
        __int16 v20 = 2112;
        __int16 v21 = self;
        __int16 v22 = 2112;
        id v23 = v9;
        __int16 v24 = 2112;
        id v25 = v13;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s: fence: %@ invalid at date: %@ reason: %@", buf, 0x2Au);
      }
      unsigned __int8 v15 = 0;
    }
  }
  else
  {
    if (a5) {
      *a5 = @"non-scheduled fence";
    }
    unsigned __int8 v15 = 1;
  }

  return v15;
}

+ (BOOL)shouldPostForStatus:(id)a3 givenPreviousStatus:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:FMFFenceTriggerStatusUndetermined])
  {
    LOBYTE(a1) = v7 == 0;
  }
  else
  {
    unsigned int v8 = [v6 isEqualToString:FMFFenceTriggerStatusIn];
    uint64_t v9 = FMFFenceTriggerStatusOut;
    if (v8)
    {
      LOBYTE(a1) = [a1 isString:v7 equalToString:FMFFenceTriggerStatusOut];
    }
    else if ([v6 isEqualToString:FMFFenceTriggerStatusOut])
    {
      LODWORD(a1) = [a1 isString:v7 equalToString:v9] ^ 1;
    }
    else
    {
      sub_100005560();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)a1, OS_LOG_TYPE_FAULT)) {
        sub_10006D458((os_log_t)a1);
      }

      LOBYTE(a1) = 1;
    }
  }

  return (char)a1;
}

+ (BOOL)isString:(id)a3 equalToString:(id)a4
{
  if (a3 && a4) {
    return [a3 isEqualToString:a4];
  }
  else {
    return a3 == a4;
  }
}

- (id)localizedNotificationTextForStatus:(id)a3 atDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [(FMFFence *)self displayLocationName];
  id v10 = [(FMFFence *)self trigger];
  unsigned int v11 = [v10 isEqualToString:FMFFenceTriggerLeaving];

  if (v11)
  {
    if (([FMFFenceTriggerStatusExit isEqualToString:v7] & 1) == 0)
    {
      v57 = +[NSAssertionHandler currentHandler];
      [v57 handleFailureInMethod:a2 object:self file:@"FMFFenceTriggerManager.m" lineNumber:750 description:@"invalid status"];
    }
    unsigned int v12 = [(FMFFence *)self isOnMe];
    id v13 = +[NSBundle bundleForClass:objc_opt_class()];
    if (v12)
    {
      CFStringRef v14 = @"FENCE_TRIGGERED_YOU_LEFT";
LABEL_11:
      id v18 = [v13 localizedStringForKey:v14 value:&stru_1000A3938 table:@"Localizable-TINKER"];

      uint64_t v19 = [(FMFFence *)self followerGivenName];
LABEL_22:
      id v35 = (void *)v19;
      __int16 v36 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v19, v9);

      goto LABEL_23;
    }
    CFStringRef v20 = @"FENCE_TRIGGERED_FRIEND_LEFT";
    goto LABEL_21;
  }
  unsigned __int8 v15 = [(FMFFence *)self trigger];
  unsigned int v16 = [v15 isEqualToString:FMFFenceTriggerArriving];

  if (v16)
  {
    if (([FMFFenceTriggerStatusEnter isEqualToString:v7] & 1) == 0)
    {
      v58 = +[NSAssertionHandler currentHandler];
      [v58 handleFailureInMethod:a2 object:self file:@"FMFFenceTriggerManager.m" lineNumber:762 description:@"invalid status"];
    }
    unsigned int v17 = [(FMFFence *)self isOnMe];
    id v13 = +[NSBundle bundleForClass:objc_opt_class()];
    if (v17)
    {
      CFStringRef v14 = @"FENCE_TRIGGERED_YOU_ARRIVED";
      goto LABEL_11;
    }
    CFStringRef v20 = @"FENCE_TRIGGERED_FRIEND_ARRIVED";
LABEL_21:
    id v18 = [v13 localizedStringForKey:v20 value:&stru_1000A3938 table:@"Localizable-TINKER"];

    uint64_t v19 = [(FMFFence *)self followedGivenName];
    goto LABEL_22;
  }
  __int16 v21 = [(FMFFence *)self trigger];
  unsigned int v22 = [v21 isEqualToString:FMFFenceTriggerScheduled];

  if (!v22)
  {
    id v18 = +[NSAssertionHandler currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"FMFFenceTriggerManager.m" lineNumber:875 description:@"invalid trigger type"];
    __int16 v36 = 0;
    goto LABEL_23;
  }
  id v18 = [(FMFFence *)self statusForDate:v8];
  unsigned int v23 = [(FMFFence *)self previouslyAtLocationForDate:v8];
  uint64_t v64 = +[NSDateFormatter localizedStringFromDate:v8 dateStyle:0 timeStyle:1];
  __int16 v24 = [(FMFFence *)self schedule];
  v65 = [v24 localizedStartTimeString];

  id v25 = [(FMFFence *)self schedule];
  v67 = [v25 localizedEndTimeString];

  id v26 = [(FMFFence *)self schedule];
  v66 = [v26 localizedDaysOfWeekString];

  id v27 = [(FMFFence *)self schedule];
  id v28 = [v27 daysOfWeek];

  __int16 v29 = (void *)FMFFenceTriggerStatusUndetermined;
  if ([FMFFenceTriggerStatusUndetermined isEqualToString:v7])
  {
    if ([(FMFFence *)self isOnMe])
    {
      v59 = +[NSAssertionHandler currentHandler];
      [v59 handleFailureInMethod:a2 object:self file:@"FMFFenceTriggerManager.m" lineNumber:783 description:@"invalid status"];
    }
    __int16 v30 = (void *)v64;
    if (v18)
    {
      v60 = +[NSAssertionHandler currentHandler];
      [v60 handleFailureInMethod:a2 object:self file:@"FMFFenceTriggerManager.m" lineNumber:784 description:@"invalid previousStatus"];
    }
    unsigned int v31 = +[NSBundle bundleForClass:objc_opt_class()];
    __int16 v32 = [v31 localizedStringForKey:@"FENCE_TRIGGERED_FRIEND_COULD_NOT_DETERMINE_AT_LOCATION_BY_TIME" value:&stru_1000A3938 table:@"Localizable-TINKER"];

    id v33 = [(FMFFence *)self followedGivenName];
    __int16 v34 = v65;
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v32, v33, v9, v65);
    goto LABEL_49;
  }
  __int16 v38 = (void *)FMFFenceTriggerStatusIn;
  if ([FMFFenceTriggerStatusIn isEqualToString:v7])
  {
    if (([FMFFenceTriggerStatusOut isEqualToString:v18] & 1) == 0)
    {
      v61 = +[NSAssertionHandler currentHandler];
      [v61 handleFailureInMethod:a2 object:self file:@"FMFFenceTriggerManager.m" lineNumber:790 description:@"invalid previousStatus"];
    }
    unsigned int v39 = [(FMFFence *)self isOnMe];
    __int16 v40 = +[NSBundle bundleForClass:objc_opt_class()];
    v41 = v40;
    if (v23)
    {
      __int16 v34 = v65;
      if (v39)
      {
        CFStringRef v42 = @"FENCE_TRIGGER_YOU_RETURNED_TO_LOCATION_AT_TIME";
LABEL_42:
        __int16 v32 = [v40 localizedStringForKey:v42 value:&stru_1000A3938 table:@"Localizable-TINKER"];

        uint64_t v45 = [(FMFFence *)self followerGivenName];
LABEL_48:
        id v33 = (void *)v45;
        __int16 v30 = (void *)v64;
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", v32, v45, v9, v64);
        __int16 v36 = LABEL_49:;

        goto LABEL_50;
      }
      CFStringRef v46 = @"FENCE_TRIGGER_FRIEND_RETURNED_TO_LOCATION_AT_TIME";
    }
    else
    {
      __int16 v34 = v65;
      if (v39)
      {
        CFStringRef v42 = @"FENCE_TRIGGER_YOU_ARRIVED_AT_LOCATION_AT_TIME";
        goto LABEL_42;
      }
      CFStringRef v46 = @"FENCE_TRIGGER_FRIEND_ARRIVED_AT_LOCATION_AT_TIME";
    }
    __int16 v32 = [v40 localizedStringForKey:v46 value:&stru_1000A3938 table:@"Localizable-TINKER"];

    uint64_t v45 = [(FMFFence *)self followedGivenName];
    goto LABEL_48;
  }
  if ([FMFFenceTriggerStatusOut isEqualToString:v7])
  {
    if (!v18 || [v29 isEqualToString:v18])
    {
      __int16 v34 = v65;
      unsigned int v43 = [v65 isEqualToString:v67];
      unsigned int v44 = [(FMFFence *)self isOnMe];
      if (v43)
      {
        if (v44)
        {
          if (v28 == (id)127)
          {
            __int16 v32 = @"FENCE_TRIGGER_NOT_AT_LOCATION_BY_TIME";
          }
          else
          {
            __int16 v32 = [@"FENCE_TRIGGER_NOT_AT_LOCATION_BY_TIME" stringByAppendingString:@"_ON_DAYSLIST"];
          }
          v50 = +[NSBundle bundleForClass:objc_opt_class()];
          v52 = [v50 localizedStringForKey:v32 value:&stru_1000A3938 table:@"Localizable-TINKER"];
          uint64_t v53 = [(FMFFence *)self followerGivenName];
          v54 = (void *)v53;
          v55 = v66;
LABEL_65:
          __int16 v34 = v65;
          __int16 v36 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v52, v53, v9, v65, v55, v63);

          goto LABEL_66;
        }
        v49 = +[NSBundle bundleForClass:objc_opt_class()];
        __int16 v32 = [v49 localizedStringForKey:@"FENCE_TRIGGERED_FRIEND_DID_NOT_ARRIVE_AT_LOCATION_BY_TIME" value:&stru_1000A3938 table:@"Localizable-TINKER"];

        v50 = [(FMFFence *)self followedGivenName];
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", v32, v50, v9, v65, v67);
      }
      else
      {
        if (v44)
        {
          if (v28 == (id)127)
          {
            __int16 v32 = @"FENCE_TRIGGER_NOT_AT_LOCATION_BY_TIME_BETWEEN_TIMES";
          }
          else
          {
            __int16 v32 = [@"FENCE_TRIGGER_NOT_AT_LOCATION_BY_TIME_BETWEEN_TIMES" stringByAppendingString:@"_ON_DAYSLIST"];
          }
          v50 = +[NSBundle bundleForClass:objc_opt_class()];
          v52 = [v50 localizedStringForKey:v32 value:&stru_1000A3938 table:@"Localizable-TINKER"];
          uint64_t v53 = [(FMFFence *)self followerGivenName];
          v54 = (void *)v53;
          v63 = v66;
          v55 = v67;
          goto LABEL_65;
        }
        v51 = +[NSBundle bundleForClass:objc_opt_class()];
        __int16 v32 = [v51 localizedStringForKey:@"FENCE_TRIGGERED_FRIEND_DID_NOT_ARRIVE_AT_LOCATION_BY_TIME" value:&stru_1000A3938 table:@"Localizable-TINKER"];

        v50 = [(FMFFence *)self followedGivenName];
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", v32, v50, v9, v65, v62);
      __int16 v36 = };
LABEL_66:

      __int16 v30 = (void *)v64;
      goto LABEL_50;
    }
    __int16 v30 = (void *)v64;
    if ([v38 isEqualToString:v18])
    {
      if ([(FMFFence *)self isOnMe])
      {
        v47 = +[NSBundle bundleForClass:objc_opt_class()];
        __int16 v32 = [v47 localizedStringForKey:@"FENCE_TRIGGER_DEPARTED_YOU_ARE_NOT_AT_LOCATION_BETWEEN_TIMES" value:&stru_1000A3938 table:@"Localizable-TINKER"];

        v48 = [(FMFFence *)self followerGivenName];
        __int16 v36 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v32, v48, v9, v64);
      }
      else
      {
        __int16 v32 = +[NSBundle bundleForClass:objc_opt_class()];
        v48 = [(__CFString *)v32 localizedStringForKey:@"FENCE_TRIGGERED_FRIEND_DEPARTED_LOCATION_AT_TIME" value:&stru_1000A3938 table:@"Localizable-TINKER"];
        v56 = [(FMFFence *)self followedGivenName];
        __int16 v36 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v48, v56, v9, v64);

        __int16 v30 = (void *)v64;
      }
    }
    else
    {
      __int16 v32 = +[NSAssertionHandler currentHandler];
      [(__CFString *)v32 handleFailureInMethod:a2 object:self file:@"FMFFenceTriggerManager.m" lineNumber:865 description:@"invalid previousStatus for status"];
      __int16 v36 = 0;
    }
  }
  else
  {
    __int16 v32 = +[NSAssertionHandler currentHandler];
    [(__CFString *)v32 handleFailureInMethod:a2 object:self file:@"FMFFenceTriggerManager.m" lineNumber:870 description:@"invalid status"];
    __int16 v36 = 0;
    __int16 v30 = (void *)v64;
  }
  __int16 v34 = v65;
LABEL_50:

LABEL_23:

  return v36;
}

- (id)followedGivenName
{
  v3 = +[FMFDataManager sharedInstance];
  id v4 = [v3 followedHandleForFence:self];

  if (v4)
  {
    unsigned __int8 v5 = +[FMFAddressBook sharedAddressBook];
    id v6 = [v5 prettyGivenNameForHandle:v4];
  }
  else
  {
    id v6 = [(id)objc_opt_class() genericFriendName];
  }

  return v6;
}

- (id)followedName
{
  v3 = +[FMFDataManager sharedInstance];
  id v4 = [v3 followedHandleForFence:self];

  if (v4)
  {
    unsigned __int8 v5 = +[FMFAddressBook sharedAddressBook];
    id v6 = [v5 prettyNameForHandle:v4];
  }
  else
  {
    id v6 = [(id)objc_opt_class() genericFriendName];
  }

  return v6;
}

- (id)followerGivenName
{
  v3 = +[FMFDataManager sharedInstance];
  id v4 = [v3 followerHandleForFence:self];

  if (v4)
  {
    unsigned __int8 v5 = +[FMFAddressBook sharedAddressBook];
    id v6 = [v5 prettyGivenNameForHandle:v4];
  }
  else
  {
    id v6 = [(id)objc_opt_class() genericFriendName];
  }

  return v6;
}

- (id)followerName
{
  v3 = +[FMFDataManager sharedInstance];
  id v4 = [v3 followerHandleForFence:self];

  if (v4)
  {
    unsigned __int8 v5 = +[FMFAddressBook sharedAddressBook];
    id v6 = [v5 prettyNameForHandle:v4];
  }
  else
  {
    id v6 = [(id)objc_opt_class() genericFriendName];
  }

  return v6;
}

- (CKRecordID)ckRecordID
{
  v3 = [(FMFFence *)self ckRecordName];
  if (![v3 length])
  {
    id v7 = 0;
    goto LABEL_5;
  }
  id v4 = [(FMFFence *)self ckRecordZoneID];

  if (v4)
  {
    id v5 = objc_alloc((Class)CKRecordID);
    v3 = [(FMFFence *)self ckRecordName];
    id v6 = [(FMFFence *)self ckRecordZoneID];
    id v7 = [v5 initWithRecordName:v3 zoneID:v6];

LABEL_5:
    goto LABEL_7;
  }
  id v7 = 0;
LABEL_7:

  return (CKRecordID *)v7;
}

- (CKRecordZoneID)ckRecordZoneID
{
  v3 = [(FMFFence *)self ckRecordZoneName];
  if (![v3 length])
  {
    id v8 = 0;
    goto LABEL_5;
  }
  id v4 = [(FMFFence *)self ckRecordZoneOwnerName];
  id v5 = [v4 length];

  if (v5)
  {
    id v6 = objc_alloc((Class)CKRecordZoneID);
    v3 = [(FMFFence *)self ckRecordZoneName];
    id v7 = [(FMFFence *)self ckRecordZoneOwnerName];
    id v8 = [v6 initWithZoneName:v3 ownerName:v7];

LABEL_5:
    goto LABEL_7;
  }
  id v8 = 0;
LABEL_7:

  return (CKRecordZoneID *)v8;
}

- (NSString)ckRecordZoneName
{
  v3 = [(FMFFence *)self ckRecordName];
  id v4 = [v3 length];

  if (v4)
  {
    id v5 = objc_opt_class();
    id v6 = [(FMFFence *)self ckRecordName];
    id v7 = [v5 ckRecordZoneNameForRecordName:v6];
  }
  else
  {
    id v7 = 0;
  }

  return (NSString *)v7;
}

+ (id)ckRecordZoneNameForRecordName:(id)a3
{
  return +[NSString stringWithFormat:@"Fence-%@", a3];
}

- (void)updateFromRecord:(id)a3
{
  id v45 = a3;
  id v4 = [v45 encryptedValuesByKey];
  id v5 = [v4 objectForKeyedSubscript:@"location"];
  if (v5)
  {
    [(FMFFence *)self setLocation:v5];
  }
  else
  {
    id v6 = [(id)objc_opt_class() invalidLocation];
    [(FMFFence *)self setLocation:v6];
  }
  id v7 = [v45 encryptedValuesByKey];
  id v8 = [v7 objectForKeyedSubscript:@"label"];
  [(FMFFence *)self setLabel:v8];

  uint64_t v9 = [v45 encryptedValuesByKey];
  id v10 = [v9 objectForKeyedSubscript:@"locationType"];
  -[FMFFence setLocationType:](self, "setLocationType:", [v10 unsignedIntegerValue]);

  id v11 = objc_alloc((Class)FMFPlacemark);
  unsigned int v43 = [v45 encryptedValuesByKey];
  unsigned int v12 = [v43 objectForKeyedSubscript:@"placemark_locality"];
  CFStringRef v42 = [v45 encryptedValuesByKey];
  [v42 objectForKeyedSubscript:@"placemark_administrativeArea"];
  uint64_t v13 = v44 = self;
  v41 = [v45 encryptedValuesByKey];
  CFStringRef v14 = [v41 objectForKeyedSubscript:@"placemark_country"];
  unsigned __int8 v15 = [v45 encryptedValuesByKey];
  unsigned int v16 = [v15 objectForKeyedSubscript:@"placemark_state"];
  unsigned int v17 = [v45 encryptedValuesByKey];
  id v18 = [v17 objectForKeyedSubscript:@"placemark_streetAddress"];
  uint64_t v19 = [v45 encryptedValuesByKey];
  CFStringRef v20 = [v19 objectForKeyedSubscript:@"placemark_streetName"];
  __int16 v21 = v11;
  unsigned int v22 = (void *)v13;
  id v23 = [v21 initWithLocality:v12 administrativeArea:v13 country:v14 state:v16 streetAddress:v18 streetName:v20];
  [(FMFFence *)v44 setPlacemark:v23];

  __int16 v24 = [v45 encryptedValuesByKey];
  id v25 = [v24 objectForKeyedSubscript:@"fence_muteEndDate"];
  [(FMFFence *)v44 setMuteEndDate:v25];

  id v26 = [(FMFFence *)v44 trigger];
  LODWORD(v25) = [v26 isEqualToString:FMFFenceTriggerScheduled];

  if (v25)
  {
    id v27 = objc_opt_new();
    id v28 = [v45 encryptedValuesByKey];
    __int16 v29 = [v28 objectForKeyedSubscript:@"schedule_startHour"];
    [v27 setStartHour:[v29 unsignedIntegerValue]];

    __int16 v30 = [v45 encryptedValuesByKey];
    unsigned int v31 = [v30 objectForKeyedSubscript:@"schedule_startMin"];
    [v27 setStartMin:[v31 unsignedIntegerValue]];

    __int16 v32 = [v45 encryptedValuesByKey];
    id v33 = [v32 objectForKeyedSubscript:@"schedule_endHour"];
    [v27 setEndHour:[v33 unsignedIntegerValue]];

    __int16 v34 = [v45 encryptedValuesByKey];
    id v35 = [v34 objectForKeyedSubscript:@"schedule_endMin"];
    [v27 setEndMin:[v35 unsignedIntegerValue]];

    __int16 v36 = [v45 encryptedValuesByKey];
    id v37 = [v36 objectForKeyedSubscript:@"schedule_daysOfWeek"];
    [v27 setDaysOfWeek:[v37 integerValue]];

    __int16 v38 = [v45 encryptedValuesByKey];
    unsigned int v39 = [v38 objectForKeyedSubscript:@"schedule_timeZone"];
    __int16 v40 = +[NSTimeZone timeZoneWithName:v39];
    [v27 setTimeZone:v40];

    [(FMFFence *)v44 setSchedule:v27];
  }
}

+ (id)invalidLocation
{
  id v2 = objc_alloc((Class)CLLocation);
  v3 = +[NSDate date];
  id v4 = [v2 initWithCoordinate:v3 altitude:kCLLocationCoordinate2DInvalid.latitude horizontalAccuracy:kCLLocationCoordinate2DInvalid.longitude verticalAccuracy:0.0 timestamp:0.0];

  return v4;
}

@end