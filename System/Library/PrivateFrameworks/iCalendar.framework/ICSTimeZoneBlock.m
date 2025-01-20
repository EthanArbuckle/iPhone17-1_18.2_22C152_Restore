@interface ICSTimeZoneBlock
- (BOOL)validate:(id *)a3;
- (ICSDate)dtstart;
- (NSArray)rdate;
- (NSArray)rrule;
- (NSArray)tzname;
- (id)computeTimeZoneChangeListFromDate:(id)a3 toDate:(id)a4;
- (int64_t)compare:(id)a3;
- (int64_t)tzoffsetfrom;
- (int64_t)tzoffsetto;
- (void)addRecurrenceDate:(id)a3;
- (void)setDtstart:(id)a3;
- (void)setRdate:(id)a3;
- (void)setRrule:(id)a3;
- (void)setTzname:(id)a3;
- (void)setTzoffsetfrom:(int64_t)a3;
- (void)setTzoffsetto:(int64_t)a3;
@end

@implementation ICSTimeZoneBlock

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  v5 = [(ICSTimeZoneBlock *)self dtstart];
  v6 = [v5 value];
  v7 = [v4 dtstart];

  v8 = [v7 value];
  int64_t v9 = [v6 compare:v8];

  return v9;
}

- (BOOL)validate:(id *)a3
{
  v5 = [(ICSComponent *)self propertiesForName:@"DTSTART"];

  if (v5)
  {
    v6 = [(ICSComponent *)self propertiesForName:@"TZOFFSETTO"];

    if (v6)
    {
      v7 = [(ICSComponent *)self propertiesForName:@"TZOFFSETFROM"];

      if (v7)
      {
        uint64_t v8 = [(ICSComponent *)self propertiesForName:@"RRULE"];
        if (!v8
          || (int64_t v9 = (void *)v8,
              [(ICSComponent *)self propertiesForName:@"RDATE"],
              v10 = objc_claimAutoreleasedReturnValue(),
              v10,
              v9,
              !v10))
        {
          v17.receiver = self;
          v17.super_class = (Class)ICSTimeZoneBlock;
          return [(ICSComponent *)&v17 validate:a3];
        }
        if (a3)
        {
          v11 = (void *)MEMORY[0x1E4F28C58];
          v12 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v13 = *MEMORY[0x1E4F28568];
          v14 = @"RDATE and RRULE cannot both be set for VTIMEZONE.";
LABEL_14:
          v15 = [v12 dictionaryWithObject:v14 forKey:v13];
          *a3 = [v11 errorWithDomain:@"com.apple.iCalendar" code:1000 userInfo:v15];
        }
      }
      else if (a3)
      {
        v11 = (void *)MEMORY[0x1E4F28C58];
        v12 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v13 = *MEMORY[0x1E4F28568];
        v14 = @"TZOFFSETFROM is required for VTIMEZONE.";
        goto LABEL_14;
      }
    }
    else if (a3)
    {
      v11 = (void *)MEMORY[0x1E4F28C58];
      v12 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v13 = *MEMORY[0x1E4F28568];
      v14 = @"TZOFFSETTO is required for VTIMEZONE.";
      goto LABEL_14;
    }
  }
  else if (a3)
  {
    v11 = (void *)MEMORY[0x1E4F28C58];
    v12 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v13 = *MEMORY[0x1E4F28568];
    v14 = @"DTSTART is required for VTIMEZONE.";
    goto LABEL_14;
  }
  return 0;
}

- (ICSDate)dtstart
{
  v2 = [(ICSComponent *)self propertiesForName:@"DTSTART"];
  v3 = [v2 lastObject];

  return (ICSDate *)v3;
}

- (void)setDtstart:(id)a3
{
}

- (void)setRdate:(id)a3
{
}

- (NSArray)rdate
{
  return (NSArray *)[(ICSComponent *)self propertiesForName:@"RDATE"];
}

- (void)setRrule:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
        v12 = [ICSProperty alloc];
        uint64_t v13 = -[ICSProperty initWithValue:type:](v12, "initWithValue:type:", v11, 5029, (void)v14);
        [v5 addObject:v13];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  [(ICSComponent *)self setProperties:v5 forName:@"RRULE"];
}

- (NSArray)rrule
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(ICSComponent *)self propertiesForName:@"RRULE"];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) value];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSArray)tzname
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(ICSComponent *)self propertiesForName:@"TZNAME"];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) value];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (void)setTzname:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
        long long v12 = [ICSProperty alloc];
        long long v13 = -[ICSProperty initWithValue:type:](v12, "initWithValue:type:", v11, 5007, (void)v14);
        [v5 addObject:v13];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  [(ICSComponent *)self setProperties:v5 forName:@"TZNAME"];
}

- (int64_t)tzoffsetfrom
{
  v2 = [(ICSComponent *)self propertiesForName:@"TZOFFSETFROM"];
  v3 = [v2 lastObject];
  id v4 = [v3 value];
  int64_t v5 = [v4 integerValue];

  return v5;
}

- (void)setTzoffsetfrom:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(ICSComponent *)self setPropertyValue:v4 type:5018 forName:@"TZOFFSETFROM"];
}

- (int64_t)tzoffsetto
{
  v2 = [(ICSComponent *)self propertiesForName:@"TZOFFSETTO"];
  v3 = [v2 lastObject];
  id v4 = [v3 value];
  int64_t v5 = [v4 integerValue];

  return v5;
}

- (void)setTzoffsetto:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(ICSComponent *)self setPropertyValue:v4 type:5018 forName:@"TZOFFSETTO"];
}

- (void)addRecurrenceDate:(id)a3
{
}

- (id)computeTimeZoneChangeListFromDate:(id)a3 toDate:(id)a4
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v52 = a3;
  id v49 = a4;
  id v6 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v7 = [(ICSTimeZoneBlock *)self dtstart];
  uint64_t v8 = [v7 value];

  int64_t v9 = [(ICSTimeZoneBlock *)self tzoffsetfrom];
  int64_t v10 = [(ICSTimeZoneBlock *)self tzoffsetto];
  uint64_t v11 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:v9];
  id v12 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  v48 = (void *)[v12 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  v45 = (void *)v11;
  [v48 setTimeZone:v11];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  v42 = self;
  obuint64_t j = [(ICSTimeZoneBlock *)self rrule];
  v46 = (void *)v8;
  uint64_t v47 = [obj countByEnumeratingWithState:&v61 objects:v67 count:16];
  if (v47)
  {
    uint64_t v44 = *(void *)v62;
    do
    {
      long long v13 = 0;
      do
      {
        if (*(void *)v62 != v44) {
          objc_enumerationMutation(obj);
        }
        v50 = v13;
        long long v14 = [*(id *)(*((void *)&v61 + 1) + 8 * (void)v13) occurrencesForStartDate:v8 fromDate:v52 toDate:v49 inTimeZone:v45];
        long long v15 = [v52 components];
        long long v16 = [v48 dateFromComponents:v15];

        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        id v17 = v14;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v57 objects:v66 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v58;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v58 != v20) {
                objc_enumerationMutation(v17);
              }
              v22 = *(void **)(*((void *)&v57 + 1) + 8 * i);
              if ([v16 compare:v22] == -1)
              {
                v23 = [ICSTimeZoneChange alloc];
                [v22 timeIntervalSinceReferenceDate];
                v24 = -[ICSTimeZoneChange initWithTimeInterval:tzOffsetTo:](v23, "initWithTimeInterval:tzOffsetTo:", v10);
                [v6 addObject:v24];
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v57 objects:v66 count:16];
          }
          while (v19);
        }

        long long v13 = v50 + 1;
        uint64_t v8 = (uint64_t)v46;
      }
      while (v50 + 1 != (char *)v47);
      uint64_t v47 = [obj countByEnumeratingWithState:&v61 objects:v67 count:16];
    }
    while (v47);
  }

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v51 = [(ICSTimeZoneBlock *)v42 rdate];
  uint64_t v25 = [v51 countByEnumeratingWithState:&v53 objects:v65 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v54;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v54 != v27) {
          objc_enumerationMutation(v51);
        }
        v29 = *(void **)(*((void *)&v53 + 1) + 8 * j);
        v30 = [v29 value];
        if ([v52 compare:v30] == -1)
        {
          v31 = [v29 value];
          uint64_t v32 = [v49 compare:v31];

          if (v32 == -1) {
            continue;
          }
          v33 = [v29 value];
          v34 = [v33 components];
          v30 = [v48 dateFromComponents:v34];

          v35 = [ICSTimeZoneChange alloc];
          [v30 timeIntervalSinceReferenceDate];
          v36 = -[ICSTimeZoneChange initWithTimeInterval:tzOffsetTo:](v35, "initWithTimeInterval:tzOffsetTo:", v10);
          [v6 addObject:v36];
        }
      }
      uint64_t v26 = [v51 countByEnumeratingWithState:&v53 objects:v65 count:16];
    }
    while (v26);
  }

  if (![v6 count]
    && [v52 compare:v46] == -1
    && [v49 compare:v46] != -1)
  {
    v37 = [v46 components];
    v38 = [v48 dateFromComponents:v37];

    v39 = [ICSTimeZoneChange alloc];
    [v38 timeIntervalSinceReferenceDate];
    v40 = -[ICSTimeZoneChange initWithTimeInterval:tzOffsetTo:](v39, "initWithTimeInterval:tzOffsetTo:", v10);
    [v6 addObject:v40];
  }
  return v6;
}

@end