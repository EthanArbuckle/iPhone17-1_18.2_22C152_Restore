@interface ICMediaTime
- (BOOL)isEqualToMediaTime:(id)a3;
- (BOOL)isNegative;
- (BOOL)isZero;
- (ICMediaTime)initWithCMTime:(id *)a3;
- (ICMediaTime)initWithSeconds:(double)a3;
- (ICMediaTime)initWithSeconds:(double)a3 ignoreFractionalSeconds:(BOOL)a4;
- (NSString)durationDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (unsigned)centiseconds;
- (unsigned)days;
- (unsigned)hours;
- (unsigned)minutes;
- (unsigned)seconds;
- (void)setCentiseconds:(unsigned __int8)a3;
- (void)setDays:(unsigned __int8)a3;
- (void)setHours:(unsigned __int8)a3;
- (void)setMinutes:(unsigned __int8)a3;
- (void)setNegative:(BOOL)a3;
- (void)setSeconds:(unsigned __int8)a3;
@end

@implementation ICMediaTime

- (ICMediaTime)initWithCMTime:(id *)a3
{
  CMTime v4 = *(CMTime *)a3;
  return [(ICMediaTime *)self initWithSeconds:CMTimeGetSeconds(&v4)];
}

- (ICMediaTime)initWithSeconds:(double)a3
{
  return [(ICMediaTime *)self initWithSeconds:1 ignoreFractionalSeconds:a3];
}

- (ICMediaTime)initWithSeconds:(double)a3 ignoreFractionalSeconds:(BOOL)a4
{
  v14.receiver = self;
  v14.super_class = (Class)ICMediaTime;
  v6 = [(ICMediaTime *)&v14 init];
  v8 = v6;
  if (v6)
  {
    if (a3 < 0.0)
    {
      [(ICMediaTime *)v6 setNegative:1];
      a3 = -a3;
    }
    if (a3 >= 86400.0)
    {
      double v9 = a3 / 86400.0;
      a3 = a3 - floor(a3 / 86400.0) * 86400.0;
      LODWORD(v7) = vcvtmd_s64_f64(v9);
      [(ICMediaTime *)v8 setDays:v7];
    }
    if (a3 >= 3600.0)
    {
      double v10 = a3 / 3600.0;
      a3 = a3 - floor(a3 / 3600.0) * 3600.0;
      LODWORD(v7) = vcvtmd_s64_f64(v10);
      [(ICMediaTime *)v8 setHours:v7];
    }
    if (a3 >= 60.0)
    {
      double v11 = a3 / 60.0;
      a3 = a3 - floor(a3 / 60.0) * 60.0;
      LODWORD(v7) = vcvtmd_s64_f64(v11);
      [(ICMediaTime *)v8 setMinutes:v7];
    }
    LODWORD(v7) = vcvtmd_s64_f64(a3);
    [(ICMediaTime *)v8 setSeconds:v7];
    if (a4) {
      uint64_t v12 = 0;
    }
    else {
      LODWORD(v12) = vcvtmd_s64_f64((a3 - (double)[(ICMediaTime *)v8 seconds]) * 100.0);
    }
    [(ICMediaTime *)v8 setCentiseconds:v12];
  }
  return v8;
}

- (BOOL)isZero
{
  return ![(ICMediaTime *)self days]
      && ![(ICMediaTime *)self hours]
      && ![(ICMediaTime *)self minutes]
      && ![(ICMediaTime *)self seconds]
      && [(ICMediaTime *)self centiseconds] == 0;
}

- (BOOL)isEqualToMediaTime:(id)a3
{
  id v4 = a3;
  int v5 = [(ICMediaTime *)self days];
  if (v5 == [v4 days]
    && (int v6 = -[ICMediaTime hours](self, "hours"), v6 == [v4 days])
    && (int v7 = -[ICMediaTime minutes](self, "minutes"), v7 == [v4 minutes])
    && (int v8 = -[ICMediaTime seconds](self, "seconds"), v8 == [v4 seconds]))
  {
    int v9 = [(ICMediaTime *)self centiseconds];
    BOOL v10 = v9 == [v4 centiseconds];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[ICMediaTime allocWithZone:a3] init];
  [(ICMediaTime *)v4 setDays:[(ICMediaTime *)self days]];
  [(ICMediaTime *)v4 setHours:[(ICMediaTime *)self hours]];
  [(ICMediaTime *)v4 setMinutes:[(ICMediaTime *)self minutes]];
  [(ICMediaTime *)v4 setSeconds:[(ICMediaTime *)self seconds]];
  [(ICMediaTime *)v4 setCentiseconds:[(ICMediaTime *)self centiseconds]];
  return v4;
}

- (NSString)durationDescription
{
  if ([(ICMediaTime *)self isZero])
  {
    v3 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"zero seconds" value:@"zero seconds" table:0 allowSiri:1];
  }
  else
  {
    if ([(ICMediaTime *)self days])
    {
      id v4 = NSString;
      int v5 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"%d days" value:@"%d days" table:0 allowSiri:1];
      int v6 = objc_msgSend(v4, "localizedStringWithFormat:", v5, -[ICMediaTime days](self, "days"));
    }
    else
    {
      int v6 = 0;
    }
    if ([(ICMediaTime *)self hours])
    {
      int v7 = NSString;
      int v8 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"%d hours" value:@"%d hours" table:0 allowSiri:1];
      int v9 = objc_msgSend(v7, "localizedStringWithFormat:", v8, -[ICMediaTime hours](self, "hours"));
    }
    else
    {
      int v9 = 0;
    }
    if ([(ICMediaTime *)self minutes])
    {
      BOOL v10 = NSString;
      double v11 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"%d minutes" value:@"%d minutes" table:0 allowSiri:1];
      uint64_t v12 = objc_msgSend(v10, "localizedStringWithFormat:", v11, -[ICMediaTime minutes](self, "minutes"));
    }
    else
    {
      uint64_t v12 = 0;
    }
    if ([(ICMediaTime *)self centiseconds] || [(ICMediaTime *)self seconds])
    {
      if ([(ICMediaTime *)self centiseconds])
      {
        float v19 = (float)[(ICMediaTime *)self seconds];
        double v20 = (float)((float)((float)[(ICMediaTime *)self centiseconds] / 100.0) + v19);
        if (!__accessibilityCentisecondsNumberFormatter)
        {
          id v21 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
          v22 = (void *)__accessibilityCentisecondsNumberFormatter;
          __accessibilityCentisecondsNumberFormatter = (uint64_t)v21;

          [(id)__accessibilityCentisecondsNumberFormatter setMaximumFractionDigits:2];
        }
        v23 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"%1$@ %2$f formatted fractional seconds" value:@"%1$@ %2$f formatted fractional seconds" table:0 allowSiri:1];
        v24 = NSString;
        v25 = (void *)__accessibilityCentisecondsNumberFormatter;
        v26 = [NSNumber numberWithDouble:v20];
        v27 = [v25 stringFromNumber:v26];
        v28 = objc_msgSend(v24, "localizedStringWithFormat:", v23, v27, *(void *)&v20);
      }
      else
      {
        v29 = NSString;
        v23 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"%d seconds" value:@"%d seconds" table:0 allowSiri:1];
        v28 = objc_msgSend(v29, "localizedStringWithFormat:", v23, -[ICMediaTime seconds](self, "seconds"));
      }
    }
    else
    {
      v28 = 0;
    }
    v3 = __ICAccessibilityStringForVariables(0, v6, v13, v14, v15, v16, v17, v18, (uint64_t)v9);
  }
  return (NSString *)v3;
}

- (unsigned)days
{
  return self->_days;
}

- (void)setDays:(unsigned __int8)a3
{
  self->_days = a3;
}

- (unsigned)hours
{
  return self->_hours;
}

- (void)setHours:(unsigned __int8)a3
{
  self->_hours = a3;
}

- (unsigned)minutes
{
  return self->_minutes;
}

- (void)setMinutes:(unsigned __int8)a3
{
  self->_minutes = a3;
}

- (unsigned)seconds
{
  return self->_seconds;
}

- (void)setSeconds:(unsigned __int8)a3
{
  self->_seconds = a3;
}

- (unsigned)centiseconds
{
  return self->_centiseconds;
}

- (void)setCentiseconds:(unsigned __int8)a3
{
  self->_centiseconds = a3;
}

- (BOOL)isNegative
{
  return self->_negative;
}

- (void)setNegative:(BOOL)a3
{
  self->_negative = a3;
}

@end