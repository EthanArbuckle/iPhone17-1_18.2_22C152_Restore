@interface SCDAPreferences
- (BOOL)BLEActivityEnabled;
- (BOOL)coordinationEnabled;
- (BOOL)coordinationEnabledForAccessoryLogging;
- (BOOL)ignoreAdjustedBoost;
- (BOOL)ignorePlatformBias;
- (BOOL)myriadServerHasProvisioned;
- (SCDAPreferences)initWithDeviceInstanceContext:(id)a3 preferences:(id)a4;
- (double)deviceDelay;
- (double)deviceSlowDown;
- (double)deviceTrumpDelay;
- (double)maxNoOperationDelay;
- (double)testDeviceDelay;
- (double)voiceTriggerEndtimeDelayThreshold;
- (float)deviceAdjust;
- (int)constantGoodnessScore;
- (unsigned)deviceClass;
- (unsigned)deviceGroup;
- (void)enableCoordination:(BOOL)a3;
- (void)setConstantGoodnessScore:(int)a3;
- (void)setDeviceAdjust:(float)a3;
- (void)setDeviceClass:(unsigned __int8)a3;
- (void)setDeviceDelay:(double)a3;
- (void)setDeviceGroup:(unsigned __int8)a3 completion:(id)a4;
- (void)setDeviceSlowDown:(double)a3;
- (void)setDeviceTrumpDelay:(double)a3;
- (void)setIgnoreAdjustedBoost:(BOOL)a3;
- (void)setIgnorePlatformBias:(BOOL)a3;
- (void)setMaxNoOperationDelay:(double)a3;
- (void)setTestDeviceDelay:(double)a3;
- (void)setVoiceTriggerEndtimeDelayThreshold:(double)a3;
@end

@implementation SCDAPreferences

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pref, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
}

- (double)maxNoOperationDelay
{
  [(SCDAAssistantPreferences *)self->_pref myriadMaxNoOperationDelay];
  return result;
}

- (void)setMaxNoOperationDelay:(double)a3
{
}

- (double)deviceSlowDown
{
  [(SCDAAssistantPreferences *)self->_pref myriadDeviceDelay];
  return result;
}

- (void)setDeviceSlowDown:(double)a3
{
}

- (double)voiceTriggerEndtimeDelayThreshold
{
  [(SCDAAssistantPreferences *)self->_pref myriadDeviceVTEndTimeDistanceThreshold];
  return result;
}

- (void)setVoiceTriggerEndtimeDelayThreshold:(double)a3
{
}

- (BOOL)BLEActivityEnabled
{
  return ![(SCDAAssistantPreferences *)self->_pref disableMyriadBLEActivity];
}

- (BOOL)coordinationEnabledForAccessoryLogging
{
  return [(SCDAAssistantPreferences *)self->_pref myriadCoordinationEnabledForAccessoryLogging];
}

- (BOOL)coordinationEnabled
{
  return [(SCDAAssistantPreferences *)self->_pref myriadCoordinationEnabled];
}

- (void)enableCoordination:(BOOL)a3
{
}

- (double)deviceTrumpDelay
{
  [(SCDAAssistantPreferences *)self->_pref myriadDeviceTrumpDelay];
  return result;
}

- (void)setDeviceTrumpDelay:(double)a3
{
}

- (double)testDeviceDelay
{
  [(SCDAAssistantPreferences *)self->_pref myriadTestDeviceDelay];
  return result;
}

- (void)setTestDeviceDelay:(double)a3
{
}

- (double)deviceDelay
{
  [(SCDAAssistantPreferences *)self->_pref myriadDeviceDelay];
  return result;
}

- (void)setDeviceDelay:(double)a3
{
}

- (float)deviceAdjust
{
  [(SCDAAssistantPreferences *)self->_pref myriadDeviceAdjust];
  return result;
}

- (void)setDeviceAdjust:(float)a3
{
}

- (BOOL)myriadServerHasProvisioned
{
  return [(SCDAAssistantPreferences *)self->_pref myriadServerHasProvisioned];
}

- (int)constantGoodnessScore
{
  return [(SCDAAssistantPreferences *)self->_pref myriadConstantGoodness];
}

- (void)setConstantGoodnessScore:(int)a3
{
}

- (BOOL)ignorePlatformBias
{
  return [(SCDAAssistantPreferences *)self->_pref ignoreMyriadPlatformBias];
}

- (void)setIgnorePlatformBias:(BOOL)a3
{
}

- (BOOL)ignoreAdjustedBoost
{
  return [(SCDAAssistantPreferences *)self->_pref myriadShouldIgnoreAdjustedBoost];
}

- (void)setIgnoreAdjustedBoost:(BOOL)a3
{
}

- (unsigned)deviceClass
{
  return [(SCDAAssistantPreferences *)self->_pref myriadDeviceClass];
}

- (void)setDeviceClass:(unsigned __int8)a3
{
}

- (unsigned)deviceGroup
{
  v2 = [(SCDAAssistantPreferences *)self->_pref myriadDeviceGroup];
  unsigned __int8 v3 = [v2 intValue];

  return v3;
}

- (void)setDeviceGroup:(unsigned __int8)a3 completion:(id)a4
{
  uint64_t v4 = a3;
  id v9 = a4;
  pref = self->_pref;
  v7 = [NSNumber numberWithUnsignedChar:v4];
  [(SCDAAssistantPreferences *)pref setMyriadDeviceGroup:v7];

  v8 = v9;
  if (v9)
  {
    (*((void (**)(id, uint64_t))v9 + 2))(v9, v4);
    v8 = v9;
  }
}

- (SCDAPreferences)initWithDeviceInstanceContext:(id)a3 preferences:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SCDAPreferences;
  id v9 = [(SCDAPreferences *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_instanceContext, a3);
    if (v8) {
      v11 = (SCDAAssistantPreferences *)v8;
    }
    else {
      v11 = [[SCDAAssistantPreferences alloc] initWithInstanceContext:v10->_instanceContext];
    }
    pref = v10->_pref;
    v10->_pref = v11;
  }
  return v10;
}

@end