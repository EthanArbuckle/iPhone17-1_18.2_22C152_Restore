@interface MODiagnosticReporter
+ (id)defaultReporter;
- (MODiagnosticReporter)init;
- (double)maxTimeout;
- (void)_configureFromDictionary:(id)a3;
- (void)_notificationHandlerWithNotificationRef:(__CFUserNotification *)a3 andOptionFlags:(unint64_t)a4;
- (void)_saveTimeOfLastIncident;
- (void)configureWithDaemonClient:(id)a3;
- (void)reportIncident:(id)a3 subtype:(id)a4 context:(id)a5;
- (void)reportIncidentAfterUserConsent:(id)a3 subtype:(id)a4 context:(id)a5;
- (void)showUserNotificationWithTitle:(id)a3 message:(id)a4 cancelButtonTitle:(id)a5 acceptButtonTitle:(id)a6 withAcceptanceBlock:(id)a7;
@end

@implementation MODiagnosticReporter

- (void)configureWithDaemonClient:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __58__MODiagnosticReporter_MOCore__configureWithDaemonClient___block_invoke;
  v3[3] = &unk_1002CB2D8;
  v3[4] = self;
  [a3 _getDiagnosticReporterConfiguration:v3];
}

id *__58__MODiagnosticReporter_MOCore__configureWithDaemonClient___block_invoke(id *result, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    return (id *)[result[4] _configureFromDictionary:a2];
  }
  return result;
}

+ (id)defaultReporter
{
  if (defaultReporter_onceToken != -1) {
    dispatch_once(&defaultReporter_onceToken, &__block_literal_global_48);
  }
  v2 = (void *)defaultReporter_reporter;

  return v2;
}

void __39__MODiagnosticReporter_defaultReporter__block_invoke(id a1)
{
  v1 = objc_alloc_init(MODiagnosticReporter);
  uint64_t v2 = defaultReporter_reporter;
  defaultReporter_reporter = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

- (MODiagnosticReporter)init
{
  v9.receiver = self;
  v9.super_class = (Class)MODiagnosticReporter;
  uint64_t v2 = [(MODiagnosticReporter *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v5 = dispatch_queue_create("MODiagnosticReporter", v4);
    v6 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v5;

    *((_OWORD *)v2 + 1) = 0u;
    *((_OWORD *)v2 + 2) = 0u;
    v7 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = 0;

    *(_OWORD *)(v2 + 56) = xmmword_1002BB3D0;
    *((void *)v2 + 9) = 0x4024000000000000;
    *((_DWORD *)v2 + 20) = 0;
    *((void *)v2 + 11) = 4;
  }
  return (MODiagnosticReporter *)v2;
}

- (void)_notificationHandlerWithNotificationRef:(__CFUserNotification *)a3 andOptionFlags:(unint64_t)a4
{
  p_notification = &self->_notification;
  if (self->_notification != a3)
  {
    v7 = _mo_log_facility_get_os_log(&MOLogFacilityDiagnosticReporter);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[MODiagnosticReporter _notificationHandlerWithNotificationRef:andOptionFlags:]();
    }
  }
  v8 = _mo_log_facility_get_os_log(&MOLogFacilityDiagnosticReporter);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v9 = +[NSNumber numberWithUnsignedLong:a4];
    int v13 = 138412290;
    v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received response flags %@", (uint8_t *)&v13, 0xCu);
  }
  if ((a4 & 3) != 0)
  {
    self->_lastResult = 2;
  }
  else
  {
    self->_lastResult = 1;
    notificationAcceptanceCallback = (void (**)(void))self->_notificationAcceptanceCallback;
    if (notificationAcceptanceCallback) {
      notificationAcceptanceCallback[2]();
    }
  }
  Main = CFRunLoopGetMain();
  CFRunLoopRemoveSource(Main, self->_notificationSource, kCFRunLoopCommonModes);
  *p_notification = 0;
  p_notification[1] = 0;
  id v12 = self->_notificationAcceptanceCallback;
  self->_notificationAcceptanceCallback = 0;
}

- (void)showUserNotificationWithTitle:(id)a3 message:(id)a4 cancelButtonTitle:(id)a5 acceptButtonTitle:(id)a6 withAcceptanceBlock:(id)a7
{
  id v12 = a7;
  if (!self->_notification)
  {
    +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", a3, kCFUserNotificationAlertHeaderKey, a4, kCFUserNotificationAlertMessageKey, a6, kCFUserNotificationDefaultButtonTitleKey, a5, kCFUserNotificationAlternateButtonTitleKey, 0);
    CFDictionaryRef v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v15 = _mo_log_facility_get_os_log(&MOLogFacilityDiagnosticReporter);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFDictionaryRef v23 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Prompting diagnostic report notification with alert parameters %@", buf, 0xCu);
    }

    *(_DWORD *)buf = 0;
    v16 = CFUserNotificationCreate(kCFAllocatorDefault, 60.0, 0, (SInt32 *)buf, v14);
    self->_notification = v16;
    if (v16)
    {
      RunLoopSource = CFUserNotificationCreateRunLoopSource(kCFAllocatorDefault, v16, (CFUserNotificationCallBack)_MODiagnosticReporter_NotificationHandler, 0);
      self->_notificationSource = RunLoopSource;
      if (RunLoopSource)
      {
        id v18 = [v12 copy];
        id notificationAcceptanceCallback = self->_notificationAcceptanceCallback;
        self->_id notificationAcceptanceCallback = v18;

        Main = CFRunLoopGetMain();
        CFRunLoopAddSource(Main, self->_notificationSource, kCFRunLoopCommonModes);
LABEL_15:

        goto LABEL_16;
      }
      self->_notification = 0;
      v21 = _mo_log_facility_get_os_log(&MOLogFacilityDiagnosticReporter);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[MODiagnosticReporter showUserNotificationWithTitle:message:cancelButtonTitle:acceptButtonTitle:withAcceptanceBlock:]();
      }
    }
    else
    {
      v21 = _mo_log_facility_get_os_log(&MOLogFacilityDiagnosticReporter);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[MODiagnosticReporter showUserNotificationWithTitle:message:cancelButtonTitle:acceptButtonTitle:withAcceptanceBlock:]((int *)buf, v21);
      }
    }

    goto LABEL_15;
  }
  int v13 = _mo_log_facility_get_os_log(&MOLogFacilityDiagnosticReporter);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
    -[MODiagnosticReporter showUserNotificationWithTitle:message:cancelButtonTitle:acceptButtonTitle:withAcceptanceBlock:]();
  }

  self->_lastResult = 2;
LABEL_16:
}

- (void)reportIncident:(id)a3 subtype:(id)a4 context:(id)a5
{
  v8 = (__CFString *)a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_isInternalBuild)
  {
    if (self->_onboardingStatus || self->_forceNotification)
    {
      if (self->_isOnboardedOnDiagnosticReporter || self->_forceNotification)
      {
        if (self->_avoidNotification)
        {
          _mo_log_facility_get_os_log(&MOLogFacilityDiagnosticReporter);
          v11 = (MODiagnosticReporter *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_DEBUG)) {
            -[MODiagnosticReporter reportIncident:subtype:context:].cold.4();
          }
        }
        else
        {
          double Current = CFAbsoluteTimeGetCurrent();
          v11 = self;
          objc_sync_enter(v11);
          unint64_t lastResult = v11->_lastResult;
          if (lastResult) {
            BOOL v14 = 0;
          }
          else {
            BOOL v14 = v11->_timeOfLastIncident <= 0.0;
          }
          if (v11->_forceNotification || v14) {
            goto LABEL_21;
          }
          double v15 = Current - v11->_timeOfLastIncident;
          BOOL v16 = lastResult == 1;
          uint64_t v17 = 64;
          if (v16) {
            uint64_t v17 = 56;
          }
          if (v15 > *(double *)((char *)&v11->super.isa + v17))
          {
LABEL_21:
            v11->_timeOfLastIncident = Current;
            [(MODiagnosticReporter *)v11 _saveTimeOfLastIncident];
            objc_sync_exit(v11);

            id v18 = _mo_log_facility_get_os_log(&MOLogFacilityDiagnosticReporter);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v37 = v9;
              __int16 v38 = 2112;
              id v39 = v10;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "MODiagnosticReporter reporting incident [subtype=%@,context=%@]", buf, 0x16u);
            }

            if (v8 == @"XPCInterruption") {
              CFStringRef v19 = @"The connection with %@ has been interrupted. Please tap \"Accept\" to proceed to Tap-to-Radar";
            }
            else {
              CFStringRef v19 = @"Process %@ appears to hang. Please tap \"Accept\" to proceed to Tap-to-Radar";
            }
            v20 = +[NSProcessInfo processInfo];
            v21 = [v20 processName];

            v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v19, v21);
            uint64_t v23 = +[NSString stringWithFormat:@"%@\nSubtype: %@\nContext: %@", v22, v9, v10];

            v32[0] = _NSConcreteStackBlock;
            v32[1] = 3221225472;
            v32[2] = __55__MODiagnosticReporter_reportIncident_subtype_context___block_invoke;
            v32[3] = &unk_1002CE6D8;
            v32[4] = v11;
            v33 = v8;
            id v34 = v9;
            id v35 = v10;
            [(MODiagnosticReporter *)v11 showUserNotificationWithTitle:@"Issue Detected" message:v23 cancelButtonTitle:@"Cancel" acceptButtonTitle:@"Accept" withAcceptanceBlock:v32];

            v11 = (MODiagnosticReporter *)v23;
          }
          else
          {
            v24 = _mo_log_facility_get_os_log(&MOLogFacilityDiagnosticReporter);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              v30 = +[NSNumber numberWithUnsignedInteger:v11->_lastResult];
              v31 = +[NSNumber numberWithDouble:v11->_timeOfLastIncident];
              v26 = +[NSNumber numberWithDouble:v15];
              v27 = +[NSNumber numberWithDouble:v11->_refractoryPeriodAfterAcceptance];
              v28 = +[NSNumber numberWithDouble:v11->_refractoryPeriodAfterRejection];
              v29 = +[NSNumber numberWithUnsignedInteger:self->_onboardingStatus];
              *(_DWORD *)buf = 138413570;
              id v37 = v30;
              __int16 v38 = 2112;
              id v39 = v31;
              __int16 v40 = 2112;
              v41 = v26;
              __int16 v42 = 2112;
              v43 = v27;
              __int16 v44 = 2112;
              v45 = v28;
              __int16 v46 = 2112;
              v47 = v29;
              _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "MODiagnosticReporter states [_lastResult=%@, _timeOfLastIncident=%@, interval=%@, _refractoryPeriodAfterAcceptance=%@, _refractoryPeriodAfterRejection=%@, _onboardingStatus=%@]", buf, 0x3Eu);
            }
            v25 = _mo_log_facility_get_os_log(&MOLogFacilityDiagnosticReporter);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
              -[MODiagnosticReporter reportIncident:subtype:context:]();
            }

            objc_sync_exit(v11);
          }
        }
      }
      else
      {
        _mo_log_facility_get_os_log(&MOLogFacilityDiagnosticReporter);
        v11 = (MODiagnosticReporter *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_DEBUG)) {
          -[MODiagnosticReporter reportIncident:subtype:context:]();
        }
      }
    }
    else
    {
      _mo_log_facility_get_os_log(&MOLogFacilityDiagnosticReporter);
      v11 = (MODiagnosticReporter *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_DEBUG)) {
        -[MODiagnosticReporter reportIncident:subtype:context:]();
      }
    }
  }
}

id __55__MODiagnosticReporter_reportIncident_subtype_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reportIncidentAfterUserConsent:*(void *)(a1 + 40) subtype:*(void *)(a1 + 48) context:*(void *)(a1 + 56)];
}

- (void)reportIncidentAfterUserConsent:(id)a3 subtype:(id)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = +[NSProcessInfo processInfo];
  id v12 = [v11 processName];
  int v13 = +[NSString stringWithFormat:@"[%@] %@ Detected", v12, v10];

  BOOL v14 = +[NSNumber numberWithDouble:self->_timeOfLastIncident];
  double v15 = +[NSString stringWithFormat:@"Subtype: %@\n\nContext: %@\n\nApproximate timestamp: %@", v9, v8, v14];

  BOOL v16 = +[NSString stringWithFormat:@"?Title=%@&Description=%@&Classification=%@&Reproducibility=%@&ComponentName=%@&ComponentVersion=%@&ComponentID=%@", v13, v15, @"Crash/Hang/Data Loss", @"I Didn't Try", @"Journaling Suggestions", @"All", @"1330744"];
  uint64_t v17 = +[NSString stringWithFormat:@"tap-to-radar://new%@", v16];
  id v18 = +[NSURL URLWithString:v17];

  CFStringRef v19 = _mo_log_facility_get_os_log(&MOLogFacilityDiagnosticReporter);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = [v18 absoluteString];
    *(_DWORD *)buf = 138412290;
    uint64_t v23 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Triggering tap to radar with url [%@]", buf, 0xCu);
  }
  v21 = +[LSApplicationWorkspace defaultWorkspace];
  [v21 openURL:v18 configuration:0 completionHandler:&__block_literal_global_98];
}

void __71__MODiagnosticReporter_reportIncidentAfterUserConsent_subtype_context___block_invoke(id a1, NSDictionary *a2, NSError *a3)
{
  v3 = a3;
  if (v3)
  {
    v4 = _mo_log_facility_get_os_log(&MOLogFacilityDiagnosticReporter);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __71__MODiagnosticReporter_reportIncidentAfterUserConsent_subtype_context___block_invoke_cold_1((uint64_t)v3, v4);
    }
  }
}

- (double)maxTimeout
{
  return self->_maxTimeout;
}

- (void)_configureFromDictionary:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = _mo_log_facility_get_os_log(&MOLogFacilityDiagnosticReporter);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[MODiagnosticReporter _configureFromDictionary:]((uint64_t)v4, v5);
  }

  if (v4)
  {
    v6 = [v4 objectForKey:@"DiagnosticReporterRefractoryPeriodAfterAcceptance"];
    v7 = v6;
    if (v6)
    {
      [v6 doubleValue];
      self->_refractoryPeriodAfterAcceptance = v8;
    }
    id v9 = [v4 objectForKey:@"DiagnosticReporterRefractoryPeriodAfterRejection"];
    id v10 = v9;
    if (v9)
    {
      [v9 doubleValue];
      self->_refractoryPeriodAfterRejection = v11;
    }
    id v12 = [v4 objectForKey:@"DiagnosticReporterAvoidNotification"];
    int v13 = v12;
    if (v12) {
      self->_avoidNotification = [v12 BOOLValue];
    }
    BOOL v14 = [v4 objectForKey:@"DiagnosticReporterForceNotification"];
    double v15 = v14;
    if (v14) {
      self->_forceNotification = [v14 BOOLValue];
    }
    BOOL v16 = [v4 objectForKey:@"DiagnosticReporterTimeOfLastNotification"];
    uint64_t v17 = v16;
    if (v16)
    {
      [v16 doubleValue];
      self->_timeOfLastIncident = v18;
    }
    CFStringRef v19 = [v4 objectForKey:@"DiagnosticReporterIsInternalBuild"];
    v20 = v19;
    if (v19) {
      self->_isInternalBuild = [v19 BOOLValue];
    }
    v28 = v10;
    v21 = [v4 objectForKey:@"DiagnosticReporterOnboardingStatus"];
    v22 = v21;
    if (v21) {
      self->_onboardingStatus = (int)[v21 intValue];
    }
    uint64_t v23 = v7;
    v24 = [v4 objectForKey:@"DiagnosticReporterMaxTimeout"];
    v25 = v24;
    if (v24) {
      self->_maxTimeout = (double)(int)[v24 intValue];
    }
    v26 = [v4 objectForKey:@"DiagnosticReporterIsOnboardedOnDiagnosticReporter"];
    v27 = v26;
    if (v26) {
      self->_isOnboardedOnDiagnosticReporter = [v26 BOOLValue];
    }
  }
}

- (void)_saveTimeOfLastIncident
{
  id v4 = +[NSUserDefaults standardUserDefaults];
  if (v4)
  {
    v3 = +[NSNumber numberWithDouble:self->_timeOfLastIncident];
    [v4 setObject:v3 forKey:@"DiagnosticReporterLastIncidentTime"];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notificationAcceptanceCallback, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_notificationHandlerWithNotificationRef:andOptionFlags:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Unexpected notification handler call", v1, 2u);
}

- (void)showUserNotificationWithTitle:(int *)a1 message:(NSObject *)a2 cancelButtonTitle:acceptButtonTitle:withAcceptanceBlock:.cold.1(int *a1, NSObject *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not create diagnostic reporter user notification (error:%i)", (uint8_t *)v3, 8u);
}

- (void)showUserNotificationWithTitle:message:cancelButtonTitle:acceptButtonTitle:withAcceptanceBlock:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Could not create diagnostic reporter user notification runloop", v1, 2u);
}

- (void)showUserNotificationWithTitle:message:cancelButtonTitle:acceptButtonTitle:withAcceptanceBlock:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "A notification is already being processed", v1, 2u);
}

- (void)reportIncident:subtype:context:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_3((void *)&_mh_execute_header, v0, v1, "Attempting to report MODiagnosticReporter incident but user is not onboarded in journaling suggestions. Skipping.", v2, v3, v4, v5, v6);
}

- (void)reportIncident:subtype:context:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_3((void *)&_mh_execute_header, v0, v1, "Attempting to report MODiagnosticReporter incident but user is not onboarded in diagnostic reporter. Skipping.", v2, v3, v4, v5, v6);
}

- (void)reportIncident:subtype:context:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Attempting to report MODiagnosticReporter incident but recent incident is too close in the past. Skipping.", v1, 2u);
}

- (void)reportIncident:subtype:context:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_3((void *)&_mh_execute_header, v0, v1, "Attempting to report MODiagnosticReporter incident but report feature is overriden as disabled. Skipping.", v2, v3, v4, v5, v6);
}

void __71__MODiagnosticReporter_reportIncidentAfterUserConsent_subtype_context___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Launching TTR failed %@", (uint8_t *)&v2, 0xCu);
}

- (void)_configureFromDictionary:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Received configuration %@", (uint8_t *)&v2, 0xCu);
}

@end