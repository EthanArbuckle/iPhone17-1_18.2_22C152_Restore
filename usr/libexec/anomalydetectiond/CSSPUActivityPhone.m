@interface CSSPUActivityPhone
- (ActivitySamplePhone)c_struct;
- (CSSPUActivityPhone)initWithTimestamp:(unint64_t)a3 armTimeImuConfidences:(id)a4 armTimeActivityHints:(unsigned __int8)a5 windowAfterArmImuConfidences:(id)a6 triggerTimeLastHighImuDrivingConfidenceTimestamp:(unint64_t)a7 sessionSwivelAngleDegHistogram:(id)a8 sessionTiltAngleDegHistogram:(id)a9 sessionImuHintPercentage:(float)a10 sessionBtHintPercentage:(float)a11 sessionGpsHintPercentage:(float)a12 sessionWifiHintPercentage:(float)a13;
- (id).cxx_construct;
- (unint64_t)timestamp;
- (void)setTimestamp:(unint64_t)a3;
@end

@implementation CSSPUActivityPhone

- (CSSPUActivityPhone)initWithTimestamp:(unint64_t)a3 armTimeImuConfidences:(id)a4 armTimeActivityHints:(unsigned __int8)a5 windowAfterArmImuConfidences:(id)a6 triggerTimeLastHighImuDrivingConfidenceTimestamp:(unint64_t)a7 sessionSwivelAngleDegHistogram:(id)a8 sessionTiltAngleDegHistogram:(id)a9 sessionImuHintPercentage:(float)a10 sessionBtHintPercentage:(float)a11 sessionGpsHintPercentage:(float)a12 sessionWifiHintPercentage:(float)a13
{
  id v23 = a4;
  id v24 = a6;
  id v25 = a8;
  id v26 = a9;
  v40.receiver = self;
  v40.super_class = (Class)CSSPUActivityPhone;
  v27 = [(CSSPUActivityPhone *)&v40 init];
  v28 = v27;
  if (v27)
  {
    uint64_t v29 = 0;
    v27->_c_struct.timestamp = a3;
    do
    {
      v30 = [v23 objectAtIndexedSubscript:v29];
      [v30 floatValue];
      v28->_c_struct._armTime_ImuConfidences[v29] = v31;

      ++v29;
    }
    while (v29 != 3);
    uint64_t v32 = 0;
    v28->_c_struct._armTime_ActivityHints = a5;
    do
    {
      v33 = [v24 objectAtIndexedSubscript:v32];
      [v33 floatValue];
      v28->_c_struct._windowAfterArm_ImuConfidences[v32] = v34;

      ++v32;
    }
    while (v32 != 3);
    uint64_t v35 = 0;
    v28->_c_struct._triggerTime_LastHighImuDrivingConfidenceTimestamp = a7;
    do
    {
      v36 = [v25 objectAtIndexedSubscript:v35];
      v28->_c_struct._session_SwivelAngleDegHistogram[v35] = (unsigned __int16)[v36 intValue];

      ++v35;
    }
    while (v35 != 5);
    for (uint64_t i = 0; i != 5; ++i)
    {
      v38 = [v26 objectAtIndexedSubscript:i];
      v28->_c_struct._session_TiltAngleDegHistogram[i] = (unsigned __int16)[v38 intValue];
    }
    v28->_c_struct._session_ImuHintPercentage = a10;
    v28->_c_struct._session_BtHintPercentage = a11;
    v28->_c_struct._session_GpsHintPercentage = a12;
    v28->_c_struct._session_WifiHintPercentage = a13;
  }

  return v28;
}

- (unint64_t)timestamp
{
  return self->_c_struct.timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_c_struct.timestamp = a3;
}

- (ActivitySamplePhone)c_struct
{
  return &self->_c_struct;
}

- (id).cxx_construct
{
  *((_DWORD *)self + 8) = 0;
  *(void *)((char *)self + 36) = 0;
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *(void *)((char *)self + 21) = 0;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *(_OWORD *)((char *)self + 76) = 0u;
  return self;
}

@end