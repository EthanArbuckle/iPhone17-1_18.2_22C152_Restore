@interface HKSPSleepSchedule
+ (BOOL)supportsSecureCoding;
+ (id)emptyScheduleWithSyncAnchor:(id)a3;
+ (id)innerClasses;
- (BOOL)hasOccurrences;
- (BOOL)isDefaultSchedule;
- (BOOL)isEmptySleepSchedule;
- (BOOL)isEnabled;
- (BOOL)isEnabledAndHasOccurrences;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEquivalentTo:(id)a3;
- (BOOL)meetsDefaultSleepGoal;
- (HKSPSleepSchedule)init;
- (HKSPSleepSchedule)initWithCoder:(id)a3;
- (HKSPSleepScheduleDayOccurrence)fridayOccurrence;
- (HKSPSleepScheduleDayOccurrence)mondayOccurrence;
- (HKSPSleepScheduleDayOccurrence)overrideDayOccurrence;
- (HKSPSleepScheduleDayOccurrence)saturdayOccurrence;
- (HKSPSleepScheduleDayOccurrence)sundayOccurrence;
- (HKSPSleepScheduleDayOccurrence)thursdayOccurrence;
- (HKSPSleepScheduleDayOccurrence)tuesdayOccurrence;
- (HKSPSleepScheduleDayOccurrence)wednesdayOccurrence;
- (HKSPSleepScheduleOccurrence)overrideOccurrence;
- (HKSPSyncAnchor)syncAnchor;
- (NSArray)occurrences;
- (NSDate)lastModifiedDate;
- (NSString)description;
- (double)maximumAllowableWindDown;
- (double)sleepDurationGoal;
- (double)windDownTime;
- (id)_unsortedOccurrences;
- (id)_wakeUpComponentsByAddingSleepDurationGoalToBedtimeComponents:(id)a3;
- (id)allowableRangeForModifiedOccurrence:(id)a3 gregorianCalendar:(id)a4;
- (id)allowableRangeForWeekdays:(unint64_t)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)emptyCopy;
- (id)initFromObject:(id)a3;
- (id)mutableCopy;
- (id)mutableOccurrenceTemplate;
- (id)objectWithSyncAnchor:(id)a3;
- (id)occurrenceOnDay:(int64_t)a3;
- (id)occurrencesAfterDate:(id)a3 gregorianCalendar:(id)a4;
- (id)occurrencesOnDays:(unint64_t)a3;
- (id)overridenOccurrenceForOverrideOccurrence:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)version;
- (unint64_t)weekdaysWithOccurrences;
- (unint64_t)weekdaysWithoutOccurrences;
- (unint64_t)windDownMinutes;
- (void)_enumerateDayOccurrencesWithBlock:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKSPSleepSchedule

void __41__HKSPSleepSchedule__unsortedOccurrences__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v6 = [a3 firstObject];
  v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];

  objc_msgSend(v6, "generateSleepScheduleOccurrenceWithWeekdays:", objc_msgSend(v7, "unsignedIntegerValue"));
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 40) addObject:v8];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(HKSPSleepSchedule *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F4F718];
  id v5 = a3;
  v6 = [v4 builderWithObject:self];
  id v7 = (id)objc_msgSend(v6, "appendBool:withName:", -[HKSPSleepSchedule isEnabled](self, "isEnabled"), @"enabled");
  id v8 = [(HKSPSleepSchedule *)self occurrences];
  [v6 appendArraySection:v8 withName:@"occurrences" multilinePrefix:v5 skipIfEmpty:0];

  [(HKSPSleepSchedule *)self windDownTime];
  id v9 = (id)objc_msgSend(v6, "appendDouble:withName:decimalPrecision:", @"windDownTime", 1);
  [(HKSPSleepSchedule *)self sleepDurationGoal];
  id v10 = (id)objc_msgSend(v6, "appendDouble:withName:decimalPrecision:", @"sleepDurationGoal", 1);
  return v6;
}

- (double)sleepDurationGoal
{
  return self->_sleepDurationGoal;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (NSArray)occurrences
{
  v2 = [(HKSPSleepSchedule *)self _unsortedOccurrences];
  v3 = [v2 sortedArrayUsingComparator:&__block_literal_global_286_0];

  return (NSArray *)v3;
}

- (id)_unsortedOccurrences
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __41__HKSPSleepSchedule__unsortedOccurrences__block_invoke;
  v17[3] = &unk_1E5D32A90;
  id v6 = v3;
  id v18 = v6;
  id v19 = v4;
  id v7 = v5;
  id v20 = v7;
  id v8 = v4;
  [(HKSPSleepSchedule *)self _enumerateDayOccurrencesWithBlock:v17];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __41__HKSPSleepSchedule__unsortedOccurrences__block_invoke_2;
  v14[3] = &unk_1E5D32AB8;
  id v15 = v7;
  id v9 = v6;
  id v16 = v9;
  id v10 = v7;
  [v8 enumerateKeysAndObjectsUsingBlock:v14];
  v11 = v16;
  id v12 = v9;

  return v12;
}

- (void)_enumerateDayOccurrencesWithBlock:(id)a3
{
  id v20 = (void (**)(id, uint64_t, void *))a3;
  id v4 = [(HKSPSleepSchedule *)self mondayOccurrence];

  if (v4)
  {
    id v5 = [(HKSPSleepSchedule *)self mondayOccurrence];
    v20[2](v20, 2, v5);
  }
  id v6 = [(HKSPSleepSchedule *)self tuesdayOccurrence];

  if (v6)
  {
    id v7 = [(HKSPSleepSchedule *)self tuesdayOccurrence];
    v20[2](v20, 3, v7);
  }
  id v8 = [(HKSPSleepSchedule *)self wednesdayOccurrence];

  if (v8)
  {
    id v9 = [(HKSPSleepSchedule *)self wednesdayOccurrence];
    v20[2](v20, 4, v9);
  }
  id v10 = [(HKSPSleepSchedule *)self thursdayOccurrence];

  if (v10)
  {
    v11 = [(HKSPSleepSchedule *)self thursdayOccurrence];
    v20[2](v20, 5, v11);
  }
  id v12 = [(HKSPSleepSchedule *)self fridayOccurrence];

  if (v12)
  {
    v13 = [(HKSPSleepSchedule *)self fridayOccurrence];
    v20[2](v20, 6, v13);
  }
  v14 = [(HKSPSleepSchedule *)self saturdayOccurrence];

  if (v14)
  {
    id v15 = [(HKSPSleepSchedule *)self saturdayOccurrence];
    v20[2](v20, 7, v15);
  }
  id v16 = [(HKSPSleepSchedule *)self sundayOccurrence];

  if (v16)
  {
    v17 = [(HKSPSleepSchedule *)self sundayOccurrence];
    v20[2](v20, 1, v17);
  }
  id v18 = [(HKSPSleepSchedule *)self overrideDayOccurrence];

  if (v18)
  {
    id v19 = [(HKSPSleepSchedule *)self overrideDayOccurrence];
    v20[2](v20, 0, v19);
  }
}

- (HKSPSleepScheduleDayOccurrence)wednesdayOccurrence
{
  return self->_wednesdayOccurrence;
}

- (HKSPSleepScheduleDayOccurrence)tuesdayOccurrence
{
  return self->_tuesdayOccurrence;
}

- (HKSPSleepScheduleDayOccurrence)thursdayOccurrence
{
  return self->_thursdayOccurrence;
}

- (HKSPSleepScheduleDayOccurrence)sundayOccurrence
{
  return self->_sundayOccurrence;
}

- (HKSPSleepScheduleDayOccurrence)saturdayOccurrence
{
  return self->_saturdayOccurrence;
}

- (HKSPSleepScheduleDayOccurrence)mondayOccurrence
{
  return self->_mondayOccurrence;
}

- (HKSPSleepScheduleDayOccurrence)fridayOccurrence
{
  return self->_fridayOccurrence;
}

- (HKSPSleepScheduleDayOccurrence)overrideDayOccurrence
{
  return self->_overrideDayOccurrence;
}

uint64_t __32__HKSPSleepSchedule_occurrences__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  int v6 = [v5 isSingleDayOverride];
  if (v6 == [v4 isSingleDayOverride])
  {
    uint64_t v9 = [v5 weekdays];

    uint64_t v8 = HKSPCompareWeekdaysInCurrentCalendar(v9, [v4 weekdays]);
  }
  else
  {
    int v7 = [v5 isSingleDayOverride];

    if (v7) {
      uint64_t v8 = -1;
    }
    else {
      uint64_t v8 = 1;
    }
  }

  return v8;
}

- (double)windDownTime
{
  return self->_windDownTime;
}

void __41__HKSPSleepSchedule__unsortedOccurrences__block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v12 = v5;
  if (a2)
  {
    int v6 = [v5 groupingIdentifier];
    id v7 = [a1[5] objectForKeyedSubscript:v6];
    if (!v7)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [a1[5] setObject:v7 forKeyedSubscript:v6];
    }
    [v7 addObject:v12];
    uint64_t v8 = [a1[6] objectForKeyedSubscript:v6];
    uint64_t v9 = [v8 unsignedIntegerValue];

    if ((unint64_t)(a2 + 2) > 9) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = qword_1A7ED54D8[a2 + 2];
    }
    v11 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v10 | v9];
    [a1[6] setObject:v11 forKeyedSubscript:v6];
  }
  else
  {
    int v6 = [v5 generateSleepScheduleOccurrenceWithWeekdays:0];
    [a1[4] addObject:v6];
  }
}

- (BOOL)isEqual:(id)a3
{
  return HKSPObjectsAreEqual(self, a3);
}

- (unint64_t)version
{
  return self->_version;
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  HKSPEncodeObjectWithCoder(self, v4);
  if ((objc_msgSend(v4, "hksp_serializationOptions") & 1) == 0) {
    [v4 encodeObject:self->_syncAnchor forKey:@"HKSPScheduleSyncAnchor"];
  }
}

- (HKSPSleepSchedule)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKSPSleepSchedule;
  id v5 = [(HKSPSleepSchedule *)&v11 init];
  int v6 = v5;
  if (v5)
  {
    HKSPDecodeObjectWithCoder(v5, v4);
    if ((objc_msgSend(v4, "hksp_serializationOptions") & 1) == 0)
    {
      uint64_t v7 = [v4 decodeObjectOfClass:HKSPSyncAnchorClass() forKey:@"HKSPScheduleSyncAnchor"];
      syncAnchor = v6->_syncAnchor;
      v6->_syncAnchor = (HKSPSyncAnchor *)v7;
    }
    uint64_t v9 = v6;
  }

  return v6;
}

- (HKSPSleepScheduleOccurrence)overrideOccurrence
{
  v2 = [(HKSPSleepSchedule *)self overrideDayOccurrence];
  id v3 = [v2 generateSleepScheduleOccurrenceWithWeekdays:0];

  return (HKSPSleepScheduleOccurrence *)v3;
}

- (NSString)description
{
  return (NSString *)[(HKSPSleepSchedule *)self descriptionWithMultilinePrefix:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKSPSleepSchedule)init
{
  v6.receiver = self;
  v6.super_class = (Class)HKSPSleepSchedule;
  v2 = [(HKSPSleepSchedule *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_version = 1;
    v2->_enabled = 1;
    v2->_sleepDurationGoal = 0.0;
    v2->_windDownTime = *(double *)&HKSPWindDownMinutesDefault * 60.0;
    id v4 = v2;
  }

  return v3;
}

- (id)initFromObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    objc_super v6 = [(HKSPSleepSchedule *)self init];
    HKSPCopyFromObject(v5, v6);
    uint64_t v7 = [v5 syncAnchor];

    uint64_t v8 = [v7 copyWithZone:0];
    syncAnchor = v6->_syncAnchor;
    v6->_syncAnchor = (HKSPSyncAnchor *)v8;

    self = v6;
    uint64_t v10 = self;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)objectWithSyncAnchor:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initFromObject:self];
  uint64_t v6 = [v4 copyWithZone:0];

  uint64_t v7 = (void *)v5[4];
  v5[4] = v6;

  return v5;
}

- (BOOL)isEmptySleepSchedule
{
  return 0;
}

+ (id)emptyScheduleWithSyncAnchor:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(_HKSPEmptySleepSchedule);
  id v5 = [(HKSPSleepSchedule *)v4 objectWithSyncAnchor:v3];

  return v5;
}

- (BOOL)hasOccurrences
{
  v2 = [(HKSPSleepSchedule *)self _unsortedOccurrences];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)isEnabledAndHasOccurrences
{
  BOOL v3 = [(HKSPSleepSchedule *)self isEnabled];
  if (v3)
  {
    LOBYTE(v3) = [(HKSPSleepSchedule *)self hasOccurrences];
  }
  return v3;
}

- (BOOL)meetsDefaultSleepGoal
{
  BOOL v3 = [(HKSPSleepSchedule *)self hasOccurrences];
  if (v3)
  {
    id v4 = [(HKSPSleepSchedule *)self occurrences];
    char v5 = objc_msgSend(v4, "na_all:", &__block_literal_global_11);

    LOBYTE(v3) = v5;
  }
  return v3;
}

BOOL __42__HKSPSleepSchedule_meetsDefaultSleepGoal__block_invoke(uint64_t a1, void *a2)
{
  [a2 generalSleepInterval];
  return v2 >= *(double *)&HKSPSleepDurationGoalHoursDefault * 3600.0;
}

- (BOOL)isDefaultSchedule
{
  if (![(HKSPSleepSchedule *)self isEnabled]) {
    return 0;
  }
  BOOL v3 = [(HKSPSleepSchedule *)self occurrencesOnDays:127];
  if ([v3 count] == 1
    && ([v3 firstObject],
        id v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 weekdays],
        v4,
        v5 == 127))
  {
    uint64_t v6 = [v3 firstObject];
    char v7 = [v6 usesDefaultBedtimeAndWakeUpComponents];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)overridenOccurrenceForOverrideOccurrence:(id)a3
{
  id v4 = a3;
  if ([v4 isSingleDayOverride])
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendar");
    uint64_t v6 = [(HKSPSleepSchedule *)self occurrences];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __62__HKSPSleepSchedule_overridenOccurrenceForOverrideOccurrence___block_invoke;
    v10[3] = &unk_1E5D32B20;
    id v11 = v4;
    id v12 = v5;
    id v7 = v5;
    uint64_t v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v10);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t __62__HKSPSleepSchedule_overridenOccurrenceForOverrideOccurrence___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isSingleDayOverride]) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = [*(id *)(a1 + 32) overrideAppliesToOccurrence:v3 gregorianCalendar:*(void *)(a1 + 40)];
  }

  return v4;
}

- (id)occurrencesAfterDate:(id)a3 gregorianCalendar:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v8 calendarIdentifier];
  char v10 = [v9 isEqualToString:*MEMORY[0x1E4F1C318]];

  if ((v10 & 1) == 0)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HKSPSleepSchedule.m", 225, @"Invalid parameter not satisfying: %@", @"[[gregorianCalendar calendarIdentifier] isEqualToString:NSCalendarIdentifierGregorian]" object file lineNumber description];
  }
  id v11 = [(HKSPSleepSchedule *)self occurrences];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __60__HKSPSleepSchedule_occurrencesAfterDate_gregorianCalendar___block_invoke;
  v17[3] = &unk_1E5D32B20;
  id v18 = v8;
  id v19 = v7;
  id v12 = v7;
  id v13 = v8;
  v14 = objc_msgSend(v11, "na_filter:", v17);

  return v14;
}

uint64_t __60__HKSPSleepSchedule_occurrencesAfterDate_gregorianCalendar___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isSingleDayOverride])
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v3 wakeUpComponents];
    uint64_t v6 = [v4 dateFromComponents:v5];

    uint64_t v7 = objc_msgSend(v6, "hksp_isAfterDate:", *(void *)(a1 + 40));
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

- (id)mutableOccurrenceTemplate
{
  id v3 = [(HKSPSleepSchedule *)self occurrences];
  uint64_t v4 = objc_msgSend(v3, "na_firstObjectPassingTest:", &__block_literal_global_299);
  uint64_t v5 = v4;
  if (v4) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = objc_alloc_init(HKSPSleepScheduleOccurrence);
  }
  uint64_t v7 = v6;

  id v8 = [[HKSPMutableSleepScheduleOccurrence alloc] initWithTemplateOccurrence:v7];
  [(HKSPMutableSleepScheduleOccurrence *)v8 setWeekdays:[(HKSPSleepSchedule *)self weekdaysWithoutOccurrences]];
  uint64_t v9 = [(HKSPSleepScheduleOccurrence *)v8 bedtimeComponents];

  if (!v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [(HKSPMutableSleepScheduleOccurrence *)v8 setBedtimeComponents:v10];
  }
  id v11 = [(HKSPSleepScheduleOccurrence *)v8 wakeUpComponents];

  if (!v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [(HKSPMutableSleepScheduleOccurrence *)v8 setWakeUpComponents:v12];
  }
  id v13 = [(HKSPSleepScheduleOccurrence *)v8 bedtimeComponents];
  if ([v13 hour] == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v14 = 1;
  }
  else
  {
    id v15 = [(HKSPSleepScheduleOccurrence *)v8 bedtimeComponents];
    BOOL v14 = [v15 minute] == 0x7FFFFFFFFFFFFFFFLL;
  }
  id v16 = [(HKSPSleepScheduleOccurrence *)v8 wakeUpComponents];
  if ([v16 hour] == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v17 = 1;
  }
  else
  {
    id v18 = [(HKSPSleepScheduleOccurrence *)v8 wakeUpComponents];
    BOOL v17 = [v18 minute] == 0x7FFFFFFFFFFFFFFFLL;
  }
  [(HKSPSleepSchedule *)self sleepDurationGoal];
  double v20 = v19;
  if (v14)
  {
    uint64_t v21 = HKSPBedtimeHourDefault;
    v22 = [(HKSPSleepScheduleOccurrence *)v8 bedtimeComponents];
    [v22 setHour:v21];

    uint64_t v23 = HKSPBedtimeMinuteDefault;
    v24 = [(HKSPSleepScheduleOccurrence *)v8 bedtimeComponents];
    [v24 setMinute:v23];
  }
  if (v17)
  {
    if (v20 <= 0.0)
    {
      uint64_t v31 = HKSPWakeUpHourDefault;
      v32 = [(HKSPSleepScheduleOccurrence *)v8 wakeUpComponents];
      [v32 setHour:v31];

      uint64_t v33 = HKSPWakeUpMinuteDefault;
      v26 = [(HKSPSleepScheduleOccurrence *)v8 wakeUpComponents];
      [v26 setMinute:v33];
    }
    else
    {
      v25 = [(HKSPSleepScheduleOccurrence *)v8 bedtimeComponents];
      v26 = [(HKSPSleepSchedule *)self _wakeUpComponentsByAddingSleepDurationGoalToBedtimeComponents:v25];

      uint64_t v27 = [v26 hour];
      v28 = [(HKSPSleepScheduleOccurrence *)v8 wakeUpComponents];
      [v28 setHour:v27];

      uint64_t v29 = [v26 minute];
      v30 = [(HKSPSleepScheduleOccurrence *)v8 wakeUpComponents];
      [v30 setMinute:v29];
    }
  }

  return v8;
}

uint64_t __46__HKSPSleepSchedule_mutableOccurrenceTemplate__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSingleDayOverride] ^ 1;
}

- (id)_wakeUpComponentsByAddingSleepDurationGoalToBedtimeComponents:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1C9A8];
  id v5 = a3;
  uint64_t v6 = [v4 currentCalendar];
  uint64_t v7 = [v6 dateFromComponents:v5];

  [(HKSPSleepSchedule *)self sleepDurationGoal];
  id v8 = objc_msgSend(v7, "dateByAddingTimeInterval:");
  uint64_t v9 = [v6 components:96 fromDate:v8];

  return v9;
}

- (id)occurrencesOnDays:(unint64_t)a3
{
  uint64_t v4 = [(HKSPSleepSchedule *)self occurrences];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__HKSPSleepSchedule_occurrencesOnDays___block_invoke;
  v7[3] = &__block_descriptor_40_e37_B16__0__HKSPSleepScheduleOccurrence_8l;
  v7[4] = a3;
  id v5 = objc_msgSend(v4, "na_filter:", v7);

  return v5;
}

BOOL __39__HKSPSleepSchedule_occurrencesOnDays___block_invoke(uint64_t a1, void *a2)
{
  return (*(void *)(a1 + 32) & [a2 weekdays]) != 0;
}

- (id)occurrenceOnDay:(int64_t)a3
{
  uint64_t v4 = [(HKSPSleepSchedule *)self occurrences];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__HKSPSleepSchedule_occurrenceOnDay___block_invoke;
  v7[3] = &__block_descriptor_40_e37_B16__0__HKSPSleepScheduleOccurrence_8l;
  v7[4] = a3;
  id v5 = objc_msgSend(v4, "na_firstObjectPassingTest:", v7);

  return v5;
}

BOOL __37__HKSPSleepSchedule_occurrenceOnDay___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = v3;
  if ((unint64_t)(v2 + 2) > 9) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = qword_1A7ED54D8[v2 + 2];
  }
  uint64_t v6 = [v3 weekdays];

  return (v6 & v5) != 0;
}

- (unint64_t)weekdaysWithOccurrences
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = [(HKSPSleepSchedule *)self occurrences];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v8 weekdays] != 0xFFFFFFFFLL) {
          v5 |= [v8 weekdays];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (unint64_t)weekdaysWithoutOccurrences
{
  return 127 - [(HKSPSleepSchedule *)self weekdaysWithOccurrences];
}

- (id)allowableRangeForWeekdays:(unint64_t)a3
{
  unint64_t v5 = HKSPDaysForWeekdays(a3);
  id v6 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __47__HKSPSleepSchedule_allowableRangeForWeekdays___block_invoke;
  v42[3] = &unk_1E5D32B68;
  id v8 = v5;
  id v43 = v8;
  id v9 = v6;
  id v44 = v9;
  id v10 = v7;
  id v45 = v10;
  HKSPWeekdaysEnumerateDays(a3, v42, 0);
  long long v11 = [(HKSPSleepSchedule *)self occurrencesOnDays:HKSPWeekdaysFromDays(v9)];
  long long v12 = objc_msgSend(v11, "na_filter:", &__block_literal_global_306);
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__2;
  v40 = __Block_byref_object_dispose__2;
  id v41 = 0;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __47__HKSPSleepSchedule_allowableRangeForWeekdays___block_invoke_307;
  v35[3] = &unk_1E5D32B90;
  v35[4] = &v36;
  objc_msgSend(v12, "na_each:", v35);
  long long v13 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendar");
  uint64_t v27 = v8;
  if (v37[5])
  {
    [(HKSPSleepSchedule *)self windDownTime];
    objc_msgSend(v13, "hksp_componentsByAddingTimeInterval:toComponents:", v37[5], -v14);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v15 setHour:23];
    [v15 setMinute:59];
  }
  id v16 = objc_msgSend(v13, "hksp_componentsByAddingTimeInterval:toComponents:", v15, -60.0);
  BOOL v17 = [(HKSPSleepSchedule *)self occurrencesOnDays:HKSPWeekdaysFromDays(v10)];
  v26 = v12;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__2;
  uint64_t v33 = __Block_byref_object_dispose__2;
  id v34 = 0;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __47__HKSPSleepSchedule_allowableRangeForWeekdays___block_invoke_2_309;
  v28[3] = &unk_1E5D32B90;
  v28[4] = &v29;
  objc_msgSend(v17, "na_each:", v28);
  id v18 = v11;
  if (v30[5])
  {
    [(HKSPSleepSchedule *)self windDownTime];
    objc_msgSend(v13, "hksp_componentsByAddingTimeInterval:toComponents:", v30[5]);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = objc_msgSend((id)v30[5], "hksp_compareHourAndMinuteComponents:", v19);
    uint64_t v21 = objc_msgSend(v13, "hksp_componentsByAddingTimeInterval:toComponents:", v19, 60.0);
    BOOL v22 = v20 != 1;
  }
  else
  {
    id v23 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v23 setHour:0];
    [v23 setMinute:0];
    id v19 = v23;
    BOOL v22 = 1;
    uint64_t v21 = v19;
  }
  v24 = [[HKSPSleepScheduleRange alloc] initWithLatestWakeUpComponents:v15 latestBedtimeComponents:v16 earliestWakeUpComponents:v21 earliestBedtimeComponents:v19 earliestBedtimeIsOnPreviousDay:v22];

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v36, 8);

  return v24;
}

uint64_t __47__HKSPSleepSchedule_allowableRangeForWeekdays___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 7) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = a2 + 1;
  }
  if (([*(id *)(a1 + 32) containsIndex:v4] & 1) == 0) {
    [*(id *)(a1 + 40) addIndex:v4];
  }
  if (a2 == 1) {
    uint64_t v5 = 7;
  }
  else {
    uint64_t v5 = a2 - 1;
  }
  uint64_t result = [*(id *)(a1 + 32) containsIndex:v5];
  if ((result & 1) == 0)
  {
    id v7 = *(void **)(a1 + 48);
    return [v7 addIndex:v5];
  }
  return result;
}

uint64_t __47__HKSPSleepSchedule_allowableRangeForWeekdays___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 crossesDayBoundary];
}

void __47__HKSPSleepSchedule_allowableRangeForWeekdays___block_invoke_307(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v13 = v3;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    uint64_t v4 = [v3 bedtimeComponents];
    uint64_t v5 = [v4 hour];
    if (v5 >= [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) hour])
    {
      id v6 = [v13 bedtimeComponents];
      uint64_t v7 = [v6 hour];
      if (v7 != [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) hour])
      {

        goto LABEL_7;
      }
      id v8 = [v13 bedtimeComponents];
      uint64_t v9 = [v8 minute];
      uint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) minute];

      id v3 = v13;
      if (v9 >= v10) {
        goto LABEL_8;
      }
    }
    else
    {

      id v3 = v13;
    }
  }
  uint64_t v11 = [v3 bedtimeComponents];
  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;
LABEL_7:

  id v3 = v13;
LABEL_8:
}

void __47__HKSPSleepSchedule_allowableRangeForWeekdays___block_invoke_2_309(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v13 = v3;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    uint64_t v4 = [v3 wakeUpComponents];
    uint64_t v5 = [v4 hour];
    if (v5 <= [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) hour])
    {
      id v6 = [v13 wakeUpComponents];
      uint64_t v7 = [v6 hour];
      if (v7 != [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) hour])
      {

        goto LABEL_7;
      }
      id v8 = [v13 wakeUpComponents];
      uint64_t v9 = [v8 minute];
      uint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) minute];

      id v3 = v13;
      if (v9 <= v10) {
        goto LABEL_8;
      }
    }
    else
    {

      id v3 = v13;
    }
  }
  uint64_t v11 = [v3 wakeUpComponents];
  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;
LABEL_7:

  id v3 = v13;
LABEL_8:
}

- (id)allowableRangeForModifiedOccurrence:(id)a3 gregorianCalendar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HKSPSleepSchedule *)self mutableCopy];
  if ([v6 isSingleDayOverride])
  {
    unint64_t v9 = [v6 overrideDayInCalendar:v7] + 2;
    if (v9 >= 0xA)
    {
      uint64_t v10 = 0;
      uint64_t v11 = 0;
    }
    else
    {
      uint64_t v10 = qword_1A7ED54D8[v9];
      uint64_t v11 = v10;
    }
  }
  else
  {
    uint64_t v12 = [v6 changeSet];
    id v13 = [v12 originalValueForPropertyIdentifier:@"HKSPOccurrenceWeekdays"];
    uint64_t v11 = [v13 unsignedIntegerValue];

    uint64_t v10 = [v6 weekdays];
  }
  [v8 _modifyDayOccurrencesForWeekdays:v11 block:&__block_literal_global_313];
  double v14 = [v8 allowableRangeForWeekdays:v10];

  return v14;
}

uint64_t __75__HKSPSleepSchedule_allowableRangeForModifiedOccurrence_gregorianCalendar___block_invoke()
{
  return 0;
}

- (double)maximumAllowableWindDown
{
  uint64_t v13 = 0;
  double v14 = (double *)&v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  char v12 = 1;
  id v3 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendar");
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__HKSPSleepSchedule_maximumAllowableWindDown__block_invoke;
  v7[3] = &unk_1E5D32BD8;
  v7[4] = self;
  id v4 = v3;
  id v8 = v4;
  unint64_t v9 = &v13;
  uint64_t v10 = v11;
  HKSPEnumerateDaysOfWeek(v7, 0);
  double v5 = v14[3];

  _Block_object_dispose(v11, 8);
  _Block_object_dispose(&v13, 8);
  return v5;
}

void __45__HKSPSleepSchedule_maximumAllowableWindDown__block_invoke(uint64_t a1, uint64_t a2)
{
  id v19 = [*(id *)(a1 + 32) occurrenceOnDay:a2];
  if (a2 == 7) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = a2 + 1;
  }
  double v5 = [*(id *)(a1 + 32) occurrenceOnDay:v4];
  if (v19) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    uint64_t v7 = a1 + 56;
    if (v19) {
      BOOL v8 = *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8) {
      goto LABEL_28;
    }
    char v12 = [v19 wakeUpComponents];
    unint64_t v9 = [v19 bedtimeComponents];
    objc_msgSend(*(id *)(a1 + 40), "hksp_timeIntervalFromComponents:toComponents:", v12, v9);
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v10;
  }
  else
  {
    uint64_t v11 = [v19 wakeUpComponents];
    char v12 = (void *)[v11 copy];

    if ((unint64_t)(a2 - 1) >= 7) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = a2;
    }
    [v12 setWeekday:v13];
    double v14 = [v5 bedtimeComponents];
    unint64_t v9 = (void *)[v14 copy];

    if ([v5 crossesDayBoundary]) {
      uint64_t v15 = a2;
    }
    else {
      uint64_t v15 = v4;
    }
    if ((unint64_t)(v15 - 1) >= 7) {
      uint64_t v16 = 0;
    }
    else {
      uint64_t v16 = v15;
    }
    [v9 setWeekday:v16];
    objc_msgSend(*(id *)(a1 + 40), "hksp_timeIntervalFromComponents:toComponents:", v12, v9);
    uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
    if (v17 >= *(double *)(v18 + 24) && !*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
      goto LABEL_27;
    }
    *(double *)(v18 + 24) = v17;
    uint64_t v7 = a1 + 56;
  }
  *(unsigned char *)(*(void *)(*(void *)v7 + 8) + 24) = 0;
LABEL_27:

LABEL_28:
}

- (unint64_t)windDownMinutes
{
  [(HKSPSleepSchedule *)self windDownTime];
  return (unint64_t)(v2 / 60.0);
}

- (id)emptyCopy
{
  id v2 = [(HKSPSleepSchedule *)self mutableCopy];
  id v3 = [v2 occurrences];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __30__HKSPSleepSchedule_emptyCopy__block_invoke;
  v7[3] = &unk_1E5D32C00;
  id v8 = v2;
  id v4 = v2;
  objc_msgSend(v3, "na_each:", v7);

  double v5 = (void *)[v4 copy];
  return v5;
}

uint64_t __30__HKSPSleepSchedule_emptyCopy__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeOccurrence:a2];
}

+ (id)innerClasses
{
  id v2 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = +[HKSPSleepScheduleDayOccurrence innerClasses];
  double v5 = [v3 setWithSet:v4];
  BOOL v6 = [v2 setByAddingObjectsFromSet:v5];

  return v6;
}

- (id)mutableCopy
{
  id v3 = [HKSPMutableSleepSchedule alloc];
  return [(HKSPMutableSleepSchedule *)v3 initFromObject:self];
}

- (BOOL)isEquivalentTo:(id)a3
{
  return HKSPObjectsAreEquivalentWithTransformer(self, a3, &__block_literal_global_381);
}

- (id)succinctDescription
{
  id v2 = [(HKSPSleepSchedule *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[HKSPSleepSchedule isEnabled](self, "isEnabled"), @"enabled");
  double v5 = NSString;
  BOOL v6 = [(HKSPSleepSchedule *)self occurrences];
  uint64_t v7 = objc_msgSend(v5, "stringWithFormat:", @"%lu occurrences", objc_msgSend(v6, "count"));
  [v3 appendString:v7 withName:@"occurrences"];

  [(HKSPSleepSchedule *)self windDownTime];
  id v8 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", @"windDownTime", 1);
  [(HKSPSleepSchedule *)self sleepDurationGoal];
  id v9 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", @"sleepDurationGoal", 1);
  return v3;
}

- (HKSPSyncAnchor)syncAnchor
{
  return self->_syncAnchor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideDayOccurrence, 0);
  objc_storeStrong((id *)&self->_sundayOccurrence, 0);
  objc_storeStrong((id *)&self->_saturdayOccurrence, 0);
  objc_storeStrong((id *)&self->_fridayOccurrence, 0);
  objc_storeStrong((id *)&self->_thursdayOccurrence, 0);
  objc_storeStrong((id *)&self->_wednesdayOccurrence, 0);
  objc_storeStrong((id *)&self->_tuesdayOccurrence, 0);
  objc_storeStrong((id *)&self->_mondayOccurrence, 0);
  objc_storeStrong((id *)&self->_syncAnchor, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
}

@end