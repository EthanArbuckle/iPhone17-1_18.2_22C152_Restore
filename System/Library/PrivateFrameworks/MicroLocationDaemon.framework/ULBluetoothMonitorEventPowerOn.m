@interface ULBluetoothMonitorEventPowerOn
- (BOOL)powerOn;
- (void)setPowerOn:(BOOL)a3;
@end

@implementation ULBluetoothMonitorEventPowerOn

- (BOOL)powerOn
{
  return self->_powerOn;
}

- (void)setPowerOn:(BOOL)a3
{
  self->_powerOn = a3;
}

@end