@interface CSKappaTap2Radar
- (BOOL)createNotification:(id)a3 confirmation:(__CFUserNotification *)a4 error:(id *)a5;
- (BOOL)enqueueTTRWithTriggerUUID:(id)a3 error:(id *)a4;
- (BOOL)monitoring;
- (BOOL)showPrivacyNotificationWithError:(id *)a3;
- (BOOL)startMonitoringWithError:(id *)a3;
- (CSKappaTap2Radar)initWithSpoolerFolder:(id)a3 andConfiguration:(id)a4;
- (CSKappaTap2Radar)radarWithResult:(CSKappaTap2RadarConfirmation_struct)a3 triggerUUID:(id)a4 ttrType:(int64_t)a5 error:(id *)a6;
- (CSKappaTap2RadarConfirmation_struct)showConfirmationWithError:(id *)a3 andEventType:(int64_t)a4;
- (NSURL)folderURL;
- (unint64_t)getNotificationResponse:(__CFUserNotification *)a3 error:(id *)a4;
- (void)setMonitoring:(BOOL)a3;
- (void)showTTRWithTriggerUUID:(id)a3 andEventType:(int64_t)a4;
@end

@implementation CSKappaTap2Radar

- (CSKappaTap2Radar)initWithSpoolerFolder:(id)a3 andConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CSKappaTap2Radar;
  v8 = [(CSKappaTap2Radar *)&v18 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_config, a4);
    v9->_monitoring = 0;
    ttrMonitor = v9->_ttrMonitor;
    v9->_ttrMonitor = 0;

    v11 = (NSURL *)[objc_alloc((Class)NSURL) initFileURLWithPath:v6 isDirectory:1];
    folderURL = v9->_folderURL;
    v9->_folderURL = v11;

    dispatch_queue_t v13 = dispatch_queue_create("KappaTap2RadarQueue", 0);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v13;

    if (qword_1003DB7A0 != -1) {
      dispatch_once(&qword_1003DB7A0, &stru_10039B170);
    }
    v15 = qword_1003DB7A8;
    if (os_log_type_enabled((os_log_t)qword_1003DB7A8, OS_LOG_TYPE_INFO))
    {
      v16 = v9->_folderURL;
      *(_DWORD *)buf = 138412290;
      v20 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Starting TTR with spooler at: %@", buf, 0xCu);
    }
  }

  return v9;
}

- (BOOL)startMonitoringWithError:(id *)a3
{
  unsigned int v5 = +[SOSUtilities isKappaVisible];
  id v6 = +[CSPlatformInfo sharedInstance];
  id v7 = v6;
  if (!v5 || [v6 getSystemReleaseType] != 2)
  {
    if (!a3) {
      goto LABEL_12;
    }
    v16 = @"TTR not available because feature is not visible";
    if (v5) {
      v16 = @"TTR not available because this is not an internal install";
    }
    v17 = v16;
    NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
    v22 = v17;
    objc_super v18 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    *a3 = +[NSError errorWithDomain:NSCocoaErrorDomain code:3328 userInfo:v18];

    goto LABEL_11;
  }
  if (![(CSKappaTap2Radar *)self monitoring])
  {
    if (sub_10001D0F8(self, a3, @"starter"))
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1000193F4;
      v20[3] = &unk_10039B128;
      v20[4] = self;
      v8 = objc_retainBlock(v20);
      v9 = self;
      objc_sync_enter(v9);
      v10 = [CSFolderMonitor alloc];
      v11 = [(CSKappaTap2Radar *)v9 folderURL];
      v12 = [v11 path];
      dispatch_queue_t v13 = [(CSFolderMonitor *)v10 initWithFolder:v12 fileExtension:@"ttr" queue:v9->_queue postfix:@"Kappa" andAction:v8];
      ttrMonitor = v9->_ttrMonitor;
      v9->_ttrMonitor = v13;

      v15 = [[CSFolderMonitorBackgroundScanningConfiguration alloc] initWithFileProtectionType:NSFileProtectionCompleteUnlessOpen allowBattery:[(CSKappaTap2RadarConfiguration *)v9->_config allowOnBattery] periodInseconds:[(CSKappaTap2RadarConfiguration *)v9->_config checkIntervalInSeconds]];
      [(CSFolderMonitor *)v9->_ttrMonitor setupRecurringScanningWithConfiguration:v15 runNow:0];
      [(CSKappaTap2Radar *)v9 setMonitoring:1];

      objc_sync_exit(v9);
      goto LABEL_6;
    }
LABEL_11:
    LOBYTE(a3) = 0;
    goto LABEL_12;
  }
LABEL_6:
  LOBYTE(a3) = 1;
LABEL_12:

  return (char)a3;
}

- (BOOL)enqueueTTRWithTriggerUUID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  double Current = CFAbsoluteTimeGetCurrent();
  id v8 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  [v8 encodeInt64:(uint64_t)Current forKey:@"timestamp"];
  [v8 encodeObject:v6 forKey:@"triggerUUID"];
  [v8 finishEncoding];
  v9 = [(CSKappaTap2Radar *)self folderURL];
  v10 = +[NSUUID UUID];
  v11 = [v10 UUIDString];
  v12 = [v9 URLByAppendingPathComponent:v11];
  dispatch_queue_t v13 = [v12 URLByAppendingPathExtension:@"ttr"];

  v14 = [v8 encodedData];
  LOBYTE(a4) = [v14 writeToURL:v13 options:805306369 error:a4];

  return (char)a4;
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
      v9 = +[NSString stringWithFormat:@"Error %d", error];
      v20 = v9;
      v10 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      *a5 = +[NSError errorWithDomain:NSCocoaErrorDomain code:256 userInfo:v10];
    }
    if (qword_1003DB7A0 != -1) {
      dispatch_once(&qword_1003DB7A0, &stru_10039B170);
    }
    v11 = qword_1003DB7A8;
    if (os_log_type_enabled((os_log_t)qword_1003DB7A8, OS_LOG_TYPE_ERROR))
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
      v12 = +[NSString stringWithFormat:@"Error %d", error];
      v22 = v12;
      dispatch_queue_t v13 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      *a5 = +[NSError errorWithDomain:NSCocoaErrorDomain code:4 userInfo:v13];
    }
    if (qword_1003DB7A0 != -1) {
      dispatch_once(&qword_1003DB7A0, &stru_10039B170);
    }
    v14 = qword_1003DB7A8;
    if (os_log_type_enabled((os_log_t)qword_1003DB7A8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Unable to show confirmation window", buf, 2u);
    }
  }
  BOOL v15 = 0;
LABEL_18:

  return v15;
}

- (CSKappaTap2RadarConfirmation_struct)showConfirmationWithError:(id *)a3 andEventType:(int64_t)a4
{
  id v7 = objc_alloc_init((Class)NSDateFormatter);
  [v7 setDateFormat:@"EEE h:mm a"];
  id v8 = +[NSDate now];
  uint64_t v9 = [v7 stringFromDate:v8];

  id v10 = objc_alloc_init((Class)NSMutableDictionary);
  [v10 setObject:@"Improve Crash Detection" forKeyedSubscript:kCFUserNotificationAlertHeaderKey];
  if (a4 == 4)
  {
    v11 = @"\nRecently, your device sensed a potential crash event.";
    [v10 setObject:@"Was NOT in an accident. File radar." forKeyedSubscript:kCFUserNotificationOtherButtonTitleKey];
    [v10 setObject:@"Was in an accident. File radar." forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];
  }
  else
  {
    v11 = +[NSString stringWithFormat:@"\nOn %@, your device sensed an event helpful for improving crash detection.", v9];
    [v10 setObject:@"File radar" forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];
  }
  [v10 setObject:v11 forKeyedSubscript:kCFUserNotificationAlertMessageKey];
  [v10 setObject:@"Ignore" forKeyedSubscript:kCFUserNotificationAlternateButtonTitleKey];
  [v10 setObject:&__kCFBooleanTrue forKeyedSubscript:kCFUserNotificationAlertTopMostKey];
  [v10 setObject:&__kCFBooleanFalse forKeyedSubscript:SBUserNotificationDismissOnLock];
  [v10 setObject:&__kCFBooleanTrue forKeyedSubscript:SBUserNotificationDontDismissOnUnlock];
  [v10 setObject:&__kCFBooleanTrue forKeyedSubscript:SBUserNotificationIgnoresQuietMode];
  [v10 setObject:&__kCFBooleanTrue forKeyedSubscript:SBUserNotificationDisableIdleSleepWhileVisible];
  CFTypeRef cf = 0;
  if ([(CSKappaTap2Radar *)self createNotification:v10 confirmation:&cf error:a3])
  {
    uint64_t v12 = [(CSKappaTap2Radar *)self getNotificationResponse:cf error:a3] & 3;
    switch(v12)
    {
      case 1:
      case 3:
        uint64_t v12 = 3;
        break;
      case 2:
        break;
      default:
        uint64_t v12 = a4 == 4;
        break;
    }
    CFRelease(cf);
  }
  else
  {
    uint64_t v12 = 4;
  }

  uint64_t v13 = v12;
  v14 = (void *)v9;
  result.var1 = v14;
  result.var0 = v13;
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
      unsigned int v5 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
      *a4 = +[NSError errorWithDomain:NSCocoaErrorDomain code:3072 userInfo:v5];
    }
    if (qword_1003DB7A0 != -1) {
      dispatch_once(&qword_1003DB7A0, &stru_10039B170);
    }
    uint64_t v6 = qword_1003DB7A8;
    if (os_log_type_enabled((os_log_t)qword_1003DB7A8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v12 = 0;
      id v7 = "User didn't see privacy notification";
      id v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, v12, 2u);
    }
  }
  else
  {
    if (qword_1003DB7A0 != -1) {
      dispatch_once(&qword_1003DB7A0, &stru_10039B170);
    }
    uint64_t v10 = qword_1003DB7A8;
    if (os_log_type_enabled((os_log_t)qword_1003DB7A8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v12 = 0;
      id v7 = "User saw privacy notification";
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
  if ([(CSKappaTap2Radar *)self createNotification:v5 confirmation:&cf error:a3])
  {
    unint64_t v6 = [(CSKappaTap2Radar *)self getNotificationResponse:cf error:a3];
    CFRelease(cf);
    BOOL v7 = v6 == 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (CSKappaTap2Radar)radarWithResult:(CSKappaTap2RadarConfirmation_struct)a3 triggerUUID:(id)a4 ttrType:(int64_t)a5 error:(id *)a6
{
  id var1 = a3.var1;
  int var0 = a3.var0;
  id v9 = a4;
  if ((unint64_t)(a5 - 2) >= 3)
  {
    sub_100325510((NSObject **)buf);

    abort_report_np();
    __break(1u);
  }
  uint64_t v10 = (uint64_t)*(&off_10039B190 + a5 - 2);
  switch(var0)
  {
    case 0:
      uint64_t v13 = +[NSString stringWithFormat:@"[Kappa] Improve Crash Detection %@ Event=%@", v9, v10];
      NSErrorUserInfoKey v14 = +[NSCharacterSet URLQueryAllowedCharacterSet];
      uint64_t v15 = [v13 stringByAddingPercentEncodingWithAllowedCharacters:v14];
      goto LABEL_12;
    case 1:
      uint64_t v13 = +[NSString stringWithFormat:@"[Kappa] True Positive Detection %@ Event=%@", v9, v10];
      NSErrorUserInfoKey v14 = +[NSCharacterSet URLQueryAllowedCharacterSet];
      uint64_t v15 = [v13 stringByAddingPercentEncodingWithAllowedCharacters:v14];
      goto LABEL_12;
    case 2:
      uint64_t v13 = +[NSString stringWithFormat:@"[Kappa] False Positive Detection %@ Event=%@", v9, v10];
      NSErrorUserInfoKey v14 = +[NSCharacterSet URLQueryAllowedCharacterSet];
      uint64_t v15 = [v13 stringByAddingPercentEncodingWithAllowedCharacters:v14];
LABEL_12:
      v16 = (void *)v15;

      goto LABEL_13;
    case 3:
    case 4:
    case 5:
      if (qword_1003DB7A0 != -1) {
        dispatch_once(&qword_1003DB7A0, &stru_10039B170);
      }
      v11 = qword_1003DB7A8;
      if (os_log_type_enabled((os_log_t)qword_1003DB7A8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Can't generate URL for that result", buf, 2u);
      }
      uint64_t v12 = 0;
      goto LABEL_18;
    default:
      v16 = 0;
LABEL_13:
      v17 = +[NSString stringWithFormat:@"Please tell us more about your incident around %@.", var1];
      objc_super v18 = +[NSCharacterSet URLQueryAllowedCharacterSet];
      NSErrorUserInfoKey v19 = [v17 stringByAddingPercentEncodingWithAllowedCharacters:v18];

      v20 = +[NSString stringWithFormat:@"tap-to-radar://new?Title=%@&Description=%@&Classification=Serious%%20Bug&Reproducibility=Not%%20Applicable&ComponentName=CoreMotion%%20Kappa&ComponentVersion=Tap-To-Radar&Attachments=&Keywords=kappa&ComponentID=1362668", v16, v19];
      NSErrorUserInfoKey v21 = +[NSURL URLWithString:v20];

      if (qword_1003DB7A0 != -1) {
        dispatch_once(&qword_1003DB7A0, &stru_10039B170);
      }
      v22 = qword_1003DB7A8;
      if (os_log_type_enabled((os_log_t)qword_1003DB7A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v21;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Launching tap to radar with URL %{public}@", buf, 0xCu);
      }
      v23 = +[LSApplicationWorkspace defaultWorkspace];
      [v23 openURL:v21 configuration:0 completionHandler:0];

      uint64_t v12 = 1;
LABEL_18:

      return (CSKappaTap2Radar *)v12;
  }
}

- (void)showTTRWithTriggerUUID:(id)a3 andEventType:(int64_t)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A7B8;
  block[3] = &unk_10039B150;
  id v10 = v6;
  int64_t v11 = a4;
  block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
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
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_ttrMonitor, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

@end