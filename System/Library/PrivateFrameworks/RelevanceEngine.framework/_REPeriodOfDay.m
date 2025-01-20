@interface _REPeriodOfDay
- (BOOL)isEqual:(id)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDateInterval)interval;
- (_REPeriodOfDay)initWithInterval:(id)a3 periodOfDay:(unint64_t)a4;
- (unint64_t)hash;
- (unint64_t)periodOfDay;
@end

@implementation _REPeriodOfDay

- (_REPeriodOfDay)initWithInterval:(id)a3 periodOfDay:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_REPeriodOfDay;
  v7 = [(_REPeriodOfDay *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    interval = v7->_interval;
    v7->_interval = (NSDateInterval *)v8;

    v7->_periodOfDay = a4;
  }

  return v7;
}

- (unint64_t)hash
{
  return self->_periodOfDay ^ [(NSDateInterval *)self->_interval hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (id *)v4;
    interval = self->_interval;
    v7 = (NSDateInterval *)v5[2];
    if (interval == v7)
    {
    }
    else
    {
      uint64_t v8 = v7;
      v9 = interval;
      int v10 = [(NSDateInterval *)v9 isEqual:v8];

      if (!v10)
      {
        BOOL v11 = 0;
LABEL_8:

        goto LABEL_9;
      }
    }
    BOOL v11 = self->_periodOfDay == (void)v5[1];
    goto LABEL_8;
  }
  BOOL v11 = 0;
LABEL_9:

  return v11;
}

- (NSDate)startDate
{
  return [(NSDateInterval *)self->_interval startDate];
}

- (NSDate)endDate
{
  return [(NSDateInterval *)self->_interval endDate];
}

- (unint64_t)periodOfDay
{
  return self->_periodOfDay;
}

- (NSDateInterval)interval
{
  return self->_interval;
}

- (void).cxx_destruct
{
}

@end