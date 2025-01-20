@interface VCSRecurrenceRule
- (BOOL)decodeDigits:(const char *)a3 withResult:(int64_t *)a4;
- (BOOL)decodeDuration:(const char *)a3;
- (BOOL)decodeInterval:(const char *)a3;
- (BOOL)decodeMonthlyByDay:(const char *)a3;
- (BOOL)decodeMonthlyByPos:(const char *)a3;
- (BOOL)decodeOccurrenceList:(const char *)a3;
- (BOOL)decodeWeekdayList:(const char *)a3;
- (BOOL)decodeWeekly:(const char *)a3;
- (BOOL)decodeYearlyByDay:(const char *)a3;
- (BOOL)decodeYearlyByMonth:(const char *)a3;
- (BOOL)hasDuration;
- (NSArray)dayList;
- (NSArray)dayNumberList;
- (NSArray)monthList;
- (NSMutableArray)occurrenceList;
- (NSMutableArray)weekdayList;
- (NSString)description;
- (VCSDate)endDate;
- (VCSRecurrenceRule)initWithString:(const char *)a3;
- (id)_decodeNumberList:(const char *)a3 min:(int64_t)a4 max:(int64_t)a5;
- (id)dictify;
- (int64_t)duration;
- (int64_t)interval;
- (unint64_t)recurrenceType;
- (void)setDayList:(id)a3;
- (void)setDayNumberList:(id)a3;
- (void)setDuration:(int64_t)a3;
- (void)setEndDate:(id)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setInterval:(int64_t)a3;
- (void)setMonthList:(id)a3;
- (void)setOccurrenceList:(id)a3;
- (void)setWeekdayList:(id)a3;
@end

@implementation VCSRecurrenceRule

- (VCSRecurrenceRule)initWithString:(const char *)a3
{
  v22.receiver = self;
  v22.super_class = (Class)VCSRecurrenceRule;
  v4 = [(VCSRecurrenceRule *)&v22 init];
  if (!v4)
  {
LABEL_39:
    v16 = v4;
    goto LABEL_40;
  }
  BOOL v5 = 0;
  v21 = a3;
  int v6 = *a3;
  if (v6 > 86)
  {
    if (v6 == 87)
    {
      v4->_recurrenceType = 2;
      v21 = a3 + 1;
      BOOL v5 = [(VCSRecurrenceRule *)v4 decodeWeekly:&v21];
      goto LABEL_18;
    }
    if (v6 != 89) {
      goto LABEL_18;
    }
    int v8 = *((unsigned __int8 *)a3 + 1);
    v21 = a3 + 1;
    if (v8 != 68)
    {
      if (v8 == 77)
      {
        v4->_recurrenceType = 5;
        v21 = a3 + 2;
        BOOL v5 = [(VCSRecurrenceRule *)v4 decodeYearlyByMonth:&v21];
        goto LABEL_18;
      }
      goto LABEL_15;
    }
    v4->_recurrenceType = 6;
    v21 = a3 + 2;
    BOOL v5 = [(VCSRecurrenceRule *)v4 decodeYearlyByDay:&v21];
  }
  else
  {
    if (v6 == 68)
    {
      v4->_recurrenceType = 1;
      v21 = a3 + 1;
      BOOL v5 = [(VCSRecurrenceRule *)v4 decodeDaily:&v21];
      goto LABEL_18;
    }
    if (v6 != 77) {
      goto LABEL_18;
    }
    int v7 = *((unsigned __int8 *)a3 + 1);
    v21 = a3 + 1;
    if (v7 != 68)
    {
      if (v7 == 80)
      {
        v4->_recurrenceType = 3;
        v21 = a3 + 2;
        BOOL v5 = [(VCSRecurrenceRule *)v4 decodeMonthlyByPos:&v21];
        goto LABEL_18;
      }
LABEL_15:
      BOOL v5 = 0;
      goto LABEL_18;
    }
    v4->_recurrenceType = 4;
    v21 = a3 + 2;
    BOOL v5 = [(VCSRecurrenceRule *)v4 decodeMonthlyByDay:&v21];
  }
LABEL_18:
  if (v4->_recurrenceType)
  {
    if (v5)
    {
      for (i = v21; ; v21 = i)
      {
        int v10 = *(unsigned __int8 *)i++;
        if (v10 != 32 && v10 != 9) {
          break;
        }
      }
      if ([(VCSRecurrenceRule *)v4 decodeDuration:&v21])
      {
        for (j = v21; ; v21 = j)
        {
          int v14 = *(unsigned __int8 *)j++;
          if (v14 != 32 && v14 != 9) {
            break;
          }
        }
        v17 = [VCSDate alloc];
        uint64_t v18 = [(VCSDate *)v17 initWithDateString:v21];
        endDate = v4->_endDate;
        v4->_endDate = (VCSDate *)v18;

        goto LABEL_39;
      }
    }
  }
  else
  {
    v12 = VCSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[VCSRecurrenceRule initWithString:](v12);
    }
  }
  v16 = 0;
LABEL_40:

  return v16;
}

- (id)dictify
{
  v3 = objc_opt_new();
  v4 = v3;
  unint64_t recurrenceType = self->_recurrenceType;
  if (recurrenceType > 6) {
    int v6 = @"Invalid";
  }
  else {
    int v6 = off_1E6C25B08[recurrenceType];
  }
  [v3 setObject:v6 forKeyedSubscript:@"type"];
  int v7 = [NSNumber numberWithLong:self->_interval];
  [v4 setObject:v7 forKeyedSubscript:@"interval"];

  if ([(NSMutableArray *)self->_occurrenceList count])
  {
    int v8 = [(NSMutableArray *)self->_occurrenceList componentsJoinedByString:@","];
    [v4 setObject:v8 forKeyedSubscript:@"occurrences"];
  }
  if ([(NSMutableArray *)self->_weekdayList count])
  {
    v9 = [(NSMutableArray *)self->_weekdayList VCS_map:&__block_literal_global_11];
    [v4 setObject:v9 forKeyedSubscript:@"weekdays"];
  }
  if ([(NSArray *)self->_dayNumberList count]) {
    [v4 setObject:self->_dayNumberList forKeyedSubscript:@"dayNumbers"];
  }
  if ([(NSArray *)self->_monthList count]) {
    [v4 setObject:self->_monthList forKeyedSubscript:@"months"];
  }
  if ([(NSArray *)self->_dayList count]) {
    [v4 setObject:self->_dayList forKeyedSubscript:@"days"];
  }
  if (self->_hasDuration)
  {
    int v10 = [NSNumber numberWithLong:self->_duration];
    [v4 setObject:v10 forKeyedSubscript:@"duration"];
  }
  endDate = self->_endDate;
  if (endDate)
  {
    v12 = [(VCSDate *)endDate description];
    [v4 setObject:v12 forKeyedSubscript:@"endDate"];
  }
  return v4;
}

__CFString *__28__VCSRecurrenceRule_dictify__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 unsignedIntegerValue];
  if (v2 > 6) {
    return @"??";
  }
  else {
    return off_1E6C25B40[v2];
  }
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(VCSRecurrenceRule *)self dictify];
  int v6 = [v3 stringWithFormat:@"<%@: %p> %@", v4, self, v5];

  return (NSString *)v6;
}

- (BOOL)decodeWeekly:(const char *)a3
{
  BOOL v5 = -[VCSRecurrenceRule decodeInterval:](self, "decodeInterval:");
  if (v5)
  {
    for (i = *a3; ; *a3 = i)
    {
      int v7 = *(unsigned __int8 *)i++;
      if (v7 != 32 && v7 != 9) {
        break;
      }
    }
    LOBYTE(v5) = [(VCSRecurrenceRule *)self decodeWeekdayList:a3];
  }
  return v5;
}

- (BOOL)decodeMonthlyByPos:(const char *)a3
{
  BOOL v5 = -[VCSRecurrenceRule decodeInterval:](self, "decodeInterval:");
  if (v5)
  {
    for (i = *a3; ; *a3 = i)
    {
      int v7 = *(unsigned __int8 *)i++;
      if (v7 != 32 && v7 != 9) {
        break;
      }
    }
    BOOL v5 = [(VCSRecurrenceRule *)self decodeOccurrenceList:a3];
    if (v5)
    {
      if (self->_occurrenceList)
      {
        for (j = *a3; ; *a3 = j)
        {
          int v10 = *(unsigned __int8 *)j++;
          if (v10 != 32 && v10 != 9) {
            break;
          }
        }
        LOBYTE(v5) = [(VCSRecurrenceRule *)self decodeWeekdayList:a3];
      }
      else
      {
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (BOOL)decodeMonthlyByDay:(const char *)a3
{
  BOOL v5 = -[VCSRecurrenceRule decodeInterval:](self, "decodeInterval:");
  if (v5)
  {
    for (i = *a3; ; *a3 = i)
    {
      int v7 = *(unsigned __int8 *)i++;
      if (v7 != 32 && v7 != 9) {
        break;
      }
    }
    v9 = [(VCSRecurrenceRule *)self _decodeNumberList:a3 min:1 max:31];
    dayNumberList = self->_dayNumberList;
    self->_dayNumberList = v9;
  }
  return v5;
}

- (BOOL)decodeYearlyByMonth:(const char *)a3
{
  BOOL v5 = -[VCSRecurrenceRule decodeInterval:](self, "decodeInterval:");
  if (v5)
  {
    for (i = *a3; ; *a3 = i)
    {
      int v7 = *(unsigned __int8 *)i++;
      if (v7 != 32 && v7 != 9) {
        break;
      }
    }
    v9 = [(VCSRecurrenceRule *)self _decodeNumberList:a3 min:1 max:12];
    monthList = self->_monthList;
    self->_monthList = v9;
  }
  return v5;
}

- (BOOL)decodeYearlyByDay:(const char *)a3
{
  BOOL v5 = -[VCSRecurrenceRule decodeInterval:](self, "decodeInterval:");
  if (v5)
  {
    for (i = *a3; ; *a3 = i)
    {
      int v7 = *(unsigned __int8 *)i++;
      if (v7 != 32 && v7 != 9) {
        break;
      }
    }
    v9 = [(VCSRecurrenceRule *)self _decodeNumberList:a3 min:1 max:366];
    dayList = self->_dayList;
    self->_dayList = v9;
  }
  return v5;
}

- (BOOL)decodeInterval:(const char *)a3
{
  int64_t v6 = 0;
  BOOL v4 = [(VCSRecurrenceRule *)self decodeDigits:a3 withResult:&v6];
  if (v4) {
    self->_interval = v6;
  }
  return v4;
}

- (BOOL)decodeWeekdayList:(const char *)a3
{
  BOOL v5 = *a3;
LABEL_2:
  while (1)
  {
    int v6 = *(unsigned __int8 *)v5;
    if (v6 != 9 && v6 != 32) {
      break;
    }
    ++v5;
  }
  uint64_t v7 = 0;
  int v8 = v5 + 2;
  do
  {
    v9 = decodeWeekdayList__weekdays[v7];
    if (v6 == *v9 && *((unsigned __int8 *)v5 + 1) == v9[1])
    {
      unsigned int v10 = *(unsigned __int8 *)v8;
      BOOL v11 = v10 > 0x20;
      uint64_t v12 = (1 << v10) & 0x100000201;
      if (!v11 && v12 != 0)
      {
        weekdayList = self->_weekdayList;
        if (!weekdayList)
        {
          v15 = (NSMutableArray *)objc_opt_new();
          v16 = self->_weekdayList;
          self->_weekdayList = v15;

          weekdayList = self->_weekdayList;
        }
        v17 = [NSNumber numberWithUnsignedInteger:decodeWeekdayList__weekdaysCode[v7]];
        [(NSMutableArray *)weekdayList addObject:v17];

        BOOL v5 = v8;
        goto LABEL_2;
      }
    }
    ++v7;
  }
  while (v7 != 7);
  *a3 = v5;
  return 1;
}

- (BOOL)decodeOccurrenceList:(const char *)a3
{
  BOOL v5 = *a3;
  LOBYTE(v6) = **a3;
  do
  {
    if ((v6 - 49) > 4u) {
      break;
    }
    int v7 = *((unsigned __int8 *)v5 + 1);
    if (v7 != 45 && v7 != 43) {
      break;
    }
    int v8 = (char)v6;
    occurrenceList = self->_occurrenceList;
    if (occurrenceList)
    {
      int v6 = (char)v6;
    }
    else
    {
      unsigned int v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      BOOL v11 = self->_occurrenceList;
      self->_occurrenceList = v10;

      int v6 = *v5;
      int v7 = *((unsigned __int8 *)v5 + 1);
      occurrenceList = self->_occurrenceList;
    }
    unsigned int v12 = v8 - 58;
    unsigned int v13 = v6 - 48;
    unsigned int v14 = 48 - v6;
    uint64_t v15 = v7 == 45 ? v14 : v13;
    v16 = [NSNumber numberWithInt:v15];
    [(NSMutableArray *)occurrenceList addObject:v16];

    for (v5 += 2; ; ++v5)
    {
      int v6 = *(unsigned __int8 *)v5;
      if (v6 != 32 && v6 != 9) {
        break;
      }
    }
  }
  while (v12 > 0xFFFFFFF5);
  *a3 = v5;
  return 1;
}

- (id)_decodeNumberList:(const char *)a3 min:(int64_t)a4 max:(int64_t)a5
{
  i = *a3;
  int64_t v18 = 0;
  v19 = i;
  if ([(VCSRecurrenceRule *)self decodeDigits:&v19 withResult:&v18]
    && (v18 >= a4 ? (BOOL v10 = v18 <= a5) : (BOOL v10 = 0), v10))
  {
    BOOL v11 = 0;
    do
    {
      if (!v11) {
        BOOL v11 = objc_opt_new();
      }
      unsigned int v13 = objc_msgSend(NSNumber, "numberWithLong:");
      [v11 addObject:v13];

      for (i = v19; ; ++i)
      {
        int v14 = *(unsigned __int8 *)i;
        if (v14 != 32 && v14 != 9) {
          break;
        }
      }
      v19 = i;
      if (![(VCSRecurrenceRule *)self decodeDigits:&v19 withResult:&v18]) {
        break;
      }
    }
    while (v18 >= a4 && v18 <= a5);
  }
  else
  {
    BOOL v11 = 0;
  }
  *a3 = i;
  return v11;
}

- (BOOL)decodeDuration:(const char *)a3
{
  v3 = self;
  if (**a3 == 35)
  {
    int v6 = *a3 + 1;
    LODWORD(self) = [(VCSRecurrenceRule *)self decodeDigits:&v6 withResult:&self->_duration];
    if (self) {
      v3->_hasDuration = 1;
    }
    *a3 = v6;
  }
  else
  {
    self->_hasDuration = 0;
    LOBYTE(self) = 1;
  }
  return (char)self;
}

- (BOOL)decodeDigits:(const char *)a3 withResult:(int64_t *)a4
{
  if ((**a3 - 48) <= 9)
  {
    __endptr = 0;
    *__error() = 0;
    uint64_t v6 = strtol(*a3, &__endptr, 10);
    int64_t v7 = v6;
    if (v6)
    {
      if ((unint64_t)(v6 - 0x7FFFFFFFFFFFFFFFLL) > 1 || *__error() != 34) {
        goto LABEL_5;
      }
    }
    else if (*__error() != 22)
    {
LABEL_5:
      *a4 = v7;
      *a3 = __endptr;
      return 1;
    }
  }
  return 0;
}

- (unint64_t)recurrenceType
{
  return self->_recurrenceType;
}

- (int64_t)interval
{
  return self->_interval;
}

- (void)setInterval:(int64_t)a3
{
  self->_interval = a3;
}

- (BOOL)hasDuration
{
  return self->_hasDuration;
}

- (void)setHasDuration:(BOOL)a3
{
  self->_hasDuration = a3;
}

- (int64_t)duration
{
  return self->_duration;
}

- (void)setDuration:(int64_t)a3
{
  self->_duration = a3;
}

- (NSArray)dayNumberList
{
  return self->_dayNumberList;
}

- (void)setDayNumberList:(id)a3
{
}

- (NSArray)monthList
{
  return self->_monthList;
}

- (void)setMonthList:(id)a3
{
}

- (NSArray)dayList
{
  return self->_dayList;
}

- (void)setDayList:(id)a3
{
}

- (NSMutableArray)occurrenceList
{
  return self->_occurrenceList;
}

- (void)setOccurrenceList:(id)a3
{
}

- (NSMutableArray)weekdayList
{
  return self->_weekdayList;
}

- (void)setWeekdayList:(id)a3
{
}

- (VCSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_weekdayList, 0);
  objc_storeStrong((id *)&self->_occurrenceList, 0);
  objc_storeStrong((id *)&self->_dayList, 0);
  objc_storeStrong((id *)&self->_monthList, 0);
  objc_storeStrong((id *)&self->_dayNumberList, 0);
}

- (void)initWithString:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DB9BF000, log, OS_LOG_TYPE_ERROR, "Invalid recurrence type.", v1, 2u);
}

@end