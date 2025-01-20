@interface PLBatteryUINotificationService
+ (void)load;
- (BOOL)isOBCEngaged;
- (BOOL)tlcNotificationDelivered;
- (NSDictionary)hpdConfig;
- (NSDictionary)queryResponderService;
- (NSMutableArray)ursaNotificationIdentifiers;
- (NSMutableDictionary)queryPayload;
- (NSString)tlcNotificationIdentifier;
- (PLBatteryUINotificationService)notificationService;
- (PLXPCResponderOperatorComposition)queryResponder;
- (PLXPCResponderOperatorComposition)ursaQueryResponder;
- (PowerUISmartChargeClient)smartChargingClient;
- (UNUserNotificationCenter)ursaNotificationCenter;
- (UNUserNotificationCenter)userNotificationCenter;
- (id)thermallyLimitedChargingEngagedContent;
- (id)thermallyLimitedChargingEngagedRequest;
- (id)ursaBootArgContent:(id)a3;
- (id)ursaNotificationContentWithIssue:(id)a3;
- (id)ursaNotificationRequestWithIssue:(id)a3;
- (void)initOperatorDependancies;
- (void)removeTLCNotification;
- (void)removeUrsaNotifications;
- (void)setHpdConfig:(id)a3;
- (void)setIsOBCEngaged:(BOOL)a3;
- (void)setNotificationService:(id)a3;
- (void)setQueryPayload:(id)a3;
- (void)setQueryResponder:(id)a3;
- (void)setQueryResponderService:(id)a3;
- (void)setSmartChargingClient:(id)a3;
- (void)setTlcNotificationDelivered:(BOOL)a3;
- (void)setTlcNotificationIdentifier:(id)a3;
- (void)setUrsaNotificationCenter:(id)a3;
- (void)setUrsaNotificationIdentifiers:(id)a3;
- (void)setUrsaQueryResponder:(id)a3;
- (void)setUserNotificationCenter:(id)a3;
- (void)surfaceNotification;
- (void)surfaceNotificationForIssues:(id)a3;
- (void)thermallyLimitedChargingEngagedContent;
- (void)thermallyLimitedChargingEngagedRequest;
@end

@implementation PLBatteryUINotificationService

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLBatteryUINotificationService;
  objc_msgSendSuper2(&v2, sel_load);
}

- (void)initOperatorDependancies
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "\"bui_tlc_notif_iOS\" feature flag is disabled. Not calling Notification Service.", v2, v3, v4, v5, v6);
}

void __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  uint64_t v3 = [v10 request];
  uint64_t v4 = [v3 content];
  uint64_t v5 = [v4 categoryIdentifier];
  int v6 = [v5 isEqual:@"Ursa"];

  if (v6)
  {
    v7 = [*(id *)(a1 + 32) ursaNotificationIdentifiers];
    v8 = [v10 request];
    v9 = [v8 identifier];
    [v7 addObject:v9];
  }
  else
  {
    v7 = [v10 request];
    v8 = [v7 identifier];
    [*(id *)(a1 + 32) setTlcNotificationIdentifier:v8];
  }
}

id __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_31(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  v7 = PLLogPausedCharging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_31_cold_9();
  }

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v6)
  {
    v9 = [v6 objectForKey:@"ShowTLCNotification"];

    if (v9)
    {
      id v10 = [objc_alloc(MEMORY[0x1E4F44680]) initWithBundleIdentifier:@"com.apple.powerlog.proactivenotifications"];
      uint64_t v12 = *(void *)(a1 + 32);
      v11 = (id *)(a1 + 32);
      [v10 setDelegate:v12];
      [v10 setWantsNotificationResponsesDelivered];
      [*v11 setUserNotificationCenter:v10];
      v13 = PLLogPausedCharging();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_31_cold_8();
      }

      v14 = [v6 objectForKeyedSubscript:@"ShowTLCNotification"];
      int v15 = [v14 intValue];

      if (v15 == 1)
      {
        AnalyticsSendEventLazy();
        v16 = NSString;
        v17 = [MEMORY[0x1E4F1C9C8] date];
        v18 = [v16 stringWithFormat:@"TLC-%@", v17];
        [*v11 setTlcNotificationIdentifier:v18];

        v19 = PLLogPausedCharging();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_31_cold_4(v11);
        }

        [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"TLCNotificationState"];
        [*v11 surfaceNotification];
        v20 = PLLogPausedCharging();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_31_cold_3();
        }
      }
      else
      {
        v21 = [v6 objectForKeyedSubscript:@"ShowTLCNotification"];
        int v22 = [v21 intValue];

        if (v22)
        {
          v23 = PLLogPausedCharging();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
            __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_31_cold_7();
          }
          goto LABEL_23;
        }
        AnalyticsSendEventLazy();
        v24 = PLLogPausedCharging();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
          __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_31_cold_6();
        }

        [v8 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"TLCNotificationState"];
        [*v11 removeTLCNotification];
        v20 = PLLogPausedCharging();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_31_cold_5();
        }
      }

      v23 = PLLogPausedCharging();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_31_cold_2();
      }
LABEL_23:

      goto LABEL_24;
    }
  }
  id v10 = PLLogPausedCharging();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_31_cold_1();
  }
LABEL_24:

  return v8;
}

void *__58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_39()
{
  return &unk_1F40114C8;
}

void *__58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_62()
{
  return &unk_1F40114F0;
}

id __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_82(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  v7 = PLLogUrsaNotification();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_82_cold_4();
  }

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v6
    && ([v6 objectForKeyedSubscript:@"ShowUrsaNotification"],
        v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    id v10 = [objc_alloc(MEMORY[0x1E4F44680]) initWithBundleIdentifier:@"com.apple.powerlog.proactivenotifications"];
    [v10 setDelegate:*(void *)(a1 + 32)];
    [v10 setWantsNotificationResponsesDelivered];
    [*(id *)(a1 + 32) setUrsaNotificationCenter:v10];
    v11 = [v6 objectForKeyedSubscript:@"ShowUrsaNotification"];
    uint64_t v12 = [v11 BOOLValue];

    v13 = PLLogUrsaNotification();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_82_cold_3(v12, v13, v14, v15, v16, v17, v18, v19);
    }

    if (!v12)
    {
      [*(id *)(a1 + 32) removeUrsaNotifications];
      goto LABEL_13;
    }
    v20 = [v6 objectForKeyedSubscript:@"UrsaNotificationIssues"];

    if (v20)
    {
      v21 = [v6 objectForKeyedSubscript:@"UrsaNotificationIssues"];
      [*(id *)(a1 + 32) surfaceNotificationForIssues:v21];

LABEL_13:
      [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"UrsaNotificationState"];
      goto LABEL_14;
    }
    [v8 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"UrsaNotificationState"];
    v23 = PLLogUrsaNotification();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_82_cold_2();
    }
  }
  else
  {
    [v8 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"UrsaNotificationState"];
    id v10 = PLLogUrsaNotification();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_82_cold_1();
    }
  }
LABEL_14:

  return v8;
}

- (void)surfaceNotification
{
  uint64_t v1 = [a1 tlcNotificationIdentifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1E4220000, v2, v3, "TLC: Surfacing Notification w Identifier: %@", v4, v5, v6, v7, v8);
}

void __53__PLBatteryUINotificationService_surfaceNotification__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = PLLogPausedCharging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __53__PLBatteryUINotificationService_surfaceNotification__block_invoke_cold_1((uint64_t)v3, a1, v4);
    }
  }
  else
  {
    AnalyticsSendEventLazy();
  }
}

void *__53__PLBatteryUINotificationService_surfaceNotification__block_invoke_102()
{
  return &unk_1F4011540;
}

- (id)thermallyLimitedChargingEngagedContent
{
  uint64_t v2 = (void *)CFPreferencesCopyValue(@"AppleLanguages", (CFStringRef)*MEMORY[0x1E4F1D3B8], @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  id v3 = PLLogPausedCharging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[PLBatteryUINotificationService thermallyLimitedChargingEngagedContent].cold.4();
  }

  uint64_t v4 = [v2 firstObject];
  if (v4)
  {
    uint64_t v5 = objc_alloc_init(MEMORY[0x1E4F445B0]);
    uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v7 = [v6 dateByAddingTimeInterval:86400.0];
    uint8_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:@"/System/Library/UserNotifications/Bundles/com.apple.powerlog.proactivenotifications.bundle"];
    v9 = [MEMORY[0x1E4F28B50] bundleWithURL:v8];
    if (v9)
    {
      [MEMORY[0x1E4F92A38] isiPad];
      [v9 _cfBundle];
      id v10 = CFBundleCopyLocalizedStringForLocalization();
      [v9 _cfBundle];
      v11 = CFBundleCopyLocalizedStringForLocalization();
      uint64_t v12 = [NSString localizedUserNotificationStringForKey:v10 arguments:0];
      [v5 setTitle:v12];

      v13 = [NSString localizedUserNotificationStringForKey:v11 arguments:0];
      [v5 setBody:v13];

      [v5 setCategoryIdentifier:@"TLC"];
      [v5 setShouldIgnoreDowntime:1];
      [v5 setShouldIgnoreDoNotDisturb:1];
      [v5 setShouldHideDate:1];
      [v5 setShouldSuppressScreenLightUp:1];
      uint64_t v14 = [MEMORY[0x1E4F44610] iconForSystemImageNamed:@"bolt.fill"];
      [v5 setIcon:v14];

      [v5 setExpirationDate:v7];
      uint64_t v15 = PLLogPausedCharging();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[PLBatteryUINotificationService thermallyLimitedChargingEngagedContent]();
      }

      uint64_t v16 = v5;
    }
    else
    {
      id v10 = PLLogPausedCharging();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[PLBatteryUINotificationService thermallyLimitedChargingEngagedContent]();
      }
      uint64_t v16 = 0;
    }
  }
  else
  {
    uint64_t v5 = PLLogPausedCharging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[PLBatteryUINotificationService thermallyLimitedChargingEngagedContent]();
    }
    uint64_t v16 = 0;
  }

  return v16;
}

- (id)thermallyLimitedChargingEngagedRequest
{
  id v3 = [(PLBatteryUINotificationService *)self thermallyLimitedChargingEngagedContent];
  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F44628];
    uint64_t v5 = [(PLBatteryUINotificationService *)self tlcNotificationIdentifier];
    uint64_t v6 = [v4 requestWithIdentifier:v5 content:v3 trigger:0];

    [v6 setDestinations:2];
    uint64_t v7 = PLLogPausedCharging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryUINotificationService thermallyLimitedChargingEngagedRequest]();
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)removeTLCNotification
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "TLC: Removing Notifications", v2, v3, v4, v5, v6);
}

- (void)surfaceNotificationForIssues:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = -[PLBatteryUINotificationService ursaNotificationRequestWithIssue:](self, "ursaNotificationRequestWithIssue:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (!v9)
        {
          uint64_t v12 = PLLogUrsaNotification();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            -[PLBatteryUINotificationService surfaceNotificationForIssues:]();
          }

          goto LABEL_13;
        }
        id v10 = (void *)v9;
        v11 = [(PLBatteryUINotificationService *)self ursaNotificationCenter];
        [v11 addNotificationRequest:v10 withCompletionHandler:&__block_literal_global_149];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

void __63__PLBatteryUINotificationService_surfaceNotificationForIssues___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = PLLogUrsaNotification();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __63__PLBatteryUINotificationService_surfaceNotificationForIssues___block_invoke_cold_2();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    __63__PLBatteryUINotificationService_surfaceNotificationForIssues___block_invoke_cold_1();
  }
}

- (id)ursaBootArgContent:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F92A38] internalBuild])
  {
    uint64_t v5 = [v4 objectForKeyedSubscript:@"bootarg"];
    if (v5)
    {
      uint64_t v6 = [(PLBatteryUINotificationService *)self hpdConfig];
      uint64_t v7 = [v6 objectForKeyedSubscript:@"ursa"];
      uint8_t v8 = [v7 objectForKeyedSubscript:@"bootargs"];
      uint64_t v9 = [v8 objectForKeyedSubscript:v5];

      if (v9)
      {
        id v10 = [v9 objectForKeyedSubscript:@"title"];
        v11 = [v9 objectForKeyedSubscript:@"message"];
        uint64_t v12 = [v11 stringByReplacingOccurrencesOfString:@"\\r" withString:@"\r"];

        if (v10 && v12)
        {
          v34 = v12;
          long long v13 = [v9 objectForKeyedSubscript:@"associated"];
          long long v14 = [(PLBatteryUINotificationService *)self hpdConfig];
          long long v15 = [v14 objectForKeyedSubscript:@"ursa"];
          long long v16 = [v15 objectForKeyedSubscript:@"bootargsURL"];

          v35 = v16;
          if (v16)
          {
            uint64_t v17 = [MEMORY[0x1E4F1CA48] array];
            [v17 addObject:v5];
            v36[0] = MEMORY[0x1E4F143A8];
            v36[1] = 3221225472;
            v36[2] = __53__PLBatteryUINotificationService_ursaBootArgContent___block_invoke;
            v36[3] = &unk_1E6E47E18;
            uint64_t v18 = v17;
            v37 = v18;
            [v13 enumerateObjectsUsingBlock:v36];
            v33 = v18;
            uint64_t v19 = [v18 componentsJoinedByString:@"&"];
            v20 = [v16 stringByAppendingString:v19];

            uint64_t v21 = [MEMORY[0x1E4F1CB10] URLWithString:v20];
            int v22 = PLLogUrsaNotification();
            v23 = v22;
            v24 = (void *)v21;
            if (v21)
            {
              v32 = v20;
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v39 = v21;
                _os_log_impl(&dword_1E4220000, v23, OS_LOG_TYPE_DEFAULT, "url configured %@", buf, 0xCu);
              }

              id v25 = objc_alloc_init(MEMORY[0x1E4F445B0]);
              [v25 setTitle:v10];
              uint64_t v12 = v34;
              [v25 setBody:v34];
              [v25 setFooter:@"INTERNAL ONLY"];
              [v25 setDefaultActionURL:v24];
              [v25 setCategoryIdentifier:@"UrsaBootArg"];
              [v25 setShouldIgnoreDowntime:1];
              [v25 setShouldIgnoreDoNotDisturb:1];
              [v25 setShouldHideDate:1];
              [v25 setShouldSuppressScreenLightUp:1];
              v26 = [MEMORY[0x1E4F44610] iconForSystemImageNamed:@"bolt.shield.fill"];
              [v25 setIcon:v26];

              v27 = (void *)MEMORY[0x1E4F1C9C8];
              v28 = [MEMORY[0x1E4F1C9C8] date];
              v23 = [v27 nearestMidnightAfterDate:v28];

              [v25 setExpirationDate:v23];
              v20 = v32;
            }
            else
            {
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
                -[PLBatteryUINotificationService ursaBootArgContent:].cold.4();
              }
              id v25 = 0;
              uint64_t v12 = v34;
            }

            v30 = v33;
          }
          else
          {
            v30 = PLLogUrsaNotification();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
              -[PLBatteryUINotificationService ursaBootArgContent:](self, v30);
            }
            id v25 = 0;
            uint64_t v12 = v34;
          }
        }
        else
        {
          long long v13 = PLLogUrsaNotification();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            -[PLBatteryUINotificationService ursaBootArgContent:]();
          }
          id v25 = 0;
        }
      }
      else
      {
        id v10 = PLLogUrsaNotification();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          [(PLBatteryUINotificationService *)(uint64_t)v5 ursaBootArgContent:v29];
        }
        id v25 = 0;
      }
    }
    else
    {
      id v25 = 0;
    }
  }
  else
  {
    id v25 = 0;
  }

  return v25;
}

uint64_t __53__PLBatteryUINotificationService_ursaBootArgContent___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)ursaNotificationContentWithIssue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"bootarg"];

  if (v5)
  {
    id v6 = [(PLBatteryUINotificationService *)self ursaBootArgContent:v4];
  }
  else
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F445B0]);
    uint8_t v8 = (void *)MEMORY[0x1E4F1C9C8];
    uint64_t v9 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    id v10 = [v8 nearestMidnightAfterDate:v9];

    v11 = [v4 objectForKeyedSubscript:@"notificationMessage"];

    if (v11)
    {
      uint64_t v12 = NSString;
      long long v13 = [v4 objectForKeyedSubscript:@"notificationMessage"];
      long long v14 = [v12 stringWithString:v13];

      long long v15 = [@"[Internal] " stringByAppendingString:v14];
      [v7 setTitle:@"Battery Life Issue Detected"];
      [v7 setBody:v15];
      long long v16 = [v4 objectForKeyedSubscript:@"radar"];

      if (v16)
      {
        uint64_t v17 = [v4 objectForKeyedSubscript:@"radar"];
        uint64_t v18 = [v17 intValue];

        uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"livability://%i", v18);
        v20 = [MEMORY[0x1E4F1CB10] URLWithString:v19];
        [v7 setDefaultActionURL:v20];
        [v7 setCategoryIdentifier:@"Ursa"];
        [v7 setShouldIgnoreDowntime:1];
        [v7 setShouldIgnoreDoNotDisturb:1];
        [v7 setShouldHideDate:1];
        [v7 setShouldSuppressScreenLightUp:1];
        uint64_t v21 = [MEMORY[0x1E4F44610] iconForSystemImageNamed:@"bolt.shield.fill"];
        [v7 setIcon:v21];

        [v7 setExpirationDate:v10];
        id v6 = v7;
      }
      else
      {
        int v22 = PLLogUrsaNotification();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[PLBatteryUINotificationService ursaNotificationContentWithIssue:]();
        }

        id v6 = 0;
      }
    }
    else
    {
      long long v14 = PLLogUrsaNotification();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[PLBatteryUINotificationService ursaNotificationContentWithIssue:]();
      }
      id v6 = 0;
    }
  }
  return v6;
}

- (id)ursaNotificationRequestWithIssue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLBatteryUINotificationService *)self ursaNotificationContentWithIssue:v4];
  if (v5)
  {
    id v6 = [v4 objectForKeyedSubscript:@"radar"];
    uint64_t v7 = [v6 intValue];

    uint8_t v8 = [v5 categoryIdentifier];
    if (![(__CFString *)v8 length])
    {

      uint8_t v8 = @"Ursa";
    }
    uint64_t v9 = NSString;
    id v10 = [MEMORY[0x1E4F1C9C8] date];
    v11 = [v9 stringWithFormat:@"%@-%i-%@", v8, v7, v10];

    uint64_t v12 = [MEMORY[0x1E4F44628] requestWithIdentifier:v11 content:v5 trigger:0];
    [v12 setDestinations:2];
    if ([(__CFString *)v8 isEqualToString:@"UrsaBootArg"]) {
      objc_msgSend(v12, "setDestinations:", objc_msgSend(v12, "destinations") | 5);
    }
    long long v13 = PLLogUrsaNotification();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[PLBatteryUINotificationService ursaNotificationRequestWithIssue:]();
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (void)removeUrsaNotifications
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Removing Notifications", v2, v3, v4, v5, v6);
}

- (PLBatteryUINotificationService)notificationService
{
  return (PLBatteryUINotificationService *)objc_getProperty(self, a2, 56, 1);
}

- (void)setNotificationService:(id)a3
{
}

- (UNUserNotificationCenter)userNotificationCenter
{
  return (UNUserNotificationCenter *)objc_getProperty(self, a2, 64, 1);
}

- (void)setUserNotificationCenter:(id)a3
{
}

- (UNUserNotificationCenter)ursaNotificationCenter
{
  return (UNUserNotificationCenter *)objc_getProperty(self, a2, 72, 1);
}

- (void)setUrsaNotificationCenter:(id)a3
{
}

- (NSMutableDictionary)queryPayload
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setQueryPayload:(id)a3
{
}

- (NSDictionary)queryResponderService
{
  return self->_queryResponderService;
}

- (void)setQueryResponderService:(id)a3
{
}

- (NSString)tlcNotificationIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setTlcNotificationIdentifier:(id)a3
{
}

- (NSMutableArray)ursaNotificationIdentifiers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setUrsaNotificationIdentifiers:(id)a3
{
}

- (BOOL)tlcNotificationDelivered
{
  return self->_tlcNotificationDelivered;
}

- (void)setTlcNotificationDelivered:(BOOL)a3
{
  self->_tlcNotificationDelivered = a3;
}

- (PLXPCResponderOperatorComposition)queryResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (void)setQueryResponder:(id)a3
{
}

- (PLXPCResponderOperatorComposition)ursaQueryResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 120, 1);
}

- (void)setUrsaQueryResponder:(id)a3
{
}

- (NSDictionary)hpdConfig
{
  return (NSDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)setHpdConfig:(id)a3
{
}

- (PowerUISmartChargeClient)smartChargingClient
{
  return (PowerUISmartChargeClient *)objc_getProperty(self, a2, 136, 1);
}

- (void)setSmartChargingClient:(id)a3
{
}

- (BOOL)isOBCEngaged
{
  return self->_isOBCEngaged;
}

- (void)setIsOBCEngaged:(BOOL)a3
{
  self->_isOBCEngaged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smartChargingClient, 0);
  objc_storeStrong((id *)&self->_hpdConfig, 0);
  objc_storeStrong((id *)&self->_ursaQueryResponder, 0);
  objc_storeStrong((id *)&self->_queryResponder, 0);
  objc_storeStrong((id *)&self->_ursaNotificationIdentifiers, 0);
  objc_storeStrong((id *)&self->_tlcNotificationIdentifier, 0);
  objc_storeStrong((id *)&self->_queryResponderService, 0);
  objc_storeStrong((id *)&self->_queryPayload, 0);
  objc_storeStrong((id *)&self->_ursaNotificationCenter, 0);
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
  objc_storeStrong((id *)&self->_notificationService, 0);
}

void __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_31_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "TLC: No payload available or key missing", v2, v3, v4, v5, v6);
}

void __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_31_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "TLC: Sending response from Notification Service: %@", v2, v3, v4, v5, v6);
}

void __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_31_cold_3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "TLC: Surfaced TLC notification", v2, v3, v4, v5, v6);
}

void __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_31_cold_4(id *a1)
{
  uint64_t v1 = [*a1 tlcNotificationIdentifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1E4220000, v2, v3, "TLC: Request sent to surface TLC notification: %@", v4, v5, v6, v7, v8);
}

void __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_31_cold_5()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "TLC: Removed TLC notification", v2, v3, v4, v5, v6);
}

void __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_31_cold_6()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "TLC: Request sent to remove TLC notifications", v2, v3, v4, v5, v6);
}

void __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_31_cold_7()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "TLC: Payload does not exist or invalid value in payload: %@", v2, v3, v4, v5, v6);
}

void __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_31_cold_8()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "TLC: Created UN Center", v2, v3, v4, v5, v6);
}

void __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_31_cold_9()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "TLC: Payload from BatteryAgent via XPC: %@", v2, v3, v4, v5, v6);
}

void __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_82_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "No payload available or key missing", v2, v3, v4, v5, v6);
}

void __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_82_cold_2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "No issues available", v2, v3, v4, v5, v6);
}

void __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_82_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_82_cold_4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Payload from BatteryAgent via XPC: %@", v2, v3, v4, v5, v6);
}

void __53__PLBatteryUINotificationService_surfaceNotification__block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*(id *)(a2 + 32) identifier];
  int v7 = 138412546;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  id v10 = v5;
  OUTLINED_FUNCTION_7_5(&dword_1E4220000, a3, v6, "TLC: Error adding notification request, error = %@, request identifier = %{public}@", (uint8_t *)&v7);
}

- (void)thermallyLimitedChargingEngagedContent
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "TLC: langs=%@", v2, v3, v4, v5, v6);
}

- (void)thermallyLimitedChargingEngagedRequest
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "TLC: Created thermallyLimitedChargingEngagedRequest: %@", v2, v3, v4, v5, v6);
}

- (void)surfaceNotificationForIssues:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "Failed to create notification request", v2, v3, v4, v5, v6);
}

void __63__PLBatteryUINotificationService_surfaceNotificationForIssues___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Pushed notification", v2, v3, v4, v5, v6);
}

void __63__PLBatteryUINotificationService_surfaceNotificationForIssues___block_invoke_cold_2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_1(&dword_1E4220000, v0, v1, "Error in pushing notification %@", v2);
}

- (void)ursaBootArgContent:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = 0;
  OUTLINED_FUNCTION_7_5(&dword_1E4220000, a2, a3, "invalid config for %@: %@", (uint8_t *)&v3);
}

- (void)ursaBootArgContent:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_7_5(&dword_1E4220000, v0, (uint64_t)v0, "invalid config for %@: %@", v1);
}

- (void)ursaBootArgContent:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v3 = [a1 hpdConfig];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_1(&dword_1E4220000, a2, v4, "invalid config %@", v5);
}

- (void)ursaBootArgContent:.cold.4()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_7_5(&dword_1E4220000, v0, (uint64_t)v0, "invalid url from %@ and %@", v1);
}

- (void)ursaNotificationContentWithIssue:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_1(&dword_1E4220000, v0, v1, "Issue missing notification message, issue: %@", v2);
}

- (void)ursaNotificationContentWithIssue:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_1(&dword_1E4220000, v0, v1, "Issue missing radar, issue: %@", v2);
}

- (void)ursaNotificationRequestWithIssue:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Created UrsaNotificationRequest: %@", v2, v3, v4, v5, v6);
}

@end