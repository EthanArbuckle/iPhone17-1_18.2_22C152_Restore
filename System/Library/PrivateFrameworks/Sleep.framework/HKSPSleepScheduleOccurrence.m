@interface HKSPSleepScheduleOccurrence
+ (BOOL)supportsSecureCoding;
+ (id)occurrenceWithWeekdays:(unint64_t)a3 backingOccurrence:(id)a4;
- (BOOL)crossesDayBoundary;
- (BOOL)isAlarmEquivalentToOverrideOccurrence:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEquivalentTo:(id)a3;
- (BOOL)isEquivalentToOverrideOccurrence:(id)a3;
- (BOOL)isInitialized;
- (BOOL)isRepeating;
- (BOOL)isSingleDayOverride;
- (BOOL)isValidOccurrence;
- (BOOL)overrideAppliesToOccurrence:(id)a3 gregorianCalendar:(id)a4;
- (BOOL)overridesWakeUpForOccurrenceOnDate:(id)a3 gregorianCalendar:(id)a4;
- (BOOL)usesDefaultBedtimeAndWakeUpComponents;
- (HKSPAlarmConfiguration)alarmConfiguration;
- (HKSPSleepScheduleDayOccurrence)backingOccurrence;
- (HKSPSleepScheduleOccurrence)init;
- (HKSPSleepScheduleOccurrence)initWithCoder:(id)a3;
- (NSDateComponents)bedtimeComponents;
- (NSDateComponents)wakeUpComponents;
- (NSString)description;
- (double)actualSleepInterval;
- (double)generalSleepInterval;
- (id)bedtimeDateForWakeUpDate:(id)a3 gregorianCalendar:(id)a4;
- (id)changesFromOccurrence:(id)a3;
- (id)convertToScheduledOccurrenceOnSameDaysAsOccurrence:(id)a3;
- (id)initFromObject:(id)a3;
- (id)mutableCopy;
- (id)nextDateIntervalWithWakeUpAfterDate:(id)a3 gregorianCalendar:(id)a4;
- (id)overrideOccurrenceTemplateForCurrentDate:(id)a3 gregorianCalendar:(id)a4;
- (id)overrideOccurrenceWithWakeUpComponents:(id)a3 bedtimeComponents:(id)a4;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)wakeUpDateForDate:(id)a3 day:(int64_t)a4 searchBackwards:(BOOL)a5 gregorianCalendar:(id)a6;
- (id)wakeUpDateForDate:(id)a3 searchBackwards:(BOOL)a4 gregorianCalendar:(id)a5;
- (int64_t)overrideDayInCalendar:(id)a3;
- (unint64_t)version;
- (unint64_t)weekdays;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKSPSleepScheduleOccurrence

- (id)initFromObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(HKSPSleepScheduleOccurrence *)self init];
    HKSPCopyFromObject(v5, v6);

    self = v6;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (HKSPSleepScheduleOccurrence)init
{
  v8.receiver = self;
  v8.super_class = (Class)HKSPSleepScheduleOccurrence;
  v2 = [(HKSPSleepScheduleOccurrence *)&v8 init];
  v3 = (HKSPSleepScheduleOccurrence *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 8) = xmmword_1A7ED54C0;
    id v4 = objc_alloc_init(HKSPSleepScheduleDayOccurrence);
    backingOccurrence = v3->_backingOccurrence;
    v3->_backingOccurrence = v4;

    v6 = v3;
  }

  return v3;
}

- (void).cxx_destruct
{
}

- (unint64_t)version
{
  return self->_version;
}

- (id)succinctDescription
{
  v2 = [(HKSPSleepScheduleOccurrence *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = [(HKSPSleepScheduleOccurrence *)self bedtimeComponents];
  id v5 = objc_msgSend(v4, "hksp_description");
  [v3 appendString:v5 withName:@"bedtime"];

  v6 = [(HKSPSleepScheduleOccurrence *)self wakeUpComponents];
  v7 = objc_msgSend(v6, "hksp_description");
  [v3 appendString:v7 withName:@"wakeUp"];

  if ([(HKSPSleepScheduleOccurrence *)self weekdays] == 0xFFFFFFFF)
  {
    objc_super v8 = @"(unset)";
  }
  else
  {
    if ([(HKSPSleepScheduleOccurrence *)self weekdays])
    {
      v9 = NSStringFromHKSPWeekdays([(HKSPSleepScheduleOccurrence *)self weekdays]);
      [v3 appendString:v9 withName:@"weekdays"];

      goto LABEL_7;
    }
    objc_super v8 = @"None";
  }
  [v3 appendString:v8 withName:@"weekdays"];
LABEL_7:
  v10 = [(HKSPSleepScheduleOccurrence *)self alarmConfiguration];
  id v11 = (id)objc_msgSend(v3, "appendBool:withName:", objc_msgSend(v10, "isEnabled"), @"alarm");

  return v3;
}

- (HKSPAlarmConfiguration)alarmConfiguration
{
  v2 = [(HKSPSleepScheduleOccurrence *)self backingOccurrence];
  v3 = [v2 alarmConfiguration];

  return (HKSPAlarmConfiguration *)v3;
}

- (BOOL)isValidOccurrence
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HKSPSleepScheduleOccurrence *)self wakeUpComponents];
  if (!v3
    || (id v4 = (void *)v3,
        [(HKSPSleepScheduleOccurrence *)self bedtimeComponents],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        !v5))
  {
    v12 = HKSPLogForCategory(5uLL);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    int v23 = 138543362;
    id v24 = (id)objc_opt_class();
    id v18 = v24;
    v19 = "[%{public}@] nil date components found";
    goto LABEL_25;
  }
  v6 = [(HKSPSleepScheduleOccurrence *)self wakeUpComponents];
  if ([v6 hour] >= 24)
  {

    goto LABEL_16;
  }
  v7 = [(HKSPSleepScheduleOccurrence *)self bedtimeComponents];
  uint64_t v8 = [v7 hour];

  if (v8 >= 24)
  {
LABEL_16:
    v12 = HKSPLogForCategory(5uLL);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    int v23 = 138543362;
    id v24 = (id)objc_opt_class();
    id v18 = v24;
    v19 = "[%{public}@] invalid date components found";
    goto LABEL_25;
  }
  if ([(HKSPSleepScheduleOccurrence *)self weekdays])
  {
    v9 = [(HKSPSleepScheduleOccurrence *)self wakeUpComponents];
    if ([v9 year] == 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = [(HKSPSleepScheduleOccurrence *)self bedtimeComponents];
      uint64_t v11 = [v10 year];

      if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_8;
      }
    }
    else
    {
    }
    v12 = HKSPLogForCategory(5uLL);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    int v23 = 138543362;
    id v24 = (id)objc_opt_class();
    id v18 = v24;
    v19 = "[%{public}@] invalid components for repeating occurrence";
LABEL_25:
    _os_log_error_impl(&dword_1A7E74000, v12, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v23, 0xCu);

    goto LABEL_17;
  }
LABEL_8:
  if (![(HKSPSleepScheduleOccurrence *)self isSingleDayOverride]) {
    return 1;
  }
  v12 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendar");
  v13 = [(HKSPSleepScheduleOccurrence *)self wakeUpComponents];
  v14 = [v12 dateFromComponents:v13];

  v15 = [(HKSPSleepScheduleOccurrence *)self bedtimeComponents];
  v16 = [v12 dateFromComponents:v15];

  if (!objc_msgSend(v16, "hksp_isAfterOrSameAsDate:", v14))
  {

    BOOL v20 = 1;
    goto LABEL_18;
  }
  v17 = HKSPLogForCategory(5uLL);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    int v23 = 138543362;
    id v24 = (id)objc_opt_class();
    id v22 = v24;
    _os_log_error_impl(&dword_1A7E74000, v17, OS_LOG_TYPE_ERROR, "[%{public}@] bedtime is after wakeup", (uint8_t *)&v23, 0xCu);
  }
LABEL_17:
  BOOL v20 = 0;
LABEL_18:

  return v20;
}

- (id)wakeUpDateForDate:(id)a3 searchBackwards:(BOOL)a4 gregorianCalendar:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  int v23 = __Block_byref_object_copy__1;
  id v24 = __Block_byref_object_dispose__1;
  if (a4) {
    [MEMORY[0x1E4F1C9C8] distantPast];
  }
  else {
  id v25 = [MEMORY[0x1E4F1C9C8] distantFuture];
  }
  uint64_t v10 = [(HKSPSleepScheduleOccurrence *)self weekdays];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __83__HKSPSleepScheduleOccurrence_wakeUpDateForDate_searchBackwards_gregorianCalendar___block_invoke;
  v15[3] = &unk_1E5D329B8;
  v15[4] = self;
  id v11 = v8;
  id v16 = v11;
  BOOL v19 = a4;
  id v12 = v9;
  id v17 = v12;
  id v18 = &v20;
  HKSPWeekdaysEnumerateDays(v10, v15, a4);
  id v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v13;
}

void __83__HKSPSleepScheduleOccurrence_wakeUpDateForDate_searchBackwards_gregorianCalendar___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) wakeUpDateForDate:*(void *)(a1 + 40) day:a2 searchBackwards:*(unsigned __int8 *)(a1 + 64) gregorianCalendar:*(void *)(a1 + 48)];
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id v6 = v3;
  if (*(unsigned char *)(a1 + 64)) {
    [v3 laterDate:v4];
  }
  else {
  id v5 = [v3 earlierDate:v4];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v5);
}

- (id)bedtimeDateForWakeUpDate:(id)a3 gregorianCalendar:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HKSPSleepScheduleOccurrence *)self bedtimeComponents];
  id v9 = (void *)[v8 copy];

  [v9 setSecond:0];
  uint64_t v10 = objc_msgSend(v6, "hksp_previousDateBeforeDate:matchingComponents:", v7, v9);

  return v10;
}

- (NSDateComponents)bedtimeComponents
{
  v2 = [(HKSPSleepScheduleOccurrence *)self backingOccurrence];
  uint64_t v3 = [v2 bedtimeComponents];

  return (NSDateComponents *)v3;
}

- (id)wakeUpDateForDate:(id)a3 day:(int64_t)a4 searchBackwards:(BOOL)a5 gregorianCalendar:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  id v12 = [(HKSPSleepScheduleOccurrence *)self wakeUpComponents];
  id v13 = (void *)[v12 copy];

  [v13 setSecond:0];
  if (![(HKSPSleepScheduleOccurrence *)self isSingleDayOverride])
  {
    if ((unint64_t)(a4 - 1) >= 7) {
      int64_t v14 = 0;
    }
    else {
      int64_t v14 = a4;
    }
    [v13 setWeekday:v14];
  }
  if (v7) {
    objc_msgSend(v11, "hksp_previousDateBeforeDate:matchingComponents:", v10, v13);
  }
  else {
  v15 = objc_msgSend(v11, "hksp_nextDateAfterDate:matchingComponents:", v10, v13);
  }

  return v15;
}

- (BOOL)isSingleDayOverride
{
  if ([(HKSPSleepScheduleOccurrence *)self weekdays]) {
    return 0;
  }
  uint64_t v4 = [(HKSPSleepScheduleOccurrence *)self wakeUpComponents];
  BOOL v3 = [v4 year] != 0x7FFFFFFFFFFFFFFFLL;

  return v3;
}

- (unint64_t)weekdays
{
  return self->_weekdays;
}

- (NSDateComponents)wakeUpComponents
{
  v2 = [(HKSPSleepScheduleOccurrence *)self backingOccurrence];
  BOOL v3 = [v2 wakeUpComponents];

  return (NSDateComponents *)v3;
}

- (HKSPSleepScheduleDayOccurrence)backingOccurrence
{
  return self->_backingOccurrence;
}

- (HKSPSleepScheduleOccurrence)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKSPSleepScheduleOccurrence;
  id v5 = [(HKSPSleepScheduleOccurrence *)&v9 init];
  id v6 = v5;
  if (v5)
  {
    HKSPDecodeObjectWithCoder(v5, v4);
    BOOL v7 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutableCopy
{
  BOOL v3 = [HKSPMutableSleepScheduleOccurrence alloc];
  return [(HKSPMutableSleepScheduleOccurrence *)v3 initFromObject:self];
}

- (BOOL)isRepeating
{
  BOOL v3 = [(HKSPSleepScheduleOccurrence *)self isInitialized];
  if (v3) {
    LOBYTE(v3) = ![(HKSPSleepScheduleOccurrence *)self isSingleDayOverride];
  }
  return v3;
}

- (BOOL)usesDefaultBedtimeAndWakeUpComponents
{
  BOOL v3 = [(HKSPSleepScheduleOccurrence *)self bedtimeComponents];
  uint64_t v4 = [v3 hour];
  if (v4 == HKSPBedtimeHourDefault)
  {
    id v5 = [(HKSPSleepScheduleOccurrence *)self bedtimeComponents];
    uint64_t v6 = [v5 minute];
    if (v6 == HKSPBedtimeMinuteDefault)
    {
      BOOL v7 = [(HKSPSleepScheduleOccurrence *)self wakeUpComponents];
      uint64_t v8 = [v7 hour];
      if (v8 == HKSPWakeUpHourDefault)
      {
        objc_super v9 = [(HKSPSleepScheduleOccurrence *)self wakeUpComponents];
        uint64_t v10 = [v9 minute];
        BOOL v11 = v10 == HKSPWakeUpMinuteDefault;
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)isInitialized
{
  return [(HKSPSleepScheduleOccurrence *)self weekdays] != 0xFFFFFFFF;
}

- (id)overrideOccurrenceWithWakeUpComponents:(id)a3 bedtimeComponents:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[HKSPMutableSleepScheduleOccurrence alloc] initWithTemplateOccurrence:self];
  [(HKSPMutableSleepScheduleOccurrence *)v8 setWeekdays:0];
  [(HKSPMutableSleepScheduleOccurrence *)v8 setWakeUpComponents:v7];

  [(HKSPMutableSleepScheduleOccurrence *)v8 setBedtimeComponents:v6];
  return v8;
}

- (id)overrideOccurrenceTemplateForCurrentDate:(id)a3 gregorianCalendar:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_super v9 = [v8 calendarIdentifier];
  char v10 = [v9 isEqualToString:*MEMORY[0x1E4F1C318]];

  if ((v10 & 1) == 0)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HKSPSleepScheduleOccurrence.m", 126, @"Invalid parameter not satisfying: %@", @"[[gregorianCalendar calendarIdentifier] isEqualToString:NSCalendarIdentifierGregorian]" object file lineNumber description];
  }
  if ([(HKSPSleepScheduleOccurrence *)self isSingleDayOverride])
  {
    BOOL v11 = [[HKSPMutableSleepScheduleOccurrence alloc] initWithTemplateOccurrence:self];
  }
  else
  {
    id v12 = [(HKSPSleepScheduleOccurrence *)self wakeUpComponents];
    id v13 = objc_msgSend(v8, "hksp_nextDateAfterDate:matchingComponents:", v7, v12);

    int64_t v14 = [(HKSPSleepScheduleOccurrence *)self bedtimeDateForWakeUpDate:v13 gregorianCalendar:v8];
    v15 = [v8 components:124 fromDate:v13];
    id v16 = [v8 components:124 fromDate:v14];
    BOOL v11 = [(HKSPSleepScheduleOccurrence *)self overrideOccurrenceWithWakeUpComponents:v15 bedtimeComponents:v16];
  }
  return v11;
}

- (id)convertToScheduledOccurrenceOnSameDaysAsOccurrence:(id)a3
{
  id v4 = a3;
  if ([(HKSPSleepScheduleOccurrence *)self isSingleDayOverride])
  {
    id v5 = [(HKSPSleepScheduleOccurrence *)self backingOccurrence];
    id v6 = (void *)[v5 mutableCopy];

    id v7 = [(HKSPSleepScheduleOccurrence *)self wakeUpComponents];
    id v8 = objc_msgSend(v7, "hksp_timeComponents");
    [v6 setWakeUpComponents:v8];

    objc_super v9 = [(HKSPSleepScheduleOccurrence *)self bedtimeComponents];
    char v10 = objc_msgSend(v9, "hksp_timeComponents");
    [v6 setBedtimeComponents:v10];

    BOOL v11 = [v4 backingOccurrence];
    id v12 = (void *)[v11 mutableCopy];

    id v13 = HKSPGenerateChangeSetBetweenObjects(v12, v6);
    HKSPApplyChangesToObject(v12, v13);
    int64_t v14 = objc_msgSend(v12, "generateSleepScheduleOccurrenceWithWeekdays:", objc_msgSend(v4, "weekdays"));
    id v15 = (id)[v14 mutableCopy];
  }
  else
  {
    id v15 = [(HKSPSleepScheduleOccurrence *)self mutableCopy];
  }

  return v15;
}

- (id)changesFromOccurrence:(id)a3
{
  id v4 = a3;
  id v5 = [(HKSPSleepScheduleOccurrence *)self backingOccurrence];
  id v6 = [v4 backingOccurrence];

  id v7 = [v5 changesFromOccurrence:v6];

  return v7;
}

+ (id)occurrenceWithWeekdays:(unint64_t)a3 backingOccurrence:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(HKSPMutableSleepScheduleOccurrence);
  id v7 = (void *)[v5 copy];

  [(HKSPMutableSleepScheduleOccurrence *)v6 setBackingOccurrence:v7];
  [(HKSPMutableSleepScheduleOccurrence *)v6 setWeekdays:a3];
  id v8 = (void *)[(HKSPMutableSleepScheduleOccurrence *)v6 copy];

  return v8;
}

- (BOOL)overridesWakeUpForOccurrenceOnDate:(id)a3 gregorianCalendar:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_super v9 = [v8 calendarIdentifier];
  char v10 = [v9 isEqualToString:*MEMORY[0x1E4F1C318]];

  if ((v10 & 1) == 0)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"HKSPSleepScheduleOccurrence.m", 166, @"Invalid parameter not satisfying: %@", @"[[gregorianCalendar calendarIdentifier] isEqualToString:NSCalendarIdentifierGregorian]" object file lineNumber description];
  }
  if ([(HKSPSleepScheduleOccurrence *)self isSingleDayOverride])
  {
    BOOL v11 = [v8 startOfDayForDate:v7];
    id v12 = [(HKSPSleepScheduleOccurrence *)self wakeUpComponents];
    id v13 = [v8 dateFromComponents:v12];

    int64_t v14 = [v8 startOfDayForDate:v13];
    char v15 = [v14 isEqualToDate:v11];
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (BOOL)overrideAppliesToOccurrence:(id)a3 gregorianCalendar:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_super v9 = [v8 calendarIdentifier];
  char v10 = [v9 isEqualToString:*MEMORY[0x1E4F1C318]];

  if ((v10 & 1) == 0)
  {
    char v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"HKSPSleepScheduleOccurrence.m", 175, @"Invalid parameter not satisfying: %@", @"[[gregorianCalendar calendarIdentifier] isEqualToString:NSCalendarIdentifierGregorian]" object file lineNumber description];
  }
  if ([(HKSPSleepScheduleOccurrence *)self isSingleDayOverride])
  {
    int64_t v11 = [(HKSPSleepScheduleOccurrence *)self overrideDayInCalendar:v8];
    uint64_t v17 = 0;
    id v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    uint64_t v12 = [v7 weekdays];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __77__HKSPSleepScheduleOccurrence_overrideAppliesToOccurrence_gregorianCalendar___block_invoke;
    v16[3] = &unk_1E5D329E0;
    v16[4] = &v17;
    v16[5] = v11;
    HKSPWeekdaysEnumerateDays(v12, v16, 0);
    BOOL v13 = *((unsigned char *)v18 + 24) != 0;
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

uint64_t __77__HKSPSleepScheduleOccurrence_overrideAppliesToOccurrence_gregorianCalendar___block_invoke(uint64_t result, uint64_t a2, unsigned char *a3)
{
  if (*(void *)(result + 40) == a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (int64_t)overrideDayInCalendar:(id)a3
{
  id v5 = a3;
  id v6 = [v5 calendarIdentifier];
  char v7 = [v6 isEqualToString:*MEMORY[0x1E4F1C318]];

  if ((v7 & 1) == 0)
  {
    BOOL v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HKSPSleepScheduleOccurrence.m", 191, @"Invalid parameter not satisfying: %@", @"[gregorianCalendar.calendarIdentifier isEqualToString:NSCalendarIdentifierGregorian]" object file lineNumber description];
  }
  if ([(HKSPSleepScheduleOccurrence *)self isSingleDayOverride])
  {
    id v8 = [(HKSPSleepScheduleOccurrence *)self wakeUpComponents];
    objc_super v9 = [v5 dateFromComponents:v8];

    if (v9)
    {
      uint64_t v10 = [v5 component:512 fromDate:v9];
      if ((unint64_t)(v10 - 1) >= 7) {
        int64_t v11 = 0;
      }
      else {
        int64_t v11 = v10;
      }
    }
    else
    {
      int64_t v11 = 0;
    }
  }
  else
  {
    int64_t v11 = 0;
  }

  return v11;
}

- (id)nextDateIntervalWithWakeUpAfterDate:(id)a3 gregorianCalendar:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_super v9 = [v8 calendarIdentifier];
  char v10 = [v9 isEqualToString:*MEMORY[0x1E4F1C318]];

  if ((v10 & 1) == 0)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"HKSPSleepScheduleOccurrence.m", 200, @"Invalid parameter not satisfying: %@", @"[[gregorianCalendar calendarIdentifier] isEqualToString:NSCalendarIdentifierGregorian]" object file lineNumber description];
  }
  if ([(HKSPSleepScheduleOccurrence *)self isSingleDayOverride])
  {
    int64_t v11 = [(HKSPSleepScheduleOccurrence *)self wakeUpComponents];
    uint64_t v12 = [v8 dateFromComponents:v11];

    BOOL v13 = [(HKSPSleepScheduleOccurrence *)self bedtimeComponents];
    int64_t v14 = [v8 dateFromComponents:v13];
  }
  else
  {
    uint64_t v12 = [(HKSPSleepScheduleOccurrence *)self wakeUpDateForDate:v7 searchBackwards:0 gregorianCalendar:v8];
    int64_t v14 = [(HKSPSleepScheduleOccurrence *)self bedtimeDateForWakeUpDate:v12 gregorianCalendar:v8];
  }
  char v15 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v14 endDate:v12];

  return v15;
}

- (BOOL)crossesDayBoundary
{
  BOOL v3 = [(HKSPSleepScheduleOccurrence *)self bedtimeComponents];
  uint64_t v4 = [v3 hour];
  id v5 = [(HKSPSleepScheduleOccurrence *)self wakeUpComponents];
  if (v4 <= [v5 hour])
  {
    id v7 = [(HKSPSleepScheduleOccurrence *)self bedtimeComponents];
    uint64_t v8 = [v7 hour];
    objc_super v9 = [(HKSPSleepScheduleOccurrence *)self wakeUpComponents];
    if (v8 == [v9 hour])
    {
      char v10 = [(HKSPSleepScheduleOccurrence *)self bedtimeComponents];
      uint64_t v11 = [v10 minute];
      uint64_t v12 = [(HKSPSleepScheduleOccurrence *)self wakeUpComponents];
      BOOL v6 = v11 > [v12 minute];
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (BOOL)isEquivalentToOverrideOccurrence:(id)a3
{
  id v5 = a3;
  if ([(HKSPSleepScheduleOccurrence *)self isSingleDayOverride])
  {
    char v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"HKSPSleepScheduleOccurrence.m" lineNumber:299 description:@"This should not be called on an override occurrence"];
  }
  if (([v5 isSingleDayOverride] & 1) == 0)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"HKSPSleepScheduleOccurrence.m" lineNumber:300 description:@"overrideOccurrence should be an actual override occurrence"];
  }
  BOOL v6 = [(HKSPSleepScheduleOccurrence *)self backingOccurrence];
  id v7 = [v5 backingOccurrence];
  char v8 = [v6 isEquivalentToOccurrenceIgnoringDates:v7];

  return v8;
}

- (BOOL)isAlarmEquivalentToOverrideOccurrence:(id)a3
{
  id v5 = a3;
  if ([(HKSPSleepScheduleOccurrence *)self isSingleDayOverride])
  {
    char v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"HKSPSleepScheduleOccurrence.m" lineNumber:305 description:@"This should not be called on an override occurrence"];
  }
  if (([v5 isSingleDayOverride] & 1) == 0)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"HKSPSleepScheduleOccurrence.m" lineNumber:306 description:@"overrideOccurrence should be an actual override occurrence"];
  }
  BOOL v6 = [(HKSPSleepScheduleOccurrence *)self backingOccurrence];
  id v7 = [v5 backingOccurrence];
  char v8 = [v6 isAlarmEquivalentToOccurrenceIgnoringDates:v7];

  return v8;
}

- (double)actualSleepInterval
{
  BOOL v3 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendar");
  id v5 = [(HKSPSleepScheduleOccurrence *)self nextDateIntervalWithWakeUpAfterDate:v3 gregorianCalendar:v4];
  [v5 duration];
  double v7 = v6;

  return v7;
}

- (double)generalSleepInterval
{
  BOOL v3 = [(HKSPSleepScheduleOccurrence *)self wakeUpComponents];
  double v4 = (double)[v3 hour];
  id v5 = [(HKSPSleepScheduleOccurrence *)self wakeUpComponents];
  double v6 = (double)[v5 minute] * 60.0 + v4 * 3600.0;

  double v7 = [(HKSPSleepScheduleOccurrence *)self bedtimeComponents];
  double v8 = (double)[v7 hour];
  objc_super v9 = [(HKSPSleepScheduleOccurrence *)self bedtimeComponents];
  double v10 = (double)[v9 minute] * 60.0;

  BOOL v11 = [(HKSPSleepScheduleOccurrence *)self crossesDayBoundary];
  double v12 = 86400.0 - (v10 + v8 * 3600.0);
  if (!v11) {
    double v12 = -(v10 + v8 * 3600.0);
  }
  return v6 + v12;
}

- (BOOL)isEqual:(id)a3
{
  return HKSPObjectsAreEqual(self, a3);
}

- (BOOL)isEquivalentTo:(id)a3
{
  return HKSPObjectsAreEquivalentWithTransformer(self, a3, &__block_literal_global_381);
}

- (NSString)description
{
  return (NSString *)[(HKSPSleepScheduleOccurrence *)self descriptionWithMultilinePrefix:0];
}

@end