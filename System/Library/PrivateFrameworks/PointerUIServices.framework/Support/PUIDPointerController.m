@interface PUIDPointerController
- (BOOL)_eventSourceWantsDecelerationOrRecentering:(int)a3;
- (BOOL)_performDecelerationAnimationWithPointerParentEvent:(__IOHIDEvent *)a3 previousEvent:(__IOHIDEvent *)a4;
- (BOOL)_shouldHideWhileGesturingForEventSource:(int)a3;
- (BOOL)_underlappingContentAllowedForPointerAttributes:(id)a3;
- (BOOL)_updatePointerVelocityWithPointerParentEvent:(__IOHIDEvent *)a3 previousEvent:(__IOHIDEvent *)a4;
- (BOOL)isActiveOnMainDisplay;
- (CGPoint)_pointerPositionFromPointerEvent:(__IOHIDEvent *)a3;
- (CGPoint)_transformVelocity:(CGPoint)a3 intoCoordinateSpaceForPointerClient:(id)a4;
- (PUIDDisplayContext)activeDisplayContext;
- (PUIDPointerController)initWithPointerEventStreamProvider:(id)a3 initialDisplay:(id)a4 pointerRenderingScene:(id)a5 systemPointerScene:(id)a6;
- (PUIDPointerController)initWithPointerEventStreamProvider:(id)a3 initialDisplay:(id)a4 pointerRenderingScene:(id)a5 systemPointerScene:(id)a6 displayContextFactory:(id)a7 xpcClientController:(id)a8;
- (PUIDPointerSettings)settings;
- (double)_autohideDurationForEventSource:(int)a3 isFocusedOnItem:(BOOL)a4 settings:(id)a5;
- (double)_decelerationRate;
- (id)_displayContextForPointerEventContextID:(unsigned int)a3;
- (id)_displayContextForPointerRenderingContextID:(unsigned int)a3;
- (id)_recenteringContextRelativePointerPositionForPointerClient:(id)a3;
- (id)_systemPointerClients;
- (id)overridingHoverRegionClientsForDisplayContext:(id)a3;
- (id)systemPointerInteractionContextForDisplayContext:(id)a3;
- (id)xpcClientContextController:(id)a3 createContentMatchMoveSourceForDisplay:(id)a4 client:(id)a5 error:(id *)a6;
- (id)xpcClientContextController:(id)a3 createPointerPortalSourceCollectionForDisplay:(id)a4 client:(id)a5 error:(id *)a6;
- (void)_adjustDecelerationTargetForProjectedPosition:(CGPoint)a3 liftOffPointerPosition:(CGPoint)a4 pointerVelocity:(CGPoint)a5 hitTestContext:(id)a6 locationInsideHitTestedContext:(CGPoint)a7 projectedDisplayContext:(id)a8 withLookupGenerationID:(unint64_t)a9 withCompletion:(id)a10;
- (void)_adjustDecelerationTargetForProjectedPosition:(CGPoint)a3 liftOffPointerPosition:(CGPoint)a4 pointerVelocity:(CGPoint)a5 hitTestContexts:(id)a6 locationsInsideHitTestContexts:(id)a7 projectedDisplayContext:(id)a8 withLookupGenerationID:(unint64_t)a9;
- (void)_beginPeriodicClientTransformRefreshTimer;
- (void)_cancelActiveGestureResetTimer;
- (void)_cancelAutohideTimer;
- (void)_cancelDelayedMouseRecenteringTimer;
- (void)_cancelDelayedUnhideTimer;
- (void)_cancelProvisionalPromotionTimer;
- (void)_getTransformForHoverRegion:(id)a3 completion:(id)a4;
- (void)_handleAccessibilityPointerSizePreferencesDidChange;
- (void)_handlePeriodicRefreshTimerAction;
- (void)_hidePointerForReason:(id)a3;
- (void)_hidePointerForReason:(id)a3 withOptions:(unint64_t)a4;
- (void)_invalidateEffectSourcesPassingTest:(id)a3 displayContext:(id)a4;
- (void)_invalidateHoverRegionsForAllPointerClientsExcludingPointerClient:(id)a3 hoverRegion:(id)a4;
- (void)_movePointerToDisplay:(id)a3;
- (void)_performRecenteringForActiveFocusRegion;
- (void)_refreshClientTransformWithReason:(unint64_t)a3;
- (void)_removeOverridingHoverRegionClient:(id)a3 forDisplay:(id)a4;
- (void)_requestPointerUpdate;
- (void)_resetPointerVelocity;
- (void)_restartActiveGestureResetTimer;
- (void)_restartAutohideTimer;
- (void)_restartDelayedMouseRecenteringTimer;
- (void)_setShouldPeriodicallyRefreshClientTransform:(BOOL)a3;
- (void)_startDelayedUnhideTimer;
- (void)_startProvisionalPromotionTimer;
- (void)_transformForLayer:(unint64_t)a3 inContext:(unsigned int)a4 queue:(id)a5 completion:(id)a6;
- (void)_unhidePointerForReason:(id)a3;
- (void)_updateActiveGestureMask:(__IOHIDEvent *)a3;
- (void)_updatePointerHiddenByEntitledClients;
- (void)_updatePointerHiddenStateForTouchUp:(BOOL)a3 fingerDown:(BOOL)a4 withEvent:(__IOHIDEvent *)a5 attributes:(id)a6 previousEvent:(__IOHIDEvent *)a7 previousPointerEventAttributes:(id)a8;
- (void)_updatePointerVisibleByEntitledClients;
- (void)_updatePointerWithOptions:(unint64_t)a3 updateHandlerCollection:(id)a4;
- (void)_updateServiceKeepAlive;
- (void)dealloc;
- (void)displayAttached:(id)a3 pointerRenderingScene:(id)a4 systemPointerScene:(id)a5;
- (void)displayDetached:(id)a3;
- (void)mousePointerGlobalDevicePreferencesDidChange:(id)a3;
- (void)pointerEventStreamProvider:(id)a3 didReceiveNonPointerEvent:(__IOHIDEvent *)a4;
- (void)pointerEventStreamProvider:(id)a3 didReceivePointerEvent:(__IOHIDEvent *)a4;
- (void)pointerVisibilityDidChange:(id)a3;
- (void)setActiveDisplayContext:(id)a3;
- (void)setSettings:(id)a3;
- (void)xpcClientContextController:(id)a3 autohidePointerForReason:(unint64_t)a4 forClient:(id)a5;
- (void)xpcClientContextController:(id)a3 didRemovePointerClient:(id)a4;
- (void)xpcClientContextController:(id)a3 didSetOverridesHoverRegions:(BOOL)a4 display:(id)a5 forClient:(id)a6;
- (void)xpcClientContextController:(id)a3 didSetSystemPointerInteractionContextID:(unsigned int)a4 display:(id)a5 forClient:(id)a6;
- (void)xpcClientContextController:(id)a3 didUpdateHoverRegion:(id)a4 forClient:(id)a5 transitionCompletion:(id)a6;
- (void)xpcClientContextController:(id)a3 invalidateContentMatchMoveSource:(id)a4 forClient:(id)a5;
- (void)xpcClientContextController:(id)a3 invalidatePointerPortalSourceCollection:(id)a4 forClient:(id)a5;
- (void)xpcClientContextController:(id)a3 setPointerPersistentlyHiddenForReasons:(id)a4 forClient:(id)a5;
- (void)xpcClientContextController:(id)a3 setPointerPersistentlyVisibleForReasons:(id)a4 forClient:(id)a5;
- (void)xpcClientContextController:(id)a3 setWantsServiceKeepAlive:(BOOL)a4 forClient:(id)a5;
@end

@implementation PUIDPointerController

- (PUIDPointerController)initWithPointerEventStreamProvider:(id)a3 initialDisplay:(id)a4 pointerRenderingScene:(id)a5 systemPointerScene:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = objc_alloc_init(PUIDDisplayContextFactoryImpl);
  v15 = objc_alloc_init(PUIDXPCClientController);
  v16 = [(PUIDPointerController *)self initWithPointerEventStreamProvider:v13 initialDisplay:v12 pointerRenderingScene:v11 systemPointerScene:v10 displayContextFactory:v14 xpcClientController:v15];

  return v16;
}

- (PUIDPointerController)initWithPointerEventStreamProvider:(id)a3 initialDisplay:(id)a4 pointerRenderingScene:(id)a5 systemPointerScene:(id)a6 displayContextFactory:(id)a7 xpcClientController:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v43.receiver = self;
  v43.super_class = (Class)PUIDPointerController;
  v21 = [(PUIDPointerController *)&v43 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_pointerEventStreamProvider, a3);
    [(PUIDPointerEventStreamProviding *)v22->_pointerEventStreamProvider addPointerEventStreamObserver:v22];
    objc_storeStrong((id *)&v22->_displayContextFactory, a7);
    uint64_t v23 = +[PUIDPointerDomain rootSettings];
    settings = v22->_settings;
    v22->_settings = (PUIDPointerSettings *)v23;

    objc_storeStrong((id *)&v22->_xpcClientContextController, a8);
    [(PUIDXPCClientController *)v22->_xpcClientContextController setDelegate:v22];
    uint64_t v25 = +[NSMutableDictionary dictionary];
    displayContextsByDisplay = v22->_displayContextsByDisplay;
    v22->_displayContextsByDisplay = (NSMutableDictionary *)v25;

    uint64_t v27 = +[NSMutableDictionary dictionary];
    systemPointerInteractionContextByDisplay = v22->_systemPointerInteractionContextByDisplay;
    v22->_systemPointerInteractionContextByDisplay = (NSMutableDictionary *)v27;

    uint64_t v29 = +[NSMutableDictionary dictionary];
    hoverRegionOverridingClientsByDisplay = v22->_hoverRegionOverridingClientsByDisplay;
    v22->_hoverRegionOverridingClientsByDisplay = (NSMutableDictionary *)v29;

    v31 = [[PUIDTouchHistory alloc] initWithDepth:32];
    touchHistory = v22->_touchHistory;
    v22->_touchHistory = v31;

    uint64_t v33 = +[NSMapTable strongToStrongObjectsMapTable];
    pointerClientToClientStateMap = v22->_pointerClientToClientStateMap;
    v22->_pointerClientToClientStateMap = (NSMapTable *)v33;

    [(PUIDPointerController *)v22 displayAttached:v16 pointerRenderingScene:v17 systemPointerScene:v18];
    v35 = +[BKSMousePointerService sharedInstance];
    uint64_t v36 = [v35 addPointerPreferencesObserver:v22];
    globalDevicePreferencesObservationAssertion = v22->_globalDevicePreferencesObservationAssertion;
    v22->_globalDevicePreferencesObservationAssertion = (BSInvalidatable *)v36;

    v38 = +[BKSMousePointerService sharedInstance];
    uint64_t v39 = [v38 globalDevicePreferences];
    globalDevicePreferences = v22->_globalDevicePreferences;
    v22->_globalDevicePreferences = (BKSMousePointerDevicePreferences *)v39;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v22, (CFNotificationCallback)sub_10000825C, kAXSPointerSizeMultiplierPreferenceDidChangeNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }

  return v22;
}

- (void)dealloc
{
  lastPointerEvent = self->_lastPointerEvent;
  if (lastPointerEvent) {
    CFRelease(lastPointerEvent);
  }
  [(PUIDPointerEventStreamProviding *)self->_pointerEventStreamProvider removePointerEventStreamObserver:self];
  [(BSInvalidatable *)self->_buttonDownRepositionAssertion invalidate];
  [(BSInvalidatable *)self->_globalDevicePreferencesObservationAssertion invalidate];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, kAXSPointerSizeMultiplierPreferenceDidChangeNotification, 0);
  v5.receiver = self;
  v5.super_class = (Class)PUIDPointerController;
  [(PUIDPointerController *)&v5 dealloc];
}

- (void)displayAttached:(id)a3 pointerRenderingScene:(id)a4 systemPointerScene:(id)a5
{
  id v9 = a3;
  id v26 = a4;
  id v10 = a5;
  id v11 = [(NSMutableDictionary *)self->_displayContextsByDisplay objectForKeyedSubscript:v9];

  if (v11)
  {
    uint64_t v25 = +[NSAssertionHandler currentHandler];
    [v25 handleFailureInMethod:a2, self, @"PUIDPointerController.m", 263, @"Already tracking a context for display %@, please destroy it first", v9 object file lineNumber description];
  }
  id v12 = (id *)[(PUIDDisplayContextFactory *)self->_displayContextFactory newDisplayContextForDisplay:v9 pointerRenderingScene:v26 systemPointerScene:v10];
  sub_10001191C(v12, self);
  id v13 = sub_100011874((uint64_t)v12);
  [v13 setDelegate:self];

  [(NSMutableDictionary *)self->_displayContextsByDisplay setObject:v12 forKeyedSubscript:v9];
  v14 = sub_100011904((uint64_t)v12);
  id v15 = objc_alloc_init((Class)PSMutablePointerHoverRegion);
  if (v10)
  {
    id v16 = sub_100011874((uint64_t)v12);
    id v17 = [v16 createPointerPortalSourceCollectionForClient:v14];

    [v17 setShouldBeInvalidatedIfPointerLeavesDisplay:0];
    id v18 = sub_1000118A4((uint64_t)v12);
    [v18 setSystemPointerPortalSourceCollection:v17];

    [v15 setPointerPortalSourceCollection:v17];
  }
  id v19 = +[PSPointerShape systemShape];
  [v15 setPointerShape:v19];

  PSIntensityForLuminanceAndUsage();
  objc_msgSend(v15, "setPointerVisualIntensity:");
  [v15 setShouldPointerUnderlayContent:0];
  id v20 = objc_alloc_init(_PUIDPointerControllerSystemClientState);
  [(_PUIDPointerControllerSystemClientState *)v20 setDisplay:v9];
  [(_PUIDPointerControllerSystemClientState *)v20 setActiveHoverRegion:v15];
  -[_PUIDPointerControllerClientState setTransformFromClientContextToDisplay:](v20, "setTransformFromClientContextToDisplay:", v34, sub_100011438((uint64_t)v12, (uint64_t)v34));
  [(NSMapTable *)self->_pointerClientToClientStateMap setObject:v20 forKey:v14];
  objc_initWeak(&location, self);
  objc_initWeak(&from, v14);
  v21 = sub_1000118A4((uint64_t)v12);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10000870C;
  v27[3] = &unk_100044C20;
  objc_copyWeak(&v30, &location);
  id v22 = v15;
  id v28 = v22;
  uint64_t v23 = v20;
  uint64_t v29 = v23;
  objc_copyWeak(&v31, &from);
  [v21 setLumaChangedHandlerBlock:v27];

  if (!self->_activeDisplayContext) {
    [(PUIDPointerController *)self _movePointerToDisplay:v9];
  }
  v24 = PSLogCommon();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v36 = v9;
    __int16 v37 = 2112;
    v38 = v12;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "<%{public}@> finished configuring pointer with final context: %@", buf, 0x16u);
  }

  objc_destroyWeak(&v31);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (void)displayDetached:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(NSMutableDictionary *)self->_displayContextsByDisplay objectForKeyedSubscript:v4];
  [(NSMutableDictionary *)self->_displayContextsByDisplay setObject:0 forKeyedSubscript:v4];
  activeDisplayContext = self->_activeDisplayContext;
  v7 = PSLogCommon();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (activeDisplayContext == v5)
  {
    if (v8)
    {
      int v16 = 138543362;
      id v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@> detaching display was the active display", (uint8_t *)&v16, 0xCu);
    }

    id v9 = self->_activeDisplayContext;
    self->_activeDisplayContext = 0;

    v7 = [(NSMutableDictionary *)self->_displayContextsByDisplay allKeys];
    if ([v7 count] == (id)1)
    {
      id v10 = [v7 firstObject];
      id v11 = PSLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138543362;
        id v17 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "<%{public}@> is the only one left, setting it as the new active display", (uint8_t *)&v16, 0xCu);
      }

      id v12 = [(NSMutableDictionary *)self->_displayContextsByDisplay objectForKeyedSubscript:v10];
      id v13 = self->_activeDisplayContext;
      self->_activeDisplayContext = v12;
    }
    [(PUIDPointerController *)self _restartAutohideTimer];
  }
  else if (v8)
  {
    int v16 = 138543362;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@> detaching display was NOT the active display", (uint8_t *)&v16, 0xCu);
  }

  pointerClientToClientStateMap = self->_pointerClientToClientStateMap;
  id v15 = sub_100011904((uint64_t)v5);
  [(NSMapTable *)pointerClientToClientStateMap removeObjectForKey:v15];

  [(PUIDPointerController *)self _invalidateEffectSourcesPassingTest:&stru_100044C60 displayContext:v5];
  [(PUIDDisplayContext *)v5 invalidate];
}

- (void)mousePointerGlobalDevicePreferencesDidChange:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100008AA4;
  v4[3] = &unk_100044C88;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)pointerEventStreamProvider:(id)a3 didReceivePointerEvent:(__IOHIDEvent *)a4
{
  id v6 = a3;
  lastPointerEvent = self->_lastPointerEvent;
  if (lastPointerEvent == a4) {
    goto LABEL_73;
  }
  BOOL v8 = self->_lastPointerEventPointerAttributes;
  if (a4)
  {
    if (IOHIDEventGetIntegerValue())
    {
      if (self->_lastPointerEvent) {
        BOOL v9 = IOHIDEventGetIntegerValue() != 0;
      }
      else {
        BOOL v9 = 0;
      }
      BOOL v10 = !v9;
    }
    else
    {
      BOOL v10 = 0;
    }
    self->_isButtonPressDownTransition = v10;
    if (IOHIDEventGetIntegerValue())
    {
      self->_isButtonPressUpTransition = 0;
      if (!self->_isButtonPressDownTransition) {
        goto LABEL_25;
      }
      goto LABEL_19;
    }
  }
  else
  {
    self->_isButtonPressDownTransition = 0;
  }
  if (self->_lastPointerEvent) {
    BOOL v11 = IOHIDEventGetIntegerValue() != 0;
  }
  else {
    BOOL v11 = 0;
  }
  self->_isButtonPressUpTransition = v11;
  if (!self->_isButtonPressDownTransition && !v11) {
    goto LABEL_25;
  }
  if (!a4)
  {
LABEL_24:
    lockedContext = self->_lockedContext;
    self->_lockedContext = 0;

    self->_latchingState = 2;
    [(PUIDPointerController *)self _refreshClientTransformWithReason:1];
    goto LABEL_25;
  }
LABEL_19:
  if (!IOHIDEventGetIntegerValue()) {
    goto LABEL_24;
  }
  id v12 = [(NSArray *)self->_lastPointerHitTestContexts firstObject];
  id v13 = self->_lockedContext;
  self->_lockedContext = v12;

  v14 = [(NSMapTable *)self->_pointerClientToClientStateMap objectForKey:self->_previousPointerClient];
  id v15 = [v14 activeHoverRegion];

  if (v15 && [v15 isLatching]) {
    self->_latchingState = 1;
  }

LABEL_25:
  id v17 = [(NSMapTable *)self->_pointerClientToClientStateMap objectForKey:self->_previousPointerClient];
  id v18 = [v17 activeHoverRegion];

  if (v18)
  {
    id v19 = [v18 pointerShape];
    id v20 = [v19 shapeType];

    if (v20 == (id)5) {
      [(PUIDPointerController *)self _refreshClientTransformWithReason:3];
    }
  }
  CFRetain(a4);
  self->_lastPointerEvent = a4;
  v21 = BKSHIDEventGetPointerAttributes();
  objc_storeStrong((id *)&self->_lastPointerEventPointerAttributes, v21);
  id v22 = [v21 hitTestContexts];
  lastPointerHitTestContexts = self->_lastPointerHitTestContexts;
  self->_lastPointerHitTestContexts = v22;

  v24 = [(BKSHIDEventPointerAttributes *)v8 token];
  unsigned int v25 = [v24 _identifierOfCAContext];

  id v26 = [v21 token];
  id v27 = [v26 _identifierOfCAContext];

  if (v8 && v25 != v27)
  {
    v54 = v8;
    id v28 = lastPointerEvent;
    id v29 = v6;
    id v30 = [(PUIDPointerController *)self _displayContextForPointerEventContextID:v27];
    id v31 = PSLogCommon();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      sub_100011838(v30);
      v32 = v53 = v18;
      *(_DWORD *)buf = 67109634;
      int v56 = (int)v27;
      __int16 v57 = 1024;
      unsigned int v58 = v25;
      __int16 v59 = 2114;
      v60 = v32;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Got a pointer event with contextID: 0x%x and the last event had contextID: 0x%x, moving pointer to display: %{public}@", buf, 0x18u);

      id v18 = v53;
    }

    uint64_t v33 = sub_100011838(v30);
    [(PUIDPointerController *)self _movePointerToDisplay:v33];

    id v6 = v29;
    lastPointerEvent = v28;
    BOOL v8 = v54;
  }
  uint64_t v34 = (uint64_t)objc_msgSend(v21, "fingerDownCount", v53);
  uint64_t v35 = v34;
  BOOL v36 = v34 > 0;
  if (self->_isFingerDown == v36)
  {
    BOOL v37 = 0;
  }
  else
  {
    BOOL v37 = v34 < 1;
    self->_isFingerDown = v36;
  }
  [(PUIDPointerController *)self _updateActiveGestureMask:a4];
  if ([(PUIDPointerController *)self _eventSourceWantsDecelerationOrRecentering:sub_1000090E0((uint64_t)a4, v21)])
  {
    if (lastPointerEvent) {
      id v38 = [(BKSHIDEventPointerAttributes *)v8 fingerDownCount];
    }
    else {
      id v38 = 0;
    }
    if (v35 <= (uint64_t)v38)
    {
      if (v35 < (uint64_t)v38)
      {
        unsigned __int8 v40 = [(PUIDPointerController *)self _performDecelerationAnimationWithPointerParentEvent:a4 previousEvent:lastPointerEvent];
        if (!v35
          && (v40 & 1) == 0
          && [(PUIDPointerSettings *)self->_settings shouldRecenterAfterLiftingFinger])
        {
          [(PUIDPointerController *)self _performRecenteringForActiveFocusRegion];
        }
      }
      else
      {
        [(PUIDPointerController *)self _updatePointerVelocityWithPointerParentEvent:a4 previousEvent:lastPointerEvent];
      }
    }
    else
    {
      [(PUIDPointerController *)self _resetPointerVelocity];
    }
LABEL_51:
    [(PUIDPointerController *)self _cancelDelayedMouseRecenteringTimer];
    if (v8) {
      goto LABEL_52;
    }
LABEL_41:
    unsigned int v39 = 0;
    goto LABEL_53;
  }
  if (![(PUIDPointerController *)self _updatePointerVelocityWithPointerParentEvent:a4 previousEvent:lastPointerEvent])goto LABEL_51; {
  [(PUIDPointerController *)self _restartDelayedMouseRecenteringTimer];
  }
  if (!v8) {
    goto LABEL_41;
  }
LABEL_52:
  unsigned int v39 = ([(BKSHIDEventPointerAttributes *)v8 options] >> 11) & 1;
LABEL_53:
  unsigned __int16 v41 = (unsigned __int16)[v21 options];
  if ((v41 & 0x800) != 0 || v39)
  {
    if (!v8 || (v41 & 0x800) != 0)
    {
      if ((v39 & 1) == 0) {
        [(PUIDPointerController *)self _hidePointerForReason:@"teleporting" withOptions:4];
      }
    }
    else
    {
      [(PUIDPointerController *)self _unhidePointerForReason:@"teleporting ended"];
    }
  }
  else
  {
    [(PUIDPointerController *)self _updatePointerHiddenStateForTouchUp:v37 fingerDown:self->_isFingerDown withEvent:a4 attributes:v21 previousEvent:lastPointerEvent previousPointerEventAttributes:v8];
  }
  touchHistory = self->_touchHistory;
  [(PUIDPointerSettings *)self->_settings durationToAverageVelocityForClientInteractionThreshold];
  -[PUIDTouchHistory averageTouchVelocityOverTimeDuration:](touchHistory, "averageTouchVelocityOverTimeDuration:");
  UIPointAlongLine();
  UIDistanceBetweenPoints();
  double v44 = v43;
  [(PUIDPointerSettings *)self->_settings velocityThresholdForClientInteraction];
  BOOL v46 = v44 > v45;
  if (self->_hasPointerVelocityCrossedHighThreshold != v46)
  {
    self->_hasPointerVelocityCrossedHighThreshold = v46;
    if (v44 <= v45)
    {
      highVelocityAllowedPointerClient = self->_highVelocityAllowedPointerClient;
      self->_highVelocityAllowedPointerClient = 0;

      highVelocityAllowedHoverRegion = self->_highVelocityAllowedHoverRegion;
      self->_highVelocityAllowedHoverRegion = 0;
    }
    else
    {
      if (self->_previousPointerClient)
      {
        v47 = [(PUIDPointerController *)self _systemPointerClients];
        unsigned __int8 v48 = [v47 containsObject:self->_previousPointerClient];

        if ((v48 & 1) == 0)
        {
          v49 = [(NSMapTable *)self->_pointerClientToClientStateMap objectForKey:self->_previousPointerClient];
          v50 = [v49 activeHoverRegion];
          if (v50)
          {
            objc_storeStrong((id *)&self->_highVelocityAllowedPointerClient, self->_previousPointerClient);
            objc_storeStrong((id *)&self->_highVelocityAllowedHoverRegion, v50);
          }
        }
      }
      [(PUIDPointerController *)self _invalidateHoverRegionsForAllPointerClientsExcludingPointerClient:self->_highVelocityAllowedPointerClient hoverRegion:self->_highVelocityAllowedHoverRegion];
    }
  }
  -[PUIDPointerController _updatePointerWithOptions:updateHandlerCollection:](self, "_updatePointerWithOptions:updateHandlerCollection:", ([v21 options] >> 4) & 1, 0);
  if (lastPointerEvent) {
    CFRelease(lastPointerEvent);
  }

LABEL_73:
}

- (void)_updateActiveGestureMask:(__IOHIDEvent *)a3
{
  CFArrayRef Children = (const __CFArray *)IOHIDEventGetChildren();
  if (Children)
  {
    CFArrayRef v5 = Children;
    CFIndex Count = CFArrayGetCount(Children);
    if (Count >= 1)
    {
      CFIndex v7 = Count;
      for (CFIndex i = 0; i != v7; ++i)
      {
        CFArrayGetValueAtIndex(v5, i);
        int Type = IOHIDEventGetType();
        if ((Type & 0xFFFFFFFC) == 4)
        {
          char v10 = Type;
          int Phase = IOHIDEventGetPhase();
          uint64_t v12 = 1 << v10;
          if ((Phase - 1) > 1) {
            unint64_t v13 = self->_activeGestureMask & ~v12;
          }
          else {
            unint64_t v13 = self->_activeGestureMask | v12;
          }
          self->_activeGestureMask = v13;
        }
      }
    }
  }
}

- (BOOL)_eventSourceWantsDecelerationOrRecentering:(int)a3
{
  return a3 == 12;
}

- (void)pointerEventStreamProvider:(id)a3 didReceiveNonPointerEvent:(__IOHIDEvent *)a4
{
  if (self->_pointerIsAutohidden && !self->_delayedPointerUnhideTimer) {
    return;
  }
  if (IOHIDEventGetType() == 11)
  {
    if ([(BKSHIDEventPointerAttributes *)self->_lastPointerEventPointerAttributes fingerDownCount])
    {
      if (!self->_loggedTouchingDigitizerAndTrackpad)
      {
        CFArrayRef v5 = PSLogAutohide();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)CFIndex v7 = 0;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Screen digitizer event with finger down - not hiding pointer (logged once)", v7, 2u);
        }

        self->_loggedTouchingDigitizerAndTrackpad = 1;
      }
      return;
    }
    CFStringRef v6 = @"screen digitizer event";
  }
  else
  {
    CFStringRef v6 = @"non-pointer event";
  }
  [(PUIDPointerController *)self _hidePointerForReason:v6];
}

- (void)_restartDelayedMouseRecenteringTimer
{
  [(PUIDPointerController *)self _cancelDelayedMouseRecenteringTimer];
  [(PUIDPointerSettings *)self->_settings delayBeforeRecenteringAfterMouseMovement];
  double v4 = v3;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000093DC;
  v7[3] = &unk_100044CB0;
  objc_copyWeak(&v8, &location);
  CFArrayRef v5 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v7 block:v4];
  delayedMouseRecenteringTimer = self->_delayedMouseRecenteringTimer;
  self->_delayedMouseRecenteringTimer = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_cancelDelayedMouseRecenteringTimer
{
  [(NSTimer *)self->_delayedMouseRecenteringTimer invalidate];
  delayedMouseRecenteringTimer = self->_delayedMouseRecenteringTimer;
  self->_delayedMouseRecenteringTimer = 0;
}

- (void)_performRecenteringForActiveFocusRegion
{
  if (self->_lastPointerEvent && self->_previousPointerClient && !IOHIDEventGetIntegerValue())
  {
    double v3 = [(PUIDPointerController *)self _recenteringContextRelativePointerPositionForPointerClient:self->_previousPointerClient];
    if (v3)
    {
      unsigned int v4 = sub_1000090E0((uint64_t)self->_lastPointerEvent, self->_lastPointerEventPointerAttributes);
      settings = self->_settings;
      if (v4 == 11) {
        [(PUIDPointerSettings *)settings mouseRecenteringAnimationSettings];
      }
      else {
      CFStringRef v6 = [(PUIDPointerSettings *)settings recenteringAnimationSettings];
      }
      LODWORD(v7) = [(PUIDPointerClient *)self->_previousPointerClient pid];
      id v8 = sub_100011504((id *)&self->_activeDisplayContext->super.isa);
      unsigned int v9 = [v8 pid];

      if (v7 == v9) {
        uint64_t v7 = 0xFFFFFFFFLL;
      }
      else {
        uint64_t v7 = v7;
      }
      char v10 = PSLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        unsigned int v11 = [v3 contextID];
        [v3 point];
        uint64_t v12 = BSStringFromCGPoint();
        previousPointerClient = self->_previousPointerClient;
        v18[0] = 67109890;
        v18[1] = v11;
        __int16 v19 = 2114;
        id v20 = v12;
        __int16 v21 = 2112;
        id v22 = previousPointerClient;
        __int16 v23 = 1024;
        int v24 = v7;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Recentering target: contextID: 0x%x - %{public}@ previousPointerClient: %@ restrictingToPID: %d", (uint8_t *)v18, 0x22u);
      }
      v14 = +[BKSMousePointerService sharedInstance];
      id v15 = sub_100011838((id *)&self->_activeDisplayContext->super.isa);
      int v16 = [v15 hardwareIdentifier];
      id v17 = [v6 BSAnimationSettings];
      [v14 setContextRelativePointerPosition:v3 onDisplay:v16 withAnimationParameters:v17 restrictingToPID:v7];
    }
  }
}

- (BOOL)_performDecelerationAnimationWithPointerParentEvent:(__IOHIDEvent *)a3 previousEvent:(__IOHIDEvent *)a4
{
  if ([(PUIDPointerSettings *)self->_settings isDecelerationEnabled]) {
    BOOL v7 = _AXSPointerInertiaEnabled() != 0;
  }
  else {
    BOOL v7 = 0;
  }
  double x = self->_pointerVelocity.x;
  double y = self->_pointerVelocity.y;
  [(PUIDPointerSettings *)self->_settings minimumVelocityThresholdForDeceleration];
  if (!v7 || y * y + x * x <= v10 * v10) {
    return 0;
  }
  [(PUIDPointerController *)self _pointerPositionFromPointerEvent:a3];
  double v12 = v11;
  double v14 = v13;
  id v15 = sub_100011418((id *)&self->_activeDisplayContext->super.isa);
  int v16 = sub_100011838((id *)&self->_activeDisplayContext->super.isa);
  id v17 = [v16 hardwareIdentifier];

  if (a4)
  {
    uint64_t TimeStamp = IOHIDEventGetTimeStamp();
    if (TimeStamp != IOHIDEventGetTimeStamp())
    {
      BSMonotonicReferencedTimeFromMachTime();
      double v20 = v19;
      BSMonotonicReferencedTimeFromMachTime();
      double v22 = v20 - v21;
      double v12 = v12 + v22 * x;
      double v14 = v14 + v22 * y;
      id v23 = objc_msgSend(objc_alloc((Class)BKSContextRelativePoint), "initWithPoint:contextID:", v15, v12, v14);
      int v24 = +[BKSMousePointerService sharedInstance];
      [v24 setContextRelativePointerPosition:v23 onDisplay:v17 withAnimationParameters:0 restrictingToPID:0xFFFFFFFFLL];
    }
  }
  [(PUIDPointerController *)self _decelerationRate];
  double v26 = v25;
  double v27 = v14 + y / 1000.0 * v25 / (1.0 - v25);
  id v28 = objc_msgSend(objc_alloc((Class)BKSContextRelativePoint), "initWithPoint:contextID:", v15, v12 + x / 1000.0 * v26 / (1.0 - v26), v27);
  id v29 = objc_msgSend(objc_alloc((Class)BKSContextRelativePoint), "initWithPoint:contextID:", v15, x, y);
  id v30 = +[BKSMousePointerService sharedInstance];
  [v30 setContextRelativePointerPosition:v28 withInitialVelocity:v29 onDisplay:v17 withDecelerationRate:0xFFFFFFFFLL restrictingToPID:v26];

  if ([(PUIDPointerSettings *)self->_settings isDecelerationTargetLookupEnabled])
  {
    unint64_t v31 = self->_decelerationLookupGenerationID + 1;
    self->_decelerationLookupGenerationID = v31;
    v32 = sub_100011504((id *)&self->_activeDisplayContext->super.isa);
    if (v32)
    {
      uint64_t v33 = +[NSSet setWithObject:v32];
    }
    else
    {
      uint64_t v33 = 0;
    }
    uint64_t v35 = +[BKSMousePointerService sharedInstance];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_1000099A0;
    v36[3] = &unk_100044CD8;
    v36[4] = self;
    *(double *)&v36[5] = v12 + x / 1000.0 * v26 / (1.0 - v26);
    *(double *)&v36[6] = v27;
    *(double *)&v36[7] = v12;
    *(double *)&v36[8] = v14;
    *(double *)&v36[9] = x;
    *(double *)&v36[10] = y;
    v36[11] = v31;
    [v35 getHitTestContextsAtPoint:v28 withAdditionalContexts:v33 onDisplay:v17 withCompletion:v36];
  }
  return 1;
}

- (void)_adjustDecelerationTargetForProjectedPosition:(CGPoint)a3 liftOffPointerPosition:(CGPoint)a4 pointerVelocity:(CGPoint)a5 hitTestContexts:(id)a6 locationsInsideHitTestContexts:(id)a7 projectedDisplayContext:(id)a8 withLookupGenerationID:(unint64_t)a9
{
  double y = a5.y;
  double x = a5.x;
  double v14 = a4.y;
  double v15 = a4.x;
  double v16 = a3.y;
  double v17 = a3.x;
  id v19 = a6;
  id v20 = a7;
  double v21 = (id *)a8;
  double v22 = v21;
  if (!self->_isFingerDown && self->_decelerationLookupGenerationID == a9)
  {
    id v23 = sub_100011504(v21);
    if (v23 && [v19 containsObject:v23])
    {
      int v24 = objc_msgSend(v20, "objectAtIndex:", objc_msgSend(v19, "indexOfObject:", v23));
      id v25 = [v19 mutableCopy];
      [v25 removeObject:v23];
      id v26 = [v20 mutableCopy];
      [v26 removeObject:v24];
      [v24 CGPointValue];
      double v28 = v27;
      double v30 = v29;
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_100009C48;
      v37[3] = &unk_100044D00;
      double v41 = v17;
      double v42 = v16;
      double v43 = v15;
      double v44 = v14;
      double v45 = x;
      double v46 = y;
      v37[4] = self;
      id v38 = v25;
      id v39 = v20;
      unsigned __int8 v40 = v22;
      unint64_t v47 = a9;
      id v31 = v25;
      -[PUIDPointerController _adjustDecelerationTargetForProjectedPosition:liftOffPointerPosition:pointerVelocity:hitTestContext:locationInsideHitTestedContext:projectedDisplayContext:withLookupGenerationID:withCompletion:](self, "_adjustDecelerationTargetForProjectedPosition:liftOffPointerPosition:pointerVelocity:hitTestContext:locationInsideHitTestedContext:projectedDisplayContext:withLookupGenerationID:withCompletion:", v23, v40, a9, v37, v17, v16, v15, v14, x, y, v28, v30);
    }
    else
    {
      int v24 = [v19 firstObject];
      v32 = [v20 firstObject];
      [v32 CGPointValue];
      double v34 = v33;
      double v36 = v35;

      -[PUIDPointerController _adjustDecelerationTargetForProjectedPosition:liftOffPointerPosition:pointerVelocity:hitTestContext:locationInsideHitTestedContext:projectedDisplayContext:withLookupGenerationID:withCompletion:](self, "_adjustDecelerationTargetForProjectedPosition:liftOffPointerPosition:pointerVelocity:hitTestContext:locationInsideHitTestedContext:projectedDisplayContext:withLookupGenerationID:withCompletion:", v24, v22, a9, 0, v17, v16, v15, v14, x, y, v34, v36);
    }
  }
}

- (void)_adjustDecelerationTargetForProjectedPosition:(CGPoint)a3 liftOffPointerPosition:(CGPoint)a4 pointerVelocity:(CGPoint)a5 hitTestContext:(id)a6 locationInsideHitTestedContext:(CGPoint)a7 projectedDisplayContext:(id)a8 withLookupGenerationID:(unint64_t)a9 withCompletion:(id)a10
{
  double y = a7.y;
  double x = a7.x;
  double v15 = a5.y;
  double v16 = a5.x;
  id v18 = a6;
  id v19 = (id *)a8;
  id v20 = a10;
  double v21 = (void (**)(void, void))v20;
  if (self->_isFingerDown || self->_decelerationLookupGenerationID != a9)
  {
    if (v20) {
      (*((void (**)(id, void))v20 + 2))(v20, 0);
    }
  }
  else
  {
    v60 = (void *)a9;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    double v22 = [(NSMapTable *)self->_pointerClientToClientStateMap keyEnumerator];
    id v23 = [v22 allObjects];
    id v24 = [v23 copy];

    id v25 = [v24 countByEnumeratingWithState:&v68 objects:v72 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v69;
LABEL_5:
      uint64_t v27 = 0;
      while (1)
      {
        if (*(void *)v69 != v26) {
          objc_enumerationMutation(v24);
        }
        double v28 = *(void **)(*((void *)&v68 + 1) + 8 * v27);
        unsigned int v29 = [v28 pid];
        if (v29 == [v18 pid]) {
          break;
        }
        if (v25 == (id)++v27)
        {
          id v25 = [v24 countByEnumeratingWithState:&v68 objects:v72 count:16];
          if (v25) {
            goto LABEL_5;
          }
          goto LABEL_11;
        }
      }
      id v30 = v28;

      if (!v30) {
        goto LABEL_24;
      }
      [(PUIDPointerController *)self _decelerationRate];
      int v56 = v31;
      [(PUIDPointerSettings *)self->_settings decelerationTargetLookupResolution];
      double v55 = v32;
      [(PUIDPointerSettings *)self->_settings decelerationTargetLookupConeAngleInDegrees];
      double v54 = v33;
      [(PUIDPointerSettings *)self->_settings decelerationTargetLookupRadius];
      double v57 = v34;
      sub_100011504(v19);
      id v35 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v36 = v35 == v18;

      if (v36)
      {
        [(PUIDPointerSettings *)self->_settings systemInteractionsDecelerationTargetLookupRadius];
        double v57 = v37;
      }
      [(PUIDPointerSettings *)self->_settings minimumVelocityThresholdForExpandedDecelerationLookup];
      double v53 = v38;
      -[PUIDPointerController _transformVelocity:intoCoordinateSpaceForPointerClient:](self, "_transformVelocity:intoCoordinateSpaceForPointerClient:", v30, v16, v15);
      long double v58 = v40;
      long double v59 = v39;
      UIDistanceBetweenPoints();
      double v42 = v41;
      objc_initWeak(&location, self);
      xpcClientContextController = self->_xpcClientContextController;
      id v44 = [v18 contextID];
      double v45 = hypot(v59, v58);
      double v46 = fabs(v16);
      double v47 = fabs(v15);
      if (v46 < v47) {
        double v46 = v47;
      }
      if (v46 >= v53) {
        double v48 = v57;
      }
      else {
        double v48 = 0.0;
      }
      v61[0] = _NSConcreteStackBlock;
      v61[1] = 3221225472;
      v61[2] = sub_10000A0B0;
      v61[3] = &unk_100044D28;
      objc_copyWeak(v66, &location);
      double v49 = v42 / v45;
      long double v50 = v58 * (v42 / v45);
      v66[1] = v60;
      long double v51 = v59 * v49;
      v66[2] = *(id *)&x;
      v66[3] = *(id *)&y;
      id v62 = v18;
      id v52 = v30;
      id v63 = v52;
      v64 = v19;
      v66[4] = v56;
      v65 = v21;
      -[PUIDXPCClientController adjustedDecelerationTargetForPointerClient:withTargetPointerPosition:velocity:inContextID:cursorRegionLookupRadius:cursorRegionLookupResolution:lookupConeAngle:completion:](xpcClientContextController, "adjustedDecelerationTargetForPointerClient:withTargetPointerPosition:velocity:inContextID:cursorRegionLookupRadius:cursorRegionLookupResolution:lookupConeAngle:completion:", v52, v44, v61, x, y, (double)v51, (double)v50, v48, v55, v54 * 3.14159265 / 180.0);

      objc_destroyWeak(v66);
      objc_destroyWeak(&location);
    }
    else
    {
LABEL_11:

LABEL_24:
      if (v21) {
        v21[2](v21, 0);
      }
    }
  }
}

- (BOOL)_updatePointerVelocityWithPointerParentEvent:(__IOHIDEvent *)a3 previousEvent:(__IOHIDEvent *)a4
{
  LOBYTE(v4) = 0;
  if (a3 && a4)
  {
    id v8 = BKSHIDEventGetPointerAttributes();
    unsigned int v9 = BKSHIDEventGetPointerAttributes();
    double v10 = [v8 token];
    unsigned int v11 = [v10 _identifierOfCAContext];
    double v12 = [v9 token];
    unsigned int v13 = [v12 _identifierOfCAContext];

    if (v11 == v13
      && ([(PUIDPointerController *)self _pointerPositionFromPointerEvent:a3],
          double v15 = v14,
          double v17 = v16,
          [(PUIDPointerController *)self _pointerPositionFromPointerEvent:a4],
          double v19 = v18,
          double v21 = v20,
          uint64_t TimeStamp = IOHIDEventGetTimeStamp(),
          TimeStamp != IOHIDEventGetTimeStamp()))
    {
      BSMonotonicReferencedTimeFromMachTime();
      double v24 = v23;
      BSMonotonicReferencedTimeFromMachTime();
      double v26 = v24 - v25;
      double v27 = (v15 - v19) / v26;
      double v28 = (v17 - v21) / v26;
      if (self->_pointerVelocity.x != CGPointZero.x || self->_pointerVelocity.y != CGPointZero.y)
      {
        [(PUIDPointerSettings *)self->_settings pointerVelocitySmoothingWeight];
        double v27 = (1.0 - v29) * self->_pointerVelocity.x + v27 * v29;
        double v28 = (1.0 - v29) * self->_pointerVelocity.y + v28 * v29;
      }
      self->_pointerVelocity.double x = v27;
      self->_pointerVelocity.double y = v28;
      -[PUIDTouchHistory updateWithLocation:timestamp:](self->_touchHistory, "updateWithLocation:timestamp:", v15, v17, v24);
      int v4 = BSPointEqualToPoint() ^ 1;
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

- (void)_resetPointerVelocity
{
  self->_pointerVelocitdouble y = CGPointZero;
}

- (void)_updatePointerHiddenStateForTouchUp:(BOOL)a3 fingerDown:(BOOL)a4 withEvent:(__IOHIDEvent *)a5 attributes:(id)a6 previousEvent:(__IOHIDEvent *)a7 previousPointerEventAttributes:(id)a8
{
  BOOL v12 = a3;
  id v14 = a6;
  id v15 = a8;
  if (a5 && IOHIDEventGetIntegerValue())
  {
    self->_isHiddenForActiveGesture = 0;
    [(PUIDPointerController *)self _cancelActiveGestureResetTimer];
    char v16 = 1;
  }
  else
  {
    char v16 = 0;
  }
  id v17 = sub_1000090E0((uint64_t)a5, v14);
  unsigned int v18 = [(PUIDPointerController *)self _shouldHideWhileGesturingForEventSource:v17];
  BOOL v19 = (!v18 || !self->_isHiddenForActiveGesture) && sub_10000A85C((uint64_t)a5, v14, (uint64_t)a7);
  if (self->_activeGestureMask)
  {
    BOOL v20 = 1;
  }
  else
  {
    if (!self->_pointerIsAutohidden) {
      goto LABEL_15;
    }
    BOOL v20 = (uint64_t)[v14 fingerDownCount] > 1;
  }
  if ((v18 & v20) == 1)
  {
    self->_isHiddenForActiveGesture = v17 != 11;
    [(PUIDPointerController *)self _hidePointerForReason:@"performing gesture" withOptions:2];
    [(PUIDPointerController *)self _restartActiveGestureResetTimer];
    goto LABEL_44;
  }
LABEL_15:
  if (v17 == 11)
  {
    self->_loggedRange = 0;
    if (!v19) {
      goto LABEL_44;
    }
    [(PUIDPointerController *)self _unhidePointerForReason:@"mouse interaction"];
    if (v16)
    {
      [(PUIDPointerController *)self _cancelAutohideTimer];
      goto LABEL_44;
    }
LABEL_38:
    [(PUIDPointerController *)self _restartAutohideTimer];
    goto LABEL_44;
  }
  if (v12)
  {
    self->_loggedRange = 0;
    if (v19)
    {
      double v21 = [v14 hitTestContexts];
      id v22 = [v21 count];

      if (!v22) {
        goto LABEL_44;
      }
      self->_isProvisionallyVisible = 0;
      [(PUIDPointerController *)self _cancelProvisionalPromotionTimer];
      [(PUIDPointerController *)self _cancelDelayedUnhideTimer];
      [(PUIDPointerController *)self _unhidePointerForReason:@"tap-to-click"];
    }
    else if (self->_isProvisionallyVisible)
    {
      [(PUIDPointerController *)self _hidePointerForReason:@"touch-up while pointer provisionally visible"];
      goto LABEL_44;
    }
    goto LABEL_38;
  }
  if (a4 || ([v14 options] & 0x400) != 0)
  {
    self->_loggedRange = 0;
    [(PUIDPointerController *)self _cancelAutohideTimer];
    if ((v18 | !v19))
    {
      if (self->_pointerIsAutohidden && !self->_isHiddenForActiveGesture && sub_10000A99C(v14)) {
        [(PUIDPointerController *)self _startDelayedUnhideTimer];
      }
    }
    else
    {
      if (self->_isProvisionallyVisible)
      {
        double v26 = PSLogAutohide();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v30) = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Trackpad interaction determined definitive", (uint8_t *)&v30, 2u);
        }
      }
      self->_isProvisionallyVisible = 0;
      [(PUIDPointerController *)self _cancelProvisionalPromotionTimer];
      [(PUIDPointerController *)self _cancelDelayedUnhideTimer];
      [(PUIDPointerController *)self _unhidePointerForReason:@"definitive trackpad interaction"];
    }
  }
  else if (self->_pointerIsAutohidden)
  {
    uint64_t SenderID = IOHIDEventGetSenderID();
    if (sub_10000A9D8())
    {
      if (!self->_loggedRange)
      {
        double v24 = PSLogAutohide();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          double v25 = BKSHIDEventGetConciseDescription();
          int v30 = 134218242;
          uint64_t v31 = SenderID;
          __int16 v32 = 2114;
          double v33 = v25;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Trackpad range event while hidden (logged once). senderID: %llX, evt: %{public}@", (uint8_t *)&v30, 0x16u);
        }
        self->_loggedRange = 1;
      }
    }
    else if (sub_10000AA74())
    {
      double v28 = PSLogAutohide();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        double v29 = BKSHIDEventGetConciseDescription();
        int v30 = 134218242;
        uint64_t v31 = SenderID;
        __int16 v32 = 2114;
        double v33 = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Non-range trackpad event without finger down - not unhiding pointer. senderID: %llX, evt: %{public}@", (uint8_t *)&v30, 0x16u);
      }
    }
  }
LABEL_44:
  if ([(PUIDPointerSettings *)self->_settings shouldAutohideAfterHitTestContextLoss])
  {
    double v27 = [v14 hitTestContexts];
    if (![v27 count])
    {
      if (!self->_pointerIsAutohidden) {
        [(PUIDPointerController *)self _hidePointerForReason:@"Pointer lost hit test context" withOptions:2];
      }
      if (self->_isHiddenForActiveGesture)
      {
        [(PUIDPointerController *)self _cancelActiveGestureResetTimer];
        self->_activeGestureMask = 0;
        self->_isHiddenForActiveGesture = 0;
      }
    }
  }
}

- (void)_startDelayedUnhideTimer
{
  if (!self->_delayedPointerUnhideTimer && [(NSMapTable *)self->_pointerClientToWantsServiceKeepAliveMap count])
  {
    double v3 = PSLogAutohide();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting delayed unhide timer", (uint8_t *)buf, 2u);
    }

    [(PUIDPointerSettings *)self->_settings delayBeforeUnhidingOnTrackpadTouchDown];
    double v5 = v4;
    objc_initWeak(buf, self);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000AC48;
    v8[3] = &unk_100044CB0;
    objc_copyWeak(&v9, buf);
    CFStringRef v6 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v8 block:v5];
    delayedPointerUnhideTimer = self->_delayedPointerUnhideTimer;
    self->_delayedPointerUnhideTimer = v6;

    objc_destroyWeak(&v9);
    objc_destroyWeak(buf);
  }
}

- (void)_cancelDelayedUnhideTimer
{
  [(NSTimer *)self->_delayedPointerUnhideTimer invalidate];
  delayedPointerUnhideTimer = self->_delayedPointerUnhideTimer;
  self->_delayedPointerUnhideTimer = 0;
}

- (void)_startProvisionalPromotionTimer
{
  double v3 = PSLogAutohide();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting provisional promotion timer", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000AE1C;
  v6[3] = &unk_100044CB0;
  objc_copyWeak(&v7, buf);
  double v4 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v6 block:0.095];
  provisionalPromotionTimer = self->_provisionalPromotionTimer;
  self->_provisionalPromotionTimer = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
}

- (void)_cancelProvisionalPromotionTimer
{
  [(NSTimer *)self->_provisionalPromotionTimer invalidate];
  provisionalPromotionTimer = self->_provisionalPromotionTimer;
  self->_provisionalPromotionTimer = 0;
}

- (void)_restartAutohideTimer
{
  [(PUIDPointerController *)self _cancelAutohideTimer];
  if (_AXSPointerAutoHideEnabled()
    && [(PUIDPointerController *)self isActiveOnMainDisplay])
  {
    lastPointerEvent = self->_lastPointerEvent;
    if (lastPointerEvent)
    {
      uint64_t v4 = (uint64_t)sub_1000090E0((uint64_t)lastPointerEvent, self->_lastPointerEventPointerAttributes);
    }
    else
    {
      double v5 = PSLogAutohide();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "No previous event, assuming trackpad for delay when restarting autohide timer.", (uint8_t *)buf, 2u);
      }

      uint64_t v4 = 12;
    }
    [(PUIDPointerController *)self _autohideDurationForEventSource:v4 isFocusedOnItem:self->_focusedOnItem settings:self->_settings];
    double v7 = v6;
    objc_initWeak(buf, self);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000B068;
    v10[3] = &unk_100044D50;
    objc_copyWeak(&v11, buf);
    int v12 = v4;
    id v8 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v10 block:v7];
    autohidePointerTimer = self->_autohidePointerTimer;
    self->_autohidePointerTimer = v8;

    objc_destroyWeak(&v11);
    objc_destroyWeak(buf);
  }
}

- (void)_cancelAutohideTimer
{
  [(NSTimer *)self->_autohidePointerTimer invalidate];
  autohidePointerTimer = self->_autohidePointerTimer;
  self->_autohidePointerTimer = 0;
}

- (void)_restartActiveGestureResetTimer
{
  [(PUIDPointerController *)self _cancelActiveGestureResetTimer];
  objc_initWeak(&location, self);
  [(PUIDPointerSettings *)self->_settings delayBeforeUnhidingAfterGesturing];
  double v4 = v3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000B2AC;
  v7[3] = &unk_100044CB0;
  objc_copyWeak(&v8, &location);
  double v5 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v7 block:v4];
  activeGestureResetTimer = self->_activeGestureResetTimer;
  self->_activeGestureResetTimer = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_cancelActiveGestureResetTimer
{
  [(NSTimer *)self->_activeGestureResetTimer invalidate];
  activeGestureResetTimer = self->_activeGestureResetTimer;
  self->_activeGestureResetTimer = 0;
}

- (double)_autohideDurationForEventSource:(int)a3 isFocusedOnItem:(BOOL)a4 settings:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = v7;
  if (a3 == 12)
  {
    if (v5) {
      [v7 autohideDurationForFocusedPointer];
    }
    else {
      [v7 autohideDurationForSystemPointer];
    }
  }
  else if (v5)
  {
    [v7 autohideDurationForFocusedPointerMouse];
  }
  else
  {
    [v7 autohideDurationForSystemPointerMouse];
  }
  double v10 = v9;

  return v10;
}

- (BOOL)_shouldHideWhileGesturingForEventSource:(int)a3
{
  return [(PUIDPointerSettings *)self->_settings shouldHideWhileGesturing];
}

- (void)_hidePointerForReason:(id)a3
{
}

- (void)_hidePointerForReason:(id)a3 withOptions:(unint64_t)a4
{
  id v6 = a3;
  self->_loggedRange = 0;
  [(PUIDPointerController *)self _cancelAutohideTimer];
  [(PUIDPointerController *)self _cancelDelayedUnhideTimer];
  [(PUIDPointerController *)self _cancelProvisionalPromotionTimer];
  self->_isProvisionallyVisible = 0;
  if (!self->_pointerIsAutohidden)
  {
    BOOL pointerForcedVisibleByEntitledClient = self->_pointerForcedVisibleByEntitledClient;
    id v8 = PSLogAutohide();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (pointerForcedVisibleByEntitledClient)
    {
      if (v9)
      {
        *(_DWORD *)buf = 136446210;
        id v14 = [v6 UTF8String];
        double v10 = "Hiding pointer <Suspended due to visible assertion>: %{public}s";
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v10, buf, 0xCu);
      }
    }
    else if (v9)
    {
      *(_DWORD *)buf = 136446210;
      id v14 = [v6 UTF8String];
      double v10 = "Hiding pointer: %{public}s";
      goto LABEL_7;
    }

    self->_pointerIsAutohidden = 1;
    self->_loggedTouchingDigitizerAndTrackpad = 0;
    id v11 = objc_alloc_init(PUIDPointerStateUpdateHandlerCollection);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000B558;
    v12[3] = &unk_100044D78;
    v12[4] = self;
    [(PUIDPointerStateUpdateHandlerCollection *)v11 setVisibilityTransitionCompletion:v12];
    [(PUIDPointerController *)self _updatePointerWithOptions:a4 updateHandlerCollection:v11];
  }
}

- (void)_unhidePointerForReason:(id)a3
{
  id v4 = a3;
  self->_loggedRange = 0;
  [(PUIDPointerController *)self _cancelDelayedUnhideTimer];
  if (self->_pointerIsAutohidden)
  {
    BOOL pointerForcedVisibleByEntitledClient = self->_pointerForcedVisibleByEntitledClient;
    id v6 = PSLogAutohide();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (pointerForcedVisibleByEntitledClient)
    {
      if (v7)
      {
        int v9 = 136446210;
        id v10 = [v4 UTF8String];
        id v8 = "Unhiding pointer <Already visible due to assertion>: %{public}s";
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v9, 0xCu);
      }
    }
    else if (v7)
    {
      int v9 = 136446210;
      id v10 = [v4 UTF8String];
      id v8 = "Unhiding pointer: %{public}s";
      goto LABEL_7;
    }

    self->_pointerIsAutohidden = 0;
    self->_loggedTouchingDigitizerAndTrackpad = 0;
    [(PUIDPointerController *)self _updatePointerWithOptions:0 updateHandlerCollection:0];
  }
}

- (BOOL)isActiveOnMainDisplay
{
  v2 = sub_100011838((id *)&self->_activeDisplayContext->super.isa);
  double v3 = +[PSDisplay builtinDisplay];
  unsigned __int8 v4 = [v2 isEqual:v3];

  return v4;
}

- (void)pointerVisibilityDidChange:(id)a3
{
  uint64_t v4 = [a3 pointerIsVisible];
  xpcClientContextController = self->_xpcClientContextController;
  [(PUIDXPCClientController *)xpcClientContextController setPointerVisibilityState:v4];
}

- (void)xpcClientContextController:(id)a3 didRemovePointerClient:(id)a4
{
  id v5 = a4;
  id v6 = PSLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v33 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ - is gone", buf, 0xCu);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  BOOL v7 = [(NSMutableDictionary *)self->_hoverRegionOverridingClientsByDisplay allKeys];
  id v8 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v27;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        [(PUIDPointerController *)self _removeOverridingHoverRegionClient:v5 forDisplay:*(void *)(*((void *)&v26 + 1) + 8 * (void)v11)];
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v9);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  int v12 = [(NSMutableDictionary *)self->_displayContextsByDisplay allValues];
  id v13 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      char v16 = 0;
      do
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = sub_100011874(*(void *)(*((void *)&v22 + 1) + 8 * (void)v16));
        [v17 invalidateEffectSourcesForPointerClient:v5];

        char v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v14);
  }

  unsigned int v18 = [(NSMapTable *)self->_pointerClientToClientStateMap objectForKey:v5];
  BOOL v19 = v18;
  if (v18)
  {
    [v18 invalidateAutomaticRegionExitTimer];
    [(NSMapTable *)self->_pointerClientToClientStateMap removeObjectForKey:v5];
    [(PUIDPointerController *)self _updatePointerHiddenByEntitledClients];
    [(PUIDPointerController *)self _updatePointerVisibleByEntitledClients];
  }
  [(PUIDPointerController *)self _updatePointerWithOptions:0 updateHandlerCollection:0];
  BOOL v20 = [(NSMapTable *)self->_pointerClientToWantsServiceKeepAliveMap objectForKey:v5];

  if (v20)
  {
    [(NSMapTable *)self->_pointerClientToWantsServiceKeepAliveMap removeObjectForKey:v5];
    if (![(NSMapTable *)self->_pointerClientToWantsServiceKeepAliveMap count])
    {
      pointerClientToWantsServiceKeepAliveMap = self->_pointerClientToWantsServiceKeepAliveMap;
      self->_pointerClientToWantsServiceKeepAliveMap = 0;
    }
    [(PUIDPointerController *)self _updateServiceKeepAlive];
  }
}

- (void)xpcClientContextController:(id)a3 didUpdateHoverRegion:(id)a4 forClient:(id)a5 transitionCompletion:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  int v12 = [(NSMapTable *)self->_pointerClientToClientStateMap objectForKey:v10];
  lockedContext = self->_lockedContext;
  if (lockedContext)
  {
    unsigned int v14 = [(BKSHIDEventHitTestClientContext *)lockedContext pid];
    unsigned int v15 = [v10 pid];
    char v16 = sub_10001158C((id *)&self->_activeDisplayContext->super.isa);
    id v17 = [v16 firstObject];
    unsigned __int8 v18 = [v17 isEqual:v10];

    if (v14 != v15 && (v18 & 1) == 0)
    {
      BOOL v19 = PSLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        sub_100028304((uint64_t)v10, v19);
      }

      goto LABEL_15;
    }
    if (v9)
    {
      BOOL v20 = [(_PUIDPointerControllerClientState *)v12 activeHoverRegion];
      unsigned __int8 v21 = [v20 isLatching];

      if (v21) {
        goto LABEL_15;
      }
    }
    if ([v9 isLatching]) {
      self->_latchingState = 1;
    }
  }
  if (!v12)
  {
    int v12 = objc_alloc_init(_PUIDPointerControllerClientState);
    [(NSMapTable *)self->_pointerClientToClientStateMap setObject:v12 forKey:v10];
  }
  long long v22 = (char *)[(_PUIDPointerControllerClientState *)v12 hoverRegionGenerationID] + 1;
  [(_PUIDPointerControllerClientState *)v12 setHoverRegionGenerationID:v22];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10000BBF8;
  v23[3] = &unk_100044DC8;
  int v12 = v12;
  long long v24 = v12;
  long long v28 = v22;
  id v25 = v9;
  long long v26 = self;
  id v27 = v11;
  [(PUIDPointerController *)self _getTransformForHoverRegion:v25 completion:v23];

  char v16 = v24;
LABEL_15:
}

- (id)xpcClientContextController:(id)a3 createPointerPortalSourceCollectionForDisplay:(id)a4 client:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (v12)
  {
    uint64_t v14 = [(NSMutableDictionary *)self->_displayContextsByDisplay objectForKeyedSubscript:v12];
    unsigned int v15 = v14;
    if (v14)
    {
      char v16 = sub_100011874(v14);

      if (!v16)
      {
        long long v24 = +[NSAssertionHandler currentHandler];
        [v24 handleFailureInMethod:a2, self, @"PUIDPointerController.m", 1300, @"nil pointerRenderingController for display %@", v12 object file lineNumber description];
      }
      id v17 = sub_100011874((uint64_t)v15);
      unsigned __int8 v18 = [v17 createPointerPortalSourceCollectionForClient:v13];

      [v18 setShouldBeInvalidatedIfPointerLeavesDisplay:0];
      BOOL v19 = PSLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        id v28 = v13;
        __int16 v29 = 2114;
        id v30 = v12;
        __int16 v31 = 2114;
        __int16 v32 = v18;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ - created source collection on display %{public}@: %{public}@", buf, 0x20u);
      }
    }
    else
    {
      if (a6)
      {
        *a6 = +[NSError errorWithDomain:@"PUIDXPCClientControllerErrorDomain" code:-1004 userInfo:0];
      }
      BOOL v19 = PSLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v28 = v13;
        __int16 v29 = 2114;
        id v30 = v12;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ - requested source collection but we don't have a context for display %{public}@", buf, 0x16u);
      }
      unsigned __int8 v18 = 0;
    }
  }
  else
  {
    activeDisplayContext = self->_activeDisplayContext;
    if (activeDisplayContext)
    {
      unsigned __int8 v21 = sub_100011874((uint64_t)activeDisplayContext);

      if (!v21)
      {
        id v25 = +[NSAssertionHandler currentHandler];
        long long v26 = sub_100011838((id *)&self->_activeDisplayContext->super.isa);
        [v25 handleFailureInMethod:a2, self, @"PUIDPointerController.m", 1284, @"nil pointerRenderingController for display %@", v26 object file lineNumber description];
      }
      long long v22 = sub_100011874((uint64_t)self->_activeDisplayContext);
      unsigned __int8 v18 = [v22 createPointerPortalSourceCollectionForClient:v13];

      [v18 setShouldBeInvalidatedIfPointerLeavesDisplay:1];
      unsigned int v15 = PSLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v28 = v13;
        __int16 v29 = 2114;
        id v30 = v18;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ - created source collection on active display: %{public}@", buf, 0x16u);
      }
    }
    else
    {
      if (a6)
      {
        *a6 = +[NSError errorWithDomain:@"PUIDXPCClientControllerErrorDomain" code:-1004 userInfo:0];
      }
      unsigned int v15 = PSLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v28 = v13;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ - requested source collection but we don't have an active display", buf, 0xCu);
      }
      unsigned __int8 v18 = 0;
    }
  }

  return v18;
}

- (void)xpcClientContextController:(id)a3 invalidatePointerPortalSourceCollection:(id)a4 forClient:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = PSLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543618;
    id v14 = v8;
    __int16 v15 = 2114;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ - invalidated source collection: %{public}@", (uint8_t *)&v13, 0x16u);
  }

  uint64_t v10 = -[PUIDPointerController _displayContextForPointerRenderingContextID:](self, "_displayContextForPointerRenderingContextID:", [v7 sourceContextID]);
  id v11 = (void *)v10;
  if (v10)
  {
    id v12 = sub_100011874(v10);
    [v12 invalidatePointerPortalSourceCollection:v7 forClient:v8];
  }
  else
  {
    id v12 = PSLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543618;
      id v14 = v8;
      __int16 v15 = 2114;
      id v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ - failed to invalidate source collection: %{public}@ - couldn't find matching display context", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (id)xpcClientContextController:(id)a3 createContentMatchMoveSourceForDisplay:(id)a4 client:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (v12)
  {
    uint64_t v14 = [(NSMutableDictionary *)self->_displayContextsByDisplay objectForKeyedSubscript:v12];
    __int16 v15 = (id *)v14;
    if (v14)
    {
      id v16 = sub_100011874(v14);

      if (!v16)
      {
        id v25 = +[NSAssertionHandler currentHandler];
        long long v26 = sub_100011838(v15);
        [v25 handleFailureInMethod:a2, self, @"PUIDPointerController.m", 1347, @"nil pointerRenderingController for display %@", v26 object file lineNumber description];
      }
      id v17 = sub_100011874((uint64_t)v15);
      unsigned __int8 v18 = [v17 createContentMatchMoveSourceForClient:v13];

      [v18 setShouldBeInvalidatedIfPointerLeavesDisplay:0];
    }
    else
    {
      if (a6)
      {
        *a6 = +[NSError errorWithDomain:@"PUIDXPCClientControllerErrorDomain" code:-1004 userInfo:0];
      }
      long long v22 = PSLogCommon();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v30 = v13;
        __int16 v31 = 2114;
        id v32 = v12;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ - requested match move source but we don't have a context for display %{public}@", buf, 0x16u);
      }

      unsigned __int8 v18 = 0;
    }
  }
  else
  {
    activeDisplayContext = self->_activeDisplayContext;
    if (activeDisplayContext)
    {
      BOOL v20 = sub_100011874((uint64_t)activeDisplayContext);

      if (!v20)
      {
        id v27 = +[NSAssertionHandler currentHandler];
        id v28 = sub_100011838((id *)&self->_activeDisplayContext->super.isa);
        [v27 handleFailureInMethod:a2, self, @"PUIDPointerController.m", 1331, @"nil pointerRenderingController for display %@", v28 object file lineNumber description];
      }
      unsigned __int8 v21 = sub_100011874((uint64_t)self->_activeDisplayContext);
      unsigned __int8 v18 = [v21 createContentMatchMoveSourceForClient:v13];

      [v18 setShouldBeInvalidatedIfPointerLeavesDisplay:1];
    }
    else
    {
      if (a6)
      {
        *a6 = +[NSError errorWithDomain:@"PUIDXPCClientControllerErrorDomain" code:-1004 userInfo:0];
      }
      long long v24 = PSLogCommon();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v30 = v13;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ - requested match move source but we don't have an active display", buf, 0xCu);
      }

      unsigned __int8 v18 = 0;
    }
  }

  return v18;
}

- (void)xpcClientContextController:(id)a3 invalidateContentMatchMoveSource:(id)a4 forClient:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = -[PUIDPointerController _displayContextForPointerRenderingContextID:](self, "_displayContextForPointerRenderingContextID:", [v7 sourceContextID]);
  uint64_t v10 = (void *)v9;
  if (v9)
  {
    id v11 = sub_100011874(v9);
    [v11 invalidateContentMatchMoveSource:v7 forClient:v8];
  }
  else
  {
    id v11 = PSLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543618;
      id v13 = v8;
      __int16 v14 = 2114;
      id v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ - failed to invalidate match move source: %{public}@ - couldn't find matching display context", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void)xpcClientContextController:(id)a3 setWantsServiceKeepAlive:(BOOL)a4 forClient:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = PSLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543362;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ - wants keep alive", (uint8_t *)&v14, 0xCu);
  }

  uint64_t v9 = [(NSMapTable *)self->_pointerClientToWantsServiceKeepAliveMap objectForKey:v7];

  if (v5)
  {
    if (!v9)
    {
      pointerClientToWantsServiceKeepAliveMap = self->_pointerClientToWantsServiceKeepAliveMap;
      if (!pointerClientToWantsServiceKeepAliveMap)
      {
        id v11 = +[NSMapTable strongToStrongObjectsMapTable];
        int v12 = self->_pointerClientToWantsServiceKeepAliveMap;
        self->_pointerClientToWantsServiceKeepAliveMap = v11;

        pointerClientToWantsServiceKeepAliveMap = self->_pointerClientToWantsServiceKeepAliveMap;
      }
      [(NSMapTable *)pointerClientToWantsServiceKeepAliveMap setObject:&__kCFBooleanTrue forKey:v7];
LABEL_11:
      [(PUIDPointerController *)self _updateServiceKeepAlive];
    }
  }
  else if (v9)
  {
    [(NSMapTable *)self->_pointerClientToWantsServiceKeepAliveMap removeObjectForKey:v7];
    if (![(NSMapTable *)self->_pointerClientToWantsServiceKeepAliveMap count])
    {
      id v13 = self->_pointerClientToWantsServiceKeepAliveMap;
      self->_pointerClientToWantsServiceKeepAliveMap = 0;
    }
    goto LABEL_11;
  }
}

- (void)xpcClientContextController:(id)a3 didSetSystemPointerInteractionContextID:(unsigned int)a4 display:(id)a5 forClient:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v9 = a5;
  id v10 = a6;
  id v11 = PSLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138543874;
    id v17 = v10;
    __int16 v18 = 1024;
    LODWORD(v19[0]) = v7;
    WORD2(v19[0]) = 2114;
    *(void *)((char *)v19 + 6) = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ - set system pointer interaction contextID: 0x%x display: %{public}@", (uint8_t *)&v16, 0x1Cu);
  }

  systemPointerInteractionContextByDispladouble y = self->_systemPointerInteractionContextByDisplay;
  if (v7)
  {
    id v13 = [(NSMutableDictionary *)systemPointerInteractionContextByDisplay objectForKeyedSubscript:v9];
    if (v13)
    {
      int v14 = PSLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138543618;
        id v17 = v10;
        __int16 v18 = 2114;
        v19[0] = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ - was tracking %{public}@ systemPointerInteractionContext --> replacing it", (uint8_t *)&v16, 0x16u);
      }
    }
    id v15 = objc_alloc_init((Class)BKSHIDEventHitTestClientContext);
    objc_msgSend(v15, "setPid:", objc_msgSend(v10, "pid"));
    [v15 setContextID:v7];
    [(NSMutableDictionary *)self->_systemPointerInteractionContextByDisplay setObject:v15 forKeyedSubscript:v9];
  }
  else
  {
    [(NSMutableDictionary *)systemPointerInteractionContextByDisplay removeObjectForKey:v9];
  }
}

- (void)xpcClientContextController:(id)a3 didSetOverridesHoverRegions:(BOOL)a4 display:(id)a5 forClient:(id)a6
{
  BOOL v7 = a4;
  id v9 = a5;
  id v10 = a6;
  id v11 = PSLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543874;
    id v14 = v10;
    __int16 v15 = 1024;
    BOOL v16 = v7;
    __int16 v17 = 2114;
    id v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ - set client overrides hit tested hover regions %{BOOL}u display: %{public}@", (uint8_t *)&v13, 0x1Cu);
  }

  if (v7)
  {
    int v12 = [(NSMutableDictionary *)self->_hoverRegionOverridingClientsByDisplay objectForKeyedSubscript:v9];
    if (!v12)
    {
      int v12 = +[NSMutableArray array];
      [(NSMutableDictionary *)self->_hoverRegionOverridingClientsByDisplay setObject:v12 forKeyedSubscript:v9];
    }
    [v12 addObject:v10];
  }
  else
  {
    [(PUIDPointerController *)self _removeOverridingHoverRegionClient:v10 forDisplay:v9];
  }
}

- (void)_removeOverridingHoverRegionClient:(id)a3 forDisplay:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSMutableDictionary *)self->_hoverRegionOverridingClientsByDisplay objectForKeyedSubscript:v7];
  id v9 = [v8 indexOfObject:v6];
  if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = v9;
    id v11 = PSLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315650;
      int v13 = "-[PUIDPointerController _removeOverridingHoverRegionClient:forDisplay:]";
      __int16 v14 = 2112;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Removing client %@ for display %@", (uint8_t *)&v12, 0x20u);
    }

    [v8 removeObjectAtIndex:v10];
    if (![v8 count]) {
      [(NSMutableDictionary *)self->_hoverRegionOverridingClientsByDisplay removeObjectForKey:v7];
    }
  }
}

- (void)xpcClientContextController:(id)a3 autohidePointerForReason:(unint64_t)a4 forClient:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  switch(a4)
  {
    case 0uLL:
      id v11 = PSLogCommon();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_31;
      }
      LOWORD(v34) = 0;
      int v12 = "Ignoring autohide pointer request for unknown reason";
      int v13 = v11;
      uint32_t v14 = 2;
      goto LABEL_30;
    case 1uLL:
      id v15 = [v9 auditToken];
      unsigned __int8 v16 = [v15 hasEntitlement:@"com.apple.pointerui.autohidePointer"];

      if (v16)
      {
        CFStringRef v17 = @"text input";
        goto LABEL_15;
      }
      id v11 = PSLogCommon();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_31;
      }
      int v34 = 138412290;
      CFStringRef v35 = @"com.apple.pointerui.autohidePointer";
      int v12 = "Ignoring autohide pointer request for PSPointerAutohideReasonTextInput because missing entitlement (%@)";
      goto LABEL_29;
    case 2uLL:
      id v18 = [(NSArray *)self->_lastPointerHitTestContexts firstObject];
      if (v18)
      {
        BOOL v19 = [v10 auditToken];
        unsigned int v20 = [v19 pid];
        unsigned int v21 = [(__CFString *)v18 pid];

        if (v20 == v21)
        {

          CFStringRef v17 = @"client request";
          goto LABEL_15;
        }
      }
      id v30 = PSLogCommon();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v31 = [(__CFString *)v18 pid];
        id v32 = [v10 auditToken];
        id v33 = [v10 auditToken];
        int v34 = 138544130;
        CFStringRef v35 = v18;
        __int16 v36 = 1024;
        unsigned int v37 = v31;
        __int16 v38 = 2112;
        double v39 = v32;
        __int16 v40 = 1024;
        unsigned int v41 = [v33 pid];
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Ignoring autohide pointer request because clientContext (%{public}@) pid (%d) != auditToken (%@) pid (%d)", (uint8_t *)&v34, 0x22u);
      }
      goto LABEL_32;
    case 3uLL:
      long long v22 = [v9 auditToken];
      unsigned __int8 v23 = [v22 hasEntitlement:@"com.apple.pointerui.autohidePointer"];

      if (v23)
      {
        CFStringRef v17 = @"accessibility";
        goto LABEL_15;
      }
      id v11 = PSLogCommon();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_31;
      }
      int v34 = 138412290;
      CFStringRef v35 = @"com.apple.pointerui.autohidePointer";
      int v12 = "Ignoring autohide pointer request for PSPointerAutohideReasonAccessibility because missing entitlement (%@)";
      goto LABEL_29;
    case 4uLL:
      long long v24 = [v9 auditToken];
      unsigned __int8 v25 = [v24 hasEntitlement:@"com.apple.pointerui.autohidePointer"];

      if (v25)
      {
        CFStringRef v17 = @"locked";
        goto LABEL_15;
      }
      id v11 = PSLogCommon();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_31;
      }
      int v34 = 138412290;
      CFStringRef v35 = @"com.apple.pointerui.autohidePointer";
      int v12 = "Ignoring autohide pointer request for PSPointerAutohideReasonLocked because missing entitlement (%@)";
      goto LABEL_29;
    case 5uLL:
      long long v26 = [v9 auditToken];
      unsigned __int8 v27 = [v26 hasEntitlement:@"com.apple.pointerui.autohidePointer"];

      if (v27)
      {
        CFStringRef v17 = @"systemComponent";
LABEL_15:
        id v28 = PSLogCommon();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          PSPointerAutohideReasonToString();
          __int16 v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
          int v34 = 138543362;
          CFStringRef v35 = v29;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Autohiding pointer from client request for reason: %{public}@", (uint8_t *)&v34, 0xCu);
        }
        [(PUIDPointerController *)self _hidePointerForReason:v17];
      }
      else
      {
        id v11 = PSLogCommon();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int v34 = 138412290;
          CFStringRef v35 = @"com.apple.pointerui.autohidePointer";
          int v12 = "Ignoring autohide pointer request for PSPointerAutohideReasonSystemComponentRequest because missing entitlement (%@)";
LABEL_29:
          int v13 = v11;
          uint32_t v14 = 12;
LABEL_30:
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v34, v14);
        }
LABEL_31:
      }
LABEL_32:

      return;
    default:
      goto LABEL_32;
  }
}

- (void)xpcClientContextController:(id)a3 setPointerPersistentlyHiddenForReasons:(id)a4 forClient:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(NSMapTable *)self->_pointerClientToClientStateMap objectForKey:v8];
  if (!v9)
  {
    id v9 = objc_alloc_init(_PUIDPointerControllerClientState);
    [(NSMapTable *)self->_pointerClientToClientStateMap setObject:v9 forKey:v8];
  }
  id v10 = objc_msgSend(v7, "bs_map:", &stru_100044E08);
  id v11 = [v10 componentsJoinedByString:@", "];
  int v12 = PSLogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543618;
    id v14 = v8;
    __int16 v15 = 2114;
    unsigned __int8 v16 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ - Pointer Persistent Hiding Reasons list updated to: [%{public}@]", (uint8_t *)&v13, 0x16u);
  }

  -[_PUIDPointerControllerClientState setAssertingPointerHidden:](v9, "setAssertingPointerHidden:", [v7 count] != 0);
  [(PUIDPointerController *)self _updatePointerHiddenByEntitledClients];
  [(PUIDPointerController *)self _updatePointerWithOptions:0 updateHandlerCollection:0];
}

- (void)xpcClientContextController:(id)a3 setPointerPersistentlyVisibleForReasons:(id)a4 forClient:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(NSMapTable *)self->_pointerClientToClientStateMap objectForKey:v8];
  if (!v9)
  {
    id v9 = objc_alloc_init(_PUIDPointerControllerClientState);
    [(NSMapTable *)self->_pointerClientToClientStateMap setObject:v9 forKey:v8];
  }
  id v10 = objc_msgSend(v7, "bs_map:", &stru_100044E28);
  id v11 = [v10 componentsJoinedByString:@", "];
  int v12 = PSLogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543618;
    id v14 = v8;
    __int16 v15 = 2114;
    unsigned __int8 v16 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ - Pointer Persistent Visible Reasons list updated to: [%{public}@]", (uint8_t *)&v13, 0x16u);
  }

  -[_PUIDPointerControllerClientState setAssertingPointerVisible:](v9, "setAssertingPointerVisible:", [v7 count] != 0);
  [(PUIDPointerController *)self _updatePointerVisibleByEntitledClients];
  [(PUIDPointerController *)self _updatePointerWithOptions:0 updateHandlerCollection:0];
}

- (id)systemPointerInteractionContextForDisplayContext:(id)a3
{
  uint64_t v4 = sub_100011838((id *)a3);
  if (v4)
  {
    BOOL v5 = [(NSMutableDictionary *)self->_systemPointerInteractionContextByDisplay objectForKeyedSubscript:v4];
  }
  else
  {
    id v6 = PSLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v8 = 138543362;
      uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Not tracking any systemPointerInteractionContext for display: %{public}@", (uint8_t *)&v8, 0xCu);
    }

    BOOL v5 = 0;
  }

  return v5;
}

- (id)overridingHoverRegionClientsForDisplayContext:(id)a3
{
  uint64_t v4 = sub_100011838((id *)a3);
  if (v4)
  {
    BOOL v5 = [(NSMutableDictionary *)self->_hoverRegionOverridingClientsByDisplay objectForKeyedSubscript:v4];
    id v6 = [v5 copy];
  }
  else
  {
    id v6 = +[NSArray array];
  }

  return v6;
}

- (void)_movePointerToDisplay:(id)a3
{
  id v4 = a3;
  BOOL v5 = PSLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Moving pointer to display: %{public}@", (uint8_t *)&v11, 0xCu);
  }

  if (v4)
  {
    id v6 = [(NSMutableDictionary *)self->_displayContextsByDisplay objectForKeyedSubscript:v4];
  }
  else
  {
    id v6 = 0;
  }
  activeDisplayContext = self->_activeDisplayContext;
  self->_activeDisplayContext = v6;
  int v8 = v6;
  uint64_t v9 = activeDisplayContext;

  id v10 = sub_100011874((uint64_t)v9);
  [v10 hidePointerAnimated:0];

  [(PUIDPointerController *)self _restartAutohideTimer];
  [(PUIDPointerController *)self _invalidateEffectSourcesPassingTest:&stru_100044E48 displayContext:v9];
}

- (id)_displayContextForPointerEventContextID:(unsigned int)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(NSMutableDictionary *)self->_displayContextsByDisplay allValues];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (CFIndex i = 0; i != v6; CFIndex i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (sub_100011428((id *)v9) == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (id)_displayContextForPointerRenderingContextID:(unsigned int)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(NSMutableDictionary *)self->_displayContextsByDisplay allValues];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (CFIndex i = 0; i != v6; CFIndex i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (sub_100011418((id *)v9) == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (id)_systemPointerClients
{
  double v3 = +[NSMutableSet set];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(NSMutableDictionary *)self->_displayContextsByDisplay allValues];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (CFIndex i = 0; i != v6; CFIndex i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = sub_100011904(*(void *)(*((void *)&v11 + 1) + 8 * i));
        [v3 addObject:v9];
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)_beginPeriodicClientTransformRefreshTimer
{
  objc_initWeak(&location, self);
  [(PUIDPointerSettings *)self->_settings periodicClientTransformRefreshInterval];
  double v4 = v3;
  if (v3 > 0.00000011920929)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000DCE0;
    v7[3] = &unk_100044CB0;
    objc_copyWeak(&v8, &location);
    id v5 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v7 block:v4];
    periodicClientTransformRefreshTimer = self->_periodicClientTransformRefreshTimer;
    self->_periodicClientTransformRefreshTimer = v5;

    objc_destroyWeak(&v8);
  }
  objc_destroyWeak(&location);
}

- (void)_getTransformForHoverRegion:(id)a3 completion:(id)a4
{
  uint64_t v7 = a4;
  id v8 = a3;
  id v9 = [v8 coordinateSpaceSourceContextID];
  id v10 = [v8 coordinateSpaceSourceLayerRenderID];

  if (v9 && v10)
  {
    transformUpdateQueue = self->_transformUpdateQueue;
    if (!transformUpdateQueue)
    {
      long long v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      long long v13 = (OS_dispatch_queue *)BSDispatchQueueCreateWithFixedPriority();
      long long v14 = self->_transformUpdateQueue;
      self->_transformUpdateQueue = v13;

      transformUpdateQueue = self->_transformUpdateQueue;
    }
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10000DE98;
    v21[3] = &unk_100044E98;
    SEL v23 = a2;
    v21[4] = self;
    long long v22 = v7;
    [(PUIDPointerController *)self _transformForLayer:v10 inContext:v9 queue:transformUpdateQueue completion:v21];
  }
  else if (v7)
  {
    long long v15 = (void (*)(void *, _OWORD *))v7[2];
    long long v16 = *(_OWORD *)&CATransform3DIdentity.m33;
    v20[4] = *(_OWORD *)&CATransform3DIdentity.m31;
    v20[5] = v16;
    long long v17 = *(_OWORD *)&CATransform3DIdentity.m43;
    v20[6] = *(_OWORD *)&CATransform3DIdentity.m41;
    v20[7] = v17;
    long long v18 = *(_OWORD *)&CATransform3DIdentity.m13;
    v20[0] = *(_OWORD *)&CATransform3DIdentity.m11;
    v20[1] = v18;
    long long v19 = *(_OWORD *)&CATransform3DIdentity.m23;
    v20[2] = *(_OWORD *)&CATransform3DIdentity.m21;
    v20[3] = v19;
    v15(v7, v20);
  }
}

- (double)_decelerationRate
{
  globalDevicePreferences = self->_globalDevicePreferences;
  if (globalDevicePreferences)
  {
    [(BKSMousePointerDevicePreferences *)globalDevicePreferences pointerAccelerationFactor];
    double v4 = v3;
  }
  else
  {
    double v4 = 1.0;
  }
  double v5 = pow(v4, 4.0);
  return pow(v4, 3.0) * -0.0120353 + v5 * 0.00192151 + v4 * v4 * 0.0237803 + v4 * -0.025559 + 0.991966;
}

- (void)_updatePointerHiddenByEntitledClients
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  float v3 = [(NSMapTable *)self->_pointerClientToClientStateMap objectEnumerator];
  double v4 = [v3 allObjects];

  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v14 != v7) {
        objc_enumerationMutation(v4);
      }
      unsigned int v9 = [*(id *)(*((void *)&v13 + 1) + 8 * v8) isAssertingPointerHidden];
      if (v9) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          goto LABEL_3;
        }

        if (self->_pointerHiddenByEntitledClient != v9)
        {
          self->_pointerHiddenByEntitledClient = v9;
          goto LABEL_16;
        }
        return;
      }
    }

    if (self->_pointerHiddenByEntitledClient == v9) {
      return;
    }
    self->_pointerHiddenByEntitledClient = v9;
    id v10 = PSLogAutohide();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v12 = 0;
      long long v11 = "Forcing pointer hidden by request from entitled client";
      goto LABEL_18;
    }
  }
  else
  {

    if (!self->_pointerHiddenByEntitledClient) {
      return;
    }
    self->_pointerHiddenByEntitledClient = 0;
LABEL_16:
    id v10 = PSLogAutohide();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v12 = 0;
      long long v11 = "No longer forcing pointer hidden by request from entitled client";
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, v12, 2u);
    }
  }
}

- (void)_updatePointerVisibleByEntitledClients
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  float v3 = [(NSMapTable *)self->_pointerClientToClientStateMap objectEnumerator];
  double v4 = [v3 allObjects];

  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v14 != v7) {
        objc_enumerationMutation(v4);
      }
      unsigned int v9 = [*(id *)(*((void *)&v13 + 1) + 8 * v8) isAssertingPointerVisible];
      if (v9) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          goto LABEL_3;
        }

        if (self->_pointerForcedVisibleByEntitledClient != v9)
        {
          self->_BOOL pointerForcedVisibleByEntitledClient = v9;
          goto LABEL_16;
        }
        return;
      }
    }

    if (self->_pointerForcedVisibleByEntitledClient == v9) {
      return;
    }
    self->_BOOL pointerForcedVisibleByEntitledClient = v9;
    id v10 = PSLogAutohide();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v12 = 0;
      long long v11 = "Forcing pointer visible by request from entitled client";
      goto LABEL_18;
    }
  }
  else
  {

    if (!self->_pointerForcedVisibleByEntitledClient) {
      return;
    }
    self->_BOOL pointerForcedVisibleByEntitledClient = 0;
LABEL_16:
    id v10 = PSLogAutohide();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v12 = 0;
      long long v11 = "No longer forcing pointer visible by request from entitled client";
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, v12, 2u);
    }
  }
}

- (void)_handleAccessibilityPointerSizePreferencesDidChange
{
  if (self->_pointerIsAutohidden)
  {
    [(PUIDPointerController *)self _unhidePointerForReason:@"AX Preferences Change"];
    [(PUIDPointerController *)self _restartAutohideTimer];
  }
}

- (void)_handlePeriodicRefreshTimerAction
{
  [(NSTimer *)self->_periodicClientTransformRefreshTimer invalidate];
  periodicClientTransformRefreshTimer = self->_periodicClientTransformRefreshTimer;
  self->_periodicClientTransformRefreshTimer = 0;

  if (!self->_isPerformingPeriodicClientTransformRefresh
    && self->_shouldPeriodicallyRefreshClientTransform
    && self->_lastPointerEvent)
  {
    self->_isPerformingPeriodicClientTransformRefresh = 1;
    [(PUIDPointerController *)self _refreshClientTransformWithReason:0];
  }
}

- (void)_refreshClientTransformWithReason:(unint64_t)a3
{
  id v5 = self->_previousPointerClient;
  id v6 = [(NSMapTable *)self->_pointerClientToClientStateMap objectForKey:v5];
  uint64_t v7 = [v6 activeHoverRegion];
  objc_initWeak(&location, self);
  id v8 = [v6 hoverRegionGenerationID];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000E6A8;
  v10[3] = &unk_100044EC0;
  objc_copyWeak(v12, &location);
  v12[1] = (id)a3;
  id v9 = v6;
  id v11 = v9;
  v12[2] = v8;
  [(PUIDPointerController *)self _getTransformForHoverRegion:v7 completion:v10];

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

- (void)_invalidateHoverRegionsForAllPointerClientsExcludingPointerClient:(id)a3 hoverRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PUIDPointerController *)self _systemPointerClients];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = [(NSMapTable *)self->_pointerClientToClientStateMap keyEnumerator];
  id v10 = [v9 allObjects];

  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      long long v14 = 0;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(id *)(*((void *)&v18 + 1) + 8 * (void)v14);
        if (v15 != v6
          && ([v8 containsObject:*(void *)(*((void *)&v18 + 1) + 8 * (void)v14)] & 1) == 0)
        {
          long long v16 = [(NSMapTable *)self->_pointerClientToClientStateMap objectForKey:v15];
          id v17 = [v16 activeHoverRegion];

          if (v17 != v7) {
            [v16 setActiveHoverRegion:0];
          }
        }
        long long v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }
}

- (void)_invalidateEffectSourcesPassingTest:(id)a3 displayContext:(id)a4
{
  id v29 = a3;
  id v5 = a4;
  uint64_t v43 = 0;
  id v44 = &v43;
  uint64_t v45 = 0x3032000000;
  double v46 = sub_10000EE0C;
  double v47 = sub_10000EE1C;
  id v48 = +[NSMapTable strongToStrongObjectsMapTable];
  uint64_t v37 = 0;
  __int16 v38 = &v37;
  uint64_t v39 = 0x3032000000;
  __int16 v40 = sub_10000EE0C;
  unsigned int v41 = sub_10000EE1C;
  id v42 = +[NSMapTable strongToStrongObjectsMapTable];
  id v6 = sub_100011874((uint64_t)v5);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_10000EE24;
  v36[3] = &unk_100044EE8;
  v36[4] = &v43;
  [v6 invalidatePointerPortalSourceCollectionsPassingTest:v29 additionalInvalidation:v36];

  id v7 = sub_100011874((uint64_t)v5);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10000EEDC;
  v35[3] = &unk_100044F10;
  v35[4] = &v37;
  [v7 invalidateContentMatchMoveSourcesPassingTest:v29 additionalInvalidation:v35];

  id v8 = [(id)v44[5] keyEnumerator];
  id v9 = [v8 allObjects];
  id v10 = +[NSMutableSet setWithArray:v9];

  id v11 = [(id)v38[5] keyEnumerator];
  id v12 = [v11 allObjects];
  [v10 addObjectsFromArray:v12];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v13 = v10;
  id v14 = [v13 countByEnumeratingWithState:&v31 objects:v55 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v32;
    do
    {
      for (CFIndex i = 0; i != v14; CFIndex i = (char *)i + 1)
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(v13);
        }
        id v17 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        long long v18 = sub_100011904((uint64_t)v5);
        BOOL v19 = v17 == v18;

        if (!v19)
        {
          long long v20 = [(id)v44[5] objectForKey:v17];
          long long v21 = v20;
          if (v20)
          {
            id v22 = v20;
          }
          else
          {
            id v22 = +[NSSet set];
          }
          SEL v23 = v22;

          long long v24 = [(id)v38[5] objectForKey:v17];
          unsigned __int8 v25 = v24;
          if (v24)
          {
            id v26 = v24;
          }
          else
          {
            id v26 = +[NSSet set];
          }
          unsigned __int8 v27 = v26;

          id v28 = PSLogCommon();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            long double v50 = v17;
            __int16 v51 = 2112;
            id v52 = v23;
            __int16 v53 = 2112;
            double v54 = v27;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ - Notifying client portalSourceCollections were invalidated: %@ matchMoveSources were invalidated: %@", buf, 0x20u);
          }

          [(PUIDXPCClientController *)self->_xpcClientContextController invalidatedPortalSourceCollections:v23 matchMoveSources:v27 forClient:v17];
        }
      }
      id v14 = [v13 countByEnumeratingWithState:&v31 objects:v55 count:16];
    }
    while (v14);
  }

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);
}

- (id)_recenteringContextRelativePointerPositionForPointerClient:(id)a3
{
  id v5 = [(NSMapTable *)self->_pointerClientToClientStateMap objectForKey:a3];
  id v6 = [v5 activeHoverRegion];
  unsigned int v7 = [v6 pointerRecenteringAxes];
  if (v6) {
    BOOL v8 = (v7 & 3) == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8) {
    goto LABEL_22;
  }
  unsigned int v9 = v7;
  [v6 contentBounds];
  long long v10 = 0uLL;
  if (v5)
  {
    [v5 transformFromClientContextToDisplay];
    long long v10 = 0uLL;
  }
  memset(&a, 0, sizeof(a));
  *(_OWORD *)&b.m41 = v10;
  *(_OWORD *)&b.m43 = v10;
  *(_OWORD *)&b.m31 = v10;
  *(_OWORD *)&b.m33 = v10;
  *(_OWORD *)&b.m21 = v10;
  *(_OWORD *)&b.m23 = v10;
  *(_OWORD *)&b.m11 = v10;
  *(_OWORD *)&b.m13 = v10;
  if (CATransform3DEqualToTransform(&a, &b))
  {
    unsigned __int8 v25 = +[NSAssertionHandler currentHandler];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"transformFromClientContextToDisplay; just pulled out of clientState (%@)",
    id v26 = v5);
    [v25 handleFailureInMethod:a2, self, @"PUIDPointerController.m", 1828, @"invalid transform (all 0s) from: %@", v26 object file lineNumber description];
  }
  memset(&v30, 0, sizeof(v30));
  id v11 = sub_100011874((uint64_t)self->_activeDisplayContext);
  id v12 = v11;
  if (v11)
  {
    memset(&a, 0, sizeof(a));
    [v11 transformToLocalWindowForCoordinateSpaceTransformToDisplay:&a];
  }
  else
  {
    memset(&v30, 0, sizeof(v30));
  }

  CATransform3D a = v30;
  memset(&b, 0, sizeof(b));
  if (CATransform3DEqualToTransform(&a, &b))
  {
    unsigned __int8 v27 = +[NSAssertionHandler currentHandler];
    id v28 = sub_100011874((uint64_t)self->_activeDisplayContext);
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"transformToReferenceSpace; result from -transformToLocalWindowForCoordinateSpaceTransformToDisplay:, _pointerRenderingController (%@)",
    id v29 = v28);
    [v27 handleFailureInMethod:a2, self, @"PUIDPointerController.m", 1830, @"invalid transform (all 0s) from: %@", v29 object file lineNumber description];
  }
  CATransform3DGetDecomposition_();
  CATransform3D a = v30;
  CA_CGRectApplyTransform();
  UIRectGetCenter();
  double v14 = v13;
  double v16 = v15;
  [(PUIDPointerController *)self _pointerPositionFromPointerEvent:self->_lastPointerEvent];
  double v18 = v17;
  double v20 = v19;
  int v21 = sub_10001AE14();
  unsigned int v22 = __rbit32(v9) >> 30;
  if (!v21) {
    LOBYTE(v22) = v9;
  }
  if ((v22 & 1) == 0) {
    double v14 = v18;
  }
  if ((v22 & 2) == 0) {
    double v16 = v20;
  }
  if BSFloatApproximatelyEqualToFloat() && (BSFloatApproximatelyEqualToFloat()) {
LABEL_22:
  }
    id v23 = 0;
  else {
    id v23 = objc_msgSend(objc_alloc((Class)BKSContextRelativePoint), "initWithPoint:contextID:", sub_100011418((id *)&self->_activeDisplayContext->super.isa), v14, v16);
  }

  return v23;
}

- (void)_setShouldPeriodicallyRefreshClientTransform:(BOOL)a3
{
  if (self->_shouldPeriodicallyRefreshClientTransform != a3)
  {
    self->_shouldPeriodicallyRefreshClientTransform = a3;
    periodicClientTransformRefreshTimer = self->_periodicClientTransformRefreshTimer;
    if (a3)
    {
      if (!periodicClientTransformRefreshTimer && !self->_isPerformingPeriodicClientTransformRefresh)
      {
        [(PUIDPointerController *)self _beginPeriodicClientTransformRefreshTimer];
      }
    }
    else
    {
      [(NSTimer *)periodicClientTransformRefreshTimer invalidate];
      id v5 = self->_periodicClientTransformRefreshTimer;
      self->_periodicClientTransformRefreshTimer = 0;
    }
  }
}

- (CGPoint)_transformVelocity:(CGPoint)a3 intoCoordinateSpaceForPointerClient:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  unsigned int v7 = [(NSMapTable *)self->_pointerClientToClientStateMap objectForKey:a4];
  BOOL v8 = v7;
  long long v9 = 0uLL;
  if (v7)
  {
    [v7 transformFromClientContextToDisplay];
    long long v9 = 0uLL;
  }
  long long v21 = v9;
  long long v22 = v9;
  long long v19 = v9;
  long long v20 = v9;
  long long v17 = v9;
  long long v18 = v9;
  long long v15 = v9;
  long long v16 = v9;
  long long v10 = sub_100011874((uint64_t)self->_activeDisplayContext);
  id v11 = v10;
  if (v10)
  {
    memset(v23, 0, sizeof(v23));
    objc_msgSend(v10, "transformToLocalWindowForCoordinateSpaceTransformToDisplay:", v23, v15, v16, v17, v18, v19, v20, v21, v22);
  }

  CATransform3DGetDecomposition_();
  if (BSFloatEqualToFloat())
  {
    double v12 = -x;
  }
  else if ((BSFloatEqualToFloat() & 1) != 0 || BSFloatEqualToFloat())
  {
    double v12 = -y;
    double y = -x;
  }
  else if ((BSFloatEqualToFloat() & 1) != 0 || BSFloatEqualToFloat())
  {
    double y = -y;
    double v12 = x;
  }
  else
  {
    double v12 = y;
    double y = x;
  }

  double v13 = y;
  double v14 = v12;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (void)_requestPointerUpdate
{
}

- (void)_updatePointerWithOptions:(unint64_t)a3 updateHandlerCollection:(id)a4
{
  int v4 = a3;
  unsigned int v7 = (PUIDPointerStateUpdateHandlerCollection *)a4;
  BOOL v8 = v7;
  if (!self->_lastPointerEvent)
  {
    [(PUIDPointerStateUpdateHandlerCollection *)v7 performAllHandlersWithFinished:1 retargeted:0];
    goto LABEL_193;
  }
  SEL v158 = a2;
  int v160 = v4;
  v165 = v7;
  long long v9 = [(BKSHIDEventPointerAttributes *)self->_lastPointerEventPointerAttributes token];
  id v10 = [v9 _identifierOfCAContext];

  v163 = [(PUIDPointerController *)self _displayContextForPointerEventContextID:v10];
  if (!v163)
  {
    unsigned __int8 v27 = PSLogCommon();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.m11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Not updating pointer - the display context for the last pointer event no longer exists", (uint8_t *)&buf, 2u);
    }
    goto LABEL_19;
  }
  activeDisplayContext = self->_activeDisplayContext;
  if (!activeDisplayContext)
  {
    unsigned __int8 v27 = PSLogCommon();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.m11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Not updating pointer - the active display is nil", (uint8_t *)&buf, 2u);
    }
LABEL_19:

    [(PUIDPointerStateUpdateHandlerCollection *)v165 performAllHandlersWithFinished:1 retargeted:0];
    goto LABEL_192;
  }
  v166 = sub_100011504((id *)&activeDisplayContext->super.isa);
  v155 = sub_10001158C((id *)&self->_activeDisplayContext->super.isa);
  [(PUIDPointerController *)self _pointerPositionFromPointerEvent:self->_lastPointerEvent];
  double v14 = v13;
  double v16 = v15;
  if (v166)
  {
    long long v183 = 0u;
    long long v184 = 0u;
    long long v181 = 0u;
    long long v182 = 0u;
    long long v17 = [(NSMapTable *)self->_pointerClientToClientStateMap keyEnumerator];
    long long v18 = [v17 allObjects];

    id v19 = [v18 countByEnumeratingWithState:&v181 objects:v188 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v182;
      while (2)
      {
        for (CFIndex i = 0; i != v19; CFIndex i = (char *)i + 1)
        {
          if (*(void *)v182 != v20) {
            objc_enumerationMutation(v18);
          }
          long long v22 = *(void **)(*((void *)&v181 + 1) + 8 * i);
          unsigned int v23 = [v22 pid];
          if (v23 == [v166 pid])
          {
            long long v24 = [(NSMapTable *)self->_pointerClientToClientStateMap objectForKey:v22];
            unsigned __int8 v25 = [v24 activeHoverRegion];
            BOOL v26 = v25 == 0;

            if (!v26)
            {
              id v28 = v22;

              double v12 = v28;
              if (v28) {
                goto LABEL_46;
              }
              goto LABEL_24;
            }
          }
        }
        id v19 = [v18 countByEnumeratingWithState:&v181 objects:v188 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }
  }
LABEL_24:
  if (objc_msgSend(v155, "count", v12))
  {
    id v29 = [v155 firstObject];
    CATransform3D v30 = [(NSMapTable *)self->_pointerClientToClientStateMap objectForKey:v29];
    long long v31 = [v30 activeHoverRegion];
    BOOL v32 = v31 == 0;

    if (v32)
    {
    }
    else
    {
      long long v33 = v29;

      double v12 = v33;
      if (v33) {
        goto LABEL_46;
      }
    }
  }
  if (![(NSArray *)self->_lastPointerHitTestContexts count]) {
    goto LABEL_55;
  }
  long long v34 = [(NSArray *)self->_lastPointerHitTestContexts firstObject];
  unsigned int v35 = [v34 contextID];

  __int16 v36 = [(NSArray *)self->_lastPointerHitTestContexts firstObject];
  unsigned int v37 = [v36 pid];

  if (!v35 || v37 == -1) {
    goto LABEL_55;
  }
  long long v179 = 0u;
  long long v180 = 0u;
  long long v177 = 0u;
  long long v178 = 0u;
  __int16 v38 = [(NSMapTable *)self->_pointerClientToClientStateMap keyEnumerator];
  uint64_t v39 = [v38 allObjects];

  id v40 = [v39 countByEnumeratingWithState:&v177 objects:v187 count:16];
  if (!v40) {
    goto LABEL_54;
  }
  uint64_t v41 = *(void *)v178;
LABEL_34:
  uint64_t v42 = 0;
  while (1)
  {
    if (*(void *)v178 != v41) {
      objc_enumerationMutation(v39);
    }
    uint64_t v43 = *(void **)(*((void *)&v177 + 1) + 8 * v42);
    id v44 = sub_100011904((uint64_t)self->_activeDisplayContext);
    BOOL v45 = v43 == v44;

    if (v45 || [v43 pid] != v37) {
      goto LABEL_42;
    }
    double v46 = [(NSMapTable *)self->_pointerClientToClientStateMap objectForKey:v43];
    double v47 = [v46 activeHoverRegion];
    id v48 = v47;
    if (v47)
    {
      if ([v47 coordinateSpaceSourceContextID] == v35) {
        break;
      }
    }

LABEL_42:
    if (v40 == (id)++v42)
    {
      id v40 = [v39 countByEnumeratingWithState:&v177 objects:v187 count:16];
      if (v40) {
        goto LABEL_34;
      }
      goto LABEL_54;
    }
  }
  double v49 = v43;

  double v12 = v49;
  if (!v49) {
    goto LABEL_55;
  }
LABEL_46:
  long double v50 = v12;
  uint64_t v39 = -[NSMapTable objectForKey:](self->_pointerClientToClientStateMap, "objectForKey:");
  __int16 v51 = [v39 activeHoverRegion];
  if ((![(PUIDPointerSettings *)self->_settings isUnderlappingContentAllowed]
     || ![(PUIDPointerController *)self _underlappingContentAllowedForPointerAttributes:self->_lastPointerEventPointerAttributes])&& [(PSPointerHoverRegion *)v51 shouldPointerUnderlayContent])
  {

    long double v50 = 0;
  }
  if (!self->_hasPointerVelocityCrossedHighThreshold
    || self->_highVelocityAllowedPointerClient == v50 && self->_highVelocityAllowedHoverRegion == v51)
  {

    double v55 = v50;
    if (!v50) {
      goto LABEL_55;
    }
  }
  else
  {
    [v39 setActiveHoverRegion:0];

LABEL_54:
LABEL_55:
    uint64_t v52 = sub_100011904((uint64_t)self->_activeDisplayContext);
    highVelocityAllowedPointerClient = self->_highVelocityAllowedPointerClient;
    self->_highVelocityAllowedPointerClient = 0;

    highVelocityAllowedHoverRegion = self->_highVelocityAllowedHoverRegion;
    self->_highVelocityAllowedHoverRegion = 0;

    double v55 = (PUIDPointerClient *)v52;
  }
  previousPointerClient = self->_previousPointerClient;
  if (previousPointerClient != v55 && previousPointerClient)
  {
    double v57 = v55;
    long double v58 = -[NSMapTable objectForKey:](self->_pointerClientToClientStateMap, "objectForKey:");
    [v58 invalidateAutomaticRegionExitTimer];

    double v55 = v57;
  }
  obj = v55;
  v164 = [(NSMapTable *)self->_pointerClientToClientStateMap objectForKey:v55];
  long double v59 = [v164 activeHoverRegion];
  pointerClientToClientStateMap = self->_pointerClientToClientStateMap;
  uint64_t v61 = sub_100011904((uint64_t)self->_activeDisplayContext);
  id v62 = [(NSMapTable *)pointerClientToClientStateMap objectForKey:v61];
  v157 = [v62 activeHoverRegion];

  sub_100011904((uint64_t)self->_activeDisplayContext);
  id v63 = (PUIDPointerClient *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v61) = obj == v63;

  if (v61)
  {
    uint64_t v69 = 1;
  }
  else if (v59)
  {
    [v59 hitTestBounds];
    CGFloat x = v190.origin.x;
    CGFloat y = v190.origin.y;
    CGFloat width = v190.size.width;
    CGFloat height = v190.size.height;
    if (CGRectIsEmpty(v190)
      || (v191.origin.CGFloat x = x, v191.origin.y = y, v191.size.width = width, v191.size.height = height, CGRectIsNull(v191)))
    {
      [v59 contentBounds];
    }
    memset(&buf, 0, sizeof(buf));
    long long v68 = sub_100011874((uint64_t)self->_activeDisplayContext);
    if (v164)
    {
      [v164 transformFromClientContextToDisplay];
      if (v68) {
        goto LABEL_66;
      }
LABEL_72:
      memset(&buf, 0, sizeof(buf));
    }
    else
    {
      memset(v176, 0, sizeof(v176));
      if (!v68) {
        goto LABEL_72;
      }
LABEL_66:
      [v68 transformToLocalWindowForCoordinateSpaceTransformToDisplay:v176];
    }

    CATransform3D b = buf;
    CA_CGRectApplyTransform();
    v189.CGFloat x = v14;
    v189.CGFloat y = v16;
    if (CGRectContainsPoint(v192, v189)) {
      uint64_t v69 = 1;
    }
    else {
      uint64_t v69 = 2;
    }
  }
  else
  {
    uint64_t v69 = 0;
  }
  id v70 = [v164 previousPointerEventActiveHoverRegionHitTestState];
  [v164 setPreviousPointerEventActiveHoverRegionHitTestState:v69];
  if (v69 == 2 && v70 == (id)1)
  {
    objc_initWeak((id *)&buf, self);
    [(PUIDPointerSettings *)self->_settings automaticRegionExitDelayInterval];
    double v72 = v71;
    v174[0] = _NSConcreteStackBlock;
    v174[1] = 3221225472;
    v174[2] = sub_10001098C;
    v174[3] = &unk_100044F38;
    objc_copyWeak(&v175, (id *)&buf);
    [v164 startAutomaticRegionExitTimerWithDelayInterval:v174 fireHandler:v72];
    objc_destroyWeak(&v175);
    objc_destroyWeak((id *)&buf);
  }
  else if (v70 != (id)2)
  {
    [v164 invalidateAutomaticRegionExitTimer];
  }
  if (self->_pointerIsAutohidden)
  {
    uint64_t v154 = 0;
    BOOL v73 = !self->_pointerForcedVisibleByEntitledClient;
  }
  else
  {
    BOOL v73 = self->_pointerHiddenByEntitledClient && !self->_pointerForcedVisibleByEntitledClient;
    uint64_t v74 = 1;
    if (self->_hasPointerVelocityCrossedHighThreshold) {
      uint64_t v74 = 2;
    }
    uint64_t v154 = v74;
  }
  v75 = objc_alloc_init(PUIDMutablePointerState);
  -[PUIDMutablePointerState setModelPointerReferencePosition:](v75, "setModelPointerReferencePosition:", v14, v16);
  [v59 contentBounds];
  -[PUIDMutablePointerState setContentBounds:](v75, "setContentBounds:");
  [v59 contentHoverInverseScale];
  -[PUIDMutablePointerState setContentHoverInverseScale:](v75, "setContentHoverInverseScale:");
  v156 = [v59 pointerPortalSourceCollection];
  unsigned int v76 = [v59 shouldPointerUnderlayContent];
  if (v156) {
    unsigned int v77 = v76;
  }
  else {
    unsigned int v77 = 0;
  }
  if (v77 == 1)
  {
    v78 = sub_100011874((uint64_t)self->_activeDisplayContext);
    unsigned int v79 = [v78 isValidPointerPortalSourceCollection:v156 forClient:obj];

    if (v79)
    {
      v80 = [v59 pointerPortalSourceCollection];
      [(PUIDMutablePointerState *)v75 setPointerPortalSourceCollection:v80];

      v81 = [v59 contentMatchMoveSource];
      [(PUIDMutablePointerState *)v75 setContentMatchMoveSource:v81];

      uint64_t v82 = 1;
      self->_focusedOnItem = 1;
      goto LABEL_105;
    }
  }
  v83 = [v157 pointerPortalSourceCollection];
  [(PUIDMutablePointerState *)v75 setPointerPortalSourceCollection:v83];

  v84 = [v157 contentMatchMoveSource];
  [(PUIDMutablePointerState *)v75 setContentMatchMoveSource:v84];

  self->_focusedOnItem = 0;
  if ([(PUIDPointerState *)self->_previousPointerState isPointerUnderlayingContent])
  {
    [(PUIDPointerState *)self->_previousPointerState pointerVisualIntensity];
    if (BSFloatIsZero())
    {
      v85 = v164;
      if (self->_deferMaterialChanges)
      {
        uint64_t v82 = 0;
        goto LABEL_106;
      }
      self->_deferMaterialChanges = 1;
      v86 = PSLogMaterial();
      if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG)) {
        sub_100028390(v86);
      }

      v87 = [(PUIDPointerStateUpdateHandlerCollection *)v165 shapeTransitionCompletion];
      if (!v165) {
        v165 = objc_alloc_init(PUIDPointerStateUpdateHandlerCollection);
      }
      v172[0] = _NSConcreteStackBlock;
      v172[1] = 3221225472;
      v172[2] = sub_100010A14;
      v172[3] = &unk_100044A20;
      v172[4] = self;
      id v88 = v87;
      id v173 = v88;
      v89 = objc_retainBlock(v172);
      [(PUIDPointerStateUpdateHandlerCollection *)v165 setShapeTransitionCompletion:v89];
    }
  }
  uint64_t v82 = 0;
LABEL_105:
  v85 = v164;
LABEL_106:
  memset(&v171[2], 0, 128);
  if (v85) {
    [v164 transformFromClientContextToDisplay];
  }
  CATransform3D buf = *(CATransform3D *)&v171[2];
  memset(&b, 0, sizeof(b));
  if (CATransform3DEqualToTransform(&buf, &b))
  {
    v150 = +[NSAssertionHandler currentHandler];
    v151 = +[NSString stringWithFormat:@"Setting pointerState value from pointerClientState (%@), in -_updatePointerWithTransitionCompletion:", v164];
    [v150 handleFailureInMethod:v158, self, @"PUIDPointerController.m", 2133, @"invalid transform (all 0s) from: %@", v151 object file lineNumber description];
  }
  CATransform3D buf = *(CATransform3D *)&v171[2];
  [(PUIDMutablePointerState *)v75 setClientCoordinateSpaceTransformToDisplay:&buf];
  [(PUIDMutablePointerState *)v75 setPointerAutoHidden:v73];
  if (self->_deferMaterialChanges || ([v59 pointerVisualIntensity], BSFloatIsZero()))
  {
    id v90 = [(PUIDPointerState *)self->_previousPointerState pointerMaterialLuminance];
    goto LABEL_113;
  }
  id v91 = [v59 preferredPointerMaterialLuminance];
  if (v91) {
    char v140 = v82;
  }
  else {
    char v140 = 0;
  }
  if (v140)
  {
    unsigned int v153 = 0;
  }
  else
  {
    id v90 = objc_msgSend(v157, "preferredPointerMaterialLuminance", v91);
LABEL_113:
    id v91 = v90;
    unsigned int v153 = 1;
  }
  [(PUIDMutablePointerState *)v75 setPointerMaterialLuminance:v91];
  if ([(PUIDPointerSettings *)self->_settings isPointerSlipEnabled])
  {
    v159 = [v59 pointerSlipValue];
  }
  else
  {
    v159 = 0;
  }
  v92 = [v59 contentSlipValue];
  if (self->_latchingState && [v59 isLatching])
  {
    unsigned __int8 v93 = [v59 pointerLatchingAxes];
    [v159 CGPointValue];
    double v95 = v94;
    double v97 = v96;
    [v92 CGPointValue];
    if ((v93 & 2) != 0) {
      double v100 = 1.0;
    }
    else {
      double v100 = v97;
    }
    if ((v93 & 2) != 0) {
      double v101 = 0.0;
    }
    else {
      double v101 = v99;
    }
    if (v93) {
      double v102 = 1.0;
    }
    else {
      double v102 = v95;
    }
    if (v93) {
      double v103 = 0.0;
    }
    else {
      double v103 = v98;
    }
    *(double *)v171 = v102;
    *(double *)&v171[1] = v100;
    uint64_t v104 = +[NSValue valueWithBytes:v171 objCType:"{CGPoint=dd}"];

    *(double *)v170 = v103;
    *(double *)&v170[1] = v101;
    uint64_t v105 = +[NSValue valueWithBytes:v170 objCType:"{CGPoint=dd}"];

    v159 = (void *)v104;
    v92 = (void *)v105;
  }
  v106 = [v59 pointerShape];
  [(PUIDMutablePointerState *)v75 setPointerShape:v106];

  [(PUIDMutablePointerState *)v75 setPointerSlipValue:v159];
  [v59 pointerVisualIntensity];
  -[PUIDMutablePointerState setPointerVisualIntensity:](v75, "setPointerVisualIntensity:");
  if (v73) {
    id v107 = 0;
  }
  else {
    id v107 = [v59 overlayEffectStyle];
  }
  [(PUIDMutablePointerState *)v75 setOverlayEffectStyle:v107];
  [(PUIDMutablePointerState *)v75 setContentSlipValue:v92];
  [(PUIDMutablePointerState *)v75 setPointerUnderlayingContent:v82];
  -[PUIDMutablePointerState setSuppressPointerMirroring:](v75, "setSuppressPointerMirroring:", [v59 shouldPointerSuppressMirroring]);
  uint64_t v108 = [v59 accessories];
  [(PUIDMutablePointerState *)v75 setAccessories:v108];

  sub_100011904((uint64_t)self->_activeDisplayContext);
  v109 = (PUIDPointerClient *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v108) = obj == v109;

  if (v108)
  {
    CFStringRef v112 = @"System Pointer Client";
  }
  else
  {
    v110 = [(PUIDPointerClient *)obj auditToken];
    uint64_t v111 = [v110 bundleID];

    CFStringRef v112 = (const __CFString *)v111;
  }
  v152 = (__CFString *)v112;
  -[PUIDMutablePointerState setDebugRequestingClientString:](v75, "setDebugRequestingClientString:");
  if (self->_lastPointerEvent) {
    BOOL v113 = IOHIDEventGetIntegerValue() != 0;
  }
  else {
    BOOL v113 = 0;
  }
  if (!self->_pointerPressedStateIsLockedOut || v113)
  {
    [(PUIDMutablePointerState *)v75 setPressed:v113];
    if (v113 != [(PUIDPointerState *)self->_previousPointerState isPressed])
    {
      pointerUnpressedStateIsLockedOut = self->_pointerUnpressedStateIsLockedOut;
      self->_pointerPressedStateIsLockedOut = 1;
      [(NSTimer *)pointerUnpressedStateIsLockedOut invalidate];
      v115 = self->_pointerUnpressedStateIsLockedOut;
      self->_pointerUnpressedStateIsLockedOut = 0;

      objc_initWeak((id *)&buf, self);
      [(PUIDPointerSettings *)self->_settings tapToClickButtonDownTime];
      double v117 = v116;
      v168[0] = _NSConcreteStackBlock;
      v168[1] = 3221225472;
      v168[2] = sub_100010AA0;
      v168[3] = &unk_100044CB0;
      objc_copyWeak(&v169, (id *)&buf);
      v118 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v168 block:v117];
      v119 = self->_pointerUnpressedStateIsLockedOut;
      self->_pointerUnpressedStateIsLockedOut = v118;

      objc_destroyWeak(&v169);
      objc_destroyWeak((id *)&buf);
    }
  }
  else
  {
    [(PUIDMutablePointerState *)v75 setPressed:[(PUIDPointerState *)self->_previousPointerState isPressed]];
  }
  previousPointerState = self->_previousPointerState;
  BOOL hasSetupPointerState = self->_hasSetupPointerState;
  self->_BOOL hasSetupPointerState = 1;
  if (previousPointerState)
  {
    id v122 = [(PUIDPointerState *)previousPointerState pointerMaterialLuminance];
    if (v122 == (id)2) {
      uint64_t v123 = 2;
    }
    else {
      uint64_t v123 = v122 == (id)1;
    }
  }
  else
  {
    uint64_t v123 = 0;
  }
  v124 = sub_1000118A4((uint64_t)self->_activeDisplayContext);
  [v124 setSamplingLuma:v153 seedingWithLumaLevel:v123];

  [(PUIDXPCClientController *)self->_xpcClientContextController setClientInteractionState:v154];
  objc_storeStrong((id *)&self->_previousPointerState, v75);
  objc_storeStrong((id *)&self->_previousPointerClient, obj);
  if (v73 | [(PUIDPointerSettings *)self->_settings shouldPeriodicallyRefreshClientTransform] ^ 1)
  {
    uint64_t v125 = 0;
  }
  else
  {
    v126 = [(PUIDPointerController *)self _systemPointerClients];
    unsigned int v127 = [v126 containsObject:self->_previousPointerClient];

    uint64_t v125 = v127 ^ 1;
  }
  [(PUIDPointerController *)self _setShouldPeriodicallyRefreshClientTransform:v125];
  if ((v160 & 2) == 0 && hasSetupPointerState) {
    uint64_t v128 = 3;
  }
  else {
    uint64_t v128 = 0;
  }
  v129 = sub_100011874((uint64_t)self->_activeDisplayContext);
  id v167 = 0;
  unsigned __int8 v130 = [v129 setPointerState:v75 options:(2 * v160) & 8 | (4 * (v160 & 1)) | v128 updateHandlerCollection:v165 error:&v167];
  id v161 = v167;

  if ((v130 & 1) == 0)
  {
    v131 = [v161 domain];
    if ([v131 isEqual:@"PUIDPointerRenderingRootViewControllerErrorDomain"])
    {
      BOOL v132 = [v161 code] == (id)-1002;

      if (v132)
      {
        v133 = PSLogCommon();
        if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf.m11) = 0;
          _os_log_impl((void *)&_mh_execute_header, v133, OS_LOG_TYPE_DEFAULT, "Refreshing client transform in case it was invalid", (uint8_t *)&buf, 2u);
        }

        [(PUIDPointerController *)self _refreshClientTransformWithReason:2];
      }
    }
    else
    {
    }
  }
  if (v82 && [(PUIDPointerSettings *)self->_settings shouldRecenterOnButtonDown])
  {
    v134 = [(PUIDPointerController *)self _recenteringContextRelativePointerPositionForPointerClient:obj];
    if (v134)
    {
      LODWORD(v135) = [(PUIDPointerClient *)obj pid];
      if (v135 == [v166 pid]) {
        uint64_t v135 = 0xFFFFFFFFLL;
      }
      else {
        uint64_t v135 = v135;
      }
      v136 = [PUIDPointerRecenteringContext alloc];
      v137 = sub_100011838((id *)&self->_activeDisplayContext->super.isa);
      v138 = [v137 hardwareIdentifier];
      v139 = [(PUIDPointerRecenteringContext *)v136 initWithContextRelativePointerPosition:v134 displayUUID:v138 restrictingToPID:v135];
    }
    else
    {
      v139 = 0;
    }
  }
  else
  {
    v139 = 0;
  }
  if (self->_isButtonPressDownTransition)
  {
    v141 = PSLogCommon();
    if (os_log_type_enabled(v141, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf.m11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v141, OS_LOG_TYPE_INFO, "Resetting pointer velocity on button press", (uint8_t *)&buf, 2u);
    }

    [(PUIDPointerController *)self _resetPointerVelocity];
  }
  if ((BSEqualObjects() & 1) == 0)
  {
    [(BSInvalidatable *)self->_buttonDownRepositionAssertion invalidate];
    buttonDownRepositionAssertion = self->_buttonDownRepositionAssertion;
    self->_buttonDownRepositionAssertion = 0;

    if (v139)
    {
      unsigned int v143 = [(PUIDPointerRecenteringContext *)v139 restrictingToPID];
      if (v143 == [v166 pid]) {
        uint64_t v144 = 0xFFFFFFFFLL;
      }
      else {
        uint64_t v144 = v143;
      }
      v145 = +[BKSMousePointerService sharedInstance];
      v146 = [(PUIDPointerRecenteringContext *)v139 contextRelativePointerPosition];
      v147 = [(PUIDPointerRecenteringContext *)v139 displayUUID];
      v148 = [v145 acquireButtonDownPointerRepositionAssertionForReason:@"com.apple.pointeruid.PUIDPointerController" contextRelativePointerPosition:v146 onDisplay:v147 restrictingToPID:v144];
      v149 = self->_buttonDownRepositionAssertion;
      self->_buttonDownRepositionAssertion = v148;
    }
    objc_storeStrong((id *)&self->_buttonDownRepositionAssertionContext, v139);
  }

LABEL_192:
  BOOL v8 = v165;
LABEL_193:
}

- (void)_updateServiceKeepAlive
{
  NSUInteger v3 = [(NSMapTable *)self->_pointerClientToWantsServiceKeepAliveMap count];
  transaction = self->_transaction;
  if (v3)
  {
    if (!transaction)
    {
      id v5 = (OS_os_transaction *)os_transaction_create();
      id v6 = self->_transaction;
      self->_transaction = v5;

      unsigned int v7 = PSLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Asserting pointeruid active.", v9, 2u);
      }
    }
  }
  else if (transaction)
  {
    [(PUIDPointerController *)self _hidePointerForReason:@"no service keep-alives"];
    BOOL v8 = self->_transaction;
    self->_transaction = 0;
  }
}

- (BOOL)_underlappingContentAllowedForPointerAttributes:(id)a3
{
  return 1;
}

- (void)_transformForLayer:(unint64_t)a3 inContext:(unsigned int)a4 queue:(id)a5 completion:(id)a6
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010CDC;
  block[3] = &unk_100044F60;
  unsigned int v12 = a4;
  id v10 = a6;
  unint64_t v11 = a3;
  id v8 = v10;
  dispatch_async((dispatch_queue_t)a5, block);
}

- (CGPoint)_pointerPositionFromPointerEvent:(__IOHIDEvent *)a3
{
  IOHIDEventGetFloatMultiple();
  double v3 = v5;
  double v4 = v6;
  result.CGFloat y = v4;
  result.CGFloat x = v3;
  return result;
}

- (PUIDPointerSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (PUIDDisplayContext)activeDisplayContext
{
  return self->_activeDisplayContext;
}

- (void)setActiveDisplayContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_activeGestureResetTimer, 0);
  objc_storeStrong((id *)&self->_periodicClientTransformRefreshTimer, 0);
  objc_storeStrong((id *)&self->_delayedMouseRecenteringTimer, 0);
  objc_storeStrong((id *)&self->_provisionalPromotionTimer, 0);
  objc_storeStrong((id *)&self->_delayedPointerUnhideTimer, 0);
  objc_storeStrong((id *)&self->_autohidePointerTimer, 0);
  objc_storeStrong((id *)&self->_lockedContext, 0);
  objc_storeStrong((id *)&self->_pointerUnpressedStateIsLockedOut, 0);
  objc_storeStrong((id *)&self->_globalDevicePreferencesObservationAssertion, 0);
  objc_storeStrong((id *)&self->_globalDevicePreferences, 0);
  objc_storeStrong((id *)&self->_buttonDownRepositionAssertionContext, 0);
  objc_storeStrong((id *)&self->_buttonDownRepositionAssertion, 0);
  objc_storeStrong((id *)&self->_touchHistory, 0);
  objc_storeStrong((id *)&self->_highVelocityAllowedHoverRegion, 0);
  objc_storeStrong((id *)&self->_highVelocityAllowedPointerClient, 0);
  objc_storeStrong((id *)&self->_previousPointerClient, 0);
  objc_storeStrong((id *)&self->_previousPointerState, 0);
  objc_storeStrong((id *)&self->_xpcClientContextController, 0);
  objc_storeStrong((id *)&self->_transformUpdateQueue, 0);
  objc_storeStrong((id *)&self->_pointerEventStreamProvider, 0);
  objc_storeStrong((id *)&self->_lastPointerHitTestContexts, 0);
  objc_storeStrong((id *)&self->_lastPointerEventPointerAttributes, 0);
  objc_storeStrong((id *)&self->_pointerClientToWantsServiceKeepAliveMap, 0);
  objc_storeStrong((id *)&self->_pointerClientToClientStateMap, 0);
  objc_storeStrong((id *)&self->_activeDisplayContext, 0);
  objc_storeStrong((id *)&self->_hoverRegionOverridingClientsByDisplay, 0);
  objc_storeStrong((id *)&self->_systemPointerInteractionContextByDisplay, 0);
  objc_storeStrong((id *)&self->_displayContextsByDisplay, 0);
  objc_storeStrong((id *)&self->_displayContextFactory, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end