@interface WFAlarmTrigger(BiomeContext)
- (id)publisherWithScheduler:()BiomeContext;
- (uint64_t)alarmEventForCurrentAlarmState;
- (void)shouldFireInResponseToEvent:()BiomeContext triggerIdentifier:completion:;
@end

@implementation WFAlarmTrigger(BiomeContext)

- (uint64_t)alarmEventForCurrentAlarmState
{
  uint64_t v1 = [a1 alarmState];
  if (v1 == 2) {
    return 1;
  }
  else {
    return 2 * (v1 == 1);
  }
}

- (void)shouldFireInResponseToEvent:()BiomeContext triggerIdentifier:completion:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v7 = a5;
  v8 = [a3 eventBody];
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v9 = getWFTriggersLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315394;
      v19 = "-[WFAlarmTrigger(BiomeContext) shouldFireInResponseToEvent:triggerIdentifier:completion:]";
      __int16 v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_1C7D7E000, v9, OS_LOG_TYPE_DEFAULT, "%s Received alarm event %@ for trigger", (uint8_t *)&v18, 0x16u);
    }

    uint64_t v10 = [a1 alarmType];
    switch(v10)
    {
      case 2:
        if ([v8 isSleepAlarm])
        {
          uint64_t v12 = [v8 eventType];
          BOOL v13 = v12 == [a1 alarmEventForCurrentAlarmState];
        }
        else
        {
          BOOL v13 = 0;
        }
        v7[2](v7, v13);
        break;
      case 1:
        v14 = [a1 alarmIDs];
        v15 = [v8 alarmID];
        if ([v14 containsObject:v15])
        {
          uint64_t v16 = [v8 eventType];
          BOOL v17 = v16 == [a1 alarmEventForCurrentAlarmState];
        }
        else
        {
          BOOL v17 = 0;
        }
        v7[2](v7, v17);

        break;
      case 0:
        v7[2](v7, [v8 eventType] == objc_msgSend(a1, "alarmEventForCurrentAlarmState"));
        break;
    }
  }
  else
  {

    v11 = getWFTriggersLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315138;
      v19 = "-[WFAlarmTrigger(BiomeContext) shouldFireInResponseToEvent:triggerIdentifier:completion:]";
      _os_log_impl(&dword_1C7D7E000, v11, OS_LOG_TYPE_DEFAULT, "%s No Alarm event received for trigger; not firing.",
        (uint8_t *)&v18,
        0xCu);
    }

    v7[2](v7, 0);
    v8 = 0;
  }
}

- (id)publisherWithScheduler:()BiomeContext
{
  v3 = (void *)MEMORY[0x1E4F504C8];
  id v4 = a3;
  v5 = [v3 alarmStream];
  v6 = [v5 publisher];
  v7 = [v6 subscribeOn:v4];

  return v7;
}

@end