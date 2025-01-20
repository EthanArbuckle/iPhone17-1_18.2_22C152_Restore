@interface SATapToRadar
+ (BOOL)forceTTR;
+ (BOOL)isTTREnabled;
+ (BOOL)shouldOpenRadar:(BOOL)a3;
+ (id)getLastTTRNotificationDate;
+ (void)sendTapToRadarNotificationWithDescription:(id)a3 highPriorityProblem:(BOOL)a4;
+ (void)setEnableTTR:(BOOL)a3;
+ (void)setForceTTR:(BOOL)a3;
+ (void)updateLastTTRNotificationDate;
@end

@implementation SATapToRadar

+ (BOOL)forceTTR
{
  return byte_10005AB60;
}

+ (void)setForceTTR:(BOOL)a3
{
  byte_10005AB60 = a3;
}

+ (BOOL)isTTREnabled
{
  v2 = +[SARunTimeDataManager runTimeDataObjectForKey:@"enableTTRNotification"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

+ (void)setEnableTTR:(BOOL)a3
{
  id v3 = +[NSNumber numberWithBool:a3];
  +[SARunTimeDataManager setRunTimeDataObject:v3 forKey:@"enableTTRNotification"];
}

+ (void)updateLastTTRNotificationDate
{
  id v2 = +[NSDate date];
  +[SARunTimeDataManager setRunTimeDataObject:v2 forKey:@"lastTTRNotificationDate"];
}

+ (id)getLastTTRNotificationDate
{
  return +[SARunTimeDataManager runTimeDataObjectForKey:@"lastTTRNotificationDate"];
}

+ (BOOL)shouldOpenRadar:(BOOL)a3
{
  arc4random_uniform(0x3E8u);
  v4 = +[SATapToRadar getLastTTRNotificationDate];
  if (!+[SATapToRadar forceTTR])
  {
    if (v4)
    {
      v5 = +[NSDate date];
      [v5 timeIntervalSinceDate:v4];
      double v7 = v6;

      if (v7 < 604800.0)
      {
LABEL_10:
        BOOL v8 = 0;
        goto LABEL_11;
      }
    }
  }
  if (!a3 && !+[SATapToRadar isTTREnabled])
  {
    v9 = SALog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "not sending Tap-To-Radar notification", v11, 2u);
    }

    goto LABEL_10;
  }
  +[SATapToRadar updateLastTTRNotificationDate];
  BOOL v8 = 1;
LABEL_11:

  return v8;
}

+ (void)sendTapToRadarNotificationWithDescription:(id)a3 highPriorityProblem:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (objc_opt_class()
    && os_variant_has_internal_ui()
    && +[SATapToRadar shouldOpenRadar:v4])
  {
    double v6 = SALog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_1000331F4(v6);
    }

    double v7 = objc_opt_new();
    BOOL v8 = +[NSString stringWithFormat:@"[SpaceAttribution Telemetry] Inconsistent Disk Space Result (%@)", v5];
    [v7 setTitle:v8];

    v9 = +[NSString stringWithFormat:@"An inconsistent result was detected on your device during disk space usage telemetry collection.\n** %@ **\nPlease file this Radar with diagnostics to help us root-cause the issue.", v5];
    [v7 setProblemDescription:v9];

    id v10 = [objc_alloc((Class)RadarComponent) initWithName:@"SpaceAttributionFramework" version:@"TTR" identifier:1509660];
    [v7 setComponent:v10];

    [v7 setReproducibility:5];
    [v7 setClassification:6];
    [v7 setDiagnosticExtensionIDs:&off_10004FD60];
    [v7 setAttachments:0];
    [v7 setAutoDiagnostics:0];
    objc_msgSend(v7, "setIsUserInitiated:", +[SATapToRadar forceTTR](SATapToRadar, "forceTTR"));
    v11 = +[TapToRadarService shared];
    [v11 createDraft:v7 forProcessNamed:@"SpaceForceTelemetry" withDisplayReason:@"disk space usage calculation is inconsistent" completionHandler:&stru_10004D330];

    +[SATapToRadar setForceTTR:0];
  }
}

@end