@interface SignpostSupportObject
+ (id)headerWithTimeFormat:(unint64_t)a3 verbosity:(unsigned __int8)a4;
+ (id)serializationTypeNumber;
- (BOOL)_containsMCT:(unint64_t)a3;
- (BOOL)_containsTimeObject:(id)a3;
- (BOOL)_hasBeginTimeval;
- (BOOL)_hasEndTimeval;
- (BOOL)_populateTimeStruct:(time *)a3 withTimeval:(timeval *)a4 withTZString:(id)a5;
- (BOOL)beginTimeval:(timeval *)a3;
- (BOOL)beginTimezone:(timezone *)a3;
- (BOOL)endTimeval:(timeval *)a3;
- (BOOL)endTimezone:(timezone *)a3;
- (BOOL)isEqual:(id)a3;
- (NSDate)beginDate;
- (NSDate)endDate;
- (NSString)category;
- (NSString)subsystem;
- (SignpostSupportObject)initWithDictionary:(id)a3;
- (SignpostSupportObject)initWithSubsystem:(id)a3 category:(id)a4 timebaseRatio:(double)a5;
- (double)durationMs;
- (double)endMs;
- (double)endSeconds;
- (double)startMs;
- (double)startSeconds;
- (double)timebaseRatio;
- (float)durationSeconds;
- (id)_containedObjectsFromArray:(id)a3;
- (id)_descriptionStringForColumn:(unint64_t)a3 timeFormat:(unint64_t)a4 asBegin:(BOOL)a5;
- (id)_descriptionWithTimeFormat:(unint64_t)a3 verbosity:(unsigned __int8)a4 asBegin:(BOOL)a5;
- (id)_dictionaryRepresentationWithIsHumanReadable:(BOOL)a3 shouldRedact:(BOOL)a4;
- (id)_wallTimeStringWithTimeZone:(id)a3 isBegin:(BOOL)a4;
- (id)beginWallTimeStringWithTimeZoneName:(id)a3;
- (id)descriptionWithTimeFormat:(unint64_t)a3 verbosity:(unsigned __int8)a4;
- (id)endWallTimeStringWithTimeZoneName:(id)a3;
- (id)humanReadableDictionaryRepresentation;
- (id)humanReadableType;
- (id)serializeableDictionaryWithShouldRedact:(BOOL)a3;
- (int)tv_usec;
- (int)tz_dsttime;
- (int)tz_minuteswest;
- (int64_t)tv_sec;
- (unint64_t)durationMachContinuousTime;
- (unint64_t)durationNanoseconds;
- (unint64_t)endMachContinuousTime;
- (unint64_t)endNanoseconds;
- (unint64_t)hash;
- (unint64_t)startMachContinuousTime;
- (unint64_t)startNanoseconds;
- (void)_adjustBeginTimeVal:(timeval *)a3;
- (void)_adjustEndTimeVal:(timeval *)a3;
- (void)setCategory:(id)a3;
- (void)setSubsystem:(id)a3;
- (void)setTimebaseRatio:(double)a3;
@end

@implementation SignpostSupportObject

- (double)timebaseRatio
{
  return self->_timebaseRatio;
}

- (NSString)subsystem
{
  return self->_subsystem;
}

- (NSString)category
{
  return self->_category;
}

- (SignpostSupportObject)initWithSubsystem:(id)a3 category:(id)a4 timebaseRatio:(double)a5
{
  v8 = (__CFString *)a3;
  v9 = (__CFString *)a4;
  v15.receiver = self;
  v15.super_class = (Class)SignpostSupportObject;
  v10 = [(SignpostSupportObject *)&v15 init];
  v11 = v10;
  if (v10)
  {
    if (v8) {
      v12 = v8;
    }
    else {
      v12 = @"Unknown";
    }
    objc_storeStrong((id *)&v10->_subsystem, v12);
    if (v9) {
      v13 = v9;
    }
    else {
      v13 = @"Unknown";
    }
    objc_storeStrong((id *)&v11->_category, v13);
    v11->_timebaseRatio = a5;
  }

  return v11;
}

- (BOOL)_containsTimeObject:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SignpostSupportObject *)self startMachContinuousTime];
  BOOL v7 = 0;
  if (v5 <= [v4 startMachContinuousTime])
  {
    unint64_t v6 = [(SignpostSupportObject *)self endMachContinuousTime];
    if (v6 >= [v4 endMachContinuousTime]) {
      BOOL v7 = 1;
    }
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);

  objc_storeStrong((id *)&self->_subsystem, 0);
}

- (unint64_t)hash
{
  unint64_t v3 = [(SignpostSupportObject *)self durationMachContinuousTime];
  unint64_t v4 = [(SignpostSupportObject *)self startMachContinuousTime];
  if (v3) {
    v4 ^= [(SignpostSupportObject *)self endMachContinuousTime];
  }
  return v4;
}

- (id)_containedObjectsFromArray:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    BOOL v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if ([(SignpostSupportObject *)self _containsTimeObject:v10])
        {
          if (!v7)
          {
            BOOL v7 = [MEMORY[0x1E4F1CA48] array];
          }
          [v7 addObject:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SignpostSupportObject *)a3;
  uint64_t v5 = v4;
  if (self == v4)
  {
    char v18 = 1;
  }
  else if (v4 && [(SignpostSupportObject *)v4 isMemberOfClass:objc_opt_class()])
  {
    uint64_t v6 = v5;
    unint64_t v7 = [(SignpostSupportObject *)self startMachContinuousTime];
    if (v7 != [(SignpostSupportObject *)v6 startMachContinuousTime]) {
      goto LABEL_14;
    }
    unint64_t v8 = [(SignpostSupportObject *)self endMachContinuousTime];
    if (v8 != [(SignpostSupportObject *)v6 endMachContinuousTime]) {
      goto LABEL_14;
    }
    int64_t v9 = [(SignpostSupportObject *)self tv_sec];
    if (v9 != [(SignpostSupportObject *)v6 tv_sec]) {
      goto LABEL_14;
    }
    int v10 = [(SignpostSupportObject *)self tv_usec];
    if (v10 != [(SignpostSupportObject *)v6 tv_usec]) {
      goto LABEL_14;
    }
    int v11 = [(SignpostSupportObject *)self tz_minuteswest];
    if (v11 != [(SignpostSupportObject *)v6 tz_minuteswest]) {
      goto LABEL_14;
    }
    int v12 = [(SignpostSupportObject *)self tz_dsttime];
    if (v12 != [(SignpostSupportObject *)v6 tz_dsttime]) {
      goto LABEL_14;
    }
    long long v13 = [(SignpostSupportObject *)self subsystem];
    long long v14 = [(SignpostSupportObject *)v6 subsystem];
    int v15 = [v13 isEqual:v14];

    if (v15)
    {
      v16 = [(SignpostSupportObject *)self category];
      uint64_t v17 = [(SignpostSupportObject *)v6 category];
      char v18 = [v16 isEqual:v17];
    }
    else
    {
LABEL_14:
      char v18 = 0;
    }
  }
  else
  {
    char v18 = 0;
  }

  return v18;
}

- (id)_dictionaryRepresentationWithIsHumanReadable:(BOOL)a3 shouldRedact:(BOOL)a4
{
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3, a4);
  if (a3)
  {
    unint64_t v7 = [(SignpostSupportObject *)self humanReadableType];
    [v6 setObject:v7 forKeyedSubscript:@"SignpostObjectType"];
    unint64_t v8 = @"Subsystem";
    int64_t v9 = @"Category";
    int v10 = @"TimebaseRatio";
  }
  else
  {
    unint64_t v7 = [(id)objc_opt_class() serializationTypeNumber];
    [v6 setObject:v7 forKeyedSubscript:@"SerType"];
    unint64_t v8 = @"Sub";
    int64_t v9 = @"Cat";
    int v10 = @"TBR";
  }

  int v11 = [(SignpostSupportObject *)self subsystem];
  [v6 setObject:v11 forKeyedSubscript:v8];

  int v12 = [(SignpostSupportObject *)self category];
  [v6 setObject:v12 forKeyedSubscript:v9];

  long long v13 = NSNumber;
  [(SignpostSupportObject *)self timebaseRatio];
  long long v14 = objc_msgSend(v13, "numberWithDouble:");
  [v6 setObject:v14 forKeyedSubscript:v10];

  return v6;
}

- (id)serializeableDictionaryWithShouldRedact:(BOOL)a3
{
  return [(SignpostSupportObject *)self _dictionaryRepresentationWithIsHumanReadable:0 shouldRedact:a3];
}

- (id)humanReadableDictionaryRepresentation
{
  return [(SignpostSupportObject *)self _dictionaryRepresentationWithIsHumanReadable:1 shouldRedact:0];
}

- (SignpostSupportObject)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v17.receiver = self;
    v17.super_class = (Class)SignpostSupportObject;
    self = [(SignpostSupportObject *)&v17 init];
    if (!self)
    {
LABEL_13:
      self = self;
      int v15 = self;
      goto LABEL_14;
    }
    uint64_t v5 = [v4 objectForKeyedSubscript:@"SerType"];
    if (v5)
    {
      uint64_t v6 = [(id)objc_opt_class() serializationTypeNumber];
      int v7 = [v5 isEqualToNumber:v6];

      if (v7)
      {
        unint64_t v8 = [v4 objectForKeyedSubscript:@"Sub"];
        [(SignpostSupportObject *)self setSubsystem:v8];

        int64_t v9 = [(SignpostSupportObject *)self subsystem];

        if (v9)
        {
          int v10 = [v4 objectForKeyedSubscript:@"Cat"];
          [(SignpostSupportObject *)self setCategory:v10];

          int v11 = [(SignpostSupportObject *)self category];

          if (v11)
          {
            int v12 = [v4 objectForKeyedSubscript:@"TBR"];
            long long v13 = v12;
            if (v12) {
              [v12 doubleValue];
            }
            else {
              double v14 = SignpostSystemTimebaseRatio();
            }
            [(SignpostSupportObject *)self setTimebaseRatio:v14];

            goto LABEL_13;
          }
        }
      }
    }
  }
  int v15 = 0;
LABEL_14:

  return v15;
}

+ (id)serializationTypeNumber
{
}

- (id)humanReadableType
{
}

- (BOOL)_populateTimeStruct:(time *)a3 withTimeval:(timeval *)a4 withTZString:(id)a5
{
  id v8 = a5;
  int64_t v9 = v8;
  __darwin_time_t tv_sec = a4->tv_sec;
  if (a4->tv_sec || a4->tv_usec)
  {
    if (v8)
    {
      if ([v8 isEqualToString:@"local"])
      {
        int v11 = 0;
      }
      else
      {
        v16 = getenv("TZ");
        if (v16)
        {
          int v11 = [NSString stringWithUTF8String:v16];
        }
        else
        {
          int v11 = 0;
        }
        setenv("TZ", (const char *)[v9 UTF8String], 1);
        tzset();
      }
      memset(&v22, 0, sizeof(v22));
      time_t v21 = a4->tv_sec;
      long long v13 = localtime_r(&v21, &v22);
      unint64_t v18 = ((unsigned __int128)(v22.tm_gmtoff * (__int128)0x7777777777777777) >> 64) - v22.tm_gmtoff;
      int v15 = (v18 >> 5) + (v18 >> 63);
    }
    else
    {
      memset(&v22, 0, sizeof(v22));
      __darwin_time_t v12 = tv_sec - 60 * [(SignpostSupportObject *)self tz_minuteswest];
      time_t v21 = v12 + 3600 * [(SignpostSupportObject *)self tz_dsttime];
      long long v13 = gmtime_r(&v21, &v22);
      LODWORD(v12) = [(SignpostSupportObject *)self tz_minuteswest];
      int v14 = [(SignpostSupportObject *)self tz_dsttime];
      int v11 = 0;
      int v15 = v12 - 60 * v14;
    }
    BOOL v17 = v13 != 0;
    if (v13)
    {
      *(int32x2_t *)&a3->var0 = vrev64_s32(vadd_s32(*(int32x2_t *)&v22.tm_mon, (int32x2_t)0x76C00000001));
      int8x16_t v19 = (int8x16_t)vrev64q_s32(*(int32x4_t *)&v22.tm_sec);
      *(int8x16_t *)&a3->var2 = vextq_s8(v19, v19, 8uLL);
      a3->var6 = a4->tv_usec;
      a3->var7 = ((int)(((unint64_t)(2004318071 * v15) >> 32) - v15) >> 5)
               + ((((unint64_t)(2004318071 * v15) >> 32) - v15) >> 31);
      if (v15 < 0) {
        int v15 = -v15;
      }
      a3->var8 = v15 % 0x3Cu;
    }
    if (v9)
    {
      if (v11) {
        setenv("TZ", (const char *)[v11 UTF8String], 1);
      }
      else {
        unsetenv("TZ");
      }
      tzset();
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (void)_adjustBeginTimeVal:(timeval *)a3
{
  a3->__darwin_time_t tv_sec = [(SignpostSupportObject *)self tv_sec];
  a3->tv_usec = [(SignpostSupportObject *)self tv_usec];
}

- (void)_adjustEndTimeVal:(timeval *)a3
{
  a3->__darwin_time_t tv_sec = [(SignpostSupportObject *)self tv_sec];
  a3->tv_usec = [(SignpostSupportObject *)self tv_usec];
}

- (id)_wallTimeStringWithTimeZone:(id)a3 isBegin:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v12[0] = 0;
  v12[1] = 0;
  if (v4) {
    [(SignpostSupportObject *)self _adjustBeginTimeVal:v12];
  }
  else {
    [(SignpostSupportObject *)self _adjustEndTimeVal:v12];
  }
  unsigned int v11 = 0;
  long long v9 = 0u;
  long long v10 = 0u;
  if ([(SignpostSupportObject *)self _populateTimeStruct:&v9 withTimeval:v12 withTZString:v6])
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%04d-%02d-%02d %02d:%02d:%02d.%06d%+03d%02d", v9, DWORD1(v9), DWORD2(v9), HIDWORD(v9), v10, DWORD1(v10), DWORD2(v10), HIDWORD(v10), v11);
    int v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v7 = @"Unknown";
  }

  return v7;
}

- (id)beginWallTimeStringWithTimeZoneName:(id)a3
{
  return [(SignpostSupportObject *)self _wallTimeStringWithTimeZone:a3 isBegin:1];
}

- (id)endWallTimeStringWithTimeZoneName:(id)a3
{
  return [(SignpostSupportObject *)self _wallTimeStringWithTimeZone:a3 isBegin:0];
}

- (BOOL)_hasBeginTimeval
{
  if ([(SignpostSupportObject *)self tv_sec] || (int v3 = [(SignpostSupportObject *)self tv_usec]) != 0) {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)_hasEndTimeval
{
  if ([(SignpostSupportObject *)self tv_sec] || (int v3 = [(SignpostSupportObject *)self tv_usec]) != 0) {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)beginTimezone:(timezone *)a3
{
  BOOL v5 = [(SignpostSupportObject *)self _hasBeginTimeval];
  if (v5)
  {
    a3->tz_minuteswest = [(SignpostSupportObject *)self tz_minuteswest];
    int v6 = [(SignpostSupportObject *)self tz_dsttime];
  }
  else
  {
    int v6 = 0;
    a3->tz_minuteswest = 0;
  }
  a3->tz_dsttime = v6;
  return v5;
}

- (BOOL)endTimezone:(timezone *)a3
{
  BOOL v5 = [(SignpostSupportObject *)self _hasEndTimeval];
  if (v5)
  {
    a3->tz_minuteswest = [(SignpostSupportObject *)self tz_minuteswest];
    int v6 = [(SignpostSupportObject *)self tz_dsttime];
  }
  else
  {
    int v6 = 0;
    a3->tz_minuteswest = 0;
  }
  a3->tz_dsttime = v6;
  return v5;
}

- (BOOL)beginTimeval:(timeval *)a3
{
  BOOL v5 = [(SignpostSupportObject *)self _hasBeginTimeval];
  if (v5)
  {
    [(SignpostSupportObject *)self _adjustBeginTimeVal:a3];
  }
  else
  {
    a3->__darwin_time_t tv_sec = 0;
    a3->tv_usec = 0;
  }
  return v5;
}

- (BOOL)endTimeval:(timeval *)a3
{
  BOOL v5 = [(SignpostSupportObject *)self _hasEndTimeval];
  if (v5)
  {
    [(SignpostSupportObject *)self _adjustEndTimeVal:a3];
  }
  else
  {
    a3->__darwin_time_t tv_sec = 0;
    a3->tv_usec = 0;
  }
  return v5;
}

- (NSDate)beginDate
{
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  BOOL v2 = [(SignpostSupportObject *)self beginTimeval:&v5];
  int v3 = 0;
  if (v2)
  {
    int v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)(int)v6 / 1000000.0 + (double)v5];
  }

  return (NSDate *)v3;
}

- (NSDate)endDate
{
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  BOOL v2 = [(SignpostSupportObject *)self endTimeval:&v5];
  int v3 = 0;
  if (v2)
  {
    int v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)(int)v6 / 1000000.0 + (double)v5];
  }

  return (NSDate *)v3;
}

+ (id)headerWithTimeFormat:(unint64_t)a3 verbosity:(unsigned __int8)a4
{
  if (a4 != 3)
  {
    int v6 = a4;
    BOOL v4 = [MEMORY[0x1E4F28E78] string];
    unint64_t v8 = 0;
    char v9 = 1;
    while (1)
    {
      if (v6 || v8 <= 0xC)
      {
        long long v10 = @"Glitch Count";
        switch(v8)
        {
          case 0uLL:
            if (a3 >= 3) {
              goto LABEL_18;
            }
            unsigned int v11 = off_1E5B40710;
            goto LABEL_16;
          case 1uLL:
            if (a3 >= 3) {
              goto LABEL_18;
            }
            unsigned int v11 = off_1E5B40728;
            goto LABEL_16;
          case 2uLL:
            goto LABEL_18;
          case 4uLL:
            if (a3 >= 3)
            {
LABEL_18:
              long long v10 = @"FPS";
              if (v9) {
                goto LABEL_47;
              }
LABEL_46:
              [(__CFString *)v4 appendFormat:@"\t"];
              goto LABEL_47;
            }
            unsigned int v11 = off_1E5B40740;
LABEL_16:
            long long v10 = v11[a3];
            if ((v9 & 1) == 0) {
              goto LABEL_46;
            }
LABEL_47:
            if (v8 > 0x12) {
              uint64_t v12 = 10;
            }
            else {
              uint64_t v12 = dword_1A45C2618[v8];
            }
            [(__CFString *)v4 appendFormat:@"%-*s", v12, [(__CFString *)v10 UTF8String]];
            char v9 = 0;
            break;
          case 5uLL:
            long long v10 = @"Type";
            if (v9) {
              goto LABEL_47;
            }
            goto LABEL_46;
          case 6uLL:
            long long v10 = @"Name";
            if (v9) {
              goto LABEL_47;
            }
            goto LABEL_46;
          case 7uLL:
            long long v10 = @"Subsystem";
            if (v9) {
              goto LABEL_47;
            }
            goto LABEL_46;
          case 8uLL:
            long long v10 = @"Category";
            if (v9) {
              goto LABEL_47;
            }
            goto LABEL_46;
          case 9uLL:
            long long v10 = @"Process";
            if (v9) {
              goto LABEL_47;
            }
            goto LABEL_46;
          case 0xAuLL:
            long long v10 = @"Thread";
            if (v9) {
              goto LABEL_47;
            }
            goto LABEL_46;
          case 0xBuLL:
            long long v10 = @"ID";
            if (v9) {
              goto LABEL_47;
            }
            goto LABEL_46;
          case 0xCuLL:
            long long v10 = @"Scope";
            if (v9) {
              goto LABEL_47;
            }
            goto LABEL_46;
          case 0xDuLL:
            long long v10 = @"Telemetry";
            if (v9) {
              goto LABEL_47;
            }
            goto LABEL_46;
          case 0xEuLL:
            long long v10 = @"Telemetry string1";
            if (v9) {
              goto LABEL_47;
            }
            goto LABEL_46;
          case 0xFuLL:
            long long v10 = @"Telemetry string2";
            if (v9) {
              goto LABEL_47;
            }
            goto LABEL_46;
          case 0x10uLL:
            long long v10 = @"Telemetry number1";
            if (v9) {
              goto LABEL_47;
            }
            goto LABEL_46;
          case 0x11uLL:
            long long v10 = @"Telemetry number2";
            goto LABEL_45;
          case 0x12uLL:
            long long v10 = @"Metadata/Message";
            if (v9) {
              goto LABEL_47;
            }
            goto LABEL_46;
          default:
LABEL_45:
            if ((v9 & 1) == 0) {
              goto LABEL_46;
            }
            goto LABEL_47;
        }
      }
      if (++v8 == 19) {
        goto LABEL_3;
      }
    }
  }
  BOOL v4 = &stru_1EF807BF0;
LABEL_3:

  return v4;
}

- (id)_descriptionWithTimeFormat:(unint64_t)a3 verbosity:(unsigned __int8)a4 asBegin:(BOOL)a5
{
  if (a4 == 3)
  {
    int v6 = [(SignpostSupportObject *)self debugDescription];
  }
  else
  {
    BOOL v7 = a5;
    int v8 = a4;
    int v6 = [MEMORY[0x1E4F28E78] string];
    unint64_t v10 = 0;
    char v11 = 1;
    do
    {
      if (v8 || v10 <= 0xC)
      {
        uint64_t v12 = [(SignpostSupportObject *)self _descriptionStringForColumn:v10 timeFormat:a3 asBegin:v7];
        long long v13 = (void *)v12;
        int v14 = @"n/a";
        if (v12) {
          int v14 = (__CFString *)v12;
        }
        int v15 = v14;

        if ((v11 & 1) == 0) {
          [v6 appendFormat:@"\t"];
        }
        if (v10 > 0x12) {
          uint64_t v16 = 10;
        }
        else {
          uint64_t v16 = dword_1A45C2618[v10];
        }
        BOOL v17 = v15;
        objc_msgSend(v6, "appendFormat:", @"%-*s", v16, -[__CFString UTF8String](v17, "UTF8String"));

        char v11 = 0;
      }
      ++v10;
    }
    while (v10 != 19);
  }

  return v6;
}

- (id)descriptionWithTimeFormat:(unint64_t)a3 verbosity:(unsigned __int8)a4
{
  return [(SignpostSupportObject *)self _descriptionWithTimeFormat:a3 verbosity:a4 asBegin:1];
}

- (id)_descriptionStringForColumn:(unint64_t)a3 timeFormat:(unint64_t)a4 asBegin:(BOOL)a5
{
  uint64_t v5 = 0;
  switch(a3)
  {
    case 0uLL:
      if (a4 == 2)
      {
        if (a5) {
          [(SignpostSupportObject *)self beginWallTimeStringWithTimeZoneName:0];
        }
        else {
          [(SignpostSupportObject *)self endWallTimeStringWithTimeZoneName:0];
        }
        goto LABEL_24;
      }
      if (a4 == 1)
      {
        char v11 = NSString;
        if (a5) {
          unint64_t v12 = [(SignpostSupportObject *)self startMachContinuousTime];
        }
        else {
          unint64_t v12 = [(SignpostSupportObject *)self endMachContinuousTime];
        }
        goto LABEL_20;
      }
      if (a4) {
        goto LABEL_11;
      }
      int v6 = NSString;
      if (a5) {
        unint64_t v7 = [(SignpostSupportObject *)self startNanoseconds];
      }
      else {
        unint64_t v7 = [(SignpostSupportObject *)self endNanoseconds];
      }
      double v9 = (double)v7 / 1000000000.0;
      goto LABEL_23;
    case 1uLL:
      if (a4 == 2) {
        goto LABEL_10;
      }
      if (a4 == 1)
      {
        char v11 = NSString;
        unint64_t v12 = [(SignpostSupportObject *)self durationMachContinuousTime];
LABEL_20:
        objc_msgSend(v11, "stringWithFormat:", @"%llu", v12);
      }
      else
      {
        if (a4)
        {
LABEL_11:
          uint64_t v10 = [(SignpostSupportObject *)self subsystem];
          goto LABEL_25;
        }
LABEL_10:
        int v6 = NSString;
        [(SignpostSupportObject *)self durationSeconds];
        double v9 = v8;
LABEL_23:
        objc_msgSend(v6, "stringWithFormat:", @"%fs", *(void *)&v9);
      }
      uint64_t v10 = LABEL_24:;
LABEL_25:
      uint64_t v5 = (void *)v10;
LABEL_26:
      return v5;
    case 7uLL:
      goto LABEL_11;
    case 8uLL:
      uint64_t v10 = [(SignpostSupportObject *)self category];
      goto LABEL_25;
    default:
      goto LABEL_26;
  }
}

- (int64_t)tv_sec
{
}

- (int)tv_usec
{
}

- (int)tz_minuteswest
{
}

- (int)tz_dsttime
{
}

- (unint64_t)startMachContinuousTime
{
}

- (unint64_t)startNanoseconds
{
  double v3 = (double)[(SignpostSupportObject *)self startMachContinuousTime];
  [(SignpostSupportObject *)self timebaseRatio];
  return (unint64_t)(v4 * v3);
}

- (unint64_t)endMachContinuousTime
{
}

- (unint64_t)endNanoseconds
{
  double v3 = (double)[(SignpostSupportObject *)self endMachContinuousTime];
  [(SignpostSupportObject *)self timebaseRatio];
  return (unint64_t)(v4 * v3);
}

- (unint64_t)durationMachContinuousTime
{
}

- (float)durationSeconds
{
  return (float)[(SignpostSupportObject *)self durationNanoseconds] / 1000000000.0;
}

- (unint64_t)durationNanoseconds
{
  unint64_t v3 = [(SignpostSupportObject *)self endNanoseconds];
  return v3 - [(SignpostSupportObject *)self startNanoseconds];
}

- (double)endSeconds
{
  return (double)[(SignpostSupportObject *)self endNanoseconds] / 1000000000.0;
}

- (double)startSeconds
{
  return (double)[(SignpostSupportObject *)self startNanoseconds] / 1000000000.0;
}

- (double)startMs
{
  return (double)[(SignpostSupportObject *)self startNanoseconds] / 1000000.0;
}

- (double)endMs
{
  return (double)[(SignpostSupportObject *)self endNanoseconds] / 1000000.0;
}

- (double)durationMs
{
  return (double)[(SignpostSupportObject *)self durationNanoseconds] / 1000000.0;
}

- (BOOL)_containsMCT:(unint64_t)a3
{
  if ([(SignpostSupportObject *)self startMachContinuousTime] == a3) {
    return 1;
  }
  if ([(SignpostSupportObject *)self startMachContinuousTime] <= a3) {
    return [(SignpostSupportObject *)self endMachContinuousTime] > a3;
  }
  return 0;
}

- (void)setSubsystem:(id)a3
{
}

- (void)setCategory:(id)a3
{
}

- (void)setTimebaseRatio:(double)a3
{
  self->_timebaseRatio = a3;
}

@end