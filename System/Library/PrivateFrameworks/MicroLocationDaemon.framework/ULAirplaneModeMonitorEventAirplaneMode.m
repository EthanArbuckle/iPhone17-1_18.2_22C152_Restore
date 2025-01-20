@interface ULAirplaneModeMonitorEventAirplaneMode
- (BOOL)airplaneMode;
- (void)setAirplaneMode:(BOOL)a3;
@end

@implementation ULAirplaneModeMonitorEventAirplaneMode

- (BOOL)airplaneMode
{
  return self->_airplaneMode;
}

- (void)setAirplaneMode:(BOOL)a3
{
  self->_airplaneMode = a3;
}

@end