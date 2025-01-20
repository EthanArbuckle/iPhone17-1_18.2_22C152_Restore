@interface HDMHDaySummaryEnumerator
- (BOOL)_finishCurrentSummaryBuilder:(id)a3 pendingDailyStateOfMind:(id)a4 pendingDailyStateOfMindDayIndex:(int64_t)a5 clientRequestedStop:(BOOL *)a6 handler:(id)a7;
- (BOOL)enumerateWithError:(id *)a3 handler:(id)a4;
- (HDMHDaySummaryEnumerator)initWithProfile:(id)a3 dayIndexRange:(id)a4 gregorianCalendar:(id)a5 predicate:(id)a6 pendingDailyStateOfMind:(id)a7 ascending:(BOOL)a8;
- (id)_makeStateOfMindSampleEnumerator;
- (id)_queryPredicate;
- (int64_t)_compareDayIndex:(int64_t)a3 withDayIndex:(int64_t)a4;
@end

@implementation HDMHDaySummaryEnumerator

- (HDMHDaySummaryEnumerator)initWithProfile:(id)a3 dayIndexRange:(id)a4 gregorianCalendar:(id)a5 predicate:(id)a6 pendingDailyStateOfMind:(id)a7 ascending:(BOOL)a8
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)HDMHDaySummaryEnumerator;
  v18 = [(HDMHDaySummaryEnumerator *)&v25 init];
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_profile, v14);
    v19->_dayIndexRange.start = var0;
    v19->_dayIndexRange.duration = var1;
    objc_storeStrong((id *)&v19->_predicate, a6);
    objc_storeStrong((id *)&v19->_gregorianCalendar, a5);
    p_pendingDailyStateOfMind = (void **)&v19->_pendingDailyStateOfMind;
    objc_storeStrong((id *)&v19->_pendingDailyStateOfMind, a7);
    v19->_ascending = a8;
    pendingDailyStateOfMind = v19->_pendingDailyStateOfMind;
    if (pendingDailyStateOfMind)
    {
      if ([(HKStateOfMind *)pendingDailyStateOfMind reflectiveInterval] != 2)
      {
        _HKInitializeLogging();
        v22 = *MEMORY[0x263F09938];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09938], OS_LOG_TYPE_FAULT)) {
          -[HDMHDaySummaryEnumerator initWithProfile:dayIndexRange:gregorianCalendar:predicate:pendingDailyStateOfMind:ascending:](v22);
        }
        v23 = *p_pendingDailyStateOfMind;
        *p_pendingDailyStateOfMind = 0;
      }
    }
  }

  return v19;
}

- (BOOL)enumerateWithError:(id *)a3 handler:(id)a4
{
  id v6 = a4;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__2;
  v48 = __Block_byref_object_dispose__2;
  v49 = self->_pendingDailyStateOfMind;
  v7 = [(id)v45[5] startDate];
  uint64_t v8 = objc_msgSend(v7, "hk_dayIndexWithCalendar:", self->_gregorianCalendar);

  v9 = (void *)v45[5];
  if (v9)
  {
    int64_t start = self->_dayIndexRange.start;
    BOOL v11 = __OFSUB__(v8, start);
    int64_t v12 = v8 - start;
    if (v12 < 0 != v11 || v12 >= self->_dayIndexRange.duration)
    {
      v45[5] = 0;
    }
  }
  id v14 = [(HDMHDaySummaryEnumerator *)self _makeStateOfMindSampleEnumerator];
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__2;
  v42 = __Block_byref_object_dispose__2;
  id v43 = 0;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  uint64_t v24 = MEMORY[0x263EF8330];
  uint64_t v25 = 3221225472;
  v26 = __55__HDMHDaySummaryEnumerator_enumerateWithError_handler___block_invoke;
  v27 = &unk_2653F0640;
  v28 = self;
  v30 = &v38;
  v32 = &v34;
  uint64_t v33 = v8;
  v31 = &v44;
  id v15 = v6;
  id v29 = v15;
  int v16 = [v14 enumerateWithError:a3 handler:&v24];
  if (*((unsigned char *)v35 + 24)) {
    BOOL v17 = v16;
  }
  else {
    BOOL v17 = 0;
  }
  if (!*((unsigned char *)v35 + 24) && ((v16 ^ 1) & 1) == 0)
  {
    uint64_t v18 = v39[5];
    if (v18)
    {
      BOOL v19 = -[HDMHDaySummaryEnumerator _finishCurrentSummaryBuilder:pendingDailyStateOfMind:pendingDailyStateOfMindDayIndex:clientRequestedStop:handler:](self, "_finishCurrentSummaryBuilder:pendingDailyStateOfMind:pendingDailyStateOfMindDayIndex:clientRequestedStop:handler:", v18, v45[5], v8, v35 + 3, v15, v24, v25, v26, v27, v28);
      if (*((unsigned char *)v35 + 24))
      {
LABEL_18:
        BOOL v17 = 1;
        goto LABEL_19;
      }
      if (v19)
      {
        v20 = (void *)v45[5];
        v45[5] = 0;
      }
    }
    if (v45[5])
    {
      v21 = [[HDMHDaySummaryBuilder alloc] initWithDayIndex:v8 gregorianCalendar:self->_gregorianCalendar];
      [(HDMHDaySummaryBuilder *)v21 addStateOfMind:v45[5]];
      v22 = [(HDMHDaySummaryBuilder *)v21 daySummary];
      (*((void (**)(id, void *, uint64_t *))v15 + 2))(v15, v22, v35 + 3);
    }
    goto LABEL_18;
  }
LABEL_19:

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
  return v17;
}

uint64_t __55__HDMHDaySummaryEnumerator_enumerateWithError_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 startDate];
  uint64_t v5 = objc_msgSend(v4, "hk_dayIndexWithCalendar:", *(void *)(*(void *)(a1 + 32) + 40));

  id v6 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (!v6)
  {
LABEL_7:
    BOOL v11 = [[HDMHDaySummaryBuilder alloc] initWithDayIndex:v5 gregorianCalendar:*(void *)(*(void *)(a1 + 32) + 40)];
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    goto LABEL_8;
  }
  if ([v6 dayIndex] == v5)
  {
LABEL_8:
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addStateOfMind:v3];
    uint64_t v8 = 1;
    goto LABEL_9;
  }
  int v7 = [*(id *)(a1 + 32) _finishCurrentSummaryBuilder:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) pendingDailyStateOfMind:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) pendingDailyStateOfMindDayIndex:*(void *)(a1 + 72) clientRequestedStop:*(void *)(*(void *)(a1 + 64) + 8) + 24 handler:*(void *)(a1 + 40)];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    if (v7)
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
      v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = 0;
    }
    goto LABEL_7;
  }
  uint64_t v8 = 0;
LABEL_9:

  return v8;
}

- (BOOL)_finishCurrentSummaryBuilder:(id)a3 pendingDailyStateOfMind:(id)a4 pendingDailyStateOfMindDayIndex:(int64_t)a5 clientRequestedStop:(BOOL *)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = (void (**)(id, void *, BOOL *))a7;
  if (!v12 || !v13)
  {
    BOOL v18 = v13 == 0;
    if (!v12) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  int64_t v15 = -[HDMHDaySummaryEnumerator _compareDayIndex:withDayIndex:](self, "_compareDayIndex:withDayIndex:", a5, [v12 dayIndex]);
  if (!v15)
  {
    [v12 addStateOfMind:v13];
    BOOL v18 = 1;
LABEL_11:
    BOOL v19 = [v12 daySummary];
    v14[2](v14, v19, a6);

    goto LABEL_12;
  }
  if (v15 != -1)
  {
    BOOL v18 = 0;
    goto LABEL_11;
  }
  int v16 = [[HDMHDaySummaryBuilder alloc] initWithDayIndex:a5 gregorianCalendar:self->_gregorianCalendar];
  [(HDMHDaySummaryBuilder *)v16 addStateOfMind:v13];
  BOOL v17 = [(HDMHDaySummaryBuilder *)v16 daySummary];
  v14[2](v14, v17, a6);

  LODWORD(v17) = *a6;
  BOOL v18 = 1;
  if (!v17) {
    goto LABEL_11;
  }
LABEL_12:

  return v18;
}

- (int64_t)_compareDayIndex:(int64_t)a3 withDayIndex:(int64_t)a4
{
  if (a3 == a4) {
    return 0;
  }
  int64_t v5 = 1;
  if (a3 >= a4) {
    int64_t v5 = -1;
  }
  int64_t v6 = -1;
  if (a3 >= a4) {
    int64_t v6 = 1;
  }
  if (self->_ascending) {
    return v6;
  }
  else {
    return v5;
  }
}

- (id)_makeStateOfMindSampleEnumerator
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F0A6E8] stateOfMindType];
  v4 = (void *)MEMORY[0x263F43318];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  int64_t v6 = [v4 entityEnumeratorWithType:v3 profile:WeakRetained];

  int v7 = [(HDMHDaySummaryEnumerator *)self _queryPredicate];
  [v6 setPredicate:v7];

  uint64_t v8 = [MEMORY[0x263F434C8] orderingTermWithProperty:*MEMORY[0x263F43088] entityClass:objc_opt_class() ascending:self->_ascending];
  v11[0] = v8;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  [v6 setOrderingTerms:v9];

  return v6;
}

- (id)_queryPredicate
{
  v15[2] = *MEMORY[0x263EF8340];
  if (self->_dayIndexRange.start == *MEMORY[0x263F094E8]
    && self->_dayIndexRange.duration == *(void *)(MEMORY[0x263F094E8] + 8))
  {
    id v13 = self->_predicate;
  }
  else
  {
    v4 = objc_msgSend(MEMORY[0x263EFF910], "hk_dateOnDayIndex:atHour:calendar:");
    int64_t duration = self->_dayIndexRange.duration;
    if (duration <= 0) {
      unint64_t v6 = 0x8000000000000000;
    }
    else {
      unint64_t v6 = duration + self->_dayIndexRange.start;
    }
    int v7 = objc_msgSend(MEMORY[0x263EFF910], "hk_dateOnDayIndex:atHour:calendar:", v6, 0, self->_gregorianCalendar);
    uint64_t v8 = HDSampleEntityPredicateForStartDate();
    uint64_t v9 = HDSampleEntityPredicateForEndDate();
    v10 = (void *)MEMORY[0x263EFF980];
    v15[0] = v8;
    v15[1] = v9;
    BOOL v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
    id v12 = [v10 arrayWithArray:v11];

    if (self->_predicate) {
      objc_msgSend(v12, "addObject:");
    }
    id v13 = [MEMORY[0x263F434A8] predicateMatchingAllPredicates:v12];
  }
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingDailyStateOfMind, 0);
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)initWithProfile:(os_log_t)log dayIndexRange:gregorianCalendar:predicate:pendingDailyStateOfMind:ascending:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_255F2E000, log, OS_LOG_TYPE_FAULT, "pendingDailyStateOfMind must have HKStateOfMindReflectiveIntervalDaily", v1, 2u);
}

@end