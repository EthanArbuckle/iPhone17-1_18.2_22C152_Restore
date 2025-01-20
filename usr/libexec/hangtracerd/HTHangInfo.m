@interface HTHangInfo
+ (double)getHangWaitTimeout;
+ (id)allHangs;
+ (id)firstHang;
+ (unint64_t)hangSequenceEndTime;
+ (unint64_t)hangSequenceLastHangReportedTime;
+ (unint64_t)hangSequenceStartTime;
+ (unint64_t)numberOfHangs;
+ (void)addHang:(id)a3;
+ (void)cleanupAllHangs;
- (BOOL)displayedInHUD;
- (BOOL)isFirstPartyApp;
- (BOOL)isThirdPartyDevSupportModeHang;
- (HTHangInfo)initWithPid:(int)a3 threadID:(unint64_t)a4 startTime:(unint64_t)a5 endTime:(unint64_t)a6 reportedTime:(unint64_t)a7 blownFenceID:(unint64_t)a8 hangSubtype:(int64_t)a9 isFirstPartyApp:(BOOL)a10 isThirdPartyDevSupportModeHang:(BOOL)a11 displayedInHUD:(BOOL)a12 serviceName:(id)a13 reason:(id)a14 processName:(id)a15 processPath:(id)a16 userActionData:(id)a17;
- (NSData)userActionData;
- (NSDictionary)infoDict;
- (NSString)hangDescription;
- (NSString)hangTimestamp;
- (NSString)hangUUID;
- (NSString)processName;
- (NSString)processPath;
- (NSString)reason;
- (NSString)serviceName;
- (double)hangDurationMS;
- (int)pid;
- (int64_t)failReason;
- (int64_t)hangSubType;
- (unint64_t)blownFenceID;
- (unint64_t)endTime;
- (unint64_t)reportedTime;
- (unint64_t)startTime;
- (unint64_t)tid;
- (void)setFailReason:(int64_t)a3;
@end

@implementation HTHangInfo

- (double)hangDurationMS
{
  return sub_10002A984(self->_endTime - self->_startTime);
}

- (NSString)hangDescription
{
  processName = self->_processName;
  v4 = sub_10001C680(self->_hangSubType);
  [(HTHangInfo *)self hangDurationMS];
  v6 = +[NSString stringWithFormat:@"%@, %@, %.0fms", processName, v4, v5];

  return (NSString *)v6;
}

+ (unint64_t)hangSequenceStartTime
{
  return qword_100063C50;
}

+ (unint64_t)hangSequenceEndTime
{
  return qword_100063C30;
}

+ (unint64_t)hangSequenceLastHangReportedTime
{
  return qword_100063C58;
}

+ (void)addHang:(id)a3
{
  id v3 = a3;
  if (qword_100063C38 != -1) {
    dispatch_once(&qword_100063C38, &stru_1000511E8);
  }
  if (![(id)qword_100063C40 count])
  {
    id v4 = objc_alloc_init((Class)NSUUID);
    uint64_t v5 = [v4 UUIDString];
    v6 = (void *)qword_100063C48;
    qword_100063C48 = v5;
  }
  id v7 = [v3 startTime];
  if ((unint64_t)v7 < qword_100063C50) {
    qword_100063C50 = (uint64_t)[v3 startTime];
  }
  id v8 = [v3 endTime];
  if ((unint64_t)v8 > qword_100063C30) {
    qword_100063C30 = (uint64_t)[v3 endTime];
  }
  id v9 = [v3 reportedTime];
  if ((unint64_t)v9 > qword_100063C58) {
    qword_100063C58 = (uint64_t)[v3 reportedTime];
  }
  [(id)qword_100063C40 addObject:v3];
  v10 = sub_100027DEC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [v3 hangDescription];
    int v12 = 138543362;
    v13 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ added to tailspin capture", (uint8_t *)&v12, 0xCu);
  }
}

+ (id)allHangs
{
  id v2 = [(id)qword_100063C40 copy];

  return v2;
}

+ (id)firstHang
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = (id)qword_100063C40;
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = 0;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      v6 = 0;
      id v7 = v4;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v4 = *(id *)(*((void *)&v10 + 1) + 8 * (void)v6);

        id v8 = [v4 startTime:v10];
        if (v8 == (id)qword_100063C50)
        {
          id v3 = v4;
          id v4 = v2;
          id v2 = v3;
          goto LABEL_11;
        }
        v6 = (char *)v6 + 1;
        id v7 = v4;
      }
      while (v3 != v6);
      id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
LABEL_11:
  }

  return v3;
}

+ (unint64_t)numberOfHangs
{
  return (unint64_t)[(id)qword_100063C40 count];
}

+ (void)cleanupAllHangs
{
  [(id)qword_100063C40 removeAllObjects];
  qword_100063C30 = 0;
  qword_100063C50 = -1;
  qword_100063C58 = 0;
  if (qword_100063C28)
  {
    dispatch_source_cancel((dispatch_source_t)qword_100063C28);
    id v2 = (void *)qword_100063C28;
    qword_100063C28 = 0;
  }
  id v3 = (void *)qword_100063C48;
  if (qword_100063C48)
  {
    qword_100063C48 = 0;
  }
}

- (NSDictionary)infoDict
{
  id v3 = +[HTPrefs sharedPrefs];
  id v4 = [v3 enablementPrefix];
  if (v4)
  {
    uint64_t v5 = +[HTPrefs sharedPrefs];
    v6 = [v5 enablementPrefix];
  }
  else
  {
    v6 = &stru_100053108;
  }

  if (!self->_userActionData
    || (id v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithBytesNoCopy:length:encoding:freeWhenDone:", -[NSData bytes](self->_userActionData, "bytes"), -[NSData length](self->_userActionData, "length"), 4, 0)) == 0)
  {
    id v7 = +[NSNull null];
  }
  v30[0] = @"Reason";
  v30[1] = @"ServiceName";
  serviceName = self->_serviceName;
  v31[0] = self->_reason;
  v31[1] = serviceName;
  v31[2] = self->_processPath;
  v30[2] = @"ProcessPath";
  v30[3] = @"PID";
  v27 = +[NSNumber numberWithInt:self->_pid];
  v31[3] = v27;
  v30[4] = @"ThreadID";
  v26 = +[NSNumber numberWithLongLong:self->_tid];
  v31[4] = v26;
  v30[5] = @"StartTime";
  v25 = +[NSNumber numberWithLongLong:self->_startTime];
  v31[5] = v25;
  v30[6] = @"EndTime";
  v24 = +[NSNumber numberWithLongLong:self->_endTime];
  v31[6] = v24;
  v30[7] = @"ReportedTime";
  v23 = +[NSNumber numberWithLongLong:self->_reportedTime];
  v31[7] = v23;
  v30[8] = @"HangType";
  v22 = +[NSNumber numberWithInteger:self->_hangSubType];
  v31[8] = v22;
  v30[9] = @"DisplayData";
  id v9 = +[HTProcessInfo displayStateArray];
  v31[9] = v9;
  v30[10] = @"NetworkState";
  long long v10 = +[HTNetworkInfo networkStateForTailSpin];
  long long v11 = v10;
  if (!v10)
  {
    long long v11 = +[NSNull null];
  }
  v31[10] = v11;
  v31[11] = qword_100063C48;
  v30[11] = @"HangUUID";
  v30[12] = @"HangNotificationUUID";
  v31[12] = self->_hangUUID;
  v30[13] = @"CreatedAt";
  long long v12 = +[NSDate now];
  [v12 timeIntervalSinceReferenceDate];
  v14 = +[NSString stringWithFormat:@"%.0f", v13];
  v31[13] = v14;
  v31[14] = v7;
  v28 = v7;
  v29 = v6;
  v30[14] = @"UserAction";
  v30[15] = @"EnablementType";
  v31[15] = v6;
  v30[16] = @"DisplayedInHUD";
  v15 = +[NSNumber numberWithBool:self->_displayedInHUD];
  v31[16] = v15;
  v30[17] = @"IsThirdPartyDevSupportModeHang";
  v16 = +[NSNumber numberWithBool:self->_isThirdPartyDevSupportModeHang];
  v31[17] = v16;
  v17 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:18];
  v18 = +[NSMutableDictionary dictionaryWithDictionary:v17];

  if (!v10) {
  if (sub_10001C798(self->_serviceName) == 1)
  }
  {
    v19 = +[HTProcessInfo recentAppsDict];
    [v18 setObject:v19 forKeyedSubscript:@"RecentAppsDict"];
  }
  if (self->_hangSubType == 5)
  {
    v20 = +[NSNumber numberWithUnsignedLongLong:self->_blownFenceID];
    [v18 setObject:v20 forKeyedSubscript:@"CAFenceId"];
  }

  return (NSDictionary *)v18;
}

- (HTHangInfo)initWithPid:(int)a3 threadID:(unint64_t)a4 startTime:(unint64_t)a5 endTime:(unint64_t)a6 reportedTime:(unint64_t)a7 blownFenceID:(unint64_t)a8 hangSubtype:(int64_t)a9 isFirstPartyApp:(BOOL)a10 isThirdPartyDevSupportModeHang:(BOOL)a11 displayedInHUD:(BOOL)a12 serviceName:(id)a13 reason:(id)a14 processName:(id)a15 processPath:(id)a16 userActionData:(id)a17
{
  id v22 = a13;
  id v23 = a14;
  id v24 = a15;
  id v25 = a16;
  id v26 = a17;
  v47.receiver = self;
  v47.super_class = (Class)HTHangInfo;
  v27 = [(HTHangInfo *)&v47 init];
  if (v27)
  {
    v44 = v22;
    unint64_t v28 = a6;
    v29 = v26;
    id v30 = objc_alloc_init((Class)NSUUID);
    uint64_t v31 = [v30 UUIDString];
    hangUUID = v27->_hangUUID;
    v27->_hangUUID = (NSString *)v31;

    id v26 = v29;
    v27->_pid = a3;
    v27->_tid = a4;
    v27->_startTime = a5;
    v27->_endTime = v28;
    v27->_reportedTime = a7;
    v27->_blownFenceID = a8;
    v27->_hangSubType = a9;
    id v22 = v44;
    v27->_isFirstPartyApp = a10;
    v27->_isThirdPartyDevSupportModeHang = a11;
    v27->_displayedInHUD = a12;
    v33 = (NSString *)[v44 copy];
    serviceName = v27->_serviceName;
    v27->_serviceName = v33;

    v35 = (NSString *)[v23 copy];
    reason = v27->_reason;
    v27->_reason = v35;

    v37 = (NSString *)[v24 copy];
    processName = v27->_processName;
    v27->_processName = v37;

    v39 = (NSString *)[v25 copy];
    processPath = v27->_processPath;
    v27->_processPath = v39;

    v41 = (NSData *)[v29 copy];
    userActionData = v27->_userActionData;
    v27->_userActionData = v41;
  }
  return v27;
}

+ (double)getHangWaitTimeout
{
  uint64_t v2 = mach_absolute_time();
  unint64_t v3 = +[HTProcessInfo getEarliestPendingHangStartTime:v2];
  if (v3 >= qword_100063C50) {
    uint64_t v4 = qword_100063C50;
  }
  else {
    uint64_t v4 = v3;
  }
  if (v3) {
    unint64_t v5 = v4;
  }
  else {
    unint64_t v5 = qword_100063C50;
  }
  if (qword_100063C50) {
    BOOL v6 = qword_100063C58 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    id v7 = sub_100027DEC();
    double v8 = 0.0;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_1000316AC(v7);
    }
  }
  else
  {
    unint64_t v9 = v3;
    if (v2 >= v5)
    {
      if (v2 >= qword_100063C58)
      {
        if (v2 >= v3)
        {
          double v10 = sub_10002A984(v2 - v5);
          double v11 = sub_10002A984(v2 - qword_100063C58);
          long long v12 = +[HTPrefs sharedPrefs];
          double v13 = (double)(unint64_t)[v12 hangWaitTimeoutDurationMSec];

          double v14 = 0.0;
          double v15 = 0.0;
          if (v10 < v13)
          {
            v16 = +[HTPrefs sharedPrefs];
            double v15 = (double)(unint64_t)[v16 hangWaitTimeoutDurationMSec] - v10;
          }
          double v17 = 0.0;
          if (v9)
          {
            double v14 = sub_10002A984(v2 - v9);
            if (v15 + v14 >= 500.0) {
              double v17 = v15;
            }
            else {
              double v17 = 0.0;
            }
          }
          double v18 = 0.0;
          if (qword_100063C30 > v2) {
            double v18 = sub_10002A984(qword_100063C30 - v2);
          }
          double v19 = 350.0 - v11;
          if (350.0 - v11 > v15 + -250.0) {
            double v19 = v15 + -250.0;
          }
          if (v15 >= 250.0 && v11 < 350.0) {
            double v21 = v19;
          }
          else {
            double v21 = 0.0;
          }
          if (v17 >= v18) {
            double v22 = v17;
          }
          else {
            double v22 = v18;
          }
          if (v22 < v21) {
            double v22 = v21;
          }
          if (v22 <= v15) {
            double v8 = v22;
          }
          else {
            double v8 = v15;
          }
          id v7 = sub_100027DEC();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            int v24 = 134219776;
            double v25 = v8;
            __int16 v26 = 2048;
            double v27 = v10;
            __int16 v28 = 2048;
            double v29 = v14;
            __int16 v30 = 2048;
            double v31 = v11;
            __int16 v32 = 2048;
            double v33 = v15;
            __int16 v34 = 2048;
            double v35 = v17;
            __int16 v36 = 2048;
            double v37 = v18;
            __int16 v38 = 2048;
            double v39 = v21;
            _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "getHangWaitTimeout: waitTimeMS=%.0fms, timeSinceEarliestHangStartMS=%.0fms, timeSinceEarliestPendingHangStartMS=%.0fms, timeSinceLastHangReportedMS=%.0fms, maxRemainingWaitTimeMS=%.0fms, timeToWaitForPendingHangsMs=%.0fms, timeToWaitForHangsThatEndsInTheFutureMS=%.0fms, timeToWaitForConsecutiveHangsMS=%.0fms", (uint8_t *)&v24, 0x52u);
          }
        }
        else
        {
          id v7 = sub_100027DEC();
          double v8 = 0.0;
          if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
            sub_100031834();
          }
        }
      }
      else
      {
        id v7 = sub_100027DEC();
        double v8 = 0.0;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
          sub_1000317A8(v2, v7);
        }
      }
    }
    else
    {
      id v7 = sub_100027DEC();
      double v8 = 0.0;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        sub_100031740();
      }
    }
  }

  return v8;
}

- (int)pid
{
  return self->_pid;
}

- (unint64_t)tid
{
  return self->_tid;
}

- (unint64_t)startTime
{
  return self->_startTime;
}

- (unint64_t)endTime
{
  return self->_endTime;
}

- (unint64_t)reportedTime
{
  return self->_reportedTime;
}

- (unint64_t)blownFenceID
{
  return self->_blownFenceID;
}

- (int64_t)hangSubType
{
  return self->_hangSubType;
}

- (BOOL)displayedInHUD
{
  return self->_displayedInHUD;
}

- (BOOL)isFirstPartyApp
{
  return self->_isFirstPartyApp;
}

- (BOOL)isThirdPartyDevSupportModeHang
{
  return self->_isThirdPartyDevSupportModeHang;
}

- (NSString)serviceName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)reason
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)hangTimestamp
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)processName
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (NSString)processPath
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (NSData)userActionData
{
  return (NSData *)objc_getProperty(self, a2, 104, 1);
}

- (int64_t)failReason
{
  return self->_failReason;
}

- (void)setFailReason:(int64_t)a3
{
  self->_failReason = a3;
}

- (NSString)hangUUID
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hangUUID, 0);
  objc_storeStrong((id *)&self->_userActionData, 0);
  objc_storeStrong((id *)&self->_processPath, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_hangTimestamp, 0);
  objc_storeStrong((id *)&self->_reason, 0);

  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end