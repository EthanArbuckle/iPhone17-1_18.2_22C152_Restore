@interface BKHIDProximityEventProcessor
- (BKHIDProximityEventProcessor)initWithContext:(id)a3;
- (BOOL)_shouldPostLPATransitionEvents;
- (BOOL)isObjectWithinProximity;
- (BOOL)isProximityDetectionActive;
- (BOOL)shouldSuppressTouchesWhileObjectWithinProximity;
- (id)setObservesProximitySensorDetectionMaskChanges:(id)a3;
- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5;
- (void)_lock_postDetectionMaskChangeToObservers;
- (void)_lock_postSyntheticEventWithDetectionMaskToClients:(unsigned int)a3;
- (void)_locked_notifyIfNeededCurrentDetectionMaskChangeWithTimstamp:(unint64_t)a3;
- (void)_locked_postEventWithDetectionMask:(unsigned int)a3 toDestinations:(id)a4 dispatcher:(id)a5 reason:(id)a6;
- (void)_locked_setObjectWithinProximity:(BOOL)a3 notify:(BOOL)a4;
- (void)_locked_updateTouchSuppressionAssertion;
- (void)connectionDidTerminate:(id)a3 process:(id)a4;
- (void)dealloc;
- (void)sensorModeDidChange:(id)a3;
- (void)setShouldSuppressTouchesWhileObjectWithinProximity:(BOOL)a3;
@end

@implementation BKHIDProximityEventProcessor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suppressTouchesAssertion, 0);
  objc_storeStrong((id *)&self->_sensorModeChangeObserverToken, 0);
  objc_storeStrong((id *)&self->_studyLog, 0);
  objc_destroyWeak((id *)&self->_lastProximityDispatcher);
  objc_destroyWeak((id *)&self->_lastProximitySender);
  objc_storeStrong((id *)&self->_sensorController, 0);
  objc_storeStrong((id *)&self->_observingProximityConnections, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_eventClients, 0);

  objc_storeStrong((id *)&self->_lock_lastEvent, 0);
}

- (void)connectionDidTerminate:(id)a3 process:(id)a4
{
  p_lock = &self->_lock;
  id v6 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableSet *)self->_observingProximityConnections removeObject:v6];

  os_unfair_lock_unlock(p_lock);
}

- (id)setObservesProximitySensorDetectionMaskChanges:(id)a3
{
  id v4 = a3;
  v5 = +[BSServiceConnection currentContext];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v7 = [(BKHIDDomainServiceServer *)self->_server userInfoForConnection:v5];
  unsigned int v8 = [v4 BOOLValue];

  if (!v8)
  {
    sub_1000486EC((uint64_t)v7, 0);
    [(NSMutableSet *)self->_observingProximityConnections removeObject:v5];
    goto LABEL_7;
  }
  if (self->_observingProximityConnections)
  {
    if (v7) {
      goto LABEL_4;
    }
  }
  else
  {
    v11 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    observingProximityConnections = self->_observingProximityConnections;
    self->_observingProximityConnections = v11;

    if (v7) {
      goto LABEL_4;
    }
  }
  v7 = objc_alloc_init(BKProximityServerClientRecord);
  [(BKHIDDomainServiceServer *)self->_server setUserInfo:v7 forConnection:v5];
LABEL_4:
  if (([(NSMutableSet *)self->_observingProximityConnections containsObject:v5] & 1) == 0)
  {
    [(NSMutableSet *)self->_observingProximityConnections addObject:v5];
    v9 = self->_lock_lastEvent;
    sub_1000486EC((uint64_t)v7, v9);
    goto LABEL_8;
  }
LABEL_7:
  v9 = 0;
LABEL_8:
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (void)sensorModeDidChange:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int v6 = [v4 proximityDetectionMode];
  unsigned int detectionMode = self->_detectionMode;
  if (detectionMode == v6) {
    goto LABEL_33;
  }
  unsigned int v8 = v6;
  self->_unsigned int detectionMode = v6;
  self->_modeDetectionMask = 0;
  id v26 = v4;
  if (v6 == 3)
  {
    if (detectionMode == 6 && (self->_rawDetectionMask & 0x240) != 0) {
      self->_modeDetectionMask = 64;
    }
  }
  else
  {
    if (v6 != 6)
    {
      self->_proximityDetectionActive = 0;
      [(BKHIDProximityEventProcessor *)self _locked_setObjectWithinProximity:0 notify:1];
      v24 = BKLogUISensor();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        eventClients = self->_eventClients;
        *(_DWORD *)buf = 138543362;
        v34 = eventClients;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "inactive mode -- synthesizing prox cancel for clients:%{public}@", buf, 0xCu);
      }

      if (v8 > 5) {
        int v9 = 64;
      }
      else {
        int v9 = dword_1000BF890[v8];
      }
      goto LABEL_13;
    }
    if ([(BKHIDProximityEventProcessor *)self _shouldPostLPATransitionEvents])
    {
      if ((self->_rawDetectionMask & 0x240) != 0)
      {
        self->_modeDetectionMask = 64;
        if (detectionMode <= 0xD && ((1 << detectionMode) & 0x3006) != 0)
        {
          [(BKHIDProximityEventProcessor *)self _locked_setObjectWithinProximity:1 notify:1];
          [(BKHIDProximityEventProcessor *)self _lock_postSyntheticEventWithDetectionMaskToClients:64];
        }
      }
    }
  }
  self->_proximityDetectionActive = 1;
  int v9 = 1024;
LABEL_13:
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = [(BSMutableIntegerMap *)self->_eventClients allValues];
  id v10 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v29;
    do
    {
      v13 = 0;
      do
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v13);
        if (v14) {
          v15 = (void *)v14[1];
        }
        else {
          v15 = 0;
        }
        if (([v15 unsignedIntValue] & v9) != 0)
        {
          if (v14) {
            v16 = (void *)v14[3];
          }
          else {
            v16 = 0;
          }
          id v17 = v16;
          v18 = +[NSSet setWithObject:v17];
          if (v14) {
            v19 = (void *)v14[2];
          }
          else {
            v19 = 0;
          }
          id v20 = v19;
          v21 = BKSNSStringFromIOHIDProximityDetectionMask();
          v22 = +[NSString stringWithFormat:@"remove clients with (%@)", v21];
          [(BKHIDProximityEventProcessor *)self _locked_postEventWithDetectionMask:0 toDestinations:v18 dispatcher:v20 reason:v22];

          -[BSMutableIntegerMap removeObjectForKey:](self->_eventClients, "removeObjectForKey:", (int)[v17 pid]);
        }
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v23 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      id v11 = v23;
    }
    while (v23);
  }

  [(BKHIDProximityEventProcessor *)self _locked_notifyIfNeededCurrentDetectionMaskChangeWithTimstamp:mach_absolute_time()];
  p_lock = &self->_lock;
  id v4 = v26;
LABEL_33:
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)_shouldPostLPATransitionEvents
{
  return ![(BKHIDUISensorController *)self->_sensorController supportsProximityLPAEventTransitions];
}

- (void)_lock_postSyntheticEventWithDetectionMaskToClients:(unsigned int)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lastProximitySender);
  id v5 = objc_loadWeakRetained((id *)&self->_lastProximityDispatcher);
  v33 = v5;
  if (!WeakRetained || (int v6 = v5) == 0)
  {
    v7 = BKLogUISensor();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v42 = a3;
      *(_WORD *)&v42[4] = 2114;
      *(void *)&v42[6] = v33;
      *(_WORD *)&v42[14] = 2114;
      *(void *)&v42[16] = WeakRetained;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "ignoring synth:0x%X dispatcher:%{public}@ sender:%{public}@", buf, 0x1Cu);
    }

    int v6 = v33;
  }
  mach_absolute_time();
  uint64_t ProximtyEvent = IOHIDEventCreateProximtyEvent();
  IOHIDEventSetIntegerValue();
  CFTypeRef cf = (CFTypeRef)ProximtyEvent;
  long long v31 = WeakRetained;
  [v6 destinationsForEvent:ProximtyEvent fromSender:WeakRetained];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v9 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  id v10 = v6;
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = *(void *)v37;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v37 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        uint64_t v15 = -[BSMutableIntegerMap objectForKey:](self->_eventClients, "objectForKey:", (int)[v14 pid]);
        if (v15)
        {
          v16 = (BKGenericClientEventRecord *)v15;
          id v17 = +[NSNumber numberWithUnsignedInt:a3];
          objc_setProperty_nonatomic_copy(v16, v18, v17, 8);
        }
        else
        {
          v19 = +[NSNumber numberWithUnsignedInt:a3];
          id v20 = v10;
          v21 = v14;
          self;
          v16 = objc_alloc_init(BKGenericClientEventRecord);
          context = v16->_context;
          v16->_context = v19;
          id v23 = v19;

          eventDispatcher = v16->_eventDispatcher;
          v16->_eventDispatcher = v20;
          v25 = v20;

          destination = v16->_destination;
          v16->_destination = v21;

          [(BSMutableIntegerMap *)self->_eventClients setObject:v16 forKey:(int)[(BKSHIDEventDeferringResolution *)v21 pid]];
        }
        Copy = (const void *)IOHIDEventCreateCopy();
        long long v28 = +[BKSHIDEventProximityAttributes baseAttributesFromProvider:v14];
        [v28 setProximityDetectionMode:self->_detectionMode];
        BKSHIDEventSetAttributes();
        long long v29 = BKLogUISensor();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          long long v30 = BKSHIDEventGetConciseDescription();
          *(_DWORD *)buf = 138543618;
          *(void *)v42 = v30;
          *(_WORD *)&v42[8] = 2114;
          *(void *)&v42[10] = v14;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "send prox event:%{public}@ to %{public}@", buf, 0x16u);
        }
        id v10 = v33;
        [v33 postEvent:Copy toDestination:v14];
        CFRelease(Copy);
      }
      id v11 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v11);
  }
  CFRelease(cf);
}

- (void)_locked_setObjectWithinProximity:(BOOL)a3 notify:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_objectWithinProximity != v5)
  {
    self->_objectWithinProximity = v5;
    if (v4)
    {
      int v7 = dword_100121920;
      if (dword_100121920 != -1
        || (notify_register_check("com.apple.backboard.proximity.changed", &dword_100121920),
            int v7 = dword_100121920,
            dword_100121920 != -1))
      {
        notify_set_state(v7, v5);
        notify_post("com.apple.backboard.proximity.changed");
      }
    }
    [(BKHIDProximityEventProcessor *)self _locked_updateTouchSuppressionAssertion];
  }
}

- (void)_locked_updateTouchSuppressionAssertion
{
  os_unfair_lock_assert_owner(&self->_lock);
  BOOL objectWithinProximity = self->_objectWithinProximity;
  if (objectWithinProximity)
  {
    suppressTouchesAssertion = self->_suppressTouchesAssertion;
    p_suppressTouchesAssertion = &self->_suppressTouchesAssertion;
    BOOL v4 = suppressTouchesAssertion;
    BOOL objectWithinProximity = *((unsigned char *)p_suppressTouchesAssertion - 80) != 0;
    BOOL v7 = suppressTouchesAssertion == 0;
    if (*((unsigned char *)p_suppressTouchesAssertion - 80)) {
      BOOL v8 = v4 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      id v9 = +[BKHIDEventProcessorRegistry sharedInstance];
      v14 = [v9 eventProcessorOfClass:objc_opt_class()];

      uint64_t v10 = [v14 cancelAndSuppressTouchesOnDisplay:0 reason:@"objectWithinProximity"];
      id v11 = *p_suppressTouchesAssertion;
      *p_suppressTouchesAssertion = (BSInvalidatable *)v10;

      uint64_t v12 = (BSInvalidatable *)v14;
      goto LABEL_12;
    }
  }
  else
  {
    v13 = self->_suppressTouchesAssertion;
    p_suppressTouchesAssertion = &self->_suppressTouchesAssertion;
    BOOL v4 = v13;
    BOOL v7 = v13 == 0;
  }
  if (v7 || objectWithinProximity) {
    return;
  }
  [(BSInvalidatable *)v4 invalidate];
  uint64_t v12 = *p_suppressTouchesAssertion;
  *p_suppressTouchesAssertion = 0;
LABEL_12:
}

- (void)_locked_postEventWithDetectionMask:(unsigned int)a3 toDestinations:(id)a4 dispatcher:(id)a5 reason:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v28 = a6;
  long long v31 = self;
  os_unfair_lock_assert_owner(&self->_lock);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v11 = v9;
  uint64_t v12 = v10;
  id obj = v11;
  id v13 = [v11 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v34;
    uint64_t v16 = a3;
    id v17 = &BKTransferTouchesEntitlement_ptr;
    do
    {
      SEL v18 = 0;
      id v29 = v14;
      do
      {
        if (*(void *)v34 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v33 + 1) + 8 * (void)v18);
        mach_absolute_time();
        uint64_t ProximtyEvent = (const void *)IOHIDEventCreateProximtyEvent();
        IOHIDEventSetIntegerValue();
        v21 = [v17[68] baseAttributesFromProvider:v19];
        [v21 setProximityDetectionMode:v31->_detectionMode];
        BKSHIDEventSetAttributes();
        v22 = BKLogUISensor();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          BKSHIDEventGetConciseDescription();
          uint64_t v23 = v16;
          uint64_t v24 = v15;
          v25 = v17;
          v27 = id v26 = v12;
          *(_DWORD *)buf = 138543874;
          long long v38 = v27;
          __int16 v39 = 2114;
          uint64_t v40 = v19;
          __int16 v41 = 2114;
          id v42 = v28;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "send prox event:%{public}@ to %{public}@ [%{public}@]", buf, 0x20u);

          uint64_t v12 = v26;
          id v17 = v25;
          uint64_t v15 = v24;
          uint64_t v16 = v23;
          id v14 = v29;
        }

        [v12 postEvent:ProximtyEvent toDestination:v19];
        CFRelease(ProximtyEvent);

        SEL v18 = (char *)v18 + 1;
      }
      while (v14 != v18);
      id v14 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v14);
  }
}

- (void)_lock_postDetectionMaskChangeToObservers
{
  os_unfair_lock_assert_owner(&self->_lock);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v3 = self->_observingProximityConnections;
  id v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      BOOL v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v8 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v7);
        uint64_t v9 = -[BKHIDDomainServiceServer userInfoForConnection:](self->_server, "userInfoForConnection:", v8, (void)v17);
        id v10 = (void *)v9;
        if (v9) {
          id v11 = *(void **)(v9 + 8);
        }
        else {
          id v11 = 0;
        }
        id v12 = v11;
        unsigned int v13 = [v12 detectionMask];
        unsigned int v14 = [(BKSProximityDetectionMaskChangeEvent *)self->_lock_lastEvent detectionMask];

        if (v13 != v14)
        {
          sub_1000486EC((uint64_t)v10, self->_lock_lastEvent);
          uint64_t v15 = [v8 remoteTarget];
          [v15 proximityDetectionMaskDidChange:self->_lock_lastEvent];
        }
        BOOL v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v16 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
      id v5 = v16;
    }
    while (v16);
  }
}

- (void)_locked_notifyIfNeededCurrentDetectionMaskChangeWithTimstamp:(unint64_t)a3
{
  unsigned int modeDetectionMask = self->_modeDetectionMask;
  int detectionMode = self->_detectionMode;
  if ([(BKSProximityDetectionMaskChangeEvent *)self->_lock_lastEvent detectionMask] == modeDetectionMask) {
    a3 = (unint64_t)[(BKSProximityDetectionMaskChangeEvent *)self->_lock_lastEvent timestamp];
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10004BDDC;
  v9[3] = &unk_1000F6C88;
  v9[4] = a3;
  unsigned int v10 = modeDetectionMask;
  int v11 = detectionMode;
  BOOL v7 = +[BKSProximityDetectionMaskChangeEvent build:v9];
  lock_lastEvent = self->_lock_lastEvent;
  self->_lock_lastEvent = v7;

  [(BKHIDProximityEventProcessor *)self _lock_postDetectionMaskChangeToObservers];
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  unsigned int v10 = *a3;
  int v11 = BKLogUISensor();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = BKSHIDEventGetConciseDescription();
    *(_DWORD *)buf = 138543362;
    v48 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "-> %{public}@", buf, 0xCu);
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_storeWeak((id *)&self->_lastProximitySender, v8);
  objc_storeWeak((id *)&self->_lastProximityDispatcher, v9);
  if ([(SLGNotificationActivatedLogger *)self->_studyLog isEnabled])
  {
    BOOL v14 = IOHIDEventGetIntegerValue() != 0;
    if (self->_studyLogProxState != v14)
    {
      studyLog = self->_studyLog;
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_10004C2E8;
      v44[3] = &unk_1000F6C68;
      BOOL v45 = v14;
      [(SLGNotificationActivatedLogger *)studyLog logBlock:v44 domain:@"com.apple.backboard.hid.proximity"];
      self->_studyLogProxState = v14;
    }
  }
  unsigned int IntegerValue = IOHIDEventGetIntegerValue();
  self->_rawDetectionMask = IntegerValue;
  if (self->_proximityDetectionActive) {
    int v17 = 1088;
  }
  else {
    int v17 = 1024;
  }
  uint64_t v18 = v17 & IntegerValue;
  kdebug_trace();
  __int16 v39 = +[NSMutableSet set];
  if (self->_modeDetectionMask != v18)
  {
    long long v36 = v10;
    id v37 = v9;
    id v38 = v8;
    self->_unsigned int modeDetectionMask = v18;
    if (self->_proximityDetectionActive) {
      [(BKHIDProximityEventProcessor *)self _locked_setObjectWithinProximity:(v18 >> 6) & 1 notify:1];
    }
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v19 = [(BSMutableIntegerMap *)self->_eventClients allValues];
    id v20 = [v19 countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v41;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v41 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void **)(*((void *)&v40 + 1) + 8 * (void)v23);
          if (v24) {
            v25 = (void *)v24[1];
          }
          else {
            v25 = 0;
          }
          if (([v25 unsignedIntValue] & v18) == 0)
          {
            if (v24) {
              id v26 = (void *)v24[3];
            }
            else {
              id v26 = 0;
            }
            id v27 = v26;
            id v28 = +[NSSet setWithObject:v27];
            if (v24) {
              uint64_t v29 = v24[2];
            }
            else {
              uint64_t v29 = 0;
            }
            [(BKHIDProximityEventProcessor *)self _locked_postEventWithDetectionMask:0 toDestinations:v28 dispatcher:v29 reason:@"client mask mismatch"];

            [v39 addObject:v27];
            -[BSMutableIntegerMap removeObjectForKey:](self->_eventClients, "removeObjectForKey:", (int)[v27 pid]);
          }
          uint64_t v23 = (char *)v23 + 1;
        }
        while (v21 != v23);
        id v30 = [v19 countByEnumeratingWithState:&v40 objects:v46 count:16];
        id v21 = v30;
      }
      while (v30);
    }

    if (v18 && self->_proximityDetectionActive)
    {
      [(BKHIDProximityEventProcessor *)self _lock_postSyntheticEventWithDetectionMaskToClients:v18];
      id v9 = v37;
      id v8 = v38;
      p_lock = &self->_lock;
      unsigned int v10 = v36;
    }
    else
    {
      id v9 = v37;
      id v8 = v38;
      p_lock = &self->_lock;
      unsigned int v10 = v36;
      if (v18 < 0x400)
      {
        if (v18)
        {
          long long v31 = BKLogUISensor();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            v32 = BKSHIDEventGetConciseDescription();
            *(_DWORD *)buf = 138543362;
            v48 = v32;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Ignoring %{public}@", buf, 0xCu);
          }
        }
      }
      else
      {
        [(BKHIDProximityEventProcessor *)self _lock_postSyntheticEventWithDetectionMaskToClients:1024];
      }
    }
  }
  if (!self->_rawDetectionMask)
  {
    long long v33 = [v9 destinationsForEvent:v10 fromSender:v8];
    if ([v33 count])
    {
      id v34 = [v33 mutableCopy];
      [v34 minusSet:v39];
      [(BKHIDProximityEventProcessor *)self _locked_postEventWithDetectionMask:0 toDestinations:v34 dispatcher:v9 reason:@"HID zero mask"];
    }
  }
  [(BKHIDProximityEventProcessor *)self _locked_notifyIfNeededCurrentDetectionMaskChangeWithTimstamp:IOHIDEventGetTimeStamp()];
  os_unfair_lock_unlock(p_lock);

  return 1;
}

- (void)setShouldSuppressTouchesWhileObjectWithinProximity:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_shouldSuppressTouchesWhileObjectWithinProximity = a3;
  [(BKHIDProximityEventProcessor *)self _locked_updateTouchSuppressionAssertion];

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)shouldSuppressTouchesWhileObjectWithinProximity
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_shouldSuppressTouchesWhileObjectWithinProximity;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isProximityDetectionActive
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_proximityDetectionActive;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isObjectWithinProximity
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_objectWithinProximity;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_sensorModeChangeObserverToken invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BKHIDProximityEventProcessor;
  [(BKHIDProximityEventProcessor *)&v3 dealloc];
}

- (BKHIDProximityEventProcessor)initWithContext:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)BKHIDProximityEventProcessor;
  id v5 = [(BKHIDProximityEventProcessor *)&v34 init];
  uint64_t v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v5->_lock_shouldSuppressTouchesWhileObjectWithinProximity = 1;
    uint64_t v7 = +[BKSProximityDetectionMaskChangeEvent build:&stru_1000F6C20];
    lock_lastEvent = v6->_lock_lastEvent;
    v6->_lock_lastEvent = (BKSProximityDetectionMaskChangeEvent *)v7;

    id v9 = objc_alloc((Class)BKHIDDomainServiceServer);
    uint64_t v10 = BKSProximitySensorBSServiceName;
    int v11 = BKLogUISensor();
    id v12 = (BKHIDDomainServiceServer *)[v9 initWithDelegate:v6 serverTarget:v6 serverProtocol:&OBJC_PROTOCOL___BKSProximitySensorServer_IPC clientProtocol:&OBJC_PROTOCOL___BKSProximitySensorClient_IPC serviceName:v10 queue:&_dispatch_main_q log:v11 entitlement:BKProximityDetectionEntitlement];
    server = v6->_server;
    v6->_server = v12;

    uint64_t v14 = +[BKHIDUISensorController sharedInstance];
    sensorController = v6->_sensorController;
    v6->_sensorController = (BKHIDUISensorController *)v14;

    uint64_t v16 = [(BKHIDUISensorController *)v6->_sensorController addSensorModeChangeObserver:v6];
    sensorModeChangeObserverToken = v6->_sensorModeChangeObserverToken;
    v6->_sensorModeChangeObserverToken = (BSInvalidatable *)v16;

    uint64_t v18 = (BSMutableIntegerMap *)objc_alloc_init((Class)BSMutableIntegerMap);
    eventClients = v6->_eventClients;
    v6->_eventClients = v18;

    objc_initWeak(&location, v6);
    id v20 = objc_alloc((Class)SLGNotificationActivatedLogger);
    id v21 = objc_alloc((Class)SLGActivatableLogger);
    uint64_t v22 = +[SLGLog sharedInstance];
    id v23 = [v21 initWithLogger:v22];
    uint64_t v24 = (SLGNotificationActivatedLogger *)[v20 initWithLogger:v23];
    studyLog = v6->_studyLog;
    v6->_studyLog = v24;

    [(SLGNotificationActivatedLogger *)v6->_studyLog addBeginNotification:@"SBStudyLogBeginCameraButtonLogging" endNotification:@"SBStudyLogEndCameraButtonLogging"];
    id v26 = v6->_studyLog;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10004C804;
    v31[3] = &unk_1000F6C48;
    objc_copyWeak(&v32, &location);
    [(SLGNotificationActivatedLogger *)v26 setActivationHandler:v31];
    id v27 = v6->_studyLog;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10004C8C4;
    v29[3] = &unk_1000F6C48;
    objc_copyWeak(&v30, &location);
    [(SLGNotificationActivatedLogger *)v27 setDeactivationHandler:v29];
    [(BKHIDDomainServiceServer *)v6->_server activate];
    objc_destroyWeak(&v30);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }

  return v6;
}

@end