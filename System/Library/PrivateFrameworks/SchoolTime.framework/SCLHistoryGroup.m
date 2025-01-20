@interface SCLHistoryGroup
+ (id)historyGroupsByPrioritizingSchedule:(id)a3 forDate:(id)a4 inCalendar:(id)a5 items:(id)a6;
- (BOOL)canContainUnlockHistoryItem:(id)a3;
- (NSCalendar)calendar;
- (NSDate)referenceDate;
- (NSMutableArray)items;
- (SCLHistoryGroup)initWithEffectiveSchedule:(id)a3 calendar:(id)a4 referenceDate:(id)a5;
- (SCLSchedule)effectiveSchedule;
- (void)setItems:(id)a3;
@end

@implementation SCLHistoryGroup

+ (id)historyGroupsByPrioritizingSchedule:(id)a3 forDate:(id)a4 inCalendar:(id)a5 items:(id)a6
{
  v49[3] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (objc_class *)MEMORY[0x263EFF980];
  id v13 = a6;
  id v14 = objc_alloc_init(v12);
  v15 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
  v16 = [MEMORY[0x263EFF9C0] set];
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __80__SCLHistoryGroup_historyGroupsByPrioritizingSchedule_forDate_inCalendar_items___block_invoke;
  v44[3] = &unk_2648AC388;
  id v17 = v16;
  id v45 = v17;
  id v41 = v15;
  id v46 = v41;
  id v18 = v9;
  id v47 = v18;
  id v19 = v14;
  id v48 = v19;
  [v13 enumerateObjectsUsingBlock:v44];

  [v19 enumerateObjectsUsingBlock:&__block_literal_global_1];
  v20 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"referenceDate" ascending:0];
  v21 = (void *)MEMORY[0x263F08B30];
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __80__SCLHistoryGroup_historyGroupsByPrioritizingSchedule_forDate_inCalendar_items___block_invoke_5;
  v42[3] = &unk_2648AC3F0;
  id v22 = v17;
  id v43 = v22;
  v23 = [v21 sortDescriptorWithKey:0 ascending:1 comparator:v42];
  v24 = v10;
  v25 = [MEMORY[0x263F08B30] sortDescriptorWithKey:0 ascending:1 comparator:&__block_literal_global_43];
  v49[0] = v20;
  v49[1] = v23;
  v49[2] = v25;
  v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:3];
  [v19 sortUsingDescriptors:v26];

  uint64_t v27 = [v11 component:512 fromDate:v24];
  if ([v18 isScheduledForDay:v27])
  {
    uint64_t v28 = [v19 firstObject];
    v29 = v11;
    v30 = (void *)v28;
    v40 = v29;
    v31 = [v29 startOfDayForDate:v24];
    v39 = [v30 referenceDate];
    if (!v30
      || ![v22 containsObject:v30]
      || ([v40 isDate:v31 inSameDayAsDate:v39] & 1) == 0)
    {
      v38 = v24;
      v32 = [SCLRecurrenceSchedule alloc];
      v33 = [v18 recurrencesForDay:v27];
      v34 = [(SCLRecurrenceSchedule *)v32 initWithRecurrences:v33];

      v35 = [[SCLHistoryGroup alloc] initWithEffectiveSchedule:v34 calendar:v40 referenceDate:v31];
      [v19 insertObject:v35 atIndex:0];

      v24 = v38;
    }

    id v11 = v40;
  }
  id v36 = v19;

  return v36;
}

void __80__SCLHistoryGroup_historyGroupsByPrioritizingSchedule_forDate_inCalendar_items___block_invoke(id *a1, void *a2)
{
  v50[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v44 = 0;
  id v45 = (id *)&v44;
  uint64_t v46 = 0x3032000000;
  id v47 = __Block_byref_object_copy_;
  id v48 = __Block_byref_object_dispose_;
  id v49 = 0;
  id v4 = a1[4];
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __80__SCLHistoryGroup_historyGroupsByPrioritizingSchedule_forDate_inCalendar_items___block_invoke_25;
  v41[3] = &unk_2648AC360;
  id v5 = v3;
  id v42 = v5;
  id v43 = &v44;
  [v4 enumerateObjectsUsingBlock:v41];
  id v6 = v45[5];
  if (!v6)
  {
    v7 = [v5 unlockedInterval];
    v8 = [v7 startDate];

    id v9 = [v5 calendar];
    v37 = [v9 startOfDayForDate:v8];

    id v10 = [SCLHistoryGroupKey alloc];
    id v11 = [v5 calendar];
    id v36 = [(SCLHistoryGroupKey *)v10 initWithCalendar:v11 referenceDate:v37];

    id v12 = [a1[5] objectForKey:v36];
    if (!v12)
    {
      id v12 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      [a1[5] setObject:v12 forKey:v36];
    }
    id v13 = [v5 calendar];
    uint64_t v14 = [v13 component:512 fromDate:v8];

    v15 = [a1[6] recurrencesForDay:v14];
    if ([v15 count])
    {
      v16 = [SCLRecurrenceSchedule alloc];
      id v17 = [a1[6] recurrencesForDay:v14];
      id v18 = [(SCLRecurrenceSchedule *)v16 initWithRecurrences:v17];

      id v19 = [SCLHistoryGroup alloc];
      v20 = [v5 calendar];
      v21 = [(SCLHistoryGroup *)v19 initWithEffectiveSchedule:v18 calendar:v20 referenceDate:v37];

      if ([(SCLHistoryGroup *)v21 canContainUnlockHistoryItem:v5])
      {
        objc_storeStrong(v45 + 5, v21);
        [a1[4] addObject:v45[5]];
        [v12 addObject:v45[5]];
        [a1[7] addObject:v45[5]];
      }
    }
    if (!v45[5])
    {
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = __80__SCLHistoryGroup_historyGroupsByPrioritizingSchedule_forDate_inCalendar_items___block_invoke_2;
      v38[3] = &unk_2648AC360;
      id v22 = v5;
      id v39 = v22;
      v40 = &v44;
      [v12 enumerateObjectsUsingBlock:v38];

      if (!v45[5])
      {
        v23 = [SCLTimeInterval alloc];
        v24 = [v22 scheduleStartTime];
        v25 = [v22 scheduleEndTime];
        v26 = [(SCLTimeInterval *)v23 initWithStartTime:v24 endTime:v25];

        uint64_t v27 = [[SCLScheduleRecurrence alloc] initWithTimeInterval:v26 day:v14];
        uint64_t v28 = [SCLRecurrenceSchedule alloc];
        v50[0] = v27;
        v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:1];
        v30 = [(SCLRecurrenceSchedule *)v28 initWithRecurrences:v29];

        v31 = [SCLHistoryGroup alloc];
        v32 = [v22 calendar];
        uint64_t v33 = [(SCLHistoryGroup *)v31 initWithEffectiveSchedule:v30 calendar:v32 referenceDate:v37];
        id v34 = v45[5];
        v45[5] = (id)v33;

        [v12 addObject:v45[5]];
        [a1[7] addObject:v45[5]];
      }
    }

    id v6 = v45[5];
  }
  v35 = [v6 items];
  [v35 addObject:v5];

  _Block_object_dispose(&v44, 8);
}

void __80__SCLHistoryGroup_historyGroupsByPrioritizingSchedule_forDate_inCalendar_items___block_invoke_25(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ([v6 canContainUnlockHistoryItem:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

void __80__SCLHistoryGroup_historyGroupsByPrioritizingSchedule_forDate_inCalendar_items___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ([v6 canContainUnlockHistoryItem:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

void __80__SCLHistoryGroup_historyGroupsByPrioritizingSchedule_forDate_inCalendar_items___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = [a2 items];
  [v2 sortUsingComparator:&__block_literal_global_36];
}

uint64_t __80__SCLHistoryGroup_historyGroupsByPrioritizingSchedule_forDate_inCalendar_items___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 unlockedInterval];
  id v6 = [v5 startDate];
  v7 = [v4 unlockedInterval];

  v8 = [v7 startDate];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

uint64_t __80__SCLHistoryGroup_historyGroupsByPrioritizingSchedule_forDate_inCalendar_items___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  id v7 = a3;
  LODWORD(v6) = [v6 containsObject:v5];
  int v8 = [*(id *)(a1 + 32) containsObject:v7];

  if (v6 == v8)
  {
    uint64_t v9 = 0;
  }
  else if ([*(id *)(a1 + 32) containsObject:v5])
  {
    uint64_t v9 = -1;
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

uint64_t __80__SCLHistoryGroup_historyGroupsByPrioritizingSchedule_forDate_inCalendar_items___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 items];
  uint64_t v6 = [v5 firstObject];

  id v7 = [v4 items];

  uint64_t v8 = [v7 firstObject];

  if (v6 | v8) {
    uint64_t v9 = -1;
  }
  else {
    uint64_t v9 = 0;
  }
  if (v6) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = v9;
  }
  if (v6 && v8)
  {
    id v11 = [(id)v6 unlockedInterval];
    id v12 = [v11 startDate];
    id v13 = [(id)v8 unlockedInterval];
    uint64_t v14 = [v13 startDate];
    uint64_t v10 = [v12 compare:v14];
  }
  return v10;
}

- (SCLHistoryGroup)initWithEffectiveSchedule:(id)a3 calendar:(id)a4 referenceDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SCLHistoryGroup;
  id v11 = [(SCLHistoryGroup *)&v18 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_calendar, a4);
    objc_storeStrong((id *)&v12->_referenceDate, a5);
    uint64_t v13 = [v8 copy];
    effectiveSchedule = v12->_effectiveSchedule;
    v12->_effectiveSchedule = (SCLSchedule *)v13;

    uint64_t v15 = [MEMORY[0x263EFF980] array];
    items = v12->_items;
    v12->_items = (NSMutableArray *)v15;
  }
  return v12;
}

- (BOOL)canContainUnlockHistoryItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 unlockedInterval];
  uint64_t v6 = [v5 startDate];

  id v7 = [(SCLHistoryGroup *)self calendar];
  id v8 = [(SCLHistoryGroup *)self referenceDate];
  int v9 = [v7 isDate:v6 inSameDayAsDate:v8];

  if (v9)
  {
    id v10 = [(SCLHistoryGroup *)self effectiveSchedule];
    id v11 = [v10 recurrences];
    id v12 = [v4 effectiveRecurrence];
    char v13 = [v11 containsObject:v12];
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (NSDate)referenceDate
{
  return self->_referenceDate;
}

- (SCLSchedule)effectiveSchedule
{
  return self->_effectiveSchedule;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (NSMutableArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_effectiveSchedule, 0);
  objc_storeStrong((id *)&self->_referenceDate, 0);
}

@end