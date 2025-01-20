@interface REMRadarUtilities
+ (void)createRadarWithTitle:(id)a3 description:(id)a4;
+ (void)promptUserToFileBugWithAlertMessage:(id)a3 bugTitle:(id)a4 bugDescription:(id)a5;
@end

@implementation REMRadarUtilities

+ (void)promptUserToFileBugWithAlertMessage:(id)a3 bugTitle:(id)a4 bugDescription:(id)a5
{
  v24[5] = *MEMORY[0x1E4F143B8];
  v8 = (__CFString *)a3;
  id v9 = a4;
  id v10 = a5;
  if (+[REMSystemUtilities isInternalInstall])
  {
    v11 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v12 = [v11 BOOLForKey:@"DisableAssertAlert"];

    if (v12)
    {
      v13 = +[REMLog utility];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        +[REMRadarUtilities promptUserToFileBugWithAlertMessage:bugTitle:bugDescription:](v13);
      }
    }
    else
    {
      uint64_t v14 = *MEMORY[0x1E4F1D9A8];
      v23[0] = *MEMORY[0x1E4F1D990];
      v23[1] = v14;
      v15 = &stru_1F1339A18;
      if (v8) {
        v15 = v8;
      }
      v24[0] = @"Internal Reminders Bug";
      v24[1] = v15;
      uint64_t v16 = *MEMORY[0x1E4F1D9D0];
      v23[2] = *MEMORY[0x1E4F1D9E0];
      v23[3] = v16;
      v24[2] = @"File Radar";
      v24[3] = @"Stop Asking";
      v23[4] = *MEMORY[0x1E4F1DA10];
      v24[4] = @"Cancel";
      v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:5];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __81__REMRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke;
      block[3] = &unk_1E61DD6A0;
      id v19 = v17;
      id v22 = a1;
      id v20 = v9;
      id v21 = v10;
      v13 = v17;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

void __81__REMRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  SInt32 error = 0;
  v2 = CFUserNotificationCreate(0, 0.0, 3uLL, &error, *(CFDictionaryRef *)(a1 + 32));
  if (v2)
  {
    v3 = v2;
    CFOptionFlags responseFlags = 0;
    CFUserNotificationReceiveResponse(v2, 604800.0, &responseFlags);
    if ((responseFlags & 3) == 1)
    {
      v6 = +[REMLog utility];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        __81__REMRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke_cold_2(v6);
      }

      v7 = +[REMLog utility];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        __81__REMRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke_cold_1(v7);
      }

      v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v8 setBool:1 forKey:@"DisableAssertAlert"];
    }
    else if ((responseFlags & 3) == 0)
    {
      [*(id *)(a1 + 56) createRadarWithTitle:*(void *)(a1 + 40) description:*(void *)(a1 + 48)];
    }
    CFRelease(v3);
  }
  else
  {
    v4 = +[REMLog utility];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      LODWORD(responseFlags) = 67109378;
      HIDWORD(responseFlags) = error;
      __int16 v11 = 2112;
      uint64_t v12 = v5;
      _os_log_impl(&dword_1B9AA2000, v4, OS_LOG_TYPE_INFO, "Failed [%d] to create CFUserNotificationRef for alertOptions: %@", (uint8_t *)&responseFlags, 0x12u);
    }
  }
}

+ (void)createRadarWithTitle:(id)a3 description:(id)a4
{
  id v19 = a3;
  uint64_t v5 = (objc_class *)MEMORY[0x1E4F29088];
  id v6 = a4;
  id v7 = objc_alloc_init(v5);
  [v7 setScheme:@"tap-to-radar"];
  [v7 setHost:@"new"];
  v8 = [MEMORY[0x1E4F1CA48] array];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"ComponentName" value:@"Reminders"];
  [v8 addObject:v9];

  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"ComponentVersion" value:@"iOS"];
  [v8 addObject:v10];

  __int16 v11 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"ComponentID" value:@"964249"];
  [v8 addObject:v11];

  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"AutoDiagnostics" value:@"phone"];
  [v8 addObject:v12];

  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"Classification" value:@"Serious Bug"];
  [v8 addObject:v13];

  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"Reproducibility" value:@"Not Applicable"];
  [v8 addObject:v14];

  if ([v19 length])
  {
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"Title" value:v19];
    [v8 addObject:v15];
  }
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"Description" value:v6];

  [v8 addObject:v16];
  [v7 setQueryItems:v8];
  v17 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v18 = [v7 URL];
  [v17 openURL:v18 configuration:0 completionHandler:0];
}

+ (void)promptUserToFileBugWithAlertMessage:(os_log_t)log bugTitle:bugDescription:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B9AA2000, log, OS_LOG_TYPE_DEBUG, "Not showing alert for assertion because defaults key was set", v1, 2u);
}

void __81__REMRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B9AA2000, log, OS_LOG_TYPE_FAULT, "Disabled the assertion alert", v1, 2u);
}

void __81__REMRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B9AA2000, log, OS_LOG_TYPE_DEBUG, "User decided to disable the assertion alerts", v1, 2u);
}

@end