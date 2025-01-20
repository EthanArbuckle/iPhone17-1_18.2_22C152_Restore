@interface ICRadarUtilities
+ (void)createRadarWithTitle:(id)a3 description:(id)a4;
+ (void)promptUserToFileBugWithAlertMessage:(id)a3 bugTitle:(id)a4 bugDescription:(id)a5;
@end

@implementation ICRadarUtilities

+ (void)promptUserToFileBugWithAlertMessage:(id)a3 bugTitle:(id)a4 bugDescription:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __80__ICRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke;
  v14[3] = &unk_2640CDBF0;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v18 = a1;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(MEMORY[0x263EF83A0], v14);
}

void __80__ICRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke(uint64_t a1)
{
  v17[5] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v3 = [v2 BOOLForKey:@"DisableAssertAlert"];

  if (v3)
  {
    v4 = os_log_create("com.apple.notes", "Assert");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __80__ICRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke_cold_1(v4);
    }
  }
  else
  {
    v5 = os_log_create("com.apple.notes", "Application");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __80__ICRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke_cold_5(a1, v5);
    }

    uint64_t v6 = *MEMORY[0x263EFFFD8];
    v16[0] = *MEMORY[0x263EFFFC8];
    v16[1] = v6;
    v7 = *(__CFString **)(a1 + 32);
    if (!v7) {
      v7 = &stru_26C13B138;
    }
    v17[0] = @"Internal Notes Bug";
    v17[1] = v7;
    uint64_t v8 = *MEMORY[0x263EFFFE8];
    v16[2] = *MEMORY[0x263F00000];
    v16[3] = v8;
    v17[2] = @"File Radar";
    v17[3] = @"Stop Asking";
    v16[4] = *MEMORY[0x263F00020];
    v17[4] = @"Cancel";
    v4 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:5];
    id v9 = CFUserNotificationCreate(0, 0.0, 3uLL, 0, (CFDictionaryRef)v4);
    if (v9)
    {
      id v10 = v9;
      CFOptionFlags v15 = 0;
      CFUserNotificationReceiveResponse(v9, 604800.0, &v15);
      if ((v15 & 3) == 1)
      {
        id v12 = os_log_create("com.apple.notes", "Assert");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          __80__ICRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke_cold_4(v12);
        }

        id v13 = os_log_create("com.apple.notes", "SimulatedCrash");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
          __80__ICRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke_cold_3(v13);
        }

        v14 = [MEMORY[0x263EFFA40] standardUserDefaults];
        [v14 setBool:1 forKey:@"DisableAssertAlert"];
      }
      else if ((v15 & 3) == 0)
      {
        [*(id *)(a1 + 56) createRadarWithTitle:*(void *)(a1 + 40) description:*(void *)(a1 + 48)];
      }
      CFRelease(v10);
    }
    else
    {
      id v11 = os_log_create("com.apple.notes", "Application");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __80__ICRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke_cold_2((uint64_t)v4, v11);
      }
    }
  }
}

+ (void)createRadarWithTitle:(id)a3 description:(id)a4
{
  id v18 = a3;
  v5 = (objc_class *)MEMORY[0x263F08BA0];
  id v6 = a4;
  id v7 = objc_alloc_init(v5);
  [v7 setScheme:@"tap-to-radar"];
  [v7 setHost:@"new"];
  uint64_t v8 = [MEMORY[0x263EFF980] array];
  id v9 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"ComponentName" value:@"Notes"];
  [v8 addObject:v9];

  id v10 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"ComponentVersion" value:@"iOS"];
  [v8 addObject:v10];

  id v11 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"ComponentID" value:@"568784"];
  [v8 addObject:v11];

  id v12 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"Classification" value:@"Serious Bug"];
  [v8 addObject:v12];

  id v13 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"Reproducibility" value:@"Not Applicable"];
  [v8 addObject:v13];

  if ([v18 length])
  {
    v14 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"Title" value:v18];
    [v8 addObject:v14];
  }
  CFOptionFlags v15 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"Description" value:v6];

  [v8 addObject:v15];
  [v7 setQueryItems:v8];
  id v16 = [MEMORY[0x263F01880] defaultWorkspace];
  id v17 = [v7 URL];
  [v16 openURL:v17 configuration:0 completionHandler:0];
}

void __80__ICRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_20C263000, log, OS_LOG_TYPE_DEBUG, "Not showing alert for assertion because defaults key was set", v1, 2u);
}

void __80__ICRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20C263000, a2, OS_LOG_TYPE_ERROR, "Failed to create CFUserNotificationRef for alertOptions: %@", (uint8_t *)&v2, 0xCu);
}

void __80__ICRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke_cold_3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_20C263000, log, OS_LOG_TYPE_FAULT, "Disabled the assertion alert", v1, 2u);
}

void __80__ICRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke_cold_4(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_20C263000, log, OS_LOG_TYPE_DEBUG, "User decided to disable the assertion alerts", v1, 2u);
}

void __80__ICRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke_cold_5(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_20C263000, a2, OS_LOG_TYPE_DEBUG, "Showing alert to file a bug with message: \"%@\"", (uint8_t *)&v3, 0xCu);
}

@end