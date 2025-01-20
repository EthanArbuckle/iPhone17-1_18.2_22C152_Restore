@interface SBIdleTimerFactory
+ (id)_attentionAwareTimer;
+ (id)idleTimerForDescriptor:(id)a3 didLogDescriptor:(BOOL *)a4;
@end

@implementation SBIdleTimerFactory

+ (id)idleTimerForDescriptor:(id)a3 didLogDescriptor:(BOOL *)a4
{
  id v6 = a3;
  *a4 = 0;
  unint64_t v7 = [v6 timerMode];
  if (v7 >= 3)
  {
    if (v7 == 3) {
      v8 = objc_alloc_init(SBDisabledIdleTimer);
    }
    else {
      v8 = 0;
    }
  }
  else
  {
    v8 = [a1 _attentionAwareTimer];
    v9 = [(SBDisabledIdleTimer *)v8 descriptor];
    char v10 = [v9 isEqual:v6];

    if ((v10 & 1) == 0)
    {
      [(SBDisabledIdleTimer *)v8 setDescriptor:v6];
      v11 = SBLogIdleTimer();
      [v6 logAuditReasons:v11];

      *a4 = 1;
    }
  }

  return v8;
}

+ (id)_attentionAwareTimer
{
  if (_attentionAwareTimer_onceToken != -1) {
    dispatch_once(&_attentionAwareTimer_onceToken, &__block_literal_global_125);
  }
  v2 = (void *)_attentionAwareTimer_idleTimer;
  return v2;
}

void __42__SBIdleTimerFactory__attentionAwareTimer__block_invoke()
{
  v0 = [[SBBacklightIdleTimer alloc] initWithConfigurationIdentifier:@"com.apple.springboard.GlobalBacklightIdleTimer"];
  v1 = (void *)_attentionAwareTimer_idleTimer;
  _attentionAwareTimer_idleTimer = (uint64_t)v0;
}

@end