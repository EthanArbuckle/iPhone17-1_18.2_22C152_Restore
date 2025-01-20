@interface _MNArrivalUpdaterDetails
- (BOOL)isEVCharging;
- (BOOL)isInParkingDetectionRegion;
- (MNEVChargingStateMonitor)evChargingStateMonitor;
- (MNNavigationSessionState)navigationSessionState;
- (void)setEvChargingStateMonitor:(id)a3;
- (void)setIsEVCharging:(BOOL)a3;
- (void)setIsInParkingDetectionRegion:(BOOL)a3;
- (void)setNavigationSessionState:(id)a3;
@end

@implementation _MNArrivalUpdaterDetails

- (MNNavigationSessionState)navigationSessionState
{
  return self->_navigationSessionState;
}

- (void)setNavigationSessionState:(id)a3
{
}

- (BOOL)isEVCharging
{
  return self->_isEVCharging;
}

- (void)setIsEVCharging:(BOOL)a3
{
  self->_isEVCharging = a3;
}

- (MNEVChargingStateMonitor)evChargingStateMonitor
{
  return self->_evChargingStateMonitor;
}

- (void)setEvChargingStateMonitor:(id)a3
{
}

- (BOOL)isInParkingDetectionRegion
{
  return self->_isInParkingDetectionRegion;
}

- (void)setIsInParkingDetectionRegion:(BOOL)a3
{
  self->_isInParkingDetectionRegion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evChargingStateMonitor, 0);
  objc_storeStrong((id *)&self->_navigationSessionState, 0);
}

@end