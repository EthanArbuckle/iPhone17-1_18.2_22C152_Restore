@interface StrideCalibrationRecorder
+ (void)initialize;
- (void)dealloc;
- (void)launchEventRunActivity:(id)a3;
- (void)sensorWriterDidStopMonitoring:(id)a3;
- (void)sensorWriterWillStartMonitoring:(id)a3;
@end

@implementation StrideCalibrationRecorder

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_10002AA08 = (uint64_t)os_log_create("com.apple.SensorKit", "SensorKitStrideCalibrationHelper");
  }
}

- (void)dealloc
{
  self->_sensorWriter = 0;
  self->_queue = 0;

  self->_launchEvents = 0;
  v3.receiver = self;
  v3.super_class = (Class)StrideCalibrationRecorder;
  [(StrideCalibrationRecorder *)&v3 dealloc];
}

- (void)sensorWriterWillStartMonitoring:(id)a3
{
  v4 = qword_10002AA08;
  if (os_log_type_enabled((os_log_t)qword_10002AA08, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "start stride calibration recording", v6, 2u);
  }
  launchEvents = self->_launchEvents;
  CFStringRef v7 = @"com.apple.sensorkit.fetchStrideCalibration";
  [(RDLaunchEvents *)launchEvents registerForXPCActivities:+[NSArray arrayWithObjects:&v7 count:1]];
}

- (void)sensorWriterDidStopMonitoring:(id)a3
{
  v4 = qword_10002AA08;
  if (os_log_type_enabled((os_log_t)qword_10002AA08, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "stop stride calibration recording", v6, 2u);
  }
  launchEvents = self->_launchEvents;
  CFStringRef v7 = @"com.apple.sensorkit.fetchStrideCalibration";
  [(RDLaunchEvents *)launchEvents unregisterForXPCActivities:+[NSArray arrayWithObjects:&v7 count:1]];
}

- (void)launchEventRunActivity:(id)a3
{
  v4 = self;
  if (self) {
    self = (StrideCalibrationRecorder *)self->_queue;
  }
  dispatch_assert_queue_V2(&self->super);
  if (a3) {
    v5 = (void *)*((void *)a3 + 1);
  }
  else {
    v5 = 0;
  }
  if ([v5 isEqualToString:@"com.apple.sensorkit.fetchStrideCalibration"])
  {
    if (v4)
    {
      unsigned __int8 v6 = [(SRSensorWriter *)v4->_sensorWriter isMonitoring];
      CFStringRef v7 = qword_10002AA08;
      BOOL v8 = os_log_type_enabled((os_log_t)qword_10002AA08, OS_LOG_TYPE_INFO);
      if (v6)
      {
        if (v8)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Fetching stride calibration history", buf, 2u);
        }
        id v9 = objc_alloc_init((Class)CMPedometer);
        id v10 = [v9 strideCalibrationDump];
        v11 = qword_10002AA08;
        if (os_log_type_enabled((os_log_t)qword_10002AA08, OS_LOG_TYPE_INFO))
        {
          v12 = (SRSensorWriter *)[objc_msgSend(objc_msgSend(v10, "calibrationTracks"), "count")];
          *(_DWORD *)buf = 134217984;
          v22 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Fetched %lu calibration tracks", buf, 0xCu);
        }
        if (objc_msgSend(objc_msgSend(v10, "calibrationTracks"), "count"))
        {
          v20 = 0;
          v13 = +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", [v10 calibrationTracks], 1, &v20);
          v14 = v20;
          if (v20)
          {
            v15 = qword_10002AA08;
            if (os_log_type_enabled((os_log_t)qword_10002AA08, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v22 = v14;
              _os_log_fault_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "Sample archive failed with error %@", buf, 0xCu);
            }
          }
          else if (v13)
          {
            [(SRSensorWriter *)v4->_sensorWriter provideSampleData:v13];
          }
          else
          {
            v19 = qword_10002AA08;
            if (os_log_type_enabled((os_log_t)qword_10002AA08, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Sample is empty", buf, 2u);
            }
          }
        }
      }
      else if (v8)
      {
        sensorWriter = v4->_sensorWriter;
        *(_DWORD *)buf = 138543618;
        v22 = sensorWriter;
        __int16 v23 = 2114;
        uint64_t v24 = SRSensorStrideCalibration;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{public}@ is not monitoring for %{public}@", buf, 0x16u);
      }
    }
    [a3 markCompleted];
  }
  else
  {
    v16 = qword_10002AA08;
    if (os_log_type_enabled((os_log_t)qword_10002AA08, OS_LOG_TYPE_FAULT))
    {
      if (a3) {
        v18 = (SRSensorWriter *)*((void *)a3 + 1);
      }
      else {
        v18 = 0;
      }
      *(_DWORD *)buf = 138543362;
      v22 = v18;
      _os_log_fault_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "Told to run unsupported XPC activity %{public}@", buf, 0xCu);
    }
    [a3 markCompleted];
  }
}

@end