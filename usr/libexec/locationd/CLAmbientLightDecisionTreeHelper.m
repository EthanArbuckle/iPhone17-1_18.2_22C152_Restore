@interface CLAmbientLightDecisionTreeHelper
- (CLAmbientLightDecisionTreeHelper)initWithQueue:(id)a3 decisionTreeObj:(void *)a4;
- (void)fAmbientLightDecisionTree;
- (void)shutdown;
@end

@implementation CLAmbientLightDecisionTreeHelper

- (CLAmbientLightDecisionTreeHelper)initWithQueue:(id)a3 decisionTreeObj:(void *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CLAmbientLightDecisionTreeHelper;
  v6 = [(CLAmbientLightDecisionTreeHelper *)&v9 init];
  if (v6)
  {
    uint64_t v7 = IOHIDEventSystemClientCreateWithType();
    v6->_hidClientRef = (__IOHIDEventSystemClient *)v7;
    v6->_hidEventQueue = (OS_dispatch_queue *)a3;
    v6->_fAmbientLightDecisionTree = a4;
    if (v7)
    {
      v10[0] = @"PrimaryUsagePage";
      v10[1] = @"PrimaryUsage";
      v11[0] = &off_102393260;
      v11[1] = &off_102393278;
      +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
      IOHIDEventSystemClientSetMatching();
      IOHIDEventSystemClientScheduleWithDispatchQueue();
      IOHIDEventSystemClientRegisterEventBlock();
    }
  }
  return v6;
}

- (void)shutdown
{
  p_hidClientRef = &self->_hidClientRef;
  if (self->_hidClientRef)
  {
    IOHIDEventSystemClientUnscheduleFromDispatchQueue();
    CFRelease(self->_hidClientRef);
    *p_hidClientRef = 0;
    p_hidClientRef[1] = 0;
  }
  self->_fAmbientLightDecisionTree = 0;
}

- (void)fAmbientLightDecisionTree
{
  return self->_fAmbientLightDecisionTree;
}

@end