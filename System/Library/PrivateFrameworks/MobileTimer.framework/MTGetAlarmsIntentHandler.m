@interface MTGetAlarmsIntentHandler
- (void)confirmGetAlarms:(id)a3 completion:(id)a4;
- (void)handleGetAlarms:(id)a3 completion:(id)a4;
@end

@implementation MTGetAlarmsIntentHandler

- (void)confirmGetAlarms:(id)a3 completion:(id)a4
{
  id v5 = a4;
  v6 = [[MTGetAlarmsIntentResponse alloc] initWithCode:1 userActivity:0];
  (*((void (**)(id, MTGetAlarmsIntentResponse *))a4 + 2))(v5, v6);
}

- (void)handleGetAlarms:(id)a3 completion:(id)a4
{
  id v5 = a4;
  v6 = [(MTAlarmIntentHandler *)self alarmManager];
  v7 = [v6 alarmsIncludingSleepAlarm:1];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__MTGetAlarmsIntentHandler_handleGetAlarms_completion___block_invoke;
  v14[3] = &unk_1E5914D18;
  id v8 = v5;
  id v15 = v8;
  id v9 = (id)[v7 addFailureBlock:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__MTGetAlarmsIntentHandler_handleGetAlarms_completion___block_invoke_2;
  v12[3] = &unk_1E5914DB0;
  id v13 = v8;
  id v10 = v8;
  id v11 = (id)[v7 addSuccessBlock:v12];
}

void __55__MTGetAlarmsIntentHandler_handleGetAlarms_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = [[MTGetAlarmsIntentResponse alloc] initWithCode:5 userActivity:0];
  (*(void (**)(uint64_t, MTGetAlarmsIntentResponse *))(v1 + 16))(v1, v2);
}

void __55__MTGetAlarmsIntentHandler_handleGetAlarms_completion___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "na_map:", &__block_literal_global_31);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [[MTGetAlarmsIntentResponse alloc] initWithCode:4 userActivity:0];
  [(MTGetAlarmsIntentResponse *)v3 setAlarms:v4];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __55__MTGetAlarmsIntentHandler_handleGetAlarms_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 intentAlarm];
}

@end