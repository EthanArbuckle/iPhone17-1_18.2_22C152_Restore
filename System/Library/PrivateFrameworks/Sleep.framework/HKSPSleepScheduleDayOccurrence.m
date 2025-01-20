@interface HKSPSleepScheduleDayOccurrence
+ (BOOL)supportsSecureCoding;
+ (id)innerClasses;
- (BOOL)isAlarmEquivalentToOccurrenceIgnoringDates:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEquivalentTo:(id)a3;
- (BOOL)isEquivalentToOccurrenceIgnoringDates:(id)a3;
- (HKSPAlarmConfiguration)alarmConfiguration;
- (HKSPSleepScheduleDayOccurrence)init;
- (HKSPSleepScheduleDayOccurrence)initWithCoder:(id)a3;
- (NSDateComponents)bedtimeComponents;
- (NSDateComponents)wakeUpComponents;
- (NSString)description;
- (NSString)groupingIdentifier;
- (id)_decodeComponentsForPersistenceWithCoder:(id)a3 key:(id)a4;
- (id)changesFromOccurrence:(id)a3;
- (id)generateSleepScheduleOccurrenceWithWeekdays:(unint64_t)a3;
- (id)initFromObject:(id)a3;
- (id)mutableCopy;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)version;
- (void)_encodeComponentsForPersistence:(id)a3 coder:(id)a4 key:(id)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKSPSleepScheduleDayOccurrence

- (id)generateSleepScheduleOccurrenceWithWeekdays:(unint64_t)a3
{
  v5 = objc_alloc_init(HKSPMutableSleepScheduleOccurrence);
  [(HKSPMutableSleepScheduleOccurrence *)v5 setWeekdays:a3];
  v6 = (void *)[(HKSPSleepScheduleDayOccurrence *)self copy];
  [(HKSPMutableSleepScheduleOccurrence *)v5 setBackingOccurrence:v6];

  v7 = (void *)[(HKSPMutableSleepScheduleOccurrence *)v5 copy];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  return HKSPObjectsAreEqual(self, a3);
}

- (HKSPSleepScheduleDayOccurrence)init
{
  v8.receiver = self;
  v8.super_class = (Class)HKSPSleepScheduleDayOccurrence;
  v2 = [(HKSPSleepScheduleDayOccurrence *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_version = 1;
    v4 = objc_alloc_init(HKSPAlarmConfiguration);
    alarmConfiguration = v3->_alarmConfiguration;
    v3->_alarmConfiguration = v4;

    v6 = v3;
  }

  return v3;
}

- (unint64_t)version
{
  return self->_version;
}

- (NSString)groupingIdentifier
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  v4 = [(HKSPSleepScheduleDayOccurrence *)self bedtimeComponents];
  id v5 = (id)[v3 appendObject:v4];

  v6 = [(HKSPSleepScheduleDayOccurrence *)self wakeUpComponents];
  id v7 = (id)[v3 appendObject:v6];

  objc_super v8 = [(HKSPSleepScheduleDayOccurrence *)self alarmConfiguration];
  id v9 = (id)[v3 appendObject:v8];

  uint64_t v10 = [v3 hash];
  v11 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v10);

  return (NSString *)v11;
}

- (NSDateComponents)bedtimeComponents
{
  v2 = (void *)[(NSDateComponents *)self->_bedtimeComponents copy];
  return (NSDateComponents *)v2;
}

- (HKSPAlarmConfiguration)alarmConfiguration
{
  return self->_alarmConfiguration;
}

- (NSDateComponents)wakeUpComponents
{
  v2 = (void *)[(NSDateComponents *)self->_wakeUpComponents copy];
  return (NSDateComponents *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmConfiguration, 0);
  objc_storeStrong((id *)&self->_wakeUpComponents, 0);
  objc_storeStrong((id *)&self->_bedtimeComponents, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  HKSPEncodeObjectWithCoder(self, v4);
  if (objc_msgSend(v4, "hksp_serializationOptions"))
  {
    [(HKSPSleepScheduleDayOccurrence *)self _encodeComponentsForPersistence:self->_bedtimeComponents coder:v4 key:@"HKSPDayOccurrenceBedtimeComponents"];
    [(HKSPSleepScheduleDayOccurrence *)self _encodeComponentsForPersistence:self->_wakeUpComponents coder:v4 key:@"HKSPDayOccurrenceWakeUpComponents"];
  }
}

- (HKSPSleepScheduleDayOccurrence)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKSPSleepScheduleDayOccurrence;
  id v5 = [(HKSPSleepScheduleDayOccurrence *)&v13 init];
  v6 = v5;
  if (v5)
  {
    HKSPDecodeObjectWithCoder(v5, v4);
    if (objc_msgSend(v4, "hksp_serializationOptions"))
    {
      uint64_t v7 = [(HKSPSleepScheduleDayOccurrence *)v6 _decodeComponentsForPersistenceWithCoder:v4 key:@"HKSPDayOccurrenceBedtimeComponents"];
      bedtimeComponents = v6->_bedtimeComponents;
      v6->_bedtimeComponents = (NSDateComponents *)v7;

      uint64_t v9 = [(HKSPSleepScheduleDayOccurrence *)v6 _decodeComponentsForPersistenceWithCoder:v4 key:@"HKSPDayOccurrenceWakeUpComponents"];
      wakeUpComponents = v6->_wakeUpComponents;
      v6->_wakeUpComponents = (NSDateComponents *)v9;
    }
    v11 = v6;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)initFromObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(HKSPSleepScheduleDayOccurrence *)self init];
    HKSPCopyFromObject(v5, v6);

    self = v6;
    uint64_t v7 = self;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)_decodeComponentsForPersistenceWithCoder:(id)a3 key:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = a4;
  id v7 = a3;
  uint64_t v21 = objc_opt_class();
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  objc_super v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:3];
  uint64_t v9 = objc_msgSend(v5, "setWithArray:", v8, v21, v22);
  uint64_t v10 = [v7 decodeObjectOfClasses:v9 forKey:v6];

  id v11 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  v12 = [v10 objectForKeyedSubscript:@"HKSPDayOccurrenceHour"];
  objc_msgSend(v11, "setHour:", objc_msgSend(v12, "integerValue"));

  objc_super v13 = [v10 objectForKeyedSubscript:@"HKSPDayOccurrenceMinute"];
  objc_msgSend(v11, "setMinute:", objc_msgSend(v13, "integerValue"));

  v14 = [v10 objectForKeyedSubscript:@"HKSPDayOccurrenceYear"];

  if (v14)
  {
    v15 = [v10 objectForKeyedSubscript:@"HKSPDayOccurrenceYear"];
    objc_msgSend(v11, "setYear:", objc_msgSend(v15, "integerValue"));
  }
  v16 = [v10 objectForKeyedSubscript:@"HKSPDayOccurrenceMonth"];

  if (v16)
  {
    v17 = [v10 objectForKeyedSubscript:@"HKSPDayOccurrenceMonth"];
    objc_msgSend(v11, "setMonth:", objc_msgSend(v17, "integerValue"));
  }
  v18 = [v10 objectForKeyedSubscript:@"HKSPDayOccurrenceDay"];

  if (v18)
  {
    v19 = [v10 objectForKeyedSubscript:@"HKSPDayOccurrenceDay"];
    objc_msgSend(v11, "setDay:", objc_msgSend(v19, "integerValue"));
  }
  return v11;
}

- (void)_encodeComponentsForPersistence:(id)a3 coder:(id)a4 key:(id)a5
{
  id v17 = a3;
  id v7 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v8 = a5;
  id v9 = a4;
  id v10 = objc_alloc_init(v7);
  id v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v17, "hour"));
  [v10 setObject:v11 forKeyedSubscript:@"HKSPDayOccurrenceHour"];

  v12 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v17, "minute"));
  [v10 setObject:v12 forKeyedSubscript:@"HKSPDayOccurrenceMinute"];

  if ([v17 year] != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_super v13 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v17, "year"));
    [v10 setObject:v13 forKeyedSubscript:@"HKSPDayOccurrenceYear"];
  }
  if ([v17 month] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v17, "month"));
    [v10 setObject:v14 forKeyedSubscript:@"HKSPDayOccurrenceMonth"];
  }
  if ([v17 day] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v17, "day"));
    [v10 setObject:v15 forKeyedSubscript:@"HKSPDayOccurrenceDay"];
  }
  v16 = (void *)[v10 copy];
  [v9 encodeObject:v16 forKey:v8];
}

+ (id)innerClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 setWithObject:v3];
}

- (id)mutableCopy
{
  uint64_t v3 = [HKSPMutableSleepScheduleDayOccurrence alloc];
  return [(HKSPMutableSleepScheduleDayOccurrence *)v3 initFromObject:self];
}

- (id)changesFromOccurrence:(id)a3
{
  return HKSPGenerateChangeSetBetweenObjects(self, a3);
}

- (BOOL)isEquivalentTo:(id)a3
{
  return HKSPObjectsAreEquivalentWithTransformer(self, a3, &__block_literal_global_381);
}

- (BOOL)isEquivalentToOccurrenceIgnoringDates:(id)a3
{
  return HKSPObjectsAreEquivalentWithTransformer(self, a3, &__block_literal_global_24);
}

id __72__HKSPSleepScheduleDayOccurrence_isEquivalentToOccurrenceIgnoringDates___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 identifier];
  if ([v6 isEqualToString:@"HKSPDayOccurrenceWakeUpComponents"])
  {

LABEL_4:
    objc_msgSend(v5, "hksp_timeComponents");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  id v7 = [v4 identifier];
  int v8 = [v7 isEqualToString:@"HKSPDayOccurrenceBedtimeComponents"];

  if (v8) {
    goto LABEL_4;
  }
  id v9 = v5;
LABEL_6:
  id v10 = v9;

  return v10;
}

- (BOOL)isAlarmEquivalentToOccurrenceIgnoringDates:(id)a3
{
  return HKSPObjectsAreEquivalentWithTransformer(self, a3, &__block_literal_global_289_0);
}

id __77__HKSPSleepScheduleDayOccurrence_isAlarmEquivalentToOccurrenceIgnoringDates___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 identifier];
  int v7 = [v6 isEqualToString:@"HKSPDayOccurrenceWakeUpComponents"];

  if (v7)
  {
    objc_msgSend(v5, "hksp_timeComponents");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = [v4 identifier];
    int v10 = [v9 isEqualToString:@"HKSPDayOccurrenceBedtimeComponents"];

    if (v10)
    {
      id v11 = (void *)MEMORY[0x1E4F1CC38];
      goto LABEL_7;
    }
    id v8 = v5;
  }
  id v11 = v8;
LABEL_7:

  return v11;
}

- (NSString)description
{
  return (NSString *)[(HKSPSleepScheduleDayOccurrence *)self descriptionWithMultilinePrefix:&stru_1EFE54160];
}

- (id)succinctDescription
{
  v2 = [(HKSPSleepScheduleDayOccurrence *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  uint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = [(HKSPSleepScheduleDayOccurrence *)self bedtimeComponents];
  id v5 = objc_msgSend(v4, "hksp_description");
  [v3 appendString:v5 withName:@"bedtime"];

  id v6 = [(HKSPSleepScheduleDayOccurrence *)self wakeUpComponents];
  int v7 = objc_msgSend(v6, "hksp_description");
  [v3 appendString:v7 withName:@"wakeUp"];

  id v8 = [(HKSPSleepScheduleDayOccurrence *)self alarmConfiguration];
  id v9 = (id)objc_msgSend(v3, "appendBool:withName:", objc_msgSend(v8, "isEnabled"), @"alarm");

  return v3;
}

@end