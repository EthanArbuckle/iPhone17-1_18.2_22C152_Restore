@interface SingleVehicleOnboardingController
- (BOOL)_validateStateTransitionFromState:(int64_t)a3 toState:(int64_t)a4;
- (SingleVehicleOnboardingController)initWithUnpairedVehicle:(id)a3 isLastUnpairedVehicle:(BOOL)a4 isSoleUnpairedVehicle:(BOOL)a5 navigationController:(id)a6 delegate:(id)a7;
- (UIViewController)currentViewController;
- (id)_viewControllerForState:(int64_t)a3;
- (int64_t)state;
- (void)_cleanUp;
- (void)_proceedToNextState;
- (void)didCancelConfiguringLPRForVehicle:(id)a3;
- (void)didFinishConfiguringLPRForVehicle:(id)a3;
- (void)networksOfferViewControllerDidSelectSetupLater:(id)a3;
- (void)networksOfferViewControllerDidSelectSetupNow:(id)a3;
- (void)networksSelectionViewController:(id)a3 didSelectNetworks:(id)a4 forVehicle:(id)a5;
- (void)onboardingViewControllerWillMoveFromParentViewController:(id)a3;
- (void)setState:(int64_t)a3;
- (void)vehicleAddedViewControllerDidSelectDone:(id)a3;
- (void)vehicleAddedViewControllerDidSelectNext:(id)a3;
@end

@implementation SingleVehicleOnboardingController

- (SingleVehicleOnboardingController)initWithUnpairedVehicle:(id)a3 isLastUnpairedVehicle:(BOOL)a4 isSoleUnpairedVehicle:(BOOL)a5 navigationController:(id)a6 delegate:(id)a7
{
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)SingleVehicleOnboardingController;
  v16 = [(SingleVehicleOnboardingController *)&v21 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_vehicle, a3);
    v17->_isLastUnpairedVehicle = a4;
    v17->_isSoleUnpairedVehicle = a5;
    objc_storeStrong((id *)&v17->_navigationController, a6);
    objc_storeWeak((id *)&v17->_delegate, v15);
    v17->_isLPREnabled = MapsFeature_IsEnabled_Alberta();
    v17->_state = 1;
    uint64_t v18 = objc_opt_new();
    viewControllersByState = v17->_viewControllersByState;
    v17->_viewControllersByState = (NSMutableDictionary *)v18;
  }
  return v17;
}

- (void)setState:(int64_t)a3
{
  int64_t state = self->_state;
  if (state != a3)
  {
    if ([(SingleVehicleOnboardingController *)self _validateStateTransitionFromState:state toState:a3])
    {
      v6 = sub_1005761B4();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        unint64_t v7 = self->_state;
        if (v7 >= 6)
        {
          id v15 = sub_1005762E4();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            int v29 = 136315650;
            v30 = "NSString *NSStringFromSingleVehicleOnboardingControllerState(SingleVehicleOnboardingControllerState)";
            __int16 v31 = 2080;
            v32 = "SingleVehicleOnboardingController.m";
            __int16 v33 = 1024;
            int v34 = 55;
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
          CFStringRef v8 = off_101320888[v7];
        }
        if ((unint64_t)a3 >= 6)
        {
          v23 = sub_1005762E4();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            int v29 = 136315650;
            v30 = "NSString *NSStringFromSingleVehicleOnboardingControllerState(SingleVehicleOnboardingControllerState)";
            __int16 v31 = 2080;
            v32 = "SingleVehicleOnboardingController.m";
            __int16 v33 = 1024;
            int v34 = 55;
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
          CFStringRef v18 = off_101320888[a3];
        }
        int v29 = 138412546;
        v30 = (const char *)v8;
        __int16 v31 = 2112;
        v32 = (const char *)v18;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Setting state from: %@, to: %@", (uint8_t *)&v29, 0x16u);
      }

      self->_int64_t state = a3;
    }
    else
    {
      v9 = sub_1005762E4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v29 = 136315650;
        v30 = "-[SingleVehicleOnboardingController setState:]";
        __int16 v31 = 2080;
        v32 = "SingleVehicleOnboardingController.m";
        __int16 v33 = 1024;
        int v34 = 109;
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
      v12 = sub_1005761B4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        unint64_t v13 = self->_state;
        if (v13 >= 6)
        {
          v19 = sub_1005762E4();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            int v29 = 136315650;
            v30 = "NSString *NSStringFromSingleVehicleOnboardingControllerState(SingleVehicleOnboardingControllerState)";
            __int16 v31 = 2080;
            v32 = "SingleVehicleOnboardingController.m";
            __int16 v33 = 1024;
            int v34 = 55;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v29, 0x1Cu);
          }

          if (sub_100BB36BC())
          {
            v20 = sub_1005762E4();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              objc_super v21 = +[NSThread callStackSymbols];
              int v29 = 138412290;
              v30 = v21;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v29, 0xCu);
            }
          }
          CFStringRef v14 = @"Unknown";
        }
        else
        {
          CFStringRef v14 = off_101320888[v13];
        }
        if ((unint64_t)a3 >= 6)
        {
          v26 = sub_1005762E4();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            int v29 = 136315650;
            v30 = "NSString *NSStringFromSingleVehicleOnboardingControllerState(SingleVehicleOnboardingControllerState)";
            __int16 v31 = 2080;
            v32 = "SingleVehicleOnboardingController.m";
            __int16 v33 = 1024;
            int v34 = 55;
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
          CFStringRef v22 = off_101320888[a3];
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
  BOOL result = 1;
  if (a4 != 5 && v4 != 1 && (a3 != 1 || a4 != 3)) {
    return a3 == 3 && a4 == 1;
  }
  return result;
}

- (void)_proceedToNextState
{
  unint64_t v3 = [(SingleVehicleOnboardingController *)self state];
  unint64_t v4 = v3;
  if (v3 >= 4)
  {
    v5 = sub_1005762E4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v16 = "-[SingleVehicleOnboardingController _proceedToNextState]";
      __int16 v17 = 2080;
      CFStringRef v18 = "SingleVehicleOnboardingController.m";
      __int16 v19 = 1024;
      int v20 = 143;
      __int16 v21 = 2080;
      CFStringRef v22 = "canPresentViewControllerForState";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v6 = sub_1005762E4();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        unint64_t v7 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v16 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
    CFStringRef v8 = sub_1005761B4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v9 = "RefinementsBarButtonValue";
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
        v11 = sub_1005762E4();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v16 = "NSString *NSStringFromSingleVehicleOnboardingControllerState(SingleVehicleOnboardingControllerState)";
          __int16 v17 = 2080;
          CFStringRef v18 = "SingleVehicleOnboardingController.m";
          __int16 v19 = 1024;
          int v20 = 55;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
        }

        if (sub_100BB36BC())
        {
          v12 = sub_1005762E4();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            unint64_t v13 = +[NSThread callStackSymbols];
            *(_DWORD *)buf = 138412290;
            v16 = v13;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }
        }
        CFStringRef v10 = @"Unknown";
        v9 = "RefinementsBarButtonValue";
      }
      *(_DWORD *)buf = *((void *)v9 + 277);
      v16 = (const char *)v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "Tried to proceed to next state (%@) in EV onboarding, but that was not possible.", buf, 0xCu);
    }
  }
  else
  {
    [(SingleVehicleOnboardingController *)self setState:v3 + 1];
    id v14 = [(SingleVehicleOnboardingController *)self _viewControllerForState:[(SingleVehicleOnboardingController *)self state]];
    -[UINavigationController pushViewController:animated:](self->_navigationController, "pushViewController:animated:");
  }
}

- (id)_viewControllerForState:(int64_t)a3
{
  viewControllersByState = self->_viewControllersByState;
  v6 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:");
  [(NSMutableDictionary *)viewControllersByState objectForKeyedSubscript:v6];

  switch(a3)
  {
    case 0:
    case 5:
      unint64_t v7 = sub_1005762E4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v32 = 136315906;
        __int16 v33 = "-[SingleVehicleOnboardingController _viewControllerForState:]";
        __int16 v34 = 2080;
        v35 = "SingleVehicleOnboardingController.m";
        __int16 v36 = 1024;
        int v37 = 160;
        __int16 v38 = 2080;
        v39 = "state != SingleVehicleOnboardingControllerStateNone && state != SingleVehicleOnboardingControllerStateDismissed";
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v32, 0x26u);
      }

      if (sub_100BB36BC())
      {
        CFStringRef v8 = sub_1005762E4();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v9 = +[NSThread callStackSymbols];
          int v32 = 138412290;
          __int16 v33 = v9;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v32, 0xCu);
        }
      }
      sub_1005761B4();
      CFStringRef v10 = (EVOnboardingNetworksSelectionViewController *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v10->super.super.super.super, OS_LOG_TYPE_FAULT))
      {
        if ((unint64_t)a3 >= 6)
        {
          id v15 = sub_1005762E4();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            int v32 = 136315650;
            __int16 v33 = "NSString *NSStringFromSingleVehicleOnboardingControllerState(SingleVehicleOnboardingControllerState)";
            __int16 v34 = 2080;
            v35 = "SingleVehicleOnboardingController.m";
            __int16 v36 = 1024;
            int v37 = 55;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v32, 0x1Cu);
          }

          if (sub_100BB36BC())
          {
            v16 = sub_1005762E4();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              __int16 v17 = +[NSThread callStackSymbols];
              int v32 = 138412290;
              __int16 v33 = v17;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v32, 0xCu);
            }
          }
          CFStringRef v11 = @"Unknown";
        }
        else
        {
          CFStringRef v11 = off_101320888[a3];
        }
        int v32 = 138412290;
        __int16 v33 = (const char *)v11;
        _os_log_impl((void *)&_mh_execute_header, &v10->super.super.super.super, OS_LOG_TYPE_FAULT, "Tried to get a VC for %@ state", (uint8_t *)&v32, 0xCu);
      }
      goto LABEL_32;
    case 1:
      if (self->_isSoleUnpairedVehicle)
      {
        CFStringRef v10 = 0;
      }
      else
      {
        CFStringRef v10 = [(VGVehicle *)self->_vehicle combinedDisplayName];
      }
      CFStringRef v18 = [[EVOnboardingNetworksOfferViewController alloc] initWithDelegate:self vehicleName:v10];
      __int16 v19 = self->_viewControllersByState;
      int v20 = +[NSNumber numberWithInteger:1];
      [(NSMutableDictionary *)v19 setObject:v18 forKeyedSubscript:v20];

      goto LABEL_32;
    case 2:
      CFStringRef v10 = [[EVOnboardingNetworksSelectionViewController alloc] initWithVehicle:self->_vehicle delegate:self];
      v12 = self->_viewControllersByState;
      uint64_t v13 = 2;
      goto LABEL_31;
    case 3:
      if (self->_isLPREnabled) {
        BOOL v14 = 0;
      }
      else {
        BOOL v14 = self->_isSoleUnpairedVehicle || self->_isLastUnpairedVehicle;
      }
      CFStringRef v10 = [[EVOnboardingVehicleAddedViewController alloc] initWithVehicle:self->_vehicle isLastPresentedController:v14 delegate:self];
      v12 = self->_viewControllersByState;
      uint64_t v13 = 3;
      goto LABEL_31;
    case 4:
      CFStringRef v10 = [[LPROnboardingPageViewController alloc] initWithScenario:2 vehicle:self->_vehicle delegate:self];
      v12 = self->_viewControllersByState;
      uint64_t v13 = 4;
LABEL_31:
      __int16 v21 = +[NSNumber numberWithInteger:v13];
      [(NSMutableDictionary *)v12 setObject:v10 forKeyedSubscript:v21];

LABEL_32:
      break;
    default:
      break;
  }
  CFStringRef v22 = self->_viewControllersByState;
  v23 = +[NSNumber numberWithInteger:a3];
  v24 = [(NSMutableDictionary *)v22 objectForKeyedSubscript:v23];

  if (!v24)
  {
    int v29 = sub_1005762E4();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      int v32 = 136315906;
      __int16 v33 = "-[SingleVehicleOnboardingController _viewControllerForState:]";
      __int16 v34 = 2080;
      v35 = "SingleVehicleOnboardingController.m";
      __int16 v36 = 1024;
      int v37 = 183;
      __int16 v38 = 2080;
      v39 = "_viewControllersByState[@(state)]";
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v32, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v30 = sub_1005762E4();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        __int16 v31 = +[NSThread callStackSymbols];
        int v32 = 138412290;
        __int16 v33 = v31;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v32, 0xCu);
      }
    }
  }
  v25 = self->_viewControllersByState;
  v26 = +[NSNumber numberWithInteger:a3];
  v27 = [(NSMutableDictionary *)v25 objectForKeyedSubscript:v26];

  return v27;
}

- (UIViewController)currentViewController
{
  return (UIViewController *)[(SingleVehicleOnboardingController *)self _viewControllerForState:self->_state];
}

- (void)_cleanUp
{
  unint64_t v3 = sub_1005761B4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    vehicle = self->_vehicle;
    int v8 = 138412290;
    v9 = vehicle;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "SingleVehicleOnboardingController _cleanUp with vehicle: %@", (uint8_t *)&v8, 0xCu);
  }

  [(SingleVehicleOnboardingController *)self setState:5];
  viewControllersByState = self->_viewControllersByState;
  self->_viewControllersByState = 0;

  navigationController = self->_navigationController;
  self->_navigationController = 0;

  unint64_t v7 = self->_vehicle;
  self->_vehicle = 0;
}

- (void)onboardingViewControllerWillMoveFromParentViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(SingleVehicleOnboardingController *)self _viewControllerForState:[(SingleVehicleOnboardingController *)self state]];

  if (v5 != v4)
  {
    __int16 v21 = sub_1005762E4();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v30 = "-[SingleVehicleOnboardingController onboardingViewControllerWillMoveFromParentViewController:]";
      __int16 v31 = 2080;
      int v32 = "SingleVehicleOnboardingController.m";
      __int16 v33 = 1024;
      int v34 = 206;
      __int16 v35 = 2080;
      __int16 v36 = "viewController == [self _viewControllerForState:self.state]";
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      CFStringRef v22 = sub_1005762E4();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v30 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v6 = [v4 navigationController];
  unint64_t v7 = [v6 childViewControllers];
  int v8 = [v7 lastObject];

  v9 = sub_1005761B4();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    CFStringRef v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    CFStringRef v11 = (char *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    uint64_t v13 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v30 = v11;
    __int16 v31 = 2112;
    int v32 = v13;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "onboardingViewControllerWillMoveFromParentViewController: %@ to: %@", buf, 0x16u);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  BOOL v14 = self->_viewControllersByState;
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
          -[SingleVehicleOnboardingController setState:](self, "setState:", [v19 integerValue]);
        }
      }
      id v16 = [(NSMutableDictionary *)v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v16);
  }
}

- (void)networksOfferViewControllerDidSelectSetupNow:(id)a3
{
  if ((id)[(SingleVehicleOnboardingController *)self state] != (id)1)
  {
    id v5 = sub_1005762E4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315906;
      v9 = "-[SingleVehicleOnboardingController networksOfferViewControllerDidSelectSetupNow:]";
      __int16 v10 = 2080;
      CFStringRef v11 = "SingleVehicleOnboardingController.m";
      __int16 v12 = 1024;
      int v13 = 221;
      __int16 v14 = 2080;
      id v15 = "self.state == SingleVehicleOnboardingControllerStateNetworksOffer";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v8, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v6 = sub_1005762E4();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        unint64_t v7 = +[NSThread callStackSymbols];
        int v8 = 138412290;
        v9 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v8, 0xCu);
      }
    }
  }
  id v4 = sub_1005761B4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(v8) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "networksOfferViewControllerDidSelectSetupNow:", (uint8_t *)&v8, 2u);
  }

  [(SingleVehicleOnboardingController *)self _proceedToNextState];
}

- (void)networksOfferViewControllerDidSelectSetupLater:(id)a3
{
  if ((id)[(SingleVehicleOnboardingController *)self state] != (id)1)
  {
    v6 = sub_1005762E4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315906;
      __int16 v10 = "-[SingleVehicleOnboardingController networksOfferViewControllerDidSelectSetupLater:]";
      __int16 v11 = 2080;
      __int16 v12 = "SingleVehicleOnboardingController.m";
      __int16 v13 = 1024;
      int v14 = 228;
      __int16 v15 = 2080;
      id v16 = "self.state == SingleVehicleOnboardingControllerStateNetworksOffer";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v9, 0x26u);
    }

    if (sub_100BB36BC())
    {
      unint64_t v7 = sub_1005762E4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v8 = +[NSThread callStackSymbols];
        int v9 = 138412290;
        __int16 v10 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v9, 0xCu);
      }
    }
  }
  id v4 = sub_1005761B4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(v9) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "networksOfferViewControllerDidSelectSetupLater:", (uint8_t *)&v9, 2u);
  }

  [(SingleVehicleOnboardingController *)self setState:3];
  id v5 = [(SingleVehicleOnboardingController *)self _viewControllerForState:[(SingleVehicleOnboardingController *)self state]];
  [(UINavigationController *)self->_navigationController pushViewController:v5 animated:1];
}

- (void)networksSelectionViewController:(id)a3 didSelectNetworks:(id)a4 forVehicle:(id)a5
{
  id v7 = a4;
  int v8 = (char *)a5;
  if ((id)[(SingleVehicleOnboardingController *)self state] != (id)2)
  {
    __int16 v15 = sub_1005762E4();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      __int16 v19 = "-[SingleVehicleOnboardingController networksSelectionViewController:didSelectNetworks:forVehicle:]";
      __int16 v20 = 2080;
      __int16 v21 = "SingleVehicleOnboardingController.m";
      __int16 v22 = 1024;
      int v23 = 240;
      __int16 v24 = 2080;
      long long v25 = "self.state == SingleVehicleOnboardingControllerStateNetworksSelection";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      id v16 = sub_1005762E4();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        __int16 v19 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  int v9 = sub_1005761B4();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = v7;
    __int16 v11 = v10;
    if (v10)
    {
      if ([v10 count])
      {
        __int16 v12 = [v11 componentsJoinedByString:@", "];
        __int16 v13 = +[NSString stringWithFormat:@"<%p> [%@]", v11, v12];
      }
      else
      {
        __int16 v13 = +[NSString stringWithFormat:@"<%p> (empty)", v11];
      }
    }
    else
    {
      __int16 v13 = @"<nil>";
    }

    *(_DWORD *)buf = 138412546;
    __int16 v19 = (const char *)v13;
    __int16 v20 = 2112;
    __int16 v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "networksSelectionViewController:didSelectNetworks: %@ forVehicle: %@. will call into VGService", buf, 0x16u);
  }
  id v14 = [objc_alloc((Class)NSSet) initWithArray:v7];
  [v8 setPreferredChargingNetworks:v14];

  [v8 setUsesPreferredNetworksForRouting:[v7 count] != 0];
  [(SingleVehicleOnboardingController *)self _proceedToNextState];
}

- (void)vehicleAddedViewControllerDidSelectDone:(id)a3
{
  if ((id)[(SingleVehicleOnboardingController *)self state] != (id)3)
  {
    int v8 = sub_1005762E4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315906;
      __int16 v15 = "-[SingleVehicleOnboardingController vehicleAddedViewControllerDidSelectDone:]";
      __int16 v16 = 2080;
      uint64_t v17 = "SingleVehicleOnboardingController.m";
      __int16 v18 = 1024;
      int v19 = 252;
      __int16 v20 = 2080;
      __int16 v21 = "self.state == SingleVehicleOnboardingControllerStateVehicleAdded";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v14, 0x26u);
    }

    if (sub_100BB36BC())
    {
      int v9 = sub_1005762E4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = +[NSThread callStackSymbols];
        int v14 = 138412290;
        __int16 v15 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v14, 0xCu);
      }
    }
  }
  if (self->_isLPREnabled)
  {
    __int16 v11 = sub_1005762E4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315906;
      __int16 v15 = "-[SingleVehicleOnboardingController vehicleAddedViewControllerDidSelectDone:]";
      __int16 v16 = 2080;
      uint64_t v17 = "SingleVehicleOnboardingController.m";
      __int16 v18 = 1024;
      int v19 = 253;
      __int16 v20 = 2080;
      __int16 v21 = "!_isLPREnabled";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v14, 0x26u);
    }

    if (sub_100BB36BC())
    {
      __int16 v12 = sub_1005762E4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        __int16 v13 = +[NSThread callStackSymbols];
        int v14 = 138412290;
        __int16 v15 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v14, 0xCu);
      }
    }
  }
  id v4 = sub_1005761B4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [(VGVehicle *)self->_vehicle displayName];
    int v14 = 138412290;
    __int16 v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "vehicleAddedViewControllerDidSelectDone: LPR is not enabled, will finish onboarding for vehicle: %@", (uint8_t *)&v14, 0xCu);
  }
  v6 = +[MKMapService sharedService];
  [v6 captureUserAction:41 onTarget:121 eventValue:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained onboardingController:self didFinishOnboardingVehicle:self->_vehicle willProceedSettingUpLPR:self->_isLPREnabled];

  [(SingleVehicleOnboardingController *)self _cleanUp];
}

- (void)vehicleAddedViewControllerDidSelectNext:(id)a3
{
  if ((id)[(SingleVehicleOnboardingController *)self state] != (id)3)
  {
    __int16 v12 = sub_1005762E4();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v17 = "-[SingleVehicleOnboardingController vehicleAddedViewControllerDidSelectNext:]";
      __int16 v18 = 2080;
      int v19 = "SingleVehicleOnboardingController.m";
      __int16 v20 = 1024;
      int v21 = 263;
      __int16 v22 = 2080;
      int v23 = "self.state == SingleVehicleOnboardingControllerStateVehicleAdded";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      __int16 v13 = sub_1005762E4();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v14 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        uint64_t v17 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained onboardingController:self didFinishOnboardingVehicle:self->_vehicle willProceedSettingUpLPR:self->_isLPREnabled];

  BOOL isLPREnabled = self->_isLPREnabled;
  v6 = sub_1005761B4();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (isLPREnabled)
  {
    if (v7)
    {
      int v8 = [(VGVehicle *)self->_vehicle displayName];
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "vehicleAddedViewControllerDidSelectNext: LPR is enabled, did onboarding in VGService and will continue setting up vehicle: %@", buf, 0xCu);
    }
    [(SingleVehicleOnboardingController *)self setState:4];
    int v9 = [(SingleVehicleOnboardingController *)self _viewControllerForState:4];
    navigationController = self->_navigationController;
    __int16 v15 = v9;
    __int16 v11 = +[NSArray arrayWithObjects:&v15 count:1];
    [(UINavigationController *)navigationController setViewControllers:v11 animated:1];
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "vehicleAddedViewControllerDidSelectNext: LPR is not enabled, will finish onboarding and continue with next vehicle", buf, 2u);
    }

    [(SingleVehicleOnboardingController *)self _cleanUp];
  }
}

- (void)didCancelConfiguringLPRForVehicle:(id)a3
{
  id v4 = a3;
  id v5 = sub_1005761B4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [(VGVehicle *)self->_vehicle displayName];
    int v8 = 138412290;
    int v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "didCancelConfiguringLPRForVehicle: %@", (uint8_t *)&v8, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained onboardingController:self didFinishSettingUpLPRForVehicle:v4];

  [(SingleVehicleOnboardingController *)self _cleanUp];
}

- (void)didFinishConfiguringLPRForVehicle:(id)a3
{
  id v4 = a3;
  id v5 = sub_1005761B4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [(VGVehicle *)self->_vehicle displayName];
    int v8 = 138412290;
    int v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "didFinishConfiguringLPRForVehicle: %@", (uint8_t *)&v8, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained onboardingController:self didFinishSettingUpLPRForVehicle:v4];

  [(SingleVehicleOnboardingController *)self _cleanUp];
}

- (int64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllersByState, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_vehicle, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end