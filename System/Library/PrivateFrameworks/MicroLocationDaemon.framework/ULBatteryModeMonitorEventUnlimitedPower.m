@interface ULBatteryModeMonitorEventUnlimitedPower
- (BOOL)unlimitedPower;
- (void)setUnlimitedPower:(BOOL)a3;
@end

@implementation ULBatteryModeMonitorEventUnlimitedPower

- (BOOL)unlimitedPower
{
  return self->_unlimitedPower;
}

- (void)setUnlimitedPower:(BOOL)a3
{
  self->_unlimitedPower = a3;
}

@end