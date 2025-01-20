@interface CARAnalytics
+ (BOOL)shouldRecordAnalyticsEvents;
+ (id)sharedInstance;
+ (int64_t)calendarUnitsOfType:(unint64_t)a3 fromDate:(id)a4 toDate:(id)a5;
- (BOOL)isCurrentlyDriving;
- (CARAnalytics)init;
- (CARConnectionTimeServiceAgent)connectionTimeServiceAgent;
- (NSDate)wirelessReconnectEndDate;
- (NSDate)wirelessReconnectStartDate;
- (NSNumber)wifiChannel;
- (double)driveStartTimeInterval;
- (id)_CARCoreAnalyticsEventNameForEvent:(unint64_t)a3;
- (unint64_t)carKeyPairingResult;
- (void)DNDEndedWithTrigger:(int)a3 vehicleHints:(unint64_t)a4 context:(id)a5;
- (void)DNDStartedWithTrigger:(int)a3 vehicleHints:(unint64_t)a4;
- (void)_prepareConnectionTTRDraftWithConnectionSession:(id)a3 withAdditionalDescription:(id)a4 completionHandler:(id)a5;
- (void)_wiredReconnectEnded;
- (void)_wirelessReconnectEnded;
- (void)navigationOwnershipEndedWithMaximumConcurrentCount:(unint64_t)a3;
- (void)reconnectEndedOnTransport:(unint64_t)a3;
- (void)sendEvent:(unint64_t)a3 withDictionary:(id)a4;
- (void)setCarKeyPairingResult:(unint64_t)a3;
- (void)setConnectionTimeServiceAgent:(id)a3;
- (void)setDriveStartTimeInterval:(double)a3;
- (void)setIsCurrentlyDriving:(BOOL)a3;
- (void)setWifiChannel:(id)a3;
- (void)setWirelessReconnectEndDate:(id)a3;
- (void)setWirelessReconnectStartDate:(id)a3;
- (void)userChangedAutoReplyFromAudience:(id)a3 toAudience:(id)a4 messageChanged:(BOOL)a5;
- (void)userChangedFromTriggerMethod:(id)a3 toMethod:(id)a4 withMechanism:(id)a5 fromPreviousInterval:(double)a6 activateWithCarPlay:(BOOL)a7;
- (void)userCreatedWirelessPairingWithSource:(id)a3 payload:(id)a4;
- (void)userIndicatedNotDrivingWithReason:(id)a3;
- (void)wiredSessionEnded;
- (void)wirelessReconnectCancelled;
- (void)wirelessReconnectStarted;
- (void)wirelessSessionEndedWithPayload:(id)a3;
@end

@implementation CARAnalytics

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000636E0;
  block[3] = &unk_1000BD350;
  block[4] = a1;
  if (qword_1000E3950 != -1) {
    dispatch_once(&qword_1000E3950, block);
  }
  v2 = (void *)qword_1000E3948;

  return v2;
}

- (CARAnalytics)init
{
  v3.receiver = self;
  v3.super_class = (Class)CARAnalytics;
  result = [(CARAnalytics *)&v3 init];
  if (result) {
    result->_driveStartTimeInterval = 0.0;
  }
  return result;
}

- (void)DNDStartedWithTrigger:(int)a3 vehicleHints:(unint64_t)a4
{
  if ([(CARAnalytics *)self isCurrentlyDriving])
  {
    v7 = CarDNDWDLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Not recording start event - we were already driving?", v13, 2u);
    }
    goto LABEL_25;
  }
  +[NSDate timeIntervalSinceReferenceDate];
  self->_driveStartTimeInterval = v8;
  self->_isCurrentlyDriving = 1;
  if (a4)
  {
    v9 = +[NSMutableArray array];
    v10 = v9;
    if (a4)
    {
      [v9 addObject:@"Motion"];
      if ((a4 & 2) == 0)
      {
LABEL_7:
        if ((a4 & 4) == 0) {
          goto LABEL_8;
        }
        goto LABEL_16;
      }
    }
    else if ((a4 & 2) == 0)
    {
      goto LABEL_7;
    }
    [v10 addObject:@"GPS"];
    if ((a4 & 4) == 0)
    {
LABEL_8:
      if ((a4 & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_17;
    }
LABEL_16:
    [v10 addObject:@"Baseband"];
    if ((a4 & 8) == 0)
    {
LABEL_9:
      if ((a4 & 0x10) == 0)
      {
LABEL_11:
        if ([v10 count])
        {
          v7 = [v10 componentsJoinedByString:@";"];
        }
        else
        {
          v7 = @"None";
        }

        goto LABEL_21;
      }
LABEL_10:
      [v10 addObject:@"Bluetooth"];
      goto LABEL_11;
    }
LABEL_17:
    [v10 addObject:@"Wi-Fi"];
    if ((a4 & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  v7 = @"None";
LABEL_21:
  v14[0] = @"Trigger";
  if ((a3 - 1) > 5) {
    CFStringRef v11 = @"Unknown";
  }
  else {
    CFStringRef v11 = *(&off_1000BF850 + a3 - 1);
  }
  v14[1] = @"Hints";
  v15[0] = v11;
  v15[1] = v7;
  v12 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
  [(CARAnalytics *)self sendEvent:0 withDictionary:v12];

LABEL_25:
}

- (void)DNDEndedWithTrigger:(int)a3 vehicleHints:(unint64_t)a4 context:(id)a5
{
  id v8 = a5;
  if ([(CARAnalytics *)self isCurrentlyDriving])
  {
    if (!a4)
    {
      CFStringRef v11 = @"None";
LABEL_22:
      self->_isCurrentlyDriving = 0;
      [(CARAnalytics *)self driveStartTimeInterval];
      double v13 = 0.0;
      if (v14 >= 1.0)
      {
        +[NSDate timeIntervalSinceReferenceDate];
        double v16 = v15;
        [(CARAnalytics *)self driveStartTimeInterval];
        double v13 = v16 - v17;
      }
      [(CARAnalytics *)self setDriveStartTimeInterval:0.0];
      v18 = +[NSMutableDictionary dictionary];
      v19 = v18;
      if ((a3 - 1) > 5) {
        CFStringRef v20 = @"Unknown";
      }
      else {
        CFStringRef v20 = *(&off_1000BF850 + a3 - 1);
      }
      [v18 setObject:v20 forKeyedSubscript:@"Trigger"];
      v21 = +[NSNumber numberWithDouble:v13];
      [v19 setObject:v21 forKeyedSubscript:@"Duration"];

      [v19 setObject:v11 forKeyedSubscript:@"Hints"];
      if (v8) {
        [v19 setObject:v8 forKeyedSubscript:@"Context"];
      }
      [(CARAnalytics *)self sendEvent:1 withDictionary:v19];

      goto LABEL_30;
    }
    v9 = +[NSMutableArray array];
    v10 = v9;
    if (a4)
    {
      [v9 addObject:@"Motion"];
      if ((a4 & 2) == 0)
      {
LABEL_5:
        if ((a4 & 4) == 0) {
          goto LABEL_6;
        }
        goto LABEL_17;
      }
    }
    else if ((a4 & 2) == 0)
    {
      goto LABEL_5;
    }
    [v10 addObject:@"GPS"];
    if ((a4 & 4) == 0)
    {
LABEL_6:
      if ((a4 & 8) == 0) {
        goto LABEL_7;
      }
      goto LABEL_18;
    }
LABEL_17:
    [v10 addObject:@"Baseband"];
    if ((a4 & 8) == 0)
    {
LABEL_7:
      if ((a4 & 0x10) == 0)
      {
LABEL_9:
        if ([v10 count])
        {
          CFStringRef v11 = [v10 componentsJoinedByString:@";"];
        }
        else
        {
          CFStringRef v11 = @"None";
        }

        goto LABEL_22;
      }
LABEL_8:
      [v10 addObject:@"Bluetooth"];
      goto LABEL_9;
    }
LABEL_18:
    [v10 addObject:@"Wi-Fi"];
    if ((a4 & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v12 = CarDNDWDLogging();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v22 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Not recording end event - we weren't driving?", v22, 2u);
  }

LABEL_30:
}

- (void)userChangedAutoReplyFromAudience:(id)a3 toAudience:(id)a4 messageChanged:(BOOL)a5
{
  BOOL v5 = a5;
  v12[0] = @"Previous";
  v12[1] = @"New";
  v13[0] = a3;
  v13[1] = a4;
  v12[2] = @"MessageChanged";
  id v8 = a4;
  id v9 = a3;
  v10 = +[NSNumber numberWithBool:v5];
  v13[2] = v10;
  CFStringRef v11 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];

  [(CARAnalytics *)self sendEvent:2 withDictionary:v11];
}

- (void)userChangedFromTriggerMethod:(id)a3 toMethod:(id)a4 withMechanism:(id)a5 fromPreviousInterval:(double)a6 activateWithCarPlay:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (a6 >= 1.0)
  {
    double v16 = objc_opt_class();
    double v17 = +[NSDate dateWithTimeIntervalSinceReferenceDate:a6];
    v18 = +[NSDate date];
    id v15 = [v16 calendarUnitsOfType:16 fromDate:v17 toDate:v18];
  }
  else
  {
    id v15 = 0;
  }
  v22[0] = @"Previous";
  v22[1] = @"New";
  v23[0] = v12;
  v23[1] = v13;
  v23[2] = v14;
  v22[2] = @"Trigger";
  v22[3] = @"Interval (Days)";
  v19 = +[NSNumber numberWithInteger:v15];
  v23[3] = v19;
  v22[4] = @"ActivateWithCarPlay";
  CFStringRef v20 = +[NSNumber numberWithBool:v7];
  v23[4] = v20;
  v21 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:5];
  [(CARAnalytics *)self sendEvent:3 withDictionary:v21];
}

- (void)wirelessReconnectStarted
{
  objc_super v3 = [(CARAnalytics *)self wirelessReconnectStartDate];

  if (v3)
  {
    v4 = CarGeneralLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Ignoring wireless reconnect start; already started.",
        buf,
        2u);
    }
  }
  else
  {
    uint64_t v5 = CARCarKitAttemptingConnectionEvent;
    v6 = +[NSDate date];
    id v9 = +[CARConnectionEvent eventWithName:v5 type:4 date:v6 payload:0];

    connectionTimeServiceAgent = self->_connectionTimeServiceAgent;
    if (connectionTimeServiceAgent) {
      [(CARConnectionTimeServiceAgent *)connectionTimeServiceAgent recordConnectionEvent:v9 completion:&stru_1000BF718];
    }
    id v8 = +[NSDate date];
    [(CARAnalytics *)self setWirelessReconnectStartDate:v8];
  }
}

- (void)wirelessReconnectCancelled
{
  objc_super v3 = CarGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Resetting wireless reconnect timestamp.", v4, 2u);
  }

  [(CARAnalytics *)self setWirelessReconnectStartDate:0];
  [(CARAnalytics *)self setWirelessReconnectEndDate:0];
}

- (void)_wirelessReconnectEnded
{
  objc_super v3 = [(CARAnalytics *)self wirelessReconnectEndDate];

  if (v3)
  {
    v4 = CarGeneralLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Ignoring wireless reconnect end; already ended.",
        (uint8_t *)&v15,
        2u);
    }
  }
  else
  {
    uint64_t v5 = +[NSDate date];
    [(CARAnalytics *)self setWirelessReconnectEndDate:v5];

    v6 = +[NSDate date];
    BOOL v7 = [(CARAnalytics *)self wirelessReconnectStartDate];
    [v6 timeIntervalSinceDate:v7];
    double v9 = v8;

    v10 = CarGeneralLogging();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v11 = +[NSNumber numberWithDouble:v9];
      int v15 = 138412290;
      double v16 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Wireless reconnect ended. Observed reconnection time: %@", (uint8_t *)&v15, 0xCu);
    }
    uint64_t v12 = CARCarKitConnectionSessionEndEvent;
    id v13 = +[NSDate date];
    v4 = +[CARConnectionEvent eventWithName:v12 type:4 date:v13 payload:0];

    connectionTimeServiceAgent = self->_connectionTimeServiceAgent;
    if (connectionTimeServiceAgent) {
      [(CARConnectionTimeServiceAgent *)connectionTimeServiceAgent recordConnectionEvent:v4 completion:&stru_1000BF738];
    }
  }
}

- (void)_wiredReconnectEnded
{
  uint64_t v3 = CARCarKitConnectionSessionEndEvent;
  v4 = +[NSDate date];
  id v6 = +[CARConnectionEvent eventWithName:v3 type:4 date:v4 payload:0];

  connectionTimeServiceAgent = self->_connectionTimeServiceAgent;
  if (connectionTimeServiceAgent) {
    [(CARConnectionTimeServiceAgent *)connectionTimeServiceAgent recordConnectionEvent:v6 completion:&stru_1000BF758];
  }
}

- (void)reconnectEndedOnTransport:(unint64_t)a3
{
  if (a3 == 3) {
    [(CARAnalytics *)self _wirelessReconnectEnded];
  }
  else {
    [(CARAnalytics *)self _wiredReconnectEnded];
  }
}

- (void)wirelessSessionEndedWithPayload:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CARAnalytics *)self wirelessReconnectStartDate];

  if (!v5)
  {
    CFStringRef v11 = CarGeneralLogging();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
      goto LABEL_12;
    }
    LOWORD(location[0]) = 0;
    double v16 = "No available wireless reconnect start time.";
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, v16, (uint8_t *)location, 2u);
    goto LABEL_12;
  }
  id v6 = [(CARAnalytics *)self wirelessReconnectEndDate];

  if (!v6)
  {
    CFStringRef v11 = CarGeneralLogging();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
      goto LABEL_12;
    }
    LOWORD(location[0]) = 0;
    double v16 = "No available wireless reconnect end time.";
    goto LABEL_11;
  }
  BOOL v7 = [(CARAnalytics *)self wirelessReconnectEndDate];
  double v8 = [(CARAnalytics *)self wirelessReconnectStartDate];
  [v7 timeIntervalSinceDate:v8];
  double v10 = v9;

  [(CARAnalytics *)self wirelessReconnectCancelled];
  CFStringRef v11 = +[NSMutableDictionary dictionaryWithDictionary:v4];
  uint64_t v12 = +[NSNumber numberWithDouble:v10];
  [v11 setObject:v12 forKeyedSubscript:@"reconnectionTime"];

  id v13 = [(CARAnalytics *)self wifiChannel];

  if (v13)
  {
    id v14 = [(CARAnalytics *)self wifiChannel];
    [v11 setObject:v14 forKeyedSubscript:@"wifiChannel"];
  }
  if (self->_connectionTimeServiceAgent)
  {
    objc_initWeak(location, self);
    connectionTimeServiceAgent = self->_connectionTimeServiceAgent;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000646A4;
    v17[3] = &unk_1000BF7E8;
    objc_copyWeak(&v19, location);
    CFStringRef v11 = v11;
    v18 = v11;
    [(CARConnectionTimeServiceAgent *)connectionTimeServiceAgent fetchConnectionSessions:v17];

    objc_destroyWeak(&v19);
    objc_destroyWeak(location);
  }
LABEL_12:
}

- (void)wiredSessionEnded
{
  objc_initWeak(&location, self);
  connectionTimeServiceAgent = self->_connectionTimeServiceAgent;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100065D74;
  v4[3] = &unk_1000BF810;
  objc_copyWeak(&v5, &location);
  [(CARConnectionTimeServiceAgent *)connectionTimeServiceAgent fetchConnectionSessions:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)userCreatedWirelessPairingWithSource:(id)a3 payload:(id)a4
{
  id v6 = a3;
  id v14 = +[NSMutableDictionary dictionaryWithDictionary:a4];
  [v14 setObject:v6 forKeyedSubscript:@"source"];

  if (self->_connectionTimeServiceAgent)
  {
    uint64_t v7 = CARCarKitWirelessPairingCreatedEvent;
    double v8 = +[NSDate date];
    id v9 = [v14 copy];
    double v10 = +[CARConnectionEvent eventWithName:v7 type:4 date:v8 payload:v9];

    [(CARConnectionTimeServiceAgent *)self->_connectionTimeServiceAgent recordConnectionEvent:v10 completion:&stru_1000BF830];
  }
  if ([(CARAnalytics *)self carKeyPairingResult])
  {
    unint64_t v11 = [(CARAnalytics *)self carKeyPairingResult];
    if (v11 > 4) {
      CFStringRef v12 = @"unknown";
    }
    else {
      CFStringRef v12 = *(&off_1000BF8D8 + v11);
    }
  }
  else
  {
    CFStringRef v12 = @"undefined";
  }
  [v14 setObject:v12 forKeyedSubscript:@"carKeyPairingResult"];
  id v13 = +[CARAnalytics sharedInstance];
  [v13 setCarKeyPairingResult:0];

  [(CARAnalytics *)self sendEvent:6 withDictionary:v14];
}

- (void)userIndicatedNotDrivingWithReason:(id)a3
{
  CFStringRef v6 = @"Reason";
  id v7 = a3;
  id v4 = a3;
  id v5 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];

  [(CARAnalytics *)self sendEvent:4 withDictionary:v5];
}

- (void)navigationOwnershipEndedWithMaximumConcurrentCount:(unint64_t)a3
{
  CFStringRef v6 = @"ownerCount";
  id v4 = +[NSNumber numberWithUnsignedInteger:a3];
  id v7 = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  [(CARAnalytics *)self sendEvent:5 withDictionary:v5];
}

- (void)sendEvent:(unint64_t)a3 withDictionary:(id)a4
{
  id v6 = a4;
  if ([(id)objc_opt_class() shouldRecordAnalyticsEvents])
  {
    id v7 = [(CARAnalytics *)self _CARCoreAnalyticsEventNameForEvent:a3];
    double v8 = CarDNDWDLogging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100076378();
    }

    AnalyticsSendEvent();
  }
}

- (id)_CARCoreAnalyticsEventNameForEvent:(unint64_t)a3
{
  if (a3 >= 9)
  {
    id v5 = CarGeneralLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000763EC(a3);
    }

    id v4 = 0;
  }
  else
  {
    id v4 = +[NSString stringWithFormat:@"com.apple.carexperience.%@", *(&off_1000BF900 + a3)];
  }

  return v4;
}

+ (int64_t)calendarUnitsOfType:(unint64_t)a3 fromDate:(id)a4 toDate:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = +[NSCalendar currentCalendar];
  id v19 = 0;
  [v9 rangeOfUnit:a3 startDate:&v19 interval:0 forDate:v8];

  id v10 = v19;
  id v18 = 0;
  [v9 rangeOfUnit:a3 startDate:&v18 interval:0 forDate:v7];

  id v11 = v18;
  CFStringRef v12 = [v9 components:a3 fromDate:v10 toDate:v11 options:0];
  id v13 = v12;
  switch(a3)
  {
    case 0x10uLL:
      id v14 = [v12 day];
      goto LABEL_7;
    case 0x40uLL:
      id v14 = [v12 minute];
      goto LABEL_7;
    case 0x80uLL:
      id v14 = [v12 second];
LABEL_7:
      int64_t v15 = (int64_t)v14;
      goto LABEL_11;
  }
  double v16 = CarGeneralLogging();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_10007647C(a3);
  }

  int64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  return v15;
}

+ (BOOL)shouldRecordAnalyticsEvents
{
  int v2 = CRIsTestContext();
  if (v2)
  {
    uint64_t v3 = CarDNDWDLogging();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Not recording events due to testing context.", v5, 2u);
    }
  }
  return v2 ^ 1;
}

- (void)_prepareConnectionTTRDraftWithConnectionSession:(id)a3 withAdditionalDescription:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[CRDiagnosticsService sharedInstance];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10006665C;
  void v12[3] = &unk_1000BD640;
  id v13 = v7;
  id v11 = v7;
  [v10 collectDiagnosticsWithSession:v9 displayReason:@"CarPlay connection took longer than expected. Gathering diagnostics" additionalDescription:v8 attachmentURLs:0 completionHandler:v12];
}

- (CARConnectionTimeServiceAgent)connectionTimeServiceAgent
{
  return self->_connectionTimeServiceAgent;
}

- (void)setConnectionTimeServiceAgent:(id)a3
{
}

- (NSNumber)wifiChannel
{
  return self->_wifiChannel;
}

- (void)setWifiChannel:(id)a3
{
}

- (unint64_t)carKeyPairingResult
{
  return self->_carKeyPairingResult;
}

- (void)setCarKeyPairingResult:(unint64_t)a3
{
  self->_carKeyPairingResult = a3;
}

- (double)driveStartTimeInterval
{
  return self->_driveStartTimeInterval;
}

- (void)setDriveStartTimeInterval:(double)a3
{
  self->_driveStartTimeInterval = a3;
}

- (BOOL)isCurrentlyDriving
{
  return self->_isCurrentlyDriving;
}

- (void)setIsCurrentlyDriving:(BOOL)a3
{
  self->_isCurrentlyDriving = a3;
}

- (NSDate)wirelessReconnectStartDate
{
  return self->_wirelessReconnectStartDate;
}

- (void)setWirelessReconnectStartDate:(id)a3
{
}

- (NSDate)wirelessReconnectEndDate
{
  return self->_wirelessReconnectEndDate;
}

- (void)setWirelessReconnectEndDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wirelessReconnectEndDate, 0);
  objc_storeStrong((id *)&self->_wirelessReconnectStartDate, 0);
  objc_storeStrong((id *)&self->_wifiChannel, 0);

  objc_storeStrong((id *)&self->_connectionTimeServiceAgent, 0);
}

@end