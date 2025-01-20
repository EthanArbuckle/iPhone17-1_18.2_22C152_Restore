@interface HDSHSleepApneaNotificationUITriggerObserver
- (HDSHSleepApneaNotificationUITriggerObserver)initWithProfile:(id)a3;
- (void)dealloc;
@end

@implementation HDSHSleepApneaNotificationUITriggerObserver

- (HDSHSleepApneaNotificationUITriggerObserver)initWithProfile:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDSHSleepApneaNotificationUITriggerObserver;
  v5 = [(HDSHSleepApneaNotificationUITriggerObserver *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    [(HDSHSleepApneaNotificationUITriggerObserver *)v6 _registerUITriggers];
  }

  return v6;
}

- (void)dealloc
{
  [(HDSHSleepApneaNotificationUITriggerObserver *)self _deregisterUITriggers];
  v3.receiver = self;
  v3.super_class = (Class)HDSHSleepApneaNotificationUITriggerObserver;
  [(HDSHSleepApneaNotificationUITriggerObserver *)&v3 dealloc];
}

- (void).cxx_destruct
{
}

@end