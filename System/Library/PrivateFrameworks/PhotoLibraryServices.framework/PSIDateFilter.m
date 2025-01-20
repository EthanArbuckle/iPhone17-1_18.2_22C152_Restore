@interface PSIDateFilter
- (BOOL)isEqual:(id)a3;
- (NSString)displayString;
- (PSIDate)endDate;
- (PSIDate)singleDate;
- (PSIDate)startDate;
- (PSIDateFilter)initWithEndDateComponents:(id)a3;
- (PSIDateFilter)initWithSingleDate:(id)a3;
- (PSIDateFilter)initWithSingleDateComponents:(id)a3;
- (PSIDateFilter)initWithStartDate:(id)a3 endDate:(id)a4;
- (PSIDateFilter)initWithStartDateComponents:(id)a3;
- (PSIDateFilter)initWithStartDateComponents:(id)a3 endDateComponents:(id)a4;
- (id)description;
- (int64_t)int64RepresentationMask;
- (void)setDisplayString:(id)a3;
@end

@implementation PSIDateFilter

- (PSIDateFilter)initWithStartDate:(id)a3 endDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PSIDateFilter;
  v9 = [(PSIDateFilter *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_startDate, a3);
    objc_storeStrong((id *)&v10->_endDate, a4);
  }

  return v10;
}

- (PSIDate)startDate
{
  return (PSIDate *)objc_getProperty(self, a2, 16, 1);
}

- (PSIDate)endDate
{
  return (PSIDate *)objc_getProperty(self, a2, 24, 1);
}

- (PSIDate)singleDate
{
  return (PSIDate *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_singleDate, 0);
}

- (void)setDisplayString:(id)a3
{
}

- (NSString)displayString
{
  return self->_displayString;
}

- (id)description
{
  singleDate = self->_singleDate;
  if (singleDate) {
    [NSString stringWithFormat:@"displayString: '%@'. Date: %@", self->_displayString, singleDate, v5];
  }
  else {
  v3 = [NSString stringWithFormat:@"displayString: '%@'. Start: %@. End: %@", self->_displayString, self->_startDate, self->_endDate];
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PSIDateFilter *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v4 == self)
    {
      BOOL v6 = 1;
    }
    else
    {
      int64_t v5 = [(PSIDateFilter *)self int64RepresentationMask];
      BOOL v6 = v5 == [(PSIDateFilter *)v4 int64RepresentationMask];
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (int64_t)int64RepresentationMask
{
  singleDate = self->_singleDate;
  if (singleDate)
  {
    return [(PSIDate *)singleDate int64RepresentationMask];
  }
  else
  {
    int64_t v5 = [(PSIDate *)self->_startDate int64RepresentationMask];
    return [(PSIDate *)self->_endDate int64RepresentationMask] | v5;
  }
}

- (PSIDateFilter)initWithSingleDate:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PSIDateFilter;
  BOOL v6 = [(PSIDateFilter *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_singleDate, a3);
  }

  return v7;
}

- (PSIDateFilter)initWithStartDateComponents:(id)a3 endDateComponents:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PSIDateFilter;
  id v8 = [(PSIDateFilter *)&v17 init];
  objc_super v9 = v8;
  if (v8)
  {
    if (v6)
    {
      v10 = [[PSIDate alloc] initWithDateComponents:v6];
      p_startDate = &v9->_startDate;
      startDate = v9->_startDate;
      v9->_startDate = v10;
    }
    else
    {
      p_startDate = &v8->_startDate;
      startDate = v8->_startDate;
      v8->_startDate = 0;
    }

    if (v7)
    {
      v13 = [[PSIDate alloc] initWithDateComponents:v7];
      p_endDate = &v9->_endDate;
      endDate = v9->_endDate;
      v9->_endDate = v13;
    }
    else
    {
      p_endDate = &v9->_endDate;
      endDate = v9->_endDate;
      v9->_endDate = 0;
    }
    if ((endDate, v6) && !*p_startDate || v7 && !*p_endDate)
    {

      objc_super v9 = 0;
    }
  }

  return v9;
}

- (PSIDateFilter)initWithEndDateComponents:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PSIDateFilter;
  id v5 = [(PSIDateFilter *)&v11 init];
  if (v5)
  {
    uint64_t v6 = +[PSIDate distantPast];
    startDate = v5->_startDate;
    v5->_startDate = (PSIDate *)v6;

    id v8 = [[PSIDate alloc] initWithDateComponents:v4];
    endDate = v5->_endDate;
    v5->_endDate = v8;

    if (!v5->_endDate)
    {

      id v5 = 0;
    }
  }

  return v5;
}

- (PSIDateFilter)initWithStartDateComponents:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PSIDateFilter;
  id v5 = [(PSIDateFilter *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [[PSIDate alloc] initWithDateComponents:v4];
    startDate = v5->_startDate;
    v5->_startDate = v6;

    uint64_t v8 = +[PSIDate distantFuture];
    endDate = v5->_endDate;
    v5->_endDate = (PSIDate *)v8;

    if (!v5->_startDate)
    {

      id v5 = 0;
    }
  }

  return v5;
}

- (PSIDateFilter)initWithSingleDateComponents:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PSIDateFilter;
  id v5 = [(PSIDateFilter *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [[PSIDate alloc] initWithDateComponents:v4];
    singleDate = v5->_singleDate;
    v5->_singleDate = v6;

    if (!v5->_singleDate)
    {

      id v5 = 0;
    }
  }

  return v5;
}

@end