@interface _DASBatteryTemperatureRecorder
+ (_DASBatteryTemperatureRecorder)sharedInstance;
- (BOOL)storeBatteryTemperatureEvent:(int64_t)a3 metaData:(id)a4;
- (IONotificationPort)notifyPort;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (_DASBatteryTemperatureRecorder)init;
- (_DKEventStream)targetStream;
- (_DKKnowledgeSaving)knowledgeStore;
- (double)highTemperatureDelta;
- (double)lowTemperatureCeiling;
- (double)lowTemperatureDelta;
- (double)mediumTemperatureCeiling;
- (double)mediumTemperatureDelta;
- (double)nonPluggedInDelta;
- (id)getBatteryStatus;
- (int64_t)currentBatteryTemperature;
- (int64_t)recentBatteryTemperature;
- (int64_t)roundedTemperature:(int64_t)a3;
- (unsigned)batteryNotification;
- (unsigned)powerService;
- (void)handleBatteryNotification;
- (void)setBatteryNotification:(unsigned int)a3;
- (void)setCurrentBatteryTemperature:(int64_t)a3;
- (void)setHighTemperatureDelta:(double)a3;
- (void)setKnowledgeStore:(id)a3;
- (void)setLog:(id)a3;
- (void)setLowTemperatureCeiling:(double)a3;
- (void)setLowTemperatureDelta:(double)a3;
- (void)setMediumTemperatureCeiling:(double)a3;
- (void)setMediumTemperatureDelta:(double)a3;
- (void)setNonPluggedInDelta:(double)a3;
- (void)setNotifyPort:(IONotificationPort *)a3;
- (void)setPowerService:(unsigned int)a3;
- (void)setQueue:(id)a3;
- (void)setRecentBatteryTemperature:(int64_t)a3;
- (void)setTargetStream:(id)a3;
- (void)startRecording;
@end

@implementation _DASBatteryTemperatureRecorder

- (_DASBatteryTemperatureRecorder)init
{
  v19.receiver = self;
  v19.super_class = (Class)_DASBatteryTemperatureRecorder;
  v2 = [(_DASBatteryTemperatureRecorder *)&v19 init];
  if (v2)
  {
    uint64_t v3 = +[_DASDaemonLogger logForCategory:@"batteryTemperatureRecorder"];
    v4 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v3;

    if (MGGetBoolAnswer())
    {
      CFDictionaryRef v5 = IOServiceMatching("IOPMPowerSource");
      io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v5);
      *((_DWORD *)v2 + 2) = MatchingService;
      if (MatchingService)
      {
        IONotificationPortRef v7 = IONotificationPortCreate(kIOMainPortDefault);
        *((void *)v2 + 3) = v7;
        if (v7)
        {
          *(_OWORD *)(v2 + 72) = xmmword_100126DE0;
          *(_OWORD *)(v2 + 88) = xmmword_100126DF0;
          *(_OWORD *)(v2 + 104) = xmmword_100126E00;
          id v8 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.duetactivityscheduler"];
          [v8 doubleForKey:@"lowTemperatureCeiling"];
          if (v9 != 0.0) {
            *((double *)v2 + 9) = v9;
          }
          [v8 doubleForKey:@"mediumTemperatureCeiling"];
          if (v10 != 0.0) {
            *((double *)v2 + 10) = v10;
          }
          [v8 doubleForKey:@"nonPluggedInDelta"];
          if (v11 != 0.0) {
            *((double *)v2 + 14) = v11;
          }
          [v8 doubleForKey:@"lowTemperatureDelta"];
          if (v12 != 0.0) {
            *((double *)v2 + 11) = v12;
          }
          [v8 doubleForKey:@"mediumTemperatureDelta"];
          if (v13 != 0.0) {
            *((double *)v2 + 12) = v13;
          }
          [v8 doubleForKey:@"highTemperatureDelta"];
          if (v14 != 0.0) {
            *((double *)v2 + 13) = v14;
          }

          goto LABEL_18;
        }
        if (os_log_type_enabled(*((os_log_t *)v2 + 4), OS_LOG_TYPE_ERROR)) {
          sub_1000FB03C();
        }
      }
      else if (os_log_type_enabled(*((os_log_t *)v2 + 4), OS_LOG_TYPE_ERROR))
      {
        sub_1000FB008();
      }
    }
    else
    {
      v16 = *((void *)v2 + 4);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Device does not have an internal battery", v18, 2u);
      }
    }
    v15 = 0;
    goto LABEL_26;
  }
LABEL_18:
  v15 = v2;
LABEL_26:

  return v15;
}

+ (_DASBatteryTemperatureRecorder)sharedInstance
{
  if (qword_1001C42A0 != -1) {
    dispatch_once(&qword_1001C42A0, &stru_1001773F0);
  }
  v2 = (void *)qword_1001C42A8;

  return (_DASBatteryTemperatureRecorder *)v2;
}

- (void)startRecording
{
  self->_currentBatteryTemperature = -1000;
  uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.dasd.batteryTemperature.datacollection", v3);
  queue = self->_queue;
  self->_queue = v4;

  IONotificationPortSetDispatchQueue(self->_notifyPort, (dispatch_queue_t)self->_queue);
  if (IOServiceAddInterestNotification(self->_notifyPort, self->_powerService, "IOGeneralInterest", (IOServiceInterestCallback)sub_10008F924, self, &self->_batteryNotification))
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_1000FB070();
    }
  }
  else
  {
    v6 = +[_DKEventStream eventStreamWithName:@"/dasd/batterytemperature"];
    targetStream = self->_targetStream;
    self->_targetStream = v6;

    id v8 = +[_DKKnowledgeStore knowledgeStore];
    knowledgeStore = self->_knowledgeStore;
    self->_knowledgeStore = v8;

    self->_recentBatteryTemperature = -1000;
  }
}

- (void)handleBatteryNotification
{
  uint64_t v3 = (void *)os_transaction_create();
  CFDictionaryRef v5 = [(_DASBatteryTemperatureRecorder *)self getBatteryStatus];
  v6 = v5;
  if (v5)
  {
    IONotificationPortRef v7 = [v5 objectForKeyedSubscript:@"batteryTemperature"];
    id v8 = [v7 integerValue];

    if (v8)
    {
      self->_currentBatteryTemperature = (int64_t)v8;
      uint64_t v9 = [(_DASBatteryTemperatureRecorder *)self roundedTemperature:v8];
      p_int64_t recentBatteryTemperature = &self->_recentBatteryTemperature;
      int64_t recentBatteryTemperature = self->_recentBatteryTemperature;
      log = self->_log;
      uint64_t v13 = v9 - recentBatteryTemperature;
      if (v9 == recentBatteryTemperature)
      {
        if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
          sub_1000FB0A4(&self->_recentBatteryTemperature, v9, (os_log_t)log);
        }
      }
      else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_INFO))
      {
        int64_t v14 = *p_recentBatteryTemperature;
        *(_DWORD *)buf = 134218496;
        uint64_t v28 = v9;
        __int16 v29 = 2048;
        uint64_t v30 = v14;
        __int16 v31 = 2048;
        uint64_t v32 = v13;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Current temp %ld, recent temp %ld, change %ld", buf, 0x20u);
      }
      v15 = [v6 objectForKeyedSubscript:@"pluggedIn"];

      if (v15)
      {
        if (self->_lowTemperatureCeiling <= (double)v9)
        {
          uint64_t v16 = 104;
          if (self->_mediumTemperatureCeiling > (double)v9) {
            uint64_t v16 = 96;
          }
        }
        else
        {
          uint64_t v16 = 88;
        }
      }
      else
      {
        uint64_t v16 = 112;
      }
      uint64_t v17 = (uint64_t)*(double *)((char *)&self->super.isa + v16);
      if (v13 >= 0) {
        uint64_t v18 = v13;
      }
      else {
        uint64_t v18 = -v13;
      }
      if (v18 > v17)
      {
        objc_super v19 = self->_log;
        if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          uint64_t v28 = v13;
          __int16 v29 = 2048;
          uint64_t v30 = v17;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v19, OS_LOG_TYPE_INFO, "Writing event since delta %ld is greater than %ld", buf, 0x16u);
        }
        v20 = [v6 objectForKeyedSubscript:@"pluggedIn"];
        id v21 = [v20 BOOLValue];

        v22 = +[NSNumber numberWithBool:v21, @"pluggedIn"];
        v26 = v22;
        v23 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
        unsigned int v24 = [(_DASBatteryTemperatureRecorder *)self storeBatteryTemperatureEvent:v9 metaData:v23];

        if (v24) {
          *p_int64_t recentBatteryTemperature = v9;
        }
      }
    }
  }
}

- (id)getBatteryStatus
{
  kern_return_t v4;
  int v5;
  OS_os_log *log;
  void *v7;
  CFMutableDictionaryRef v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  OS_os_log *v13;
  CFMutableDictionaryRef properties;
  uint64_t vars8;

  io_registry_entry_t powerService = self->_powerService;
  if (!powerService)
  {
LABEL_5:
    IONotificationPortRef v7 = 0;
    goto LABEL_12;
  }
  properties = 0;
  v4 = IORegistryEntryCreateCFProperties(powerService, &properties, kCFAllocatorDefault, 0);
  if (v4)
  {
    CFDictionaryRef v5 = v4;
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
      sub_1000FB1B0(v5, log);
    }
    goto LABEL_5;
  }
  id v8 = properties;
  uint64_t v9 = [(__CFDictionary *)properties copy];

  double v10 = [v9 objectForKeyedSubscript:@"Temperature"];

  if (v10)
  {
    IONotificationPortRef v7 = +[NSMutableDictionary dictionary];
    double v11 = [v9 objectForKeyedSubscript:@"Temperature"];
    [v7 setObject:v11 forKeyedSubscript:@"batteryTemperature"];

    double v12 = [v9 objectForKeyedSubscript:@"ExternalConnected"];
    [v7 setObject:v12 forKeyedSubscript:@"pluggedIn"];
  }
  else
  {
    uint64_t v13 = self->_log;
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR)) {
      sub_1000FB138((uint64_t)v9, v13);
    }
    IONotificationPortRef v7 = 0;
  }

LABEL_12:

  return v7;
}

- (BOOL)storeBatteryTemperatureEvent:(int64_t)a3 metaData:(id)a4
{
  targetStream = self->_targetStream;
  id v7 = a4;
  id v8 = +[NSDate date];
  uint64_t v9 = +[NSDate date];
  double v10 = +[_DKEvent eventWithStream:targetStream startDate:v8 endDate:v9 categoryIntegerValue:a3 metadata:v7];

  if (v10)
  {
    knowledgeStore = self->_knowledgeStore;
    uint64_t v18 = v10;
    double v12 = +[NSArray arrayWithObjects:&v18 count:1];
    id v17 = 0;
    [(_DKKnowledgeSaving *)knowledgeStore saveObjects:v12 error:&v17];
    id v13 = v17;

    BOOL v14 = v13 == 0;
    if (v13)
    {
      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
        sub_1000FB25C((uint64_t)v13, log);
      }
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_1000FB228();
    }
    BOOL v14 = 0;
  }

  return v14;
}

- (int64_t)roundedTemperature:(int64_t)a3
{
  return (uint64_t)(round((double)a3 / 100.0) * 100.0);
}

- (int64_t)currentBatteryTemperature
{
  return self->_currentBatteryTemperature;
}

- (void)setCurrentBatteryTemperature:(int64_t)a3
{
  self->_currentBatteryTemperature = a3;
}

- (unsigned)powerService
{
  return self->_powerService;
}

- (void)setPowerService:(unsigned int)a3
{
  self->_io_registry_entry_t powerService = a3;
}

- (unsigned)batteryNotification
{
  return self->_batteryNotification;
}

- (void)setBatteryNotification:(unsigned int)a3
{
  self->_batteryNotification = a3;
}

- (IONotificationPort)notifyPort
{
  return self->_notifyPort;
}

- (void)setNotifyPort:(IONotificationPort *)a3
{
  self->_notifyPort = a3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (_DKEventStream)targetStream
{
  return self->_targetStream;
}

- (void)setTargetStream:(id)a3
{
}

- (_DKKnowledgeSaving)knowledgeStore
{
  return self->_knowledgeStore;
}

- (void)setKnowledgeStore:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (int64_t)recentBatteryTemperature
{
  return self->_recentBatteryTemperature;
}

- (void)setRecentBatteryTemperature:(int64_t)a3
{
  self->_int64_t recentBatteryTemperature = a3;
}

- (double)lowTemperatureCeiling
{
  return self->_lowTemperatureCeiling;
}

- (void)setLowTemperatureCeiling:(double)a3
{
  self->_lowTemperatureCeiling = a3;
}

- (double)mediumTemperatureCeiling
{
  return self->_mediumTemperatureCeiling;
}

- (void)setMediumTemperatureCeiling:(double)a3
{
  self->_mediumTemperatureCeiling = a3;
}

- (double)lowTemperatureDelta
{
  return self->_lowTemperatureDelta;
}

- (void)setLowTemperatureDelta:(double)a3
{
  self->_lowTemperatureDelta = a3;
}

- (double)mediumTemperatureDelta
{
  return self->_mediumTemperatureDelta;
}

- (void)setMediumTemperatureDelta:(double)a3
{
  self->_mediumTemperatureDelta = a3;
}

- (double)highTemperatureDelta
{
  return self->_highTemperatureDelta;
}

- (void)setHighTemperatureDelta:(double)a3
{
  self->_highTemperatureDelta = a3;
}

- (double)nonPluggedInDelta
{
  return self->_nonPluggedInDelta;
}

- (void)setNonPluggedInDelta:(double)a3
{
  self->_nonPluggedInDelta = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
  objc_storeStrong((id *)&self->_targetStream, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

@end