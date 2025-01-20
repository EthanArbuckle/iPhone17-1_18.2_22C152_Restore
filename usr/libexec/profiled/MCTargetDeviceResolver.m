@interface MCTargetDeviceResolver
+ (BOOL)isHomePodAvailable;
+ (BOOL)purgatorySupportedForDevice:(unint64_t)a3;
+ (id)_homepodText;
+ (id)stringForWatchAvailability:(unint64_t)a3;
+ (unint64_t)watchAvailability;
+ (void)_showPromptForHomePodAndWatchWithCompletionBlock:(id)a3;
+ (void)_showPromptForHomePodWithCompletionBlock:(id)a3;
+ (void)_showPromptForThisDeviceAndOtherDevicesWithCompletionBlock:(id)a3;
+ (void)_showPromptForWatchWithCompletionBlock:(id)a3;
+ (void)showResolutionPromptWithWatchOption:(BOOL)a3 homePodOption:(BOOL)a4 completionBlock:(id)a5;
@end

@implementation MCTargetDeviceResolver

+ (BOOL)purgatorySupportedForDevice:(unint64_t)a3
{
  return a3 == 1 || a3 == 6;
}

+ (unint64_t)watchAvailability
{
  v2 = +[NRPairedDeviceRegistry sharedInstance];
  v3 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  v4 = [v2 getAllDevicesWithArchivedAltAccountDevicesMatching:v3];
  v5 = [v4 firstObject];

  if (v5)
  {
    unint64_t v6 = 0;
  }
  else
  {
    v7 = +[NRPairedDeviceRegistry pairedDevicesSelectorBlock];
    v8 = [v2 getAllDevicesWithArchivedAltAccountDevicesMatching:v7];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v19;
      uint64_t v13 = NRDevicePropertyIsAltAccount;
      while (2)
      {
        v14 = 0;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          v15 = [*(id *)(*((void *)&v18 + 1) + 8 * (void)v14) valueForProperty:v13];
          unsigned __int8 v16 = [v15 BOOLValue];

          if (v16)
          {

            unint64_t v6 = 1;
            goto LABEL_15;
          }
          v14 = (char *)v14 + 1;
        }
        while (v11 != v14);
        id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    if ([v9 count]) {
      unint64_t v6 = 2;
    }
    else {
      unint64_t v6 = 3;
    }
LABEL_15:
  }
  return v6;
}

+ (BOOL)isHomePodAvailable
{
  return +[HMClientConnection areAnySpeakersConfigured];
}

+ (void)showResolutionPromptWithWatchOption:(BOOL)a3 homePodOption:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  v8 = (void (**)(id, id))a5;
  id v9 = [a1 watchAvailability];
  unsigned int v10 = [a1 isHomePodAvailable];
  os_log_t v11 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = v11;
    uint64_t v13 = +[MCTargetDeviceResolver stringForWatchAvailability:v9];
    v17[0] = 67240962;
    v17[1] = v6;
    __int16 v18 = 2114;
    long long v19 = v13;
    __int16 v20 = 1026;
    BOOL v21 = v5;
    __int16 v22 = 1026;
    unsigned int v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "TargetDeviceResolver state: Watch Valid? %{public}d | Watch State? %{public}@ | HomePod Valid? %{public}d | HomePod Available? %{public}d", (uint8_t *)v17, 0x1Eu);
  }
  if ((unint64_t)v9 >= 2) {
    BOOL v6 = 0;
  }
  int v14 = v10 & v5;
  v15 = _MCLogObjects[0];
  BOOL v16 = os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT);
  if (v6 && v14)
  {
    if (v16)
    {
      LOWORD(v17[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "TargetDeviceResolver displaying prompt for iPhone, Watch, and HomePod", (uint8_t *)v17, 2u);
    }
    [a1 _showPromptForThisDeviceAndOtherDevicesWithCompletionBlock:v8];
  }
  else if (v14)
  {
    if (v16)
    {
      LOWORD(v17[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "TargetDeviceResolver displaying prompt for iPhone and HomePod", (uint8_t *)v17, 2u);
    }
    [a1 _showPromptForHomePodWithCompletionBlock:v8];
  }
  else if (v6)
  {
    if (v16)
    {
      LOWORD(v17[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "TargetDeviceResolver displaying prompt for iPhone and Watch", (uint8_t *)v17, 2u);
    }
    [a1 _showPromptForWatchWithCompletionBlock:v8];
  }
  else
  {
    if (v16)
    {
      LOWORD(v17[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "TargetDeviceResolver skipping prompt because only this device is available", (uint8_t *)v17, 2u);
    }
    v8[2](v8, +[MCProfile thisDeviceType]);
  }
}

+ (void)_showPromptForThisDeviceAndOtherDevicesWithCompletionBlock:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[MCUserNotificationManager sharedManager];
  BOOL v6 = MCLocalizedString();
  v7 = MCLocalizedString();
  v8 = MCLocalizedString();
  id v9 = MCLocalizedStringByDevice();
  unsigned int v10 = MCLocalizedString();
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000200E8;
  v13[3] = &unk_1000EB810;
  id v14 = v4;
  id v15 = a1;
  id v11 = v4;
  BYTE2(v12) = 1;
  LOWORD(v12) = 0;
  [v5 displayUserNotificationWithIdentifier:0 title:v6 message:v7 defaultButtonText:v8 alternateButtonText:v9 textfieldPlaceholder:v10 displayOnLockScreen:0 dismissOnLock:0 displayInAppWhitelistModes:0 dismissAfterTimeInterval:0 assertion:v12 completionBlock:v13];
}

+ (void)_showPromptForHomePodAndWatchWithCompletionBlock:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[MCUserNotificationManager sharedManager];
  BOOL v6 = MCLocalizedString();
  v7 = MCLocalizedString();
  v8 = MCLocalizedString();
  id v9 = [a1 _homepodText];
  unsigned int v10 = MCLocalizedString();
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100020300;
  v13[3] = &unk_1000EB838;
  id v14 = v4;
  id v11 = v4;
  BYTE2(v12) = 1;
  LOWORD(v12) = 0;
  [v5 displayUserNotificationWithIdentifier:0 title:v6 message:v7 defaultButtonText:v8 alternateButtonText:v9 textfieldPlaceholder:v10 displayOnLockScreen:0 dismissOnLock:0 displayInAppWhitelistModes:0 dismissAfterTimeInterval:0.0 assertion:v12 completionBlock:v13];
}

+ (void)_showPromptForHomePodWithCompletionBlock:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[MCUserNotificationManager sharedManager];
  BOOL v6 = MCLocalizedString();
  v7 = MCLocalizedString();
  v8 = MCLocalizedString();
  id v9 = MCLocalizedStringByDevice();
  unsigned int v10 = [a1 _homepodText];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002049C;
  v13[3] = &unk_1000EB838;
  id v14 = v4;
  id v11 = v4;
  BYTE2(v12) = 1;
  LOWORD(v12) = 0;
  [v5 displayUserNotificationWithIdentifier:0 title:v6 message:v7 defaultButtonText:v8 alternateButtonText:v9 textfieldPlaceholder:v10 displayOnLockScreen:0 dismissOnLock:0 displayInAppWhitelistModes:0 dismissAfterTimeInterval:0.0 assertion:v12 completionBlock:v13];
}

+ (void)_showPromptForWatchWithCompletionBlock:(id)a3
{
  id v3 = a3;
  id v4 = +[MCUserNotificationManager sharedManager];
  BOOL v5 = MCLocalizedString();
  BOOL v6 = MCLocalizedString();
  v7 = MCLocalizedString();
  v8 = MCLocalizedStringByDevice();
  id v9 = MCLocalizedString();
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100020698;
  v12[3] = &unk_1000EB838;
  id v13 = v3;
  id v10 = v3;
  BYTE2(v11) = 1;
  LOWORD(v11) = 0;
  [v4 displayUserNotificationWithIdentifier:0 title:v5 message:v6 defaultButtonText:v7 alternateButtonText:v8 textfieldPlaceholder:v9 displayOnLockScreen:0 dismissOnLock:0 displayInAppWhitelistModes:v11 dismissAfterTimeInterval:0 assertion:0 completionBlock:v12];
}

+ (id)_homepodText
{
  return (id)MCLocalizedString();
}

+ (id)stringForWatchAvailability:(unint64_t)a3
{
  if (a3 > 3) {
    return @"unknown";
  }
  else {
    return off_1000EB858[a3];
  }
}

@end