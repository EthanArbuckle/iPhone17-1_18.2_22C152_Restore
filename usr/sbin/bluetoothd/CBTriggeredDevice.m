@interface CBTriggeredDevice
- (BOOL)present;
- (CBDevice)device;
- (unint64_t)triggerTicks;
- (unint64_t)uiTicks;
- (void)setDevice:(id)a3;
- (void)setPresent:(BOOL)a3;
- (void)setTriggerTicks:(unint64_t)a3;
- (void)setUiTicks:(unint64_t)a3;
@end

@implementation CBTriggeredDevice

- (CBDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (BOOL)present
{
  return self->_present;
}

- (void)setPresent:(BOOL)a3
{
  self->_present = a3;
}

- (unint64_t)triggerTicks
{
  return self->_triggerTicks;
}

- (void)setTriggerTicks:(unint64_t)a3
{
  self->_triggerTicks = a3;
}

- (unint64_t)uiTicks
{
  return self->_uiTicks;
}

- (void)setUiTicks:(unint64_t)a3
{
  self->_uiTicks = a3;
}

- (void).cxx_destruct
{
}

@end