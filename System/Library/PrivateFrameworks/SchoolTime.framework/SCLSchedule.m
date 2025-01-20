@interface SCLSchedule
+ (BOOL)supportsSecureCoding;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isScheduledForDay:(int64_t)a3;
- (BOOL)isValid;
- (NSArray)recurrences;
- (NSArray)uniformTimeIntervals;
- (SCLSchedule)initWithCoder:(id)a3;
- (id)endTimeForDay:(int64_t)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)recurrencesForDay:(int64_t)a3;
- (id)startTimeForDay:(int64_t)a3;
- (id)timeIntervalsForDay:(int64_t)a3;
- (int64_t)scheduledDays;
- (unint64_t)hash;
@end

@implementation SCLSchedule

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCLSchedule)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SCLSchedule;
  return [(SCLSchedule *)&v4 init];
}

- (id)startTimeForDay:(int64_t)a3
{
  v3 = [(SCLSchedule *)self recurrencesForDay:a3];
  objc_super v4 = [v3 firstObject];
  v5 = [v4 timeInterval];
  v6 = [v5 startTime];

  return v6;
}

- (id)endTimeForDay:(int64_t)a3
{
  v3 = [(SCLSchedule *)self recurrencesForDay:a3];
  objc_super v4 = [v3 lastObject];
  v5 = [v4 timeInterval];
  v6 = [v5 endTime];

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF488];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"%@ should be implemented by a concrete subclass of %@", v5, objc_opt_class() format];

  return self;
}

- (BOOL)isEmpty
{
  v2 = [(SCLSchedule *)self recurrences];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (unint64_t)hash
{
  v2 = [(SCLSchedule *)self recurrences];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  id v3 = a3;
  char v4 = [v3 isMemberOfClass:objc_opt_class()];

  return v4;
}

- (int64_t)scheduledDays
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(SCLSchedule *)self recurrences];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 |= SCLRepeatScheduleForDay([*(id *)(*((void *)&v9 + 1) + 8 * i) day]);
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (BOOL)isScheduledForDay:(int64_t)a3
{
  uint64_t v4 = [(SCLSchedule *)self scheduledDays];
  return SCLRepeatScheduleContainsDay(v4, a3);
}

- (BOOL)isValid
{
  v2 = [[SCLScheduleAttributes alloc] initWithSchedule:self];
  BOOL v3 = [(SCLScheduleAttributes *)v2 isValid];

  return v3;
}

- (id)recurrencesForDay:(int64_t)a3
{
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __33__SCLSchedule_recurrencesForDay___block_invoke;
  v8[3] = &__block_descriptor_40_e48_B24__0__SCLScheduleRecurrence_8__NSDictionary_16l;
  v8[4] = a3;
  uint64_t v4 = [MEMORY[0x263F08A98] predicateWithBlock:v8];
  int64_t v5 = [(SCLSchedule *)self recurrences];
  uint64_t v6 = [v5 filteredArrayUsingPredicate:v4];

  return v6;
}

BOOL __33__SCLSchedule_recurrencesForDay___block_invoke(uint64_t a1, void *a2)
{
  return [a2 day] == *(void *)(a1 + 32);
}

- (NSArray)recurrences
{
  return (NSArray *)MEMORY[0x263EFFA68];
}

- (NSArray)uniformTimeIntervals
{
  int64_t v3 = [(SCLSchedule *)self scheduledDays];
  if (v3)
  {
    uint64_t v4 = v3;
    int64_t v5 = [MEMORY[0x263EFF9C0] set];
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    long long v11 = __48__SCLSchedule_Convenience__uniformTimeIntervals__block_invoke;
    long long v12 = &unk_2648AC338;
    v13 = self;
    id v6 = v5;
    id v14 = v6;
    SCLEnumerateDaysInRepeatSchedule(v4, (uint64_t)&v9);
    if (objc_msgSend(v6, "count", v9, v10, v11, v12, v13) == 1)
    {
      v7 = [v6 anyObject];
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = (void *)MEMORY[0x263EFFA68];
  }
  return (NSArray *)v7;
}

void __48__SCLSchedule_Convenience__uniformTimeIntervals__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) timeIntervalsForDay:a2];
  [*(id *)(a1 + 40) addObject:v3];
}

- (id)timeIntervalsForDay:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v6 = [(SCLSchedule *)self recurrencesForDay:a3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) timeInterval];
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

@end