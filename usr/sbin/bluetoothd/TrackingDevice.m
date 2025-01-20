@interface TrackingDevice
- (NSMutableSet)appleTypes;
- (NSUUID)deviceUUID;
- (TrackingDevice)initWithDevice:(id)a3 type:(unsigned __int8)a4 timeoutValue:(unsigned __int8)a5 targetCore:(unsigned __int8)a6 rssiThreshold:(unsigned __int8)a7 rssiThresholdGone:(unsigned __int8)a8 invalidRssiHandling:(unsigned __int8)a9 rssiPrecision:(unsigned __int8)a10 rssiPrecisionGone:(unsigned __int8)a11 eventConfiguration:(unsigned __int8)a12 vseBuffering:(unsigned __int8)a13 rssiIncreaseScanThreshold:(unsigned __int8)a14 rssiIncreaseScanWindowThreshold:(unsigned __int16)a15 rssiIncreaseScanIntervalThreshold:(unsigned __int16)a16 rssiIncreaseScanTimeoutThreshold:(unsigned __int16)a17 sensorTimeoutBetweenIncreaseScan:(unsigned __int16)a18;
- (id)description;
- (unsigned)currentState;
- (unsigned)eventConfiguration;
- (unsigned)invalidRssiHandling;
- (unsigned)rssiIncreaseScanIntervalThreshold;
- (unsigned)rssiIncreaseScanThreshold;
- (unsigned)rssiIncreaseScanTimeoutThreshold;
- (unsigned)rssiIncreaseScanWindowThreshold;
- (unsigned)rssiPrecision;
- (unsigned)rssiPrecisionGone;
- (unsigned)rssiThreshold;
- (unsigned)rssiThresholdGone;
- (unsigned)sensorTimeoutBetweenIncreaseScan;
- (unsigned)targetCore;
- (unsigned)timeoutValue;
- (unsigned)vseBuffering;
- (void)setAppleTypes:(id)a3;
- (void)setCurrentState:(unsigned __int8)a3;
- (void)setDeviceUUID:(id)a3;
- (void)setEventConfiguration:(unsigned __int8)a3;
- (void)setInvalidRssiHandling:(unsigned __int8)a3;
- (void)setRssiIncreaseScanIntervalThreshold:(unsigned __int16)a3;
- (void)setRssiIncreaseScanThreshold:(unsigned __int8)a3;
- (void)setRssiIncreaseScanTimeoutThreshold:(unsigned __int16)a3;
- (void)setRssiIncreaseScanWindowThreshold:(unsigned __int16)a3;
- (void)setRssiPrecision:(unsigned __int8)a3;
- (void)setRssiPrecisionGone:(unsigned __int8)a3;
- (void)setRssiThreshold:(unsigned __int8)a3;
- (void)setRssiThresholdGone:(unsigned __int8)a3;
- (void)setSensorTimeoutBetweenIncreaseScan:(unsigned __int16)a3;
- (void)setTargetCore:(unsigned __int8)a3;
- (void)setTimeoutValue:(unsigned __int8)a3;
- (void)setVseBuffering:(unsigned __int8)a3;
@end

@implementation TrackingDevice

- (TrackingDevice)initWithDevice:(id)a3 type:(unsigned __int8)a4 timeoutValue:(unsigned __int8)a5 targetCore:(unsigned __int8)a6 rssiThreshold:(unsigned __int8)a7 rssiThresholdGone:(unsigned __int8)a8 invalidRssiHandling:(unsigned __int8)a9 rssiPrecision:(unsigned __int8)a10 rssiPrecisionGone:(unsigned __int8)a11 eventConfiguration:(unsigned __int8)a12 vseBuffering:(unsigned __int8)a13 rssiIncreaseScanThreshold:(unsigned __int8)a14 rssiIncreaseScanWindowThreshold:(unsigned __int16)a15 rssiIncreaseScanIntervalThreshold:(unsigned __int16)a16 rssiIncreaseScanTimeoutThreshold:(unsigned __int16)a17 sensorTimeoutBetweenIncreaseScan:(unsigned __int16)a18
{
  uint64_t v22 = a4;
  id v25 = a3;
  v33.receiver = self;
  v33.super_class = (Class)TrackingDevice;
  v26 = [(TrackingDevice *)&v33 init];
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_deviceUUID, a3);
    v28 = +[NSNumber numberWithUnsignedChar:v22];
    uint64_t v29 = +[NSMutableSet setWithObject:v28];
    appleTypes = v27->_appleTypes;
    v27->_appleTypes = (NSMutableSet *)v29;

    if ((char)a5 <= 0) {
      unsigned __int8 v31 = 7;
    }
    else {
      unsigned __int8 v31 = a5;
    }
    v27->_timeoutValue = v31;
    v27->_targetCore = a6;
    v27->_rssiThreshold = a7;
    v27->_rssiThresholdGone = a8;
    v27->_invalidRssiHandling = a9;
    v27->_rssiPrecision = a10;
    v27->_rssiPrecisionGone = a11;
    v27->_eventConfiguration = a12;
    v27->_vseBuffering = a13;
    v27->_rssiIncreaseScanThreshold = a14;
    v27->_rssiIncreaseScanWindowThreshold = a15;
    v27->_rssiIncreaseScanIntervalThreshold = a16;
    v27->_rssiIncreaseScanTimeoutThreshold = a17;
    v27->_sensorTimeoutBetweenIncreaseScan = a18;
    v27->_currentState = 2;
  }

  return v27;
}

- (id)description
{
  unsigned int v2 = self->_currentState - 1;
  if (v2 > 2) {
    CFStringRef v3 = @"Not Set";
  }
  else {
    CFStringRef v3 = off_1009B96C8[(char)v2];
  }
  v4 = +[NSString stringWithFormat:@"Tracking: %@ - state %@ - timeout value: %d - types: %@ rssi:%d:%d:%d tc:%d eCfg:%d:%d", self->_deviceUUID, v3, self->_timeoutValue, self->_appleTypes, self->_rssiThreshold, self->_rssiPrecision, self->_invalidRssiHandling, self->_targetCore, self->_eventConfiguration, self->_vseBuffering];

  return v4;
}

- (NSUUID)deviceUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDeviceUUID:(id)a3
{
}

- (unsigned)timeoutValue
{
  return self->_timeoutValue;
}

- (void)setTimeoutValue:(unsigned __int8)a3
{
  self->_timeoutValue = a3;
}

- (unsigned)targetCore
{
  return self->_targetCore;
}

- (void)setTargetCore:(unsigned __int8)a3
{
  self->_targetCore = a3;
}

- (unsigned)rssiThreshold
{
  return self->_rssiThreshold;
}

- (void)setRssiThreshold:(unsigned __int8)a3
{
  self->_rssiThreshold = a3;
}

- (unsigned)rssiThresholdGone
{
  return self->_rssiThresholdGone;
}

- (void)setRssiThresholdGone:(unsigned __int8)a3
{
  self->_rssiThresholdGone = a3;
}

- (unsigned)invalidRssiHandling
{
  return self->_invalidRssiHandling;
}

- (void)setInvalidRssiHandling:(unsigned __int8)a3
{
  self->_invalidRssiHandling = a3;
}

- (unsigned)rssiPrecision
{
  return self->_rssiPrecision;
}

- (void)setRssiPrecision:(unsigned __int8)a3
{
  self->_rssiPrecision = a3;
}

- (unsigned)rssiPrecisionGone
{
  return self->_rssiPrecisionGone;
}

- (void)setRssiPrecisionGone:(unsigned __int8)a3
{
  self->_rssiPrecisionGone = a3;
}

- (unsigned)eventConfiguration
{
  return self->_eventConfiguration;
}

- (void)setEventConfiguration:(unsigned __int8)a3
{
  self->_eventConfiguration = a3;
}

- (unsigned)vseBuffering
{
  return self->_vseBuffering;
}

- (void)setVseBuffering:(unsigned __int8)a3
{
  self->_vseBuffering = a3;
}

- (unsigned)rssiIncreaseScanThreshold
{
  return self->_rssiIncreaseScanThreshold;
}

- (void)setRssiIncreaseScanThreshold:(unsigned __int8)a3
{
  self->_rssiIncreaseScanThreshold = a3;
}

- (unsigned)rssiIncreaseScanWindowThreshold
{
  return self->_rssiIncreaseScanWindowThreshold;
}

- (void)setRssiIncreaseScanWindowThreshold:(unsigned __int16)a3
{
  self->_rssiIncreaseScanWindowThreshold = a3;
}

- (unsigned)rssiIncreaseScanIntervalThreshold
{
  return self->_rssiIncreaseScanIntervalThreshold;
}

- (void)setRssiIncreaseScanIntervalThreshold:(unsigned __int16)a3
{
  self->_rssiIncreaseScanIntervalThreshold = a3;
}

- (unsigned)rssiIncreaseScanTimeoutThreshold
{
  return self->_rssiIncreaseScanTimeoutThreshold;
}

- (void)setRssiIncreaseScanTimeoutThreshold:(unsigned __int16)a3
{
  self->_rssiIncreaseScanTimeoutThreshold = a3;
}

- (unsigned)sensorTimeoutBetweenIncreaseScan
{
  return self->_sensorTimeoutBetweenIncreaseScan;
}

- (void)setSensorTimeoutBetweenIncreaseScan:(unsigned __int16)a3
{
  self->_sensorTimeoutBetweenIncreaseScan = a3;
}

- (NSMutableSet)appleTypes
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAppleTypes:(id)a3
{
}

- (unsigned)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(unsigned __int8)a3
{
  self->_currentState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleTypes, 0);

  objc_storeStrong((id *)&self->_deviceUUID, 0);
}

@end