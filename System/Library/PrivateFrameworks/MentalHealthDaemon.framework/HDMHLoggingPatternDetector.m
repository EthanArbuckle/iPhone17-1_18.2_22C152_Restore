@interface HDMHLoggingPatternDetector
- (HDMHLoggingPatternDetector)initWithProfile:(id)a3;
- (HDProfile)profile;
- (id)isUnpleasantLoggingPatternDetectedWithCurrentDate:(id)a3 gregorianCalendar:(id)a4 pendingStateOfMind:(id)a5 error:(id *)a6;
@end

@implementation HDMHLoggingPatternDetector

- (HDMHLoggingPatternDetector)initWithProfile:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDMHLoggingPatternDetector;
  v5 = [(HDMHLoggingPatternDetector *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_profile, v4);
  }

  return v6;
}

- (id)isUnpleasantLoggingPatternDetectedWithCurrentDate:(id)a3 gregorianCalendar:(id)a4 pendingStateOfMind:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = objc_msgSend(v10, "hk_dayIndexWithCalendar:", v11);
  uint64_t v14 = *MEMORY[0x263F54FD8];
  uint64_t v15 = v13 - *MEMORY[0x263F54FD8] + 1;
  if ([v12 reflectiveInterval] == 2) {
    id v16 = v12;
  }
  else {
    id v16 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v18 = [MEMORY[0x263F43370] predicateForReflectiveInterval:2];
  LOBYTE(v24) = 1;
  v19 = -[HDMHDaySummaryEnumerator initWithProfile:dayIndexRange:gregorianCalendar:predicate:pendingDailyStateOfMind:ascending:]([HDMHDaySummaryEnumerator alloc], "initWithProfile:dayIndexRange:gregorianCalendar:predicate:pendingDailyStateOfMind:ascending:", WeakRetained, v15, v14, v11, v18, v16, v24);
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __123__HDMHLoggingPatternDetector_isUnpleasantLoggingPatternDetectedWithCurrentDate_gregorianCalendar_pendingStateOfMind_error___block_invoke;
  v25[3] = &unk_2653F0748;
  v25[4] = &v30;
  v25[5] = &v26;
  if ([(HDMHDaySummaryEnumerator *)v19 enumerateWithError:a6 handler:v25])
  {
    BOOL v21 = v31[3] >= *MEMORY[0x263F54FE8] && v27[3] < *MEMORY[0x263F54FE0];
    v22 = [NSNumber numberWithInt:v21];
  }
  else
  {
    v22 = 0;
  }
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

  return v22;
}

void __123__HDMHLoggingPatternDetector_isUnpleasantLoggingPatternDetectedWithCurrentDate_gregorianCalendar_pendingStateOfMind_error___block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 dailyStateOfMind];
  BOOL v3 = [v6 valenceClassification] == 2
    || [v6 valenceClassification] == 1
    || [v6 valenceClassification] == 3;
  BOOL v4 = [v6 valenceClassification] == 6
    || [v6 valenceClassification] == 7
    || [v6 valenceClassification] == 5;
  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 32);
  }
  else
  {
    if (!v4) {
      goto LABEL_14;
    }
    uint64_t v5 = *(void *)(a1 + 40);
  }
  ++*(void *)(*(void *)(v5 + 8) + 24);
LABEL_14:
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  return (HDProfile *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end