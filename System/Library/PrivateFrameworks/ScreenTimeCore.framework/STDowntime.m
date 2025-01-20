@interface STDowntime
- (void)setStartHour:(int64_t)a3 startMinute:(int64_t)a4 endHour:(int64_t)a5 endMinute:(int64_t)a6;
@end

@implementation STDowntime

- (void)setStartHour:(int64_t)a3 startMinute:(int64_t)a4 endHour:(int64_t)a5 endMinute:(int64_t)a6
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  v32 = [(STDowntime *)self managedObjectContext];
  v9 = (void *)MEMORY[0x1E4F1C9A8];
  v10 = [(STDowntime *)self calendarIdentifier];
  v11 = [v9 calendarWithIdentifier:v10];

  id v12 = objc_alloc(MEMORY[0x1E4F28E60]);
  v34 = v11;
  uint64_t v13 = [v11 maximumRangeOfUnit:512];
  v37 = objc_msgSend(v12, "initWithIndexesInRange:", v13, v14);
  v15 = objc_opt_new();
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v33 = self;
  v16 = [(STDowntime *)self schedule];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v49 objects:v58 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    v19 = 0;
    uint64_t v20 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v50 != v20) {
          objc_enumerationMutation(v16);
        }
        v22 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        uint64_t v23 = [v22 weekday];
        if ([v15 containsIndex:v23])
        {
          if (v19) {
            [v19 addObject:v22];
          }
          else {
            v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v22, 0);
          }
        }
        else
        {
          [v37 removeIndex:v23];
          [v15 addIndex:v23];
          [v22 setStartHour:a3];
          [v22 setStartMinute:a4];
          [v22 setEndHour:a5];
          [v22 setEndMinute:a6];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v49 objects:v58 count:16];
    }
    while (v18);
  }
  else
  {
    v19 = 0;
  }

  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __57__STDowntime_setStartHour_startMinute_endHour_endMinute___block_invoke;
  v42[3] = &unk_1E6BC7980;
  id v24 = v32;
  int64_t v45 = a3;
  int64_t v46 = a4;
  int64_t v47 = a5;
  int64_t v48 = a6;
  id v43 = v24;
  v44 = v33;
  [v37 enumerateIndexesUsingBlock:v42];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v25 = v19;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v38 objects:v57 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v39 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v30 = *(void *)(*((void *)&v38 + 1) + 8 * j);
        v31 = +[STLog screentime];
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v54 = "-[STDowntime setStartHour:startMinute:endHour:endMinute:]";
          __int16 v55 = 2112;
          uint64_t v56 = v30;
          _os_log_impl(&dword_1DA519000, v31, OS_LOG_TYPE_DEFAULT, "%{public}s: ScheduleToDelete (%@)", buf, 0x16u);
        }

        [v24 deleteObject:v30];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v38 objects:v57 count:16];
    }
    while (v27);
  }
}

void __57__STDowntime_setStartHour_startMinute_endHour_endMinute___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = [[STDailySchedule alloc] initWithContext:*(void *)(a1 + 32)];
  [(STDailySchedule *)v4 setWeekday:a2];
  [(STDailySchedule *)v4 setStartHour:*(void *)(a1 + 48)];
  [(STDailySchedule *)v4 setStartMinute:*(void *)(a1 + 56)];
  [(STDailySchedule *)v4 setEndHour:*(void *)(a1 + 64)];
  [(STDailySchedule *)v4 setEndMinute:*(void *)(a1 + 72)];
  [*(id *)(a1 + 40) addScheduleObject:v4];
}

@end