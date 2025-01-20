@interface REDateRelevanceProvider
+ (id)_simulationDateFormatter;
+ (id)relevanceSimulatorID;
- (BOOL)isEqual:(id)a3;
- (NSDate)initialRelevanceDate;
- (NSDate)irrelevantDate;
- (NSDateInterval)interval;
- (REDateRelevanceProvider)initWithDictionary:(id)a3;
- (REDateRelevanceProvider)initWithEventDate:(id)a3;
- (REDateRelevanceProvider)initWithEventDate:(id)a3 duration:(double)a4;
- (REDateRelevanceProvider)initWithEventDate:(id)a3 duration:(double)a4 priority:(int64_t)a5;
- (REDateRelevanceProvider)initWithEventInterval:(id)a3;
- (REDateRelevanceProvider)initWithEventInterval:(id)a3 becomesIrrelevantDate:(id)a4;
- (REDateRelevanceProvider)initWithEventInterval:(id)a3 becomesIrrelevantDate:(id)a4 firstBecomesRelevantDate:(id)a5 recentDuration:(double)a6;
- (REDateRelevanceProvider)initWithEventInterval:(id)a3 becomesIrrelevantDate:(id)a4 firstBecomesRelevantDate:(id)a5 recentDuration:(double)a6 priority:(int64_t)a7;
- (REDateRelevanceProvider)initWithEventInterval:(id)a3 becomesIrrelevantDate:(id)a4 priority:(int64_t)a5;
- (double)recentDuration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionFromPriority:(int64_t)a3;
- (id)dictionaryEncoding;
- (int64_t)priority;
- (unint64_t)_hash;
@end

@implementation REDateRelevanceProvider

- (REDateRelevanceProvider)initWithEventDate:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F08798];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithStartDate:v5 duration:0.0];

  v7 = [(REDateRelevanceProvider *)self initWithEventInterval:v6];
  return v7;
}

- (REDateRelevanceProvider)initWithEventDate:(id)a3 duration:(double)a4
{
  v6 = (objc_class *)MEMORY[0x263F08798];
  id v7 = a3;
  v8 = (void *)[[v6 alloc] initWithStartDate:v7 duration:a4];

  v9 = [(REDateRelevanceProvider *)self initWithEventInterval:v8];
  return v9;
}

- (REDateRelevanceProvider)initWithEventDate:(id)a3 duration:(double)a4 priority:(int64_t)a5
{
  v8 = (objc_class *)MEMORY[0x263F08798];
  id v9 = a3;
  v10 = (void *)[[v8 alloc] initWithStartDate:v9 duration:a4];

  v11 = [v10 endDate];
  v12 = [(REDateRelevanceProvider *)self initWithEventInterval:v10 becomesIrrelevantDate:v11 priority:a5];

  return v12;
}

- (REDateRelevanceProvider)initWithEventInterval:(id)a3
{
  id v4 = a3;
  id v5 = [v4 endDate];
  v6 = [(REDateRelevanceProvider *)self initWithEventInterval:v4 becomesIrrelevantDate:v5];

  return v6;
}

- (REDateRelevanceProvider)initWithEventInterval:(id)a3 becomesIrrelevantDate:(id)a4
{
  return [(REDateRelevanceProvider *)self initWithEventInterval:a3 becomesIrrelevantDate:a4 priority:2];
}

- (REDateRelevanceProvider)initWithEventInterval:(id)a3 becomesIrrelevantDate:(id)a4 priority:(int64_t)a5
{
  v8 = (void *)MEMORY[0x263EFF8F0];
  id v9 = a4;
  id v10 = a3;
  v11 = [v8 currentCalendar];
  v12 = [v10 startDate];
  v13 = [v11 dateByAddingUnit:16 value:-1 toDate:v12 options:0];

  v14 = [(REDateRelevanceProvider *)self initWithEventInterval:v10 becomesIrrelevantDate:v9 firstBecomesRelevantDate:v13 recentDuration:a5 priority:1800.0];
  return v14;
}

- (REDateRelevanceProvider)initWithEventInterval:(id)a3 becomesIrrelevantDate:(id)a4 firstBecomesRelevantDate:(id)a5 recentDuration:(double)a6
{
  return [(REDateRelevanceProvider *)self initWithEventInterval:a3 becomesIrrelevantDate:a4 firstBecomesRelevantDate:a5 recentDuration:2 priority:a6];
}

- (REDateRelevanceProvider)initWithEventInterval:(id)a3 becomesIrrelevantDate:(id)a4 firstBecomesRelevantDate:(id)a5 recentDuration:(double)a6 priority:(int64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v37.receiver = self;
  v37.super_class = (Class)REDateRelevanceProvider;
  v15 = [(RERelevanceProvider *)&v37 init];
  v16 = v15;
  if (v15)
  {
    v15->_recentDuration = floor(a6);
    id v17 = objc_alloc(MEMORY[0x263F08798]);
    v18 = [v12 startDate];
    v19 = REDateByRemovingSubseconds(v18);
    v20 = [v12 endDate];
    REDateByRemovingSubseconds(v20);
    int64_t v36 = a7;
    v22 = v21 = v13;
    uint64_t v23 = [v17 initWithStartDate:v19 endDate:v22];
    interval = v16->_interval;
    v16->_interval = (NSDateInterval *)v23;

    id v13 = v21;
    uint64_t v25 = REDateByRemovingSubseconds(v14);
    initialRelevanceDate = v16->_initialRelevanceDate;
    v16->_initialRelevanceDate = (NSDate *)v25;

    uint64_t v27 = REDateByRemovingSubseconds(v21);
    irrelevantDate = v16->_irrelevantDate;
    v16->_irrelevantDate = (NSDate *)v27;

    v16->_priority = v36;
    v29 = v16->_initialRelevanceDate;
    v30 = [(NSDateInterval *)v16->_interval startDate];
    uint64_t v31 = [(NSDate *)v29 compare:v30];

    if (v31 == 1)
    {
      v32 = (void *)MEMORY[0x263EFF940];
      uint64_t v33 = *MEMORY[0x263EFF498];
      v34 = [v12 startDate];
      [v32 raise:v33, @"Initial Relevance Date (%@) must occur before or be equal the Event Date (%@)", v14, v34 format];
    }
    if (![(NSDateInterval *)v16->_interval containsDate:v16->_irrelevantDate]) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"The irrelevant date (%@) must be in specified interval (%@)", v13, v12 format];
    }
  }

  return v16;
}

+ (id)relevanceSimulatorID
{
  return @"date";
}

+ (id)_simulationDateFormatter
{
  if (_simulationDateFormatter_onceToken != -1) {
    dispatch_once(&_simulationDateFormatter_onceToken, &__block_literal_global);
  }
  v2 = (void *)_simulationDateFormatter_dateFormatter;
  return v2;
}

uint64_t __51__REDateRelevanceProvider__simulationDateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)_simulationDateFormatter_dateFormatter;
  _simulationDateFormatter_dateFormatter = (uint64_t)v0;

  v2 = (void *)_simulationDateFormatter_dateFormatter;
  return [v2 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
}

- (REDateRelevanceProvider)initWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"start_date"];
  v6 = [v4 objectForKeyedSubscript:@"end_date"];
  if (v5)
  {
    id v7 = [(id)objc_opt_class() _simulationDateFormatter];
    v8 = [v7 dateFromString:v5];
    v32 = v8;
    if (v6)
    {
      id v9 = [v7 dateFromString:v6];
    }
    else
    {
      id v9 = v8;
    }
    v11 = v9;
    uint64_t v12 = [v4 objectForKeyedSubscript:@"irrelevant_date"];
    if (!v12 || ([v7 dateFromString:v12], (id v13 = (id)objc_claimAutoreleasedReturnValue()) == 0)) {
      id v13 = v11;
    }
    v29 = (void *)v12;
    uint64_t v14 = objc_msgSend(v4, "objectForKeyedSubscript:", @"recent_duration", v13);
    v15 = (void *)v14;
    v16 = &unk_26CFCCDC8;
    if (v14) {
      v16 = (void *)v14;
    }
    id v17 = v16;

    v18 = [v4 objectForKeyedSubscript:@"initial_relevance_date"];
    if (!v18 || ([v7 dateFromString:v18], (v19 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v20 = [MEMORY[0x263EFF8F0] currentCalendar];
      v19 = [v20 dateByAddingUnit:16 value:-1 toDate:v32 options:0];
    }
    v30 = v7;
    v21 = [v4 objectForKeyedSubscript:@"priority"];
    v22 = v21;
    uint64_t v31 = v6;
    if (v21) {
      uint64_t v23 = [v21 integerValue];
    }
    else {
      uint64_t v23 = 2;
    }
    v24 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v32 endDate:v11];
    [v17 doubleValue];
    double v26 = v25;

    self = [(REDateRelevanceProvider *)self initWithEventInterval:v24 becomesIrrelevantDate:v28 firstBecomesRelevantDate:v19 recentDuration:v23 priority:v26];
    id v10 = self;
    v6 = v31;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)dictionaryEncoding
{
  v3 = [(id)objc_opt_class() _simulationDateFormatter];
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  id v5 = [(NSDateInterval *)self->_interval startDate];
  v6 = [v3 stringFromDate:v5];
  [v4 setObject:v6 forKeyedSubscript:@"start_date"];

  id v7 = [(NSDateInterval *)self->_interval endDate];
  v8 = [v3 stringFromDate:v7];
  [v4 setObject:v8 forKeyedSubscript:@"end_date"];

  irrelevantDate = self->_irrelevantDate;
  id v10 = [(NSDateInterval *)self->_interval endDate];
  LOBYTE(irrelevantDate) = [(NSDate *)irrelevantDate isEqual:v10];

  if ((irrelevantDate & 1) == 0)
  {
    v11 = [v3 stringFromDate:self->_irrelevantDate];
    [v4 setObject:v11 forKeyedSubscript:@"irrelevant_date"];
  }
  float recentDuration = self->_recentDuration;
  if (!RERelevanceEqualToRelevance(recentDuration, 1800.0))
  {
    id v13 = [NSNumber numberWithDouble:self->_recentDuration];
    [v4 setObject:v13 forKeyedSubscript:@"recent_duration"];
  }
  uint64_t v14 = [MEMORY[0x263EFF8F0] currentCalendar];
  v15 = [(NSDateInterval *)self->_interval startDate];
  v16 = [v14 dateByAddingUnit:16 value:-1 toDate:v15 options:0];

  if (([v16 isEqualToDate:self->_initialRelevanceDate] & 1) == 0)
  {
    id v17 = [v3 stringFromDate:self->_initialRelevanceDate];
    [v4 setObject:v17 forKeyedSubscript:@"initial_relevance_date"];
  }
  v18 = [NSNumber numberWithInteger:self->_priority];
  [v4 setObject:v18 forKeyedSubscript:@"priority"];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)REDateRelevanceProvider;
  id v4 = [(RERelevanceProvider *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 4, self->_interval);
  objc_storeStrong(v4 + 5, self->_initialRelevanceDate);
  objc_storeStrong(v4 + 6, self->_irrelevantDate);
  v4[7] = *(id *)&self->_recentDuration;
  v4[8] = self->_priority;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (REDateRelevanceProvider *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)REDateRelevanceProvider;
    if ([(RERelevanceProvider *)&v25 isEqual:v4])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v5 = v4;
        interval = self->_interval;
        id v7 = v5->_interval;
        if (interval == v7)
        {
        }
        else
        {
          v8 = v7;
          id v9 = interval;
          int v10 = [(NSDateInterval *)v9 isEqual:v8];

          if (!v10) {
            goto LABEL_20;
          }
        }
        initialRelevanceDate = self->_initialRelevanceDate;
        id v13 = v5->_initialRelevanceDate;
        if (initialRelevanceDate == v13)
        {
        }
        else
        {
          uint64_t v14 = v13;
          v15 = initialRelevanceDate;
          int v16 = [(NSDate *)v15 isEqual:v14];

          if (!v16) {
            goto LABEL_20;
          }
        }
        irrelevantDate = self->_irrelevantDate;
        v18 = v5->_irrelevantDate;
        if (irrelevantDate == v18)
        {
        }
        else
        {
          v19 = v18;
          v20 = irrelevantDate;
          int v21 = [(NSDate *)v20 isEqual:v19];

          if (!v21) {
            goto LABEL_20;
          }
        }
        float recentDuration = self->_recentDuration;
        float v23 = v5->_recentDuration;
        if (vabds_f32(recentDuration, v23) < 0.00000011921)
        {
          BOOL v11 = self->_priority == v5->_priority;
LABEL_21:

          goto LABEL_22;
        }
LABEL_20:
        BOOL v11 = 0;
        goto LABEL_21;
      }
    }
    BOOL v11 = 0;
  }
LABEL_22:

  return v11;
}

- (unint64_t)_hash
{
  uint64_t v3 = [(NSDateInterval *)self->_interval hash];
  uint64_t v4 = [(NSDate *)self->_initialRelevanceDate hash] ^ v3;
  uint64_t v5 = v4 ^ [(NSDate *)self->_irrelevantDate hash];
  objc_super v6 = [NSNumber numberWithDouble:self->_recentDuration];
  unint64_t v7 = v5 ^ [v6 hash] ^ self->_priority;

  return v7;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F08790]);
  uint64_t v4 = [MEMORY[0x263EFFA18] systemTimeZone];
  [v3 setTimeZone:v4];

  [v3 setDateFormat:@"yyyy-MM-dd HH:mm:ss ZZZZZ"];
  v15.receiver = self;
  v15.super_class = (Class)REDateRelevanceProvider;
  uint64_t v5 = [(REDateRelevanceProvider *)&v15 description];
  objc_super v6 = [(NSDateInterval *)self->_interval startDate];
  unint64_t v7 = [v3 stringFromDate:v6];
  v8 = [(NSDateInterval *)self->_interval endDate];
  id v9 = [v3 stringFromDate:v8];
  int v10 = [v3 stringFromDate:self->_initialRelevanceDate];
  BOOL v11 = [v3 stringFromDate:self->_irrelevantDate];
  uint64_t v12 = [(REDateRelevanceProvider *)self descriptionFromPriority:self->_priority];
  id v13 = [v5 stringByAppendingFormat:@" intervalStartDate=%@, intervalEndDate=%@, initialRelevanceDate=%@, irrelevantDate=%@, priority=%@", v7, v9, v10, v11, v12];

  return v13;
}

- (id)descriptionFromPriority:(int64_t)a3
{
  if (a3 == 1) {
    return @"Informational";
  }
  else {
    return @"Default";
  }
}

- (NSDateInterval)interval
{
  return self->_interval;
}

- (NSDate)initialRelevanceDate
{
  return self->_initialRelevanceDate;
}

- (NSDate)irrelevantDate
{
  return self->_irrelevantDate;
}

- (double)recentDuration
{
  return self->_recentDuration;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_irrelevantDate, 0);
  objc_storeStrong((id *)&self->_initialRelevanceDate, 0);
  objc_storeStrong((id *)&self->_interval, 0);
}

@end