@interface MTCreateAlarmIntentHandler
- (id)_alarmUserActivityWithIntent:(id)a3;
- (id)defaultRepeatScheduleForMTCreateAlarm:(id)a3;
- (void)confirmMTCreateAlarm:(id)a3 completion:(id)a4;
- (void)handleMTCreateAlarm:(id)a3 completion:(id)a4;
- (void)provideRepeatScheduleOptionsForMTCreateAlarm:(id)a3 withCompletion:(id)a4;
- (void)resolveDateComponentsForMTCreateAlarm:(id)a3 withCompletion:(id)a4;
- (void)resolveLabelForMTCreateAlarm:(id)a3 withCompletion:(id)a4;
- (void)resolveRepeatScheduleForMTCreateAlarm:(id)a3 withCompletion:(id)a4;
@end

@implementation MTCreateAlarmIntentHandler

- (void)resolveLabelForMTCreateAlarm:(id)a3 withCompletion:(id)a4
{
  id v11 = a3;
  v5 = (void (**)(id, uint64_t))a4;
  v6 = [v11 label];
  uint64_t v7 = [v6 length];

  v8 = (void *)MEMORY[0x1E4F30790];
  if (v7)
  {
    v9 = [v11 label];
    uint64_t v10 = [v8 successWithResolvedString:v9];
    v5[2](v5, v10);

    v5 = (void (**)(id, uint64_t))v10;
  }
  else
  {
    v9 = [MEMORY[0x1E4F30790] notRequired];
    v5[2](v5, (uint64_t)v9);
  }
}

- (void)resolveDateComponentsForMTCreateAlarm:(id)a3 withCompletion:(id)a4
{
  id v23 = a3;
  v5 = (void (**)(id, void *))a4;
  uint64_t v6 = [v23 time];
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    v8 = [v23 dateComponents];

    if (!v8)
    {
      v9 = (void *)MEMORY[0x1E4F1C9C8];
      uint64_t v10 = [v23 time];
      id v11 = [v10 identifier];
      [v11 doubleValue];
      v12 = objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");

      v13 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
      id v14 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
      [v14 setCalendar:v13];
      objc_msgSend(v14, "setHour:", objc_msgSend(v13, "component:fromDate:", 32, v12));
      objc_msgSend(v14, "setMinute:", objc_msgSend(v13, "component:fromDate:", 64, v12));
      [v23 setDateComponents:v14];
    }
  }
  uint64_t v15 = [v23 dateComponents];
  if (!v15) {
    goto LABEL_8;
  }
  v16 = (void *)v15;
  v17 = [v23 dateComponents];
  if ([v17 hour] == 0x7FFFFFFFFFFFFFFFLL)
  {

LABEL_8:
    v20 = [MEMORY[0x1E4F303E0] needsValue];
    v5[2](v5, v20);
    goto LABEL_9;
  }
  v18 = [v23 dateComponents];
  uint64_t v19 = [v18 minute];

  if (v19 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_8;
  }
  v21 = (void *)MEMORY[0x1E4F303E0];
  v20 = [v23 dateComponents];
  v22 = [v21 successWithResolvedDateComponents:v20];
  v5[2](v5, v22);

LABEL_9:
}

- (void)resolveRepeatScheduleForMTCreateAlarm:(id)a3 withCompletion:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (void (**)(id, void *))a4;
  uint64_t v7 = [v5 repeatSchedule];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    v9 = [v5 repeatSchedule];
    uint64_t v10 = objc_msgSend(v9, "na_map:", &__block_literal_global_12);

    v6[2](v6, v10);
  }
  else
  {
    id v11 = +[MTIntentRepeatDayResolutionResult notRequired];
    v13[0] = v11;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    v6[2](v6, v12);
  }
}

id __83__MTCreateAlarmIntentHandler_resolveRepeatScheduleForMTCreateAlarm_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[MTIntentRepeatDayResolutionResult successWithResolvedRepeatDay:a2];
}

- (id)defaultRepeatScheduleForMTCreateAlarm:(id)a3
{
  return MTRepeatDaysForAlarmRepeatSchedule(0);
}

- (void)provideRepeatScheduleOptionsForMTCreateAlarm:(id)a3 withCompletion:(id)a4
{
  id v10 = a4;
  v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  unint64_t v5 = [v4 firstWeekday] - 1;

  uint64_t v6 = MTRepeatDaysForAlarmRepeatSchedule(127);
  if (v5 >= [v6 count])
  {
    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }
  else
  {
    uint64_t v7 = objc_msgSend(v6, "subarrayWithRange:", v5, objc_msgSend(v6, "count") - v5);
    uint64_t v8 = objc_msgSend(v6, "subarrayWithRange:", 0, v5);
    v9 = [v7 arrayByAddingObjectsFromArray:v8];
    (*((void (**)(id, void *, void))v10 + 2))(v10, v9, 0);
  }
}

- (void)confirmMTCreateAlarm:(id)a3 completion:(id)a4
{
  uint64_t v6 = (void (**)(id, id))a4;
  id v7 = a3;
  uint64_t v8 = [MTCreateAlarmIntentResponse alloc];
  v9 = [(MTCreateAlarmIntentHandler *)self _alarmUserActivityWithIntent:v7];

  id v10 = [(MTCreateAlarmIntentResponse *)v8 initWithCode:1 userActivity:v9];
  v6[2](v6, v10);
}

- (void)handleMTCreateAlarm:(id)a3 completion:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  uint64_t v8 = [v6 time];
  if (v8)
  {

    goto LABEL_3;
  }
  uint64_t v14 = [v6 dateComponents];
  if (v14)
  {
    uint64_t v15 = (void *)v14;
    v16 = [v6 dateComponents];
    if ([v16 hour] == 0x7FFFFFFFFFFFFFFFLL)
    {
    }
    else
    {
      v38 = [v6 dateComponents];
      uint64_t v39 = [v38 minute];

      if (v39 != 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_3:
        v9 = objc_msgSend(v6, "dateComponents", v7);

        if (v9)
        {
          id v10 = [v6 dateComponents];
          id v11 = (void *)[v10 hour];

          v12 = [v6 dateComponents];
          uint64_t v13 = [v12 minute];
        }
        else
        {
          id v11 = [v6 time];

          if (!v11)
          {
            uint64_t v13 = 0;
            goto LABEL_11;
          }
          v17 = (void *)MEMORY[0x1E4F1C9C8];
          v18 = [v6 time];
          uint64_t v19 = [v18 identifier];
          [v19 doubleValue];
          v12 = objc_msgSend(v17, "dateWithTimeIntervalSinceReferenceDate:");

          v20 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
          id v11 = (void *)[v20 component:32 fromDate:v12];
          uint64_t v13 = [v20 component:64 fromDate:v12];
        }
LABEL_11:
        long long v53 = 0u;
        long long v54 = 0u;
        long long v52 = 0u;
        long long v51 = 0u;
        v21 = [v6 repeatSchedule];
        uint64_t v22 = [v21 countByEnumeratingWithState:&v51 objects:v55 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = 0;
          uint64_t v25 = *(void *)v52;
          do
          {
            for (uint64_t i = 0; i != v23; ++i)
            {
              if (*(void *)v52 != v25) {
                objc_enumerationMutation(v21);
              }
              v27 = [*(id *)(*((void *)&v51 + 1) + 8 * i) value];
              v24 |= [v27 integerValue];
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v51 objects:v55 count:16];
          }
          while (v23);
        }
        else
        {
          uint64_t v24 = 0;
        }

        v28 = +[MTAlarm alarmWithHour:v11 minute:v13];
        v29 = [v6 label];
        [v28 setTitle:v29];

        [v28 setRepeatSchedule:v24];
        id v30 = v28;
        v31 = [(MTAlarmIntentHandler *)self alarmManager];
        v32 = [v31 addAlarm:v30];

        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __61__MTCreateAlarmIntentHandler_handleMTCreateAlarm_completion___block_invoke;
        v47[3] = &unk_1E5915AF0;
        v47[4] = self;
        id v33 = v6;
        id v48 = v33;
        id v49 = v30;
        id v7 = v43;
        v34 = v43;
        v50 = v34;
        v35 = (MTCreateAlarmIntentResponse *)v30;
        id v36 = (id)[v32 addSuccessBlock:v47];
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __61__MTCreateAlarmIntentHandler_handleMTCreateAlarm_completion___block_invoke_2;
        v44[3] = &unk_1E5915B18;
        v44[4] = self;
        id v45 = v33;
        v46 = v34;
        id v37 = (id)[v32 addFailureBlock:v44];

        goto LABEL_25;
      }
    }
  }
  v40 = MTLogForCategory(3);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
    -[MTCreateAlarmIntentHandler handleMTCreateAlarm:completion:]((uint64_t)self, v40);
  }

  v41 = [MTCreateAlarmIntentResponse alloc];
  v42 = [(MTCreateAlarmIntentHandler *)self _alarmUserActivityWithIntent:v6];
  v35 = [(MTCreateAlarmIntentResponse *)v41 initWithCode:5 userActivity:v42];

  v7[2](v7, v35);
LABEL_25:
}

void __61__MTCreateAlarmIntentHandler_handleMTCreateAlarm_completion___block_invoke(uint64_t a1)
{
  v2 = [MTCreateAlarmIntentResponse alloc];
  v3 = [*(id *)(a1 + 32) _alarmUserActivityWithIntent:*(void *)(a1 + 40)];
  unint64_t v5 = [(MTCreateAlarmIntentResponse *)v2 initWithCode:4 userActivity:v3];

  v4 = [*(id *)(a1 + 48) intentAlarm];
  [(MTCreateAlarmIntentResponse *)v5 setAlarm:v4];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __61__MTCreateAlarmIntentHandler_handleMTCreateAlarm_completion___block_invoke_2(uint64_t a1)
{
  v2 = [MTCreateAlarmIntentResponse alloc];
  v3 = [*(id *)(a1 + 32) _alarmUserActivityWithIntent:*(void *)(a1 + 40)];
  v4 = [(MTCreateAlarmIntentResponse *)v2 initWithCode:5 userActivity:v3];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)_alarmUserActivityWithIntent:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F29230];
  id v4 = a3;
  unint64_t v5 = [v3 mtUserActivityWithActivityType:@"com.apple.clock.alarm"];
  id v6 = objc_opt_class();
  id v7 = [v4 identifier];
  uint64_t v8 = [v4 time];
  v9 = [v8 displayString];
  id v10 = [v4 label];

  id v11 = [v6 createUserInfoWithIntentName:v7 alarmIDString:0 time:v9 label:v10];

  [v5 setUserInfo:v11];
  return v5;
}

- (void)handleMTCreateAlarm:(uint64_t)a1 completion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19CC95000, a2, OS_LOG_TYPE_ERROR, "%{public}@ createAlarm requested without time", (uint8_t *)&v2, 0xCu);
}

@end