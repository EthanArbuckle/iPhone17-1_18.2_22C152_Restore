@interface BTSmartRoutingModeDevice
- (char)mode;
- (unsigned)disableCount;
- (unsigned)enableCount;
- (void)setDisableCount:(unsigned int)a3;
- (void)setEnableCount:(unsigned int)a3;
- (void)setMode:(char)a3;
@end

@implementation BTSmartRoutingModeDevice

- (char)mode
{
  return self->_mode;
}

- (void)setMode:(char)a3
{
  self->_mode = a3;
}

- (unsigned)enableCount
{
  return self->_enableCount;
}

- (void)setEnableCount:(unsigned int)a3
{
  self->_enableCount = a3;
}

- (unsigned)disableCount
{
  return self->_disableCount;
}

- (void)setDisableCount:(unsigned int)a3
{
  self->_disableCount = a3;
}

@end