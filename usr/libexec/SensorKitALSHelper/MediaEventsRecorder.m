@interface MediaEventsRecorder
+ (void)initialize;
- (void)dealloc;
- (void)launchEventRunActivity:(id)a3;
- (void)sensorWriterDidStopMonitoring:(id)a3;
- (void)sensorWriterWillStartMonitoring:(id)a3;
@end

@implementation MediaEventsRecorder

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_10002AA18 = (uint64_t)os_log_create("com.apple.SensorKit", "SensorKitMediaEventsRecorder");
  }
}

- (void)dealloc
{
  self->_sensorWriter = 0;
  self->_queue = 0;

  self->_launchEvents = 0;
  v3.receiver = self;
  v3.super_class = (Class)MediaEventsRecorder;
  [(MediaEventsRecorder *)&v3 dealloc];
}

- (void)sensorWriterWillStartMonitoring:(id)a3
{
  v4 = qword_10002AA18;
  if (os_log_type_enabled((os_log_t)qword_10002AA18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Start media events recording", v6, 2u);
  }
  launchEvents = self->_launchEvents;
  CFStringRef v7 = @"com.apple.sensorkit.launchMediaEventsRecorder";
  [(RDLaunchEvents *)launchEvents registerForXPCActivities:+[NSArray arrayWithObjects:&v7 count:1]];
}

- (void)sensorWriterDidStopMonitoring:(id)a3
{
  v4 = qword_10002AA18;
  if (os_log_type_enabled((os_log_t)qword_10002AA18, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Stop media events recording", v6, 2u);
  }
  launchEvents = self->_launchEvents;
  CFStringRef v7 = @"com.apple.sensorkit.launchMediaEventsRecorder";
  [(RDLaunchEvents *)launchEvents unregisterForXPCActivities:+[NSArray arrayWithObjects:&v7 count:1]];
}

- (void)launchEventRunActivity:(id)a3
{
  v4 = self;
  if (self) {
    self = (MediaEventsRecorder *)self->_queue;
  }
  dispatch_assert_queue_V2(&self->super);
  if (a3) {
    v5 = (void *)*((void *)a3 + 1);
  }
  else {
    v5 = 0;
  }
  if ([v5 isEqualToString:@"com.apple.sensorkit.launchMediaEventsRecorder"])
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v18 = sub_1000091A4;
    v19 = &unk_100024970;
    id v20 = a3;
    if (v4)
    {
      v6 = +[NSDate dateWithSRAbsoluteTime:fmax(SRAbsoluteTimeGetCurrent() + -604800.0, 0.0)];
      CFStringRef v7 = [+[NSUserDefaults standardUserDefaults] objectForKey:@"lastMediaEventsCollectingDate"];
      if (!v7) {
        CFStringRef v7 = +[NSDate dateWithSRAbsoluteTime:fmax(SRAbsoluteTimeGetCurrent() + -86400.0, 0.0)];
      }
      v8 = [(NSDate *)v7 laterDate:v6];
      v9 = +[NSDate now];
      id v10 = [[[BiomeLibrary() Messages] Media] Rendered];
      id v11 = [objc_alloc((Class)BMPublisherOptions) initWithStartDate:v8 endDate:v9 maxEvents:0 lastN:0 reversed:0];
      id v12 = [v10 publisherWithOptions:v11];

      if (v12)
      {
        objc_initWeak(&location, v4);
        v13 = qword_10002AA18;
        if (os_log_type_enabled((os_log_t)qword_10002AA18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v8;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v9;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Querying media events for interval with start date:%{public}@, end date:%{public}@", buf, 0x16u);
        }
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = sub_1000088AC;
        v25 = &unk_100024A68;
        objc_copyWeak(&v28, &location);
        v26 = v9;
        v27 = v17;
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_1000089EC;
        v21[3] = &unk_100024A90;
        objc_copyWeak(&v22, &location);
        [v12 sinkWithCompletion:buf receiveInput:v21];
        objc_destroyWeak(&v22);
        objc_destroyWeak(&v28);
        objc_destroyWeak(&location);
      }
      else
      {
        v15 = qword_10002AA18;
        if (os_log_type_enabled((os_log_t)qword_10002AA18, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to create mediaRenderedPublisher publisher", buf, 2u);
        }
        v18((uint64_t)v17);
      }
    }
  }
  else
  {
    v14 = qword_10002AA18;
    if (os_log_type_enabled((os_log_t)qword_10002AA18, OS_LOG_TYPE_FAULT))
    {
      if (a3) {
        uint64_t v16 = *((void *)a3 + 1);
      }
      else {
        uint64_t v16 = 0;
      }
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v16;
      _os_log_fault_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "Told to run unsupported XPC activity %{public}@", buf, 0xCu);
    }
    [a3 markCompleted];
  }
}

@end