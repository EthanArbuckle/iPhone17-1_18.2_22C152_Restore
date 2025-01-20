@interface HKSPResolvedSleepScheduleOccurrence
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKSPResolvedSleepScheduleOccurrence)initWithCoder:(id)a3;
- (HKSPResolvedSleepScheduleOccurrence)initWithOccurrence:(id)a3 wakeUpEvent:(id)a4 bedtimeEvent:(id)a5 windDownEvent:(id)a6;
- (HKSPSleepEvent)bedtimeEvent;
- (HKSPSleepEvent)wakeUpEvent;
- (HKSPSleepEvent)windDownEvent;
- (HKSPSleepScheduleOccurrence)occurrence;
- (NSDateInterval)bedtimeInterval;
- (NSDateInterval)scheduledInterval;
- (NSDateInterval)windDownInterval;
- (NSString)description;
- (id)generateOverrideOccurrenceForCurrentDate:(id)a3 gregorianCalendar:(id)a4;
- (id)occurrenceByAdjustingEvent:(id)a3;
- (id)occurrenceByRemovingEventWithIdentifier:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKSPResolvedSleepScheduleOccurrence

- (int64_t)compare:(id)a3
{
  wakeUpEvent = self->_wakeUpEvent;
  v4 = [a3 wakeUpEvent];
  int64_t v5 = [(HKSPSleepEvent *)wakeUpEvent compare:v4];

  return v5;
}

- (HKSPSleepEvent)wakeUpEvent
{
  return self->_wakeUpEvent;
}

- (HKSPSleepScheduleOccurrence)occurrence
{
  return self->_occurrence;
}

- (HKSPResolvedSleepScheduleOccurrence)initWithOccurrence:(id)a3 wakeUpEvent:(id)a4 bedtimeEvent:(id)a5 windDownEvent:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HKSPResolvedSleepScheduleOccurrence;
  v15 = [(HKSPResolvedSleepScheduleOccurrence *)&v19 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_occurrence, a3);
    objc_storeStrong((id *)&v16->_wakeUpEvent, a4);
    objc_storeStrong((id *)&v16->_bedtimeEvent, a5);
    objc_storeStrong((id *)&v16->_windDownEvent, a6);
    v17 = v16;
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windDownEvent, 0);
  objc_storeStrong((id *)&self->_bedtimeEvent, 0);
  objc_storeStrong((id *)&self->_wakeUpEvent, 0);
  objc_storeStrong((id *)&self->_occurrence, 0);
}

- (id)occurrenceByAdjustingEvent:(id)a3
{
  id v4 = a3;
  v20 = [HKSPResolvedSleepScheduleOccurrence alloc];
  int64_t v5 = [(HKSPResolvedSleepScheduleOccurrence *)self occurrence];
  v6 = [v4 identifier];
  char v7 = [v6 isEqualToString:@"HKSPSleepEventIdentifierWakeUp"];
  v8 = v4;
  if ((v7 & 1) == 0)
  {
    v8 = [(HKSPResolvedSleepScheduleOccurrence *)self wakeUpEvent];
  }
  v9 = [v4 identifier];
  char v10 = [v9 isEqualToString:@"HKSPSleepEventIdentifierBedtime"];
  id v11 = v4;
  if ((v10 & 1) == 0)
  {
    id v11 = [(HKSPResolvedSleepScheduleOccurrence *)self bedtimeEvent];
  }
  id v12 = [v4 identifier];
  if ([v12 isEqualToString:@"HKSPSleepEventIdentifierWindDown"])
  {
    id v13 = [(HKSPResolvedSleepScheduleOccurrence *)v20 initWithOccurrence:v5 wakeUpEvent:v8 bedtimeEvent:v11 windDownEvent:v4];
  }
  else
  {
    [(HKSPResolvedSleepScheduleOccurrence *)self windDownEvent];
    objc_super v19 = v9;
    char v14 = v7;
    v15 = v6;
    v17 = v16 = v5;
    id v13 = [(HKSPResolvedSleepScheduleOccurrence *)v20 initWithOccurrence:v16 wakeUpEvent:v8 bedtimeEvent:v11 windDownEvent:v17];

    int64_t v5 = v16;
    v6 = v15;
    char v7 = v14;
    v9 = v19;
  }

  if ((v10 & 1) == 0) {
  if ((v7 & 1) == 0)
  }

  return v13;
}

- (id)occurrenceByRemovingEventWithIdentifier:(id)a3
{
  id v5 = a3;
  if ([v5 isEqualToString:@"HKSPSleepEventIdentifierWakeUp"])
  {
    char v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"HKSPResolvedSleepScheduleOccurrence.m", 58, @"Invalid parameter not satisfying: %@", @"![eventIdentifier isEqualToString:HKSPSleepEventIdentifierWakeUp]" object file lineNumber description];
  }
  v6 = [HKSPResolvedSleepScheduleOccurrence alloc];
  char v7 = [(HKSPResolvedSleepScheduleOccurrence *)self occurrence];
  v8 = [(HKSPResolvedSleepScheduleOccurrence *)self wakeUpEvent];
  char v9 = [v5 isEqualToString:@"HKSPSleepEventIdentifierBedtime"];
  if (v9)
  {
    char v10 = 0;
  }
  else
  {
    char v10 = [(HKSPResolvedSleepScheduleOccurrence *)self bedtimeEvent];
  }
  if (![v5 isEqualToString:@"HKSPSleepEventIdentifierWindDown"])
  {
    id v12 = [(HKSPResolvedSleepScheduleOccurrence *)self windDownEvent];
    id v11 = [(HKSPResolvedSleepScheduleOccurrence *)v6 initWithOccurrence:v7 wakeUpEvent:v8 bedtimeEvent:v10 windDownEvent:v12];

    if (v9) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  id v11 = [(HKSPResolvedSleepScheduleOccurrence *)v6 initWithOccurrence:v7 wakeUpEvent:v8 bedtimeEvent:v10 windDownEvent:0];
  if ((v9 & 1) == 0) {
LABEL_10:
  }

LABEL_11:
  return v11;
}

- (NSDateInterval)scheduledInterval
{
  id v4 = objc_alloc(MEMORY[0x1E4F28C18]);
  uint64_t v5 = [(HKSPSleepEvent *)self->_windDownEvent dueDate];
  v6 = (void *)v5;
  if (v5)
  {
    int v7 = 0;
    v8 = (void *)v5;
  }
  else
  {
    uint64_t v9 = [(HKSPSleepEvent *)self->_bedtimeEvent dueDate];
    v2 = (void *)v9;
    if (v9)
    {
      int v7 = 0;
      v8 = (void *)v9;
    }
    else
    {
      v8 = [(HKSPSleepEvent *)self->_wakeUpEvent dueDate];
      int v7 = 1;
    }
  }
  char v10 = [(HKSPSleepEvent *)self->_wakeUpEvent dueDate];
  id v11 = (void *)[v4 initWithStartDate:v8 endDate:v10];

  if (v7) {
  if (!v6)
  }

  return (NSDateInterval *)v11;
}

- (NSDateInterval)bedtimeInterval
{
  v3 = [(HKSPSleepEvent *)self->_bedtimeEvent dueDate];
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F28C18]);
    uint64_t v5 = [(HKSPSleepEvent *)self->_bedtimeEvent dueDate];
    v6 = [(HKSPSleepEvent *)self->_wakeUpEvent dueDate];
    int v7 = (void *)[v4 initWithStartDate:v5 endDate:v6];
  }
  else
  {
    int v7 = 0;
  }

  return (NSDateInterval *)v7;
}

- (NSDateInterval)windDownInterval
{
  if (self->_windDownEvent && self->_bedtimeEvent)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F28C18]);
    id v4 = [(HKSPSleepEvent *)self->_windDownEvent dueDate];
    uint64_t v5 = [(HKSPSleepEvent *)self->_bedtimeEvent dueDate];
    v6 = (void *)[v3 initWithStartDate:v4 endDate:v5];
  }
  else
  {
    v6 = 0;
  }
  return (NSDateInterval *)v6;
}

- (id)generateOverrideOccurrenceForCurrentDate:(id)a3 gregorianCalendar:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = HKSPLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v32 = 138543618;
    id v33 = (id)objc_opt_class();
    __int16 v34 = 2114;
    id v35 = v6;
    id v9 = v33;
    _os_log_impl(&dword_1A7E74000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] generating override occurrence for current date %{public}@", (uint8_t *)&v32, 0x16u);
  }
  char v10 = [(HKSPResolvedSleepScheduleOccurrence *)self scheduledInterval];
  int v11 = [v10 containsDate:v6];

  id v12 = HKSPLogForCategory(0);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (!v11)
  {
    if (v13)
    {
      v21 = objc_opt_class();
      int v32 = 138543362;
      id v33 = v21;
      id v19 = v21;
      v20 = "[%{public}@] date is outside this occurrence's interval, generating override from template";
      goto LABEL_11;
    }
LABEL_12:

    v22 = [(HKSPResolvedSleepScheduleOccurrence *)self scheduledInterval];
    v23 = [v22 startDate];

    v24 = [(HKSPResolvedSleepScheduleOccurrence *)self occurrence];
    v25 = [v24 overrideOccurrenceTemplateForCurrentDate:v23 gregorianCalendar:v7];
    goto LABEL_13;
  }
  if (v13)
  {
    char v14 = objc_opt_class();
    int v32 = 138543362;
    id v33 = v14;
    id v15 = v14;
    _os_log_impl(&dword_1A7E74000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] current date is inside this occurrence's interval, generating override for this occurrence", (uint8_t *)&v32, 0xCu);
  }
  v16 = [(HKSPResolvedSleepScheduleOccurrence *)self wakeUpEvent];
  uint64_t v17 = [v16 type];

  if (v17)
  {
    id v12 = HKSPLogForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_opt_class();
      int v32 = 138543362;
      id v33 = v18;
      id v19 = v18;
      v20 = "[%{public}@] this occurrence is snoozed, generating overide from template";
LABEL_11:
      _os_log_impl(&dword_1A7E74000, v12, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v32, 0xCu);

      goto LABEL_12;
    }
    goto LABEL_12;
  }
  v27 = [(HKSPResolvedSleepScheduleOccurrence *)self wakeUpEvent];
  v23 = [v27 dueDate];

  v28 = [(HKSPResolvedSleepScheduleOccurrence *)self occurrence];
  v24 = [v28 bedtimeDateForWakeUpDate:v23 gregorianCalendar:v7];

  v29 = [v7 components:124 fromDate:v23];
  v30 = [v7 components:124 fromDate:v24];
  v31 = [(HKSPResolvedSleepScheduleOccurrence *)self occurrence];
  v25 = [v31 overrideOccurrenceWithWakeUpComponents:v29 bedtimeComponents:v30];

LABEL_13:
  return v25;
}

- (HKSPResolvedSleepScheduleOccurrence)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HKSPResolvedSleepScheduleOccurrence;
  uint64_t v5 = [(HKSPResolvedSleepScheduleOccurrence *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"occurrence"];
    occurrence = v5->_occurrence;
    v5->_occurrence = (HKSPSleepScheduleOccurrence *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wakeUpEvent"];
    wakeUpEvent = v5->_wakeUpEvent;
    v5->_wakeUpEvent = (HKSPSleepEvent *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bedtimeEvent"];
    bedtimeEvent = v5->_bedtimeEvent;
    v5->_bedtimeEvent = (HKSPSleepEvent *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"windDownEvent"];
    windDownEvent = v5->_windDownEvent;
    v5->_windDownEvent = (HKSPSleepEvent *)v12;

    char v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  occurrence = self->_occurrence;
  id v5 = a3;
  [v5 encodeObject:occurrence forKey:@"occurrence"];
  [v5 encodeObject:self->_wakeUpEvent forKey:@"wakeUpEvent"];
  [v5 encodeObject:self->_bedtimeEvent forKey:@"bedtimeEvent"];
  [v5 encodeObject:self->_windDownEvent forKey:@"windDownEvent"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKSPResolvedSleepScheduleOccurrence *)a3;
  if (self == v4)
  {
    char v19 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [MEMORY[0x1E4F4F738] builderWithObject:v5 ofExpectedClass:objc_opt_class()];
      occurrence = self->_occurrence;
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __47__HKSPResolvedSleepScheduleOccurrence_isEqual___block_invoke;
      v30[3] = &unk_1E5D337F8;
      uint64_t v8 = v5;
      v31 = v8;
      id v9 = (id)[v6 appendObject:occurrence counterpart:v30];
      wakeUpEvent = self->_wakeUpEvent;
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __47__HKSPResolvedSleepScheduleOccurrence_isEqual___block_invoke_2;
      v28[3] = &unk_1E5D33820;
      int v11 = v8;
      v29 = v11;
      id v12 = (id)[v6 appendObject:wakeUpEvent counterpart:v28];
      bedtimeEvent = self->_bedtimeEvent;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __47__HKSPResolvedSleepScheduleOccurrence_isEqual___block_invoke_3;
      v26[3] = &unk_1E5D33820;
      char v14 = v11;
      v27 = v14;
      id v15 = (id)[v6 appendObject:bedtimeEvent counterpart:v26];
      windDownEvent = self->_windDownEvent;
      uint64_t v21 = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      v23 = __47__HKSPResolvedSleepScheduleOccurrence_isEqual___block_invoke_4;
      v24 = &unk_1E5D33820;
      v25 = v14;
      uint64_t v17 = v14;
      id v18 = (id)[v6 appendObject:windDownEvent counterpart:&v21];
      char v19 = objc_msgSend(v6, "isEqual", v21, v22, v23, v24);
    }
    else
    {
      char v19 = 0;
    }
  }

  return v19;
}

uint64_t __47__HKSPResolvedSleepScheduleOccurrence_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) occurrence];
}

uint64_t __47__HKSPResolvedSleepScheduleOccurrence_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) wakeUpEvent];
}

uint64_t __47__HKSPResolvedSleepScheduleOccurrence_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) bedtimeEvent];
}

uint64_t __47__HKSPResolvedSleepScheduleOccurrence_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) windDownEvent];
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendObject:self->_occurrence];
  id v5 = (id)[v3 appendObject:self->_wakeUpEvent];
  id v6 = (id)[v3 appendObject:self->_bedtimeEvent];
  id v7 = (id)[v3 appendObject:self->_windDownEvent];
  unint64_t v8 = [v3 hash];

  return v8;
}

- (NSString)description
{
  return (NSString *)[(HKSPResolvedSleepScheduleOccurrence *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(HKSPResolvedSleepScheduleOccurrence *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_occurrence withName:@"occurrence"];
  id v5 = [(HKSPSleepEvent *)self->_bedtimeEvent dueDate];
  id v6 = [v5 hkspDescription];
  id v7 = (id)[v3 appendObject:v6 withName:@"bedtime"];

  unint64_t v8 = [(HKSPSleepEvent *)self->_wakeUpEvent dueDate];
  id v9 = [v8 hkspDescription];
  id v10 = (id)[v3 appendObject:v9 withName:@"wakeup"];

  int v11 = [(HKSPSleepEvent *)self->_windDownEvent dueDate];
  id v12 = [v11 hkspDescription];
  id v13 = (id)[v3 appendObject:v12 withName:@"winddown"];

  return v3;
}

- (HKSPSleepEvent)bedtimeEvent
{
  return self->_bedtimeEvent;
}

- (HKSPSleepEvent)windDownEvent
{
  return self->_windDownEvent;
}

@end