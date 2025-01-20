@interface ULDisplayMonitorEventDisplayState_OSX
- (BOOL)clamshellMode;
- (BOOL)clamshellModeChanged;
- (BOOL)screenLocked;
- (BOOL)screenLockedChanged;
- (BOOL)screenOn;
- (BOOL)screenOnChanged;
- (void)setClamshellMode:(BOOL)a3;
- (void)setClamshellModeChanged:(BOOL)a3;
- (void)setScreenLocked:(BOOL)a3;
- (void)setScreenLockedChanged:(BOOL)a3;
- (void)setScreenOn:(BOOL)a3;
- (void)setScreenOnChanged:(BOOL)a3;
@end

@implementation ULDisplayMonitorEventDisplayState_OSX

- (BOOL)screenOn
{
  return self->_screenOn;
}

- (void)setScreenOn:(BOOL)a3
{
  self->_screenOn = a3;
}

- (BOOL)screenOnChanged
{
  return self->_screenOnChanged;
}

- (void)setScreenOnChanged:(BOOL)a3
{
  self->_screenOnChanged = a3;
}

- (BOOL)clamshellMode
{
  return self->_clamshellMode;
}

- (void)setClamshellMode:(BOOL)a3
{
  self->_clamshellMode = a3;
}

- (BOOL)clamshellModeChanged
{
  return self->_clamshellModeChanged;
}

- (void)setClamshellModeChanged:(BOOL)a3
{
  self->_clamshellModeChanged = a3;
}

- (BOOL)screenLocked
{
  return self->_screenLocked;
}

- (void)setScreenLocked:(BOOL)a3
{
  self->_screenLocked = a3;
}

- (BOOL)screenLockedChanged
{
  return self->_screenLockedChanged;
}

- (void)setScreenLockedChanged:(BOOL)a3
{
  self->_screenLockedChanged = a3;
}

@end