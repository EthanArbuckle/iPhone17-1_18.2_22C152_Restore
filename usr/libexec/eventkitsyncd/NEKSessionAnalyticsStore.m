@interface NEKSessionAnalyticsStore
- (id)instanceName;
- (int)_currentHour;
- (int64_t)currentVersion;
- (void)_writeTally:(NEKAnalyticsTally *)a3;
- (void)clearHour:(int)a3;
- (void)countSessionType:(int)a3;
- (void)createTables;
- (void)fetchHourlyTallies:(NEKAnalyticsTally *)a3 hour:(int)a4;
@end

@implementation NEKSessionAnalyticsStore

- (void)createTables
{
}

- (int64_t)currentVersion
{
  return 1;
}

- (id)instanceName
{
  return @"analytics";
}

- (int)_currentHour
{
  id v2 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  v3 = +[NSTimeZone systemTimeZone];
  [v2 setTimeZone:v3];

  v4 = +[NSDate date];
  uint64_t v5 = (uint64_t)[v2 component:32 fromDate:v4];

  if ((v5 & (unint64_t)~(v5 >> 63)) >= 0x17) {
    LODWORD(v6) = 23;
  }
  else {
    uint64_t v6 = v5 & ~(v5 >> 63);
  }

  return v6;
}

- (void)_writeTally:(NEKAnalyticsTally *)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000276BC;
  v3[3] = &unk_1000A9288;
  v3[4] = a3;
  [(NDTSQSchema *)self parseSql:@"INSERT OR REPLACE INTO analytics (deltas, resets, failures, hour) values (?,?,?,?)" andRun:v3];
}

- (void)countSessionType:(int)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  [(NEKSessionAnalyticsStore *)self fetchHourlyTallies:&v7 hour:[(NEKSessionAnalyticsStore *)self _currentHour]];
  switch(a3)
  {
    case 3:
      uint64_t v5 = (char *)&v8 + 4;
      goto LABEL_7;
    case 2:
      uint64_t v5 = (char *)&v8;
      goto LABEL_7;
    case 1:
      uint64_t v5 = (char *)&v7 + 4;
LABEL_7:
      ++*(_DWORD *)v5;
      [(NEKSessionAnalyticsStore *)self _writeTally:&v7];
      return;
  }
  uint64_t v6 = *(NSObject **)(qword_1000C6CB8 + 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received weird session type: %d", buf, 8u);
  }
}

- (void)fetchHourlyTallies:(NEKAnalyticsTally *)a3 hour:(int)a4
{
  a3->var0 = a4;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000278E4;
  v4[3] = &unk_1000A92A8;
  int v5 = a4;
  v4[4] = a3;
  [(NDTSQSchema *)self parseSql:@"SELECT deltas, resets, failures FROM analytics WHERE hour = ?" andRun:v4];
}

- (void)clearHour:(int)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000279E0;
  v3[3] = &unk_1000A92C8;
  int v4 = a3;
  [(NDTSQSchema *)self parseSql:@"DELETE FROM analytics WHERE hour = ?" andRun:v3];
}

@end