@interface TTRIRecurrenceRuleBuilder
+ (id)calStringForDayOfWeek:(int)a3;
- (NSArray)dayNumbers;
- (NSArray)monthNumbers;
- (TTRIRecurrenceRuleBuilder)init;
- (id)daysOfTheWeek;
- (id)daysOfTheWeekWithWeek:(int64_t)a3;
- (id)description;
- (id)recurrenceRule;
- (id)recurrenceRuleWithFirstDayOfTheWeek:(int64_t)a3;
- (id)setPositions;
- (int)days;
- (int)ordinalValue;
- (int64_t)_frequencyToUse;
- (int64_t)frequency;
- (int64_t)interval;
- (unint64_t)count;
- (void)_setDefaultValues;
- (void)setCount:(unint64_t)a3;
- (void)setDayNumbers:(id)a3;
- (void)setDays:(int)a3;
- (void)setFrequency:(int64_t)a3;
- (void)setInterval:(int64_t)a3;
- (void)setMonthNumbers:(id)a3;
- (void)setOrdinalValue:(int)a3;
@end

@implementation TTRIRecurrenceRuleBuilder

- (TTRIRecurrenceRuleBuilder)init
{
  v5.receiver = self;
  v5.super_class = (Class)TTRIRecurrenceRuleBuilder;
  v2 = [(TTRIRecurrenceRuleBuilder *)&v5 init];
  v3 = v2;
  if (v2) {
    [(TTRIRecurrenceRuleBuilder *)v2 _setDefaultValues];
  }
  return v3;
}

- (void)_setDefaultValues
{
  self->_interval = 1;
}

+ (id)calStringForDayOfWeek:(int)a3
{
  return (id)MEMORY[0x1F410F990](*(void *)&a3, a2);
}

- (id)recurrenceRule
{
  return [(TTRIRecurrenceRuleBuilder *)self recurrenceRuleWithFirstDayOfTheWeek:0];
}

- (id)recurrenceRuleWithFirstDayOfTheWeek:(int64_t)a3
{
  int64_t v5 = [(TTRIRecurrenceRuleBuilder *)self _frequencyToUse];
  if ([(TTRIRecurrenceRuleBuilder *)self count])
  {
    v6 = objc_msgSend(MEMORY[0x1E4F94BD0], "recurrenceEndWithOccurrenceCount:", -[TTRIRecurrenceRuleBuilder count](self, "count"));
  }
  else
  {
    v6 = 0;
  }
  v7 = [(TTRIRecurrenceRuleBuilder *)self dayNumbers];
  if ([v7 count]
    || [(TTRIRecurrenceRuleBuilder *)self days]
    || [(TTRIRecurrenceRuleBuilder *)self ordinalValue])
  {
  }
  else
  {
    v22 = [(TTRIRecurrenceRuleBuilder *)self monthNumbers];
    uint64_t v23 = [v22 count];

    if (!v23)
    {
      uint64_t v32 = 0;
      int64_t v33 = a3;
      v9 = 0;
LABEL_30:
      v10 = 0;
LABEL_32:
      uint64_t v20 = 0;
LABEL_33:
      id v24 = objc_alloc(MEMORY[0x1E4F94BD8]);
      v25 = v10;
      v26 = v6;
      v27 = (void *)[MEMORY[0x1E4F94BD8] newObjectID];
      v28 = (void *)[MEMORY[0x1E4F94A48] newObjectID];
      v29 = (void *)[MEMORY[0x1E4F94BE8] newObjectID];
      int64_t v30 = [(TTRIRecurrenceRuleBuilder *)self interval];
      v21 = (void *)v32;
      v13 = (void *)[v24 initRecurrenceRuleWithObjectID:v27 accountID:v28 reminderID:v29 frequency:v5 interval:v30 firstDayOfTheWeek:v33 daysOfTheWeek:v32 daysOfTheMonth:v20 monthsOfTheYear:v25 weeksOfTheYear:0 daysOfTheYear:0 setPositions:v9 end:v26];

      v6 = v26;
      v10 = v25;
      goto LABEL_34;
    }
  }
  if (v5 == 3)
  {
    v10 = [(TTRIRecurrenceRuleBuilder *)self monthNumbers];
    v14 = [(TTRIRecurrenceRuleBuilder *)self setPositions];
    v15 = [v14 lastObject];
    uint64_t v16 = [v15 integerValue];

    int64_t v33 = a3;
    if (!v16 || ![(TTRIRecurrenceRuleBuilder *)self days])
    {
      v9 = 0;
      uint64_t v20 = 0;
      uint64_t v32 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      if ([(TTRIRecurrenceRuleBuilder *)self days]) {
        goto LABEL_35;
      }
      goto LABEL_33;
    }
    uint64_t v32 = [(TTRIRecurrenceRuleBuilder *)self daysOfTheWeekWithWeek:v16];
    v9 = 0;
    goto LABEL_32;
  }
  if (v5 != 2)
  {
    if (v5 != 1
      || ![(TTRIRecurrenceRuleBuilder *)self days]
      || ([(TTRIRecurrenceRuleBuilder *)self dayNumbers],
          v8 = objc_claimAutoreleasedReturnValue(),
          v9 = (void *)[v8 count],
          v8,
          v9))
    {
      v10 = 0;
LABEL_14:
      v11 = 0;
      v12 = 0;
      v13 = 0;
      goto LABEL_35;
    }
    int64_t v33 = a3;
    uint64_t v32 = [(TTRIRecurrenceRuleBuilder *)self daysOfTheWeek];
    goto LABEL_30;
  }
  v10 = [(TTRIRecurrenceRuleBuilder *)self monthNumbers];
  if ([(TTRIRecurrenceRuleBuilder *)self ordinalValue])
  {
    if ([(TTRIRecurrenceRuleBuilder *)self days])
    {
      v17 = [(TTRIRecurrenceRuleBuilder *)self dayNumbers];
      uint64_t v18 = [v17 count];

      if (!v18)
      {
        int64_t v33 = a3;
        v9 = [(TTRIRecurrenceRuleBuilder *)self setPositions];
        uint64_t v32 = [(TTRIRecurrenceRuleBuilder *)self daysOfTheWeek];
        goto LABEL_32;
      }
    }
  }
  v9 = [(TTRIRecurrenceRuleBuilder *)self dayNumbers];
  if ([v9 count])
  {
    int v19 = [(TTRIRecurrenceRuleBuilder *)self days];

    if (v19) {
      goto LABEL_14;
    }
    int64_t v33 = a3;
    uint64_t v20 = [(TTRIRecurrenceRuleBuilder *)self dayNumbers];
    v9 = 0;
    uint64_t v32 = 0;
    goto LABEL_33;
  }
  uint64_t v20 = 0;
  v21 = 0;
  v13 = 0;
LABEL_34:

  v11 = (void *)v20;
  v12 = v21;
LABEL_35:

  return v13;
}

- (int64_t)_frequencyToUse
{
  int64_t result = [(TTRIRecurrenceRuleBuilder *)self frequency];
  if (result == 3)
  {
    if ([(TTRIRecurrenceRuleBuilder *)self days] == 127
      || [(TTRIRecurrenceRuleBuilder *)self days] == 62
      || [(TTRIRecurrenceRuleBuilder *)self days] == 65)
    {
      return 2;
    }
    else
    {
      return 3;
    }
  }
  return result;
}

- (id)daysOfTheWeek
{
  return [(TTRIRecurrenceRuleBuilder *)self daysOfTheWeekWithWeek:0];
}

- (id)daysOfTheWeekWithWeek:(int64_t)a3
{
  int64_t v5 = objc_opt_new();
  if ([(TTRIRecurrenceRuleBuilder *)self days])
  {
    v6 = [MEMORY[0x1E4F94BC8] dayOfWeek:1 weekNumber:a3];
    [v5 addObject:v6];
  }
  if (([(TTRIRecurrenceRuleBuilder *)self days] & 2) != 0)
  {
    v7 = [MEMORY[0x1E4F94BC8] dayOfWeek:2 weekNumber:a3];
    [v5 addObject:v7];
  }
  if (([(TTRIRecurrenceRuleBuilder *)self days] & 4) != 0)
  {
    v8 = [MEMORY[0x1E4F94BC8] dayOfWeek:3 weekNumber:a3];
    [v5 addObject:v8];
  }
  if (([(TTRIRecurrenceRuleBuilder *)self days] & 8) != 0)
  {
    v9 = [MEMORY[0x1E4F94BC8] dayOfWeek:4 weekNumber:a3];
    [v5 addObject:v9];
  }
  if (([(TTRIRecurrenceRuleBuilder *)self days] & 0x10) != 0)
  {
    v10 = [MEMORY[0x1E4F94BC8] dayOfWeek:5 weekNumber:a3];
    [v5 addObject:v10];
  }
  if (([(TTRIRecurrenceRuleBuilder *)self days] & 0x20) != 0)
  {
    v11 = [MEMORY[0x1E4F94BC8] dayOfWeek:6 weekNumber:a3];
    [v5 addObject:v11];
  }
  if (([(TTRIRecurrenceRuleBuilder *)self days] & 0x40) != 0)
  {
    v12 = [MEMORY[0x1E4F94BC8] dayOfWeek:7 weekNumber:a3];
    [v5 addObject:v12];
  }
  if ([v5 count]) {
    v13 = v5;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;

  return v14;
}

- (id)setPositions
{
  int v2 = [(TTRIRecurrenceRuleBuilder *)self ordinalValue] - 1;
  if (v2 > 5) {
    return 0;
  }
  else {
    return (id)qword_1E61D3B78[v2];
  }
}

- (id)description
{
  v3 = [(TTRIRecurrenceRuleBuilder *)self recurrenceRule];
  uint64_t v16 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t v5 = [(TTRIRecurrenceRuleBuilder *)self frequency];
  int64_t v6 = [(TTRIRecurrenceRuleBuilder *)self interval];
  unint64_t v7 = [(TTRIRecurrenceRuleBuilder *)self count];
  v8 = [(TTRIRecurrenceRuleBuilder *)self dayNumbers];
  uint64_t v9 = [(TTRIRecurrenceRuleBuilder *)self days];
  uint64_t v10 = [(TTRIRecurrenceRuleBuilder *)self ordinalValue];
  uint64_t v11 = [(TTRIRecurrenceRuleBuilder *)self monthNumbers];
  v12 = (void *)v11;
  v13 = @"NO VALID RULE";
  if (v3) {
    v13 = v3;
  }
  id v14 = [v16 stringWithFormat:@"<%@: %p> {\n\tFrequency: %ld\n\tInterval: %ld\n\tCount: %tu\n\tDay Number: %@\n\tDays: %u\n\tOrdinal: %u\n\tMonth Numbers: %@\n\tCurrent Rule: %@\n}", v4, self, v5, v6, v7, v8, v9, v10, v11, v13];

  return v14;
}

- (int64_t)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(int64_t)a3
{
  self->_frequency = a3;
}

- (int64_t)interval
{
  return self->_interval;
}

- (void)setInterval:(int64_t)a3
{
  self->_interval = a3;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (NSArray)dayNumbers
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDayNumbers:(id)a3
{
}

- (int)days
{
  return self->_days;
}

- (void)setDays:(int)a3
{
  self->_days = a3;
}

- (int)ordinalValue
{
  return self->_ordinalValue;
}

- (void)setOrdinalValue:(int)a3
{
  self->_ordinalValue = a3;
}

- (NSArray)monthNumbers
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMonthNumbers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monthNumbers, 0);

  objc_storeStrong((id *)&self->_dayNumbers, 0);
}

@end