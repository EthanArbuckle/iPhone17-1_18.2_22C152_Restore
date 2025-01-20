@interface AudioAccessoryDeviceInfo
- (AudioAccessoryDeviceInfo)initWithXPCObject:(id)a3 error:(id *)a4;
- (NSString)identifier;
- (unsigned)autoANCCapability;
- (unsigned)autoANCStrength;
- (unsigned)bobbleCapability;
- (unsigned)caseSoundCapability;
- (unsigned)earTipFitTestCapability;
- (unsigned)frequencyBand;
- (unsigned)hearingAidCapability;
- (unsigned)hearingAidEnabled;
- (unsigned)hearingAidEnrolled;
- (unsigned)hearingAidGainSwipeEnabled;
- (unsigned)hearingAssistEnabled;
- (unsigned)hearingProtectionCapability;
- (unsigned)hearingTestCapability;
- (unsigned)heartRateMonitorEnabled;
- (unsigned)hideEarDetectionCapability;
- (unsigned)hideOffListeningModeCapability;
- (unsigned)siriMultitoneCapability;
- (unsigned)streamStateAoS;
- (void)setAutoANCCapability:(unsigned int)a3;
- (void)setAutoANCStrength:(unsigned int)a3;
- (void)setBobbleCapability:(unsigned __int8)a3;
- (void)setCaseSoundCapability:(unsigned __int8)a3;
- (void)setEarTipFitTestCapability:(unsigned __int8)a3;
- (void)setFrequencyBand:(unsigned __int8)a3;
- (void)setHearingAidCapability:(unsigned __int8)a3;
- (void)setHearingAidEnabled:(unsigned __int8)a3;
- (void)setHearingAidEnrolled:(unsigned __int8)a3;
- (void)setHearingAidGainSwipeEnabled:(unsigned __int8)a3;
- (void)setHearingAssistEnabled:(unsigned __int8)a3;
- (void)setHearingProtectionCapability:(unsigned __int8)a3;
- (void)setHearingTestCapability:(unsigned __int8)a3;
- (void)setHeartRateMonitorEnabled:(unsigned __int8)a3;
- (void)setHideEarDetectionCapability:(unsigned __int8)a3;
- (void)setHideOffListeningModeCapability:(unsigned __int8)a3;
- (void)setIdentifier:(id)a3;
- (void)setSiriMultitoneCapability:(unsigned __int8)a3;
- (void)setStreamStateAoS:(unsigned __int8)a3;
@end

@implementation AudioAccessoryDeviceInfo

- (AudioAccessoryDeviceInfo)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v28.receiver = self;
  v28.super_class = (Class)AudioAccessoryDeviceInfo;
  v7 = [(AudioAccessoryDeviceInfo *)&v28 init];
  if (!v7)
  {
    if (!a4) {
      goto LABEL_64;
    }
LABEL_63:
    NSErrorF();
    v26 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_59;
  }
  if (xpc_get_type(v6) != (xpc_type_t)&_xpc_type_dictionary)
  {
    if (!a4) {
      goto LABEL_64;
    }
    goto LABEL_63;
  }
  uint64_t v29 = 0;
  int v8 = CUXPCDecodeUInt64RangedEx();
  if (v8 == 6)
  {
    v7->_autoANCCapability = v29;
  }
  else if (v8 == 5)
  {
    goto LABEL_64;
  }
  uint64_t v29 = 0;
  int v9 = CUXPCDecodeUInt64RangedEx();
  if (v9 == 6)
  {
    v7->_autoANCStrength = v29;
  }
  else if (v9 == 5)
  {
    goto LABEL_64;
  }
  uint64_t v29 = 0;
  int v10 = CUXPCDecodeUInt64RangedEx();
  if (v10 == 6)
  {
    v7->_bobbleCapability = v29;
  }
  else if (v10 == 5)
  {
    goto LABEL_64;
  }
  uint64_t v29 = 0;
  int v11 = CUXPCDecodeUInt64RangedEx();
  if (v11 == 6)
  {
    v7->_caseSoundCapability = v29;
  }
  else if (v11 == 5)
  {
    goto LABEL_64;
  }
  uint64_t v29 = 0;
  int v12 = CUXPCDecodeUInt64RangedEx();
  if (v12 == 6)
  {
    v7->_earTipFitTestCapability = v29;
  }
  else if (v12 == 5)
  {
    goto LABEL_64;
  }
  uint64_t v29 = 0;
  int v13 = CUXPCDecodeUInt64RangedEx();
  if (v13 == 6)
  {
    v7->_frequencyBand = v29;
  }
  else if (v13 == 5)
  {
    goto LABEL_64;
  }
  uint64_t v29 = 0;
  int v14 = CUXPCDecodeUInt64RangedEx();
  if (v14 == 6)
  {
    v7->_hearingAidCapability = v29;
  }
  else if (v14 == 5)
  {
    goto LABEL_64;
  }
  uint64_t v29 = 0;
  int v15 = CUXPCDecodeUInt64RangedEx();
  if (v15 == 6)
  {
    v7->_hearingAidEnabled = v29;
  }
  else if (v15 == 5)
  {
    goto LABEL_64;
  }
  uint64_t v29 = 0;
  int v16 = CUXPCDecodeUInt64RangedEx();
  if (v16 == 6)
  {
    v7->_hearingAidEnrolled = v29;
  }
  else if (v16 == 5)
  {
    goto LABEL_64;
  }
  uint64_t v29 = 0;
  int v17 = CUXPCDecodeUInt64RangedEx();
  if (v17 == 6)
  {
    v7->_hearingAidGainSwipeEnabled = v29;
  }
  else if (v17 == 5)
  {
    goto LABEL_64;
  }
  uint64_t v29 = 0;
  int v18 = CUXPCDecodeUInt64RangedEx();
  if (v18 == 6)
  {
    v7->_hearingAssistEnabled = v29;
  }
  else if (v18 == 5)
  {
    goto LABEL_64;
  }
  uint64_t v29 = 0;
  int v19 = CUXPCDecodeUInt64RangedEx();
  if (v19 == 6)
  {
    v7->_hearingProtectionCapability = v29;
  }
  else if (v19 == 5)
  {
    goto LABEL_64;
  }
  uint64_t v29 = 0;
  int v20 = CUXPCDecodeUInt64RangedEx();
  if (v20 == 6)
  {
    v7->_hearingTestCapability = v29;
  }
  else if (v20 == 5)
  {
    goto LABEL_64;
  }
  uint64_t v29 = 0;
  int v21 = CUXPCDecodeUInt64RangedEx();
  if (v21 == 6)
  {
    v7->_heartRateMonitorEnabled = v29;
  }
  else if (v21 == 5)
  {
    goto LABEL_64;
  }
  uint64_t v29 = 0;
  int v22 = CUXPCDecodeUInt64RangedEx();
  if (v22 == 6)
  {
    v7->_hideEarDetectionCapability = v29;
  }
  else if (v22 == 5)
  {
    goto LABEL_64;
  }
  uint64_t v29 = 0;
  int v23 = CUXPCDecodeUInt64RangedEx();
  if (v23 == 6)
  {
    v7->_hideOffListeningModeCapability = v29;
  }
  else if (v23 == 5)
  {
    goto LABEL_64;
  }
  if (!CUXPCDecodeNSString()) {
    goto LABEL_64;
  }
  uint64_t v29 = 0;
  int v24 = CUXPCDecodeUInt64RangedEx();
  if (v24 == 6)
  {
    v7->_siriMultitoneCapability = v29;
  }
  else if (v24 == 5)
  {
    goto LABEL_64;
  }
  uint64_t v29 = 0;
  int v25 = CUXPCDecodeUInt64RangedEx();
  if (v25 != 6)
  {
    if (v25 != 5) {
      goto LABEL_58;
    }
LABEL_64:
    v26 = 0;
    goto LABEL_59;
  }
  v7->_streamStateAoS = v29;
LABEL_58:
  v26 = v7;
LABEL_59:

  return v26;
}

- (unsigned)autoANCCapability
{
  return self->_autoANCCapability;
}

- (void)setAutoANCCapability:(unsigned int)a3
{
  self->_autoANCCapability = a3;
}

- (unsigned)autoANCStrength
{
  return self->_autoANCStrength;
}

- (void)setAutoANCStrength:(unsigned int)a3
{
  self->_autoANCStrength = a3;
}

- (unsigned)bobbleCapability
{
  return self->_bobbleCapability;
}

- (void)setBobbleCapability:(unsigned __int8)a3
{
  self->_bobbleCapability = a3;
}

- (unsigned)caseSoundCapability
{
  return self->_caseSoundCapability;
}

- (void)setCaseSoundCapability:(unsigned __int8)a3
{
  self->_caseSoundCapability = a3;
}

- (unsigned)earTipFitTestCapability
{
  return self->_earTipFitTestCapability;
}

- (void)setEarTipFitTestCapability:(unsigned __int8)a3
{
  self->_earTipFitTestCapability = a3;
}

- (unsigned)frequencyBand
{
  return self->_frequencyBand;
}

- (void)setFrequencyBand:(unsigned __int8)a3
{
  self->_frequencyBand = a3;
}

- (unsigned)hearingAidCapability
{
  return self->_hearingAidCapability;
}

- (void)setHearingAidCapability:(unsigned __int8)a3
{
  self->_hearingAidCapability = a3;
}

- (unsigned)hearingAidEnrolled
{
  return self->_hearingAidEnrolled;
}

- (void)setHearingAidEnrolled:(unsigned __int8)a3
{
  self->_hearingAidEnrolled = a3;
}

- (unsigned)hearingAidEnabled
{
  return self->_hearingAidEnabled;
}

- (void)setHearingAidEnabled:(unsigned __int8)a3
{
  self->_hearingAidEnabled = a3;
}

- (unsigned)hearingAidGainSwipeEnabled
{
  return self->_hearingAidGainSwipeEnabled;
}

- (void)setHearingAidGainSwipeEnabled:(unsigned __int8)a3
{
  self->_hearingAidGainSwipeEnabled = a3;
}

- (unsigned)hearingAssistEnabled
{
  return self->_hearingAssistEnabled;
}

- (void)setHearingAssistEnabled:(unsigned __int8)a3
{
  self->_hearingAssistEnabled = a3;
}

- (unsigned)hearingProtectionCapability
{
  return self->_hearingProtectionCapability;
}

- (void)setHearingProtectionCapability:(unsigned __int8)a3
{
  self->_hearingProtectionCapability = a3;
}

- (unsigned)hearingTestCapability
{
  return self->_hearingTestCapability;
}

- (void)setHearingTestCapability:(unsigned __int8)a3
{
  self->_hearingTestCapability = a3;
}

- (unsigned)heartRateMonitorEnabled
{
  return self->_heartRateMonitorEnabled;
}

- (void)setHeartRateMonitorEnabled:(unsigned __int8)a3
{
  self->_heartRateMonitorEnabled = a3;
}

- (unsigned)hideEarDetectionCapability
{
  return self->_hideEarDetectionCapability;
}

- (void)setHideEarDetectionCapability:(unsigned __int8)a3
{
  self->_hideEarDetectionCapability = a3;
}

- (unsigned)hideOffListeningModeCapability
{
  return self->_hideOffListeningModeCapability;
}

- (void)setHideOffListeningModeCapability:(unsigned __int8)a3
{
  self->_hideOffListeningModeCapability = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (unsigned)siriMultitoneCapability
{
  return self->_siriMultitoneCapability;
}

- (void)setSiriMultitoneCapability:(unsigned __int8)a3
{
  self->_siriMultitoneCapability = a3;
}

- (unsigned)streamStateAoS
{
  return self->_streamStateAoS;
}

- (void)setStreamStateAoS:(unsigned __int8)a3
{
  self->_streamStateAoS = a3;
}

- (void).cxx_destruct
{
}

@end