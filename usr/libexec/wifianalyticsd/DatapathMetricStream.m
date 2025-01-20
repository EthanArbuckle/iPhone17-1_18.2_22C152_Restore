@interface DatapathMetricStream
+ (id)sharedInstance;
- (BOOL)coredata_diagnostic_metrics_enabled;
- (BOOL)megawifiprofile_diagnostic_metrics_enabled;
- (BOOL)monitoring;
- (BOOL)timerRunning;
- (DatapathMetricStream)init;
- (ManagedConfiguration)managedConfiguration;
- (NSLock)lastPBLock;
- (NSMutableData)lastPB;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)timer;
- (WAProtobufMessageSubmitter)pbConverter;
- (WAStreamDBDelegate)dbDelegate;
- (id)block;
- (id)getPBCodableNSDataFromNSKeyedArchive:(id)a3;
- (id)getter;
- (unint64_t)lastPBLength;
- (unint64_t)megawifiprofile_diagnostic_metrics_period_ms;
- (void)dealloc;
- (void)fetchMetrics;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setBlock:(id)a3;
- (void)setCoredata_diagnostic_metrics_enabled:(BOOL)a3;
- (void)setDbDelegate:(id)a3;
- (void)setDispatchQueueAndAddObservers:(id)a3 withGetter:(id)a4;
- (void)setGetter:(id)a3;
- (void)setLastPB:(id)a3;
- (void)setLastPBLength:(unint64_t)a3;
- (void)setLastPBLock:(id)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)setMegawifiprofile_diagnostic_metrics_enabled:(BOOL)a3;
- (void)setMegawifiprofile_diagnostic_metrics_period_ms:(unint64_t)a3;
- (void)setMonitoring:(BOOL)a3;
- (void)setPbConverter:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTimer:(id)a3;
- (void)setTimerRunning:(BOOL)a3;
- (void)streamPBCodeable:(id)a3 additionalDictionaryItems:(id)a4;
- (void)updateTimerConfiguration;
@end

@implementation DatapathMetricStream

+ (id)sharedInstance
{
  if (qword_1000F0FE8 != -1) {
    dispatch_once(&qword_1000F0FE8, &stru_1000D0F10);
  }
  v2 = (void *)qword_1000F0FE0;

  return v2;
}

- (DatapathMetricStream)init
{
  v14.receiver = self;
  v14.super_class = (Class)DatapathMetricStream;
  v2 = [(DatapathMetricStream *)&v14 init];
  v3 = WALogCategoryDefaultHandle();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v16 = "-[DatapathMetricStream init]";
      __int16 v17 = 1024;
      int v18 = 65;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:starting", buf, 0x12u);
    }

    v2->_BOOL timerRunning = 0;
    v5 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      BOOL timerRunning = v2->_timerRunning;
      *(_DWORD *)buf = 136446722;
      v16 = "-[DatapathMetricStream init]";
      __int16 v17 = 1024;
      int v18 = 68;
      __int16 v19 = 1024;
      BOOL v20 = timerRunning;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:setting _timerRunning %d", buf, 0x18u);
    }

    [(DatapathMetricStream *)v2 setMonitoring:0];
    v7 = objc_alloc_init(WAProtobufMessageSubmitter);
    pbConverter = v2->_pbConverter;
    v2->_pbConverter = v7;

    id v9 = [objc_alloc((Class)NSMutableData) initWithCapacity:10240];
    [(DatapathMetricStream *)v2 setLastPB:v9];

    v10 = [(DatapathMetricStream *)v2 lastPB];
    [v10 setLength:10240];

    [(DatapathMetricStream *)v2 setLastPBLength:0];
    id v11 = objc_alloc_init((Class)NSLock);
    [(DatapathMetricStream *)v2 setLastPBLock:v11];

    v12 = v2;
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v16 = "-[DatapathMetricStream init]";
      __int16 v17 = 1024;
      int v18 = 63;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error super init", buf, 0x12u);
    }
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSUserDefaults standardUserDefaults];
  [v3 removeObserver:self forKeyPath:@"megawifiprofile_diagnostic_metrics_enabled"];
  [v3 removeObserver:self forKeyPath:@"megawifiprofile_diagnostic_metrics_period_ms"];
  [v3 removeObserver:self forKeyPath:@"coredata_diagnostic_metrics_enabled"];

  v4.receiver = self;
  v4.super_class = (Class)DatapathMetricStream;
  [(DatapathMetricStream *)&v4 dealloc];
}

- (void)setDispatchQueueAndAddObservers:(id)a3 withGetter:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136446466;
    objc_super v14 = "-[DatapathMetricStream setDispatchQueueAndAddObservers:withGetter:]";
    __int16 v15 = 1024;
    int v16 = 97;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:scheduleWithQueue", (uint8_t *)&v13, 0x12u);
  }

  [(DatapathMetricStream *)self setQueue:v7];
  [(DatapathMetricStream *)self setGetter:v6];

  id v9 = +[ManagedConfiguration sharedInstance];
  [(DatapathMetricStream *)self setManagedConfiguration:v9];

  v10 = [(DatapathMetricStream *)self managedConfiguration];
  [v10 addObserver:self forKeyPath:@"megawifiprofile_diagnostic_metrics_enabled" options:5 context:0];

  id v11 = [(DatapathMetricStream *)self managedConfiguration];
  [v11 addObserver:self forKeyPath:@"megawifiprofile_diagnostic_metrics_period_ms" options:5 context:0];

  v12 = [(DatapathMetricStream *)self managedConfiguration];
  [v12 addObserver:self forKeyPath:@"coredata_diagnostic_metrics_enabled" options:5 context:0];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [v11 objectForKeyedSubscript:NSKeyValueChangeNewKey];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v13 = v12;
  }
  else {
    int v13 = 0;
  }
  id v14 = v13;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  __int16 v15 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v35 = "-[DatapathMetricStream observeValueForKeyPath:ofObject:change:context:]";
    __int16 v36 = 1024;
    int v37 = 115;
    __int16 v38 = 2112;
    unint64_t v39 = (unint64_t)v9;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:observeValueForKeyPath %@", buf, 0x1Cu);
  }

  if ([v9 isEqualToString:@"megawifiprofile_diagnostic_metrics_enabled"])
  {
    if (v14)
    {
      -[DatapathMetricStream setMegawifiprofile_diagnostic_metrics_enabled:](self, "setMegawifiprofile_diagnostic_metrics_enabled:", [v14 BOOLValue]);
      int v16 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v17 = [(DatapathMetricStream *)self megawifiprofile_diagnostic_metrics_enabled];
        int v18 = "NO";
        v35 = "-[DatapathMetricStream observeValueForKeyPath:ofObject:change:context:]";
        __int16 v36 = 1024;
        int v37 = 120;
        *(_DWORD *)buf = 136446978;
        if (v17) {
          int v18 = "YES";
        }
        __int16 v38 = 2112;
        unint64_t v39 = (unint64_t)v9;
        __int16 v40 = 2080;
        unint64_t v41 = (unint64_t)v18;
        __int16 v19 = "%{public}s::%d:%@ Preference is %s";
        goto LABEL_28;
      }
      goto LABEL_29;
    }
  }
  else if ([v9 isEqualToString:@"megawifiprofile_diagnostic_metrics_period_ms"])
  {
    if (v14)
    {
      id v20 = [(DatapathMetricStream *)self megawifiprofile_diagnostic_metrics_period_ms];
      if (v20 != [v14 unsignedIntegerValue]
        && -[DatapathMetricStream megawifiprofile_diagnostic_metrics_period_ms](self, "megawifiprofile_diagnostic_metrics_period_ms")&& [v14 unsignedIntegerValue])
      {
        v21 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v22 = [(DatapathMetricStream *)self megawifiprofile_diagnostic_metrics_period_ms];
          id v23 = [v14 unsignedIntegerValue];
          *(_DWORD *)buf = 136446978;
          v35 = "-[DatapathMetricStream observeValueForKeyPath:ofObject:change:context:]";
          __int16 v36 = 1024;
          int v37 = 129;
          __int16 v38 = 2048;
          unint64_t v39 = v22;
          __int16 v40 = 2048;
          unint64_t v41 = (unint64_t)v23;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Noticed that kMegaProfileDiagnosticMetricsPeriod_ms is changing values from %lu to %lu", buf, 0x26u);
        }

        *((unsigned char *)v31 + 24) = 1;
      }
      -[DatapathMetricStream setMegawifiprofile_diagnostic_metrics_period_ms:](self, "setMegawifiprofile_diagnostic_metrics_period_ms:", [v14 unsignedIntegerValue]);
      int v16 = WALogCategoryDefaultHandle();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_29;
      }
      unint64_t v24 = [(DatapathMetricStream *)self megawifiprofile_diagnostic_metrics_period_ms];
      *(_DWORD *)buf = 136446978;
      v35 = "-[DatapathMetricStream observeValueForKeyPath:ofObject:change:context:]";
      __int16 v36 = 1024;
      int v37 = 133;
      __int16 v38 = 2112;
      unint64_t v39 = (unint64_t)v9;
      __int16 v40 = 2048;
      unint64_t v41 = v24;
      __int16 v19 = "%{public}s::%d:%@ Preference is %lu";
      goto LABEL_28;
    }
  }
  else
  {
    unsigned int v25 = [v9 isEqualToString:@"coredata_diagnostic_metrics_enabled"];
    if (v14) {
      unsigned int v26 = v25;
    }
    else {
      unsigned int v26 = 0;
    }
    if (v26 == 1)
    {
      -[DatapathMetricStream setCoredata_diagnostic_metrics_enabled:](self, "setCoredata_diagnostic_metrics_enabled:", [v14 BOOLValue]);
      int v16 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v27 = [(DatapathMetricStream *)self coredata_diagnostic_metrics_enabled];
        *(_DWORD *)buf = 136446978;
        v35 = "-[DatapathMetricStream observeValueForKeyPath:ofObject:change:context:]";
        __int16 v36 = 1024;
        int v37 = 138;
        __int16 v38 = 2112;
        unint64_t v39 = (unint64_t)v9;
        __int16 v40 = 2048;
        unint64_t v41 = v27;
        __int16 v19 = "%{public}s::%d:%@ Preference is %lu";
LABEL_28:
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v19, buf, 0x26u);
      }
LABEL_29:
    }
  }
  v28 = [(DatapathMetricStream *)self queue];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100032790;
  v29[3] = &unk_1000D0F38;
  v29[4] = self;
  v29[5] = &v30;
  dispatch_async(v28, v29);

  _Block_object_dispose(&v30, 8);
}

- (id)getPBCodableNSDataFromNSKeyedArchive:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  id v21 = 0;
  int v13 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v12 fromData:v3 error:&v21];

  id v14 = v21;
  if (v14)
  {
    __int16 v15 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v23 = "-[DatapathMetricStream getPBCodableNSDataFromNSKeyedArchive:]";
      __int16 v24 = 1024;
      int v25 = 162;
      __int16 v26 = 2112;
      id v27 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unarchive WAMessageAWD: %@", buf, 0x1Cu);
    }
    id v16 = 0;
    goto LABEL_7;
  }
  unsigned int v17 = [(DatapathMetricStream *)self pbConverter];
  id v14 = [v17 instantiateAWDProtobufAndPopulateValues:v13];

  if (v14)
  {
    id v18 = objc_alloc((Class)NSData);
    __int16 v15 = [v14 data];
    id v16 = [v18 initWithData:v15];
LABEL_7:

    goto LABEL_8;
  }
  id v16 = 0;
LABEL_8:

  return v16;
}

- (void)fetchMetrics
{
  getter = (void (**)(id, uint64_t, void *))self->_getter;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100032C04;
  v3[3] = &unk_1000D0F60;
  v3[4] = self;
  getter[2](getter, 1, v3);
}

- (void)updateTimerConfiguration
{
  id v3 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL megawifiprofile_diagnostic_metrics_enabled = self->_megawifiprofile_diagnostic_metrics_enabled;
    unint64_t megawifiprofile_diagnostic_metrics_period_ms = self->_megawifiprofile_diagnostic_metrics_period_ms;
    BOOL timerRunning = self->_timerRunning;
    timer = self->_timer;
    BOOL v8 = timer != 0;
    if (timer) {
      BOOL v9 = dispatch_source_testcancel(timer) != 0;
    }
    else {
      BOOL v9 = 0;
    }
    *(_DWORD *)buf = 136447746;
    unint64_t v39 = "-[DatapathMetricStream updateTimerConfiguration]";
    __int16 v40 = 1024;
    int v41 = 211;
    __int16 v42 = 1024;
    *(_DWORD *)v43 = megawifiprofile_diagnostic_metrics_enabled;
    *(_WORD *)&v43[4] = 2048;
    *(void *)&v43[6] = megawifiprofile_diagnostic_metrics_period_ms;
    __int16 v44 = 1024;
    BOOL v45 = timerRunning;
    __int16 v46 = 1024;
    BOOL v47 = v8;
    __int16 v48 = 1024;
    BOOL v49 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:megawifiprofile_diagnostic_metrics_enabled is %d megawifiprofile_diagnostic_metrics_period_ms is %lu _timerRunning is %d _timer exists %d testcancel is %d", buf, 0x34u);
  }

  if (self->_timerRunning)
  {
    if (!self->_megawifiprofile_diagnostic_metrics_enabled || !self->_megawifiprofile_diagnostic_metrics_period_ms)
    {
      uint64_t v10 = self->_timer;
      if (v10)
      {
        if (!dispatch_source_testcancel(v10))
        {
          uint64_t v11 = WALogCategoryDefaultHandle();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            BOOL v12 = self->_megawifiprofile_diagnostic_metrics_enabled;
            unint64_t v13 = self->_megawifiprofile_diagnostic_metrics_period_ms;
            *(_DWORD *)buf = 136446978;
            unint64_t v39 = "-[DatapathMetricStream updateTimerConfiguration]";
            __int16 v40 = 1024;
            int v41 = 247;
            __int16 v42 = 1024;
            *(_DWORD *)v43 = v12;
            *(_WORD *)&v43[4] = 2048;
            *(void *)&v43[6] = v13;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Timer exists and is valid, Suspending: Enabled %d Period(ms) %lu", buf, 0x22u);
          }

          dispatch_suspend((dispatch_object_t)self->_timer);
          self->_BOOL timerRunning = 0;
          id v14 = WALogCategoryDefaultHandle();
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_41;
          }
          BOOL v15 = self->_timerRunning;
          *(_DWORD *)buf = 136446722;
          unint64_t v39 = "-[DatapathMetricStream updateTimerConfiguration]";
          __int16 v40 = 1024;
          int v41 = 250;
          __int16 v42 = 1024;
          *(_DWORD *)v43 = v15;
LABEL_40:
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:setting _timerRunning %d", buf, 0x18u);
LABEL_41:
        }
      }
    }
LABEL_42:
    uint64_t v32 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v33 = self->_megawifiprofile_diagnostic_metrics_enabled;
      unint64_t v34 = self->_megawifiprofile_diagnostic_metrics_period_ms;
      v35 = self->_timer;
      if (v35) {
        BOOL v36 = dispatch_source_testcancel(v35) == 0;
      }
      else {
        BOOL v36 = 0;
      }
      *(_DWORD *)buf = 136447234;
      unint64_t v39 = "-[DatapathMetricStream updateTimerConfiguration]";
      __int16 v40 = 1024;
      int v41 = 254;
      __int16 v42 = 1024;
      *(_DWORD *)v43 = v33;
      *(_WORD *)&v43[4] = 2048;
      *(void *)&v43[6] = v34;
      __int16 v44 = 1024;
      BOOL v45 = v36;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Timer State : Enabled %d Period(ms) %lu valid %d", buf, 0x28u);
    }
    goto LABEL_47;
  }
  if (!self->_megawifiprofile_diagnostic_metrics_enabled || !self->_megawifiprofile_diagnostic_metrics_period_ms) {
    goto LABEL_42;
  }
  id v16 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    unint64_t v39 = "-[DatapathMetricStream updateTimerConfiguration]";
    __int16 v40 = 1024;
    int v41 = 214;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Setting timer", buf, 0x12u);
  }

  unsigned int v17 = self->_timer;
  if (v17)
  {
    if (!dispatch_source_testcancel(v17))
    {
LABEL_32:
      int v25 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v26 = [(DatapathMetricStream *)self megawifiprofile_diagnostic_metrics_period_ms];
        *(_DWORD *)buf = 136446722;
        unint64_t v39 = "-[DatapathMetricStream updateTimerConfiguration]";
        __int16 v40 = 1024;
        int v41 = 234;
        __int16 v42 = 2048;
        *(void *)v43 = 1000000 * v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Starting dispatch_source_set_timer fire in %llu ns", buf, 0x1Cu);
      }

      id v27 = self->_timer;
      dispatch_time_t v28 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 0);
      dispatch_source_set_timer(v27, v28, 1000000* [(DatapathMetricStream *)self megawifiprofile_diagnostic_metrics_period_ms], 0x5F5E100uLL);
      v29 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        unint64_t v39 = "-[DatapathMetricStream updateTimerConfiguration]";
        __int16 v40 = 1024;
        int v41 = 236;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Starting dispatch_source_set_timer Done", buf, 0x12u);
      }

      uint64_t v30 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        unint64_t v39 = "-[DatapathMetricStream updateTimerConfiguration]";
        __int16 v40 = 1024;
        int v41 = 238;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:dispatch_resume _timer", buf, 0x12u);
      }

      dispatch_resume((dispatch_object_t)self->_timer);
      self->_BOOL timerRunning = 1;
      id v14 = WALogCategoryDefaultHandle();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_41;
      }
      BOOL v31 = self->_timerRunning;
      *(_DWORD *)buf = 136446722;
      unint64_t v39 = "-[DatapathMetricStream updateTimerConfiguration]";
      __int16 v40 = 1024;
      int v41 = 242;
      __int16 v42 = 1024;
      *(_DWORD *)v43 = v31;
      goto LABEL_40;
    }
LABEL_27:
    unint64_t v22 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      unint64_t v39 = "-[DatapathMetricStream updateTimerConfiguration]";
      __int16 v40 = 1024;
      int v41 = 226;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Setting dispatch_source_set_event_handler", buf, 0x12u);
    }

    id v23 = self->_timer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000336B8;
    handler[3] = &unk_1000D0D98;
    handler[4] = self;
    dispatch_source_set_event_handler(v23, handler);
    __int16 v24 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      unint64_t v39 = "-[DatapathMetricStream updateTimerConfiguration]";
      __int16 v40 = 1024;
      int v41 = 231;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Setting block Done", buf, 0x12u);
    }

    goto LABEL_32;
  }
  id v18 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    unint64_t v39 = "-[DatapathMetricStream updateTimerConfiguration]";
    __int16 v40 = 1024;
    int v41 = 220;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Creating _timer", buf, 0x12u);
  }

  __int16 v19 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
  id v20 = self->_timer;
  self->_timer = v19;

  id v21 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    unint64_t v39 = "-[DatapathMetricStream updateTimerConfiguration]";
    __int16 v40 = 1024;
    int v41 = 222;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Creating _timer Done", buf, 0x12u);
  }

  if (self->_timer) {
    goto LABEL_27;
  }
  uint64_t v32 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_FAULT, "Failed to create _timer", buf, 2u);
  }
LABEL_47:
}

- (void)streamPBCodeable:(id)a3 additionalDictionaryItems:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v9 = objc_alloc((Class)WANWActivityStatistics);
  uint64_t v10 = [v6 data];
  id v11 = [v9 initWithPBCodableData:v10];

  BOOL v12 = [(DatapathMetricStream *)self lastPBLock];
  [v12 lock];

  unint64_t v13 = [(DatapathMetricStream *)self lastPB];
  if (![v13 length])
  {

    goto LABEL_18;
  }
  unint64_t v14 = [(DatapathMetricStream *)self lastPBLength];

  if (!v14)
  {
LABEL_18:
    __int16 v44 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v74 = "-[DatapathMetricStream streamPBCodeable:additionalDictionaryItems:]";
      __int16 v75 = 1024;
      int v76 = 335;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Missing previous fragment, writing single fragment", buf, 0x12u);
    }

    BOOL v31 = [v11 getTransformedFlattened:2];
    if (+[NSJSONSerialization isValidJSONObject:v31])
    {
      id v71 = 0;
      __int16 v38 = +[NSJSONSerialization dataWithJSONObject:v31 options:0 error:&v71];
      __int16 v19 = v71;
      if (!v19)
      {
        BOOL v45 = WALogDiagnosticProfileLogHandle();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v46 = (char *)[objc_alloc((Class)NSString) initWithData:v38 encoding:4];
          *(_DWORD *)buf = 138543362;
          v74 = v46;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
        }
      }
      goto LABEL_40;
    }
    __int16 v19 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v74 = "-[DatapathMetricStream streamPBCodeable:additionalDictionaryItems:]";
      __int16 v75 = 1024;
      int v76 = 350;
      __int16 v77 = 2112;
      *(void *)v78 = v31;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}s::%d:invalid JSON %@", buf, 0x1Cu);
    }
    goto LABEL_41;
  }
  id v15 = objc_alloc((Class)NSData);
  id v16 = [(DatapathMetricStream *)self lastPB];
  id v17 = [v15 initWithBytesNoCopy:[v16 mutableBytes] length:-[DatapathMetricStream lastPBLength](self, "lastPBLength") freeWhenDone:0];

  id v18 = WALogCategoryDefaultHandle();
  __int16 v19 = v18;
  if (v17)
  {
    id v69 = v6;
    v70 = v8;
    id v68 = v7;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446722;
      v74 = "-[DatapathMetricStream streamPBCodeable:additionalDictionaryItems:]";
      __int16 v75 = 1024;
      int v76 = 284;
      __int16 v77 = 2048;
      *(void *)v78 = [v17 length];
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "%{public}s::%d:initWithBytesNoCopy NSData len %lu", buf, 0x1Cu);
    }

    id v65 = v17;
    __int16 v19 = [objc_alloc((Class)WANWActivityStatistics) initWithPBCodableData:v17];
    id v20 = [v19 awdReport];
    id v21 = [v20 dictionaryRepresentation];
    unint64_t v22 = [v21 allKeys];
    id v23 = [v22 count];
    v67 = v11;
    __int16 v24 = [v11 awdReport];
    int v25 = [v24 dictionaryRepresentation];
    unint64_t v26 = [v25 allKeys];
    id v27 = [v26 count];

    if (v23 != v27)
    {
      __int16 v38 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        BOOL v47 = [v19 awdReport];
        os_log_t loga = [v47 dictionaryRepresentation];
        __int16 v48 = [loga allKeys];
        id v49 = [v48 count];
        id v11 = v67;
        v50 = [v67 awdReport];
        v51 = [v50 dictionaryRepresentation];
        v52 = [v51 allKeys];
        id v53 = [v52 count];
        *(_DWORD *)buf = 136446978;
        v74 = "-[DatapathMetricStream streamPBCodeable:additionalDictionaryItems:]";
        __int16 v75 = 1024;
        int v76 = 327;
        __int16 v77 = 2048;
        *(void *)v78 = v49;
        *(_WORD *)&v78[8] = 2048;
        *(void *)&v78[10] = v53;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Not diffing - previousFragment.keys.count %lu wifiFragment %lu", buf, 0x26u);

        id v7 = v68;
        id v6 = v69;
        BOOL v8 = v70;
      }
      else
      {
        id v7 = v68;
        id v6 = v69;
        BOOL v8 = v70;
        id v11 = v67;
      }
      BOOL v31 = v65;
LABEL_40:

      goto LABEL_41;
    }
    if (v19)
    {
      dispatch_time_t v28 = [v19 awdReport];
      v29 = [v28 dictionaryRepresentation];
      uint64_t v30 = [v29 allKeys];
      BOOL v31 = v65;
      if ([v30 containsObject:@"interfaceStats"])
      {
        uint64_t v32 = [v19 awdReport];
        BOOL v33 = [v32 dictionaryRepresentation];
        unint64_t v34 = [v33 allKeys];
        unsigned int v35 = [v34 containsObject:@"controllerStats"];

        if (v35)
        {
          BOOL v36 = [v19 awdReport];
          int v37 = [v36 dictionaryRepresentation];
          id v11 = v67;
          __int16 v38 = [v67 getTransformedFlattenedFrom:v37 style:2];

          id v6 = v69;
          BOOL v8 = v70;
          if (v38)
          {
            unint64_t v39 = [(DatapathMetricStream *)self dbDelegate];
            [v39 processMetricDictOnEngine:WADeviceAnalyticsWiFiStatsInfo data:v38];

            id v7 = v68;
            if (+[NSJSONSerialization isValidJSONObject:v38])
            {
              id v72 = 0;
              __int16 v40 = +[NSJSONSerialization dataWithJSONObject:v38 options:0 error:&v72];
              id v41 = v72;
              if (!v41)
              {
                __int16 v42 = WALogDiagnosticProfileLogHandle();
                if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
                {
                  log = v42;
                  v43 = (char *)[objc_alloc((Class)NSString) initWithData:v40 encoding:4];
                  *(_DWORD *)buf = 138543362;
                  v74 = v43;
                  _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);

                  __int16 v42 = log;
                }
              }
              BOOL v8 = v70;
              goto LABEL_40;
            }
            int v54 = 0;
          }
          else
          {
            int v54 = 1;
            id v7 = v68;
          }
LABEL_37:
          v55 = WALogCategoryDefaultHandle();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            v66 = [v19 awdReport];
            os_log_t logb = [v66 dictionaryRepresentation];
            v61 = [logb allKeys];
            id v56 = [v61 count];
            v57 = [v19 awdReport];
            v58 = [v57 dictionaryRepresentation];
            v59 = [v58 allKeys];
            *(_DWORD *)buf = 136447490;
            v74 = "-[DatapathMetricStream streamPBCodeable:additionalDictionaryItems:]";
            __int16 v75 = 1024;
            int v76 = 323;
            __int16 v77 = 1024;
            *(_DWORD *)v78 = v54;
            *(_WORD *)&v78[4] = 2048;
            *(void *)&v78[6] = v56;
            *(_WORD *)&v78[14] = 2112;
            *(void *)&v78[16] = v59;
            __int16 v79 = 2112;
            v80 = v38;
            _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "%{public}s::%d:bad flattenedAndTransformed %d %lu %@ or invalid JSON %@", buf, 0x36u);

            id v6 = v69;
            id v7 = v68;

            BOOL v8 = v70;
          }

          id v11 = v67;
          goto LABEL_40;
        }
      }
      else
      {
      }
      __int16 v38 = 0;
      int v54 = 1;
      id v7 = v68;
      id v6 = v69;
      BOOL v8 = v70;
      goto LABEL_37;
    }
    __int16 v38 = 0;
    int v54 = 1;
    id v7 = v68;
    id v6 = v69;
    BOOL v8 = v70;
    BOOL v31 = v65;
    goto LABEL_37;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v74 = "-[DatapathMetricStream streamPBCodeable:additionalDictionaryItems:]";
    __int16 v75 = 1024;
    int v76 = 330;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to make NSData initWithBytesNoCopy", buf, 0x12u);
  }
  BOOL v31 = 0;
LABEL_41:

  v60 = [(DatapathMetricStream *)self lastPBLock];
  [v60 unlock];
}

- (WAStreamDBDelegate)dbDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dbDelegate);

  return (WAStreamDBDelegate *)WeakRetained;
}

- (void)setDbDelegate:(id)a3
{
}

- (BOOL)monitoring
{
  return self->_monitoring;
}

- (void)setMonitoring:(BOOL)a3
{
  self->_monitoring = a3;
}

- (OS_dispatch_source)timer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTimer:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setQueue:(id)a3
{
}

- (id)block
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setBlock:(id)a3
{
}

- (ManagedConfiguration)managedConfiguration
{
  return (ManagedConfiguration *)objc_getProperty(self, a2, 48, 1);
}

- (void)setManagedConfiguration:(id)a3
{
}

- (WAProtobufMessageSubmitter)pbConverter
{
  return self->_pbConverter;
}

- (void)setPbConverter:(id)a3
{
}

- (id)getter
{
  return self->_getter;
}

- (void)setGetter:(id)a3
{
}

- (BOOL)timerRunning
{
  return self->_timerRunning;
}

- (void)setTimerRunning:(BOOL)a3
{
  self->_BOOL timerRunning = a3;
}

- (BOOL)megawifiprofile_diagnostic_metrics_enabled
{
  return self->_megawifiprofile_diagnostic_metrics_enabled;
}

- (void)setMegawifiprofile_diagnostic_metrics_enabled:(BOOL)a3
{
  self->_BOOL megawifiprofile_diagnostic_metrics_enabled = a3;
}

- (unint64_t)megawifiprofile_diagnostic_metrics_period_ms
{
  return self->_megawifiprofile_diagnostic_metrics_period_ms;
}

- (void)setMegawifiprofile_diagnostic_metrics_period_ms:(unint64_t)a3
{
  self->_unint64_t megawifiprofile_diagnostic_metrics_period_ms = a3;
}

- (BOOL)coredata_diagnostic_metrics_enabled
{
  return self->_coredata_diagnostic_metrics_enabled;
}

- (void)setCoredata_diagnostic_metrics_enabled:(BOOL)a3
{
  self->_coredata_diagnostic_metrics_enabled = a3;
}

- (NSMutableData)lastPB
{
  return self->_lastPB;
}

- (void)setLastPB:(id)a3
{
}

- (unint64_t)lastPBLength
{
  return self->_lastPBLength;
}

- (void)setLastPBLength:(unint64_t)a3
{
  self->_lastPBLength = a3;
}

- (NSLock)lastPBLock
{
  return self->_lastPBLock;
}

- (void)setLastPBLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPBLock, 0);
  objc_storeStrong((id *)&self->_lastPB, 0);
  objc_storeStrong(&self->_getter, 0);
  objc_storeStrong((id *)&self->_pbConverter, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timer, 0);

  objc_destroyWeak((id *)&self->_dbDelegate);
}

@end