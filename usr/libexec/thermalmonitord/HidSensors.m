@interface HidSensors
+ (id)sharedInstance;
- (BOOL)isBatterySensor:(__CFString *)a3;
- (BOOL)isPowerSensor:(__CFString *)a3;
- (BOOL)isSending2DTempGridToDisplayDriverEnabled;
- (BOOL)isSensorDataValid;
- (BOOL)isTempSensorDataValid:(__CFString *)a3 value:(int)a4;
- (BOOL)isVirtualTempDispatchEnabled;
- (BOOL)readFailuresExpected:(__CFString *)a3;
- (BOOL)shouldRetrieveSensor:(__CFString *)a3;
- (BOOL)staleValueExpected:(__CFString *)a3;
- (HidSensors)init;
- (__CFArray)copySensorArray;
- (__CFArray)hidSensorKeys;
- (__CFArray)sensorFourCharCode;
- (__CFArray)synthSensorKeys;
- (__CFDictionary)getHIDSensorDict;
- (__CFString)getSensor4CCFromIndex:(int64_t)a3;
- (char)readHIDDebugDictionaryAndReturnErrorCode;
- (iir_filter_t)getFilterTable;
- (int)callbackSensorInterval:(__CFString *)a3;
- (int)getFilterTimeConstantForSensor:(int64_t)a3;
- (int)getPowerSensorIndex:(__CFString *)a3;
- (int)indexForTempSensorKey:(__CFString *)a3;
- (int)sendToService:(__CFString *)a3 value:(void *)a4;
- (int)temperatureForKey:(__CFString *)a3;
- (unint64_t)getWatchDogMask;
- (unsigned)getSensorIndexFrom4CC:(__CFString *)a3;
- (void)createHIDEventSystemObject;
- (void)dealloc;
- (void)enableDispatchVirtualTemp;
- (void)enableSending2DTempGridToDisplayDriver;
- (void)handleTemperatureEvent:(int)a3 service:(__IOHIDServiceClient *)a4;
- (void)initLocationStrings;
- (void)loadProductPowerParameters:(__CFArray *)a3;
- (void)loadProductTemperatureParameters:(__CFArray *)a3;
- (void)resetHIDSensorDictionary;
- (void)sendVirtualTemp:(int)a3 temperature:(int)a4;
- (void)setInfoOnlySensorsActive:(BOOL)a3;
@end

@implementation HidSensors

- (BOOL)staleValueExpected:(__CFString *)a3
{
  potentiallyStaleSensorDefaults = self->_potentiallyStaleSensorDefaults;
  if (potentiallyStaleSensorDefaults)
  {
    LODWORD(potentiallyStaleSensorDefaults) = CFDictionaryContainsKey(potentiallyStaleSensorDefaults, a3);
    if (potentiallyStaleSensorDefaults) {
      LOBYTE(potentiallyStaleSensorDefaults) = CFDictionaryGetValue(self->_potentiallyStaleSensorDefaults, a3) != 0;
    }
  }
  return (char)potentiallyStaleSensorDefaults;
}

- (__CFDictionary)getHIDSensorDict
{
  self->_isSensorDataValid = 1;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  if (!self->_tempSensors)
  {
    if (self->_hidEventSystem
      || ([(HidSensors *)self createHIDEventSystemObject], self->_hidEventSystem))
    {
      v30 = [(HidSensors *)self copySensorArray];
      self->_tempSensors = v30;
      if (v30)
      {
LABEL_69:
        CFIndex Count = CFArrayGetCount(v30);
        self->_count = Count;
        if (Count <= 0)
        {
          if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
            sub_100054898();
          }
          CFRelease(self->_tempSensors);
          result = 0;
          self->_tempSensors = 0;
          return result;
        }
        if (self->_callbackTemperaturesQueue)
        {
          self->_callbackTemperatures = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, &kCFTypeDictionaryValueCallBacks);
          IOHIDEventSystemClientRegisterEventCallback();
        }
        self->_sensorDict = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        self->_serviceToName = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, &kCFTypeDictionaryValueCallBacks);
        v32 = [+[HidSensors sharedInstance] hidSensorKeys];
        tempSensors = self->_tempSensors;
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472;
        v47[2] = sub_100012060;
        v47[3] = &unk_1000851B0;
        v47[4] = v3;
        v47[5] = v32;
        v47[6] = self;
        v34 = (__CFArray *)[(__CFArray *)tempSensors filteredArrayUsingPredicate:+[NSPredicate predicateWithBlock:v47]];
        CFRelease(self->_tempSensors);
        self->_tempSensors = v34;
        if (v34)
        {
          CFRetain(v34);
          CFIndex v35 = CFArrayGetCount(self->_tempSensors);
          self->_count = v35;
          if (v35 != CFArrayGetCount(self->hidSensorKeys) - self->_shadowSensorCount
            && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
          {
            sub_100054900();
          }
          goto LABEL_2;
        }
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
          sub_1000548CC();
        }
        return 0;
      }
    }
    else
    {
      v30 = self->_tempSensors;
      if (v30) {
        goto LABEL_69;
      }
    }
    v36 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "<Notice> Could not create HIDArray (will retry)", buf, 2u);
    }
    return 0;
  }
LABEL_2:
  if ([v3 count])
  {
    v4 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<Notice> List of sensors received: %@", buf, 0xCu);
    }
  }

  if (self->_count >= 1)
  {
    CFIndex v5 = 0;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(self->_tempSensors, v5);
      Value = (void *)CFDictionaryGetValue(self->_serviceToName, ValueAtIndex);
      if (!Value)
      {
        v12 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = ValueAtIndex;
          _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "<Error> Cannot find matching key for 0x%p", buf, 0xCu);
        }
        goto LABEL_40;
      }
      if (![+[HidSensors sharedInstance] shouldRetrieveSensor:Value])
      {
        *(_DWORD *)buf = -12700;
        CFNumberRef v13 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, buf);
        CFDictionarySetValue(self->_sensorDict, Value, v13);
        if (v13) {
          CFRelease(v13);
        }
        goto LABEL_40;
      }
      int v46 = 0;
      if (self->_callbackTemperaturesQueue)
      {
        callbackTemperatures = self->_callbackTemperatures;
        if (callbackTemperatures)
        {
          if (CFDictionaryContainsKey(callbackTemperatures, Value))
          {
            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x2020000000;
            LODWORD(v49) = 0;
            callbackTemperaturesQueue = self->_callbackTemperaturesQueue;
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1000123E4;
            block[3] = &unk_1000851D8;
            block[5] = buf;
            block[6] = Value;
            block[4] = self;
            dispatch_sync((dispatch_queue_t)callbackTemperaturesQueue, block);
            unsigned int v10 = [(HidSensors *)self isTempSensorDataValid:Value value:*(unsigned int *)(*(void *)&buf[8] + 24)];
            sensorDict = self->_sensorDict;
            if (v10)
            {
              sub_100005654(sensorDict, Value, kCFNumberSInt32Type, (void *)(*(void *)&buf[8] + 24));
            }
            else
            {
              CFDictionaryRemoveValue(sensorDict, Value);
              self->_isSensorDataValid = 0;
            }
            _Block_object_dispose(buf, 8);
            goto LABEL_35;
          }
        }
      }
      if (byte_1000AA7A2 && [(HidSensors *)self isBatterySensor:Value])
      {
        *(_DWORD *)buf = 3000;
        sub_100005654(self->_sensorDict, Value, kCFNumberSInt32Type, buf);
        goto LABEL_35;
      }
      uint64_t v14 = [+[SensorDispatcherHelper sharedInstance] getTemperatureFromSMCForKey:Value];
      int v46 = v14;
      if (v14 == -12800) {
        break;
      }
      if (v14 != -1)
      {
        unsigned int v19 = [(HidSensors *)self isTempSensorDataValid:Value value:v14];
        v20 = self->_sensorDict;
        if (v19)
        {
          sub_100005654(v20, Value, kCFNumberSInt32Type, &v46);
          goto LABEL_35;
        }
        CFDictionaryRemoveValue(v20, Value);
LABEL_34:
        self->_isSensorDataValid = 0;
        goto LABEL_35;
      }
      unsigned int v15 = [+[HidSensors sharedInstance] isPowerSensor:Value];
      v16 = (const void *)IOHIDServiceClientCopyEvent();
      if (v16)
      {
        double valuePtr = 0.0;
        IOHIDEventGetFloatValue();
        double valuePtr = v17;
        if (!v15)
        {
          unsigned int v43 = (int)(v17 * 100.0);
          uint64_t v42 = 0;
          if (sub_100008280(self->_potentiallyStaleSensorTimestamps, Value, kCFNumberLongType, &v42))
          {
            uint64_t TimeStamp = 0;
            uint64_t TimeStamp = IOHIDEventGetTimeStamp();
            if (TimeStamp == v42) {
              goto LABEL_48;
            }
            if (!v42)
            {
              mach_timebase_info info = 0;
              if (!mach_timebase_info(&info))
              {
                uint64_t denom = info.denom;
                unint64_t numer = info.numer;
                uint64_t v28 = mach_absolute_time();
                log = qword_1000AABC0;
                if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138413058;
                  *(void *)&buf[4] = Value;
                  *(_WORD *)&buf[12] = 2048;
                  *(void *)&buf[14] = v42;
                  *(_WORD *)&buf[22] = 2048;
                  uint64_t v49 = TimeStamp;
                  __int16 v50 = 2048;
                  uint64_t v51 = v28;
                  _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "<Notice> Sensor reset for %@, prior %lld, event %lld, now %lld", buf, 0x2Au);
                }
                if (TimeStamp + 60000000000 * denom / numer < v28) {
LABEL_48:
                }
                  sub_100008280(self->_potentiallyStaleSensorDefaults, Value, kCFNumberSInt32Type, &v43);
              }
            }
            if (TimeStamp != v42) {
              sub_100005654(self->_potentiallyStaleSensorTimestamps, Value, kCFNumberLongType, &TimeStamp);
            }
          }
          CFRelease(v16);
          if (![+[HidSensors sharedInstance] staleValueExpected:Value]&& ![(HidSensors *)self isTempSensorDataValid:Value value:v43])
          {
            goto LABEL_28;
          }
          sub_100005654(self->_sensorDict, Value, kCFNumberSInt32Type, &v43);
LABEL_35:
          tempOffsetDict = self->_tempOffsetDict;
          if (tempOffsetDict)
          {
            if (CFDictionaryContainsKey(tempOffsetDict, Value))
            {
              v22 = self->_sensorDict;
              if (v22)
              {
                if (CFDictionaryContainsKey(v22, Value))
                {
                  *(_DWORD *)buf = 0;
                  LODWORD(valuePtr) = 0;
                  CFNumberRef v23 = (const __CFNumber *)CFDictionaryGetValue(self->_sensorDict, Value);
                  CFNumberGetValue(v23, kCFNumberSInt32Type, buf);
                  CFNumberRef v24 = (const __CFNumber *)CFDictionaryGetValue(self->_tempOffsetDict, Value);
                  CFNumberGetValue(v24, kCFNumberSInt32Type, &valuePtr);
                  *(_DWORD *)buf += LODWORD(valuePtr);
                  sub_100005654(self->_sensorDict, Value, kCFNumberSInt32Type, buf);
                }
              }
            }
          }
          goto LABEL_40;
        }
        sub_100005654(self->_sensorDict, Value, kCFNumberDoubleType, &valuePtr);
        CFRelease(v16);
      }
      else
      {
        LODWORD(valuePtr) = 0;
        int v25 = sub_100008280(self->_potentiallyStaleSensorDefaults, Value, kCFNumberSInt32Type, &valuePtr);
        v26 = +[HidSensors sharedInstance];
        if (v25)
        {
          if (![(HidSensors *)v26 staleValueExpected:Value]
            && ![(HidSensors *)self isTempSensorDataValid:Value value:LODWORD(valuePtr)])
          {
            goto LABEL_28;
          }
          sub_100005654(self->_sensorDict, Value, kCFNumberSInt32Type, &valuePtr);
          goto LABEL_35;
        }
        if (![(HidSensors *)v26 readFailuresExpected:Value])
        {
          v27 = qword_1000AABC0;
          if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = Value;
            _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "<Error> Could not get event from service (%@)", buf, 0xCu);
          }
          goto LABEL_28;
        }
      }
LABEL_40:
      if (self->_count <= ++v5) {
        return self->_sensorDict;
      }
    }
    v18 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = Value;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "<Error> Could not get value from SMC (%@)", buf, 0xCu);
    }
LABEL_28:
    CFDictionaryRemoveValue(self->_sensorDict, Value);
    goto LABEL_34;
  }
  return self->_sensorDict;
}

- (BOOL)shouldRetrieveSensor:(__CFString *)a3
{
  infoOnlyHIDSensors = self->_infoOnlyHIDSensors;
  return !infoOnlyHIDSensors || !CFDictionaryContainsKey(infoOnlyHIDSensors, a3) || self->_infoOnlySensorsActive;
}

- (BOOL)isPowerSensor:(__CFString *)a3
{
  powerSensors = self->_powerSensors;
  return powerSensors && CFDictionaryContainsKey(powerSensors, a3);
}

+ (id)sharedInstance
{
  if (qword_1000A2688 != -1) {
    dispatch_once(&qword_1000A2688, &stru_100085140);
  }
  return (id)qword_1000A2690;
}

- (int)getFilterTimeConstantForSensor:(int64_t)a3
{
  if (a3 <= 63) {
    return self->filterParams[a3].time_constant;
  }
  CFIndex v5 = qword_1000AABC0;
  int result = os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR);
  if (result)
  {
    sub_1000547A4(a3, v5, v6, v7, v8, v9, v10, v11);
    return 0;
  }
  return result;
}

- (__CFArray)sensorFourCharCode
{
  return self->sensorFourCharCode;
}

- (BOOL)isSending2DTempGridToDisplayDriverEnabled
{
  return self->_send2DTempGrid;
}

- (__CFArray)hidSensorKeys
{
  return self->hidSensorKeys;
}

- (HidSensors)init
{
  v6.receiver = self;
  v6.super_class = (Class)HidSensors;
  v2 = [(HidSensors *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_infoOnlySensorsActive = 0;
    v2->sensorWatchdogMask = 0;
    v2->hidSensorKeys = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    v3->sensorFourCharCode = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    v3->synthSensorKeys = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v3->_tempOffsetDict = 0;
    v3->_dispatchVirtualTemp = 0;
    v3->_shadowSensorCFIndex Count = 0;
    v3->_infoOnlyHIDSensors = 0;
    v3->_callbackSensorIntervals = 0;
    v3->_potentiallyStaleSensorDefaults = 0;
    v3->_callbackTemperaturesQueue = 0;
    v3->_potentiallyStaleSensorTimestamps = Mutable;
  }
  return v3;
}

- (void)dealloc
{
  potentiallyStaleSensorDefaults = self->_potentiallyStaleSensorDefaults;
  if (potentiallyStaleSensorDefaults) {
    CFRelease(potentiallyStaleSensorDefaults);
  }
  potentiallyStaleSensorTimestamps = self->_potentiallyStaleSensorTimestamps;
  if (potentiallyStaleSensorTimestamps) {
    CFRelease(potentiallyStaleSensorTimestamps);
  }
  infoOnlyHIDSensors = self->_infoOnlyHIDSensors;
  if (infoOnlyHIDSensors) {
    CFRelease(infoOnlyHIDSensors);
  }
  tempOffsetDict = self->_tempOffsetDict;
  if (tempOffsetDict) {
    CFRelease(tempOffsetDict);
  }
  synthSensorKeys = self->synthSensorKeys;
  if (synthSensorKeys) {
    CFRelease(synthSensorKeys);
  }
  sensorFourCharCode = self->sensorFourCharCode;
  if (sensorFourCharCode) {
    CFRelease(sensorFourCharCode);
  }
  hidSensorKeys = self->hidSensorKeys;
  if (hidSensorKeys) {
    CFRelease(hidSensorKeys);
  }
  v10.receiver = self;
  v10.super_class = (Class)HidSensors;
  [(HidSensors *)&v10 dealloc];
}

- (iir_filter_t)getFilterTable
{
  return self->filterParams;
}

- (unsigned)getSensorIndexFrom4CC:(__CFString *)a3
{
  sensorFourCharCode = self->sensorFourCharCode;
  if (sensorFourCharCode)
  {
    CFIndex Count = CFArrayGetCount(sensorFourCharCode);
    if (Count >= 1)
    {
      CFIndex v7 = Count;
      for (CFIndex i = 0; i != v7; ++i)
      {
        CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(self->sensorFourCharCode, i);
        if (ValueAtIndex && (CFStringRef v10 = ValueAtIndex, v11 = CFGetTypeID(ValueAtIndex), v11 == CFStringGetTypeID()))
        {
          if (CFEqual(a3, v10)) {
            return i;
          }
        }
        else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
        {
          sub_10005430C(&v13, v14);
        }
      }
    }
  }
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
    sub_1000542D8();
  }
  LODWORD(i) = -1;
  return i;
}

- (__CFString)getSensor4CCFromIndex:(int64_t)a3
{
  if (a3 < 0) {
    return 0;
  }
  sensorFourCharCode = self->sensorFourCharCode;
  if (!sensorFourCharCode) {
    return 0;
  }
  else {
    return (__CFString *)CFArrayGetValueAtIndex(sensorFourCharCode, a3);
  }
}

- (unint64_t)getWatchDogMask
{
  return self->sensorWatchdogMask;
}

- (void)loadProductTemperatureParameters:(__CFArray *)a3
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  objc_super v6 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFIndex v7 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFMutableDictionaryRef v8 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFMutableDictionaryRef v9 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable) {
    BOOL v10 = v6 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10 || v7 == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_10005433C();
    }
  }
  else
  {
    theDict = v8;
    int v25 = v9;
    if (CFArrayGetCount(a3) >= 1)
    {
      CFIndex v12 = 0;
      p_last = &self->filterParams[0].last;
      do
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a3, v12);
        if (ValueAtIndex && (CFDictionaryRef v15 = ValueAtIndex, v16 = CFGetTypeID(ValueAtIndex), v16 == CFDictionaryGetTypeID()))
        {
          v39 = 0;
          if (sub_100037E04(v15, @"4CharCode", &v39))
          {
            CFArrayAppendValue(self->sensorFourCharCode, v39);
          }
          else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
          {
            sub_100054434(&v37, v38);
          }
          if ((sub_100037E04(v15, @"matchName", &v39) & 1) == 0
            && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
          {
            sub_100054404(&v35, v36);
          }
          int v34 = 0;
          if ((sub_100008280(v15, @"filterParams", kCFNumberSInt32Type, &v34) & 1) == 0
            && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
          {
            sub_1000543D4(&v32, v33);
          }
          int v17 = sub_100037D70(v15, @"filterParams_INTMIN");
          *(p_last - 1) = v34;
          int *p_last = v17 << 31;
          if (sub_100037D8C(v15, @"requiresWatchDog", 1)) {
            self->sensorWatchdogMask |= 1 << v12;
          }
          BOOL v18 = sub_100037D70(v15, @"synthSensor");
          uint64_t v19 = 72;
          if (!v18) {
            uint64_t v19 = 56;
          }
          CFArrayAppendValue(*(CFMutableArrayRef *)((char *)&self->super.isa + v19), v39);
          if (sub_100037D70(v15, @"shadowSensor")) {
            ++self->_shadowSensorCount;
          }
          if (sub_100037D8C(v15, @"infoOnly", 0)) {
            CFDictionarySetValue(Mutable, v39, kCFBooleanTrue);
          }
          if (sub_100037D8C(v15, @"readFailuresExpected", 0)) {
            CFDictionarySetValue(theDict, v39, kCFBooleanTrue);
          }
          int valuePtr = 0;
          sub_100008280(v15, @"callbackInterval", kCFNumberSInt32Type, &valuePtr);
          if (valuePtr >= 1) {
            sub_100005654(v6, v39, kCFNumberSInt32Type, &valuePtr);
          }
          int v30 = 0;
          if (sub_100008280(v15, @"staleDefault", kCFNumberSInt32Type, &v30))
          {
            sub_100005654(v7, v39, kCFNumberSInt32Type, &v30);
            *(void *)buf = 0;
            sub_100005654(self->_potentiallyStaleSensorTimestamps, v39, kCFNumberLongType, buf);
          }
          int v29 = 0;
          if (sub_100008280(v15, @"temperatureOffset", kCFNumberSInt32Type, &v29)) {
            sub_100005654(v25, v39, kCFNumberSInt32Type, &v29);
          }
          if (byte_1000AB0E0 && sub_100037E04(v15, @"smcExchangeGroupKey", &v39))
          {
            if (byte_1000AA7A0)
            {
              v20 = qword_1000AABC0;
              if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)&buf[4] = v12;
                __int16 v41 = 2112;
                uint64_t v42 = v39;
                _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "<Notice> Sensor # %d is specified for SMC sensor group %@", buf, 0x12u);
              }
            }
            unsigned int v28 = -1;
            if (sub_100008280(v15, @"smcExchangeIndex", kCFNumberSInt32Type, &v28))
            {
              if ((v28 & 0x80000000) == 0)
              {
                v21 = +[SensorExchangeHelper sharedInstance];
                [(SensorExchangeHelper *)v21 registerCLTMSensorIndex:v12 forSMCKey:v39 atSMCIndex:v28];
              }
            }
            else
            {
              v22 = qword_1000AABC0;
              if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)&buf[4] = v12;
                _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "<Error> Couldn't find expected smcExchangeIndex value for sensor %d", buf, 8u);
              }
            }
          }
        }
        else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
        {
          sub_1000543A4(&v26, v27);
        }
        ++v12;
        p_last += 2;
      }
      while (CFArrayGetCount(a3) > v12);
    }
    if (CFDictionaryGetCount(Mutable) >= 1)
    {
      self->_infoOnlyHIDSensors = CFDictionaryCreateCopy(kCFAllocatorDefault, Mutable);
      CFDictionaryRemoveAllValues(Mutable);
    }
    CFRelease(Mutable);
    if (theDict)
    {
      if (CFDictionaryGetCount(theDict) >= 1)
      {
        self->_readFailuresExpected = CFDictionaryCreateCopy(kCFAllocatorDefault, theDict);
        CFDictionaryRemoveAllValues(theDict);
      }
      CFRelease(theDict);
    }
    if (CFDictionaryGetCount(v6) >= 1)
    {
      self->_callbackSensorIntervals = CFDictionaryCreateCopy(kCFAllocatorDefault, v6);
      CFDictionaryRemoveAllValues(v6);
      CFNumberRef v23 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.thermalmonitor.hidsensors", 0);
      self->_callbackTemperaturesQueue = v23;
      if (!v23 && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_100054370();
      }
    }
    CFRelease(v6);
    if (CFDictionaryGetCount(v7) >= 1)
    {
      self->_potentiallyStaleSensorDefaults = CFDictionaryCreateCopy(kCFAllocatorDefault, v7);
      CFDictionaryRemoveAllValues(v7);
    }
    CFRelease(v7);
    if (v25)
    {
      if (CFDictionaryGetCount(v25) >= 1)
      {
        self->_tempOffsetDict = CFDictionaryCreateCopy(kCFAllocatorDefault, v25);
        CFDictionaryRemoveAllValues(v25);
      }
      CFRelease(v25);
    }
  }
}

- (void)loadProductPowerParameters:(__CFArray *)a3
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    objc_super v6 = Mutable;
    LODWORD(idx) = 0;
    if (CFArrayGetCount(a3) >= 1)
    {
      do
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a3, (int)idx);
        if (ValueAtIndex)
        {
          CFDictionaryRef v8 = ValueAtIndex;
          CFTypeID v9 = CFGetTypeID(ValueAtIndex);
          if (v9 == CFDictionaryGetTypeID())
          {
            value = 0;
            if (sub_100037E04(v8, @"4CharCode", &value))
            {
              CFArrayAppendValue(self->sensorFourCharCode, value);
            }
            else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
            {
              sub_100054434(&v15, v16);
            }
            if ((sub_100037E04(v8, @"matchName", &value) & 1) == 0
              && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
            {
              sub_100054404(&v13, v14);
            }
            CFArrayAppendValue(self->hidSensorKeys, value);
            CFNumberRef v10 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &idx);
            if (v10)
            {
              CFNumberRef v11 = v10;
              CFDictionarySetValue(v6, value, v10);
              CFRelease(v11);
            }
          }
        }
        CFIndex v12 = (int)idx + 1;
        LODWORD(idx) = idx + 1;
      }
      while (CFArrayGetCount(a3) > v12);
    }
    if (CFDictionaryGetCount(v6) > 0)
    {
      self->_powerSensors = CFDictionaryCreateCopy(kCFAllocatorDefault, v6);
      CFDictionaryRemoveAllValues(v6);
    }
    CFRelease(v6);
  }
  else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
  {
    sub_100054464();
  }
}

- (void)enableDispatchVirtualTemp
{
  self->_dispatchVirtualTemp = 1;
}

- (BOOL)isVirtualTempDispatchEnabled
{
  return self->_dispatchVirtualTemp;
}

- (void)enableSending2DTempGridToDisplayDriver
{
  self->_send2DTempGrid = 1;
}

- (void)resetHIDSensorDictionary
{
  id v3 = qword_1000AABC0;
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CFDictionaryRef v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "<Notice> resetting HID sensor dictionary", v8, 2u);
  }
  tempSensors = self->_tempSensors;
  if (tempSensors) {
    CFRelease(tempSensors);
  }
  sensorDict = self->_sensorDict;
  if (sensorDict) {
    CFRelease(sensorDict);
  }
  serviceToName = self->_serviceToName;
  if (serviceToName) {
    CFRelease(serviceToName);
  }
  callbackTemperatures = self->_callbackTemperatures;
  if (callbackTemperatures) {
    CFRelease(callbackTemperatures);
  }
  self->_tempSensors = 0;
  self->_callbackTemperatures = 0;
  self->_sensorDict = 0;
  self->_serviceToName = 0;
}

- (int)sendToService:(__CFString *)a3 value:(void *)a4
{
  if (qword_1000A2698 == -1)
  {
    if (!a3) {
      return 5;
    }
  }
  else
  {
    dispatch_once(&qword_1000A2698, &stru_100085160);
    if (!a3) {
      return 5;
    }
  }
  io_registry_entry_t v6 = dword_1000A26A0;
  if (!dword_1000A26A0) {
    return 5;
  }

  return IORegistryEntrySetCFProperty(v6, a3, a4);
}

- (void)sendVirtualTemp:(int)a3 temperature:(int)a4
{
  if ([+[HidSensors sharedInstance] isVirtualTempDispatchEnabled])
  {
    CFIndex v7 = [+[HidSensors sharedInstance] getSensor4CCFromIndex:a3];
    double v8 = (float)a4 / 100.0;
    if (v8 >= 0.0) {
      double v9 = v8 * 65536.0 + 0.5;
    }
    else {
      double v9 = v8 * 65536.0 + -0.5;
    }
    int valuePtr = (int)v9;
    CFNumberRef v10 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
    if (v10)
    {
      CFNumberRef v11 = v10;
      mach_error_t v12 = [(HidSensors *)self sendToService:v7 value:v10];
      CFRelease(v11);
      if (!v12) {
        return;
      }
    }
    else
    {
      mach_error_t v12 = 5;
    }
    char v13 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100054510(v12, v13);
    }
  }
}

- (void)initLocationStrings
{
  if ([+[HidSensors sharedInstance] isVirtualTempDispatchEnabled])
  {
    CFIndex Count = CFArrayGetCount([+[HidSensors sharedInstance] hidSensorKeys]);
    CFIndex v4 = CFArrayGetCount([+[HidSensors sharedInstance] synthSensorKeys]);
    if (v4 >= 1)
    {
      CFIndex v5 = 0;
      CFIndex v6 = v4 + Count;
      do
      {
        [(HidSensors *)self sendToService:[+[HidSensors sharedInstance]];
        ++v5;
      }
      while (Count + v5 < v6);
    }
  }
}

- (BOOL)readFailuresExpected:(__CFString *)a3
{
  readFailuresExpected = self->_readFailuresExpected;
  if (readFailuresExpected)
  {
    LODWORD(readFailuresExpected) = CFDictionaryContainsKey(readFailuresExpected, a3);
    if (readFailuresExpected) {
      LOBYTE(readFailuresExpected) = CFDictionaryGetValue(self->_readFailuresExpected, a3) != 0;
    }
  }
  return (char)readFailuresExpected;
}

- (BOOL)isBatterySensor:(__CFString *)a3
{
  return CFEqual(a3, @"gas gauge battery")
      || CFEqual(a3, @"TG0B")
      || CFEqual(a3, @"TG0V");
}

- (int)getPowerSensorIndex:(__CFString *)a3
{
  int v9 = 0;
  powerSensors = self->_powerSensors;
  if (!powerSensors || !CFDictionaryContainsKey(powerSensors, a3)) {
    return 0;
  }
  sub_100008280(self->_powerSensors, a3, kCFNumberIntType, &v9);
  int v6 = v9;
  if (v9 >= 11)
  {
    CFIndex v7 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CFNumberRef v11 = a3;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "<Error> Could not get the index for power sensor %@", buf, 0xCu);
      return v9;
    }
  }
  return v6;
}

- (void)setInfoOnlySensorsActive:(BOOL)a3
{
  self->_infoOnlySensorsActive = a3;
}

- (int)callbackSensorInterval:(__CFString *)a3
{
  callbackSensorIntervals = self->_callbackSensorIntervals;
  if (callbackSensorIntervals)
  {
    int v5 = 0;
    sub_100008280(callbackSensorIntervals, a3, kCFNumberIntType, &v5);
    LODWORD(callbackSensorIntervals) = 1000000 * v5;
  }
  return (int)callbackSensorIntervals;
}

- (int)indexForTempSensorKey:(__CFString *)a3
{
  tempSensors = self->_tempSensors;
  if (tempSensors)
  {
    int Count = CFArrayGetCount(tempSensors);
    if (Count >= 1)
    {
      CFIndex v7 = 0;
      uint64_t v8 = Count;
      do
      {
        CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(self->_tempSensors, v7);
        if (ValueAtIndex)
        {
          CFStringRef Value = (const __CFString *)CFDictionaryGetValue(self->_serviceToName, ValueAtIndex);
          if (Value)
          {
            if (CFEqual(Value, a3)) {
              return v7;
            }
          }
          else
          {
            mach_error_t v12 = qword_1000AABC0;
            if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
              sub_1000545EC(buf, &v17, v12);
            }
          }
        }
        else
        {
          CFNumberRef v11 = qword_1000AABC0;
          if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
            sub_10005459C(v14, &v15, v11);
          }
        }
        ++v7;
      }
      while (v8 != v7);
    }
  }
  LODWORD(v7) = -1;
  return v7;
}

- (int)temperatureForKey:(__CFString *)a3
{
  if (!self->_tempSensors) {
    return -32768;
  }
  unsigned int v4 = [(HidSensors *)self indexForTempSensorKey:a3];
  if ((v4 & 0x80000000) != 0)
  {
    int v9 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_10005472C(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    return -32768;
  }
  if (!CFArrayGetValueAtIndex(self->_tempSensors, v4))
  {
    uint64_t v17 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_10005463C(v17, v18, v19, v20, v21, v22, v23, v24);
    }
    return -32768;
  }
  uint64_t v5 = IOHIDServiceClientCopyEvent();
  if (!v5)
  {
    int v25 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_1000546B4(v25, v26, v27, v28, v29, v30, v31, v32);
    }
    return -32768;
  }
  int v6 = (const void *)v5;
  IOHIDEventGetFloatValue();
  int v8 = (int)(v7 * 100.0);
  CFRelease(v6);
  return v8;
}

- (BOOL)isTempSensorDataValid:(__CFString *)a3 value:(int)a4
{
  unsigned int v4 = a4 + 3999;
  if ((a4 + 3999) >= 0x4A37)
  {
    double v7 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100054810((uint64_t)a3, a4, v7);
    }
  }
  return v4 < 0x4A37;
}

- (void)createHIDEventSystemObject
{
  if (!self->_hidEventSystem)
  {
    id v3 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate();
    self->_hidEventSystem = v3;
    if (v3)
    {
      CFMutableDictionaryRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
      CFDictionaryRef v5 = sub_100039788(65280, 5);
      if (v5)
      {
        CFDictionaryRef v6 = v5;
        CFArrayAppendValue(Mutable, v5);
        CFRelease(v6);
      }
      CFDictionaryRef v7 = sub_100039788(65288, 1);
      if (v7)
      {
        CFDictionaryRef v8 = v7;
        CFArrayAppendValue(Mutable, v7);
        CFRelease(v8);
      }
      CFDictionaryRef v9 = sub_100039788(32, 49);
      if (v9)
      {
        CFDictionaryRef v10 = v9;
        CFArrayAppendValue(Mutable, v9);
        CFRelease(v10);
      }
      if (Mutable)
      {
        IOHIDEventSystemClientSetMatchingMultiple();
        CFRelease(Mutable);
        IOHIDEventSystemClientScheduleWithRunLoop();
      }
      else
      {
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
          sub_100054968();
        }
        CFRelease(self->_hidEventSystem);
        self->_hidEventSystem = 0;
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
    {
      sub_100054934();
    }
  }
}

- (__CFArray)copySensorArray
{
  CFArrayRef v3 = IOHIDEventSystemClientCopyServices(self->_hidEventSystem);
  CFArrayRef v4 = v3;
  if (!v3 || (CFTypeID v5 = CFGetTypeID(v3), v5 != CFArrayGetTypeID()) || CFArrayGetCount(v4) <= 0)
  {
    if (self->_hidEventSystem)
    {
      IOHIDEventSystemClientUnscheduleWithRunLoop();
      CFRelease(self->_hidEventSystem);
      self->_hidEventSystem = 0;
    }
    uint64_t v14 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
    {
      sub_10005499C(v14);
      if (!v4) {
        return 0;
      }
    }
    else if (!v4)
    {
      return 0;
    }
    CFArrayRef v13 = v4;
LABEL_25:
    CFRelease(v13);
    return 0;
  }
  CFMutableDictionaryRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (CFArrayGetCount(v4) >= 1)
  {
    CFIndex v7 = 0;
    do
    {
      CFDictionaryRef ValueAtIndex = (__IOHIDServiceClient *)CFArrayGetValueAtIndex(v4, v7);
      unsigned int v9 = sub_10003985C(ValueAtIndex, @"PrimaryUsage");
      int v10 = sub_10003985C(ValueAtIndex, @"PrimaryUsagePage");
      BOOL v12 = v10 == 32 || v10 == 65288 || v10 == 65280;
      if (v12 && v9 <= 0x31 && ((1 << v9) & 0x2000000000022) != 0) {
        CFArrayAppendValue(Mutable, ValueAtIndex);
      }
      ++v7;
    }
    while (CFArrayGetCount(v4) > v7);
  }
  CFRelease(v4);
  if (!CFArrayGetCount(Mutable))
  {
    CFArrayRef v13 = Mutable;
    goto LABEL_25;
  }
  return Mutable;
}

- (void)handleTemperatureEvent:(int)a3 service:(__IOHIDServiceClient *)a4
{
  callbackTemperaturesQueue = self->_callbackTemperaturesQueue;
  if (callbackTemperaturesQueue)
  {
    if (self->_serviceToName)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001281C;
      block[3] = &unk_100085200;
      block[4] = self;
      block[5] = a4;
      int v7 = a3;
      dispatch_async((dispatch_queue_t)callbackTemperaturesQueue, block);
    }
  }
}

- (char)readHIDDebugDictionaryAndReturnErrorCode
{
  v2 = (char *)malloc_type_malloc(0x32uLL, 0xAE0F5642uLL);
  char *v2 = 0;
  uint64_t valuePtr = 0;
  CFStringRef theString1 = 0;
  CFArrayRef v3 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate();
  IOHIDEventSystemClientSetMatching();
  CFArrayRef v4 = IOHIDEventSystemClientCopyServices(v3);
  if (v4)
  {
    CFArrayRef v5 = v4;
    if (CFArrayGetCount(v4))
    {
      CFDictionaryRef ValueAtIndex = (__IOHIDServiceClient *)CFArrayGetValueAtIndex(v5, 0);
      CFDictionaryRef v7 = (const __CFDictionary *)IOHIDServiceClientCopyProperty(ValueAtIndex, @"ServicePluginDebug");
      if (v7)
      {
        CFDictionaryRef v8 = v7;
        CFTypeID v9 = CFGetTypeID(v7);
        if (v9 == CFDictionaryGetTypeID()
          && sub_100037E04(v8, @"PluginName", &theString1)
          && CFEqual(theString1, @"AppleHDQGasGaugeHID"))
        {
          uint64_t v22 = 0;
          uint64_t v23 = 0;
          __tp.tv_sec = 0;
          __tp.tv_nsec = 0;
          uint64_t v11 = 0;
          if (!clock_gettime(_CLOCK_UPTIME_RAW_APPROX, &__tp)) {
            uint64_t v11 = __tp.tv_nsec / 1000 + 1000000 * __tp.tv_sec;
          }
          BOOL v12 = qword_1000AABC0;
          if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            CFDictionaryRef v28 = v8;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "<Notice> %@HID Debug Dict", buf, 0xCu);
          }
          CFStringRef Value = CFDictionaryGetValue(v8, @"ErrorHistory");
          if (sub_100008280(v8, @"LastCalledTs", kCFNumberCFIndexType, &v23)
            && sub_100008280(v8, @"LastSuccessTs", kCFNumberCFIndexType, &v22)
            && ((BOOL v14 = (unint64_t)(v11 - v22) > 0x98967FF, (unint64_t)(v11 - v23) <= 0x98967FF)
              ? (int v15 = (unint64_t)(v11 - v22) > 0x98967FF)
              : (int v15 = v14 | 2),
                v15))
          {
            __sprintf_chk(v25, 0, 2uLL, "%d", v15);
            sub_100039540(v2, "EC: ", 0x32uLL);
            sub_100039540(v2, v25, 0x32uLL);
          }
          else
          {
            BOOL v14 = 0;
          }
          if (Value)
          {
            CFTypeID v16 = CFGetTypeID(Value);
            CFTypeID TypeID = CFArrayGetTypeID();
            if (v14 && v16 == TypeID)
            {
              sub_100039540(v2, " EH: ", 0x32uLL);
              CFIndex Count = CFArrayGetCount((CFArrayRef)Value);
              CFNumberRef v19 = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)Value, Count - 1);
              CFNumberGetValue(v19, kCFNumberIntType, &valuePtr);
              __sprintf_chk((char *)buf, 0, 0x32uLL, "%u", valuePtr);
              sub_100039540(v2, (const char *)buf, 0x32uLL);
              if (Count >= 2)
              {
                CFNumberRef v20 = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)Value, Count - 2);
                CFNumberGetValue(v20, kCFNumberIntType, (char *)&valuePtr + 4);
                __sprintf_chk((char *)buf, 0, 0x32uLL, "%u", HIDWORD(valuePtr));
                sub_100039540(v2, " ", 0x32uLL);
                sub_100039540(v2, (const char *)buf, 0x32uLL);
              }
            }
          }
        }
        CFRelease(v8);
      }
    }
    CFRelease(v5);
  }
  if (v3) {
    CFRelease(v3);
  }
  return v2;
}

- (BOOL)isSensorDataValid
{
  return self->_isSensorDataValid;
}

- (__CFArray)synthSensorKeys
{
  return self->synthSensorKeys;
}

@end