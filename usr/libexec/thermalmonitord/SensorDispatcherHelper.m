@interface SensorDispatcherHelper
+ (id)sharedInstance;
- (SensorDispatcherHelper)init;
- (float)getFloatValueFromSMCForKey:(__CFString *)a3;
- (int)getTemperatureFromSMCForKey:(__CFString *)a3;
- (int)getValueFromSMCForKey:(__CFString *)a3;
- (int)writeKeysToSensorDispatcher:(smcKeyWrites *)a3;
- (void)readKeysFromSensorDispatcher;
@end

@implementation SensorDispatcherHelper

+ (id)sharedInstance
{
  if (qword_1000AA760 != -1) {
    dispatch_once(&qword_1000AA760, &stru_100086368);
  }
  return (id)qword_1000AA768;
}

- (int)getValueFromSMCForKey:(__CFString *)a3
{
  int v8 = 0;
  if (byte_1000AA7A0)
  {
    v5 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      CStringPtr = CFStringGetCStringPtr(a3, 0x8000100u);
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> Looking for SMC Key %s", buf, 0xCu);
    }
  }
  if (!sub_100008280(self->_smcSensorDict, a3, kCFNumberSInt32Type, &v8)) {
    return -1;
  }
  uint64_t v6 = 0;
  int result = -1;
  do
  {
    if (v8 == self->_sensor4CC.sensor4CC[v6]) {
      int result = self->_sensorData.sensorTemperature[v6];
    }
    ++v6;
  }
  while (v6 != 15);
  return result;
}

- (void)readKeysFromSensorDispatcher
{
  size_t outputStructCnt = 60;
  mach_port_t connect = self->connect;
  if (connect
    && IOConnectCallStructMethod(connect, 2u, 0, 0, &self->_sensorData, &outputStructCnt)
    && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
  {
    sub_10005C8DC();
  }
}

- (int)getTemperatureFromSMCForKey:(__CFString *)a3
{
  int result = [(SensorDispatcherHelper *)self getValueFromSMCForKey:a3];
  if (result != -1)
  {
    if (result == -12700) {
      return -12800;
    }
    else {
      return (int)((double)result / 65535.0 * 100.0);
    }
  }
  return result;
}

- (SensorDispatcherHelper)init
{
  v15.receiver = self;
  v15.super_class = (Class)SensorDispatcherHelper;
  v2 = [(SensorDispatcherHelper *)&v15 init];
  if (v2)
  {
    CFDictionaryRef v3 = IOServiceMatching("AppleSMCSensorDispatcher");
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v3);
    uint32_t outputCnt = 1;
    size_t outputStructCnt = 60;
    if (MatchingService)
    {
      if (IOServiceOpen(MatchingService, mach_task_self_, 0, &v2->connect))
      {
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
          sub_10005C8A8();
        }
      }
      else
      {
        if (IOConnectCallScalarMethod(v2->connect, 0, 0, 0, &v2->sensorCount, &outputCnt)
          && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
        {
          sub_10005C874();
        }
        p_sensor4CC = &v2->_sensor4CC;
        if (IOConnectCallStructMethod(v2->connect, 1u, 0, 0, &v2->_sensor4CC, &outputStructCnt)
          && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
        {
          sub_10005C840();
        }
        v2->_smcSensorDict = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        if (v2->sensorCount)
        {
          unint64_t v7 = 0;
          int v8 = (int *)&v2->_sensor4CC;
          do
          {
            int v9 = *v8++;
            CFStringRef v10 = sub_100037F5C(v9);
            sub_100005654(v2->_smcSensorDict, v10, kCFNumberSInt32Type, p_sensor4CC);
            ++v7;
            p_sensor4CC = (sensorTemperature4CC *)v8;
          }
          while (v7 < v2->sensorCount);
        }
      }
    }
    else
    {
      v5 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> AppleSMCSensorDispatcher not enabled on this device", v12, 2u);
      }
    }
  }
  return v2;
}

- (int)writeKeysToSensorDispatcher:(smcKeyWrites *)a3
{
  kern_return_t v4;
  NSObject *v5;

  mach_port_t connect = self->connect;
  if (!connect) {
    return -536870212;
  }
  v4 = IOConnectCallStructMethod(connect, 3u, a3, 0x58uLL, 0, 0);
  if (v4)
  {
    v5 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_10005C910(v4, v5);
    }
  }
  return v4;
}

- (float)getFloatValueFromSMCForKey:(__CFString *)a3
{
  int v7 = 0;
  int v4 = sub_100008280(self->_smcSensorDict, a3, kCFNumberSInt32Type, &v7);
  float result = -1.0;
  if (v4)
  {
    for (uint64_t i = 0; i != 15; ++i)
    {
      if (v7 == self->_sensor4CC.sensor4CC[i]) {
        float result = *(float *)&self->_sensorData.sensorTemperature[i];
      }
    }
  }
  return result;
}

@end