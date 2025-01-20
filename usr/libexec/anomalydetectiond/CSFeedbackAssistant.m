@interface CSFeedbackAssistant
+ (void)showFeedbackAssistantSurveyWithUUID:(id)a3;
@end

@implementation CSFeedbackAssistant

+ (void)showFeedbackAssistantSurveyWithUUID:(id)a3
{
  id v3 = a3;
  v4 = +[CSPersistentConfiguration sharedConfiguration];
  unint64_t v5 = (unint64_t)[v4 getFloatDefault:@"FeedbackAssistantOverride"];
  if ((v5 & 0xFF00000000) != 0) {
    float v6 = *(float *)&v5;
  }
  else {
    float v6 = 0.0;
  }
  unsigned __int16 v7 = (unsigned __int16)[v4 getBooleanDefault:@"FeedbackAssistantDisabled"];
  if ((_BYTE)v7) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = v7 >= 0x100u;
  }
  int v9 = !v8;
  v10 = +[CSPermissions sharedInstance];
  unsigned int v11 = [v10 isAuthorizedToCollectData];

  v12 = +[CSPlatformInfo sharedInstance];
  unsigned int v13 = [v12 isInternalInstall];

  int v14 = v11 ^ 1;
  if (v6 == 0.0) {
    int v14 = 1;
  }
  if ((v14 | v9) == 1)
  {
    if (qword_1003DB810 != -1) {
      dispatch_once(&qword_1003DB810, &stru_100399180);
    }
    v15 = qword_1003DB818;
    if (os_log_type_enabled((os_log_t)qword_1003DB818, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67110144;
      *(_DWORD *)v43 = v11;
      *(_WORD *)&v43[4] = 1024;
      *(_DWORD *)&v43[6] = v13;
      __int16 v44 = 1024;
      int v45 = 0;
      __int16 v46 = 1024;
      BOOL v47 = v6 != 0.0;
      __int16 v48 = 1024;
      int v49 = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Not showing Feedback Assistant survey, IS,%d,internal,%d,seed,%d,showSurveyOverride,%d,disableOverride,%d", buf, 0x20u);
    }
  }
  else
  {
    if (qword_1003DB810 != -1) {
      dispatch_once(&qword_1003DB810, &stru_100399180);
    }
    v16 = qword_1003DB818;
    if (os_log_type_enabled((os_log_t)qword_1003DB818, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67110144;
      *(_DWORD *)v43 = v11;
      *(_WORD *)&v43[4] = 1024;
      *(_DWORD *)&v43[6] = v13;
      __int16 v44 = 1024;
      int v45 = 0;
      __int16 v46 = 1024;
      BOOL v47 = v6 != 0.0;
      __int16 v48 = 1024;
      int v49 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Showing Feedback Assistant survey: IS,%d,internal,%d,seed,%d,showSurveyOverride,%d,disableOverride,%d", buf, 0x20u);
    }
    id v17 = objc_alloc_init((Class)UNMutableNotificationContent);
    id v18 = objc_alloc_init((Class)NSDateFormatter);
    [v18 setDateStyle:1];
    [v18 setTimeStyle:1];
    v19 = +[NSDate now];
    v20 = [v18 stringFromDate:v19];

    [v17 setTitle:@"Potential vehicle crash detected"];
    v21 = +[NSString stringWithFormat:@"On %@, your device detected a potential crash event. Hope you are safe. If you are able and willing, we'd appreciate your response to a few questions to help improve our safety features.", v20];
    [v17 setBody:v21];

    v22 = [v17 title];
    if (!v22
      || ([v17 body],
          v23 = objc_claimAutoreleasedReturnValue(),
          BOOL v24 = v23 == 0,
          v23,
          v22,
          v24))
    {
      if (qword_1003DB810 != -1) {
        dispatch_once(&qword_1003DB810, &stru_100399180);
      }
      v39 = qword_1003DB818;
      if (os_log_type_enabled((os_log_t)qword_1003DB818, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Couldn't retrieve localized push notification strings", buf, 2u);
      }
    }
    else
    {
      id v25 = [SOSSettingsURLSourceKey UTF8String];
      id v26 = [@"crashdetection_feedback_request" UTF8String];
      id v27 = [@"uuid" UTF8String];
      id v28 = [v3 UTF8String];
      v41 = [SOSSettingsURLBaseString stringByAppendingFormat:@"&%s=%s&%s=%s", v25, v26, v27, v28];
      v29 = +[NSURL URLWithString:](NSURL, "URLWithString:");
      [v17 setDefaultActionURL:v29];

      [v17 setCategoryIdentifier:@"com.apple.SOSNotification"];
      unint64_t v30 = (unint64_t)[v4 getFloatDefault:@"FeedbackAssistantNotificationDelayOverride"];
      double v31 = *(float *)&v30;
      if ((v30 & 0xFF00000000) == 0) {
        double v31 = 43200.0;
      }
      v40 = +[UNTimeIntervalNotificationTrigger triggerWithTimeInterval:0 repeats:v31];
      v32 = +[UNNotificationRequest requestWithIdentifier:content:trigger:destinations:](UNNotificationRequest, "requestWithIdentifier:content:trigger:destinations:", @"com.apple.SOSNotificationId", v17);
      if (qword_1003DB810 != -1) {
        dispatch_once(&qword_1003DB810, &stru_100399180);
      }
      v33 = qword_1003DB818;
      if (os_log_type_enabled((os_log_t)qword_1003DB818, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v43 = v32;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Created Feedback Assistant notification request:%@", buf, 0xCu);
      }
      id v34 = [objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:@"com.apple.Preferences"];
      v35 = +[NSArray array];
      v36 = +[NSArray array];
      v37 = +[UNNotificationCategory categoryWithIdentifier:@"com.apple.SOSNotification" actions:v35 intentIdentifiers:v36 options:0x20000];

      v38 = +[NSSet setWithObject:v37];
      [v34 setNotificationCategories:v38];

      [v34 addNotificationRequest:v32 withCompletionHandler:&stru_100399140];
    }
  }
}

@end