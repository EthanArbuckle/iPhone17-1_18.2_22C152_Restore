@interface BKMousePointerController
+ (id)standardConfiguration;
- (BKHIDClientConnectionManager)HIDConnectionManager;
- (BKMousePointerController)init;
- (BKMousePointerController)initWithConfiguration:(id)a3;
- (BKSLocalDefaults)localDefaults;
- (BKSMousePointerDevicePreferences)globalDevicePreferences;
- (BOOL)destinationPIDMatchesHapticFeedbackRequestPID:(int)a3;
- (BOOL)eventsDisabled;
- (CGPoint)globalPointerPosition;
- (CGPoint)normalizedGlobalPointerPosition;
- (NSArray)availableDevices;
- (id)acquireButtonDownPointerRepositionAssertionForReason:(id)a3 contextRelativePointerPosition:(id)a4 onDisplay:(id)a5 restrictingToPID:(int)a6;
- (id)suppressPointerModelUpdatesAssertionForDisplay:(id)a3 reason:(id)a4;
- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5;
- (void)_displayLinkFired:(id)a3;
- (void)addGlobalDevicePreferencesObserver:(id)a3;
- (void)addLifecycleObserver:(id)a3;
- (void)dealloc;
- (void)display:(id)a3 didBecomeBlank:(BOOL)a4;
- (void)getHitTestContextsAtPoint:(id)a3 withAdditionalContexts:(id)a4 onDisplay:(id)a5 withCompletion:(id)a6;
- (void)globalKeyboardModifiersDidChange:(int64_t)a3;
- (void)hitTestRegionsDidChange:(id)a3 forDisplayUUID:(id)a4;
- (void)invalidate;
- (void)monitor:(id)a3 activeDisplayPropertiesDidChange:(id)a4;
- (void)monitor:(id)a3 displayDidBecomeActive:(id)a4;
- (void)monitor:(id)a3 displayDidBecomeInactive:(id)a4;
- (void)mousePointerDeviceAvailabilityMonitorDidChangeAvailability:(id)a3;
- (void)mousePointerIOHIDServicesAdded:(id)a3;
- (void)mousePointerIOHIDServicesRemoved:(id)a3;
- (void)orientationManager:(id)a3 deviceOrientationMayHaveChanged:(int64_t)a4 changeSource:(int64_t)a5 isDeviceOrientationLocked:(BOOL)a6;
- (void)removeGlobalDevicePreferencesObserver:(id)a3;
- (void)removeLifecycleObserver:(id)a3;
- (void)setContextRelativePointerPosition:(id)a3 onDisplay:(id)a4 withAnimationParameters:(id)a5 restrictingToPID:(int)a6 auditPID:(int)a7;
- (void)setContextRelativePointerPosition:(id)a3 withInitialVelocity:(id)a4 onDisplay:(id)a5 withDecelerationRate:(double)a6 restrictingToPID:(int)a7 auditPID:(int)a8;
- (void)setDisplayArrangement:(id)a3;
- (void)setEventsDisabled:(BOOL)a3 pid:(int)a4;
- (void)setGlobalDevicePreferences:(id)a3;
- (void)setGlobalPointerEventRoutes:(id)a3 forPID:(int)a4 displayUUID:(id)a5;
- (void)setGlobalPointerPosition:(CGPoint)a3 process:(id)a4;
- (void)setGlobalPointerPosition:(CGPoint)a3 synthesizeEvents:(BOOL)a4 process:(id)a5;
- (void)setHIDConnectionManager:(id)a3;
- (void)setLocalDefaults:(id)a3;
- (void)setPointerPosition:(CGPoint)a3 onDisplay:(id)a4 withAnimationParameters:(id)a5 auditPID:(int)a6;
- (void)setPreferences:(id)a3 forDevice:(id)a4;
- (void)smartCoverStateDidChange:(int)a3;
- (void)stopRoutingGlobalEventsForPID:(int)a3;
@end

@implementation BKMousePointerController

- (NSArray)availableDevices
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  v4 = [(BKMousePointerDeviceAvailabilityMonitor *)self->_pointerDeviceAvailabilityMonitor deviceServices];
  id v5 = [v4 copy];

  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v5;
}

- (void)hitTestRegionsDidChange:(id)a3 forDisplayUUID:(id)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  if ([(NSSet *)self->_lastEventContexts count])
  {
    v7 = [(BKMousePointerRegion *)self->_pointerRegion displayUUID];
    id v8 = a4;
    id v9 = [v8 length];
    v10 = (void *)BKSDisplayUUIDMainKey;
    if (v9) {
      v10 = v8;
    }
    id v11 = v10;

    unsigned int v12 = [v7 isEqual:v11];
    if (v12)
    {
      v13 = (void *)mach_absolute_time();
      sub_10006C518((uint64_t)self, v13, 1);
    }
  }

  os_unfair_lock_unlock(p_lock);
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  id v8 = *a3;
  if ([a4 eventSource] - 11 <= 1)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    id v10 = [a4 displayUUID];
    id v11 = [v10 length];
    unsigned int v12 = (void *)BKSDisplayUUIDMainKey;
    if (v11) {
      unsigned int v12 = v10;
    }
    id v13 = v12;

    v14 = [(BKMousePointerRegion *)self->_pointerRegion displayUUID];
    unsigned __int8 v15 = [v13 isEqual:v14];

    if ((v15 & 1) == 0)
    {
      v16 = BKLogMousePointer();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = [a4 displayUUID];
        v18 = [(BKMousePointerRegion *)self->_pointerRegion displayUUID];
        *(_DWORD *)buf = 138543618;
        v54 = v17;
        __int16 v55 = 2114;
        v56 = v18;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "processEvent senderDisplayUUID %{public}@ pointerdisplayUUID %{public}@", buf, 0x16u);
      }
      os_unfair_lock_assert_owner(&self->_lock);
      v19 = (NSString *)v13;
      v20 = v19;
      if (!v19) {
        v20 = self->_mainDisplayUUID;
      }
      v21 = [(NSDictionary *)self->_regionArrangementByDisplayUUID objectForKeyedSubscript:v19];
      sub_10006D7FC((uint64_t)self, v21);
    }
    unsigned int v22 = sub_10006C01C((const os_unfair_lock *)self);
    os_unfair_lock_unlock(&self->_lock);
    if (v22)
    {
      v23 = BKLogMousePointer();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "ignoring events because policy", buf, 2u);
      }

      int64_t v24 = 1;
      goto LABEL_58;
    }
    sub_10006F2B4((uint64_t)self);
    unsigned int v25 = [a4 eventSource];
    int Type = IOHIDEventGetType();
    if (v25 == 12)
    {
      int64_t v24 = 1;
      if ((Type - 6) < 2 || Type == 11) {
        goto LABEL_58;
      }
      if (Type == 17)
      {
        os_unfair_lock_lock(&self->_lock);
        if (self->_pointerRegion)
        {
          if (IOHIDEventGetType() != 17)
          {
            v41 = +[NSString stringWithFormat:@"must be a pointer event"];
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              v42 = NSStringFromSelector("_processTopLevelTrackpadEvent:sender:dispatcher:");
              v43 = (objc_class *)objc_opt_class();
              v44 = NSStringFromClass(v43);
              *(_DWORD *)buf = 138544642;
              v54 = v42;
              __int16 v55 = 2114;
              v56 = v44;
              __int16 v57 = 2048;
              v58 = self;
              __int16 v59 = 2114;
              CFStringRef v60 = @"BKMousePointerController.m";
              __int16 v61 = 1024;
              int v62 = 3338;
              __int16 v63 = 2114;
              v64 = v41;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
            }
            [v41 UTF8String];
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x10001A7A0);
          }
          [(BKMouseEventAccumulator *)self->_eventAccumulator addTopLevelEvent:v8 fromSender:a4];
          [(BKMousePointerAnnotationController *)self->_annotationController didReceiveEventFromDevice];
          v27 = [(BKMouseEventAccumulator *)self->_eventAccumulator digitizerEvents];
          if ([v27 count])
          {
            v28 = [(BKMousePointerRegion *)self->_pointerRegion displayUUID];
            if (BSEqualObjects()) {
              +[BKSHIDEventDisplay builtinDisplay];
            }
            else {
            v30 = +[BKSHIDEventDisplay displayWithHardwareIdentifier:v28];
            }
            if (self->_touchPadManager)
            {
              v45 = v28;
              v46 = v27;
              id v47 = v13;
              long long v51 = 0u;
              long long v52 = 0u;
              long long v49 = 0u;
              long long v50 = 0u;
              v31 = v27;
              id v32 = [v31 countByEnumeratingWithState:&v49 objects:buf count:16];
              if (v32)
              {
                id v33 = v32;
                uint64_t v34 = *(void *)v50;
                do
                {
                  for (i = 0; i != v33; i = (char *)i + 1)
                  {
                    if (*(void *)v50 != v34) {
                      objc_enumerationMutation(v31);
                    }
                    *(void *)v48 = *(void *)(*((void *)&v49 + 1) + 8 * i);
                    [(BKTouchPadManager *)self->_touchPadManager processEvent:v48 sender:a4 display:v30 dispatcher:a5];
                  }
                  id v33 = [v31 countByEnumeratingWithState:&v49 objects:buf count:16];
                }
                while (v33);
              }

              v27 = v46;
              id v13 = v47;
              v28 = v45;
            }
          }
          if ([(BKMouseEventAccumulator *)self->_eventAccumulator eventTypeMask])
          {
            if ((id)[(BKMouseEventAccumulator *)self->_eventAccumulator positionType] == (id)1) {
              ++self->_pointerAnimationRevisionID;
            }
            if ([(BKMouseEventAccumulator *)self->_eventAccumulator touchingPathIndexesDidChange])
            {
              v36 = [(BKMouseEventAccumulator *)self->_eventAccumulator touchingPathIndexes];
              id v37 = [v36 count];

              if (v37) {
                ++self->_pointerAnimationRevisionID;
              }
            }
            sub_10006F420((uint64_t)self);
            TimeStamp = (void *)IOHIDEventGetTimeStamp();
            sub_10006C518((uint64_t)self, TimeStamp, 1);
          }
          else
          {
            v39 = BKLogMousePointer();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)v48 = 0;
              _os_log_debug_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "no relevant subevents in trackpad collection; ignoring event",
                v48,
                2u);
            }
          }
          os_unfair_lock_unlock(p_lock);
          int64_t v24 = 1;
        }
        else
        {
          os_unfair_lock_unlock(&self->_lock);
          v27 = BKLogMousePointer();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "ignoring trackpad event; display layout hasn't been initialized",
              buf,
              2u);
          }
          int64_t v24 = 0;
        }

        goto LABEL_58;
      }
      goto LABEL_28;
    }
    switch(Type)
    {
      case 6:
        os_unfair_lock_lock(&self->_lock);
        [(BKMouseEventAccumulator *)self->_eventAccumulator addTopLevelScrollEvent:v8 fromSender:a4];
        sub_10006F420((uint64_t)self);
        break;
      case 7:
        os_unfair_lock_lock(&self->_lock);
        [(BKMouseEventAccumulator *)self->_eventAccumulator addTopLevelScaleEvent:v8 fromSender:a4];
        break;
      case 17:
        os_unfair_lock_assert_not_owner(&self->_lock);
        os_unfair_lock_lock(&self->_lock);
        [(BKMouseEventAccumulator *)self->_eventAccumulator addTopLevelEvent:v8 fromSender:a4];
        sub_10006F420((uint64_t)self);
        [(BKMousePointerAnnotationController *)self->_annotationController didReceiveEventFromDevice];
        break;
      default:
LABEL_28:
        int64_t v24 = 0;
LABEL_58:

        return v24;
    }
    v29 = (void *)IOHIDEventGetTimeStamp();
    int64_t v24 = 1;
    sub_10006C518((uint64_t)self, v29, 1);
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_58;
  }
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_HIDConnectionManager, 0);
  objc_storeStrong((id *)&self->_localDefaults, 0);
  objc_storeStrong((id *)&self->_modelUpdateSuppressionAssertionsByDisplayID, 0);
  objc_storeStrong((id *)&self->_hitTestContextsPinnedByMouse, 0);
  objc_storeStrong((id *)&self->_globalContextsPinnedByMouse, 0);
  objc_storeStrong((id *)&self->_globalEventRoutesByDisplayID, 0);
  objc_storeStrong((id *)&self->_buttonDownRepositionAssertions, 0);
  objc_storeStrong((id *)&self->_globalDevicePreferencesObservers, 0);
  objc_storeStrong((id *)&self->_statisticsLogger, 0);
  objc_storeStrong((id *)&self->_lifecycleObservers, 0);
  objc_storeStrong((id *)&self->_ipcServer_do_not_access_directly, 0);
  objc_storeStrong((id *)&self->_annotationController, 0);
  objc_storeStrong((id *)&self->_smartCoverObservationAssertion, 0);
  objc_storeStrong((id *)&self->_keyboardEventObservationAssertion, 0);
  objc_storeStrong((id *)&self->_displayBlankingObservationAssertion, 0);
  objc_storeStrong((id *)&self->_orientationManagerObservationAssertion, 0);
  objc_storeStrong((id *)&self->_orientationManager, 0);
  objc_storeStrong((id *)&self->_displayController, 0);
  objc_storeStrong((id *)&self->_smartCoverEventProcessor, 0);
  objc_storeStrong((id *)&self->_keyboardEventProcessor, 0);
  objc_storeStrong((id *)&self->_touchPadManager, 0);
  objc_storeStrong((id *)&self->_senderPropertiesBySenderID, 0);
  objc_storeStrong((id *)&self->_lastEventContexts, 0);
  objc_storeStrong((id *)&self->_eventAccumulator, 0);
  objc_storeStrong((id *)&self->_displayLinkPauseTimer, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_disableEventsPIDs, 0);
  objc_storeStrong((id *)&self->_activePointerAnimations, 0);
  objc_storeStrong((id *)&self->_pointerRegion, 0);
  objc_storeStrong((id *)&self->_regionArrangement, 0);
  objc_storeStrong((id *)&self->_displayArrangement, 0);
  objc_storeStrong((id *)&self->_interestingDisplays, 0);
  objc_storeStrong((id *)&self->_regionArrangementByDisplayUUID, 0);
  objc_storeStrong((id *)&self->_regionArrangementByCoalitionID, 0);
  objc_storeStrong((id *)&self->_mainDisplayUUID, 0);
  objc_storeStrong((id *)&self->_displayMonitorObservingAssertion, 0);
  objc_storeStrong((id *)&self->_displayMonitor, 0);
  objc_storeStrong((id *)&self->_analyticsReporter, 0);
  objc_storeStrong((id *)&self->_pointerDeviceAvailabilityMonitor, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_pointerDeviceAvailabilityMonitorQueue, 0);
}

- (void)setHIDConnectionManager:(id)a3
{
}

- (BKHIDClientConnectionManager)HIDConnectionManager
{
  return self->_HIDConnectionManager;
}

- (void)setLocalDefaults:(id)a3
{
}

- (BKSLocalDefaults)localDefaults
{
  return self->_localDefaults;
}

- (BOOL)eventsDisabled
{
  return self->_eventsDisabled;
}

- (void)_displayLinkFired:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = (void *)mach_absolute_time();
  sub_100067884((const os_unfair_lock *)self, v6);
  id v7 = [(NSMutableArray *)self->_activePointerAnimations copy];
  if (self->_displayLinkPaused)
  {
    self->_displayLinkPaused = 0;
    os_unfair_lock_unlock(p_lock);
    unint64_t displayLinkPauseTime = self->_displayLinkPauseTime;
    unint64_t displayLinkUnpauseTime = self->_displayLinkUnpauseTime;
    uint64_t v10 = mach_absolute_time();
    unint64_t v11 = self->_displayLinkUnpauseTime;
    unsigned int v12 = BKLogMousePointer();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      double v24 = (float)((float)(displayLinkUnpauseTime - displayLinkPauseTime) / 24000000.0);
      __int16 v25 = 2048;
      double v26 = (float)((float)(v10 - v11) / 24000.0);
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "displayLink unpaused after %.2fs of pausing, took %.2fms to fire after unpause", buf, 0x16u);
    }
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = v7;
  id v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * (void)v17) displayLinkFired:a3, (void)v18];
        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v15);
  }
}

- (void)globalKeyboardModifiersDidChange:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  if (self->_activeKeyboardModifiers != a3)
  {
    self->_activeKeyboardModifiers = a3;
    if ([(NSSet *)self->_lastEventContexts count])
    {
      v6 = (void *)mach_absolute_time();
      sub_10006C518((uint64_t)self, v6, 1);
    }
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)smartCoverStateDidChange:(int)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = +[BKDisplayController sharedInstance];
  uint64_t v7 = [v6 displayIsBlanked:0] ^ 1;

  if (a3 != 3 || (v7 & 1) == 0)
  {
    id v8 = sub_10006C63C((uint64_t)self, v7, a3 == 3, self->_rawDeviceOrientation);
    sub_10006C758((id *)&self->super.isa, v8);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)monitor:(id)a3 activeDisplayPropertiesDidChange:(id)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v7 = [a4 uniqueId];
  id v8 = [v7 length];
  id v9 = (void *)BKSDisplayUUIDMainKey;
  if (v8) {
    id v9 = v7;
  }
  id v10 = v9;

  unint64_t v11 = +[NSString stringWithFormat:@"displays did change -- %@", v10];
  sub_10006CA98((uint64_t)self, (uint64_t)v11);

  os_unfair_lock_unlock(p_lock);
}

- (void)monitor:(id)a3 displayDidBecomeInactive:(id)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v7 = [a4 uniqueId];
  id v8 = [v7 length];
  id v9 = (void *)BKSDisplayUUIDMainKey;
  if (v8) {
    id v9 = v7;
  }
  id v10 = v9;

  unint64_t v11 = +[NSString stringWithFormat:@"display became inactive -- %@", v10];
  sub_10006CA98((uint64_t)self, (uint64_t)v11);

  os_unfair_lock_unlock(p_lock);
}

- (void)monitor:(id)a3 displayDidBecomeActive:(id)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v7 = [a4 uniqueId];
  id v8 = [v7 length];
  id v9 = (void *)BKSDisplayUUIDMainKey;
  if (v8) {
    id v9 = v7;
  }
  id v10 = v9;

  unint64_t v11 = +[NSString stringWithFormat:@"display became active -- %@", v10];
  sub_10006CA98((uint64_t)self, (uint64_t)v11);

  os_unfair_lock_unlock(p_lock);
}

- (void)display:(id)a3 didBecomeBlank:(BOOL)a4
{
  BOOL v4 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  sub_10006C63C((uint64_t)self, !v4, [(BKSmartCoverHIDEventProcessor *)self->_smartCoverEventProcessor isSmartCoverClosed], self->_rawDeviceOrientation);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  sub_10006C758((id *)&self->super.isa, v7);
  os_unfair_lock_unlock(p_lock);
}

- (void)mousePointerIOHIDServicesRemoved:(id)a3
{
  uint64_t v5 = sub_10006E234((uint64_t)self, a3, @"services removed");
  os_unfair_lock_assert_not_owner(&self->_lock);
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v6 = a3;
  id v7 = [v6 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v38;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v38 != v9) {
          objc_enumerationMutation(v6);
        }
        -[BKMouseEventAccumulator deviceServiceDidTerminate:](self->_eventAccumulator, "deviceServiceDidTerminate:", *(void *)(*((void *)&v37 + 1) + 8 * (void)v10), lock);
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v8);
  }

  displayLink = self->_displayLink;
  v29 = (void *)v5;
  sub_10006CA98((uint64_t)self, v5);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v12 = v6;
  id v13 = [v12 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v34;
    v30 = (void *)BKSDisplayUUIDMainKey;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v34 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v16);
        if (!displayLink)
        {
          id v18 = [*(id *)(*((void *)&v33 + 1) + 8 * (void)v16) displayUUID];
          id v19 = [v18 length];
          long long v20 = v30;
          if (v19) {
            long long v20 = v18;
          }
          id v21 = v20;

          sub_10006BD70((uint64_t)self, (uint64_t)v21);
        }
        id v22 = [v17 senderID:lock v29];
        senderPropertiesBySenderID = self->_senderPropertiesBySenderID;
        double v24 = +[NSNumber numberWithUnsignedLongLong:v22];
        [(NSMutableDictionary *)senderPropertiesBySenderID removeObjectForKey:v24];

        uint64_t v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v14);
  }

  __int16 v25 = [(BKMousePointerDeviceAvailabilityMonitor *)self->_pointerDeviceAvailabilityMonitor deviceServices];
  id v26 = [v25 copy];

  [(BKMousePointerAnalyticsReporter *)self->_analyticsReporter availableDevicesDidChange];
  os_unfair_lock_unlock(lock);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10006E2DC;
  v31[3] = &unk_1000F7AF0;
  id v32 = v26;
  id v27 = v26;
  os_unfair_lock_assert_not_owner(lock);
  sub_10006E2DC((uint64_t)v31, self->_ipcServer_do_not_access_directly);
}

- (void)mousePointerIOHIDServicesAdded:(id)a3
{
  v64 = sub_10006E234((uint64_t)self, a3, @"services added");
  os_unfair_lock_assert_not_owner(&self->_preferencesLock);
  os_unfair_lock_lock(&self->_preferencesLock);
  uint64_t v5 = sub_10006EB08((const os_unfair_lock *)self);
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v6 = a3;
  id v7 = [v6 countByEnumeratingWithState:&v77 objects:v87 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v78;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v78 != v9) {
          objc_enumerationMutation(v6);
        }
        sub_10006ECB8((const os_unfair_lock *)self, v5, *(void **)(*((void *)&v77 + 1) + 8 * i));
      }
      id v8 = [v6 countByEnumeratingWithState:&v77 objects:v87 count:16];
    }
    while (v8);
  }
  __int16 v63 = v5;

  os_unfair_lock_unlock(&self->_preferencesLock);
  v68 = self;
  id v61 = v6;
  if (self)
  {
    id v67 = objc_alloc_init((Class)NSMutableDictionary);
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id obj = v6;
    id v70 = [obj countByEnumeratingWithState:&v81 objects:buf count:16];
    if (v70)
    {
      uint64_t v66 = *(void *)v82;
      do
      {
        unint64_t v11 = 0;
        do
        {
          if (*(void *)v82 != v66) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v81 + 1) + 8 * (void)v11);
          id v13 = [_BKMousePointerSenderProperties alloc];
          if (v13)
          {
            v85.receiver = v13;
            v85.super_class = (Class)_BKMousePointerSenderProperties;
            id v14 = [(BKMousePointerController *)&v85 init];
            if (v14)
            {
              uint64_t v15 = [v12 propertyOfClass:objc_opt_class() forKey:@"SurfaceDimensions"];
              uint64_t v16 = v15;
              if (v15)
              {
                v17 = [v15 objectForKeyedSubscript:@"Width"];
                uint64_t v18 = objc_opt_class();
                id v19 = v17;
                if (v18)
                {
                  if (objc_opt_isKindOfClass()) {
                    long long v20 = v19;
                  }
                  else {
                    long long v20 = 0;
                  }
                }
                else
                {
                  long long v20 = 0;
                }
                id v21 = v20;

                id v22 = [v16 objectForKeyedSubscript:@"Height"];
                uint64_t v23 = objc_opt_class();
                id v24 = v22;
                if (v23)
                {
                  if (objc_opt_isKindOfClass()) {
                    __int16 v25 = v24;
                  }
                  else {
                    __int16 v25 = 0;
                  }
                }
                else
                {
                  __int16 v25 = 0;
                }
                id v26 = v25;

                [v21 floatValue];
                *(double *)&v14->_configuration = v27;
                [v26 floatValue];
                float v29 = v28;

                v14->_mainDisplayCornerRadius = v29;
              }
              v30 = [v12 propertyOfClass:objc_opt_class() forKey:@"HIDScrollResolutionX"];
              v31 = [v12 propertyOfClass:objc_opt_class() forKey:@"HIDScrollResolutionY"];
              id v32 = [v12 propertyOfClass:objc_opt_class() forKey:@"HIDScrollResolutionZ"];
              long long v33 = [v12 propertyOfClass:objc_opt_class() forKey:@"HIDScrollResolution"];
              if ([v30 unsignedIntValue] > 0x120000
                || [v31 unsignedIntValue] > 0x120000
                || [v32 unsignedIntValue] > 0x120000
                || [v33 unsignedIntValue] > 0x120000)
              {
                LOBYTE(v14->_lock._os_unfair_lock_opaque) = 1;
              }
              long long v34 = [v12 propertyForKey:@"NeedsHostState" v61, v63, v64];
              uint64_t v35 = objc_opt_class();
              id v36 = v34;
              if (v35)
              {
                if (objc_opt_isKindOfClass()) {
                  long long v37 = v36;
                }
                else {
                  long long v37 = 0;
                }
              }
              else
              {
                long long v37 = 0;
              }
              id v38 = v37;

              unsigned __int8 v39 = [v38 BOOLValue];
              BYTE1(v14->_lock._os_unfair_lock_opaque) = v39;
              long long v40 = [v12 propertyOfClass:objc_opt_class() forKey:@"ignoresNaturalScrollingPreference"];
              BYTE2(v14->_lock._os_unfair_lock_opaque) = [v40 BOOLValue];
            }
          }
          else
          {
            id v14 = 0;
          }
          v41 = [NSNumber numberWithUnsignedLongLong:objc_msgSend(v12, "senderID", v61)];
          [v67 setObject:v14 forKeyedSubscript:v41];

          unint64_t v11 = (char *)v11 + 1;
        }
        while (v70 != v11);
        id v42 = [obj countByEnumeratingWithState:&v81 objects:buf count:16];
        id v70 = v42;
      }
      while (v42);
    }
  }
  else
  {
    id v67 = 0;
  }
  v43 = +[BKDisplayController sharedInstance];
  unsigned int v44 = [v43 displayIsBlanked:0];

  v45 = sub_10006C63C((uint64_t)v68, v44 ^ 1, [(BKSmartCoverHIDEventProcessor *)v68->_smartCoverEventProcessor isSmartCoverClosed], v68->_rawDeviceOrientation);
  p_lock = &v68->_lock;
  os_unfair_lock_lock(&v68->_lock);
  sub_10006CA98((uint64_t)v68, (uint64_t)v64);
  senderPropertiesBySenderID = v68->_senderPropertiesBySenderID;
  if (!senderPropertiesBySenderID)
  {
    id v47 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v48 = v68->_senderPropertiesBySenderID;
    v68->_senderPropertiesBySenderID = v47;

    senderPropertiesBySenderID = v68->_senderPropertiesBySenderID;
  }
  [(NSMutableDictionary *)senderPropertiesBySenderID addEntriesFromDictionary:v67];
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v49 = v62;
  id v50 = [v49 countByEnumeratingWithState:&v73 objects:v86 count:16];
  if (v50)
  {
    id v51 = v50;
    uint64_t v52 = *(void *)v74;
    do
    {
      for (j = 0; j != v51; j = (char *)j + 1)
      {
        if (*(void *)v74 != v52) {
          objc_enumerationMutation(v49);
        }
        v54 = *(void **)(*((void *)&v73 + 1) + 8 * (void)j);
        [(BKMouseEventAccumulator *)v68->_eventAccumulator deviceServiceDidAppear:v54];
        sub_10006C86C((uint64_t)v68, v54, v45);
        __int16 v55 = BKLogMousePointer();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          BOOL readyToReceiveEvents = v68->_readyToReceiveEvents;
          *(_DWORD *)buf = 67109378;
          BOOL v89 = readyToReceiveEvents;
          __int16 v90 = 2114;
          v91 = v54;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "set _readyToReceiveEvents:%{BOOL}u on %{public}@", buf, 0x12u);
        }

        __int16 v57 = +[NSNumber numberWithBool:v68->_readyToReceiveEvents];
        [v54 asyncSetProperty:v57 forKey:@"BKReadyToReceivePointerEvents"];
      }
      id v51 = [v49 countByEnumeratingWithState:&v73 objects:v86 count:16];
    }
    while (v51);
  }

  v58 = [(BKMousePointerDeviceAvailabilityMonitor *)v68->_pointerDeviceAvailabilityMonitor deviceServices];
  id v59 = [v58 copy];

  [(BKMousePointerAnalyticsReporter *)v68->_analyticsReporter availableDevicesDidChange];
  os_unfair_lock_unlock(p_lock);
  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472;
  v71[2] = sub_10006F088;
  v71[3] = &unk_1000F7AF0;
  id v72 = v59;
  id v60 = v59;
  os_unfair_lock_assert_not_owner(p_lock);
  sub_10006F088((uint64_t)v71, v68->_ipcServer_do_not_access_directly);
}

- (void)mousePointerDeviceAvailabilityMonitorDidChangeAvailability:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([(NSMutableArray *)self->_lifecycleObservers count])
  {
    uint64_t v5 = [(BKMousePointerDeviceAvailabilityMonitor *)self->_pointerDeviceAvailabilityMonitor deviceServices];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = self->_lifecycleObservers;
    id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        id v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) observeMouseAvailabilityDidChange:[v5 count] != 0];
          id v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)orientationManager:(id)a3 deviceOrientationMayHaveChanged:(int64_t)a4 changeSource:(int64_t)a5 isDeviceOrientationLocked:(BOOL)a6
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t v9 = sub_1000039E8((uint64_t)a3);
  if (self->_mainDisplayInterfaceOrientation != v9)
  {
    self->_mainDisplayInterfaceOrientation = v9;
    sub_10006CE04((uint64_t)self);
  }
  int64_t v10 = sub_100094CE0((uint64_t)a3);
  if (self->_rawDeviceOrientation != v10)
  {
    self->_rawDeviceOrientation = v10;
    long long v11 = +[BKDisplayController sharedInstance];
    unsigned int v12 = [v11 displayIsBlanked:0];

    long long v13 = sub_10006C63C((uint64_t)self, v12 ^ 1, [(BKSmartCoverHIDEventProcessor *)self->_smartCoverEventProcessor isSmartCoverClosed], self->_rawDeviceOrientation);
    sub_10006C758((id *)&self->super.isa, v13);
  }

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)destinationPIDMatchesHapticFeedbackRequestPID:(int)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = self->_lastEventContexts;
  id v7 = [(NSSet *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        if (sub_100029EF8(*(void *)(*((void *)&v13 + 1) + 8 * i), self->_HIDConnectionManager) == a3)
        {
          BOOL v11 = 1;
          goto LABEL_11;
        }
      }
      id v8 = [(NSSet *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_11:

  os_unfair_lock_unlock(p_lock);
  return v11;
}

- (void)setEventsDisabled:(BOOL)a3 pid:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v5 = a3;
  id v7 = BKLogMousePointer();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 67109376;
    LODWORD(v20[0]) = v5;
    WORD2(v20[0]) = 1024;
    *(_DWORD *)((char *)v20 + 6) = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "setEventsDisabled:%{BOOL}u pid:%d", (uint8_t *)&v19, 0xEu);
  }

  os_unfair_lock_lock(&self->_lock);
  id v8 = +[NSNumber numberWithInt:v4];
  unsigned int v9 = [(NSMutableSet *)self->_disableEventsPIDs containsObject:v8];
  if (v5)
  {
    if ((v9 & 1) == 0)
    {
      id v10 = [(NSMutableSet *)self->_disableEventsPIDs count];
      disableEventsPIDs = self->_disableEventsPIDs;
      if (!disableEventsPIDs)
      {
        unsigned int v12 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
        long long v13 = self->_disableEventsPIDs;
        self->_disableEventsPIDs = v12;

        disableEventsPIDs = self->_disableEventsPIDs;
      }
      [(NSMutableSet *)disableEventsPIDs addObject:v8];
      if (!v10)
      {
        sub_10006FB70((uint64_t)self);
        sub_10006FC88((uint64_t)self);
        long long v14 = [(NSMutableSet *)self->_disableEventsPIDs bs_map:&stru_1000F7A88];
        long long v15 = +[BSDescriptionStream descriptionForRootObject:v14];
        long long v16 = [@"disabled by policy: " stringByAppendingString:v15];
        sub_10006B5C4((uint64_t)self, (uint64_t)v16);
      }
    }
  }
  else if (v9)
  {
    [(NSMutableSet *)self->_disableEventsPIDs removeObject:v8];
    if (![(NSMutableSet *)self->_disableEventsPIDs count]) {
      sub_10006B5C4((uint64_t)self, @"enabled by policy");
    }
  }
  v17 = BKLogMousePointer();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = self->_disableEventsPIDs;
    int v19 = 138543362;
    v20[0] = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "pids currently disabling events: %{public}@", (uint8_t *)&v19, 0xCu);
  }

  sub_10006D414((uint64_t)self);
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setDisplayArrangement:(id)a3
{
  BOOL v5 = BKLogMousePointer();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Display arrangement update: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  objc_storeStrong((id *)&self->_displayArrangement, a3);
  sub_10006CA98((uint64_t)self, @"display arrangement changed");
  os_unfair_lock_unlock(&self->_lock);
}

- (void)removeGlobalDevicePreferencesObserver:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_globalDevicePreferencesObservers removeObject:a3];
  if (![(NSHashTable *)self->_globalDevicePreferencesObservers count])
  {
    globalDevicePreferencesObservers = self->_globalDevicePreferencesObservers;
    self->_globalDevicePreferencesObservers = 0;
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)addGlobalDevicePreferencesObserver:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  globalDevicePreferencesObservers = self->_globalDevicePreferencesObservers;
  if (!globalDevicePreferencesObservers)
  {
    id v7 = +[NSHashTable weakObjectsHashTable];
    id v8 = self->_globalDevicePreferencesObservers;
    self->_globalDevicePreferencesObservers = v7;

    globalDevicePreferencesObservers = self->_globalDevicePreferencesObservers;
  }
  [(NSHashTable *)globalDevicePreferencesObservers addObject:a3];

  os_unfair_lock_unlock(p_lock);
}

- (void)removeLifecycleObserver:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  sub_100070318((uint64_t)self, (uint64_t)a3);

  os_unfair_lock_unlock(p_lock);
}

- (void)addLifecycleObserver:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  sub_1000703E4((const os_unfair_lock *)self, (uint64_t)a3);

  os_unfair_lock_unlock(p_lock);
}

- (void)setGlobalDevicePreferences:(id)a3
{
  p_preferencesLock = &self->_preferencesLock;
  os_unfair_lock_assert_not_owner(&self->_preferencesLock);
  os_unfair_lock_lock(p_preferencesLock);
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  int v6 = [(NSHashTable *)self->_globalDevicePreferencesObservers allObjects];
  os_unfair_lock_unlock(&self->_lock);
  if ([v6 count])
  {
    id v7 = sub_10006EB08((const os_unfair_lock *)self);
    int v8 = BSEqualObjects() ^ 1;
  }
  else
  {
    int v8 = 0;
  }
  os_unfair_lock_assert_owner(p_preferencesLock);
  unsigned int v9 = +[BKSDefaults localDefaults];
  id v33 = 0;
  id v10 = +[BSProtobufSerialization encodeObject:a3 error:&v33];
  id v11 = v33;
  if (v10)
  {
    [v9 setGlobalMouseDevicePreferences:v10];
  }
  else
  {
    unsigned int v12 = BKLogMousePointer();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v37 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "cannot encode global prefs : %{public}@", buf, 0xCu);
    }
  }
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  long long v13 = [(BKMousePointerDeviceAvailabilityMonitor *)self->_pointerDeviceAvailabilityMonitor deviceServices];
  id v14 = [v13 copy];

  os_unfair_lock_unlock(&self->_lock);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v15 = v14;
  id v16 = [v15 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      int v19 = 0;
      do
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        sub_10006ECB8((const os_unfair_lock *)self, a3, *(void **)(*((void *)&v29 + 1) + 8 * (void)v19));
        int v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      id v17 = [v15 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v17);
  }

  os_unfair_lock_unlock(p_preferencesLock);
  os_unfair_lock_lock(&self->_lock);
  sub_10006FFC8((uint64_t)self);
  os_unfair_lock_unlock(&self->_lock);
  if (v8)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v20 = v6;
    id v21 = [v20 countByEnumeratingWithState:&v25 objects:v34 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v26;
      do
      {
        id v24 = 0;
        do
        {
          if (*(void *)v26 != v23) {
            objc_enumerationMutation(v20);
          }
          [*(id *)(*((void *)&v25 + 1) + 8 * (void)v24) mousePointerGlobalDevicePreferencesDidChange:a3, (void)v25];
          id v24 = (char *)v24 + 1;
        }
        while (v22 != v24);
        id v22 = [v20 countByEnumeratingWithState:&v25 objects:v34 count:16];
      }
      while (v22);
    }
  }
}

- (void)setPreferences:(id)a3 forDevice:(id)a4
{
}

- (BKSMousePointerDevicePreferences)globalDevicePreferences
{
  p_preferencesLock = &self->_preferencesLock;
  os_unfair_lock_assert_not_owner(&self->_preferencesLock);
  os_unfair_lock_lock(p_preferencesLock);
  uint64_t v4 = sub_10006EB08((const os_unfair_lock *)self);
  os_unfair_lock_unlock(p_preferencesLock);

  return (BKSMousePointerDevicePreferences *)v4;
}

- (void)stopRoutingGlobalEventsForPID:(int)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  id v6 = [(NSMutableDictionary *)self->_globalEventRoutesByDisplayID copy];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100070894;
  v7[3] = &unk_1000F7A48;
  v7[4] = self;
  int v8 = a3;
  [v6 enumerateKeysAndObjectsUsingBlock:v7];

  os_unfair_lock_unlock(p_lock);
}

- (void)setGlobalPointerEventRoutes:(id)a3 forPID:(int)a4 displayUUID:(id)a5
{
  if (a4 <= 0)
  {
    id v10 = +[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"pid > 0"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v11 = NSStringFromSelector(a2);
      unsigned int v12 = (objc_class *)objc_opt_class();
      long long v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138544642;
      int v19 = v11;
      __int16 v20 = 2114;
      id v21 = v13;
      __int16 v22 = 2048;
      uint64_t v23 = self;
      __int16 v24 = 2114;
      CFStringRef v25 = @"BKMousePointerController.m";
      __int16 v26 = 1024;
      int v27 = 799;
      __int16 v28 = 2114;
      long long v29 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x100071350);
  }
  if (!a5)
  {
    id v14 = +[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"displayUUID != ((void *)0)"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v15 = NSStringFromSelector(a2);
      id v16 = (objc_class *)objc_opt_class();
      id v17 = NSStringFromClass(v16);
      *(_DWORD *)buf = 138544642;
      int v19 = v15;
      __int16 v20 = 2114;
      id v21 = v17;
      __int16 v22 = 2048;
      uint64_t v23 = self;
      __int16 v24 = 2114;
      CFStringRef v25 = @"BKMousePointerController.m";
      __int16 v26 = 1024;
      int v27 = 800;
      __int16 v28 = 2114;
      long long v29 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x100071448);
  }
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  sub_1000708AC((uint64_t)self, a3, a4, a5);

  os_unfair_lock_unlock(&self->_lock);
}

- (void)getHitTestContextsAtPoint:(id)a3 withAdditionalContexts:(id)a4 onDisplay:(id)a5 withCompletion:(id)a6
{
  if (a6)
  {
    id v6 = (void (**)(id, void *, void *, void))a6;
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    unsigned int v12 = +[NSMutableArray array];
    long long v13 = +[NSMutableArray array];
    id v14 = [(BKCADisplayMonitor *)self->_displayMonitor immutableDisplayForUUID:a5];
    if (v14)
    {
      id v36 = a4;
      id v38 = p_lock;
      unsigned __int8 v39 = v6;
      id v15 = sub_10006AD2C((const os_unfair_lock *)self, a5);
      sub_10006C09C((uint64_t)self, a3, v14);
      sub_10006ADB8(v14, (uint64_t)v15, self->_displayController);
      sub_100010B54(a5);
      double v17 = v16;
      double v19 = v18;
      id v37 = v14;
      sub_1000298E0(v16, v18, (uint64_t)BKMouseDestination, 0, v14, 0, self->_configuration, self->_lastEventContexts);
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue();
      id v20 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v46;
        do
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(void *)v46 != v22) {
              objc_enumerationMutation(obj);
            }
            uint64_t v24 = *(void *)(*((void *)&v45 + 1) + 8 * i);
            if (v24 && (*(_DWORD *)(v24 + 12) - 1) <= 0xFFFFFFFD)
            {
              uint64_t v25 = *(unsigned int *)(v24 + 8);
              uint64_t v26 = sub_100029EF8(v24, self->_HIDConnectionManager);
              id v27 = objc_alloc_init((Class)BKSHIDEventHitTestClientContext);
              [v27 setContextID:v25];
              [v27 setPid:v26];
              [v12 addObject:v27];
              -[BKDisplayController convertCAScreenLocation:toContextID:displayUUID:](self->_displayController, "convertCAScreenLocation:toContextID:displayUUID:", v25, a5, v17, v19);
              __int16 v28 = +[NSValue bs_valueWithCGPoint:](NSValue, "bs_valueWithCGPoint:");
              [v13 addObject:v28];
            }
          }
          id v21 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
        }
        while (v21);
      }
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v29 = v36;
      id v30 = [v29 countByEnumeratingWithState:&v41 objects:v49 count:16];
      if (v30)
      {
        id v31 = v30;
        uint64_t v32 = *(void *)v42;
        do
        {
          for (j = 0; j != v31; j = (char *)j + 1)
          {
            if (*(void *)v42 != v32) {
              objc_enumerationMutation(v29);
            }
            long long v34 = *(void **)(*((void *)&v41 + 1) + 8 * (void)j);
            [v12 addObject:v34];
            -[BKDisplayController convertCAScreenLocation:toContextID:displayUUID:](self->_displayController, "convertCAScreenLocation:toContextID:displayUUID:", [v34 contextID], a5, v17, v19);
            uint64_t v35 = +[NSValue bs_valueWithCGPoint:](NSValue, "bs_valueWithCGPoint:");
            [v13 addObject:v35];
          }
          id v31 = [v29 countByEnumeratingWithState:&v41 objects:v49 count:16];
        }
        while (v31);
      }

      p_lock = v38;
      id v6 = v39;
      id v14 = v37;
    }
    os_unfair_lock_unlock(p_lock);
    v6[2](v6, v12, v13, 0);
  }
}

- (id)acquireButtonDownPointerRepositionAssertionForReason:(id)a3 contextRelativePointerPosition:(id)a4 onDisplay:(id)a5 restrictingToPID:(int)a6
{
  if (!a4)
  {
    CGFloat v18 = +[NSString stringWithFormat:@"Invalid condition not satisfying: %@", 0, a5, *(void *)&a6, @"point != ((void *)0)"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      double v19 = NSStringFromSelector(a2);
      id v20 = (objc_class *)objc_opt_class();
      id v21 = NSStringFromClass(v20);
      *(_DWORD *)location = 138544642;
      *(void *)&location[4] = v19;
      __int16 v33 = 2114;
      long long v34 = v21;
      __int16 v35 = 2048;
      id v36 = self;
      __int16 v37 = 2114;
      CFStringRef v38 = @"BKMousePointerController.m";
      __int16 v39 = 1024;
      int v40 = 714;
      __int16 v41 = 2114;
      long long v42 = v18;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", location, 0x3Au);
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x100071A50);
  }
  if (!a3)
  {
    uint64_t v22 = +[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"reason != ((void *)0)"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = NSStringFromSelector(a2);
      uint64_t v24 = (objc_class *)objc_opt_class();
      uint64_t v25 = NSStringFromClass(v24);
      *(_DWORD *)location = 138544642;
      *(void *)&location[4] = v23;
      __int16 v33 = 2114;
      long long v34 = v25;
      __int16 v35 = 2048;
      id v36 = self;
      __int16 v37 = 2114;
      CFStringRef v38 = @"BKMousePointerController.m";
      __int16 v39 = 1024;
      int v40 = 715;
      __int16 v41 = 2114;
      long long v42 = v22;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", location, 0x3Au);
    }
    [v22 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x100071B48);
  }
  if (!a5)
  {
    uint64_t v26 = +[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"displayUUID != ((void *)0)"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v27 = NSStringFromSelector(a2);
      __int16 v28 = (objc_class *)objc_opt_class();
      id v29 = NSStringFromClass(v28);
      *(_DWORD *)location = 138544642;
      *(void *)&location[4] = v27;
      __int16 v33 = 2114;
      long long v34 = v29;
      __int16 v35 = 2048;
      id v36 = self;
      __int16 v37 = 2114;
      CFStringRef v38 = @"BKMousePointerController.m";
      __int16 v39 = 1024;
      int v40 = 716;
      __int16 v41 = 2114;
      long long v42 = v26;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", location, 0x3Au);
    }
    [v26 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x100071C40);
  }
  uint64_t v10 = *(void *)&a6;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  objc_initWeak((id *)location, self);
  unsigned int v12 = [BKMousePointerButtonDownRepositionAssertion alloc];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100071C84;
  v30[3] = &unk_1000F7A20;
  objc_copyWeak(&v31, (id *)location);
  long long v13 = [(BKMousePointerButtonDownRepositionAssertion *)v12 initWithIdentifier:@"com.apple.backboardd.BKMousePointerController" forReason:a3 contextRelativePointerPosition:a4 displayUUID:a5 restrictingToPID:v10 invalidationBlock:v30];
  buttonDownRepositionAssertions = self->_buttonDownRepositionAssertions;
  if (!buttonDownRepositionAssertions)
  {
    id v15 = (NSMutableOrderedSet *)[objc_alloc((Class)NSMutableOrderedSet) initWithCapacity:1];
    CGFloat v16 = self->_buttonDownRepositionAssertions;
    self->_buttonDownRepositionAssertions = v15;

    buttonDownRepositionAssertions = self->_buttonDownRepositionAssertions;
  }
  [(NSMutableOrderedSet *)buttonDownRepositionAssertions addObject:v13];
  os_unfair_lock_unlock(&self->_lock);
  objc_destroyWeak(&v31);
  objc_destroyWeak((id *)location);

  return v13;
}

- (void)setContextRelativePointerPosition:(id)a3 withInitialVelocity:(id)a4 onDisplay:(id)a5 withDecelerationRate:(double)a6 restrictingToPID:(int)a7 auditPID:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  CGFloat v16 = [(BKCADisplayMonitor *)self->_displayMonitor immutableDisplayForUUID:a5];
  double v17 = sub_10006C09C((uint64_t)self, a3, v16);
  double v19 = v18;
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  if (a4)
  {
    id v22 = [objc_alloc((Class)BKSContextRelativePoint) initWithPoint:objc_msgSend(a4, "contextID") contextID:CGPointZero.x y];
    double v23 = sub_10006C09C((uint64_t)self, v22, v16);
    double v25 = v24;
    double x = sub_10006C09C((uint64_t)self, a4, v16) - v23;
    double y = v26 - v25;
  }
  os_unfair_lock_unlock(p_lock);
  v27[0] = (void (*)(void, double, double))_NSConcreteStackBlock;
  v27[1] = (void (*)(void, double, double))3221225472;
  v27[2] = (void (*)(void, double, double))sub_100071EB0;
  v27[3] = (void (*)(void, double, double))&unk_1000F79A8;
  v27[4] = *(void (**)(void, double, double))&x;
  v27[5] = *(void (**)(void, double, double))&y;
  v27[6] = *(void (**)(void, double, double))&a6;
  sub_100071F10((uint64_t)self, a5, a7, v17, v19, v8, v27);
}

- (void)setContextRelativePointerPosition:(id)a3 onDisplay:(id)a4 withAnimationParameters:(id)a5 restrictingToPID:(int)a6 auditPID:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  long long v13 = [(BKCADisplayMonitor *)self->_displayMonitor immutableDisplayForUUID:a4];
  os_unfair_lock_lock(&self->_lock);
  double v14 = sub_10006C09C((uint64_t)self, a3, v13);
  double v16 = v15;
  os_unfair_lock_unlock(&self->_lock);
  v17[0] = (void (*)(void, double, double))_NSConcreteStackBlock;
  v17[1] = (void (*)(void, double, double))3221225472;
  v17[2] = (void (*)(void, double, double))sub_100072A40;
  v17[3] = (void (*)(void, double, double))&unk_1000F7988;
  v17[4] = (void (*)(void, double, double))a5;
  sub_100071F10((uint64_t)self, a4, a6, v14, v16, v7, v17);
}

- (void)setPointerPosition:(CGPoint)a3 onDisplay:(id)a4 withAnimationParameters:(id)a5 auditPID:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  double y = a3.y;
  double x = a3.x;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  if (self->_pointerRegion)
  {
    [(BKMousePointerRegionArrangement *)self->_regionArrangement convertToGlobalPoint:self->_pointerRegionPoint.x fromRegion:self->_pointerRegionPoint.y];
    double v14 = v13;
    double v16 = v15;
  }
  else
  {
    double v14 = CGPointZero.x;
    double v16 = CGPointZero.y;
  }
  if ([(NSMutableArray *)self->_activePointerAnimations count])
  {
    double v17 = [(NSMutableArray *)self->_activePointerAnimations lastObject];
    [v17 destinationPoint];
    double v14 = v18;
    double v16 = v19;
  }
  id v20 = sub_10006C1C0((uint64_t)self, v14, v16);
  os_unfair_lock_unlock(p_lock);
  if ([v20 count])
  {
    id v21 = [v20 anyObject];
    int v22 = [v21 integerValue];

    if (v22 >= 1)
    {
      v23[0] = (void (*)(void, double, double))_NSConcreteStackBlock;
      v23[1] = (void (*)(void, double, double))3221225472;
      v23[2] = (void (*)(void, double, double))sub_100072C38;
      v23[3] = (void (*)(void, double, double))&unk_1000F7988;
      v23[4] = (void (*)(void, double, double))a5;
      sub_100071F10((uint64_t)self, a4, v22, x, y, v6, v23);
    }
  }
}

- (void)setGlobalPointerPosition:(CGPoint)a3 synthesizeEvents:(BOOL)a4 process:(id)a5
{
  BOOL v6 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  unsigned int v9 = +[CADisplay mainDisplay];
  sub_10006C3EC(v9, self->_mainDisplayInterfaceOrientation, self->_displayController);
  double v11 = v10;
  double v13 = v12;

  double v14 = +[NSString stringWithFormat:@"setGlobalPointerPosition (%@)", a5];
  sub_10006B228((uint64_t)self, 0, (uint64_t)v14, v11, v13);

  if (v6)
  {
    double v15 = (void *)mach_absolute_time();
    sub_10006C518((uint64_t)self, v15, 1);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)setGlobalPointerPosition:(CGPoint)a3 process:(id)a4
{
}

- (CGPoint)globalPointerPosition
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  if (self->_pointerRegion) {
    [(BKMousePointerRegionArrangement *)self->_regionArrangement convertToGlobalPoint:self->_pointerRegionPoint.x fromRegion:self->_pointerRegionPoint.y];
  }
  uint64_t v4 = +[CADisplay mainDisplay];
  sub_10006ADB8(v4, self->_mainDisplayInterfaceOrientation, self->_displayController);
  double v6 = v5;
  double v8 = v7;

  os_unfair_lock_unlock(p_lock);
  double v9 = v6;
  double v10 = v8;
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (CGPoint)normalizedGlobalPointerPosition
{
  if (self->_pointerRegion)
  {
    [(BKMousePointerRegionArrangement *)self->_regionArrangement convertToGlobalPoint:self->_pointerRegionPoint.x fromRegion:self->_pointerRegionPoint.y];
  }
  else
  {
    double x = CGPointZero.x;
    double y = CGPointZero.y;
  }
  regionArrangement = self->_regionArrangement;

  -[BKMousePointerRegionArrangement normalizedGlobalPosition:](regionArrangement, "normalizedGlobalPosition:", x, y);
  result.double y = v7;
  result.double x = v6;
  return result;
}

- (id)suppressPointerModelUpdatesAssertionForDisplay:(id)a3 reason:(id)a4
{
  double v7 = BKLogMousePointer();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v14 = a3;
    __int16 v15 = 2114;
    id v16 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "suppress pointer updates: display:%{public}@ because %{public}@", buf, 0x16u);
  }

  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  double v8 = [(NSMutableDictionary *)self->_modelUpdateSuppressionAssertionsByDisplayID objectForKeyedSubscript:a3];
  if (!v8)
  {
    double v9 = [@"modelUpdate-" stringByAppendingString:a3];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100073078;
    v12[3] = &unk_1000F7960;
    v12[4] = a3;
    double v8 = +[BSCompoundAssertion assertionWithIdentifier:v9 stateDidChangeHandler:v12];

    [(NSMutableDictionary *)self->_modelUpdateSuppressionAssertionsByDisplayID setObject:v8 forKeyedSubscript:a3];
  }
  os_unfair_lock_unlock(&self->_lock);
  double v10 = [v8 acquireForReason:a4];

  return v10;
}

- (void)invalidate
{
  if ((atomic_exchange(&self->_invalid._Value, 1u) & 1) == 0)
  {
    p_lock = &self->_lock;
    os_unfair_lock_assert_not_owner(&self->_lock);
    os_unfair_lock_lock(p_lock);
    [(BKMousePointerAnnotationController *)self->_annotationController invalidate];
    annotationController = self->_annotationController;
    self->_annotationController = 0;

    [(BSInvalidatable *)self->_displayBlankingObservationAssertion invalidate];
    displayBlankingObservationAssertion = self->_displayBlankingObservationAssertion;
    self->_displayBlankingObservationAssertion = 0;

    [(BSInvalidatable *)self->_keyboardEventObservationAssertion invalidate];
    keyboardEventObservationAssertion = self->_keyboardEventObservationAssertion;
    self->_keyboardEventObservationAssertion = 0;

    [(BKCADisplayMonitor *)self->_displayMonitor invalidate];
    displayMonitor = self->_displayMonitor;
    self->_displayMonitor = 0;

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    double v8 = [(NSMutableDictionary *)self->_modelUpdateSuppressionAssertionsByDisplayID allValues];
    id v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v24;
      do
      {
        double v12 = 0;
        do
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v23 + 1) + 8 * (void)v12) invalidate];
          double v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v10);
    }

    modelUpdateSuppressionAssertionsByDisplayID = self->_modelUpdateSuppressionAssertionsByDisplayID;
    self->_modelUpdateSuppressionAssertionsByDisplayID = 0;

    [(BSAbsoluteMachTimer *)self->_displayLinkPauseTimer invalidate];
    displayLinkPauseTimer = self->_displayLinkPauseTimer;
    self->_displayLinkPauseTimer = 0;

    [(BKDisplayLink *)self->_displayLink invalidate];
    displayLink = self->_displayLink;
    self->_displayLink = 0;

    regionArrangement = self->_regionArrangement;
    self->_regionArrangement = 0;

    regionArrangementByCoalitionID = self->_regionArrangementByCoalitionID;
    self->_regionArrangementByCoalitionID = 0;

    regionArrangementByDisplayUUID = self->_regionArrangementByDisplayUUID;
    self->_regionArrangementByDisplayUUID = 0;

    sub_10006FC88((uint64_t)self);
    [(BSInvalidatable *)self->_displayMonitorObservingAssertion invalidate];
    displayMonitorObservingAssertion = self->_displayMonitorObservingAssertion;
    self->_displayMonitorObservingAssertion = 0;

    [(BSInvalidatable *)self->_smartCoverObservationAssertion invalidate];
    smartCoverObservationAssertion = self->_smartCoverObservationAssertion;
    self->_smartCoverObservationAssertion = 0;

    [(BSInvalidatable *)self->_orientationManagerObservationAssertion invalidate];
    orientationManagerObservationAssertion = self->_orientationManagerObservationAssertion;
    self->_orientationManagerObservationAssertion = 0;

    [(BKMousePointerDeviceAvailabilityMonitor *)self->_pointerDeviceAvailabilityMonitor removeObserver:self];
    [(BKMouseEventAccumulator *)self->_eventAccumulator invalidate];
    eventAccumulator = self->_eventAccumulator;
    self->_eventAccumulator = 0;

    os_unfair_lock_unlock(p_lock);
  }
}

- (void)dealloc
{
  [(BKMousePointerController *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BKMousePointerController;
  [(BKMousePointerController *)&v3 dealloc];
}

- (BKMousePointerController)initWithConfiguration:(id)a3
{
  v70.receiver = self;
  v70.super_class = (Class)BKMousePointerController;
  uint64_t v4 = [(BKMousePointerController *)&v70 init];
  if (v4)
  {
    objc_initWeak(&location, v4);
    v4->_lock._os_unfair_lock_opaque = 0;
    v4->_preferencesLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v4->_configuration, a3);
    uint64_t v5 = [a3 displayProvider];
    double v6 = [BKCADisplayMonitor alloc];
    double v7 = BKLogMousePointer();
    double v8 = [(BKCADisplayMonitor *)v6 initWithDisplayProvider:v5 log:v7 filterPredicate:0];
    displayMonitor = v4->_displayMonitor;
    v4->_displayMonitor = v8;

    uint64_t v10 = [(BKCADisplayMonitor *)v4->_displayMonitor addObserver:v4];
    displayMonitorObservingAssertion = v4->_displayMonitorObservingAssertion;
    v4->_displayMonitorObservingAssertion = (BSInvalidatable *)v10;

    uint64_t v12 = [a3 localDefaults];
    localDefaults = v4->_localDefaults;
    v4->_localDefaults = (BKSLocalDefaults *)v12;

    uint64_t v14 = [a3 clientConnectionManager];
    HIDConnectionManager = v4->_HIDConnectionManager;
    v4->_HIDConnectionManager = (BKHIDClientConnectionManager *)v14;

    uint64_t v16 = [a3 touchPadManager];
    touchPadManager = v4->_touchPadManager;
    v4->_touchPadManager = (BKTouchPadManager *)v16;

    uint64_t v18 = [a3 keyboardEventProcessor];
    keyboardEventProcessor = v4->_keyboardEventProcessor;
    v4->_keyboardEventProcessor = (BKKeyboardHIDEventProcessor *)v18;

    uint64_t v20 = [a3 smartCoverEventProcessor];
    smartCoverEventProcessor = v4->_smartCoverEventProcessor;
    v4->_smartCoverEventProcessor = (BKSmartCoverHIDEventProcessor *)v20;

    uint64_t v22 = [(BKSmartCoverHIDEventProcessor *)v4->_smartCoverEventProcessor addSmartCoverObserver:v4];
    smartCoverObservationAssertion = v4->_smartCoverObservationAssertion;
    v4->_smartCoverObservationAssertion = (BSInvalidatable *)v22;

    uint64_t v24 = [a3 displayController];
    displayController = v4->_displayController;
    v4->_displayController = (BKDisplayController *)v24;

    uint64_t v26 = [(BKDisplayController *)v4->_displayController addDisplayBlankingObserver:v4];
    displayBlankingObservationAssertion = v4->_displayBlankingObservationAssertion;
    v4->_displayBlankingObservationAssertion = (BSInvalidatable *)v26;

    uint64_t v28 = [(BKKeyboardHIDEventProcessor *)v4->_keyboardEventProcessor addGlobalKeyboardObserver:v4];
    keyboardEventObservationAssertion = v4->_keyboardEventObservationAssertion;
    v4->_keyboardEventObservationAssertion = (BSInvalidatable *)v28;

    v4->_displayLinkDisabled = [(BKMousePointerControllerConfiguration *)v4->_configuration displayLinkDisabled];
    sub_10006F2B4((uint64_t)v4);
    id v30 = v4->_localDefaults;
    id v31 = +[NSString stringWithUTF8String:"visualizeMousePointer"];
    id v61 = (void *)v5;
    id v32 = &_dispatch_main_q;
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472;
    v67[2] = sub_100073974;
    v67[3] = &unk_1000F8888;
    objc_copyWeak(&v68, &location);
    id v33 = [(BKSLocalDefaults *)v30 observeDefault:v31 onQueue:&_dispatch_main_q withBlock:v67];

    long long v34 = v4->_localDefaults;
    __int16 v35 = +[NSString stringWithUTF8String:"pointerRegionArrangementEdge"];
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_1000739B4;
    v64[3] = &unk_1000F7938;
    id v36 = v4;
    v65 = v36;
    objc_copyWeak(&v66, &location);
    id v37 = [(BKSLocalDefaults *)v34 observeDefault:v35 onQueue:&_dispatch_main_q withBlock:v64];

    CFStringRef v38 = v4->_localDefaults;
    __int16 v39 = +[NSString stringWithUTF8String:"mouseInterpolation"];
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_100073A0C;
    v62[3] = &unk_1000F8888;
    objc_copyWeak(&v63, &location);
    id v40 = [(BKSLocalDefaults *)v38 observeDefault:v39 onQueue:&_dispatch_main_q withBlock:v62];

    sub_100073A4C((uint64_t)v36);
    [a3 mainDisplayCornerRadius];
    v36->_mainDisplayCornerRadius = v41;
    uint64_t v42 = [a3 orientationManager];
    orientationManager = v36->_orientationManager;
    v36->_orientationManager = (BKOrientationManager *)v42;

    uint64_t v44 = sub_100095730((id *)&v36->_orientationManager->super.isa, v36);
    orientationManagerObservationAssertion = v36->_orientationManagerObservationAssertion;
    v36->_orientationManagerObservationAssertion = (BSInvalidatable *)v44;

    v36->_mainDisplayInterfaceOrientation = sub_1000039E8((uint64_t)v36->_orientationManager);
    v36->_rawDeviceOrientation = sub_100094CE0((uint64_t)v36->_orientationManager);
    uint64_t v46 = +[NSMutableArray array];
    activePointerAnimations = v36->_activePointerAnimations;
    v36->_activePointerAnimations = (NSMutableArray *)v46;

    uint64_t v48 = +[NSMutableDictionary dictionary];
    modelUpdateSuppressionAssertionsByDisplayID = v36->_modelUpdateSuppressionAssertionsByDisplayID;
    v36->_modelUpdateSuppressionAssertionsByDisplayID = (NSMutableDictionary *)v48;

    dispatch_queue_t v50 = dispatch_queue_create("com.apple.backboard.BKMousePointerController.availabilityMonitorQueue", 0);
    pointerDeviceAvailabilityMonitorQueue = v36->_pointerDeviceAvailabilityMonitorQueue;
    v36->_pointerDeviceAvailabilityMonitorQueue = (OS_dispatch_queue *)v50;

    uint64_t v52 = [a3 deviceAvailabilityMonitor];
    pointerDeviceAvailabilityMonitor = v36->_pointerDeviceAvailabilityMonitor;
    v36->_pointerDeviceAvailabilityMonitor = (BKMousePointerDeviceAvailabilityMonitor *)v52;

    [(BKMousePointerDeviceAvailabilityMonitor *)v36->_pointerDeviceAvailabilityMonitor addObserver:v36 queue:v36->_pointerDeviceAvailabilityMonitorQueue];
    uint64_t v54 = [a3 analyticsReporter];
    analyticsReporter = v36->_analyticsReporter;
    v36->_analyticsReporter = (BKMousePointerAnalyticsReporter *)v54;

    [(BKMousePointerAnalyticsReporter *)v36->_analyticsReporter setMousePointerController:v36];
    os_unfair_lock_lock(&v4->_lock);
    sub_10006FB70((uint64_t)v36);
    sub_10006CA98((uint64_t)v36, @"init");
    os_unfair_lock_unlock(&v4->_lock);
    v56 = objc_alloc_init(BKMousePointerEventStatisticsLogger);
    statisticsLogger = v36->_statisticsLogger;
    v36->_statisticsLogger = v56;

    uint64_t v58 = [a3 serviceServer];
    ipcServer_do_not_access_directldouble y = v36->_ipcServer_do_not_access_directly;
    v36->_ipcServer_do_not_access_directldouble y = (BKMousePointerServiceServer *)v58;

    objc_destroyWeak(&v63);
    objc_destroyWeak(&v66);

    objc_destroyWeak(&v68);
    objc_destroyWeak(&location);
  }
  return v4;
}

- (BKMousePointerController)init
{
  objc_super v3 = [(id)objc_opt_class() standardConfiguration];
  uint64_t v4 = [(BKMousePointerController *)self initWithConfiguration:v3];

  return v4;
}

+ (id)standardConfiguration
{
  v2 = objc_alloc_init(BKMousePointerControllerConfiguration);
  [(BKMousePointerControllerConfiguration *)v2 setDisplayProvider:0];
  objc_super v3 = sub_10001C32C();
  [(BKMousePointerControllerConfiguration *)v2 setOrientationManager:v3];

  uint64_t v4 = +[BKDisplayController sharedInstance];
  [(BKMousePointerControllerConfiguration *)v2 setDisplayController:v4];

  uint64_t v5 = +[BKSDefaults localDefaults];
  [(BKMousePointerControllerConfiguration *)v2 setLocalDefaults:v5];

  double v6 = BKHIDEventRoutingGetClientConnectionManager();
  [(BKMousePointerControllerConfiguration *)v2 setClientConnectionManager:v6];

  double v7 = objc_alloc_init(BKMousePointerDeviceAvailabilityMonitor);
  [(BKMousePointerControllerConfiguration *)v2 setDeviceAvailabilityMonitor:v7];

  double v8 = objc_alloc_init(BKMousePointerAnalyticsReporter);
  [(BKMousePointerControllerConfiguration *)v2 setAnalyticsReporter:v8];

  [(BKMousePointerControllerConfiguration *)v2 setServiceServer:0];
  id v9 = +[BKTouchDeliveryPolicyServer sharedServer];
  [(BKMousePointerControllerConfiguration *)v2 setTouchDeliveryPolicyServer:v9];

  uint64_t v10 = +[BKHIDEventProcessorRegistry sharedInstance];
  uint64_t v11 = +[BKTouchPadManager sharedInstance];
  [(BKMousePointerControllerConfiguration *)v2 setTouchPadManager:v11];

  uint64_t v12 = [v10 eventProcessorOfClass:objc_opt_class()];
  [(BKMousePointerControllerConfiguration *)v2 setKeyboardEventProcessor:v12];

  double v13 = [v10 eventProcessorOfClass:objc_opt_class()];
  [(BKMousePointerControllerConfiguration *)v2 setSmartCoverEventProcessor:v13];

  uint64_t v14 = objc_alloc_init(BKHIDEventHitTestDispatcher);
  [(BKMousePointerControllerConfiguration *)v2 setEventDispatcher:v14];

  [(BKMousePointerControllerConfiguration *)v2 setDisplayLinkClass:objc_opt_class()];
  [(BKMousePointerControllerConfiguration *)v2 setShouldUseHighFrequencyAttributeOption:1];
  MGGetFloat32Answer();
  [(BKMousePointerControllerConfiguration *)v2 setMainDisplayCornerRadius:v15];

  return v2;
}

@end