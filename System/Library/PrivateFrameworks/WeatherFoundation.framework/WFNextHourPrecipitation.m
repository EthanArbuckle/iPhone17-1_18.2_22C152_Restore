@interface WFNextHourPrecipitation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRelevant;
- (NSArray)activeMinutes;
- (NSArray)conditions;
- (NSArray)minutes;
- (NSArray)precipitationDescriptions;
- (NSDate)expirationDate;
- (NSDate)readDate;
- (NSDate)startDate;
- (WFNextHourPrecipitation)initWithCoder:(id)a3;
- (WFNextHourPrecipitation)initWithReadDate:(id)a3 startDate:(id)a4 expirationDate:(id)a5 minutes:(id)a6 conditions:(id)a7 descriptions:(id)a8;
- (WFNextHourPrecipitationDescription)currentDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFNextHourPrecipitation

- (WFNextHourPrecipitation)initWithReadDate:(id)a3 startDate:(id)a4 expirationDate:(id)a5 minutes:(id)a6 conditions:(id)a7 descriptions:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v34.receiver = self;
  v34.super_class = (Class)WFNextHourPrecipitation;
  v20 = [(WFNextHourPrecipitation *)&v34 init];
  if (v20)
  {
    uint64_t v21 = [v14 copy];
    readDate = v20->_readDate;
    v20->_readDate = (NSDate *)v21;

    uint64_t v23 = [v15 copy];
    startDate = v20->_startDate;
    v20->_startDate = (NSDate *)v23;

    uint64_t v25 = [v16 copy];
    expirationDate = v20->_expirationDate;
    v20->_expirationDate = (NSDate *)v25;

    uint64_t v27 = [v17 copy];
    minutes = v20->_minutes;
    v20->_minutes = (NSArray *)v27;

    uint64_t v29 = [v19 copy];
    precipitationDescriptions = v20->_precipitationDescriptions;
    v20->_precipitationDescriptions = (NSArray *)v29;

    uint64_t v31 = [v18 copy];
    conditions = v20->_conditions;
    v20->_conditions = (NSArray *)v31;
  }
  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSDate *)self->_readDate copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [(NSDate *)self->_startDate copy];
  v8 = (void *)v4[2];
  v4[2] = v7;

  uint64_t v9 = [(NSDate *)self->_expirationDate copy];
  v10 = (void *)v4[3];
  v4[3] = v9;

  uint64_t v11 = [(NSArray *)self->_minutes copy];
  v12 = (void *)v4[4];
  v4[4] = v11;

  uint64_t v13 = [(NSArray *)self->_precipitationDescriptions copy];
  id v14 = (void *)v4[5];
  v4[5] = v13;

  uint64_t v15 = [(NSArray *)self->_conditions copy];
  id v16 = (void *)v4[6];
  v4[6] = v15;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(WFNextHourPrecipitation *)self readDate];
    uint64_t v7 = [v5 readDate];
    if ([v6 isEqual:v7])
    {
      v8 = [(WFNextHourPrecipitation *)self startDate];
      uint64_t v9 = [v5 startDate];
      if ([v8 isEqual:v9])
      {
        v10 = [(WFNextHourPrecipitation *)self expirationDate];
        uint64_t v11 = [v5 expirationDate];
        char v12 = [v10 isEqual:v11];
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  v3 = [(WFNextHourPrecipitation *)self readDate];
  uint64_t v4 = [v3 hash];
  id v5 = [(WFNextHourPrecipitation *)self startDate];
  uint64_t v6 = [v5 hash] ^ v4;
  uint64_t v7 = [(WFNextHourPrecipitation *)self expirationDate];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (NSArray)activeMinutes
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  uint64_t v4 = [MEMORY[0x263EFF910] date];
  [v4 timeIntervalSinceReferenceDate];
  uint64_t v6 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:floor(v5 / 60.0) * 60.0];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v7 = [(WFNextHourPrecipitation *)self minutes];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(v7);
        }
        char v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v13 = [v12 date];
        [v13 timeIntervalSinceDate:v6];
        double v15 = v14;

        if (v15 >= 0.0) {
          [v3 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v9);
  }

  id v16 = [(WFNextHourPrecipitation *)self minutes];
  int v17 = [v16 count];
  int v18 = v17 - [v3 count];

  id v19 = [(WFNextHourPrecipitation *)self minutes];
  v20 = [v19 lastObject];

  if (v18 >= 1)
  {
    int v21 = 60;
    do
    {
      v22 = [v20 date];
      uint64_t v23 = [v22 dateByAddingTimeInterval:(double)v21];

      v24 = [WFNextHourPrecipitationMinute alloc];
      [v20 intensity];
      double v26 = v25;
      [v20 chance];
      double v28 = v27;
      [v20 perceivedIntensity];
      v30 = [(WFNextHourPrecipitationMinute *)v24 initWithIntensity:v23 chance:v26 perceivedIntensity:v28 date:v29];
      [v3 addObject:v30];

      v21 += 60;
      --v18;
    }
    while (v18);
  }
  uint64_t v31 = [MEMORY[0x263EFF8C0] arrayWithArray:v3];

  return (NSArray *)v31;
}

- (BOOL)isRelevant
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v3 = WFLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C988000, v3, OS_LOG_TYPE_INFO, "Determining if NextHour data is relevant by examining the conditions.", buf, 2u);
  }

  uint64_t v4 = [MEMORY[0x263EFF910] date];
  double v5 = [(WFNextHourPrecipitation *)self startDate];
  [v4 timeIntervalSinceDate:v5];
  double v7 = v6;

  if (v7 <= 900.0)
  {
    uint64_t v10 = [(WFNextHourPrecipitation *)self conditions];
    uint64_t v11 = [v10 count];

    if (v11)
    {
      unint64_t v13 = 0;
      uint64_t v8 = 0;
      *(void *)&long long v12 = 67109632;
      long long v31 = v12;
      while (1)
      {
        double v14 = [(WFNextHourPrecipitation *)self conditions];
        double v15 = [v14 objectAtIndex:v13];

        id v16 = WFLogForCategory(0);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          LODWORD(v33) = v13;
          WORD2(v33) = 2114;
          *(void *)((char *)&v33 + 6) = v15;
          _os_log_impl(&dword_21C988000, v16, OS_LOG_TYPE_INFO, "Checking NextHour data condition[%d]=%{public}@", buf, 0x12u);
        }

        unint64_t v17 = [v15 type];
        int v18 = [v15 validUntil];
        if (v18)
        {
          id v19 = [v15 validUntil];
          [v19 timeIntervalSinceNow];
          BOOL v21 = v20 > 0.0;
        }
        else
        {
          BOOL v21 = 1;
        }

        if (v17 >= 2 && v21) {
          break;
        }
        v22 = WFLogForCategory(0);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v31;
          LODWORD(v33) = v13;
          WORD2(v33) = 1024;
          *(_DWORD *)((char *)&v33 + 6) = v17 > 1;
          WORD5(v33) = 1024;
          HIDWORD(v33) = v21;
          _os_log_impl(&dword_21C988000, v22, OS_LOG_TYPE_INFO, "condition[%d] does not have a valid condition precipitation, skipping...isConditionPrecipitation=%d, isConditionUnexpired=%d", buf, 0x14u);
        }

        uint64_t v23 = [v15 validUntil];

        ++v13;
        v24 = [(WFNextHourPrecipitation *)self conditions];
        unint64_t v25 = [v24 count];

        uint64_t v8 = v23;
        if (v25 <= v13) {
          goto LABEL_21;
        }
      }
      double v26 = WFLogForCategory(0);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v33) = v13;
        _os_log_impl(&dword_21C988000, v26, OS_LOG_TYPE_INFO, "condition[%d] is valid (it's a precipitation and it's not expired). Now checking if it's relevant", buf, 8u);
      }

      [v8 timeIntervalSinceNow];
      double v28 = v27;
      BOOL v9 = v27 <= 3000.0;
      double v29 = WFLogForCategory(0);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109890;
        LODWORD(v33) = v13;
        WORD2(v33) = 2048;
        *(void *)((char *)&v33 + 6) = 0x4049000000000000;
        HIWORD(v33) = 1024;
        BOOL v34 = v28 <= 3000.0;
        __int16 v35 = 2114;
        long long v36 = v8;
        _os_log_impl(&dword_21C988000, v29, OS_LOG_TYPE_INFO, "condition[%d] is relevant only if its preceding condition expires within the next %f minutes. isRelevant=%d, previousConditionValidUntil=%{public}@", buf, 0x22u);
      }
    }
    else
    {
      uint64_t v23 = 0;
LABEL_21:
      double v15 = WFLogForCategory(0);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21C988000, v15, OS_LOG_TYPE_INFO, "NextHour data has no relevant condition. Returning isRelevant=NO", buf, 2u);
      }
      BOOL v9 = 0;
      uint64_t v8 = v23;
    }
  }
  else
  {
    uint64_t v8 = WFLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)&long long v33 = v7;
      _os_log_impl(&dword_21C988000, v8, OS_LOG_TYPE_INFO, "NextHour data is stale, age=%f. Returning isRelevant=NO", buf, 0xCu);
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (WFNextHourPrecipitationDescription)currentDescription
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = WFLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C988000, v3, OS_LOG_TYPE_INFO, "About to compute the NextHour currentDesription", buf, 2u);
  }

  uint64_t v4 = [MEMORY[0x263EFF910] date];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v5 = self->_precipitationDescriptions;
  id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v6)
  {
    uint64_t v8 = *(void *)v16;
    *(void *)&long long v7 = 138543362;
    long long v14 = v7;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v10, "isValidAtDate:", v4, v14, (void)v15))
        {
          id v6 = v10;
          goto LABEL_15;
        }
        uint64_t v11 = WFLogForCategory(0);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v14;
          id v20 = v10;
          _os_log_impl(&dword_21C988000, v11, OS_LOG_TYPE_INFO, "skipping description because it's not valid at this time. description=%{public}@ expired)", buf, 0xCu);
        }
      }
      id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  long long v12 = WFLogForCategory(0);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = v6;
    _os_log_impl(&dword_21C988000, v12, OS_LOG_TYPE_INFO, "Looped through NextHour.descriptions and found: currentDescription=%{public}@", buf, 0xCu);
  }

  return (WFNextHourPrecipitationDescription *)v6;
}

- (id)description
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(NSString);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = [(WFNextHourPrecipitation *)self minutes];
  uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0;
      uint64_t v8 = v3;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        BOOL v9 = *(void **)(*((void *)&v17 + 1) + 8 * v7);
        uint64_t v10 = NSString;
        uint64_t v11 = [(WFNextHourPrecipitation *)self minutes];
        uint64_t v12 = [v11 indexOfObject:v9];
        [v9 perceivedIntensity];
        long long v14 = objc_msgSend(v10, "stringWithFormat:", @"\nMinute: %lu - Value: %f", v12, v13);

        id v3 = [v8 stringByAppendingString:v14];

        ++v7;
        uint64_t v8 = v3;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFNextHourPrecipitation *)self readDate];
  [v4 encodeObject:v5 forKey:@"WFNextHourPrecipitationReadDateKey"];

  uint64_t v6 = [(WFNextHourPrecipitation *)self startDate];
  [v4 encodeObject:v6 forKey:@"WFNextHourPrecipitationStartDateKey"];

  uint64_t v7 = [(WFNextHourPrecipitation *)self expirationDate];
  [v4 encodeObject:v7 forKey:@"WFNextHourPrecipitationExpirationDateKey"];

  uint64_t v8 = [(WFNextHourPrecipitation *)self minutes];
  [v4 encodeObject:v8 forKey:@"WFNextHourPrecipitationMinutesKey"];

  BOOL v9 = [(WFNextHourPrecipitation *)self conditions];
  [v4 encodeObject:v9 forKey:@"WFNextHourPrecipitationConditionsKey"];

  id v10 = [(WFNextHourPrecipitation *)self precipitationDescriptions];
  [v4 encodeObject:v10 forKey:@"WFNextHourPrecipitationPrecipitationDescriptionsKey"];
}

- (WFNextHourPrecipitation)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFNextHourPrecipitationReadDateKey"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFNextHourPrecipitationStartDateKey"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFNextHourPrecipitationExpirationDateKey"];
  if (initWithCoder__onceToken != -1) {
    dispatch_once(&initWithCoder__onceToken, &__block_literal_global_7);
  }
  uint64_t v8 = [v4 decodeObjectOfClasses:initWithCoder__classes forKey:@"WFNextHourPrecipitationMinutesKey"];
  BOOL v9 = [v4 decodeObjectOfClasses:initWithCoder__classes forKey:@"WFNextHourPrecipitationConditionsKey"];
  id v10 = [v4 decodeObjectOfClasses:initWithCoder__classes forKey:@"WFNextHourPrecipitationPrecipitationDescriptionsKey"];
  uint64_t v11 = [(WFNextHourPrecipitation *)self initWithReadDate:v5 startDate:v6 expirationDate:v7 minutes:v8 conditions:v9 descriptions:v10];

  return v11;
}

uint64_t __41__WFNextHourPrecipitation_initWithCoder___block_invoke()
{
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  initWithCoder__classes = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, objc_opt_class(), 0);
  return MEMORY[0x270F9A758]();
}

- (NSDate)readDate
{
  return self->_readDate;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSArray)minutes
{
  return self->_minutes;
}

- (NSArray)precipitationDescriptions
{
  return self->_precipitationDescriptions;
}

- (NSArray)conditions
{
  return self->_conditions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conditions, 0);
  objc_storeStrong((id *)&self->_precipitationDescriptions, 0);
  objc_storeStrong((id *)&self->_minutes, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_readDate, 0);
}

@end