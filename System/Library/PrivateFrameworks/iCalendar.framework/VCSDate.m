@interface VCSDate
+ (id)dateListFromData:(id)a3;
- (BOOL)dateOnly;
- (BOOL)floating;
- (BOOL)isEqual:(id)a3;
- (NSDateComponents)components;
- (VCSDate)dateWithTimeComponentsFromDate:(id)a3;
- (VCSDate)initWithDateComponents:(id)a3 floating:(BOOL)a4 dateOnly:(BOOL)a5;
- (VCSDate)initWithDateString:(const char *)a3;
- (VCSDate)initWithYear:(int64_t)a3 month:(int64_t)a4 day:(int64_t)a5 hour:(int64_t)a6 minute:(int64_t)a7 second:(int64_t)a8 floating:(BOOL)a9 dateOnly:(BOOL)a10;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dateByAddingDays:(int64_t)a3;
- (id)dateForEndOfDay;
- (id)description;
- (id)nsDateWithLocalTimeZone:(id)a3;
@end

@implementation VCSDate

+ (id)dateListFromData:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = objc_opt_new();
  id v14 = v3;
  uint64_t v6 = [v14 bytes];
  uint64_t v7 = v6;
  for (uint64_t i = 0; ; ++i)
  {
    int v9 = *(unsigned __int8 *)(v6 + i);
    if (v9 != 32 && v9 != 59) {
      break;
    }
  }
  v10 = (unsigned __int8 *)(v6 + i);
  while (1)
  {
    uint64_t v11 = 0;
    while (v9 > 0x3Bu || ((1 << v9) & 0x800000100000001) == 0)
      LOBYTE(v9) = v10[++v11];
    if (!v11) {
      break;
    }
    [v5 setLength:0];
    [v5 appendBytes:v7 + (int)i length:v11];
    [v5 increaseLengthBy:1];
    v12 = -[VCSDate initWithDateString:]([VCSDate alloc], "initWithDateString:", [v5 bytes]);
    if (v12) {
      [v4 addObject:v12];
    }
    LODWORD(i) = v11 + i;
    v10 += v11;

    while (1)
    {
      int v9 = *v10;
      if (v9 != 59 && v9 != 32) {
        break;
      }
      ++v10;
      LODWORD(i) = i + 1;
    }
  }

  return v4;
}

- (VCSDate)initWithDateComponents:(id)a3 floating:(BOOL)a4 dateOnly:(BOOL)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VCSDate;
  int v9 = [(VCSDate *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    components = v9->_components;
    v9->_components = (NSDateComponents *)v10;

    v9->_floating = a4;
    v9->_dateOnly = a5;
  }

  return v9;
}

- (VCSDate)initWithYear:(int64_t)a3 month:(int64_t)a4 day:(int64_t)a5 hour:(int64_t)a6 minute:(int64_t)a7 second:(int64_t)a8 floating:(BOOL)a9 dateOnly:(BOOL)a10
{
  v17 = objc_opt_new();
  [v17 setYear:a3];
  [v17 setMonth:a4];
  [v17 setDay:a5];
  [v17 setHour:a6];
  [v17 setMinute:a7];
  [v17 setSecond:a8];
  v18 = objc_msgSend(MEMORY[0x1E4F1C9A8], "VCS_gregorianGMTCalendar");
  [v17 setCalendar:v18];

  v19 = [(VCSDate *)self initWithDateComponents:v17 floating:a9 dateOnly:a10];
  return v19;
}

- (VCSDate)initWithDateString:(const char *)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v16 = 0;
  size_t v5 = strlen(a3);
  if (v5 != 8)
  {
    if (v5 == 15)
    {
      char v6 = 1;
    }
    else
    {
      if (v5 != 16)
      {
LABEL_16:
        uint64_t v11 = 0;
        goto LABEL_17;
      }
      if (a3[15] != 90)
      {
        v12 = VCSLogHandle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[VCSDate initWithDateString:]((uint64_t)a3, v12);
        }
LABEL_15:

        goto LABEL_16;
      }
      char v6 = 0;
    }
    char v15 = 0;
    sscanf(a3, "%04d%02d%02d%c%02d%02d%02d", (char *)&v18 + 4, &v18, (char *)&v17 + 4, &v15, &v17, (char *)&v16 + 4, &v16);
    if (v15 == 84)
    {
      char v10 = 0;
      uint64_t v8 = HIDWORD(v16);
      uint64_t v9 = v17;
      uint64_t v7 = v16;
      goto LABEL_10;
    }
    v12 = VCSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[VCSDate initWithDateString:]((uint64_t)a3, v12);
    }
    goto LABEL_15;
  }
  sscanf(a3, "%04d%02d%02d", (char *)&v18 + 4, &v18, (char *)&v17 + 4);
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  char v6 = 1;
  char v10 = 1;
LABEL_10:
  BYTE1(v14) = v10;
  LOBYTE(v14) = v6;
  self = -[VCSDate initWithYear:month:day:hour:minute:second:floating:dateOnly:](self, "initWithYear:month:day:hour:minute:second:floating:dateOnly:", SHIDWORD(v18), v18, HIDWORD(v17), v9, v8, v7, v14);
  uint64_t v11 = self;
LABEL_17:

  return v11;
}

- (id)description
{
  id v3 = NSString;
  NSInteger v4 = [(NSDateComponents *)self->_components year];
  NSInteger v5 = [(NSDateComponents *)self->_components month];
  NSInteger v6 = [(NSDateComponents *)self->_components day];
  NSInteger v7 = [(NSDateComponents *)self->_components hour];
  NSInteger v8 = [(NSDateComponents *)self->_components minute];
  NSInteger v9 = [(NSDateComponents *)self->_components second];
  if (self->_floating) {
    char v10 = @"floating";
  }
  else {
    char v10 = @"UTC";
  }
  uint64_t v11 = [NSNumber numberWithBool:self->_dateOnly];
  v12 = [v3 stringWithFormat:@"%04ld-%02ld-%02ld %02ld:%02ld:%02ld (%@), dateOnly: %@", v4, v5, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSInteger v4 = [VCSDate alloc];
  NSInteger v5 = (void *)[(NSDateComponents *)self->_components copy];
  NSInteger v6 = [(VCSDate *)v4 initWithDateComponents:v5 floating:self->_floating dateOnly:self->_dateOnly];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int floating = self->_floating;
    if (floating == [v5 floating]
      && (int dateOnly = self->_dateOnly, dateOnly == [v5 dateOnly]))
    {
      components = self->_components;
      NSInteger v9 = [v5 components];
      char v10 = [(NSDateComponents *)components isEqual:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)dateForEndOfDay
{
  id v3 = (void *)[(NSDateComponents *)self->_components copy];
  [v3 setHour:23];
  [v3 setMinute:59];
  [v3 setSecond:59];
  id v4 = [[VCSDate alloc] initWithDateComponents:v3 floating:self->_floating dateOnly:self->_dateOnly];

  return v4;
}

- (id)dateByAddingDays:(int64_t)a3
{
  id v5 = [(NSDateComponents *)self->_components calendar];
  NSInteger v6 = [(NSDateComponents *)self->_components date];
  NSInteger v7 = [v5 dateByAddingUnit:16 value:a3 toDate:v6 options:1024];

  NSInteger v8 = [VCSDate alloc];
  NSInteger v9 = [(NSDateComponents *)self->_components calendar];
  char v10 = [v9 components:3145982 fromDate:v7];
  uint64_t v11 = [(VCSDate *)v8 initWithDateComponents:v10 floating:self->_floating dateOnly:self->_dateOnly];

  return v11;
}

- (VCSDate)dateWithTimeComponentsFromDate:(id)a3
{
  components = self->_components;
  id v4 = a3;
  id v5 = (void *)[(NSDateComponents *)components copy];
  NSInteger v6 = [v4 components];
  objc_msgSend(v5, "setHour:", objc_msgSend(v6, "hour"));

  NSInteger v7 = [v4 components];
  objc_msgSend(v5, "setMinute:", objc_msgSend(v7, "minute"));

  NSInteger v8 = [v4 components];
  objc_msgSend(v5, "setSecond:", objc_msgSend(v8, "second"));

  NSInteger v9 = [VCSDate alloc];
  uint64_t v10 = [v4 floating];
  uint64_t v11 = [v4 dateOnly];

  v12 = [(VCSDate *)v9 initWithDateComponents:v5 floating:v10 dateOnly:v11];
  return v12;
}

- (id)nsDateWithLocalTimeZone:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(VCSDate *)self floating];
  if (v4 && v5)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1C9A8], "VCS_gregorianLocalCalendar:", v4);
  }
  else
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1C9A8], "VCS_gregorianGMTCalendar");
  }
  NSInteger v7 = (void *)v6;
  NSInteger v8 = [(VCSDate *)self components];
  NSInteger v9 = [v7 dateFromComponents:v8];

  return v9;
}

- (NSDateComponents)components
{
  return self->_components;
}

- (BOOL)floating
{
  return self->_floating;
}

- (BOOL)dateOnly
{
  return self->_dateOnly;
}

- (void).cxx_destruct
{
}

- (void)initWithDateString:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DB9BF000, a2, OS_LOG_TYPE_ERROR, "malformed string for VCSDate: %s", (uint8_t *)&v2, 0xCu);
}

@end