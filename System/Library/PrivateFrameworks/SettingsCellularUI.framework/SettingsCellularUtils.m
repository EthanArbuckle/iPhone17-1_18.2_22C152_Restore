@interface SettingsCellularUtils
+ (BOOL)isCaseInsensitiveEqual:(id)a3 withString:(id)a4;
+ (BOOL)isUIDualSIM;
+ (BOOL)isUISingleSIM;
+ (BOOL)noDataConnectivityAvailable;
+ (BOOL)shouldShowPendingTransferPlanOnPad;
+ (BOOL)supportsWiFiCalling:(id)a3;
+ (id)formattedPhoneNumber:(id)a3;
+ (id)removePlanConfirmationMessage:(id)a3;
+ (id)removePlanConfirmationTitle:(id)a3;
+ (id)singleSIMUIServiceDescriptor;
+ (id)singleSIMUISubscriptionContext;
@end

@implementation SettingsCellularUtils

+ (id)formattedPhoneNumber:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = CFPhoneNumberCreate();
  if (v4)
  {
    v5 = (const void *)v4;
    uint64_t String = CFPhoneNumberCreateString();
    if (String)
    {
      v7 = (void *)String;

      v8 = [MEMORY[0x263F67EB0] loggerWithCategory:@"SettingsCellularUtils"];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315650;
        v12 = "+[SettingsCellularUtils formattedPhoneNumber:]";
        __int16 v13 = 2112;
        id v14 = v3;
        __int16 v15 = 2112;
        v16 = v7;
        _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, "%s localized %@ as %@", (uint8_t *)&v11, 0x20u);
      }
    }
    else
    {
      v8 = [MEMORY[0x263F67EB0] loggerWithCategory:@"SettingsCellularUtils"];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v11 = 136315394;
        v12 = "+[SettingsCellularUtils formattedPhoneNumber:]";
        __int16 v13 = 2112;
        id v14 = v3;
        _os_log_error_impl(&dword_221B17000, v8, OS_LOG_TYPE_ERROR, "%s Could not localize %@", (uint8_t *)&v11, 0x16u);
      }
      v7 = v3;
    }

    CFRelease(v5);
  }
  else
  {
    v9 = [MEMORY[0x263F67EB0] loggerWithCategory:@"SettingsCellularUtils"];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      v12 = "+[SettingsCellularUtils formattedPhoneNumber:]";
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_error_impl(&dword_221B17000, v9, OS_LOG_TYPE_ERROR, "%s Could not create CFPhoneNumber for %@", (uint8_t *)&v11, 0x16u);
    }

    v7 = v3;
  }

  return v7;
}

+ (BOOL)supportsWiFiCalling:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a3;
  [MEMORY[0x263F7E198] senderIdentityCapabilities];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "senderIdentityUUID", (void)v18);
        int v11 = [v3 uuid];
        if ([v10 isEqual:v11])
        {
          int v12 = [v9 supportsWiFiCalling];

          if (v12)
          {
            __int16 v15 = [MEMORY[0x263F67EB0] loggerWithCategory:@"SettingsCellularUtils"];
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v23 = "+[SettingsCellularUtils supportsWiFiCalling:]";
              __int16 v24 = 2112;
              id v25 = v3;
              _os_log_impl(&dword_221B17000, v15, OS_LOG_TYPE_DEFAULT, "%s Subscription Context: %@ supports WiFi Calling", buf, 0x16u);
            }

            BOOL v14 = 1;
            __int16 v13 = v4;
            goto LABEL_18;
          }
        }
        else
        {
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  __int16 v13 = [MEMORY[0x263F67EB0] loggerWithCategory:@"SettingsCellularUtils"];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "+[SettingsCellularUtils supportsWiFiCalling:]";
    __int16 v24 = 2112;
    id v25 = v3;
    _os_log_impl(&dword_221B17000, v13, OS_LOG_TYPE_DEFAULT, "%s Subscription Context: %@ doesn't support WiFi Calling", buf, 0x16u);
  }
  BOOL v14 = 0;
LABEL_18:

  return v14;
}

+ (BOOL)isUIDualSIM
{
  v2 = [MEMORY[0x263F67EF0] sharedInstance];
  int v3 = [v2 isDualSimCapable];

  if (!v3) {
    return 0;
  }
  uint64_t v4 = +[PSUICellularPlanManagerCache sharedInstance];
  uint64_t v5 = [v4 planItems];
  uint64_t v6 = [v5 count];
  uint64_t v7 = +[PSUICellularPlanManagerCache sharedInstance];
  v8 = [v7 danglingPlanItems];
  uint64_t v9 = [v8 count] + v6;
  v10 = +[PSUICellularPlanManagerCache sharedInstance];
  int v11 = [v10 plansPendingTransfer];
  BOOL v12 = (unint64_t)(v9 + [v11 count]) > 1;

  return v12;
}

+ (BOOL)isUISingleSIM
{
  return [a1 isUIDualSIM] ^ 1;
}

+ (BOOL)shouldShowPendingTransferPlanOnPad
{
  char v2 = _os_feature_enabled_impl();
  int v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  BOOL v5 = 0;
  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1 && (v2 & 1) == 0)
  {
    uint64_t v6 = +[PSUICellularPlanManagerCache sharedInstance];
    if ([v6 isCarrierItemFlowSupported])
    {
      uint64_t v7 = +[PSUICellularPlanManagerCache sharedInstance];
      v8 = [v7 plansPendingTransfer];
      BOOL v5 = [v8 count] != 0;
    }
    else
    {
      BOOL v5 = 0;
    }
  }
  return v5;
}

+ (BOOL)noDataConnectivityAvailable
{
  char v2 = +[PSUIDeviceWiFiState sharedInstance];
  if ([v2 isConnectedOverWiFi])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    uint64_t v4 = +[PSUIDeviceCellularState sharedInstance];
    if ([v4 isConnectedOverCellular])
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      BOOL v5 = +[PSUICellularPlanManagerCache sharedInstance];
      if ([v5 isUsingBootstrapDataService])
      {
        LOBYTE(v3) = 0;
      }
      else
      {
        uint64_t v6 = +[PSUICellularPlanManagerCache sharedInstance];
        int v3 = [v6 isBootstrapRecommended] ^ 1;
      }
    }
  }
  return v3;
}

+ (id)singleSIMUISubscriptionContext
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if ([a1 isUIDualSIM])
  {
    char v2 = [MEMORY[0x263F67EB0] loggerWithCategory:@"SettingsCellularUtils"];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      v10 = "+[SettingsCellularUtils singleSIMUISubscriptionContext]";
      _os_log_error_impl(&dword_221B17000, v2, OS_LOG_TYPE_ERROR, "Invoking %s is meaningful only in case of Single SIM UI", (uint8_t *)&v9, 0xCu);
    }
  }
  int v3 = [MEMORY[0x263F67EF0] sharedInstance];
  uint64_t v4 = [v3 subscriptionsInUse];

  if ([v4 count])
  {
    BOOL v5 = [v4 objectAtIndexedSubscript:0];
  }
  else
  {
    uint64_t v6 = [MEMORY[0x263F67EF0] sharedInstance];
    uint64_t v7 = [v6 subscriptionContexts];
    BOOL v5 = [v7 objectAtIndexedSubscript:0];
  }
  return v5;
}

+ (id)singleSIMUIServiceDescriptor
{
  char v2 = (void *)MEMORY[0x263F02CD8];
  int v3 = [a1 singleSIMUISubscriptionContext];
  uint64_t v4 = [v2 descriptorWithSubscriptionContext:v3];

  return v4;
}

+ (BOOL)isCaseInsensitiveEqual:(id)a3 withString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v5 == v6)
  {
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
    if (v5 && v6) {
      BOOL v8 = [v5 caseInsensitiveCompare:v6] == 0;
    }
  }

  return v8;
}

+ (id)removePlanConfirmationTitle:(id)a3
{
  int v3 = [a3 plan];
  uint64_t v4 = [v3 carrierName];

  if ([v4 length])
  {
    id v5 = NSString;
    id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v7 = [v6 localizedStringForKey:@"REMOVE_CARRIER_%@_PLAN" value:&stru_26D410CA0 table:@"Cellular"];
    BOOL v8 = objc_msgSend(v5, "stringWithFormat:", v7, v4);
  }
  else
  {
    id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v8 = [v6 localizedStringForKey:@"REMOVE_PLAN" value:&stru_26D410CA0 table:@"Cellular"];
  }

  return v8;
}

+ (id)removePlanConfirmationMessage:(id)a3
{
  int v3 = [a3 plan];
  uint64_t v4 = [v3 carrierName];

  if ([v4 length])
  {
    id v5 = NSString;
    id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v7 = [v6 localizedStringForKey:@"REMOVE_CARRIER_%@_PLAN_CONFIRMATION" value:&stru_26D410CA0 table:@"Cellular"];
    BOOL v8 = objc_msgSend(v5, "stringWithFormat:", v7, v4);
  }
  else
  {
    id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v8 = [v6 localizedStringForKey:@"REMOVE_PLAN_CONFIRMATION" value:&stru_26D410CA0 table:@"Cellular"];
  }

  return v8;
}

@end