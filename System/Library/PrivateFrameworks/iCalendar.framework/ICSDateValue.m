@interface ICSDateValue
+ (BOOL)supportsSecureCoding;
+ (id)dateFromICSString:(id)a3;
+ (id)dateFromICSUTF8String:(const char *)a3;
- (BOOL)isEqual:(id)a3;
- (ICSDateValue)initWithCoder:(id)a3;
- (ICSDateValue)initWithYear:(int64_t)a3 month:(int64_t)a4 day:(int64_t)a5;
- (id)components;
- (id)description;
- (id)icsString;
- (int)dateType;
- (int64_t)compare:(id)a3;
- (int64_t)day;
- (int64_t)month;
- (int64_t)year;
- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ICSDateValue

- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4
{
  id v5 = a4;
  objc_msgSend(v5, "appendFormat:", @"%.4d%.2d%.2d", -[ICSDateValue year](self, "year"), -[ICSDateValue month](self, "month"), -[ICSDateValue day](self, "day"));
}

+ (id)dateFromICSString:(id)a3
{
  uint64_t v4 = [a3 UTF8String];
  return (id)[a1 dateFromICSUTF8String:v4];
}

- (ICSDateValue)initWithYear:(int64_t)a3 month:(int64_t)a4 day:(int64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)ICSDateValue;
  result = [(ICSDateValue *)&v9 init];
  if (result)
  {
    result->_year = a3;
    result->_month = a4;
    result->_day = a5;
  }
  return result;
}

- (id)components
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v3 setYear:self->_year];
  [v3 setMonth:self->_month];
  [v3 setDay:self->_day];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(ICSDateValue *)self compare:v4] == 0;

  return v5;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(ICSDateValue *)self year];
  int64_t v6 = [(ICSDateValue *)self month];
  int64_t v7 = [(ICSDateValue *)self day];
  uint64_t v8 = [v4 year];
  uint64_t v9 = [v4 month];
  uint64_t v10 = [v4 day];
  if (v5 < v8) {
    goto LABEL_2;
  }
  if (v5 != v8) {
    goto LABEL_23;
  }
  if (v6 < v9 || v6 == v9 && v7 < v10) {
    goto LABEL_2;
  }
  int64_t v11 = 1;
  if (v6 == v9 && v7 == v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v12 = [(ICSDateValue *)self hour];
      uint64_t v13 = [(ICSDateValue *)self minute];
      uint64_t v14 = [(ICSDateValue *)self second];
    }
    else
    {
      uint64_t v12 = 0;
      uint64_t v13 = 0;
      uint64_t v14 = 0;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = [v4 hour];
      uint64_t v16 = [v4 minute];
      uint64_t v17 = [v4 second];
    }
    else
    {
      uint64_t v15 = 0;
      uint64_t v16 = 0;
      uint64_t v17 = 0;
    }
    if (v12 < v15) {
      goto LABEL_2;
    }
    if (v12 == v15)
    {
      if (v13 >= v16 && (v13 != v16 || v14 >= v17))
      {
        if (v13 == v16 && v14 == v17)
        {
          int64_t v11 = 0;
          goto LABEL_24;
        }
        goto LABEL_23;
      }
LABEL_2:
      int64_t v11 = -1;
      goto LABEL_24;
    }
LABEL_23:
    int64_t v11 = 1;
  }
LABEL_24:

  return v11;
}

- (id)icsString
{
  return [self _ICSStringWithOptions:0];
}

- (id)description
{
  return [self _ICSStringWithOptions:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t year = self->_year;
  id v5 = a3;
  [v5 encodeInteger:year forKey:@"Year"];
  [v5 encodeInteger:self->_month forKey:@"Month"];
  [v5 encodeInteger:self->_day forKey:@"Day"];
}

- (ICSDateValue)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ICSDateValue;
  id v5 = [(ICSDateValue *)&v7 init];
  if (v5)
  {
    v5->_int64_t year = [v4 decodeIntegerForKey:@"Year"];
    v5->_month = [v4 decodeIntegerForKey:@"Month"];
    v5->_day = [v4 decodeIntegerForKey:@"Day"];
  }

  return v5;
}

- (int64_t)year
{
  return self->_year;
}

- (int64_t)month
{
  return self->_month;
}

- (int64_t)day
{
  return self->_day;
}

+ (id)dateFromICSUTF8String:(const char *)a3
{
  if (a3)
  {
    size_t v4 = strlen(a3);
    id v5 = 0;
    int v6 = 0;
    int v7 = 0;
    switch(v4)
    {
      case 6uLL:
        goto LABEL_5;
      case 7uLL:
        if (a3[6] != 90) {
          goto LABEL_16;
        }
        int v7 = 1;
LABEL_5:
        uint64_t v22 = 0;
        uint64_t v23 = 0;
        uint64_t v21 = 0;
        if (sscanf(a3, "%02d%02d%02d", &v22, (char *)&v21 + 4, &v21) != 3) {
          goto LABEL_16;
        }
        if (v7) {
          uint64_t v8 = ICSDateTimeUTCValue;
        }
        else {
          uint64_t v8 = ICSDateTimeValue;
        }
        id v12 = [v8 alloc];
        uint64_t v14 = SHIDWORD(v21);
        uint64_t v13 = (int)v22;
        uint64_t v15 = (int)v21;
        uint64_t v16 = 0;
        uint64_t v17 = 0;
        uint64_t v18 = 0;
        goto LABEL_21;
      case 8uLL:
        uint64_t v22 = 0;
        uint64_t v23 = 0;
        uint64_t v21 = 0;
        if (sscanf(a3, "%04d%02d%02d", (char *)&v23 + 4, &v23, (char *)&v22 + 4) != 3) {
          goto LABEL_16;
        }
        uint64_t v9 = [ICSDateValue alloc];
        id v5 = [(ICSDateValue *)v9 initWithYear:SHIDWORD(v23) month:(int)v23 day:SHIDWORD(v22)];
        break;
      case 0xFuLL:
        goto LABEL_12;
      case 0x10uLL:
        if (a3[15] != 90) {
          goto LABEL_16;
        }
        int v6 = 1;
LABEL_12:
        uint64_t v22 = 0;
        uint64_t v23 = 0;
        uint64_t v21 = 0;
        char v20 = 0;
        int v10 = sscanf(a3, "%04d%02d%02d%c%02d%02d%02d", (char *)&v23 + 4, &v23, (char *)&v22 + 4, &v20, &v22, (char *)&v21 + 4, &v21);
        id v5 = 0;
        if (v10 != 7 || v20 != 84) {
          break;
        }
        if (v6) {
          int64_t v11 = ICSDateTimeUTCValue;
        }
        else {
          int64_t v11 = ICSDateTimeValue;
        }
        id v12 = [v11 alloc];
        uint64_t v17 = (int)v23;
        uint64_t v16 = SHIDWORD(v23);
        uint64_t v13 = (int)v22;
        uint64_t v18 = SHIDWORD(v22);
        uint64_t v15 = (int)v21;
        uint64_t v14 = SHIDWORD(v21);
LABEL_21:
        id v5 = (ICSDateValue *)[v12 initWithYear:v16 month:v17 day:v18 hour:v13 minute:v14 second:v15];
        break;
      default:
        break;
    }
  }
  else
  {
LABEL_16:
    id v5 = 0;
  }
  return v5;
}

- (int)dateType
{
  return 5006;
}

@end