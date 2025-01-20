@interface ZOTWorkspace
+ (id)workspace;
+ (void)disableZoom;
+ (void)enableZoom;
+ (void)initialize;
- (AXDispatchTimer)followCursorTimer;
- (BOOL)currentlyTouchingToSpeak;
- (BOOL)followsKeyboardFocus;
- (BOOL)smoothScalingDisabled;
- (BOOL)touchToSpeakModeEnabled;
- (BOOL)zoomEnabled;
- (NSString)eventTapIdentifier;
- (NSString)springboardActionHandlerIdentifer;
- (SCRCThreadKey)threadKey;
- (ZOTWorkspace)init;
- (ZoomServices)zoomServices;
- (void)_conflictAlert:(id)a3;
- (void)_delayedHandleApplicationActivated;
- (void)_handleApplicationActivated;
- (void)_initializeZoom;
- (void)_registerForZoomConflict;
- (void)_runThread;
- (void)_setAccessibilityAnimationOffset:(id)a3;
- (void)_setCaptureEvents:(BOOL)a3;
- (void)_setZoomEnabled:(BOOL)a3;
- (void)_showAppConflictAlertIfNecessary;
- (void)_voiceOverEnabled;
- (void)_zoomConflictRegistered:(id)a3;
- (void)conflictAlertDidDismissWithButtonIndex:(int64_t)a3;
- (void)dealloc;
- (void)sendUserEventToSpringBoard;
- (void)setCurrentlyTouchingToSpeak:(BOOL)a3;
- (void)setFollowCursorTimer:(id)a3;
- (void)setFollowsKeyboardFocus:(BOOL)a3;
- (void)setSmoothScalingDisabled:(BOOL)a3;
- (void)setSpringboardActionHandlerIdentifer:(id)a3;
- (void)setTouchToSpeakModeEnabled:(BOOL)a3;
- (void)setZoomServices:(id)a3;
- (void)tripleClickAlertDidDismissWithButtonIndex:(int64_t)a3;
- (void)zoomConflictRegistered:(id)a3;
@end

@implementation ZOTWorkspace

+ (id)workspace
{
  return (id)ZOTSharedWorkspace;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    ZOTInitializeUtilities();
  }
}

- (void)_runThread
{
  AXSetThreadPriority();
  self->_runLoopEnabled = 1;
  v4 = +[NSRunLoop currentRunLoop];
  v5 = +[NSMachPort port];
  [v4 addPort:v5 forMode:NSDefaultRunLoopMode];

  do
  {
    v7 = +[NSDate distantFuture];
    [v4 runMode:NSDefaultRunLoopMode beforeDate:v7];
  }
  while (self->_runLoopEnabled);
}

+ (void)enableZoom
{
  v2 = (void *)ZOTSharedWorkspace;
  if (!ZOTSharedWorkspace)
  {
    id v3 = [objc_allocWithZone((Class)ZOTWorkspace) init];
    v4 = (void *)ZOTSharedWorkspace;
    ZOTSharedWorkspace = (uint64_t)v3;

    v2 = (void *)ZOTSharedWorkspace;
  }
  id v5 = [v2 zoomServices];
  [v5 showZoomLens];
}

+ (void)disableZoom
{
  id v2 = [(id)ZOTSharedWorkspace zoomServices];
  [v2 hideZoomLens];
}

- (ZOTWorkspace)init
{
  NSLog(@"********* ZoomTouch Starting *************", a2);
  v16.receiver = self;
  v16.super_class = (Class)ZOTWorkspace;
  id v3 = [(ZOTWorkspace *)&v16 init];
  if (v3)
  {
    v4 = (SCRCThreadKey *)[objc_alloc((Class)SCRCThreadKey) initWithObject:v3];
    threadKey = v3->_threadKey;
    v3->_threadKey = v4;

    v6 = (NSThread *)[objc_alloc((Class)NSThread) initWithTarget:v3 selector:"_runThread" object:0];
    workspaceThread = v3->_workspaceThread;
    v3->_workspaceThread = v6;

    [(NSThread *)v3->_workspaceThread setName:@"workspaceThread"];
    [(NSThread *)v3->_workspaceThread start];
    objc_storeStrong((id *)&ZOTSharedWorkspace, v3);
    [(ZOTWorkspace *)v3 performSelector:"_initializeZoom" withObject:0 afterDelay:0.0];
    [(ZOTWorkspace *)v3 setFollowsKeyboardFocus:1];
    double v8 = ZOTTimeUnset;
    *(void *)&v3->_lastEventTime = ZOTTimeUnset;
    v3->_accessibilityAnimationOffset = v8;
    v9 = +[ZoomServices sharedInstance];
    [(ZOTWorkspace *)v3 setZoomServices:v9];
    v10 = v3->_workspaceThread;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = __20__ZOTWorkspace_init__block_invoke;
    v14[3] = &unk_8340;
    v11 = v3;
    v15 = v11;
    ZOTDispatchEventThread(v10, v14);
    v12 = v11;
  }
  return v3;
}

id __20__ZOTWorkspace_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _registerForZoomConflict];
}

- (void)_registerForZoomConflict
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"zoomConflictRegistered:" name:UIAXZoomRegisterConflict object:0];
}

- (void)zoomConflictRegistered:(id)a3
{
  id v4 = a3;
  workspaceThread = self->_workspaceThread;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __39__ZOTWorkspace_zoomConflictRegistered___block_invoke;
  v7[3] = &unk_8368;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  ZOTDispatchEventThread(workspaceThread, v7);
}

id __39__ZOTWorkspace_zoomConflictRegistered___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _zoomConflictRegistered:*(void *)(a1 + 40)];
}

- (void)_conflictAlert:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_conflictAlertData, a3);
  self->_conflictAlertVisible = 1;
  id v6 = [v5 objectForKey:@"AppName"];
  objc_initWeak(&location, self);
  v7 = +[AXSpringBoardServer server];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __31__ZOTWorkspace__conflictAlert___block_invoke;
  v8[3] = &unk_8390;
  objc_copyWeak(&v9, &location);
  [v7 showAlert:2 withHandler:v8 withData:v6];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __31__ZOTWorkspace__conflictAlert___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained conflictAlertDidDismissWithButtonIndex:a2];
}

- (void)tripleClickAlertDidDismissWithButtonIndex:(int64_t)a3
{
  if (a3 == 1)
  {
    id v5 = +[NSNumber numberWithInt:4];
    id v3 = +[NSArray arrayWithObject:v5];

    _AXSSetTripleClickOptions();
    id v4 = +[ZOTConfiguration configurationManager];
    id v6 = +[NSNumber numberWithBool:1];
    [v4 setValue:v6 forKey:@"AskedAboutTripleClick"];
  }
  else
  {
    if (a3) {
      goto LABEL_6;
    }
    id v3 = +[ZOTConfiguration configurationManager];
    id v4 = +[NSNumber numberWithBool:1];
    [v3 setValue:v4 forKey:@"AskedAboutTripleClick"];
  }

LABEL_6:

  _AXSZoomTouchSetEnabled();
}

- (void)conflictAlertDidDismissWithButtonIndex:(int64_t)a3
{
  self->_conflictAlertVisible = 0;
  id v5 = self->_conflictAlertData;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    conflictAlertData = self->_conflictAlertData;
    self->_conflictAlertData = 0;

    NSLog(@"What happened to our user dictionary?");
    goto LABEL_18;
  }
  id v6 = [(NSDictionary *)v5 objectForKey:@"BundleID"];
  v7 = +[ZOTConfiguration configurationManager];
  id v8 = [v7 valueForKey:@"AppConflicts"];
  id v9 = [v8 mutableCopyWithZone:0];

  if (!v9) {
    id v9 = [objc_allocWithZone((Class)NSMutableDictionary) init];
  }
  v10 = [v9 objectForKey:v6];
  id v11 = [v10 mutableCopyWithZone:0];

  if (!v11) {
    id v11 = [objc_allocWithZone((Class)NSMutableDictionary) init];
  }
  [v9 setObject:v11 forKey:v6];
  if (a3)
  {
    if (a3 != 1)
    {
      [v11 setObject:v5 forKey:@"AskAgainData"];
      goto LABEL_13;
    }
    v12 = +[NSNumber numberWithBool:0];
    [v11 setObject:v12 forKey:@"DisableZoom"];

    [v11 removeObjectForKey:@"AskAgainData"];
  }
  else
  {
    [v11 setObject:v5 forKey:@"AskAgainData"];
  }
  v14 = +[NSDate date];
  [v11 setObject:v14 forKey:@"DateRegistered"];

LABEL_13:
  v15 = +[ZOTConfiguration configurationManager];
  [v15 setValue:v9 forKey:@"AppConflicts"];

  if (!a3)
  {
    objc_super v16 = (void *)_AXSTripleClickCopyOptions();
    if ([v16 count]
      || (+[ZOTConfiguration configurationManager],
          v17 = objc_claimAutoreleasedReturnValue(),
          [v17 valueForKey:@"AskedAboutTripleClick"],
          v18 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v19 = [v18 BOOLValue],
          v18,
          v17,
          (v19 & 1) != 0))
    {

      _AXSZoomTouchSetEnabled();
    }
    else
    {
      objc_initWeak(&location, self);
      v21 = +[AXSpringBoardServer server];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = __55__ZOTWorkspace_conflictAlertDidDismissWithButtonIndex___block_invoke;
      v22[3] = &unk_8390;
      objc_copyWeak(&v23, &location);
      [v21 showAlert:3 withHandler:v22];

      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }
  }
  v20 = self->_conflictAlertData;
  self->_conflictAlertData = 0;

LABEL_18:
}

void __55__ZOTWorkspace_conflictAlertDidDismissWithButtonIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained tripleClickAlertDidDismissWithButtonIndex:a2];
}

- (void)_zoomConflictRegistered:(id)a3
{
  id v9 = [a3 userInfo];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v9 objectForKey:@"BundleID"];
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v5 = +[ZOTConfiguration configurationManager];
        id v6 = [v5 valueForKey:@"AppConflicts"];

        v7 = [v6 objectForKey:v4];
        id v8 = [v7 objectForKey:@"DateRegistered"];

        if (!v8) {
          [(ZOTWorkspace *)self performSelectorOnMainThread:"_conflictAlert:" withObject:v9 waitUntilDone:0];
        }
      }
    }
  }

  _objc_release_x1();
}

- (void)_initializeZoom
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_appTransitionOccurred, @"com.apple.mobile.SubstantialTransition", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  id v3 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v3, 0, (CFNotificationCallback)_smoothScalingDisabledChanged, kAXSZoomTouchSmoothScalingNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)_voiceOverEnabled, kAXSVoiceOverTouchEnabledNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  if ((_touchToSpeakChanged_DidCheckAppAccessibility & 1) == 0)
  {
    _AXSAppAccessibilityOnBefore = _AXSApplicationAccessibilityEnabled() != 0;
    _touchToSpeakChanged_DidCheckAppAccessibility = 1;
  }
  if ([(id)ZOTSharedWorkspace touchToSpeakModeEnabled])
  {
    uint64_t v5 = 1;
  }
  else
  {
    if (_AXSAppAccessibilityOnBefore
      || !_AXSApplicationAccessibilityEnabled()
      || !_AXSCanDisableApplicationAccessibility())
    {
      return;
    }
    uint64_t v5 = 0;
  }

  __AXSApplicationAccessibilitySetEnabled(v5);
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  [(ZOTWorkspace *)self _setZoomEnabled:0];
  v4.receiver = self;
  v4.super_class = (Class)ZOTWorkspace;
  [(ZOTWorkspace *)&v4 dealloc];
}

- (void)_setCaptureEvents:(BOOL)a3
{
  if (a3)
  {
    if (self->_eventTapIdentifier) {
      return;
    }
    id v8 = +[AXEventTapManager sharedManager];
    id v6 = [v8 installEventTap:&__block_literal_global identifier:@"Zoom" type:0];
    eventTapIdentifier = self->_eventTapIdentifier;
    self->_eventTapIdentifier = v6;

    uint64_t v5 = (NSString *)v8;
  }
  else
  {
    objc_super v4 = +[AXEventTapManager sharedManager];
    [v4 removeEventTap:self->_eventTapIdentifier];

    uint64_t v5 = self->_eventTapIdentifier;
    self->_eventTapIdentifier = 0;
  }
}

BOOL __34__ZOTWorkspace__setCaptureEvents___block_invoke(id a1, AXEventRepresentation *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (v2 && operator|| && [(AXEventRepresentation *)v2 type] == 10)
  {
    objc_super v4 = +[ZOTWorkspace workspace];
    uint64_t v5 = [v4 followCursorTimer];

    if (!v5)
    {
      id v6 = [objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
      [v4 setFollowCursorTimer:v6];
      [v6 setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
    }
    [v4 setFollowsKeyboardFocus:1];
    v7 = [v4 followCursorTimer];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = ___accessibilityEventTapCallback_block_invoke;
    v10[3] = &unk_8340;
    id v11 = v4;
    id v8 = v4;
    [v7 afterDelay:v10 processBlock:1.0];
  }
  return 0;
}

- (void)_voiceOverEnabled
{
  if (self->_eventTapIdentifier)
  {
    int v3 = _AXSVoiceOverTouchEnabled();
    objc_super v4 = +[AXEventTapManager sharedManager];
    id v6 = v4;
    if (v3) {
      uint64_t v5 = 50;
    }
    else {
      uint64_t v5 = 30;
    }
    [v4 setEventTapPriority:self->_eventTapIdentifier priority:v5];
  }
}

- (BOOL)zoomEnabled
{
  return operator||;
}

- (void)_delayedHandleApplicationActivated
{
  id v3 = [(ZOTWorkspace *)self threadKey];
  [(ZOTWorkspace *)self performSelector:"_handleApplicationActivated" withThreadKey:v3 count:0 objects:0];
}

- (void)_setZoomEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  operator|| = a3;
  -[ZOTWorkspace _setCaptureEvents:](self, "_setCaptureEvents:");
  if (v3)
  {
    [(ZOTWorkspace *)self performSelector:"_delayedHandleApplicationActivated" withObject:0 afterDelay:0.0];
    AXPerformBlockOnMainThreadAfterDelay();
  }
  else
  {
    uint64_t v5 = +[AXSpringBoardServer server];
    id v6 = [(ZOTWorkspace *)self springboardActionHandlerIdentifer];
    [v5 removeActionHandler:v6];

    [(ZOTWorkspace *)self setSpringboardActionHandlerIdentifer:0];
  }
  [(ZOTWorkspace *)self _voiceOverEnabled];
}

void __32__ZOTWorkspace__setZoomEnabled___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v1 = +[AXSpringBoardServer server];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __32__ZOTWorkspace__setZoomEnabled___block_invoke_2;
  v4[3] = &unk_83F8;
  objc_copyWeak(&v5, &location);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = __32__ZOTWorkspace__setZoomEnabled___block_invoke_3;
  v2[3] = &unk_8420;
  objc_copyWeak(&v3, &location);
  [v1 registerSpringBoardActionHandler:v4 withIdentifierCallback:v2];

  objc_destroyWeak(&v3);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __32__ZOTWorkspace__setZoomEnabled___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((unint64_t)(a2 - 3) <= 1)
  {
    id v4 = WeakRetained;
    [WeakRetained performSelectorInBackground:"_updateDeviceOrientationOffMainThread" withObject:0];
    id WeakRetained = v4;
  }
}

void __32__ZOTWorkspace__setZoomEnabled___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setSpringboardActionHandlerIdentifer:v3];

  [WeakRetained performSelectorInBackground:"_updateDeviceOrientationOffMainThread" withObject:0];
}

- (void)sendUserEventToSpringBoard
{
}

- (void)_handleApplicationActivated
{
  char v16 = 0;
  id v3 = +[AXSpringBoardServer server];
  unsigned __int8 v4 = [v3 isScreenLockedWithPasscode:&v16];

  if (v4) {
    goto LABEL_10;
  }
  id v5 = +[ZOTSystemInterface topApplicationBundleId];
  id v6 = +[AXSpringBoardServer server];
  unsigned int v7 = [v6 isMakingEmergencyCall];

  if ([(__CFString *)v5 isEqual:@"com.apple.mobilephone"]) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {

LABEL_10:
    id v9 = @"LockScreen";
    goto LABEL_11;
  }
  if (v5) {
    id v9 = v5;
  }
  else {
    id v9 = @"SystemServer";
  }
LABEL_11:
  [(ZOTWorkspace *)self _showAppConflictAlertIfNecessary];
  v10 = (NSString *)[objc_allocWithZone((Class)NSString) initWithFormat:@"ZoomInfo.%@", v9];
  applicationKey = self->_applicationKey;
  self->_applicationKey = v10;

  BOOL isInLockScreen = self->_isInLockScreen;
  v13 = [(NSString *)self->_applicationKey stringByReplacingOccurrencesOfString:@"ZoomInfo." withString:&stru_87A8];
  unsigned int v14 = [v13 isEqualToString:@"LockScreen"];

  self->_BOOL isInLockScreen = v14;
  if (!isInLockScreen && self->_conflictAlertVisible && v14)
  {
    v15 = +[AXSpringBoardServer server];
    [v15 hideAlert];
  }
}

- (void)_showAppConflictAlertIfNecessary
{
  id v7 = [(NSString *)self->_applicationKey stringByReplacingOccurrencesOfString:@"ZoomInfo." withString:&stru_87A8];
  id v3 = +[ZOTConfiguration configurationManager];
  unsigned __int8 v4 = [v3 valueForKey:@"AppConflicts"];

  id v5 = [v4 objectForKey:v7];
  id v6 = [v5 objectForKey:@"AskAgainData"];
  if (v6) {
    [(ZOTWorkspace *)self _conflictAlert:v6];
  }
}

- (void)_setAccessibilityAnimationOffset:(id)a3
{
  [a3 doubleValue];
  self->_accessibilityAnimationOffset = v4;
}

- (BOOL)followsKeyboardFocus
{
  return self->_followsKeyboardFocus;
}

- (void)setFollowsKeyboardFocus:(BOOL)a3
{
  self->_followsKeyboardFocus = a3;
}

- (BOOL)touchToSpeakModeEnabled
{
  return self->_touchToSpeakModeEnabled;
}

- (void)setTouchToSpeakModeEnabled:(BOOL)a3
{
  self->_touchToSpeakModeEnabled = a3;
}

- (BOOL)currentlyTouchingToSpeak
{
  return self->_currentlyTouchingToSpeak;
}

- (void)setCurrentlyTouchingToSpeak:(BOOL)a3
{
  self->_currentlyTouchingToSpeak = a3;
}

- (BOOL)smoothScalingDisabled
{
  return self->_smoothScalingDisabled;
}

- (void)setSmoothScalingDisabled:(BOOL)a3
{
  self->_smoothScalingDisabled = a3;
}

- (NSString)eventTapIdentifier
{
  return self->_eventTapIdentifier;
}

- (AXDispatchTimer)followCursorTimer
{
  return self->_followCursorTimer;
}

- (void)setFollowCursorTimer:(id)a3
{
}

- (SCRCThreadKey)threadKey
{
  return self->_threadKey;
}

- (ZoomServices)zoomServices
{
  return self->_zoomServices;
}

- (void)setZoomServices:(id)a3
{
}

- (NSString)springboardActionHandlerIdentifer
{
  return self->_springboardActionHandlerIdentifer;
}

- (void)setSpringboardActionHandlerIdentifer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_springboardActionHandlerIdentifer, 0);
  objc_storeStrong((id *)&self->_zoomServices, 0);
  objc_storeStrong((id *)&self->_followCursorTimer, 0);
  objc_storeStrong((id *)&self->_threadKey, 0);
  objc_storeStrong((id *)&self->_applicationKey, 0);
  objc_storeStrong((id *)&self->_conflictAlertData, 0);
  objc_storeStrong((id *)&self->_eventTapIdentifier, 0);
  objc_storeStrong(&self->_telephonyManager, 0);
  objc_storeStrong(&self->_powerDownController, 0);
  objc_storeStrong(&self->_springBoardAwayController, 0);

  objc_storeStrong((id *)&self->_workspaceThread, 0);
}

@end