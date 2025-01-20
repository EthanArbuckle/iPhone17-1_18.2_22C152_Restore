@interface VKRadarUtilities
+ (void)createRadarWithTitle:(id)a3 description:(id)a4 componentName:(id)a5 componentVersion:(id)a6 componentID:(id)a7;
+ (void)createRadarWithTitle:(id)a3 description:(id)a4 componentName:(id)a5 componentVersion:(id)a6 componentID:(id)a7 keywordIDs:(id)a8 attachmentURLs:(id)a9 includeSysdiagnose:(BOOL)a10;
+ (void)promptUserToFileBugWithAlertMessage:(id)a3 bugTitle:(id)a4 bugDescription:(id)a5;
@end

@implementation VKRadarUtilities

+ (void)promptUserToFileBugWithAlertMessage:(id)a3 bugTitle:(id)a4 bugDescription:(id)a5
{
  v25[5] = *MEMORY[0x1E4F143B8];
  v8 = (__CFString *)a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v12 = [v11 BOOLForKey:@"DisableAssertAlert"];

  if (v12)
  {
    v13 = os_log_create("com.apple.VisionKit", "Assert");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      +[VKRadarUtilities promptUserToFileBugWithAlertMessage:bugTitle:bugDescription:](v13);
    }
  }
  else
  {
    v14 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      +[VKRadarUtilities promptUserToFileBugWithAlertMessage:bugTitle:bugDescription:]((uint64_t)v8, v14);
    }

    uint64_t v15 = *MEMORY[0x1E4F1D9A8];
    v24[0] = *MEMORY[0x1E4F1D990];
    v24[1] = v15;
    v16 = &stru_1F35566F8;
    if (v8) {
      v16 = v8;
    }
    v25[0] = @"Internal Notes Bug";
    v25[1] = v16;
    uint64_t v17 = *MEMORY[0x1E4F1D9D0];
    v24[2] = *MEMORY[0x1E4F1D9E0];
    v24[3] = v17;
    v25[2] = @"File Radar";
    v25[3] = @"Stop Asking";
    v24[4] = *MEMORY[0x1E4F1DA10];
    v25[4] = @"Cancel";
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:5];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__VKRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke;
    block[3] = &unk_1E6BF2748;
    id v20 = v18;
    id v23 = a1;
    id v21 = v9;
    id v22 = v10;
    v13 = v18;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __80__VKRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke(uint64_t a1)
{
  v2 = (uint64_t *)(a1 + 32);
  v3 = CFUserNotificationCreate(0, 0.0, 3uLL, 0, *(CFDictionaryRef *)(a1 + 32));
  if (v3)
  {
    v4 = v3;
    CFOptionFlags responseFlags = 0;
    CFUserNotificationReceiveResponse(v3, 604800.0, &responseFlags);
    if ((responseFlags & 3) == 1)
    {
      v6 = os_log_create("com.apple.VisionKit", "Assert");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        __80__VKRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke_cold_3(v6);
      }

      v7 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        __80__VKRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke_cold_2(v7);
      }

      v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v8 setBool:1 forKey:@"DisableAssertAlert"];
    }
    else if ((responseFlags & 3) == 0)
    {
      [*(id *)(a1 + 56) createRadarWithTitle:*(void *)(a1 + 40) description:*(void *)(a1 + 48) componentName:@"Notes" componentVersion:@"iOS" componentID:@"568784"];
    }
    CFRelease(v4);
  }
  else
  {
    v5 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __80__VKRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke_cold_1(v2, v5);
    }
  }
}

+ (void)createRadarWithTitle:(id)a3 description:(id)a4 componentName:(id)a5 componentVersion:(id)a6 componentID:(id)a7
{
  LOBYTE(v7) = 1;
  [a1 createRadarWithTitle:a3 description:a4 componentName:a5 componentVersion:a6 componentID:a7 keywordIDs:0 attachmentURLs:0 includeSysdiagnose:v7];
}

+ (void)createRadarWithTitle:(id)a3 description:(id)a4 componentName:(id)a5 componentVersion:(id)a6 componentID:(id)a7 keywordIDs:(id)a8 attachmentURLs:(id)a9 includeSysdiagnose:(BOOL)a10
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v62 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v60 = a9;
  id v20 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v20 setScheme:@"tap-to-radar"];
  v58 = v20;
  [v20 setHost:@"new"];
  id v21 = [MEMORY[0x1E4F1CA48] array];
  id v22 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"ComponentName" value:v16];
  [v21 addObject:v22];

  id v23 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"ComponentVersion" value:v17];
  [v21 addObject:v23];

  id v61 = v18;
  v24 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"ComponentID" value:v18];
  [v21 addObject:v24];

  id v25 = objc_alloc(MEMORY[0x1E4F290C8]);
  if (a10) {
    v26 = @"sysdiagnose-only";
  }
  else {
    v26 = @"-1";
  }
  v27 = (void *)[v25 initWithName:@"AutoDiagnostics" value:v26];
  [v21 addObject:v27];

  v28 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"Classification" value:@"Serious Bug"];
  [v21 addObject:v28];

  v29 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"Reproducibility" value:@"Not Applicable"];
  [v21 addObject:v29];

  if ([v15 length])
  {
    v30 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"Title" value:v15];
    [v21 addObject:v30];
  }
  id v31 = v15;
  v32 = v17;
  v33 = v16;
  v34 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"Description" value:v62];
  [v21 addObject:v34];

  if ([v19 count])
  {
    id v35 = objc_alloc(MEMORY[0x1E4F290C8]);
    [v19 componentsJoinedByString:@","];
    v37 = id v36 = v19;
    v38 = (void *)[v35 initWithName:@"Keywords" value:v37];
    [v21 addObject:v38];

    id v19 = v36;
  }
  v39 = v60;
  v41 = v61;
  v40 = v62;
  v59 = v31;
  if ([v60 count])
  {
    id v56 = v19;
    v57 = v33;
    v42 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v60, "count"));
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v43 = v60;
    uint64_t v44 = [v43 countByEnumeratingWithState:&v63 objects:v67 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v64;
      do
      {
        for (uint64_t i = 0; i != v45; ++i)
        {
          if (*(void *)v64 != v46) {
            objc_enumerationMutation(v43);
          }
          v48 = [*(id *)(*((void *)&v63 + 1) + 8 * i) path];
          v49 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
          v50 = [v48 stringByAddingPercentEncodingWithAllowedCharacters:v49];
          [v42 addObject:v50];
        }
        uint64_t v45 = [v43 countByEnumeratingWithState:&v63 objects:v67 count:16];
      }
      while (v45);
    }

    v51 = [v42 componentsJoinedByString:@","];
    v52 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"Attachments" value:v51];
    [v21 addObject:v52];

    v53 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"DeleteOnAttach" value:@"1"];
    [v21 addObject:v53];

    v41 = v61;
    v40 = v62;
    v33 = v57;
    id v19 = v56;
    v39 = v60;
  }
  [v58 setQueryItems:v21];
  v54 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v55 = [v58 URL];
  [v54 openURL:v55 configuration:0 completionHandler:0];
}

+ (void)promptUserToFileBugWithAlertMessage:(os_log_t)log bugTitle:bugDescription:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DB266000, log, OS_LOG_TYPE_DEBUG, "Not showing alert for assertion because defaults key was set", v1, 2u);
}

+ (void)promptUserToFileBugWithAlertMessage:(uint64_t)a1 bugTitle:(NSObject *)a2 bugDescription:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1DB266000, a2, OS_LOG_TYPE_DEBUG, "Showing alert to file a bug with message: \"%@\"", (uint8_t *)&v2, 0xCu);
}

void __80__VKRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1DB266000, a2, OS_LOG_TYPE_ERROR, "Failed to create CFUserNotificationRef for alertOptions: %@", (uint8_t *)&v3, 0xCu);
}

void __80__VKRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1DB266000, log, OS_LOG_TYPE_FAULT, "Disabled the assertion alert", v1, 2u);
}

void __80__VKRadarUtilities_promptUserToFileBugWithAlertMessage_bugTitle_bugDescription___block_invoke_cold_3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DB266000, log, OS_LOG_TYPE_DEBUG, "User decided to disable the assertion alerts", v1, 2u);
}

@end