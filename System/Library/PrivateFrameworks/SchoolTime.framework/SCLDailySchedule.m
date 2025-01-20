@interface SCLDailySchedule
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSMutableDictionary)dayMap;
- (SCLDailySchedule)init;
- (SCLDailySchedule)initWithCoder:(id)a3;
- (SCLDailySchedule)initWithSchedule:(id)a3;
- (id)debugDescription;
- (id)endTimeForDay:(int64_t)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)recurrences;
- (id)scheduleForDay:(int64_t)a3;
- (id)startTimeForDay:(int64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDayMap:(id)a3;
@end

@implementation SCLDailySchedule

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [SCLMutableDailySchedule alloc];
  return [(SCLDailySchedule *)v4 initWithSchedule:self];
}

- (SCLDailySchedule)init
{
  v6.receiver = self;
  v6.super_class = (Class)SCLDailySchedule;
  v2 = [(SCLDailySchedule *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    dayMap = v2->_dayMap;
    v2->_dayMap = v3;
  }
  return v2;
}

- (SCLDailySchedule)initWithSchedule:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SCLDailySchedule;
  v5 = [(SCLDailySchedule *)&v10 init];
  if (v5)
  {
    objc_super v6 = [v4 dayMap];
    uint64_t v7 = [v6 mutableCopy];
    dayMap = v5->_dayMap;
    v5->_dayMap = (NSMutableDictionary *)v7;
  }
  return v5;
}

- (SCLDailySchedule)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SCLDailySchedule;
  v5 = [(SCLSchedule *)&v14 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    objc_super v10 = [v4 decodeObjectOfClasses:v9 forKey:@"dayMap"];
    uint64_t v11 = [v10 mutableCopy];
    dayMap = v5->_dayMap;
    v5->_dayMap = (NSMutableDictionary *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)scheduleForDay:(int64_t)a3
{
  id v4 = [(SCLDailySchedule *)self dayMap];
  v5 = [NSNumber numberWithInteger:a3];
  objc_super v6 = [v4 objectForKey:v5];

  return v6;
}

- (id)startTimeForDay:(int64_t)a3
{
  v3 = [(SCLDailySchedule *)self scheduleForDay:a3];
  id v4 = [v3 startTime];

  return v4;
}

- (id)endTimeForDay:(int64_t)a3
{
  v3 = [(SCLDailySchedule *)self scheduleForDay:a3];
  id v4 = [v3 endTime];

  return v4;
}

- (unint64_t)hash
{
  v2 = [(SCLDailySchedule *)self dayMap];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SCLDailySchedule *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      objc_super v6 = [(SCLDailySchedule *)self dayMap];
      uint64_t v7 = [(SCLDailySchedule *)v5 dayMap];

      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (id)debugDescription
{
  unint64_t v3 = (void *)MEMORY[0x263F089D8];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_super v6 = [v3 stringWithFormat:@"<%@ %p>\n", v5, self];

  uint64_t v7 = [MEMORY[0x263EFF8F0] currentCalendar];
  char v8 = [v7 weekdaySymbols];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __36__SCLDailySchedule_debugDescription__block_invoke;
  v14[3] = &unk_2648ACBC8;
  v14[4] = self;
  id v15 = v8;
  id v9 = v6;
  id v16 = v9;
  id v10 = v8;
  SCLEnumerateDaysInRepeatSchedule(127, (uint64_t)v14);
  uint64_t v11 = v16;
  id v12 = v9;

  return v12;
}

void __36__SCLDailySchedule_debugDescription__block_invoke(id *a1, uint64_t a2)
{
  if ([a1[4] isScheduledForDay:a2])
  {
    id v8 = [a1[4] startTimeForDay:a2];
    id v4 = [a1[4] endTimeForDay:a2];
    v5 = [NSNumber numberWithInteger:a2];
    unint64_t v6 = a2 - 1;
    if (v6 < [a1[5] count])
    {
      uint64_t v7 = [a1[5] objectAtIndexedSubscript:v6];

      v5 = (void *)v7;
    }
    [a1[6] appendFormat:@"%@: %@ - %@\n", v5, v8, v4];
  }
}

- (id)recurrences
{
  unint64_t v3 = [MEMORY[0x263EFF980] array];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __31__SCLDailySchedule_recurrences__block_invoke;
  v8[3] = &unk_2648AC338;
  v8[4] = self;
  id v4 = v3;
  id v9 = v4;
  SCLEnumerateDaysInRepeatSchedule(127, (uint64_t)v8);
  v5 = v9;
  id v6 = v4;

  return v6;
}

void __31__SCLDailySchedule_recurrences__block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = [*(id *)(a1 + 32) scheduleForDay:a2];
  if (v3)
  {
    id v4 = *(void **)(a1 + 40);
    id v6 = v3;
    v5 = [v3 recurrences];
    [v4 addObjectsFromArray:v5];

    unint64_t v3 = v6;
  }
}

- (NSMutableDictionary)dayMap
{
  return self->_dayMap;
}

- (void)setDayMap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end