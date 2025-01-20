@interface BKHIDDirectTouchEventProcessor
+ (NSArray)digitizerMatchingDictionaries;
- (BKHIDDirectTouchEventProcessor)initWithContext:(id)a3;
- (BKIOHIDService)mainDisplayAOPDigitizerService;
- (BKIOHIDService)mainDisplayDigitizerService;
- (BKIOHIDService)mainDisplayPencilDigitizerService;
- (BOOL)_queue_hasTouchEnterSlots;
- (BOOL)detachTouchIdentifiers:(unsigned int *)a3 count:(int64_t)a4 assignUserIdentifier:(unsigned int)a5 policy:(id)a6 offset:(CGPoint)a7;
- (BOOL)handlesPersistentPropertiesForSenderDescriptor:(id)a3;
- (BOOL)shouldIgnoreTouchesWhileObjectInProximity;
- (id)_determineServiceForEvent:(__IOHIDEvent *)a3 sender:(id)a4 fromTouchPad:(BOOL *)a5;
- (id)_persistentPropertyKeyDenylist;
- (id)_queue_addDigitizerStateForService:(id)a3;
- (id)_queue_applyCachedPropertiesToMultitouchService:(id)a3;
- (id)_queue_contextIDsToIgnoreForZoomSenders;
- (id)_queue_digitizerStateForService:(id)a3;
- (id)_queue_displayInfoForDisplay:(id)a3 createIfNeeded:(BOOL)a4;
- (id)_queue_servicesMatchingSenderDescriptor:(id)a3;
- (id)_queue_slotRecordForSlotID:(unsigned int)a3;
- (id)_queue_touchStreamClientForReference:(unsigned int)a3;
- (id)_queue_touchStreamInfoForDisplayUUID:(id)a3 createIfNeeded:(BOOL)a4;
- (id)authenticationSpecificationForSlotID:(unsigned int)a3 registrantEntitled:(BOOL *)a4;
- (id)cancelAndSuppressTouchesOnDisplay:(id)a3 reason:(id)a4;
- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5;
- (int64_t)setPersistentProperties:(id)a3 forServicesMatchingDescriptor:(id)a4;
- (unsigned)_queue_addTouchStreamClient:(id)a3 toDisplayUUID:(id)a4 versionedPID:(int64_t)a5;
- (unsigned)addTouchStreamForContextID:(unsigned int)a3 display:(id)a4 versionedPID:(int64_t)a5 identifier:(unsigned int)a6 shouldSendAmbiguityRecommendations:(BOOL)a7;
- (void)_handleDirectTouchEvent:(__IOHIDEvent *)a3 service:(id)a4;
- (void)_queue_addServicesMatchingSenderDescriptor:(id)a3 inPerDisplayInfo:(id)a4 toArray:(id)a5;
- (void)_queue_enumerateDigitizersForAllDisplaysUsingBlock:(id)a3;
- (void)_queue_enumerateDigitizersForDisplay:(id)a3 usingBlock:(id)a4;
- (void)_queue_enumerateTouchStreamsForAllDisplaysUsingBlock:(id)a3;
- (void)_queue_resetTouchAuthenticationInitialSampleEvent;
- (void)_queue_windowServerDidDeleteSlotID:(unsigned int)a3;
- (void)addTouchAuthenticationSpecifications:(id)a3 registrantEntitled:(BOOL)a4;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)applyExtendedHitTestInformationForCAScreenCoordinates:(CGPoint)a3 displayUUID:(id)a4 toPathAttributes:(id)a5 secureName:(unsigned int)a6 excludeContextIDs:(id)a7;
- (void)cancelTouchesOnAllDisplays;
- (void)cancelTouchesOnDisplay:(id)a3;
- (void)cancelTouchesOnMainDisplay;
- (void)cancelTouchesWithIdentifiers:(id)a3;
- (void)dealloc;
- (void)didInitializeRegistryWithContext:(id)a3;
- (void)globalKeyboardModifiersDidChange:(int64_t)a3;
- (void)invalidateTouchStreamReference:(unsigned int)a3;
- (void)matcher:(id)a3 servicesDidMatch:(id)a4;
- (void)postTouchAnnotations:(id)a3 sourcePID:(int)a4;
- (void)serviceDidDisappear:(id)a3;
- (void)setBuiltInDisplayInterfaceOrientation:(int64_t)a3;
- (void)setEventDispatchMode:(unsigned __int8)a3 ambiguityRecommendation:(unsigned __int8)a4 lastTouchTimestamp:(double)a5 forTouchStreamIdentifier:(unsigned int)a6;
- (void)setExcludedZoomContextIDs:(id)a3 fromVersionedPID:(int64_t)a4;
- (void)setHitTestRegions:(id)a3 forDisplay:(id)a4;
- (void)setOffset:(CGPoint)a3 forTouchesWithUserIdentifier:(unsigned int)a4;
- (void)setRoutingPolicy:(id)a3 forTouchesWithUserIdentifier:(unsigned int)a4;
- (void)setShouldIgnoreTouchesWhileObjectInProximity:(BOOL)a3;
- (void)transferTouchIdentifiers:(unsigned int *)a3 count:(int64_t)a4 toContextID:(unsigned int)a5;
@end

@implementation BKHIDDirectTouchEventProcessor

- (void)setEventDispatchMode:(unsigned __int8)a3 ambiguityRecommendation:(unsigned __int8)a4 lastTouchTimestamp:(double)a5 forTouchStreamIdentifier:(unsigned int)a6
{
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  unsigned __int8 v12 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  unsigned __int8 v10 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000193CC;
  block[3] = &unk_1000F7288;
  unsigned int v8 = a6;
  block[4] = self;
  block[5] = v9;
  block[6] = v11;
  *(double *)&block[7] = a5;
  dispatch_async(queue, block);
  _Block_object_dispose(v9, 8);
  _Block_object_dispose(v11, 8);
}

- (id)_queue_touchStreamClientForReference:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  queue_referenceToTouchStreamClient = self->_queue_referenceToTouchStreamClient;
  v6 = +[NSNumber numberWithUnsignedInt:v3];
  v7 = [(NSMutableDictionary *)queue_referenceToTouchStreamClient objectForKeyedSubscript:v6];

  return v7;
}

- (void)cancelTouchesOnDisplay:(id)a3
{
  v5 = BKLogTouchEvents();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = a3;
    id v7 = [v6 length];
    unsigned int v8 = (void *)BKSDisplayUUIDMainKey;
    if (v7) {
      unsigned int v8 = v6;
    }
    id v9 = v8;

    *(_DWORD *)buf = 138543362;
    id v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "soft cancel on display:%{public}@", buf, 0xCu);
  }
  queue = self->_queue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001ACAC;
  v12[3] = &unk_1000F8E50;
  v12[4] = self;
  v12[5] = a3;
  dispatch_async(queue, v12);
  v11 = +[BKTouchPadManager sharedInstance];
  [v11 sendCancelEventForDisplay:a3];
}

- (id)_queue_applyCachedPropertiesToMultitouchService:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = [a3 displayUUID];
  if ([a3 primaryUsagePage] == 13 && objc_msgSend(a3, "primaryUsage") == 4)
  {
    uint64_t v16 = 0x3FF0000000000000;
    sub_100011044(v5, 0, 0, (double *)&v16, 0, 0);
    double v6 = *(double *)&v16;
    id v7 = BKLogTouchEvents();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [a3 senderID];
      *(_DWORD *)buf = 134218240;
      id v18 = v8;
      __int16 v19 = 1024;
      LODWORD(v20) = (int)(v6 * 160.0);
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "service %llX setProperty:%d forKey:QuantizationDPI", buf, 0x12u);
    }

    id v9 = +[NSNumber numberWithInt:(int)(v6 * 160.0)];
    [a3 setProperty:v9 forKey:@"QuantizationDPI"];
  }
  persistentPropertyController = self->_persistentPropertyController;
  v11 = [a3 senderDescriptor];
  unsigned __int8 v12 = [(BKIOHIDServicePersistentPropertyController *)persistentPropertyController allPersistentPropertiesForServicesMatchingDescriptor:v11];

  if ([v12 count])
  {
    v13 = BKLogTouchEvents();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [a3 senderID];
      *(_DWORD *)buf = 134218242;
      id v18 = v14;
      __int16 v19 = 2114;
      v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "service %llX restore persistent props %{public}@", buf, 0x16u);
    }

    [a3 setProperties:v12];
  }

  return v12;
}

- (void)serviceDidDisappear:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = BKLogTouchEvents();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 134218240;
    id v19 = [a3 senderID];
    __int16 v20 = 1024;
    unsigned int v21 = [a3 isBuiltIn];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "digitizer detached (sender %llX) builtIn:%d", (uint8_t *)&v18, 0x12u);
  }

  if (self->_queue_mainDisplayDigitizerService == a3)
  {
    double v6 = BKLogTouchEvents();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v18) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "*** lost main display digitizer ***", (uint8_t *)&v18, 2u);
    }

    queue_mainDisplayDigitizerService = self->_queue_mainDisplayDigitizerService;
    self->_queue_mainDisplayDigitizerService = 0;
  }
  if (self->_queue_mainDisplayPencilDigitizerService == a3)
  {
    id v8 = BKLogTouchEvents();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v18) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "*** lost pencil digitizer ***", (uint8_t *)&v18, 2u);
    }

    queue_mainDisplayPencilDigitizerService = self->_queue_mainDisplayPencilDigitizerService;
    self->_queue_mainDisplayPencilDigitizerService = 0;
  }
  id v10 = [a3 displayUUID];
  id v11 = [v10 length];
  unsigned __int8 v12 = (void *)BKSDisplayUUIDMainKey;
  if (v11) {
    unsigned __int8 v12 = v10;
  }
  id v13 = v12;

  id v14 = [(BKHIDDirectTouchEventProcessor *)self _queue_digitizerStateForService:a3];
  v15 = BKLogTouchEvents();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138543362;
    id v19 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "cancel -- digitizer did disappear:%{public}@", (uint8_t *)&v18, 0xCu);
  }

  [v14 invalidate];
  uint64_t v16 = [(NSMutableDictionary *)self->_queue_perDisplayInfo objectForKey:v13];
  v17 = (void *)v16;
  if (v16) {
    [*(id *)(v16 + 48) removeObjectForKey:a3];
  }
}

- (void)matcher:(id)a3 servicesDidMatch:(id)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  double v6 = +[BKHIDSystemInterface sharedInstance];
  id v7 = [v6 senderCache];

  v32 = v7;
  [v7 addSenderInfo:a4];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v8 = a4;
  id v9 = [v8 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v34;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(v8);
        }
        unsigned __int8 v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        unsigned int v13 = [v12 isBuiltIn];
        id v14 = BKLogTouchEvents();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = [v12 senderID];
          *(_DWORD *)buf = 134218242;
          double v38 = *(double *)&v15;
          __int16 v39 = 2114;
          v40 = v12;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "digitizer attached (sender %llX) service:%{public}@", buf, 0x16u);
        }

        if (v13)
        {
          unsigned int v16 = [v12 primaryUsagePage];
          unsigned int v17 = [v12 primaryUsage] | (v16 << 16);
          switch(v17)
          {
            case 0xD0001u:
              if (!self->_queue_mainDisplayAOPDigitizerService)
              {
                v29 = BKLogTouchEvents();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "*** acquired AOP digitizer", buf, 2u);
                }

                v30 = v12;
                queue_mainDisplayAOPDigitizerService = self->_queue_mainDisplayAOPDigitizerService;
                self->_queue_mainDisplayAOPDigitizerService = v30;
                break;
              }
              queue_mainDisplayAOPDigitizerService = BKLogTouchEvents();
              if (os_log_type_enabled(queue_mainDisplayAOPDigitizerService, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                id v19 = queue_mainDisplayAOPDigitizerService;
                __int16 v20 = "*** already have an AOP digitizer";
LABEL_21:
                uint32_t v21 = 2;
                goto LABEL_24;
              }
              break;
            case 0xD0004u:
              if (!self->_queue_mainDisplayDigitizerService)
              {
                v22 = BKLogTouchEvents();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                {
                  BSContinuousMachTimeNow();
                  double v24 = v23 - self->_queue_startMainDisplayDigitizerMatchingTime;
                  *(_DWORD *)buf = 134217984;
                  double v38 = v24;
                  _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "*** acquired main display digitizer (after %gs)", buf, 0xCu);
                }

                [(BSContinuousMachTimer *)self->_queue_mainDisplayDigitizerSentinelTimer invalidate];
                queue_mainDisplayDigitizerSentinelTimer = self->_queue_mainDisplayDigitizerSentinelTimer;
                self->_queue_mainDisplayDigitizerSentinelTimer = 0;

                v26 = v12;
                queue_mainDisplayAOPDigitizerService = self->_queue_mainDisplayDigitizerService;
                self->_queue_mainDisplayDigitizerService = v26;
                break;
              }
              queue_mainDisplayAOPDigitizerService = BKLogTouchEvents();
              if (os_log_type_enabled(queue_mainDisplayAOPDigitizerService, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                id v19 = queue_mainDisplayAOPDigitizerService;
                __int16 v20 = "*** already have a main display digitizer";
                goto LABEL_21;
              }
              break;
            case 0xD0020u:
              if (self->_queue_mainDisplayPencilDigitizerService)
              {
                queue_mainDisplayAOPDigitizerService = BKLogTouchEvents();
                if (os_log_type_enabled(queue_mainDisplayAOPDigitizerService, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  id v19 = queue_mainDisplayAOPDigitizerService;
                  __int16 v20 = "*** already have a pencil digitizer";
                  goto LABEL_21;
                }
              }
              else
              {
                v27 = BKLogTouchEvents();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "*** acquired pencil digitizer", buf, 2u);
                }

                v28 = v12;
                queue_mainDisplayAOPDigitizerService = self->_queue_mainDisplayPencilDigitizerService;
                self->_queue_mainDisplayPencilDigitizerService = v28;
              }
              break;
            default:
              queue_mainDisplayAOPDigitizerService = BKLogTouchEvents();
              if (!os_log_type_enabled(queue_mainDisplayAOPDigitizerService, OS_LOG_TYPE_ERROR)) {
                break;
              }
              *(_DWORD *)buf = 67109120;
              LODWORD(v38) = v17;
              id v19 = queue_mainDisplayAOPDigitizerService;
              __int16 v20 = "*** unexpected digitizer usage pair 0x%X";
              uint32_t v21 = 8;
LABEL_24:
              _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, v20, buf, v21);
              break;
          }
        }
        id v31 = [(BKHIDDirectTouchEventProcessor *)self _queue_addDigitizerStateForService:v12];
      }
      id v9 = [v8 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v9);
  }
}

- (id)_queue_digitizerStateForService:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [a3 displayUUID];
  id v6 = [v5 length];
  id v7 = (void *)BKSDisplayUUIDMainKey;
  if (v6) {
    id v7 = v5;
  }
  id v8 = v7;

  uint64_t v9 = [(BKHIDDirectTouchEventProcessor *)self _queue_displayInfoForDisplay:v8 createIfNeeded:1];
  uint64_t v10 = (void *)v9;
  if (v9)
  {
    id v11 = [*(id *)(v9 + 48) objectForKeyedSubscript:a3];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)setHitTestRegions:(id)a3 forDisplay:(id)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000CB28;
  block[3] = &unk_1000F8E08;
  block[4] = self;
  block[5] = a4;
  block[6] = a3;
  dispatch_async(queue, block);
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  id v8 = *a3;
  double v24 = v8;
  BOOL v23 = 0;
  uint64_t v9 = [(BKHIDDirectTouchEventProcessor *)self _determineServiceForEvent:v8 sender:a4 fromTouchPad:&v23];
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = [(__IOHIDEvent *)v9 displayUUID];
    unsigned int v12 = [(__IOHIDEvent *)v10 primaryUsagePage];
    unsigned int v13 = [(__IOHIDEvent *)v10 primaryUsage];
    if (v23)
    {
LABEL_3:
      id v14 = +[BKTouchPadManager sharedInstance];
      [v14 processEvent:&v24 sender:a4 dispatcher:a5];
LABEL_4:

      goto LABEL_7;
    }
    if (v12 == 13)
    {
      BOOL v16 = v13 == 12 || v13 == 5;
      BOOL v23 = v16;
      if (v13 == 12 || v13 == 5) {
        goto LABEL_3;
      }
    }
    else
    {
      BOOL v23 = 0;
    }
    if ((v11 != 0) != [(__IOHIDEvent *)v10 isBuiltIn])
    {
      unsigned int v17 = [(__IOHIDEvent *)v10 primaryUsagePage];
      unsigned int v18 = ([(__IOHIDEvent *)v10 primaryUsage] | (v17 << 16)) - 851969;
      if (v18 <= 0x1F && ((1 << v18) & 0x80000009) != 0)
      {
        [(BKHIDDirectTouchEventProcessor *)self _handleDirectTouchEvent:v8 service:v10];
        goto LABEL_7;
      }
    }
    id v14 = BKLogTouchEvents();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v19 = v11;
      id v20 = [v19 length];
      uint32_t v21 = BKSDisplayUUIDMainKey;
      if (v20) {
        uint32_t v21 = v19;
      }
      v22 = v21;

      *(_DWORD *)buf = 138543874;
      id v26 = v22;
      __int16 v27 = 2114;
      v28 = v10;
      __int16 v29 = 2114;
      v30 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "ignoring digitizer event for display %{public}@ from unsupported service: (%{public}@):%{public}@", buf, 0x20u);
    }
    goto LABEL_4;
  }
  id v11 = BKLogTouchEvents();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v26 = a4;
    __int16 v27 = 2114;
    v28 = v8;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "ignoring digitizer event from non-digitizer sender (%{public}@):%{public}@", buf, 0x16u);
  }
LABEL_7:

  return 0;
}

- (void)_handleDirectTouchEvent:(__IOHIDEvent *)a3 service:(id)a4
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  if (!a4)
  {
    uint64_t v9 = +[NSString stringWithFormat:@"must have a service here"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      id v11 = (objc_class *)objc_opt_class();
      unsigned int v12 = NSStringFromClass(v11);
      *(_DWORD *)buf = 138544642;
      id v15 = v10;
      __int16 v16 = 2114;
      unsigned int v17 = v12;
      __int16 v18 = 2048;
      id v19 = self;
      __int16 v20 = 2114;
      CFStringRef v21 = @"BKHIDDirectTouchEventProcessor.mm";
      __int16 v22 = 1024;
      int v23 = 1236;
      __int16 v24 = 2114;
      v25 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v9 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x10000BC94);
  }
  if (byte_100122F38)
  {
    if (a3) {
      IOHIDEventGetTimeStamp();
    }
    kdebug_trace();
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A6A0;
  block[3] = &unk_1000F7868;
  block[4] = self;
  block[5] = a4;
  block[6] = a3;
  dispatch_sync(queue, block);
  if (byte_100122F38)
  {
    if (a3) {
      IOHIDEventGetTimeStamp();
    }
    kdebug_trace();
  }
}

- (id)_determineServiceForEvent:(__IOHIDEvent *)a3 sender:(id)a4 fromTouchPad:(BOOL *)a5
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (id v8 = a4) == 0)
  {
    uint64_t v12 = objc_opt_class();
    id v13 = a4;
    if (v12)
    {
      if (objc_opt_isKindOfClass()) {
        id v14 = v13;
      }
      else {
        id v14 = 0;
      }
    }
    else
    {
      id v14 = 0;
    }
    id v15 = v14;

    uint64_t v9 = 0;
    BOOL v16 = 0;
    goto LABEL_27;
  }
  uint64_t v9 = v8;
  id v10 = [v8 displayUUID];

  if (v10)
  {
    id v11 = BKLogTouchEvents();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v19 = [v9 displayUUID];
      int v20 = 138543362;
      CFStringRef v21 = v19;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Not supported: accessibility digitizer for external display (%{public}@)", (uint8_t *)&v20, 0xCu);
    }
LABEL_26:

    BOOL v16 = 0;
    id v15 = 0;
    goto LABEL_27;
  }
  if ([v9 isPencilDigitizer])
  {
    id v15 = [(BKHIDDirectTouchEventProcessor *)self mainDisplayPencilDigitizerService];
    if (v15) {
      goto LABEL_19;
    }
    unsigned int v17 = BKLogTouchEvents();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v20) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Pencil AX event, but pencil digitizer is missing", (uint8_t *)&v20, 2u);
    }
  }
  id v15 = [(BKHIDDirectTouchEventProcessor *)self mainDisplayDigitizerService];
LABEL_19:
  if (IOHIDEventGetType() != 11)
  {
    BOOL v16 = 0;
    if (v15) {
      goto LABEL_27;
    }
    goto LABEL_23;
  }
  BOOL v16 = IOHIDEventGetIntegerValue() == 0;
  if (!v15)
  {
LABEL_23:
    if (v16) {
      goto LABEL_27;
    }
    id v11 = BKLogTouchEvents();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v20) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "AX event, but main screen digitizer is missing", (uint8_t *)&v20, 2u);
    }
    goto LABEL_26;
  }
LABEL_27:
  *a5 = v16;

  return v15;
}

- (id)_queue_addDigitizerStateForService:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v63 = [(BKHIDDirectTouchEventProcessor *)self _queue_applyCachedPropertiesToMultitouchService:a3];
  id v5 = [a3 displayUUID];
  id v6 = [v5 length];
  id v7 = (void *)BKSDisplayUUIDMainKey;
  if (v6) {
    id v7 = v5;
  }
  id v8 = v7;

  v62 = v8;
  uint64_t v9 = [BKTouchDeliveryStatisticsLoggingObserver alloc];
  id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%llX-%@", [a3 senderID], v8);
  v64 = [(BKTouchDeliveryStatisticsLoggingObserver *)v9 initWithLabel:v10];

  uint64_t v11 = [(BKHIDDirectTouchEventProcessor *)self _queue_displayInfoForDisplay:v8 createIfNeeded:1];
  uint64_t v12 = +[BKTouchDeliveryObservationManager sharedInstance];
  id v13 = [BKDirectTouchState alloc];
  if (v13
    && (dispatcher = self->_dispatcher,
        v65.receiver = v13,
        v65.super_class = (Class)BKDirectTouchState,
        (id v15 = [(BKHIDDirectTouchEventProcessor *)&v65 init]) != 0))
  {
    uint64_t v16 = objc_opt_class();
    if (v16 != objc_opt_class())
    {
      v58 = +[NSString stringWithFormat:@"Subclasses not allowed"];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector("initWithHIDService:eventProcessor:displayInfo:dispatcher:touchDeliveryObserver:statisticsObserver:deliveryPolicyServer:eventSystemInteface:");
        id v59 = (id)objc_claimAutoreleasedReturnValue();
        v60 = (objc_class *)objc_opt_class();
        v61 = NSStringFromClass(v60);
        *(_DWORD *)v66 = 138544642;
        *(void *)&v66[4] = v59;
        *(_WORD *)&v66[12] = 2114;
        *(void *)&v66[14] = v61;
        __int16 v67 = 2048;
        v68 = v15;
        __int16 v69 = 2114;
        CFStringRef v70 = @"BKDirectTouchState.mm";
        __int16 v71 = 1024;
        int v72 = 199;
        __int16 v73 = 2114;
        v74 = v58;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v66, 0x3Au);
      }
      [v58 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x10000C6E8);
    }
    objc_storeStrong((id *)&v15->_queue, a3);
    objc_storeStrong((id *)&v15->_touchEventServer, self);
    objc_storeStrong((id *)&v15->_matchers, (id)v11);
    objc_storeStrong((id *)&v15->_pencilOpaqueTouchPersistentPropertySupport, dispatcher);
    objc_storeStrong((id *)&v15->_queue_mainDisplayAOPDigitizerService, v12);
    objc_storeStrong((id *)&v15->_queue_mainDisplayDigitizerService, 0);
    objc_storeStrong((id *)&v15->_queue_mainDisplayDigitizerSentinelTimer, 0);
    unsigned int v17 = objc_alloc_init(BKTouchContactSet);
    globalKeyboardObserver = v15->_globalKeyboardObserver;
    v15->_globalKeyboardObserver = (BSInvalidatable *)v17;

    id v19 = (NSMutableDictionary *)objc_alloc_init((Class)BSMutableIntegerMap);
    queue_perDisplayInfo = v15->_queue_perDisplayInfo;
    v15->_queue_perDisplayInfo = v19;

    CFStringRef v21 = (NSMutableDictionary *)objc_alloc_init((Class)BSMutableIntegerMap);
    queue_referenceToTouchStreamClient = v15->_queue_referenceToTouchStreamClient;
    v15->_queue_referenceToTouchStreamClient = v21;

    id v23 = objc_alloc_init((Class)BSMutableIntegerMap);
    __int16 v24 = *(void **)&v15->_queue_previousVendedTouchStreamReference;
    *(void *)&v15->_queue_previousVendedTouchStreamReference = v23;

    v25 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableSet);
    queue_slotIDToSlotRecord = v15->_queue_slotIDToSlotRecord;
    v15->_queue_slotIDToSlotRecord = v25;

    __int16 v27 = [BKDirectTouchStateHitTester alloc];
    v28 = v15;
    __int16 v29 = self;
    id v30 = (id)v11;
    if (v27)
    {
      *(void *)v66 = v27;
      *(void *)&v66[8] = BKDirectTouchStateHitTester;
      id v31 = (BKDirectTouchStateHitTester *)[v66 init];
      __int16 v27 = v31;
      if (v31)
      {
        objc_storeStrong((id *)&v31->_state, v15);
        objc_storeStrong((id *)&v27->_eventProcessor, self);
        objc_storeStrong((id *)&v27->_displayInfo, (id)v11);
        objc_storeStrong((id *)&v27->_touchDeliveryPolicyServer, 0);
      }
    }

    id v32 = v28[3];
    v28[3] = v27;

    long long v33 = [BKDirectTouchUpdateEvents alloc];
    if (v33)
    {
      *(void *)v66 = v33;
      *(void *)&v66[8] = BKDirectTouchUpdateEvents;
      long long v34 = (id *)[super init];
      long long v35 = v34;
      if (v34) {
        objc_storeStrong(v34 + 3, v15);
      }
    }
    else
    {
      long long v35 = 0;
    }
    id v36 = v28[23];
    v28[23] = v35;

    id v37 = objc_alloc_init((Class)NSMutableArray);
    id v38 = v28[9];
    v28[9] = v37;

    if (v64) {
      [v28[9] addObject:v64];
    }
    if (v12) {
      [v28[9] addObject:v12];
    }
    *((unsigned char *)v28 + 205) = [a3 primaryUsage] == 32;
    __int16 v39 = [(OS_dispatch_queue *)v15->_queue propertyForKey:@"MaxHoverHeight"];
    v40 = v39;
    if (v39)
    {
      [v39 doubleValue];
      v28[24] = v41;
    }
    v42 = +[BKSDefaults localDefaults];
    sub_10000C820((uint64_t)v28, (uint64_t)[v42 digitizerVisualizeTouches], (uint64_t)[v42 digitizerVisualizeHitTestRegions]);
    v43 = BKLogTouchEvents();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v66 = 138543362;
      *(void *)&v66[4] = v28;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "init: %{public}@", v66, 0xCu);
    }
  }
  else
  {
    v28 = 0;
  }
  v44 = v28;
  id v45 = a3;
  if (v11)
  {
    v46 = *(void **)(v11 + 48);
    if (!v46)
    {
      id v47 = objc_alloc_init((Class)NSMutableDictionary);
      v48 = *(void **)(v11 + 48);
      *(void *)(v11 + 48) = v47;

      v46 = *(void **)(v11 + 48);
    }
    [v46 setObject:v44 forKeyedSubscript:v45];
  }

  int64_t queue_interfaceOrientation = self->_queue_interfaceOrientation;
  if (queue_interfaceOrientation && v44) {
    v44[19] = (id)queue_interfaceOrientation;
  }
  v50 = [v63 objectForKey:@"HoverDisabled"];
  unsigned int v51 = [v50 BOOLValue];

  if (v51)
  {
    if (!v44) {
      goto LABEL_34;
    }
    *((unsigned char *)v44 + 209) = 1;
  }
  else if (!v44)
  {
    goto LABEL_34;
  }
  v44[13] = self->_queue_activeModifiers;
LABEL_34:
  if (v11)
  {
    id v52 = *(id *)(v11 + 32);
    if (v52) {
      sub_10001616C((uint64_t)v44, v52);
    }
  }
  else
  {
    id v52 = 0;
  }
  v53 = +[BKSDefaults localDefaults];
  id v54 = [v53 digitizerVisualizeTouches];

  v55 = +[BKSDefaults localDefaults];
  id v56 = [v55 digitizerVisualizeHitTestRegions];

  sub_10000C820((uint64_t)v44, (uint64_t)v54, (uint64_t)v56);
  [v45 addDisappearanceObserver:self queue:self->_queue];

  return v44;
}

- (void)_queue_enumerateDigitizersForDisplay:(id)a3 usingBlock:(id)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v7 = a3;
  id v8 = [v7 length];
  uint64_t v9 = (void *)BKSDisplayUUIDMainKey;
  if (v8) {
    uint64_t v9 = v7;
  }
  id v10 = v9;

  uint64_t v11 = [(NSMutableDictionary *)self->_queue_perDisplayInfo objectForKeyedSubscript:v10];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v12 = sub_10000CDE8(v11);
  id v13 = [v12 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v17;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v12);
        }
        (*((void (**)(id, void))a4 + 2))(a4, *(void *)(*((void *)&v16 + 1) + 8 * (void)v15));
        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v12 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (id)_queue_displayInfoForDisplay:(id)a3 createIfNeeded:(BOOL)a4
{
  if (!a3) {
    __assert_rtn("-[BKHIDDirectTouchEventProcessor _queue_displayInfoForDisplay:createIfNeeded:]", "BKHIDDirectTouchEventProcessor.mm", 1054, "displayUUID");
  }
  BOOL v4 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  queue_perDisplayInfo = self->_queue_perDisplayInfo;
  if (!queue_perDisplayInfo)
  {
    id v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    uint64_t v9 = self->_queue_perDisplayInfo;
    self->_queue_perDisplayInfo = v8;

    queue_perDisplayInfo = self->_queue_perDisplayInfo;
  }
  id v10 = [(NSMutableDictionary *)queue_perDisplayInfo objectForKeyedSubscript:a3];
  if (v10) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = !v4;
  }
  if (!v11)
  {
    id v10 = objc_alloc_init(BKDirectTouchPerDisplayInfo);
    if ([a3 isEqualToString:BKSDisplayUUIDMainKey]) {
      +[BKSHIDEventDisplay builtinDisplay];
    }
    else {
    uint64_t v12 = +[BKSHIDEventDisplay displayWithHardwareIdentifier:a3];
    }
    if (v10) {
      objc_storeStrong((id *)&v10->_display, v12);
    }
    defaultDisplayController = self->_defaultDisplayController;
    if (defaultDisplayController)
    {
      uint64_t v14 = defaultDisplayController;
    }
    else
    {
      uint64_t v14 = +[BKDisplayController sharedInstance];
    }
    id v15 = v14;
    if (v10) {
      objc_storeStrong((id *)&v10->_displayController, v14);
    }

    [(NSMutableDictionary *)self->_queue_perDisplayInfo setObject:v10 forKeyedSubscript:a3];
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultDisplayController, 0);
  objc_storeStrong((id *)&self->_queue_zoomExcludedContextIDs, 0);
  objc_storeStrong((id *)&self->_queue_zoomDeathWatcher, 0);
  objc_storeStrong((id *)&self->_queue_touchEnterSlotIDs, 0);
  objc_storeStrong((id *)&self->_queue_slotIDToSlotRecord, 0);
  objc_storeStrong((id *)&self->_queue_referenceToTouchStreamClient, 0);
  objc_storeStrong((id *)&self->_queue_perDisplayInfo, 0);
  objc_storeStrong((id *)&self->_globalKeyboardObserver, 0);
  objc_storeStrong((id *)&self->_queue_mainDisplayDigitizerSentinelTimer, 0);
  objc_storeStrong((id *)&self->_queue_mainDisplayPencilDigitizerService, 0);
  objc_storeStrong((id *)&self->_queue_mainDisplayAOPDigitizerService, 0);
  objc_storeStrong((id *)&self->_queue_mainDisplayDigitizerService, 0);
  objc_storeStrong((id *)&self->_pencilOpaqueTouchPersistentPropertySupport, 0);
  objc_storeStrong((id *)&self->_matchers, 0);
  objc_storeStrong((id *)&self->_persistentPropertyController, 0);
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_storeStrong((id *)&self->_touchEventServer, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)_queue_servicesMatchingSenderDescriptor:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = [a3 associatedDisplay];
  id v7 = v6;
  if (v6)
  {
    if ([v6 _isNullDisplay])
    {
      id v8 = BKLogTouchEvents();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)CFStringRef v21 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "touch services cannot match nullDisplay", v21, 2u);
      }
    }
    else
    {
      id v13 = [v7 _hardwareIdentifier];
      queue_perDisplayInfo = self->_queue_perDisplayInfo;
      id v15 = v13;
      id v16 = [v15 length];
      long long v17 = (void *)BKSDisplayUUIDMainKey;
      if (v16) {
        long long v17 = v15;
      }
      id v18 = v17;

      long long v19 = [(NSMutableDictionary *)queue_perDisplayInfo objectForKey:v18];

      [(BKHIDDirectTouchEventProcessor *)self _queue_addServicesMatchingSenderDescriptor:a3 inPerDisplayInfo:v19 toArray:v5];
    }
  }
  else
  {
    [(NSMutableDictionary *)self->_queue_perDisplayInfo allValues];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v23;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v9);
          }
          [(BKHIDDirectTouchEventProcessor *)self _queue_addServicesMatchingSenderDescriptor:a3 inPerDisplayInfo:*(void *)(*((void *)&v22 + 1) + 8 * i) toArray:v5];
        }
        id v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v10);
    }
  }

  return v5;
}

- (void)_queue_addServicesMatchingSenderDescriptor:(id)a3 inPerDisplayInfo:(id)a4 toArray:(id)a5
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = sub_10000CDE8((id *)a4);
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v10);
        if (v11) {
          uint64_t v11 = (void *)v11[1];
        }
        uint64_t v12 = v11;
        id v13 = [v12 senderDescriptor:v14];
        if ([v13 matchesDescriptor:a3 failureReason:0]) {
          [a5 addObject:v12];
        }

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (id)_queue_contextIDsToIgnoreForZoomSenders
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  queue_zoomExcludedContextIDs = self->_queue_zoomExcludedContextIDs;

  return queue_zoomExcludedContextIDs;
}

- (id)_queue_slotRecordForSlotID:(unsigned int)a3
{
  if (a3)
  {
    uint64_t v3 = *(void *)&a3;
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    queue_slotIDToSlotRecord = self->_queue_slotIDToSlotRecord;
    id v6 = +[NSNumber numberWithUnsignedInt:v3];
    id v7 = [(NSMutableDictionary *)queue_slotIDToSlotRecord objectForKeyedSubscript:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)_queue_hasTouchEnterSlots
{
  return [(NSMutableOrderedSet *)self->_queue_touchEnterSlotIDs count] != 0;
}

- (unsigned)_queue_addTouchStreamClient:(id)a3 toDisplayUUID:(id)a4 versionedPID:(int64_t)a5
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unsigned int v8 = self->_queue_previousVendedTouchStreamReference + 1;
  self->_unsigned int queue_previousVendedTouchStreamReference = v8;
  if (a3) {
    *((_DWORD *)a3 + 4) = v8;
  }
  uint64_t v9 = [(BKHIDDirectTouchEventProcessor *)self _queue_touchStreamInfoForDisplayUUID:a4 createIfNeeded:1];
  id v10 = (id *)v9;
  if (v9)
  {
    if (!*(void *)(v9 + 16))
    {
      id v11 = objc_alloc_init((Class)NSMutableArray);
      id v12 = v10[2];
      v10[2] = v11;
    }
    if (a3) {
      objc_storeWeak((id *)a3 + 4, v10);
    }
    [v10[2] addObject:a3];
  }
  queue_referenceToTouchStreamClient = self->_queue_referenceToTouchStreamClient;
  if (!queue_referenceToTouchStreamClient)
  {
    long long v14 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    long long v15 = self->_queue_referenceToTouchStreamClient;
    self->_queue_referenceToTouchStreamClient = v14;

    queue_referenceToTouchStreamClient = self->_queue_referenceToTouchStreamClient;
  }
  long long v16 = +[NSNumber numberWithUnsignedInt:self->_queue_previousVendedTouchStreamReference];
  [(NSMutableDictionary *)queue_referenceToTouchStreamClient setObject:a3 forKeyedSubscript:v16];

  long long v17 = BKLogTouchEvents();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v31 = a3;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "create touch stream %{public}@", buf, 0xCu);
  }

  objc_initWeak(&location, a3);
  queue = self->_queue;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000594C4;
  v27[3] = &unk_1000F8888;
  objc_copyWeak(&v28, &location);
  if (a3)
  {
    if (*((void *)a3 + 7))
    {
      long long v23 = +[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_processDeathWatcher == nil"];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        long long v24 = NSStringFromSelector("watchForProcessDeathOnQueue:block:");
        long long v25 = (objc_class *)objc_opt_class();
        id v26 = NSStringFromClass(v25);
        *(_DWORD *)buf = 138544642;
        id v31 = v24;
        __int16 v32 = 2114;
        long long v33 = v26;
        __int16 v34 = 2048;
        id v35 = a3;
        __int16 v36 = 2114;
        CFStringRef v37 = @"BKDigitizerTouchStreamClient.m";
        __int16 v38 = 1024;
        int v39 = 96;
        __int16 v40 = 2114;
        v41 = v23;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v23 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x10005947CLL);
    }
    id v19 = [objc_alloc((Class)BSProcessDeathWatcher) initWithPID:*((unsigned int *)a3 + 10) queue:queue deathHandler:v27];
    int v20 = (void *)*((void *)a3 + 7);
    *((void *)a3 + 7) = v19;
  }
  unsigned int queue_previousVendedTouchStreamReference = self->_queue_previousVendedTouchStreamReference;
  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

  return queue_previousVendedTouchStreamReference;
}

- (id)_queue_touchStreamInfoForDisplayUUID:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v7 = a3;
  id v8 = [v7 length];
  uint64_t v9 = (void *)BKSDisplayUUIDMainKey;
  if (v8) {
    uint64_t v9 = v7;
  }
  id v10 = v9;

  uint64_t v11 = [(BKHIDDirectTouchEventProcessor *)self _queue_displayInfoForDisplay:v10 createIfNeeded:1];
  id v12 = (id *)v11;
  if (v11) {
    id v13 = *(void **)(v11 + 24);
  }
  else {
    id v13 = 0;
  }
  long long v14 = v13;
  long long v15 = v14;
  if (v4 && !v14)
  {
    long long v16 = objc_alloc_init(BKDigitizerTouchStreamAggregate);
    long long v15 = v16;
    if (v16) {
      objc_setProperty_nonatomic_copy(v16, v17, v10, 8);
    }
    if (v12) {
      objc_storeStrong(v12 + 3, v15);
    }
  }

  return v15;
}

- (void)globalKeyboardModifiersDidChange:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100059730;
  v4[3] = &unk_1000F8C30;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (int64_t)setPersistentProperties:(id)a3 forServicesMatchingDescriptor:(id)a4
{
  [(BKHIDDirectTouchEventProcessor *)self _persistentPropertyKeyDenylist];
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  char v44 = 0;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_100059F9C;
  v38[3] = &unk_1000F7450;
  id v39 = (id)objc_claimAutoreleasedReturnValue();
  __int16 v40 = &v41;
  id v24 = v39;
  [a3 enumerateKeysAndObjectsUsingBlock:v38];
  if (*((unsigned char *)v42 + 24))
  {
    int64_t v7 = 1;
  }
  else
  {
    long long v22 = [a3 objectForKey:@"HoverDisabled"];
    uint64_t v8 = objc_opt_class();
    id v9 = v22;
    if (v8)
    {
      if (objc_opt_isKindOfClass()) {
        id v10 = v9;
      }
      else {
        id v10 = 0;
      }
    }
    else
    {
      id v10 = 0;
    }
    id v11 = v10;

    uint64_t v32 = 0;
    long long v33 = &v32;
    uint64_t v34 = 0x3032000000;
    id v35 = sub_100059FE4;
    __int16 v36 = sub_100059FF4;
    id v37 = 0;
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100059FFC;
    block[3] = &unk_1000F88B0;
    id v31 = &v32;
    block[4] = self;
    block[5] = a4;
    id v13 = v11;
    id v30 = v13;
    dispatch_sync(queue, block);
    long long v23 = v13;
    if ([(id)v33[5] count])
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v14 = (id)v33[5];
      id v15 = [v14 countByEnumeratingWithState:&v25 objects:v49 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v26;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v26 != v16) {
              objc_enumerationMutation(v14);
            }
            id v18 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            id v19 = BKLogTouchEvents();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              int v20 = +[BSDescriptionStream descriptionForRootObject:a3];
              *(_DWORD *)buf = 138543618;
              id v46 = v20;
              __int16 v47 = 2114;
              v48 = v18;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "sending:%{public}@ to:%{public}@", buf, 0x16u);
            }
            [v18 setProperties:a3];
          }
          id v15 = [v14 countByEnumeratingWithState:&v25 objects:v49 count:16];
        }
        while (v15);
      }
    }
    else
    {
      long long v14 = BKLogTouchEvents();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v46 = a4;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "no currently matched services for %{public}@", buf, 0xCu);
      }
    }

    _Block_object_dispose(&v32, 8);
    int64_t v7 = 2;
  }

  _Block_object_dispose(&v41, 8);
  return v7;
}

- (id)_persistentPropertyKeyDenylist
{
  if (qword_100122F40 != -1) {
    dispatch_once(&qword_100122F40, &stru_1000F7428);
  }
  v2 = (void *)qword_100122F48;

  return v2;
}

- (BOOL)handlesPersistentPropertiesForSenderDescriptor:(id)a3
{
  unsigned int v4 = [a3 primaryPage];
  unsigned int v5 = [a3 primaryUsage];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = +[BKHIDDirectTouchEventProcessor digitizerMatchingDictionaries];
  id v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v10 = [v9 objectForKey:@"DeviceUsagePage"];
        unsigned int v11 = [v10 unsignedIntValue];

        id v12 = [v9 objectForKey:@"DeviceUsage"];
        LODWORD(v10) = [v12 unsignedIntValue];

        BOOL v13 = v5 == v10 || v5 == 0;
        if (v4 == v11 && v13)
        {
          BOOL v14 = 1;
          goto LABEL_15;
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 0;
LABEL_15:

  return v14;
}

- (void)_queue_enumerateTouchStreamsForAllDisplaysUsingBlock:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  queue_perDisplayInfo = self->_queue_perDisplayInfo;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10005A514;
  v6[3] = &unk_1000F7408;
  v6[4] = a3;
  [(NSMutableDictionary *)queue_perDisplayInfo enumerateKeysAndObjectsUsingBlock:v6];
}

- (void)_queue_enumerateDigitizersForAllDisplaysUsingBlock:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  queue_perDisplayInfo = self->_queue_perDisplayInfo;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10005A624;
  v6[3] = &unk_1000F7408;
  v6[4] = a3;
  [(NSMutableDictionary *)queue_perDisplayInfo enumerateKeysAndObjectsUsingBlock:v6];
}

- (void)_queue_windowServerDidDeleteSlotID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NSMutableDictionary *)self->_queue_slotIDToSlotRecord count])
  {
    unsigned int v5 = BKLogTouchEvents();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CA didDeleteSlot:%X", (uint8_t *)v7, 8u);
    }

    id v6 = +[NSNumber numberWithUnsignedInt:v3];
    [(NSMutableDictionary *)self->_queue_slotIDToSlotRecord removeObjectForKey:v6];
    [(NSMutableOrderedSet *)self->_queue_touchEnterSlotIDs removeObject:v6];
    [(BKHIDDirectTouchEventProcessor *)self _queue_resetTouchAuthenticationInitialSampleEvent];
  }
}

- (void)applyExtendedHitTestInformationForCAScreenCoordinates:(CGPoint)a3 displayUUID:(id)a4 toPathAttributes:(id)a5 secureName:(unsigned int)a6 excludeContextIDs:(id)a7
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005A91C;
  block[3] = &unk_1000F73E0;
  block[4] = a4;
  block[5] = self;
  *(CGFloat *)&void block[8] = x;
  *(CGFloat *)&block[9] = y;
  unsigned int v16 = a6;
  void block[6] = a5;
  void block[7] = a7;
  dispatch_sync(queue, block);
}

- (void)_queue_resetTouchAuthenticationInitialSampleEvent
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = self->_queue_touchEnterSlotIDs;
  id v4 = [(NSMutableOrderedSet *)v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = -[NSMutableDictionary objectForKey:](self->_queue_slotIDToSlotRecord, "objectForKey:", *(void *)(*((void *)&v12 + 1) + 8 * (void)v7), (void)v12);
        if (v8)
        {
          if ((uint64_t)v7 + v5 >= 2) {
            uint64_t v9 = 1;
          }
          else {
            uint64_t v9 = 2;
          }
          v8[3] = v9;
        }

        uint64_t v7 = (char *)v7 + 1;
      }
      while (v4 != v7);
      id v4 = [(NSMutableOrderedSet *)v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
      v5 += (uint64_t)v7;
    }
    while (v4);
  }

  id v10 = BKLogTouchEvents();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    queue_touchEnterSlotIDs = self->_queue_touchEnterSlotIDs;
    *(_DWORD *)buf = 138543362;
    long long v17 = queue_touchEnterSlotIDs;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "resetTouchAuthenticationInitialSampleEventMasks:%{public}@", buf, 0xCu);
  }
}

- (void)addTouchAuthenticationSpecifications:(id)a3 registrantEntitled:(BOOL)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005AF50;
  block[3] = &unk_1000F73B8;
  block[4] = self;
  block[5] = a3;
  BOOL v6 = a4;
  dispatch_sync(queue, block);
}

- (id)authenticationSpecificationForSlotID:(unsigned int)a3 registrantEntitled:(BOOL *)a4
{
  *a4 = 0;
  if (a3)
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x3032000000;
    long long v12 = sub_100059FE4;
    long long v13 = sub_100059FF4;
    id v14 = 0;
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    _DWORD v7[2] = sub_10005B320;
    v7[3] = &unk_1000F7390;
    unsigned int v8 = a3;
    v7[4] = self;
    v7[5] = &v9;
    v7[6] = a4;
    dispatch_sync(queue, v7);
    id v5 = (id)v10[5];
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)setBuiltInDisplayInterfaceOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = dword_1000BF690[a3 - 1];
  }
  persistentPropertyController = self->_persistentPropertyController;
  CFStringRef v12 = @"GraphicsOrientation";
  uint64_t v7 = +[NSNumber numberWithUnsignedInt:v5];
  long long v13 = v7;
  unsigned int v8 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  uint64_t v9 = +[BKSHIDEventSenderDescriptor anyBuiltinTouchscreenDigitizer];
  [(BKIOHIDServicePersistentPropertyController *)persistentPropertyController setPersistentProperties:v8 forSenderDescriptor:v9];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005B57C;
  block[3] = &unk_1000F8C30;
  block[4] = self;
  block[5] = a3;
  dispatch_async(queue, block);
}

- (void)setExcludedZoomContextIDs:(id)a3 fromVersionedPID:(int64_t)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005B684;
  block[3] = &unk_1000F7868;
  block[4] = self;
  block[5] = a3;
  void block[6] = a4;
  dispatch_async(queue, block);
}

- (void)setShouldIgnoreTouchesWhileObjectInProximity:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_shouldIgnoreTouchesWhileObjectInProximitCGFloat y = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)shouldIgnoreTouchesWhileObjectInProximity
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_shouldIgnoreTouchesWhileObjectInProximity;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)postTouchAnnotations:(id)a3 sourcePID:(int)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005B8F4;
  block[3] = &unk_1000F8EC8;
  block[4] = self;
  block[5] = a3;
  int v6 = a4;
  dispatch_async(queue, block);
}

- (void)setOffset:(CGPoint)a3 forTouchesWithUserIdentifier:(unsigned int)a4
{
  if (a4)
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10005BC58;
    v6[3] = &unk_1000F72D0;
    v6[4] = self;
    CGPoint v7 = a3;
    unsigned int v8 = a4;
    dispatch_sync(queue, v6);
  }
  else
  {
    uint64_t v5 = BKLogTouchEvents();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "cannot alter touch offset for zero userIdentifer", buf, 2u);
    }
  }
}

- (void)setRoutingPolicy:(id)a3 forTouchesWithUserIdentifier:(unsigned int)a4
{
  if (a4)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005BF04;
    block[3] = &unk_1000F8EC8;
    block[4] = self;
    block[5] = a3;
    unsigned int v7 = a4;
    dispatch_sync(queue, block);
  }
  else
  {
    uint64_t v5 = BKLogTouchEvents();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "cannot alter routing policy for touches with zero userIdentifer", buf, 2u);
    }
  }
}

- (BOOL)detachTouchIdentifiers:(unsigned int *)a3 count:(int64_t)a4 assignUserIdentifier:(unsigned int)a5 policy:(id)a6 offset:(CGPoint)a7
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10005C2CC;
  v10[3] = &unk_1000F7320;
  v10[6] = &v13;
  v10[7] = a3;
  v10[8] = a4;
  unsigned int v12 = a5;
  v10[4] = self;
  v10[5] = a6;
  CGPoint v11 = a7;
  dispatch_sync(queue, v10);
  char v8 = *((unsigned char *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  return v8;
}

- (void)transferTouchIdentifiers:(unsigned int *)a3 count:(int64_t)a4 toContextID:(unsigned int)a5
{
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10005C7CC;
  v6[3] = &unk_1000F72D0;
  v6[4] = self;
  void v6[5] = a3;
  v6[6] = a4;
  unsigned int v7 = a5;
  dispatch_sync(queue, v6);
}

- (void)invalidateTouchStreamReference:(unsigned int)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005D180;
  v4[3] = &unk_1000F8A20;
  v4[4] = self;
  unsigned int v5 = a3;
  dispatch_async(queue, v4);
}

- (unsigned)addTouchStreamForContextID:(unsigned int)a3 display:(id)a4 versionedPID:(int64_t)a5 identifier:(unsigned int)a6 shouldSendAmbiguityRecommendations:(BOOL)a7
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  int v17 = -1;
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10005D4C4;
  v10[3] = &unk_1000F7238;
  v10[4] = self;
  v10[5] = a4;
  unsigned int v11 = a3;
  unsigned int v12 = a6;
  BOOL v13 = a7;
  v10[6] = &v14;
  v10[7] = a5;
  dispatch_sync(queue, v10);
  unsigned int v8 = *((_DWORD *)v15 + 6);
  _Block_object_dispose(&v14, 8);
  return v8;
}

- (id)cancelAndSuppressTouchesOnDisplay:(id)a3 reason:(id)a4
{
  unsigned int v7 = BKLogTouchEvents();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v21 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "canceling events for suppression reason: %{public}@", buf, 0xCu);
  }

  id v8 = objc_alloc_init((Class)NSMutableArray);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005E05C;
  block[3] = &unk_1000F7840;
  block[4] = self;
  block[5] = a3;
  id v10 = v8;
  id v18 = v10;
  id v19 = a4;
  dispatch_sync(queue, block);
  id v11 = objc_alloc((Class)BSSimpleAssertion);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10005E110;
  v15[3] = &unk_1000F71E8;
  id v12 = v10;
  id v16 = v12;
  id v13 = [v11 initWithIdentifier:@"touch-suppression-cancel-array" forReason:a4 invalidationBlock:v15];

  return v13;
}

- (void)cancelTouchesOnAllDisplays
{
  uint64_t v3 = BKLogTouchEvents();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "soft cancel on all displays", buf, 2u);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005E35C;
  block[3] = &unk_1000F8E78;
  block[4] = self;
  dispatch_async(queue, block);
  unsigned int v5 = +[BKTouchPadManager sharedInstance];
  [v5 sendCancelEventForAllDisplays];
}

- (void)cancelTouchesOnMainDisplay
{
}

- (void)cancelTouchesWithIdentifiers:(id)a3
{
  uint64_t v5 = (uint64_t)[a3 count];
  int v6 = BKLogTouchEvents();
  unsigned int v7 = v6;
  if (v5 < 31)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "cancel touches with identifiers: %{public}@", buf, 0xCu);
    }

    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005E4EC;
    block[3] = &unk_1000F7868;
    block[4] = a3;
    void block[5] = self;
    void block[6] = v5;
    dispatch_async(queue, block);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v11) = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "too many touch identifiers passed to CancelTouchesWithIdentifiers (%d)", buf, 8u);
    }
  }
}

- (BKIOHIDService)mainDisplayPencilDigitizerService
{
  uint64_t v6 = 0;
  unsigned int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_100059FE4;
  id v10 = sub_100059FF4;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10005E7F4;
  v5[3] = &unk_1000F8EA0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (BKIOHIDService *)v3;
}

- (BKIOHIDService)mainDisplayAOPDigitizerService
{
  uint64_t v6 = 0;
  unsigned int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_100059FE4;
  id v10 = sub_100059FF4;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10005E8F8;
  v5[3] = &unk_1000F8EA0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (BKIOHIDService *)v3;
}

- (BKIOHIDService)mainDisplayDigitizerService
{
  uint64_t v6 = 0;
  unsigned int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_100059FE4;
  id v10 = sub_100059FF4;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10005E9FC;
  v5[3] = &unk_1000F8EA0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (BKIOHIDService *)v3;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10005EAB8;
  v6[3] = &unk_1000F8E50;
  v6[4] = a3;
  void v6[5] = self;
  [a3 appendProem:self block:v6];
  id v5 = [a3 appendObject:self->_queue_perDisplayInfo withName:@"perDisplayInfo"];
}

- (void)didInitializeRegistryWithContext:(id)a3
{
  id v4 = [a3 eventProcessorRegistry];
  id v7 = [v4 eventProcessorOfClass:objc_opt_class()];

  id v5 = [v7 addGlobalKeyboardObserver:self];
  globalKeyboardObserver = self->_globalKeyboardObserver;
  self->_globalKeyboardObserver = v5;
}

- (void)dealloc
{
  [(BKIOHIDServiceSimplePersistentPropertySupport *)self->_pencilOpaqueTouchPersistentPropertySupport invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BKHIDDirectTouchEventProcessor;
  [(BKHIDDirectTouchEventProcessor *)&v3 dealloc];
}

- (BKHIDDirectTouchEventProcessor)initWithContext:(id)a3
{
  id obj = objc_alloc_init(BKHIDEventHitTestDispatcher);
  sub_10004FA1C();
  id v41 = (id)objc_claimAutoreleasedReturnValue();
  id v43 = +[BKIOHIDServicePersistentPropertyController digitizerServicePersistentPropertyController];
  if (self
    && (v62.receiver = self,
        v62.super_class = (Class)BKHIDDirectTouchEventProcessor,
        id v5 = [(BKHIDDirectTouchEventProcessor *)&v62 init],
        (uint64_t v6 = v5) != 0))
  {
    objc_storeStrong((id *)&v5->_dispatcher, obj);
    objc_storeStrong((id *)&v6->_touchEventServer, v41);
    objc_storeStrong((id *)&v6->_persistentPropertyController, v43);
    uint64_t v7 = BSDispatchQueueCreateWithFixedPriority();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    uint64_t v9 = [a3 serviceMatcherDataProvider];
    id v10 = objc_alloc((Class)BKIOHIDServiceSimplePersistentPropertySupport);
    id v11 = +[BKSHIDEventSenderDescriptor stylusOpaqueTouchDigitizer];
    id v12 = (BKIOHIDServiceSimplePersistentPropertySupport *)[v10 initWithSenderDescriptor:v11 matcherDataProvider:v9 persistentPropertyController:v43];
    pencilOpaqueTouchPersistentPropertySupport = v6->_pencilOpaqueTouchPersistentPropertySupport;
    v6->_pencilOpaqueTouchPersistentPropertySupport = v12;

    [v43 registerHandler:v6->_pencilOpaqueTouchPersistentPropertySupport];
    id v14 = objc_alloc_init((Class)NSMutableArray);
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    uint64_t v15 = +[BKHIDDirectTouchEventProcessor digitizerMatchingDictionaries];
    id v16 = [v15 countByEnumeratingWithState:&v58 objects:v65 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v59;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v59 != v17) {
            objc_enumerationMutation(v15);
          }
          id v19 = [objc_alloc((Class)BKIOHIDServiceMatcher) initWithMatchingDictionary:*(void *)(*((void *)&v58 + 1) + 8 * i) dataProvider:v9];
          [v14 addObject:v19];
        }
        id v16 = [v15 countByEnumeratingWithState:&v58 objects:v65 count:16];
      }
      while (v16);
    }

    objc_storeStrong((id *)&v6->_matchers, v14);
    BSContinuousMachTimeNow();
    v6->_queue_startMainDisplayDigitizerMatchingTime = v20;
    objc_initWeak(&location, v6);
    id v21 = [objc_alloc((Class)BSContinuousMachTimer) initWithIdentifier:@"BKHIDDirectTouchEventProcessor-WaitForMainDigitizer"];
    objc_storeStrong((id *)&v6->_queue_mainDisplayDigitizerSentinelTimer, v21);
    long long v22 = v6->_queue;
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_10005F450;
    v54[3] = &unk_1000F70B0;
    objc_copyWeak(&v56, &location);
    id v55 = v21;
    id v40 = v55;
    [v55 scheduleWithFireInterval:v22 leewayInterval:v54 queue:60.0 handler:5.0];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v23 = v14;
    id v24 = [v23 countByEnumeratingWithState:&v50 objects:v64 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v51;
      do
      {
        for (j = 0; j != v24; j = (char *)j + 1)
        {
          if (*(void *)v51 != v25) {
            objc_enumerationMutation(v23);
          }
          [*(id *)(*((void *)&v50 + 1) + 8 * (void)j) startObserving:v6 queue:v6->_queue];
        }
        id v24 = [v23 countByEnumeratingWithState:&v50 objects:v64 count:16];
      }
      while (v24);
    }

    long long v27 = +[BKSDefaults localDefaults];
    long long v28 = +[NSString stringWithUTF8String:"digitizerSignpostsEnabled"];
    __int16 v29 = dispatch_get_global_queue(21, 0);
    id v30 = [v27 observeDefault:v28 onQueue:v29 withBlock:&stru_1000F70D0];

    id v31 = +[NSString stringWithUTF8String:"digitizerVisualizeTouches"];
    v63[0] = v31;
    uint64_t v32 = +[NSString stringWithUTF8String:"digitizerVisualizeHitTestRegions"];
    v63[1] = v32;
    long long v33 = +[NSArray arrayWithObjects:v63 count:2];
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_10005F550;
    v48[3] = &unk_1000F8E78;
    uint64_t v34 = v6;
    v49 = v34;
    id v35 = [v27 observeDefaults:v33 onQueue:v29 withBlock:v48];

    v46[1] = _NSConcreteStackBlock;
    v46[2] = (id)3221225472;
    v46[3] = sub_10005F5DC;
    v46[4] = &unk_1000F82D8;
    objc_copyWeak(&v47, &location);
    id v36 = (id)BSLogAddStateCaptureBlockWithTitle();
    id v37 = +[CAWindowServer serverIfRunning];
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_10005F654;
    v44[3] = &unk_1000F7118;
    objc_copyWeak(v46, &location);
    __int16 v38 = v34;
    id v45 = v38;
    [v37 setSlotDeletionCallback:v44];

    [(BKIOHIDServicePersistentPropertyController *)v6->_persistentPropertyController registerHandler:v38];
    objc_destroyWeak(v46);
    objc_destroyWeak(&v47);

    objc_destroyWeak(&v56);
    objc_destroyWeak(&location);
  }
  else
  {
    __int16 v38 = 0;
  }

  return v38;
}

+ (NSArray)digitizerMatchingDictionaries
{
  v11[0] = @"DeviceUsagePage";
  v11[1] = @"DeviceUsage";
  v12[0] = &off_100103568;
  v12[1] = &off_100103580;
  v2 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  v13[0] = v2;
  v9[0] = @"DeviceUsagePage";
  v9[1] = @"DeviceUsage";
  v10[0] = &off_100103568;
  v10[1] = &off_100103598;
  objc_super v3 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  v13[1] = v3;
  v7[0] = @"DeviceUsagePage";
  v7[1] = @"DeviceUsage";
  v8[0] = &off_100103568;
  v8[1] = &off_1001035B0;
  id v4 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  v13[2] = v4;
  id v5 = +[NSArray arrayWithObjects:v13 count:3];

  return (NSArray *)v5;
}

@end