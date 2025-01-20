@interface ULBatteryModeMonitorEventLowPowerMode
- (BOOL)lowPowerMode;
- (void)setLowPowerMode:(BOOL)a3;
@end

@implementation ULBatteryModeMonitorEventLowPowerMode

- (BOOL)lowPowerMode
{
  return self->_lowPowerMode;
}

- (void)setLowPowerMode:(BOOL)a3
{
  self->_lowPowerMode = a3;
}

@end