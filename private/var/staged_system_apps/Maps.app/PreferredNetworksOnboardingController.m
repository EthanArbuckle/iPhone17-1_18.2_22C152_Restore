@interface PreferredNetworksOnboardingController
- (BOOL)_validateStateTransitionFromState:(int64_t)a3 toState:(int64_t)a4;
- (PreferredNetworksOnboardingController)initWithVehicle:(id)a3;
- (id)_viewControllerForState:(int64_t)a3;
- (int64_t)state;
- (void)_dismissOnboarding;
- (void)_proceedToNextState;
- (void)networksOfferViewControllerDidSelectSetupLater:(id)a3;
- (void)networksOfferViewControllerDidSelectSetupNow:(id)a3;
- (void)networksSelectionViewController:(id)a3 didSelectNetworks:(id)a4 forVehicle:(id)a5;
- (void)onboardingViewControllerWillMoveFromParentViewController:(id)a3;
- (void)presentInViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setState:(int64_t)a3;
@end

@implementation PreferredNetworksOnboardingController

- (PreferredNetworksOnboardingController)initWithVehicle:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PreferredNetworksOnboardingController;
  v6 = [(PreferredNetworksOnboardingController *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_vehicle, a3);
    uint64_t v8 = objc_opt_new();
    viewControllersByState = v7->_viewControllersByState;
    v7->_viewControllersByState = (NSMutableDictionary *)v8;
  }
  return v7;
}

- (void)onboardingViewControllerWillMoveFromParentViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(PreferredNetworksOnboardingController *)self _viewControllerForState:[(PreferredNetworksOnboardingController *)self state]];

  if (v5 != v4)
  {
    v21 = sub_1005762E4();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v30 = "-[PreferredNetworksOnboardingController onboardingViewControllerWillMoveFromParentViewController:]";
      __int16 v31 = 2080;
      v32 = "PreferredNetworksOnboardingController.m";
      __int16 v33 = 1024;
      int v34 = 73;
      __int16 v35 = 2080;
      v36 = "viewController == [self _viewControllerForState:self.state]";
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v22 = sub_1005762E4();
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
  v7 = [v6 childViewControllers];
  uint64_t v8 = [v7 lastObject];

  v9 = sub_1005761B4();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    objc_super v11 = (char *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v30 = v11;
    __int16 v31 = 2112;
    v32 = v13;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "onboardingViewControllerWillMoveFromParentViewController: %@ to: %@", buf, 0x16u);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v14 = self->_viewControllersByState;
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
        v19 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v20 = -[NSMutableDictionary objectForKeyedSubscript:](self->_viewControllersByState, "objectForKeyedSubscript:", v19, (void)v24);

        if (v20 == v8) {
          -[PreferredNetworksOnboardingController setState:](self, "setState:", [v19 integerValue]);
        }
      }
      id v16 = [(NSMutableDictionary *)v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v16);
  }
}

- (void)setState:(int64_t)a3
{
  int64_t state = self->_state;
  if (state != a3)
  {
    if ([(PreferredNetworksOnboardingController *)self _validateStateTransitionFromState:state toState:a3])
    {
      v6 = sub_1005761B4();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        unint64_t v7 = self->_state;
        if (v7 >= 4)
        {
          id v15 = sub_1005762E4();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            int v29 = 136315650;
            v30 = "NSString *NSStringFromPreferredNetworksOnboardingControllerState(PreferredNetworksOnboardingControllerState)";
            __int16 v31 = 2080;
            v32 = "PreferredNetworksOnboardingController.m";
            __int16 v33 = 1024;
            int v34 = 41;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v29, 0x1Cu);
          }

          if (sub_100BB36BC())
          {
            id v16 = sub_1005762E4();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              uint64_t v17 = +[NSThread callStackSymbols];
              int v29 = 138412290;
              v30 = v17;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v29, 0xCu);
            }
          }
          CFStringRef v8 = @"Unknown";
        }
        else
        {
          CFStringRef v8 = *(&off_1012EE670 + v7);
        }
        if ((unint64_t)a3 >= 4)
        {
          v23 = sub_1005762E4();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            int v29 = 136315650;
            v30 = "NSString *NSStringFromPreferredNetworksOnboardingControllerState(PreferredNetworksOnboardingControllerState)";
            __int16 v31 = 2080;
            v32 = "PreferredNetworksOnboardingController.m";
            __int16 v33 = 1024;
            int v34 = 41;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v29, 0x1Cu);
          }

          if (sub_100BB36BC())
          {
            long long v24 = sub_1005762E4();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              long long v25 = +[NSThread callStackSymbols];
              int v29 = 138412290;
              v30 = v25;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v29, 0xCu);
            }
          }
          CFStringRef v18 = @"Unknown";
        }
        else
        {
          CFStringRef v18 = *(&off_1012EE670 + a3);
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
        v30 = "-[PreferredNetworksOnboardingController setState:]";
        __int16 v31 = 2080;
        v32 = "PreferredNetworksOnboardingController.m";
        __int16 v33 = 1024;
        int v34 = 93;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v29, 0x1Cu);
      }

      if (sub_100BB36BC())
      {
        v10 = sub_1005762E4();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          objc_super v11 = +[NSThread callStackSymbols];
          int v29 = 138412290;
          v30 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v29, 0xCu);
        }
      }
      v12 = sub_1005761B4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        unint64_t v13 = self->_state;
        if (v13 >= 4)
        {
          v19 = sub_1005762E4();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            int v29 = 136315650;
            v30 = "NSString *NSStringFromPreferredNetworksOnboardingControllerState(PreferredNetworksOnboardingControllerState)";
            __int16 v31 = 2080;
            v32 = "PreferredNetworksOnboardingController.m";
            __int16 v33 = 1024;
            int v34 = 41;
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
          CFStringRef v14 = *(&off_1012EE670 + v13);
        }
        if ((unint64_t)a3 >= 4)
        {
          long long v26 = sub_1005762E4();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            int v29 = 136315650;
            v30 = "NSString *NSStringFromPreferredNetworksOnboardingControllerState(PreferredNetworksOnboardingControllerState)";
            __int16 v31 = 2080;
            v32 = "PreferredNetworksOnboardingController.m";
            __int16 v33 = 1024;
            int v34 = 41;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v29, 0x1Cu);
          }

          if (sub_100BB36BC())
          {
            long long v27 = sub_1005762E4();
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
          CFStringRef v22 = *(&off_1012EE670 + a3);
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
  return a4 == 3 || v4 == 1;
}

- (void)presentInViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v9 = [a3 topMostPresentedViewController];
  if (v9)
  {
    if (self->_state)
    {
      uint64_t v17 = sub_1005762E4();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v25 = 136315906;
        long long v26 = "-[PreferredNetworksOnboardingController presentInViewController:animated:completion:]";
        __int16 v27 = 2080;
        v28 = "PreferredNetworksOnboardingController.m";
        __int16 v29 = 1024;
        int v30 = 125;
        __int16 v31 = 2080;
        v32 = "_state == PreferredNetworksOnboardingControllerStateNone";
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v25, 0x26u);
      }

      if (sub_100BB36BC())
      {
        CFStringRef v18 = sub_1005762E4();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v19 = +[NSThread callStackSymbols];
          int v25 = 138412290;
          long long v26 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v25, 0xCu);
        }
      }
      if (self->_state)
      {
        v10 = sub_1005761B4();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          goto LABEL_9;
        }
        unint64_t state = self->_state;
        if (state >= 4)
        {
          CFStringRef v22 = sub_1005762E4();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            int v25 = 136315650;
            long long v26 = "NSString *NSStringFromPreferredNetworksOnboardingControllerState(PreferredNetworksOnboardingControllerState)";
            __int16 v27 = 2080;
            v28 = "PreferredNetworksOnboardingController.m";
            __int16 v29 = 1024;
            int v30 = 41;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v25, 0x1Cu);
          }

          if (sub_100BB36BC())
          {
            v23 = sub_1005762E4();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              long long v24 = +[NSThread callStackSymbols];
              int v25 = 138412290;
              long long v26 = v24;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v25, 0xCu);
            }
          }
          CFStringRef v21 = @"Unknown";
        }
        else
        {
          CFStringRef v21 = *(&off_1012EE670 + state);
        }
        int v25 = 138412290;
        long long v26 = (const char *)v21;
        CFStringRef v14 = "Tried to present networks offer onboarding VC, but state of the controller was: %@.";
        id v15 = v10;
        uint32_t v16 = 12;
        goto LABEL_8;
      }
    }
    objc_storeStrong((id *)&self->_presentingViewController, v9);
    [(PreferredNetworksOnboardingController *)self setState:1];
    v10 = [(PreferredNetworksOnboardingController *)self _viewControllerForState:self->_state];
    id v11 = [objc_alloc((Class)OBNavigationController) initWithRootViewController:v10];
    [v11 setModalPresentationStyle:2];
    objc_storeStrong((id *)&self->_navigationController, v11);
    v12 = sub_1005761B4();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v13 = [(VGVehicle *)self->_vehicle displayName];
      int v25 = 138412290;
      long long v26 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Will present preferred networks onboarding for vehicle: %@.", (uint8_t *)&v25, 0xCu);
    }
    [v9 presentViewController:v11 animated:v5 completion:v8];
  }
  else
  {
    v10 = sub_1005761B4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v25) = 0;
      CFStringRef v14 = "Tried to present on a nil presenting VC.";
      id v15 = v10;
      uint32_t v16 = 2;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v25, v16);
    }
  }
LABEL_9:
}

- (id)_viewControllerForState:(int64_t)a3
{
  viewControllersByState = self->_viewControllersByState;
  v6 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:");
  [(NSMutableDictionary *)viewControllersByState objectForKeyedSubscript:v6];

  switch(a3)
  {
    case 0:
    case 3:
      unint64_t v7 = sub_1005762E4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v28 = 136315906;
        __int16 v29 = "-[PreferredNetworksOnboardingController _viewControllerForState:]";
        __int16 v30 = 2080;
        __int16 v31 = "PreferredNetworksOnboardingController.m";
        __int16 v32 = 1024;
        int v33 = 150;
        __int16 v34 = 2080;
        __int16 v35 = "state != PreferredNetworksOnboardingControllerStateNone && state != PreferredNetworksOnboardingControllerStateDismissed";
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v28, 0x26u);
      }

      if (sub_100BB36BC())
      {
        id v8 = sub_1005762E4();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v9 = +[NSThread callStackSymbols];
          int v28 = 138412290;
          __int16 v29 = v9;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v28, 0xCu);
        }
      }
      sub_1005761B4();
      v10 = (EVOnboardingNetworksOfferViewController *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v10->super.super.super.super, OS_LOG_TYPE_FAULT))
      {
        if ((unint64_t)a3 >= 4)
        {
          id v15 = sub_1005762E4();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            int v28 = 136315650;
            __int16 v29 = "NSString *NSStringFromPreferredNetworksOnboardingControllerState(PreferredNetworksOnboardingControllerState)";
            __int16 v30 = 2080;
            __int16 v31 = "PreferredNetworksOnboardingController.m";
            __int16 v32 = 1024;
            int v33 = 41;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v28, 0x1Cu);
          }

          if (sub_100BB36BC())
          {
            uint32_t v16 = sub_1005762E4();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              uint64_t v17 = +[NSThread callStackSymbols];
              int v28 = 138412290;
              __int16 v29 = v17;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v28, 0xCu);
            }
          }
          CFStringRef v11 = @"Unknown";
        }
        else
        {
          CFStringRef v11 = *(&off_1012EE670 + a3);
        }
        int v28 = 138412290;
        __int16 v29 = (const char *)v11;
        _os_log_impl((void *)&_mh_execute_header, &v10->super.super.super.super, OS_LOG_TYPE_FAULT, "Tried to get a VC for %@ state", (uint8_t *)&v28, 0xCu);
      }
      goto LABEL_22;
    case 1:
      v10 = [[EVOnboardingNetworksOfferViewController alloc] initWithDelegate:self vehicleName:0];
      v12 = self->_viewControllersByState;
      uint64_t v13 = 1;
      goto LABEL_13;
    case 2:
      v10 = [[EVOnboardingNetworksSelectionViewController alloc] initWithVehicle:self->_vehicle delegate:self];
      v12 = self->_viewControllersByState;
      uint64_t v13 = 2;
LABEL_13:
      CFStringRef v14 = +[NSNumber numberWithInteger:v13];
      [(NSMutableDictionary *)v12 setObject:v10 forKeyedSubscript:v14];

LABEL_22:
      break;
    default:
      break;
  }
  CFStringRef v18 = self->_viewControllersByState;
  v19 = +[NSNumber numberWithInteger:a3];
  v20 = [(NSMutableDictionary *)v18 objectForKeyedSubscript:v19];

  if (!v20)
  {
    int v25 = sub_1005762E4();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      int v28 = 136315906;
      __int16 v29 = "-[PreferredNetworksOnboardingController _viewControllerForState:]";
      __int16 v30 = 2080;
      __int16 v31 = "PreferredNetworksOnboardingController.m";
      __int16 v32 = 1024;
      int v33 = 162;
      __int16 v34 = 2080;
      __int16 v35 = "_viewControllersByState[@(state)]";
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v28, 0x26u);
    }

    if (sub_100BB36BC())
    {
      long long v26 = sub_1005762E4();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        __int16 v27 = +[NSThread callStackSymbols];
        int v28 = 138412290;
        __int16 v29 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v28, 0xCu);
      }
    }
  }
  CFStringRef v21 = self->_viewControllersByState;
  CFStringRef v22 = +[NSNumber numberWithInteger:a3];
  v23 = [(NSMutableDictionary *)v21 objectForKeyedSubscript:v22];

  return v23;
}

- (void)_dismissOnboarding
{
  v3 = sub_1005761B4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v4 = self;
    if (!v4)
    {
      v9 = @"<nil>";
      goto LABEL_10;
    }
    BOOL v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      unint64_t v7 = [(PreferredNetworksOnboardingController *)v4 performSelector:"accessibilityIdentifier"];
      id v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v9;
    __int16 v14 = 2080;
    id v15 = "-[PreferredNetworksOnboardingController _dismissOnboarding]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] %s", buf, 0x16u);
  }
  presentingViewController = self->_presentingViewController;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10053FCBC;
  v11[3] = &unk_1012E5D08;
  v11[4] = self;
  [(UIViewController *)presentingViewController dismissViewControllerAnimated:1 completion:v11];
}

- (void)_proceedToNextState
{
  unint64_t v3 = [(PreferredNetworksOnboardingController *)self state];
  int64_t v4 = sub_1005761B4();
  if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_20;
  }
  BOOL v5 = self;
  if (!v5)
  {
    v10 = @"<nil>";
    goto LABEL_10;
  }
  v6 = (objc_class *)objc_opt_class();
  unint64_t v7 = NSStringFromClass(v6);
  if (objc_opt_respondsToSelector())
  {
    id v8 = [(PreferredNetworksOnboardingController *)v5 performSelector:"accessibilityIdentifier"];
    v9 = v8;
    if (v8 && ![v8 isEqualToString:v7])
    {
      v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9];

      goto LABEL_8;
    }
  }
  v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_8:

LABEL_10:
  CFStringRef v11 = v10;
  if (v3 + 1 >= 4)
  {
    uint64_t v13 = sub_1005762E4();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      int v25 = "NSString *NSStringFromPreferredNetworksOnboardingControllerState(PreferredNetworksOnboardingControllerState)";
      __int16 v26 = 2080;
      __int16 v27 = "PreferredNetworksOnboardingController.m";
      __int16 v28 = 1024;
      LODWORD(v29[0]) = 41;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
    }

    if (sub_100BB36BC())
    {
      __int16 v14 = sub_1005762E4();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v15 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        int v25 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
    CFStringRef v12 = @"Unknown";
  }
  else
  {
    CFStringRef v12 = *(&off_1012EE670 + v3 + 1);
  }
  *(_DWORD *)buf = 138543874;
  int v25 = (const char *)v11;
  __int16 v26 = 2080;
  __int16 v27 = "-[PreferredNetworksOnboardingController _proceedToNextState]";
  __int16 v28 = 2114;
  v29[0] = v12;
  _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] %s, nextState: %{public}@", buf, 0x20u);

LABEL_20:
  if (v3 >= 2)
  {
    uint64_t v17 = sub_1005762E4();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      int v25 = "-[PreferredNetworksOnboardingController _proceedToNextState]";
      __int16 v26 = 2080;
      __int16 v27 = "PreferredNetworksOnboardingController.m";
      __int16 v28 = 1024;
      LODWORD(v29[0]) = 181;
      WORD2(v29[0]) = 2080;
      *(void *)((char *)v29 + 6) = "canPresentViewControllerForState";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      CFStringRef v18 = sub_1005762E4();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        int v25 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
    uint32_t v16 = sub_1005761B4();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      if (v3 == -1)
      {
        CFStringRef v20 = @"None";
      }
      else if (v3 == 2)
      {
        CFStringRef v20 = @"Dismissed";
      }
      else
      {
        CFStringRef v21 = sub_1005762E4();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          int v25 = "NSString *NSStringFromPreferredNetworksOnboardingControllerState(PreferredNetworksOnboardingControllerState)";
          __int16 v26 = 2080;
          __int16 v27 = "PreferredNetworksOnboardingController.m";
          __int16 v28 = 1024;
          LODWORD(v29[0]) = 41;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
        }

        if (sub_100BB36BC())
        {
          CFStringRef v22 = sub_1005762E4();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            v23 = +[NSThread callStackSymbols];
            *(_DWORD *)buf = 138412290;
            int v25 = v23;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }
        }
        CFStringRef v20 = @"Unknown";
      }
      *(_DWORD *)buf = 138412290;
      int v25 = (const char *)v20;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "Tried to proceed to next state (%@) in preferred networks onboarding, but that was not possible.", buf, 0xCu);
    }
  }
  else
  {
    [(PreferredNetworksOnboardingController *)self setState:v3 + 1];
    uint32_t v16 = [(PreferredNetworksOnboardingController *)self _viewControllerForState:[(PreferredNetworksOnboardingController *)self state]];
    [(UINavigationController *)self->_navigationController pushViewController:v16 animated:1];
  }
}

- (void)networksOfferViewControllerDidSelectSetupNow:(id)a3
{
  if ((id)[(PreferredNetworksOnboardingController *)self state] != (id)1)
  {
    BOOL v5 = sub_1005762E4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315906;
      v9 = "-[PreferredNetworksOnboardingController networksOfferViewControllerDidSelectSetupNow:]";
      __int16 v10 = 2080;
      CFStringRef v11 = "PreferredNetworksOnboardingController.m";
      __int16 v12 = 1024;
      int v13 = 196;
      __int16 v14 = 2080;
      id v15 = "self.state == PreferredNetworksOnboardingControllerStateNetworksOffer";
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
  int64_t v4 = sub_1005761B4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(v8) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "networksOfferViewControllerDidSelectSetupNow:", (uint8_t *)&v8, 2u);
  }

  [(PreferredNetworksOnboardingController *)self _proceedToNextState];
}

- (void)networksOfferViewControllerDidSelectSetupLater:(id)a3
{
  if ((id)[(PreferredNetworksOnboardingController *)self state] != (id)1)
  {
    BOOL v5 = sub_1005762E4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315906;
      v9 = "-[PreferredNetworksOnboardingController networksOfferViewControllerDidSelectSetupLater:]";
      __int16 v10 = 2080;
      CFStringRef v11 = "PreferredNetworksOnboardingController.m";
      __int16 v12 = 1024;
      int v13 = 203;
      __int16 v14 = 2080;
      id v15 = "self.state == PreferredNetworksOnboardingControllerStateNetworksOffer";
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
  int64_t v4 = sub_1005761B4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(v8) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "networksOfferViewControllerDidSelectSetupLater:", (uint8_t *)&v8, 2u);
  }

  [(PreferredNetworksOnboardingController *)self _dismissOnboarding];
}

- (void)networksSelectionViewController:(id)a3 didSelectNetworks:(id)a4 forVehicle:(id)a5
{
  id v7 = a4;
  int v8 = (char *)a5;
  if ((id)[(PreferredNetworksOnboardingController *)self state] != (id)2)
  {
    __int16 v31 = sub_1005762E4();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v37 = "-[PreferredNetworksOnboardingController networksSelectionViewController:didSelectNetworks:forVehicle:]";
      __int16 v38 = 2080;
      v39 = "PreferredNetworksOnboardingController.m";
      __int16 v40 = 1024;
      LODWORD(v41[0]) = 212;
      WORD2(v41[0]) = 2080;
      *(void *)((char *)v41 + 6) = "self.state == PreferredNetworksOnboardingControllerStateNetworksSelection";
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      __int16 v32 = sub_1005762E4();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        int v33 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v37 = v33;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v9 = sub_1005761B4();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = v7;
    CFStringRef v11 = v10;
    if (v10)
    {
      if ([v10 count])
      {
        __int16 v12 = [v11 componentsJoinedByString:@", "];
        int v13 = +[NSString stringWithFormat:@"<%p> [%@]", v11, v12];
      }
      else
      {
        int v13 = +[NSString stringWithFormat:@"<%p> (empty)", v11];
      }
    }
    else
    {
      int v13 = @"<nil>";
    }

    *(_DWORD *)buf = 138412546;
    v37 = (const char *)v13;
    __int16 v38 = 2112;
    v39 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "networksSelectionViewController:didSelectNetworks: %@ forVehicle: %@. will call into VGService", buf, 0x16u);
  }
  __int16 v14 = [(VGVehicle *)self->_vehicle preferredChargingNetworks];
  id v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    id v16 = +[NSSet set];
  }
  uint64_t v17 = v16;

  CFStringRef v18 = [v17 setByAddingObjectsFromArray:v7];
  v19 = sub_1000519B4();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    __int16 v34 = v8;
    id v35 = v7;
    CFStringRef v20 = [(VGVehicle *)self->_vehicle displayName];
    id v21 = [v17 allObjects];
    CFStringRef v22 = v21;
    if (v21)
    {
      if ([v21 count])
      {
        v23 = [v22 componentsJoinedByString:@", "];
        long long v24 = +[NSString stringWithFormat:@"<%p> [%@]", v22, v23];
      }
      else
      {
        long long v24 = +[NSString stringWithFormat:@"<%p> (empty)", v22];
      }
    }
    else
    {
      long long v24 = @"<nil>";
    }

    int v25 = v24;
    id v26 = [v18 allObjects];
    __int16 v27 = v26;
    if (v26)
    {
      if ([v26 count])
      {
        __int16 v28 = [v27 componentsJoinedByString:@", "];
        __int16 v29 = +[NSString stringWithFormat:@"<%p> [%@]", v27, v28];
      }
      else
      {
        __int16 v29 = +[NSString stringWithFormat:@"<%p> (empty)", v27];
      }
    }
    else
    {
      __int16 v29 = @"<nil>";
    }

    *(_DWORD *)buf = 138412802;
    v37 = v20;
    __int16 v38 = 2112;
    v39 = (const char *)v25;
    __int16 v40 = 2112;
    v41[0] = v29;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "networksSelectionViewController will update vehicle: %@ from networks: %@ to networks: %@)", buf, 0x20u);

    int v8 = v34;
    id v7 = v35;
  }

  [(VGVehicle *)self->_vehicle setPreferredChargingNetworks:v18];
  -[VGVehicle setUsesPreferredNetworksForRouting:](self->_vehicle, "setUsesPreferredNetworksForRouting:", [v18 count] != 0);
  __int16 v30 = +[VGVirtualGarageService sharedService];
  [v30 virtualGarageSaveVehicle:self->_vehicle];

  [(PreferredNetworksOnboardingController *)self _dismissOnboarding];
}

- (int64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllersByState, 0);
  objc_storeStrong((id *)&self->_vehicle, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);

  objc_storeStrong((id *)&self->_presentingViewController, 0);
}

@end