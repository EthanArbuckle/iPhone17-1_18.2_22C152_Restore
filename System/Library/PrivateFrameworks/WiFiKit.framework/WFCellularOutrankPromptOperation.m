@interface WFCellularOutrankPromptOperation
+ (id)cellularOutrankPromptOperationWithNetworkName:(id)a3 privateCellular:(BOOL)a4;
@end

@implementation WFCellularOutrankPromptOperation

+ (id)cellularOutrankPromptOperationWithNetworkName:(id)a3 privateCellular:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v7 = WFLogForCategory(0);
  os_log_type_t v8 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v7 && os_log_type_enabled(v7, v8))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "+[WFCellularOutrankPromptOperation cellularOutrankPromptOperationWithNetworkName:privateCellular:]";
    __int16 v28 = 2112;
    id v29 = v5;
    _os_log_impl(&dword_226071000, v7, v8, "%s: showing cellular outrank prompt for network='%@'", buf, 0x16u);
  }

  WFCurrentDeviceCapability();
  uint64_t IsChinaDevice = WFCapabilityIsChinaDevice();
  v10 = [MEMORY[0x263F86380] titleForNetworkName:v5 chinaDevice:IsChinaDevice privateCellular:v4];
  if (v10)
  {
    [v6 setObject:v10 forKey:*MEMORY[0x263EFFFC8]];
  }
  else
  {
    v11 = WFLogForCategory(0);
    os_log_type_t v12 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v11 && os_log_type_enabled(v11, v12))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "+[WFCellularOutrankPromptOperation cellularOutrankPromptOperationWithNetworkName:privateCellular:]";
      __int16 v28 = 2112;
      id v29 = v5;
      _os_log_impl(&dword_226071000, v11, v12, "%s: nil title for prompt, networkName='%@'", buf, 0x16u);
    }
  }
  v13 = [MEMORY[0x263F86380] messageForChinaDevice:IsChinaDevice privateCellular:v4];
  if (v13)
  {
    [v6 setObject:v13 forKey:*MEMORY[0x263EFFFD8]];
  }
  else
  {
    v14 = WFLogForCategory(0);
    os_log_type_t v15 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v14 && os_log_type_enabled(v14, v15))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "+[WFCellularOutrankPromptOperation cellularOutrankPromptOperationWithNetworkName:privateCellular:]";
      __int16 v28 = 2112;
      id v29 = v5;
      _os_log_impl(&dword_226071000, v14, v15, "%s: nil message for prompt, networkName='%@'", buf, 0x16u);
    }
  }
  v16 = [MEMORY[0x263F86380] cancelButtonTitleForPrivateCellular:v4];
  if (v16)
  {
    [v6 setObject:v16 forKey:*MEMORY[0x263EFFFE8]];
  }
  else
  {
    v17 = WFLogForCategory(0);
    os_log_type_t v18 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v17 && os_log_type_enabled(v17, v18))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "+[WFCellularOutrankPromptOperation cellularOutrankPromptOperationWithNetworkName:privateCellular:]";
      __int16 v28 = 2112;
      id v29 = v5;
      _os_log_impl(&dword_226071000, v17, v18, "%s: nil cancelButtonTitle for prompt, networkName='%@'", buf, 0x16u);
    }
  }
  v19 = [MEMORY[0x263F86380] defaultButtonTitleForChinaDevice:IsChinaDevice];
  if (v19)
  {
    [v6 setObject:v19 forKey:*MEMORY[0x263F00000]];
  }
  else
  {
    v20 = WFLogForCategory(0);
    os_log_type_t v21 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v20 && os_log_type_enabled(v20, v21))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "+[WFCellularOutrankPromptOperation cellularOutrankPromptOperationWithNetworkName:privateCellular:]";
      __int16 v28 = 2112;
      id v29 = v5;
      _os_log_impl(&dword_226071000, v20, v21, "%s: nil defaultButtonTitle for prompt, networkName='%@'", buf, 0x16u);
    }
  }
  uint64_t v22 = MEMORY[0x263EFFA88];
  [v6 setObject:MEMORY[0x263EFFA88] forKey:@"SBUserNotificationDismissOnLock"];
  [v6 setObject:&stru_26D9BFD58 forKey:@"SBUserNotificationAlertMessageDelimiterKey"];
  [v6 setObject:v22 forKey:*MEMORY[0x263EFFFE0]];
  [v6 setObject:v22 forKey:@"SBUserNotificationForcesModalAlertAppearance"];
  [v6 setObject:v22 forKey:@"SBUserNotificationDisplayActionButtonOnLockScreen"];
  v23 = (void *)[objc_alloc((Class)objc_opt_class()) initWithOptions:v6 timeout:0.0];
  v24 = [NSString stringWithFormat:@"Cellular outrank prompt for network='%@'", v5];
  [v23 setName:v24];

  return v23;
}

@end