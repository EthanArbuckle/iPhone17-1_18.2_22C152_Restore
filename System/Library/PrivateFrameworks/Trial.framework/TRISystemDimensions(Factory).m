@interface TRISystemDimensions(Factory)
+ (id)systemDimensions;
@end

@implementation TRISystemDimensions(Factory)

+ (id)systemDimensions
{
  v0 = objc_opt_new();
  v1 = +[TRISystemConfiguration sharedInstance];
  v2 = [v1 deviceClass];
  [v0 setDeviceClass:v2];

  v3 = [v1 trialVersionTag];
  [v0 setVersionTag:v3];

  v4 = [v1 osBuild];
  [v0 setOsBuild:v4];

  char v19 = 0;
  int v5 = [v1 isBetaUserWithIsStale:&v19];
  if (v19 && +[TRIProcessInfo hostingProcessIsTriald])
  {
    v6 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_19D909000, v6, OS_LOG_TYPE_DEFAULT, "SysConfig is stale, leaving population unset", v18, 2u);
    }
  }
  else
  {
    if ([v1 isInternalBuild])
    {
      v7 = v0;
      uint64_t v8 = 3;
    }
    else
    {
      v7 = v0;
      if (v5) {
        uint64_t v8 = 4;
      }
      else {
        uint64_t v8 = 5;
      }
    }
    [v7 setTargetedPopulation:v8];
  }
  v9 = [v1 userSettingsBCP47DeviceLocale];
  [v0 setUserSettingsBcp47DeviceLocale:v9];

  v10 = [v1 carrierBundleIdentifier];
  [v0 setCarrierBundleIdentifier:v10];

  v11 = [v1 carrierCountryIsoCode];
  [v0 setCarrierCountryIsoCode:v11];

  v12 = [v1 systemInfo];
  int v13 = [v12 logUserKeyboardEnabledInputMode];

  if (v13)
  {
    v14 = [v1 enabledInputModeIdentifiers];
    v15 = (void *)[v14 mutableCopy];
    [v0 setUserKeyboardEnabledInputModeIdentifiers:v15];
  }
  if ([v1 hasAne])
  {
    v16 = [v1 aneVersion];
    [v0 setAneVersion:v16];
  }
  else
  {
    [v0 setAneVersion:@"none"];
  }
  objc_msgSend(v0, "setIsAutomatedTestDevice:", objc_msgSend(v1, "isAutomatedTestDevice"));

  return v0;
}

@end