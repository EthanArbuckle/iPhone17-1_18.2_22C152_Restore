@interface ULDisplayMonitorEventDisplayState
- (BOOL)appInFocusChanged;
- (BOOL)displayOn;
- (BOOL)displayOnChanged;
- (BOOL)screenLocked;
- (BOOL)screenLockedChanged;
- (NSString)appInFocus;
- (void)setAppInFocus:(id)a3;
- (void)setAppInFocusChanged:(BOOL)a3;
- (void)setDisplayOn:(BOOL)a3;
- (void)setDisplayOnChanged:(BOOL)a3;
- (void)setScreenLocked:(BOOL)a3;
- (void)setScreenLockedChanged:(BOOL)a3;
@end

@implementation ULDisplayMonitorEventDisplayState

- (void).cxx_destruct
{
}

- (NSString)appInFocus
{
  return self->_appInFocus;
}

- (void)setScreenLockedChanged:(BOOL)a3
{
  self->_screenLockedChanged = a3;
}

- (void)setScreenLocked:(BOOL)a3
{
  self->_screenLocked = a3;
}

- (void)setDisplayOnChanged:(BOOL)a3
{
  self->_displayOnChanged = a3;
}

- (void)setDisplayOn:(BOOL)a3
{
  self->_displayOn = a3;
}

- (void)setAppInFocusChanged:(BOOL)a3
{
  self->_appInFocusChanged = a3;
}

- (void)setAppInFocus:(id)a3
{
}

- (BOOL)screenLockedChanged
{
  return self->_screenLockedChanged;
}

- (BOOL)displayOnChanged
{
  return self->_displayOnChanged;
}

- (BOOL)appInFocusChanged
{
  return self->_appInFocusChanged;
}

- (BOOL)displayOn
{
  return self->_displayOn;
}

- (BOOL)screenLocked
{
  return self->_screenLocked;
}

@end