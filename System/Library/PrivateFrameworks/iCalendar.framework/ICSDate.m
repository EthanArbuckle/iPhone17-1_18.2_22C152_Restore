@interface ICSDate
- (BOOL)hasFloatingTimeZone;
- (BOOL)hasTimeComponent;
- (ICSDate)initWithValue:(id)a3;
- (ICSDate)initWithYear:(int64_t)a3 month:(int64_t)a4 day:(int64_t)a5;
- (ICSDate)initWithYear:(int64_t)a3 month:(int64_t)a4 day:(int64_t)a5 hour:(int64_t)a6 minute:(int64_t)a7 second:(int64_t)a8;
- (ICSDate)initWithYear:(int64_t)a3 month:(int64_t)a4 day:(int64_t)a5 hour:(int64_t)a6 minute:(int64_t)a7 second:(int64_t)a8 timeZone:(id)a9;
- (NSString)tzid;
- (id)components;
- (id)description;
- (void)setTzid:(id)a3;
@end

@implementation ICSDate

- (ICSDate)initWithValue:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ICSDate;
  v5 = -[ICSProperty initWithValue:type:](&v7, sel_initWithValue_type_, v4, (int)[v4 dateType]);

  return v5;
}

- (ICSDate)initWithYear:(int64_t)a3 month:(int64_t)a4 day:(int64_t)a5
{
  v6 = [[ICSDateValue alloc] initWithYear:a3 month:a4 day:a5];
  v10.receiver = self;
  v10.super_class = (Class)ICSDate;
  objc_super v7 = [(ICSProperty *)&v10 initWithValue:v6 type:5006];
  v8 = v7;
  if (v7) {
    [(ICSProperty *)v7 setParameterValue:@"DATE" forName:@"VALUE"];
  }

  return v8;
}

- (ICSDate)initWithYear:(int64_t)a3 month:(int64_t)a4 day:(int64_t)a5 hour:(int64_t)a6 minute:(int64_t)a7 second:(int64_t)a8
{
  return [(ICSDate *)self initWithYear:a3 month:a4 day:a5 hour:a6 minute:a7 second:a8 timeZone:0];
}

- (ICSDate)initWithYear:(int64_t)a3 month:(int64_t)a4 day:(int64_t)a5 hour:(int64_t)a6 minute:(int64_t)a7 second:(int64_t)a8 timeZone:(id)a9
{
  id v15 = a9;
  v16 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"GMT"];
  if ([v15 isEqualToTimeZone:v16])
  {
    v17 = (objc_class *)objc_opt_class();
  }
  else
  {
    v18 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
    [v15 isEqualToTimeZone:v18];
    v17 = (objc_class *)objc_opt_class();
  }
  v19 = self;

  v20 = (void *)[[v17 alloc] initWithYear:a3 month:a4 day:a5 hour:a6 minute:a7 second:a8];
  v21 = [(ICSProperty *)v19 initWithValue:v20 type:5016];
  if (v21)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v22 = [v15 name];
      [(ICSDate *)v21 setTzid:v22];
    }
  }

  return v21;
}

- (void)setTzid:(id)a3
{
}

- (NSString)tzid
{
  return (NSString *)[(ICSProperty *)self parameterValueForName:@"TZID"];
}

- (id)components
{
  v2 = [(ICSProperty *)self value];
  v3 = [v2 components];

  return v3;
}

- (BOOL)hasTimeComponent
{
  v2 = [(ICSProperty *)self value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)hasFloatingTimeZone
{
  v3 = [(ICSDate *)self tzid];
  if (v3)
  {
    char v4 = 0;
  }
  else
  {
    v5 = [(ICSProperty *)self value];
    objc_opt_class();
    char v4 = objc_opt_isKindOfClass() ^ 1;
  }
  return v4 & 1;
}

- (id)description
{
  v3 = [(ICSDate *)self tzid];

  if (v3)
  {
    char v4 = NSString;
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    objc_super v7 = [(ICSProperty *)self stringValue];
    v8 = [(ICSDate *)self tzid];
    v9 = [v4 stringWithFormat:@"<%@ %p - %@ (%@)>", v6, self, v7, v8];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)ICSDate;
    v9 = [(ICSProperty *)&v11 description];
  }
  return v9;
}

@end