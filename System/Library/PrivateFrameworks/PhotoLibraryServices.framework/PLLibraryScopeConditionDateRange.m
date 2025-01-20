@interface PLLibraryScopeConditionDateRange
+ (BOOL)supportsQueryKey:(int)a3;
+ (id)conditionWithSingleQueries:(id)a3 criteria:(unsigned __int8)a4;
- (NSDate)endDate;
- (NSDate)startDate;
- (id)conditionQuery;
- (id)description;
- (unsigned)type;
- (void)setEndDate:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation PLLibraryScopeConditionDateRange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

- (void)setEndDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v3 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
  v4 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)PLLibraryScopeConditionDateRange;
  v5 = [(PLLibraryScopeCondition *)&v10 description];
  v6 = [v3 stringFromDate:self->_startDate];
  v7 = [v3 stringFromDate:self->_endDate];
  v8 = [v4 stringWithFormat:@"%@, Start date: %@, End date: %@", v5, v6, v7];

  return v8;
}

- (id)conditionQuery
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F8B9A8]) initWithConjunction:0];
  [v3 addDateRangeQueryKey:200 between:self->_startDate and:self->_endDate];
  v4 = [v3 query];

  return v4;
}

- (unsigned)type
{
  return 1;
}

+ (BOOL)supportsQueryKey:(int)a3
{
  return a3 == 200;
}

+ (id)conditionWithSingleQueries:(id)a3 criteria:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithCriteria:v4];
  v8 = [v6 firstObject];

  v9 = [v8 dateValue];
  [v7 setStartDate:v9];

  objc_super v10 = [v8 secondDateValue];
  [v7 setEndDate:v10];

  return v7;
}

@end