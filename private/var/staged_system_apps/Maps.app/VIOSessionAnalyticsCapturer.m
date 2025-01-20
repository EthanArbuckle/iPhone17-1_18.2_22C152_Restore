@interface VIOSessionAnalyticsCapturer
- (ARSession)session;
- (BOOL)didRecordInitializing;
- (BOOL)hasInFlightEntryWithUsageType:(int)a3;
- (BOOL)isInitializing;
- (BOOL)isPaused;
- (BOOL)isRecording;
- (BOOL)shouldBeRecording;
- (NSDate)lastRecordingStartDate;
- (NSMutableSet)recordedEntries;
- (NavigationSession)currentNavigationSession;
- (RoutePlanningSession)currentRoutePlanningSession;
- (VIOSessionAnalyticsCapturer)init;
- (VIOSessionStateManager)stateManager;
- (void)completeInFlightEntriesExcluding:(id)a3 withExitReason:(int)a4;
- (void)completeInFlightEntriesForUsageType:(int)a3 withExitReason:(int)a4;
- (void)completeInFlightEntriesWithExitReason:(int)a3;
- (void)createEntryForUsageType:(int)a3 value:(id)a4;
- (void)dealloc;
- (void)disableEventReceived:(int64_t)a3;
- (void)disableEventReset:(int64_t)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pauseRecording;
- (void)resumeRecording;
- (void)session:(id)a3 cameraDidChangeTrackingState:(id)a4;
- (void)session:(id)a3 didChangeState:(unint64_t)a4;
- (void)sessionInterruptionEnded:(id)a3;
- (void)sessionWasInterrupted:(id)a3;
- (void)setCurrentNavigationSession:(id)a3;
- (void)setCurrentRoutePlanningSession:(id)a3;
- (void)setDidRecordInitializing:(BOOL)a3;
- (void)setIsInitializing:(BOOL)a3;
- (void)setLastRecordingStartDate:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setRecordedEntries:(id)a3;
- (void)setSession:(id)a3;
- (void)setShouldBeRecording:(BOOL)a3;
- (void)setStateManager:(id)a3;
- (void)startRecording;
- (void)stopRecording;
- (void)stopRecordingWithExitReason:(int)a3;
- (void)throttleDidBeginWithEvent:(int64_t)a3;
- (void)throttleDidEnd;
@end

@implementation VIOSessionAnalyticsCapturer

- (VIOSessionAnalyticsCapturer)init
{
  v5.receiver = self;
  v5.super_class = (Class)VIOSessionAnalyticsCapturer;
  v2 = [(VIOSessionAnalyticsCapturer *)&v5 init];
  if (v2)
  {
    v3 = +[NSUserDefaults standardUserDefaults];
    [v3 addObserver:v2 forKeyPath:@"MapsWalkingEnableImageBasedHeading" options:1 context:0];
  }
  return v2;
}

- (void)resumeRecording
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    BOOL v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v7 = sub_1005762E4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v10 = 136316418;
        v11 = "-[VIOSessionAnalyticsCapturer resumeRecording]";
        __int16 v12 = 2080;
        v13 = "VIOSessionAnalyticsCapturer.m";
        __int16 v14 = 1024;
        int v15 = 241;
        __int16 v16 = 2080;
        v17 = "dispatch_get_main_queue()";
        __int16 v18 = 2080;
        v19 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v20 = 2080;
        v21 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v10,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        v8 = sub_1005762E4();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v9 = +[NSThread callStackSymbols];
          int v10 = 138412290;
          v11 = v9;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v10, 0xCu);
        }
      }
    }
  }
  v6 = sub_100109D54();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 136315138;
    v11 = "-[VIOSessionAnalyticsCapturer resumeRecording]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v10, 0xCu);
  }

  if ([(VIOSessionAnalyticsCapturer *)self isPaused]
    && ![(VIOSessionAnalyticsCapturer *)self isRecording])
  {
    [(VIOSessionAnalyticsCapturer *)self setPaused:0];
    if ([(VIOSessionAnalyticsCapturer *)self shouldBeRecording]) {
      [(VIOSessionAnalyticsCapturer *)self startRecording];
    }
  }
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateManager);
  [WeakRetained removeObserver:self];

  [(ARSession *)self->_session _removeObserver:self];
  v4 = +[NSUserDefaults standardUserDefaults];
  [v4 removeObserver:self forKeyPath:@"MapsWalkingEnableImageBasedHeading"];

  v5.receiver = self;
  v5.super_class = (Class)VIOSessionAnalyticsCapturer;
  [(VIOSessionAnalyticsCapturer *)&v5 dealloc];
}

- (void)setStateManager:(id)a3
{
  id v4 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    BOOL v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v17 = sub_1005762E4();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v32 = "-[VIOSessionAnalyticsCapturer setStateManager:]";
        __int16 v33 = 2080;
        v34 = "VIOSessionAnalyticsCapturer.m";
        __int16 v35 = 1024;
        int v36 = 153;
        __int16 v37 = 2080;
        v38 = "dispatch_get_main_queue()";
        __int16 v39 = 2080;
        v40 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v41 = 2080;
        v42 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        __int16 v18 = sub_1005762E4();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v19 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          v32 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateManager);

  if (WeakRetained != v4)
  {
    v9 = sub_100109D54();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v32 = "-[VIOSessionAnalyticsCapturer setStateManager:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
    }

    id v10 = objc_loadWeakRetained((id *)&self->_stateManager);
    [v10 removeObserver:self];

    id v11 = objc_storeWeak((id *)&self->_stateManager, v4);
    [v4 addObserver:self];

    if (![(VIOSessionAnalyticsCapturer *)self isRecording])
    {
      __int16 v20 = sub_1005762E4();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v32 = "-[VIOSessionAnalyticsCapturer setStateManager:]";
        __int16 v33 = 2080;
        v34 = "VIOSessionAnalyticsCapturer.m";
        __int16 v35 = 1024;
        int v36 = 165;
        __int16 v37 = 2080;
        v38 = "self.isRecording";
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
      }

      if (sub_100BB36BC())
      {
        v21 = sub_1005762E4();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v22 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          v32 = v22;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
    if ([v4 isDisabled])
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      __int16 v12 = [v4 disableEventReasons];
      id v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v27;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v27 != v15) {
              objc_enumerationMutation(v12);
            }
            -[VIOSessionAnalyticsCapturer disableEventReceived:](self, "disableEventReceived:", [*(id *)(*((void *)&v26 + 1) + 8 * i) integerValue]);
          }
          id v14 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v14);
      }
    }
    if ([v4 isThrottling])
    {
      v23 = sub_1005762E4();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v32 = "-[VIOSessionAnalyticsCapturer setStateManager:]";
        __int16 v33 = 2080;
        v34 = "VIOSessionAnalyticsCapturer.m";
        __int16 v35 = 1024;
        int v36 = 173;
        __int16 v37 = 2080;
        v38 = "!stateManager.isThrottling";
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
      }

      if (sub_100BB36BC())
      {
        v24 = sub_1005762E4();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v25 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          v32 = v25;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }
}

- (void)setSession:(id)a3
{
  objc_super v5 = (ARSession *)a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  BOOL v7 = dispatch_queue_get_label(0);
  if (label != v7)
  {
    BOOL v8 = !label || v7 == 0;
    if (v8 || strcmp(label, v7))
    {
      id v10 = sub_1005762E4();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v13 = 136316418;
        id v14 = "-[VIOSessionAnalyticsCapturer setSession:]";
        __int16 v15 = 2080;
        __int16 v16 = "VIOSessionAnalyticsCapturer.m";
        __int16 v17 = 1024;
        int v18 = 181;
        __int16 v19 = 2080;
        __int16 v20 = "dispatch_get_main_queue()";
        __int16 v21 = 2080;
        v22 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v23 = 2080;
        v24 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v13,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        id v11 = sub_1005762E4();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          __int16 v12 = +[NSThread callStackSymbols];
          int v13 = 138412290;
          id v14 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v13, 0xCu);
        }
      }
    }
  }
  if (self->_session != v5)
  {
    v9 = sub_100109D54();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 136315138;
      id v14 = "-[VIOSessionAnalyticsCapturer setSession:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v13, 0xCu);
    }

    [(ARSession *)self->_session _removeObserver:self];
    objc_storeStrong((id *)&self->_session, a3);
    [(ARSession *)self->_session _addObserver:self];
  }
}

- (void)startRecording
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  id v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    BOOL v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      int v13 = sub_1005762E4();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v16 = 136316418;
        __int16 v17 = "-[VIOSessionAnalyticsCapturer startRecording]";
        __int16 v18 = 2080;
        __int16 v19 = "VIOSessionAnalyticsCapturer.m";
        __int16 v20 = 1024;
        int v21 = 198;
        __int16 v22 = 2080;
        __int16 v23 = "dispatch_get_main_queue()";
        __int16 v24 = 2080;
        v25 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v26 = 2080;
        long long v27 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v16,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        id v14 = sub_1005762E4();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          __int16 v15 = +[NSThread callStackSymbols];
          int v16 = 138412290;
          __int16 v17 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v16, 0xCu);
        }
      }
    }
  }
  v6 = sub_100109D54();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 136315138;
    __int16 v17 = "-[VIOSessionAnalyticsCapturer startRecording]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v16, 0xCu);
  }

  BOOL v7 = [(VIOSessionAnalyticsCapturer *)self lastRecordingStartDate];

  if (v7)
  {
    BOOL v8 = sub_100109D54();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Tried to start recording when we're already recording; ignoring",
        (uint8_t *)&v16,
        2u);
    }
  }
  else
  {
    [(VIOSessionAnalyticsCapturer *)self setShouldBeRecording:1];
    v9 = +[NSDate date];
    [(VIOSessionAnalyticsCapturer *)self setLastRecordingStartDate:v9];

    id v10 = +[NSMutableSet set];
    [(VIOSessionAnalyticsCapturer *)self setRecordedEntries:v10];

    id v11 = +[NSUserDefaults standardUserDefaults];
    unsigned __int8 v12 = [v11 BOOLForKey:@"MapsWalkingEnableImageBasedHeading"];

    if (v12)
    {
      [(VIOSessionAnalyticsCapturer *)self setIsInitializing:1];
      [(VIOSessionAnalyticsCapturer *)self setDidRecordInitializing:0];
    }
    else
    {
      [(VIOSessionAnalyticsCapturer *)self createEntryForUsageType:5 value:0];
    }
  }
}

- (void)pauseRecording
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  id v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    BOOL v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      BOOL v7 = sub_1005762E4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v10 = 136316418;
        id v11 = "-[VIOSessionAnalyticsCapturer pauseRecording]";
        __int16 v12 = 2080;
        int v13 = "VIOSessionAnalyticsCapturer.m";
        __int16 v14 = 1024;
        int v15 = 222;
        __int16 v16 = 2080;
        __int16 v17 = "dispatch_get_main_queue()";
        __int16 v18 = 2080;
        __int16 v19 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v20 = 2080;
        int v21 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v10,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        BOOL v8 = sub_1005762E4();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v9 = +[NSThread callStackSymbols];
          int v10 = 138412290;
          id v11 = v9;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v10, 0xCu);
        }
      }
    }
  }
  v6 = sub_100109D54();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 136315138;
    id v11 = "-[VIOSessionAnalyticsCapturer pauseRecording]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v10, 0xCu);
  }

  if ([(VIOSessionAnalyticsCapturer *)self isRecording])
  {
    if (![(VIOSessionAnalyticsCapturer *)self isPaused])
    {
      [(VIOSessionAnalyticsCapturer *)self setPaused:1];
      [(VIOSessionAnalyticsCapturer *)self stopRecordingWithExitReason:18];
    }
  }
}

- (void)stopRecording
{
  [(VIOSessionAnalyticsCapturer *)self stopRecordingWithExitReason:15];

  [(VIOSessionAnalyticsCapturer *)self setShouldBeRecording:0];
}

- (void)stopRecordingWithExitReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    BOOL v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      __int16 v26 = sub_1005762E4();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        int v29 = 136316418;
        v30 = "-[VIOSessionAnalyticsCapturer stopRecordingWithExitReason:]";
        __int16 v31 = 2080;
        v32 = "VIOSessionAnalyticsCapturer.m";
        __int16 v33 = 1024;
        int v34 = 271;
        __int16 v35 = 2080;
        int v36 = "dispatch_get_main_queue()";
        __int16 v37 = 2080;
        v38 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v39 = 2080;
        v40 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v29,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        long long v27 = sub_1005762E4();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          long long v28 = +[NSThread callStackSymbols];
          int v29 = 138412290;
          v30 = v28;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v29, 0xCu);
        }
      }
    }
  }
  BOOL v8 = sub_100109D54();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v29 = 136315138;
    v30 = "-[VIOSessionAnalyticsCapturer stopRecordingWithExitReason:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v29, 0xCu);
  }

  v9 = [(VIOSessionAnalyticsCapturer *)self session];
  int v10 = [v9 configuration];
  id v11 = [v10 isVLF];

  __int16 v12 = [(VIOSessionAnalyticsCapturer *)self stateManager];
  [v12 removeObserver:self];

  [(VIOSessionAnalyticsCapturer *)self setStateManager:0];
  int v13 = [(VIOSessionAnalyticsCapturer *)self session];
  [v13 _removeObserver:self];

  [(VIOSessionAnalyticsCapturer *)self setSession:0];
  __int16 v14 = [(VIOSessionAnalyticsCapturer *)self recordedEntries];
  id v15 = [v14 count];

  if (v15)
  {
    [(VIOSessionAnalyticsCapturer *)self completeInFlightEntriesWithExitReason:v3];
    __int16 v16 = [(VIOSessionAnalyticsCapturer *)self recordedEntries];
    __int16 v17 = [v16 allObjects];
    __int16 v18 = [v17 sortedArrayUsingComparator:&stru_101311F20];

    __int16 v19 = sub_100109D54();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      int v29 = 138477827;
      v30 = v18;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Captured entries: %{private}@", (uint8_t *)&v29, 0xCu);
    }

    __int16 v20 = sub_100099700(v18, &stru_101311F60);
    int v21 = +[NSDate date];
    __int16 v22 = [(VIOSessionAnalyticsCapturer *)self lastRecordingStartDate];
    [v21 timeIntervalSinceDate:v22];
    double v24 = ceil(v23);

    v25 = +[NSNumber numberWithDouble:v24];
    +[GEOAPPortal captureMarcoLiteWithTotalNavTime:v25 usageStates:v20 vioTrigger:v11];
  }
  [(VIOSessionAnalyticsCapturer *)self setLastRecordingStartDate:0];
  [(VIOSessionAnalyticsCapturer *)self setRecordedEntries:0];
  [(VIOSessionAnalyticsCapturer *)self setIsInitializing:0];
  [(VIOSessionAnalyticsCapturer *)self setDidRecordInitializing:0];
}

- (BOOL)isRecording
{
  v2 = [(VIOSessionAnalyticsCapturer *)self lastRecordingStartDate];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)createEntryForUsageType:(int)a3 value:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  BOOL v8 = dispatch_queue_get_label(0);
  if (label != v8)
  {
    BOOL v9 = !label || v8 == 0;
    if (v9 || strcmp(label, v8))
    {
      id v15 = sub_1005762E4();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v22 = (uint64_t)"-[VIOSessionAnalyticsCapturer createEntryForUsageType:value:]";
        __int16 v23 = 2080;
        double v24 = "VIOSessionAnalyticsCapturer.m";
        __int16 v25 = 1024;
        int v26 = 317;
        __int16 v27 = 2080;
        long long v28 = "dispatch_get_main_queue()";
        __int16 v29 = 2080;
        v30 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v31 = 2080;
        v32 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        __int16 v16 = sub_1005762E4();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          __int16 v17 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          uint64_t v22 = (uint64_t)v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }
  if (![(VIOSessionAnalyticsCapturer *)self isRecording])
  {
    __int16 v18 = sub_1005762E4();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v22 = (uint64_t)"-[VIOSessionAnalyticsCapturer createEntryForUsageType:value:]";
      __int16 v23 = 2080;
      double v24 = "VIOSessionAnalyticsCapturer.m";
      __int16 v25 = 1024;
      int v26 = 319;
      __int16 v27 = 2080;
      long long v28 = "self.isRecording";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      __int16 v19 = sub_1005762E4();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        __int16 v20 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        uint64_t v22 = (uint64_t)v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  int v10 = [(VIOSessionAnalyticsCapturer *)self recordedEntries];
  id v11 = [v10 count];

  if ((unint64_t)v11 <= 0xF9)
  {
    __int16 v12 = [[VIOSessionAnalyticsEntry alloc] initWithUsageType:v4 value:v6];
    int v13 = sub_100109D54();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138477827;
      uint64_t v22 = (uint64_t)v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Creating new entry: %{private}@", buf, 0xCu);
    }

    __int16 v14 = [(VIOSessionAnalyticsCapturer *)self recordedEntries];
    [(__CFString *)v14 addObject:v12];
    goto LABEL_17;
  }
  sub_100109D54();
  __int16 v12 = (VIOSessionAnalyticsEntry *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_DEBUG))
  {
    if (v4 >= 0x1A)
    {
      __int16 v14 = +[NSString stringWithFormat:@"(unknown: %i)", v4];
    }
    else
    {
      __int16 v14 = off_101311FA0[(int)v4];
    }
    *(_DWORD *)buf = 134218242;
    uint64_t v22 = 250;
    __int16 v23 = 2112;
    double v24 = (const char *)v14;
    _os_log_impl((void *)&_mh_execute_header, &v12->super, OS_LOG_TYPE_DEBUG, "Reached entry limit (%lu) for a single nav session. Ignoring entry of type: %@", buf, 0x16u);
LABEL_17:
  }
}

- (void)completeInFlightEntriesWithExitReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  id v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    BOOL v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      __int16 v17 = sub_1005762E4();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        __int16 v27 = "-[VIOSessionAnalyticsCapturer completeInFlightEntriesWithExitReason:]";
        __int16 v28 = 2080;
        __int16 v29 = "VIOSessionAnalyticsCapturer.m";
        __int16 v30 = 1024;
        int v31 = 332;
        __int16 v32 = 2080;
        __int16 v33 = "dispatch_get_main_queue()";
        __int16 v34 = 2080;
        __int16 v35 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v36 = 2080;
        __int16 v37 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        __int16 v18 = sub_1005762E4();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          __int16 v19 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          __int16 v27 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  BOOL v8 = [(VIOSessionAnalyticsCapturer *)self recordedEntries];
  BOOL v9 = [v8 allObjects];

  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    id v12 = v10;
    uint64_t v13 = *(void *)v22;
    *(void *)&long long v11 = 138477827;
    long long v20 = v11;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v9);
        }
        id v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ((objc_msgSend(v15, "isComplete", v20) & 1) == 0)
        {
          [v15 completeEntryWithReason:v3];
          __int16 v16 = sub_100109D54();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v20;
            __int16 v27 = (const char *)v15;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Completing entry: %{private}@", buf, 0xCu);
          }
        }
      }
      id v12 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }
}

- (void)completeInFlightEntriesForUsageType:(int)a3 withExitReason:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  BOOL v8 = dispatch_queue_get_label(0);
  if (label != v8)
  {
    BOOL v9 = !label || v8 == 0;
    if (v9 || strcmp(label, v8))
    {
      __int16 v19 = sub_1005762E4();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        __int16 v29 = "-[VIOSessionAnalyticsCapturer completeInFlightEntriesForUsageType:withExitReason:]";
        __int16 v30 = 2080;
        int v31 = "VIOSessionAnalyticsCapturer.m";
        __int16 v32 = 1024;
        int v33 = 344;
        __int16 v34 = 2080;
        __int16 v35 = "dispatch_get_main_queue()";
        __int16 v36 = 2080;
        __int16 v37 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v38 = 2080;
        __int16 v39 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        long long v20 = sub_1005762E4();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          long long v21 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          __int16 v29 = v21;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = [(VIOSessionAnalyticsCapturer *)self recordedEntries];
  long long v11 = [v10 allObjects];

  id v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    id v14 = v12;
    uint64_t v15 = *(void *)v24;
    *(void *)&long long v13 = 138477827;
    long long v22 = v13;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v11);
        }
        __int16 v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ((objc_msgSend(v17, "isComplete", v22) & 1) == 0
          && [v17 usageType] == a3)
        {
          [v17 completeEntryWithReason:v4];
          __int16 v18 = sub_100109D54();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v22;
            __int16 v29 = (const char *)v17;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Completing entry: %{private}@", buf, 0xCu);
          }
        }
      }
      id v14 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v14);
  }
}

- (void)completeInFlightEntriesExcluding:(id)a3 withExitReason:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  BOOL v8 = dispatch_queue_get_label(0);
  if (label != v8)
  {
    BOOL v9 = !label || v8 == 0;
    if (v9 || strcmp(label, v8))
    {
      long long v21 = sub_1005762E4();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        int v31 = "-[VIOSessionAnalyticsCapturer completeInFlightEntriesExcluding:withExitReason:]";
        __int16 v32 = 2080;
        int v33 = "VIOSessionAnalyticsCapturer.m";
        __int16 v34 = 1024;
        int v35 = 356;
        __int16 v36 = 2080;
        __int16 v37 = "dispatch_get_main_queue()";
        __int16 v38 = 2080;
        __int16 v39 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v40 = 2080;
        __int16 v41 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        long long v22 = sub_1005762E4();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          long long v23 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          int v31 = v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v10 = [(VIOSessionAnalyticsCapturer *)self recordedEntries];
  long long v11 = [v10 allObjects];

  id v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v12)
  {
    id v14 = v12;
    uint64_t v15 = *(void *)v26;
    *(void *)&long long v13 = 138477827;
    long long v24 = v13;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v11);
        }
        __int16 v17 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ((objc_msgSend(v17, "isComplete", v24) & 1) == 0)
        {
          __int16 v18 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v17 usageType]);
          unsigned __int8 v19 = [v6 containsObject:v18];

          if ((v19 & 1) == 0)
          {
            [v17 completeEntryWithReason:v4];
            long long v20 = sub_100109D54();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v24;
              int v31 = (const char *)v17;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Completing entry: %{private}@", buf, 0xCu);
            }
          }
        }
      }
      id v14 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v14);
  }
}

- (BOOL)hasInFlightEntryWithUsageType:(int)a3
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  id v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    BOOL v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      __int16 v17 = sub_1005762E4();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        long long v26 = "-[VIOSessionAnalyticsCapturer hasInFlightEntryWithUsageType:]";
        __int16 v27 = 2080;
        long long v28 = "VIOSessionAnalyticsCapturer.m";
        __int16 v29 = 1024;
        int v30 = 368;
        __int16 v31 = 2080;
        __int16 v32 = "dispatch_get_main_queue()";
        __int16 v33 = 2080;
        __int16 v34 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v35 = 2080;
        __int16 v36 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        __int16 v18 = sub_1005762E4();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          unsigned __int8 v19 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          long long v26 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  BOOL v8 = [(VIOSessionAnalyticsCapturer *)self recordedEntries];
  BOOL v9 = [v8 allObjects];

  id v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v14 usageType] == a3 && !objc_msgSend(v14, "isComplete"))
        {
          BOOL v15 = 1;
          goto LABEL_18;
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 0;
LABEL_18:

  return v15;
}

- (void)throttleDidBeginWithEvent:(int64_t)a3
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  id v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    BOOL v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      long long v13 = sub_1005762E4();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v16 = 136316418;
        __int16 v17 = "-[VIOSessionAnalyticsCapturer throttleDidBeginWithEvent:]";
        __int16 v18 = 2080;
        unsigned __int8 v19 = "VIOSessionAnalyticsCapturer.m";
        __int16 v20 = 1024;
        int v21 = 383;
        __int16 v22 = 2080;
        long long v23 = "dispatch_get_main_queue()";
        __int16 v24 = 2080;
        long long v25 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v26 = 2080;
        __int16 v27 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v16,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        id v14 = sub_1005762E4();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          BOOL v15 = +[NSThread callStackSymbols];
          int v16 = 138412290;
          __int16 v17 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v16, 0xCu);
        }
      }
    }
  }
  GEOConfigGetDouble();
  double v9 = v8;
  if (a3) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = 2;
  }
  if ([(VIOSessionAnalyticsCapturer *)self isInitializing]) {
    uint64_t v11 = 16;
  }
  else {
    uint64_t v11 = v10;
  }
  [(VIOSessionAnalyticsCapturer *)self completeInFlightEntriesWithExitReason:v11];
  uint64_t v12 = +[NSNumber numberWithDouble:v9];
  [(VIOSessionAnalyticsCapturer *)self createEntryForUsageType:v10 value:v12];
}

- (void)throttleDidEnd
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  uint64_t v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    BOOL v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      id v6 = sub_1005762E4();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v9 = 136316418;
        uint64_t v10 = "-[VIOSessionAnalyticsCapturer throttleDidEnd]";
        __int16 v11 = 2080;
        uint64_t v12 = "VIOSessionAnalyticsCapturer.m";
        __int16 v13 = 1024;
        int v14 = 399;
        __int16 v15 = 2080;
        int v16 = "dispatch_get_main_queue()";
        __int16 v17 = 2080;
        __int16 v18 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v19 = 2080;
        __int16 v20 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v9,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        BOOL v7 = sub_1005762E4();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          double v8 = +[NSThread callStackSymbols];
          int v9 = 138412290;
          uint64_t v10 = v8;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v9, 0xCu);
        }
      }
    }
  }
  [(VIOSessionAnalyticsCapturer *)self completeInFlightEntriesWithExitReason:13];
  [(VIOSessionAnalyticsCapturer *)self setIsInitializing:1];
  [(VIOSessionAnalyticsCapturer *)self setDidRecordInitializing:0];
}

- (void)disableEventReceived:(int64_t)a3
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  id v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    BOOL v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      __int16 v15 = sub_1005762E4();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        __int16 v22 = "-[VIOSessionAnalyticsCapturer disableEventReceived:]";
        __int16 v23 = 2080;
        __int16 v24 = "VIOSessionAnalyticsCapturer.m";
        __int16 v25 = 1024;
        int v26 = 409;
        __int16 v27 = 2080;
        long long v28 = "dispatch_get_main_queue()";
        __int16 v29 = 2080;
        int v30 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v31 = 2080;
        __int16 v32 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        int v16 = sub_1005762E4();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          __int16 v17 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          __int16 v22 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }
  if ((unint64_t)(a3 - 1) > 9) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = dword_100F72B30[a3 - 1];
  }
  int v9 = +[NSNumber numberWithInt:v8];
  unsigned __int8 v10 = [&off_1013AE340 containsObject:v9];

  if ((v10 & 1) == 0)
  {
    __int16 v18 = sub_1005762E4();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      __int16 v22 = "-[VIOSessionAnalyticsCapturer disableEventReceived:]";
      __int16 v23 = 2080;
      __int16 v24 = "VIOSessionAnalyticsCapturer.m";
      __int16 v25 = 1024;
      int v26 = 427;
      __int16 v27 = 2080;
      long long v28 = "[allDisableEvents containsObject:@(usageType)]";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      __int16 v19 = sub_1005762E4();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        __int16 v20 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        __int16 v22 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if ([(VIOSessionAnalyticsCapturer *)self hasInFlightEntryWithUsageType:v8])
  {
    __int16 v11 = sub_100109D54();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      if (v8 >= 0x19)
      {
        uint64_t v12 = +[NSString stringWithFormat:@"(unknown: %i)", v8];
      }
      else
      {
        uint64_t v12 = off_101312070[(int)v8];
      }
      *(_DWORD *)buf = 138477827;
      __int16 v22 = (const char *)v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Already tracking an in-flight disable event entry with usage type: %{private}@; ignoring event",
        buf,
        0xCu);
    }
  }
  else
  {
    if ([(VIOSessionAnalyticsCapturer *)self isInitializing]) {
      uint64_t v13 = 16;
    }
    else {
      uint64_t v13 = v8;
    }
    [(VIOSessionAnalyticsCapturer *)self completeInFlightEntriesExcluding:&off_1013AE340 withExitReason:v13];
    switch(a3)
    {
      case 0:
      case 4:
      case 5:
      case 7:
      case 10:
        [(VIOSessionAnalyticsCapturer *)self createEntryForUsageType:v8 value:0];
        break;
      case 1:
      case 2:
      case 3:
      case 6:
      case 8:
      case 9:
        GEOConfigGetDouble();
        int v14 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [(VIOSessionAnalyticsCapturer *)self createEntryForUsageType:v8 value:v14];

        break;
      default:
        return;
    }
  }
}

- (void)disableEventReset:(int64_t)a3
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  id v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    BOOL v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      uint64_t v13 = sub_1005762E4();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v16 = 136316418;
        __int16 v17 = "-[VIOSessionAnalyticsCapturer disableEventReset:]";
        __int16 v18 = 2080;
        __int16 v19 = "VIOSessionAnalyticsCapturer.m";
        __int16 v20 = 1024;
        int v21 = 492;
        __int16 v22 = 2080;
        __int16 v23 = "dispatch_get_main_queue()";
        __int16 v24 = 2080;
        __int16 v25 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v26 = 2080;
        __int16 v27 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v16,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        int v14 = sub_1005762E4();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          __int16 v15 = +[NSThread callStackSymbols];
          int v16 = 138412290;
          __int16 v17 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v16, 0xCu);
        }
      }
    }
  }
  if ((unint64_t)(a3 - 1) > 9) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = dword_100F72B30[a3 - 1];
  }
  int v9 = [(VIOSessionAnalyticsCapturer *)self stateManager];
  if ([v9 isDisabled]) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = 13;
  }

  [(VIOSessionAnalyticsCapturer *)self completeInFlightEntriesForUsageType:v8 withExitReason:v10];
  __int16 v11 = [(VIOSessionAnalyticsCapturer *)self stateManager];
  unsigned __int8 v12 = [v11 isDisabled];

  if ((v12 & 1) == 0)
  {
    [(VIOSessionAnalyticsCapturer *)self setIsInitializing:1];
    [(VIOSessionAnalyticsCapturer *)self setDidRecordInitializing:0];
  }
}

- (void)session:(id)a3 cameraDidChangeTrackingState:(id)a4
{
  id v5 = a4;
  if ([(VIOSessionAnalyticsCapturer *)self isPaused])
  {
    BOOL v7 = sub_1005762E4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v13 = "-[VIOSessionAnalyticsCapturer session:cameraDidChangeTrackingState:]";
      __int16 v14 = 2080;
      __int16 v15 = "VIOSessionAnalyticsCapturer.m";
      __int16 v16 = 1024;
      int v17 = 512;
      __int16 v18 = 2080;
      __int16 v19 = "!self.isPaused";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      uint64_t v8 = sub_1005762E4();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v9 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        uint64_t v13 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100974AA8;
  v10[3] = &unk_1012E5D58;
  v10[4] = self;
  id v11 = v5;
  id v6 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
}

- (void)sessionWasInterrupted:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100974ED0;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)sessionInterruptionEnded:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100974F8C;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100975010;
  v4[3] = &unk_1012E69C0;
  v4[4] = self;
  v4[5] = a4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = +[NSUserDefaults standardUserDefaults];
  if (v13 != v11)
  {

LABEL_6:
    v17.receiver = self;
    v17.super_class = (Class)VIOSessionAnalyticsCapturer;
    [(VIOSessionAnalyticsCapturer *)&v17 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
    goto LABEL_7;
  }
  unsigned int v14 = [v10 isEqualToString:@"MapsWalkingEnableImageBasedHeading"];

  if (!v14) {
    goto LABEL_6;
  }
  __int16 v15 = [v12 objectForKey:NSKeyValueChangeNewKey];
  unsigned int v16 = [v15 BOOLValue];

  if (v16) {
    [(VIOSessionAnalyticsCapturer *)self createEntryForUsageType:5 value:0];
  }
  else {
    [(VIOSessionAnalyticsCapturer *)self completeInFlightEntriesForUsageType:5 withExitReason:5];
  }
LABEL_7:
}

- (VIOSessionStateManager)stateManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateManager);

  return (VIOSessionStateManager *)WeakRetained;
}

- (ARSession)session
{
  return self->_session;
}

- (RoutePlanningSession)currentRoutePlanningSession
{
  return self->_currentRoutePlanningSession;
}

- (void)setCurrentRoutePlanningSession:(id)a3
{
}

- (NavigationSession)currentNavigationSession
{
  return self->_currentNavigationSession;
}

- (void)setCurrentNavigationSession:(id)a3
{
}

- (NSMutableSet)recordedEntries
{
  return self->_recordedEntries;
}

- (void)setRecordedEntries:(id)a3
{
}

- (NSDate)lastRecordingStartDate
{
  return self->_lastRecordingStartDate;
}

- (void)setLastRecordingStartDate:(id)a3
{
}

- (BOOL)isInitializing
{
  return self->_isInitializing;
}

- (void)setIsInitializing:(BOOL)a3
{
  self->_isInitializing = a3;
}

- (BOOL)didRecordInitializing
{
  return self->_didRecordInitializing;
}

- (void)setDidRecordInitializing:(BOOL)a3
{
  self->_didRecordInitializing = a3;
}

- (BOOL)shouldBeRecording
{
  return self->_shouldBeRecording;
}

- (void)setShouldBeRecording:(BOOL)a3
{
  self->_shouldBeRecording = a3;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastRecordingStartDate, 0);
  objc_storeStrong((id *)&self->_recordedEntries, 0);
  objc_storeStrong((id *)&self->_currentNavigationSession, 0);
  objc_storeStrong((id *)&self->_currentRoutePlanningSession, 0);
  objc_storeStrong((id *)&self->_session, 0);

  objc_destroyWeak((id *)&self->_stateManager);
}

@end