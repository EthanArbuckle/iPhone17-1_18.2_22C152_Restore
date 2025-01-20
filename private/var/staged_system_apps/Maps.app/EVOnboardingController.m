@interface EVOnboardingController
- (BOOL)_validateStateTransitionFromState:(int64_t)a3 toState:(int64_t)a4;
- (EVOnboardingController)initWithUnpairedVehicles:(id)a3;
- (SingleVehicleOnboardingController)currentSingleVehicleOnboardingController;
- (id)_viewControllerForState:(int64_t)a3;
- (int64_t)state;
- (void)_cleanUp;
- (void)_dismissOnboarding;
- (void)_finishConfiguringVehicle:(id)a3;
- (void)_onboardVehicles:(id)a3;
- (void)_proceedFromPrivacyControllerWithSelectedOptIn:(BOOL)a3;
- (void)_proceedToNextState;
- (void)_startSingleVehicleOnboardingWithVehicles:(id)a3;
- (void)_updateCurrentSingleVehicleOnboardingController;
- (void)onboardingController:(id)a3 didFinishOnboardingVehicle:(id)a4 willProceedSettingUpLPR:(BOOL)a5;
- (void)onboardingController:(id)a3 didFinishSettingUpLPRForVehicle:(id)a4;
- (void)onboardingViewControllerWillMoveFromParentViewController:(id)a3;
- (void)presentInViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)privacyViewControllerDidSelectNotNow:(id)a3;
- (void)privacyViewControllerDidSelectShare:(id)a3;
- (void)setCurrentSingleVehicleOnboardingController:(id)a3;
- (void)setState:(int64_t)a3;
- (void)vehicleSelectionViewController:(id)a3 didSelectContinueWithVehicles:(id)a4;
- (void)virtualGarageDidUpdate:(id)a3;
- (void)welcomeViewControllerDidDismiss:(id)a3;
- (void)welcomeViewControllerDidSelectConnect:(id)a3;
@end

@implementation EVOnboardingController

- (EVOnboardingController)initWithUnpairedVehicles:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EVOnboardingController;
  v6 = [(EVOnboardingController *)&v12 init];
  v7 = v6;
  if (v6)
  {
    v6->_state = 0;
    uint64_t v8 = +[NSMutableDictionary dictionary];
    viewControllersByState = v7->_viewControllersByState;
    v7->_viewControllersByState = (NSMutableDictionary *)v8;

    objc_storeStrong((id *)&v7->_unpairedVehicles, a3);
    v10 = +[VGVirtualGarageService sharedService];
    [v10 registerObserver:v7];
  }
  return v7;
}

- (void)setState:(int64_t)a3
{
  int64_t state = self->_state;
  if (state != a3)
  {
    if ([(EVOnboardingController *)self _validateStateTransitionFromState:state toState:a3])
    {
      v6 = sub_1005761B4();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        unint64_t v7 = self->_state;
        if (v7 >= 6)
        {
          v15 = sub_1005762E4();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            int v29 = 136315650;
            v30 = "NSString *NSStringFromEVOnboardingControllerState(EVOnboardingControllerState)";
            __int16 v31 = 2080;
            v32 = "EVOnboardingController.m";
            __int16 v33 = 1024;
            int v34 = 51;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v29, 0x1Cu);
          }

          if (sub_100BB36BC())
          {
            v16 = sub_1005762E4();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              v17 = +[NSThread callStackSymbols];
              int v29 = 138412290;
              v30 = v17;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v29, 0xCu);
            }
          }
          CFStringRef v8 = @"Unknown";
        }
        else
        {
          CFStringRef v8 = *(&off_101317000 + v7);
        }
        if ((unint64_t)a3 >= 6)
        {
          v23 = sub_1005762E4();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            int v29 = 136315650;
            v30 = "NSString *NSStringFromEVOnboardingControllerState(EVOnboardingControllerState)";
            __int16 v31 = 2080;
            v32 = "EVOnboardingController.m";
            __int16 v33 = 1024;
            int v34 = 51;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v29, 0x1Cu);
          }

          if (sub_100BB36BC())
          {
            v24 = sub_1005762E4();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              v25 = +[NSThread callStackSymbols];
              int v29 = 138412290;
              v30 = v25;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v29, 0xCu);
            }
          }
          CFStringRef v18 = @"Unknown";
        }
        else
        {
          CFStringRef v18 = *(&off_101317000 + a3);
        }
        int v29 = 138412546;
        v30 = (const char *)v8;
        __int16 v31 = 2112;
        v32 = (const char *)v18;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Setting state from: %@, to: %@", (uint8_t *)&v29, 0x16u);
      }

      self->_int64_t state = a3;
    }
    else
    {
      v9 = sub_1005762E4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v29 = 136315650;
        v30 = "-[EVOnboardingController setState:]";
        __int16 v31 = 2080;
        v32 = "EVOnboardingController.m";
        __int16 v33 = 1024;
        int v34 = 108;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v29, 0x1Cu);
      }

      if (sub_100BB36BC())
      {
        v10 = sub_1005762E4();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v11 = +[NSThread callStackSymbols];
          int v29 = 138412290;
          v30 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v29, 0xCu);
        }
      }
      objc_super v12 = sub_1005761B4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        unint64_t v13 = self->_state;
        if (v13 >= 6)
        {
          v19 = sub_1005762E4();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            int v29 = 136315650;
            v30 = "NSString *NSStringFromEVOnboardingControllerState(EVOnboardingControllerState)";
            __int16 v31 = 2080;
            v32 = "EVOnboardingController.m";
            __int16 v33 = 1024;
            int v34 = 51;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v29, 0x1Cu);
          }

          if (sub_100BB36BC())
          {
            v20 = sub_1005762E4();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              v21 = +[NSThread callStackSymbols];
              int v29 = 138412290;
              v30 = v21;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v29, 0xCu);
            }
          }
          CFStringRef v14 = @"Unknown";
        }
        else
        {
          CFStringRef v14 = *(&off_101317000 + v13);
        }
        if ((unint64_t)a3 >= 6)
        {
          v26 = sub_1005762E4();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            int v29 = 136315650;
            v30 = "NSString *NSStringFromEVOnboardingControllerState(EVOnboardingControllerState)";
            __int16 v31 = 2080;
            v32 = "EVOnboardingController.m";
            __int16 v33 = 1024;
            int v34 = 51;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v29, 0x1Cu);
          }

          if (sub_100BB36BC())
          {
            v27 = sub_1005762E4();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              v28 = +[NSThread callStackSymbols];
              int v29 = 138412290;
              v30 = v28;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v29, 0xCu);
            }
          }
          CFStringRef v22 = @"Unknown";
        }
        else
        {
          CFStringRef v22 = *(&off_101317000 + a3);
        }
        int v29 = 138412546;
        v30 = (const char *)v14;
        __int16 v31 = 2112;
        v32 = (const char *)v22;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Tried to set state from: %@, to: %@, which is not supported", (uint8_t *)&v29, 0x16u);
      }
    }
  }
}

- (BOOL)_validateStateTransitionFromState:(int64_t)a3 toState:(int64_t)a4
{
  int64_t v4 = a4 - a3;
  if (a4 - a3 < 0) {
    int64_t v4 = a3 - a4;
  }
  BOOL v6 = a3 == 2 && a4 == 4;
  BOOL v7 = v4 == 1 || v6;
  return a4 == 5 || v7;
}

- (void)presentInViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v10 = [v8 presentedViewController];

  if (v10)
  {
    do
    {
      v11 = [v8 presentedViewController];

      objc_super v12 = [v11 presentedViewController];

      id v8 = v11;
    }
    while (v12);
    if (v11)
    {
LABEL_4:
      if (self->_state)
      {
        v20 = sub_1005762E4();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          int v28 = 136315906;
          int v29 = "-[EVOnboardingController presentInViewController:animated:completion:]";
          __int16 v30 = 2080;
          __int16 v31 = "EVOnboardingController.m";
          __int16 v32 = 1024;
          int v33 = 146;
          __int16 v34 = 2080;
          v35 = "_state == EVOnboardingControllerStateNone";
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v28, 0x26u);
        }

        if (sub_100BB36BC())
        {
          v21 = sub_1005762E4();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            CFStringRef v22 = +[NSThread callStackSymbols];
            int v28 = 138412290;
            int v29 = v22;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v28, 0xCu);
          }
        }
        if (self->_state)
        {
          unint64_t v13 = sub_1005761B4();
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            goto LABEL_10;
          }
          unint64_t state = self->_state;
          if (state >= 6)
          {
            v25 = sub_1005762E4();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              int v28 = 136315650;
              int v29 = "NSString *NSStringFromEVOnboardingControllerState(EVOnboardingControllerState)";
              __int16 v30 = 2080;
              __int16 v31 = "EVOnboardingController.m";
              __int16 v32 = 1024;
              int v33 = 51;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v28, 0x1Cu);
            }

            if (sub_100BB36BC())
            {
              v26 = sub_1005762E4();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              {
                v27 = +[NSThread callStackSymbols];
                int v28 = 138412290;
                int v29 = v27;
                _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v28, 0xCu);
              }
            }
            CFStringRef v24 = @"Unknown";
          }
          else
          {
            CFStringRef v24 = *(&off_101317000 + state);
          }
          int v28 = 138412290;
          int v29 = (const char *)v24;
          v17 = "Tried to present welcome onboarding VC, but state of the controller was: %@.";
          CFStringRef v18 = v13;
          uint32_t v19 = 12;
          goto LABEL_9;
        }
      }
      objc_storeStrong((id *)&self->_presentingViewController, v11);
      [(EVOnboardingController *)self setState:1];
      unint64_t v13 = [(EVOnboardingController *)self _viewControllerForState:self->_state];
      CFStringRef v14 = (UINavigationController *)[objc_alloc((Class)OBNavigationController) initWithRootViewController:v13];
      [(UINavigationController *)v14 setModalPresentationStyle:2];
      navigationController = self->_navigationController;
      self->_navigationController = v14;
      v16 = v14;

      [v11 presentViewController:v16 animated:v6 completion:v9];
      goto LABEL_10;
    }
  }
  else
  {
    v11 = v8;
    if (v8) {
      goto LABEL_4;
    }
  }
  unint64_t v13 = sub_1005761B4();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v28) = 0;
    v17 = "Tried to present on a nil presenting VC.";
    CFStringRef v18 = v13;
    uint32_t v19 = 2;
LABEL_9:
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v28, v19);
  }
LABEL_10:
}

- (id)_viewControllerForState:(int64_t)a3
{
  viewControllersByState = self->_viewControllersByState;
  BOOL v6 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:");
  [(NSMutableDictionary *)viewControllersByState objectForKeyedSubscript:v6];

  switch(a3)
  {
    case 0:
    case 5:
      BOOL v7 = sub_1005762E4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v37 = 136315906;
        v38 = "-[EVOnboardingController _viewControllerForState:]";
        __int16 v39 = 2080;
        v40 = "EVOnboardingController.m";
        __int16 v41 = 1024;
        int v42 = 170;
        __int16 v43 = 2080;
        v44 = "state != EVOnboardingControllerStateNone && state != EVOnboardingControllerStateDismissed";
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v37, 0x26u);
      }

      if (sub_100BB36BC())
      {
        id v8 = sub_1005762E4();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          id v9 = +[NSThread callStackSymbols];
          int v37 = 138412290;
          v38 = v9;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v37, 0xCu);
        }
      }
      sub_1005761B4();
      v10 = (EVOnboardingWelcomeViewController *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v10->super.super.super.super, OS_LOG_TYPE_FAULT))
      {
        if ((unint64_t)a3 >= 6)
        {
          v21 = sub_1005762E4();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            int v37 = 136315650;
            v38 = "NSString *NSStringFromEVOnboardingControllerState(EVOnboardingControllerState)";
            __int16 v39 = 2080;
            v40 = "EVOnboardingController.m";
            __int16 v41 = 1024;
            int v42 = 51;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v37, 0x1Cu);
          }

          if (sub_100BB36BC())
          {
            CFStringRef v22 = sub_1005762E4();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              v23 = +[NSThread callStackSymbols];
              int v37 = 138412290;
              v38 = v23;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v37, 0xCu);
            }
          }
          CFStringRef v11 = @"Unknown";
        }
        else
        {
          CFStringRef v11 = *(&off_101317000 + a3);
        }
        int v37 = 138412290;
        v38 = (const char *)v11;
        _os_log_impl((void *)&_mh_execute_header, &v10->super.super.super.super, OS_LOG_TYPE_FAULT, "Tried to get a VC for %@ state", (uint8_t *)&v37, 0xCu);
      }
      goto LABEL_26;
    case 1:
      v10 = [[EVOnboardingWelcomeViewController alloc] initWithVehicles:self->_unpairedVehicles delegate:self];
      objc_super v12 = self->_viewControllersByState;
      uint64_t v13 = 1;
      goto LABEL_14;
    case 2:
      v10 = [[EVOnboardingPrivacyViewController alloc] initWithDelegate:self];
      objc_super v12 = self->_viewControllersByState;
      uint64_t v13 = 2;
      goto LABEL_14;
    case 3:
      v10 = [[EVOnboardingVehicleSelectionViewController alloc] initWithVehicles:self->_unpairedVehicles delegate:self];
      objc_super v12 = self->_viewControllersByState;
      uint64_t v13 = 3;
LABEL_14:
      CFStringRef v14 = +[NSNumber numberWithInteger:v13];
      [(NSMutableDictionary *)v12 setObject:v10 forKeyedSubscript:v14];

LABEL_26:
      goto LABEL_27;
    case 4:
      v15 = [(EVOnboardingController *)self currentSingleVehicleOnboardingController];
      v16 = [v15 currentViewController];

      if (!v16)
      {
        __int16 v34 = sub_1005762E4();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          int v37 = 136315906;
          v38 = "-[EVOnboardingController _viewControllerForState:]";
          __int16 v39 = 2080;
          v40 = "EVOnboardingController.m";
          __int16 v41 = 1024;
          int v42 = 183;
          __int16 v43 = 2080;
          v44 = "self.currentSingleVehicleOnboardingController.currentViewController";
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v37, 0x26u);
        }

        if (sub_100BB36BC())
        {
          v35 = sub_1005762E4();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            v36 = +[NSThread callStackSymbols];
            int v37 = 138412290;
            v38 = v36;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v37, 0xCu);
          }
        }
      }
      v17 = [(EVOnboardingController *)self currentSingleVehicleOnboardingController];
      CFStringRef v18 = [v17 currentViewController];

      if (v18)
      {
        uint32_t v19 = [(EVOnboardingController *)self currentSingleVehicleOnboardingController];
        uint64_t v20 = [v19 currentViewController];
LABEL_29:
        int v28 = (void *)v20;
      }
      else
      {
        uint32_t v19 = sub_1005761B4();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        {
          __int16 v30 = [(EVOnboardingController *)self currentSingleVehicleOnboardingController];
          int v37 = 138412290;
          v38 = v30;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "Tried to get a single vehicle onboarding VC, but failed. Current onboarding controller: %@", (uint8_t *)&v37, 0xCu);
        }
        int v28 = 0;
      }

      return v28;
    default:
LABEL_27:
      CFStringRef v24 = self->_viewControllersByState;
      v25 = +[NSNumber numberWithInteger:a3];
      v26 = [(NSMutableDictionary *)v24 objectForKeyedSubscript:v25];

      if (!v26)
      {
        __int16 v31 = sub_1005762E4();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          int v37 = 136315906;
          v38 = "-[EVOnboardingController _viewControllerForState:]";
          __int16 v39 = 2080;
          v40 = "EVOnboardingController.m";
          __int16 v41 = 1024;
          int v42 = 192;
          __int16 v43 = 2080;
          v44 = "_viewControllersByState[@(state)]";
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v37, 0x26u);
        }

        if (sub_100BB36BC())
        {
          __int16 v32 = sub_1005762E4();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            int v33 = +[NSThread callStackSymbols];
            int v37 = 138412290;
            v38 = v33;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v37, 0xCu);
          }
        }
      }
      v27 = self->_viewControllersByState;
      uint32_t v19 = +[NSNumber numberWithInteger:a3];
      uint64_t v20 = [(NSMutableDictionary *)v27 objectForKeyedSubscript:v19];
      goto LABEL_29;
  }
}

- (SingleVehicleOnboardingController)currentSingleVehicleOnboardingController
{
  return self->_currentSingleVehicleOnboardingController;
}

- (void)_dismissOnboarding
{
  if (MapsFeature_IsEnabled_EVRoutingEnhancements()
    && [(NSArray *)self->_onboardedVehicles count])
  {
    v3 = +[MKMapService sharedService];
    int64_t v4 = +[NSNumber numberWithUnsignedInteger:self->_onboardedVehicleCount];
    id v5 = [v4 stringValue];
    [v3 captureUserAction:2107 onTarget:660 eventValue:v5];
  }
  presentingViewController = self->_presentingViewController;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100AE233C;
  v7[3] = &unk_1012E5D08;
  v7[4] = self;
  [(UIViewController *)presentingViewController dismissViewControllerAnimated:1 completion:v7];
}

- (void)_cleanUp
{
  currentSingleVehicleOnboardingController = self->_currentSingleVehicleOnboardingController;
  self->_currentSingleVehicleOnboardingController = 0;

  [(EVOnboardingController *)self setState:5];
  viewControllersByState = self->_viewControllersByState;
  self->_viewControllersByState = 0;

  presentingViewController = self->_presentingViewController;
  self->_presentingViewController = 0;
}

- (void)_proceedToNextState
{
  unint64_t v3 = [(EVOnboardingController *)self state];
  unint64_t v4 = v3;
  if (v3 >= 4)
  {
    id v5 = sub_1005762E4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v16 = "-[EVOnboardingController _proceedToNextState]";
      __int16 v17 = 2080;
      CFStringRef v18 = "EVOnboardingController.m";
      __int16 v19 = 1024;
      int v20 = 223;
      __int16 v21 = 2080;
      CFStringRef v22 = "canPresentViewControllerForState";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      BOOL v6 = sub_1005762E4();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        BOOL v7 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v16 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
    id v8 = sub_1005761B4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      id v9 = "RefinementsBarButtonValue";
      if (v4 == -1)
      {
        CFStringRef v10 = @"None";
      }
      else if (v4 == 4)
      {
        CFStringRef v10 = @"Dismissed";
      }
      else
      {
        CFStringRef v11 = sub_1005762E4();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v16 = "NSString *NSStringFromEVOnboardingControllerState(EVOnboardingControllerState)";
          __int16 v17 = 2080;
          CFStringRef v18 = "EVOnboardingController.m";
          __int16 v19 = 1024;
          int v20 = 51;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
        }

        if (sub_100BB36BC())
        {
          objc_super v12 = sub_1005762E4();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            uint64_t v13 = +[NSThread callStackSymbols];
            *(_DWORD *)buf = 138412290;
            v16 = v13;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }
        }
        CFStringRef v10 = @"Unknown";
        id v9 = "RefinementsBarButtonValue";
      }
      *(_DWORD *)buf = *((void *)v9 + 277);
      v16 = (const char *)v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "Tried to proceed to next state (%@) in EV onboarding, but that was not possible.", buf, 0xCu);
    }
  }
  else
  {
    [(EVOnboardingController *)self setState:v3 + 1];
    id v14 = [(EVOnboardingController *)self _viewControllerForState:[(EVOnboardingController *)self state]];
    -[UINavigationController pushViewController:animated:](self->_navigationController, "pushViewController:animated:");
  }
}

- (void)_onboardVehicles:(id)a3
{
  id v4 = a3;
  id v5 = sub_1005761B4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = v4;
    BOOL v7 = v6;
    if (v6)
    {
      if ([v6 count])
      {
        id v8 = [v7 componentsJoinedByString:@", "];
        id v9 = +[NSString stringWithFormat:@"<%p> [%@]", v7, v8];
      }
      else
      {
        id v9 = +[NSString stringWithFormat:@"<%p> (empty)", v7];
      }
    }
    else
    {
      id v9 = @"<nil>";
    }

    *(_DWORD *)buf = 138412290;
    int v29 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Onboarding vehicles: %@", buf, 0xCu);
  }
  CFStringRef v10 = (NSArray *)[v4 copy];
  onboardedVehicles = self->_onboardedVehicles;
  self->_onboardedVehicles = v10;

  self->_onboardedVehicleCount = (unint64_t)[v4 count];
  objc_storeStrong(&self->_strongSelf, self);
  objc_initWeak((id *)buf, self);
  dispatch_time_t v12 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100AE2A28;
  block[3] = &unk_1012E6708;
  objc_copyWeak(&v26, (id *)buf);
  dispatch_after(v12, (dispatch_queue_t)&_dispatch_main_q, block);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v13 = v4;
  id v14 = [v13 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v22;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        CFStringRef v18 = +[VGVirtualGarageService sharedService];
        [v18 virtualGarageOnboardVehicle:v17];
      }
      id v14 = [v13 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v14);
  }

  if ([v13 count] == (id)1)
  {
    __int16 v19 = +[VGVirtualGarageService sharedService];
    int v20 = [v13 firstObject];
    [v19 virtualGarageSelectVehicle:v20];
  }
  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)buf);
}

- (void)onboardingViewControllerWillMoveFromParentViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(EVOnboardingController *)self _viewControllerForState:[(EVOnboardingController *)self state]];

  if (v5 != v4)
  {
    long long v21 = sub_1005762E4();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      __int16 v30 = "-[EVOnboardingController onboardingViewControllerWillMoveFromParentViewController:]";
      __int16 v31 = 2080;
      __int16 v32 = "EVOnboardingController.m";
      __int16 v33 = 1024;
      int v34 = 264;
      __int16 v35 = 2080;
      v36 = "viewController == [self _viewControllerForState:self.state]";
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      long long v22 = sub_1005762E4();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        long long v23 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        __int16 v30 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  id v6 = [v4 navigationController];
  BOOL v7 = [v6 childViewControllers];
  id v8 = [v7 lastObject];

  id v9 = sub_1005761B4();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    CFStringRef v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    CFStringRef v11 = (char *)objc_claimAutoreleasedReturnValue();
    dispatch_time_t v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    id v13 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    __int16 v30 = v11;
    __int16 v31 = 2112;
    __int16 v32 = v13;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "onboardingViewControllerWillMoveFromParentViewController: %@ to: %@", buf, 0x16u);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = self->_viewControllersByState;
  id v15 = [(NSMutableDictionary *)v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v25;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        __int16 v19 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        int v20 = -[NSMutableDictionary objectForKeyedSubscript:](self->_viewControllersByState, "objectForKeyedSubscript:", v19, (void)v24);

        if (v20 == v8) {
          -[EVOnboardingController setState:](self, "setState:", [v19 integerValue]);
        }
      }
      id v16 = [(NSMutableDictionary *)v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v16);
  }
}

- (void)welcomeViewControllerDidDismiss:(id)a3
{
  id v4 = +[MKMapService sharedService];
  [v4 captureUserAction:446 onTarget:660 eventValue:0];

  [(EVOnboardingController *)self _dismissOnboarding];
}

- (void)welcomeViewControllerDidSelectConnect:(id)a3
{
  if ((id)[(EVOnboardingController *)self state] != (id)1)
  {
    id v4 = sub_1005762E4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315906;
      id v8 = "-[EVOnboardingController welcomeViewControllerDidSelectConnect:]";
      __int16 v9 = 2080;
      CFStringRef v10 = "EVOnboardingController.m";
      __int16 v11 = 1024;
      int v12 = 285;
      __int16 v13 = 2080;
      id v14 = "self.state == EVOnboardingControllerStateWelcome";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v7, 0x26u);
    }

    if (sub_100BB36BC())
    {
      id v5 = sub_1005762E4();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        id v6 = +[NSThread callStackSymbols];
        int v7 = 138412290;
        id v8 = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v7, 0xCu);
      }
    }
  }
  [(EVOnboardingController *)self _proceedToNextState];
}

- (void)privacyViewControllerDidSelectNotNow:(id)a3
{
}

- (void)privacyViewControllerDidSelectShare:(id)a3
{
}

- (void)_proceedFromPrivacyControllerWithSelectedOptIn:(BOOL)a3
{
  BOOL v3 = a3;
  if ((id)[(EVOnboardingController *)self state] != (id)2)
  {
    id v16 = sub_1005762E4();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136315906;
      int v20 = "-[EVOnboardingController _proceedFromPrivacyControllerWithSelectedOptIn:]";
      __int16 v21 = 2080;
      long long v22 = "EVOnboardingController.m";
      __int16 v23 = 1024;
      int v24 = 303;
      __int16 v25 = 2080;
      long long v26 = "self.state == EVOnboardingControllerStatePrivacy";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v19, 0x26u);
    }

    if (sub_100BB36BC())
    {
      uint64_t v17 = sub_1005762E4();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        CFStringRef v18 = +[NSThread callStackSymbols];
        int v19 = 138412290;
        int v20 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v19, 0xCu);
      }
    }
  }
  GEOConfigSetBOOL();
  if ([(NSArray *)self->_unpairedVehicles count] < 2)
  {
    char IsEnabled_EVRoutingEnhancements = MapsFeature_IsEnabled_EVRoutingEnhancements();
    CFStringRef v10 = sub_1005761B4();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (IsEnabled_EVRoutingEnhancements)
    {
      if (v11)
      {
        int v12 = @"NO";
        if (v3) {
          int v12 = @"YES";
        }
        __int16 v13 = v12;
        int v19 = 138412290;
        int v20 = (const char *)v13;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "_proceedFromPrivacyControllerWithSelectedOptIn: %@ and there was only one vehicle. Will skip vehicle selection and go straight to single vehicle onboarding.", (uint8_t *)&v19, 0xCu);
      }
      [(EVOnboardingController *)self _startSingleVehicleOnboardingWithVehicles:self->_unpairedVehicles];
    }
    else
    {
      if (v11)
      {
        id v14 = @"NO";
        if (v3) {
          id v14 = @"YES";
        }
        id v15 = v14;
        int v19 = 138412290;
        int v20 = (const char *)v15;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "_proceedFromPrivacyControllerWithSelectedOptIn: %@, and had only one vehicle, but EV2.0 was not enabled. Will only onboard the vehicle and dimiss onboarding.", (uint8_t *)&v19, 0xCu);
      }
      [(EVOnboardingController *)self _onboardVehicles:self->_unpairedVehicles];
      [(EVOnboardingController *)self _dismissOnboarding];
    }
  }
  else
  {
    id v5 = sub_1005761B4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = @"NO";
      if (v3) {
        id v6 = @"YES";
      }
      int v7 = v6;
      NSUInteger v8 = [(NSArray *)self->_unpairedVehicles count];
      int v19 = 138412546;
      int v20 = (const char *)v7;
      __int16 v21 = 2048;
      long long v22 = (const char *)v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "_proceedFromPrivacyControllerWithSelectedOptIn: %@, will continue onboarding %lu vehicles", (uint8_t *)&v19, 0x16u);
    }
    [(EVOnboardingController *)self _proceedToNextState];
  }
}

- (void)_startSingleVehicleOnboardingWithVehicles:(id)a3
{
  id v4 = a3;
  id v5 = sub_1005761B4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = v4;
    int v7 = v6;
    if (v6)
    {
      if ([v6 count])
      {
        NSUInteger v8 = [v7 componentsJoinedByString:@", "];
        __int16 v9 = +[NSString stringWithFormat:@"<%p> [%@]", v7, v8];
      }
      else
      {
        __int16 v9 = +[NSString stringWithFormat:@"<%p> (empty)", v7];
      }
    }
    else
    {
      __int16 v9 = @"<nil>";
    }

    *(_DWORD *)buf = 138412290;
    __int16 v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "_startSingleVehicleOnboardingWithVehicles: %@", buf, 0xCu);
  }
  CFStringRef v10 = (NSArray *)[v4 copy];
  vehiclesAwaitingOnboarding = self->_vehiclesAwaitingOnboarding;
  self->_vehiclesAwaitingOnboarding = v10;

  [(EVOnboardingController *)self _updateCurrentSingleVehicleOnboardingController];
  [(EVOnboardingController *)self setState:4];
}

- (void)vehicleSelectionViewController:(id)a3 didSelectContinueWithVehicles:(id)a4
{
  id v5 = a4;
  if ((id)[(EVOnboardingController *)self state] != (id)3)
  {
    __int16 v13 = sub_1005762E4();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136315906;
      int v20 = "-[EVOnboardingController vehicleSelectionViewController:didSelectContinueWithVehicles:]";
      __int16 v21 = 2080;
      long long v22 = "EVOnboardingController.m";
      __int16 v23 = 1024;
      int v24 = 334;
      __int16 v25 = 2080;
      long long v26 = "self.state == EVOnboardingControllerStateVehicleSelection";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v19, 0x26u);
    }

    if (sub_100BB36BC())
    {
      id v14 = sub_1005762E4();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v15 = +[NSThread callStackSymbols];
        int v19 = 138412290;
        int v20 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v19, 0xCu);
      }
    }
  }
  if (![v5 count])
  {
    id v16 = sub_1005762E4();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136315906;
      int v20 = "-[EVOnboardingController vehicleSelectionViewController:didSelectContinueWithVehicles:]";
      __int16 v21 = 2080;
      long long v22 = "EVOnboardingController.m";
      __int16 v23 = 1024;
      int v24 = 335;
      __int16 v25 = 2080;
      long long v26 = "vehicles.count > 0";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v19, 0x26u);
    }

    if (sub_100BB36BC())
    {
      uint64_t v17 = sub_1005762E4();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        CFStringRef v18 = +[NSThread callStackSymbols];
        int v19 = 138412290;
        int v20 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v19, 0xCu);
      }
    }
  }
  if (![v5 count])
  {
    CFStringRef v10 = sub_1005761B4();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
LABEL_15:

      [(EVOnboardingController *)self _dismissOnboarding];
      goto LABEL_16;
    }
    LOWORD(v19) = 0;
    BOOL v11 = "Didn't select any vehicles to onboard. Will dismiss onboarding.";
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v19, 2u);
    goto LABEL_15;
  }
  char IsEnabled_EVRoutingEnhancements = MapsFeature_IsEnabled_EVRoutingEnhancements();
  int v7 = sub_1005761B4();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if ((IsEnabled_EVRoutingEnhancements & 1) == 0)
  {
    if (v8)
    {
      int v12 = (const char *)[v5 count];
      int v19 = 134217984;
      int v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Selected %lu vehicles to onboard.", (uint8_t *)&v19, 0xCu);
    }

    [(EVOnboardingController *)self _onboardVehicles:v5];
    CFStringRef v10 = sub_1005761B4();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
      goto LABEL_15;
    }
    LOWORD(v19) = 0;
    BOOL v11 = "EV Enhancements not enabled. Will dismiss onboarding.";
    goto LABEL_14;
  }
  if (v8)
  {
    __int16 v9 = (const char *)[v5 count];
    int v19 = 134217984;
    int v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "EV Enhancements enabled. Will continue onboarding %lu vehicles one by one.", (uint8_t *)&v19, 0xCu);
  }

  [(EVOnboardingController *)self _startSingleVehicleOnboardingWithVehicles:v5];
LABEL_16:
}

- (void)_updateCurrentSingleVehicleOnboardingController
{
  if ([(NSArray *)self->_vehiclesAwaitingOnboarding count])
  {
    NSUInteger v3 = [(NSArray *)self->_vehiclesAwaitingOnboarding count];
    BOOL v4 = v3 == 1 && [(NSArray *)self->_onboardedVehicles count] == 0;
    BOOL v8 = [SingleVehicleOnboardingController alloc];
    __int16 v9 = [(NSArray *)self->_vehiclesAwaitingOnboarding firstObject];
    CFStringRef v10 = [(SingleVehicleOnboardingController *)v8 initWithUnpairedVehicle:v9 isLastUnpairedVehicle:v3 == 1 isSoleUnpairedVehicle:v4 navigationController:self->_navigationController delegate:self];
    [(EVOnboardingController *)self setCurrentSingleVehicleOnboardingController:v10];

    BOOL v11 = [(EVOnboardingController *)self currentSingleVehicleOnboardingController];
    int v12 = [v11 currentViewController];

    __int16 v13 = sub_1005761B4();
    id v14 = v13;
    if (v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        id v15 = [(UINavigationController *)self->_navigationController viewControllers];
        id v16 = v15;
        if (v15)
        {
          if ([v15 count])
          {
            uint64_t v17 = [v16 componentsJoinedByString:@", "];
            CFStringRef v18 = +[NSString stringWithFormat:@"<%p> [%@]", v16, v17];
          }
          else
          {
            CFStringRef v18 = +[NSString stringWithFormat:@"<%p> (empty)", v16];
          }
        }
        else
        {
          CFStringRef v18 = @"<nil>";
        }

        int v19 = v18;
        long long v26 = v12;
        id v20 = +[NSArray arrayWithObjects:&v26 count:1];
        __int16 v21 = v20;
        if (v20)
        {
          if ([v20 count])
          {
            long long v22 = [v21 componentsJoinedByString:@", "];
            __int16 v23 = +[NSString stringWithFormat:@"<%p> [%@]", v21, v22];
          }
          else
          {
            __int16 v23 = +[NSString stringWithFormat:@"<%p> (empty)", v21];
          }
        }
        else
        {
          __int16 v23 = @"<nil>";
        }

        *(_DWORD *)buf = 138412546;
        int v28 = v19;
        __int16 v29 = 2112;
        __int16 v30 = v23;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "_updateCurrentSingleVehicleOnboardingController replacing VCs: %@ with VC: %@", buf, 0x16u);
      }
      navigationController = self->_navigationController;
      __int16 v25 = v12;
      id v14 = +[NSArray arrayWithObjects:&v25 count:1];
      [(UINavigationController *)navigationController setViewControllers:v14 animated:1];
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "_updateCurrentSingleVehicleOnboardingController couldn't retrieve a vehicle onboarding VC.", buf, 2u);
    }
  }
  else
  {
    id v5 = sub_1005761B4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "_updateCurrentSingleVehicleOnboardingController. There are no vehicles awaiting onboarding, we can dismiss", buf, 2u);
    }

    if ((id)[(NSArray *)self->_onboardedVehicles count] == (id)1)
    {
      id v6 = +[VGVirtualGarageService sharedService];
      int v7 = [(NSArray *)self->_onboardedVehicles firstObject];
      [v6 virtualGarageSelectVehicle:v7];
    }
    [(EVOnboardingController *)self _dismissOnboarding];
  }
}

- (void)onboardingController:(id)a3 didFinishOnboardingVehicle:(id)a4 willProceedSettingUpLPR:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  BOOL v8 = sub_1005761B4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    __int16 v9 = @"NO";
    if (v5) {
      __int16 v9 = @"YES";
    }
    CFStringRef v10 = v9;
    BOOL v11 = [v7 displayName];
    NSUInteger v12 = [(NSArray *)self->_vehiclesAwaitingOnboarding count];
    NSUInteger v13 = [(NSArray *)self->_onboardedVehicles count];
    int v16 = 138413058;
    uint64_t v17 = v10;
    __int16 v18 = 2112;
    int v19 = v11;
    __int16 v20 = 2048;
    NSUInteger v21 = v12;
    __int16 v22 = 2048;
    NSUInteger v23 = v13;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "onboardingController didFinishOnboardingVehicle: %@ willProceedSettingUpLPR: %@. current state: _vehiclesAwaitingOnboarding: %lu, _onboardedVehicles: %lu", (uint8_t *)&v16, 0x2Au);
  }
  id v14 = +[MKMapService sharedService];
  [v14 captureUserAction:441 onTarget:660 eventValue:0];

  id v15 = +[VGVirtualGarageService sharedService];
  [v15 virtualGarageOnboardVehicle:v7];

  if (!v5) {
    [(EVOnboardingController *)self _finishConfiguringVehicle:v7];
  }
}

- (void)onboardingController:(id)a3 didFinishSettingUpLPRForVehicle:(id)a4
{
  id v5 = a4;
  id v6 = sub_1005761B4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [v5 displayName];
    NSUInteger v8 = [(NSArray *)self->_vehiclesAwaitingOnboarding count];
    NSUInteger v9 = [(NSArray *)self->_onboardedVehicles count];
    int v11 = 138412802;
    NSUInteger v12 = v7;
    __int16 v13 = 2048;
    NSUInteger v14 = v8;
    __int16 v15 = 2048;
    NSUInteger v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "onboardingController didFinishSettingUpLPRForVehicle: %@. current state: _vehiclesAwaitingOnboarding: %lu, _onboardedVehicles: %lu", (uint8_t *)&v11, 0x20u);
  }
  CFStringRef v10 = +[MKMapService sharedService];
  [v10 captureUserAction:436 onTarget:660 eventValue:0];

  [(EVOnboardingController *)self _finishConfiguringVehicle:v5];
}

- (void)_finishConfiguringVehicle:(id)a3
{
  id v4 = a3;
  vehiclesAwaitingOnboarding = self->_vehiclesAwaitingOnboarding;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100AE4068;
  v16[3] = &unk_1012F1C18;
  id v6 = v4;
  id v17 = v6;
  sub_1000AC254(vehiclesAwaitingOnboarding, v16);
  id v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  NSUInteger v8 = self->_vehiclesAwaitingOnboarding;
  self->_vehiclesAwaitingOnboarding = v7;

  if (self->_onboardedVehicles) {
    onboardedVehicles = self->_onboardedVehicles;
  }
  else {
    onboardedVehicles = (NSArray *)&__NSArray0__struct;
  }
  CFStringRef v10 = [(NSArray *)onboardedVehicles arrayByAddingObject:v6];
  int v11 = self->_onboardedVehicles;
  self->_onboardedVehicles = v10;

  NSUInteger v12 = sub_1005761B4();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    __int16 v13 = [v6 displayName];
    NSUInteger v14 = [(NSArray *)self->_vehiclesAwaitingOnboarding count];
    NSUInteger v15 = [(NSArray *)self->_onboardedVehicles count];
    *(_DWORD *)buf = 138412802;
    int v19 = v13;
    __int16 v20 = 2048;
    NSUInteger v21 = v14;
    __int16 v22 = 2048;
    NSUInteger v23 = v15;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "onboardingController _finishConfiguringVehicle: %@. state after configuring: _vehiclesAwaitingOnboarding: %lu, _onboardedVehicles: %lu", buf, 0x20u);
  }
  [(EVOnboardingController *)self _updateCurrentSingleVehicleOnboardingController];
}

- (void)virtualGarageDidUpdate:(id)a3
{
  id v4 = a3;
  if ((MapsFeature_IsEnabled_EVRoutingEnhancements() & 1) == 0 && self->_onboardedVehicleCount)
  {
    id v5 = +[MKMapService sharedService];
    id v6 = [v4 vehicles];
    id v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)[v6 count] + self->_onboardedVehicleCount - 1);
    NSUInteger v8 = [v7 stringValue];
    [v5 captureUserAction:2107 onTarget:660 eventValue:v8];

    self->_onboardedVehicleCount = 0;
    NSUInteger v9 = +[NSNotificationCenter defaultCenter];
    [v9 postNotificationName:@"EVOnboardingFinishedNotification" object:0 userInfo:0];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100AE4378;
  block[3] = &unk_1012E5D08;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setCurrentSingleVehicleOnboardingController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_strongSelf, 0);
  objc_storeStrong((id *)&self->_onboardedVehicles, 0);
  objc_storeStrong((id *)&self->_vehiclesAwaitingOnboarding, 0);
  objc_storeStrong((id *)&self->_currentSingleVehicleOnboardingController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_unpairedVehicles, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);

  objc_storeStrong((id *)&self->_viewControllersByState, 0);
}

@end