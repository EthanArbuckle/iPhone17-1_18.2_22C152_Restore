@interface SBApplicationLaunchAlertEvaluatorForNetworkBasedAlertItems
- (SBApplicationLaunchAlertEvaluatorForNetworkBasedAlertItems)init;
- (SBApplicationLaunchAlertEvaluatorForNetworkBasedAlertItems)initWithAirplaneModeController:(id)a3 telephonyManager:(id)a4;
- (id)_airplaneModeController;
- (id)_telephonyManager;
- (unint64_t)shouldShowLaunchAlertForApplication:(id)a3;
@end

@implementation SBApplicationLaunchAlertEvaluatorForNetworkBasedAlertItems

- (unint64_t)shouldShowLaunchAlertForApplication:(id)a3
{
  id v4 = a3;
  v5 = [(SBApplicationLaunchAlertEvaluatorForNetworkBasedAlertItems *)self _telephonyManager];
  v6 = [(SBApplicationLaunchAlertEvaluatorForNetworkBasedAlertItems *)self _airplaneModeController];
  v7 = [v4 bundleIdentifier];
  char v8 = [v4 dataUsage];
  if (([@"com.apple.InCallService" isEqualToString:v7] & 1) != 0
    || (v8 & 4) == 0 && (v8 & 1) == 0 && (v8 & 2) == 0)
  {
    goto LABEL_14;
  }
  if (![v6 isInAirplaneMode])
  {
    if (v8) {
      goto LABEL_13;
    }
LABEL_14:
    uint64_t v10 = 0;
    goto LABEL_15;
  }
  int v9 = [v5 hasNonCellularNetworkConnection] ^ 1 | ((v8 & 4) >> 2);
  if (v9) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = 0;
  }
  if (v9 & 1) == 0 && (v8)
  {
LABEL_13:
    if (([@"com.apple.MobileSMS" isEqualToString:v7] & 1) == 0)
    {
      uint64_t v13 = [v5 dataConnectionAvailabilityWithCurrentCalls];
      if (v13 == 1) {
        uint64_t v10 = 1;
      }
      else {
        uint64_t v10 = 4 * (v13 == 2);
      }
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_15:
  if ([v4 hasDisplayedLaunchAlertForType:v10]) {
    unint64_t v11 = 0;
  }
  else {
    unint64_t v11 = v10;
  }

  return v11;
}

- (id)_telephonyManager
{
  telephonyManager = self->_telephonyManager;
  if (telephonyManager)
  {
    v3 = telephonyManager;
  }
  else
  {
    v3 = +[SBTelephonyManager sharedTelephonyManager];
  }
  return v3;
}

- (id)_airplaneModeController
{
  airplaneModeController = self->_airplaneModeController;
  if (airplaneModeController)
  {
    v3 = airplaneModeController;
  }
  else
  {
    v3 = +[SBAirplaneModeController sharedInstance];
  }
  return v3;
}

- (SBApplicationLaunchAlertEvaluatorForNetworkBasedAlertItems)init
{
  return [(SBApplicationLaunchAlertEvaluatorForNetworkBasedAlertItems *)self initWithAirplaneModeController:0 telephonyManager:0];
}

- (SBApplicationLaunchAlertEvaluatorForNetworkBasedAlertItems)initWithAirplaneModeController:(id)a3 telephonyManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBApplicationLaunchAlertEvaluatorForNetworkBasedAlertItems;
  int v9 = [(SBApplicationLaunchAlertEvaluatorForNetworkBasedAlertItems *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_airplaneModeController, a3);
    objc_storeStrong((id *)&v10->_telephonyManager, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telephonyManager, 0);
  objc_storeStrong((id *)&self->_airplaneModeController, 0);
}

@end