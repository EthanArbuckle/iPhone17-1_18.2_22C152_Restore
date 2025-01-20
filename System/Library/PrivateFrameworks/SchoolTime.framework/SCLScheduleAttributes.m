@interface SCLScheduleAttributes
- (BOOL)hasSingleIntervalPerDay;
- (BOOL)hasUniformIntervals;
- (BOOL)isValid;
- (NSError)validationError;
- (SCLSchedule)schedule;
- (SCLScheduleAttributes)initWithSchedule:(id)a3;
- (SCLScheduleAttributes)initWithSchedule:(id)a3 options:(unint64_t)a4;
- (int64_t)scheduledDays;
- (unint64_t)validationOptions;
- (void)_prepareWithRecurrences:(id)a3;
@end

@implementation SCLScheduleAttributes

- (SCLScheduleAttributes)initWithSchedule:(id)a3
{
  return [(SCLScheduleAttributes *)self initWithSchedule:a3 options:3];
}

- (SCLScheduleAttributes)initWithSchedule:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SCLScheduleAttributes;
  v7 = [(SCLScheduleAttributes *)&v12 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    schedule = v7->_schedule;
    v7->_schedule = (SCLSchedule *)v8;

    v7->_validationOptions = a4;
    v10 = [v6 recurrences];
    [(SCLScheduleAttributes *)v7 _prepareWithRecurrences:v10];
  }
  return v7;
}

- (void)_prepareWithRecurrences:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x2020000000;
  uint64_t v48 = 0;
  v5 = [MEMORY[0x263EFF9C0] set];
  id v6 = [MEMORY[0x263EFF9C0] set];
  v7 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  uint64_t v44 = 0;
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __49__SCLScheduleAttributes__prepareWithRecurrences___block_invoke;
  v33[3] = &unk_2648ACC40;
  v39 = &v41;
  id v8 = v7;
  id v34 = v8;
  v35 = self;
  v40 = &v45;
  id v9 = v6;
  id v36 = v9;
  id v10 = v4;
  id v37 = v10;
  id v11 = v5;
  id v38 = v11;
  [v10 enumerateObjectsUsingBlock:v33];
  self->_scheduledDays = v42[3];
  uint64_t v12 = v46[3];
  self->_valid = v12 == 0;
  if (v12)
  {
    id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v13 setObject:@"Recurrence validation failed." forKeyedSubscript:*MEMORY[0x263F08320]];
    v14 = [NSNumber numberWithUnsignedInteger:v46[3]];
    [v13 setObject:v14 forKeyedSubscript:@"FailedValidations"];

    if ([v11 count]) {
      [v13 setObject:v11 forKeyedSubscript:@"OverlappingRecurrences"];
    }
    if ([v9 count]) {
      [v13 setObject:v9 forKeyedSubscript:@"CrossDayBoundaryRecurrences"];
    }
    v15 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.schooltime" code:3 userInfo:v13];
    validationError = self->_validationError;
    self->_validationError = v15;
  }
  else
  {
    char v17 = [v8 count] != 0;
    v18 = [v8 objectEnumerator];
    id v13 = [v18 nextObject];

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v19 = [v8 objectEnumerator];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v49 count:16];
    id v25 = v11;
    id v26 = v9;
    id v27 = v8;
    id v28 = v10;
    if (v20)
    {
      uint64_t v21 = *(void *)v30;
      int v22 = 1;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v30 != v21) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          v22 &= objc_msgSend(v24, "isEqual:", v13, v25, v26, v27, v28);
          v17 &= (unint64_t)[v24 count] < 2;
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v49 count:16];
      }
      while (v20);
    }
    else
    {
      LOBYTE(v22) = 1;
    }

    id v8 = v27;
    id v10 = v28;
    id v11 = v25;
    id v9 = v26;
    self->_hasUniformIntervals = v22;
    self->_hasSingleIntervalPerDay = v17;
  }

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);
}

void __49__SCLScheduleAttributes__prepareWithRecurrences___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) |= SCLRepeatScheduleForDay([v3 day]);
  id v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "day"));
  v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
  if (!v5)
  {
    v5 = [MEMORY[0x263EFF9C0] set];
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v4];
  }
  id v6 = [v3 timeInterval];
  [v5 addObject:v6];

  if ((*(unsigned char *)(*(void *)(a1 + 40) + 24) & 2) != 0)
  {
    v7 = [v3 timeInterval];
    int v8 = [v7 crossesDayBoundary];

    if (v8)
    {
      *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) |= 2uLL;
      [*(id *)(a1 + 48) addObject:v3];
    }
  }
  if (*(unsigned char *)(*(void *)(a1 + 40) + 24))
  {
    id v9 = *(void **)(a1 + 56);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __49__SCLScheduleAttributes__prepareWithRecurrences___block_invoke_2;
    v12[3] = &unk_2648ACC18;
    id v10 = v3;
    uint64_t v11 = *(void *)(a1 + 80);
    id v13 = v10;
    uint64_t v15 = v11;
    id v14 = *(id *)(a1 + 64);
    [v9 enumerateObjectsUsingBlock:v12];
  }
}

uint64_t __49__SCLScheduleAttributes__prepareWithRecurrences___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  if (v4 != v3)
  {
    id v6 = v3;
    if ([v4 intersectsRecurrence:v3])
    {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) |= 1uLL;
      [*(id *)(a1 + 40) addObject:*(void *)(a1 + 32)];
      [*(id *)(a1 + 40) addObject:v6];
    }
  }
  return MEMORY[0x270F9A758]();
}

- (SCLSchedule)schedule
{
  return self->_schedule;
}

- (unint64_t)validationOptions
{
  return self->_validationOptions;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (NSError)validationError
{
  return self->_validationError;
}

- (int64_t)scheduledDays
{
  return self->_scheduledDays;
}

- (BOOL)hasUniformIntervals
{
  return self->_hasUniformIntervals;
}

- (BOOL)hasSingleIntervalPerDay
{
  return self->_hasSingleIntervalPerDay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validationError, 0);
  objc_storeStrong((id *)&self->_schedule, 0);
}

@end