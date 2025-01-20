@interface NEKDiagnosticResult
- (NEKDiagnosticResult)initWithFirstFoundKey:(id)a3;
- (NSDateFormatter)dateFormatter;
- (NSString)firstFoundKey;
- (double)firstFoundTimestamp;
- (double)lastDiagnosticTimestamp;
- (double)updateFirstFoundToNotSetOrNewTimestamp:(double)a3 ifConditionMet:(BOOL)a4;
- (id)formattedFirstFoundDate;
- (id)formattedLastDiagnosticDate;
- (id)syncReport;
- (void)setDateFormatter:(id)a3;
- (void)setFirstFoundKey:(id)a3;
- (void)setFirstFoundTimestamp:(double)a3;
- (void)setLastDiagnosticTimestamp:(double)a3;
@end

@implementation NEKDiagnosticResult

- (NEKDiagnosticResult)initWithFirstFoundKey:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NEKDiagnosticResult;
  v6 = [(NEKDiagnosticResult *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_firstFoundKey, a3);
    v8 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
    dateFormatter = v7->_dateFormatter;
    v7->_dateFormatter = v8;

    v10 = v7->_dateFormatter;
    v11 = +[NSCalendar currentCalendar];
    [(NSDateFormatter *)v10 setCalendar:v11];

    [(NSDateFormatter *)v7->_dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss ZZZZZ"];
  }

  return v7;
}

- (double)updateFirstFoundToNotSetOrNewTimestamp:(double)a3 ifConditionMet:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = +[NEKEnvironment instance];
  v8 = [v7 tinyStore];

  if (v4)
  {
    [v8 getDoubleValueForKey:self->_firstFoundKey default:*(double *)&qword_1000C6598];
    if (v9 == *(double *)&qword_1000C6598) {
      [v8 setDoubleValue:self->_firstFoundKey forKey:a3];
    }
    else {
      a3 = v9;
    }
  }
  else
  {
    [v8 setDoubleValue:self->_firstFoundKey forKey:*(double *)&qword_1000C6598];
    a3 = *(double *)&qword_1000C6598;
  }

  return a3;
}

- (id)formattedFirstFoundDate
{
  v3 = +[NSDate dateWithTimeIntervalSinceReferenceDate:self->_firstFoundTimestamp];
  BOOL v4 = [(NSDateFormatter *)self->_dateFormatter stringFromDate:v3];

  return v4;
}

- (id)formattedLastDiagnosticDate
{
  v3 = +[NSDate dateWithTimeIntervalSinceReferenceDate:self->_lastDiagnosticTimestamp];
  BOOL v4 = [(NSDateFormatter *)self->_dateFormatter stringFromDate:v3];

  return v4;
}

- (id)syncReport
{
  return &__NSDictionary0__struct;
}

- (NSString)firstFoundKey
{
  return self->_firstFoundKey;
}

- (void)setFirstFoundKey:(id)a3
{
}

- (double)lastDiagnosticTimestamp
{
  return self->_lastDiagnosticTimestamp;
}

- (void)setLastDiagnosticTimestamp:(double)a3
{
  self->_lastDiagnosticTimestamp = a3;
}

- (double)firstFoundTimestamp
{
  return self->_firstFoundTimestamp;
}

- (void)setFirstFoundTimestamp:(double)a3
{
  self->_firstFoundTimestamp = a3;
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (void)setDateFormatter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);

  objc_storeStrong((id *)&self->_firstFoundKey, 0);
}

@end