@interface SOSIntervalEvent
- (BOOL)checkDate;
- (NSString)dateDescription;
- (NSUserDefaults)defaults;
- (SOSIntervalEvent)initWithDefaults:(id)a3 dateDescription:(id)a4 earliest:(double)a5 latest:(double)a6;
- (double)earliestDate;
- (double)latestDate;
- (id)getDate;
- (void)followup;
- (void)schedule;
- (void)setDateDescription:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setEarliestDate:(double)a3;
- (void)setLatestDate:(double)a3;
@end

@implementation SOSIntervalEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateDescription, 0);

  objc_storeStrong((id *)&self->_defaults, 0);
}

- (void)setLatestDate:(double)a3
{
  self->_latestDate = a3;
}

- (double)latestDate
{
  return self->_latestDate;
}

- (void)setEarliestDate:(double)a3
{
  self->_earliestDate = a3;
}

- (double)earliestDate
{
  return self->_earliestDate;
}

- (void)setDateDescription:(id)a3
{
}

- (NSString)dateDescription
{
  return self->_dateDescription;
}

- (void)setDefaults:(id)a3
{
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (SOSIntervalEvent)initWithDefaults:(id)a3 dateDescription:(id)a4 earliest:(double)a5 latest:(double)a6
{
  id v11 = a3;
  id v12 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SOSIntervalEvent;
  v13 = [(SOSIntervalEvent *)&v19 init];
  v14 = v13;
  if (v13)
  {
    p_defaults = (void **)&v13->_defaults;
    objc_storeStrong((id *)&v13->_defaults, a3);
    if (!v14->_defaults)
    {
      id v16 = objc_alloc_init((Class)NSUserDefaults);
      v17 = *p_defaults;
      *p_defaults = v16;
    }
    objc_storeStrong((id *)&v14->_dateDescription, a4);
    v14->_earliestDate = a5;
    v14->_latestDate = a6;
    [(SOSIntervalEvent *)v14 schedule];
  }

  return v14;
}

- (void)schedule
{
  v3 = [(SOSIntervalEvent *)self getDate];
  if (!v3)
  {
    [(SOSIntervalEvent *)self followup];
    v3 = 0;
  }
}

- (void)followup
{
  SOSCreateRandomDateBetweenNowPlus();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(NSUserDefaults *)self->_defaults setValue:v3 forKey:self->_dateDescription];
}

- (BOOL)checkDate
{
  v2 = [(SOSIntervalEvent *)self getDate];
  id v3 = v2;
  BOOL v5 = 0;
  if (v2)
  {
    [v2 timeIntervalSinceNow];
    if (v4 <= 0.0) {
      BOOL v5 = 1;
    }
  }

  return v5;
}

- (id)getDate
{
  return [(NSUserDefaults *)self->_defaults valueForKey:self->_dateDescription];
}

@end