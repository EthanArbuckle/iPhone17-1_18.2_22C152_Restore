@interface DADeviceConnectionConfigurator
+ (id)sharedInstance;
- (BOOL)isSessionModeOveridden;
- (int)mode;
- (int)overrideSessionMode;
- (void)overrideSessionModeWithMode:(int)a3;
- (void)setIsSessionModeOveridden:(BOOL)a3;
- (void)setOverrideSessionMode:(int)a3;
@end

@implementation DADeviceConnectionConfigurator

+ (id)sharedInstance
{
  if (qword_1000228A0 != -1) {
    dispatch_once(&qword_1000228A0, &stru_100018608);
  }
  v2 = (void *)qword_100022898;

  return v2;
}

- (int)mode
{
  if ([(DADeviceConnectionConfigurator *)self isSessionModeOveridden])
  {
    return [(DADeviceConnectionConfigurator *)self overrideSessionMode];
  }
  else if (+[CBSUtilities isSSRBootIntentSet])
  {
    return 2;
  }
  else
  {
    return 0;
  }
}

- (void)overrideSessionModeWithMode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(DADeviceConnectionConfigurator *)self setIsSessionModeOveridden:1];

  [(DADeviceConnectionConfigurator *)self setOverrideSessionMode:v3];
}

- (BOOL)isSessionModeOveridden
{
  return self->_isSessionModeOveridden;
}

- (void)setIsSessionModeOveridden:(BOOL)a3
{
  self->_isSessionModeOveridden = a3;
}

- (int)overrideSessionMode
{
  return self->_overrideSessionMode;
}

- (void)setOverrideSessionMode:(int)a3
{
  self->_overrideSessionMode = a3;
}

@end