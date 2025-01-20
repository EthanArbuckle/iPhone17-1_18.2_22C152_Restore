@interface CLDurianMetricManager
+ (void)submitConnectionAttemptEvent:(double)a3 numberBTConnectionAttempts:(unint64_t)a4 connectionReason:(id)a5 deviceType:(id)a6;
+ (void)submitConnectionAttemptSuccessEvent:(double)a3 krMaterial:(unsigned __int8)a4 connectionReason:(id)a5 deviceType:(id)a6;
+ (void)submitFirmwareVersionsForOwnedTag:(id)a3 firmwareVersion:(id)a4;
+ (void)submitKeyFetchEvent:(double)a3 numberMaterials:(unint64_t)a4 isDrift:(unsigned __int8)a5 deviceType:(id)a6;
- (AKAppleIDSession)authSession;
- (CLDurianMetricManager)init;
- (CLDurianMetricManager)initWithQueue:(id)a3;
- (NSString)authHeaderValue;
- (NSString)lastLeashBreakAccessoryType;
- (double)currLeashBreakAPWakeDelta;
- (double)lastLeashBreak;
- (double)systemWakeTime;
- (id)assembleCommonConnectionEventDataWithMetrics:(id)a3 forDevice:(id)a4;
- (int64_t)encodeTransmitPower:(double)a3;
- (int64_t)maintenanceSubmissionCount;
- (void)dealloc;
- (void)setAuthHeaderValue:(id)a3;
- (void)setAuthSession:(id)a3;
- (void)setCurrLeashBreakAPWakeDelta:(double)a3;
- (void)setLastLeashBreak:(double)a3;
- (void)setLastLeashBreakAccessoryType:(id)a3;
- (void)setMaintenanceSubmissionCount:(int64_t)a3;
- (void)setSystemWakeTime:(double)a3;
- (void)submitBeaconLocationMetric:(id)a3 type:(int64_t)a4 timestampAdjusted:(BOOL)a5 forDevice:(id)a6;
- (void)submitCAConnectionMetrics:(id)a3 forDevice:(id)a4;
- (void)submitCAFirmwareUpdateMetrics:(id)a3 forDevice:(id)a4;
- (void)submitCAMaintenanceMetrics:(id)a3;
- (void)submitCarMaintConnectionMetrics:(unint64_t)a3;
- (void)submitCarMaintMetrics:(unint64_t)a3;
- (void)submitConnectionMetrics:(id)a3 forDevice:(id)a4;
- (void)submitCustomerNordicCrash:(id)a3 roseCrashes:(id)a4 firmwareVersion:(id)a5;
- (void)submitFirmwareUpdateMetrics:(id)a3 forDevice:(id)a4;
- (void)submitMaintenanceMetrics:(id)a3;
- (void)submitMaintenanceMetrics:(id)a3 forDevice:(id)a4 withReason:(id)a5 andCategory:(unint64_t)a6 andDuration:(double)a7 leashable:(BOOL)a8;
- (void)submitMaintenanceTimerFiredMetrics:(double)a3 actualInterval:(double)a4;
- (void)submitNonTimerMaintenanceMetricsForDevice:(id)a3 proactive:(unsigned int)a4;
- (void)submitPendingConnectionAttemptMetrics:(id)a3 attemptDuration:(double)a4 connectionReason:(id)a5 deviceType:(id)a6;
- (void)submitPowerLogConnectionMetrics:(id)a3 forDevice:(id)a4;
- (void)submitPowerLogEvent:(id)a3 data:(id)a4;
- (void)submitPowerLogMaintenanceMetrics:(id)a3;
- (void)submitSystemWakeLeashBreakMetricsPerAccessoryAtLoi:(id)a3 forLeashBreak:(BOOL)a4;
- (void)submitTaskMetricsForDevice:(id)a3 task:(id)a4 completed:(BOOL)a5 errorCode:(int64_t)a6;
- (void)submitUnexpectedMissingBeaconMetrics:(id)a3 disconnected:(BOOL)a4;
- (void)submitUserStats:(id)a3 payload:(id)a4;
@end

@implementation CLDurianMetricManager

- (CLDurianMetricManager)init
{
  return 0;
}

- (CLDurianMetricManager)initWithQueue:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CLDurianMetricManager;
  v3 = [(CLDurianMetricManager *)&v9 init];
  if (v3)
  {
    v4 = [+[NSBundle mainBundle] bundleIdentifier];
    if (objc_opt_class()) {
      -[CLDurianMetricManager setAuthSession:](v3, "setAuthSession:", [objc_alloc((Class)AKAppleIDSession) initWithIdentifier:v4]);
    }
    id v5 = [[+[ACAccountStore defaultStore](ACAccountStore, "defaultStore") aa_primaryAppleAccount];
    id v6 = [v5 aa_personID];
    id v7 = [v5 credential];
    -[CLDurianMetricManager setAuthHeaderValue:](v3, "setAuthHeaderValue:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Basic %@", -[NSData base64EncodedStringWithOptions:](-[NSString dataUsingEncoding:](+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@:%@", v6, [v7 credentialItemForKey:ACSearchPartyTokenKey]), "dataUsingEncoding:", 4), "base64EncodedStringWithOptions:", 0)));
    v3->_maintenanceSubmissionCount = 0;
    v3->_lastLeashBreak = 0.0;
    v3->_currLeashBreakAPWakeDelta = 0.0;
    v3->_systemWakeTime = 0.0;
    [(CLDurianMetricManager *)v3 setLastLeashBreakAccessoryType:@"Unset"];
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLDurianMetricManager;
  [(CLDurianMetricManager *)&v3 dealloc];
}

- (void)submitConnectionMetrics:(id)a3 forDevice:(id)a4
{
  -[CLDurianMetricManager submitCAConnectionMetrics:forDevice:](self, "submitCAConnectionMetrics:forDevice:");

  [(CLDurianMetricManager *)self submitPowerLogConnectionMetrics:a3 forDevice:a4];
}

- (void)submitFirmwareUpdateMetrics:(id)a3 forDevice:(id)a4
{
}

- (int64_t)encodeTransmitPower:(double)a3
{
  if (a3 < 0.0) {
    return 0;
  }
  if (a3 <= 5.0) {
    return 5;
  }
  if (a3 <= 8.0) {
    return 8;
  }
  int64_t v4 = 20;
  if (a3 > 20.0) {
    int64_t v4 = 25;
  }
  if (a3 > 10.0) {
    return v4;
  }
  else {
    return 10;
  }
}

- (id)assembleCommonConnectionEventDataWithMetrics:(id)a3 forDevice:(id)a4
{
  id v7 = +[NSMutableDictionary dictionary];
  [v7 setObject:objc_msgSend(a3, "objectForKeyedSubscript:", @"event") forKeyedSubscript:@"type"];
  [v7 setObject:&off_1023953A8 forKeyedSubscript:@"triggerCount"];
  [v7 setObject:objc_msgSend(a3, "objectForKeyedSubscript:", @"reason") forKeyedSubscript:@"reason"];
  [v7 setObject:[objc_msgSend(objc_msgSend(a4, "beacon"), "systemVersion")] forKeyedSubscript:@"firmwareVersion"];
  [v7 setObject:[a4 accessoryTypeName] forKeyedSubscript:@"productName"];
  if (objc_msgSend(objc_msgSend(a4, "beacon"), "manufacturerName")
    && objc_msgSend(objc_msgSend(a4, "beacon"), "modelName"))
  {
    [v7 setObject:[objc_msgSend(objc_msgSend(a4, "beacon"), "manufacturerName")] forKeyedSubscript:@"manufacturer"];
    unsigned int v8 = [[[a4 beacon] manufacturerName] isEqualToString:@"Apple"];
    id v9 = [objc_msgSend(a4, "beacon") modelName];
    if (v8) {
      CFStringRef v10 = @"firstPartyModelName";
    }
    else {
      CFStringRef v10 = @"thirdPartyModelName";
    }
    if (v8) {
      CFStringRef v11 = @"firstPartyFirmwareVersion";
    }
    else {
      CFStringRef v11 = @"thirdPartyFirmwareVersion";
    }
    [v7 setObject:v9 forKeyedSubscript:v10];
    [v7 setObject:[objc_msgSend(objc_msgSend(a4, "beacon"), "systemVersion")] forKeyedSubscript:v11];
    [objc_msgSend(a4, "beacon") txPower];
    goto LABEL_12;
  }
  unsigned int v13 = [a4 isAirTag];
  [v7 setObject:@"Apple" forKeyedSubscript:@"manufacturer"];
  if (v13)
  {
    [v7 setObject:@"FindMyAccessory" forKeyedSubscript:@"firstPartyModelName"];
    double v12 = 4.0;
LABEL_12:
    [v7 setObject:[+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[CLDurianMetricManager encodeTransmitPower:](self, "encodeTransmitPower:", v12))] forKeyedSubscript:@"transmitPower"];
  }
  return v7;
}

- (void)submitPowerLogConnectionMetrics:(id)a3 forDevice:(id)a4
{
  id v5 = [[self assembleCommonConnectionEventDataWithMetrics:a3 forDevice:a4] copy];

  [(CLDurianMetricManager *)self submitPowerLogEvent:@"DeviceConnection" data:v5];
}

- (void)submitCAConnectionMetrics:(id)a3 forDevice:(id)a4
{
  id v5 = [(CLDurianMetricManager *)self assembleCommonConnectionEventDataWithMetrics:a3 forDevice:a4];
  if ([a3 objectForKeyedSubscript:@"duration"]) {
    [v5 setObject:objc_msgSend(a3, "objectForKeyedSubscript:", @"duration") forKeyedSubscript:@"duration"];
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_1023320F0);
  }
  id v6 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289283;
    int v8 = 0;
    __int16 v9 = 2082;
    CFStringRef v10 = "";
    __int16 v11 = 2113;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #metrics send connection event\", \"event\":%{private, location:escape_only}@}", buf, 0x1Cu);
  }
  AnalyticsSendEventLazy();
}

- (void)submitCAFirmwareUpdateMetrics:(id)a3 forDevice:(id)a4
{
  id v5 = [(CLDurianMetricManager *)self assembleCommonConnectionEventDataWithMetrics:a3 forDevice:a4];
  if ([a3 objectForKeyedSubscript:@"disconnectReason"]) {
    [v5 setObject:objc_msgSend(a3, "objectForKeyedSubscript:", @"disconnectReason") forKeyedSubscript:@"DisconnectReason"];
  }
  if ([a3 objectForKeyedSubscript:@"firmwareUpdateblockingTask"]) {
    [v5 setObject:objc_msgSend(a3, "objectForKeyedSubscript:", @"firmwareUpdateblockingTask") forKeyedSubscript:@"blockingTask"];
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_1023320F0);
  }
  id v6 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 68289283;
    v7[1] = 0;
    __int16 v8 = 2082;
    __int16 v9 = "";
    __int16 v10 = 2113;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #metrics send FW Update event\", \"event\":%{private, location:escape_only}@}", (uint8_t *)v7, 0x1Cu);
  }
  AnalyticsSendEvent();
}

- (void)submitCAMaintenanceMetrics:(id)a3
{
  [a3 referenceTime];
  if (v5 != 0.0)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    [a3 referenceTime];
    double v8 = Current - v7;
    [a3 timeBetweenTriggers];
    if (v8 <= 1.0)
    {
      int v10 = 1;
    }
    else if (v8 >= 6.0)
    {
      if (v8 >= 7.0)
      {
        if (v8 >= 10.0)
        {
          if (v8 >= 15.0)
          {
            if (v8 >= 20.0)
            {
              if (v8 >= 28.0)
              {
                if (v8 >= 45.0)
                {
                  if (v8 >= 90.0)
                  {
                    if (v8 >= 180.0)
                    {
                      if (v8 >= 300.0)
                      {
                        if (v8 >= 600.0) {
                          int v10 = 601;
                        }
                        else {
                          int v10 = 600;
                        }
                      }
                      else
                      {
                        int v10 = 300;
                      }
                    }
                    else
                    {
                      int v10 = 180;
                    }
                  }
                  else
                  {
                    int v10 = 90;
                  }
                }
                else
                {
                  int v10 = 45;
                }
              }
              else
              {
                int v10 = 28;
              }
            }
            else
            {
              int v10 = 20;
            }
          }
          else
          {
            int v10 = 15;
          }
        }
        else
        {
          int v10 = 10;
        }
      }
      else
      {
        int v10 = 7;
      }
    }
    else
    {
      int v10 = 6;
    }
    if (v9 >= 0.0)
    {
      if (v9 <= 700.0)
      {
        int v11 = 700;
      }
      else if (v9 <= 800.0)
      {
        int v11 = 800;
      }
      else if (v9 <= 840.0)
      {
        int v11 = 840;
      }
      else if (v9 <= 870.0)
      {
        int v11 = 900;
      }
      else if (v9 <= 928.0)
      {
        int v11 = 928;
      }
      else if (v9 <= 932.0)
      {
        int v11 = 932;
      }
      else if (v9 <= 1000.0)
      {
        int v11 = 1000;
      }
      else if (v9 <= 3060.0)
      {
        int v11 = 3060;
      }
      else if (v9 <= 3600.0)
      {
        int v11 = 3600;
      }
      else if (v9 <= 3960.0)
      {
        int v11 = 3960;
      }
      else if (v9 <= 5400.0)
      {
        int v11 = 5400;
      }
      else
      {
        int v11 = 5401;
      }
    }
    else
    {
      int v11 = -1;
    }
    unsigned int v12 = [[objc_msgSend(objc_msgSend(objc_msgSend(a3, "maintainedCategoryCountDictionary"), "objectForKeyedSubscript:", &off_1023953C0)) intValue];
    signed int v13 = [[[objc_msgSend(objc_msgSend(a3, "maintainedCategoryCountDictionary"), "objectForKeyedSubscript:", &off_1023953D8) intValue] + v12];
    unsigned int v14 = [[objc_msgSend(objc_msgSend(objc_msgSend(a3, "maintainedCategoryCountDictionary"), "objectForKeyedSubscript:", &off_1023953F0)) intValue];
    signed int v15 = [[objc_msgSend(objc_msgSend(objc_msgSend(a3, "maintainedCategoryCountDictionary"), "objectForKeyedSubscript:", &off_1023953D8)) intValue] + v14];
    int v16 = 10 * (100 * v13 / (int)[a3 devices] / 10);
    if (v16) {
      BOOL v17 = 1;
    }
    else {
      BOOL v17 = v13 <= 0;
    }
    if (v17) {
      int v18 = v16;
    }
    else {
      int v18 = 1;
    }
    int v19 = 10 * (100 * v15 / (int)[a3 devices] / 10);
    if (v19) {
      BOOL v20 = 1;
    }
    else {
      BOOL v20 = v15 <= 0;
    }
    if (v20) {
      int v21 = v19;
    }
    else {
      int v21 = 1;
    }
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_1023320F0);
    }
    v22 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
    {
      [a3 timeBetweenTriggers];
      int v36 = (int)v23;
      unsigned int v35 = [a3 devices];
      unsigned int v34 = [a3 leashable];
      id v33 = [a3 deviceTypes];
      unsigned int v32 = [a3 neededDiscovery];
      unsigned int v31 = [a3 coex];
      [a3 assertionDuration];
      int v30 = (int)v24;
      id v29 = [objc_msgSend(a3, "maintainedCategoryCountDictionary") objectForKeyedSubscript:&off_102395408];
      int v37 = v18;
      id v25 = [[objc_msgSend(a3, "maintainedCategoryCountDictionary") objectForKeyedSubscript:&off_1023953F0];
      id v26 = [[objc_msgSend(a3, "maintainedCategoryCountDictionary") objectForKeyedSubscript:&off_1023953C0];
      id v27 = [objc_msgSend(a3, "maintainedCategoryCountDictionary") objectForKeyedSubscript:&off_1023953D8];
      int64_t maintenanceSubmissionCount = self->_maintenanceSubmissionCount;
      *(_DWORD *)buf = 68293890;
      __int16 v40 = 2082;
      int v39 = 0;
      v41 = "";
      __int16 v42 = 1026;
      int v43 = (int)v8;
      __int16 v44 = 1026;
      int v45 = v10;
      __int16 v46 = 1026;
      int v47 = v36;
      __int16 v48 = 1026;
      int v49 = v11;
      __int16 v50 = 1026;
      unsigned int v51 = v35;
      __int16 v52 = 1026;
      unsigned int v53 = v34;
      __int16 v54 = 2114;
      id v55 = v33;
      __int16 v56 = 1026;
      unsigned int v57 = v32;
      __int16 v58 = 1026;
      unsigned int v59 = v31;
      __int16 v60 = 1026;
      int v61 = v30;
      __int16 v62 = 2114;
      id v63 = v29;
      __int16 v64 = 2114;
      id v65 = v25;
      __int16 v66 = 2114;
      id v67 = v26;
      __int16 v68 = 2114;
      id v69 = v27;
      __int16 v70 = 1026;
      signed int v71 = v13;
      __int16 v72 = 1026;
      signed int v73 = v15;
      __int16 v74 = 1026;
      int v75 = v37;
      __int16 v76 = 1026;
      int v77 = v21;
      __int16 v78 = 1026;
      int v79 = maintenanceSubmissionCount;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian #maint metrics\", \"duration\":%{public}d, \"durationBin\":%{public}d, \"tbm\":%{public}d, \"tbmBin\":%{public}d, \"durians\":%{public}d, \"leashable\":%{public}d, \"types\":%{public, location:escape_only}@, \"discovery\":%{public}d, \"coex\":%{public}d, \"assertDuration\":%{public}d, \"skipped\":%{public, location:escape_only}@, \"failed\":%{public, location:escape_only}@, \"nearowner\":%{public, location:escape_only}@, \"connected\":%{public, location:escape_only}@, \"nearowner\":%{public}d, \"connectattempt\":%{public}d, \"nearownerPct\":%{public}d, \"connectattemptPct\":%{public}d, \"submission\":%{public}d}", buf, 0x98u);
    }
    AnalyticsSendEventLazy();
    ++self->_maintenanceSubmissionCount;
  }
}

- (void)submitPowerLogMaintenanceMetrics:(id)a3
{
  [a3 referenceTime];
  if (v5 != 0.0)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    [a3 referenceTime];
    v8[0] = @"duration";
    v9[0] = +[NSNumber numberWithDouble:Current - v7];
    v8[1] = @"numDevices";
    v9[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [a3 devices]);
    v8[2] = @"maintainedReasonCountDictionary";
    v9[2] = [a3 maintainedReasonCountDictionary];
    [(CLDurianMetricManager *)self submitPowerLogEvent:@"MaintainedAllDevices" data:+[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3]];
  }
}

- (void)submitMaintenanceMetrics:(id)a3
{
  -[CLDurianMetricManager submitCAMaintenanceMetrics:](self, "submitCAMaintenanceMetrics:");

  [(CLDurianMetricManager *)self submitPowerLogMaintenanceMetrics:a3];
}

- (void)submitMaintenanceMetrics:(id)a3 forDevice:(id)a4 withReason:(id)a5 andCategory:(unint64_t)a6 andDuration:(double)a7 leashable:(BOOL)a8
{
  BOOL v51 = a8;
  if (a7 <= 1.0)
  {
    int v14 = 1;
  }
  else if (a7 >= 6.0)
  {
    if (a7 >= 7.0)
    {
      if (a7 >= 10.0)
      {
        if (a7 >= 15.0)
        {
          if (a7 >= 20.0)
          {
            if (a7 >= 28.0)
            {
              if (a7 >= 45.0)
              {
                if (a7 >= 90.0)
                {
                  if (a7 >= 180.0)
                  {
                    if (a7 >= 300.0)
                    {
                      if (a7 >= 600.0)
                      {
                        if (a7 >= 615.0) {
                          int v14 = 616;
                        }
                        else {
                          int v14 = 615;
                        }
                      }
                      else
                      {
                        int v14 = 600;
                      }
                    }
                    else
                    {
                      int v14 = 300;
                    }
                  }
                  else
                  {
                    int v14 = 180;
                  }
                }
                else
                {
                  int v14 = 90;
                }
              }
              else
              {
                int v14 = 45;
              }
            }
            else
            {
              int v14 = 28;
            }
          }
          else
          {
            int v14 = 20;
          }
        }
        else
        {
          int v14 = 15;
        }
      }
      else
      {
        int v14 = 10;
      }
    }
    else
    {
      int v14 = 7;
    }
  }
  else
  {
    int v14 = 6;
  }
  int v50 = v14;
  if (a6 > 3) {
    CFStringRef v15 = @"unknown";
  }
  else {
    CFStringRef v15 = off_102332110[a6];
  }
  CFStringRef v49 = v15;
  if ((uint64_t)objc_msgSend(objc_msgSend(a4, "beacon"), "connectableDeviceCount") > 10) {
    unsigned int v48 = 10;
  }
  else {
    unsigned int v48 = [[objc_msgSend(a4, "beacon") connectableDeviceCount];
  }
  id v16 = [a4 lastAdvertisementDelta];
  int v17 = (int)v16;
  if (v16)
  {
    if ((unint64_t)v16 >= 7)
    {
      if ((unint64_t)v16 >= 0x3D)
      {
        if ((unint64_t)v16 >= 0x385)
        {
          if ((unint64_t)v16 >= 0xE11)
          {
            if ((unint64_t)v16 >= 0x1C21)
            {
              if ((unint64_t)v16 >= 0x7081)
              {
                if ((unint64_t)v16 >= 0x15181) {
                  int v18 = 86401;
                }
                else {
                  int v18 = 86400;
                }
              }
              else
              {
                int v18 = 28800;
              }
            }
            else
            {
              int v18 = 7200;
            }
          }
          else
          {
            int v18 = 3600;
          }
        }
        else
        {
          int v18 = 900;
        }
      }
      else
      {
        int v18 = 60;
      }
    }
    else
    {
      int v18 = 6;
    }
  }
  else
  {
    int v18 = -1;
  }
  int v47 = v18;
  [a4 lastGroupClassicDisconnectionDelta];
  double v20 = v19;
  if (v19 < 0.0)
  {
    int v21 = -1;
LABEL_53:
    int v46 = v21;
    goto LABEL_56;
  }
  if (v19 != 0.0)
  {
    if (v19 <= 15.0)
    {
      int v21 = 900;
    }
    else if (v19 <= 30.0)
    {
      int v21 = 1800;
    }
    else if (v19 <= 60.0)
    {
      int v21 = 3600;
    }
    else if (v19 <= 120.0)
    {
      int v21 = 7200;
    }
    else if (v19 <= 180.0)
    {
      int v21 = 10800;
    }
    else if (v19 <= 240.0)
    {
      int v21 = 14400;
    }
    else if (v19 <= 360.0)
    {
      int v21 = 21600;
    }
    else if (v19 <= 480.0)
    {
      int v21 = 28800;
    }
    else if (v19 <= 720.0)
    {
      int v21 = 43200;
    }
    else if (v19 <= 1440.0)
    {
      int v21 = 86400;
    }
    else
    {
      int v21 = 86401;
    }
    goto LABEL_53;
  }
  int v46 = 0;
LABEL_56:
  unsigned int v22 = [[objc_msgSend(objc_msgSend(objc_msgSend(a3, "groupMaintDeltas"), "objectForKeyedSubscript:", objc_msgSend(a4, "groupUuid")), "intValue");
  unsigned int v42 = v22;
  if ((int)v22 < 1)
  {
    int v45 = 0;
  }
  else
  {
    if (v22 >= 0x385)
    {
      if (v22 >= 0x709)
      {
        if (v22 >= 0xE11)
        {
          if (v22 >= 0x1C21)
          {
            if (v22 >= 0x2A31)
            {
              if (v22 >= 0x3841)
              {
                if (v22 >= 0x5461)
                {
                  if (v22 >= 0x7081)
                  {
                    if (v22 >= 0xA8C1)
                    {
                      if (v22 >= 0x15181) {
                        int v23 = 86401;
                      }
                      else {
                        int v23 = 86400;
                      }
                    }
                    else
                    {
                      int v23 = 43200;
                    }
                  }
                  else
                  {
                    int v23 = 28800;
                  }
                }
                else
                {
                  int v23 = 21600;
                }
              }
              else
              {
                int v23 = 14400;
              }
            }
            else
            {
              int v23 = 10800;
            }
          }
          else
          {
            int v23 = 7200;
          }
        }
        else
        {
          int v23 = 3600;
        }
      }
      else
      {
        int v23 = 1800;
      }
    }
    else
    {
      int v23 = 900;
    }
    int v45 = v23;
  }
  unsigned int v24 = [a4 isHeleAccessory] - 1;
  unsigned int v25 = (int)(a7 + -6.0);
  unsigned int v26 = [a4 isHeleAccessory];
  if (a6 == 3 && v26)
  {
    if ((int)v25 < 1)
    {
      unsigned int v24 = 0;
    }
    else if (v25 >= 0x3D)
    {
      if (v25 >= 0x79)
      {
        if (v25 >= 0xB5)
        {
          if (v25 >= 0xF1)
          {
            if (v25 >= 0x12D)
            {
              if (v25 >= 0x259)
              {
                if (v25 >= 0x385)
                {
                  if (v25 >= 0x709)
                  {
                    if (v25 >= 0xE11)
                    {
                      if (v25 >= 0xF3D) {
                        unsigned int v24 = 99;
                      }
                      else {
                        unsigned int v24 = 65;
                      }
                    }
                    else
                    {
                      unsigned int v24 = 60;
                    }
                  }
                  else
                  {
                    unsigned int v24 = 30;
                  }
                }
                else
                {
                  unsigned int v24 = 15;
                }
              }
              else
              {
                unsigned int v24 = 10;
              }
            }
            else
            {
              unsigned int v24 = 5;
            }
          }
          else
          {
            unsigned int v24 = 4;
          }
        }
        else
        {
          unsigned int v24 = 3;
        }
      }
      else
      {
        unsigned int v24 = 2;
      }
    }
    else
    {
      unsigned int v24 = 1;
    }
  }
  [a4 intervalSinceLastSearchPartyKeyObservation];
  double v28 = v27;
  int64_t maintenanceSubmissionCount = self->_maintenanceSubmissionCount;
  uint64_t v30 = (int)[a3 devices];
  id v52 = a3;
  int v43 = v17;
  int v44 = a6;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_1023320F0);
  }
  uint64_t v31 = maintenanceSubmissionCount % v30;
  unsigned int v32 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68291587;
    int v54 = 0;
    __int16 v55 = 2082;
    __int16 v56 = "";
    __int16 v57 = 2113;
    id v58 = [[[objc_msgSend(objc_msgSend(a4, "uuid"), "description") substringToIndex:8];
    __int16 v59 = 2113;
    *(void *)__int16 v60 = a5;
    *(_WORD *)&v60[8] = 2114;
    *(void *)&v60[10] = v49;
    *(_WORD *)&v60[18] = 1026;
    *(_DWORD *)int v61 = (int)a7;
    *(_WORD *)&v61[4] = 1026;
    *(_DWORD *)__int16 v62 = v50;
    *(_WORD *)&v62[4] = 1026;
    *(_DWORD *)id v63 = v48;
    *(_WORD *)&v63[4] = 1026;
    *(_DWORD *)__int16 v64 = [a3 coex];
    *(_WORD *)&v64[4] = 2114;
    id v65 = [a4 accessoryTypeName];
    *(_WORD *)__int16 v66 = 1026;
    *(_DWORD *)&v66[2] = (int)v28;
    *(_WORD *)id v67 = 1026;
    *(_DWORD *)&v67[2] = v31 == 0;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian #maint metrics\", \"item\":%{private, location:escape_only}@, \"outcome\":%{private, location:escape_only}@, \"category\":%{public, location:escape_only}@, \"duration\":%{public}d, \"durationBin\":%{public}d, \"maintainers\":%{public}d, \"coex\":%{public}d, \"product\":%{public, location:escape_only}@, \"lastObservation\":%{public}d, \"submit\":%{public}d}", buf, 0x5Eu);
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_1023320F0);
    }
  }
  id v33 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v34 = v31;
    id v35 = [[[objc_msgSend(objc_msgSend(a4, "uuid"), "description") substringToIndex:8];
    unsigned int v36 = v24;
    id v37 = a5;
    unsigned int v38 = [a4 isHeleAccessory];
    unsigned int v39 = [a4 numProactiveAttempts];
    unsigned int v40 = [a4 numProactiveConnects];
    id v41 = [v52 loiType];
    *(_DWORD *)buf = 68293123;
    int v54 = 0;
    __int16 v55 = 2082;
    __int16 v56 = "";
    __int16 v57 = 2113;
    id v58 = v35;
    uint64_t v31 = v34;
    __int16 v59 = 1026;
    *(_DWORD *)__int16 v60 = v38;
    *(_WORD *)&v60[4] = 2113;
    *(void *)&v60[6] = v37;
    *(_WORD *)&v60[14] = 1025;
    *(_DWORD *)&v60[16] = v44;
    *(_WORD *)int v61 = 1026;
    *(_DWORD *)&v61[2] = v39;
    *(_WORD *)__int16 v62 = 1026;
    *(_DWORD *)&v62[2] = v40;
    *(_WORD *)id v63 = 1026;
    *(_DWORD *)&v63[2] = v43;
    *(_WORD *)__int16 v64 = 1026;
    *(_DWORD *)&v64[2] = v47;
    LOWORD(v65) = 1026;
    *(_DWORD *)((char *)&v65 + 2) = v42;
    HIWORD(v65) = 1026;
    *(_DWORD *)__int16 v66 = v45;
    *(_WORD *)&v66[4] = 1026;
    *(_DWORD *)id v67 = (int)v20;
    *(_WORD *)&v67[4] = 1026;
    int v68 = v46;
    __int16 v69 = 1026;
    int v70 = (int)(a7 + -6.0);
    __int16 v71 = 1026;
    unsigned int v72 = v36;
    __int16 v73 = 2114;
    id v74 = v41;
    __int16 v75 = 1026;
    BOOL v76 = v51;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint metrics hele\", \"item\":%{private, location:escape_only}@, \"hele\":%{public}hhd, \"outcome\":%{private, location:escape_only}@, \"category\":%{private}d, \"proAtt\":%{public}d, \"proConn\":%{public}d, \"lastAdv\":%{public}d, \"lastAdvBin\":%{public}d, \"lastGroup\":%{public}d, \"lastGroupMaintBin\":%{public}d, \"lastClassic\":%{public}d, \"lastClassicBin\":%{public}d, \"heleconnect\":%{public}d, \"min\":%{public}d, \"loitype\":%{public, location:escape_only}@, \"leashable\":%{public}hhd}", buf, 0x7Eu);
  }
  if (!v31) {
    AnalyticsSendEventLazy();
  }
}

- (void)submitCustomerNordicCrash:(id)a3 roseCrashes:(id)a4 firmwareVersion:(id)a5
{
  v30[0] = @"softwareVersion";
  v31[0] = [a5 vanBurenVersion];
  v30[1] = @"hardwareVersion";
  v31[1] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a5 hardwareVersion]);
  v30[2] = @"roseAPVersion";
  v31[2] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a5 roseAPVersion]);
  v30[3] = @"roseDSPVersion";
  v31[3] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a5 roseDSPVersion]);
  v30[4] = @"calDataVersion";
  v31[4] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a5 calibrationDataVersion]);
  v30[5] = @"RTKitVersion";
  v31[5] = [a5 rtKitVersion];
  double v8 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:6]);
  if (a3)
  {
    v28[0] = @"nordicCrashPC";
    v29[0] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [a3 pc]);
    v28[1] = @"nordicCrashTruncatedReason";
    v29[1] = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", [a3 truncatedReason]);
    v28[2] = @"nordicCrashReferenceWallTime";
    v29[2] = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [a3 referenceWallTime]);
    v28[3] = @"nordicCrashReferenceTicks";
    v29[3] = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [a3 referenceTicks]);
    v28[4] = @"nordicCrashCurrentTicks";
    v29[4] = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [a3 currentTicks]);
    [(NSMutableDictionary *)v8 addEntriesFromDictionary:+[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:5]];
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = [a4 countByEnumeratingWithState:&v17 objects:v27 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(a4);
        }
        signed int v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v14 = [v13 core];
        if (v14)
        {
          if (v14 == 1) {
            CFStringRef v15 = @"DSP";
          }
          else {
            CFStringRef v15 = +[NSString stringWithFormat:@"Unknown%u", v14];
          }
        }
        else
        {
          CFStringRef v15 = @"AP";
        }
        -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", [v13 crashString], v15);
      }
      id v10 = [a4 countByEnumeratingWithState:&v17 objects:v27 count:16];
    }
    while (v10);
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_1023320F0);
  }
  id v16 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    int v22 = 0;
    __int16 v23 = 2082;
    unsigned int v24 = "";
    __int16 v25 = 2114;
    unsigned int v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #metrics sending #crash event\", \"metric\":%{public, location:escape_only}@}", buf, 0x1Cu);
  }
  AnalyticsSendEvent();
}

- (void)submitTaskMetricsForDevice:(id)a3 task:(id)a4 completed:(BOOL)a5 errorCode:(int64_t)a6
{
  if (a4 && (BOOL v9 = a5, v10 = [a4 command], a3) && v10)
  {
    id v11 = +[NSMutableDictionary dictionary];
    if (!v9) {
      [v11 setObject:+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a6) forKeyedSubscript:@"error"];
    }
    [v11 setObject:+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v9) forKeyedSubscript:@"success"];
    [v11 setObject:[+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", objc_msgSend(a4, "translatedOpcode"))] forKeyedSubscript:@"task"];
    [v11 setObject:&off_1023953A8 forKeyedSubscript:@"taskCount"];
    [v11 setObject:objc_msgSend(a3, "accessoryTypeName") forKeyedSubscript:@"productName"];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_1023320F0);
    }
    unsigned int v12 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 68289283;
      int v17 = 0;
      __int16 v18 = 2082;
      long long v19 = "";
      __int16 v20 = 2113;
      id v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #metrics send task event\", \"event\":%{private, location:escape_only}@}", (uint8_t *)&v16, 0x1Cu);
    }
    AnalyticsSendEvent();
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_1023320F0);
    }
    signed int v13 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
    {
      int v16 = 68289795;
      int v17 = 0;
      __int16 v18 = 2082;
      long long v19 = "";
      __int16 v20 = 2113;
      id v21 = a3;
      __int16 v22 = 2114;
      id v23 = a4;
      __int16 v24 = 2114;
      id v25 = [a4 command];
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #metrics received nil task or command\", \"device\":%{private, location:escape_only}@, \"task\":%{public, location:escape_only}@, \"task.command\":%{public, location:escape_only}@}", (uint8_t *)&v16, 0x30u);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_1023320F0);
      }
    }
    id v14 = qword_102419398;
    if (os_signpost_enabled((os_log_t)qword_102419398))
    {
      id v15 = [a4 command];
      int v16 = 68289795;
      int v17 = 0;
      __int16 v18 = 2082;
      long long v19 = "";
      __int16 v20 = 2113;
      id v21 = a3;
      __int16 v22 = 2114;
      id v23 = a4;
      __int16 v24 = 2114;
      id v25 = v15;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #metrics received nil task or command", "{\"msg%{public}.0s\":\"#durian #metrics received nil task or command\", \"device\":%{private, location:escape_only}@, \"task\":%{public, location:escape_only}@, \"task.command\":%{public, location:escape_only}@}", (uint8_t *)&v16, 0x30u);
    }
  }
}

- (void)submitBeaconLocationMetric:(id)a3 type:(int64_t)a4 timestampAdjusted:(BOOL)a5 forDevice:(id)a6
{
  BOOL v7 = a5;
  id v10 = +[NSMutableDictionary dictionary];
  [v10 setObject:[NSNumber numberWithInt:a3 != 0] forKey:@"locationReceived"];
  [v10 setObject:[+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v7)] forKey:@"timestampAdjusted"];
  if (objc_msgSend(objc_msgSend(a6, "beacon"), "systemVersion")) {
    [v10 setObject:[objc_msgSend(objc_msgSend(a6, "beacon"), "systemVersion")] forKey:@"firmwareVersion"];
  }
  [v10 setObject:[+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4)] forKey:@"beaconObservationType"];
  if (a3)
  {
    [a3 horizontalAccuracy];
    [v10 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:")] forKey:@"horizontalAccuracy"];
    [v10 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "signalEnvironmentType"))] forKey:@"signalEnvironment"];
  }
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_1023320F0);
  }
  id v11 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 68289283;
    v12[1] = 0;
    __int16 v13 = 2082;
    id v14 = "";
    __int16 v15 = 2113;
    id v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #metric submitting location accuracy\", \"metric\":%{private, location:escape_only}@}", (uint8_t *)v12, 0x1Cu);
  }
  AnalyticsSendEvent();
}

- (void)submitNonTimerMaintenanceMetricsForDevice:(id)a3 proactive:(unsigned int)a4
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_1023320F0);
  }
  id v6 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289539;
    int v8 = 0;
    __int16 v9 = 2082;
    id v10 = "";
    __int16 v11 = 2113;
    id v12 = [[[objc_msgSend(objc_msgSend(a3, "uuid"), "description") substringToIndex:8];
    __int16 v13 = 1026;
    unsigned int v14 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #metric nontimer maint\", \"item\":%{private, location:escape_only}@, \"proactive\":%{public}d}", buf, 0x22u);
  }
  AnalyticsSendEventLazy();
}

- (void)submitMaintenanceTimerFiredMetrics:(double)a3 actualInterval:(double)a4
{
  v6[0] = @"targetInterval";
  v6[1] = @"actualInterval";
  v7[0] = +[NSNumber numberWithDouble:a3];
  v7[1] = +[NSNumber numberWithDouble:a4];
  [(CLDurianMetricManager *)self submitPowerLogEvent:@"MaintenanceTimerFired" data:+[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2]];
}

- (void)submitPowerLogEvent:(id)a3 data:(id)a4
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_1023320F0);
  }
  id v6 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 68289539;
    v7[1] = 0;
    __int16 v8 = 2082;
    __int16 v9 = "";
    __int16 v10 = 2113;
    id v11 = a3;
    __int16 v12 = 2113;
    id v13 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian submitting PowerLog event\", \"event\":%{private, location:escape_only}@, \"data\":%{private, location:escape_only}@}", (uint8_t *)v7, 0x26u);
  }
  PLLogRegisteredEvent();
}

+ (void)submitKeyFetchEvent:(double)a3 numberMaterials:(unint64_t)a4 isDrift:(unsigned __int8)a5 deviceType:(id)a6
{
  int v7 = a5;
  uint32_t v10 = arc4random_uniform(4u);
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_1023320F0);
  }
  id v11 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68290306;
    int v13 = 0;
    __int16 v14 = 2082;
    __int16 v15 = "";
    __int16 v16 = 1026;
    int v17 = (int)a3;
    __int16 v18 = 2050;
    unint64_t v19 = a4;
    __int16 v20 = 1026;
    BOOL v21 = v7 != 0;
    __int16 v22 = 2114;
    id v23 = a6;
    __int16 v24 = 1026;
    BOOL v25 = v10 == 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #metric keyFetchEvent\", \"lastObservation\":%{public}d, \"numberMaterials\":%{public}lu, \"isDrift\":%{public}hhd, \"deviceType\":%{public, location:escape_only}@, \"shouldSubmit\":%{public}hhd}", buf, 0x38u);
  }
  if (!v10) {
    AnalyticsSendEventLazy();
  }
}

+ (void)submitConnectionAttemptEvent:(double)a3 numberBTConnectionAttempts:(unint64_t)a4 connectionReason:(id)a5 deviceType:(id)a6
{
  uint32_t v10 = arc4random_uniform(4u);
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_1023320F0);
  }
  id v11 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68290306;
    int v13 = 0;
    __int16 v14 = 2082;
    __int16 v15 = "";
    __int16 v16 = 1026;
    int v17 = (int)a3;
    __int16 v18 = 2050;
    unint64_t v19 = a4;
    __int16 v20 = 2114;
    id v21 = a5;
    __int16 v22 = 2114;
    id v23 = a6;
    __int16 v24 = 1026;
    BOOL v25 = v10 == 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #metric connectionAttemptEvent \", \"lastObservation\":%{public}d, \"numberBTConnectionAttempts\":%{public}lu, \"connectionReason\":%{public, location:escape_only}@, \"deviceType\":%{public, location:escape_only}@, \"shouldSubmit\":%{public}hhd}", buf, 0x3Cu);
  }
  if (!v10) {
    AnalyticsSendEventLazy();
  }
}

+ (void)submitConnectionAttemptSuccessEvent:(double)a3 krMaterial:(unsigned __int8)a4 connectionReason:(id)a5 deviceType:(id)a6
{
  int v8 = a4;
  uint32_t v10 = arc4random_uniform(4u);
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_1023320F0);
  }
  id v11 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68290306;
    int v13 = 0;
    __int16 v14 = 2082;
    __int16 v15 = "";
    __int16 v16 = 1026;
    int v17 = (int)a3;
    __int16 v18 = 1026;
    BOOL v19 = v8 == 0;
    __int16 v20 = 2114;
    id v21 = a5;
    __int16 v22 = 2114;
    id v23 = a6;
    __int16 v24 = 1026;
    BOOL v25 = v10 == 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #metric connectionAttemptEventSuccess \", \"lastObservation\":%{public}d, \"driftMaterial\":%{public}hhd, \"connectionReason\":%{public, location:escape_only}@, \"deviceType\":%{public, location:escape_only}@, \"shouldSubmit\":%{public}hhd}", buf, 0x38u);
  }
  if (!v10) {
    AnalyticsSendEventLazy();
  }
}

+ (void)submitFirmwareVersionsForOwnedTag:(id)a3 firmwareVersion:(id)a4
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_1023320F0);
  }
  id v6 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289538;
    int v8 = 0;
    __int16 v9 = 2082;
    uint32_t v10 = "";
    __int16 v11 = 2114;
    id v12 = a4;
    __int16 v13 = 2114;
    id v14 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #metric submitFirmwareVersionsForOwnedTag\", \"firmwareVersion\":%{public, location:escape_only}@, \"deviceUUID\":%{public, location:escape_only}@}", buf, 0x26u);
  }
  AnalyticsSendEventLazy();
}

- (void)submitUserStats:(id)a3 payload:(id)a4
{
  if (a4 && [a4 version] == (id)2)
  {
    id v6 = +[CLDurianVersionNumberUtilities getStringFromNumber:](CLDurianVersionNumberUtilities, "getStringFromNumber:", [a3 buildNumber]);
    id v7 = [[[a3 uuid] UUIDString];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_1023320F0);
    }
    int v8 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v35 = [a4 utAccelCount];
      unsigned int v34 = [a4 bomSoundCount];
      [a4 bootR1Time];
      int v33 = (int)v9;
      [a4 dualLeashedTime];
      int v32 = (int)v10;
      [a4 dualConnTime];
      int v31 = (int)v11;
      [a4 leashedTime];
      int v30 = (int)v12;
      [a4 multiLeashedTime];
      int v29 = (int)v13;
      [a4 multiTimeV2];
      int v28 = (int)v14;
      [a4 nearOwnerTimeV2];
      int v27 = (int)v15;
      id v36 = v6;
      unsigned int v16 = [a4 ownerLongSoundCount];
      unsigned int v17 = [a4 ownerShortSoundCount];
      unsigned int v18 = [a4 utLongSoundCount];
      unsigned int v19 = [a4 utShortSoundCount];
      [a4 rangingTime];
      int v21 = (int)v20;
      [a4 singleConnTime];
      int v23 = (int)v22;
      [a4 wildTime];
      int v25 = (int)v24;
      [a4 lastClear];
      *(_DWORD *)buf = 68293890;
      __int16 v39 = 2082;
      int v38 = 0;
      unsigned int v40 = "";
      __int16 v41 = 1026;
      unsigned int v42 = v35;
      __int16 v43 = 1026;
      unsigned int v44 = v34;
      __int16 v45 = 1026;
      int v46 = v33;
      __int16 v47 = 1026;
      int v48 = v32;
      __int16 v49 = 1026;
      int v50 = v31;
      __int16 v51 = 1026;
      int v52 = v30;
      __int16 v53 = 1026;
      int v54 = v29;
      __int16 v55 = 1026;
      int v56 = v28;
      __int16 v57 = 1026;
      int v58 = v27;
      __int16 v59 = 1026;
      unsigned int v60 = v16;
      __int16 v61 = 1026;
      unsigned int v62 = v17;
      __int16 v63 = 2114;
      id v64 = v36;
      __int16 v65 = 2114;
      id v66 = v7;
      __int16 v67 = 1026;
      unsigned int v68 = v18;
      __int16 v69 = 1026;
      unsigned int v70 = v19;
      __int16 v71 = 1026;
      int v72 = v21;
      __int16 v73 = 1026;
      int v74 = v23;
      __int16 v75 = 1026;
      int v76 = v25;
      __int16 v77 = 1026;
      int v78 = (int)v26;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #metric userstatsV2Submission\", \"BOMAccelCount\":%{public}d, \"BOMSoundCount\":%{public}d, \"bootR1Time\":%{public}d, \"dualConnectionLeashedTime\":%{public}d, \"dualConnectionTime\":%{public}d, \"leashedTime\":%{public}d, \"multiLeashedTime\":%{public}d, \"multiTime\":%{public}d, \"nearOwnerTime\":%{public}d, \"ownerPlaySoundLongCount\":%{public}d, \"ownerPlaySoundShortCount\":%{public}d, \"pairedDeviceFirmwareVersion\":%{public, location:escape_only}@, \"pairedDeviceID\":%{public, location:escape_only}@, \"playSoundLongUTCount\":%{public}d, \"playSoundShortUTCount\":%{public}d, \"rangingTime\":%{public}d, \"singleConnectionTime\":%{public}d, \"wildTime\":%{public}d, \"observationDurationFW\":%{public}d}", buf, 0x8Cu);
    }
    AnalyticsSendEventLazy();
  }
}

- (void)submitCarMaintMetrics:(unint64_t)a3
{
  id v4 = +[NSMutableDictionary dictionary];
  [v4 setObject:+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3) forKeyedSubscript:@"scanCount"];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_1023320F0);
  }
  double v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289283;
    v6[1] = 0;
    __int16 v7 = 2082;
    int v8 = "";
    __int16 v9 = 2113;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #metrics send car maintenance scan count event\", \"event\":%{private, location:escape_only}@}", (uint8_t *)v6, 0x1Cu);
  }
  AnalyticsSendEvent();
}

- (void)submitCarMaintConnectionMetrics:(unint64_t)a3
{
  id v4 = +[NSMutableDictionary dictionary];
  [v4 setObject:+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3) forKeyedSubscript:@"connectCount"];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_1023320F0);
  }
  double v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289283;
    v6[1] = 0;
    __int16 v7 = 2082;
    int v8 = "";
    __int16 v9 = 2113;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #metrics send car maintenance connection attempt count event\", \"event\":%{private, location:escape_only}@}", (uint8_t *)v6, 0x1Cu);
  }
  AnalyticsSendEvent();
}

- (void)submitUnexpectedMissingBeaconMetrics:(id)a3 disconnected:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = +[NSMutableDictionary dictionary];
  [v6 setObject:[a3 accessoryTypeName] forKeyedSubscript:@"productName"];
  [v6 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(a3, "ownership") == (id)1)] forKeyedSubscript:@"owned"];
  [v6 setObject:+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4) forKeyedSubscript:@"disconnected"];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_1023320F0);
  }
  __int16 v7 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 68289283;
    v8[1] = 0;
    __int16 v9 = 2082;
    id v10 = "";
    __int16 v11 = 2113;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #metrics send unexpected missing beacon event\", \"event\":%{private, location:escape_only}@}", (uint8_t *)v8, 0x1Cu);
  }
  AnalyticsSendEvent();
}

- (void)submitPendingConnectionAttemptMetrics:(id)a3 attemptDuration:(double)a4 connectionReason:(id)a5 deviceType:(id)a6
{
  id v9 = +[NSMutableDictionary dictionary];
  [v9 setObject:objc_msgSend(a3, "accessoryTypeName") forKeyedSubscript:@"productName"];
  [v9 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(a3, "ownership") == (id)1)] forKeyedSubscript:@"owned"];
  [v9 setObject:a5 forKeyedSubscript:@"connectReason"];
  [v9 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4)] forKeyedSubscript:@"attemptDuration"];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_1023320F0);
  }
  id v10 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 68289283;
    v11[1] = 0;
    __int16 v12 = 2082;
    double v13 = "";
    __int16 v14 = 2113;
    id v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #metrics send pending connection attempt event\", \"event\":%{private, location:escape_only}@}", (uint8_t *)v11, 0x1Cu);
  }
  AnalyticsSendEvent();
}

- (void)submitSystemWakeLeashBreakMetricsPerAccessoryAtLoi:(id)a3 forLeashBreak:(BOOL)a4
{
  BOOL v4 = a4;
  [(CLDurianMetricManager *)self systemWakeTime];
  if (v7 == 0.0)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_1023320F0);
    }
    int v8 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 68289026;
      int v18 = 0;
      __int16 v19 = 2082;
      double v20 = "";
      id v9 = "{\"msg%{public}.0s\":\"#durian #metrics leash break - AP Wake, no valid AP wake time, not submitting\"}";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v17, 0x12u);
    }
  }
  else
  {
    [(CLDurianMetricManager *)self lastLeashBreak];
    if (v10 == 0.0)
    {
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_1023320F0);
      }
      int v8 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 68289026;
        int v18 = 0;
        __int16 v19 = 2082;
        double v20 = "";
        id v9 = "{\"msg%{public}.0s\":\"#durian #metrics leash break - AP Wake, no valid leash break time, not submitting\"}";
        goto LABEL_11;
      }
    }
    else
    {
      [(CLDurianMetricManager *)self systemWakeTime];
      double v12 = v11;
      [(CLDurianMetricManager *)self lastLeashBreak];
      double v14 = v12 - v13;
      [(CLDurianMetricManager *)self setCurrLeashBreakAPWakeDelta:v14];
      id v15 = +[NSMutableDictionary dictionary];
      [v15 setObject:self->_lastLeashBreakAccessoryType forKeyedSubscript:@"productName"];
      [v15 setObject:+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v14) forKeyedSubscript:@"leashBreakAPWakeDelta"];
      [v15 setObject:a3 forKeyedSubscript:@"APWakeLoi"];
      [v15 setObject:+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4) forKeyedSubscript:@"leashBreak"];
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_1023320F0);
      }
      unsigned int v16 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 68289283;
        int v18 = 0;
        __int16 v19 = 2082;
        double v20 = "";
        __int16 v21 = 2113;
        id v22 = v15;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #metrics send leash break - AP wake time delta\", \"event\":%{private, location:escape_only}@}", (uint8_t *)&v17, 0x1Cu);
      }
      AnalyticsSendEvent();
    }
  }
}

- (NSString)lastLeashBreakAccessoryType
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLastLeashBreakAccessoryType:(id)a3
{
}

- (double)systemWakeTime
{
  return self->_systemWakeTime;
}

- (void)setSystemWakeTime:(double)a3
{
  self->_systemWakeTime = a3;
}

- (double)lastLeashBreak
{
  return self->_lastLeashBreak;
}

- (void)setLastLeashBreak:(double)a3
{
  self->_lastLeashBreak = a3;
}

- (double)currLeashBreakAPWakeDelta
{
  return self->_currLeashBreakAPWakeDelta;
}

- (void)setCurrLeashBreakAPWakeDelta:(double)a3
{
  self->_currLeashBreakAPWakeDelta = a3;
}

- (AKAppleIDSession)authSession
{
  return self->_authSession;
}

- (void)setAuthSession:(id)a3
{
}

- (NSString)authHeaderValue
{
  return self->_authHeaderValue;
}

- (void)setAuthHeaderValue:(id)a3
{
}

- (int64_t)maintenanceSubmissionCount
{
  return self->_maintenanceSubmissionCount;
}

- (void)setMaintenanceSubmissionCount:(int64_t)a3
{
  self->_int64_t maintenanceSubmissionCount = a3;
}

@end