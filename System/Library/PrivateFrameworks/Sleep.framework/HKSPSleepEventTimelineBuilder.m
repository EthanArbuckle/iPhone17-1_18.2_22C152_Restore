@interface HKSPSleepEventTimelineBuilder
+ (id)builderWithSleepScheduleModel:(id)a3 date:(id)a4;
- (HKSPSleepEventTimelineBuilder)initWithSleepScheduleModel:(id)a3 date:(id)a4;
- (HKSPSleepEventTimelineResults)results;
- (HKSPSleepScheduleModel)sleepScheduleModel;
- (NSCalendar)calendar;
- (NSDate)date;
- (id)_windDownDateForBedtimeDate:(id)a3;
- (id)buildTimelineWithOptions:(unint64_t)a3;
- (unint64_t)options;
- (void)_addSessionToTimelineWithWakeUpDate:(id)a3 bedtimeDate:(id)a4 windDownDate:(id)a5 occurrence:(id)a6;
- (void)_adjustSessionForConfirmedWakeUp;
- (void)_adjustSessionForSnoozedWakeUpAlarm;
- (void)_adjustSessions;
- (void)_gatherSessions;
- (void)_gatherSessionsForOccurrence:(id)a3 overrideOccurrence:(id)a4;
- (void)_gatherSessionsForValidationForOccurrence:(id)a3 overrideOccurrence:(id)a4;
- (void)_validateSessionAdjustmentForSnoozedWakeUpAlarm;
@end

@implementation HKSPSleepEventTimelineBuilder

- (void)_gatherSessions
{
  int v3 = (LOBYTE(self->_options) >> 1) & 1;
  v4 = [(HKSPSleepScheduleModel *)self->_sleepScheduleModel sleepSchedule];
  v5 = [v4 overrideOccurrence];

  v6 = [(HKSPSleepScheduleModel *)self->_sleepScheduleModel sleepSchedule];
  v7 = [v6 occurrences];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__HKSPSleepEventTimelineBuilder__gatherSessions__block_invoke;
  v11[3] = &unk_1E5D33FA0;
  char v13 = v3;
  v11[4] = self;
  id v12 = v5;
  id v8 = v5;
  objc_msgSend(v7, "na_each:", v11);

  v9 = [(HKSPSleepEventTimelineResults *)self->_results timeline];
  v10 = (void *)[v9 copy];
  [(HKSPSleepEventTimelineResults *)self->_results setUnadjustedTimeline:v10];
}

void __48__HKSPSleepEventTimelineBuilder__gatherSessions__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 isValidOccurrence])
  {
    v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    if (*(unsigned char *)(a1 + 48)) {
      [v4 _gatherSessionsForValidationForOccurrence:v3 overrideOccurrence:v5];
    }
    else {
      [v4 _gatherSessionsForOccurrence:v3 overrideOccurrence:v5];
    }
  }
  else if (*(unsigned char *)(a1 + 48))
  {
    v6 = HKSPLogForCategory(6uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2114;
      id v11 = v3;
      _os_log_error_impl(&dword_1A7E74000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] occurrence is invalid %{public}@", (uint8_t *)&v8, 0x16u);
    }

    [*(id *)(*(void *)(a1 + 32) + 8) setSleepScheduleInvalid:1];
    [*(id *)(*(void *)(a1 + 32) + 8) setSleepScheduleInvalidReason:1];
  }
}

- (void)_gatherSessionsForOccurrence:(id)a3 overrideOccurrence:(id)a4
{
  id v24 = a3;
  id v6 = a4;
  if ([v24 isSingleDayOverride])
  {
    calendar = self->_calendar;
    int v8 = [v24 wakeUpComponents];
    uint64_t v9 = [(NSCalendar *)calendar dateFromComponents:v8];

    __int16 v10 = self->_calendar;
    id v11 = [v24 bedtimeComponents];
    uint64_t v12 = [(NSCalendar *)v10 dateFromComponents:v11];

    char v13 = [(HKSPSleepEventTimelineBuilder *)self _windDownDateForBedtimeDate:v12];
    [(HKSPSleepEventTimelineBuilder *)self _addSessionToTimelineWithWakeUpDate:v9 bedtimeDate:v12 windDownDate:v13 occurrence:v24];
  }
  else
  {
    uint64_t v9 = [v24 wakeUpDateForDate:self->_date searchBackwards:0 gregorianCalendar:self->_calendar];
    if (([v6 overridesWakeUpForOccurrenceOnDate:v9 gregorianCalendar:self->_calendar] & 1) == 0)
    {
      v14 = [v24 bedtimeDateForWakeUpDate:v9 gregorianCalendar:self->_calendar];
      v15 = [(HKSPSleepEventTimelineBuilder *)self _windDownDateForBedtimeDate:v14];
      [(HKSPSleepEventTimelineBuilder *)self _addSessionToTimelineWithWakeUpDate:v9 bedtimeDate:v14 windDownDate:v15 occurrence:v24];
    }
    uint64_t v12 = [v24 wakeUpDateForDate:v9 searchBackwards:0 gregorianCalendar:self->_calendar];
    if (([v6 overridesWakeUpForOccurrenceOnDate:v12 gregorianCalendar:self->_calendar] & 1) == 0)
    {
      v16 = [v24 bedtimeDateForWakeUpDate:v12 gregorianCalendar:self->_calendar];
      v17 = [(HKSPSleepEventTimelineBuilder *)self _windDownDateForBedtimeDate:v16];
      [(HKSPSleepEventTimelineBuilder *)self _addSessionToTimelineWithWakeUpDate:v12 bedtimeDate:v16 windDownDate:v17 occurrence:v24];
    }
    v18 = [(NSDate *)self->_date dateByAddingTimeInterval:1.0];
    char v13 = [v24 wakeUpDateForDate:v18 searchBackwards:1 gregorianCalendar:self->_calendar];

    if (([v6 overridesWakeUpForOccurrenceOnDate:v13 gregorianCalendar:self->_calendar] & 1) == 0)
    {
      v19 = [v24 bedtimeDateForWakeUpDate:v13 gregorianCalendar:self->_calendar];
      v20 = [(HKSPSleepEventTimelineBuilder *)self _windDownDateForBedtimeDate:v19];
      [(HKSPSleepEventTimelineBuilder *)self _addSessionToTimelineWithWakeUpDate:v13 bedtimeDate:v19 windDownDate:v20 occurrence:v24];
    }
    v21 = [v24 wakeUpDateForDate:v13 searchBackwards:1 gregorianCalendar:self->_calendar];
    if (([v6 overridesWakeUpForOccurrenceOnDate:v21 gregorianCalendar:self->_calendar] & 1) == 0)
    {
      v22 = [v24 bedtimeDateForWakeUpDate:v21 gregorianCalendar:self->_calendar];
      v23 = [(HKSPSleepEventTimelineBuilder *)self _windDownDateForBedtimeDate:v22];
      [(HKSPSleepEventTimelineBuilder *)self _addSessionToTimelineWithWakeUpDate:v21 bedtimeDate:v22 windDownDate:v23 occurrence:v24];
    }
  }
}

- (id)_windDownDateForBedtimeDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HKSPSleepScheduleModel *)self->_sleepScheduleModel sleepSchedule];
  [v5 windDownTime];
  uint64_t v7 = (uint64_t)v6;

  if (v7)
  {
    int v8 = [(NSCalendar *)self->_calendar dateByAddingUnit:128 value:-v7 toDate:v4 options:0];
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (void)_addSessionToTimelineWithWakeUpDate:(id)a3 bedtimeDate:(id)a4 windDownDate:(id)a5 occurrence:(id)a6
{
  id v19 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  char v13 = [HKSPResolvedSleepScheduleOccurrence alloc];
  v14 = +[HKSPSleepEvent sleepEventWithIdentifier:@"HKSPSleepEventIdentifierWakeUp" dueDate:v12];

  v15 = +[HKSPSleepEvent sleepEventWithIdentifier:@"HKSPSleepEventIdentifierBedtime" dueDate:v11];

  if (v19)
  {
    v16 = +[HKSPSleepEvent sleepEventWithIdentifier:@"HKSPSleepEventIdentifierWindDown" dueDate:v19];
    v17 = [(HKSPResolvedSleepScheduleOccurrence *)v13 initWithOccurrence:v10 wakeUpEvent:v14 bedtimeEvent:v15 windDownEvent:v16];
  }
  else
  {
    v17 = [(HKSPResolvedSleepScheduleOccurrence *)v13 initWithOccurrence:v10 wakeUpEvent:v14 bedtimeEvent:v15 windDownEvent:0];
  }

  v18 = [(HKSPSleepEventTimelineResults *)self->_results timeline];
  [v18 addResolvedOccurrence:v17];
}

- (void)_adjustSessionForConfirmedWakeUp
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = [(HKSPSleepScheduleModel *)self->_sleepScheduleModel sleepEventRecord];
  id v4 = [v3 wakeUpAlarmDismissedDate];

  uint64_t v5 = [(HKSPSleepScheduleModel *)self->_sleepScheduleModel sleepEventRecord];
  id v6 = [v5 wakeUpConfirmedUntilDate];

  if ((HKSPIsValidDate(v4) & 1) != 0 || HKSPIsValidDate(v6))
  {
    if (HKSPIsValidDate(v4) && HKSPIsValidDate(v6))
    {
      id v7 = [v4 laterDate:v6];
    }
    else
    {
      if (HKSPIsValidDate(v4)) {
        int v8 = v4;
      }
      else {
        int v8 = v6;
      }
      id v7 = v8;
    }
    uint64_t v9 = v7;
    if (v7 == v6)
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v12 = [(HKSPSleepScheduleModel *)self->_sleepScheduleModel sleepEventRecord];
      char v13 = [v12 wakeUpEarlyNotificationConfirmedDate];

      objc_msgSend(v11, "na_safeAddObject:", v13);
      v14 = [(HKSPSleepScheduleModel *)self->_sleepScheduleModel sleepEventRecord];
      v15 = [v14 wakeUpOverriddenDate];

      objc_msgSend(v11, "na_safeAddObject:", v15);
      objc_msgSend(MEMORY[0x1E4F1C9C8], "hksp_latestFromDates:", v11);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v10 = v4;
    }
    if (HKSPIsValidDate(v10))
    {
      v16 = [(HKSPSleepEventTimelineResults *)self->_results unadjustedTimeline];
      v17 = [v16 resolvedOccurrenceContainingOrPrecedingDate:v9];

      if (v17)
      {
        v18 = [v17 wakeUpEvent];
        id v19 = [v18 dueDate];
        int v20 = objc_msgSend(v9, "hksp_isAfterOrSameAsDate:", v19);

        v21 = HKSPLogForCategory(6uLL);
        BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
        if (v20)
        {
          if (v22)
          {
            int v31 = 138543874;
            v32 = self;
            __int16 v33 = 2114;
            id v34 = v10;
            __int16 v35 = 2114;
            v36 = v9;
            _os_log_debug_impl(&dword_1A7E74000, v21, OS_LOG_TYPE_DEBUG, "[%{public}@] confirmed wake up at %{public}@ until %{public}@", (uint8_t *)&v31, 0x20u);
          }

          v23 = [(HKSPSleepEventTimelineResults *)self->_results timeline];
          v21 = [v23 resolvedOccurrenceContainingOrPrecedingDate:v9];

          id v24 = [v21 bedtimeEvent];
          v25 = [v24 dueDate];
          int v26 = objc_msgSend(v25, "hksp_isAfterDate:", v10);

          if (v26)
          {
            v27 = HKSPLogForCategory(6uLL);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            {
              v28 = [v21 bedtimeEvent];
              v29 = [v28 dueDate];
              int v31 = 138543618;
              v32 = self;
              __int16 v33 = 2114;
              id v34 = v29;
              _os_log_debug_impl(&dword_1A7E74000, v27, OS_LOG_TYPE_DEBUG, "[%{public}@] ignoring confirmed wake up because bedtime event was at %{public}@", (uint8_t *)&v31, 0x16u);
            }
          }
          else
          {
            v27 = +[HKSPSleepEvent sleepEventWithIdentifier:@"HKSPSleepEventIdentifierWakeUp" dueDate:v10];
            v30 = [(HKSPSleepEventTimelineResults *)self->_results timeline];
            [v30 adjustResolvedOccurrence:v17 withEvent:v27];
          }
        }
        else if (v22)
        {
          int v31 = 138543362;
          v32 = self;
          _os_log_debug_impl(&dword_1A7E74000, v21, OS_LOG_TYPE_DEBUG, "[%{public}@] not adjusting occurrence because wake up date is after confirmed until date", (uint8_t *)&v31, 0xCu);
        }
      }
    }
  }
}

- (HKSPSleepEventTimelineBuilder)initWithSleepScheduleModel:(id)a3 date:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HKSPSleepEventTimelineBuilder;
  uint64_t v9 = [(HKSPSleepEventTimelineBuilder *)&v15 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sleepScheduleModel, a3);
    objc_storeStrong((id *)&v10->_date, a4);
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendar");
    calendar = v10->_calendar;
    v10->_calendar = (NSCalendar *)v11;

    char v13 = v10;
  }

  return v10;
}

- (id)buildTimelineWithOptions:(unint64_t)a3
{
  uint64_t v5 = objc_alloc_init(HKSPSleepEventTimelineResults);
  results = self->_results;
  self->_results = v5;

  self->_unint64_t options = a3;
  if ((a3 & 4) != 0)
  {
    id v7 = [(HKSPSleepScheduleModel *)self->_sleepScheduleModel sleepSchedule];
    [(HKSPSleepEventTimelineResults *)self->_results setOriginalSleepSchedule:v7];

    id v8 = [(HKSPSleepScheduleModel *)self->_sleepScheduleModel sleepSchedule];
    uint64_t v9 = [v8 emptyCopy];
    id v10 = (void *)[v9 mutableCopy];
    [(HKSPSleepEventTimelineResults *)self->_results setMutableValidSleepSchedule:v10];
  }
  uint64_t v11 = [[HKSPSleepEventTimeline alloc] initWithOriginDate:self->_date];
  [(HKSPSleepEventTimelineResults *)self->_results setTimeline:v11];

  id v12 = [(HKSPSleepScheduleModel *)self->_sleepScheduleModel sleepSchedule];
  if ([v12 isEnabled])
  {
  }
  else
  {
    unint64_t options = self->_options;

    if ((options & 2) == 0) {
      goto LABEL_10;
    }
  }
  [(HKSPSleepEventTimelineBuilder *)self _gatherSessions];
  unint64_t v14 = self->_options;
  if ((v14 & 2) != 0)
  {
    [(HKSPSleepEventTimelineBuilder *)self _validateSessionAdjustments];
  }
  else if ((v14 & 1) == 0)
  {
    [(HKSPSleepEventTimelineBuilder *)self _adjustSessions];
  }
LABEL_10:
  objc_super v15 = self->_results;
  return v15;
}

- (void)_adjustSessions
{
  [(HKSPSleepEventTimelineBuilder *)self _adjustSessionForSnoozedWakeUpAlarm];
  [(HKSPSleepEventTimelineBuilder *)self _adjustSessionForConfirmedWakeUp];
}

- (void)_adjustSessionForSnoozedWakeUpAlarm
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [(HKSPSleepScheduleModel *)self->_sleepScheduleModel sleepEventRecord];
  id v4 = [v3 wakeUpAlarmSnoozedUntilDate];

  if (HKSPIsValidDate(v4))
  {
    uint64_t v5 = [(HKSPSleepEventTimelineResults *)self->_results unadjustedTimeline];
    id v6 = [v5 resolvedOccurrencePrecedingDate:v4];

    if (v6)
    {
      id v7 = [v6 occurrence];
      id v8 = [v7 alarmConfiguration];

      if ([v8 isEnabled])
      {
        uint64_t v9 = HKSPLogForCategory(6uLL);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          int v12 = 138543618;
          char v13 = self;
          __int16 v14 = 2114;
          objc_super v15 = v4;
          _os_log_debug_impl(&dword_1A7E74000, v9, OS_LOG_TYPE_DEBUG, "[%{public}@] snoozed wake up alarm until %{public}@", (uint8_t *)&v12, 0x16u);
        }

        id v10 = +[HKSPSleepEvent sleepEventWithIdentifier:@"HKSPSleepEventIdentifierWakeUp" dueDate:v4 type:1];
        uint64_t v11 = [(HKSPSleepEventTimelineResults *)self->_results timeline];
        [v11 adjustResolvedOccurrence:v6 withEvent:v10];
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_sleepScheduleModel, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

+ (id)builderWithSleepScheduleModel:(id)a3 date:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithSleepScheduleModel:v7 date:v6];

  return v8;
}

- (void)_gatherSessionsForValidationForOccurrence:(id)a3 overrideOccurrence:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  uint64_t v38 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__10;
  v33[4] = __Block_byref_object_dispose__10;
  id v34 = [MEMORY[0x1E4F1C9C8] distantFuture];
  id v8 = (void *)[v6 mutableCopy];
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  v25 = __94__HKSPSleepEventTimelineBuilder__gatherSessionsForValidationForOccurrence_overrideOccurrence___block_invoke;
  int v26 = &unk_1E5D33FF0;
  id v9 = v6;
  id v27 = v9;
  v28 = self;
  int v31 = v33;
  v32 = &v35;
  id v10 = v7;
  id v29 = v10;
  id v11 = v8;
  id v30 = v11;
  int v12 = (void (**)(void, void, void, void))MEMORY[0x1AD0DD220](&v23);
  if (objc_msgSend(v9, "isSingleDayOverride", v23, v24, v25, v26))
  {
    calendar = self->_calendar;
    __int16 v14 = [v10 wakeUpComponents];
    objc_super v15 = [(NSCalendar *)calendar dateFromComponents:v14];

    uint64_t v16 = self->_calendar;
    v17 = [v10 bedtimeComponents];
    v18 = [(NSCalendar *)v16 dateFromComponents:v17];

    id v19 = [(HKSPSleepEventTimelineBuilder *)self _windDownDateForBedtimeDate:v18];
    [(HKSPSleepEventTimelineBuilder *)self _addSessionToTimelineWithWakeUpDate:v15 bedtimeDate:v18 windDownDate:v19 occurrence:v10];
    if ((self->_options & 4) != 0)
    {
      int v20 = [(HKSPSleepEventTimelineResults *)self->_results mutableValidSleepSchedule];
      [v20 saveOccurrence:v11];
    }
    goto LABEL_11;
  }
  ((void (**)(void, uint64_t, NSDate *, void))v12)[2](v12, [v9 weekdays], self->_date, 0);
  uint64_t v21 = HKSPPreviousDayInWeekdays(v36[3], [v9 weekdays]);
  if ((unint64_t)(v21 + 2) > 9) {
    uint64_t v22 = 0;
  }
  else {
    uint64_t v22 = qword_1A7ED5570[v21 + 2];
  }
  ((void (**)(void, uint64_t, NSDate *, uint64_t))v12)[2](v12, v22, self->_date, 1);
  if ((self->_options & 4) != 0 && [v11 weekdays])
  {
    objc_super v15 = [(HKSPSleepEventTimelineResults *)self->_results mutableValidSleepSchedule];
    [v15 saveOccurrence:v11];
LABEL_11:
  }
  _Block_object_dispose(v33, 8);

  _Block_object_dispose(&v35, 8);
}

void __94__HKSPSleepEventTimelineBuilder__gatherSessionsForValidationForOccurrence_overrideOccurrence___block_invoke(uint64_t a1, uint64_t a2, void *a3, char a4)
{
  id v7 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __94__HKSPSleepEventTimelineBuilder__gatherSessionsForValidationForOccurrence_overrideOccurrence___block_invoke_2;
  v10[3] = &unk_1E5D33FC8;
  id v11 = *(id *)(a1 + 32);
  id v12 = v7;
  char v17 = a4;
  id v8 = *(void **)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 40);
  long long v16 = *(_OWORD *)(a1 + 64);
  id v14 = v8;
  id v15 = *(id *)(a1 + 56);
  id v9 = v7;
  HKSPWeekdaysEnumerateDays(a2, v10, 0);
}

void __94__HKSPSleepEventTimelineBuilder__gatherSessionsForValidationForOccurrence_overrideOccurrence___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = [*(id *)(a1 + 32) wakeUpDateForDate:*(void *)(a1 + 40) day:a2 searchBackwards:*(unsigned __int8 *)(a1 + 88) gregorianCalendar:*(void *)(*(void *)(a1 + 48) + 32)];
  if (objc_msgSend(v4, "hksp_isBeforeDate:", *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v4);
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = a2;
  }
  if (([*(id *)(a1 + 56) overridesWakeUpForOccurrenceOnDate:v4 gregorianCalendar:*(void *)(*(void *)(a1 + 48) + 32)] & 1) == 0)
  {
    uint64_t v5 = [*(id *)(a1 + 32) bedtimeDateForWakeUpDate:v4 gregorianCalendar:*(void *)(*(void *)(a1 + 48) + 32)];
    id v6 = [*(id *)(a1 + 48) _windDownDateForBedtimeDate:v5];
    id v7 = [HKSPResolvedSleepScheduleOccurrence alloc];
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = +[HKSPSleepEvent sleepEventWithIdentifier:@"HKSPSleepEventIdentifierWakeUp" dueDate:v4];
    id v10 = +[HKSPSleepEvent sleepEventWithIdentifier:@"HKSPSleepEventIdentifierBedtime" dueDate:v5];
    if (v6)
    {
      id v11 = +[HKSPSleepEvent sleepEventWithIdentifier:@"HKSPSleepEventIdentifierWindDown" dueDate:v6];
      id v12 = [(HKSPResolvedSleepScheduleOccurrence *)v7 initWithOccurrence:v8 wakeUpEvent:v9 bedtimeEvent:v10 windDownEvent:v11];
    }
    else
    {
      id v12 = [(HKSPResolvedSleepScheduleOccurrence *)v7 initWithOccurrence:v8 wakeUpEvent:v9 bedtimeEvent:v10 windDownEvent:0];
    }

    uint64_t v13 = [*(id *)(*(void *)(a1 + 48) + 8) timeline];
    id v14 = [v13 resolvedOccurrenceOverlappingOccurrence:v12];

    if (v14)
    {
      id v15 = [v14 occurrence];
      int v16 = [v15 isSingleDayOverride];

      if (v16)
      {
        char v17 = [v14 occurrence];
        v18 = [v17 wakeUpComponents];

        id v19 = [*(id *)(*(void *)(a1 + 48) + 32) dateFromComponents:v18];
        if (objc_msgSend(v19, "hksp_isBeforeDate:", *(void *)(*(void *)(a1 + 48) + 24)))
        {
          int v20 = HKSPLogForCategory(6uLL);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v21 = *(void *)(a1 + 48);
            uint64_t v22 = [v14 occurrence];
            int v27 = 138543618;
            uint64_t v28 = v21;
            __int16 v29 = 2114;
            id v30 = v22;
            _os_log_impl(&dword_1A7E74000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] ignoring overlap with expired override occurrence %{public}@", (uint8_t *)&v27, 0x16u);
          }
          goto LABEL_22;
        }
      }
      [*(id *)(*(void *)(a1 + 48) + 8) setSleepScheduleInvalid:1];
      uint64_t v24 = [v14 occurrence];
      if ([v24 isSingleDayOverride]) {
        uint64_t v25 = 3;
      }
      else {
        uint64_t v25 = 2;
      }
      [*(id *)(*(void *)(a1 + 48) + 8) setSleepScheduleInvalidReason:v25];

      if ((unint64_t)(a2 + 2) > 9) {
        uint64_t v26 = 0;
      }
      else {
        uint64_t v26 = qword_1A7ED5570[a2 + 2];
      }
      [*(id *)(a1 + 64) turnOffWeekdays:v26];
    }
    else
    {
      uint64_t v23 = [*(id *)(*(void *)(a1 + 48) + 8) timeline];
      [v23 addResolvedOccurrence:v12];
    }
LABEL_22:
  }
}

- (void)_validateSessionAdjustmentForSnoozedWakeUpAlarm
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = [(HKSPSleepScheduleModel *)self->_sleepScheduleModel sleepEventRecord];
  id v4 = [v3 wakeUpAlarmSnoozedUntilDate];

  if (v4)
  {
    uint64_t v5 = [(HKSPSleepEventTimelineResults *)self->_results unadjustedTimeline];
    id v6 = [v5 resolvedOccurrencePrecedingDate:v4];

    if (v6)
    {
      id v7 = [v6 occurrence];
      uint64_t v8 = [v7 alarmConfiguration];

      if (([v8 isEnabled] & 1) == 0)
      {
        id v9 = HKSPLogForCategory(6uLL);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          int v10 = 138543618;
          id v11 = self;
          __int16 v12 = 2114;
          uint64_t v13 = v4;
          _os_log_debug_impl(&dword_1A7E74000, v9, OS_LOG_TYPE_DEBUG, "[%{public}@] snoozed wake up alarm for %{public}@ is for disabled alarm", (uint8_t *)&v10, 0x16u);
        }

        [(HKSPSleepEventTimelineResults *)self->_results setSnoozeFireDateNeedsReset:1];
      }
    }
  }
}

- (HKSPSleepEventTimelineResults)results
{
  return self->_results;
}

- (HKSPSleepScheduleModel)sleepScheduleModel
{
  return self->_sleepScheduleModel;
}

- (NSDate)date
{
  return self->_date;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (unint64_t)options
{
  return self->_options;
}

@end