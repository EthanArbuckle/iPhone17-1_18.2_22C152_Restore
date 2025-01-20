@interface COSInitialPropertyExchangeViewController
+ (BOOL)controllerNeedsToRun;
- (BOOL)controllerAllowsNavigatingBackTo;
- (BOOL)holdBeforeDisplaying;
- (BOOL)holdWithWaitScreen;
- (COSBuddyControllerDelegate)delegate;
- (double)waitScreenPushGracePeriod;
- (id)holdActivityIdentifier;
- (id)localizedWaitScreenDescription;
- (void)_evaluatePendingTasksAfterActivationCompletedOrDeferredForUserResponse;
- (void)activationDeferredForUserAction;
- (void)addActivationObservers;
- (void)beginActivationIfPossible;
- (void)completedActivationPhase;
- (void)completedHoldTasks;
- (void)completedInitialProperyExchangePhase;
- (void)didEstablishHold;
- (void)endPerformancePhases;
- (void)enteredCompatibilityState:(id)a3;
- (void)evaluateCanReleaseHold;
- (void)setDelegate:(id)a3;
- (void)tellWatchToDoLanguageAndLocalePrep;
- (void)watchDidSelectLanguageAndLocale:(unsigned __int16)a3;
@end

@implementation COSInitialPropertyExchangeViewController

+ (BOOL)controllerNeedsToRun
{
  v2 = +[NRPairedDeviceRegistry sharedInstance];
  unsigned int v3 = [v2 compatibilityState];

  v4 = +[UIApplication sharedApplication];
  unsigned __int8 v5 = [v4 isActivated];

  v6 = [UIApp activeWatch];
  unsigned int v7 = sub_100032608(v6);

  v8 = +[UIApplication sharedApplication];
  unsigned int v9 = [v8 isLanguageAndLocaleFinished];

  if (v3 < 3) {
    return 1;
  }
  if (v5)
  {
    if ((v7 ^ 1 | v9) != 1) {
      return 1;
    }
    goto LABEL_7;
  }
  objc_opt_class();
  unsigned int v11 = sub_10005CE98();
  BOOL result = 1;
  if (v11 && ((v7 ^ 1 | v9) & 1) != 0)
  {
LABEL_7:
    v12 = [UIApp bridgeController];
    [v12 sendComputedTimeZoneToGizmo];

    return 0;
  }
  return result;
}

- (BOOL)holdBeforeDisplaying
{
  if (PBLogPerformanceMetrics())
  {
    unsigned int v3 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
    v4 = [(COSInitialPropertyExchangeViewController *)self holdActivityIdentifier];
    [v3 beginMacroActivity:v4 beginTime:CFAbsoluteTimeGetCurrent()];
  }
  return 1;
}

- (void)didEstablishHold
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005CFD4;
  block[3] = &unk_1002438A0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)evaluateCanReleaseHold
{
  unsigned int v3 = +[UIApplication sharedApplication];
  unsigned __int8 v4 = [v3 isActivated];

  unsigned __int8 v5 = [UIApp activeWatch];
  unsigned int v6 = sub_100032608(v5);

  unsigned int v7 = +[UIApplication sharedApplication];
  unsigned int v8 = [v7 isLanguageAndLocaleFinished];

  if (v4)
  {
    if ((v6 ^ 1 | v8) != 1) {
      return;
    }
  }
  else
  {
    objc_opt_class();
    if (!sub_10005CE98() || ((v6 ^ 1 | v8) & 1) == 0) {
      return;
    }
  }
  unsigned int v9 = pbb_setupflow_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    unsigned int v11 = "-[COSInitialPropertyExchangeViewController evaluateCanReleaseHold]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: releasing hold", (uint8_t *)&v10, 0xCu);
  }

  [(COSInitialPropertyExchangeViewController *)self completedHoldTasks];
}

- (BOOL)holdWithWaitScreen
{
  return 1;
}

- (double)waitScreenPushGracePeriod
{
  return 5.0;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  unsigned __int8 v4 = +[NSNotificationCenter defaultCenter];
  uint64_t v5 = NRPairedDeviceRegistryDeviceDidEnterCompatibilityStateNotification;
  [v4 addObserver:self selector:"enteredCompatibilityState:" name:NRPairedDeviceRegistryDeviceDidEnterCompatibilityStateNotification object:0];

  unsigned int v6 = +[NRPairedDeviceRegistry sharedInstance];
  unsigned int v7 = [v6 compatibilityState];

  if (v7 - 3 > 1)
  {
    int v10 = pbb_setupflow_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "IPE has begun observing for Compatibility State Changes", v11, 2u);
    }
  }
  else
  {
    unsigned int v8 = +[NSNotificationCenter defaultCenter];
    [v8 removeObserver:self name:v5 object:0];

    self->_canBeginActivating = 1;
    unsigned int v9 = pbb_setupflow_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "IPE determined NR is in Config/Normal state, continuing...", buf, 2u);
    }

    [(COSInitialPropertyExchangeViewController *)self completedInitialProperyExchangePhase];
  }
}

- (void)enteredCompatibilityState:(id)a3
{
  unsigned __int8 v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKeyedSubscript:NRPairedDeviceRegistryCompatibilityStateKey];
  unsigned __int16 v6 = (unsigned __int16)[v5 unsignedIntValue];

  unsigned int v7 = pbb_setupflow_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "IPE: Entered Compatibility State: %d", (uint8_t *)v9, 8u);
  }

  if (v6 == 3)
  {
    unsigned int v8 = +[NSNotificationCenter defaultCenter];
    [v8 removeObserver:self name:NRPairedDeviceRegistryDeviceDidEnterCompatibilityStateNotification object:0];

    self->_canBeginActivating = 1;
    [(COSInitialPropertyExchangeViewController *)self completedInitialProperyExchangePhase];
  }
}

- (id)localizedWaitScreenDescription
{
  v2 = [UIApp bridgeController];
  unsigned __int8 v3 = [v2 isTinkerPairing];
  unsigned __int8 v4 = +[NSBundle mainBundle];
  uint64_t v5 = v4;
  if (v3)
  {
    CFStringRef v6 = @"INITIAL_PROPERTY_EXCHANGE_HOLD_DESCRIPTION_TINKER";
    CFStringRef v7 = @"Localizable-tinker";
  }
  else
  {
    CFStringRef v6 = @"INITIAL_PROPERTY_EXCHANGE_HOLD_DESCRIPTION";
    CFStringRef v7 = @"Localizable";
  }
  unsigned int v8 = [v4 localizedStringForKey:v6 value:&stru_100249230 table:v7];

  return v8;
}

- (BOOL)controllerAllowsNavigatingBackTo
{
  return 0;
}

- (id)holdActivityIdentifier
{
  v2 = [UIApp activeWatch];
  if (sub_100032608(v2)) {
    unsigned __int8 v3 = @"InitialPropertyExchange-LanguageLocale";
  }
  else {
    unsigned __int8 v3 = @"InitialPropertyExchange";
  }
  unsigned __int8 v4 = v3;

  return v4;
}

- (void)addActivationObservers
{
  if (!self->_registeredActivationObservers)
  {
    unsigned __int8 v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:self selector:"completedActivationPhase" name:PBBridgeGizmoDidFinishActivatingNotification object:0];

    unsigned __int8 v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:self selector:"activationDeferredForUserAction" name:@"COSActivationResponseManagerStashedALFlowNotification" object:0];

    self->_registeredActivationObservers = 1;
  }
}

- (void)completedInitialProperyExchangePhase
{
  unsigned __int8 v3 = +[UIApplication sharedApplication];
  id v4 = [v3 isActivated];

  uint64_t v5 = [UIApp setupController];
  CFStringRef v6 = [v5 pairingReportManager];

  [v6 addPairingTimeEventToPairingReportPlist:68 withValue:&__kCFBooleanTrue withError:0];
  CFStringRef v7 = pbb_setupflow_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_opt_class();
    unsigned int v8 = +[NSNumber numberWithBool:sub_10005CE98()];
    unsigned int v9 = +[NSNumber numberWithBool:v4];
    *(_DWORD *)buf = 138412546;
    CFStringRef v26 = v8;
    __int16 v27 = 2112;
    v28 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "completedInitialProperyExchangePhase. Activation State: (activationNeedsResponse %@ / activated %@)", buf, 0x16u);
  }
  int v10 = [UIApp bridgeController];
  [v10 sendComputedTimeZoneToGizmo];

  objc_opt_class();
  if ((sub_10005CE98() | v4))
  {
    objc_opt_class();
    if ((sub_10005CE98() ^ 1 | v4))
    {
      if (v4) {
        [(COSInitialPropertyExchangeViewController *)self completedActivationPhase];
      }
    }
    else
    {
      [(COSInitialPropertyExchangeViewController *)self activationDeferredForUserAction];
    }
  }
  else
  {
    [(COSInitialPropertyExchangeViewController *)self addActivationObservers];
    [(COSInitialPropertyExchangeViewController *)self beginActivationIfPossible];
  }
  unsigned int v11 = +[UIApplication sharedApplication];
  v12 = [v11 activeWatch];

  v13 = [v12 valueForProperty:NRDevicePropertyPairingID];
  v14 = [v12 valueForProperty:NRDevicePropertyLocalPairingDataStorePath];
  id v15 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.nano" pairingID:v13 pairingDataStore:v14];
  id v16 = [v15 synchronize];
  unsigned int v17 = [v15 BOOLForKey:@"invertUI"];
  v18 = +[UIApplication sharedApplication];
  v19 = [v18 bridgeController];
  [v19 tellGizmoToSetCrownOrientationRight:v17 ^ 1];

  v20 = pbb_setupflow_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v26 = @"com.apple.nano";
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "syncing %@", buf, 0xCu);
  }

  v21 = +[UIApplication sharedApplication];
  unsigned __int8 v22 = [v21 isLanguageAndLocaleFinished];

  id v23 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"3A6A41CC-1427-4F81-88F4-82365AA10C82"];
  if (![v12 supportsCapability:v23] || (v22 & 1) != 0)
  {
  }
  else
  {
    unsigned int v24 = sub_100032608(v12);

    if (v24) {
      [(COSInitialPropertyExchangeViewController *)self tellWatchToDoLanguageAndLocalePrep];
    }
  }
}

- (void)beginActivationIfPossible
{
  unsigned __int8 v3 = pbb_setupflow_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = +[NSNumber numberWithBool:self->_canBeginActivating];
    uint64_t v5 = +[NSNumber numberWithBool:self->_didBeginActivating];
    int v17 = 138412546;
    v18 = v4;
    __int16 v19 = 2112;
    v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "(IPE) beginActivationIfPossible? _canBeginActivating %@ / _didBeginActivating %@", (uint8_t *)&v17, 0x16u);
  }
  if (self->_didBeginActivating)
  {
    CFStringRef v6 = pbb_setupflow_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      CFStringRef v7 = "(IPE) already activating";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v17, 2u);
    }
  }
  else
  {
    if (!self->_canBeginActivating)
    {
      CFStringRef v6 = pbb_setupflow_log();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_20;
      }
      LOWORD(v17) = 0;
      CFStringRef v7 = "(IPE) Still awaiting NRPairedDeviceRegistryDeviceDidBeginActivation / NRCompatibilityStateConfigure...";
      goto LABEL_6;
    }
    if (PBLogPerformanceMetrics())
    {
      unsigned int v8 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
      [v8 endMacroActivity:PBBridgeGizmoPairingActivityName beginTime:CFAbsoluteTimeGetCurrent()];
      double v10 = v9;

      +[PBBridgeCAReporter pushTimingType:1 withValue:v10];
      unsigned int v11 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
      [v11 beginMacroActivity:PBBridgeProxyActivationStageOneActivityName beginTime:CFAbsoluteTimeGetCurrent()];
    }
    v12 = pbb_setupflow_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "(IPE) did begin activation", (uint8_t *)&v17, 2u);
    }

    v13 = +[NSUserDefaults standardUserDefaults];
    unsigned int v14 = [v13 BOOLForKey:@"__SkipReachabilityChecks"];

    CFStringRef v6 = pbb_setupflow_log();
    BOOL v15 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (!v15) {
        goto LABEL_20;
      }
      LOWORD(v17) = 0;
      CFStringRef v7 = "(IPE) Internal Flow Skipping Reachability Checks.";
      goto LABEL_6;
    }
    if (v15)
    {
      LOWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "(IPE) Tell Gizmo We're Ready To Try Activating", (uint8_t *)&v17, 2u);
    }

    self->_didBeginActivating = 1;
    CFStringRef v6 = +[UIApplication sharedApplication];
    id v16 = [v6 bridgeController];
    [v16 tellGizmoToBeginActivation];
  }
LABEL_20:
}

- (void)_evaluatePendingTasksAfterActivationCompletedOrDeferredForUserResponse
{
  unsigned __int8 v3 = [UIApp activeWatch];
  unsigned int v4 = sub_100032608(v3);

  if (v4
    && (+[UIApplication sharedApplication],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        unsigned int v6 = [v5 isLanguageAndLocaleFinished],
        v5,
        !v6))
  {
    [(COSInitialPropertyExchangeViewController *)self tellWatchToDoLanguageAndLocalePrep];
  }
  else
  {
    [(COSInitialPropertyExchangeViewController *)self completedHoldTasks];
  }
}

- (void)activationDeferredForUserAction
{
  unsigned __int8 v3 = pbb_setupflow_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[COSInitialPropertyExchangeViewController activationDeferredForUserAction]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  [(COSInitialPropertyExchangeViewController *)self _evaluatePendingTasksAfterActivationCompletedOrDeferredForUserResponse];
}

- (void)completedActivationPhase
{
  unsigned __int8 v3 = pbb_setupflow_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[COSInitialPropertyExchangeViewController completedActivationPhase]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  [(COSInitialPropertyExchangeViewController *)self _evaluatePendingTasksAfterActivationCompletedOrDeferredForUserResponse];
}

- (void)tellWatchToDoLanguageAndLocalePrep
{
  unsigned __int8 v3 = pbb_setupflow_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    unsigned int v11 = "-[COSInitialPropertyExchangeViewController tellWatchToDoLanguageAndLocalePrep]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (!self->_sentLanguageAndLocaleUpdate)
  {
    int v4 = -[COSTinkerHealthSharingSetupDelegate tinkerDevice]_0();
    id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"61A9519E-E0F5-4F71-9CA4-33AC4A444B44"];
    id v6 = [v4 supportsCapability:v5];

    CFStringRef v7 = +[UIApplication sharedApplication];
    unsigned int v8 = [v7 bridgeController];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    _DWORD v9[2] = sub_10005E0E4;
    v9[3] = &unk_100244BA8;
    v9[4] = self;
    [v8 tellWatchLanguagesAndLocaleSupportingTermOfAddress:v6 withCompletion:v9];

    self->_sentLanguageAndLocaleUpdate = 1;
  }
}

- (void)watchDidSelectLanguageAndLocale:(unsigned __int16)a3
{
  int v3 = a3;
  id v5 = pbb_setupflow_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315138;
    BOOL v15 = "-[COSInitialPropertyExchangeViewController watchDidSelectLanguageAndLocale:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v14, 0xCu);
  }

  id v6 = +[UIApplication sharedApplication];
  unsigned int v7 = [v6 isActivated];

  if (v7)
  {
    unsigned int v8 = pbb_setupflow_log();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
LABEL_14:

      [(COSInitialPropertyExchangeViewController *)self completedHoldTasks];
      return;
    }
    LOWORD(v14) = 0;
    double v9 = "Activated and Completed language change...";
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v14, 2u);
    goto LABEL_14;
  }
  if (v3 != 2)
  {
    objc_opt_class();
    if (!sub_10005CE98()) {
      return;
    }
    unsigned int v8 = pbb_setupflow_log();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    LOWORD(v14) = 0;
    double v9 = "Complete IPE Pane, move on and show AL Challenge later.";
    goto LABEL_13;
  }
  double v10 = pbb_setupflow_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Ask again for Activation post-language change relaunch!", (uint8_t *)&v14, 2u);
  }

  unsigned int v11 = +[UIApplication sharedApplication];
  v12 = [v11 setupController];

  [v12 tellWatchAgainToUpdateNRToNormalStateAfterRelaunchingForLanguageChange];
  v13 = [v12 activationManager];
  [v13 clearActivationState];

  self->_didBeginActivating = 0;
  [(COSInitialPropertyExchangeViewController *)self addActivationObservers];
  [(COSInitialPropertyExchangeViewController *)self beginActivationIfPossible];
}

- (void)completedHoldTasks
{
  int v3 = pbb_setupflow_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    v12 = "-[COSInitialPropertyExchangeViewController completedHoldTasks]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v11, 0xCu);
  }

  int v4 = +[UIApplication sharedApplication];
  unsigned int v5 = [v4 isActivated];

  if (v5)
  {
    id v6 = +[UIApplication sharedApplication];
    unsigned int v7 = [v6 setupController];
    [v7 startPostActivationCompatiblePairingBackgroundTasks];
  }
  sub_10005D5D0((uint64_t)self);
  [(COSInitialPropertyExchangeViewController *)self endPerformancePhases];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unsigned int v9 = [WeakRetained buddyControllerIsBeingHeldOff:self];

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    [v10 buddyControllerReleaseHoldAndSkip:self];
  }
}

- (void)endPerformancePhases
{
  if (PBLogPerformanceMetrics())
  {
    id v6 = [(COSInitialPropertyExchangeViewController *)self holdActivityIdentifier];
    int v3 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
    [v3 endMacroActivity:v6 beginTime:CFAbsoluteTimeGetCurrent()];
    double v5 = v4;

    +[PBBridgeCAReporter pushTimingForTypeNamed:v6 withValue:v5];
  }
}

- (COSBuddyControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (COSBuddyControllerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_npsQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end