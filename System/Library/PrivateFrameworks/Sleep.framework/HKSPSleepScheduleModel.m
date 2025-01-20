@interface HKSPSleepScheduleModel
+ (BOOL)supportsSecureCoding;
+ (id)_computeUpcomingDateIntervalForDate:(id)a3;
+ (id)sleepScheduleModelWithSleepSchedule:(id)a3 sleepSettings:(id)a4 sleepEventRecord:(id)a5;
+ (id)templateModelForSchedule:(id)a3;
- (BOOL)chargingRemindersEnabled;
- (BOOL)chargingRemindersEnabledWithLogObject:(id)a3;
- (BOOL)goodMorningAlertNotificationEnabled;
- (BOOL)goodMorningAlertNotificationsEnabledWithLogObject:(id)a3;
- (BOOL)goodMorningScreenEnabled;
- (BOOL)goodMorningScreenEnabledWithLogObject:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEquivalentTo:(id)a3;
- (HKSPSleepEventRecord)sleepEventRecord;
- (HKSPSleepSchedule)sleepSchedule;
- (HKSPSleepScheduleModel)initWithCoder:(id)a3;
- (HKSPSleepSettings)sleepSettings;
- (NSDate)lastModifiedDate;
- (NSString)description;
- (id)_computeOriginalWakeUpForOverrideDateHelper:(id)a3;
- (id)_timelineResultsDueAfterDate:(id)a3;
- (id)_upcomingEventsDueAfterDate:(id)a3 searchBackwards:(BOOL)a4;
- (id)_upcomingResolvedOccurrencesDueAfterDate:(id)a3 searchBackwards:(BOOL)a4;
- (id)closestEventWithIdentifier:(id)a3 dueAroundDate:(id)a4;
- (id)computeConfirmedWakeUpUntilDateForEarlyWakeUpDate:(id)a3;
- (id)computeConfirmedWakeUpUntilDateForOverrideWakeUpDate:(id)a3;
- (id)computeTemplateGenerationDateForCurrentDate:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)generateOverrideOccurrenceForCurrentDate:(id)a3 gregorianCalendar:(id)a4;
- (id)generateOverrideOccurrenceForCurrentDate:(id)a3 gregorianCalendar:(id)a4 schedule:(id)a5;
- (id)generateOverrideOccurrenceFromTemplateForCurrentDate:(id)a3;
- (id)generateOverrideOccurrenceFromTemplateForCurrentDate:(id)a3 gregorianCalendar:(id)a4;
- (id)generateOverrideOccurrenceFromTemplateForCurrentDate:(id)a3 gregorianCalendar:(id)a4 mutableOccurrence:(id)a5;
- (id)generateOverrideOccurrenceFromTemplateForCurrentDate:(id)a3 gregorianCalendar:(id)a4 schedule:(id)a5;
- (id)modelByApplyingChangesFromOccurrence:(id)a3;
- (id)nextEventDueAfterDate:(id)a3;
- (id)nextEventWithIdentifier:(id)a3 dueAfterDate:(id)a4;
- (id)nextOccurrenceAfterDate:(id)a3;
- (id)nextOccurrenceInInterval:(id)a3;
- (id)nextResolvedOccurrenceAfterDate:(id)a3;
- (id)nextResolvedOccurrenceInInterval:(id)a3;
- (id)overrideOccurrenceGenerationResultForCurrentDate:(id)a3 gregorianCalendar:(id)a4 schedule:(id)a5;
- (id)previousEventWithIdentifier:(id)a3 dueBeforeDate:(id)a4;
- (id)previousEventsDueBeforeDate:(id)a3;
- (id)previousOccurrenceBeforeDate:(id)a3;
- (id)previousResolvedOccurrenceBeforeDate:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)timelineForDate:(id)a3;
- (id)upcomingEventsDueAfterDate:(id)a3;
- (id)upcomingOccurrenceAfterDate:(id)a3;
- (id)upcomingResolvedOccurrenceAfterDate:(id)a3;
- (int64_t)alarmStatusForOccurrence:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKSPSleepScheduleModel

id __64__HKSPSleepScheduleModel_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"sleepSchedule"];
  id v3 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:@"sleepSettings"];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"sleepEventRecord"];
}

- (HKSPSleepSchedule)sleepSchedule
{
  return self->_sleepSchedule;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HKSPSleepScheduleModel *)a3;
  if (self == v4)
  {
    char v16 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [MEMORY[0x1E4F4F738] builderWithObject:v5 ofExpectedClass:objc_opt_class()];
      sleepSchedule = self->_sleepSchedule;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __34__HKSPSleepScheduleModel_isEqual___block_invoke;
      v22[3] = &unk_1E5D31BD0;
      v8 = v5;
      v23 = v8;
      id v9 = (id)[v6 appendObject:sleepSchedule counterpart:v22];
      sleepSettings = self->_sleepSettings;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __34__HKSPSleepScheduleModel_isEqual___block_invoke_2;
      v20[3] = &unk_1E5D31BF8;
      v11 = v8;
      v21 = v11;
      id v12 = (id)[v6 appendObject:sleepSettings counterpart:v20];
      sleepEventRecord = self->_sleepEventRecord;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __34__HKSPSleepScheduleModel_isEqual___block_invoke_3;
      v18[3] = &unk_1E5D31C20;
      v19 = v11;
      v14 = v11;
      id v15 = (id)[v6 appendObject:sleepEventRecord counterpart:v18];
      char v16 = [v6 isEqual];
    }
    else
    {
      char v16 = 0;
    }
  }

  return v16;
}

- (HKSPSleepScheduleModel)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKSPSleepScheduleModel;
  v5 = [(HKSPSleepScheduleModel *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sleepSchedule"];
    sleepSchedule = v5->_sleepSchedule;
    v5->_sleepSchedule = (HKSPSleepSchedule *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sleepSettings"];
    sleepSettings = v5->_sleepSettings;
    v5->_sleepSettings = (HKSPSleepSettings *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sleepEventRecord"];
    sleepEventRecord = v5->_sleepEventRecord;
    v5->_sleepEventRecord = (HKSPSleepEventRecord *)v10;

    id v12 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepEventRecord, 0);
  objc_storeStrong((id *)&self->_sleepSettings, 0);
  objc_storeStrong((id *)&self->_sleepSchedule, 0);
}

- (HKSPSleepEventRecord)sleepEventRecord
{
  return self->_sleepEventRecord;
}

- (id)upcomingResolvedOccurrenceAfterDate:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() _computeUpcomingDateIntervalForDate:v4];

  uint64_t v6 = [(HKSPSleepScheduleModel *)self nextResolvedOccurrenceInInterval:v5];

  return v6;
}

- (id)timelineForDate:(id)a3
{
  id v3 = [(HKSPSleepScheduleModel *)self _timelineResultsDueAfterDate:a3];
  id v4 = [v3 timeline];

  return v4;
}

- (HKSPSleepSettings)sleepSettings
{
  return self->_sleepSettings;
}

- (id)nextResolvedOccurrenceInInterval:(id)a3
{
  id v4 = a3;
  if ([(HKSPSleepSchedule *)self->_sleepSchedule isEnabled])
  {
    v5 = [v4 startDate];
    uint64_t v6 = [(HKSPSleepScheduleModel *)self timelineForDate:v5];

    v7 = [v4 endDate];
    uint64_t v8 = [v6 upcomingResolvedOccurrencesBeforeDate:v7];
    id v9 = [v8 firstObject];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  sleepSchedule = self->_sleepSchedule;
  id v5 = a3;
  [v5 encodeObject:sleepSchedule forKey:@"sleepSchedule"];
  [v5 encodeObject:self->_sleepSettings forKey:@"sleepSettings"];
  [v5 encodeObject:self->_sleepEventRecord forKey:@"sleepEventRecord"];
}

- (NSString)description
{
  return (NSString *)[(HKSPSleepScheduleModel *)self descriptionWithMultilinePrefix:&stru_1EFE54160];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(HKSPSleepScheduleModel *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F4F718];
  id v5 = a3;
  uint64_t v6 = [v4 builderWithObject:self];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__HKSPSleepScheduleModel_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E5D31AA8;
  id v7 = v6;
  id v11 = v7;
  id v12 = self;
  [v7 appendBodySectionWithName:0 multilinePrefix:v5 block:v10];

  id v8 = v7;
  return v8;
}

- (id)_timelineResultsDueAfterDate:(id)a3
{
  id v3 = +[HKSPSleepEventTimelineBuilder builderWithSleepScheduleModel:self date:a3];
  id v4 = [v3 buildTimelineWithOptions:0];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)sleepScheduleModelWithSleepSchedule:(id)a3 sleepSettings:(id)a4 sleepEventRecord:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = objc_alloc_init(HKSPSleepScheduleModel);
  uint64_t v11 = [v9 copy];

  sleepSchedule = v10->_sleepSchedule;
  v10->_sleepSchedule = (HKSPSleepSchedule *)v11;

  uint64_t v13 = [v8 copy];
  sleepSettings = v10->_sleepSettings;
  v10->_sleepSettings = (HKSPSleepSettings *)v13;

  uint64_t v15 = [v7 copy];
  sleepEventRecord = v10->_sleepEventRecord;
  v10->_sleepEventRecord = (HKSPSleepEventRecord *)v15;

  return v10;
}

+ (id)_computeUpcomingDateIntervalForDate:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  id v5 = objc_msgSend(v3, "hk_gregorianCalendar");
  uint64_t v6 = objc_msgSend(v5, "hk_dateByAddingDays:toDate:", 2, v4);
  id v7 = [v5 startOfDayForDate:v6];
  id v8 = [v7 dateByAddingTimeInterval:-1.0];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v4 endDate:v8];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(HKSPSleepScheduleModel);
  uint64_t v5 = [(HKSPSleepScheduleModel *)self sleepSchedule];
  sleepSchedule = v4->_sleepSchedule;
  v4->_sleepSchedule = (HKSPSleepSchedule *)v5;

  uint64_t v7 = [(HKSPSleepScheduleModel *)self sleepSettings];
  sleepSettings = v4->_sleepSettings;
  v4->_sleepSettings = (HKSPSleepSettings *)v7;

  uint64_t v9 = [(HKSPSleepScheduleModel *)self sleepEventRecord];
  sleepEventRecord = v4->_sleepEventRecord;
  v4->_sleepEventRecord = (HKSPSleepEventRecord *)v9;

  return v4;
}

- (NSDate)lastModifiedDate
{
  id v3 = [(HKSPSleepSchedule *)self->_sleepSchedule lastModifiedDate];
  if (!v3
    || ([(HKSPSleepSettings *)self->_sleepSettings lastModifiedDate],
        id v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = objc_msgSend(v4, "hksp_isAfterDate:", v3),
        v4,
        v5))
  {
    uint64_t v6 = [(HKSPSleepSettings *)self->_sleepSettings lastModifiedDate];

    id v3 = (void *)v6;
    if (!v6) {
      goto LABEL_5;
    }
  }
  uint64_t v7 = [(HKSPSleepEventRecord *)self->_sleepEventRecord lastModifiedDate];
  int v8 = objc_msgSend(v7, "hksp_isAfterDate:", v3);

  if (v8)
  {
LABEL_5:
    uint64_t v9 = [(HKSPSleepEventRecord *)self->_sleepEventRecord lastModifiedDate];

    id v3 = (void *)v9;
  }
  return (NSDate *)v3;
}

- (BOOL)isEquivalentTo:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v5 = [(HKSPSleepScheduleModel *)self sleepSchedule];
    uint64_t v6 = [v4 sleepSchedule];
    if ([v5 isEquivalentTo:v6])
    {
      uint64_t v7 = [(HKSPSleepScheduleModel *)self sleepSettings];
      int v8 = [v4 sleepSettings];
      if ([v7 isEquivalentTo:v8])
      {
        uint64_t v9 = [(HKSPSleepScheduleModel *)self sleepEventRecord];
        uint64_t v10 = [v4 sleepEventRecord];
        char v11 = [v9 isEquivalentTo:v10];
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

uint64_t __34__HKSPSleepScheduleModel_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) sleepSchedule];
}

uint64_t __34__HKSPSleepScheduleModel_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) sleepSettings];
}

uint64_t __34__HKSPSleepScheduleModel_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) sleepEventRecord];
}

- (id)nextEventWithIdentifier:(id)a3 dueAfterDate:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = +[HKSPSleepEvent standardEventIdentifiers];
  char v9 = [v8 containsObject:v6];

  if (v9)
  {
    uint64_t v10 = [(HKSPSleepScheduleModel *)self upcomingEventsDueAfterDate:v7];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __63__HKSPSleepScheduleModel_nextEventWithIdentifier_dueAfterDate___block_invoke;
    v15[3] = &unk_1E5D31C48;
    id v16 = v6;
    char v11 = [v10 na_firstObjectPassingTest:v15];
    id v12 = [v11 dueDate];
  }
  else
  {
    uint64_t v10 = HKSPLogForCategory(6uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v18 = (id)objc_opt_class();
      __int16 v19 = 2114;
      id v20 = v6;
      id v14 = v18;
      _os_log_error_impl(&dword_1A7E74000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] %{public}@ not in known identifiers", buf, 0x16u);
    }
    id v12 = 0;
  }

  return v12;
}

uint64_t __63__HKSPSleepScheduleModel_nextEventWithIdentifier_dueAfterDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)previousEventWithIdentifier:(id)a3 dueBeforeDate:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = +[HKSPSleepEvent standardEventIdentifiers];
  char v9 = [v8 containsObject:v6];

  if (v9)
  {
    uint64_t v10 = [(HKSPSleepScheduleModel *)self _upcomingEventsDueAfterDate:v7 searchBackwards:1];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __68__HKSPSleepScheduleModel_previousEventWithIdentifier_dueBeforeDate___block_invoke;
    v15[3] = &unk_1E5D31C48;
    id v16 = v6;
    char v11 = [v10 na_firstObjectPassingTest:v15];
    id v12 = [v11 dueDate];
  }
  else
  {
    uint64_t v10 = HKSPLogForCategory(6uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v18 = (id)objc_opt_class();
      __int16 v19 = 2114;
      id v20 = v6;
      id v14 = v18;
      _os_log_error_impl(&dword_1A7E74000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] %{public}@ not in known identifiers", buf, 0x16u);
    }
    id v12 = 0;
  }

  return v12;
}

uint64_t __68__HKSPSleepScheduleModel_previousEventWithIdentifier_dueBeforeDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)closestEventWithIdentifier:(id)a3 dueAroundDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [(HKSPSleepScheduleModel *)self nextEventWithIdentifier:v7 dueAfterDate:v6];
  char v9 = [(HKSPSleepScheduleModel *)self previousEventWithIdentifier:v7 dueBeforeDate:v6];

  uint64_t v10 = v9;
  if (v8)
  {
    uint64_t v10 = v8;
    if (v9)
    {
      [v8 timeIntervalSinceDate:v6];
      double v12 = v11;
      [v6 timeIntervalSinceDate:v9];
      if (v12 > v13) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = v8;
      }
    }
  }
  id v14 = v10;

  return v14;
}

- (id)nextEventDueAfterDate:(id)a3
{
  id v3 = [(HKSPSleepScheduleModel *)self upcomingEventsDueAfterDate:a3];
  uint64_t v4 = [v3 firstObject];

  return v4;
}

- (id)upcomingEventsDueAfterDate:(id)a3
{
  return [(HKSPSleepScheduleModel *)self _upcomingEventsDueAfterDate:a3 searchBackwards:0];
}

- (id)previousEventsDueBeforeDate:(id)a3
{
  return [(HKSPSleepScheduleModel *)self _upcomingEventsDueAfterDate:a3 searchBackwards:1];
}

- (id)_upcomingEventsDueAfterDate:(id)a3 searchBackwards:(BOOL)a4
{
  if (a3)
  {
    int v5 = +[HKSPSleepEventTimelineBuilder builderWithSleepScheduleModel:self date:a3];
    id v6 = [v5 buildTimelineWithOptions:0];
    id v7 = [v6 timeline];
    int v8 = v7;
    if (a4) {
      [v7 previousEvents];
    }
    else {
    uint64_t v10 = [v7 upcomingEvents];
    }

    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __70__HKSPSleepScheduleModel__upcomingEventsDueAfterDate_searchBackwards___block_invoke;
    v14[3] = &unk_1E5D31C48;
    id v15 = v11;
    id v12 = v11;
    char v9 = objc_msgSend(v10, "na_filter:", v14);
  }
  else
  {
    char v9 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v9;
}

uint64_t __70__HKSPSleepScheduleModel__upcomingEventsDueAfterDate_searchBackwards___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  int v5 = [v3 identifier];
  int v6 = [v4 containsObject:v5];

  if ((v6 & 1) == 0)
  {
    id v7 = *(void **)(a1 + 32);
    int v8 = [v3 identifier];
    [v7 addObject:v8];
  }
  return v6 ^ 1u;
}

- (id)upcomingOccurrenceAfterDate:(id)a3
{
  id v3 = [(HKSPSleepScheduleModel *)self upcomingResolvedOccurrenceAfterDate:a3];
  uint64_t v4 = [v3 occurrence];

  return v4;
}

- (id)nextOccurrenceAfterDate:(id)a3
{
  id v3 = [(HKSPSleepScheduleModel *)self nextResolvedOccurrenceAfterDate:a3];
  uint64_t v4 = [v3 occurrence];

  return v4;
}

- (id)nextOccurrenceInInterval:(id)a3
{
  id v3 = [(HKSPSleepScheduleModel *)self nextResolvedOccurrenceInInterval:a3];
  uint64_t v4 = [v3 occurrence];

  return v4;
}

- (id)nextResolvedOccurrenceAfterDate:(id)a3
{
  id v3 = [(HKSPSleepScheduleModel *)self _upcomingResolvedOccurrencesDueAfterDate:a3 searchBackwards:0];
  uint64_t v4 = [v3 firstObject];

  return v4;
}

- (id)previousOccurrenceBeforeDate:(id)a3
{
  id v3 = [(HKSPSleepScheduleModel *)self previousResolvedOccurrenceBeforeDate:a3];
  uint64_t v4 = [v3 occurrence];

  return v4;
}

- (id)previousResolvedOccurrenceBeforeDate:(id)a3
{
  id v3 = [(HKSPSleepScheduleModel *)self _upcomingResolvedOccurrencesDueAfterDate:a3 searchBackwards:1];
  uint64_t v4 = [v3 firstObject];

  return v4;
}

- (id)_upcomingResolvedOccurrencesDueAfterDate:(id)a3 searchBackwards:(BOOL)a4
{
  id v6 = a3;
  if ([(HKSPSleepSchedule *)self->_sleepSchedule isEnabled])
  {
    id v7 = [(HKSPSleepScheduleModel *)self timelineForDate:v6];
    int v8 = v7;
    if (a4) {
      [v7 previousResolvedOccurrences];
    }
    else {
    char v9 = [v7 upcomingResolvedOccurrences];
    }
  }
  else
  {
    char v9 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v9;
}

- (int64_t)alarmStatusForOccurrence:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    if ([v4 isSingleDayOverride])
    {
      id v6 = [(HKSPSleepScheduleModel *)self sleepSchedule];
      id v7 = [v6 overridenOccurrenceForOverrideOccurrence:v5];
    }
    else
    {
      id v7 = 0;
    }
    char v9 = [v5 alarmConfiguration];
    int v10 = [v9 isEnabled];

    if (v10)
    {
      if (![v5 isSingleDayOverride]
        || v7 && ([v7 isAlarmEquivalentToOverrideOccurrence:v5] & 1) != 0)
      {
        int64_t v8 = 3;
      }
      else
      {
        int64_t v8 = 2;
      }
    }
    else if (v7)
    {
      id v11 = [v7 alarmConfiguration];
      unsigned int v12 = [v11 isEnabled];

      int64_t v8 = v12;
    }
    else
    {
      int64_t v8 = 0;
    }
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

+ (id)templateModelForSchedule:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_class();
  int v5 = objc_alloc_init(HKSPSleepSettings);
  id v6 = objc_alloc_init(HKSPSleepEventRecord);
  id v7 = [v4 sleepScheduleModelWithSleepSchedule:v3 sleepSettings:v5 sleepEventRecord:v6];

  return v7;
}

- (id)modelByApplyingChangesFromOccurrence:(id)a3
{
  id v4 = (void *)[a3 mutableCopy];
  int v5 = [(HKSPSleepScheduleModel *)self sleepSchedule];
  id v6 = (void *)[v5 mutableCopy];

  [v6 saveOccurrence:v4];
  id v7 = objc_opt_class();
  int64_t v8 = (void *)[v6 copy];
  char v9 = [(HKSPSleepScheduleModel *)self sleepSettings];
  int v10 = [(HKSPSleepScheduleModel *)self sleepEventRecord];
  id v11 = [v7 sleepScheduleModelWithSleepSchedule:v8 sleepSettings:v9 sleepEventRecord:v10];

  return v11;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [(HKSPSleepScheduleModel *)self sleepSchedule];
  id v5 = (id)[v3 appendObject:v4];

  id v6 = [(HKSPSleepScheduleModel *)self sleepSettings];
  id v7 = (id)[v3 appendObject:v6];

  int64_t v8 = [(HKSPSleepScheduleModel *)self sleepEventRecord];
  id v9 = (id)[v3 appendObject:v8];

  unint64_t v10 = [v3 hash];
  return v10;
}

- (id)succinctDescription
{
  id v2 = [(HKSPSleepScheduleModel *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)computeConfirmedWakeUpUntilDateForEarlyWakeUpDate:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = HKSPLogForCategory(9uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v43 = (id)objc_opt_class();
    __int16 v44 = 2114;
    id v45 = v4;
    id v6 = v43;
    _os_log_impl(&dword_1A7E74000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] computing wake up confirmed date for early wake up (%{public}@)", buf, 0x16u);
  }
  id v7 = [(HKSPSleepScheduleModel *)self nextResolvedOccurrenceAfterDate:v4];
  int64_t v8 = [v7 wakeUpEvent];
  id v9 = [v8 dueDate];

  unint64_t v10 = HKSPLogForCategory(9uLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    id v43 = v11;
    __int16 v44 = 2114;
    id v45 = v9;
    id v12 = v11;
    _os_log_impl(&dword_1A7E74000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] next wake up is %{public}@", buf, 0x16u);
  }
  double v13 = [v7 scheduledInterval];
  char v14 = [v13 containsDate:v4];

  if ((v14 & 1) == 0)
  {
    id v15 = HKSPLogForCategory(9uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v43 = v16;
      __int16 v44 = 2114;
      id v45 = v4;
      id v17 = v16;
      _os_log_impl(&dword_1A7E74000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] early wake up detected outside of expected interval (%{public}@)", buf, 0x16u);
    }
    id v18 = [(HKSPSleepScheduleModel *)self sleepEventRecord];
    __int16 v19 = [v18 wakeUpEarlyNotificationConfirmedDate];
    id v20 = [v18 wakeUpConfirmedUntilDate];
    if (objc_msgSend(v20, "hksp_isAfterDate:", v19))
    {
      uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v19 endDate:v20];
      if (objc_msgSend(v21, "hksp_containsDate:", v4))
      {
        v22 = HKSPLogForCategory(9uLL);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          id v43 = v23;
          __int16 v44 = 2114;
          id v45 = v20;
          id v24 = v23;
          _os_log_impl(&dword_1A7E74000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] possible duplicate early wake up detected, using that wake up date (%{public}@)", buf, 0x16u);
        }
        id v25 = v20;
        int v26 = 1;
        goto LABEL_22;
      }
    }
    v40 = v18;
    uint64_t v21 = -[HKSPSleepScheduleModel previousResolvedOccurrenceBeforeDate:](self, "previousResolvedOccurrenceBeforeDate:", v4, v19);
    v27 = [v21 wakeUpEvent];
    v28 = [v27 dueDate];

    v29 = (void *)MEMORY[0x1E4F1C9C8];
    v41[0] = v28;
    v41[1] = v9;
    v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
    v31 = objc_msgSend(v29, "hksp_closestFromDates:toDate:", v30, v4);

    v32 = HKSPLogForCategory(9uLL);
    v33 = v32;
    if (v31 == v28)
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v34 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        id v43 = v34;
        __int16 v44 = 2114;
        id v45 = v28;
        id v35 = v34;
        _os_log_impl(&dword_1A7E74000, v33, OS_LOG_TYPE_DEFAULT, "[%{public}@] possible late early wake up detected, using previous wake up date (%{public}@)", buf, 0x16u);
      }
      id v25 = v28;
      int v26 = 1;
    }
    else
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v37 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        id v43 = v37;
        id v38 = v37;
        _os_log_error_impl(&dword_1A7E74000, v33, OS_LOG_TYPE_ERROR, "[%{public}@] unexpected early wake up detected", buf, 0xCu);
      }
      int v26 = 0;
      id v25 = v20;
    }
    id v18 = v40;

    __int16 v19 = v39;
LABEL_22:

    if (v26) {
      goto LABEL_24;
    }
  }
  id v25 = v9;
LABEL_24:

  return v25;
}

- (id)computeConfirmedWakeUpUntilDateForOverrideWakeUpDate:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = HKSPLogForCategory(9uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = (id)objc_opt_class();
    __int16 v11 = 2114;
    id v12 = v4;
    id v6 = v10;
    _os_log_impl(&dword_1A7E74000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] computing wake up confirmed date for override wake up (%{public}@)", (uint8_t *)&v9, 0x16u);
  }
  id v7 = [(HKSPSleepScheduleModel *)self _computeOriginalWakeUpForOverrideDateHelper:v4];

  return v7;
}

- (id)computeTemplateGenerationDateForCurrentDate:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = HKSPLogForCategory(9uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = (id)objc_opt_class();
    __int16 v11 = 2114;
    id v12 = v4;
    id v6 = v10;
    _os_log_impl(&dword_1A7E74000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] computing template generation date for current date (%{public}@)", (uint8_t *)&v9, 0x16u);
  }
  id v7 = [(HKSPSleepScheduleModel *)self _computeOriginalWakeUpForOverrideDateHelper:v4];

  return v7;
}

- (id)_computeOriginalWakeUpForOverrideDateHelper:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HKSPSleepScheduleModel *)self previousOccurrenceBeforeDate:v4];
  id v6 = [(HKSPSleepScheduleModel *)self sleepSchedule];
  id v7 = [v6 overridenOccurrenceForOverrideOccurrence:v5];

  if (!v7)
  {
    int64_t v8 = HKSPLogForCategory(9uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138543362;
      id v24 = (id)objc_opt_class();
      id v17 = v24;
      _os_log_impl(&dword_1A7E74000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] override occurrence doesn't override anything", (uint8_t *)&v23, 0xCu);
    }
    goto LABEL_15;
  }
  int64_t v8 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendar");
  int v9 = [v5 wakeUpComponents];
  id v10 = [v8 dateFromComponents:v9];

  __int16 v11 = [v7 nextDateIntervalWithWakeUpAfterDate:v10 gregorianCalendar:v8];
  id v12 = [v11 endDate];

  if (![v8 date:v12 isSameDayAsDate:v10])
  {
    char v14 = HKSPLogForCategory(9uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138543362;
      id v24 = (id)objc_opt_class();
      id v18 = v24;
      __int16 v19 = "[%{public}@] override occurrence was later than normal occurrence";
      id v20 = v14;
      uint32_t v21 = 12;
LABEL_13:
      _os_log_impl(&dword_1A7E74000, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v23, v21);
    }
LABEL_14:

LABEL_15:
    id v12 = v4;
    goto LABEL_16;
  }
  int v13 = objc_msgSend(v12, "hksp_isAfterDate:", v4);
  char v14 = HKSPLogForCategory(9uLL);
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (!v13)
  {
    if (v15)
    {
      int v23 = 138543618;
      id v24 = (id)objc_opt_class();
      __int16 v25 = 2114;
      id v26 = v12;
      id v18 = v24;
      __int16 v19 = "[%{public}@] wake up for override was later than normal occurrence wake up time (%{public}@)";
      id v20 = v14;
      uint32_t v21 = 22;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (v15)
  {
    int v23 = 138543618;
    id v24 = (id)objc_opt_class();
    __int16 v25 = 2114;
    id v26 = v12;
    id v16 = v24;
    _os_log_impl(&dword_1A7E74000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] wake up for override was earlier than normal occurrence wake up time (%{public}@)", (uint8_t *)&v23, 0x16u);
  }
LABEL_16:

  return v12;
}

- (id)generateOverrideOccurrenceForCurrentDate:(id)a3 gregorianCalendar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [(HKSPSleepScheduleModel *)self sleepSchedule];
  if (v8)
  {
    int v9 = [(HKSPSleepScheduleModel *)self generateOverrideOccurrenceForCurrentDate:v6 gregorianCalendar:v7 schedule:v8];
  }
  else
  {
    id v10 = objc_alloc_init(HKSPSleepSchedule);
    int v9 = [(HKSPSleepScheduleModel *)self generateOverrideOccurrenceForCurrentDate:v6 gregorianCalendar:v7 schedule:v10];
  }
  return v9;
}

- (id)generateOverrideOccurrenceForCurrentDate:(id)a3 gregorianCalendar:(id)a4 schedule:(id)a5
{
  id v5 = [(HKSPSleepScheduleModel *)self overrideOccurrenceGenerationResultForCurrentDate:a3 gregorianCalendar:a4 schedule:a5];
  id v6 = [v5 overrideOccurrence];

  return v6;
}

- (id)overrideOccurrenceGenerationResultForCurrentDate:(id)a3 gregorianCalendar:(id)a4 schedule:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = HKSPLogForCategory(9uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = objc_opt_class();
    id v13 = v12;
    char v14 = [v8 hkspDescription];
    int v32 = 138543874;
    v33 = v12;
    __int16 v34 = 2114;
    id v35 = v14;
    __int16 v36 = 2114;
    id v37 = v10;
    _os_log_impl(&dword_1A7E74000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] generating an override occurrence for current date: %{public}@ from schedule: %{public}@", (uint8_t *)&v32, 0x20u);
  }
  BOOL v15 = objc_alloc_init(HKSPOverrideOccurrenceGenerationResult);
  id v16 = [(HKSPSleepScheduleModel *)self upcomingResolvedOccurrenceAfterDate:v8];
  id v17 = HKSPLogForCategory(9uLL);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = objc_opt_class();
    id v19 = v18;
    [v8 hkspDescription];
    v21 = id v20 = v8;
    int v32 = 138543874;
    v33 = v18;
    __int16 v34 = 2114;
    id v35 = v21;
    __int16 v36 = 2114;
    id v37 = v16;
    _os_log_impl(&dword_1A7E74000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] upcoming resolved occurrence for current date: %{public}@ is: %{public}@", (uint8_t *)&v32, 0x20u);

    id v8 = v20;
  }

  v22 = HKSPLogForCategory(9uLL);
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (v16)
  {
    if (v23)
    {
      id v24 = objc_opt_class();
      int v32 = 138543362;
      v33 = v24;
      id v25 = v24;
      _os_log_impl(&dword_1A7E74000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] generating an override from resolved upcoming occurrence", (uint8_t *)&v32, 0xCu);
    }
    [(HKSPOverrideOccurrenceGenerationResult *)v15 setWasGeneratedFromTemplate:0];
    id v26 = [v16 occurrence];
    -[HKSPOverrideOccurrenceGenerationResult setUpcomingOccurrenceWasOverride:](v15, "setUpcomingOccurrenceWasOverride:", [v26 isSingleDayOverride]);

    uint64_t v27 = [v16 generateOverrideOccurrenceForCurrentDate:v8 gregorianCalendar:v9];
  }
  else
  {
    if (v23)
    {
      v28 = objc_opt_class();
      int v32 = 138543362;
      v33 = v28;
      id v29 = v28;
      _os_log_impl(&dword_1A7E74000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] no upcoming occurrence, generating an override from template", (uint8_t *)&v32, 0xCu);
    }
    [(HKSPOverrideOccurrenceGenerationResult *)v15 setWasGeneratedFromTemplate:1];
    [(HKSPOverrideOccurrenceGenerationResult *)v15 setUpcomingOccurrenceWasOverride:0];
    uint64_t v27 = [(HKSPSleepScheduleModel *)self generateOverrideOccurrenceFromTemplateForCurrentDate:v8 gregorianCalendar:v9 schedule:v10];
  }
  v30 = (void *)v27;
  [(HKSPOverrideOccurrenceGenerationResult *)v15 setOverrideOccurrence:v27];

  return v15;
}

- (id)generateOverrideOccurrenceFromTemplateForCurrentDate:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1C9A8];
  id v5 = a3;
  id v6 = objc_msgSend(v4, "hk_gregorianCalendar");
  id v7 = [(HKSPSleepScheduleModel *)self generateOverrideOccurrenceFromTemplateForCurrentDate:v5 gregorianCalendar:v6];

  return v7;
}

- (id)generateOverrideOccurrenceFromTemplateForCurrentDate:(id)a3 gregorianCalendar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HKSPSleepScheduleModel *)self sleepSchedule];
  if (v8)
  {
    id v9 = [(HKSPSleepScheduleModel *)self generateOverrideOccurrenceFromTemplateForCurrentDate:v6 gregorianCalendar:v7 schedule:v8];
  }
  else
  {
    id v10 = objc_alloc_init(HKSPSleepSchedule);
    id v9 = [(HKSPSleepScheduleModel *)self generateOverrideOccurrenceFromTemplateForCurrentDate:v6 gregorianCalendar:v7 schedule:v10];
  }
  return v9;
}

- (id)generateOverrideOccurrenceFromTemplateForCurrentDate:(id)a3 gregorianCalendar:(id)a4 schedule:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [a5 mutableOccurrenceTemplate];
  __int16 v11 = [(HKSPSleepScheduleModel *)self generateOverrideOccurrenceFromTemplateForCurrentDate:v9 gregorianCalendar:v8 mutableOccurrence:v10];

  return v11;
}

- (id)generateOverrideOccurrenceFromTemplateForCurrentDate:(id)a3 gregorianCalendar:(id)a4 mutableOccurrence:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [(HKSPSleepScheduleModel *)self computeTemplateGenerationDateForCurrentDate:a3];
  __int16 v11 = [v8 overrideOccurrenceTemplateForCurrentDate:v10 gregorianCalendar:v9];

  return v11;
}

- (BOOL)goodMorningAlertNotificationEnabled
{
  return [(HKSPSleepScheduleModel *)self goodMorningAlertNotificationsEnabledWithLogObject:0];
}

- (BOOL)goodMorningAlertNotificationsEnabledWithLogObject:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HKSPSleepScheduleModel *)self sleepSchedule];
  if ([v5 isEnabledAndHasOccurrences])
  {
    id v6 = [(HKSPSleepScheduleModel *)self sleepSettings];
    if ([v6 watchSleepFeaturesEnabled])
    {
      if ([v6 scheduledSleepMode])
      {
        id v7 = [(HKSPSleepScheduleModel *)self sleepEventRecord];
        char v8 = [v7 isAnySleepCoachingOnboardingCompleted];
        BOOL v9 = v8;
        if (!v4 || (v8 & 1) != 0) {
          goto LABEL_21;
        }
        id v10 = HKSPLogForCategory(0);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 138543362;
          id v14 = v4;
          _os_log_impl(&dword_1A7E74000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] not posting good morning alert because onboarding hasn't completed", (uint8_t *)&v13, 0xCu);
        }

LABEL_20:
        BOOL v9 = 0;
LABEL_21:

LABEL_23:
        goto LABEL_24;
      }
      if (v4)
      {
        id v7 = HKSPLogForCategory(0);
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_20;
        }
        int v13 = 138543362;
        id v14 = v4;
        __int16 v11 = "[%{public}@] not posting morning notification because scheduledSleepMode isn't enabled";
        goto LABEL_19;
      }
    }
    else if (v4)
    {
      id v7 = HKSPLogForCategory(0);
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_20;
      }
      int v13 = 138543362;
      id v14 = v4;
      __int16 v11 = "[%{public}@] not posting morning notification because sleep features are disabled for this watch";
LABEL_19:
      _os_log_impl(&dword_1A7E74000, v7, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v13, 0xCu);
      goto LABEL_20;
    }
LABEL_22:
    BOOL v9 = 0;
    goto LABEL_23;
  }
  if (v4)
  {
    id v6 = HKSPLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543362;
      id v14 = v4;
      _os_log_impl(&dword_1A7E74000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] not posting morning notification because sleep schedule isn't enabled", (uint8_t *)&v13, 0xCu);
    }
    goto LABEL_22;
  }
  BOOL v9 = 0;
LABEL_24:

  return v9;
}

- (BOOL)goodMorningScreenEnabled
{
  return [(HKSPSleepScheduleModel *)self goodMorningScreenEnabledWithLogObject:0];
}

- (BOOL)goodMorningScreenEnabledWithLogObject:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HKSPSleepScheduleModel *)self sleepSchedule];
  if (([v5 isEnabledAndHasOccurrences] & 1) == 0)
  {
    if (!v4)
    {
      BOOL v9 = 0;
      goto LABEL_17;
    }
    id v6 = HKSPLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      id v12 = v4;
      _os_log_impl(&dword_1A7E74000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] not showing morning screen because sleep schedule isn't enabled", (uint8_t *)&v11, 0xCu);
    }
    goto LABEL_15;
  }
  id v6 = [(HKSPSleepScheduleModel *)self sleepSettings];
  if ([v6 scheduledSleepMode])
  {
    if (([v6 sleepModeOptions] & 0x4000) != 0)
    {
      BOOL v9 = 1;
      goto LABEL_16;
    }
    if (v4)
    {
      id v7 = HKSPLogForCategory(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138543362;
        id v12 = v4;
        char v8 = "[%{public}@] not showing morning screen because it isn't enabled";
LABEL_13:
        _os_log_impl(&dword_1A7E74000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, 0xCu);
        goto LABEL_14;
      }
      goto LABEL_14;
    }
  }
  else if (v4)
  {
    id v7 = HKSPLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      id v12 = v4;
      char v8 = "[%{public}@] not showing morning screen because scheduledSleepMode isn't enabled";
      goto LABEL_13;
    }
LABEL_14:
  }
LABEL_15:
  BOOL v9 = 0;
LABEL_16:

LABEL_17:
  return v9;
}

- (BOOL)chargingRemindersEnabled
{
  return [(HKSPSleepScheduleModel *)self chargingRemindersEnabledWithLogObject:0];
}

- (BOOL)chargingRemindersEnabledWithLogObject:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HKSPSleepScheduleModel *)self sleepSchedule];
  if ([v5 isEnabledAndHasOccurrences])
  {
    id v6 = [(HKSPSleepScheduleModel *)self sleepSettings];
    if ([v6 watchSleepFeaturesEnabled])
    {
      if ([v6 chargingReminders])
      {
        BOOL v7 = 1;
LABEL_18:

        goto LABEL_19;
      }
      if (v4)
      {
        char v8 = HKSPLogForCategory(0);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v11 = 138543362;
          id v12 = v4;
          BOOL v9 = "[%{public}@] not posting charging reminder because charging reminders aren't enabled";
          goto LABEL_15;
        }
        goto LABEL_16;
      }
    }
    else if (v4)
    {
      char v8 = HKSPLogForCategory(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138543362;
        id v12 = v4;
        BOOL v9 = "[%{public}@] not posting charging reminder because sleep features are disabled for this watch";
LABEL_15:
        _os_log_impl(&dword_1A7E74000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v11, 0xCu);
      }
LABEL_16:
    }
LABEL_17:
    BOOL v7 = 0;
    goto LABEL_18;
  }
  if (v4)
  {
    id v6 = HKSPLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      id v12 = v4;
      _os_log_impl(&dword_1A7E74000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] not posting charging reminder because sleep schedule isn't enabled", (uint8_t *)&v11, 0xCu);
    }
    goto LABEL_17;
  }
  BOOL v7 = 0;
LABEL_19:

  return v7;
}

@end