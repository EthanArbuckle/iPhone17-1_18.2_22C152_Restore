@interface CSMartyTap2Radar
- (BOOL)createNotification:(id)a3 confirmation:(__CFUserNotification *)a4 error:(id *)a5;
- (BOOL)enqueueTTRWithTriggerUUID:(id)a3 ttrManagedFiles:(BOOL)a4 error:(id *)a5;
- (BOOL)monitoring;
- (BOOL)showPrivacyNotificationWithError:(id *)a3;
- (BOOL)startMonitoringWithError:(id *)a3;
- (CSMartyTap2Radar)initWithSpoolerFolder:(id)a3 andConfiguration:(id)a4;
- (CSMartyTap2Radar)radarWithResult:(int)a3 triggerUUID:(id)a4 ttrManagedMsl:(BOOL)a5 eventType:(int64_t)a6 error:(id *)a7 formattedDate:(id)a8;
- (CSMartyTap2RadarConfirmation_struct)showConfirmationWithError:(id *)a3 withEventType:(int64_t)a4;
- (NSURL)folderURL;
- (unint64_t)getNotificationResponse:(__CFUserNotification *)a3 error:(id *)a4;
- (void)deletePendingFiles:(id)a3 ttrManagedMsl:(BOOL)a4;
- (void)deletePendingMSLFile:(id)a3;
- (void)deletePendingMetadatafile:(id)a3 ttrManagedMsl:(BOOL)a4;
- (void)setMonitoring:(BOOL)a3;
- (void)showTTRWithTriggerUUID:(id)a3 ttrManagedFiles:(BOOL)a4 withEventType:(int64_t)a5;
@end

@implementation CSMartyTap2Radar

- (void)deletePendingMSLFile:(id)a3
{
  id v3 = a3;
  v4 = +[CSAnomalyEventService generateMslUrl:v3 andSessionType:2 ttrManagedMsl:1];
  if (qword_1003DB7B0 != -1) {
    dispatch_once(&qword_1003DB7B0, &stru_10039C158);
  }
  v5 = qword_1003DB7B8;
  if (os_log_type_enabled((os_log_t)qword_1003DB7B8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "TTR Deleting MSL file %{private}@", buf, 0xCu);
  }
  v6 = +[NSFileManager defaultManager];
  v7 = [v4 path];
  id v13 = 0;
  unsigned __int8 v8 = [v6 removeItemAtPath:v7 error:&v13];
  id v9 = v13;

  if ((v8 & 1) == 0)
  {
    if (qword_1003DB7B0 != -1) {
      dispatch_once(&qword_1003DB7B0, &stru_10039C158);
    }
    v10 = (id)qword_1003DB7B8;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = [v4 description];
      v12 = [v9 description];
      *(_DWORD *)buf = 138412546;
      v15 = v11;
      __int16 v16 = 2112;
      v17 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to delete file: %@, error: %@", buf, 0x16u);
    }
  }
}

- (void)deletePendingMetadatafile:(id)a3 ttrManagedMsl:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = +[CSAnomalyEventService generateMslUrl:v5 andSessionType:2 ttrManagedMsl:v4];
  v7 = +[NSFileManager defaultManager];
  unsigned __int8 v8 = [v6 URLByAppendingPathExtension:@"metadata"];
  if (qword_1003DB7B0 != -1) {
    dispatch_once(&qword_1003DB7B0, &stru_10039C158);
  }
  id v9 = qword_1003DB7B8;
  if (os_log_type_enabled((os_log_t)qword_1003DB7B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Deleting metadata file %{private}@", buf, 0xCu);
  }
  v10 = [v8 path];
  id v16 = 0;
  unsigned __int8 v11 = [v7 removeItemAtPath:v10 error:&v16];
  id v12 = v16;

  if ((v11 & 1) == 0)
  {
    if (qword_1003DB7B0 != -1) {
      dispatch_once(&qword_1003DB7B0, &stru_10039C158);
    }
    id v13 = (id)qword_1003DB7B8;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = [v8 description];
      v15 = [v12 description];
      *(_DWORD *)buf = 138412546;
      v18 = v14;
      __int16 v19 = 2112;
      v20 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to delete file: %@, error: %@", buf, 0x16u);
    }
  }
}

- (void)deletePendingFiles:(id)a3 ttrManagedMsl:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4) {
    [(CSMartyTap2Radar *)self deletePendingMSLFile:v6];
  }
  [(CSMartyTap2Radar *)self deletePendingMetadatafile:v6 ttrManagedMsl:1];
}

- (CSMartyTap2Radar)initWithSpoolerFolder:(id)a3 andConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CSMartyTap2Radar;
  unsigned __int8 v8 = [(CSMartyTap2Radar *)&v19 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_config, a4);
    v9->_monitoring = 0;
    ttrMonitor = v9->_ttrMonitor;
    v9->_ttrMonitor = 0;

    ttrCleanupMonitor = v9->_ttrCleanupMonitor;
    v9->_ttrCleanupMonitor = 0;

    id v12 = (NSURL *)[objc_alloc((Class)NSURL) initFileURLWithPath:v6 isDirectory:1];
    folderURL = v9->_folderURL;
    v9->_folderURL = v12;

    if (qword_1003DB7B0 != -1) {
      dispatch_once(&qword_1003DB7B0, &stru_10039C158);
    }
    v14 = qword_1003DB7B8;
    if (os_log_type_enabled((os_log_t)qword_1003DB7B8, OS_LOG_TYPE_INFO))
    {
      v15 = v9->_folderURL;
      *(_DWORD *)buf = 138412290;
      v21 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Starting TTR with spooler at: %@", buf, 0xCu);
    }
    dispatch_queue_t v16 = dispatch_queue_create("MartyTap2RadarQueue", 0);
    dispatchQueue = v9->_dispatchQueue;
    v9->_dispatchQueue = (OS_dispatch_queue *)v16;
  }
  return v9;
}

- (BOOL)startMonitoringWithError:(id *)a3
{
  id v5 = +[CSPlatformInfo sharedInstance];
  if ([v5 getSystemReleaseType] != 2)
  {
    NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
    CFStringRef v24 = @"TTR not available because this is not an internal install";
    v20 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    *a3 = +[NSError errorWithDomain:NSCocoaErrorDomain code:3328 userInfo:v20];

    goto LABEL_7;
  }
  if (![(CSMartyTap2Radar *)self monitoring])
  {
    if (sub_10001D0F8(self, a3, @"starter"))
    {
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10002617C;
      v22[3] = &unk_10039B128;
      v22[4] = self;
      id v6 = objc_retainBlock(v22);
      id v7 = self;
      objc_sync_enter(v7);
      unsigned __int8 v8 = [CSFolderMonitor alloc];
      id v9 = [(CSMartyTap2Radar *)v7 folderURL];
      v10 = [v9 path];
      unsigned __int8 v11 = [(CSFolderMonitor *)v8 initWithFolder:v10 fileExtension:@"ttr" queue:v7->_dispatchQueue postfix:@"Marty" andAction:v6];
      ttrMonitor = v7->_ttrMonitor;
      v7->_ttrMonitor = v11;

      id v13 = [[CSFolderMonitorBackgroundScanningConfiguration alloc] initWithFileProtectionType:NSFileProtectionCompleteUnlessOpen allowBattery:[(CSMartyTap2RadarConfiguration *)v7->_config allowOnBattery] periodInseconds:[(CSMartyTap2RadarConfiguration *)v7->_config checkIntervalInSeconds]];
      [(CSFolderMonitor *)v7->_ttrMonitor setupRecurringScanningWithConfiguration:v13 runNow:0];
      [(CSMartyTap2Radar *)v7 setMonitoring:1];
      v14 = +[CSAnomalyEventService generateMslUrl:&stru_1003BC4E8 andSessionType:2 ttrManagedMsl:1];
      v15 = [v14 URLByDeletingPathExtension];
      dispatch_queue_t v16 = [v15 path];

      v17 = [[CSFolderMonitor alloc] initWithFolder:v16 fileExtension:&stru_1003BC4E8 queue:v7->_dispatchQueue postfix:@"MartyCleanup" andAction:&stru_10039C0E8];
      ttrCleanupMonitor = v7->_ttrCleanupMonitor;
      v7->_ttrCleanupMonitor = v17;

      [(CSFolderMonitor *)v7->_ttrCleanupMonitor setupRecurringScanningWithConfiguration:v13 runNow:1];
      objc_sync_exit(v7);

      goto LABEL_5;
    }
LABEL_7:
    BOOL v19 = 0;
    goto LABEL_8;
  }
LABEL_5:
  BOOL v19 = 1;
LABEL_8:

  return v19;
}

- (void)showTTRWithTriggerUUID:(id)a3 ttrManagedFiles:(BOOL)a4 withEventType:(int64_t)a5
{
  id v8 = a3;
  dispatchQueue = self->_dispatchQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100026B40;
  v11[3] = &unk_10039C110;
  id v12 = v8;
  int64_t v13 = a5;
  BOOL v14 = a4;
  v11[4] = self;
  id v10 = v8;
  dispatch_async(dispatchQueue, v11);
}

- (BOOL)enqueueTTRWithTriggerUUID:(id)a3 ttrManagedFiles:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  double Current = CFAbsoluteTimeGetCurrent();
  id v10 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  [v10 encodeInt64:(uint64_t)Current forKey:@"timestamp"];
  [v10 encodeObject:v8 forKey:@"triggerUUID"];
  [v10 encodeBool:v6 forKey:@"ttrManagedFiles"];
  [v10 finishEncoding];
  unsigned __int8 v11 = [(CSMartyTap2Radar *)self folderURL];
  id v12 = +[NSUUID UUID];
  int64_t v13 = [v12 UUIDString];
  BOOL v14 = [v11 URLByAppendingPathComponent:v13];
  v15 = [v14 URLByAppendingPathExtension:@"ttr"];

  if (qword_1003DB7B0 != -1) {
    dispatch_once(&qword_1003DB7B0, &stru_10039C158);
  }
  dispatch_queue_t v16 = (id)qword_1003DB7B8;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = [v15 absoluteString];
    int v21 = 138412290;
    v22 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "writing enqueue file to: %@", (uint8_t *)&v21, 0xCu);
  }
  v18 = [v10 encodedData];
  unsigned __int8 v19 = [v18 writeToURL:v15 options:805306369 error:a5];

  return v19;
}

- (BOOL)createNotification:(id)a3 confirmation:(__CFUserNotification *)a4 error:(id *)a5
{
  CFDictionaryRef v7 = (const __CFDictionary *)a3;
  SInt32 error = 0;
  id v8 = CFUserNotificationCreate(0, 0.0, 3uLL, &error, v7);
  *a4 = v8;
  if (v8)
  {
    if (!error)
    {
      BOOL v15 = 1;
      goto LABEL_18;
    }
    if (a5)
    {
      NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
      id v9 = +[NSString stringWithFormat:@"Error %d", error];
      v20 = v9;
      id v10 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      *a5 = +[NSError errorWithDomain:NSCocoaErrorDomain code:256 userInfo:v10];
    }
    if (qword_1003DB7B0 != -1) {
      dispatch_once(&qword_1003DB7B0, &stru_10039C158);
    }
    unsigned __int8 v11 = qword_1003DB7B8;
    if (os_log_type_enabled((os_log_t)qword_1003DB7B8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Error showing confirmation window", buf, 2u);
    }
    CFRelease(*a4);
  }
  else
  {
    if (a5)
    {
      NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
      id v12 = +[NSString stringWithFormat:@"Error %d", error];
      v22 = v12;
      int64_t v13 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      *a5 = +[NSError errorWithDomain:NSCocoaErrorDomain code:4 userInfo:v13];
    }
    if (qword_1003DB7B0 != -1) {
      dispatch_once(&qword_1003DB7B0, &stru_10039C158);
    }
    BOOL v14 = qword_1003DB7B8;
    if (os_log_type_enabled((os_log_t)qword_1003DB7B8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Unable to show confirmation window", buf, 2u);
    }
  }
  BOOL v15 = 0;
LABEL_18:

  return v15;
}

- (CSMartyTap2RadarConfirmation_struct)showConfirmationWithError:(id *)a3 withEventType:(int64_t)a4
{
  id v7 = objc_alloc_init((Class)NSDateFormatter);
  [v7 setDateFormat:@"EEE h:mm a"];
  id v8 = +[NSDate now];
  uint64_t v9 = [v7 stringFromDate:v8];

  id v10 = objc_alloc_init((Class)NSMutableDictionary);
  unsigned __int8 v11 = v10;
  if ((unint64_t)(a4 - 1) >= 3)
  {
    if (a4 == 4)
    {
      id v12 = @"\nRecently, your device sensed a potential crash event.";
      [v10 setObject:@"Was NOT in an accident. File radar." forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];
      [v11 setObject:@"Was in an accident. File radar." forKeyedSubscript:kCFUserNotificationOtherButtonTitleKey];
    }
    else
    {
      id v12 = @"Your device sensed an event helpful for improving crash detection.";
    }
  }
  else
  {
    id v12 = +[NSString stringWithFormat:@"\nOn %@, your device sensed an event helpful for improving crash detection.", v9];
    [v11 setObject:@"File radar" forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];
  }
  [v11 setObject:@"Improve Crash Detection" forKeyedSubscript:kCFUserNotificationAlertHeaderKey];
  [v11 setObject:v12 forKeyedSubscript:kCFUserNotificationAlertMessageKey];
  [v11 setObject:@"Ignore" forKeyedSubscript:kCFUserNotificationAlternateButtonTitleKey];
  [v11 setObject:&__kCFBooleanTrue forKeyedSubscript:kCFUserNotificationAlertTopMostKey];
  [v11 setObject:&__kCFBooleanFalse forKeyedSubscript:SBUserNotificationDismissOnLock];
  [v11 setObject:&__kCFBooleanTrue forKeyedSubscript:SBUserNotificationDontDismissOnUnlock];
  [v11 setObject:&__kCFBooleanTrue forKeyedSubscript:SBUserNotificationIgnoresQuietMode];
  [v11 setObject:&__kCFBooleanFalse forKeyedSubscript:SBUserNotificationDisableIdleSleepWhileVisible];
  CFTypeRef cf = 0;
  if ([(CSMartyTap2Radar *)self createNotification:v11 confirmation:&cf error:a3])
  {
    unsigned __int8 v13 = [(CSMartyTap2Radar *)self getNotificationResponse:cf error:a3];
    uint64_t v14 = 1;
    switch(v13 & 3)
    {
      case 1:
      case 3:
        uint64_t v14 = 3;
        break;
      case 2:
        break;
      default:
        uint64_t v14 = 2 * (a4 == 4);
        break;
    }
    CFRelease(cf);
  }
  else
  {
    uint64_t v14 = 4;
  }

  uint64_t v15 = v14;
  dispatch_queue_t v16 = (void *)v9;
  result.var1 = v16;
  result.var0 = v15;
  return result;
}

- (unint64_t)getNotificationResponse:(__CFUserNotification *)a3 error:(id *)a4
{
  CFOptionFlags responseFlags = 0;
  if (CFUserNotificationReceiveResponse(a3, 0.0, &responseFlags))
  {
    if (a4)
    {
      NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
      CFStringRef v15 = @"Error receiving notification response";
      id v5 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
      *a4 = +[NSError errorWithDomain:NSCocoaErrorDomain code:3072 userInfo:v5];
    }
    if (qword_1003DB7B0 != -1) {
      dispatch_once(&qword_1003DB7B0, &stru_10039C158);
    }
    uint64_t v6 = qword_1003DB7B8;
    if (os_log_type_enabled((os_log_t)qword_1003DB7B8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v12 = 0;
      id v7 = "User didn't see notification";
      id v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, v12, 2u);
    }
  }
  else
  {
    if (qword_1003DB7B0 != -1) {
      dispatch_once(&qword_1003DB7B0, &stru_10039C158);
    }
    uint64_t v10 = qword_1003DB7B8;
    if (os_log_type_enabled((os_log_t)qword_1003DB7B8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v12 = 0;
      id v7 = "User saw notification";
      id v8 = v10;
      os_log_type_t v9 = OS_LOG_TYPE_INFO;
      goto LABEL_12;
    }
  }
  return responseFlags;
}

- (BOOL)showPrivacyNotificationWithError:(id *)a3
{
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  [v5 setObject:@"Collected Sensor Data" forKeyedSubscript:kCFUserNotificationAlertHeaderKey];
  [v5 setObject:@"By filing this radar, you consent to sending information collected by the feature from your iOS device and Apple Watch to Apple in order to develop, improve, and understand the effectiveness of the feature. By submitting this radar, you agree to submit personal and non-personal information and you understand that information submitted may be tied to your name and email address and may be used to contact you about this radar.\n\nData submitted may include raw sensor data, derived information from safety-related sensors, information about your use of this feature, as well as information about your location, alerts, and your interactions with this feature, including data used to detect whether a severe car crash occurred such as motion (such as accelerometer, gyroscope, barometric pressure, and magnetometer sensor data), driving information and activity (such as general direction you were traveling, time spent driving, and speed-related data), and other information about, leading up to, and derived from the detected crash (such as approximate location and time of event, angle of the sun, and environmental sound exposure levels).\n\nApple may also collect certain data you have entered, including demographic information (such as gender and approximate age) and data about your device state at the time of an event, including Wi-Fi or cellular signal, version, software version, and whether your device was paired to another Apple device such as your Watch. \n\nApple may also receive information about your environment, interaction between devices, how long a feature was engaged, your engagement with safety-related notifications, apps, settings, and features, including third-party enablement, and if an emergency call was placed as a result of your use of a specific safety feature and how it was placed. All of the above data may be aggregated and analyzed on your iOS device and Apple Watch before being sent to Apple.\n\nYour data will not be used for any other purpose. \n\nAt all times, information collected by Apple will be treated in accordance with Apple’s Privacy Policy, which can be found at www.apple.com/privacy.", kCFUserNotificationAlertMessageKey forKeyedSubscript];
  [v5 setObject:@"Agree" forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];
  [v5 setObject:@"Do not agree" forKeyedSubscript:kCFUserNotificationOtherButtonTitleKey];
  [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:kCFUserNotificationAlertTopMostKey];
  [v5 setObject:&__kCFBooleanFalse forKeyedSubscript:SBUserNotificationDismissOnLock];
  [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:SBUserNotificationDontDismissOnUnlock];
  [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:SBUserNotificationIgnoresQuietMode];
  [v5 setObject:&__kCFBooleanFalse forKeyedSubscript:SBUserNotificationDisableIdleSleepWhileVisible];
  CFTypeRef cf = 0;
  if ([(CSMartyTap2Radar *)self createNotification:v5 confirmation:&cf error:a3])
  {
    unint64_t v6 = [(CSMartyTap2Radar *)self getNotificationResponse:cf error:a3];
    CFRelease(cf);
    BOOL v7 = v6 == 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (CSMartyTap2Radar)radarWithResult:(int)a3 triggerUUID:(id)a4 ttrManagedMsl:(BOOL)a5 eventType:(int64_t)a6 error:(id *)a7 formattedDate:(id)a8
{
  BOOL v10 = a5;
  id v13 = a4;
  v45 = v13;
  id v46 = a8;
  NSErrorUserInfoKey v14 = +[CSPermissions sharedInstance];
  unsigned int v15 = [v14 isAuthorizedToCollectData];

  switch(a6)
  {
    case 0:
      sub_1003258DC((NSObject **)buf);

      CSMartyTap2RadarConfirmation_struct result = (CSMartyTap2Radar *)abort_report_np();
      __break(1u);
      return result;
    case 1:
      CFStringRef v16 = @"T";
      goto LABEL_7;
    case 2:
      CFStringRef v16 = @"AC";
      goto LABEL_7;
    case 3:
      CFStringRef v16 = @"EC";
      goto LABEL_7;
    case 4:
      CFStringRef v16 = @"SC";
      goto LABEL_7;
    default:
      CFStringRef v16 = 0;
LABEL_7:
      switch(a3)
      {
        case 0:
          v25 = +[NSString stringWithFormat:@"[Marty] Improve Crash Detection %@ IS=%d Event=%@", v13, v15, v16];
          v26 = +[NSCharacterSet URLQueryAllowedCharacterSet];
          v44 = [v25 stringByAddingPercentEncodingWithAllowedCharacters:v26];

          NSErrorUserInfoKey v21 = +[NSString stringWithFormat:@"Please tell us more about what you were doing around %@ ... \n\nNote: Two files containing sensor data have been automatically attached to the radar. You can go to the Attachments and delete each file, as well as the original sysdiagnose, if you do not wish for the information to be sent to the team.", v46];
          v22 = +[NSCharacterSet URLQueryAllowedCharacterSet];
          uint64_t v23 = [v21 stringByAddingPercentEncodingWithAllowedCharacters:v22];
          goto LABEL_16;
        case 1:
          v27 = +[NSString stringWithFormat:@"[Marty] Improve Crash Detection True Positive Detection %@ IS=%d Event=%@", v13, v15, v16];
          v28 = +[NSCharacterSet URLQueryAllowedCharacterSet];
          v44 = [v27 stringByAddingPercentEncodingWithAllowedCharacters:v28];

          NSErrorUserInfoKey v21 = +[NSCharacterSet URLQueryAllowedCharacterSet];
          CFStringRef v24 = [[@"Please tell us more about your incident (optional)\n\nNote: Two files containing sensor data have been automatically attached to the radar. You can go to the Attachments and delete each file, as well as the original sysdiagnose, if you do not wish for the information to be sent to the team." stringByAddingPercentEncodingWithAllowedCharacters:v21];
          goto LABEL_18;
        case 2:
          NSErrorUserInfoKey v19 = +[NSString stringWithFormat:@"[Marty] Improve Crash Detection False Positive Detection %@ IS=%d Event=%@", v13, v15, v16];
          v20 = +[NSCharacterSet URLQueryAllowedCharacterSet];
          v44 = [v19 stringByAddingPercentEncodingWithAllowedCharacters:v20];

          NSErrorUserInfoKey v21 = +[NSString stringWithFormat:@"Please tell us more about what you were doing around %@ ... \n\nNote: Two files containing sensor data have been automatically attached to the radar. You can go to the Attachments and delete each file, as well as the original sysdiagnose, if you do not wish for the information to be sent to the team.", v46];
          v22 = +[NSCharacterSet URLQueryAllowedCharacterSet];
          uint64_t v23 = [v21 stringByAddingPercentEncodingWithAllowedCharacters:v22];
LABEL_16:
          CFStringRef v24 = (void *)v23;

LABEL_18:
          goto LABEL_19;
        case 3:
        case 4:
        case 5:
          if (qword_1003DB7B0 != -1) {
            dispatch_once(&qword_1003DB7B0, &stru_10039C158);
          }
          v17 = qword_1003DB7B8;
          if (os_log_type_enabled((os_log_t)qword_1003DB7B8, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Can't generate URL for that result", buf, 2u);
          }
          uint64_t v18 = 0;
          goto LABEL_28;
        default:
          v44 = 0;
          CFStringRef v24 = 0;
LABEL_19:
          v29 = +[CSAnomalyEventService generateMslUrl:v13 andSessionType:2 ttrManagedMsl:v10];
          v30 = +[CSAnomalyEventService generateMslUrl:v13 andSessionType:2 ttrManagedMsl:1];
          v31 = self;
          v32 = [v30 URLByAppendingPathExtension:@"metadata"];

          v33 = &stru_1003BC4E8;
          if (v10) {
            v33 = @"DeleteOnAttach=1";
          }
          v34 = v33;
          v35 = [v29 absoluteString];
          v36 = [v32 absoluteString];
          v37 = +[NSString stringWithFormat:@"tap-to-radar://new?Title=%@&Description=%@&Classification=Serious%%20Bug&Reproducibility=Not%%20Applicable&ComponentName=CoreMotion%%20Kappa&ComponentVersion=Tap-To-Radar&Attachments=%@,%@&Keywords=marty&ComponentID=1362668&%@", v44, v24, v35, v36, v34];
          v38 = +[NSURL URLWithString:v37];

          if (qword_1003DB7B0 != -1) {
            dispatch_once(&qword_1003DB7B0, &stru_10039C158);
          }
          v39 = qword_1003DB7B8;
          if (os_log_type_enabled((os_log_t)qword_1003DB7B8, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138477827;
            *(void *)&uint8_t buf[4] = v38;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "Launching tap to radar with URL %{private}@", buf, 0xCu);
          }
          v40 = +[LSApplicationWorkspace defaultWorkspace];
          [v40 openURL:v38 configuration:0 completionHandler:0];

          if (!v10)
          {
            dispatch_time_t v41 = dispatch_time(0, 5000000000);
            dispatchQueue = v31->_dispatchQueue;
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1000282A8;
            block[3] = &unk_10039C138;
            block[4] = v31;
            id v48 = v45;
            dispatch_after(v41, dispatchQueue, block);
          }
          uint64_t v18 = 1;
LABEL_28:

          CSMartyTap2RadarConfirmation_struct result = (CSMartyTap2Radar *)v18;
          break;
      }
      return result;
  }
}

- (NSURL)folderURL
{
  return self->_folderURL;
}

- (BOOL)monitoring
{
  return self->_monitoring;
}

- (void)setMonitoring:(BOOL)a3
{
  self->_monitoring = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderURL, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_ttrCleanupMonitor, 0);
  objc_storeStrong((id *)&self->_ttrMonitor, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

@end