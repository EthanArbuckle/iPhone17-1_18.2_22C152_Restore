@interface PKDateComponentsRangeFormatter
- (BOOL)_areHoursDefinedInDateComponentsRange:(id)a3;
- (BOOL)_isSameDayInDateComponentsRange:(id)a3;
- (BOOL)_isSameEraInDateComponentsRange:(id)a3 currentDateComponents:(id)a4;
- (BOOL)_isSameYearInDateComponentsRange:(id)a3 currentDateComponents:(id)a4;
- (NSDateIntervalFormatter)dateIntervalFormatter;
- (id)_currentDateComponents;
- (id)_formatForDateComponentsRange:(id)a3;
- (id)stringFromDateComponentsRange:(id)a3;
- (int64_t)_resolvedEraFromEra:(int64_t)a3 currentEra:(int64_t)a4;
- (void)setDateIntervalFormatter:(id)a3;
@end

@implementation PKDateComponentsRangeFormatter

- (id)stringFromDateComponentsRange:(id)a3
{
  id v4 = a3;
  dateIntervalFormatter = self->_dateIntervalFormatter;
  if (!dateIntervalFormatter)
  {
    v6 = (NSDateIntervalFormatter *)objc_alloc_init(MEMORY[0x1E4F28C20]);
    v7 = self->_dateIntervalFormatter;
    self->_dateIntervalFormatter = v6;

    dateIntervalFormatter = self->_dateIntervalFormatter;
  }
  v8 = [(PKDateComponentsRangeFormatter *)self _formatForDateComponentsRange:v4];
  [(NSDateIntervalFormatter *)dateIntervalFormatter setDateTemplate:v8];

  v9 = self->_dateIntervalFormatter;
  v10 = [v4 startDateComponents];
  v11 = [v10 calendar];
  if (v11)
  {
    [(NSDateIntervalFormatter *)v9 setCalendar:v11];
  }
  else
  {
    v12 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    [(NSDateIntervalFormatter *)v9 setCalendar:v12];
  }
  v13 = self->_dateIntervalFormatter;
  v14 = [v4 dateInterval];
  v15 = [(NSDateIntervalFormatter *)v13 stringFromDateInterval:v14];

  return v15;
}

- (id)_formatForDateComponentsRange:(id)a3
{
  id v4 = a3;
  v5 = [(PKDateComponentsRangeFormatter *)self _currentDateComponents];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"MMM d"];
  if ([(PKDateComponentsRangeFormatter *)self _isSameDayInDateComponentsRange:v4]) {
    BOOL v7 = [(PKDateComponentsRangeFormatter *)self _areHoursDefinedInDateComponentsRange:v4];
  }
  else {
    BOOL v7 = 0;
  }
  if (!-[PKDateComponentsRangeFormatter _isSameYearInDateComponentsRange:currentDateComponents:](self, "_isSameYearInDateComponentsRange:currentDateComponents:", v4, v5))[v6 appendString:@" yyyy"]; {
  if (!-[PKDateComponentsRangeFormatter _isSameEraInDateComponentsRange:currentDateComponents:](self, "_isSameEraInDateComponentsRange:currentDateComponents:", v4, v5))[v6 appendString:@" G"];
  }
  if (v7) {
    [v6 appendString:@" HH:mm"];
  }

  return v6;
}

- (id)_currentDateComponents
{
  v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v3 = [MEMORY[0x1E4F1C9C8] date];
  id v4 = [v2 components:94 fromDate:v3];

  return v4;
}

- (BOOL)_areHoursDefinedInDateComponentsRange:(id)a3
{
  id v3 = a3;
  id v4 = [v3 startDateComponents];
  if ([v4 hour] == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v5 = 0;
  }
  else
  {
    v6 = [v3 endDateComponents];
    BOOL v5 = [v6 hour] != 0x7FFFFFFFFFFFFFFFLL;
  }
  return v5;
}

- (BOOL)_isSameDayInDateComponentsRange:(id)a3
{
  id v3 = a3;
  id v4 = [v3 startDateComponents];
  uint64_t v5 = [v4 day];
  v6 = [v3 endDateComponents];
  if (v5 == [v6 day])
  {
    BOOL v7 = [v3 startDateComponents];
    uint64_t v8 = [v7 month];
    v9 = [v3 endDateComponents];
    if (v8 == [v9 month])
    {
      v10 = [v3 startDateComponents];
      uint64_t v11 = [v10 year];
      v12 = [v3 endDateComponents];
      if (v11 == [v12 year])
      {
        v13 = [v3 startDateComponents];
        uint64_t v14 = [v13 era];
        v15 = [v3 endDateComponents];
        BOOL v16 = v14 == [v15 era];
      }
      else
      {
        BOOL v16 = 0;
      }
    }
    else
    {
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)_isSameYearInDateComponentsRange:(id)a3 currentDateComponents:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 startDateComponents];
  uint64_t v9 = [v8 year];
  v10 = [v6 endDateComponents];
  if (v9 == [v10 year])
  {
    uint64_t v11 = [v6 startDateComponents];
    uint64_t v12 = [v11 year];
    BOOL v13 = v12 == [v7 year]
       && [(PKDateComponentsRangeFormatter *)self _isSameEraInDateComponentsRange:v6 currentDateComponents:v7];
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)_isSameEraInDateComponentsRange:(id)a3 currentDateComponents:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 startDateComponents];
  int64_t v9 = -[PKDateComponentsRangeFormatter _resolvedEraFromEra:currentEra:](self, "_resolvedEraFromEra:currentEra:", [v8 era], objc_msgSend(v6, "era"));

  v10 = [v7 endDateComponents];

  int64_t v11 = -[PKDateComponentsRangeFormatter _resolvedEraFromEra:currentEra:](self, "_resolvedEraFromEra:currentEra:", [v10 era], objc_msgSend(v6, "era"));
  BOOL v12 = v9 == v11 && v9 == [v6 era];

  return v12;
}

- (int64_t)_resolvedEraFromEra:(int64_t)a3 currentEra:(int64_t)a4
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    return a4;
  }
  else {
    return a3;
  }
}

- (NSDateIntervalFormatter)dateIntervalFormatter
{
  return self->_dateIntervalFormatter;
}

- (void)setDateIntervalFormatter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end