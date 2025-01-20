@interface NEKOccurrenceCacheDumper
- (id)runForNow;
- (id)runFrom:(id)a3 to:(id)a4;
@end

@implementation NEKOccurrenceCacheDumper

- (id)runFrom:(id)a3 to:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(NEKPBOccurrenceCache);
  [v6 timeIntervalSinceReferenceDate];
  double v9 = v8;

  [(NEKPBOccurrenceCache *)v7 setStart:v9];
  [v5 timeIntervalSinceReferenceDate];
  double v11 = v10;

  [(NEKPBOccurrenceCache *)v7 setEnd:v11];
  v12 = [[NDTSQFile alloc] initWithPath:@"/var/mobile/Library/Calendar/Calendar.sqlitedb" queue:0 readOnly:1];
  if (v12)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000369A8;
    v14[3] = &unk_1000A8F88;
    v15 = v7;
    [(NDTSQFile *)v12 parseSql:@"select I.unique_identifier, C.external_id calendar, O.occurrence_date occurrence_date from occurrencecache O left join calendar C on C.rowid = O.calendar_id left join calendaritem I on I.rowid = O.event_id where I.entity_type = 2 and O.occurrence_date >= ?  and O.occurrence_date <= ? and C.flags & 786432 == 0 order by occurrence_date, I.unique_identifier" andRun:v14];
  }

  return v7;
}

- (id)runForNow
{
  v3 = +[NSDate date];
  v4 = [v3 dateByAddingTimeInterval:-21600.0];
  id v5 = [v3 dateByAddingTimeInterval:864000.0];
  id v6 = [(NEKOccurrenceCacheDumper *)self runFrom:v4 to:v5];

  return v6;
}

@end