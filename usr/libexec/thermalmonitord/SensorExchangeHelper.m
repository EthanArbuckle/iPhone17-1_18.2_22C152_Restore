@interface SensorExchangeHelper
+ (id)sharedInstance;
- (SensorExchangeHelper)init;
- (smcExchangeSensorGroupInfo)getSensorGroupForSMCKeyString:(__CFString *)a3;
- (void)registerCLTMSensorIndex:(int)a3 forSMCKey:(__CFString *)a4 atSMCIndex:(int)a5;
- (void)sendSensorExchangeDataToSMC;
- (void)updateAllSensorExchangeData;
- (void)writeSMCExchangeDataForGroup:(smcExchangeSensorGroupInfo *)a3 withData:(void *)a4;
@end

@implementation SensorExchangeHelper

- (void)sendSensorExchangeDataToSMC
{
  kern_return_t v9;
  mach_port_t smcPort;
  NSObject *v11;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  p_lock = &self->lock;
  pthread_mutex_lock(&self->lock);
  if (byte_1000AA7A0)
  {
    v4 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<Notice> In sendSensorExchangeDataToSMC function", buf, 2u);
    }
  }
  if (self->cameraSensors.SensorExchangeUpdateNeeded
    || self->aopSensors.SensorExchangeUpdateNeeded
    || self->basebandSensors.SensorExchangeUpdateNeeded
    || self->displaySensors.SensorExchangeUpdateNeeded
    || self->miscSensors.SensorExchangeUpdateNeeded
    || self->misc2Sensors.SensorExchangeUpdateNeeded
    || self->strapSensors.SensorExchangeUpdateNeeded)
  {
    p_smcPort = &self->smcPort;
    CFDictionaryRef v6 = IOServiceMatching("AppleSMC");
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v6);
    if (MatchingService)
    {
      io_object_t v8 = MatchingService;
      v9 = IOServiceOpen(MatchingService, mach_task_self_, 0, &self->smcPort);
      IOObjectRelease(v8);
      if (!v9)
      {
        if (*p_smcPort)
        {
          v9 = IOConnectCallScalarMethod(*p_smcPort, 0, 0, 0, 0, 0);
          if (!v9)
          {
            if (*p_smcPort)
            {
              [(SensorExchangeHelper *)self writeSMCExchangeDataForGroup:&self->cameraSensors withData:&self->cameraSensors.data];
              [(SensorExchangeHelper *)self writeSMCExchangeDataForGroup:&self->aopSensors withData:&self->aopSensors.data];
              [(SensorExchangeHelper *)self writeSMCExchangeDataForGroup:&self->basebandSensors withData:&self->basebandSensors.data];
              [(SensorExchangeHelper *)self writeSMCExchangeDataForGroup:&self->displaySensors withData:&self->displaySensors.data];
              [(SensorExchangeHelper *)self writeSMCExchangeDataForGroup:&self->miscSensors withData:&self->miscSensors.data];
              [(SensorExchangeHelper *)self writeSMCExchangeDataForGroup:&self->misc2Sensors withData:&self->misc2Sensors.data];
              [(SensorExchangeHelper *)self writeSMCExchangeDataForGroup:&self->strapSensors withData:&self->strapSensors.data];
              smcPort = self->smcPort;
              if (smcPort && !IOConnectCallScalarMethod(smcPort, 1u, 0, 0, 0, 0)) {
                IOServiceClose(*p_smcPort);
              }
              goto LABEL_23;
            }
            v9 = 0;
            goto LABEL_21;
          }
        }
        else
        {
          v9 = 0;
        }
      }
    }
    else
    {
      v9 = -536870160;
    }
    unsigned int *p_smcPort = 0;
LABEL_21:
    v11 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_1000573A0(v9, v11);
    }
    goto LABEL_23;
  }
  if (byte_1000AA7A0)
  {
    v12 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "<Notice> No sensor groups require updates", v13, 2u);
    }
  }
LABEL_23:
  pthread_mutex_unlock(p_lock);
}

- (void)writeSMCExchangeDataForGroup:(smcExchangeSensorGroupInfo *)a3 withData:(void *)a4
{
  kern_return_t v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  size_t v17;
  unsigned char v18[5];
  uint8_t v19[4];
  unsigned char *v20;
  __int16 v21;
  kern_return_t v22;
  __int16 v23;
  int v24;
  _OWORD outputStruct[2];
  long long v26;
  long long v27;
  long long v28;
  long long v29;
  long long v30;
  long long v31;
  long long v32;
  long long v33;
  uint64_t v34;
  uint8_t buf[4];
  long long v36;
  long long v37;
  unsigned char v38[128];
  int v39;

  mach_port_t smcPort = self->smcPort;
  if (smcPort)
  {
    if (a3->SensorExchangeUpdateNeeded)
    {
      if (byte_1000AA7A0)
      {
        io_object_t v8 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
        {
          sensorExchangeKeyStr = a3->sensorExchangeKeyStr;
          *(_DWORD *)buf = 138412290;
          *(void *)&v36 = sensorExchangeKeyStr;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<Notice> Writing sensor data to SMC key %@", buf, 0xCu);
          mach_port_t smcPort = self->smcPort;
        }
      }
      unsigned int sensorExchangeKeyValue = a3->sensorExchangeKeyValue;
      unint64_t sensorExchangeKeySize = a3->sensorExchangeKeySize;
      v17 = 168;
      v36 = 0u;
      v37 = 0u;
      memset(v38, 0, sizeof(v38));
      v39 = 0;
      memset(outputStruct, 0, sizeof(outputStruct));
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0;
      v18[0] = HIBYTE(sensorExchangeKeyValue);
      v18[1] = BYTE2(sensorExchangeKeyValue);
      v18[2] = BYTE1(sensorExchangeKeyValue);
      v18[3] = sensorExchangeKeyValue;
      v18[4] = 0;
      v38[6] = 6;
      *(_DWORD *)buf = sensorExchangeKeyValue;
      DWORD2(v37) = sensorExchangeKeySize;
      if ((_BYTE)sensorExchangeKeySize) {
        memcpy(&v38[12], a4, sensorExchangeKeySize);
      }
      v12 = IOConnectCallStructMethod(smcPort, 2u, buf, 0xA8uLL, outputStruct, &v17);
      v13 = BYTE8(v26);
      if (!v12 && !BYTE8(v26)) {
        goto LABEL_14;
      }
      v14 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v19 = 136315650;
        v20 = v18;
        v21 = 1024;
        v22 = v12;
        v23 = 1024;
        v24 = v13;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "<Error> Write failed for key '%s' (0x%X, 0x%X)\n", v19, 0x18u);
        if (v12)
        {
LABEL_12:
          v15 = qword_1000AABC0;
          if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
            sub_100057328(v12, v15);
          }
        }
      }
      else if (v12)
      {
        goto LABEL_12;
      }
LABEL_14:
      a3->SensorExchangeUpdateNeeded = 0;
      ++a3->data.BYTES.p1[2];
    }
  }
  else
  {
    v16 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_1000572E4(v16);
    }
  }
}

+ (id)sharedInstance
{
  if (qword_1000AA0D8 != -1) {
    dispatch_once(&qword_1000AA0D8, &stru_100085F48);
  }
  return (id)qword_1000AA0E0;
}

- (void)updateAllSensorExchangeData
{
  unint64_t v3 = 0;
  uint64_t v4 = 232;
  do
  {
    v5 = (char *)self + 4 * v3;
    uint64_t v6 = *((unsigned int *)v5 + 28);
    if ((v6 & 0x80000000) == 0 && v3 < self->cameraSensors.data.BYTES.p1[0])
    {
      int v7 = *((_DWORD *)&qword_1000AACCC + v6);
      float v8 = (double)v7 / 100.0;
      v9 = (float *)((char *)self + 4 * v3);
      if (v9[58] != v8)
      {
        if (byte_1000AA7A0)
        {
          v10 = qword_1000AABC0;
          if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            int v35 = v6;
            __int16 v36 = 1024;
            LODWORD(v37) = v7;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<Notice> Camera sensor update found for sensor# %d with value: %d", buf, 0xEu);
          }
        }
        v9[58] = v8;
        self->cameraSensors.SensorExchangeUpdateNeeded = 1;
      }
    }
    uint64_t v11 = *((unsigned int *)v5 + 96);
    if ((v11 & 0x80000000) == 0 && v3 < self->aopSensors.data.BYTES.p1[0])
    {
      int v12 = *((_DWORD *)&qword_1000AACCC + v11);
      float v13 = (double)v12 / 100.0;
      v14 = (float *)((char *)self + 4 * v3);
      if (v14[126] != v13)
      {
        if (byte_1000AA7A0)
        {
          v15 = qword_1000AABC0;
          if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            int v35 = v11;
            __int16 v36 = 1024;
            LODWORD(v37) = v12;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "<Notice> AOP sensor update found for sensor# %d with value: %d", buf, 0xEu);
          }
        }
        v14[126] = v13;
        self->aopSensors.SensorExchangeUpdateNeeded = 1;
      }
    }
    uint64_t v16 = self->basebandSensors.sensorIndexLUT[v3];
    if ((v16 & 0x80000000) == 0 && v3 < self->basebandSensors.data.BYTES.p1[0])
    {
      int v17 = *((_DWORD *)&qword_1000AACCC + v16);
      float v18 = (double)v17 / 100.0;
      v19 = (float *)((char *)self + 4 * v3);
      if (v19[194] != v18)
      {
        if (byte_1000AA7A0)
        {
          v20 = qword_1000AABC0;
          if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            int v35 = v16;
            __int16 v36 = 1024;
            LODWORD(v37) = v17;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "<Notice> Baseband sensor update found for sensor# %d with value: %d", buf, 0xEu);
          }
        }
        v19[194] = v18;
        self->basebandSensors.SensorExchangeUpdateNeeded = 1;
      }
    }
    uint64_t v21 = *(unsigned int *)((char *)&self->super.isa + v4 * 4);
    if ((v21 & 0x80000000) == 0 && v3 < self->displaySensors.data.BYTES.p1[0])
    {
      int v22 = *((_DWORD *)&qword_1000AACCC + v21);
      float v23 = (double)v22 / 100.0;
      v24 = (float *)((char *)self + 4 * v3);
      if (v24[262] != v23)
      {
        if (byte_1000AA7A0)
        {
          v25 = qword_1000AABC0;
          if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            int v35 = v21;
            __int16 v36 = 1024;
            LODWORD(v37) = v22;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "<Notice> Display sensor update found for sensor# %d with value: %d", buf, 0xEu);
          }
        }
        v24[262] = v23;
        self->displaySensors.SensorExchangeUpdateNeeded = 1;
      }
    }
    uint64_t ui32Raw = self->cameraSensors.data.SENSORS.sensorArray[v4 + 10].UI32.ui32Raw;
    if ((ui32Raw & 0x80000000) == 0 && v3 < self->miscSensors.data.BYTES.p1[0])
    {
      float v27 = v3 == 26 || v3 == 1
          ? (double)*((int *)&qword_1000AACCC + ui32Raw) / 100.0
          : *(float *)&dword_1000AADE0[ui32Raw];
      v28 = (float *)((char *)self + 4 * v3);
      if (v27 != v28[330])
      {
        if (byte_1000AA7A0)
        {
          v29 = qword_1000AABC0;
          if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            int v35 = ui32Raw;
            __int16 v36 = 2048;
            double v37 = v27;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "<Notice> Misc sensor update found for sensor# %d with value: %f", buf, 0x12u);
          }
        }
        v28[330] = v27;
        self->miscSensors.SensorExchangeUpdateNeeded = 1;
      }
    }
    uint64_t v30 = self->aopSensors.data.SENSORS.sensorArray[v4 + 10].UI32.ui32Raw;
    if ((v30 & 0x80000000) == 0 && v3 < self->misc2Sensors.data.BYTES.p1[0])
    {
      float v31 = v3 == 3 || v3 == 2
          ? (double)*((int *)&qword_1000AACCC + v30) / 100.0
          : *(float *)&dword_1000AAEE0[v30];
      v32 = (float *)((char *)self + 4 * v3);
      if (v31 != v32[398])
      {
        if (byte_1000AA7A0)
        {
          v33 = qword_1000AABC0;
          if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            int v35 = v30;
            __int16 v36 = 2048;
            double v37 = v31;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "<Notice> Misc2 sensor update found for sensor# %d with value: %f", buf, 0x12u);
          }
        }
        v32[398] = v31;
        self->misc2Sensors.SensorExchangeUpdateNeeded = 1;
      }
    }
    ++v3;
    ++v4;
  }
  while (v3 != 29);
}

- (SensorExchangeHelper)init
{
  v7.receiver = self;
  v7.super_class = (Class)SensorExchangeHelper;
  v2 = [(SensorExchangeHelper *)&v7 init];
  unint64_t v3 = v2;
  if (v2)
  {
    if (pthread_mutex_init(&v2->lock, 0))
    {
      uint64_t v4 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_1000572A0(v4);
      }
      return 0;
    }
    else
    {
      v3->mach_port_t smcPort = 0;
      v3->cameraSensors.sensorExchangeKeyStr = @"zECm";
      v3->cameraSensors.unsigned int sensorExchangeKeyValue = 2051359597;
      v3->cameraSensors.unint64_t sensorExchangeKeySize = 64;
      v3->cameraSensors.numberOfSensors = 15;
      v3->cameraSensors.SensorExchangeUpdateNeeded = 0;
      *(_DWORD *)v3->cameraSensors.data.BYTES.p1 = 267;
      v3->aopSensors.sensorExchangeKeyStr = @"zEAO";
      v3->aopSensors.unsigned int sensorExchangeKeyValue = 2051359055;
      v3->aopSensors.unint64_t sensorExchangeKeySize = 32;
      v3->aopSensors.SensorExchangeUpdateNeeded = 0;
      *(_DWORD *)v3->aopSensors.data.BYTES.p1 = 261;
      v3->basebandSensors.sensorExchangeKeyStr = @"zEWi";
      v3->basebandSensors.unsigned int sensorExchangeKeyValue = 2051364713;
      v3->basebandSensors.unint64_t sensorExchangeKeySize = 32;
      v3->basebandSensors.SensorExchangeUpdateNeeded = 0;
      *(_DWORD *)v3->basebandSensors.data.BYTES.p1 = 259;
      v3->displaySensors.sensorExchangeKeyStr = @"zETC";
      v3->displaySensors.unsigned int sensorExchangeKeyValue = 2051363907;
      v3->displaySensors.unint64_t sensorExchangeKeySize = 32;
      v3->displaySensors.SensorExchangeUpdateNeeded = 0;
      *(_DWORD *)v3->displaySensors.data.BYTES.p1 = 260;
      v3->miscSensors.sensorExchangeKeyStr = @"zETM";
      v3->miscSensors.unsigned int sensorExchangeKeyValue = 2051363917;
      v3->miscSensors.unint64_t sensorExchangeKeySize = 120;
      v3->miscSensors.numberOfSensors = 29;
      v3->miscSensors.SensorExchangeUpdateNeeded = 0;
      *(_DWORD *)v3->miscSensors.data.BYTES.p1 = 285;
      v3->misc2Sensors.sensorExchangeKeyStr = @"zETN";
      v3->misc2Sensors.unsigned int sensorExchangeKeyValue = 2051363918;
      v3->misc2Sensors.unint64_t sensorExchangeKeySize = 120;
      v3->misc2Sensors.numberOfSensors = 29;
      v3->misc2Sensors.SensorExchangeUpdateNeeded = 0;
      *(_DWORD *)v3->misc2Sensors.data.BYTES.p1 = 260;
      v3->strapSensors.sensorExchangeKeyStr = @"zEAR";
      v3->strapSensors.unsigned int sensorExchangeKeyValue = 2051359058;
      v3->strapSensors.unint64_t sensorExchangeKeySize = 32;
      v3->strapSensors.numberOfSensors = 7;
      v3->strapSensors.SensorExchangeUpdateNeeded = 0;
      *(_DWORD *)v3->strapSensors.data.BYTES.p1 = 258;
      v3->cameraSensors.sensorIndexLUT[28] = -1;
      *(void *)&long long v5 = -1;
      *((void *)&v5 + 1) = -1;
      *(_OWORD *)&v3->cameraSensors.sensorIndexLUT[20] = v5;
      *(_OWORD *)&v3->cameraSensors.sensorIndexLUT[24] = v5;
      *(_OWORD *)&v3->cameraSensors.sensorIndexLUT[12] = v5;
      *(_OWORD *)&v3->cameraSensors.sensorIndexLUT[16] = v5;
      *(_OWORD *)&v3->cameraSensors.sensorIndexLUT[4] = v5;
      *(_OWORD *)&v3->cameraSensors.sensorIndexLUT[8] = v5;
      *(_OWORD *)v3->cameraSensors.sensorIndexLUT = v5;
      *(_OWORD *)v3->aopSensors.sensorIndexLUT = v5;
      *(_OWORD *)&v3->aopSensors.sensorIndexLUT[4] = v5;
      *(_OWORD *)&v3->aopSensors.sensorIndexLUT[8] = v5;
      *(_OWORD *)&v3->aopSensors.sensorIndexLUT[12] = v5;
      *(_OWORD *)&v3->aopSensors.sensorIndexLUT[16] = v5;
      *(_OWORD *)&v3->aopSensors.sensorIndexLUT[20] = v5;
      *(_OWORD *)&v3->aopSensors.sensorIndexLUT[24] = v5;
      v3->aopSensors.sensorIndexLUT[28] = -1;
      *(_OWORD *)v3->basebandSensors.sensorIndexLUT = v5;
      *(_OWORD *)&v3->basebandSensors.sensorIndexLUT[4] = v5;
      *(_OWORD *)&v3->basebandSensors.sensorIndexLUT[8] = v5;
      *(_OWORD *)&v3->basebandSensors.sensorIndexLUT[12] = v5;
      *(_OWORD *)&v3->basebandSensors.sensorIndexLUT[16] = v5;
      *(_OWORD *)&v3->basebandSensors.sensorIndexLUT[20] = v5;
      *(_OWORD *)&v3->basebandSensors.sensorIndexLUT[24] = v5;
      v3->basebandSensors.sensorIndexLUT[28] = -1;
      v3->displaySensors.sensorIndexLUT[28] = -1;
      *(_OWORD *)&v3->displaySensors.sensorIndexLUT[20] = v5;
      *(_OWORD *)&v3->displaySensors.sensorIndexLUT[24] = v5;
      *(_OWORD *)&v3->displaySensors.sensorIndexLUT[12] = v5;
      *(_OWORD *)&v3->displaySensors.sensorIndexLUT[16] = v5;
      *(_OWORD *)&v3->displaySensors.sensorIndexLUT[4] = v5;
      *(_OWORD *)&v3->displaySensors.sensorIndexLUT[8] = v5;
      *(_OWORD *)v3->displaySensors.sensorIndexLUT = v5;
      v3->miscSensors.sensorIndexLUT[28] = -1;
      *(_OWORD *)&v3->miscSensors.sensorIndexLUT[24] = v5;
      *(_OWORD *)&v3->miscSensors.sensorIndexLUT[20] = v5;
      *(_OWORD *)&v3->miscSensors.sensorIndexLUT[16] = v5;
      *(_OWORD *)&v3->miscSensors.sensorIndexLUT[12] = v5;
      *(_OWORD *)&v3->miscSensors.sensorIndexLUT[8] = v5;
      *(_OWORD *)&v3->miscSensors.sensorIndexLUT[4] = v5;
      *(_OWORD *)v3->miscSensors.sensorIndexLUT = v5;
      v3->misc2Sensors.sensorIndexLUT[28] = -1;
      *(_OWORD *)&v3->misc2Sensors.sensorIndexLUT[24] = v5;
      *(_OWORD *)&v3->misc2Sensors.sensorIndexLUT[20] = v5;
      *(_OWORD *)&v3->misc2Sensors.sensorIndexLUT[16] = v5;
      *(_OWORD *)&v3->misc2Sensors.sensorIndexLUT[12] = v5;
      *(_OWORD *)&v3->misc2Sensors.sensorIndexLUT[8] = v5;
      *(_OWORD *)&v3->misc2Sensors.sensorIndexLUT[4] = v5;
      *(_OWORD *)v3->misc2Sensors.sensorIndexLUT = v5;
      v3->strapSensors.sensorIndexLUT[28] = -1;
      *(_OWORD *)&v3->strapSensors.sensorIndexLUT[24] = v5;
      *(_OWORD *)&v3->strapSensors.sensorIndexLUT[20] = v5;
      *(_OWORD *)&v3->strapSensors.sensorIndexLUT[16] = v5;
      *(_OWORD *)&v3->strapSensors.sensorIndexLUT[12] = v5;
      *(_OWORD *)&v3->strapSensors.sensorIndexLUT[8] = v5;
      *(_OWORD *)&v3->strapSensors.sensorIndexLUT[4] = v5;
      *(_OWORD *)v3->strapSensors.sensorIndexLUT = v5;
    }
  }
  return v3;
}

- (smcExchangeSensorGroupInfo)getSensorGroupForSMCKeyString:(__CFString *)a3
{
  p_cameraSensors = &self->cameraSensors;
  if (CFStringCompare(a3, self->cameraSensors.sensorExchangeKeyStr, 0))
  {
    if (CFStringCompare(a3, self->aopSensors.sensorExchangeKeyStr, 0))
    {
      if (CFStringCompare(a3, self->basebandSensors.sensorExchangeKeyStr, 0))
      {
        if (CFStringCompare(a3, self->displaySensors.sensorExchangeKeyStr, 0))
        {
          if (CFStringCompare(a3, self->miscSensors.sensorExchangeKeyStr, 0))
          {
            if (CFStringCompare(a3, self->misc2Sensors.sensorExchangeKeyStr, 0))
            {
              p_cameraSensors = &self->strapSensors;
              if (CFStringCompare(a3, self->strapSensors.sensorExchangeKeyStr, 0)) {
                return 0;
              }
            }
            else
            {
              return &self->misc2Sensors;
            }
          }
          else
          {
            return &self->miscSensors;
          }
        }
        else
        {
          return &self->displaySensors;
        }
      }
      else
      {
        return &self->basebandSensors;
      }
    }
    else
    {
      return &self->aopSensors;
    }
  }
  return p_cameraSensors;
}

- (void)registerCLTMSensorIndex:(int)a3 forSMCKey:(__CFString *)a4 atSMCIndex:(int)a5
{
  float v8 = [(SensorExchangeHelper *)self getSensorGroupForSMCKeyString:a4];
  if (v8)
  {
    if ((a5 | a3) < 0)
    {
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_1000574F8();
      }
    }
    else
    {
      v9 = v8;
      if (CFEqual(a4, v8->sensorExchangeKeyStr))
      {
        if (v9->numberOfSensors > a5)
        {
          if (byte_1000AA7A0)
          {
            v10 = qword_1000AABC0;
            if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
            {
              int v13 = 67109376;
              int v14 = a3;
              __int16 v15 = 1024;
              LODWORD(v16) = a5;
              _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<Notice> Assigning CLTM sensor index %d to SMC sensor index: %d", (uint8_t *)&v13, 0xEu);
            }
          }
          v9->sensorIndexLUT[a5] = a3;
          return;
        }
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
          sub_100057490();
        }
      }
      int v12 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
      {
        int v13 = 67109634;
        int v14 = a3;
        __int16 v15 = 2112;
        uint64_t v16 = a4;
        __int16 v17 = 1024;
        int v18 = a5;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "<Error> Unable to assign CLTM index:%d to any SMC sensor group for key:%@ and index:%d", (uint8_t *)&v13, 0x18u);
      }
    }
  }
  else
  {
    uint64_t v11 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100057418((uint64_t)a4, v11);
    }
  }
}

@end