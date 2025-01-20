@interface ICSCalendar
+ (id)ICSStringFromCalendarServerAccess:(int)a3;
+ (id)ICSStringFromMethod:(int)a3;
+ (id)calendarWithKnownTimeZones;
+ (id)defaultProdid;
+ (id)name;
+ (int)calendarServerAccessFromICSString:(id)a3;
+ (int)methodFromICSString:(id)a3;
+ (int64_t)compareCalendarServerAccess:(int)a3 withAccess:(int)a4;
+ (void)setDefaultProdid:(id)a3;
- (ICSCalendar)init;
- (ICSColor)x_apple_calendar_color;
- (ICSDuration)x_apple_auto_refresh;
- (NSString)calscale;
- (NSString)prodid;
- (NSString)version;
- (NSString)x_apple_language;
- (NSString)x_apple_region;
- (NSString)x_wr_caldesc;
- (NSString)x_wr_calname;
- (NSString)x_wr_relcalid;
- (NSString)x_wr_timezone;
- (id)_init;
- (id)_initWithVersionAndProdID:(BOOL)a3;
- (id)_timeZonesForComponents:(id)a3 options:(int)a4;
- (id)componentForKey:(id)a3;
- (id)componentKeys;
- (id)componentOccurrencesForKey:(id)a3;
- (id)parsingErrors;
- (id)systemCalendarForDate:(id)a3 options:(int)a4;
- (id)systemDateForDate:(id)a3 options:(int)a4;
- (id)systemTimeZoneForDate:(id)a3;
- (id)timeZoneForKey:(id)a3;
- (int)method;
- (void)_addComponent:(id)a3 withUIDGenerator:(id)a4;
- (void)_addTimeZonesInComponent:(id)a3 toDictionary:(id)a4;
- (void)_addTimeZonesInComponent:(id)a3 toSet:(id)a4;
- (void)addComponent:(id)a3 withUIDGenerator:(id)a4;
- (void)addParsingError:(id)a3;
- (void)fixComponent;
- (void)fixEntities;
- (void)fixPropertiesInheritance;
- (void)setCalscale:(id)a3;
- (void)setComponents:(id)a3;
- (void)setComponents:(id)a3 options:(int)a4;
- (void)setComponents:(id)a3 timeZones:(BOOL)a4;
- (void)setMethod:(int)a3;
- (void)setProdid:(id)a3;
- (void)setVersion:(id)a3;
- (void)setX_apple_auto_refresh:(id)a3;
- (void)setX_apple_calendar_color:(id)a3;
- (void)setX_apple_language:(id)a3;
- (void)setX_apple_region:(id)a3;
- (void)setX_wr_caldesc:(id)a3;
- (void)setX_wr_calname:(id)a3;
- (void)setX_wr_relcalid:(id)a3;
- (void)setX_wr_timezone:(id)a3;
@end

@implementation ICSCalendar

+ (id)calendarWithKnownTimeZones
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v2 = objc_msgSend(MEMORY[0x1E4F1CAF0], "knownTimeZoneNames", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = +[ICSTimeZone timeZoneWithSystemTimeZoneName:*(void *)(*((void *)&v13 + 1) + 8 * i)];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }

  v8 = objc_alloc_init(ICSCalendar);
  v9 = (void *)MEMORY[0x1E4F1CA48];
  v10 = [(id)_sCache allValues];
  v11 = [v9 arrayWithArray:v10];
  [(ICSCalendar *)v8 setComponents:v11];

  return v8;
}

+ (id)name
{
  return @"VCALENDAR";
}

+ (void)setDefaultProdid:(id)a3
{
  id v6 = a3;
  id v5 = a1;
  objc_sync_enter(v5);
  if ((id)__defaultProdid != v6) {
    objc_storeStrong((id *)&__defaultProdid, a3);
  }
  objc_sync_exit(v5);
}

+ (id)defaultProdid
{
  id v2 = a1;
  objc_sync_enter(v2);
  id v3 = (id)__defaultProdid;
  objc_sync_exit(v2);

  return v3;
}

+ (int)methodFromICSString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PUBLISH"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"REQUEST"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"REPLY"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ADD"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CANCEL"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"REFRESH"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"COUNTER"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"DECLINE-COUNTER"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

+ (id)ICSStringFromMethod:(int)a3
{
  if ((a3 - 1) > 7) {
    return 0;
  }
  else {
    return off_1E6C250E8[a3 - 1];
  }
}

+ (int)calendarServerAccessFromICSString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CONFIDENTIAL"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"PUBLIC"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PRIVATE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"RESTRICTED"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

+ (id)ICSStringFromCalendarServerAccess:(int)a3
{
  if ((a3 - 1) > 3) {
    return 0;
  }
  else {
    return off_1E6C25128[a3 - 1];
  }
}

+ (int64_t)compareCalendarServerAccess:(int)a3 withAccess:(int)a4
{
  if (a3 < a4) {
    return -1;
  }
  else {
    return a3 > a4;
  }
}

- (ICSCalendar)init
{
  return (ICSCalendar *)[(ICSCalendar *)self _initWithVersionAndProdID:1];
}

- (id)_initWithVersionAndProdID:(BOOL)a3
{
  BOOL v3 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ICSCalendar;
  int v4 = [(ICSComponent *)&v17 init];
  if (v4)
  {
    id v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    masters = v4->_masters;
    v4->_masters = v5;

    id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    occurrences = v4->_occurrences;
    v4->_occurrences = v7;

    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    keys = v4->_keys;
    v4->_keys = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    timezones = v4->_timezones;
    v4->_timezones = v11;

    long long v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    parsingErrors = v4->_parsingErrors;
    v4->_parsingErrors = v13;

    if (v3)
    {
      [(ICSCalendar *)v4 setVersion:@"2.0"];
      [(ICSCalendar *)v4 setCalscale:@"GREGORIAN"];
      long long v15 = [(id)objc_opt_class() defaultProdid];
      [(ICSCalendar *)v4 setProdid:v15];
    }
  }
  return v4;
}

- (NSString)calscale
{
  id v2 = [(ICSComponent *)self propertiesForName:@"CALSCALE"];
  BOOL v3 = [v2 lastObject];
  int v4 = [v3 value];

  return (NSString *)v4;
}

- (void)setCalscale:(id)a3
{
}

- (int)method
{
  id v2 = [(ICSComponent *)self propertiesForName:@"METHOD"];
  BOOL v3 = [v2 lastObject];
  int v4 = [v3 value];
  int v5 = [v4 longValue];

  return v5;
}

- (void)setMethod:(int)a3
{
  id v4 = +[ICSPredefinedValue numberWithLong:a3];
  [(ICSComponent *)self setPropertyValue:v4 type:5025 forName:@"METHOD"];
}

- (NSString)prodid
{
  id v2 = [(ICSComponent *)self propertiesForName:@"PRODID"];
  BOOL v3 = [v2 lastObject];
  id v4 = [v3 value];

  return (NSString *)v4;
}

- (void)setProdid:(id)a3
{
}

- (NSString)version
{
  id v2 = [(ICSComponent *)self propertiesForName:@"VERSION"];
  BOOL v3 = [v2 lastObject];
  id v4 = [v3 value];

  return (NSString *)v4;
}

- (void)setVersion:(id)a3
{
}

- (ICSDuration)x_apple_auto_refresh
{
  id v2 = [(ICSComponent *)self propertiesForName:@"X-APPLE-AUTO-REFRESH"];
  BOOL v3 = [v2 lastObject];
  id v4 = [v3 value];

  int v5 = +[ICSDuration durationFromICSString:v4];

  return (ICSDuration *)v5;
}

- (void)setX_apple_auto_refresh:(id)a3
{
}

- (ICSColor)x_apple_calendar_color
{
  id v2 = [(ICSComponent *)self propertiesForName:@"X-APPLE-CALENDAR-COLOR"];
  BOOL v3 = [v2 lastObject];
  id v4 = [v3 value];

  if ([v4 length] == 7 || objc_msgSend(v4, "length") == 9)
  {
    int v5 = 0;
    if ([v4 characterAtIndex:0] == 35)
    {
      uint64_t v18 = 0;
      int v17 = 0;
      id v6 = (void *)MEMORY[0x1E4F28FE8];
      id v7 = objc_msgSend(v4, "substringWithRange:", 1, 2);
      v8 = [v6 scannerWithString:v7];
      [v8 scanHexInt:(char *)&v18 + 4];

      v9 = (void *)MEMORY[0x1E4F28FE8];
      v10 = objc_msgSend(v4, "substringWithRange:", 3, 2);
      v11 = [v9 scannerWithString:v10];
      [v11 scanHexInt:&v18];

      v12 = (void *)MEMORY[0x1E4F28FE8];
      long long v13 = objc_msgSend(v4, "substringWithRange:", 5, 2);
      long long v14 = [v12 scannerWithString:v13];
      [v14 scanHexInt:&v17];

      long long v15 = [ICSColor alloc];
      int v5 = [(ICSColor *)v15 initWithRed:BYTE4(v18) green:v18 blue:v17];
    }
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (void)setX_apple_calendar_color:(id)a3
{
  if (a3)
  {
    id v4 = NSString;
    id v5 = a3;
    unsigned int v6 = [v5 red];
    unsigned int v7 = [v5 green];
    unsigned int v8 = [v5 blue];

    uint64_t v9 = objc_msgSend(v4, "stringWithFormat:", @"#%02X%02X%02X", v6, v7, v8);
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = (id)v9;
  [(ICSComponent *)self setPropertyValue:v9 forName:@"X-APPLE-CALENDAR-COLOR"];
}

- (void)setX_wr_caldesc:(id)a3
{
}

- (NSString)x_wr_caldesc
{
  id v2 = [(ICSComponent *)self propertiesForName:@"X-WR-CALDESC"];
  BOOL v3 = [v2 lastObject];
  id v4 = [v3 value];

  return (NSString *)v4;
}

- (NSString)x_wr_calname
{
  id v2 = [(ICSComponent *)self propertiesForName:@"X-WR-CALNAME"];
  BOOL v3 = [v2 lastObject];
  id v4 = [v3 value];

  return (NSString *)v4;
}

- (void)setX_wr_calname:(id)a3
{
}

- (NSString)x_apple_language
{
  id v2 = [(ICSComponent *)self propertiesForName:@"X-APPLE-LANGUAGE"];
  BOOL v3 = [v2 lastObject];
  id v4 = [v3 value];

  return (NSString *)v4;
}

- (void)setX_apple_language:(id)a3
{
}

- (NSString)x_apple_region
{
  id v2 = [(ICSComponent *)self propertiesForName:@"X-APPLE-REGION"];
  BOOL v3 = [v2 lastObject];
  id v4 = [v3 value];

  return (NSString *)v4;
}

- (void)setX_apple_region:(id)a3
{
}

- (NSString)x_wr_relcalid
{
  id v2 = [(ICSComponent *)self propertiesForName:@"X-WR-RELCALID"];
  BOOL v3 = [v2 lastObject];
  id v4 = [v3 value];

  return (NSString *)v4;
}

- (void)setX_wr_relcalid:(id)a3
{
}

- (NSString)x_wr_timezone
{
  id v2 = [(ICSComponent *)self propertiesForName:@"X-WR-TIMEZONE"];
  BOOL v3 = [v2 lastObject];
  id v4 = [v3 value];

  return (NSString *)v4;
}

- (void)setX_wr_timezone:(id)a3
{
}

- (id)systemTimeZoneForDate:(id)a3
{
  id v4 = a3;
  id v5 = [v4 value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    unsigned int v7 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
  }
  else
  {
    unsigned int v7 = [v4 tzid];

    if (v7)
    {
      unsigned int v8 = [v4 tzid];
      uint64_t v9 = [(ICSCalendar *)self timeZoneForKey:v8];

      id v10 = [v4 value];
      unsigned int v7 = [v9 systemTimeZoneForDate:v10];

      if (!v7)
      {
        v11 = (void *)MEMORY[0x1E4F1CAF0];
        v12 = [v4 tzid];
        unsigned int v7 = [v11 timeZoneWithName:v12];
      }
    }
  }

  return v7;
}

- (id)systemCalendarForDate:(id)a3 options:(int)a4
{
  unsigned int v6 = (objc_class *)MEMORY[0x1E4F1C9A8];
  id v7 = a3;
  id v8 = [v6 alloc];
  uint64_t v9 = (void *)[v8 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  id v10 = [(ICSCalendar *)self systemTimeZoneForDate:v7];

  if (v10)
  {
    [v9 setTimeZone:v10];
  }
  else if (a4 == 1)
  {
    v11 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
    [v9 setTimeZone:v11];
  }
  return v9;
}

- (id)systemDateForDate:(id)a3 options:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 components];
    uint64_t v9 = [(ICSCalendar *)self systemTimeZoneForDate:v7];
    uint64_t v10 = [v9 name];
    if (v10) {
      BOOL v11 = 0;
    }
    else {
      BOOL v11 = v4 == 1;
    }
    if (v11) {
      v12 = @"UTC";
    }
    else {
      v12 = (__CFString *)v10;
    }
    long long v13 = [MEMORY[0x1E4F29060] currentThread];
    long long v14 = [v13 threadDictionary];

    long long v15 = [v14 objectForKey:@"ICSCachedCalendars"];
    if (!v15)
    {
      long long v15 = [MEMORY[0x1E4F1CA60] dictionary];
      [v14 setValue:v15 forKey:@"ICSCachedCalendars"];
    }
    long long v16 = [v15 objectForKey:v12];
    if (!v16)
    {
      uint64_t v17 = [(ICSCalendar *)self systemCalendarForDate:v7 options:v4];
      long long v16 = (void *)v17;
      if (v12)
      {
        if (v17) {
          [v15 setObject:v17 forKey:v12];
        }
      }
    }
    uint64_t v18 = [v16 dateFromComponents:v8];
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

- (void)_addTimeZonesInComponent:(id)a3 toSet:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v8 = [v6 components];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v39 != v11) {
          objc_enumerationMutation(v8);
        }
        [(ICSCalendar *)self _addTimeZonesInComponent:*(void *)(*((void *)&v38 + 1) + 8 * i) toSet:v7];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v10);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v26 = v6;
  long long v13 = [v6 properties];
  long long v14 = [v13 allValues];

  uint64_t v28 = [v14 countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v28)
  {
    uint64_t v27 = *(void *)v35;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v35 != v27) {
          objc_enumerationMutation(v14);
        }
        uint64_t v29 = v15;
        long long v16 = *(void **)(*((void *)&v34 + 1) + 8 * v15);
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v17 = v16;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v42 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v31;
          do
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v31 != v20) {
                objc_enumerationMutation(v17);
              }
              v22 = *(void **)(*((void *)&v30 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v23 = [v22 value];
                objc_opt_class();
                char isKindOfClass = objc_opt_isKindOfClass();

                if (isKindOfClass)
                {
                  v25 = [v22 tzid];
                  if (v25) {
                    [v7 addObject:v25];
                  }
                }
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v42 count:16];
          }
          while (v19);
        }

        uint64_t v15 = v29 + 1;
      }
      while (v29 + 1 != v28);
      uint64_t v28 = [v14 countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v28);
  }
}

- (void)_addTimeZonesInComponent:(id)a3 toDictionary:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v8 = [v6 components];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v41 != v11) {
          objc_enumerationMutation(v8);
        }
        [(ICSCalendar *)self _addTimeZonesInComponent:*(void *)(*((void *)&v40 + 1) + 8 * i) toDictionary:v7];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v10);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v28 = v6;
  long long v13 = [v6 properties];
  long long v14 = [v13 allValues];

  uint64_t v30 = [v14 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v30)
  {
    uint64_t v29 = *(void *)v37;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v37 != v29) {
          objc_enumerationMutation(v14);
        }
        uint64_t v31 = v15;
        long long v16 = *(void **)(*((void *)&v36 + 1) + 8 * v15);
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v17 = v16;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v44 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v33;
          do
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v33 != v20) {
                objc_enumerationMutation(v17);
              }
              v22 = *(void **)(*((void *)&v32 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v23 = [v22 value];
                objc_opt_class();
                char isKindOfClass = objc_opt_isKindOfClass();

                if (isKindOfClass)
                {
                  v25 = [v22 tzid];
                  if (v25)
                  {
                    v26 = [v22 value];
                    uint64_t v27 = [v7 objectForKey:v25];
                    if (!v27 || [v26 compare:v27] == -1) {
                      [v7 setObject:v26 forKey:v25];
                    }
                  }
                }
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v32 objects:v44 count:16];
          }
          while (v19);
        }

        uint64_t v15 = v31 + 1;
      }
      while (v31 + 1 != v30);
      uint64_t v30 = [v14 countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v30);
  }
}

- (id)_timeZonesForComponents:(id)a3 options:(int)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v32 = [MEMORY[0x1E4F1CA48] array];
  id v7 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  id v8 = (void *)[v7 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  uint64_t v9 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v10 = [v8 components:28 fromDate:v9];

  uint64_t v11 = -[ICSDateTimeValue initWithYear:month:day:hour:minute:second:]([ICSDateTimeValue alloc], "initWithYear:month:day:hour:minute:second:", [v10 year], objc_msgSend(v10, "month"), objc_msgSend(v10, "day"), 0, 0, 0);
  unsigned int v31 = a4;
  if ((a4 - 1) <= 1)
  {
    uint64_t v27 = v10;
    uint64_t v28 = v8;
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v29 = v6;
    id v13 = v6;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v42 != v16) {
            objc_enumerationMutation(v13);
          }
          -[ICSCalendar _addTimeZonesInComponent:toDictionary:](self, "_addTimeZonesInComponent:toDictionary:", *(void *)(*((void *)&v41 + 1) + 8 * i), v12, v27, v28);
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v15);
    }

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    obuint64_t j = [v12 allKeys];
    uint64_t v36 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v36)
    {
      if (v31 == 1) {
        uint64_t v18 = 0;
      }
      else {
        uint64_t v18 = -1;
      }
      uint64_t v33 = v18;
      uint64_t v34 = *(void *)v38;
      long long v35 = v11;
      do
      {
        for (uint64_t j = 0; j != v36; ++j)
        {
          if (*(void *)v38 != v34) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void *)(*((void *)&v37 + 1) + 8 * j);
          v21 = objc_msgSend(v12, "objectForKey:", v20, v27, v28);
          if ([(ICSDateValue *)v11 compare:v21] == -1)
          {
            v22 = v11;

            v21 = v22;
          }
          v23 = -[ICSDateTimeValue initWithYear:month:day:hour:minute:second:]([ICSDateTimeValue alloc], "initWithYear:month:day:hour:minute:second:", [v21 year] + v33, objc_msgSend(v21, "month"), objc_msgSend(v21, "day"), objc_msgSend(v21, "hour"), objc_msgSend(v21, "minute"), objc_msgSend(v21, "second"));
          v24 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:v20];
          if (v24)
          {
            v25 = [[ICSTimeZone alloc] initWithSystemTimeZone:v24 fromDate:v23 options:v31];
            [v32 addObject:v25];
          }
          uint64_t v11 = v35;
        }
        uint64_t v36 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
      }
      while (v36);
    }

    id v8 = v28;
    id v6 = v29;
    uint64_t v10 = v27;
  }

  return v32;
}

- (void)_addComponent:(id)a3 withUIDGenerator:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  id v7 = [v16 propertiesForName:@"UID"];
  id v8 = [v7 lastObject];
  uint64_t v9 = [v8 value];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isKindOfClass = 1;
    if (v9) {
      goto LABEL_11;
    }
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (v9) {
      goto LABEL_11;
    }
  }
  if (isKindOfClass)
  {
    if (v6) {
      [v6 generateUID];
    }
    else {
    uint64_t v9 = +[ICSComponent makeUID];
    }
    [v16 setUid:v9];
  }
LABEL_11:
  if (!v9) {
    goto LABEL_20;
  }
  [(NSMutableSet *)self->_keys addObject:v9];
  uint64_t v11 = [v16 propertiesForName:@"RECURRENCE-ID"];

  if (v11)
  {
    id v12 = [(NSMutableDictionary *)self->_occurrences objectForKey:v9];
    if (!v12)
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [(NSMutableDictionary *)self->_occurrences setObject:v12 forKey:v9];
    }
    [v12 addObject:v16];
  }
  else
  {
    id v13 = [(NSMutableDictionary *)self->_masters objectForKey:v9];

    if (v13)
    {
      if ((isKindOfClass & 1) == 0) {
        goto LABEL_20;
      }
      NSLog(&cfstr_DuplicateUid.isa, v9);
    }
    [(NSMutableDictionary *)self->_masters setObject:v16 forKey:v9];
  }
LABEL_20:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = [v16 tzid];
    if (v14)
    {
      uint64_t v15 = [(NSMutableDictionary *)self->_timezones objectForKey:v14];

      if (v15) {
        NSLog(&cfstr_DuplicateTzid.isa, v14);
      }
      [(NSMutableDictionary *)self->_timezones setObject:v16 forKey:v14];
    }
  }
}

- (id)componentKeys
{
  return (id)[(NSMutableSet *)self->_keys allObjects];
}

- (id)componentForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_masters objectForKey:a3];
}

- (id)componentOccurrencesForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_occurrences objectForKey:a3];
}

- (void)setComponents:(id)a3 timeZones:(BOOL)a4
{
  if (a4) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 0;
  }
  [(ICSCalendar *)self setComponents:a3 options:v4];
}

- (void)setComponents:(id)a3 options:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  if (v4)
  {
    id v8 = [(ICSCalendar *)self _timeZonesForComponents:v6 options:v4];
    [v7 addObjectsFromArray:v8];
  }
  [v7 addObjectsFromArray:v6];
  v18.receiver = self;
  v18.super_class = (Class)ICSCalendar;
  [(ICSComponent *)&v18 setComponents:v7];
  [(NSMutableSet *)self->_keys removeAllObjects];
  [(NSMutableDictionary *)self->_masters removeAllObjects];
  [(NSMutableDictionary *)self->_occurrences removeAllObjects];
  [(NSMutableDictionary *)self->_timezones removeAllObjects];
  [(NSMutableArray *)self->_parsingErrors removeAllObjects];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        -[ICSCalendar _addComponent:withUIDGenerator:](self, "_addComponent:withUIDGenerator:", *(void *)(*((void *)&v14 + 1) + 8 * v13++), 0, (void)v14);
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v11);
  }
}

- (void)setComponents:(id)a3
{
}

- (void)addComponent:(id)a3 withUIDGenerator:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)ICSCalendar;
  id v6 = a4;
  id v7 = a3;
  [(ICSComponent *)&v8 addComponent:v7 withUIDGenerator:v6];
  -[ICSCalendar _addComponent:withUIDGenerator:](self, "_addComponent:withUIDGenerator:", v7, v6, v8.receiver, v8.super_class);
}

- (id)timeZoneForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_timezones objectForKey:a3];
}

- (void)addParsingError:(id)a3
{
}

- (id)parsingErrors
{
  id v2 = (void *)[(NSMutableArray *)self->_parsingErrors copy];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parsingErrors, 0);
  objc_storeStrong((id *)&self->_timezones, 0);
  objc_storeStrong((id *)&self->_occurrences, 0);
  objc_storeStrong((id *)&self->_masters, 0);
  objc_storeStrong((id *)&self->_keys, 0);
}

- (id)_init
{
  return [(ICSCalendar *)self _initWithVersionAndProdID:0];
}

- (void)fixPropertiesInheritance
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  BOOL v3 = [(ICSCalendar *)self componentKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v9 = [(ICSCalendar *)self componentForKey:v8];
        uint64_t v10 = [(ICSCalendar *)self componentOccurrencesForKey:v8];
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v16;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v16 != v13) {
                objc_enumerationMutation(v10);
              }
              [*(id *)(*((void *)&v15 + 1) + 8 * j) fixPropertiesInheritance:v9];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
          }
          while (v12);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v5);
  }
}

- (void)fixComponent
{
  BOOL v3 = [(ICSComponent *)self propertiesForName:@"METHOD"];

  if (v3)
  {
    uint64_t v4 = [(ICSComponent *)self propertiesForName:@"METHOD"];
    uint64_t v5 = [v4 lastObject];
    uint64_t v6 = [v5 value];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      [(ICSComponent *)self removePropertiesForName:@"METHOD"];
    }
  }
}

- (void)fixEntities
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(ICSCalendar *)self fixComponent];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  BOOL v3 = [(ICSComponent *)self components];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) fixComponent];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

@end