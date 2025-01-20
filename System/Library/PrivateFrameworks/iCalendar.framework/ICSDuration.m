@interface ICSDuration
+ (BOOL)supportsSecureCoding;
+ (id)durationFromICSString:(id)a3;
+ (id)durationFromRFC2445UTF8String:(const char *)a3;
+ (id)generateDurationFromICSString:(id)a3;
- (BOOL)isNegative;
- (ICSDuration)initWithCoder:(id)a3;
- (ICSDuration)initWithWeeks:(int64_t)a3 days:(int64_t)a4 hours:(int64_t)a5 minutes:(int64_t)a6 seconds:(int64_t)a7;
- (double)timeInterval;
- (id)ICSStringWithOptions:(unint64_t)a3;
- (int64_t)days;
- (int64_t)hours;
- (int64_t)minutes;
- (int64_t)seconds;
- (int64_t)weeks;
- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ICSDuration

- (ICSDuration)initWithWeeks:(int64_t)a3 days:(int64_t)a4 hours:(int64_t)a5 minutes:(int64_t)a6 seconds:(int64_t)a7
{
  v13.receiver = self;
  v13.super_class = (Class)ICSDuration;
  result = [(ICSDuration *)&v13 init];
  if (result) {
    result->_duration = (double)(604800 * a3 + 86400 * a4 + 3600 * a5 + 60 * a6 + a7);
  }
  return result;
}

- (double)timeInterval
{
  return self->_duration;
}

- (int64_t)weeks
{
  return (uint64_t)self->_duration / 604800;
}

- (int64_t)days
{
  return (int)(uint64_t)self->_duration % 604800 / 86400;
}

- (int64_t)hours
{
  return (int)(uint64_t)self->_duration % 86400 / 3600;
}

- (int64_t)minutes
{
  return (int)(((__int16)((34953 * ((int)(uint64_t)self->_duration % 3600)) >> 16) >> 5)
             + ((((int)(uint64_t)self->_duration % 3600
                + ((-30583 * ((int)(uint64_t)self->_duration % 3600)) >> 16)) & 0x8000) >> 15));
}

- (int64_t)seconds
{
  return (uint64_t)self->_duration % 60;
}

- (BOOL)isNegative
{
  return self->_duration < 0.0;
}

+ (id)generateDurationFromICSString:(id)a3
{
  return +[ICSDuration durationFromICSString:a3];
}

- (id)ICSStringWithOptions:(unint64_t)a3
{
  v5 = objc_alloc_init(ICSStringWriter);
  [(ICSDuration *)self _ICSStringWithOptions:a3 appendingToString:v5];
  v6 = [(ICSStringWriter *)v5 result];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (ICSDuration)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICSDuration;
  v5 = [(ICSDuration *)&v8 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"Duration"];
    v5->_duration = v6;
  }

  return v5;
}

- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4
{
  id v17 = a4;
  if ([(ICSDuration *)self isNegative]) {
    [v17 appendString:@"-"];
  }
  [v17 appendString:@"P"];
  uint64_t v5 = [(ICSDuration *)self weeks];
  int64_t v6 = [(ICSDuration *)self days];
  uint64_t v7 = [(ICSDuration *)self hours];
  uint64_t v8 = [(ICSDuration *)self minutes];
  int64_t v9 = [(ICSDuration *)self seconds];
  uint64_t v10 = v9;
  if (!v5 || v6 || v7 || v8 || v9)
  {
    uint64_t v5 = v6 - v5 + 8 * v5;
    if (!v5) {
      goto LABEL_15;
    }
    v11 = @"%ldD";
  }
  else
  {
    v11 = @"%ldW";
  }
  if (v5 >= 0) {
    uint64_t v12 = v5;
  }
  else {
    uint64_t v12 = -v5;
  }
  objc_msgSend(v17, "appendFormat:", v11, v12);
LABEL_15:
  if (v7 || v8 || v10)
  {
    [v17 appendString:@"T"];
    if (v7)
    {
      if (v7 >= 0) {
        uint64_t v13 = v7;
      }
      else {
        uint64_t v13 = -v7;
      }
      objc_msgSend(v17, "appendFormat:", @"%ldH", v13);
    }
    if (v8)
    {
      if (v8 >= 0) {
        uint64_t v14 = v8;
      }
      else {
        uint64_t v14 = -v8;
      }
      objc_msgSend(v17, "appendFormat:", @"%ldM", v14);
    }
    if (v10)
    {
      if (v10 >= 0) {
        uint64_t v15 = v10;
      }
      else {
        uint64_t v15 = -v10;
      }
      objc_msgSend(v17, "appendFormat:", @"%ldS", v15);
    }
  }
  [(ICSDuration *)self timeInterval];
  if (fabs(v16) < 2.22044605e-16) {
    [v17 appendString:@"T0S"];
  }
}

+ (id)durationFromRFC2445UTF8String:(const char *)a3
{
  if (!a3)
  {
    int64_t v6 = 0;
    return v6;
  }
  int v4 = *(unsigned __int8 *)a3;
  if (v4 == 45)
  {
    int v5 = -1;
  }
  else
  {
    int v5 = 1;
    if (v4 != 43) {
      goto LABEL_10;
    }
  }
  int v8 = *(unsigned __int8 *)++a3;
  int v4 = v8;
LABEL_10:
  if (v4 == 80)
  {
    int v9 = -1;
    while (2)
    {
      int v10 = -1;
      while (1)
      {
        uint64_t v12 = a3 + 1;
        int v11 = *((unsigned __int8 *)a3 + 1);
        if (!a3[1] || v11 == 84)
        {
          uint64_t v17 = 1;
          if (v11 == 84)
          {
            uint64_t v17 = 2;
            uint64_t v12 = a3 + 2;
          }
          unsigned __int8 v18 = a3[v17];
          if (v18)
          {
            int v19 = -1;
            int v20 = -1;
            int v21 = -1;
            while ((v18 - 58) >= 0xF6u)
            {
              int v22 = 0;
              ++v12;
              do
              {
                int v22 = 10 * v22 + v18 - 48;
                int v24 = *v12++;
                int v23 = v24;
                unsigned __int8 v18 = v24;
              }
              while ((v24 - 48) < 0xA);
              if (!v23) {
                break;
              }
              if (v23 == 83)
              {
                if (v19 != -1) {
                  goto LABEL_55;
                }
              }
              else
              {
                if (v23 == 77)
                {
                  int64_t v6 = 0;
                  if (v20 != -1 || v19 != -1) {
                    goto LABEL_56;
                  }
                  int v20 = v22;
                }
                else
                {
                  if (v23 != 72) {
                    goto LABEL_55;
                  }
                  int64_t v6 = 0;
                  if (v21 != -1 || v20 != -1 || v19 != -1) {
                    goto LABEL_56;
                  }
                  int v20 = -1;
                  int v21 = v22;
                }
                int v22 = -1;
              }
              unsigned __int8 v18 = *v12;
              int v19 = v22;
              if (!*v12) {
                goto LABEL_50;
              }
            }
          }
          else
          {
            int v21 = -1;
            int v20 = -1;
            int v22 = -1;
LABEL_50:
            if (v9 != -1 || v10 != -1 || v21 != -1 || v20 != -1 || v22 != -1)
            {
              if (v9 == -1) {
                int v25 = 0;
              }
              else {
                int v25 = v9;
              }
              if (v10 == -1) {
                int v26 = 0;
              }
              else {
                int v26 = v10;
              }
              if (v21 == -1) {
                int v27 = 0;
              }
              else {
                int v27 = v21;
              }
              if (v20 == -1) {
                int v28 = 0;
              }
              else {
                int v28 = v20;
              }
              if (v22 == -1) {
                int v29 = 0;
              }
              else {
                int v29 = v22;
              }
              int64_t v6 = [[ICSDuration alloc] initWithWeeks:v25 * v5 days:v26 * v5 hours:v27 * v5 minutes:v28 * v5 seconds:v29 * v5];
              goto LABEL_56;
            }
          }
          goto LABEL_55;
        }
        if ((v11 - 58) < 0xF6u) {
          goto LABEL_55;
        }
        int v13 = 0;
        ++a3;
        do
        {
          int v13 = 10 * v13 + v11 - 48;
          int v15 = *++a3;
          int v14 = v15;
          LOBYTE(v11) = v15;
        }
        while ((v15 - 48) < 0xA);
        if (!v14) {
          goto LABEL_55;
        }
        if (v14 != 68) {
          break;
        }
        BOOL v16 = v10 == -1;
        int v10 = v13;
        if (!v16) {
          goto LABEL_55;
        }
      }
      if (v14 != 87) {
        goto LABEL_55;
      }
      int64_t v6 = 0;
      if (v9 == -1)
      {
        int v9 = v13;
        if (v10 == -1) {
          continue;
        }
      }
      break;
    }
  }
  else
  {
LABEL_55:
    int64_t v6 = 0;
  }
LABEL_56:
  return v6;
}

+ (id)durationFromICSString:(id)a3
{
  uint64_t v3 = [a3 UTF8String];
  return +[ICSDuration durationFromRFC2445UTF8String:v3];
}

@end