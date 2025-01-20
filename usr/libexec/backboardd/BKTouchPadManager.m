@interface BKTouchPadManager
+ (id)sharedInstance;
- (BKTouchPadManager)init;
- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5;
- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 display:(id)a5 dispatcher:(id)a6;
- (void)_queue_handleEvent:(__IOHIDEvent *)a3 fromTouchPad:(id)a4 dispatcher:(id)a5;
- (void)_queue_sendCancelEventForTouchPad:(id)a3;
- (void)_queue_sendEvent:(__IOHIDEvent *)a3 fromTouchPad:(id)a4 toDestination:(id)a5 dispatcher:(id)a6;
- (void)_queue_touchPadRemoved:(id)a3;
- (void)_queue_touchPadsDetected:(id)a3;
- (void)dealloc;
- (void)matcher:(id)a3 servicesDidMatch:(id)a4;
- (void)sendCancelEventForAllDisplays;
- (void)sendCancelEventForDisplay:(id)a3;
- (void)serviceDidDisappear:(id)a3;
@end

@implementation BKTouchPadManager

- (void)sendCancelEventForDisplay:(id)a3
{
  id v4 = a3;
  touchPadQueue = self->_touchPadQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100004634;
  v7[3] = &unk_1000F8E50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(touchPadQueue, v7);
}

+ (id)sharedInstance
{
  if (qword_100122DD8 != -1) {
    dispatch_once(&qword_100122DD8, &stru_1000F6060);
  }
  v2 = (void *)qword_100122DD0;

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchPadMatcher, 0);
  objc_storeStrong((id *)&self->_queue_currentTouchPads, 0);

  objc_storeStrong((id *)&self->_touchPadQueue, 0);
}

- (void)_queue_sendCancelEventForTouchPad:(id)a3
{
  id v4 = a3;
  v5 = BKLogTouchEvents();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    id v22 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "touchpad: Cancel (%{public}@)", buf, 0xCu);
  }

  id v6 = [v4 currentDestinations];
  if ([v6 count])
  {
    mach_absolute_time();
    DigitizerEvent = (const void *)IOHIDEventCreateDigitizerEvent();
    IOHIDEventSetIntegerValue();
    id v8 = [v4 senderInfo];
    [v8 senderID];
    IOHIDEventSetSenderID();

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = v6;
    id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v13);
          v15 = [v4 eventDispatcher];
          [(BKTouchPadManager *)self _queue_sendEvent:DigitizerEvent fromTouchPad:v4 toDestination:v14 dispatcher:v15];

          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }

    CFRelease(DigitizerEvent);
  }
  [v4 resetForCancel];
}

- (void)_queue_handleEvent:(__IOHIDEvent *)a3 fromTouchPad:(id)a4 dispatcher:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 currentDestinations];
  if ((IOHIDEventGetIntegerValue() & 0x80) != 0 && [v10 count])
  {
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v11 = v10;
    id v12 = [v11 countByEnumeratingWithState:&v45 objects:v58 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v46;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v46 != v14) {
            objc_enumerationMutation(v11);
          }
          [(BKTouchPadManager *)self _queue_sendEvent:a3 fromTouchPad:v8 toDestination:*(void *)(*((void *)&v45 + 1) + 8 * i) dispatcher:v9];
        }
        id v13 = [v11 countByEnumeratingWithState:&v45 objects:v58 count:16];
      }
      while (v13);
    }

    [v8 resetForCancel];
  }
  else
  {
    CFArrayRef Children = (const __CFArray *)IOHIDEventGetChildren();
    if (Children)
    {
      CFArrayRef v17 = Children;
      CFIndex Count = CFArrayGetCount(Children);
      if (Count)
      {
        uint64_t v19 = Count;
        unsigned int v20 = [v8 pathIndexTouchingMask];
        LODWORD(v40) = [v8 pathIndexInRangeMask];
        v39 = v10;
        unsigned int v38 = v20;
        if (v19 < 1)
        {
          HIDWORD(v40) = v20;
        }
        else
        {
          CFIndex v21 = 0;
          HIDWORD(v40) = v20;
          do
          {
            CFArrayGetValueAtIndex(v17, v21);
            if (IOHIDEventGetType() == 11)
            {
              char IntegerValue = IOHIDEventGetIntegerValue();
              char v23 = IOHIDEventGetIntegerValue();
              if ((v23 & 2) != 0)
              {
                uint64_t v24 = IOHIDEventGetIntegerValue();
                int v25 = HIDWORD(v40) | (1 << IntegerValue);
                if (!v24) {
                  int v25 = HIDWORD(v40) & ~(1 << IntegerValue);
                }
                HIDWORD(v40) = v25;
              }
              if (v23)
              {
                uint64_t v26 = IOHIDEventGetIntegerValue();
                int v27 = v40 | (1 << IntegerValue);
                if (!v26) {
                  int v27 = v40 & ~(1 << IntegerValue);
                }
                LODWORD(v40) = v27;
              }
            }
            ++v21;
          }
          while (v19 != v21);
        }
        v28 = [v8 senderInfo];
        v29 = [v28 displayUUID];
        v30 = BKLogTouchEvents();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109888;
          int v51 = HIDWORD(v40);
          __int16 v52 = 1024;
          int v53 = v40;
          __int16 v54 = 1024;
          BOOL v55 = v38 != 0;
          __int16 v56 = 1024;
          BOOL v57 = v40 != 0;
          _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "touches:%X ranges:%X then:%{BOOL}u now:%{BOOL}u", buf, 0x1Au);
        }

        if (!v40 || v38)
        {
          id v32 = v39;
        }
        else
        {
          v31 = [v8 overrideSenderDescriptor];
          id v32 = [v9 destinationsForEvent:a3 fromSender:v28 overrideSenderDescriptor:v31];

          [v8 setCurrentDestinations:v32];
          [v8 setEventDispatcher:v9];
        }
        [v8 setPathIndexInRangeMask:v40];
        [v8 setPathIndexTouchingMask:HIDWORD(v40)];
        if ([v32 count]) {
          _BKHIDNoteUserEventOccurredOnDisplay();
        }
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v33 = v32;
        id v34 = [v33 countByEnumeratingWithState:&v41 objects:v49 count:16];
        if (v34)
        {
          id v35 = v34;
          uint64_t v36 = *(void *)v42;
          do
          {
            for (j = 0; j != v35; j = (char *)j + 1)
            {
              if (*(void *)v42 != v36) {
                objc_enumerationMutation(v33);
              }
              [(BKTouchPadManager *)self _queue_sendEvent:a3 fromTouchPad:v8 toDestination:*(void *)(*((void *)&v41 + 1) + 8 * (void)j) dispatcher:v9];
            }
            id v35 = [v33 countByEnumeratingWithState:&v41 objects:v49 count:16];
          }
          while (v35);
        }

        id v10 = v39;
      }
    }
  }
}

- (void)_queue_sendEvent:(__IOHIDEvent *)a3 fromTouchPad:(id)a4 toDestination:(id)a5 dispatcher:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (byte_100122F38)
  {
    if (a3)
    {
      IOHIDEventGetTimeStamp();
      kdebug_trace();
      if (!byte_100122F38) {
        goto LABEL_2;
      }
      IOHIDEventGetTimeStamp();
    }
    else
    {
      kdebug_trace();
      if (!byte_100122F38) {
        goto LABEL_2;
      }
    }
    kdebug_trace();
  }
LABEL_2:
  id v12 = objc_opt_new();
  id v13 = [v9 senderInfo];
  uint64_t v14 = [v10 environment];
  [v12 setEnvironment:v14];

  v15 = [v10 display];
  [v12 setDisplay:v15];

  long long v16 = [v10 token];
  [v12 setToken:v16];

  [v9 maxForce];
  [v12 setMaximumForce:];
  [v12 setSource:[v13 eventSource]];
  Copy = (const void *)IOHIDEventCreateCopy();
  [v9 digitizerSurfaceDimensions];
  [v12 setDigitizerSurfaceSize:];
  BKSHIDEventSetDigitizerAttributes();
  [v13 senderID];
  IOHIDEventSetSenderID();
  long long v18 = BKLogTouchEvents();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v19 = BKSHIDEventGetConciseDescription();
    int v20 = 138543362;
    CFIndex v21 = v19;
    _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "touchpad %{public}@", (uint8_t *)&v20, 0xCu);
  }
  [v11 postEvent:Copy toDestination:v10];
  CFRelease(Copy);
}

- (void)_queue_touchPadsDetected:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [(NSMutableDictionary *)self->_queue_currentTouchPads count];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100028C68;
    v7[3] = &unk_1000F6100;
    v7[4] = self;
    [v4 enumerateObjectsUsingBlock:v7];
    id v6 = [(NSMutableDictionary *)self->_queue_currentTouchPads count];
    if (!v5)
    {
      if (v6) {
        BKSHIDServicesSetTouchPadAvailability();
      }
    }
  }
}

- (void)matcher:(id)a3 servicesDidMatch:(id)a4
{
  id v11 = a4;
  touchPadQueue = self->_touchPadQueue;
  v7 = (BKIOHIDServiceMatcher *)a3;
  dispatch_assert_queue_V2(touchPadQueue);
  touchPadMatcher = self->_touchPadMatcher;

  if (touchPadMatcher == v7)
  {
    id v9 = +[BKHIDSystemInterface sharedInstance];
    id v10 = [v9 senderCache];
    [v10 addSenderInfo:v11];

    [(BKTouchPadManager *)self _queue_touchPadsDetected:v11];
  }
}

- (void)_queue_touchPadRemoved:(id)a3
{
  id v4 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [a3 senderID]);
  id v5 = [(NSMutableDictionary *)self->_queue_currentTouchPads objectForKey:v4];
  if (v5)
  {
    id v6 = BKLogTouchEvents();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      id v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "TouchPad was removed: %{public}@", (uint8_t *)&v7, 0xCu);
    }

    [(BKTouchPadManager *)self _queue_sendCancelEventForTouchPad:v5];
    [(NSMutableDictionary *)self->_queue_currentTouchPads removeObjectForKey:v4];
    if (![(NSMutableDictionary *)self->_queue_currentTouchPads count]) {
      BKSHIDServicesSetTouchPadAvailability();
    }
  }
}

- (void)serviceDidDisappear:(id)a3
{
  touchPadQueue = self->_touchPadQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(touchPadQueue);
  [(BKTouchPadManager *)self _queue_touchPadRemoved:v5];
}

- (void)sendCancelEventForAllDisplays
{
  touchPadQueue = self->_touchPadQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002902C;
  block[3] = &unk_1000F8E78;
  block[4] = self;
  dispatch_async(touchPadQueue, block);
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 display:(id)a5 dispatcher:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = *a3;
  touchPadQueue = self->_touchPadQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100029234;
  block[3] = &unk_1000F6088;
  block[4] = self;
  id v20 = v10;
  id v22 = v12;
  char v23 = v13;
  id v21 = v11;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  dispatch_sync(touchPadQueue, block);

  return 1;
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  return [(BKTouchPadManager *)self processEvent:a3 sender:a4 display:0 dispatcher:a5];
}

- (void)dealloc
{
  [(BKIOHIDServiceMatcher *)self->_touchPadMatcher invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BKTouchPadManager;
  [(BKTouchPadManager *)&v3 dealloc];
}

- (BKTouchPadManager)init
{
  v15.receiver = self;
  v15.super_class = (Class)BKTouchPadManager;
  v2 = [(BKTouchPadManager *)&v15 init];
  if (v2)
  {
    uint64_t Serial = BSDispatchQueueCreateSerial();
    touchPadQueue = v2->_touchPadQueue;
    v2->_touchPadQueue = (OS_dispatch_queue *)Serial;

    id v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    queue_currentTouchPads = v2->_queue_currentTouchPads;
    v2->_queue_currentTouchPads = v5;

    v19[0] = @"DeviceUsagePage";
    v19[1] = @"DeviceUsage";
    v20[0] = &off_100103418;
    v20[1] = &off_100103430;
    int v7 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
    id v16 = v7;
    CFStringRef v17 = @"DeviceUsagePairs";
    id v8 = +[NSArray arrayWithObjects:&v16 count:1];
    long long v18 = v8;
    id v9 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];

    id v10 = objc_alloc((Class)BKIOHIDServiceMatcher);
    id v11 = +[BKHIDSystemInterface sharedInstance];
    id v12 = (BKIOHIDServiceMatcher *)[v10 initWithMatchingDictionary:v9 dataProvider:v11];
    touchPadMatcher = v2->_touchPadMatcher;
    v2->_touchPadMatcher = v12;

    [(BKIOHIDServiceMatcher *)v2->_touchPadMatcher startObserving:v2 queue:v2->_touchPadQueue];
  }
  return v2;
}

@end