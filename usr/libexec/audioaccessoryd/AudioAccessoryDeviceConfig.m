@interface AudioAccessoryDeviceConfig
- (id)xpcObjectRepresentation;
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

- (id)xpcObjectRepresentation
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  v4 = v3;
  if (self->_allowOffListeningMode) {
    xpc_dictionary_set_uint64(v3, "alOf", self->_allowOffListeningMode);
  }
  uint64_t autoANCStrength = self->_autoANCStrength;
  if (autoANCStrength) {
    xpc_dictionary_set_uint64(v4, "aaSt", autoANCStrength);
  }
  if (self->_enableSiriMultitone) {
    xpc_dictionary_set_uint64(v4, "esmt", self->_enableSiriMultitone);
  }
  if (self->_enableHearingAidGainSwipe) {
    xpc_dictionary_set_uint64(v4, "haGS", self->_enableHearingAidGainSwipe);
  }
  if (self->_enableHearingAssist) {
    xpc_dictionary_set_uint64(v4, "hrEn", self->_enableHearingAssist);
  }
  if (self->_hearingAidToggle) {
    xpc_dictionary_set_uint64(v4, "haCg", self->_hearingAidToggle);
  }
  if (self->_hearingAidEnrolled) {
    xpc_dictionary_set_uint64(v4, "haEn", self->_hearingAidEnrolled);
  }
  if (self->_enableHeartRateMonitor) {
    xpc_dictionary_set_uint64(v4, "hrmt", self->_enableHeartRateMonitor);
  }

  return v4;
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
  self->_uint64_t autoANCStrength = a3;
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

- (unsigned)enableHearingAssist
{
  return self->_enableHearingAssist;
}

- (void)setEnableHearingAssist:(unsigned __int8)a3
{
  self->_enableHearingAssist = a3;
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