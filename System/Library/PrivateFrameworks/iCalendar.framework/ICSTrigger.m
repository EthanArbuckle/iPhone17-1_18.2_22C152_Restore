@interface ICSTrigger
- (BOOL)isDurationBased;
- (ICSTrigger)initWithDate:(id)a3;
- (ICSTrigger)initWithDuration:(id)a3;
- (ICSTrigger)initWithDuration:(id)a3 travelRelativeDuration:(id)a4;
- (id)travelRelativeDuration;
- (void)fixAlarmTrigger;
- (void)setDate:(id)a3;
- (void)setDuration:(id)a3;
@end

@implementation ICSTrigger

- (void)fixAlarmTrigger
{
  v3 = [(ICSProperty *)self parameterValueForName:@"RELATED"];

  if (v3)
  {
    v4 = [(ICSProperty *)self parameterValueForName:@"RELATED"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      [(ICSProperty *)self removeParameterValueForName:@"RELATED"];
    }
  }
}

- (ICSTrigger)initWithDate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICSTrigger;
  v5 = [(ICSTrigger *)&v8 init];
  v6 = v5;
  if (v5) {
    [(ICSTrigger *)v5 setDate:v4];
  }

  return v6;
}

- (ICSTrigger)initWithDuration:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICSTrigger;
  v5 = [(ICSTrigger *)&v8 init];
  v6 = v5;
  if (v5) {
    [(ICSTrigger *)v5 setDuration:v4];
  }

  return v6;
}

- (BOOL)isDurationBased
{
  return [(ICSProperty *)self type] == 5011;
}

- (ICSTrigger)initWithDuration:(id)a3 travelRelativeDuration:(id)a4
{
  id v6 = a4;
  v7 = [(ICSTrigger *)self initWithDuration:a3];
  [(ICSProperty *)v7 setParameterValue:v6 forName:@"X-APPLE-RELATED-TRAVEL"];

  return v7;
}

- (id)travelRelativeDuration
{
  return [(ICSProperty *)self parameterValueForName:@"X-APPLE-RELATED-TRAVEL"];
}

- (void)setDate:(id)a3
{
  id v4 = a3;
  -[ICSProperty setValue:type:](self, "setValue:type:", v4, (int)[v4 dateType]);

  [(ICSProperty *)self setParameterValue:@"DATE-TIME" forName:@"VALUE"];
  [(ICSProperty *)self removeParameterValueForName:@"RELATED"];
}

- (void)setDuration:(id)a3
{
  [(ICSProperty *)self setValue:a3 type:5011];
  [(ICSProperty *)self removeParameterValueForName:@"VALUE"];
}

@end