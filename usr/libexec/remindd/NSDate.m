@interface NSDate
- (BOOL)ic_isEarlierThanDate:(id)a3;
- (BOOL)ic_isLaterThanDate:(id)a3;
- (BOOL)ic_isToday;
- (BOOL)ic_isYesterday;
- (NSString)ic_briefFormattedDate;
- (NSString)ic_localDateWithSeconds;
- (NSString)ic_shortFormattedDate;
- (id)jsonify;
@end

@implementation NSDate

- (BOOL)ic_isToday
{
  v3 = +[NSCalendar currentCalendar];
  v4 = [v3 components:28 fromDate:self];
  v5 = [v3 dateFromComponents:v4];
  v6 = +[NSDate date];
  v7 = [v3 components:28 fromDate:v6];

  v8 = [v3 dateFromComponents:v7];
  unsigned __int8 v9 = [v5 isEqualToDate:v8];

  return v9;
}

- (BOOL)ic_isYesterday
{
  v3 = +[NSCalendar currentCalendar];
  v4 = [v3 components:28 fromDate:self];
  v5 = [v3 dateFromComponents:v4];
  id v6 = objc_alloc_init((Class)NSDateComponents);
  [v6 setDay:-1];
  v7 = +[NSDate date];
  v8 = [v3 dateByAddingComponents:v6 toDate:v7 options:0];

  unsigned __int8 v9 = [v3 components:28 fromDate:v8];
  v10 = [v3 dateFromComponents:v9];

  LOBYTE(v8) = [v5 isEqualToDate:v10];
  return (char)v8;
}

- (NSString)ic_localDateWithSeconds
{
  if (qword_100922928 != -1) {
    dispatch_once(&qword_100922928, &stru_1008AF9A8);
  }
  v3 = (void *)qword_100922920;

  return (NSString *)[v3 stringFromDate:self];
}

- (NSString)ic_shortFormattedDate
{
  if ([(NSDate *)self ic_isToday] || [(NSDate *)self ic_isYesterday])
  {
    if (qword_100922938 != -1) {
      dispatch_once(&qword_100922938, &stru_1008AF9C8);
    }
    v3 = &qword_100922930;
  }
  else
  {
    if (qword_100922948 != -1) {
      dispatch_once(&qword_100922948, &stru_1008AF9E8);
    }
    v3 = &qword_100922940;
  }
  v4 = [(id)*v3 stringFromDate:self];

  return (NSString *)v4;
}

- (NSString)ic_briefFormattedDate
{
  v2 = self;
  v3 = +[NSDate distantFuture];
  unsigned int v4 = [(NSDate *)v2 isEqual:v3];

  if (v4)
  {
    uint64_t v5 = +[NSDate date];

    v2 = (NSDate *)v5;
  }
  if ([(NSDate *)v2 ic_isToday])
  {
    if (qword_100922958 != -1) {
      dispatch_once(&qword_100922958, &stru_1008AFA08);
    }
    id v6 = [(id)qword_100922950 stringFromDate:v2];
  }
  else
  {
    v7 = +[NSCalendar currentCalendar];
    v8 = +[NSDate date];
    unsigned __int8 v9 = [v7 components:28 fromDate:v8];

    v10 = [v7 dateFromComponents:v9];
    v11 = [v7 dateByAddingUnit:16 value:-1 toDate:v10 options:0];
    v12 = [v7 dateByAddingUnit:0x2000 value:-1 toDate:v10 options:0];
    if ((id)[(NSDate *)v2 compare:v11] == (id)1 || (id)[(NSDate *)v2 compare:v12] != (id)1)
    {
      if (qword_100922978 != -1) {
        dispatch_once(&qword_100922978, &stru_1008AFA48);
      }
      v13 = &qword_100922970;
    }
    else
    {
      if (qword_100922968 != -1) {
        dispatch_once(&qword_100922968, &stru_1008AFA28);
      }
      v13 = &qword_100922960;
    }
    id v6 = [(id)*v13 stringFromDate:v2];
  }

  return (NSString *)v6;
}

- (BOOL)ic_isEarlierThanDate:(id)a3
{
  return [(NSDate *)self compare:a3] == NSOrderedAscending;
}

- (BOOL)ic_isLaterThanDate:(id)a3
{
  return (id)[(NSDate *)self compare:a3] == (id)1;
}

- (id)jsonify
{
  uint64_t v2 = qword_100907550;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  id result = [(id)qword_100942248 stringFromDate:v3];
  if (result)
  {
    id v5 = result;

    return v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

@end