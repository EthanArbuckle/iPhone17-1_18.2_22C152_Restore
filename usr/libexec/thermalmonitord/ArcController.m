@interface ArcController
- (ArcController)init;
- (ArcController)initWithParams:(id)a3 product:(id)a4;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (int)numberOfFields;
- (void)overrideParam:(id)a3 value:(int)originalThresholdModuleTemperature;
- (void)update;
- (void)updateInternal;
@end

@implementation ArcController

- (ArcController)init
{
  return [(ArcController *)self initWithParams:0 product:0];
}

- (ArcController)initWithParams:(id)a3 product:(id)a4
{
  v36.receiver = self;
  v36.super_class = (Class)ArcController;
  v6 = [(ArcController *)&v36 init];
  v7 = v6;
  if (v6)
  {
    v6->_product = (CommonProduct *)a4;
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.ThermalMonitor.arc", 0);
    v7->_arcQueue = (OS_dispatch_queue *)v8;
    v7->_mitigationsActive = -1;
    if (!v8)
    {
      v9 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_100059708(v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
    sub_100008280((CFDictionaryRef)a3, @"thresholdModule", kCFNumberIntType, &v7->_thresholdModuleTemperature);
    p_thresholdModuleTemperatureHysteresis = &v7->_thresholdModuleTemperatureHysteresis;
    sub_100008280((CFDictionaryRef)a3, @"thresholdModuleHysteresis", kCFNumberIntType, &v7->_thresholdModuleTemperatureHysteresis);
    p_thresholdVirtualTemperature = &v7->_thresholdVirtualTemperature;
    sub_100008280((CFDictionaryRef)a3, @"thresholdVirtual", kCFNumberIntType, &v7->_thresholdVirtualTemperature);
    p_thresholdVirtualTemperatureHysteresis = &v7->_thresholdVirtualTemperatureHysteresis;
    sub_100008280((CFDictionaryRef)a3, @"thresholdVirtualHysteresis", kCFNumberIntType, &v7->_thresholdVirtualTemperatureHysteresis);
    p_gainMitigated = &v7->_gainMitigated;
    sub_100008280((CFDictionaryRef)a3, @"gainMitigated", kCFNumberFloatType, &v7->_gainMitigated);
    p_gainUnmitigated = (_DWORD *)&v7->_gainUnmitigated;
    sub_100008280((CFDictionaryRef)a3, @"gainUnmitigated", kCFNumberFloatType, &v7->_gainUnmitigated);
    int thresholdModuleTemperature = v7->_thresholdModuleTemperature;
    if (thresholdModuleTemperature <= 0)
    {
      int v25 = *p_thresholdVirtualTemperature;
    }
    else
    {
      int v25 = *p_thresholdVirtualTemperature;
      BOOL v26 = *p_thresholdModuleTemperatureHysteresis < 1 || v25 < 1;
      if (!v26 && *p_thresholdVirtualTemperatureHysteresis >= 1)
      {
        LODWORD(v22) = 1.0;
        if (*p_gainMitigated > 0.0 && *p_gainMitigated <= 1.0)
        {
          LODWORD(v23) = *p_gainUnmitigated;
          if (*(float *)p_gainUnmitigated > 0.0 && *(float *)&v23 <= 1.0) {
            goto LABEL_23;
          }
        }
      }
    }
    v29 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
    {
      int v31 = *p_thresholdModuleTemperatureHysteresis;
      int v32 = *p_thresholdVirtualTemperatureHysteresis;
      double v33 = *p_gainMitigated;
      double v34 = *(float *)p_gainUnmitigated;
      *(_DWORD *)buf = 67110400;
      int v38 = thresholdModuleTemperature;
      __int16 v39 = 1024;
      int v40 = v31;
      __int16 v41 = 1024;
      int v42 = v25;
      __int16 v43 = 1024;
      int v44 = v32;
      __int16 v45 = 2048;
      double v46 = v33;
      __int16 v47 = 2048;
      double v48 = v34;
      _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "<Error> Arc control: bad params (%d %d %d %d %.2f %.2f)", buf, 0x2Eu);
      int thresholdModuleTemperature = v7->_thresholdModuleTemperature;
      int v25 = *p_thresholdVirtualTemperature;
    }
LABEL_23:
    v7->_originalThresholdModuleTemperature = thresholdModuleTemperature;
    v7->_originalThresholdVirtualTemperature = v25;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10003D1D0;
    v35[3] = &unk_100086168;
    v35[4] = v7;
    [+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", v22, v23) addObserverForName:AVAudioSessionMediaServicesWereResetNotification object:+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance") queue:+[NSOperationQueue mainQueue] usingBlock:v35];
    [+[TGraphSampler sharedInstance] addtGraphDataSource:v7];
  }
  return v7;
}

- (void)update
{
  arcQueue = self->_arcQueue;
  if (arcQueue)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003D320;
    block[3] = &unk_100085248;
    block[4] = self;
    dispatch_async((dispatch_queue_t)arcQueue, block);
  }
}

- (void)updateInternal
{
  product = self->_product;
  if (product)
  {
    self->_latestModuleTemperature = [(CommonProduct *)product arcModuleTemperature];
    int v4 = [(CommonProduct *)self->_product arcVirtualTemperature];
    self->_latestVirtualTemperature = v4;
    int thresholdVirtualTemperature = self->_thresholdVirtualTemperature;
    int mitigationsActive = self->_mitigationsActive;
    int thresholdModuleTemperature = self->_thresholdModuleTemperature;
    if (mitigationsActive == 100)
    {
      thresholdModuleTemperature -= self->_thresholdModuleTemperatureHysteresis;
      thresholdVirtualTemperature -= self->_thresholdVirtualTemperatureHysteresis;
    }
    BOOL v8 = self->_latestModuleTemperature <= thresholdModuleTemperature && v4 <= thresholdVirtualTemperature;
    uint64_t v9 = 44;
    if (v8)
    {
      uint64_t v9 = 48;
      int v10 = 0;
    }
    else
    {
      int v10 = 100;
    }
    if (v10 != mitigationsActive)
    {
      float v11 = *(float *)((char *)&self->super.isa + v9);
      if (byte_1000AA7A0)
      {
        uint64_t v12 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
        {
          int v23 = 134217984;
          double v24 = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "<Notice> Arc control: setting gain %.2f", (uint8_t *)&v23, 0xCu);
        }
      }
      uint64_t v13 = +[AVAudioSession sharedInstance];
      *(float *)&double v14 = v11;
      if ([(AVAudioSession *)v13 setHapticThermalGain:0 error:v14])
      {
        self->_int mitigationsActive = v10;
        [+[TGraphSampler sharedInstance] updatePowerlogMiscState:6 value:self->_mitigationsActive];
      }
      else
      {
        uint64_t v15 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
          sub_100059740(v15, v16, v17, v18, v19, v20, v21, v22);
        }
      }
    }
  }
}

- (void)overrideParam:(id)a3 value:(int)originalThresholdModuleTemperature
{
  v7 = qword_1000AABC0;
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412546;
    id v17 = a3;
    __int16 v18 = 1024;
    int v19 = originalThresholdModuleTemperature;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> Arc control: override (%@, %d)", (uint8_t *)&v16, 0x12u);
  }
  if ([a3 isEqualToString:@"ArcModuleThresholdKey"])
  {
    if (originalThresholdModuleTemperature == -1) {
      originalThresholdModuleTemperature = self->_originalThresholdModuleTemperature;
    }
    self->_int thresholdModuleTemperature = originalThresholdModuleTemperature;
  }
  else if ([a3 isEqualToString:@"ArcVirtualThresholdKey"])
  {
    if (originalThresholdModuleTemperature == -1) {
      originalThresholdModuleTemperature = self->_originalThresholdVirtualTemperature;
    }
    self->_int thresholdVirtualTemperature = originalThresholdModuleTemperature;
  }
  else
  {
    BOOL v8 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100059778(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
}

- (int)numberOfFields
{
  return 1;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  if (a3) {
    return 0;
  }
  else {
    return @"Arc-mitigating";
  }
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  if (a3) {
    return 0;
  }
  else {
    return (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%d", self->_mitigationsActive);
  }
}

@end