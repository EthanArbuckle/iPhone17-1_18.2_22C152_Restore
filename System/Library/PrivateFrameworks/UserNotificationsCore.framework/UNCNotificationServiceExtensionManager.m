@interface UNCNotificationServiceExtensionManager
- (id)_extensionForAppBundleIdentifier:(id)a3 error:(id *)a4;
- (id)extensionForBundleIdentifier:(id)a3 error:(id *)a4;
@end

@implementation UNCNotificationServiceExtensionManager

- (id)extensionForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v19 = 0;
  v7 = [(UNCNotificationServiceExtensionManager *)self _extensionForAppBundleIdentifier:v6 error:&v19];
  id v8 = v19;
  v9 = v8;
  if (v7)
  {
    id v10 = [[UNCNotificationServiceExtension alloc] _initWithExtension:v7 serviceTime:30.0 graceTime:1.0];
    if (!a4) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  if (!v8)
  {
    v9 = objc_msgSend(MEMORY[0x263F087E8], "un_errorWithUNPrivateErrorCode:userInfo:", 1904, 0);
  }
  v11 = *MEMORY[0x263F1E068];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E068], OS_LOG_TYPE_ERROR)) {
    -[UNCNotificationServiceExtensionManager extensionForBundleIdentifier:error:]((uint64_t)v6, v11, v12, v13, v14, v15, v16, v17);
  }
  id v10 = 0;
  if (a4)
  {
LABEL_9:
    if (v9) {
      *a4 = v9;
    }
  }
LABEL_11:

  return v10;
}

- (id)_extensionForAppBundleIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v5 allowPlaceholder:0 error:0];
  v7 = v6;
  if (v6)
  {
    v34 = a4;
    uint64_t v35 = (uint64_t)v5;
    [v6 applicationExtensionRecords];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v37;
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v37 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v36 + 1) + 8 * v12);
        uint64_t v14 = [v13 extensionPointRecord];
        uint64_t v15 = [v14 name];
        char v16 = [v15 isEqualToString:@"com.apple.usernotifications.service"];

        if (v16) {
          break;
        }

        if (v10 == ++v12)
        {
          uint64_t v10 = [v8 countByEnumeratingWithState:&v36 objects:v40 count:16];
          if (v10) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      uint64_t v17 = [v13 bundleIdentifier];

      if (!v17) {
        goto LABEL_13;
      }
      v18 = [MEMORY[0x263F08800] extensionWithIdentifier:v17 error:v34];
    }
    else
    {
LABEL_10:

LABEL_13:
      id v19 = *MEMORY[0x263F1E068];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E068], OS_LOG_TYPE_ERROR))
      {
        id v5 = (id)v35;
        -[UNCNotificationServiceExtensionManager _extensionForAppBundleIdentifier:error:](v35, v19, v20, v21, v22, v23, v24, v25);
        v18 = 0;
        goto LABEL_16;
      }
      v18 = 0;
    }
    id v5 = (id)v35;
LABEL_16:

    goto LABEL_20;
  }
  v26 = *MEMORY[0x263F1E068];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E068], OS_LOG_TYPE_ERROR)) {
    -[UNCNotificationServiceExtensionManager _extensionForAppBundleIdentifier:error:]((uint64_t)v5, v26, v27, v28, v29, v30, v31, v32);
  }
  v18 = 0;
LABEL_20:

  return v18;
}

- (void)extensionForBundleIdentifier:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_extensionForAppBundleIdentifier:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_extensionForAppBundleIdentifier:(uint64_t)a3 error:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end