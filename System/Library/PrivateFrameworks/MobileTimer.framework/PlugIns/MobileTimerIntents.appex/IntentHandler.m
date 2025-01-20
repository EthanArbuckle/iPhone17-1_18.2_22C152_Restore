@interface IntentHandler
- (IntentHandler)init;
- (MTAlarmManager)alarmManager;
- (id)handlerForIntent:(id)a3;
- (void)setAlarmManager:(id)a3;
@end

@implementation IntentHandler

- (IntentHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)IntentHandler;
  v2 = [(IntentHandler *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    alarmManager = v2->_alarmManager;
    v2->_alarmManager = (MTAlarmManager *)v3;
  }
  return v2;
}

- (id)handlerForIntent:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (objc_class *)MTCreateAlarmIntentHandler;
LABEL_9:
    id v6 = [v5 alloc];
    v7 = [(IntentHandler *)self alarmManager];
    id v8 = [v6 initWithAlarmManager:v7];

    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (objc_class *)MTUpdateAlarmIntentHandler;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = (objc_class *)MTToggleAlarmIntentHandler;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (objc_class *)MTGetAlarmsIntentHandler;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = ClocksIntentHandler;
LABEL_21:
    id v8 = objc_alloc_init(v10);
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = ClocksSingleIntentHandler;
    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = (__objc2_class *)MTCreateSingleTimerIntentHandler;
    goto LABEL_21;
  }
  id v8 = 0;
LABEL_10:

  return v8;
}

- (MTAlarmManager)alarmManager
{
  return self->_alarmManager;
}

- (void)setAlarmManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end