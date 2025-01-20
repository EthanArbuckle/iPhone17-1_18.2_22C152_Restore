@interface RTRadarUtilities
+ (void)createRadarWithTitle:(id)a3 description:(id)a4;
+ (void)promptUserToCreateRadarForAssertionIdentifier:(id)a3 alertMessage:(id)a4 radarTitle:(id)a5 radarDescription:(id)a6 handler:(id)a7;
@end

@implementation RTRadarUtilities

+ (void)promptUserToCreateRadarForAssertionIdentifier:(id)a3 alertMessage:(id)a4 radarTitle:(id)a5 radarDescription:(id)a6 handler:(id)a7
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  v12 = (__CFString *)a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = v15;
  if (!v11)
  {
    v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_51;
    }
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: assertionIdentifier";
LABEL_17:
    _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, v24, buf, 2u);
    goto LABEL_51;
  }
  if (!v13)
  {
    v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_51;
    }
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: radarTitle";
    goto LABEL_17;
  }
  if (!v14)
  {
    v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_51;
    }
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: radarDescription";
    goto LABEL_17;
  }
  if (v15)
  {
    v17 = objc_opt_new();
    if (([v17 internalInstall] & 1) == 0)
    {
      v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v66 = v11;
        _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_INFO, "Suppressing alert for assertion identifier, %@, because we're not on an internal build.", buf, 0xCu);
      }
      goto LABEL_50;
    }
    v18 = objc_opt_new();
    v19 = [v18 objectForKey:@"DisabledAssertAlerts"];
    v20 = [v19 objectForKey:v11];
    int v21 = [v20 BOOLValue];

    if (v21)
    {
      v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v66 = v11;
        v23 = "Suppressing alert for assertion identifier, %@, because defaults key was set.";
LABEL_23:
        _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, v23, buf, 0xCu);
        goto LABEL_49;
      }
      goto LABEL_49;
    }
    v25 = NotificationHandlerMap();
    uint64_t v26 = [v25 count];

    if (v26)
    {
      v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v66 = v11;
        v23 = "Suppressing alert for assertion identifier, %@, because an alert is already showing.";
        goto LABEL_23;
      }
LABEL_49:

LABEL_50:
      goto LABEL_51;
    }
    v58 = v19;
    v61 = [v18 objectForKey:@"RecentAssertAlerts"];
    v27 = [v61 objectForKey:v11];
    uint64_t v28 = [MEMORY[0x1E4F1C9C8] date];
    v60 = (void *)v28;
    if (v27)
    {
      uint64_t v29 = v28;
      v30 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      LODWORD(v29) = [v30 isDate:v27 inSameDayAsDate:v29];

      if (v29)
      {
        v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v59 = v31;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v66 = v11;
          __int16 v67 = 2112;
          v68 = v27;
          _os_log_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_INFO, "Suppressing alert for assertion identifier, %@, because it was recently shown (on %@).", buf, 0x16u);
        }
        v19 = v58;
        goto LABEL_48;
      }
    }
    v57 = v27;
    v32 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v66 = v11;
      __int16 v67 = 2112;
      v68 = v12;
      _os_log_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_INFO, "Showing alert for assertion identifier, %@, to file a bug with message: \"%@\".", buf, 0x16u);
    }

    uint64_t v33 = *MEMORY[0x1E4F1D9A8];
    v63[0] = *MEMORY[0x1E4F1D990];
    v63[1] = v33;
    v34 = @"You discovered a bug in CoreRoutine. Please file a radar.";
    if (v12) {
      v34 = v12;
    }
    v64[0] = @"CoreRoutine Bug!";
    v64[1] = v34;
    uint64_t v35 = *MEMORY[0x1E4F1D9D0];
    v63[2] = *MEMORY[0x1E4F1D9E0];
    v63[3] = v35;
    v64[2] = @"File Radar";
    v64[3] = @"Stop Asking";
    v63[4] = *MEMORY[0x1E4F1DA10];
    v64[4] = @"Dismiss";
    CFDictionaryRef v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:5];
    if (v61) {
      id v37 = [v61 mutableCopy];
    }
    else {
      id v37 = (id)objc_opt_new();
    }
    v38 = v37;
    [v37 setObject:v60 forKey:v11];
    v56 = v38;
    [v18 setObject:v38 forKey:@"RecentAssertAlerts"];
    SInt32 error = 0;
    CFAllocatorRef v39 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    v59 = v36;
    CFUserNotificationRef v40 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0.0, 3uLL, &error, v36);
    v19 = v58;
    if (v40)
    {
      CFUserNotificationRef v41 = v40;
      if (error)
      {
        v42 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v66) = error;
          _os_log_impl(&dword_1D9BFA000, v42, OS_LOG_TYPE_INFO, "Failed to create CFUserNotificationRef, error %d", buf, 8u);
        }

        CFRelease(v41);
        goto LABEL_47;
      }
      CFAllocatorRef v47 = v39;
      CFUserNotificationRef v48 = v41;
      CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource(v47, v41, (CFUserNotificationCallBack)handleNotificationCallback, 0);
      if (RunLoopSource)
      {
        source = RunLoopSource;
        v50 = objc_opt_new();
        [v50 setObject:v11 forKey:@"assertionIdentifier"];
        [v50 setObject:v13 forKey:@"radarTitle"];
        [v50 setObject:v14 forKeyedSubscript:@"radarDescription"];
        v51 = (void *)[v16 copy];
        [v50 setObject:v51 forKey:@"handler"];

        v52 = NotificationHandlerMap();
        v53 = [MEMORY[0x1E4F29238] valueWithPointer:v48];
        [v52 setObject:v50 forKey:v53];

        v19 = v58;
        Main = CFRunLoopGetMain();
        CFRunLoopAddSource(Main, source, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
        CFRelease(source);

        goto LABEL_47;
      }
      CFRelease(v41);
      v43 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v44 = "Failed to create CFRunLoopSourceRef";
        v45 = v43;
        uint32_t v46 = 2;
        goto LABEL_43;
      }
    }
    else
    {
      v43 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v66 = v59;
        v44 = "Failed to create CFUserNotificationRef for alertOptions: %@.";
        v45 = v43;
        uint32_t v46 = 12;
LABEL_43:
        _os_log_impl(&dword_1D9BFA000, v45, OS_LOG_TYPE_INFO, v44, buf, v46);
      }
    }

LABEL_47:
    v27 = v57;
LABEL_48:
    v22 = v61;

    goto LABEL_49;
  }
  v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: handler";
    goto LABEL_17;
  }
LABEL_51:
}

+ (void)createRadarWithTitle:(id)a3 description:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  if ([v7 internalInstall])
  {
    v8 = objc_opt_new();
    [v8 setScheme:@"tap-to-radar"];
    [v8 setHost:@"new"];
    v9 = [MEMORY[0x1E4F1CA48] array];
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"ComponentID" value:@"527926"];
    [v9 addObject:v10];

    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"ComponentName" value:@"CoreRoutine"];
    [v9 addObject:v11];

    v12 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"ComponentVersion" value:@"All"];
    [v9 addObject:v12];

    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"ExtensionIdentifiers" value:@"com.apple.CoreRoutine.RTDiagnosticExtension,com.apple.DiagnosticExtensions.Syslog,com.apple.DiagnosticExtensions.CrashLogs"];
    [v9 addObject:v13];

    if ([v5 length])
    {
      id v14 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"Title" value:v5];
      [v9 addObject:v14];
    }
    id v15 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"Description" value:v6];
    [v9 addObject:v15];

    [v8 setQueryItems:v9];
    v16 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    v17 = [v8 URL];
    [v16 openURL:v17 configuration:0 completionHandler:0];

    v18 = _rt_log_facility_get_os_log(RTLogFacilityRoutineApp);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      v20 = v8;
      _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_INFO, "Radar URL: %@", (uint8_t *)&v19, 0xCu);
    }
  }
}

@end