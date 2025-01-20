@interface CSDProximityController
- (BOOL)isInterfaceOrientationPortrait;
- (BOOL)isProximitySensorCovered;
- (BOOL)isProximitySensorEnabled;
- (BOOL)shouldEnableProximitySensor;
- (CSDCallCenterObserver)callCenterObserver;
- (CSDOrientationObserver)interfaceOrientationObserver;
- (CSDProximityController)initWithQueue:(id)a3 proximitySensorObserver:(id)a4 voiceOverObserver:(id)a5;
- (CSDProximityController)initWithQueue:(id)a3 routeController:(id)a4 callCenterObserver:(id)a5 interfaceOrientationObserver:(id)a6 proximitySensorObserver:(id)a7 voiceOverObserver:(id)a8;
- (CSDProximitySensorObserver)proximitySensorObserver;
- (CSDVoiceOverObserver)voiceOverObserver;
- (OS_dispatch_queue)queue;
- (TURouteController)routeController;
- (id)brailleScreenInputDeterminationHandler;
- (id)proximityChangeHandler;
- (id)voiceOverRunningDeterminationHandler;
- (id)voiceOverTouchShouldRouteToSpeakerDeterminationHandler;
- (int)proximityDetectionMode;
- (void)callCenterObserver:(id)a3 callChanged:(id)a4;
- (void)dealloc;
- (void)donateTipsSignalIfNecessary;
- (void)proximitySensorObserver:(id)a3 didChangeCovered:(BOOL)a4;
- (void)routesChangedForRouteController:(id)a3;
- (void)setBrailleScreenInputDeterminationHandler:(id)a3;
- (void)setInterfaceOrientationPortrait:(BOOL)a3;
- (void)setProximityChangeHandler:(id)a3;
- (void)setProximityDetectionMode:(int)a3;
- (void)setProximitySensorCovered:(BOOL)a3;
- (void)setProximitySensorEnabled:(BOOL)a3;
- (void)setVoiceOverRunningDeterminationHandler:(id)a3;
- (void)setVoiceOverTouchShouldRouteToSpeakerDeterminationHandler:(id)a3;
- (void)updateProximitySensorState;
- (void)updateVoiceOverRoutingForCurrentProximityState;
@end

@implementation CSDProximityController

- (CSDProximityController)initWithQueue:(id)a3 proximitySensorObserver:(id)a4 voiceOverObserver:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)FBSOrientationObserver);
  v12 = objc_alloc_init(CSDCallCenterObserver);
  v13 = +[TUCallCenter sharedInstance];
  v14 = [v13 routeController];

  v15 = [(CSDProximityController *)self initWithQueue:v10 routeController:v14 callCenterObserver:v12 interfaceOrientationObserver:v11 proximitySensorObserver:v9 voiceOverObserver:v8];
  return v15;
}

- (CSDProximityController)initWithQueue:(id)a3 routeController:(id)a4 callCenterObserver:(id)a5 interfaceOrientationObserver:(id)a6 proximitySensorObserver:(id)a7 voiceOverObserver:(id)a8
{
  id v41 = a3;
  id v40 = a4;
  id v15 = a5;
  id v39 = a6;
  id v16 = a7;
  id v17 = a8;
  v53.receiver = self;
  v53.super_class = (Class)CSDProximityController;
  v18 = [(CSDProximityController *)&v53 init];
  if (v18)
  {
    id v38 = v15;
    if (!v15)
    {
      v31 = +[NSAssertionHandler currentHandler];
      [v31 handleFailureInMethod:a2, v18, @"CSDProximityController.m", 67, @"Invalid parameter not satisfying: %@", @"callCenterObserver != nil" object file lineNumber description];
    }
    if (!v39)
    {
      v32 = +[NSAssertionHandler currentHandler];
      [v32 handleFailureInMethod:a2, v18, @"CSDProximityController.m", 68, @"Invalid parameter not satisfying: %@", @"interfaceOrientationObserver != nil" object file lineNumber description];
    }
    if (v40)
    {
      if (v16) {
        goto LABEL_8;
      }
    }
    else
    {
      v33 = +[NSAssertionHandler currentHandler];
      [v33 handleFailureInMethod:a2, v18, @"CSDProximityController.m", 69, @"Invalid parameter not satisfying: %@", @"routeController != nil" object file lineNumber description];

      if (v16) {
        goto LABEL_8;
      }
    }
    v34 = +[NSAssertionHandler currentHandler];
    [v34 handleFailureInMethod:a2, v18, @"CSDProximityController.m", 70, @"Invalid parameter not satisfying: %@", @"proximitySensorObserver != nil" object file lineNumber description];

LABEL_8:
    if (v41)
    {
      if (v17)
      {
LABEL_10:
        objc_storeStrong((id *)&v18->_queue, a3);
        objc_storeStrong((id *)&v18->_proximitySensorObserver, a7);
        [(CSDProximitySensorObserver *)v18->_proximitySensorObserver addDelegate:v18 queue:v18->_queue];
        objc_storeStrong((id *)&v18->_voiceOverObserver, a8);
        objc_storeStrong((id *)&v18->_callCenterObserver, a5);
        [(CSDCallCenterObserver *)v18->_callCenterObserver setTriggers:67108897];
        [(CSDCallCenterObserver *)v18->_callCenterObserver setDelegate:v18];
        objc_storeStrong((id *)&v18->_interfaceOrientationObserver, a6);
        objc_initWeak(&location, v18);
        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472;
        v50[2] = sub_1000229C0;
        v50[3] = &unk_100505258;
        objc_copyWeak(&v51, &location);
        v19 = objc_retainBlock(v50);
        [(CSDOrientationObserver *)v18->_interfaceOrientationObserver setHandler:v19];
        [(CSDOrientationObserver *)v18->_interfaceOrientationObserver activeInterfaceOrientationWithCompletion:v19];
        objc_storeStrong((id *)&v18->_routeController, a4);
        v20 = +[TUCallCenter sharedInstance];
        v21 = [v20 queue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100022B54;
        block[3] = &unk_100504EC0;
        v22 = v18;
        v49 = v22;
        dispatch_async(v21, block);

        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472;
        v46[2] = sub_100022B60;
        v46[3] = &unk_100505280;
        objc_copyWeak(&v47, &location);
        v23 = objc_retainBlock(v46);
        id voiceOverRunningDeterminationHandler = v22->_voiceOverRunningDeterminationHandler;
        v22->_id voiceOverRunningDeterminationHandler = v23;

        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472;
        v44[2] = sub_100022BB0;
        v44[3] = &unk_100505280;
        objc_copyWeak(&v45, &location);
        v25 = objc_retainBlock(v44);
        id voiceOverTouchShouldRouteToSpeakerDeterminationHandler = v22->_voiceOverTouchShouldRouteToSpeakerDeterminationHandler;
        v22->_id voiceOverTouchShouldRouteToSpeakerDeterminationHandler = v25;

        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472;
        v42[2] = sub_100022C00;
        v42[3] = &unk_100505280;
        objc_copyWeak(&v43, &location);
        v27 = objc_retainBlock(v42);
        id brailleScreenInputDeterminationHandler = v22->_brailleScreenInputDeterminationHandler;
        v22->_id brailleScreenInputDeterminationHandler = v27;

        id proximityChangeHandler = v22->_proximityChangeHandler;
        v22->_id proximityChangeHandler = &stru_1005052C0;

        [(CSDProximityController *)v22 updateProximitySensorState];
        objc_destroyWeak(&v43);
        objc_destroyWeak(&v45);
        objc_destroyWeak(&v47);

        objc_destroyWeak(&v51);
        objc_destroyWeak(&location);
        id v15 = v38;
        goto LABEL_11;
      }
    }
    else
    {
      v35 = +[NSAssertionHandler currentHandler];
      [v35 handleFailureInMethod:a2, v18, @"CSDProximityController.m", 71, @"Invalid parameter not satisfying: %@", @"queue != nil" object file lineNumber description];

      if (v17) {
        goto LABEL_10;
      }
    }
    v36 = +[NSAssertionHandler currentHandler];
    [v36 handleFailureInMethod:a2, v18, @"CSDProximityController.m", 72, @"Invalid parameter not satisfying: %@", @"voiceOverObserver != nil" object file lineNumber description];

    goto LABEL_10;
  }
LABEL_11:

  return v18;
}

- (void)dealloc
{
  [(CSDProximityController *)self setProximitySensorEnabled:0];
  [(CSDOrientationObserver *)self->_interfaceOrientationObserver invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CSDProximityController;
  [(CSDProximityController *)&v3 dealloc];
}

- (BOOL)isInterfaceOrientationPortrait
{
  objc_super v3 = [(CSDProximityController *)self queue];
  dispatch_assert_queue_V2(v3);

  return self->_interfaceOrientationPortrait;
}

- (void)setInterfaceOrientationPortrait:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(CSDProximityController *)self queue];
  dispatch_assert_queue_V2(v5);

  if (self->_interfaceOrientationPortrait != v3)
  {
    self->_interfaceOrientationPortrait = v3;
    [(CSDProximityController *)self updateProximitySensorState];
  }
}

- (int)proximityDetectionMode
{
  BOOL v3 = [(CSDProximityController *)self queue];
  dispatch_assert_queue_V2(v3);

  return self->_proximityDetectionMode;
}

- (void)setProximityDetectionMode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = [(CSDProximityController *)self queue];
  dispatch_assert_queue_V2(v5);

  if (self->_proximityDetectionMode != v3)
  {
    self->_proximityDetectionMode = v3;
    v6 = [(CSDProximityController *)self proximityChangeHandler];
    v6[2](v6, v3);
  }
}

- (BOOL)isProximitySensorCovered
{
  uint64_t v3 = [(CSDProximityController *)self queue];
  dispatch_assert_queue_V2(v3);

  return self->_proximitySensorCovered;
}

- (void)setProximitySensorCovered:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(CSDProximityController *)self queue];
  dispatch_assert_queue_V2(v5);

  if (self->_proximitySensorCovered != v3)
  {
    self->_proximitySensorCovered = v3;
    [(CSDProximityController *)self updateProximitySensorState];
    [(CSDProximityController *)self updateVoiceOverRoutingForCurrentProximityState];
  }
}

- (BOOL)isProximitySensorEnabled
{
  BOOL v3 = [(CSDProximityController *)self queue];
  dispatch_assert_queue_V2(v3);

  return [(CSDProximityController *)self proximityDetectionMode] == 3;
}

- (void)setProximitySensorEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(CSDProximityController *)self queue];
  dispatch_assert_queue_V2(v5);

  if (v3) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 0;
  }

  [(CSDProximityController *)self setProximityDetectionMode:v6];
}

- (BOOL)shouldEnableProximitySensor
{
  BOOL v3 = [(CSDProximityController *)self queue];
  dispatch_assert_queue_V2(v3);

  if (_TUIsInternalInstall())
  {
    v4 = +[NSUserDefaults tu_defaults];
    unsigned __int8 v5 = [v4 BOOLForKey:@"ForceDisableCallProximity"];

    if (v5) {
      return 0;
    }
  }
  if (![(CSDProximityController *)self isInterfaceOrientationPortrait]
    && ![(CSDProximityController *)self isProximitySensorCovered])
  {
    v23 = sub_100008DCC();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 67109376;
      unsigned int v27 = [(CSDProximityController *)self isProximitySensorCovered];
      __int16 v28 = 1024;
      unsigned int v29 = [(CSDProximityController *)self isInterfaceOrientationPortrait];
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Proximity detection should be disabled; isInterfaceOrientationPortrait: %d, isProximitySensorCovered: %d",
        (uint8_t *)&v26,
        0xEu);
    }

    return 0;
  }
  uint64_t v6 = [(CSDProximityController *)self callCenterObserver];
  v7 = [v6 callContainer];
  unsigned __int8 v8 = [v7 anyCallPassesTest:&stru_1005052E0];

  if (v8)
  {
    id v9 = sub_100008DCC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      id v10 = "Proximity detection should be disabled; video call exists";
LABEL_17:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v26, 2u);
    }
  }
  else
  {
    id v11 = [(CSDProximityController *)self callCenterObserver];
    v12 = [v11 callContainer];
    unsigned int v13 = [v12 anyCallPassesTest:&stru_100505300];

    if (v13)
    {
      v14 = [(CSDProximityController *)self routeController];
      id v9 = [v14 pickedRoute];

      unsigned int v15 = [v9 isReceiver];
      unsigned int v16 = [v9 isSpeaker];
      id v17 = [(CSDProximityController *)self voiceOverRunningDeterminationHandler];
      int v18 = v17[2]();

      v19 = [(CSDProximityController *)self voiceOverTouchShouldRouteToSpeakerDeterminationHandler];
      int v20 = v19[2]();

      v21 = [(CSDProximityController *)self brailleScreenInputDeterminationHandler];
      LOBYTE(v19) = v21[2]();

      if (v19) {
        int v22 = 0;
      }
      else {
        int v22 = v15 | v16 & v18 & v20;
      }
      v25 = sub_100008DCC();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = 67110144;
        unsigned int v27 = v22;
        __int16 v28 = 1024;
        unsigned int v29 = v15;
        __int16 v30 = 1024;
        unsigned int v31 = v16;
        __int16 v32 = 1024;
        int v33 = v18;
        __int16 v34 = 1024;
        int v35 = v20;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Proximity detection should be %d since isReceiver: %d, isSpeaker: %d, isVoiceOverRunning: %d, shouldAutoSelectRouteWithVoiceOver: %d", (uint8_t *)&v26, 0x20u);
      }

      goto LABEL_23;
    }
    id v9 = sub_100008DCC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      id v10 = "Proximity detection should be disabled; eligible audio call does not exist";
      goto LABEL_17;
    }
  }
  int v22 = 0;
LABEL_23:

  return v22 != 0;
}

- (void)updateProximitySensorState
{
  BOOL v3 = [(CSDProximityController *)self queue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = [(CSDProximityController *)self shouldEnableProximitySensor];

  [(CSDProximityController *)self setProximitySensorEnabled:v4];
}

- (void)updateVoiceOverRoutingForCurrentProximityState
{
  BOOL v3 = [(CSDProximityController *)self queue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = sub_100008DCC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v24[0] = 67109120;
    v24[1] = [(CSDProximityController *)self isProximitySensorCovered];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Handling proximity sensor covered changed to %d", (uint8_t *)v24, 8u);
  }

  unsigned __int8 v5 = [(CSDProximityController *)self voiceOverRunningDeterminationHandler];
  int v6 = v5[2]();

  if (v6)
  {
    v7 = [(CSDProximityController *)self callCenterObserver];
    unsigned __int8 v8 = [v7 callContainer];
    unsigned int v9 = [v8 anyCallPassesTest:&stru_100505320];

    if (v9)
    {
      id v10 = [(CSDProximityController *)self voiceOverTouchShouldRouteToSpeakerDeterminationHandler];
      int v11 = v10[2]();

      if ([(CSDProximityController *)self isProximitySensorCovered])
      {
        v12 = [(CSDProximityController *)self routeController];
        unsigned int v13 = [v12 pickedRoute];
        unsigned int v14 = [v13 isSpeaker] & v11;

        if (v14 == 1)
        {
          unsigned int v15 = sub_100008DCC();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v24[0]) = 0;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "VoiceOver is enabled and the proximity sensor is covered, changing the audio route from speaker to receiver.", (uint8_t *)v24, 2u);
          }

          unsigned int v16 = [(CSDProximityController *)self routeController];
          id v17 = [(CSDProximityController *)self routeController];
          uint64_t v18 = [v17 receiverRoute];
LABEL_15:
          v23 = (void *)v18;
          [v16 pickRoute:v18];

          return;
        }
      }
      if (![(CSDProximityController *)self isProximitySensorCovered])
      {
        v19 = [(CSDProximityController *)self routeController];
        int v20 = [v19 pickedRoute];
        unsigned int v21 = [v20 isReceiver] & v11;

        if (v21 == 1)
        {
          int v22 = sub_100008DCC();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v24[0]) = 0;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "VoiceOver is enabled and the proximity sensor is uncovered, changing the audio route from receiver to speaker.", (uint8_t *)v24, 2u);
          }

          unsigned int v16 = [(CSDProximityController *)self routeController];
          id v17 = [(CSDProximityController *)self routeController];
          uint64_t v18 = [v17 speakerRoute];
          goto LABEL_15;
        }
      }
    }
  }
}

- (void)callCenterObserver:(id)a3 callChanged:(id)a4
{
  unsigned __int8 v5 = [(CSDProximityController *)self queue];
  dispatch_assert_queue_V2(v5);

  int v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Updating proximity sensor state; calls changed.",
      v7,
      2u);
  }

  [(CSDProximityController *)self updateProximitySensorState];
}

- (void)proximitySensorObserver:(id)a3 didChangeCovered:(BOOL)a4
{
  BOOL v4 = a4;
  int v6 = [(CSDProximityController *)self queue];
  dispatch_assert_queue_V2(v6);

  v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Updating proximity sensor state; sensor covered changed.",
      v8,
      2u);
  }

  [(CSDProximityController *)self setProximitySensorCovered:v4];
  [(CSDProximityController *)self donateTipsSignalIfNecessary];
}

- (void)routesChangedForRouteController:(id)a3
{
  BOOL v4 = +[TUCallCenter sharedInstance];
  unsigned __int8 v5 = [v4 queue];
  dispatch_assert_queue_V2(v5);

  int v6 = [(CSDProximityController *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100023A64;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  dispatch_async(v6, block);
}

- (void)donateTipsSignalIfNecessary
{
  if (![(CSDProximityController *)self isProximitySensorCovered])
  {
    BOOL v3 = [(CSDProximityController *)self routeController];
    BOOL v4 = [v3 pickedRoute];
    unsigned __int8 v5 = [v4 isSpeaker];

    if ((v5 & 1) == 0)
    {
      int v6 = sub_100008DCC();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Logging TipEvent for phone away from face without speaker.", v7, 2u);
      }

      +[CSDTipsHelper donateEventTalkingWithPhoneAwayFromFace];
    }
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CSDCallCenterObserver)callCenterObserver
{
  return self->_callCenterObserver;
}

- (TURouteController)routeController
{
  return self->_routeController;
}

- (CSDOrientationObserver)interfaceOrientationObserver
{
  return self->_interfaceOrientationObserver;
}

- (CSDProximitySensorObserver)proximitySensorObserver
{
  return self->_proximitySensorObserver;
}

- (CSDVoiceOverObserver)voiceOverObserver
{
  return self->_voiceOverObserver;
}

- (id)voiceOverRunningDeterminationHandler
{
  return self->_voiceOverRunningDeterminationHandler;
}

- (void)setVoiceOverRunningDeterminationHandler:(id)a3
{
}

- (id)voiceOverTouchShouldRouteToSpeakerDeterminationHandler
{
  return self->_voiceOverTouchShouldRouteToSpeakerDeterminationHandler;
}

- (void)setVoiceOverTouchShouldRouteToSpeakerDeterminationHandler:(id)a3
{
}

- (id)brailleScreenInputDeterminationHandler
{
  return self->_brailleScreenInputDeterminationHandler;
}

- (void)setBrailleScreenInputDeterminationHandler:(id)a3
{
}

- (id)proximityChangeHandler
{
  return self->_proximityChangeHandler;
}

- (void)setProximityChangeHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_proximityChangeHandler, 0);
  objc_storeStrong(&self->_brailleScreenInputDeterminationHandler, 0);
  objc_storeStrong(&self->_voiceOverTouchShouldRouteToSpeakerDeterminationHandler, 0);
  objc_storeStrong(&self->_voiceOverRunningDeterminationHandler, 0);
  objc_storeStrong((id *)&self->_voiceOverObserver, 0);
  objc_storeStrong((id *)&self->_proximitySensorObserver, 0);
  objc_storeStrong((id *)&self->_interfaceOrientationObserver, 0);
  objc_storeStrong((id *)&self->_routeController, 0);
  objc_storeStrong((id *)&self->_callCenterObserver, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end