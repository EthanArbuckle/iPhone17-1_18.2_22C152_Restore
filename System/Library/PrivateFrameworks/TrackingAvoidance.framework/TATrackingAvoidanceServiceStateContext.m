@interface TATrackingAvoidanceServiceStateContext
- (BOOL)airplaneMode;
- (BOOL)allowSimulatedEvents;
- (BOOL)batterySaverMode;
- (BOOL)deviceUnlockedSinceBoot;
- (BOOL)hasKoreaCountryCode;
- (BOOL)highThermalState;
- (BOOL)locationServicesEnabled;
- (BOOL)locationSimulationInProgress;
- (BOOL)restartRequired;
- (BOOL)serviceEnabled;
- (BOOL)userLocationInsideKorea;
- (TATrackingAvoidanceServiceStateContext)init;
- (void)setAirplaneMode:(BOOL)a3;
- (void)setAllowSimulatedEvents:(BOOL)a3;
- (void)setBatterySaverMode:(BOOL)a3;
- (void)setDeviceUnlockedSinceBoot:(BOOL)a3;
- (void)setHasKoreaCountryCode:(BOOL)a3;
- (void)setHighThermalState:(BOOL)a3;
- (void)setLocationServicesEnabled:(BOOL)a3;
- (void)setLocationSimulationInProgress:(BOOL)a3;
- (void)setRestartRequired:(BOOL)a3;
- (void)setServiceEnabled:(BOOL)a3;
- (void)setUserLocationInsideKorea:(BOOL)a3;
@end

@implementation TATrackingAvoidanceServiceStateContext

- (TATrackingAvoidanceServiceStateContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)TATrackingAvoidanceServiceStateContext;
  result = [(TATrackingAvoidanceServiceStateContext *)&v3 init];
  if (result)
  {
    *(_DWORD *)&result->_serviceEnabled = 1;
    result->_locationServicesEnabled = 1;
    *(_DWORD *)&result->_restartRequired = 0;
    *(_WORD *)&result->_hasKoreaCountryCode = 0;
  }
  return result;
}

- (BOOL)serviceEnabled
{
  return self->_serviceEnabled;
}

- (void)setServiceEnabled:(BOOL)a3
{
  self->_serviceEnabled = a3;
}

- (BOOL)highThermalState
{
  return self->_highThermalState;
}

- (void)setHighThermalState:(BOOL)a3
{
  self->_highThermalState = a3;
}

- (BOOL)airplaneMode
{
  return self->_airplaneMode;
}

- (void)setAirplaneMode:(BOOL)a3
{
  self->_airplaneMode = a3;
}

- (BOOL)batterySaverMode
{
  return self->_batterySaverMode;
}

- (void)setBatterySaverMode:(BOOL)a3
{
  self->_batterySaverMode = a3;
}

- (BOOL)locationServicesEnabled
{
  return self->_locationServicesEnabled;
}

- (void)setLocationServicesEnabled:(BOOL)a3
{
  self->_locationServicesEnabled = a3;
}

- (BOOL)restartRequired
{
  return self->_restartRequired;
}

- (void)setRestartRequired:(BOOL)a3
{
  self->_restartRequired = a3;
}

- (BOOL)locationSimulationInProgress
{
  return self->_locationSimulationInProgress;
}

- (void)setLocationSimulationInProgress:(BOOL)a3
{
  self->_locationSimulationInProgress = a3;
}

- (BOOL)allowSimulatedEvents
{
  return self->_allowSimulatedEvents;
}

- (void)setAllowSimulatedEvents:(BOOL)a3
{
  self->_allowSimulatedEvents = a3;
}

- (BOOL)deviceUnlockedSinceBoot
{
  return self->_deviceUnlockedSinceBoot;
}

- (void)setDeviceUnlockedSinceBoot:(BOOL)a3
{
  self->_deviceUnlockedSinceBoot = a3;
}

- (BOOL)hasKoreaCountryCode
{
  return self->_hasKoreaCountryCode;
}

- (void)setHasKoreaCountryCode:(BOOL)a3
{
  self->_hasKoreaCountryCode = a3;
}

- (BOOL)userLocationInsideKorea
{
  return self->_userLocationInsideKorea;
}

- (void)setUserLocationInsideKorea:(BOOL)a3
{
  self->_userLocationInsideKorea = a3;
}

@end