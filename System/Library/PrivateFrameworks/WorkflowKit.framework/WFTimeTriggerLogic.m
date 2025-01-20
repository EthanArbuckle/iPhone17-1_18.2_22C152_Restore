@interface WFTimeTriggerLogic
+ (id)adjustedTime:(id)a3 byOffset:(unint64_t)a4;
+ (id)nextFireDateForTrigger:(id)a3 currentDate:(id)a4 currentSunriseTime:(id)a5 currentSunsetTime:(id)a6;
+ (id)nextFireDateFromNowWithTrigger:(id)a3 currentSunriseTime:(id)a4 currentSunsetTime:(id)a5;
+ (int64_t)nextWeekdayFromDaysOfWeek:(id)a3 timeComponents:(id)a4 currentDate:(id)a5 calendar:(id)a6;
- (id)nextFireDateForTrigger:(id)a3;
@end

@implementation WFTimeTriggerLogic

+ (id)adjustedTime:(id)a3 byOffset:(unint64_t)a4
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v7 = v6;
  switch(a4)
  {
    case 0uLL:
      uint64_t v8 = 32;
      uint64_t v9 = -4;
      goto LABEL_18;
    case 1uLL:
      uint64_t v8 = 32;
      uint64_t v9 = -3;
      goto LABEL_18;
    case 2uLL:
      uint64_t v8 = 32;
      uint64_t v9 = -2;
      goto LABEL_18;
    case 3uLL:
      uint64_t v8 = 32;
      uint64_t v9 = -1;
      goto LABEL_18;
    case 4uLL:
      uint64_t v8 = 64;
      uint64_t v9 = -45;
      goto LABEL_18;
    case 5uLL:
      uint64_t v8 = 64;
      uint64_t v9 = -30;
      goto LABEL_18;
    case 6uLL:
      uint64_t v8 = 64;
      uint64_t v9 = -15;
      goto LABEL_18;
    case 7uLL:
      id v11 = v5;
      goto LABEL_19;
    case 8uLL:
      uint64_t v8 = 64;
      uint64_t v9 = 15;
      goto LABEL_18;
    case 9uLL:
      uint64_t v8 = 64;
      uint64_t v9 = 30;
      goto LABEL_18;
    case 0xAuLL:
      uint64_t v8 = 64;
      uint64_t v9 = 45;
      goto LABEL_18;
    case 0xBuLL:
      uint64_t v8 = 32;
      uint64_t v9 = 1;
      goto LABEL_18;
    case 0xCuLL:
      uint64_t v8 = 32;
      uint64_t v9 = 2;
      goto LABEL_18;
    case 0xDuLL:
      uint64_t v8 = 32;
      uint64_t v9 = 3;
      goto LABEL_18;
    case 0xEuLL:
      uint64_t v8 = 32;
      uint64_t v9 = 4;
LABEL_18:
      id v11 = [v6 dateByAddingUnit:v8 value:v9 toDate:v5 options:0];
LABEL_19:
      v10 = v11;
      break;
    default:
      v10 = 0;
      break;
  }
  v12 = [v7 components:96 fromDate:v10];

  return v12;
}

+ (int64_t)nextWeekdayFromDaysOfWeek:(id)a3 timeComponents:(id)a4 currentDate:(id)a5 calendar:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = a3;
  uint64_t v13 = [v11 component:512 fromDate:v10];
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  v25 = __84__WFTimeTriggerLogic_nextWeekdayFromDaysOfWeek_timeComponents_currentDate_calendar___block_invoke;
  v26 = &unk_1E654D968;
  id v27 = v11;
  id v28 = v10;
  id v29 = v9;
  uint64_t v30 = v13;
  id v14 = v9;
  id v15 = v10;
  id v16 = v11;
  v17 = objc_msgSend(v12, "if_flatMap:", &v23);

  v18 = objc_msgSend(v17, "sortedArrayUsingSelector:", sel_compare_, v23, v24, v25, v26);
  v19 = [v18 firstObject];
  uint64_t v20 = [v19 integerValue];

  if (v20 % 7) {
    int64_t v21 = v20 % 7;
  }
  else {
    int64_t v21 = 7;
  }

  return v21;
}

id __84__WFTimeTriggerLogic_nextWeekdayFromDaysOfWeek_timeComponents_currentDate_calendar___block_invoke(uint64_t a1, void *a2)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 integerValue];
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(a1 + 56);
  if (v3 >= v5)
  {
    if (v3 == v5)
    {
      v6 = [*(id *)(a1 + 32) nextDateAfterDate:*(void *)(a1 + 40) matchingComponents:*(void *)(a1 + 48) options:5120];
      if ([*(id *)(a1 + 32) isDate:v6 inSameDayAsDate:*(void *)(a1 + 40)])
      {
        id v9 = [NSNumber numberWithInteger:v4];
        id v14 = v9;
        id v10 = &v14;
      }
      else
      {
        id v9 = [NSNumber numberWithInteger:v4 + 7];
        id v15 = v9;
        id v10 = &v15;
      }
      id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];

      goto LABEL_10;
    }
    v6 = [NSNumber numberWithInteger:v3];
    uint64_t v13 = v6;
    v7 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v8 = &v13;
  }
  else
  {
    v6 = [NSNumber numberWithInteger:v3 + 7];
    v16[0] = v6;
    v7 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v8 = (void **)v16;
  }
  id v11 = [v7 arrayWithObjects:v8 count:1];
LABEL_10:

  return v11;
}

+ (id)nextFireDateForTrigger:(id)a3 currentDate:(id)a4 currentSunriseTime:(id)a5 currentSunsetTime:(id)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  if ([v10 event] == 2)
  {
    id v15 = [v10 time];

    if (v15)
    {
      id v16 = [v10 time];
      v17 = [v16 copy];

      goto LABEL_13;
    }
    v17 = getWFTriggersLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      int v34 = 136315394;
      v35 = "+[WFTimeTriggerLogic nextFireDateForTrigger:currentDate:currentSunriseTime:currentSunsetTime:]";
      __int16 v36 = 2112;
      uint64_t v37 = (uint64_t)v10;
      int64_t v21 = "%s Can't calculate nextFireDate; No time set for %@";
LABEL_23:
      id v29 = v17;
      os_log_type_t v30 = OS_LOG_TYPE_FAULT;
      uint32_t v31 = 22;
LABEL_34:
      _os_log_impl(&dword_1C7F0A000, v29, v30, v21, (uint8_t *)&v34, v31);
      goto LABEL_35;
    }
    goto LABEL_35;
  }
  if (![v10 event])
  {
    if (v12)
    {
      uint64_t v18 = [v10 timeOffset];
      id v19 = a1;
      id v20 = v12;
      goto LABEL_12;
    }
    v17 = getWFTriggersLogObject();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_35;
    }
    int v34 = 136315138;
    v35 = "+[WFTimeTriggerLogic nextFireDateForTrigger:currentDate:currentSunriseTime:currentSunsetTime:]";
    int64_t v21 = "%s Can't calculate nextFireDate without sunrise time";
LABEL_33:
    id v29 = v17;
    os_log_type_t v30 = OS_LOG_TYPE_ERROR;
    uint32_t v31 = 12;
    goto LABEL_34;
  }
  if ([v10 event] != 1)
  {
    v17 = getWFTriggersLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      int v34 = 136315394;
      v35 = "+[WFTimeTriggerLogic nextFireDateForTrigger:currentDate:currentSunriseTime:currentSunsetTime:]";
      __int16 v36 = 2048;
      uint64_t v37 = [v10 event];
      int64_t v21 = "%s Unhandled time trigger event: %ld; can't calculate nextFireDate";
      goto LABEL_23;
    }
LABEL_35:
    id v27 = 0;
    goto LABEL_36;
  }
  if (!v13)
  {
    v17 = getWFTriggersLogObject();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_35;
    }
    int v34 = 136315138;
    v35 = "+[WFTimeTriggerLogic nextFireDateForTrigger:currentDate:currentSunriseTime:currentSunsetTime:]";
    int64_t v21 = "%s Can't calculate nextFireDate without sunset time";
    goto LABEL_33;
  }
  uint64_t v18 = [v10 timeOffset];
  id v19 = a1;
  id v20 = v13;
LABEL_12:
  v17 = [v19 adjustedTime:v20 byOffset:v18];
LABEL_13:
  if ([v10 mode] != 1)
  {
    uint64_t v24 = [v10 daysOfWeek];
    uint64_t v25 = [v24 count];

    if (v25)
    {
      uint64_t v23 = [v10 daysOfWeek];
      id v26 = [v17 copy];
      -[NSObject setWeekday:](v17, "setWeekday:", [a1 nextWeekdayFromDaysOfWeek:v23 timeComponents:v26 currentDate:v11 calendar:v14]);

      goto LABEL_18;
    }
    v32 = getWFTriggersLogObject();
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  v22 = [v10 dayOfMonth];

  if (!v22)
  {
    v32 = getWFTriggersLogObject();
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
    {
LABEL_28:

      goto LABEL_35;
    }
LABEL_27:
    int v34 = 136315394;
    v35 = "+[WFTimeTriggerLogic nextFireDateForTrigger:currentDate:currentSunriseTime:currentSunsetTime:]";
    __int16 v36 = 2112;
    uint64_t v37 = (uint64_t)v10;
    _os_log_impl(&dword_1C7F0A000, v32, OS_LOG_TYPE_FAULT, "%s Can't calculate nextFireDate; No days of week set for %@",
      (uint8_t *)&v34,
      0x16u);
    goto LABEL_28;
  }
  uint64_t v23 = [v10 dayOfMonth];
  -[NSObject setDay:](v17, "setDay:", [v23 integerValue]);
LABEL_18:

  id v27 = [v14 nextDateAfterDate:v11 matchingComponents:v17 options:5120];
  id v28 = getWFTriggersLogObject();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    int v34 = 136315650;
    v35 = "+[WFTimeTriggerLogic nextFireDateForTrigger:currentDate:currentSunriseTime:currentSunsetTime:]";
    __int16 v36 = 2112;
    uint64_t v37 = (uint64_t)v10;
    __int16 v38 = 2112;
    v39 = v27;
    _os_log_impl(&dword_1C7F0A000, v28, OS_LOG_TYPE_INFO, "%s nextFireDate for trigger (%@): %@", (uint8_t *)&v34, 0x20u);
  }

LABEL_36:
  return v27;
}

+ (id)nextFireDateFromNowWithTrigger:(id)a3 currentSunriseTime:(id)a4 currentSunsetTime:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_opt_new();
  id v12 = [a1 nextFireDateForTrigger:v10 currentDate:v11 currentSunriseTime:v9 currentSunsetTime:v8];

  return v12;
}

- (id)nextFireDateForTrigger:(id)a3
{
  return 0;
}

@end