@interface AudioAccessoryDeviceConfig
- (AudioAccessoryDeviceConfig)initWithXPCObject:(id)a3 error:(id *)a4;
- (unsigned)allowOffListeningMode;
- (unsigned)autoANCStrength;
- (unsigned)enableHearingAidGainSwipe;
- (unsigned)enableHearingAssist;
- (unsigned)enableHeartRateMonitor;
- (unsigned)enableSiriMultitone;
- (unsigned)hearingAidEnrolled;
- (unsigned)hearingAidToggle;
- (void)setAllowOffListeningMode:(unsigned __int8)a3;
- (void)setAutoANCStrength:(unsigned int)a3;
- (void)setEnableHearingAidGainSwipe:(unsigned __int8)a3;
- (void)setEnableHearingAssist:(unsigned __int8)a3;
- (void)setEnableHeartRateMonitor:(unsigned __int8)a3;
- (void)setEnableSiriMultitone:(unsigned __int8)a3;
- (void)setHearingAidEnrolled:(unsigned __int8)a3;
- (void)setHearingAidToggle:(unsigned __int8)a3;
@end

@implementation AudioAccessoryDeviceConfig

- (AudioAccessoryDeviceConfig)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AudioAccessoryDeviceConfig;
  v7 = [(AudioAccessoryDeviceConfig *)&v18 init];
  if (!v7)
  {
    if (!a4) {
      goto LABEL_33;
    }
LABEL_32:
    NSErrorF_safe();
    v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  if (xpc_get_type(v6) != (xpc_type_t)&_xpc_type_dictionary)
  {
    if (!a4) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  uint64_t v19 = 0;
  int v8 = CUXPCDecodeUInt64RangedEx();
  if (v8 == 6)
  {
    v7->_allowOffListeningMode = v19;
  }
  else if (v8 == 5)
  {
    goto LABEL_33;
  }
  uint64_t v19 = 0;
  int v9 = CUXPCDecodeUInt64RangedEx();
  if (v9 == 6)
  {
    v7->_autoANCStrength = v19;
  }
  else if (v9 == 5)
  {
    goto LABEL_33;
  }
  uint64_t v19 = 0;
  int v10 = CUXPCDecodeUInt64RangedEx();
  if (v10 == 6)
  {
    v7->_enableSiriMultitone = v19;
  }
  else if (v10 == 5)
  {
    goto LABEL_33;
  }
  uint64_t v19 = 0;
  int v11 = CUXPCDecodeUInt64RangedEx();
  if (v11 == 6)
  {
    v7->_enableHearingAidGainSwipe = v19;
  }
  else if (v11 == 5)
  {
    goto LABEL_33;
  }
  uint64_t v19 = 0;
  int v12 = CUXPCDecodeUInt64RangedEx();
  if (v12 == 6)
  {
    v7->_enableHearingAssist = v19;
  }
  else if (v12 == 5)
  {
    goto LABEL_33;
  }
  uint64_t v19 = 0;
  int v13 = CUXPCDecodeUInt64RangedEx();
  if (v13 == 6)
  {
    v7->_hearingAidToggle = v19;
  }
  else if (v13 == 5)
  {
    goto LABEL_33;
  }
  uint64_t v19 = 0;
  int v14 = CUXPCDecodeUInt64RangedEx();
  if (v14 == 6)
  {
    v7->_hearingAidEnrolled = v19;
  }
  else if (v14 == 5)
  {
    goto LABEL_33;
  }
  uint64_t v19 = 0;
  int v15 = CUXPCDecodeUInt64RangedEx();
  if (v15 != 6)
  {
    if (v15 != 5) {
      goto LABEL_27;
    }
LABEL_33:
    v16 = 0;
    goto LABEL_28;
  }
  v7->_enableHeartRateMonitor = v19;
LABEL_27:
  v16 = v7;
LABEL_28:

  return v16;
}

- (unsigned)allowOffListeningMode
{
  return self->_allowOffListeningMode;
}

- (void)setAllowOffListeningMode:(unsigned __int8)a3
{
  self->_allowOffListeningMode = a3;
}

- (unsigned)autoANCStrength
{
  return self->_autoANCStrength;
}

- (void)setAutoANCStrength:(unsigned int)a3
{
  self->_autoANCStrength = a3;
}

- (unsigned)enableSiriMultitone
{
  return self->_enableSiriMultitone;
}

- (void)setEnableSiriMultitone:(unsigned __int8)a3
{
  self->_enableSiriMultitone = a3;
}

- (unsigned)enableHearingAidGainSwipe
{
  return self->_enableHearingAidGainSwipe;
}

- (void)setEnableHearingAidGainSwipe:(unsigned __int8)a3
{
  self->_enableHearingAidGainSwipe = a3;
}

- (unsigned)enableHearingAssist
{
  return self->_enableHearingAssist;
}

- (void)setEnableHearingAssist:(unsigned __int8)a3
{
  self->_enableHearingAssist = a3;
}

- (unsigned)hearingAidEnrolled
{
  return self->_hearingAidEnrolled;
}

- (void)setHearingAidEnrolled:(unsigned __int8)a3
{
  self->_hearingAidEnrolled = a3;
}

- (unsigned)hearingAidToggle
{
  return self->_hearingAidToggle;
}

- (void)setHearingAidToggle:(unsigned __int8)a3
{
  self->_hearingAidToggle = a3;
}

- (unsigned)enableHeartRateMonitor
{
  return self->_enableHeartRateMonitor;
}

- (void)setEnableHeartRateMonitor:(unsigned __int8)a3
{
  self->_enableHeartRateMonitor = a3;
}

@end