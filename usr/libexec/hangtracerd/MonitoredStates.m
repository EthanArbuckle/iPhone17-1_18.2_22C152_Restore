@interface MonitoredStates
+ (BOOL)supportsSecureCoding;
+ (id)sharedInstance;
- (BOOL)isImmersionLevelControllerPresentOnScreen;
- (MonitoredStates)init;
- (MonitoredStates)initWithCoder:(id)a3;
- (MonitoredStates)initWithImmersionLevelControllerPresentOnScreen:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setIsImmersionLevelControllerPresentOnScreen:(BOOL)a3;
@end

@implementation MonitoredStates

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100019518;
  block[3] = &unk_100051450;
  block[4] = a1;
  if (qword_100064260 != -1) {
    dispatch_once(&qword_100064260, block);
  }
  v2 = (void *)qword_100064258;

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MonitoredStates)init
{
  self->_isImmersionLevelControllerPresentOnScreen = 0;
  return self;
}

- (MonitoredStates)initWithImmersionLevelControllerPresentOnScreen:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MonitoredStates;
  result = [(MonitoredStates *)&v5 init];
  if (result) {
    result->_isImmersionLevelControllerPresentOnScreen = a3;
  }
  return result;
}

- (MonitoredStates)initWithCoder:(id)a3
{
  id v4 = [a3 decodeBoolForKey:@"isImmersionLevelControllerPresentOnScreen"];

  return [(MonitoredStates *)self initWithImmersionLevelControllerPresentOnScreen:v4];
}

- (void)encodeWithCoder:(id)a3
{
}

- (BOOL)isImmersionLevelControllerPresentOnScreen
{
  return self->_isImmersionLevelControllerPresentOnScreen;
}

- (void)setIsImmersionLevelControllerPresentOnScreen:(BOOL)a3
{
  self->_isImmersionLevelControllerPresentOnScreen = a3;
}

@end