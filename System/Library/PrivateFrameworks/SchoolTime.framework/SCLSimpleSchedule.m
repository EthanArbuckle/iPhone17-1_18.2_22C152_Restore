@interface SCLSimpleSchedule
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (SCLScheduleTime)endTime;
- (SCLScheduleTime)startTime;
- (SCLSimpleSchedule)init;
- (SCLSimpleSchedule)initWithCoder:(id)a3;
- (SCLSimpleSchedule)initWithSimpleSchedule:(id)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)recurrences;
- (int64_t)repeatSchedule;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SCLSimpleSchedule

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCLSimpleSchedule)init
{
  v8.receiver = self;
  v8.super_class = (Class)SCLSimpleSchedule;
  v2 = [(SCLSimpleSchedule *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(SCLScheduleTime);
    startTime = v2->_startTime;
    v2->_startTime = v3;

    v5 = objc_alloc_init(SCLScheduleTime);
    endTime = v2->_endTime;
    v2->_endTime = v5;

    v2->_repeatSchedule = 0;
  }
  return v2;
}

- (SCLSimpleSchedule)initWithSimpleSchedule:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SCLSimpleSchedule;
  v5 = [(SCLSimpleSchedule *)&v13 init];
  if (v5)
  {
    v6 = [v4 startTime];
    uint64_t v7 = [v6 copy];
    startTime = v5->_startTime;
    v5->_startTime = (SCLScheduleTime *)v7;

    v9 = [v4 endTime];
    uint64_t v10 = [v9 copy];
    endTime = v5->_endTime;
    v5->_endTime = (SCLScheduleTime *)v10;

    v5->_repeatSchedule = [v4 repeatSchedule];
  }

  return v5;
}

- (SCLSimpleSchedule)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SCLSimpleSchedule;
  v5 = [(SCLSchedule *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startTime"];
    startTime = v5->_startTime;
    v5->_startTime = (SCLScheduleTime *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endTime"];
    endTime = v5->_endTime;
    v5->_endTime = (SCLScheduleTime *)v8;

    v5->_repeatSchedule = [v4 decodeIntegerForKey:@"repeatSchedule"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  startTime = self->_startTime;
  id v5 = a3;
  [v5 encodeObject:startTime forKey:@"startTime"];
  [v5 encodeObject:self->_endTime forKey:@"endTime"];
  [v5 encodeInteger:self->_repeatSchedule forKey:@"repeatSchedule"];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [SCLMutableSimpleSchedule alloc];
  return [(SCLSimpleSchedule *)v4 initWithSimpleSchedule:self];
}

- (unint64_t)hash
{
  v3 = [(SCLSimpleSchedule *)self startTime];
  uint64_t v4 = [v3 hash];
  id v5 = [(SCLSimpleSchedule *)self endTime];
  uint64_t v6 = [v5 hash] ^ v4;
  unint64_t v7 = v6 ^ [(SCLSimpleSchedule *)self repeatSchedule];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [v5 repeatSchedule];
    if (v6 == [(SCLSimpleSchedule *)self repeatSchedule])
    {
      unint64_t v7 = [v5 startTime];
      uint64_t v8 = [(SCLSimpleSchedule *)self startTime];
      if ([v7 isEqual:v8])
      {
        v9 = [v5 endTime];
        uint64_t v10 = [(SCLSimpleSchedule *)self endTime];
        char v11 = [v9 isEqual:v10];
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

- (id)description
{
  v3 = [MEMORY[0x263EFF980] array];
  id v4 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en-US"];
  id v5 = objc_alloc_init(MEMORY[0x263F08790]);
  [v5 setLocale:v4];
  uint64_t v6 = [(SCLSimpleSchedule *)self repeatSchedule];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __32__SCLSimpleSchedule_description__block_invoke;
  v17[3] = &unk_2648AC338;
  id v7 = v3;
  id v18 = v7;
  id v19 = v5;
  id v8 = v5;
  SCLEnumerateDaysInRepeatSchedule(v6, (uint64_t)v17);
  if ([v7 count])
  {
    v9 = [v7 componentsJoinedByString:@","];
  }
  else
  {
    v9 = @"(none)";
  }
  uint64_t v10 = NSString;
  char v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  objc_super v13 = [(SCLSimpleSchedule *)self startTime];
  v14 = [(SCLSimpleSchedule *)self endTime];
  objc_msgSend(v10, "stringWithFormat:", @"<%@ %p; startTime=%@; endTime=%@, repeatSchedule=%@>",
    v12,
    self,
    v13,
    v14,
  v15 = v9);

  return v15;
}

void __32__SCLSimpleSchedule_description__block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) weekdaySymbols];
  id v4 = [v5 objectAtIndex:a2 - 1];
  [v3 addObject:v4];
}

- (id)recurrences
{
  v3 = [MEMORY[0x263EFF980] array];
  uint64_t v4 = [(SCLSimpleSchedule *)self repeatSchedule];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __32__SCLSimpleSchedule_recurrences__block_invoke;
  v9[3] = &unk_2648AC338;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  SCLEnumerateDaysInRepeatSchedule(v4, (uint64_t)v9);
  uint64_t v6 = v10;
  id v7 = v5;

  return v7;
}

void __32__SCLSimpleSchedule_recurrences__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [SCLTimeInterval alloc];
  id v5 = [*(id *)(a1 + 32) startTime];
  uint64_t v6 = [*(id *)(a1 + 32) endTime];
  id v8 = [(SCLTimeInterval *)v4 initWithStartTime:v5 endTime:v6];

  id v7 = [[SCLScheduleRecurrence alloc] initWithTimeInterval:v8 day:a2];
  [*(id *)(a1 + 40) addObject:v7];
}

- (SCLScheduleTime)startTime
{
  return self->_startTime;
}

- (SCLScheduleTime)endTime
{
  return self->_endTime;
}

- (int64_t)repeatSchedule
{
  return self->_repeatSchedule;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

@end